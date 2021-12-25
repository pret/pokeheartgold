#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000862_00000022 ; 000
	scrdef scr_seq_00000862_000001F4 ; 001
	scrdef scr_seq_00000862_000002ED ; 002
	scrdef scr_seq_00000862_000002DA ; 003
	scrdef scr_seq_00000862_00000364 ; 004
	scrdef scr_seq_00000862_00000377 ; 005
	scrdef scr_seq_00000862_0000038A ; 006
	scrdef scr_seq_00000862_0000039D ; 007
	scrdef_end

scr_seq_00000862_00000022:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_386 32780
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_00000862_00000049
	apply_movement 0, scr_seq_00000862_00000164
	goto scr_seq_00000862_00000087

scr_seq_00000862_00000049:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_00000862_00000064
	apply_movement 0, scr_seq_00000862_00000188
	goto scr_seq_00000862_00000087

scr_seq_00000862_00000064:
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000862_0000007F
	apply_movement 0, scr_seq_00000862_000001AC
	goto scr_seq_00000862_00000087

scr_seq_00000862_0000007F:
	apply_movement 0, scr_seq_00000862_000001D0
scr_seq_00000862_00000087:
	wait_movement
	msgbox 0
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000862_000000B0
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000862_000000D7
	end

scr_seq_00000862_000000B0:
	msgbox 1
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000862_000000D7
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000862_00000157
	end

scr_seq_00000862_000000D7:
	msgbox 2
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000862_000000FE
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000862_00000125
	end

scr_seq_00000862_000000FE:
	msgbox 3
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000862_00000125
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000862_00000157
	end

scr_seq_00000862_00000125:
	msgbox 4
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000862_0000014C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000862_00000157
	end

scr_seq_00000862_0000014C:
	msgbox 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000862_00000157:
	msgbox 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000862_00000162:
	.byte 0x00, 0x00

scr_seq_00000862_00000164:
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 254, 0

scr_seq_00000862_00000188:
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 254, 0

scr_seq_00000862_000001AC:
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 254, 0

scr_seq_00000862_000001D0:
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 254, 0
scr_seq_00000862_000001F4:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 12
	goto scr_seq_00000862_00000207

scr_seq_00000862_00000205:
	.byte 0x02, 0x00
scr_seq_00000862_00000207:
	msgbox 13
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
	gotoif ne, scr_seq_00000862_00000264
	msgbox 14
	goto scr_seq_00000862_00000207

scr_seq_00000862_0000025E:
	.byte 0x16, 0x00
	.byte 0x74, 0x00, 0x00, 0x00
scr_seq_00000862_00000264:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_00000862_00000280
	msgbox 15
	goto scr_seq_00000862_00000207

scr_seq_00000862_0000027A:
	.byte 0x16, 0x00, 0x58, 0x00, 0x00, 0x00
scr_seq_00000862_00000280:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_00000862_0000029C
	msgbox 16
	goto scr_seq_00000862_00000207

scr_seq_00000862_00000296:
	.byte 0x16, 0x00, 0x3c, 0x00, 0x00, 0x00
scr_seq_00000862_0000029C:
	comparevartovalue VAR_SPECIAL_x800C, 4
	gotoif ne, scr_seq_00000862_000002B8
	msgbox 17
	goto scr_seq_00000862_00000207

scr_seq_00000862_000002B2:
	.byte 0x16, 0x00, 0x20, 0x00, 0x00, 0x00
scr_seq_00000862_000002B8:
	comparevartovalue VAR_SPECIAL_x800C, 5
	gotoif ne, scr_seq_00000862_000002D4
	msgbox 18
	goto scr_seq_00000862_00000207

scr_seq_00000862_000002CE:
	.byte 0x16, 0x00
	.byte 0x04, 0x00, 0x00, 0x00
scr_seq_00000862_000002D4:
	closemsg
	releaseall
	end

scr_seq_00000862_000002DA:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 11
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000862_000002ED:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 19
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000862_00000353
	msgbox 20
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000862_00000353
	msgbox 21
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000862_00000353
	msgbox 22
	closemsg
	scrcmd_747
	apply_movement 1, scr_seq_00000862_0000035C
	wait_movement
	msgbox 23
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000862_00000353:
	closemsg
	scrcmd_747
	releaseall
	end

scr_seq_00000862_0000035B:
	.byte 0x00

scr_seq_00000862_0000035C:
	.short 32, 1
	.short 254, 0
scr_seq_00000862_00000364:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000862_00000377:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000862_0000038A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000862_0000039D:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 8
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
