# Cloner
 ### Description

This repository contains a PowerShell script designed to clone specific GitHub repositories and restart specified IIS web services. The script is useful for automating the deployment and management of services, ensuring they are up-to-date with the latest code changes.

---

### Script Overview

The script performs the following tasks:
1. **Clones GitHub Repositories**: Clones a list of repositories from GitHub to a specified directory on your local machine.
2. **Restarts IIS Web Services**: After cloning, the script restarts the specified IIS web services to ensure they run the latest code.

---

### Parameters

- **AccessToken** (Mandatory): The GitHub personal access token used for authentication when accessing the GitHub API.

### Variables

- **$repoNames**: An array of repository names to be cloned. Example repositories have been provided for demonstration.
- **$cloneDirectory**: The directory path where the repositories will be cloned. Replace with the desired directory path.
- **$apiUrl**: The GitHub API endpoint to fetch the repository details. Replace with the actual base URL of your GitHub API.
- **$cloneUrl**: The clone URL with the token for cloning repositories. Replace with the actual base URL of your GitHub repository.
- **$webservices_names**: An array of web service names to be restarted after cloning. Example web services have been provided for demonstration.

---

### Usage

1. **Clone the Repository**: Clone this repository to your local machine.
2. **Modify the Script**: Edit the script to replace the example values with your actual repository names, directory paths, and web service names.
3. **Run the Script**: Execute the script with the necessary parameter:
   ```powershell
   .\CloneAndRestartScript.ps1 -AccessToken "your_github_token"
   ```

