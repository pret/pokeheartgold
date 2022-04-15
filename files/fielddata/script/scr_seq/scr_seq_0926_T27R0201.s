#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T27R0201.h"
#include "msgdata/msg/msg_0616_T27R0201.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T27R0201_000
	scrdef scr_seq_T27R0201_001
	scrdef scr_seq_T27R0201_002
	scrdef scr_seq_T27R0201_003
	scrdef_end

scr_seq_T27R0201_003:
	goto_if_set FLAG_UNK_108, _001F
	end

_001F:
	move_person_facing obj_T27R0201_bozu, 16, 0, 8, DIR_WEST
	end

scr_seq_T27R0201_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_UNK_108, _00E8
	compare VAR_TEMP_x4002, 1
	goto_if_ge _00C9
	get_player_facing VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 1
	goto_if_eq _00D4
	check_badge BADGE_FOG, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0096
	get_game_version VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 7
	goto_if_ne _008B
	npc_msg msg_0616_T27R0201_00000
	goto _008E

_008B:
	npc_msg msg_0616_T27R0201_00001
_008E:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0096:
	get_game_version VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 7
	goto_if_ne _00B0
	npc_msg msg_0616_T27R0201_00002
	goto _00B3

_00B0:
	npc_msg msg_0616_T27R0201_00003
_00B3:
	closemsg
	apply_movement obj_T27R0201_bozu, _00F4
	wait_movement
	setvar VAR_TEMP_x4002, 1
	releaseall
	end

_00C9:
	npc_msg msg_0616_T27R0201_00004
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_00D4:
	apply_movement obj_T27R0201_bozu, _0104
	wait_movement
	setvar VAR_TEMP_x4002, 1
	releaseall
	end

_00E8:
	npc_msg msg_0616_T27R0201_00005
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.byte 0x00

_00F4:
	step 12, 1
	step 15, 1
	step 2, 1
	step_end

_0104:
	step 13, 1
	step 15, 1
	step 2, 1
	step_end
scr_seq_T27R0201_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_UNK_108, _0162
	goto_if_set FLAG_UNK_103, _0157
	get_game_version VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 7
	goto_if_ne _014C
	npc_msg msg_0616_T27R0201_00006
	goto _014F

_014C:
	npc_msg msg_0616_T27R0201_00007
_014F:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0157:
	npc_msg msg_0616_T27R0201_00008
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0162:
	npc_msg msg_0616_T27R0201_00009
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T27R0201_002:
	simple_npc_msg msg_0616_T27R0201_00010
	end
	.balign 4, 0
