#!/usr/bin/env ruby
$:.unshift(File.dirname(__FILE__) + '/../lib') unless $:.include?(File.dirname(__FILE__) + '/../lib')

require 'simplecov_setup'
require 'cucumber/rspec/disable_option_parser'
require 'cucumber/cli/main'
require 'stringio'

$new_stdout = StringIO.new
$new_stderr = StringIO.new
$cucumber = Cucumber::Cli::Main.new(ARGV.dup, out=$new_stdout, err=$new_stderr)
$runtime = Cucumber::Runtime.new(Cucumber::Configuration.default)

$cucumber.execute!($runtime)
