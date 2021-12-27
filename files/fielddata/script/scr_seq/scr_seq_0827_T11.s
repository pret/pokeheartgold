#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0827_03C9 ; 000
	scrdef scr_seq_0827_03DC ; 001
	scrdef scr_seq_0827_03A0 ; 002
	scrdef scr_seq_0827_03EF ; 003
	scrdef scr_seq_0827_0402 ; 004
	scrdef scr_seq_0827_0415 ; 005
	scrdef scr_seq_0827_0428 ; 006
	scrdef scr_seq_0827_043B ; 007
	scrdef scr_seq_0827_044E ; 008
	scrdef scr_seq_0827_0463 ; 009
	scrdef scr_seq_0827_047A ; 010
	scrdef scr_seq_0827_048F ; 011
	scrdef scr_seq_0827_04A4 ; 012
	scrdef scr_seq_0827_04B9 ; 013
	scrdef scr_seq_0827_00C9 ; 014
	scrdef scr_seq_0827_0224 ; 015
	scrdef scr_seq_0827_0046 ; 016
	scrdef_end

scr_seq_0827_0046:
	checkflag FLAG_UNK_0A0
	gotoif FALSE, scr_seq_0827_0055
	clearflag FLAG_UNK_0A0
scr_seq_0827_0055:
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_0827_0066
	clearflag FLAG_UNK_189
	end

scr_seq_0827_0066:
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, scr_seq_0827_00B5
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif eq, scr_seq_0827_00B5
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif eq, scr_seq_0827_00B5
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif eq, scr_seq_0827_00BF
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif eq, scr_seq_0827_00BF
	setflag FLAG_UNK_27E
	setflag FLAG_UNK_27F
	end

scr_seq_0827_00B5:
	clearflag FLAG_UNK_27E
	setflag FLAG_UNK_27F
	end

scr_seq_0827_00BF:
	setflag FLAG_UNK_27E
	clearflag FLAG_UNK_27F
	end

scr_seq_0827_00C9:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 0
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0827_034C
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0827_0360
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0827_0142
	apply_movement 255, scr_seq_0827_01D0
	apply_movement 8, scr_seq_0827_0208
	goto scr_seq_0827_016D

scr_seq_0827_0142:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0827_015D
	apply_movement 255, scr_seq_0827_01E8
	goto scr_seq_0827_016D

scr_seq_0827_015D:
	apply_movement 255, scr_seq_0827_01F4
	apply_movement 8, scr_seq_0827_0208
scr_seq_0827_016D:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0827_0194
	apply_movement 253, scr_seq_0827_0214
	wait_movement
scr_seq_0827_0194:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_615 52
	lockall
	fade_screen 6, 1, 1, 0
	wait_fade
	clearflag FLAG_UNK_189
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0827_01CE:
	.byte 0x00, 0x00

scr_seq_0827_01D0:
	.short 14, 1
	.short 12, 2
	.short 15, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0827_01E8:
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0827_01F4:
	.short 12, 1
	.short 15, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0827_0208:
	.short 63, 1
	.short 32, 1
	.short 254, 0

scr_seq_0827_0214:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
scr_seq_0827_0224:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 0
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0827_034C
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0827_0360
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0827_029D
	apply_movement 255, scr_seq_0827_0374
	apply_movement 9, scr_seq_0827_0208
	goto scr_seq_0827_02EB

scr_seq_0827_029D:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0827_02B8
	apply_movement 255, scr_seq_0827_01E8
	goto scr_seq_0827_02EB

scr_seq_0827_02B8:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0827_02DB
	apply_movement 255, scr_seq_0827_01F4
	apply_movement 9, scr_seq_0827_0208
	goto scr_seq_0827_02EB

scr_seq_0827_02DB:
	apply_movement 255, scr_seq_0827_038C
	apply_movement 9, scr_seq_0827_0208
scr_seq_0827_02EB:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0827_0312
	apply_movement 253, scr_seq_0827_0214
	wait_movement
scr_seq_0827_0312:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_615 53
	lockall
	fade_screen 6, 1, 1, 0
	wait_fade
	clearflag FLAG_UNK_189
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0827_034C:
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0827_0360:
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end


scr_seq_0827_0374:
	.short 15, 1
	.short 12, 2
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0827_038C:
	.short 12, 1
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0
scr_seq_0827_03A0:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_2FB
	gotoif TRUE, scr_seq_0827_03BE
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0827_03BE:
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0827_03C9:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0827_03DC:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0827_03EF:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0827_0402:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0827_0415:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0827_0428:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0827_043B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0827_044E:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 9, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0827_0463:
	scrcmd_055 10, 0, 10, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0827_047A:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 11, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0827_048F:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 12, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0827_04A4:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 13, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0827_04B9:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 14, VAR_SPECIAL_x800C
	callstd 2000
	end
	.balign 4, 0
