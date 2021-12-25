#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000790_00000054 ; 000
	scrdef scr_seq_00000790_00000070 ; 001
	scrdef scr_seq_00000790_0000042C ; 002
	scrdef scr_seq_00000790_0000043F ; 003
	scrdef scr_seq_00000790_00000452 ; 004
	scrdef scr_seq_00000790_00000274 ; 005
	scrdef scr_seq_00000790_00000022 ; 006
	scrdef scr_seq_00000790_0000008C ; 007
	scrdef_end

scr_seq_00000790_00000022:
	checkflag FLAG_UNK_189
	gotoif lt, scr_seq_00000790_00000033
	clearflag FLAG_UNK_189
	end

scr_seq_00000790_00000033:
	scrcmd_484 16384
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif ne, scr_seq_00000790_0000004E
	clearflag FLAG_UNK_27E
	goto scr_seq_00000790_00000052

scr_seq_00000790_0000004E:
	setflag FLAG_UNK_27E
scr_seq_00000790_00000052:
	end

scr_seq_00000790_00000054:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd 2011
	scrcmd_054
	setvar VAR_SPECIAL_x8004, 18
	callstd 2052
	releaseall
	end

scr_seq_00000790_00000070:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd 2011
	scrcmd_054
	setvar VAR_SPECIAL_x8004, 19
	callstd 2052
	releaseall
	end

scr_seq_00000790_0000008C:
	play_se SEQ_SE_DP_SELECT
	lockall
	hasitem ITEM_FASHION_CASE, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000790_000001DA
	msgbox 3
	scrcmd_386 16384
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, scr_seq_00000790_000000C9
	apply_movement 5, scr_seq_00000790_000001E8
	goto scr_seq_00000790_000000D1

scr_seq_00000790_000000C9:
	apply_movement 5, scr_seq_00000790_00000200
scr_seq_00000790_000000D1:
	wait_movement
	msgbox 4
	apply_movement 5, scr_seq_00000790_00000218
	wait_movement
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_00000790_000000FB
	apply_movement 5, scr_seq_00000790_00000220
	goto scr_seq_00000790_0000011E

scr_seq_00000790_000000FB:
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, scr_seq_00000790_00000116
	apply_movement 5, scr_seq_00000790_00000230
	goto scr_seq_00000790_0000011E

scr_seq_00000790_00000116:
	apply_movement 5, scr_seq_00000790_00000228
scr_seq_00000790_0000011E:
	wait_movement
	msgbox 5
	setvar VAR_SPECIAL_x8004, 92
	setvar VAR_SPECIAL_x8005, 1
	callstd 2007
	msgbox 6
	setvar VAR_SPECIAL_x8004, 93
	setvar VAR_SPECIAL_x8005, 1
	callstd 2007
	msgbox 7
	setvar VAR_SPECIAL_x8004, 94
	setvar VAR_SPECIAL_x8005, 1
	callstd 2007
	msgbox 8
	closemsg
	comparevartovalue VAR_TEMP_x4000, 3
	callif eq, scr_seq_00000790_000001A0
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif ne, scr_seq_00000790_00000186
	apply_movement 5, scr_seq_00000790_00000250
	goto scr_seq_00000790_0000018E

scr_seq_00000790_00000186:
	apply_movement 5, scr_seq_00000790_00000238
scr_seq_00000790_0000018E:
	wait_movement
	scrcmd_101 5
	setflag FLAG_UNK_313
	clearflag FLAG_UNK_2DF
	releaseall
	end

scr_seq_00000790_000001A0:
	scrcmd_729 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000790_000001D8
	scrcmd_106 253, 32772, 32773
	comparevartovalue VAR_SPECIAL_x8005, 5
	gotoif ne, scr_seq_00000790_000001D8
	scrcmd_099 253
	apply_movement 253, scr_seq_00000790_00000264
	wait_movement
	scrcmd_098 253
scr_seq_00000790_000001D8:
	return

scr_seq_00000790_000001DA:
	msgbox 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000790_000001E5:
	.byte 0x00, 0x00, 0x00

scr_seq_00000790_000001E8:
	.short 14, 1
	.short 32, 1
	.short 63, 1
	.short 15, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000790_00000200:
	.short 15, 1
	.short 32, 1
	.short 63, 1
	.short 14, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000790_00000218:
	.short 75, 1
	.short 254, 0

scr_seq_00000790_00000220:
	.short 33, 1
	.short 254, 0

scr_seq_00000790_00000228:
	.short 34, 1
	.short 254, 0

scr_seq_00000790_00000230:
	.short 35, 1
	.short 254, 0

scr_seq_00000790_00000238:
	.short 14, 2
	.short 13, 1
	.short 14, 4
	.short 12, 1
	.short 14, 4
	.short 254, 0

scr_seq_00000790_00000250:
	.short 13, 1
	.short 14, 6
	.short 12, 1
	.short 14, 4
	.short 254, 0

scr_seq_00000790_00000264:
	.short 78, 1
	.short 76, 1
	.short 1, 1
	.short 254, 0
scr_seq_00000790_00000274:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_438 2, 32780
	scrcmd_440 32780, 0
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000790_0000039C
	scrcmd_618 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000790_000003B0
	scrcmd_438 2, 32780
	scrcmd_440 32780, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000790_000002ED
	apply_movement 255, scr_seq_00000790_000003C4
	apply_movement 4, scr_seq_00000790_00000410
	goto scr_seq_00000790_0000033B

scr_seq_00000790_000002ED:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000790_00000308
	apply_movement 255, scr_seq_00000790_000003DC
	goto scr_seq_00000790_0000033B

scr_seq_00000790_00000308:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_00000790_0000032B
	apply_movement 255, scr_seq_00000790_000003FC
	apply_movement 4, scr_seq_00000790_00000410
	goto scr_seq_00000790_0000033B

scr_seq_00000790_0000032B:
	apply_movement 255, scr_seq_00000790_000003E8
	apply_movement 4, scr_seq_00000790_00000410
scr_seq_00000790_0000033B:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000790_00000362
	apply_movement 253, scr_seq_00000790_0000041C
	wait_movement
scr_seq_00000790_00000362:
	setflag FLAG_UNK_189
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_615 58
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

scr_seq_00000790_0000039C:
	scrcmd_438 2, 32780
	scrcmd_440 32780, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000790_000003B0:
	scrcmd_438 2, 32780
	scrcmd_440 32780, 3
	waitbutton
	closemsg
	releaseall
	end


scr_seq_00000790_000003C4:
	.short 15, 1
	.short 12, 2
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000790_000003DC:
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000790_000003E8:
	.short 12, 1
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000790_000003FC:
	.short 12, 1
	.short 15, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000790_00000410:
	.short 63, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000790_0000041C:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
scr_seq_00000790_0000042C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000790_0000043F:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000790_00000452:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
