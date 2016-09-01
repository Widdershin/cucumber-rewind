require 'pry'
require 'stringio'

AfterStep do |scenario|
  @step ||= 0

  if @child_pid
    $stdout.puts($new_stderr.string)

    $new_stderr.truncate(0)
  end

  @child_pid = fork

  if @child_pid
    Process.wait(@child_pid)

    $runtime.support_code.step_definitions.clear
    $runtime.support_code.ruby.send(:invoked_step_definition_hash).clear
    $runtime.support_code.ruby.send(:available_step_definition_hash).clear

    $runtime.send(:load_step_definitions)
    $runtime.support_code.ruby.send(:extend_world)

    if $?.success?
    else
      $stdout.puts($new_stderr.string)

      binding.pry
    end
  end

  @step += 1
end

After do |scenario|
  if scenario.failed?
    $stdout.puts($new_stderr.string)
  end
end
