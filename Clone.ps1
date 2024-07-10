param(
    [Parameter(Mandatory=$true)]
    [string]$AccessToken
)

# Enable TLS 1.2 protocol
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# Define an array of specific repository names
# Example: Replace these with actual repository names you want to clone
$repoNames = @("Repo1", "Repo2", "Repo3")

# Set the path where repositories will be cloned
# Example: Replace with the desired directory path
$cloneDirectory = "C:\ExampleDirectory"

# Create clone directory if it doesn't exist
if (-not (Test-Path $cloneDirectory)) {
    New-Item -ItemType Directory -Path $cloneDirectory | Out-Null
}

try {
    foreach ($repoName in $repoNames) {
        # Define the full path for the repository
        $repoPath = "$cloneDirectory\$repoName"

        # Check if the repository directory already exists
        if (-not (Test-Path $repoPath)) {
            # GitHub API endpoint to fetch a specific repository
            # Example: Replace with the actual base URL of your GitHub API
            $apiUrl = "https://api.github.com/repos/YourGitHubUsername/$repoName"

            # Make API request to GitHub to fetch the repository details
            $headers = @{
                "Authorization" = "token $AccessToken"
                "User-Agent"    = "PowerShell-Script"  # Add a User-Agent header as required by GitHub API
            }
            $repo = Invoke-RestMethod -Uri $apiUrl -Headers $headers -Method Get

            # Use clone URL with token for cloning
            # Example: Replace with the actual base URL of your GitHub repository
            $cloneUrl = "https://$AccessToken@github.com/YourGitHubUsername/$repoName.git"
            Write-Host "Cloning repository: $($repo.name)"
            git clone $cloneUrl $repoPath > $null
            if ($LastExitCode -ne 0) {
                Write-Host "Error cloning repository: $($repo.name)"
            }
            else {
                Write-Host "Repository already exists: $repoPath"
            }
        }
        else {
            Write-Host "Repository already exists: $repoPath"
        }
    }
    Write-Host "All repositories processed successfully."
}
catch {
    Write-Host "Error fetching or cloning repositories: $_"
    exit 1
}

# Restart web services by name after cloning all of the repositories

# Define web service names
# Example: Replace these with the actual names of your web services
$webservices_names = @("WebService1", "WebService2", "WebService3")

try {
    foreach ($webservice_name in $webservices_names) {
        # Stop and start the website.
        Write-Host "Stopping website IIS: $webservice_name"
        #Stop-Website -Name "$webservice_name"
        
        Write-Host "Starting website IIS: $webservice_name"
        #Start-Website -Name "$webservice_name"
    }
}
catch {
    Write-Host "Cannot restart website of IIS webserver."
    exit 1
}
