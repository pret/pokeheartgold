#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D24R0102.h"
#include "msgdata/msg/msg_0073_D24R0102.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D24R0102_000
	scrdef scr_seq_D24R0102_001
	scrdef scr_seq_D24R0102_002
	scrdef scr_seq_D24R0102_003
	scrdef scr_seq_D24R0102_004
	scrdef scr_seq_D24R0102_005
	scrdef_end

scr_seq_D24R0102_005:
	clearflag FLAG_UNK_10F
	end

scr_seq_D24R0102_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_545 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 28
	goto_if_eq _0093
	compare VAR_UNK_40EC, 1
	goto_if_ge _008A
	goto_if_set FLAG_UNK_10F, _0081
	npc_msg msg_0073_D24R0102_00000
	setflag FLAG_UNK_10F
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _0077
	apply_movement obj_D24R0102_suit, _009C
	goto _007F

_0077:
	apply_movement obj_D24R0102_suit, _00E4
_007F:
	wait_movement
_0081:
	npc_msg msg_0073_D24R0102_00001
	goto _0366

_008A:
	npc_msg msg_0073_D24R0102_00002
	goto _0366

_0093:
	npc_msg msg_0073_D24R0102_00003
	goto _0366

	.balign 4, 0
_009C:
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_00E4:
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	EmoteExclamationMark
	EndMovement

scr_seq_D24R0102_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	compare VAR_UNOWN_REPORT_LEVEL, 8
	goto_if_eq _033C
	compare VAR_UNOWN_REPORT_LEVEL, 7
	goto_if_eq _02C4
	compare VAR_UNOWN_REPORT_LEVEL, 4
	goto_if_ge _0277
	scrcmd_545 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _02DB
	check_seen_all_letter_unown VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0223
	compare VAR_UNK_40EC, 4
	goto_if_eq _01F6
	compare VAR_UNK_40EC, 3
	goto_if_eq _01D6
	compare VAR_UNK_40EC, 2
	goto_if_eq _01C3
	compare VAR_UNK_40EC, 1
	goto_if_eq _01BA
_01B1:
	npc_msg msg_0073_D24R0102_00004
	goto _0366

_01BA:
	npc_msg msg_0073_D24R0102_00005
	goto _0366

_01C3:
	compare VAR_UNOWN_REPORT_LEVEL, 1
	goto_if_eq _035D
	goto _02FA

_01D6:
	compare VAR_UNOWN_REPORT_LEVEL, 2
	goto_if_eq _035D
	compare VAR_UNOWN_REPORT_LEVEL, 1
	goto_if_eq _0303
	goto _02FA

_01F6:
	compare VAR_UNOWN_REPORT_LEVEL, 3
	goto_if_eq _035D
	compare VAR_UNOWN_REPORT_LEVEL, 2
	goto_if_eq _030C
	compare VAR_UNOWN_REPORT_LEVEL, 1
	goto_if_eq _0303
	goto _02FA

_0223:
	compare VAR_UNK_40EC, 0
	goto_if_eq _01B1
	compare VAR_UNK_40EC, 1
	goto_if_eq _01BA
	compare VAR_UNOWN_REPORT_LEVEL, 4
	goto_if_eq _035D
	compare VAR_UNOWN_REPORT_LEVEL, 3
	goto_if_eq _0315
	compare VAR_UNOWN_REPORT_LEVEL, 2
	goto_if_eq _030C
	compare VAR_UNOWN_REPORT_LEVEL, 1
	goto_if_eq _0303
	goto _02FA

_0277:
	compare VAR_UNOWN_REPORT_LEVEL, 6
	goto_if_eq _035D
	compare VAR_UNK_40F1, 4
	goto_if_eq _02B1
	compare VAR_UNOWN_REPORT_LEVEL, 5
	goto_if_eq _035D
	compare VAR_UNK_40F1, 1
	goto_if_ge _0321
	goto _035D

_02B1:
	compare VAR_UNOWN_REPORT_LEVEL, 5
	goto_if_eq _032A
	goto _0321

_02C4:
	scrcmd_545 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 28
	goto_if_eq _0333
	goto _035D

_02DB:
	compare VAR_UNK_40EC, 1
	goto_if_eq _02F1
	npc_msg msg_0073_D24R0102_00004
	goto _0366

_02F1:
	npc_msg msg_0073_D24R0102_00009
	goto _0366

_02FA:
	npc_msg msg_0073_D24R0102_00006
	goto _0345

_0303:
	npc_msg msg_0073_D24R0102_00007
	goto _0345

_030C:
	npc_msg msg_0073_D24R0102_00008
	goto _0345

_0315:
	npc_msg msg_0073_D24R0102_00010
	npc_msg msg_0073_D24R0102_00011
	goto _0345

_0321:
	npc_msg msg_0073_D24R0102_00012
	goto _0345

_032A:
	npc_msg msg_0073_D24R0102_00013
	goto _0345

_0333:
	npc_msg msg_0073_D24R0102_00014
	goto _0345

_033C:
	npc_msg msg_0073_D24R0102_00017
	goto _0366

_0345:
	buffer_players_name 0
	npc_msg msg_0073_D24R0102_00016
	play_fanfare SEQ_ME_LVUP
	wait_fanfare
	addvar VAR_UNOWN_REPORT_LEVEL, 1
	goto _0366

_035D:
	npc_msg msg_0073_D24R0102_00015
	goto _0366

_0366:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_D24R0102_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_seen_all_letter_unown VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _03AA
	scrcmd_545 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _03A1
	npc_msg msg_0073_D24R0102_00019
	goto _0366

_03A1:
	npc_msg msg_0073_D24R0102_00018
	goto _0366

_03AA:
	npc_msg msg_0073_D24R0102_00020
	goto _0366

scr_seq_D24R0102_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	compare VAR_UNOWN_REPORT_LEVEL, 7
	goto_if_ge _03EB
	check_seen_all_letter_unown VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _03E2
	npc_msg msg_0073_D24R0102_00021
	goto _0366

_03E2:
	npc_msg msg_0073_D24R0102_00022
	goto _0366

_03EB:
	npc_msg msg_0073_D24R0102_00023
	goto _0366

scr_seq_D24R0102_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0073_D24R0102_00024
	goto _0366
	.balign 4, 0
