# AGENTS.md

## Project

`inference` a "small language model" in Haskell. It builds a
distribution from an input text and generates tokens from a single-word prompt.
Source in `app/Main.hs`; sample texts in `data/`.

## Build & run

This is a Cabal project (`inference.cabal`).

```sh
cabal build          # compile
cabal run inference  # run the executable
```

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
