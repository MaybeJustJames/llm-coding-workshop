---
name: grill-me
description: Interview the user relentlessly about a plan or design until reaching shared understanding, resolving each branch of the decision tree. Use when user wants to stress-test a plan, get grilled on their design, or mentions "grill me", "challenge this", "poke holes", "stress test this design".
---

# Grill Me

Interview the user relentlessly about every aspect of a plan or design until reaching shared understanding. Walk down each branch of the decision tree, resolving dependencies between decisions one by one.

## Core Principle

If a question can be answered by exploring the codebase, **explore the codebase instead of asking**. Only ask when you genuinely need the user's intent, preference, or domain knowledge. Use Explore subagents and Grep/Read to answer your own questions first.

## How It Works

1. **Load the plan** — read the design doc, plan file, or have the user describe what they want grilled
2. **Build a decision tree** — identify every assumption, ambiguity, dependency, and open question
3. **Walk each branch** — one question at a time via `ask_user_question`, depth-first
4. **Resolve dependencies** — if decision B depends on decision A, resolve A first
5. **Challenge answers** — if an answer creates contradictions or risks, push back with evidence

## Question Style

Be direct. Be relentless. Don't accept vague answers.

- "You said X, but the codebase shows Y. Which is it?"
- "This assumes Z exists, but I checked and it doesn't. How do you handle that?"
- "If we go with A here, that forces B later. Are you OK with that trade-off?"
- "You're solving for the happy path. What happens when [edge case]?"

## ask_user_question Usage

Every question uses `ask_user_question`. Structure options as the realistic answers — not "yes/no" but the actual choices with their implications.

```yaml
question: "FormatReader.read() returns list but everything else uses tuples. Inconsistency or intentional?"
header: "Return type"
multiSelect: false
options:
  - label: "Change to tuple (Recommended)"
    description: "Matches immutability pattern everywhere else. Readers build the list internally, freeze it on return."
  - label: "Keep as list"
    description: "Readers may need to append incrementally. Forcing tuple adds a conversion step."
  - label: "Depends on the reader"
    description: "Some return tuple, some return list. Let the protocol allow both via Sequence."
```

## What to Grill On

For each decision in the plan, probe:

1. **Necessity** — do we actually need this? What breaks without it?
2. **Alternatives** — what other approaches exist? Why is this one better?
3. **Dependencies** — what does this force downstream? What must be true for this to work?
4. **Edge cases** — what happens with empty input, huge input, concurrent access, missing data?
5. **Reversibility** — how hard is it to undo this if we're wrong?
6. **Consistency** — does this match how the rest of the codebase works?

## Codebase-First

Before asking any question, check if the codebase already answers it:

- "How many consumers does this port have?" → grep, don't ask
- "What pattern does the existing code use?" → read the files
- "Is this type used anywhere?" → search first
- "Would this create a circular import?" → trace the dependency graph

Only escalate to the user when you hit a genuine design choice that code can't answer.

## Flow

```
Load plan/design
     │
     ▼
Identify all decision points
     │
     ▼
┌─ For each decision point ──────────┐
│                                     │
│  Can I answer this from codebase?   │
│  YES → investigate, state finding   │
│  NO   ask_user_question             │
│                                     │
│  Does the answer create new         │
│  questions or contradictions?       │
│  YES → follow up immediately        │
│  NO  → move to next decision        │
│                                     │
└─────────────────────────────────────┘
     │
     ▼
All branches resolved → summarize decisions
```

## When Done

After all branches are resolved:
1. Summarize every decision made in a compact table
2. Flag any remaining risks or assumptions
3. Update the design doc with the resolved decisions
4. Ask the user what's next via `ask_user_question`:
   - **prd-to-issues** — decompose the grilled design into vertical slices
   - **backlog add** — add to the PRD backlog for autopilot later
   - **Done for now** — design is saved, user will act on it later
