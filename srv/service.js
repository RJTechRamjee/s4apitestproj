const cds = require('@sap/cds')

 
module.exports = async (srv) => {
  // Establish connection to the remote services ONCE.
  const externalAgencyService = await cds.connect.to('ZRK_API_AGENCY_V4')
  // const externalTravelService = await cds.connect.to('travel_metadata');
  
  // Log configuration on startup for debugging
  const config = cds.env.requires['ZRK_API_AGENCY_V4']
  if (config) {
    console.log('[AgencyService] Remote service configuration:', {
      kind: config.kind,
      destination: config.credentials?.destination,
      path: config.credentials?.path,
      requestTimeout: config.requestTimeout
    })
  }
 
  // Reuse the connection for all event handlers
  srv.on('READ', 'Agency', async (req) => {
    // The CAP framework can automatically delegate simple READ requests.
    // This custom handler is only needed for custom logic.
    // For a simple proxy, this handler can be removed entirely.
    // If you keep it for custom logic, here is how you'd call the remote.
    try {
      // The 'req.query' object already contains the query from the client.
      // We can pass it directly to the remote service.
      return await externalAgencyService.run(req.query)
    } catch (error) {
      // Log the complete error details for troubleshooting
      console.error('[AgencyService] Error during remote service call:', {
        message: error.message,
        code: error.code,
        statusCode: error.statusCode,
        syscall: error.syscall,
        errno: error.errno,
        url: error.reason?.request?.url,
        baseURL: error.reason?.config?.baseURL,
        proxy: error.reason?.config?.proxy
      })
      
      // Provide detailed error message based on error type
      let errorMessage = 'Error during request to remote service'
      let troubleshooting = []
      
      if (error.code === 'ECONNRESET') {
        errorMessage = 'Connection to remote service was reset'
        troubleshooting = [
          'Verify Cloud Connector is running and connected',
          'Check proxy configuration in .env file',
          'Ensure destination "RJTechSphere" is properly configured',
          'Verify the remote system is accessible'
        ]
      } else if (error.code === 'ETIMEDOUT') {
        errorMessage = 'Connection to remote service timed out'
        troubleshooting = [
          'Check if Cloud Connector is accessible',
          'Verify network connectivity',
          'Consider increasing requestTimeout in package.json'
        ]
      } else if (error.code === 'ECONNREFUSED') {
        errorMessage = 'Connection to remote service was refused'
        troubleshooting = [
          'Verify proxy is running on the configured port',
          'Check proxy settings in .env file',
          'Ensure Cloud Connector is properly configured'
        ]
      }
      
      if (troubleshooting.length > 0) {
        console.error('[AgencyService] Troubleshooting steps:', troubleshooting)
      }
      
      req.error(502, errorMessage, error.message)
    }
  })
  // The CAP framework will automatically handle the proxying of requests
  // to the remote 'ZRK_API_AGENCY_V4' service, including all CRUD operations.
  // No custom handler is needed for simple delegation.
}
