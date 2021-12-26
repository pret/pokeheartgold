#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000859_0000001A ; 000
	scrdef scr_seq_00000859_000000AD ; 001
	scrdef scr_seq_00000859_00000184 ; 002
	scrdef scr_seq_00000859_000001C8 ; 003
	scrdef scr_seq_00000859_000001FA ; 004
	scrdef scr_seq_00000859_000001B5 ; 005
	scrdef_end

scr_seq_00000859_0000001A:
	scrcmd_324
	scrcmd_142 18, 16385
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_00000859_000000A7
	scrcmd_147 18, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000859_0000007E
	scrcmd_294 12, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000859_0000005B
	goto scr_seq_00000859_000000A1

scr_seq_00000859_0000005B:
	scrcmd_484 VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif ne, scr_seq_00000859_00000076
	setflag FLAG_UNK_2E9
	goto scr_seq_00000859_0000007C

scr_seq_00000859_00000076:
	goto scr_seq_00000859_000000A1

scr_seq_00000859_0000007C:
	end

scr_seq_00000859_0000007E:
	scrcmd_484 VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 3
	gotoif ne, scr_seq_00000859_00000099
	setflag FLAG_UNK_2E9
	goto scr_seq_00000859_0000009F

scr_seq_00000859_00000099:
	goto scr_seq_00000859_000000A1

scr_seq_00000859_0000009F:
	end

scr_seq_00000859_000000A1:
	clearflag FLAG_UNK_2E9
	end

scr_seq_00000859_000000A7:
	setflag FLAG_UNK_2E9
	end

scr_seq_00000859_000000AD:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_294 0, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000859_00000168
	msgbox 0
	closemsg
	trainer_battle 20, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000859_0000017E
	scrcmd_295 0
	scrcmd_515 22
	settrainerflag 29
	settrainerflag 50
	setvar VAR_UNK_4074, 1
	setflag FLAG_UNK_192
	setvar VAR_UNK_4108, 6
	setflag FLAG_UNK_0F4
	setflag FLAG_UNK_193
	msgbox 1
	buffer_players_name 0
	msgbox 2
	play_fanfare SEQ_ME_BADGE
	wait_fanfare
	msgbox 3
	goto scr_seq_00000859_00000126

scr_seq_00000859_00000126:
	setvar VAR_SPECIAL_x8004, 378
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000859_0000015E
	callstd 2033
	setflag FLAG_UNK_073
	clearflag FLAG_UNK_2E5
	msgbox 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000859_0000015E:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_00000859_00000168:
	checkflag FLAG_UNK_073
	gotoif FALSE, scr_seq_00000859_00000126
	msgbox 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000859_0000017E:
	scrcmd_219
	releaseall
	end

scr_seq_00000859_00000184:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_294 0, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000859_000001AA
	msgbox 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000859_000001AA:
	msgbox 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000859_000001B5:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000859_000001C8:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_294 0, VAR_SPECIAL_x800C
	buffer_players_name 0
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000859_000001EF
	msgbox 9
	goto scr_seq_00000859_000001F2

scr_seq_00000859_000001EF:
	msgbox 10
scr_seq_00000859_000001F2:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000859_000001FA:
	setvar VAR_TEMP_x4000, 0
	scrcmd_325
	end
	.balign 4, 0
