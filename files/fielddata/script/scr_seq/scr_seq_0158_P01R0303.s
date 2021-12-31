#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_P01R0303.h"
#include "msgdata/msg/msg_0261_P01R0303.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_P01R0303_000
	scrdef scr_seq_P01R0303_001
	scrdef_end

scr_seq_P01R0303_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0ED
	gotoif FALSE, _0112
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, _009D
	apply_movement obj_P01R0303_seaman_2, _0120
	wait_movement
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_P01R0303_seaman_2, _0144
	apply_movement obj_player, _01C8
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	npc_msg msg_0261_P01R0303_00005
	closemsg
	trainer_battle TRAINER_SAILOR_STANLY, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _010C
	npc_msg msg_0261_P01R0303_00006
	closemsg
	apply_movement obj_P01R0303_seaman_2, _0160
	wait_movement
	setvar VAR_UNK_40CB, 3
	hide_person 0
	setflag FLAG_UNK_21A
	releaseall
	end

_009D:
	apply_movement obj_P01R0303_seaman_2, _016C
	wait_movement
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_P01R0303_seaman_2, _0190
	apply_movement obj_player, _01DC
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	npc_msg msg_0261_P01R0303_00005
	closemsg
	trainer_battle TRAINER_SAILOR_STANLY, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _010C
	npc_msg msg_0261_P01R0303_00006
	closemsg
	apply_movement obj_P01R0303_seaman_2, _01AC
	wait_movement
	setvar VAR_UNK_40CB, 3
	hide_person 0
	setflag FLAG_UNK_21A
	releaseall
	end

_010C:
	white_out
	releaseall
	end

_0112:
	npc_msg msg_0261_P01R0303_00004
	waitbutton
	closemsg
	releaseall
	end
	.byte 0x00, 0x00, 0x00

_0120:
	step 75, 1
	step 63, 1
	step 3, 2
	step 2, 2
	step 3, 2
	step 71, 1
	step 58, 1
	step 72, 1
	step_end

_0144:
	step 0, 2
	step 16, 2
	step 3, 2
	step 19, 4
	step 1, 2
	step 17, 1
	step_end

_0160:
	step 0, 2
	step 16, 7
	step_end

_016C:
	step 75, 1
	step 63, 1
	step 2, 2
	step 3, 2
	step 2, 2
	step 71, 1
	step 59, 1
	step 72, 1
	step_end

_0190:
	step 0, 2
	step 16, 2
	step 2, 2
	step 18, 4
	step 1, 2
	step 17, 1
	step_end

_01AC:
	step 0, 2
	step 16, 3
	step 3, 2
	step 19, 4
	step 0, 2
	step 16, 4
	step_end

_01C8:
	step 65, 1
	step 3, 2
	step 15, 1
	step 0, 2
	step_end

_01DC:
	step 65, 1
	step 2, 2
	step 14, 1
	step 0, 2
	step_end
scr_seq_P01R0303_001:
	scrcmd_609
	lockall
	apply_movement obj_player, _02B4
	wait_movement
	npc_msg msg_0261_P01R0303_00000
	closemsg
	fade_screen 6, 1, 0, 0x00
	wait_fade
	play_fanfare SEQ_ME_ASA
	wait_fanfare
	heal_party
	scrcmd_436
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
	npc_msg msg_0261_P01R0303_00001
	closemsg
	scrcmd_729 VAR_TEMP_x4002
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif eq, _0247
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 56
_0247:
	apply_movement obj_player, _02C4
	wait_movement
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif eq, _0268
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
_0268:
	comparevartovalue VAR_UNK_40CB, 7
	gotoif ge, _0279
	releaseall
	end

_0279:
	checkflag FLAG_UNK_0EB
	gotoif TRUE, _02AD
	play_se SEQ_SE_DP_PINPON
	wait_se SEQ_SE_DP_PINPON
	setflag FLAG_UNK_0EB
	comparevartovalue VAR_UNK_40E1, 1
	gotoif ne, _02A6
	npc_msg msg_0261_P01R0303_00003
	goto _02A9

_02A6:
	npc_msg msg_0261_P01R0303_00002
_02A9:
	waitbutton
	closemsg
_02AD:
	releaseall
	end
	.byte 0x00, 0x00, 0x00

_02B4:
	step 1, 2
	step 65, 1
	step 75, 1
	step_end

_02C4:
	step 3, 2
	step 55, 1
	step_end
	.balign 4, 0
