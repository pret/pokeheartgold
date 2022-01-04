#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_W21.h"
#include "msgdata/msg/msg_0743_W21.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_W21_000
	scrdef scr_seq_W21_001
	scrdef_end

scr_seq_W21_001:
	checkflag FLAG_UNK_189
	gotoif FALSE, _001B
	clearflag FLAG_UNK_189
	end

_001B:
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, _003F
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, _003F
	setflag FLAG_HIDE_CAMERON
	end

_003F:
	clearflag FLAG_HIDE_CAMERON
	end

scr_seq_W21_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0152
	photo_album_is_full VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0166
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	get_player_facing VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _00BE
	apply_movement obj_player, _017C
	apply_movement obj_W21_gsmiddleman1, _01B0
	goto _00F1

_00BE:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, _00E1
	apply_movement obj_player, _019C
	apply_movement obj_W21_gsmiddleman1, _01B0
	goto _00F1

_00E1:
	apply_movement obj_player, _0188
	apply_movement obj_W21_gsmiddleman1, _01B0
_00F1:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _0118
	apply_movement obj_partner_poke, _01BC
	wait_movement
_0118:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0x00
	wait_fade
	cameron_photo 74
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

_0152:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

_0166:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end
	.byte 0x00, 0x00

_017C:
	step 12, 3
	step 33, 1
	step_end

_0188:
	step 12, 1
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_019C:
	step 12, 1
	step 15, 1
	step 12, 3
	step 33, 1
	step_end

_01B0:
	step 63, 1
	step 32, 1
	step_end

_01BC:
	step 15, 1
	step 12, 1
	step 1, 1
	step_end
	.balign 4, 0
