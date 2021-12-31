#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T25R1203.h"
#include "msgdata/msg/msg_0602_T25R1203.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T25R1203_000
	scrdef scr_seq_T25R1203_001
	scrdef scr_seq_T25R1203_002
	scrdef scr_seq_T25R1203_003
	scrdef scr_seq_T25R1203_004
	scrdef scr_seq_T25R1203_005
	scrdef scr_seq_T25R1203_006
	scrdef scr_seq_T25R1203_007
	scrdef scr_seq_T25R1203_008
	scrdef scr_seq_T25R1203_009
	scrdef scr_seq_T25R1203_010
	scrdef scr_seq_T25R1203_011
	scrdef_end

scr_seq_T25R1203_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0602_T25R1203_00000
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T25R1203_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0602_T25R1203_00001
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T25R1203_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0602_T25R1203_00002
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T25R1203_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0602_T25R1203_00003
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T25R1203_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0602_T25R1203_00004
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T25R1203_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0602_T25R1203_00005
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T25R1203_006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0602_T25R1203_00006
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T25R1203_007:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0602_T25R1203_00007
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T25R1203_008:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0602_T25R1203_00008
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T25R1203_009:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0602_T25R1203_00009
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T25R1203_010:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0602_T25R1203_00010
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T25R1203_011:
	play_se SEQ_SE_DP_SELECT
	lockall
	setvar VAR_SPECIAL_x8005, 2
	goto _0113
	.byte 0x02, 0x00
_0113:
	npc_msg msg_0602_T25R1203_00011
	touchscreen_menu_hide
	menu_init 21, 11, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 13, 255, 0
	menu_item_add 14, 255, 1
	menu_item_add 15, 255, 2
	menu_exec
	switch VAR_SPECIAL_x800C
	case 0, _016A
	case 1, _018F
	goto _0162
	.byte 0x02, 0x00
_0162:
	touchscreen_menu_show
_0164:
	closemsg
	releaseall
	end

_016A:
	callstd 2006
	copyvar VAR_SPECIAL_x800C, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0164
	closemsg
	scrcmd_815 0
	callstd 2046
	releaseall
	end

_018F:
	npc_msg msg_0602_T25R1203_00012
	goto _0113
	.byte 0x02, 0x00, 0x00, 0x00
	.balign 4, 0
