#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R45.h"
#include "msgdata/msg/msg_0405_R45.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R45_000
	scrdef scr_seq_R45_001
	scrdef scr_seq_R45_002
	scrdef scr_seq_R45_003
	scrdef scr_seq_R45_004
	scrdef_end

scr_seq_R45_002:
	checkflag FLAG_UNK_189
	gotoif FALSE, _0027
	clearflag FLAG_UNK_189
	end

_0027:
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif eq, _004B
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif eq, _004B
	setflag FLAG_HIDE_CAMERON
	end

_004B:
	clearflag FLAG_HIDE_CAMERON
	end

scr_seq_R45_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0133
	photo_album_is_full VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0147
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _00C2
	apply_movement obj_player, _015C
	goto _00D2

_00C2:
	apply_movement obj_player, _0168
	apply_movement obj_R45_gsmiddleman1, _017C
_00D2:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _00F9
	apply_movement obj_partner_poke, _0188
	wait_movement
_00F9:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0x00
	wait_fade
	cameron_photo 47
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

_0133:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

_0147:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end
	.byte 0x00

_015C:
	step 12, 3
	step 33, 1
	step_end

_0168:
	step 12, 1
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_017C:
	step 63, 1
	step 32, 1
	step_end

_0188:
	step 15, 1
	step 12, 1
	step 1, 1
	step_end
scr_seq_R45_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0405_R45_00000
	waitbutton
	closemsg
	releaseall
	end

scr_seq_R45_000:
	direction_signpost msg_0405_R45_00001, 1, 4, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd std_signpost
	end

scr_seq_R45_004:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0405_R45_00002, VAR_SPECIAL_x800C
	callstd std_signpost
	end
	.balign 4, 0
