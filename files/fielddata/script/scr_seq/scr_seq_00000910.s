#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000910_00000016 ; 000
	scrdef scr_seq_00000910_00000098 ; 001
	scrdef scr_seq_00000910_0000011B ; 002
	scrdef scr_seq_00000910_000001D4 ; 003
	scrdef scr_seq_00000910_000008B0 ; 004
	scrdef_end

scr_seq_00000910_00000016:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	hasitem ITEM_COIN_CASE, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000910_0000006A
	apply_movement 0, scr_seq_00000910_00000080
	wait_movement
	msgbox 40
	closemsg
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_780 0, 0
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	setvar VAR_TEMP_x4001, 2
	releaseall
	end

scr_seq_00000910_0000006A:
	msgbox 38
	apply_movement 0, scr_seq_00000910_00000080
	wait_movement
	msgbox 39
	goto scr_seq_00000910_000000E8


scr_seq_00000910_00000080:
	.short 1, 1
	.short 254, 0

scr_seq_00000910_00000088:
	.short 2, 1
	.short 254, 0

scr_seq_00000910_00000090:
	.short 3, 1
	.short 254, 0
scr_seq_00000910_00000098:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_386 16386
	comparevartovalue VAR_TEMP_x4002, 1
	gotoif ne, scr_seq_00000910_000000BD
	call scr_seq_00000910_000000F0
	goto scr_seq_00000910_000000C5

scr_seq_00000910_000000BD:
	apply_movement 0, scr_seq_00000910_00000080
scr_seq_00000910_000000C5:
	wait_movement
	hasitem ITEM_COIN_CASE, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000910_000000E5
	msgbox 41
	goto scr_seq_00000910_000000E8

scr_seq_00000910_000000E5:
	msgbox 39
scr_seq_00000910_000000E8:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000910_000000F0:
	scrcmd_105 16386, 16387
	comparevartovalue VAR_TEMP_x4002, 6
	gotoif ne, scr_seq_00000910_00000111
	apply_movement 0, scr_seq_00000910_00000088
	goto scr_seq_00000910_00000119

scr_seq_00000910_00000111:
	apply_movement 0, scr_seq_00000910_00000090
scr_seq_00000910_00000119:
	return

scr_seq_00000910_0000011B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	hasitem ITEM_COIN_CASE, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000910_00000175
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_00000910_00000154
	msgbox 34
	setvar VAR_TEMP_x4001, 1
	goto scr_seq_00000910_0000016D

scr_seq_00000910_00000154:
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif ne, scr_seq_00000910_0000016A
	msgbox 35
	goto scr_seq_00000910_0000016D

scr_seq_00000910_0000016A:
	msgbox 36
scr_seq_00000910_0000016D:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000910_00000175:
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_00000910_0000018B
	msgbox 28
	goto scr_seq_00000910_0000018E

scr_seq_00000910_0000018B:
	msgbox 37
scr_seq_00000910_0000018E:
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000910_000001C5
	msgbox 31
	setvar VAR_TEMP_x4001, 1
	setvar VAR_SPECIAL_x8004, 444
	setvar VAR_SPECIAL_x8005, 1
	callstd 2033
	msgbox 32
	goto scr_seq_00000910_000000E8

scr_seq_00000910_000001C5:
	setvar VAR_TEMP_x4001, 1
	msgbox 33
	goto scr_seq_00000910_000000E8

scr_seq_00000910_000001D4:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_784 3, 0
	msgbox 0
	scrcmd_746
	scrcmd_116 0, 20, 2
scr_seq_00000910_000001EC:
	scrcmd_750 1, 1, 0, 1, VAR_TEMP_x4000
	scrcmd_751 12, 255, 0
	scrcmd_751 13, 255, 1
	scrcmd_751 11, 255, 2
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000910_00000234
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000910_000002D0
	goto scr_seq_00000910_00000C17

scr_seq_00000910_00000234:
	scrcmd_750 1, 1, 0, 1, VAR_TEMP_x4000
	scrcmd_751 14, 255, 0
	scrcmd_751 15, 255, 1
	scrcmd_751 16, 255, 2
	scrcmd_751 17, 255, 3
	scrcmd_751 18, 255, 4
	scrcmd_751 19, 255, 5
	scrcmd_751 11, 255, 6
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000910_00000342
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000910_000003CD
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000910_00000458
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_00000910_000004E3
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_00000910_0000056E
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, scr_seq_00000910_000005F9
	goto scr_seq_00000910_000001EC

scr_seq_00000910_000002D0:
	scrcmd_750 1, 1, 0, 1, VAR_TEMP_x4000
	scrcmd_751 20, 255, 0
	scrcmd_751 21, 255, 1
	scrcmd_751 22, 255, 2
	scrcmd_751 23, 255, 3
	scrcmd_751 11, 255, 4
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000910_00000684
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000910_0000070F
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000910_0000079A
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_00000910_00000825
	goto scr_seq_00000910_000001EC

scr_seq_00000910_00000342:
	setvar VAR_SPECIAL_x8004, 417
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000910_00000B45
	scrcmd_194 0, 32772
	msgbox 3
	scrcmd_748 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000910_0000038B
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000910_00000234
scr_seq_00000910_0000038B:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 2000
	gotoif lt, scr_seq_00000910_00000BE6
	msgbox 4
	play_se SEQ_SE_DP_REGI
	scrcmd_121 2000
	scrcmd_118 0
	scrcmd_194 0, 32772
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_195 1, 32780
	msgbox 10
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto scr_seq_00000910_00000234

scr_seq_00000910_000003CB:
	.byte 0x02, 0x00
scr_seq_00000910_000003CD:
	setvar VAR_SPECIAL_x8004, 402
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000910_00000B45
	scrcmd_194 0, 32772
	msgbox 3
	scrcmd_748 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000910_00000416
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000910_00000234
scr_seq_00000910_00000416:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 4000
	gotoif lt, scr_seq_00000910_00000BE6
	msgbox 4
	play_se SEQ_SE_DP_REGI
	scrcmd_121 4000
	scrcmd_118 0
	scrcmd_194 0, 32772
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_195 1, 32780
	msgbox 10
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto scr_seq_00000910_00000234

scr_seq_00000910_00000456:
	.byte 0x02, 0x00
scr_seq_00000910_00000458:
	setvar VAR_SPECIAL_x8004, 371
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000910_00000B45
	scrcmd_194 0, 32772
	msgbox 3
	scrcmd_748 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000910_000004A1
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000910_00000234
scr_seq_00000910_000004A1:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 6000
	gotoif lt, scr_seq_00000910_00000BE6
	msgbox 4
	play_se SEQ_SE_DP_REGI
	scrcmd_121 6000
	scrcmd_118 0
	scrcmd_194 0, 32772
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_195 1, 32780
	msgbox 10
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto scr_seq_00000910_00000234

scr_seq_00000910_000004E1:
	.byte 0x02, 0x00
scr_seq_00000910_000004E3:
	setvar VAR_SPECIAL_x8004, 362
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000910_00000B45
	scrcmd_194 0, 32772
	msgbox 3
	scrcmd_748 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000910_0000052C
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000910_00000234
scr_seq_00000910_0000052C:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 10000
	gotoif lt, scr_seq_00000910_00000BE6
	msgbox 4
	play_se SEQ_SE_DP_REGI
	scrcmd_121 10000
	scrcmd_118 0
	scrcmd_194 0, 32772
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_195 1, 32780
	msgbox 10
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto scr_seq_00000910_00000234

scr_seq_00000910_0000056C:
	.byte 0x02, 0x00
scr_seq_00000910_0000056E:
	setvar VAR_SPECIAL_x8004, 340
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000910_00000B45
	scrcmd_194 0, 32772
	msgbox 3
	scrcmd_748 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000910_000005B7
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000910_00000234
scr_seq_00000910_000005B7:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 10000
	gotoif lt, scr_seq_00000910_00000BE6
	msgbox 4
	play_se SEQ_SE_DP_REGI
	scrcmd_121 10000
	scrcmd_118 0
	scrcmd_194 0, 32772
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_195 1, 32780
	msgbox 10
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto scr_seq_00000910_00000234

scr_seq_00000910_000005F7:
	.byte 0x02, 0x00
scr_seq_00000910_000005F9:
	setvar VAR_SPECIAL_x8004, 351
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000910_00000B45
	scrcmd_194 0, 32772
	msgbox 3
	scrcmd_748 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000910_00000642
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000910_00000234
scr_seq_00000910_00000642:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 10000
	gotoif lt, scr_seq_00000910_00000BE6
	msgbox 4
	play_se SEQ_SE_DP_REGI
	scrcmd_121 10000
	scrcmd_118 0
	scrcmd_194 0, 32772
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_195 1, 32780
	msgbox 10
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto scr_seq_00000910_00000234

scr_seq_00000910_00000682:
	.byte 0x02, 0x00
scr_seq_00000910_00000684:
	setvar VAR_SPECIAL_x8004, 251
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000910_00000B45
	scrcmd_194 0, 32772
	msgbox 3
	scrcmd_748 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000910_000006CD
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000910_000002D0
scr_seq_00000910_000006CD:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 1000
	gotoif lt, scr_seq_00000910_00000BE6
	msgbox 4
	play_se SEQ_SE_DP_REGI
	scrcmd_121 1000
	scrcmd_118 0
	scrcmd_194 0, 32772
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_195 1, 32780
	msgbox 10
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto scr_seq_00000910_000002D0

scr_seq_00000910_0000070D:
	.byte 0x02, 0x00
scr_seq_00000910_0000070F:
	setvar VAR_SPECIAL_x8004, 265
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000910_00000B45
	scrcmd_194 0, 32772
	msgbox 3
	scrcmd_748 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000910_00000758
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000910_000002D0
scr_seq_00000910_00000758:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 1000
	gotoif lt, scr_seq_00000910_00000BE6
	msgbox 4
	play_se SEQ_SE_DP_REGI
	scrcmd_121 1000
	scrcmd_118 0
	scrcmd_194 0, 32772
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_195 1, 32780
	msgbox 10
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto scr_seq_00000910_000002D0

scr_seq_00000910_00000798:
	.byte 0x02, 0x00
scr_seq_00000910_0000079A:
	setvar VAR_SPECIAL_x8004, 276
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000910_00000B45
	scrcmd_194 0, 32772
	msgbox 3
	scrcmd_748 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000910_000007E3
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000910_000002D0
scr_seq_00000910_000007E3:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 1000
	gotoif lt, scr_seq_00000910_00000BE6
	msgbox 4
	play_se SEQ_SE_DP_REGI
	scrcmd_121 1000
	scrcmd_118 0
	scrcmd_194 0, 32772
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_195 1, 32780
	msgbox 10
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto scr_seq_00000910_000002D0

scr_seq_00000910_00000823:
	.byte 0x02, 0x00
scr_seq_00000910_00000825:
	setvar VAR_SPECIAL_x8004, 277
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000910_00000B45
	scrcmd_194 0, 32772
	msgbox 3
	scrcmd_748 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000910_0000086E
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000910_000002D0
scr_seq_00000910_0000086E:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 1000
	gotoif lt, scr_seq_00000910_00000BE6
	msgbox 4
	play_se SEQ_SE_DP_REGI
	scrcmd_121 1000
	scrcmd_118 0
	scrcmd_194 0, 32772
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_195 1, 32780
	msgbox 10
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto scr_seq_00000910_000002D0

scr_seq_00000910_000008AE:
	.byte 0x02, 0x00
scr_seq_00000910_000008B0:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_784 3, 0
	msgbox 9
	scrcmd_746
	scrcmd_116 0, 20, 2
	scrcmd_495 16384
	comparevartovalue VAR_TEMP_x4000, 7
	gotoif ne, scr_seq_00000910_000008E5
	goto scr_seq_00000910_000008EB

scr_seq_00000910_000008DF:
	.byte 0x16
	.byte 0x00, 0x06, 0x00, 0x00, 0x00
scr_seq_00000910_000008E5:
	goto scr_seq_00000910_00000948

scr_seq_00000910_000008EB:
	scrcmd_750 1, 1, 0, 1, VAR_TEMP_x4000
	scrcmd_751 24, 255, 0
	scrcmd_751 25, 255, 1
	scrcmd_751 26, 255, 2
	scrcmd_751 11, 255, 3
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000910_000009A5
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000910_000009B1
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000910_000009BD
	goto scr_seq_00000910_00000C17

scr_seq_00000910_00000948:
	scrcmd_750 1, 1, 0, 1, VAR_TEMP_x4000
	scrcmd_751 24, 255, 0
	scrcmd_751 27, 255, 1
	scrcmd_751 26, 255, 2
	scrcmd_751 11, 255, 3
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000910_000009A5
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000910_000009C9
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000910_000009BD
	goto scr_seq_00000910_00000C17

scr_seq_00000910_000009A5:
	setorcopyvar VAR_TEMP_x4002, 63
	goto scr_seq_00000910_000009D5

scr_seq_00000910_000009B1:
	setorcopyvar VAR_TEMP_x4002, 23
	goto scr_seq_00000910_000009D5

scr_seq_00000910_000009BD:
	setorcopyvar VAR_TEMP_x4002, 147
	goto scr_seq_00000910_000009D5

scr_seq_00000910_000009C9:
	setorcopyvar VAR_TEMP_x4002, 27
	goto scr_seq_00000910_000009D5

scr_seq_00000910_000009D5:
	scrcmd_332 32773
	comparevartovalue VAR_SPECIAL_x8005, 6
	gotoif ne, scr_seq_00000910_000009F3
	msgbox 6
	waitbutton
	closemsg
	goto scr_seq_00000910_00000C26

scr_seq_00000910_000009F3:
	scrcmd_202 1, 16386, 0, 0
	msgbox 7
	scrcmd_748 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000910_00000A34
	closemsg
	scrcmd_495 16384
	comparevartovalue VAR_TEMP_x4000, 7
	gotoif ne, scr_seq_00000910_00000A2E
	goto scr_seq_00000910_000008EB

scr_seq_00000910_00000A28:
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
scr_seq_00000910_00000A2E:
	goto scr_seq_00000910_00000948

scr_seq_00000910_00000A34:
	comparevartovalue VAR_TEMP_x4002, 63
	gotoif ne, scr_seq_00000910_00000A58
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 200
	gotoif lt, scr_seq_00000910_00000BF1
	goto scr_seq_00000910_00000AB1

scr_seq_00000910_00000A58:
	comparevartovalue VAR_TEMP_x4002, 23
	gotoif ne, scr_seq_00000910_00000A7C
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 700
	gotoif lt, scr_seq_00000910_00000BF1
	goto scr_seq_00000910_00000AB1

scr_seq_00000910_00000A7C:
	comparevartovalue VAR_TEMP_x4002, 27
	gotoif ne, scr_seq_00000910_00000AA0
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 700
	gotoif lt, scr_seq_00000910_00000BF1
	goto scr_seq_00000910_00000AB1

scr_seq_00000910_00000AA0:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 2100
	gotoif lt, scr_seq_00000910_00000BF1
scr_seq_00000910_00000AB1:
	msgbox 4
	play_se SEQ_SE_DP_REGI
	scrcmd_137 16386, 15, 0, 0, 0, 32780
	scrcmd_190 0
	scrcmd_202 1, 16386, 0, 0
	msgbox 8
	comparevartovalue VAR_TEMP_x4002, 63
	gotoif ne, scr_seq_00000910_00000AEB
	scrcmd_121 200
	goto scr_seq_00000910_00000B1D

scr_seq_00000910_00000AEB:
	comparevartovalue VAR_TEMP_x4002, 23
	gotoif ne, scr_seq_00000910_00000B02
	scrcmd_121 700
	goto scr_seq_00000910_00000B1D

scr_seq_00000910_00000B02:
	comparevartovalue VAR_TEMP_x4002, 27
	gotoif ne, scr_seq_00000910_00000B19
	scrcmd_121 700
	goto scr_seq_00000910_00000B1D

scr_seq_00000910_00000B19:
	scrcmd_121 2100
scr_seq_00000910_00000B1D:
	scrcmd_118 0
	scrcmd_495 16384
	comparevartovalue VAR_TEMP_x4000, 7
	gotoif ne, scr_seq_00000910_00000B3D
	goto scr_seq_00000910_000008EB

scr_seq_00000910_00000B37:
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
scr_seq_00000910_00000B3D:
	goto scr_seq_00000910_00000948

scr_seq_00000910_00000B43:
	.byte 0x02, 0x00
scr_seq_00000910_00000B45:
	msgbox 5
	closemsg
scr_seq_00000910_00000B4A:
	comparevartovalue VAR_SPECIAL_x8004, 417
	gotoif ne, scr_seq_00000910_00000B63
	goto scr_seq_00000910_00000234

scr_seq_00000910_00000B5D:
	.byte 0x16, 0x00, 0x83
	.byte 0x00, 0x00, 0x00
scr_seq_00000910_00000B63:
	comparevartovalue VAR_SPECIAL_x8004, 402
	gotoif ne, scr_seq_00000910_00000B7C
	goto scr_seq_00000910_00000234

scr_seq_00000910_00000B76:
	.byte 0x16, 0x00, 0x6a, 0x00, 0x00, 0x00
scr_seq_00000910_00000B7C:
	comparevartovalue VAR_SPECIAL_x8004, 371
	gotoif ne, scr_seq_00000910_00000B95
	goto scr_seq_00000910_00000234

scr_seq_00000910_00000B8F:
	.byte 0x16
	.byte 0x00, 0x51, 0x00, 0x00, 0x00
scr_seq_00000910_00000B95:
	comparevartovalue VAR_SPECIAL_x8004, 362
	gotoif ne, scr_seq_00000910_00000BAE
	goto scr_seq_00000910_00000234

scr_seq_00000910_00000BA8:
	.byte 0x16, 0x00, 0x38, 0x00, 0x00, 0x00
scr_seq_00000910_00000BAE:
	comparevartovalue VAR_SPECIAL_x8004, 340
	gotoif ne, scr_seq_00000910_00000BC7
	goto scr_seq_00000910_00000234

scr_seq_00000910_00000BC1:
	.byte 0x16, 0x00, 0x1f, 0x00, 0x00, 0x00
scr_seq_00000910_00000BC7:
	comparevartovalue VAR_SPECIAL_x8004, 351
	gotoif ne, scr_seq_00000910_00000BE0
	goto scr_seq_00000910_00000234

scr_seq_00000910_00000BDA:
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
scr_seq_00000910_00000BE0:
	goto scr_seq_00000910_000002D0

scr_seq_00000910_00000BE6:
	msgbox 2
	goto scr_seq_00000910_00000B4A

scr_seq_00000910_00000BEF:
	.byte 0x02
	.byte 0x00
scr_seq_00000910_00000BF1:
	msgbox 2
	scrcmd_495 16384
	comparevartovalue VAR_TEMP_x4000, 7
	gotoif ne, scr_seq_00000910_00000C11
	goto scr_seq_00000910_000008EB

scr_seq_00000910_00000C0B:
	.byte 0x16, 0x00, 0x06, 0x00, 0x00
	.byte 0x00
scr_seq_00000910_00000C11:
	goto scr_seq_00000910_00000948

scr_seq_00000910_00000C17:
	msgbox 1
	waitbutton
	closemsg
	goto scr_seq_00000910_00000C26

scr_seq_00000910_00000C24:
	.byte 0x02, 0x00
scr_seq_00000910_00000C26:
	scrcmd_117
	scrcmd_747
	scrcmd_784 3, 1
	releaseall
	end
	.balign 4, 0
