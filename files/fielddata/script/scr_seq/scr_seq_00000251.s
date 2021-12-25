#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000251_0000004D ; 000
	scrdef scr_seq_00000251_000000AF ; 001
	scrdef scr_seq_00000251_0000022C ; 002
	scrdef scr_seq_00000251_00000386 ; 003
	scrdef scr_seq_00000251_00000016 ; 004
	scrdef_end

scr_seq_00000251_00000016:
	scrcmd_379 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, scr_seq_00000251_00000047
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, scr_seq_00000251_00000047
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif eq, scr_seq_00000251_00000047
	clearflag FLAG_UNK_226
	end

scr_seq_00000251_00000047:
	setflag FLAG_UNK_226
	end

scr_seq_00000251_0000004D:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_100
	gotoif eq, scr_seq_00000251_000000A2
	checkflag FLAG_UNK_0AA
	gotoif eq, scr_seq_00000251_0000007E
	msgbox 5
	closemsg
scr_seq_00000251_00000070:
	apply_movement 0, scr_seq_00000251_0000021C
	wait_movement
	releaseall
	end

scr_seq_00000251_0000007E:
	msgbox 6
	setvar VAR_SPECIAL_x8004, 434
	setvar VAR_SPECIAL_x8005, 1
	callstd 2033
	msgbox 7
	closemsg
	setflag FLAG_UNK_100
	goto scr_seq_00000251_00000070

scr_seq_00000251_000000A0:
	.byte 0x02, 0x00
scr_seq_00000251_000000A2:
	msgbox 8
	closemsg
	goto scr_seq_00000251_00000070

scr_seq_00000251_000000AD:
	.byte 0x02, 0x00
scr_seq_00000251_000000AF:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_101
	gotoif eq, scr_seq_00000251_000000E0
	checkflag FLAG_UNK_0AA
	gotoif eq, scr_seq_00000251_000000FA
	msgbox 0
	closemsg
scr_seq_00000251_000000D2:
	apply_movement 2, scr_seq_00000251_00000224
	wait_movement
	releaseall
	end

scr_seq_00000251_000000E0:
	msgbox 4
	closemsg
	goto scr_seq_00000251_000000D2

scr_seq_00000251_000000EB:
	.byte 0x02, 0x00
scr_seq_00000251_000000ED:
	msgbox 2
	closemsg
	goto scr_seq_00000251_000000D2

scr_seq_00000251_000000F8:
	.byte 0x02, 0x00
scr_seq_00000251_000000FA:
	checkflag FLAG_UNK_100
	gotoif lt, scr_seq_00000251_000000ED
	msgbox 1
	setvar VAR_SPECIAL_x8004, 29
	setvar VAR_SPECIAL_x8005, 34
	setvar VAR_SPECIAL_x8006, 39
	scrcmd_133 32772, 32780
	comparevartovalue VAR_SPECIAL_x800C, 99
	gotoif eq, scr_seq_00000251_0000020C
	scrcmd_133 32773, 32780
	comparevartovalue VAR_SPECIAL_x800C, 99
	gotoif eq, scr_seq_00000251_0000020C
	scrcmd_133 32774, 32780
	comparevartovalue VAR_SPECIAL_x800C, 99
	gotoif eq, scr_seq_00000251_0000020C
	setvar VAR_SPECIAL_x8000, 3
	setvar VAR_SPECIAL_x8001, 3
	setvar VAR_SPECIAL_x8002, 3
	scrcmd_133 32772, 32780
	comparevartovalue VAR_SPECIAL_x800C, 96
	gotoif le, scr_seq_00000251_000001C2
	subvar VAR_SPECIAL_x800C, 96
	subvar VAR_SPECIAL_x8000, VAR_SPECIAL_x800C
	scrcmd_133 32773, 32780
	comparevartovalue VAR_SPECIAL_x800C, 96
	gotoif le, scr_seq_00000251_000001C2
	subvar VAR_SPECIAL_x800C, 96
	subvar VAR_SPECIAL_x8001, VAR_SPECIAL_x800C
	scrcmd_133 32774, 32780
	comparevartovalue VAR_SPECIAL_x800C, 96
	gotoif le, scr_seq_00000251_000001C2
	subvar VAR_SPECIAL_x800C, 96
	subvar VAR_SPECIAL_x8002, VAR_SPECIAL_x800C
scr_seq_00000251_000001C2:
	scrcmd_134 32772, 32768
	scrcmd_134 32773, 32769
	scrcmd_134 32774, 32770
	scrcmd_850 0, 32772
	msgbox 20
	scrcmd_078 1185
	scrcmd_079
	scrcmd_850 0, 32773
	msgbox 20
	scrcmd_078 1185
	scrcmd_079
	scrcmd_850 0, 32774
	msgbox 20
	scrcmd_078 1185
	scrcmd_079
	closemsg
	setflag FLAG_UNK_101
	goto scr_seq_00000251_000000D2

scr_seq_00000251_0000020A:
	.byte 0x02, 0x00
scr_seq_00000251_0000020C:
	msgbox 3
	closemsg
	goto scr_seq_00000251_000000D2

scr_seq_00000251_00000217:
	.byte 0x02, 0x00, 0x00, 0x00, 0x00

scr_seq_00000251_0000021C:
	.short 35, 1
	.short 254, 0

scr_seq_00000251_00000224:
	.short 34, 1
	.short 254, 0
scr_seq_00000251_0000022C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0AA
	gotoif eq, scr_seq_00000251_00000354
	scrcmd_076 241, 11
	msgbox 9
	scrcmd_077
	checkflag FLAG_UNK_0A8
	gotoif eq, scr_seq_00000251_00000260
	msgbox 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000251_00000260:
	msgbox 10
	scrcmd_049
	msgbox 13
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000251_0000028C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000251_00000378
	end

scr_seq_00000251_0000028C:
	setvar VAR_SPECIAL_x8004, 155
	setvar VAR_SPECIAL_x8005, 1
	hasitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000251_0000036A
	takeitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	scrcmd_190 0
	msgbox 14
	waitbutton
	closemsg
	checkflag FLAG_UNK_0B0
	gotoif eq, scr_seq_00000251_0000033F
	checkflag FLAG_UNK_0AF
	gotoif eq, scr_seq_00000251_00000337
	checkflag FLAG_UNK_0AE
	gotoif eq, scr_seq_00000251_00000328
	checkflag FLAG_UNK_0AD
	gotoif eq, scr_seq_00000251_00000320
	checkflag FLAG_UNK_0AC
	gotoif eq, scr_seq_00000251_00000311
	checkflag FLAG_UNK_0A9
	gotoif eq, scr_seq_00000251_00000309
	setflag FLAG_UNK_0A9
	releaseall
	end

scr_seq_00000251_00000309:
	setflag FLAG_UNK_0AC
	releaseall
	end

scr_seq_00000251_00000311:
	setflag FLAG_UNK_0AD
	msgbox 15
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000251_00000320:
	setflag FLAG_UNK_0AE
	releaseall
	end

scr_seq_00000251_00000328:
	setflag FLAG_UNK_0AF
	msgbox 16
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000251_00000337:
	setflag FLAG_UNK_0B0
	releaseall
	end

scr_seq_00000251_0000033F:
	scrcmd_078 1183
	scrcmd_079
	msgbox 17
	waitbutton
	closemsg
	setflag FLAG_UNK_0AA
	releaseall
	end

scr_seq_00000251_00000354:
	scrcmd_076 241, 0
	msgbox 11
	scrcmd_077
	msgbox 12
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000251_0000036A:
	scrcmd_190 0
	msgbox 18
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000251_00000378:
	scrcmd_190 0
	msgbox 19
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000251_00000386:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 241, 0
	msgbox 11
	scrcmd_077
	msgbox 12
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
