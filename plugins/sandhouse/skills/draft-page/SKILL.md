---
name: draft-page
description: Draft a page (notes, a plan, a doc, meeting notes) into one of the user's SandHouse pages spaces from a topic, pasted notes or files in the conversation.
argument-hint: "[what the page is about] [in <board or space>]"
disable-model-invocation: true
---

# Draft a SandHouse page

The user wants a page written for them. Use what they said alongside this command, or ask.

Follow the `sandhouse` skill (or, if it isn't loaded, its rules: check before writing, Markdown pages, ask before adding spaces) for finding boards and spaces and for Markdown.

1. Work out the board and the pages space. If the user named them, find them
   with `list_boards` and `get_board`. Otherwise list the likely choices and
   ask. With only one pages space on the board, use it.
2. `search` the board for the topic. If a page on it already exists, ask
   whether to update that page or write a new one.
3. Gather the material: what the user said, anything pasted or attached in
   the conversation, and pages on the board they point you to (`read_page`).
   Don't make up facts, figures, names or dates. Where something is missing,
   leave a clearly marked `- [ ] TODO:` line.
4. Write it as one page: a short opening paragraph saying what the page is
   for, then `##` sections. Use tables for side-by-side comparisons and task
   lists for next steps. If it runs past a few screens, propose splitting it
   into a parent page with child pages (`parent_id`) and ask first.
5. `create_page` (or `update_page` if they chose to update). Then tell the user
   the page's title and space, and summarise what's in it in a sentence or
   two.
