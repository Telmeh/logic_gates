-- Program znajdujacy optymalna liczbe bramek

-- Global variables
Variables = {'a', 'b', 'c'}
Gates = {"and", "nand", "nor", "or", "xor"}
Tests = {"000=0","001=1","010=0","011=0","100=1","101=1","110=1","111=1"}

-- Functions
-- Given two booleans, return one boolean
AND, NAND, NOR, OR, XOR = dofile("logical_functions.lua")

-- Table
-- Gives all possible permutations of tables like {'b',"nor",'c',"and",'c'} 
Statements = dofile("permuations.lua")

-- Function
-- Given '010=1' returns a,b,c,s with correct boolean values
translate = dofile("translate.lua")

	-- uzywamy Statements o wielkosci ~700
	-- i kazda jego komorka ma tablice skladajaca sie z pieciu komorek
	-- Teraz przypisujemy vary, a,b,c. Musimy iterowac po permutacjach. Czyli Statements.
	for _,statement in ipairs(Statements) do
		if 
			-- Mamy funkcje translate = dofile("translate.lua"), ktora tlumaczy '010=1' na zmienne
			-- Mam funkcje AND, NAND, NOR, OR, XOR
			-- temp.lua jest bardzo posuniety do przodu
end
