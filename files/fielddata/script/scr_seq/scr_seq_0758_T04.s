#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T04.h"
#include "msgdata/msg/msg_0467_T04.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T04_000
	scrdef scr_seq_T04_001
	scrdef scr_seq_T04_002
	scrdef scr_seq_T04_003
	scrdef scr_seq_T04_004
	scrdef scr_seq_T04_005
	scrdef scr_seq_T04_006
	scrdef scr_seq_T04_007
	scrdef scr_seq_T04_008
	scrdef scr_seq_T04_009
	scrdef scr_seq_T04_010
	scrdef scr_seq_T04_011
	scrdef scr_seq_T04_012
	scrdef scr_seq_T04_013
	scrdef_end

scr_seq_T04_012:
	checkflag FLAG_UNK_189
	gotoif FALSE, _004B
	clearflag FLAG_UNK_189
	end

_004B:
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif eq, _006F
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, _006F
	setflag FLAG_HIDE_CAMERON
	end

_006F:
	clearflag FLAG_HIDE_CAMERON
	end

scr_seq_T04_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_118
	gotoif TRUE, _0093
	npc_msg msg_0467_T04_00000
	waitbutton
	closemsg
	releaseall
	end

_0093:
	npc_msg msg_0467_T04_00001
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T04_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0467_T04_00002
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T04_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0467_T04_00005
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T04_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0467_T04_00003
	scrcmd_076 80, 0
	scrcmd_077
	npc_msg msg_0467_T04_00004
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T04_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4087, 3
	gotoif ge, _012C
	comparevartovalue VAR_UNK_411C, 2
	gotoif eq, _0123
	comparevartovalue VAR_UNK_411C, 1
	gotoif eq, _011A
	npc_msg msg_0467_T04_00006
	goto _012F

_011A:
	npc_msg msg_0467_T04_00007
	goto _012F

_0123:
	npc_msg msg_0467_T04_00008
	goto _012F

_012C:
	npc_msg msg_0467_T04_00009
_012F:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T04_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0467_T04_00010
	npc_msg msg_0467_T04_00011
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T04_013:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0467_T04_00012
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T04_006:
	scrcmd_055 13, 0, 4, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_T04_007:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 14, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_T04_008:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 15, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_T04_009:
	scrcmd_056 3, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 16, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_T04_010:
	scrcmd_055 17, 1, 14, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_T04_011:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _02F5
	photo_album_is_full VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0309
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, _0246
	apply_movement obj_player, _0320
	apply_movement obj_T04_gsmiddleman1, _036C
	goto _0294

_0246:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _0261
	apply_movement obj_player, _0338
	goto _0294

_0261:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, _0284
	apply_movement obj_player, _0358
	apply_movement obj_T04_gsmiddleman1, _036C
	goto _0294

_0284:
	apply_movement obj_player, _0344
	apply_movement obj_T04_gsmiddleman1, _036C
_0294:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _02BB
	apply_movement 253, _0378
	wait_movement
_02BB:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0x00
	wait_fade
	cameron_photo 55
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

_02F5:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

_0309:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end
	.byte 0x00, 0x00, 0x00

_0320:
	step 15, 1
	step 12, 2
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_0338:
	step 12, 3
	step 33, 1
	step_end

_0344:
	step 12, 1
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_0358:
	step 12, 1
	step 15, 1
	step 12, 3
	step 33, 1
	step_end

_036C:
	step 63, 1
	step 32, 1
	step_end

_0378:
	step 15, 1
	step 12, 1
	step 1, 1
	step_end
	.balign 4, 0
