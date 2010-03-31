$: << File.dirname(__FILE__)
require 'rubygems'
gem 'soap4r'
require 'PingdomAPIDriver'
require 'datetime_ext'

class Pingdom
  def initialize(username, password, api_key)
    @username = username
    @password = password
    @api_key  = api_key

    @driver = PingdomAPISoapPort.new
  end

  def enable_debugging
    @driver.wiredump_dev = STDERR
  end

  def downtime_summary(check, from, to)
    from = date(from)
    to   = date(to)

    if (to-from) > 31
      newfrom = from + 31
      return downtime_summary(check, from, newfrom).concat(downtime_summary(check, newfrom, to))
    end

    request            = Report_GetDowntimesRequest.new
    request.checkName  = check
    request.from       = from
    request.to         = to
    request.resolution = Report_ResolutionEnum::DAILY

    result = @driver.report_getDowntimes(@api_key, session, request)
		check_result(result)

    return result.downtimesArray.collect { |d| Pingdom::Downtime.new(d) }
  end

  def responsetime_summary(check, from, to, resolution = Report_ResolutionEnum::DAILY, locs = nil)
    from  =  date(from)
    to    =  date(to)
    locs ||= locations  # the Pingdom API docs say that nil == all locations,
                        # but that doesn't actually seem to be true. not sure
                        # whose fault that is, but whatever...

    if (to-from) > 31
      newfrom = from + 31
      return responsetime_summary(check, from, newfrom, resolution, locs).concat(responsetime_summary(check, newfrom, to, resolution, locs))
    end

    request            = Report_GetResponseTimesRequest.new
    request.checkName  = check
    request.from       = from
    request.to         = to
    request.resolution = resolution
    request.locations  = locations if locations

    result = @driver.report_getResponseTimes(@api_key, session, request)
		check_result(result)

    return result.responseTimesArray.collect { |r| Pingdom::Responsetime.new(r) }
  end

  def outages(check, from, to, page=nil)
    from  =  date(from)
    to    =  date(to)
    page ||= 1

    if (to-from) > 31
      newfrom = from + 31
      return outages(check, from, newfrom).concat(outages(check, newfrom, to))
    end

    request                = Report_GetOutagesRequest.new
    request.checkName      = check
    request.from           = from
    request.to             = to
    request.resultsPerPage = 50
    request.pageNumber     = page

    result = @driver.report_getOutages(@api_key, session, request)
    check_result(result)

    if (result.outagesArray.length > 49)
      return result.outagesArray.concat(outages(check, from, to, page+1))
    else
      return result.outagesArray.collect { |o| Pingdom::Outage.new(o) }
    end
  end

  def raw_data(check, from, to, page=nil)
    from  =  date(from)
    to    =  date(to)
    page ||= 1

    if (to-from) > 31
      newfrom = from + 31
      return raw_data(check, from, newfrom).concat(raw_data(check, newfrom, to))
    end

    request                = Report_GetRawDataRequest.new
    request.checkName      = check
    request.from           = from
    request.to             = to
    request.resultsPerPage = 50
    request.pageNumber     = page

    result = @driver.report_getRawData(@api_key, session, request)
    check_result(result)

    if (result.rawDataArray.length > 49)
      return result.rawDataArray.collect { |r| Pingdom::CheckResult.new(r) }.concat(raw_data(check, from, to, page+1))
    else
      return result.rawDataArray.collect { |r| Pingdom::CheckResult.new(r) }
    end
  end

  def checks
    result = @driver.check_getList(@api_key, session)
    check_result(result)

    return result.checkNames
  end

  def locations
    result = @driver.location_getList(@api_key, session)
    check_result(result)

    return result.locationsArray
  end

  def current_states
    result = @driver.report_getCurrentStates(@api_key, session)
    check_result(result)

    return result.currentStates.collect { |r| Pingdom::Status.new(r) }
  end

  def last_outages
    result = @driver.report_getLastDowns(@api_key, session)
    check_result(result)

    return result.lastDowns.collect { |r| Pingdom::LastOutage.new(r) }
  end

	class PingdomException        < RuntimeError     ; end
	class ArgumentException       < PingdomException ; end
	class InternalErrorException  < PingdomException ; end
	class IdentifcationException  < PingdomException ; end
	class AuthorizationException  < PingdomException ; end
	class AuthenticationException < PingdomException ; end

  protected

  def session
    return @session if @session

    # no session yet -- gotta log in
    creds = Auth_CredentialsData.new
    creds.username = @username
    creds.password = @password

    result = @driver.auth_login(@api_key, creds)
		check_result(result)

    # if we got this far, we logged in ok.
    @session = result.sessionId
    return @session
  end

	def check_result(result)
		case result.status
		when 0: return
		when 1: raise PingdomException.new(         "Something strange happened (1)")
		when 2: raise PingdomException.new(         "Something strange happened (2)")
		when 3: raise ArgumentException.new(        "One or more arguments was invalid")
		when 4: raise InternalErrorException.new(   "Pingdom reported an internal error")
		when 5: raise IdenficationException.new(    "Wrong Identification: your API key is wrong")
		when 6: raise AuthorizationException.new(   "Wrong Authorization: you don't have the privileges to call this function")
		when 7: raise AuthenticationException.new(  "Wrong Authentication: your username or password is wrong.")
		end
	end

	def date(obj)
    case obj
    when DateTime: return obj
    when String:   return DateTime.parse(obj)
    when Time:     return DateTime.new(obj.year, obj.month, obj.day, obj.hour, obj.min, obj.sec + Rational(obj.usec, 10**6), Rational(obj.utc_offset, 60 * 60 * 24))
    when :now:     return DateTime.now
    else           raise  "Not sure how to turn #{obj} into a DateTime."
    end
	end

  class Downtime
    def initialize(obj)
      @from     = obj.from.to_time
      @to       = obj.to.to_time
      @duration = obj.duration
    end
    attr_reader :from, :to, :duration
  end

  class Responsetime
    def initialize(obj)
      @from          = obj.from.to_time
      @to            = obj.to.to_time
      @response_time = obj.responseTime
    end
    attr_reader :from, :to, :response_time
  end

  class Outage
    def initialize(obj)
      @from         = obj.from.to_time
      @to           = obj.to.to_time
    end
    attr_reader :from, :to
  end

  class CheckResult
    def initialize(obj)
      @time          = obj.checkTime.to_time
      @state         = obj.checkState
      @response_time = obj.responseTime
      @location      = obj.location
    end
    attr_reader :time, :state, :response_time, :location
  end

  class Status
    def initialize(obj)
      @name  = obj.checkName
      @state = obj.checkState
      @time  = obj.lastCheckTime.to_time
    end
    attr_reader :name, :state, :time
  end

  class LastOutage
    def initialize(obj)
      @name  = obj.checkName
      @time  = obj.lastDown.to_time
    end
    attr_reader :name, :time
  end
end
