-- Przypisanie zmiennym var1, var2, var3 wartosci a,b,c wedlug tablicy z Statements

local function assign(a, b, c, table)
	-- table is of form {'c', "nor", 'b', "and", 'b'}
	local var1, var2, var3
	if table[1] == 'a' then
		var1 = a
	elseif table[1] == 'b' then
		var1 = b
	else
		var1 = c
	end
	
	if table[3] == 'a' then
		var2 = a
	elseif table[3] == 'b' then
		var2 = b
	else
		var2 = c
	end

	if table[5] == 'a' then
		var3 = a
	elseif table[5] == 'b' then
		var3 = b
	else
		var3 = c
	end

	return var1, var2, var3
end

return assign
