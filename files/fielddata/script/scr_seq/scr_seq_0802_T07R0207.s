#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T07R0207.h"
#include "msgdata/msg/msg_0507_T07R0207.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T07R0207_000
	scrdef_end

scr_seq_T07R0207_000:
	scrcmd_609
	lockall
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0058
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _002A
	end

_002A:
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_player, _0170
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	apply_movement 253, _017C
	wait_movement
	goto _0062

_0058:
	apply_movement obj_player, _0170
	wait_movement
_0062:
	scrcmd_241 16659
	copyvar VAR_SPECIAL_x8008, VAR_UNK_4113
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, _0088
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, _0098
	end

_0088:
	scrcmd_852 0, 2
	call _00A9
	goto _00B3

_0098:
	buffer_int 0, 0
	call _00A9
	goto _00EE

_00A9:
	scrcmd_242 20, 1, 16659, 16659
	return

_00B3:
	npc_msg msg_0507_T07R0207_00000
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0150
	npc_msg msg_0507_T07R0207_00003
	closemsg
	setvar VAR_UNK_4113, 65535
	scrcmd_240 379, 2, 5, 3, 1
	setvar VAR_SPECIAL_x8004, 0
	goto _0129

_00EE:
	npc_msg msg_0507_T07R0207_00001
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0150
	npc_msg msg_0507_T07R0207_00004
	closemsg
	setvar VAR_UNK_4113, 65535
	scrcmd_240 377, 1, 5, 3, 1
	setvar VAR_SPECIAL_x8004, 1
	goto _0129

_0129:
	wait_se SEQ_SE_DP_SELECT
	scrcmd_488 32772, 2
	scrcmd_241 16659
	comparevartovalue VAR_UNK_4113, 1
	gotoif ne, _014D
	npc_msg msg_0507_T07R0207_00006
	goto _0150

_014D:
	npc_msg msg_0507_T07R0207_00005
_0150:
	setvar VAR_UNK_4113, 65535
	wait 1, VAR_SPECIAL_x800C
	npc_msg msg_0507_T07R0207_00002
	waitbutton
	closemsg
	setvar VAR_UNK_4125, 1
	releaseall
	end
	.byte 0x00, 0x00, 0x00

_0170:
	step 12, 2
	step 33, 1
	step_end

_017C:
	step 15, 1
	step 12, 1
	step 1, 1
	step_end
	.balign 4, 0
