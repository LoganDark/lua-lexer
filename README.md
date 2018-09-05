# lua-lexer

A Lua lexer written in pure Lua.

## How to use

The lexer can be loaded with `require()` or `dofile()`. What is returned is a single function, I'll call it `lex`.

This function only takes one argument, which is the text to lex (a string, obviously). It returns a a list containing every line of the lexed text. Each line is a list of tokens in the order they were found.

Each token has the following structure:

```lua
{
  type = string, -- one of the token types below
  data = string, -- the source code that makes up the token
  posFirst = number, -- the position (inclusive) within that line that the token starts
  posLast = number -- the position (inclusive) within that line that the token ends
}
```

Each token can have one of the following types:

- `whitespace`: Spaces, newlines, tabs, and carriage returns
- `comment`: Either multi-line or single-line comments
- `string_start` and `string_end`: starts and ends of a string
- `string`: Part of a string that isn't an escape
- `escape`: A string escape, like \n, only found inside strings
- `keyword`: Keywords. Like "while", "end", "do", etc
- `value`: Special values. Only true, false, and nil
- `ident`: Identifier. Variables, function names, etc
- `number`: Numbers, including both base 10 (and scientific notation) and hexadecimal
- `symbol`: Symbols, like brackets, parenthesis, ., .., etc
- `vararg`: `...`
- `operator`: Operators, like `+`, `-`, `%`, `=`, `==`, `>=`, `<=`, `~=`, etc
- `unidentified`: Anything that isn't one of the above tokens. Consider them errors. Invalid escapes are also unidentified.

## Example

For this Lua code:

```lua
i = i + 1
--[[
	Multiline
	Comment
]]
```

This is what you get when you put it through the lexer:

```lua
{ { {
      data = "i",
      posFirst = 1,
      posLast = 1,
      type = "ident"
    }, {
      data = " ",
      posFirst = 2,
      posLast = 2,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 3,
      posLast = 3,
      type = "operator"
    }, {
      data = " ",
      posFirst = 4,
      posLast = 4,
      type = "whitespace"
    }, {
      data = "i",
      posFirst = 5,
      posLast = 5,
      type = "ident"
    }, {
      data = " ",
      posFirst = 6,
      posLast = 6,
      type = "whitespace"
    }, {
      data = "+",
      posFirst = 7,
      posLast = 7,
      type = "operator"
    }, {
      data = " ",
      posFirst = 8,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "1",
      posFirst = 9,
      posLast = 9,
      type = "number"
    } }, {}, { {
      data = "--[[",
      posFirst = 1,
      posLast = 4,
      type = "comment"
    } }, { {
      data = "\tMultiline",
      posFirst = 1,
      posLast = 10,
      type = "comment"
    } }, { {
      data = "\tComment",
      posFirst = 1,
      posLast = 8,
      type = "comment"
    } }, { {
      data = "]]",
      posFirst = 1,
      posLast = 2,
      type = "comment"
    } } }
```

## The lexer's own source code

This is some version of the lexer's (commit #)'s source code run through the lexer (it's self-lexing!)

<details><summary>Show output</summary><pre><code>{ { {
      data = "-- MIT License",
      posFirst = 1,
      posLast = 14,
      type = "comment"
    } }, { {
      data = "-- ",
      posFirst = 1,
      posLast = 3,
      type = "comment"
    } }, { {
      data = "-- Copyright (c) 2018 LoganDark",
      posFirst = 1,
      posLast = 31,
      type = "comment"
    } }, { {
      data = "-- ",
      posFirst = 1,
      posLast = 3,
      type = "comment"
    } }, { {
      data = "-- Permission is hereby granted, free of charge, to any person obtaining a copy",
      posFirst = 1,
      posLast = 79,
      type = "comment"
    } }, { {
      data = '-- of this software and associated documentation files (the "Software"), to deal',
      posFirst = 1,
      posLast = 80,
      type = "comment"
    } }, { {
      data = "-- in the Software without restriction, including without limitation the rights",
      posFirst = 1,
      posLast = 79,
      type = "comment"
    } }, { {
      data = "-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell",
      posFirst = 1,
      posLast = 76,
      type = "comment"
    } }, { {
      data = "-- copies of the Software, and to permit persons to whom the Software is",
      posFirst = 1,
      posLast = 72,
      type = "comment"
    } }, { {
      data = "-- furnished to do so, subject to the following conditions:",
      posFirst = 1,
      posLast = 59,
      type = "comment"
    } }, { {
      data = "-- ",
      posFirst = 1,
      posLast = 3,
      type = "comment"
    } }, { {
      data = "-- The above copyright notice and this permission notice shall be included in all",
      posFirst = 1,
      posLast = 81,
      type = "comment"
    } }, { {
      data = "-- copies or substantial portions of the Software.",
      posFirst = 1,
      posLast = 50,
      type = "comment"
    } }, { {
      data = "-- ",
      posFirst = 1,
      posLast = 3,
      type = "comment"
    } }, { {
      data = '-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR',
      posFirst = 1,
      posLast = 77,
      type = "comment"
    } }, { {
      data = "-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,",
      posFirst = 1,
      posLast = 75,
      type = "comment"
    } }, { {
      data = "-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE",
      posFirst = 1,
      posLast = 78,
      type = "comment"
    } }, { {
      data = "-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER",
      posFirst = 1,
      posLast = 73,
      type = "comment"
    } }, { {
      data = "-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,",
      posFirst = 1,
      posLast = 80,
      type = "comment"
    } }, { {
      data = "-- OUT OF OR IN CONNECTION WITH THE SOFTWARE-- OUT OF OR IN CONNECTION WITH THE SOFTWARE-- OUT OF OR IN CONNECTION WITH Tpac-- OUT OF OR IN CONNECTION WITH THE SOFTWARE-- OUT OF OR IN CONNECTION WITH THE  -- OUT OF OR IN CONNECTION WITH THE SOFTWARE-- OUT OF OR IN CONNECTION WITH T'] = true,",
      posFirst = 1,
      posLast = 292,
      type = "comment"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'f'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'n'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'r'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'t'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'v'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'\"'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'",
      posFirst = 10,
      posLast = 10,
      type = "string"
    }, {
      data = "\\'",
      posFirst = 11,
      posLast = 12,
      type = "escape"
    }, {
      data = "'",
      posFirst = 13,
      posLast = 13,
      type = "string"
    }, {
      data = "]",
      posFirst = 14,
      posLast = 14,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 15,
      posLast = 15,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 16,
      posLast = 16,
      type = "operator"
    }, {
      data = " ",
      posFirst = 17,
      posLast = 17,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 18,
      posLast = 21,
      type = "value"
    }, {
      data = ",",
      posFirst = 22,
      posLast = 22,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'",
      posFirst = 10,
      posLast = 10,
      type = "string"
    }, {
      data = "\\\\",
      posFirst = 11,
      posLast = 12,
      type = "escape"
    }, {
      data = "'",
      posFirst = 13,
      posLast = 13,
      type = "string"
    }, {
      data = "]",
      posFirst = 14,
      posLast = 14,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 15,
      posLast = 15,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 16,
      posLast = 16,
      type = "operator"
    }, {
      data = " ",
      posFirst = 17,
      posLast = 17,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 18,
      posLast = 21,
      type = "value"
    }, {
      data = ",",
      posFirst = 22,
      posLast = 22,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'",
      posFirst = 10,
      posLast = 10,
      type = "string"
    }, {
      data = "\\n",
      posFirst = 11,
      posLast = 12,
      type = "escape"
    }, {
      data = "'",
      posFirst = 13,
      posLast = 13,
      type = "string"
    }, {
      data = "]",
      posFirst = 14,
      posLast = 14,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 15,
      posLast = 15,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 16,
      posLast = 16,
      type = "operator"
    }, {
      data = " ",
      posFirst = 17,
      posLast = 17,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 18,
      posLast = 21,
      type = "value"
    } }, { {
      data = "    ",
      posFirst = 1,
      posLast = 4,
      type = "whitespace"
    }, {
      data = "}",
      posFirst = 5,
      posLast = 5,
      type = "symbol"
    }, {
      data = ",",
      posFirst = 6,
      posLast = 6,
      type = "symbol"
    } }, {}, { {
      data = "    ",
      posFirst = 1,
      posLast = 4,
      type = "whitespace"
    }, {
      data = "ident",
      posFirst = 5,
      posLast = 9,
      type = "ident"
    }, {
      data = " ",
      posFirst = 10,
      posLast = 10,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 11,
      posLast = 11,
      type = "operator"
    }, {
      data = " ",
      posFirst = 12,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "{",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'a'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'b'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'c'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'d'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'e'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'f'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'g'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'h'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'i'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'j'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'k'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'l'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'m'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'n'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'o'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'p'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'q'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'r'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'s'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'t'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'u'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'v'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'w'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'x'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'y'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'z'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'A'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'B'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'C'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'D'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'E'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'F'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'G'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'H'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'I'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'J'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'K'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'L'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'M'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'N'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'O'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'P'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'        ['",
      posFirst = 10,
      posLast = 20,
      type = "string"
    }, {
      data = "        ",
      posFirst = 21,
      posLast = 28,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 29,
      posLast = 29,
      type = "symbol"
    }, {
      data = "' '",
      posFirst = 30,
      posLast = 32,
      type = "string"
    }, {
      data = "R",
      posFirst = 33,
      posLast = 33,
      type = "ident"
    }, {
      data = "        ",
      posFirst = 34,
      posLast = 41,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 42,
      posLast = 42,
      type = "symbol"
    }, {
      data = "'        ['",
      posFirst = 43,
      posLast = 53,
      type = "string"
    }, {
      data = " ",
      posFirst = 54,
      posLast = 54,
      type = "whitespace"
    }, {
      data = "S",
      posFirst = 55,
      posLast = 55,
      type = "ident"
    }, {
      data = "'        ['",
      posFirst = 56,
      posLast = 66,
      type = "string"
    }, {
      data = "        ",
      posFirst = 67,
      posLast = 74,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 75,
      posLast = 75,
      type = "symbol"
    }, {
      data = "'T'",
      posFirst = 76,
      posLast = 78,
      type = "string"
    }, {
      data = "     ",
      posFirst = 79,
      posLast = 83,
      type = "whitespace"
    }, {
      data = "rue",
      posFirst = 84,
      posLast = 86,
      type = "ident"
    }, {
      data = "        ",
      posFirst = 87,
      posLast = 94,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 95,
      posLast = 95,
      type = "symbol"
    }, {
      data = "'  U'",
      posFirst = 96,
      posLast = 100,
      type = "string"
    }, {
      data = "        ",
      posFirst = 101,
      posLast = 108,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 109,
      posLast = 109,
      type = "symbol"
    }, {
      data = "'        ['",
      posFirst = 110,
      posLast = 120,
      type = "string"
    }, {
      data = "V",
      posFirst = 121,
      posLast = 121,
      type = "ident"
    }, {
      data = "'        ['",
      posFirst = 122,
      posLast = 132,
      type = "string"
    }, {
      data = "        ",
      posFirst = 133,
      posLast = 140,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 141,
      posLast = 141,
      type = "symbol"
    }, {
      data = "'W'",
      posFirst = 142,
      posLast = 144,
      type = "string"
    }, {
      data = "        ",
      posFirst = 145,
      posLast = 152,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 153,
      posLast = 153,
      type = "symbol"
    }, {
      data = "'        ['",
      posFirst = 154,
      posLast = 164,
      type = "string"
    }, {
      data = "X",
      posFirst = 165,
      posLast = 165,
      type = "ident"
    }, {
      data = "'        ['",
      posFirst = 166,
      posLast = 176,
      type = "string"
    }, {
      data = "        ",
      posFirst = 177,
      posLast = 184,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 185,
      posLast = 185,
      type = "symbol"
    }, {
      data = "'Y'",
      posFirst = 186,
      posLast = 188,
      type = "string"
    }, {
      data = "        ",
      posFirst = 189,
      posLast = 196,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 197,
      posLast = 197,
      type = "symbol"
    }, {
      data = "'        ['",
      posFirst = 198,
      posLast = 208,
      type = "string"
    }, {
      data = "Z",
      posFirst = 209,
      posLast = 209,
      type = "ident"
    }, {
      data = "'] = true,",
      posFirst = 210,
      posLast = 219,
      type = "string"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'_'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'0'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'1'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'2'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'3'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'4'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'5'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'6'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'7'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'8'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'9'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, {}, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "start",
      posFirst = 9,
      posLast = 13,
      type = "ident"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "{",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'a'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'b'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'c'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'d'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'e'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'f'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'g'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'h'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'i'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'j'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'k'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'l'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'m'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'n'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'o'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'p'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'q'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'r'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'s'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'t'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'u'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'v'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'w'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'x'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'y'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'z'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'A'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'B'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'C'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'D'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'E'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'F'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'G'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'H'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'I'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'J'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'K'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'L'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'M'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'N'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'O'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'P'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'Q'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'R'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'S'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'T'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'U'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'V'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'W'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'X'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'Y'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'Z'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'_'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "}",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = ",",
      posFirst = 10,
      posLast = 10,
      type = "symbol"
    } }, { {
      data = "    ",
      posFirst = 1,
      posLast = 4,
      type = "whitespace"
    }, {
      data = "}",
      posFirst = 5,
      posLast = 5,
      type = "symbol"
    }, {
      data = ",",
      posFirst = 6,
      posLast = 6,
      type = "symbol"
    } }, {}, { {
      data = "    ",
      posFirst = 1,
      posLast = 4,
      type = "whitespace"
    }, {
      data = "digits",
      posFirst = 5,
      posLast = 10,
      type = "ident"
    }, {
      data = " ",
      posFirst = 11,
      posLast = 11,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 12,
      posLast = 12,
      type = "operator"
    }, {
      data = " ",
      posFirst = 13,
      posLast = 13,
      type = "whitespace"
    }, {
      data = "{",
      posFirst = 14,
      posLast = 14,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'0'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'1'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'2'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'3'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'4'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'5'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'6'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'7'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'8'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'9'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, {}, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "hex",
      posFirst = 9,
      posLast = 11,
      type = "ident"
    }, {
      data = " ",
      posFirst = 12,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 13,
      posLast = 13,
      type = "operator"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "{",
      posFirst = 15,
      posLast = 15,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'0'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'1'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'2'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'3'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'4'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'5'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'6'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'7'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'8'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'9'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'a'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'b'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'c'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'d'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'e'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'f'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'A'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'B'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'C'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'D'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'E'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'F'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "}",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    } }, { {
      data = "    ",
      posFirst = 1,
      posLast = 4,
      type = "whitespace"
    }, {
      data = "}",
      posFirst = 5,
      posLast = 5,
      type = "symbol"
    }, {
      data = ",",
      posFirst = 6,
      posLast = 6,
      type = "symbol"
    } }, {}, { {
      data = "    ",
      posFirst = 1,
      posLast = 4,
      type = "whitespace"
    }, {
      data = "symbols",
      posFirst = 5,
      posLast = 11,
      type = "ident"
    }, {
      data = " ",
      posFirst = 12,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 13,
      posLast = 13,
      type = "operator"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "{",
      posFirst = 15,
      posLast = 15,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'+'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'-'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'*'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'/'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'^'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'%'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "        ",
      posFirst = 14,
      posLast = 21,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 22,
      posLast = 22,
      type = "symbol"
    }, {
      data = "'%'",
      posFirst = 23,
      posLast = 25,
      type = "string"
    }, {
      data = "]",
      posFirst = 26,
      posLast = 26,
      type = "symbol"
    }, {
      data = "     ",
      posFirst = 27,
      posLast = 31,
      type = "whitespace"
    }, {
      data = "','",
      posFirst = 32,
      posLast = 34,
      type = "string"
    }, {
      data = "]",
      posFirst = 35,
      posLast = 35,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 36,
      posLast = 36,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 37,
      posLast = 37,
      type = "operator"
    }, {
      data = "               ",
      posFirst = 38,
      posLast = 52,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 53,
      posLast = 53,
      type = "symbol"
    }, {
      data = "'{'",
      posFirst = 54,
      posLast = 56,
      type = "string"
    }, {
      data = "]",
      posFirst = 57,
      posLast = 57,
      type = "symbol"
    }, {
      data = "        ",
      posFirst = 58,
      posLast = 65,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 66,
      posLast = 66,
      type = "symbol"
    }, {
      data = "'       ['",
      posFirst = 67,
      posLast = 76,
      type = "string"
    }, {
      data = "}",
      posFirst = 77,
      posLast = 77,
      type = "symbol"
    }, {
      data = "'] = true,",
      posFirst = 78,
      posLast = 87,
      type = "string"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'['",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "']'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'('",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "')'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "';'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'#'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'.'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "':'",
      posFirst = 10,
      posLast = 12,
      type = "string"
    }, {
      data = "]",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 17,
      posLast = 20,
      type = "value"
    }, {
      data = ",",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, {}, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "equality",
      posFirst = 9,
      posLast = 16,
      type = "ident"
    }, {
      data = " ",
      posFirst = 17,
      posLast = 17,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 18,
      posLast = 18,
      type = "operator"
    }, {
      data = " ",
      posFirst = 19,
      posLast = 19,
      type = "whitespace"
    }, {
      data = "{",
      posFirst = 20,
      posLast = 20,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'~'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'='",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'&gt;'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'&lt;'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "}",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = ",",
      posFirst = 10,
      posLast = 10,
      type = "symbol"
    } }, {}, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "operators",
      posFirst = 9,
      posLast = 17,
      type = "ident"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "{",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'+'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'-'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'*'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'/'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'^'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'%'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    }, {
      data = "'#'",
      posFirst = 14,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "}",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    } }, { {
      data = "    ",
      posFirst = 1,
      posLast = 4,
      type = "whitespace"
    }, {
      data = "}",
      posFirst = 5,
      posLast = 5,
      type = "symbol"
    } }, { {
      data = "}",
      posFirst = 1,
      posLast = 1,
      type = "symbol"
    } }, {}, { {
      data = "local",
      posFirst = 1,
      posLast = 5,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 6,
      posLast = 6,
      type = "whitespace"
    }, {
      data = "keywords",
      posFirst = 7,
      posLast = 14,
      type = "ident"
    }, {
      data = " ",
      posFirst = 15,
      posLast = 15,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 16,
      posLast = 16,
      type = "operator"
    }, {
      data = " ",
      posFirst = 17,
      posLast = 17,
      type = "whitespace"
    }, {
      data = "{",
      posFirst = 18,
      posLast = 18,
      type = "symbol"
    } }, { {
      data = "    ",
      posFirst = 1,
      posLast = 4,
      type = "whitespace"
    }, {
      data = "structure",
      posFirst = 5,
      posLast = 13,
      type = "ident"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "{",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'and'",
      posFirst = 10,
      posLast = 14,
      type = "string"
    }, {
      data = "]",
      posFirst = 15,
      posLast = 15,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 17,
      posLast = 17,
      type = "operator"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 19,
      posLast = 22,
      type = "value"
    }, {
      data = ",",
      posFirst = 23,
      posLast = 23,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'break'",
      posFirst = 10,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'do'",
      posFirst = 10,
      posLast = 13,
      type = "string"
    }, {
      data = "]",
      posFirst = 14,
      posLast = 14,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 15,
      posLast = 15,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 16,
      posLast = 16,
      type = "operator"
    }, {
      data = " ",
      posFirst = 17,
      posLast = 17,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 18,
      posLast = 21,
      type = "value"
    }, {
      data = ",",
      posFirst = 22,
      posLast = 22,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'else'",
      posFirst = 10,
      posLast = 15,
      type = "string"
    }, {
      data = "]",
      posFirst = 16,
      posLast = 16,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 17,
      posLast = 17,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 18,
      posLast = 18,
      type = "operator"
    }, {
      data = " ",
      posFirst = 19,
      posLast = 19,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 20,
      posLast = 23,
      type = "value"
    }, {
      data = ",",
      posFirst = 24,
      posLast = 24,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'elseif'",
      posFirst = 10,
      posLast = 17,
      type = "string"
    }, {
      data = "]",
      posFirst = 18,
      posLast = 18,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 19,
      posLast = 19,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 20,
      posLast = 20,
      type = "operator"
    }, {
      data = " ",
      posFirst = 21,
      posLast = 21,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 22,
      posLast = 25,
      type = "value"
    }, {
      data = ",",
      posFirst = 26,
      posLast = 26,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'end'",
      posFirst = 10,
      posLast = 14,
      type = "string"
    }, {
      data = "]",
      posFirst = 15,
      posLast = 15,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 17,
      posLast = 17,
      type = "operator"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 19,
      posLast = 22,
      type = "value"
    }, {
      data = ",",
      posFirst = 23,
      posLast = 23,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'for'",
      posFirst = 10,
      posLast = 14,
      type = "string"
    }, {
      data = "]",
      posFirst = 15,
      posLast = 15,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 17,
      posLast = 17,
      type = "operator"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 19,
      posLast = 22,
      type = "value"
    }, {
      data = ",",
      posFirst = 23,
      posLast = 23,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'function'",
      posFirst = 10,
      posLast = 19,
      type = "string"
    }, {
      data = "]",
      posFirst = 20,
      posLast = 20,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 21,
      posLast = 21,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 22,
      posLast = 22,
      type = "operator"
    }, {
      data = " ",
      posFirst = 23,
      posLast = 23,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 24,
      posLast = 27,
      type = "value"
    }, {
      data = ",",
      posFirst = 28,
      posLast = 28,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'goto'",
      posFirst = 10,
      posLast = 15,
      type = "string"
    }, {
      data = "]",
      posFirst = 16,
      posLast = 16,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 17,
      posLast = 17,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 18,
      posLast = 18,
      type = "operator"
    }, {
      data = " ",
      posFirst = 19,
      posLast = 19,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 20,
      posLast = 23,
      type = "value"
    }, {
      data = ",",
      posFirst = 24,
      posLast = 24,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'if'",
      posFirst = 10,
      posLast = 13,
      type = "string"
    }, {
      data = "]",
      posFirst = 14,
      posLast = 14,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 15,
      posLast = 15,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 16,
      posLast = 16,
      type = "operator"
    }, {
      data = " ",
      posFirst = 17,
      posLast = 17,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 18,
      posLast = 21,
      type = "value"
    }, {
      data = ",",
      posFirst = 22,
      posLast = 22,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'in'",
      posFirst = 10,
      posLast = 13,
      type = "string"
    }, {
      data = "]",
      posFirst = 14,
      posLast = 14,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 15,
      posLast = 15,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 16,
      posLast = 16,
      type = "operator"
    }, {
      data = " ",
      posFirst = 17,
      posLast = 17,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 18,
      posLast = 21,
      type = "value"
    }, {
      data = ",",
      posFirst = 22,
      posLast = 22,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'local'",
      posFirst = 10,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'not'",
      posFirst = 10,
      posLast = 14,
      type = "string"
    }, {
      data = "]",
      posFirst = 15,
      posLast = 15,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 17,
      posLast = 17,
      type = "operator"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 19,
      posLast = 22,
      type = "value"
    }, {
      data = ",",
      posFirst = 23,
      posLast = 23,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'or'",
      posFirst = 10,
      posLast = 13,
      type = "string"
    }, {
      data = "]",
      posFirst = 14,
      posLast = 14,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 15,
      posLast = 15,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 16,
      posLast = 16,
      type = "operator"
    }, {
      data = " ",
      posFirst = 17,
      posLast = 17,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 18,
      posLast = 21,
      type = "value"
    }, {
      data = ",",
      posFirst = 22,
      posLast = 22,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'repeat'",
      posFirst = 10,
      posLast = 17,
      type = "string"
    }, {
      data = "]",
      posFirst = 18,
      posLast = 18,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 19,
      posLast = 19,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 20,
      posLast = 20,
      type = "operator"
    }, {
      data = " ",
      posFirst = 21,
      posLast = 21,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 22,
      posLast = 25,
      type = "value"
    }, {
      data = ",",
      posFirst = 26,
      posLast = 26,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'return'",
      posFirst = 10,
      posLast = 17,
      type = "string"
    }, {
      data = "]",
      posFirst = 18,
      posLast = 18,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 19,
      posLast = 19,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 20,
      posLast = 20,
      type = "operator"
    }, {
      data = " ",
      posFirst = 21,
      posLast = 21,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 22,
      posLast = 25,
      type = "value"
    }, {
      data = ",",
      posFirst = 26,
      posLast = 26,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'then'",
      posFirst = 10,
      posLast = 15,
      type = "string"
    }, {
      data = "]",
      posFirst = 16,
      posLast = 16,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 17,
      posLast = 17,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 18,
      posLast = 18,
      type = "operator"
    }, {
      data = " ",
      posFirst = 19,
      posLast = 19,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 20,
      posLast = 23,
      type = "value"
    }, {
      data = ",",
      posFirst = 24,
      posLast = 24,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'until'",
      posFirst = 10,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'while'",
      posFirst = 10,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    } }, { {
      data = "    ",
      posFirst = 1,
      posLast = 4,
      type = "whitespace"
    }, {
      data = "}",
      posFirst = 5,
      posLast = 5,
      type = "symbol"
    }, {
      data = ",",
      posFirst = 6,
      posLast = 6,
      type = "symbol"
    } }, {}, { {
      data = "    ",
      posFirst = 1,
      posLast = 4,
      type = "whitespace"
    }, {
      data = "values",
      posFirst = 5,
      posLast = 10,
      type = "ident"
    }, {
      data = " ",
      posFirst = 11,
      posLast = 11,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 12,
      posLast = 12,
      type = "operator"
    }, {
      data = " ",
      posFirst = 13,
      posLast = 13,
      type = "whitespace"
    }, {
      data = "{",
      posFirst = 14,
      posLast = 14,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'true'",
      posFirst = 10,
      posLast = 15,
      type = "string"
    }, {
      data = "]",
      posFirst = 16,
      posLast = 16,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 17,
      posLast = 17,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 18,
      posLast = 18,
      type = "operator"
    }, {
      data = " ",
      posFirst = 19,
      posLast = 19,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 20,
      posLast = 23,
      type = "value"
    }, {
      data = ",",
      posFirst = 24,
      posLast = 24,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'false'",
      posFirst = 10,
      posLast = 16,
      type = "string"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 21,
      posLast = 24,
      type = "value"
    }, {
      data = ",",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "[",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    }, {
      data = "'nil'",
      posFirst = 10,
      posLast = 14,
      type = "string"
    }, {
      data = "]",
      posFirst = 15,
      posLast = 15,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 17,
      posLast = 17,
      type = "operator"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 19,
      posLast = 22,
      type = "value"
    } }, { {
      data = "    ",
      posFirst = 1,
      posLast = 4,
      type = "whitespace"
    }, {
      data = "}",
      posFirst = 5,
      posLast = 5,
      type = "symbol"
    } }, { {
      data = "}",
      posFirst = 1,
      posLast = 1,
      type = "symbol"
    } }, {}, { {
      data = "return",
      posFirst = 1,
      posLast = 6,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 7,
      posLast = 7,
      type = "whitespace"
    }, {
      data = "function",
      posFirst = 8,
      posLast = 15,
      type = "keyword"
    }, {
      data = "(",
      posFirst = 16,
      posLast = 16,
      type = "symbol"
    }, {
      data = "text",
      posFirst = 17,
      posLast = 20,
      type = "ident"
    }, {
      data = ")",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "    ",
      posFirst = 1,
      posLast = 4,
      type = "whitespace"
    }, {
      data = "local",
      posFirst = 5,
      posLast = 9,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 10,
      posLast = 10,
      type = "whitespace"
    }, {
      data = "pos",
      posFirst = 11,
      posLast = 13,
      type = "ident"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "1",
      posFirst = 17,
      posLast = 17,
      type = "number"
    } }, { {
      data = "    ",
      posFirst = 1,
      posLast = 4,
      type = "whitespace"
    }, {
      data = "local",
      posFirst = 5,
      posLast = 9,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 10,
      posLast = 10,
      type = "whitespace"
    }, {
      data = "start",
      posFirst = 11,
      posLast = 15,
      type = "ident"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 17,
      posLast = 17,
      type = "operator"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "1",
      posFirst = 19,
      posLast = 19,
      type = "number"
    } }, { {
      data = "    ",
      posFirst = 1,
      posLast = 4,
      type = "whitespace"
    }, {
      data = "local",
      posFirst = 5,
      posLast = 9,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 10,
      posLast = 10,
      type = "whitespace"
    }, {
      data = "len",
      posFirst = 11,
      posLast = 13,
      type = "ident"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "#",
      posFirst = 17,
      posLast = 17,
      type = "operator"
    }, {
      data = "text",
      posFirst = 18,
      posLast = 21,
      type = "ident"
    } }, { {
      data = "    ",
      posFirst = 1,
      posLast = 4,
      type = "whitespace"
    }, {
      data = "local",
      posFirst = 5,
      posLast = 9,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 10,
      posLast = 10,
      type = "whitespace"
    }, {
      data = "buffer",
      posFirst = 11,
      posLast = 16,
      type = "ident"
    }, {
      data = " ",
      posFirst = 17,
      posLast = 17,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 18,
      posLast = 18,
      type = "operator"
    }, {
      data = " ",
      posFirst = 19,
      posLast = 19,
      type = "whitespace"
    }, {
      data = "{",
      posFirst = 20,
      posLast = 20,
      type = "symbol"
    }, {
      data = "}",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    } }, { {
      data = "    ",
      posFirst = 1,
      posLast = 4,
      type = "whitespace"
    }, {
      data = "local",
      posFirst = 5,
      posLast = 9,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 10,
      posLast = 10,
      type = "whitespace"
    }, {
      data = "lines",
      posFirst = 11,
      posLast = 15,
      type = "ident"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 17,
      posLast = 17,
      type = "operator"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "{",
      posFirst = 19,
      posLast = 19,
      type = "symbol"
    }, {
      data = "}",
      posFirst = 20,
      posLast = 20,
      type = "symbol"
    } }, {}, { {
      data = "    ",
      posFirst = 1,
      posLast = 4,
      type = "whitespace"
    }, {
      data = "local",
      posFirst = 5,
      posLast = 9,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 10,
      posLast = 10,
      type = "whitespace"
    }, {
      data = "function",
      posFirst = 11,
      posLast = 18,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 19,
      posLast = 19,
      type = "whitespace"
    }, {
      data = "look",
      posFirst = 20,
      posLast = 23,
      type = "ident"
    }, {
      data = "(",
      posFirst = 24,
      posLast = 24,
      type = "symbol"
    }, {
      data = "delta",
      posFirst = 25,
      posLast = 29,
      type = "ident"
    }, {
      data = ")",
      posFirst = 30,
      posLast = 30,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "delta",
      posFirst = 9,
      posLast = 13,
      type = "ident"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "pos",
      posFirst = 17,
      posLast = 19,
      type = "ident"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "+",
      posFirst = 21,
      posLast = 21,
      type = "operator"
    }, {
      data = " ",
      posFirst = 22,
      posLast = 22,
      type = "whitespace"
    }, {
      data = "(",
      posFirst = 23,
      posLast = 23,
      type = "symbol"
    }, {
      data = "delta",
      posFirst = 24,
      posLast = 28,
      type = "ident"
    }, {
      data = " ",
      posFirst = 29,
      posLast = 29,
      type = "whitespace"
    }, {
      data = "or",
      posFirst = 30,
      posLast = 31,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 32,
      posLast = 32,
      type = "whitespace"
    }, {
      data = "0",
      posFirst = 33,
      posLast = 33,
      type = "number"
    }, {
      data = ")",
      posFirst = 34,
      posLast = 34,
      type = "symbol"
    } }, {}, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "return",
      posFirst = 9,
      posLast = 14,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 15,
      posLast = 15,
      type = "whitespace"
    }, {
      data = "text",
      posFirst = 16,
      posLast = 19,
      type = "ident"
    }, {
      data = ":",
      posFirst = 20,
      posLast = 20,
      type = "symbol"
    }, {
      data = "sub",
      posFirst = 21,
      posLast = 23,
      type = "ident"
    }, {
      data = "(",
      posFirst = 24,
      posLast = 24,
      type = "symbol"
    }, {
      data = "delta",
      posFirst = 25,
      posLast = 29,
      type = "ident"
    }, {
      data = ",",
      posFirst = 30,
      posLast = 30,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 31,
      posLast = 31,
      type = "whitespace"
    }, {
      data = "delta",
      posFirst = 32,
      posLast = 36,
      type = "ident"
    }, {
      data = ")",
      posFirst = 37,
      posLast = 37,
      type = "symbol"
    } }, { {
      data = "    ",
      posFirst = 1,
      posLast = 4,
      type = "whitespace"
    }, {
      data = "end",
      posFirst = 5,
      posLast = 7,
      type = "keyword"
    } }, {}, { {
      data = "    ",
      posFirst = 1,
      posLast = 4,
      type = "whitespace"
    }, {
      data = "local",
      posFirst = 5,
      posLast = 9,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 10,
      posLast = 10,
      type = "whitespace"
    }, {
      data = "function",
      posFirst = 11,
      posLast = 18,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 19,
      posLast = 19,
      type = "whitespace"
    }, {
      data = "get",
      posFirst = 20,
      posLast = 22,
      type = "ident"
    }, {
      data = "(",
      posFirst = 23,
      posLast = 23,
      type = "symbol"
    }, {
      data = ")",
      posFirst = 24,
      posLast = 24,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "local",
      posFirst = 9,
      posLast = 13,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "char",
      posFirst = 15,
      posLast = 18,
      type = "ident"
    }, {
      data = " ",
      posFirst = 19,
      posLast = 19,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 20,
      posLast = 20,
      type = "operator"
    }, {
      data = " ",
      posFirst = 21,
      posLast = 21,
      type = "whitespace"
    }, {
      data = "text",
      posFirst = 22,
      posLast = 25,
      type = "ident"
    }, {
      data = ":",
      posFirst = 26,
      posLast = 26,
      type = "symbol"
    }, {
      data = "sub",
      posFirst = 27,
      posLast = 29,
      type = "ident"
    }, {
      data = "(",
      posFirst = 30,
      posLast = 30,
      type = "symbol"
    }, {
      data = "pos",
      posFirst = 31,
      posLast = 33,
      type = "ident"
    }, {
      data = ",",
      posFirst = 34,
      posLast = 34,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 35,
      posLast = 35,
      type = "whitespace"
    }, {
      data = "pos",
      posFirst = 36,
      posLast = 38,
      type = "ident"
    }, {
      data = ")",
      posFirst = 39,
      posLast = 39,
      type = "symbol"
    } }, {}, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "pos",
      posFirst = 9,
      posLast = 11,
      type = "ident"
    }, {
      data = " ",
      posFirst = 12,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 13,
      posLast = 13,
      type = "operator"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "pos",
      posFirst = 15,
      posLast = 17,
      type = "ident"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "+",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "1",
      posFirst = 21,
      posLast = 21,
      type = "number"
    } }, {}, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "return",
      posFirst = 9,
      posLast = 14,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 15,
      posLast = 15,
      type = "whitespace"
    }, {
      data = "char",
      posFirst = 16,
      posLast = 19,
      type = "ident"
    } }, { {
      data = "    ",
      posFirst = 1,
      posLast = 4,
      type = "whitespace"
    }, {
      data = "end",
      posFirst = 5,
      posLast = 7,
      type = "keyword"
    } }, {}, { {
      data = "    ",
      posFirst = 1,
      posLast = 4,
      type = "whitespace"
    }, {
      data = "local",
      posFirst = 5,
      posLast = 9,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 10,
      posLast = 10,
      type = "whitespace"
    }, {
      data = "function",
      posFirst = 11,
      posLast = 18,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 19,
      posLast = 19,
      type = "whitespace"
    }, {
      data = "getLevel",
      posFirst = 20,
      posLast = 27,
      type = "ident"
    }, {
      data = "(",
      posFirst = 28,
      posLast = 28,
      type = "symbol"
    }, {
      data = ")",
      posFirst = 29,
      posLast = 29,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "local",
      posFirst = 9,
      posLast = 13,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "num",
      posFirst = 15,
      posLast = 17,
      type = "ident"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "0",
      posFirst = 21,
      posLast = 21,
      type = "number"
    } }, {}, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "while",
      posFirst = 9,
      posLast = 13,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "look",
      posFirst = 15,
      posLast = 18,
      type = "ident"
    }, {
      data = "(",
      posFirst = 19,
      posLast = 19,
      type = "symbol"
    }, {
      data = "num",
      posFirst = 20,
      posLast = 22,
      type = "ident"
    }, {
      data = ")",
      posFirst = 23,
      posLast = 23,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 24,
      posLast = 24,
      type = "whitespace"
    }, {
      data = "==",
      posFirst = 25,
      posLast = 26,
      type = "operator"
    }, {
      data = " ",
      posFirst = 27,
      posLast = 27,
      type = "whitespace"
    }, {
      data = "'='",
      posFirst = 28,
      posLast = 30,
      type = "string"
    }, {
      data = " ",
      posFirst = 31,
      posLast = 31,
      type = "whitespace"
    }, {
      data = "do",
      posFirst = 32,
      posLast = 33,
      type = "keyword"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "num",
      posFirst = 13,
      posLast = 15,
      type = "ident"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 17,
      posLast = 17,
      type = "operator"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "num",
      posFirst = 19,
      posLast = 21,
      type = "ident"
    }, {
      data = " ",
      posFirst = 22,
      posLast = 22,
      type = "whitespace"
    }, {
      data = "+",
      posFirst = 23,
      posLast = 23,
      type = "operator"
    }, {
      data = " ",
      posFirst = 24,
      posLast = 24,
      type = "whitespace"
    }, {
      data = "1",
      posFirst = 25,
      posLast = 25,
      type = "number"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "end",
      posFirst = 9,
      posLast = 11,
      type = "keyword"
    } }, {}, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "if",
      posFirst = 9,
      posLast = 10,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 11,
      posLast = 11,
      type = "whitespace"
    }, {
      data = "look",
      posFirst = 12,
      posLast = 15,
      type = "ident"
    }, {
      data = "(",
      posFirst = 16,
      posLast = 16,
      type = "symbol"
    }, {
      data = "num",
      posFirst = 17,
      posLast = 19,
      type = "ident"
    }, {
      data = ")",
      posFirst = 20,
      posLast = 20,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 21,
      posLast = 21,
      type = "whitespace"
    }, {
      data = "==",
      posFirst = 22,
      posLast = 23,
      type = "operator"
    }, {
      data = " ",
      posFirst = 24,
      posLast = 24,
      type = "whitespace"
    }, {
      data = "'['",
      posFirst = 25,
      posLast = 27,
      type = "string"
    }, {
      data = " ",
      posFirst = 28,
      posLast = 28,
      type = "whitespace"
    }, {
      data = "then",
      posFirst = 29,
      posLast = 32,
      type = "keyword"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "pos",
      posFirst = 13,
      posLast = 15,
      type = "ident"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 17,
      posLast = 17,
      type = "operator"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "pos",
      posFirst = 19,
      posLast = 21,
      type = "ident"
    }, {
      data = " ",
      posFirst = 22,
      posLast = 22,
      type = "whitespace"
    }, {
      data = "+",
      posFirst = 23,
      posLast = 23,
      type = "operator"
    }, {
      data = " ",
      posFirst = 24,
      posLast = 24,
      type = "whitespace"
    }, {
      data = "num",
      posFirst = 25,
      posLast = 27,
      type = "ident"
    } }, {}, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "return",
      posFirst = 13,
      posLast = 18,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 19,
      posLast = 19,
      type = "whitespace"
    }, {
      data = "num",
      posFirst = 20,
      posLast = 22,
      type = "ident"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "else",
      posFirst = 9,
      posLast = 12,
      type = "keyword"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "return",
      posFirst = 13,
      posLast = 18,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 19,
      posLast = 19,
      type = "whitespace"
    }, {
      data = "nil",
      posFirst = 20,
      posLast = 22,
      type = "value"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "end",
      posFirst = 9,
      posLast = 11,
      type = "keyword"
    } }, { {
      data = "    ",
      posFirst = 1,
      posLast = 4,
      type = "whitespace"
    }, {
      data = "end",
      posFirst = 5,
      posLast = 7,
      type = "keyword"
    } }, {}, { {
      data = "    ",
      posFirst = 1,
      posLast = 4,
      type = "whitespace"
    }, {
      data = "local",
      posFirst = 5,
      posLast = 9,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 10,
      posLast = 10,
      type = "whitespace"
    }, {
      data = "function",
      posFirst = 11,
      posLast = 18,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 19,
      posLast = 19,
      type = "whitespace"
    }, {
      data = "getToken",
      posFirst = 20,
      posLast = 27,
      type = "ident"
    }, {
      data = "(",
      posFirst = 28,
      posLast = 28,
      type = "symbol"
    }, {
      data = ")",
      posFirst = 29,
      posLast = 29,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "return",
      posFirst = 9,
      posLast = 14,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 15,
      posLast = 15,
      type = "whitespace"
    }, {
      data = "text",
      posFirst = 16,
      posLast = 19,
      type = "ident"
    }, {
      data = ":",
      posFirst = 20,
      posLast = 20,
      type = "symbol"
    }, {
      data = "sub",
      posFirst = 21,
      posLast = 23,
      type = "ident"
    }, {
      data = "(",
      posFirst = 24,
      posLast = 24,
      type = "symbol"
    }, {
      data = "start",
      posFirst = 25,
      posLast = 29,
      type = "ident"
    }, {
      data = ",",
      posFirst = 30,
      posLast = 30,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 31,
      posLast = 31,
      type = "whitespace"
    }, {
      data = "pos",
      posFirst = 32,
      posLast = 34,
      type = "ident"
    }, {
      data = " ",
      posFirst = 35,
      posLast = 35,
      type = "whitespace"
    }, {
      data = "-",
      posFirst = 36,
      posLast = 36,
      type = "operator"
    }, {
      data = " ",
      posFirst = 37,
      posLast = 37,
      type = "whitespace"
    }, {
      data = "1",
      posFirst = 38,
      posLast = 38,
      type = "number"
    }, {
      data = ")",
      posFirst = 39,
      posLast = 39,
      type = "symbol"
    } }, { {
      data = "    ",
      posFirst = 1,
      posLast = 4,
      type = "whitespace"
    }, {
      data = "end",
      posFirst = 5,
      posLast = 7,
      type = "keyword"
    } }, {}, { {
      data = "    ",
      posFirst = 1,
      posLast = 4,
      type = "whitespace"
    }, {
      data = "local",
      posFirst = 5,
      posLast = 9,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 10,
      posLast = 10,
      type = "whitespace"
    }, {
      data = "currentLineLength",
      posFirst = 11,
      posLast = 27,
      type = "ident"
    }, {
      data = " ",
      posFirst = 28,
      posLast = 28,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 29,
      posLast = 29,
      type = "operator"
    }, {
      data = " ",
      posFirst = 30,
      posLast = 30,
      type = "whitespace"
    }, {
      data = "0",
      posFirst = 31,
      posLast = 31,
      type = "number"
    } }, { {
      data = "    ",
      posFirst = 1,
      posLast = 4,
      type = "whitespace"
    }, {
      data = "local",
      posFirst = 5,
      posLast = 9,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 10,
      posLast = 10,
      type = "whitespace"
    }, {
      data = "lineoffset",
      posFirst = 11,
      posLast = 20,
      type = "ident"
    }, {
      data = " ",
      posFirst = 21,
      posLast = 21,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 22,
      posLast = 22,
      type = "operator"
    }, {
      data = " ",
      posFirst = 23,
      posLast = 23,
      type = "whitespace"
    }, {
      data = "0",
      posFirst = 24,
      posLast = 24,
      type = "number"
    } }, {}, { {
      data = "    ",
      posFirst = 1,
      posLast = 4,
      type = "whitespace"
    }, {
      data = "local",
      posFirst = 5,
      posLast = 9,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 10,
      posLast = 10,
      type = "whitespace"
    }, {
      data = "function",
      posFirst = 11,
      posLast = 18,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 19,
      posLast = 19,
      type = "whitespace"
    }, {
      data = "token",
      posFirst = 20,
      posLast = 24,
      type = "ident"
    }, {
      data = "(",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    }, {
      data = "type",
      posFirst = 26,
      posLast = 29,
      type = "ident"
    }, {
      data = ",",
      posFirst = 30,
      posLast = 30,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 31,
      posLast = 31,
      type = "whitespace"
    }, {
      data = "text",
      posFirst = 32,
      posLast = 35,
      type = "ident"
    }, {
      data = ")",
      posFirst = 36,
      posLast = 36,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "text",
      posFirst = 9,
      posLast = 12,
      type = "ident"
    }, {
      data = " ",
      posFirst = 13,
      posLast = 13,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 14,
      posLast = 14,
      type = "operator"
    }, {
      data = " ",
      posFirst = 15,
      posLast = 15,
      type = "whitespace"
    }, {
      data = "text",
      posFirst = 16,
      posLast = 19,
      type = "ident"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "or",
      posFirst = 21,
      posLast = 22,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 23,
      posLast = 23,
      type = "whitespace"
    }, {
      data = "getToken",
      posFirst = 24,
      posLast = 31,
      type = "ident"
    }, {
      data = "(",
      posFirst = 32,
      posLast = 32,
      type = "symbol"
    }, {
      data = ")",
      posFirst = 33,
      posLast = 33,
      type = "symbol"
    } }, {}, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "local",
      posFirst = 9,
      posLast = 13,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "tk",
      posFirst = 15,
      posLast = 16,
      type = "ident"
    }, {
      data = " ",
      posFirst = 17,
      posLast = 17,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 18,
      posLast = 18,
      type = "operator"
    }, {
      data = " ",
      posFirst = 19,
      posLast = 19,
      type = "whitespace"
    }, {
      data = "{",
      posFirst = 20,
      posLast = 20,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "type",
      posFirst = 13,
      posLast = 16,
      type = "ident"
    }, {
      data = " ",
      posFirst = 17,
      posLast = 17,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 18,
      posLast = 18,
      type = "operator"
    }, {
      data = " ",
      posFirst = 19,
      posLast = 19,
      type = "whitespace"
    }, {
      data = "type",
      posFirst = 20,
      posLast = 23,
      type = "ident"
    }, {
      data = ",",
      posFirst = 24,
      posLast = 24,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "data",
      posFirst = 13,
      posLast = 16,
      type = "ident"
    }, {
      data = " ",
      posFirst = 17,
      posLast = 17,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 18,
      posLast = 18,
      type = "operator"
    }, {
      data = " ",
      posFirst = 19,
      posLast = 19,
      type = "whitespace"
    }, {
      data = "text",
      posFirst = 20,
      posLast = 23,
      type = "ident"
    }, {
      data = ",",
      posFirst = 24,
      posLast = 24,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "posFirst",
      posFirst = 13,
      posLast = 20,
      type = "ident"
    }, {
      data = " ",
      posFirst = 21,
      posLast = 21,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 22,
      posLast = 22,
      type = "operator"
    }, {
      data = " ",
      posFirst = 23,
      posLast = 23,
      type = "whitespace"
    }, {
      data = "start",
      posFirst = 24,
      posLast = 28,
      type = "ident"
    }, {
      data = " ",
      posFirst = 29,
      posLast = 29,
      type = "whitespace"
    }, {
      data = "-",
      posFirst = 30,
      posLast = 30,
      type = "operator"
    }, {
      data = " ",
      posFirst = 31,
      posLast = 31,
      type = "whitespace"
    }, {
      data = "lineoffset",
      posFirst = 32,
      posLast = 41,
      type = "ident"
    }, {
      data = ",",
      posFirst = 42,
      posLast = 42,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "posLast",
      posFirst = 13,
      posLast = 19,
      type = "ident"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 21,
      posLast = 21,
      type = "operator"
    }, {
      data = " ",
      posFirst = 22,
      posLast = 22,
      type = "whitespace"
    }, {
      data = "pos",
      posFirst = 23,
      posLast = 25,
      type = "ident"
    }, {
      data = " ",
      posFirst = 26,
      posLast = 26,
      type = "whitespace"
    }, {
      data = "-",
      posFirst = 27,
      posLast = 27,
      type = "operator"
    }, {
      data = " ",
      posFirst = 28,
      posLast = 28,
      type = "whitespace"
    }, {
      data = "1",
      posFirst = 29,
      posLast = 29,
      type = "number"
    }, {
      data = " ",
      posFirst = 30,
      posLast = 30,
      type = "whitespace"
    }, {
      data = "-",
      posFirst = 31,
      posLast = 31,
      type = "operator"
    }, {
      data = " ",
      posFirst = 32,
      posLast = 32,
      type = "whitespace"
    }, {
      data = "lineoffset",
      posFirst = 33,
      posLast = 42,
      type = "ident"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "}",
      posFirst = 9,
      posLast = 9,
      type = "symbol"
    } }, {}, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "if",
      posFirst = 9,
      posLast = 10,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 11,
      posLast = 11,
      type = "whitespace"
    }, {
      data = "tk",
      posFirst = 12,
      posLast = 13,
      type = "ident"
    }, {
      data = ".",
      posFirst = 14,
      posLast = 14,
      type = "symbol"
    }, {
      data = "data",
      posFirst = 15,
      posLast = 18,
      type = "ident"
    }, {
      data = " ",
      posFirst = 19,
      posLast = 19,
      type = "whitespace"
    }, {
      data = "~=",
      posFirst = 20,
      posLast = 21,
      type = "operator"
    }, {
      data = " ",
      posFirst = 22,
      posLast = 22,
      type = "whitespace"
    }, {
      data = "''",
      posFirst = 23,
      posLast = 24,
      type = "string"
    }, {
      data = " ",
      posFirst = 25,
      posLast = 25,
      type = "whitespace"
    }, {
      data = "then",
      posFirst = 26,
      posLast = 29,
      type = "keyword"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "buffer",
      posFirst = 13,
      posLast = 18,
      type = "ident"
    }, {
      data = "[",
      posFirst = 19,
      posLast = 19,
      type = "symbol"
    }, {
      data = "#",
      posFirst = 20,
      posLast = 20,
      type = "operator"
    }, {
      data = "buffer",
      posFirst = 21,
      posLast = 26,
      type = "ident"
    }, {
      data = " ",
      posFirst = 27,
      posLast = 27,
      type = "whitespace"
    }, {
      data = "+",
      posFirst = 28,
      posLast = 28,
      type = "operator"
    }, {
      data = " ",
      posFirst = 29,
      posLast = 29,
      type = "whitespace"
    }, {
      data = "1",
      posFirst = 30,
      posLast = 30,
      type = "number"
    }, {
      data = "]",
      posFirst = 31,
      posLast = 31,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 32,
      posLast = 32,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 33,
      posLast = 33,
      type = "operator"
    }, {
      data = " ",
      posFirst = 34,
      posLast = 34,
      type = "whitespace"
    }, {
      data = "tk",
      posFirst = 35,
      posLast = 36,
      type = "ident"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "end",
      posFirst = 9,
      posLast = 11,
      type = "keyword"
    } }, {}, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "currentLineLength",
      posFirst = 9,
      posLast = 25,
      type = "ident"
    }, {
      data = " ",
      posFirst = 26,
      posLast = 26,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 27,
      posLast = 27,
      type = "operator"
    }, {
      data = " ",
      posFirst = 28,
      posLast = 28,
      type = "whitespace"
    }, {
      data = "currentLineLength",
      posFirst = 29,
      posLast = 45,
      type = "ident"
    }, {
      data = " ",
      posFirst = 46,
      posLast = 46,
      type = "whitespace"
    }, {
      data = "+",
      posFirst = 47,
      posLast = 47,
      type = "operator"
    }, {
      data = " ",
      posFirst = 48,
      posLast = 48,
      type = "whitespace"
    }, {
      data = "text",
      posFirst = 49,
      posLast = 52,
      type = "ident"
    }, {
      data = ":",
      posFirst = 53,
      posLast = 53,
      type = "symbol"
    }, {
      data = "len",
      posFirst = 54,
      posLast = 56,
      type = "ident"
    }, {
      data = "(",
      posFirst = 57,
      posLast = 57,
      type = "symbol"
    }, {
      data = ")",
      posFirst = 58,
      posLast = 58,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "start",
      posFirst = 9,
      posLast = 13,
      type = "ident"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "pos",
      posFirst = 17,
      posLast = 19,
      type = "ident"
    } }, {}, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "return",
      posFirst = 9,
      posLast = 14,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 15,
      posLast = 15,
      type = "whitespace"
    }, {
      data = "tk",
      posFirst = 16,
      posLast = 17,
      type = "ident"
    } }, { {
      data = "    ",
      posFirst = 1,
      posLast = 4,
      type = "whitespace"
    }, {
      data = "end",
      posFirst = 5,
      posLast = 7,
      type = "keyword"
    } }, {}, { {
      data = "    ",
      posFirst = 1,
      posLast = 4,
      type = "whitespace"
    }, {
      data = "local",
      posFirst = 5,
      posLast = 9,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 10,
      posLast = 10,
      type = "whitespace"
    }, {
      data = "function",
      posFirst = 11,
      posLast = 18,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 19,
      posLast = 19,
      type = "whitespace"
    }, {
      data = "newline",
      posFirst = 20,
      posLast = 26,
      type = "ident"
    }, {
      data = "(",
      posFirst = 27,
      posLast = 27,
      type = "symbol"
    }, {
      data = ")",
      posFirst = 28,
      posLast = 28,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "lines",
      posFirst = 9,
      posLast = 13,
      type = "ident"
    }, {
      data = "[",
      posFirst = 14,
      posLast = 14,
      type = "symbol"
    }, {
      data = "#",
      posFirst = 15,
      posLast = 15,
      type = "operator"
    }, {
      data = "lines",
      posFirst = 16,
      posLast = 20,
      type = "ident"
    }, {
      data = " ",
      posFirst = 21,
      posLast = 21,
      type = "whitespace"
    }, {
      data = "+",
      posFirst = 22,
      posLast = 22,
      type = "operator"
    }, {
      data = " ",
      posFirst = 23,
      posLast = 23,
      type = "whitespace"
    }, {
      data = "1",
      posFirst = 24,
      posLast = 24,
      type = "number"
    }, {
      data = "]",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 26,
      posLast = 26,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 27,
      posLast = 27,
      type = "operator"
    }, {
      data = " ",
      posFirst = 28,
      posLast = 28,
      type = "whitespace"
    }, {
      data = "buffer",
      posFirst = 29,
      posLast = 34,
      type = "ident"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "buffer",
      posFirst = 9,
      posLast = 14,
      type = "ident"
    }, {
      data = " ",
      posFirst = 15,
      posLast = 15,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 16,
      posLast = 16,
      type = "operator"
    }, {
      data = " ",
      posFirst = 17,
      posLast = 17,
      type = "whitespace"
    }, {
      data = "{",
      posFirst = 18,
      posLast = 18,
      type = "symbol"
    }, {
      data = "}",
      posFirst = 19,
      posLast = 19,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "get",
      posFirst = 9,
      posLast = 11,
      type = "ident"
    }, {
      data = "(",
      posFirst = 12,
      posLast = 12,
      type = "symbol"
    }, {
      data = ")",
      posFirst = 13,
      posLast = 13,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "token",
      posFirst = 9,
      posLast = 13,
      type = "ident"
    }, {
      data = "(",
      posFirst = 14,
      posLast = 14,
      type = "symbol"
    }, {
      data = "'newline'",
      posFirst = 15,
      posLast = 23,
      type = "string"
    }, {
      data = ")",
      posFirst = 24,
      posLast = 24,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "buffer",
      posFirst = 9,
      posLast = 14,
      type = "ident"
    }, {
      data = "[",
      posFirst = 15,
      posLast = 15,
      type = "symbol"
    }, {
      data = "1",
      posFirst = 16,
      posLast = 16,
      type = "number"
    }, {
      data = "]",
      posFirst = 17,
      posLast = 17,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 19,
      posLast = 19,
      type = "operator"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "nil",
      posFirst = 21,
      posLast = 23,
      type = "value"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "lineoffs",
      posFirst = 9,
      posLast = 16,
      type = "ident"
    }, {
      data = "        ",
      posFirst = 17,
      posLast = 24,
      type = "whitespace"
    }, {
      data = "lineoffs",
      posFirst = 25,
      posLast = 32,
      type = "ident"
    }, {
      data = "  ",
      posFirst = 33,
      posLast = 34,
      type = "whitespace"
    }, {
      data = "cu",
      posFirst = 35,
      posLast = 36,
      type = "ident"
    }, {
      data = "    ",
      posFirst = 37,
      posLast = 40,
      type = "whitespace"
    }, {
      data = "tLine",
      posFirst = 41,
      posLast = 45,
      type = "ident"
    }, {
      data = "        ",
      posFirst = 46,
      posLast = 53,
      type = "whitespace"
    }, {
      data = "lineoffs",
      posFirst = 54,
      posLast = 61,
      type = "ident"
    }, {
      data = "        ",
      posFirst = 62,
      posLast = 69,
      type = "whitespace"
    }, {
      data = "leLeng",
      posFirst = 70,
      posLast = 75,
      type = "ident"
    }, {
      data = "        ",
      posFirst = 76,
      posLast = 83,
      type = "whitespace"
    }, {
      data = "lineoffs",
      posFirst = 84,
      posLast = 91,
      type = "ident"
    }, {
      data = "    ",
      posFirst = 92,
      posLast = 95,
      type = "whitespace"
    }, {
      data = "loc",
      posFirst = 96,
      posLast = 98,
      type = "ident"
    }, {
      data = "        ",
      posFirst = 99,
      posLast = 106,
      type = "whitespace"
    }, {
      data = "lineoffs",
      posFirst = 107,
      posLast = 114,
      type = "ident"
    }, {
      data = "        ",
      posFirst = 115,
      posLast = 122,
      type = "whitespace"
    }, {
      data = "lineoffs",
      posFirst = 123,
      posLast = 130,
      type = "ident"
    } }, { {
      data = "                                    ",
      posFirst = 1,
      posLast = 36,
      type = "whitespace"
    }, {
      data = "cal",
      posFirst = 37,
      posLast = 39,
      type = "ident"
    }, {
      data = "                               ",
      posFirst = 40,
      posLast = 70,
      type = "whitespace"
    }, {
      data = "har",
      posFirst = 71,
      posLast = 73,
      type = "ident"
    }, {
      data = " ",
      posFirst = 74,
      posLast = 74,
      type = "whitespace"
    }, {
      data = "==",
      posFirst = 75,
      posLast = 76,
      type = "operator"
    }, {
      data = " ",
      posFirst = 77,
      posLast = 77,
      type = "whitespace"
    }, {
      data = "''",
      posFirst = 78,
      posLast = 79,
      type = "string"
    }, {
      data = " ",
      posFirst = 80,
      posLast = 80,
      type = "whitespace"
    }, {
      data = "then",
      posFirst = 81,
      posLast = 84,
      type = "keyword"
    } }, { {
      data = "                ",
      posFirst = 1,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "return",
      posFirst = 17,
      posLast = 22,
      type = "keyword"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "elseif",
      posFirst = 13,
      posLast = 18,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 19,
      posLast = 19,
      type = "whitespace"
    }, {
      data = "char",
      posFirst = 20,
      posLast = 23,
      type = "ident"
    }, {
      data = " ",
      posFirst = 24,
      posLast = 24,
      type = "whitespace"
    }, {
      data = "==",
      posFirst = 25,
      posLast = 26,
      type = "operator"
    }, {
      data = " ",
      posFirst = 27,
      posLast = 27,
      type = "whitespace"
    }, {
      data = "'",
      posFirst = 28,
      posLast = 28,
      type = "string"
    }, {
      data = "\\n",
      posFirst = 29,
      posLast = 30,
      type = "escape"
    }, {
      data = "'",
      posFirst = 31,
      posLast = 31,
      type = "string"
    }, {
      data = " ",
      posFirst = 32,
      posLast = 32,
      type = "whitespace"
    }, {
      data = "then",
      posFirst = 33,
      posLast = 36,
      type = "keyword"
    } }, { {
      data = "                ",
      posFirst = 1,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "pos",
      posFirst = 17,
      posLast = 19,
      type = "ident"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 21,
      posLast = 21,
      type = "operator"
    }, {
      data = " ",
      posFirst = 22,
      posLast = 22,
      type = "whitespace"
    }, {
      data = "pos",
      posFirst = 23,
      posLast = 25,
      type = "ident"
    }, {
      data = " ",
      posFirst = 26,
      posLast = 26,
      type = "whitespace"
    }, {
      data = "-",
      posFirst = 27,
      posLast = 27,
      type = "operator"
    }, {
      data = " ",
      posFirst = 28,
      posLast = 28,
      type = "whitespace"
    }, {
      data = "1",
      posFirst = 29,
      posLast = 29,
      type = "number"
    } }, { {
      data = "                ",
      posFirst = 1,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "token",
      posFirst = 17,
      posLast = 21,
      type = "ident"
    }, {
      data = "(",
      posFirst = 22,
      posLast = 22,
      type = "symbol"
    }, {
      data = "type",
      posFirst = 23,
      posLast = 26,
      type = "ident"
    }, {
      data = ")",
      posFirst = 27,
      posLast = 27,
      type = "symbol"
    } }, { {
      data = "                ",
      posFirst = 1,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "newline",
      posFirst = 17,
      posLast = 23,
      type = "ident"
    }, {
      data = "(",
      posFirst = 24,
      posLast = 24,
      type = "symbol"
    }, {
      data = ")",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "elseif",
      posFirst = 13,
      posLast = 18,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 19,
      posLast = 19,
      type = "whitespace"
    }, {
      data = "char",
      posFirst = 20,
      posLast = 23,
      type = "ident"
    }, {
      data = " ",
      posFirst = 24,
      posLast = 24,
      type = "whitespace"
    }, {
      data = "==",
      posFirst = 25,
      posLast = 26,
      type = "operator"
    }, {
      data = " ",
      posFirst = 27,
      posLast = 27,
      type = "whitespace"
    }, {
      data = "']'",
      posFirst = 28,
      posLast = 30,
      type = "string"
    }, {
      data = " ",
      posFirst = 31,
      posLast = 31,
      type = "whitespace"
    }, {
      data = "then",
      posFirst = 32,
      posLast = 35,
      type = "keyword"
    } }, { {
      data = "                ",
      posFirst = 1,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "local",
      posFirst = 17,
      posLast = 21,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 22,
      posLast = 22,
      type = "whitespace"
    }, {
      data = "valid",
      posFirst = 23,
      posLast = 27,
      type = "ident"
    }, {
      data = " ",
      posFirst = 28,
      posLast = 28,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 29,
      posLast = 29,
      type = "operator"
    }, {
      data = " ",
      posFirst = 30,
      posLast = 30,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 31,
      posLast = 34,
      type = "value"
    } }, {}, { {
      data = "                ",
      posFirst = 1,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "for",
      posFirst = 17,
      posLast = 19,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "i",
      posFirst = 21,
      posLast = 21,
      type = "ident"
    }, {
      data = " ",
      posFirst = 22,
      posLast = 22,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 23,
      posLast = 23,
      type = "operator"
    }, {
      data = " ",
      posFirst = 24,
      posLast = 24,
      type = "whitespace"
    }, {
      data = "1",
      posFirst = 25,
      posLast = 25,
      type = "number"
    }, {
      data = ",",
      posFirst = 26,
      posLast = 26,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 27,
      posLast = 27,
      type = "whitespace"
    }, {
      data = "level",
      posFirst = 28,
      posLast = 32,
      type = "ident"
    }, {
      data = " ",
      posFirst = 33,
      posLast = 33,
      type = "whitespace"
    }, {
      data = "do",
      posFirst = 34,
      posLast = 35,
      type = "keyword"
    } }, { {
      data = "                    ",
      posFirst = 1,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "if",
      posFirst = 21,
      posLast = 22,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 23,
      posLast = 23,
      type = "whitespace"
    }, {
      data = "look",
      posFirst = 24,
      posLast = 27,
      type = "ident"
    }, {
      data = "(",
      posFirst = 28,
      posLast = 28,
      type = "symbol"
    }, {
      data = ")",
      posFirst = 29,
      posLast = 29,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 30,
      posLast = 30,
      type = "whitespace"
    }, {
      data = "==",
      posFirst = 31,
      posLast = 32,
      type = "operator"
    }, {
      data = " ",
      posFirst = 33,
      posLast = 33,
      type = "whitespace"
    }, {
      data = "'='",
      posFirst = 34,
      posLast = 36,
      type = "string"
    }, {
      data = " ",
      posFirst = 37,
      posLast = 37,
      type = "whitespace"
    }, {
      data = "then",
      posFirst = 38,
      posLast = 41,
      type = "keyword"
    } }, { {
      data = "                        ",
      posFirst = 1,
      posLast = 24,
      type = "whitespace"
    }, {
      data = "pos",
      posFirst = 25,
      posLast = 27,
      type = "ident"
    }, {
      data = " ",
      posFirst = 28,
      posLast = 28,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 29,
      posLast = 29,
      type = "operator"
    }, {
      data = " ",
      posFirst = 30,
      posLast = 30,
      type = "whitespace"
    }, {
      data = "pos",
      posFirst = 31,
      posLast = 33,
      type = "ident"
    }, {
      data = " ",
      posFirst = 34,
      posLast = 34,
      type = "whitespace"
    }, {
      data = "+",
      posFirst = 35,
      posLast = 35,
      type = "operator"
    }, {
      data = " ",
      posFirst = 36,
      posLast = 36,
      type = "whitespace"
    }, {
      data = "1",
      posFirst = 37,
      posLast = 37,
      type = "number"
    } }, { {
      data = "                    ",
      posFirst = 1,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "else",
      posFirst = 21,
      posLast = 24,
      type = "keyword"
    } }, { {
      data = "                        ",
      posFirst = 1,
      posLast = 24,
      type = "whitespace"
    }, {
      data = "valid",
      posFirst = 25,
      posLast = 29,
      type = "ident"
    }, {
      data = " ",
      posFirst = 30,
      posLast = 30,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 31,
      posLast = 31,
      type = "operator"
    }, {
      data = " ",
      posFirst = 32,
      posLast = 32,
      type = "whitespace"
    }, {
      data = "false",
      posFirst = 33,
      posLast = 37,
      type = "value"
    } }, { {
      data = "                        ",
      posFirst = 1,
      posLast = 24,
      type = "whitespace"
    }, {
      data = "break",
      posFirst = 25,
      posLast = 29,
      type = "keyword"
    } }, { {
      data = "                    ",
      posFirst = 1,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "end",
      posFirst = 21,
      posLast = 23,
      type = "keyword"
    } }, { {
      data = "                ",
      posFirst = 1,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "end",
      posFirst = 17,
      posLast = 19,
      type = "keyword"
    } }, {}, { {
      data = "                ",
      posFirst = 1,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "if",
      posFirst = 17,
      posLast = 18,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 19,
      posLast = 19,
      type = "whitespace"
    }, {
      data = "valid",
      posFirst = 20,
      posLast = 24,
      type = "ident"
    }, {
      data = " ",
      posFirst = 25,
      posLast = 25,
      type = "whitespace"
    }, {
      data = "and",
      posFirst = 26,
      posLast = 28,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 29,
      posLast = 29,
      type = "whitespace"
    }, {
      data = "look",
      posFirst = 30,
      posLast = 33,
      type = "ident"
    }, {
      data = "(",
      posFirst = 34,
      posLast = 34,
      type = "symbol"
    }, {
      data = ")",
      posFirst = 35,
      posLast = 35,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 36,
      posLast = 36,
      type = "whitespace"
    }, {
      data = "==",
      posFirst = 37,
      posLast = 38,
      type = "operator"
    }, {
      data = " ",
      posFirst = 39,
      posLast = 39,
      type = "whitespace"
    }, {
      data = "']'",
      posFirst = 40,
      posLast = 42,
      type = "string"
    }, {
      data = " ",
      posFirst = 43,
      posLast = 43,
      type = "whitespace"
    }, {
      data = "then",
      posFirst = 44,
      posLast = 47,
      type = "keyword"
    } }, { {
      data = "                    ",
      posFirst = 1,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "pos",
      posFirst = 21,
      posLast = 23,
      type = "ident"
    }, {
      data = " ",
      posFirst = 24,
      posLast = 24,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 25,
      posLast = 25,
      type = "operator"
    }, {
      data = " ",
      posFirst = 26,
      posLast = 26,
      type = "whitespace"
    }, {
      data = "pos",
      posFirst = 27,
      posLast = 29,
      type = "ident"
    }, {
      data = " ",
      posFirst = 30,
      posLast = 30,
      type = "whitespace"
    }, {
      data = "+",
      posFirst = 31,
      posLast = 31,
      type = "operator"
    }, {
      data = " ",
      posFirst = 32,
      posLast = 32,
      type = "whitespace"
    }, {
      data = "1",
      posFirst = 33,
      posLast = 33,
      type = "number"
    } }, {}, { {
      data = "                    ",
      posFirst = 1,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "return",
      posFirst = 21,
      posLast = 26,
      type = "keyword"
    } }, { {
      data = "                ",
      posFirst = 1,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "end",
      posFirst = 17,
      posLast = 19,
      type = "keyword"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "end",
      posFirst = 13,
      posLast = 15,
      type = "keyword"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "end",
      posFirst = 9,
      posLast = 11,
      type = "keyword"
    } }, { {
      data = "    ",
      posFirst = 1,
      posLast = 4,
      type = "whitespace"
    }, {
      data = "end",
      posFirst = 5,
      posLast = 7,
      type = "keyword"
    } }, {}, { {
      data = "    ",
      posFirst = 1,
      posLast = 4,
      type = "whitespace"
    }, {
      data = "while",
      posFirst = 5,
      posLast = 9,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 10,
      posLast = 10,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 11,
      posLast = 14,
      type = "value"
    }, {
      data = " ",
      posFirst = 15,
      posLast = 15,
      type = "whitespace"
    }, {
      data = "do",
      posFirst = 16,
      posLast = 17,
      type = "keyword"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "while",
      posFirst = 9,
      posLast = 13,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 15,
      posLast = 18,
      type = "value"
    }, {
      data = " ",
      posFirst = 19,
      posLast = 19,
      type = "whitespace"
    }, {
      data = "do",
      posFirst = 20,
      posLast = 21,
      type = "keyword"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "local",
      posFirst = 13,
      posLast = 17,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "char",
      posFirst = 19,
      posLast = 22,
      type = "ident"
    }, {
      data = " ",
      posFirst = 23,
      posLast = 23,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 24,
      posLast = 24,
      type = "operator"
    }, {
      data = " ",
      posFirst = 25,
      posLast = 25,
      type = "whitespace"
    }, {
      data = "look",
      posFirst = 26,
      posLast = 29,
      type = "ident"
    }, {
      data = "(",
      posFirst = 30,
      posLast = 30,
      type = "symbol"
    }, {
      data = ")",
      posFirst = 31,
      posLast = 31,
      type = "symbol"
    } }, {}, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "if",
      posFirst = 13,
      posLast = 14,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 15,
      posLast = 15,
      type = "whitespace"
    }, {
      data = "char",
      posFirst = 16,
      posLast = 19,
      type = "ident"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "==",
      posFirst = 21,
      posLast = 22,
      type = "operator"
    }, {
      data = " ",
      posFirst = 23,
      posLast = 23,
      type = "whitespace"
    }, {
      data = "'",
      posFirst = 24,
      posLast = 24,
      type = "string"
    }, {
      data = "\\n",
      posFirst = 25,
      posLast = 26,
      type = "escape"
    }, {
      data = "'",
      posFirst = 27,
      posLast = 27,
      type = "string"
    }, {
      data = " ",
      posFirst = 28,
      posLast = 28,
      type = "whitespace"
    }, {
      data = "then",
      posFirst = 29,
      posLast = 32,
      type = "keyword"
    } }, { {
      data = "                ",
      posFirst = 1,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "token",
      posFirst = 17,
      posLast = 21,
      type = "ident"
    }, {
      data = "(",
      posFirst = 22,
      posLast = 22,
      type = "symbol"
    }, {
      data = "'whitespace'",
      posFirst = 23,
      posLast = 34,
      type = "string"
    }, {
      data = ")",
      posFirst = 35,
      posLast = 35,
      type = "symbol"
    } }, { {
      data = "                ",
      posFirst = 1,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "newline",
      posFirst = 17,
      posLast = 23,
      type = "ident"
    }, {
      data = "(",
      posFirst = 24,
      posLast = 24,
      type = "symbol"
    }, {
      data = ")",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "elseif",
      posFirst = 13,
      posLast = 18,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 19,
      posLast = 19,
      type = "whitespace"
    }, {
      data = "chars",
      posFirst = 20,
      posLast = 24,
      type = "ident"
    }, {
      data = ".",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    }, {
      data = "whitespace",
      posFirst = 26,
      posLast = 35,
      type = "ident"
    }, {
      data = "[",
      posFirst = 36,
      posLast = 36,
      type = "symbol"
    }, {
      data = "char",
      posFirst = 37,
      posLast = 40,
      type = "ident"
    }, {
      data = "]",
      posFirst = 41,
      posLast = 41,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 42,
      posLast = 42,
      type = "whitespace"
    }, {
      data = "then",
      posFirst = 43,
      posLast = 46,
      type = "keyword"
    } }, { {
      data = "                ",
      posFirst = 1,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "pos",
      posFirst = 17,
      posLast = 19,
      type = "ident"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 21,
      posLast = 21,
      type = "operator"
    }, {
      data = " ",
      posFirst = 22,
      posLast = 22,
      type = "whitespace"
    }, {
      data = "pos",
      posFirst = 23,
      posLast = 25,
      type = "ident"
    }, {
      data = " ",
      posFirst = 26,
      posLast = 26,
      type = "whitespace"
    }, {
      data = "+",
      posFirst = 27,
      posLast = 27,
      type = "operator"
    }, {
      data = " ",
      posFirst = 28,
      posLast = 28,
      type = "whitespace"
    }, {
      data = "1",
      posFirst = 29,
      posLast = 29,
      type = "number"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "else",
      posFirst = 13,
      posLast = 16,
      type = "keyword"
    } }, { {
      data = "                ",
      posFirst = 1,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "break",
      posFirst = 17,
      posLast = 21,
      type = "keyword"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "end",
      posFirst = 13,
      posLast = 15,
      type = "keyword"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "end",
      posFirst = 9,
      posLast = 11,
      type = "keyword"
    } }, {}, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "token",
      posFirst = 9,
      posLast = 13,
      type = "ident"
    }, {
      data = "(",
      posFirst = 14,
      posLast = 14,
      type = "symbol"
    }, {
      data = "'whitespace'",
      posFirst = 15,
      posLast = 26,
      type = "string"
    }, {
      data = ")",
      posFirst = 27,
      posLast = 27,
      type = "symbol"
    } }, {}, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "local",
      posFirst = 9,
      posLast = 13,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 14,
      posLast = 14,
      type = "whitespace"
    }, {
      data = "char",
      posFirst = 15,
      posLast = 18,
      type = "ident"
    }, {
      data = " ",
      posFirst = 19,
      posLast = 19,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 20,
      posLast = 20,
      type = "operator"
    }, {
      data = " ",
      posFirst = 21,
      posLast = 21,
      type = "whitespace"
    }, {
      data = "get",
      posFirst = 22,
      posLast = 24,
      type = "ident"
    }, {
      data = "(",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    }, {
      data = ")",
      posFirst = 26,
      posLast = 26,
      type = "symbol"
    } }, {}, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "if",
      posFirst = 9,
      posLast = 10,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 11,
      posLast = 11,
      type = "whitespace"
    }, {
      data = "char",
      posFirst = 12,
      posLast = 15,
      type = "ident"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "==",
      posFirst = 17,
      posLast = 18,
      type = "operator"
    }, {
      data = " ",
      posFirst = 19,
      posLast = 19,
      type = "whitespace"
    }, {
      data = "''",
      posFirst = 20,
      posLast = 21,
      type = "string"
    }, {
      data = " ",
      posFirst = 22,
      posLast = 22,
      type = "whitespace"
    }, {
      data = "then",
      posFirst = 23,
      posLast = 26,
      type = "keyword"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "break",
      posFirst = 13,
      posLast = 17,
      type = "keyword"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "elseif",
      posFirst = 9,
      posLast = 14,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 15,
      posLast = 15,
      type = "whitespace"
    }, {
      data = "char",
      posFirst = 16,
      posLast = 19,
      type = "ident"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "==",
      posFirst = 21,
      posLast = 22,
      type = "operator"
    }, {
      data = " ",
      posFirst = 23,
      posLast = 23,
      type = "whitespace"
    }, {
      data = "'-'",
      posFirst = 24,
      posLast = 26,
      type = "string"
    }, {
      data = " ",
      posFirst = 27,
      posLast = 27,
      type = "whitespace"
    }, {
      data = "and",
      posFirst = 28,
      posLast = 30,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 31,
      posLast = 31,
      type = "whitespace"
    }, {
      data = "look",
      posFirst = 32,
      posLast = 35,
      type = "ident"
    }, {
      data = "(",
      posFirst = 36,
      posLast = 36,
      type = "symbol"
    }, {
      data = ")",
      posFirst = 37,
      posLast = 37,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 38,
      posLast = 38,
      type = "whitespace"
    }, {
      data = "==",
      posFirst = 39,
      posLast = 40,
      type = "operator"
    }, {
      data = " ",
      posFirst = 41,
      posLast = 41,
      type = "whitespace"
    }, {
      data = "'-'",
      posFirst = 42,
      posLast = 44,
      type = "string"
    }, {
      data = " ",
      posFirst = 45,
      posLast = 45,
      type = "whitespace"
    }, {
      data = "then",
      posFirst = 46,
      posLast = 49,
      type = "keyword"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "pos",
      posFirst = 13,
      posLast = 15,
      type = "ident"
    }, {
      data = " ",
      posFirst = 16,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 17,
      posLast = 17,
      type = "operator"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "pos",
      posFirst = 19,
      posLast = 21,
      type = "ident"
    }, {
      data = " ",
      posFirst = 22,
      posLast = 22,
      type = "whitespace"
    }, {
      data = "+",
      posFirst = 23,
      posLast = 23,
      type = "operator"
    }, {
      data = " ",
      posFirst = 24,
      posLast = 24,
      type = "whitespace"
    }, {
      data = "1",
      posFirst = 25,
      posLast = 25,
      type = "number"
    } }, {}, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "if",
      posFirst = 13,
      posLast = 14,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 15,
      posLast = 15,
      type = "whitespace"
    }, {
      data = "look",
      posFirst = 16,
      posLast = 19,
      type = "ident"
    }, {
      data = "(",
      posFirst = 20,
      posLast = 20,
      type = "symbol"
    }, {
      data = ")",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 22,
      posLast = 22,
      type = "whitespace"
    }, {
      data = "==",
      posFirst = 23,
      posLast = 24,
      type = "operator"
    }, {
      data = " ",
      posFirst = 25,
      posLast = 25,
      type = "whitespace"
    }, {
      data = "'['",
      posFirst = 26,
      posLast = 28,
      type = "string"
    }, {
      data = " ",
      posFirst = 29,
      posLast = 29,
      type = "whitespace"
    }, {
      data = "then",
      posFirst = 30,
      posLast = 33,
      type = "keyword"
    } }, { {
      data = "                ",
      posFirst = 1,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "pos",
      posFirst = 17,
      posLast = 19,
      type = "ident"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 21,
      posLast = 21,
      type = "operator"
    }, {
      data = " ",
      posFirst = 22,
      posLast = 22,
      type = "whitespace"
    }, {
      data = "pos",
      posFirst = 23,
      posLast = 25,
      type = "ident"
    }, {
      data = " ",
      posFirst = 26,
      posLast = 26,
      type = "whitespace"
    }, {
      data = "+",
      posFirst = 27,
      posLast = 27,
      type = "operator"
    }, {
      data = " ",
      posFirst = 28,
      posLast = 28,
      type = "whitespace"
    }, {
      data = "1",
      posFirst = 29,
      posLast = 29,
      type = "number"
    } }, {}, { {
      data = "                ",
      posFirst = 1,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "local",
      posFirst = 17,
      posLast = 21,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 22,
      posLast = 22,
      type = "whitespace"
    }, {
      data = "level",
      posFirst = 23,
      posLast = 27,
      type = "ident"
    }, {
      data = " ",
      posFirst = 28,
      posLast = 28,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 29,
      posLast = 29,
      type = "operator"
    }, {
      data = " ",
      posFirst = 30,
      posLast = 30,
      type = "whitespace"
    }, {
      data = "getLevel",
      posFirst = 31,
      posLast = 38,
      type = "ident"
    }, {
      data = "(",
      posFirst = 39,
      posLast = 39,
      type = "symbol"
    }, {
      data = ")",
      posFirst = 40,
      posLast = 40,
      type = "symbol"
    } }, {}, { {
      data = "                ",
      posFirst = 1,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "if",
      posFirst = 17,
      posLast = 18,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 19,
      posLast = 19,
      type = "whitespace"
    }, {
      data = "level",
      posFirst = 20,
      posLast = 24,
      type = "ident"
    }, {
      data = " ",
      posFirst = 25,
      posLast = 25,
      type = "whitespace"
    }, {
      data = "then",
      posFirst = 26,
      posLast = 29,
      type = "keyword"
    } }, { {
      data = "                    ",
      posFirst = 1,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "getData",
      posFirst = 21,
      posLast = 27,
      type = "ident"
    }, {
      data = "(",
      posFirst = 28,
      posLast = 28,
      type = "symbol"
    }, {
      data = "level",
      posFirst = 29,
      posLast = 33,
      type = "ident"
    }, {
      data = ",",
      posFirst = 34,
      posLast = 34,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 35,
      posLast = 35,
      type = "whitespace"
    }, {
      data = "'comment'",
      posFirst = 36,
      posLast = 44,
      type = "string"
    }, {
      data = ")",
      posFirst = 45,
      posLast = 45,
      type = "symbol"
    } }, { {
      data = "                ",
      posFirst = 1,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "else",
      posFirst = 17,
      posLast = 20,
      type = "keyword"
    } }, { {
      data = "                    ",
      posFirst = 1,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "while",
      posFirst = 21,
      posLast = 25,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 26,
      posLast = 26,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 27,
      posLast = 30,
      type = "value"
    }, {
      data = " ",
      posFirst = 31,
      posLast = 31,
      type = "whitespace"
    }, {
      data = "do",
      posFirst = 32,
      posLast = 33,
      type = "keyword"
    } }, { {
      data = "                        ",
      posFirst = 1,
      posLast = 24,
      type = "whitespace"
    }, {
      data = "local",
      posFirst = 25,
      posLast = 29,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 30,
      posLast = 30,
      type = "whitespace"
    }, {
      data = "char2",
      posFirst = 31,
      posLast = 35,
      type = "ident"
    }, {
      data = " ",
      posFirst = 36,
      posLast = 36,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 37,
      posLast = 37,
      type = "operator"
    }, {
      data = " ",
      posFirst = 38,
      posLast = 38,
      type = "whitespace"
    }, {
      data = "get",
      posFirst = 39,
      posLast = 41,
      type = "ident"
    }, {
      data = "(",
      posFirst = 42,
      posLast = 42,
      type = "symbol"
    }, {
      data = ")",
      posFirst = 43,
      posLast = 43,
      type = "symbol"
    } }, {}, { {
      data = "                        ",
      posFirst = 1,
      posLast = 24,
      type = "whitespace"
    }, {
      data = "if",
      posFirst = 25,
      posLast = 26,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 27,
      posLast = 27,
      type = "whitespace"
    }, {
      data = "char2",
      posFirst = 28,
      posLast = 32,
      type = "ident"
    }, {
      data = " ",
      posFirst = 33,
      posLast = 33,
      type = "whitespace"
    }, {
      data = "==",
      posFirst = 34,
      posLast = 35,
      type = "operator"
    }, {
      data = " ",
      posFirst = 36,
      posLast = 36,
      type = "whitespace"
    }, {
      data = "''",
      posFirst = 37,
      posLast = 38,
      type = "string"
    }, {
      data = " ",
      posFirst = 39,
      posLast = 39,
      type = "whitespace"
    }, {
      data = "or",
      posFirst = 40,
      posLast = 41,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 42,
      posLast = 42,
      type = "whitespace"
    }, {
      data = "char2",
      posFirst = 43,
      posLast = 47,
      type = "ident"
    }, {
      data = " ",
      posFirst = 48,
      posLast = 48,
      type = "whitespace"
    }, {
      data = "==",
      posFirst = 49,
      posLast = 50,
      type = "operator"
    }, {
      data = " ",
      posFirst = 51,
      posLast = 51,
      type = "whitespace"
    }, {
      data = "'",
      posFirst = 52,
      posLast = 52,
      type = "string"
    }, {
      data = "\\n",
      posFirst = 53,
      posLast = 54,
      type = "escape"
    }, {
      data = "'",
      posFirst = 55,
      posLast = 55,
      type = "string"
    }, {
      data = " ",
      posFirst = 56,
      posLast = 56,
      type = "whitespace"
    }, {
      data = "then",
      posFirst = 57,
      posLast = 60,
      type = "keyword"
    } }, { {
      data = "                            ",
      posFirst = 1,
      posLast = 28,
      type = "whitespace"
    }, {
      data = "pos",
      posFirst = 29,
      posLast = 31,
      type = "ident"
    }, {
      data = " ",
      posFirst = 32,
      posLast = 32,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 33,
      posLast = 33,
      type = "operator"
    }, {
      data = " ",
      posFirst = 34,
      posLast = 34,
      type = "whitespace"
    }, {
      data = "pos",
      posFirst = 35,
      posLast = 37,
      type = "ident"
    }, {
      data = " ",
      posFirst = 38,
      posLast = 38,
      type = "whitespace"
    }, {
      data = "-",
      posFirst = 39,
      posLast = 39,
      type = "operator"
    }, {
      data = " ",
      posFirst = 40,
      posLast = 40,
      type = "whitespace"
    }, {
      data = "1",
      posFirst = 41,
      posLast = 41,
      type = "number"
    } }, { {
      data = "                            ",
      posFirst = 1,
      posLast = 28,
      type = "whitespace"
    }, {
      data = "token",
      posFirst = 29,
      posLast = 33,
      type = "ident"
    }, {
      data = "(",
      posFirst = 34,
      posLast = 34,
      type = "symbol"
    }, {
      data = "'comment'",
      posFirst = 35,
      posLast = 43,
      type = "string"
    }, {
      data = ")",
      posFirst = 44,
      posLast = 44,
      type = "symbol"
    } }, {}, { {
      data = "                            ",
      posFirst = 1,
      posLast = 28,
      type = "whitespace"
    }, {
      data = "if",
      posFirst = 29,
      posLast = 30,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 31,
      posLast = 31,
      type = "whitespace"
    }, {
      data = "char2",
      posFirst = 32,
      posLast = 36,
      type = "ident"
    }, {
      data = " ",
      posFirst = 37,
      posLast = 37,
      type = "whitespace"
    }, {
      data = "==",
      posFirst = 38,
      posLast = 39,
      type = "operator"
    }, {
      data = " ",
      posFirst = 40,
      posLast = 40,
      type = "whitespace"
    }, {
      data = "'",
      posFirst = 41,
      posLast = 41,
      type = "string"
    }, {
      data = "\\n",
      posFirst = 42,
      posLast = 43,
      type = "escape"
    }, {
      data = "'",
      posFirst = 44,
      posLast = 44,
      type = "string"
    }, {
      data = " ",
      posFirst = 45,
      posLast = 45,
      type = "whitespace"
    }, {
      data = "then",
      posFirst = 46,
      posLast = 49,
      type = "keyword"
    } }, { {
      data = "                                ",
      posFirst = 1,
      posLast = 32,
      type = "whitespace"
    }, {
      data = "newline",
      posFirst = 33,
      posLast = 39,
      type = "ident"
    }, {
      data = "(",
      posFirst = 40,
      posLast = 40,
      type = "symbol"
    }, {
      data = ")",
      posFirst = 41,
      posLast = 41,
      type = "symbol"
    } }, { {
      data = "                            ",
      posFirst = 1,
      posLast = 28,
      type = "whitespace"
    }, {
      data = "end",
      posFirst = 29,
      posLast = 31,
      type = "keyword"
    } }, {}, { {
      data = "                            ",
      posFirst = 1,
      posLast = 28,
      type = "whitespace"
    }, {
      data = "break",
      posFirst = 29,
      posLast = 33,
      type = "keyword"
    } }, { {
      data = "                        ",
      posFirst = 1,
      posLast = 24,
      type = "whitespace"
    }, {
      data = "end",
      posFirst = 25,
      posLast = 27,
      type = "keyword"
    } }, { {
      data = "                    ",
      posFirst = 1,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "end",
      posFirst = 21,
      posLast = 23,
      type = "keyword"
    } }, { {
      data = "                ",
      posFirst = 1,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "end",
      posFirst = 17,
      posLast = 19,
      type = "keyword"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "else",
      posFirst = 13,
      posLast = 16,
      type = "keyword"
    } }, { {
      data = "                ",
      posFirst = 1,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "while",
      posFirst = 17,
      posLast = 21,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 22,
      posLast = 22,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 23,
      posLast = 26,
      type = "value"
    }, {
      data = " ",
      posFirst = 27,
      posLast = 27,
      type = "whitespace"
    }, {
      data = "do",
      posFirst = 28,
      posLast = 29,
      type = "keyword"
    } }, { {
      data = "                    ",
      posFirst = 1,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "local",
      posFirst = 21,
      posLast = 25,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 26,
      posLast = 26,
      type = "whitespace"
    }, {
      data = "char2",
      posFirst = 27,
      posLast = 31,
      type = "ident"
    }, {
      data = " ",
      posFirst = 32,
      posLast = 32,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 33,
      posLast = 33,
      type = "operator"
    }, {
      data = " ",
      posFirst = 34,
      posLast = 34,
      type = "whitespace"
    }, {
      data = "get",
      posFirst = 35,
      posLast = 37,
      type = "ident"
    }, {
      data = "(",
      posFirst = 38,
      posLast = 38,
      type = "symbol"
    }, {
      data = ")",
      posFirst = 39,
      posLast = 39,
      type = "symbol"
    } }, {}, { {
      data = "                    ",
      posFirst = 1,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "if",
      posFirst = 21,
      posLast = 22,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 23,
      posLast = 23,
      type = "whitespace"
    }, {
      data = "char2",
      posFirst = 24,
      posLast = 28,
      type = "ident"
    }, {
      data = " ",
      posFirst = 29,
      posLast = 29,
      type = "whitespace"
    }, {
      data = "==",
      posFirst = 30,
      posLast = 31,
      type = "operator"
    }, {
      data = " ",
      posFirst = 32,
      posLast = 32,
      type = "whitespace"
    }, {
      data = "''",
      posFirst = 33,
      posLast = 34,
      type = "string"
    }, {
      data = " ",
      posFirst = 35,
      posLast = 35,
      type = "whitespace"
    }, {
      data = "or",
      posFirst = 36,
      posLast = 37,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 38,
      posLast = 38,
      type = "whitespace"
    }, {
      data = "char2",
      posFirst = 39,
      posLast = 43,
      type = "ident"
    }, {
      data = " ",
      posFirst = 44,
      posLast = 44,
      type = "whitespace"
    }, {
      data = "==",
      posFirst = 45,
      posLast = 46,
      type = "operator"
    }, {
      data = " ",
      posFirst = 47,
      posLast = 47,
      type = "whitespace"
    }, {
      data = "'",
      posFirst = 48,
      posLast = 48,
      type = "string"
    }, {
      data = "\\n",
      posFirst = 49,
      posLast = 50,
      type = "escape"
    }, {
      data = "'",
      posFirst = 51,
      posLast = 51,
      type = "string"
    }, {
      data = " ",
      posFirst = 52,
      posLast = 52,
      type = "whitespace"
    }, {
      data = "then",
      posFirst = 53,
      posLast = 56,
      type = "keyword"
    } }, { {
      data = "                        ",
      posFirst = 1,
      posLast = 24,
      type = "whitespace"
    }, {
      data = "pos",
      posFirst = 25,
      posLast = 27,
      type = "ident"
    }, {
      data = " ",
      posFirst = 28,
      posLast = 28,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 29,
      posLast = 29,
      type = "operator"
    }, {
      data = " ",
      posFirst = 30,
      posLast = 30,
      type = "whitespace"
    }, {
      data = "pos",
      posFirst = 31,
      posLast = 33,
      type = "ident"
    }, {
      data = " ",
      posFirst = 34,
      posLast = 34,
      type = "whitespace"
    }, {
      data = "-",
      posFirst = 35,
      posLast = 35,
      type = "operator"
    }, {
      data = " ",
      posFirst = 36,
      posLast = 36,
      type = "whitespace"
    }, {
      data = "1",
      posFirst = 37,
      posLast = 37,
      type = "number"
    } }, { {
      data = "                        ",
      posFirst = 1,
      posLast = 24,
      type = "whitespace"
    }, {
      data = "token",
      posFirst = 25,
      posLast = 29,
      type = "ident"
    }, {
      data = "(",
      posFirst = 30,
      posLast = 30,
      type = "symbol"
    }, {
      data = "'comment'",
      posFirst = 31,
      posLast = 39,
      type = "string"
    }, {
      data = ")",
      posFirst = 40,
      posLast = 40,
      type = "symbol"
    } }, {}, { {
      data = "                        ",
      posFirst = 1,
      posLast = 24,
      type = "whitespace"
    }, {
      data = "if",
      posFirst = 25,
      posLast = 26,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 27,
      posLast = 27,
      type = "whitespace"
    }, {
      data = "char2",
      posFirst = 28,
      posLast = 32,
      type = "ident"
    }, {
      data = " ",
      posFirst = 33,
      posLast = 33,
      type = "whitespace"
    }, {
      data = "==",
      posFirst = 34,
      posLast = 35,
      type = "operator"
    }, {
      data = " ",
      posFirst = 36,
      posLast = 36,
      type = "whitespace"
    }, {
      data = "'",
      posFirst = 37,
      posLast = 37,
      type = "string"
    }, {
      data = "\\n",
      posFirst = 38,
      posLast = 39,
      type = "escape"
    }, {
      data = "'",
      posFirst = 40,
      posLast = 40,
      type = "string"
    }, {
      data = " ",
      posFirst = 41,
      posLast = 41,
      type = "whitespace"
    }, {
      data = "then",
      posFirst = 42,
      posLast = 45,
      type = "keyword"
    } }, { {
      data = "                            ",
      posFirst = 1,
      posLast = 28,
      type = "whitespace"
    }, {
      data = "newline",
      posFirst = 29,
      posLast = 35,
      type = "ident"
    }, {
      data = "(",
      posFirst = 36,
      posLast = 36,
      type = "symbol"
    }, {
      data = ")",
      posFirst = 37,
      posLast = 37,
      type = "symbol"
    } }, { {
      data = "                        ",
      posFirst = 1,
      posLast = 24,
      type = "whitespace"
    }, {
      data = "end",
      posFirst = 25,
      posLast = 27,
      type = "keyword"
    } }, {}, { {
      data = "                        ",
      posFirst = 1,
      posLast = 24,
      type = "whitespace"
    }, {
      data = "break",
      posFirst = 25,
      posLast = 29,
      type = "keyword"
    } }, { {
      data = "                    ",
      posFirst = 1,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "end",
      posFirst = 21,
      posLast = 23,
      type = "keyword"
    } }, { {
      data = "                ",
      posFirst = 1,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "end",
      posFirst = 17,
      posLast = 19,
      type = "keyword"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "end",
      posFirst = 13,
      posLast = 15,
      type = "keyword"
    } }, {}, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "token",
      posFirst = 13,
      posLast = 17,
      type = "ident"
    }, {
      data = "(",
      posFirst = 18,
      posLast = 18,
      type = "symbol"
    }, {
      data = "'comment'",
      posFirst = 19,
      posLast = 27,
      type = "string"
    }, {
      data = ")",
      posFirst = 28,
      posLast = 28,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "elseif",
      posFirst = 9,
      posLast = 14,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 15,
      posLast = 15,
      type = "whitespace"
    }, {
      data = "char",
      posFirst = 16,
      posLast = 19,
      type = "ident"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "==",
      posFirst = 21,
      posLast = 22,
      type = "operator"
    }, {
      data = " ",
      posFirst = 23,
      posLast = 23,
      type = "whitespace"
    }, {
      data = "'",
      posFirst = 24,
      posLast = 24,
      type = "string"
    }, {
      data = "\\'",
      posFirst = 25,
      posLast = 26,
      type = "escape"
    }, {
      data = "'",
      posFirst = 27,
      posLast = 27,
      type = "string"
    }, {
      data = " ",
      posFirst = 28,
      posLast = 28,
      type = "whitespace"
    }, {
      data = "or",
      posFirst = 29,
      posLast = 30,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 31,
      posLast = 31,
      type = "whitespace"
    }, {
      data = "char",
      posFirst = 32,
      posLast = 35,
      type = "ident"
    }, {
      data = " ",
      posFirst = 36,
      posLast = 36,
      type = "whitespace"
    }, {
      data = "==",
      posFirst = 37,
      posLast = 38,
      type = "operator"
    }, {
      data = " ",
      posFirst = 39,
      posLast = 39,
      type = "whitespace"
    }, {
      data = "'\"'",
      posFirst = 40,
      posLast = 42,
      type = "string"
    }, {
      data = " ",
      posFirst = 43,
      posLast = 43,
      type = "whitespace"
    }, {
      data = "then",
      posFirst = 44,
      posLast = 47,
      type = "keyword"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "while",
      posFirst = 13,
      posLast = 17,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "true",
      posFirst = 19,
      posLast = 22,
      type = "value"
    }, {
      data = " ",
      posFirst = 23,
      posLast = 23,
      type = "whitespace"
    }, {
      data = "do",
      posFirst = 24,
      posLast = 25,
      type = "keyword"
    } }, { {
      data = "                ",
      posFirst = 1,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "local",
      posFirst = 17,
      posLast = 21,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 22,
      posLast = 22,
      type = "whitespace"
    }, {
      data = "char2",
      posFirst = 23,
      posLast = 27,
      type = "ident"
    }, {
      data = " ",
      posFirst = 28,
      posLast = 28,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 29,
      posLast = 29,
      type = "operator"
    }, {
      data = " ",
      posFirst = 30,
      posLast = 30,
      type = "whitespace"
    }, {
      data = "get",
      posFirst = 31,
      posLast = 33,
      type = "ident"
    }, {
      data = "(",
      posFirst = 34,
      posLast = 34,
      type = "symbol"
    }, {
      data = ")",
      posFirst = 35,
      posLast = 35,
      type = "symbol"
    } }, {}, { {
      data = "                ",
      posFirst = 1,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "if",
      posFirst = 17,
      posLast = 18,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 19,
      posLast = 19,
      type = "whitespace"
    }, {
      data = "char2",
      posFirst = 20,
      posLast = 24,
      type = "ident"
    }, {
      data = " ",
      posFirst = 25,
      posLast = 25,
      type = "whitespace"
    }, {
      data = "==",
      posFirst = 26,
      posLast = 27,
      type = "operator"
    }, {
      data = " ",
      posFirst = 28,
      posLast = 28,
      type = "whitespace"
    }, {
      data = "'",
      posFirst = 29,
      posLast = 29,
      type = "string"
    }, {
      data = "\\\\",
      posFirst = 30,
      posLast = 31,
      type = "escape"
    }, {
      data = "'",
      posFirst = 32,
      posLast = 32,
      type = "string"
    }, {
      data = " ",
      posFirst = 33,
      posLast = 33,
      type = "whitespace"
    }, {
      data = "then",
      posFirst = 34,
      posLast = 37,
      type = "keyword"
    } }, { {
      data = "                    ",
      posFirst = 1,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "pos",
      posFirst = 21,
      posLast = 23,
      type = "ident"
    }, {
      data = " ",
      posFirst = 24,
      posLast = 24,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 25,
      posLast = 25,
      type = "operator"
    }, {
      data = " ",
      posFirst = 26,
      posLast = 26,
      type = "whitespace"
    }, {
      data = "pos",
      posFirst = 27,
      posLast = 29,
      type = "ident"
    }, {
      data = " ",
      posFirst = 30,
      posLast = 30,
      type = "whitespace"
    }, {
      data = "-",
      posFirst = 31,
      posLast = 31,
      type = "operator"
    }, {
      data = " ",
      posFirst = 32,
      posLast = 32,
      type = "whitespace"
    }, {
      data = "1",
      posFirst = 33,
      posLast = 33,
      type = "number"
    } }, { {
      data = "                    ",
      posFirst = 1,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "token",
      posFirst = 21,
      posLast = 25,
      type = "ident"
    }, {
      data = "(",
      posFirst = 26,
      posLast = 26,
      type = "symbol"
    }, {
      data = "'string'",
      posFirst = 27,
      posLast = 34,
      type = "string"
    }, {
      data = ")",
      posFirst = 35,
      posLast = 35,
      type = "symbol"
    } }, { {
      data = "                    ",
      posFirst = 1,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "get",
      posFirst = 21,
      posLast = 23,
      type = "ident"
    }, {
      data = "(",
      posFirst = 24,
      posLast = 24,
      type = "symbol"
    }, {
      data = ")",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    } }, {}, { {
      data = "                    ",
      posFirst = 1,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "local",
      posFirst = 21,
      posLast = 25,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 26,
      posLast = 26,
      type = "whitespace"
    }, {
      data = "char3",
      posFirst = 27,
      posLast = 31,
      type = "ident"
    }, {
      data = " ",
      posFirst = 32,
      posLast = 32,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 33,
      posLast = 33,
      type = "operator"
    }, {
      data = " ",
      posFirst = 34,
      posLast = 34,
      type = "whitespace"
    }, {
      data = "get",
      posFirst = 35,
      posLast = 37,
      type = "ident"
    }, {
      data = "(",
      posFirst = 38,
      posLast = 38,
      type = "symbol"
    }, {
      data = ")",
      posFirst = 39,
      posLast = 39,
      type = "symbol"
    } }, {}, { {
      data = "                    ",
      posFirst = 1,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "if",
      posFirst = 21,
      posLast = 22,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 23,
      posLast = 23,
      type = "whitespace"
    }, {
      data = "chars",
      posFirst = 24,
      posLast = 28,
      type = "ident"
    }, {
      data = ".",
      posFirst = 29,
      posLast = 29,
      type = "symbol"
    }, {
      data = "digits",
      posFirst = 30,
      posLast = 35,
      type = "ident"
    }, {
      data = "[",
      posFirst = 36,
      posLast = 36,
      type = "symbol"
    }, {
      data = "char3",
      posFirst = 37,
      posLast = 41,
      type = "ident"
    }, {
      data = "]",
      posFirst = 42,
      posLast = 42,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 43,
      posLast = 43,
      type = "whitespace"
    }, {
      data = "then",
      posFirst = 44,
      posLast = 47,
      type = "keyword"
    } }, { {
      data = "                        ",
      posFirst = 1,
      posLast = 24,
      type = "whitespace"
    }, {
      data = "for",
      posFirst = 25,
      posLast = 27,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 28,
      posLast = 28,
      type = "whitespace"
    }, {
      data = "i",
      posFirst = 29,
      posLast = 29,
      type = "ident"
    }, {
      data = " ",
      posFirst = 30,
      posLast = 30,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 31,
      posLast = 31,
      type = "operator"
    }, {
      data = " ",
      posFirst = 32,
      posLast = 32,
      type = "whitespace"
    }, {
      data = "1",
      posFirst = 33,
      posLast = 33,
      type = "number"
    }, {
      data = ",",
      posFirst = 34,
      posLast = 34,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 35,
      posLast = 35,
      type = "whitespace"
    }, {
      data = "2",
      posFirst = 36,
      posLast = 36,
      type = "number"
    }, {
      data = " ",
      posFirst = 37,
      posLast = 37,
      type = "whitespace"
    }, {
      data = "do",
      posFirst = 38,
      posLast = 39,
      type = "keyword"
    } }, { {
      data = "                            ",
      posFirst = 1,
      posLast = 28,
      type = "whitespace"
    }, {
      data = "if",
      posFirst = 29,
      posLast = 30,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 31,
      posLast = 31,
      type = "whitespace"
    }, {
      data = "chars",
      posFirst = 32,
      posLast = 36,
      type = "ident"
    }, {
      data = ".",
      posFirst = 37,
      posLast = 37,
      type = "symbol"
    }, {
      data = "digits",
      posFirst = 38,
      posLast = 43,
      type = "ident"
    }, {
      data = "[",
      posFirst = 44,
      posLast = 44,
      type = "symbol"
    }, {
      data = "look",
      posFirst = 45,
      posLast = 48,
      type = "ident"
    }, {
      data = "(",
      posFirst = 49,
      posLast = 49,
      type = "symbol"
    }, {
      data = ")",
      posFirst = 50,
      posLast = 50,
      type = "symbol"
    }, {
      data = "]",
      posFirst = 51,
      posLast = 51,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 52,
      posLast = 52,
      type = "whitespace"
    }, {
      data = "then",
      posFirst = 53,
      posLast = 56,
      type = "keyword"
    } }, { {
      data = "                                ",
      posFirst = 1,
      posLast = 32,
      type = "whitespace"
    }, {
      data = "pos",
      posFirst = 33,
      posLast = 35,
      type = "ident"
    }, {
      data = " ",
      posFirst = 36,
      posLast = 36,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 37,
      posLast = 37,
      type = "operator"
    }, {
      data = " ",
      posFirst = 38,
      posLast = 38,
      type = "whitespace"
    }, {
      data = "pos",
      posFirst = 39,
      posLast = 41,
      type = "ident"
    }, {
      data = " ",
      posFirst = 42,
      posLast = 42,
      type = "whitespace"
    }, {
      data = "+",
      posFirst = 43,
      posLast = 43,
      type = "operator"
    }, {
      data = " ",
      posFirst = 44,
      posLast = 44,
      type = "whitespace"
    }, {
      data = "1",
      posFirst = 45,
      posLast = 45,
      type = "number"
    } }, { {
      data = "                            ",
      posFirst = 1,
      posLast = 28,
      type = "whitespace"
    }, {
      data = "end",
      posFirst = 29,
      posLast = 31,
      type = "keyword"
    } }, { {
      data = "                        ",
      posFirst = 1,
      posLast = 24,
      type = "whitespace"
    }, {
      data = "end",
      posFirst = 25,
      posLast = 27,
      type = "keyword"
    } }, { {
      data = "                    ",
      posFirst = 1,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "elseif",
      posFirst = 21,
      posLast = 26,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 27,
      posLast = 27,
      type = "whitespace"
    }, {
      data = "char3",
      posFirst = 28,
      posLast = 32,
      type = "ident"
    }, {
      data = " ",
      posFirst = 33,
      posLast = 33,
      type = "whitespace"
    }, {
      data = "==",
      posFirst = 34,
      posLast = 35,
      type = "operator"
    }, {
      data = " ",
      posFirst = 36,
      posLast = 36,
      type = "whitespace"
    }, {
      data = "'x'",
      posFirst = 37,
      posLast = 39,
      type = "string"
    }, {
      data = " ",
      posFirst = 40,
      posLast = 40,
      type = "whitespace"
    }, {
      data = "then",
      posFirst = 41,
      posLast = 44,
      type = "keyword"
    } }, { {
      data = "                        ",
      posFirst = 1,
      posLast = 24,
      type = "whitespace"
    }, {
      data = "if",
      posFirst = 25,
      posLast = 26,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 27,
      posLast = 27,
      type = "whitespace"
    }, {
      data = "chars",
      posFirst = 28,
      posLast = 32,
      type = "ident"
    }, {
      data = ".",
      posFirst = 33,
      posLast = 33,
      type = "symbol"
    }, {
      data = "digits",
      posFirst = 34,
      posLast = 39,
      type = "ident"
    }, {
      data = ".",
      posFirst = 40,
      posLast = 40,
      type = "symbol"
    }, {
      data = "hex",
      posFirst = 41,
      posLast = 43,
      type = "ident"
    }, {
      data = "[",
      posFirst = 44,
      posLast = 44,
      type = "symbol"
    }, {
      data = "look",
      posFirst = 45,
      posLast = 48,
      type = "ident"
    }, {
      data = "(",
      posFirst = 49,
      posLast = 49,
      type = "symbol"
    }, {
      data = ")",
      posFirst = 50,
      posLast = 50,
      type = "symbol"
    }, {
      data = "]",
      posFirst = 51,
      posLast = 51,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 52,
      posLast = 52,
      type = "whitespace"
    }, {
      data = "and",
      posFirst = 53,
      posLast = 55,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 56,
      posLast = 56,
      type = "whitespace"
    }, {
      data = "chars",
      posFirst = 57,
      posLast = 61,
      type = "ident"
    }, {
      data = ".",
      posFirst = 62,
      posLast = 62,
      type = "symbol"
    }, {
      data = "digits",
      posFirst = 63,
      posLast = 68,
      type = "ident"
    }, {
      data = ".",
      posFirst = 69,
      posLast = 69,
      type = "symbol"
    }, {
      data = "hex",
      posFirst = 70,
      posLast = 72,
      type = "ident"
    }, {
      data = "[",
      posFirst = 73,
      posLast = 73,
      type = "symbol"
    }, {
      data = "look",
      posFirst = 74,
      posLast = 77,
      type = "ident"
    }, {
      data = "(",
      posFirst = 78,
      posLast = 78,
      type = "symbol"
    }, {
      data = "1",
      posFirst = 79,
      posLast = 79,
      type = "number"
    }, {
      data = ")",
      posFirst = 80,
      posLast = 80,
      type = "symbol"
    }, {
      data = "]",
      posFirst = 81,
      posLast = 81,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 82,
      posLast = 82,
      type = "whitespace"
    }, {
      data = "then",
      posFirst = 83,
      posLast = 86,
      type = "keyword"
    } }, { {
      data = "                            ",
      posFirst = 1,
      posLast = 28,
      type = "whitespace"
    }, {
      data = "pos",
      posFirst = 29,
      posLast = 31,
      type = "ident"
    }, {
      data = " ",
      posFirst = 32,
      posLast = 32,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 33,
      posLast = 33,
      type = "operator"
    }, {
      data = " ",
      posFirst = 34,
      posLast = 34,
      type = "whitespace"
    }, {
      data = "pos",
      posFirst = 35,
      posLast = 37,
      type = "ident"
    }, {
      data = " ",
      posFirst = 38,
      posLast = 38,
      type = "whitespace"
    }, {
      data = "+",
      posFirst = 39,
      posLast = 39,
      type = "operator"
    }, {
      data = " ",
      posFirst = 40,
      posLast = 40,
      type = "whitespace"
    }, {
      data = "2",
      posFirst = 41,
      posLast = 41,
      type = "number"
    } }, { {
      data = "                        ",
      posFirst = 1,
      posLast = 24,
      type = "whitespace"
    }, {
      data = "else",
      posFirst = 25,
      posLast = 28,
      type = "keyword"
    } }, { {
      data = "                            ",
      posFirst = 1,
      posLast = 28,
      type = "whitespace"
    }, {
      data = "token",
      posFirst = 29,
      posLast = 33,
      type = "ident"
    }, {
      data = "(",
      posFirst = 34,
      posLast = 34,
      type = "symbol"
    }, {
      data = "'unidentified'",
      posFirst = 35,
      posLast = 48,
      type = "string"
    }, {
      data = ")",
      posFirst = 49,
      posLast = 49,
      type = "symbol"
    } }, { {
      data = "                        ",
      posFirst = 1,
      posLast = 24,
      type = "whitespace"
    }, {
      data = "end",
      posFirst = 25,
      posLast = 27,
      type = "keyword"
    } }, { {
      data = "                    ",
      posFirst = 1,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "elseif",
      posFirst = 21,
      posLast = 26,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 27,
      posLast = 27,
      type = "whitespace"
    }, {
      data = "char3",
      posFirst = 28,
      posLast = 32,
      type = "ident"
    }, {
      data = " ",
      posFirst = 33,
      posLast = 33,
      type = "whitespace"
    }, {
      data = "==",
      posFirst = 34,
      posLast = 35,
      type = "operator"
    }, {
      data = " ",
      posFirst = 36,
      posLast = 36,
      type = "whitespace"
    }, {
      data = "'",
      posFirst = 37,
      posLast = 37,
      type = "string"
    }, {
      data = "\\n",
      posFirst = 38,
      posLast = 39,
      type = "escape"
    }, {
      data = "'",
      posFirst = 40,
      posLast = 40,
      type = "string"
    }, {
      data = " ",
      posFirst = 41,
      posLast = 41,
      type = "whitespace"
    }, {
      data = "then",
      posFirst = 42,
      posLast = 45,
      type = "keyword"
    } }, { {
      data = "                        ",
      posFirst = 1,
      posLast = 24,
      type = "whitespace"
    }, {
      data = "pos",
      posFirst = 25,
      posLast = 27,
      type = "ident"
    }, {
      data = " ",
      posFirst = 28,
      posLast = 28,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 29,
      posLast = 29,
      type = "operator"
    }, {
      data = " ",
      posFirst = 30,
      posLast = 30,
      type = "whitespace"
    }, {
      data = "pos",
      posFirst = 31,
      posLast = 33,
      type = "ident"
    }, {
      data = " ",
      posFirst = 34,
      posLast = 34,
      type = "whitespace"
    }, {
      data = "-",
      posFirst = 35,
      posLast = 35,
      type = "operator"
    }, {
      data = " ",
      posFirst = 36,
      posLast = 36,
      type = "whitespace"
    }, {
      data = "1",
      posFirst = 37,
      posLast = 37,
      type = "number"
    } }, { {
      data = "                        ",
      posFirst = 1,
      posLast = 24,
      type = "whitespace"
    }, {
      data = "token",
      posFirst = 25,
      posLast = 29,
      type = "ident"
    }, {
      data = "(",
      posFirst = 30,
      posLast = 30,
      type = "symbol"
    }, {
      data = "'escape'",
      posFirst = 31,
      posLast = 38,
      type = "string"
    }, {
      data = ")",
      posFirst = 39,
      posLast = 39,
      type = "symbol"
    } }, { {
      data = "                        ",
      posFirst = 1,
      posLast = 24,
      type = "whitespace"
    }, {
      data = "newline",
      posFirst = 25,
      posLast = 31,
      type = "ident"
    }, {
      data = "(",
      posFirst = 32,
      posLast = 32,
      type = "symbol"
    }, {
      data = ")",
      posFirst = 33,
      posLast = 33,
      type = "symbol"
    } }, { {
      data = "                    ",
      posFirst = 1,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "elseif",
      posFirst = 21,
      posLast = 26,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 27,
      posLast = 27,
      type = "whitespace"
    }, {
      data = "not",
      posFirst = 28,
      posLast = 30,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 31,
      posLast = 31,
      type = "whitespace"
    }, {
      data = "chars",
      posFirst = 32,
      posLast = 36,
      type = "ident"
    }, {
      data = ".",
      posFirst = 37,
      posLast = 37,
      type = "symbol"
    }, {
      data = "validEscapes",
      posFirst = 38,
      posLast = 49,
      type = "ident"
    }, {
      data = "[",
      posFirst = 50,
      posLast = 50,
      type = "symbol"
    }, {
      data = "char3",
      posFirst = 51,
      posLast = 55,
      type = "ident"
    }, {
      data = "]",
      posFirst = 56,
      posLast = 56,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 57,
      posLast = 57,
      type = "whitespace"
    }, {
      data = "then",
      posFirst = 58,
      posLast = 61,
      type = "keyword"
    } }, { {
      data = "                        ",
      posFirst = 1,
      posLast = 24,
      type = "whitespace"
    }, {
      data = "token",
      posFirst = 25,
      posLast = 29,
      type = "ident"
    }, {
      data = "(",
      posFirst = 30,
      posLast = 30,
      type = "symbol"
    }, {
      data = "'unidentified'",
      posFirst = 31,
      posLast = 44,
      type = "string"
    }, {
      data = ")",
      posFirst = 45,
      posLast = 45,
      type = "symbol"
    } }, { {
      data = "                    ",
      posFirst = 1,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "end",
      posFirst = 21,
      posLast = 23,
      type = "keyword"
    } }, {}, { {
      data = "                    ",
      posFirst = 1,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "token",
      posFirst = 21,
      posLast = 25,
      type = "ident"
    }, {
      data = "(",
      posFirst = 26,
      posLast = 26,
      type = "symbol"
    }, {
      data = "'escape'",
      posFirst = 27,
      posLast = 34,
      type = "string"
    }, {
      data = ")",
      posFirst = 35,
      posLast = 35,
      type = "symbol"
    } }, { {
      data = "                ",
      posFirst = 1,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "elseif",
      posFirst = 17,
      posLast = 22,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 23,
      posLast = 23,
      type = "whitespace"
    }, {
      data = "char2",
      posFirst = 24,
      posLast = 28,
      type = "ident"
    }, {
      data = " ",
      posFirst = 29,
      posLast = 29,
      type = "whitespace"
    }, {
      data = "==",
      posFirst = 30,
      posLast = 31,
      type = "operator"
    }, {
      data = " ",
      posFirst = 32,
      posLast = 32,
      type = "whitespace"
    }, {
      data = "'",
      posFirst = 33,
      posLast = 33,
      type = "string"
    }, {
      data = "\\n",
      posFirst = 34,
      posLast = 35,
      type = "escape"
    }, {
      data = "'",
      posFirst = 36,
      posLast = 36,
      type = "string"
    }, {
      data = " ",
      posFirst = 37,
      posLast = 37,
      type = "whitespace"
    }, {
      data = "then",
      posFirst = 38,
      posLast = 41,
      type = "keyword"
    } }, { {
      data = "                    ",
      posFirst = 1,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "pos",
      posFirst = 21,
      posLast = 23,
      type = "ident"
    }, {
      data = " ",
      posFirst = 24,
      posLast = 24,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 25,
      posLast = 25,
      type = "operator"
    }, {
      data = " ",
      posFirst = 26,
      posLast = 26,
      type = "whitespace"
    }, {
      data = "pos",
      posFirst = 27,
      posLast = 29,
      type = "ident"
    }, {
      data = " ",
      posFirst = 30,
      posLast = 30,
      type = "whitespace"
    }, {
      data = "-",
      posFirst = 31,
      posLast = 31,
      type = "operator"
    }, {
      data = " ",
      posFirst = 32,
      posLast = 32,
      type = "whitespace"
    }, {
      data = "1",
      posFirst = 33,
      posLast = 33,
      type = "number"
    } }, { {
      data = "                    ",
      posFirst = 1,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "token",
      posFirst = 21,
      posLast = 25,
      type = "ident"
    }, {
      data = "(",
      posFirst = 26,
      posLast = 26,
      type = "symbol"
    }, {
      data = "'string'",
      posFirst = 27,
      posLast = 34,
      type = "string"
    }, {
      data = ")",
      posFirst = 35,
      posLast = 35,
      type = "symbol"
    } }, { {
      data = "                    ",
      posFirst = 1,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "newline",
      posFirst = 21,
      posLast = 27,
      type = "ident"
    }, {
      data = "(",
      posFirst = 28,
      posLast = 28,
      type = "symbol"
    }, {
      data = ")",
      posFirst = 29,
      posLast = 29,
      type = "symbol"
    } }, {}, { {
      data = "                    ",
      posFirst = 1,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "break",
      posFirst = 21,
      posLast = 25,
      type = "keyword"
    } }, { {
      data = "                ",
      posFirst = 1,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "elseif",
      posFirst = 17,
      posLast = 22,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 23,
      posLast = 23,
      type = "whitespace"
    }, {
      data = "char2",
      posFirst = 24,
      posLast = 28,
      type = "ident"
    }, {
      data = " ",
      posFirst = 29,
      posLast = 29,
      type = "whitespace"
    }, {
      data = "==",
      posFirst = 30,
      posLast = 31,
      type = "operator"
    }, {
      data = " ",
      posFirst = 32,
      posLast = 32,
      type = "whitespace"
    }, {
      data = "char",
      posFirst = 33,
      posLast = 36,
      type = "ident"
    }, {
      data = " ",
      posFirst = 37,
      posLast = 37,
      type = "whitespace"
    }, {
      data = "or",
      posFirst = 38,
      posLast = 39,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 40,
      posLast = 40,
      type = "whitespace"
    }, {
      data = "char2",
      posFirst = 41,
      posLast = 45,
      type = "ident"
    }, {
      data = " ",
      posFirst = 46,
      posLast = 46,
      type = "whitespace"
    }, {
      data = "==",
      posFirst = 47,
      posLast = 48,
      type = "operator"
    }, {
      data = " ",
      posFirst = 49,
      posLast = 49,
      type = "whitespace"
    }, {
      data = "''",
      posFirst = 50,
      posLast = 51,
      type = "string"
    }, {
      data = " ",
      posFirst = 52,
      posLast = 52,
      type = "whitespace"
    }, {
      data = "then",
      posFirst = 53,
      posLast = 56,
      type = "keyword"
    } }, { {
      data = "                    ",
      posFirst = 1,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "break",
      posFirst = 21,
      posLast = 25,
      type = "keyword"
    } }, { {
      data = "                ",
      posFirst = 1,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "end",
      posFirst = 17,
      posLast = 19,
      type = "keyword"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "end",
      posFirst = 13,
      posLast = 15,
      type = "keyword"
    } }, {}, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "token",
      posFirst = 13,
      posLast = 17,
      type = "ident"
    }, {
      data = "(",
      posFirst = 18,
      posLast = 18,
      type = "symbol"
    }, {
      data = "'string'",
      posFirst = 19,
      posLast = 26,
      type = "string"
    }, {
      data = ")",
      posFirst = 27,
      posLast = 27,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "elseif",
      posFirst = 9,
      posLast = 14,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 15,
      posLast = 15,
      type = "whitespace"
    }, {
      data = "chars",
      posFirst = 16,
      posLast = 20,
      type = "ident"
    }, {
      data = ".",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    }, {
      data = "ident",
      posFirst = 22,
      posLast = 26,
      type = "ident"
    }, {
      data = ".",
      posFirst = 27,
      posLast = 27,
      type = "symbol"
    }, {
      data = "start",
      posFirst = 28,
      posLast = 32,
      type = "ident"
    }, {
      data = "[",
      posFirst = 33,
      posLast = 33,
      type = "symbol"
    }, {
      data = "char",
      posFirst = 34,
      posLast = 37,
      type = "ident"
    }, {
      data = "]",
      posFirst = 38,
      posLast = 38,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 39,
      posLast = 39,
      type = "whitespace"
    }, {
      data = "then",
      posFirst = 40,
      posLast = 43,
      type = "keyword"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "while",
      posFirst = 13,
      posLast = 17,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "chars",
      posFirst = 19,
      posLast = 23,
      type = "ident"
    }, {
      data = ".",
      posFirst = 24,
      posLast = 24,
      type = "symbol"
    }, {
      data = "ident",
      posFirst = 25,
      posLast = 29,
      type = "ident"
    }, {
      data = "[",
      posFirst = 30,
      posLast = 30,
      type = "symbol"
    }, {
      data = "look",
      posFirst = 31,
      posLast = 34,
      type = "ident"
    }, {
      data = "(",
      posFirst = 35,
      posLast = 35,
      type = "symbol"
    }, {
      data = ")",
      posFirst = 36,
      posLast = 36,
      type = "symbol"
    }, {
      data = "]",
      posFirst = 37,
      posLast = 37,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 38,
      posLast = 38,
      type = "whitespace"
    }, {
      data = "do",
      posFirst = 39,
      posLast = 40,
      type = "keyword"
    } }, { {
      data = "                ",
      posFirst = 1,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "pos",
      posFirst = 17,
      posLast = 19,
      type = "ident"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 21,
      posLast = 21,
      type = "operator"
    }, {
      data = " ",
      posFirst = 22,
      posLast = 22,
      type = "whitespace"
    }, {
      data = "pos",
      posFirst = 23,
      posLast = 25,
      type = "ident"
    }, {
      data = " ",
      posFirst = 26,
      posLast = 26,
      type = "whitespace"
    }, {
      data = "+",
      posFirst = 27,
      posLast = 27,
      type = "operator"
    }, {
      data = " ",
      posFirst = 28,
      posLast = 28,
      type = "whitespace"
    }, {
      data = "1",
      posFirst = 29,
      posLast = 29,
      type = "number"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "end",
      posFirst = 13,
      posLast = 15,
      type = "keyword"
    } }, {}, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "local",
      posFirst = 13,
      posLast = 17,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "word",
      posFirst = 19,
      posLast = 22,
      type = "ident"
    }, {
      data = " ",
      posFirst = 23,
      posLast = 23,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 24,
      posLast = 24,
      type = "operator"
    }, {
      data = " ",
      posFirst = 25,
      posLast = 25,
      type = "whitespace"
    }, {
      data = "getToken",
      posFirst = 26,
      posLast = 33,
      type = "ident"
    }, {
      data = "(",
      posFirst = 34,
      posLast = 34,
      type = "symbol"
    }, {
      data = ")",
      posFirst = 35,
      posLast = 35,
      type = "symbol"
    } }, {}, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "if",
      posFirst = 13,
      posLast = 14,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 15,
      posLast = 15,
      type = "whitespace"
    }, {
      data = "keywords",
      posFirst = 16,
      posLast = 23,
      type = "ident"
    }, {
      data = ".",
      posFirst = 24,
      posLast = 24,
      type = "symbol"
    }, {
      data = "structure",
      posFirst = 25,
      posLast = 33,
      type = "ident"
    }, {
      data = "[",
      posFirst = 34,
      posLast = 34,
      type = "symbol"
    }, {
      data = "word",
      posFirst = 35,
      posLast = 38,
      type = "ident"
    }, {
      data = "]",
      posFirst = 39,
      posLast = 39,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 40,
      posLast = 40,
      type = "whitespace"
    }, {
      data = "then",
      posFirst = 41,
      posLast = 44,
      type = "keyword"
    } }, { {
      data = "                ",
      posFirst = 1,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "token",
      posFirst = 17,
      posLast = 21,
      type = "ident"
    }, {
      data = "(",
      posFirst = 22,
      posLast = 22,
      type = "symbol"
    }, {
      data = "'keyword'",
      posFirst = 23,
      posLast = 31,
      type = "string"
    }, {
      data = ")",
      posFirst = 32,
      posLast = 32,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "elseif",
      posFirst = 13,
      posLast = 18,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 19,
      posLast = 19,
      type = "whitespace"
    }, {
      data = "keywords",
      posFirst = 20,
      posLast = 27,
      type = "ident"
    }, {
      data = ".",
      posFirst = 28,
      posLast = 28,
      type = "symbol"
    }, {
      data = "values",
      posFirst = 29,
      posLast = 34,
      type = "ident"
    }, {
      data = "[",
      posFirst = 35,
      posLast = 35,
      type = "symbol"
    }, {
      data = "word",
      posFirst = 36,
      posLast = 39,
      type = "ident"
    }, {
      data = "]",
      posFirst = 40,
      posLast = 40,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 41,
      posLast = 41,
      type = "whitespace"
    }, {
      data = "then",
      posFirst = 42,
      posLast = 45,
      type = "keyword"
    } }, { {
      data = "                ",
      posFirst = 1,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "token",
      posFirst = 17,
      posLast = 21,
      type = "ident"
    }, {
      data = "(",
      posFirst = 22,
      posLast = 22,
      type = "symbol"
    }, {
      data = "'value'",
      posFirst = 23,
      posLast = 29,
      type = "string"
    }, {
      data = ")",
      posFirst = 30,
      posLast = 30,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "else",
      posFirst = 13,
      posLast = 16,
      type = "keyword"
    } }, { {
      data = "                ",
      posFirst = 1,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "token",
      posFirst = 17,
      posLast = 21,
      type = "ident"
    }, {
      data = "(",
      posFirst = 22,
      posLast = 22,
      type = "symbol"
    }, {
      data = "'ident'",
      posFirst = 23,
      posLast = 29,
      type = "string"
    }, {
      data = ")",
      posFirst = 30,
      posLast = 30,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "end",
      posFirst = 13,
      posLast = 15,
      type = "keyword"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "elseif",
      posFirst = 9,
      posLast = 14,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 15,
      posLast = 15,
      type = "whitespace"
    }, {
      data = "chars",
      posFirst = 16,
      posLast = 20,
      type = "ident"
    }, {
      data = ".",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    }, {
      data = "digits",
      posFirst = 22,
      posLast = 27,
      type = "ident"
    }, {
      data = "[",
      posFirst = 28,
      posLast = 28,
      type = "symbol"
    }, {
      data = "char",
      posFirst = 29,
      posLast = 32,
      type = "ident"
    }, {
      data = "]",
      posFirst = 33,
      posLast = 33,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 34,
      posLast = 34,
      type = "whitespace"
    }, {
      data = "or",
      posFirst = 35,
      posLast = 36,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 37,
      posLast = 37,
      type = "whitespace"
    }, {
      data = "(",
      posFirst = 38,
      posLast = 38,
      type = "symbol"
    }, {
      data = "char",
      posFirst = 39,
      posLast = 42,
      type = "ident"
    }, {
      data = " ",
      posFirst = 43,
      posLast = 43,
      type = "whitespace"
    }, {
      data = "==",
      posFirst = 44,
      posLast = 45,
      type = "operator"
    }, {
      data = " ",
      posFirst = 46,
      posLast = 46,
      type = "whitespace"
    }, {
      data = "'.'",
      posFirst = 47,
      posLast = 49,
      type = "string"
    }, {
      data = " ",
      posFirst = 50,
      posLast = 50,
      type = "whitespace"
    }, {
      data = "and",
      posFirst = 51,
      posLast = 53,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 54,
      posLast = 54,
      type = "whitespace"
    }, {
      data = "chars",
      posFirst = 55,
      posLast = 59,
      type = "ident"
    }, {
      data = ".",
      posFirst = 60,
      posLast = 60,
      type = "symbol"
    }, {
      data = "digits",
      posFirst = 61,
      posLast = 66,
      type = "ident"
    }, {
      data = "[",
      posFirst = 67,
      posLast = 67,
      type = "symbol"
    }, {
      data = "look",
      posFirst = 68,
      posLast = 71,
      type = "ident"
    }, {
      data = "(",
      posFirst = 72,
      posLast = 72,
      type = "symbol"
    }, {
      data = ")",
      posFirst = 73,
      posLast = 73,
      type = "symbol"
    }, {
      data = "]",
      posFirst = 74,
      posLast = 74,
      type = "symbol"
    }, {
      data = ")",
      posFirst = 75,
      posLast = 75,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 76,
      posLast = 76,
      type = "whitespace"
    }, {
      data = "then",
      posFirst = 77,
      posLast = 80,
      type = "keyword"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "if",
      posFirst = 13,
      posLast = 14,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 15,
      posLast = 15,
      type = "whitespace"
    }, {
      data = "char",
      posFirst = 16,
      posLast = 19,
      type = "ident"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "==",
      posFirst = 21,
      posLast = 22,
      type = "operator"
    }, {
      data = " ",
      posFirst = 23,
      posLast = 23,
      type = "whitespace"
    }, {
      data = "'0'",
      posFirst = 24,
      posLast = 26,
      type = "string"
    }, {
      data = " ",
      posFirst = 27,
      posLast = 27,
      type = "whitespace"
    }, {
      data = "and",
      posFirst = 28,
      posLast = 30,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 31,
      posLast = 31,
      type = "whitespace"
    }, {
      data = "look",
      posFirst = 32,
      posLast = 35,
      type = "ident"
    }, {
      data = "(",
      posFirst = 36,
      posLast = 36,
      type = "symbol"
    }, {
      data = ")",
      posFirst = 37,
      posLast = 37,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 38,
      posLast = 38,
      type = "whitespace"
    }, {
      data = "==",
      posFirst = 39,
      posLast = 40,
      type = "operator"
    }, {
      data = " ",
      posFirst = 41,
      posLast = 41,
      type = "whitespace"
    }, {
      data = "'x'",
      posFirst = 42,
      posLast = 44,
      type = "string"
    }, {
      data = " ",
      posFirst = 45,
      posLast = 45,
      type = "whitespace"
    }, {
      data = "then",
      posFirst = 46,
      posLast = 49,
      type = "keyword"
    } }, { {
      data = "                ",
      posFirst = 1,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "pos",
      posFirst = 17,
      posLast = 19,
      type = "ident"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 21,
      posLast = 21,
      type = "operator"
    }, {
      data = " ",
      posFirst = 22,
      posLast = 22,
      type = "whitespace"
    }, {
      data = "pos",
      posFirst = 23,
      posLast = 25,
      type = "ident"
    }, {
      data = " ",
      posFirst = 26,
      posLast = 26,
      type = "whitespace"
    }, {
      data = "+",
      posFirst = 27,
      posLast = 27,
      type = "operator"
    }, {
      data = " ",
      posFirst = 28,
      posLast = 28,
      type = "whitespace"
    }, {
      data = "1",
      posFirst = 29,
      posLast = 29,
      type = "number"
    } }, {}, { {
      data = "                ",
      posFirst = 1,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "while",
      posFirst = 17,
      posLast = 21,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 22,
      posLast = 22,
      type = "whitespace"
    }, {
      data = "chars",
      posFirst = 23,
      posLast = 27,
      type = "ident"
    }, {
      data = ".",
      posFirst = 28,
      posLast = 28,
      type = "symbol"
    }, {
      data = "digits",
      posFirst = 29,
      posLast = 34,
      type = "ident"
    }, {
      data = ".",
      posFirst = 35,
      posLast = 35,
      type = "symbol"
    }, {
      data = "hex",
      posFirst = 36,
      posLast = 38,
      type = "ident"
    }, {
      data = "[",
      posFirst = 39,
      posLast = 39,
      type = "symbol"
    }, {
      data = "look",
      posFirst = 40,
      posLast = 43,
      type = "ident"
    }, {
      data = "(",
      posFirst = 44,
      posLast = 44,
      type = "symbol"
    }, {
      data = ")",
      posFirst = 45,
      posLast = 45,
      type = "symbol"
    }, {
      data = "]",
      posFirst = 46,
      posLast = 46,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 47,
      posLast = 47,
      type = "whitespace"
    }, {
      data = "do",
      posFirst = 48,
      posLast = 49,
      type = "keyword"
    } }, { {
      data = "                    ",
      posFirst = 1,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "pos",
      posFirst = 21,
      posLast = 23,
      type = "ident"
    }, {
      data = " ",
      posFirst = 24,
      posLast = 24,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 25,
      posLast = 25,
      type = "operator"
    }, {
      data = " ",
      posFirst = 26,
      posLast = 26,
      type = "whitespace"
    }, {
      data = "pos",
      posFirst = 27,
      posLast = 29,
      type = "ident"
    }, {
      data = " ",
      posFirst = 30,
      posLast = 30,
      type = "whitespace"
    }, {
      data = "+",
      posFirst = 31,
      posLast = 31,
      type = "operator"
    }, {
      data = " ",
      posFirst = 32,
      posLast = 32,
      type = "whitespace"
    }, {
      data = "1",
      posFirst = 33,
      posLast = 33,
      type = "number"
    } }, { {
      data = "                ",
      posFirst = 1,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "end",
      posFirst = 17,
      posLast = 19,
      type = "keyword"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "else",
      posFirst = 13,
      posLast = 16,
      type = "keyword"
    } }, { {
      data = "                ",
      posFirst = 1,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "while",
      posFirst = 17,
      posLast = 21,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 22,
      posLast = 22,
      type = "whitespace"
    }, {
      data = "chars",
      posFirst = 23,
      posLast = 27,
      type = "ident"
    }, {
      data = ".",
      posFirst = 28,
      posLast = 28,
      type = "symbol"
    }, {
      data = "digits",
      posFirst = 29,
      posLast = 34,
      type = "ident"
    }, {
      data = "[",
      posFirst = 35,
      posLast = 35,
      type = "symbol"
    }, {
      data = "look",
      posFirst = 36,
      posLast = 39,
      type = "ident"
    }, {
      data = "(",
      posFirst = 40,
      posLast = 40,
      type = "symbol"
    }, {
      data = ")",
      posFirst = 41,
      posLast = 41,
      type = "symbol"
    }, {
      data = "]",
      posFirst = 42,
      posLast = 42,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 43,
      posLast = 43,
      type = "whitespace"
    }, {
      data = "do",
      posFirst = 44,
      posLast = 45,
      type = "keyword"
    } }, { {
      data = "                    ",
      posFirst = 1,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "pos",
      posFirst = 21,
      posLast = 23,
      type = "ident"
    }, {
      data = " ",
      posFirst = 24,
      posLast = 24,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 25,
      posLast = 25,
      type = "operator"
    }, {
      data = " ",
      posFirst = 26,
      posLast = 26,
      type = "whitespace"
    }, {
      data = "pos",
      posFirst = 27,
      posLast = 29,
      type = "ident"
    }, {
      data = " ",
      posFirst = 30,
      posLast = 30,
      type = "whitespace"
    }, {
      data = "+",
      posFirst = 31,
      posLast = 31,
      type = "operator"
    }, {
      data = " ",
      posFirst = 32,
      posLast = 32,
      type = "whitespace"
    }, {
      data = "1",
      posFirst = 33,
      posLast = 33,
      type = "number"
    } }, { {
      data = "                ",
      posFirst = 1,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "end",
      posFirst = 17,
      posLast = 19,
      type = "keyword"
    } }, {}, { {
      data = "                ",
      posFirst = 1,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "if",
      posFirst = 17,
      posLast = 18,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 19,
      posLast = 19,
      type = "whitespace"
    }, {
      data = "look",
      posFirst = 20,
      posLast = 23,
      type = "ident"
    }, {
      data = "(",
      posFirst = 24,
      posLast = 24,
      type = "symbol"
    }, {
      data = ")",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 26,
      posLast = 26,
      type = "whitespace"
    }, {
      data = "==",
      posFirst = 27,
      posLast = 28,
      type = "operator"
    }, {
      data = " ",
      posFirst = 29,
      posLast = 29,
      type = "whitespace"
    }, {
      data = "'.'",
      posFirst = 30,
      posLast = 32,
      type = "string"
    }, {
      data = " ",
      posFirst = 33,
      posLast = 33,
      type = "whitespace"
    }, {
      data = "then",
      posFirst = 34,
      posLast = 37,
      type = "keyword"
    } }, { {
      data = "                    ",
      posFirst = 1,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "pos",
      posFirst = 21,
      posLast = 23,
      type = "ident"
    }, {
      data = " ",
      posFirst = 24,
      posLast = 24,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 25,
      posLast = 25,
      type = "operator"
    }, {
      data = " ",
      posFirst = 26,
      posLast = 26,
      type = "whitespace"
    }, {
      data = "pos",
      posFirst = 27,
      posLast = 29,
      type = "ident"
    }, {
      data = " ",
      posFirst = 30,
      posLast = 30,
      type = "whitespace"
    }, {
      data = "+",
      posFirst = 31,
      posLast = 31,
      type = "operator"
    }, {
      data = " ",
      posFirst = 32,
      posLast = 32,
      type = "whitespace"
    }, {
      data = "1",
      posFirst = 33,
      posLast = 33,
      type = "number"
    } }, {}, { {
      data = "                    ",
      posFirst = 1,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "while",
      posFirst = 21,
      posLast = 25,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 26,
      posLast = 26,
      type = "whitespace"
    }, {
      data = "chars",
      posFirst = 27,
      posLast = 31,
      type = "ident"
    }, {
      data = ".",
      posFirst = 32,
      posLast = 32,
      type = "symbol"
    }, {
      data = "digits",
      posFirst = 33,
      posLast = 38,
      type = "ident"
    }, {
      data = "[",
      posFirst = 39,
      posLast = 39,
      type = "symbol"
    }, {
      data = "look",
      posFirst = 40,
      posLast = 43,
      type = "ident"
    }, {
      data = "(",
      posFirst = 44,
      posLast = 44,
      type = "symbol"
    }, {
      data = ")",
      posFirst = 45,
      posLast = 45,
      type = "symbol"
    }, {
      data = "]",
      posFirst = 46,
      posLast = 46,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 47,
      posLast = 47,
      type = "whitespace"
    }, {
      data = "do",
      posFirst = 48,
      posLast = 49,
      type = "keyword"
    } }, { {
      data = "                        ",
      posFirst = 1,
      posLast = 24,
      type = "whitespace"
    }, {
      data = "pos",
      posFirst = 25,
      posLast = 27,
      type = "ident"
    }, {
      data = " ",
      posFirst = 28,
      posLast = 28,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 29,
      posLast = 29,
      type = "operator"
    }, {
      data = " ",
      posFirst = 30,
      posLast = 30,
      type = "whitespace"
    }, {
      data = "pos",
      posFirst = 31,
      posLast = 33,
      type = "ident"
    }, {
      data = " ",
      posFirst = 34,
      posLast = 34,
      type = "whitespace"
    }, {
      data = "+",
      posFirst = 35,
      posLast = 35,
      type = "operator"
    }, {
      data = " ",
      posFirst = 36,
      posLast = 36,
      type = "whitespace"
    }, {
      data = "1",
      posFirst = 37,
      posLast = 37,
      type = "number"
    } }, { {
      data = "                    ",
      posFirst = 1,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "end",
      posFirst = 21,
      posLast = 23,
      type = "keyword"
    } }, { {
      data = "                ",
      posFirst = 1,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "end",
      posFirst = 17,
      posLast = 19,
      type = "keyword"
    } }, {}, { {
      data = "                ",
      posFirst = 1,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "if",
      posFirst = 17,
      posLast = 18,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 19,
      posLast = 19,
      type = "whitespace"
    }, {
      data = "look",
      posFirst = 20,
      posLast = 23,
      type = "ident"
    }, {
      data = "(",
      posFirst = 24,
      posLast = 24,
      type = "symbol"
    }, {
      data = ")",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    }, {
      data = ":",
      posFirst = 26,
      posLast = 26,
      type = "symbol"
    }, {
      data = "lower",
      posFirst = 27,
      posLast = 31,
      type = "ident"
    }, {
      data = "(",
      posFirst = 32,
      posLast = 32,
      type = "symbol"
    }, {
      data = ")",
      posFirst = 33,
      posLast = 33,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 34,
      posLast = 34,
      type = "whitespace"
    }, {
      data = "==",
      posFirst = 35,
      posLast = 36,
      type = "operator"
    }, {
      data = " ",
      posFirst = 37,
      posLast = 37,
      type = "whitespace"
    }, {
      data = "'e'",
      posFirst = 38,
      posLast = 40,
      type = "string"
    }, {
      data = " ",
      posFirst = 41,
      posLast = 41,
      type = "whitespace"
    }, {
      data = "then",
      posFirst = 42,
      posLast = 45,
      type = "keyword"
    } }, { {
      data = "                    ",
      posFirst = 1,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "pos",
      posFirst = 21,
      posLast = 23,
      type = "ident"
    }, {
      data = " ",
      posFirst = 24,
      posLast = 24,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 25,
      posLast = 25,
      type = "operator"
    }, {
      data = " ",
      posFirst = 26,
      posLast = 26,
      type = "whitespace"
    }, {
      data = "pos",
      posFirst = 27,
      posLast = 29,
      type = "ident"
    }, {
      data = " ",
      posFirst = 30,
      posLast = 30,
      type = "whitespace"
    }, {
      data = "+",
      posFirst = 31,
      posLast = 31,
      type = "operator"
    }, {
      data = " ",
      posFirst = 32,
      posLast = 32,
      type = "whitespace"
    }, {
      data = "1",
      posFirst = 33,
      posLast = 33,
      type = "number"
    } }, {}, { {
      data = "                    ",
      posFirst = 1,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "if",
      posFirst = 21,
      posLast = 22,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 23,
      posLast = 23,
      type = "whitespace"
    }, {
      data = "look",
      posFirst = 24,
      posLast = 27,
      type = "ident"
    }, {
      data = "(",
      posFirst = 28,
      posLast = 28,
      type = "symbol"
    }, {
      data = ")",
      posFirst = 29,
      posLast = 29,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 30,
      posLast = 30,
      type = "whitespace"
    }, {
      data = "==",
      posFirst = 31,
      posLast = 32,
      type = "operator"
    }, {
      data = " ",
      posFirst = 33,
      posLast = 33,
      type = "whitespace"
    }, {
      data = "'-'",
      posFirst = 34,
      posLast = 36,
      type = "string"
    }, {
      data = " ",
      posFirst = 37,
      posLast = 37,
      type = "whitespace"
    }, {
      data = "then",
      posFirst = 38,
      posLast = 41,
      type = "keyword"
    } }, { {
      data = "                        ",
      posFirst = 1,
      posLast = 24,
      type = "whitespace"
    }, {
      data = "pos",
      posFirst = 25,
      posLast = 27,
      type = "ident"
    }, {
      data = " ",
      posFirst = 28,
      posLast = 28,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 29,
      posLast = 29,
      type = "operator"
    }, {
      data = " ",
      posFirst = 30,
      posLast = 30,
      type = "whitespace"
    }, {
      data = "pos",
      posFirst = 31,
      posLast = 33,
      type = "ident"
    }, {
      data = " ",
      posFirst = 34,
      posLast = 34,
      type = "whitespace"
    }, {
      data = "+",
      posFirst = 35,
      posLast = 35,
      type = "operator"
    }, {
      data = " ",
      posFirst = 36,
      posLast = 36,
      type = "whitespace"
    }, {
      data = "1",
      posFirst = 37,
      posLast = 37,
      type = "number"
    } }, { {
      data = "                    ",
      posFirst = 1,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "end",
      posFirst = 21,
      posLast = 23,
      type = "keyword"
    } }, {}, { {
      data = "                    ",
      posFirst = 1,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "while",
      posFirst = 21,
      posLast = 25,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 26,
      posLast = 26,
      type = "whitespace"
    }, {
      data = "chars",
      posFirst = 27,
      posLast = 31,
      type = "ident"
    }, {
      data = ".",
      posFirst = 32,
      posLast = 32,
      type = "symbol"
    }, {
      data = "digits",
      posFirst = 33,
      posLast = 38,
      type = "ident"
    }, {
      data = "[",
      posFirst = 39,
      posLast = 39,
      type = "symbol"
    }, {
      data = "look",
      posFirst = 40,
      posLast = 43,
      type = "ident"
    }, {
      data = "(",
      posFirst = 44,
      posLast = 44,
      type = "symbol"
    }, {
      data = ")",
      posFirst = 45,
      posLast = 45,
      type = "symbol"
    }, {
      data = "]",
      posFirst = 46,
      posLast = 46,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 47,
      posLast = 47,
      type = "whitespace"
    }, {
      data = "do",
      posFirst = 48,
      posLast = 49,
      type = "keyword"
    } }, { {
      data = "                        ",
      posFirst = 1,
      posLast = 24,
      type = "whitespace"
    }, {
      data = "pos",
      posFirst = 25,
      posLast = 27,
      type = "ident"
    }, {
      data = " ",
      posFirst = 28,
      posLast = 28,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 29,
      posLast = 29,
      type = "operator"
    }, {
      data = " ",
      posFirst = 30,
      posLast = 30,
      type = "whitespace"
    }, {
      data = "pos",
      posFirst = 31,
      posLast = 33,
      type = "ident"
    }, {
      data = " ",
      posFirst = 34,
      posLast = 34,
      type = "whitespace"
    }, {
      data = "+",
      posFirst = 35,
      posLast = 35,
      type = "operator"
    }, {
      data = " ",
      posFirst = 36,
      posLast = 36,
      type = "whitespace"
    }, {
      data = "1",
      posFirst = 37,
      posLast = 37,
      type = "number"
    } }, { {
      data = "                    ",
      posFirst = 1,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "end",
      posFirst = 21,
      posLast = 23,
      type = "keyword"
    } }, { {
      data = "                ",
      posFirst = 1,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "end",
      posFirst = 17,
      posLast = 19,
      type = "keyword"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "end",
      posFirst = 13,
      posLast = 15,
      type = "keyword"
    } }, {}, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "token",
      posFirst = 13,
      posLast = 17,
      type = "ident"
    }, {
      data = "(",
      posFirst = 18,
      posLast = 18,
      type = "symbol"
    }, {
      data = "'number'",
      posFirst = 19,
      posLast = 26,
      type = "string"
    }, {
      data = ")",
      posFirst = 27,
      posLast = 27,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "elseif",
      posFirst = 9,
      posLast = 14,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 15,
      posLast = 15,
      type = "whitespace"
    }, {
      data = "char",
      posFirst = 16,
      posLast = 19,
      type = "ident"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "==",
      posFirst = 21,
      posLast = 22,
      type = "operator"
    }, {
      data = " ",
      posFirst = 23,
      posLast = 23,
      type = "whitespace"
    }, {
      data = "'['",
      posFirst = 24,
      posLast = 26,
      type = "string"
    }, {
      data = " ",
      posFirst = 27,
      posLast = 27,
      type = "whitespace"
    }, {
      data = "then",
      posFirst = 28,
      posLast = 31,
      type = "keyword"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "local",
      posFirst = 13,
      posLast = 17,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 18,
      posLast = 18,
      type = "whitespace"
    }, {
      data = "level",
      posFirst = 19,
      posLast = 23,
      type = "ident"
    }, {
      data = " ",
      posFirst = 24,
      posLast = 24,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 25,
      posLast = 25,
      type = "operator"
    }, {
      data = " ",
      posFirst = 26,
      posLast = 26,
      type = "whitespace"
    }, {
      data = "getLevel",
      posFirst = 27,
      posLast = 34,
      type = "ident"
    }, {
      data = "(",
      posFirst = 35,
      posLast = 35,
      type = "symbol"
    }, {
      data = ")",
      posFirst = 36,
      posLast = 36,
      type = "symbol"
    } }, {}, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "if",
      posFirst = 13,
      posLast = 14,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 15,
      posLast = 15,
      type = "whitespace"
    }, {
      data = "level",
      posFirst = 16,
      posLast = 20,
      type = "ident"
    }, {
      data = " ",
      posFirst = 21,
      posLast = 21,
      type = "whitespace"
    }, {
      data = "then",
      posFirst = 22,
      posLast = 25,
      type = "keyword"
    } }, { {
      data = "                ",
      posFirst = 1,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "getData",
      posFirst = 17,
      posLast = 23,
      type = "ident"
    }, {
      data = "(",
      posFirst = 24,
      posLast = 24,
      type = "symbol"
    }, {
      data = "level",
      posFirst = 25,
      posLast = 29,
      type = "ident"
    }, {
      data = ",",
      posFirst = 30,
      posLast = 30,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 31,
      posLast = 31,
      type = "whitespace"
    }, {
      data = "'string'",
      posFirst = 32,
      posLast = 39,
      type = "string"
    }, {
      data = ")",
      posFirst = 40,
      posLast = 40,
      type = "symbol"
    } }, { {
      data = "                ",
      posFirst = 1,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "token",
      posFirst = 17,
      posLast = 21,
      type = "ident"
    }, {
      data = "(",
      posFirst = 22,
      posLast = 22,
      type = "symbol"
    }, {
      data = "'string'",
      posFirst = 23,
      posLast = 30,
      type = "string"
    }, {
      data = ")",
      posFirst = 31,
      posLast = 31,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "else",
      posFirst = 13,
      posLast = 16,
      type = "keyword"
    } }, { {
      data = "                ",
      posFirst = 1,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "token",
      posFirst = 17,
      posLast = 21,
      type = "ident"
    }, {
      data = "(",
      posFirst = 22,
      posLast = 22,
      type = "symbol"
    }, {
      data = "'symbol'",
      posFirst = 23,
      posLast = 30,
      type = "string"
    }, {
      data = ")",
      posFirst = 31,
      posLast = 31,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "end",
      posFirst = 13,
      posLast = 15,
      type = "keyword"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "elseif",
      posFirst = 9,
      posLast = 14,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 15,
      posLast = 15,
      type = "whitespace"
    }, {
      data = "char",
      posFirst = 16,
      posLast = 19,
      type = "ident"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "==",
      posFirst = 21,
      posLast = 22,
      type = "operator"
    }, {
      data = " ",
      posFirst = 23,
      posLast = 23,
      type = "whitespace"
    }, {
      data = "'.'",
      posFirst = 24,
      posLast = 26,
      type = "string"
    }, {
      data = " ",
      posFirst = 27,
      posLast = 27,
      type = "whitespace"
    }, {
      data = "then",
      posFirst = 28,
      posLast = 31,
      type = "keyword"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "if",
      posFirst = 13,
      posLast = 14,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 15,
      posLast = 15,
      type = "whitespace"
    }, {
      data = "look",
      posFirst = 16,
      posLast = 19,
      type = "ident"
    }, {
      data = "(",
      posFirst = 20,
      posLast = 20,
      type = "symbol"
    }, {
      data = ")",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 22,
      posLast = 22,
      type = "whitespace"
    }, {
      data = "==",
      posFirst = 23,
      posLast = 24,
      type = "operator"
    }, {
      data = " ",
      posFirst = 25,
      posLast = 25,
      type = "whitespace"
    }, {
      data = "'.'",
      posFirst = 26,
      posLast = 28,
      type = "string"
    }, {
      data = " ",
      posFirst = 29,
      posLast = 29,
      type = "whitespace"
    }, {
      data = "then",
      posFirst = 30,
      posLast = 33,
      type = "keyword"
    } }, { {
      data = "                ",
      posFirst = 1,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "pos",
      posFirst = 17,
      posLast = 19,
      type = "ident"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 21,
      posLast = 21,
      type = "operator"
    }, {
      data = " ",
      posFirst = 22,
      posLast = 22,
      type = "whitespace"
    }, {
      data = "pos",
      posFirst = 23,
      posLast = 25,
      type = "ident"
    }, {
      data = " ",
      posFirst = 26,
      posLast = 26,
      type = "whitespace"
    }, {
      data = "+",
      posFirst = 27,
      posLast = 27,
      type = "operator"
    }, {
      data = " ",
      posFirst = 28,
      posLast = 28,
      type = "whitespace"
    }, {
      data = "1",
      posFirst = 29,
      posLast = 29,
      type = "number"
    } }, {}, { {
      data = "                ",
      posFirst = 1,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "if",
      posFirst = 17,
      posLast = 18,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 19,
      posLast = 19,
      type = "whitespace"
    }, {
      data = "look",
      posFirst = 20,
      posLast = 23,
      type = "ident"
    }, {
      data = "(",
      posFirst = 24,
      posLast = 24,
      type = "symbol"
    }, {
      data = ")",
      posFirst = 25,
      posLast = 25,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 26,
      posLast = 26,
      type = "whitespace"
    }, {
      data = "==",
      posFirst = 27,
      posLast = 28,
      type = "operator"
    }, {
      data = " ",
      posFirst = 29,
      posLast = 29,
      type = "whitespace"
    }, {
      data = "'.'",
      posFirst = 30,
      posLast = 32,
      type = "string"
    }, {
      data = " ",
      posFirst = 33,
      posLast = 33,
      type = "whitespace"
    }, {
      data = "then",
      posFirst = 34,
      posLast = 37,
      type = "keyword"
    } }, { {
      data = "                    ",
      posFirst = 1,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "pos",
      posFirst = 21,
      posLast = 23,
      type = "ident"
    }, {
      data = " ",
      posFirst = 24,
      posLast = 24,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 25,
      posLast = 25,
      type = "operator"
    }, {
      data = " ",
      posFirst = 26,
      posLast = 26,
      type = "whitespace"
    }, {
      data = "pos",
      posFirst = 27,
      posLast = 29,
      type = "ident"
    }, {
      data = " ",
      posFirst = 30,
      posLast = 30,
      type = "whitespace"
    }, {
      data = "+",
      posFirst = 31,
      posLast = 31,
      type = "operator"
    }, {
      data = " ",
      posFirst = 32,
      posLast = 32,
      type = "whitespace"
    }, {
      data = "1",
      posFirst = 33,
      posLast = 33,
      type = "number"
    } }, { {
      data = "                ",
      posFirst = 1,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "end",
      posFirst = 17,
      posLast = 19,
      type = "keyword"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "end",
      posFirst = 13,
      posLast = 15,
      type = "keyword"
    } }, {}, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "token",
      posFirst = 13,
      posLast = 17,
      type = "ident"
    }, {
      data = "(",
      posFirst = 18,
      posLast = 18,
      type = "symbol"
    }, {
      data = "'symbol'",
      posFirst = 19,
      posLast = 26,
      type = "string"
    }, {
      data = ")",
      posFirst = 27,
      posLast = 27,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "elseif",
      posFirst = 9,
      posLast = 14,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 15,
      posLast = 15,
      type = "whitespace"
    }, {
      data = "chars",
      posFirst = 16,
      posLast = 20,
      type = "ident"
    }, {
      data = ".",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    }, {
      data = "symbols",
      posFirst = 22,
      posLast = 28,
      type = "ident"
    }, {
      data = ".",
      posFirst = 29,
      posLast = 29,
      type = "symbol"
    }, {
      data = "equality",
      posFirst = 30,
      posLast = 37,
      type = "ident"
    }, {
      data = "[",
      posFirst = 38,
      posLast = 38,
      type = "symbol"
    }, {
      data = "char",
      posFirst = 39,
      posLast = 42,
      type = "ident"
    }, {
      data = "]",
      posFirst = 43,
      posLast = 43,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 44,
      posLast = 44,
      type = "whitespace"
    }, {
      data = "then",
      posFirst = 45,
      posLast = 48,
      type = "keyword"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "if",
      posFirst = 13,
      posLast = 14,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 15,
      posLast = 15,
      type = "whitespace"
    }, {
      data = "look",
      posFirst = 16,
      posLast = 19,
      type = "ident"
    }, {
      data = "(",
      posFirst = 20,
      posLast = 20,
      type = "symbol"
    }, {
      data = ")",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 22,
      posLast = 22,
      type = "whitespace"
    }, {
      data = "==",
      posFirst = 23,
      posLast = 24,
      type = "operator"
    }, {
      data = " ",
      posFirst = 25,
      posLast = 25,
      type = "whitespace"
    }, {
      data = "'='",
      posFirst = 26,
      posLast = 28,
      type = "string"
    }, {
      data = " ",
      posFirst = 29,
      posLast = 29,
      type = "whitespace"
    }, {
      data = "then",
      posFirst = 30,
      posLast = 33,
      type = "keyword"
    } }, { {
      data = "                ",
      posFirst = 1,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "pos",
      posFirst = 17,
      posLast = 19,
      type = "ident"
    }, {
      data = " ",
      posFirst = 20,
      posLast = 20,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 21,
      posLast = 21,
      type = "operator"
    }, {
      data = " ",
      posFirst = 22,
      posLast = 22,
      type = "whitespace"
    }, {
      data = "pos",
      posFirst = 23,
      posLast = 25,
      type = "ident"
    }, {
      data = " ",
      posFirst = 26,
      posLast = 26,
      type = "whitespace"
    }, {
      data = "+",
      posFirst = 27,
      posLast = 27,
      type = "operator"
    }, {
      data = " ",
      posFirst = 28,
      posLast = 28,
      type = "whitespace"
    }, {
      data = "1",
      posFirst = 29,
      posLast = 29,
      type = "number"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "end",
      posFirst = 13,
      posLast = 15,
      type = "keyword"
    } }, {}, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "token",
      posFirst = 13,
      posLast = 17,
      type = "ident"
    }, {
      data = "(",
      posFirst = 18,
      posLast = 18,
      type = "symbol"
    }, {
      data = "'operator'",
      posFirst = 19,
      posLast = 28,
      type = "string"
    }, {
      data = ")",
      posFirst = 29,
      posLast = 29,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "elseif",
      posFirst = 9,
      posLast = 14,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 15,
      posLast = 15,
      type = "whitespace"
    }, {
      data = "chars",
      posFirst = 16,
      posLast = 20,
      type = "ident"
    }, {
      data = ".",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    }, {
      data = "symbols",
      posFirst = 22,
      posLast = 28,
      type = "ident"
    }, {
      data = "[",
      posFirst = 29,
      posLast = 29,
      type = "symbol"
    }, {
      data = "char",
      posFirst = 30,
      posLast = 33,
      type = "ident"
    }, {
      data = "]",
      posFirst = 34,
      posLast = 34,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 35,
      posLast = 35,
      type = "whitespace"
    }, {
      data = "then",
      posFirst = 36,
      posLast = 39,
      type = "keyword"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "if",
      posFirst = 13,
      posLast = 14,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 15,
      posLast = 15,
      type = "whitespace"
    }, {
      data = "chars",
      posFirst = 16,
      posLast = 20,
      type = "ident"
    }, {
      data = ".",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    }, {
      data = "symbols",
      posFirst = 22,
      posLast = 28,
      type = "ident"
    }, {
      data = ".",
      posFirst = 29,
      posLast = 29,
      type = "symbol"
    }, {
      data = "operators",
      posFirst = 30,
      posLast = 38,
      type = "ident"
    }, {
      data = "[",
      posFirst = 39,
      posLast = 39,
      type = "symbol"
    }, {
      data = "char",
      posFirst = 40,
      posLast = 43,
      type = "ident"
    }, {
      data = "]",
      posFirst = 44,
      posLast = 44,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 45,
      posLast = 45,
      type = "whitespace"
    }, {
      data = "then",
      posFirst = 46,
      posLast = 49,
      type = "keyword"
    } }, { {
      data = "                ",
      posFirst = 1,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "token",
      posFirst = 17,
      posLast = 21,
      type = "ident"
    }, {
      data = "(",
      posFirst = 22,
      posLast = 22,
      type = "symbol"
    }, {
      data = "'operator'",
      posFirst = 23,
      posLast = 32,
      type = "string"
    }, {
      data = ")",
      posFirst = 33,
      posLast = 33,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "else",
      posFirst = 13,
      posLast = 16,
      type = "keyword"
    } }, { {
      data = "                ",
      posFirst = 1,
      posLast = 16,
      type = "whitespace"
    }, {
      data = "token",
      posFirst = 17,
      posLast = 21,
      type = "ident"
    }, {
      data = "(",
      posFirst = 22,
      posLast = 22,
      type = "symbol"
    }, {
      data = "'symbol'",
      posFirst = 23,
      posLast = 30,
      type = "string"
    }, {
      data = ")",
      posFirst = 31,
      posLast = 31,
      type = "symbol"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "end",
      posFirst = 13,
      posLast = 15,
      type = "keyword"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "else",
      posFirst = 9,
      posLast = 12,
      type = "keyword"
    } }, { {
      data = "            ",
      posFirst = 1,
      posLast = 12,
      type = "whitespace"
    }, {
      data = "token",
      posFirst = 13,
      posLast = 17,
      type = "ident"
    }, {
      data = "(",
      posFirst = 18,
      posLast = 18,
      type = "symbol"
    }, {
      data = "'unidentified'",
      posFirst = 19,
      posLast = 32,
      type = "string"
    }, {
      data = ")",
      posFirst = 33,
      posLast = 33,
      type = "symbol"
    } }, { {
      data = "        ",
      posFirst = 1,
      posLast = 8,
      type = "whitespace"
    }, {
      data = "end",
      posFirst = 9,
      posLast = 11,
      type = "keyword"
    } }, { {
      data = "    ",
      posFirst = 1,
      posLast = 4,
      type = "whitespace"
    }, {
      data = "end",
      posFirst = 5,
      posLast = 7,
      type = "keyword"
    } }, {}, { {
      data = "    ",
      posFirst = 1,
      posLast = 4,
      type = "whitespace"
    }, {
      data = "lines",
      posFirst = 5,
      posLast = 9,
      type = "ident"
    }, {
      data = "[",
      posFirst = 10,
      posLast = 10,
      type = "symbol"
    }, {
      data = "#",
      posFirst = 11,
      posLast = 11,
      type = "operator"
    }, {
      data = "lines",
      posFirst = 12,
      posLast = 16,
      type = "ident"
    }, {
      data = " ",
      posFirst = 17,
      posLast = 17,
      type = "whitespace"
    }, {
      data = "+",
      posFirst = 18,
      posLast = 18,
      type = "operator"
    }, {
      data = " ",
      posFirst = 19,
      posLast = 19,
      type = "whitespace"
    }, {
      data = "1",
      posFirst = 20,
      posLast = 20,
      type = "number"
    }, {
      data = "]",
      posFirst = 21,
      posLast = 21,
      type = "symbol"
    }, {
      data = " ",
      posFirst = 22,
      posLast = 22,
      type = "whitespace"
    }, {
      data = "=",
      posFirst = 23,
      posLast = 23,
      type = "operator"
    }, {
      data = " ",
      posFirst = 24,
      posLast = 24,
      type = "whitespace"
    }, {
      data = "buffer",
      posFirst = 25,
      posLast = 30,
      type = "ident"
    } }, {}, { {
      data = "    ",
      posFirst = 1,
      posLast = 4,
      type = "whitespace"
    }, {
      data = "return",
      posFirst = 5,
      posLast = 10,
      type = "keyword"
    }, {
      data = " ",
      posFirst = 11,
      posLast = 11,
      type = "whitespace"
    }, {
      data = "lines",
      posFirst = 12,
      posLast = 16,
      type = "ident"
    } }, { {
      data = "end",
      posFirst = 1,
      posLast = 3,
      type = "keyword"
    } } }</code></pre></details>
