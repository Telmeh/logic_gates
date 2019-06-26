-- Function for main() which will translate '010=1' to values, variables

local function translate(string)
	local a,b,c,s
	local temp
	temp = string:sub(1,1)
	if temp == '0' then
		a = false
	else
		a = true
	end
	temp = string:sub(2,2)
	if temp == '0' then
		b = false
	else
		b = true
	end
	temp = string:sub(3,3)
	if temp == '0' then
		c = false
	else
		c = true
	end
	temp = string:sub(5,5)
	if temp == '0' then
		s = false
	else
		s = true
	end
	return a,b,c,s
end

return translate
