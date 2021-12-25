#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000041_00000012 ; 000
	scrdef scr_seq_00000041_00000248 ; 001
	scrdef scr_seq_00000041_00000253 ; 002
	scrdef scr_seq_00000041_00000143 ; 003
	scrdef_end

scr_seq_00000041_00000012:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_713 1
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	checkflag FLAG_UNK_978
	gotoif eq, scr_seq_00000041_00000046
	releaseall
	end

scr_seq_00000041_00000046:
	wait 2, VAR_SPECIAL_x8004
	scrcmd_561 0, 2, 10, 6
	wait 10, VAR_SPECIAL_x8004
	apply_movement 255, scr_seq_00000041_000002BC
	wait_movement
	hide_person 1
	play_se SEQ_SE_DP_KI_GASYAN
	clearflag FLAG_UNK_111
	setflag FLAG_UNK_21E
	clearflag FLAG_UNK_235
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000041_0000009A
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000041_000000AA
	end

scr_seq_00000041_0000009A:
	apply_movement 255, scr_seq_00000041_0000022C
	wait_movement
	goto scr_seq_00000041_000000BC

scr_seq_00000041_000000AA:
	apply_movement 255, scr_seq_00000041_0000022C
	apply_movement 253, scr_seq_00000041_00000238
	wait_movement
scr_seq_00000041_000000BC:
	setvar VAR_UNK_40CE, 1
	comparevartovalue VAR_UNK_40EC, 1
	gotoif ge, scr_seq_00000041_00000107
	play_se SEQ_SE_GS_RAKKA01
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_176 315, 0, 25, 42, 0
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	setvar VAR_UNK_40DE, 1
	addvar VAR_UNK_40EC, 1
	releaseall
	end

scr_seq_00000041_00000107:
	setflag FLAG_UNK_235
	play_se SEQ_SE_GS_RAKKA01
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_176 315, 0, 25, 42, 0
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	setvar VAR_UNK_40DE, 1
	addvar VAR_UNK_40EC, 1
	releaseall
	end

scr_seq_00000041_00000143:
	scrcmd_609
	lockall
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000041_00000167
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000041_00000177
	end

scr_seq_00000041_00000167:
	apply_movement 255, scr_seq_00000041_0000022C
	wait_movement
	goto scr_seq_00000041_00000189

scr_seq_00000041_00000177:
	apply_movement 255, scr_seq_00000041_0000022C
	apply_movement 253, scr_seq_00000041_00000238
	wait_movement
scr_seq_00000041_00000189:
	setvar VAR_UNK_40CE, 1
	play_se SEQ_SE_GS_RAKKA01
	comparevartovalue VAR_UNK_403E, 7
	gotoif ge, scr_seq_00000041_000001D5
	comparevartovalue VAR_UNK_403E, 6
	gotoif eq, scr_seq_00000041_000001FF
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_176 315, 0, 25, 42, 0
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
scr_seq_00000041_000001D1:
	releaseall
	end

scr_seq_00000041_000001D5:
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_176 492, 0, 25, 42, 0
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	goto scr_seq_00000041_000001D1

scr_seq_00000041_000001FF:
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_176 490, 0, 25, 42, 0
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	goto scr_seq_00000041_000001D1

scr_seq_00000041_00000229:
	.byte 0x00, 0x00, 0x00

scr_seq_00000041_0000022C:
	.short 40, 4
	.short 69, 1
	.short 254, 0

scr_seq_00000041_00000238:
	.short 62, 3
	.short 20, 1
	.short 69, 1
	.short 254, 0
scr_seq_00000041_00000248:
	scrcmd_609
	lockall
	scrcmd_714 1
	releaseall
	end

scr_seq_00000041_00000253:
	scrcmd_609
	lockall
	bufferpartymonnick 0, VAR_SPECIAL_x8000
	scrcmd_438 1, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 28
	closemsg
	scrcmd_183 32768
	wait 2, VAR_SPECIAL_x8004
	checkflag FLAG_UNK_21D
	gotoif eq, scr_seq_00000041_000002A9
	scrcmd_561 0, 2, 10, 6
	wait 10, VAR_SPECIAL_x8004
	apply_movement 255, scr_seq_00000041_000002BC
	wait_movement
	hide_person 0
	setflag FLAG_UNK_21D
	play_se SEQ_SE_DP_UG_008
	releaseall
	end

scr_seq_00000041_000002A9:
	wait 20, VAR_SPECIAL_x8004
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000041_000002BA:
	.byte 0x00, 0x00

scr_seq_00000041_000002BC:
	.short 75, 1
	.short 254, 0
	.balign 4, 0
