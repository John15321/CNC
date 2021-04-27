 
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


GROUP_BEGIN(0,"SKRAWANIE GORNE",0,0)
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
G1 Y221
G0 X78
G1 Y-55
G0 X132
G1 Y221
G0 X184
; ODJAZD OD PRZEDMIOTU OBR
G0 Y221
G0 Z100         ; ODJAZD OD PRZEDMIOTU OBRABIANEGO DO PLASZCZYZNY WYCOFANIA
GROUP_END(0,0)


GROUP_BEGIN(0,"FREZOWANIE ZGRUBNE KONTURU ZEWNETRZNEGO",0,0)
; Ponowny
; DOJAZD DO PRZEDMIOTU OBR
; nastepnie musi tym narzedziem dojechac do przedmiotu obrabianego
; Zakladamy ze po zmianie narzedzia, jestesmy w poblizu magazynu
; z narzedziami
T="Frez_walcowy_12" M6 ; Wymieramy nowe narzedzie i go uzywamy
S3710           ; USTAWIAMY PREDKOSC PRACY WRZECIONA - predkosc obrotowa
F696            ; ZADAJEMY posuw minutowy
M3              ; USTAWIAMY KIERUNEK KRECENIA SIE NA "W PRAWO"
G0 Z100         ; DOJAZD DO PLASZCZYZNY WYCOFANIA
G0 X-11 Y-11     ; DOJAZD DO PUNKTU STARTOWEGO DO OBROKI W KIERUNKU XY
G0 Z-19           ; DOJAZD DO PRZEDMIOTU W OSI Z - USTAWIENIE GL. SKRAWANIA Ap

G0 G41 X0
G1 Y166
G1 X180
G1 Y0
G1 X0

G0 X-11 Y-11
G0 G40 Z100         ; ODJAZD OD PRZEDMIOTU OBRABIANEGO DO PL. WYCOFANIA
GROUP_END(0,0)

GROUP_BEGIN(0,"FREZOWANIE WYKONCZENIOWE KONTURU ZEWNETRZNEGO",0,0)
; Ponowny
; DOJAZD DO PRZEDMIOTU OBR
; nastepnie musi tym narzedziem dojechac do przedmiotu obrabianego
; Zakladamy ze po zmianie narzedzia, jestesmy w poblizu magazynu
; z narzedziami
T="Frez_walcowy_12" M6 ; Wymieramy nowe narzedzie i go uzywamy
S3710           ; USTAWIAMY PREDKOSC PRACY WRZECIONA - predkosc obrotowa
F696            ; ZADAJEMY posuw minutowy
M3              ; USTAWIAMY KIERUNEK KRECENIA SIE NA "W PRAWO"
G0 Z100         ; DOJAZD DO PLASZCZYZNY WYCOFANIA
G0 X-11 Y-11     ; DOJAZD DO PUNKTU STARTOWEGO DO OBROKI W KIERUNKU XY
G0 Z-19           ; DOJAZD DO PRZEDMIOTU W OSI Z - USTAWIENIE GL. SKRAWANIA Ap

; Lewe gorne zaokraglenie
G0 G41 X0
G1 Y164
G2 X2 Y166 CR=2

; Prawe gorne sciecie
G1 X174
G1 X180 Y160

; Prawe dolne zaokraglenie
G1 X180 Y2
G2 X178 Y0 CR=2

; Lewe dolne sciencie
G1 X6 Y0
G1 X0 Y6

G0 X-15 Y83
G0 G40 Z100     ; ODJAZD OD PRZEDMIOTU OBRABIANEGO DO PL. WYCOFANIA
GROUP_END(0,0)

; DOJAZD DO PRZEDMIOTU OBR
; nastepnie musi tym narzedziem dojechac do przedmiotu obrabianego
; Zakladamy ze po zmianie narzedzia, jestesmy w poblizu magazynu
; z narzedziami
T="Frez_walcowy_20" M6 ; Wymieramy nowe narzedzie i go uzywamy
S2240           ; USTAWIAMY PREDKOSC PRACY WRZECIONA - predkosc obrotowa
F535            ; ZADAJEMY posuw minutowy
M3              ; USTAWIAMY KIERUNEK KRECENIA SIE NA "W PRAWO"
G0 Z100         ; DOJAZD DO PLASZCZYZNY WYCOFANIA
G0 X-11 Y-11    ; DOJAZD DO PUNKTU STARTOWEGO DO OBROKI W KIERUNKU XY
G0 Z-19         ; DOJAZD DO PRZEDMIOTU W OSI Z - USTAWIENIE GL. SKRAWANIA Ap

GROUP_BEGIN(0,"FREZOWANIE ZGRUBNE WYSPY",0,0)



GROUP_END(0,0)

GROUP_BEGIN(0,"FREZOWANIE KONTURU ZEW WYK",0,0)
M30             ; ZAKONCZENIE PROGRAMU, POJSCIE W STANDBY CZY COS TAKIEGO
GROUP_END(0,0)
