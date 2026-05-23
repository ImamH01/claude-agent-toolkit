# Claude Agent Toolkit — Windows Setup Script
# Run from PowerShell: .\setup.ps1
# Requires: Git for Windows, Python 3

$ErrorActionPreference = "Stop"

$RepoDir   = Split-Path -Parent $MyInvocation.MyCommand.Definition
$GlobalDir = Join-Path $HOME ".claude"
$GlobalClaude   = Join-Path $GlobalDir "CLAUDE.md"
$GlobalSettings = Join-Path $GlobalDir "settings.json"

Write-Host ""
Write-Host "  Claude Agent Toolkit — Setup"
Write-Host "  Repo: $RepoDir"
Write-Host ""

# ── 0. Check prerequisites ────────────────────────────────────────────────────
Write-Host "-> Checking prerequisites..."
$PrereqOk = $true

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host "   MISSING: git -- install from https://git-scm.com"
    $PrereqOk = $false
}

$NodeCmd = Get-Command node -ErrorAction SilentlyContinue
if (-not $NodeCmd) {
    Write-Host "   MISSING: Node.js v20+ -- install from https://nodejs.org"
    Write-Host "            Needed for: chrome-devtools MCP, docx skill, SEO skill"
    $PrereqOk = $false
} else {
    $NodeVersion = (node -e "process.stdout.write(String(process.versions.node.split('.')[0]))") -as [int]
    if ($NodeVersion -lt 20) {
        Write-Host "   OUTDATED: Node.js $NodeVersion detected -- v20+ required (https://nodejs.org)"
        $PrereqOk = $false
    }
}

if (-not (Get-Command python3 -ErrorAction SilentlyContinue) -and -not (Get-Command python -ErrorAction SilentlyContinue)) {
    Write-Host "   MISSING: Python 3 -- install from https://www.python.org"
    Write-Host "            Needed for: this setup script, webapp-testing, pdf, docx skills"
    $PrereqOk = $false
}

$ChromePaths = @(
    "$env:LOCALAPPDATA\Google\Chrome\Application\chrome.exe",
    "$env:PROGRAMFILES\Google\Chrome\Application\chrome.exe",
    "$env:PROGRAMFILES(x86)\Google\Chrome\Application\chrome.exe"
)
$ChromeFound = $ChromePaths | Where-Object { Test-Path $_ }
if (-not $ChromeFound) {
    Write-Host "   MISSING: Google Chrome -- install from https://www.google.com/chrome"
    Write-Host "            Needed for: chrome-devtools MCP"
    Write-Host "            (Continuing anyway -- MCP may still work if Chrome is elsewhere)"
}

if (-not $PrereqOk) {
    Write-Host ""
    Write-Host "   Install the missing dependencies above, then re-run this script."
    Write-Host ""
    exit 1
}
Write-Host "   All required dependencies found."
Write-Host ""

# ── 1. Submodules ─────────────────────────────────────────────────────────────
Write-Host "-> Initialising submodules..."
git -C $RepoDir submodule update --init --recursive
Write-Host "   Done."
Write-Host ""

# ── 2. Back up and write ~/.claude/CLAUDE.md ─────────────────────────────────
New-Item -ItemType Directory -Force -Path $GlobalDir | Out-Null

if (Test-Path $GlobalClaude) {
    $Stamp  = Get-Date -Format "yyyyMMddHHmmss"
    $Backup = "$GlobalClaude.bak.$Stamp"
    Copy-Item $GlobalClaude $Backup
    Write-Host "-> Backed up existing ~/.claude/CLAUDE.md -> $(Split-Path -Leaf $Backup)"
}

$T = $RepoDir -replace "\\", "/"

$ClaudeContent = @"
# Global Claude Skills

# Installed from: $T
# To update: cd $T && git pull --recurse-submodules && .\setup.ps1

When a user shares this file at the start of a new project, read the ACTIVATION GUIDE
below and recommend which commented-out skills to uncomment based on the project type,
stack, and goals described. Then provide the updated CLAUDE.md for the project.

---

## ACTIVATION GUIDE

### Always loaded (global)
- design-ui/frontend-design - any UI or frontend work
- design-ui/ui-ux-pro-max - any UI/UX design decisions
- design-ui/baseline-ui - when adding BaselineUI components to a project
- design-ui/fixing-accessibility - loaded on all projects, fixes WCAG issues
- documents/docx, xlsx, pdf, pptx - loaded on all projects, document creation
- development/seo-geo-aeo - any public-facing website needing search visibility
- development/webapp-testing - any project with a frontend that needs testing
- development/mcp-builder - when building MCP servers or integrations
- development/skill-creator - when creating new Claude skills
- enterprise/brand-guidelines - when brand consistency matters
- enterprise/internal-comms - when writing internal docs, reports, or newsletters

### Uncomment for specific project types
- frameworks/superpowers - any serious software development project needing TDD,
  planning, and subagent-driven development. Recommended for most coding projects.
- frameworks/context-engineering - when building AI agents, multi-agent systems,
  or anything that requires careful context/memory management
- skills/vercel/react-best-practices - any React or Next.js project
- skills/vercel/web-design-guidelines - any project with a web UI
- skills/vercel/react-native-guidelines - React Native or Expo mobile apps
- skills/vercel/composition-patterns - when building reusable component libraries
- skills/vercel/vercel-deploy-claimable - when deploying to Vercel
- skills/development/graphify - turn any codebase, docs, papers, or media into a
  queryable knowledge graph. Provides /graphify command. Requires: pip install graphifyy

---

## Design & UI

@$T/skills/anthropics/skills/frontend-design/SKILL.md
@$T/skills/design-ui/ui-ux-pro-max/.claude/skills/ui-ux-pro-max/SKILL.md
@$T/skills/design-ui/baseline-ui/SKILL.md
@$T/skills/design-ui/fixing-accessibility/skill.md

## Documents

@$T/skills/anthropics/skills/docx/SKILL.md
@$T/skills/anthropics/skills/xlsx/SKILL.md
@$T/skills/anthropics/skills/pdf/SKILL.md
@$T/skills/anthropics/skills/pptx/SKILL.md

## Development

@$T/skills/development/seo-geo-aeo/SKILL.md
@$T/skills/anthropics/skills/webapp-testing/SKILL.md
@$T/skills/anthropics/skills/mcp-builder/SKILL.md
@$T/skills/anthropics/skills/skill-creator/SKILL.md

## Enterprise

@$T/skills/anthropics/skills/brand-guidelines/SKILL.md
@$T/skills/anthropics/skills/internal-comms/SKILL.md

---

# Project-level only (uncomment in your project CLAUDE.md)

# HEAVY FRAMEWORKS - uncomment for serious dev projects
# @$T/frameworks/superpowers/skills/using-superpowers/SKILL.md
# @$T/frameworks/context-engineering/SKILL.md

# VERCEL / REACT - uncomment for React, Next.js, React Native projects
# @$T/skills/vercel/skills/react-best-practices/SKILL.md
# @$T/skills/vercel/skills/web-design-guidelines/SKILL.md
# @$T/skills/vercel/skills/react-native-skills/SKILL.md
# @$T/skills/vercel/skills/composition-patterns/SKILL.md
# @$T/skills/vercel/skills/deploy-to-vercel/SKILL.md

# KNOWLEDGE GRAPH - uncomment to enable /graphify on any project
# Requires: pip install graphifyy
# @$T/skills/development/graphify/graphify/skill.md
"@

Set-Content -Path $GlobalClaude -Value $ClaudeContent -Encoding UTF8
Write-Host "-> Written ~/.claude/CLAUDE.md"
Write-Host ""

# ── 3. Register MCPs in ~/.claude/settings.json ───────────────────────────────
Write-Host "-> Configuring global MCPs..."

$McpEntry = @{ command = "npx"; args = @("chrome-devtools-mcp@latest") }

if (-not (Test-Path $GlobalSettings)) {
    $Settings = @{ mcpServers = @{ "chrome-devtools" = $McpEntry } }
} else {
    $Settings = Get-Content $GlobalSettings -Raw | ConvertFrom-Json
    if (-not $Settings.mcpServers) {
        $Settings | Add-Member -NotePropertyName mcpServers -NotePropertyValue @{}
    }
    $Settings.mcpServers | Add-Member -NotePropertyName "chrome-devtools" -NotePropertyValue $McpEntry -Force
}

$Settings | ConvertTo-Json -Depth 10 | Set-Content -Path $GlobalSettings -Encoding UTF8
Write-Host "   chrome-devtools MCP registered in ~/.claude/settings.json"
Write-Host ""

# ── 4. Verify key skill files ─────────────────────────────────────────────────
Write-Host "-> Verifying skill files..."
$Skills = @(
    "skills/anthropics/skills/frontend-design/SKILL.md"
    "skills/design-ui/ui-ux-pro-max/.claude/skills/ui-ux-pro-max/SKILL.md"
    "skills/design-ui/baseline-ui/SKILL.md"
    "skills/design-ui/fixing-accessibility/skill.md"
    "skills/anthropics/skills/docx/SKILL.md"
    "skills/anthropics/skills/xlsx/SKILL.md"
    "skills/anthropics/skills/pdf/SKILL.md"
    "skills/anthropics/skills/pptx/SKILL.md"
    "skills/development/seo-geo-aeo/SKILL.md"
    "skills/anthropics/skills/webapp-testing/SKILL.md"
    "skills/anthropics/skills/mcp-builder/SKILL.md"
    "skills/anthropics/skills/skill-creator/SKILL.md"
    "skills/anthropics/skills/brand-guidelines/SKILL.md"
    "skills/anthropics/skills/internal-comms/SKILL.md"
    "frameworks/context-engineering/SKILL.md"
    "frameworks/superpowers/skills/using-superpowers/SKILL.md"
    "skills/development/graphify/graphify/skill.md"
)

$Missing = 0
foreach ($Skill in $Skills) {
    $Full = Join-Path $RepoDir $Skill
    if (-not (Test-Path $Full)) {
        Write-Host "   MISSING: $Skill"
        $Missing++
    }
}

if ($Missing -eq 0) {
    Write-Host "   All skill files present."
} else {
    Write-Host ""
    Write-Host "   $Missing skill file(s) missing. Run:"
    Write-Host "     git -C `"$RepoDir`" submodule update --init --recursive"
}
Write-Host ""

# ── 5. Write resolved project template ───────────────────────────────────────
$TemplateSrc = Join-Path $RepoDir "project-claude.template.md"
$TemplateDst = Join-Path $GlobalDir "project-claude.template.md"
$TemplateContent = Get-Content $TemplateSrc -Raw
$TemplateContent = $TemplateContent -replace "@TOOLKIT", "@$T"
Set-Content -Path $TemplateDst -Value $TemplateContent -Encoding UTF8
Write-Host "-> Written project template -> ~/.claude/project-claude.template.md"
Write-Host ""

# ── Done ──────────────────────────────────────────────────────────────────────
Write-Host "  + Setup complete. Restart Claude Code to activate all skills and MCPs."
Write-Host ""
Write-Host "  To add project-level skills, copy the resolved template:"
Write-Host "    Copy-Item `"$TemplateDst`" `"C:\path\to\your-project\CLAUDE.md`""
Write-Host "  Then uncomment the skills you need."
Write-Host ""
