#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000039_00000016 ; 000
	scrdef scr_seq_00000039_00000250 ; 001
	scrdef scr_seq_00000039_0000025B ; 002
	scrdef scr_seq_00000039_000002B4 ; 003
	scrdef scr_seq_00000039_0000014B ; 004
	scrdef_end

scr_seq_00000039_00000016:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_713 0
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	checkflag FLAG_UNK_977
	gotoif eq, scr_seq_00000039_0000004A
	releaseall
	end

scr_seq_00000039_0000004A:
	setflag FLAG_UNK_188
	wait 2, VAR_SPECIAL_x8004
	scrcmd_561 0, 2, 10, 6
	wait 10, VAR_SPECIAL_x8004
	apply_movement 255, scr_seq_00000039_000002AC
	wait_movement
	hide_person 1
	play_se SEQ_SE_DP_KI_GASYAN
	clearflag FLAG_UNK_111
	setflag FLAG_UNK_21C
	clearflag FLAG_UNK_235
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000039_000000A2
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000039_000000B2
	end

scr_seq_00000039_000000A2:
	apply_movement 255, scr_seq_00000039_00000234
	wait_movement
	goto scr_seq_00000039_000000C4

scr_seq_00000039_000000B2:
	apply_movement 255, scr_seq_00000039_00000234
	apply_movement 253, scr_seq_00000039_00000240
	wait_movement
scr_seq_00000039_000000C4:
	setvar VAR_UNK_40CE, 1
	comparevartovalue VAR_UNK_40EC, 1
	gotoif ge, scr_seq_00000039_0000010F
	play_se SEQ_SE_GS_RAKKA01
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_176 315, 0, 25, 6, 0
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	setvar VAR_UNK_40DD, 1
	addvar VAR_UNK_40EC, 1
	releaseall
	end

scr_seq_00000039_0000010F:
	setflag FLAG_UNK_235
	play_se SEQ_SE_GS_RAKKA01
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_176 315, 0, 25, 6, 0
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	setvar VAR_UNK_40DD, 1
	addvar VAR_UNK_40EC, 1
	releaseall
	end

scr_seq_00000039_0000014B:
	scrcmd_609
	lockall
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000039_0000016F
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000039_0000017F
	end

scr_seq_00000039_0000016F:
	apply_movement 255, scr_seq_00000039_00000234
	wait_movement
	goto scr_seq_00000039_00000191

scr_seq_00000039_0000017F:
	apply_movement 255, scr_seq_00000039_00000234
	apply_movement 253, scr_seq_00000039_00000240
	wait_movement
scr_seq_00000039_00000191:
	setvar VAR_UNK_40CE, 1
	play_se SEQ_SE_GS_RAKKA01
	comparevartovalue VAR_UNK_403E, 7
	gotoif ge, scr_seq_00000039_000001DD
	comparevartovalue VAR_UNK_403E, 6
	gotoif eq, scr_seq_00000039_00000207
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_176 315, 0, 25, 6, 0
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
scr_seq_00000039_000001D9:
	releaseall
	end

scr_seq_00000039_000001DD:
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_176 492, 0, 25, 6, 0
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	goto scr_seq_00000039_000001D9

scr_seq_00000039_00000207:
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_176 490, 0, 25, 6, 0
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	goto scr_seq_00000039_000001D9

scr_seq_00000039_00000231:
	.byte 0x00, 0x00, 0x00

scr_seq_00000039_00000234:
	.short 40, 4
	.short 69, 1
	.short 254, 0

scr_seq_00000039_00000240:
	.short 62, 3
	.short 20, 1
	.short 69, 1
	.short 254, 0
scr_seq_00000039_00000250:
	scrcmd_609
	lockall
	scrcmd_714 0
	releaseall
	end

scr_seq_00000039_0000025B:
	scrcmd_609
	lockall
	checkflag FLAG_UNK_21B
	gotoif eq, scr_seq_00000039_0000029A
	wait 2, VAR_SPECIAL_x8004
	scrcmd_561 0, 2, 10, 6
	wait 10, VAR_SPECIAL_x8004
	apply_movement 255, scr_seq_00000039_000002AC
	wait_movement
	hide_person 0
	setflag FLAG_UNK_21B
	play_se SEQ_SE_DP_UG_008
	releaseall
	end

scr_seq_00000039_0000029A:
	wait 10, VAR_SPECIAL_x8004
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000039_000002AB:
	.byte 0x00

scr_seq_00000039_000002AC:
	.short 75, 1
	.short 254, 0
scr_seq_00000039_000002B4:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_188
	gotoif eq, scr_seq_00000039_000002D2
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000039_000002D2:
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
