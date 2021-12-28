#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0237_R34_0036 ; 000
	scrdef scr_seq_0237_R34_00DF ; 001
	scrdef scr_seq_0237_R34_05EC ; 002
	scrdef scr_seq_0237_R34_015C ; 003
	scrdef scr_seq_0237_R34_07B8 ; 004
	scrdef scr_seq_0237_R34_095C ; 005
	scrdef scr_seq_0237_R34_09FC ; 006
	scrdef scr_seq_0237_R34_0A25 ; 007
	scrdef scr_seq_0237_R34_0A4E ; 008
	scrdef scr_seq_0237_R34_0A74 ; 009
	scrdef scr_seq_0237_R34_0A89 ; 010
	scrdef scr_seq_0237_R34_0A9E ; 011
	scrdef scr_seq_0237_R34_05FF ; 012
	scrdef_end

scr_seq_0237_R34_0036:
	scrcmd_144 VAR_OBJ_0
	scrcmd_388 16384
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, scr_seq_0237_R34_0057
	scrcmd_340 10, 16
	goto scr_seq_0237_R34_005D

scr_seq_0237_R34_0057:
	scrcmd_340 10, 15
scr_seq_0237_R34_005D:
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_0237_R34_006E
	clearflag FLAG_UNK_189
	end

scr_seq_0237_R34_006E:
	check_badge 2, VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, scr_seq_0237_R34_009F
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif eq, scr_seq_0237_R34_00A9
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif eq, scr_seq_0237_R34_00A9
scr_seq_0237_R34_009F:
	setflag FLAG_UNK_27E
	goto scr_seq_0237_R34_00AD

scr_seq_0237_R34_00A9:
	clearflag FLAG_UNK_27E
scr_seq_0237_R34_00AD:
	scrcmd_379 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif eq, scr_seq_0237_R34_00D5
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif eq, scr_seq_0237_R34_00D5
	clearflag FLAG_UNK_1D1
	setflag FLAG_UNK_1D2
	end

scr_seq_0237_R34_00D5:
	clearflag FLAG_UNK_1D2
	setflag FLAG_UNK_1D1
	end

scr_seq_0237_R34_00DF:
	scrcmd_609
	lockall
	apply_movement 10, scr_seq_0237_R34_0130
	apply_movement 255, scr_seq_0237_R34_0140
	wait_movement
	npc_msg 46
	buffer_players_name 0
	register_gear_number 6
	npc_msg 47
	play_fanfare SEQ_ME_POKEGEAR_REGIST
	wait_fanfare
	register_gear_number 7
	npc_msg 48
	play_fanfare SEQ_ME_POKEGEAR_REGIST
	wait_fanfare
	npc_msg 49
	closemsg
	apply_movement 10, scr_seq_0237_R34_014C
	wait_movement
	setvar VAR_UNK_408E, 3
	releaseall
	end

scr_seq_0237_R34_012E:
	.byte 0x00, 0x00

scr_seq_0237_R34_0130:
	.short 75, 1
	.short 13, 1
	.short 15, 2
	.short 254, 0

scr_seq_0237_R34_0140:
	.short 63, 3
	.short 34, 1
	.short 254, 0

scr_seq_0237_R34_014C:
	.short 14, 2
	.short 12, 1
	.short 33, 1
	.short 254, 0
scr_seq_0237_R34_015C:
	scrcmd_609
	lockall
	gender_msgbox 36, 41
	closemsg
	apply_movement 10, scr_seq_0237_R34_0510
	wait_movement
	callstd std_play_friend_music
	apply_movement 11, scr_seq_0237_R34_049C
	apply_movement 12, scr_seq_0237_R34_04B0
	wait_movement
	apply_movement 10, scr_seq_0237_R34_0500
	wait_movement
	gender_msgbox 37, 42
	closemsg
	apply_movement 11, scr_seq_0237_R34_04F8
	wait_movement
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	buffer_players_name 0
	comparevartovalue VAR_SPECIAL_x8004, 368
	gotoif ne, scr_seq_0237_R34_01D4
	apply_movement 11, scr_seq_0237_R34_04C0
	apply_movement 12, scr_seq_0237_R34_04CC
	apply_movement 10, scr_seq_0237_R34_0494
	goto scr_seq_0237_R34_0207

scr_seq_0237_R34_01D4:
	comparevartovalue VAR_SPECIAL_x8004, 369
	gotoif ne, scr_seq_0237_R34_01FF
	apply_movement 11, scr_seq_0237_R34_04C0
	apply_movement 12, scr_seq_0237_R34_04CC
	apply_movement 10, scr_seq_0237_R34_0494
	goto scr_seq_0237_R34_0207

scr_seq_0237_R34_01FF:
	apply_movement 11, scr_seq_0237_R34_0518
scr_seq_0237_R34_0207:
	wait_movement
	gender_msgbox 38, 43
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	comparevartovalue VAR_SPECIAL_x8004, 363
	gotoif ne, scr_seq_0237_R34_0234
	apply_movement 255, scr_seq_0237_R34_0528
	goto scr_seq_0237_R34_02C3

scr_seq_0237_R34_0234:
	comparevartovalue VAR_SPECIAL_x8004, 364
	gotoif ne, scr_seq_0237_R34_024F
	apply_movement 255, scr_seq_0237_R34_0534
	goto scr_seq_0237_R34_02C3

scr_seq_0237_R34_024F:
	comparevartovalue VAR_SPECIAL_x8004, 365
	gotoif ne, scr_seq_0237_R34_026A
	apply_movement 255, scr_seq_0237_R34_053C
	goto scr_seq_0237_R34_02C3

scr_seq_0237_R34_026A:
	comparevartovalue VAR_SPECIAL_x8004, 366
	gotoif ne, scr_seq_0237_R34_0285
	apply_movement 255, scr_seq_0237_R34_0548
	goto scr_seq_0237_R34_02C3

scr_seq_0237_R34_0285:
	comparevartovalue VAR_SPECIAL_x8004, 367
	gotoif ne, scr_seq_0237_R34_02A0
	apply_movement 255, scr_seq_0237_R34_0554
	goto scr_seq_0237_R34_02C3

scr_seq_0237_R34_02A0:
	comparevartovalue VAR_SPECIAL_x8004, 368
	gotoif ne, scr_seq_0237_R34_02BB
	apply_movement 255, scr_seq_0237_R34_0560
	goto scr_seq_0237_R34_02C3

scr_seq_0237_R34_02BB:
	apply_movement 255, scr_seq_0237_R34_056C
scr_seq_0237_R34_02C3:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	comparevartovalue VAR_SPECIAL_x8004, 368
	gotoif ne, scr_seq_0237_R34_02EA
	apply_movement 11, scr_seq_0237_R34_0510
	goto scr_seq_0237_R34_030D

scr_seq_0237_R34_02EA:
	comparevartovalue VAR_SPECIAL_x8004, 369
	gotoif ne, scr_seq_0237_R34_0305
	apply_movement 11, scr_seq_0237_R34_0510
	goto scr_seq_0237_R34_030D

scr_seq_0237_R34_0305:
	apply_movement 11, scr_seq_0237_R34_0508
scr_seq_0237_R34_030D:
	wait_movement
	buffer_players_name 0
	gender_msgbox 39, 44
	closemsg
	comparevartovalue VAR_SPECIAL_x8004, 368
	gotoif ne, scr_seq_0237_R34_033B
	apply_movement 11, scr_seq_0237_R34_04D4
	apply_movement 12, scr_seq_0237_R34_04E8
	goto scr_seq_0237_R34_036E

scr_seq_0237_R34_033B:
	comparevartovalue VAR_SPECIAL_x8004, 369
	gotoif ne, scr_seq_0237_R34_035E
	apply_movement 11, scr_seq_0237_R34_04D4
	apply_movement 12, scr_seq_0237_R34_04E8
	goto scr_seq_0237_R34_036E

scr_seq_0237_R34_035E:
	apply_movement 11, scr_seq_0237_R34_04E0
	apply_movement 12, scr_seq_0237_R34_04F0
scr_seq_0237_R34_036E:
	wait_movement
	buffer_players_name 0
	gender_msgbox 40, 45
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	comparevartovalue VAR_SPECIAL_x8004, 368
	gotoif ne, scr_seq_0237_R34_03AE
	apply_movement 11, scr_seq_0237_R34_0578
	apply_movement 12, scr_seq_0237_R34_0590
	apply_movement 255, scr_seq_0237_R34_05A4
	goto scr_seq_0237_R34_03F1

scr_seq_0237_R34_03AE:
	comparevartovalue VAR_SPECIAL_x8004, 369
	gotoif ne, scr_seq_0237_R34_03D9
	apply_movement 11, scr_seq_0237_R34_0578
	apply_movement 12, scr_seq_0237_R34_0590
	apply_movement 255, scr_seq_0237_R34_05A4
	goto scr_seq_0237_R34_03F1

scr_seq_0237_R34_03D9:
	apply_movement 11, scr_seq_0237_R34_0584
	apply_movement 12, scr_seq_0237_R34_0598
	apply_movement 255, scr_seq_0237_R34_05B4
scr_seq_0237_R34_03F1:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_307 11, 12, 16, 26, 77
	scrcmd_310 77
	scrcmd_308 77
	apply_movement 11, scr_seq_0237_R34_05C4
	apply_movement 12, scr_seq_0237_R34_05D0
	wait_movement
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0237_R34_05E0
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	play_se SEQ_SE_DP_KAIDAN2
	scrcmd_596 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0237_R34_0455
	scrcmd_600
scr_seq_0237_R34_0455:
	fade_screen 6, 1, 0, 0
	wait_se SEQ_SE_DP_KAIDAN2
	wait_fade
	scrcmd_309 77
	setvar VAR_UNK_408E, 1
	scrcmd_176 331, 0, 3, 12, 0
	scrcmd_582 38, 368, 411
	fade_screen 6, 1, 1, 0
	wait_fade
	releaseall
	end

scr_seq_0237_R34_0492:
	.byte 0x00, 0x00

scr_seq_0237_R34_0494:
	.short 33, 1
	.short 254, 0

scr_seq_0237_R34_049C:
	.short 13, 6
	.short 15, 3
	.short 13, 2
	.short 35, 1
	.short 254, 0

scr_seq_0237_R34_04B0:
	.short 13, 7
	.short 15, 3
	.short 13, 1
	.short 254, 0

scr_seq_0237_R34_04C0:
	.short 13, 1
	.short 35, 1
	.short 254, 0

scr_seq_0237_R34_04CC:
	.short 13, 1
	.short 254, 0

scr_seq_0237_R34_04D4:
	.short 15, 1
	.short 33, 1
	.short 254, 0

scr_seq_0237_R34_04E0:
	.short 13, 1
	.short 254, 0

scr_seq_0237_R34_04E8:
	.short 13, 1
	.short 254, 0

scr_seq_0237_R34_04F0:
	.short 13, 1
	.short 254, 0

scr_seq_0237_R34_04F8:
	.short 75, 1
	.short 254, 0

scr_seq_0237_R34_0500:
	.short 34, 1
	.short 254, 0

scr_seq_0237_R34_0508:
	.short 35, 1
	.short 254, 0

scr_seq_0237_R34_0510:
	.short 32, 1
	.short 254, 0

scr_seq_0237_R34_0518:
	.short 33, 1
	.short 254, 0
	.byte 0x45, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00

scr_seq_0237_R34_0528:
	.short 15, 1
	.short 12, 1
	.short 254, 0

scr_seq_0237_R34_0534:
	.short 12, 1
	.short 254, 0

scr_seq_0237_R34_053C:
	.short 14, 1
	.short 12, 1
	.short 254, 0

scr_seq_0237_R34_0548:
	.short 14, 2
	.short 12, 1
	.short 254, 0

scr_seq_0237_R34_0554:
	.short 14, 3
	.short 12, 1
	.short 254, 0

scr_seq_0237_R34_0560:
	.short 14, 3
	.short 12, 1
	.short 254, 0

scr_seq_0237_R34_056C:
	.short 14, 4
	.short 12, 1
	.short 254, 0

scr_seq_0237_R34_0578:
	.short 15, 3
	.short 32, 1
	.short 254, 0

scr_seq_0237_R34_0584:
	.short 15, 4
	.short 32, 1
	.short 254, 0

scr_seq_0237_R34_0590:
	.short 15, 3
	.short 254, 0

scr_seq_0237_R34_0598:
	.short 13, 1
	.short 15, 3
	.short 254, 0

scr_seq_0237_R34_05A4:
	.short 63, 1
	.short 15, 3
	.short 32, 1
	.short 254, 0

scr_seq_0237_R34_05B4:
	.short 63, 1
	.short 15, 4
	.short 32, 1
	.short 254, 0

scr_seq_0237_R34_05C4:
	.short 12, 1
	.short 69, 1
	.short 254, 0

scr_seq_0237_R34_05D0:
	.short 15, 1
	.short 12, 1
	.short 69, 1
	.short 254, 0

scr_seq_0237_R34_05E0:
	.short 12, 2
	.short 69, 1
	.short 254, 0
scr_seq_0237_R34_05EC:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 18
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0237_R34_05FF:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0237_R34_0727
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0237_R34_073B
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0237_R34_0678
	apply_movement 255, scr_seq_0237_R34_0750
	apply_movement 15, scr_seq_0237_R34_079C
	goto scr_seq_0237_R34_06C6

scr_seq_0237_R34_0678:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0237_R34_0693
	apply_movement 255, scr_seq_0237_R34_0768
	goto scr_seq_0237_R34_06C6

scr_seq_0237_R34_0693:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0237_R34_06B6
	apply_movement 255, scr_seq_0237_R34_0788
	apply_movement 15, scr_seq_0237_R34_079C
	goto scr_seq_0237_R34_06C6

scr_seq_0237_R34_06B6:
	apply_movement 255, scr_seq_0237_R34_0774
	apply_movement 15, scr_seq_0237_R34_079C
scr_seq_0237_R34_06C6:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0237_R34_06ED
	apply_movement 253, scr_seq_0237_R34_07A8
	wait_movement
scr_seq_0237_R34_06ED:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_615 9
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

scr_seq_0237_R34_0727:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0237_R34_073B:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0237_R34_074F:
	.byte 0x00

scr_seq_0237_R34_0750:
	.short 15, 1
	.short 12, 2
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0237_R34_0768:
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0237_R34_0774:
	.short 12, 1
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0237_R34_0788:
	.short 12, 1
	.short 15, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0237_R34_079C:
	.short 63, 1
	.short 32, 1
	.short 254, 0

scr_seq_0237_R34_07A8:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
scr_seq_0237_R34_07B8:
	scrcmd_609
	lockall
	scrcmd_357 16387, 6
	comparevartovalue VAR_TEMP_x4003, 1
	gotoif ne, scr_seq_0237_R34_07DB
	goto scr_seq_0237_R34_07E1

scr_seq_0237_R34_07D5:
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
scr_seq_0237_R34_07DB:
	goto scr_seq_0237_R34_087D

scr_seq_0237_R34_07E1:
	apply_movement 5, scr_seq_0237_R34_0918
	scrcmd_081 0
	play_bgm SEQ_GS_EYE_J_SHOUJO
	wait_movement
	apply_movement 255, scr_seq_0237_R34_0944
	wait_movement
	npc_msg 19
	closemsg
	trainer_battle TRAINER_ACE_TRAINER_F_IRENE, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0237_R34_0912
	apply_movement 5, scr_seq_0237_R34_094C
	wait_movement
	npc_msg 21
	closemsg
	apply_movement 6, scr_seq_0237_R34_0924
	scrcmd_081 0
	play_bgm SEQ_GS_EYE_J_SHOUJO
	wait_movement
	apply_movement 255, scr_seq_0237_R34_093C
	wait_movement
	npc_msg 24
	closemsg
	trainer_battle TRAINER_ACE_TRAINER_F_JENN, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0237_R34_0912
	apply_movement 6, scr_seq_0237_R34_0954
	wait_movement
	npc_msg 26
	waitbutton
	closemsg
	goto scr_seq_0237_R34_0908

scr_seq_0237_R34_087B:
	.byte 0x02, 0x00
scr_seq_0237_R34_087D:
	apply_movement 5, scr_seq_0237_R34_0918
	scrcmd_081 0
	play_bgm SEQ_GS_EYE_J_SHOUJO
	wait_movement
	apply_movement 255, scr_seq_0237_R34_0944
	wait_movement
	npc_msg 19
	closemsg
	apply_movement 6, scr_seq_0237_R34_0924
	play_bgm SEQ_GS_EYE_J_SHOUJO
	wait_movement
	apply_movement 255, scr_seq_0237_R34_093C
	wait_movement
	npc_msg 24
	closemsg
	trainer_battle TRAINER_ACE_TRAINER_F_JENN, 120, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0237_R34_0912
	apply_movement 5, scr_seq_0237_R34_094C
	wait_movement
	apply_movement 255, scr_seq_0237_R34_0944
	wait_movement
	npc_msg 21
	closemsg
	apply_movement 6, scr_seq_0237_R34_0954
	wait_movement
	apply_movement 255, scr_seq_0237_R34_093C
	wait_movement
	npc_msg 26
	waitbutton
	closemsg
scr_seq_0237_R34_0908:
	setvar VAR_UNK_4097, 1
	releaseall
	end

scr_seq_0237_R34_0912:
	white_out
	releaseall
	end


scr_seq_0237_R34_0918:
	.short 75, 1
	.short 14, 4
	.short 254, 0

scr_seq_0237_R34_0924:
	.short 75, 1
	.short 15, 4
	.short 254, 0

scr_seq_0237_R34_0930:
	.short 75, 1
	.short 12, 2
	.short 254, 0

scr_seq_0237_R34_093C:
	.short 2, 1
	.short 254, 0

scr_seq_0237_R34_0944:
	.short 3, 1
	.short 254, 0

scr_seq_0237_R34_094C:
	.short 50, 2
	.short 254, 0

scr_seq_0237_R34_0954:
	.short 51, 2
	.short 254, 0
scr_seq_0237_R34_095C:
	scrcmd_609
	lockall
	setvar VAR_TEMP_x4004, 777
	apply_movement 7, scr_seq_0237_R34_0930
	scrcmd_081 0
	play_bgm SEQ_GS_EYE_J_SHOUJO
	wait_movement
	npc_msg 28
	closemsg
	scrcmd_081 0
	trainer_battle TRAINER_ACE_TRAINER_F_KATE, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0237_R34_0912
	setvar VAR_UNK_4097, 2
scr_seq_0237_R34_09A0:
	npc_msg 30
	setvar VAR_SPECIAL_x8004, 271
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0237_R34_09EE
	callstd std_give_item_verbose
	setvar VAR_UNK_4097, 3
	npc_msg 32
	waitbutton
	closemsg
scr_seq_0237_R34_09D5:
	comparevartovalue VAR_TEMP_x4004, 777
	gotoif ne, scr_seq_0237_R34_09EA
	releaseall
	goto scr_seq_0237_R34_09EC

scr_seq_0237_R34_09EA:
	releaseall
scr_seq_0237_R34_09EC:
	end

scr_seq_0237_R34_09EE:
	callstd std_bag_is_full
	closemsg
	goto scr_seq_0237_R34_09D5

scr_seq_0237_R34_09FA:
	.byte 0x02, 0x00
scr_seq_0237_R34_09FC:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4097, 1
	gotoif ne, scr_seq_0237_R34_0A1A
	npc_msg 22
	goto scr_seq_0237_R34_0A1D

scr_seq_0237_R34_0A1A:
	npc_msg 23
scr_seq_0237_R34_0A1D:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0237_R34_0A25:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4097, 1
	gotoif ne, scr_seq_0237_R34_0A43
	npc_msg 26
	goto scr_seq_0237_R34_0A46

scr_seq_0237_R34_0A43:
	npc_msg 27
scr_seq_0237_R34_0A46:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0237_R34_0A4E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x4004, 555
	comparevartovalue VAR_UNK_4097, 2
	gotoif eq, scr_seq_0237_R34_09A0
	npc_msg 32
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0237_R34_0A74:
	scrcmd_056 3, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 34, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0237_R34_0A89:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 35, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0237_R34_0A9E:
	scrcmd_055 33, 1, 4, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end
	.balign 4, 0
