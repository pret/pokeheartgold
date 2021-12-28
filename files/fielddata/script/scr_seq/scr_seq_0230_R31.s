#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0230_R31_001A ; 000
	scrdef scr_seq_0230_R31_001C ; 001
	scrdef scr_seq_0230_R31_02DC ; 002
	scrdef scr_seq_0230_R31_02F3 ; 003
	scrdef scr_seq_0230_R31_0308 ; 004
	scrdef scr_seq_0230_R31_032E ; 005
	scrdef_end

scr_seq_0230_R31_001A:
	end

scr_seq_0230_R31_001C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4114, 1
	gotoif ne, scr_seq_0230_R31_003D
	goto scr_seq_0230_R31_0098

scr_seq_0230_R31_0037:
	.byte 0x16, 0x00, 0x50, 0x00, 0x00, 0x00
scr_seq_0230_R31_003D:
	comparevartovalue VAR_UNK_4114, 2
	gotoif ne, scr_seq_0230_R31_0056
	goto scr_seq_0230_R31_01AD

scr_seq_0230_R31_0050:
	.byte 0x16, 0x00, 0x37, 0x00, 0x00, 0x00
scr_seq_0230_R31_0056:
	comparevartovalue VAR_UNK_4114, 4
	gotoif ne, scr_seq_0230_R31_006F
	goto scr_seq_0230_R31_01AD

scr_seq_0230_R31_0069:
	.byte 0x16, 0x00, 0x1e, 0x00, 0x00, 0x00
scr_seq_0230_R31_006F:
	comparevartovalue VAR_UNK_4114, 6
	gotoif ne, scr_seq_0230_R31_008D
	scrcmd_781 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0230_R31_02AE
scr_seq_0230_R31_008D:
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0230_R31_0098:
	npc_msg 1
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_349
	scrcmd_351 16384
	comparevartovalue VAR_TEMP_x4000, 255
	gotoif eq, scr_seq_0230_R31_0206
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif eq, scr_seq_0230_R31_021F
	scrcmd_426 32780, 16384, 0
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0230_R31_0238
	scrcmd_426 32780, 16384, 1
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0230_R31_0251
	scrcmd_363 7, 16384, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0230_R31_026A
	comparevartovalue VAR_SPECIAL_x800C, 4
	gotoif eq, scr_seq_0230_R31_0295
	scrcmd_364 16384
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0230_R31_0149
	apply_movement 255, scr_seq_0230_R31_02BC
	goto scr_seq_0230_R31_0187

scr_seq_0230_R31_0149:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0230_R31_0164
	apply_movement 255, scr_seq_0230_R31_02C4
	goto scr_seq_0230_R31_0187

scr_seq_0230_R31_0164:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_0230_R31_017F
	apply_movement 255, scr_seq_0230_R31_02CC
	goto scr_seq_0230_R31_0187

scr_seq_0230_R31_017F:
	apply_movement 255, scr_seq_0230_R31_02D4
scr_seq_0230_R31_0187:
	wait_movement
	buffer_players_name 0
	npc_msg 5
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
scr_seq_0230_R31_0195:
	npc_msg 7
	setvar VAR_UNK_4114, 2
	comparevartovar VAR_TEMP_x4000, VAR_TEMP_x4001
	gotoif ne, scr_seq_0230_R31_01AD
	scrcmd_606
scr_seq_0230_R31_01AD:
	setvar VAR_SPECIAL_x8004, 371
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0230_R31_01FC
	callstd std_give_item_verbose
	comparevartovalue VAR_UNK_4114, 2
	gotoif ne, scr_seq_0230_R31_01EB
	setvar VAR_UNK_4114, 3
	goto scr_seq_0230_R31_01F1

scr_seq_0230_R31_01EB:
	setvar VAR_UNK_4114, 5
scr_seq_0230_R31_01F1:
	npc_msg 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0230_R31_01FC:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_0230_R31_0206:
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	npc_msg 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0230_R31_021F:
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	npc_msg 15
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0230_R31_0238:
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0230_R31_0251:
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0230_R31_026A:
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	npc_msg 4
	closemsg
	buffer_players_name 0
	npc_msg 6
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	scrcmd_428 16384
	goto scr_seq_0230_R31_0195

scr_seq_0230_R31_0293:
	.byte 0x02, 0x00
scr_seq_0230_R31_0295:
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	npc_msg 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0230_R31_02AE:
	setvar VAR_UNK_4114, 1
	goto scr_seq_0230_R31_0098

scr_seq_0230_R31_02BA:
	.byte 0x02, 0x00

scr_seq_0230_R31_02BC:
	.short 32, 1
	.short 254, 0

scr_seq_0230_R31_02C4:
	.short 33, 1
	.short 254, 0

scr_seq_0230_R31_02CC:
	.short 34, 1
	.short 254, 0

scr_seq_0230_R31_02D4:
	.short 35, 1
	.short 254, 0
scr_seq_0230_R31_02DC:
	scrcmd_055 13, 1, 2, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0230_R31_02F3:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 14, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0230_R31_0308:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 12
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0230_R31_031B:
	.byte 0x49, 0x00, 0xdc, 0x05, 0x60
	.byte 0x00, 0x68, 0x00, 0x2d, 0x00, 0x01, 0x32, 0x00, 0x35, 0x00, 0x61, 0x00, 0x02, 0x00
scr_seq_0230_R31_032E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 11
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
