---
name: write-wiki
description: Write or extend a SandHouse wiki — plan a set of linked reference pages on a topic, then create them with [[links]] between them.
argument-hint: "[topic] [in <board or wiki>]"
disable-model-invocation: true
---

# Write a SandHouse wiki

The user wants wiki pages. Use what they said alongside this command, or ask.

Follow the `sandhouse` skill (or, if it isn't loaded, its rules: check before writing, Markdown pages, ask before adding spaces) for finding boards and spaces and for Markdown.

1. Find the board and the wiki space (`list_boards`, `get_board`). With no
   wiki, ask before adding one with `create_space` (kind `wiki`). A wiki can
   be made public by the board, so keep private details out unless the user
   says otherwise.
2. `list_pages` for the wiki and `read_page` the ones related to the topic,
   so new pages fit in and link to what's there.
3. Propose the outline in the chat: page titles, nesting (`parent_id`), and a
   line on what each covers. Usually one overview page plus 3 to 8 focused
   pages. Wait for the user to agree or adjust.
4. Write each page:
   - The opening paragraph says what the page covers and who it's for.
   - `##` sections, short paragraphs, tables for reference data, code blocks
     for commands.
   - Link related pages by exact title: `[[Page title]]`. Only link to pages
     that exist or that you're creating now.
   - Don't invent specifics (versions, prices, names). Mark gaps with
     `- [ ] TODO:` so people can fill them in.
5. Create the overview first, then its children with `parent_id`. If you
   change an existing page, read it, keep what's there, and use `update_page`.
6. Reply with the list of pages written, in their nesting.
