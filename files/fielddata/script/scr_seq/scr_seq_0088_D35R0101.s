#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0088_D35R0101_02F0 ; 000
	scrdef scr_seq_0088_D35R0101_002A ; 001
	scrdef scr_seq_0088_D35R0101_02F4 ; 002
	scrdef scr_seq_0088_D35R0101_0327 ; 003
	scrdef scr_seq_0088_D35R0101_035C ; 004
	scrdef scr_seq_0088_D35R0101_035A ; 005
	scrdef scr_seq_0088_D35R0101_0119 ; 006
	scrdef scr_seq_0088_D35R0101_02F2 ; 007
	scrdef scr_seq_0088_D35R0101_00E9 ; 008
	scrdef scr_seq_0088_D35R0101_037F ; 009
	scrdef_end

scr_seq_0088_D35R0101_002A:
	scrcmd_375 1
	scrcmd_375 2
	scrcmd_375 3
	comparevartovalue VAR_UNK_40AC, 9
	gotoif ge, scr_seq_0088_D35R0101_00B7
	comparevartovalue VAR_UNK_40A8, 2
	gotoif ge, scr_seq_0088_D35R0101_006D
	comparevartovalue VAR_UNK_40A8, 1
	gotoif eq, scr_seq_0088_D35R0101_005F
	end

scr_seq_0088_D35R0101_005F:
	show_person_at 4, 8, 0, 7, 2
	end

scr_seq_0088_D35R0101_006D:
	show_person_at 4, 10, 0, 7, 2
	show_person_at 5, 4, 0, 3, 1
	show_person_at 0, 9, 0, 3, 1
	show_person_at 1, 8, 0, 3, 1
	show_person_at 2, 9, 0, 4, 1
	show_person_at 3, 8, 0, 4, 1
	end

scr_seq_0088_D35R0101_00B7:
	show_person_at 0, 9, 0, 3, 1
	show_person_at 1, 8, 0, 3, 1
	show_person_at 2, 9, 0, 4, 1
	show_person_at 3, 8, 0, 4, 1
	end

scr_seq_0088_D35R0101_00E9:
	comparevartovalue VAR_UNK_40AC, 3
	gotoif eq, scr_seq_0088_D35R0101_010F
	comparevartovalue VAR_UNK_40AC, 8
	gotoif eq, scr_seq_0088_D35R0101_0105
	end

scr_seq_0088_D35R0101_0105:
	setflag FLAG_UNK_1E5
	setflag FLAG_UNK_1F3
	end

scr_seq_0088_D35R0101_010F:
	clearflag FLAG_UNK_280
	setflag FLAG_UNK_1F4
	end

scr_seq_0088_D35R0101_0119:
	scrcmd_081 0
	play_bgm SEQ_GS_D_AJITO
	scrcmd_609
	lockall
	apply_movement 255, scr_seq_0088_D35R0101_0214
	wait_movement
	npc_msg 4
	closemsg
	play_se SEQ_SE_GS_ZUTUKI
	apply_movement 8, scr_seq_0088_D35R0101_02AC
	wait_se SEQ_SE_GS_PRESSHIT
	apply_movement 4, scr_seq_0088_D35R0101_021C
	wait_movement
	apply_movement 7, scr_seq_0088_D35R0101_022C
	apply_movement 8, scr_seq_0088_D35R0101_02C0
	wait_movement
	buffer_players_name 0
	gender_msgbox 5, 6
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 7, scr_seq_0088_D35R0101_0240
	apply_movement 255, scr_seq_0088_D35R0101_025C
	apply_movement 8, scr_seq_0088_D35R0101_02CC
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	apply_movement 5, scr_seq_0088_D35R0101_0268
	wait_movement
	apply_movement 7, scr_seq_0088_D35R0101_0280
	wait_movement
	npc_msg 7
	closemsg
	apply_movement 5, scr_seq_0088_D35R0101_0290
	wait_movement
	play_se SEQ_SE_DP_UG_023
	apply_movement 0, scr_seq_0088_D35R0101_029C
	apply_movement 1, scr_seq_0088_D35R0101_029C
	apply_movement 2, scr_seq_0088_D35R0101_029C
	apply_movement 3, scr_seq_0088_D35R0101_029C
	wait_movement
	buffer_players_name 0
	gender_msgbox 8, 9
	closemsg
	apply_movement 7, scr_seq_0088_D35R0101_02A4
	wait_movement
	hide_person 7
	apply_movement 8, scr_seq_0088_D35R0101_02DC
	wait_movement
	hide_person 8
	setflag FLAG_UNK_1F8
	setvar VAR_UNK_40A8, 2
	releaseall
	end

scr_seq_0088_D35R0101_0213:
	.byte 0x00

scr_seq_0088_D35R0101_0214:
	.short 75, 1
	.short 254, 0

scr_seq_0088_D35R0101_021C:
	.short 71, 1
	.short 23, 2
	.short 72, 1
	.short 254, 0

scr_seq_0088_D35R0101_022C:
	.short 63, 3
	.short 1, 2
	.short 13, 1
	.short 63, 5
	.short 254, 0

scr_seq_0088_D35R0101_0240:
	.short 0, 2
	.short 12, 4
	.short 3, 2
	.short 15, 1
	.short 0, 2
	.short 63, 5
	.short 254, 0

scr_seq_0088_D35R0101_025C:
	.short 63, 1
	.short 12, 4
	.short 254, 0

scr_seq_0088_D35R0101_0268:
	.short 75, 1
	.short 63, 1
	.short 71, 1
	.short 22, 2
	.short 72, 1
	.short 254, 0

scr_seq_0088_D35R0101_0280:
	.short 12, 1
	.short 3, 2
	.short 63, 2
	.short 254, 0

scr_seq_0088_D35R0101_0290:
	.short 3, 2
	.short 75, 1
	.short 254, 0

scr_seq_0088_D35R0101_029C:
	.short 15, 1
	.short 254, 0

scr_seq_0088_D35R0101_02A4:
	.short 15, 1
	.short 254, 0

scr_seq_0088_D35R0101_02AC:
	.short 23, 2
	.short 71, 1
	.short 22, 2
	.short 72, 1
	.short 254, 0

scr_seq_0088_D35R0101_02C0:
	.short 63, 3
	.short 1, 2
	.short 254, 0

scr_seq_0088_D35R0101_02CC:
	.short 63, 3
	.short 0, 2
	.short 12, 2
	.short 254, 0

scr_seq_0088_D35R0101_02DC:
	.short 63, 3
	.short 12, 2
	.short 3, 2
	.short 15, 1
	.short 254, 0
scr_seq_0088_D35R0101_02F0:
	end

scr_seq_0088_D35R0101_02F2:
	end

scr_seq_0088_D35R0101_02F4:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_40A8, 2
	gotoif ge, scr_seq_0088_D35R0101_031C
	npc_msg 0
	scrcmd_054
	setvar VAR_SPECIAL_x8004, 28
	callstd 2052
	releaseall
	end

scr_seq_0088_D35R0101_031C:
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0088_D35R0101_0327:
	comparevartovalue VAR_UNK_40A8, 2
	gotoif ge, scr_seq_0088_D35R0101_0347
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0088_D35R0101_0347:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0088_D35R0101_035A:
	end

scr_seq_0088_D35R0101_035C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setflag FLAG_UNK_171
	npc_msg 10
	scrcmd_054
	setvar VAR_SPECIAL_x8004, 29
	callstd 2052
	clearflag FLAG_UNK_171
	releaseall
	end

scr_seq_0088_D35R0101_037F:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_40AC, 10
	gotoif ge, scr_seq_0088_D35R0101_039D
	npc_msg 15
	goto scr_seq_0088_D35R0101_0552

scr_seq_0088_D35R0101_039D:
	comparevartovalue VAR_UNK_4077, 2
	gotoif ne, scr_seq_0088_D35R0101_03B3
	npc_msg 14
	goto scr_seq_0088_D35R0101_03E5

scr_seq_0088_D35R0101_03B3:
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_0088_D35R0101_03C9
	npc_msg 14
	goto scr_seq_0088_D35R0101_03E5

scr_seq_0088_D35R0101_03C9:
	comparevartovalue VAR_UNK_4077, 4
	gotoif ne, scr_seq_0088_D35R0101_03DF
	npc_msg 14
	goto scr_seq_0088_D35R0101_03E5

scr_seq_0088_D35R0101_03DF:
	goto scr_seq_0088_D35R0101_03EB

scr_seq_0088_D35R0101_03E5:
	goto scr_seq_0088_D35R0101_0552

scr_seq_0088_D35R0101_03EB:
	scrcmd_522 16384
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_0088_D35R0101_0405
	npc_msg 11
	goto scr_seq_0088_D35R0101_0552

scr_seq_0088_D35R0101_0405:
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif ne, scr_seq_0088_D35R0101_041B
	npc_msg 12
	goto scr_seq_0088_D35R0101_0552

scr_seq_0088_D35R0101_041B:
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif ne, scr_seq_0088_D35R0101_0431
	npc_msg 11
	goto scr_seq_0088_D35R0101_0552

scr_seq_0088_D35R0101_0431:
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif ne, scr_seq_0088_D35R0101_0447
	npc_msg 12
	goto scr_seq_0088_D35R0101_0552

scr_seq_0088_D35R0101_0447:
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif ne, scr_seq_0088_D35R0101_045D
	npc_msg 11
	goto scr_seq_0088_D35R0101_0552

scr_seq_0088_D35R0101_045D:
	comparevartovalue VAR_TEMP_x4000, 7
	gotoif ne, scr_seq_0088_D35R0101_0473
	npc_msg 12
	goto scr_seq_0088_D35R0101_0552

scr_seq_0088_D35R0101_0473:
	comparevartovalue VAR_TEMP_x4000, 9
	gotoif ne, scr_seq_0088_D35R0101_0489
	npc_msg 11
	goto scr_seq_0088_D35R0101_0552

scr_seq_0088_D35R0101_0489:
	comparevartovalue VAR_TEMP_x4000, 10
	gotoif ne, scr_seq_0088_D35R0101_049F
	npc_msg 12
	goto scr_seq_0088_D35R0101_0552

scr_seq_0088_D35R0101_049F:
	comparevartovalue VAR_TEMP_x4000, 12
	gotoif ne, scr_seq_0088_D35R0101_04B5
	npc_msg 11
	goto scr_seq_0088_D35R0101_0552

scr_seq_0088_D35R0101_04B5:
	comparevartovalue VAR_TEMP_x4000, 13
	gotoif ne, scr_seq_0088_D35R0101_04CB
	npc_msg 12
	goto scr_seq_0088_D35R0101_0552

scr_seq_0088_D35R0101_04CB:
	comparevartovalue VAR_TEMP_x4000, 15
	gotoif ne, scr_seq_0088_D35R0101_04E1
	npc_msg 11
	goto scr_seq_0088_D35R0101_0552

scr_seq_0088_D35R0101_04E1:
	comparevartovalue VAR_TEMP_x4000, 16
	gotoif ne, scr_seq_0088_D35R0101_04F7
	npc_msg 12
	goto scr_seq_0088_D35R0101_0552

scr_seq_0088_D35R0101_04F7:
	comparevartovalue VAR_TEMP_x4000, 18
	gotoif ne, scr_seq_0088_D35R0101_050D
	npc_msg 11
	goto scr_seq_0088_D35R0101_0552

scr_seq_0088_D35R0101_050D:
	comparevartovalue VAR_TEMP_x4000, 19
	gotoif ne, scr_seq_0088_D35R0101_0523
	npc_msg 12
	goto scr_seq_0088_D35R0101_0552

scr_seq_0088_D35R0101_0523:
	comparevartovalue VAR_TEMP_x4000, 21
	gotoif ne, scr_seq_0088_D35R0101_0539
	npc_msg 11
	goto scr_seq_0088_D35R0101_0552

scr_seq_0088_D35R0101_0539:
	comparevartovalue VAR_TEMP_x4000, 22
	gotoif ne, scr_seq_0088_D35R0101_054F
	npc_msg 12
	goto scr_seq_0088_D35R0101_0552

scr_seq_0088_D35R0101_054F:
	npc_msg 13
scr_seq_0088_D35R0101_0552:
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
