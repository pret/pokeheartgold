#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R35R0201.h"
#include "msgdata/msg/msg_0389_R35R0201.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R35R0201_000
	scrdef scr_seq_R35R0201_001
	scrdef scr_seq_R35R0201_002
	scrdef scr_seq_R35R0201_003
	scrdef scr_seq_R35R0201_004
	scrdef scr_seq_R35R0201_005
	scrdef scr_seq_R35R0201_006
	scrdef scr_seq_R35R0201_007
	scrdef scr_seq_R35R0201_008
	scrdef scr_seq_R35R0201_009
	scrdef scr_seq_R35R0201_010
	scrdef scr_seq_R35R0201_011
	scrdef scr_seq_R35R0201_012
	scrdef_end

scr_seq_R35R0201_009:
	end

scr_seq_R35R0201_010:
	scrcmd_609
	lockall
	apply_movement obj_player, _00D8
	apply_movement obj_R35R0201_counterm_3, _00E0
	wait_movement
	callstd std_bug_contest_guard_ask_end
	compare VAR_UNK_4118, 1
	goto_if_ne _00D2
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_player, _0448
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	play_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	warp MAP_D22R0102, 0, 40, 86, DIR_NORTH
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	lock obj_partner_poke
	scrcmd_596 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _00C2
	scrcmd_606
	goto _00C4

_00C2:
	scrcmd_607
_00C4:
	apply_movement obj_partner_poke, _00E8
	wait_movement
	release obj_partner_poke
_00D2:
	releaseall
	end
	.byte 0x00, 0x00

_00D8:
	step 2, 1
	step_end

_00E0:
	step 3, 1
	step_end

_00E8:
	step 0, 1
	step_end
scr_seq_R35R0201_012:
	get_weekday VAR_TEMP_x4000
	compare VAR_UNK_4118, 1
	goto_if_ne _010F
	clearflag FLAG_UNK_1C4
	setflag FLAG_UNK_1C3
	goto _0168

_010F:
	compare VAR_TEMP_x4000, 2
	goto_if_ne _012A
	clearflag FLAG_UNK_1C4
	setflag FLAG_UNK_1C3
	goto _0168

_012A:
	compare VAR_TEMP_x4000, 4
	goto_if_ne _0145
	clearflag FLAG_UNK_1C4
	setflag FLAG_UNK_1C3
	goto _0168

_0145:
	compare VAR_TEMP_x4000, 6
	goto_if_ne _0160
	clearflag FLAG_UNK_1C4
	setflag FLAG_UNK_1C3
	goto _0168

_0160:
	clearflag FLAG_UNK_1C3
	setflag FLAG_UNK_1C4
_0168:
	goto_if_unset FLAG_UNK_189, _0179
	clearflag FLAG_UNK_189
	end

_0179:
	get_weekday VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 6
	goto_if_eq _019D
	compare VAR_TEMP_x4000, 0
	goto_if_eq _019D
	setflag FLAG_HIDE_CAMERON
	end

_019D:
	clearflag FLAG_HIDE_CAMERON
	end

scr_seq_R35R0201_008:
	scrcmd_609
	lockall
	apply_movement obj_R35R0201_workman, _029C
	wait_movement
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 7
	goto_if_ne _01D2
	apply_movement obj_R35R0201_workman, _02A4
	goto _0210

_01D2:
	compare VAR_TEMP_x4001, 8
	goto_if_ne _01ED
	apply_movement obj_R35R0201_workman, _02B4
	goto _0210

_01ED:
	compare VAR_TEMP_x4001, 10
	goto_if_ne _0208
	apply_movement obj_R35R0201_workman, _02C4
	goto _0210

_0208:
	apply_movement obj_R35R0201_workman, _02D4
_0210:
	wait_movement
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 56
	apply_movement obj_R35R0201_workman, _02E4
	apply_movement obj_player, _02EC
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	npc_msg msg_0389_R35R0201_00010
	closemsg
	compare VAR_TEMP_x4001, 7
	goto_if_ne _0258
	apply_movement obj_R35R0201_workman, _02FC
	goto _0296

_0258:
	compare VAR_TEMP_x4001, 8
	goto_if_ne _0273
	apply_movement obj_R35R0201_workman, _0308
	goto _0296

_0273:
	compare VAR_TEMP_x4001, 10
	goto_if_ne _028E
	apply_movement obj_R35R0201_workman, _0314
	goto _0296

_028E:
	apply_movement obj_R35R0201_workman, _0320
_0296:
	wait_movement
	releaseall
	end


_029C:
	step 75, 1
	step_end

_02A4:
	step 18, 1
	step 16, 2
	step 39, 1
	step_end

_02B4:
	step 18, 1
	step 16, 1
	step 39, 1
	step_end

_02C4:
	step 18, 1
	step 17, 1
	step 39, 1
	step_end

_02D4:
	step 18, 1
	step 17, 2
	step 39, 1
	step_end

_02E4:
	step 15, 1
	step_end

_02EC:
	step 71, 1
	step 15, 1
	step 72, 1
	step_end

_02FC:
	step 13, 2
	step 35, 1
	step_end

_0308:
	step 13, 1
	step 35, 1
	step_end

_0314:
	step 12, 1
	step 35, 1
	step_end

_0320:
	step 12, 2
	step 35, 1
	step_end
scr_seq_R35R0201_000:
	simple_npc_msg msg_0389_R35R0201_00009
	end

scr_seq_R35R0201_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd std_bug_contest_guard_start
	compare VAR_UNK_4118, 1
	goto_if_ne _0438
	goto_if_set FLAG_UNK_1C4, _03C1
	get_player_facing VAR_SPECIAL_RESULT
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _038C
	apply_movement obj_player, _043C
	goto _03AF

_038C:
	compare VAR_SPECIAL_RESULT, 2
	goto_if_ne _03A7
	apply_movement obj_player, _0448
	goto _03AF

_03A7:
	apply_movement obj_player, _0450
_03AF:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	goto _03E3

_03C1:
	get_player_facing VAR_SPECIAL_RESULT
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_player, _0460
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
_03E3:
	play_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	warp MAP_D22R0102, 0, 40, 86, DIR_NORTH
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	lock obj_partner_poke
	scrcmd_596 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0428
	scrcmd_606
	goto _042A

_0428:
	scrcmd_607
_042A:
	apply_movement obj_partner_poke, _00E8
	wait_movement
	release obj_partner_poke
_0438:
	releaseall
	end


_043C:
	step 15, 1
	step 12, 2
	step_end

_0448:
	step 12, 1
	step_end

_0450:
	step 13, 1
	step 15, 2
	step 12, 2
	step_end

_0460:
	step 15, 2
	step 12, 2
	step_end
scr_seq_R35R0201_002:
	simple_npc_msg msg_0389_R35R0201_00003
	end

scr_seq_R35R0201_011:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _05A7
	photo_album_is_full VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _05BB
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _04F8
	apply_movement obj_player, _05D0
	apply_movement obj_R35R0201_gsmiddleman1, _061C
	goto _0546

_04F8:
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0513
	apply_movement obj_player, _05E8
	goto _0546

_0513:
	compare VAR_SPECIAL_RESULT, 3
	goto_if_ne _0536
	apply_movement obj_player, _0608
	apply_movement obj_R35R0201_gsmiddleman1, _061C
	goto _0546

_0536:
	apply_movement obj_player, _05F4
	apply_movement obj_R35R0201_gsmiddleman1, _061C
_0546:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _056D
	apply_movement obj_partner_poke, _0628
	wait_movement
_056D:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	cameron_photo 12
	lockall
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	clearflag FLAG_UNK_189
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 2
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_05A7:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 5
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_05BB:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 3
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.byte 0x00

_05D0:
	step 15, 1
	step 12, 2
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_05E8:
	step 12, 3
	step 33, 1
	step_end

_05F4:
	step 12, 1
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_0608:
	step 12, 1
	step 15, 1
	step 12, 3
	step 33, 1
	step_end

_061C:
	step 63, 1
	step 32, 1
	step_end

_0628:
	step 15, 1
	step 12, 1
	step 1, 1
	step_end
scr_seq_R35R0201_003:
	simple_npc_msg msg_0389_R35R0201_00005
	end

scr_seq_R35R0201_004:
	simple_npc_msg msg_0389_R35R0201_00006
	end

scr_seq_R35R0201_005:
	simple_npc_msg msg_0389_R35R0201_00000
	end

scr_seq_R35R0201_006:
	simple_npc_msg msg_0389_R35R0201_00007
	end

scr_seq_R35R0201_007:
	simple_npc_msg msg_0389_R35R0201_00008
	end
	.balign 4, 0
