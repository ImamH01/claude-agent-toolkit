# Claude Skills & Plugins

A centralised repository of skills, MCP plugins, frameworks, and reusable components for Claude Code projects. Install globally via `~/.claude/CLAUDE.md` or reference per-project as needed.

## Quick Install

```bash
# Register this repo as a Claude Code plugin marketplace
/plugin marketplace add YOUR_USERNAME/claude-skills-repo
```

---

## Repository Structure

```
claude-skills-repo/
│
├── frameworks/
│   ├── superpowers/                   # Full dev methodology (obra/superpowers)
│   └── context-engineering/           # Multi-agent & context skills
│
├── skills/
│   ├── design-ui/
│   │   ├── frontend-design/           # Anthropic official
│   │   ├── ui-ux-pro-max/             # nextlevelbuilder
│   │   ├── baseline-ui/
│   │   ├── fixing-accessibility/
│   │   ├── canvas-design/             # Anthropic official
│   │   ├── theme-factory/             # Anthropic official
│   │   └── algorithmic-art/           # Anthropic official
│   │
│   ├── vercel/
│   │   ├── react-best-practices/      # Vercel official
│   │   ├── web-design-guidelines/     # Vercel official
│   │   ├── react-native-guidelines/   # Vercel official
│   │   ├── composition-patterns/      # Vercel official
│   │   └── vercel-deploy-claimable/   # Vercel official
│   │
│   ├── documents/
│   │   ├── docx/                      # Anthropic official
│   │   ├── xlsx/                      # Anthropic official
│   │   ├── pdf/                       # Anthropic official
│   │   └── pptx/                      # Anthropic official
│   │
│   ├── development/
│   │   ├── seo-geo-aeo/               # SEO/GEO/AEO audit (SNLabat)
│   │   ├── simplify/
│   │   ├── init/
│   │   ├── review/
│   │   ├── security-review/
│   │   ├── update-config/
│   │   ├── fewer-permission-prompts/
│   │   ├── webapp-testing/            # Anthropic official
│   │   ├── mcp-builder/               # Anthropic official
│   │   ├── web-artifacts-builder/     # Anthropic official
│   │   ├── skill-creator/             # Anthropic official
│   │   └── claude-api/                # Anthropic official
│   │
│   └── enterprise/
│       ├── brand-guidelines/          # Anthropic official
│       ├── internal-comms/            # Anthropic official
│       ├── doc-coauthoring/           # Anthropic official
│       └── slack-gif-creator/         # Anthropic official
│
├── mcps/
│   ├── chrome-devtools-mcp/           # Google/ChromeDevTools
│   ├── spline-mcp-server/             # Spline 3D
│   └── 21st-magic/                    # Component builder/refiner/inspiration + logo search
│
├── components/
│   ├── cn-utility/                    # clsx + tailwind-merge
│   ├── SectionHeading/                # Reusable heading component
│   └── ButtonLink/                    # Internal/external CTA button
│
├── packages/
│   └── npm.md                         # Recommended NPM packages reference
│
├── CLAUDE.md                          # Global skill references for ~/.claude/
├── CONTRIBUTING.md
└── README.md
```

---

## Global Setup

To make all skills available across every project, add the following to `~/.claude/CLAUDE.md`:

```markdown
# Global Skills

## Frameworks
@~/claude-skills-repo/frameworks/superpowers/SKILL.md
@~/claude-skills-repo/frameworks/context-engineering/SKILL.md

## Design & UI
@~/claude-skills-repo/skills/design-ui/frontend-design/SKILL.md
@~/claude-skills-repo/skills/design-ui/ui-ux-pro-max/SKILL.md
@~/claude-skills-repo/skills/design-ui/baseline-ui/SKILL.md
@~/claude-skills-repo/skills/design-ui/fixing-accessibility/SKILL.md

## Documents
@~/claude-skills-repo/skills/documents/docx/SKILL.md
@~/claude-skills-repo/skills/documents/xlsx/SKILL.md
@~/claude-skills-repo/skills/documents/pdf/SKILL.md
@~/claude-skills-repo/skills/documents/pptx/SKILL.md

## Development
@~/claude-skills-repo/skills/development/seo-geo-aeo/SKILL.md
@~/claude-skills-repo/skills/development/webapp-testing/SKILL.md
@~/claude-skills-repo/skills/development/mcp-builder/SKILL.md
```

> **Keep it lean.** Load heavy frameworks (Superpowers, Context Engineering) at the project level only — not globally — to avoid filling your context window.

---

## Per-Project Setup

In your project's `CLAUDE.md` or `.claude/CLAUDE.md`, reference only what's relevant:

```markdown
# Project Skills

## Stack-specific
@~/claude-skills-repo/skills/vercel/react-best-practices/SKILL.md
@~/claude-skills-repo/skills/vercel/web-design-guidelines/SKILL.md

## This project uses the full dev methodology
@~/claude-skills-repo/frameworks/superpowers/SKILL.md
```

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
| baseline-ui | — | Framework built-in | UI quality and consistency audit |
| fixing-accessibility | — | Framework built-in | WCAG violation finder and fixer |
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
| Spline MCP Server | 41 | [aydinfer/spline-mcp-server](https://github.com/aydinfer/spline-mcp-server) | Spline 3D design tool integration — objects, materials, animations, webhooks |
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
