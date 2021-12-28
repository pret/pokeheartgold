#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0037_D24R0101_0644 ; 000
	scrdef scr_seq_0037_D24R0101_0659 ; 001
	scrdef scr_seq_0037_D24R0101_066E ; 002
	scrdef scr_seq_0037_D24R0101_0683 ; 003
	scrdef scr_seq_0037_D24R0101_0134 ; 004
	scrdef scr_seq_0037_D24R0101_00A2 ; 005
	scrdef scr_seq_0037_D24R0101_0022 ; 006
	scrdef scr_seq_0037_D24R0101_02B8 ; 007
	scrdef_end

scr_seq_0037_D24R0101_0022:
	comparevartovalue VAR_UNK_403E, 7
	gotoif ge, scr_seq_0037_D24R0101_005E
	comparevartovalue VAR_UNK_403E, 6
	gotoif eq, scr_seq_0037_D24R0101_0080
scr_seq_0037_D24R0101_003C:
	scrcmd_342 11, 418, 284
	scrcmd_342 12, 419, 284
	scrcmd_342 13, 418, 284
	scrcmd_342 14, 419, 284
	end

scr_seq_0037_D24R0101_005E:
	scrcmd_342 8, 418, 284
	scrcmd_342 9, 419, 284
	scrcmd_342 11, 418, 284
	scrcmd_342 12, 419, 284
	end

scr_seq_0037_D24R0101_0080:
	scrcmd_342 8, 418, 284
	scrcmd_342 9, 419, 284
	scrcmd_342 13, 418, 284
	scrcmd_342 14, 419, 284
	end

scr_seq_0037_D24R0101_00A2:
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_0037_D24R0101_00B3
	clearflag FLAG_UNK_189
	end

scr_seq_0037_D24R0101_00B3:
	comparevartovalue VAR_UNK_40FB, 9
	gotoif ge, scr_seq_0037_D24R0101_00C6
	setvar VAR_UNK_40FB, 1
scr_seq_0037_D24R0101_00C6:
	check_badge 2, VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, scr_seq_0037_D24R0101_0104
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif eq, scr_seq_0037_D24R0101_010E
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif eq, scr_seq_0037_D24R0101_010E
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, scr_seq_0037_D24R0101_010E
scr_seq_0037_D24R0101_0104:
	setflag FLAG_UNK_27E
	goto scr_seq_0037_D24R0101_0112

scr_seq_0037_D24R0101_010E:
	clearflag FLAG_UNK_27E
scr_seq_0037_D24R0101_0112:
	comparevartovalue VAR_UNK_403E, 7
	gotoif ge, scr_seq_0037_D24R0101_005E
	comparevartovalue VAR_UNK_403E, 6
	gotoif eq, scr_seq_0037_D24R0101_0080
	goto scr_seq_0037_D24R0101_003C

scr_seq_0037_D24R0101_0132:
	.byte 0x02, 0x00
scr_seq_0037_D24R0101_0134:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0037_D24R0101_0239
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0037_D24R0101_024D
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0037_D24R0101_01AD
	apply_movement 255, scr_seq_0037_D24R0101_0264
	apply_movement 8, scr_seq_0037_D24R0101_029C
	goto scr_seq_0037_D24R0101_01D8

scr_seq_0037_D24R0101_01AD:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0037_D24R0101_01C8
	apply_movement 255, scr_seq_0037_D24R0101_027C
	goto scr_seq_0037_D24R0101_01D8

scr_seq_0037_D24R0101_01C8:
	apply_movement 255, scr_seq_0037_D24R0101_0288
	apply_movement 8, scr_seq_0037_D24R0101_029C
scr_seq_0037_D24R0101_01D8:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0037_D24R0101_01FF
	apply_movement 253, scr_seq_0037_D24R0101_02A8
	wait_movement
scr_seq_0037_D24R0101_01FF:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_615 3
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

scr_seq_0037_D24R0101_0239:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0037_D24R0101_024D:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0037_D24R0101_0261:
	.byte 0x00, 0x00, 0x00

scr_seq_0037_D24R0101_0264:
	.short 15, 1
	.short 12, 2
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0037_D24R0101_027C:
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0037_D24R0101_0288:
	.short 12, 1
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0037_D24R0101_029C:
	.short 63, 1
	.short 32, 1
	.short 254, 0

scr_seq_0037_D24R0101_02A8:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
scr_seq_0037_D24R0101_02B8:
	scrcmd_609
	lockall
	get_lead_mon_index VAR_TEMP_x4005
	scrcmd_698 2, 16389, 16390
	comparevartovalue VAR_TEMP_x4006, 0
	gotoif eq, scr_seq_0037_D24R0101_02DA
	goto scr_seq_0037_D24R0101_02EE

scr_seq_0037_D24R0101_02DA:
	scrcmd_698 1, 16389, 16391
	comparevartovalue VAR_TEMP_x4007, 0
	gotoif eq, scr_seq_0037_D24R0101_0530
scr_seq_0037_D24R0101_02EE:
	scrcmd_184 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0037_D24R0101_0530
	scrcmd_307 13, 8, 25, 29, 77
	scrcmd_310 77
	scrcmd_308 77
	clearflag FLAG_UNK_2E6
	show_person 9
	scrcmd_311 77
	scrcmd_308 77
	scrcmd_309 77
	apply_movement 9, scr_seq_0037_D24R0101_0534
	apply_movement 255, scr_seq_0037_D24R0101_05C4
	scrcmd_386 VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 3
	gotoif ne, scr_seq_0037_D24R0101_0350
	apply_movement 253, scr_seq_0037_D24R0101_05DC
	goto scr_seq_0037_D24R0101_0373

scr_seq_0037_D24R0101_0350:
	comparevartovalue VAR_TEMP_x4001, 2
	gotoif ne, scr_seq_0037_D24R0101_036B
	apply_movement 253, scr_seq_0037_D24R0101_05F4
	goto scr_seq_0037_D24R0101_0373

scr_seq_0037_D24R0101_036B:
	apply_movement 253, scr_seq_0037_D24R0101_0604
scr_seq_0037_D24R0101_0373:
	wait_movement
	npc_msg 1
	closemsg
	apply_movement 9, scr_seq_0037_D24R0101_054C
	comparevartovalue VAR_TEMP_x4001, 3
	gotoif ne, scr_seq_0037_D24R0101_039D
	apply_movement 253, scr_seq_0037_D24R0101_0614
	goto scr_seq_0037_D24R0101_03C0

scr_seq_0037_D24R0101_039D:
	comparevartovalue VAR_TEMP_x4001, 2
	gotoif ne, scr_seq_0037_D24R0101_03B8
	apply_movement 253, scr_seq_0037_D24R0101_0624
	goto scr_seq_0037_D24R0101_03C0

scr_seq_0037_D24R0101_03B8:
	apply_movement 253, scr_seq_0037_D24R0101_0630
scr_seq_0037_D24R0101_03C0:
	wait_movement
	npc_msg 2
	closemsg
	comparevartovalue VAR_TEMP_x4001, 3
	gotoif ne, scr_seq_0037_D24R0101_03E2
	apply_movement 9, scr_seq_0037_D24R0101_0554
	goto scr_seq_0037_D24R0101_03EA

scr_seq_0037_D24R0101_03E2:
	apply_movement 9, scr_seq_0037_D24R0101_0570
scr_seq_0037_D24R0101_03EA:
	wait_movement
	npc_msg 3
	closemsg
	apply_movement 9, scr_seq_0037_D24R0101_0584
	wait_movement
	npc_msg 4
	closemsg
	apply_movement 9, scr_seq_0037_D24R0101_05A4
	wait_movement
	npc_msg 5
	closemsg
	apply_movement 9, scr_seq_0037_D24R0101_05B4
	wait_movement
	npc_msg 6
	closemsg
	setvar VAR_UNK_40FB, 2
	setflag FLAG_UNK_2E6
	clearflag FLAG_UNK_2E7
	play_se SEQ_SE_DP_KAIDAN2
	comparevartovalue VAR_UNK_403E, 6
	gotoif ne, scr_seq_0037_D24R0101_0467
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 490, 0, 15, 24, 2
	fade_screen 6, 1, 1, 0
	wait_fade
	goto scr_seq_0037_D24R0101_0530

scr_seq_0037_D24R0101_0467:
	comparevartovalue VAR_UNK_403E, 7
	gotoif ne, scr_seq_0037_D24R0101_049E
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 492, 0, 15, 24, 2
	fade_screen 6, 1, 1, 0
	wait_fade
	goto scr_seq_0037_D24R0101_0530

scr_seq_0037_D24R0101_049E:
	comparevartovalue VAR_UNK_403E, 8
	gotoif ne, scr_seq_0037_D24R0101_04D5
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 492, 0, 15, 24, 2
	fade_screen 6, 1, 1, 0
	wait_fade
	goto scr_seq_0037_D24R0101_0530

scr_seq_0037_D24R0101_04D5:
	comparevartovalue VAR_UNK_403E, 9
	gotoif ne, scr_seq_0037_D24R0101_050C
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 492, 0, 15, 24, 2
	fade_screen 6, 1, 1, 0
	wait_fade
	goto scr_seq_0037_D24R0101_0530

scr_seq_0037_D24R0101_050C:
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 315, 0, 15, 24, 2
	fade_screen 6, 1, 1, 0
	wait_fade
scr_seq_0037_D24R0101_0530:
	releaseall
	end


scr_seq_0037_D24R0101_0534:
	.short 62, 1
	.short 17, 3
	.short 71, 1
	.short 20, 1
	.short 72, 1
	.short 254, 0

scr_seq_0037_D24R0101_054C:
	.short 17, 1
	.short 254, 0

scr_seq_0037_D24R0101_0554:
	.short 38, 1
	.short 75, 1
	.short 63, 1
	.short 71, 1
	.short 15, 1
	.short 72, 1
	.short 254, 0

scr_seq_0037_D24R0101_0570:
	.short 75, 1
	.short 63, 1
	.short 15, 1
	.short 37, 1
	.short 254, 0

scr_seq_0037_D24R0101_0584:
	.short 15, 1
	.short 14, 2
	.short 63, 1
	.short 15, 2
	.short 39, 1
	.short 14, 1
	.short 37, 1
	.short 254, 0

scr_seq_0037_D24R0101_05A4:
	.short 75, 1
	.short 63, 1
	.short 37, 1
	.short 254, 0

scr_seq_0037_D24R0101_05B4:
	.short 14, 1
	.short 13, 1
	.short 37, 1
	.short 254, 0

scr_seq_0037_D24R0101_05C4:
	.short 71, 1
	.short 57, 1
	.short 17, 2
	.short 72, 1
	.short 32, 1
	.short 254, 0

scr_seq_0037_D24R0101_05DC:
	.short 71, 1
	.short 18, 1
	.short 72, 1
	.short 63, 2
	.short 33, 1
	.short 254, 0

scr_seq_0037_D24R0101_05F4:
	.short 50, 1
	.short 63, 3
	.short 33, 1
	.short 254, 0

scr_seq_0037_D24R0101_0604:
	.short 71, 1
	.short 17, 5
	.short 72, 1
	.short 254, 0

scr_seq_0037_D24R0101_0614:
	.short 13, 3
	.short 15, 1
	.short 32, 1
	.short 254, 0

scr_seq_0037_D24R0101_0624:
	.short 13, 4
	.short 32, 1
	.short 254, 0

scr_seq_0037_D24R0101_0630:
	.short 63, 2
	.short 12, 1
	.short 15, 1
	.short 12, 1
	.short 254, 0
scr_seq_0037_D24R0101_0644:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 10, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0037_D24R0101_0659:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 9, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0037_D24R0101_066E:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 7, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0037_D24R0101_0683:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 8, VAR_SPECIAL_x800C
	callstd 2000
	end
	.balign 4, 0
