#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000024_00000029 ; 000
	scrdef scr_seq_00000024_0000030A ; 001
	scrdef scr_seq_00000024_0000000E ; 002
	scrdef_end

scr_seq_00000024_0000000E:
	checkflag FLAG_UNK_0A4
	gotoif TRUE, scr_seq_00000024_0000001B
	end

scr_seq_00000024_0000001B:
	setflag FLAG_UNK_30E
	hide_person 12
	clearflag FLAG_UNK_0A4
	end

scr_seq_00000024_00000029:
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
	apply_movement 2, scr_seq_00000024_00000224
	wait_movement
	apply_movement 1, scr_seq_00000024_00000234
	wait_movement
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	comparevartovalue VAR_SPECIAL_x8005, 16
	gotoif ne, scr_seq_00000024_000000C8
	apply_movement 0, scr_seq_00000024_00000244
	wait_movement
	scrcmd_076 245, 0
	apply_movement 0, scr_seq_00000024_00000254
	scrcmd_077
	goto scr_seq_00000024_000000E2

scr_seq_00000024_000000C8:
	apply_movement 0, scr_seq_00000024_00000268
	wait_movement
	scrcmd_076 245, 0
	apply_movement 0, scr_seq_00000024_00000278
	scrcmd_077
scr_seq_00000024_000000E2:
	wait_movement
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000024_0000028C
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
	scrcmd_100 3
	scrcmd_098 3
	wait_se SEQ_SE_DP_KAIDAN2
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	comparevartovalue VAR_SPECIAL_x8005, 16
	gotoif ne, scr_seq_00000024_0000015B
	apply_movement 3, scr_seq_00000024_0000029C
	goto scr_seq_00000024_0000016B

scr_seq_00000024_0000015B:
	apply_movement 3, scr_seq_00000024_000002B0
	apply_movement 255, scr_seq_00000024_000002D8
scr_seq_00000024_0000016B:
	wait_movement
	msgbox 0
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	comparevartovalue VAR_SPECIAL_x8005, 16
	gotoif ne, scr_seq_00000024_00000191
	apply_movement 3, scr_seq_00000024_000002C4
	goto scr_seq_00000024_000001A1

scr_seq_00000024_00000191:
	apply_movement 3, scr_seq_00000024_000002D0
	apply_movement 255, scr_seq_00000024_000002D8
scr_seq_00000024_000001A1:
	wait_movement
	buffer_players_name 0
	msgbox 1
	closemsg
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	comparevartovalue VAR_SPECIAL_x8005, 16
	gotoif ne, scr_seq_00000024_000001CC
	apply_movement 3, scr_seq_00000024_000002E8
	goto scr_seq_00000024_000001D4

scr_seq_00000024_000001CC:
	apply_movement 3, scr_seq_00000024_000002F8
scr_seq_00000024_000001D4:
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

scr_seq_00000024_00000222:
	.byte 0x00, 0x00

scr_seq_00000024_00000224:
	.short 105, 1
	.short 69, 1
	.short 254, 0
	.byte 0x02, 0x00, 0x00, 0x00

scr_seq_00000024_00000234:
	.short 106, 1
	.short 69, 1
	.short 254, 0
	.byte 0x02, 0x00, 0x00, 0x00

scr_seq_00000024_00000244:
	.short 107, 1
	.short 3, 1
	.short 254, 0
	.byte 0x02, 0x00, 0x00, 0x00

scr_seq_00000024_00000254:
	.short 62, 6
	.short 108, 1
	.short 69, 1
	.short 254, 0
	.byte 0x02, 0x00, 0x00, 0x00

scr_seq_00000024_00000268:
	.short 109, 1
	.short 3, 1
	.short 254, 0
	.byte 0x02, 0x00, 0x00, 0x00

scr_seq_00000024_00000278:
	.short 62, 6
	.short 110, 1
	.short 69, 1
	.short 254, 0
	.byte 0x02, 0x00, 0x00, 0x00

scr_seq_00000024_0000028C:
	.short 14, 1
	.short 1, 1
	.short 254, 0
	.byte 0x02, 0x00, 0x00, 0x00

scr_seq_00000024_0000029C:
	.short 17, 1
	.short 18, 3
	.short 1, 1
	.short 254, 0
	.byte 0x02, 0x00, 0x00, 0x00

scr_seq_00000024_000002B0:
	.short 18, 5
	.short 17, 1
	.short 1, 1
	.short 254, 0
	.byte 0x02, 0x00, 0x00, 0x00

scr_seq_00000024_000002C4:
	.short 18, 1
	.short 0, 1
	.short 254, 0

scr_seq_00000024_000002D0:
	.short 3, 1
	.short 254, 0

scr_seq_00000024_000002D8:
	.short 62, 6
	.short 2, 1
	.short 254, 0
	.byte 0x02, 0x00, 0x00, 0x00

scr_seq_00000024_000002E8:
	.short 19, 4
	.short 16, 1
	.short 254, 0
	.byte 0x02, 0x00, 0x00, 0x00

scr_seq_00000024_000002F8:
	.short 16, 1
	.short 19, 5
	.short 0, 1
	.short 254, 0
	.byte 0x02, 0x00
scr_seq_00000024_0000030A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 245, 0
	scrcmd_077
	setflag FLAG_UNK_0A4
	scrcmd_589 245, 40, 0
	clearflag FLAG_UNK_0A4
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000024_0000035C
	scrcmd_683 16386
	comparevartovalue VAR_TEMP_x4002, 3
	gotoif eq, scr_seq_00000024_00000358
	comparevartovalue VAR_TEMP_x4002, 4
	callif eq, scr_seq_00000024_00000362
scr_seq_00000024_00000358:
	releaseall
	end

scr_seq_00000024_0000035C:
	scrcmd_219
	releaseall
	end

scr_seq_00000024_00000362:
	setflag FLAG_UNK_175
	return
	.balign 4, 0
