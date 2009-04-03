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
    raise "Error logging into Pingdom.  Got status code #{result.status}." unless result.status == 0

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
    raise "Error retrieving downtime list.  Got status code #{result.status}." unless result.status == 0

    return result.downtimesArray
  end
end
