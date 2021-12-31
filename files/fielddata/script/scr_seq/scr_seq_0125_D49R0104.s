#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D49R0104.h"
#include "msgdata/msg/msg_0140_D49R0104.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D49R0104_000
	scrdef scr_seq_D49R0104_001
	scrdef scr_seq_D49R0104_002
	scrdef scr_seq_D49R0104_003
	scrdef scr_seq_D49R0104_004
	scrdef scr_seq_D49R0104_005
	scrdef scr_seq_D49R0104_006
	scrdef scr_seq_D49R0104_007
	scrdef scr_seq_D49R0104_008
	scrdef scr_seq_D49R0104_009
	scrdef scr_seq_D49R0104_010
	scrdef scr_seq_D49R0104_011
	scrdef scr_seq_D49R0104_012
	scrdef scr_seq_D49R0104_013
	scrdef_end

scr_seq_D49R0104_012:
	checkflag FLAG_UNK_0EF
	gotoif TRUE, _004D
	setvar VAR_TEMP_x400B, 0
	end

_004D:
	setvar VAR_TEMP_x400B, 1
	end

scr_seq_D49R0104_011:
	comparevartovalue VAR_TEMP_x400B, 1
	gotoif ne, _0074
	move_person 2, 2, 1, 3, 3
	setvar VAR_TEMP_x400B, 0
_0074:
	end

scr_seq_D49R0104_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0140_D49R0104_00000
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D49R0104_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0EF
	gotoif TRUE, _00A7
	npc_msg msg_0140_D49R0104_00001
	waitbutton
	closemsg
	releaseall
	end

_00A7:
	npc_msg msg_0140_D49R0104_00002
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D49R0104_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0140_D49R0104_00003
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D49R0104_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0140_D49R0104_00004
	closemsg
	apply_movement obj_D49R0104_tsure_poke_575, _00F0
	wait_movement
	play_cry SPECIES_RATTATA, 0
	npc_msg msg_0140_D49R0104_00011
	wait_cry
	waitbutton
	closemsg
	releaseall
	end
	.byte 0x00

_00F0:
	step 48, 2
	step_end
scr_seq_D49R0104_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0140_D49R0104_00005
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D49R0104_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	play_cry SPECIES_RATTATA, 0
	npc_msg msg_0140_D49R0104_00010
	wait_cry
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D49R0104_006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	play_cry SPECIES_ZUBAT, 0
	npc_msg msg_0140_D49R0104_00012
	wait_cry
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D49R0104_007:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	buffer_players_name 0
	npc_msg msg_0140_D49R0104_00006
	closemsg
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_712 0
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
	releaseall
	end

scr_seq_D49R0104_008:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0140_D49R0104_00007
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D49R0104_009:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0140_D49R0104_00008
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D49R0104_010:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0140_D49R0104_00009
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D49R0104_013:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0140_D49R0104_00013
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
