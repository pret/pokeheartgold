#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000755_00000147 ; 000
	scrdef scr_seq_00000755_0000015A ; 001
	scrdef scr_seq_00000755_00000A00 ; 002
	scrdef scr_seq_00000755_00000A13 ; 003
	scrdef scr_seq_00000755_00000A26 ; 004
	scrdef scr_seq_00000755_00000A39 ; 005
	scrdef scr_seq_00000755_00000A4A ; 006
	scrdef scr_seq_00000755_00000A5B ; 007
	scrdef scr_seq_00000755_00000A6C ; 008
	scrdef scr_seq_00000755_00000A7D ; 009
	scrdef scr_seq_00000755_00000A8E ; 010
	scrdef scr_seq_00000755_00000A9F ; 011
	scrdef scr_seq_00000755_00000AB0 ; 012
	scrdef scr_seq_00000755_00000608 ; 013
	scrdef scr_seq_00000755_00000052 ; 014
	scrdef scr_seq_00000755_000007A3 ; 015
	scrdef scr_seq_00000755_000007DF ; 016
	scrdef scr_seq_00000755_0000013F ; 017
	scrdef scr_seq_00000755_000007A5 ; 018
	scrdef scr_seq_00000755_0000078C ; 019
	scrdef_end

scr_seq_00000755_00000052:
	comparevartovalue VAR_UNK_4083, 5
	gotoif ge, scr_seq_00000755_000000E8
	comparevartovalue VAR_UNK_4083, 4
	gotoif eq, scr_seq_00000755_000000E8
	comparevartovalue VAR_UNK_4083, 3
	gotoif eq, scr_seq_00000755_000000D8
	comparevartovalue VAR_UNK_4083, 2
	gotoif eq, scr_seq_00000755_000000D8
	comparevartovalue VAR_UNK_4083, 1
	gotoif eq, scr_seq_00000755_000000CE
	hasitem ITEM_ENIGMA_STONE, 1, VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, scr_seq_00000755_000000F4
	scrcmd_546 0, 16384
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, scr_seq_00000755_000000F4
	scrcmd_490 16391
	setvar VAR_UNK_4083, 1
	clearflag FLAG_UNK_308
	setflag FLAG_UNK_317
	end

scr_seq_00000755_000000CE:
	clearflag FLAG_UNK_308
	setflag FLAG_UNK_317
	end

scr_seq_00000755_000000D8:
	setflag FLAG_UNK_308
	setflag FLAG_UNK_317
	goto scr_seq_00000755_00000104

scr_seq_00000755_000000E6:
	.byte 0x02, 0x00
scr_seq_00000755_000000E8:
	setflag FLAG_UNK_308
	goto scr_seq_00000755_00000104

scr_seq_00000755_000000F2:
	.byte 0x02, 0x00
scr_seq_00000755_000000F4:
	scrcmd_490 16390
	setflag FLAG_UNK_308
	goto scr_seq_00000755_00000104

scr_seq_00000755_00000102:
	.byte 0x02, 0x00
scr_seq_00000755_00000104:
	checkflag FLAG_UNK_189
	gotoif lt, scr_seq_00000755_00000115
	clearflag FLAG_UNK_189
	end

scr_seq_00000755_00000115:
	scrcmd_484 16384
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, scr_seq_00000755_00000139
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, scr_seq_00000755_00000139
	setflag FLAG_UNK_27E
	end

scr_seq_00000755_00000139:
	clearflag FLAG_UNK_27E
	end

scr_seq_00000755_0000013F:
	end

scr_seq_00000755_00000141:
	.byte 0xea, 0x01, 0x06, 0x40, 0x02, 0x00
scr_seq_00000755_00000147:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000755_0000015A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_784 2, 0
	checkflag FLAG_UNK_001
	gotoif eq, scr_seq_00000755_00000530
	comparevartovalue VAR_UNK_407F, 0
	gotoif ne, scr_seq_00000755_00000550
	msgbox 1
	countfossils VAR_SPECIAL_x8000
	comparevartovalue VAR_SPECIAL_x8000, 0
	gotoif ne, scr_seq_00000755_0000019B
	msgbox 6
	goto scr_seq_00000755_000005FC

scr_seq_00000755_0000019B:
	comparevartovalue VAR_SPECIAL_x8000, 1
	gotoif eq, scr_seq_00000755_000004F7
	setvar VAR_SPECIAL_x8001, 0
	hasitem ITEM_OLD_AMBER, 1, VAR_SPECIAL_x800C
	addvar VAR_SPECIAL_x8001, VAR_SPECIAL_x800C
	hasitem ITEM_HELIX_FOSSIL, 1, VAR_SPECIAL_x800C
	addvar VAR_SPECIAL_x8001, VAR_SPECIAL_x800C
	hasitem ITEM_DOME_FOSSIL, 1, VAR_SPECIAL_x800C
	addvar VAR_SPECIAL_x8001, VAR_SPECIAL_x800C
	hasitem ITEM_ROOT_FOSSIL, 1, VAR_SPECIAL_x800C
	addvar VAR_SPECIAL_x8001, VAR_SPECIAL_x800C
	hasitem ITEM_CLAW_FOSSIL, 1, VAR_SPECIAL_x800C
	addvar VAR_SPECIAL_x8001, VAR_SPECIAL_x800C
	hasitem ITEM_ARMOR_FOSSIL, 1, VAR_SPECIAL_x800C
	addvar VAR_SPECIAL_x8001, VAR_SPECIAL_x800C
	hasitem ITEM_SKULL_FOSSIL, 1, VAR_SPECIAL_x800C
	addvar VAR_SPECIAL_x8001, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8001, 1
	gotoif eq, scr_seq_00000755_000004F7
	setvar VAR_SPECIAL_x8004, 0
	setvar VAR_SPECIAL_x8005, 0
	setvar VAR_TEMP_x4000, 0
	setvar VAR_TEMP_x4001, 0
	setvar VAR_TEMP_x4002, 0
	setvar VAR_TEMP_x4003, 0
	setvar VAR_TEMP_x4004, 0
	setvar VAR_TEMP_x4005, 0
	setvar VAR_TEMP_x4006, 0
	setvar VAR_TEMP_x4007, 0
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x8000
scr_seq_00000755_00000263:
	comparevartovalue VAR_SPECIAL_x8005, 0
	callif eq, scr_seq_00000755_00000417
	comparevartovalue VAR_SPECIAL_x8005, 1
	callif eq, scr_seq_00000755_00000427
	comparevartovalue VAR_SPECIAL_x8005, 2
	callif eq, scr_seq_00000755_00000437
	comparevartovalue VAR_SPECIAL_x8005, 3
	callif eq, scr_seq_00000755_00000447
	comparevartovalue VAR_SPECIAL_x8005, 4
	callif eq, scr_seq_00000755_00000457
	comparevartovalue VAR_SPECIAL_x8005, 5
	callif eq, scr_seq_00000755_00000467
	comparevartovalue VAR_SPECIAL_x8005, 6
	callif eq, scr_seq_00000755_00000477
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000755_00000340
	comparevartovalue VAR_SPECIAL_x8004, 0
	callif eq, scr_seq_00000755_00000487
	comparevartovalue VAR_SPECIAL_x8004, 1
	callif eq, scr_seq_00000755_0000048F
	comparevartovalue VAR_SPECIAL_x8004, 2
	callif eq, scr_seq_00000755_00000497
	comparevartovalue VAR_SPECIAL_x8004, 3
	callif eq, scr_seq_00000755_0000049F
	comparevartovalue VAR_SPECIAL_x8004, 4
	callif eq, scr_seq_00000755_000004A7
	comparevartovalue VAR_SPECIAL_x8004, 5
	callif eq, scr_seq_00000755_000004AF
	comparevartovalue VAR_SPECIAL_x8004, 6
	callif eq, scr_seq_00000755_000004B7
	copyvar VAR_SPECIAL_x8006, VAR_SPECIAL_x8005
	addvar VAR_SPECIAL_x8006, 159
	scrcmd_751 32774, 255, 32772
	goto scr_seq_00000755_0000034C

scr_seq_00000755_00000340:
	addvar VAR_SPECIAL_x8005, 1
	goto scr_seq_00000755_00000263

scr_seq_00000755_0000034C:
	addvar VAR_SPECIAL_x8004, 1
	addvar VAR_SPECIAL_x8005, 1
	comparevartovar VAR_SPECIAL_x8004, VAR_SPECIAL_x8001
	gotoif ne, scr_seq_00000755_00000263
	scrcmd_751 45, 255, 32772
	scrcmd_752
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x8000, 255
	gotoif eq, scr_seq_00000755_0000053F
	comparevartovalue VAR_SPECIAL_x8000, 0
	callif eq, scr_seq_00000755_000004BF
	comparevartovalue VAR_SPECIAL_x8000, 1
	callif eq, scr_seq_00000755_000004C7
	comparevartovalue VAR_SPECIAL_x8000, 2
	callif eq, scr_seq_00000755_000004CF
	comparevartovalue VAR_SPECIAL_x8000, 3
	callif eq, scr_seq_00000755_000004D7
	comparevartovalue VAR_SPECIAL_x8000, 4
	callif eq, scr_seq_00000755_000004DF
	comparevartovalue VAR_SPECIAL_x8000, 5
	callif eq, scr_seq_00000755_000004E7
	comparevartovalue VAR_SPECIAL_x8000, 6
	callif eq, scr_seq_00000755_000004EF
	getfossilpokemon 16511, 32770
	comparevartovalue VAR_UNK_407F, 0
	gotoif eq, scr_seq_00000755_0000053F
	scrcmd_194 0, 32770
	msgbox 7
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000755_0000053F
	takeitem VAR_SPECIAL_x8002, 1, VAR_SPECIAL_x800C
	goto scr_seq_00000755_00000530

scr_seq_00000755_00000417:
	setvar VAR_TEMP_x4000, 103
	hasitem VAR_TEMP_x4000, 1, VAR_SPECIAL_x800C
	return

scr_seq_00000755_00000427:
	setvar VAR_TEMP_x4000, 101
	hasitem VAR_TEMP_x4000, 1, VAR_SPECIAL_x800C
	return

scr_seq_00000755_00000437:
	setvar VAR_TEMP_x4000, 102
	hasitem VAR_TEMP_x4000, 1, VAR_SPECIAL_x800C
	return

scr_seq_00000755_00000447:
	setvar VAR_TEMP_x4000, 99
	hasitem VAR_TEMP_x4000, 1, VAR_SPECIAL_x800C
	return

scr_seq_00000755_00000457:
	setvar VAR_TEMP_x4000, 100
	hasitem VAR_TEMP_x4000, 1, VAR_SPECIAL_x800C
	return

scr_seq_00000755_00000467:
	setvar VAR_TEMP_x4000, 104
	hasitem VAR_TEMP_x4000, 1, VAR_SPECIAL_x800C
	return

scr_seq_00000755_00000477:
	setvar VAR_TEMP_x4000, 105
	hasitem VAR_TEMP_x4000, 1, VAR_SPECIAL_x800C
	return

scr_seq_00000755_00000487:
	copyvar VAR_TEMP_x4001, VAR_TEMP_x4000
	return

scr_seq_00000755_0000048F:
	copyvar VAR_TEMP_x4002, VAR_TEMP_x4000
	return

scr_seq_00000755_00000497:
	copyvar VAR_TEMP_x4003, VAR_TEMP_x4000
	return

scr_seq_00000755_0000049F:
	copyvar VAR_TEMP_x4004, VAR_TEMP_x4000
	return

scr_seq_00000755_000004A7:
	copyvar VAR_TEMP_x4005, VAR_TEMP_x4000
	return

scr_seq_00000755_000004AF:
	copyvar VAR_TEMP_x4006, VAR_TEMP_x4000
	return

scr_seq_00000755_000004B7:
	copyvar VAR_TEMP_x4007, VAR_TEMP_x4000
	return

scr_seq_00000755_000004BF:
	copyvar VAR_SPECIAL_x8002, VAR_TEMP_x4001
	return

scr_seq_00000755_000004C7:
	copyvar VAR_SPECIAL_x8002, VAR_TEMP_x4002
	return

scr_seq_00000755_000004CF:
	copyvar VAR_SPECIAL_x8002, VAR_TEMP_x4003
	return

scr_seq_00000755_000004D7:
	copyvar VAR_SPECIAL_x8002, VAR_TEMP_x4004
	return

scr_seq_00000755_000004DF:
	copyvar VAR_SPECIAL_x8002, VAR_TEMP_x4005
	return

scr_seq_00000755_000004E7:
	copyvar VAR_SPECIAL_x8002, VAR_TEMP_x4006
	return

scr_seq_00000755_000004EF:
	copyvar VAR_SPECIAL_x8002, VAR_TEMP_x4007
	return

scr_seq_00000755_000004F7:
	getfossilminimumamount 32770, 32772, 1
	scrcmd_194 0, 32770
	msgbox 7
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000755_0000053F
	getfossilpokemon 16511, 32770
	takeitem VAR_SPECIAL_x8002, 1, VAR_SPECIAL_x800C
	goto scr_seq_00000755_00000530

scr_seq_00000755_00000530:
	setflag FLAG_UNK_001
	msgbox 3
	goto scr_seq_00000755_000005FC

scr_seq_00000755_0000053D:
	.byte 0x02, 0x00
scr_seq_00000755_0000053F:
	setvar VAR_UNK_407F, 0
	msgbox 2
	goto scr_seq_00000755_000005FC

scr_seq_00000755_0000054E:
	.byte 0x02, 0x00
scr_seq_00000755_00000550:
	scrcmd_202 0, 16511, 0, 0
	msgbox 4
	scrcmd_332 32780
	comparevartovalue VAR_SPECIAL_x800C, 6
	gotoif ne, scr_seq_00000755_00000575
	msgbox 5
	goto scr_seq_00000755_000005FC

scr_seq_00000755_00000575:
	scrcmd_202 1, 16511, 0, 0
	scrcmd_190 0
	scrcmd_078 1187
	msgbox 8
	scrcmd_079
	scrcmd_137 16511, 20, 0, 0, 0, 32780
	scrcmd_420 116
	setvar VAR_UNK_407F, 0
	msgbox 9
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000755_00000600
	scrcmd_332 16384
	subvar VAR_TEMP_x4000, 1
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_173 16384, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000755_000005E8
	scrcmd_420 50
scr_seq_00000755_000005E8:
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	scrcmd_784 2, 1
	releaseall
	end

scr_seq_00000755_000005FC:
	waitbutton
	closemsg
scr_seq_00000755_00000600:
	scrcmd_784 2, 1
	releaseall
	end

scr_seq_00000755_00000608:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_438 2, 32780
	scrcmd_440 32780, 0
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000755_0000070D
	scrcmd_618 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000755_00000721
	scrcmd_438 2, 32780
	scrcmd_440 32780, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000755_00000681
	apply_movement 255, scr_seq_00000755_00000738
	apply_movement 5, scr_seq_00000755_00000770
	goto scr_seq_00000755_000006AC

scr_seq_00000755_00000681:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000755_0000069C
	apply_movement 255, scr_seq_00000755_00000750
	goto scr_seq_00000755_000006AC

scr_seq_00000755_0000069C:
	apply_movement 255, scr_seq_00000755_0000075C
	apply_movement 5, scr_seq_00000755_00000770
scr_seq_00000755_000006AC:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000755_000006D3
	apply_movement 253, scr_seq_00000755_0000077C
	wait_movement
scr_seq_00000755_000006D3:
	setflag FLAG_UNK_189
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_615 65
	lockall
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	clearflag FLAG_UNK_189
	scrcmd_438 2, 32780
	scrcmd_440 32780, 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000755_0000070D:
	scrcmd_438 2, 32780
	scrcmd_440 32780, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000755_00000721:
	scrcmd_438 2, 32780
	scrcmd_440 32780, 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000755_00000735:
	.byte 0x00, 0x00, 0x00

scr_seq_00000755_00000738:
	.short 14, 1
	.short 12, 2
	.short 15, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000755_00000750:
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000755_0000075C:
	.short 12, 1
	.short 15, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000755_00000770:
	.short 63, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000755_0000077C:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
scr_seq_00000755_0000078C:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 13
	waitbutton
	closemsg
	setvar VAR_UNK_4130, 5
	releaseall
	end

scr_seq_00000755_000007A3:
	end

scr_seq_00000755_000007A5:
	comparevartovalue VAR_UNK_4083, 0
	gotoif eq, scr_seq_00000755_000007BF
	comparevartovalue VAR_UNK_4083, 1
	gotoif eq, scr_seq_00000755_000007C1
scr_seq_00000755_000007BF:
	end

scr_seq_00000755_000007C1:
	scrcmd_490 16515
	scrcmd_344 0, 0
	scrcmd_339 6, 26, 0, 7, 1
	goto scr_seq_00000755_000007BF

scr_seq_00000755_000007DD:
	.byte 0x02, 0x00
scr_seq_00000755_000007DF:
	scrcmd_609
	lockall
	hasitem ITEM_ENIGMA_STONE, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000755_00000963
	scrcmd_546 0, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000755_00000963
	apply_movement 6, scr_seq_00000755_00000968
	wait_movement
	msgbox 14
	closemsg
	apply_movement 6, scr_seq_00000755_00000970
	wait_movement
	msgbox 15
	msgbox 16
	closemsg
	apply_movement 6, scr_seq_00000755_0000097C
	apply_movement 0, scr_seq_00000755_000009C8
	wait_movement
	scrcmd_105 16384, 16385
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	comparevartovalue VAR_TEMP_x4001, 6
	gotoif ne, scr_seq_00000755_00000868
	apply_movement 255, scr_seq_00000755_00000998
	goto scr_seq_00000755_00000870

scr_seq_00000755_00000868:
	apply_movement 255, scr_seq_00000755_0000098C
scr_seq_00000755_00000870:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	apply_movement 255, scr_seq_00000755_000009A4
	wait_movement
	scrcmd_190 0
	msgbox 17
	closemsg
	apply_movement 0, scr_seq_00000755_000009D0
	wait_movement
	msgbox 18
	closemsg
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	wait 30, VAR_SPECIAL_x800C
	scrcmd_099 6
	scrcmd_339 6, 25, 0, 7, 1
	wait 10, VAR_SPECIAL_x800C
	scrcmd_098 6
	comparevartovalue VAR_TEMP_x4001, 6
	gotoif eq, scr_seq_00000755_000008F1
	scrcmd_729 16393
	comparevartovalue VAR_TEMP_x4009, 0
	gotoif eq, scr_seq_00000755_000008F1
	apply_movement 253, scr_seq_00000755_000009F0
	wait_movement
scr_seq_00000755_000008F1:
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	wait 10, VAR_SPECIAL_x800C
	apply_movement 0, scr_seq_00000755_000009D0
	wait_movement
	msgbox 19
	closemsg
	apply_movement 0, scr_seq_00000755_000009D8
	wait_movement
	takeitem ITEM_ENIGMA_STONE, 1, VAR_SPECIAL_x800C
	setvar VAR_SPECIAL_x8004, 225
	setvar VAR_SPECIAL_x8005, 1
	callstd 2008
	closemsg
	apply_movement 6, scr_seq_00000755_000009B8
	wait_movement
	apply_movement 255, scr_seq_00000755_00000968
	wait_movement
	msgbox 21
	closemsg
	apply_movement 6, scr_seq_00000755_000009C0
	wait_movement
	setvar VAR_UNK_4083, 2
	scrcmd_101 6
scr_seq_00000755_00000963:
	releaseall
	end

scr_seq_00000755_00000967:
	.byte 0x00

scr_seq_00000755_00000968:
	.short 34, 1
	.short 254, 0

scr_seq_00000755_00000970:
	.short 63, 1
	.short 75, 1
	.short 254, 0

scr_seq_00000755_0000097C:
	.short 71, 1
	.short 15, 1
	.short 72, 1
	.short 254, 0

scr_seq_00000755_0000098C:
	.short 15, 1
	.short 1, 1
	.short 254, 0

scr_seq_00000755_00000998:
	.short 15, 1
	.short 13, 1
	.short 254, 0

scr_seq_00000755_000009A4:
	.short 13, 1
	.short 63, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0

scr_seq_00000755_000009B8:
	.short 3, 1
	.short 254, 0

scr_seq_00000755_000009C0:
	.short 14, 8
	.short 254, 0

scr_seq_00000755_000009C8:
	.short 32, 1
	.short 254, 0

scr_seq_00000755_000009D0:
	.short 32, 1
	.short 254, 0

scr_seq_00000755_000009D8:
	.short 12, 1
	.short 32, 1
	.short 71, 1
	.short 13, 1
	.short 72, 1
	.short 254, 0

scr_seq_00000755_000009F0:
	.short 20, 1
	.short 23, 1
	.short 1, 1
	.short 254, 0
scr_seq_00000755_00000A00:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000755_00000A13:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 11
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000755_00000A26:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 12
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000755_00000A39:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 22
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000755_00000A4A:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 23
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000755_00000A5B:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 24
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000755_00000A6C:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 25
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000755_00000A7D:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 26
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000755_00000A8E:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 27
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000755_00000A9F:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 28
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000755_00000AB0:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 29
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
