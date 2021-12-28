#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0225_R29_0026 ; 000
	scrdef scr_seq_0225_R29_01B2 ; 001
	scrdef scr_seq_0225_R29_0954 ; 002
	scrdef scr_seq_0225_R29_0064 ; 003
	scrdef scr_seq_0225_R29_09AD ; 004
	scrdef scr_seq_0225_R29_09C4 ; 005
	scrdef scr_seq_0225_R29_09DB ; 006
	scrdef scr_seq_0225_R29_09EE ; 007
	scrdef scr_seq_0225_R29_0A01 ; 008
	scrdef_end

scr_seq_0225_R29_0026:
	scrcmd_144 VAR_OBJ_1
	check_badge 0, VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, scr_seq_0225_R29_0043
	setflag FLAG_UNK_207
	end

scr_seq_0225_R29_0043:
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, scr_seq_0225_R29_005E
	clearflag FLAG_UNK_207
	goto scr_seq_0225_R29_0062

scr_seq_0225_R29_005E:
	setflag FLAG_UNK_207
scr_seq_0225_R29_0062:
	end

scr_seq_0225_R29_0064:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_lead_mon_index VAR_SPECIAL_x8002
	mon_has_ribbon VAR_SPECIAL_x800C, VAR_SPECIAL_x8002, RIBBON_SHOCK
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0225_R29_018A
	checkflag FLAG_GOT_SHOCK_RIBBON
	gotoif TRUE, scr_seq_0225_R29_019E
	comparevartovalue VAR_NUM_MET_WEEKDAY_SIBLINGS, 7
	gotoif eq, scr_seq_0225_R29_0138
	checkflag FLAG_GOT_TWISTEDSPOON_FROM_TUSCANY
	gotoif TRUE, scr_seq_0225_R29_011A
	get_weekday VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, scr_seq_0225_R29_00CB
	get_std_msg_naix 0, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 7
	goto scr_seq_0225_R29_0112

scr_seq_0225_R29_00CB:
	get_std_msg_naix 0, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 4
	setvar VAR_SPECIAL_x8004, 248
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0225_R29_012E
	callstd std_give_item_verbose
	setflag FLAG_GOT_TWISTEDSPOON_FROM_TUSCANY
	addvar VAR_NUM_MET_WEEKDAY_SIBLINGS, 1
	get_std_msg_naix 0, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 5
scr_seq_0225_R29_0112:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0225_R29_011A:
	get_std_msg_naix 0, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0225_R29_012E:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

scr_seq_0225_R29_0138:
	get_weekday VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, scr_seq_0225_R29_015B
	get_std_msg_naix 0, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 7
	goto scr_seq_0225_R29_0112

scr_seq_0225_R29_015B:
	get_std_msg_naix 0, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 32
	buffer_mon_species_name 0, VAR_SPECIAL_x8002
	msgbox_extern VAR_SPECIAL_x800C, 34
	give_ribbon VAR_SPECIAL_x8002, RIBBON_SHOCK
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	setflag FLAG_GOT_SHOCK_RIBBON
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0225_R29_018A:
	get_std_msg_naix 0, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 33
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0225_R29_019E:
	get_std_msg_naix 0, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 35
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0225_R29_01B2:
	scrcmd_609
	lockall
	scrcmd_076 183, 0
	scrcmd_077
	apply_movement 7, scr_seq_0225_R29_05C4
	wait_movement
	apply_movement 6, scr_seq_0225_R29_05D8
	wait_movement
	callstd std_play_friend_music
	gender_msgbox 17, 18
	closemsg
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	scrcmd_099 7
	comparevartovalue VAR_TEMP_x4001, 396
	gotoif ne, scr_seq_0225_R29_0209
	apply_movement 6, scr_seq_0225_R29_0660
	apply_movement 7, scr_seq_0225_R29_06D4
	goto scr_seq_0225_R29_02D5

scr_seq_0225_R29_0209:
	comparevartovalue VAR_TEMP_x4001, 397
	gotoif ne, scr_seq_0225_R29_022C
	apply_movement 6, scr_seq_0225_R29_067C
	apply_movement 7, scr_seq_0225_R29_06F4
	goto scr_seq_0225_R29_02D5

scr_seq_0225_R29_022C:
	comparevartovalue VAR_TEMP_x4001, 398
	gotoif ne, scr_seq_0225_R29_024F
	apply_movement 6, scr_seq_0225_R29_068C
	apply_movement 7, scr_seq_0225_R29_0708
	goto scr_seq_0225_R29_02D5

scr_seq_0225_R29_024F:
	comparevartovalue VAR_TEMP_x4001, 399
	gotoif ne, scr_seq_0225_R29_0272
	apply_movement 6, scr_seq_0225_R29_069C
	apply_movement 7, scr_seq_0225_R29_071C
	goto scr_seq_0225_R29_02D5

scr_seq_0225_R29_0272:
	comparevartovalue VAR_TEMP_x4001, 400
	gotoif ne, scr_seq_0225_R29_0295
	apply_movement 6, scr_seq_0225_R29_06AC
	apply_movement 7, scr_seq_0225_R29_0730
	goto scr_seq_0225_R29_02D5

scr_seq_0225_R29_0295:
	comparevartovalue VAR_TEMP_x4001, 401
	gotoif ne, scr_seq_0225_R29_02B8
	apply_movement 6, scr_seq_0225_R29_06B4
	apply_movement 7, scr_seq_0225_R29_073C
	goto scr_seq_0225_R29_02D5

scr_seq_0225_R29_02B8:
	comparevartovalue VAR_TEMP_x4001, 402
	gotoif ne, scr_seq_0225_R29_02D5
	apply_movement 6, scr_seq_0225_R29_06C4
	apply_movement 7, scr_seq_0225_R29_0750
scr_seq_0225_R29_02D5:
	wait_movement
	scrcmd_098 7
	buffer_players_name 0
	gender_msgbox 0, 1
	closemsg
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	get_player_gender VAR_TEMP_x4002
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	comparevartovalue VAR_TEMP_x4001, 396
	gotoif ne, scr_seq_0225_R29_033E
	apply_movement 6, scr_seq_0225_R29_0764
	apply_movement 7, scr_seq_0225_R29_07B4
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif ne, scr_seq_0225_R29_0330
	apply_movement 255, scr_seq_0225_R29_0820
	goto scr_seq_0225_R29_0338

scr_seq_0225_R29_0330:
	apply_movement 255, scr_seq_0225_R29_08A4
scr_seq_0225_R29_0338:
	goto scr_seq_0225_R29_04DC

scr_seq_0225_R29_033E:
	comparevartovalue VAR_TEMP_x4001, 397
	gotoif ne, scr_seq_0225_R29_0384
	apply_movement 6, scr_seq_0225_R29_0770
	apply_movement 7, scr_seq_0225_R29_07C4
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif ne, scr_seq_0225_R29_0376
	apply_movement 255, scr_seq_0225_R29_0834
	goto scr_seq_0225_R29_037E

scr_seq_0225_R29_0376:
	apply_movement 255, scr_seq_0225_R29_08B8
scr_seq_0225_R29_037E:
	goto scr_seq_0225_R29_04DC

scr_seq_0225_R29_0384:
	comparevartovalue VAR_TEMP_x4001, 398
	gotoif ne, scr_seq_0225_R29_03CA
	apply_movement 6, scr_seq_0225_R29_077C
	apply_movement 7, scr_seq_0225_R29_07D4
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif ne, scr_seq_0225_R29_03BC
	apply_movement 255, scr_seq_0225_R29_0848
	goto scr_seq_0225_R29_03C4

scr_seq_0225_R29_03BC:
	apply_movement 255, scr_seq_0225_R29_08CC
scr_seq_0225_R29_03C4:
	goto scr_seq_0225_R29_04DC

scr_seq_0225_R29_03CA:
	comparevartovalue VAR_TEMP_x4001, 399
	gotoif ne, scr_seq_0225_R29_0410
	apply_movement 6, scr_seq_0225_R29_0788
	apply_movement 7, scr_seq_0225_R29_07E4
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif ne, scr_seq_0225_R29_0402
	apply_movement 255, scr_seq_0225_R29_085C
	goto scr_seq_0225_R29_040A

scr_seq_0225_R29_0402:
	apply_movement 255, scr_seq_0225_R29_08E0
scr_seq_0225_R29_040A:
	goto scr_seq_0225_R29_04DC

scr_seq_0225_R29_0410:
	comparevartovalue VAR_TEMP_x4001, 400
	gotoif ne, scr_seq_0225_R29_0456
	apply_movement 6, scr_seq_0225_R29_0794
	apply_movement 7, scr_seq_0225_R29_07F4
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif ne, scr_seq_0225_R29_0448
	apply_movement 255, scr_seq_0225_R29_0870
	goto scr_seq_0225_R29_0450

scr_seq_0225_R29_0448:
	apply_movement 255, scr_seq_0225_R29_08F4
scr_seq_0225_R29_0450:
	goto scr_seq_0225_R29_04DC

scr_seq_0225_R29_0456:
	comparevartovalue VAR_TEMP_x4001, 401
	gotoif ne, scr_seq_0225_R29_049C
	apply_movement 6, scr_seq_0225_R29_07A0
	apply_movement 7, scr_seq_0225_R29_0804
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif ne, scr_seq_0225_R29_048E
	apply_movement 255, scr_seq_0225_R29_0884
	goto scr_seq_0225_R29_0496

scr_seq_0225_R29_048E:
	apply_movement 255, scr_seq_0225_R29_0908
scr_seq_0225_R29_0496:
	goto scr_seq_0225_R29_04DC

scr_seq_0225_R29_049C:
	comparevartovalue VAR_TEMP_x4001, 402
	gotoif ne, scr_seq_0225_R29_04DC
	apply_movement 6, scr_seq_0225_R29_07AC
	apply_movement 7, scr_seq_0225_R29_0814
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif ne, scr_seq_0225_R29_04D4
	apply_movement 255, scr_seq_0225_R29_0898
	goto scr_seq_0225_R29_04DC

scr_seq_0225_R29_04D4:
	apply_movement 255, scr_seq_0225_R29_091C
scr_seq_0225_R29_04DC:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	comparevartovalue VAR_TEMP_x4002, 0
	callif eq, scr_seq_0225_R29_0559
	wait 10, VAR_SPECIAL_x800C
	scrcmd_251
	apply_movement 6, scr_seq_0225_R29_064C
	apply_movement 7, scr_seq_0225_R29_0654
	wait_movement
	gender_msgbox 3, 4
	setvar VAR_SPECIAL_x8004, 4
	setvar VAR_SPECIAL_x8005, 5
	callstd std_give_item_verbose
	gender_msgbox 7, 8
	closemsg
	apply_movement 6, scr_seq_0225_R29_0928
	apply_movement 7, scr_seq_0225_R29_093C
	wait_movement
	hide_person 6
	hide_person 7
	setflag FLAG_UNK_1A4
	setflag FLAG_UNK_1A5
	setvar VAR_UNK_408B, 0
	setflag FLAG_UNK_09A
	releaseall
	end

scr_seq_0225_R29_0559:
	apply_movement 6, scr_seq_0225_R29_05BC
	wait_movement
	apply_movement 6, scr_seq_0225_R29_05E4
	apply_movement 7, scr_seq_0225_R29_0600
	wait_movement
	apply_movement 6, scr_seq_0225_R29_061C
	apply_movement 7, scr_seq_0225_R29_0624
	wait_movement
	npc_msg 2
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 6, scr_seq_0225_R29_062C
	apply_movement 7, scr_seq_0225_R29_0634
	apply_movement 255, scr_seq_0225_R29_0640
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	return


scr_seq_0225_R29_05BC:
	.short 75, 1
	.short 254, 0

scr_seq_0225_R29_05C4:
	.short 17, 1
	.short 19, 2
	.short 16, 1
	.short 50, 2
	.short 254, 0

scr_seq_0225_R29_05D8:
	.short 35, 1
	.short 75, 1
	.short 254, 0

scr_seq_0225_R29_05E4:
	.short 50, 3
	.short 65, 1
	.short 50, 3
	.short 63, 3
	.short 50, 3
	.short 63, 3
	.short 254, 0

scr_seq_0225_R29_0600:
	.short 63, 3
	.short 58, 1
	.short 63, 3
	.short 50, 3
	.short 63, 3
	.short 50, 3
	.short 254, 0

scr_seq_0225_R29_061C:
	.short 15, 3
	.short 254, 0

scr_seq_0225_R29_0624:
	.short 15, 3
	.short 254, 0

scr_seq_0225_R29_062C:
	.short 14, 3
	.short 254, 0

scr_seq_0225_R29_0634:
	.short 15, 1
	.short 14, 2
	.short 254, 0

scr_seq_0225_R29_0640:
	.short 63, 1
	.short 14, 2
	.short 254, 0

scr_seq_0225_R29_064C:
	.short 15, 1
	.short 254, 0

scr_seq_0225_R29_0654:
	.short 14, 1
	.short 35, 1
	.short 254, 0

scr_seq_0225_R29_0660:
	.short 16, 4
	.short 19, 2
	.short 17, 2
	.short 18, 2
	.short 16, 2
	.short 19, 4
	.short 254, 0

scr_seq_0225_R29_067C:
	.short 15, 2
	.short 12, 3
	.short 15, 2
	.short 254, 0

scr_seq_0225_R29_068C:
	.short 15, 2
	.short 12, 2
	.short 15, 2
	.short 254, 0

scr_seq_0225_R29_069C:
	.short 15, 2
	.short 12, 1
	.short 15, 2
	.short 254, 0

scr_seq_0225_R29_06AC:
	.short 15, 4
	.short 254, 0

scr_seq_0225_R29_06B4:
	.short 15, 2
	.short 13, 1
	.short 15, 2
	.short 254, 0

scr_seq_0225_R29_06C4:
	.short 15, 2
	.short 13, 2
	.short 15, 2
	.short 254, 0

scr_seq_0225_R29_06D4:
	.short 18, 1
	.short 16, 4
	.short 19, 2
	.short 17, 2
	.short 18, 2
	.short 16, 2
	.short 19, 3
	.short 254, 0

scr_seq_0225_R29_06F4:
	.short 14, 1
	.short 15, 2
	.short 12, 3
	.short 15, 1
	.short 254, 0

scr_seq_0225_R29_0708:
	.short 14, 1
	.short 15, 2
	.short 12, 2
	.short 15, 1
	.short 254, 0

scr_seq_0225_R29_071C:
	.short 14, 1
	.short 15, 2
	.short 12, 1
	.short 15, 1
	.short 254, 0

scr_seq_0225_R29_0730:
	.short 14, 1
	.short 15, 3
	.short 254, 0

scr_seq_0225_R29_073C:
	.short 14, 1
	.short 15, 2
	.short 13, 1
	.short 15, 1
	.short 254, 0

scr_seq_0225_R29_0750:
	.short 14, 1
	.short 15, 2
	.short 13, 2
	.short 15, 1
	.short 254, 0

scr_seq_0225_R29_0764:
	.short 13, 6
	.short 14, 9
	.short 254, 0

scr_seq_0225_R29_0770:
	.short 13, 5
	.short 14, 9
	.short 254, 0

scr_seq_0225_R29_077C:
	.short 13, 4
	.short 14, 9
	.short 254, 0

scr_seq_0225_R29_0788:
	.short 13, 3
	.short 14, 9
	.short 254, 0

scr_seq_0225_R29_0794:
	.short 13, 2
	.short 14, 9
	.short 254, 0

scr_seq_0225_R29_07A0:
	.short 13, 1
	.short 14, 9
	.short 254, 0

scr_seq_0225_R29_07AC:
	.short 14, 9
	.short 254, 0

scr_seq_0225_R29_07B4:
	.short 15, 1
	.short 13, 6
	.short 14, 8
	.short 254, 0

scr_seq_0225_R29_07C4:
	.short 15, 1
	.short 13, 5
	.short 14, 8
	.short 254, 0

scr_seq_0225_R29_07D4:
	.short 15, 1
	.short 13, 4
	.short 14, 8
	.short 254, 0

scr_seq_0225_R29_07E4:
	.short 15, 1
	.short 13, 3
	.short 14, 8
	.short 254, 0

scr_seq_0225_R29_07F4:
	.short 15, 1
	.short 13, 2
	.short 14, 8
	.short 254, 0

scr_seq_0225_R29_0804:
	.short 15, 1
	.short 13, 1
	.short 14, 8
	.short 254, 0

scr_seq_0225_R29_0814:
	.short 15, 1
	.short 14, 8
	.short 254, 0

scr_seq_0225_R29_0820:
	.short 63, 1
	.short 14, 1
	.short 13, 6
	.short 14, 5
	.short 254, 0

scr_seq_0225_R29_0834:
	.short 63, 1
	.short 14, 1
	.short 13, 5
	.short 14, 5
	.short 254, 0

scr_seq_0225_R29_0848:
	.short 63, 1
	.short 14, 1
	.short 13, 4
	.short 14, 5
	.short 254, 0

scr_seq_0225_R29_085C:
	.short 63, 1
	.short 14, 1
	.short 13, 3
	.short 14, 5
	.short 254, 0

scr_seq_0225_R29_0870:
	.short 63, 1
	.short 14, 1
	.short 13, 2
	.short 14, 5
	.short 254, 0

scr_seq_0225_R29_0884:
	.short 63, 1
	.short 14, 1
	.short 13, 1
	.short 14, 5
	.short 254, 0

scr_seq_0225_R29_0898:
	.short 63, 1
	.short 14, 6
	.short 254, 0

scr_seq_0225_R29_08A4:
	.short 63, 1
	.short 14, 1
	.short 13, 6
	.short 14, 7
	.short 254, 0

scr_seq_0225_R29_08B8:
	.short 63, 1
	.short 14, 1
	.short 13, 5
	.short 14, 7
	.short 254, 0

scr_seq_0225_R29_08CC:
	.short 63, 1
	.short 14, 1
	.short 13, 4
	.short 14, 7
	.short 254, 0

scr_seq_0225_R29_08E0:
	.short 63, 1
	.short 14, 1
	.short 13, 3
	.short 14, 7
	.short 254, 0

scr_seq_0225_R29_08F4:
	.short 63, 1
	.short 14, 1
	.short 13, 2
	.short 14, 7
	.short 254, 0

scr_seq_0225_R29_0908:
	.short 63, 1
	.short 14, 1
	.short 13, 1
	.short 14, 7
	.short 254, 0

scr_seq_0225_R29_091C:
	.short 63, 1
	.short 14, 8
	.short 254, 0

scr_seq_0225_R29_0928:
	.short 13, 2
	.short 14, 4
	.short 13, 4
	.short 14, 3
	.short 254, 0

scr_seq_0225_R29_093C:
	.short 15, 1
	.short 13, 2
	.short 14, 4
	.short 13, 4
	.short 14, 2
	.short 254, 0
scr_seq_0225_R29_0954:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_379 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0225_R29_0976
	npc_msg 12
	goto scr_seq_0225_R29_09A5

scr_seq_0225_R29_0976:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0225_R29_098C
	npc_msg 13
	goto scr_seq_0225_R29_09A5

scr_seq_0225_R29_098C:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_0225_R29_09A2
	npc_msg 13
	goto scr_seq_0225_R29_09A5

scr_seq_0225_R29_09A2:
	npc_msg 14
scr_seq_0225_R29_09A5:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0225_R29_09AD:
	scrcmd_055 16, 1, 1, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0225_R29_09C4:
	scrcmd_055 15, 1, 2, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0225_R29_09DB:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0225_R29_09EE:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 11
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0225_R29_0A01:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 10
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
