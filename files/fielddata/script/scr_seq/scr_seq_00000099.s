#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000099_00000051 ; 000
	scrdef scr_seq_00000099_00000016 ; 001
	scrdef scr_seq_00000099_00000130 ; 002
	scrdef scr_seq_00000099_0000025C ; 003
	scrdef scr_seq_00000099_00000095 ; 004
	scrdef_end

scr_seq_00000099_00000016:
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_00000099_00000027
	clearflag FLAG_UNK_189
	end

scr_seq_00000099_00000027:
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif eq, scr_seq_00000099_0000004B
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif eq, scr_seq_00000099_0000004B
	setflag FLAG_UNK_27E
	end

scr_seq_00000099_0000004B:
	clearflag FLAG_UNK_27E
	end

scr_seq_00000099_00000051:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4100, 1
	gotoif eq, scr_seq_00000099_0000008A
	checkflag FLAG_UNK_457
	gotoif TRUE, scr_seq_00000099_00000084
	msgbox 1
	closemsg
	apply_movement 1, scr_seq_00000099_00000114
	wait_movement
	releaseall
	end

scr_seq_00000099_00000084:
	setvar VAR_UNK_4100, 1
scr_seq_00000099_0000008A:
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000099_00000095:
	scrcmd_609
	lockall
	checkflag FLAG_UNK_457
	gotoif TRUE, scr_seq_00000099_000000E5
	apply_movement 1, scr_seq_00000099_00000108
	apply_movement 255, scr_seq_00000099_0000011C
	wait_movement
	msgbox 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 1, scr_seq_00000099_00000114
	apply_movement 255, scr_seq_00000099_00000128
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	releaseall
	end

scr_seq_00000099_000000E5:
	apply_movement 1, scr_seq_00000099_00000108
	apply_movement 255, scr_seq_00000099_0000011C
	wait_movement
	msgbox 2
	waitbutton
	closemsg
	releaseall
	setvar VAR_UNK_4100, 1
	end


scr_seq_00000099_00000108:
	.short 0, 1
	.short 75, 1
	.short 254, 0

scr_seq_00000099_00000114:
	.short 1, 1
	.short 254, 0

scr_seq_00000099_0000011C:
	.short 63, 2
	.short 1, 1
	.short 254, 0

scr_seq_00000099_00000128:
	.short 14, 1
	.short 254, 0
scr_seq_00000099_00000130:
	play_se SEQ_SE_DP_SELECT
	lockall
	callstd 2067
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000099_00000157
	goto scr_seq_00000099_00000169

scr_seq_00000099_00000151:
	.byte 0x16, 0x00, 0x00, 0x00, 0x00, 0x00
scr_seq_00000099_00000157:
	buffer_players_name 0
	msgbox 3
	waitbutton
	closemsg
	releaseall
	callstd 2068
	end

scr_seq_00000099_00000169:
	buffer_players_name 0
	msgbox 4
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000099_00000193
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000099_000001F3
	end

scr_seq_00000099_00000193:
	play_se SEQ_SE_DP_WALL_HIT
	msgbox 5
	closemsg
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	scrcmd_102 VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	apply_movement 2, scr_seq_00000099_0000021C
	apply_movement 241, scr_seq_00000099_00000244
	wait_movement
	msgbox 7
	closemsg
	apply_movement 2, scr_seq_00000099_0000023C
	wait_movement
	hide_person 2
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	callstd 2068
	setflag FLAG_UNK_239
	setvar VAR_UNK_40E8, 1
	apply_movement 241, scr_seq_00000099_0000024C
	wait_movement
	scrcmd_103
	releaseall
	end

scr_seq_00000099_000001F3:
	msgbox 6
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000099_00000193
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000099_000001F3
	end

scr_seq_00000099_0000021A:
	.byte 0x00, 0x00

scr_seq_00000099_0000021C:
	.short 73, 0
	.short 17, 5
	.short 74, 0
	.short 13, 2
	.short 33, 1
	.short 63, 1
	.short 32, 2
	.short 254, 0

scr_seq_00000099_0000023C:
	.short 13, 4
	.short 254, 0

scr_seq_00000099_00000244:
	.short 17, 4
	.short 254, 0

scr_seq_00000099_0000024C:
	.short 16, 4
	.short 254, 0
	.byte 0x01, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00
scr_seq_00000099_0000025C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 0
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000099_00000384
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000099_00000398
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000099_000002D5
	apply_movement 255, scr_seq_00000099_000003AC
	apply_movement 5, scr_seq_00000099_000003F8
	goto scr_seq_00000099_00000323

scr_seq_00000099_000002D5:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000099_000002F0
	apply_movement 255, scr_seq_00000099_000003C4
	goto scr_seq_00000099_00000323

scr_seq_00000099_000002F0:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_00000099_00000313
	apply_movement 255, scr_seq_00000099_000003E4
	apply_movement 5, scr_seq_00000099_000003F8
	goto scr_seq_00000099_00000323

scr_seq_00000099_00000313:
	apply_movement 255, scr_seq_00000099_000003D0
	apply_movement 5, scr_seq_00000099_000003F8
scr_seq_00000099_00000323:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000099_0000034A
	apply_movement 253, scr_seq_00000099_00000404
	wait_movement
scr_seq_00000099_0000034A:
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

scr_seq_00000099_00000384:
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000099_00000398:
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end


scr_seq_00000099_000003AC:
	.short 15, 1
	.short 12, 2
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000099_000003C4:
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000099_000003D0:
	.short 12, 1
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000099_000003E4:
	.short 12, 1
	.short 15, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000099_000003F8:
	.short 63, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000099_00000404:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
	.balign 4, 0
