#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000877_0000001A ; 000
	scrdef scr_seq_00000877_00000012 ; 001
	scrdef scr_seq_00000877_00000115 ; 002
	scrdef scr_seq_00000877_00000173 ; 003
	scrdef_end

scr_seq_00000877_00000012:
	scrcmd_318
	clearflag FLAG_UNK_981
	end

scr_seq_00000877_0000001A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, scr_seq_00000877_0000010A
	scrcmd_294 4, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000877_000000EE
	msgbox 0
	closemsg
	trainer_battle 34, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000877_00000104
	msgbox 3
	settrainerflag 156
	settrainerflag 157
	settrainerflag 251
	settrainerflag 159
	buffer_players_name 0
	msgbox 4
	scrcmd_295 4
	play_fanfare SEQ_ME_BADGE
	wait_fanfare
	addvar VAR_UNK_4134, 1
	scrcmd_515 22
	setvar VAR_UNK_4116, 1
	comparevartovalue VAR_UNK_4134, 3
	gotoif ne, scr_seq_00000877_000000A6
	setvar VAR_UNK_4077, 1
scr_seq_00000877_000000A6:
	msgbox 5
	goto scr_seq_00000877_000000AF

scr_seq_00000877_000000AF:
	setvar VAR_SPECIAL_x8004, 328
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000877_000000E3
	callstd 2033
	setflag FLAG_UNK_0BA
	msgbox 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000877_000000E3:
	msgbox 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000877_000000EE:
	checkflag FLAG_UNK_0BA
	gotoif FALSE, scr_seq_00000877_000000AF
	msgbox 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000877_00000104:
	scrcmd_219
	releaseall
	end

scr_seq_00000877_0000010A:
	msgbox 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000877_00000115:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, scr_seq_00000877_00000135
	msgbox 12
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000877_00000135:
	msgbox 10
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000877_00000153
	closemsg
	releaseall
	end

scr_seq_00000877_00000153:
	buffer_players_name 0
	msgbox 11
	closemsg
	setflag FLAG_UNK_981
	scrcmd_074 2143
	play_se SEQ_SE_DP_SHIP03
	play_se SEQ_SE_GS_TAKI2
	scrcmd_319 16384
	releaseall
	end

scr_seq_00000877_00000173:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_294 4, VAR_SPECIAL_x800C
	buffer_players_name 0
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000877_0000019A
	msgbox 13
	goto scr_seq_00000877_0000019D

scr_seq_00000877_0000019A:
	msgbox 14
scr_seq_00000877_0000019D:
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
