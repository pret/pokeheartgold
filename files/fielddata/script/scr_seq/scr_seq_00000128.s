#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000128_000001A4 ; 000
	scrdef scr_seq_00000128_000001BA ; 001
	scrdef scr_seq_00000128_000001E8 ; 002
	scrdef scr_seq_00000128_000001FB ; 003
	scrdef scr_seq_00000128_0000020E ; 004
	scrdef scr_seq_00000128_000000A8 ; 005
	scrdef scr_seq_00000128_00000043 ; 006
	scrdef scr_seq_00000128_00000022 ; 007
	scrdef_end

scr_seq_00000128_00000022:
	comparevartovalue VAR_UNK_40D3, 1
	gotoif ne, scr_seq_00000128_0000003B
	setvar VAR_TEMP_x400E, 1
	goto scr_seq_00000128_00000041

scr_seq_00000128_0000003B:
	setvar VAR_TEMP_x400E, 0
scr_seq_00000128_00000041:
	end

scr_seq_00000128_00000043:
	comparevartovalue VAR_TEMP_x400F, 0
	gotoif ne, scr_seq_00000128_00000058
	scrcmd_744
	setvar VAR_TEMP_x400F, 1
scr_seq_00000128_00000058:
	get_player_gender VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_00000128_0000007B
	show_person_at 2, 28, 0, 28, 0
	goto scr_seq_00000128_00000087

scr_seq_00000128_0000007B:
	show_person_at 1, 28, 0, 28, 0
scr_seq_00000128_00000087:
	comparevartovalue VAR_TEMP_x400E, 1
	gotoif ne, scr_seq_00000128_000000A6
	show_person_at 0, 9, 0, 9, 1
	setvar VAR_TEMP_x400E, 0
scr_seq_00000128_000000A6:
	end

scr_seq_00000128_000000A8:
	scrcmd_609
	lockall
	apply_movement 0, scr_seq_00000128_0000015C
	wait_movement
	msgbox 0
	closemsg
	apply_movement 0, scr_seq_00000128_00000164
	wait_movement
	wait 15, VAR_SPECIAL_x800C
	scrcmd_190 0
	msgbox 1
	closemsg
	apply_movement 0, scr_seq_00000128_0000016C
	wait_movement
	msgbox 2
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 0, scr_seq_00000128_00000174
	apply_movement 255, scr_seq_00000128_00000180
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_190 0
	msgbox 3
	closemsg
	apply_movement 0, scr_seq_00000128_00000188
	wait_movement
	msgbox 4
	closemsg
	apply_movement 0, scr_seq_00000128_00000164
	wait_movement
	msgbox 5
	closemsg
	apply_movement 0, scr_seq_00000128_00000190
	wait_movement
	releaseall
	setvar VAR_UNK_40D3, 1
	scrcmd_477 2, 16384
	comparevartovalue VAR_TEMP_x4000, 1
	callif eq, scr_seq_00000128_00000154
	end

scr_seq_00000128_00000154:
	clearflag FLAG_UNK_2B3
	return

scr_seq_00000128_0000015A:
	.byte 0x00, 0x00

scr_seq_00000128_0000015C:
	.short 75, 1
	.short 254, 0

scr_seq_00000128_00000164:
	.short 33, 1
	.short 254, 0

scr_seq_00000128_0000016C:
	.short 13, 3
	.short 254, 0

scr_seq_00000128_00000174:
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000128_00000180:
	.short 12, 3
	.short 254, 0

scr_seq_00000128_00000188:
	.short 8, 1
	.short 254, 0

scr_seq_00000128_00000190:
	.short 34, 1
	.short 71, 1
	.short 11, 2
	.short 72, 1
	.short 254, 0
scr_seq_00000128_000001A4:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_190 0
	msgbox 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000128_000001BA:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 7
	closemsg
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_712 3
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	releaseall
	end

scr_seq_00000128_000001E8:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000128_000001FB:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000128_0000020E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 8
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
