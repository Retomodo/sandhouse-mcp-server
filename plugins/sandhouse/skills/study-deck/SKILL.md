---
name: study-deck
description: Make a flash card deck in a SandHouse study space from a topic, notes, or pages on the board, with cards that test one thing each.
argument-hint: "[topic or source] [how many cards]"
disable-model-invocation: true
---

# Make a SandHouse flash card deck

The user wants flash cards. Use what they said alongside this command, or ask.

Follow the `sandhouse` skill (or, if it isn't loaded, its rules: check before writing, Markdown pages, ask before adding spaces) for finding boards and spaces.

1. Find the board and its study space (`list_boards`, `get_board`). With no
   study space, ask before adding one with `create_space` (kind `study`).
2. `list_decks` for that space. If a deck on the topic exists, ask whether to
   add to it (`get_deck` first, so you skip cards it already has, then
   `add_cards`) or start a new one.
3. Source material, in this order: what the user gave you in the
   conversation, then pages on the board they name (`search`, `read_page`),
   and only then general knowledge, and only for a topic where that's
   reliable. Say which you used.
4. Write the cards:
   - One fact or idea per card. The front is a question or a prompt; the
     back is the answer, short enough to check at a glance.
   - Mix recall ("What does X do?") with application ("Which would you use
     when…?"). Avoid yes/no fronts.
   - Use `$…$` for equations and backticks for code. Fronts can be up to
     1,000 characters and backs 2,000, but shorter is better.
   - Default to about 20 cards unless the user asked for a number. Send at
     most 200 per call.
5. `create_deck` with a clear title, a one-line description of what it
   covers and where it came from, and the cards. Then tell the user the
   deck's name and how many cards it has.
