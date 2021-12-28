#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0122_D49_00D6 ; 000
	scrdef scr_seq_0122_D49_06EC ; 001
	scrdef scr_seq_0122_D49_071A ; 002
	scrdef scr_seq_0122_D49_0748 ; 003
	scrdef scr_seq_0122_D49_07FB ; 004
	scrdef scr_seq_0122_D49_0829 ; 005
	scrdef scr_seq_0122_D49_0857 ; 006
	scrdef scr_seq_0122_D49_06FF ; 007
	scrdef scr_seq_0122_D49_072D ; 008
	scrdef scr_seq_0122_D49_07E0 ; 009
	scrdef scr_seq_0122_D49_080E ; 010
	scrdef scr_seq_0122_D49_083C ; 011
	scrdef scr_seq_0122_D49_086A ; 012
	scrdef scr_seq_0122_D49_0885 ; 013
	scrdef scr_seq_0122_D49_08A0 ; 014
	scrdef scr_seq_0122_D49_08BB ; 015
	scrdef scr_seq_0122_D49_0BFC ; 016
	scrdef scr_seq_0122_D49_0D24 ; 017
	scrdef scr_seq_0122_D49_0062 ; 018
	scrdef scr_seq_0122_D49_0A04 ; 019
	scrdef scr_seq_0122_D49_0B97 ; 020
	scrdef scr_seq_0122_D49_0BB8 ; 021
	scrdef scr_seq_0122_D49_0BD9 ; 022
	scrdef scr_seq_0122_D49_0ED4 ; 023
	scrdef_end

scr_seq_0122_D49_0062:
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_0122_D49_0073
	clearflag FLAG_UNK_189
	end

scr_seq_0122_D49_0073:
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, scr_seq_0122_D49_00C2
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif eq, scr_seq_0122_D49_00C2
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif eq, scr_seq_0122_D49_00C2
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, scr_seq_0122_D49_00CC
	comparevartovalue VAR_UNK_40DB, 0
	gotoif eq, scr_seq_0122_D49_00CC
	setflag FLAG_UNK_27E
	clearflag FLAG_UNK_27F
	end

scr_seq_0122_D49_00C2:
	clearflag FLAG_UNK_27E
	setflag FLAG_UNK_27F
	end

scr_seq_0122_D49_00CC:
	setflag FLAG_UNK_27E
	setflag FLAG_UNK_27F
	end

scr_seq_0122_D49_00D6:
	scrcmd_609
	lockall
	scrcmd_099 8
	scrcmd_099 2
	apply_movement 0, scr_seq_0122_D49_0414
	wait_movement
	npc_msg 0
	closemsg
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4000, 40
	gotoif ne, scr_seq_0122_D49_011A
	apply_movement 0, scr_seq_0122_D49_043C
	apply_movement 1, scr_seq_0122_D49_04A8
	goto scr_seq_0122_D49_01D9

scr_seq_0122_D49_011A:
	comparevartovalue VAR_TEMP_x4000, 41
	gotoif ne, scr_seq_0122_D49_013D
	apply_movement 0, scr_seq_0122_D49_044C
	apply_movement 1, scr_seq_0122_D49_04BC
	goto scr_seq_0122_D49_01D9

scr_seq_0122_D49_013D:
	comparevartovalue VAR_TEMP_x4000, 42
	gotoif ne, scr_seq_0122_D49_0160
	apply_movement 0, scr_seq_0122_D49_045C
	apply_movement 1, scr_seq_0122_D49_04D0
	goto scr_seq_0122_D49_01D9

scr_seq_0122_D49_0160:
	comparevartovalue VAR_TEMP_x4000, 43
	gotoif ne, scr_seq_0122_D49_0183
	apply_movement 0, scr_seq_0122_D49_0464
	apply_movement 1, scr_seq_0122_D49_04DC
	goto scr_seq_0122_D49_01D9

scr_seq_0122_D49_0183:
	comparevartovalue VAR_TEMP_x4000, 44
	gotoif ne, scr_seq_0122_D49_01A6
	apply_movement 0, scr_seq_0122_D49_0474
	apply_movement 1, scr_seq_0122_D49_04F0
	goto scr_seq_0122_D49_01D9

scr_seq_0122_D49_01A6:
	comparevartovalue VAR_TEMP_x4000, 39
	gotoif ne, scr_seq_0122_D49_01C9
	apply_movement 0, scr_seq_0122_D49_042C
	apply_movement 1, scr_seq_0122_D49_0494
	goto scr_seq_0122_D49_01D9

scr_seq_0122_D49_01C9:
	apply_movement 0, scr_seq_0122_D49_0484
	apply_movement 1, scr_seq_0122_D49_0504
scr_seq_0122_D49_01D9:
	wait_movement
	npc_msg 6
	closemsg
	apply_movement 0, scr_seq_0122_D49_0424
	apply_movement 1, scr_seq_0122_D49_0424
	wait_movement
	scrcmd_184 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0122_D49_020C
	npc_msg 5
	goto scr_seq_0122_D49_0218

scr_seq_0122_D49_020C:
	get_lead_mon_index VAR_SPECIAL_x8000
	buffer_mon_species_name 1, VAR_SPECIAL_x8000
	npc_msg 1
scr_seq_0122_D49_0218:
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	comparevartovalue VAR_TEMP_x4000, 40
	gotoif ne, scr_seq_0122_D49_024F
	apply_movement 0, scr_seq_0122_D49_0528
	apply_movement 1, scr_seq_0122_D49_05A0
	apply_movement 255, scr_seq_0122_D49_0658
	goto scr_seq_0122_D49_033E

scr_seq_0122_D49_024F:
	comparevartovalue VAR_TEMP_x4000, 41
	gotoif ne, scr_seq_0122_D49_027A
	apply_movement 0, scr_seq_0122_D49_0538
	apply_movement 1, scr_seq_0122_D49_05BC
	apply_movement 255, scr_seq_0122_D49_066C
	goto scr_seq_0122_D49_033E

scr_seq_0122_D49_027A:
	comparevartovalue VAR_TEMP_x4000, 42
	gotoif ne, scr_seq_0122_D49_02A5
	apply_movement 0, scr_seq_0122_D49_0548
	apply_movement 1, scr_seq_0122_D49_05D8
	apply_movement 255, scr_seq_0122_D49_0680
	goto scr_seq_0122_D49_033E

scr_seq_0122_D49_02A5:
	comparevartovalue VAR_TEMP_x4000, 43
	gotoif ne, scr_seq_0122_D49_02D0
	apply_movement 0, scr_seq_0122_D49_0554
	apply_movement 1, scr_seq_0122_D49_05F0
	apply_movement 255, scr_seq_0122_D49_068C
	goto scr_seq_0122_D49_033E

scr_seq_0122_D49_02D0:
	comparevartovalue VAR_TEMP_x4000, 44
	gotoif ne, scr_seq_0122_D49_02FB
	apply_movement 0, scr_seq_0122_D49_0564
	apply_movement 1, scr_seq_0122_D49_060C
	apply_movement 255, scr_seq_0122_D49_06A0
	goto scr_seq_0122_D49_033E

scr_seq_0122_D49_02FB:
	comparevartovalue VAR_TEMP_x4000, 39
	gotoif ne, scr_seq_0122_D49_0326
	apply_movement 0, scr_seq_0122_D49_0518
	apply_movement 1, scr_seq_0122_D49_0584
	apply_movement 255, scr_seq_0122_D49_0644
	goto scr_seq_0122_D49_033E

scr_seq_0122_D49_0326:
	apply_movement 0, scr_seq_0122_D49_0574
	apply_movement 1, scr_seq_0122_D49_0628
	apply_movement 255, scr_seq_0122_D49_06B4
scr_seq_0122_D49_033E:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	npc_msg 2
	closemsg
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	scrcmd_102 VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	apply_movement 241, scr_seq_0122_D49_0400
	wait_movement
	npc_msg 3
	closemsg
	apply_movement 241, scr_seq_0122_D49_0408
	wait_movement
	scrcmd_103
	npc_msg 4
	closemsg
	apply_movement 0, scr_seq_0122_D49_06C8
	apply_movement 1, scr_seq_0122_D49_06D0
	wait_movement
	scrcmd_307 1, 0, 10, 22, 77
	scrcmd_310 77
	scrcmd_308 77
	apply_movement 0, scr_seq_0122_D49_06DC
	apply_movement 1, scr_seq_0122_D49_06E4
	wait_movement
	hide_person 0
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	apply_movement 1, scr_seq_0122_D49_041C
	wait_movement
	scrcmd_076 62, 0
	scrcmd_077
	apply_movement 1, scr_seq_0122_D49_06E4
	wait_movement
	hide_person 1
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	scrcmd_311 77
	scrcmd_308 77
	scrcmd_309 77
	releaseall
	setvar VAR_UNK_40DB, 1
	setflag FLAG_UNK_225
	setflag FLAG_UNK_982
	end

scr_seq_0122_D49_03FF:
	.byte 0x00

scr_seq_0122_D49_0400:
	.short 12, 10
	.short 254, 0

scr_seq_0122_D49_0408:
	.short 66, 1
	.short 77, 10
	.short 254, 0

scr_seq_0122_D49_0414:
	.short 75, 1
	.short 254, 0

scr_seq_0122_D49_041C:
	.short 33, 1
	.short 254, 0

scr_seq_0122_D49_0424:
	.short 17, 1
	.short 254, 0

scr_seq_0122_D49_042C:
	.short 77, 2
	.short 78, 3
	.short 77, 1
	.short 254, 0

scr_seq_0122_D49_043C:
	.short 77, 2
	.short 78, 2
	.short 77, 1
	.short 254, 0

scr_seq_0122_D49_044C:
	.short 77, 2
	.short 78, 1
	.short 77, 1
	.short 254, 0

scr_seq_0122_D49_045C:
	.short 77, 3
	.short 254, 0

scr_seq_0122_D49_0464:
	.short 77, 2
	.short 79, 1
	.short 77, 1
	.short 254, 0

scr_seq_0122_D49_0474:
	.short 77, 2
	.short 79, 2
	.short 77, 1
	.short 254, 0

scr_seq_0122_D49_0484:
	.short 77, 2
	.short 79, 3
	.short 77, 1
	.short 254, 0

scr_seq_0122_D49_0494:
	.short 79, 1
	.short 77, 2
	.short 78, 3
	.short 33, 1
	.short 254, 0

scr_seq_0122_D49_04A8:
	.short 79, 1
	.short 77, 2
	.short 78, 2
	.short 33, 1
	.short 254, 0

scr_seq_0122_D49_04BC:
	.short 79, 1
	.short 77, 2
	.short 78, 1
	.short 33, 1
	.short 254, 0

scr_seq_0122_D49_04D0:
	.short 79, 1
	.short 77, 2
	.short 254, 0

scr_seq_0122_D49_04DC:
	.short 79, 1
	.short 77, 2
	.short 79, 1
	.short 33, 1
	.short 254, 0

scr_seq_0122_D49_04F0:
	.short 79, 1
	.short 77, 2
	.short 79, 2
	.short 33, 1
	.short 254, 0

scr_seq_0122_D49_0504:
	.short 79, 1
	.short 77, 2
	.short 79, 3
	.short 33, 1
	.short 254, 0

scr_seq_0122_D49_0518:
	.short 15, 3
	.short 12, 21
	.short 33, 1
	.short 254, 0

scr_seq_0122_D49_0528:
	.short 15, 2
	.short 12, 21
	.short 33, 1
	.short 254, 0

scr_seq_0122_D49_0538:
	.short 15, 1
	.short 12, 21
	.short 33, 1
	.short 254, 0

scr_seq_0122_D49_0548:
	.short 12, 21
	.short 33, 1
	.short 254, 0

scr_seq_0122_D49_0554:
	.short 14, 1
	.short 12, 21
	.short 33, 1
	.short 254, 0

scr_seq_0122_D49_0564:
	.short 14, 2
	.short 12, 21
	.short 33, 1
	.short 254, 0

scr_seq_0122_D49_0574:
	.short 14, 3
	.short 12, 21
	.short 33, 1
	.short 254, 0

scr_seq_0122_D49_0584:
	.short 13, 1
	.short 15, 3
	.short 12, 20
	.short 14, 1
	.short 12, 1
	.short 33, 1
	.short 254, 0

scr_seq_0122_D49_05A0:
	.short 13, 1
	.short 15, 2
	.short 12, 20
	.short 14, 1
	.short 12, 1
	.short 33, 1
	.short 254, 0

scr_seq_0122_D49_05BC:
	.short 13, 1
	.short 15, 1
	.short 12, 20
	.short 14, 1
	.short 12, 1
	.short 33, 1
	.short 254, 0

scr_seq_0122_D49_05D8:
	.short 13, 1
	.short 12, 20
	.short 14, 1
	.short 12, 1
	.short 33, 1
	.short 254, 0

scr_seq_0122_D49_05F0:
	.short 13, 1
	.short 14, 1
	.short 12, 20
	.short 14, 1
	.short 12, 1
	.short 33, 1
	.short 254, 0

scr_seq_0122_D49_060C:
	.short 13, 1
	.short 14, 2
	.short 12, 20
	.short 14, 1
	.short 12, 1
	.short 33, 1
	.short 254, 0

scr_seq_0122_D49_0628:
	.short 13, 1
	.short 14, 3
	.short 12, 20
	.short 14, 1
	.short 12, 1
	.short 33, 1
	.short 254, 0

scr_seq_0122_D49_0644:
	.short 63, 2
	.short 12, 1
	.short 15, 3
	.short 12, 19
	.short 254, 0

scr_seq_0122_D49_0658:
	.short 63, 2
	.short 12, 1
	.short 15, 2
	.short 12, 19
	.short 254, 0

scr_seq_0122_D49_066C:
	.short 63, 2
	.short 12, 1
	.short 15, 1
	.short 12, 19
	.short 254, 0

scr_seq_0122_D49_0680:
	.short 63, 2
	.short 12, 20
	.short 254, 0

scr_seq_0122_D49_068C:
	.short 63, 2
	.short 12, 1
	.short 14, 1
	.short 12, 19
	.short 254, 0

scr_seq_0122_D49_06A0:
	.short 63, 2
	.short 12, 1
	.short 14, 2
	.short 12, 19
	.short 254, 0

scr_seq_0122_D49_06B4:
	.short 63, 2
	.short 12, 1
	.short 14, 3
	.short 12, 19
	.short 254, 0

scr_seq_0122_D49_06C8:
	.short 12, 2
	.short 254, 0

scr_seq_0122_D49_06D0:
	.short 15, 1
	.short 12, 1
	.short 254, 0

scr_seq_0122_D49_06DC:
	.short 12, 1
	.short 254, 0

scr_seq_0122_D49_06E4:
	.short 12, 1
	.short 254, 0
scr_seq_0122_D49_06EC:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0122_D49_06FF:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 43, 0
	npc_msg 8
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0122_D49_071A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0122_D49_072D:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 52, 0
	npc_msg 10
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0122_D49_0748:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_724 12, 16384
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif ge, scr_seq_0122_D49_076E
	npc_msg 11
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0122_D49_076E:
	checkflag FLAG_UNK_154
	gotoif TRUE, scr_seq_0122_D49_07CB
	npc_msg 12
	scrcmd_724 16, 16384
	comparevartovalue VAR_TEMP_x4000, 1000
	gotoif ge, scr_seq_0122_D49_079A
	npc_msg 13
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0122_D49_079A:
	npc_msg 14
	setvar VAR_SPECIAL_x8004, 50
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0122_D49_07D6
	callstd std_give_item_verbose
	scrcmd_725 0, 100
	setflag FLAG_UNK_154
scr_seq_0122_D49_07CB:
	npc_msg 15
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0122_D49_07D6:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

scr_seq_0122_D49_07E0:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 16, 0
	npc_msg 16
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0122_D49_07FB:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 17
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0122_D49_080E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 80, 0
	npc_msg 18
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0122_D49_0829:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 19
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0122_D49_083C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 66, 0
	npc_msg 20
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0122_D49_0857:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 21
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0122_D49_086A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 79, 0
	npc_msg 22
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0122_D49_0885:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 83, 0
	npc_msg 23
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0122_D49_08A0:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 54, 0
	npc_msg 24
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0122_D49_08BB:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_997
	gotoif FALSE, scr_seq_0122_D49_093E
	npc_msg 25
scr_seq_0122_D49_08D1:
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 326, 255, 0
	scrcmd_751 327, 255, 1
	scrcmd_751 157, 255, 2
	scrcmd_752
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0122_D49_091D
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0122_D49_0928
	goto scr_seq_0122_D49_0933

scr_seq_0122_D49_0917:
	.byte 0x35, 0x00, 0x61, 0x00, 0x02, 0x00
scr_seq_0122_D49_091D:
	npc_msg 30
	goto scr_seq_0122_D49_08D1

scr_seq_0122_D49_0926:
	.byte 0x02, 0x00
scr_seq_0122_D49_0928:
	npc_msg 31
	goto scr_seq_0122_D49_08D1

scr_seq_0122_D49_0931:
	.byte 0x02, 0x00
scr_seq_0122_D49_0933:
	npc_msg 32
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0122_D49_093E:
	npc_msg 26
	buffer_players_name 0
	npc_msg 27
	play_fanfare SEQ_ME_KEYITEM
	wait_fanfare
	npc_msg 28
	setflag FLAG_UNK_997
	npc_msg 29
	goto scr_seq_0122_D49_08D1

scr_seq_0122_D49_095D:
	.byte 0x02, 0x00
scr_seq_0122_D49_095F:
	apply_movement 18, scr_seq_0122_D49_09D4
	wait_movement
	npc_msg 39
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	comparevartovalue VAR_TEMP_x4007, 0
	gotoif ne, scr_seq_0122_D49_0993
	apply_movement 255, scr_seq_0122_D49_09E0
	goto scr_seq_0122_D49_09B6

scr_seq_0122_D49_0993:
	comparevartovalue VAR_TEMP_x4007, 1
	gotoif ne, scr_seq_0122_D49_09AE
	apply_movement 255, scr_seq_0122_D49_09EC
	goto scr_seq_0122_D49_09B6

scr_seq_0122_D49_09AE:
	apply_movement 255, scr_seq_0122_D49_09F8
scr_seq_0122_D49_09B6:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	apply_movement 18, scr_seq_0122_D49_0BF4
	wait_movement
	goto scr_seq_0122_D49_093E

scr_seq_0122_D49_09D2:
	.byte 0x02, 0x00

scr_seq_0122_D49_09D4:
	.short 2, 1
	.short 75, 1
	.short 254, 0

scr_seq_0122_D49_09E0:
	.short 15, 3
	.short 32, 1
	.short 254, 0

scr_seq_0122_D49_09EC:
	.short 15, 2
	.short 32, 1
	.short 254, 0

scr_seq_0122_D49_09F8:
	.short 15, 1
	.short 32, 1
	.short 254, 0
scr_seq_0122_D49_0A04:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x4007, 0
	checkflag FLAG_UNK_997
	gotoif FALSE, scr_seq_0122_D49_095F
scr_seq_0122_D49_0A1D:
	scrcmd_113 21, 1
	scrcmd_741 16391, 32768, 32769, 32770
	apply_movement 18, scr_seq_0122_D49_0BEC
	wait_movement
	npc_msg 33
scr_seq_0122_D49_0A3A:
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 328, 255, 0
	scrcmd_751 329, 255, 1
	scrcmd_751 44, 255, 2
	scrcmd_752
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, scr_seq_0122_D49_0AD6
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0122_D49_0AF6
	hasenoughmoneyvar 32780, 32769
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0122_D49_0AEB
	npc_msg 34
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_114
	scrcmd_740 32768, 32771
	scrcmd_150
	scrcmd_113 21, 1
	fade_screen 6, 1, 1, 0
	wait_fade
	comparevartovalue VAR_SPECIAL_x8003, 0
	gotoif ne, scr_seq_0122_D49_0AD0
	npc_msg 36
	goto scr_seq_0122_D49_0AD9

scr_seq_0122_D49_0AD0:
	submoneyvar 32769
	scrcmd_115
scr_seq_0122_D49_0AD6:
	npc_msg 35
scr_seq_0122_D49_0AD9:
	closemsg
	scrcmd_114
	apply_movement 18, scr_seq_0122_D49_0BF4
	wait_movement
	releaseall
	end

scr_seq_0122_D49_0AEB:
	npc_msg 37
	goto scr_seq_0122_D49_0AD9

scr_seq_0122_D49_0AF4:
	.byte 0x02, 0x00
scr_seq_0122_D49_0AF6:
	comparevartovalue VAR_SPECIAL_x8002, 2000
	gotoif ge, scr_seq_0122_D49_0B80
	comparevartovalue VAR_SPECIAL_x8002, 1000
	gotoif ge, scr_seq_0122_D49_0B77
	comparevartovalue VAR_SPECIAL_x8002, 500
	gotoif ge, scr_seq_0122_D49_0B6E
	comparevartovalue VAR_SPECIAL_x8002, 300
	gotoif ge, scr_seq_0122_D49_0B65
	comparevartovalue VAR_SPECIAL_x8002, 200
	gotoif ge, scr_seq_0122_D49_0B5C
	comparevartovalue VAR_SPECIAL_x8002, 100
	gotoif ge, scr_seq_0122_D49_0B53
	goto scr_seq_0122_D49_0B4A

scr_seq_0122_D49_0B4A:
	npc_msg 41
	goto scr_seq_0122_D49_0B89

scr_seq_0122_D49_0B53:
	npc_msg 42
	goto scr_seq_0122_D49_0B89

scr_seq_0122_D49_0B5C:
	npc_msg 43
	goto scr_seq_0122_D49_0B89

scr_seq_0122_D49_0B65:
	npc_msg 44
	goto scr_seq_0122_D49_0B89

scr_seq_0122_D49_0B6E:
	npc_msg 45
	goto scr_seq_0122_D49_0B89

scr_seq_0122_D49_0B77:
	npc_msg 46
	goto scr_seq_0122_D49_0B89

scr_seq_0122_D49_0B80:
	npc_msg 47
	goto scr_seq_0122_D49_0B89

scr_seq_0122_D49_0B89:
	npc_msg 40
	npc_msg 38
	goto scr_seq_0122_D49_0A3A

scr_seq_0122_D49_0B95:
	.byte 0x02, 0x00
scr_seq_0122_D49_0B97:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x4007, 1
	checkflag FLAG_UNK_997
	gotoif FALSE, scr_seq_0122_D49_095F
	goto scr_seq_0122_D49_0A1D

scr_seq_0122_D49_0BB6:
	.byte 0x02, 0x00
scr_seq_0122_D49_0BB8:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x4007, 2
	checkflag FLAG_UNK_997
	gotoif FALSE, scr_seq_0122_D49_095F
	goto scr_seq_0122_D49_0A1D

scr_seq_0122_D49_0BD7:
	.byte 0x02, 0x00
scr_seq_0122_D49_0BD9:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 48
	waitbutton
	closemsg
	releaseall
	end


scr_seq_0122_D49_0BEC:
	.short 34, 1
	.short 254, 0

scr_seq_0122_D49_0BF4:
	.short 33, 1
	.short 254, 0
scr_seq_0122_D49_0BFC:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 0
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0122_D49_0E44
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0122_D49_0E58
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0122_D49_0C75
	apply_movement 255, scr_seq_0122_D49_0E6C
	apply_movement 16, scr_seq_0122_D49_0EB8
	goto scr_seq_0122_D49_0CC3

scr_seq_0122_D49_0C75:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0122_D49_0C90
	apply_movement 255, scr_seq_0122_D49_0E84
	goto scr_seq_0122_D49_0CC3

scr_seq_0122_D49_0C90:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0122_D49_0CB3
	apply_movement 255, scr_seq_0122_D49_0EA4
	apply_movement 16, scr_seq_0122_D49_0EB8
	goto scr_seq_0122_D49_0CC3

scr_seq_0122_D49_0CB3:
	apply_movement 255, scr_seq_0122_D49_0E90
	apply_movement 16, scr_seq_0122_D49_0EB8
scr_seq_0122_D49_0CC3:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0122_D49_0CEA
	apply_movement 253, scr_seq_0122_D49_0EC4
	wait_movement
scr_seq_0122_D49_0CEA:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_615 13
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

scr_seq_0122_D49_0D24:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 0
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0122_D49_0E44
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0122_D49_0E58
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0122_D49_0D9D
	apply_movement 255, scr_seq_0122_D49_0E6C
	apply_movement 17, scr_seq_0122_D49_0EB8
	goto scr_seq_0122_D49_0DEB

scr_seq_0122_D49_0D9D:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0122_D49_0DB8
	apply_movement 255, scr_seq_0122_D49_0E84
	goto scr_seq_0122_D49_0DEB

scr_seq_0122_D49_0DB8:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0122_D49_0DDB
	apply_movement 255, scr_seq_0122_D49_0EA4
	apply_movement 17, scr_seq_0122_D49_0EB8
	goto scr_seq_0122_D49_0DEB

scr_seq_0122_D49_0DDB:
	apply_movement 255, scr_seq_0122_D49_0E90
	apply_movement 17, scr_seq_0122_D49_0EB8
scr_seq_0122_D49_0DEB:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0122_D49_0E12
	apply_movement 253, scr_seq_0122_D49_0EC4
	wait_movement
scr_seq_0122_D49_0E12:
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_615 14
	lockall
	fade_screen 6, 1, 1, 0
	wait_fade
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0122_D49_0E44:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0122_D49_0E58:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end


scr_seq_0122_D49_0E6C:
	.short 15, 1
	.short 12, 2
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0122_D49_0E84:
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0122_D49_0E90:
	.short 12, 1
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0122_D49_0EA4:
	.short 12, 1
	.short 15, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0122_D49_0EB8:
	.short 63, 1
	.short 32, 1
	.short 254, 0

scr_seq_0122_D49_0EC4:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
scr_seq_0122_D49_0ED4:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 49, VAR_SPECIAL_x800C
	callstd 2000
	end
	.balign 4, 0
