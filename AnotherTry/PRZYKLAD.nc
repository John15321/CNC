 
GROUP_BEGIN(0,"NAGLOWEK",0,0)
; Naglowek
WORKPIECE(,"",,"BOX",0,2,-30,-80,-2,-2,184,170)
; 2     => naddatek
; -30   => calkowita wysokosc + (-naddatek)     (Z)
; 184   => calkowita szerokosc                  (X)
; 170   => czerokosc szerokosc                 (Y)

G54             ; Definiujemy wspolrzedne uzyte podczas obroki
G71             ; Definiujemy wymiary w cm
G90             ; Wymiary w stosunku do zera
G94             ; Ustawia obrabiarke w taki sposob ze wartosci podawane
GROUP_END(0,0)


GROUP_BEGIN(0,"Skrawanie_gorne",0,0)
; Usuwamy gorny naddatek wysokosci 2mm


; NARZEDZIE - Wymiana
; wskazujemy jakiego narzedzia chcemy uzywac, obrabiarka
; pobierze to narzedzie z magazynu narzedziowego

; Wskazujemy narzedzie za pomoca adresu "T" od tool
; narzedzie mozemy wskazac po numerze tego narzedzia w magazynie
; (to cos co ustawialismy)
T="Glowica_100"  ; MOZNA TEZ ZA POMOCA NUMERKA NP. T1, ale tak mozemy
;                 po prostu podac nazwe

; Danie do adresu T danego narzedzia samo z siebie nic wiecej
; nie robi. Musimy maszynie powiedziec zeby to zamontowala
M6              ; MONTUJEMY NARZEDZIE

; Oprocz tego ze ustawiamy jakim ma pracowac narzedziem to jeszcze
; musimy wskazac mu parametry jakimi bedzie to narzedzie pracowac
S1200           ; USTAWIAMY PREDKOSC PRACY WRZECIONA -
; predkosc (obrotowa) [min.-1 lub mm/min] - predkosc obrotowa
F4370           ; ZADAJEMY POSUW MINUTOWY [mm/min] I ZAOKRAGLAMY DO JEDNOSCI

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
G0 X28 Y-55     ; DOJAZD DO PUNKTU STARTOWEGO DO OBROKI W KIERUNKU XY
G0 Z0           ; DOJAZD DO PRZEDMIOTU W OSI Z - USTAWIENIE GL. SKRAWANIA Ap
 
; RUCHY OBROBCZE
; pozniej nastepuje obrobka
G1 Y221         ; RUCH ROBOCZY
G0 X78         ; RUCH ROBOCZY
G1 Y-55          ; USTAWIENIE DO KOLEJNEGO PRZEJSCIA - SZEROKOSC SKRAWANIA Ae
G0 X132         ; RUCH ROBOCZY
G1 Y221          ; USTAWIENIE DO KOLEJNEGO PRZEJSCIA - SZEROKOSC SKRAWANIA Ae
G0 X184 ;
; ODJAZD OD PRZEDMIOTU OBR
G0 Y221
G0 Z100         ; ODJAZD OD PRZEDMIOTU OBRABIANEGO DO PLASZCZYZNY WYCOFANIA
GROUP_END(0,0)


; GROUP_BEGIN(0,"FREZOWANIE KONTURU ZEW ZGR",0,0)
; ; Ponowny
; ; DOJAZD DO PRZEDMIOTU OBR
; ; nastepnie musi tym narzedziem dojechac do przedmiotu obrabianego
; ; Zakladamy ze po zmianie narzedzia, jestesmy w poblizu magazynu
; ; z narzedziami
; T="Frez_walcowy_10" M6 ; Wymieramy nowe narzedzie i go uzywamy
; S2000           ; USTAWIAMY PREDKOSC PRACY WRZECIONA
; F800            ; ZADAJEMY NOWY POSUW 400
; M3              ; USTAWIAMY KIERUNEK KRECENIA SIE NA "W PRAWO"

; G0 Z100         ; DOJAZD DO PLASZCZYZNY WYCOFANIA
; G0 X-15 Y35     ; DOJAZD DO PUNKTU STARTOWEGO DO OBROKI W KIERUNKU XY
; G0 Z-21         ; DOJAZD DO PRZEDMIOTU OBR
; G1 X0           ; DOJAZD DO KONTURU
; G1 Y75          ; DOJAZD DO LEWEGO GORNEGO NAROZNIKA
; G1 X100         ; DOJAZD DO PRAWEGO GORNEGO NAROZNIKA
; G1 Y0           ; DOJAZD DO PRAWEGO DOLNEGO NAROZNIKA
; G1 X0           ; DOJAZD DO LEWEGO DOLNEGO NAROZNIKA
; G1 Y35          ; DOJAZD DO PUNKTU STARTOWEGO
; G1 X-15         ; ODJAZD OD KONTURU
; G0 Z100         ; ODJAZD OD PRZEDMIOTU OBRABIANEGO DO PL. WYCOFANIA
; GROUP_END(0,0)


; ;               ---------------------------------------------
; ;               |...........................................|
; ;               |...........................................|
; ;               |...........................................|
; ;               |...........................................|
; ;               |...........................................|
; ;               |...........................................|
; ;               |...........................................|
; ;               |...........................................|
; ;               |...........................................|
; ;               |...........................................|
; ;               ---------------------------------------------
; ; G2 - rysowanie łuku
; ; "CR=2" rysowanie koła podając promieć (w tym przypadku 2 to promiec)


GROUP_BEGIN(0,"FREZOWANIE KONTURU ZEW WYK",0,0)
M30             ; ZAKONCZENIE PROGRAMU, POJSCIE W STANDBY CZY COS TAKIEGO
GROUP_END(0,0)
