---
name: baseline-ui
description: Use when adding UI components to a project that has BaselineUI installed. Triggers on requests to add, install, or use BaselineUI components.
---

# BaselineUI Component Skill

BaselineUI is a component library installed and managed through its CLI tool.

## When to Apply

Use this skill when the user asks to:
- Add a BaselineUI component to their project
- Set up BaselineUI in a new project
- Browse or list available BaselineUI components

## Setup (first time)

```bash
npm i baseline-ui-installer
npx baselineui init
```

## Adding Components

```bash
npx baselineui add <component-name>
```

Example:
```bash
npx baselineui add flip-words
npx baselineui add button
npx baselineui add card
```

## Workflow

1. Check if `baseline-ui-installer` is in `package.json`. If not, run setup first.
2. Use `npx baselineui add <component-name>` to install the component into the project.
3. Import and use the component as directed by the installed file.

## Notes

- Components are copied directly into the project (similar to shadcn/ui pattern).
- If the user is unsure of the component name, suggest they check the BaselineUI Discord or docs for the component list.
- BaselineUI is MIT licensed and free to use.
