#!/bin/sh
# Icelandic / Scandinavian / Norse symbol picker
# Pick a char in fuzzel, it gets typed into whatever's focused + copied to clipboard.

symbols="
þ	þ - thorn lowercase (Icelandic)
Þ	Þ - thorn uppercase (Icelandic)
ð	ð - eth lowercase (Icelandic/Faroese)
Ð	Ð - eth uppercase (Icelandic/Faroese)
æ	æ - ae ligature lowercase (Icelandic/Norwegian/Danish)
Æ	Æ - ae ligature uppercase
ø	ø - o with stroke lowercase (Norwegian/Danish/Faroese)
Ø	Ø - o with stroke uppercase
å	å - a with ring lowercase (Norwegian/Danish/Swedish)
Å	Å - a with ring uppercase
ä	ä - a with diaeresis lowercase (Swedish/Finnish)
Ä	Ä - a with diaeresis uppercase
ö	ö - o with diaeresis lowercase (Swedish/Icelandic/Finnish)
Ö	Ö - o with diaeresis uppercase
á	á - a with acute lowercase (Icelandic/Faroese)
Á	Á - a with acute uppercase
é	é - e with acute lowercase (Icelandic)
É	É - e with acute uppercase
í	í - i with acute lowercase (Icelandic)
Í	Í - i with acute uppercase
ó	ó - o with acute lowercase (Icelandic)
Ó	Ó - o with acute uppercase
ú	ú - u with acute lowercase (Icelandic)
Ú	Ú - u with acute uppercase
ý	ý - y with acute lowercase (Icelandic)
Ý	Ý - y with acute uppercase
œ	œ - oe ligature (Old Norse/French)
ǫ	ǫ - o with ogonek (Old Norse)
"

# --no-exit-on-keyboard-focus-loss matters when this is launched *from* the
# fuzzel app launcher: the launcher is still tearing down as this second
# fuzzel opens, and the focus handoff would otherwise close it instantly.
choice=$(printf '%s\n' "$symbols" | sed '/^$/d' |
    fuzzel --dmenu --no-exit-on-keyboard-focus-loss -p "Symbol: ")
[ -z "$choice" ] && exit 0

char=$(printf '%s' "$choice" | cut -f1)

printf '%s' "$char" | wl-copy
ydotool type -- "$char"
