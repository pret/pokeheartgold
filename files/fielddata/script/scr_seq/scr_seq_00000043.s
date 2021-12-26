#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000043_00000012 ; 000
	scrdef scr_seq_00000043_00000248 ; 001
	scrdef scr_seq_00000043_00000253 ; 002
	scrdef scr_seq_00000043_00000143 ; 003
	scrdef_end

scr_seq_00000043_00000012:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_713 2
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	checkflag FLAG_UNK_979
	gotoif TRUE, scr_seq_00000043_00000046
	releaseall
	end

scr_seq_00000043_00000046:
	wait 2, VAR_SPECIAL_x8004
	scrcmd_561 0, 2, 10, 6
	wait 10, VAR_SPECIAL_x8004
	apply_movement 255, scr_seq_00000043_000002A4
	wait_movement
	hide_person 1
	play_se SEQ_SE_DP_KI_GASYAN
	clearflag FLAG_UNK_111
	setflag FLAG_UNK_220
	clearflag FLAG_UNK_235
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000043_0000009A
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000043_000000AA
	end

scr_seq_00000043_0000009A:
	apply_movement 255, scr_seq_00000043_0000022C
	wait_movement
	goto scr_seq_00000043_000000BC

scr_seq_00000043_000000AA:
	apply_movement 255, scr_seq_00000043_0000022C
	apply_movement 253, scr_seq_00000043_00000238
	wait_movement
scr_seq_00000043_000000BC:
	setvar VAR_UNK_40CE, 1
	comparevartovalue VAR_UNK_40EC, 1
	gotoif ge, scr_seq_00000043_00000107
	play_se SEQ_SE_GS_RAKKA01
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 315, 0, 5, 42, 0
	fade_screen 6, 1, 1, 0
	wait_fade
	setvar VAR_UNK_40DF, 1
	addvar VAR_UNK_40EC, 1
	releaseall
	end

scr_seq_00000043_00000107:
	setflag FLAG_UNK_235
	play_se SEQ_SE_GS_RAKKA01
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 315, 0, 5, 42, 0
	fade_screen 6, 1, 1, 0
	wait_fade
	setvar VAR_UNK_40DF, 1
	addvar VAR_UNK_40EC, 1
	releaseall
	end

scr_seq_00000043_00000143:
	scrcmd_609
	lockall
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000043_00000167
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000043_00000177
	end

scr_seq_00000043_00000167:
	apply_movement 255, scr_seq_00000043_0000022C
	wait_movement
	goto scr_seq_00000043_00000189

scr_seq_00000043_00000177:
	apply_movement 255, scr_seq_00000043_0000022C
	apply_movement 253, scr_seq_00000043_00000238
	wait_movement
scr_seq_00000043_00000189:
	setvar VAR_UNK_40CE, 1
	play_se SEQ_SE_GS_RAKKA01
	comparevartovalue VAR_UNK_403E, 7
	gotoif ge, scr_seq_00000043_000001D5
	comparevartovalue VAR_UNK_403E, 6
	gotoif eq, scr_seq_00000043_000001FF
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 315, 0, 5, 42, 0
	fade_screen 6, 1, 1, 0
	wait_fade
scr_seq_00000043_000001D1:
	releaseall
	end

scr_seq_00000043_000001D5:
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 492, 0, 5, 42, 0
	fade_screen 6, 1, 1, 0
	wait_fade
	goto scr_seq_00000043_000001D1

scr_seq_00000043_000001FF:
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 490, 0, 5, 42, 0
	fade_screen 6, 1, 1, 0
	wait_fade
	goto scr_seq_00000043_000001D1

scr_seq_00000043_00000229:
	.byte 0x00, 0x00, 0x00

scr_seq_00000043_0000022C:
	.short 40, 4
	.short 69, 1
	.short 254, 0

scr_seq_00000043_00000238:
	.short 62, 3
	.short 20, 1
	.short 69, 1
	.short 254, 0
scr_seq_00000043_00000248:
	scrcmd_609
	lockall
	scrcmd_714 2
	releaseall
	end

scr_seq_00000043_00000253:
	scrcmd_609
	lockall
	checkflag FLAG_UNK_21F
	gotoif TRUE, scr_seq_00000043_00000292
	wait 2, VAR_SPECIAL_x8004
	scrcmd_561 0, 2, 10, 6
	wait 10, VAR_SPECIAL_x8004
	apply_movement 255, scr_seq_00000043_000002A4
	wait_movement
	hide_person 0
	setflag FLAG_UNK_21F
	play_se SEQ_SE_DP_UG_008
	releaseall
	end

scr_seq_00000043_00000292:
	wait 10, VAR_SPECIAL_x8004
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000043_000002A3:
	.byte 0x00

scr_seq_00000043_000002A4:
	.short 75, 1
	.short 254, 0
	.balign 4, 0
