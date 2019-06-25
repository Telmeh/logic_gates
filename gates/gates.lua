--[[
  Program to find right logic gates
  A or ((B xor C) and C) = S
  000 = 0 , 001 = 1 , 010 = 0 , 011 = 0 , 100 = 1 , 101 = 1 , 110 = 1 , 111 = 1
  Czyli generalnie funkcja bierze najpierw (a,b). A potem funkcja2(temp, c)
  Gdzie a,b,c,s beda miec odpowiednie wartosci przypisane z tablicy.
--]]

gates = { "and", "nand", "nor", "or", "xor"}
variables = { 'a', 'b', 'c'}
tests = { "000 = 0" , "001 = 1" , "010 = 0" , "011 = 0" , "100 = 1" , "101 = 1" , "110 = 1" , "111 = 1"}

--[[
--przetestowac dostring()

s= "print 'assert(loadstring(s))() dziala poprawnie'"

assert(loadstring(s))()
--]]

--Funkcja tlumaczaca "010 = 1" na kod. a pierwsze, b drugie, c trzecie, s czwarte.

function translate(string)
	local t = {}
	for i = 1, 3 do
		if string:sub(i,i) == '0' then
			t[i] = false
		else
			t[i] = true
		end
	end
	if string:sub(7,7) ==  '0' then
		t[4] = false
	else
		t[4] = true
	end
	return t
end

function AND(a,b)
	return a and b
end

function NAND(a,b)
	return not (a and b)
end

function NOR(a,b)
	return not (a or b)
end

function OR(a,b)
	return a or b
end

function XOR(a, b)
	if a ~= b then
		return true
	end
	return false
end

-- Funkcja uzywajaca translate() do przypisania wartosci lokalnym zmiennym a,b,c,s
-- Potem robi return. A my jej uzyjemy do przypisania ogolnego or whatever to sie nazywa.

function assign(table)
	local a,b,c,s
	a = table[1]
	b = table[2]
	c = table[3]
	s = table[4]
	return a, b, c, s
end

-- Czy teraz juz petle po wszystkich przypadkach? Chyba tak..
-- Na koncu porownywanie wartosci z s

-- wszystkie przypadki
function permutations()
	local table
	local prototype = "variable gate variable gate variable"
	local variables = {'a', 'b', 'c'}
	local gates = {"and", "nand", "nor", "or", "xor"}

	-- wzor
	-- Permutacje..
	-- a and a and a
	-- a and a and b
	-- a and a and c
	-- a and a nand a
	-- a and a nand b
	-- a and a nand c
	-- a and a nor a
	-- [[nie obchodzi mnie jesli ktores przypadki sie powtorza]]
	-- a and a nor b
	-- [[czy w ten sposob przejdziemy po wszystkich przypadkach? Na to wyglada. To zrobmy tablice takich stringow]]
	-- no nie bedzie potrzebna nieskonczona petla tutaj.. Ostatni przypadek to "c xor c xor c"
	local template = "var1 gate1 var2 gate2 var3"
	for i=1, 1000 do
		local var1, var2, var3
		local gate1, gate2
		local mod
		local index
		local p
		local temp
		-- z kazdym modulo 3 resetuje sie zmienna ostatnia. z. var3.
		-- nie trzeba biblioteki: % will do its job
		-- kazde a, b, c moze zajac miejsca var1, var2, var3

		-- var3
		mod = i % 3
		-- zaczyna od i = 1
		--[[
		if mod == 1 then var3 = 'a'
		elseif mod == 2 then var3 = 'b'
		else var3 = 'c'
		end
		--]]

		index = mod
		var3 = variables[index]

		-- gate2
		-- hmm kiedy to sie resetuje. Chyba standardowo. liczba zmiennych * liczba bramek
		-- czym jest p? liczba przez ktora robimy modulo. Nie wiem jak sie ona nazywa
		-- p od procenta
		p = #variables * #gates
		mod = i % p
		-- tu bedzie duzyyy index.. p = 3*5 = 15. A nas interesuje 5.
		-- soo co 3 chcemy zeby sie zmienialo gate2
		-- moglibysmy zrobic inkramentacje jakiejs zmiennej o jeden przy kazdym i % 3 == 0. I gdy ta zmienna bedzie wieksza od 5 to ja zerujemy. czyli uzywamy modulo. to zrobmy tak na razie.. Ugly:/
		-- temp = 
		-- uhh kurwa temp musialo by byc zmienna globalna..
		-- duzo ladniej i czysciej byloby uzywac samego modulo. Ale musialbym to ogarnac.
		-- no moze nie globalne, inside a function
		if i % 3 == 0 then 
		end
	end
	return table
	--hmm podzielic to na osobne files
	-- ok, dofile() will do the job
	-- co ma byc w tym library.lua ?
	-- hmm, moze eksperymenty nad tym modulo.
end
