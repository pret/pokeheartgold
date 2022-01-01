#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T03R0101.h"
#include "msgdata/msg/msg_0464_T03R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T03R0101_000
	scrdef scr_seq_T03R0101_001
	scrdef scr_seq_T03R0101_002
	scrdef scr_seq_T03R0101_003
	scrdef scr_seq_T03R0101_004
	scrdef scr_seq_T03R0101_005
	scrdef scr_seq_T03R0101_006
	scrdef scr_seq_T03R0101_007
	scrdef scr_seq_T03R0101_008
	scrdef scr_seq_T03R0101_009
	scrdef scr_seq_T03R0101_010
	scrdef scr_seq_T03R0101_011
	scrdef scr_seq_T03R0101_012
	scrdef scr_seq_T03R0101_013
	scrdef scr_seq_T03R0101_014
	scrdef scr_seq_T03R0101_015
	scrdef scr_seq_T03R0101_016
	scrdef scr_seq_T03R0101_017
	scrdef scr_seq_T03R0101_018
	scrdef scr_seq_T03R0101_019
	scrdef_end

scr_seq_T03R0101_014:
	comparevartovalue VAR_UNK_4083, 5
	gotoif ge, _00E8
	comparevartovalue VAR_UNK_4083, 4
	gotoif eq, _00E8
	comparevartovalue VAR_UNK_4083, 3
	gotoif eq, _00D8
	comparevartovalue VAR_UNK_4083, 2
	gotoif eq, _00D8
	comparevartovalue VAR_UNK_4083, 1
	gotoif eq, _00CE
	hasitem ITEM_ENIGMA_STONE, 1, VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, _00F4
	scrcmd_546 0, 16384
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, _00F4
	scrcmd_490 VAR_TEMP_x4007
	setvar VAR_UNK_4083, 1
	clearflag FLAG_UNK_308
	setflag FLAG_UNK_317
	end

_00CE:
	clearflag FLAG_UNK_308
	setflag FLAG_UNK_317
	end

_00D8:
	setflag FLAG_UNK_308
	setflag FLAG_UNK_317
	goto _0104
	.byte 0x02, 0x00
_00E8:
	setflag FLAG_UNK_308
	goto _0104
	.byte 0x02, 0x00
_00F4:
	scrcmd_490 VAR_TEMP_x4006
	setflag FLAG_UNK_308
	goto _0104
	.byte 0x02, 0x00
_0104:
	checkflag FLAG_UNK_189
	gotoif FALSE, _0115
	clearflag FLAG_UNK_189
	end

_0115:
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, _0139
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, _0139
	setflag FLAG_HIDE_CAMERON
	end

_0139:
	clearflag FLAG_HIDE_CAMERON
	end

scr_seq_T03R0101_017:
	end
	.byte 0xea, 0x01, 0x06, 0x40, 0x02, 0x00
scr_seq_T03R0101_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0464_T03R0101_00000
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T03R0101_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_784 2, 0
	checkflag FLAG_MAPTEMP_001
	gotoif TRUE, _0530
	comparevartovalue VAR_UNK_407F, 0
	gotoif ne, _0550
	npc_msg msg_0464_T03R0101_00001
	countfossils VAR_SPECIAL_x8000
	comparevartovalue VAR_SPECIAL_x8000, 0
	gotoif ne, _019B
	npc_msg msg_0464_T03R0101_00006
	goto _05FC

_019B:
	comparevartovalue VAR_SPECIAL_x8000, 1
	gotoif eq, _04F7
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
	gotoif eq, _04F7
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
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_x8000
_0263:
	comparevartovalue VAR_SPECIAL_x8005, 0
	callif eq, _0417
	comparevartovalue VAR_SPECIAL_x8005, 1
	callif eq, _0427
	comparevartovalue VAR_SPECIAL_x8005, 2
	callif eq, _0437
	comparevartovalue VAR_SPECIAL_x8005, 3
	callif eq, _0447
	comparevartovalue VAR_SPECIAL_x8005, 4
	callif eq, _0457
	comparevartovalue VAR_SPECIAL_x8005, 5
	callif eq, _0467
	comparevartovalue VAR_SPECIAL_x8005, 6
	callif eq, _0477
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0340
	comparevartovalue VAR_SPECIAL_x8004, 0
	callif eq, _0487
	comparevartovalue VAR_SPECIAL_x8004, 1
	callif eq, _048F
	comparevartovalue VAR_SPECIAL_x8004, 2
	callif eq, _0497
	comparevartovalue VAR_SPECIAL_x8004, 3
	callif eq, _049F
	comparevartovalue VAR_SPECIAL_x8004, 4
	callif eq, _04A7
	comparevartovalue VAR_SPECIAL_x8004, 5
	callif eq, _04AF
	comparevartovalue VAR_SPECIAL_x8004, 6
	callif eq, _04B7
	copyvar VAR_SPECIAL_x8006, VAR_SPECIAL_x8005
	addvar VAR_SPECIAL_x8006, 159
	menu_item_add 32774, 255, 32772
	goto _034C

_0340:
	addvar VAR_SPECIAL_x8005, 1
	goto _0263

_034C:
	addvar VAR_SPECIAL_x8004, 1
	addvar VAR_SPECIAL_x8005, 1
	comparevartovar VAR_SPECIAL_x8004, VAR_SPECIAL_x8001
	gotoif ne, _0263
	menu_item_add 45, 255, 32772
	menu_exec
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x8000, 255
	gotoif eq, _053F
	comparevartovalue VAR_SPECIAL_x8000, 0
	callif eq, _04BF
	comparevartovalue VAR_SPECIAL_x8000, 1
	callif eq, _04C7
	comparevartovalue VAR_SPECIAL_x8000, 2
	callif eq, _04CF
	comparevartovalue VAR_SPECIAL_x8000, 3
	callif eq, _04D7
	comparevartovalue VAR_SPECIAL_x8000, 4
	callif eq, _04DF
	comparevartovalue VAR_SPECIAL_x8000, 5
	callif eq, _04E7
	comparevartovalue VAR_SPECIAL_x8000, 6
	callif eq, _04EF
	getfossilpokemon VAR_UNK_407F, VAR_SPECIAL_x8002
	comparevartovalue VAR_UNK_407F, 0
	gotoif eq, _053F
	buffer_item_name 0, VAR_SPECIAL_x8002
	npc_msg msg_0464_T03R0101_00007
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _053F
	takeitem VAR_SPECIAL_x8002, 1, VAR_SPECIAL_x800C
	goto _0530

_0417:
	setvar VAR_TEMP_x4000, 103
	hasitem VAR_TEMP_x4000, 1, VAR_SPECIAL_x800C
	return

_0427:
	setvar VAR_TEMP_x4000, 101
	hasitem VAR_TEMP_x4000, 1, VAR_SPECIAL_x800C
	return

_0437:
	setvar VAR_TEMP_x4000, 102
	hasitem VAR_TEMP_x4000, 1, VAR_SPECIAL_x800C
	return

_0447:
	setvar VAR_TEMP_x4000, 99
	hasitem VAR_TEMP_x4000, 1, VAR_SPECIAL_x800C
	return

_0457:
	setvar VAR_TEMP_x4000, 100
	hasitem VAR_TEMP_x4000, 1, VAR_SPECIAL_x800C
	return

_0467:
	setvar VAR_TEMP_x4000, 104
	hasitem VAR_TEMP_x4000, 1, VAR_SPECIAL_x800C
	return

_0477:
	setvar VAR_TEMP_x4000, 105
	hasitem VAR_TEMP_x4000, 1, VAR_SPECIAL_x800C
	return

_0487:
	copyvar VAR_TEMP_x4001, VAR_TEMP_x4000
	return

_048F:
	copyvar VAR_TEMP_x4002, VAR_TEMP_x4000
	return

_0497:
	copyvar VAR_TEMP_x4003, VAR_TEMP_x4000
	return

_049F:
	copyvar VAR_TEMP_x4004, VAR_TEMP_x4000
	return

_04A7:
	copyvar VAR_TEMP_x4005, VAR_TEMP_x4000
	return

_04AF:
	copyvar VAR_TEMP_x4006, VAR_TEMP_x4000
	return

_04B7:
	copyvar VAR_TEMP_x4007, VAR_TEMP_x4000
	return

_04BF:
	copyvar VAR_SPECIAL_x8002, VAR_TEMP_x4001
	return

_04C7:
	copyvar VAR_SPECIAL_x8002, VAR_TEMP_x4002
	return

_04CF:
	copyvar VAR_SPECIAL_x8002, VAR_TEMP_x4003
	return

_04D7:
	copyvar VAR_SPECIAL_x8002, VAR_TEMP_x4004
	return

_04DF:
	copyvar VAR_SPECIAL_x8002, VAR_TEMP_x4005
	return

_04E7:
	copyvar VAR_SPECIAL_x8002, VAR_TEMP_x4006
	return

_04EF:
	copyvar VAR_SPECIAL_x8002, VAR_TEMP_x4007
	return

_04F7:
	getfossilminimumamount VAR_SPECIAL_x8002, VAR_SPECIAL_x8004, 1
	buffer_item_name 0, VAR_SPECIAL_x8002
	npc_msg msg_0464_T03R0101_00007
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _053F
	getfossilpokemon VAR_UNK_407F, VAR_SPECIAL_x8002
	takeitem VAR_SPECIAL_x8002, 1, VAR_SPECIAL_x800C
	goto _0530

_0530:
	setflag FLAG_MAPTEMP_001
	npc_msg msg_0464_T03R0101_00003
	goto _05FC
	.byte 0x02, 0x00
_053F:
	setvar VAR_UNK_407F, 0
	npc_msg msg_0464_T03R0101_00002
	goto _05FC
	.byte 0x02, 0x00
_0550:
	buffer_species_name 0, VAR_UNK_407F, 0, 0
	npc_msg msg_0464_T03R0101_00004
	get_party_count VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 6
	gotoif ne, _0575
	npc_msg msg_0464_T03R0101_00005
	goto _05FC

_0575:
	buffer_species_name 1, VAR_UNK_407F, 0, 0
	buffer_players_name 0
	play_fanfare SEQ_ME_POKEGET
	npc_msg msg_0464_T03R0101_00008
	wait_fanfare
	give_mon VAR_UNK_407F, 20, 0, 0, 0, VAR_SPECIAL_x800C
	scrcmd_420 116
	setvar VAR_UNK_407F, 0
	npc_msg msg_0464_T03R0101_00009
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0600
	get_party_count VAR_TEMP_x4000
	subvar VAR_TEMP_x4000, 1
	fade_screen 6, 1, 0, 0x00
	wait_fade
	nickname_input VAR_TEMP_x4000, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _05E8
	scrcmd_420 50
_05E8:
	fade_screen 6, 1, 1, 0x00
	wait_fade
	scrcmd_784 2, 1
	releaseall
	end

_05FC:
	waitbutton
	closemsg
_0600:
	scrcmd_784 2, 1
	releaseall
	end

scr_seq_T03R0101_013:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _070D
	photo_album_is_full VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0721
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, _0681
	apply_movement obj_player, _0738
	apply_movement obj_T03R0101_gsmiddleman1, _0770
	goto _06AC

_0681:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _069C
	apply_movement obj_player, _0750
	goto _06AC

_069C:
	apply_movement obj_player, _075C
	apply_movement obj_T03R0101_gsmiddleman1, _0770
_06AC:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _06D3
	apply_movement obj_partner_poke, _077C
	wait_movement
_06D3:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0x00
	wait_fade
	cameron_photo 65
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

_070D:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

_0721:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end
	.byte 0x00, 0x00, 0x00

_0738:
	step 14, 1
	step 12, 2
	step 15, 1
	step 12, 3
	step 33, 1
	step_end

_0750:
	step 12, 3
	step 33, 1
	step_end

_075C:
	step 12, 1
	step 15, 1
	step 12, 3
	step 33, 1
	step_end

_0770:
	step 63, 1
	step 32, 1
	step_end

_077C:
	step 15, 1
	step 12, 1
	step 1, 1
	step_end
scr_seq_T03R0101_019:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0464_T03R0101_00013
	waitbutton
	closemsg
	setvar VAR_UNK_4130, 5
	releaseall
	end

scr_seq_T03R0101_015:
	end

scr_seq_T03R0101_018:
	comparevartovalue VAR_UNK_4083, 0
	gotoif eq, _07BF
	comparevartovalue VAR_UNK_4083, 1
	gotoif eq, _07C1
_07BF:
	end

_07C1:
	scrcmd_490 VAR_UNK_4083
	scrcmd_344 0, 0
	move_person obj_T03R0101_daigo, 26, 0, 7, 1
	goto _07BF
	.byte 0x02, 0x00
scr_seq_T03R0101_016:
	scrcmd_609
	lockall
	hasitem ITEM_ENIGMA_STONE, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0963
	scrcmd_546 0, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0963
	apply_movement obj_T03R0101_daigo, _0968
	wait_movement
	npc_msg msg_0464_T03R0101_00014
	closemsg
	apply_movement obj_T03R0101_daigo, _0970
	wait_movement
	npc_msg msg_0464_T03R0101_00015
	npc_msg msg_0464_T03R0101_00016
	closemsg
	apply_movement obj_T03R0101_daigo, _097C
	apply_movement obj_T03R0101_gsassistantm, _09C8
	wait_movement
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	comparevartovalue VAR_TEMP_x4001, 6
	gotoif ne, _0868
	apply_movement obj_player, _0998
	goto _0870

_0868:
	apply_movement obj_player, _098C
_0870:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	apply_movement obj_player, _09A4
	wait_movement
	buffer_players_name 0
	npc_msg msg_0464_T03R0101_00017
	closemsg
	apply_movement obj_T03R0101_gsassistantm, _09D0
	wait_movement
	npc_msg msg_0464_T03R0101_00018
	closemsg
	fade_screen 6, 1, 0, 0x00
	wait_fade
	wait 30, VAR_SPECIAL_x800C
	release obj_T03R0101_daigo
	move_person obj_T03R0101_daigo, 25, 0, 7, 1
	wait 10, VAR_SPECIAL_x800C
	lock obj_T03R0101_daigo
	comparevartovalue VAR_TEMP_x4001, 6
	gotoif eq, _08F1
	scrcmd_729 VAR_TEMP_x4009
	comparevartovalue VAR_TEMP_x4009, 0
	gotoif eq, _08F1
	apply_movement obj_partner_poke, _09F0
	wait_movement
_08F1:
	fade_screen 6, 1, 1, 0x00
	wait_fade
	wait 10, VAR_SPECIAL_x800C
	apply_movement obj_T03R0101_gsassistantm, _09D0
	wait_movement
	npc_msg msg_0464_T03R0101_00019
	closemsg
	apply_movement obj_T03R0101_gsassistantm, _09D8
	wait_movement
	takeitem ITEM_ENIGMA_STONE, 1, VAR_SPECIAL_x800C
	setvar VAR_SPECIAL_x8004, 225
	setvar VAR_SPECIAL_x8005, 1
	callstd std_obtain_item_verbose
	closemsg
	apply_movement obj_T03R0101_daigo, _09B8
	wait_movement
	apply_movement obj_player, _0968
	wait_movement
	npc_msg msg_0464_T03R0101_00021
	closemsg
	apply_movement obj_T03R0101_daigo, _09C0
	wait_movement
	setvar VAR_UNK_4083, 2
	hide_person obj_T03R0101_daigo
_0963:
	releaseall
	end
	.byte 0x00

_0968:
	step 34, 1
	step_end

_0970:
	step 63, 1
	step 75, 1
	step_end

_097C:
	step 71, 1
	step 15, 1
	step 72, 1
	step_end

_098C:
	step 15, 1
	step 1, 1
	step_end

_0998:
	step 15, 1
	step 13, 1
	step_end

_09A4:
	step 13, 1
	step 63, 1
	step 12, 1
	step 1, 1
	step_end

_09B8:
	step 3, 1
	step_end

_09C0:
	step 14, 8
	step_end

_09C8:
	step 32, 1
	step_end

_09D0:
	step 32, 1
	step_end

_09D8:
	step 12, 1
	step 32, 1
	step 71, 1
	step 13, 1
	step 72, 1
	step_end

_09F0:
	step 20, 1
	step 23, 1
	step 1, 1
	step_end
scr_seq_T03R0101_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0464_T03R0101_00010
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T03R0101_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0464_T03R0101_00011
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T03R0101_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0464_T03R0101_00012
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T03R0101_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0464_T03R0101_00022
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T03R0101_006:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0464_T03R0101_00023
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T03R0101_007:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0464_T03R0101_00024
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T03R0101_008:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0464_T03R0101_00025
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T03R0101_009:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0464_T03R0101_00026
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T03R0101_010:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0464_T03R0101_00027
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T03R0101_011:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0464_T03R0101_00028
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T03R0101_012:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0464_T03R0101_00029
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
