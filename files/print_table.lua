-- Function to print table. At the end of file return function.

local function printab(table)
	for _, string in pairs(table) do
		print(string)
	end
end

return printab
