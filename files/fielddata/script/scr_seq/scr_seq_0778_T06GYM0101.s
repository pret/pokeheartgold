#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0778_T06GYM0101_0177 ; 000
	scrdef scr_seq_0778_T06GYM0101_0184 ; 001
	scrdef scr_seq_0778_T06GYM0101_0191 ; 002
	scrdef scr_seq_0778_T06GYM0101_019E ; 003
	scrdef scr_seq_0778_T06GYM0101_01AB ; 004
	scrdef scr_seq_0778_T06GYM0101_01B8 ; 005
	scrdef scr_seq_0778_T06GYM0101_01C5 ; 006
	scrdef scr_seq_0778_T06GYM0101_01D2 ; 007
	scrdef scr_seq_0778_T06GYM0101_01DF ; 008
	scrdef scr_seq_0778_T06GYM0101_01EC ; 009
	scrdef scr_seq_0778_T06GYM0101_01F9 ; 010
	scrdef scr_seq_0778_T06GYM0101_0206 ; 011
	scrdef scr_seq_0778_T06GYM0101_0213 ; 012
	scrdef scr_seq_0778_T06GYM0101_0220 ; 013
	scrdef scr_seq_0778_T06GYM0101_022D ; 014
	scrdef scr_seq_0778_T06GYM0101_02F6 ; 015
	scrdef scr_seq_0778_T06GYM0101_02F8 ; 016
	scrdef scr_seq_0778_T06GYM0101_02FA ; 017
	scrdef scr_seq_0778_T06GYM0101_02FC ; 018
	scrdef scr_seq_0778_T06GYM0101_02FE ; 019
	scrdef scr_seq_0778_T06GYM0101_0300 ; 020
	scrdef scr_seq_0778_T06GYM0101_006A ; 021
	scrdef scr_seq_0778_T06GYM0101_0150 ; 022
	scrdef scr_seq_0778_T06GYM0101_0302 ; 023
	scrdef scr_seq_0778_T06GYM0101_03E3 ; 024
	scrdef scr_seq_0778_T06GYM0101_0414 ; 025
	scrdef_end

scr_seq_0778_T06GYM0101_006A:
	checkflag FLAG_UNK_31A
	gotoif TRUE, scr_seq_0778_T06GYM0101_0079
	clearflag FLAG_UNK_9A6
scr_seq_0778_T06GYM0101_0079:
	scrcmd_320
	scrcmd_142 36, 16385
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_0778_T06GYM0101_014A
	checkflag FLAG_UNK_14A
	gotoif FALSE, scr_seq_0778_T06GYM0101_0144
	scrcmd_147 36, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0778_T06GYM0101_00FB
	scrcmd_522 16384
	comparevartovalue VAR_TEMP_x4000, 9
	gotoif ne, scr_seq_0778_T06GYM0101_00C7
	setflag FLAG_UNK_2F0
	goto scr_seq_0778_T06GYM0101_00F9

scr_seq_0778_T06GYM0101_00C7:
	comparevartovalue VAR_TEMP_x4000, 10
	gotoif ne, scr_seq_0778_T06GYM0101_00DE
	setflag FLAG_UNK_2F0
	goto scr_seq_0778_T06GYM0101_00F9

scr_seq_0778_T06GYM0101_00DE:
	comparevartovalue VAR_TEMP_x4000, 11
	gotoif ne, scr_seq_0778_T06GYM0101_00F5
	setflag FLAG_UNK_2F0
	goto scr_seq_0778_T06GYM0101_00F9

scr_seq_0778_T06GYM0101_00F5:
	clearflag FLAG_UNK_2F0
scr_seq_0778_T06GYM0101_00F9:
	end

scr_seq_0778_T06GYM0101_00FB:
	checkflag FLAG_UNK_162
	gotoif TRUE, scr_seq_0778_T06GYM0101_010C
	setflag FLAG_UNK_2F0
	end

scr_seq_0778_T06GYM0101_010C:
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif ne, scr_seq_0778_T06GYM0101_0127
	setflag FLAG_UNK_2F0
	goto scr_seq_0778_T06GYM0101_0142

scr_seq_0778_T06GYM0101_0127:
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif ne, scr_seq_0778_T06GYM0101_013E
	setflag FLAG_UNK_2F0
	goto scr_seq_0778_T06GYM0101_0142

scr_seq_0778_T06GYM0101_013E:
	clearflag FLAG_UNK_2F0
scr_seq_0778_T06GYM0101_0142:
	end

scr_seq_0778_T06GYM0101_0144:
	clearflag FLAG_UNK_2F0
	end

scr_seq_0778_T06GYM0101_014A:
	setflag FLAG_UNK_2F0
	end

scr_seq_0778_T06GYM0101_0150:
	checkflag FLAG_UNK_31A
	gotoif TRUE, scr_seq_0778_T06GYM0101_0175
	scrcmd_375 0
	scrcmd_375 1
	scrcmd_375 2
	scrcmd_375 3
	scrcmd_375 4
	scrcmd_375 5
	end

scr_seq_0778_T06GYM0101_0175:
	end

scr_seq_0778_T06GYM0101_0177:
	scrcmd_322 0, 32780
	goto scr_seq_0778_T06GYM0101_023A

scr_seq_0778_T06GYM0101_0182:
	.byte 0x02, 0x00
scr_seq_0778_T06GYM0101_0184:
	scrcmd_322 1, 32780
	goto scr_seq_0778_T06GYM0101_023A

scr_seq_0778_T06GYM0101_018F:
	.byte 0x02
	.byte 0x00
scr_seq_0778_T06GYM0101_0191:
	scrcmd_322 2, 32780
	goto scr_seq_0778_T06GYM0101_023A

scr_seq_0778_T06GYM0101_019C:
	.byte 0x02, 0x00
scr_seq_0778_T06GYM0101_019E:
	scrcmd_322 3, 32780
	goto scr_seq_0778_T06GYM0101_023A

scr_seq_0778_T06GYM0101_01A9:
	.byte 0x02, 0x00
scr_seq_0778_T06GYM0101_01AB:
	scrcmd_322 4, 32780
	goto scr_seq_0778_T06GYM0101_023A

scr_seq_0778_T06GYM0101_01B6:
	.byte 0x02, 0x00
scr_seq_0778_T06GYM0101_01B8:
	scrcmd_322 5, 32780
	goto scr_seq_0778_T06GYM0101_023A

scr_seq_0778_T06GYM0101_01C3:
	.byte 0x02, 0x00
scr_seq_0778_T06GYM0101_01C5:
	scrcmd_322 6, 32780
	goto scr_seq_0778_T06GYM0101_023A

scr_seq_0778_T06GYM0101_01D0:
	.byte 0x02, 0x00
scr_seq_0778_T06GYM0101_01D2:
	scrcmd_322 7, 32780
	goto scr_seq_0778_T06GYM0101_023A

scr_seq_0778_T06GYM0101_01DD:
	.byte 0x02, 0x00
scr_seq_0778_T06GYM0101_01DF:
	scrcmd_322 8, 32780
	goto scr_seq_0778_T06GYM0101_023A

scr_seq_0778_T06GYM0101_01EA:
	.byte 0x02, 0x00
scr_seq_0778_T06GYM0101_01EC:
	scrcmd_322 9, 32780
	goto scr_seq_0778_T06GYM0101_023A

scr_seq_0778_T06GYM0101_01F7:
	.byte 0x02, 0x00
scr_seq_0778_T06GYM0101_01F9:
	scrcmd_322 10, 32780
	goto scr_seq_0778_T06GYM0101_023A

scr_seq_0778_T06GYM0101_0204:
	.byte 0x02, 0x00
scr_seq_0778_T06GYM0101_0206:
	scrcmd_322 11, 32780
	goto scr_seq_0778_T06GYM0101_023A

scr_seq_0778_T06GYM0101_0211:
	.byte 0x02, 0x00
scr_seq_0778_T06GYM0101_0213:
	scrcmd_322 12, 32780
	goto scr_seq_0778_T06GYM0101_023A

scr_seq_0778_T06GYM0101_021E:
	.byte 0x02, 0x00
scr_seq_0778_T06GYM0101_0220:
	scrcmd_322 13, 32780
	goto scr_seq_0778_T06GYM0101_023A

scr_seq_0778_T06GYM0101_022B:
	.byte 0x02, 0x00
scr_seq_0778_T06GYM0101_022D:
	scrcmd_322 14, 32780
	goto scr_seq_0778_T06GYM0101_023A

scr_seq_0778_T06GYM0101_0238:
	.byte 0x02, 0x00
scr_seq_0778_T06GYM0101_023A:
	comparevartovalue VAR_SPECIAL_x800C, 4
	gotoif eq, scr_seq_0778_T06GYM0101_027D
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, scr_seq_0778_T06GYM0101_02AA
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0778_T06GYM0101_028E
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, scr_seq_0778_T06GYM0101_02CE
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0778_T06GYM0101_02E5
	end

scr_seq_0778_T06GYM0101_027D:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0778_T06GYM0101_028E:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 9
	waitbutton
	closemsg
	scrcmd_321 0, 0
	npc_msg 11
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0778_T06GYM0101_02AA:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 9
	waitbutton
	closemsg
	scrcmd_321 1, 0
	setflag FLAG_UNK_9A6
	scrcmd_074 2150
	npc_msg 12
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0778_T06GYM0101_02CE:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 10
	waitbutton
	closemsg
	scrcmd_321 0, 1
	scrcmd_323
	releaseall
	end

scr_seq_0778_T06GYM0101_02E5:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0778_T06GYM0101_02F6:
	end

scr_seq_0778_T06GYM0101_02F8:
	end

scr_seq_0778_T06GYM0101_02FA:
	end

scr_seq_0778_T06GYM0101_02FC:
	end

scr_seq_0778_T06GYM0101_02FE:
	end

scr_seq_0778_T06GYM0101_0300:
	end

scr_seq_0778_T06GYM0101_0302:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_294 10, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0778_T06GYM0101_03C7
	npc_msg 0
	closemsg
	trainer_battle 255, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0778_T06GYM0101_03DD
	scrcmd_295 10
	addvar VAR_UNK_4135, 1
	scrcmd_515 22
	setflag FLAG_UNK_31A
	hide_person 0
	hide_person 1
	hide_person 2
	hide_person 3
	hide_person 4
	hide_person 5
	settrainerflag 232
	settrainerflag 337
	settrainerflag 396
	npc_msg 1
	buffer_players_name 0
	npc_msg 2
	play_fanfare SEQ_ME_BADGE
	wait_fanfare
	npc_msg 3
	goto scr_seq_0778_T06GYM0101_0389

scr_seq_0778_T06GYM0101_0389:
	setvar VAR_SPECIAL_x8004, 361
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0778_T06GYM0101_03BD
	callstd std_give_item_verbose
	setflag FLAG_UNK_181
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0778_T06GYM0101_03BD:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_0778_T06GYM0101_03C7:
	checkflag FLAG_UNK_181
	gotoif FALSE, scr_seq_0778_T06GYM0101_0389
	npc_msg 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0778_T06GYM0101_03DD:
	scrcmd_219
	releaseall
	end

scr_seq_0778_T06GYM0101_03E3:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_294 10, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0778_T06GYM0101_0409
	npc_msg 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0778_T06GYM0101_0409:
	npc_msg 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0778_T06GYM0101_0414:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_294 10, VAR_SPECIAL_x800C
	buffer_players_name 0
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0778_T06GYM0101_043B
	npc_msg 13
	goto scr_seq_0778_T06GYM0101_043E

scr_seq_0778_T06GYM0101_043B:
	npc_msg 14
scr_seq_0778_T06GYM0101_043E:
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
