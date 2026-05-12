#!/usr/bin/env bash
set -euo pipefail

# ── Claude Agent Toolkit — Install Script ─────────────────────────────────────
# Detects where this repo lives, initialises submodules, writes a personalised
# ~/.claude/CLAUDE.md that loads all skills globally, and registers MCPs.

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
GLOBAL_DIR="$HOME/.claude"
GLOBAL_CLAUDE="$GLOBAL_DIR/CLAUDE.md"
GLOBAL_SETTINGS="$GLOBAL_DIR/settings.json"

echo ""
echo "  Claude Agent Toolkit — Setup"
echo "  Repo: $REPO_DIR"
echo ""

# ── 1. Submodules ─────────────────────────────────────────────────────────────
echo "→ Initialising submodules..."
git -C "$REPO_DIR" submodule update --init --recursive
echo "  Done."
echo ""

# ── 2. Back up and write ~/.claude/CLAUDE.md ─────────────────────────────────
mkdir -p "$GLOBAL_DIR"

if [ -f "$GLOBAL_CLAUDE" ]; then
  BACKUP="$GLOBAL_CLAUDE.bak.$(date +%Y%m%d%H%M%S)"
  cp "$GLOBAL_CLAUDE" "$BACKUP"
  echo "→ Backed up existing ~/.claude/CLAUDE.md → $(basename "$BACKUP")"
fi

T="$REPO_DIR"

cat > "$GLOBAL_CLAUDE" << TEMPLATE
# Global Claude Skills

# Installed from: $T
# To update: cd $T && git pull --recurse-submodules && bash setup.sh

When a user shares this file at the start of a new project, read the ACTIVATION GUIDE
below and recommend which commented-out skills to uncomment based on the project type,
stack, and goals described. Then provide the updated CLAUDE.md for the project.

---

## ACTIVATION GUIDE

### Always loaded (global)
- design-ui/frontend-design — any UI or frontend work
- design-ui/ui-ux-pro-max — any UI/UX design decisions
- design-ui/baseline-ui — when adding BaselineUI components to a project
- design-ui/fixing-accessibility — loaded on all projects, fixes WCAG issues
- documents/docx, xlsx, pdf, pptx — loaded on all projects, document creation
- development/seo-geo-aeo — any public-facing website needing search visibility
- development/webapp-testing — any project with a frontend that needs testing
- development/mcp-builder — when building MCP servers or integrations
- development/skill-creator — when creating new Claude skills
- enterprise/brand-guidelines — when brand consistency matters
- enterprise/internal-comms — when writing internal docs, reports, or newsletters

### Uncomment for specific project types
- frameworks/superpowers — any serious software development project needing TDD,
  planning, and subagent-driven development. Recommended for most coding projects.
- frameworks/context-engineering — when building AI agents, multi-agent systems,
  or anything that requires careful context/memory management
- skills/vercel/react-best-practices — any React or Next.js project
- skills/vercel/web-design-guidelines — any project with a web UI
- skills/vercel/react-native-guidelines — React Native or Expo mobile apps
- skills/vercel/composition-patterns — when building reusable component libraries
- skills/vercel/vercel-deploy-claimable — when deploying to Vercel

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

# HEAVY FRAMEWORKS — uncomment for serious dev projects
# @$T/frameworks/superpowers/skills/using-superpowers/SKILL.md
# @$T/frameworks/context-engineering/SKILL.md

# VERCEL / REACT — uncomment for React, Next.js, React Native projects
# @$T/skills/vercel/skills/react-best-practices/SKILL.md
# @$T/skills/vercel/skills/web-design-guidelines/SKILL.md
# @$T/skills/vercel/skills/react-native-skills/SKILL.md
# @$T/skills/vercel/skills/composition-patterns/SKILL.md
# @$T/skills/vercel/skills/deploy-to-vercel/SKILL.md
TEMPLATE

echo "→ Written ~/.claude/CLAUDE.md"
echo ""

# ── 3. Register MCPs in ~/.claude/settings.json ───────────────────────────────
echo "→ Configuring global MCPs..."

MCP_KEY="chrome-devtools"
MCP_ENTRY='{"command":"npx","args":["chrome-devtools-mcp@latest"]}'

if [ ! -f "$GLOBAL_SETTINGS" ]; then
  # No settings file yet — create one with just the MCP entry
  echo "{\"mcpServers\":{\"$MCP_KEY\":$MCP_ENTRY}}" | python3 -m json.tool > "$GLOBAL_SETTINGS"
  echo "  Created ~/.claude/settings.json with chrome-devtools MCP."
else
  # Merge into existing settings.json using python3 (available on macOS/Linux)
  python3 - "$GLOBAL_SETTINGS" "$MCP_KEY" "$MCP_ENTRY" << 'PYEOF'
import sys, json

settings_path = sys.argv[1]
mcp_key       = sys.argv[2]
mcp_entry     = json.loads(sys.argv[3])

with open(settings_path) as f:
    settings = json.load(f)

settings.setdefault("mcpServers", {})[mcp_key] = mcp_entry

with open(settings_path, "w") as f:
    json.dump(settings, f, indent=2)
    f.write("\n")
PYEOF
  echo "  Merged chrome-devtools MCP into ~/.claude/settings.json."
fi
echo ""

# ── 4. Verify key skill files ─────────────────────────────────────────────────
echo "→ Verifying skill files..."
MISSING=0
SKILLS=(
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
)

for skill in "${SKILLS[@]}"; do
  if [ ! -f "$REPO_DIR/$skill" ]; then
    echo "  MISSING: $skill"
    MISSING=$((MISSING + 1))
  fi
done

if [ "$MISSING" -eq 0 ]; then
  echo "  All skill files present."
else
  echo ""
  echo "  $MISSING skill file(s) missing. Run:"
  echo "    git -C \"$REPO_DIR\" submodule update --init --recursive"
fi
echo ""

# ── 5. Write resolved project template to ~/.claude/ ─────────────────────────
PROJECT_TEMPLATE="$GLOBAL_DIR/project-claude.template.md"
sed "s|@TOOLKIT|@$T|g" "$REPO_DIR/project-claude.template.md" > "$PROJECT_TEMPLATE"
echo "→ Written project template → ~/.claude/project-claude.template.md"
echo ""

# ── Done ──────────────────────────────────────────────────────────────────────
echo "  ✓ Setup complete. Restart Claude Code to activate all skills and MCPs."
echo ""
echo "  To add project-level skills (Superpowers, Vercel, etc.), copy the"
echo "  resolved template into your project root:"
echo "    cp ~/.claude/project-claude.template.md ~/your-project/CLAUDE.md"
echo "  Then uncomment the skills you need."
echo ""
