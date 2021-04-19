 
GROUP_BEGIN(0,"NAGLOWEK",0,0)
; Naglowek
; G71 - Definiuje wymiary w cm
; G54 - Definiujemy wspolrzedne uzyte podczas obroki
; G90 - Powoduje ze wprowadzane przez programiste wymiary 
; sa traktowane jako absolutne polozenia w stosunku do zera w tym
; wybranym ukladzie wspolrzednych, czyli podaje konkretne punkty 
; w przestrzeni i ich koordynaty - czyli mowi, traktuj wartosci
; jako koordynaty ktore ci podaje
; G91 - Przelaczenie obrabiarki w prace inkrementalna, czy tez
; przyrostowa, czyli Ja podaje o jaka odleglosc narzedzie ma sie
; przemiescic z aktualnie zajmowanego polozenia - czyli mowi
; frezarce, traktuj wartosci jako wartosci przemieszczenie
;!!! Znac funkcje G94,95,96... - funkcje ktore odnosza sie do parametrow technologicznych
; G94 - ustawia obrabiarke w taki sposob ze wartosci podawane
; odnosnie pracy wrzeciona czy posuwu sa interpretowane jako , w
; wypadku wrzeciona -> predkosc obrotowa,
; i w wypadku posuwu jako posuw minutowy.
; Oprocz tego mozemy inne wartosci stosowac, mozemy stosowac
; predkosc skrawania, posuw na zab, posuw na obrot w zwiazku z
; czym to trzeba tez zdefniowac
G54 G71 G90 G94

GROUP_END(0,0)
GROUP_BEGIN(0,"PLANOWANIE",0,0)
; NARZEDZIE - Wymiana
; wskazujemy jakiego narzedzia chcemy uzywac, obrabiarka
; pobierze to narzedzie z magazynu narzedziowego

; Wskazujemy narzedzie za pomoca adresu "T" od tool
; narzedzie mozemy wskazac po numerze tego narzedzia w magazynie
; (to cos co ustawialismy)
T="Glowica_40" ; Mozna tez za pomoca numerka np. T1, ale robi
; sie za pomoca nazwy bo tak

; Danie do adresu T danego narzedzia samo z siebie nic wiecej
; nie robi. Musimy maszynie powiedziec zeby to zamontowala
; za pomoca funkcje "M6", M od "Maszyna", aka jest to funkcja
; maszynowa 
M6

; Oprocz tego ze dajemy jakim ma pracowac narzedziem to jeszcze
; musimy wskazac mu parametry jakimi bedzie to narzedzie pracowac

; Ustawiamy Predkosc pracy wrzeciona (z ang. Spinde aka wrzeciono)
S1200

; Zadajemy posuw (z ang. Feed)
F450 ; zaokraglamy do jednosci

; Tak samo jak z T samo ustawienie tego nie spowoduje uruchomienia
; obrotow wrzeciona. Tak wiec zeby to odpalic uzywamy znowu
; funkcji maszynowej:
M3 ; M3 to w prawo, a M4 to w lewo (krecenie), a wylaczenie to M5
; dodatkowo mozemy wlaczyc chlodziwo M8, lub je wylaczyc M9
M8


; DOJAZD DO PRZEDMIOTU OBR
; nastepnie musi tym narzedziem dojechac do przedmiotu obrabianego
; Zakladamy ze po zmianie narzedzia, jestesmy w poblizu magazynu
; z narzedziami (aka chuj wie gdzie).

G0 Z100 ; Dojazd do przedmiotu obr - plaszczyzna cofania
G0 X-25 Y10 ; dojazd do przedmiotu obr
G0 Z0 ; dojazd do przedmiotu obra
 
; RUCHY OBROBCZE
; pozniej nastepuje obrobka
G1 X125 ; ruchy obrobcze
G0 Y42 ; przemieszczenie poza materialem, zeby sie ustawic
G1 X-25 ;


; ODJAZD OD PRZEDMIOTU OBR
G0 Z100 ; plaszczyzna wcofania


GROUP_END(0,0)
GROUP_BEGIN(0,"FREZOWANIE KONTURU ZEW ZGR",0,0)



GROUP_END(0,0)
GROUP_BEGIN(0,"FREZOWANIE KONTURU ZEW WYK",0,0)
M30 ; zakonczenie programu, pojscie w standby czy cos takiego


GROUP_END(0,0)
