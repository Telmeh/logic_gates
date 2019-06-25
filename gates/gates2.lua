-- Program znajdujacy optymalna liczbe bramek

Variables = {'a', 'b', 'c'}
Gates = {"and", "nand", "nor", "or", "xor"}
Tests = {"000=0","001=1","010=0","011=0","100=1","101=1","110=1","111=1"}
-- Moglbym odtworzyc pierwsze trzy znaki bez przechowywania ich. Ale tak jest raczej lepiej

-- funkcje logiczne
dofile("logical_functions.lua")
-- Good

-- co teraz..
-- wziac funkcje ktora tworzy wszystkie wariacje od a nor c xor a. Niech sie nazywa variations() albo permutations()

Statements = dofile("permuations.lua")
-- skonfigurowac permutations.lua. Eh nie, ta funkcja wykorzystuje tablice globalne variables, gates. E to dobrze, permutations.lua w dofile() powinno miec dostep do globalnych.
-- Zrobione

-- dobra.. Czyli mamy w tablicach tablic. Teraz odpowiednie przeliczanie wartosci logicznych. I przypisywanie. Tutaj czy w osobnym pliku/module?
-- Sprobujmy na razie tutaj.

function translate()
	-- na razie przetlumaczy
	-- uzywamy Statements. Statements ma size ~700 z tego co pamietam
	-- i kazda jego komorka ma tablice skladajaca sie z pieciu komorek
	-- We were refactoring!
	-- dobra. To co teraz. Przypisujemy vary, a,b,c. No musimy iterowac po permutacjach. Czyli Statements.
	-- teraz zienilo nazwe na Permutations. Permutations to byl sposob na ich uzyskanie. Ale Statements lepiej pasuje do tego czym sa i jakie jest ich zadanie.
	for _,statement in ipairs(Statements) do
		if 
			-- hmm, jeszcze trzeba by tlumaczyc '010=1' na zmienne.
			-- To chyba tez funkcja poza main() powinna byc.
end

-- Hmm w jaki sposob to najlepiej zalatwic?
-- translate = loadfile("translate.lua") ?
-- W srodku bylaby function() ... end
-- Najlepiej byloby teraz zalozyc plik "test.lua" i sprawdzic. Potrzebny bylby tez "test2.lua" z funkcja
-- No dobra robimy to
-- No dobra zrobilismy maly refactoring
