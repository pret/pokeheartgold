#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0850_T21_0089 ; 000
	scrdef scr_seq_0850_T21_008B ; 001
	scrdef scr_seq_0850_T21_0590 ; 002
	scrdef scr_seq_0850_T21_06B4 ; 003
	scrdef scr_seq_0850_T21_08C4 ; 004
	scrdef scr_seq_0850_T21_0ADC ; 005
	scrdef scr_seq_0850_T21_0AF1 ; 006
	scrdef scr_seq_0850_T21_0B08 ; 007
	scrdef scr_seq_0850_T21_0B1B ; 008
	scrdef scr_seq_0850_T21_0919 ; 009
	scrdef scr_seq_0850_T21_002E ; 010
	scrdef_end

scr_seq_0850_T21_002E:
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_0850_T21_003F
	clearflag FLAG_UNK_189
	end

scr_seq_0850_T21_003F:
	check_badge 2, VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, scr_seq_0850_T21_007D
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, scr_seq_0850_T21_0083
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif eq, scr_seq_0850_T21_0083
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif eq, scr_seq_0850_T21_0083
scr_seq_0850_T21_007D:
	setflag FLAG_UNK_27E
	end

scr_seq_0850_T21_0083:
	clearflag FLAG_UNK_27E
	end

scr_seq_0850_T21_0089:
	end

scr_seq_0850_T21_008B:
	scrcmd_098 0
	apply_movement 0, scr_seq_0850_T21_0350
	wait_movement
	callstd std_play_follow_music
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 397
	gotoif ne, scr_seq_0850_T21_00BE
	apply_movement 0, scr_seq_0850_T21_0358
	goto scr_seq_0850_T21_0109

scr_seq_0850_T21_00BE:
	comparevartovalue VAR_TEMP_x4001, 398
	gotoif ne, scr_seq_0850_T21_00D9
	apply_movement 0, scr_seq_0850_T21_0360
	goto scr_seq_0850_T21_0109

scr_seq_0850_T21_00D9:
	comparevartovalue VAR_TEMP_x4001, 399
	gotoif ne, scr_seq_0850_T21_00F4
	apply_movement 0, scr_seq_0850_T21_0368
	goto scr_seq_0850_T21_0109

scr_seq_0850_T21_00F4:
	comparevartovalue VAR_TEMP_x4001, 400
	gotoif ne, scr_seq_0850_T21_0109
	apply_movement 0, scr_seq_0850_T21_0370
scr_seq_0850_T21_0109:
	apply_movement 255, scr_seq_0850_T21_0378
	wait_movement
	npc_msg 0
	closemsg
	buffer_players_name 0
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 397
	gotoif ne, scr_seq_0850_T21_013C
	apply_movement 0, scr_seq_0850_T21_0390
	goto scr_seq_0850_T21_0187

scr_seq_0850_T21_013C:
	comparevartovalue VAR_TEMP_x4001, 398
	gotoif ne, scr_seq_0850_T21_0157
	apply_movement 0, scr_seq_0850_T21_03AC
	goto scr_seq_0850_T21_0187

scr_seq_0850_T21_0157:
	comparevartovalue VAR_TEMP_x4001, 399
	gotoif ne, scr_seq_0850_T21_0172
	apply_movement 0, scr_seq_0850_T21_03D0
	goto scr_seq_0850_T21_0187

scr_seq_0850_T21_0172:
	comparevartovalue VAR_TEMP_x4001, 400
	gotoif ne, scr_seq_0850_T21_0187
	apply_movement 0, scr_seq_0850_T21_03F4
scr_seq_0850_T21_0187:
	wait_movement
	apply_movement 255, scr_seq_0850_T21_0380
	wait_movement
	npc_msg 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	comparevartovalue VAR_TEMP_x4001, 397
	gotoif ne, scr_seq_0850_T21_01C5
	apply_movement 0, scr_seq_0850_T21_0418
	apply_movement 255, scr_seq_0850_T21_0478
	goto scr_seq_0850_T21_0228

scr_seq_0850_T21_01C5:
	comparevartovalue VAR_TEMP_x4001, 398
	gotoif ne, scr_seq_0850_T21_01E8
	apply_movement 0, scr_seq_0850_T21_0430
	apply_movement 255, scr_seq_0850_T21_0488
	goto scr_seq_0850_T21_0228

scr_seq_0850_T21_01E8:
	comparevartovalue VAR_TEMP_x4001, 399
	gotoif ne, scr_seq_0850_T21_020B
	apply_movement 0, scr_seq_0850_T21_0448
	apply_movement 255, scr_seq_0850_T21_0498
	goto scr_seq_0850_T21_0228

scr_seq_0850_T21_020B:
	comparevartovalue VAR_TEMP_x4001, 400
	gotoif ne, scr_seq_0850_T21_0228
	apply_movement 0, scr_seq_0850_T21_0460
	apply_movement 255, scr_seq_0850_T21_04A8
scr_seq_0850_T21_0228:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	npc_msg 2
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 0, scr_seq_0850_T21_04B8
	apply_movement 255, scr_seq_0850_T21_04CC
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	npc_msg 3
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 0, scr_seq_0850_T21_04E0
	apply_movement 255, scr_seq_0850_T21_04FC
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	npc_msg 4
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 0, scr_seq_0850_T21_050C
	apply_movement 255, scr_seq_0850_T21_052C
	wait_movement
	play_se SEQ_SE_GS_N_UMIBE
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	npc_msg 5
	closemsg
	scrcmd_074 2133
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 0, scr_seq_0850_T21_054C
	apply_movement 255, scr_seq_0850_T21_0568
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	npc_msg 6
	give_running_shoes
	buffer_players_name 0
	npc_msg 7
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	npc_msg 8
	closemsg
	apply_movement 0, scr_seq_0850_T21_0580
	wait_movement
	scrcmd_307 17, 12, 14, 17, 77
	scrcmd_310 77
	scrcmd_308 77
	apply_movement 0, scr_seq_0850_T21_0580
	wait_movement
	scrcmd_099 0
	scrcmd_099 253
	play_se SEQ_SE_DP_KAIDAN2
	hide_person 0
	wait_se SEQ_SE_DP_KAIDAN2
	setflag FLAG_HIDE_CHERRYGROVE_GUIDE_GENT
	scrcmd_311 77
	scrcmd_308 77
	scrcmd_309 77
	callstd std_fade_end_mom_music
	setvar VAR_SCENE_CHERRYGROVE_CITY_OW, 1
	end


scr_seq_0850_T21_0350:
	.short 75, 1
	.short 254, 0

scr_seq_0850_T21_0358:
	.short 62, 1
	.short 254, 0

scr_seq_0850_T21_0360:
	.short 13, 1
	.short 254, 0

scr_seq_0850_T21_0368:
	.short 13, 2
	.short 254, 0

scr_seq_0850_T21_0370:
	.short 13, 3
	.short 254, 0

scr_seq_0850_T21_0378:
	.short 32, 1
	.short 254, 0

scr_seq_0850_T21_0380:
	.short 34, 1
	.short 254, 0

scr_seq_0850_T21_0388:
	.short 35, 1
	.short 254, 0

scr_seq_0850_T21_0390:
	.short 18, 2
	.short 16, 2
	.short 75, 1
	.short 37, 1
	.short 17, 3
	.short 19, 1
	.short 254, 0

scr_seq_0850_T21_03AC:
	.short 18, 2
	.short 16, 3
	.short 63, 1
	.short 37, 1
	.short 66, 1
	.short 75, 1
	.short 17, 4
	.short 19, 1
	.short 254, 0

scr_seq_0850_T21_03D0:
	.short 18, 2
	.short 16, 4
	.short 63, 1
	.short 37, 1
	.short 66, 1
	.short 75, 1
	.short 17, 5
	.short 19, 1
	.short 254, 0

scr_seq_0850_T21_03F4:
	.short 18, 2
	.short 16, 4
	.short 63, 1
	.short 37, 1
	.short 66, 1
	.short 75, 1
	.short 17, 5
	.short 19, 1
	.short 254, 0

scr_seq_0850_T21_0418:
	.short 18, 1
	.short 16, 3
	.short 37, 1
	.short 62, 4
	.short 36, 1
	.short 254, 0

scr_seq_0850_T21_0430:
	.short 18, 1
	.short 16, 4
	.short 37, 1
	.short 62, 5
	.short 36, 1
	.short 254, 0

scr_seq_0850_T21_0448:
	.short 18, 1
	.short 16, 5
	.short 37, 1
	.short 62, 6
	.short 36, 1
	.short 254, 0

scr_seq_0850_T21_0460:
	.short 18, 1
	.short 16, 6
	.short 37, 1
	.short 62, 9
	.short 36, 1
	.short 254, 0

scr_seq_0850_T21_0478:
	.short 14, 2
	.short 12, 2
	.short 63, 1
	.short 254, 0

scr_seq_0850_T21_0488:
	.short 14, 2
	.short 12, 3
	.short 63, 1
	.short 254, 0

scr_seq_0850_T21_0498:
	.short 14, 2
	.short 12, 4
	.short 63, 1
	.short 254, 0

scr_seq_0850_T21_04A8:
	.short 14, 2
	.short 12, 5
	.short 63, 1
	.short 254, 0

scr_seq_0850_T21_04B8:
	.short 18, 9
	.short 39, 1
	.short 62, 7
	.short 36, 1
	.short 254, 0

scr_seq_0850_T21_04CC:
	.short 12, 1
	.short 14, 8
	.short 63, 2
	.short 32, 1
	.short 254, 0

scr_seq_0850_T21_04E0:
	.short 18, 6
	.short 16, 2
	.short 18, 1
	.short 39, 1
	.short 62, 7
	.short 36, 1
	.short 254, 0

scr_seq_0850_T21_04FC:
	.short 14, 7
	.short 12, 2
	.short 63, 1
	.short 254, 0

scr_seq_0850_T21_050C:
	.short 17, 2
	.short 18, 6
	.short 17, 8
	.short 14, 6
	.short 36, 1
	.short 62, 17
	.short 38, 1
	.short 254, 0

scr_seq_0850_T21_052C:
	.short 14, 1
	.short 13, 2
	.short 14, 6
	.short 13, 7
	.short 14, 6
	.short 63, 2
	.short 34, 1
	.short 254, 0

scr_seq_0850_T21_054C:
	.short 19, 16
	.short 38, 1
	.short 62, 6
	.short 17, 2
	.short 19, 6
	.short 38, 1
	.short 254, 0

scr_seq_0850_T21_0568:
	.short 62, 1
	.short 13, 1
	.short 15, 16
	.short 13, 2
	.short 15, 5
	.short 254, 0

scr_seq_0850_T21_0580:
	.short 12, 2
	.short 254, 0
	.byte 0x0c, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00
scr_seq_0850_T21_0590:
	scrcmd_609
	lockall
	apply_movement 255, scr_seq_0850_T21_0680
	wait_movement
	callstd std_play_follow_music
	clearflag FLAG_HIDE_CHERRYGROVE_GUIDE_GENT
	show_person 0
	scrcmd_098 0
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	move_person 0, VAR_TEMP_x4000, 1, 394, 0
	comparevartovalue VAR_TEMP_x4000, 549
	gotoif ne, scr_seq_0850_T21_05DB
	apply_movement 0, scr_seq_0850_T21_068C
	goto scr_seq_0850_T21_05FE

scr_seq_0850_T21_05DB:
	comparevartovalue VAR_TEMP_x4000, 550
	gotoif ne, scr_seq_0850_T21_05F6
	apply_movement 0, scr_seq_0850_T21_068C
	goto scr_seq_0850_T21_05FE

scr_seq_0850_T21_05F6:
	apply_movement 0, scr_seq_0850_T21_069C
scr_seq_0850_T21_05FE:
	wait_movement
	comparevartovalue VAR_TEMP_x4000, 549
	gotoif ne, scr_seq_0850_T21_061B
	apply_movement 255, scr_seq_0850_T21_0380
	goto scr_seq_0850_T21_063E

scr_seq_0850_T21_061B:
	comparevartovalue VAR_TEMP_x4000, 550
	gotoif ne, scr_seq_0850_T21_0636
	apply_movement 255, scr_seq_0850_T21_0380
	goto scr_seq_0850_T21_063E

scr_seq_0850_T21_0636:
	apply_movement 255, scr_seq_0850_T21_0388
scr_seq_0850_T21_063E:
	wait_movement
	npc_msg 9
	buffer_players_name 0
	npc_msg 10
	play_fanfare SEQ_ME_KEYITEM
	wait_fanfare
	npc_msg 11
	npc_msg 12
	closemsg
	apply_movement 0, scr_seq_0850_T21_06AC
	wait_movement
	callstd std_fade_end_mom_music
	scrcmd_099 0
	hide_person 0
	setflag FLAG_HIDE_CHERRYGROVE_GUIDE_GENT
	register_pokegear_card 1
	releaseall
	setvar VAR_SCENE_CHERRYGROVE_CITY_OW, 2
	end

scr_seq_0850_T21_067E:
	.byte 0x00, 0x00

scr_seq_0850_T21_0680:
	.short 75, 1
	.short 37, 1
	.short 254, 0

scr_seq_0850_T21_068C:
	.short 18, 1
	.short 16, 9
	.short 35, 1
	.short 254, 0

scr_seq_0850_T21_069C:
	.short 19, 1
	.short 16, 9
	.short 34, 1
	.short 254, 0

scr_seq_0850_T21_06AC:
	.short 17, 9
	.short 254, 0
scr_seq_0850_T21_06B4:
	scrcmd_609
	lockall
	fade_out_bgm 0, 3
	apply_movement 255, scr_seq_0850_T21_0350
	wait_movement
	callstd std_play_rival_intro_music
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	move_person 4, 583, 0, VAR_TEMP_x4001, 2
	apply_movement 4, scr_seq_0850_T21_0808
	wait_movement
	npc_msg 13
	closemsg
	get_starter_choice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 152
	gotoif ne, scr_seq_0850_T21_070C
	trainer_battle TRAINER_PASSERBY_BOY_2, 0, 1, 0
	goto scr_seq_0850_T21_072F

scr_seq_0850_T21_070C:
	comparevartovalue VAR_SPECIAL_x800C, 155
	gotoif ne, scr_seq_0850_T21_0727
	trainer_battle TRAINER_PASSERBY_BOY_3, 0, 1, 0
	goto scr_seq_0850_T21_072F

scr_seq_0850_T21_0727:
	trainer_battle TRAINER_PASSERBY_BOY, 0, 1, 0
scr_seq_0850_T21_072F:
	check_battle_won VAR_SPECIAL_x800C
	callstd std_play_rival_outro_music
	npc_msg 14
	closemsg
	play_se SEQ_SE_DP_WALL_HIT2
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 56
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	comparevartovalue VAR_SPECIAL_x8005, 398
	gotoif ne, scr_seq_0850_T21_076B
	apply_movement 255, scr_seq_0850_T21_0890
	goto scr_seq_0850_T21_0773

scr_seq_0850_T21_076B:
	apply_movement 255, scr_seq_0850_T21_08A4
scr_seq_0850_T21_0773:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	comparevartovalue VAR_SPECIAL_x8005, 398
	gotoif ne, scr_seq_0850_T21_079A
	apply_movement 4, scr_seq_0850_T21_0810
	goto scr_seq_0850_T21_07A2

scr_seq_0850_T21_079A:
	apply_movement 4, scr_seq_0850_T21_0844
scr_seq_0850_T21_07A2:
	wait_movement
	npc_msg 15
	closemsg
	get_person_coords 4, VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	comparevartovalue VAR_SPECIAL_x8005, 401
	gotoif ne, scr_seq_0850_T21_07D4
	apply_movement 4, scr_seq_0850_T21_0880
	apply_movement 255, scr_seq_0850_T21_08B8
	goto scr_seq_0850_T21_07E4

scr_seq_0850_T21_07D4:
	apply_movement 4, scr_seq_0850_T21_0878
	apply_movement 255, scr_seq_0850_T21_08B8
scr_seq_0850_T21_07E4:
	wait_movement
	hide_person 4
	setflag FLAG_HIDE_CHERRYGROVE_RIVAL
	callstd 2071
	releaseall
	setvar VAR_SCENE_CHERRYGROVE_CITY_OW, 4
	setflag FLAG_MET_PASSERBY_BOY
	end

scr_seq_0850_T21_0800:
	.byte 0xdb, 0x00, 0x61, 0x00, 0x02, 0x00, 0x00, 0x00

scr_seq_0850_T21_0808:
	.short 14, 7
	.short 254, 0

scr_seq_0850_T21_0810:
	.short 14, 6
	.short 75, 1
	.short 37, 1
	.short 63, 1
	.short 36, 1
	.short 63, 1
	.short 37, 1
	.short 63, 1
	.short 35, 1
	.short 63, 1
	.short 15, 5
	.short 33, 1
	.short 254, 0

scr_seq_0850_T21_0844:
	.short 14, 6
	.short 75, 1
	.short 37, 1
	.short 63, 1
	.short 36, 1
	.short 63, 1
	.short 37, 1
	.short 63, 1
	.short 35, 1
	.short 63, 1
	.short 15, 5
	.short 32, 1
	.short 254, 0

scr_seq_0850_T21_0878:
	.short 14, 11
	.short 254, 0

scr_seq_0850_T21_0880:
	.short 14, 5
	.short 12, 1
	.short 14, 6
	.short 254, 0

scr_seq_0850_T21_0890:
	.short 0, 1
	.short 71, 1
	.short 17, 1
	.short 72, 1
	.short 254, 0

scr_seq_0850_T21_08A4:
	.short 1, 1
	.short 71, 1
	.short 16, 1
	.short 72, 1
	.short 254, 0

scr_seq_0850_T21_08B8:
	.short 63, 2
	.short 34, 1
	.short 254, 0
scr_seq_0850_T21_08C4:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0F3
	gotoif TRUE, scr_seq_0850_T21_0903
	npc_msg 20
	setvar VAR_SPECIAL_x8004, 243
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0850_T21_090E
	callstd std_give_item_verbose
	setflag FLAG_UNK_0F3
scr_seq_0850_T21_0903:
	npc_msg 21
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0850_T21_090E:
	npc_msg 22
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0850_T21_0919:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0850_T21_0A41
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0850_T21_0A55
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0850_T21_0992
	apply_movement 255, scr_seq_0850_T21_0A6C
	apply_movement 5, scr_seq_0850_T21_0AC0
	goto scr_seq_0850_T21_09E0

scr_seq_0850_T21_0992:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0850_T21_09AD
	apply_movement 255, scr_seq_0850_T21_0A84
	goto scr_seq_0850_T21_09E0

scr_seq_0850_T21_09AD:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0850_T21_09D0
	apply_movement 255, scr_seq_0850_T21_0AA4
	apply_movement 5, scr_seq_0850_T21_0AC0
	goto scr_seq_0850_T21_09E0

scr_seq_0850_T21_09D0:
	apply_movement 255, scr_seq_0850_T21_0A90
	apply_movement 5, scr_seq_0850_T21_0AC0
scr_seq_0850_T21_09E0:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0850_T21_0A07
	apply_movement 253, scr_seq_0850_T21_0ACC
	wait_movement
scr_seq_0850_T21_0A07:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_615 1
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

scr_seq_0850_T21_0A41:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0850_T21_0A55:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0850_T21_0A69:
	.byte 0x00, 0x00, 0x00

scr_seq_0850_T21_0A6C:
	.short 15, 1
	.short 12, 2
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0850_T21_0A84:
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0850_T21_0A90:
	.short 12, 1
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0850_T21_0AA4:
	.short 13, 1
	.short 15, 2
	.short 12, 2
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0850_T21_0AC0:
	.short 63, 1
	.short 32, 1
	.short 254, 0

scr_seq_0850_T21_0ACC:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
scr_seq_0850_T21_0ADC:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 24, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0850_T21_0AF1:
	scrcmd_055 23, 0, 12, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0850_T21_0B08:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 19
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0850_T21_0B1B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 17
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
