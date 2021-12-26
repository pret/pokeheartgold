#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000869_00000190 ; 000
	scrdef scr_seq_00000869_000000D3 ; 001
	scrdef scr_seq_00000869_00000192 ; 002
	scrdef scr_seq_00000869_00000197 ; 003
	scrdef scr_seq_00000869_0000019C ; 004
	scrdef scr_seq_00000869_000001A1 ; 005
	scrdef scr_seq_00000869_000001A6 ; 006
	scrdef scr_seq_00000869_000001AB ; 007
	scrdef scr_seq_00000869_000001B0 ; 008
	scrdef scr_seq_00000869_000001B5 ; 009
	scrdef scr_seq_00000869_000001BA ; 010
	scrdef scr_seq_00000869_000001BF ; 011
	scrdef scr_seq_00000869_000001C4 ; 012
	scrdef scr_seq_00000869_000001C9 ; 013
	scrdef scr_seq_00000869_000001CE ; 014
	scrdef scr_seq_00000869_000001D3 ; 015
	scrdef scr_seq_00000869_00000046 ; 016
	scrdef_end

scr_seq_00000869_00000046:
	scrcmd_326
	scrcmd_142 34, 16385
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_00000869_000000CD
	checkflag FLAG_UNK_964
	gotoif TRUE, scr_seq_00000869_0000006C
	clearflag FLAG_UNK_2EA
	end

scr_seq_00000869_0000006C:
	scrcmd_147 34, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000869_00000096
	scrcmd_484 VAR_TEMP_x4002
	comparevartovalue VAR_TEMP_x4002, 4
	gotoif ne, scr_seq_00000869_00000096
	setflag FLAG_UNK_2EA
	end

scr_seq_00000869_00000096:
	scrcmd_484 VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000869_000000C7
	comparevartovalue VAR_TEMP_x4001, 3
	gotoif eq, scr_seq_00000869_000000C7
	comparevartovalue VAR_TEMP_x4001, 5
	gotoif eq, scr_seq_00000869_000000C7
	clearflag FLAG_UNK_2EA
	end

scr_seq_00000869_000000C7:
	setflag FLAG_UNK_2EA
	end

scr_seq_00000869_000000CD:
	setflag FLAG_UNK_2EA
	end

scr_seq_00000869_000000D3:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_294 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000869_0000017A
	msgbox 0
	closemsg
	trainer_battle 21, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000869_00000174
	msgbox 1
	buffer_players_name 0
	msgbox 2
	play_fanfare SEQ_ME_BADGE
	wait_fanfare
	scrcmd_295 1
	settrainerflag 68
	settrainerflag 67
	settrainerflag 69
	settrainerflag 10
	scrcmd_515 22
	msgbox 3
scr_seq_00000869_00000136:
	setvar VAR_SPECIAL_x8004, 416
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000869_0000016A
	callstd 2033
	setflag FLAG_UNK_07F
	msgbox 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000869_0000016A:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_00000869_00000174:
	scrcmd_219
	releaseall
	end

scr_seq_00000869_0000017A:
	checkflag FLAG_UNK_07F
	gotoif FALSE, scr_seq_00000869_00000136
	msgbox 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000869_00000190:
	end

scr_seq_00000869_00000192:
	scrcmd_327 0
	end

scr_seq_00000869_00000197:
	scrcmd_327 1
	end

scr_seq_00000869_0000019C:
	scrcmd_327 2
	end

scr_seq_00000869_000001A1:
	scrcmd_327 3
	end

scr_seq_00000869_000001A6:
	scrcmd_327 4
	end

scr_seq_00000869_000001AB:
	scrcmd_327 5
	end

scr_seq_00000869_000001B0:
	scrcmd_327 6
	end

scr_seq_00000869_000001B5:
	scrcmd_327 7
	end

scr_seq_00000869_000001BA:
	scrcmd_327 8
	end

scr_seq_00000869_000001BF:
	scrcmd_327 9
	end

scr_seq_00000869_000001C4:
	scrcmd_327 10
	end

scr_seq_00000869_000001C9:
	scrcmd_327 11
	end

scr_seq_00000869_000001CE:
	scrcmd_328 0
	end

scr_seq_00000869_000001D3:
	scrcmd_328 1
	end
	.balign 4, 0
