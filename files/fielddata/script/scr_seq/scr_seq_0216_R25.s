#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R25.h"
#include "msgdata/msg/msg_0363_R25.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R25_000
	scrdef scr_seq_R25_001
	scrdef scr_seq_R25_002
	scrdef scr_seq_R25_003
	scrdef scr_seq_R25_004
	scrdef scr_seq_R25_005
	scrdef scr_seq_R25_006
	scrdef scr_seq_R25_007
	scrdef scr_seq_R25_008
	scrdef scr_seq_R25_009
	scrdef_end

scr_seq_R25_003:
	checkflag FLAG_UNK_189
	gotoif FALSE, _003B
	clearflag FLAG_UNK_189
	end

_003B:
	comparevartovalue VAR_UNK_4089, 2
	gotoif ne, _0050
	clearflag FLAG_UNK_2B2
	setflag FLAG_UNK_2A2
_0050:
	check_badge 15, VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, _011B
	comparevartovalue VAR_UNK_4089, 1
	gotoif eq, _011B
	comparevartovalue VAR_UNK_4089, 2
	gotoif eq, _011B
	get_phone_book_rematch 29, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, _0115
	scrcmd_147 29, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, _00DD
	scrcmd_522 16384
	comparevartovalue VAR_TEMP_x4000, 16
	gotoif ne, _00BE
	clearflag FLAG_UNK_2CD
	goto _00DB

_00BE:
	comparevartovalue VAR_TEMP_x4000, 17
	gotoif ne, _00D5
	clearflag FLAG_UNK_2CD
	goto _00DB

_00D5:
	goto _0115

_00DB:
	end

_00DD:
	scrcmd_522 16384
	comparevartovalue VAR_TEMP_x4000, 14
	gotoif ne, _00F8
	clearflag FLAG_UNK_2CD
	goto _0113

_00F8:
	comparevartovalue VAR_TEMP_x4000, 15
	gotoif ne, _010F
	clearflag FLAG_UNK_2CD
	goto _0113

_010F:
	setflag FLAG_UNK_2CD
_0113:
	end

_0115:
	setflag FLAG_UNK_2CD
	end

_011B:
	setflag FLAG_UNK_2CD
	end

scr_seq_R25_008:
	checkflag FLAG_UNK_0A4
	gotoif TRUE, _012E
	end

_012E:
	setflag FLAG_UNK_2A1
	hide_person obj_R25_tsure_poke_618
	clearflag FLAG_UNK_0A4
	end

scr_seq_R25_000:
	scrcmd_609
	lockall
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 40
	gotoif ne, _0171
	apply_movement obj_R25_gsleader11, _029C
	apply_movement obj_R25_gsman1, _02B0
	apply_movement obj_player, _0304
	goto _01B4

_0171:
	comparevartovalue VAR_TEMP_x4001, 41
	gotoif ne, _019C
	apply_movement obj_R25_gsleader11, _029C
	apply_movement obj_R25_gsman1, _02CC
	apply_movement obj_player, _0304
	goto _01B4

_019C:
	apply_movement obj_R25_gsleader11, _029C
	apply_movement obj_R25_gsman1, _02E8
	apply_movement obj_player, _0310
_01B4:
	wait_movement
	scrcmd_081 1061
	play_bgm SEQ_GS_EYE_K_SHOUJO
	comparevartovalue VAR_TEMP_x4001, 40
	gotoif ne, _01E1
	apply_movement obj_R25_gsleader11, _032C
	apply_movement obj_player, _0350
	goto _0214

_01E1:
	comparevartovalue VAR_TEMP_x4001, 41
	gotoif ne, _0204
	apply_movement obj_R25_gsleader11, _0338
	apply_movement obj_player, _0350
	goto _0214

_0204:
	apply_movement obj_R25_gsleader11, _0344
	apply_movement obj_player, _0350
_0214:
	wait_movement
	npc_msg msg_0363_R25_00000
	closemsg
	comparevartovalue VAR_TEMP_x4001, 40
	gotoif ne, _023E
	apply_movement obj_R25_gsleader11, _035C
	apply_movement obj_player, _0380
	goto _0271

_023E:
	comparevartovalue VAR_TEMP_x4001, 41
	gotoif ne, _0261
	apply_movement obj_R25_gsleader11, _0368
	apply_movement obj_player, _0380
	goto _0271

_0261:
	apply_movement obj_R25_gsleader11, _0374
	apply_movement obj_player, _0394
_0271:
	wait_movement
	hide_person obj_R25_gsman1
	hide_person obj_R25_gsleader11
	scrcmd_081 1113
	play_bgm SEQ_GS_R_12_24
	setflag FLAG_UNK_309
	setflag FLAG_UNK_256
	clearflag FLAG_UNK_253
	setvar VAR_UNK_4088, 2
	releaseall
	end
	.byte 0x00, 0x00, 0x00

_029C:
	step 63, 1
	step 2, 1
	step 66, 2
	step 0, 1
	step_end

_02B0:
	step 66, 1
	step 0, 1
	step 75, 1
	step 16, 5
	step 18, 5
	step 17, 8
	step_end

_02CC:
	step 66, 1
	step 0, 1
	step 75, 1
	step 16, 5
	step 18, 5
	step 17, 8
	step_end

_02E8:
	step 66, 1
	step 0, 1
	step 75, 1
	step 16, 6
	step 18, 5
	step 17, 9
	step_end

_0304:
	step 65, 6
	step 1, 1
	step_end

_0310:
	step 65, 6
	step 0, 1
	step 63, 1
	step 2, 1
	step 63, 1
	step 1, 1
	step_end

_032C:
	step 12, 7
	step 14, 2
	step_end

_0338:
	step 12, 6
	step 14, 2
	step_end

_0344:
	step 12, 5
	step 14, 2
	step_end

_0350:
	step 65, 3
	step 3, 1
	step_end

_035C:
	step 13, 1
	step 14, 11
	step_end

_0368:
	step 13, 1
	step 14, 11
	step_end

_0374:
	step 12, 1
	step 14, 11
	step_end

_0380:
	step 63, 1
	step 1, 1
	step 63, 1
	step 2, 1
	step_end

_0394:
	step 63, 1
	step 0, 1
	step 62, 1
	step 2, 1
	step_end
scr_seq_R25_009:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_147 29, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, _0456
	comparevartovalue VAR_TEMP_x4002, 1
	gotoif ge, _044B
	npc_msg msg_0363_R25_00001
_03D3:
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _03F7
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, _043A
	end

_03F7:
	buffer_players_name 0
	npc_msg msg_0363_R25_00002
	play_fanfare SEQ_ME_POKEGEAR_REGIST
	wait_fanfare
	register_gear_number 29
	npc_msg msg_0363_R25_00003
	waitbutton
	closemsg
	fade_screen 6, 1, 0, 0x00
	wait_fade
	setflag FLAG_UNK_2CD
	hide_person obj_R25_gsleader11_2
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 1, 0x00
	wait_fade
	releaseall
	end

_043A:
	setvar VAR_TEMP_x4002, 1
	npc_msg msg_0363_R25_00004
	waitbutton
	closemsg
	releaseall
	end

_044B:
	npc_msg msg_0363_R25_00005
	goto _03D3
	.byte 0x02, 0x00
_0456:
	scrcmd_184 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _04DA
	scrcmd_733 11, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _04DA
	npc_msg msg_0363_R25_00006
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _04E5
	photo_album_is_full VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _04F0
	npc_msg msg_0363_R25_00007
	closemsg
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0x00
	wait_fade
	cameron_photo 84
	faceplayer
	lockall
	fade_screen 6, 1, 1, 0x00
	wait_fade
	clearflag FLAG_UNK_189
	npc_msg msg_0363_R25_00008
	waitbutton
	closemsg
	releaseall
	end

_04DA:
	npc_msg msg_0363_R25_00003
	waitbutton
	closemsg
	releaseall
	end

_04E5:
	npc_msg msg_0363_R25_00009
	waitbutton
	closemsg
	releaseall
	end

_04F0:
	npc_msg msg_0363_R25_00010
	waitbutton
	closemsg
	releaseall
	end

scr_seq_R25_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_122
	gotoif TRUE, _0558
	npc_msg msg_0363_R25_00011
	goto_if_no_item_space ITEM_NUGGET, 1, _0563
	callstd std_give_item_verbose
	setflag FLAG_UNK_122
	npc_msg msg_0363_R25_00013
	closemsg
	trainer_battle TRAINER_ACE_TRAINER_M_KEVIN, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _056D
_0558:
	npc_msg msg_0363_R25_00014
	waitbutton
	closemsg
	releaseall
	end

_0563:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

_056D:
	white_out
	releaseall
	end

scr_seq_R25_004:
	scrcmd_609
	lockall
	setflag FLAG_UNK_2AC
	clearflag FLAG_UNK_2A2
	show_person obj_R25_minaki
	apply_movement obj_player, _0648
	wait_movement
	play_cry SPECIES_SUICUNE, 0
	release obj_R25_tsure_poke_618
	scrcmd_523 12, 2, 90, 2, 0
	lock obj_R25_tsure_poke_618
	wait_cry
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 40
	gotoif ne, _05D4
	apply_movement obj_player, _0650
	goto _05F7

_05D4:
	comparevartovalue VAR_TEMP_x4001, 41
	gotoif ne, _05EF
	apply_movement obj_player, _065C
	goto _05F7

_05EF:
	apply_movement obj_player, _0670
_05F7:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	callstd 2042
	apply_movement obj_R25_minaki, _069C
	apply_movement obj_player, _0690
	wait_movement
	npc_msg msg_0363_R25_00016
	closemsg
	apply_movement obj_R25_minaki, _06B0
	apply_movement obj_player, _0684
	wait_movement
	npc_msg msg_0363_R25_00017
	waitbutton
	closemsg
	callstd 2043
	setvar VAR_UNK_4089, 2
	releaseall
	end
	.byte 0x00, 0x00, 0x00

_0648:
	step 75, 1
	step_end

_0650:
	step 15, 3
	step 0, 1
	step_end

_065C:
	step 15, 1
	step 12, 1
	step 15, 2
	step 0, 1
	step_end

_0670:
	step 15, 1
	step 12, 2
	step 15, 2
	step 0, 1
	step_end

_0684:
	step 65, 1
	step 0, 1
	step_end

_0690:
	step 63, 2
	step 1, 1
	step_end

_069C:
	step 19, 8
	step 15, 3
	step 7, 1
	step 0, 1
	step_end

_06B0:
	step 15, 1
	step 12, 2
	step_end
scr_seq_R25_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0363_R25_00017
	waitbutton
	closemsg
	releaseall
	end

scr_seq_R25_006:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0363_R25_00017
	waitbutton
	closemsg
	releaseall
	end

scr_seq_R25_007:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	play_cry SPECIES_SUICUNE, 0
	release obj_R25_tsure_poke_618
	scrcmd_523 12, 2, 90, 2, 0
	lock obj_R25_tsure_poke_618
	wait_cry
	setflag FLAG_UNK_0A4
	wild_battle SPECIES_SUICUNE, 40, 0
	clearflag FLAG_UNK_0A4
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _07AA
	scrcmd_683 VAR_TEMP_x4002
	comparevartovalue VAR_TEMP_x4002, 3
	gotoif eq, _07A6
	comparevartovalue VAR_TEMP_x4002, 4
	callif eq, _07B0
	comparevartovalue VAR_TEMP_x4002, 5
	gotoif eq, _07B6
	buffer_players_name 0
	npc_msg msg_0363_R25_00018
	closemsg
	checkflag FLAG_UNK_2B2
	gotoif TRUE, _0766
	goto _0786

_0766:
	apply_movement obj_player, _07F4
	apply_movement obj_R25_minaki, _0800
	wait_movement
	hide_person obj_R25_minaki
	setflag FLAG_UNK_2A2
	goto _07A0

_0786:
	apply_movement obj_player, _07F4
	apply_movement obj_R25_minaki_2, _0800
	wait_movement
	hide_person obj_R25_minaki_2
	setflag FLAG_UNK_2B2
_07A0:
	setvar VAR_UNK_4089, 3
_07A6:
	releaseall
	end

_07AA:
	white_out
	releaseall
	end

_07B0:
	setflag FLAG_UNK_175
	return

_07B6:
	wait 20, VAR_SPECIAL_x8004
	apply_movement obj_player, _07EC
	wait_movement
	buffer_players_name 0
	npc_msg msg_0363_R25_00019
	closemsg
	checkflag FLAG_UNK_2B2
	gotoif TRUE, _0766
	goto _0786
	.byte 0x00
	.byte 0x01, 0x00, 0x01, 0x00, 0x3f, 0x00, 0x02, 0x00, 0xfe, 0x00, 0x00, 0x00

_07EC:
	step 1, 1
	step_end

_07F4:
	step 63, 2
	step 2, 1
	step_end

_0800:
	step 14, 11
	step_end
scr_seq_R25_002:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0363_R25_00015, VAR_SPECIAL_x800C
	callstd std_signpost
	end
	.balign 4, 0
