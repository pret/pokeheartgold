#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T23R0501.h"
#include "msgdata/msg/msg_0571_T23R0501.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T23R0501_000
	scrdef scr_seq_T23R0501_001
	scrdef scr_seq_T23R0501_002
	scrdef scr_seq_T23R0501_003
	scrdef scr_seq_T23R0501_004
	scrdef scr_seq_T23R0501_005
	scrdef scr_seq_T23R0501_006
	scrdef_end

scr_seq_T23R0501_000:
	checkflag FLAG_UNK_07B
	gotoif TRUE, _002F
	setflag FLAG_HIDE_AZALEA_SLOWPOKES
	end

_002F:
	clearflag FLAG_HIDE_AZALEA_SLOWPOKES
	end

scr_seq_T23R0501_005:
	scrcmd_609
	lockall
	setvar VAR_UNK_4080, 3
	apply_movement obj_T23R0501_gantetsu, _02B0
	wait_movement
	buffer_players_name 0
	npc_msg msg_0571_T23R0501_00001
	setvar VAR_SPECIAL_x8004, 492
	setvar VAR_SPECIAL_x8005, 1
	callstd std_obtain_item_verbose
	setflag FLAG_UNK_07C
	releaseall
	goto _011A
	.byte 0x02, 0x00
scr_seq_T23R0501_001:
	checkflag FLAG_UNK_07C
	gotoif TRUE, _011A
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	buffer_players_name 0
	npc_msg msg_0571_T23R0501_00000
	scrcmd_049
	closemsg
	scrcmd_386 VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, _00A7
	goto _00C7
	.byte 0x16, 0x00, 0x08, 0x00, 0x00, 0x00
_00A7:
	apply_movement obj_T23R0501_gantetsu, _02E0
	wait_movement
_00B1:
	releaseall
	hide_person obj_T23R0501_gantetsu
	wait_fanfare
	setflag FLAG_UNK_077
	setflag FLAG_UNK_19E
	setflag FLAG_UNK_19F
	end

_00C7:
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 56
	get_person_coords 253, VAR_TEMP_x4002, VAR_TEMP_x4003
	comparevartovalue VAR_TEMP_x4002, 5
	gotoif ne, _00F4
	apply_movement obj_T23R0501_gantetsu, _02E8
	goto _0108

_00F4:
	play_se SEQ_SE_DP_WALL_HIT
	apply_movement obj_T23R0501_gantetsu, _02E0
	apply_movement obj_player, _02C8
_0108:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	goto _00B1

_011A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_735 32768
	comparevartovalue VAR_SPECIAL_x8000, 0
	gotoif ne, _01A5
	scrcmd_738 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _020F
	apply_movement obj_T23R0501_gantetsu, _02BC
	wait_movement
	npc_msg msg_0571_T23R0501_00004
	closemsg
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_739
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
	scrcmd_735 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, _0189
	npc_msg msg_0571_T23R0501_00006
	goto _0190

_0189:
	setflag FLAG_UNK_AA2
	npc_msg msg_0571_T23R0501_00005
_0190:
	waitbutton
	closemsg
	comparevartovalue VAR_UNK_4080, 3
	gotoif eq, _022D
	releaseall
	end

_01A5:
	checkflag FLAG_UNK_AA2
	gotoif TRUE, _0204
	buffer_players_name 0
	npc_msg msg_0571_T23R0501_00008
	scrcmd_737 32772
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8000, VAR_SPECIAL_x800C
	copyvar VAR_SPECIAL_x8005, VAR_SPECIAL_x8000
	callstd std_give_item_verbose
	scrcmd_736
	comparevartovalue VAR_UNK_413B, 10
	gotoif ge, _01EE
	addvar VAR_UNK_413B, 1
	comparevartovalue VAR_UNK_413B, 10
	callif ge, _0227
_01EE:
	npc_msg msg_0571_T23R0501_00010
	goto _021F
	.byte 0x02, 0x00, 0x2d, 0x00, 0x09, 0x16, 0x00, 0x1d, 0x00
	.byte 0x00, 0x00, 0x02, 0x00
_0204:
	npc_msg msg_0571_T23R0501_00007
	goto _021F
	.byte 0x02, 0x00
_020F:
	npc_msg msg_0571_T23R0501_00003
	comparevartovalue VAR_UNK_4080, 3
	gotoif eq, _022D
_021F:
	waitbutton
	closemsg
	releaseall
	end

_0227:
	setflag FLAG_UNK_127
	return

_022D:
	setvar VAR_UNK_4080, 4
	apply_movement obj_T23R0501_gsbabygirl1, _02FC
	wait_movement
	apply_movement obj_player, _02D4
	wait_movement
	npc_msg msg_0571_T23R0501_00015
_024A:
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _026E
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, _0289
	end

_026E:
	buffer_players_name 0
	npc_msg msg_0571_T23R0501_00016
	play_fanfare SEQ_ME_POKEGEAR_REGIST
	wait_fanfare
	register_gear_number 5
	npc_msg msg_0571_T23R0501_00017
	waitbutton
	closemsg
	releaseall
	end

_0289:
	npc_msg msg_0571_T23R0501_00018
	waitbutton
	closemsg
	releaseall
	end
	.byte 0x5e, 0x00, 0x01, 0x00, 0x68, 0x00, 0x00, 0x00, 0x5f, 0x00, 0x61, 0x00
	.byte 0x02, 0x00
_02A2:
	npc_msg msg_0571_T23R0501_00019
	goto _024A
	.byte 0x02, 0x00, 0x00, 0x00, 0x00

_02B0:
	step 65, 1
	step 37, 1
	step_end

_02BC:
	step 75, 1
	step 63, 1
	step_end

_02C8:
	step 18, 1
	step 65, 1
	step_end

_02D4:
	step 39, 1
	step 3, 1
	step_end

_02E0:
	step 17, 5
	step_end

_02E8:
	step 18, 1
	step 17, 2
	step 19, 1
	step 17, 3
	step_end

_02FC:
	step 14, 1
	step_end
	.byte 0x27, 0x00, 0x01, 0x00, 0x0f, 0x00, 0x01, 0x00, 0x26, 0x00, 0x01, 0x00
	.byte 0xfe, 0x00, 0x00, 0x00
scr_seq_T23R0501_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_077
	gotoif TRUE, _0332
	npc_msg msg_0571_T23R0501_00011
	waitbutton
	closemsg
	releaseall
	end

_0332:
	checkflag FLAG_UNK_07B
	gotoif TRUE, _0348
	npc_msg msg_0571_T23R0501_00012
	waitbutton
	closemsg
	releaseall
	end

_0348:
	scrcmd_147 5, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif eq, _02A2
	checkflag FLAG_GAME_CLEAR
	gotoif TRUE, _0371
	npc_msg msg_0571_T23R0501_00013
	waitbutton
	closemsg
	releaseall
	end

_0371:
	npc_msg msg_0571_T23R0501_00014
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T23R0501_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	play_cry SPECIES_SLOWPOKE, 0
	npc_msg msg_0571_T23R0501_00020
	wait_cry
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T23R0501_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0571_T23R0501_00021
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T23R0501_006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 2
	gotoif ne, _03C8
	npc_msg msg_0571_T23R0501_00024
	goto _03F7

_03C8:
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, _03DE
	npc_msg msg_0571_T23R0501_00024
	goto _03F7

_03DE:
	comparevartovalue VAR_UNK_4077, 4
	gotoif ne, _03F4
	npc_msg msg_0571_T23R0501_00024
	goto _03F7

_03F4:
	npc_msg msg_0571_T23R0501_00023
_03F7:
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
