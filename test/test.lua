package.path = '../?.lua;' .. package.path

local lexer = require('lexer')
local inspect = require('inspect.inspect')

--[[local lexer_file = io.open('../lexer.lua', 'r')
local lexer_src = lexer_file:read('*all')
lexer_file:close()

local lexed = lexer(lexer_src)]]

while true do
	local success, message = pcall(function()
		io.write('> ')
		local src = io.read()

		print(inspect(lexer(src), { indent = '\t' }))
	end)

	if not success then
		print(message)

		break
	end
end