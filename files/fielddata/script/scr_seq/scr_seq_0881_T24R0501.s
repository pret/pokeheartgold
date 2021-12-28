#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0881_T24R0501_0006 ; 000
	scrdef_end

scr_seq_0881_T24R0501_0006:
	checkflag FLAG_UNK_0B9
	gotoif TRUE, scr_seq_0881_T24R0501_0024
	comparevartovalue VAR_UNK_40A5, 1
	gotoif eq, scr_seq_0881_T24R0501_0051
	goto scr_seq_0881_T24R0501_0024

scr_seq_0881_T24R0501_0024:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setflag FLAG_UNK_16F
	npc_msg 3
	scrcmd_054
	setvar VAR_SPECIAL_x8004, 11
	callstd 2052
	apply_movement 0, scr_seq_0881_T24R0501_00A8
	wait_movement
	clearflag FLAG_UNK_16F
	releaseall
	end

scr_seq_0881_T24R0501_0051:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	scrcmd_049
	setvar VAR_SPECIAL_x8004, 464
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0881_T24R0501_009C
	callstd std_give_item_verbose
	setflag FLAG_UNK_0B9
	npc_msg 2
	scrcmd_049
	closemsg
	apply_movement 0, scr_seq_0881_T24R0501_00A8
	wait_movement
	releaseall
	end

scr_seq_0881_T24R0501_009C:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

scr_seq_0881_T24R0501_00A6:
	.byte 0x00, 0x00

scr_seq_0881_T24R0501_00A8:
	.short 0, 1
	.short 254, 0
	.balign 4, 0
