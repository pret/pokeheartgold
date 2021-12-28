#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0045_D24R0208_000E ; 000
	scrdef scr_seq_0045_D24R0208_0244 ; 001
	scrdef scr_seq_0045_D24R0208_013F ; 002
	scrdef_end

scr_seq_0045_D24R0208_000E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_713 3
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	checkflag FLAG_UNK_97A
	gotoif TRUE, scr_seq_0045_D24R0208_0042
	releaseall
	end

scr_seq_0045_D24R0208_0042:
	wait 2, VAR_SPECIAL_x8004
	scrcmd_561 0, 2, 10, 6
	wait 10, VAR_SPECIAL_x8004
	apply_movement 255, scr_seq_0045_D24R0208_0298
	wait_movement
	hide_person 1
	play_se SEQ_SE_DP_KI_GASYAN
	clearflag FLAG_UNK_111
	setflag FLAG_UNK_222
	clearflag FLAG_UNK_235
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0045_D24R0208_0096
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0045_D24R0208_00A6
	end

scr_seq_0045_D24R0208_0096:
	apply_movement 255, scr_seq_0045_D24R0208_0228
	wait_movement
	goto scr_seq_0045_D24R0208_00B8

scr_seq_0045_D24R0208_00A6:
	apply_movement 255, scr_seq_0045_D24R0208_0228
	apply_movement 253, scr_seq_0045_D24R0208_0234
	wait_movement
scr_seq_0045_D24R0208_00B8:
	setvar VAR_UNK_40CE, 1
	comparevartovalue VAR_UNK_40EC, 1
	gotoif ge, scr_seq_0045_D24R0208_0103
	play_se SEQ_SE_GS_RAKKA01
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 315, 0, 5, 24, 0
	fade_screen 6, 1, 1, 0
	wait_fade
	setvar VAR_UNK_40E0, 1
	addvar VAR_UNK_40EC, 1
	releaseall
	end

scr_seq_0045_D24R0208_0103:
	setflag FLAG_UNK_235
	play_se SEQ_SE_GS_RAKKA01
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 315, 0, 5, 24, 0
	fade_screen 6, 1, 1, 0
	wait_fade
	setvar VAR_UNK_40E0, 1
	addvar VAR_UNK_40EC, 1
	releaseall
	end

scr_seq_0045_D24R0208_013F:
	scrcmd_609
	lockall
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0045_D24R0208_0163
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0045_D24R0208_0173
	end

scr_seq_0045_D24R0208_0163:
	apply_movement 255, scr_seq_0045_D24R0208_0228
	wait_movement
	goto scr_seq_0045_D24R0208_0185

scr_seq_0045_D24R0208_0173:
	apply_movement 255, scr_seq_0045_D24R0208_0228
	apply_movement 253, scr_seq_0045_D24R0208_0234
	wait_movement
scr_seq_0045_D24R0208_0185:
	setvar VAR_UNK_40CE, 1
	play_se SEQ_SE_GS_RAKKA01
	comparevartovalue VAR_UNK_403E, 7
	gotoif ge, scr_seq_0045_D24R0208_01D1
	comparevartovalue VAR_UNK_403E, 6
	gotoif eq, scr_seq_0045_D24R0208_01FB
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 315, 0, 5, 24, 0
	fade_screen 6, 1, 1, 0
	wait_fade
scr_seq_0045_D24R0208_01CD:
	releaseall
	end

scr_seq_0045_D24R0208_01D1:
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 492, 0, 5, 24, 0
	fade_screen 6, 1, 1, 0
	wait_fade
	goto scr_seq_0045_D24R0208_01CD

scr_seq_0045_D24R0208_01FB:
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 490, 0, 5, 24, 0
	fade_screen 6, 1, 1, 0
	wait_fade
	goto scr_seq_0045_D24R0208_01CD

scr_seq_0045_D24R0208_0225:
	.byte 0x00, 0x00, 0x00

scr_seq_0045_D24R0208_0228:
	.short 40, 4
	.short 69, 1
	.short 254, 0

scr_seq_0045_D24R0208_0234:
	.short 62, 3
	.short 20, 1
	.short 69, 1
	.short 254, 0
scr_seq_0045_D24R0208_0244:
	scrcmd_609
	lockall
	scrcmd_714 3
	scrcmd_389 32780, 250
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0045_D24R0208_0264
	goto scr_seq_0045_D24R0208_0268

scr_seq_0045_D24R0208_0264:
	releaseall
	end

scr_seq_0045_D24R0208_0268:
	wait 2, VAR_SPECIAL_x8004
	scrcmd_561 0, 2, 10, 6
	wait 10, VAR_SPECIAL_x8004
	apply_movement 255, scr_seq_0045_D24R0208_0298
	wait_movement
	hide_person 0
	setflag FLAG_UNK_221
	play_se SEQ_SE_DP_UG_008
	releaseall
	end


scr_seq_0045_D24R0208_0298:
	.short 75, 1
	.short 254, 0
	.balign 4, 0
