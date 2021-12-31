#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T07R0206.h"
#include "msgdata/msg/msg_0506_T07R0206.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T07R0206_000
	scrdef_end

scr_seq_T07R0206_000:
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
	apply_movement obj_player, _0340
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	apply_movement obj_partner_poke, _034C
	wait_movement
	goto _0062

_0058:
	apply_movement obj_player, _0340
	wait_movement
_0062:
	scrcmd_241 16659
	copyvar VAR_SPECIAL_x8008, VAR_UNK_4113
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, _0095
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, _00A0
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, _00AA
	end

_0095:
	buffer_int 0, 0
	goto _00B4

_00A0:
	scrcmd_852 0, 3
	goto _00B4

_00AA:
	scrcmd_852 0, 1
	goto _00B4

_00B4:
	scrcmd_242 20, 1, 16659, 16659
	npc_msg msg_0506_T07R0206_00000
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 116, 255, 0
	menu_item_add 118, 255, 1
	menu_item_add 125, 255, 2
	menu_item_add 126, 255, 3
	menu_exec
	touchscreen_menu_show
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, _0120
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, _019B
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, _0216
	goto _0322

_0120:
	wait 1, VAR_SPECIAL_x800C
	scrcmd_241 16659
	scrcmd_240 376, 2, 5, 3, 1
	comparevartovalue VAR_UNK_4113, 0
	gotoif eq, _0305
	comparevartovalue VAR_UNK_4113, 0
	callif gt, _029C
	comparevartovalue VAR_UNK_4113, 0
	callif lt, _0291
	comparevartovalue VAR_UNK_4113, 2
	gotoif ne, _0176
	setvar VAR_SPECIAL_x8005, 2
	goto _0189

_0176:
	comparevartovalue VAR_UNK_4113, 3
	gotoif ne, _0189
	setvar VAR_SPECIAL_x8005, 3
_0189:
	call _02A7
	setvar VAR_UNK_4113, 0
	goto _02BB

_019B:
	wait 1, VAR_SPECIAL_x800C
	scrcmd_241 16659
	scrcmd_240 378, 0, 5, 3, 1
	comparevartovalue VAR_UNK_4113, 2
	gotoif eq, _0305
	comparevartovalue VAR_UNK_4113, 2
	callif gt, _029C
	comparevartovalue VAR_UNK_4113, 2
	callif lt, _0291
	comparevartovalue VAR_UNK_4113, 0
	gotoif ne, _01F1
	setvar VAR_SPECIAL_x8005, 2
	goto _0204

_01F1:
	comparevartovalue VAR_UNK_4113, 3
	gotoif ne, _0204
	setvar VAR_SPECIAL_x8005, 1
_0204:
	call _02A7
	setvar VAR_UNK_4113, 2
	goto _02BB

_0216:
	wait 1, VAR_SPECIAL_x800C
	scrcmd_241 16659
	scrcmd_240 379, 1, 5, 3, 1
	comparevartovalue VAR_UNK_4113, 3
	gotoif eq, _0305
	comparevartovalue VAR_UNK_4113, 3
	callif gt, _029C
	comparevartovalue VAR_UNK_4113, 3
	callif lt, _0291
	comparevartovalue VAR_UNK_4113, 0
	gotoif ne, _026C
	setvar VAR_SPECIAL_x8005, 3
	goto _027F

_026C:
	comparevartovalue VAR_UNK_4113, 2
	gotoif ne, _027F
	setvar VAR_SPECIAL_x8005, 1
_027F:
	call _02A7
	setvar VAR_UNK_4113, 3
	goto _02BB

_0291:
	npc_msg msg_0506_T07R0206_00002
	setvar VAR_SPECIAL_x8004, 0
	return

_029C:
	npc_msg msg_0506_T07R0206_00003
	setvar VAR_SPECIAL_x8004, 1
	return

_02A7:
	setvar VAR_UNK_4113, 65535
	closemsg
	wait_se SEQ_SE_DP_SELECT
	scrcmd_488 32772, 32773
	return

_02BB:
	copyvar VAR_SPECIAL_x8008, VAR_UNK_4113
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, _02EA
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, _02F3
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, _02FC
	end

_02EA:
	npc_msg msg_0506_T07R0206_00007
	goto _032E

_02F3:
	npc_msg msg_0506_T07R0206_00006
	goto _032E

_02FC:
	npc_msg msg_0506_T07R0206_00005
	goto _032E

_0305:
	setvar VAR_UNK_4113, 65535
	wait 1, VAR_SPECIAL_x800C
	npc_msg msg_0506_T07R0206_00004
	waitbutton
	closemsg
	setvar VAR_UNK_4125, 1
	releaseall
	end

_0322:
	setvar VAR_UNK_4113, 65535
	wait 1, VAR_SPECIAL_x800C
_032E:
	npc_msg msg_0506_T07R0206_00001
	waitbutton
	closemsg
	setvar VAR_UNK_4125, 1
	releaseall
	end
	.byte 0x00

_0340:
	step 12, 2
	step 33, 1
	step_end

_034C:
	step 15, 1
	step 12, 1
	step 1, 1
	step_end
	.balign 4, 0
