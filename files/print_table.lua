-- Function to print table. At the end of file return function.

local function printab(table)
	local text = ''
	for _, string in pairs(table) do
		text = text .. string .. ' '
	end
	print(text)
end

return printab
