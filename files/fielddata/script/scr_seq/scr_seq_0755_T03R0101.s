#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0755_T03R0101_0147 ; 000
	scrdef scr_seq_0755_T03R0101_015A ; 001
	scrdef scr_seq_0755_T03R0101_0A00 ; 002
	scrdef scr_seq_0755_T03R0101_0A13 ; 003
	scrdef scr_seq_0755_T03R0101_0A26 ; 004
	scrdef scr_seq_0755_T03R0101_0A39 ; 005
	scrdef scr_seq_0755_T03R0101_0A4A ; 006
	scrdef scr_seq_0755_T03R0101_0A5B ; 007
	scrdef scr_seq_0755_T03R0101_0A6C ; 008
	scrdef scr_seq_0755_T03R0101_0A7D ; 009
	scrdef scr_seq_0755_T03R0101_0A8E ; 010
	scrdef scr_seq_0755_T03R0101_0A9F ; 011
	scrdef scr_seq_0755_T03R0101_0AB0 ; 012
	scrdef scr_seq_0755_T03R0101_0608 ; 013
	scrdef scr_seq_0755_T03R0101_0052 ; 014
	scrdef scr_seq_0755_T03R0101_07A3 ; 015
	scrdef scr_seq_0755_T03R0101_07DF ; 016
	scrdef scr_seq_0755_T03R0101_013F ; 017
	scrdef scr_seq_0755_T03R0101_07A5 ; 018
	scrdef scr_seq_0755_T03R0101_078C ; 019
	scrdef_end

scr_seq_0755_T03R0101_0052:
	comparevartovalue VAR_UNK_4083, 5
	gotoif ge, scr_seq_0755_T03R0101_00E8
	comparevartovalue VAR_UNK_4083, 4
	gotoif eq, scr_seq_0755_T03R0101_00E8
	comparevartovalue VAR_UNK_4083, 3
	gotoif eq, scr_seq_0755_T03R0101_00D8
	comparevartovalue VAR_UNK_4083, 2
	gotoif eq, scr_seq_0755_T03R0101_00D8
	comparevartovalue VAR_UNK_4083, 1
	gotoif eq, scr_seq_0755_T03R0101_00CE
	hasitem ITEM_ENIGMA_STONE, 1, VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, scr_seq_0755_T03R0101_00F4
	scrcmd_546 0, 16384
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, scr_seq_0755_T03R0101_00F4
	scrcmd_490 16391
	setvar VAR_UNK_4083, 1
	clearflag FLAG_UNK_308
	setflag FLAG_UNK_317
	end

scr_seq_0755_T03R0101_00CE:
	clearflag FLAG_UNK_308
	setflag FLAG_UNK_317
	end

scr_seq_0755_T03R0101_00D8:
	setflag FLAG_UNK_308
	setflag FLAG_UNK_317
	goto scr_seq_0755_T03R0101_0104

scr_seq_0755_T03R0101_00E6:
	.byte 0x02, 0x00
scr_seq_0755_T03R0101_00E8:
	setflag FLAG_UNK_308
	goto scr_seq_0755_T03R0101_0104

scr_seq_0755_T03R0101_00F2:
	.byte 0x02, 0x00
scr_seq_0755_T03R0101_00F4:
	scrcmd_490 16390
	setflag FLAG_UNK_308
	goto scr_seq_0755_T03R0101_0104

scr_seq_0755_T03R0101_0102:
	.byte 0x02, 0x00
scr_seq_0755_T03R0101_0104:
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_0755_T03R0101_0115
	clearflag FLAG_UNK_189
	end

scr_seq_0755_T03R0101_0115:
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, scr_seq_0755_T03R0101_0139
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, scr_seq_0755_T03R0101_0139
	setflag FLAG_UNK_27E
	end

scr_seq_0755_T03R0101_0139:
	clearflag FLAG_UNK_27E
	end

scr_seq_0755_T03R0101_013F:
	end

scr_seq_0755_T03R0101_0141:
	.byte 0xea, 0x01, 0x06, 0x40, 0x02, 0x00
scr_seq_0755_T03R0101_0147:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0755_T03R0101_015A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_784 2, 0
	checkflag FLAG_UNK_001
	gotoif TRUE, scr_seq_0755_T03R0101_0530
	comparevartovalue VAR_UNK_407F, 0
	gotoif ne, scr_seq_0755_T03R0101_0550
	npc_msg 1
	countfossils VAR_SPECIAL_x8000
	comparevartovalue VAR_SPECIAL_x8000, 0
	gotoif ne, scr_seq_0755_T03R0101_019B
	npc_msg 6
	goto scr_seq_0755_T03R0101_05FC

scr_seq_0755_T03R0101_019B:
	comparevartovalue VAR_SPECIAL_x8000, 1
	gotoif eq, scr_seq_0755_T03R0101_04F7
	setvar VAR_SPECIAL_x8001, 0
	hasitem ITEM_OLD_AMBER, 1, VAR_SPECIAL_x800C
	addvar VAR_SPECIAL_x8001, VAR_SPECIAL_x800C
	hasitem ITEM_HELIX_FOSSIL, 1, VAR_SPECIAL_x800C
	addvar VAR_SPECIAL_x8001, VAR_SPECIAL_x800C
	hasitem ITEM_DOME_FOSSIL, 1, VAR_SPECIAL_x800C
	addvar VAR_SPECIAL_x8001, VAR_SPECIAL_x800C
	hasitem ITEM_ROOT_FOSSIL, 1, VAR_SPECIAL_x800C
	addvar VAR_SPECIAL_x8001, VAR_SPECIAL_x800C
	hasitem ITEM_CLAW_FOSSIL, 1, VAR_SPECIAL_x800C
	addvar VAR_SPECIAL_x8001, VAR_SPECIAL_x800C
	hasitem ITEM_ARMOR_FOSSIL, 1, VAR_SPECIAL_x800C
	addvar VAR_SPECIAL_x8001, VAR_SPECIAL_x800C
	hasitem ITEM_SKULL_FOSSIL, 1, VAR_SPECIAL_x800C
	addvar VAR_SPECIAL_x8001, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8001, 1
	gotoif eq, scr_seq_0755_T03R0101_04F7
	setvar VAR_SPECIAL_x8004, 0
	setvar VAR_SPECIAL_x8005, 0
	setvar VAR_TEMP_x4000, 0
	setvar VAR_TEMP_x4001, 0
	setvar VAR_TEMP_x4002, 0
	setvar VAR_TEMP_x4003, 0
	setvar VAR_TEMP_x4004, 0
	setvar VAR_TEMP_x4005, 0
	setvar VAR_TEMP_x4006, 0
	setvar VAR_TEMP_x4007, 0
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x8000
scr_seq_0755_T03R0101_0263:
	comparevartovalue VAR_SPECIAL_x8005, 0
	callif eq, scr_seq_0755_T03R0101_0417
	comparevartovalue VAR_SPECIAL_x8005, 1
	callif eq, scr_seq_0755_T03R0101_0427
	comparevartovalue VAR_SPECIAL_x8005, 2
	callif eq, scr_seq_0755_T03R0101_0437
	comparevartovalue VAR_SPECIAL_x8005, 3
	callif eq, scr_seq_0755_T03R0101_0447
	comparevartovalue VAR_SPECIAL_x8005, 4
	callif eq, scr_seq_0755_T03R0101_0457
	comparevartovalue VAR_SPECIAL_x8005, 5
	callif eq, scr_seq_0755_T03R0101_0467
	comparevartovalue VAR_SPECIAL_x8005, 6
	callif eq, scr_seq_0755_T03R0101_0477
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0755_T03R0101_0340
	comparevartovalue VAR_SPECIAL_x8004, 0
	callif eq, scr_seq_0755_T03R0101_0487
	comparevartovalue VAR_SPECIAL_x8004, 1
	callif eq, scr_seq_0755_T03R0101_048F
	comparevartovalue VAR_SPECIAL_x8004, 2
	callif eq, scr_seq_0755_T03R0101_0497
	comparevartovalue VAR_SPECIAL_x8004, 3
	callif eq, scr_seq_0755_T03R0101_049F
	comparevartovalue VAR_SPECIAL_x8004, 4
	callif eq, scr_seq_0755_T03R0101_04A7
	comparevartovalue VAR_SPECIAL_x8004, 5
	callif eq, scr_seq_0755_T03R0101_04AF
	comparevartovalue VAR_SPECIAL_x8004, 6
	callif eq, scr_seq_0755_T03R0101_04B7
	copyvar VAR_SPECIAL_x8006, VAR_SPECIAL_x8005
	addvar VAR_SPECIAL_x8006, 159
	scrcmd_751 32774, 255, 32772
	goto scr_seq_0755_T03R0101_034C

scr_seq_0755_T03R0101_0340:
	addvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0755_T03R0101_0263

scr_seq_0755_T03R0101_034C:
	addvar VAR_SPECIAL_x8004, 1
	addvar VAR_SPECIAL_x8005, 1
	comparevartovar VAR_SPECIAL_x8004, VAR_SPECIAL_x8001
	gotoif ne, scr_seq_0755_T03R0101_0263
	scrcmd_751 45, 255, 32772
	scrcmd_752
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x8000, 255
	gotoif eq, scr_seq_0755_T03R0101_053F
	comparevartovalue VAR_SPECIAL_x8000, 0
	callif eq, scr_seq_0755_T03R0101_04BF
	comparevartovalue VAR_SPECIAL_x8000, 1
	callif eq, scr_seq_0755_T03R0101_04C7
	comparevartovalue VAR_SPECIAL_x8000, 2
	callif eq, scr_seq_0755_T03R0101_04CF
	comparevartovalue VAR_SPECIAL_x8000, 3
	callif eq, scr_seq_0755_T03R0101_04D7
	comparevartovalue VAR_SPECIAL_x8000, 4
	callif eq, scr_seq_0755_T03R0101_04DF
	comparevartovalue VAR_SPECIAL_x8000, 5
	callif eq, scr_seq_0755_T03R0101_04E7
	comparevartovalue VAR_SPECIAL_x8000, 6
	callif eq, scr_seq_0755_T03R0101_04EF
	getfossilpokemon VAR_UNK_407F, VAR_SPECIAL_x8002
	comparevartovalue VAR_UNK_407F, 0
	gotoif eq, scr_seq_0755_T03R0101_053F
	scrcmd_194 0, 32770
	npc_msg 7
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0755_T03R0101_053F
	takeitem VAR_SPECIAL_x8002, 1, VAR_SPECIAL_x800C
	goto scr_seq_0755_T03R0101_0530

scr_seq_0755_T03R0101_0417:
	setvar VAR_TEMP_x4000, 103
	hasitem VAR_TEMP_x4000, 1, VAR_SPECIAL_x800C
	return

scr_seq_0755_T03R0101_0427:
	setvar VAR_TEMP_x4000, 101
	hasitem VAR_TEMP_x4000, 1, VAR_SPECIAL_x800C
	return

scr_seq_0755_T03R0101_0437:
	setvar VAR_TEMP_x4000, 102
	hasitem VAR_TEMP_x4000, 1, VAR_SPECIAL_x800C
	return

scr_seq_0755_T03R0101_0447:
	setvar VAR_TEMP_x4000, 99
	hasitem VAR_TEMP_x4000, 1, VAR_SPECIAL_x800C
	return

scr_seq_0755_T03R0101_0457:
	setvar VAR_TEMP_x4000, 100
	hasitem VAR_TEMP_x4000, 1, VAR_SPECIAL_x800C
	return

scr_seq_0755_T03R0101_0467:
	setvar VAR_TEMP_x4000, 104
	hasitem VAR_TEMP_x4000, 1, VAR_SPECIAL_x800C
	return

scr_seq_0755_T03R0101_0477:
	setvar VAR_TEMP_x4000, 105
	hasitem VAR_TEMP_x4000, 1, VAR_SPECIAL_x800C
	return

scr_seq_0755_T03R0101_0487:
	copyvar VAR_TEMP_x4001, VAR_TEMP_x4000
	return

scr_seq_0755_T03R0101_048F:
	copyvar VAR_TEMP_x4002, VAR_TEMP_x4000
	return

scr_seq_0755_T03R0101_0497:
	copyvar VAR_TEMP_x4003, VAR_TEMP_x4000
	return

scr_seq_0755_T03R0101_049F:
	copyvar VAR_TEMP_x4004, VAR_TEMP_x4000
	return

scr_seq_0755_T03R0101_04A7:
	copyvar VAR_TEMP_x4005, VAR_TEMP_x4000
	return

scr_seq_0755_T03R0101_04AF:
	copyvar VAR_TEMP_x4006, VAR_TEMP_x4000
	return

scr_seq_0755_T03R0101_04B7:
	copyvar VAR_TEMP_x4007, VAR_TEMP_x4000
	return

scr_seq_0755_T03R0101_04BF:
	copyvar VAR_SPECIAL_x8002, VAR_TEMP_x4001
	return

scr_seq_0755_T03R0101_04C7:
	copyvar VAR_SPECIAL_x8002, VAR_TEMP_x4002
	return

scr_seq_0755_T03R0101_04CF:
	copyvar VAR_SPECIAL_x8002, VAR_TEMP_x4003
	return

scr_seq_0755_T03R0101_04D7:
	copyvar VAR_SPECIAL_x8002, VAR_TEMP_x4004
	return

scr_seq_0755_T03R0101_04DF:
	copyvar VAR_SPECIAL_x8002, VAR_TEMP_x4005
	return

scr_seq_0755_T03R0101_04E7:
	copyvar VAR_SPECIAL_x8002, VAR_TEMP_x4006
	return

scr_seq_0755_T03R0101_04EF:
	copyvar VAR_SPECIAL_x8002, VAR_TEMP_x4007
	return

scr_seq_0755_T03R0101_04F7:
	getfossilminimumamount VAR_SPECIAL_x8002, VAR_SPECIAL_x8004, 1
	scrcmd_194 0, 32770
	npc_msg 7
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0755_T03R0101_053F
	getfossilpokemon VAR_UNK_407F, VAR_SPECIAL_x8002
	takeitem VAR_SPECIAL_x8002, 1, VAR_SPECIAL_x800C
	goto scr_seq_0755_T03R0101_0530

scr_seq_0755_T03R0101_0530:
	setflag FLAG_UNK_001
	npc_msg 3
	goto scr_seq_0755_T03R0101_05FC

scr_seq_0755_T03R0101_053D:
	.byte 0x02, 0x00
scr_seq_0755_T03R0101_053F:
	setvar VAR_UNK_407F, 0
	npc_msg 2
	goto scr_seq_0755_T03R0101_05FC

scr_seq_0755_T03R0101_054E:
	.byte 0x02, 0x00
scr_seq_0755_T03R0101_0550:
	buffer_species_name_custom 0, VAR_UNK_407F, 0, 0
	npc_msg 4
	get_party_count VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 6
	gotoif ne, scr_seq_0755_T03R0101_0575
	npc_msg 5
	goto scr_seq_0755_T03R0101_05FC

scr_seq_0755_T03R0101_0575:
	buffer_species_name_custom 1, VAR_UNK_407F, 0, 0
	buffer_players_name 0
	play_fanfare SEQ_ME_POKEGET
	npc_msg 8
	wait_fanfare
	scrcmd_137 16511, 20, 0, 0, 0, 32780
	scrcmd_420 116
	setvar VAR_UNK_407F, 0
	npc_msg 9
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0755_T03R0101_0600
	get_party_count VAR_TEMP_x4000
	subvar VAR_TEMP_x4000, 1
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_173 VAR_TEMP_x4000, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0755_T03R0101_05E8
	scrcmd_420 50
scr_seq_0755_T03R0101_05E8:
	fade_screen 6, 1, 1, 0
	wait_fade
	scrcmd_784 2, 1
	releaseall
	end

scr_seq_0755_T03R0101_05FC:
	waitbutton
	closemsg
scr_seq_0755_T03R0101_0600:
	scrcmd_784 2, 1
	releaseall
	end

scr_seq_0755_T03R0101_0608:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 0
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0755_T03R0101_070D
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0755_T03R0101_0721
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0755_T03R0101_0681
	apply_movement 255, scr_seq_0755_T03R0101_0738
	apply_movement 5, scr_seq_0755_T03R0101_0770
	goto scr_seq_0755_T03R0101_06AC

scr_seq_0755_T03R0101_0681:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0755_T03R0101_069C
	apply_movement 255, scr_seq_0755_T03R0101_0750
	goto scr_seq_0755_T03R0101_06AC

scr_seq_0755_T03R0101_069C:
	apply_movement 255, scr_seq_0755_T03R0101_075C
	apply_movement 5, scr_seq_0755_T03R0101_0770
scr_seq_0755_T03R0101_06AC:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0755_T03R0101_06D3
	apply_movement 253, scr_seq_0755_T03R0101_077C
	wait_movement
scr_seq_0755_T03R0101_06D3:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_615 65
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

scr_seq_0755_T03R0101_070D:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0755_T03R0101_0721:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0755_T03R0101_0735:
	.byte 0x00, 0x00, 0x00

scr_seq_0755_T03R0101_0738:
	.short 14, 1
	.short 12, 2
	.short 15, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0755_T03R0101_0750:
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0755_T03R0101_075C:
	.short 12, 1
	.short 15, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0755_T03R0101_0770:
	.short 63, 1
	.short 32, 1
	.short 254, 0

scr_seq_0755_T03R0101_077C:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
scr_seq_0755_T03R0101_078C:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 13
	waitbutton
	closemsg
	setvar VAR_UNK_4130, 5
	releaseall
	end

scr_seq_0755_T03R0101_07A3:
	end

scr_seq_0755_T03R0101_07A5:
	comparevartovalue VAR_UNK_4083, 0
	gotoif eq, scr_seq_0755_T03R0101_07BF
	comparevartovalue VAR_UNK_4083, 1
	gotoif eq, scr_seq_0755_T03R0101_07C1
scr_seq_0755_T03R0101_07BF:
	end

scr_seq_0755_T03R0101_07C1:
	scrcmd_490 16515
	scrcmd_344 0, 0
	show_person_at 6, 26, 0, 7, 1
	goto scr_seq_0755_T03R0101_07BF

scr_seq_0755_T03R0101_07DD:
	.byte 0x02, 0x00
scr_seq_0755_T03R0101_07DF:
	scrcmd_609
	lockall
	hasitem ITEM_ENIGMA_STONE, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0755_T03R0101_0963
	scrcmd_546 0, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0755_T03R0101_0963
	apply_movement 6, scr_seq_0755_T03R0101_0968
	wait_movement
	npc_msg 14
	closemsg
	apply_movement 6, scr_seq_0755_T03R0101_0970
	wait_movement
	npc_msg 15
	npc_msg 16
	closemsg
	apply_movement 6, scr_seq_0755_T03R0101_097C
	apply_movement 0, scr_seq_0755_T03R0101_09C8
	wait_movement
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	comparevartovalue VAR_TEMP_x4001, 6
	gotoif ne, scr_seq_0755_T03R0101_0868
	apply_movement 255, scr_seq_0755_T03R0101_0998
	goto scr_seq_0755_T03R0101_0870

scr_seq_0755_T03R0101_0868:
	apply_movement 255, scr_seq_0755_T03R0101_098C
scr_seq_0755_T03R0101_0870:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	apply_movement 255, scr_seq_0755_T03R0101_09A4
	wait_movement
	buffer_players_name 0
	npc_msg 17
	closemsg
	apply_movement 0, scr_seq_0755_T03R0101_09D0
	wait_movement
	npc_msg 18
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	wait 30, VAR_SPECIAL_x800C
	scrcmd_099 6
	show_person_at 6, 25, 0, 7, 1
	wait 10, VAR_SPECIAL_x800C
	scrcmd_098 6
	comparevartovalue VAR_TEMP_x4001, 6
	gotoif eq, scr_seq_0755_T03R0101_08F1
	scrcmd_729 VAR_TEMP_x4009
	comparevartovalue VAR_TEMP_x4009, 0
	gotoif eq, scr_seq_0755_T03R0101_08F1
	apply_movement 253, scr_seq_0755_T03R0101_09F0
	wait_movement
scr_seq_0755_T03R0101_08F1:
	fade_screen 6, 1, 1, 0
	wait_fade
	wait 10, VAR_SPECIAL_x800C
	apply_movement 0, scr_seq_0755_T03R0101_09D0
	wait_movement
	npc_msg 19
	closemsg
	apply_movement 0, scr_seq_0755_T03R0101_09D8
	wait_movement
	takeitem ITEM_ENIGMA_STONE, 1, VAR_SPECIAL_x800C
	setvar VAR_SPECIAL_x8004, 225
	setvar VAR_SPECIAL_x8005, 1
	callstd 2008
	closemsg
	apply_movement 6, scr_seq_0755_T03R0101_09B8
	wait_movement
	apply_movement 255, scr_seq_0755_T03R0101_0968
	wait_movement
	npc_msg 21
	closemsg
	apply_movement 6, scr_seq_0755_T03R0101_09C0
	wait_movement
	setvar VAR_UNK_4083, 2
	hide_person 6
scr_seq_0755_T03R0101_0963:
	releaseall
	end

scr_seq_0755_T03R0101_0967:
	.byte 0x00

scr_seq_0755_T03R0101_0968:
	.short 34, 1
	.short 254, 0

scr_seq_0755_T03R0101_0970:
	.short 63, 1
	.short 75, 1
	.short 254, 0

scr_seq_0755_T03R0101_097C:
	.short 71, 1
	.short 15, 1
	.short 72, 1
	.short 254, 0

scr_seq_0755_T03R0101_098C:
	.short 15, 1
	.short 1, 1
	.short 254, 0

scr_seq_0755_T03R0101_0998:
	.short 15, 1
	.short 13, 1
	.short 254, 0

scr_seq_0755_T03R0101_09A4:
	.short 13, 1
	.short 63, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0

scr_seq_0755_T03R0101_09B8:
	.short 3, 1
	.short 254, 0

scr_seq_0755_T03R0101_09C0:
	.short 14, 8
	.short 254, 0

scr_seq_0755_T03R0101_09C8:
	.short 32, 1
	.short 254, 0

scr_seq_0755_T03R0101_09D0:
	.short 32, 1
	.short 254, 0

scr_seq_0755_T03R0101_09D8:
	.short 12, 1
	.short 32, 1
	.short 71, 1
	.short 13, 1
	.short 72, 1
	.short 254, 0

scr_seq_0755_T03R0101_09F0:
	.short 20, 1
	.short 23, 1
	.short 1, 1
	.short 254, 0
scr_seq_0755_T03R0101_0A00:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0755_T03R0101_0A13:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 11
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0755_T03R0101_0A26:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 12
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0755_T03R0101_0A39:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 22
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0755_T03R0101_0A4A:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 23
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0755_T03R0101_0A5B:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 24
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0755_T03R0101_0A6C:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 25
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0755_T03R0101_0A7D:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 26
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0755_T03R0101_0A8E:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 27
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0755_T03R0101_0A9F:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 28
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0755_T03R0101_0AB0:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 29
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
