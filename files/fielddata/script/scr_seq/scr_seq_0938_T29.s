#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0938_T29_004E ; 000
	scrdef scr_seq_0938_T29_03C3 ; 001
	scrdef scr_seq_0938_T29_01B3 ; 002
	scrdef scr_seq_0938_T29_047C ; 003
	scrdef scr_seq_0938_T29_054C ; 004
	scrdef scr_seq_0938_T29_0275 ; 005
	scrdef scr_seq_0938_T29_0577 ; 006
	scrdef scr_seq_0938_T29_06FB ; 007
	scrdef scr_seq_0938_T29_0723 ; 008
	scrdef scr_seq_0938_T29_0736 ; 009
	scrdef scr_seq_0938_T29_075C ; 010
	scrdef scr_seq_0938_T29_076F ; 011
	scrdef scr_seq_0938_T29_0782 ; 012
	scrdef scr_seq_0938_T29_0795 ; 013
	scrdef scr_seq_0938_T29_05CD ; 014
	scrdef scr_seq_0938_T29_05E7 ; 015
	scrdef scr_seq_0938_T29_0601 ; 016
	scrdef scr_seq_0938_T29_01DA ; 017
	scrdef scr_seq_0938_T29_06E2 ; 018
	scrdef_end

scr_seq_0938_T29_004E:
	checkflag FLAG_UNK_0C9
	gotoif TRUE, scr_seq_0938_T29_007F
	setflag FLAG_UNK_1FC
	setflag FLAG_UNK_1FE
	setflag FLAG_UNK_011
	setflag FLAG_UNK_013
	setflag FLAG_UNK_014
	setflag FLAG_UNK_015
	setflag FLAG_UNK_289
	setflag FLAG_UNK_28B
	setflag FLAG_UNK_28C
	end

scr_seq_0938_T29_007F:
	goto scr_seq_0938_T29_0115

scr_seq_0938_T29_0085:
	comparevartovalue VAR_UNK_4037, 61993
	gotoif eq, scr_seq_0938_T29_00BC
	setflag FLAG_UNK_1FC
	setflag FLAG_UNK_1FE
	clearflag FLAG_UNK_1FF
	setflag FLAG_UNK_011
	setflag FLAG_UNK_013
	setflag FLAG_UNK_014
	setflag FLAG_UNK_015
	setflag FLAG_UNK_289
	setflag FLAG_UNK_28B
	setflag FLAG_UNK_28C
	end

scr_seq_0938_T29_00BC:
	clearflag FLAG_UNK_1FC
	clearflag FLAG_UNK_1FE
	setflag FLAG_UNK_1FF
	clearflag FLAG_UNK_289
	clearflag FLAG_UNK_28B
	clearflag FLAG_UNK_28C
	checkflag FLAG_UNK_146
	gotoif TRUE, scr_seq_0938_T29_00E5
	goto scr_seq_0938_T29_00E9

scr_seq_0938_T29_00E5:
	setflag FLAG_UNK_289
scr_seq_0938_T29_00E9:
	checkflag FLAG_UNK_147
	gotoif TRUE, scr_seq_0938_T29_00FA
	goto scr_seq_0938_T29_00FE

scr_seq_0938_T29_00FA:
	setflag FLAG_UNK_28B
scr_seq_0938_T29_00FE:
	checkflag FLAG_UNK_148
	gotoif TRUE, scr_seq_0938_T29_010F
	goto scr_seq_0938_T29_0113

scr_seq_0938_T29_010F:
	setflag FLAG_UNK_28C
scr_seq_0938_T29_0113:
	end

scr_seq_0938_T29_0115:
	scrcmd_147 39, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0938_T29_01A7
	checkflag FLAG_UNK_964
	gotoif TRUE, scr_seq_0938_T29_0139
	goto scr_seq_0938_T29_01A7

scr_seq_0938_T29_0139:
	scrcmd_522 16384
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif ne, scr_seq_0938_T29_0154
	clearflag FLAG_UNK_2CC
	goto scr_seq_0938_T29_019F

scr_seq_0938_T29_0154:
	comparevartovalue VAR_TEMP_x4000, 7
	gotoif ne, scr_seq_0938_T29_016B
	clearflag FLAG_UNK_2CC
	goto scr_seq_0938_T29_019F

scr_seq_0938_T29_016B:
	comparevartovalue VAR_TEMP_x4000, 8
	gotoif ne, scr_seq_0938_T29_0182
	clearflag FLAG_UNK_2CC
	goto scr_seq_0938_T29_019F

scr_seq_0938_T29_0182:
	comparevartovalue VAR_TEMP_x4000, 9
	gotoif ne, scr_seq_0938_T29_0199
	clearflag FLAG_UNK_2CC
	goto scr_seq_0938_T29_019F

scr_seq_0938_T29_0199:
	goto scr_seq_0938_T29_01A7

scr_seq_0938_T29_019F:
	goto scr_seq_0938_T29_0085

scr_seq_0938_T29_01A5:
	.byte 0x02, 0x00
scr_seq_0938_T29_01A7:
	setflag FLAG_UNK_2CC
	goto scr_seq_0938_T29_0085

scr_seq_0938_T29_01B1:
	.byte 0x02, 0x00
scr_seq_0938_T29_01B3:
	checkflag FLAG_UNK_0A4
	gotoif TRUE, scr_seq_0938_T29_01C0
	end

scr_seq_0938_T29_01C0:
	setflag FLAG_UNK_1E3
	hide_person 3
	clearflag FLAG_UNK_1E4
	show_person 8
	show_person 10
	clearflag FLAG_UNK_0A4
	end

scr_seq_0938_T29_01DA:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_TEMP_x4004, 1
	gotoif ge, scr_seq_0938_T29_026A
	npc_msg 13
scr_seq_0938_T29_01F2:
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0938_T29_0216
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, scr_seq_0938_T29_0259
	end

scr_seq_0938_T29_0216:
	buffer_players_name 0
	npc_msg 14
	play_fanfare SEQ_ME_POKEGEAR_REGIST
	wait_fanfare
	register_gear_number 39
	npc_msg 15
	waitbutton
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	setflag FLAG_UNK_2CC
	hide_person 20
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 1, 0
	wait_fade
	releaseall
	end

scr_seq_0938_T29_0259:
	setvar VAR_TEMP_x4004, 1
	npc_msg 16
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0938_T29_026A:
	npc_msg 17
	goto scr_seq_0938_T29_01F2

scr_seq_0938_T29_0273:
	.byte 0x02, 0x00
scr_seq_0938_T29_0275:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_lead_mon_index VAR_SPECIAL_x8002
	mon_has_ribbon VAR_SPECIAL_x800C, VAR_SPECIAL_x8002, RIBBON_DOWNCAST
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0938_T29_039B
	checkflag FLAG_GOT_SHOCK_RIBBON
	gotoif TRUE, scr_seq_0938_T29_03AF
	comparevartovalue VAR_NUM_MET_WEEKDAY_SIBLINGS, 7
	gotoif eq, scr_seq_0938_T29_0349
	checkflag FLAG_UNK_0D5
	gotoif TRUE, scr_seq_0938_T29_032B
	get_weekday VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, scr_seq_0938_T29_02DC
	get_std_msg_naix 0, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 11
	goto scr_seq_0938_T29_0323

scr_seq_0938_T29_02DC:
	get_std_msg_naix 0, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 8
	setvar VAR_SPECIAL_x8004, 241
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0938_T29_033F
	callstd std_give_item_verbose
	setflag FLAG_UNK_0D5
	addvar VAR_NUM_MET_WEEKDAY_SIBLINGS, 1
	get_std_msg_naix 0, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 9
scr_seq_0938_T29_0323:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0938_T29_032B:
	get_std_msg_naix 0, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0938_T29_033F:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

scr_seq_0938_T29_0349:
	get_weekday VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, scr_seq_0938_T29_036C
	get_std_msg_naix 0, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 11
	goto scr_seq_0938_T29_0323

scr_seq_0938_T29_036C:
	get_std_msg_naix 0, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 36
	buffer_mon_species_name 0, VAR_SPECIAL_x8002
	msgbox_extern VAR_SPECIAL_x800C, 38
	give_ribbon VAR_SPECIAL_x8002, RIBBON_DOWNCAST
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	setflag FLAG_GOT_SHOCK_RIBBON
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0938_T29_039B:
	get_std_msg_naix 0, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 37
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0938_T29_03AF:
	get_std_msg_naix 0, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 39
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0938_T29_03C3:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 130, 0
	npc_msg 0
	scrcmd_077
	closemsg
	setflag FLAG_UNK_0A4
	scrcmd_589 130, 30, 1
	clearflag FLAG_UNK_0A4
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0938_T29_0456
	scrcmd_683 16386
	comparevartovalue VAR_TEMP_x4002, 3
	gotoif eq, scr_seq_0938_T29_0452
	comparevartovalue VAR_TEMP_x4002, 4
	callif eq, scr_seq_0938_T29_0466
	checkflag FLAG_UNK_0C9
	gotoif TRUE, scr_seq_0938_T29_046C
	scrcmd_052
	setvar VAR_SPECIAL_x8004, 478
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0938_T29_045C
	callstd std_give_item_verbose
	setflag FLAG_UNK_0C9
	clearflag FLAG_UNK_28A
	closemsg
scr_seq_0938_T29_0452:
	releaseall
	end

scr_seq_0938_T29_0456:
	white_out
	releaseall
	end

scr_seq_0938_T29_045C:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

scr_seq_0938_T29_0466:
	setflag FLAG_UNK_16A
	return

scr_seq_0938_T29_046C:
	clearflag FLAG_UNK_1E4
	hide_person 8
	hide_person 10
	releaseall
	end

scr_seq_0938_T29_047C:
	checkflag FLAG_UNK_0C3
	gotoif TRUE, scr_seq_0938_T29_0509
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 2
	faceplayer
	buffer_players_name 0
	gender_msgbox 3, 4
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0938_T29_04BB
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0938_T29_04FA
scr_seq_0938_T29_04BB:
	buffer_players_name 0
	gender_msgbox 5, 6
	waitbutton
	closemsg
	apply_movement 10, scr_seq_0938_T29_0538
	wait_movement
	apply_movement 8, scr_seq_0938_T29_0544
	wait_movement
	scrcmd_775 8, 10
	setflag FLAG_UNK_1E4
	hide_person 8
	hide_person 10
	clearflag FLAG_UNK_1F8
	setvar VAR_UNK_40A8, 1
	releaseall
	end

scr_seq_0938_T29_04FA:
	setflag FLAG_UNK_0C3
	npc_msg 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0938_T29_0509:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 8
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0938_T29_04BB
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0938_T29_04FA
	end


scr_seq_0938_T29_0538:
	.short 34, 1
	.short 50, 2
	.short 254, 0

scr_seq_0938_T29_0544:
	.short 33, 1
	.short 254, 0
scr_seq_0938_T29_054C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_RED_GYARADOS_MEET
	gotoif TRUE, scr_seq_0938_T29_056A
	npc_msg 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0938_T29_056A:
	npc_msg 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0938_T29_0575:
	.byte 0x02, 0x00
scr_seq_0938_T29_0577:
	checkflag FLAG_UNK_139
	gotoif TRUE, scr_seq_0938_T29_0597
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 31, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0938_T29_0597:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_784 0, 0
	scrcmd_393 0, 1, 129
	scrcmd_784 0, 1
	buffer_players_name 2
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 32, VAR_SPECIAL_x800C
	callstd 2000
	dummy_486
	dummy_486
	releaseall
	end

scr_seq_0938_T29_05CD:
	setvar VAR_TEMP_x4001, 1
	setvar VAR_SPECIAL_x8008, 27
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0938_T29_061B

scr_seq_0938_T29_05E5:
	.byte 0x02, 0x00
scr_seq_0938_T29_05E7:
	setvar VAR_TEMP_x4001, 2
	setvar VAR_SPECIAL_x8008, 29
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0938_T29_061B

scr_seq_0938_T29_05FF:
	.byte 0x02
	.byte 0x00
scr_seq_0938_T29_0601:
	setvar VAR_TEMP_x4001, 3
	setvar VAR_SPECIAL_x8008, 23
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0938_T29_061B

scr_seq_0938_T29_0619:
	.byte 0x02, 0x00
scr_seq_0938_T29_061B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	wait_se SEQ_SE_DP_SELECT
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x8008
	copyvar VAR_SPECIAL_x8005, VAR_SPECIAL_x8009
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0938_T29_0657
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0938_T29_06CA
	end

scr_seq_0938_T29_0657:
	callstd 2001
	hide_person VAR_SPECIAL_x800D
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif ne, scr_seq_0938_T29_0676
	setflag FLAG_UNK_146
	goto scr_seq_0938_T29_0691

scr_seq_0938_T29_0676:
	comparevartovalue VAR_TEMP_x4001, 2
	gotoif ne, scr_seq_0938_T29_068D
	setflag FLAG_UNK_147
	goto scr_seq_0938_T29_0691

scr_seq_0938_T29_068D:
	setflag FLAG_UNK_148
scr_seq_0938_T29_0691:
	giveitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	buffer_players_name 0
	buffer_item_name 1, 32772
	npc_msg 33
	wait_fanfare
	buffer_players_name 0
	buffer_item_name 1, 32772
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	buffer_pocket_name 2, 32780
	npc_msg 34
	waitbutton
	setvar VAR_SPECIAL_x800C, 1
scr_seq_0938_T29_06C4:
	closemsg
	releaseall
	end

scr_seq_0938_T29_06CA:
	buffer_item_name 0, 32772
	npc_msg 35
	waitbutton
	setvar VAR_SPECIAL_x800C, 0
	goto scr_seq_0938_T29_06C4

scr_seq_0938_T29_06E0:
	.byte 0x02, 0x00
scr_seq_0938_T29_06E2:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 149, 0
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0938_T29_06FB:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 30, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0938_T29_0710:
	.byte 0x49, 0x00, 0xdc, 0x05, 0x60, 0x00, 0x68, 0x00, 0x2d, 0x00, 0x09, 0x32, 0x00, 0x35, 0x00, 0x61
	.byte 0x00, 0x02, 0x00
scr_seq_0938_T29_0723:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 12
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0938_T29_0736:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 11
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0938_T29_0749:
	.byte 0x49, 0x00, 0xdc, 0x05, 0x60, 0x00, 0x68
	.byte 0x00, 0x2d, 0x00, 0x00, 0x32, 0x00, 0x35, 0x00, 0x61, 0x00, 0x02, 0x00
scr_seq_0938_T29_075C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 18
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0938_T29_076F:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 21
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0938_T29_0782:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 24
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0938_T29_0795:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 27
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
