const cds = require('@sap/cds')
const { header } = require('@sap/cds/lib/i18n/locale')
module.exports = async (srv) => {
    const travel_metadata = await cds.connect.to('travel_metadata')
    const { Travel } = srv.entities

    srv.on(['READ'], Travel, async (req) => {
        let TravelRequestsQuery = SELECT.from(req.query.SELECT.from).limit(req.query.SELECT.limit);
        if (req.query.SELECT.where) {
            TravelRequestsQuery.where(req.query.SELECT.where)
        }

        if (req.query.SELECT.orderBy) {
            TravelRequestsQuery.orderBy(req.query.SELECT.orderBy)
        }

              let TravelRequestsResult = await travel_metadata.tx(req).send({
            query: TravelRequestsQuery
         
        })
        return TravelRequestsResult;

    }
    )
}