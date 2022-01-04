#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D26R0101.h"
#include "msgdata/msg/msg_0090_D26R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D26R0101_000
	scrdef scr_seq_D26R0101_001
	scrdef scr_seq_D26R0101_002
	scrdef_end

scr_seq_D26R0101_002:
	checkflag FLAG_UNK_189
	gotoif FALSE, _001F
	clearflag FLAG_UNK_189
	end

_001F:
	check_badge 2, VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, _005D
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, _0063
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif eq, _0063
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif eq, _0063
_005D:
	setflag FLAG_HIDE_CAMERON
	end

_0063:
	clearflag FLAG_HIDE_CAMERON
	end

scr_seq_D26R0101_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	buffer_players_name 0
	npc_msg msg_0090_D26R0101_00000
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D26R0101_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0184
	photo_album_is_full VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0198
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	get_player_facing VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _00F0
	apply_movement obj_player, _01AC
	goto _0123

_00F0:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, _0113
	apply_movement obj_player, _01CC
	apply_movement obj_D26R0101_gsmiddleman1, _01E0
	goto _0123

_0113:
	apply_movement obj_player, _01B8
	apply_movement obj_D26R0101_gsmiddleman1, _01E0
_0123:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _014A
	apply_movement obj_partner_poke, _01EC
	wait_movement
_014A:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0x00
	wait_fade
	cameron_photo 6
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

_0184:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

_0198:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end


_01AC:
	step 12, 3
	step 33, 1
	step_end

_01B8:
	step 12, 1
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_01CC:
	step 12, 1
	step 15, 1
	step 12, 3
	step 33, 1
	step_end

_01E0:
	step 63, 1
	step 32, 1
	step_end

_01EC:
	step 15, 1
	step 12, 1
	step 1, 1
	step_end
	.balign 4, 0
