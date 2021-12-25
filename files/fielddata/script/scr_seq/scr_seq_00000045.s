#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000045_0000000E ; 000
	scrdef scr_seq_00000045_00000244 ; 001
	scrdef scr_seq_00000045_0000013F ; 002
	scrdef_end

scr_seq_00000045_0000000E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_713 3
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	checkflag FLAG_UNK_97A
	gotoif eq, scr_seq_00000045_00000042
	releaseall
	end

scr_seq_00000045_00000042:
	wait 2, VAR_SPECIAL_x8004
	scrcmd_561 0, 2, 10, 6
	wait 10, VAR_SPECIAL_x8004
	apply_movement 255, scr_seq_00000045_00000298
	wait_movement
	hide_person 1
	play_se SEQ_SE_DP_KI_GASYAN
	clearflag FLAG_UNK_111
	setflag FLAG_UNK_222
	clearflag FLAG_UNK_235
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000045_00000096
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000045_000000A6
	end

scr_seq_00000045_00000096:
	apply_movement 255, scr_seq_00000045_00000228
	wait_movement
	goto scr_seq_00000045_000000B8

scr_seq_00000045_000000A6:
	apply_movement 255, scr_seq_00000045_00000228
	apply_movement 253, scr_seq_00000045_00000234
	wait_movement
scr_seq_00000045_000000B8:
	setvar VAR_UNK_40CE, 1
	comparevartovalue VAR_UNK_40EC, 1
	gotoif ge, scr_seq_00000045_00000103
	play_se SEQ_SE_GS_RAKKA01
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_176 315, 0, 5, 24, 0
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	setvar VAR_UNK_40E0, 1
	addvar VAR_UNK_40EC, 1
	releaseall
	end

scr_seq_00000045_00000103:
	setflag FLAG_UNK_235
	play_se SEQ_SE_GS_RAKKA01
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_176 315, 0, 5, 24, 0
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	setvar VAR_UNK_40E0, 1
	addvar VAR_UNK_40EC, 1
	releaseall
	end

scr_seq_00000045_0000013F:
	scrcmd_609
	lockall
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000045_00000163
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000045_00000173
	end

scr_seq_00000045_00000163:
	apply_movement 255, scr_seq_00000045_00000228
	wait_movement
	goto scr_seq_00000045_00000185

scr_seq_00000045_00000173:
	apply_movement 255, scr_seq_00000045_00000228
	apply_movement 253, scr_seq_00000045_00000234
	wait_movement
scr_seq_00000045_00000185:
	setvar VAR_UNK_40CE, 1
	play_se SEQ_SE_GS_RAKKA01
	comparevartovalue VAR_UNK_403E, 7
	gotoif ge, scr_seq_00000045_000001D1
	comparevartovalue VAR_UNK_403E, 6
	gotoif eq, scr_seq_00000045_000001FB
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_176 315, 0, 5, 24, 0
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
scr_seq_00000045_000001CD:
	releaseall
	end

scr_seq_00000045_000001D1:
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_176 492, 0, 5, 24, 0
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	goto scr_seq_00000045_000001CD

scr_seq_00000045_000001FB:
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_176 490, 0, 5, 24, 0
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	goto scr_seq_00000045_000001CD

scr_seq_00000045_00000225:
	.byte 0x00, 0x00, 0x00

scr_seq_00000045_00000228:
	.short 40, 4
	.short 69, 1
	.short 254, 0

scr_seq_00000045_00000234:
	.short 62, 3
	.short 20, 1
	.short 69, 1
	.short 254, 0
scr_seq_00000045_00000244:
	scrcmd_609
	lockall
	scrcmd_714 3
	scrcmd_389 32780, 250
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000045_00000264
	goto scr_seq_00000045_00000268

scr_seq_00000045_00000264:
	releaseall
	end

scr_seq_00000045_00000268:
	wait 2, VAR_SPECIAL_x8004
	scrcmd_561 0, 2, 10, 6
	wait 10, VAR_SPECIAL_x8004
	apply_movement 255, scr_seq_00000045_00000298
	wait_movement
	hide_person 0
	setflag FLAG_UNK_221
	play_se SEQ_SE_DP_UG_008
	releaseall
	end


scr_seq_00000045_00000298:
	.short 75, 1
	.short 254, 0
	.balign 4, 0
