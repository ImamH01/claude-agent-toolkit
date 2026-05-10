# Recommended NPM Packages

Standard packages scaffolded into every Next.js project in this stack.

## Install

```bash
npm install clsx tailwind-merge framer-motion lucide-react focus-trap-react
```

## Reference

| Package | Purpose | Notes |
|---------|---------|-------|
| `clsx` | Conditional class string builder | Use via the `cn()` utility |
| `tailwind-merge` | Resolves conflicting Tailwind classes (e.g. two `text-*`) | Use via the `cn()` utility |
| `framer-motion` | Scroll-triggered and entrance animations | Always lazy-load with `dynamic(() => import(), { ssr: false })` |
| `lucide-react` | Tree-shakeable icon set | Import icons individually |
| `focus-trap-react` | Keyboard focus trapping for overlays and modals | Required for WCAG 2.1 SC 2.1.2 compliance |

## cn() Utility

Create `app/lib/cn.ts` immediately after scaffolding:

```ts
import { clsx, type ClassValue } from "clsx";
import { twMerge } from "tailwind-merge";
export function cn(...inputs: ClassValue[]) { return twMerge(clsx(inputs)); }
```

Use for every conditional or merged Tailwind string. Never concatenate class strings manually.

## framer-motion — Lazy Load Pattern

framer-motion's scroll hooks access browser APIs at module evaluation time and
must never run on the server. Always wrap in a dynamic import:

```tsx
// AnimatedSectionWrapper.tsx
"use client";
import dynamic from "next/dynamic";

const AnimatedSection = dynamic(() => import("./AnimatedSection"), {
  ssr: false,
  loading: () => <div className="py-32 bg-[--color-background]" />,
});

export default function AnimatedSectionWrapper() {
  return <AnimatedSection />;
}
```

Pages import the **Wrapper**, never the component directly.
