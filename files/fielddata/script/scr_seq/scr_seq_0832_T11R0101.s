#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T11R0101.h"
#include "msgdata/msg/msg_0533_T11R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T11R0101_000
	scrdef scr_seq_T11R0101_001
	scrdef scr_seq_T11R0101_002
	scrdef scr_seq_T11R0101_003
	scrdef scr_seq_T11R0101_004
	scrdef scr_seq_T11R0101_005
	scrdef scr_seq_T11R0101_006
	scrdef scr_seq_T11R0101_007
	scrdef scr_seq_T11R0101_008
	scrdef scr_seq_T11R0101_009
	scrdef scr_seq_T11R0101_010
	scrdef scr_seq_T11R0101_011
	scrdef scr_seq_T11R0101_012
	scrdef scr_seq_T11R0101_013
	scrdef scr_seq_T11R0101_014
	scrdef scr_seq_T11R0101_015
	scrdef scr_seq_T11R0101_016
	scrdef scr_seq_T11R0101_017
	scrdef scr_seq_T11R0101_018
	scrdef scr_seq_T11R0101_019
	scrdef_end

scr_seq_T11R0101_003:
	get_phone_book_rematch PHONE_CONTACT_WHITNEY, VAR_TEMP_x4000
	get_phone_book_rematch PHONE_CONTACT_JANINE, VAR_TEMP_x4001
	get_phone_book_rematch PHONE_CONTACT_CLAIR, VAR_TEMP_x4002
	get_phone_book_rematch PHONE_CONTACT_ERIKA, VAR_TEMP_x4003
	get_phone_book_rematch PHONE_CONTACT_MISTY, VAR_TEMP_x4004
	get_phone_book_rematch PHONE_CONTACT_BLAINE, VAR_TEMP_x4005
	get_phone_book_rematch PHONE_CONTACT_BLUE, VAR_TEMP_x4006
	get_phone_book_rematch PHONE_CONTACT_CHUCK, VAR_TEMP_x4007
	get_phone_book_rematch PHONE_CONTACT_BROCK, VAR_TEMP_x4008
	get_phone_book_rematch PHONE_CONTACT_BUGSY, VAR_TEMP_x4009
	get_phone_book_rematch PHONE_CONTACT_SABRINA, VAR_TEMP_x400A
	get_phone_book_rematch PHONE_CONTACT_FALKNER, VAR_TEMP_x400B
	get_phone_book_rematch PHONE_CONTACT_LT__SURGE, VAR_TEMP_x400C
	get_phone_book_rematch PHONE_CONTACT_MORTY, VAR_TEMP_x400D
	get_phone_book_rematch PHONE_CONTACT_JASMINE, VAR_TEMP_x400E
	get_phone_book_rematch PHONE_CONTACT_PRYCE, VAR_TEMP_x400F
	compare VAR_TEMP_x4003, 0
	goto_if_ne _00C9
	setflag FLAG_UNK_2B8
	goto _00CD

_00C9:
	clearflag FLAG_UNK_2B8
_00CD:
	compare VAR_TEMP_x4000, 0
	goto_if_ne _00E4
	setflag FLAG_UNK_2B5
	goto _00E8

_00E4:
	clearflag FLAG_UNK_2B5
_00E8:
	compare VAR_TEMP_x4001, 0
	goto_if_ne _00FF
	setflag FLAG_UNK_2B6
	goto _0103

_00FF:
	clearflag FLAG_UNK_2B6
_0103:
	compare VAR_TEMP_x4002, 0
	goto_if_ne _011A
	setflag FLAG_UNK_2B7
	goto _011E

_011A:
	clearflag FLAG_UNK_2B7
_011E:
	compare VAR_TEMP_x4004, 0
	goto_if_ne _0135
	setflag FLAG_UNK_2B9
	goto _0139

_0135:
	clearflag FLAG_UNK_2B9
_0139:
	compare VAR_TEMP_x4005, 0
	goto_if_ne _0150
	setflag FLAG_UNK_2BA
	goto _0154

_0150:
	clearflag FLAG_UNK_2BA
_0154:
	compare VAR_TEMP_x4006, 0
	goto_if_ne _016B
	setflag FLAG_UNK_2BB
	goto _016F

_016B:
	clearflag FLAG_UNK_2BB
_016F:
	compare VAR_TEMP_x4007, 0
	goto_if_ne _0186
	setflag FLAG_UNK_2BC
	goto _018A

_0186:
	clearflag FLAG_UNK_2BC
_018A:
	compare VAR_TEMP_x4008, 0
	goto_if_ne _01A1
	setflag FLAG_UNK_2BD
	goto _01A5

_01A1:
	clearflag FLAG_UNK_2BD
_01A5:
	compare VAR_TEMP_x4009, 0
	goto_if_ne _01BC
	setflag FLAG_UNK_2BE
	goto _01C0

_01BC:
	clearflag FLAG_UNK_2BE
_01C0:
	compare VAR_TEMP_x400A, 0
	goto_if_ne _01D7
	setflag FLAG_UNK_2BF
	goto _01DB

_01D7:
	clearflag FLAG_UNK_2BF
_01DB:
	compare VAR_TEMP_x400B, 0
	goto_if_ne _01F2
	setflag FLAG_UNK_2C0
	goto _01F6

_01F2:
	clearflag FLAG_UNK_2C0
_01F6:
	compare VAR_TEMP_x400C, 0
	goto_if_ne _020D
	setflag FLAG_UNK_2C1
	goto _0211

_020D:
	clearflag FLAG_UNK_2C1
_0211:
	compare VAR_TEMP_x400D, 0
	goto_if_ne _0228
	setflag FLAG_UNK_2C2
	goto _022C

_0228:
	clearflag FLAG_UNK_2C2
_022C:
	compare VAR_TEMP_x400E, 0
	goto_if_ne _0243
	setflag FLAG_UNK_2C3
	goto _0247

_0243:
	clearflag FLAG_UNK_2C3
_0247:
	compare VAR_TEMP_x400F, 0
	goto_if_ne _025E
	setflag FLAG_UNK_2C4
	goto _0262

_025E:
	clearflag FLAG_UNK_2C4
_0262:
	end

scr_seq_T11R0101_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0533_T11R0101_00008
	closemsg
	trainer_battle TRAINER_LEADER_WHITNEY_2, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _02C1
	npc_msg msg_0533_T11R0101_00009
	wait_button_or_walk_away
	closemsg
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	scrcmd_462 17
	setflag FLAG_UNK_2B5
	hide_person obj_T11R0101_gsleader3
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	releaseall
	end

_02C1:
	white_out
	releaseall
	end

scr_seq_T11R0101_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0533_T11R0101_00030
	closemsg
	trainer_battle TRAINER_LEADER_JANINE_JANINE_2, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0324
	npc_msg msg_0533_T11R0101_00031
	wait_button_or_walk_away
	closemsg
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	scrcmd_462 26
	setflag FLAG_UNK_2B6
	hide_person obj_T11R0101_gsleader13
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	releaseall
	end

_0324:
	white_out
	releaseall
	end

scr_seq_T11R0101_006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0533_T11R0101_00018
	closemsg
	trainer_battle TRAINER_LEADER_CLAIR_CLAIR_2, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0387
	npc_msg msg_0533_T11R0101_00019
	wait_button_or_walk_away
	closemsg
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	scrcmd_462 27
	setflag FLAG_UNK_2B7
	hide_person obj_T11R0101_gsleader8
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	releaseall
	end

_0387:
	white_out
	releaseall
	end

scr_seq_T11R0101_007:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0533_T11R0101_00024
	closemsg
	trainer_battle TRAINER_LEADER_ERIKA_ERIKA_2, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _03EA
	npc_msg msg_0533_T11R0101_00025
	wait_button_or_walk_away
	closemsg
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	scrcmd_462 28
	setflag FLAG_UNK_2B8
	hide_person obj_T11R0101_gsleader12
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	releaseall
	end

_03EA:
	white_out
	releaseall
	end

scr_seq_T11R0101_008:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0533_T11R0101_00026
	closemsg
	trainer_battle TRAINER_LEADER_MISTY_MISTY_2, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _044D
	npc_msg msg_0533_T11R0101_00027
	wait_button_or_walk_away
	closemsg
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	scrcmd_462 29
	setflag FLAG_UNK_2B9
	hide_person obj_T11R0101_gsleader11
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	releaseall
	end

_044D:
	white_out
	releaseall
	end

scr_seq_T11R0101_009:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0533_T11R0101_00032
	closemsg
	trainer_battle TRAINER_LEADER_BLAINE_BLAINE_2, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _04B0
	npc_msg msg_0533_T11R0101_00033
	wait_button_or_walk_away
	closemsg
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	scrcmd_462 30
	setflag FLAG_UNK_2BA
	hide_person obj_T11R0101_gsleader15
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	releaseall
	end

_04B0:
	white_out
	releaseall
	end

scr_seq_T11R0101_010:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0533_T11R0101_00034
	closemsg
	trainer_battle TRAINER_LEADER_BLUE_BLUE_2, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0513
	npc_msg msg_0533_T11R0101_00035
	wait_button_or_walk_away
	closemsg
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	scrcmd_462 31
	setflag FLAG_UNK_2BB
	hide_person obj_T11R0101_gsleader16
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	releaseall
	end

_0513:
	white_out
	releaseall
	end

scr_seq_T11R0101_011:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0533_T11R0101_00010
	closemsg
	trainer_battle TRAINER_LEADER_CHUCK_CHUCK_2, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0576
	npc_msg msg_0533_T11R0101_00011
	wait_button_or_walk_away
	closemsg
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	scrcmd_462 32
	setflag FLAG_UNK_2BC
	hide_person obj_T11R0101_gsleader5
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	releaseall
	end

_0576:
	white_out
	releaseall
	end

scr_seq_T11R0101_012:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0533_T11R0101_00028
	closemsg
	trainer_battle TRAINER_LEADER_BROCK_BROCK_2, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _05D9
	npc_msg msg_0533_T11R0101_00029
	wait_button_or_walk_away
	closemsg
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	scrcmd_462 33
	setflag FLAG_UNK_2BD
	hide_person obj_T11R0101_gsleader14
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	releaseall
	end

_05D9:
	white_out
	releaseall
	end

scr_seq_T11R0101_013:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0533_T11R0101_00006
	closemsg
	trainer_battle TRAINER_LEADER_BUGSY_BUGSY_2, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _063C
	npc_msg msg_0533_T11R0101_00007
	wait_button_or_walk_away
	closemsg
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	scrcmd_462 34
	setflag FLAG_UNK_2BE
	hide_person obj_T11R0101_gsleader2
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	releaseall
	end

_063C:
	white_out
	releaseall
	end

scr_seq_T11R0101_014:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0533_T11R0101_00022
	closemsg
	trainer_battle TRAINER_LEADER_SABRINA_SABRINA_2, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _069F
	npc_msg msg_0533_T11R0101_00023
	wait_button_or_walk_away
	closemsg
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	scrcmd_462 35
	setflag FLAG_UNK_2BF
	hide_person obj_T11R0101_gsleader10
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	releaseall
	end

_069F:
	white_out
	releaseall
	end

scr_seq_T11R0101_015:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0533_T11R0101_00004
	closemsg
	trainer_battle TRAINER_LEADER_FALKNER_FALKNER_2, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0702
	npc_msg msg_0533_T11R0101_00005
	wait_button_or_walk_away
	closemsg
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	scrcmd_462 18
	setflag FLAG_UNK_2C0
	hide_person obj_T11R0101_gsleader1
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	releaseall
	end

_0702:
	white_out
	releaseall
	end

scr_seq_T11R0101_016:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0533_T11R0101_00020
	closemsg
	trainer_battle TRAINER_LEADER_LT_SURGE_LT__SURGE_2, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0765
	npc_msg msg_0533_T11R0101_00021
	wait_button_or_walk_away
	closemsg
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	scrcmd_462 36
	setflag FLAG_UNK_2C1
	hide_person obj_T11R0101_gsleader9
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	releaseall
	end

_0765:
	white_out
	releaseall
	end

scr_seq_T11R0101_017:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0533_T11R0101_00014
	closemsg
	trainer_battle TRAINER_LEADER_MORTY_MORTY_2, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _07C8
	npc_msg msg_0533_T11R0101_00015
	wait_button_or_walk_away
	closemsg
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	scrcmd_462 37
	setflag FLAG_UNK_2C2
	hide_person obj_T11R0101_gsleader4
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	releaseall
	end

_07C8:
	white_out
	releaseall
	end

scr_seq_T11R0101_018:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0533_T11R0101_00012
	closemsg
	trainer_battle TRAINER_LEADER_JASMINE_JASMINE_2, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _082B
	npc_msg msg_0533_T11R0101_00013
	wait_button_or_walk_away
	closemsg
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	scrcmd_462 38
	setflag FLAG_UNK_2C3
	hide_person obj_T11R0101_gsleader6
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	releaseall
	end

_082B:
	white_out
	releaseall
	end

scr_seq_T11R0101_019:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0533_T11R0101_00016
	closemsg
	trainer_battle TRAINER_LEADER_PRYCE_PRYCE_2, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _088E
	npc_msg msg_0533_T11R0101_00017
	wait_button_or_walk_away
	closemsg
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	scrcmd_462 39
	setflag FLAG_UNK_2C4
	hide_person obj_T11R0101_gsleader7
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	releaseall
	end

_088E:
	white_out
	releaseall
	end

scr_seq_T11R0101_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_BEAT_KARATE_KING, _08B2
	npc_msg msg_0533_T11R0101_00000
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_08B2:
	npc_msg msg_0533_T11R0101_00001
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T11R0101_001:
	simple_npc_msg msg_0533_T11R0101_00002
	end

scr_seq_T11R0101_002:
	simple_npc_msg msg_0533_T11R0101_00003
	end
	.balign 4, 0
