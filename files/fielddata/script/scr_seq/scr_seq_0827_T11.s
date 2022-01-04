#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T11.h"
#include "msgdata/msg/msg_0529_T11.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T11_000
	scrdef scr_seq_T11_001
	scrdef scr_seq_T11_002
	scrdef scr_seq_T11_003
	scrdef scr_seq_T11_004
	scrdef scr_seq_T11_005
	scrdef scr_seq_T11_006
	scrdef scr_seq_T11_007
	scrdef scr_seq_T11_008
	scrdef scr_seq_T11_009
	scrdef scr_seq_T11_010
	scrdef scr_seq_T11_011
	scrdef scr_seq_T11_012
	scrdef scr_seq_T11_013
	scrdef scr_seq_T11_014
	scrdef scr_seq_T11_015
	scrdef scr_seq_T11_016
	scrdef_end

scr_seq_T11_016:
	checkflag FLAG_UNK_0A0
	gotoif FALSE, _0055
	clearflag FLAG_UNK_0A0
_0055:
	checkflag FLAG_UNK_189
	gotoif FALSE, _0066
	clearflag FLAG_UNK_189
	end

_0066:
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, _00B5
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif eq, _00B5
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif eq, _00B5
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif eq, _00BF
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif eq, _00BF
	setflag FLAG_HIDE_CAMERON
	setflag FLAG_UNK_27F
	end

_00B5:
	clearflag FLAG_HIDE_CAMERON
	setflag FLAG_UNK_27F
	end

_00BF:
	setflag FLAG_HIDE_CAMERON
	clearflag FLAG_UNK_27F
	end

scr_seq_T11_014:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _034C
	photo_album_is_full VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0360
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	get_player_facing VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, _0142
	apply_movement obj_player, _01D0
	apply_movement obj_T11_gsmiddleman1_2, _0208
	goto _016D

_0142:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _015D
	apply_movement obj_player, _01E8
	goto _016D

_015D:
	apply_movement obj_player, _01F4
	apply_movement obj_T11_gsmiddleman1_2, _0208
_016D:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _0194
	apply_movement obj_partner_poke, _0214
	wait_movement
_0194:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0x00
	wait_fade
	cameron_photo 52
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
	.byte 0x00, 0x00

_01D0:
	step 14, 1
	step 12, 2
	step 15, 1
	step 12, 3
	step 33, 1
	step_end

_01E8:
	step 12, 3
	step 33, 1
	step_end

_01F4:
	step 12, 1
	step 15, 1
	step 12, 3
	step 33, 1
	step_end

_0208:
	step 63, 1
	step 32, 1
	step_end

_0214:
	step 15, 1
	step 12, 1
	step 1, 1
	step_end
scr_seq_T11_015:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _034C
	photo_album_is_full VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0360
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	get_player_facing VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, _029D
	apply_movement obj_player, _0374
	apply_movement obj_T11_gsmiddleman1_3, _0208
	goto _02EB

_029D:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _02B8
	apply_movement obj_player, _01E8
	goto _02EB

_02B8:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, _02DB
	apply_movement obj_player, _01F4
	apply_movement obj_T11_gsmiddleman1_3, _0208
	goto _02EB

_02DB:
	apply_movement obj_player, _038C
	apply_movement obj_T11_gsmiddleman1_3, _0208
_02EB:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _0312
	apply_movement obj_partner_poke, _0214
	wait_movement
_0312:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0x00
	wait_fade
	cameron_photo 53
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

_034C:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

_0360:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end


_0374:
	step 15, 1
	step 12, 2
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_038C:
	step 12, 1
	step 14, 1
	step 12, 3
	step 33, 1
	step_end
scr_seq_T11_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_2FB
	gotoif TRUE, _03BE
	npc_msg msg_0529_T11_00002
	waitbutton
	closemsg
	releaseall
	end

_03BE:
	npc_msg msg_0529_T11_00003
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T11_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0529_T11_00000
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T11_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0529_T11_00001
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T11_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0529_T11_00004
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T11_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0529_T11_00005
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T11_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0529_T11_00006
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T11_006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0529_T11_00007
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T11_007:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0529_T11_00008
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T11_008:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0529_T11_00009, VAR_SPECIAL_x800C
	callstd std_signpost
	end

scr_seq_T11_009:
	direction_signpost msg_0529_T11_00010, 0, 10, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd std_signpost
	end

scr_seq_T11_010:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0529_T11_00011, VAR_SPECIAL_x800C
	callstd std_signpost
	end

scr_seq_T11_011:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0529_T11_00012, VAR_SPECIAL_x800C
	callstd std_signpost
	end

scr_seq_T11_012:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0529_T11_00013, VAR_SPECIAL_x800C
	callstd std_signpost
	end

scr_seq_T11_013:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0529_T11_00014, VAR_SPECIAL_x800C
	callstd std_signpost
	end
	.balign 4, 0
