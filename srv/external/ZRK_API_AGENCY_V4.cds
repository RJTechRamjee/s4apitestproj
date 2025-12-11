/* checksum : 007d0e38da1fe0eb35ffa87c5047551e */
@cds.external : true
@Aggregation.ApplySupported.Transformations : [ 'aggregate', 'groupby', 'filter' ]
@Aggregation.ApplySupported.Rollup : #None
@Common.ApplyMultiUnitBehaviorForSortingAndFiltering : true
@Capabilities.FilterFunctions : [
  'eq',
  'ne',
  'gt',
  'ge',
  'lt',
  'le',
  'and',
  'or',
  'contains',
  'startswith',
  'endswith',
  'any',
  'all'
]
@Capabilities.SupportedFormats : [ 'application/json', 'application/pdf' ]
@PDF.Features.DocumentDescriptionReference : '../../../../default/iwbep/common/0001/$metadata'
@PDF.Features.DocumentDescriptionCollection : 'MyDocumentDescriptions'
@PDF.Features.ArchiveFormat : true
@PDF.Features.Border : true
@PDF.Features.CoverPage : true
@PDF.Features.FitToPage : true
@PDF.Features.FontName : true
@PDF.Features.FontSize : true
@PDF.Features.Margin : true
@PDF.Features.Padding : true
@PDF.Features.Signature : true
@PDF.Features.HeaderFooter : true
@PDF.Features.ResultSizeDefault : 20000
@PDF.Features.ResultSizeMaximum : 20000
@Capabilities.KeyAsSegmentSupported : true
@Capabilities.AsynchronousRequestsSupported : true
service ZRK_API_AGENCY_V4 {
  @cds.external : true
  type SAP__Message {
    code : String not null;
    message : String not null;
    target : String;
    additionalTargets : many String not null;
    transition : Boolean not null;
    @odata.Type : 'Edm.Byte'
    numericSeverity : Integer not null;
    longtextUrl : String;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @Common.Label : 'Agency'
  @Common.SemanticKey : [ 'AgencyID' ]
  @Communication.Contact.org : Name
  @Communication.Contact.adr : [
    {
      type: #preferred,
      locality: City,
      street: Street,
      country: CountryCode,
      code: PostalCode
    }
  ]
  @Communication.Contact.tel : [ { type: #work, uri: PhoneNumber } ]
  @Communication.Contact.email : [ { address: EMailAddress } ]
  @Communication.Address#pref.type : #preferred
  @Communication.Address#pref.locality : City
  @Communication.Address#pref.street : Street
  @Communication.Address#pref.country : CountryCode
  @Communication.Address#pref.code : PostalCode
  @Common.Messages : SAP__Messages
  @Capabilities.NavigationRestrictions.RestrictedProperties : [
    {
      NavigationProperty: xDMOxZZ_ReviewZAG,
      InsertRestrictions: { Insertable: true }
    }
  ]
  @Common.DraftRoot.DiscardAction : 'ZRK_API_AGENCY_V4.Discard'
  @Common.DraftRoot.ActivationAction : 'ZRK_API_AGENCY_V4.Activate'
  @Common.DraftRoot.AdditionalNewActions : [ 'ZRK_API_AGENCY_V4.xDMOxcreateFromTemplate' ]
  @Common.DraftRoot.PreparationAction : 'ZRK_API_AGENCY_V4.Prepare'
  @Common.DraftRoot.EditAction : 'ZRK_API_AGENCY_V4.Edit'
  @Capabilities.SearchRestrictions.Searchable : true
  @Capabilities.SearchRestrictions.UnsupportedExpressions : #phrase
  @Capabilities.FilterRestrictions.Filterable : true
  @Capabilities.FilterRestrictions.FilterExpressionRestrictions : [
    { Property: EMailAddress, AllowedExpressions: 'SearchExpression' },
    { Property: WebAddress, AllowedExpressions: 'SearchExpression' },
    {
      Property: DraftEntityCreationDateTime,
      AllowedExpressions: 'SingleRange'
    },
    {
      Property: DraftEntityLastChangeDateTime,
      AllowedExpressions: 'SingleRange'
    }
  ]
  @Capabilities.SortRestrictions.NonSortableProperties : [ 'EMailAddress', 'WebAddress' ]
  @Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
  entity Agency {
    @Common.Text : Name
    @Core.Computed : true
    @Common.IsDigitSequence : true
    @Common.Label : 'Agency ID'
    @Common.QuickInfo : 'Flight Reference Scenario: Agency ID'
    key AgencyID : String(6) not null;
    @Common.FieldControl : #Mandatory
    @Common.Label : 'Agency Name'
    @Common.Heading : 'Agency'
    @Common.QuickInfo : 'Flight Reference Scenario: Agency Name'
    Name : String(80) not null;
    @Common.Label : 'Street'
    @Common.QuickInfo : 'Flight Reference Scenario: Street'
    Street : String(60) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Postal Code'
    @Common.QuickInfo : 'Flight Reference Scenario: Postal Code'
    PostalCode : String(10) not null;
    @Common.Label : 'City'
    @Common.QuickInfo : 'Flight Reference Scenario: City'
    City : String(40) not null;
    @Common.Text : CountryName
    @Common.FieldControl : #Mandatory
    @Common.IsUpperCase : true
    @Common.Label : 'Country/Region Key'
    @Common.Heading : 'C/R'
    CountryCode : String(3) not null;
    @Core.Computed : true
    @Common.Label : 'Country/Region Name'
    CountryName : String(50) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Phone No.'
    @Common.Heading : 'Phone Number'
    @Common.QuickInfo : 'Flight Reference Scenario: Phone Number'
    PhoneNumber : String(30) not null;
    @Common.FieldControl : #Mandatory
    @Common.Label : 'E-Mail Address'
    @Common.Heading : 'E-Mail'
    @Common.QuickInfo : 'Flight Reference Scenario: Email Address'
    EMailAddress : String(256) not null;
    @Common.Label : 'Web Address'
    @Common.QuickInfo : 'Flight Reference Scenario: Web Address'
    WebAddress : String(256) not null;
    @Core.MediaType : MimeType
    @odata.Type : 'Edm.Stream'
    @Core.ContentDisposition.Filename : Filename
    @Common.Label : 'Attachment'
    Attachment : LargeBinary;
    @Core.IsMediaType : true
    @Common.Label : 'Mime Type'
    @Common.QuickInfo : 'MimeType'
    MimeType : String(128) not null;
    @Common.Label : 'Filename'
    Filename : String(128) not null;
    @odata.Precision : 7
    @odata.Type : 'Edm.DateTimeOffset'
    @Common.Label : 'Changed On'
    @Common.QuickInfo : 'Local Instance Last Change Date Time'
    LocalLastChangedAt : Timestamp;
    @Core.Computed : true
    xDMOxZZAverageRatingZAG : Decimal(2, 1) not null;
    @Common.Label : 'Slogan'
    @Common.QuickInfo : 'Agency Slogan: Slogan'
    xDMOxZZSloganZAG : String(255) not null;
    @Core.Computed : true
    @UI.HiddenFilter : true
    @Common.Label : 'Has Draft'
    @Common.QuickInfo : 'Draft - Indicator - Has draft document'
    HasDraftEntity : Boolean not null;
    @Core.Computed : true
    @UI.HiddenFilter : true
    @Common.Label : 'Key'
    @Common.QuickInfo : 'UUID serving as key (parent key, root key)'
    key DraftUUID : UUID not null;
    @odata.Precision : 7
    @odata.Type : 'Edm.DateTimeOffset'
    @Core.Computed : true
    @UI.HiddenFilter : true
    @Common.Label : 'Draft Created On'
    DraftEntityCreationDateTime : Timestamp;
    @odata.Precision : 7
    @odata.Type : 'Edm.DateTimeOffset'
    @Core.Computed : true
    @UI.HiddenFilter : true
    @Common.Label : 'Draft Last Changed On'
    DraftEntityLastChangeDateTime : Timestamp;
    @Core.Computed : true
    @UI.HiddenFilter : true
    @Common.Label : 'Has active'
    @Common.QuickInfo : 'Draft - Indicator - Has active document'
    HasActiveEntity : Boolean not null;
    @Core.Computed : true
    @UI.HiddenFilter : true
    @Common.Label : 'Is active'
    @Common.QuickInfo : 'Draft - Indicator - Is active document'
    key IsActiveEntity : Boolean not null;
    SAP__Messages : many SAP__Message not null;
    @Common.Composition : true
    xDMOxZZ_ReviewZAG : Composition of many xDMOxZZ_Review {  };
    DraftAdministrativeData : Association to one I_DraftAdministrativeData {  };
    SiblingEntity : Association to one Agency {  };
  } actions {
    action Discard(
      _it : $self not null
    );
    action Activate(
      _it : $self not null
    ) returns Agency not null;
    action Resume(
      _it : $self not null
    );
    action xDMOxcreateFromTemplate(
      _it : $self not null,
      @Common.Label : 'Result is active'
      @Common.QuickInfo : 'Draft - Indicator - Is active document'
      ResultIsActiveEntity : Boolean not null
    ) returns Agency not null;
    action Prepare(
      _it : $self not null
    );
    action Edit(
      _it : $self not null,
      @Common.Label : 'TRUE'
      @Common.QuickInfo : 'Data element for domain BOOLE: TRUE (=''X'') and FALSE (='' '')'
      PreserveChanges : Boolean not null
    ) returns Agency not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @Common.Label : 'Draft Administration Data'
  @Capabilities.SearchRestrictions.Searchable : true
  @Capabilities.SearchRestrictions.UnsupportedExpressions : #phrase
  @Capabilities.FilterRestrictions.Filterable : true
  @Capabilities.FilterRestrictions.FilterExpressionRestrictions : [
    { Property: CreationDateTime, AllowedExpressions: 'SingleRange' },
    { Property: LastChangeDateTime, AllowedExpressions: 'SingleRange' }
  ]
  @Capabilities.InsertRestrictions.Insertable : false
  @Capabilities.DeleteRestrictions.Deletable : false
  @Capabilities.UpdateRestrictions.Updatable : false
  @Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
  entity I_DraftAdministrativeData {
    @Common.Label : 'Draft (Technical ID)'
    key DraftUUID : UUID not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Draft Entity ID'
    key DraftEntityType : String(30) not null;
    @odata.Precision : 7
    @odata.Type : 'Edm.DateTimeOffset'
    @Common.Label : 'Draft Created On'
    CreationDateTime : Timestamp;
    @Common.Text : CreatedByUserDescription
    @Common.IsUpperCase : true
    @Common.Label : 'Draft Created By'
    CreatedByUser : String(12) not null;
    @odata.Precision : 7
    @odata.Type : 'Edm.DateTimeOffset'
    @Common.Label : 'Draft Last Changed On'
    LastChangeDateTime : Timestamp;
    @Common.Text : LastChangedByUserDescription
    @Common.IsUpperCase : true
    @Common.Label : 'Draft Last Changed By'
    LastChangedByUser : String(12) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Draft Access Type'
    DraftAccessType : String(1) not null;
    @odata.Precision : 7
    @odata.Type : 'Edm.DateTimeOffset'
    @Common.Label : 'Draft In Process Since'
    ProcessingStartDateTime : Timestamp;
    @Common.Text : InProcessByUserDescription
    @Common.IsUpperCase : true
    @Common.Label : 'Draft In Process By'
    InProcessByUser : String(12) not null;
    @Common.Label : 'Draft Is Kept By User'
    DraftIsKeptByUser : Boolean not null;
    @odata.Precision : 7
    @odata.Type : 'Edm.DateTimeOffset'
    @Common.Label : 'Draft Locked Since'
    EnqueueStartDateTime : Timestamp;
    @Common.Label : 'Draft Created By Me'
    DraftIsCreatedByMe : Boolean not null;
    @Common.Label : 'Draft Last Changed By Me'
    DraftIsLastChangedByMe : Boolean not null;
    @Common.Label : 'Draft In Process By Me'
    DraftIsProcessedByMe : Boolean not null;
    @Common.Label : 'Draft Created By (Description)'
    CreatedByUserDescription : String(80) not null;
    @Common.Label : 'Draft Last Changed By (Description)'
    LastChangedByUserDescription : String(80) not null;
    @Common.Label : 'Draft In Process By (Description)'
    InProcessByUserDescription : String(80) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @Common.Label : 'Agency Review'
  @Common.SemanticKey : [ 'Reviewer' ]
  @Common.Messages : SAP__Messages
  @Common.DraftActivationVia : [ 'SAP__self.Container/Agency' ]
  @Capabilities.SearchRestrictions.Searchable : false
  @Capabilities.FilterRestrictions.Filterable : true
  @Capabilities.FilterRestrictions.FilterExpressionRestrictions : [
    { Property: FreeTextComment, AllowedExpressions: 'SearchExpression' },
    {
      Property: DraftEntityCreationDateTime,
      AllowedExpressions: 'SingleRange'
    },
    {
      Property: DraftEntityLastChangeDateTime,
      AllowedExpressions: 'SingleRange'
    }
  ]
  @Capabilities.SortRestrictions.NonSortableProperties : [ 'FreeTextComment' ]
  @Capabilities.InsertRestrictions.Insertable : false
  @Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
  entity xDMOxZZ_Review {
    @Core.Computed : true
    @Common.IsDigitSequence : true
    @Common.Label : 'Agency ID'
    @Common.QuickInfo : 'Flight Reference Scenario: Agency ID'
    key AgencyId : String(6) not null;
    @Core.Computed : true
    @Common.IsDigitSequence : true
    @Common.Label : 'Review ID'
    @Common.QuickInfo : 'Agency Review: Review ID'
    key ReviewId : String(4) not null;
    @odata.Type : 'Edm.Byte'
    @Common.Label : 'Rating'
    @Common.QuickInfo : 'Agency Review: Rating'
    Rating : Integer not null;
    @Common.Label : 'Free Text Comment'
    @Common.QuickInfo : 'Agency Review: Free Text Comment'
    FreeTextComment : String(1024) not null;
    @Core.Computed : true
    @Common.Label : 'Helpful Counter'
    @Common.Heading : 'Helpful Rated Counter'
    @Common.QuickInfo : 'Agency Review: Helpful Rated Counter'
    HelpfulCount : Integer not null;
    @Core.Computed : true
    @Common.Label : 'Total Helpful'
    @Common.Heading : 'Total Helpful Counter'
    @Common.QuickInfo : 'Agency Review: Helpful Total Counter'
    HelpfulTotal : Integer not null;
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Created By'
    @Common.QuickInfo : 'Created By User'
    Reviewer : String(12) not null;
    @odata.Precision : 7
    @odata.Type : 'Edm.DateTimeOffset'
    @Common.Label : 'Created On'
    @Common.QuickInfo : 'Creation Date Time'
    LocalCreatedAt : Timestamp;
    @odata.Precision : 7
    @odata.Type : 'Edm.DateTimeOffset'
    @Common.Label : 'Changed On'
    @Common.QuickInfo : 'Local Instance Last Change Date Time'
    LocalLastChangedAt : Timestamp;
    @Core.Computed : true
    @UI.HiddenFilter : true
    @Common.Label : 'Has Draft'
    @Common.QuickInfo : 'Draft - Indicator - Has draft document'
    HasDraftEntity : Boolean not null;
    @Core.Computed : true
    @UI.HiddenFilter : true
    @Common.Label : 'Key'
    @Common.QuickInfo : 'UUID serving as key (parent key, root key)'
    key DraftUUID : UUID not null;
    @Core.Computed : true
    @UI.HiddenFilter : true
    @Common.Label : 'Key'
    @Common.QuickInfo : 'UUID serving as key (parent key, root key)'
    ParentDraftUUID : UUID;
    @odata.Precision : 7
    @odata.Type : 'Edm.DateTimeOffset'
    @Core.Computed : true
    @UI.HiddenFilter : true
    @Common.Label : 'Draft Created On'
    DraftEntityCreationDateTime : Timestamp;
    @odata.Precision : 7
    @odata.Type : 'Edm.DateTimeOffset'
    @Core.Computed : true
    @UI.HiddenFilter : true
    @Common.Label : 'Draft Last Changed On'
    DraftEntityLastChangeDateTime : Timestamp;
    @Core.Computed : true
    @UI.HiddenFilter : true
    @Common.Label : 'Has active'
    @Common.QuickInfo : 'Draft - Indicator - Has active document'
    HasActiveEntity : Boolean not null;
    @Core.Computed : true
    @UI.HiddenFilter : true
    @Common.Label : 'Is active'
    @Common.QuickInfo : 'Draft - Indicator - Is active document'
    key IsActiveEntity : Boolean not null;
    SAP__Messages : many SAP__Message not null;
    DraftAdministrativeData : Association to one I_DraftAdministrativeData {  };
    SiblingEntity : Association to one xDMOxZZ_Review {  };
    _Agency : Association to one Agency {  };
  } actions {
    action xDMOxreviewWasHelpful(
      _it : $self not null
    ) returns xDMOxZZ_Review not null;
    action xDMOxreviewWasNotHelpful(
      _it : $self not null
    ) returns xDMOxZZ_Review not null;
  };
};

