#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0080_003E ; 000
	scrdef scr_seq_0080_008D ; 001
	scrdef scr_seq_0080_017E ; 002
	scrdef scr_seq_0080_01CB ; 003
	scrdef scr_seq_0080_0218 ; 004
	scrdef scr_seq_0080_0265 ; 005
	scrdef scr_seq_0080_02B2 ; 006
	scrdef scr_seq_0080_03A8 ; 007
	scrdef scr_seq_0080_03BB ; 008
	scrdef scr_seq_0080_03CE ; 009
	scrdef scr_seq_0080_03E1 ; 010
	scrdef scr_seq_0080_0032 ; 011
	scrdef_end

scr_seq_0080_0032:
	setflag FLAG_UNK_9CB
	setvar VAR_UNK_40E5, 2
	end

scr_seq_0080_003E:
	scrcmd_609
	lockall
	setvar VAR_UNK_40E6, 1
	call scr_seq_0080_02FF
	npc_msg 0
	closemsg
	call scr_seq_0080_0333
	checkflag FLAG_UNK_176
	gotoif TRUE, scr_seq_0080_0077
	npc_msg 1
	buffer_players_name 0
	play_fanfare SEQ_ME_ITEM
	npc_msg 2
	wait_fanfare
	setflag FLAG_UNK_176
scr_seq_0080_0077:
	npc_msg 3
	call scr_seq_0080_00A6
	scrcmd_747
	npc_msg 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0080_008D:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 4
	call scr_seq_0080_00A6
	goto scr_seq_0080_012B

scr_seq_0080_00A4:
	.byte 0x02, 0x00
scr_seq_0080_00A6:
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 451, 255, 0
	scrcmd_751 452, 255, 1
	scrcmd_751 453, 255, 2
	scrcmd_751 454, 255, 3
	scrcmd_751 455, 255, 4
	scrcmd_751 456, 255, 5
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0080_0138
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0080_0170
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0080_0146
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0080_0154
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_0080_0162
	return

scr_seq_0080_012B:
	scrcmd_747
	npc_msg 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0080_0138:
	npc_msg 5
	npc_msg 4
	goto scr_seq_0080_00A6

scr_seq_0080_0144:
	.byte 0x02, 0x00
scr_seq_0080_0146:
	npc_msg 7
	npc_msg 4
	goto scr_seq_0080_00A6

scr_seq_0080_0152:
	.byte 0x02, 0x00
scr_seq_0080_0154:
	npc_msg 8
	npc_msg 4
	goto scr_seq_0080_00A6

scr_seq_0080_0160:
	.byte 0x02, 0x00
scr_seq_0080_0162:
	npc_msg 9
	npc_msg 4
	goto scr_seq_0080_00A6

scr_seq_0080_016E:
	.byte 0x02, 0x00
scr_seq_0080_0170:
	npc_msg 6
	npc_msg 4
	goto scr_seq_0080_00A6

scr_seq_0080_017C:
	.byte 0x02, 0x00
scr_seq_0080_017E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 17
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0080_01AD
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0080_01B8
	end

scr_seq_0080_01AD:
	npc_msg 18
	goto scr_seq_0080_01B8

scr_seq_0080_01B6:
	.byte 0x02, 0x00
scr_seq_0080_01B8:
	npc_msg 19
	goto scr_seq_0080_01C3

scr_seq_0080_01C1:
	.byte 0x02, 0x00
scr_seq_0080_01C3:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0080_01CB:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 20
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0080_01FA
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0080_0205
	end

scr_seq_0080_01FA:
	npc_msg 21
	goto scr_seq_0080_0205

scr_seq_0080_0203:
	.byte 0x02, 0x00
scr_seq_0080_0205:
	npc_msg 22
	goto scr_seq_0080_0210

scr_seq_0080_020E:
	.byte 0x02, 0x00
scr_seq_0080_0210:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0080_0218:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 23
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0080_0247
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0080_0252
	end

scr_seq_0080_0247:
	npc_msg 24
	goto scr_seq_0080_0252

scr_seq_0080_0250:
	.byte 0x02, 0x00
scr_seq_0080_0252:
	npc_msg 25
	goto scr_seq_0080_025D

scr_seq_0080_025B:
	.byte 0x02, 0x00
scr_seq_0080_025D:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0080_0265:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 26
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0080_0294
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0080_029F
	end

scr_seq_0080_0294:
	npc_msg 27
	goto scr_seq_0080_029F

scr_seq_0080_029D:
	.byte 0x02, 0x00
scr_seq_0080_029F:
	npc_msg 28
	goto scr_seq_0080_02AA

scr_seq_0080_02A8:
	.byte 0x02, 0x00
scr_seq_0080_02AA:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0080_02B2:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 29
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0080_02E1
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0080_02EC
	end

scr_seq_0080_02E1:
	npc_msg 30
	goto scr_seq_0080_02EC

scr_seq_0080_02EA:
	.byte 0x02, 0x00
scr_seq_0080_02EC:
	npc_msg 31
	goto scr_seq_0080_02F7

scr_seq_0080_02F5:
	.byte 0x02, 0x00
scr_seq_0080_02F7:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0080_02FF:
	apply_movement 3, scr_seq_0080_0384
	apply_movement 4, scr_seq_0080_0384
	apply_movement 5, scr_seq_0080_0384
	apply_movement 6, scr_seq_0080_0384
	apply_movement 7, scr_seq_0080_0384
	apply_movement 8, scr_seq_0080_0384
	wait_movement
	return

scr_seq_0080_0333:
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 3, scr_seq_0080_038C
	apply_movement 4, scr_seq_0080_038C
	apply_movement 5, scr_seq_0080_038C
	apply_movement 6, scr_seq_0080_0394
	apply_movement 7, scr_seq_0080_0394
	apply_movement 8, scr_seq_0080_0394
	apply_movement 255, scr_seq_0080_039C
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	return

scr_seq_0080_0383:
	.byte 0x00

scr_seq_0080_0384:
	.short 1, 1
	.short 254, 0

scr_seq_0080_038C:
	.short 3, 1
	.short 254, 0

scr_seq_0080_0394:
	.short 2, 1
	.short 254, 0

scr_seq_0080_039C:
	.short 12, 3
	.short 34, 1
	.short 254, 0
scr_seq_0080_03A8:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 32
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0080_03BB:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 33
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0080_03CE:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 34
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0080_03E1:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 35
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
