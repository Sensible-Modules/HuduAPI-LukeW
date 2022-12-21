function Get-HuduAppInfo {
    [CmdletBinding()]
    Param()
    try {
    
        $HuduAPIKey = Get-HuduApiKey
        $HuduBaseURL = Get-HuduBaseURL

        $CREDS = (New-Object PSCredential 'user',$HuduAPIKey).GetNetworkCredential().Password
        $HEADERS = @{'x-api-key'=$CREDS}
        $Version = Invoke-RestMethod -Method GET -URI "$($HuduBaseURL)/api/v1/api_info" -Headers $HEADERS -ContentType 'application/json'


    } catch {
        $version = @{
            version = "0.0.0.0"
            date    = "2000-01-01"
        }
    }


    return $Version
	
}