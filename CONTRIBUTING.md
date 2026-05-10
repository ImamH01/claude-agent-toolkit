# Contributing

Thanks for helping grow this collection. Here's how to add a skill, MCP, or component.

## Adding a Skill

1. Pick the right category folder under `skills/`:
   - `design-ui/` — anything visual or UI-related
   - `vercel/` — Vercel-specific skills
   - `documents/` — file creation and editing
   - `development/` — coding, auditing, testing, tooling
   - `enterprise/` — comms, branding, collaboration

2. Create a subfolder with your skill name (kebab-case):
   ```
   skills/development/my-skill/
   ├── SKILL.md          ← required
   └── README.md         ← optional but encouraged
   ```

3. Your `SKILL.md` must include YAML frontmatter:
   ```yaml
   ---
   name: my-skill
   description: What this skill does and when to use it. Be specific — Claude uses
                this description to decide whether to load the skill.
   ---

   # My Skill

   Instructions here...
   ```

4. Keep `SKILL.md` under 500 lines. Move detailed references to a `references/` subfolder and load them on-demand.

5. Update the relevant table in `README.md`.

6. Open a PR against `main` with a short description of what the skill does.

## Adding a Framework

Frameworks go in `frameworks/` and must include a top-level `SKILL.md` that serves
as the entry point, plus any sub-skill folders the framework needs.

## Adding an MCP Plugin

MCPs go in `mcps/`. Include:
- A `README.md` with install instructions
- A link to the upstream repo
- Any relevant `.mcp.json` config snippets

## Adding a Component

Components go in `components/`. Include:
- The component file itself (`.tsx`)
- A short `README.md` explaining props and usage

## Skill Quality Bar

- Trigger descriptions should be specific — mention exact phrases or contexts
- Include at least one usage example
- Note any required dependencies or tools
- Test the skill before submitting

## What We Don't Accept

- Skills that duplicate functionality already in the repo without meaningfully improving it
- Skills with no clear trigger condition
- Skills longer than 500 lines in the main `SKILL.md`
