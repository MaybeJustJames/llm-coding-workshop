---
name: prd-to-issues
description: Break a PRD/design doc into independently-grabbable local issue files using tracer-bullet vertical slices. Use when user wants to decompose a design into work items, create implementation slices, or break down a PRD into issues.
---

# PRD to Issues

Break a PRD/design doc into independently-grabbable issue files using vertical slices (tracer bullets).

## Process

### 1. Locate the design doc

Ask the user which design doc to decompose. List available docs from `.agents/plans/*.md` as an ask_user_question dropdown.

If the design doc is not already in your context window, read it.

### 2. Explore the codebase (optional)

If you have not already explored the codebase, do so to understand the current state of the code.

### 3. Draft vertical slices

Break the design doc into **tracer bullet** issues. Each issue is a thin vertical slice that cuts through ALL integration layers end-to-end, NOT a horizontal slice of one layer.

Slices may be 'HITL' or 'AFK'. HITL slices require human interaction, such as an architectural decision or a design review. AFK slices can be implemented and merged without human interaction. Prefer AFK over HITL where possible.

<vertical-slice-rules>
- Each slice delivers a narrow but COMPLETE path through every layer (types, ports, adapters, tests, wiring)
- A completed slice is demoable or verifiable on its own
- Prefer many thin slices over few thick ones
</vertical-slice-rules>

### 4. Present and approve slices

Present the proposed breakdown as a numbered list. For each slice, show:

- **Title**: short descriptive name
- **Type**: HITL / AFK
- **Blocked by**: which other slices (if any) must complete first
- **User stories covered**: which user stories from the design doc this addresses

**If called from autopilot context:** Skip user confirmation — auto-approve the breakdown and proceed directly to creating issue files. Never ask questions in autopilot mode.

**If called standalone:** Ask the user to confirm the breakdown. Iterate until approved.

### 5. Create the issue files

For each approved slice, create a local issue file. Save to:

```
.agents/plans/<topic>/issues/NNN-<short-name>.md
```

Where `<topic>` matches the design doc name (e.g. `2026-03-19-drift-detection`) and `NNN` is a zero-padded sequence number (001, 002, ...).

Create issues in dependency order (blockers first) so you can reference real issue numbers in the "Blocked by" field.

<issue-template>
## Parent Design

`.agents/plans/<design-doc-filename>.md`

## What to build

A concise description of this vertical slice. Describe the end-to-end behavior, not layer-by-layer implementation. Reference specific sections of the parent design doc rather than duplicating content.

## Acceptance criteria

- [ ] Criterion 1
- [ ] Criterion 2
- [ ] Criterion 3

## Blocked by

- Blocked by `NNN-<short-name>.md` (if any)

Or "None — can start immediately" if no blockers.

## User stories addressed

Reference by number from the parent design doc:

- User story 3
- User story 7

</issue-template>

Do NOT modify the parent design doc.

### 6. Create an index

After creating all issue files, add an `index.md` to the issues directory:

```
.agents/plans/<topic>/issues/index.md
```

This file contains:
- A dependency graph (which slices block which)
- A suggested implementation order
- A checklist for tracking progress (all unchecked initially)
