#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000802_00000006 ; 000
	scrdef_end

scr_seq_00000802_00000006:
	scrcmd_609
	lockall
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000802_00000058
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000802_0000002A
	end

scr_seq_00000802_0000002A:
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000802_00000170
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	apply_movement 253, scr_seq_00000802_0000017C
	wait_movement
	goto scr_seq_00000802_00000062

scr_seq_00000802_00000058:
	apply_movement 255, scr_seq_00000802_00000170
	wait_movement
scr_seq_00000802_00000062:
	scrcmd_241 16659
	copyvar VAR_SPECIAL_x8008, VAR_UNK_4113
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000802_00000088
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_00000802_00000098
	end

scr_seq_00000802_00000088:
	scrcmd_852 0, 2
	call scr_seq_00000802_000000A9
	goto scr_seq_00000802_000000B3

scr_seq_00000802_00000098:
	scrcmd_198 0, 0
	call scr_seq_00000802_000000A9
	goto scr_seq_00000802_000000EE

scr_seq_00000802_000000A9:
	scrcmd_242 20, 1, 16659, 16659
	return

scr_seq_00000802_000000B3:
	msgbox 0
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000802_00000150
	msgbox 3
	closemsg
	setvar VAR_UNK_4113, 65535
	scrcmd_240 379, 2, 5, 3, 1
	setvar VAR_SPECIAL_x8004, 0
	goto scr_seq_00000802_00000129

scr_seq_00000802_000000EE:
	msgbox 1
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000802_00000150
	msgbox 4
	closemsg
	setvar VAR_UNK_4113, 65535
	scrcmd_240 377, 1, 5, 3, 1
	setvar VAR_SPECIAL_x8004, 1
	goto scr_seq_00000802_00000129

scr_seq_00000802_00000129:
	wait_se SEQ_SE_DP_SELECT
	scrcmd_488 32772, 2
	scrcmd_241 16659
	comparevartovalue VAR_UNK_4113, 1
	gotoif ne, scr_seq_00000802_0000014D
	msgbox 6
	goto scr_seq_00000802_00000150

scr_seq_00000802_0000014D:
	msgbox 5
scr_seq_00000802_00000150:
	setvar VAR_UNK_4113, 65535
	wait 1, VAR_SPECIAL_x800C
	msgbox 2
	waitbutton
	closemsg
	setvar VAR_UNK_4125, 1
	releaseall
	end

scr_seq_00000802_0000016D:
	.byte 0x00, 0x00, 0x00

scr_seq_00000802_00000170:
	.short 12, 2
	.short 33, 1
	.short 254, 0

scr_seq_00000802_0000017C:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
	.balign 4, 0
