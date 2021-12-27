#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0099_0051 ; 000
	scrdef scr_seq_0099_0016 ; 001
	scrdef scr_seq_0099_0130 ; 002
	scrdef scr_seq_0099_025C ; 003
	scrdef scr_seq_0099_0095 ; 004
	scrdef_end

scr_seq_0099_0016:
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_0099_0027
	clearflag FLAG_UNK_189
	end

scr_seq_0099_0027:
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif eq, scr_seq_0099_004B
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif eq, scr_seq_0099_004B
	setflag FLAG_UNK_27E
	end

scr_seq_0099_004B:
	clearflag FLAG_UNK_27E
	end

scr_seq_0099_0051:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4100, 1
	gotoif eq, scr_seq_0099_008A
	checkflag FLAG_UNK_457
	gotoif TRUE, scr_seq_0099_0084
	npc_msg 1
	closemsg
	apply_movement 1, scr_seq_0099_0114
	wait_movement
	releaseall
	end

scr_seq_0099_0084:
	setvar VAR_UNK_4100, 1
scr_seq_0099_008A:
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0099_0095:
	scrcmd_609
	lockall
	checkflag FLAG_UNK_457
	gotoif TRUE, scr_seq_0099_00E5
	apply_movement 1, scr_seq_0099_0108
	apply_movement 255, scr_seq_0099_011C
	wait_movement
	npc_msg 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 1, scr_seq_0099_0114
	apply_movement 255, scr_seq_0099_0128
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	releaseall
	end

scr_seq_0099_00E5:
	apply_movement 1, scr_seq_0099_0108
	apply_movement 255, scr_seq_0099_011C
	wait_movement
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	setvar VAR_UNK_4100, 1
	end


scr_seq_0099_0108:
	.short 0, 1
	.short 75, 1
	.short 254, 0

scr_seq_0099_0114:
	.short 1, 1
	.short 254, 0

scr_seq_0099_011C:
	.short 63, 2
	.short 1, 1
	.short 254, 0

scr_seq_0099_0128:
	.short 14, 1
	.short 254, 0
scr_seq_0099_0130:
	play_se SEQ_SE_DP_SELECT
	lockall
	callstd 2067
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0099_0157
	goto scr_seq_0099_0169

scr_seq_0099_0151:
	.byte 0x16, 0x00, 0x00, 0x00, 0x00, 0x00
scr_seq_0099_0157:
	buffer_players_name 0
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	callstd 2068
	end

scr_seq_0099_0169:
	buffer_players_name 0
	npc_msg 4
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0099_0193
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0099_01F3
	end

scr_seq_0099_0193:
	play_se SEQ_SE_DP_WALL_HIT
	npc_msg 5
	closemsg
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	scrcmd_102 VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	apply_movement 2, scr_seq_0099_021C
	apply_movement 241, scr_seq_0099_0244
	wait_movement
	npc_msg 7
	closemsg
	apply_movement 2, scr_seq_0099_023C
	wait_movement
	hide_person 2
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	callstd 2068
	setflag FLAG_UNK_239
	setvar VAR_UNK_40E8, 1
	apply_movement 241, scr_seq_0099_024C
	wait_movement
	scrcmd_103
	releaseall
	end

scr_seq_0099_01F3:
	npc_msg 6
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0099_0193
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0099_01F3
	end

scr_seq_0099_021A:
	.byte 0x00, 0x00

scr_seq_0099_021C:
	.short 73, 0
	.short 17, 5
	.short 74, 0
	.short 13, 2
	.short 33, 1
	.short 63, 1
	.short 32, 2
	.short 254, 0

scr_seq_0099_023C:
	.short 13, 4
	.short 254, 0

scr_seq_0099_0244:
	.short 17, 4
	.short 254, 0

scr_seq_0099_024C:
	.short 16, 4
	.short 254, 0
	.byte 0x01, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00
scr_seq_0099_025C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 0
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0099_0384
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0099_0398
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0099_02D5
	apply_movement 255, scr_seq_0099_03AC
	apply_movement 5, scr_seq_0099_03F8
	goto scr_seq_0099_0323

scr_seq_0099_02D5:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0099_02F0
	apply_movement 255, scr_seq_0099_03C4
	goto scr_seq_0099_0323

scr_seq_0099_02F0:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0099_0313
	apply_movement 255, scr_seq_0099_03E4
	apply_movement 5, scr_seq_0099_03F8
	goto scr_seq_0099_0323

scr_seq_0099_0313:
	apply_movement 255, scr_seq_0099_03D0
	apply_movement 5, scr_seq_0099_03F8
scr_seq_0099_0323:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0099_034A
	apply_movement 253, scr_seq_0099_0404
	wait_movement
scr_seq_0099_034A:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_615 43
	lockall
	fade_screen 6, 1, 1, 0
	wait_fade
	clearflag FLAG_UNK_189
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0099_0384:
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0099_0398:
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end


scr_seq_0099_03AC:
	.short 15, 1
	.short 12, 2
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0099_03C4:
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0099_03D0:
	.short 12, 1
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0099_03E4:
	.short 12, 1
	.short 15, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0099_03F8:
	.short 63, 1
	.short 32, 1
	.short 254, 0

scr_seq_0099_0404:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
	.balign 4, 0
