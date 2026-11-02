# batch-job-durability

Run long multi-worker batch jobs so a host restart or a per-item failure cannot silently destroy the results.

## Skills

- **batch-job-durability** — Runs long multi-worker batch jobs so a host restart or a per-item failure cannot silently destroy the results.

## Install

**As agent skills** (any agent that reads `SKILL.md`):

```bash
npx skills add slow-tempo/batch-job-durability
```

or copy `skills/*/` into your skills directory
(`~/.agents/skills/`, `.claude/skills/`, or your Antigravity/Gemini
plugin skills dir).

**Quick install script:**

```bash
./install.sh              # → ~/.agents/skills/
./install.sh /target/dir  # → custom directory
```
