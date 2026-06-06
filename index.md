<!--
author: James Collier
email: james.collier@vib.be
language: en

font:     Noto Sans Egyptian Hieroglyphs, Noto Sans Ogham

-->

# Getting the Most Out of LLM Coding Assistants

![James Collier](https://indigohouse.nl/wp-content/uploads/2026/05/JamesCollier.png"<a href='https://james.thecolliers.xyz'>James Collier</a>")

## Who are you?

Briefly introduce yourself:

* What is your name?
* What do you work on?
* Why did you join the workshop?

## Workshop goals

* What LLM powered tools are available?

  * What can these tools do well?
  * What don't they do well?
  * How do they fit indo KULeuven GenAI guidelines?

* KULeuven Policies
* Practical workflows including LLMs
* Try things out

## What is "AI"?

* A chat interface? Is [ELIZA](https://www.theguardian.com/technology/2023/jul/25/joseph-weizenbaum-inventor-eliza-chatbot-turned-against-artificial-intelligence-ai) an AI?
* Statistical inference
* Machine learning
* Symbolic reasoning
* Large Language Models (LLMs)


## What is an LLM?

* A statistical model of language => multi-dimensional probability distribution
* Model inferred ("trained") from a "large" volume of data
* Training result is a high-dimensional statistical distribution that estimates the probabilities for possible next tokens given a context.
* Sampling from the distribution produces a "token", repeated sampling produces a sequence of tokens.
* Training often optimizes for observing "human like" sequences of sampled tokens
* Note! None of this implies factual accuracy

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


## Software development tasks

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

* Editors (with syntax highlighting, go-to-definition, etc)
* Static analysis (linters, type checkers)
* Dynamic analysis (valgrind, profilers)
* Tests
* Version control
* Build tools
* Debuggers
* Code generation (macros, procedural generation, etc)
* Logging and monitoring
* Dependency management
* Project management
* Documentation
* Databases

## Help can LLMs assist software development?

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

LLMs have no way to "remember" what they've done before. To "solve" this, agent harnesses like [pi](https://github.com/jayzeng/pi-memory) store what they need to remember in a markdown document

#### MCP servers and integrations

Give the LLM access to external services (e.g. calendar, bug tracker, ...)

https://mcpservers.org/


## Demo

### Step 1: Ask the LLM about the project

> Summarize this project and list potential opportunities for improvement and extension.

### Step 2: Brainstorm about an extension

> /brainstorm ...

### Step 3: Generate a requirements document

> /grill-me


## Your turn: Explore the tools

**Goal**: Add a significant feature to the demo project or to an open-source project of your own (selection).

Now is a good time to install anything you would like to try out locally.
Also a good time to log into (or create accounts for) any services you might want to use (check the README).

## Use the tools for real

Try to understand the advantages and limitations of each tool.

**Some possibilities you could consider:**

* [Ollama](https://github.com/ollama/ollama/issues?q=is%3Aopen+is%3Aissue+label%3A%22good+first+issue%22+-linked%3Apr)
* [Polars dataframes](https://github.com/pola-rs/polars/issues?q=is%3Aopen+is%3Aissue+label%3A%22good+first+issue%22+-linked%3Apr)
* [Biopython](https://github.com/biopython/biopython/issues?q=is%3Aopen+is%3Aissue+label%3A%22good+first+issue%22+-linked%3Apr)
* [GGPlot2](https://github.com/tidyverse/ggplot2/issues/6178)
* [YAML](https://github.com/MaybeJustJames/yaml/issues?q=is%3Aissue+is%3Aopen+-linked%3Apr)
* [A small language model](https://github.com/vibbits/ai-coding-course)

## Questions

* How do I run/build/test the project?
* What does the code do?
* Can you add tests?
* Code review the project
* Can you find any bugs?
* Can you add a feature?

## Discussion

1. What worked well? Which use-case/tool combinations worked well?

2. Maybe useful / situational / it depends

3. Definitely not useful?

## Conclusion

**Do not give LLMs private or sensitive information**

**Do not blindly trust the output**
