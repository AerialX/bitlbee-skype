bitlbee-skype
=============

This is a fork of [bitlbee-skype](https://github.com/vmiklos/bitlbee-skype) as
is currently included in bitlbee 3.2.1 with the goal of making it useful for
everyday use. Based on some changes by [Ninjifox](https://github.com/Ninjifox).

## Install

Compile with `make` (relies on pkg-config, may take minor tweaking on other
systems) and install into `$PREFIX/lib/bitlbee/`, replacing the stock skype
plugin if it exists.

## Features and Changes

- Joins group chats automatically when you receive new messages
- Allows you to part a groupchat without unsubscribing, then rejoin later
- Rename group chat channels
- Various small QoL fixes

**NOTE:** Channel renaming will not take effect if global setting `lcnicks` is
true (as is the default in bitlbee). `nick_lc()` in core bitlbee seems to be
buggy and often returns an empty string.

**NOTE 2:** The Skype API likes to pretend that a message doesn't exist
sometimes. It seems to drop the first message when a user starts to private
message you. Reverting to skype ~2.2 seems to fix this problem.

### Skyped

Minor fix applied to prevent it from spinning indefinitely upon disconnection.

### TODO, Suggestions, etc.

- Allow editing of last message with EDIT: syntax.
- Split up long lines of chat. Multiline messages are handled fine, but long
  single-line messages get cut off.

## Commands

The `skype` root command is used for magic.

- `skype rename #channel #newName`
  renames a group chat to the new name. While this should work with any bitlbee
  channel / group chat, changes will only persist for skype group chats (as part
  of the `acc set skype channel_names` setting)
- `skype close #channel`
  will /part you from the specified group chat without unsubscribing.
  New messages in the chat will trigger a rejoin.
- `skype join [tag] [#channel]`
  joins a skype group chat with the specified name. Note that this will only
  reliably work with renamed chats - it accepts Skype chat IDs as well but the
  channel names bitlbee uses are often truncated and therefore will not work
  without knowledge of the full handle. Omitting the channel argument will
  join as many groupchats as can be found in the unread, recent, active, and
  bookmarked chat lists.
