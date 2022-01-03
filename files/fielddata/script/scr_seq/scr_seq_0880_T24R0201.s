#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T24R0201.h"
#include "msgdata/msg/msg_0576_T24R0201.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T24R0201_000
	scrdef_end

scr_seq_T24R0201_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0C1
	gotoif TRUE, _0037
	checkflag FLAG_UNK_0BF
	gotoif FALSE, _0042
	checkflag FLAG_UNK_ABD
	gotoif TRUE, _00A2
	goto _00AD
	.byte 0x02, 0x00
_0037:
	npc_msg msg_0576_T24R0201_00011
_003A:
	waitbutton
	closemsg
	releaseall
	end

_0042:
	npc_msg msg_0576_T24R0201_00000
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _0063
	npc_msg msg_0576_T24R0201_00004
	goto _003A

_0063:
	get_party_count VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 6
	gotoif ne, _007D
	npc_msg msg_0576_T24R0201_00003
	goto _003A

_007D:
	scrcmd_362 6, 20, 75
	npc_msg msg_0576_T24R0201_00001
	buffer_players_name 0
	npc_msg msg_0576_T24R0201_00002
	play_fanfare SEQ_ME_PT_SPECIAL
	wait_fanfare
	setflag FLAG_UNK_0BF
	setflag FLAG_UNK_ABD
	goto _003A
	.byte 0x02, 0x00
_00A2:
	npc_msg msg_0576_T24R0201_00006
	goto _003A
	.byte 0x02, 0x00
_00AD:
	npc_msg msg_0576_T24R0201_00005
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _01AA
	fade_screen 6, 1, 0, 0x00
	wait_fade
	closemsg
	scrcmd_349
	scrcmd_351 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 255
	gotoif ne, _00F2
	call _019A
	goto _01AA

_00F2:
	scrcmd_363 6, 16384, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	callif ne, _019A
	scrcmd_490 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _0120
	npc_msg msg_0576_T24R0201_00008
	goto _0192

_0120:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, _0136
	npc_msg msg_0576_T24R0201_00012
	goto _0192

_0136:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, _014C
	npc_msg msg_0576_T24R0201_00013
	goto _0192

_014C:
	comparevartovalue VAR_SPECIAL_x800C, 4
	gotoif ne, _0162
	npc_msg msg_0576_T24R0201_00014
	goto _0192

_0162:
	scrcmd_382 VAR_SPECIAL_x800C, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x800C, 149
	gotoif le, _0181
	call _019A
	goto _01B5

_0181:
	scrcmd_364 16384
	call _019A
	npc_msg msg_0576_T24R0201_00007
	setflag FLAG_UNK_0C1
_0192:
	goto _003A
	.byte 0x02, 0x00
_019A:
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
	return

_01AA:
	npc_msg msg_0576_T24R0201_00010
	goto _003A
	.byte 0x02, 0x00
_01B5:
	npc_msg msg_0576_T24R0201_00009
	setflag FLAG_UNK_0C1
	goto _003A
	.byte 0x02, 0x00
	.balign 4, 0
