#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0146_004E ; 000
	scrdef scr_seq_0146_0281 ; 001
	scrdef scr_seq_0146_04F6 ; 002
	scrdef scr_seq_0146_0738 ; 003
	scrdef scr_seq_0146_07ED ; 004
	scrdef scr_seq_0146_0949 ; 005
	scrdef scr_seq_0146_0A83 ; 006
	scrdef scr_seq_0146_018A ; 007
	scrdef scr_seq_0146_03D9 ; 008
	scrdef scr_seq_0146_0626 ; 009
	scrdef scr_seq_0146_07D7 ; 010
	scrdef scr_seq_0146_0855 ; 011
	scrdef scr_seq_0146_09C8 ; 012
	scrdef scr_seq_0146_0873 ; 013
	scrdef scr_seq_0146_0A85 ; 014
	scrdef scr_seq_0146_06E6 ; 015
	scrdef scr_seq_0146_09E6 ; 016
	scrdef scr_seq_0146_0A65 ; 017
	scrdef scr_seq_0146_0BCF ; 018
	scrdef_end

scr_seq_0146_004E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_party_slot_with_move VAR_SPECIAL_x800C, MOVE_CUT
	comparevartovalue VAR_SPECIAL_x800C, 6
	gotoif eq, scr_seq_0146_009E
	check_badge 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0146_009E
	npc_msg 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0146_00AD
	closemsg
	goto scr_seq_0146_093D

scr_seq_0146_009C:
	.byte 0x02, 0x00
scr_seq_0146_009E:
	npc_msg 2
	waitbutton
	closemsg
	goto scr_seq_0146_093D

scr_seq_0146_00AB:
	.byte 0x02, 0x00
scr_seq_0146_00AD:
	get_party_slot_with_move VAR_SPECIAL_x800C, MOVE_CUT
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_727 VAR_SPECIAL_x8005
	bufferpartymonnick 0, VAR_SPECIAL_x800C
	npc_msg 1
	closemsg
	get_player_state VAR_SPECIAL_x800C
	scrcmd_730 VAR_SPECIAL_x8006
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_0146_00EC
	scrcmd_183 VAR_SPECIAL_x8004
	scrcmd_560 0, VAR_SPECIAL_x8005
	goto scr_seq_0146_0165

scr_seq_0146_00EC:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0146_0109
	scrcmd_183 VAR_SPECIAL_x8004
	scrcmd_560 0, VAR_SPECIAL_x8005
	goto scr_seq_0146_0165

scr_seq_0146_0109:
	comparevartovar VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	gotoif eq, scr_seq_0146_0126
	scrcmd_183 VAR_SPECIAL_x8004
	scrcmd_560 0, VAR_SPECIAL_x8005
	goto scr_seq_0146_0165

scr_seq_0146_0126:
	comparevartovalue VAR_SPECIAL_x8006, 1
	gotoif ne, scr_seq_0146_0143
	scrcmd_183 VAR_SPECIAL_x8004
	scrcmd_560 0, VAR_SPECIAL_x8005
	goto scr_seq_0146_0165

scr_seq_0146_0143:
	scrcmd_598 1
	get_lead_mon_index VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4000
	call scr_seq_0146_025B
	scrcmd_076 VAR_TEMP_x4000, 0
	scrcmd_077
	scrcmd_560 3, VAR_SPECIAL_x8005
scr_seq_0146_0165:
	wait 7, VAR_SPECIAL_x800C
	hide_person VAR_SPECIAL_x800D
scr_seq_0146_016F:
	wait 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8005, 0
	gotoif eq, scr_seq_0146_016F
	goto scr_seq_0146_093D

scr_seq_0146_0188:
	.byte 0x02, 0x00
scr_seq_0146_018A:
	scrcmd_609
	lockall
	bufferpartymonnick 0, VAR_SPECIAL_x8000
	npc_msg 1
	closemsg
	scrcmd_727 VAR_SPECIAL_x8004
	get_player_state VAR_SPECIAL_x800C
	scrcmd_730 VAR_SPECIAL_x8006
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_0146_01C1
	scrcmd_183 VAR_SPECIAL_x8000
	scrcmd_560 0, VAR_SPECIAL_x8005
	goto scr_seq_0146_023A

scr_seq_0146_01C1:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0146_01DE
	scrcmd_183 VAR_SPECIAL_x8000
	scrcmd_560 0, VAR_SPECIAL_x8005
	goto scr_seq_0146_023A

scr_seq_0146_01DE:
	comparevartovar VAR_SPECIAL_x8000, VAR_SPECIAL_x8004
	gotoif eq, scr_seq_0146_01FB
	scrcmd_183 VAR_SPECIAL_x8000
	scrcmd_560 0, VAR_SPECIAL_x8005
	goto scr_seq_0146_023A

scr_seq_0146_01FB:
	comparevartovalue VAR_SPECIAL_x8006, 1
	gotoif ne, scr_seq_0146_0218
	scrcmd_183 VAR_SPECIAL_x8004
	scrcmd_560 0, VAR_SPECIAL_x8005
	goto scr_seq_0146_023A

scr_seq_0146_0218:
	scrcmd_598 1
	get_lead_mon_index VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4000
	call scr_seq_0146_025B
	scrcmd_076 VAR_TEMP_x4000, 0
	scrcmd_077
	scrcmd_560 3, VAR_SPECIAL_x8005
scr_seq_0146_023A:
	wait 7, VAR_SPECIAL_x800C
	hide_person VAR_SPECIAL_x800D
scr_seq_0146_0244:
	wait 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8005, 0
	gotoif eq, scr_seq_0146_0244
	releaseall
	end

scr_seq_0146_025B:
	scrcmd_732 20
	scrcmd_733 12, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0146_027C
	scrcmd_734 2
	scrcmd_732 1
	goto scr_seq_0146_027F

scr_seq_0146_027C:
	scrcmd_734 1
scr_seq_0146_027F:
	return

scr_seq_0146_0281:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_party_slot_with_move VAR_SPECIAL_x800C, MOVE_ROCK_SMASH
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 6
	gotoif eq, scr_seq_0146_02D7
	check_badge 0, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0146_02D7
	npc_msg 3
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0146_02E6
	closemsg
	goto scr_seq_0146_093D

scr_seq_0146_02D5:
	.byte 0x02, 0x00
scr_seq_0146_02D7:
	npc_msg 4
	waitbutton
	closemsg
	goto scr_seq_0146_093D

scr_seq_0146_02E4:
	.byte 0x02, 0x00
scr_seq_0146_02E6:
	bufferpartymonnick 0, VAR_SPECIAL_x8004
	npc_msg 5
	closemsg
	scrcmd_727 VAR_SPECIAL_x8005
	get_player_state VAR_SPECIAL_x800C
	scrcmd_730 VAR_SPECIAL_x8006
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_0146_031F
	setvar VAR_SPECIAL_x8007, 0
	scrcmd_183 VAR_SPECIAL_x8004
	scrcmd_560 1, VAR_SPECIAL_x8005
	goto scr_seq_0146_03AA

scr_seq_0146_031F:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0146_0342
	setvar VAR_SPECIAL_x8007, 0
	scrcmd_183 VAR_SPECIAL_x8004
	scrcmd_560 1, VAR_SPECIAL_x8005
	goto scr_seq_0146_03AA

scr_seq_0146_0342:
	comparevartovar VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	gotoif eq, scr_seq_0146_0365
	setvar VAR_SPECIAL_x8007, 0
	scrcmd_183 VAR_SPECIAL_x8004
	scrcmd_560 1, VAR_SPECIAL_x8005
	goto scr_seq_0146_03AA

scr_seq_0146_0365:
	comparevartovalue VAR_SPECIAL_x8006, 1
	gotoif ne, scr_seq_0146_0382
	scrcmd_183 VAR_SPECIAL_x8004
	scrcmd_560 1, VAR_SPECIAL_x8005
	goto scr_seq_0146_03AA

scr_seq_0146_0382:
	setvar VAR_SPECIAL_x8007, 1
	scrcmd_598 1
	get_lead_mon_index VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4000
	call scr_seq_0146_04D0
	scrcmd_076 VAR_TEMP_x4000, 0
	scrcmd_077
	scrcmd_560 2, VAR_SPECIAL_x8005
scr_seq_0146_03AA:
	wait 10, VAR_SPECIAL_x800C
	hide_person VAR_SPECIAL_x800D
scr_seq_0146_03B4:
	wait 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8005, 0
	gotoif eq, scr_seq_0146_03B4
	releaseall
	scrcmd_753 32775, 32780, 32774
	goto scr_seq_0146_0CEB

scr_seq_0146_03D7:
	.byte 0x02, 0x00
scr_seq_0146_03D9:
	scrcmd_609
	lockall
	bufferpartymonnick 0, VAR_SPECIAL_x8000
	npc_msg 5
	closemsg
	scrcmd_727 VAR_SPECIAL_x8004
	get_player_state VAR_SPECIAL_x800C
	scrcmd_730 VAR_SPECIAL_x8006
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_0146_0416
	setvar VAR_SPECIAL_x8007, 0
	scrcmd_183 VAR_SPECIAL_x8000
	scrcmd_560 1, VAR_SPECIAL_x8005
	goto scr_seq_0146_04A1

scr_seq_0146_0416:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0146_0439
	setvar VAR_SPECIAL_x8007, 0
	scrcmd_183 VAR_SPECIAL_x8000
	scrcmd_560 1, VAR_SPECIAL_x8005
	goto scr_seq_0146_04A1

scr_seq_0146_0439:
	comparevartovar VAR_SPECIAL_x8000, VAR_SPECIAL_x8004
	gotoif eq, scr_seq_0146_045C
	setvar VAR_SPECIAL_x8007, 0
	scrcmd_183 VAR_SPECIAL_x8000
	scrcmd_560 1, VAR_SPECIAL_x8005
	goto scr_seq_0146_04A1

scr_seq_0146_045C:
	comparevartovalue VAR_SPECIAL_x8006, 1
	gotoif ne, scr_seq_0146_0479
	scrcmd_183 VAR_SPECIAL_x8004
	scrcmd_560 1, VAR_SPECIAL_x8005
	goto scr_seq_0146_04A1

scr_seq_0146_0479:
	scrcmd_598 1
	setvar VAR_SPECIAL_x8007, 1
	get_lead_mon_index VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4000
	call scr_seq_0146_04D0
	scrcmd_076 VAR_TEMP_x4000, 0
	scrcmd_077
	scrcmd_560 2, VAR_SPECIAL_x8005
scr_seq_0146_04A1:
	wait 10, VAR_SPECIAL_x800C
	hide_person VAR_SPECIAL_x800D
scr_seq_0146_04AB:
	wait 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8005, 0
	gotoif eq, scr_seq_0146_04AB
	releaseall
	scrcmd_753 32775, 32780, 32774
	goto scr_seq_0146_0CEB

scr_seq_0146_04CE:
	.byte 0x02, 0x00
scr_seq_0146_04D0:
	scrcmd_732 20
	scrcmd_733 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0146_04F1
	scrcmd_734 2
	scrcmd_732 1
	goto scr_seq_0146_04F4

scr_seq_0146_04F1:
	scrcmd_734 1
scr_seq_0146_04F4:
	return

scr_seq_0146_04F6:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	strength_flag_action 2, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0146_051C
	call scr_seq_0146_061D
	goto scr_seq_0146_093D

scr_seq_0146_051C:
	get_party_slot_with_move VAR_SPECIAL_x800C, MOVE_STRENGTH
	comparevartovalue VAR_SPECIAL_x800C, 6
	gotoif eq, scr_seq_0146_0564
	check_badge 2, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0146_0564
	npc_msg 7
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0146_0573
	closemsg
	goto scr_seq_0146_093D

scr_seq_0146_0562:
	.byte 0x02, 0x00
scr_seq_0146_0564:
	npc_msg 9
	waitbutton
	closemsg
	goto scr_seq_0146_093D

scr_seq_0146_0571:
	.byte 0x02, 0x00
scr_seq_0146_0573:
	strength_flag_action 1
	get_party_slot_with_move VAR_SPECIAL_x800C, MOVE_STRENGTH
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	bufferpartymonnick 0, VAR_SPECIAL_x800C
	npc_msg 11
	closemsg
	scrcmd_727 VAR_SPECIAL_x8005
	get_player_state VAR_SPECIAL_x800C
	scrcmd_730 VAR_SPECIAL_x8006
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_0146_05AF
	scrcmd_183 VAR_SPECIAL_x8004
	goto scr_seq_0146_060E

scr_seq_0146_05AF:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0146_05C6
	scrcmd_183 VAR_SPECIAL_x8004
	goto scr_seq_0146_060E

scr_seq_0146_05C6:
	comparevartovar VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	gotoif eq, scr_seq_0146_05DD
	scrcmd_183 VAR_SPECIAL_x8004
	goto scr_seq_0146_060E

scr_seq_0146_05DD:
	comparevartovalue VAR_SPECIAL_x8006, 1
	gotoif ne, scr_seq_0146_05F4
	scrcmd_183 VAR_SPECIAL_x8004
	goto scr_seq_0146_060E

scr_seq_0146_05F4:
	get_lead_mon_index VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4000
	call scr_seq_0146_0715
	scrcmd_076 VAR_TEMP_x4000, 0
	scrcmd_077
	scrcmd_731
scr_seq_0146_060E:
	npc_msg 12
	waitbutton
	closemsg
	goto scr_seq_0146_093D

scr_seq_0146_061B:
	.byte 0x02, 0x00
scr_seq_0146_061D:
	npc_msg 10
	waitbutton
	closemsg
	return

scr_seq_0146_0626:
	scrcmd_609
	lockall
	strength_flag_action 2, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0146_0648
	call scr_seq_0146_061D
	goto scr_seq_0146_0945

scr_seq_0146_0648:
	strength_flag_action 1
	bufferpartymonnick 0, VAR_SPECIAL_x8000
	npc_msg 11
	closemsg
	scrcmd_727 VAR_SPECIAL_x8004
	get_player_state VAR_SPECIAL_x800C
	scrcmd_730 VAR_SPECIAL_x8006
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_0146_0678
	scrcmd_183 VAR_SPECIAL_x8000
	goto scr_seq_0146_06D7

scr_seq_0146_0678:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0146_068F
	scrcmd_183 VAR_SPECIAL_x8000
	goto scr_seq_0146_06D7

scr_seq_0146_068F:
	comparevartovar VAR_SPECIAL_x8000, VAR_SPECIAL_x8004
	gotoif eq, scr_seq_0146_06A6
	scrcmd_183 VAR_SPECIAL_x8000
	goto scr_seq_0146_06D7

scr_seq_0146_06A6:
	comparevartovalue VAR_SPECIAL_x8006, 1
	gotoif ne, scr_seq_0146_06BD
	scrcmd_183 VAR_SPECIAL_x8000
	goto scr_seq_0146_06D7

scr_seq_0146_06BD:
	get_lead_mon_index VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4000
	call scr_seq_0146_0715
	scrcmd_076 VAR_TEMP_x4000, 0
	scrcmd_077
	scrcmd_731
scr_seq_0146_06D7:
	npc_msg 12
	waitbutton
	closemsg
	goto scr_seq_0146_0945

scr_seq_0146_06E4:
	.byte 0x02, 0x00
scr_seq_0146_06E6:
	play_se SEQ_SE_GS_IWAOTOSHI01
	wait 12, VAR_SPECIAL_x800C
	play_se SEQ_SE_GS_IWAOTOSHI02
	scrcmd_561 0, 4, 2, 8
	scrcmd_561 0, 2, 1, 8
	wait_se SEQ_SE_GS_IWAOTOSHI02
	npc_msg 13
	waitbutton
	closemsg
	end

scr_seq_0146_0715:
	scrcmd_733 0, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0146_0733
	scrcmd_734 2
	scrcmd_732 1
	goto scr_seq_0146_0736

scr_seq_0146_0733:
	scrcmd_734 1
scr_seq_0146_0736:
	return

scr_seq_0146_0738:
	play_se SEQ_SE_DP_SELECT
	lockall
	get_party_slot_with_move VAR_SPECIAL_x800C, MOVE_ROCK_CLIMB
	comparevartovalue VAR_SPECIAL_x800C, 6
	gotoif eq, scr_seq_0146_0797
	check_badge 15, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0146_0797
	check_escort_mode VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0146_07A6
	npc_msg 20
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0146_07B5
	closemsg
	goto scr_seq_0146_0941

scr_seq_0146_0795:
	.byte 0x02, 0x00
scr_seq_0146_0797:
	npc_msg 22
	waitbutton
	closemsg
	goto scr_seq_0146_0941

scr_seq_0146_07A4:
	.byte 0x02, 0x00
scr_seq_0146_07A6:
	npc_msg 23
	waitbutton
	closemsg
	goto scr_seq_0146_0941

scr_seq_0146_07B3:
	.byte 0x02, 0x00
scr_seq_0146_07B5:
	get_party_slot_with_move VAR_SPECIAL_x800C, MOVE_ROCK_CLIMB
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	bufferpartymonnick 0, VAR_SPECIAL_x800C
	npc_msg 21
	closemsg
	rock_climb VAR_SPECIAL_x8004
	goto scr_seq_0146_0941

scr_seq_0146_07D5:
	.byte 0x02, 0x00
scr_seq_0146_07D7:
	scrcmd_609
	lockall
	bufferpartymonnick 0, VAR_SPECIAL_x8000
	npc_msg 21
	closemsg
	rock_climb VAR_SPECIAL_x8000
	releaseall
	end

scr_seq_0146_07ED:
	play_se SEQ_SE_DP_SELECT
	lockall
	check_escort_mode VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0146_0826
	npc_msg 14
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0146_0833
	closemsg
	goto scr_seq_0146_0941

scr_seq_0146_0824:
	.byte 0x02, 0x00
scr_seq_0146_0826:
	npc_msg 16
	waitbutton
	closemsg
	goto scr_seq_0146_0941

scr_seq_0146_0833:
	get_party_slot_with_move VAR_SPECIAL_x800C, MOVE_SURF
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	bufferpartymonnick 0, VAR_SPECIAL_x800C
	npc_msg 15
	closemsg
	surf VAR_SPECIAL_x8004
	goto scr_seq_0146_0941

scr_seq_0146_0853:
	.byte 0x02, 0x00
scr_seq_0146_0855:
	scrcmd_609
	lockall
	bufferpartymonnick 0, VAR_SPECIAL_x8000
	npc_msg 15
	closemsg
	release 255
	surf VAR_SPECIAL_x8000
	lock 255
	releaseall
	end

scr_seq_0146_0873:
	scrcmd_609
	lockall
	bufferpartymonnick 0, VAR_SPECIAL_x8000
	npc_msg 28
	closemsg
	scrcmd_727 VAR_SPECIAL_x8005
	get_player_state VAR_SPECIAL_x800C
	scrcmd_730 VAR_SPECIAL_x8006
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_0146_08A4
	scrcmd_183 VAR_SPECIAL_x8000
	goto scr_seq_0146_0909

scr_seq_0146_08A4:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0146_08BB
	scrcmd_183 VAR_SPECIAL_x8000
	goto scr_seq_0146_0909

scr_seq_0146_08BB:
	comparevartovar VAR_SPECIAL_x8000, VAR_SPECIAL_x8005
	gotoif eq, scr_seq_0146_08D2
	scrcmd_183 VAR_SPECIAL_x8000
	goto scr_seq_0146_0909

scr_seq_0146_08D2:
	comparevartovalue VAR_SPECIAL_x8006, 1
	gotoif ne, scr_seq_0146_08E9
	scrcmd_183 VAR_SPECIAL_x8000
	goto scr_seq_0146_0909

scr_seq_0146_08E9:
	get_lead_mon_index VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4000
	call scr_seq_0146_091A
	scrcmd_076 VAR_TEMP_x4000, 0
	scrcmd_077
	scrcmd_728 16, 2
	scrcmd_728 16, 2
scr_seq_0146_0909:
	scrcmd_401 1, 181
	wait 42, VAR_SPECIAL_x800C
	goto scr_seq_0146_0945

scr_seq_0146_091A:
	scrcmd_733 14, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0146_0938
	scrcmd_734 2
	scrcmd_732 1
	goto scr_seq_0146_093B

scr_seq_0146_0938:
	scrcmd_734 1
scr_seq_0146_093B:
	return

scr_seq_0146_093D:
	releaseall
	end

scr_seq_0146_0941:
	releaseall
	end

scr_seq_0146_0945:
	releaseall
	end

scr_seq_0146_0949:
	play_se SEQ_SE_DP_SELECT
	lockall
	get_party_slot_with_move VAR_SPECIAL_x800C, MOVE_WATERFALL
	comparevartovalue VAR_SPECIAL_x800C, 6
	gotoif eq, scr_seq_0146_0997
	check_badge 7, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0146_0997
	npc_msg 24
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0146_09A6
	closemsg
	goto scr_seq_0146_0941

scr_seq_0146_0995:
	.byte 0x02, 0x00
scr_seq_0146_0997:
	npc_msg 26
	waitbutton
	closemsg
	goto scr_seq_0146_0941

scr_seq_0146_09A4:
	.byte 0x02, 0x00
scr_seq_0146_09A6:
	get_party_slot_with_move VAR_SPECIAL_x800C, MOVE_WATERFALL
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	bufferpartymonnick 0, VAR_SPECIAL_x800C
	npc_msg 25
	closemsg
	waterfall VAR_SPECIAL_x8004
	goto scr_seq_0146_0941

scr_seq_0146_09C6:
	.byte 0x02, 0x00
scr_seq_0146_09C8:
	scrcmd_609
	lockall
	bufferpartymonnick 0, VAR_SPECIAL_x8000
	npc_msg 25
	closemsg
	release 255
	waterfall VAR_SPECIAL_x8000
	lock 255
	releaseall
	end

scr_seq_0146_09E6:
	play_se SEQ_SE_DP_SELECT
	lockall
	get_party_slot_with_move VAR_SPECIAL_x800C, MOVE_WHIRLPOOL
	comparevartovalue VAR_SPECIAL_x800C, 6
	gotoif eq, scr_seq_0146_0A34
	check_badge 6, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0146_0A34
	npc_msg 29
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0146_0A43
	closemsg
	goto scr_seq_0146_0941

scr_seq_0146_0A32:
	.byte 0x02, 0x00
scr_seq_0146_0A34:
	npc_msg 31
	waitbutton
	closemsg
	goto scr_seq_0146_0941

scr_seq_0146_0A41:
	.byte 0x02, 0x00
scr_seq_0146_0A43:
	get_party_slot_with_move VAR_SPECIAL_x800C, MOVE_WHIRLPOOL
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	bufferpartymonnick 0, VAR_SPECIAL_x800C
	npc_msg 30
	closemsg
	whirlpool VAR_SPECIAL_x8004
	goto scr_seq_0146_0941

scr_seq_0146_0A63:
	.byte 0x02, 0x00
scr_seq_0146_0A65:
	scrcmd_609
	lockall
	bufferpartymonnick 0, VAR_SPECIAL_x8000
	npc_msg 30
	closemsg
	release 255
	whirlpool VAR_SPECIAL_x8000
	lock 255
	releaseall
	end

scr_seq_0146_0A83:
	end

scr_seq_0146_0A85:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_party_slot_with_move VAR_SPECIAL_x800C, MOVE_HEADBUTT
	comparevartovalue VAR_SPECIAL_x800C, 6
	gotoif eq, scr_seq_0146_0AC2
	npc_msg 32
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0146_0AD1
	closemsg
	goto scr_seq_0146_093D

scr_seq_0146_0AC0:
	.byte 0x02, 0x00
scr_seq_0146_0AC2:
	npc_msg 34
	waitbutton
	closemsg
	goto scr_seq_0146_093D

scr_seq_0146_0ACF:
	.byte 0x02
	.byte 0x00
scr_seq_0146_0AD1:
	get_party_slot_with_move VAR_SPECIAL_x800C, MOVE_HEADBUTT
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_727 VAR_SPECIAL_x8005
	bufferpartymonnick 0, VAR_SPECIAL_x800C
	npc_msg 33
	closemsg
	get_player_state VAR_SPECIAL_x800C
	scrcmd_730 VAR_SPECIAL_x8006
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_0146_0B10
	scrcmd_183 VAR_SPECIAL_x8004
	scrcmd_560 4, VAR_SPECIAL_x8005
	goto scr_seq_0146_0BAE

scr_seq_0146_0B10:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0146_0B2D
	scrcmd_183 VAR_SPECIAL_x8004
	scrcmd_560 4, VAR_SPECIAL_x8005
	goto scr_seq_0146_0BAE

scr_seq_0146_0B2D:
	comparevartovar VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	gotoif eq, scr_seq_0146_0B4A
	scrcmd_183 VAR_SPECIAL_x8004
	scrcmd_560 4, VAR_SPECIAL_x8005
	goto scr_seq_0146_0BAE

scr_seq_0146_0B4A:
	comparevartovalue VAR_SPECIAL_x8006, 1
	gotoif ne, scr_seq_0146_0B67
	scrcmd_183 VAR_SPECIAL_x8004
	scrcmd_560 4, VAR_SPECIAL_x8005
	goto scr_seq_0146_0BAE

scr_seq_0146_0B67:
	scrcmd_829 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0146_0BA0
	scrcmd_598 1
	get_lead_mon_index VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4000
	call scr_seq_0146_0CC5
	scrcmd_076 VAR_TEMP_x4000, 0
	scrcmd_077
	scrcmd_560 5, VAR_SPECIAL_x8005
	goto scr_seq_0146_0BAE

scr_seq_0146_0BA0:
	scrcmd_600
	scrcmd_606
	scrcmd_183 VAR_SPECIAL_x8004
	scrcmd_560 4, VAR_SPECIAL_x8005
scr_seq_0146_0BAE:
	wait 7, VAR_SPECIAL_x800C
scr_seq_0146_0BB4:
	wait 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8005, 0
	gotoif eq, scr_seq_0146_0BB4
	releaseall
	scrcmd_754 32780
	end

scr_seq_0146_0BCF:
	scrcmd_609
	lockall
	bufferpartymonnick 0, VAR_SPECIAL_x8000
	npc_msg 33
	closemsg
	scrcmd_727 VAR_SPECIAL_x8004
	get_player_state VAR_SPECIAL_x800C
	scrcmd_730 VAR_SPECIAL_x8006
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_0146_0C06
	scrcmd_183 VAR_SPECIAL_x8000
	scrcmd_560 4, VAR_SPECIAL_x8005
	goto scr_seq_0146_0CA4

scr_seq_0146_0C06:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0146_0C23
	scrcmd_183 VAR_SPECIAL_x8000
	scrcmd_560 4, VAR_SPECIAL_x8005
	goto scr_seq_0146_0CA4

scr_seq_0146_0C23:
	comparevartovar VAR_SPECIAL_x8000, VAR_SPECIAL_x8004
	gotoif eq, scr_seq_0146_0C40
	scrcmd_183 VAR_SPECIAL_x8000
	scrcmd_560 4, VAR_SPECIAL_x8005
	goto scr_seq_0146_0CA4

scr_seq_0146_0C40:
	comparevartovalue VAR_SPECIAL_x8006, 1
	gotoif ne, scr_seq_0146_0C5D
	scrcmd_183 VAR_SPECIAL_x8004
	scrcmd_560 4, VAR_SPECIAL_x8005
	goto scr_seq_0146_0CA4

scr_seq_0146_0C5D:
	scrcmd_829 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0146_0C96
	scrcmd_598 1
	get_lead_mon_index VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4000
	call scr_seq_0146_0CC5
	scrcmd_076 VAR_TEMP_x4000, 0
	scrcmd_077
	scrcmd_560 5, VAR_SPECIAL_x8005
	goto scr_seq_0146_0CA4

scr_seq_0146_0C96:
	scrcmd_600
	scrcmd_606
	scrcmd_183 VAR_SPECIAL_x8004
	scrcmd_560 4, VAR_SPECIAL_x8005
scr_seq_0146_0CA4:
	wait 7, VAR_SPECIAL_x800C
scr_seq_0146_0CAA:
	wait 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8005, 0
	gotoif eq, scr_seq_0146_0CAA
	releaseall
	scrcmd_754 32780
	end

scr_seq_0146_0CC5:
	scrcmd_732 20
	scrcmd_733 0, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0146_0CE6
	scrcmd_734 2
	scrcmd_732 1
	goto scr_seq_0146_0CE9

scr_seq_0146_0CE6:
	scrcmd_734 1
scr_seq_0146_0CE9:
	return

scr_seq_0146_0CEB:
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0146_0D2A
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x8006
	setvar VAR_SPECIAL_x8005, 1
	buffer_item_name_indef 1, VAR_SPECIAL_x8004
	capitalize 1
	npc_msg 6
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0146_0D2C
	callstd 2008
	closemsg
scr_seq_0146_0D2A:
	end

scr_seq_0146_0D2C:
	callstd std_bag_is_full
	closemsg
	end
	.balign 4, 0
