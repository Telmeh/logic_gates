-- Program znajdujacy optymalna liczbe bramek

-- Global variables
Variables = {'a', 'b', 'c'}
Gates = {"and", "nand", "nor", "or", "xor"}
Tests = {"000=0","001=1","010=0","011=0","100=1","101=1","110=1","111=1"}

-- Functions. Given two booleans, return one boolean
AND, NAND, NOR, OR, XOR = dofile("logical_functions.lua")

-- Table. Stores all possible permutations of tables like {'b',"nor",'c',"and",'c'} 
Statements = dofile("permuations.lua")

-- Function. Given '010=1' returns a,b,c,s with correct boolean values
translate = dofile("translate.lua")

-- Function. Given a, b, c, table returns assigned values of var1, var2, var3. table is a field of Statements.
assign = dofile("assign.lua")

-- Teraz trzeba zaczac uzywac funkcji logicznych. I tym razem to juz chyba nie bedzie zadna funkcja tylko petla w mainie.
-- Po czym iterujemy? Chyba to co wlasnie usunalem. ipairs(Statements).
-- Musimy isc po.. I dla kazdego sprawdzac testy. Tlumaczeniem testow zajmuje sie.. translate(). A assign() tlumaczy statements. Assign musi byc po translate. Dobra, czyli bedzie petla isc przez 700 przypadkow statements. I dla kazdego statement najpierw przypisze odpowiednie a,b,c dla testu1. Potem vary dostana odpowiednie booliany wedlug wartosci a,b,c. Na koniec jesli wynik bedzie rozny od s, to przerywamy petle testow i idziemy do kolejnego statement. Petla zewnetrzna to beda statements, a petla wewnetrzna to beda tests. Dobra, a jaki bedzie output. Chcialem kolorow uzywac dla oszczednosci miejsca.

-- teraz wystarczy printf(color) by zmienic kolor

-- Dobra, to mamy do formatowania. No dobra, to jak duzo chcemy zeby displayowal? Na poczatku chociaz? Czy wszystkie statements (700) x tests(8)? To raczej bez sensu. Generalnie statements, ktore sa tablicami powinny byc displayowane obok siebie, a nie kazda na osobnej linijce. I teraz jesli jest dobrze, to displayuje statement na zielono. A jesli zle to na czerwono. Wiekszosc bedzie na czerwono oczywiscie. Sukcesem bedzie, jesli chociaz jeden bedzie na zielono. A jak bedziemy sprawdzac czy wszystko dziala jak powinno? Wywolujac losowe statements. I wtedy niech pokazuje poszczegolne. Powinienem chyba zauplodowac do githuba 'working example'. Czyli te skladajace sie z 4 bramek.
-- Zrobione.
-- Losowo czyli w sensie bede sam typowal jakies liczby. Sprawdzal ktores. Czyli chyba nawet bez kolorow. Nie wiem. Kolory na pewno sie przydadza przy post-finishu. Zeby displayowac udane testy na zielono, a bledne na czerwono. Taki debug.
-- A na razie przed post-finishem bedzie finish. I na finishu chyba pokazemy tylko udane.
-- Chyba zrobimy gates3.lua, taki z minimalna liczba komentarzy.
-- Dobra czyli display bedzie wygladal tak. Bo druga opcja finishu jest taka, by pokazac 700 przypadkow bez enterow i udane zeby byly na zielono. Ale latwiej bedzie (i to jest raczej lepsza opcja na teraz) pokazac tylko udane przypadki. Wtedy piszemy liczbe porzadkowa albo najlepiej piszemy wyrazenie. Typu "b xor c and b".
-- Nie pamietam jak sie one nazywaly. Ale to chyba bylo Statements = dofile("permutations.lua"). Tablica tablic. Kazda komorka Statements zawiera tablice typu { 'b', "xor", 'c', "nand", 'b'}.

-- Funkcja drukujaca wszystkie pola danej tablicy
printab = dofile("print_table.lua")

-- Dobra, mamy printab. Teraz jakas funkcja check()?
-- Ja pierdole. Nie pamietam czym sa var1, var2, var3. To sa odpowiednio pola jeden, trzy, piec tablicy z tego co pamietam.
-- Moze trzeba by funkcje() given { true, "and", false, "xor", true} returns true or false. Nom, trzeba.
-- To jak sie bedzie nazywac? Bierze table. calculate().

-- Function. Given {true, "xor", false, "and", true} returns true or false.
calculate = dofile "calculate.lua"
