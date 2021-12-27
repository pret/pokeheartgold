#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0041_0012 ; 000
	scrdef scr_seq_0041_0248 ; 001
	scrdef scr_seq_0041_0253 ; 002
	scrdef scr_seq_0041_0143 ; 003
	scrdef_end

scr_seq_0041_0012:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_713 1
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	checkflag FLAG_UNK_978
	gotoif TRUE, scr_seq_0041_0046
	releaseall
	end

scr_seq_0041_0046:
	wait 2, VAR_SPECIAL_x8004
	scrcmd_561 0, 2, 10, 6
	wait 10, VAR_SPECIAL_x8004
	apply_movement 255, scr_seq_0041_02BC
	wait_movement
	hide_person 1
	play_se SEQ_SE_DP_KI_GASYAN
	clearflag FLAG_UNK_111
	setflag FLAG_UNK_21E
	clearflag FLAG_UNK_235
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0041_009A
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0041_00AA
	end

scr_seq_0041_009A:
	apply_movement 255, scr_seq_0041_022C
	wait_movement
	goto scr_seq_0041_00BC

scr_seq_0041_00AA:
	apply_movement 255, scr_seq_0041_022C
	apply_movement 253, scr_seq_0041_0238
	wait_movement
scr_seq_0041_00BC:
	setvar VAR_UNK_40CE, 1
	comparevartovalue VAR_UNK_40EC, 1
	gotoif ge, scr_seq_0041_0107
	play_se SEQ_SE_GS_RAKKA01
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 315, 0, 25, 42, 0
	fade_screen 6, 1, 1, 0
	wait_fade
	setvar VAR_UNK_40DE, 1
	addvar VAR_UNK_40EC, 1
	releaseall
	end

scr_seq_0041_0107:
	setflag FLAG_UNK_235
	play_se SEQ_SE_GS_RAKKA01
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 315, 0, 25, 42, 0
	fade_screen 6, 1, 1, 0
	wait_fade
	setvar VAR_UNK_40DE, 1
	addvar VAR_UNK_40EC, 1
	releaseall
	end

scr_seq_0041_0143:
	scrcmd_609
	lockall
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0041_0167
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0041_0177
	end

scr_seq_0041_0167:
	apply_movement 255, scr_seq_0041_022C
	wait_movement
	goto scr_seq_0041_0189

scr_seq_0041_0177:
	apply_movement 255, scr_seq_0041_022C
	apply_movement 253, scr_seq_0041_0238
	wait_movement
scr_seq_0041_0189:
	setvar VAR_UNK_40CE, 1
	play_se SEQ_SE_GS_RAKKA01
	comparevartovalue VAR_UNK_403E, 7
	gotoif ge, scr_seq_0041_01D5
	comparevartovalue VAR_UNK_403E, 6
	gotoif eq, scr_seq_0041_01FF
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 315, 0, 25, 42, 0
	fade_screen 6, 1, 1, 0
	wait_fade
scr_seq_0041_01D1:
	releaseall
	end

scr_seq_0041_01D5:
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 492, 0, 25, 42, 0
	fade_screen 6, 1, 1, 0
	wait_fade
	goto scr_seq_0041_01D1

scr_seq_0041_01FF:
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 490, 0, 25, 42, 0
	fade_screen 6, 1, 1, 0
	wait_fade
	goto scr_seq_0041_01D1

scr_seq_0041_0229:
	.byte 0x00, 0x00, 0x00

scr_seq_0041_022C:
	.short 40, 4
	.short 69, 1
	.short 254, 0

scr_seq_0041_0238:
	.short 62, 3
	.short 20, 1
	.short 69, 1
	.short 254, 0
scr_seq_0041_0248:
	scrcmd_609
	lockall
	scrcmd_714 1
	releaseall
	end

scr_seq_0041_0253:
	scrcmd_609
	lockall
	bufferpartymonnick 0, VAR_SPECIAL_x8000
	scrcmd_438 1, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 28
	closemsg
	scrcmd_183 32768
	wait 2, VAR_SPECIAL_x8004
	checkflag FLAG_UNK_21D
	gotoif TRUE, scr_seq_0041_02A9
	scrcmd_561 0, 2, 10, 6
	wait 10, VAR_SPECIAL_x8004
	apply_movement 255, scr_seq_0041_02BC
	wait_movement
	hide_person 0
	setflag FLAG_UNK_21D
	play_se SEQ_SE_DP_UG_008
	releaseall
	end

scr_seq_0041_02A9:
	wait 20, VAR_SPECIAL_x8004
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0041_02BA:
	.byte 0x00, 0x00

scr_seq_0041_02BC:
	.short 75, 1
	.short 254, 0
	.balign 4, 0
