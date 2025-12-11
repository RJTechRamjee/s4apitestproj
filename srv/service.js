const cds = require('@sap/cds')

 
module.exports = async (srv) => {
  // Establish connection to the remote services ONCE.
  const externalAgencyService = await cds.connect.to('ZRK_API_AGENCY_V4')
  // const externalTravelService = await cds.connect.to('travel_metadata');
 
  // Reuse the connection for all event handlers
  srv.on('READ', 'Agency', async (req) => {
    // The CAP framework can automatically delegate simple READ requests.
    // This custom handler is only needed for custom logic.
    // For a simple proxy, this handler can be removed entirely.
    // If you keep it for custom logic, here is how you'd call the remote.
    // try {
      // The 'req.query' object already contains the query from the client.
      // We can pass it directly to the remote service.
      return await externalAgencyService.run(req.query)
    // } catch (error) {
    //   req.error(500, 'Error during request to remote service')
    // }
  })
  // The CAP framework will automatically handle the proxying of requests
  // to the remote 'ZRK_API_AGENCY_V4' service, including all CRUD operations.
  // No custom handler is needed for simple delegation.
}
