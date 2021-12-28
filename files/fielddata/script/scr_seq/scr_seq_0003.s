#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0003_0498 ; 000
	scrdef scr_seq_0003_04E8 ; 001
	scrdef scr_seq_0003_0122 ; 002
	scrdef scr_seq_0003_0584 ; 003
	scrdef scr_seq_0003_05D9 ; 004
	scrdef scr_seq_0003_0617 ; 005
	scrdef scr_seq_0003_0632 ; 006
	scrdef scr_seq_0003_078E ; 007
	scrdef scr_seq_0003_0800 ; 008
	scrdef scr_seq_0003_09EB ; 009
	scrdef scr_seq_0003_09FC ; 010
	scrdef scr_seq_0003_0E43 ; 011
	scrdef scr_seq_0003_0E4A ; 012
	scrdef scr_seq_0003_0EA9 ; 013
	scrdef scr_seq_0003_0E27 ; 014
	scrdef scr_seq_0003_1084 ; 015
	scrdef scr_seq_0003_10AA ; 016
	scrdef scr_seq_0003_10BC ; 017
	scrdef scr_seq_0003_10CF ; 018
	scrdef scr_seq_0003_10E2 ; 019
	scrdef scr_seq_0003_10F5 ; 020
	scrdef scr_seq_0003_1165 ; 021
	scrdef scr_seq_0003_1190 ; 022
	scrdef scr_seq_0003_11A1 ; 023
	scrdef scr_seq_0003_0629 ; 024
	scrdef scr_seq_0003_1282 ; 025
	scrdef scr_seq_0003_07C8 ; 026
	scrdef scr_seq_0003_1295 ; 027
	scrdef scr_seq_0003_1297 ; 028
	scrdef scr_seq_0003_12B0 ; 029
	scrdef scr_seq_0003_1342 ; 030
	scrdef scr_seq_0003_12E2 ; 031
	scrdef scr_seq_0003_1342 ; 032
	scrdef scr_seq_0003_0855 ; 033
	scrdef scr_seq_0003_07D7 ; 034
	scrdef scr_seq_0003_079D ; 035
	scrdef scr_seq_0003_1312 ; 036
	scrdef scr_seq_0003_131E ; 037
	scrdef scr_seq_0003_1342 ; 038
	scrdef scr_seq_0003_1352 ; 039
	scrdef scr_seq_0003_139A ; 040
	scrdef scr_seq_0003_13FA ; 041
	scrdef scr_seq_0003_12FA ; 042
	scrdef scr_seq_0003_1342 ; 043
	scrdef scr_seq_0003_1306 ; 044
	scrdef scr_seq_0003_1342 ; 045
	scrdef scr_seq_0003_1407 ; 046
	scrdef scr_seq_0003_1364 ; 047
	scrdef scr_seq_0003_1456 ; 048
	scrdef scr_seq_0003_14B1 ; 049
	scrdef scr_seq_0003_14BD ; 050
	scrdef scr_seq_0003_14C7 ; 051
	scrdef scr_seq_0003_14F3 ; 052
	scrdef scr_seq_0003_154E ; 053
	scrdef scr_seq_0003_155A ; 054
	scrdef scr_seq_0003_1564 ; 055
	scrdef scr_seq_0003_1678 ; 056
	scrdef scr_seq_0003_16CB ; 057
	scrdef scr_seq_0003_16D1 ; 058
	scrdef scr_seq_0003_16D7 ; 059
	scrdef scr_seq_0003_16DD ; 060
	scrdef scr_seq_0003_1730 ; 061
	scrdef scr_seq_0003_1736 ; 062
	scrdef scr_seq_0003_173C ; 063
	scrdef scr_seq_0003_1742 ; 064
	scrdef scr_seq_0003_132A ; 065
	scrdef scr_seq_0003_1342 ; 066
	scrdef scr_seq_0003_1336 ; 067
	scrdef scr_seq_0003_1342 ; 068
	scrdef scr_seq_0003_0470 ; 069
	scrdef scr_seq_0003_12EE ; 070
	scrdef scr_seq_0003_1342 ; 071
	scrdef_end

scr_seq_0003_0122:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_590 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 4
	gotoif ge, scr_seq_0003_03E3
	setvar VAR_SPECIAL_x8004, 0
	scrcmd_379 VAR_SPECIAL_x800C
	debugwatch VAR_SPECIAL_x800C
	setvar VAR_SPECIAL_x8004, 83
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0003_0175
	setvar VAR_SPECIAL_x8004, 84
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0003_0175
	setvar VAR_SPECIAL_x8004, 0
scr_seq_0003_0175:
	scrcmd_046 VAR_SPECIAL_x8004
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0003_01AA
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0003_019B
	end

scr_seq_0003_019B:
	npc_msg 3
	waitbutton
	scrcmd_747
	closemsg
	releaseall
	endstd
	end

scr_seq_0003_01AA:
	get_trcard_stars VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0003_01C5
	scrcmd_188 2048
	goto scr_seq_0003_01C9

scr_seq_0003_01C5:
	scrcmd_188 256
scr_seq_0003_01C9:
	scrcmd_189
	apply_movement 255, scr_seq_0003_0460
	wait_movement
	scrcmd_599
	scrcmd_590 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 4
	callif ge, scr_seq_0003_0211
	comparevartovalue VAR_SPECIAL_x800C, 4
	callif lt, scr_seq_0003_020C
	call scr_seq_0003_0216
	checkflag FLAG_UNK_065
	gotoif FALSE, scr_seq_0003_034D
	goto scr_seq_0003_023A

scr_seq_0003_020C:
	npc_msg 1
	return

scr_seq_0003_0211:
	npc_msg 7
	return

scr_seq_0003_0216:
	apply_movement VAR_SPECIAL_x8007, scr_seq_0003_1064
	wait_movement
	party_count_not_egg VAR_SPECIAL_x8006
	pokecen_anim VAR_SPECIAL_x8006
	apply_movement VAR_SPECIAL_x8007, scr_seq_0003_107C
	wait_movement
	get_lead_mon_index VAR_SPECIAL_x8008
	heal_party
	return

scr_seq_0003_023A:
	comparevartovalue VAR_SPECIAL_x8004, 1
	gotoif eq, scr_seq_0003_02CB
	npc_msg 2
	apply_movement 255, scr_seq_0003_0468
	wait_movement
	get_trcard_stars VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0003_026F
	scrcmd_188 1024
	goto scr_seq_0003_0273

scr_seq_0003_026F:
	scrcmd_188 1
scr_seq_0003_0273:
	scrcmd_189
	get_lead_mon_index VAR_SPECIAL_x8009
	comparevartovar VAR_SPECIAL_x8008, VAR_SPECIAL_x8009
	gotoif eq, scr_seq_0003_02B2
	wait 15, VAR_SPECIAL_x800A
	fade_screen 6, 1, 0, 0
	wait_fade
	closemsg
	scrcmd_436
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	bufferpartymonnick 0, VAR_SPECIAL_x8009
	npc_msg 102
scr_seq_0003_02B2:
	apply_movement VAR_SPECIAL_x8007, scr_seq_0003_0454
	wait_movement
	npc_msg 3
	waitbutton
	closemsg
	scrcmd_747
	releaseall
	endstd
	end

scr_seq_0003_02CB:
	npc_msg 8
	apply_movement 255, scr_seq_0003_0468
	wait_movement
	get_trcard_stars VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0003_02F3
	scrcmd_188 1024
	goto scr_seq_0003_02F7

scr_seq_0003_02F3:
	scrcmd_188 1
scr_seq_0003_02F7:
	scrcmd_189
	get_lead_mon_index VAR_SPECIAL_x8009
	comparevartovar VAR_SPECIAL_x8008, VAR_SPECIAL_x8009
	gotoif eq, scr_seq_0003_0336
	wait 15, VAR_SPECIAL_x800A
	fade_screen 6, 1, 0, 0
	wait_fade
	closemsg
	scrcmd_436
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	bufferpartymonnick 0, VAR_SPECIAL_x8009
	npc_msg 102
scr_seq_0003_0336:
	apply_movement VAR_SPECIAL_x8007, scr_seq_0003_0454
	wait_movement
	npc_msg 9
	waitbutton
	closemsg
	releaseall
	endstd
	end

scr_seq_0003_034D:
	scrcmd_238 32774
	comparevartovalue VAR_SPECIAL_x8006, 1
	gotoif eq, scr_seq_0003_0364
	goto scr_seq_0003_023A

scr_seq_0003_0364:
	setflag FLAG_UNK_065
	scrcmd_148 1, 0
	apply_movement 255, scr_seq_0003_0468
	wait_movement
	get_trcard_stars VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0003_0391
	scrcmd_188 1024
	goto scr_seq_0003_0395

scr_seq_0003_0391:
	scrcmd_188 1
scr_seq_0003_0395:
	scrcmd_189
	get_lead_mon_index VAR_SPECIAL_x8009
	comparevartovar VAR_SPECIAL_x8008, VAR_SPECIAL_x8009
	gotoif eq, scr_seq_0003_03D4
	wait 15, VAR_SPECIAL_x800A
	fade_screen 6, 1, 0, 0
	wait_fade
	closemsg
	scrcmd_436
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	bufferpartymonnick 0, VAR_SPECIAL_x8009
	npc_msg 102
scr_seq_0003_03D4:
	npc_msg 10
	waitbutton
	closemsg
	scrcmd_747
	releaseall
	endstd
	end

scr_seq_0003_03E3:
	checkflag FLAG_NURSE_NOTICED_CARD
	gotoif TRUE, scr_seq_0003_041D
	setflag FLAG_NURSE_NOTICED_CARD
	npc_msg 4
	buffer_players_name 0
	npc_msg 5
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0003_0445
	npc_msg 9
	waitbutton
	closemsg
	releaseall
	endstd
	end

scr_seq_0003_041D:
	buffer_players_name 0
	npc_msg 6
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0003_0445
	npc_msg 9
	waitbutton
	closemsg
	releaseall
	endstd
	end

scr_seq_0003_0445:
	setvar VAR_SPECIAL_x8004, 1
	goto scr_seq_0003_01AA

scr_seq_0003_0451:
	.byte 0x00, 0x00, 0x00

scr_seq_0003_0454:
	.short 100, 1
	.short 62, 1
	.short 254, 0

scr_seq_0003_0460:
	.short 102, 1
	.short 254, 0

scr_seq_0003_0468:
	.short 104, 1
	.short 254, 0
scr_seq_0003_0470:
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_436
	play_fanfare SEQ_ME_ASA
	wait_fanfare
	heal_party
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	endstd
	end

scr_seq_0003_0498:
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0003_04D6
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0003_04DD
	scrcmd_060 VAR_SPECIAL_x800C
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0003_04DD
	scrcmd_057 2
	endstd
	end

scr_seq_0003_04D6:
	scrcmd_057 2
	endstd
	end

scr_seq_0003_04DD:
	scrcmd_057 4
	scrcmd_058
	scrcmd_061
	endstd
	end

scr_seq_0003_04E8:
	call scr_seq_0003_04F2
	endstd
	end

scr_seq_0003_04F2:
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 7
	gotoif eq, scr_seq_0003_0574
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0003_0568
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_0003_0568
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0003_0568
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0003_0568
	comparevartovalue VAR_SPECIAL_x8008, 6
	gotoif eq, scr_seq_0003_0568
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, scr_seq_0003_057A
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0003_056E
	end

scr_seq_0003_0568:
	play_fanfare SEQ_ME_ITEM
	return

scr_seq_0003_056E:
	play_fanfare SEQ_ME_WAZA
	return

scr_seq_0003_0574:
	play_fanfare SEQ_ME_KEYITEM
	return

scr_seq_0003_057A:
	play_fanfare SEQ_ME_HYOUKA2
	return

scr_seq_0003_0580:
	.byte 0x15, 0x00, 0x02, 0x00
scr_seq_0003_0584:
	scrcmd_609
	lockall
	get_party_count VAR_SPECIAL_x8004
	setvar VAR_SPECIAL_x8005, 0
scr_seq_0003_0592:
	scrcmd_435 32780, 32773
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0003_05AD
	bufferpartymonnick 0, VAR_SPECIAL_x8005
	npc_msg 53
scr_seq_0003_05AD:
	addvar VAR_SPECIAL_x8005, 1
	comparevartovar VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	gotoif ne, scr_seq_0003_0592
	scrcmd_357 32780, 6
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0003_05F5
	closemsg
	releaseall
	end

scr_seq_0003_05D9:
	fade_screen 6, 1, 1, 0
	wait_fade
	scrcmd_049
	fade_screen 6, 1, 0, 0
	wait_fade
	end

scr_seq_0003_05F5:
	buffer_players_name 0
	npc_msg 11
	scrcmd_049
	closemsg
	fade_out_bgm 0, 10
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_436
	scrcmd_279
	end

scr_seq_0003_0617:
	clearflag FLAG_UNK_020
	call scr_seq_0003_0646
	scrcmd_347 32780
	closemsg
	end

scr_seq_0003_0629:
	npc_msg 20
	scrcmd_049
	closemsg
	end

scr_seq_0003_0632:
	setflag FLAG_UNK_020
	call scr_seq_0003_0646
	copyvar VAR_TEMP_x4000, VAR_SPECIAL_x800C
	endstd
	end

scr_seq_0003_0646:
	scrcmd_593
	npc_msg 13
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0003_0740
	scrcmd_253 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0003_0698
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0003_06BD
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, scr_seq_0003_06A9
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, scr_seq_0003_06C6
	end

scr_seq_0003_0698:
	scrcmd_594
	scrcmd_747
	npc_msg 20
	scrcmd_049
	setvar VAR_SPECIAL_x800C, 0
	return

scr_seq_0003_06A9:
	npc_msg 14
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0003_0740
scr_seq_0003_06BD:
	npc_msg 21
	goto scr_seq_0003_06F2

scr_seq_0003_06C6:
	npc_msg 14
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0003_0740
	checkflag FLAG_UNK_020
	gotoif FALSE, scr_seq_0003_076A
	checkflag FLAG_UNK_020
	gotoif TRUE, scr_seq_0003_0775
	end

scr_seq_0003_06F2:
	scrcmd_512
	wait 2, VAR_SPECIAL_x800C
	call scr_seq_0003_0708
	scrcmd_513
	goto scr_seq_0003_071D

scr_seq_0003_0708:
	scrcmd_345
	checkflag FLAG_UNK_020
	callif TRUE, scr_seq_0003_0762
	scrcmd_254 32780
	scrcmd_346
	return

scr_seq_0003_071D:
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0003_074C
	buffer_players_name 0
	npc_msg 16
	play_se SEQ_SE_DP_SAVE
	wait_se SEQ_SE_DP_SAVE
	scrcmd_348 30
	scrcmd_594
	return

scr_seq_0003_0740:
	scrcmd_594
	scrcmd_747
	setvar VAR_SPECIAL_x800C, 0
	return

scr_seq_0003_074C:
	npc_msg 18
	scrcmd_049
	scrcmd_594
	scrcmd_747
	return

scr_seq_0003_0757:
	npc_msg 21
	goto scr_seq_0003_06F2

scr_seq_0003_0760:
	.byte 0x02, 0x00
scr_seq_0003_0762:
	scrcmd_641
	clearflag FLAG_UNK_020
	return

scr_seq_0003_076A:
	npc_msg 15
	goto scr_seq_0003_06F2

scr_seq_0003_0773:
	.byte 0x02, 0x00
scr_seq_0003_0775:
	scrcmd_642 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0003_0757
	goto scr_seq_0003_076A

scr_seq_0003_078C:
	.byte 0x02, 0x00
scr_seq_0003_078E:
	call scr_seq_0003_07AA
	npc_msg 32
	scrcmd_049
	endstd
	end

scr_seq_0003_079D:
	call scr_seq_0003_07AA
	npc_msg 90
	endstd
	end

scr_seq_0003_07AA:
	play_fanfare SEQ_ME_ACCE
	scrcmd_403 32772, 32773
	scrcmd_516 0, 32772
	npc_msg 25
	wait_fanfare
	buffer_players_name 0
	scrcmd_516 1, 32772
	return

scr_seq_0003_07C8:
	call scr_seq_0003_07E4
	npc_msg 32
	scrcmd_049
	endstd
	end

scr_seq_0003_07D7:
	call scr_seq_0003_07E4
	npc_msg 90
	endstd
	end

scr_seq_0003_07E4:
	play_fanfare SEQ_ME_ACCE
	scrcmd_406 32772
	scrcmd_531 0, 32772
	npc_msg 25
	wait_fanfare
	buffer_players_name 0
	scrcmd_531 1, 32772
	return

scr_seq_0003_0800:
	call scr_seq_0003_080A
	endstd
	end

scr_seq_0003_080A:
	call scr_seq_0003_04F2
	giveitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 7
	callif eq, scr_seq_0003_0892
	comparevartovalue VAR_SPECIAL_x800C, 7
	callif ne, scr_seq_0003_08A3
	comparevartovalue VAR_SPECIAL_x8005, 1
	gotoif gt, scr_seq_0003_084E
	npc_msg 30
	goto scr_seq_0003_0851

scr_seq_0003_084E:
	npc_msg 31
scr_seq_0003_0851:
	waitbutton
	return

scr_seq_0003_0855:
	call scr_seq_0003_085F
	endstd
	end

scr_seq_0003_085F:
	call scr_seq_0003_04F2
	giveitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 7
	callif eq, scr_seq_0003_0892
	comparevartovalue VAR_SPECIAL_x800C, 7
	callif ne, scr_seq_0003_08A3
	npc_msg 89
	return

scr_seq_0003_0892:
	buffer_players_name 0
	scrcmd_194 1, 32772
	npc_msg 28
	goto scr_seq_0003_08C9

scr_seq_0003_08A3:
	comparevartovalue VAR_SPECIAL_x8005, 1
	gotoif gt, scr_seq_0003_08BB
	scrcmd_194 0, 32772
	goto scr_seq_0003_08C0

scr_seq_0003_08BB:
	scrcmd_844 0, 32772
scr_seq_0003_08C0:
	npc_msg 25
	goto scr_seq_0003_08C9

scr_seq_0003_08C9:
	wait_fanfare
	buffer_players_name 0
	comparevartovalue VAR_SPECIAL_x8005, 1
	gotoif gt, scr_seq_0003_08E6
	scrcmd_194 1, 32772
	goto scr_seq_0003_08EB

scr_seq_0003_08E6:
	scrcmd_844 1, 32772
scr_seq_0003_08EB:
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 7
	gotoif eq, scr_seq_0003_0972
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0003_0961
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_0003_09B6
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0003_09A5
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0003_09C7
	comparevartovalue VAR_SPECIAL_x8008, 6
	gotoif eq, scr_seq_0003_0983
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, scr_seq_0003_0994
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0003_09D8
	end

scr_seq_0003_0961:
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_195 2, 32780
	goto scr_seq_0003_09E9

scr_seq_0003_0972:
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_195 2, 32780
	goto scr_seq_0003_09E9

scr_seq_0003_0983:
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_195 2, 32780
	goto scr_seq_0003_09E9

scr_seq_0003_0994:
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_195 2, 32780
	goto scr_seq_0003_09E9

scr_seq_0003_09A5:
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_195 2, 32780
	goto scr_seq_0003_09E9

scr_seq_0003_09B6:
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_195 2, 32780
	goto scr_seq_0003_09E9

scr_seq_0003_09C7:
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_195 2, 32780
	goto scr_seq_0003_09E9

scr_seq_0003_09D8:
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_195 2, 32780
	goto scr_seq_0003_09E9

scr_seq_0003_09E9:
	return

scr_seq_0003_09EB:
	call scr_seq_0003_09F5
	endstd
	end

scr_seq_0003_09F5:
	npc_msg 27
	waitbutton
	return

scr_seq_0003_09FC:
	scrcmd_609
	lockall
	play_se SEQ_SE_DP_PC_ON
	call scr_seq_0003_0A18
	buffer_players_name 0
	npc_msg 33
	scrcmd_746
	goto scr_seq_0003_0A2E

scr_seq_0003_0A18:
	scrcmd_500 90
	scrcmd_501 90
	scrcmd_308 90
	return

scr_seq_0003_0A23:
	scrcmd_502 90
	scrcmd_308 90
	scrcmd_309 90
	return

scr_seq_0003_0A2E:
	buffer_players_name 0
	npc_msg 34
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x8006
	checkflag FLAG_UNK_976
	callif FALSE, scr_seq_0003_0A78
	checkflag FLAG_UNK_976
	callif TRUE, scr_seq_0003_0A82
	scrcmd_751 63, 255, 1
	checkflag FLAG_UNK_964
	gotoif TRUE, scr_seq_0003_0A8C
	checkflag FLAG_UNK_964
	gotoif FALSE, scr_seq_0003_0AD1
	goto scr_seq_0003_0AD1

scr_seq_0003_0A76:
	.byte 0x02, 0x00
scr_seq_0003_0A78:
	scrcmd_751 61, 255, 0
	return

scr_seq_0003_0A82:
	scrcmd_751 62, 255, 0
	return

scr_seq_0003_0A8C:
	scrcmd_751 64, 255, 2
	scrcmd_751 66, 255, 3
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x8006
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0003_0B01
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0003_0C23
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0003_0DBA
	goto scr_seq_0003_0DF0

scr_seq_0003_0AD1:
	scrcmd_751 66, 255, 2
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x8006
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0003_0B01
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0003_0C23
	goto scr_seq_0003_0DF0

scr_seq_0003_0B01:
	play_se SEQ_SE_DP_PC_LOGIN
	buffer_players_name 0
	npc_msg 35
	call scr_seq_0003_0B17
	goto scr_seq_0003_0B53

scr_seq_0003_0B17:
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 67, 76, 0
	scrcmd_751 68, 77, 1
	scrcmd_751 69, 78, 2
	scrcmd_751 70, 79, 3
	scrcmd_751 72, 81, 5
	return

scr_seq_0003_0B49:
	.byte 0x46, 0x00, 0x47, 0x00, 0x50, 0x00, 0x04
	.byte 0x00, 0x1b, 0x00
scr_seq_0003_0B53:
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0003_0BA2
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0003_0BB5
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0003_0BC8
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0003_0BDB
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_0003_0BEE
	goto scr_seq_0003_0A2E

scr_seq_0003_0BA2:
	closemsg
	call scr_seq_0003_0E16
	scrcmd_158 0
	scrcmd_150
	goto scr_seq_0003_0C01

scr_seq_0003_0BB5:
	closemsg
	call scr_seq_0003_0E16
	scrcmd_158 1
	scrcmd_150
	goto scr_seq_0003_0C01

scr_seq_0003_0BC8:
	closemsg
	call scr_seq_0003_0E16
	scrcmd_158 2
	scrcmd_150
	goto scr_seq_0003_0C01

scr_seq_0003_0BDB:
	closemsg
	call scr_seq_0003_0E16
	scrcmd_158 3
	scrcmd_150
	goto scr_seq_0003_0C01

scr_seq_0003_0BEE:
	closemsg
	call scr_seq_0003_0E16
	scrcmd_158 4
	scrcmd_150
	goto scr_seq_0003_0C01

scr_seq_0003_0C01:
	buffer_players_name 0
	non_npc_msg 34
	call scr_seq_0003_0B17
	call scr_seq_0003_0A18
	fade_screen 6, 1, 1, 0
	goto scr_seq_0003_0B53

scr_seq_0003_0C23:
	play_se SEQ_SE_DP_PC_LOGIN
	buffer_players_name 0
	npc_msg 36
	goto scr_seq_0003_0C33

scr_seq_0003_0C33:
	call scr_seq_0003_0CA7
scr_seq_0003_0C39:
	scrcmd_616 16384
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_0003_0C72
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0003_0CEC
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0003_0D3A
	goto scr_seq_0003_0A2E

scr_seq_0003_0C72:
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0003_0CEC
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0003_0D3A
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0003_0D86
	goto scr_seq_0003_0A2E

scr_seq_0003_0CA7:
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 73, 82, 0
	scrcmd_751 74, 83, 1
	scrcmd_616 16384
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_0003_0CDA
	scrcmd_751 75, 84, 2
	return

scr_seq_0003_0CDA:
	scrcmd_751 65, 85, 2
	scrcmd_751 75, 84, 3
	return

scr_seq_0003_0CEC:
	closemsg
	scrcmd_377 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0003_0D0F
	call scr_seq_0003_0E16
	scrcmd_376
	scrcmd_150
	goto scr_seq_0003_0D18

scr_seq_0003_0D0F:
	npc_msg 47
	goto scr_seq_0003_0C33

scr_seq_0003_0D18:
	buffer_players_name 0
	non_npc_msg 34
	call scr_seq_0003_0CA7
	call scr_seq_0003_0A18
	fade_screen 6, 1, 1, 0
	goto scr_seq_0003_0C39

scr_seq_0003_0D3A:
	scrcmd_572 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0003_0D5B
	closemsg
	call scr_seq_0003_0E16
	scrcmd_156
	goto scr_seq_0003_0D64

scr_seq_0003_0D5B:
	npc_msg 79
	goto scr_seq_0003_0C33

scr_seq_0003_0D64:
	buffer_players_name 0
	non_npc_msg 34
	call scr_seq_0003_0CA7
	call scr_seq_0003_0A18
	fade_screen 6, 1, 1, 0
	goto scr_seq_0003_0C39

scr_seq_0003_0D86:
	closemsg
	call scr_seq_0003_0E16
	scrcmd_617
	scrcmd_150
	goto scr_seq_0003_0D98

scr_seq_0003_0D98:
	buffer_players_name 0
	non_npc_msg 34
	call scr_seq_0003_0CA7
	call scr_seq_0003_0A18
	fade_screen 6, 1, 1, 0
	goto scr_seq_0003_0C39

scr_seq_0003_0DBA:
	play_se SEQ_SE_DP_PC_LOGIN
	closemsg
	scrcmd_706 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0003_0DE7
	call scr_seq_0003_0E16
	scrcmd_164
	scrcmd_150
	call scr_seq_0003_0E02
	goto scr_seq_0003_0A2E

scr_seq_0003_0DE7:
	npc_msg 94
	goto scr_seq_0003_0A2E

scr_seq_0003_0DF0:
	closemsg
	play_se SEQ_SE_DP_PC_LOGOFF
	call scr_seq_0003_0A23
	scrcmd_747
	releaseall
	end

scr_seq_0003_0E02:
	call scr_seq_0003_0A18
	fade_screen 6, 1, 1, 0
	wait_fade
	return

scr_seq_0003_0E16:
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_309 90
	return

scr_seq_0003_0E27:
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_156
	fade_screen 6, 1, 1, 0
	wait_fade
	end

scr_seq_0003_0E43:
	npc_msg 38
	endstd
	end

scr_seq_0003_0E4A:
	scrcmd_609
	lockall
	apply_movement 255, scr_seq_0003_1054
	apply_movement 0, scr_seq_0003_105C
	wait_movement
	fade_screen 6, 1, 1, 0
	wait_fade
	buffer_players_name 0
	npc_msg 41
	fade_screen 6, 1, 0, 0
	wait_fade
	closemsg
	play_fanfare SEQ_ME_ASA
	wait_fanfare
	heal_party
	fade_screen 6, 1, 1, 0
	wait_fade
	npc_msg 42
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0003_0E9F:
	.byte 0x2d
	.byte 0x00, 0x2a, 0x1b, 0x00, 0x2d, 0x00, 0x2b, 0x1b, 0x00
scr_seq_0003_0EA9:
	scrcmd_609
	lockall
	fade_screen 6, 1, 1, 0
	wait_fade
	get_trcard_stars VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0003_0ED4
	scrcmd_188 2048
	goto scr_seq_0003_0ED8

scr_seq_0003_0ED4:
	scrcmd_188 256
scr_seq_0003_0ED8:
	scrcmd_189
	apply_movement 255, scr_seq_0003_0460
	wait_movement
	npc_msg 44
	call scr_seq_0003_0F89
	call scr_seq_0003_0216
	check_badge 0, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0003_0F49
	npc_msg 45
	apply_movement 255, scr_seq_0003_0468
	wait_movement
	get_trcard_stars VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0003_0F2E
	scrcmd_188 1024
	goto scr_seq_0003_0F32

scr_seq_0003_0F2E:
	scrcmd_188 1
scr_seq_0003_0F32:
	scrcmd_189
	apply_movement VAR_SPECIAL_x8007, scr_seq_0003_0454
	wait_movement
	npc_msg 46
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0003_0F49:
	apply_movement 255, scr_seq_0003_0468
	wait_movement
	get_trcard_stars VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0003_0F6E
	scrcmd_188 1024
	goto scr_seq_0003_0F72

scr_seq_0003_0F6E:
	scrcmd_188 1
scr_seq_0003_0F72:
	scrcmd_189
	apply_movement VAR_SPECIAL_x8007, scr_seq_0003_0454
	wait_movement
	npc_msg 40
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0003_0F89:
	scrcmd_446 32772
	comparevartovalue VAR_SPECIAL_x8004, 69
	gotoif eq, scr_seq_0003_100A
	comparevartovalue VAR_SPECIAL_x8004, 158
	gotoif eq, scr_seq_0003_1012
	comparevartovalue VAR_SPECIAL_x8004, 166
	gotoif eq, scr_seq_0003_101A
	comparevartovalue VAR_SPECIAL_x8004, 236
	gotoif eq, scr_seq_0003_1022
	comparevartovalue VAR_SPECIAL_x8004, 185
	gotoif eq, scr_seq_0003_102A
	comparevartovalue VAR_SPECIAL_x8004, 81
	gotoif eq, scr_seq_0003_1032
	comparevartovalue VAR_SPECIAL_x8004, 246
	gotoif eq, scr_seq_0003_103A
	comparevartovalue VAR_SPECIAL_x8004, 293
	gotoif eq, scr_seq_0003_1042
	comparevartovalue VAR_SPECIAL_x8004, 169
	gotoif eq, scr_seq_0003_104A
	setvar VAR_SPECIAL_x8007, 0
	return

scr_seq_0003_100A:
	setvar VAR_SPECIAL_x8007, 0
	return

scr_seq_0003_1012:
	setvar VAR_SPECIAL_x8007, 3
	return

scr_seq_0003_101A:
	setvar VAR_SPECIAL_x8007, 6
	return

scr_seq_0003_1022:
	setvar VAR_SPECIAL_x8007, 3
	return

scr_seq_0003_102A:
	setvar VAR_SPECIAL_x8007, 0
	return

scr_seq_0003_1032:
	setvar VAR_SPECIAL_x8007, 0
	return

scr_seq_0003_103A:
	setvar VAR_SPECIAL_x8007, 2
	return

scr_seq_0003_1042:
	setvar VAR_SPECIAL_x8007, 3
	return

scr_seq_0003_104A:
	setvar VAR_SPECIAL_x8007, 3
	return

scr_seq_0003_1052:
	.byte 0x00, 0x00

scr_seq_0003_1054:
	.short 0, 1
	.short 254, 0

scr_seq_0003_105C:
	.short 1, 1
	.short 254, 0

scr_seq_0003_1064:
	.short 2, 1
	.short 254, 0
	.byte 0x00, 0x00, 0x01, 0x00
	.byte 0xfe, 0x00, 0x00, 0x00, 0x03, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00

scr_seq_0003_107C:
	.short 1, 1
	.short 254, 0
scr_seq_0003_1084:
	play_se SEQ_SE_DP_SELECT
	lockall
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_450
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	releaseall
	end

scr_seq_0003_10AA:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_455
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0003_10BC:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 54
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0003_10CF:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 57
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0003_10E2:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 58
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0003_10F5:
	hasitem ITEM_BICYCLE, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0003_1163
	scrcmd_609
	lockall
	play_se SEQ_SE_DP_SELECT
	scrcmd_184 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0003_1140
	npc_msg 59
	scrcmd_063 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0003_115D
	scrcmd_185 1
	closemsg
	releaseall
	end

scr_seq_0003_1140:
	npc_msg 60
	scrcmd_063 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0003_115D
	scrcmd_185 0
	closemsg
	releaseall
	end

scr_seq_0003_115D:
	closemsg
	releaseall
	end

scr_seq_0003_1163:
	end

scr_seq_0003_1165:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 62
	scrcmd_049
	fade_screen 6, 1, 0, 0
	wait_fade
	closemsg
	scrcmd_369
	fade_screen 6, 1, 1, 0
	wait_fade
	releaseall
	end

scr_seq_0003_1190:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 65
	scrcmd_049
	closemsg
	releaseall
	end

scr_seq_0003_11A1:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 103
	scrcmd_746
scr_seq_0003_11AE:
	scrcmd_750 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 112, 255, 0
	scrcmd_751 113, 255, 1
	scrcmd_751 114, 255, 2
	scrcmd_751 115, 255, 3
	scrcmd_751 116, 255, 4
	scrcmd_752
	comparevartovalue VAR_SPECIAL_x800C, 4
	gotoif ge, scr_seq_0003_1277
	setvar VAR_SPECIAL_x8004, 104
	addvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_046 VAR_SPECIAL_x8004
	fade_screen 6, 1, 0, 0
	wait_fade
	closemsg
	setvar VAR_SPECIAL_x8000, 2
	addvar VAR_SPECIAL_x8000, VAR_SPECIAL_x800C
	scrcmd_492 VAR_SPECIAL_x8000, VAR_SPECIAL_x800C, VAR_SPECIAL_x8001
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0003_1277
	npc_msg 109
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0003_11AE
	comparevartovalue VAR_SPECIAL_x8001, 65535
	gotoif eq, scr_seq_0003_126A
	scrcmd_494 0, VAR_SPECIAL_x8001
	npc_msg 111
	goto scr_seq_0003_126D

scr_seq_0003_126A:
	npc_msg 110
scr_seq_0003_126D:
	waitbutton
	closemsg
	scrcmd_747
	releaseall
	end

scr_seq_0003_1277:
	npc_msg 108
	goto scr_seq_0003_126D

scr_seq_0003_1280:
	.byte 0x02, 0x00
scr_seq_0003_1282:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 68
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0003_1295:
	end

scr_seq_0003_1297:
	scrcmd_609
	lockall
	releaseall
	end

scr_seq_0003_129F:
	.byte 0x2d
	.byte 0x00, 0x58, 0x32, 0x00, 0x35, 0x00, 0x61, 0x00, 0x02, 0x00, 0x35, 0x00, 0x61, 0x00, 0x02, 0x00
scr_seq_0003_12B0:
	scrcmd_081 0
	get_player_gender VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	callif eq, scr_seq_0003_12D6
	comparevartovalue VAR_SPECIAL_x800C, 1
	callif eq, scr_seq_0003_12DC
	endstd
	end

scr_seq_0003_12D6:
	temp_bgm SEQ_GS_E_SUPPORT_F
	return

scr_seq_0003_12DC:
	temp_bgm SEQ_GS_E_SUPPORT_M
	return

scr_seq_0003_12E2:
	scrcmd_081 0
	temp_bgm SEQ_GS_E_RIVAL1
	endstd
	end

scr_seq_0003_12EE:
	scrcmd_081 0
	temp_bgm SEQ_GS_E_RIVAL2
	endstd
	end

scr_seq_0003_12FA:
	scrcmd_081 0
	temp_bgm SEQ_GS_E_MINAKI
	endstd
	end

scr_seq_0003_1306:
	scrcmd_081 0
	temp_bgm SEQ_GS_IBUKI
	endstd
	end

scr_seq_0003_1312:
	scrcmd_081 0
	temp_bgm SEQ_GS_E_TSURETEKE1
	endstd
	end

scr_seq_0003_131E:
	scrcmd_081 0
	temp_bgm SEQ_GS_E_TSURETEKE2
	endstd
	end

scr_seq_0003_132A:
	scrcmd_081 0
	temp_bgm SEQ_GS_E_G_PICHU
	endstd
	end

scr_seq_0003_1336:
	scrcmd_081 0
	temp_bgm SEQ_GS_E_MAIKO_THEME
	endstd
	end

scr_seq_0003_1342:
	fade_out_bgm 0, 30
	scrcmd_081 0
	reset_bgm
	endstd
	end

scr_seq_0003_1352:
	scrcmd_430 32772, 32773, 32774
	call scr_seq_0003_136C
	endstd
	end

scr_seq_0003_1364:
	call scr_seq_0003_136C
	end

scr_seq_0003_136C:
	play_se SEQ_SE_GS_PHONE0
	wait_se SEQ_SE_GS_PHONE0
	play_se SEQ_SE_GS_PHONE0
	wait_se SEQ_SE_GS_PHONE0
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_431
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	return

scr_seq_0003_139A:
	checkflag FLAG_UNK_0FD
	gotoif TRUE, scr_seq_0003_13F6
	comparevartovalue VAR_UNK_404E, 4
	gotoif ne, scr_seq_0003_13F6
	comparevartovalue VAR_UNK_404F, 4
	gotoif ne, scr_seq_0003_13F6
	comparevartovalue VAR_UNK_4050, 4
	gotoif ne, scr_seq_0003_13F6
	comparevartovalue VAR_UNK_4051, 4
	gotoif ne, scr_seq_0003_13F6
	comparevartovalue VAR_UNK_404D, 4
	gotoif ne, scr_seq_0003_13F6
	setflag FLAG_UNK_0FD
	scrcmd_680 31
	goto scr_seq_0003_13F6

scr_seq_0003_13F4:
	.byte 0x02, 0x00
scr_seq_0003_13F6:
	endstd
	end

scr_seq_0003_13FA:
	npc_msg 93
	waitbutton
	closemsg
	releaseall
	endstd
	end

scr_seq_0003_1407:
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_166 32780
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_662 32773, 32772, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0003_1444
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	endstd
	end

scr_seq_0003_1444:
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	endstd
	end

scr_seq_0003_1456:
	goto scr_seq_0003_145E

scr_seq_0003_145C:
	.byte 0x02, 0x00
scr_seq_0003_145E:
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 321, 255, 0
	scrcmd_751 322, 255, 1
	scrcmd_751 323, 255, 2
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0003_14B1
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0003_14BD
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0003_14C7
	end

scr_seq_0003_14B1:
	scrcmd_275 32772
	goto scr_seq_0003_14DD

scr_seq_0003_14BB:
	.byte 0x02, 0x00
scr_seq_0003_14BD:
	scrcmd_782
	goto scr_seq_0003_14DD

scr_seq_0003_14C5:
	.byte 0x02, 0x00
scr_seq_0003_14C7:
	scrcmd_747
	get_std_msg_naix 3, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 1
	waitbutton
	closemsg
	endstd
	end

scr_seq_0003_14DD:
	get_std_msg_naix 3, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 6
	scrcmd_054
	goto scr_seq_0003_145E

scr_seq_0003_14F1:
	.byte 0x02, 0x00
scr_seq_0003_14F3:
	goto scr_seq_0003_14FB

scr_seq_0003_14F9:
	.byte 0x02, 0x00
scr_seq_0003_14FB:
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 321, 255, 0
	scrcmd_751 322, 255, 1
	scrcmd_751 323, 255, 2
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0003_154E
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0003_155A
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0003_1564
	end

scr_seq_0003_154E:
	scrcmd_276 32772
	goto scr_seq_0003_15A6

scr_seq_0003_1558:
	.byte 0x02, 0x00
scr_seq_0003_155A:
	scrcmd_782
	goto scr_seq_0003_15A6

scr_seq_0003_1562:
	.byte 0x02, 0x00
scr_seq_0003_1564:
	scrcmd_747
	checkflag FLAG_UNK_16F
	gotoif TRUE, scr_seq_0003_15E8
	checkflag FLAG_UNK_170
	gotoif TRUE, scr_seq_0003_160C
	checkflag FLAG_UNK_171
	gotoif TRUE, scr_seq_0003_1630
	checkflag FLAG_UNK_18A
	gotoif TRUE, scr_seq_0003_1654
	get_std_msg_naix 3, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 1
scr_seq_0003_159E:
	waitbutton
	closemsg
	endstd
	end

scr_seq_0003_15A6:
	checkflag FLAG_UNK_16F
	gotoif TRUE, scr_seq_0003_15FA
	checkflag FLAG_UNK_170
	gotoif TRUE, scr_seq_0003_161E
	checkflag FLAG_UNK_171
	gotoif TRUE, scr_seq_0003_1642
	checkflag FLAG_UNK_18A
	gotoif TRUE, scr_seq_0003_1666
	get_std_msg_naix 3, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 6
scr_seq_0003_15DE:
	scrcmd_054
	goto scr_seq_0003_14FB

scr_seq_0003_15E6:
	.byte 0x02, 0x00
scr_seq_0003_15E8:
	get_std_msg_naix 3, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 2
	goto scr_seq_0003_159E

scr_seq_0003_15FA:
	get_std_msg_naix 3, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 7
	goto scr_seq_0003_15DE

scr_seq_0003_160C:
	get_std_msg_naix 3, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 3
	goto scr_seq_0003_159E

scr_seq_0003_161E:
	get_std_msg_naix 3, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 8
	goto scr_seq_0003_15DE

scr_seq_0003_1630:
	get_std_msg_naix 3, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 4
	goto scr_seq_0003_159E

scr_seq_0003_1642:
	get_std_msg_naix 3, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 9
	goto scr_seq_0003_15DE

scr_seq_0003_1654:
	get_std_msg_naix 3, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 5
	goto scr_seq_0003_159E

scr_seq_0003_1666:
	get_std_msg_naix 3, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 10
	goto scr_seq_0003_15DE

scr_seq_0003_1678:
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 321, 255, 0
	scrcmd_751 324, 255, 1
	scrcmd_751 323, 255, 2
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0003_16CB
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0003_16D1
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0003_16D7
	end

scr_seq_0003_16CB:
	scrcmd_771
	endstd
	end

scr_seq_0003_16D1:
	scrcmd_747
	endstd
	end

scr_seq_0003_16D7:
	scrcmd_747
	endstd
	end

scr_seq_0003_16DD:
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 321, 255, 0
	scrcmd_751 324, 255, 1
	scrcmd_751 323, 255, 2
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0003_1730
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0003_1736
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0003_173C
	end

scr_seq_0003_1730:
	scrcmd_772
	endstd
	end

scr_seq_0003_1736:
	scrcmd_747
	endstd
	end

scr_seq_0003_173C:
	scrcmd_747
	endstd
	end

scr_seq_0003_1742:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_727 32773
	bufferpartymonnick 0, VAR_SPECIAL_x8005
	npc_msg 99
	closemsg
	scrcmd_806
	scrcmd_727 32773
	bufferpartymonnick 0, VAR_SPECIAL_x8005
	npc_msg 100
	scrcmd_049
	closemsg
	releaseall
	end
	.balign 4, 0
