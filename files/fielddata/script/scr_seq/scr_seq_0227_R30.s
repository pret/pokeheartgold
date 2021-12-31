#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R30.h"
#include "msgdata/msg/msg_0375_R30.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R30_000
	scrdef scr_seq_R30_001
	scrdef scr_seq_R30_002
	scrdef scr_seq_R30_003
	scrdef scr_seq_R30_004
	scrdef scr_seq_R30_005
	scrdef scr_seq_R30_006
	scrdef scr_seq_R30_007
	scrdef scr_seq_R30_008
	scrdef scr_seq_R30_009
	scrdef scr_seq_R30_010
	scrdef_end

scr_seq_R30_001:
	setflag FLAG_UNK_0EE
	setvar VAR_SPECIAL_x8004, 1
	setvar VAR_SPECIAL_x8005, 2
	setvar VAR_SPECIAL_x8006, 0
	callstd std_phone_call
	setvar VAR_UNK_408C, 3
	end

scr_seq_R30_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0375_R30_00000
	closemsg
	apply_movement obj_R30_tsure_poke_575, _0088
	wait_movement
	apply_movement obj_R30_tsure_poke_574, _0090
	wait_movement
	play_se SEQ_SE_DP_SELECT
	faceplayer
	npc_msg msg_0375_R30_00001
	closemsg
	apply_movement obj_R30_gsboy2_3, _0098
	wait_movement
	releaseall
	end


_0088:
	step 48, 3
	step_end

_0090:
	step 49, 2
	step_end

_0098:
	step 32, 1
	step_end
scr_seq_R30_002:
	scrcmd_609
	lockall
	scrcmd_307 17, 11, 11, 3, 77
	scrcmd_310 77
	scrcmd_308 77
	clearflag FLAG_UNK_24F
	show_person 13
	apply_movement obj_R30_gsmiddleman1, _01B0
	wait_movement
	scrcmd_311 77
	scrcmd_308 77
	scrcmd_309 77
	apply_movement obj_R30_gsmiddleman1, _01C4
	wait_movement
	npc_msg msg_0375_R30_00005
	closemsg
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	comparevartovalue VAR_TEMP_x4000, 558
	gotoif ne, _010A
	apply_movement obj_player, _01D4
	goto _0148

_010A:
	comparevartovalue VAR_TEMP_x4000, 559
	gotoif ne, _0125
	apply_movement obj_player, _01E8
	goto _0148

_0125:
	comparevartovalue VAR_TEMP_x4000, 560
	gotoif ne, _0140
	apply_movement obj_player, _01FC
	goto _0148

_0140:
	apply_movement obj_player, _0210
_0148:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	npc_msg msg_0375_R30_00006
	setvar VAR_SPECIAL_x8004, 468
	setvar VAR_SPECIAL_x8005, 1
	callstd std_give_item_verbose
	npc_msg msg_0375_R30_00008
	closemsg
	apply_movement obj_R30_gsmiddleman1, _01CC
	wait_movement
	scrcmd_307 17, 11, 11, 3, 77
	scrcmd_310 77
	scrcmd_308 77
	apply_movement obj_R30_gsmiddleman1, _01B8
	wait_movement
	scrcmd_311 77
	scrcmd_308 77
	scrcmd_309 77
	hide_person 13
	setflag FLAG_UNK_24F
	releaseall
	setflag FLAG_UNK_06D
	setvar VAR_UNK_408C, 1
	end


_01B0:
	step 13, 1
	step_end

_01B8:
	step 12, 1
	step 69, 1
	step_end

_01C4:
	step 35, 1
	step_end

_01CC:
	step 32, 1
	step_end

_01D4:
	step 13, 2
	step 34, 1
	step 63, 2
	step 14, 2
	step_end

_01E8:
	step 13, 2
	step 34, 1
	step 63, 2
	step 14, 3
	step_end

_01FC:
	step 13, 2
	step 34, 1
	step 63, 2
	step 14, 4
	step_end

_0210:
	step 13, 2
	step 34, 1
	step 63, 2
	step 14, 5
	step_end
scr_seq_R30_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0375_R30_00013
	waitbutton
	closemsg
	releaseall
	end

scr_seq_R30_004:
	scrcmd_609
	lockall
	setvar VAR_SPECIAL_x8004, 0
	setvar VAR_SPECIAL_x8005, 2
	setvar VAR_SPECIAL_x8006, 0
	callstd std_phone_call
	setvar VAR_UNK_4095, 0
	setflag FLAG_UNK_0A7
	releaseall
	end

scr_seq_R30_005:
	scrcmd_055 9, 1, 6, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_R30_006:
	scrcmd_055 10, 1, 3, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_R30_007:
	scrcmd_056 3, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 12, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_R30_008:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 11, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_R30_009:
	checkflag FLAG_UNK_06B
	gotoif TRUE, _02D5
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0375_R30_00002
	waitbutton
	closemsg
	releaseall
	end

_02D5:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0375_R30_00003
	waitbutton
	closemsg
	releaseall
	end

scr_seq_R30_010:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0375_R30_00004
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
