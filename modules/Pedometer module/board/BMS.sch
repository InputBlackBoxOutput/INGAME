EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 3
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:R_Small_US R17
U 1 1 619958ED
P 2425 4200
F 0 "R17" H 2493 4246 50  0000 L CNN
F 1 "1k" H 2493 4155 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" H 2425 4200 50  0001 C CNN
F 3 "~" H 2425 4200 50  0001 C CNN
	1    2425 4200
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D4
U 1 1 61995CCB
P 2425 4550
F 0 "D4" V 2464 4432 50  0000 R CNN
F 1 "LED-RED" V 2373 4432 50  0000 R CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2425 4550 50  0001 C CNN
F 3 "~" H 2425 4550 50  0001 C CNN
	1    2425 4550
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2425 4300 2425 4400
$Comp
L Device:R_Small_US R19
U 1 1 619979BF
P 3125 4200
F 0 "R19" H 3193 4246 50  0000 L CNN
F 1 "1k" H 3193 4155 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" H 3125 4200 50  0001 C CNN
F 3 "~" H 3125 4200 50  0001 C CNN
	1    3125 4200
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D5
U 1 1 619979C5
P 3125 4550
F 0 "D5" V 3164 4432 50  0000 R CNN
F 1 "LED-BLUE" V 3073 4432 50  0000 R CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3125 4550 50  0001 C CNN
F 3 "~" H 3125 4550 50  0001 C CNN
	1    3125 4550
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3125 4300 3125 4400
Wire Wire Line
	3125 4700 3125 4850
Wire Wire Line
	2425 4000 2425 4100
Wire Wire Line
	3125 4000 3125 4100
Wire Wire Line
	2425 4700 2425 4850
Wire Wire Line
	2425 4850 2775 4850
Wire Wire Line
	3125 4850 3475 4850
Text Label 2775 4850 2    50   ~ 0
CHRG
Text Label 3475 4850 2    50   ~ 0
STDBY
Wire Wire Line
	6550 4350 6900 4350
Text Label 6900 4350 2    50   ~ 0
CHRG
Wire Wire Line
	6550 4250 6900 4250
Text Label 6900 4250 2    50   ~ 0
STDBY
Wire Wire Line
	6700 3850 6700 3950
Wire Wire Line
	6550 3950 6700 3950
Wire Wire Line
	5250 4450 5250 4600
$Comp
L power:GND #PWR034
U 1 1 6199BAE9
P 5100 4300
F 0 "#PWR034" H 5100 4050 50  0001 C CNN
F 1 "GND" H 5105 4127 50  0000 C CNN
F 2 "" H 5100 4300 50  0001 C CNN
F 3 "" H 5100 4300 50  0001 C CNN
	1    5100 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 4450 5250 4450
$Comp
L TP4056:TP4056 U4
U 1 1 61994B2B
P 5950 4350
F 0 "U4" H 5950 5017 50  0000 C CNN
F 1 "TP4056" H 5950 4926 50  0000 C CNN
F 2 "Board:SOP127P600X175-9N" H 5950 4350 50  0001 L BNN
F 3 "" H 5950 4350 50  0001 L BNN
F 4 "1.75mm" H 5950 4350 50  0001 L BNN "MAXIMUM_PACKAGE_HEIGHT"
F 5 "NanJing Top Power ASIC Corp." H 5950 4350 50  0001 L BNN "MANUFACTURER"
F 6 "IPC 7351B" H 5950 4350 50  0001 L BNN "STANDARD"
	1    5950 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 4050 5250 4250
Wire Wire Line
	5250 4250 5350 4250
Wire Wire Line
	5100 4300 5100 4150
Wire Wire Line
	5100 4150 5350 4150
$Comp
L power:GND #PWR036
U 1 1 6199F212
P 5250 4900
F 0 "#PWR036" H 5250 4650 50  0001 C CNN
F 1 "GND" H 5255 4727 50  0000 C CNN
F 2 "" H 5250 4900 50  0001 C CNN
F 3 "" H 5250 4900 50  0001 C CNN
	1    5250 4900
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small_US R21
U 1 1 6199F776
P 5250 4700
F 0 "R21" H 5318 4746 50  0000 L CNN
F 1 "1.2k" H 5318 4655 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" H 5250 4700 50  0001 C CNN
F 3 "~" H 5250 4700 50  0001 C CNN
	1    5250 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 4800 5250 4900
Wire Wire Line
	6550 4550 6650 4550
Wire Wire Line
	6650 4550 6650 4750
Wire Wire Line
	6650 4750 6550 4750
Wire Wire Line
	6650 4750 6650 4850
Connection ~ 6650 4750
$Comp
L power:GND #PWR037
U 1 1 619A0A50
P 6650 4850
F 0 "#PWR037" H 6650 4600 50  0001 C CNN
F 1 "GND" H 6655 4677 50  0000 C CNN
F 2 "" H 6650 4850 50  0001 C CNN
F 3 "" H 6650 4850 50  0001 C CNN
	1    6650 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 4150 6900 4150
Text Label 6900 4150 2    50   ~ 0
BATT+
Text Label 8075 2150 0    50   ~ 0
BATT+
Wire Wire Line
	6975 2100 6975 2200
$Comp
L power:GND #PWR039
U 1 1 619B7FBD
P 6975 2200
F 0 "#PWR039" H 6975 1950 50  0001 C CNN
F 1 "GND" H 6980 2027 50  0000 C CNN
F 2 "" H 6975 2200 50  0001 C CNN
F 3 "" H 6975 2200 50  0001 C CNN
	1    6975 2200
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:AO3401A Q2
U 1 1 61A47D24
P 2925 2500
F 0 "Q2" V 3267 2500 50  0000 C CNN
F 1 "AO3401A" V 3176 2500 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 3125 2425 50  0001 L CIN
F 3 "http://www.aosmd.com/pdfs/datasheet/AO3401A.pdf" H 2925 2500 50  0001 L CNN
	1    2925 2500
	0    -1   -1   0   
$EndComp
$Comp
L Device:D_Schottky D6
U 1 1 61A4897E
P 3275 2600
F 0 "D6" H 3275 2750 50  0000 R CNN
F 1 "D_Schottky" H 3550 2850 50  0000 R CNN
F 2 "Diode_SMD:D_SMA" H 3275 2600 50  0001 C CNN
F 3 "~" H 3275 2600 50  0001 C CNN
	1    3275 2600
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small_US R18
U 1 1 61A4EED8
P 2925 3000
F 0 "R18" H 2993 3046 50  0000 L CNN
F 1 "10k" H 2993 2955 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" H 2925 3000 50  0001 C CNN
F 3 "~" H 2925 3000 50  0001 C CNN
	1    2925 3000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR031
U 1 1 61A4FE63
P 2925 3225
F 0 "#PWR031" H 2925 2975 50  0001 C CNN
F 1 "GND" H 2930 3052 50  0000 C CNN
F 2 "" H 2925 3225 50  0001 C CNN
F 3 "" H 2925 3225 50  0001 C CNN
	1    2925 3225
	1    0    0    -1  
$EndComp
Wire Wire Line
	2925 3100 2925 3150
Wire Wire Line
	2925 2700 2925 2800
Connection ~ 2925 2800
Wire Wire Line
	2925 2800 2925 2900
Wire Wire Line
	2425 2800 2925 2800
$Comp
L power:+5V #PWR029
U 1 1 61A68B7A
P 2425 2700
F 0 "#PWR029" H 2425 2550 50  0001 C CNN
F 1 "+5V" H 2440 2873 50  0000 C CNN
F 2 "" H 2425 2700 50  0001 C CNN
F 3 "" H 2425 2700 50  0001 C CNN
	1    2425 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2425 2700 2425 2800
$Comp
L power:VCC #PWR033
U 1 1 61A6A8F1
P 3275 2300
F 0 "#PWR033" H 3275 2150 50  0001 C CNN
F 1 "VCC" H 3290 2473 50  0000 C CNN
F 2 "" H 3275 2300 50  0001 C CNN
F 3 "" H 3275 2300 50  0001 C CNN
	1    3275 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3275 2800 3275 2750
Wire Wire Line
	2925 2800 3275 2800
Wire Wire Line
	3275 2300 3275 2400
Connection ~ 3275 2400
Wire Wire Line
	3275 2400 3275 2450
Wire Wire Line
	2725 2400 2425 2400
Text Label 2425 2400 0    50   ~ 0
BATT+
$Comp
L DW01A:DW01A IC1
U 1 1 61A7289D
P 5625 2600
F 0 "IC1" H 5625 3167 50  0000 C CNN
F 1 "DW01A" H 5625 3076 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-6_Handsoldering" H 5625 2600 50  0001 L BNN
F 3 "" H 5625 2600 50  0001 L BNN
F 4 "DW01A" H 5625 2600 50  0001 L BNN "MPN"
F 5 "C351410" H 5625 2600 50  0001 L BNN "LCSC"
F 6 "DW01A" H 5625 2600 50  0001 L BNN "VALUE"
	1    5625 2600
	1    0    0    -1  
$EndComp
$Comp
L FS8205A:FS8205A Q3
U 1 1 61A73178
P 6675 2600
F 0 "Q3" H 6919 2646 50  0000 L CNN
F 1 "FS8205A" H 6919 2555 50  0000 L CNN
F 2 "Board:SOP65P640X120-8N" H 6675 2600 50  0001 L BNN
F 3 "" H 6675 2600 50  0001 L BNN
F 4 "Fortune Semiconductor" H 6675 2600 50  0001 L BNN "MANUFACTURER"
F 5 "1.7" H 6675 2600 50  0001 L BNN "PARTREV"
F 6 "IPC 7351B" H 6675 2600 50  0001 L BNN "STANDARD"
F 7 "1.2mm" H 6675 2600 50  0001 L BNN "MAXIMUM_PACKAGE_HEIGHT"
	1    6675 2600
	1    0    0    -1  
$EndComp
NoConn ~ 6875 2550
Wire Wire Line
	6075 2600 6275 2600
Wire Wire Line
	6275 2600 6275 2500
Wire Wire Line
	6275 2500 6475 2500
Wire Wire Line
	6075 2900 6475 2900
NoConn ~ 5175 2600
NoConn ~ 6875 2650
Wire Wire Line
	6675 2200 6675 2100
Wire Wire Line
	6675 2100 6775 2100
Wire Wire Line
	6775 2200 6775 2100
Connection ~ 6775 2100
Wire Wire Line
	6775 2100 6975 2100
Text Label 8075 2575 0    50   ~ 0
BATT-
Text Label 7125 3150 2    50   ~ 0
BATT-
Wire Wire Line
	6675 3000 6675 3150
Wire Wire Line
	6675 3150 6775 3150
Wire Wire Line
	6775 3150 6775 3000
Connection ~ 6775 3150
$Comp
L Device:R_Small_US R20
U 1 1 61A90319
P 5025 2100
F 0 "R20" H 4825 2150 50  0000 L CNN
F 1 "100R" H 4775 2050 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" H 5025 2100 50  0001 C CNN
F 3 "~" H 5025 2100 50  0001 C CNN
	1    5025 2100
	1    0    0    -1  
$EndComp
$Comp
L Device:CP_Small C3
U 1 1 61A910D8
P 5025 2500
F 0 "C3" H 4775 2550 50  0000 L CNN
F 1 "0.1uF" H 4775 2450 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 5025 2500 50  0001 C CNN
F 3 "~" H 5025 2500 50  0001 C CNN
	1    5025 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5025 2200 5025 2300
Wire Wire Line
	5025 2600 5025 2900
Wire Wire Line
	5175 2900 5025 2900
Connection ~ 5025 2900
Wire Wire Line
	5025 2900 5025 3150
Connection ~ 5025 2300
Wire Wire Line
	5025 2300 5025 2400
Text Label 4625 1900 0    50   ~ 0
BATT+
Wire Wire Line
	4625 1900 5025 1900
Wire Wire Line
	5025 1900 5025 2000
$Comp
L Device:R_Small_US R22
U 1 1 61A9D27D
P 6425 2100
F 0 "R22" V 6225 2050 50  0000 L CNN
F 1 "1k" V 6325 2050 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" H 6425 2100 50  0001 C CNN
F 3 "~" H 6425 2100 50  0001 C CNN
	1    6425 2100
	0    1    1    0   
$EndComp
Wire Wire Line
	5175 2300 5025 2300
Wire Wire Line
	6075 2300 6175 2300
Wire Wire Line
	6175 2300 6175 2100
Wire Wire Line
	6175 2100 6325 2100
Wire Wire Line
	6525 2100 6675 2100
Connection ~ 6675 2100
Wire Wire Line
	5025 3150 6675 3150
Connection ~ 6675 3150
$Comp
L power:+5V #PWR035
U 1 1 61B44133
P 5250 4050
F 0 "#PWR035" H 5250 3900 50  0001 C CNN
F 1 "+5V" H 5265 4223 50  0000 C CNN
F 2 "" H 5250 4050 50  0001 C CNN
F 3 "" H 5250 4050 50  0001 C CNN
	1    5250 4050
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR038
U 1 1 61B44D3F
P 6700 3850
F 0 "#PWR038" H 6700 3700 50  0001 C CNN
F 1 "+5V" H 6715 4023 50  0000 C CNN
F 2 "" H 6700 3850 50  0001 C CNN
F 3 "" H 6700 3850 50  0001 C CNN
	1    6700 3850
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR030
U 1 1 61B45860
P 2425 4000
F 0 "#PWR030" H 2425 3850 50  0001 C CNN
F 1 "+5V" H 2440 4173 50  0000 C CNN
F 2 "" H 2425 4000 50  0001 C CNN
F 3 "" H 2425 4000 50  0001 C CNN
	1    2425 4000
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR032
U 1 1 61B45E6A
P 3125 4000
F 0 "#PWR032" H 3125 3850 50  0001 C CNN
F 1 "+5V" H 3140 4173 50  0000 C CNN
F 2 "" H 3125 4000 50  0001 C CNN
F 3 "" H 3125 4000 50  0001 C CNN
	1    3125 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	8525 2150 8525 2325
Wire Wire Line
	8525 2325 8650 2325
Wire Wire Line
	8650 2425 8525 2425
Wire Wire Line
	8525 2425 8525 2575
$Comp
L Connector:Conn_01x02_Female J6
U 1 1 619B0A12
P 8850 2325
F 0 "J6" H 8878 2301 50  0000 L CNN
F 1 "Conn_01x02_Female" V 9025 1950 50  0000 L CNN
F 2 "Board:SolderWire_1x02_P2.00mm" H 8850 2325 50  0001 C CNN
F 3 "~" H 8850 2325 50  0001 C CNN
	1    8850 2325
	1    0    0    -1  
$EndComp
Text Notes 8050 3150 0    50   ~ 0
LiPo Battery\nCapacity: 1000 mAh\nDimesions: 48mm x 30mm x 4.2mm
Wire Wire Line
	8075 2150 8525 2150
Wire Wire Line
	8075 2575 8525 2575
$Comp
L power:PWR_FLAG #FLG03
U 1 1 6212F9C2
P 3700 2300
F 0 "#FLG03" H 3700 2375 50  0001 C CNN
F 1 "PWR_FLAG" H 3700 2473 50  0000 C CNN
F 2 "" H 3700 2300 50  0001 C CNN
F 3 "~" H 3700 2300 50  0001 C CNN
	1    3700 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 2300 3700 2400
Wire Wire Line
	3125 2400 3275 2400
Wire Wire Line
	3275 2400 3700 2400
$Comp
L power:PWR_FLAG #FLG01
U 1 1 621374C2
P 2150 2700
F 0 "#FLG01" H 2150 2775 50  0001 C CNN
F 1 "PWR_FLAG" H 2150 2873 50  0000 C CNN
F 2 "" H 2150 2700 50  0001 C CNN
F 3 "~" H 2150 2700 50  0001 C CNN
	1    2150 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 2700 2150 2800
Wire Wire Line
	2150 2800 2425 2800
Connection ~ 2425 2800
$Comp
L power:PWR_FLAG #FLG02
U 1 1 621397DA
P 2600 3225
F 0 "#FLG02" H 2600 3300 50  0001 C CNN
F 1 "PWR_FLAG" H 2600 3398 50  0000 C CNN
F 2 "" H 2600 3225 50  0001 C CNN
F 3 "~" H 2600 3225 50  0001 C CNN
	1    2600 3225
	-1   0    0    1   
$EndComp
Wire Wire Line
	2600 3225 2600 3150
Wire Wire Line
	2600 3150 2925 3150
Connection ~ 2925 3150
Wire Wire Line
	2925 3150 2925 3225
$Comp
L power:PWR_FLAG #FLG04
U 1 1 62143D8D
P 4525 2200
F 0 "#FLG04" H 4525 2275 50  0001 C CNN
F 1 "PWR_FLAG" H 4525 2373 50  0000 C CNN
F 2 "" H 4525 2200 50  0001 C CNN
F 3 "~" H 4525 2200 50  0001 C CNN
	1    4525 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4525 2200 4525 2300
Wire Wire Line
	4525 2300 5025 2300
$Comp
L power:PWR_FLAG #FLG05
U 1 1 6214A28F
P 7325 3050
F 0 "#FLG05" H 7325 3125 50  0001 C CNN
F 1 "PWR_FLAG" H 7325 3223 50  0000 C CNN
F 2 "" H 7325 3050 50  0001 C CNN
F 3 "~" H 7325 3050 50  0001 C CNN
	1    7325 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7325 3050 7325 3150
Wire Wire Line
	6775 3150 7325 3150
$EndSCHEMATC
