#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D35R0101.h"
#include "msgdata/msg/msg_0111_D35R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D35R0101_000
	scrdef scr_seq_D35R0101_001
	scrdef scr_seq_D35R0101_002
	scrdef scr_seq_D35R0101_003
	scrdef scr_seq_D35R0101_004
	scrdef scr_seq_D35R0101_005
	scrdef scr_seq_D35R0101_006
	scrdef scr_seq_D35R0101_007
	scrdef scr_seq_D35R0101_008
	scrdef scr_seq_D35R0101_009
	scrdef_end

scr_seq_D35R0101_001:
	scrcmd_375 obj_D35R0101_stop
	scrcmd_375 obj_D35R0101_stop_2
	scrcmd_375 obj_D35R0101_stop_3
	compare VAR_UNK_40AC, 9
	goto_if_ge _00B7
	compare VAR_UNK_40A8, 2
	goto_if_ge _006D
	compare VAR_UNK_40A8, 1
	goto_if_eq _005F
	end

_005F:
	move_person_facing obj_D35R0101_gsfighter, 8, 0, 7, DIR_WEST
	end

_006D:
	move_person_facing obj_D35R0101_gsfighter, 10, 0, 7, DIR_WEST
	move_person_facing obj_D35R0101_sunglasses, 4, 0, 3, DIR_SOUTH
	move_person_facing obj_D35R0101_babyboy1_10, 9, 0, 3, DIR_SOUTH
	move_person_facing obj_D35R0101_stop, 8, 0, 3, DIR_SOUTH
	move_person_facing obj_D35R0101_stop_2, 9, 0, 4, DIR_SOUTH
	move_person_facing obj_D35R0101_stop_3, 8, 0, 4, DIR_SOUTH
	end

_00B7:
	move_person_facing obj_D35R0101_babyboy1_10, 9, 0, 3, DIR_SOUTH
	move_person_facing obj_D35R0101_stop, 8, 0, 3, DIR_SOUTH
	move_person_facing obj_D35R0101_stop_2, 9, 0, 4, DIR_SOUTH
	move_person_facing obj_D35R0101_stop_3, 8, 0, 4, DIR_SOUTH
	end

scr_seq_D35R0101_008:
	compare VAR_UNK_40AC, 3
	goto_if_eq _010F
	compare VAR_UNK_40AC, 8
	goto_if_eq _0105
	end

_0105:
	setflag FLAG_UNK_1E5
	setflag FLAG_HIDE_ROCKET_HIDEOUT_B2F_ARIANA
	end

_010F:
	clearflag FLAG_HIDE_ROCKET_HIDEOUT_B3F_GIOVANNI
	setflag FLAG_HIDE_ROCKET_HIDEOUT_B3F_PETREL
	end

scr_seq_D35R0101_006:
	scrcmd_081 0
	play_bgm SEQ_GS_D_AJITO
	scrcmd_609
	lockall
	apply_movement obj_player, _0214
	wait_movement
	npc_msg msg_0111_D35R0101_00004
	closemsg
	play_se SEQ_SE_GS_ZUTUKI
	apply_movement obj_D35R0101_tsure_poke_static_dragonite, _02AC
	wait_se SEQ_SE_GS_PRESSHIT
	apply_movement obj_D35R0101_gsfighter, _021C
	wait_movement
	apply_movement obj_D35R0101_wataru, _022C
	apply_movement obj_D35R0101_tsure_poke_static_dragonite, _02C0
	wait_movement
	buffer_players_name 0
	gender_msgbox msg_0111_D35R0101_00005, msg_0111_D35R0101_00006
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_D35R0101_wataru, _0240
	apply_movement obj_player, _025C
	apply_movement obj_D35R0101_tsure_poke_static_dragonite, _02CC
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	apply_movement obj_D35R0101_sunglasses, _0268
	wait_movement
	apply_movement obj_D35R0101_wataru, _0280
	wait_movement
	npc_msg msg_0111_D35R0101_00007
	closemsg
	apply_movement obj_D35R0101_sunglasses, _0290
	wait_movement
	play_se SEQ_SE_DP_UG_023
	apply_movement obj_D35R0101_babyboy1_10, _029C
	apply_movement obj_D35R0101_stop, _029C
	apply_movement obj_D35R0101_stop_2, _029C
	apply_movement obj_D35R0101_stop_3, _029C
	wait_movement
	buffer_players_name 0
	gender_msgbox msg_0111_D35R0101_00008, msg_0111_D35R0101_00009
	closemsg
	apply_movement obj_D35R0101_wataru, _02A4
	wait_movement
	hide_person obj_D35R0101_wataru
	apply_movement obj_D35R0101_tsure_poke_static_dragonite, _02DC
	wait_movement
	hide_person obj_D35R0101_tsure_poke_static_dragonite
	setflag FLAG_HIDE_MAHOGANY_SHOP_LANCE
	setvar VAR_UNK_40A8, 2
	releaseall
	end
	.byte 0x00

_0214:
	step 75, 1
	step_end

_021C:
	step 71, 1
	step 23, 2
	step 72, 1
	step_end

_022C:
	step 63, 3
	step 1, 2
	step 13, 1
	step 63, 5
	step_end

_0240:
	step 0, 2
	step 12, 4
	step 3, 2
	step 15, 1
	step 0, 2
	step 63, 5
	step_end

_025C:
	step 63, 1
	step 12, 4
	step_end

_0268:
	step 75, 1
	step 63, 1
	step 71, 1
	step 22, 2
	step 72, 1
	step_end

_0280:
	step 12, 1
	step 3, 2
	step 63, 2
	step_end

_0290:
	step 3, 2
	step 75, 1
	step_end

_029C:
	step 15, 1
	step_end

_02A4:
	step 15, 1
	step_end

_02AC:
	step 23, 2
	step 71, 1
	step 22, 2
	step 72, 1
	step_end

_02C0:
	step 63, 3
	step 1, 2
	step_end

_02CC:
	step 63, 3
	step 0, 2
	step 12, 2
	step_end

_02DC:
	step 63, 3
	step 12, 2
	step 3, 2
	step 15, 1
	step_end
scr_seq_D35R0101_000:
	end

scr_seq_D35R0101_007:
	end

scr_seq_D35R0101_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	compare VAR_UNK_40A8, 2
	goto_if_ge _031C
	npc_msg msg_0111_D35R0101_00000
	holdmsg
	setvar VAR_SPECIAL_x8004, 28
	callstd std_special_mart
	releaseall
	end

_031C:
	npc_msg msg_0111_D35R0101_00001
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_D35R0101_003:
	compare VAR_UNK_40A8, 2
	goto_if_ge _0347
	simple_npc_msg msg_0111_D35R0101_00002
	end

_0347:
	simple_npc_msg msg_0111_D35R0101_00003
	end

scr_seq_D35R0101_005:
	end

scr_seq_D35R0101_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setflag FLAG_SPECIAL_MART_MAHOGANY_GOOD
	npc_msg msg_0111_D35R0101_00010
	holdmsg
	setvar VAR_SPECIAL_x8004, 29
	callstd std_special_mart
	clearflag FLAG_SPECIAL_MART_MAHOGANY_GOOD
	releaseall
	end

scr_seq_D35R0101_009:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	compare VAR_UNK_40AC, 10
	goto_if_ge _039D
	npc_msg msg_0111_D35R0101_00015
	goto _0552

_039D:
	compare VAR_SCENE_ROCKET_TAKEOVER, 2
	goto_if_ne _03B3
	npc_msg msg_0111_D35R0101_00014
	goto _03E5

_03B3:
	compare VAR_SCENE_ROCKET_TAKEOVER, 3
	goto_if_ne _03C9
	npc_msg msg_0111_D35R0101_00014
	goto _03E5

_03C9:
	compare VAR_SCENE_ROCKET_TAKEOVER, 4
	goto_if_ne _03DF
	npc_msg msg_0111_D35R0101_00014
	goto _03E5

_03DF:
	goto _03EB

_03E5:
	goto _0552

_03EB:
	scrcmd_522 VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 0
	goto_if_ne _0405
	npc_msg msg_0111_D35R0101_00011
	goto _0552

_0405:
	compare VAR_TEMP_x4000, 1
	goto_if_ne _041B
	npc_msg msg_0111_D35R0101_00012
	goto _0552

_041B:
	compare VAR_TEMP_x4000, 3
	goto_if_ne _0431
	npc_msg msg_0111_D35R0101_00011
	goto _0552

_0431:
	compare VAR_TEMP_x4000, 4
	goto_if_ne _0447
	npc_msg msg_0111_D35R0101_00012
	goto _0552

_0447:
	compare VAR_TEMP_x4000, 6
	goto_if_ne _045D
	npc_msg msg_0111_D35R0101_00011
	goto _0552

_045D:
	compare VAR_TEMP_x4000, 7
	goto_if_ne _0473
	npc_msg msg_0111_D35R0101_00012
	goto _0552

_0473:
	compare VAR_TEMP_x4000, 9
	goto_if_ne _0489
	npc_msg msg_0111_D35R0101_00011
	goto _0552

_0489:
	compare VAR_TEMP_x4000, 10
	goto_if_ne _049F
	npc_msg msg_0111_D35R0101_00012
	goto _0552

_049F:
	compare VAR_TEMP_x4000, 12
	goto_if_ne _04B5
	npc_msg msg_0111_D35R0101_00011
	goto _0552

_04B5:
	compare VAR_TEMP_x4000, 13
	goto_if_ne _04CB
	npc_msg msg_0111_D35R0101_00012
	goto _0552

_04CB:
	compare VAR_TEMP_x4000, 15
	goto_if_ne _04E1
	npc_msg msg_0111_D35R0101_00011
	goto _0552

_04E1:
	compare VAR_TEMP_x4000, 16
	goto_if_ne _04F7
	npc_msg msg_0111_D35R0101_00012
	goto _0552

_04F7:
	compare VAR_TEMP_x4000, 18
	goto_if_ne _050D
	npc_msg msg_0111_D35R0101_00011
	goto _0552

_050D:
	compare VAR_TEMP_x4000, 19
	goto_if_ne _0523
	npc_msg msg_0111_D35R0101_00012
	goto _0552

_0523:
	compare VAR_TEMP_x4000, 21
	goto_if_ne _0539
	npc_msg msg_0111_D35R0101_00011
	goto _0552

_0539:
	compare VAR_TEMP_x4000, 22
	goto_if_ne _054F
	npc_msg msg_0111_D35R0101_00012
	goto _0552

_054F:
	npc_msg msg_0111_D35R0101_00013
_0552:
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
