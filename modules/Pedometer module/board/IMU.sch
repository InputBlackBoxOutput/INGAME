EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 3
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Label 3600 3150 0    50   ~ 0
CS
Wire Wire Line
	4000 3150 3600 3150
Text Label 3600 3450 0    50   ~ 0
SDO
Text Label 3600 3550 0    50   ~ 0
SDA
Wire Wire Line
	3600 3450 4000 3450
Wire Wire Line
	3600 3550 4000 3550
Wire Wire Line
	4000 3650 3600 3650
Text Label 3600 3350 0    50   ~ 0
INT2
Text Label 3600 3250 0    50   ~ 0
INT1
Text Label 3600 3650 0    50   ~ 0
SCL
$Comp
L Connector:Conn_01x08_Female J4
U 1 1 61A32798
P 4200 3250
F 0 "J4" H 4228 3226 50  0000 L CNN
F 1 "Conn_01x08_Female" H 4228 3135 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x08_P2.54mm_Vertical" H 4200 3250 50  0001 C CNN
F 3 "~" H 4200 3250 50  0001 C CNN
	1    4200 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 3250 3600 3250
Wire Wire Line
	3600 3350 4000 3350
Wire Wire Line
	4000 3050 3400 3050
Wire Wire Line
	3400 3050 3400 3000
Wire Wire Line
	3700 2650 3700 2700
$Comp
L power:+3.3V #PWR024
U 1 1 61A36F21
P 3400 3000
F 0 "#PWR024" H 3400 2850 50  0001 C CNN
F 1 "+3.3V" H 3415 3173 50  0000 C CNN
F 2 "" H 3400 3000 50  0001 C CNN
F 3 "" H 3400 3000 50  0001 C CNN
	1    3400 3000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR025
U 1 1 61A37647
P 3700 2700
F 0 "#PWR025" H 3700 2450 50  0001 C CNN
F 1 "GND" H 3705 2527 50  0000 C CNN
F 2 "" H 3700 2700 50  0001 C CNN
F 3 "" H 3700 2700 50  0001 C CNN
	1    3700 2700
	1    0    0    -1  
$EndComp
Text Notes 3450 2450 0    50   ~ 0
23 x 25 mm
Wire Wire Line
	3700 2650 3900 2650
Wire Wire Line
	3900 2650 3900 2950
Wire Wire Line
	3900 2950 4000 2950
Wire Wire Line
	6350 3200 6000 3200
Wire Wire Line
	6000 3100 6350 3100
Text Label 6000 3200 0    50   ~ 0
INT1
Text Label 6000 3100 0    50   ~ 0
INT2
$Comp
L power:GND #PWR029
U 1 1 619B5978
P 7900 3750
F 0 "#PWR029" H 7900 3500 50  0001 C CNN
F 1 "GND" H 7905 3577 50  0000 C CNN
F 2 "" H 7900 3750 50  0001 C CNN
F 3 "" H 7900 3750 50  0001 C CNN
	1    7900 3750
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR028
U 1 1 619B5CC3
P 7850 2950
F 0 "#PWR028" H 7850 2800 50  0001 C CNN
F 1 "+3.3V" H 7865 3123 50  0000 C CNN
F 2 "" H 7850 2950 50  0001 C CNN
F 3 "" H 7850 2950 50  0001 C CNN
	1    7850 2950
	1    0    0    -1  
$EndComp
NoConn ~ 7700 3700
NoConn ~ 6350 3400
$Comp
L ADXL345BCCZ:ADXL345BCCZ U3
U 1 1 619B396C
P 7350 3800
F 0 "U3" H 7100 4800 50  0000 C CNN
F 1 "ADXL345BCCZ" H 7100 4700 50  0000 C CNN
F 2 "board:PQFN80P300X500X100-14N" H 6900 5050 50  0001 L BNN
F 3 "" H 7350 3800 50  0001 L BNN
	1    7350 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 3400 7900 3500
Wire Wire Line
	7700 3400 7900 3400
Wire Wire Line
	7900 3500 7700 3500
Connection ~ 7900 3500
Wire Wire Line
	7900 3500 7900 3600
Wire Wire Line
	7700 3600 7900 3600
Connection ~ 7900 3600
Wire Wire Line
	7900 3600 7900 3750
Wire Wire Line
	7700 3100 7850 3100
Wire Wire Line
	7850 3100 7850 3000
Wire Wire Line
	7700 3200 7850 3200
Wire Wire Line
	7850 3200 7850 3100
Connection ~ 7850 3100
Wire Wire Line
	7700 3300 8050 3300
Wire Wire Line
	7850 3000 8050 3000
Connection ~ 7850 3000
Wire Wire Line
	7850 3000 7850 2950
$Comp
L Device:R_Small_US R11
U 1 1 619BA566
P 8050 3150
F 0 "R11" H 8118 3196 50  0000 L CNN
F 1 "4.7k" H 8118 3105 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" H 8050 3150 50  0001 C CNN
F 3 "~" H 8050 3150 50  0001 C CNN
	1    8050 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	8050 3000 8050 3050
Wire Wire Line
	8050 3250 8050 3300
Wire Wire Line
	6350 3700 6250 3700
Text Label 6000 3700 0    50   ~ 0
SDO
Text Label 5350 3500 0    50   ~ 0
SDA
Text Label 5350 3600 0    50   ~ 0
SCL
Wire Wire Line
	5350 3500 5650 3500
Wire Wire Line
	5350 3600 5800 3600
$Comp
L Device:R_Small_US R9
U 1 1 619BEF64
P 5800 3250
F 0 "R9" H 5868 3296 50  0000 L CNN
F 1 "4.7k" H 5868 3205 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" H 5800 3250 50  0001 C CNN
F 3 "~" H 5800 3250 50  0001 C CNN
	1    5800 3250
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small_US R8
U 1 1 619BF83C
P 5650 3250
F 0 "R8" H 5400 3300 50  0000 L CNN
F 1 "4.7k" H 5400 3200 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" H 5650 3250 50  0001 C CNN
F 3 "~" H 5650 3250 50  0001 C CNN
	1    5650 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 3350 5650 3500
Connection ~ 5650 3500
Wire Wire Line
	5800 3350 5800 3600
Connection ~ 5800 3600
Wire Wire Line
	5650 3500 6350 3500
Wire Wire Line
	5800 3600 6350 3600
Wire Wire Line
	5650 3150 5650 3050
Wire Wire Line
	5650 3050 5700 3050
Wire Wire Line
	5800 3050 5800 3150
Wire Wire Line
	5700 3050 5700 2950
Connection ~ 5700 3050
Wire Wire Line
	5700 3050 5800 3050
$Comp
L power:+3.3V #PWR026
U 1 1 619C4436
P 5700 2950
F 0 "#PWR026" H 5700 2800 50  0001 C CNN
F 1 "+3.3V" H 5715 3123 50  0000 C CNN
F 2 "" H 5700 2950 50  0001 C CNN
F 3 "" H 5700 2950 50  0001 C CNN
	1    5700 2950
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small_US R10
U 1 1 619CBE84
P 6250 3850
F 0 "R10" H 6318 3896 50  0000 L CNN
F 1 "4.7k" H 6318 3805 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" H 6250 3850 50  0001 C CNN
F 3 "~" H 6250 3850 50  0001 C CNN
	1    6250 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 3750 6250 3700
Connection ~ 6250 3700
Wire Wire Line
	6250 3700 6000 3700
$Comp
L power:GND #PWR027
U 1 1 619CD6B6
P 6250 4100
F 0 "#PWR027" H 6250 3850 50  0001 C CNN
F 1 "GND" H 6255 3927 50  0000 C CNN
F 2 "" H 6250 4100 50  0001 C CNN
F 3 "" H 6250 4100 50  0001 C CNN
	1    6250 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 3950 6250 4100
NoConn ~ 6350 3300
Wire Wire Line
	3850 4050 4150 4050
Wire Wire Line
	3850 4150 4150 4150
Text Label 4150 4050 2    50   ~ 0
SCL
Text Label 4150 4150 2    50   ~ 0
SDA
Text HLabel 3850 4150 0    50   Input ~ 0
SDA
Text HLabel 3850 4050 0    50   Input ~ 0
SCL
Text Label 7900 3300 0    50   ~ 0
CS
$EndSCHEMATC
