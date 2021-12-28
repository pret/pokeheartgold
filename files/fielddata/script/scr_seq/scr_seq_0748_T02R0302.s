#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0748_T02R0302_0080 ; 000
	scrdef scr_seq_0748_T02R0302_0128 ; 001
	scrdef scr_seq_0748_T02R0302_0012 ; 002
	scrdef scr_seq_0748_T02R0302_0080 ; 003
	scrdef_end

scr_seq_0748_T02R0302_0012:
	scrcmd_609
	lockall
	setvar VAR_UNK_412E, 2
	npc_msg 7
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0748_T02R0302_0070
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	npc_msg 8
	checkflag FLAG_UNK_176
	gotoif TRUE, scr_seq_0748_T02R0302_0063
	npc_msg 9
	setflag FLAG_UNK_25B
	dummy_486
	setvar VAR_UNK_40E5, 2
	npc_msg 11
	setflag FLAG_UNK_176
scr_seq_0748_T02R0302_0063:
	npc_msg 12
	goto scr_seq_0748_T02R0302_0091

scr_seq_0748_T02R0302_006C:
	.byte 0x61, 0x00, 0x02, 0x00

scr_seq_0748_T02R0302_0070:
	.short 14, 2
	.short 13, 1
	.short 14, 2
	.short 254, 0
scr_seq_0748_T02R0302_0080:
	scrcmd_609
	lockall
	apply_movement 255, scr_seq_0748_T02R0302_0120
	wait_movement
	npc_msg 0
scr_seq_0748_T02R0302_0091:
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0748_T02R0302_00ED
	scrcmd_783 1
	setvar VAR_UNK_412E, 5
	callstd 2006
	copyvar VAR_SPECIAL_x800C, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0748_T02R0302_00ED
	scrcmd_747
	scrcmd_600
	heal_party
	npc_msg 2
	closemsg
	apply_movement 255, scr_seq_0748_T02R0302_017C
	wait_movement
	scrcmd_607
	scrcmd_109 253, 56
	setvar VAR_UNK_412E, 4
	releaseall
	end

scr_seq_0748_T02R0302_00ED:
	scrcmd_783 0
	npc_msg 3
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0748_T02R0302_0184
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	setvar VAR_UNK_412E, 3
	releaseall
	end

scr_seq_0748_T02R0302_011D:
	.byte 0x00, 0x00, 0x00

scr_seq_0748_T02R0302_0120:
	.short 34, 1
	.short 254, 0
scr_seq_0748_T02R0302_0128:
	scrcmd_609
	lockall
	npc_msg 4
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0748_T02R0302_0168
	npc_msg 5
	closemsg
	apply_movement 255, scr_seq_0748_T02R0302_0184
	wait_movement
	scrcmd_783 0
	scrcmd_606
	scrcmd_109 253, 48
	setvar VAR_UNK_412E, 3
	releaseall
	end

scr_seq_0748_T02R0302_0168:
	npc_msg 6
	closemsg
	apply_movement 255, scr_seq_0748_T02R0302_017C
	wait_movement
	releaseall
	end

scr_seq_0748_T02R0302_017B:
	.byte 0x00

scr_seq_0748_T02R0302_017C:
	.short 13, 3
	.short 254, 0

scr_seq_0748_T02R0302_0184:
	.short 15, 1
	.short 254, 0
	.balign 4, 0
