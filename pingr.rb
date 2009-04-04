#!/usr/bin/env ruby
#

require 'rubygems'
require 'yaml'
gem 'soap4r'
require 'lib/pingdom'

CREDS = YAML.load_file("creds.yml")

p = Pingdom.new(CREDS[:username], CREDS[:password], CREDS[:api_key])

#p.enable_debugging

p.downtimes("Accounts Index", "01/01/2008", "02/01/2008").each do |d|
  puts [d.from, d.to, (d.to-d.from)*1440.to_f].join("\t")
end
