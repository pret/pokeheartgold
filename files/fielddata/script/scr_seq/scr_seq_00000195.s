#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000195_00000026 ; 000
	scrdef scr_seq_00000195_00000039 ; 001
	scrdef scr_seq_00000195_0000004C ; 002
	scrdef scr_seq_00000195_0000005F ; 003
	scrdef scr_seq_00000195_00000072 ; 004
	scrdef scr_seq_00000195_00000085 ; 005
	scrdef scr_seq_00000195_00000098 ; 006
	scrdef scr_seq_00000195_0000014A ; 007
	scrdef scr_seq_00000195_0000015B ; 008
	scrdef_end

scr_seq_00000195_00000026:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000195_00000039:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000195_0000004C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000195_0000005F:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000195_00000072:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000195_00000085:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000195_00000098:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_121
	gotoif TRUE, scr_seq_00000195_0000013F
	msgbox 9
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000195_00000134
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_566
	scrcmd_351 32780
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_00000195_00000134
	scrcmd_470 8
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	get_partymon_species VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	scrcmd_472 32780
	comparevartovar VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	gotoif ne, scr_seq_00000195_00000127
	scrcmd_473 32772
	scrcmd_474
	setflag FLAG_UNK_121
	msgbox 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000195_00000127:
	scrcmd_474
	msgbox 11
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000195_00000134:
	msgbox 12
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000195_0000013F:
	msgbox 13
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000195_0000014A:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 14
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000195_0000015B:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 15
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
