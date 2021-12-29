#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0216_R25_013C ; 000
	scrdef scr_seq_0216_R25_04FB ; 001
	scrdef scr_seq_0216_R25_0808 ; 002
	scrdef scr_seq_0216_R25_002A ; 003
	scrdef scr_seq_0216_R25_0573 ; 004
	scrdef scr_seq_0216_R25_06BC ; 005
	scrdef scr_seq_0216_R25_06CD ; 006
	scrdef scr_seq_0216_R25_06DE ; 007
	scrdef scr_seq_0216_R25_0121 ; 008
	scrdef scr_seq_0216_R25_03A8 ; 009
	scrdef_end

scr_seq_0216_R25_002A:
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_0216_R25_003B
	clearflag FLAG_UNK_189
	end

scr_seq_0216_R25_003B:
	comparevartovalue VAR_UNK_4089, 2
	gotoif ne, scr_seq_0216_R25_0050
	clearflag FLAG_UNK_2B2
	setflag FLAG_UNK_2A2
scr_seq_0216_R25_0050:
	check_badge 15, VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, scr_seq_0216_R25_011B
	comparevartovalue VAR_UNK_4089, 1
	gotoif eq, scr_seq_0216_R25_011B
	comparevartovalue VAR_UNK_4089, 2
	gotoif eq, scr_seq_0216_R25_011B
	get_phone_book_rematch 29, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_0216_R25_0115
	scrcmd_147 29, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0216_R25_00DD
	scrcmd_522 16384
	comparevartovalue VAR_TEMP_x4000, 16
	gotoif ne, scr_seq_0216_R25_00BE
	clearflag FLAG_UNK_2CD
	goto scr_seq_0216_R25_00DB

scr_seq_0216_R25_00BE:
	comparevartovalue VAR_TEMP_x4000, 17
	gotoif ne, scr_seq_0216_R25_00D5
	clearflag FLAG_UNK_2CD
	goto scr_seq_0216_R25_00DB

scr_seq_0216_R25_00D5:
	goto scr_seq_0216_R25_0115

scr_seq_0216_R25_00DB:
	end

scr_seq_0216_R25_00DD:
	scrcmd_522 16384
	comparevartovalue VAR_TEMP_x4000, 14
	gotoif ne, scr_seq_0216_R25_00F8
	clearflag FLAG_UNK_2CD
	goto scr_seq_0216_R25_0113

scr_seq_0216_R25_00F8:
	comparevartovalue VAR_TEMP_x4000, 15
	gotoif ne, scr_seq_0216_R25_010F
	clearflag FLAG_UNK_2CD
	goto scr_seq_0216_R25_0113

scr_seq_0216_R25_010F:
	setflag FLAG_UNK_2CD
scr_seq_0216_R25_0113:
	end

scr_seq_0216_R25_0115:
	setflag FLAG_UNK_2CD
	end

scr_seq_0216_R25_011B:
	setflag FLAG_UNK_2CD
	end

scr_seq_0216_R25_0121:
	checkflag FLAG_UNK_0A4
	gotoif TRUE, scr_seq_0216_R25_012E
	end

scr_seq_0216_R25_012E:
	setflag FLAG_UNK_2A1
	hide_person 12
	clearflag FLAG_UNK_0A4
	end

scr_seq_0216_R25_013C:
	scrcmd_609
	lockall
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 40
	gotoif ne, scr_seq_0216_R25_0171
	apply_movement 8, scr_seq_0216_R25_029C
	apply_movement 9, scr_seq_0216_R25_02B0
	apply_movement 255, scr_seq_0216_R25_0304
	goto scr_seq_0216_R25_01B4

scr_seq_0216_R25_0171:
	comparevartovalue VAR_TEMP_x4001, 41
	gotoif ne, scr_seq_0216_R25_019C
	apply_movement 8, scr_seq_0216_R25_029C
	apply_movement 9, scr_seq_0216_R25_02CC
	apply_movement 255, scr_seq_0216_R25_0304
	goto scr_seq_0216_R25_01B4

scr_seq_0216_R25_019C:
	apply_movement 8, scr_seq_0216_R25_029C
	apply_movement 9, scr_seq_0216_R25_02E8
	apply_movement 255, scr_seq_0216_R25_0310
scr_seq_0216_R25_01B4:
	wait_movement
	scrcmd_081 1061
	play_bgm SEQ_GS_EYE_K_SHOUJO
	comparevartovalue VAR_TEMP_x4001, 40
	gotoif ne, scr_seq_0216_R25_01E1
	apply_movement 8, scr_seq_0216_R25_032C
	apply_movement 255, scr_seq_0216_R25_0350
	goto scr_seq_0216_R25_0214

scr_seq_0216_R25_01E1:
	comparevartovalue VAR_TEMP_x4001, 41
	gotoif ne, scr_seq_0216_R25_0204
	apply_movement 8, scr_seq_0216_R25_0338
	apply_movement 255, scr_seq_0216_R25_0350
	goto scr_seq_0216_R25_0214

scr_seq_0216_R25_0204:
	apply_movement 8, scr_seq_0216_R25_0344
	apply_movement 255, scr_seq_0216_R25_0350
scr_seq_0216_R25_0214:
	wait_movement
	npc_msg 0
	closemsg
	comparevartovalue VAR_TEMP_x4001, 40
	gotoif ne, scr_seq_0216_R25_023E
	apply_movement 8, scr_seq_0216_R25_035C
	apply_movement 255, scr_seq_0216_R25_0380
	goto scr_seq_0216_R25_0271

scr_seq_0216_R25_023E:
	comparevartovalue VAR_TEMP_x4001, 41
	gotoif ne, scr_seq_0216_R25_0261
	apply_movement 8, scr_seq_0216_R25_0368
	apply_movement 255, scr_seq_0216_R25_0380
	goto scr_seq_0216_R25_0271

scr_seq_0216_R25_0261:
	apply_movement 8, scr_seq_0216_R25_0374
	apply_movement 255, scr_seq_0216_R25_0394
scr_seq_0216_R25_0271:
	wait_movement
	hide_person 9
	hide_person 8
	scrcmd_081 1113
	play_bgm SEQ_GS_R_12_24
	setflag FLAG_UNK_309
	setflag FLAG_UNK_256
	clearflag FLAG_UNK_253
	setvar VAR_UNK_4088, 2
	releaseall
	end

scr_seq_0216_R25_0299:
	.byte 0x00, 0x00, 0x00

scr_seq_0216_R25_029C:
	.short 63, 1
	.short 2, 1
	.short 66, 2
	.short 0, 1
	.short 254, 0

scr_seq_0216_R25_02B0:
	.short 66, 1
	.short 0, 1
	.short 75, 1
	.short 16, 5
	.short 18, 5
	.short 17, 8
	.short 254, 0

scr_seq_0216_R25_02CC:
	.short 66, 1
	.short 0, 1
	.short 75, 1
	.short 16, 5
	.short 18, 5
	.short 17, 8
	.short 254, 0

scr_seq_0216_R25_02E8:
	.short 66, 1
	.short 0, 1
	.short 75, 1
	.short 16, 6
	.short 18, 5
	.short 17, 9
	.short 254, 0

scr_seq_0216_R25_0304:
	.short 65, 6
	.short 1, 1
	.short 254, 0

scr_seq_0216_R25_0310:
	.short 65, 6
	.short 0, 1
	.short 63, 1
	.short 2, 1
	.short 63, 1
	.short 1, 1
	.short 254, 0

scr_seq_0216_R25_032C:
	.short 12, 7
	.short 14, 2
	.short 254, 0

scr_seq_0216_R25_0338:
	.short 12, 6
	.short 14, 2
	.short 254, 0

scr_seq_0216_R25_0344:
	.short 12, 5
	.short 14, 2
	.short 254, 0

scr_seq_0216_R25_0350:
	.short 65, 3
	.short 3, 1
	.short 254, 0

scr_seq_0216_R25_035C:
	.short 13, 1
	.short 14, 11
	.short 254, 0

scr_seq_0216_R25_0368:
	.short 13, 1
	.short 14, 11
	.short 254, 0

scr_seq_0216_R25_0374:
	.short 12, 1
	.short 14, 11
	.short 254, 0

scr_seq_0216_R25_0380:
	.short 63, 1
	.short 1, 1
	.short 63, 1
	.short 2, 1
	.short 254, 0

scr_seq_0216_R25_0394:
	.short 63, 1
	.short 0, 1
	.short 62, 1
	.short 2, 1
	.short 254, 0
scr_seq_0216_R25_03A8:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_147 29, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0216_R25_0456
	comparevartovalue VAR_TEMP_x4002, 1
	gotoif ge, scr_seq_0216_R25_044B
	npc_msg 1
scr_seq_0216_R25_03D3:
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0216_R25_03F7
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, scr_seq_0216_R25_043A
	end

scr_seq_0216_R25_03F7:
	buffer_players_name 0
	npc_msg 2
	play_fanfare SEQ_ME_POKEGEAR_REGIST
	wait_fanfare
	register_gear_number 29
	npc_msg 3
	waitbutton
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	setflag FLAG_UNK_2CD
	hide_person 15
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 1, 0
	wait_fade
	releaseall
	end

scr_seq_0216_R25_043A:
	setvar VAR_TEMP_x4002, 1
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0216_R25_044B:
	npc_msg 5
	goto scr_seq_0216_R25_03D3

scr_seq_0216_R25_0454:
	.byte 0x02, 0x00
scr_seq_0216_R25_0456:
	scrcmd_184 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0216_R25_04DA
	scrcmd_733 11, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0216_R25_04DA
	npc_msg 6
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0216_R25_04E5
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0216_R25_04F0
	npc_msg 7
	closemsg
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_615 84
	faceplayer
	lockall
	fade_screen 6, 1, 1, 0
	wait_fade
	clearflag FLAG_UNK_189
	npc_msg 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0216_R25_04DA:
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0216_R25_04E5:
	npc_msg 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0216_R25_04F0:
	npc_msg 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0216_R25_04FB:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_122
	gotoif TRUE, scr_seq_0216_R25_0558
	npc_msg 11
	setvar VAR_SPECIAL_x8004, 92
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0216_R25_0563
	callstd std_give_item_verbose
	setflag FLAG_UNK_122
	npc_msg 13
	closemsg
	trainer_battle TRAINER_ACE_TRAINER_M_KEVIN, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0216_R25_056D
scr_seq_0216_R25_0558:
	npc_msg 14
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0216_R25_0563:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

scr_seq_0216_R25_056D:
	white_out
	releaseall
	end

scr_seq_0216_R25_0573:
	scrcmd_609
	lockall
	setflag FLAG_UNK_2AC
	clearflag FLAG_UNK_2A2
	show_person 13
	apply_movement 255, scr_seq_0216_R25_0648
	wait_movement
	scrcmd_076 245, 0
	scrcmd_099 12
	scrcmd_523 12, 2, 90, 2, 0
	scrcmd_098 12
	scrcmd_077
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 40
	gotoif ne, scr_seq_0216_R25_05D4
	apply_movement 255, scr_seq_0216_R25_0650
	goto scr_seq_0216_R25_05F7

scr_seq_0216_R25_05D4:
	comparevartovalue VAR_TEMP_x4001, 41
	gotoif ne, scr_seq_0216_R25_05EF
	apply_movement 255, scr_seq_0216_R25_065C
	goto scr_seq_0216_R25_05F7

scr_seq_0216_R25_05EF:
	apply_movement 255, scr_seq_0216_R25_0670
scr_seq_0216_R25_05F7:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	callstd 2042
	apply_movement 13, scr_seq_0216_R25_069C
	apply_movement 255, scr_seq_0216_R25_0690
	wait_movement
	npc_msg 16
	closemsg
	apply_movement 13, scr_seq_0216_R25_06B0
	apply_movement 255, scr_seq_0216_R25_0684
	wait_movement
	npc_msg 17
	waitbutton
	closemsg
	callstd 2043
	setvar VAR_UNK_4089, 2
	releaseall
	end

scr_seq_0216_R25_0645:
	.byte 0x00, 0x00, 0x00

scr_seq_0216_R25_0648:
	.short 75, 1
	.short 254, 0

scr_seq_0216_R25_0650:
	.short 15, 3
	.short 0, 1
	.short 254, 0

scr_seq_0216_R25_065C:
	.short 15, 1
	.short 12, 1
	.short 15, 2
	.short 0, 1
	.short 254, 0

scr_seq_0216_R25_0670:
	.short 15, 1
	.short 12, 2
	.short 15, 2
	.short 0, 1
	.short 254, 0

scr_seq_0216_R25_0684:
	.short 65, 1
	.short 0, 1
	.short 254, 0

scr_seq_0216_R25_0690:
	.short 63, 2
	.short 1, 1
	.short 254, 0

scr_seq_0216_R25_069C:
	.short 19, 8
	.short 15, 3
	.short 7, 1
	.short 0, 1
	.short 254, 0

scr_seq_0216_R25_06B0:
	.short 15, 1
	.short 12, 2
	.short 254, 0
scr_seq_0216_R25_06BC:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 17
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0216_R25_06CD:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 17
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0216_R25_06DE:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 245, 0
	scrcmd_099 12
	scrcmd_523 12, 2, 90, 2, 0
	scrcmd_098 12
	scrcmd_077
	setflag FLAG_UNK_0A4
	scrcmd_589 245, 40, 0
	clearflag FLAG_UNK_0A4
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0216_R25_07AA
	scrcmd_683 16386
	comparevartovalue VAR_TEMP_x4002, 3
	gotoif eq, scr_seq_0216_R25_07A6
	comparevartovalue VAR_TEMP_x4002, 4
	callif eq, scr_seq_0216_R25_07B0
	comparevartovalue VAR_TEMP_x4002, 5
	gotoif eq, scr_seq_0216_R25_07B6
	buffer_players_name 0
	npc_msg 18
	closemsg
	checkflag FLAG_UNK_2B2
	gotoif TRUE, scr_seq_0216_R25_0766
	goto scr_seq_0216_R25_0786

scr_seq_0216_R25_0766:
	apply_movement 255, scr_seq_0216_R25_07F4
	apply_movement 13, scr_seq_0216_R25_0800
	wait_movement
	hide_person 13
	setflag FLAG_UNK_2A2
	goto scr_seq_0216_R25_07A0

scr_seq_0216_R25_0786:
	apply_movement 255, scr_seq_0216_R25_07F4
	apply_movement 14, scr_seq_0216_R25_0800
	wait_movement
	hide_person 14
	setflag FLAG_UNK_2B2
scr_seq_0216_R25_07A0:
	setvar VAR_UNK_4089, 3
scr_seq_0216_R25_07A6:
	releaseall
	end

scr_seq_0216_R25_07AA:
	white_out
	releaseall
	end

scr_seq_0216_R25_07B0:
	setflag FLAG_UNK_175
	return

scr_seq_0216_R25_07B6:
	wait 20, VAR_SPECIAL_x8004
	apply_movement 255, scr_seq_0216_R25_07EC
	wait_movement
	buffer_players_name 0
	npc_msg 19
	closemsg
	checkflag FLAG_UNK_2B2
	gotoif TRUE, scr_seq_0216_R25_0766
	goto scr_seq_0216_R25_0786

scr_seq_0216_R25_07DF:
	.byte 0x00
	.byte 0x01, 0x00, 0x01, 0x00, 0x3f, 0x00, 0x02, 0x00, 0xfe, 0x00, 0x00, 0x00

scr_seq_0216_R25_07EC:
	.short 1, 1
	.short 254, 0

scr_seq_0216_R25_07F4:
	.short 63, 2
	.short 2, 1
	.short 254, 0

scr_seq_0216_R25_0800:
	.short 14, 11
	.short 254, 0
scr_seq_0216_R25_0808:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 15, VAR_SPECIAL_x800C
	callstd 2000
	end
	.balign 4, 0
