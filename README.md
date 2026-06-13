# LLM Coding Workshop

## Setup

!NOTE! The tools we will be exploring in this workshop are _off-limits by default_ within KU Leuven, however use in a research context can be acceptable, provided it happens in an isolated, shielded environment. It is *YOUR RESPONSIBILITY* to take measures to limit risks.

I have written setup instructions below which isolate using container technology, this is the happy path for this course. However feel free to explore alternatives such as running a Virtual Machine.

1. Install a coding editor such as [VS Code](https://code.visualstudio.com/) with the [devcontainers](https://devcontainers.github.io/) integration ([the VS Code extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers))
2. Install [Docker](https://www.docker.com/)
3. Open the repo in VS Code and choose **Reopen in Container**.


### Alternative: Standalone shell from a terminal

You can either pull the prebuilt image (from: `ghcr.io/maybejustjames/llm-coding-workshop:latest`) or **build it yourself** once
(from the repo root):

```sh
docker build --build-arg USER_UID=$(id -u) --build-arg USER_GID=$(id -g) -t llm-coding-workshop .
```

**Run** an isolated shell with the repo mounted at `/workspace`:

```sh
docker run -it --rm \
  --cap-drop ALL \
  --security-opt no-new-privileges \
  -v pi-config:/home/dev/.pi
  -v "$PWD":/workspace \
  pi-dev
```


### LLM Providers

You have many options. Although unfortunately your KULeuven Microsoft Copilot subscription is not one of them. 

* If you have a free Github account, at the time of writing you get "2000 completions / month". I don't know how far this will get you.
* Install [LM Studio](https://lmstudio.ai/) and run a local LLM. This will depend on how powerful your machine is.
* Create an account on [Open Router](https://openrouter.ai) and use a free LLM (e.g. [Kimi K2](https://openrouter.ai/moonshotai/kimi-k2.6:free/providers))
* Select one of [these providers](https://pi.dev/docs/latest/providers) and pay for an account. [Deepseek](https://platform.deepseek.com) is very cheap, $2 USD should be enough for the workshop.
