#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0199_0089 ; 000
	scrdef scr_seq_0199_001A ; 001
	scrdef scr_seq_0199_02BE ; 002
	scrdef scr_seq_0199_02D5 ; 003
	scrdef scr_seq_0199_0055 ; 004
	scrdef scr_seq_0199_0244 ; 005
	scrdef_end

scr_seq_0199_001A:
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_0199_002B
	clearflag FLAG_UNK_189
	end

scr_seq_0199_002B:
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, scr_seq_0199_004F
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif eq, scr_seq_0199_004F
	setflag FLAG_UNK_27E
	end

scr_seq_0199_004F:
	clearflag FLAG_UNK_27E
	end

scr_seq_0199_0055:
	checkflag FLAG_UNK_0A4
	gotoif TRUE, scr_seq_0199_006D
	checkflag FLAG_UNK_0F9
	gotoif TRUE, scr_seq_0199_0087
	end

scr_seq_0199_006D:
	setflag FLAG_UNK_31B
	hide_person 15
	hide_person 16
	hide_person 17
	hide_person 18
	clearflag FLAG_UNK_0A4
	end

scr_seq_0199_0087:
	end

scr_seq_0199_0089:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 0
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0199_01B1
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0199_01C5
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0199_0102
	apply_movement 255, scr_seq_0199_01DC
	apply_movement 13, scr_seq_0199_0228
	goto scr_seq_0199_0150

scr_seq_0199_0102:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0199_011D
	apply_movement 255, scr_seq_0199_01F4
	goto scr_seq_0199_0150

scr_seq_0199_011D:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0199_0140
	apply_movement 255, scr_seq_0199_0214
	apply_movement 13, scr_seq_0199_0228
	goto scr_seq_0199_0150

scr_seq_0199_0140:
	apply_movement 255, scr_seq_0199_0200
	apply_movement 13, scr_seq_0199_0228
scr_seq_0199_0150:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0199_0177
	apply_movement 253, scr_seq_0199_0234
	wait_movement
scr_seq_0199_0177:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_615 59
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

scr_seq_0199_01B1:
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0199_01C5:
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0199_01D9:
	.byte 0x00, 0x00, 0x00

scr_seq_0199_01DC:
	.short 15, 1
	.short 12, 2
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0199_01F4:
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0199_0200:
	.short 12, 1
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0199_0214:
	.short 12, 1
	.short 15, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0199_0228:
	.short 63, 1
	.short 32, 1
	.short 254, 0

scr_seq_0199_0234:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
scr_seq_0199_0244:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_779 5, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0199_0268
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0199_0268:
	scrcmd_076 143, 0
	npc_msg 3
	scrcmd_077
	closemsg
	setflag FLAG_UNK_0A4
	scrcmd_589 143, 50, 0
	clearflag FLAG_UNK_0A4
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0199_02AE
	scrcmd_683 16389
	comparevartovalue VAR_TEMP_x4005, 4
	callif eq, scr_seq_0199_02B4
	setflag FLAG_UNK_0F9
	releaseall
	end

scr_seq_0199_02AE:
	scrcmd_219
	releaseall
	end

scr_seq_0199_02B4:
	setflag FLAG_UNK_173
	return

scr_seq_0199_02BA:
	.byte 0x61, 0x00, 0x02, 0x00
scr_seq_0199_02BE:
	scrcmd_055 0, 1, 3, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0199_02D5:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 1, VAR_SPECIAL_x800C
	callstd 2000
	end
	.balign 4, 0
