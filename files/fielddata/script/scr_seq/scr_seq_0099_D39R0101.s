#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D39R0101.h"
#include "msgdata/msg/msg_0122_D39R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D39R0101_000
	scrdef scr_seq_D39R0101_001
	scrdef scr_seq_D39R0101_002
	scrdef scr_seq_D39R0101_003
	scrdef scr_seq_D39R0101_004
	scrdef_end

scr_seq_D39R0101_001:
	checkflag FLAG_UNK_189
	gotoif FALSE, _0027
	clearflag FLAG_UNK_189
	end

_0027:
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif eq, _004B
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif eq, _004B
	setflag FLAG_HIDE_CAMERON
	end

_004B:
	clearflag FLAG_HIDE_CAMERON
	end

scr_seq_D39R0101_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4100, 1
	gotoif eq, _008A
	checkflag FLAG_UNK_457
	gotoif TRUE, _0084
	npc_msg msg_0122_D39R0101_00001
	closemsg
	apply_movement obj_D39R0101_gsmiddleman1, _0114
	wait_movement
	releaseall
	end

_0084:
	setvar VAR_UNK_4100, 1
_008A:
	npc_msg msg_0122_D39R0101_00002
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D39R0101_004:
	scrcmd_609
	lockall
	checkflag FLAG_UNK_457
	gotoif TRUE, _00E5
	apply_movement obj_D39R0101_gsmiddleman1, _0108
	apply_movement obj_player, _011C
	wait_movement
	npc_msg msg_0122_D39R0101_00001
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_D39R0101_gsmiddleman1, _0114
	apply_movement obj_player, _0128
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	releaseall
	end

_00E5:
	apply_movement obj_D39R0101_gsmiddleman1, _0108
	apply_movement obj_player, _011C
	wait_movement
	npc_msg msg_0122_D39R0101_00002
	waitbutton
	closemsg
	releaseall
	setvar VAR_UNK_4100, 1
	end


_0108:
	step 0, 1
	step 75, 1
	step_end

_0114:
	step 1, 1
	step_end

_011C:
	step 63, 2
	step 1, 1
	step_end

_0128:
	step 14, 1
	step_end
scr_seq_D39R0101_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	callstd std_play_kimono_girl_music
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _0157
	goto _0169
	.byte 0x16, 0x00, 0x00, 0x00, 0x00, 0x00
_0157:
	buffer_players_name 0
	npc_msg msg_0122_D39R0101_00003
	waitbutton
	closemsg
	releaseall
	callstd std_fade_end_kimono_girl_music
	end

_0169:
	buffer_players_name 0
	npc_msg msg_0122_D39R0101_00004
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0193
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _01F3
	end

_0193:
	play_se SEQ_SE_DP_WALL_HIT
	npc_msg msg_0122_D39R0101_00005
	closemsg
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	scrcmd_102 VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	apply_movement obj_D39R0101_dancer, _021C
	apply_movement 241, _0244
	wait_movement
	npc_msg msg_0122_D39R0101_00007
	closemsg
	apply_movement obj_D39R0101_dancer, _023C
	wait_movement
	hide_person obj_D39R0101_dancer
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	callstd std_fade_end_kimono_girl_music
	setflag FLAG_UNK_239
	setvar VAR_UNK_40E8, 1
	apply_movement 241, _024C
	wait_movement
	scrcmd_103
	releaseall
	end

_01F3:
	npc_msg msg_0122_D39R0101_00006
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0193
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _01F3
	end
	.byte 0x00, 0x00

_021C:
	step 73, 0
	step 17, 5
	step 74, 0
	step 13, 2
	step 33, 1
	step 63, 1
	step 32, 2
	step_end

_023C:
	step 13, 4
	step_end

_0244:
	step 17, 4
	step_end

_024C:
	step 16, 4
	step_end
	.byte 0x01, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00
scr_seq_D39R0101_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0384
	photo_album_is_full VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0398
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, _02D5
	apply_movement obj_player, _03AC
	apply_movement obj_D39R0101_gsmiddleman1_2, _03F8
	goto _0323

_02D5:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _02F0
	apply_movement obj_player, _03C4
	goto _0323

_02F0:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, _0313
	apply_movement obj_player, _03E4
	apply_movement obj_D39R0101_gsmiddleman1_2, _03F8
	goto _0323

_0313:
	apply_movement obj_player, _03D0
	apply_movement obj_D39R0101_gsmiddleman1_2, _03F8
_0323:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _034A
	apply_movement obj_partner_poke, _0404
	wait_movement
_034A:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0x00
	wait_fade
	cameron_photo 43
	lockall
	fade_screen 6, 1, 1, 0x00
	wait_fade
	clearflag FLAG_UNK_189
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 2
	waitbutton
	closemsg
	releaseall
	end

_0384:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

_0398:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end


_03AC:
	step 15, 1
	step 12, 2
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_03C4:
	step 12, 3
	step 33, 1
	step_end

_03D0:
	step 12, 1
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_03E4:
	step 12, 1
	step 15, 1
	step 12, 3
	step 33, 1
	step_end

_03F8:
	step 63, 1
	step 32, 1
	step_end

_0404:
	step 15, 1
	step 12, 1
	step 1, 1
	step_end
	.balign 4, 0
