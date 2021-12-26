#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000256_000001B4 ; 000
	scrdef scr_seq_00000256_00000012 ; 001
	scrdef scr_seq_00000256_000000FD ; 002
	scrdef scr_seq_00000256_000001C7 ; 003
	scrdef_end

scr_seq_00000256_00000012:
	scrcmd_081 1037
	play_bgm SEQ_GS_EYE_ROCKET
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000256_00000037
	goto scr_seq_00000256_00000095

scr_seq_00000256_00000031:
	.byte 0x16, 0x00, 0x2f, 0x00, 0x00, 0x00
scr_seq_00000256_00000037:
	apply_movement 0, scr_seq_00000256_00000114
	apply_movement 1, scr_seq_00000256_00000128
	wait_movement
	msgbox 0
	hasenoughmoneyimmediate 32780, 1000
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000256_0000006C
	msgbox 1
	closemsg
	goto scr_seq_00000256_00000077

scr_seq_00000256_0000006C:
	msgbox 2
	closemsg
	goto scr_seq_00000256_00000077

scr_seq_00000256_00000077:
	submoneyimmediate 1000
	apply_movement 0, scr_seq_00000256_00000144
	apply_movement 1, scr_seq_00000256_00000158
	wait_movement
	goto scr_seq_00000256_000000ED

scr_seq_00000256_00000095:
	apply_movement 0, scr_seq_00000256_00000164
	apply_movement 1, scr_seq_00000256_00000180
	wait_movement
	msgbox 0
	hasenoughmoneyimmediate 32780, 1000
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000256_000000CA
	msgbox 1
	closemsg
	goto scr_seq_00000256_000000D5

scr_seq_00000256_000000CA:
	msgbox 2
	closemsg
	goto scr_seq_00000256_000000D5

scr_seq_00000256_000000D5:
	submoneyimmediate 1000
	apply_movement 0, scr_seq_00000256_00000194
	apply_movement 1, scr_seq_00000256_000001A4
	wait_movement
scr_seq_00000256_000000ED:
	scrcmd_081 1112
	play_bgm SEQ_GS_R_7_42
	setvar VAR_UNK_410F, 1
	end

scr_seq_00000256_000000FD:
	checkflag FLAG_RED_GYARADOS_MEET
	gotoif TRUE, scr_seq_00000256_00000110
	setvar VAR_UNK_410F, 0
	end

scr_seq_00000256_00000110:
	end

scr_seq_00000256_00000112:
	.byte 0x00, 0x00

scr_seq_00000256_00000114:
	.short 75, 1
	.short 21, 3
	.short 23, 2
	.short 1, 1
	.short 254, 0

scr_seq_00000256_00000128:
	.short 63, 6
	.short 1, 1
	.short 75, 1
	.short 21, 3
	.short 22, 1
	.short 1, 1
	.short 254, 0

scr_seq_00000256_00000144:
	.short 62, 3
	.short 22, 2
	.short 20, 3
	.short 1, 1
	.short 254, 0

scr_seq_00000256_00000158:
	.short 23, 1
	.short 20, 3
	.short 254, 0

scr_seq_00000256_00000164:
	.short 63, 6
	.short 0, 1
	.short 75, 1
	.short 20, 4
	.short 23, 1
	.short 0, 1
	.short 254, 0

scr_seq_00000256_00000180:
	.short 75, 1
	.short 20, 4
	.short 22, 2
	.short 0, 1
	.short 254, 0

scr_seq_00000256_00000194:
	.short 62, 3
	.short 22, 1
	.short 21, 4
	.short 254, 0

scr_seq_00000256_000001A4:
	.short 23, 2
	.short 21, 4
	.short 0, 1
	.short 254, 0
scr_seq_00000256_000001B4:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000256_000001C7:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0CE
	gotoif TRUE, scr_seq_00000256_00000208
	msgbox 4
	setvar VAR_SPECIAL_x8004, 363
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000256_00000213
	callstd 2008
	waitbutton
	setflag FLAG_UNK_0CE
scr_seq_00000256_00000208:
	msgbox 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000256_00000213:
	callstd 2009
	closemsg
	releaseall
	end
	.balign 4, 0
