 
GROUP_BEGIN(0,"NAGLOWEK",0,0)
; Naglowek
G54 G71 G90 G94
GROUP_END(0,0)
GROUP_BEGIN(0,"PLANOWANIE",0,0)
; NARZEDZIE - Wymiana
T="Glowica_40" M6
S1200 F450 M3 M8
G0 Z100 ; Dojazd do przedmiotu obr - plaszczyzna cofania
G0 X-25 Y10 ; dojazd do przedmiotu obr
G0 Z0 ; dojazd do przedmiotu obr
; RUCHY OBROBCZE
G1 X125 ; ruchy obrobcze
G0 Y42 ; przemieszczenie poza materialem, zeby sie ustawic
G1 X-25 ;
; ODJAZD OD PRZEDMIOTU OBR
G0 Z100 ; plaszczyzna wcofania
GROUP_END(0,0)
GROUP_BEGIN(0,"FREZOWANIE KONTURU ZEW ZGR",0,0)
GROUP_END(0,0)
GROUP_BEGIN(0,"FREZOWANIE KONTURU ZEW WYK",0,0)
M30 ; zakonczenie programu, pojscie w standby
GROUP_END(0,0)
