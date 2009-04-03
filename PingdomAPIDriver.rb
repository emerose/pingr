require 'PingdomAPI.rb'
require 'PingdomAPIMappingRegistry.rb'
require 'soap/rpc/driver'

class PingdomAPISoapPort < ::SOAP::RPC::Driver
  DefaultEndpointUrl = "https://ws.pingdom.com/soap/"
  NsMethods = "urn:methods"

  Methods = [
    [ XSD::QName.new(NsMethods, "Test_echo"),
      "urn:methods#Test_echo",
      "test_echo",
      [ ["in", "inString", ["::SOAP::SOAPString"]],
        ["retval", "return", ["Test_EchoResponse", "urn:PingdomAPI", "Test_EchoResponse"]] ],
      { :request_style =>  :rpc, :request_use =>  :encoded,
        :response_style => :rpc, :response_use => :encoded,
        :faults => {} }
    ],
    [ XSD::QName.new(NsMethods, "Auth_login"),
      "urn:methods#Auth_login",
      "auth_login",
      [ ["in", "APIKey", ["::SOAP::SOAPString"]],
        ["in", "credentialsData", ["Auth_CredentialsData", "urn:PingdomAPI", "Auth_CredentialsData"]],
        ["retval", "return", ["Auth_LoginResponse", "urn:PingdomAPI", "Auth_LoginResponse"]] ],
      { :request_style =>  :rpc, :request_use =>  :encoded,
        :response_style => :rpc, :response_use => :encoded,
        :faults => {} }
    ],
    [ XSD::QName.new(NsMethods, "Auth_logout"),
      "urn:methods#Auth_logout",
      "auth_logout",
      [ ["in", "APIKey", ["::SOAP::SOAPString"]],
        ["in", "sessionId", ["::SOAP::SOAPString"]],
        ["retval", "return", ["Auth_LogoutResponse", "urn:PingdomAPI", "Auth_LogoutResponse"]] ],
      { :request_style =>  :rpc, :request_use =>  :encoded,
        :response_style => :rpc, :response_use => :encoded,
        :faults => {} }
    ],
    [ XSD::QName.new(NsMethods, "Check_getList"),
      "urn:methods#Check_getList",
      "check_getList",
      [ ["in", "APIKey", ["::SOAP::SOAPString"]],
        ["in", "sessionId", ["::SOAP::SOAPString"]],
        ["retval", "return", ["Check_GetListResponse", "urn:PingdomAPI", "Check_GetListResponse"]] ],
      { :request_style =>  :rpc, :request_use =>  :encoded,
        :response_style => :rpc, :response_use => :encoded,
        :faults => {} }
    ],
    [ XSD::QName.new(NsMethods, "Check_getCheckIdsByNames"),
      "urn:methods#Check_getCheckIdsByNames",
      "check_getCheckIdsByNames",
      [ ["in", "APIKey", ["::SOAP::SOAPString"]],
        ["in", "sessionId", ["::SOAP::SOAPString"]],
        ["in", "getCheckIdsByNamesRequest", ["Check_GetCheckIdsByNamesRequest", "urn:PingdomAPI", "Check_GetCheckIdsByNamesRequest"]],
        ["retval", "return", ["Check_GetCheckIdsByNamesResponse", "urn:PingdomAPI", "Check_GetCheckIdsByNamesResponse"]] ],
      { :request_style =>  :rpc, :request_use =>  :encoded,
        :response_style => :rpc, :response_use => :encoded,
        :faults => {} }
    ],
    [ XSD::QName.new(NsMethods, "Report_getLastDowns"),
      "urn:methods#Report_getLastDowns",
      "report_getLastDowns",
      [ ["in", "APIKey", ["::SOAP::SOAPString"]],
        ["in", "sessionId", ["::SOAP::SOAPString"]],
        ["retval", "return", ["Report_GetLastDownsResponse", "urn:PingdomAPI", "Report_GetLastDownsResponse"]] ],
      { :request_style =>  :rpc, :request_use =>  :encoded,
        :response_style => :rpc, :response_use => :encoded,
        :faults => {} }
    ],
    [ XSD::QName.new(NsMethods, "Report_getCurrentStates"),
      "urn:methods#Report_getCurrentStates",
      "report_getCurrentStates",
      [ ["in", "APIKey", ["::SOAP::SOAPString"]],
        ["in", "sessionId", ["::SOAP::SOAPString"]],
        ["retval", "return", ["Report_GetCurrentStatesResponse", "urn:PingdomAPI", "Report_GetCurrentStatesResponse"]] ],
      { :request_style =>  :rpc, :request_use =>  :encoded,
        :response_style => :rpc, :response_use => :encoded,
        :faults => {} }
    ],
    [ XSD::QName.new(NsMethods, "Report_getDowntimes"),
      "urn:methods#Report_getDowntimes",
      "report_getDowntimes",
      [ ["in", "APIKey", ["::SOAP::SOAPString"]],
        ["in", "sessionId", ["::SOAP::SOAPString"]],
        ["in", "getDowntimesRequest", ["Report_GetDowntimesRequest", "urn:PingdomAPI", "Report_GetDowntimesRequest"]],
        ["retval", "return", ["Report_GetDowntimesResponse", "urn:PingdomAPI", "Report_GetDowntimesResponse"]] ],
      { :request_style =>  :rpc, :request_use =>  :encoded,
        :response_style => :rpc, :response_use => :encoded,
        :faults => {} }
    ],
    [ XSD::QName.new(NsMethods, "Report_getDowntimesExtended"),
      "urn:methods#Report_getDowntimesExtended",
      "report_getDowntimesExtended",
      [ ["in", "APIKey", ["::SOAP::SOAPString"]],
        ["in", "sessionId", ["::SOAP::SOAPString"]],
        ["in", "getDowntimesRequest", ["Report_GetDowntimesRequest", "urn:PingdomAPI", "Report_GetDowntimesRequest"]],
        ["retval", "return", ["Report_GetDowntimesExtendedResponse", "urn:PingdomAPI", "Report_GetDowntimesExtendedResponse"]] ],
      { :request_style =>  :rpc, :request_use =>  :encoded,
        :response_style => :rpc, :response_use => :encoded,
        :faults => {} }
    ],
    [ XSD::QName.new(NsMethods, "Report_getOutages"),
      "urn:methods#Report_getOutages",
      "report_getOutages",
      [ ["in", "APIKey", ["::SOAP::SOAPString"]],
        ["in", "sessionId", ["::SOAP::SOAPString"]],
        ["in", "getOutagesRequest", ["Report_GetOutagesRequest", "urn:PingdomAPI", "Report_GetOutagesRequest"]],
        ["retval", "return", ["Report_GetOutagesResponse", "urn:PingdomAPI", "Report_GetOutagesResponse"]] ],
      { :request_style =>  :rpc, :request_use =>  :encoded,
        :response_style => :rpc, :response_use => :encoded,
        :faults => {} }
    ],
    [ XSD::QName.new(NsMethods, "Report_getRawData"),
      "urn:methods#Report_getRawData",
      "report_getRawData",
      [ ["in", "APIKey", ["::SOAP::SOAPString"]],
        ["in", "sessionId", ["::SOAP::SOAPString"]],
        ["in", "getRawDataRequest", ["Report_GetRawDataRequest", "urn:PingdomAPI", "Report_GetRawDataRequest"]],
        ["retval", "return", ["Report_GetRawDataResponse", "urn:PingdomAPI", "Report_GetRawDataResponse"]] ],
      { :request_style =>  :rpc, :request_use =>  :encoded,
        :response_style => :rpc, :response_use => :encoded,
        :faults => {} }
    ],
    [ XSD::QName.new(NsMethods, "Location_getList"),
      "urn:methods#Location_getList",
      "location_getList",
      [ ["in", "APIKey", ["::SOAP::SOAPString"]],
        ["in", "sessionId", ["::SOAP::SOAPString"]],
        ["retval", "return", ["Location_GetListResponse", "urn:PingdomAPI", "Location_GetListResponse"]] ],
      { :request_style =>  :rpc, :request_use =>  :encoded,
        :response_style => :rpc, :response_use => :encoded,
        :faults => {} }
    ],
    [ XSD::QName.new(NsMethods, "Report_getResponseTimes"),
      "urn:methods#Report_getResponseTimes",
      "report_getResponseTimes",
      [ ["in", "APIKey", ["::SOAP::SOAPString"]],
        ["in", "sessionId", ["::SOAP::SOAPString"]],
        ["in", "getResponseTimesRequest", ["Report_GetResponseTimesRequest", "urn:PingdomAPI", "Report_GetResponseTimesRequest"]],
        ["retval", "return", ["Report_GetResponseTimesResponse", "urn:PingdomAPI", "Report_GetResponseTimesResponse"]] ],
      { :request_style =>  :rpc, :request_use =>  :encoded,
        :response_style => :rpc, :response_use => :encoded,
        :faults => {} }
    ],
    [ XSD::QName.new(NsMethods, "Report_getNotifications"),
      "urn:methods#Report_getNotifications",
      "report_getNotifications",
      [ ["in", "APIKey", ["::SOAP::SOAPString"]],
        ["in", "sessionId", ["::SOAP::SOAPString"]],
        ["in", "getNotificationsRequest", ["Report_GetNotificationsRequest", "urn:PingdomAPI", "Report_GetNotificationsRequest"]],
        ["retval", "return", ["Report_GetNotificationsResponse", "urn:PingdomAPI", "Report_GetNotificationsResponse"]] ],
      { :request_style =>  :rpc, :request_use =>  :encoded,
        :response_style => :rpc, :response_use => :encoded,
        :faults => {} }
    ],
    [ XSD::QName.new(NsMethods, "createAccount"),
      "urn:methods#createAccount",
      "createAccount",
      [ ["in", "APIKey", ["::SOAP::SOAPString"]],
        ["in", "accountData", ["AccountData", "urn:PingdomAPI", "AccountData"]],
        ["in", "accountType", [nil, "urn:PingdomAPI", "AccountType"]],
        ["retval", "return", ["CreateAccountResponse", "urn:PingdomAPI", "CreateAccountResponse"]] ],
      { :request_style =>  :rpc, :request_use =>  :encoded,
        :response_style => :rpc, :response_use => :encoded,
        :faults => {} }
    ]
  ]

  def initialize(endpoint_url = nil)
    endpoint_url ||= DefaultEndpointUrl
    super(endpoint_url, nil)
    self.mapping_registry = PingdomAPIMappingRegistry::EncodedRegistry
    self.literal_mapping_registry = PingdomAPIMappingRegistry::LiteralRegistry
    init_methods
  end

private

  def init_methods
    Methods.each do |definitions|
      opt = definitions.last
      if opt[:request_style] == :document
        add_document_operation(*definitions)
      else
        add_rpc_operation(*definitions)
        qname = definitions[0]
        name = definitions[2]
        if qname.name != name and qname.name.capitalize == name.capitalize
          ::SOAP::Mapping.define_singleton_method(self, qname.name) do |*arg|
            __send__(name, *arg)
          end
        end
      end
    end
  end
end

