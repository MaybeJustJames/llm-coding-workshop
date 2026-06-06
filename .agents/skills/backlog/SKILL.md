---
name: backlog
description: "Manage a ranked PRD backlog. Add, prioritize, list, and pick design docs for autopilot. Use when user says 'backlog', 'add to backlog', 'prioritize', 'what's next', 'queue', or wants to manage which PRDs to implement next."
disable-model-invocation: true
---

# PRD Backlog

Manage a ranked queue of PRD design docs. Add new PRDs, reprioritize, and pick the next one for autopilot.

## Storage

The backlog lives at:
```
.agents/plans/backlog.md
```

Format:
```markdown
# PRD Backlog

## Queue

| # | Priority | PRD | Status | Summary |
|---|----------|-----|--------|---------|
| 1 | P0 | 2026-03-19-auth-redesign-design.md | ready | OAuth2 authentication overhaul |
| 2 | P1 | 2026-03-20-search-index-design.md | ready | Full-text search with Elasticsearch |
| 3 | P1 | 2026-03-20-api-versioning-design.md | grilled | API versioning strategy |
| 4 | P2 | 2026-03-21-notification-system-design.md | draft | Push notification system |

## Completed
| PRD | Completed | Branch |
|-----|-----------|--------|
| 2026-03-18-user-profiles-design.md | 2026-03-19 | feature/user-profiles |
```

## Commands

### /backlog
List the current backlog with priorities and statuses.

### /backlog add <path-to-prd>
Add a PRD to the backlog. Ask for priority via ask_user_question:

```yaml
question: "What priority for this PRD?"
header: "Priority"
multiSelect: false
options:
  - label: "P0 — Critical"
    description: "Blocks other work or has a deadline. Implement next."
  - label: "P1 — Important"
    description: "High value, should be done soon."
  - label: "P2 — Nice to have"
    description: "Good idea, no urgency. Gets done when P0/P1 are clear."
```

### /backlog next
Show the highest-priority PRD with status "ready" or "grilled". This is what `/autopilot` or `/fleet` would pick up next.

### /backlog reprioritize
Show the full backlog and let the user reorder via ask_user_question. Present current order and ask what to move.

### /backlog done <prd-name> <branch>
Move a PRD from the queue to the completed table.

## Statuses

| Status | Meaning |
|--------|---------|
| **draft** | PRD written but not finalized. Needs /grill-me or revision. |
| **grilled** | Stress-tested via /grill-me. Ready for implementation. |
| **ready** | Design complete, issues decomposed. Can be implemented by the user. |
| **in-progress** | Currently being implemented by the user. |
| **review** | Implementation done, waiting for /review-changes. |
| **done** | Released. Moved to Completed table. |

## Integration with Other Skills

- **/brainstorming** produces PRDs → `/backlog add` queues them
- **/grill-me** validates a PRD → status changes to "grilled"
- **/prd-to-issues** decomposes a PRD → status changes to "ready"
- **/review-changes** finishes a PRD → `/backlog done`

## Auto-Update

When brainstorming writes a new design doc to `.agents/plans/`, remind the user: "New PRD saved. Want to add it to the backlog?"
