#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000845_0000001E ; 000
	scrdef scr_seq_00000845_00000126 ; 001
	scrdef scr_seq_00000845_00000449 ; 002
	scrdef scr_seq_00000845_0000045A ; 003
	scrdef scr_seq_00000845_0000046B ; 004
	scrdef scr_seq_00000845_0000047C ; 005
	scrdef scr_seq_00000845_000000DC ; 006
	scrdef_end

scr_seq_00000845_0000001E:
	scrcmd_609
	lockall
	apply_movement 255, scr_seq_00000845_000000A4
	apply_movement 0, scr_seq_00000845_000000B0
	wait_movement
	callstd 2036
	wait 30, VAR_SPECIAL_x800C
	apply_movement 0, scr_seq_00000845_000000B8
	wait_movement
	scrcmd_190 0
	scrcmd_132 0, 1
	setflag FLAG_UNK_11B
	scrcmd_078 1418
	scrcmd_079
	msgbox 2
	setflag FLAG_UNK_11C
	scrcmd_078 1418
	scrcmd_079
	msgbox 3
	setflag FLAG_UNK_11D
	scrcmd_078 1418
	scrcmd_079
	msgbox 4
	setflag FLAG_UNK_11E
	scrcmd_078 1418
	scrcmd_079
	msgbox 5
	closemsg
	wait 15, VAR_SPECIAL_x800C
	apply_movement 0, scr_seq_00000845_000000C8
	wait_movement
	callstd 2038
	setvar VAR_UNK_4106, 1
	releaseall
	end

scr_seq_00000845_000000A3:
	.byte 0x00

scr_seq_00000845_000000A4:
	.short 62, 1
	.short 33, 1
	.short 254, 0

scr_seq_00000845_000000B0:
	.short 32, 1
	.short 254, 0

scr_seq_00000845_000000B8:
	.short 12, 2
	.short 14, 3
	.short 12, 1
	.short 254, 0

scr_seq_00000845_000000C8:
	.short 33, 1
	.short 13, 3
	.short 15, 3
	.short 32, 1
	.short 254, 0
scr_seq_00000845_000000DC:
	scrcmd_609
	lockall
	apply_movement 255, scr_seq_00000845_000000A4
	apply_movement 0, scr_seq_00000845_000000B0
	wait_movement
	callstd 2036
	wait 30, VAR_SPECIAL_x800C
	apply_movement 0, scr_seq_00000845_000000B8
	wait_movement
	scrcmd_190 0
	msgbox 33
	closemsg
	apply_movement 0, scr_seq_00000845_000000C8
	wait_movement
	callstd 2038
	setvar VAR_UNK_4106, 4
	releaseall
	end

scr_seq_00000845_00000126:
	checkflag FLAG_UNK_964
	gotoif eq, scr_seq_00000845_0000015C
	comparevartovalue VAR_UNK_4108, 4
	gotoif ge, scr_seq_00000845_00000205
	checkflag FLAG_UNK_06A
	gotoif eq, scr_seq_00000845_00000179
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000845_0000015C:
	hasitem ITEM_S_S__TICKET, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000845_000001F2
	goto scr_seq_00000845_00000205

scr_seq_00000845_00000177:
	.byte 0x02, 0x00
scr_seq_00000845_00000179:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_09C
	gotoif eq, scr_seq_00000845_000001D4
	scrcmd_190 0
	msgbox 7
	scrcmd_190 0
	msgbox 8
	setflag FLAG_UNK_09C
	scrcmd_078 1185
	scrcmd_079
	msgbox 9
	msgbox 10
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000845_000001C6
	msgbox 11
	goto scr_seq_00000845_000001C9

scr_seq_00000845_000001C6:
	msgbox 12
scr_seq_00000845_000001C9:
	msgbox 13
	scrcmd_051
	closemsg
	releaseall
	end

scr_seq_00000845_000001D4:
	msgbox 14
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000845_000001DF:
	.byte 0x49
	.byte 0x00, 0xdc, 0x05, 0x60, 0x00, 0x68, 0x00, 0x2d, 0x00, 0x07, 0x32, 0x00, 0x35, 0x00, 0x61, 0x00
	.byte 0x02, 0x00
scr_seq_00000845_000001F2:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 34
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000845_00000205:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0A7
	gotoif eq, scr_seq_00000845_00000275
	scrcmd_294 0, 16384
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_00000845_00000234
	msgbox 15
	goto scr_seq_00000845_0000023A

scr_seq_00000845_00000234:
	scrcmd_190 0
	msgbox 16
scr_seq_00000845_0000023A:
	setflag FLAG_UNK_0A7
	setvar VAR_UNK_4095, 0
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000845_00000266
	msgbox 17
	setflag FLAG_UNK_986
	goto scr_seq_00000845_0000026D

scr_seq_00000845_00000266:
	msgbox 18
	clearflag FLAG_UNK_986
scr_seq_00000845_0000026D:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000845_00000275:
	msgbox 20
	scrcmd_795 1, 1
	scrcmd_746
	scrcmd_750 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 29, 255, 0
	scrcmd_751 30, 255, 1
	scrcmd_751 31, 255, 2
	scrcmd_751 32, 255, 3
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000845_000002DF
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000845_00000335
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000845_00000398
	goto scr_seq_00000845_000003D1

scr_seq_00000845_000002DD:
	.byte 0x02, 0x00
scr_seq_00000845_000002DF:
	scrcmd_838 1, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000845_0000043A
	scrcmd_794 32780, 1
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000845_0000041C
	scrcmd_793 1, 32780
	scrcmd_796
	scrcmd_747
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000845_000003E0
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000845_00000411
	releaseall
	end

scr_seq_00000845_00000335:
	scrcmd_838 0, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000845_0000042B
	hasenoughmoneyvar 32780, 1
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000845_00000389
	scrcmd_793 0, 32780
	scrcmd_796
	scrcmd_747
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000845_000003FA
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000845_00000411
	releaseall
	end

scr_seq_00000845_00000389:
	scrcmd_747
	scrcmd_796
	msgbox 26
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000845_00000398:
	msgbox 25
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	scrcmd_796
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000845_000003C2
	scrcmd_190 0
	msgbox 17
	setflag FLAG_UNK_986
	goto scr_seq_00000845_000003C9

scr_seq_00000845_000003C2:
	msgbox 18
	clearflag FLAG_UNK_986
scr_seq_00000845_000003C9:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000845_000003D1:
	scrcmd_796
	scrcmd_747
	msgbox 21
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000845_000003E0:
	closemsg
	wait 8, VAR_SPECIAL_x800C
	play_se SEQ_SE_GS_OKOZUKAI
	scrcmd_190 0
	msgbox 24
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000845_000003FA:
	closemsg
	wait 8, VAR_SPECIAL_x800C
	play_se SEQ_SE_GS_OKOZUKAI
	msgbox 23
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000845_00000411:
	msgbox 21
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000845_0000041C:
	scrcmd_747
	scrcmd_796
	msgbox 22
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000845_0000042B:
	scrcmd_747
	scrcmd_796
	msgbox 27
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000845_0000043A:
	scrcmd_747
	scrcmd_796
	msgbox 28
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000845_00000449:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 35
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000845_0000045A:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 36
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000845_0000046B:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 37
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000845_0000047C:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 38
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
