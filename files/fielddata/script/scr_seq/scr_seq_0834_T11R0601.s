#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T11R0601.h"
#include "msgdata/msg/msg_0535_T11R0601.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T11R0601_000
	scrdef scr_seq_T11R0601_001
	scrdef scr_seq_T11R0601_002
	scrdef scr_seq_T11R0601_003
	scrdef scr_seq_T11R0601_004
	scrdef scr_seq_T11R0601_005
	scrdef scr_seq_T11R0601_006
	scrdef scr_seq_T11R0601_007
	scrdef scr_seq_T11R0601_008
	scrdef_end

scr_seq_T11R0601_006:
	scrcmd_582 76, 1290, 209
	checkflag FLAG_UNK_118
	gotoif TRUE, _003F
	goto _0045

_003F:
	setvar VAR_UNK_411D, 0
_0045:
	setflag FLAG_UNK_2F7
	scrcmd_147 36, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif eq, _007E
	get_phone_book_rematch 36, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, _007E
	checkflag FLAG_UNK_162
	gotoif TRUE, _007E
	clearflag FLAG_UNK_2F7
_007E:
	end

scr_seq_T11R0601_005:
	checkflag FLAG_UNK_118
	gotoif TRUE, _008D
	end

_008D:
	move_person 0, 12, 0, 7, 3
	end

scr_seq_T11R0601_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_118
	gotoif TRUE, _00B9
	npc_msg msg_0535_T11R0601_00000
	waitbutton
	closemsg
	releaseall
	end

_00B9:
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, _00D7
	npc_msg msg_0535_T11R0601_00005
	waitbutton
	closemsg
	goto _00E6

_00D7:
	npc_msg msg_0535_T11R0601_00007
	closemsg
	apply_movement obj_T11R0601_policeman, _00EC
	wait_movement
_00E6:
	releaseall
	end
	.byte 0x00, 0x00

_00EC:
	step 3, 1
	step_end
scr_seq_T11R0601_004:
	scrcmd_609
	lockall
	apply_movement obj_player, _017C
	wait_movement
	checkflag FLAG_UNK_123
	gotoif TRUE, _0158
	npc_msg msg_0535_T11R0601_00001
	closemsg
	setflag FLAG_UNK_123
_0116:
	wait 50, VAR_SPECIAL_x8004
	hasitem ITEM_PASS, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, _0163
	npc_msg msg_0535_T11R0601_00002
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_player, _0184
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	releaseall
	end

_0158:
	npc_msg msg_0535_T11R0601_00003
	closemsg
	goto _0116

_0163:
	npc_msg msg_0535_T11R0601_00004
	waitbutton
	closemsg
	setvar VAR_UNK_411D, 1
	setvar VAR_UNK_411F, 1
	releaseall
	end
	.byte 0x00, 0x00

_017C:
	step 34, 1
	step_end

_0184:
	step 13, 2
	step_end
scr_seq_T11R0601_007:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0535_T11R0601_00012
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _024F
	npc_msg msg_0535_T11R0601_00014
	closemsg
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_566
	scrcmd_351 32780
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, _024F
	scrcmd_470 10
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	get_partymon_species VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	scrcmd_472 32780
	comparevartovar VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	gotoif ne, _0242
	scrcmd_473 32772
	scrcmd_474
	setflag FLAG_UNK_162
	npc_msg msg_0535_T11R0601_00016
	closemsg
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, _022C
	apply_movement obj_T11R0601_gsleader9, _025C
	goto _0234

_022C:
	apply_movement obj_T11R0601_gsleader9, _0268
_0234:
	wait_movement
	hide_person 4
	setflag FLAG_UNK_2F7
	releaseall
	end

_0242:
	scrcmd_474
	npc_msg msg_0535_T11R0601_00017
	waitbutton
	closemsg
	releaseall
	end

_024F:
	npc_msg msg_0535_T11R0601_00015
	waitbutton
	closemsg
	releaseall
	end
	.byte 0x00, 0x00

_025C:
	step 78, 5
	step 77, 10
	step_end

_0268:
	step 77, 10
	step_end
scr_seq_T11R0601_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_118
	gotoif TRUE, _028E
	npc_msg msg_0535_T11R0601_00008
	waitbutton
	closemsg
	releaseall
	end

_028E:
	npc_msg msg_0535_T11R0601_00009
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T11R0601_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0535_T11R0601_00010
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T11R0601_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0535_T11R0601_00011
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T11R0601_008:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0535_T11R0601_00018
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
