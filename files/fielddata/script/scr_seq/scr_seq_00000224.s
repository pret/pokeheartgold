#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000224_0000002C ; 000
	scrdef scr_seq_00000224_00000170 ; 001
	scrdef scr_seq_00000224_0000000E ; 002
	scrdef_end

scr_seq_00000224_0000000E:
	apply_movement 0, scr_seq_00000224_00000020
	wait_movement
	setvar VAR_UNK_4126, 1
	end


scr_seq_00000224_00000020:
	.short 1, 1
	.short 75, 1
	.short 254, 0
scr_seq_00000224_0000002C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_137
	gotoif eq, scr_seq_00000224_0000012A
	faceplayer
	scrcmd_386 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000224_00000060
	apply_movement 0, scr_seq_00000224_00000140
	goto scr_seq_00000224_0000009E

scr_seq_00000224_00000060:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_00000224_0000007B
	apply_movement 0, scr_seq_00000224_0000014C
	goto scr_seq_00000224_0000009E

scr_seq_00000224_0000007B:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_00000224_00000096
	apply_movement 0, scr_seq_00000224_00000158
	goto scr_seq_00000224_0000009E

scr_seq_00000224_00000096:
	apply_movement 0, scr_seq_00000224_00000164
scr_seq_00000224_0000009E:
	wait_movement
	msgbox 0
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000224_000000BE
	apply_movement 0, scr_seq_00000224_00000164
	goto scr_seq_00000224_000000FC

scr_seq_00000224_000000BE:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_00000224_000000D9
	apply_movement 0, scr_seq_00000224_00000158
	goto scr_seq_00000224_000000FC

scr_seq_00000224_000000D9:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_00000224_000000F4
	apply_movement 0, scr_seq_00000224_0000014C
	goto scr_seq_00000224_000000FC

scr_seq_00000224_000000F4:
	apply_movement 0, scr_seq_00000224_00000140
scr_seq_00000224_000000FC:
	wait_movement
	msgbox 1
	setvar VAR_SPECIAL_x8004, 374
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000224_00000135
	callstd 2033
	setflag FLAG_UNK_137
scr_seq_00000224_0000012A:
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000224_00000135:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_00000224_0000013F:
	.byte 0x00

scr_seq_00000224_00000140:
	.short 63, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000224_0000014C:
	.short 63, 1
	.short 34, 1
	.short 254, 0

scr_seq_00000224_00000158:
	.short 63, 1
	.short 35, 1
	.short 254, 0

scr_seq_00000224_00000164:
	.short 63, 1
	.short 33, 1
	.short 254, 0
scr_seq_00000224_00000170:
	scrcmd_076 22, 0
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 3
	waitbutton
	closemsg
	releaseall
	scrcmd_077
	end
	.balign 4, 0
