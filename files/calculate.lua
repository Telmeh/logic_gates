-- Function. Given { true, "xor", false, "and", false} return true or false.

function calculate(table)
	local var1 = table[1]
	local var2 = table[3]
	local var3 = table[5]
	local fun1 = table[2]
	local fun2 = table[4]
	local temp
	local total
	if fun1 == "and" then
		temp = AND(var1,var2)
	elseif fun1 == "nand" then
		temp = NAND(var1, var2)
	elseif fun1 == "nor" then
		temp = NOR(var1,var2)
	elseif fun1 == "or" then
		temp = OR(var1, var2)
	else
		temp = XOR(var1, var2)
	end

	if fun2 == "and" then
		total = AND(temp, var3)
	elseif fun2 == "nand" then
		total = NAND(temp, var3)
	elseif fun2 == "nor" then
		total = NOR(temp, var3)
	elseif fun2 == "or" then
		total = OR(temp, var3)
	else
		total = XOR(temp, var3)
	end
	
	return total
end

return calculate
