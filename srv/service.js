const cds = require('@sap/cds')

// Remote service identifier
const REMOTE_SERVICE_NAME = 'ZRK_API_AGENCY_V4'
 
module.exports = async (srv) => {
  // Establish connection to the remote services ONCE.
  const externalAgencyService = await cds.connect.to(REMOTE_SERVICE_NAME)
  // const externalTravelService = await cds.connect.to('travel_metadata');
  
  // Log configuration on startup for debugging
  const config = cds.env.requires[REMOTE_SERVICE_NAME]
  if (config) {
    console.log('[AgencyService] Remote service configuration:', {
      kind: config.kind,
      destination: config.credentials?.destination,
      path: config.credentials?.path ? '[REDACTED]' : undefined,
      requestTimeout: config.requestTimeout
    })
  }
 
  // Let CAP framework handle the delegation automatically
  // Removing custom handler to use built-in remote service proxying
  // The framework will automatically handle errors with better retry logic
}
