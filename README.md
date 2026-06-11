# LLM Coding Workshop

## Setup

!NOTE! The tools we will be exploring in this workshop are _off-limits by default_ within KU Leuven, however use in a research context can be acceptable, provided it happens in an isolated, shielded environment. It is *YOUR RESPONSIBILITY* to take measures to limit risks.

1. Set up an isolated environment such as a Virtual machine (e.g. [QEMU](https://www.qemu.org/), [VirtualBox](https://www.virtualbox.org/), [VMWare Fusion](https://www.vmware.com/products/desktop-hypervisor/workstation-and-fusion)) or [Docker](https://www.docker.com/)
2. Install [Pi](https://pi.dev/)
3. Install `ask_user_question`:
   `pi install git:github.com/ghoseb/pi-askuserquestion`

### LLM Providers

You have many options. Although unfortunately your KULeuven Microsoft Copilot subscription is not one of them. 

* If you have a free Github account, you get "2000 completions / month". I don't know how far this will get you.
* Install [LM Studio](https://lmstudio.ai/) and run a local LLM. This will depend on how powerful your machine is.
* Create an account on [Open Router](https://openrouter.ai) and use a free LLM (e.g. [Kimi K2](https://openrouter.ai/moonshotai/kimi-k2.6:free/providers))
* Select one of [these providers](https://pi.dev/docs/latest/providers) and pay for an account. [Deepseek](https://platform.deepseek.com) is very cheap, $2 USD should be enough for the workshop.