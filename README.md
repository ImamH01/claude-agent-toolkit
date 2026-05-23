# Claude Skills & Plugins

A centralised repository of skills, MCP plugins, frameworks, and reusable components for Claude Code projects. Install globally via `~/.claude/CLAUDE.md` or reference per-project as needed.

## Prerequisites

Install these before running setup:

| Dependency | Required for | Install |
| --- | --- | --- |
| **Git** | Cloning the repo and submodules | [git-scm.com](https://git-scm.com) |
| **Node.js v20+** | chrome-devtools MCP (`npx`); docx and SEO skills install npm packages at runtime | [nodejs.org](https://nodejs.org) |
| **Google Chrome** | chrome-devtools MCP | [google.com/chrome](https://www.google.com/chrome) |
| **Python 3** | setup.sh uses it for JSON manipulation; webapp-testing, pdf, and docx skills run Python scripts | Pre-installed on macOS/Linux; [python.org](https://www.python.org) on Windows |

> **LibreOffice note:** The `docx` and `pdf` skills use LibreOffice for format conversion. This works automatically inside Claude Code's hosted cloud environment (claude.ai/code). If you're running Claude Code locally and want PDF export from these skills, install [LibreOffice](https://www.libreoffice.org).

---

## Quick Install

```bash
# 1. Clone with all submodules
git clone --recurse-submodules https://github.com/ImamH01/claude-agent-toolkit

# 2. Run the setup script
cd claude-agent-toolkit
bash setup.sh
```

`setup.sh` does five things:

- Checks that required dependencies (Git, Node.js v20+, Python 3) are installed
- Initialises all submodules (downloads every skill and framework)
- Backs up your existing `~/.claude/CLAUDE.md` if one exists
- Writes a new `~/.claude/CLAUDE.md` with the correct absolute paths for your machine
- Registers the chrome-devtools MCP globally in `~/.claude/settings.json`
- Writes a resolved `~/.claude/project-claude.template.md` for starting new projects

Restart Claude Code after running it. All skills load automatically from that point on.

**To update later:**

```bash
cd claude-agent-toolkit
git pull --recurse-submodules
bash setup.sh
```

---

## Repository Structure

```text
claude-agent-toolkit/
│
├── frameworks/
│   ├── superpowers/                   # obra/superpowers — TDD, spec-first, parallel agents
│   └── context-engineering/           # Multi-agent patterns, memory systems
│
├── skills/
│   ├── anthropics/                    # Anthropic official skills (submodule)
│   │   └── skills/
│   │       ├── frontend-design/
│   │       ├── docx/ xlsx/ pdf/ pptx/
│   │       ├── webapp-testing/
│   │       ├── mcp-builder/
│   │       ├── skill-creator/
│   │       ├── brand-guidelines/
│   │       ├── internal-comms/
│   │       └── ... (canvas-design, theme-factory, algorithmic-art, etc.)
│   │
│   ├── design-ui/
│   │   ├── ui-ux-pro-max/             # nextlevelbuilder — 67 styles, 161 palettes
│   │   ├── baseline-ui/               # BaselineUI component library skill
│   │   └── fixing-accessibility/      # airowe — axe-core + jsx-a11y WCAG audit
│   │
│   ├── vercel/                        # Vercel official skills (submodule)
│   │   └── skills/
│   │       ├── react-best-practices/
│   │       ├── web-design-guidelines/
│   │       ├── react-native-skills/
│   │       ├── composition-patterns/
│   │       └── deploy-to-vercel/
│   │
│   └── development/
│       ├── graphify/                  # safishamsi — codebase → knowledge graph (/graphify)
│       └── seo-geo-aeo/               # SNLabat — SEO/GEO/AEO audit
│
├── mcps/
│   ├── chrome-devtools-mcp/           # Google/ChromeDevTools (registered globally by setup)
│   └── spline-mcp-server/             # ⚠️ Archived — included for reference only
│
├── setup.sh                           # macOS/Linux install script
├── setup.ps1                          # Windows install script
├── project-claude.template.md         # Template for per-project CLAUDE.md
├── .mcp.json                          # Project-scoped MCP config
├── CLAUDE.md                          # Setup instructions for Claude Code
├── CONTRIBUTING.md
└── README.md
```

---

## Global Setup

`setup.sh` handles this automatically — it writes `~/.claude/CLAUDE.md` with the correct absolute paths for wherever you cloned the repo. No manual path editing needed.

> **Keep it lean.** Heavy frameworks (Superpowers, Context Engineering) are commented out by default. Uncomment them in your project-level `CLAUDE.md`, not globally, to avoid filling your context window on every conversation.

---

## Per-Project Setup

Copy the commented-out `@` lines from the bottom of `~/.claude/CLAUDE.md` into your project's `CLAUDE.md`:

```markdown
# Project Skills — uncomment what this project needs

# Full dev methodology (TDD, spec-first, parallel agents)
# @/path/to/toolkit/frameworks/superpowers/skills/using-superpowers/SKILL.md

# React / Next.js
# @/path/to/toolkit/skills/vercel/skills/react-best-practices/SKILL.md
# @/path/to/toolkit/skills/vercel/skills/web-design-guidelines/SKILL.md

# React Native / Expo
# @/path/to/toolkit/skills/vercel/skills/react-native-skills/SKILL.md
```

After running `setup.sh`, your `~/.claude/CLAUDE.md` has these lines with the real paths already filled in — just copy and uncomment.

---

## Skills Reference

### Frameworks

| Name | Stars | Source | Description |
|------|-------|--------|-------------|
| Superpowers | 176k | [obra/superpowers](https://github.com/obra/superpowers) | Complete dev methodology — TDD, spec-first, subagent-driven development |
| Agent Skills for Context Engineering | 12k | [muratcankoylan/Agent-Skills-for-Context-Engineering](https://github.com/muratcankoylan/Agent-Skills-for-Context-Engineering) | Context engineering, multi-agent patterns, memory systems |

### Design & UI Skills

| Name | Stars | Source | Description |
|------|-------|--------|-------------|
| frontend-design | 131k | [anthropics/skills](https://github.com/anthropics/skills) | Production-grade frontend, avoids AI-generic aesthetics |
| UI UX Pro Max | 73.6k | [nextlevelbuilder/ui-ux-pro-max-skill](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill) | 67 styles, 161 palettes, 57 font pairings, AI design system generator |
| baseline-ui | — | [Baseline-UI/npm-registry](https://github.com/Baseline-UI/npm-registry) | CLI-driven component library installer (similar to shadcn/ui pattern) |
| fixing-accessibility | — | [airowe/claude-a11y-skill](https://github.com/airowe/claude-a11y-skill) | axe-core + eslint-plugin-jsx-a11y WCAG 2.1 AA audit — runtime, static, or full mode |
| canvas-design | — | [anthropics/skills](https://github.com/anthropics/skills) | Visual art in .png and .pdf |
| theme-factory | — | [anthropics/skills](https://github.com/anthropics/skills) | 10 pre-set professional themes |
| algorithmic-art | — | [anthropics/skills](https://github.com/anthropics/skills) | Generative art with p5.js |

### Vercel Skills

| Name | Stars | Source | Description |
|------|-------|--------|-------------|
| react-best-practices | 22.1k | [vercel-labs/agent-skills](https://github.com/vercel-labs/agent-skills) | 40+ React/Next.js performance rules from Vercel Engineering |
| web-design-guidelines | 22.1k | [vercel-labs/agent-skills](https://github.com/vercel-labs/agent-skills) | 100+ UI rules across accessibility, performance, UX |
| react-native-guidelines | 22.1k | [vercel-labs/agent-skills](https://github.com/vercel-labs/agent-skills) | 16 React Native best practice rules |
| composition-patterns | 22.1k | [vercel-labs/agent-skills](https://github.com/vercel-labs/agent-skills) | React composition patterns — compound components, state lifting |
| vercel-deploy-claimable | 22.1k | [vercel-labs/agent-skills](https://github.com/vercel-labs/agent-skills) | One-command Vercel deployment with claimable ownership |

### Document Skills

| Name | Source | Description |
|------|--------|-------------|
| docx | [anthropics/skills](https://github.com/anthropics/skills) | Word documents — TOC, tracked changes, images |
| xlsx | [anthropics/skills](https://github.com/anthropics/skills) | Excel — zero formula errors, charts, pivot tables |
| pdf | [anthropics/skills](https://github.com/anthropics/skills) | PDF full lifecycle — extract, merge, split, OCR |
| pptx | [anthropics/skills](https://github.com/anthropics/skills) | PowerPoint — templates, layouts, speaker notes |

### Development Skills

| Name | Stars | Source | Description |
|------|-------|--------|-------------|
| Graphify | 52k | [safishamsi/graphify](https://github.com/safishamsi/graphify) | Turn any codebase, docs, papers, images, or videos into a queryable knowledge graph. Provides `/graphify` command. Requires `pip install graphifyy` |
| SEO / GEO / AEO Audit | — | [SNLabat/SEO-GEO-AEO-Skill](https://github.com/SNLabat/SEO-GEO-AEO-Skill) | Full search visibility audit — traditional SEO, AI search (GEO), answer engines (AEO) |
| simplify | — | Framework built-in | Code quality and reuse review |
| init | — | Framework built-in | Generate CLAUDE.md for new codebase |
| review | — | Framework built-in | Pull request review |
| security-review | — | Framework built-in | Security audit |
| update-config | — | Framework built-in | Claude Code settings and hooks |
| fewer-permission-prompts | — | Framework built-in | Reduce tool permission prompts |
| webapp-testing | — | [anthropics/skills](https://github.com/anthropics/skills) | Playwright-based web app testing |
| mcp-builder | — | [anthropics/skills](https://github.com/anthropics/skills) | Build high-quality MCP servers |
| web-artifacts-builder | — | [anthropics/skills](https://github.com/anthropics/skills) | Build claude.ai HTML artifacts |
| skill-creator | — | [anthropics/skills](https://github.com/anthropics/skills) | Create new skills following best practices |
| claude-api | — | [anthropics/skills](https://github.com/anthropics/skills) | Work with the Claude API |

### Enterprise Skills

| Name | Source | Description |
|------|--------|-------------|
| brand-guidelines | [anthropics/skills](https://github.com/anthropics/skills) | Apply brand colours and typography |
| internal-comms | [anthropics/skills](https://github.com/anthropics/skills) | Status reports, newsletters, FAQs |
| doc-coauthoring | [anthropics/skills](https://github.com/anthropics/skills) | Structured document collaboration |
| slack-gif-creator | [anthropics/skills](https://github.com/anthropics/skills) | Animated GIFs for Slack |

### MCP Plugins

| Name | Stars | Source | Description |
|------|-------|--------|-------------|
| Chrome DevTools MCP | 31.6k | [ChromeDevTools/chrome-devtools-mcp](https://github.com/ChromeDevTools/chrome-devtools-mcp) | Full Chrome browser control — performance, network, debugging, Lighthouse |
| Spline MCP Server | 41 | [aydinfer/spline-mcp-server](https://github.com/aydinfer/spline-mcp-server) | ⚠️ Archived — Spline has no public REST API; the ~130 tools will fail. Included for reference only. |
| 21st Magic (×3) | — | 21st.dev | Component builder, inspiration browser, and refiner |
| Logo Search | — | 21st.dev | Find and integrate brand logos |
| claude-api | — | [anthropics/skills](https://github.com/anthropics/skills) | Claude API skill for building Claude-powered apps |

---

## NPM Packages

Standard packages scaffolded into every Next.js project:

| Package | Purpose |
|---------|---------|
| `clsx` + `tailwind-merge` | Conditional + conflict-safe Tailwind class strings |
| `framer-motion` | Scroll-triggered animations (lazy-loaded, SSR-safe) |
| `lucide-react` | Tree-shakeable icon set |
| `focus-trap-react` | Keyboard focus trapping for overlays and modals |

---

## Reusable Components

Recreated on every Next.js project:

| Component | Path | Description |
|-----------|------|-------------|
| `cn()` | `app/lib/cn.ts` | clsx + tailwind-merge utility |
| `SectionHeading` | `app/components/SectionHeading.tsx` | Label + heading + accent divider |
| `ButtonLink` | `app/components/ButtonLink.tsx` | Internal/external CTA with two variants |

---

## Contributing

1. Fork this repo
2. Add your skill in the appropriate category folder
3. Each skill needs at minimum a `SKILL.md` with YAML frontmatter (`name`, `description`) and instructions
4. Use `skills/development/skill-creator` as a template
5. Open a PR

See `CONTRIBUTING.md` for the full guide.

---

## Credits

Skills and plugins sourced from:
- [Anthropic](https://github.com/anthropics/skills)
- [obra/superpowers](https://github.com/obra/superpowers)
- [muratcankoylan](https://github.com/muratcankoylan/Agent-Skills-for-Context-Engineering)
- [nextlevelbuilder](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill)
- [vercel-labs](https://github.com/vercel-labs/agent-skills)
- [ChromeDevTools](https://github.com/ChromeDevTools/chrome-devtools-mcp)
- [aydinfer](https://github.com/aydinfer/spline-mcp-server)
- [SNLabat](https://github.com/SNLabat/SEO-GEO-AEO-Skill)
