#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D23R0106.h"
#include "msgdata/msg/msg_0070_D23R0106.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D23R0106_000
	scrdef scr_seq_D23R0106_001
	scrdef_end

scr_seq_D23R0106_000:
	setflag FLAG_HIDE_ROCKET_TAKEOVER_1
	setflag FLAG_HIDE_ROCKET_TAKEOVER_2
	setvar VAR_UNK_4125, 0
	compare VAR_SCENE_ROCKET_TAKEOVER, 4
	goto_if_ne _002D
	clearflag FLAG_HIDE_ROCKET_TAKEOVER_1
	clearflag FLAG_HIDE_ROCKET_TAKEOVER_2
_002D:
	end

scr_seq_D23R0106_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0070_D23R0106_00000
	closemsg
	trainer_battle TRAINER_EXECUTIVE_ARCHER_ARCHER, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _025D
	npc_msg msg_0070_D23R0106_00001
	closemsg
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	hide_person obj_D23R0106_rkanbum
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	clearflag FLAG_ROCKET_TAKEOVER_ACTIVE
	fade_out_bgm 0, 30
	scrcmd_081 0
	wait 15, VAR_SPECIAL_RESULT
	reset_bgm
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	move_person_facing obj_D23R0106_gsgentleman, 8, 1, 12, DIR_SOUTH
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4000, 7
	goto_if_ne _00C1
	apply_movement obj_D23R0106_gsgentleman, _0288
	goto _0102

_00C1:
	compare VAR_TEMP_x4000, 8
	goto_if_ne _00ED
	apply_movement obj_D23R0106_gsgentleman, _02A4
	scrcmd_729 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	call_if_eq _0263
	goto _0102

_00ED:
	compare VAR_TEMP_x4000, 9
	goto_if_ne _0102
	apply_movement obj_D23R0106_gsgentleman, _02C0
_0102:
	wait_movement
	compare VAR_TEMP_x4000, 8
	goto_if_ne _0119
	apply_movement obj_player, _02EC
_0119:
	wait_movement
	npc_msg msg_0070_D23R0106_00002
	get_game_version VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 7
	goto_if_ne _014E
	giveitem_no_check ITEM_RAINBOW_WING, 1
	setflag FLAG_UNK_093
	npc_msg msg_0070_D23R0106_00005
	closemsg
	goto _0167

_014E:
	giveitem_no_check ITEM_SILVER_WING, 1
	setflag FLAG_UNK_094
	npc_msg msg_0070_D23R0106_00006
	closemsg
_0167:
	compare VAR_TEMP_x4000, 7
	goto_if_ne _0182
	apply_movement obj_D23R0106_gsgentleman, _02F4
	goto _01B2

_0182:
	compare VAR_TEMP_x4000, 8
	goto_if_ne _019D
	apply_movement obj_D23R0106_gsgentleman, _0304
	goto _01B2

_019D:
	compare VAR_TEMP_x4000, 9
	goto_if_ne _01B2
	apply_movement obj_D23R0106_gsgentleman, _0314
_01B2:
	wait_movement
	apply_movement obj_D23R0106_gsgentleman, _0324
	wait_movement
	apply_movement obj_player, _02EC
	wait_movement
	get_game_version VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 7
	goto_if_ne _01E2
	npc_msg msg_0070_D23R0106_00007
	goto _01E5

_01E2:
	npc_msg msg_0070_D23R0106_00008
_01E5:
	closemsg
	apply_movement obj_D23R0106_gsgentleman, _032C
	wait_movement
	npc_msg msg_0070_D23R0106_00009
	closemsg
	apply_movement obj_D23R0106_gsgentleman, _0344
	wait_movement
	play_se SEQ_SE_DP_DOOR10
	wait_se SEQ_SE_DP_DOOR10
	wait 8, VAR_SPECIAL_RESULT
	hide_person obj_D23R0106_gsgentleman
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	releaseall
	setvar VAR_SCENE_ROCKET_TAKEOVER, 5
	setflag FLAG_BEAT_RADIO_TOWER_ROCKETS
	clearflag FLAG_HIDE_RADIO_TOWER_5F_OFFICE_DIRECTOR
	setflag FLAG_HIDE_RADIO_TOWER_5F_PETREL_REVEALED
	compare VAR_UNK_40F8, 2
	goto_if_ne _0241
	setvar VAR_UNK_40F8, 0
_0241:
	setvar VAR_UNK_407A, 1
	clearflag FLAG_HIDE_MAHOGANY_SHOP_SALESWOMAN
	setflag FLAG_HIDE_BLACKTHORN_GYM_GUARD_INFRONT
	clearflag FLAG_HIDE_BLACKTHORN_GYM_GUARD_ASIDE
	setflag FLAG_UNK_998
	setflag FLAG_UNK_97D
	end

_025D:
	white_out
	releaseall
	end

_0263:
	get_person_coords 253, VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	compare VAR_SPECIAL_x8004, 7
	goto_if_ne _0286
	wait 112, VAR_SPECIAL_RESULT
	apply_movement obj_partner_poke, _02DC
_0286:
	return


_0288:
	step 13, 1
	step 14, 4
	step 12, 7
	step 15, 4
	step 12, 3
	step 34, 1
	step_end

_02A4:
	step 13, 1
	step 14, 4
	step 12, 7
	step 15, 3
	step 12, 2
	step 35, 1
	step_end

_02C0:
	step 13, 1
	step 14, 4
	step 12, 7
	step 15, 4
	step 12, 3
	step 35, 1
	step_end

_02DC:
	step 12, 1
	step 15, 1
	step 33, 1
	step_end

_02EC:
	step 34, 1
	step_end

_02F4:
	step 13, 3
	step 14, 4
	step 75, 1
	step_end

_0304:
	step 13, 2
	step 14, 3
	step 75, 1
	step_end

_0314:
	step 13, 3
	step 14, 4
	step 75, 1
	step_end

_0324:
	step 15, 1
	step_end

_032C:
	step 14, 1
	step 13, 1
	step 75, 1
	step 63, 3
	step 32, 1
	step_end

_0344:
	step 13, 6
	step 15, 4
	step_end
	.balign 4, 0
