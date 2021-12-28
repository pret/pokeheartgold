#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0196_R10R0202_0208 ; 000
	scrdef scr_seq_0196_R10R0202_02F6 ; 001
	scrdef scr_seq_0196_R10R0202_0309 ; 002
	scrdef scr_seq_0196_R10R0202_02E3 ; 003
	scrdef scr_seq_0196_R10R0202_031C ; 004
	scrdef scr_seq_0196_R10R0202_0231 ; 005
	scrdef scr_seq_0196_R10R0202_002A ; 006
	scrdef scr_seq_0196_R10R0202_0128 ; 007
	scrdef scr_seq_0196_R10R0202_032F ; 008
	scrdef scr_seq_0196_R10R0202_0342 ; 009
	scrdef_end

scr_seq_0196_R10R0202_002A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	hasitem ITEM_MACHINE_PART, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, scr_seq_0196_R10R0202_0071
	checkflag FLAG_UNK_120
	gotoif TRUE, scr_seq_0196_R10R0202_005C
	setflag FLAG_UNK_120
	setvar VAR_UNK_411B, 1
scr_seq_0196_R10R0202_005C:
	npc_msg 13
	waitbutton
	closemsg
	apply_movement 0, scr_seq_0196_R10R0202_0100
	wait_movement
	releaseall
	end

scr_seq_0196_R10R0202_0071:
	npc_msg 14
	closemsg
	takeitem ITEM_MACHINE_PART, 1, VAR_SPECIAL_x800C
	apply_movement 6, scr_seq_0196_R10R0202_0108
	wait_movement
	wait_se SEQ_SE_GS_W012
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 467, 0, 13, 7, 1
	fade_screen 6, 1, 1, 0
	wait_fade
	npc_msg 15
	apply_movement 6, scr_seq_0196_R10R0202_0120
	wait_movement
	setflag FLAG_UNK_118
	npc_msg 16
	setvar VAR_SPECIAL_x8004, 384
	setvar VAR_SPECIAL_x8005, 1
	callstd std_give_item_verbose
	npc_msg 17
	waitbutton
	closemsg
	setflag FLAG_UNK_258
	clearflag FLAG_UNK_259
	setflag FLAG_UNK_2FB
	clearflag FLAG_UNK_2FC
	setvar VAR_UNK_40FF, 1
	releaseall
	end

scr_seq_0196_R10R0202_00F5:
	.byte 0x14, 0x00, 0xd9, 0x07, 0x35, 0x00, 0x61, 0x00, 0x02, 0x00, 0x00

scr_seq_0196_R10R0202_0100:
	.short 1, 1
	.short 254, 0

scr_seq_0196_R10R0202_0108:
	.short 34, 1
	.short 61, 1
	.short 34, 1
	.short 61, 1
	.short 34, 1
	.short 254, 0

scr_seq_0196_R10R0202_0120:
	.short 0, 1
	.short 254, 0
scr_seq_0196_R10R0202_0128:
	scrcmd_609
	lockall
	play_se SEQ_SE_GS_PHONE0
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 56
	apply_movement 0, scr_seq_0196_R10R0202_0198
	apply_movement 255, scr_seq_0196_R10R0202_01B4
	apply_movement 1, scr_seq_0196_R10R0202_01CC
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	npc_msg 1
	closemsg
	apply_movement 0, scr_seq_0196_R10R0202_01D8
	apply_movement 255, scr_seq_0196_R10R0202_01FC
	wait_movement
	npc_msg 2
	closemsg
	apply_movement 0, scr_seq_0196_R10R0202_01E8
	wait_movement
	clearflag FLAG_UNK_254
	setvar VAR_UNK_411B, 0
	setvar VAR_UNK_411C, 1
	releaseall
	end


scr_seq_0196_R10R0202_0198:
	.short 75, 1
	.short 13, 1
	.short 15, 2
	.short 12, 3
	.short 15, 5
	.short 12, 2
	.short 254, 0

scr_seq_0196_R10R0202_01B4:
	.short 66, 2
	.short 12, 1
	.short 1, 1
	.short 65, 1
	.short 3, 1
	.short 254, 0

scr_seq_0196_R10R0202_01CC:
	.short 66, 4
	.short 1, 1
	.short 254, 0

scr_seq_0196_R10R0202_01D8:
	.short 13, 2
	.short 14, 5
	.short 0, 1
	.short 254, 0

scr_seq_0196_R10R0202_01E8:
	.short 13, 3
	.short 14, 2
	.short 12, 1
	.short 33, 1
	.short 254, 0

scr_seq_0196_R10R0202_01FC:
	.short 63, 7
	.short 1, 1
	.short 254, 0
scr_seq_0196_R10R0202_0208:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_120
	gotoif TRUE, scr_seq_0196_R10R0202_0226
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0196_R10R0202_0226:
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0196_R10R0202_0231:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_121
	gotoif TRUE, scr_seq_0196_R10R0202_02D8
	npc_msg 8
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0196_R10R0202_02CD
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_566
	scrcmd_351 32780
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_0196_R10R0202_02CD
	scrcmd_470 8
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	get_partymon_species VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	scrcmd_472 32780
	comparevartovar VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	gotoif ne, scr_seq_0196_R10R0202_02C0
	scrcmd_473 32772
	scrcmd_474
	setflag FLAG_UNK_121
	npc_msg 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0196_R10R0202_02C0:
	scrcmd_474
	npc_msg 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0196_R10R0202_02CD:
	npc_msg 11
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0196_R10R0202_02D8:
	npc_msg 12
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0196_R10R0202_02E3:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0196_R10R0202_02F6:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0196_R10R0202_0309:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0196_R10R0202_031C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0196_R10R0202_032F:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 18
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0196_R10R0202_0342:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 19
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
