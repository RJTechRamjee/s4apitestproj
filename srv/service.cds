using { travel_metadata as external } from './external/travel_metadata';

service TravelService {
    entity Travel as projection on external.Travel;
}