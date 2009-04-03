#!/usr/bin/env ruby
#

require 'rubygems'
gem 'soap4r'
require 'PingdomAPIDriver'
require 'yaml'

CREDS = YAML.load_file("creds.yml")
API_KEY = CREDS[:api_key]

creds = Auth_CredentialsData.new
creds.username = CREDS[:username]
creds.password = CREDS[:password]

pingdom = PingdomAPISoapPort.new

pingdom.wiredump_dev = STDERR

res = pingdom.auth_login(API_KEY, creds)
raise "#{res}" unless res.status == 0
session = res.sessionId

#START_DATE = DateTime.parse('08/13/2007')
START_DATE = DateTime.parse('08/14/2008')
END_DATE = DateTime.parse('08/16/2008')
downsreq = Report_GetDowntimesRequest.new
downsreq.checkName = 'Accounts Index'
downsreq.from = START_DATE
downsreq.to = END_DATE
downsreq.resolution = Report_ResolutionEnum::DAILY

res = pingdom.report_getDowntimes(API_KEY, session, downsreq)
pp res
