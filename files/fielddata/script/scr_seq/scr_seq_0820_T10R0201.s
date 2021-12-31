#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T10R0201.h"
#include "msgdata/msg/msg_0523_T10R0201.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T10R0201_000
	scrdef scr_seq_T10R0201_001
	scrdef scr_seq_T10R0201_002
	scrdef_end

scr_seq_T10R0201_002:
	checkflag FLAG_UNK_0E4
	gotoif TRUE, _0023
	scrcmd_375 3
	scrcmd_375 4
	end

_0023:
	end

scr_seq_T10R0201_000:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_player, _0060
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	play_se SEQ_SE_DP_KI_GASYAN
	clearflag FLAG_UNK_20B
	show_person obj_T10R0201_babyboy1_11
	setvar VAR_TEMP_x4001, 1
	releaseall
	end
	.byte 0x00, 0x00, 0x00

_0060:
	step 12, 6
	step_end
scr_seq_T10R0201_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0E4
	gotoif TRUE, _00D1
	npc_msg msg_0523_T10R0201_00000
	closemsg
	comparevartovalue VAR_UNK_4135, 8
	gotoif lt, _009B
	trainer_battle TRAINER_ELITE_FOUR_WILL_WILL_2, 0, 0, 0
	goto _00A3

_009B:
	trainer_battle TRAINER_ELITE_FOUR_WILL_WILL, 0, 0, 0
_00A3:
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _00DC
	setflag FLAG_UNK_0E4
	npc_msg msg_0523_T10R0201_00001
	closemsg
	play_se SEQ_SE_DP_KI_GASYAN
	hide_person obj_T10R0201_leag_door2
	hide_person obj_T10R0201_stop
	hide_person obj_T10R0201_stop_2
	releaseall
	end

_00D1:
	npc_msg msg_0523_T10R0201_00002
	waitbutton
	closemsg
	releaseall
	end

_00DC:
	white_out
	releaseall
	end
	.balign 4, 0
