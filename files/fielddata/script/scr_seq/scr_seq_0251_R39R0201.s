#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R39R0201.h"
#include "msgdata/msg/msg_0398_R39R0201.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R39R0201_000
	scrdef scr_seq_R39R0201_001
	scrdef scr_seq_R39R0201_002
	scrdef scr_seq_R39R0201_003
	scrdef scr_seq_R39R0201_004
	scrdef_end

scr_seq_R39R0201_004:
	scrcmd_379 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, _0047
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, _0047
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif eq, _0047
	clearflag FLAG_UNK_226
	end

_0047:
	setflag FLAG_UNK_226
	end

scr_seq_R39R0201_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_100
	gotoif TRUE, _00A2
	checkflag FLAG_UNK_0AA
	gotoif TRUE, _007E
	npc_msg msg_0398_R39R0201_00005
	closemsg
_0070:
	apply_movement obj_R39R0201_gsbabygirl1, _021C
	wait_movement
	releaseall
	end

_007E:
	npc_msg msg_0398_R39R0201_00006
	setvar VAR_SPECIAL_x8004, 434
	setvar VAR_SPECIAL_x8005, 1
	callstd std_give_item_verbose
	npc_msg msg_0398_R39R0201_00007
	closemsg
	setflag FLAG_UNK_100
	goto _0070
	.byte 0x02, 0x00
_00A2:
	npc_msg msg_0398_R39R0201_00008
	closemsg
	goto _0070
	.byte 0x02, 0x00
scr_seq_R39R0201_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_101
	gotoif TRUE, _00E0
	checkflag FLAG_UNK_0AA
	gotoif TRUE, _00FA
	npc_msg msg_0398_R39R0201_00000
	closemsg
_00D2:
	apply_movement obj_R39R0201_gsbabygirl1_2, _0224
	wait_movement
	releaseall
	end

_00E0:
	npc_msg msg_0398_R39R0201_00004
	closemsg
	goto _00D2
	.byte 0x02, 0x00
_00ED:
	npc_msg msg_0398_R39R0201_00002
	closemsg
	goto _00D2
	.byte 0x02, 0x00
_00FA:
	checkflag FLAG_UNK_100
	gotoif FALSE, _00ED
	npc_msg msg_0398_R39R0201_00001
	setvar VAR_SPECIAL_x8004, 29
	setvar VAR_SPECIAL_x8005, 34
	setvar VAR_SPECIAL_x8006, 39
	scrcmd_133 32772, 32780
	comparevartovalue VAR_SPECIAL_x800C, 99
	gotoif eq, _020C
	scrcmd_133 32773, 32780
	comparevartovalue VAR_SPECIAL_x800C, 99
	gotoif eq, _020C
	scrcmd_133 32774, 32780
	comparevartovalue VAR_SPECIAL_x800C, 99
	gotoif eq, _020C
	setvar VAR_SPECIAL_x8000, 3
	setvar VAR_SPECIAL_x8001, 3
	setvar VAR_SPECIAL_x8002, 3
	scrcmd_133 32772, 32780
	comparevartovalue VAR_SPECIAL_x800C, 96
	gotoif le, _01C2
	subvar VAR_SPECIAL_x800C, 96
	subvar VAR_SPECIAL_x8000, VAR_SPECIAL_x800C
	scrcmd_133 32773, 32780
	comparevartovalue VAR_SPECIAL_x800C, 96
	gotoif le, _01C2
	subvar VAR_SPECIAL_x800C, 96
	subvar VAR_SPECIAL_x8001, VAR_SPECIAL_x800C
	scrcmd_133 32774, 32780
	comparevartovalue VAR_SPECIAL_x800C, 96
	gotoif le, _01C2
	subvar VAR_SPECIAL_x800C, 96
	subvar VAR_SPECIAL_x8002, VAR_SPECIAL_x800C
_01C2:
	scrcmd_134 32772, 32768
	scrcmd_134 32773, 32769
	scrcmd_134 32774, 32770
	buffer_seal_name_plural 0, VAR_SPECIAL_x8004
	npc_msg msg_0398_R39R0201_00020
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	buffer_seal_name_plural 0, VAR_SPECIAL_x8005
	npc_msg msg_0398_R39R0201_00020
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	buffer_seal_name_plural 0, VAR_SPECIAL_x8006
	npc_msg msg_0398_R39R0201_00020
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	closemsg
	setflag FLAG_UNK_101
	goto _00D2
	.byte 0x02, 0x00
_020C:
	npc_msg msg_0398_R39R0201_00003
	closemsg
	goto _00D2
	.byte 0x02, 0x00, 0x00, 0x00, 0x00

_021C:
	step 35, 1
	step_end

_0224:
	step 34, 1
	step_end
scr_seq_R39R0201_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0AA
	gotoif TRUE, _0354
	play_cry SPECIES_MILTANK, 11
	npc_msg msg_0398_R39R0201_00009
	wait_cry
	checkflag FLAG_UNK_0A8
	gotoif TRUE, _0260
	npc_msg msg_0398_R39R0201_00010
	waitbutton
	closemsg
	releaseall
	end

_0260:
	npc_msg msg_0398_R39R0201_00010
	scrcmd_049
	npc_msg msg_0398_R39R0201_00013
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _028C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0378
	end

_028C:
	setvar VAR_SPECIAL_x8004, 155
	setvar VAR_SPECIAL_x8005, 1
	hasitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _036A
	takeitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	buffer_players_name 0
	npc_msg msg_0398_R39R0201_00014
	waitbutton
	closemsg
	checkflag FLAG_UNK_0B0
	gotoif TRUE, _033F
	checkflag FLAG_UNK_0AF
	gotoif TRUE, _0337
	checkflag FLAG_UNK_0AE
	gotoif TRUE, _0328
	checkflag FLAG_UNK_0AD
	gotoif TRUE, _0320
	checkflag FLAG_UNK_0AC
	gotoif TRUE, _0311
	checkflag FLAG_UNK_0A9
	gotoif TRUE, _0309
	setflag FLAG_UNK_0A9
	releaseall
	end

_0309:
	setflag FLAG_UNK_0AC
	releaseall
	end

_0311:
	setflag FLAG_UNK_0AD
	npc_msg msg_0398_R39R0201_00015
	waitbutton
	closemsg
	releaseall
	end

_0320:
	setflag FLAG_UNK_0AE
	releaseall
	end

_0328:
	setflag FLAG_UNK_0AF
	npc_msg msg_0398_R39R0201_00016
	waitbutton
	closemsg
	releaseall
	end

_0337:
	setflag FLAG_UNK_0B0
	releaseall
	end

_033F:
	play_fanfare SEQ_ME_ASA
	wait_fanfare
	npc_msg msg_0398_R39R0201_00017
	waitbutton
	closemsg
	setflag FLAG_UNK_0AA
	releaseall
	end

_0354:
	play_cry SPECIES_MILTANK, 0
	npc_msg msg_0398_R39R0201_00011
	wait_cry
	npc_msg msg_0398_R39R0201_00012
	waitbutton
	closemsg
	releaseall
	end

_036A:
	buffer_players_name 0
	npc_msg msg_0398_R39R0201_00018
	waitbutton
	closemsg
	releaseall
	end

_0378:
	buffer_players_name 0
	npc_msg msg_0398_R39R0201_00019
	waitbutton
	closemsg
	releaseall
	end

scr_seq_R39R0201_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	play_cry SPECIES_MILTANK, 0
	npc_msg msg_0398_R39R0201_00011
	wait_cry
	npc_msg msg_0398_R39R0201_00012
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
