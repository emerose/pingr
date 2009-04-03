require 'xsd/qname'

# {urn:PingdomAPI}Test_EchoResponse
#   status - SOAP::SOAPInt
#   outString - SOAP::SOAPString
class Test_EchoResponse
  attr_accessor :status
  attr_accessor :outString

  def initialize(status = nil, outString = nil)
    @status = status
    @outString = outString
  end
end

# {urn:PingdomAPI}Auth_CredentialsData
#   username - SOAP::SOAPString
#   password - SOAP::SOAPString
class Auth_CredentialsData
  attr_accessor :username
  attr_accessor :password

  def initialize(username = nil, password = nil)
    @username = username
    @password = password
  end
end

# {urn:PingdomAPI}Auth_LoginResponse
#   status - SOAP::SOAPInt
#   sessionId - SOAP::SOAPString
class Auth_LoginResponse
  attr_accessor :status
  attr_accessor :sessionId

  def initialize(status = nil, sessionId = nil)
    @status = status
    @sessionId = sessionId
  end
end

# {urn:PingdomAPI}Auth_LogoutResponse
#   status - SOAP::SOAPInt
class Auth_LogoutResponse
  attr_accessor :status

  def initialize(status = nil)
    @status = status
  end
end

# {urn:PingdomAPI}Check_GetListResponse
#   status - SOAP::SOAPInt
#   checkNames - Check_ListArray
class Check_GetListResponse
  attr_accessor :status
  attr_accessor :checkNames

  def initialize(status = nil, checkNames = nil)
    @status = status
    @checkNames = checkNames
  end
end

# {urn:PingdomAPI}Check_GetCheckIdsByNamesRequest
#   checkNames - Check_ListArray
class Check_GetCheckIdsByNamesRequest
  attr_accessor :checkNames

  def initialize(checkNames = nil)
    @checkNames = checkNames
  end
end

# {urn:PingdomAPI}Check_GetCheckIdsByNamesResponse
#   status - SOAP::SOAPInt
#   checkIds - Check_CheckIdsArray
class Check_GetCheckIdsByNamesResponse
  attr_accessor :status
  attr_accessor :checkIds

  def initialize(status = nil, checkIds = nil)
    @status = status
    @checkIds = checkIds
  end
end

# {urn:PingdomAPI}Report_GetLastDownsResponse
#   status - SOAP::SOAPInt
#   lastDowns - Report_LastDownsArray
class Report_GetLastDownsResponse
  attr_accessor :status
  attr_accessor :lastDowns

  def initialize(status = nil, lastDowns = nil)
    @status = status
    @lastDowns = lastDowns
  end
end

# {urn:PingdomAPI}Report_LastDownEntry
#   checkName - SOAP::SOAPString
#   lastDown - SOAP::SOAPDateTime
class Report_LastDownEntry
  attr_accessor :checkName
  attr_accessor :lastDown

  def initialize(checkName = nil, lastDown = nil)
    @checkName = checkName
    @lastDown = lastDown
  end
end

# {urn:PingdomAPI}Report_GetCurrentStatesResponse
#   status - SOAP::SOAPInt
#   currentStates - Report_CurrentStatesArray
class Report_GetCurrentStatesResponse
  attr_accessor :status
  attr_accessor :currentStates

  def initialize(status = nil, currentStates = nil)
    @status = status
    @currentStates = currentStates
  end
end

# {urn:PingdomAPI}Report_CheckStateEntry
#   checkName - SOAP::SOAPString
#   checkState - Report_CheckState
#   lastCheckTime - SOAP::SOAPDateTime
class Report_CheckStateEntry
  attr_accessor :checkName
  attr_accessor :checkState
  attr_accessor :lastCheckTime

  def initialize(checkName = nil, checkState = nil, lastCheckTime = nil)
    @checkName = checkName
    @checkState = checkState
    @lastCheckTime = lastCheckTime
  end
end

# {urn:PingdomAPI}Report_GetDowntimesRequest
#   from - SOAP::SOAPDateTime
#   to - SOAP::SOAPDateTime
#   resolution - Report_ResolutionEnum
#   checkName - SOAP::SOAPString
class Report_GetDowntimesRequest
  attr_accessor :from
  attr_accessor :to
  attr_accessor :resolution
  attr_accessor :checkName

  def initialize(from = nil, to = nil, resolution = nil, checkName = nil)
    @from = from
    @to = to
    @resolution = resolution
    @checkName = checkName
  end
end

# {urn:PingdomAPI}Report_GetResponseTimesRequest
#   from - SOAP::SOAPDateTime
#   to - SOAP::SOAPDateTime
#   resolution - Report_ResolutionEnum
#   checkName - SOAP::SOAPString
#   locations - Location_ListArray
class Report_GetResponseTimesRequest
  attr_accessor :from
  attr_accessor :to
  attr_accessor :resolution
  attr_accessor :checkName
  attr_accessor :locations

  def initialize(from = nil, to = nil, resolution = nil, checkName = nil, locations = nil)
    @from = from
    @to = to
    @resolution = resolution
    @checkName = checkName
    @locations = locations
  end
end

# {urn:PingdomAPI}Report_GetNotificationsRequest
#   checkNames - Report_checkNamesArray
#   contacts - Report_contactsArray
#   from - SOAP::SOAPDateTime
#   to - SOAP::SOAPDateTime
#   status - Report_NotificationStatus
#   via - Report_NotificationVia
#   pageNumber - SOAP::SOAPInt
#   resultsPerPage - SOAP::SOAPInt
class Report_GetNotificationsRequest
  attr_accessor :checkNames
  attr_accessor :contacts
  attr_accessor :from
  attr_accessor :to
  attr_accessor :status
  attr_accessor :via
  attr_accessor :pageNumber
  attr_accessor :resultsPerPage

  def initialize(checkNames = nil, contacts = nil, from = nil, to = nil, status = nil, via = nil, pageNumber = nil, resultsPerPage = nil)
    @checkNames = checkNames
    @contacts = contacts
    @from = from
    @to = to
    @status = status
    @via = via
    @pageNumber = pageNumber
    @resultsPerPage = resultsPerPage
  end
end

# {urn:PingdomAPI}Report_GetOutagesRequest
#   from - SOAP::SOAPDateTime
#   to - SOAP::SOAPDateTime
#   checkName - SOAP::SOAPString
#   pageNumber - SOAP::SOAPInt
#   resultsPerPage - SOAP::SOAPInt
class Report_GetOutagesRequest
  attr_accessor :from
  attr_accessor :to
  attr_accessor :checkName
  attr_accessor :pageNumber
  attr_accessor :resultsPerPage

  def initialize(from = nil, to = nil, checkName = nil, pageNumber = nil, resultsPerPage = nil)
    @from = from
    @to = to
    @checkName = checkName
    @pageNumber = pageNumber
    @resultsPerPage = resultsPerPage
  end
end

# {urn:PingdomAPI}Report_GetRawDataRequest
#   from - SOAP::SOAPDateTime
#   to - SOAP::SOAPDateTime
#   checkName - SOAP::SOAPString
#   pageNumber - SOAP::SOAPInt
#   resultsPerPage - SOAP::SOAPInt
class Report_GetRawDataRequest
  attr_accessor :from
  attr_accessor :to
  attr_accessor :checkName
  attr_accessor :pageNumber
  attr_accessor :resultsPerPage

  def initialize(from = nil, to = nil, checkName = nil, pageNumber = nil, resultsPerPage = nil)
    @from = from
    @to = to
    @checkName = checkName
    @pageNumber = pageNumber
    @resultsPerPage = resultsPerPage
  end
end

# {urn:PingdomAPI}Report_GetDowntimesResponse
#   status - SOAP::SOAPInt
#   downtimesArray - Report_DowntimesArray
class Report_GetDowntimesResponse
  attr_accessor :status
  attr_accessor :downtimesArray

  def initialize(status = nil, downtimesArray = nil)
    @status = status
    @downtimesArray = downtimesArray
  end
end

# {urn:PingdomAPI}Report_DowntimeEntry
#   from - SOAP::SOAPDateTime
#   to - SOAP::SOAPDateTime
#   duration - SOAP::SOAPInt
class Report_DowntimeEntry
  attr_accessor :from
  attr_accessor :to
  attr_accessor :duration

  def initialize(from = nil, to = nil, duration = nil)
    @from = from
    @to = to
    @duration = duration
  end
end

# {urn:PingdomAPI}Report_GetDowntimesExtendedResponse
#   status - SOAP::SOAPInt
#   downtimesArray - Report_DowntimesExtendedArray
class Report_GetDowntimesExtendedResponse
  attr_accessor :status
  attr_accessor :downtimesArray

  def initialize(status = nil, downtimesArray = nil)
    @status = status
    @downtimesArray = downtimesArray
  end
end

# {urn:PingdomAPI}Report_DowntimeExtendedEntry
#   from - SOAP::SOAPDateTime
#   to - SOAP::SOAPDateTime
#   total_time - SOAP::SOAPInt
#   downtimes_duration - SOAP::SOAPInt
#   unknown_duration - SOAP::SOAPInt
class Report_DowntimeExtendedEntry
  attr_accessor :from
  attr_accessor :to
  attr_accessor :total_time
  attr_accessor :downtimes_duration
  attr_accessor :unknown_duration

  def initialize(from = nil, to = nil, total_time = nil, downtimes_duration = nil, unknown_duration = nil)
    @from = from
    @to = to
    @total_time = total_time
    @downtimes_duration = downtimes_duration
    @unknown_duration = unknown_duration
  end
end

# {urn:PingdomAPI}Report_GetOutagesResponse
#   status - SOAP::SOAPInt
#   outagesArray - Report_OutagesArray
class Report_GetOutagesResponse
  attr_accessor :status
  attr_accessor :outagesArray

  def initialize(status = nil, outagesArray = nil)
    @status = status
    @outagesArray = outagesArray
  end
end

# {urn:PingdomAPI}Report_OutageEntry
#   from - SOAP::SOAPDateTime
#   to - SOAP::SOAPDateTime
class Report_OutageEntry
  attr_accessor :from
  attr_accessor :to

  def initialize(from = nil, to = nil)
    @from = from
    @to = to
  end
end

# {urn:PingdomAPI}Report_ResponseTimeEntry
#   from - SOAP::SOAPDateTime
#   to - SOAP::SOAPDateTime
#   responseTime - SOAP::SOAPFloat
class Report_ResponseTimeEntry
  attr_accessor :from
  attr_accessor :to
  attr_accessor :responseTime

  def initialize(from = nil, to = nil, responseTime = nil)
    @from = from
    @to = to
    @responseTime = responseTime
  end
end

# {urn:PingdomAPI}Report_GetNotificationsResponseItem
#   notificationTime - SOAP::SOAPDateTime
#   check - SOAP::SOAPString
#   contact - SOAP::SOAPString
#   sentTo - SOAP::SOAPString
#   messageType - SOAP::SOAPString
#   messageStatus - SOAP::SOAPString
#   cause - SOAP::SOAPString
#   message - SOAP::SOAPString
#   charged - SOAP::SOAPBoolean
class Report_GetNotificationsResponseItem
  attr_accessor :notificationTime
  attr_accessor :check
  attr_accessor :contact
  attr_accessor :sentTo
  attr_accessor :messageType
  attr_accessor :messageStatus
  attr_accessor :cause
  attr_accessor :message
  attr_accessor :charged

  def initialize(notificationTime = nil, check = nil, contact = nil, sentTo = nil, messageType = nil, messageStatus = nil, cause = nil, message = nil, charged = nil)
    @notificationTime = notificationTime
    @check = check
    @contact = contact
    @sentTo = sentTo
    @messageType = messageType
    @messageStatus = messageStatus
    @cause = cause
    @message = message
    @charged = charged
  end
end

# {urn:PingdomAPI}Report_GetRawDataResponse
#   status - SOAP::SOAPInt
#   rawDataArray - Report_RawDataArray
class Report_GetRawDataResponse
  attr_accessor :status
  attr_accessor :rawDataArray

  def initialize(status = nil, rawDataArray = nil)
    @status = status
    @rawDataArray = rawDataArray
  end
end

# {urn:PingdomAPI}Report_RawDataEntry
#   checkTime - SOAP::SOAPDateTime
#   checkState - Report_CheckState
#   responseTime - SOAP::SOAPFloat
#   location - SOAP::SOAPString
class Report_RawDataEntry
  attr_accessor :checkTime
  attr_accessor :checkState
  attr_accessor :responseTime
  attr_accessor :location

  def initialize(checkTime = nil, checkState = nil, responseTime = nil, location = nil)
    @checkTime = checkTime
    @checkState = checkState
    @responseTime = responseTime
    @location = location
  end
end

# {urn:PingdomAPI}Location_GetListResponse
#   status - SOAP::SOAPInt
#   locationsArray - Location_ListArray
class Location_GetListResponse
  attr_accessor :status
  attr_accessor :locationsArray

  def initialize(status = nil, locationsArray = nil)
    @status = status
    @locationsArray = locationsArray
  end
end

# {urn:PingdomAPI}Report_GetResponseTimesResponse
#   status - SOAP::SOAPInt
#   responseTimesArray - Report_ResponseTimesArray
class Report_GetResponseTimesResponse
  attr_accessor :status
  attr_accessor :responseTimesArray

  def initialize(status = nil, responseTimesArray = nil)
    @status = status
    @responseTimesArray = responseTimesArray
  end
end

# {urn:PingdomAPI}Report_GetNotificationsResponse
#   status - SOAP::SOAPInt
#   getNotificationsResponseArray - Report_GetNotificationsResponseArray
class Report_GetNotificationsResponse
  attr_accessor :status
  attr_accessor :getNotificationsResponseArray

  def initialize(status = nil, getNotificationsResponseArray = nil)
    @status = status
    @getNotificationsResponseArray = getNotificationsResponseArray
  end
end

# {urn:PingdomAPI}AccountData
#   email - SOAP::SOAPString
#   firstName - SOAP::SOAPString
#   lastName - SOAP::SOAPString
#   company - SOAP::SOAPString
#   phoneCodeCountry - SOAP::SOAPString
#   phoneNumber - SOAP::SOAPString
#   cellPhoneCodeCountry - SOAP::SOAPString
#   cellPhoneNumber - SOAP::SOAPString
#   address - SOAP::SOAPString
#   addressTwo - SOAP::SOAPString
#   zip - SOAP::SOAPString
#   city - SOAP::SOAPString
#   state - SOAP::SOAPString
#   countryISO - SOAP::SOAPString
class AccountData
  attr_accessor :email
  attr_accessor :firstName
  attr_accessor :lastName
  attr_accessor :company
  attr_accessor :phoneCodeCountry
  attr_accessor :phoneNumber
  attr_accessor :cellPhoneCodeCountry
  attr_accessor :cellPhoneNumber
  attr_accessor :address
  attr_accessor :addressTwo
  attr_accessor :zip
  attr_accessor :city
  attr_accessor :state
  attr_accessor :countryISO

  def initialize(email = nil, firstName = nil, lastName = nil, company = nil, phoneCodeCountry = nil, phoneNumber = nil, cellPhoneCodeCountry = nil, cellPhoneNumber = nil, address = nil, addressTwo = nil, zip = nil, city = nil, state = nil, countryISO = nil)
    @email = email
    @firstName = firstName
    @lastName = lastName
    @company = company
    @phoneCodeCountry = phoneCodeCountry
    @phoneNumber = phoneNumber
    @cellPhoneCodeCountry = cellPhoneCodeCountry
    @cellPhoneNumber = cellPhoneNumber
    @address = address
    @addressTwo = addressTwo
    @zip = zip
    @city = city
    @state = state
    @countryISO = countryISO
  end
end

# {urn:PingdomAPI}CreateAccountResponse
#   status - SOAP::SOAPInt
class CreateAccountResponse
  attr_accessor :status

  def initialize(status = nil)
    @status = status
  end
end

# {urn:PingdomAPI}Check_ListArray
class Check_ListArray < ::Array
end

# {urn:PingdomAPI}Check_CheckIdsArray
class Check_CheckIdsArray < ::Array
end

# {urn:PingdomAPI}Report_LastDownsArray
class Report_LastDownsArray < ::Array
end

# {urn:PingdomAPI}Report_CurrentStatesArray
class Report_CurrentStatesArray < ::Array
end

# {urn:PingdomAPI}Report_checkNamesArray
class Report_checkNamesArray < ::Array
end

# {urn:PingdomAPI}Report_contactsArray
class Report_contactsArray < ::Array
end

# {urn:PingdomAPI}Report_NotificationStatus
class Report_NotificationStatus < ::Array
end

# {urn:PingdomAPI}Report_NotificationVia
class Report_NotificationVia < ::Array
end

# {urn:PingdomAPI}Report_DowntimesArray
class Report_DowntimesArray < ::Array
end

# {urn:PingdomAPI}Report_DowntimesExtendedArray
class Report_DowntimesExtendedArray < ::Array
end

# {urn:PingdomAPI}Report_OutagesArray
class Report_OutagesArray < ::Array
end

# {urn:PingdomAPI}Location_ListArray
class Location_ListArray < ::Array
end

# {urn:PingdomAPI}Report_ResponseTimesArray
class Report_ResponseTimesArray < ::Array
end

# {urn:PingdomAPI}Report_GetNotificationsResponseArray
class Report_GetNotificationsResponseArray < ::Array
end

# {urn:PingdomAPI}Report_RawDataArray
class Report_RawDataArray < ::Array
end

# {urn:PingdomAPI}Report_CheckState
class Report_CheckState < ::String
  CHECK_DOWN = Report_CheckState.new("CHECK_DOWN")
  CHECK_UNKNOWN = Report_CheckState.new("CHECK_UNKNOWN")
  CHECK_UP = Report_CheckState.new("CHECK_UP")
end

# {urn:PingdomAPI}Report_NotificationStatusItem
class Report_NotificationStatusItem < ::String
  DELIVERED = Report_NotificationStatusItem.new("DELIVERED")
  ERROR = Report_NotificationStatusItem.new("ERROR")
  NOT_DELIVERED = Report_NotificationStatusItem.new("NOT_DELIVERED")
  NO_CREDITS = Report_NotificationStatusItem.new("NO_CREDITS")
  SENT = Report_NotificationStatusItem.new("SENT")
end

# {urn:PingdomAPI}Report_NotificationViaItem
class Report_NotificationViaItem < ::String
  EMAIL = Report_NotificationViaItem.new("EMAIL")
  SMS = Report_NotificationViaItem.new("SMS")
end

# {urn:PingdomAPI}Report_ResolutionEnum
class Report_ResolutionEnum < ::String
  DAILY = Report_ResolutionEnum.new("DAILY")
  MONTHLY = Report_ResolutionEnum.new("MONTHLY")
  WEEKLY = Report_ResolutionEnum.new("WEEKLY")
end

# {urn:PingdomAPI}AccountType
class AccountType < ::String
  BASIC_MONTHLY = AccountType.new("BASIC_MONTHLY")
  BASIC_YEARLY = AccountType.new("BASIC_YEARLY")
  TRIAL = AccountType.new("TRIAL")
end
