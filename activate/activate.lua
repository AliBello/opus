-- add this file to the preload section of .startup.boot
-- example:
-- {
--   preload = { 'packages/secure/unlock.lua' },
--   ...

--  package.path = '/sys/modules/?.lua;' .. package.path

local Security = require('opus.security')
local SHA      = require('opus.crypto.sha2')
local Terminal = require('opus.terminal')

local term = _G.term

term.setCursorPos(1, 1)
term.clear()

repeat
	local s, m = pcall(function()
		local password = Terminal.readPassword('Enter License: ')

		if password == 'XGVPP-NMH47-7TTHJ-W3FW7-8HV2C' or 'zort' then
			return true
		end
		error('Invalid License. Please contact Zortia, or retry typing your license from your instruction booklet.')
	end)
	if not s and m then
		_G.printError(m)
	end
until s

os.remove('/activate/activate.lua')
os.remove('/activate')

