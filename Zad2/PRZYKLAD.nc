
GROUP_BEGIN(0,"NAGLOWEK",0,0)
; Naglowek
WORKPIECE(,"",,"BOX",0,2,-30,-80,-2,-2,184,170)
; 2     => naddatek
; -30   => calkowita wysokosc                   (Z)
; 184   => szerokosc                            (X)
; 170   => dlugosc                              (Y)

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
T="Glowica_100" ; MOZNA TEZ ZA POMOCA NUMERKA NP. T1, ale tak mozemy
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
G0 Z0           ; DOJAZD DO PRZEDMIOTU W OSI Z

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
; DOJAZD DO PRZEDMIOTU OBR
T="Frez_walcowy_12" M6 ; Wybieramy nowe narzedzie i go uzywamy
S3710           ; USTAWIAMY PREDKOSC PRACY WRZECIONA - predkosc obrotowa
F696            ; ZADAJEMY posuw minutowy
M3              ; USTAWIAMY KIERUNEK KRECENIA SIE NA "W PRAWO"
G0 Z100         ; DOJAZD DO PLASZCZYZNY WYCOFANIA
G0 X-11 Y-11    ; DOJAZD DO PUNKTU STARTOWEGO DO OBROKI W KIERUNKU XY
G0 Z-19         ; DOJAZD DO PRZEDMIOTU W OSI Z

G0 G41 X0
G1 Y166
G1 X180
G1 Y0
G1 X0

G0 X-11 Y-11
G0 G40 Z100     ; ODJAZD OD PRZEDMIOTU OBRABIANEGO DO PL. WYCOFANIA
GROUP_END(0,0)

GROUP_BEGIN(0,"FREZOWANIE WYKONCZENIOWE KONTURU ZEWNETRZNEGO",0,0)
; Ponowny
; DOJAZD DO PRZEDMIOTU OBR
T="Frez_walcowy_12" M6 ; Wybieramy nowe narzedzie i go uzywamy
S3710           ; USTAWIAMY PREDKOSC PRACY WRZECIONA - predkosc obrotowa
F696            ; ZADAJEMY posuw minutowy
M3              ; USTAWIAMY KIERUNEK KRECENIA SIE NA "W PRAWO"
G0 Z100         ; DOJAZD DO PLASZCZYZNY WYCOFANIA
G0 X-11 Y-11    ; DOJAZD DO PUNKTU STARTOWEGO DO OBROKI W KIERUNKU XY
G0 Z-19         ; DOJAZD DO PRZEDMIOTU W OSI Z

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



GROUP_BEGIN(0,"FREZOWANIE ZGRUBNE WYSPY",0,0)
; DOJAZD DO PRZEDMIOTU OBR
T="Frez_walcowy_20" M6 ; Wybieramy nowe narzedzie i go uzywamy
S2240           ; USTAWIAMY PREDKOSC PRACY WRZECIONA - predkosc obrotowa
F535            ; ZADAJEMY posuw minutowy
M3              ; USTAWIAMY KIERUNEK KRECENIA SIE NA "W PRAWO"
G0 Z100         ; DOJAZD DO PLASZCZYZNY WYCOFANIA
G0 X-11 Y-11    ; DOJAZD DO PUNKTU STARTOWEGO DO OBROKI W KIERUNKU XY
G0 Z-12         ; DOJAZD DO PRZEDMIOTU W OSI Z

; Wycinamy lewy pas
G1 G41 X16
G1 Y156

; Wycinamy gorny pas
G1 X175

; Wycinamy prawy pas
G1 X175
G1 Y10

; Wycinamy dolny pas
G1 X0


; Robimy kilka kolejnych okrazen zeby wszystko zebrac
G1 Y166
G1 X68
G1 Y146
G1 X180

G1 Y35
G1 Y0 X150
G1 X81 Y0

G1 Y25 X0

G1 Y166
G1 X95
G1 Y135
G1 X180

G1 Y130
G1 X165
G1 X180
G1 Y0
G1 X0


; Kolejne podejscie do zgrubnego scinania, ale tym razem obchodzmy wyspe
; sama w sobie uzywajac jej jako odniesienia
TRANS X17 Y38
AROT Z-14
G0 X-15 Y8
G0 Z-12
G1 G41 X0
G1 Y90
G2 X16 Y106 J16
G1 X110
G1 X136 ANG=-14
G1 Y24.5
G1 X130.5 Y19
G1 X124.5 RND=20
G1 Y0 RND=20
G1 X0
TRANS X0 Y0

G1 G40 X-15 Y8
G0 G40 Z100     ; ODJAZD OD PRZEDMIOTU OBRABIANEGO DO PL. WYCOFANIA
GROUP_END(0,0)




GROUP_BEGIN(0,"FREZOWANIE WYKONCZENIOWE WYSPY",0,0)
; DOJAZD DO PRZEDMIOTU OBR
T="Frez_walcowy_6" M6 ; Wybieramy nowe narzedzie i go uzywamy
S9550           ; USTAWIAMY PREDKOSC PRACY WRZECIONA - predkosc obrotowa
F573            ; ZADAJEMY posuw minutowy
M3              ; USTAWIAMY KIERUNEK KRECENIA SIE NA "W PRAWO"
G0 Z100         ; DOJAZD DO PLASZCZYZNY WYCOFANIA
G0 X-11 Y-11    ; DOJAZD DO PUNKTU STARTOWEGO DO OBROKI W KIERUNKU XY
G0 Z-12         ; DOJAZD DO PRZEDMIOTU W OSI Z

TRANS X17 Y38
AROT Z-14

G1 G41 X0 Y0
G1 Y92 RND=6 
G2 X14 Y106 CR=-14 RND=6
G1 X106 RND=27
G1 X136 ANG=-14 RND=6
G1 Y24.5
G1 Y19 X130.5

G1 X119 RND=6
G1 Y0 RND=13
G1 X6
G1 X0 Y6

G0 X-10 Y6
G0 G40 Z100     ; ODJAZD OD PRZEDMIOTU OBRABIANEGO DO PL. WYCOFANIA
TRANS X0 Y0
GROUP_END(0,0)



GROUP_BEGIN(0,"Kieszeń - okrąg - frezowanie zgrubne",0,0)
T="Frez_walcowy_16"
M6 
S796
M3
M8
G0 Z100
TRANS X17 Y38
AROT Z-14
POCKET4(100,0,2,-16,27,53,53,2.5,0.5,0,0.1,0.1,0,1011,50,9,15,0,2,0,1,2,10100,111,111)
TRANS
GROUP_END(0,0)
GROUP_BEGIN(0,"Kieszeń - okrąg - frezowanie wykończeniowe",0,0)
T="Frez_walcowy_10"
M6 
S10000
M3
M8
G0 Z100
TRANS X17 Y38
AROT Z-14
POCKET4(100,0,2,-16,27,53,53,4,0.5,0,0.1,0.1,0,14,50,9,15,0,2,0,1,2,10100,111,111)
G0 Z100
TRANS
GROUP_END(0,0)
GROUP_BEGIN(0,"Kieszeń prostokątna - frezowanie zgrubne",0,0)
T="Frez_walcowy_10"
M6 
S10000
M3
M8
G0 Z100
TRANS X17 Y38
AROT Z-14

POCKET3(100,0,2,-10,69,45,6,53,53,28,4,0.1,0.1,0.1,0.1,0,11,3,8,3,15,0,2,0,1,2,11100,11,101)
G0 Z100
TRANS
GROUP_END(0,0)
GROUP_BEGIN(0,"Kieszeń prostokątna - frezowanie wykończeniowe",0,0)

T="Frez_walcowy_10"
M6 
S10000
M3
M8
G0 Z100
TRANS X17 Y38
AROT Z-14
POCKET3(100,0,2,-10,69,45,6,53,53,28,4,0.1,0.1,0.1,0.1,0,14,3,8,3,15,0,2,0,1,2,11100,11,101)
G0 Z100
TRANS
GROUP_END(0,0)
GROUP_BEGIN(0,"Obróbka otworów - nawiercenie wszystkich otworów",0,0)
T="Nawiertak_6_K90"
M6
F568
S5570
M3
M8


MCALL CYCLE81(100,0,1,1.5,,0,10,1,11)
WYSP: HOLES1(139,97,-90,0,14,3,,0,,,1)
MCALL

TRANS X17 Y38
AROT Z-14
MCALL CYCLE81(100,-10,1,1.5,,0,10,1,11)
kieszen: HOLES2(53,53,19.5,73,30,4,1000,0,,,1)
MCALL
TRANS

MCALL CYCLE81(100,-12,1,1.5,,0,10,1,11)
duze: CYCLE801(12,12,0,156,142,2,2,1,0,0,0,,,1)
MCALL

MCALL CYCLE81(100,-12,1,1.5,,0,10,1,11)
male: CYCLE801(68,146,-14,9,7,3,2,0,0,0,0,,,1)
MCALL
G0 Z100
GROUP_END(0,0)
GROUP_BEGIN(0,"Obróbka otworów - wwiercenie 3.3",0,0)
T="Wiertlo_3.3_5xD"
M6
F338
S6750
M3
M8
G0 Z100
MCALL CYCLE82(100,-12,1,,-44,0,10,1,11)
REPEATB male ;#SM
MCALL
G0 Z100
GROUP_END(0,0)
GROUP_BEGIN(0,"Obróbka otworów - wwiercenie 4.2",0,0)
T="Wiertlo_4.2_5D"
M6
F338
S6750
M3
M8
G0 Z100
MCALL CYCLE82(100,0,1,,-14,0,10,1,11)
REPEATB wysp ;#SM
MCALL
TRANS X17 Y38
AROT Z-14
MCALL CYCLE82(100,-10,1,-44,,0,10,1,12)
REPEATB kieszen ;#SM
MCALL
TRANS
G0 Z100

GROUP_END(0,0)
GROUP_BEGIN(0,"Obróbka otworów - wwiercenie 6.6",0,0)
T="Wiertlo_6.8_5xD"
M6
F236
S3380
M3
M8
G0 Z100

MCALL CYCLE82(100,-12,1,-44,,0,10,1,12)
REPEATB duze ;#SM
MCALL

G0 Z100
GROUP_END(0,0)
GROUP_BEGIN(0,"Obróbka otworów - pogłębienie stożkowe x4",0,0)
T="Poglebiacz_16_K90"
M6
F416
S2130
M3
M8



MCALL CYCLE81(100,0,1,5.05,,0,10,1,11)
REPEATB wysp ;#SM
MCALL

TRANS X17 Y38
AROT Z-14
MCALL CYCLE81(100,-10,1,5.05,,0,10,1,11)
REPEATB kieszen ;#SM
MCALL
TRANS

MCALL CYCLE81(100,-12,1,13.44,,0,10,1,11)
REPEATB duze ;#SM
MCALL

MCALL CYCLE81(100,-12,1,4.05,,0,10,1,11)
REPEATB male ;#SM
MCALL
GROUP_END(0,0)
GROUP_BEGIN(0,"Obróbka otworów - gwintowanie M4",0,0)
T="Gwintownik_M4"
M6
S2230
M3
M8

MCALL CYCLE840(100,-12,1,-34.1,,0,0,5,20,,0.7,0,1,0,,"ISO_METRIC","M4",,1001,2)
REPEATB male ;#SM
MCALL
G0 Z100

GROUP_END(0,0)
GROUP_BEGIN(0,"Obróbka otworów - gwintowanie M5",0,0)
T="Gwintownik_M5"
M6
S828
M3
M8

MCALL CYCLE840(100,0,1,-12.4,,0,0,5,20,,0.8,0,1,0,,"ISO_METRIC","M5",,1001,2)
REPEATB wysp ;#SM
MCALL

T="Gwintownik_M5"
M6
S828
M3
M8
TRANS X17 Y38
AROT Z-14
MCALL CYCLE840(100,-10,1,-34.4,,0,0,5,20,,0.8,0,1,0,,"ISO_METRIC","M5",,1001,2)
REPEATB kieszen ;#SM
MCALL
TRANS
G0 Z100
GROUP_END(0,0)


GROUP_BEGIN(0,"KONIEC PROGRAMU",0,0)
M30             ; ZAKONCZENIE PROGRAMU
GROUP_END(0,0)
