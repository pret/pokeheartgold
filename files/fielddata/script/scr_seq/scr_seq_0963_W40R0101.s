#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_W40R0101.h"
#include "msgdata/msg/msg_0745_W40R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_W40R0101_000
	scrdef scr_seq_W40R0101_001
	scrdef scr_seq_W40R0101_002
	scrdef_end

scr_seq_W40R0101_001:
	compare VAR_UNK_40E5, 1
	goto_if_ge _0036
	goto_if_set FLAG_GAME_CLEAR, _0028
	end

_0028:
	move_person_facing obj_W40R0101_gsmiddleman1, 3, 0, 3, DIR_NORTH
	end

_0036:
	setvar VAR_UNK_40E5, 2
	end

scr_seq_W40R0101_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	goto_if_set FLAG_UNK_0FB, _00BE
	goto_if_set FLAG_GAME_CLEAR, _00B1
	get_player_facing VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 3
	goto_if_ne _0079
	apply_movement obj_W40R0101_gsmiddleman1, _00E4
	goto _009C

_0079:
	compare VAR_TEMP_x4000, 2
	goto_if_ne _0094
	apply_movement obj_W40R0101_gsmiddleman1, _00DC
	goto _009C

_0094:
	apply_movement obj_W40R0101_gsmiddleman1, _00D4
_009C:
	wait_movement
	npc_msg msg_0745_W40R0101_00000
	closemsg
	apply_movement obj_W40R0101_gsmiddleman1, _00CC
	wait_movement
	releaseall
	end

_00B1:
	npc_msg msg_0745_W40R0101_00001
	closemsg
	releaseall
	setflag FLAG_UNK_0FB
	end

_00BE:
	npc_msg msg_0745_W40R0101_00002
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.byte 0x00, 0x00, 0x00

_00CC:
	step 32, 1
	step_end

_00D4:
	step 33, 1
	step_end

_00DC:
	step 35, 1
	step_end

_00E4:
	step 34, 1
	step_end
scr_seq_W40R0101_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_GAME_CLEAR, _0108
	npc_msg msg_0745_W40R0101_00003
	goto _010B

_0108:
	npc_msg msg_0745_W40R0101_00004
_010B:
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
