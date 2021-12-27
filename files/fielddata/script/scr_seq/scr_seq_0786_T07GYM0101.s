#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0786_010D ; 000
	scrdef scr_seq_0786_01CB ; 001
	scrdef scr_seq_0786_000E ; 002
	scrdef_end

scr_seq_0786_000E:
	scrcmd_142 28, 16385
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_0786_0107
	scrcmd_147 28, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0786_00DE
	scrcmd_294 15, VAR_TEMP_x4002
	comparevartovalue VAR_TEMP_x4002, 1
	gotoif eq, scr_seq_0786_004F
	goto scr_seq_0786_0101

scr_seq_0786_004D:
	.byte 0x02, 0x00
scr_seq_0786_004F:
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif ne, scr_seq_0786_006C
	goto scr_seq_0786_008D

scr_seq_0786_0066:
	.byte 0x16, 0x00, 0x1f, 0x00, 0x00, 0x00
scr_seq_0786_006C:
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_0786_0085
	goto scr_seq_0786_008D

scr_seq_0786_007F:
	.byte 0x16
	.byte 0x00, 0x06, 0x00, 0x00, 0x00
scr_seq_0786_0085:
	goto scr_seq_0786_0101

scr_seq_0786_008B:
	.byte 0x02, 0x00
scr_seq_0786_008D:
	scrcmd_522 16384
	comparevartovalue VAR_TEMP_x4000, 14
	gotoif ne, scr_seq_0786_00A8
	setflag FLAG_UNK_2F2
	goto scr_seq_0786_00DC

scr_seq_0786_00A8:
	comparevartovalue VAR_TEMP_x4000, 15
	gotoif ne, scr_seq_0786_00BF
	setflag FLAG_UNK_2F2
	goto scr_seq_0786_00DC

scr_seq_0786_00BF:
	comparevartovalue VAR_TEMP_x4000, 16
	gotoif ne, scr_seq_0786_00D6
	setflag FLAG_UNK_2F2
	goto scr_seq_0786_00DC

scr_seq_0786_00D6:
	goto scr_seq_0786_0101

scr_seq_0786_00DC:
	end

scr_seq_0786_00DE:
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif ne, scr_seq_0786_00F9
	setflag FLAG_UNK_2F2
	goto scr_seq_0786_00FF

scr_seq_0786_00F9:
	goto scr_seq_0786_0101

scr_seq_0786_00FF:
	end

scr_seq_0786_0101:
	clearflag FLAG_UNK_2F2
	end

scr_seq_0786_0107:
	setflag FLAG_UNK_2F2
	end

scr_seq_0786_010D:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_294 11, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0786_01A5
	npc_msg 0
	closemsg
	trainer_battle 256, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0786_01BB
	scrcmd_295 11
	addvar VAR_UNK_4135, 1
	scrcmd_515 22
	settrainerflag 326
	settrainerflag 356
	settrainerflag 336
	settrainerflag 346
	npc_msg 1
	buffer_players_name 0
	npc_msg 2
	play_fanfare SEQ_ME_BADGE
	wait_fanfare
	npc_msg 3
	goto scr_seq_0786_017C

scr_seq_0786_017C:
	setvar VAR_SPECIAL_x8004, 346
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0786_01C1
	callstd 2033
	setflag FLAG_UNK_124
scr_seq_0786_01A5:
	checkflag FLAG_UNK_124
	gotoif FALSE, scr_seq_0786_017C
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0786_01BB:
	scrcmd_219
	releaseall
	end

scr_seq_0786_01C1:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_0786_01CB:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_294 11, VAR_SPECIAL_x800C
	buffer_players_name 0
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0786_01F2
	npc_msg 5
	goto scr_seq_0786_01F5

scr_seq_0786_01F2:
	npc_msg 6
scr_seq_0786_01F5:
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
