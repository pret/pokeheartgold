#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D47.h"
#include "msgdata/msg/msg_0133_D47.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D47_000
	scrdef scr_seq_D47_001
	scrdef scr_seq_D47_002
	scrdef scr_seq_D47_003
	scrdef scr_seq_D47_004
	scrdef scr_seq_D47_005
	scrdef scr_seq_D47_006
	scrdef scr_seq_D47_007
	scrdef scr_seq_D47_008
	scrdef scr_seq_D47_009
	scrdef scr_seq_D47_010
	scrdef scr_seq_D47_011
	scrdef scr_seq_D47_012
	scrdef scr_seq_D47_013
	scrdef scr_seq_D47_014
	scrdef scr_seq_D47_015
	scrdef scr_seq_D47_016
	scrdef_end

scr_seq_D47_014:
	checkflag FLAG_UNK_189
	gotoif FALSE, _0057
	clearflag FLAG_UNK_189
	end

_0057:
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif eq, _007B
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif eq, _007B
	setflag FLAG_HIDE_CAMERON
	end

_007B:
	clearflag FLAG_HIDE_CAMERON
	end

scr_seq_D47_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0133_D47_00002
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D47_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0133_D47_00003
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D47_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0133_D47_00004
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D47_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0133_D47_00005
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D47_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 39, 0
	npc_msg msg_0133_D47_00006
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D47_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_TEMP_x400B, 0
	gotoif ne, _0106
	npc_msg msg_0133_D47_00007
	goto _0109

_0106:
	npc_msg msg_0133_D47_00008
_0109:
	waitbutton
	closemsg
	releaseall
	comparevartovalue VAR_TEMP_x400B, 0
	gotoif ne, _0128
	addvar VAR_TEMP_x400B, 1
	goto _012E

_0128:
	setvar VAR_TEMP_x400B, 0
_012E:
	end

scr_seq_D47_006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0133_D47_00009
	callstd 2011
	scrcmd_054
	setvar VAR_SPECIAL_x8004, 6
	callstd 2052
	releaseall
	end

scr_seq_D47_007:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0133_D47_00010
	callstd 2011
	scrcmd_054
	setvar VAR_SPECIAL_x8004, 14
	callstd 2052
	releaseall
	end

scr_seq_D47_008:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 12, 0
	npc_msg msg_0133_D47_00011
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D47_009:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0133_D47_00012
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D47_010:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 79, 0
	npc_msg msg_0133_D47_00013
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D47_011:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 17, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_D47_012:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0133_D47_00014
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D47_013:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0307
	photo_album_is_full VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _031B
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, _0258
	apply_movement obj_player, _0330
	apply_movement obj_D47_gsmiddleman1, _037C
	goto _02A6

_0258:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _0273
	apply_movement obj_player, _0348
	goto _02A6

_0273:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, _0296
	apply_movement obj_player, _0368
	apply_movement obj_D47_gsmiddleman1, _037C
	goto _02A6

_0296:
	apply_movement obj_player, _0354
	apply_movement obj_D47_gsmiddleman1, _037C
_02A6:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _02CD
	apply_movement 253, _0388
	wait_movement
_02CD:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0x00
	wait_fade
	cameron_photo 38
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

_0307:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

_031B:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end
	.byte 0x00

_0330:
	step 15, 1
	step 12, 2
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_0348:
	step 12, 3
	step 33, 1
	step_end

_0354:
	step 12, 1
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_0368:
	step 12, 1
	step 15, 1
	step 12, 3
	step 33, 1
	step_end

_037C:
	step 63, 1
	step 32, 1
	step_end

_0388:
	step 15, 1
	step 12, 1
	step 1, 1
	step_end
scr_seq_D47_015:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0133_D47_00015
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D47_016:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0133_D47_00016
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
