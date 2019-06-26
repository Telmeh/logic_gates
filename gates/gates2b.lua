-- Program znajdujacy optymalna liczbe bramek

Variables = {'a', 'b', 'c'}
Gates = {"and", "nand", "nor", "or", "xor"}
Tests = {"000=0","001=1","010=0","011=0","100=1","101=1","110=1","111=1"}

dofile("logical_functions.lua")

Statements = dofile("permuations.lua")

-- Odpowiednie przeliczanie wartosci logicznych
function translate()
	-- na razie przetlumaczy
	-- uzywamy Statements o wielkosci ~700
	-- i kazda jego komorka ma tablice skladajaca sie z pieciu komorek
	-- Teraz przypisujemy vary, a,b,c. Musimy iterowac po permutacjach. Czyli Statements.
	for _,statement in ipairs(Statements) do
		if 
			-- trzeba jeszcze tlumaczyc '010=1' na zmienne.
			-- To chyba tez funkcja poza main() powinna byc.
			-- Robimy tez modul "translate.lua"?
			-- Mysle, ze tak
			-- Potem dofile("translate.lua")
			-- Program sie wykona uzywajac zmiennych globalnych z mainu.
			-- Jakie przypisanie na koniec?
			-- Chyba bez przypisania z dofile. On po prostu doda funkcje translate do funkcji globalnych.
			-- Czyli translate = dofile("translate.lua")
end
