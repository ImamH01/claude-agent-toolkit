# Global Claude Skills

This file lives at ~/.claude/CLAUDE.md and loads core skills for every project.

When a user shares this file at the start of a new project, read the ACTIVATION GUIDE
below and recommend which commented-out skills to uncomment based on the project type,
stack, and goals described. Then provide the updated CLAUDE.md for the project.

---

## ACTIVATION GUIDE

### Always loaded (global)
- design-ui/frontend-design — any UI or frontend work
- design-ui/ui-ux-pro-max — any UI/UX design decisions
- design-ui/baseline-ui — loaded on all projects, audits UI quality
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

@~/Documents/GitHub/claude-agent-toolkit/skills/design-ui/frontend-design/SKILL.md
@~/Documents/GitHub/claude-agent-toolkit/skills/design-ui/ui-ux-pro-max/SKILL.md
@~/Documents/GitHub/claude-agent-toolkit/skills/design-ui/baseline-ui/SKILL.md
@~/Documents/GitHub/claude-agent-toolkit/skills/design-ui/fixing-accessibility/SKILL.md

## Documents

@~/Documents/GitHub/claude-agent-toolkit/skills/documents/docx/SKILL.md
@~/Documents/GitHub/claude-agent-toolkit/skills/documents/xlsx/SKILL.md
@~/Documents/GitHub/claude-agent-toolkit/skills/documents/pdf/SKILL.md
@~/Documents/GitHub/claude-agent-toolkit/skills/documents/pptx/SKILL.md

## Development

@~/Documents/GitHub/claude-agent-toolkit/skills/development/seo-geo-aeo/SKILL.md
@~/Documents/GitHub/claude-agent-toolkit/skills/development/webapp-testing/SKILL.md
@~/Documents/GitHub/claude-agent-toolkit/skills/development/mcp-builder/SKILL.md
@~/Documents/GitHub/claude-agent-toolkit/skills/development/skill-creator/SKILL.md

## Enterprise

@~/Documents/GitHub/claude-agent-toolkit/skills/enterprise/brand-guidelines/SKILL.md
@~/Documents/GitHub/claude-agent-toolkit/skills/enterprise/internal-comms/SKILL.md

---

# Project-level only (uncomment in your project CLAUDE.md)

# HEAVY FRAMEWORKS — uncomment for serious dev projects
# @~/Documents/GitHub/claude-agent-toolkit/frameworks/superpowers/SKILL.md
# @~/Documents/GitHub/claude-agent-toolkit/frameworks/context-engineering/SKILL.md

# VERCEL / REACT — uncomment for React, Next.js, React Native projects
# @~/Documents/GitHub/claude-agent-toolkit/skills/vercel/react-best-practices/SKILL.md
# @~/Documents/GitHub/claude-agent-toolkit/skills/vercel/web-design-guidelines/SKILL.md
# @~/Documents/GitHub/claude-agent-toolkit/skills/vercel/react-native-guidelines/SKILL.md
# @~/Documents/GitHub/claude-agent-toolkit/skills/vercel/composition-patterns/SKILL.md
# @~/Documents/GitHub/claude-agent-toolkit/skills/vercel/vercel-deploy-claimable/SKILL.md