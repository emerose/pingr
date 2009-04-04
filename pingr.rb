#!/usr/bin/env ruby
#

require 'rubygems'
require 'yaml'
gem 'soap4r'
require 'lib/pingdom'

CREDS = YAML.load_file("creds.yml")

p = Pingdom.new(CREDS[:username], CREDS[:password], CREDS[:api_key])

#p.enable_debugging

p.downtimes("Accounts Index", "01/01/2009", "04/25/2009").each do |d|
  puts [d.from, d.to, d.duration].join("\t")
end
