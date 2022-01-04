#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T26R0701.h"
#include "msgdata/msg/msg_0611_T26R0701.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T26R0701_000
	scrdef scr_seq_T26R0701_001
	scrdef scr_seq_T26R0701_002
	scrdef scr_seq_T26R0701_003
	scrdef scr_seq_T26R0701_004
	scrdef scr_seq_T26R0701_005
	scrdef scr_seq_T26R0701_006
	scrdef_end

scr_seq_T26R0701_004:
	checkflag FLAG_UNK_189
	gotoif FALSE, _002F
	clearflag FLAG_UNK_189
	end

_002F:
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif ne, _004A
	setflag FLAG_HIDE_CAMERON
	goto _004E

_004A:
	setflag FLAG_HIDE_CAMERON
_004E:
	checkflag FLAG_GAME_CLEAR
	gotoif FALSE, _00C3
	scrcmd_147 38, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, _008F
	scrcmd_522 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 13
	gotoif ne, _0087
	clearflag FLAG_UNK_2CB
	goto _008D

_0087:
	goto _00C3

_008D:
	end

_008F:
	get_phone_book_rematch 38, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, _00C3
	scrcmd_522 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 12
	gotoif ne, _00BD
	clearflag FLAG_UNK_2CB
	goto _00C1

_00BD:
	setflag FLAG_UNK_2CB
_00C1:
	end

_00C3:
	setflag FLAG_UNK_2CB
	end

scr_seq_T26R0701_006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0611_T26R0701_00000
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T26R0701_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0611_T26R0701_00001
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T26R0701_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0611_T26R0701_00002
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T26R0701_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0611_T26R0701_00003
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T26R0701_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _025E
	photo_album_is_full VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0272
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	get_player_facing VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, _018C
	apply_movement obj_player, _0288
	apply_movement obj_T26R0701_gsmiddleman1, _02C0
	goto _01B7

_018C:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _01A7
	apply_movement obj_player, _02A0
	goto _01B7

_01A7:
	apply_movement obj_player, _02AC
	apply_movement obj_T26R0701_gsmiddleman1, _02C0
_01B7:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _01DE
	apply_movement obj_partner_poke, _02CC
	wait_movement
_01DE:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0x00
	wait_fade
	cameron_photo 25
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
	.byte 0x82, 0x01, 0x0c, 0x80, 0x11, 0x00, 0x0c, 0x80
	.byte 0x00, 0x00, 0x1c, 0x00, 0x05, 0x0e, 0x00, 0x00, 0x00, 0x5e, 0x00, 0xff, 0x00, 0x57, 0x00, 0x00
	.byte 0x00, 0x16, 0x00, 0x23, 0x00, 0x00, 0x00, 0x11, 0x00, 0x0c, 0x80, 0x01, 0x00, 0x1c, 0x00, 0x05
	.byte 0x0e, 0x00, 0x00, 0x00, 0x5e, 0x00, 0xff, 0x00, 0x54, 0x00, 0x00, 0x00, 0x16, 0x00, 0x08, 0x00
	.byte 0x00, 0x00, 0x5e, 0x00, 0xff, 0x00, 0x52, 0x00, 0x00, 0x00, 0x5f, 0x00, 0x1b, 0x00
_025E:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

_0272:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end
	.byte 0x00, 0x00

_0288:
	step 15, 1
	step 12, 2
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_02A0:
	step 12, 3
	step 33, 1
	step_end

_02AC:
	step 12, 1
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_02C0:
	step 63, 1
	step 32, 1
	step_end

_02CC:
	step 15, 1
	step 12, 1
	step 1, 1
	step_end
scr_seq_T26R0701_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_147 38, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, _038A
	comparevartovalue VAR_TEMP_x4004, 1
	gotoif ge, _037F
	npc_msg msg_0611_T26R0701_00004
_0307:
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _032B
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, _036E
	end

_032B:
	buffer_players_name 0
	npc_msg msg_0611_T26R0701_00005
	play_fanfare SEQ_ME_POKEGEAR_REGIST
	wait_fanfare
	register_gear_number 38
	npc_msg msg_0611_T26R0701_00006
	waitbutton
	closemsg
	fade_screen 6, 1, 0, 0x00
	wait_fade
	setflag FLAG_UNK_2CB
	hide_person obj_T26R0701_gsleader6
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 1, 0x00
	wait_fade
	releaseall
	end

_036E:
	setvar VAR_TEMP_x4004, 1
	npc_msg msg_0611_T26R0701_00007
	waitbutton
	closemsg
	releaseall
	end

_037F:
	npc_msg msg_0611_T26R0701_00008
	goto _0307
	.byte 0x02, 0x00
_038A:
	npc_msg msg_0611_T26R0701_00009
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _03EB
	photo_album_is_full VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _03F6
	npc_msg msg_0611_T26R0701_00010
	closemsg
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0x00
	wait_fade
	cameron_photo 89
	faceplayer
	lockall
	fade_screen 6, 1, 1, 0x00
	wait_fade
	clearflag FLAG_UNK_189
	npc_msg msg_0611_T26R0701_00011
	waitbutton
	closemsg
	releaseall
	end

_03EB:
	npc_msg msg_0611_T26R0701_00012
	waitbutton
	closemsg
	releaseall
	end

_03F6:
	npc_msg msg_0611_T26R0701_00013
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
