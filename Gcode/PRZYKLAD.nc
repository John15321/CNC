 
GROUP_BEGIN(0,"NAGLOWEK",0,0)
; Naglowek
; G91 - Przelaczenie obrabiarki w prace inkrementalna, czy tez
; przyrostowa, czyli Ja podaje o jaka odleglosc narzedzie ma sie
; przemiescic z aktualnie zajmowanego polozenia - czyli mowi
; frezarce, traktuj wartosci jako wartosci przemieszczenie
; !!! Znac funkcje G94, G95, G96... - funkcje ktore odnosza sie do parametrow technologicznych


; Ustawiamy material zeby nam go pokazywal obrabianego SinuTrain:
; Material: STAL S235 104 X 74 X 32 MM
WORKPIECE(, "",, "BOX", 0, 2, -32, -80, -2, -2, 104, 74)
; 2     => naddatek
; -32   => calkowita wysokosc + (-naddatek)     (Z)
; 104   => calkowita szerokosc                  (X)
; 74    => czerokosc szerokosc                  (Y)

G54             ; Definiujemy wspolrzedne uzyte podczas obroki
G71             ; Definiujemy wymiary w cm
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
T="Glowica_40"  ; MOZNA TEZ ZA POMOCA NUMERKA NP. T1, ALE ROBI
; sie za pomoca nazwy bo tak

; Danie do adresu T danego narzedzia samo z siebie nic wiecej
; nie robi. Musimy maszynie powiedziec zeby to zamontowala
; za pomoca funkcje "M6", M od "Maszyna", aka jest to funkcja
; maszynowa 
M6              ; MONTUJEMY NARZEDZIE

; Oprocz tego ze dajemy jakim ma pracowac narzedziem to jeszcze
; musimy wskazac mu parametry jakimi bedzie to narzedzie pracowac
S1200           ; USTAWIAMY PREDKOSC PRACY WRZECIONA (Z ANG. SPINDE AKA WRZECIONO)
F450            ; ZADAJEMY POSUW (Z ANG. FEED) I ZAOKRAGLAMY DO JEDNOSCI

; Tak samo jak z T samo ustawienie tego nie spowoduje uruchomienia
; obrotow wrzeciona. Tak wiec zeby to odpalic uzywamy znowu
; funkcji maszynowej:
M3              ; M3 TO W PRAWO, A M4 TO W LEWO (KRECENIE), A WYLACZENIE TO M5
M8              ; DODATKOWO MOZEMY WLACZYC CHLODZIWO M8, LUB JE WYLACZYC M9

; DOJAZD DO PRZEDMIOTU OBR
; nastepnie musi tym narzedziem dojechac do przedmiotu obrabianego
; Zakladamy ze po zmianie narzedzia, jestesmy w poblizu magazynu
; z narzedziami
G0 Z100         ; DOJAZD DO PLASZCZYZNY WYCOFANIA
G0 X-25 Y10     ; DOJAZD DO PUNKTU STARTOWEGO DO OBROKI W KIERUNKU XY
G0 Z0           ; DOJAZD DO PRZEDMIOTU W OSI Z - USTAWIENIE GL. SKRAWANIA Ap
 
; RUCHY OBROBCZE
; pozniej nastepuje obrobka
G1 X125         ; 1. RUCH ROBOCZY
G0 Y42          ; USTAWIENIE DO KOLEJNEGO PRZEJSCIA - SZEROKOSC SKRAWANIA Ae
G1 X-25         ; 2. RUCH ROBOCZY
G0 Y74          ; USTAWIENIE DO KOLEJNEGO PRZEJSCIA - SZEROKOSC SKRAWANIA Ae
G1 X125 ;
; ODJAZD OD PRZEDMIOTU OBR
G0 Z100         ; ODJAZD OD PRZEDMIOTU OBRABIANEGO DO PLASZCZYZNY WYCOFANIA
GROUP_END(0,0)


GROUP_BEGIN(0,"FREZOWANIE KONTURU ZEW ZGR",0,0)
; Ponowny
; DOJAZD DO PRZEDMIOTU OBR
; nastepnie musi tym narzedziem dojechac do przedmiotu obrabianego
; Zakladamy ze po zmianie narzedzia, jestesmy w poblizu magazynu
; z narzedziami
T="Frez_walcowy_10" M6 ; Wymieramy nowe narzedzie i go uzywamy
S2000           ; USTAWIAMY PREDKOSC PRACY WRZECIONA
F800            ; ZADAJEMY NOWY POSUW 400
M3              ; USTAWIAMY KIERUNEK KRECENIA SIE NA "W PRAWO"

G0 Z100         ; DOJAZD DO PLASZCZYZNY WYCOFANIA
G0 X-15 Y35     ; DOJAZD DO PUNKTU STARTOWEGO DO OBROKI W KIERUNKU XY
G0 Z-21         ; DOJAZD DO PRZEDMIOTU OBR
G1 X0           ; DOJAZD DO KONTURU
G1 Y75          ; DOJAZD DO LEWEGO GORNEGO NAROZNIKA
G1 X100         ; DOJAZD DO PRAWEGO GORNEGO NAROZNIKA
G1 Y0           ; DOJAZD DO PRAWEGO DOLNEGO NAROZNIKA
G1 X0           ; DOJAZD DO LEWEGO DOLNEGO NAROZNIKA
G1 Y35          ; DOJAZD DO PUNKTU STARTOWEGO
G1 X-15         ; ODJAZD OD KONTURU
G0 Z100         ; ODJAZD OD PRZEDMIOTU OBRABIANEGO DO PL. WYCOFANIA
GROUP_END(0,0)


;               ---------------------------------------------
;               |...........................................|
;               |...........................................|
;               |...........................................|
;               |...........................................|
;               |...........................................|
;               |...........................................|
;               |...........................................|
;               |...........................................|
;               |...........................................|
;               |...........................................|
;               ---------------------------------------------
; G2 - rysowanie łuku
; "CR=2" rysowanie koła podając promieć (w tym przypadku 2 to promiec)


GROUP_BEGIN(0,"FREZOWANIE KONTURU ZEW WYK",0,0)
M30             ; ZAKONCZENIE PROGRAMU, POJSCIE W STANDBY CZY COS TAKIEGO
GROUP_END(0,0)
