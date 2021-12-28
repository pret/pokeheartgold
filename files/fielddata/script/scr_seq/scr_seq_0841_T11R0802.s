#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0841_T11R0802_005C ; 000
	scrdef scr_seq_0841_T11R0802_03E0 ; 001
	scrdef scr_seq_0841_T11R0802_03F3 ; 002
	scrdef scr_seq_0841_T11R0802_0320 ; 003
	scrdef scr_seq_0841_T11R0802_001E ; 004
	scrdef scr_seq_0841_T11R0802_0043 ; 005
	scrdef scr_seq_0841_T11R0802_0406 ; 006
	scrdef_end

scr_seq_0841_T11R0802_001E:
	get_player_gender VAR_TEMP_x4009
	comparevartovalue VAR_TEMP_x4009, 0
	gotoif ne, scr_seq_0841_T11R0802_003B
	setvar VAR_OBJ_0, 0
	goto scr_seq_0841_T11R0802_0041

scr_seq_0841_T11R0802_003B:
	setvar VAR_OBJ_0, 97
scr_seq_0841_T11R0802_0041:
	end

scr_seq_0841_T11R0802_0043:
	comparevartovalue VAR_TEMP_x400B, 0
	gotoif ne, scr_seq_0841_T11R0802_005A
	hide_person 3
	setvar VAR_TEMP_x400B, 1
scr_seq_0841_T11R0802_005A:
	end

scr_seq_0841_T11R0802_005C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	getitemquantity 480, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0841_T11R0802_0125
	getitemquantity 479, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0841_T11R0802_00E9
	checkflag FLAG_UNK_118
	gotoif TRUE, scr_seq_0841_T11R0802_00BD
	call scr_seq_0841_T11R0802_014D
	buffer_players_name 0
	gender_msgbox 0, 1
	closemsg
	call scr_seq_0841_T11R0802_01DB
	npc_msg 2
	closemsg
	apply_movement 0, scr_seq_0841_T11R0802_026C
	wait_movement
	releaseall
	end

scr_seq_0841_T11R0802_00BD:
	setflag FLAG_UNK_119
	call scr_seq_0841_T11R0802_014D
	buffer_players_name 0
	gender_msgbox 3, 4
	closemsg
	call scr_seq_0841_T11R0802_01DB
	npc_msg 5
	closemsg
	apply_movement 0, scr_seq_0841_T11R0802_026C
	wait_movement
	releaseall
	end

scr_seq_0841_T11R0802_00E9:
	takeitem ITEM_LOST_ITEM, 1, VAR_SPECIAL_x800C
	npc_msg 6
	clearflag FLAG_UNK_2FB
	scrcmd_100 1
	setvar VAR_SPECIAL_x8004, 480
	setvar VAR_SPECIAL_x8005, 1
	callstd std_give_item_verbose
	npc_msg 8
	waitbutton
	closemsg
	releaseall
	setflag FLAG_UNK_087
	setflag FLAG_UNK_998
	setvar VAR_UNK_40FF, 2
	end

scr_seq_0841_T11R0802_0125:
	call scr_seq_0841_T11R0802_014D
	buffer_players_name 0
	gender_msgbox 9, 10
	closemsg
	call scr_seq_0841_T11R0802_01DB
	npc_msg 11
	closemsg
	apply_movement 0, scr_seq_0841_T11R0802_026C
	wait_movement
	releaseall
	end

scr_seq_0841_T11R0802_014D:
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0841_T11R0802_016C
	apply_movement 0, scr_seq_0841_T11R0802_02B0
	goto scr_seq_0841_T11R0802_018F

scr_seq_0841_T11R0802_016C:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0841_T11R0802_0187
	apply_movement 0, scr_seq_0841_T11R0802_0274
	goto scr_seq_0841_T11R0802_018F

scr_seq_0841_T11R0802_0187:
	apply_movement 0, scr_seq_0841_T11R0802_0294
scr_seq_0841_T11R0802_018F:
	wait_movement
	scrcmd_100 3
	hide_person 0
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0841_T11R0802_01B4
	apply_movement 3, scr_seq_0841_T11R0802_0304
	goto scr_seq_0841_T11R0802_01D7

scr_seq_0841_T11R0802_01B4:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0841_T11R0802_01CF
	apply_movement 3, scr_seq_0841_T11R0802_02C8
	goto scr_seq_0841_T11R0802_01D7

scr_seq_0841_T11R0802_01CF:
	apply_movement 3, scr_seq_0841_T11R0802_02EC
scr_seq_0841_T11R0802_01D7:
	wait_movement
	return

scr_seq_0841_T11R0802_01DB:
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0841_T11R0802_01FA
	apply_movement 3, scr_seq_0841_T11R0802_02B0
	goto scr_seq_0841_T11R0802_021D

scr_seq_0841_T11R0802_01FA:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0841_T11R0802_0215
	apply_movement 3, scr_seq_0841_T11R0802_0274
	goto scr_seq_0841_T11R0802_021D

scr_seq_0841_T11R0802_0215:
	apply_movement 3, scr_seq_0841_T11R0802_0294
scr_seq_0841_T11R0802_021D:
	wait_movement
	scrcmd_100 0
	hide_person 3
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0841_T11R0802_0242
	apply_movement 0, scr_seq_0841_T11R0802_0304
	goto scr_seq_0841_T11R0802_0265

scr_seq_0841_T11R0802_0242:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0841_T11R0802_025D
	apply_movement 0, scr_seq_0841_T11R0802_02C8
	goto scr_seq_0841_T11R0802_0265

scr_seq_0841_T11R0802_025D:
	apply_movement 0, scr_seq_0841_T11R0802_02EC
scr_seq_0841_T11R0802_0265:
	wait_movement
	return

scr_seq_0841_T11R0802_0269:
	.byte 0x00, 0x00, 0x00

scr_seq_0841_T11R0802_026C:
	.short 34, 1
	.short 254, 0

scr_seq_0841_T11R0802_0274:
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 254, 0

scr_seq_0841_T11R0802_0294:
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 254, 0

scr_seq_0841_T11R0802_02B0:
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 254, 0

scr_seq_0841_T11R0802_02C8:
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 254, 0

scr_seq_0841_T11R0802_02EC:
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 254, 0

scr_seq_0841_T11R0802_0304:
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 254, 0
scr_seq_0841_T11R0802_0320:
	comparevartovalue VAR_TEMP_x400A, 0
	gotoif ne, scr_seq_0841_T11R0802_03A3
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 12
	waitbutton
	closemsg
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0841_T11R0802_0359
	apply_movement 2, scr_seq_0841_T11R0802_03C8
	goto scr_seq_0841_T11R0802_0397

scr_seq_0841_T11R0802_0359:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0841_T11R0802_0374
	apply_movement 2, scr_seq_0841_T11R0802_03C0
	goto scr_seq_0841_T11R0802_0397

scr_seq_0841_T11R0802_0374:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_0841_T11R0802_038F
	apply_movement 2, scr_seq_0841_T11R0802_03D8
	goto scr_seq_0841_T11R0802_0397

scr_seq_0841_T11R0802_038F:
	apply_movement 2, scr_seq_0841_T11R0802_03D0
scr_seq_0841_T11R0802_0397:
	wait_movement
	setvar VAR_TEMP_x400A, 1
	releaseall
	end

scr_seq_0841_T11R0802_03A3:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 354, 0
	npc_msg 13
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0841_T11R0802_03BE:
	.byte 0x00, 0x00

scr_seq_0841_T11R0802_03C0:
	.short 0, 1
	.short 254, 0

scr_seq_0841_T11R0802_03C8:
	.short 1, 1
	.short 254, 0

scr_seq_0841_T11R0802_03D0:
	.short 2, 1
	.short 254, 0

scr_seq_0841_T11R0802_03D8:
	.short 3, 1
	.short 254, 0
scr_seq_0841_T11R0802_03E0:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 15
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0841_T11R0802_03F3:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 14
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0841_T11R0802_0406:
	checkflag FLAG_UNK_2FB
	gotoif TRUE, scr_seq_0841_T11R0802_0431
	comparevartovalue VAR_UNK_40FF, 2
	gotoif eq, scr_seq_0841_T11R0802_0433
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 16
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0841_T11R0802_0431:
	end

scr_seq_0841_T11R0802_0433:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 17
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
