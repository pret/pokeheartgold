#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T10R0401.h"
#include "msgdata/msg/msg_0525_T10R0401.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T10R0401_000
	scrdef scr_seq_T10R0401_001
	scrdef scr_seq_T10R0401_002
	scrdef_end

scr_seq_T10R0401_002:
	checkflag FLAG_DEFEATED_BRUNO
	gotoif TRUE, _0023
	scrcmd_375 3
	scrcmd_375 4
	end

_0023:
	end

scr_seq_T10R0401_000:
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
	clearflag FLAG_HIDE_BRUNOS_ROOM_RETREAT
	show_person obj_T10R0401_babyboy1_11
	setvar VAR_TEMP_x4001, 1
	releaseall
	end
	.byte 0x00, 0x00, 0x00

_0060:
	step 12, 6
	step_end
scr_seq_T10R0401_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_DEFEATED_BRUNO
	gotoif TRUE, _00D4
	buffer_players_name 0
	npc_msg msg_0525_T10R0401_00000
	closemsg
	comparevartovalue VAR_UNK_4135, 8
	gotoif lt, _009E
	trainer_battle TRAINER_ELITE_FOUR_BRUNO_BRUNO_2, 0, 0, 0
	goto _00A6

_009E:
	trainer_battle TRAINER_ELITE_FOUR_BRUNO_BRUNO, 0, 0, 0
_00A6:
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _00DF
	setflag FLAG_DEFEATED_BRUNO
	npc_msg msg_0525_T10R0401_00001
	closemsg
	play_se SEQ_SE_DP_KI_GASYAN
	hide_person obj_T10R0401_leag_door2
	hide_person obj_T10R0401_leag_door2_2
	hide_person obj_T10R0401_leag_door2_3
	releaseall
	end

_00D4:
	npc_msg msg_0525_T10R0401_00002
	waitbutton
	closemsg
	releaseall
	end

_00DF:
	white_out
	releaseall
	end
	.balign 4, 0
