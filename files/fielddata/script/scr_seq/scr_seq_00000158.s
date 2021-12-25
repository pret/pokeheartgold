#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000158_0000000A ; 000
	scrdef scr_seq_00000158_000001F0 ; 001
	scrdef_end

scr_seq_00000158_0000000A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0ED
	gotoif lt, scr_seq_00000158_00000112
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, scr_seq_00000158_0000009D
	apply_movement 0, scr_seq_00000158_00000120
	wait_movement
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 0, scr_seq_00000158_00000144
	apply_movement 255, scr_seq_00000158_000001C8
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	msgbox 5
	closemsg
	trainer_battle 238, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000158_0000010C
	msgbox 6
	closemsg
	apply_movement 0, scr_seq_00000158_00000160
	wait_movement
	setvar VAR_UNK_40CB, 3
	hide_person 0
	setflag FLAG_UNK_21A
	releaseall
	end

scr_seq_00000158_0000009D:
	apply_movement 0, scr_seq_00000158_0000016C
	wait_movement
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 0, scr_seq_00000158_00000190
	apply_movement 255, scr_seq_00000158_000001DC
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	msgbox 5
	closemsg
	trainer_battle 238, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000158_0000010C
	msgbox 6
	closemsg
	apply_movement 0, scr_seq_00000158_000001AC
	wait_movement
	setvar VAR_UNK_40CB, 3
	hide_person 0
	setflag FLAG_UNK_21A
	releaseall
	end

scr_seq_00000158_0000010C:
	scrcmd_219
	releaseall
	end

scr_seq_00000158_00000112:
	msgbox 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000158_0000011D:
	.byte 0x00, 0x00, 0x00

scr_seq_00000158_00000120:
	.short 75, 1
	.short 63, 1
	.short 3, 2
	.short 2, 2
	.short 3, 2
	.short 71, 1
	.short 58, 1
	.short 72, 1
	.short 254, 0

scr_seq_00000158_00000144:
	.short 0, 2
	.short 16, 2
	.short 3, 2
	.short 19, 4
	.short 1, 2
	.short 17, 1
	.short 254, 0

scr_seq_00000158_00000160:
	.short 0, 2
	.short 16, 7
	.short 254, 0

scr_seq_00000158_0000016C:
	.short 75, 1
	.short 63, 1
	.short 2, 2
	.short 3, 2
	.short 2, 2
	.short 71, 1
	.short 59, 1
	.short 72, 1
	.short 254, 0

scr_seq_00000158_00000190:
	.short 0, 2
	.short 16, 2
	.short 2, 2
	.short 18, 4
	.short 1, 2
	.short 17, 1
	.short 254, 0

scr_seq_00000158_000001AC:
	.short 0, 2
	.short 16, 3
	.short 3, 2
	.short 19, 4
	.short 0, 2
	.short 16, 4
	.short 254, 0

scr_seq_00000158_000001C8:
	.short 65, 1
	.short 3, 2
	.short 15, 1
	.short 0, 2
	.short 254, 0

scr_seq_00000158_000001DC:
	.short 65, 1
	.short 2, 2
	.short 14, 1
	.short 0, 2
	.short 254, 0
scr_seq_00000158_000001F0:
	scrcmd_609
	lockall
	apply_movement 255, scr_seq_00000158_000002B4
	wait_movement
	msgbox 0
	closemsg
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	play_fanfare SEQ_ME_ASA
	wait_fanfare
	scrcmd_282
	scrcmd_436
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	msgbox 1
	closemsg
	scrcmd_729 VAR_TEMP_x4002
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif eq, scr_seq_00000158_00000247
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 56
scr_seq_00000158_00000247:
	apply_movement 255, scr_seq_00000158_000002C4
	wait_movement
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif eq, scr_seq_00000158_00000268
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
scr_seq_00000158_00000268:
	comparevartovalue VAR_UNK_40CB, 7
	gotoif ge, scr_seq_00000158_00000279
	releaseall
	end

scr_seq_00000158_00000279:
	checkflag FLAG_UNK_0EB
	gotoif eq, scr_seq_00000158_000002AD
	play_se SEQ_SE_DP_PINPON
	wait_se SEQ_SE_DP_PINPON
	setflag FLAG_UNK_0EB
	comparevartovalue VAR_UNK_40E1, 1
	gotoif ne, scr_seq_00000158_000002A6
	msgbox 3
	goto scr_seq_00000158_000002A9

scr_seq_00000158_000002A6:
	msgbox 2
scr_seq_00000158_000002A9:
	waitbutton
	closemsg
scr_seq_00000158_000002AD:
	releaseall
	end

scr_seq_00000158_000002B1:
	.byte 0x00, 0x00, 0x00

scr_seq_00000158_000002B4:
	.short 1, 2
	.short 65, 1
	.short 75, 1
	.short 254, 0

scr_seq_00000158_000002C4:
	.short 3, 2
	.short 55, 1
	.short 254, 0
	.balign 4, 0
