if (-not (Get-Command -Name oh-my-posh)) {
    sudo Invoke-WebRquest -Uri https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -OutFile /usr/local/bin/oh-my-posh && sudo chmod +x /usr/local/bin/oh-my-posh
}
if (-not (Test-Path -Path /usr/local/bin/oh-my-posh) -and ($isLinux)) {
    Invoke-WebRequest -Uri https://gist.githubusercontent.com/ephos/ba04ce3b9ad12860cfbf4302438aa2a4/raw/f3a6cee814bf86a6ef4bf9910b7afef6c69f671f/bobbybologna.omp.json -OutFile /home/ephos/.poshthemes/bobbybologna.omp.json
}

$ProgressPreference = 'SilentlyContinue'
$gistUrl = 'https://gist.github.com'
try {
    $currentProfile = (Invoke-WebRequest -Uri "$gistUrl/ephos/ba04ce3b9ad12860cfbf4302438aa2a4").Links.Where({$_.outerHTML -like '*raw*'}).href
    $currentProfile = $currentProfile | Where-Object {$_ -like '*pwshprofile*'}
    $profileCode = ('{0}{1}' -f $gistUrl, $currentProfile)
    Invoke-Expression (New-Object System.Net.WebClient).DownloadString($profileCode)
} catch {
    Write-Warning -Message 'Could not connect to Gitub to pull profile code.'
    exit 1
}
$ProgressPreference = 'Continue'
