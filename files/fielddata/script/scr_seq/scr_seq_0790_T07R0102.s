#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0790_0054 ; 000
	scrdef scr_seq_0790_0070 ; 001
	scrdef scr_seq_0790_042C ; 002
	scrdef scr_seq_0790_043F ; 003
	scrdef scr_seq_0790_0452 ; 004
	scrdef scr_seq_0790_0274 ; 005
	scrdef scr_seq_0790_0022 ; 006
	scrdef scr_seq_0790_008C ; 007
	scrdef_end

scr_seq_0790_0022:
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_0790_0033
	clearflag FLAG_UNK_189
	end

scr_seq_0790_0033:
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif ne, scr_seq_0790_004E
	clearflag FLAG_UNK_27E
	goto scr_seq_0790_0052

scr_seq_0790_004E:
	setflag FLAG_UNK_27E
scr_seq_0790_0052:
	end

scr_seq_0790_0054:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd 2011
	scrcmd_054
	setvar VAR_SPECIAL_x8004, 18
	callstd 2052
	releaseall
	end

scr_seq_0790_0070:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd 2011
	scrcmd_054
	setvar VAR_SPECIAL_x8004, 19
	callstd 2052
	releaseall
	end

scr_seq_0790_008C:
	play_se SEQ_SE_DP_SELECT
	lockall
	hasitem ITEM_FASHION_CASE, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0790_01DA
	npc_msg 3
	scrcmd_386 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, scr_seq_0790_00C9
	apply_movement 5, scr_seq_0790_01E8
	goto scr_seq_0790_00D1

scr_seq_0790_00C9:
	apply_movement 5, scr_seq_0790_0200
scr_seq_0790_00D1:
	wait_movement
	npc_msg 4
	apply_movement 5, scr_seq_0790_0218
	wait_movement
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_0790_00FB
	apply_movement 5, scr_seq_0790_0220
	goto scr_seq_0790_011E

scr_seq_0790_00FB:
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, scr_seq_0790_0116
	apply_movement 5, scr_seq_0790_0230
	goto scr_seq_0790_011E

scr_seq_0790_0116:
	apply_movement 5, scr_seq_0790_0228
scr_seq_0790_011E:
	wait_movement
	npc_msg 5
	setvar VAR_SPECIAL_x8004, 92
	setvar VAR_SPECIAL_x8005, 1
	callstd 2007
	npc_msg 6
	setvar VAR_SPECIAL_x8004, 93
	setvar VAR_SPECIAL_x8005, 1
	callstd 2007
	npc_msg 7
	setvar VAR_SPECIAL_x8004, 94
	setvar VAR_SPECIAL_x8005, 1
	callstd 2007
	npc_msg 8
	closemsg
	comparevartovalue VAR_TEMP_x4000, 3
	callif eq, scr_seq_0790_01A0
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif ne, scr_seq_0790_0186
	apply_movement 5, scr_seq_0790_0250
	goto scr_seq_0790_018E

scr_seq_0790_0186:
	apply_movement 5, scr_seq_0790_0238
scr_seq_0790_018E:
	wait_movement
	hide_person 5
	setflag FLAG_UNK_313
	clearflag FLAG_UNK_2DF
	releaseall
	end

scr_seq_0790_01A0:
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0790_01D8
	get_person_coords 253, VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	comparevartovalue VAR_SPECIAL_x8005, 5
	gotoif ne, scr_seq_0790_01D8
	scrcmd_099 253
	apply_movement 253, scr_seq_0790_0264
	wait_movement
	scrcmd_098 253
scr_seq_0790_01D8:
	return

scr_seq_0790_01DA:
	npc_msg 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0790_01E5:
	.byte 0x00, 0x00, 0x00

scr_seq_0790_01E8:
	.short 14, 1
	.short 32, 1
	.short 63, 1
	.short 15, 1
	.short 32, 1
	.short 254, 0

scr_seq_0790_0200:
	.short 15, 1
	.short 32, 1
	.short 63, 1
	.short 14, 1
	.short 32, 1
	.short 254, 0

scr_seq_0790_0218:
	.short 75, 1
	.short 254, 0

scr_seq_0790_0220:
	.short 33, 1
	.short 254, 0

scr_seq_0790_0228:
	.short 34, 1
	.short 254, 0

scr_seq_0790_0230:
	.short 35, 1
	.short 254, 0

scr_seq_0790_0238:
	.short 14, 2
	.short 13, 1
	.short 14, 4
	.short 12, 1
	.short 14, 4
	.short 254, 0

scr_seq_0790_0250:
	.short 13, 1
	.short 14, 6
	.short 12, 1
	.short 14, 4
	.short 254, 0

scr_seq_0790_0264:
	.short 78, 1
	.short 76, 1
	.short 1, 1
	.short 254, 0
scr_seq_0790_0274:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 0
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0790_039C
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0790_03B0
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0790_02ED
	apply_movement 255, scr_seq_0790_03C4
	apply_movement 4, scr_seq_0790_0410
	goto scr_seq_0790_033B

scr_seq_0790_02ED:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0790_0308
	apply_movement 255, scr_seq_0790_03DC
	goto scr_seq_0790_033B

scr_seq_0790_0308:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0790_032B
	apply_movement 255, scr_seq_0790_03FC
	apply_movement 4, scr_seq_0790_0410
	goto scr_seq_0790_033B

scr_seq_0790_032B:
	apply_movement 255, scr_seq_0790_03E8
	apply_movement 4, scr_seq_0790_0410
scr_seq_0790_033B:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0790_0362
	apply_movement 253, scr_seq_0790_041C
	wait_movement
scr_seq_0790_0362:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_615 58
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

scr_seq_0790_039C:
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0790_03B0:
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end


scr_seq_0790_03C4:
	.short 15, 1
	.short 12, 2
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0790_03DC:
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0790_03E8:
	.short 12, 1
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0790_03FC:
	.short 12, 1
	.short 15, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0790_0410:
	.short 63, 1
	.short 32, 1
	.short 254, 0

scr_seq_0790_041C:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
scr_seq_0790_042C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0790_043F:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0790_0452:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
