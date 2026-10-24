# SandHouse MCP server

Connect your AI assistant to your [SandHouse](https://sandhouse.app) boards,
and have it write pages, wikis, flash card decks and todo items for your
spaces.

The server is `https://sandhouse.app/mcp` (Streamable HTTP). You sign in with
your SandHouse account the first time you use it and choose whether the
assistant may write and which boards it can reach. It can only do what your
role on each board allows, and only on boards whose managers have turned MCP
on (Board settings → MCP). You can disconnect any assistant from Account →
Access tokens.

This repository holds the setup for each assistant, plus skills that teach it
to write content that fits SandHouse:

| Skill | What it does |
|---|---|
| `sandhouse` | Used on its own whenever you mention your boards: finding spaces, writing Markdown that renders well, staying within what you asked. |
| `draft-page` | Writes a page into a pages space. |
| `write-wiki` | Plans a set of linked wiki pages with you, then writes them. |
| `study-deck` | Makes a flash card deck in a study space. |
| `plan-work` | Breaks a goal into work items, once you agree to the list. |

## Claude

**Claude Code**: install the plugin, which brings the server and the skills.

```sh
claude plugin marketplace add Retomodo/sandhouse-mcp-server
claude plugin install sandhouse@sandhouse
```

Then run `/mcp`, pick `plugin:sandhouse:sandhouse`, and sign in. The skills run
as `/sandhouse:draft-page`, `/sandhouse:study-deck` and so on.

Server only: `claude mcp add --transport http sandhouse https://sandhouse.app/mcp`.

**Claude on the web, desktop and mobile**: Settings → Connectors → Add custom
connector, with the URL `https://sandhouse.app/mcp`. Then turn it on in a chat
from the tools menu.

## ChatGPT and Codex

**ChatGPT**: on chatgpt.com, open [Plugins](https://chatgpt.com/plugins) → **+**
→ **Add custom MCP server**. Use the URL `https://sandhouse.app/mcp` and OAuth,
then install it and mention it with `@` in a chat. Whether this is available
depends on your plan and workspace settings.

**Codex** (CLI, IDE extension and app): add the plugin's marketplace and install
it, which brings the server and the skills.

```sh
codex plugin marketplace add Retomodo/sandhouse-mcp-server
```

Then install `sandhouse` from `/plugins`, and sign in when asked. Server only:
add [`configs/codex/config.toml`](configs/codex/config.toml) to
`~/.codex/config.toml` and run `codex mcp login sandhouse`. With
`default_tools_approval_mode = "writes"`, Codex asks before anything that
changes your boards.

## Cursor

[![Add SandHouse to Cursor](https://cursor.com/deeplink/mcp-install-dark.svg)](https://cursor.com/install-mcp?name=sandhouse&config=eyJ1cmwiOiJodHRwczovL3NhbmRob3VzZS5hcHAvbWNwIn0%3D)

The button adds the server. Or put
[`configs/cursor/mcp.json`](configs/cursor/mcp.json) in `~/.cursor/mcp.json`
(every project) or `.cursor/mcp.json` (one project). Cursor shows a **Connect**
button in Settings → MCP; click it to sign in.

The skills: run `./scripts/install-skills.sh` from a clone of this repository.
To test the whole plugin locally, copy `plugins/sandhouse` to
`~/.cursor/plugins/local/sandhouse` and reload the window.

## OpenCode

Add the `mcp` block from
[`configs/opencode/opencode.json`](configs/opencode/opencode.json) to
`~/.config/opencode/opencode.json` (or a project's `opencode.json`).
OpenCode asks you to sign in the first time it uses the server, or run
`opencode mcp auth sandhouse`.

The skills: run `./scripts/install-skills.sh` from a clone of this repository.

## Skills in other tools

`./scripts/install-skills.sh` copies the skills to `~/.agents/skills`, which
Codex, Cursor and OpenCode all read. Pass `--claude` to copy them to
`~/.claude/skills` too. Each skill is a folder with a `SKILL.md`, so any tool
that reads that format can use them.

## Without signing in

For scripts and tools that can't sign in, make a personal access token in
SandHouse (Account → Access tokens) and send it as a header:
`Authorization: Bearer <token>`. Keep it out of files you commit.

## What's here

```
.claude-plugin/marketplace.json   Claude Code marketplace
.agents/plugins/marketplace.json  Codex / ChatGPT marketplace
.cursor-plugin/marketplace.json   Cursor marketplace
plugins/sandhouse/                the plugin
  plugin.json, mcp.json           shared manifest (Agent Plugins format; Codex, ChatGPT, Cursor)
  .claude-plugin/, .mcp.json      Claude Code manifest and server
  .cursor-plugin/                 Cursor manifest and server
  skills/<name>/SKILL.md          the skills; agents/openai.yaml holds Codex and ChatGPT settings
configs/                          the server alone, per assistant
scripts/install-skills.sh         copies the skills where assistants look
```

To change a skill, edit it under `plugins/sandhouse/skills/`. Every assistant
uses that one copy. Bump `version` in each manifest when you publish a change.

## Problems

- **"MCP is off on this board"**: someone who manages the board turns it on in
  Board settings → MCP.
- **A write is refused**: your role on that board doesn't allow it, the
  connection is read-only, or your email isn't confirmed yet.
- **Signing in fails or loops**: disconnect the app in SandHouse (Account →
  Access tokens) and remove the server from your assistant, then add it again.

Report other problems in [Issues](https://github.com/Retomodo/sandhouse-mcp-server/issues).
