#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D49R0105.h"
#include "msgdata/msg/msg_0141_D49R0105.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D49R0105_000
	scrdef scr_seq_D49R0105_001
	scrdef scr_seq_D49R0105_002
	scrdef scr_seq_D49R0105_003
	scrdef scr_seq_D49R0105_004
	scrdef scr_seq_D49R0105_005
	scrdef scr_seq_D49R0105_006
	scrdef scr_seq_D49R0105_007
	scrdef scr_seq_D49R0105_008
	scrdef scr_seq_D49R0105_009
	scrdef scr_seq_D49R0105_010
	scrdef scr_seq_D49R0105_011
	scrdef scr_seq_D49R0105_012
	scrdef scr_seq_D49R0105_013
	scrdef_end

scr_seq_D49R0105_012:
	checkflag FLAG_UNK_0F0
	gotoif TRUE, _004D
	setvar VAR_TEMP_x400C, 0
	end

_004D:
	setvar VAR_TEMP_x400C, 1
	end

scr_seq_D49R0105_011:
	comparevartovalue VAR_TEMP_x400C, 1
	gotoif ne, _0074
	move_person obj_D49R0105_pcwoman2_2, 2, 1, 3, 3
	setvar VAR_TEMP_x400C, 0
_0074:
	end

scr_seq_D49R0105_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0141_D49R0105_00000
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D49R0105_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0F0
	gotoif TRUE, _00A7
	npc_msg msg_0141_D49R0105_00001
	waitbutton
	closemsg
	releaseall
	end

_00A7:
	npc_msg msg_0141_D49R0105_00002
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D49R0105_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0141_D49R0105_00003
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D49R0105_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0141_D49R0105_00004
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D49R0105_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0141_D49R0105_00005
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D49R0105_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0141_D49R0105_00014
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D49R0105_006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	play_cry SPECIES_DRATINI, 0
	npc_msg msg_0141_D49R0105_00015
	wait_cry
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D49R0105_007:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	buffer_players_name 0
	npc_msg msg_0141_D49R0105_00006
	closemsg
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_712 1
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
	releaseall
	end

scr_seq_D49R0105_008:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_2D6
	gotoif FALSE, _0166
	npc_msg msg_0141_D49R0105_00007
	waitbutton
	closemsg
	releaseall
	end

_0166:
	npc_msg msg_0141_D49R0105_00008
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D49R0105_009:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_2D5
	gotoif FALSE, _018F
	npc_msg msg_0141_D49R0105_00009
	waitbutton
	closemsg
	releaseall
	end

_018F:
	npc_msg msg_0141_D49R0105_00010
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D49R0105_010:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_2D7
	gotoif FALSE, _01B8
	npc_msg msg_0141_D49R0105_00011
	waitbutton
	closemsg
	releaseall
	end

_01B8:
	npc_msg msg_0141_D49R0105_00012
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D49R0105_013:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0141_D49R0105_00013
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
