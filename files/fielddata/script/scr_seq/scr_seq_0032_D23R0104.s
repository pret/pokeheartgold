#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D23R0104.h"
#include "msgdata/msg/msg_0068_D23R0104.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D23R0104_000
	scrdef scr_seq_D23R0104_001
	scrdef scr_seq_D23R0104_002
	scrdef scr_seq_D23R0104_003
	scrdef scr_seq_D23R0104_004
	scrdef scr_seq_D23R0104_005
	scrdef scr_seq_D23R0104_006
	scrdef scr_seq_D23R0104_007
	scrdef scr_seq_D23R0104_008
	scrdef_end

scr_seq_D23R0104_000:
	setflag FLAG_UNK_1B7
	setflag FLAG_UNK_1B8
	comparevartovalue VAR_UNK_4077, 4
	gotoif ne, _0045
	clearflag FLAG_UNK_1B7
	goto _0056

_0045:
	comparevartovalue VAR_UNK_4077, 5
	gotoif ne, _0056
	clearflag FLAG_UNK_1B8
_0056:
	end

scr_seq_D23R0104_008:
	comparevartovalue VAR_UNK_4077, 4
	gotoif ne, _0089
	move_person obj_D23R0104_kurumi, 18, 1, 12, 3
	move_person obj_D23R0104_tsure_poke_587, 19, 1, 12, 1
	move_person obj_D23R0104_gsman2, 20, 1, 12, 1
_0089:
	end

scr_seq_D23R0104_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0068_D23R0104_00008
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D23R0104_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0068_D23R0104_00009
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D23R0104_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0068_D23R0104_00000
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D23R0104_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 4
	gotoif ne, _00E2
	npc_msg msg_0068_D23R0104_00001
	goto _00E8

_00E2:
	goto _00F0

_00E8:
	waitbutton
	closemsg
	releaseall
	end

_00F0:
	checkflag FLAG_UNK_091
	gotoif TRUE, _013D
	npc_msg msg_0068_D23R0104_00002
	goto_if_no_item_space ITEM_BRIGHTPOWDER, 1, _0132
	callstd std_give_item_verbose
	npc_msg msg_0068_D23R0104_00004
	waitbutton
	closemsg
	releaseall
	setflag FLAG_UNK_091
	end

_0132:
	npc_msg msg_0068_D23R0104_00005
	waitbutton
	closemsg
	releaseall
	end

_013D:
	npc_msg msg_0068_D23R0104_00006
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D23R0104_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	play_cry SPECIES_MEOWTH, 0
	npc_msg msg_0068_D23R0104_00007
	wait_cry
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D23R0104_006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 4
	gotoif ne, _0181
	npc_msg msg_0068_D23R0104_00010
	goto _0184

_0181:
	npc_msg msg_0068_D23R0104_00011
_0184:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D23R0104_007:
	checktrainerflag TRAINER_TEAM_ROCKET_F_GRUNT_4
	gotoif eq, _01F6
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0068_D23R0104_00012
	scrcmd_386 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, _01BF
	apply_movement obj_D23R0104_rocketw, _0210
	goto _01C7

_01BF:
	apply_movement obj_D23R0104_rocketw, _021C
_01C7:
	wait_movement
	npc_msg msg_0068_D23R0104_00013
	closemsg
	trainer_battle TRAINER_TEAM_ROCKET_F_GRUNT_4, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0209
	settrainerflag TRAINER_TEAM_ROCKET_F_GRUNT_4
	npc_msg msg_0068_D23R0104_00014
	waitbutton
	closemsg
	releaseall
	end

_01F6:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0068_D23R0104_00014
	waitbutton
	closemsg
	releaseall
	end

_0209:
	white_out
	releaseall
	end
	.byte 0x00

_0210:
	step 75, 1
	step 35, 1
	step_end

_021C:
	step 75, 1
	step 33, 1
	step_end
	.balign 4, 0
