require 'yaml'
require 'lib/pingdom'

class Pingr < Thor
	def initialize(args, options, config)
	  super(args, options, config)
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
			puts [format_time(r.from), format_time(r.to), r.duration].join("\t")
		end
	end

  desc "responsetimes", "Daily summary of response times"
  method_options :check => :required, :from => :required, :to => :required, :debug => :boolean
	def responsetimes
		@p.enable_debugging if options[:debug]

		res = @p.responsetime_summary(options[:check], options[:from], options[:to])
		puts ["FROM", "TO", "RESPONSE TIME"].join("\t")
		res.each do |r|
			puts [format_time(r.from), format_time(r.to), r.response_time].join("\t")
		end
	end

  desc "outages", "Listing of all outages"
  method_options :check => :required, :from => :required, :to => :required, :debug => :boolean
	def outages
		@p.enable_debugging if options[:debug]

		res = @p.outages(options[:check], options[:from], options[:to])
		puts ["FROM", "TO", "DURATION"].join("\t")
		res.each do |r|
			puts [format_time(r.from), format_time(r.to), r.to-r.from].join("\t")
		end
	end

  desc "raw", "Raw check data"
  method_options :check => :required, :from => :required, :to => :required, :debug => :boolean
	def raw
		@p.enable_debugging if options[:debug]

		res = @p.raw_data(options[:check], options[:from], options[:to])
		puts ["TIME", "STATE", "RESPONSE TIME", "LOCATION"].join("\t")
		res.each do |r|
			puts [format_time(r.time), r.state, r.response_time, r.location].join("\t")
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
			puts [r.name, r.state, format_time(r.time)].join("\t")
		end
	end

	desc "last", "Last outage"
	method_options :debug => :boolean
	def last
		@p.enable_debugging if options[:debug]

		res = @p.last_outages
		puts ["CHECK", "LAST OUTAGE"].join("\t")
		res.each do |r|
			puts [r.name, format_time(r.time)].join("\t")
		end
	end

  no_tasks {
    def format_time(t)
      t.getlocal.strftime("%Y-%m-%d %H:%M:%S")
    end
  }
end
