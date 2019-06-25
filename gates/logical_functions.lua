-- Funkcje logiczne

function AND(a, b)
	return a and b
end

function NAND(a, b)
	return not (a and b)
end

function NOR(a, b)
	return not (a or b)
end

function OR(a, b)
	return a or b
end

function XOR(a, b)
	return a ~= b
end
