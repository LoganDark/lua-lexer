-- MIT License
-- 
-- Copyright (c) 2018 LoganDark
-- 
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
-- 
-- The above copyright notice and this permission notice shall be included in all
-- copies or substantial portions of the Software.
-- 
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.

local chars = {
	whitespace = {
		[' '] = true,
		['\n'] = true,
		['\t'] = true,
		['\r'] = true
	},

	validEscapes = {
		['a'] = true,
		['b'] = true,
		['f'] = true,
		['n'] = true,
		['r'] = true,
		['t'] = true,
		['v'] = true,
		['"'] = true,
		['\''] = true,
		['\\'] = true,
		['\n'] = true
	},

	ident = {
		['a'] = true,
		['b'] = true,
		['c'] = true,
		['d'] = true,
		['e'] = true,
		['f'] = true,
		['g'] = true,
		['h'] = true,
		['i'] = true,
		['j'] = true,
		['k'] = true,
		['l'] = true,
		['m'] = true,
		['n'] = true,
		['o'] = true,
		['p'] = true,
		['q'] = true,
		['r'] = true,
		['s'] = true,
		['t'] = true,
		['u'] = true,
		['v'] = true,
		['w'] = true,
		['x'] = true,
		['y'] = true,
		['z'] = true,
		['A'] = true,
		['B'] = true,
		['C'] = true,
		['D'] = true,
		['E'] = true,
		['F'] = true,
		['G'] = true,
		['H'] = true,
		['I'] = true,
		['J'] = true,
		['K'] = true,
		['L'] = true,
		['M'] = true,
		['N'] = true,
		['O'] = true,
		['P'] = true,
		['Q'] = true,
		['R'] = true,
		['S'] = true,
		['T'] = true,
		['U'] = true,
		['V'] = true,
		['W'] = true,
		['X'] = true,
		['Y'] = true,
		['Z'] = true,
		['_'] = true,
		['0'] = true,
		['1'] = true,
		['2'] = true,
		['3'] = true,
		['4'] = true,
		['5'] = true,
		['6'] = true,
		['7'] = true,
		['8'] = true,
		['9'] = true,

		start = {
			['a'] = true,
			['b'] = true,
			['c'] = true,
			['d'] = true,
			['e'] = true,
			['f'] = true,
			['g'] = true,
			['h'] = true,
			['i'] = true,
			['j'] = true,
			['k'] = true,
			['l'] = true,
			['m'] = true,
			['n'] = true,
			['o'] = true,
			['p'] = true,
			['q'] = true,
			['r'] = true,
			['s'] = true,
			['t'] = true,
			['u'] = true,
			['v'] = true,
			['w'] = true,
			['x'] = true,
			['y'] = true,
			['z'] = true,
			['A'] = true,
			['B'] = true,
			['C'] = true,
			['D'] = true,
			['E'] = true,
			['F'] = true,
			['G'] = true,
			['H'] = true,
			['I'] = true,
			['J'] = true,
			['K'] = true,
			['L'] = true,
			['M'] = true,
			['N'] = true,
			['O'] = true,
			['P'] = true,
			['Q'] = true,
			['R'] = true,
			['S'] = true,
			['T'] = true,
			['U'] = true,
			['V'] = true,
			['W'] = true,
			['X'] = true,
			['Y'] = true,
			['Z'] = true,
			['_'] = true
		},
	},

	digits = {
		['0'] = true,
		['1'] = true,
		['2'] = true,
		['3'] = true,
		['4'] = true,
		['5'] = true,
		['6'] = true,
		['7'] = true,
		['8'] = true,
		['9'] = true,

		hex = {
			['0'] = true,
			['1'] = true,
			['2'] = true,
			['3'] = true,
			['4'] = true,
			['5'] = true,
			['6'] = true,
			['7'] = true,
			['8'] = true,
			['9'] = true,
			['a'] = true,
			['b'] = true,
			['c'] = true,
			['d'] = true,
			['e'] = true,
			['f'] = true,
			['A'] = true,
			['B'] = true,
			['C'] = true,
			['D'] = true,
			['E'] = true,
			['F'] = true
		}
	},

	symbols = {
		['+'] = true,
		['-'] = true,
		['*'] = true,
		['/'] = true,
		['^'] = true,
		['%'] = true,
		[','] = true,
		['{'] = true,
		['}'] = true,
		['['] = true,
		[']'] = true,
		['('] = true,
		[')'] = true,
		[';'] = true,
		['#'] = true,
		['.'] = true,
		[':'] = true,

		equality = {
			['~'] = true,
			['='] = true,
			['>'] = true,
			['<'] = true
		},

		operators = {
			['+'] = true,
			['-'] = true,
			['*'] = true,
			['/'] = true,
			['^'] = true,
			['%'] = true,
			['#'] = true
		}
	}
}

local keywords = {
	structure = {
		['and'] = true,
		['break'] = true,
		['do'] = true,
		['else'] = true,
		['elseif'] = true,
		['end'] = true,
		['for'] = true,
		['function'] = true,
		['goto'] = true,
		['if'] = true,
		['in'] = true,
		['local'] = true,
		['not'] = true,
		['or'] = true,
		['repeat'] = true,
		['return'] = true,
		['then'] = true,
		['until'] = true,
		['while'] = true
	},

	values = {
		['true'] = true,
		['false'] = true,
		['nil'] = true
	}
}

return function(text)
	local pos = 1
	local start = 1
	local len = #text
	local buffer = {}
	local lines = {}

	local function look(delta)
		delta = pos + (delta or 0)

		return text:sub(delta, delta)
	end

	local function get()
		local char = text:sub(pos, pos)

		pos = pos + 1

		return char
	end

	local function getLevel()
		local num = 0

		while look(num) == '=' do
			num = num + 1
		end

		if look(num) == '[' then
			pos = pos + num

			return num
		else
			return nil
		end
	end

	local function getToken()
		return text:sub(start, pos - 1)
	end

	local currentLineLength = 0
	local lineoffset = 0

	local function token(type, text)
		text = text or getToken()

		local tk = {
			type = type,
			data = text,
			posFirst = start - lineoffset,
			posLast = pos - 1 - lineoffset
		}

		if tk.data ~= '' then
			buffer[#buffer + 1] = tk
		end

		currentLineLength = currentLineLength + text:len()
		start = pos

		return tk
	end

	local function newline()
		lines[#lines + 1] = buffer
		buffer = {}
		get()
		token('newline')
		buffer[1] = nil
		lineoffset = lineoffset + currentLineLength
		currentLineLength = 0
	end

	local function getData(level, type)
		while true do
			local char = get()

			if char == '' then
				return
			elseif char == '\n' then
				pos = pos - 1
				token(type)
				newline()
			elseif char == ']' then
				local valid = true

				for i = 1, level do
					if look() == '=' then
						pos = pos + 1
					else
						valid = false
						break
					end
				end

				if valid and look() == ']' then
					pos = pos + 1

					return
				end
			end
		end
	end

	while true do
		while true do
			local char = look()

			if char == '\n' then
				token('whitespace')
				newline()
			elseif chars.whitespace[char] then
				pos = pos + 1
			else
				break
			end
		end

		token('whitespace')

		local char = get()

		if char == '' then
			break
		elseif char == '-' and look() == '-' then
			pos = pos + 1

			if look() == '[' then
				pos = pos + 1

				local level = getLevel()

				if level then
					getData(level, 'comment')
				else
					while true do
						local char2 = get()

						if char2 == '' or char2 == '\n' then
							pos = pos - 1
							token('comment')

							if char2 == '\n' then
								newline()
							end

							break
						end
					end
				end
			else
				while true do
					local char2 = get()

					if char2 == '' or char2 == '\n' then
						pos = pos - 1
						token('comment')

						if char2 == '\n' then
							newline()
						end

						break
					end
				end
			end

			token('comment')
		elseif char == '\'' or char == '"' then
			while true do
				local char2 = get()

				if char2 == '\\' then
					pos = pos - 1
					token('string')
					get()

					local char3 = get()

					if chars.digits[char3] then
						for i = 1, 2 do
							if chars.digits[look()] then
								pos = pos + 1
							end
						end
					elseif char3 == 'x' then
						if chars.digits.hex[look()] and chars.digits.hex[look(1)] then
							pos = pos + 2
						else
							token('unidentified')
						end
					elseif char3 == '\n' then
						pos = pos - 1
						token('escape')
						newline()
					elseif not chars.validEscapes[char3] then
                        token('unidentified')
					end

					token('escape')
				elseif char2 == '\n' then
					pos = pos - 1
					token('string')
					newline()

					break
				elseif char2 == char or char2 == '' then
					break
				end
			end

			token('string')
		elseif chars.ident.start[char] then
			while chars.ident[look()] do
				pos = pos + 1
			end

			local word = getToken()

			if keywords.structure[word] then
				token('keyword')
			elseif keywords.values[word] then
				token('value')
			else
				token('ident')
			end
		elseif chars.digits[char] or (char == '.' and chars.digits[look()]) then
			if char == '0' and look() == 'x' then
				pos = pos + 1

				while chars.digits.hex[look()] do
					pos = pos + 1
				end
			else
				while chars.digits[look()] do
					pos = pos + 1
				end

				if look() == '.' then
					pos = pos + 1

					while chars.digits[look()] do
						pos = pos + 1
					end
				end

				if look():lower() == 'e' then
					pos = pos + 1

					if look() == '-' then
						pos = pos + 1
					end

					while chars.digits[look()] do
						pos = pos + 1
					end
				end
			end

			token('number')
		elseif char == '[' then
			local level = getLevel()

			if level then
				getData(level, 'string')
				token('string')
			else
				token('symbol')
			end
		elseif char == '.' then
			if look() == '.' then
				pos = pos + 1

				if look() == '.' then
					pos = pos + 1
				end
			end

			token('symbol')
		elseif chars.symbols.equality[char] then
			if look() == '=' then
				pos = pos + 1
			end

			token('operator')
		elseif chars.symbols[char] then
			if chars.symbols.operators[char] then
				token('operator')
			else
				token('symbol')
			end
		else
			token('unidentified')
		end
	end

	lines[#lines + 1] = buffer

	return lines
end
