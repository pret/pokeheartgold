#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R22R0101.h"
#include "msgdata/msg/msg_0361_R22R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R22R0101_000
	scrdef scr_seq_R22R0101_001
	scrdef scr_seq_R22R0101_002
	scrdef scr_seq_R22R0101_003
	scrdef scr_seq_R22R0101_004
	scrdef scr_seq_R22R0101_005
	scrdef scr_seq_R22R0101_006
	scrdef scr_seq_R22R0101_007
	scrdef scr_seq_R22R0101_008
	scrdef_end

scr_seq_R22R0101_006:
	goto_if_unset FLAG_UNLOCKED_WEST_KANTO, _003D
	move_person_facing obj_R22R0101_policeman_3, 15, 0, 8, DIR_SOUTH
_003D:
	goto_if_unset FLAG_UNLOCKED_MT_SILVER, _0054
	move_person_facing obj_R22R0101_policeman_2, 7, 0, 8, DIR_SOUTH
_0054:
	end

scr_seq_R22R0101_007:
	setflag FLAG_SYS_FLYPOINT_VICTORY_ROAD
	goto_if_unset FLAG_UNK_189, _006B
	clearflag FLAG_UNK_189
	end

_006B:
	check_registered_phone_number PHONE_CONTACT_JANINE, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 1
	goto_if_eq _00DF
	check_badge BADGE_SOUL, VAR_TEMP_x4002
	compare VAR_TEMP_x4002, 0
	goto_if_ne _009D
	goto _012C
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
_009D:
	goto _00A5
	.byte 0x02, 0x00
_00A5:
	scrcmd_522 VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 16
	goto_if_ne _00C0
	clearflag FLAG_UNK_270
	goto _00DD

_00C0:
	compare VAR_TEMP_x4000, 17
	goto_if_ne _00D7
	clearflag FLAG_UNK_270
	goto _00DD

_00D7:
	goto _012C

_00DD:
	end

_00DF:
	get_phone_book_rematch PHONE_CONTACT_JANINE, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 0
	goto_if_ne _012C
	scrcmd_522 VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 18
	goto_if_ne _010D
	clearflag FLAG_UNK_270
	goto _012A

_010D:
	compare VAR_TEMP_x4000, 19
	goto_if_ne _0124
	clearflag FLAG_UNK_270
	goto _012A

_0124:
	goto _012C

_012A:
	end

_012C:
	setflag FLAG_UNK_270
	end

scr_seq_R22R0101_000:
	scrcmd_609
	lockall
	apply_movement obj_R22R0101_policeman, _015C
	wait_movement
	apply_movement obj_player, _0164
	wait_movement
	npc_msg msg_0361_R22R0101_00000
	wait_button_or_walk_away
	closemsg
	setvar VAR_UNK_4110, 1
	releaseall
	end
	.byte 0x00

_015C:
	step 75, 1
	step_end

_0164:
	step 34, 1
	step_end
scr_seq_R22R0101_003:
	simple_npc_msg msg_0361_R22R0101_00000
	end

scr_seq_R22R0101_001:
	scrcmd_609
	lockall
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 8
	goto_if_ne _01A4
	apply_movement obj_R22R0101_policeman_3, _0264
	goto _01AC

_01A4:
	apply_movement obj_R22R0101_policeman_3, _0270
_01AC:
	wait_movement
	compare VAR_TEMP_x4001, 8
	goto_if_ne _01C9
	apply_movement obj_R22R0101_policeman_3, _027C
	goto _01EC

_01C9:
	compare VAR_TEMP_x4001, 10
	goto_if_ne _01E4
	apply_movement obj_R22R0101_policeman_3, _028C
	goto _01EC

_01E4:
	apply_movement obj_R22R0101_policeman_3, _029C
_01EC:
	wait_movement
	npc_msg msg_0361_R22R0101_00005
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 56
	apply_movement obj_R22R0101_policeman_3, _02AC
	apply_movement obj_player, _02B4
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	wait 16, VAR_SPECIAL_RESULT
	compare VAR_TEMP_x4001, 8
	goto_if_ne _023A
	apply_movement obj_R22R0101_policeman_3, _02C4
	goto _025D

_023A:
	compare VAR_TEMP_x4001, 10
	goto_if_ne _0255
	apply_movement obj_R22R0101_policeman_3, _02D0
	goto _025D

_0255:
	apply_movement obj_R22R0101_policeman_3, _02DC
_025D:
	wait_movement
	releaseall
	end
	.byte 0x00

_0264:
	step 32, 1
	step 75, 1
	step_end

_0270:
	step 33, 1
	step 75, 1
	step_end

_027C:
	step 19, 1
	step 16, 1
	step 38, 1
	step_end

_028C:
	step 19, 1
	step 17, 1
	step 38, 1
	step_end

_029C:
	step 19, 1
	step 17, 2
	step 38, 1
	step_end

_02AC:
	step 14, 1
	step_end

_02B4:
	step 71, 1
	step 14, 1
	step 72, 1
	step_end

_02C4:
	step 13, 1
	step 34, 1
	step_end

_02D0:
	step 12, 1
	step 34, 1
	step_end

_02DC:
	step 12, 2
	step 34, 1
	step_end
scr_seq_R22R0101_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_UNLOCKED_WEST_KANTO, _0306
	npc_msg msg_0361_R22R0101_00004
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0306:
	npc_msg msg_0361_R22R0101_00006
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_R22R0101_002:
	scrcmd_609
	lockall
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 8
	goto_if_ne _0336
	apply_movement obj_R22R0101_policeman_2, _03F8
	goto _033E

_0336:
	apply_movement obj_R22R0101_policeman_2, _0404
_033E:
	wait_movement
	compare VAR_TEMP_x4001, 8
	goto_if_ne _035B
	apply_movement obj_R22R0101_policeman_2, _0410
	goto _037E

_035B:
	compare VAR_TEMP_x4001, 10
	goto_if_ne _0376
	apply_movement obj_R22R0101_policeman_2, _0420
	goto _037E

_0376:
	apply_movement obj_R22R0101_policeman_2, _0430
_037E:
	wait_movement
	npc_msg msg_0361_R22R0101_00002
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 56
	apply_movement obj_R22R0101_policeman_2, _0440
	apply_movement obj_player, _0448
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	wait 16, VAR_SPECIAL_RESULT
	compare VAR_TEMP_x4001, 8
	goto_if_ne _03CC
	apply_movement obj_R22R0101_policeman_2, _0458
	goto _03EF

_03CC:
	compare VAR_TEMP_x4001, 10
	goto_if_ne _03E7
	apply_movement obj_R22R0101_policeman_2, _0464
	goto _03EF

_03E7:
	apply_movement obj_R22R0101_policeman_2, _0470
_03EF:
	wait_movement
	releaseall
	end
	.byte 0x00, 0x00, 0x00

_03F8:
	step 32, 1
	step 75, 1
	step_end

_0404:
	step 33, 1
	step 75, 1
	step_end

_0410:
	step 18, 1
	step 16, 1
	step 39, 1
	step_end

_0420:
	step 18, 1
	step 17, 1
	step 39, 1
	step_end

_0430:
	step 18, 1
	step 17, 2
	step 39, 1
	step_end

_0440:
	step 15, 1
	step_end

_0448:
	step 71, 1
	step 15, 1
	step 72, 1
	step_end

_0458:
	step 13, 1
	step 35, 1
	step_end

_0464:
	step 12, 1
	step 35, 1
	step_end

_0470:
	step 12, 2
	step 35, 1
	step_end
scr_seq_R22R0101_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_UNLOCKED_MT_SILVER, _049A
	npc_msg msg_0361_R22R0101_00001
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_049A:
	npc_msg msg_0361_R22R0101_00003
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_R22R0101_008:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_registered_phone_number PHONE_CONTACT_JANINE, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 1
	goto_if_eq _0553
	compare VAR_TEMP_x4005, 1
	goto_if_ge _0548
	npc_msg msg_0361_R22R0101_00007
_04D0:
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _04F4
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ge _0537
	end

_04F4:
	buffer_players_name 0
	npc_msg msg_0361_R22R0101_00008
	play_fanfare SEQ_ME_POKEGEAR_REGIST
	wait_fanfare
	register_gear_number PHONE_CONTACT_JANINE
	npc_msg msg_0361_R22R0101_00009
	wait_button_or_walk_away
	closemsg
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	setflag FLAG_UNK_270
	hide_person obj_R22R0101_gsleader13
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	releaseall
	end

_0537:
	setvar VAR_TEMP_x4005, 1
	npc_msg msg_0361_R22R0101_00010
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0548:
	npc_msg msg_0361_R22R0101_00011
	goto _04D0
	.byte 0x02, 0x00
_0553:
	npc_msg msg_0361_R22R0101_00012
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _05B4
	photo_album_is_full VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _05BF
	npc_msg msg_0361_R22R0101_00013
	closemsg
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	cameron_photo 70
	faceplayer
	lockall
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	clearflag FLAG_UNK_189
	npc_msg msg_0361_R22R0101_00014
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_05B4:
	npc_msg msg_0361_R22R0101_00015
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_05BF:
	npc_msg msg_0361_R22R0101_00016
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
