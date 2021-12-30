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
	setflag FLAG_HIDE_CAMERON
	end

scr_seq_0202_R14_004F:
	clearflag FLAG_HIDE_CAMERON
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
	photo_album_is_full VAR_SPECIAL_x800C
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
	fade_screen 6, 1, 0, 0x00
	wait_fade
	cameron_photo 60
	lockall
	fade_screen 6, 1, 1, 0x00
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
	step 15, 1
	step 12, 2
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

scr_seq_0202_R14_01C0:
	step 12, 3
	step 33, 1
	step_end

scr_seq_0202_R14_01CC:
	step 12, 1
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

scr_seq_0202_R14_01E0:
	step 12, 1
	step 15, 1
	step 12, 3
	step 33, 1
	step_end

scr_seq_0202_R14_01F4:
	step 63, 1
	step 32, 1
	step_end

scr_seq_0202_R14_0200:
	step 15, 1
	step 12, 1
	step 1, 1
	step_end
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
	release 11
	scrcmd_523 11, 2, 90, 2, 0
	lock 11
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
	step 75, 1
	step_end
	.byte 0x3e, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00
	.byte 0xfe, 0x00, 0x00, 0x00, 0x3e, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00
	.byte 0x3e, 0x00, 0x01, 0x00, 0x01, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00, 0x5f, 0x00, 0x01, 0x00
	.byte 0x02, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00

scr_seq_0202_R14_0488:
	step 20, 2
	step 52, 1
	step 56, 1
	step 20, 2
	step 52, 1
	step 56, 2
	step 20, 2
	step 52, 1
	step_end

scr_seq_0202_R14_04AC:
	step 13, 1
	step 15, 3
	step 13, 2
	step 3, 1
	step_end

scr_seq_0202_R14_04C0:
	step 15, 3
	step 13, 2
	step 3, 1
	step_end

scr_seq_0202_R14_04D0:
	step 15, 3
	step 13, 1
	step 3, 1
	step_end

scr_seq_0202_R14_04E0:
	step 15, 3
	step_end

scr_seq_0202_R14_04E8:
	step 15, 3
	step 12, 1
	step 3, 1
	step_end

scr_seq_0202_R14_04F8:
	step 15, 3
	step 12, 2
	step 3, 1
	step_end

scr_seq_0202_R14_0508:
	step 12, 1
	step 15, 3
	step 12, 2
	step 3, 1
	step_end

scr_seq_0202_R14_051C:
	step 13, 1
	step 15, 2
	step 13, 2
	step 3, 1
	step_end

scr_seq_0202_R14_0530:
	step 12, 1
	step 15, 2
	step 12, 2
	step 3, 1
	step_end

scr_seq_0202_R14_0544:
	step 13, 3
	step 3, 1
	step_end

scr_seq_0202_R14_0550:
	step 12, 3
	step 3, 1
	step_end

scr_seq_0202_R14_055C:
	step 63, 1
	step 0, 1
	step 12, 1
	step_end

scr_seq_0202_R14_056C:
	step 65, 5
	step 2, 1
	step_end
	.byte 0xfe, 0x00, 0x00, 0x00

scr_seq_0202_R14_057C:
	step 16, 11
	step 12, 2
	step 4, 1
	step 63, 3
	step 9, 1
	step 3, 1
	step_end
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
	step 75, 1
	step 62, 1
	step_end
	.balign 4, 0
