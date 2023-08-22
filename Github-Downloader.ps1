$username = "<UserName>"  # Replace with the GitHub username
$page = 1
$repos = @()

# Fetch repositories with pagination
do {
    $reposPage = Invoke-RestMethod -Uri "https://api.github.com/users/$username/repos?page=$page"
    $repos += $reposPage
    $page++
} while ($reposPage.Count -gt 0)

foreach ($repo in $repos) {
    $repoName = $repo.name
    $cloneUrl = $repo.clone_url
    Write-Host "Cloning $repoName..."
    git clone $cloneUrl
}
