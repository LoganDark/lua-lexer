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
- `string`: Part of a string that isn't an escape
- `escape`: A string escape, like \n, only found inside strings
- `keyword`: Keywords. Like "while", "end", "do", etc
- `value`: Special values. Only true, false, and nil
- `ident`: Identifier. Variables, function names, etc
- `number`: Numbers, including both base 10 (and scientific notation) and hexadecimal
- `symbol`: Symbols, like brackets, parenthesis, ., .., ... etc
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
