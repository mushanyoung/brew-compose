#!/usr/bin/env ruby

require 'optparse'
require 'yaml'

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: brew-compose [-f <arg>...] [options] [COMMAND]

Commands:
    list                             list all brew formulae in compose file
    install                          install formulaes according to compose file

Options:
    -h, --help                       print this help"

  opts.on("-f", "--file FILE", "specify an alternate compose file (default: ~/.brew-compose.yml)") do |v|
    options[:file] = v
  end
  opts.on("-v", "--verbose", "print verbose debugging information") do |v|
    options[:verbose] = v
  end
end.parse!

verbose = options[:verbose] || false
file    = options[:file] || "~/.brew-compose.yml"
commands = ARGV

p RUBY_VERSION
p file
p verbose
p commands

case commands[0]
when "list", "lis", "li", "l"
  output = YAML.load(File.read(File.expand_path(file)))
  p output['formulae'].keys.join(' ')
when "install", "instal", "insta", "inst", "ins", "in", "i"
  output = YAML.load(File.read(File.expand_path(file)))
  p %x[ brew install #{output['formulae'].keys.join(' ')} ]
else
  p "#{commands[0]} is not a recogized command"
end
