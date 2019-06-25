-- File to test chodzenie po pojedynczych przypadkach uzywajac modulo.
dofile("gates.lua")
-- Global variables
template  = "var1 gate1 var2 gate2 var3"
variables = {'a', 'b', 'c'}
gates = {'and', 'nand', 'nor', 'or', 'xor'}

-- chcemy zeby za kazdym modulo trzy zmieniala sie ostatnia zmienna. Po kazdym pelnym przejsciu pierwszej zmiennej, niech zmienia sie druga zmienna. Kiedy druga zmienna przeleci przez wszystkie wartosci to niech zmieni sie trzecia itd. Zakladajac, ze kazda zmienna ma trzy mozliwe wartosci, to..: pierwsza zmienna bedzie sie zmieniac co jeden i po trzech wroci. Druga zmienna bedzie zmieniac wartosci co trzy i po kroku o wartosci dziewiec wroci do poczatku. Trzecia zmienna bedzie zmieniac wartosc co 9 krokow i osiagnie pelna wartosc po 27 krokach(wroci do poczatku). Czwarta zmienna bedzie zmieniac wartosc co 27 krokow i osiagnie pelna wartosc po 81 krokach. Piata zmienna bedzie zmieniac wartosc co 81 krokow i osiagnie pelna wartosc po 243 krokach. Szosta zmienna bedzie zmieniac wartosc co 243 kroki i osiagnie pelna wartosc po 729 krokach.
-- 1 - 3
-- 2 - 9
-- 3 - 27
-- 4 - 81
-- 5 - 243
-- 6 - 729
-- = 3^i

-- Czyli teraz jesli pierwsza zmienna ma trzy mozliwosci, druga ma piec mozliwosci, trzecia ma trzy mozliwosci itd. To..: 
-- Pierwsza zmienna osiagnie pelnie po trzech krokach. Druga zmienna bedzie zmieniac sie co trzy kroki i musi sie zmienic piec razy by osiagnac pelnie. 5*3=15 Czyli druga zmienna osiagnie pelnie po 15 krokach. Trzecia zmienna bedzie sie zmieniac po 15 krokach. Potrzebuje trzy zmiany by osiagnac pelnie. 3*15=45. Czyli trzecia zmienna osiagnie pelnie po 45 krokach.  Czwarta zmienna potrzebuje 5 zmian by osiagnac pelnie. Kazda jej zmiana nastapi po 45 krokach. Czyli Czwarta zmienna osiagnie pelnie po 5*45 = 225.  Piata zmienna potrzebuje trzech zmian by osiagnac pelnje. Kazda jej zmiana nastapi po 225 krokach. Czyli piata zmienna osiagnie pelnie po 675 krokach.
-- Caly program bedzie musial przejsc 3*5*3*5*3 kroki. Co jest rowne 675.
-- Na razie zostawiamy 1000, chuj ze sie beda powtarzac. Nie bede musial sprawdzac z dokladnoscia do jeden.
-- Teraz jak to podzielic. Chyba liczbami bedzie czysciej. Pewnie jest jakis ladny sposob, ale zrobimy tak. Po beginnersku.
-- No to do dziela

Tablica = {}
for i = 1, 700 do
	local var1, var2, var3
	local gate1, gate2
	local v1, v2, v3
	local g1, g2
	local temp
	-- index for var3
	v3 = i % 3 + 1
	var3 = variables[v3]
	-- Hmmmmmm
	-- No z kazdym modulo rosna liczby. Trzeba sie temu przyjrzec. Kiedy zmienna ma rosnac. Czy to powinno sie brac modulo z modulo. Czyli v2 = (i % 15) % 5. ??? Sprawdzmy. Sprawdzmy jak to bedzie dzialac
	-- No nie... To juz dla i = 2 dostanie index dwa.. XXX.
	-- To dopiero jak i bedzie wieksze od 3 ma urosnac. Czyli! Czyli chyba dzielenie bez reszty. g2 = (i/3) % 5
	-- Moze modulo samo zaniedba reszte.
	g2 = math.floor(i/3) % 5 + 1
	-- print("g2: " .. g2)
	gate2 = gates[g2]
	-- hmm co tera.. v2 ma zmieniac sie po 15. Po pieciu zmianach gate2.
	v2 = math.floor(i/15) % 3 + 1
	var2 = variables[v2]
	g1 = math.floor(i/45) % 5 + 1
	gate1 = gates[g1]
	v1 = math.floor(i/225) % 3 + 1
	var1 = variables[v1]
	
	Tablica[i] = var1 .. " " .. gate1 .. " " .. var2 .. " " .. gate2 .. " " .. var3
	print(Tablica[i])
end

-- te binarne wyrazenia
tests = { "000 = 0" , "001 = 1" , "010 = 0" , "011 = 0" , "100 = 1" , "101 = 1"
 , "110 = 1" , "111 = 1"}
-- Pieknie:)
-- Ech, trzeba to ladniej. W sensie kod jest ok.
-- dobra nie chce mi sie, kodzimy dalej. Tutaj.

function parse(string)
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
	temp = string:sub(7,7)
	if temp == '0' then
		s = false
	else
		s = true
	end
	return a,b,c,s
end
	-- FUCK, nie uda sie tak latwo zabrac. Trzeba uzyc sub.
function Check()
	-- Zmienia kazda wartosc Tablica na kod/funkcje/wyrazenie
	-- lepsza nazwa dla Tablica to bylaby wyrazenia
	for i, v in ipairs(Tablica) do
		-- trzeba funkcje, ktora bierze jedno 010 = 1 i oddaje cztery zmienne
		-- mamy taka funkcje
		for j, w in ipairs(tests) do
			local a,b,c,s = parse(w)
			-- co tera..
			-- trzeba by przywolac dofile(gates.lua) tam sa zdefiniowane funkcje operatorow logicznych
			-- dobra sprawdzmy czy to sie w ogole trzyma kupy. Czy da sie uruchomic bez bledow
			-- dziala. Wyglada na to, ze nie bedzie trzeba executowac stringow
			-- No to mamy wartosci. Teraz trzeba wykonac te testy..
			-- czyli musi brac funckja(gate1) brac var1 i var2.
			local string = Tablica[i]
			local temp
			temp = string:sub(1,1)
			local var1, var2, var3
			if temp == 'a' then
				var1 = a
			elseif temp == 'b' then
				var1 = b
			else
				var1 = c
			end

			-- fuck, one beda miec rozne indexy. Musze uzywac find spacje. string.find. Albo zmienic przechowywanie na tablice w tablicy. Ta druga opcja jest raczej lepsza.
			-- w tym momencie latwiej zaimplementowac to pierwsze..
			-- OD NOWA
		end
	end
end
print "Success"
-- dobra czyli zgadza sie. Mielismy juz ladne funkcje przygotowane..
