#!/usr/bin/env ruby
#

require 'rubygems'
gem 'soap4r'
require 'PingdomAPIDriver'

load File.join(File.dirname(__FILE__), "creds.rb")

creds = Auth_CredentialsData.new
creds.username = USERNAME
creds.password = PASSWORD

pingdom = PingdomAPISoapPort.new
res = pingdom.auth_login(API_KEY, creds)
raise "#{res}" unless res.status == 0
session = res.sessionId
res = pingdom.test_echo("HI")
puts res.outString
