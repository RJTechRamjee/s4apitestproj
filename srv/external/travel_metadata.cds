/* checksum : 61df920c2e8e18eb71dcd2f2ff0f6e71 */
@cds.external : true
@m.IsDefaultEntityContainer : 'true'
@sap.message.scope.supported : 'true'
@sap.supported.formats : 'atom json xlsx pdf'
service travel_metadata {
  @cds.external : true
  @cds.persistence.skip : true
  @sap.deletable : 'false'
  @sap.searchable : 'true'
  @sap.content.version : '1'
  @sap.updatable.path : 'Update_mc'
  @sap.label : 'Booking projection view'
  entity Booking {
    @sap.display.format : 'NonNegative'
    @sap.label : 'Travel ID'
    @sap.quickinfo : 'Flight Reference Scenario: Travel ID'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    key TravelID : String(8) not null;
    @sap.display.format : 'NonNegative'
    @sap.label : 'Booking Number'
    @sap.quickinfo : 'Flight Reference Scenario: Booking ID'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    key BookingID : String(4) not null;
    @sap.label : 'Dyn. Method Control'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Update_mc : Boolean;
    @sap.label : 'Dynamic CbA-Control'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    to_BookSupplement_oc : Boolean;
    @sap.display.format : 'Date'
    @sap.label : 'Booking Date'
    @sap.quickinfo : 'Flight Reference Scenario: Booking Date'
    @sap.updatable : 'false'
    BookingDate : Date not null;
    @sap.display.format : 'NonNegative'
    @sap.text : 'CustomerName'
    @sap.label : 'Customer ID'
    @sap.quickinfo : 'Flight Reference Scenario: Customer ID'
    @sap.updatable : 'false'
    @sap.value.list : 'standard'
    CustomerID : String(6) not null;
    @sap.label : 'Last Name'
    @sap.quickinfo : 'Flight Reference Scenario: Last Name'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    CustomerName : String(40);
    @sap.display.format : 'UpperCase'
    @sap.text : 'CarrierName'
    @sap.label : 'Airline ID'
    @sap.quickinfo : 'Flight Reference Scenario: Carrier ID'
    @sap.value.list : 'standard'
    CarrierID : String(3);
    @sap.label : 'Airline Name'
    @sap.quickinfo : 'Flight Reference Scenario: Carrier Name'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    CarrierName : String(40);
    @sap.display.format : 'NonNegative'
    @sap.label : 'Flight Number'
    @sap.quickinfo : 'Flight Reference Scenario: Connection ID'
    @sap.value.list : 'standard'
    ConnectionID : String(4);
    @sap.display.format : 'Date'
    @sap.label : 'Flight Date'
    @sap.quickinfo : 'Flight Reference Scenario: Flight Date'
    @sap.value.list : 'standard'
    FlightDate : Date;
    @sap.unit : 'CurrencyCode'
    @sap.variable.scale : 'true'
    @sap.label : 'Flight Price'
    @sap.quickinfo : 'Flight Reference Scenario: Flight Price'
    FlightPrice : Decimal(16, 3);
    @sap.label : 'Currency Code'
    @sap.quickinfo : 'Flight Reference Scenario: Currency Code'
    @sap.value.list : 'standard'
    @sap.semantics : 'currency-code'
    CurrencyCode : String(5);
    @sap.display.format : 'UpperCase'
    @sap.text : 'BookingStatusText'
    @sap.label : 'Booking Status'
    @sap.quickinfo : 'Flight Reference Scenario: Travel Status'
    @sap.value.list : 'fixed-values'
    BookingStatus : String(1);
    @sap.label : 'Booking Status'
    @sap.quickinfo : 'Overall Status Text'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    BookingStatusText : String(1024);
    @odata.Type : 'Edm.DateTimeOffset'
    @odata.Precision : 7
    @sap.label : 'Changed On'
    @sap.quickinfo : 'Local Instance Last Change Date Time'
    LastChangedAt : Timestamp;
    to_BookingStatus : Association to BookingStatus {  };
    to_BookSupplement : Composition of many BookingSupplement {  };
    to_Travel : Association to Travel {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.deletable : 'false'
  @sap.searchable : 'true'
  @sap.content.version : '1'
  @sap.updatable.path : 'Update_mc'
  @sap.label : 'Booking supplement projection view'
  entity BookingSupplement {
    @sap.display.format : 'NonNegative'
    @sap.label : 'Travel ID'
    @sap.quickinfo : 'Flight Reference Scenario: Travel ID'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    key TravelID : String(8) not null;
    @sap.display.format : 'NonNegative'
    @sap.label : 'Booking Number'
    @sap.quickinfo : 'Flight Reference Scenario: Booking ID'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    key BookingID : String(4) not null;
    @sap.display.format : 'NonNegative'
    @sap.label : 'Book. Supp. Number'
    @sap.quickinfo : 'Flight Reference Scenario: Booking Supplement ID'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    key BookingSupplementID : String(2) not null;
    @sap.label : 'Dyn. Method Control'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Update_mc : Boolean;
    @sap.display.format : 'UpperCase'
    @sap.text : 'SupplementDescription'
    @sap.label : 'Product ID'
    @sap.quickinfo : 'Flight Reference Scenario: Supplement ID'
    @sap.value.list : 'standard'
    SupplementID : String(10);
    @sap.label : 'Product Name'
    @sap.quickinfo : 'Flight Reference Scenario: Supplement Description'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    SupplementDescription : String(1024);
    @sap.unit : 'CurrencyCode'
    @sap.variable.scale : 'true'
    @sap.label : 'Product Price'
    @sap.quickinfo : 'Flight Reference Scenario: Supplement Price'
    Price : Decimal(16, 3);
    @sap.label : 'Currency Code'
    @sap.quickinfo : 'Flight Reference Scenario: Currency Code'
    @sap.value.list : 'standard'
    @sap.semantics : 'currency-code'
    CurrencyCode : String(5);
    @odata.Type : 'Edm.DateTimeOffset'
    @odata.Precision : 7
    @sap.label : 'Changed On'
    @sap.quickinfo : 'Local Instance Last Change Date Time'
    LastChangedAt : Timestamp;
    to_Booking : Association to Booking {  };
    to_Travel : Association to Travel {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.searchable : 'true'
  @sap.content.version : '1'
  @sap.deletable.path : 'Delete_mc'
  @sap.updatable.path : 'Update_mc'
  @sap.label : 'Travel projection view'
  entity Travel {
    @sap.display.format : 'NonNegative'
    @sap.label : 'Travel ID'
    @sap.quickinfo : 'Flight Reference Scenario: Travel ID'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    key TravelID : String(8) not null;
    @sap.label : 'Dyn. Action Control'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    copyTravel_ac : Boolean;
    @sap.label : 'Dyn. Method Control'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Delete_mc : Boolean;
    @sap.label : 'Dyn. Method Control'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Update_mc : Boolean;
    @sap.label : 'Dynamic CbA-Control'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    to_Booking_oc : Boolean;
    @sap.display.format : 'NonNegative'
    @sap.text : 'AgencyName'
    @sap.label : 'Agency ID'
    @sap.quickinfo : 'Flight Reference Scenario: Agency ID'
    @sap.value.list : 'standard'
    AgencyID : String(6);
    @sap.label : 'Agency Name'
    @sap.quickinfo : 'Flight Reference Scenario: Agency Name'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    AgencyName : String(80);
    @sap.display.format : 'NonNegative'
    @sap.text : 'CustomerName'
    @sap.label : 'Customer ID'
    @sap.quickinfo : 'Flight Reference Scenario: Customer ID'
    @sap.value.list : 'standard'
    CustomerID : String(6);
    @sap.label : 'Last Name'
    @sap.quickinfo : 'Flight Reference Scenario: Last Name'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    CustomerName : String(40);
    @sap.display.format : 'Date'
    @sap.label : 'Starting Date'
    @sap.quickinfo : 'Flight Reference Scenario: Start Date'
    BeginDate : Date;
    @sap.display.format : 'Date'
    @sap.label : 'End Date'
    @sap.quickinfo : 'Flight Reference Scenario: End Date'
    EndDate : Date;
    @sap.unit : 'CurrencyCode'
    @sap.variable.scale : 'true'
    @sap.label : 'Booking Fee'
    @sap.quickinfo : 'Flight Reference Scenario: Booking Fee'
    BookingFee : Decimal(16, 3);
    @sap.unit : 'CurrencyCode'
    @sap.variable.scale : 'true'
    @sap.label : 'Total Price'
    @sap.quickinfo : 'Flight Reference Scenario: Total Price'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    TotalPrice : Decimal(16, 3);
    @sap.label : 'Currency Code'
    @sap.quickinfo : 'Flight Reference Scenario: Currency Code'
    @sap.value.list : 'standard'
    @sap.semantics : 'currency-code'
    CurrencyCode : String(5);
    @sap.display.format : 'UpperCase'
    @sap.text : 'OverallStatusText'
    @sap.label : 'Overall Status'
    @sap.quickinfo : 'Flight Reference Scenario: Travel Status'
    @sap.value.list : 'fixed-values'
    OverallStatus : String(1);
    @sap.label : 'Overall Status'
    @sap.quickinfo : 'Overall Status Text'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    OverallStatusText : String(1024);
    @sap.label : 'Description'
    @sap.quickinfo : 'Flight Reference Scenario: Description'
    Description : String(1024);
    @odata.Type : 'Edm.DateTimeOffset'
    @odata.Precision : 7
    @sap.label : 'Changed On'
    @sap.quickinfo : 'Local Instance Last Change Date Time'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    LastChangedAt : Timestamp;
    to_Booking : Composition of many Booking {  };
    to_OverallStatus : Association to OverallStatus {  };
  } actions {
    action copyTravel() returns Travel;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.deletable : 'false'
  @sap.searchable : 'true'
  @sap.content.version : '1'
  @sap.label : 'Agency ValueHelp'
  @sap.value.list : 'true'
  entity TravelAgency {
    @sap.display.format : 'NonNegative'
    @sap.text : 'Name'
    @sap.label : 'Agency ID'
    @sap.quickinfo : 'Flight Reference Scenario: Agency ID'
    key AgencyID : String(6) not null;
    @sap.label : 'Agency Name'
    @sap.quickinfo : 'Flight Reference Scenario: Agency Name'
    Name : String(80);
    @sap.label : 'Street'
    @sap.quickinfo : 'Flight Reference Scenario: Street'
    Street : String(60);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Postal Code'
    @sap.quickinfo : 'Flight Reference Scenario: Postal Code'
    PostalCode : String(10);
    @sap.label : 'City'
    @sap.quickinfo : 'Flight Reference Scenario: City'
    City : String(40);
    @sap.display.format : 'UpperCase'
    @sap.text : 'CountryCodeText'
    @sap.label : 'Country/Region Key'
    @sap.value.list : 'standard'
    CountryCode : String(3);
    @sap.label : 'Country/Region Name'
    CountryCodeText : String(50);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Phone No.'
    @sap.quickinfo : 'Flight Reference Scenario: Phone Number'
    @sap.semantics : 'tel'
    PhoneNumber : String(30);
    @sap.label : 'E-Mail Address'
    @sap.quickinfo : 'Flight Reference Scenario: Email Address'
    @sap.semantics : 'email'
    EMailAddress : String(256);
    @sap.label : 'Web Address'
    @sap.quickinfo : 'Flight Reference Scenario: Web Address'
    WebAddress : String(256);
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.deletable : 'false'
  @sap.searchable : 'true'
  @sap.content.version : '1'
  @sap.label : 'Airport ValueHelp'
  @sap.value.list : 'true'
  entity Airport {
    @sap.display.format : 'UpperCase'
    @sap.text : 'Name'
    @sap.label : 'Airport ID'
    @sap.quickinfo : 'Flight Reference Scenario: Airport ID'
    key AirportID : String(3) not null;
    @sap.label : 'Airport Name'
    @sap.quickinfo : 'Flight Reference Scenario: Airport Name'
    Name : String(40);
    @sap.label : 'City'
    @sap.quickinfo : 'Flight Reference Scenario: City'
    City : String(40);
    @sap.display.format : 'UpperCase'
    @sap.text : 'CountryCodeText'
    @sap.label : 'Country/Region Key'
    @sap.value.list : 'standard'
    CountryCode : String(3);
    @sap.label : 'Country/Region Name'
    CountryCodeText : String(50);
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.deletable : 'false'
  @sap.content.version : '1'
  @sap.label : 'Booking Status Value Help'
  entity BookingStatus {
    @sap.display.format : 'UpperCase'
    @sap.text : 'BookingStatus_Text'
    @sap.label : 'Booking Status'
    @sap.quickinfo : 'Flight Reference Scenario: Travel Status'
    key BookingStatus : String(1) not null;
    @sap.label : 'Booking Status'
    @sap.quickinfo : 'Overall Status Text'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    BookingStatus_Text : String(1024);
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.deletable : 'false'
  @sap.searchable : 'true'
  @sap.content.version : '1'
  @sap.label : 'Carrier ValueHelp'
  @sap.value.list : 'true'
  entity Airline {
    @sap.display.format : 'UpperCase'
    @sap.text : 'Name'
    @sap.label : 'Airline ID'
    @sap.quickinfo : 'Flight Reference Scenario: Carrier ID'
    key AirlineID : String(3) not null;
    @sap.label : 'Airline Name'
    @sap.quickinfo : 'Flight Reference Scenario: Carrier Name'
    Name : String(40);
    @sap.text : 'CurrencyName'
    @sap.label : 'Currency Code'
    @sap.quickinfo : 'Flight Reference Scenario: Currency Code'
    @sap.semantics : 'currency-code'
    CurrencyCode : String(5);
    @sap.label : 'Description'
    CurrencyName : String(40);
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.deletable : 'false'
  @sap.searchable : 'true'
  @sap.content.version : '1'
  @sap.label : 'Connection ValueHelp'
  @sap.value.list : 'true'
  entity FlightConnection {
    @sap.display.format : 'UpperCase'
    @sap.text : 'AirlineName'
    @sap.label : 'Airline ID'
    @sap.quickinfo : 'Flight Reference Scenario: Carrier ID'
    @sap.value.list : 'standard'
    key AirlineID : String(3) not null;
    @sap.display.format : 'NonNegative'
    @sap.label : 'Flight Number'
    @sap.quickinfo : 'Flight Reference Scenario: Connection ID'
    key ConnectionID : String(4) not null;
    @sap.label : 'Airline Name'
    @sap.quickinfo : 'Flight Reference Scenario: Carrier Name'
    AirlineName : String(40);
    @sap.display.format : 'UpperCase'
    @sap.text : 'DepartureAirportName'
    @sap.label : 'Departure Airport'
    @sap.quickinfo : 'Flight Reference Scenario: From Airport'
    @sap.value.list : 'standard'
    DepartureAirport : String(3);
    @sap.label : 'Airport Name'
    @sap.quickinfo : 'Flight Reference Scenario: Airport Name'
    DepartureAirportName : String(40);
    @sap.display.format : 'UpperCase'
    @sap.text : 'DestinationAirportName'
    @sap.label : 'Destination Airport'
    @sap.quickinfo : 'Flight Reference Scenario: To Airport'
    @sap.value.list : 'standard'
    DestinationAirport : String(3);
    @sap.label : 'Airport Name'
    @sap.quickinfo : 'Flight Reference Scenario: Airport Name'
    DestinationAirportName : String(40);
    @sap.label : 'Departure'
    @sap.quickinfo : 'Flight Reference Scenario: Departure Time'
    DepartureTime : Time;
    @sap.label : 'Arrival'
    @sap.quickinfo : 'Flight Reference Scenario: Arrival Time'
    ArrivalTime : Time;
    @sap.label : 'Flight Distance'
    @sap.quickinfo : 'Flight Reference Scenario: Flight Distance'
    Distance : Integer;
    @sap.label : 'Internal UoM'
    @sap.quickinfo : 'Unit of Measurement'
    @sap.semantics : 'unit-of-measure'
    DistanceUnit : String(3);
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.deletable : 'false'
  @sap.searchable : 'true'
  @sap.content.version : '1'
  @sap.label : 'Customer ValueHelp'
  @sap.value.list : 'true'
  entity Passenger {
    @sap.display.format : 'NonNegative'
    @sap.text : 'LastName'
    @sap.label : 'Customer ID'
    @sap.quickinfo : 'Flight Reference Scenario: Customer ID'
    key CustomerID : String(6) not null;
    @sap.label : 'First Name'
    @sap.quickinfo : 'Flight Reference Scenario: First Name'
    FirstName : String(40);
    @sap.label : 'Last Name'
    @sap.quickinfo : 'Flight Reference Scenario: Last Name'
    LastName : String(40);
    @sap.label : 'Title'
    @sap.quickinfo : 'Flight Reference Scenario: Title'
    Title : String(10);
    @sap.label : 'Street'
    @sap.quickinfo : 'Flight Reference Scenario: Street'
    Street : String(60);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Postal Code'
    @sap.quickinfo : 'Flight Reference Scenario: Postal Code'
    PostalCode : String(10);
    @sap.label : 'City'
    @sap.quickinfo : 'Flight Reference Scenario: City'
    City : String(40);
    @sap.display.format : 'UpperCase'
    @sap.text : 'CountryCodeText'
    @sap.label : 'Country/Region Key'
    @sap.value.list : 'standard'
    CountryCode : String(3);
    @sap.label : 'Country/Region Name'
    CountryCodeText : String(50);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Phone No.'
    @sap.quickinfo : 'Flight Reference Scenario: Phone Number'
    @sap.semantics : 'tel'
    PhoneNumber : String(30);
    @sap.label : 'E-Mail Address'
    @sap.quickinfo : 'Flight Reference Scenario: Email Address'
    @sap.semantics : 'email'
    EMailAddress : String(256);
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.deletable : 'false'
  @sap.searchable : 'true'
  @sap.content.version : '1'
  @sap.label : 'Flight ValueHelp'
  @sap.value.list : 'true'
  entity Flight {
    @sap.display.format : 'UpperCase'
    @sap.text : 'AirlineName'
    @sap.label : 'Airline ID'
    @sap.quickinfo : 'Flight Reference Scenario: Carrier ID'
    @sap.value.list : 'standard'
    key AirlineID : String(3) not null;
    @sap.display.format : 'NonNegative'
    @sap.label : 'Flight Number'
    @sap.quickinfo : 'Flight Reference Scenario: Connection ID'
    @sap.value.list : 'standard'
    key ConnectionID : String(4) not null;
    @sap.display.format : 'Date'
    @sap.label : 'Flight Date'
    @sap.quickinfo : 'Flight Reference Scenario: Flight Date'
    key FlightDate : Date not null;
    @sap.unit : 'CurrencyCode'
    @sap.variable.scale : 'true'
    @sap.label : 'Flight Price'
    @sap.quickinfo : 'Flight Reference Scenario: Flight Price'
    Price : Decimal(16, 3);
    @sap.label : 'Currency Code'
    @sap.quickinfo : 'Flight Reference Scenario: Currency Code'
    @sap.semantics : 'currency-code'
    CurrencyCode : String(5);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Plane Type'
    @sap.quickinfo : 'Flight Reference Scenario: Plane Type ID'
    PlaneType : String(10);
    @sap.label : 'Maximum Capacity'
    @sap.quickinfo : 'Flight Reference Scenario: Plane Seats Max'
    MaximumSeats : Integer;
    @sap.label : 'Occupied Seats'
    @sap.quickinfo : 'Flight Reference Scenario: Plane Seats Occupied'
    OccupiedSeats : Integer;
    @sap.label : 'Airline Name'
    @sap.quickinfo : 'Flight Reference Scenario: Carrier Name'
    AirlineName : String(40);
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.deletable : 'false'
  @sap.content.version : '1'
  @sap.label : 'Overall Status Value Help'
  entity OverallStatus {
    @sap.display.format : 'UpperCase'
    @sap.text : 'OverallStatus_Text'
    @sap.label : 'Overall Status'
    @sap.quickinfo : 'Flight Reference Scenario: Travel Status'
    key OverallStatus : String(1) not null;
    @sap.label : 'Overall Status'
    @sap.quickinfo : 'Overall Status Text'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    OverallStatus_Text : String(1024);
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.deletable : 'false'
  @sap.content.version : '1'
  @sap.label : 'Supplement Category Value Help'
  @sap.value.list : 'true'
  entity SupplementCategory {
    @sap.display.format : 'UpperCase'
    @sap.text : 'SupplementCategory_Text'
    @sap.label : 'Supplement Category'
    @sap.quickinfo : 'Supplement Type'
    key SupplementCategory : String(2) not null;
    @sap.label : 'Product Name'
    @sap.quickinfo : 'Flight Reference Scenario: Supplement Description'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    SupplementCategory_Text : String(1024);
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.deletable : 'false'
  @sap.searchable : 'true'
  @sap.content.version : '1'
  @sap.label : 'Supplement ValueHelp'
  @sap.value.list : 'true'
  entity Supplement {
    @sap.display.format : 'UpperCase'
    @sap.text : 'SupplementText'
    @sap.label : 'Product ID'
    @sap.quickinfo : 'Flight Reference Scenario: Supplement ID'
    key SupplementID : String(10) not null;
    @sap.label : 'Product Name'
    @sap.quickinfo : 'Flight Reference Scenario: Supplement Description'
    SupplementText : String(1024);
    @sap.display.format : 'UpperCase'
    @sap.text : 'SupplementCategoryText'
    @sap.label : 'Supplement Category'
    @sap.quickinfo : 'Supplement Type'
    @sap.value.list : 'fixed-values'
    SupplementCategory : String(2);
    @sap.label : 'Product Name'
    @sap.quickinfo : 'Flight Reference Scenario: Supplement Description'
    SupplementCategoryText : String(1024);
    @sap.unit : 'CurrencyCode'
    @sap.variable.scale : 'true'
    @sap.label : 'Product Price'
    @sap.quickinfo : 'Flight Reference Scenario: Supplement Price'
    Price : Decimal(16, 3);
    @sap.label : 'Currency Code'
    @sap.quickinfo : 'Flight Reference Scenario: Currency Code'
    @sap.semantics : 'currency-code'
    CurrencyCode : String(5);
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.deletable : 'false'
  @sap.searchable : 'true'
  @sap.content.version : '1'
  @sap.label : 'Country/Region'
  @sap.value.list : 'true'
  entity Country {
    @sap.display.format : 'UpperCase'
    @sap.text : 'Country_Text'
    @sap.label : 'Country/Region Key'
    key Country : String(3) not null;
    @sap.label : 'Country/Region Name'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    Country_Text : String(50);
    @sap.label : 'Country/Region Name'
    Description : String(50);
    @sap.display.format : 'UpperCase'
    @sap.label : 'ISO Code 3 Char'
    @sap.quickinfo : 'ISO Country/Region Code 3 Characters'
    CountryThreeLetterISOCode : String(3);
    @sap.display.format : 'NonNegative'
    @sap.label : 'ISO Code Num. 3'
    @sap.quickinfo : 'ISO Country/Region Code Numeric 3-Characters'
    CountryThreeDigitISOCode : String(3);
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.deletable : 'false'
  @sap.searchable : 'true'
  @sap.content.version : '1'
  @sap.label : 'Currency'
  @sap.value.list : 'true'
  entity Currency {
    @sap.display.format : 'UpperCase'
    @sap.text : 'Currency_Text'
    @sap.label : 'Currency'
    @sap.quickinfo : 'Currency Key'
    @sap.semantics : 'currency-code'
    key Currency : String(5) not null;
    @sap.label : 'Description'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    Currency_Text : String(40);
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity SAP__Currencies {
    @sap.label : 'Currency'
    @sap.semantics : 'currency-code'
    key CurrencyCode : String(5) not null;
    @sap.label : 'ISO code'
    ISOCode : String(3) not null;
    @sap.label : 'Short text'
    Text : String(15) not null;
    @odata.Type : 'Edm.Byte'
    @sap.label : 'Decimals'
    DecimalPlaces : Integer not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity SAP__UnitsOfMeasure {
    @sap.label : 'Internal UoM'
    @sap.semantics : 'unit-of-measure'
    key UnitCode : String(3) not null;
    @sap.label : 'ISO Code'
    ISOCode : String(3) not null;
    @sap.label : 'Commercial'
    ExternalCode : String(3) not null;
    @sap.label : 'Meas. Unit Text'
    Text : String(30) not null;
    @sap.label : 'Decimal Places'
    DecimalPlaces : Integer;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity SAP__MyDocumentDescriptions {
    @sap.label : 'UUID'
    key Id : UUID not null;
    CreatedBy : String(12) not null;
    @odata.Type : 'Edm.DateTime'
    @sap.label : 'Time Stamp'
    CreatedAt : DateTime not null;
    FileName : String(256) not null;
    Title : String(256) not null;
    Format : Association to SAP__FormatSet {  };
    TableColumns : Association to many SAP__TableColumnsSet {  };
    CoverPage : Association to many SAP__CoverPageSet {  };
    Signature : Association to SAP__SignatureSet {  };
    PDFStandard : Association to SAP__PDFStandardSet {  };
    Hierarchy : Association to SAP__HierarchySet {  };
    Header : Association to SAP__PDFHeaderSet {  };
    Footer : Association to SAP__PDFFooterSet {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.deletable : 'false'
  @sap.pageable : 'false'
  @sap.addressable : 'false'
  @sap.content.version : '1'
  entity SAP__FormatSet {
    @sap.label : 'UUID'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key Id : UUID not null;
    FitToPage : SAP__FitToPage not null;
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    FontSize : Integer not null;
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Orientation : String(10) not null;
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    PaperSize : String(10) not null;
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    BorderSize : Integer not null;
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    MarginSize : Integer not null;
    @sap.label : 'Font Name'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    FontName : String(255) not null;
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Padding : Integer not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.deletable : 'false'
  @sap.pageable : 'false'
  @sap.addressable : 'false'
  @sap.content.version : '1'
  entity SAP__PDFStandardSet {
    @sap.label : 'UUID'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key Id : UUID not null;
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    UsePDFAConformance : Boolean not null;
    @sap.label : 'Indicator'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    DoEnableAccessibility : Boolean not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.deletable : 'false'
  @sap.pageable : 'false'
  @sap.addressable : 'false'
  @sap.content.version : '1'
  entity SAP__TableColumnsSet {
    @sap.label : 'UUID'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key Id : UUID not null;
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key Name : String(256) not null;
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key Header : String(256) not null;
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    HorizontalAlignment : String(10) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.deletable : 'false'
  @sap.pageable : 'false'
  @sap.addressable : 'false'
  @sap.content.version : '1'
  entity SAP__CoverPageSet {
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key Title : String(256) not null;
    @sap.label : 'UUID'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key Id : UUID not null;
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key Name : String(256) not null;
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Value : String(256) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.deletable : 'false'
  @sap.pageable : 'false'
  @sap.addressable : 'false'
  @sap.content.version : '1'
  entity SAP__SignatureSet {
    @sap.label : 'UUID'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key Id : UUID not null;
    @sap.label : 'Indicator'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    DoSign : Boolean not null;
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Reason : String(256) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.deletable : 'false'
  @sap.pageable : 'false'
  @sap.addressable : 'false'
  @sap.content.version : '1'
  entity SAP__HierarchySet {
    @sap.label : 'UUID'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key Id : UUID not null;
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    DistanceFromRootElement : String(256) not null;
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    DrillStateElement : String(256) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.deletable : 'false'
  @sap.pageable : 'false'
  @sap.addressable : 'false'
  @sap.content.version : '1'
  entity SAP__PDFHeaderSet {
    @sap.label : 'UUID'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key Id : UUID not null;
    Right : SAP__HeaderFooterField not null;
    Left : SAP__HeaderFooterField not null;
    Center : SAP__HeaderFooterField not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.deletable : 'false'
  @sap.pageable : 'false'
  @sap.addressable : 'false'
  @sap.content.version : '1'
  entity SAP__PDFFooterSet {
    @sap.label : 'UUID'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key Id : UUID not null;
    Right : SAP__HeaderFooterField not null;
    Left : SAP__HeaderFooterField not null;
    Center : SAP__HeaderFooterField not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity SAP__ValueHelpSet {
    key VALUEHELP : String not null;
    FIELD_VALUE : String(10) not null;
    DESCRIPTION : String;
  };

  @cds.external : true
  type SAP__FitToPage {
    @sap.label : 'Error behavior'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ErrorRecoveryBehavior : String(8) not null;
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    IsEnabled : Boolean not null;
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    MinimumFontSize : Integer not null;
  };

  @cds.external : true
  type SAP__HeaderFooterField {
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Type : String(256) not null;
  };
};

