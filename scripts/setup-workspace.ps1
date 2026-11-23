param(
  [Parameter(Mandatory = $true)]
  [string]$TeamRepo,

  [ValidateSet(
    'vibotcode',
    'frontend-pc',
    'frontend-mobile',
    'frontend-mini-program',
    'center-platform',
    'center-gateway',
    'center-point',
    'center-vip',
    'center-manage',
    'center-mall',
    'center-chain',
    'xxl-job'
  )]
  [string]$Project = 'vibotcode',

  [ValidateSet('common', 'frontend', 'backend', 'review')]
  [string]$Role = 'common',

  [string]$Agent = 'codex',

  [ValidateSet('github', 'git')]
  [string]$Provider = 'github',

  [switch]$InheritUserScope
)

$ErrorActionPreference = 'Stop'

$frontendPlatforms = @(
  'frontend-pc',
  'frontend-mobile',
  'frontend-mini-program'
)
$backendProjects = @(
  'center-platform',
  'center-gateway',
  'center-point',
  'center-vip',
  'center-manage',
  'center-mall',
  'center-chain',
  'xxl-job'
)

$validCombination = switch ($Role) {
  'common' { $Project -eq 'vibotcode' }
  'review' { $Project -in $frontendPlatforms -or $Project -in $backendProjects }
  'frontend' { $Project -in $frontendPlatforms }
  'backend' { $Project -in $backendProjects }
  default { $false }
}

if (-not $validCombination) {
  throw "Role '$Role' does not match project '$Project'. Use common + vibotcode for shared context, select frontend-pc/frontend-mobile/frontend-mini-program for frontend work, or select a concrete backend project."
}

if ($env:OS -eq 'Windows_NT') {
  $gitLongPaths = (& git config --get core.longpaths 2>$null | Select-Object -First 1)
  if ($LASTEXITCODE -ne 0 -or $gitLongPaths -ne 'true') {
    throw "Git long path support is required for TeamAI resources on Windows. Run 'git config --global core.longpaths true', then retry."
  }
}

function Invoke-TeamAi {
  param([string[]]$Arguments)

  & teamai @Arguments
  if ($LASTEXITCODE -ne 0) {
    throw "teamai $($Arguments -join ' ') failed with exit code $LASTEXITCODE."
  }
}

$initArgs = @('init', $TeamRepo, '--provider', $Provider, '--role', $Role, '--project', $Project, '--agent', $Agent)
if ($InheritUserScope) {
  $initArgs += '--inherit-user-scope'
}

Invoke-TeamAi $initArgs
Invoke-TeamAi @('roles', 'set', $Role)
Invoke-TeamAi @('projects', 'set', $Project)
Invoke-TeamAi @('pull')
Invoke-TeamAi @('doctor')

if (($Agent -split ',') -contains 'codex') {
  Write-Warning 'For Codex, doctor success confirms hook installation but not necessarily manual trust. Review and trust TeamAI hooks in /hooks or Settings > Hooks before relying on team Rules.'
}
if ($Provider -eq 'git') {
  Write-Warning 'Provider git uses existing Git authentication and can pull resources, but TeamAI cannot create GitHub pull requests from this workspace.'
}

Write-Host "Effective TeamAI selection:"
Invoke-TeamAi @('roles', 'list')
Invoke-TeamAi @('projects', 'list')

