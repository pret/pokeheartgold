#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0202_R14_0055 ; 000
	scrdef scr_seq_0202_R14_001A ; 001
	scrdef scr_seq_0202_R14_0210 ; 002
	scrdef scr_seq_0202_R14_0598 ; 003
	scrdef scr_seq_0202_R14_05AE ; 004
	scrdef scr_seq_0202_R14_05C4 ; 005
	scrdef_end

scr_seq_0202_R14_001A:
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_0202_R14_002B
	clearflag FLAG_UNK_189
	end

scr_seq_0202_R14_002B:
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif eq, scr_seq_0202_R14_004F
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, scr_seq_0202_R14_004F
	setflag FLAG_UNK_27E
	end

scr_seq_0202_R14_004F:
	clearflag FLAG_UNK_27E
	end

scr_seq_0202_R14_0055:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0202_R14_017D
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0202_R14_0191
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0202_R14_00CE
	apply_movement 255, scr_seq_0202_R14_01A8
	apply_movement 10, scr_seq_0202_R14_01F4
	goto scr_seq_0202_R14_011C

scr_seq_0202_R14_00CE:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0202_R14_00E9
	apply_movement 255, scr_seq_0202_R14_01C0
	goto scr_seq_0202_R14_011C

scr_seq_0202_R14_00E9:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0202_R14_010C
	apply_movement 255, scr_seq_0202_R14_01E0
	apply_movement 10, scr_seq_0202_R14_01F4
	goto scr_seq_0202_R14_011C

scr_seq_0202_R14_010C:
	apply_movement 255, scr_seq_0202_R14_01CC
	apply_movement 10, scr_seq_0202_R14_01F4
scr_seq_0202_R14_011C:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0202_R14_0143
	apply_movement 253, scr_seq_0202_R14_0200
	wait_movement
scr_seq_0202_R14_0143:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_615 60
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

scr_seq_0202_R14_017D:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0202_R14_0191:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0202_R14_01A5:
	.byte 0x00, 0x00, 0x00

scr_seq_0202_R14_01A8:
	.short 15, 1
	.short 12, 2
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0202_R14_01C0:
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0202_R14_01CC:
	.short 12, 1
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0202_R14_01E0:
	.short 12, 1
	.short 15, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0202_R14_01F4:
	.short 63, 1
	.short 32, 1
	.short 254, 0

scr_seq_0202_R14_0200:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
scr_seq_0202_R14_0210:
	scrcmd_609
	lockall
	clearflag FLAG_UNK_2A5
	show_person 12
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4000, 1358
	gotoif ne, scr_seq_0202_R14_024F
	apply_movement 255, scr_seq_0202_R14_0450
	wait_movement
	goto scr_seq_0202_R14_027C

scr_seq_0202_R14_0249:
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
scr_seq_0202_R14_024F:
	goto scr_seq_0202_R14_0255

scr_seq_0202_R14_0255:
	comparevartovalue VAR_TEMP_x4001, 409
	gotoif ne, scr_seq_0202_R14_0272
	apply_movement 255, scr_seq_0202_R14_0450
	wait_movement
	goto scr_seq_0202_R14_027C

scr_seq_0202_R14_0272:
	apply_movement 255, scr_seq_0202_R14_0450
	wait_movement
scr_seq_0202_R14_027C:
	scrcmd_076 245, 0
	scrcmd_099 11
	scrcmd_523 11, 2, 90, 2, 0
	scrcmd_098 11
	scrcmd_077
	comparevartovalue VAR_TEMP_x4000, 1358
	gotoif ne, scr_seq_0202_R14_02B1
	goto scr_seq_0202_R14_02D0

scr_seq_0202_R14_02AB:
	.byte 0x16, 0x00, 0x1f, 0x00, 0x00
	.byte 0x00
scr_seq_0202_R14_02B1:
	comparevartovalue VAR_TEMP_x4000, 1359
	gotoif ne, scr_seq_0202_R14_02CA
	goto scr_seq_0202_R14_0382

scr_seq_0202_R14_02C4:
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
scr_seq_0202_R14_02CA:
	goto scr_seq_0202_R14_03AD

scr_seq_0202_R14_02D0:
	comparevartovalue VAR_TEMP_x4001, 409
	gotoif ne, scr_seq_0202_R14_02EB
	apply_movement 255, scr_seq_0202_R14_04AC
	goto scr_seq_0202_R14_037A

scr_seq_0202_R14_02EB:
	comparevartovalue VAR_TEMP_x4001, 410
	gotoif ne, scr_seq_0202_R14_0306
	apply_movement 255, scr_seq_0202_R14_04C0
	goto scr_seq_0202_R14_037A

scr_seq_0202_R14_0306:
	comparevartovalue VAR_TEMP_x4001, 411
	gotoif ne, scr_seq_0202_R14_0321
	apply_movement 255, scr_seq_0202_R14_04D0
	goto scr_seq_0202_R14_037A

scr_seq_0202_R14_0321:
	comparevartovalue VAR_TEMP_x4001, 412
	gotoif ne, scr_seq_0202_R14_033C
	apply_movement 255, scr_seq_0202_R14_04E0
	goto scr_seq_0202_R14_037A

scr_seq_0202_R14_033C:
	comparevartovalue VAR_TEMP_x4001, 413
	gotoif ne, scr_seq_0202_R14_0357
	apply_movement 255, scr_seq_0202_R14_04E8
	goto scr_seq_0202_R14_037A

scr_seq_0202_R14_0357:
	comparevartovalue VAR_TEMP_x4001, 414
	gotoif ne, scr_seq_0202_R14_0372
	apply_movement 255, scr_seq_0202_R14_04F8
	goto scr_seq_0202_R14_037A

scr_seq_0202_R14_0372:
	apply_movement 255, scr_seq_0202_R14_0508
scr_seq_0202_R14_037A:
	wait_movement
	goto scr_seq_0202_R14_03D2

scr_seq_0202_R14_0382:
	comparevartovalue VAR_TEMP_x4001, 409
	gotoif ne, scr_seq_0202_R14_039D
	apply_movement 255, scr_seq_0202_R14_051C
	goto scr_seq_0202_R14_03A5

scr_seq_0202_R14_039D:
	apply_movement 255, scr_seq_0202_R14_0530
scr_seq_0202_R14_03A5:
	wait_movement
	goto scr_seq_0202_R14_03D2

scr_seq_0202_R14_03AD:
	comparevartovalue VAR_TEMP_x4001, 409
	gotoif ne, scr_seq_0202_R14_03C8
	apply_movement 255, scr_seq_0202_R14_0544
	goto scr_seq_0202_R14_03D0

scr_seq_0202_R14_03C8:
	apply_movement 255, scr_seq_0202_R14_0550
scr_seq_0202_R14_03D0:
	wait_movement
scr_seq_0202_R14_03D2:
	apply_movement 11, scr_seq_0202_R14_0488
	apply_movement 255, scr_seq_0202_R14_055C
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	callstd 2042
	apply_movement 12, scr_seq_0202_R14_057C
	apply_movement 255, scr_seq_0202_R14_056C
	wait_movement
	buffer_players_name 0
	npc_msg 6
	waitbutton
	closemsg
	callstd 2043
	hide_person 11
	setflag FLAG_UNK_2A0
	setflag FLAG_UNK_2A5
	clearflag FLAG_UNK_2AC
	setvar VAR_UNK_4086, 0
	setflag FLAG_UNK_14D
	check_badge 9, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0202_R14_0449
	clearflag FLAG_UNK_2A1
	setvar VAR_UNK_4089, 1
scr_seq_0202_R14_0449:
	releaseall
	end

scr_seq_0202_R14_044D:
	.byte 0x00, 0x00, 0x00

scr_seq_0202_R14_0450:
	.short 75, 1
	.short 254, 0
	.byte 0x3e, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00
	.byte 0xfe, 0x00, 0x00, 0x00, 0x3e, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00
	.byte 0x3e, 0x00, 0x01, 0x00, 0x01, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00, 0x5f, 0x00, 0x01, 0x00
	.byte 0x02, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00

scr_seq_0202_R14_0488:
	.short 20, 2
	.short 52, 1
	.short 56, 1
	.short 20, 2
	.short 52, 1
	.short 56, 2
	.short 20, 2
	.short 52, 1
	.short 254, 0

scr_seq_0202_R14_04AC:
	.short 13, 1
	.short 15, 3
	.short 13, 2
	.short 3, 1
	.short 254, 0

scr_seq_0202_R14_04C0:
	.short 15, 3
	.short 13, 2
	.short 3, 1
	.short 254, 0

scr_seq_0202_R14_04D0:
	.short 15, 3
	.short 13, 1
	.short 3, 1
	.short 254, 0

scr_seq_0202_R14_04E0:
	.short 15, 3
	.short 254, 0

scr_seq_0202_R14_04E8:
	.short 15, 3
	.short 12, 1
	.short 3, 1
	.short 254, 0

scr_seq_0202_R14_04F8:
	.short 15, 3
	.short 12, 2
	.short 3, 1
	.short 254, 0

scr_seq_0202_R14_0508:
	.short 12, 1
	.short 15, 3
	.short 12, 2
	.short 3, 1
	.short 254, 0

scr_seq_0202_R14_051C:
	.short 13, 1
	.short 15, 2
	.short 13, 2
	.short 3, 1
	.short 254, 0

scr_seq_0202_R14_0530:
	.short 12, 1
	.short 15, 2
	.short 12, 2
	.short 3, 1
	.short 254, 0

scr_seq_0202_R14_0544:
	.short 13, 3
	.short 3, 1
	.short 254, 0

scr_seq_0202_R14_0550:
	.short 12, 3
	.short 3, 1
	.short 254, 0

scr_seq_0202_R14_055C:
	.short 63, 1
	.short 0, 1
	.short 12, 1
	.short 254, 0

scr_seq_0202_R14_056C:
	.short 65, 5
	.short 2, 1
	.short 254, 0
	.byte 0xfe, 0x00, 0x00, 0x00

scr_seq_0202_R14_057C:
	.short 16, 11
	.short 12, 2
	.short 4, 1
	.short 63, 3
	.short 9, 1
	.short 3, 1
	.short 254, 0
scr_seq_0202_R14_0598:
	buffer_players_name 0
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0202_R14_05AE:
	buffer_players_name 0
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0202_R14_05C4:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_15C
	gotoif TRUE, scr_seq_0202_R14_0658
	npc_msg 0
	scrcmd_184 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0202_R14_0602
	get_lead_mon_index VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 113
	gotoif eq, scr_seq_0202_R14_060D
scr_seq_0202_R14_0602:
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0202_R14_060D:
	apply_movement 17, scr_seq_0202_R14_0698
	wait_movement
	npc_msg 2
	setvar VAR_SPECIAL_x8004, 256
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0202_R14_064E
	callstd std_give_item_verbose
	setflag FLAG_UNK_15C
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0202_R14_064E:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

scr_seq_0202_R14_0658:
	scrcmd_184 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0202_R14_0680
	get_lead_mon_index VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 113
	gotoif eq, scr_seq_0202_R14_068B
scr_seq_0202_R14_0680:
	npc_msg 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0202_R14_068B:
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0202_R14_0696:
	.byte 0x00, 0x00

scr_seq_0202_R14_0698:
	.short 75, 1
	.short 62, 1
	.short 254, 0
	.balign 4, 0
