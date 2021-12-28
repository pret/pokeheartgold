#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0024_D18R0102_0029 ; 000
	scrdef scr_seq_0024_D18R0102_030A ; 001
	scrdef scr_seq_0024_D18R0102_000E ; 002
	scrdef_end

scr_seq_0024_D18R0102_000E:
	checkflag FLAG_UNK_0A4
	gotoif TRUE, scr_seq_0024_D18R0102_001B
	end

scr_seq_0024_D18R0102_001B:
	setflag FLAG_UNK_30E
	hide_person 12
	clearflag FLAG_UNK_0A4
	end

scr_seq_0024_D18R0102_0029:
	scrcmd_609
	lockall
	scrcmd_076 243, 0
	scrcmd_099 2
	scrcmd_523 2, 2, 90, 2, 0
	scrcmd_098 2
	scrcmd_077
	scrcmd_076 244, 0
	scrcmd_099 1
	scrcmd_523 1, 2, 90, 2, 0
	scrcmd_098 1
	scrcmd_077
	scrcmd_076 245, 0
	scrcmd_099 0
	scrcmd_523 0, 2, 90, 2, 0
	scrcmd_098 0
	scrcmd_077
	apply_movement 2, scr_seq_0024_D18R0102_0224
	wait_movement
	apply_movement 1, scr_seq_0024_D18R0102_0234
	wait_movement
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	comparevartovalue VAR_SPECIAL_x8005, 16
	gotoif ne, scr_seq_0024_D18R0102_00C8
	apply_movement 0, scr_seq_0024_D18R0102_0244
	wait_movement
	scrcmd_076 245, 0
	apply_movement 0, scr_seq_0024_D18R0102_0254
	scrcmd_077
	goto scr_seq_0024_D18R0102_00E2

scr_seq_0024_D18R0102_00C8:
	apply_movement 0, scr_seq_0024_D18R0102_0268
	wait_movement
	scrcmd_076 245, 0
	apply_movement 0, scr_seq_0024_D18R0102_0278
	scrcmd_077
scr_seq_0024_D18R0102_00E2:
	wait_movement
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0024_D18R0102_028C
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	setflag FLAG_UNK_1C9
	setflag FLAG_UNK_1CA
	setflag FLAG_UNK_1CB
	hide_person 2
	hide_person 1
	hide_person 0
	scrcmd_464 0
	scrcmd_464 1
	wait 15, VAR_SPECIAL_x800C
	clearflag FLAG_UNK_1C8
	play_se SEQ_SE_DP_KAIDAN2
	show_person 3
	scrcmd_098 3
	wait_se SEQ_SE_DP_KAIDAN2
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	comparevartovalue VAR_SPECIAL_x8005, 16
	gotoif ne, scr_seq_0024_D18R0102_015B
	apply_movement 3, scr_seq_0024_D18R0102_029C
	goto scr_seq_0024_D18R0102_016B

scr_seq_0024_D18R0102_015B:
	apply_movement 3, scr_seq_0024_D18R0102_02B0
	apply_movement 255, scr_seq_0024_D18R0102_02D8
scr_seq_0024_D18R0102_016B:
	wait_movement
	npc_msg 0
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	comparevartovalue VAR_SPECIAL_x8005, 16
	gotoif ne, scr_seq_0024_D18R0102_0191
	apply_movement 3, scr_seq_0024_D18R0102_02C4
	goto scr_seq_0024_D18R0102_01A1

scr_seq_0024_D18R0102_0191:
	apply_movement 3, scr_seq_0024_D18R0102_02D0
	apply_movement 255, scr_seq_0024_D18R0102_02D8
scr_seq_0024_D18R0102_01A1:
	wait_movement
	buffer_players_name 0
	npc_msg 1
	closemsg
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	comparevartovalue VAR_SPECIAL_x8005, 16
	gotoif ne, scr_seq_0024_D18R0102_01CC
	apply_movement 3, scr_seq_0024_D18R0102_02E8
	goto scr_seq_0024_D18R0102_01D4

scr_seq_0024_D18R0102_01CC:
	apply_movement 3, scr_seq_0024_D18R0102_02F8
scr_seq_0024_D18R0102_01D4:
	wait_movement
	play_se SEQ_SE_DP_KAIDAN2
	wait 2, VAR_SPECIAL_x800C
	hide_person 3
	wait_se SEQ_SE_DP_KAIDAN2
	setflag FLAG_UNK_1C8
	setflag FLAG_UNK_1C7
	setflag FLAG_UNK_1CC
	setflag FLAG_UNK_1DE
	setflag FLAG_UNK_1DF
	setflag FLAG_UNK_1E0
	clearflag FLAG_UNK_1E1
	setvar VAR_UNK_40A1, 1
	setvar VAR_UNK_4076, 1
	setvar VAR_UNK_4079, 2
	setflag FLAG_UNK_247
	clearflag FLAG_UNK_248
	releaseall
	end

scr_seq_0024_D18R0102_0222:
	.byte 0x00, 0x00

scr_seq_0024_D18R0102_0224:
	.short 105, 1
	.short 69, 1
	.short 254, 0
	.byte 0x02, 0x00, 0x00, 0x00

scr_seq_0024_D18R0102_0234:
	.short 106, 1
	.short 69, 1
	.short 254, 0
	.byte 0x02, 0x00, 0x00, 0x00

scr_seq_0024_D18R0102_0244:
	.short 107, 1
	.short 3, 1
	.short 254, 0
	.byte 0x02, 0x00, 0x00, 0x00

scr_seq_0024_D18R0102_0254:
	.short 62, 6
	.short 108, 1
	.short 69, 1
	.short 254, 0
	.byte 0x02, 0x00, 0x00, 0x00

scr_seq_0024_D18R0102_0268:
	.short 109, 1
	.short 3, 1
	.short 254, 0
	.byte 0x02, 0x00, 0x00, 0x00

scr_seq_0024_D18R0102_0278:
	.short 62, 6
	.short 110, 1
	.short 69, 1
	.short 254, 0
	.byte 0x02, 0x00, 0x00, 0x00

scr_seq_0024_D18R0102_028C:
	.short 14, 1
	.short 1, 1
	.short 254, 0
	.byte 0x02, 0x00, 0x00, 0x00

scr_seq_0024_D18R0102_029C:
	.short 17, 1
	.short 18, 3
	.short 1, 1
	.short 254, 0
	.byte 0x02, 0x00, 0x00, 0x00

scr_seq_0024_D18R0102_02B0:
	.short 18, 5
	.short 17, 1
	.short 1, 1
	.short 254, 0
	.byte 0x02, 0x00, 0x00, 0x00

scr_seq_0024_D18R0102_02C4:
	.short 18, 1
	.short 0, 1
	.short 254, 0

scr_seq_0024_D18R0102_02D0:
	.short 3, 1
	.short 254, 0

scr_seq_0024_D18R0102_02D8:
	.short 62, 6
	.short 2, 1
	.short 254, 0
	.byte 0x02, 0x00, 0x00, 0x00

scr_seq_0024_D18R0102_02E8:
	.short 19, 4
	.short 16, 1
	.short 254, 0
	.byte 0x02, 0x00, 0x00, 0x00

scr_seq_0024_D18R0102_02F8:
	.short 16, 1
	.short 19, 5
	.short 0, 1
	.short 254, 0
	.byte 0x02, 0x00
scr_seq_0024_D18R0102_030A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 245, 0
	scrcmd_077
	setflag FLAG_UNK_0A4
	scrcmd_589 245, 40, 0
	clearflag FLAG_UNK_0A4
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0024_D18R0102_035C
	scrcmd_683 16386
	comparevartovalue VAR_TEMP_x4002, 3
	gotoif eq, scr_seq_0024_D18R0102_0358
	comparevartovalue VAR_TEMP_x4002, 4
	callif eq, scr_seq_0024_D18R0102_0362
scr_seq_0024_D18R0102_0358:
	releaseall
	end

scr_seq_0024_D18R0102_035C:
	white_out
	releaseall
	end

scr_seq_0024_D18R0102_0362:
	setflag FLAG_UNK_175
	return
	.balign 4, 0
