#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000033_00000012 ; 000
	scrdef scr_seq_00000033_0000002F ; 001
	scrdef scr_seq_00000033_00000055 ; 002
	scrdef scr_seq_00000033_00000042 ; 003
	scrdef_end

scr_seq_00000033_00000012:
	setflag FLAG_UNK_1B7
	setvar VAR_UNK_4125, 0
	comparevartovalue VAR_UNK_4077, 4
	gotoif ne, scr_seq_00000033_0000002D
	clearflag FLAG_UNK_1B7
scr_seq_00000033_0000002D:
	end

scr_seq_00000033_0000002F:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000033_00000042:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000033_00000055:
	comparevartovalue VAR_UNK_4077, 4
	gotoif eq, scr_seq_00000033_00000075
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000033_00000075:
	getitemquantity 476, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000033_0000022B
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 0
	closemsg
	wait 16, VAR_SPECIAL_x800C
	scrcmd_386 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_00000033_000000B8
	apply_movement 0, scr_seq_00000033_00000258
	goto scr_seq_00000033_000000DB

scr_seq_00000033_000000B8:
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, scr_seq_00000033_000000D3
	apply_movement 0, scr_seq_00000033_0000024C
	goto scr_seq_00000033_000000DB

scr_seq_00000033_000000D3:
	apply_movement 0, scr_seq_00000033_00000240
scr_seq_00000033_000000DB:
	wait_movement
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif ne, scr_seq_00000033_000000F8
	apply_movement 0, scr_seq_00000033_00000264
	goto scr_seq_00000033_0000010D

scr_seq_00000033_000000F8:
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, scr_seq_00000033_0000010D
	apply_movement 0, scr_seq_00000033_00000274
scr_seq_00000033_0000010D:
	wait_movement
	msgbox 1
	closemsg
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif ne, scr_seq_00000033_0000012F
	apply_movement 0, scr_seq_00000033_00000284
	goto scr_seq_00000033_00000144

scr_seq_00000033_0000012F:
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, scr_seq_00000033_00000144
	apply_movement 0, scr_seq_00000033_0000028C
scr_seq_00000033_00000144:
	wait_movement
	scrcmd_190 0
	msgbox 2
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_00000033_00000167
	apply_movement 0, scr_seq_00000033_000002B0
	goto scr_seq_00000033_0000018A

scr_seq_00000033_00000167:
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, scr_seq_00000033_00000182
	apply_movement 0, scr_seq_00000033_00000294
	goto scr_seq_00000033_0000018A

scr_seq_00000033_00000182:
	apply_movement 0, scr_seq_00000033_000002C8
scr_seq_00000033_0000018A:
	wait_movement
	setflag FLAG_UNK_2C6
	clearflag FLAG_UNK_2C7
	scrcmd_100 2
	hide_person 0
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_00000033_000001B7
	apply_movement 2, scr_seq_00000033_00000328
	goto scr_seq_00000033_000001DA

scr_seq_00000033_000001B7:
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, scr_seq_00000033_000001D2
	apply_movement 2, scr_seq_00000033_00000310
	goto scr_seq_00000033_000001DA

scr_seq_00000033_000001D2:
	apply_movement 2, scr_seq_00000033_00000344
scr_seq_00000033_000001DA:
	wait_movement
	msgbox 3
	closemsg
	trainer_battle 487, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000033_0000021D
	msgbox 4
	setvar VAR_SPECIAL_x8004, 476
	setvar VAR_SPECIAL_x8005, 1
	callstd 2008
	closemsg
	releaseall
	setvar VAR_UNK_40E7, 2
	clearflag FLAG_UNK_237
	end

scr_seq_00000033_0000021D:
	scrcmd_219
	clearflag FLAG_UNK_2C6
	setflag FLAG_UNK_2C7
	releaseall
	end

scr_seq_00000033_0000022B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000033_0000023E:
	.byte 0x00, 0x00

scr_seq_00000033_00000240:
	.short 2, 1
	.short 75, 1
	.short 254, 0

scr_seq_00000033_0000024C:
	.short 3, 1
	.short 75, 1
	.short 254, 0

scr_seq_00000033_00000258:
	.short 1, 1
	.short 75, 1
	.short 254, 0

scr_seq_00000033_00000264:
	.short 71, 1
	.short 19, 1
	.short 72, 1
	.short 254, 0

scr_seq_00000033_00000274:
	.short 71, 1
	.short 18, 1
	.short 72, 1
	.short 254, 0

scr_seq_00000033_00000284:
	.short 18, 1
	.short 254, 0

scr_seq_00000033_0000028C:
	.short 19, 1
	.short 254, 0

scr_seq_00000033_00000294:
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 254, 0

scr_seq_00000033_000002B0:
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 254, 0

scr_seq_00000033_000002C8:
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 254, 0
	.byte 0x03, 0x00, 0x01, 0x00
	.byte 0x01, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x03, 0x00, 0x01, 0x00
	.byte 0x01, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00

scr_seq_00000033_00000310:
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 254, 0

scr_seq_00000033_00000328:
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 254, 0

scr_seq_00000033_00000344:
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 254, 0
	.balign 4, 0
