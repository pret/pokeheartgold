#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0843_T20R0101_039C ; 000
	scrdef scr_seq_0843_T20R0101_0787 ; 001
	scrdef scr_seq_0843_T20R0101_0894 ; 002
	scrdef scr_seq_0843_T20R0101_0664 ; 003
	scrdef scr_seq_0843_T20R0101_104F ; 004
	scrdef scr_seq_0843_T20R0101_1051 ; 005
	scrdef scr_seq_0843_T20R0101_1065 ; 006
	scrdef scr_seq_0843_T20R0101_1079 ; 007
	scrdef scr_seq_0843_T20R0101_108D ; 008
	scrdef scr_seq_0843_T20R0101_10A1 ; 009
	scrdef scr_seq_0843_T20R0101_0042 ; 010
	scrdef scr_seq_0843_T20R0101_00CA ; 011
	scrdef scr_seq_0843_T20R0101_0224 ; 012
	scrdef scr_seq_0843_T20R0101_10B2 ; 013
	scrdef scr_seq_0843_T20R0101_0B6C ; 014
	scrdef scr_seq_0843_T20R0101_1112 ; 015
	scrdef_end

scr_seq_0843_T20R0101_0042:
	scrcmd_144 16416
	checkflag FLAG_ELM_RECEIVED_EMAIL
	gotoif TRUE, scr_seq_0843_T20R0101_00B8
	comparevartovalue VAR_UNK_4108, 0
	gotoif ne, scr_seq_0843_T20R0101_0070
	show_person_at 0, 4, 0, 5, 1
	goto scr_seq_0843_T20R0101_00B4

scr_seq_0843_T20R0101_0070:
	comparevartovalue VAR_UNK_4108, 3
	gotoif ne, scr_seq_0843_T20R0101_008F
	show_person_at 0, 4, 0, 5, 1
	goto scr_seq_0843_T20R0101_00B4

scr_seq_0843_T20R0101_008F:
	comparevartovalue VAR_UNK_4108, 8
	gotoif ne, scr_seq_0843_T20R0101_00B4
	show_person_at 0, 4, 0, 5, 1
	show_person_at 3, 7, 0, 12, 3
scr_seq_0843_T20R0101_00B4:
	scrcmd_621
	end

scr_seq_0843_T20R0101_00B8:
	show_person_at 0, 4, 0, 5, 3
	goto scr_seq_0843_T20R0101_00B4

scr_seq_0843_T20R0101_00CA:
	scrcmd_609
	lockall
	checkflag FLAG_ELM_RECEIVED_EMAIL
	gotoif TRUE, scr_seq_0843_T20R0101_0197
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif ne, scr_seq_0843_T20R0101_00FA
	apply_movement 255, scr_seq_0843_T20R0101_01BC
	goto scr_seq_0843_T20R0101_0145

scr_seq_0843_T20R0101_00FA:
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif ne, scr_seq_0843_T20R0101_0115
	apply_movement 255, scr_seq_0843_T20R0101_01CC
	goto scr_seq_0843_T20R0101_0145

scr_seq_0843_T20R0101_0115:
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif ne, scr_seq_0843_T20R0101_0130
	apply_movement 255, scr_seq_0843_T20R0101_01D4
	goto scr_seq_0843_T20R0101_0145

scr_seq_0843_T20R0101_0130:
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif ne, scr_seq_0843_T20R0101_0145
	apply_movement 255, scr_seq_0843_T20R0101_01E4
scr_seq_0843_T20R0101_0145:
	wait_movement
	buffer_players_name 0
	gender_msgbox 0, 1
	closemsg
	apply_movement 0, scr_seq_0843_T20R0101_0368
	wait_movement
	wait 15, VAR_SPECIAL_x8004
	play_se SEQ_SE_GS_PHONE0
	apply_movement 0, scr_seq_0843_T20R0101_01F4
	wait_movement
	npc_msg 2
	npc_msg 3
	closemsg
	apply_movement 0, scr_seq_0843_T20R0101_0204
	wait_movement
	npc_msg 4
	closemsg
	apply_movement 0, scr_seq_0843_T20R0101_0368
	wait_movement
	setflag FLAG_ELM_RECEIVED_EMAIL
	releaseall
	end

scr_seq_0843_T20R0101_0197:
	apply_movement 0, scr_seq_0843_T20R0101_020C
	wait_movement
	npc_msg 6
	closemsg
	apply_movement 0, scr_seq_0843_T20R0101_0368
	apply_movement 255, scr_seq_0843_T20R0101_021C
	wait_movement
	releaseall
	end


scr_seq_0843_T20R0101_01BC:
	.short 12, 2
	.short 15, 1
	.short 12, 1
	.short 254, 0

scr_seq_0843_T20R0101_01CC:
	.short 12, 3
	.short 254, 0

scr_seq_0843_T20R0101_01D4:
	.short 12, 2
	.short 14, 1
	.short 12, 1
	.short 254, 0

scr_seq_0843_T20R0101_01E4:
	.short 12, 2
	.short 14, 2
	.short 12, 1
	.short 254, 0

scr_seq_0843_T20R0101_01F4:
	.short 75, 1
	.short 12, 1
	.short 65, 1
	.short 254, 0

scr_seq_0843_T20R0101_0204:
	.short 13, 1
	.short 254, 0

scr_seq_0843_T20R0101_020C:
	.short 1, 1
	.short 75, 1
	.short 33, 2
	.short 254, 0

scr_seq_0843_T20R0101_021C:
	.short 12, 1
	.short 254, 0
scr_seq_0843_T20R0101_0224:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_GOT_STARTER
	gotoif TRUE, scr_seq_0843_T20R0101_0331
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
	buffer_mon_species_name 1, 0
	npc_msg 7
	play_fanfare SEQ_ME_POKEGET
	wait_fanfare
	scrcmd_746
	buffer_mon_species_name 1, 0
	npc_msg 8
	getmenuchoice VAR_SPECIAL_x800C
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 0
	callif eq, scr_seq_0843_T20R0101_02EE
	scrcmd_747
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0843_T20R0101_0370
	apply_movement 0, scr_seq_0843_T20R0101_0388
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	npc_msg 10
	closemsg
	apply_movement 0, scr_seq_0843_T20R0101_0380
	wait_movement
	npc_msg 11
	closemsg
	apply_movement 0, scr_seq_0843_T20R0101_0390
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

scr_seq_0843_T20R0101_02EE:
	setvar VAR_TEMP_x4000, 0
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_173 0, VAR_TEMP_x4000
	fade_screen 6, 1, 1, 0
	wait_fade
	scrcmd_746
	bufferpartymonnick 1, 0
	npc_msg 9
	getmenuchoice VAR_SPECIAL_x800C
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0843_T20R0101_02EE
	return

scr_seq_0843_T20R0101_0331:
	checkflag FLAG_UNK_073
	gotoif TRUE, scr_seq_0843_T20R0101_035D
	checkflag FLAG_MET_PASSERBY_BOY
	gotoif TRUE, scr_seq_0843_T20R0101_0352
	npc_msg 15
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0843_T20R0101_0352:
	npc_msg 16
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0843_T20R0101_035D:
	npc_msg 17
	waitbutton
	closemsg
	releaseall
	end


scr_seq_0843_T20R0101_0368:
	.short 3, 1
	.short 254, 0

scr_seq_0843_T20R0101_0370:
	.short 13, 2
	.short 14, 4
	.short 32, 1
	.short 254, 0

scr_seq_0843_T20R0101_0380:
	.short 32, 1
	.short 254, 0

scr_seq_0843_T20R0101_0388:
	.short 33, 1
	.short 254, 0

scr_seq_0843_T20R0101_0390:
	.short 65, 1
	.short 33, 1
	.short 254, 0
scr_seq_0843_T20R0101_039C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0F2
	gotoif TRUE, scr_seq_0843_T20R0101_03BA
	checkflag FLAG_UNK_964
	gotoif TRUE, scr_seq_0843_T20R0101_0526
scr_seq_0843_T20R0101_03BA:
	get_party_count VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0843_T20R0101_03F5
	get_lead_mon_index VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 172
	gotoif ne, scr_seq_0843_T20R0101_03F5
	get_partymon_forme VAR_TEMP_x4000, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0843_T20R0101_0CDC
scr_seq_0843_T20R0101_03F5:
	checkflag FLAG_UNK_072
	gotoif TRUE, scr_seq_0843_T20R0101_04A1
	checkflag FLAG_UNK_983
	gotoif TRUE, scr_seq_0843_T20R0101_055F
	comparevartovalue VAR_UNK_4108, 9
	gotoif ge, scr_seq_0843_T20R0101_04A1
	comparevartovalue VAR_UNK_4108, 0
	gotoif ne, scr_seq_0843_T20R0101_043C
	npc_msg 5
	waitbutton
	closemsg
	apply_movement 0, scr_seq_0843_T20R0101_0368
	wait_movement
	goto scr_seq_0843_T20R0101_049D

scr_seq_0843_T20R0101_043C:
	comparevartovalue VAR_UNK_4108, 2
	gotoif gt, scr_seq_0843_T20R0101_045A
	buffer_players_name 0
	gender_msgbox 12, 13
	waitbutton
	closemsg
	goto scr_seq_0843_T20R0101_049D

scr_seq_0843_T20R0101_045A:
	comparevartovalue VAR_UNK_4108, 5
	gotoif gt, scr_seq_0843_T20R0101_0474
	npc_msg 40
	waitbutton
	closemsg
	goto scr_seq_0843_T20R0101_049D

scr_seq_0843_T20R0101_0474:
	comparevartovalue VAR_UNK_4108, 6
	gotoif ne, scr_seq_0843_T20R0101_0492
	buffer_players_name 0
	gender_msgbox 42, 43
	waitbutton
	closemsg
	goto scr_seq_0843_T20R0101_049D

scr_seq_0843_T20R0101_0492:
	buffer_players_name 0
	gender_msgbox 44, 45
	waitbutton
	closemsg
scr_seq_0843_T20R0101_049D:
	releaseall
	end

scr_seq_0843_T20R0101_04A1:
	check_badge 15, VAR_TEMP_x4003
	comparevartovalue VAR_TEMP_x4003, 1
	gotoif eq, scr_seq_0843_T20R0101_0550
	checkflag FLAG_UNK_0F2
	gotoif TRUE, scr_seq_0843_T20R0101_0541
	checkflag FLAG_UNK_108
	gotoif TRUE, scr_seq_0843_T20R0101_051B
	checkflag FLAG_UNK_109
	gotoif TRUE, scr_seq_0843_T20R0101_051B
	check_badge 7, VAR_TEMP_x4002
	comparevartovalue VAR_TEMP_x4002, 1
	gotoif eq, scr_seq_0843_T20R0101_0510
	comparevartovalue VAR_TEMP_x400F, 1
	gotoif eq, scr_seq_0843_T20R0101_0504
	buffer_players_name 0
	gender_msgbox 98, 99
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0843_T20R0101_0504:
	gender_msgbox 100, 101
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0843_T20R0101_0510:
	npc_msg 69
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0843_T20R0101_051B:
	npc_msg 70
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0843_T20R0101_0526:
	buffer_players_name 0
	gender_msgbox 71, 72
	setvar VAR_SPECIAL_x8004, 456
	setvar VAR_SPECIAL_x8005, 1
	setflag FLAG_UNK_0F2
	callstd std_give_item_verbose
scr_seq_0843_T20R0101_0541:
	buffer_players_name 0
	gender_msgbox 73, 74
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0843_T20R0101_0550:
	buffer_players_name 0
	gender_msgbox 102, 103
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0843_T20R0101_055F:
	get_lead_mon_index VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4001
	scrcmd_149 0
	comparevartovalue VAR_TEMP_x4001, 175
	gotoif eq, scr_seq_0843_T20R0101_0599
	comparevartovalue VAR_TEMP_x4001, 176
	gotoif eq, scr_seq_0843_T20R0101_0599
	comparevartovalue VAR_TEMP_x4001, 468
	gotoif eq, scr_seq_0843_T20R0101_0599
	goto scr_seq_0843_T20R0101_0637

scr_seq_0843_T20R0101_0599:
	apply_movement 0, scr_seq_0843_T20R0101_0658
	wait_movement
	npc_msg 46
	buffer_players_name 0
	scrcmd_495 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif ne, scr_seq_0843_T20R0101_05D9
	checkflag FLAG_UNK_108
	gotoif FALSE, scr_seq_0843_T20R0101_05CF
	gender_msgbox 104, 105
	goto scr_seq_0843_T20R0101_05D3

scr_seq_0843_T20R0101_05CF:
	gender_msgbox 47, 48
scr_seq_0843_T20R0101_05D3:
	goto scr_seq_0843_T20R0101_05F2

scr_seq_0843_T20R0101_05D9:
	checkflag FLAG_UNK_109
	gotoif FALSE, scr_seq_0843_T20R0101_05EE
	gender_msgbox 104, 105
	goto scr_seq_0843_T20R0101_05F2

scr_seq_0843_T20R0101_05EE:
	gender_msgbox 47, 48
scr_seq_0843_T20R0101_05F2:
	setvar VAR_SPECIAL_x8004, 229
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0843_T20R0101_064E
	callstd std_give_item_verbose
	setflag FLAG_UNK_072
	setflag FLAG_UNK_11A
	setvar VAR_TEMP_x400F, 0
	npc_msg 49
	buffer_players_name 0
	gender_msgbox 50, 51
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0843_T20R0101_0637:
	buffer_players_name 0
	gender_msgbox 53, 54
	setvar VAR_TEMP_x400F, 1
	goto scr_seq_0843_T20R0101_04A1

scr_seq_0843_T20R0101_064A:
	.byte 0x61, 0x00, 0x02, 0x00
scr_seq_0843_T20R0101_064E:
	callstd std_bag_is_full
	closemsg
	releaseall
	end


scr_seq_0843_T20R0101_0658:
	.short 75, 1
	.short 62, 1
	.short 254, 0
scr_seq_0843_T20R0101_0664:
	scrcmd_609
	lockall
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif ne, scr_seq_0843_T20R0101_0689
	apply_movement 2, scr_seq_0843_T20R0101_081C
	goto scr_seq_0843_T20R0101_06D4

scr_seq_0843_T20R0101_0689:
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif ne, scr_seq_0843_T20R0101_06A4
	apply_movement 2, scr_seq_0843_T20R0101_082C
	goto scr_seq_0843_T20R0101_06D4

scr_seq_0843_T20R0101_06A4:
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif ne, scr_seq_0843_T20R0101_06BF
	apply_movement 2, scr_seq_0843_T20R0101_083C
	goto scr_seq_0843_T20R0101_06D4

scr_seq_0843_T20R0101_06BF:
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif ne, scr_seq_0843_T20R0101_06D4
	apply_movement 2, scr_seq_0843_T20R0101_084C
scr_seq_0843_T20R0101_06D4:
	wait_movement
	buffer_players_name 0
	gender_msgbox 19, 20
	setvar VAR_SPECIAL_x8004, 17
	setvar VAR_SPECIAL_x8005, 5
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0843_T20R0101_0805
	setvar VAR_SPECIAL_x8004, 17
	setvar VAR_SPECIAL_x8005, 5
	callstd 2008
	closemsg
	setvar VAR_UNK_4108, 2
	npc_msg 21
	closemsg
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif ne, scr_seq_0843_T20R0101_0736
	apply_movement 2, scr_seq_0843_T20R0101_0864
	goto scr_seq_0843_T20R0101_0781

scr_seq_0843_T20R0101_0736:
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif ne, scr_seq_0843_T20R0101_0751
	apply_movement 2, scr_seq_0843_T20R0101_0870
	goto scr_seq_0843_T20R0101_0781

scr_seq_0843_T20R0101_0751:
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif ne, scr_seq_0843_T20R0101_076C
	apply_movement 2, scr_seq_0843_T20R0101_087C
	goto scr_seq_0843_T20R0101_0781

scr_seq_0843_T20R0101_076C:
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif ne, scr_seq_0843_T20R0101_0781
	apply_movement 2, scr_seq_0843_T20R0101_0888
scr_seq_0843_T20R0101_0781:
	wait_movement
	releaseall
	end

scr_seq_0843_T20R0101_0787:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_40FC, 3
	gotoif eq, scr_seq_0843_T20R0101_080F
	comparevartovalue VAR_UNK_4108, 0
	gotoif ne, scr_seq_0843_T20R0101_07B2
	npc_msg 18
	goto scr_seq_0843_T20R0101_07FD

scr_seq_0843_T20R0101_07B2:
	comparevartovalue VAR_UNK_4108, 2
	gotoif ne, scr_seq_0843_T20R0101_07C8
	npc_msg 22
	goto scr_seq_0843_T20R0101_07FD

scr_seq_0843_T20R0101_07C8:
	comparevartovalue VAR_UNK_4108, 4
	gotoif ne, scr_seq_0843_T20R0101_07E4
	npc_msg 41
	setvar VAR_UNK_4108, 5
	goto scr_seq_0843_T20R0101_07FD

scr_seq_0843_T20R0101_07E4:
	comparevartovalue VAR_UNK_4108, 6
	gotoif ne, scr_seq_0843_T20R0101_07FA
	npc_msg 55
	goto scr_seq_0843_T20R0101_07FD

scr_seq_0843_T20R0101_07FA:
	npc_msg 55
scr_seq_0843_T20R0101_07FD:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0843_T20R0101_0805:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

scr_seq_0843_T20R0101_080F:
	npc_msg 57
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0843_T20R0101_081A:
	.byte 0x00, 0x00

scr_seq_0843_T20R0101_081C:
	.short 75, 1
	.short 78, 6
	.short 32, 1
	.short 254, 0

scr_seq_0843_T20R0101_082C:
	.short 75, 1
	.short 78, 5
	.short 32, 1
	.short 254, 0

scr_seq_0843_T20R0101_083C:
	.short 75, 1
	.short 78, 4
	.short 32, 1
	.short 254, 0

scr_seq_0843_T20R0101_084C:
	.short 75, 1
	.short 78, 3
	.short 32, 1
	.short 254, 0
	.byte 0x03, 0x00, 0x01, 0x00
	.byte 0xfe, 0x00, 0x00, 0x00

scr_seq_0843_T20R0101_0864:
	.short 79, 6
	.short 34, 1
	.short 254, 0

scr_seq_0843_T20R0101_0870:
	.short 79, 5
	.short 34, 1
	.short 254, 0

scr_seq_0843_T20R0101_087C:
	.short 79, 4
	.short 34, 1
	.short 254, 0

scr_seq_0843_T20R0101_0888:
	.short 79, 3
	.short 34, 1
	.short 254, 0
scr_seq_0843_T20R0101_0894:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0843_T20R0101_0A68
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	apply_movement 1, scr_seq_0843_T20R0101_0A7C
	wait_movement
	npc_msg 23
	closemsg
	clearflag FLAG_UNK_1A6
	play_se SEQ_SE_DP_KAIDAN2
	scrcmd_100 3
	wait_se SEQ_SE_DP_KAIDAN2
	callstd std_play_friend_music
	apply_movement 3, scr_seq_0843_T20R0101_0ADC
	apply_movement 1, scr_seq_0843_T20R0101_0A84
	wait_movement
	gender_msgbox 24, 25
	closemsg
	apply_movement 1, scr_seq_0843_T20R0101_0A90
	wait_movement
	npc_msg 26
	closemsg
	callstd 2030
scr_seq_0843_T20R0101_0904:
	fade_screen 6, 1, 0, 0
	wait_fade
	name_rival VAR_SPECIAL_x800C
	fade_screen 6, 1, 1, 0
	wait_fade
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0843_T20R0101_0904
	apply_movement 1, scr_seq_0843_T20R0101_0A7C
	wait_movement
	scrcmd_191 1
	npc_msg 27
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0843_T20R0101_0A59
	closemsg
	npc_msg 28
	closemsg
	apply_movement 3, scr_seq_0843_T20R0101_0AEC
	apply_movement 1, scr_seq_0843_T20R0101_0ABC
	wait_movement
	play_se SEQ_SE_DP_KAIDAN2
	hide_person 1
	wait_se SEQ_SE_DP_KAIDAN2
	apply_movement 3, scr_seq_0843_T20R0101_0B08
	wait_movement
	buffer_players_name 0
	gender_msgbox 30, 31
	closemsg
	apply_movement 3, scr_seq_0843_T20R0101_0B18
	wait_movement
	setflag FLAG_UNK_2E5
	play_se SEQ_SE_DP_KAIDAN2
	hide_person 3
	wait_se SEQ_SE_DP_KAIDAN2
	setflag FLAG_UNK_19D
	setflag FLAG_UNK_1A6
	setflag FLAG_UNK_079
	apply_movement 255, scr_seq_0843_T20R0101_0A74
	wait_movement
	apply_movement 0, scr_seq_0843_T20R0101_0B2C
	wait_movement
	buffer_players_name 0
	gender_msgbox 32, 33
	closemsg
	npc_msg 34
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	setvar VAR_SPECIAL_x8004, 484
	setvar VAR_SPECIAL_x8005, 1
	takeitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	apply_movement 0, scr_seq_0843_T20R0101_0B34
	wait_movement
	npc_msg 35
	closemsg
	apply_movement 0, scr_seq_0843_T20R0101_0B48
	wait_movement
	gender_msgbox 36, 37
	closemsg
	apply_movement 0, scr_seq_0843_T20R0101_0B50
	wait_movement
	gender_msgbox 38, 39
	closemsg
	apply_movement 0, scr_seq_0843_T20R0101_0B64
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

scr_seq_0843_T20R0101_0A59:
	npc_msg 29
	closemsg
	goto scr_seq_0843_T20R0101_0904

scr_seq_0843_T20R0101_0A64:
	.byte 0x02, 0x00, 0x00, 0x00

scr_seq_0843_T20R0101_0A68:
	.short 76, 8
	.short 2, 1
	.short 254, 0

scr_seq_0843_T20R0101_0A74:
	.short 0, 1
	.short 254, 0

scr_seq_0843_T20R0101_0A7C:
	.short 35, 1
	.short 254, 0

scr_seq_0843_T20R0101_0A84:
	.short 63, 4
	.short 33, 1
	.short 254, 0

scr_seq_0843_T20R0101_0A90:
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

scr_seq_0843_T20R0101_0ABC:
	.short 1, 1
	.short 62, 1
	.short 13, 6
	.short 3, 1
	.short 15, 1
	.short 1, 1
	.short 13, 2
	.short 254, 0

scr_seq_0843_T20R0101_0ADC:
	.short 16, 6
	.short 18, 1
	.short 48, 2
	.short 254, 0

scr_seq_0843_T20R0101_0AEC:
	.short 2, 1
	.short 71, 1
	.short 15, 1
	.short 72, 1
	.short 66, 1
	.short 1, 1
	.short 254, 0

scr_seq_0843_T20R0101_0B08:
	.short 14, 1
	.short 12, 2
	.short 35, 1
	.short 254, 0

scr_seq_0843_T20R0101_0B18:
	.short 1, 1
	.short 13, 6
	.short 15, 1
	.short 13, 2
	.short 254, 0

scr_seq_0843_T20R0101_0B2C:
	.short 33, 1
	.short 254, 0

scr_seq_0843_T20R0101_0B34:
	.short 49, 1
	.short 71, 1
	.short 80, 1
	.short 72, 1
	.short 254, 0

scr_seq_0843_T20R0101_0B48:
	.short 77, 1
	.short 254, 0

scr_seq_0843_T20R0101_0B50:
	.short 0, 1
	.short 8, 1
	.short 64, 1
	.short 1, 1
	.short 254, 0

scr_seq_0843_T20R0101_0B64:
	.short 77, 1
	.short 254, 0
scr_seq_0843_T20R0101_0B6C:
	scrcmd_609
	lockall
	apply_movement 3, scr_seq_0843_T20R0101_0C78
	wait_movement
	apply_movement 3, scr_seq_0843_T20R0101_0C84
	wait_movement
	buffer_players_name 0
	gender_msgbox 58, 59
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0843_T20R0101_0CA4
	apply_movement 3, scr_seq_0843_T20R0101_0C90
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	apply_movement 0, scr_seq_0843_T20R0101_0B2C
	wait_movement
	buffer_players_name 0
	gender_msgbox 60, 61
	setvar VAR_SPECIAL_x8004, 1
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0843_T20R0101_0BEF
	callstd std_bag_is_full
	goto scr_seq_0843_T20R0101_0BF3

scr_seq_0843_T20R0101_0BEF:
	callstd std_give_item_verbose
scr_seq_0843_T20R0101_0BF3:
	buffer_players_name 0
	gender_msgbox 62, 63
	buffer_players_name 0
	gender_msgbox 64, 65
	closemsg
	apply_movement 3, scr_seq_0843_T20R0101_0CAC
	apply_movement 255, scr_seq_0843_T20R0101_0CB8
	wait_movement
	buffer_players_name 0
	gender_msgbox 67, 68
	closemsg
	apply_movement 3, scr_seq_0843_T20R0101_0CC4
	wait_movement
	hide_person 3
	setflag FLAG_UNK_1A6
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	apply_movement 0, scr_seq_0843_T20R0101_0B2C
	apply_movement 255, scr_seq_0843_T20R0101_0CD4
	wait_movement
	npc_msg 69
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

scr_seq_0843_T20R0101_0C75:
	.byte 0x00, 0x00, 0x00

scr_seq_0843_T20R0101_0C78:
	.short 2, 1
	.short 75, 1
	.short 254, 0

scr_seq_0843_T20R0101_0C84:
	.short 78, 3
	.short 33, 1
	.short 254, 0

scr_seq_0843_T20R0101_0C90:
	.short 12, 5
	.short 15, 1
	.short 12, 1
	.short 34, 1
	.short 254, 0

scr_seq_0843_T20R0101_0CA4:
	.short 12, 7
	.short 254, 0

scr_seq_0843_T20R0101_0CAC:
	.short 13, 1
	.short 34, 1
	.short 254, 0

scr_seq_0843_T20R0101_0CB8:
	.short 63, 1
	.short 35, 1
	.short 254, 0

scr_seq_0843_T20R0101_0CC4:
	.short 77, 3
	.short 78, 1
	.short 77, 4
	.short 254, 0

scr_seq_0843_T20R0101_0CD4:
	.short 32, 1
	.short 254, 0
scr_seq_0843_T20R0101_0CDC:
	comparevartovalue VAR_TEMP_x4006, 1
	gotoif eq, scr_seq_0843_T20R0101_0DD2
	comparevartovalue VAR_UNK_412F, 2
	gotoif ge, scr_seq_0843_T20R0101_1044
	comparevartovalue VAR_UNK_412F, 1
	gotoif eq, scr_seq_0843_T20R0101_0FE4
	call scr_seq_0843_T20R0101_0DE3
	apply_movement 0, scr_seq_0843_T20R0101_0F48
	wait_movement
	npc_msg 75
	closemsg
	apply_movement 0, scr_seq_0843_T20R0101_0F50
	wait_movement
	apply_movement 253, scr_seq_0843_T20R0101_0F38
	wait_movement
	npc_msg 76
	closemsg
	apply_movement 0, scr_seq_0843_T20R0101_0F48
	wait_movement
	npc_msg 77
	closemsg
	apply_movement 0, scr_seq_0843_T20R0101_0F60
	wait_movement
	npc_msg 78
	closemsg
	apply_movement 0, scr_seq_0843_T20R0101_0FBC
	wait_movement
	npc_msg 79
	closemsg
	get_person_coords 0, VAR_SPECIAL_x8006, VAR_SPECIAL_x8007
	comparevartovalue VAR_SPECIAL_x8006, 4
	gotoif ne, scr_seq_0843_T20R0101_0D81
	apply_movement 0, scr_seq_0843_T20R0101_0F98
	goto scr_seq_0843_T20R0101_0D89

scr_seq_0843_T20R0101_0D81:
	apply_movement 0, scr_seq_0843_T20R0101_0F6C
scr_seq_0843_T20R0101_0D89:
	wait_movement
	npc_msg 80
	closemsg
	comparevartovalue VAR_SPECIAL_x8006, 4
	gotoif ne, scr_seq_0843_T20R0101_0DAD
	apply_movement 0, scr_seq_0843_T20R0101_0FDC
	wait_movement
	goto scr_seq_0843_T20R0101_0DB7

scr_seq_0843_T20R0101_0DAD:
	apply_movement 0, scr_seq_0843_T20R0101_0FCC
	wait_movement
scr_seq_0843_T20R0101_0DB7:
	buffer_players_name 0
	gender_msgbox 81, 82
	waitbutton
	closemsg
	setvar VAR_UNK_412F, 1
	addvar VAR_TEMP_x4006, 1
	releaseall
	end

scr_seq_0843_T20R0101_0DD2:
	npc_msg 83
	waitbutton
	closemsg
	addvar VAR_TEMP_x4006, 1
	releaseall
	end

scr_seq_0843_T20R0101_0DE3:
	buffer_players_name 0
	gender_msgbox 84, 85
	closemsg
	scrcmd_386 VAR_TEMP_x4005
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	get_person_coords 0, VAR_SPECIAL_x8006, VAR_SPECIAL_x8007
	comparevartovalue VAR_TEMP_x4005, 0
	gotoif ne, scr_seq_0843_T20R0101_0E27
	apply_movement 255, scr_seq_0843_T20R0101_0EB8
	wait_movement
	apply_movement 253, scr_seq_0843_T20R0101_0F0C
	goto scr_seq_0843_T20R0101_0EA8

scr_seq_0843_T20R0101_0E27:
	comparevartovalue VAR_TEMP_x4005, 3
	gotoif ne, scr_seq_0843_T20R0101_0E4C
	apply_movement 255, scr_seq_0843_T20R0101_0EC4
	wait_movement
	apply_movement 253, scr_seq_0843_T20R0101_0F1C
	goto scr_seq_0843_T20R0101_0EA8

scr_seq_0843_T20R0101_0E4C:
	comparevartovalue VAR_TEMP_x4005, 2
	gotoif ne, scr_seq_0843_T20R0101_0E71
	apply_movement 255, scr_seq_0843_T20R0101_0ED4
	wait_movement
	apply_movement 253, scr_seq_0843_T20R0101_0F30
	goto scr_seq_0843_T20R0101_0EA8

scr_seq_0843_T20R0101_0E71:
	comparevartovalue VAR_SPECIAL_x8006, 4
	gotoif ne, scr_seq_0843_T20R0101_0E96
	apply_movement 255, scr_seq_0843_T20R0101_0EF8
	wait_movement
	apply_movement 253, scr_seq_0843_T20R0101_0F30
	goto scr_seq_0843_T20R0101_0EA8

scr_seq_0843_T20R0101_0E96:
	apply_movement 255, scr_seq_0843_T20R0101_0EE4
	wait_movement
	apply_movement 253, scr_seq_0843_T20R0101_0F1C
scr_seq_0843_T20R0101_0EA8:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	return

scr_seq_0843_T20R0101_0EB6:
	.byte 0x00, 0x00

scr_seq_0843_T20R0101_0EB8:
	.short 13, 1
	.short 32, 1
	.short 254, 0

scr_seq_0843_T20R0101_0EC4:
	.short 13, 2
	.short 15, 1
	.short 32, 1
	.short 254, 0

scr_seq_0843_T20R0101_0ED4:
	.short 13, 2
	.short 14, 1
	.short 32, 1
	.short 254, 0

scr_seq_0843_T20R0101_0EE4:
	.short 14, 1
	.short 13, 3
	.short 15, 1
	.short 32, 1
	.short 254, 0

scr_seq_0843_T20R0101_0EF8:
	.short 15, 1
	.short 13, 3
	.short 14, 1
	.short 32, 1
	.short 254, 0

scr_seq_0843_T20R0101_0F0C:
	.short 15, 1
	.short 13, 1
	.short 32, 1
	.short 254, 0

scr_seq_0843_T20R0101_0F1C:
	.short 13, 1
	.short 15, 2
	.short 12, 1
	.short 32, 1
	.short 254, 0

scr_seq_0843_T20R0101_0F30:
	.short 32, 1
	.short 254, 0

scr_seq_0843_T20R0101_0F38:
	.short 49, 1
	.short 65, 1
	.short 48, 1
	.short 254, 0

scr_seq_0843_T20R0101_0F48:
	.short 33, 1
	.short 254, 0

scr_seq_0843_T20R0101_0F50:
	.short 13, 1
	.short 15, 1
	.short 33, 1
	.short 254, 0

scr_seq_0843_T20R0101_0F60:
	.short 75, 1
	.short 63, 1
	.short 254, 0

scr_seq_0843_T20R0101_0F6C:
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

scr_seq_0843_T20R0101_0F98:
	.short 12, 1
	.short 63, 2
	.short 71, 1
	.short 11, 1
	.short 32, 1
	.short 10, 1
	.short 72, 1
	.short 63, 2
	.short 254, 0

scr_seq_0843_T20R0101_0FBC:
	.short 12, 1
	.short 14, 1
	.short 33, 1
	.short 254, 0

scr_seq_0843_T20R0101_0FCC:
	.short 13, 1
	.short 15, 2
	.short 33, 1
	.short 254, 0

scr_seq_0843_T20R0101_0FDC:
	.short 13, 1
	.short 254, 0
scr_seq_0843_T20R0101_0FE4:
	scrcmd_382 VAR_SPECIAL_x800C, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x800C, 220
	gotoif ge, scr_seq_0843_T20R0101_0FFF
	goto scr_seq_0843_T20R0101_03F5

scr_seq_0843_T20R0101_0FFD:
	.byte 0x02, 0x00
scr_seq_0843_T20R0101_0FFF:
	call scr_seq_0843_T20R0101_0DE3
	gender_msgbox 86, 87
	closemsg
	apply_movement 0, scr_seq_0843_T20R0101_0F60
	wait_movement
	npc_msg 88
	closemsg
	apply_movement 0, scr_seq_0843_T20R0101_0F50
	wait_movement
	npc_msg 89
	closemsg
	apply_movement 0, scr_seq_0843_T20R0101_0FBC
	wait_movement
	npc_msg 90
	waitbutton
	closemsg
	setvar VAR_UNK_412F, 2
	releaseall
	end

scr_seq_0843_T20R0101_1044:
	npc_msg 91
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0843_T20R0101_104F:
	end

scr_seq_0843_T20R0101_1051:
	buffer_players_name 0
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 93
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0843_T20R0101_1065:
	buffer_players_name 0
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 94
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0843_T20R0101_1079:
	buffer_players_name 0
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 95
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0843_T20R0101_108D:
	buffer_players_name 0
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 96
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0843_T20R0101_10A1:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 97
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0843_T20R0101_10B2:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_GOT_STARTER
	gotoif FALSE, scr_seq_0843_T20R0101_1107
	npc_msg 92
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0843_T20R0101_1103
	fade_screen 6, 1, 0, 0
	wait_fade
	play_fanfare SEQ_ME_ASA
	heal_party
	scrcmd_436
	scrcmd_150
	wait_fanfare
	fade_screen 6, 1, 1, 0
	wait_fade
scr_seq_0843_T20R0101_1103:
	releaseall
	end

scr_seq_0843_T20R0101_1107:
	npc_msg 14
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0843_T20R0101_1112:
	scrcmd_609
	lockall
	apply_movement 2, scr_seq_0843_T20R0101_113C
	wait_movement
	buffer_players_name 0
	npc_msg 56
	closemsg
	apply_movement 2, scr_seq_0843_T20R0101_1148
	wait_movement
	setvar VAR_UNK_40FC, 3
	releaseall
	end


scr_seq_0843_T20R0101_113C:
	.short 14, 5
	.short 13, 1
	.short 254, 0

scr_seq_0843_T20R0101_1148:
	.short 12, 1
	.short 15, 5
	.short 33, 1
	.short 254, 0
	.balign 4, 0
