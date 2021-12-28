#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0862_T22R0301_0022 ; 000
	scrdef scr_seq_0862_T22R0301_01F4 ; 001
	scrdef scr_seq_0862_T22R0301_02ED ; 002
	scrdef scr_seq_0862_T22R0301_02DA ; 003
	scrdef scr_seq_0862_T22R0301_0364 ; 004
	scrdef scr_seq_0862_T22R0301_0377 ; 005
	scrdef scr_seq_0862_T22R0301_038A ; 006
	scrdef scr_seq_0862_T22R0301_039D ; 007
	scrdef_end

scr_seq_0862_T22R0301_0022:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_0862_T22R0301_0049
	apply_movement 0, scr_seq_0862_T22R0301_0164
	goto scr_seq_0862_T22R0301_0087

scr_seq_0862_T22R0301_0049:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0862_T22R0301_0064
	apply_movement 0, scr_seq_0862_T22R0301_0188
	goto scr_seq_0862_T22R0301_0087

scr_seq_0862_T22R0301_0064:
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0862_T22R0301_007F
	apply_movement 0, scr_seq_0862_T22R0301_01AC
	goto scr_seq_0862_T22R0301_0087

scr_seq_0862_T22R0301_007F:
	apply_movement 0, scr_seq_0862_T22R0301_01D0
scr_seq_0862_T22R0301_0087:
	wait_movement
	npc_msg 0
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0862_T22R0301_00B0
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0862_T22R0301_00D7
	end

scr_seq_0862_T22R0301_00B0:
	npc_msg 1
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0862_T22R0301_00D7
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0862_T22R0301_0157
	end

scr_seq_0862_T22R0301_00D7:
	npc_msg 2
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0862_T22R0301_00FE
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0862_T22R0301_0125
	end

scr_seq_0862_T22R0301_00FE:
	npc_msg 3
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0862_T22R0301_0125
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0862_T22R0301_0157
	end

scr_seq_0862_T22R0301_0125:
	npc_msg 4
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0862_T22R0301_014C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0862_T22R0301_0157
	end

scr_seq_0862_T22R0301_014C:
	npc_msg 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0862_T22R0301_0157:
	npc_msg 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0862_T22R0301_0162:
	.byte 0x00, 0x00

scr_seq_0862_T22R0301_0164:
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 254, 0

scr_seq_0862_T22R0301_0188:
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 254, 0

scr_seq_0862_T22R0301_01AC:
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 254, 0

scr_seq_0862_T22R0301_01D0:
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 254, 0
scr_seq_0862_T22R0301_01F4:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 12
	goto scr_seq_0862_T22R0301_0207

scr_seq_0862_T22R0301_0205:
	.byte 0x02, 0x00
scr_seq_0862_T22R0301_0207:
	npc_msg 13
	scrcmd_746
	scrcmd_750 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 24, 255, 1
	scrcmd_751 25, 255, 2
	scrcmd_751 26, 255, 3
	scrcmd_751 27, 255, 4
	scrcmd_751 28, 255, 5
	scrcmd_751 29, 255, 0
	scrcmd_752
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0862_T22R0301_0264
	npc_msg 14
	goto scr_seq_0862_T22R0301_0207

scr_seq_0862_T22R0301_025E:
	.byte 0x16, 0x00
	.byte 0x74, 0x00, 0x00, 0x00
scr_seq_0862_T22R0301_0264:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_0862_T22R0301_0280
	npc_msg 15
	goto scr_seq_0862_T22R0301_0207

scr_seq_0862_T22R0301_027A:
	.byte 0x16, 0x00, 0x58, 0x00, 0x00, 0x00
scr_seq_0862_T22R0301_0280:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0862_T22R0301_029C
	npc_msg 16
	goto scr_seq_0862_T22R0301_0207

scr_seq_0862_T22R0301_0296:
	.byte 0x16, 0x00, 0x3c, 0x00, 0x00, 0x00
scr_seq_0862_T22R0301_029C:
	comparevartovalue VAR_SPECIAL_x800C, 4
	gotoif ne, scr_seq_0862_T22R0301_02B8
	npc_msg 17
	goto scr_seq_0862_T22R0301_0207

scr_seq_0862_T22R0301_02B2:
	.byte 0x16, 0x00, 0x20, 0x00, 0x00, 0x00
scr_seq_0862_T22R0301_02B8:
	comparevartovalue VAR_SPECIAL_x800C, 5
	gotoif ne, scr_seq_0862_T22R0301_02D4
	npc_msg 18
	goto scr_seq_0862_T22R0301_0207

scr_seq_0862_T22R0301_02CE:
	.byte 0x16, 0x00
	.byte 0x04, 0x00, 0x00, 0x00
scr_seq_0862_T22R0301_02D4:
	closemsg
	releaseall
	end

scr_seq_0862_T22R0301_02DA:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 11
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0862_T22R0301_02ED:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 19
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0862_T22R0301_0353
	npc_msg 20
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0862_T22R0301_0353
	npc_msg 21
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0862_T22R0301_0353
	npc_msg 22
	closemsg
	scrcmd_747
	apply_movement 1, scr_seq_0862_T22R0301_035C
	wait_movement
	npc_msg 23
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0862_T22R0301_0353:
	closemsg
	scrcmd_747
	releaseall
	end

scr_seq_0862_T22R0301_035B:
	.byte 0x00

scr_seq_0862_T22R0301_035C:
	.short 32, 1
	.short 254, 0
scr_seq_0862_T22R0301_0364:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0862_T22R0301_0377:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0862_T22R0301_038A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0862_T22R0301_039D:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 8
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
