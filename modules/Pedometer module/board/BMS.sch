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
L Device:R_Small_US R12
U 1 1 619958ED
P 3250 3550
F 0 "R12" H 3318 3596 50  0000 L CNN
F 1 "1k" H 3318 3505 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" H 3250 3550 50  0001 C CNN
F 3 "~" H 3250 3550 50  0001 C CNN
	1    3250 3550
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D3
U 1 1 61995CCB
P 3250 3900
F 0 "D3" V 3289 3782 50  0000 R CNN
F 1 "LED-RED" V 3198 3782 50  0000 R CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3250 3900 50  0001 C CNN
F 3 "~" H 3250 3900 50  0001 C CNN
	1    3250 3900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3250 3650 3250 3750
$Comp
L Device:R_Small_US R14
U 1 1 619979BF
P 3950 3550
F 0 "R14" H 4018 3596 50  0000 L CNN
F 1 "1k" H 4018 3505 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" H 3950 3550 50  0001 C CNN
F 3 "~" H 3950 3550 50  0001 C CNN
	1    3950 3550
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D4
U 1 1 619979C5
P 3950 3900
F 0 "D4" V 3989 3782 50  0000 R CNN
F 1 "LED-BLUE" V 3898 3782 50  0000 R CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3950 3900 50  0001 C CNN
F 3 "~" H 3950 3900 50  0001 C CNN
	1    3950 3900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3950 3650 3950 3750
Wire Wire Line
	3950 4050 3950 4200
Wire Wire Line
	3250 3350 3250 3450
Wire Wire Line
	3950 3350 3950 3450
Wire Wire Line
	3250 4050 3250 4200
Wire Wire Line
	3250 4200 3600 4200
Wire Wire Line
	3950 4200 4300 4200
Text Label 3600 4200 2    50   ~ 0
CHRG
Text Label 4300 4200 2    50   ~ 0
STDBY
Wire Wire Line
	6850 3700 7200 3700
Text Label 7200 3700 2    50   ~ 0
CHRG
Wire Wire Line
	6850 3600 7200 3600
Text Label 7200 3600 2    50   ~ 0
STDBY
Wire Wire Line
	7000 3200 7000 3300
Wire Wire Line
	6850 3300 7000 3300
Wire Wire Line
	5550 3800 5550 3950
$Comp
L power:GND #PWR035
U 1 1 6199BAE9
P 5400 3650
F 0 "#PWR035" H 5400 3400 50  0001 C CNN
F 1 "GND" H 5405 3477 50  0000 C CNN
F 2 "" H 5400 3650 50  0001 C CNN
F 3 "" H 5400 3650 50  0001 C CNN
	1    5400 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 3800 5550 3800
$Comp
L TP4056:TP4056 U4
U 1 1 61994B2B
P 6250 3700
F 0 "U4" H 6250 4367 50  0000 C CNN
F 1 "TP4056" H 6250 4276 50  0000 C CNN
F 2 "board:SOP127P600X175-9N" H 6250 3700 50  0001 L BNN
F 3 "" H 6250 3700 50  0001 L BNN
F 4 "1.75mm" H 6250 3700 50  0001 L BNN "MAXIMUM_PACKAGE_HEIGHT"
F 5 "NanJing Top Power ASIC Corp." H 6250 3700 50  0001 L BNN "MANUFACTURER"
F 6 "IPC 7351B" H 6250 3700 50  0001 L BNN "STANDARD"
	1    6250 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 3400 5550 3600
Wire Wire Line
	5550 3600 5650 3600
Wire Wire Line
	5400 3650 5400 3500
Wire Wire Line
	5400 3500 5650 3500
$Comp
L power:GND #PWR037
U 1 1 6199F212
P 5550 4250
F 0 "#PWR037" H 5550 4000 50  0001 C CNN
F 1 "GND" H 5555 4077 50  0000 C CNN
F 2 "" H 5550 4250 50  0001 C CNN
F 3 "" H 5550 4250 50  0001 C CNN
	1    5550 4250
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small_US R16
U 1 1 6199F776
P 5550 4050
F 0 "R16" H 5618 4096 50  0000 L CNN
F 1 "1.2k" H 5618 4005 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" H 5550 4050 50  0001 C CNN
F 3 "~" H 5550 4050 50  0001 C CNN
	1    5550 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 4150 5550 4250
Wire Wire Line
	6850 3900 6950 3900
Wire Wire Line
	6950 3900 6950 4100
Wire Wire Line
	6950 4100 6850 4100
Wire Wire Line
	6950 4100 6950 4200
Connection ~ 6950 4100
$Comp
L power:GND #PWR038
U 1 1 619A0A50
P 6950 4200
F 0 "#PWR038" H 6950 3950 50  0001 C CNN
F 1 "GND" H 6955 4027 50  0000 C CNN
F 2 "" H 6950 4200 50  0001 C CNN
F 3 "" H 6950 4200 50  0001 C CNN
	1    6950 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 3500 7200 3500
Text Label 7200 3500 2    50   ~ 0
BATT+
Text Label 7750 3450 0    50   ~ 0
BATT+
Wire Wire Line
	7500 1450 7500 1550
$Comp
L power:GND #PWR040
U 1 1 619B7FBD
P 7500 1550
F 0 "#PWR040" H 7500 1300 50  0001 C CNN
F 1 "GND" H 7505 1377 50  0000 C CNN
F 2 "" H 7500 1550 50  0001 C CNN
F 3 "" H 7500 1550 50  0001 C CNN
	1    7500 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	7750 3450 8050 3450
$Comp
L Device:CP_Small C6
U 1 1 619B9D05
P 8050 3650
F 0 "C6" H 7800 3700 50  0000 L CNN
F 1 "10uF" H 7800 3600 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 8050 3650 50  0001 C CNN
F 3 "~" H 8050 3650 50  0001 C CNN
	1    8050 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	8050 3550 8050 3450
$Comp
L Transistor_FET:AO3401A Q2
U 1 1 61A47D24
P 3750 1850
F 0 "Q2" V 4092 1850 50  0000 C CNN
F 1 "AO3401A" V 4001 1850 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 3950 1775 50  0001 L CIN
F 3 "http://www.aosmd.com/pdfs/datasheet/AO3401A.pdf" H 3750 1850 50  0001 L CNN
	1    3750 1850
	0    -1   -1   0   
$EndComp
$Comp
L Device:D_Schottky D5
U 1 1 61A4897E
P 4100 1950
F 0 "D5" H 4100 2100 50  0000 R CNN
F 1 "D_Schottky" H 4250 2200 50  0000 R CNN
F 2 "Diode_SMD:D_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4100 1950 50  0001 C CNN
F 3 "~" H 4100 1950 50  0001 C CNN
	1    4100 1950
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small_US R13
U 1 1 61A4EED8
P 3750 2350
F 0 "R13" H 3818 2396 50  0000 L CNN
F 1 "10k" H 3818 2305 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" H 3750 2350 50  0001 C CNN
F 3 "~" H 3750 2350 50  0001 C CNN
	1    3750 2350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR032
U 1 1 61A4FE63
P 3750 2500
F 0 "#PWR032" H 3750 2250 50  0001 C CNN
F 1 "GND" H 3755 2327 50  0000 C CNN
F 2 "" H 3750 2500 50  0001 C CNN
F 3 "" H 3750 2500 50  0001 C CNN
	1    3750 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 2450 3750 2500
Wire Wire Line
	3750 2050 3750 2150
Connection ~ 3750 2150
Wire Wire Line
	3750 2150 3750 2250
Wire Wire Line
	3250 2150 3750 2150
$Comp
L power:+5V #PWR030
U 1 1 61A68B7A
P 3250 2050
F 0 "#PWR030" H 3250 1900 50  0001 C CNN
F 1 "+5V" H 3265 2223 50  0000 C CNN
F 2 "" H 3250 2050 50  0001 C CNN
F 3 "" H 3250 2050 50  0001 C CNN
	1    3250 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 2050 3250 2150
$Comp
L power:VCC #PWR034
U 1 1 61A6A8F1
P 4100 1650
F 0 "#PWR034" H 4100 1500 50  0001 C CNN
F 1 "VCC" H 4115 1823 50  0000 C CNN
F 2 "" H 4100 1650 50  0001 C CNN
F 3 "" H 4100 1650 50  0001 C CNN
	1    4100 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 2150 4100 2100
Wire Wire Line
	3750 2150 4100 2150
Wire Wire Line
	4100 1650 4100 1750
Wire Wire Line
	3950 1750 4100 1750
Connection ~ 4100 1750
Wire Wire Line
	4100 1750 4100 1800
Wire Wire Line
	3550 1750 3250 1750
Text Label 3250 1750 0    50   ~ 0
BATT+
$Comp
L DW01A:DW01A IC1
U 1 1 61A7289D
P 6150 1950
F 0 "IC1" H 6150 2517 50  0000 C CNN
F 1 "DW01A" H 6150 2426 50  0000 C CNN
F 2 "board:SOT23-6" H 6150 1950 50  0001 L BNN
F 3 "" H 6150 1950 50  0001 L BNN
F 4 "DW01A" H 6150 1950 50  0001 L BNN "MPN"
F 5 "C351410" H 6150 1950 50  0001 L BNN "LCSC"
F 6 "DW01A" H 6150 1950 50  0001 L BNN "VALUE"
	1    6150 1950
	1    0    0    -1  
$EndComp
$Comp
L FS8205A:FS8205A Q3
U 1 1 61A73178
P 7200 1950
F 0 "Q3" H 7444 1996 50  0000 L CNN
F 1 "FS8205A" H 7444 1905 50  0000 L CNN
F 2 "board:SOP65P640X120-8N" H 7200 1950 50  0001 L BNN
F 3 "" H 7200 1950 50  0001 L BNN
F 4 "Fortune Semiconductor" H 7200 1950 50  0001 L BNN "MANUFACTURER"
F 5 "1.7" H 7200 1950 50  0001 L BNN "PARTREV"
F 6 "IPC 7351B" H 7200 1950 50  0001 L BNN "STANDARD"
F 7 "1.2mm" H 7200 1950 50  0001 L BNN "MAXIMUM_PACKAGE_HEIGHT"
	1    7200 1950
	1    0    0    -1  
$EndComp
NoConn ~ 7400 1900
Wire Wire Line
	6600 1950 6800 1950
Wire Wire Line
	6800 1950 6800 1850
Wire Wire Line
	6800 1850 7000 1850
Wire Wire Line
	6600 2250 7000 2250
NoConn ~ 5700 1950
NoConn ~ 7400 2000
Wire Wire Line
	7200 1550 7200 1450
Wire Wire Line
	7200 1450 7300 1450
Wire Wire Line
	7300 1550 7300 1450
Connection ~ 7300 1450
Wire Wire Line
	7300 1450 7500 1450
Text Label 7750 3900 0    50   ~ 0
BATT-
Wire Wire Line
	7750 3900 8050 3900
Wire Wire Line
	8050 3750 8050 3900
$Comp
L Connector:Conn_01x02_Female J5
U 1 1 619B0A12
P 8500 3700
F 0 "J5" H 8528 3676 50  0000 L CNN
F 1 "Conn_01x02_Female" H 8528 3585 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x02_P2.54mm_Vertical" H 8500 3700 50  0001 C CNN
F 3 "~" H 8500 3700 50  0001 C CNN
	1    8500 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	8050 3450 8200 3450
Wire Wire Line
	8200 3450 8200 3700
Wire Wire Line
	8200 3700 8300 3700
Connection ~ 8050 3450
Wire Wire Line
	8300 3800 8200 3800
Wire Wire Line
	8200 3800 8200 3900
Wire Wire Line
	8200 3900 8050 3900
Connection ~ 8050 3900
Text Label 7650 2500 2    50   ~ 0
BATT-
Wire Wire Line
	7200 2350 7200 2500
Wire Wire Line
	7200 2500 7300 2500
Wire Wire Line
	7300 2500 7300 2350
Connection ~ 7300 2500
Wire Wire Line
	7300 2500 7650 2500
$Comp
L Device:R_Small_US R15
U 1 1 61A90319
P 5550 1450
F 0 "R15" H 5350 1500 50  0000 L CNN
F 1 "100R" H 5300 1400 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" H 5550 1450 50  0001 C CNN
F 3 "~" H 5550 1450 50  0001 C CNN
	1    5550 1450
	1    0    0    -1  
$EndComp
$Comp
L Device:CP_Small C5
U 1 1 61A910D8
P 5550 1850
F 0 "C5" H 5300 1900 50  0000 L CNN
F 1 "0.1uF" H 5300 1800 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 5550 1850 50  0001 C CNN
F 3 "~" H 5550 1850 50  0001 C CNN
	1    5550 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 1550 5550 1650
Wire Wire Line
	5550 1950 5550 2250
Wire Wire Line
	5700 2250 5550 2250
Connection ~ 5550 2250
Wire Wire Line
	5550 2250 5550 2500
Connection ~ 5550 1650
Wire Wire Line
	5550 1650 5550 1750
Text Label 5150 1250 0    50   ~ 0
BATT+
Wire Wire Line
	5150 1250 5550 1250
Wire Wire Line
	5550 1250 5550 1350
$Comp
L Device:R_Small_US R17
U 1 1 61A9D27D
P 6950 1450
F 0 "R17" V 6750 1400 50  0000 L CNN
F 1 "1k" V 6850 1400 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" H 6950 1450 50  0001 C CNN
F 3 "~" H 6950 1450 50  0001 C CNN
	1    6950 1450
	0    1    1    0   
$EndComp
Wire Wire Line
	5700 1650 5550 1650
Wire Wire Line
	6600 1650 6700 1650
Wire Wire Line
	6700 1650 6700 1450
Wire Wire Line
	6700 1450 6850 1450
Wire Wire Line
	7050 1450 7200 1450
Connection ~ 7200 1450
Wire Wire Line
	5550 2500 7200 2500
Connection ~ 7200 2500
$Comp
L power:+5V #PWR041
U 1 1 61B31398
P 8250 1800
F 0 "#PWR041" H 8250 1650 50  0001 C CNN
F 1 "+5V" H 8265 1973 50  0000 C CNN
F 2 "" H 8250 1800 50  0001 C CNN
F 3 "" H 8250 1800 50  0001 C CNN
	1    8250 1800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR042
U 1 1 61B2C876
P 8450 2300
F 0 "#PWR042" H 8450 2050 50  0001 C CNN
F 1 "GND" H 8455 2127 50  0000 C CNN
F 2 "" H 8450 2300 50  0001 C CNN
F 3 "" H 8450 2300 50  0001 C CNN
	1    8450 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	8450 2200 8450 2300
Wire Wire Line
	8250 1950 8250 1800
Wire Wire Line
	8450 1950 8250 1950
Wire Wire Line
	8450 1850 8450 1950
Wire Wire Line
	8950 2350 9650 2350
Wire Wire Line
	8950 2350 8950 2200
Wire Wire Line
	8950 1900 9650 1900
Wire Wire Line
	8950 1850 8950 1900
Text Label 9650 1900 2    50   ~ 0
BATT-
Text Label 9650 2350 2    50   ~ 0
BATT+
$Comp
L Connector:TestPoint TP?
U 1 1 61B19E50
P 8950 2200
AR Path="/61B19E50" Ref="TP?"  Part="1" 
AR Path="/619940CA/61B19E50" Ref="TP4"  Part="1" 
F 0 "TP4" H 9008 2318 50  0000 L CNN
F 1 "TestPoint" H 9008 2227 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_1.5x1.5mm" H 9150 2200 50  0001 C CNN
F 3 "~" H 9150 2200 50  0001 C CNN
	1    8950 2200
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP?
U 1 1 61B19E4A
P 8450 2200
AR Path="/61B19E4A" Ref="TP?"  Part="1" 
AR Path="/619940CA/61B19E4A" Ref="TP2"  Part="1" 
F 0 "TP2" H 8508 2318 50  0000 L CNN
F 1 "TestPoint" H 8508 2227 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_1.5x1.5mm" H 8650 2200 50  0001 C CNN
F 3 "~" H 8650 2200 50  0001 C CNN
	1    8450 2200
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP?
U 1 1 61B19E44
P 8950 1850
AR Path="/61B19E44" Ref="TP?"  Part="1" 
AR Path="/619940CA/61B19E44" Ref="TP3"  Part="1" 
F 0 "TP3" H 9008 1968 50  0000 L CNN
F 1 "TestPoint" H 9008 1877 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_1.5x1.5mm" H 9150 1850 50  0001 C CNN
F 3 "~" H 9150 1850 50  0001 C CNN
	1    8950 1850
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP?
U 1 1 61B19E3E
P 8450 1850
AR Path="/61B19E3E" Ref="TP?"  Part="1" 
AR Path="/619940CA/61B19E3E" Ref="TP1"  Part="1" 
F 0 "TP1" H 8508 1968 50  0000 L CNN
F 1 "TestPoint" H 8508 1877 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_1.5x1.5mm" H 8650 1850 50  0001 C CNN
F 3 "~" H 8650 1850 50  0001 C CNN
	1    8450 1850
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR036
U 1 1 61B44133
P 5550 3400
F 0 "#PWR036" H 5550 3250 50  0001 C CNN
F 1 "+5V" H 5565 3573 50  0000 C CNN
F 2 "" H 5550 3400 50  0001 C CNN
F 3 "" H 5550 3400 50  0001 C CNN
	1    5550 3400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR039
U 1 1 61B44D3F
P 7000 3200
F 0 "#PWR039" H 7000 3050 50  0001 C CNN
F 1 "+5V" H 7015 3373 50  0000 C CNN
F 2 "" H 7000 3200 50  0001 C CNN
F 3 "" H 7000 3200 50  0001 C CNN
	1    7000 3200
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR031
U 1 1 61B45860
P 3250 3350
F 0 "#PWR031" H 3250 3200 50  0001 C CNN
F 1 "+5V" H 3265 3523 50  0000 C CNN
F 2 "" H 3250 3350 50  0001 C CNN
F 3 "" H 3250 3350 50  0001 C CNN
	1    3250 3350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR033
U 1 1 61B45E6A
P 3950 3350
F 0 "#PWR033" H 3950 3200 50  0001 C CNN
F 1 "+5V" H 3965 3523 50  0000 C CNN
F 2 "" H 3950 3350 50  0001 C CNN
F 3 "" H 3950 3350 50  0001 C CNN
	1    3950 3350
	1    0    0    -1  
$EndComp
$EndSCHEMATC
