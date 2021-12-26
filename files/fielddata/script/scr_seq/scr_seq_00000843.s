#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000843_0000039C ; 000
	scrdef scr_seq_00000843_00000787 ; 001
	scrdef scr_seq_00000843_00000894 ; 002
	scrdef scr_seq_00000843_00000664 ; 003
	scrdef scr_seq_00000843_0000104F ; 004
	scrdef scr_seq_00000843_00001051 ; 005
	scrdef scr_seq_00000843_00001065 ; 006
	scrdef scr_seq_00000843_00001079 ; 007
	scrdef scr_seq_00000843_0000108D ; 008
	scrdef scr_seq_00000843_000010A1 ; 009
	scrdef scr_seq_00000843_00000042 ; 010
	scrdef scr_seq_00000843_000000CA ; 011
	scrdef scr_seq_00000843_00000224 ; 012
	scrdef scr_seq_00000843_000010B2 ; 013
	scrdef scr_seq_00000843_00000B6C ; 014
	scrdef scr_seq_00000843_00001112 ; 015
	scrdef_end

scr_seq_00000843_00000042:
	scrcmd_144 16416
	checkflag FLAG_ELM_RECEIVED_EMAIL
	gotoif TRUE, scr_seq_00000843_000000B8
	comparevartovalue VAR_UNK_4108, 0
	gotoif ne, scr_seq_00000843_00000070
	show_person_at 0, 4, 0, 5, 1
	goto scr_seq_00000843_000000B4

scr_seq_00000843_00000070:
	comparevartovalue VAR_UNK_4108, 3
	gotoif ne, scr_seq_00000843_0000008F
	show_person_at 0, 4, 0, 5, 1
	goto scr_seq_00000843_000000B4

scr_seq_00000843_0000008F:
	comparevartovalue VAR_UNK_4108, 8
	gotoif ne, scr_seq_00000843_000000B4
	show_person_at 0, 4, 0, 5, 1
	show_person_at 3, 7, 0, 12, 3
scr_seq_00000843_000000B4:
	scrcmd_621
	end

scr_seq_00000843_000000B8:
	show_person_at 0, 4, 0, 5, 3
	goto scr_seq_00000843_000000B4

scr_seq_00000843_000000CA:
	scrcmd_609
	lockall
	checkflag FLAG_ELM_RECEIVED_EMAIL
	gotoif TRUE, scr_seq_00000843_00000197
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif ne, scr_seq_00000843_000000FA
	apply_movement 255, scr_seq_00000843_000001BC
	goto scr_seq_00000843_00000145

scr_seq_00000843_000000FA:
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif ne, scr_seq_00000843_00000115
	apply_movement 255, scr_seq_00000843_000001CC
	goto scr_seq_00000843_00000145

scr_seq_00000843_00000115:
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif ne, scr_seq_00000843_00000130
	apply_movement 255, scr_seq_00000843_000001D4
	goto scr_seq_00000843_00000145

scr_seq_00000843_00000130:
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif ne, scr_seq_00000843_00000145
	apply_movement 255, scr_seq_00000843_000001E4
scr_seq_00000843_00000145:
	wait_movement
	buffer_players_name 0
	gender_msgbox 0, 1
	closemsg
	apply_movement 0, scr_seq_00000843_00000368
	wait_movement
	wait 15, VAR_SPECIAL_x8004
	play_se SEQ_SE_GS_PHONE0
	apply_movement 0, scr_seq_00000843_000001F4
	wait_movement
	msgbox 2
	msgbox 3
	closemsg
	apply_movement 0, scr_seq_00000843_00000204
	wait_movement
	msgbox 4
	closemsg
	apply_movement 0, scr_seq_00000843_00000368
	wait_movement
	setflag FLAG_ELM_RECEIVED_EMAIL
	releaseall
	end

scr_seq_00000843_00000197:
	apply_movement 0, scr_seq_00000843_0000020C
	wait_movement
	msgbox 6
	closemsg
	apply_movement 0, scr_seq_00000843_00000368
	apply_movement 255, scr_seq_00000843_0000021C
	wait_movement
	releaseall
	end


scr_seq_00000843_000001BC:
	.short 12, 2
	.short 15, 1
	.short 12, 1
	.short 254, 0

scr_seq_00000843_000001CC:
	.short 12, 3
	.short 254, 0

scr_seq_00000843_000001D4:
	.short 12, 2
	.short 14, 1
	.short 12, 1
	.short 254, 0

scr_seq_00000843_000001E4:
	.short 12, 2
	.short 14, 2
	.short 12, 1
	.short 254, 0

scr_seq_00000843_000001F4:
	.short 75, 1
	.short 12, 1
	.short 65, 1
	.short 254, 0

scr_seq_00000843_00000204:
	.short 13, 1
	.short 254, 0

scr_seq_00000843_0000020C:
	.short 1, 1
	.short 75, 1
	.short 33, 2
	.short 254, 0

scr_seq_00000843_0000021C:
	.short 12, 1
	.short 254, 0
scr_seq_00000843_00000224:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_GOT_STARTER
	gotoif TRUE, scr_seq_00000843_00000331
	scrcmd_167
	setflag FLAG_GOT_STARTER
	scrcmd_605 3, 2
	scrcmd_602 0
	scrcmd_608
	wait 10, VAR_SPECIAL_x800C
	scrcmd_602 1
	get_partymon_species 0, VAR_TEMP_x4001
	set_starter_choice VAR_TEMP_x4001
	buffer_players_name 0
	scrcmd_193 1, 0
	msgbox 7
	play_fanfare SEQ_ME_POKEGET
	wait_fanfare
	scrcmd_746
	scrcmd_193 1, 0
	msgbox 8
	getmenuchoice VAR_SPECIAL_x800C
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 0
	callif eq, scr_seq_00000843_000002EE
	scrcmd_747
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000843_00000370
	apply_movement 0, scr_seq_00000843_00000388
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	msgbox 10
	closemsg
	apply_movement 0, scr_seq_00000843_00000380
	wait_movement
	msgbox 11
	closemsg
	apply_movement 0, scr_seq_00000843_00000390
	wait_movement
	buffer_players_name 0
	gender_msgbox 12, 13
	waitbutton
	closemsg
	setvar VAR_UNK_4108, 1
	setvar VAR_UNK_4072, 1
	clearflag FLAG_ELM_RECEIVED_EMAIL
	releaseall
	end

scr_seq_00000843_000002EE:
	setvar VAR_TEMP_x4000, 0
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_173 0, VAR_TEMP_x4000
	fade_screen 6, 1, 1, 0
	wait_fade
	scrcmd_746
	bufferpartymonnick 1, 0
	msgbox 9
	getmenuchoice VAR_SPECIAL_x800C
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000843_000002EE
	return

scr_seq_00000843_00000331:
	checkflag FLAG_UNK_073
	gotoif TRUE, scr_seq_00000843_0000035D
	checkflag FLAG_MET_PASSERBY_BOY
	gotoif TRUE, scr_seq_00000843_00000352
	msgbox 15
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000843_00000352:
	msgbox 16
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000843_0000035D:
	msgbox 17
	waitbutton
	closemsg
	releaseall
	end


scr_seq_00000843_00000368:
	.short 3, 1
	.short 254, 0

scr_seq_00000843_00000370:
	.short 13, 2
	.short 14, 4
	.short 32, 1
	.short 254, 0

scr_seq_00000843_00000380:
	.short 32, 1
	.short 254, 0

scr_seq_00000843_00000388:
	.short 33, 1
	.short 254, 0

scr_seq_00000843_00000390:
	.short 65, 1
	.short 33, 1
	.short 254, 0
scr_seq_00000843_0000039C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0F2
	gotoif TRUE, scr_seq_00000843_000003BA
	checkflag FLAG_UNK_964
	gotoif TRUE, scr_seq_00000843_00000526
scr_seq_00000843_000003BA:
	get_party_count VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000843_000003F5
	get_lead_mon_index VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 172
	gotoif ne, scr_seq_00000843_000003F5
	get_partymon_forme VAR_TEMP_x4000, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000843_00000CDC
scr_seq_00000843_000003F5:
	checkflag FLAG_UNK_072
	gotoif TRUE, scr_seq_00000843_000004A1
	checkflag FLAG_UNK_983
	gotoif TRUE, scr_seq_00000843_0000055F
	comparevartovalue VAR_UNK_4108, 9
	gotoif ge, scr_seq_00000843_000004A1
	comparevartovalue VAR_UNK_4108, 0
	gotoif ne, scr_seq_00000843_0000043C
	msgbox 5
	waitbutton
	closemsg
	apply_movement 0, scr_seq_00000843_00000368
	wait_movement
	goto scr_seq_00000843_0000049D

scr_seq_00000843_0000043C:
	comparevartovalue VAR_UNK_4108, 2
	gotoif gt, scr_seq_00000843_0000045A
	buffer_players_name 0
	gender_msgbox 12, 13
	waitbutton
	closemsg
	goto scr_seq_00000843_0000049D

scr_seq_00000843_0000045A:
	comparevartovalue VAR_UNK_4108, 5
	gotoif gt, scr_seq_00000843_00000474
	msgbox 40
	waitbutton
	closemsg
	goto scr_seq_00000843_0000049D

scr_seq_00000843_00000474:
	comparevartovalue VAR_UNK_4108, 6
	gotoif ne, scr_seq_00000843_00000492
	buffer_players_name 0
	gender_msgbox 42, 43
	waitbutton
	closemsg
	goto scr_seq_00000843_0000049D

scr_seq_00000843_00000492:
	buffer_players_name 0
	gender_msgbox 44, 45
	waitbutton
	closemsg
scr_seq_00000843_0000049D:
	releaseall
	end

scr_seq_00000843_000004A1:
	scrcmd_294 15, VAR_TEMP_x4003
	comparevartovalue VAR_TEMP_x4003, 1
	gotoif eq, scr_seq_00000843_00000550
	checkflag FLAG_UNK_0F2
	gotoif TRUE, scr_seq_00000843_00000541
	checkflag FLAG_UNK_108
	gotoif TRUE, scr_seq_00000843_0000051B
	checkflag FLAG_UNK_109
	gotoif TRUE, scr_seq_00000843_0000051B
	scrcmd_294 7, VAR_TEMP_x4002
	comparevartovalue VAR_TEMP_x4002, 1
	gotoif eq, scr_seq_00000843_00000510
	comparevartovalue VAR_TEMP_x400F, 1
	gotoif eq, scr_seq_00000843_00000504
	buffer_players_name 0
	gender_msgbox 98, 99
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000843_00000504:
	gender_msgbox 100, 101
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000843_00000510:
	msgbox 69
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000843_0000051B:
	msgbox 70
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000843_00000526:
	buffer_players_name 0
	gender_msgbox 71, 72
	setvar VAR_SPECIAL_x8004, 456
	setvar VAR_SPECIAL_x8005, 1
	setflag FLAG_UNK_0F2
	callstd 2033
scr_seq_00000843_00000541:
	buffer_players_name 0
	gender_msgbox 73, 74
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000843_00000550:
	buffer_players_name 0
	gender_msgbox 102, 103
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000843_0000055F:
	get_lead_mon_index VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4001
	scrcmd_149 0
	comparevartovalue VAR_TEMP_x4001, 175
	gotoif eq, scr_seq_00000843_00000599
	comparevartovalue VAR_TEMP_x4001, 176
	gotoif eq, scr_seq_00000843_00000599
	comparevartovalue VAR_TEMP_x4001, 468
	gotoif eq, scr_seq_00000843_00000599
	goto scr_seq_00000843_00000637

scr_seq_00000843_00000599:
	apply_movement 0, scr_seq_00000843_00000658
	wait_movement
	msgbox 46
	buffer_players_name 0
	scrcmd_495 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif ne, scr_seq_00000843_000005D9
	checkflag FLAG_UNK_108
	gotoif FALSE, scr_seq_00000843_000005CF
	gender_msgbox 104, 105
	goto scr_seq_00000843_000005D3

scr_seq_00000843_000005CF:
	gender_msgbox 47, 48
scr_seq_00000843_000005D3:
	goto scr_seq_00000843_000005F2

scr_seq_00000843_000005D9:
	checkflag FLAG_UNK_109
	gotoif FALSE, scr_seq_00000843_000005EE
	gender_msgbox 104, 105
	goto scr_seq_00000843_000005F2

scr_seq_00000843_000005EE:
	gender_msgbox 47, 48
scr_seq_00000843_000005F2:
	setvar VAR_SPECIAL_x8004, 229
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000843_0000064E
	callstd 2033
	setflag FLAG_UNK_072
	setflag FLAG_UNK_11A
	setvar VAR_TEMP_x400F, 0
	msgbox 49
	buffer_players_name 0
	gender_msgbox 50, 51
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000843_00000637:
	buffer_players_name 0
	gender_msgbox 53, 54
	setvar VAR_TEMP_x400F, 1
	goto scr_seq_00000843_000004A1

scr_seq_00000843_0000064A:
	.byte 0x61, 0x00, 0x02, 0x00
scr_seq_00000843_0000064E:
	callstd 2009
	closemsg
	releaseall
	end


scr_seq_00000843_00000658:
	.short 75, 1
	.short 62, 1
	.short 254, 0
scr_seq_00000843_00000664:
	scrcmd_609
	lockall
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif ne, scr_seq_00000843_00000689
	apply_movement 2, scr_seq_00000843_0000081C
	goto scr_seq_00000843_000006D4

scr_seq_00000843_00000689:
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif ne, scr_seq_00000843_000006A4
	apply_movement 2, scr_seq_00000843_0000082C
	goto scr_seq_00000843_000006D4

scr_seq_00000843_000006A4:
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif ne, scr_seq_00000843_000006BF
	apply_movement 2, scr_seq_00000843_0000083C
	goto scr_seq_00000843_000006D4

scr_seq_00000843_000006BF:
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif ne, scr_seq_00000843_000006D4
	apply_movement 2, scr_seq_00000843_0000084C
scr_seq_00000843_000006D4:
	wait_movement
	buffer_players_name 0
	gender_msgbox 19, 20
	setvar VAR_SPECIAL_x8004, 17
	setvar VAR_SPECIAL_x8005, 5
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000843_00000805
	setvar VAR_SPECIAL_x8004, 17
	setvar VAR_SPECIAL_x8005, 5
	callstd 2008
	closemsg
	setvar VAR_UNK_4108, 2
	msgbox 21
	closemsg
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif ne, scr_seq_00000843_00000736
	apply_movement 2, scr_seq_00000843_00000864
	goto scr_seq_00000843_00000781

scr_seq_00000843_00000736:
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif ne, scr_seq_00000843_00000751
	apply_movement 2, scr_seq_00000843_00000870
	goto scr_seq_00000843_00000781

scr_seq_00000843_00000751:
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif ne, scr_seq_00000843_0000076C
	apply_movement 2, scr_seq_00000843_0000087C
	goto scr_seq_00000843_00000781

scr_seq_00000843_0000076C:
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif ne, scr_seq_00000843_00000781
	apply_movement 2, scr_seq_00000843_00000888
scr_seq_00000843_00000781:
	wait_movement
	releaseall
	end

scr_seq_00000843_00000787:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_40FC, 3
	gotoif eq, scr_seq_00000843_0000080F
	comparevartovalue VAR_UNK_4108, 0
	gotoif ne, scr_seq_00000843_000007B2
	msgbox 18
	goto scr_seq_00000843_000007FD

scr_seq_00000843_000007B2:
	comparevartovalue VAR_UNK_4108, 2
	gotoif ne, scr_seq_00000843_000007C8
	msgbox 22
	goto scr_seq_00000843_000007FD

scr_seq_00000843_000007C8:
	comparevartovalue VAR_UNK_4108, 4
	gotoif ne, scr_seq_00000843_000007E4
	msgbox 41
	setvar VAR_UNK_4108, 5
	goto scr_seq_00000843_000007FD

scr_seq_00000843_000007E4:
	comparevartovalue VAR_UNK_4108, 6
	gotoif ne, scr_seq_00000843_000007FA
	msgbox 55
	goto scr_seq_00000843_000007FD

scr_seq_00000843_000007FA:
	msgbox 55
scr_seq_00000843_000007FD:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000843_00000805:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_00000843_0000080F:
	msgbox 57
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000843_0000081A:
	.byte 0x00, 0x00

scr_seq_00000843_0000081C:
	.short 75, 1
	.short 78, 6
	.short 32, 1
	.short 254, 0

scr_seq_00000843_0000082C:
	.short 75, 1
	.short 78, 5
	.short 32, 1
	.short 254, 0

scr_seq_00000843_0000083C:
	.short 75, 1
	.short 78, 4
	.short 32, 1
	.short 254, 0

scr_seq_00000843_0000084C:
	.short 75, 1
	.short 78, 3
	.short 32, 1
	.short 254, 0
	.byte 0x03, 0x00, 0x01, 0x00
	.byte 0xfe, 0x00, 0x00, 0x00

scr_seq_00000843_00000864:
	.short 79, 6
	.short 34, 1
	.short 254, 0

scr_seq_00000843_00000870:
	.short 79, 5
	.short 34, 1
	.short 254, 0

scr_seq_00000843_0000087C:
	.short 79, 4
	.short 34, 1
	.short 254, 0

scr_seq_00000843_00000888:
	.short 79, 3
	.short 34, 1
	.short 254, 0
scr_seq_00000843_00000894:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000843_00000A68
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	apply_movement 1, scr_seq_00000843_00000A7C
	wait_movement
	msgbox 23
	closemsg
	clearflag FLAG_UNK_1A6
	play_se SEQ_SE_DP_KAIDAN2
	scrcmd_100 3
	wait_se SEQ_SE_DP_KAIDAN2
	callstd 2029
	apply_movement 3, scr_seq_00000843_00000ADC
	apply_movement 1, scr_seq_00000843_00000A84
	wait_movement
	gender_msgbox 24, 25
	closemsg
	apply_movement 1, scr_seq_00000843_00000A90
	wait_movement
	msgbox 26
	closemsg
	callstd 2030
scr_seq_00000843_00000904:
	fade_screen 6, 1, 0, 0
	wait_fade
	name_rival VAR_SPECIAL_x800C
	fade_screen 6, 1, 1, 0
	wait_fade
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000843_00000904
	apply_movement 1, scr_seq_00000843_00000A7C
	wait_movement
	scrcmd_191 1
	msgbox 27
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000843_00000A59
	closemsg
	msgbox 28
	closemsg
	apply_movement 3, scr_seq_00000843_00000AEC
	apply_movement 1, scr_seq_00000843_00000ABC
	wait_movement
	play_se SEQ_SE_DP_KAIDAN2
	hide_person 1
	wait_se SEQ_SE_DP_KAIDAN2
	apply_movement 3, scr_seq_00000843_00000B08
	wait_movement
	buffer_players_name 0
	gender_msgbox 30, 31
	closemsg
	apply_movement 3, scr_seq_00000843_00000B18
	wait_movement
	setflag FLAG_UNK_2E5
	play_se SEQ_SE_DP_KAIDAN2
	hide_person 3
	wait_se SEQ_SE_DP_KAIDAN2
	setflag FLAG_UNK_19D
	setflag FLAG_UNK_1A6
	setflag FLAG_UNK_079
	apply_movement 255, scr_seq_00000843_00000A74
	wait_movement
	apply_movement 0, scr_seq_00000843_00000B2C
	wait_movement
	buffer_players_name 0
	gender_msgbox 32, 33
	closemsg
	msgbox 34
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	setvar VAR_SPECIAL_x8004, 484
	setvar VAR_SPECIAL_x8005, 1
	takeitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	apply_movement 0, scr_seq_00000843_00000B34
	wait_movement
	msgbox 35
	closemsg
	apply_movement 0, scr_seq_00000843_00000B48
	wait_movement
	gender_msgbox 36, 37
	closemsg
	apply_movement 0, scr_seq_00000843_00000B50
	wait_movement
	gender_msgbox 38, 39
	closemsg
	apply_movement 0, scr_seq_00000843_00000B64
	wait_movement
	setflag FLAG_UNK_196
	clearflag FLAG_UNK_199
	setvar VAR_UNK_4108, 4
	setvar VAR_UNK_408B, 1
	clearflag FLAG_UNK_1A4
	clearflag FLAG_UNK_1A5
	setvar VAR_UNK_4107, 2
	setvar VAR_UNK_4072, 3
	clearflag FLAG_UNK_194
	setvar VAR_UNK_4095, 1
	releaseall
	end

scr_seq_00000843_00000A59:
	msgbox 29
	closemsg
	goto scr_seq_00000843_00000904

scr_seq_00000843_00000A64:
	.byte 0x02, 0x00, 0x00, 0x00

scr_seq_00000843_00000A68:
	.short 76, 8
	.short 2, 1
	.short 254, 0

scr_seq_00000843_00000A74:
	.short 0, 1
	.short 254, 0

scr_seq_00000843_00000A7C:
	.short 35, 1
	.short 254, 0

scr_seq_00000843_00000A84:
	.short 63, 4
	.short 33, 1
	.short 254, 0

scr_seq_00000843_00000A90:
	.short 75, 1
	.short 60, 1
	.short 1, 1
	.short 63, 2
	.short 3, 1
	.short 63, 2
	.short 1, 1
	.short 63, 2
	.short 3, 1
	.short 63, 2
	.short 254, 0

scr_seq_00000843_00000ABC:
	.short 1, 1
	.short 62, 1
	.short 13, 6
	.short 3, 1
	.short 15, 1
	.short 1, 1
	.short 13, 2
	.short 254, 0

scr_seq_00000843_00000ADC:
	.short 16, 6
	.short 18, 1
	.short 48, 2
	.short 254, 0

scr_seq_00000843_00000AEC:
	.short 2, 1
	.short 71, 1
	.short 15, 1
	.short 72, 1
	.short 66, 1
	.short 1, 1
	.short 254, 0

scr_seq_00000843_00000B08:
	.short 14, 1
	.short 12, 2
	.short 35, 1
	.short 254, 0

scr_seq_00000843_00000B18:
	.short 1, 1
	.short 13, 6
	.short 15, 1
	.short 13, 2
	.short 254, 0

scr_seq_00000843_00000B2C:
	.short 33, 1
	.short 254, 0

scr_seq_00000843_00000B34:
	.short 49, 1
	.short 71, 1
	.short 80, 1
	.short 72, 1
	.short 254, 0

scr_seq_00000843_00000B48:
	.short 77, 1
	.short 254, 0

scr_seq_00000843_00000B50:
	.short 0, 1
	.short 8, 1
	.short 64, 1
	.short 1, 1
	.short 254, 0

scr_seq_00000843_00000B64:
	.short 77, 1
	.short 254, 0
scr_seq_00000843_00000B6C:
	scrcmd_609
	lockall
	apply_movement 3, scr_seq_00000843_00000C78
	wait_movement
	apply_movement 3, scr_seq_00000843_00000C84
	wait_movement
	buffer_players_name 0
	gender_msgbox 58, 59
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000843_00000CA4
	apply_movement 3, scr_seq_00000843_00000C90
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	apply_movement 0, scr_seq_00000843_00000B2C
	wait_movement
	buffer_players_name 0
	gender_msgbox 60, 61
	setvar VAR_SPECIAL_x8004, 1
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000843_00000BEF
	callstd 2009
	goto scr_seq_00000843_00000BF3

scr_seq_00000843_00000BEF:
	callstd 2033
scr_seq_00000843_00000BF3:
	buffer_players_name 0
	gender_msgbox 62, 63
	buffer_players_name 0
	gender_msgbox 64, 65
	closemsg
	apply_movement 3, scr_seq_00000843_00000CAC
	apply_movement 255, scr_seq_00000843_00000CB8
	wait_movement
	buffer_players_name 0
	gender_msgbox 67, 68
	closemsg
	apply_movement 3, scr_seq_00000843_00000CC4
	wait_movement
	hide_person 3
	setflag FLAG_UNK_1A6
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	apply_movement 0, scr_seq_00000843_00000B2C
	apply_movement 255, scr_seq_00000843_00000CD4
	wait_movement
	msgbox 69
	waitbutton
	closemsg
	releaseall
	setvar VAR_UNK_4108, 9
	setvar VAR_UNK_4079, 3
	setflag FLAG_UNK_23B
	clearflag FLAG_UNK_2E8
	setvar VAR_UNK_4081, 2
	setvar VAR_UNK_407B, 2
	end

scr_seq_00000843_00000C75:
	.byte 0x00, 0x00, 0x00

scr_seq_00000843_00000C78:
	.short 2, 1
	.short 75, 1
	.short 254, 0

scr_seq_00000843_00000C84:
	.short 78, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000843_00000C90:
	.short 12, 5
	.short 15, 1
	.short 12, 1
	.short 34, 1
	.short 254, 0

scr_seq_00000843_00000CA4:
	.short 12, 7
	.short 254, 0

scr_seq_00000843_00000CAC:
	.short 13, 1
	.short 34, 1
	.short 254, 0

scr_seq_00000843_00000CB8:
	.short 63, 1
	.short 35, 1
	.short 254, 0

scr_seq_00000843_00000CC4:
	.short 77, 3
	.short 78, 1
	.short 77, 4
	.short 254, 0

scr_seq_00000843_00000CD4:
	.short 32, 1
	.short 254, 0
scr_seq_00000843_00000CDC:
	comparevartovalue VAR_TEMP_x4006, 1
	gotoif eq, scr_seq_00000843_00000DD2
	comparevartovalue VAR_UNK_412F, 2
	gotoif ge, scr_seq_00000843_00001044
	comparevartovalue VAR_UNK_412F, 1
	gotoif eq, scr_seq_00000843_00000FE4
	call scr_seq_00000843_00000DE3
	apply_movement 0, scr_seq_00000843_00000F48
	wait_movement
	msgbox 75
	closemsg
	apply_movement 0, scr_seq_00000843_00000F50
	wait_movement
	apply_movement 253, scr_seq_00000843_00000F38
	wait_movement
	msgbox 76
	closemsg
	apply_movement 0, scr_seq_00000843_00000F48
	wait_movement
	msgbox 77
	closemsg
	apply_movement 0, scr_seq_00000843_00000F60
	wait_movement
	msgbox 78
	closemsg
	apply_movement 0, scr_seq_00000843_00000FBC
	wait_movement
	msgbox 79
	closemsg
	get_person_coords 0, VAR_SPECIAL_x8006, VAR_SPECIAL_x8007
	comparevartovalue VAR_SPECIAL_x8006, 4
	gotoif ne, scr_seq_00000843_00000D81
	apply_movement 0, scr_seq_00000843_00000F98
	goto scr_seq_00000843_00000D89

scr_seq_00000843_00000D81:
	apply_movement 0, scr_seq_00000843_00000F6C
scr_seq_00000843_00000D89:
	wait_movement
	msgbox 80
	closemsg
	comparevartovalue VAR_SPECIAL_x8006, 4
	gotoif ne, scr_seq_00000843_00000DAD
	apply_movement 0, scr_seq_00000843_00000FDC
	wait_movement
	goto scr_seq_00000843_00000DB7

scr_seq_00000843_00000DAD:
	apply_movement 0, scr_seq_00000843_00000FCC
	wait_movement
scr_seq_00000843_00000DB7:
	buffer_players_name 0
	gender_msgbox 81, 82
	waitbutton
	closemsg
	setvar VAR_UNK_412F, 1
	addvar VAR_TEMP_x4006, 1
	releaseall
	end

scr_seq_00000843_00000DD2:
	msgbox 83
	waitbutton
	closemsg
	addvar VAR_TEMP_x4006, 1
	releaseall
	end

scr_seq_00000843_00000DE3:
	buffer_players_name 0
	gender_msgbox 84, 85
	closemsg
	scrcmd_386 VAR_TEMP_x4005
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	get_person_coords 0, VAR_SPECIAL_x8006, VAR_SPECIAL_x8007
	comparevartovalue VAR_TEMP_x4005, 0
	gotoif ne, scr_seq_00000843_00000E27
	apply_movement 255, scr_seq_00000843_00000EB8
	wait_movement
	apply_movement 253, scr_seq_00000843_00000F0C
	goto scr_seq_00000843_00000EA8

scr_seq_00000843_00000E27:
	comparevartovalue VAR_TEMP_x4005, 3
	gotoif ne, scr_seq_00000843_00000E4C
	apply_movement 255, scr_seq_00000843_00000EC4
	wait_movement
	apply_movement 253, scr_seq_00000843_00000F1C
	goto scr_seq_00000843_00000EA8

scr_seq_00000843_00000E4C:
	comparevartovalue VAR_TEMP_x4005, 2
	gotoif ne, scr_seq_00000843_00000E71
	apply_movement 255, scr_seq_00000843_00000ED4
	wait_movement
	apply_movement 253, scr_seq_00000843_00000F30
	goto scr_seq_00000843_00000EA8

scr_seq_00000843_00000E71:
	comparevartovalue VAR_SPECIAL_x8006, 4
	gotoif ne, scr_seq_00000843_00000E96
	apply_movement 255, scr_seq_00000843_00000EF8
	wait_movement
	apply_movement 253, scr_seq_00000843_00000F30
	goto scr_seq_00000843_00000EA8

scr_seq_00000843_00000E96:
	apply_movement 255, scr_seq_00000843_00000EE4
	wait_movement
	apply_movement 253, scr_seq_00000843_00000F1C
scr_seq_00000843_00000EA8:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	return

scr_seq_00000843_00000EB6:
	.byte 0x00, 0x00

scr_seq_00000843_00000EB8:
	.short 13, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000843_00000EC4:
	.short 13, 2
	.short 15, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000843_00000ED4:
	.short 13, 2
	.short 14, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000843_00000EE4:
	.short 14, 1
	.short 13, 3
	.short 15, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000843_00000EF8:
	.short 15, 1
	.short 13, 3
	.short 14, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000843_00000F0C:
	.short 15, 1
	.short 13, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000843_00000F1C:
	.short 13, 1
	.short 15, 2
	.short 12, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000843_00000F30:
	.short 32, 1
	.short 254, 0

scr_seq_00000843_00000F38:
	.short 49, 1
	.short 65, 1
	.short 48, 1
	.short 254, 0

scr_seq_00000843_00000F48:
	.short 33, 1
	.short 254, 0

scr_seq_00000843_00000F50:
	.short 13, 1
	.short 15, 1
	.short 33, 1
	.short 254, 0

scr_seq_00000843_00000F60:
	.short 75, 1
	.short 63, 1
	.short 254, 0

scr_seq_00000843_00000F6C:
	.short 12, 1
	.short 14, 2
	.short 32, 1
	.short 63, 2
	.short 71, 1
	.short 11, 1
	.short 32, 1
	.short 10, 1
	.short 72, 1
	.short 63, 2
	.short 254, 0

scr_seq_00000843_00000F98:
	.short 12, 1
	.short 63, 2
	.short 71, 1
	.short 11, 1
	.short 32, 1
	.short 10, 1
	.short 72, 1
	.short 63, 2
	.short 254, 0

scr_seq_00000843_00000FBC:
	.short 12, 1
	.short 14, 1
	.short 33, 1
	.short 254, 0

scr_seq_00000843_00000FCC:
	.short 13, 1
	.short 15, 2
	.short 33, 1
	.short 254, 0

scr_seq_00000843_00000FDC:
	.short 13, 1
	.short 254, 0
scr_seq_00000843_00000FE4:
	scrcmd_382 VAR_SPECIAL_x800C, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x800C, 220
	gotoif ge, scr_seq_00000843_00000FFF
	goto scr_seq_00000843_000003F5

scr_seq_00000843_00000FFD:
	.byte 0x02, 0x00
scr_seq_00000843_00000FFF:
	call scr_seq_00000843_00000DE3
	gender_msgbox 86, 87
	closemsg
	apply_movement 0, scr_seq_00000843_00000F60
	wait_movement
	msgbox 88
	closemsg
	apply_movement 0, scr_seq_00000843_00000F50
	wait_movement
	msgbox 89
	closemsg
	apply_movement 0, scr_seq_00000843_00000FBC
	wait_movement
	msgbox 90
	waitbutton
	closemsg
	setvar VAR_UNK_412F, 2
	releaseall
	end

scr_seq_00000843_00001044:
	msgbox 91
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000843_0000104F:
	end

scr_seq_00000843_00001051:
	buffer_players_name 0
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 93
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000843_00001065:
	buffer_players_name 0
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 94
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000843_00001079:
	buffer_players_name 0
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 95
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000843_0000108D:
	buffer_players_name 0
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 96
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000843_000010A1:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 97
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000843_000010B2:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_GOT_STARTER
	gotoif FALSE, scr_seq_00000843_00001107
	msgbox 92
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000843_00001103
	fade_screen 6, 1, 0, 0
	wait_fade
	play_fanfare SEQ_ME_ASA
	heal_party
	scrcmd_436
	scrcmd_150
	wait_fanfare
	fade_screen 6, 1, 1, 0
	wait_fade
scr_seq_00000843_00001103:
	releaseall
	end

scr_seq_00000843_00001107:
	msgbox 14
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000843_00001112:
	scrcmd_609
	lockall
	apply_movement 2, scr_seq_00000843_0000113C
	wait_movement
	buffer_players_name 0
	msgbox 56
	closemsg
	apply_movement 2, scr_seq_00000843_00001148
	wait_movement
	setvar VAR_UNK_40FC, 3
	releaseall
	end


scr_seq_00000843_0000113C:
	.short 14, 5
	.short 13, 1
	.short 254, 0

scr_seq_00000843_00001148:
	.short 12, 1
	.short 15, 5
	.short 33, 1
	.short 254, 0
	.balign 4, 0
