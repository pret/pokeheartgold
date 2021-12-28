#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0794_T07R0106_0012 ; 000
	scrdef scr_seq_0794_T07R0106_0025 ; 001
	scrdef scr_seq_0794_T07R0106_0038 ; 002
	scrdef scr_seq_0794_T07R0106_0049 ; 003
	scrdef_end

scr_seq_0794_T07R0106_0012:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0794_T07R0106_0025:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0794_T07R0106_0038:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0794_T07R0106_0049:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 3
	scrcmd_113 20, 2
	goto scr_seq_0794_T07R0106_005E

scr_seq_0794_T07R0106_005E:
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x8000
	scrcmd_751 209, 255, 0
	scrcmd_751 210, 255, 1
	scrcmd_751 211, 255, 2
	scrcmd_751 212, 255, 3
	scrcmd_752
	scrcmd_747
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x8000
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0794_T07R0106_00C2
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0794_T07R0106_00CE
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0794_T07R0106_00DA
	npc_msg 7
	goto scr_seq_0794_T07R0106_0205

scr_seq_0794_T07R0106_00C2:
	setvar VAR_SPECIAL_x8001, 30
	goto scr_seq_0794_T07R0106_011C

scr_seq_0794_T07R0106_00CE:
	setvar VAR_SPECIAL_x8001, 31
	goto scr_seq_0794_T07R0106_011C

scr_seq_0794_T07R0106_00DA:
	setvar VAR_SPECIAL_x8001, 32
	goto scr_seq_0794_T07R0106_011C

scr_seq_0794_T07R0106_00E6:
	hasenoughmoneyimmediate 32780, 200
	return

scr_seq_0794_T07R0106_00F0:
	hasenoughmoneyimmediate 32780, 300
	return

scr_seq_0794_T07R0106_00FA:
	hasenoughmoneyimmediate 32780, 350
	return

scr_seq_0794_T07R0106_0104:
	submoneyimmediate 200
	return

scr_seq_0794_T07R0106_010C:
	submoneyimmediate 300
	return

scr_seq_0794_T07R0106_0114:
	submoneyimmediate 350
	return

scr_seq_0794_T07R0106_011C:
	comparevartovalue VAR_SPECIAL_x8000, 0
	callif eq, scr_seq_0794_T07R0106_00E6
	comparevartovalue VAR_SPECIAL_x8000, 1
	callif eq, scr_seq_0794_T07R0106_00F0
	comparevartovalue VAR_SPECIAL_x8000, 2
	callif eq, scr_seq_0794_T07R0106_00FA
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0794_T07R0106_01F0
	hasspaceforitem VAR_SPECIAL_x8001, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0794_T07R0106_01F9
	comparevartovalue VAR_SPECIAL_x8000, 0
	callif eq, scr_seq_0794_T07R0106_0104
	comparevartovalue VAR_SPECIAL_x8000, 1
	callif eq, scr_seq_0794_T07R0106_010C
	comparevartovalue VAR_SPECIAL_x8000, 2
	callif eq, scr_seq_0794_T07R0106_0114
	scrcmd_115
	scrcmd_194 0, 32769
	play_se SEQ_SE_DP_JIHANKI
	scrcmd_194 0, 32769
	npc_msg 4
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x8001
	setvar VAR_SPECIAL_x8005, 1
	callstd std_give_item_verbose
	scrcmd_380 32780, 64
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0794_T07R0106_01E7
	play_se SEQ_SE_DP_JIHANKI
	scrcmd_194 0, 32769
	npc_msg 5
	hasspaceforitem VAR_SPECIAL_x8001, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0794_T07R0106_01F9
	callstd std_give_item_verbose
scr_seq_0794_T07R0106_01E7:
	npc_msg 3
	goto scr_seq_0794_T07R0106_005E

scr_seq_0794_T07R0106_01F0:
	npc_msg 6
	goto scr_seq_0794_T07R0106_0205

scr_seq_0794_T07R0106_01F9:
	callstd 2009
	closemsg
	scrcmd_114
	releaseall
	end

scr_seq_0794_T07R0106_0205:
	waitbutton
	closemsg
	scrcmd_114
	releaseall
	end
	.balign 4, 0
