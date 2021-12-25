#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000914_00000016 ; 000
	scrdef scr_seq_00000914_0000010C ; 001
	scrdef scr_seq_00000914_0000011F ; 002
	scrdef scr_seq_00000914_00000132 ; 003
	scrdef scr_seq_00000914_00000022 ; 004
	scrdef_end

scr_seq_00000914_00000016:
	setvar VAR_SPECIAL_x8007, 0
	callstd 2002
	end

scr_seq_00000914_00000022:
	checktrainerflag 728
	gotoif eq, scr_seq_00000914_000000E6
	comparevartovalue VAR_TEMP_x4007, 77
	gotoif eq, scr_seq_00000914_000000C4
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 3
	setvar VAR_TEMP_x4007, 77
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_00000914_00000068
	apply_movement 7, scr_seq_00000914_000000FC
	goto scr_seq_00000914_0000007D

scr_seq_00000914_00000068:
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000914_0000007D
	apply_movement 7, scr_seq_00000914_00000104
scr_seq_00000914_0000007D:
	wait_movement
	msgbox 4
scr_seq_00000914_00000082:
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000914_000000D5
	msgbox 5
	closemsg
	trainer_battle 728, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000914_000000E0
	settrainerflag 728
	msgbox 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000914_000000C4:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 8
	goto scr_seq_00000914_00000082

scr_seq_00000914_000000D5:
	msgbox 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000914_000000E0:
	scrcmd_219
	releaseall
	end

scr_seq_00000914_000000E6:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000914_000000F9:
	.byte 0x00, 0x00, 0x00

scr_seq_00000914_000000FC:
	.short 35, 1
	.short 254, 0

scr_seq_00000914_00000104:
	.short 33, 1
	.short 254, 0
scr_seq_00000914_0000010C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000914_0000011F:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000914_00000132:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
