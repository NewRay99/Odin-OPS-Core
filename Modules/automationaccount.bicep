param accountName string
param location string

resource accountName_resource 'Microsoft.Automation/automationAccounts@2020-01-13-preview' = {
  name: accountName
  location: location
  tags: {}
  properties: {
    sku: {
      name: 'Basic'
    }
  }
  dependsOn: []
}

