#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000038_00000020 ; 000
	scrdef scr_seq_00000038_0000012C ; 001
	scrdef scr_seq_00000038_0000036E ; 002
	scrdef scr_seq_00000038_000003B3 ; 003
	scrdef scr_seq_00000038_000003F4 ; 004
	scrdef scr_seq_00000038_0000001A ; 005
	scrdef_end

scr_seq_00000038_0000001A:
	clearflag FLAG_UNK_10F
	end

scr_seq_00000038_00000020:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_545 32780
	comparevartovalue VAR_SPECIAL_x800C, 28
	gotoif eq, scr_seq_00000038_00000093
	comparevartovalue VAR_UNK_40EC, 1
	gotoif ge, scr_seq_00000038_0000008A
	checkflag FLAG_UNK_10F
	gotoif TRUE, scr_seq_00000038_00000081
	msgbox 0
	setflag FLAG_UNK_10F
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000038_00000077
	apply_movement 0, scr_seq_00000038_0000009C
	goto scr_seq_00000038_0000007F

scr_seq_00000038_00000077:
	apply_movement 0, scr_seq_00000038_000000E4
scr_seq_00000038_0000007F:
	wait_movement
scr_seq_00000038_00000081:
	msgbox 1
	goto scr_seq_00000038_00000366

scr_seq_00000038_0000008A:
	msgbox 2
	goto scr_seq_00000038_00000366

scr_seq_00000038_00000093:
	msgbox 3
	goto scr_seq_00000038_00000366


scr_seq_00000038_0000009C:
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 75, 1
	.short 254, 0

scr_seq_00000038_000000E4:
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 75, 1
	.short 254, 0
scr_seq_00000038_0000012C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_403E, 8
	gotoif eq, scr_seq_00000038_0000033C
	comparevartovalue VAR_UNK_403E, 7
	gotoif eq, scr_seq_00000038_000002C4
	comparevartovalue VAR_UNK_403E, 4
	gotoif ge, scr_seq_00000038_00000277
	scrcmd_545 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000038_000002DB
	scrcmd_770 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000038_00000223
	comparevartovalue VAR_UNK_40EC, 4
	gotoif eq, scr_seq_00000038_000001F6
	comparevartovalue VAR_UNK_40EC, 3
	gotoif eq, scr_seq_00000038_000001D6
	comparevartovalue VAR_UNK_40EC, 2
	gotoif eq, scr_seq_00000038_000001C3
	comparevartovalue VAR_UNK_40EC, 1
	gotoif eq, scr_seq_00000038_000001BA
scr_seq_00000038_000001B1:
	msgbox 4
	goto scr_seq_00000038_00000366

scr_seq_00000038_000001BA:
	msgbox 5
	goto scr_seq_00000038_00000366

scr_seq_00000038_000001C3:
	comparevartovalue VAR_UNK_403E, 1
	gotoif eq, scr_seq_00000038_0000035D
	goto scr_seq_00000038_000002FA

scr_seq_00000038_000001D6:
	comparevartovalue VAR_UNK_403E, 2
	gotoif eq, scr_seq_00000038_0000035D
	comparevartovalue VAR_UNK_403E, 1
	gotoif eq, scr_seq_00000038_00000303
	goto scr_seq_00000038_000002FA

scr_seq_00000038_000001F6:
	comparevartovalue VAR_UNK_403E, 3
	gotoif eq, scr_seq_00000038_0000035D
	comparevartovalue VAR_UNK_403E, 2
	gotoif eq, scr_seq_00000038_0000030C
	comparevartovalue VAR_UNK_403E, 1
	gotoif eq, scr_seq_00000038_00000303
	goto scr_seq_00000038_000002FA

scr_seq_00000038_00000223:
	comparevartovalue VAR_UNK_40EC, 0
	gotoif eq, scr_seq_00000038_000001B1
	comparevartovalue VAR_UNK_40EC, 1
	gotoif eq, scr_seq_00000038_000001BA
	comparevartovalue VAR_UNK_403E, 4
	gotoif eq, scr_seq_00000038_0000035D
	comparevartovalue VAR_UNK_403E, 3
	gotoif eq, scr_seq_00000038_00000315
	comparevartovalue VAR_UNK_403E, 2
	gotoif eq, scr_seq_00000038_0000030C
	comparevartovalue VAR_UNK_403E, 1
	gotoif eq, scr_seq_00000038_00000303
	goto scr_seq_00000038_000002FA

scr_seq_00000038_00000277:
	comparevartovalue VAR_UNK_403E, 6
	gotoif eq, scr_seq_00000038_0000035D
	comparevartovalue VAR_UNK_40F1, 4
	gotoif eq, scr_seq_00000038_000002B1
	comparevartovalue VAR_UNK_403E, 5
	gotoif eq, scr_seq_00000038_0000035D
	comparevartovalue VAR_UNK_40F1, 1
	gotoif ge, scr_seq_00000038_00000321
	goto scr_seq_00000038_0000035D

scr_seq_00000038_000002B1:
	comparevartovalue VAR_UNK_403E, 5
	gotoif eq, scr_seq_00000038_0000032A
	goto scr_seq_00000038_00000321

scr_seq_00000038_000002C4:
	scrcmd_545 32780
	comparevartovalue VAR_SPECIAL_x800C, 28
	gotoif eq, scr_seq_00000038_00000333
	goto scr_seq_00000038_0000035D

scr_seq_00000038_000002DB:
	comparevartovalue VAR_UNK_40EC, 1
	gotoif eq, scr_seq_00000038_000002F1
	msgbox 4
	goto scr_seq_00000038_00000366

scr_seq_00000038_000002F1:
	msgbox 9
	goto scr_seq_00000038_00000366

scr_seq_00000038_000002FA:
	msgbox 6
	goto scr_seq_00000038_00000345

scr_seq_00000038_00000303:
	msgbox 7
	goto scr_seq_00000038_00000345

scr_seq_00000038_0000030C:
	msgbox 8
	goto scr_seq_00000038_00000345

scr_seq_00000038_00000315:
	msgbox 10
	msgbox 11
	goto scr_seq_00000038_00000345

scr_seq_00000038_00000321:
	msgbox 12
	goto scr_seq_00000038_00000345

scr_seq_00000038_0000032A:
	msgbox 13
	goto scr_seq_00000038_00000345

scr_seq_00000038_00000333:
	msgbox 14
	goto scr_seq_00000038_00000345

scr_seq_00000038_0000033C:
	msgbox 17
	goto scr_seq_00000038_00000366

scr_seq_00000038_00000345:
	buffer_players_name 0
	msgbox 16
	play_fanfare SEQ_ME_LVUP
	wait_fanfare
	addvar VAR_UNK_403E, 1
	goto scr_seq_00000038_00000366

scr_seq_00000038_0000035D:
	msgbox 15
	goto scr_seq_00000038_00000366

scr_seq_00000038_00000366:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000038_0000036E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_770 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000038_000003AA
	scrcmd_545 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000038_000003A1
	msgbox 19
	goto scr_seq_00000038_00000366

scr_seq_00000038_000003A1:
	msgbox 18
	goto scr_seq_00000038_00000366

scr_seq_00000038_000003AA:
	msgbox 20
	goto scr_seq_00000038_00000366

scr_seq_00000038_000003B3:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_403E, 7
	gotoif ge, scr_seq_00000038_000003EB
	scrcmd_770 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000038_000003E2
	msgbox 21
	goto scr_seq_00000038_00000366

scr_seq_00000038_000003E2:
	msgbox 22
	goto scr_seq_00000038_00000366

scr_seq_00000038_000003EB:
	msgbox 23
	goto scr_seq_00000038_00000366

scr_seq_00000038_000003F4:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 24
	goto scr_seq_00000038_00000366
	.balign 4, 0
