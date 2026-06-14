<!--
author: James Collier
email: james@thecolliers.xyz
language: en

font:     Noto Sans Egyptian Hieroglyphs, Noto Sans Ogham

-->

# Getting the Most Out of LLM Coding Assistants

![James Collier](https://indigohouse.nl/wp-content/uploads/2026/05/JamesCollier.png"<a href='https://james.thecolliers.xyz'>On the world wide web</a>")

              {{1}}
<div>
**Dr. James Collier**

* 10+ years across embedded medical devices → web apps → supercomputers
* PhD (Computer Science, Monash University, Australia): information compression for protein structural alignment
* Formerly VIB Bioinformatics Core / Metabolomice Core
</div>

## Who are you?

Briefly introduce yourself:

* What is your name?
* What do you work on?
* Why did you join the workshop?
* And (**if you're comfortable sharing**) your confidence level as a programmer

## Workshop goals

* What LLM powered tools are available?

  * What can these tools do well?
  * What don't they do well?
  * How do they fit into KULeuven rules & guidelines?

* KULeuven Policies
* Practical workflows using LLMs
* Try things out yourself

## What is "AI"?

* ["Can machines think?" Turing 1950](https://doi.org/10.1093/mind/LIX.236.433)
* A chat interface? Is [ELIZA](https://www.theguardian.com/technology/2023/jul/25/joseph-weizenbaum-inventor-eliza-chatbot-turned-against-artificial-intelligence-ai)  from 1966 (a few hundred lines of pattern-matching) an AI?

2 competing approaches: *write the rules* vs. *infer from data*

### Symbolic reasoning
* Symbolic manipulation and logic. Dartmouth workshop coins "AI" ["Logic Theorist" Newell & Simon, 1956](https://en.wikipedia.org/wiki/Logic_Theorist)
* Search. "A*" [Hart, Nilsson & Raphael, 1968](https://ieeexplore.ieee.org/document/4082128/)
* Knowledge base of facts -> Expert systems. e.g. ["MYCIN" Shortliffe, 1970s](https://en.wikipedia.org/wiki/Mycin)
* AI Winter. Overpromised, underdelivered -> [Lighthill report (1973)](https://en.wikipedia.org/wiki/Lighthill_report); expert-systems bust (late 1980s)

### Statistical inference
* Machine learning. [A. Samuel, 1959](https://dl.acm.org/doi/10.1147/rd.33.0210)
* (Deep) neural networks. "Perceptron" [Rosenblatt, 1958](https://doi.org/10.1037/h0042519) -> [AlexNet](https://en.wikipedia.org/wiki/AlexNet) wins ImageNet in 2012 (Data + GPUs)
* Notice ^^^ another winter
* "Transformer" [Attention is all you need (2017)](https://arxiv.org/abs/1706.03762) -> Large Language Models (LLMs) -> GPT-3 (2020) -> ChatGPT (2022)


## What is an LLM?

* You'll work on one today: the demo `inference` project is a 2-gram "language model"
* A statistical model of language => multi-dimensional probability distribution
* Model inferred ("trained") from a "large" volume of data
* "Token" is a sub-word chunk e.g. 'strawberry'   -> ['st', 'raw', 'berry'] -> [302, 1618, 19772]
* Training result is a high-dimensional statistical distribution that estimates the probabilities for possible next tokens given a context.
* Sampling from the distribution produces a "token", repeated sampling produces a sequence of tokens.
* Sampling is random (based on a `temperature` parameter).  Output is **NOT DETERMINISTIC**!
* Training often optimizes for observing plausible "human like" sequences of sampled tokens
* Each prompt is stateless; the entire conversation is re-fed as context every subsequent prompt (**NO MEMORY** & **NO LEARNING**)
* None of this implies factual accuracy. LLMs have no model of the world.
* "Hallucination" isn't a bug; it's the same next-token sampling, just wrong.

## KULeuven Policies

> If you have a hammer, every problem looks like a nail

* You are not required to use LLMs
* Use of LLMs is your own choice and you are responsible for the output
* You must not submit confidential or private information to an LLM (doing so may have legal consequences)
* Use of unsupervised "agents" is not permitted

You should take the time to familiarise yourself with the rules and guidelines at KULeuven:

* https://www.kuleuven.be/english/genai
* https://www.kuleuven.be/english/genai/tools-overview
* https://www.kuleuven.be/english/genai/agentic-ai
* https://admin.kuleuven.be/personeel/english/ICT-codeofconduct-staff


### Why?

                           {{0}}
[Replit AI agent deletes a production database](https://www.theregister.com/software/2025/07/21/vibe-coding-service-replit-deleted-production-database/719783)


                           {{1}}
[AI Developer productivity improvement not clear](https://metr.org/blog/2026-02-24-uplift-update/#wider-adoption-of-ai-has-made-it-more-difficult-to-measure-task-level-productivity)


                           {{2}}
[PocketOS AI agent deletes production database and backups](https://www.theregister.com/software/2026/04/27/cursor-opus-agent-snuffs-out-startups-production-database/5224442)


                           {{3}}
[Prompt injection botnet](https://snyk.io/blog/cline-supply-chain-attack-prompt-injection-github-actions/)


                           {{4}}
[Supply chain attacks on AI agent tooling](https://phoenix.security/accelerating-supply-chain-attacks-npm-pypi-vsx-ai-enabled-2026/)


                           {{5}}
[Lovable exposes credentials, user data for 48 days](https://thenextweb.com/news/lovable-vibe-coding-security-crisis-exposed)


                           {{6}}
[Claude Code terminal flickering saga](https://steipete.me/posts/2025/signature-flicker)


                           {{7}}
[43% of AI generated code needs debugging in production](https://venturebeat.com/technology/43-of-ai-generated-code-changes-need-debugging-in-production-survey-finds)


                           {{8}}
[AI agent wipes production infra](https://alexeyondata.substack.com/p/how-i-dropped-our-production-database)


                           {{9}}
[AI agent deletes entire hard-drive](https://www.reddit.com/r/ClaudeAI/comments/1pgxckk/claude_cli_deleted_my_entire_home_directory_wiped/)


                           {{10}}
[Cleaning up after AI rockstar developers](https://www.codingwithjesse.com/blog/rockstar-developers/)


                           {{11}}
[Loss of reasoning skill](https://www.sciencedirect.com/science/article/pii/S0747563224002541)


                           {{12}}
[Your Brain on ChatGPT](https://www.media.mit.edu/projects/your-brain-on-chatgpt/overview/)


                           {{13}}
[Human costs of LLMs](https://www.amnesty.org/en/documents/pol40/0996/2026/en/)


                           {{14}}
[AI Phychosis](https://centerforhumanetechnology.substack.com/p/the-attachment-economy-is-here-were)

                           {{15}}
I could go on...


## Software development tasks

                           {{1}}
* Building programs from scratch
* Adding features to existing programs
* Fixing bugs in existing programs
* Refactoring existing programs
* Collaborating with other programmers
* Testing
* Deployment
* Maintenance
* Code review
* Learning new tools/libraries/techniques/...
* Trying to understand code
* Design

## What tools do we already use for these tasks?

                           {{1}}
* Editors (with syntax highlighting, go-to-definition, etc)
* Static analysis (linters, type checkers)
* Dynamic analysis (valgrind, profilers, sanitizers)
* Tests
* Version control (`git`, `mercurial`, `fossil`, ...)
* Build tools (`make`, `cmake`, `bazel`, ...)
* Debuggers
* Code generation (macros, procedural generation, etc)
* CI pipelines
* Logging and (performance) monitoring (Prometheus, Grafana, OpenTelemetry, ...)
* Benchmark and profiling tools
* Dependency management (`uv`, `npm`, `cabal`, ...)
* Project management (Redmine, Forgejo, ...)
* Documentation. (Zeal, Quarto, D2, ...)
* Databases
* Containers

## How can LLMs assist software development?

### Code generation

                           --{{0}}--
**In-editor autocomplete**

!?[In editor auto-complete](images/autocomplete-opt.mp4)<!--
muted="true"
loop="true"
autoplay="true"
-->

#### Generate from comment description

!?[Generate code from comment](images/gen-from-comment-opt.mp4)<!--
muted="true"
loop="true"
autoplay="true"
-->

#### Generate in a chat

> Write a docstring for the `Token` class and all of it's methods

!?[Generate code in chat](images/gen-in-chat-opt.mp4)<!--
muted="true"
loop="true"
autoplay="true"
-->

#### Generate code from unit tests

> Generate a function called `make_tokens` based on the tests provided in `test_make_tokens`

!?[Generate code from tests](images/gen-from-tests-opt.mp4)<!--
muted="true"
loop="true"
autoplay="true"
-->

#### Generate unit tests from code

> Generate pytest style unit tests for the `make_tokens` function and the `Token` class

!?[Generate tests from code](images/gen-tests-opt.mp4)<!--
muted="true"
loop="true"
autoplay="true"
-->

#### Translation between languages (e.g. Python -> Perl)

> Convert the `tokenize` function into idiomatic Perl

!?[Converl Python to Perl](images/python-to-perl-opt.mp4)<!--
muted="true"
loop="true"
autoplay="true"
-->

#### Translation between technologies (e.g. SQL -> SQLAlchemy)

See [bad_sql_results.txt](bad_sql_results.txt)

### Pair programming

* Refactoring
* Explaining code

!?[Explain and refactor](images/pairprog-opt.mp4)<!--
muted="true"
loop="true"
autoplay="true"
-->

### Search engine

> What libraries are available to parse YAML in Python? What are their pros and cons?

!?[What YAML libraries are available in Python](images/yaml-opt.mp4)<!--
muted="true"
loop="true"
autoplay="true"
-->

### An example of bad results

> What libraries are available to decode YAML documents in the Elm language?

!?[Example of bad search engine results](images/bad-results-opt.mp4)<!--
muted="true"
loop="true"
autoplay="true"
-->

### Code review

> Review the code in `inference.py` and make concise suggestions about quality, security, readability, and performance.

!?[Code review](images/code-review-opt.mp4)<!--
muted="true"
loop="true"
autoplay="true"
-->

### Bug fixing

> There's a bug in the program where it doesn't print the last generated word. Can you suggest fixes?

!?[Code review](images/bugfix-opt.mp4)<!--
muted="true"
loop="true"
autoplay="true"
-->

### Agents

> go and build this feature for me.

!?[Agent harness](images/agent-harness.mp4)<!--
muted="true"
loop="true"
autoplay="true"
-->

#### Skills

[Agent skills standard](https://agentskills.io)
[Agent skills library](https://mcpservers.org/agent-skills)

Quick way to give the LLM specific instructions without repeated typing.

We'll explore these more later.

#### Memories

LLMs have no way to "remember" what they've done before. To "solve" this, agent harnesses like [pi](https://github.com/jayzeng/pi-memory) store what they need to remember in a [standardised markdown document](https://agents.md/).

                {{1}}
```
`inference` a "small language model" in Haskell. It builds a
distribution from an input text and generates tokens from a single-word prompt.
Source in `app/Main.hs`; sample texts in `data/`.

## Build & run

This is a Cabal project (`inference.cabal`).

` ``sh
cabal build          # compile
cabal run inference  # run the executable
` ``

## Conventions

- Keep `-Wall` clean. The build enables it; don't introduce warnings.
- The code uses an explicit `Prelude` import list (`NoImplicitPrelude`). When you
  use a new function, add it to the relevant import list rather than enabling
  implicit Prelude.
- Match the existing style: explicit imports, `OverloadedStrings`, `Data.Text`.

## Notes for agents

- There is no test suite yet. If you add one, add a `test-suite` stanza to
  `inference.cabal` and document how to run it here.
- Don't commit `dist-newstyle/` (build artifacts).
```

#### MCP servers and integrations

Give the LLM access to external services (e.g. calendar, bug tracker, ...)

https://mcpservers.org/

I won't go into this since KU-Leuven policy prohibits this and `pi` does not implement MCP.

You can just write your own integration scripts or use an integration CLI tool rather than vibing 😉.


### "Vibe Coding"

![Vibe Coding](images/karpathy-vibecoding.png)

## When *not* to reach for an LLM

* When you can't verify the result (and it matters).

* When the input is potentially confidential or contains personal information.

* When you'd learn more by doing it yourself, and learning is the point.

* When a deterministic tool already does the job better (formatting, type checking, well known libraries).


## Demo workflow

1. There are 2 clear bugs in the program as implemented.

2. There is a big optimization opportunity.

3. There is a glaring engineering issue.

4. Does the LLM push-back against dumb ideas?

### Step 0: Demo the `inference` program

                 {{1}}
```sh
cabal run inference data/all.txt James
```

                 {{2}}
```sh
cabal test
``` 

### Step 1: Ask the LLM about the project

> Summarize this project, point out any glaring bugs, list potential opportunities for improvement

### Step 2: Brainstorm about an extension

> /skill:brainstorm ...

### Step 3: Generate a requirements document

> /skill:grill-me

### Step 4: Break requirements into tasks

> /skill:prd-to-issues

### Step 5: Write a skill

Write a skill to suggest and review tests (or something more relevent to whatever was discussed above).

## (Automated) verification and "guard rails"
                      {{0}}
More important than ever: Verify your dependencies (... at least aren't slop/typo squatted)

                      {{1}}
<div>
Lean on the deterministic tools you can trust to check the LLM output:
* The compiler
* Automated tests
* Type checking and linting
* Version control
</div>

## Your turn: Explore for yourself

Work on my demo project or your own **non-confidential** project.

Now is a good time to install anything you would like to try out locally (see README.md).
Also a good time to log into (or create accounts for) any services you might want to use (check the README.md).

## Use the tools for real

Try to understand advantages and limitations

* How do I run/build/test the project?
* What does the code do?
* Can you add tests?
* Code review the project
* Can you find any bugs?
* Can you add a feature?
* Can you define your own useful `SKILL.md`?

## Discussion

1. What worked well? Which use-case/tool combinations worked well?

2. Maybe useful / situational / it depends

3. Definitely not useful?

## Conclusion

**Do not give LLMs private or sensitive information**

**Do not blindly trust the output**
