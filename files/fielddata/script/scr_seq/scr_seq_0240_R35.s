#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R35.h"
#include "msgdata/msg/msg_0387_R35.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R35_000
	scrdef scr_seq_R35_001
	scrdef scr_seq_R35_002
	scrdef scr_seq_R35_003
	scrdef scr_seq_R35_004
	scrdef_end

scr_seq_R35_001:
	checkflag FLAG_UNK_189
	gotoif FALSE, _0027
	clearflag FLAG_UNK_189
	end

_0027:
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, _005C
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif eq, _005C
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif eq, _005C
	setflag FLAG_HIDE_CAMERON
	goto _0060

_005C:
	clearflag FLAG_HIDE_CAMERON
_0060:
	scrcmd_379 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif eq, _0088
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif eq, _0088
	clearflag FLAG_UNK_1CD
	setflag FLAG_UNK_1CE
	end

_0088:
	clearflag FLAG_UNK_1CE
	setflag FLAG_UNK_1CD
	end

scr_seq_R35_003:
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
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, _010B
	apply_movement obj_player, _01C0
	apply_movement obj_R35_gsmiddleman1, _01F4
	goto _0136

_010B:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _0126
	apply_movement obj_player, _01D4
	goto _0136

_0126:
	apply_movement obj_player, _01E0
	apply_movement obj_R35_gsmiddleman1, _01F4
_0136:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _015D
	apply_movement 253, _0200
	wait_movement
_015D:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0x00
	wait_fade
	cameron_photo 11
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
	step 12, 1
	step 15, 1
	step 12, 3
	step 33, 1
	step_end

_01D4:
	step 12, 3
	step 33, 1
	step_end

_01E0:
	step 12, 1
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_01F4:
	step 63, 1
	step 32, 1
	step_end

_0200:
	step 15, 1
	step 12, 1
	step 1, 1
	step_end
scr_seq_R35_000:
	scrcmd_055 28, 1, 4, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_R35_004:
	scrcmd_055 29, 1, 19, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_R35_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0387_R35_00021
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
