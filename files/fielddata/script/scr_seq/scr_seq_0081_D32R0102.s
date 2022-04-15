#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D32R0102.h"
#include "msgdata/msg/msg_0104_D32R0102.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D32R0102_000
	scrdef scr_seq_D32R0102_001
	scrdef scr_seq_D32R0102_002
	scrdef scr_seq_D32R0102_003
	scrdef scr_seq_D32R0102_004
	scrdef scr_seq_D32R0102_005
	scrdef scr_seq_D32R0102_006
	scrdef scr_seq_D32R0102_007
	scrdef scr_seq_D32R0102_008
	scrdef_end

scr_seq_D32R0102_002:
	compare VAR_UNK_40E5, 2
	goto_if_eq _0035
	end

_0035:
	move_person_facing obj_D32R0102_gsmiddleman1, 17, 1, 25, DIR_WEST
	end

scr_seq_D32R0102_004:
	goto_if_unset FLAG_UNK_189, _0054
	clearflag FLAG_UNK_189
	end

_0054:
	get_weekday VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 2
	goto_if_eq _0078
	compare VAR_TEMP_x4000, 6
	goto_if_eq _0078
	setflag FLAG_HIDE_CAMERON
	end

_0078:
	clearflag FLAG_HIDE_CAMERON
	end

scr_seq_D32R0102_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	compare VAR_UNK_40E5, 2
	goto_if_eq _009E
	npc_msg msg_0104_D32R0102_00002
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_009E:
	npc_msg msg_0104_D32R0102_00003
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_D32R0102_001:
	scrcmd_609
	lockall
	npc_msg msg_0104_D32R0102_00000
	closemsg
	move_person_facing obj_D32R0102_gsmiddleman1, 14, 1, 36, DIR_NORTH
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	compare VAR_SPECIAL_x8004, 12
	goto_if_ne _00E7
	apply_movement obj_D32R0102_gsmiddleman1, _019C
	apply_movement obj_player, _0224
	goto _0183

_00E7:
	compare VAR_SPECIAL_x8004, 13
	goto_if_ne _010A
	apply_movement obj_D32R0102_gsmiddleman1, _01B4
	apply_movement obj_player, _0224
	goto _0183

_010A:
	compare VAR_SPECIAL_x8004, 14
	goto_if_ne _012D
	apply_movement obj_D32R0102_gsmiddleman1, _01C8
	apply_movement obj_player, _0224
	goto _0183

_012D:
	compare VAR_SPECIAL_x8004, 15
	goto_if_ne _0150
	apply_movement obj_D32R0102_gsmiddleman1, _01E0
	apply_movement obj_player, _0230
	goto _0183

_0150:
	compare VAR_SPECIAL_x8004, 16
	goto_if_ne _0173
	apply_movement obj_D32R0102_gsmiddleman1, _01F4
	apply_movement obj_player, _0230
	goto _0183

_0173:
	apply_movement obj_D32R0102_gsmiddleman1, _020C
	apply_movement obj_player, _0230
_0183:
	wait_movement
	npc_msg msg_0104_D32R0102_00001
	wait_button_or_walk_away
	closemsg
	releaseall
	setvar VAR_UNK_40E5, 1
	setflag FLAG_UNK_25B
	end
	.byte 0x00, 0x00

_019C:
	step 18, 1
	step 16, 5
	step 76, 2
	step 12, 1
	step 34, 1
	step_end

_01B4:
	step 16, 5
	step 76, 2
	step 12, 1
	step 34, 1
	step_end

_01C8:
	step 15, 1
	step 16, 5
	step 76, 2
	step 12, 1
	step 34, 1
	step_end

_01E0:
	step 16, 5
	step 76, 2
	step 12, 1
	step 35, 1
	step_end

_01F4:
	step 15, 1
	step 16, 5
	step 76, 2
	step 12, 1
	step 35, 1
	step_end

_020C:
	step 19, 2
	step 16, 5
	step 76, 2
	step 12, 1
	step 35, 1
	step_end

_0224:
	step 63, 5
	step 35, 1
	step_end

_0230:
	step 63, 5
	step 34, 1
	step_end
scr_seq_D32R0102_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0364
	photo_album_is_full VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0378
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _02B5
	apply_movement obj_player, _038C
	apply_movement obj_D32R0102_gsmiddleman1_2, _03D8
	goto _0303

_02B5:
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _02D0
	apply_movement obj_player, _03A4
	goto _0303

_02D0:
	compare VAR_SPECIAL_RESULT, 3
	goto_if_ne _02F3
	apply_movement obj_player, _03C4
	apply_movement obj_D32R0102_gsmiddleman1_2, _03D8
	goto _0303

_02F3:
	apply_movement obj_player, _03B0
	apply_movement obj_D32R0102_gsmiddleman1_2, _03D8
_0303:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _032A
	apply_movement obj_partner_poke, _03E4
	wait_movement
_032A:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	cameron_photo 29
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

_0364:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 5
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0378:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 3
	wait_button_or_walk_away
	closemsg
	releaseall
	end


_038C:
	step 15, 1
	step 12, 2
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_03A4:
	step 12, 3
	step 33, 1
	step_end

_03B0:
	step 12, 1
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_03C4:
	step 12, 1
	step 15, 1
	step 12, 3
	step 33, 1
	step_end

_03D8:
	step 63, 1
	step 32, 1
	step_end

_03E4:
	step 15, 1
	step 12, 1
	step 1, 1
	step_end
scr_seq_D32R0102_005:
	goto_if_set FLAG_UNK_150, _0421
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0104_D32R0102_00004
	apply_movement obj_D32R0102_gsman1, _043C
	wait_movement
	npc_msg msg_0104_D32R0102_00005
	closemsg
	setflag FLAG_UNK_150
	goto _042E

_0421:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0104_D32R0102_00006
	closemsg
_042E:
	apply_movement obj_D32R0102_gsman1, _0444
	wait_movement
	releaseall
	end


_043C:
	step 1, 1
	step_end

_0444:
	step 0, 1
	step_end
scr_seq_D32R0102_006:
	simple_npc_msg msg_0104_D32R0102_00007
	end

scr_seq_D32R0102_007:
	simple_npc_msg msg_0104_D32R0102_00008
	end

scr_seq_D32R0102_008:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0104_D32R0102_00009, VAR_SPECIAL_RESULT
	callstd std_signpost
	end
	.balign 4, 0
