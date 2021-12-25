#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000175_000002EA ; 000
	scrdef scr_seq_00000175_00000016 ; 001
	scrdef scr_seq_00000175_000000CD ; 002
	scrdef scr_seq_00000175_0000019B ; 003
	scrdef scr_seq_00000175_0000023B ; 004
	scrdef_end

scr_seq_00000175_00000016:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_517 386, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000175_000002DF
	scrcmd_529 16384
	scrcmd_354 16384, 16385
	comparevartovalue VAR_TEMP_x4001, 386
	gotoif eq, scr_seq_00000175_00000050
	scrcmd_518 3
	goto scr_seq_00000175_000000BE

scr_seq_00000175_00000050:
	scrcmd_518 3
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_105 32774, 32775
	scrcmd_386 32780
	scrcmd_176 11, 0, 32774, 32775, 32780
	scrcmd_184 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000175_000000B2
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000175_0000009E
	scrcmd_605 0, 1
	goto scr_seq_00000175_000000A2

scr_seq_00000175_0000009E:
	scrcmd_605 3, 2
scr_seq_00000175_000000A2:
	scrcmd_602 0
	scrcmd_608
	wait 10, VAR_SPECIAL_x800C
	scrcmd_602 1
scr_seq_00000175_000000B2:
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
scr_seq_00000175_000000BE:
	scrcmd_076 386, 0
	msgbox 2
	goto scr_seq_00000175_000002D5

scr_seq_00000175_000000CD:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_517 386, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000175_000002DF
	scrcmd_529 16384
	scrcmd_354 16384, 16385
	comparevartovalue VAR_TEMP_x4001, 386
	gotoif eq, scr_seq_00000175_00000107
	scrcmd_518 2
	goto scr_seq_00000175_0000018C

scr_seq_00000175_00000107:
	scrcmd_518 2
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_105 32774, 32775
	scrcmd_386 32780
	scrcmd_176 11, 0, 32774, 32775, 32780
	scrcmd_184 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000175_00000180
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000175_00000155
	scrcmd_605 0, 1
	goto scr_seq_00000175_00000170

scr_seq_00000175_00000155:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_00000175_0000016C
	scrcmd_605 0, 1
	goto scr_seq_00000175_00000170

scr_seq_00000175_0000016C:
	scrcmd_605 3, 2
scr_seq_00000175_00000170:
	scrcmd_602 0
	scrcmd_608
	wait 10, VAR_SPECIAL_x800C
	scrcmd_602 1
scr_seq_00000175_00000180:
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
scr_seq_00000175_0000018C:
	scrcmd_076 386, 0
	msgbox 3
	goto scr_seq_00000175_000002D5

scr_seq_00000175_0000019B:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_517 386, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000175_000002DF
	scrcmd_529 16384
	scrcmd_354 16384, 16385
	comparevartovalue VAR_TEMP_x4001, 386
	gotoif eq, scr_seq_00000175_000001D5
	scrcmd_518 1
	goto scr_seq_00000175_0000022C

scr_seq_00000175_000001D5:
	scrcmd_518 1
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_105 32774, 32775
	scrcmd_386 32780
	scrcmd_176 11, 0, 32774, 32775, 32780
	scrcmd_184 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000175_00000220
	scrcmd_605 2, 3
	scrcmd_602 0
	scrcmd_608
	wait 10, VAR_SPECIAL_x800C
	scrcmd_602 1
scr_seq_00000175_00000220:
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
scr_seq_00000175_0000022C:
	scrcmd_076 386, 0
	msgbox 4
	goto scr_seq_00000175_000002D5

scr_seq_00000175_0000023B:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_517 386, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000175_000002DF
	scrcmd_529 16384
	scrcmd_354 16384, 16385
	comparevartovalue VAR_TEMP_x4001, 386
	gotoif eq, scr_seq_00000175_00000275
	scrcmd_518 0
	goto scr_seq_00000175_000002CC

scr_seq_00000175_00000275:
	scrcmd_518 0
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_105 32774, 32775
	scrcmd_386 32780
	scrcmd_176 11, 0, 32774, 32775, 32780
	scrcmd_184 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000175_000002C0
	scrcmd_605 3, 2
	scrcmd_602 0
	scrcmd_608
	wait 10, VAR_SPECIAL_x800C
	scrcmd_602 1
scr_seq_00000175_000002C0:
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
scr_seq_00000175_000002CC:
	scrcmd_076 386, 0
	msgbox 5
scr_seq_00000175_000002D5:
	waitbutton
	scrcmd_077
	closemsg
	releaseall
	end

scr_seq_00000175_000002DF:
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000175_000002EA:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 0, 32780
	callstd 2000
	end
	.balign 4, 0
