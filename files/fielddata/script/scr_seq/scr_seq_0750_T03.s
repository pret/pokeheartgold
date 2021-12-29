#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0750_T03_007B ; 000
	scrdef scr_seq_0750_T03_0290 ; 001
	scrdef scr_seq_0750_T03_02A3 ; 002
	scrdef scr_seq_0750_T03_02B6 ; 003
	scrdef scr_seq_0750_T03_02CD ; 004
	scrdef scr_seq_0750_T03_02E2 ; 005
	scrdef scr_seq_0750_T03_02F7 ; 006
	scrdef scr_seq_0750_T03_0113 ; 007
	scrdef scr_seq_0750_T03_003A ; 008
	scrdef scr_seq_0750_T03_0653 ; 009
	scrdef scr_seq_0750_T03_0488 ; 010
	scrdef scr_seq_0750_T03_0362 ; 011
	scrdef scr_seq_0750_T03_03B5 ; 012
	scrdef scr_seq_0750_T03_037F ; 013
	scrdef_end

scr_seq_0750_T03_003A:
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_0750_T03_004B
	clearflag FLAG_UNK_189
	end

scr_seq_0750_T03_004B:
	goto scr_seq_0750_T03_030E

scr_seq_0750_T03_0051:
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif eq, scr_seq_0750_T03_0075
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif eq, scr_seq_0750_T03_0075
	setflag FLAG_HIDE_CAMERON
	end

scr_seq_0750_T03_0075:
	clearflag FLAG_HIDE_CAMERON
	end

scr_seq_0750_T03_007B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_495 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif ne, scr_seq_0750_T03_00A5
	checkflag FLAG_UNK_094
	gotoif TRUE, scr_seq_0750_T03_0108
	goto scr_seq_0750_T03_00B0

scr_seq_0750_T03_00A5:
	checkflag FLAG_UNK_093
	gotoif TRUE, scr_seq_0750_T03_0108
scr_seq_0750_T03_00B0:
	npc_msg 2
	scrcmd_495 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif ne, scr_seq_0750_T03_00E6
	setvar VAR_SPECIAL_x8004, 482
	setvar VAR_SPECIAL_x8005, 1
	callstd 2008
	setflag FLAG_UNK_094
	clearflag FLAG_UNK_243
	setflag FLAG_UNK_245
	goto scr_seq_0750_T03_0102

scr_seq_0750_T03_00E6:
	setvar VAR_SPECIAL_x8004, 483
	setvar VAR_SPECIAL_x8005, 1
	callstd 2008
	setflag FLAG_UNK_093
	clearflag FLAG_UNK_242
	setflag FLAG_UNK_244
scr_seq_0750_T03_0102:
	closemsg
	releaseall
	end

scr_seq_0750_T03_0108:
	npc_msg 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0750_T03_0113:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0750_T03_0218
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0750_T03_022C
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0750_T03_0184
	apply_movement 255, scr_seq_0750_T03_0240
	goto scr_seq_0750_T03_01B7

scr_seq_0750_T03_0184:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0750_T03_01A7
	apply_movement 255, scr_seq_0750_T03_0260
	apply_movement 7, scr_seq_0750_T03_0274
	goto scr_seq_0750_T03_01B7

scr_seq_0750_T03_01A7:
	apply_movement 255, scr_seq_0750_T03_024C
	apply_movement 7, scr_seq_0750_T03_0274
scr_seq_0750_T03_01B7:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0750_T03_01DE
	apply_movement 253, scr_seq_0750_T03_0280
	wait_movement
scr_seq_0750_T03_01DE:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_615 66
	lockall
	fade_screen 6, 1, 1, 0
	wait_fade
	clearflag FLAG_UNK_189
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0750_T03_0218:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0750_T03_022C:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end


scr_seq_0750_T03_0240:
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0750_T03_024C:
	.short 12, 1
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0750_T03_0260:
	.short 12, 1
	.short 15, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0750_T03_0274:
	.short 63, 1
	.short 32, 1
	.short 254, 0

scr_seq_0750_T03_0280:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
scr_seq_0750_T03_0290:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0750_T03_02A3:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0750_T03_02B6:
	scrcmd_055 20, 0, 3, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0750_T03_02CD:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 21, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0750_T03_02E2:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 22, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0750_T03_02F7:
	scrcmd_055 23, 2, 0, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0750_T03_030E:
	comparevartovalue VAR_UNK_4083, 4
	gotoif eq, scr_seq_0750_T03_0341
	comparevartovalue VAR_UNK_4083, 2
	gotoif eq, scr_seq_0750_T03_033D
	comparevartovalue VAR_UNK_4083, 3
	gotoif eq, scr_seq_0750_T03_033D
	goto scr_seq_0750_T03_0051

scr_seq_0750_T03_033B:
	.byte 0x02, 0x00
scr_seq_0750_T03_033D:
	clearflag FLAG_UNK_30C
scr_seq_0750_T03_0341:
	scrcmd_495 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 7
	gotoif ne, scr_seq_0750_T03_035C
	clearflag FLAG_UNK_30D
	goto scr_seq_0750_T03_0360

scr_seq_0750_T03_035C:
	clearflag FLAG_UNK_312
scr_seq_0750_T03_0360:
	end

scr_seq_0750_T03_0362:
	comparevartovalue VAR_UNK_4083, 2
	gotoif eq, scr_seq_0750_T03_0371
	end

scr_seq_0750_T03_0371:
	move_person 8, 1047, 6, 81, 2
	end

scr_seq_0750_T03_037F:
	checkflag FLAG_UNK_0A4
	gotoif TRUE, scr_seq_0750_T03_038C
	end

scr_seq_0750_T03_038C:
	scrcmd_495 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 7
	gotoif ne, scr_seq_0750_T03_03AB
	setflag FLAG_UNK_30D
	hide_person 9
	goto scr_seq_0750_T03_03B3

scr_seq_0750_T03_03AB:
	setflag FLAG_UNK_312
	hide_person 10
scr_seq_0750_T03_03B3:
	end

scr_seq_0750_T03_03B5:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0750_T03_0440
	wait_movement
	apply_movement 8, scr_seq_0750_T03_045C
	wait_movement
	scrcmd_495 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 7
	gotoif ne, scr_seq_0750_T03_03F1
	npc_msg 6
	goto scr_seq_0750_T03_03F4

scr_seq_0750_T03_03F1:
	npc_msg 7
scr_seq_0750_T03_03F4:
	closemsg
	apply_movement 8, scr_seq_0750_T03_0464
	apply_movement 255, scr_seq_0750_T03_0464
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_495 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 7
	gotoif ne, scr_seq_0750_T03_042C
	npc_msg 8
	goto scr_seq_0750_T03_042F

scr_seq_0750_T03_042C:
	npc_msg 9
scr_seq_0750_T03_042F:
	waitbutton
	closemsg
	setvar VAR_UNK_4083, 3
	releaseall
	end

scr_seq_0750_T03_043D:
	.byte 0x00, 0x00, 0x00

scr_seq_0750_T03_0440:
	.short 13, 4
	.short 2, 1
	.short 254, 0

scr_seq_0750_T03_044C:
	.short 63, 1
	.short 15, 2
	.short 63, 1
	.short 254, 0

scr_seq_0750_T03_045C:
	.short 33, 1
	.short 254, 0

scr_seq_0750_T03_0464:
	.short 14, 3
	.short 254, 0

scr_seq_0750_T03_046C:
	.short 13, 2
	.short 14, 1
	.short 254, 0

scr_seq_0750_T03_0478:
	.short 34, 1
	.short 254, 0

scr_seq_0750_T03_0480:
	.short 15, 8
	.short 254, 0
scr_seq_0750_T03_0488:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_546 0, 16384
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, scr_seq_0750_T03_0649
	scrcmd_495 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif ne, scr_seq_0750_T03_04C8
	setvar VAR_TEMP_x400A, 381
	scrcmd_076 16394, 0
	npc_msg 10
	goto scr_seq_0750_T03_04D7

scr_seq_0750_T03_04C8:
	setvar VAR_TEMP_x400A, 380
	scrcmd_076 16394, 0
	npc_msg 11
scr_seq_0750_T03_04D7:
	scrcmd_077
	closemsg
	setflag FLAG_UNK_0A4
	scrcmd_589 16394, 40, 0
	clearflag FLAG_UNK_0A4
	scrcmd_683 16384
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif eq, scr_seq_0750_T03_057B
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif eq, scr_seq_0750_T03_057B
	scrcmd_588 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0750_T03_0526
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0750_T03_055A
scr_seq_0750_T03_0526:
	scrcmd_495 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif ne, scr_seq_0750_T03_0540
	npc_msg 12
	goto scr_seq_0750_T03_0543

scr_seq_0750_T03_0540:
	npc_msg 13
scr_seq_0750_T03_0543:
	closemsg
	comparevartovalue VAR_UNK_4083, 4
	gotoif eq, scr_seq_0750_T03_0649
	goto scr_seq_0750_T03_0585

scr_seq_0750_T03_0558:
	.byte 0x02, 0x00
scr_seq_0750_T03_055A:
	copyvar VAR_TEMP_x4009, VAR_UNK_4083
	setvar VAR_UNK_4083, 5
	comparevartovalue VAR_TEMP_x4009, 4
	gotoif eq, scr_seq_0750_T03_0649
	goto scr_seq_0750_T03_0585

scr_seq_0750_T03_0579:
	.byte 0x02, 0x00
scr_seq_0750_T03_057B:
	white_out
	goto scr_seq_0750_T03_0649

scr_seq_0750_T03_0583:
	.byte 0x02, 0x00
scr_seq_0750_T03_0585:
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 8, scr_seq_0750_T03_046C
	apply_movement 255, scr_seq_0750_T03_044C
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif eq, scr_seq_0750_T03_060C
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, scr_seq_0750_T03_05D2
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif eq, scr_seq_0750_T03_05FF
scr_seq_0750_T03_05D2:
	scrcmd_495 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif ne, scr_seq_0750_T03_05EC
	npc_msg 16
	goto scr_seq_0750_T03_05EF

scr_seq_0750_T03_05EC:
	npc_msg 17
scr_seq_0750_T03_05EF:
	closemsg
	setvar VAR_UNK_4083, 4
	goto scr_seq_0750_T03_061F

scr_seq_0750_T03_05FD:
	.byte 0x02, 0x00
scr_seq_0750_T03_05FF:
	npc_msg 14
	closemsg
	goto scr_seq_0750_T03_061F

scr_seq_0750_T03_060A:
	.byte 0x02, 0x00
scr_seq_0750_T03_060C:
	npc_msg 18
	closemsg
	setvar VAR_UNK_4083, 4
	goto scr_seq_0750_T03_061F

scr_seq_0750_T03_061D:
	.byte 0x02, 0x00
scr_seq_0750_T03_061F:
	apply_movement 8, scr_seq_0750_T03_0478
	wait_movement
	npc_msg 15
	closemsg
	apply_movement 8, scr_seq_0750_T03_0480
	wait_movement
	hide_person 8
	comparevartovalue VAR_UNK_4130, 4
	callif eq, scr_seq_0750_T03_064D
scr_seq_0750_T03_0649:
	releaseall
	end

scr_seq_0750_T03_064D:
	clearflag FLAG_UNK_317
	return

scr_seq_0750_T03_0653:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 19
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
