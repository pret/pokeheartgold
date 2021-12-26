#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000896_00000154 ; 000
	scrdef scr_seq_00000896_000003B5 ; 001
	scrdef scr_seq_00000896_00000012 ; 002
	scrdef scr_seq_00000896_0000005A ; 003
	scrdef_end

scr_seq_00000896_00000012:
	checkflag FLAG_UNK_15D
	gotoif TRUE, scr_seq_00000896_00000058
	checkflag FLAG_UNK_0B5
	gotoif FALSE, scr_seq_00000896_00000058
	scrcmd_688 16384, 492
	comparevartovalue VAR_TEMP_x4000, 255
	gotoif eq, scr_seq_00000896_00000058
	get_lead_mon_index VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 492
	gotoif ne, scr_seq_00000896_00000058
	setvar VAR_UNK_4082, 1
scr_seq_00000896_00000058:
	end

scr_seq_00000896_0000005A:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000896_000000FC
	apply_movement 1, scr_seq_00000896_00000110
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	apply_movement 1, scr_seq_00000896_00000120
	apply_movement 255, scr_seq_00000896_00000108
	apply_movement 253, scr_seq_00000896_0000014C
	wait_movement
	msgbox 5
	closemsg
	apply_movement 1, scr_seq_00000896_0000012C
	wait_movement
	msgbox 6
	setvar VAR_SPECIAL_x8004, 466
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_TEMP_x4002
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif eq, scr_seq_00000896_000000EA
	callstd 2033
	msgbox 7
	waitbutton
	closemsg
	setflag FLAG_UNK_15D
	setvar VAR_UNK_4082, 0
	releaseall
	end

scr_seq_00000896_000000EA:
	callstd 2009
	closemsg
	releaseall
	setvar VAR_UNK_4082, 0
	releaseall
	end


scr_seq_00000896_000000FC:
	.short 12, 1
	.short 63, 1
	.short 254, 0

scr_seq_00000896_00000108:
	.short 3, 1
	.short 254, 0

scr_seq_00000896_00000110:
	.short 63, 1
	.short 2, 1
	.short 75, 1
	.short 254, 0

scr_seq_00000896_00000120:
	.short 13, 1
	.short 14, 1
	.short 254, 0

scr_seq_00000896_0000012C:
	.short 38, 4
	.short 254, 0

scr_seq_00000896_00000134:
	.short 37, 4
	.short 254, 0

scr_seq_00000896_0000013C:
	.short 36, 4
	.short 254, 0

scr_seq_00000896_00000144:
	.short 39, 4
	.short 254, 0

scr_seq_00000896_0000014C:
	.short 3, 1
	.short 254, 0
scr_seq_00000896_00000154:
	checkflag FLAG_UNK_0B5
	gotoif TRUE, scr_seq_00000896_000001E5
	scrcmd_294 2, VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, scr_seq_00000896_00000185
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000896_00000185:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	hasitem ITEM_SQUIRTBOTTLE, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000896_000001D0
	msgbox 1
	setvar VAR_SPECIAL_x8004, 477
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000896_000001DB
	callstd 2033
	closemsg
	releaseall
	end

scr_seq_00000896_000001D0:
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000896_000001DB:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_00000896_000001E5:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 3
	msgbox 8
	scrcmd_746
	scrcmd_113 20, 2
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 213, 470, 0
	scrcmd_751 214, 472, 1
	scrcmd_751 215, 471, 2
	scrcmd_751 216, 473, 3
	scrcmd_751 217, 474, 4
	scrcmd_752
	copyvar VAR_SPECIAL_x8000, VAR_SPECIAL_x800C
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x8000
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000896_0000033D
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000896_00000349
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000896_00000355
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_00000896_00000361
	msgbox 10
	goto scr_seq_00000896_0000031F

scr_seq_00000896_00000276:
	comparevartovalue VAR_SPECIAL_x8000, 0
	callif eq, scr_seq_00000896_0000036D
	comparevartovalue VAR_SPECIAL_x8000, 1
	callif eq, scr_seq_00000896_00000377
	comparevartovalue VAR_SPECIAL_x8000, 2
	callif eq, scr_seq_00000896_00000381
	comparevartovalue VAR_SPECIAL_x8000, 3
	callif eq, scr_seq_00000896_0000038B
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000896_00000334
	hasspaceforitem VAR_SPECIAL_x8001, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000896_0000032B
	comparevartovalue VAR_SPECIAL_x8000, 0
	callif eq, scr_seq_00000896_00000395
	comparevartovalue VAR_SPECIAL_x8000, 1
	callif eq, scr_seq_00000896_0000039D
	comparevartovalue VAR_SPECIAL_x8000, 2
	callif eq, scr_seq_00000896_000003A5
	comparevartovalue VAR_SPECIAL_x8000, 3
	callif eq, scr_seq_00000896_000003AD
	scrcmd_115
	play_se SEQ_SE_DP_REGI
	giveitem VAR_SPECIAL_x8001, 1, VAR_SPECIAL_x800C
	scrcmd_194 0, 32769
	msgbox 11
	msgbox 9
	goto scr_seq_00000896_0000031F

scr_seq_00000896_0000031F:
	waitbutton
	closemsg
	scrcmd_747
	scrcmd_114
	releaseall
	end

scr_seq_00000896_0000032B:
	msgbox 12
	goto scr_seq_00000896_0000031F

scr_seq_00000896_00000334:
	msgbox 13
	goto scr_seq_00000896_0000031F

scr_seq_00000896_0000033D:
	setvar VAR_SPECIAL_x8001, 95
	goto scr_seq_00000896_00000276

scr_seq_00000896_00000349:
	setvar VAR_SPECIAL_x8001, 96
	goto scr_seq_00000896_00000276

scr_seq_00000896_00000355:
	setvar VAR_SPECIAL_x8001, 97
	goto scr_seq_00000896_00000276

scr_seq_00000896_00000361:
	setvar VAR_SPECIAL_x8001, 98
	goto scr_seq_00000896_00000276

scr_seq_00000896_0000036D:
	hasenoughmoneyimmediate 32780, 200
	return

scr_seq_00000896_00000377:
	hasenoughmoneyimmediate 32780, 200
	return

scr_seq_00000896_00000381:
	hasenoughmoneyimmediate 32780, 200
	return

scr_seq_00000896_0000038B:
	hasenoughmoneyimmediate 32780, 200
	return

scr_seq_00000896_00000395:
	submoneyimmediate 200
	return

scr_seq_00000896_0000039D:
	submoneyimmediate 200
	return

scr_seq_00000896_000003A5:
	submoneyimmediate 200
	return

scr_seq_00000896_000003AD:
	submoneyimmediate 200
	return

scr_seq_00000896_000003B5:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_15D
	gotoif TRUE, scr_seq_00000896_000003FD
	scrcmd_688 32780, 492
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_00000896_000003F2
	get_lead_mon_index VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 492
	gotoif eq, scr_seq_00000896_00000432
scr_seq_00000896_000003F2:
	msgbox 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000896_000003FD:
	scrcmd_688 32780, 492
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_00000896_000003F2
	get_lead_mon_index VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 492
	gotoif ne, scr_seq_00000896_000003F2
	msgbox 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000896_00000432:
	apply_movement 1, scr_seq_00000896_000004F0
	wait_movement
	msgbox 5
	closemsg
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000896_00000460
	apply_movement 1, scr_seq_00000896_00000134
	goto scr_seq_00000896_0000049E

scr_seq_00000896_00000460:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000896_0000047B
	apply_movement 1, scr_seq_00000896_0000013C
	goto scr_seq_00000896_0000049E

scr_seq_00000896_0000047B:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_00000896_00000496
	apply_movement 1, scr_seq_00000896_00000144
	goto scr_seq_00000896_0000049E

scr_seq_00000896_00000496:
	apply_movement 1, scr_seq_00000896_0000012C
scr_seq_00000896_0000049E:
	wait_movement
	msgbox 6
	setvar VAR_SPECIAL_x8004, 466
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_TEMP_x4002
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif eq, scr_seq_00000896_000004DD
	callstd 2033
	msgbox 7
	waitbutton
	closemsg
	setflag FLAG_UNK_15D
	setvar VAR_UNK_4082, 0
	releaseall
	end

scr_seq_00000896_000004DD:
	callstd 2009
	closemsg
	releaseall
	setvar VAR_UNK_4082, 0
	releaseall
	end

scr_seq_00000896_000004EF:
	.byte 0x00

scr_seq_00000896_000004F0:
	.short 75, 1
	.short 254, 0
	.balign 4, 0
