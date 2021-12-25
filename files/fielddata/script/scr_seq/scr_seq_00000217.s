#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000217_00000006 ; 000
	scrdef_end

scr_seq_00000217_00000006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_14E
	gotoif eq, scr_seq_00000217_00000020
	msgbox 0
	setflag FLAG_UNK_14E
scr_seq_00000217_00000020:
	scrcmd_495 32770
	comparevartovalue VAR_SPECIAL_x8002, 8
	gotoif ne, scr_seq_00000217_00000037
	goto scr_seq_00000217_000000B1

scr_seq_00000217_00000037:
	comparevartovalue VAR_UNK_412D, 0
	gotoif ne, scr_seq_00000217_0000004D
	msgbox 1
	goto scr_seq_00000217_000000AB

scr_seq_00000217_0000004D:
	comparevartovalue VAR_UNK_412D, 1
	gotoif ne, scr_seq_00000217_00000063
	msgbox 2
	goto scr_seq_00000217_000000AB

scr_seq_00000217_00000063:
	comparevartovalue VAR_UNK_412D, 2
	gotoif ne, scr_seq_00000217_00000079
	msgbox 3
	goto scr_seq_00000217_000000AB

scr_seq_00000217_00000079:
	comparevartovalue VAR_UNK_412D, 3
	gotoif ne, scr_seq_00000217_0000008F
	msgbox 4
	goto scr_seq_00000217_000000AB

scr_seq_00000217_0000008F:
	comparevartovalue VAR_UNK_412D, 4
	gotoif ne, scr_seq_00000217_000000A5
	msgbox 5
	goto scr_seq_00000217_000000AB

scr_seq_00000217_000000A5:
	goto scr_seq_00000217_00000484

scr_seq_00000217_000000AB:
	goto scr_seq_00000217_00000125

scr_seq_00000217_000000B1:
	comparevartovalue VAR_UNK_412D, 0
	gotoif ne, scr_seq_00000217_000000C7
	msgbox 6
	goto scr_seq_00000217_00000125

scr_seq_00000217_000000C7:
	comparevartovalue VAR_UNK_412D, 1
	gotoif ne, scr_seq_00000217_000000DD
	msgbox 7
	goto scr_seq_00000217_00000125

scr_seq_00000217_000000DD:
	comparevartovalue VAR_UNK_412D, 2
	gotoif ne, scr_seq_00000217_000000F3
	msgbox 8
	goto scr_seq_00000217_00000125

scr_seq_00000217_000000F3:
	comparevartovalue VAR_UNK_412D, 3
	gotoif ne, scr_seq_00000217_00000109
	msgbox 9
	goto scr_seq_00000217_00000125

scr_seq_00000217_00000109:
	comparevartovalue VAR_UNK_412D, 4
	gotoif ne, scr_seq_00000217_0000011F
	msgbox 10
	goto scr_seq_00000217_00000125

scr_seq_00000217_0000011F:
	goto scr_seq_00000217_00000484

scr_seq_00000217_00000125:
	msgbox 11
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000217_0000048D
	msgbox 12
	closemsg
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_349
	scrcmd_351 32768
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	comparevartovalue VAR_SPECIAL_x8000, 255
	gotoif eq, scr_seq_00000217_0000048D
	scrcmd_354 32768, 32769
	comparevartovalue VAR_SPECIAL_x8002, 8
	gotoif ne, scr_seq_00000217_00000188
	goto scr_seq_00000217_000002F0

scr_seq_00000217_00000188:
	copyvar VAR_SPECIAL_x8008, VAR_UNK_412D
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000217_000001C8
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000217_000001E4
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000217_00000200
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_00000217_0000021C
	goto scr_seq_00000217_00000238

scr_seq_00000217_000001C8:
	comparevartovalue VAR_SPECIAL_x8001, 43
	gotoif eq, scr_seq_00000217_000001DE
	msgbox 14
	goto scr_seq_00000217_00000490

scr_seq_00000217_000001DE:
	goto scr_seq_00000217_0000024E

scr_seq_00000217_000001E4:
	comparevartovalue VAR_SPECIAL_x8001, 58
	gotoif eq, scr_seq_00000217_000001FA
	msgbox 14
	goto scr_seq_00000217_00000490

scr_seq_00000217_000001FA:
	goto scr_seq_00000217_0000024E

scr_seq_00000217_00000200:
	comparevartovalue VAR_SPECIAL_x8001, 39
	gotoif eq, scr_seq_00000217_00000216
	msgbox 14
	goto scr_seq_00000217_00000490

scr_seq_00000217_00000216:
	goto scr_seq_00000217_0000024E

scr_seq_00000217_0000021C:
	comparevartovalue VAR_SPECIAL_x8001, 172
	gotoif eq, scr_seq_00000217_00000232
	msgbox 14
	goto scr_seq_00000217_00000490

scr_seq_00000217_00000232:
	goto scr_seq_00000217_0000024E

scr_seq_00000217_00000238:
	comparevartovalue VAR_SPECIAL_x8001, 183
	gotoif eq, scr_seq_00000217_0000024E
	msgbox 14
	goto scr_seq_00000217_00000490

scr_seq_00000217_0000024E:
	scrcmd_193 0, 32768
	msgbox 15
	copyvar VAR_SPECIAL_x8008, VAR_UNK_412D
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000217_00000296
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000217_000002A8
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000217_000002BA
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_00000217_000002CC
	goto scr_seq_00000217_000002DE

scr_seq_00000217_00000296:
	setvar VAR_SPECIAL_x8004, 85
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_00000217_00000452

scr_seq_00000217_000002A8:
	setvar VAR_SPECIAL_x8004, 82
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_00000217_00000452

scr_seq_00000217_000002BA:
	setvar VAR_SPECIAL_x8004, 229
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_00000217_00000452

scr_seq_00000217_000002CC:
	setvar VAR_SPECIAL_x8004, 83
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_00000217_00000452

scr_seq_00000217_000002DE:
	setvar VAR_SPECIAL_x8004, 84
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_00000217_00000452

scr_seq_00000217_000002F0:
	copyvar VAR_SPECIAL_x8008, VAR_UNK_412D
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000217_00000330
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000217_0000034C
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000217_00000368
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_00000217_00000384
	goto scr_seq_00000217_000003A0

scr_seq_00000217_00000330:
	comparevartovalue VAR_SPECIAL_x8001, 108
	gotoif eq, scr_seq_00000217_00000346
	msgbox 14
	goto scr_seq_00000217_00000490

scr_seq_00000217_00000346:
	goto scr_seq_00000217_000003B6

scr_seq_00000217_0000034C:
	comparevartovalue VAR_SPECIAL_x8001, 43
	gotoif eq, scr_seq_00000217_00000362
	msgbox 14
	goto scr_seq_00000217_00000490

scr_seq_00000217_00000362:
	goto scr_seq_00000217_000003B6

scr_seq_00000217_00000368:
	comparevartovalue VAR_SPECIAL_x8001, 120
	gotoif eq, scr_seq_00000217_0000037E
	msgbox 14
	goto scr_seq_00000217_00000490

scr_seq_00000217_0000037E:
	goto scr_seq_00000217_000003B6

scr_seq_00000217_00000384:
	comparevartovalue VAR_SPECIAL_x8001, 37
	gotoif eq, scr_seq_00000217_0000039A
	msgbox 14
	goto scr_seq_00000217_00000490

scr_seq_00000217_0000039A:
	goto scr_seq_00000217_000003B6

scr_seq_00000217_000003A0:
	comparevartovalue VAR_SPECIAL_x8001, 172
	gotoif eq, scr_seq_00000217_000003B6
	msgbox 14
	goto scr_seq_00000217_00000490

scr_seq_00000217_000003B6:
	scrcmd_193 0, 32768
	msgbox 15
	copyvar VAR_SPECIAL_x8008, VAR_UNK_412D
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000217_000003FE
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000217_00000410
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000217_00000422
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_00000217_00000434
	goto scr_seq_00000217_00000446

scr_seq_00000217_000003FE:
	setvar VAR_SPECIAL_x8004, 229
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_00000217_00000452

scr_seq_00000217_00000410:
	setvar VAR_SPECIAL_x8004, 85
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_00000217_00000452

scr_seq_00000217_00000422:
	setvar VAR_SPECIAL_x8004, 84
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_00000217_00000452

scr_seq_00000217_00000434:
	setvar VAR_SPECIAL_x8004, 82
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_00000217_00000452

scr_seq_00000217_00000446:
	setvar VAR_SPECIAL_x8004, 83
	setvar VAR_SPECIAL_x8005, 1
scr_seq_00000217_00000452:
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000217_0000047A
	callstd 2033
	addvar VAR_UNK_412D, 1
	msgbox 16
	goto scr_seq_00000217_00000490

scr_seq_00000217_0000047A:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_00000217_00000484:
	msgbox 17
	goto scr_seq_00000217_00000490

scr_seq_00000217_0000048D:
	msgbox 13
scr_seq_00000217_00000490:
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
