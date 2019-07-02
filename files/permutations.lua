-- Permutacje

local table = {}
for i = 1, 700 do
	local var1, var2, var3
	local gate1, gate2
	local v1, v2, v3
	local g1, g2
	local temp
	-- index for var3
	v3 = i % 3 + 1
	var3 = Variables[v3]
	-- Hmmmmmm
	-- No z kazdym modulo rosna liczby. Trzeba sie temu przyjrzec. Kiedy zmienna ma rosnac. Czy to powinno sie brac modulo z modulo. Czyli v2 = (i % 15) % 5. ??? Sprawdzmy. Sprawdzmy jak to bedzie dzialac
	-- No nie... To juz dla i = 2 dostanie index dwa.. XXX.
	-- To dopiero jak i bedzie wieksze od 3 ma urosnac. Czyli! Czyli chyba dzielenie bez reszty. g2 = (i/3) % 5
	-- Moze modulo samo zaniedba reszte.
	g2 = math.floor(i/3) % 5 + 1
	-- print("g2: " .. g2)
	gate2 = Gates[g2]
	-- hmm co tera.. v2 ma zmieniac sie po 15. Po pieciu zmianach gate2.
	v2 = math.floor(i/15) % 3 + 1
	var2 = Variables[v2]
	g1 = math.floor(i/45) % 5 + 1	
	gate1 = Gates[g1]
	v1 = math.floor(i/225) % 3 + 1
	var1 = Variables[v1]

	-- No tak. Generalna zasada miala byc taka, ze teraz permutacje beda w tablicy tablic.
	
	table[i] = {var1, gate1, var2, gate2, var3}
end
return table
-- Should I make globals start with a capital letter?
-- I guess..
-- zrobione
-- no to wracamy do gates2.lua
