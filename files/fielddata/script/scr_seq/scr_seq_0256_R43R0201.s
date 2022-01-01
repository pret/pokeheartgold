#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R43R0201.h"
#include "msgdata/msg/msg_0403_R43R0201.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R43R0201_000
	scrdef scr_seq_R43R0201_001
	scrdef scr_seq_R43R0201_002
	scrdef scr_seq_R43R0201_003
	scrdef_end

scr_seq_R43R0201_001:
	scrcmd_081 1037
	play_bgm SEQ_GS_EYE_ROCKET
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _0037
	goto _0095
	.byte 0x16, 0x00, 0x2f, 0x00, 0x00, 0x00
_0037:
	apply_movement obj_R43R0201_rocketm, _0114
	apply_movement obj_R43R0201_rocketm_2, _0128
	wait_movement
	npc_msg msg_0403_R43R0201_00000
	hasenoughmoneyimmediate 32780, 1000
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _006C
	npc_msg msg_0403_R43R0201_00001
	closemsg
	goto _0077

_006C:
	npc_msg msg_0403_R43R0201_00002
	closemsg
	goto _0077

_0077:
	submoneyimmediate 1000
	apply_movement obj_R43R0201_rocketm, _0144
	apply_movement obj_R43R0201_rocketm_2, _0158
	wait_movement
	goto _00ED

_0095:
	apply_movement obj_R43R0201_rocketm, _0164
	apply_movement obj_R43R0201_rocketm_2, _0180
	wait_movement
	npc_msg msg_0403_R43R0201_00000
	hasenoughmoneyimmediate 32780, 1000
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _00CA
	npc_msg msg_0403_R43R0201_00001
	closemsg
	goto _00D5

_00CA:
	npc_msg msg_0403_R43R0201_00002
	closemsg
	goto _00D5

_00D5:
	submoneyimmediate 1000
	apply_movement obj_R43R0201_rocketm, _0194
	apply_movement obj_R43R0201_rocketm_2, _01A4
	wait_movement
_00ED:
	scrcmd_081 1112
	play_bgm SEQ_GS_R_7_42
	setvar VAR_UNK_410F, 1
	end

scr_seq_R43R0201_002:
	checkflag FLAG_RED_GYARADOS_MEET
	gotoif TRUE, _0110
	setvar VAR_UNK_410F, 0
	end

_0110:
	end
	.byte 0x00, 0x00

_0114:
	step 75, 1
	step 21, 3
	step 23, 2
	step 1, 1
	step_end

_0128:
	step 63, 6
	step 1, 1
	step 75, 1
	step 21, 3
	step 22, 1
	step 1, 1
	step_end

_0144:
	step 62, 3
	step 22, 2
	step 20, 3
	step 1, 1
	step_end

_0158:
	step 23, 1
	step 20, 3
	step_end

_0164:
	step 63, 6
	step 0, 1
	step 75, 1
	step 20, 4
	step 23, 1
	step 0, 1
	step_end

_0180:
	step 75, 1
	step 20, 4
	step 22, 2
	step 0, 1
	step_end

_0194:
	step 62, 3
	step 22, 1
	step 21, 4
	step_end

_01A4:
	step 23, 2
	step 21, 4
	step 0, 1
	step_end
scr_seq_R43R0201_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0403_R43R0201_00003
	waitbutton
	closemsg
	releaseall
	end

scr_seq_R43R0201_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0CE
	gotoif TRUE, _0208
	npc_msg msg_0403_R43R0201_00004
	goto_if_no_item_space ITEM_TM36, 1, _0213
	callstd std_obtain_item_verbose
	waitbutton
	setflag FLAG_UNK_0CE
_0208:
	npc_msg msg_0403_R43R0201_00006
	waitbutton
	closemsg
	releaseall
	end

_0213:
	callstd std_bag_is_full
	closemsg
	releaseall
	end
	.balign 4, 0
