#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D49R0106.h"
#include "msgdata/msg/msg_0142_D49R0106.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D49R0106_000
	scrdef scr_seq_D49R0106_001
	scrdef scr_seq_D49R0106_002
	scrdef scr_seq_D49R0106_003
	scrdef scr_seq_D49R0106_004
	scrdef scr_seq_D49R0106_005
	scrdef scr_seq_D49R0106_006
	scrdef scr_seq_D49R0106_007
	scrdef scr_seq_D49R0106_008
	scrdef_end

scr_seq_D49R0106_008:
	checkflag FLAG_UNK_0F1
	gotoif TRUE, _0039
	setvar VAR_TEMP_x400D, 0
	end

_0039:
	setvar VAR_TEMP_x400D, 1
	end

scr_seq_D49R0106_007:
	comparevartovalue VAR_TEMP_x400D, 1
	gotoif ne, _0060
	move_person obj_D49R0106_pcwoman2, 6, 1, 3, 3
	setvar VAR_TEMP_x400D, 0
_0060:
	end

scr_seq_D49R0106_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0142_D49R0106_00000
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D49R0106_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0F1
	gotoif TRUE, _0093
	npc_msg msg_0142_D49R0106_00001
	waitbutton
	closemsg
	releaseall
	end

_0093:
	npc_msg msg_0142_D49R0106_00002
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D49R0106_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0142_D49R0106_00003
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _03AC
_00BC:
	npc_msg msg_0142_D49R0106_00006
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 308, 255, 0
	menu_item_add 309, 255, 1
	menu_item_add 310, 255, 2
	menu_item_add 311, 255, 3
	menu_item_add 312, 255, 4
	menu_item_add 135, 255, 5
	menu_exec
	switch VAR_SPECIAL_x800C
	case 5, _03AC
	npc_msg msg_0142_D49R0106_00007
	case 0, _014D
	case 1, _0187
	case 2, _01C1
	case 3, _01FB
	goto _0235
	.byte 0x02, 0x00
_014D:
	setvar VAR_TEMP_x4007, 0
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 298, 255, 0
	menu_item_add 299, 255, 1
	menu_item_add 304, 255, 6
	menu_item_add 13, 255, 10
	menu_exec
	goto _026F
	.byte 0x02, 0x00
_0187:
	setvar VAR_TEMP_x4007, 1
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 301, 255, 3
	menu_item_add 300, 255, 2
	menu_item_add 307, 255, 9
	menu_item_add 13, 255, 10
	menu_exec
	goto _026F
	.byte 0x02
	.byte 0x00
_01C1:
	setvar VAR_TEMP_x4007, 2
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 306, 255, 8
	menu_item_add 307, 255, 9
	menu_item_add 299, 255, 1
	menu_item_add 13, 255, 10
	menu_exec
	goto _026F
	.byte 0x02, 0x00
_01FB:
	setvar VAR_TEMP_x4007, 3
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 305, 255, 7
	menu_item_add 304, 255, 6
	menu_item_add 301, 255, 3
	menu_item_add 13, 255, 10
	menu_exec
	goto _026F
	.byte 0x02, 0x00
_0235:
	setvar VAR_TEMP_x4007, 4
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 303, 255, 5
	menu_item_add 302, 255, 4
	menu_item_add 298, 255, 0
	menu_item_add 13, 255, 10
	menu_exec
	goto _026F
	.byte 0x02, 0x00
_026F:
	switch VAR_SPECIAL_x800C
	case 0, _02FF
	case 1, _030A
	case 2, _0315
	case 3, _0320
	case 4, _032B
	case 5, _0336
	case 6, _0341
	case 7, _034C
	case 8, _0357
	case 9, _0362
	goto _00BC
	.byte 0x02, 0x00
_02FF:
	npc_msg msg_0142_D49R0106_00008
	goto _036D
	.byte 0x02, 0x00
_030A:
	npc_msg msg_0142_D49R0106_00009
	goto _036D
	.byte 0x02, 0x00
_0315:
	npc_msg msg_0142_D49R0106_00010
	goto _036D
	.byte 0x02, 0x00
_0320:
	npc_msg msg_0142_D49R0106_00011
	goto _036D
	.byte 0x02, 0x00
_032B:
	npc_msg msg_0142_D49R0106_00012
	goto _036D
	.byte 0x02, 0x00
_0336:
	npc_msg msg_0142_D49R0106_00013
	goto _036D
	.byte 0x02
	.byte 0x00
_0341:
	npc_msg msg_0142_D49R0106_00014
	goto _036D
	.byte 0x02, 0x00
_034C:
	npc_msg msg_0142_D49R0106_00015
	goto _036D
	.byte 0x02, 0x00
_0357:
	npc_msg msg_0142_D49R0106_00016
	goto _036D
	.byte 0x02, 0x00
_0362:
	npc_msg msg_0142_D49R0106_00017
	goto _036D
	.byte 0x02, 0x00
_036D:
	npc_msg msg_0142_D49R0106_00007
	comparevartovalue VAR_TEMP_x4007, 0
	gotoif eq, _014D
	comparevartovalue VAR_TEMP_x4007, 1
	gotoif eq, _0187
	comparevartovalue VAR_TEMP_x4007, 2
	gotoif eq, _01C1
	comparevartovalue VAR_TEMP_x4007, 3
	gotoif eq, _01FB
	goto _0235
	.byte 0x02, 0x00
_03AC:
	npc_msg msg_0142_D49R0106_00018
	waitbutton
	closemsg
	touchscreen_menu_show
	releaseall
	end

scr_seq_D49R0106_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_player_facing VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, _03E0
	apply_movement obj_D49R0106_tsure_poke_597, _043C
	goto _041E

_03E0:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _03FB
	apply_movement obj_D49R0106_tsure_poke_597, _0434
	goto _041E

_03FB:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, _0416
	apply_movement obj_D49R0106_tsure_poke_597, _044C
	goto _041E

_0416:
	apply_movement obj_D49R0106_tsure_poke_597, _0444
_041E:
	wait_movement
	play_cry SPECIES_DODRIO, 0
	npc_msg msg_0142_D49R0106_00024
	wait_cry
	waitbutton
	closemsg
	releaseall
	end
	.byte 0x00

_0434:
	step 48, 2
	step_end

_043C:
	step 49, 2
	step_end

_0444:
	step 50, 2
	step_end

_044C:
	step 51, 2
	step_end
scr_seq_D49R0106_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	buffer_players_name 0
	npc_msg msg_0142_D49R0106_00023
	closemsg
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_712 2
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
	releaseall
	end

scr_seq_D49R0106_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_HIDE_POKEATHLON_POKEGEAR_SIGN
	gotoif FALSE, _04A3
	npc_msg msg_0142_D49R0106_00019
	waitbutton
	closemsg
	releaseall
	end

_04A3:
	npc_msg msg_0142_D49R0106_00020
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D49R0106_006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_HIDE_POKEATHLON_BALL_SIGN
	gotoif FALSE, _04CC
	npc_msg msg_0142_D49R0106_00021
	waitbutton
	closemsg
	releaseall
	end

_04CC:
	npc_msg msg_0142_D49R0106_00022
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
