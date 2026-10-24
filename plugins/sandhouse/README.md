# SandHouse plugin

Connects your AI assistant to your [SandHouse](https://sandhouse.app) boards
(`https://sandhouse.app/mcp`), and adds skills for writing pages, wikis, flash
card decks and work items into your spaces. You sign in with your SandHouse
account the first time and choose whether it may write and which boards it can
reach.

Skills: `sandhouse` (used on its own when you mention your boards),
`draft-page`, `write-wiki`, `study-deck` and `plan-work`.

In Claude Code:

```sh
claude plugin marketplace add Retomodo/sandhouse-mcp-server
claude plugin install sandhouse@sandhouse
```

Install instructions for every other assistant, and troubleshooting, are in the
[repository's README](https://github.com/Retomodo/sandhouse-mcp-server#readme).

Boards only answer once someone who manages them turns MCP on in Board
settings → MCP.
