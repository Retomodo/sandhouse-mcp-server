---
name: plan-work
description: Break a goal or project into work items on a SandHouse todo board — propose the list first, then create the items the user agrees to.
argument-hint: "[the goal or project] [on <board>]"
disable-model-invocation: true
---

# Plan work on a SandHouse todo board

The user wants a goal turned into work items. Use what they said alongside this command, or ask.

Follow the `sandhouse` skill (or, if it isn't loaded, its rules: check before writing, Markdown pages, ask before adding spaces) for finding boards and spaces.

1. Find the board and its todo board (`list_boards`, `get_board`). If the board
   has several todo boards, ask which one.
2. `list_work_items` (with `include_closed` when it's useful) and `search`, so
   you don't duplicate what's already planned. Read any plan pages the user
   points to.
3. Propose the breakdown in the chat **before creating anything**: a short
   numbered list where each item has a title that starts with a verb, one line
   on what "done" means, and a priority. Suggest an assignee only when the
   user named who does what, and a due date only when they gave one. Keep it
   to what's needed, usually 3 to 12 items.
4. Once the user agrees (or edits the list), `create_work_item` for each, in
   order. Put the "done means" line and any detail in `description` as
   Markdown; a `- [ ]` checklist works for sub-steps.
5. Reply with the items' numbers and titles (`#14 Draft the survey`), so the
   user can find them on the board.
