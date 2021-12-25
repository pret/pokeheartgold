#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000827_000003C9 ; 000
	scrdef scr_seq_00000827_000003DC ; 001
	scrdef scr_seq_00000827_000003A0 ; 002
	scrdef scr_seq_00000827_000003EF ; 003
	scrdef scr_seq_00000827_00000402 ; 004
	scrdef scr_seq_00000827_00000415 ; 005
	scrdef scr_seq_00000827_00000428 ; 006
	scrdef scr_seq_00000827_0000043B ; 007
	scrdef scr_seq_00000827_0000044E ; 008
	scrdef scr_seq_00000827_00000463 ; 009
	scrdef scr_seq_00000827_0000047A ; 010
	scrdef scr_seq_00000827_0000048F ; 011
	scrdef scr_seq_00000827_000004A4 ; 012
	scrdef scr_seq_00000827_000004B9 ; 013
	scrdef scr_seq_00000827_000000C9 ; 014
	scrdef scr_seq_00000827_00000224 ; 015
	scrdef scr_seq_00000827_00000046 ; 016
	scrdef_end

scr_seq_00000827_00000046:
	checkflag FLAG_UNK_0A0
	gotoif lt, scr_seq_00000827_00000055
	clearflag FLAG_UNK_0A0
scr_seq_00000827_00000055:
	checkflag FLAG_UNK_189
	gotoif lt, scr_seq_00000827_00000066
	clearflag FLAG_UNK_189
	end

scr_seq_00000827_00000066:
	scrcmd_484 16384
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, scr_seq_00000827_000000B5
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif eq, scr_seq_00000827_000000B5
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif eq, scr_seq_00000827_000000B5
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif eq, scr_seq_00000827_000000BF
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif eq, scr_seq_00000827_000000BF
	setflag FLAG_UNK_27E
	setflag FLAG_UNK_27F
	end

scr_seq_00000827_000000B5:
	clearflag FLAG_UNK_27E
	setflag FLAG_UNK_27F
	end

scr_seq_00000827_000000BF:
	setflag FLAG_UNK_27E
	clearflag FLAG_UNK_27F
	end

scr_seq_00000827_000000C9:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_438 2, 32780
	scrcmd_440 32780, 0
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000827_0000034C
	scrcmd_618 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000827_00000360
	scrcmd_438 2, 32780
	scrcmd_440 32780, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000827_00000142
	apply_movement 255, scr_seq_00000827_000001D0
	apply_movement 8, scr_seq_00000827_00000208
	goto scr_seq_00000827_0000016D

scr_seq_00000827_00000142:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000827_0000015D
	apply_movement 255, scr_seq_00000827_000001E8
	goto scr_seq_00000827_0000016D

scr_seq_00000827_0000015D:
	apply_movement 255, scr_seq_00000827_000001F4
	apply_movement 8, scr_seq_00000827_00000208
scr_seq_00000827_0000016D:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000827_00000194
	apply_movement 253, scr_seq_00000827_00000214
	wait_movement
scr_seq_00000827_00000194:
	setflag FLAG_UNK_189
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_615 52
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

scr_seq_00000827_000001CE:
	.byte 0x00, 0x00

scr_seq_00000827_000001D0:
	.short 14, 1
	.short 12, 2
	.short 15, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000827_000001E8:
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000827_000001F4:
	.short 12, 1
	.short 15, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000827_00000208:
	.short 63, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000827_00000214:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
scr_seq_00000827_00000224:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_438 2, 32780
	scrcmd_440 32780, 0
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000827_0000034C
	scrcmd_618 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000827_00000360
	scrcmd_438 2, 32780
	scrcmd_440 32780, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000827_0000029D
	apply_movement 255, scr_seq_00000827_00000374
	apply_movement 9, scr_seq_00000827_00000208
	goto scr_seq_00000827_000002EB

scr_seq_00000827_0000029D:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000827_000002B8
	apply_movement 255, scr_seq_00000827_000001E8
	goto scr_seq_00000827_000002EB

scr_seq_00000827_000002B8:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_00000827_000002DB
	apply_movement 255, scr_seq_00000827_000001F4
	apply_movement 9, scr_seq_00000827_00000208
	goto scr_seq_00000827_000002EB

scr_seq_00000827_000002DB:
	apply_movement 255, scr_seq_00000827_0000038C
	apply_movement 9, scr_seq_00000827_00000208
scr_seq_00000827_000002EB:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000827_00000312
	apply_movement 253, scr_seq_00000827_00000214
	wait_movement
scr_seq_00000827_00000312:
	setflag FLAG_UNK_189
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_615 53
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

scr_seq_00000827_0000034C:
	scrcmd_438 2, 32780
	scrcmd_440 32780, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000827_00000360:
	scrcmd_438 2, 32780
	scrcmd_440 32780, 3
	waitbutton
	closemsg
	releaseall
	end


scr_seq_00000827_00000374:
	.short 15, 1
	.short 12, 2
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000827_0000038C:
	.short 12, 1
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0
scr_seq_00000827_000003A0:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_2FB
	gotoif eq, scr_seq_00000827_000003BE
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000827_000003BE:
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000827_000003C9:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000827_000003DC:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000827_000003EF:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000827_00000402:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000827_00000415:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000827_00000428:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000827_0000043B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000827_0000044E:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 9, 32780
	callstd 2000
	end

scr_seq_00000827_00000463:
	scrcmd_055 10, 0, 10, 32780
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 32780
	callstd 2000
	end

scr_seq_00000827_0000047A:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 11, 32780
	callstd 2000
	end

scr_seq_00000827_0000048F:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 12, 32780
	callstd 2000
	end

scr_seq_00000827_000004A4:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 13, 32780
	callstd 2000
	end

scr_seq_00000827_000004B9:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 14, 32780
	callstd 2000
	end
	.balign 4, 0
