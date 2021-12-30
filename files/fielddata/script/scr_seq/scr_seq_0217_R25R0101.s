#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0217_R25R0101_0006 ; 000
	scrdef_end

scr_seq_0217_R25R0101_0006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_14E
	gotoif TRUE, scr_seq_0217_R25R0101_0020
	npc_msg 0
	setflag FLAG_UNK_14E
scr_seq_0217_R25R0101_0020:
	scrcmd_495 VAR_SPECIAL_x8002
	comparevartovalue VAR_SPECIAL_x8002, 8
	gotoif ne, scr_seq_0217_R25R0101_0037
	goto scr_seq_0217_R25R0101_00B1

scr_seq_0217_R25R0101_0037:
	comparevartovalue VAR_UNK_412D, 0
	gotoif ne, scr_seq_0217_R25R0101_004D
	npc_msg 1
	goto scr_seq_0217_R25R0101_00AB

scr_seq_0217_R25R0101_004D:
	comparevartovalue VAR_UNK_412D, 1
	gotoif ne, scr_seq_0217_R25R0101_0063
	npc_msg 2
	goto scr_seq_0217_R25R0101_00AB

scr_seq_0217_R25R0101_0063:
	comparevartovalue VAR_UNK_412D, 2
	gotoif ne, scr_seq_0217_R25R0101_0079
	npc_msg 3
	goto scr_seq_0217_R25R0101_00AB

scr_seq_0217_R25R0101_0079:
	comparevartovalue VAR_UNK_412D, 3
	gotoif ne, scr_seq_0217_R25R0101_008F
	npc_msg 4
	goto scr_seq_0217_R25R0101_00AB

scr_seq_0217_R25R0101_008F:
	comparevartovalue VAR_UNK_412D, 4
	gotoif ne, scr_seq_0217_R25R0101_00A5
	npc_msg 5
	goto scr_seq_0217_R25R0101_00AB

scr_seq_0217_R25R0101_00A5:
	goto scr_seq_0217_R25R0101_0484

scr_seq_0217_R25R0101_00AB:
	goto scr_seq_0217_R25R0101_0125

scr_seq_0217_R25R0101_00B1:
	comparevartovalue VAR_UNK_412D, 0
	gotoif ne, scr_seq_0217_R25R0101_00C7
	npc_msg 6
	goto scr_seq_0217_R25R0101_0125

scr_seq_0217_R25R0101_00C7:
	comparevartovalue VAR_UNK_412D, 1
	gotoif ne, scr_seq_0217_R25R0101_00DD
	npc_msg 7
	goto scr_seq_0217_R25R0101_0125

scr_seq_0217_R25R0101_00DD:
	comparevartovalue VAR_UNK_412D, 2
	gotoif ne, scr_seq_0217_R25R0101_00F3
	npc_msg 8
	goto scr_seq_0217_R25R0101_0125

scr_seq_0217_R25R0101_00F3:
	comparevartovalue VAR_UNK_412D, 3
	gotoif ne, scr_seq_0217_R25R0101_0109
	npc_msg 9
	goto scr_seq_0217_R25R0101_0125

scr_seq_0217_R25R0101_0109:
	comparevartovalue VAR_UNK_412D, 4
	gotoif ne, scr_seq_0217_R25R0101_011F
	npc_msg 10
	goto scr_seq_0217_R25R0101_0125

scr_seq_0217_R25R0101_011F:
	goto scr_seq_0217_R25R0101_0484

scr_seq_0217_R25R0101_0125:
	npc_msg 11
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0217_R25R0101_048D
	npc_msg 12
	closemsg
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_349
	scrcmd_351 32768
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
	comparevartovalue VAR_SPECIAL_x8000, 255
	gotoif eq, scr_seq_0217_R25R0101_048D
	get_partymon_species VAR_SPECIAL_x8000, VAR_SPECIAL_x8001
	comparevartovalue VAR_SPECIAL_x8002, 8
	gotoif ne, scr_seq_0217_R25R0101_0188
	goto scr_seq_0217_R25R0101_02F0

scr_seq_0217_R25R0101_0188:
	copyvar VAR_SPECIAL_x8008, VAR_UNK_412D
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0217_R25R0101_01C8
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0217_R25R0101_01E4
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0217_R25R0101_0200
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0217_R25R0101_021C
	goto scr_seq_0217_R25R0101_0238

scr_seq_0217_R25R0101_01C8:
	comparevartovalue VAR_SPECIAL_x8001, 43
	gotoif eq, scr_seq_0217_R25R0101_01DE
	npc_msg 14
	goto scr_seq_0217_R25R0101_0490

scr_seq_0217_R25R0101_01DE:
	goto scr_seq_0217_R25R0101_024E

scr_seq_0217_R25R0101_01E4:
	comparevartovalue VAR_SPECIAL_x8001, 58
	gotoif eq, scr_seq_0217_R25R0101_01FA
	npc_msg 14
	goto scr_seq_0217_R25R0101_0490

scr_seq_0217_R25R0101_01FA:
	goto scr_seq_0217_R25R0101_024E

scr_seq_0217_R25R0101_0200:
	comparevartovalue VAR_SPECIAL_x8001, 39
	gotoif eq, scr_seq_0217_R25R0101_0216
	npc_msg 14
	goto scr_seq_0217_R25R0101_0490

scr_seq_0217_R25R0101_0216:
	goto scr_seq_0217_R25R0101_024E

scr_seq_0217_R25R0101_021C:
	comparevartovalue VAR_SPECIAL_x8001, 172
	gotoif eq, scr_seq_0217_R25R0101_0232
	npc_msg 14
	goto scr_seq_0217_R25R0101_0490

scr_seq_0217_R25R0101_0232:
	goto scr_seq_0217_R25R0101_024E

scr_seq_0217_R25R0101_0238:
	comparevartovalue VAR_SPECIAL_x8001, 183
	gotoif eq, scr_seq_0217_R25R0101_024E
	npc_msg 14
	goto scr_seq_0217_R25R0101_0490

scr_seq_0217_R25R0101_024E:
	buffer_mon_species_name 0, VAR_SPECIAL_x8000
	npc_msg 15
	copyvar VAR_SPECIAL_x8008, VAR_UNK_412D
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0217_R25R0101_0296
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0217_R25R0101_02A8
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0217_R25R0101_02BA
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0217_R25R0101_02CC
	goto scr_seq_0217_R25R0101_02DE

scr_seq_0217_R25R0101_0296:
	setvar VAR_SPECIAL_x8004, 85
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0217_R25R0101_0452

scr_seq_0217_R25R0101_02A8:
	setvar VAR_SPECIAL_x8004, 82
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0217_R25R0101_0452

scr_seq_0217_R25R0101_02BA:
	setvar VAR_SPECIAL_x8004, 229
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0217_R25R0101_0452

scr_seq_0217_R25R0101_02CC:
	setvar VAR_SPECIAL_x8004, 83
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0217_R25R0101_0452

scr_seq_0217_R25R0101_02DE:
	setvar VAR_SPECIAL_x8004, 84
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0217_R25R0101_0452

scr_seq_0217_R25R0101_02F0:
	copyvar VAR_SPECIAL_x8008, VAR_UNK_412D
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0217_R25R0101_0330
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0217_R25R0101_034C
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0217_R25R0101_0368
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0217_R25R0101_0384
	goto scr_seq_0217_R25R0101_03A0

scr_seq_0217_R25R0101_0330:
	comparevartovalue VAR_SPECIAL_x8001, 108
	gotoif eq, scr_seq_0217_R25R0101_0346
	npc_msg 14
	goto scr_seq_0217_R25R0101_0490

scr_seq_0217_R25R0101_0346:
	goto scr_seq_0217_R25R0101_03B6

scr_seq_0217_R25R0101_034C:
	comparevartovalue VAR_SPECIAL_x8001, 43
	gotoif eq, scr_seq_0217_R25R0101_0362
	npc_msg 14
	goto scr_seq_0217_R25R0101_0490

scr_seq_0217_R25R0101_0362:
	goto scr_seq_0217_R25R0101_03B6

scr_seq_0217_R25R0101_0368:
	comparevartovalue VAR_SPECIAL_x8001, 120
	gotoif eq, scr_seq_0217_R25R0101_037E
	npc_msg 14
	goto scr_seq_0217_R25R0101_0490

scr_seq_0217_R25R0101_037E:
	goto scr_seq_0217_R25R0101_03B6

scr_seq_0217_R25R0101_0384:
	comparevartovalue VAR_SPECIAL_x8001, 37
	gotoif eq, scr_seq_0217_R25R0101_039A
	npc_msg 14
	goto scr_seq_0217_R25R0101_0490

scr_seq_0217_R25R0101_039A:
	goto scr_seq_0217_R25R0101_03B6

scr_seq_0217_R25R0101_03A0:
	comparevartovalue VAR_SPECIAL_x8001, 172
	gotoif eq, scr_seq_0217_R25R0101_03B6
	npc_msg 14
	goto scr_seq_0217_R25R0101_0490

scr_seq_0217_R25R0101_03B6:
	buffer_mon_species_name 0, VAR_SPECIAL_x8000
	npc_msg 15
	copyvar VAR_SPECIAL_x8008, VAR_UNK_412D
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0217_R25R0101_03FE
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0217_R25R0101_0410
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0217_R25R0101_0422
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0217_R25R0101_0434
	goto scr_seq_0217_R25R0101_0446

scr_seq_0217_R25R0101_03FE:
	setvar VAR_SPECIAL_x8004, 229
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0217_R25R0101_0452

scr_seq_0217_R25R0101_0410:
	setvar VAR_SPECIAL_x8004, 85
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0217_R25R0101_0452

scr_seq_0217_R25R0101_0422:
	setvar VAR_SPECIAL_x8004, 84
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0217_R25R0101_0452

scr_seq_0217_R25R0101_0434:
	setvar VAR_SPECIAL_x8004, 82
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0217_R25R0101_0452

scr_seq_0217_R25R0101_0446:
	setvar VAR_SPECIAL_x8004, 83
	setvar VAR_SPECIAL_x8005, 1
scr_seq_0217_R25R0101_0452:
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0217_R25R0101_047A
	callstd std_give_item_verbose
	addvar VAR_UNK_412D, 1
	npc_msg 16
	goto scr_seq_0217_R25R0101_0490

scr_seq_0217_R25R0101_047A:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

scr_seq_0217_R25R0101_0484:
	npc_msg 17
	goto scr_seq_0217_R25R0101_0490

scr_seq_0217_R25R0101_048D:
	npc_msg 13
scr_seq_0217_R25R0101_0490:
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
