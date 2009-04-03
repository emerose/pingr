$: << File.dirname(__FILE__)
require 'PingdomAPIDriver'

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

  def downtimes(check, from, to)
    request            = Report_GetDowntimesRequest.new
    request.checkName  = check
    request.from       = from
    request.to         = to
    request.resolution = Report_ResolutionEnum::DAILY

    result = @driver.report_getDowntimes(@api_key, session, request)
		check_result(result)

    return result.downtimesArray
  end

	class PingdomException               < RuntimeError     ; end
	class PingdomArgumentException       < PingdomException ; end
	class PingdomInternalErrorException  < PingdomException ; end
	class PingdomIdentifcationException  < PingdomException ; end
	class PingdomAuthorizationException  < PingdomException ; end
	class PingdomAuthenticationException < PingdomException ; end

	def check_result(result)
		case result.status
		when 0: return
		when 1: raise PingdomException(                "Something strange happened (1)")
		when 2: raise PingdomException(                "Something strange happened (2)")
		when 3: raise PingdomArgumentException(        "One or more arguments was invalid")
		when 4: raise PingdomInternalErrorException(   "Pingdom reported an internal error")
		when 5: raise PingdomIdenficationException(    "Wrong Identification: your API key is wrong")
		when 6: raise PingdomAuthorizationException(   "Wrong Authorization: you don't have the privileges to call this function")
		when 7: raise PingdomAuthenticationException(  "Wrong Authentication: your username or password is wrong.")
		end
	end
end
