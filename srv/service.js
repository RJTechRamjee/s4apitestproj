const cds = require('@sap/cds')
const { header } = require('@sap/cds/lib/i18n/locale')
module.exports = async (srv) => {
    const externalService = await cds.connect.to('travel_metadata')
    const { Travel } = srv.entities

    srv.on(['READ'], Travel, async (req) => {
        // let TravelRequestsQuery = SELECT.from(req.query.SELECT.from).limit(req.query.SELECT.limit);
        let TravelRequestsQuery = SELECT.from(req.query.SELECT.from).limit(10);
       
        let TravelRequestsResult = await externalService.run(TravelRequestsQuery);
        return TravelRequestsResult;

    }
    )
}