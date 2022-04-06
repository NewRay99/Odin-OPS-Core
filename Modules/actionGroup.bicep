param actionGroupName string 
param actionGroupEmail string 
param environment string

resource actionGroupName_resource 'microsoft.insights/actionGroups@2019-06-01' = {
  name: actionGroupName
  location: 'Global'
  tags: {
    Environment: environment
    Portfolio: 'Education and Skills Funding Agency'
    'Service Line': 'Data Science (CEDD)'
    Service: 'Business Intelligence (CEDD)'
    Product: 'Data Platform Infrastructure'
    'Parent Business': ''
    'Service Offering': 'ESFA Adopt Programme'
  }
  properties: {
    groupShortName: 'ag-managers'
    enabled: true
    emailReceivers: [
      {
        name: 'ag-mgr-budget-notification_-EmailAction-'
        emailAddress: actionGroupEmail
        useCommonAlertSchema: false
      }
    ]
    smsReceivers: []
    webhookReceivers: []
    itsmReceivers: []
    azureAppPushReceivers: []
    automationRunbookReceivers: []
    voiceReceivers: []
    logicAppReceivers: []
    azureFunctionReceivers: []
    armRoleReceivers: []
  }
}
