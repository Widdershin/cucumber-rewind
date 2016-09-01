require 'stringio'

stdout = StringIO.new

$stdout = stdout

puts "continued"

$stdout = STDOUT

STDOUT.puts(stdout.string)

