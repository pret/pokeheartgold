#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R16R0201.h"
#include "msgdata/msg/msg_0356_R16R0201.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R16R0201_000
	scrdef scr_seq_R16R0201_001
	scrdef scr_seq_R16R0201_002
	scrdef scr_seq_R16R0201_003
	scrdef_end

scr_seq_R16R0201_003:
	goto_if_set FLAG_UNK_149, _001F
	end

_001F:
	scrcmd_186 1
	end

scr_seq_R16R0201_001:
	scrcmd_609
	lockall
	scrcmd_184 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _006A
	apply_movement obj_player, _0084
	wait_movement
	npc_msg msg_0356_R16R0201_00001
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_player, _008C
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	releaseall
	end

_006A:
	scrcmd_186 1
	setvar VAR_UNK_4129, 1
	setvar VAR_UNK_412A, 1
	setflag FLAG_UNK_149
	releaseall
	end
	.byte 0x00, 0x00, 0x00

_0084:
	step 32, 1
	step_end

_008C:
	step 15, 1
	step_end
scr_seq_R16R0201_002:
	scrcmd_186 0
	setvar VAR_UNK_4129, 0
	setvar VAR_UNK_412A, 0
	clearflag FLAG_UNK_149
	end

scr_seq_R16R0201_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0356_R16R0201_00000
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
