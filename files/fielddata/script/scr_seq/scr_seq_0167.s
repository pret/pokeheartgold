#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0167_000E ; 000
	scrdef scr_seq_0167_0027 ; 001
	scrdef scr_seq_0167_093C ; 002
	scrdef_end

scr_seq_0167_000E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x400A, 0
	npc_msg 0
	goto scr_seq_0167_0040

scr_seq_0167_0025:
	.byte 0x02, 0x00
scr_seq_0167_0027:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x400A, 1
	npc_msg 1
	goto scr_seq_0167_0040

scr_seq_0167_003E:
	.byte 0x02, 0x00
scr_seq_0167_0040:
	touchscreen_menu_hide
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 271, 255, 0
	scrcmd_751 11, 255, 1
	scrcmd_751 12, 255, 2
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0167_01A7
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0167_008C
	goto scr_seq_0167_07D9

scr_seq_0167_008A:
	.byte 0x02, 0x00
scr_seq_0167_008C:
	npc_msg 11
	touchscreen_menu_hide
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_TEMP_x400A, 0
	gotoif ne, scr_seq_0167_00B4
	scrcmd_751 272, 255, 0
	goto scr_seq_0167_00BC

scr_seq_0167_00B4:
	scrcmd_751 278, 255, 7
scr_seq_0167_00BC:
	scrcmd_751 273, 255, 1
	scrcmd_751 274, 255, 2
	scrcmd_751 277, 255, 3
	scrcmd_751 275, 255, 4
	scrcmd_751 276, 255, 5
	scrcmd_751 13, 255, 6
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0167_015A
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0167_0165
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0167_0170
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0167_017B
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_0167_0186
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, scr_seq_0167_0191
	comparevartovalue VAR_SPECIAL_x8008, 7
	gotoif eq, scr_seq_0167_019C
	npc_msg 2
	goto scr_seq_0167_0040

scr_seq_0167_0158:
	.byte 0x02, 0x00
scr_seq_0167_015A:
	npc_msg 12
	goto scr_seq_0167_008C

scr_seq_0167_0163:
	.byte 0x02, 0x00
scr_seq_0167_0165:
	npc_msg 14
	goto scr_seq_0167_008C

scr_seq_0167_016E:
	.byte 0x02, 0x00
scr_seq_0167_0170:
	npc_msg 15
	goto scr_seq_0167_008C

scr_seq_0167_0179:
	.byte 0x02, 0x00
scr_seq_0167_017B:
	npc_msg 18
	goto scr_seq_0167_008C

scr_seq_0167_0184:
	.byte 0x02, 0x00
scr_seq_0167_0186:
	npc_msg 16
	goto scr_seq_0167_008C

scr_seq_0167_018F:
	.byte 0x02
	.byte 0x00
scr_seq_0167_0191:
	npc_msg 17
	goto scr_seq_0167_008C

scr_seq_0167_019A:
	.byte 0x02, 0x00
scr_seq_0167_019C:
	npc_msg 13
	goto scr_seq_0167_008C

scr_seq_0167_01A5:
	.byte 0x02, 0x00
scr_seq_0167_01A7:
	scrcmd_358 32780
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif lt, scr_seq_0167_07E6
	npc_msg 3
	touchscreen_menu_hide
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 273, 255, 0
	scrcmd_751 274, 255, 1
	scrcmd_751 277, 255, 4
	scrcmd_751 275, 255, 2
	scrcmd_751 276, 255, 3
	scrcmd_751 13, 255, 5
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0167_0249
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0167_0257
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0167_0265
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0167_0273
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_0167_0281
	npc_msg 2
	goto scr_seq_0167_0040

scr_seq_0167_0247:
	.byte 0x02, 0x00
scr_seq_0167_0249:
	setvar VAR_SPECIAL_x8000, 0
	goto scr_seq_0167_028F

scr_seq_0167_0255:
	.byte 0x02, 0x00
scr_seq_0167_0257:
	setvar VAR_SPECIAL_x8000, 1
	goto scr_seq_0167_028F

scr_seq_0167_0263:
	.byte 0x02, 0x00
scr_seq_0167_0265:
	setvar VAR_SPECIAL_x8000, 3
	goto scr_seq_0167_028F

scr_seq_0167_0271:
	.byte 0x02, 0x00
scr_seq_0167_0273:
	setvar VAR_SPECIAL_x8000, 4
	goto scr_seq_0167_028F

scr_seq_0167_027F:
	.byte 0x02
	.byte 0x00
scr_seq_0167_0281:
	setvar VAR_SPECIAL_x8000, 2
	goto scr_seq_0167_028F

scr_seq_0167_028D:
	.byte 0x02, 0x00
scr_seq_0167_028F:
	scrcmd_745 3, 32768
	npc_msg 4
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0167_01A7
	scrcmd_815 0
	npc_msg 5
	closemsg
	scrcmd_600
	call scr_seq_0167_04A3
	scrcmd_307 0, 0, 22, 9, 77
	call scr_seq_0167_045C
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0167_0820
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	call scr_seq_0167_04DE
	apply_movement 255, scr_seq_0167_0848
	wait 40, VAR_SPECIAL_x800C
	scrcmd_188 4096
	scrcmd_189
	wait_movement
	play_fanfare SEQ_ME_PT_NEW
	buffer_players_name 0
	npc_msg 8
	wait_fanfare
	wait 30, VAR_SPECIAL_x800C
	npc_msg 6
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0167_0828
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_309 77
	call scr_seq_0167_0766
	scrcmd_188 1
	scrcmd_189
	apply_movement 255, scr_seq_0167_0934
	wait_movement
	scrcmd_784 3, 0
	fade_screen 6, 1, 1, 0
	wait_fade
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0167_08DC
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_307 0, 0, 22, 9, 77
	call scr_seq_0167_045C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0167_046F
	call scr_seq_0167_0505
	call scr_seq_0167_0540
	call scr_seq_0167_0464
	npc_msg 19
	buffer_players_name 0
	scrcmd_198 1, 32769
	scrcmd_198 2, 32770
	npc_msg 46
	npc_msg 20
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	comparevartovalue VAR_SPECIAL_x8003, 0
	callif eq, scr_seq_0167_05AB
	call scr_seq_0167_0567
	comparevartovalue VAR_UNK_40E2, 1
	callif eq, scr_seq_0167_05ED
	comparevartovalue VAR_UNK_40E2, 2
	callif eq, scr_seq_0167_05FA
	comparevartovalue VAR_UNK_40E2, 3
	callif eq, scr_seq_0167_0607
	checkflag FLAG_UNK_2D5
	callif TRUE, scr_seq_0167_063E
	checkflag FLAG_UNK_2D6
	callif TRUE, scr_seq_0167_0657
	checkflag FLAG_UNK_2D7
	callif TRUE, scr_seq_0167_0670
	checkflag FLAG_UNK_2D8
	callif TRUE, scr_seq_0167_0689
	checkflag FLAG_UNK_2D9
	callif TRUE, scr_seq_0167_06A2
	npc_msg 10
	waitbutton
	closemsg
	releaseall
	scrcmd_606
	scrcmd_784 3, 1
	end

scr_seq_0167_045C:
	scrcmd_310 77
	scrcmd_308 77
	return

scr_seq_0167_0464:
	scrcmd_311 77
	scrcmd_308 77
	scrcmd_309 77
	return

scr_seq_0167_046F:
	scrcmd_784 3, 1
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0167_090C
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	call scr_seq_0167_0540
	call scr_seq_0167_0464
	scrcmd_606
	releaseall
	end

scr_seq_0167_04A3:
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	comparevartovalue VAR_TEMP_x400A, 0
	gotoif ne, scr_seq_0167_04C8
	apply_movement 255, scr_seq_0167_0814
	goto scr_seq_0167_04D0

scr_seq_0167_04C8:
	apply_movement 255, scr_seq_0167_083C
scr_seq_0167_04D0:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	return

scr_seq_0167_04DE:
	comparevartovalue VAR_TEMP_x400A, 0
	gotoif ne, scr_seq_0167_04F9
	apply_movement 0, scr_seq_0167_0914
	goto scr_seq_0167_0501

scr_seq_0167_04F9:
	apply_movement 10, scr_seq_0167_091C
scr_seq_0167_0501:
	wait_movement
	return

scr_seq_0167_0505:
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	comparevartovalue VAR_TEMP_x400A, 0
	gotoif ne, scr_seq_0167_052A
	apply_movement 255, scr_seq_0167_08EC
	goto scr_seq_0167_0532

scr_seq_0167_052A:
	apply_movement 255, scr_seq_0167_08FC
scr_seq_0167_0532:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	return

scr_seq_0167_0540:
	comparevartovalue VAR_TEMP_x400A, 0
	gotoif ne, scr_seq_0167_055B
	apply_movement 0, scr_seq_0167_0924
	goto scr_seq_0167_0563

scr_seq_0167_055B:
	apply_movement 10, scr_seq_0167_0924
scr_seq_0167_0563:
	wait_movement
	return

scr_seq_0167_0567:
	comparevartovalue VAR_SPECIAL_x8003, 0
	gotoif ne, scr_seq_0167_057F
	scrcmd_725 0, 10
	goto scr_seq_0167_05A9

scr_seq_0167_057F:
	comparevartovalue VAR_SPECIAL_x8003, 1
	gotoif ne, scr_seq_0167_0597
	scrcmd_725 0, 5
	goto scr_seq_0167_05A9

scr_seq_0167_0597:
	comparevartovalue VAR_SPECIAL_x8003, 3
	gotoif ne, scr_seq_0167_05A9
	scrcmd_725 1, 5
scr_seq_0167_05A9:
	return

scr_seq_0167_05AB:
	comparevartovalue VAR_TEMP_x400A, 0
	gotoif ne, scr_seq_0167_05C4
	setvar VAR_TEMP_x4009, 100
	goto scr_seq_0167_05CA

scr_seq_0167_05C4:
	setvar VAR_TEMP_x4009, 300
scr_seq_0167_05CA:
	scrcmd_198 2, 16393
	npc_msg 22
	scrcmd_122 16393
	buffer_players_name 0
	scrcmd_198 2, 16393
	npc_msg 20
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	add_special_game_stat 13
	return

scr_seq_0167_05ED:
	checkflag FLAG_UNK_0EF
	callif TRUE, scr_seq_0167_0614
	return

scr_seq_0167_05FA:
	checkflag FLAG_UNK_0F0
	callif TRUE, scr_seq_0167_0622
	return

scr_seq_0167_0607:
	checkflag FLAG_UNK_0F1
	callif TRUE, scr_seq_0167_0630
	return

scr_seq_0167_0614:
	buffer_players_name 0
	npc_msg 23
	setvar VAR_UNK_40E2, 2
	return

scr_seq_0167_0622:
	buffer_players_name 0
	npc_msg 24
	setvar VAR_UNK_40E2, 3
	return

scr_seq_0167_0630:
	buffer_players_name 0
	npc_msg 25
	setvar VAR_UNK_40E2, 4
	return

scr_seq_0167_063E:
	scrcmd_724 16, 32780
	comparevartovalue VAR_SPECIAL_x800C, 5000
	gotoif lt, scr_seq_0167_0655
	clearflag FLAG_UNK_2D5
scr_seq_0167_0655:
	return

scr_seq_0167_0657:
	scrcmd_724 12, 32780
	comparevartovalue VAR_SPECIAL_x800C, 50
	gotoif lt, scr_seq_0167_066E
	clearflag FLAG_UNK_2D6
scr_seq_0167_066E:
	return

scr_seq_0167_0670:
	scrcmd_724 17, 32780
	comparevartovalue VAR_SPECIAL_x800C, 200
	gotoif lt, scr_seq_0167_0687
	clearflag FLAG_UNK_2D7
scr_seq_0167_0687:
	return

scr_seq_0167_0689:
	scrcmd_724 10, 32780
	comparevartovalue VAR_SPECIAL_x800C, 100
	gotoif lt, scr_seq_0167_06A0
	clearflag FLAG_UNK_2D8
scr_seq_0167_06A0:
	return

scr_seq_0167_06A2:
	scrcmd_724 0, 16384
	comparevartovalue VAR_TEMP_x4000, 50
	gotoif lt, scr_seq_0167_0764
	scrcmd_724 1, 16384
	comparevartovalue VAR_TEMP_x4000, 50
	gotoif lt, scr_seq_0167_0764
	scrcmd_724 2, 16384
	comparevartovalue VAR_TEMP_x4000, 50
	gotoif lt, scr_seq_0167_0764
	scrcmd_724 3, 16384
	comparevartovalue VAR_TEMP_x4000, 50
	gotoif lt, scr_seq_0167_0764
	scrcmd_724 4, 16384
	comparevartovalue VAR_TEMP_x4000, 50
	gotoif lt, scr_seq_0167_0764
	scrcmd_724 5, 16384
	comparevartovalue VAR_TEMP_x4000, 50
	gotoif lt, scr_seq_0167_0764
	scrcmd_724 6, 16384
	comparevartovalue VAR_TEMP_x4000, 50
	gotoif lt, scr_seq_0167_0764
	scrcmd_724 7, 16384
	comparevartovalue VAR_TEMP_x4000, 50
	gotoif lt, scr_seq_0167_0764
	scrcmd_724 8, 16384
	comparevartovalue VAR_TEMP_x4000, 50
	gotoif lt, scr_seq_0167_0764
	scrcmd_724 9, 16384
	comparevartovalue VAR_TEMP_x4000, 50
	gotoif lt, scr_seq_0167_0764
	clearflag FLAG_UNK_2D9
scr_seq_0167_0764:
	return

scr_seq_0167_0766:
	comparevartovalue VAR_TEMP_x400A, 0
	gotoif ne, scr_seq_0167_0787
	scrcmd_611 0, 0, 32768, 32780, 32769, 32770, 32771
	goto scr_seq_0167_07D7

scr_seq_0167_0787:
	comparevartovalue VAR_TEMP_x400A, 1
	gotoif ne, scr_seq_0167_07A8
	scrcmd_611 0, 1, 32768, 32780, 32769, 32770, 32771
	goto scr_seq_0167_07D7

scr_seq_0167_07A8:
	comparevartovalue VAR_TEMP_x400A, 2
	gotoif ne, scr_seq_0167_07C9
	scrcmd_611 1, 0, 32768, 32780, 32769, 32770, 32771
	goto scr_seq_0167_07D7

scr_seq_0167_07C9:
	scrcmd_611 1, 1, 32768, 32780, 32769, 32770, 32771
scr_seq_0167_07D7:
	return

scr_seq_0167_07D9:
	touchscreen_menu_show
scr_seq_0167_07DB:
	npc_msg 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0167_07E6:
	touchscreen_menu_show
	npc_msg 37
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0167_07F3:
	.byte 0x00, 0x0c, 0x00, 0x03, 0x00, 0x0e, 0x00, 0x01, 0x00, 0x03, 0x00, 0x01, 0x00
	.byte 0xfe, 0x00, 0x00, 0x00, 0x3f, 0x00, 0x02, 0x00, 0x0f, 0x00, 0x01, 0x00, 0x0d, 0x00, 0x03, 0x00
	.byte 0xfe, 0x00, 0x00, 0x00

scr_seq_0167_0814:
	.short 14, 1
	.short 32, 1
	.short 254, 0

scr_seq_0167_0820:
	.short 12, 2
	.short 254, 0

scr_seq_0167_0828:
	.short 32, 1
	.short 12, 1
	.short 15, 1
	.short 12, 1
	.short 254, 0

scr_seq_0167_083C:
	.short 15, 1
	.short 32, 1
	.short 254, 0

scr_seq_0167_0848:
	.short 0, 1
	.short 60, 1
	.short 3, 1
	.short 60, 1
	.short 1, 1
	.short 60, 1
	.short 2, 1
	.short 60, 1
	.short 0, 1
	.short 60, 1
	.short 3, 1
	.short 60, 1
	.short 1, 1
	.short 60, 1
	.short 2, 1
	.short 60, 1
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
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 63, 1
	.short 254, 0

scr_seq_0167_08DC:
	.short 13, 1
	.short 14, 1
	.short 13, 1
	.short 254, 0

scr_seq_0167_08EC:
	.short 13, 2
	.short 15, 1
	.short 32, 1
	.short 254, 0

scr_seq_0167_08FC:
	.short 13, 2
	.short 14, 1
	.short 32, 1
	.short 254, 0

scr_seq_0167_090C:
	.short 13, 3
	.short 254, 0

scr_seq_0167_0914:
	.short 34, 1
	.short 254, 0

scr_seq_0167_091C:
	.short 35, 1
	.short 254, 0

scr_seq_0167_0924:
	.short 33, 1
	.short 254, 0
	.byte 0x20, 0x00, 0x01, 0x00
	.byte 0xfe, 0x00, 0x00, 0x00

scr_seq_0167_0934:
	.short 1, 1
	.short 254, 0
scr_seq_0167_093C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_40E2, 0
	gotoif eq, scr_seq_0167_0FE4
	setvar VAR_TEMP_x400A, 2
	npc_msg 26
scr_seq_0167_095A:
	touchscreen_menu_hide
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 271, 255, 0
	scrcmd_751 11, 255, 1
	scrcmd_751 12, 255, 2
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0167_0AB1
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0167_09A6
	goto scr_seq_0167_07D9

scr_seq_0167_09A4:
	.byte 0x02, 0x00
scr_seq_0167_09A6:
	npc_msg 11
	touchscreen_menu_hide
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 272, 255, 0
	scrcmd_751 342, 255, 1
	scrcmd_751 343, 255, 2
	scrcmd_751 344, 255, 3
	scrcmd_751 345, 255, 4
	scrcmd_751 346, 255, 6
	checkflag FLAG_UNK_2B3
	callif FALSE, scr_seq_0167_0B93
	scrcmd_751 13, 255, 7
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0167_0A64
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0167_0A6F
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0167_0A7A
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0167_0A85
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_0167_0A90
	comparevartovalue VAR_SPECIAL_x8008, 6
	gotoif eq, scr_seq_0167_0A9B
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, scr_seq_0167_0AA6
	npc_msg 2
	goto scr_seq_0167_095A

scr_seq_0167_0A62:
	.byte 0x02, 0x00
scr_seq_0167_0A64:
	npc_msg 39
	goto scr_seq_0167_09A6

scr_seq_0167_0A6D:
	.byte 0x02, 0x00
scr_seq_0167_0A6F:
	npc_msg 40
	goto scr_seq_0167_09A6

scr_seq_0167_0A78:
	.byte 0x02, 0x00
scr_seq_0167_0A7A:
	npc_msg 41
	goto scr_seq_0167_09A6

scr_seq_0167_0A83:
	.byte 0x02, 0x00
scr_seq_0167_0A85:
	npc_msg 42
	goto scr_seq_0167_09A6

scr_seq_0167_0A8E:
	.byte 0x02, 0x00
scr_seq_0167_0A90:
	npc_msg 43
	goto scr_seq_0167_09A6

scr_seq_0167_0A99:
	.byte 0x02, 0x00
scr_seq_0167_0A9B:
	npc_msg 44
	goto scr_seq_0167_09A6

scr_seq_0167_0AA4:
	.byte 0x02, 0x00
scr_seq_0167_0AA6:
	npc_msg 45
	goto scr_seq_0167_09A6

scr_seq_0167_0AAF:
	.byte 0x02
	.byte 0x00
scr_seq_0167_0AB1:
	scrcmd_358 32780
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif lt, scr_seq_0167_07E6
	callstd 2006
	copyvar VAR_SPECIAL_x800C, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0167_0AE1
	goto scr_seq_0167_07DB

scr_seq_0167_0ADF:
	.byte 0x02
	.byte 0x00
scr_seq_0167_0AE1:
	setvar VAR_TEMP_x400A, 2
	npc_msg 3
	touchscreen_menu_hide
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 342, 255, 0
	scrcmd_751 343, 255, 1
	scrcmd_751 344, 255, 2
	scrcmd_751 345, 255, 3
	scrcmd_751 346, 255, 4
	checkflag FLAG_UNK_2B3
	callif FALSE, scr_seq_0167_0B93
	scrcmd_751 12, 255, 6
	scrcmd_752
	copyvar VAR_TEMP_x400B, VAR_SPECIAL_x800C
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0167_0B9D
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0167_0BAB
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0167_0BB9
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0167_0BC7
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_0167_0BD5
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, scr_seq_0167_0BE3
	goto scr_seq_0167_07D9

scr_seq_0167_0B91:
	.byte 0x02, 0x00
scr_seq_0167_0B93:
	scrcmd_751 279, 255, 5
	return

scr_seq_0167_0B9D:
	setvar VAR_SPECIAL_x8000, 5
	goto scr_seq_0167_0BF7

scr_seq_0167_0BA9:
	.byte 0x02, 0x00
scr_seq_0167_0BAB:
	setvar VAR_SPECIAL_x8000, 6
	goto scr_seq_0167_0BF7

scr_seq_0167_0BB7:
	.byte 0x02, 0x00
scr_seq_0167_0BB9:
	setvar VAR_SPECIAL_x8000, 7
	goto scr_seq_0167_0BF7

scr_seq_0167_0BC5:
	.byte 0x02, 0x00
scr_seq_0167_0BC7:
	setvar VAR_SPECIAL_x8000, 8
	goto scr_seq_0167_0BF7

scr_seq_0167_0BD3:
	.byte 0x02, 0x00
scr_seq_0167_0BD5:
	setvar VAR_SPECIAL_x8000, 9
	goto scr_seq_0167_0BF7

scr_seq_0167_0BE1:
	.byte 0x02, 0x00
scr_seq_0167_0BE3:
	setvar VAR_SPECIAL_x8000, 10
	setvar VAR_TEMP_x400A, 3
	goto scr_seq_0167_0BF7

scr_seq_0167_0BF5:
	.byte 0x02, 0x00
scr_seq_0167_0BF7:
	touchscreen_menu_hide
	npc_msg 27
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 14, 255, 0
	scrcmd_751 15, 255, 1
	scrcmd_751 13, 255, 2
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0167_0C48
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0167_0C88
	goto scr_seq_0167_0AE1

scr_seq_0167_0C44:
	.byte 0x02, 0x00, 0x02, 0x00
scr_seq_0167_0C48:
	npc_msg 28
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0167_0BF7
	scrcmd_226 40, 16395, 0, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0167_0CC8
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, scr_seq_0167_0CD2
	goto scr_seq_0167_0CE3

scr_seq_0167_0C86:
	.byte 0x02, 0x00
scr_seq_0167_0C88:
	npc_msg 28
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0167_0BF7
	scrcmd_227 40, 16395, 0, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0167_0CC8
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, scr_seq_0167_0CD2
	goto scr_seq_0167_0CE3

scr_seq_0167_0CC6:
	.byte 0x02, 0x00
scr_seq_0167_0CC8:
	scrcmd_283
	goto scr_seq_0167_0BF7

scr_seq_0167_0CD0:
	.byte 0x02, 0x00
scr_seq_0167_0CD2:
	scrcmd_283
	touchscreen_menu_show
	npc_msg 29
	waitbutton
	closemsg
	releaseall
	scrcmd_606
	end

scr_seq_0167_0CE3:
	scrcmd_815 0
	npc_msg 36
	wait 30, VAR_SPECIAL_x8004
	closemsg
	scrcmd_600
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0167_0814
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_307 0, 0, 10, 9, 77
	call scr_seq_0167_045C
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0167_0820
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	apply_movement 2, scr_seq_0167_0914
	apply_movement 255, scr_seq_0167_0848
	wait 40, VAR_SPECIAL_x800C
	scrcmd_188 4096
	scrcmd_189
	wait_movement
	play_fanfare SEQ_ME_PT_NEW
	buffer_players_name 0
	npc_msg 35
	wait 30, VAR_SPECIAL_x8004
	wait_fanfare
	scrcmd_745 3, 32768
	scrcmd_451 16384
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_0167_0D96
	npc_msg 30
	wait 30, VAR_SPECIAL_x8004
	goto scr_seq_0167_0DD7

scr_seq_0167_0D96:
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif ne, scr_seq_0167_0DB2
	npc_msg 31
	wait 30, VAR_SPECIAL_x8004
	goto scr_seq_0167_0DD7

scr_seq_0167_0DB2:
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, scr_seq_0167_0DCE
	npc_msg 32
	wait 30, VAR_SPECIAL_x8004
	goto scr_seq_0167_0DD7

scr_seq_0167_0DCE:
	npc_msg 33
	wait 30, VAR_SPECIAL_x8004
scr_seq_0167_0DD7:
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0167_0FD4
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_309 77
	scrcmd_257 239
	call scr_seq_0167_0766
	scrcmd_283
	scrcmd_188 1
	scrcmd_189
	apply_movement 255, scr_seq_0167_0934
	wait_movement
	scrcmd_784 3, 0
	fade_screen 6, 1, 1, 0
	wait_fade
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0167_0FDC
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_307 0, 0, 10, 9, 77
	call scr_seq_0167_045C
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0167_08EC
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	apply_movement 2, scr_seq_0167_0924
	wait_movement
	call scr_seq_0167_0464
	npc_msg 19
	buffer_players_name 0
	scrcmd_198 1, 32769
	scrcmd_198 2, 32770
	comparevartovalue VAR_SPECIAL_x8000, 10
	gotoif lt, scr_seq_0167_0EB5
	npc_msg 47
	goto scr_seq_0167_0EB8

scr_seq_0167_0EB5:
	npc_msg 46
scr_seq_0167_0EB8:
	npc_msg 20
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	comparevartovalue VAR_SPECIAL_x8003, 1
	callif le, scr_seq_0167_0F43
	call scr_seq_0167_0F8D
	comparevartovalue VAR_UNK_40E2, 1
	callif eq, scr_seq_0167_05ED
	comparevartovalue VAR_UNK_40E2, 2
	callif eq, scr_seq_0167_05FA
	comparevartovalue VAR_UNK_40E2, 3
	callif eq, scr_seq_0167_0607
	checkflag FLAG_UNK_2D5
	callif TRUE, scr_seq_0167_063E
	checkflag FLAG_UNK_2D6
	callif TRUE, scr_seq_0167_0657
	checkflag FLAG_UNK_2D7
	callif TRUE, scr_seq_0167_0670
	checkflag FLAG_UNK_2D8
	callif TRUE, scr_seq_0167_0689
	checkflag FLAG_UNK_2D9
	callif TRUE, scr_seq_0167_06A2
	npc_msg 10
	waitbutton
	closemsg
	releaseall
	scrcmd_606
	scrcmd_784 3, 1
	end

scr_seq_0167_0F43:
	comparevartovalue VAR_SPECIAL_x8003, 0
	gotoif ne, scr_seq_0167_0F68
	setvar VAR_TEMP_x4009, 500
	scrcmd_198 2, 16393
	npc_msg 22
	add_special_game_stat 18
	goto scr_seq_0167_0F76

scr_seq_0167_0F68:
	setvar VAR_TEMP_x4009, 200
	scrcmd_198 2, 16393
	npc_msg 34
scr_seq_0167_0F76:
	scrcmd_122 16393
	buffer_players_name 0
	scrcmd_198 2, 16393
	npc_msg 20
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	return

scr_seq_0167_0F8D:
	comparevartovalue VAR_SPECIAL_x8003, 0
	gotoif ne, scr_seq_0167_0FA5
	scrcmd_725 0, 15
	goto scr_seq_0167_0FCF

scr_seq_0167_0FA5:
	comparevartovalue VAR_SPECIAL_x8003, 1
	gotoif ne, scr_seq_0167_0FBD
	scrcmd_725 0, 10
	goto scr_seq_0167_0FCF

scr_seq_0167_0FBD:
	comparevartovalue VAR_SPECIAL_x8003, 3
	gotoif ne, scr_seq_0167_0FCF
	scrcmd_725 1, 5
scr_seq_0167_0FCF:
	return

scr_seq_0167_0FD1:
	.byte 0x00, 0x00, 0x00

scr_seq_0167_0FD4:
	.short 12, 2
	.short 254, 0

scr_seq_0167_0FDC:
	.short 13, 2
	.short 254, 0
scr_seq_0167_0FE4:
	npc_msg 38
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
