#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0857_T22_003E ; 000
	scrdef scr_seq_0857_T22_015B ; 001
	scrdef scr_seq_0857_T22_0BF4 ; 002
	scrdef scr_seq_0857_T22_068C ; 003
	scrdef scr_seq_0857_T22_0068 ; 004
	scrdef scr_seq_0857_T22_0148 ; 005
	scrdef scr_seq_0857_T22_0BF6 ; 006
	scrdef scr_seq_0857_T22_0C09 ; 007
	scrdef scr_seq_0857_T22_0C1E ; 008
	scrdef scr_seq_0857_T22_0C35 ; 009
	scrdef scr_seq_0857_T22_0C4A ; 010
	scrdef scr_seq_0857_T22_0C5F ; 011
	scrdef scr_seq_0857_T22_0C72 ; 012
	scrdef scr_seq_0857_T22_0C85 ; 013
	scrdef scr_seq_0857_T22_0C98 ; 014
	scrdef_end

scr_seq_0857_T22_003E:
	setflag FLAG_UNK_09F
	setvar VAR_SPECIAL_x8004, 1
	setvar VAR_SPECIAL_x8005, 2
	setvar VAR_SPECIAL_x8006, 1
	callstd std_phone_call
	setvar VAR_SCENE_VIOLET_CITY_OW, 2
	clearflag FLAG_HIDE_VIOLET_SHOP_KIMONO_GIRL
	setflag FLAG_HIDE_ELMS_LAB_OFFICER
	end

scr_seq_0857_T22_0068:
	scrcmd_609
	lockall
	callstd std_play_kimono_girl_music
	apply_movement 7, scr_seq_0857_T22_00CC
	wait_movement
	npc_msg 13
	closemsg
	apply_movement 7, scr_seq_0857_T22_00DC
	wait_movement
	npc_msg 14
	closemsg
	apply_movement 7, scr_seq_0857_T22_00E4
	wait_movement
	npc_msg 15
	closemsg
	apply_movement 7, scr_seq_0857_T22_0104
	wait_movement
	npc_msg 16
	closemsg
	apply_movement 7, scr_seq_0857_T22_00F4
	wait_movement
	callstd std_fade_end_kimono_girl_music
	hide_person 7
	setflag FLAG_HIDE_VIOLET_KIMONO_GIRL
	releaseall
	setvar VAR_SCENE_VIOLET_CITY_OW, 4
	end


scr_seq_0857_T22_00CC:
	.short 75, 1
	.short 14, 5
	.short 12, 1
	.short 254, 0

scr_seq_0857_T22_00DC:
	.short 12, 1
	.short 254, 0

scr_seq_0857_T22_00E4:
	.short 71, 1
	.short 9, 1
	.short 72, 1
	.short 254, 0

scr_seq_0857_T22_00F4:
	.short 13, 2
	.short 14, 1
	.short 13, 7
	.short 254, 0

scr_seq_0857_T22_0104:
	.short 3, 1
	.short 61, 1
	.short 1, 1
	.short 61, 1
	.short 2, 1
	.short 61, 1
	.short 0, 1
	.short 61, 1
	.short 3, 1
	.short 61, 1
	.short 1, 1
	.short 61, 1
	.short 2, 1
	.short 61, 1
	.short 0, 1
	.short 61, 1
	.short 254, 0
scr_seq_0857_T22_0148:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 26
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0857_T22_015B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_0857_T22_0182
	apply_movement 2, scr_seq_0857_T22_0388
	goto scr_seq_0857_T22_01C0

scr_seq_0857_T22_0182:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0857_T22_019D
	apply_movement 2, scr_seq_0857_T22_03AC
	goto scr_seq_0857_T22_01C0

scr_seq_0857_T22_019D:
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0857_T22_01B8
	apply_movement 2, scr_seq_0857_T22_03D0
	goto scr_seq_0857_T22_01C0

scr_seq_0857_T22_01B8:
	apply_movement 2, scr_seq_0857_T22_03F4
scr_seq_0857_T22_01C0:
	wait_movement
	npc_msg 1
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0857_T22_01E9
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0857_T22_01F4
	end

scr_seq_0857_T22_01E9:
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0857_T22_01F4:
	npc_msg 3
	closemsg
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_0857_T22_0218
	apply_movement 2, scr_seq_0857_T22_0418
	goto scr_seq_0857_T22_0256

scr_seq_0857_T22_0218:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0857_T22_0233
	apply_movement 2, scr_seq_0857_T22_0440
	goto scr_seq_0857_T22_0256

scr_seq_0857_T22_0233:
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0857_T22_024E
	apply_movement 2, scr_seq_0857_T22_0460
	goto scr_seq_0857_T22_0256

scr_seq_0857_T22_024E:
	apply_movement 2, scr_seq_0857_T22_0484
scr_seq_0857_T22_0256:
	wait_movement
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, scr_seq_0857_T22_028B
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, scr_seq_0857_T22_02B9
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0857_T22_02E7
	goto scr_seq_0857_T22_0315

scr_seq_0857_T22_0289:
	.byte 0x02, 0x00
scr_seq_0857_T22_028B:
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 2, scr_seq_0857_T22_04B0
	apply_movement 255, scr_seq_0857_T22_05FC
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	goto scr_seq_0857_T22_0343

scr_seq_0857_T22_02B7:
	.byte 0x02, 0x00
scr_seq_0857_T22_02B9:
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 2, scr_seq_0857_T22_04B0
	apply_movement 255, scr_seq_0857_T22_061C
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	goto scr_seq_0857_T22_0343

scr_seq_0857_T22_02E5:
	.byte 0x02, 0x00
scr_seq_0857_T22_02E7:
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 2, scr_seq_0857_T22_04FC
	apply_movement 255, scr_seq_0857_T22_063C
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	goto scr_seq_0857_T22_0343

scr_seq_0857_T22_0313:
	.byte 0x02, 0x00
scr_seq_0857_T22_0315:
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 2, scr_seq_0857_T22_04B0
	apply_movement 255, scr_seq_0857_T22_0670
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	goto scr_seq_0857_T22_0343

scr_seq_0857_T22_0341:
	.byte 0x02, 0x00
scr_seq_0857_T22_0343:
	npc_msg 4
	closemsg
	apply_movement 2, scr_seq_0857_T22_05EC
	wait_movement
	scrcmd_307 15, 8, 15, 1, 77
	scrcmd_310 77
	scrcmd_308 77
	apply_movement 2, scr_seq_0857_T22_05F4
	wait_movement
	scrcmd_311 77
	scrcmd_308 77
	scrcmd_309 77
	hide_person 2
	setflag FLAG_UNK_19A
	clearflag FLAG_UNK_19B
	releaseall
	end

scr_seq_0857_T22_0386:
	.byte 0x00, 0x00

scr_seq_0857_T22_0388:
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 254, 0

scr_seq_0857_T22_03AC:
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 254, 0

scr_seq_0857_T22_03D0:
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 254, 0

scr_seq_0857_T22_03F4:
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 254, 0

scr_seq_0857_T22_0418:
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 254, 0

scr_seq_0857_T22_0440:
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 254, 0

scr_seq_0857_T22_0460:
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 254, 0

scr_seq_0857_T22_0484:
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 254, 0

scr_seq_0857_T22_04B0:
	.short 17, 8
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 19, 21
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 16, 1
	.short 33, 1
	.short 254, 0

scr_seq_0857_T22_04FC:
	.short 18, 2
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 17, 3
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 19, 2
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 17, 5
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 19, 21
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 16, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 254, 0

scr_seq_0857_T22_05EC:
	.short 12, 2
	.short 254, 0

scr_seq_0857_T22_05F4:
	.short 12, 1
	.short 254, 0

scr_seq_0857_T22_05FC:
	.short 63, 1
	.short 90, 1
	.short 89, 8
	.short 35, 1
	.short 62, 1
	.short 91, 21
	.short 32, 1
	.short 254, 0

scr_seq_0857_T22_061C:
	.short 63, 1
	.short 91, 1
	.short 89, 8
	.short 35, 1
	.short 62, 1
	.short 91, 21
	.short 32, 1
	.short 254, 0

scr_seq_0857_T22_063C:
	.short 17, 1
	.short 19, 1
	.short 38, 1
	.short 63, 2
	.short 37, 1
	.short 63, 2
	.short 18, 1
	.short 89, 6
	.short 35, 1
	.short 62, 1
	.short 91, 21
	.short 32, 1
	.short 254, 0

scr_seq_0857_T22_0670:
	.short 63, 1
	.short 89, 9
	.short 35, 1
	.short 62, 1
	.short 91, 21
	.short 32, 1
	.short 254, 0
scr_seq_0857_T22_068C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	call scr_seq_0857_T22_0ADD
	call scr_seq_0857_T22_0A57
	comparevartovalue VAR_SPECIAL_x8006, 1
	gotoif eq, scr_seq_0857_T22_06BC
	npc_msg 17
	closemsg
	call scr_seq_0857_T22_0ADD
	releaseall
	end

scr_seq_0857_T22_06BC:
	npc_msg 18
scr_seq_0857_T22_06BF:
	touchscreen_menu_hide
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8000, 1
	gotoif ne, scr_seq_0857_T22_06DE
	scrcmd_751 205, 255, 0
scr_seq_0857_T22_06DE:
	comparevartovalue VAR_SPECIAL_x8001, 1
	gotoif ne, scr_seq_0857_T22_06F3
	scrcmd_751 206, 255, 1
scr_seq_0857_T22_06F3:
	comparevartovalue VAR_SPECIAL_x8002, 1
	gotoif ne, scr_seq_0857_T22_0708
	scrcmd_751 207, 255, 2
scr_seq_0857_T22_0708:
	comparevartovalue VAR_SPECIAL_x8003, 1
	gotoif ne, scr_seq_0857_T22_071D
	scrcmd_751 208, 255, 3
scr_seq_0857_T22_071D:
	scrcmd_751 126, 255, 4
	scrcmd_752
	touchscreen_menu_show
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0857_T22_0769
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0857_T22_080D
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0857_T22_08B1
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0857_T22_0955
	goto scr_seq_0857_T22_09F9

scr_seq_0857_T22_0769:
	npc_msg 21
	setvar VAR_SPECIAL_x8004, 149
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0857_T22_0A08
	setvar VAR_SPECIAL_x8004, 151
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0857_T22_0A08
	setvar VAR_SPECIAL_x8004, 154
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0857_T22_0A08
	setvar VAR_SPECIAL_x8004, 149
	setvar VAR_SPECIAL_x8005, 1
	callstd std_give_item_verbose
	setvar VAR_SPECIAL_x8004, 151
	setvar VAR_SPECIAL_x8005, 1
	callstd std_give_item_verbose
	setvar VAR_SPECIAL_x8004, 154
	setvar VAR_SPECIAL_x8005, 1
	callstd std_give_item_verbose
	takeitem ITEM_RED_SHARD, 1, VAR_SPECIAL_x800C
	goto scr_seq_0857_T22_0A17

scr_seq_0857_T22_080D:
	npc_msg 22
	setvar VAR_SPECIAL_x8004, 155
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0857_T22_0A08
	setvar VAR_SPECIAL_x8004, 150
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0857_T22_0A08
	setvar VAR_SPECIAL_x8004, 160
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0857_T22_0A08
	setvar VAR_SPECIAL_x8004, 155
	setvar VAR_SPECIAL_x8005, 1
	callstd std_give_item_verbose
	setvar VAR_SPECIAL_x8004, 150
	setvar VAR_SPECIAL_x8005, 1
	callstd std_give_item_verbose
	setvar VAR_SPECIAL_x8004, 160
	setvar VAR_SPECIAL_x8005, 1
	callstd std_give_item_verbose
	takeitem ITEM_BLUE_SHARD, 1, VAR_SPECIAL_x800C
	goto scr_seq_0857_T22_0A17

scr_seq_0857_T22_08B1:
	npc_msg 23
	setvar VAR_SPECIAL_x8004, 153
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0857_T22_0A08
	setvar VAR_SPECIAL_x8004, 158
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0857_T22_0A08
	setvar VAR_SPECIAL_x8004, 163
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0857_T22_0A08
	setvar VAR_SPECIAL_x8004, 153
	setvar VAR_SPECIAL_x8005, 1
	callstd std_give_item_verbose
	setvar VAR_SPECIAL_x8004, 158
	setvar VAR_SPECIAL_x8005, 1
	callstd std_give_item_verbose
	setvar VAR_SPECIAL_x8004, 163
	setvar VAR_SPECIAL_x8005, 1
	callstd std_give_item_verbose
	takeitem ITEM_YELLOW_SHARD, 1, VAR_SPECIAL_x800C
	goto scr_seq_0857_T22_0A17

scr_seq_0857_T22_0955:
	npc_msg 24
	setvar VAR_SPECIAL_x8004, 152
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0857_T22_0A08
	setvar VAR_SPECIAL_x8004, 157
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0857_T22_0A08
	setvar VAR_SPECIAL_x8004, 162
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0857_T22_0A08
	setvar VAR_SPECIAL_x8004, 152
	setvar VAR_SPECIAL_x8005, 1
	callstd std_give_item_verbose
	setvar VAR_SPECIAL_x8004, 157
	setvar VAR_SPECIAL_x8005, 1
	callstd std_give_item_verbose
	setvar VAR_SPECIAL_x8004, 162
	setvar VAR_SPECIAL_x8005, 1
	callstd std_give_item_verbose
	takeitem ITEM_GREEN_SHARD, 1, VAR_SPECIAL_x800C
	goto scr_seq_0857_T22_0A17

scr_seq_0857_T22_09F9:
	npc_msg 20
	closemsg
	call scr_seq_0857_T22_0ADD
	releaseall
	end

scr_seq_0857_T22_0A08:
	npc_msg 25
	closemsg
	call scr_seq_0857_T22_0ADD
	releaseall
	end

scr_seq_0857_T22_0A17:
	setvar VAR_SPECIAL_x8000, 0
	setvar VAR_SPECIAL_x8001, 0
	setvar VAR_SPECIAL_x8002, 0
	setvar VAR_SPECIAL_x8003, 0
	setvar VAR_SPECIAL_x8006, 0
	call scr_seq_0857_T22_0A57
	comparevartovalue VAR_SPECIAL_x8006, 1
	gotoif ne, scr_seq_0857_T22_0A51
	npc_msg 19
	goto scr_seq_0857_T22_06BF

scr_seq_0857_T22_0A51:
	goto scr_seq_0857_T22_09F9

scr_seq_0857_T22_0A57:
	hasitem ITEM_RED_SHARD, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0857_T22_0A78
	setvar VAR_SPECIAL_x8000, 1
	setvar VAR_SPECIAL_x8006, 1
scr_seq_0857_T22_0A78:
	hasitem ITEM_BLUE_SHARD, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0857_T22_0A99
	setvar VAR_SPECIAL_x8001, 1
	setvar VAR_SPECIAL_x8006, 1
scr_seq_0857_T22_0A99:
	hasitem ITEM_YELLOW_SHARD, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0857_T22_0ABA
	setvar VAR_SPECIAL_x8002, 1
	setvar VAR_SPECIAL_x8006, 1
scr_seq_0857_T22_0ABA:
	hasitem ITEM_GREEN_SHARD, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0857_T22_0ADB
	setvar VAR_SPECIAL_x8003, 1
	setvar VAR_SPECIAL_x8006, 1
scr_seq_0857_T22_0ADB:
	return

scr_seq_0857_T22_0ADD:
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0857_T22_0AFE
	apply_movement 10, scr_seq_0857_T22_0B28
	wait_movement
	goto scr_seq_0857_T22_0B25

scr_seq_0857_T22_0AFE:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_0857_T22_0B1B
	apply_movement 10, scr_seq_0857_T22_0B6C
	wait_movement
	goto scr_seq_0857_T22_0B25

scr_seq_0857_T22_0B1B:
	apply_movement 10, scr_seq_0857_T22_0BB0
	wait_movement
scr_seq_0857_T22_0B25:
	return

scr_seq_0857_T22_0B27:
	.byte 0x00

scr_seq_0857_T22_0B28:
	.short 3, 1
	.short 0, 1
	.short 2, 1
	.short 1, 1
	.short 3, 1
	.short 0, 1
	.short 2, 1
	.short 1, 1
	.short 3, 1
	.short 0, 1
	.short 2, 1
	.short 1, 1
	.short 3, 1
	.short 0, 1
	.short 2, 1
	.short 1, 1
	.short 254, 0

scr_seq_0857_T22_0B6C:
	.short 0, 1
	.short 2, 1
	.short 1, 1
	.short 3, 1
	.short 0, 1
	.short 2, 1
	.short 1, 1
	.short 3, 1
	.short 0, 1
	.short 2, 1
	.short 1, 1
	.short 3, 1
	.short 0, 1
	.short 2, 1
	.short 1, 1
	.short 3, 1
	.short 254, 0

scr_seq_0857_T22_0BB0:
	.short 1, 1
	.short 3, 1
	.short 0, 1
	.short 2, 1
	.short 1, 1
	.short 3, 1
	.short 0, 1
	.short 2, 1
	.short 1, 1
	.short 3, 1
	.short 0, 1
	.short 2, 1
	.short 1, 1
	.short 3, 1
	.short 0, 1
	.short 2, 1
	.short 254, 0
scr_seq_0857_T22_0BF4:
	end

scr_seq_0857_T22_0BF6:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 27
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0857_T22_0C09:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 12, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0857_T22_0C1E:
	scrcmd_055 9, 0, 13, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0857_T22_0C35:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 10, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0857_T22_0C4A:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 11, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0857_T22_0C5F:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0857_T22_0C72:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0857_T22_0C85:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0857_T22_0C98:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 8
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
