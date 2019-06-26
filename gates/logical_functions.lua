-- Funkcje logiczne

local function AND(a, b)
	return a and b
end

local function NAND(a, b)
	return not (a and b)
end

local function NOR(a, b)
	return not (a or b)
end

local function OR(a, b)
	return a or b
end

local function XOR(a, b)
	return a ~= b
end

return AND, NAND, NOR, OR, XOR
