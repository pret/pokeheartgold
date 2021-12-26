#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000003_00000498 ; 000
	scrdef scr_seq_00000003_000004E8 ; 001
	scrdef scr_seq_00000003_00000122 ; 002
	scrdef scr_seq_00000003_00000584 ; 003
	scrdef scr_seq_00000003_000005D9 ; 004
	scrdef scr_seq_00000003_00000617 ; 005
	scrdef scr_seq_00000003_00000632 ; 006
	scrdef scr_seq_00000003_0000078E ; 007
	scrdef scr_seq_00000003_00000800 ; 008
	scrdef scr_seq_00000003_000009EB ; 009
	scrdef scr_seq_00000003_000009FC ; 010
	scrdef scr_seq_00000003_00000E43 ; 011
	scrdef scr_seq_00000003_00000E4A ; 012
	scrdef scr_seq_00000003_00000EA9 ; 013
	scrdef scr_seq_00000003_00000E27 ; 014
	scrdef scr_seq_00000003_00001084 ; 015
	scrdef scr_seq_00000003_000010AA ; 016
	scrdef scr_seq_00000003_000010BC ; 017
	scrdef scr_seq_00000003_000010CF ; 018
	scrdef scr_seq_00000003_000010E2 ; 019
	scrdef scr_seq_00000003_000010F5 ; 020
	scrdef scr_seq_00000003_00001165 ; 021
	scrdef scr_seq_00000003_00001190 ; 022
	scrdef scr_seq_00000003_000011A1 ; 023
	scrdef scr_seq_00000003_00000629 ; 024
	scrdef scr_seq_00000003_00001282 ; 025
	scrdef scr_seq_00000003_000007C8 ; 026
	scrdef scr_seq_00000003_00001295 ; 027
	scrdef scr_seq_00000003_00001297 ; 028
	scrdef scr_seq_00000003_000012B0 ; 029
	scrdef scr_seq_00000003_00001342 ; 030
	scrdef scr_seq_00000003_000012E2 ; 031
	scrdef scr_seq_00000003_00001342 ; 032
	scrdef scr_seq_00000003_00000855 ; 033
	scrdef scr_seq_00000003_000007D7 ; 034
	scrdef scr_seq_00000003_0000079D ; 035
	scrdef scr_seq_00000003_00001312 ; 036
	scrdef scr_seq_00000003_0000131E ; 037
	scrdef scr_seq_00000003_00001342 ; 038
	scrdef scr_seq_00000003_00001352 ; 039
	scrdef scr_seq_00000003_0000139A ; 040
	scrdef scr_seq_00000003_000013FA ; 041
	scrdef scr_seq_00000003_000012FA ; 042
	scrdef scr_seq_00000003_00001342 ; 043
	scrdef scr_seq_00000003_00001306 ; 044
	scrdef scr_seq_00000003_00001342 ; 045
	scrdef scr_seq_00000003_00001407 ; 046
	scrdef scr_seq_00000003_00001364 ; 047
	scrdef scr_seq_00000003_00001456 ; 048
	scrdef scr_seq_00000003_000014B1 ; 049
	scrdef scr_seq_00000003_000014BD ; 050
	scrdef scr_seq_00000003_000014C7 ; 051
	scrdef scr_seq_00000003_000014F3 ; 052
	scrdef scr_seq_00000003_0000154E ; 053
	scrdef scr_seq_00000003_0000155A ; 054
	scrdef scr_seq_00000003_00001564 ; 055
	scrdef scr_seq_00000003_00001678 ; 056
	scrdef scr_seq_00000003_000016CB ; 057
	scrdef scr_seq_00000003_000016D1 ; 058
	scrdef scr_seq_00000003_000016D7 ; 059
	scrdef scr_seq_00000003_000016DD ; 060
	scrdef scr_seq_00000003_00001730 ; 061
	scrdef scr_seq_00000003_00001736 ; 062
	scrdef scr_seq_00000003_0000173C ; 063
	scrdef scr_seq_00000003_00001742 ; 064
	scrdef scr_seq_00000003_0000132A ; 065
	scrdef scr_seq_00000003_00001342 ; 066
	scrdef scr_seq_00000003_00001336 ; 067
	scrdef scr_seq_00000003_00001342 ; 068
	scrdef scr_seq_00000003_00000470 ; 069
	scrdef scr_seq_00000003_000012EE ; 070
	scrdef scr_seq_00000003_00001342 ; 071
	scrdef_end

scr_seq_00000003_00000122:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_590 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 4
	gotoif ge, scr_seq_00000003_000003E3
	setvar VAR_SPECIAL_x8004, 0
	scrcmd_379 VAR_SPECIAL_x800C
	debugwatch VAR_SPECIAL_x800C
	setvar VAR_SPECIAL_x8004, 83
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000003_00000175
	setvar VAR_SPECIAL_x8004, 84
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000003_00000175
	setvar VAR_SPECIAL_x8004, 0
scr_seq_00000003_00000175:
	scrcmd_046 VAR_SPECIAL_x8004
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000003_000001AA
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000003_0000019B
	end

scr_seq_00000003_0000019B:
	msgbox 3
	waitbutton
	scrcmd_747
	closemsg
	releaseall
	endstd
	end

scr_seq_00000003_000001AA:
	get_trcard_stars VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_00000003_000001C5
	scrcmd_188 2048
	goto scr_seq_00000003_000001C9

scr_seq_00000003_000001C5:
	scrcmd_188 256
scr_seq_00000003_000001C9:
	scrcmd_189
	apply_movement 255, scr_seq_00000003_00000460
	wait_movement
	scrcmd_599
	scrcmd_590 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 4
	callif ge, scr_seq_00000003_00000211
	comparevartovalue VAR_SPECIAL_x800C, 4
	callif lt, scr_seq_00000003_0000020C
	call scr_seq_00000003_00000216
	checkflag FLAG_UNK_065
	gotoif FALSE, scr_seq_00000003_0000034D
	goto scr_seq_00000003_0000023A

scr_seq_00000003_0000020C:
	msgbox 1
	return

scr_seq_00000003_00000211:
	msgbox 7
	return

scr_seq_00000003_00000216:
	apply_movement VAR_SPECIAL_x8007, scr_seq_00000003_00001064
	wait_movement
	party_count_not_egg VAR_SPECIAL_x8006
	pokecen_anim VAR_SPECIAL_x8006
	apply_movement VAR_SPECIAL_x8007, scr_seq_00000003_0000107C
	wait_movement
	get_lead_mon_index VAR_SPECIAL_x8008
	heal_party
	return

scr_seq_00000003_0000023A:
	comparevartovalue VAR_SPECIAL_x8004, 1
	gotoif eq, scr_seq_00000003_000002CB
	msgbox 2
	apply_movement 255, scr_seq_00000003_00000468
	wait_movement
	get_trcard_stars VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_00000003_0000026F
	scrcmd_188 1024
	goto scr_seq_00000003_00000273

scr_seq_00000003_0000026F:
	scrcmd_188 1
scr_seq_00000003_00000273:
	scrcmd_189
	get_lead_mon_index VAR_SPECIAL_x8009
	comparevartovar VAR_SPECIAL_x8008, VAR_SPECIAL_x8009
	gotoif eq, scr_seq_00000003_000002B2
	wait 15, VAR_SPECIAL_x800A
	fade_screen 6, 1, 0, 0
	wait_fade
	closemsg
	scrcmd_436
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	bufferpartymonnick 0, VAR_SPECIAL_x8009
	msgbox 102
scr_seq_00000003_000002B2:
	apply_movement VAR_SPECIAL_x8007, scr_seq_00000003_00000454
	wait_movement
	msgbox 3
	waitbutton
	closemsg
	scrcmd_747
	releaseall
	endstd
	end

scr_seq_00000003_000002CB:
	msgbox 8
	apply_movement 255, scr_seq_00000003_00000468
	wait_movement
	get_trcard_stars VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_00000003_000002F3
	scrcmd_188 1024
	goto scr_seq_00000003_000002F7

scr_seq_00000003_000002F3:
	scrcmd_188 1
scr_seq_00000003_000002F7:
	scrcmd_189
	get_lead_mon_index VAR_SPECIAL_x8009
	comparevartovar VAR_SPECIAL_x8008, VAR_SPECIAL_x8009
	gotoif eq, scr_seq_00000003_00000336
	wait 15, VAR_SPECIAL_x800A
	fade_screen 6, 1, 0, 0
	wait_fade
	closemsg
	scrcmd_436
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	bufferpartymonnick 0, VAR_SPECIAL_x8009
	msgbox 102
scr_seq_00000003_00000336:
	apply_movement VAR_SPECIAL_x8007, scr_seq_00000003_00000454
	wait_movement
	msgbox 9
	waitbutton
	closemsg
	releaseall
	endstd
	end

scr_seq_00000003_0000034D:
	scrcmd_238 32774
	comparevartovalue VAR_SPECIAL_x8006, 1
	gotoif eq, scr_seq_00000003_00000364
	goto scr_seq_00000003_0000023A

scr_seq_00000003_00000364:
	setflag FLAG_UNK_065
	scrcmd_148 1, 0
	apply_movement 255, scr_seq_00000003_00000468
	wait_movement
	get_trcard_stars VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_00000003_00000391
	scrcmd_188 1024
	goto scr_seq_00000003_00000395

scr_seq_00000003_00000391:
	scrcmd_188 1
scr_seq_00000003_00000395:
	scrcmd_189
	get_lead_mon_index VAR_SPECIAL_x8009
	comparevartovar VAR_SPECIAL_x8008, VAR_SPECIAL_x8009
	gotoif eq, scr_seq_00000003_000003D4
	wait 15, VAR_SPECIAL_x800A
	fade_screen 6, 1, 0, 0
	wait_fade
	closemsg
	scrcmd_436
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	bufferpartymonnick 0, VAR_SPECIAL_x8009
	msgbox 102
scr_seq_00000003_000003D4:
	msgbox 10
	waitbutton
	closemsg
	scrcmd_747
	releaseall
	endstd
	end

scr_seq_00000003_000003E3:
	checkflag FLAG_NURSE_NOTICED_CARD
	gotoif TRUE, scr_seq_00000003_0000041D
	setflag FLAG_NURSE_NOTICED_CARD
	msgbox 4
	buffer_players_name 0
	msgbox 5
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000003_00000445
	msgbox 9
	waitbutton
	closemsg
	releaseall
	endstd
	end

scr_seq_00000003_0000041D:
	buffer_players_name 0
	msgbox 6
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000003_00000445
	msgbox 9
	waitbutton
	closemsg
	releaseall
	endstd
	end

scr_seq_00000003_00000445:
	setvar VAR_SPECIAL_x8004, 1
	goto scr_seq_00000003_000001AA

scr_seq_00000003_00000451:
	.byte 0x00, 0x00, 0x00

scr_seq_00000003_00000454:
	.short 100, 1
	.short 62, 1
	.short 254, 0

scr_seq_00000003_00000460:
	.short 102, 1
	.short 254, 0

scr_seq_00000003_00000468:
	.short 104, 1
	.short 254, 0
scr_seq_00000003_00000470:
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

scr_seq_00000003_00000498:
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000003_000004D6
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000003_000004DD
	scrcmd_060 VAR_SPECIAL_x800C
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000003_000004DD
	scrcmd_057 2
	endstd
	end

scr_seq_00000003_000004D6:
	scrcmd_057 2
	endstd
	end

scr_seq_00000003_000004DD:
	scrcmd_057 4
	scrcmd_058
	scrcmd_061
	endstd
	end

scr_seq_00000003_000004E8:
	call scr_seq_00000003_000004F2
	endstd
	end

scr_seq_00000003_000004F2:
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 7
	gotoif eq, scr_seq_00000003_00000574
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000003_00000568
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_00000003_00000568
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000003_00000568
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000003_00000568
	comparevartovalue VAR_SPECIAL_x8008, 6
	gotoif eq, scr_seq_00000003_00000568
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, scr_seq_00000003_0000057A
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_00000003_0000056E
	end

scr_seq_00000003_00000568:
	play_fanfare SEQ_ME_ITEM
	return

scr_seq_00000003_0000056E:
	play_fanfare SEQ_ME_WAZA
	return

scr_seq_00000003_00000574:
	play_fanfare SEQ_ME_KEYITEM
	return

scr_seq_00000003_0000057A:
	play_fanfare SEQ_ME_HYOUKA2
	return

scr_seq_00000003_00000580:
	.byte 0x15, 0x00, 0x02, 0x00
scr_seq_00000003_00000584:
	scrcmd_609
	lockall
	get_party_count VAR_SPECIAL_x8004
	setvar VAR_SPECIAL_x8005, 0
scr_seq_00000003_00000592:
	scrcmd_435 32780, 32773
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000003_000005AD
	bufferpartymonnick 0, VAR_SPECIAL_x8005
	msgbox 53
scr_seq_00000003_000005AD:
	addvar VAR_SPECIAL_x8005, 1
	comparevartovar VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	gotoif ne, scr_seq_00000003_00000592
	scrcmd_357 32780, 6
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000003_000005F5
	closemsg
	releaseall
	end

scr_seq_00000003_000005D9:
	fade_screen 6, 1, 1, 0
	wait_fade
	scrcmd_049
	fade_screen 6, 1, 0, 0
	wait_fade
	end

scr_seq_00000003_000005F5:
	buffer_players_name 0
	msgbox 11
	scrcmd_049
	closemsg
	fade_out_bgm 0, 10
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_436
	scrcmd_279
	end

scr_seq_00000003_00000617:
	clearflag FLAG_UNK_020
	call scr_seq_00000003_00000646
	scrcmd_347 32780
	closemsg
	end

scr_seq_00000003_00000629:
	msgbox 20
	scrcmd_049
	closemsg
	end

scr_seq_00000003_00000632:
	setflag FLAG_UNK_020
	call scr_seq_00000003_00000646
	copyvar VAR_TEMP_x4000, VAR_SPECIAL_x800C
	endstd
	end

scr_seq_00000003_00000646:
	scrcmd_593
	msgbox 13
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000003_00000740
	scrcmd_253 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000003_00000698
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000003_000006BD
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, scr_seq_00000003_000006A9
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, scr_seq_00000003_000006C6
	end

scr_seq_00000003_00000698:
	scrcmd_594
	scrcmd_747
	msgbox 20
	scrcmd_049
	setvar VAR_SPECIAL_x800C, 0
	return

scr_seq_00000003_000006A9:
	msgbox 14
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000003_00000740
scr_seq_00000003_000006BD:
	msgbox 21
	goto scr_seq_00000003_000006F2

scr_seq_00000003_000006C6:
	msgbox 14
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000003_00000740
	checkflag FLAG_UNK_020
	gotoif FALSE, scr_seq_00000003_0000076A
	checkflag FLAG_UNK_020
	gotoif TRUE, scr_seq_00000003_00000775
	end

scr_seq_00000003_000006F2:
	scrcmd_512
	wait 2, VAR_SPECIAL_x800C
	call scr_seq_00000003_00000708
	scrcmd_513
	goto scr_seq_00000003_0000071D

scr_seq_00000003_00000708:
	scrcmd_345
	checkflag FLAG_UNK_020
	callif TRUE, scr_seq_00000003_00000762
	scrcmd_254 32780
	scrcmd_346
	return

scr_seq_00000003_0000071D:
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000003_0000074C
	buffer_players_name 0
	msgbox 16
	play_se SEQ_SE_DP_SAVE
	wait_se SEQ_SE_DP_SAVE
	scrcmd_348 30
	scrcmd_594
	return

scr_seq_00000003_00000740:
	scrcmd_594
	scrcmd_747
	setvar VAR_SPECIAL_x800C, 0
	return

scr_seq_00000003_0000074C:
	msgbox 18
	scrcmd_049
	scrcmd_594
	scrcmd_747
	return

scr_seq_00000003_00000757:
	msgbox 21
	goto scr_seq_00000003_000006F2

scr_seq_00000003_00000760:
	.byte 0x02, 0x00
scr_seq_00000003_00000762:
	scrcmd_641
	clearflag FLAG_UNK_020
	return

scr_seq_00000003_0000076A:
	msgbox 15
	goto scr_seq_00000003_000006F2

scr_seq_00000003_00000773:
	.byte 0x02, 0x00
scr_seq_00000003_00000775:
	scrcmd_642 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000003_00000757
	goto scr_seq_00000003_0000076A

scr_seq_00000003_0000078C:
	.byte 0x02, 0x00
scr_seq_00000003_0000078E:
	call scr_seq_00000003_000007AA
	msgbox 32
	scrcmd_049
	endstd
	end

scr_seq_00000003_0000079D:
	call scr_seq_00000003_000007AA
	msgbox 90
	endstd
	end

scr_seq_00000003_000007AA:
	play_fanfare SEQ_ME_ACCE
	scrcmd_403 32772, 32773
	scrcmd_516 0, 32772
	msgbox 25
	wait_fanfare
	buffer_players_name 0
	scrcmd_516 1, 32772
	return

scr_seq_00000003_000007C8:
	call scr_seq_00000003_000007E4
	msgbox 32
	scrcmd_049
	endstd
	end

scr_seq_00000003_000007D7:
	call scr_seq_00000003_000007E4
	msgbox 90
	endstd
	end

scr_seq_00000003_000007E4:
	play_fanfare SEQ_ME_ACCE
	scrcmd_406 32772
	scrcmd_531 0, 32772
	msgbox 25
	wait_fanfare
	buffer_players_name 0
	scrcmd_531 1, 32772
	return

scr_seq_00000003_00000800:
	call scr_seq_00000003_0000080A
	endstd
	end

scr_seq_00000003_0000080A:
	call scr_seq_00000003_000004F2
	giveitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 7
	callif eq, scr_seq_00000003_00000892
	comparevartovalue VAR_SPECIAL_x800C, 7
	callif ne, scr_seq_00000003_000008A3
	comparevartovalue VAR_SPECIAL_x8005, 1
	gotoif gt, scr_seq_00000003_0000084E
	msgbox 30
	goto scr_seq_00000003_00000851

scr_seq_00000003_0000084E:
	msgbox 31
scr_seq_00000003_00000851:
	waitbutton
	return

scr_seq_00000003_00000855:
	call scr_seq_00000003_0000085F
	endstd
	end

scr_seq_00000003_0000085F:
	call scr_seq_00000003_000004F2
	giveitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 7
	callif eq, scr_seq_00000003_00000892
	comparevartovalue VAR_SPECIAL_x800C, 7
	callif ne, scr_seq_00000003_000008A3
	msgbox 89
	return

scr_seq_00000003_00000892:
	buffer_players_name 0
	scrcmd_194 1, 32772
	msgbox 28
	goto scr_seq_00000003_000008C9

scr_seq_00000003_000008A3:
	comparevartovalue VAR_SPECIAL_x8005, 1
	gotoif gt, scr_seq_00000003_000008BB
	scrcmd_194 0, 32772
	goto scr_seq_00000003_000008C0

scr_seq_00000003_000008BB:
	scrcmd_844 0, 32772
scr_seq_00000003_000008C0:
	msgbox 25
	goto scr_seq_00000003_000008C9

scr_seq_00000003_000008C9:
	wait_fanfare
	buffer_players_name 0
	comparevartovalue VAR_SPECIAL_x8005, 1
	gotoif gt, scr_seq_00000003_000008E6
	scrcmd_194 1, 32772
	goto scr_seq_00000003_000008EB

scr_seq_00000003_000008E6:
	scrcmd_844 1, 32772
scr_seq_00000003_000008EB:
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 7
	gotoif eq, scr_seq_00000003_00000972
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000003_00000961
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_00000003_000009B6
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000003_000009A5
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000003_000009C7
	comparevartovalue VAR_SPECIAL_x8008, 6
	gotoif eq, scr_seq_00000003_00000983
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, scr_seq_00000003_00000994
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_00000003_000009D8
	end

scr_seq_00000003_00000961:
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_195 2, 32780
	goto scr_seq_00000003_000009E9

scr_seq_00000003_00000972:
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_195 2, 32780
	goto scr_seq_00000003_000009E9

scr_seq_00000003_00000983:
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_195 2, 32780
	goto scr_seq_00000003_000009E9

scr_seq_00000003_00000994:
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_195 2, 32780
	goto scr_seq_00000003_000009E9

scr_seq_00000003_000009A5:
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_195 2, 32780
	goto scr_seq_00000003_000009E9

scr_seq_00000003_000009B6:
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_195 2, 32780
	goto scr_seq_00000003_000009E9

scr_seq_00000003_000009C7:
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_195 2, 32780
	goto scr_seq_00000003_000009E9

scr_seq_00000003_000009D8:
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_195 2, 32780
	goto scr_seq_00000003_000009E9

scr_seq_00000003_000009E9:
	return

scr_seq_00000003_000009EB:
	call scr_seq_00000003_000009F5
	endstd
	end

scr_seq_00000003_000009F5:
	msgbox 27
	waitbutton
	return

scr_seq_00000003_000009FC:
	scrcmd_609
	lockall
	play_se SEQ_SE_DP_PC_ON
	call scr_seq_00000003_00000A18
	buffer_players_name 0
	msgbox 33
	scrcmd_746
	goto scr_seq_00000003_00000A2E

scr_seq_00000003_00000A18:
	scrcmd_500 90
	scrcmd_501 90
	scrcmd_308 90
	return

scr_seq_00000003_00000A23:
	scrcmd_502 90
	scrcmd_308 90
	scrcmd_309 90
	return

scr_seq_00000003_00000A2E:
	buffer_players_name 0
	msgbox 34
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x8006
	checkflag FLAG_UNK_976
	callif FALSE, scr_seq_00000003_00000A78
	checkflag FLAG_UNK_976
	callif TRUE, scr_seq_00000003_00000A82
	scrcmd_751 63, 255, 1
	checkflag FLAG_UNK_964
	gotoif TRUE, scr_seq_00000003_00000A8C
	checkflag FLAG_UNK_964
	gotoif FALSE, scr_seq_00000003_00000AD1
	goto scr_seq_00000003_00000AD1

scr_seq_00000003_00000A76:
	.byte 0x02, 0x00
scr_seq_00000003_00000A78:
	scrcmd_751 61, 255, 0
	return

scr_seq_00000003_00000A82:
	scrcmd_751 62, 255, 0
	return

scr_seq_00000003_00000A8C:
	scrcmd_751 64, 255, 2
	scrcmd_751 66, 255, 3
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x8006
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000003_00000B01
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000003_00000C23
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000003_00000DBA
	goto scr_seq_00000003_00000DF0

scr_seq_00000003_00000AD1:
	scrcmd_751 66, 255, 2
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x8006
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000003_00000B01
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000003_00000C23
	goto scr_seq_00000003_00000DF0

scr_seq_00000003_00000B01:
	play_se SEQ_SE_DP_PC_LOGIN
	buffer_players_name 0
	msgbox 35
	call scr_seq_00000003_00000B17
	goto scr_seq_00000003_00000B53

scr_seq_00000003_00000B17:
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 67, 76, 0
	scrcmd_751 68, 77, 1
	scrcmd_751 69, 78, 2
	scrcmd_751 70, 79, 3
	scrcmd_751 72, 81, 5
	return

scr_seq_00000003_00000B49:
	.byte 0x46, 0x00, 0x47, 0x00, 0x50, 0x00, 0x04
	.byte 0x00, 0x1b, 0x00
scr_seq_00000003_00000B53:
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000003_00000BA2
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000003_00000BB5
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000003_00000BC8
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_00000003_00000BDB
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_00000003_00000BEE
	goto scr_seq_00000003_00000A2E

scr_seq_00000003_00000BA2:
	closemsg
	call scr_seq_00000003_00000E16
	scrcmd_158 0
	scrcmd_150
	goto scr_seq_00000003_00000C01

scr_seq_00000003_00000BB5:
	closemsg
	call scr_seq_00000003_00000E16
	scrcmd_158 1
	scrcmd_150
	goto scr_seq_00000003_00000C01

scr_seq_00000003_00000BC8:
	closemsg
	call scr_seq_00000003_00000E16
	scrcmd_158 2
	scrcmd_150
	goto scr_seq_00000003_00000C01

scr_seq_00000003_00000BDB:
	closemsg
	call scr_seq_00000003_00000E16
	scrcmd_158 3
	scrcmd_150
	goto scr_seq_00000003_00000C01

scr_seq_00000003_00000BEE:
	closemsg
	call scr_seq_00000003_00000E16
	scrcmd_158 4
	scrcmd_150
	goto scr_seq_00000003_00000C01

scr_seq_00000003_00000C01:
	buffer_players_name 0
	message 34
	call scr_seq_00000003_00000B17
	call scr_seq_00000003_00000A18
	fade_screen 6, 1, 1, 0
	goto scr_seq_00000003_00000B53

scr_seq_00000003_00000C23:
	play_se SEQ_SE_DP_PC_LOGIN
	buffer_players_name 0
	msgbox 36
	goto scr_seq_00000003_00000C33

scr_seq_00000003_00000C33:
	call scr_seq_00000003_00000CA7
scr_seq_00000003_00000C39:
	scrcmd_616 16384
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_00000003_00000C72
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000003_00000CEC
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000003_00000D3A
	goto scr_seq_00000003_00000A2E

scr_seq_00000003_00000C72:
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000003_00000CEC
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000003_00000D3A
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000003_00000D86
	goto scr_seq_00000003_00000A2E

scr_seq_00000003_00000CA7:
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 73, 82, 0
	scrcmd_751 74, 83, 1
	scrcmd_616 16384
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_00000003_00000CDA
	scrcmd_751 75, 84, 2
	return

scr_seq_00000003_00000CDA:
	scrcmd_751 65, 85, 2
	scrcmd_751 75, 84, 3
	return

scr_seq_00000003_00000CEC:
	closemsg
	scrcmd_377 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000003_00000D0F
	call scr_seq_00000003_00000E16
	scrcmd_376
	scrcmd_150
	goto scr_seq_00000003_00000D18

scr_seq_00000003_00000D0F:
	msgbox 47
	goto scr_seq_00000003_00000C33

scr_seq_00000003_00000D18:
	buffer_players_name 0
	message 34
	call scr_seq_00000003_00000CA7
	call scr_seq_00000003_00000A18
	fade_screen 6, 1, 1, 0
	goto scr_seq_00000003_00000C39

scr_seq_00000003_00000D3A:
	scrcmd_572 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000003_00000D5B
	closemsg
	call scr_seq_00000003_00000E16
	scrcmd_156
	goto scr_seq_00000003_00000D64

scr_seq_00000003_00000D5B:
	msgbox 79
	goto scr_seq_00000003_00000C33

scr_seq_00000003_00000D64:
	buffer_players_name 0
	message 34
	call scr_seq_00000003_00000CA7
	call scr_seq_00000003_00000A18
	fade_screen 6, 1, 1, 0
	goto scr_seq_00000003_00000C39

scr_seq_00000003_00000D86:
	closemsg
	call scr_seq_00000003_00000E16
	scrcmd_617
	scrcmd_150
	goto scr_seq_00000003_00000D98

scr_seq_00000003_00000D98:
	buffer_players_name 0
	message 34
	call scr_seq_00000003_00000CA7
	call scr_seq_00000003_00000A18
	fade_screen 6, 1, 1, 0
	goto scr_seq_00000003_00000C39

scr_seq_00000003_00000DBA:
	play_se SEQ_SE_DP_PC_LOGIN
	closemsg
	scrcmd_706 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000003_00000DE7
	call scr_seq_00000003_00000E16
	scrcmd_164
	scrcmd_150
	call scr_seq_00000003_00000E02
	goto scr_seq_00000003_00000A2E

scr_seq_00000003_00000DE7:
	msgbox 94
	goto scr_seq_00000003_00000A2E

scr_seq_00000003_00000DF0:
	closemsg
	play_se SEQ_SE_DP_PC_LOGOFF
	call scr_seq_00000003_00000A23
	scrcmd_747
	releaseall
	end

scr_seq_00000003_00000E02:
	call scr_seq_00000003_00000A18
	fade_screen 6, 1, 1, 0
	wait_fade
	return

scr_seq_00000003_00000E16:
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_309 90
	return

scr_seq_00000003_00000E27:
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_156
	fade_screen 6, 1, 1, 0
	wait_fade
	end

scr_seq_00000003_00000E43:
	msgbox 38
	endstd
	end

scr_seq_00000003_00000E4A:
	scrcmd_609
	lockall
	apply_movement 255, scr_seq_00000003_00001054
	apply_movement 0, scr_seq_00000003_0000105C
	wait_movement
	fade_screen 6, 1, 1, 0
	wait_fade
	buffer_players_name 0
	msgbox 41
	fade_screen 6, 1, 0, 0
	wait_fade
	closemsg
	play_fanfare SEQ_ME_ASA
	wait_fanfare
	heal_party
	fade_screen 6, 1, 1, 0
	wait_fade
	msgbox 42
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000003_00000E9F:
	.byte 0x2d
	.byte 0x00, 0x2a, 0x1b, 0x00, 0x2d, 0x00, 0x2b, 0x1b, 0x00
scr_seq_00000003_00000EA9:
	scrcmd_609
	lockall
	fade_screen 6, 1, 1, 0
	wait_fade
	get_trcard_stars VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_00000003_00000ED4
	scrcmd_188 2048
	goto scr_seq_00000003_00000ED8

scr_seq_00000003_00000ED4:
	scrcmd_188 256
scr_seq_00000003_00000ED8:
	scrcmd_189
	apply_movement 255, scr_seq_00000003_00000460
	wait_movement
	msgbox 44
	call scr_seq_00000003_00000F89
	call scr_seq_00000003_00000216
	scrcmd_294 0, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000003_00000F49
	msgbox 45
	apply_movement 255, scr_seq_00000003_00000468
	wait_movement
	get_trcard_stars VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_00000003_00000F2E
	scrcmd_188 1024
	goto scr_seq_00000003_00000F32

scr_seq_00000003_00000F2E:
	scrcmd_188 1
scr_seq_00000003_00000F32:
	scrcmd_189
	apply_movement VAR_SPECIAL_x8007, scr_seq_00000003_00000454
	wait_movement
	msgbox 46
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000003_00000F49:
	apply_movement 255, scr_seq_00000003_00000468
	wait_movement
	get_trcard_stars VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_00000003_00000F6E
	scrcmd_188 1024
	goto scr_seq_00000003_00000F72

scr_seq_00000003_00000F6E:
	scrcmd_188 1
scr_seq_00000003_00000F72:
	scrcmd_189
	apply_movement VAR_SPECIAL_x8007, scr_seq_00000003_00000454
	wait_movement
	msgbox 40
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000003_00000F89:
	scrcmd_446 32772
	comparevartovalue VAR_SPECIAL_x8004, 69
	gotoif eq, scr_seq_00000003_0000100A
	comparevartovalue VAR_SPECIAL_x8004, 158
	gotoif eq, scr_seq_00000003_00001012
	comparevartovalue VAR_SPECIAL_x8004, 166
	gotoif eq, scr_seq_00000003_0000101A
	comparevartovalue VAR_SPECIAL_x8004, 236
	gotoif eq, scr_seq_00000003_00001022
	comparevartovalue VAR_SPECIAL_x8004, 185
	gotoif eq, scr_seq_00000003_0000102A
	comparevartovalue VAR_SPECIAL_x8004, 81
	gotoif eq, scr_seq_00000003_00001032
	comparevartovalue VAR_SPECIAL_x8004, 246
	gotoif eq, scr_seq_00000003_0000103A
	comparevartovalue VAR_SPECIAL_x8004, 293
	gotoif eq, scr_seq_00000003_00001042
	comparevartovalue VAR_SPECIAL_x8004, 169
	gotoif eq, scr_seq_00000003_0000104A
	setvar VAR_SPECIAL_x8007, 0
	return

scr_seq_00000003_0000100A:
	setvar VAR_SPECIAL_x8007, 0
	return

scr_seq_00000003_00001012:
	setvar VAR_SPECIAL_x8007, 3
	return

scr_seq_00000003_0000101A:
	setvar VAR_SPECIAL_x8007, 6
	return

scr_seq_00000003_00001022:
	setvar VAR_SPECIAL_x8007, 3
	return

scr_seq_00000003_0000102A:
	setvar VAR_SPECIAL_x8007, 0
	return

scr_seq_00000003_00001032:
	setvar VAR_SPECIAL_x8007, 0
	return

scr_seq_00000003_0000103A:
	setvar VAR_SPECIAL_x8007, 2
	return

scr_seq_00000003_00001042:
	setvar VAR_SPECIAL_x8007, 3
	return

scr_seq_00000003_0000104A:
	setvar VAR_SPECIAL_x8007, 3
	return

scr_seq_00000003_00001052:
	.byte 0x00, 0x00

scr_seq_00000003_00001054:
	.short 0, 1
	.short 254, 0

scr_seq_00000003_0000105C:
	.short 1, 1
	.short 254, 0

scr_seq_00000003_00001064:
	.short 2, 1
	.short 254, 0
	.byte 0x00, 0x00, 0x01, 0x00
	.byte 0xfe, 0x00, 0x00, 0x00, 0x03, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00

scr_seq_00000003_0000107C:
	.short 1, 1
	.short 254, 0
scr_seq_00000003_00001084:
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

scr_seq_00000003_000010AA:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_455
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000003_000010BC:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 54
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000003_000010CF:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 57
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000003_000010E2:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 58
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000003_000010F5:
	hasitem ITEM_BICYCLE, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000003_00001163
	scrcmd_609
	lockall
	play_se SEQ_SE_DP_SELECT
	scrcmd_184 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000003_00001140
	msgbox 59
	scrcmd_063 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000003_0000115D
	scrcmd_185 1
	closemsg
	releaseall
	end

scr_seq_00000003_00001140:
	msgbox 60
	scrcmd_063 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000003_0000115D
	scrcmd_185 0
	closemsg
	releaseall
	end

scr_seq_00000003_0000115D:
	closemsg
	releaseall
	end

scr_seq_00000003_00001163:
	end

scr_seq_00000003_00001165:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 62
	scrcmd_049
	fade_screen 6, 1, 0, 0
	wait_fade
	closemsg
	scrcmd_369
	fade_screen 6, 1, 1, 0
	wait_fade
	releaseall
	end

scr_seq_00000003_00001190:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 65
	scrcmd_049
	closemsg
	releaseall
	end

scr_seq_00000003_000011A1:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 103
	scrcmd_746
scr_seq_00000003_000011AE:
	scrcmd_750 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 112, 255, 0
	scrcmd_751 113, 255, 1
	scrcmd_751 114, 255, 2
	scrcmd_751 115, 255, 3
	scrcmd_751 116, 255, 4
	scrcmd_752
	comparevartovalue VAR_SPECIAL_x800C, 4
	gotoif ge, scr_seq_00000003_00001277
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
	gotoif eq, scr_seq_00000003_00001277
	msgbox 109
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000003_000011AE
	comparevartovalue VAR_SPECIAL_x8001, 65535
	gotoif eq, scr_seq_00000003_0000126A
	scrcmd_494 0, VAR_SPECIAL_x8001
	msgbox 111
	goto scr_seq_00000003_0000126D

scr_seq_00000003_0000126A:
	msgbox 110
scr_seq_00000003_0000126D:
	waitbutton
	closemsg
	scrcmd_747
	releaseall
	end

scr_seq_00000003_00001277:
	msgbox 108
	goto scr_seq_00000003_0000126D

scr_seq_00000003_00001280:
	.byte 0x02, 0x00
scr_seq_00000003_00001282:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 68
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000003_00001295:
	end

scr_seq_00000003_00001297:
	scrcmd_609
	lockall
	releaseall
	end

scr_seq_00000003_0000129F:
	.byte 0x2d
	.byte 0x00, 0x58, 0x32, 0x00, 0x35, 0x00, 0x61, 0x00, 0x02, 0x00, 0x35, 0x00, 0x61, 0x00, 0x02, 0x00
scr_seq_00000003_000012B0:
	scrcmd_081 0
	get_player_gender VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	callif eq, scr_seq_00000003_000012D6
	comparevartovalue VAR_SPECIAL_x800C, 1
	callif eq, scr_seq_00000003_000012DC
	endstd
	end

scr_seq_00000003_000012D6:
	temp_bgm SEQ_GS_E_SUPPORT_F
	return

scr_seq_00000003_000012DC:
	temp_bgm SEQ_GS_E_SUPPORT_M
	return

scr_seq_00000003_000012E2:
	scrcmd_081 0
	temp_bgm SEQ_GS_E_RIVAL1
	endstd
	end

scr_seq_00000003_000012EE:
	scrcmd_081 0
	temp_bgm SEQ_GS_E_RIVAL2
	endstd
	end

scr_seq_00000003_000012FA:
	scrcmd_081 0
	temp_bgm SEQ_GS_E_MINAKI
	endstd
	end

scr_seq_00000003_00001306:
	scrcmd_081 0
	temp_bgm SEQ_GS_IBUKI
	endstd
	end

scr_seq_00000003_00001312:
	scrcmd_081 0
	temp_bgm SEQ_GS_E_TSURETEKE1
	endstd
	end

scr_seq_00000003_0000131E:
	scrcmd_081 0
	temp_bgm SEQ_GS_E_TSURETEKE2
	endstd
	end

scr_seq_00000003_0000132A:
	scrcmd_081 0
	temp_bgm SEQ_GS_E_G_PICHU
	endstd
	end

scr_seq_00000003_00001336:
	scrcmd_081 0
	temp_bgm SEQ_GS_E_MAIKO_THEME
	endstd
	end

scr_seq_00000003_00001342:
	fade_out_bgm 0, 30
	scrcmd_081 0
	reset_bgm
	endstd
	end

scr_seq_00000003_00001352:
	scrcmd_430 32772, 32773, 32774
	call scr_seq_00000003_0000136C
	endstd
	end

scr_seq_00000003_00001364:
	call scr_seq_00000003_0000136C
	end

scr_seq_00000003_0000136C:
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

scr_seq_00000003_0000139A:
	checkflag FLAG_UNK_0FD
	gotoif TRUE, scr_seq_00000003_000013F6
	comparevartovalue VAR_UNK_404E, 4
	gotoif ne, scr_seq_00000003_000013F6
	comparevartovalue VAR_UNK_404F, 4
	gotoif ne, scr_seq_00000003_000013F6
	comparevartovalue VAR_UNK_4050, 4
	gotoif ne, scr_seq_00000003_000013F6
	comparevartovalue VAR_UNK_4051, 4
	gotoif ne, scr_seq_00000003_000013F6
	comparevartovalue VAR_UNK_404D, 4
	gotoif ne, scr_seq_00000003_000013F6
	setflag FLAG_UNK_0FD
	scrcmd_680 31
	goto scr_seq_00000003_000013F6

scr_seq_00000003_000013F4:
	.byte 0x02, 0x00
scr_seq_00000003_000013F6:
	endstd
	end

scr_seq_00000003_000013FA:
	msgbox 93
	waitbutton
	closemsg
	releaseall
	endstd
	end

scr_seq_00000003_00001407:
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_166 32780
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_662 32773, 32772, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000003_00001444
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	endstd
	end

scr_seq_00000003_00001444:
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	endstd
	end

scr_seq_00000003_00001456:
	goto scr_seq_00000003_0000145E

scr_seq_00000003_0000145C:
	.byte 0x02, 0x00
scr_seq_00000003_0000145E:
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 321, 255, 0
	scrcmd_751 322, 255, 1
	scrcmd_751 323, 255, 2
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000003_000014B1
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000003_000014BD
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000003_000014C7
	end

scr_seq_00000003_000014B1:
	scrcmd_275 32772
	goto scr_seq_00000003_000014DD

scr_seq_00000003_000014BB:
	.byte 0x02, 0x00
scr_seq_00000003_000014BD:
	scrcmd_782
	goto scr_seq_00000003_000014DD

scr_seq_00000003_000014C5:
	.byte 0x02, 0x00
scr_seq_00000003_000014C7:
	scrcmd_747
	scrcmd_438 3, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 1
	waitbutton
	closemsg
	endstd
	end

scr_seq_00000003_000014DD:
	scrcmd_438 3, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 6
	scrcmd_054
	goto scr_seq_00000003_0000145E

scr_seq_00000003_000014F1:
	.byte 0x02, 0x00
scr_seq_00000003_000014F3:
	goto scr_seq_00000003_000014FB

scr_seq_00000003_000014F9:
	.byte 0x02, 0x00
scr_seq_00000003_000014FB:
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 321, 255, 0
	scrcmd_751 322, 255, 1
	scrcmd_751 323, 255, 2
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000003_0000154E
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000003_0000155A
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000003_00001564
	end

scr_seq_00000003_0000154E:
	scrcmd_276 32772
	goto scr_seq_00000003_000015A6

scr_seq_00000003_00001558:
	.byte 0x02, 0x00
scr_seq_00000003_0000155A:
	scrcmd_782
	goto scr_seq_00000003_000015A6

scr_seq_00000003_00001562:
	.byte 0x02, 0x00
scr_seq_00000003_00001564:
	scrcmd_747
	checkflag FLAG_UNK_16F
	gotoif TRUE, scr_seq_00000003_000015E8
	checkflag FLAG_UNK_170
	gotoif TRUE, scr_seq_00000003_0000160C
	checkflag FLAG_UNK_171
	gotoif TRUE, scr_seq_00000003_00001630
	checkflag FLAG_UNK_18A
	gotoif TRUE, scr_seq_00000003_00001654
	scrcmd_438 3, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 1
scr_seq_00000003_0000159E:
	waitbutton
	closemsg
	endstd
	end

scr_seq_00000003_000015A6:
	checkflag FLAG_UNK_16F
	gotoif TRUE, scr_seq_00000003_000015FA
	checkflag FLAG_UNK_170
	gotoif TRUE, scr_seq_00000003_0000161E
	checkflag FLAG_UNK_171
	gotoif TRUE, scr_seq_00000003_00001642
	checkflag FLAG_UNK_18A
	gotoif TRUE, scr_seq_00000003_00001666
	scrcmd_438 3, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 6
scr_seq_00000003_000015DE:
	scrcmd_054
	goto scr_seq_00000003_000014FB

scr_seq_00000003_000015E6:
	.byte 0x02, 0x00
scr_seq_00000003_000015E8:
	scrcmd_438 3, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 2
	goto scr_seq_00000003_0000159E

scr_seq_00000003_000015FA:
	scrcmd_438 3, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 7
	goto scr_seq_00000003_000015DE

scr_seq_00000003_0000160C:
	scrcmd_438 3, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 3
	goto scr_seq_00000003_0000159E

scr_seq_00000003_0000161E:
	scrcmd_438 3, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 8
	goto scr_seq_00000003_000015DE

scr_seq_00000003_00001630:
	scrcmd_438 3, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 4
	goto scr_seq_00000003_0000159E

scr_seq_00000003_00001642:
	scrcmd_438 3, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 9
	goto scr_seq_00000003_000015DE

scr_seq_00000003_00001654:
	scrcmd_438 3, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 5
	goto scr_seq_00000003_0000159E

scr_seq_00000003_00001666:
	scrcmd_438 3, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 10
	goto scr_seq_00000003_000015DE

scr_seq_00000003_00001678:
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 321, 255, 0
	scrcmd_751 324, 255, 1
	scrcmd_751 323, 255, 2
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000003_000016CB
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000003_000016D1
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000003_000016D7
	end

scr_seq_00000003_000016CB:
	scrcmd_771
	endstd
	end

scr_seq_00000003_000016D1:
	scrcmd_747
	endstd
	end

scr_seq_00000003_000016D7:
	scrcmd_747
	endstd
	end

scr_seq_00000003_000016DD:
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 321, 255, 0
	scrcmd_751 324, 255, 1
	scrcmd_751 323, 255, 2
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000003_00001730
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000003_00001736
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000003_0000173C
	end

scr_seq_00000003_00001730:
	scrcmd_772
	endstd
	end

scr_seq_00000003_00001736:
	scrcmd_747
	endstd
	end

scr_seq_00000003_0000173C:
	scrcmd_747
	endstd
	end

scr_seq_00000003_00001742:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_727 32773
	bufferpartymonnick 0, VAR_SPECIAL_x8005
	msgbox 99
	closemsg
	scrcmd_806
	scrcmd_727 32773
	bufferpartymonnick 0, VAR_SPECIAL_x8005
	msgbox 100
	scrcmd_049
	closemsg
	releaseall
	end
	.balign 4, 0
