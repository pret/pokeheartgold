#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0834_T11R0601_009B ; 000
	scrdef scr_seq_0834_T11R0601_0270 ; 001
	scrdef scr_seq_0834_T11R0601_0299 ; 002
	scrdef scr_seq_0834_T11R0601_02AC ; 003
	scrdef scr_seq_0834_T11R0601_00F4 ; 004
	scrdef scr_seq_0834_T11R0601_0080 ; 005
	scrdef scr_seq_0834_T11R0601_0026 ; 006
	scrdef scr_seq_0834_T11R0601_018C ; 007
	scrdef scr_seq_0834_T11R0601_02BF ; 008
	scrdef_end

scr_seq_0834_T11R0601_0026:
	scrcmd_582 76, 1290, 209
	checkflag FLAG_UNK_118
	gotoif TRUE, scr_seq_0834_T11R0601_003F
	goto scr_seq_0834_T11R0601_0045

scr_seq_0834_T11R0601_003F:
	setvar VAR_UNK_411D, 0
scr_seq_0834_T11R0601_0045:
	setflag FLAG_UNK_2F7
	scrcmd_147 36, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif eq, scr_seq_0834_T11R0601_007E
	get_phone_book_rematch 36, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_0834_T11R0601_007E
	checkflag FLAG_UNK_162
	gotoif TRUE, scr_seq_0834_T11R0601_007E
	clearflag FLAG_UNK_2F7
scr_seq_0834_T11R0601_007E:
	end

scr_seq_0834_T11R0601_0080:
	checkflag FLAG_UNK_118
	gotoif TRUE, scr_seq_0834_T11R0601_008D
	end

scr_seq_0834_T11R0601_008D:
	move_person 0, 12, 0, 7, 3
	end

scr_seq_0834_T11R0601_009B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_118
	gotoif TRUE, scr_seq_0834_T11R0601_00B9
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0834_T11R0601_00B9:
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_0834_T11R0601_00D7
	npc_msg 5
	waitbutton
	closemsg
	goto scr_seq_0834_T11R0601_00E6

scr_seq_0834_T11R0601_00D7:
	npc_msg 7
	closemsg
	apply_movement 0, scr_seq_0834_T11R0601_00EC
	wait_movement
scr_seq_0834_T11R0601_00E6:
	releaseall
	end

scr_seq_0834_T11R0601_00EA:
	.byte 0x00, 0x00

scr_seq_0834_T11R0601_00EC:
	step 3, 1
	step_end
scr_seq_0834_T11R0601_00F4:
	scrcmd_609
	lockall
	apply_movement 255, scr_seq_0834_T11R0601_017C
	wait_movement
	checkflag FLAG_UNK_123
	gotoif TRUE, scr_seq_0834_T11R0601_0158
	npc_msg 1
	closemsg
	setflag FLAG_UNK_123
scr_seq_0834_T11R0601_0116:
	wait 50, VAR_SPECIAL_x8004
	hasitem ITEM_PASS, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, scr_seq_0834_T11R0601_0163
	npc_msg 2
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0834_T11R0601_0184
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	releaseall
	end

scr_seq_0834_T11R0601_0158:
	npc_msg 3
	closemsg
	goto scr_seq_0834_T11R0601_0116

scr_seq_0834_T11R0601_0163:
	npc_msg 4
	waitbutton
	closemsg
	setvar VAR_UNK_411D, 1
	setvar VAR_UNK_411F, 1
	releaseall
	end

scr_seq_0834_T11R0601_017A:
	.byte 0x00, 0x00

scr_seq_0834_T11R0601_017C:
	step 34, 1
	step_end

scr_seq_0834_T11R0601_0184:
	step 13, 2
	step_end
scr_seq_0834_T11R0601_018C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 12
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0834_T11R0601_024F
	npc_msg 14
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_566
	scrcmd_351 32780
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_0834_T11R0601_024F
	scrcmd_470 10
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	get_partymon_species VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	scrcmd_472 32780
	comparevartovar VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	gotoif ne, scr_seq_0834_T11R0601_0242
	scrcmd_473 32772
	scrcmd_474
	setflag FLAG_UNK_162
	npc_msg 16
	closemsg
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0834_T11R0601_022C
	apply_movement 4, scr_seq_0834_T11R0601_025C
	goto scr_seq_0834_T11R0601_0234

scr_seq_0834_T11R0601_022C:
	apply_movement 4, scr_seq_0834_T11R0601_0268
scr_seq_0834_T11R0601_0234:
	wait_movement
	hide_person 4
	setflag FLAG_UNK_2F7
	releaseall
	end

scr_seq_0834_T11R0601_0242:
	scrcmd_474
	npc_msg 17
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0834_T11R0601_024F:
	npc_msg 15
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0834_T11R0601_025A:
	.byte 0x00, 0x00

scr_seq_0834_T11R0601_025C:
	step 78, 5
	step 77, 10
	step_end

scr_seq_0834_T11R0601_0268:
	step 77, 10
	step_end
scr_seq_0834_T11R0601_0270:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_118
	gotoif TRUE, scr_seq_0834_T11R0601_028E
	npc_msg 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0834_T11R0601_028E:
	npc_msg 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0834_T11R0601_0299:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0834_T11R0601_02AC:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 11
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0834_T11R0601_02BF:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 18
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
