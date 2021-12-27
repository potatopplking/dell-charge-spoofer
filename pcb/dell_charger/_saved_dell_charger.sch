EESchema Schematic File Version 4
LIBS:dell_charger-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Dell charger"
Date "2018-09-14"
Rev "1.0"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:C C3
U 1 1 5B9BAD8D
P 6000 3050
F 0 "C3" H 6115 3096 50  0000 L CNN
F 1 "1u" H 6115 3005 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6038 2900 50  0001 C CNN
F 3 "~" H 6000 3050 50  0001 C CNN
	1    6000 3050
	1    0    0    -1  
$EndComp
$Comp
L Device:C C4
U 1 1 5B9BAE65
P 6350 3050
F 0 "C4" H 6465 3096 50  0000 L CNN
F 1 "100n" H 6465 3005 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6388 2900 50  0001 C CNN
F 3 "~" H 6350 3050 50  0001 C CNN
	1    6350 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 2900 6350 2900
Wire Wire Line
	6350 2900 7150 2900
Wire Wire Line
	7150 2900 7150 3150
Connection ~ 6350 2900
Wire Wire Line
	6350 3200 6000 3200
$Comp
L power:GND #PWR0101
U 1 1 5B9BAEEA
P 7150 4450
F 0 "#PWR0101" H 7150 4200 50  0001 C CNN
F 1 "GND" H 7155 4277 50  0000 C CNN
F 2 "" H 7150 4450 50  0001 C CNN
F 3 "" H 7150 4450 50  0001 C CNN
	1    7150 4450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 5B9BAF02
P 6000 3300
F 0 "#PWR0102" H 6000 3050 50  0001 C CNN
F 1 "GND" H 6005 3127 50  0000 C CNN
F 2 "" H 6000 3300 50  0001 C CNN
F 3 "" H 6000 3300 50  0001 C CNN
	1    6000 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 3200 6000 3300
Connection ~ 6000 3200
Wire Wire Line
	7150 4350 7150 4450
$Comp
L power:+5V #PWR0103
U 1 1 5B9BAF62
P 6000 2800
F 0 "#PWR0103" H 6000 2650 50  0001 C CNN
F 1 "+5V" H 6015 2973 50  0000 C CNN
F 2 "" H 6000 2800 50  0001 C CNN
F 3 "" H 6000 2800 50  0001 C CNN
	1    6000 2800
	1    0    0    -1  
$EndComp
Connection ~ 6000 2900
Text Notes 5300 2550 0    50   ~ 0
Blocking capacitors - Place near MCU
$Comp
L Regulator_Linear:L78L05_SO8 U1
U 1 1 5B9BC0FC
P 4700 3750
F 0 "U1" H 4700 3992 50  0000 C CNN
F 1 "L78L05_SO8" H 4700 3901 50  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 4800 3950 50  0001 C CIN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/15/55/e5/aa/23/5b/43/fd/CD00000446.pdf/files/CD00000446.pdf/jcr:content/translations/en.CD00000446.pdf" H 4900 3750 50  0001 C CNN
	1    4700 3750
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 J1
U 1 1 5B9BC319
P 3400 3850
F 0 "J1" H 3320 3525 50  0000 C CNN
F 1 "Input terminal" H 3320 3616 50  0000 C CNN
F 2 "TerminalBlock_MetzConnect:TerminalBlock_MetzConnect_Type171_RT13702HBWC_1x02_P7.50mm_Horizontal" H 3400 3850 50  0001 C CNN
F 3 "~" H 3400 3850 50  0001 C CNN
	1    3400 3850
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 5B9BC531
P 4700 4150
F 0 "#PWR0104" H 4700 3900 50  0001 C CNN
F 1 "GND" H 4705 3977 50  0000 C CNN
F 2 "" H 4700 4150 50  0001 C CNN
F 3 "" H 4700 4150 50  0001 C CNN
	1    4700 4150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 5B9BC54B
P 3600 4150
F 0 "#PWR0105" H 3600 3900 50  0001 C CNN
F 1 "GND" H 3605 3977 50  0000 C CNN
F 2 "" H 3600 4150 50  0001 C CNN
F 3 "" H 3600 4150 50  0001 C CNN
	1    3600 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 4150 3600 3850
Wire Wire Line
	4700 4050 4700 4150
$Comp
L Device:C C1
U 1 1 5B9BC676
P 4100 4000
F 0 "C1" H 4215 4046 50  0000 L CNN
F 1 "10u" H 4215 3955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4138 3850 50  0001 C CNN
F 3 "~" H 4100 4000 50  0001 C CNN
	1    4100 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 3750 4100 3750
Wire Wire Line
	4100 3850 4100 3750
Connection ~ 4100 3750
Wire Wire Line
	4100 3750 4400 3750
$Comp
L power:GND #PWR0106
U 1 1 5B9BC9BB
P 4100 4150
F 0 "#PWR0106" H 4100 3900 50  0001 C CNN
F 1 "GND" H 4105 3977 50  0000 C CNN
F 2 "" H 4100 4150 50  0001 C CNN
F 3 "" H 4100 4150 50  0001 C CNN
	1    4100 4150
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0107
U 1 1 5B9BCA2B
P 5300 3650
F 0 "#PWR0107" H 5300 3500 50  0001 C CNN
F 1 "+5V" H 5315 3823 50  0000 C CNN
F 2 "" H 5300 3650 50  0001 C CNN
F 3 "" H 5300 3650 50  0001 C CNN
	1    5300 3650
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x03 J2
U 1 1 5B9BCCC2
P 4200 3050
F 0 "J2" V 4166 2862 50  0000 R CNN
F 1 "Output terminal" V 4075 2862 50  0000 R CNN
F 2 "TerminalBlock_MetzConnect:TerminalBlock_MetzConnect_Type171_RT13703HBWC_1x03_P7.50mm_Horizontal" H 4200 3050 50  0001 C CNN
F 3 "~" H 4200 3050 50  0001 C CNN
	1    4200 3050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4100 3250 4100 3750
$Comp
L power:GND #PWR01
U 1 1 5B9BCE4F
P 4300 3450
F 0 "#PWR01" H 4300 3200 50  0001 C CNN
F 1 "GND" H 4305 3277 50  0000 C CNN
F 2 "" H 4300 3450 50  0001 C CNN
F 3 "" H 4300 3450 50  0001 C CNN
	1    4300 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 3250 4300 3450
Wire Wire Line
	4200 3250 4200 3450
Text Label 4200 3450 1    50   ~ 0
DATA
Text Notes 3100 3400 0    50   ~ 0
Max current approx 5A
$Comp
L Device:C C2
U 1 1 5B9BD34B
P 5300 4000
F 0 "C2" H 5415 4046 50  0000 L CNN
F 1 "10u" H 5415 3955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5338 3850 50  0001 C CNN
F 3 "~" H 5300 4000 50  0001 C CNN
	1    5300 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 3650 5300 3750
Wire Wire Line
	5000 3750 5300 3750
Connection ~ 5300 3750
Wire Wire Line
	5300 3750 5300 3850
$Comp
L power:GND #PWR02
U 1 1 5B9BD6F9
P 5300 4150
F 0 "#PWR02" H 5300 3900 50  0001 C CNN
F 1 "GND" H 5305 3977 50  0000 C CNN
F 2 "" H 5300 4150 50  0001 C CNN
F 3 "" H 5300 4150 50  0001 C CNN
	1    5300 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	7750 3850 8100 3850
Text Label 7900 3850 0    50   ~ 0
DATA
Text Label 7900 3750 0    50   ~ 0
LED
Wire Wire Line
	7750 3450 8500 3450
Wire Wire Line
	7750 3550 8500 3550
Wire Wire Line
	7750 3650 8500 3650
Wire Wire Line
	7750 3950 7850 3950
Text Label 7900 3450 0    50   ~ 0
MOSI
Text Label 7900 3550 0    50   ~ 0
MISO
Text Label 7900 3650 0    50   ~ 0
SCK
Wire Wire Line
	8250 3750 8250 3950
Wire Wire Line
	8250 3750 8500 3750
$Comp
L power:GND #PWR04
U 1 1 5B9BF8BE
P 8500 3900
F 0 "#PWR04" H 8500 3650 50  0001 C CNN
F 1 "GND" H 8505 3727 50  0000 C CNN
F 2 "" H 8500 3900 50  0001 C CNN
F 3 "" H 8500 3900 50  0001 C CNN
	1    8500 3900
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x06_Male J3
U 1 1 5B9BFB35
P 8700 3650
F 0 "J3" H 8672 3530 50  0000 R CNN
F 1 "Programmer" H 8672 3621 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Vertical" H 8700 3650 50  0001 C CNN
F 3 "~" H 8700 3650 50  0001 C CNN
	1    8700 3650
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR03
U 1 1 5B9BFC87
P 8500 3200
F 0 "#PWR03" H 8500 3050 50  0001 C CNN
F 1 "+5V" H 8515 3373 50  0000 C CNN
F 2 "" H 8500 3200 50  0001 C CNN
F 3 "" H 8500 3200 50  0001 C CNN
	1    8500 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	8500 3200 8500 3350
Wire Wire Line
	7750 3750 8100 3750
$Comp
L Device:LED D1
U 1 1 5B9C19AE
P 6000 4900
F 0 "D1" H 5991 5116 50  0000 C CNN
F 1 "LED" H 5991 5025 50  0000 C CNN
F 2 "LED_SMD:LED_0603_1608Metric" H 6000 4900 50  0001 C CNN
F 3 "~" H 6000 4900 50  0001 C CNN
	1    6000 4900
	-1   0    0    1   
$EndComp
Wire Wire Line
	5850 4900 5450 4900
Text Label 5450 4900 0    50   ~ 0
LED
$Comp
L Device:R R1
U 1 1 5B9C1EAD
P 6450 4900
F 0 "R1" V 6243 4900 50  0000 C CNN
F 1 "470" V 6334 4900 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6380 4900 50  0001 C CNN
F 3 "~" H 6450 4900 50  0001 C CNN
	1    6450 4900
	0    1    1    0   
$EndComp
Wire Wire Line
	6150 4900 6300 4900
Wire Wire Line
	6600 4900 6850 4900
Wire Wire Line
	6850 4900 6850 5000
$Comp
L power:GND #PWR05
U 1 1 5B9C2640
P 6850 5000
F 0 "#PWR05" H 6850 4750 50  0001 C CNN
F 1 "GND" H 6855 4827 50  0000 C CNN
F 2 "" H 6850 5000 50  0001 C CNN
F 3 "" H 6850 5000 50  0001 C CNN
	1    6850 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 2900 6000 2800
$Comp
L Device:R R2
U 1 1 5B9C4F2A
P 7850 4200
F 0 "R2" H 7780 4154 50  0000 R CNN
F 1 "4k7" H 7780 4245 50  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 7780 4200 50  0001 C CNN
F 3 "~" H 7850 4200 50  0001 C CNN
	1    7850 4200
	-1   0    0    1   
$EndComp
Wire Wire Line
	7850 4050 7850 3950
Connection ~ 7850 3950
Wire Wire Line
	7850 3950 8250 3950
$Comp
L power:+5V #PWR06
U 1 1 5B9C5416
P 7850 4450
F 0 "#PWR06" H 7850 4300 50  0001 C CNN
F 1 "+5V" H 7865 4623 50  0000 C CNN
F 2 "" H 7850 4450 50  0001 C CNN
F 3 "" H 7850 4450 50  0001 C CNN
	1    7850 4450
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR07
U 1 1 5B9C5A3D
P 8250 4450
F 0 "#PWR07" H 8250 4200 50  0001 C CNN
F 1 "GND" H 8255 4277 50  0000 C CNN
F 2 "" H 8250 4450 50  0001 C CNN
F 3 "" H 8250 4450 50  0001 C CNN
	1    8250 4450
	1    0    0    -1  
$EndComp
$Comp
L Device:C C5
U 1 1 5B9C69B4
P 8250 4200
F 0 "C5" H 8365 4246 50  0000 L CNN
F 1 "100n" H 8365 4155 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 8288 4050 50  0001 C CNN
F 3 "~" H 8250 4200 50  0001 C CNN
	1    8250 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	8250 3950 8250 4050
Connection ~ 8250 3950
Wire Wire Line
	7850 4350 7850 4450
Wire Wire Line
	8250 4350 8250 4450
Wire Wire Line
	8500 3850 8500 3900
$Comp
L MCU_Microchip_ATtiny:ATtiny13-20SU U2
U 1 1 5B9F75CD
P 7150 3750
F 0 "U2" H 6620 3796 50  0000 R CNN
F 1 "ATtiny13-20SU" H 6620 3705 50  0000 R CNN
F 2 "Package_SO:SOIJ-8_5.3x5.3mm_P1.27mm" H 7150 3750 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/doc2535.pdf" H 7150 3750 50  0001 C CNN
	1    7150 3750
	1    0    0    -1  
$EndComp
$EndSCHEMATC
