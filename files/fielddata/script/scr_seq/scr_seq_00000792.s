#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000792_00000284 ; 000
	scrdef scr_seq_00000792_000002A0 ; 001
	scrdef scr_seq_00000792_000002B3 ; 002
	scrdef scr_seq_00000792_000002C6 ; 003
	scrdef scr_seq_00000792_0000001E ; 004
	scrdef scr_seq_00000792_0000019A ; 005
	scrdef scr_seq_00000792_0000024C ; 006
	scrdef_end

scr_seq_00000792_0000001E:
	checkflag FLAG_UNK_189
	gotoif lt, scr_seq_00000792_0000002F
	clearflag FLAG_UNK_189
	end

scr_seq_00000792_0000002F:
	scrcmd_147 18, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000792_00000082
	scrcmd_294 12, 16384
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, scr_seq_00000792_0000005B
	goto scr_seq_00000792_000000C2

scr_seq_00000792_0000005B:
	scrcmd_484 16384
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif ne, scr_seq_00000792_0000007A
	clearflag FLAG_UNK_260
	clearflag FLAG_UNK_2E2
	goto scr_seq_00000792_00000080

scr_seq_00000792_0000007A:
	goto scr_seq_00000792_000000C2

scr_seq_00000792_00000080:
	end

scr_seq_00000792_00000082:
	scrcmd_142 18, 16385
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_00000792_000000C2
	scrcmd_484 16384
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif ne, scr_seq_00000792_000000BA
	clearflag FLAG_UNK_260
	setflag FLAG_UNK_2E2
	scrcmd_341 3, 1
	goto scr_seq_00000792_000000C0

scr_seq_00000792_000000BA:
	goto scr_seq_00000792_000000C2

scr_seq_00000792_000000C0:
	end

scr_seq_00000792_000000C2:
	setflag FLAG_UNK_260
	setflag FLAG_UNK_2E2
	end

scr_seq_00000792_000000CC:
	play_se SEQ_SE_DP_SELECT
	lockall
	apply_movement 3, scr_seq_00000792_0000026C
	wait_movement
	msgbox 0
	closemsg
	apply_movement 4, scr_seq_00000792_00000274
	wait_movement
	msgbox 1
	closemsg
	apply_movement 3, scr_seq_00000792_0000026C
	wait_movement
	msgbox 2
	closemsg
	apply_movement 4, scr_seq_00000792_00000274
	wait_movement
	msgbox 3
	closemsg
	apply_movement 3, scr_seq_00000792_0000027C
	wait_movement
	msgbox 4
scr_seq_00000792_0000011B:
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000792_0000013F
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, scr_seq_00000792_00000189
	end

scr_seq_00000792_0000013F:
	msgbox 5
	scrcmd_146 18
	scrcmd_190 0
	msgbox 6
	scrcmd_078 1206
	scrcmd_079
	msgbox 7
	waitbutton
	closemsg
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	setflag FLAG_UNK_260
	scrcmd_101 3
	scrcmd_101 4
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	releaseall
	end

scr_seq_00000792_00000189:
	setvar VAR_TEMP_x4004, 1
	msgbox 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000792_0000019A:
	scrcmd_147 18, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000792_000001CD
	comparevartovalue VAR_TEMP_x4004, 1
	gotoif ne, scr_seq_00000792_000000CC
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 9
	goto scr_seq_00000792_0000011B

scr_seq_00000792_000001CB:
	.byte 0x02, 0x00
scr_seq_00000792_000001CD:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 10
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000792_00000236
	scrcmd_618 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000792_00000241
	msgbox 11
	closemsg
	setflag FLAG_UNK_189
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_615 2
	faceplayer
	lockall
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	clearflag FLAG_UNK_189
	msgbox 12
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000792_00000236:
	msgbox 13
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000792_00000241:
	msgbox 14
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000792_0000024C:
	comparevartovalue VAR_TEMP_x4004, 1
	gotoif ne, scr_seq_00000792_000000CC
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 15
	waitbutton
	closemsg
	releaseall
	end


scr_seq_00000792_0000026C:
	.short 34, 1
	.short 254, 0

scr_seq_00000792_00000274:
	.short 35, 1
	.short 254, 0

scr_seq_00000792_0000027C:
	.short 33, 1
	.short 254, 0
scr_seq_00000792_00000284:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd 2011
	scrcmd_054
	setvar VAR_SPECIAL_x8004, 21
	callstd 2052
	releaseall
	end

scr_seq_00000792_000002A0:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 16
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000792_000002B3:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 17
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000792_000002C6:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 18
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
