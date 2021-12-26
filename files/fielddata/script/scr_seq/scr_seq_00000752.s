#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000752_00000101 ; 000
	scrdef scr_seq_00000752_000001BE ; 001
	scrdef scr_seq_00000752_000001EF ; 002
	scrdef scr_seq_00000752_00000012 ; 003
	scrdef_end

scr_seq_00000752_00000012:
	scrcmd_142 33, 16385
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_00000752_000000FB
	scrcmd_147 33, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000752_000000A4
	scrcmd_294 15, VAR_TEMP_x4002
	comparevartovalue VAR_TEMP_x4002, 1
	gotoif eq, scr_seq_00000752_00000053
	goto scr_seq_00000752_000000F5

scr_seq_00000752_00000051:
	.byte 0x02, 0x00
scr_seq_00000752_00000053:
	scrcmd_522 16384
	comparevartovalue VAR_TEMP_x4000, 12
	gotoif ne, scr_seq_00000752_0000006E
	setflag FLAG_UNK_2F4
	goto scr_seq_00000752_000000A2

scr_seq_00000752_0000006E:
	comparevartovalue VAR_TEMP_x4000, 13
	gotoif ne, scr_seq_00000752_00000085
	setflag FLAG_UNK_2F4
	goto scr_seq_00000752_000000A2

scr_seq_00000752_00000085:
	comparevartovalue VAR_TEMP_x4000, 14
	gotoif ne, scr_seq_00000752_0000009C
	setflag FLAG_UNK_2F4
	goto scr_seq_00000752_000000A2

scr_seq_00000752_0000009C:
	goto scr_seq_00000752_000000F5

scr_seq_00000752_000000A2:
	end

scr_seq_00000752_000000A4:
	scrcmd_522 16384
	comparevartovalue VAR_TEMP_x4000, 17
	gotoif ne, scr_seq_00000752_000000BF
	setflag FLAG_UNK_2F4
	goto scr_seq_00000752_000000F3

scr_seq_00000752_000000BF:
	comparevartovalue VAR_TEMP_x4000, 18
	gotoif ne, scr_seq_00000752_000000D6
	setflag FLAG_UNK_2F4
	goto scr_seq_00000752_000000F3

scr_seq_00000752_000000D6:
	comparevartovalue VAR_TEMP_x4000, 19
	gotoif ne, scr_seq_00000752_000000ED
	setflag FLAG_UNK_2F4
	goto scr_seq_00000752_000000F3

scr_seq_00000752_000000ED:
	goto scr_seq_00000752_000000F5

scr_seq_00000752_000000F3:
	end

scr_seq_00000752_000000F5:
	clearflag FLAG_UNK_2F4
	end

scr_seq_00000752_000000FB:
	setflag FLAG_UNK_2F4
	end

scr_seq_00000752_00000101:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_294 8, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000752_00000195
	msgbox 0
	closemsg
	trainer_battle 253, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000752_000001B8
	scrcmd_295 8
	addvar VAR_UNK_4135, 1
	scrcmd_515 22
	settrainerflag 308
	settrainerflag 685
	msgbox 1
	buffer_players_name 0
	msgbox 2
	play_fanfare SEQ_ME_BADGE
	wait_fanfare
	buffer_players_name 0
	gender_msgbox 3, 4
	goto scr_seq_00000752_0000016C

scr_seq_00000752_0000016C:
	setvar VAR_SPECIAL_x8004, 407
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000752_000001AE
	callstd 2033
	setflag FLAG_UNK_17F
scr_seq_00000752_00000195:
	checkflag FLAG_UNK_17F
	gotoif FALSE, scr_seq_00000752_0000016C
	buffer_players_name 0
	msgbox 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000752_000001AE:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_00000752_000001B8:
	scrcmd_219
	releaseall
	end

scr_seq_00000752_000001BE:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_294 8, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000752_000001E4
	msgbox 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000752_000001E4:
	msgbox 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000752_000001EF:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_294 8, VAR_SPECIAL_x800C
	buffer_players_name 0
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000752_00000216
	msgbox 8
	goto scr_seq_00000752_00000219

scr_seq_00000752_00000216:
	msgbox 9
scr_seq_00000752_00000219:
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
