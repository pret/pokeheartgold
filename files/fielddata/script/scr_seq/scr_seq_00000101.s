#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000101_0000000E ; 000
	scrdef scr_seq_00000101_0000003C ; 001
	scrdef scr_seq_00000101_00000058 ; 002
	scrdef_end

scr_seq_00000101_0000000E:
	play_se SEQ_SE_GS_RAKKA01
	apply_movement 255, scr_seq_00000101_00000050
	wait 1, VAR_SPECIAL_x800C
	scrcmd_374 255
	wait_movement
	scrcmd_561 0, 1, 1, 8
	play_se SEQ_SE_DP_SUTYA2
	setvar VAR_UNK_40AB, 0
	end

scr_seq_00000101_0000003C:
	comparevartovalue VAR_UNK_40AB, 1
	gotoif ne, scr_seq_00000101_0000004D
	scrcmd_375 255
scr_seq_00000101_0000004D:
	end

scr_seq_00000101_0000004F:
	.byte 0x00

scr_seq_00000101_00000050:
	.short 68, 1
	.short 254, 0
scr_seq_00000101_00000058:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
