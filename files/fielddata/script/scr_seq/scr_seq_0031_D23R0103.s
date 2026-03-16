#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D23R0103.h"
#include "msgdata/msg/msg_0067_D23R0103.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D23R0103_000
	scrdef scr_seq_D23R0103_001
	scrdef scr_seq_D23R0103_002
	scrdef scr_seq_D23R0103_003
	scrdef scr_seq_D23R0103_004
	scrdef scr_seq_D23R0103_005
	scrdef scr_seq_D23R0103_006
	scrdef scr_seq_D23R0103_007
	scrdef_end

scr_seq_D23R0103_000:
	setflag FLAG_HIDE_ROCKET_TAKEOVER_1
	setflag FLAG_HIDE_ROCKET_TAKEOVER_2
	compare VAR_SCENE_ROCKET_TAKEOVER, 4
	goto_if_ne _0041
	clearflag FLAG_HIDE_ROCKET_TAKEOVER_1
	goto _0052

_0041:
	compare VAR_SCENE_ROCKET_TAKEOVER, 5
	goto_if_ne _0052
	clearflag FLAG_HIDE_ROCKET_TAKEOVER_2
_0052:
	end

scr_seq_D23R0103_001:
	simple_npc_msg msg_0067_D23R0103_00015
	end

scr_seq_D23R0103_002:
	simple_npc_msg msg_0067_D23R0103_00016
	end

scr_seq_D23R0103_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	compare VAR_SCENE_ROCKET_TAKEOVER, 4
	goto_if_ne _0098
	npc_msg msg_0067_D23R0103_00001
	goto _009B

_0098:
	npc_msg msg_0067_D23R0103_00002
_009B:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_D23R0103_004:
	simple_npc_msg msg_0067_D23R0103_00000
	end

scr_seq_D23R0103_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	compare VAR_SCENE_ROCKET_TAKEOVER, 4
	goto_if_ne _00E7
	getitemquantity ITEM_BASEMENT_KEY, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _00F5
	npc_msg msg_0067_D23R0103_00003
	goto _00ED

_00E7:
	goto _0100

_00ED:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_00F5:
	npc_msg msg_0067_D23R0103_00004
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0100:
	goto_if_set FLAG_GOT_TM11_FROM_RADIO_TOWER_WOMAN, _014D
	npc_msg msg_0067_D23R0103_00005
	goto_if_no_item_space ITEM_TM11, 1, _0142
	callstd std_give_item_verbose
	npc_msg msg_0067_D23R0103_00007
	wait_button_or_walk_away
	closemsg
	releaseall
	setflag FLAG_GOT_TM11_FROM_RADIO_TOWER_WOMAN
	end

_0142:
	npc_msg msg_0067_D23R0103_00008
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_014D:
	npc_msg msg_0067_D23R0103_00009
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_D23R0103_006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	getitemquantity ITEM_CARD_KEY, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _01B4
	npc_msg msg_0067_D23R0103_00010
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_D23R0103_007:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_UNK_090, _01E2
	npc_msg msg_0067_D23R0103_00011
	closemsg
	getitemquantity ITEM_CARD_KEY, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _01B4
	npc_msg msg_0067_D23R0103_00013
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_01B4:
	buffer_players_name 0
	npc_msg msg_0067_D23R0103_00012
	closemsg
	apply_movement obj_D23R0103_babyboy1_9, _01F0
	apply_movement obj_D23R0103_babyboy1_9_2, _01F8
	wait_movement
	releaseall
	setflag FLAG_UNK_1BF
	hide_person obj_D23R0103_babyboy1_9
	hide_person obj_D23R0103_babyboy1_9_2
	setflag FLAG_UNK_090
	end

_01E2:
	npc_msg msg_0067_D23R0103_00014
	wait_button_or_walk_away
	closemsg
	releaseall
	end

	.balign 4, 0
_01F0:
	WalkNormalWest 2
	EndMovement

	.balign 4, 0
_01F8:
	WalkNormalEast 2
	EndMovement
	.balign 4, 0
