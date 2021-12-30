#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0084_D32R0301_003C ; 000
	scrdef scr_seq_0084_D32R0301_05C6 ; 001
	scrdef scr_seq_0084_D32R0301_05FF ; 002
	scrdef scr_seq_0084_D32R0301_063E ; 003
	scrdef scr_seq_0084_D32R0301_06B2 ; 004
	scrdef scr_seq_0084_D32R0301_0058 ; 005
	scrdef scr_seq_0084_D32R0301_06DC ; 006
	scrdef scr_seq_0084_D32R0301_06EF ; 007
	scrdef scr_seq_0084_D32R0301_0702 ; 008
	scrdef scr_seq_0084_D32R0301_0715 ; 009
	scrdef scr_seq_0084_D32R0301_0728 ; 010
	scrdef scr_seq_0084_D32R0301_073B ; 011
	scrdef scr_seq_0084_D32R0301_074E ; 012
	scrdef scr_seq_0084_D32R0301_003A ; 013
	scrdef_end

scr_seq_0084_D32R0301_003A:
	end

scr_seq_0084_D32R0301_003C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x4003, 0
	setvar VAR_TEMP_x4004, 0
	goto scr_seq_0084_D32R0301_0074

scr_seq_0084_D32R0301_0056:
	.byte 0x02, 0x00
scr_seq_0084_D32R0301_0058:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x4003, 0
	setvar VAR_TEMP_x4004, 1
	goto scr_seq_0084_D32R0301_0074

scr_seq_0084_D32R0301_0072:
	.byte 0x02, 0x00
scr_seq_0084_D32R0301_0074:
	scrcmd_682 0
	comparevartovalue VAR_TEMP_x4004, 0
	callif eq, scr_seq_0084_D32R0301_057C
	comparevartovalue VAR_TEMP_x4004, 1
	callif eq, scr_seq_0084_D32R0301_0581
	goto scr_seq_0084_D32R0301_009A

scr_seq_0084_D32R0301_0098:
	.byte 0x02, 0x00
scr_seq_0084_D32R0301_009A:
	comparevartovalue VAR_TEMP_x4004, 0
	callif eq, scr_seq_0084_D32R0301_0586
	comparevartovalue VAR_TEMP_x4004, 1
	callif eq, scr_seq_0084_D32R0301_05A5
	menu_item_add 19, 255, 2
	menu_item_add 20, 255, 3
	menu_exec
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0084_D32R0301_013F
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0084_D32R0301_014D
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, scr_seq_0084_D32R0301_0104
	comparevartovalue VAR_SPECIAL_x800C, 4
	gotoif eq, scr_seq_0084_D32R0301_015B
	touchscreen_menu_show
	goto scr_seq_0084_D32R0301_0126

scr_seq_0084_D32R0301_0102:
	.byte 0x02, 0x00
scr_seq_0084_D32R0301_0104:
	comparevartovalue VAR_TEMP_x4004, 0
	callif eq, scr_seq_0084_D32R0301_05BC
	comparevartovalue VAR_TEMP_x4004, 1
	callif eq, scr_seq_0084_D32R0301_05C1
	goto scr_seq_0084_D32R0301_009A

scr_seq_0084_D32R0301_0124:
	.byte 0x02, 0x00
scr_seq_0084_D32R0301_0126:
	goto scr_seq_0084_D32R0301_012E

scr_seq_0084_D32R0301_012C:
	.byte 0x02, 0x00
scr_seq_0084_D32R0301_012E:
	setvar VAR_UNK_4142, 0
	npc_msg 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0084_D32R0301_013F:
	setvar VAR_UNK_4143, 0
	goto scr_seq_0084_D32R0301_0169

scr_seq_0084_D32R0301_014B:
	.byte 0x02, 0x00
scr_seq_0084_D32R0301_014D:
	setvar VAR_UNK_4143, 1
	goto scr_seq_0084_D32R0301_0169

scr_seq_0084_D32R0301_0159:
	.byte 0x02, 0x00
scr_seq_0084_D32R0301_015B:
	setvar VAR_UNK_4143, 2
	goto scr_seq_0084_D32R0301_0169

scr_seq_0084_D32R0301_0167:
	.byte 0x02, 0x00
scr_seq_0084_D32R0301_0169:
	npc_msg 7
	menu_init 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 21, 255, 0
	menu_item_add 22, 255, 1
	menu_item_add 23, 255, 2
	menu_exec
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0084_D32R0301_01B2
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0084_D32R0301_01C0
	touchscreen_menu_show
	goto scr_seq_0084_D32R0301_0126

scr_seq_0084_D32R0301_01B0:
	.byte 0x02, 0x00
scr_seq_0084_D32R0301_01B2:
	setvar VAR_UNK_4144, 0
	goto scr_seq_0084_D32R0301_01CE

scr_seq_0084_D32R0301_01BE:
	.byte 0x02, 0x00
scr_seq_0084_D32R0301_01C0:
	setvar VAR_UNK_4144, 1
	goto scr_seq_0084_D32R0301_01CE

scr_seq_0084_D32R0301_01CC:
	.byte 0x02, 0x00
scr_seq_0084_D32R0301_01CE:
	goto scr_seq_0084_D32R0301_01D6

scr_seq_0084_D32R0301_01D4:
	.byte 0x02, 0x00
scr_seq_0084_D32R0301_01D6:
	comparevartovalue VAR_UNK_4143, 0
	callif eq, scr_seq_0084_D32R0301_0399
	comparevartovalue VAR_UNK_4143, 1
	callif eq, scr_seq_0084_D32R0301_0399
	setvar VAR_TEMP_x4000, 0
	heal_party
	callstd 2006
	copyvar VAR_SPECIAL_x800C, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0084_D32R0301_0126
	touchscreen_menu_show
	comparevartovalue VAR_UNK_4143, 2
	gotoif eq, scr_seq_0084_D32R0301_0226
	goto scr_seq_0084_D32R0301_03A1

scr_seq_0084_D32R0301_0224:
	.byte 0x02, 0x00
scr_seq_0084_D32R0301_0226:
	npc_msg 24
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 14, 255, 0
	menu_item_add 15, 255, 1
	menu_item_add 5, 255, 2
	menu_exec
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0084_D32R0301_0277
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0084_D32R0301_02F9
	touchscreen_menu_show
	goto scr_seq_0084_D32R0301_0126

scr_seq_0084_D32R0301_0275:
	.byte 0x02, 0x00
scr_seq_0084_D32R0301_0277:
	npc_msg 25
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0084_D32R0301_0226
	touchscreen_menu_show
	closemsg
	comparevartovalue VAR_UNK_4144, 0
	callif eq, scr_seq_0084_D32R0301_02CF
	comparevartovalue VAR_UNK_4144, 1
	callif eq, scr_seq_0084_D32R0301_02DB
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0084_D32R0301_02E7
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, scr_seq_0084_D32R0301_02EF
	goto scr_seq_0084_D32R0301_037B

scr_seq_0084_D32R0301_02CD:
	.byte 0x02, 0x00
scr_seq_0084_D32R0301_02CF:
	scrcmd_226 27, 0, 0, 32780
	return

scr_seq_0084_D32R0301_02DB:
	scrcmd_226 28, 0, 0, 32780
	return

scr_seq_0084_D32R0301_02E7:
	goto scr_seq_0084_D32R0301_0226

scr_seq_0084_D32R0301_02ED:
	.byte 0x02, 0x00
scr_seq_0084_D32R0301_02EF:
	scrcmd_283
	goto scr_seq_0084_D32R0301_0226

scr_seq_0084_D32R0301_02F7:
	.byte 0x02, 0x00
scr_seq_0084_D32R0301_02F9:
	npc_msg 25
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0084_D32R0301_0226
	touchscreen_menu_show
	closemsg
	comparevartovalue VAR_UNK_4144, 0
	callif eq, scr_seq_0084_D32R0301_0351
	comparevartovalue VAR_UNK_4144, 1
	callif eq, scr_seq_0084_D32R0301_035D
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0084_D32R0301_0369
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, scr_seq_0084_D32R0301_0371
	goto scr_seq_0084_D32R0301_037B

scr_seq_0084_D32R0301_034F:
	.byte 0x02
	.byte 0x00
scr_seq_0084_D32R0301_0351:
	scrcmd_227 27, 0, 0, 32780
	return

scr_seq_0084_D32R0301_035D:
	scrcmd_227 28, 0, 0, 32780
	return

scr_seq_0084_D32R0301_0369:
	goto scr_seq_0084_D32R0301_0226

scr_seq_0084_D32R0301_036F:
	.byte 0x02
	.byte 0x00
scr_seq_0084_D32R0301_0371:
	scrcmd_283
	goto scr_seq_0084_D32R0301_0226

scr_seq_0084_D32R0301_0379:
	.byte 0x02, 0x00
scr_seq_0084_D32R0301_037B:
	npc_msg 26
	comparevartovalue VAR_UNK_4143, 2
	callif eq, scr_seq_0084_D32R0301_0399
	call scr_seq_0084_D32R0301_05ED
	goto scr_seq_0084_D32R0301_03A1

scr_seq_0084_D32R0301_0397:
	.byte 0x02, 0x00
scr_seq_0084_D32R0301_0399:
	setvar VAR_UNK_4142, 255
	return

scr_seq_0084_D32R0301_03A1:
	comparevartovalue VAR_UNK_4143, 0
	callif eq, scr_seq_0084_D32R0301_0439
	comparevartovalue VAR_UNK_4143, 1
	callif eq, scr_seq_0084_D32R0301_0454
	comparevartovalue VAR_UNK_4143, 2
	callif eq, scr_seq_0084_D32R0301_046F
	play_se SEQ_SE_DP_KAIDAN2
	goto scr_seq_0084_D32R0301_03D4

scr_seq_0084_D32R0301_03D2:
	.byte 0x02, 0x00
scr_seq_0084_D32R0301_03D4:
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_815 0
	comparevartovalue VAR_UNK_4143, 0
	callif eq, scr_seq_0084_D32R0301_0495
	comparevartovalue VAR_UNK_4143, 1
	callif eq, scr_seq_0084_D32R0301_04A9
	comparevartovalue VAR_UNK_4143, 2
	callif eq, scr_seq_0084_D32R0301_04BD
	scrcmd_420 59
	scrcmd_436
	scrcmd_627 3
	comparevartovalue VAR_UNK_4143, 2
	callif eq, scr_seq_0084_D32R0301_0435
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	scrcmd_682 1
	end

scr_seq_0084_D32R0301_0435:
	scrcmd_283
	return

scr_seq_0084_D32R0301_0439:
	npc_msg 9
	scrcmd_049
	closemsg
	apply_movement 255, scr_seq_0084_D32R0301_04D4
	apply_movement VAR_SPECIAL_x800D, scr_seq_0084_D32R0301_04FC
	wait_movement
	return

scr_seq_0084_D32R0301_0454:
	npc_msg 9
	scrcmd_049
	closemsg
	apply_movement 255, scr_seq_0084_D32R0301_04D4
	apply_movement VAR_SPECIAL_x800D, scr_seq_0084_D32R0301_04FC
	wait_movement
	return

scr_seq_0084_D32R0301_046F:
	scrcmd_047 9
	wait 15, VAR_SPECIAL_x800C
	scrcmd_258
	scrcmd_257 169
	closemsg
	apply_movement 255, scr_seq_0084_D32R0301_04E8
	apply_movement VAR_SPECIAL_x800D, scr_seq_0084_D32R0301_0510
	wait_movement
	return

scr_seq_0084_D32R0301_0495:
	apply_movement 255, scr_seq_0084_D32R0301_0524
	apply_movement VAR_SPECIAL_x800D, scr_seq_0084_D32R0301_0554
	wait_movement
	return

scr_seq_0084_D32R0301_04A9:
	apply_movement 255, scr_seq_0084_D32R0301_0524
	apply_movement VAR_SPECIAL_x800D, scr_seq_0084_D32R0301_0554
	wait_movement
	return

scr_seq_0084_D32R0301_04BD:
	apply_movement 255, scr_seq_0084_D32R0301_053C
	apply_movement VAR_SPECIAL_x800D, scr_seq_0084_D32R0301_0568
	wait_movement
	return

scr_seq_0084_D32R0301_04D1:
	.byte 0x00, 0x00, 0x00

scr_seq_0084_D32R0301_04D4:
	step 12, 3
	step 15, 1
	step 12, 4
	step 69, 1
	step_end

scr_seq_0084_D32R0301_04E8:
	step 12, 3
	step 14, 1
	step 12, 4
	step 69, 1
	step_end

scr_seq_0084_D32R0301_04FC:
	step 12, 2
	step 15, 1
	step 12, 4
	step 69, 1
	step_end

scr_seq_0084_D32R0301_0510:
	step 12, 2
	step 14, 1
	step 12, 4
	step 69, 1
	step_end

scr_seq_0084_D32R0301_0524:
	step 21, 3
	step 22, 1
	step 21, 4
	step 0, 1
	step 70, 1
	step_end

scr_seq_0084_D32R0301_053C:
	step 21, 3
	step 23, 1
	step 21, 4
	step 0, 1
	step 70, 1
	step_end

scr_seq_0084_D32R0301_0554:
	step 21, 2
	step 22, 1
	step 21, 4
	step 70, 1
	step_end

scr_seq_0084_D32R0301_0568:
	step 21, 2
	step 23, 1
	step 21, 4
	step 70, 1
	step_end
scr_seq_0084_D32R0301_057C:
	npc_msg 0
	return

scr_seq_0084_D32R0301_0581:
	npc_msg 3
	return

scr_seq_0084_D32R0301_0586:
	npc_msg 1
	touchscreen_menu_hide
	menu_init 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 16, 255, 0
	menu_item_add 17, 255, 1
	return

scr_seq_0084_D32R0301_05A5:
	npc_msg 4
	touchscreen_menu_hide
	menu_init 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 18, 255, 4
	return

scr_seq_0084_D32R0301_05BC:
	npc_msg 2
	return

scr_seq_0084_D32R0301_05C1:
	npc_msg 5
	return

scr_seq_0084_D32R0301_05C6:
	scrcmd_682 0
	setvar VAR_TEMP_x4003, 1
	setvar VAR_UNK_4142, 0
	npc_msg 11
	call scr_seq_0084_D32R0301_0399
	call scr_seq_0084_D32R0301_05ED
	goto scr_seq_0084_D32R0301_03A1

scr_seq_0084_D32R0301_05EB:
	.byte 0x02, 0x00
scr_seq_0084_D32R0301_05ED:
	scrcmd_345
	scrcmd_254 32780
	scrcmd_346
	play_se SEQ_SE_DP_SAVE
	wait_se SEQ_SE_DP_SAVE
	return

scr_seq_0084_D32R0301_05FF:
	lockall
	faceplayer
	npc_msg 12
	scrcmd_628 16707, 16708
	comparevartovalue VAR_UNK_404E, 1
	callif eq, scr_seq_0084_D32R0301_062E
	comparevartovalue VAR_UNK_404E, 3
	callif eq, scr_seq_0084_D32R0301_0636
	goto scr_seq_0084_D32R0301_0126

scr_seq_0084_D32R0301_062C:
	.byte 0x02, 0x00
scr_seq_0084_D32R0301_062E:
	setvar VAR_UNK_404E, 0
	return

scr_seq_0084_D32R0301_0636:
	setvar VAR_UNK_404E, 2
	return

scr_seq_0084_D32R0301_063E:
	comparevartovalue VAR_UNK_4143, 0
	callif eq, scr_seq_0084_D32R0301_067A
	comparevartovalue VAR_UNK_4143, 1
	callif eq, scr_seq_0084_D32R0301_067A
	comparevartovalue VAR_UNK_404E, 1
	callif eq, scr_seq_0084_D32R0301_0680
	comparevartovalue VAR_UNK_404E, 3
	callif eq, scr_seq_0084_D32R0301_0697
	goto scr_seq_0084_D32R0301_0126

scr_seq_0084_D32R0301_0678:
	.byte 0x02, 0x00
scr_seq_0084_D32R0301_067A:
	scrcmd_680 27
	return

scr_seq_0084_D32R0301_0680:
	npc_msg 13
	buffer_players_name 0
	npc_msg 15
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	setvar VAR_UNK_404E, 2
	return

scr_seq_0084_D32R0301_0697:
	npc_msg 13
	buffer_players_name 0
	npc_msg 14
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	setvar VAR_UNK_404E, 4
	callstd 2040
	return

scr_seq_0084_D32R0301_06B2:
	goto scr_seq_0084_D32R0301_0126

scr_seq_0084_D32R0301_06B8:
	.byte 0x02, 0x00, 0x00, 0x00, 0x0c, 0x00, 0x02, 0x00
	.byte 0x3f, 0x00, 0x01, 0x00, 0x0c, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00, 0x0c, 0x00, 0x02, 0x00
	.byte 0x3f, 0x00, 0x01, 0x00, 0x0c, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00
scr_seq_0084_D32R0301_06DC:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 27
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0084_D32R0301_06EF:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 28
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0084_D32R0301_0702:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 29
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0084_D32R0301_0715:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 30
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0084_D32R0301_0728:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 31
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0084_D32R0301_073B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 32
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0084_D32R0301_074E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 33
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
