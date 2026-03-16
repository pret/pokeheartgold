#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R39R0201.h"
#include "msgdata/msg/msg_0398_R39R0201.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R39R0201_000
	scrdef scr_seq_R39R0201_001
	scrdef scr_seq_R39R0201_002
	scrdef scr_seq_R39R0201_003
	scrdef scr_seq_R39R0201_004
	scrdef_end

scr_seq_R39R0201_004:
	scrcmd_379 VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 0
	goto_if_eq _0047
	compare VAR_TEMP_x4000, 1
	goto_if_eq _0047
	compare VAR_TEMP_x4000, 2
	goto_if_eq _0047
	clearflag FLAG_UNK_226
	end

_0047:
	setflag FLAG_UNK_226
	end

scr_seq_R39R0201_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_UNK_100, _00A2
	goto_if_set FLAG_UNK_0AA, _007E
	npc_msg msg_0398_R39R0201_00005
	closemsg
_0070:
	apply_movement obj_R39R0201_gsbabygirl1, _021C
	wait_movement
	releaseall
	end

_007E:
	npc_msg msg_0398_R39R0201_00006
	giveitem_no_check ITEM_SEAL_CASE, 1
	npc_msg msg_0398_R39R0201_00007
	closemsg
	setflag FLAG_UNK_100
	goto _0070
	end

_00A2:
	npc_msg msg_0398_R39R0201_00008
	closemsg
	goto _0070
	end

scr_seq_R39R0201_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_UNK_101, _00E0
	goto_if_set FLAG_UNK_0AA, _00FA
	npc_msg msg_0398_R39R0201_00000
	closemsg
_00D2:
	apply_movement obj_R39R0201_gsbabygirl1_2, _0224
	wait_movement
	releaseall
	end

_00E0:
	npc_msg msg_0398_R39R0201_00004
	closemsg
	goto _00D2
	end

_00ED:
	npc_msg msg_0398_R39R0201_00002
	closemsg
	goto _00D2
	end

_00FA:
	goto_if_unset FLAG_UNK_100, _00ED
	npc_msg msg_0398_R39R0201_00001
	setvar VAR_SPECIAL_x8004, 29
	setvar VAR_SPECIAL_x8005, 34
	setvar VAR_SPECIAL_x8006, 39
	get_seal_quantity VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 99
	goto_if_eq _020C
	get_seal_quantity VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 99
	goto_if_eq _020C
	get_seal_quantity VAR_SPECIAL_x8006, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 99
	goto_if_eq _020C
	setvar VAR_SPECIAL_x8000, 3
	setvar VAR_SPECIAL_x8001, 3
	setvar VAR_SPECIAL_x8002, 3
	get_seal_quantity VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 96
	goto_if_le _01C2
	subvar VAR_SPECIAL_RESULT, 96
	subvar VAR_SPECIAL_x8000, VAR_SPECIAL_RESULT
	get_seal_quantity VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 96
	goto_if_le _01C2
	subvar VAR_SPECIAL_RESULT, 96
	subvar VAR_SPECIAL_x8001, VAR_SPECIAL_RESULT
	get_seal_quantity VAR_SPECIAL_x8006, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 96
	goto_if_le _01C2
	subvar VAR_SPECIAL_RESULT, 96
	subvar VAR_SPECIAL_x8002, VAR_SPECIAL_RESULT
_01C2:
	give_or_take_seal VAR_SPECIAL_x8004, VAR_SPECIAL_x8000
	give_or_take_seal VAR_SPECIAL_x8005, VAR_SPECIAL_x8001
	give_or_take_seal VAR_SPECIAL_x8006, VAR_SPECIAL_x8002
	buffer_seal_name_plural 0, VAR_SPECIAL_x8004
	npc_msg msg_0398_R39R0201_00020
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	buffer_seal_name_plural 0, VAR_SPECIAL_x8005
	npc_msg msg_0398_R39R0201_00020
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	buffer_seal_name_plural 0, VAR_SPECIAL_x8006
	npc_msg msg_0398_R39R0201_00020
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	closemsg
	setflag FLAG_UNK_101
	goto _00D2
	end

_020C:
	npc_msg msg_0398_R39R0201_00003
	closemsg
	goto _00D2
	end

	.balign 4, 0
_021C:
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_0224:
	WalkOnSpotNormalWest
	EndMovement

scr_seq_R39R0201_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_UNK_0AA, _0354
	play_cry SPECIES_MILTANK, 11
	npc_msg msg_0398_R39R0201_00009
	wait_cry
	goto_if_set FLAG_UNK_0A8, _0260
	npc_msg msg_0398_R39R0201_00010
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0260:
	npc_msg msg_0398_R39R0201_00010
	wait_button
	npc_msg msg_0398_R39R0201_00013
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _028C
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0378
	end

_028C:
	setvar VAR_SPECIAL_x8004, 155
	setvar VAR_SPECIAL_x8005, 1
	hasitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _036A
	takeitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	buffer_players_name 0
	npc_msg msg_0398_R39R0201_00014
	wait_button_or_walk_away
	closemsg
	goto_if_set FLAG_UNK_0B0, _033F
	goto_if_set FLAG_UNK_0AF, _0337
	goto_if_set FLAG_UNK_0AE, _0328
	goto_if_set FLAG_UNK_0AD, _0320
	goto_if_set FLAG_UNK_0AC, _0311
	goto_if_set FLAG_UNK_0A9, _0309
	setflag FLAG_UNK_0A9
	releaseall
	end

_0309:
	setflag FLAG_UNK_0AC
	releaseall
	end

_0311:
	setflag FLAG_UNK_0AD
	npc_msg msg_0398_R39R0201_00015
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0320:
	setflag FLAG_UNK_0AE
	releaseall
	end

_0328:
	setflag FLAG_UNK_0AF
	npc_msg msg_0398_R39R0201_00016
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0337:
	setflag FLAG_UNK_0B0
	releaseall
	end

_033F:
	play_fanfare SEQ_ME_ASA
	wait_fanfare
	npc_msg msg_0398_R39R0201_00017
	wait_button_or_walk_away
	closemsg
	setflag FLAG_UNK_0AA
	releaseall
	end

_0354:
	play_cry SPECIES_MILTANK, 0
	npc_msg msg_0398_R39R0201_00011
	wait_cry
	npc_msg msg_0398_R39R0201_00012
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_036A:
	buffer_players_name 0
	npc_msg msg_0398_R39R0201_00018
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0378:
	buffer_players_name 0
	npc_msg msg_0398_R39R0201_00019
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_R39R0201_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	play_cry SPECIES_MILTANK, 0
	npc_msg msg_0398_R39R0201_00011
	wait_cry
	npc_msg msg_0398_R39R0201_00012
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
