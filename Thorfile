require 'rubygems'
require 'yaml'
gem 'soap4r'
require 'lib/pingdom'
require 'thor/tasks'



class Default < Thor
	def initialize
		creds = YAML.load_file("creds.yml")
		@p = Pingdom.new(creds[:username], creds[:password], creds[:api_key])
	end
  
  desc "summary", "Daily summary of downtime"
  method_options :check => :required, :from => :required, :to => :required, :debug => :boolean
	def summary
		@p.enable_debugging if options[:debug]

		res = @p.downtime_summary(options[:check], options[:from], options[:to])
		puts ["FROM", "TO", "DURATION"].join("\t")
		res.each do |r|
			puts [r.from, r.to, r.duration].join("\t")
		end
	end

  desc "responsetimes", "Daily summary of response times"
  method_options :check => :required, :from => :required, :to => :required, :debug => :boolean
	def responsetimes
		@p.enable_debugging if options[:debug]

		res = @p.responsetime_summary(options[:check], options[:from], options[:to])
		puts ["FROM", "TO", "RESPONSE TIME"].join("\t")
		res.each do |r|
			puts [r.from, r.to, r.responseTime].join("\t")
		end
	end

  desc "downtimes", "Listing of all outages"
  method_options :check => :required, :from => :required, :to => :required, :debug => :boolean
	def downtimes
		@p.enable_debugging if options[:debug]

		res = @p.downtimes(options[:check], options[:from], options[:to])
		puts ["FROM", "TO"].join("\t")
		res.each do |r|
			puts [r.from, r.to].join("\t")
		end
	end

  desc "raw", "Raw check data"
  method_options :check => :required, :from => :required, :to => :required, :debug => :boolean
	def raw
		@p.enable_debugging if options[:debug]

		res = @p.raw_data(options[:check], options[:from], options[:to])
		puts ["TIME", "STATE", "RESPONSE TIME", "LOCATION"].join("\t")
		res.each do |r|
			puts [r.checkTime, r.checkState, r.responseTime, r.location].join("\t")
		end
	end

  desc "checks", "List check names"
  method_options :debug => :boolean
	def checks
		@p.enable_debugging if options[:debug]

		res = @p.checks
		puts "CHECKS"
		res.each {|r| puts r}
	end

  desc "locations", "List locations"
  method_options :debug => :boolean
	def locations
		@p.enable_debugging if options[:debug]

		res = @p.locations
		puts "LOCATIONS"
		res.each {|r| puts r}
	end

	desc "current", "Current check statuses"
  method_options :debug => :boolean
	def current
		@p.enable_debugging if options[:debug]

		res = @p.current_states
		puts ["CHECK", "STATE", "TIME"].join("\t")
		res.each do |r|
			puts [r.checkName, r.checkState, r.lastCheckTime].join("\t")
		end
	end

	desc "last", "Last outage"
	method_options :debug => :boolean
	def last
		@p.enable_debugging if options[:debug]

		res = @p.last_downtimes
		puts ["CHECK", "LAST OUTAGE"].join("\t")
		res.each do |r|
			puts [r.checkName, r.lastDown].join("\t")
		end
	end
end
