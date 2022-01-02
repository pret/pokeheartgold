#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D40R0107.h"
#include "msgdata/msg/msg_0125_D40R0107.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D40R0107_000
	scrdef scr_seq_D40R0107_001
	scrdef scr_seq_D40R0107_002
	scrdef scr_seq_D40R0107_003
	scrdef scr_seq_D40R0107_004
	scrdef scr_seq_D40R0107_005
	scrdef scr_seq_D40R0107_006
	scrdef_end

scr_seq_D40R0107_006:
	setvar VAR_TEMP_x4003, 111
	setflag FLAG_UNK_105
	end

scr_seq_D40R0107_002:
	setflag FLAG_UNK_99A
	checkflag FLAG_ENGAGING_STATIC_POKEMON
	gotoif TRUE, _003B
	end

_003B:
	setflag FLAG_UNK_243
	hide_person obj_D40R0107_lug_obj01
	hide_person obj_D40R0107_stop
	hide_person obj_D40R0107_stop_2
	hide_person obj_D40R0107_stop_3
	hide_person obj_D40R0107_stop_4
	hide_person obj_D40R0107_stop_5
	clearflag FLAG_ENGAGING_STATIC_POKEMON
	end

scr_seq_D40R0107_004:
	checkflag FLAG_UNK_243
	gotoif TRUE, _007C
	scrcmd_375 6
	scrcmd_375 7
	scrcmd_375 8
	scrcmd_375 9
	scrcmd_375 10
_007C:
	comparevartovalue VAR_TEMP_x400B, 123
	gotoif ne, _0093
	scrcmd_074 2143
	setvar VAR_TEMP_x400B, 0
_0093:
	checkflag FLAG_UNK_109
	gotoif TRUE, _00FA
	checkflag FLAG_UNK_10B
	gotoif FALSE, _00FA
	comparevartovalue VAR_TEMP_x4003, 111
	gotoif ne, _00FA
	move_person obj_D40R0107_dancer_5, 16, 1, 32, 0
	move_person obj_D40R0107_dancer_3, 13, 1, 33, 0
	move_person obj_D40R0107_dancer_4, 13, 1, 27, 0
	move_person obj_D40R0107_dancer, 19, 1, 33, 0
	move_person obj_D40R0107_dancer_2, 19, 1, 27, 0
	setvar VAR_TEMP_x4003, 0
	end

_00FA:
	end

scr_seq_D40R0107_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x400A, 249
	play_cry VAR_TEMP_x400A, 0
	npc_msg msg_0125_D40R0107_00004
	wait_cry
	closemsg
	scrcmd_495 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif ne, _0134
	setvar VAR_SPECIAL_x8004, 70
	goto _013A

_0134:
	setvar VAR_SPECIAL_x8004, 45
_013A:
	setflag FLAG_ENGAGING_STATIC_POKEMON
	wild_battle VAR_TEMP_x400A, VAR_SPECIAL_x8004, 0
	clearflag FLAG_ENGAGING_STATIC_POKEMON
	scrcmd_683 VAR_TEMP_x4005
	comparevartovalue VAR_TEMP_x4005, 2
	gotoif eq, _019E
	comparevartovalue VAR_TEMP_x4005, 3
	gotoif eq, _019E
	comparevartovalue VAR_TEMP_x4005, 4
	callif eq, _01A8
	releaseall
	setflag FLAG_UNK_109
	setvar VAR_SCENE_NEW_BARK_EAST_EXIT, 3
	setflag FLAG_HIDE_NEW_BARK_FRIEND
	setflag FLAG_HIDE_NEW_BARK_MARILL
	setflag FLAG_HIDE_NEW_BARK_FRIEND_2
	clearflag FLAG_UNK_2E5
	setflag FLAG_UNK_245
	clearflag FLAG_UNK_23C
	clearflag FLAG_UNK_241
	end

_019E:
	clearflag FLAG_UNK_243
	white_out
	releaseall
	end

_01A8:
	setflag FLAG_UNK_117
	return

scr_seq_D40R0107_005:
	scrcmd_609
	lockall
	apply_movement obj_player, _0964
	wait_movement
	scrcmd_805
	apply_movement obj_D40R0107_dancer_5, _09A8
	wait_movement
	npc_msg msg_0125_D40R0107_00000
	closemsg
	scrcmd_074 2143
	fade_screen 4, 4, 0, 0x7FFF
	wait_fade
	scrcmd_755
	scrcmd_757
	play_se SEQ_SE_GS_SUZUSYUTUGEN_RU
	fade_screen 4, 4, 1, 0x7FFF
	wait_fade
	wait_se SEQ_SE_GS_SUZUSYUTUGEN_RU
	apply_movement obj_D40R0107_dancer_5, _096C
	apply_movement obj_D40R0107_dancer_3, _0978
	apply_movement obj_D40R0107_dancer_4, _0984
	apply_movement obj_D40R0107_dancer, _0990
	apply_movement obj_D40R0107_dancer_2, _099C
	wait_movement
	wait 16, VAR_SPECIAL_x800C
	apply_movement obj_D40R0107_dancer_5, _09A8
	apply_movement obj_D40R0107_dancer_3, _09A8
	apply_movement obj_D40R0107_dancer_4, _09A8
	apply_movement obj_D40R0107_dancer, _09A8
	apply_movement obj_D40R0107_dancer_2, _09A8
	wait_movement
	wait 16, VAR_SPECIAL_x800C
	scrcmd_081 0
	temp_bgm SEQ_GS_E_MAIKO_MAI
	wait 18, VAR_SPECIAL_x800C
	apply_movement obj_D40R0107_dancer_5, _09B8
	apply_movement obj_D40R0107_dancer_3, _09B8
	apply_movement obj_D40R0107_dancer_4, _09B8
	apply_movement obj_D40R0107_dancer, _09B8
	apply_movement obj_D40R0107_dancer_2, _09B8
	wait 12, VAR_SPECIAL_x800C
	scrcmd_758 1
	play_se SEQ_SE_GS_SUZUNOONPA_RU
	wait_movement
	wait 67, VAR_SPECIAL_x800C
	apply_movement obj_D40R0107_dancer_5, _09B8
	apply_movement obj_D40R0107_dancer_3, _09B8
	apply_movement obj_D40R0107_dancer_4, _09B8
	apply_movement obj_D40R0107_dancer, _09B8
	apply_movement obj_D40R0107_dancer_2, _09B8
	wait 12, VAR_SPECIAL_x800C
	scrcmd_758 1
	play_se SEQ_SE_GS_SUZUNOONPA_RU
	wait_movement
	fade_screen 4, 6, 1, 0x7FFF
	scrcmd_765
	wait_fade
	wait 6, VAR_SPECIAL_x800C
	apply_movement obj_D40R0107_dancer_5, _0B34
	apply_movement obj_D40R0107_dancer_3, _0B34
	apply_movement obj_D40R0107_dancer_4, _0B24
	apply_movement obj_D40R0107_dancer, _0B1C
	apply_movement obj_D40R0107_dancer_2, _0B2C
	wait_movement
	apply_movement obj_D40R0107_dancer_5, _0A48
	apply_movement obj_D40R0107_dancer_3, _0A48
	apply_movement obj_D40R0107_dancer_4, _0A00
	apply_movement obj_D40R0107_dancer, _09DC
	apply_movement obj_D40R0107_dancer_2, _0A24
	wait 12, VAR_SPECIAL_x800C
	scrcmd_758 1
	play_se SEQ_SE_GS_SUZUNOONPA_RU
	wait_movement
	wait 32, VAR_SPECIAL_x800C
	apply_movement obj_D40R0107_dancer_5, _0B1C
	apply_movement obj_D40R0107_dancer_3, _0B34
	apply_movement obj_D40R0107_dancer_4, _0B24
	apply_movement obj_D40R0107_dancer, _0B1C
	apply_movement obj_D40R0107_dancer_2, _0B2C
	wait_movement
	apply_movement obj_D40R0107_dancer_5, _09DC
	apply_movement obj_D40R0107_dancer_3, _0A48
	apply_movement obj_D40R0107_dancer_4, _0A00
	apply_movement obj_D40R0107_dancer, _09DC
	apply_movement obj_D40R0107_dancer_2, _0A24
	wait 12, VAR_SPECIAL_x800C
	scrcmd_758 1
	play_se SEQ_SE_GS_SUZUNOONPA_RU
	wait_movement
	wait 33, VAR_SPECIAL_x800C
	apply_movement obj_D40R0107_dancer_5, _0B1C
	apply_movement obj_D40R0107_dancer_3, _0B34
	apply_movement obj_D40R0107_dancer_4, _0B24
	apply_movement obj_D40R0107_dancer, _0B1C
	apply_movement obj_D40R0107_dancer_2, _0B2C
	wait_movement
	apply_movement obj_D40R0107_dancer_5, _09DC
	apply_movement obj_D40R0107_dancer_3, _0AF0
	apply_movement obj_D40R0107_dancer_4, _0A98
	apply_movement obj_D40R0107_dancer, _0A6C
	apply_movement obj_D40R0107_dancer_2, _0AC4
	wait 15, VAR_SPECIAL_x800C
	scrcmd_758 1
	play_se SEQ_SE_GS_SUZUNOONPA_RU
	wait_movement
	wait 32, VAR_SPECIAL_x800C
	apply_movement obj_D40R0107_dancer_5, _0B2C
	apply_movement obj_D40R0107_dancer_3, _0B1C
	apply_movement obj_D40R0107_dancer_4, _0B34
	apply_movement obj_D40R0107_dancer, _0B2C
	apply_movement obj_D40R0107_dancer_2, _0B24
	wait_movement
	apply_movement obj_D40R0107_dancer_5, _0A24
	apply_movement obj_D40R0107_dancer_3, _09DC
	apply_movement obj_D40R0107_dancer_4, _0A48
	apply_movement obj_D40R0107_dancer, _0A24
	apply_movement obj_D40R0107_dancer_2, _0A00
	wait 12, VAR_SPECIAL_x800C
	scrcmd_758 1
	play_se SEQ_SE_GS_SUZUNOONPA_RU
	wait_movement
	scrcmd_766
	scrcmd_762 0
	wait 32, VAR_SPECIAL_x800C
	apply_movement obj_D40R0107_dancer_5, _0B2C
	apply_movement obj_D40R0107_dancer_3, _0B1C
	apply_movement obj_D40R0107_dancer_4, _0B34
	apply_movement obj_D40R0107_dancer, _0B2C
	apply_movement obj_D40R0107_dancer_2, _0B24
	wait_movement
	apply_movement obj_D40R0107_dancer_5, _0A24
	apply_movement obj_D40R0107_dancer_3, _09DC
	apply_movement obj_D40R0107_dancer_4, _0A48
	apply_movement obj_D40R0107_dancer, _0A24
	apply_movement obj_D40R0107_dancer_2, _0A00
	wait 12, VAR_SPECIAL_x800C
	scrcmd_758 0
	play_se SEQ_SE_GS_SUZUNOONPA2
	wait_movement
	wait 29, VAR_SPECIAL_x800C
	apply_movement obj_D40R0107_dancer_5, _0B24
	apply_movement obj_D40R0107_dancer_3, _0B1C
	apply_movement obj_D40R0107_dancer_4, _0B34
	apply_movement obj_D40R0107_dancer, _0B2C
	apply_movement obj_D40R0107_dancer_2, _0B24
	wait_movement
	apply_movement obj_D40R0107_dancer_5, _0A00
	apply_movement obj_D40R0107_dancer_3, _0A6C
	apply_movement obj_D40R0107_dancer_4, _0AF0
	apply_movement obj_D40R0107_dancer, _0AC4
	apply_movement obj_D40R0107_dancer_2, _0A98
	wait 15, VAR_SPECIAL_x800C
	scrcmd_758 0
	play_se SEQ_SE_GS_SUZUNOONPA2
	wait_movement
	wait 41, VAR_SPECIAL_x800C
	scrcmd_763
	wait 16, VAR_SPECIAL_x800C
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_761 1
	fade_screen 6, 1, 1, 0x00
	wait_fade
	apply_movement obj_D40R0107_dancer_5, _0A00
	apply_movement obj_D40R0107_dancer_3, _0A24
	apply_movement obj_D40R0107_dancer_4, _09DC
	apply_movement obj_D40R0107_dancer, _0A00
	apply_movement obj_D40R0107_dancer_2, _0A48
	wait 12, VAR_SPECIAL_x800C
	scrcmd_758 0
	play_se SEQ_SE_GS_SUZUNOONPA2
	wait_movement
	wait 32, VAR_SPECIAL_x800C
	apply_movement obj_D40R0107_dancer_5, _0B24
	apply_movement obj_D40R0107_dancer_3, _0B2C
	apply_movement obj_D40R0107_dancer_4, _0B1C
	apply_movement obj_D40R0107_dancer, _0B24
	apply_movement obj_D40R0107_dancer_2, _0B34
	wait_movement
	apply_movement obj_D40R0107_dancer_5, _0A00
	apply_movement obj_D40R0107_dancer_3, _0A24
	apply_movement obj_D40R0107_dancer_4, _09DC
	apply_movement obj_D40R0107_dancer, _0A00
	apply_movement obj_D40R0107_dancer_2, _0A48
	wait 12, VAR_SPECIAL_x800C
	scrcmd_758 0
	play_se SEQ_SE_GS_SUZUNOONPA2
	wait_movement
	wait 29, VAR_SPECIAL_x800C
	apply_movement obj_D40R0107_dancer_5, _0B34
	apply_movement obj_D40R0107_dancer_3, _0B2C
	apply_movement obj_D40R0107_dancer_4, _0B1C
	apply_movement obj_D40R0107_dancer, _0B24
	apply_movement obj_D40R0107_dancer_2, _0B34
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_761 2
	fade_screen 6, 1, 1, 0x00
	wait_fade
	wait_movement
	apply_movement obj_D40R0107_dancer_5, _0A48
	apply_movement obj_D40R0107_dancer_3, _0A24
	apply_movement obj_D40R0107_dancer_4, _09DC
	apply_movement obj_D40R0107_dancer, _0A00
	apply_movement obj_D40R0107_dancer_2, _0A48
	wait 12, VAR_SPECIAL_x800C
	scrcmd_758 0
	play_se SEQ_SE_GS_SUZUNOONPA2
	wait_movement
	wait 32, VAR_SPECIAL_x800C
	apply_movement obj_D40R0107_dancer_5, _0B34
	apply_movement obj_D40R0107_dancer_3, _0B2C
	apply_movement obj_D40R0107_dancer_4, _0B1C
	apply_movement obj_D40R0107_dancer, _0B24
	apply_movement obj_D40R0107_dancer_2, _0B34
	wait_movement
	apply_movement obj_D40R0107_dancer_5, _0A48
	apply_movement obj_D40R0107_dancer_3, _0A24
	apply_movement obj_D40R0107_dancer_4, _09DC
	apply_movement obj_D40R0107_dancer, _0A00
	apply_movement obj_D40R0107_dancer_2, _0A48
	wait 12, VAR_SPECIAL_x800C
	scrcmd_758 0
	play_se SEQ_SE_GS_SUZUNOONPA2
	wait_movement
	wait 38, VAR_SPECIAL_x800C
	apply_movement obj_D40R0107_dancer_5, _0B1C
	apply_movement obj_D40R0107_dancer_3, _0B24
	apply_movement obj_D40R0107_dancer_4, _0B2C
	apply_movement obj_D40R0107_dancer, _0B34
	apply_movement obj_D40R0107_dancer_2, _0B1C
	wait_movement
	apply_movement obj_D40R0107_dancer_5, _09DC
	apply_movement obj_D40R0107_dancer_3, _0A00
	apply_movement obj_D40R0107_dancer_4, _0A24
	apply_movement obj_D40R0107_dancer, _0A48
	apply_movement obj_D40R0107_dancer_2, _09DC
	wait 12, VAR_SPECIAL_x800C
	scrcmd_758 0
	play_se SEQ_SE_GS_SUZUNOONPA2
	wait_movement
	scrcmd_762 1
	wait 32, VAR_SPECIAL_x800C
	apply_movement obj_D40R0107_dancer_5, _0B1C
	apply_movement obj_D40R0107_dancer_3, _0B24
	apply_movement obj_D40R0107_dancer_4, _0B2C
	apply_movement obj_D40R0107_dancer, _0B34
	apply_movement obj_D40R0107_dancer_2, _0B1C
	wait_movement
	apply_movement obj_D40R0107_dancer_5, _09DC
	apply_movement obj_D40R0107_dancer_3, _0A00
	apply_movement obj_D40R0107_dancer_4, _0A24
	apply_movement obj_D40R0107_dancer, _0A48
	apply_movement obj_D40R0107_dancer_2, _09DC
	wait 12, VAR_SPECIAL_x800C
	scrcmd_758 0
	play_se SEQ_SE_GS_SUZUNOONPA2
	wait_movement
	fade_out_bgm 0, 100
	scrcmd_081 0
	wait 32, VAR_SPECIAL_x800C
	apply_movement obj_D40R0107_dancer_5, _0B2C
	apply_movement obj_D40R0107_dancer_3, _0B24
	apply_movement obj_D40R0107_dancer_4, _0B2C
	apply_movement obj_D40R0107_dancer, _0B34
	apply_movement obj_D40R0107_dancer_2, _0B1C
	wait_movement
	apply_movement obj_D40R0107_dancer_5, _0A24
	apply_movement obj_D40R0107_dancer_3, _0A00
	apply_movement obj_D40R0107_dancer_4, _0A24
	apply_movement obj_D40R0107_dancer, _0A48
	apply_movement obj_D40R0107_dancer_2, _09DC
	wait 12, VAR_SPECIAL_x800C
	wait_movement
	scrcmd_763
	wait 32, VAR_SPECIAL_x800C
	temp_bgm SEQ_GS_E_LUGIA
	wait 48, VAR_SPECIAL_x800C
	scrcmd_561 3, 3, 15, 5
	wait 10, VAR_SPECIAL_x800C
	wait 70, VAR_SPECIAL_x800C
	scrcmd_759
	wait 26, VAR_SPECIAL_x800C
	scrcmd_756
	setvar VAR_TEMP_x400B, 123
	fade_screen 6, 1, 0, 0x00
	wait_fade
	clearflag FLAG_UNK_243
	show_person obj_D40R0107_lug_obj01
	scrcmd_375 5
	show_person obj_D40R0107_stop
	show_person obj_D40R0107_stop_2
	show_person obj_D40R0107_stop_3
	show_person obj_D40R0107_stop_4
	show_person obj_D40R0107_stop_5
	release obj_D40R0107_dancer_5
	release obj_D40R0107_dancer_3
	release obj_D40R0107_dancer_4
	release obj_D40R0107_dancer
	release obj_D40R0107_dancer_2
	move_person obj_D40R0107_dancer_5, 16, 1, 33, 0
	move_person obj_D40R0107_dancer_3, 13, 1, 33, 0
	move_person obj_D40R0107_dancer_4, 13, 1, 27, 0
	move_person obj_D40R0107_dancer, 19, 1, 33, 0
	move_person obj_D40R0107_dancer_2, 19, 1, 27, 0
	scrcmd_773 1
	scrcmd_767
	fade_screen 6, 1, 1, 0x00
	wait_fade
	wait 59, VAR_SPECIAL_x800C
	scrcmd_764
	scrcmd_081 15
	scrcmd_769
	scrcmd_768
	wait 16, VAR_SPECIAL_x800C
	scrcmd_726
	apply_movement obj_D40R0107_dancer_5, _0B3C
	wait_movement
	buffer_players_name 0
	npc_msg msg_0125_D40R0107_00002
	closemsg
	apply_movement obj_D40R0107_dancer_5, _09A8
	wait_movement
	buffer_players_name 0
	npc_msg msg_0125_D40R0107_00003
	waitbutton
	closemsg
	releaseall
	setflag FLAG_UNK_10B
	setvar VAR_UNK_40FA, 2
	end
	.byte 0x00

_0964:
	step 8, 2
	step_end

_096C:
	step 63, 6
	step 12, 1
	step_end

_0978:
	step 63, 5
	step 14, 2
	step_end

_0984:
	step 14, 1
	step 12, 6
	step_end

_0990:
	step 63, 5
	step 15, 2
	step_end

_099C:
	step 15, 1
	step 12, 6
	step_end

_09A8:
	step 33, 1
	step_end
	.byte 0x20, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00

_09B8:
	step 3, 1
	step 61, 1
	step 0, 1
	step 61, 1
	step 2, 1
	step 61, 1
	step 1, 1
	step 61, 1
	step_end

_09DC:
	step 2, 1
	step 61, 1
	step 1, 1
	step 61, 1
	step 3, 1
	step 61, 1
	step 0, 1
	step 61, 1
	step_end

_0A00:
	step 3, 1
	step 61, 1
	step 0, 1
	step 61, 1
	step 2, 1
	step 61, 1
	step 1, 1
	step 61, 1
	step_end

_0A24:
	step 1, 1
	step 61, 1
	step 3, 1
	step 61, 1
	step 0, 1
	step 61, 1
	step 2, 1
	step 61, 1
	step_end

_0A48:
	step 0, 1
	step 61, 1
	step 2, 1
	step 61, 1
	step 1, 1
	step 61, 1
	step 3, 1
	step 61, 1
	step_end

_0A6C:
	step 2, 1
	step 61, 1
	step 1, 1
	step 61, 1
	step 3, 1
	step 61, 1
	step 0, 1
	step 61, 1
	step 2, 1
	step 61, 1
	step_end

_0A98:
	step 3, 1
	step 61, 1
	step 0, 1
	step 61, 1
	step 2, 1
	step 61, 1
	step 1, 1
	step 61, 1
	step 3, 1
	step 61, 1
	step_end

_0AC4:
	step 1, 1
	step 61, 1
	step 3, 1
	step 61, 1
	step 0, 1
	step 61, 1
	step 2, 1
	step 61, 1
	step 1, 1
	step 61, 1
	step_end

_0AF0:
	step 0, 1
	step 61, 1
	step 2, 1
	step 61, 1
	step 1, 1
	step 61, 1
	step 3, 1
	step 61, 1
	step 0, 1
	step 61, 1
	step_end

_0B1C:
	step 8, 2
	step_end

_0B24:
	step 9, 2
	step_end

_0B2C:
	step 10, 2
	step_end

_0B34:
	step 11, 2
	step_end

_0B3C:
	step 8, 1
	step_end
scr_seq_D40R0107_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_109
	gotoif TRUE, _0B62
	npc_msg msg_0125_D40R0107_00001
	waitbutton
	closemsg
	releaseall
	end

_0B62:
	comparevartovalue VAR_TEMP_x4005, 5
	gotoif ne, _0B78
	npc_msg msg_0125_D40R0107_00008
	goto _0BA7

_0B78:
	comparevartovalue VAR_TEMP_x4005, 6
	gotoif ne, _0B8E
	npc_msg msg_0125_D40R0107_00008
	goto _0BA7

_0B8E:
	comparevartovalue VAR_TEMP_x4005, 4
	gotoif ne, _0BA4
	npc_msg msg_0125_D40R0107_00006
	goto _0BA7

_0BA4:
	npc_msg msg_0125_D40R0107_00007
_0BA7:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D40R0107_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_109
	gotoif TRUE, _0BCD
	npc_msg msg_0125_D40R0107_00001
	waitbutton
	closemsg
	releaseall
	end

_0BCD:
	npc_msg msg_0125_D40R0107_00005
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
