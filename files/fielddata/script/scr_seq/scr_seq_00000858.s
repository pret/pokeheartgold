#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000858_00000016 ; 000
	scrdef scr_seq_00000858_00000032 ; 001
	scrdef scr_seq_00000858_0000004E ; 002
	scrdef scr_seq_00000858_0000015C ; 003
	scrdef scr_seq_00000858_0000016F ; 004
	scrdef_end

scr_seq_00000858_00000016:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd 2011
	scrcmd_054
	setvar VAR_SPECIAL_x8004, 1
	callstd 2048
	releaseall
	end

scr_seq_00000858_00000032:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd 2011
	scrcmd_054
	setvar VAR_SPECIAL_x8004, 1
	callstd 2052
	releaseall
	end

scr_seq_00000858_0000004E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_06F
	gotoif eq, scr_seq_00000858_00000115
	scrcmd_190 0
	scrcmd_132 2, 3
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000858_000000F7
scr_seq_00000858_0000007D:
	scrcmd_332 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 6
	gotoif eq, scr_seq_00000858_00000106
	scrcmd_776
	setflag FLAG_UNK_070
	scrcmd_190 0
	msgbox 4
	play_fanfare SEQ_ME_TAMAGO_GET
	wait_fanfare
	scrcmd_132 5, 6
	closemsg
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_00000858_000000C5
	apply_movement 4, scr_seq_00000858_0000014C
	goto scr_seq_00000858_000000CD

scr_seq_00000858_000000C5:
	apply_movement 4, scr_seq_00000858_00000140
scr_seq_00000858_000000CD:
	wait_movement
	play_se SEQ_SE_DP_KAIDAN2
	hide_person 4
	wait_se SEQ_SE_DP_KAIDAN2
	setflag FLAG_UNK_197
	releaseall
	setvar VAR_UNK_4074, 3
	clearflag FLAG_UNK_238
	clearflag FLAG_UNK_246
	setvar VAR_UNK_4108, 7
	end

scr_seq_00000858_000000F7:
	msgbox 8
	waitbutton
	closemsg
	releaseall
	setflag FLAG_UNK_06F
	end

scr_seq_00000858_00000106:
	msgbox 7
	waitbutton
	closemsg
	releaseall
	setflag FLAG_UNK_06F
	end

scr_seq_00000858_00000115:
	scrcmd_190 0
	scrcmd_132 9, 10
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000858_0000007D
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000858_000000F7
	end


scr_seq_00000858_00000140:
	.short 14, 2
	.short 13, 3
	.short 254, 0

scr_seq_00000858_0000014C:
	.short 13, 2
	.short 14, 2
	.short 13, 1
	.short 254, 0
scr_seq_00000858_0000015C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000858_0000016F:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
