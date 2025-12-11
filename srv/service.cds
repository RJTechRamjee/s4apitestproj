using { ZRK_API_AGENCY_V4 as externalAgency } from './external/ZRK_API_AGENCY_V4';


service AgencyService {
    entity Agency as projection on externalAgency.Agency;
}
