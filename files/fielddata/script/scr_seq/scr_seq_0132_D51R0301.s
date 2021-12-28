#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0132_D51R0301_0012 ; 000
	scrdef scr_seq_0132_D51R0301_0234 ; 001
	scrdef scr_seq_0132_D51R0301_0279 ; 002
	scrdef scr_seq_0132_D51R0301_038C ; 003
	scrdef_end

scr_seq_0132_D51R0301_0012:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_09E
	gotoif TRUE, scr_seq_0132_D51R0301_002E
	npc_msg 0
	closemsg
	setflag FLAG_UNK_09E
scr_seq_0132_D51R0301_002E:
	scrcmd_389 32780, 493
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0132_D51R0301_004C
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0132_D51R0301_004C:
	apply_movement 0, scr_seq_0132_D51R0301_0188
	wait_movement
	npc_msg 1
	closemsg
	scrcmd_386 VAR_TEMP_x4002
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif ne, scr_seq_0132_D51R0301_0078
	goto scr_seq_0132_D51R0301_0107

scr_seq_0132_D51R0301_0072:
	.byte 0x16, 0x00, 0x1f, 0x00, 0x00, 0x00
scr_seq_0132_D51R0301_0078:
	comparevartovalue VAR_TEMP_x4002, 1
	gotoif ne, scr_seq_0132_D51R0301_0091
	goto scr_seq_0132_D51R0301_00CF

scr_seq_0132_D51R0301_008B:
	.byte 0x16, 0x00, 0x06, 0x00, 0x00
	.byte 0x00
scr_seq_0132_D51R0301_0091:
	goto scr_seq_0132_D51R0301_0097

scr_seq_0132_D51R0301_0097:
	apply_movement 0, scr_seq_0132_D51R0301_0194
	wait_movement
	apply_movement 0, scr_seq_0132_D51R0301_01A0
	wait_movement
	npc_msg 3
	closemsg
	apply_movement 0, scr_seq_0132_D51R0301_01A8
	wait_movement
	npc_msg 4
	closemsg
	apply_movement 0, scr_seq_0132_D51R0301_01B4
	wait_movement
	goto scr_seq_0132_D51R0301_0167

scr_seq_0132_D51R0301_00CF:
	apply_movement 0, scr_seq_0132_D51R0301_01C4
	wait_movement
	apply_movement 0, scr_seq_0132_D51R0301_01D0
	wait_movement
	npc_msg 3
	closemsg
	apply_movement 0, scr_seq_0132_D51R0301_01D8
	wait_movement
	npc_msg 4
	closemsg
	apply_movement 0, scr_seq_0132_D51R0301_01E0
	wait_movement
	goto scr_seq_0132_D51R0301_0167

scr_seq_0132_D51R0301_0107:
	apply_movement 0, scr_seq_0132_D51R0301_01F0
	wait_movement
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0132_D51R0301_01FC
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	apply_movement 0, scr_seq_0132_D51R0301_0204
	wait_movement
	npc_msg 3
	closemsg
	apply_movement 0, scr_seq_0132_D51R0301_020C
	wait_movement
	apply_movement 255, scr_seq_0132_D51R0301_022C
	wait_movement
	npc_msg 4
	closemsg
	apply_movement 0, scr_seq_0132_D51R0301_021C
	wait_movement
	goto scr_seq_0132_D51R0301_0167

scr_seq_0132_D51R0301_0167:
	play_se SEQ_SE_DP_KAIDAN2
	setflag FLAG_UNK_2DD
	hide_person 0
	clearflag FLAG_UNK_2DC
	wait_se SEQ_SE_DP_KAIDAN2
	setvar VAR_UNK_40FB, 7
	releaseall
	end

scr_seq_0132_D51R0301_0185:
	.byte 0x00, 0x00, 0x00

scr_seq_0132_D51R0301_0188:
	.short 75, 1
	.short 63, 1
	.short 254, 0

scr_seq_0132_D51R0301_0194:
	.short 32, 1
	.short 8, 2
	.short 254, 0

scr_seq_0132_D51R0301_01A0:
	.short 33, 1
	.short 254, 0

scr_seq_0132_D51R0301_01A8:
	.short 13, 2
	.short 35, 1
	.short 254, 0

scr_seq_0132_D51R0301_01B4:
	.short 13, 2
	.short 14, 4
	.short 33, 1
	.short 254, 0

scr_seq_0132_D51R0301_01C4:
	.short 33, 1
	.short 9, 1
	.short 254, 0

scr_seq_0132_D51R0301_01D0:
	.short 32, 1
	.short 254, 0

scr_seq_0132_D51R0301_01D8:
	.short 12, 1
	.short 254, 0

scr_seq_0132_D51R0301_01E0:
	.short 13, 2
	.short 14, 4
	.short 33, 1
	.short 254, 0

scr_seq_0132_D51R0301_01F0:
	.short 32, 1
	.short 8, 2
	.short 254, 0

scr_seq_0132_D51R0301_01FC:
	.short 8, 1
	.short 254, 0

scr_seq_0132_D51R0301_0204:
	.short 33, 1
	.short 254, 0

scr_seq_0132_D51R0301_020C:
	.short 15, 1
	.short 13, 2
	.short 34, 1
	.short 254, 0

scr_seq_0132_D51R0301_021C:
	.short 13, 2
	.short 14, 5
	.short 33, 1
	.short 254, 0

scr_seq_0132_D51R0301_022C:
	.short 35, 1
	.short 254, 0
scr_seq_0132_D51R0301_0234:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_40FB, 13
	gotoif ge, scr_seq_0132_D51R0301_026E
	checkflag FLAG_UNK_09D
	gotoif TRUE, scr_seq_0132_D51R0301_0263
	npc_msg 7
	waitbutton
	closemsg
	setflag FLAG_UNK_09D
	releaseall
	end

scr_seq_0132_D51R0301_0263:
	npc_msg 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0132_D51R0301_026E:
	npc_msg 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0132_D51R0301_0279:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 10
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0132_D51R0301_02A6
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, scr_seq_0132_D51R0301_030C
scr_seq_0132_D51R0301_02A6:
	npc_msg 11
	closemsg
	play_se SEQ_SE_DP_TELE
	apply_movement 255, scr_seq_0132_D51R0301_0318
	wait_movement
	comparevartovalue VAR_UNK_40FB, 13
	gotoif ne, scr_seq_0132_D51R0301_02D2
	setvar VAR_UNK_40FB, 10
	goto scr_seq_0132_D51R0301_02E4

scr_seq_0132_D51R0301_02D2:
	setvar VAR_UNK_40FB, 1
	setflag FLAG_UNK_2DC
	clearflag FLAG_UNK_2DD
	clearflag FLAG_UNK_2DB
scr_seq_0132_D51R0301_02E4:
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 60, 0, 695, 397, 1
	fade_screen 6, 1, 1, 0
	wait_fade
	releaseall
	end

scr_seq_0132_D51R0301_030C:
	npc_msg 12
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0132_D51R0301_0317:
	.byte 0x00

scr_seq_0132_D51R0301_0318:
	.short 3, 1
	.short 62, 1
	.short 1, 1
	.short 62, 1
	.short 2, 1
	.short 62, 1
	.short 0, 1
	.short 62, 1
	.short 3, 1
	.short 61, 1
	.short 1, 1
	.short 61, 1
	.short 2, 1
	.short 61, 1
	.short 0, 1
	.short 61, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 254, 0
scr_seq_0132_D51R0301_038C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 63, 0
	npc_msg 13
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
