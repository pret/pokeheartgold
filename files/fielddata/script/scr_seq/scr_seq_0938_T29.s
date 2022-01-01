#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T29.h"
#include "msgdata/msg/msg_0626_T29.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T29_000
	scrdef scr_seq_T29_001
	scrdef scr_seq_T29_002
	scrdef scr_seq_T29_003
	scrdef scr_seq_T29_004
	scrdef scr_seq_T29_005
	scrdef scr_seq_T29_006
	scrdef scr_seq_T29_007
	scrdef scr_seq_T29_008
	scrdef scr_seq_T29_009
	scrdef scr_seq_T29_010
	scrdef scr_seq_T29_011
	scrdef scr_seq_T29_012
	scrdef scr_seq_T29_013
	scrdef scr_seq_T29_014
	scrdef scr_seq_T29_015
	scrdef scr_seq_T29_016
	scrdef scr_seq_T29_017
	scrdef scr_seq_T29_018
	scrdef_end

scr_seq_T29_000:
	checkflag FLAG_GOT_RED_SCALE
	gotoif TRUE, _007F
	setflag FLAG_UNK_1FC
	setflag FLAG_UNK_1FE
	setflag FLAG_MAPTEMP_011
	setflag FLAG_MAPTEMP_013
	setflag FLAG_MAPTEMP_014
	setflag FLAG_MAPTEMP_015
	setflag FLAG_UNK_289
	setflag FLAG_UNK_28B
	setflag FLAG_UNK_28C
	end

_007F:
	goto _0115

_0085:
	comparevartovalue VAR_UNK_4037, 61993
	gotoif eq, _00BC
	setflag FLAG_UNK_1FC
	setflag FLAG_UNK_1FE
	clearflag FLAG_UNK_1FF
	setflag FLAG_MAPTEMP_011
	setflag FLAG_MAPTEMP_013
	setflag FLAG_MAPTEMP_014
	setflag FLAG_MAPTEMP_015
	setflag FLAG_UNK_289
	setflag FLAG_UNK_28B
	setflag FLAG_UNK_28C
	end

_00BC:
	clearflag FLAG_UNK_1FC
	clearflag FLAG_UNK_1FE
	setflag FLAG_UNK_1FF
	clearflag FLAG_UNK_289
	clearflag FLAG_UNK_28B
	clearflag FLAG_UNK_28C
	checkflag FLAG_UNK_146
	gotoif TRUE, _00E5
	goto _00E9

_00E5:
	setflag FLAG_UNK_289
_00E9:
	checkflag FLAG_UNK_147
	gotoif TRUE, _00FA
	goto _00FE

_00FA:
	setflag FLAG_UNK_28B
_00FE:
	checkflag FLAG_UNK_148
	gotoif TRUE, _010F
	goto _0113

_010F:
	setflag FLAG_UNK_28C
_0113:
	end

_0115:
	scrcmd_147 39, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, _01A7
	checkflag FLAG_GAME_CLEAR
	gotoif TRUE, _0139
	goto _01A7

_0139:
	scrcmd_522 16384
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif ne, _0154
	clearflag FLAG_UNK_2CC
	goto _019F

_0154:
	comparevartovalue VAR_TEMP_x4000, 7
	gotoif ne, _016B
	clearflag FLAG_UNK_2CC
	goto _019F

_016B:
	comparevartovalue VAR_TEMP_x4000, 8
	gotoif ne, _0182
	clearflag FLAG_UNK_2CC
	goto _019F

_0182:
	comparevartovalue VAR_TEMP_x4000, 9
	gotoif ne, _0199
	clearflag FLAG_UNK_2CC
	goto _019F

_0199:
	goto _01A7

_019F:
	goto _0085
	.byte 0x02, 0x00
_01A7:
	setflag FLAG_UNK_2CC
	goto _0085
	.byte 0x02, 0x00
scr_seq_T29_002:
	checkflag FLAG_UNK_0A4
	gotoif TRUE, _01C0
	end

_01C0:
	setflag FLAG_HIDE_LAKE_OF_RAGE_RED_GYARADOS
	hide_person obj_T29_rgyaradosu
	clearflag FLAG_HIDE_LAKE_OF_RAGE_LANCE
	show_person obj_T29_wataru
	show_person obj_T29_tsure_poke_607
	clearflag FLAG_UNK_0A4
	end

scr_seq_T29_017:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_TEMP_x4004, 1
	gotoif ge, _026A
	npc_msg msg_0626_T29_00013
_01F2:
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0216
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, _0259
	end

_0216:
	buffer_players_name 0
	npc_msg msg_0626_T29_00014
	play_fanfare SEQ_ME_POKEGEAR_REGIST
	wait_fanfare
	register_gear_number 39
	npc_msg msg_0626_T29_00015
	waitbutton
	closemsg
	fade_screen 6, 1, 0, 0x00
	wait_fade
	setflag FLAG_UNK_2CC
	hide_person obj_T29_gsleader7
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 1, 0x00
	wait_fade
	releaseall
	end

_0259:
	setvar VAR_TEMP_x4004, 1
	npc_msg msg_0626_T29_00016
	waitbutton
	closemsg
	releaseall
	end

_026A:
	npc_msg msg_0626_T29_00017
	goto _01F2
	.byte 0x02, 0x00
scr_seq_T29_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_lead_mon_index VAR_SPECIAL_x8002
	mon_has_ribbon VAR_SPECIAL_x800C, VAR_SPECIAL_x8002, RIBBON_DOWNCAST
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _039B
	checkflag FLAG_GOT_SHOCK_RIBBON
	gotoif TRUE, _03AF
	comparevartovalue VAR_NUM_MET_WEEKDAY_SIBLINGS, 7
	gotoif eq, _0349
	checkflag FLAG_UNK_0D5
	gotoif TRUE, _032B
	get_weekday VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, _02DC
	get_std_msg_naix 0, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 11
	goto _0323

_02DC:
	get_std_msg_naix 0, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 8
	goto_if_no_item_space ITEM_BLACK_BELT, 1, _033F
	callstd std_give_item_verbose
	setflag FLAG_UNK_0D5
	addvar VAR_NUM_MET_WEEKDAY_SIBLINGS, 1
	get_std_msg_naix 0, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 9
_0323:
	waitbutton
	closemsg
	releaseall
	end

_032B:
	get_std_msg_naix 0, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 10
	waitbutton
	closemsg
	releaseall
	end

_033F:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

_0349:
	get_weekday VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, _036C
	get_std_msg_naix 0, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 11
	goto _0323

_036C:
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

_039B:
	get_std_msg_naix 0, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 37
	waitbutton
	closemsg
	releaseall
	end

_03AF:
	get_std_msg_naix 0, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 39
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T29_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	play_cry SPECIES_GYARADOS, 0
	npc_msg msg_0626_T29_00000
	wait_cry
	closemsg
	setflag FLAG_UNK_0A4
	wild_battle SPECIES_GYARADOS, 30, 1
	clearflag FLAG_UNK_0A4
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0456
	scrcmd_683 VAR_TEMP_x4002
	comparevartovalue VAR_TEMP_x4002, 3
	gotoif eq, _0452
	comparevartovalue VAR_TEMP_x4002, 4
	callif eq, _0466
	checkflag FLAG_GOT_RED_SCALE
	gotoif TRUE, _046C
	openmsg
	goto_if_no_item_space ITEM_RED_SCALE, 1, _045C
	callstd std_give_item_verbose
	setflag FLAG_GOT_RED_SCALE
	clearflag FLAG_UNK_28A
	closemsg
_0452:
	releaseall
	end

_0456:
	white_out
	releaseall
	end

_045C:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

_0466:
	setflag FLAG_UNK_16A
	return

_046C:
	clearflag FLAG_HIDE_LAKE_OF_RAGE_LANCE
	hide_person obj_T29_wataru
	hide_person obj_T29_tsure_poke_607
	releaseall
	end

scr_seq_T29_003:
	checkflag FLAG_UNK_0C3
	gotoif TRUE, _0509
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0626_T29_00002
	faceplayer
	buffer_players_name 0
	gender_msgbox msg_0626_T29_00003, msg_0626_T29_00004
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _04BB
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _04FA
_04BB:
	buffer_players_name 0
	gender_msgbox msg_0626_T29_00005, msg_0626_T29_00006
	waitbutton
	closemsg
	apply_movement obj_T29_tsure_poke_607, _0538
	wait_movement
	apply_movement obj_T29_wataru, _0544
	wait_movement
	scrcmd_775 8, 10
	setflag FLAG_HIDE_LAKE_OF_RAGE_LANCE
	hide_person obj_T29_wataru
	hide_person obj_T29_tsure_poke_607
	clearflag FLAG_UNK_1F8
	setvar VAR_UNK_40A8, 1
	releaseall
	end

_04FA:
	setflag FLAG_UNK_0C3
	npc_msg msg_0626_T29_00007
	waitbutton
	closemsg
	releaseall
	end

_0509:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0626_T29_00008
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _04BB
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _04FA
	end


_0538:
	step 34, 1
	step 50, 2
	step_end

_0544:
	step 33, 1
	step_end
scr_seq_T29_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_RED_GYARADOS_MEET
	gotoif TRUE, _056A
	npc_msg msg_0626_T29_00009
	waitbutton
	closemsg
	releaseall
	end

_056A:
	npc_msg msg_0626_T29_00010
	waitbutton
	closemsg
	releaseall
	end
	.byte 0x02, 0x00
scr_seq_T29_006:
	checkflag FLAG_UNK_139
	gotoif TRUE, _0597
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0626_T29_00031, VAR_SPECIAL_x800C
	callstd std_signpost
	end

_0597:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_784 0, 0
	scrcmd_393 0, 1, 129
	scrcmd_784 0, 1
	buffer_players_name 2
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0626_T29_00032, VAR_SPECIAL_x800C
	callstd std_signpost
	dummy_486
	dummy_486
	releaseall
	end

scr_seq_T29_014:
	setvar VAR_TEMP_x4001, 1
	setvar VAR_SPECIAL_x8008, 27
	setvar VAR_SPECIAL_x8009, 1
	goto _061B
	.byte 0x02, 0x00
scr_seq_T29_015:
	setvar VAR_TEMP_x4001, 2
	setvar VAR_SPECIAL_x8008, 29
	setvar VAR_SPECIAL_x8009, 1
	goto _061B
	.byte 0x02
	.byte 0x00
scr_seq_T29_016:
	setvar VAR_TEMP_x4001, 3
	setvar VAR_SPECIAL_x8008, 23
	setvar VAR_SPECIAL_x8009, 1
	goto _061B
	.byte 0x02, 0x00
_061B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	wait_se SEQ_SE_DP_SELECT
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x8008
	copyvar VAR_SPECIAL_x8005, VAR_SPECIAL_x8009
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0657
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _06CA
	end

_0657:
	callstd std_hidden_item_fanfare
	hide_person VAR_SPECIAL_x800D
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif ne, _0676
	setflag FLAG_UNK_146
	goto _0691

_0676:
	comparevartovalue VAR_TEMP_x4001, 2
	gotoif ne, _068D
	setflag FLAG_UNK_147
	goto _0691

_068D:
	setflag FLAG_UNK_148
_0691:
	giveitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	buffer_players_name 0
	buffer_item_name 1, VAR_SPECIAL_x8004
	npc_msg msg_0626_T29_00033
	wait_fanfare
	buffer_players_name 0
	buffer_item_name 1, VAR_SPECIAL_x8004
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	buffer_pocket_name 2, VAR_SPECIAL_x800C
	npc_msg msg_0626_T29_00034
	waitbutton
	setvar VAR_SPECIAL_x800C, 1
_06C4:
	closemsg
	releaseall
	end

_06CA:
	buffer_item_name 0, VAR_SPECIAL_x8004
	npc_msg msg_0626_T29_00035
	waitbutton
	setvar VAR_SPECIAL_x800C, 0
	goto _06C4
	.byte 0x02, 0x00
scr_seq_T29_018:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	play_cry SPECIES_DRAGONITE, 0
	npc_msg msg_0626_T29_00001
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T29_007:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0626_T29_00030, VAR_SPECIAL_x800C
	callstd std_signpost
	end
	.byte 0x49, 0x00, 0xdc, 0x05, 0x60, 0x00, 0x68, 0x00, 0x2d, 0x00, 0x09, 0x32, 0x00, 0x35, 0x00, 0x61
	.byte 0x00, 0x02, 0x00
scr_seq_T29_008:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0626_T29_00012
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T29_009:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0626_T29_00011
	waitbutton
	closemsg
	releaseall
	end
	.byte 0x49, 0x00, 0xdc, 0x05, 0x60, 0x00, 0x68
	.byte 0x00, 0x2d, 0x00, 0x00, 0x32, 0x00, 0x35, 0x00, 0x61, 0x00, 0x02, 0x00
scr_seq_T29_010:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0626_T29_00018
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T29_011:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0626_T29_00021
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T29_012:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0626_T29_00024
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T29_013:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0626_T29_00027
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
