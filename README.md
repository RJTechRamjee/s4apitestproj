# Getting Started

Welcome to your new project.

It contains these folders and files, following our recommended project layout:

File or Folder | Purpose
---------|----------
`app/` | content for UI frontends goes here
`db/` | your domain models and data go here
`srv/` | your service models and code go here
`package.json` | project metadata and configuration
`readme.md` | this getting started guide


## Next Steps

- Open a new terminal and run `cds watch`
- (in VS Code simply choose _**Terminal** > Run Task > cds watch_)
- Start adding content, for example, a [db/schema.cds](db/schema.cds).


## Local Development with Cloud Connector (Hybrid Mode)

This section describes how to set up local development to connect to an on-premise S4HANA system through Cloud Connector.

### Prerequisites

1. **Cloud Connector** must be installed and connected to your BTP subaccount
2. **BTP Destination** "RJTechSphere" must be configured (OnPremise, BasicAuth)
3. **CF CLI** must be installed and logged into your BTP subaccount
4. **Node.js** (v18+) installed

### Setup Steps

#### Option 1: Using `.cdsrc-private.json` (Recommended)

Create a `.cdsrc-private.json` file in the project root with the following structure:

```json
{
  "requires": {
    "travel_metadata": {
      "credentials": {
        "destination": "RJTechSphere",
        "path": "/sap/opu/odata/DMO/UI_TRAVEL_PROC_M_O2"
      }
    }
  }
}
```

> **Note:** This file is already in `.gitignore` to prevent committing sensitive data.

#### Option 2: Using `default-env.json`

1. Copy the template file:
   ```bash
   cp default-env.json.template default-env.json
   ```

2. Get the service credentials from BTP:

   **For Destination Service:**
   ```bash
   cf service-key <destination-service-instance> <service-key-name>
   ```

   **For Connectivity Service:**
   ```bash
   cf service-key <connectivity-service-instance> <service-key-name>
   ```

   **For XSUAA Service (if needed):**
   ```bash
   cf service-key <xsuaa-service-instance> <service-key-name>
   ```

3. Update `default-env.json` with the actual credentials from the service keys.

> **Note:** The `default-env.json` file is in `.gitignore` to prevent committing credentials.

### Running in Hybrid Mode

To connect to the remote S4HANA system through Cloud Connector:

1. Bind to the destination service:
   ```bash
   cds bind -2 <destination-service-instance>
   ```

2. Bind to the connectivity service:
   ```bash
   cds bind -2 <connectivity-service-instance>
   ```

3. Start the application in hybrid mode:
   ```bash
   cds watch --profile hybrid
   ```

### Troubleshooting

#### ETIMEDOUT Error (502)

If you encounter timeout errors when trying to access the S4HANA OData service:

1. **Verify Cloud Connector connection** - Check that Cloud Connector is connected in the BTP Cockpit
2. **Test destination** - Use "Check Connection" in the BTP destination configuration
3. **Verify CF login** - Ensure you're logged into the correct BTP subaccount
4. **Check bindings** - Verify that both destination and connectivity services are bound
5. **Profile mode** - Ensure you're running with `--profile hybrid`

#### Connection Details

- **Virtual Host:** rjtechsphere.com:50001
- **Protocol Translation:** HTTP (BTP) → HTTPS (S4HANA)
- **OData Service Path:** /sap/opu/odata/DMO/UI_TRAVEL_PROC_M_O2


## Learn More

Learn more at https://cap.cloud.sap/docs/get-started/.
