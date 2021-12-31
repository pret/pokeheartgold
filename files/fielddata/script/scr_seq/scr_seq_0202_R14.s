#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R14.h"
#include "msgdata/msg/msg_0351_R14.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R14_000
	scrdef scr_seq_R14_001
	scrdef scr_seq_R14_002
	scrdef scr_seq_R14_003
	scrdef scr_seq_R14_004
	scrdef scr_seq_R14_005
	scrdef_end

scr_seq_R14_001:
	checkflag FLAG_UNK_189
	gotoif FALSE, _002B
	clearflag FLAG_UNK_189
	end

_002B:
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif eq, _004F
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, _004F
	setflag FLAG_HIDE_CAMERON
	end

_004F:
	clearflag FLAG_HIDE_CAMERON
	end

scr_seq_R14_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _017D
	photo_album_is_full VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0191
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, _00CE
	apply_movement obj_player, _01A8
	apply_movement obj_R14_gsmiddleman1_3, _01F4
	goto _011C

_00CE:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _00E9
	apply_movement obj_player, _01C0
	goto _011C

_00E9:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, _010C
	apply_movement obj_player, _01E0
	apply_movement obj_R14_gsmiddleman1_3, _01F4
	goto _011C

_010C:
	apply_movement obj_player, _01CC
	apply_movement obj_R14_gsmiddleman1_3, _01F4
_011C:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _0143
	apply_movement 253, _0200
	wait_movement
_0143:
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

_017D:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

_0191:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end
	.byte 0x00, 0x00, 0x00

_01A8:
	step 15, 1
	step 12, 2
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_01C0:
	step 12, 3
	step 33, 1
	step_end

_01CC:
	step 12, 1
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_01E0:
	step 12, 1
	step 15, 1
	step 12, 3
	step 33, 1
	step_end

_01F4:
	step 63, 1
	step 32, 1
	step_end

_0200:
	step 15, 1
	step 12, 1
	step 1, 1
	step_end
scr_seq_R14_002:
	scrcmd_609
	lockall
	clearflag FLAG_UNK_2A5
	show_person 12
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4000, 1358
	gotoif ne, _024F
	apply_movement obj_player, _0450
	wait_movement
	goto _027C
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
_024F:
	goto _0255

_0255:
	comparevartovalue VAR_TEMP_x4001, 409
	gotoif ne, _0272
	apply_movement obj_player, _0450
	wait_movement
	goto _027C

_0272:
	apply_movement obj_player, _0450
	wait_movement
_027C:
	scrcmd_076 245, 0
	release obj_R14_tsure_poke_618
	scrcmd_523 11, 2, 90, 2, 0
	lock obj_R14_tsure_poke_618
	scrcmd_077
	comparevartovalue VAR_TEMP_x4000, 1358
	gotoif ne, _02B1
	goto _02D0
	.byte 0x16, 0x00, 0x1f, 0x00, 0x00
	.byte 0x00
_02B1:
	comparevartovalue VAR_TEMP_x4000, 1359
	gotoif ne, _02CA
	goto _0382
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
_02CA:
	goto _03AD

_02D0:
	comparevartovalue VAR_TEMP_x4001, 409
	gotoif ne, _02EB
	apply_movement obj_player, _04AC
	goto _037A

_02EB:
	comparevartovalue VAR_TEMP_x4001, 410
	gotoif ne, _0306
	apply_movement obj_player, _04C0
	goto _037A

_0306:
	comparevartovalue VAR_TEMP_x4001, 411
	gotoif ne, _0321
	apply_movement obj_player, _04D0
	goto _037A

_0321:
	comparevartovalue VAR_TEMP_x4001, 412
	gotoif ne, _033C
	apply_movement obj_player, _04E0
	goto _037A

_033C:
	comparevartovalue VAR_TEMP_x4001, 413
	gotoif ne, _0357
	apply_movement obj_player, _04E8
	goto _037A

_0357:
	comparevartovalue VAR_TEMP_x4001, 414
	gotoif ne, _0372
	apply_movement obj_player, _04F8
	goto _037A

_0372:
	apply_movement obj_player, _0508
_037A:
	wait_movement
	goto _03D2

_0382:
	comparevartovalue VAR_TEMP_x4001, 409
	gotoif ne, _039D
	apply_movement obj_player, _051C
	goto _03A5

_039D:
	apply_movement obj_player, _0530
_03A5:
	wait_movement
	goto _03D2

_03AD:
	comparevartovalue VAR_TEMP_x4001, 409
	gotoif ne, _03C8
	apply_movement obj_player, _0544
	goto _03D0

_03C8:
	apply_movement obj_player, _0550
_03D0:
	wait_movement
_03D2:
	apply_movement obj_R14_tsure_poke_618, _0488
	apply_movement obj_player, _055C
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	callstd 2042
	apply_movement obj_R14_minaki, _057C
	apply_movement obj_player, _056C
	wait_movement
	buffer_players_name 0
	npc_msg msg_0351_R14_00006
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
	gotoif ne, _0449
	clearflag FLAG_UNK_2A1
	setvar VAR_UNK_4089, 1
_0449:
	releaseall
	end
	.byte 0x00, 0x00, 0x00

_0450:
	step 75, 1
	step_end
	.byte 0x3e, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00
	.byte 0xfe, 0x00, 0x00, 0x00, 0x3e, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00
	.byte 0x3e, 0x00, 0x01, 0x00, 0x01, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00, 0x5f, 0x00, 0x01, 0x00
	.byte 0x02, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00

_0488:
	step 20, 2
	step 52, 1
	step 56, 1
	step 20, 2
	step 52, 1
	step 56, 2
	step 20, 2
	step 52, 1
	step_end

_04AC:
	step 13, 1
	step 15, 3
	step 13, 2
	step 3, 1
	step_end

_04C0:
	step 15, 3
	step 13, 2
	step 3, 1
	step_end

_04D0:
	step 15, 3
	step 13, 1
	step 3, 1
	step_end

_04E0:
	step 15, 3
	step_end

_04E8:
	step 15, 3
	step 12, 1
	step 3, 1
	step_end

_04F8:
	step 15, 3
	step 12, 2
	step 3, 1
	step_end

_0508:
	step 12, 1
	step 15, 3
	step 12, 2
	step 3, 1
	step_end

_051C:
	step 13, 1
	step 15, 2
	step 13, 2
	step 3, 1
	step_end

_0530:
	step 12, 1
	step 15, 2
	step 12, 2
	step 3, 1
	step_end

_0544:
	step 13, 3
	step 3, 1
	step_end

_0550:
	step 12, 3
	step 3, 1
	step_end

_055C:
	step 63, 1
	step 0, 1
	step 12, 1
	step_end

_056C:
	step 65, 5
	step 2, 1
	step_end
	.byte 0xfe, 0x00, 0x00, 0x00

_057C:
	step 16, 11
	step 12, 2
	step 4, 1
	step 63, 3
	step 9, 1
	step 3, 1
	step_end
scr_seq_R14_003:
	buffer_players_name 0
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0351_R14_00007
	waitbutton
	closemsg
	releaseall
	end

scr_seq_R14_004:
	buffer_players_name 0
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0351_R14_00007
	waitbutton
	closemsg
	releaseall
	end

scr_seq_R14_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_15C
	gotoif TRUE, _0658
	npc_msg msg_0351_R14_00000
	scrcmd_184 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0602
	get_lead_mon_index VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 113
	gotoif eq, _060D
_0602:
	npc_msg msg_0351_R14_00001
	waitbutton
	closemsg
	releaseall
	end

_060D:
	apply_movement obj_R14_gswoman1, _0698
	wait_movement
	npc_msg msg_0351_R14_00002
	setvar VAR_SPECIAL_x8004, 256
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _064E
	callstd std_give_item_verbose
	setflag FLAG_UNK_15C
	npc_msg msg_0351_R14_00003
	waitbutton
	closemsg
	releaseall
	end

_064E:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

_0658:
	scrcmd_184 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0680
	get_lead_mon_index VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 113
	gotoif eq, _068B
_0680:
	npc_msg msg_0351_R14_00005
	waitbutton
	closemsg
	releaseall
	end

_068B:
	npc_msg msg_0351_R14_00004
	waitbutton
	closemsg
	releaseall
	end
	.byte 0x00, 0x00

_0698:
	step 75, 1
	step 62, 1
	step_end
	.balign 4, 0
