#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000230_0000001A ; 000
	scrdef scr_seq_00000230_0000001C ; 001
	scrdef scr_seq_00000230_000002DC ; 002
	scrdef scr_seq_00000230_000002F3 ; 003
	scrdef scr_seq_00000230_00000308 ; 004
	scrdef scr_seq_00000230_0000032E ; 005
	scrdef_end

scr_seq_00000230_0000001A:
	end

scr_seq_00000230_0000001C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4114, 1
	gotoif ne, scr_seq_00000230_0000003D
	goto scr_seq_00000230_00000098

scr_seq_00000230_00000037:
	.byte 0x16, 0x00, 0x50, 0x00, 0x00, 0x00
scr_seq_00000230_0000003D:
	comparevartovalue VAR_UNK_4114, 2
	gotoif ne, scr_seq_00000230_00000056
	goto scr_seq_00000230_000001AD

scr_seq_00000230_00000050:
	.byte 0x16, 0x00, 0x37, 0x00, 0x00, 0x00
scr_seq_00000230_00000056:
	comparevartovalue VAR_UNK_4114, 4
	gotoif ne, scr_seq_00000230_0000006F
	goto scr_seq_00000230_000001AD

scr_seq_00000230_00000069:
	.byte 0x16, 0x00, 0x1e, 0x00, 0x00, 0x00
scr_seq_00000230_0000006F:
	comparevartovalue VAR_UNK_4114, 6
	gotoif ne, scr_seq_00000230_0000008D
	scrcmd_781 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000230_000002AE
scr_seq_00000230_0000008D:
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000230_00000098:
	msgbox 1
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_349
	scrcmd_351 16384
	comparevartovalue VAR_TEMP_x4000, 255
	gotoif eq, scr_seq_00000230_00000206
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif eq, scr_seq_00000230_0000021F
	scrcmd_426 32780, 16384, 0
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000230_00000238
	scrcmd_426 32780, 16384, 1
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000230_00000251
	scrcmd_363 7, 16384, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000230_0000026A
	comparevartovalue VAR_SPECIAL_x800C, 4
	gotoif eq, scr_seq_00000230_00000295
	scrcmd_364 16384
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000230_00000149
	apply_movement 255, scr_seq_00000230_000002BC
	goto scr_seq_00000230_00000187

scr_seq_00000230_00000149:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000230_00000164
	apply_movement 255, scr_seq_00000230_000002C4
	goto scr_seq_00000230_00000187

scr_seq_00000230_00000164:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_00000230_0000017F
	apply_movement 255, scr_seq_00000230_000002CC
	goto scr_seq_00000230_00000187

scr_seq_00000230_0000017F:
	apply_movement 255, scr_seq_00000230_000002D4
scr_seq_00000230_00000187:
	wait_movement
	buffer_players_name 0
	msgbox 5
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
scr_seq_00000230_00000195:
	msgbox 7
	setvar VAR_UNK_4114, 2
	comparevartovar VAR_TEMP_x4000, VAR_TEMP_x4001
	gotoif ne, scr_seq_00000230_000001AD
	scrcmd_606
scr_seq_00000230_000001AD:
	setvar VAR_SPECIAL_x8004, 371
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000230_000001FC
	callstd 2033
	comparevartovalue VAR_UNK_4114, 2
	gotoif ne, scr_seq_00000230_000001EB
	setvar VAR_UNK_4114, 3
	goto scr_seq_00000230_000001F1

scr_seq_00000230_000001EB:
	setvar VAR_UNK_4114, 5
scr_seq_00000230_000001F1:
	msgbox 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000230_000001FC:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_00000230_00000206:
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	msgbox 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000230_0000021F:
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	msgbox 15
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000230_00000238:
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000230_00000251:
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000230_0000026A:
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	msgbox 4
	closemsg
	buffer_players_name 0
	msgbox 6
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	scrcmd_428 16384
	goto scr_seq_00000230_00000195

scr_seq_00000230_00000293:
	.byte 0x02, 0x00
scr_seq_00000230_00000295:
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	msgbox 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000230_000002AE:
	setvar VAR_UNK_4114, 1
	goto scr_seq_00000230_00000098

scr_seq_00000230_000002BA:
	.byte 0x02, 0x00

scr_seq_00000230_000002BC:
	.short 32, 1
	.short 254, 0

scr_seq_00000230_000002C4:
	.short 33, 1
	.short 254, 0

scr_seq_00000230_000002CC:
	.short 34, 1
	.short 254, 0

scr_seq_00000230_000002D4:
	.short 35, 1
	.short 254, 0
scr_seq_00000230_000002DC:
	scrcmd_055 13, 1, 2, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000230_000002F3:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 14, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000230_00000308:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 12
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000230_0000031B:
	.byte 0x49, 0x00, 0xdc, 0x05, 0x60
	.byte 0x00, 0x68, 0x00, 0x2d, 0x00, 0x01, 0x32, 0x00, 0x35, 0x00, 0x61, 0x00, 0x02, 0x00
scr_seq_00000230_0000032E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 11
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
