#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0101_D39R0103_000E ; 000
	scrdef scr_seq_0101_D39R0103_003C ; 001
	scrdef scr_seq_0101_D39R0103_0058 ; 002
	scrdef_end

scr_seq_0101_D39R0103_000E:
	play_se SEQ_SE_GS_RAKKA01
	apply_movement 255, scr_seq_0101_D39R0103_0050
	wait 1, VAR_SPECIAL_x800C
	scrcmd_374 255
	wait_movement
	scrcmd_561 0, 1, 1, 8
	play_se SEQ_SE_DP_SUTYA2
	setvar VAR_UNK_40AB, 0
	end

scr_seq_0101_D39R0103_003C:
	comparevartovalue VAR_UNK_40AB, 1
	gotoif ne, scr_seq_0101_D39R0103_004D
	scrcmd_375 255
scr_seq_0101_D39R0103_004D:
	end

scr_seq_0101_D39R0103_004F:
	.byte 0x00

scr_seq_0101_D39R0103_0050:
	step 68, 1
	step_end
scr_seq_0101_D39R0103_0058:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
