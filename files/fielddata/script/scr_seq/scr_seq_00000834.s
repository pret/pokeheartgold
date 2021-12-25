#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000834_0000009B ; 000
	scrdef scr_seq_00000834_00000270 ; 001
	scrdef scr_seq_00000834_00000299 ; 002
	scrdef scr_seq_00000834_000002AC ; 003
	scrdef scr_seq_00000834_000000F4 ; 004
	scrdef scr_seq_00000834_00000080 ; 005
	scrdef scr_seq_00000834_00000026 ; 006
	scrdef scr_seq_00000834_0000018C ; 007
	scrdef scr_seq_00000834_000002BF ; 008
	scrdef_end

scr_seq_00000834_00000026:
	scrcmd_582 76, 1290, 209
	checkflag FLAG_UNK_118
	gotoif eq, scr_seq_00000834_0000003F
	goto scr_seq_00000834_00000045

scr_seq_00000834_0000003F:
	setvar VAR_UNK_411D, 0
scr_seq_00000834_00000045:
	setflag FLAG_UNK_2F7
	scrcmd_147 36, 16385
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif eq, scr_seq_00000834_0000007E
	scrcmd_142 36, 16385
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_00000834_0000007E
	checkflag FLAG_UNK_162
	gotoif eq, scr_seq_00000834_0000007E
	clearflag FLAG_UNK_2F7
scr_seq_00000834_0000007E:
	end

scr_seq_00000834_00000080:
	checkflag FLAG_UNK_118
	gotoif eq, scr_seq_00000834_0000008D
	end

scr_seq_00000834_0000008D:
	scrcmd_339 0, 12, 0, 7, 3
	end

scr_seq_00000834_0000009B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_118
	gotoif eq, scr_seq_00000834_000000B9
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000834_000000B9:
	scrcmd_386 32780
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_00000834_000000D7
	msgbox 5
	waitbutton
	closemsg
	goto scr_seq_00000834_000000E6

scr_seq_00000834_000000D7:
	msgbox 7
	closemsg
	apply_movement 0, scr_seq_00000834_000000EC
	wait_movement
scr_seq_00000834_000000E6:
	releaseall
	end

scr_seq_00000834_000000EA:
	.byte 0x00, 0x00

scr_seq_00000834_000000EC:
	.short 3, 1
	.short 254, 0
scr_seq_00000834_000000F4:
	scrcmd_609
	lockall
	apply_movement 255, scr_seq_00000834_0000017C
	wait_movement
	checkflag FLAG_UNK_123
	gotoif eq, scr_seq_00000834_00000158
	msgbox 1
	closemsg
	setflag FLAG_UNK_123
scr_seq_00000834_00000116:
	wait 50, VAR_SPECIAL_x8004
	hasitem ITEM_PASS, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, scr_seq_00000834_00000163
	msgbox 2
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000834_00000184
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	releaseall
	end

scr_seq_00000834_00000158:
	msgbox 3
	closemsg
	goto scr_seq_00000834_00000116

scr_seq_00000834_00000163:
	msgbox 4
	waitbutton
	closemsg
	setvar VAR_UNK_411D, 1
	setvar VAR_UNK_411F, 1
	releaseall
	end

scr_seq_00000834_0000017A:
	.byte 0x00, 0x00

scr_seq_00000834_0000017C:
	.short 34, 1
	.short 254, 0

scr_seq_00000834_00000184:
	.short 13, 2
	.short 254, 0
scr_seq_00000834_0000018C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 12
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000834_0000024F
	msgbox 14
	closemsg
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_566
	scrcmd_351 32780
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_00000834_0000024F
	scrcmd_470 10
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_354 32772, 32773
	scrcmd_472 32780
	comparevartovar VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	gotoif ne, scr_seq_00000834_00000242
	scrcmd_473 32772
	scrcmd_474
	setflag FLAG_UNK_162
	msgbox 16
	closemsg
	scrcmd_386 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000834_0000022C
	apply_movement 4, scr_seq_00000834_0000025C
	goto scr_seq_00000834_00000234

scr_seq_00000834_0000022C:
	apply_movement 4, scr_seq_00000834_00000268
scr_seq_00000834_00000234:
	wait_movement
	scrcmd_101 4
	setflag FLAG_UNK_2F7
	releaseall
	end

scr_seq_00000834_00000242:
	scrcmd_474
	msgbox 17
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000834_0000024F:
	msgbox 15
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000834_0000025A:
	.byte 0x00, 0x00

scr_seq_00000834_0000025C:
	.short 78, 5
	.short 77, 10
	.short 254, 0

scr_seq_00000834_00000268:
	.short 77, 10
	.short 254, 0
scr_seq_00000834_00000270:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_118
	gotoif eq, scr_seq_00000834_0000028E
	msgbox 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000834_0000028E:
	msgbox 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000834_00000299:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000834_000002AC:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 11
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000834_000002BF:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 18
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
