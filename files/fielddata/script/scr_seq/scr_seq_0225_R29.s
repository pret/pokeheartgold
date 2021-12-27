#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0225_0026 ; 000
	scrdef scr_seq_0225_01B2 ; 001
	scrdef scr_seq_0225_0954 ; 002
	scrdef scr_seq_0225_0064 ; 003
	scrdef scr_seq_0225_09AD ; 004
	scrdef scr_seq_0225_09C4 ; 005
	scrdef scr_seq_0225_09DB ; 006
	scrdef scr_seq_0225_09EE ; 007
	scrdef scr_seq_0225_0A01 ; 008
	scrdef_end

scr_seq_0225_0026:
	scrcmd_144 16417
	scrcmd_294 0, VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, scr_seq_0225_0043
	setflag FLAG_UNK_207
	end

scr_seq_0225_0043:
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, scr_seq_0225_005E
	clearflag FLAG_UNK_207
	goto scr_seq_0225_0062

scr_seq_0225_005E:
	setflag FLAG_UNK_207
scr_seq_0225_0062:
	end

scr_seq_0225_0064:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_lead_mon_index VAR_SPECIAL_x8002
	scrcmd_480 32780, 32770, 60
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0225_018A
	checkflag FLAG_UNK_ABC
	gotoif TRUE, scr_seq_0225_019E
	comparevartovalue VAR_UNK_4094, 7
	gotoif eq, scr_seq_0225_0138
	checkflag FLAG_UNK_0D8
	gotoif TRUE, scr_seq_0225_011A
	scrcmd_484 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, scr_seq_0225_00CB
	scrcmd_438 0, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 7
	goto scr_seq_0225_0112

scr_seq_0225_00CB:
	scrcmd_438 0, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 4
	setvar VAR_SPECIAL_x8004, 248
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0225_012E
	callstd 2033
	setflag FLAG_UNK_0D8
	addvar VAR_UNK_4094, 1
	scrcmd_438 0, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 5
scr_seq_0225_0112:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0225_011A:
	scrcmd_438 0, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0225_012E:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_0225_0138:
	scrcmd_484 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, scr_seq_0225_015B
	scrcmd_438 0, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 7
	goto scr_seq_0225_0112

scr_seq_0225_015B:
	scrcmd_438 0, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 32
	scrcmd_193 0, 32770
	scrcmd_440 VAR_SPECIAL_x800C, 34
	scrcmd_481 32770, 60
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	setflag FLAG_UNK_ABC
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0225_018A:
	scrcmd_438 0, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 33
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0225_019E:
	scrcmd_438 0, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 35
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0225_01B2:
	scrcmd_609
	lockall
	scrcmd_076 183, 0
	scrcmd_077
	apply_movement 7, scr_seq_0225_05C4
	wait_movement
	apply_movement 6, scr_seq_0225_05D8
	wait_movement
	callstd 2029
	gender_msgbox 17, 18
	closemsg
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	scrcmd_099 7
	comparevartovalue VAR_TEMP_x4001, 396
	gotoif ne, scr_seq_0225_0209
	apply_movement 6, scr_seq_0225_0660
	apply_movement 7, scr_seq_0225_06D4
	goto scr_seq_0225_02D5

scr_seq_0225_0209:
	comparevartovalue VAR_TEMP_x4001, 397
	gotoif ne, scr_seq_0225_022C
	apply_movement 6, scr_seq_0225_067C
	apply_movement 7, scr_seq_0225_06F4
	goto scr_seq_0225_02D5

scr_seq_0225_022C:
	comparevartovalue VAR_TEMP_x4001, 398
	gotoif ne, scr_seq_0225_024F
	apply_movement 6, scr_seq_0225_068C
	apply_movement 7, scr_seq_0225_0708
	goto scr_seq_0225_02D5

scr_seq_0225_024F:
	comparevartovalue VAR_TEMP_x4001, 399
	gotoif ne, scr_seq_0225_0272
	apply_movement 6, scr_seq_0225_069C
	apply_movement 7, scr_seq_0225_071C
	goto scr_seq_0225_02D5

scr_seq_0225_0272:
	comparevartovalue VAR_TEMP_x4001, 400
	gotoif ne, scr_seq_0225_0295
	apply_movement 6, scr_seq_0225_06AC
	apply_movement 7, scr_seq_0225_0730
	goto scr_seq_0225_02D5

scr_seq_0225_0295:
	comparevartovalue VAR_TEMP_x4001, 401
	gotoif ne, scr_seq_0225_02B8
	apply_movement 6, scr_seq_0225_06B4
	apply_movement 7, scr_seq_0225_073C
	goto scr_seq_0225_02D5

scr_seq_0225_02B8:
	comparevartovalue VAR_TEMP_x4001, 402
	gotoif ne, scr_seq_0225_02D5
	apply_movement 6, scr_seq_0225_06C4
	apply_movement 7, scr_seq_0225_0750
scr_seq_0225_02D5:
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
	gotoif ne, scr_seq_0225_033E
	apply_movement 6, scr_seq_0225_0764
	apply_movement 7, scr_seq_0225_07B4
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif ne, scr_seq_0225_0330
	apply_movement 255, scr_seq_0225_0820
	goto scr_seq_0225_0338

scr_seq_0225_0330:
	apply_movement 255, scr_seq_0225_08A4
scr_seq_0225_0338:
	goto scr_seq_0225_04DC

scr_seq_0225_033E:
	comparevartovalue VAR_TEMP_x4001, 397
	gotoif ne, scr_seq_0225_0384
	apply_movement 6, scr_seq_0225_0770
	apply_movement 7, scr_seq_0225_07C4
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif ne, scr_seq_0225_0376
	apply_movement 255, scr_seq_0225_0834
	goto scr_seq_0225_037E

scr_seq_0225_0376:
	apply_movement 255, scr_seq_0225_08B8
scr_seq_0225_037E:
	goto scr_seq_0225_04DC

scr_seq_0225_0384:
	comparevartovalue VAR_TEMP_x4001, 398
	gotoif ne, scr_seq_0225_03CA
	apply_movement 6, scr_seq_0225_077C
	apply_movement 7, scr_seq_0225_07D4
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif ne, scr_seq_0225_03BC
	apply_movement 255, scr_seq_0225_0848
	goto scr_seq_0225_03C4

scr_seq_0225_03BC:
	apply_movement 255, scr_seq_0225_08CC
scr_seq_0225_03C4:
	goto scr_seq_0225_04DC

scr_seq_0225_03CA:
	comparevartovalue VAR_TEMP_x4001, 399
	gotoif ne, scr_seq_0225_0410
	apply_movement 6, scr_seq_0225_0788
	apply_movement 7, scr_seq_0225_07E4
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif ne, scr_seq_0225_0402
	apply_movement 255, scr_seq_0225_085C
	goto scr_seq_0225_040A

scr_seq_0225_0402:
	apply_movement 255, scr_seq_0225_08E0
scr_seq_0225_040A:
	goto scr_seq_0225_04DC

scr_seq_0225_0410:
	comparevartovalue VAR_TEMP_x4001, 400
	gotoif ne, scr_seq_0225_0456
	apply_movement 6, scr_seq_0225_0794
	apply_movement 7, scr_seq_0225_07F4
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif ne, scr_seq_0225_0448
	apply_movement 255, scr_seq_0225_0870
	goto scr_seq_0225_0450

scr_seq_0225_0448:
	apply_movement 255, scr_seq_0225_08F4
scr_seq_0225_0450:
	goto scr_seq_0225_04DC

scr_seq_0225_0456:
	comparevartovalue VAR_TEMP_x4001, 401
	gotoif ne, scr_seq_0225_049C
	apply_movement 6, scr_seq_0225_07A0
	apply_movement 7, scr_seq_0225_0804
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif ne, scr_seq_0225_048E
	apply_movement 255, scr_seq_0225_0884
	goto scr_seq_0225_0496

scr_seq_0225_048E:
	apply_movement 255, scr_seq_0225_0908
scr_seq_0225_0496:
	goto scr_seq_0225_04DC

scr_seq_0225_049C:
	comparevartovalue VAR_TEMP_x4001, 402
	gotoif ne, scr_seq_0225_04DC
	apply_movement 6, scr_seq_0225_07AC
	apply_movement 7, scr_seq_0225_0814
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif ne, scr_seq_0225_04D4
	apply_movement 255, scr_seq_0225_0898
	goto scr_seq_0225_04DC

scr_seq_0225_04D4:
	apply_movement 255, scr_seq_0225_091C
scr_seq_0225_04DC:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	comparevartovalue VAR_TEMP_x4002, 0
	callif eq, scr_seq_0225_0559
	wait 10, VAR_SPECIAL_x800C
	scrcmd_251
	apply_movement 6, scr_seq_0225_064C
	apply_movement 7, scr_seq_0225_0654
	wait_movement
	gender_msgbox 3, 4
	setvar VAR_SPECIAL_x8004, 4
	setvar VAR_SPECIAL_x8005, 5
	callstd 2033
	gender_msgbox 7, 8
	closemsg
	apply_movement 6, scr_seq_0225_0928
	apply_movement 7, scr_seq_0225_093C
	wait_movement
	hide_person 6
	hide_person 7
	setflag FLAG_UNK_1A4
	setflag FLAG_UNK_1A5
	setvar VAR_UNK_408B, 0
	setflag FLAG_UNK_09A
	releaseall
	end

scr_seq_0225_0559:
	apply_movement 6, scr_seq_0225_05BC
	wait_movement
	apply_movement 6, scr_seq_0225_05E4
	apply_movement 7, scr_seq_0225_0600
	wait_movement
	apply_movement 6, scr_seq_0225_061C
	apply_movement 7, scr_seq_0225_0624
	wait_movement
	npc_msg 2
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 6, scr_seq_0225_062C
	apply_movement 7, scr_seq_0225_0634
	apply_movement 255, scr_seq_0225_0640
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	return


scr_seq_0225_05BC:
	.short 75, 1
	.short 254, 0

scr_seq_0225_05C4:
	.short 17, 1
	.short 19, 2
	.short 16, 1
	.short 50, 2
	.short 254, 0

scr_seq_0225_05D8:
	.short 35, 1
	.short 75, 1
	.short 254, 0

scr_seq_0225_05E4:
	.short 50, 3
	.short 65, 1
	.short 50, 3
	.short 63, 3
	.short 50, 3
	.short 63, 3
	.short 254, 0

scr_seq_0225_0600:
	.short 63, 3
	.short 58, 1
	.short 63, 3
	.short 50, 3
	.short 63, 3
	.short 50, 3
	.short 254, 0

scr_seq_0225_061C:
	.short 15, 3
	.short 254, 0

scr_seq_0225_0624:
	.short 15, 3
	.short 254, 0

scr_seq_0225_062C:
	.short 14, 3
	.short 254, 0

scr_seq_0225_0634:
	.short 15, 1
	.short 14, 2
	.short 254, 0

scr_seq_0225_0640:
	.short 63, 1
	.short 14, 2
	.short 254, 0

scr_seq_0225_064C:
	.short 15, 1
	.short 254, 0

scr_seq_0225_0654:
	.short 14, 1
	.short 35, 1
	.short 254, 0

scr_seq_0225_0660:
	.short 16, 4
	.short 19, 2
	.short 17, 2
	.short 18, 2
	.short 16, 2
	.short 19, 4
	.short 254, 0

scr_seq_0225_067C:
	.short 15, 2
	.short 12, 3
	.short 15, 2
	.short 254, 0

scr_seq_0225_068C:
	.short 15, 2
	.short 12, 2
	.short 15, 2
	.short 254, 0

scr_seq_0225_069C:
	.short 15, 2
	.short 12, 1
	.short 15, 2
	.short 254, 0

scr_seq_0225_06AC:
	.short 15, 4
	.short 254, 0

scr_seq_0225_06B4:
	.short 15, 2
	.short 13, 1
	.short 15, 2
	.short 254, 0

scr_seq_0225_06C4:
	.short 15, 2
	.short 13, 2
	.short 15, 2
	.short 254, 0

scr_seq_0225_06D4:
	.short 18, 1
	.short 16, 4
	.short 19, 2
	.short 17, 2
	.short 18, 2
	.short 16, 2
	.short 19, 3
	.short 254, 0

scr_seq_0225_06F4:
	.short 14, 1
	.short 15, 2
	.short 12, 3
	.short 15, 1
	.short 254, 0

scr_seq_0225_0708:
	.short 14, 1
	.short 15, 2
	.short 12, 2
	.short 15, 1
	.short 254, 0

scr_seq_0225_071C:
	.short 14, 1
	.short 15, 2
	.short 12, 1
	.short 15, 1
	.short 254, 0

scr_seq_0225_0730:
	.short 14, 1
	.short 15, 3
	.short 254, 0

scr_seq_0225_073C:
	.short 14, 1
	.short 15, 2
	.short 13, 1
	.short 15, 1
	.short 254, 0

scr_seq_0225_0750:
	.short 14, 1
	.short 15, 2
	.short 13, 2
	.short 15, 1
	.short 254, 0

scr_seq_0225_0764:
	.short 13, 6
	.short 14, 9
	.short 254, 0

scr_seq_0225_0770:
	.short 13, 5
	.short 14, 9
	.short 254, 0

scr_seq_0225_077C:
	.short 13, 4
	.short 14, 9
	.short 254, 0

scr_seq_0225_0788:
	.short 13, 3
	.short 14, 9
	.short 254, 0

scr_seq_0225_0794:
	.short 13, 2
	.short 14, 9
	.short 254, 0

scr_seq_0225_07A0:
	.short 13, 1
	.short 14, 9
	.short 254, 0

scr_seq_0225_07AC:
	.short 14, 9
	.short 254, 0

scr_seq_0225_07B4:
	.short 15, 1
	.short 13, 6
	.short 14, 8
	.short 254, 0

scr_seq_0225_07C4:
	.short 15, 1
	.short 13, 5
	.short 14, 8
	.short 254, 0

scr_seq_0225_07D4:
	.short 15, 1
	.short 13, 4
	.short 14, 8
	.short 254, 0

scr_seq_0225_07E4:
	.short 15, 1
	.short 13, 3
	.short 14, 8
	.short 254, 0

scr_seq_0225_07F4:
	.short 15, 1
	.short 13, 2
	.short 14, 8
	.short 254, 0

scr_seq_0225_0804:
	.short 15, 1
	.short 13, 1
	.short 14, 8
	.short 254, 0

scr_seq_0225_0814:
	.short 15, 1
	.short 14, 8
	.short 254, 0

scr_seq_0225_0820:
	.short 63, 1
	.short 14, 1
	.short 13, 6
	.short 14, 5
	.short 254, 0

scr_seq_0225_0834:
	.short 63, 1
	.short 14, 1
	.short 13, 5
	.short 14, 5
	.short 254, 0

scr_seq_0225_0848:
	.short 63, 1
	.short 14, 1
	.short 13, 4
	.short 14, 5
	.short 254, 0

scr_seq_0225_085C:
	.short 63, 1
	.short 14, 1
	.short 13, 3
	.short 14, 5
	.short 254, 0

scr_seq_0225_0870:
	.short 63, 1
	.short 14, 1
	.short 13, 2
	.short 14, 5
	.short 254, 0

scr_seq_0225_0884:
	.short 63, 1
	.short 14, 1
	.short 13, 1
	.short 14, 5
	.short 254, 0

scr_seq_0225_0898:
	.short 63, 1
	.short 14, 6
	.short 254, 0

scr_seq_0225_08A4:
	.short 63, 1
	.short 14, 1
	.short 13, 6
	.short 14, 7
	.short 254, 0

scr_seq_0225_08B8:
	.short 63, 1
	.short 14, 1
	.short 13, 5
	.short 14, 7
	.short 254, 0

scr_seq_0225_08CC:
	.short 63, 1
	.short 14, 1
	.short 13, 4
	.short 14, 7
	.short 254, 0

scr_seq_0225_08E0:
	.short 63, 1
	.short 14, 1
	.short 13, 3
	.short 14, 7
	.short 254, 0

scr_seq_0225_08F4:
	.short 63, 1
	.short 14, 1
	.short 13, 2
	.short 14, 7
	.short 254, 0

scr_seq_0225_0908:
	.short 63, 1
	.short 14, 1
	.short 13, 1
	.short 14, 7
	.short 254, 0

scr_seq_0225_091C:
	.short 63, 1
	.short 14, 8
	.short 254, 0

scr_seq_0225_0928:
	.short 13, 2
	.short 14, 4
	.short 13, 4
	.short 14, 3
	.short 254, 0

scr_seq_0225_093C:
	.short 15, 1
	.short 13, 2
	.short 14, 4
	.short 13, 4
	.short 14, 2
	.short 254, 0
scr_seq_0225_0954:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_379 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0225_0976
	npc_msg 12
	goto scr_seq_0225_09A5

scr_seq_0225_0976:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0225_098C
	npc_msg 13
	goto scr_seq_0225_09A5

scr_seq_0225_098C:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_0225_09A2
	npc_msg 13
	goto scr_seq_0225_09A5

scr_seq_0225_09A2:
	npc_msg 14
scr_seq_0225_09A5:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0225_09AD:
	scrcmd_055 16, 1, 1, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0225_09C4:
	scrcmd_055 15, 1, 2, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0225_09DB:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0225_09EE:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 11
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0225_0A01:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 10
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
