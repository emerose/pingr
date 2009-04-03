#!/usr/bin/env ruby
require 'PingdomAPIDriver.rb'

endpoint_url = ARGV.shift
obj = PingdomAPISoapPort.new(endpoint_url)

# run ruby with -d to see SOAP wiredumps.
obj.wiredump_dev = STDERR if $DEBUG

# SYNOPSIS
#   Test_echo(inString)
#
# ARGS
#   inString        C_String - {http://www.w3.org/2001/XMLSchema}string
#
# RETURNS
#   v_return        Test_EchoResponse - {urn:PingdomAPI}Test_EchoResponse
#
inString = nil
puts obj.test_echo(inString)

# SYNOPSIS
#   Auth_login(aPIKey, credentialsData)
#
# ARGS
#   aPIKey          C_String - {http://www.w3.org/2001/XMLSchema}string
#   credentialsData Auth_CredentialsData - {urn:PingdomAPI}Auth_CredentialsData
#
# RETURNS
#   v_return        Auth_LoginResponse - {urn:PingdomAPI}Auth_LoginResponse
#
aPIKey = credentialsData = nil
puts obj.auth_login(aPIKey, credentialsData)

# SYNOPSIS
#   Auth_logout(aPIKey, sessionId)
#
# ARGS
#   aPIKey          C_String - {http://www.w3.org/2001/XMLSchema}string
#   sessionId       C_String - {http://www.w3.org/2001/XMLSchema}string
#
# RETURNS
#   v_return        Auth_LogoutResponse - {urn:PingdomAPI}Auth_LogoutResponse
#
aPIKey = sessionId = nil
puts obj.auth_logout(aPIKey, sessionId)

# SYNOPSIS
#   Check_getList(aPIKey, sessionId)
#
# ARGS
#   aPIKey          C_String - {http://www.w3.org/2001/XMLSchema}string
#   sessionId       C_String - {http://www.w3.org/2001/XMLSchema}string
#
# RETURNS
#   v_return        Check_GetListResponse - {urn:PingdomAPI}Check_GetListResponse
#
aPIKey = sessionId = nil
puts obj.check_getList(aPIKey, sessionId)

# SYNOPSIS
#   Check_getCheckIdsByNames(aPIKey, sessionId, getCheckIdsByNamesRequest)
#
# ARGS
#   aPIKey          C_String - {http://www.w3.org/2001/XMLSchema}string
#   sessionId       C_String - {http://www.w3.org/2001/XMLSchema}string
#   getCheckIdsByNamesRequest Check_GetCheckIdsByNamesRequest - {urn:PingdomAPI}Check_GetCheckIdsByNamesRequest
#
# RETURNS
#   v_return        Check_GetCheckIdsByNamesResponse - {urn:PingdomAPI}Check_GetCheckIdsByNamesResponse
#
aPIKey = sessionId = getCheckIdsByNamesRequest = nil
puts obj.check_getCheckIdsByNames(aPIKey, sessionId, getCheckIdsByNamesRequest)

# SYNOPSIS
#   Report_getLastDowns(aPIKey, sessionId)
#
# ARGS
#   aPIKey          C_String - {http://www.w3.org/2001/XMLSchema}string
#   sessionId       C_String - {http://www.w3.org/2001/XMLSchema}string
#
# RETURNS
#   v_return        Report_GetLastDownsResponse - {urn:PingdomAPI}Report_GetLastDownsResponse
#
aPIKey = sessionId = nil
puts obj.report_getLastDowns(aPIKey, sessionId)

# SYNOPSIS
#   Report_getCurrentStates(aPIKey, sessionId)
#
# ARGS
#   aPIKey          C_String - {http://www.w3.org/2001/XMLSchema}string
#   sessionId       C_String - {http://www.w3.org/2001/XMLSchema}string
#
# RETURNS
#   v_return        Report_GetCurrentStatesResponse - {urn:PingdomAPI}Report_GetCurrentStatesResponse
#
aPIKey = sessionId = nil
puts obj.report_getCurrentStates(aPIKey, sessionId)

# SYNOPSIS
#   Report_getDowntimes(aPIKey, sessionId, getDowntimesRequest)
#
# ARGS
#   aPIKey          C_String - {http://www.w3.org/2001/XMLSchema}string
#   sessionId       C_String - {http://www.w3.org/2001/XMLSchema}string
#   getDowntimesRequest Report_GetDowntimesRequest - {urn:PingdomAPI}Report_GetDowntimesRequest
#
# RETURNS
#   v_return        Report_GetDowntimesResponse - {urn:PingdomAPI}Report_GetDowntimesResponse
#
aPIKey = sessionId = getDowntimesRequest = nil
puts obj.report_getDowntimes(aPIKey, sessionId, getDowntimesRequest)

# SYNOPSIS
#   Report_getDowntimesExtended(aPIKey, sessionId, getDowntimesRequest)
#
# ARGS
#   aPIKey          C_String - {http://www.w3.org/2001/XMLSchema}string
#   sessionId       C_String - {http://www.w3.org/2001/XMLSchema}string
#   getDowntimesRequest Report_GetDowntimesRequest - {urn:PingdomAPI}Report_GetDowntimesRequest
#
# RETURNS
#   v_return        Report_GetDowntimesExtendedResponse - {urn:PingdomAPI}Report_GetDowntimesExtendedResponse
#
aPIKey = sessionId = getDowntimesRequest = nil
puts obj.report_getDowntimesExtended(aPIKey, sessionId, getDowntimesRequest)

# SYNOPSIS
#   Report_getOutages(aPIKey, sessionId, getOutagesRequest)
#
# ARGS
#   aPIKey          C_String - {http://www.w3.org/2001/XMLSchema}string
#   sessionId       C_String - {http://www.w3.org/2001/XMLSchema}string
#   getOutagesRequest Report_GetOutagesRequest - {urn:PingdomAPI}Report_GetOutagesRequest
#
# RETURNS
#   v_return        Report_GetOutagesResponse - {urn:PingdomAPI}Report_GetOutagesResponse
#
aPIKey = sessionId = getOutagesRequest = nil
puts obj.report_getOutages(aPIKey, sessionId, getOutagesRequest)

# SYNOPSIS
#   Report_getRawData(aPIKey, sessionId, getRawDataRequest)
#
# ARGS
#   aPIKey          C_String - {http://www.w3.org/2001/XMLSchema}string
#   sessionId       C_String - {http://www.w3.org/2001/XMLSchema}string
#   getRawDataRequest Report_GetRawDataRequest - {urn:PingdomAPI}Report_GetRawDataRequest
#
# RETURNS
#   v_return        Report_GetRawDataResponse - {urn:PingdomAPI}Report_GetRawDataResponse
#
aPIKey = sessionId = getRawDataRequest = nil
puts obj.report_getRawData(aPIKey, sessionId, getRawDataRequest)

# SYNOPSIS
#   Location_getList(aPIKey, sessionId)
#
# ARGS
#   aPIKey          C_String - {http://www.w3.org/2001/XMLSchema}string
#   sessionId       C_String - {http://www.w3.org/2001/XMLSchema}string
#
# RETURNS
#   v_return        Location_GetListResponse - {urn:PingdomAPI}Location_GetListResponse
#
aPIKey = sessionId = nil
puts obj.location_getList(aPIKey, sessionId)

# SYNOPSIS
#   Report_getResponseTimes(aPIKey, sessionId, getResponseTimesRequest)
#
# ARGS
#   aPIKey          C_String - {http://www.w3.org/2001/XMLSchema}string
#   sessionId       C_String - {http://www.w3.org/2001/XMLSchema}string
#   getResponseTimesRequest Report_GetResponseTimesRequest - {urn:PingdomAPI}Report_GetResponseTimesRequest
#
# RETURNS
#   v_return        Report_GetResponseTimesResponse - {urn:PingdomAPI}Report_GetResponseTimesResponse
#
aPIKey = sessionId = getResponseTimesRequest = nil
puts obj.report_getResponseTimes(aPIKey, sessionId, getResponseTimesRequest)

# SYNOPSIS
#   Report_getNotifications(aPIKey, sessionId, getNotificationsRequest)
#
# ARGS
#   aPIKey          C_String - {http://www.w3.org/2001/XMLSchema}string
#   sessionId       C_String - {http://www.w3.org/2001/XMLSchema}string
#   getNotificationsRequest Report_GetNotificationsRequest - {urn:PingdomAPI}Report_GetNotificationsRequest
#
# RETURNS
#   v_return        Report_GetNotificationsResponse - {urn:PingdomAPI}Report_GetNotificationsResponse
#
aPIKey = sessionId = getNotificationsRequest = nil
puts obj.report_getNotifications(aPIKey, sessionId, getNotificationsRequest)

# SYNOPSIS
#   createAccount(aPIKey, accountData, accountType)
#
# ARGS
#   aPIKey          C_String - {http://www.w3.org/2001/XMLSchema}string
#   accountData     AccountData - {urn:PingdomAPI}AccountData
#   accountType     AccountType - {urn:PingdomAPI}AccountType
#
# RETURNS
#   v_return        CreateAccountResponse - {urn:PingdomAPI}CreateAccountResponse
#
aPIKey = accountData = accountType = nil
puts obj.createAccount(aPIKey, accountData, accountType)


