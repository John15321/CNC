 
GROUP_BEGIN(0,"NAGLOWEK",0,0)
; Naglowek
; G91 - Przelaczenie obrabiarki w prace inkrementalna, czy tez
; przyrostowa, czyli Ja podaje o jaka odleglosc narzedzie ma sie
; przemiescic z aktualnie zajmowanego polozenia - czyli mowi
; frezarce, traktuj wartosci jako wartosci przemieszczenie
; !!! Znac funkcje G94, G95, G96... - funkcje ktore odnosza sie do parametrow technologicznych


G54             ; Definiujemy wspolrzedne uzyte podczas obroki
G71             ; Definiuje wymiary w cm
G90             ; Powoduje ze wprowadzane przez programiste wymiary 
; sa traktowane jako absolutne polozenia w stosunku do zera w tym
; wybranym ukladzie wspolrzednych, czyli podaje konkretne punkty 
; w przestrzeni i ich koordynaty - czyli mowi, traktuj wartosci
; jako koordynaty ktore ci podaje
G94             ; Ustawia obrabiarke w taki sposob ze wartosci podawane
; odnosnie pracy wrzeciona czy posuwu sa interpretowane jako , w
; wypadku wrzeciona -> predkosc obrotowa,
; i w wypadku posuwu jako posuw minutowy.
; Oprocz tego mozemy inne wartosci stosowac, mozemy stosowac
; predkosc skrawania, posuw na zab, posuw na obrot w zwiazku z
; czym to trzeba tez zdefniowac
GROUP_END(0,0)


GROUP_BEGIN(0,"PLANOWANIE",0,0)
; NARZEDZIE - Wymiana
; wskazujemy jakiego narzedzia chcemy uzywac, obrabiarka
; pobierze to narzedzie z magazynu narzedziowego

; Wskazujemy narzedzie za pomoca adresu "T" od tool
; narzedzie mozemy wskazac po numerze tego narzedzia w magazynie
; (to cos co ustawialismy)
T="Glowica_40"  ; Mozna tez za pomoca numerka np. T1, ale robi
; sie za pomoca nazwy bo tak

; Danie do adresu T danego narzedzia samo z siebie nic wiecej
; nie robi. Musimy maszynie powiedziec zeby to zamontowala
; za pomoca funkcje "M6", M od "Maszyna", aka jest to funkcja
; maszynowa 
M6              ; Montujemy narzedzie

; Oprocz tego ze dajemy jakim ma pracowac narzedziem to jeszcze
; musimy wskazac mu parametry jakimi bedzie to narzedzie pracowac

S1200           ; Ustawiamy Predkosc pracy wrzeciona (z ang. Spinde aka wrzeciono)
F450            ; Zadajemy posuw (z ang. Feed) i zaokraglamy do jednosci

; Tak samo jak z T samo ustawienie tego nie spowoduje uruchomienia
; obrotow wrzeciona. Tak wiec zeby to odpalic uzywamy znowu
; funkcji maszynowej:
M3              ; M3 to w prawo, a M4 to w lewo (krecenie), a wylaczenie to M5
M8              ; dodatkowo mozemy wlaczyc chlodziwo M8, lub je wylaczyc M9



; DOJAZD DO PRZEDMIOTU OBR
; nastepnie musi tym narzedziem dojechac do przedmiotu obrabianego
; Zakladamy ze po zmianie narzedzia, jestesmy w poblizu magazynu
; z narzedziami

G0 Z100         ; Dojazd do przedmiotu obr - plaszczyzna cofania
G0 X-25 Y10     ; dojazd do przedmiotu obr
G0 Z0           ; dojazd do przedmiotu obra
 
; RUCHY OBROBCZE
; pozniej nastepuje obrobka
G1 X125         ; ruchy obrobcze
G0 Y42          ; przemieszczenie poza materialem, zeby sie ustawic
G1 X-25         ;

; ODJAZD OD PRZEDMIOTU OBR
G0 Z100         ; plaszczyzna wcofania
GROUP_END(0,0)


GROUP_BEGIN(0,"FREZOWANIE KONTURU ZEW ZGR",0,0)
; Ponowny
; DOJAZD DO PRZEDMIOTU OBR
; nastepnie musi tym narzedziem dojechac do przedmiotu obrabianego
; Zakladamy ze po zmianie narzedzia, jestesmy w poblizu magazynu
; z narzedziami
T="Frez_walcowy_10" M6 ;
F400
S1200
M3

G0 Z100         ; Dojazd do przedmiotu obr - plaszczyzna cofania
G0 X-25 Y35     ; dojazd do przedmiotu obr
G0 Z-21         ; dojazd do przedmiotu obrabianego
G1 X0           ; DOJAZD DO KONTURU
G1 Y70          ; DOJAZD DO LEWEGO GORNEGO NAROZNIKA
G1 X100         ; DOJAZD DO PRAWEGO GORNEGO NAROZNIKA
G1 Y0           ; DOJAZD DO PRAWEGO DOLNEGO NAROZNIKA
G1 X0           ; DOJAZD DO LEWEGO DOLNEGO NAROZNIKA
G1 Y35          ; DOJAZD DO PUNKTU STARTOWEGO
G1 X-15         ; ODJAZD OD KONTURU
G0 Z100         ; ODJAZD OD PRZEDMIOTU OBRABIANEGO DO PL. WYCOFANIA
GROUP_END(0,0)



GROUP_BEGIN(0,"FREZOWANIE KONTURU ZEW WYK",0,0)
M30             ; zakonczenie programu, pojscie w standby czy cos takiego
GROUP_END(0,0)
