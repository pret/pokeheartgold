#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000786_0000010D ; 000
	scrdef scr_seq_00000786_000001CB ; 001
	scrdef scr_seq_00000786_0000000E ; 002
	scrdef_end

scr_seq_00000786_0000000E:
	scrcmd_142 28, 16385
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_00000786_00000107
	scrcmd_147 28, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000786_000000DE
	scrcmd_294 15, VAR_TEMP_x4002
	comparevartovalue VAR_TEMP_x4002, 1
	gotoif eq, scr_seq_00000786_0000004F
	goto scr_seq_00000786_00000101

scr_seq_00000786_0000004D:
	.byte 0x02, 0x00
scr_seq_00000786_0000004F:
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif ne, scr_seq_00000786_0000006C
	goto scr_seq_00000786_0000008D

scr_seq_00000786_00000066:
	.byte 0x16, 0x00, 0x1f, 0x00, 0x00, 0x00
scr_seq_00000786_0000006C:
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_00000786_00000085
	goto scr_seq_00000786_0000008D

scr_seq_00000786_0000007F:
	.byte 0x16
	.byte 0x00, 0x06, 0x00, 0x00, 0x00
scr_seq_00000786_00000085:
	goto scr_seq_00000786_00000101

scr_seq_00000786_0000008B:
	.byte 0x02, 0x00
scr_seq_00000786_0000008D:
	scrcmd_522 16384
	comparevartovalue VAR_TEMP_x4000, 14
	gotoif ne, scr_seq_00000786_000000A8
	setflag FLAG_UNK_2F2
	goto scr_seq_00000786_000000DC

scr_seq_00000786_000000A8:
	comparevartovalue VAR_TEMP_x4000, 15
	gotoif ne, scr_seq_00000786_000000BF
	setflag FLAG_UNK_2F2
	goto scr_seq_00000786_000000DC

scr_seq_00000786_000000BF:
	comparevartovalue VAR_TEMP_x4000, 16
	gotoif ne, scr_seq_00000786_000000D6
	setflag FLAG_UNK_2F2
	goto scr_seq_00000786_000000DC

scr_seq_00000786_000000D6:
	goto scr_seq_00000786_00000101

scr_seq_00000786_000000DC:
	end

scr_seq_00000786_000000DE:
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif ne, scr_seq_00000786_000000F9
	setflag FLAG_UNK_2F2
	goto scr_seq_00000786_000000FF

scr_seq_00000786_000000F9:
	goto scr_seq_00000786_00000101

scr_seq_00000786_000000FF:
	end

scr_seq_00000786_00000101:
	clearflag FLAG_UNK_2F2
	end

scr_seq_00000786_00000107:
	setflag FLAG_UNK_2F2
	end

scr_seq_00000786_0000010D:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_294 11, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000786_000001A5
	msgbox 0
	closemsg
	trainer_battle 256, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000786_000001BB
	scrcmd_295 11
	addvar VAR_UNK_4135, 1
	scrcmd_515 22
	settrainerflag 326
	settrainerflag 356
	settrainerflag 336
	settrainerflag 346
	msgbox 1
	scrcmd_190 0
	msgbox 2
	play_fanfare SEQ_ME_BADGE
	wait_fanfare
	msgbox 3
	goto scr_seq_00000786_0000017C

scr_seq_00000786_0000017C:
	setvar VAR_SPECIAL_x8004, 346
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000786_000001C1
	callstd 2033
	setflag FLAG_UNK_124
scr_seq_00000786_000001A5:
	checkflag FLAG_UNK_124
	gotoif lt, scr_seq_00000786_0000017C
	msgbox 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000786_000001BB:
	scrcmd_219
	releaseall
	end

scr_seq_00000786_000001C1:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_00000786_000001CB:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_294 11, VAR_SPECIAL_x800C
	scrcmd_190 0
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000786_000001F2
	msgbox 5
	goto scr_seq_00000786_000001F5

scr_seq_00000786_000001F2:
	msgbox 6
scr_seq_00000786_000001F5:
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
