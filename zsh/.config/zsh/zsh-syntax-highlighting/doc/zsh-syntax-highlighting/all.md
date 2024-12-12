zsh-syntax-highlighting / highlighters
======================================

Syntax highlighting is done by pluggable highlighters:

* `main` - the base highlighter, and the only one [active by default][main].
* `brackets` - [matches brackets][brackets] and parenthesis.
* `pattern` - matches [user-defined patterns][pattern].
* `regexp` - matches [user-defined regular expressions][regexp].
* `cursor` - matches [the cursor position][cursor].
* `root` - highlights the whole command line [if the current user is root][root].
* `line` - applied to [the whole command line][line].

[main]: highlighters/main.md
[brackets]: highlighters/brackets.md
[pattern]: highlighters/pattern.md
[regexp]: highlighters/regexp.md
[cursor]: highlighters/cursor.md
[root]: highlighters/root.md
[line]: highlighters/line.md


Highlighter-independent settings
--------------------------------

By default, all command lines are highlighted.  However, it is possible to
prevent command lines longer than a fixed number of characters from being
highlighted by setting the variable `${ZSH_HIGHLIGHT_MAXLENGTH}` to the maximum
length (in characters) of command lines to be highlighter.  This is useful when
editing very long command lines (for example, with the [`fned`][fned] utility
function).  Example:

[fned]: https://zsh.sourceforge.io/Doc/Release/User-Contributions.html#index-zed

```zsh
ZSH_HIGHLIGHT_MAXLENGTH=512
```


How to activate highlighters
----------------------------

To activate an highlighter, add it to the `ZSH_HIGHLIGHT_HIGHLIGHTERS` array.
By default `ZSH_HIGHLIGHT_HIGHLIGHTERS` is `(main)`. For example to activate
`brackets`, `pattern`, and `cursor` highlighters, in `~/.zshrc` do:

```zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS+=(brackets pattern cursor)
```


How to tweak highlighters
-------------------------

Highlighters look up styles from the `ZSH_HIGHLIGHT_STYLES` associative array.
Navigate into the [individual highlighters' documentation](highlighters/) to
see what styles (keys) each highlighter defines; the syntax for values is the
same as the syntax of "types of highlighting" of the zsh builtin
`$zle_highlight` array, which is documented in [the `zshzle(1)` manual
page][zshzle-Character-Highlighting].

[zshzle-Character-Highlighting]: https://zsh.sourceforge.io/Doc/Release/Zsh-Line-Editor.html#Character-Highlighting

Some highlighters support additional configuration parameters; see each
highlighter's documentation for details and examples.


How to implement a new highlighter
----------------------------------

To create your own `acme` highlighter:

* Create your script at
    `highlighters/acme/acme-highlighter.zsh`.

* Implement the `_zsh_highlight_highlighter_acme_predicate` function.
  This function must return 0 when the highlighter needs to be called and
  non-zero otherwise, for example:

    ```zsh
    _zsh_highlight_highlighter_acme_predicate() {
      # Call this highlighter in SVN working copies
      [[ -d .svn ]]
    }
    ```

* Implement the `_zsh_highlight_highlighter_acme_paint` function.
  This function does the actual syntax highlighting, by calling
  `_zsh_highlight_add_highlight` with the start and end of the region to
  be highlighted and the `ZSH_HIGHLIGHT_STYLES` key to use. Define the default
  style for that key in the highlighter script outside of any function with
  `: ${ZSH_HIGHLIGHT_STYLES[key]:=value}`, being sure to prefix
  the key with your highlighter name and a colon. For example:

    ```zsh
    : ${ZSH_HIGHLIGHT_STYLES[acme:aurora]:=fg=green}

    _zsh_highlight_highlighter_acme_paint() {
      # Colorize the whole buffer with the 'aurora' style
      _zsh_highlight_add_highlight 0 $#BUFFER acme:aurora
    }
    ```

  If you need to test which options the user has set, test `zsyh_user_options`
  with a sensible default if the option is not present in supported zsh
  versions. For example:

    ```zsh
    [[ ${zsyh_user_options[ignoreclosebraces]:-off} == on ]]
    ```

  The option name must be all lowercase with no underscores and not an alias.

* Name your own functions and global variables `_zsh_highlight_acme_*`.

    - In zsh-syntax-highlighting 0.4.0 and earlier, the entrypoints 
        `_zsh_highlight_highlighter_acme_predicate` and
        `_zsh_highlight_highlighter_acme_paint`
        were named
        `_zsh_highlight_acme_highlighter_predicate` and
        `_zsh_highlight_highlighter_acme_paint` respectively.

        These names are still supported for backwards compatibility;
        however, support for them will be removed in a future major or minor release (v0.x.0 or v1.0.0).

* Activate your highlighter in `~/.zshrc`:

    ```zsh
    ZSH_HIGHLIGHT_HIGHLIGHTERS+=(acme)
    ```

* [Write tests](../tests/README.md).


Individual highlighters documentation
=====================================

zsh-syntax-highlighting / highlighters / brackets
-------------------------------------------------

This is the `brackets` highlighter, that highlights brackets and parentheses, and
matches them.


### How to tweak it

This highlighter defines the following styles:

* `bracket-error` - unmatched brackets
* `bracket-level-N` - brackets with nest level N
* `cursor-matchingbracket` - the matching bracket, if cursor is on a bracket

To override one of those styles, change its entry in `ZSH_HIGHLIGHT_STYLES`,
for example in `~/.zshrc`:

```zsh
# To define styles for nested brackets up to level 4
ZSH_HIGHLIGHT_STYLES[bracket-level-1]='fg=blue,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-2]='fg=red,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-3]='fg=yellow,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-4]='fg=magenta,bold'
```

The syntax for values is the same as the syntax of "types of highlighting" of
the zsh builtin `$zle_highlight` array, which is documented in [the `zshzle(1)`
manual page][zshzle-Character-Highlighting].

[zshzle-Character-Highlighting]: https://zsh.sourceforge.io/Doc/Release/Zsh-Line-Editor.html#Character-Highlighting


zsh-syntax-highlighting / highlighters / cursor
-----------------------------------------------

This is the `cursor` highlighter, that highlights the cursor.


### How to tweak it

This highlighter defines the following styles:

* `cursor` - the style for the current cursor position

To override one of those styles, change its entry in `ZSH_HIGHLIGHT_STYLES`,
for example in `~/.zshrc`:

```zsh
ZSH_HIGHLIGHT_STYLES[cursor]='bg=blue'
```

The syntax for values is the same as the syntax of "types of highlighting" of
the zsh builtin `$zle_highlight` array, which is documented in [the `zshzle(1)`
manual page][zshzle-Character-Highlighting].

[zshzle-Character-Highlighting]: https://zsh.sourceforge.io/Doc/Release/Zsh-Line-Editor.html#Character-Highlighting


zsh-syntax-highlighting / highlighters / line
---------------------------------------------

This is the `line` highlighter, that highlights the whole line.


### How to tweak it

This highlighter defines the following styles:

* `line` - the style for the whole line

To override one of those styles, change its entry in `ZSH_HIGHLIGHT_STYLES`,
for example in `~/.zshrc`:

```zsh
ZSH_HIGHLIGHT_STYLES[line]='bold'
```

The syntax for values is the same as the syntax of "types of highlighting" of
the zsh builtin `$zle_highlight` array, which is documented in [the `zshzle(1)`
manual page][zshzle-Character-Highlighting].

[zshzle-Character-Highlighting]: https://zsh.sourceforge.io/Doc/Release/Zsh-Line-Editor.html#Character-Highlighting


zsh-syntax-highlighting / highlighters / main
---------------------------------------------

This is the `main` highlighter, that highlights:

* Commands
* Options
* Arguments
* Paths
* Strings

This highlighter is active by default.


### How to tweak it

This highlighter defines the following styles:

* `unknown-token` - unknown tokens / errors
* `reserved-word` - shell reserved words (`if`, `for`)
* `alias` - aliases
* `suffix-alias` - suffix aliases (requires zsh 5.1.1 or newer)
* `global-alias` - global aliases
* `builtin` - shell builtin commands (`shift`, `pwd`, `zstyle`)
* `function` - function names
* `command` - command names
* `precommand` - precommand modifiers (e.g., `noglob`, `builtin`)
* `commandseparator` - command separation tokens (`;`, `&&`)
* `hashed-command` - hashed commands
* `autodirectory` - a directory name in command position when the `AUTO_CD` option is set
* `path` - existing filenames
* `path_pathseparator` - path separators in filenames (`/`); if unset, `path` is used (default)
* `path_prefix` - prefixes of existing filenames
* `path_prefix_pathseparator` - path separators in prefixes of existing filenames (`/`); if unset, `path_prefix` is used (default)
* `globbing` - globbing expressions (`*.txt`)
* `history-expansion` - history expansion expressions (`!foo` and `^foo^bar`)
* `command-substitution` - command substitutions (`$(echo foo)`)
* `command-substitution-unquoted` - an unquoted command substitution (`$(echo foo)`)
* `command-substitution-quoted` - a quoted command substitution (`"$(echo foo)"`)
* `command-substitution-delimiter` - command substitution delimiters (`$(` and `)`)
* `command-substitution-delimiter-unquoted` - an unquoted command substitution delimiters (`$(` and `)`)
* `command-substitution-delimiter-quoted` - a quoted command substitution delimiters (`"$(` and `)"`)
* `process-substitution` - process substitutions (`<(echo foo)`)
* `process-substitution-delimiter` - process substitution delimiters (`<(` and `)`)
* `arithmetic-expansion` - arithmetic expansion `$(( 42 ))`)
* `single-hyphen-option` - single-hyphen options (`-o`)
* `double-hyphen-option` - double-hyphen options (`--option`)
* `back-quoted-argument` - backtick command substitution (`` `foo` ``)
* `back-quoted-argument-unclosed` - unclosed backtick command substitution (`` `foo ``)
* `back-quoted-argument-delimiter` - backtick command substitution delimiters (`` ` ``)
* `single-quoted-argument` - single-quoted arguments (`` 'foo' ``)
* `single-quoted-argument-unclosed` - unclosed single-quoted arguments (`` 'foo ``)
* `double-quoted-argument` - double-quoted arguments (`` "foo" ``)
* `double-quoted-argument-unclosed` - unclosed double-quoted arguments (`` "foo ``)
* `dollar-quoted-argument` - dollar-quoted arguments (`` $'foo' ``)
* `dollar-quoted-argument-unclosed` - unclosed dollar-quoted arguments (`` $'foo ``)
* `rc-quote` - two single quotes inside single quotes when the `RC_QUOTES` option is set (`` 'foo''bar' ``)
* `dollar-double-quoted-argument` - parameter expansion inside double quotes (`$foo` inside `""`)
* `back-double-quoted-argument` -  backslash escape sequences inside double-quoted arguments (`\"` in `"foo\"bar"`)
* `back-dollar-quoted-argument` -  backslash escape sequences inside dollar-quoted arguments (`\x` in `$'\x48'`)
* `assign` - parameter assignments (`x=foo` and `x=( )`)
* `redirection` - redirection operators (`<`, `>`, etc)
* `comment` - comments, when `setopt INTERACTIVE_COMMENTS` is in effect (`echo # foo`)
* `comment` - elided parameters in command position (`$x ls` when `$x` is unset or empty)
* `named-fd` - named file descriptor (the `fd` in `echo foo {fd}>&2`)
* `numeric-fd` - numeric file descriptor (the `2` in `echo foo {fd}>&2`)
* `arg0` - a command word other than one of those enumerated above (other than a command, precommand, alias, function, or shell builtin command).
* `default` - everything else

To override one of those styles, change its entry in `ZSH_HIGHLIGHT_STYLES`,
for example in `~/.zshrc`:

```zsh
# Declare the variable
typeset -A ZSH_HIGHLIGHT_STYLES

# To differentiate aliases from other command types
ZSH_HIGHLIGHT_STYLES[alias]='fg=magenta,bold'

# To have paths colored instead of underlined
ZSH_HIGHLIGHT_STYLES[path]='fg=cyan'

# To disable highlighting of globbing expressions
ZSH_HIGHLIGHT_STYLES[globbing]='none'
```

The syntax for values is the same as the syntax of "types of highlighting" of
the zsh builtin `$zle_highlight` array, which is documented in [the `zshzle(1)`
manual page][zshzle-Character-Highlighting].

#### Parameters

To avoid partial path lookups on a path, add the path to the `ZSH_HIGHLIGHT_DIRS_BLACKLIST` array.

```zsh
ZSH_HIGHLIGHT_DIRS_BLACKLIST+=(/mnt/slow_share)
```

### Useless trivia

#### Forward compatibility.

zsh-syntax-highlighting attempts to be forward-compatible with zsh.
Specifically, we attempt to facilitate highlighting _command word_ types that
had not yet been invented when this version of zsh-syntax-highlighting was
released.

A _command word_ is something like a function name, external command name, et
cetera.  (See
[Simple Commands & Pipelines in `zshmisc(1)`][zshmisc-Simple-Commands-And-Pipelines]
for a formal definition.)

If a new _kind_ of command word is ever added to zsh — something conceptually
different than "function" and "alias" and "external command" — then command words
of that (new) kind will be highlighted by the style `arg0_$kind`,
where `$kind` is the output of `type -w` on the new kind of command word.  If that
style is not defined, then the style `arg0` will be used instead.

[zshmisc-Simple-Commands-And-Pipelines]: https://zsh.sourceforge.io/Doc/Release/Shell-Grammar.html#Simple-Commands-_0026-Pipelines

[zshzle-Character-Highlighting]: https://zsh.sourceforge.io/Doc/Release/Zsh-Line-Editor.html#Character-Highlighting


zsh-syntax-highlighting / highlighters / pattern
------------------------------------------------

This is the `pattern` highlighter, that highlights user-defined patterns.


### How to tweak it

To use this highlighter, associate patterns with styles in the
`ZSH_HIGHLIGHT_PATTERNS` associative array, for example in `~/.zshrc`:

```zsh
# Declare the variable
typeset -A ZSH_HIGHLIGHT_PATTERNS

# To have commands starting with `rm -rf` in red:
ZSH_HIGHLIGHT_PATTERNS+=('rm -rf *' 'fg=white,bold,bg=red')
```

The syntax for values is the same as the syntax of "types of highlighting" of
the zsh builtin `$zle_highlight` array, which is documented in [the `zshzle(1)`
manual page][zshzle-Character-Highlighting].

[zshzle-Character-Highlighting]: https://zsh.sourceforge.io/Doc/Release/Zsh-Line-Editor.html#Character-Highlighting


zsh-syntax-highlighting / highlighters / regexp
------------------------------------------------

This is the `regexp` highlighter, that highlights user-defined regular
expressions. It's similar to the `pattern` highlighter, but allows more complex
patterns.

### How to tweak it

To use this highlighter, associate regular expressions with styles in the
`ZSH_HIGHLIGHT_REGEXP` associative array, for example in `~/.zshrc`:

```zsh
typeset -A ZSH_HIGHLIGHT_REGEXP
ZSH_HIGHLIGHT_REGEXP+=('^rm .*' fg=red,bold)
```

This will highlight lines that start with a call to the `rm` command.

The regular expressions flavour used is [PCRE][pcresyntax] when the
`RE_MATCH_PCRE` option is set and POSIX Extended Regular Expressions (ERE),
as implemented by the platform's C library, otherwise.  For details on the
latter, see [the `zsh/regex` module's documentation][MAN_ZSH_REGEX] and the
`regcomp(3)` and `re_format(7)` manual pages on your system.

For instance, to highlight `sudo` only as a complete word, i.e., `sudo cmd`,
but not `sudoedit`, one might use:

* When the `RE_MATCH_PCRE` is set:

    ```zsh
    typeset -A ZSH_HIGHLIGHT_REGEXP
    ZSH_HIGHLIGHT_REGEXP+=('\bsudo\b' fg=123,bold)
    ```

* When the `RE_MATCH_PCRE` is unset, on platforms with GNU `libc` (e.g., many GNU/Linux distributions):

    ```zsh
    typeset -A ZSH_HIGHLIGHT_REGEXP
    ZSH_HIGHLIGHT_REGEXP+=('\<sudo\>' fg=123,bold)
    ```

* When the `RE_MATCH_PCRE` is unset, on BSD-based platforms (e.g., macOS):

    ```zsh
    typeset -A ZSH_HIGHLIGHT_REGEXP
    ZSH_HIGHLIGHT_REGEXP+=('[[:<:]]sudo[[:>:]]' fg=123,bold)
    ```

Note, however, that PCRE and POSIX ERE have a large common subset:
for instance, the regular expressions `[abc]`, `a*`, and `(a|b)` have the same
meaning in both flavours.

The syntax for values is the same as the syntax of "types of highlighting" of
the zsh builtin `$zle_highlight` array, which is documented in [the `zshzle(1)`
manual page][zshzle-Character-Highlighting].

See also: [regular expressions tutorial][perlretut], zsh regexp operator `=~`
in [the `zshmisc(1)` manual page][zshmisc-Conditional-Expressions]

[zshzle-Character-Highlighting]: https://zsh.sourceforge.io/Doc/Release/Zsh-Line-Editor.html#Character-Highlighting
[perlretut]: https://perldoc.perl.org/perlretut
[zshmisc-Conditional-Expressions]: https://zsh.sourceforge.io/Doc/Release/Conditional-Expressions.html#Conditional-Expressions
[MAN_ZSH_REGEX]: https://zsh.sourceforge.io/Doc/Release/Zsh-Modules.html#The-zsh_002fregex-Module
[pcresyntax]: https://www.pcre.org/original/doc/html/pcresyntax.html


zsh-syntax-highlighting / highlighters / root
---------------------------------------------

This is the `root` highlighter, that highlights the whole line if the current
user is root.


### How to tweak it

This highlighter defines the following styles:

* `root` - the style for the whole line if the current user is root.

To override one of those styles, change its entry in `ZSH_HIGHLIGHT_STYLES`,
for example in `~/.zshrc`:

```zsh
ZSH_HIGHLIGHT_STYLES[root]='bg=red'
```

The syntax for values is the same as the syntax of "types of highlighting" of
the zsh builtin `$zle_highlight` array, which is documented in [the `zshzle(1)`
manual page][zshzle-Character-Highlighting].

[zshzle-Character-Highlighting]: https://zsh.sourceforge.io/Doc/Release/Zsh-Line-Editor.html#Character-Highlighting
