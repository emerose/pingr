require 'PingdomAPI.rb'
require 'soap/mapping'

module PingdomAPIMappingRegistry
  EncodedRegistry = ::SOAP::Mapping::EncodedRegistry.new
  LiteralRegistry = ::SOAP::Mapping::LiteralRegistry.new
  NsPingdomAPI = "urn:PingdomAPI"

  EncodedRegistry.register(
    :class => Test_EchoResponse,
    :schema_type => XSD::QName.new(NsPingdomAPI, "Test_EchoResponse"),
    :schema_element => [
      ["status", ["SOAP::SOAPInt", XSD::QName.new(nil, "status")]],
      ["outString", ["SOAP::SOAPString", XSD::QName.new(nil, "outString")]]
    ]
  )

  EncodedRegistry.register(
    :class => Auth_CredentialsData,
    :schema_type => XSD::QName.new(NsPingdomAPI, "Auth_CredentialsData"),
    :schema_element => [
      ["username", ["SOAP::SOAPString", XSD::QName.new(nil, "username")]],
      ["password", ["SOAP::SOAPString", XSD::QName.new(nil, "password")]]
    ]
  )

  EncodedRegistry.register(
    :class => Auth_LoginResponse,
    :schema_type => XSD::QName.new(NsPingdomAPI, "Auth_LoginResponse"),
    :schema_element => [
      ["status", ["SOAP::SOAPInt", XSD::QName.new(nil, "status")]],
      ["sessionId", ["SOAP::SOAPString", XSD::QName.new(nil, "sessionId")]]
    ]
  )

  EncodedRegistry.register(
    :class => Auth_LogoutResponse,
    :schema_type => XSD::QName.new(NsPingdomAPI, "Auth_LogoutResponse"),
    :schema_element => [
      ["status", ["SOAP::SOAPInt", XSD::QName.new(nil, "status")]]
    ]
  )

  EncodedRegistry.register(
    :class => Check_GetListResponse,
    :schema_type => XSD::QName.new(NsPingdomAPI, "Check_GetListResponse"),
    :schema_element => [
      ["status", ["SOAP::SOAPInt", XSD::QName.new(nil, "status")]],
      ["checkNames", ["Check_ListArray", XSD::QName.new(nil, "checkNames")]]
    ]
  )

  EncodedRegistry.set(
    Check_ListArray,
    ::SOAP::SOAPArray,
    ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
    { :type => XSD::QName.new("http://www.w3.org/2001/XMLSchema", "string") }
  )

  EncodedRegistry.register(
    :class => Check_GetCheckIdsByNamesRequest,
    :schema_type => XSD::QName.new(NsPingdomAPI, "Check_GetCheckIdsByNamesRequest"),
    :schema_element => [
      ["checkNames", ["Check_ListArray", XSD::QName.new(nil, "checkNames")]]
    ]
  )

  EncodedRegistry.register(
    :class => Check_GetCheckIdsByNamesResponse,
    :schema_type => XSD::QName.new(NsPingdomAPI, "Check_GetCheckIdsByNamesResponse"),
    :schema_element => [
      ["status", ["SOAP::SOAPInt", XSD::QName.new(nil, "status")]],
      ["checkIds", ["Check_CheckIdsArray", XSD::QName.new(nil, "checkIds")]]
    ]
  )

  EncodedRegistry.set(
    Check_CheckIdsArray,
    ::SOAP::SOAPArray,
    ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
    { :type => XSD::QName.new("http://www.w3.org/2001/XMLSchema", "int") }
  )

  EncodedRegistry.register(
    :class => Report_GetLastDownsResponse,
    :schema_type => XSD::QName.new(NsPingdomAPI, "Report_GetLastDownsResponse"),
    :schema_element => [
      ["status", ["SOAP::SOAPInt", XSD::QName.new(nil, "status")]],
      ["lastDowns", ["Report_LastDownsArray", XSD::QName.new(nil, "lastDowns")]]
    ]
  )

  EncodedRegistry.set(
    Report_LastDownsArray,
    ::SOAP::SOAPArray,
    ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
    { :type => XSD::QName.new(NsPingdomAPI, "Report_LastDownEntry") }
  )

  EncodedRegistry.register(
    :class => Report_LastDownEntry,
    :schema_type => XSD::QName.new(NsPingdomAPI, "Report_LastDownEntry"),
    :schema_element => [
      ["checkName", ["SOAP::SOAPString", XSD::QName.new(nil, "checkName")]],
      ["lastDown", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "lastDown")]]
    ]
  )

  EncodedRegistry.register(
    :class => Report_GetCurrentStatesResponse,
    :schema_type => XSD::QName.new(NsPingdomAPI, "Report_GetCurrentStatesResponse"),
    :schema_element => [
      ["status", ["SOAP::SOAPInt", XSD::QName.new(nil, "status")]],
      ["currentStates", ["Report_CurrentStatesArray", XSD::QName.new(nil, "currentStates")]]
    ]
  )

  EncodedRegistry.set(
    Report_CurrentStatesArray,
    ::SOAP::SOAPArray,
    ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
    { :type => XSD::QName.new(NsPingdomAPI, "Report_CheckStateEntry") }
  )

  EncodedRegistry.register(
    :class => Report_CheckStateEntry,
    :schema_type => XSD::QName.new(NsPingdomAPI, "Report_CheckStateEntry"),
    :schema_element => [
      ["checkName", ["SOAP::SOAPString", XSD::QName.new(nil, "checkName")]],
      ["checkState", ["Report_CheckState", XSD::QName.new(nil, "checkState")]],
      ["lastCheckTime", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "lastCheckTime")]]
    ]
  )

  EncodedRegistry.register(
    :class => Report_GetDowntimesRequest,
    :schema_type => XSD::QName.new(NsPingdomAPI, "Report_GetDowntimesRequest"),
    :schema_element => [
      ["from", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "from")]],
      ["to", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "to")]],
      ["resolution", ["Report_ResolutionEnum", XSD::QName.new(nil, "resolution")]],
      ["checkName", ["SOAP::SOAPString", XSD::QName.new(nil, "checkName")]]
    ]
  )

  EncodedRegistry.register(
    :class => Report_GetResponseTimesRequest,
    :schema_type => XSD::QName.new(NsPingdomAPI, "Report_GetResponseTimesRequest"),
    :schema_element => [
      ["from", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "from")]],
      ["to", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "to")]],
      ["resolution", ["Report_ResolutionEnum", XSD::QName.new(nil, "resolution")]],
      ["checkName", ["SOAP::SOAPString", XSD::QName.new(nil, "checkName")]],
      ["locations", ["Location_ListArray", XSD::QName.new(nil, "locations")]]
    ]
  )

  EncodedRegistry.register(
    :class => Report_GetNotificationsRequest,
    :schema_type => XSD::QName.new(NsPingdomAPI, "Report_GetNotificationsRequest"),
    :schema_element => [
      ["checkNames", ["Report_checkNamesArray", XSD::QName.new(nil, "checkNames")]],
      ["contacts", ["Report_contactsArray", XSD::QName.new(nil, "contacts")]],
      ["from", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "from")]],
      ["to", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "to")]],
      ["status", ["Report_NotificationStatus", XSD::QName.new(nil, "status")]],
      ["via", ["Report_NotificationVia", XSD::QName.new(nil, "via")]],
      ["pageNumber", ["SOAP::SOAPInt", XSD::QName.new(nil, "pageNumber")]],
      ["resultsPerPage", ["SOAP::SOAPInt", XSD::QName.new(nil, "resultsPerPage")]]
    ]
  )

  EncodedRegistry.set(
    Report_checkNamesArray,
    ::SOAP::SOAPArray,
    ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
    { :type => XSD::QName.new("http://www.w3.org/2001/XMLSchema", "string") }
  )

  EncodedRegistry.set(
    Report_contactsArray,
    ::SOAP::SOAPArray,
    ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
    { :type => XSD::QName.new("http://www.w3.org/2001/XMLSchema", "string") }
  )

  EncodedRegistry.set(
    Report_NotificationStatus,
    ::SOAP::SOAPArray,
    ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
    { :type => XSD::QName.new(NsPingdomAPI, "Report_NotificationStatusItem") }
  )

  EncodedRegistry.set(
    Report_NotificationVia,
    ::SOAP::SOAPArray,
    ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
    { :type => XSD::QName.new(NsPingdomAPI, "Report_NotificationViaItem") }
  )

  EncodedRegistry.register(
    :class => Report_GetOutagesRequest,
    :schema_type => XSD::QName.new(NsPingdomAPI, "Report_GetOutagesRequest"),
    :schema_element => [
      ["from", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "from")]],
      ["to", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "to")]],
      ["checkName", ["SOAP::SOAPString", XSD::QName.new(nil, "checkName")]],
      ["pageNumber", ["SOAP::SOAPInt", XSD::QName.new(nil, "pageNumber")]],
      ["resultsPerPage", ["SOAP::SOAPInt", XSD::QName.new(nil, "resultsPerPage")]]
    ]
  )

  EncodedRegistry.register(
    :class => Report_GetRawDataRequest,
    :schema_type => XSD::QName.new(NsPingdomAPI, "Report_GetRawDataRequest"),
    :schema_element => [
      ["from", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "from")]],
      ["to", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "to")]],
      ["checkName", ["SOAP::SOAPString", XSD::QName.new(nil, "checkName")]],
      ["pageNumber", ["SOAP::SOAPInt", XSD::QName.new(nil, "pageNumber")]],
      ["resultsPerPage", ["SOAP::SOAPInt", XSD::QName.new(nil, "resultsPerPage")]]
    ]
  )

  EncodedRegistry.register(
    :class => Report_GetDowntimesResponse,
    :schema_type => XSD::QName.new(NsPingdomAPI, "Report_GetDowntimesResponse"),
    :schema_element => [
      ["status", ["SOAP::SOAPInt", XSD::QName.new(nil, "status")]],
      ["downtimesArray", ["Report_DowntimesArray", XSD::QName.new(nil, "downtimesArray")]]
    ]
  )

  EncodedRegistry.set(
    Report_DowntimesArray,
    ::SOAP::SOAPArray,
    ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
    { :type => XSD::QName.new(NsPingdomAPI, "Report_DowntimeEntry") }
  )

  EncodedRegistry.register(
    :class => Report_DowntimeEntry,
    :schema_type => XSD::QName.new(NsPingdomAPI, "Report_DowntimeEntry"),
    :schema_element => [
      ["from", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "from")]],
      ["to", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "to")]],
      ["duration", ["SOAP::SOAPInt", XSD::QName.new(nil, "duration")]]
    ]
  )

  EncodedRegistry.register(
    :class => Report_GetDowntimesExtendedResponse,
    :schema_type => XSD::QName.new(NsPingdomAPI, "Report_GetDowntimesExtendedResponse"),
    :schema_element => [
      ["status", ["SOAP::SOAPInt", XSD::QName.new(nil, "status")]],
      ["downtimesArray", ["Report_DowntimesExtendedArray", XSD::QName.new(nil, "downtimesArray")]]
    ]
  )

  EncodedRegistry.set(
    Report_DowntimesExtendedArray,
    ::SOAP::SOAPArray,
    ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
    { :type => XSD::QName.new(NsPingdomAPI, "Report_DowntimeExtendedEntry") }
  )

  EncodedRegistry.register(
    :class => Report_DowntimeExtendedEntry,
    :schema_type => XSD::QName.new(NsPingdomAPI, "Report_DowntimeExtendedEntry"),
    :schema_element => [
      ["from", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "from")]],
      ["to", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "to")]],
      ["total_time", ["SOAP::SOAPInt", XSD::QName.new(nil, "total_time")]],
      ["downtimes_duration", ["SOAP::SOAPInt", XSD::QName.new(nil, "downtimes_duration")]],
      ["unknown_duration", ["SOAP::SOAPInt", XSD::QName.new(nil, "unknown_duration")]]
    ]
  )

  EncodedRegistry.register(
    :class => Report_GetOutagesResponse,
    :schema_type => XSD::QName.new(NsPingdomAPI, "Report_GetOutagesResponse"),
    :schema_element => [
      ["status", ["SOAP::SOAPInt", XSD::QName.new(nil, "status")]],
      ["outagesArray", ["Report_OutagesArray", XSD::QName.new(nil, "outagesArray")]]
    ]
  )

  EncodedRegistry.set(
    Report_OutagesArray,
    ::SOAP::SOAPArray,
    ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
    { :type => XSD::QName.new(NsPingdomAPI, "Report_OutageEntry") }
  )

  EncodedRegistry.register(
    :class => Report_OutageEntry,
    :schema_type => XSD::QName.new(NsPingdomAPI, "Report_OutageEntry"),
    :schema_element => [
      ["from", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "from")]],
      ["to", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "to")]]
    ]
  )

  EncodedRegistry.set(
    Location_ListArray,
    ::SOAP::SOAPArray,
    ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
    { :type => XSD::QName.new("http://www.w3.org/2001/XMLSchema", "string") }
  )

  EncodedRegistry.set(
    Report_ResponseTimesArray,
    ::SOAP::SOAPArray,
    ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
    { :type => XSD::QName.new(NsPingdomAPI, "Report_ResponseTimeEntry") }
  )

  EncodedRegistry.register(
    :class => Report_ResponseTimeEntry,
    :schema_type => XSD::QName.new(NsPingdomAPI, "Report_ResponseTimeEntry"),
    :schema_element => [
      ["from", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "from")]],
      ["to", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "to")]],
      ["responseTime", ["SOAP::SOAPFloat", XSD::QName.new(nil, "responseTime")]]
    ]
  )

  EncodedRegistry.set(
    Report_GetNotificationsResponseArray,
    ::SOAP::SOAPArray,
    ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
    { :type => XSD::QName.new(NsPingdomAPI, "Report_GetNotificationsResponseItem") }
  )

  EncodedRegistry.register(
    :class => Report_GetNotificationsResponseItem,
    :schema_type => XSD::QName.new(NsPingdomAPI, "Report_GetNotificationsResponseItem"),
    :schema_element => [
      ["notificationTime", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "notificationTime")]],
      ["check", ["SOAP::SOAPString", XSD::QName.new(nil, "check")]],
      ["contact", ["SOAP::SOAPString", XSD::QName.new(nil, "contact")]],
      ["sentTo", ["SOAP::SOAPString", XSD::QName.new(nil, "sentTo")]],
      ["messageType", ["SOAP::SOAPString", XSD::QName.new(nil, "messageType")]],
      ["messageStatus", ["SOAP::SOAPString", XSD::QName.new(nil, "messageStatus")]],
      ["cause", ["SOAP::SOAPString", XSD::QName.new(nil, "cause")]],
      ["message", ["SOAP::SOAPString", XSD::QName.new(nil, "message")]],
      ["charged", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "charged")]]
    ]
  )

  EncodedRegistry.register(
    :class => Report_GetRawDataResponse,
    :schema_type => XSD::QName.new(NsPingdomAPI, "Report_GetRawDataResponse"),
    :schema_element => [
      ["status", ["SOAP::SOAPInt", XSD::QName.new(nil, "status")]],
      ["rawDataArray", ["Report_RawDataArray", XSD::QName.new(nil, "rawDataArray")]]
    ]
  )

  EncodedRegistry.set(
    Report_RawDataArray,
    ::SOAP::SOAPArray,
    ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
    { :type => XSD::QName.new(NsPingdomAPI, "Report_RawDataEntry") }
  )

  EncodedRegistry.register(
    :class => Report_RawDataEntry,
    :schema_type => XSD::QName.new(NsPingdomAPI, "Report_RawDataEntry"),
    :schema_element => [
      ["checkTime", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "checkTime")]],
      ["checkState", ["Report_CheckState", XSD::QName.new(nil, "checkState")]],
      ["responseTime", ["SOAP::SOAPFloat", XSD::QName.new(nil, "responseTime")]],
      ["location", ["SOAP::SOAPString", XSD::QName.new(nil, "location")]]
    ]
  )

  EncodedRegistry.register(
    :class => Location_GetListResponse,
    :schema_type => XSD::QName.new(NsPingdomAPI, "Location_GetListResponse"),
    :schema_element => [
      ["status", ["SOAP::SOAPInt", XSD::QName.new(nil, "status")]],
      ["locationsArray", ["Location_ListArray", XSD::QName.new(nil, "locationsArray")]]
    ]
  )

  EncodedRegistry.register(
    :class => Report_GetResponseTimesResponse,
    :schema_type => XSD::QName.new(NsPingdomAPI, "Report_GetResponseTimesResponse"),
    :schema_element => [
      ["status", ["SOAP::SOAPInt", XSD::QName.new(nil, "status")]],
      ["responseTimesArray", ["Report_ResponseTimesArray", XSD::QName.new(nil, "responseTimesArray")]]
    ]
  )

  EncodedRegistry.register(
    :class => Report_GetNotificationsResponse,
    :schema_type => XSD::QName.new(NsPingdomAPI, "Report_GetNotificationsResponse"),
    :schema_element => [
      ["status", ["SOAP::SOAPInt", XSD::QName.new(nil, "status")]],
      ["getNotificationsResponseArray", ["Report_GetNotificationsResponseArray", XSD::QName.new(nil, "getNotificationsResponseArray")]]
    ]
  )

  EncodedRegistry.register(
    :class => AccountData,
    :schema_type => XSD::QName.new(NsPingdomAPI, "AccountData"),
    :schema_element => [
      ["email", ["SOAP::SOAPString", XSD::QName.new(nil, "email")]],
      ["firstName", ["SOAP::SOAPString", XSD::QName.new(nil, "firstName")]],
      ["lastName", ["SOAP::SOAPString", XSD::QName.new(nil, "lastName")]],
      ["company", ["SOAP::SOAPString", XSD::QName.new(nil, "company")]],
      ["phoneCodeCountry", ["SOAP::SOAPString", XSD::QName.new(nil, "phoneCodeCountry")]],
      ["phoneNumber", ["SOAP::SOAPString", XSD::QName.new(nil, "phoneNumber")]],
      ["cellPhoneCodeCountry", ["SOAP::SOAPString", XSD::QName.new(nil, "cellPhoneCodeCountry")]],
      ["cellPhoneNumber", ["SOAP::SOAPString", XSD::QName.new(nil, "cellPhoneNumber")]],
      ["address", ["SOAP::SOAPString", XSD::QName.new(nil, "address")]],
      ["addressTwo", ["SOAP::SOAPString", XSD::QName.new(nil, "addressTwo")]],
      ["zip", ["SOAP::SOAPString", XSD::QName.new(nil, "zip")]],
      ["city", ["SOAP::SOAPString", XSD::QName.new(nil, "city")]],
      ["state", ["SOAP::SOAPString", XSD::QName.new(nil, "state")]],
      ["countryISO", ["SOAP::SOAPString", XSD::QName.new(nil, "countryISO")]]
    ]
  )

  EncodedRegistry.register(
    :class => CreateAccountResponse,
    :schema_type => XSD::QName.new(NsPingdomAPI, "CreateAccountResponse"),
    :schema_element => [
      ["status", ["SOAP::SOAPInt", XSD::QName.new(nil, "status")]]
    ]
  )

  EncodedRegistry.register(
    :class => Report_CheckState,
    :schema_type => XSD::QName.new(NsPingdomAPI, "Report_CheckState")
  )

  EncodedRegistry.register(
    :class => Report_NotificationStatusItem,
    :schema_type => XSD::QName.new(NsPingdomAPI, "Report_NotificationStatusItem")
  )

  EncodedRegistry.register(
    :class => Report_NotificationViaItem,
    :schema_type => XSD::QName.new(NsPingdomAPI, "Report_NotificationViaItem")
  )

  EncodedRegistry.register(
    :class => Report_ResolutionEnum,
    :schema_type => XSD::QName.new(NsPingdomAPI, "Report_ResolutionEnum")
  )

  EncodedRegistry.register(
    :class => AccountType,
    :schema_type => XSD::QName.new(NsPingdomAPI, "AccountType")
  )

  LiteralRegistry.register(
    :class => Test_EchoResponse,
    :schema_type => XSD::QName.new(NsPingdomAPI, "Test_EchoResponse"),
    :schema_element => [
      ["status", ["SOAP::SOAPInt", XSD::QName.new(nil, "status")]],
      ["outString", ["SOAP::SOAPString", XSD::QName.new(nil, "outString")]]
    ]
  )

  LiteralRegistry.register(
    :class => Auth_CredentialsData,
    :schema_type => XSD::QName.new(NsPingdomAPI, "Auth_CredentialsData"),
    :schema_element => [
      ["username", ["SOAP::SOAPString", XSD::QName.new(nil, "username")]],
      ["password", ["SOAP::SOAPString", XSD::QName.new(nil, "password")]]
    ]
  )

  LiteralRegistry.register(
    :class => Auth_LoginResponse,
    :schema_type => XSD::QName.new(NsPingdomAPI, "Auth_LoginResponse"),
    :schema_element => [
      ["status", ["SOAP::SOAPInt", XSD::QName.new(nil, "status")]],
      ["sessionId", ["SOAP::SOAPString", XSD::QName.new(nil, "sessionId")]]
    ]
  )

  LiteralRegistry.register(
    :class => Auth_LogoutResponse,
    :schema_type => XSD::QName.new(NsPingdomAPI, "Auth_LogoutResponse"),
    :schema_element => [
      ["status", ["SOAP::SOAPInt", XSD::QName.new(nil, "status")]]
    ]
  )

  LiteralRegistry.register(
    :class => Check_GetListResponse,
    :schema_type => XSD::QName.new(NsPingdomAPI, "Check_GetListResponse"),
    :schema_element => [
      ["status", ["SOAP::SOAPInt", XSD::QName.new(nil, "status")]],
      ["checkNames", ["Check_ListArray", XSD::QName.new(nil, "checkNames")]]
    ]
  )

  LiteralRegistry.register(
    :class => Check_GetCheckIdsByNamesRequest,
    :schema_type => XSD::QName.new(NsPingdomAPI, "Check_GetCheckIdsByNamesRequest"),
    :schema_element => [
      ["checkNames", ["Check_ListArray", XSD::QName.new(nil, "checkNames")]]
    ]
  )

  LiteralRegistry.register(
    :class => Check_GetCheckIdsByNamesResponse,
    :schema_type => XSD::QName.new(NsPingdomAPI, "Check_GetCheckIdsByNamesResponse"),
    :schema_element => [
      ["status", ["SOAP::SOAPInt", XSD::QName.new(nil, "status")]],
      ["checkIds", ["Check_CheckIdsArray", XSD::QName.new(nil, "checkIds")]]
    ]
  )

  LiteralRegistry.register(
    :class => Report_GetLastDownsResponse,
    :schema_type => XSD::QName.new(NsPingdomAPI, "Report_GetLastDownsResponse"),
    :schema_element => [
      ["status", ["SOAP::SOAPInt", XSD::QName.new(nil, "status")]],
      ["lastDowns", ["Report_LastDownsArray", XSD::QName.new(nil, "lastDowns")]]
    ]
  )

  LiteralRegistry.register(
    :class => Report_LastDownEntry,
    :schema_type => XSD::QName.new(NsPingdomAPI, "Report_LastDownEntry"),
    :schema_element => [
      ["checkName", ["SOAP::SOAPString", XSD::QName.new(nil, "checkName")]],
      ["lastDown", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "lastDown")]]
    ]
  )

  LiteralRegistry.register(
    :class => Report_GetCurrentStatesResponse,
    :schema_type => XSD::QName.new(NsPingdomAPI, "Report_GetCurrentStatesResponse"),
    :schema_element => [
      ["status", ["SOAP::SOAPInt", XSD::QName.new(nil, "status")]],
      ["currentStates", ["Report_CurrentStatesArray", XSD::QName.new(nil, "currentStates")]]
    ]
  )

  LiteralRegistry.register(
    :class => Report_CheckStateEntry,
    :schema_type => XSD::QName.new(NsPingdomAPI, "Report_CheckStateEntry"),
    :schema_element => [
      ["checkName", ["SOAP::SOAPString", XSD::QName.new(nil, "checkName")]],
      ["checkState", ["Report_CheckState", XSD::QName.new(nil, "checkState")]],
      ["lastCheckTime", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "lastCheckTime")]]
    ]
  )

  LiteralRegistry.register(
    :class => Report_GetDowntimesRequest,
    :schema_type => XSD::QName.new(NsPingdomAPI, "Report_GetDowntimesRequest"),
    :schema_element => [
      ["from", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "from")]],
      ["to", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "to")]],
      ["resolution", ["Report_ResolutionEnum", XSD::QName.new(nil, "resolution")]],
      ["checkName", ["SOAP::SOAPString", XSD::QName.new(nil, "checkName")]]
    ]
  )

  LiteralRegistry.register(
    :class => Report_GetResponseTimesRequest,
    :schema_type => XSD::QName.new(NsPingdomAPI, "Report_GetResponseTimesRequest"),
    :schema_element => [
      ["from", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "from")]],
      ["to", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "to")]],
      ["resolution", ["Report_ResolutionEnum", XSD::QName.new(nil, "resolution")]],
      ["checkName", ["SOAP::SOAPString", XSD::QName.new(nil, "checkName")]],
      ["locations", ["Location_ListArray", XSD::QName.new(nil, "locations")]]
    ]
  )

  LiteralRegistry.register(
    :class => Report_GetNotificationsRequest,
    :schema_type => XSD::QName.new(NsPingdomAPI, "Report_GetNotificationsRequest"),
    :schema_element => [
      ["checkNames", ["Report_checkNamesArray", XSD::QName.new(nil, "checkNames")]],
      ["contacts", ["Report_contactsArray", XSD::QName.new(nil, "contacts")]],
      ["from", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "from")]],
      ["to", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "to")]],
      ["status", ["Report_NotificationStatus", XSD::QName.new(nil, "status")]],
      ["via", ["Report_NotificationVia", XSD::QName.new(nil, "via")]],
      ["pageNumber", ["SOAP::SOAPInt", XSD::QName.new(nil, "pageNumber")]],
      ["resultsPerPage", ["SOAP::SOAPInt", XSD::QName.new(nil, "resultsPerPage")]]
    ]
  )

  LiteralRegistry.register(
    :class => Report_GetOutagesRequest,
    :schema_type => XSD::QName.new(NsPingdomAPI, "Report_GetOutagesRequest"),
    :schema_element => [
      ["from", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "from")]],
      ["to", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "to")]],
      ["checkName", ["SOAP::SOAPString", XSD::QName.new(nil, "checkName")]],
      ["pageNumber", ["SOAP::SOAPInt", XSD::QName.new(nil, "pageNumber")]],
      ["resultsPerPage", ["SOAP::SOAPInt", XSD::QName.new(nil, "resultsPerPage")]]
    ]
  )

  LiteralRegistry.register(
    :class => Report_GetRawDataRequest,
    :schema_type => XSD::QName.new(NsPingdomAPI, "Report_GetRawDataRequest"),
    :schema_element => [
      ["from", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "from")]],
      ["to", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "to")]],
      ["checkName", ["SOAP::SOAPString", XSD::QName.new(nil, "checkName")]],
      ["pageNumber", ["SOAP::SOAPInt", XSD::QName.new(nil, "pageNumber")]],
      ["resultsPerPage", ["SOAP::SOAPInt", XSD::QName.new(nil, "resultsPerPage")]]
    ]
  )

  LiteralRegistry.register(
    :class => Report_GetDowntimesResponse,
    :schema_type => XSD::QName.new(NsPingdomAPI, "Report_GetDowntimesResponse"),
    :schema_element => [
      ["status", ["SOAP::SOAPInt", XSD::QName.new(nil, "status")]],
      ["downtimesArray", ["Report_DowntimesArray", XSD::QName.new(nil, "downtimesArray")]]
    ]
  )

  LiteralRegistry.register(
    :class => Report_DowntimeEntry,
    :schema_type => XSD::QName.new(NsPingdomAPI, "Report_DowntimeEntry"),
    :schema_element => [
      ["from", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "from")]],
      ["to", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "to")]],
      ["duration", ["SOAP::SOAPInt", XSD::QName.new(nil, "duration")]]
    ]
  )

  LiteralRegistry.register(
    :class => Report_GetDowntimesExtendedResponse,
    :schema_type => XSD::QName.new(NsPingdomAPI, "Report_GetDowntimesExtendedResponse"),
    :schema_element => [
      ["status", ["SOAP::SOAPInt", XSD::QName.new(nil, "status")]],
      ["downtimesArray", ["Report_DowntimesExtendedArray", XSD::QName.new(nil, "downtimesArray")]]
    ]
  )

  LiteralRegistry.register(
    :class => Report_DowntimeExtendedEntry,
    :schema_type => XSD::QName.new(NsPingdomAPI, "Report_DowntimeExtendedEntry"),
    :schema_element => [
      ["from", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "from")]],
      ["to", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "to")]],
      ["total_time", ["SOAP::SOAPInt", XSD::QName.new(nil, "total_time")]],
      ["downtimes_duration", ["SOAP::SOAPInt", XSD::QName.new(nil, "downtimes_duration")]],
      ["unknown_duration", ["SOAP::SOAPInt", XSD::QName.new(nil, "unknown_duration")]]
    ]
  )

  LiteralRegistry.register(
    :class => Report_GetOutagesResponse,
    :schema_type => XSD::QName.new(NsPingdomAPI, "Report_GetOutagesResponse"),
    :schema_element => [
      ["status", ["SOAP::SOAPInt", XSD::QName.new(nil, "status")]],
      ["outagesArray", ["Report_OutagesArray", XSD::QName.new(nil, "outagesArray")]]
    ]
  )

  LiteralRegistry.register(
    :class => Report_OutageEntry,
    :schema_type => XSD::QName.new(NsPingdomAPI, "Report_OutageEntry"),
    :schema_element => [
      ["from", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "from")]],
      ["to", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "to")]]
    ]
  )

  LiteralRegistry.register(
    :class => Report_ResponseTimeEntry,
    :schema_type => XSD::QName.new(NsPingdomAPI, "Report_ResponseTimeEntry"),
    :schema_element => [
      ["from", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "from")]],
      ["to", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "to")]],
      ["responseTime", ["SOAP::SOAPFloat", XSD::QName.new(nil, "responseTime")]]
    ]
  )

  LiteralRegistry.register(
    :class => Report_GetNotificationsResponseItem,
    :schema_type => XSD::QName.new(NsPingdomAPI, "Report_GetNotificationsResponseItem"),
    :schema_element => [
      ["notificationTime", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "notificationTime")]],
      ["check", ["SOAP::SOAPString", XSD::QName.new(nil, "check")]],
      ["contact", ["SOAP::SOAPString", XSD::QName.new(nil, "contact")]],
      ["sentTo", ["SOAP::SOAPString", XSD::QName.new(nil, "sentTo")]],
      ["messageType", ["SOAP::SOAPString", XSD::QName.new(nil, "messageType")]],
      ["messageStatus", ["SOAP::SOAPString", XSD::QName.new(nil, "messageStatus")]],
      ["cause", ["SOAP::SOAPString", XSD::QName.new(nil, "cause")]],
      ["message", ["SOAP::SOAPString", XSD::QName.new(nil, "message")]],
      ["charged", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "charged")]]
    ]
  )

  LiteralRegistry.register(
    :class => Report_GetRawDataResponse,
    :schema_type => XSD::QName.new(NsPingdomAPI, "Report_GetRawDataResponse"),
    :schema_element => [
      ["status", ["SOAP::SOAPInt", XSD::QName.new(nil, "status")]],
      ["rawDataArray", ["Report_RawDataArray", XSD::QName.new(nil, "rawDataArray")]]
    ]
  )

  LiteralRegistry.register(
    :class => Report_RawDataEntry,
    :schema_type => XSD::QName.new(NsPingdomAPI, "Report_RawDataEntry"),
    :schema_element => [
      ["checkTime", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "checkTime")]],
      ["checkState", ["Report_CheckState", XSD::QName.new(nil, "checkState")]],
      ["responseTime", ["SOAP::SOAPFloat", XSD::QName.new(nil, "responseTime")]],
      ["location", ["SOAP::SOAPString", XSD::QName.new(nil, "location")]]
    ]
  )

  LiteralRegistry.register(
    :class => Location_GetListResponse,
    :schema_type => XSD::QName.new(NsPingdomAPI, "Location_GetListResponse"),
    :schema_element => [
      ["status", ["SOAP::SOAPInt", XSD::QName.new(nil, "status")]],
      ["locationsArray", ["Location_ListArray", XSD::QName.new(nil, "locationsArray")]]
    ]
  )

  LiteralRegistry.register(
    :class => Report_GetResponseTimesResponse,
    :schema_type => XSD::QName.new(NsPingdomAPI, "Report_GetResponseTimesResponse"),
    :schema_element => [
      ["status", ["SOAP::SOAPInt", XSD::QName.new(nil, "status")]],
      ["responseTimesArray", ["Report_ResponseTimesArray", XSD::QName.new(nil, "responseTimesArray")]]
    ]
  )

  LiteralRegistry.register(
    :class => Report_GetNotificationsResponse,
    :schema_type => XSD::QName.new(NsPingdomAPI, "Report_GetNotificationsResponse"),
    :schema_element => [
      ["status", ["SOAP::SOAPInt", XSD::QName.new(nil, "status")]],
      ["getNotificationsResponseArray", ["Report_GetNotificationsResponseArray", XSD::QName.new(nil, "getNotificationsResponseArray")]]
    ]
  )

  LiteralRegistry.register(
    :class => AccountData,
    :schema_type => XSD::QName.new(NsPingdomAPI, "AccountData"),
    :schema_element => [
      ["email", ["SOAP::SOAPString", XSD::QName.new(nil, "email")]],
      ["firstName", ["SOAP::SOAPString", XSD::QName.new(nil, "firstName")]],
      ["lastName", ["SOAP::SOAPString", XSD::QName.new(nil, "lastName")]],
      ["company", ["SOAP::SOAPString", XSD::QName.new(nil, "company")]],
      ["phoneCodeCountry", ["SOAP::SOAPString", XSD::QName.new(nil, "phoneCodeCountry")]],
      ["phoneNumber", ["SOAP::SOAPString", XSD::QName.new(nil, "phoneNumber")]],
      ["cellPhoneCodeCountry", ["SOAP::SOAPString", XSD::QName.new(nil, "cellPhoneCodeCountry")]],
      ["cellPhoneNumber", ["SOAP::SOAPString", XSD::QName.new(nil, "cellPhoneNumber")]],
      ["address", ["SOAP::SOAPString", XSD::QName.new(nil, "address")]],
      ["addressTwo", ["SOAP::SOAPString", XSD::QName.new(nil, "addressTwo")]],
      ["zip", ["SOAP::SOAPString", XSD::QName.new(nil, "zip")]],
      ["city", ["SOAP::SOAPString", XSD::QName.new(nil, "city")]],
      ["state", ["SOAP::SOAPString", XSD::QName.new(nil, "state")]],
      ["countryISO", ["SOAP::SOAPString", XSD::QName.new(nil, "countryISO")]]
    ]
  )

  LiteralRegistry.register(
    :class => CreateAccountResponse,
    :schema_type => XSD::QName.new(NsPingdomAPI, "CreateAccountResponse"),
    :schema_element => [
      ["status", ["SOAP::SOAPInt", XSD::QName.new(nil, "status")]]
    ]
  )

  LiteralRegistry.register(
    :class => Report_CheckState,
    :schema_type => XSD::QName.new(NsPingdomAPI, "Report_CheckState")
  )

  LiteralRegistry.register(
    :class => Report_NotificationStatusItem,
    :schema_type => XSD::QName.new(NsPingdomAPI, "Report_NotificationStatusItem")
  )

  LiteralRegistry.register(
    :class => Report_NotificationViaItem,
    :schema_type => XSD::QName.new(NsPingdomAPI, "Report_NotificationViaItem")
  )

  LiteralRegistry.register(
    :class => Report_ResolutionEnum,
    :schema_type => XSD::QName.new(NsPingdomAPI, "Report_ResolutionEnum")
  )

  LiteralRegistry.register(
    :class => AccountType,
    :schema_type => XSD::QName.new(NsPingdomAPI, "AccountType")
  )
end
