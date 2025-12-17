# Troubleshooting Guide for Remote Service Connection Issues

## Common Error: ECONNRESET

### Error Message
```
Error: Error during request to remote service: read ECONNRESET
```

### Root Causes

1. **Cloud Connector Not Running**
   - The SAP Cloud Connector service is not started on your local machine
   - The Cloud Connector is not connected to your BTP subaccount

2. **Proxy Configuration Issues**
   - The proxy host/port in `.env` file doesn't match the Cloud Connector configuration
   - The proxy is not accessible from your application

3. **Destination Configuration Issues**
   - The destination "RJTechSphere" is not properly configured in BTP
   - The destination credentials are incorrect
   - The destination is not exposed through Cloud Connector

4. **Network Connectivity Issues**
   - The remote S/4HANA system is not accessible
   - Firewall blocking the connection

### Solution Steps

#### Step 1: Verify Cloud Connector Status

1. Open Cloud Connector UI (typically at `https://localhost:8443`)
2. Login with your administrator credentials
3. Check that the connector shows **Connected** status to your BTP subaccount
4. Verify the **Proxy Port** in the Configuration tab

#### Step 2: Update .env File

Ensure your `.env` file has the correct proxy configuration matching your Cloud Connector:

```env
destinations=[{"name":"RJTechSphere","proxyHost":"127.0.0.1","proxyPort":"8887","url":"http://rjtechsphere.com:50001"}]
```

**Important Notes**: 
- The `proxyPort` must match the "Proxy Port" shown in Cloud Connector's Configuration tab (default is 8887).
- The `proxyHost` should be just the IP address or hostname **without** the `http://` or `https://` protocol prefix.
- If proxy is not being used (check error logs for `proxy: false`), verify the proxyHost format is correct.

#### Step 3: Verify Destination Configuration

In BTP Cockpit:
1. Navigate to **Connectivity** > **Destinations**
2. Find the "RJTechSphere" destination
3. Click **Check Connection** to verify it's working
4. Ensure the destination has:
   - **Type**: HTTP
   - **ProxyType**: OnPremise
   - **Authentication**: BasicAuthentication (or as required)
   - **URL**: Pointing to your S/4HANA system

#### Step 4: Verify Cloud Connector Mapping

In Cloud Connector UI:
1. Go to **Cloud To On-Premise** section
2. Verify that you have a mapping for:
   - **Virtual Host**: `rjtechsphere.com`
   - **Virtual Port**: `50001`
   - **Internal Host**: Your actual S/4HANA system hostname
   - **Internal Port**: Your actual S/4HANA system port (e.g., 443)
   - **Protocol**: HTTP or HTTPS as required
3. Ensure the resource path `/sap/opu/odata4/sap/zrk_api_agency_v4` is allowed

#### Step 5: Test the Configuration

1. Ensure Cloud Connector is running and connected
2. Start your application:
   ```bash
   npm start
   ```
3. Check the console output for configuration information:
   ```
   [AgencyService] Remote service configuration: {
     kind: 'odata-v2',
     destination: 'RJTechSphere',
     path: '/sap/opu/odata4/sap/zrk_api_agency_v4/srvd_a2x/dmo/ui_agency/0001',
     requestTimeout: 60000
   }
   ```
4. Try accessing the service:
   ```bash
   curl http://localhost:4004/odata/v4/agency/Agency
   ```

### Enhanced Error Messages

The application now provides detailed error information when connection issues occur:

#### ECONNRESET Error
```
[AgencyService] Error during remote service call: {
  message: 'read ECONNRESET',
  code: 'ECONNRESET',
  url: 'http://rjtechsphere.com:50001/sap/opu/odata4/...',
  baseURL: 'http://rjtechsphere.com:50001',
  proxy: false
}
[AgencyService] Troubleshooting steps: [
  'Verify Cloud Connector is running and connected',
  'Check proxy configuration in .env file',
  'Ensure destination "RJTechSphere" is properly configured',
  'Verify the remote system is accessible'
]
```

#### ETIMEDOUT Error
Connection timeout indicates network issues or Cloud Connector not responding.

#### ECONNREFUSED Error
Connection refused indicates the proxy port is not accessible or Cloud Connector is not running.

## Additional Configuration Options

### Increase Request Timeout

If you're experiencing timeout issues, you can increase the timeout in `package.json`:

```json
{
  "cds": {
    "requires": {
      "ZRK_API_AGENCY_V4": {
        "kind": "odata-v2",
        "model": "srv/external/ZRK_API_AGENCY_V4",
        "requestTimeout": 120000,  // Increase to 120 seconds
        "credentials": {
          "destination": "RJTechSphere",
          "path": "/sap/opu/odata4/sap/zrk_api_agency_v4/srvd_a2x/dmo/ui_agency/0001"
        }
      }
    }
  }
}
```

### Using Hybrid Profile

When developing locally with Cloud Connector, use the hybrid profile:

```bash
cds watch --profile hybrid
```

This requires proper bindings to destination and connectivity services in `.cdsrc-private.json`.

## Still Having Issues?

1. Check the complete error stack trace in the console
2. Verify all URLs and ports match across:
   - `.env` file
   - Cloud Connector configuration
   - BTP Destination configuration
   - `package.json` credentials
3. Test the destination connection directly from BTP Cockpit
4. Check Cloud Connector logs for connection attempts
5. Ensure you have proper authorizations to access the destination
