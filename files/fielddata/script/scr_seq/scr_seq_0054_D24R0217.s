#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D24R0217.h"
#include "msgdata/msg/msg_0085_D24R0217.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D24R0217_000
	scrdef scr_seq_D24R0217_001
	scrdef scr_seq_D24R0217_002
	scrdef scr_seq_D24R0217_003
	scrdef_end

scr_seq_D24R0217_002:
	checkflag FLAG_UNK_189
	gotoif FALSE, _0023
	clearflag FLAG_UNK_189
	end

_0023:
	check_badge 2, VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, _0061
	get_weekday VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, _0067
	comparevartovalue VAR_TEMP_x4001, 2
	gotoif eq, _0067
	comparevartovalue VAR_TEMP_x4001, 4
	gotoif eq, _0067
_0061:
	setflag FLAG_HIDE_CAMERON
	end

_0067:
	clearflag FLAG_HIDE_CAMERON
	end

scr_seq_D24R0217_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0085_D24R0217_00000
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D24R0217_001:
	end

scr_seq_D24R0217_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0197
	photo_album_is_full VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _01AB
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, _00F9
	apply_movement obj_player, _01C0
	apply_movement obj_D24R0217_gsmiddleman1, _020C
	goto _0147

_00F9:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _0114
	apply_movement obj_player, _01D8
	goto _0147

_0114:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, _0137
	apply_movement obj_player, _01F8
	apply_movement obj_D24R0217_gsmiddleman1, _020C
	goto _0147

_0137:
	apply_movement obj_player, _01E4
	apply_movement obj_D24R0217_gsmiddleman1, _020C
_0147:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	apply_movement 253, _0218
	wait_movement
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0x00
	wait_fade
	cameron_photo 4
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

_0197:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

_01AB:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end
	.byte 0x00

_01C0:
	step 15, 1
	step 12, 2
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_01D8:
	step 12, 3
	step 33, 1
	step_end

_01E4:
	step 12, 1
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_01F8:
	step 12, 1
	step 15, 1
	step 12, 3
	step 33, 1
	step_end

_020C:
	step 63, 1
	step 32, 1
	step_end

_0218:
	step 15, 1
	step 12, 1
	step 1, 1
	step_end
	.balign 4, 0
