#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0893_T25R0501_005A ; 000
	scrdef scr_seq_0893_T25R0501_00B4 ; 001
	scrdef scr_seq_0893_T25R0501_015D ; 002
	scrdef scr_seq_0893_T25R0501_015F ; 003
	scrdef scr_seq_0893_T25R0501_0161 ; 004
	scrdef scr_seq_0893_T25R0501_003F ; 005
	scrdef scr_seq_0893_T25R0501_0022 ; 006
	scrdef scr_seq_0893_T25R0501_014C ; 007
	scrdef_end

scr_seq_0893_T25R0501_0022:
	scrcmd_582 76, 348, 350
	checkflag FLAG_UNK_118
	gotoif TRUE, scr_seq_0893_T25R0501_0037
	end

scr_seq_0893_T25R0501_0037:
	setvar VAR_UNK_410B, 0
	end

scr_seq_0893_T25R0501_003F:
	checkflag FLAG_UNK_118
	gotoif TRUE, scr_seq_0893_T25R0501_004C
	end

scr_seq_0893_T25R0501_004C:
	show_person_at 0, 4, 0, 6, 3
	end

scr_seq_0893_T25R0501_005A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_118
	gotoif TRUE, scr_seq_0893_T25R0501_0078
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0893_T25R0501_0078:
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_0893_T25R0501_0096
	npc_msg 5
	waitbutton
	closemsg
	goto scr_seq_0893_T25R0501_00A5

scr_seq_0893_T25R0501_0096:
	npc_msg 7
	closemsg
	apply_movement 0, scr_seq_0893_T25R0501_00AC
	wait_movement
scr_seq_0893_T25R0501_00A5:
	releaseall
	end

scr_seq_0893_T25R0501_00A9:
	.byte 0x00, 0x00, 0x00

scr_seq_0893_T25R0501_00AC:
	.short 3, 1
	.short 254, 0
scr_seq_0893_T25R0501_00B4:
	scrcmd_609
	lockall
	apply_movement 255, scr_seq_0893_T25R0501_013C
	wait_movement
	checkflag FLAG_UNK_123
	gotoif TRUE, scr_seq_0893_T25R0501_0118
	npc_msg 1
	closemsg
	setflag FLAG_UNK_123
scr_seq_0893_T25R0501_00D6:
	wait 50, VAR_SPECIAL_x8004
	hasitem ITEM_PASS, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, scr_seq_0893_T25R0501_0123
	npc_msg 2
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0893_T25R0501_0144
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	releaseall
	end

scr_seq_0893_T25R0501_0118:
	npc_msg 3
	closemsg
	goto scr_seq_0893_T25R0501_00D6

scr_seq_0893_T25R0501_0123:
	npc_msg 4
	waitbutton
	closemsg
	setvar VAR_UNK_410B, 1
	setvar VAR_UNK_411E, 1
	releaseall
	end

scr_seq_0893_T25R0501_013A:
	.byte 0x00, 0x00

scr_seq_0893_T25R0501_013C:
	.short 34, 1
	.short 254, 0

scr_seq_0893_T25R0501_0144:
	.short 13, 2
	.short 254, 0
scr_seq_0893_T25R0501_014C:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0893_T25R0501_015D:
	end

scr_seq_0893_T25R0501_015F:
	end

scr_seq_0893_T25R0501_0161:
	end
	.balign 4, 0
