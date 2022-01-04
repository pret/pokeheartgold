#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T30.h"
#include "msgdata/msg/msg_0629_T30.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T30_000
	scrdef scr_seq_T30_001
	scrdef scr_seq_T30_002
	scrdef scr_seq_T30_003
	scrdef scr_seq_T30_004
	scrdef scr_seq_T30_005
	scrdef scr_seq_T30_006
	scrdef scr_seq_T30_007
	scrdef scr_seq_T30_008
	scrdef scr_seq_T30_009
	scrdef scr_seq_T30_010
	scrdef scr_seq_T30_011
	scrdef scr_seq_T30_012
	scrdef scr_seq_T30_013
	scrdef scr_seq_T30_014
	scrdef scr_seq_T30_015
	scrdef scr_seq_T30_016
	scrdef_end

scr_seq_T30_005:
	comparevartovalue VAR_UNK_40C4, 1
	gotoif ne, _005D
	setflag FLAG_HIDE_VICTORY_ROAD_CLAIR
	setvar VAR_UNK_40C4, 2
_005D:
	checkflag FLAG_UNK_189
	gotoif FALSE, _006E
	clearflag FLAG_UNK_189
	end

_006E:
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, _0089
	clearflag FLAG_HIDE_CAMERON
	goto _00A4

_0089:
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, _00A0
	clearflag FLAG_HIDE_CAMERON
	goto _00A4

_00A0:
	setflag FLAG_HIDE_CAMERON
_00A4:
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif ne, _00BF
	clearflag FLAG_UNK_204
	goto _00C3

_00BF:
	setflag FLAG_UNK_204
_00C3:
	end

scr_seq_T30_007:
	setvar VAR_SPECIAL_x8004, 1
	setvar VAR_SPECIAL_x8005, 2
	setvar VAR_SPECIAL_x8006, 3
	callstd std_phone_call
	setvar VAR_UNK_407B, 2
	end

scr_seq_T30_006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_lead_mon_index VAR_SPECIAL_x8002
	mon_has_ribbon VAR_SPECIAL_x800C, VAR_SPECIAL_x8002, RIBBON_SNOOZE
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0209
	checkflag FLAG_GOT_SHOCK_RIBBON
	gotoif TRUE, _021D
	comparevartovalue VAR_NUM_MET_WEEKDAY_SIBLINGS, 7
	gotoif eq, _01B7
	checkflag FLAG_UNK_0D4
	gotoif TRUE, _0199
	get_weekday VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 6
	gotoif eq, _014A
	get_std_msg_naix 0, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 23
	goto _0191

_014A:
	get_std_msg_naix 0, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 20
	goto_if_no_item_space ITEM_SOFT_SAND, 1, _01AD
	callstd std_give_item_verbose
	setflag FLAG_UNK_0D4
	addvar VAR_NUM_MET_WEEKDAY_SIBLINGS, 1
	get_std_msg_naix 0, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 21
_0191:
	waitbutton
	closemsg
	releaseall
	end

_0199:
	get_std_msg_naix 0, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 22
	waitbutton
	closemsg
	releaseall
	end

_01AD:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

_01B7:
	get_weekday VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 6
	gotoif eq, _01DA
	get_std_msg_naix 0, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 23
	goto _0191

_01DA:
	get_std_msg_naix 0, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 48
	buffer_mon_species_name 0, VAR_SPECIAL_x8002
	msgbox_extern VAR_SPECIAL_x800C, 50
	give_ribbon VAR_SPECIAL_x8002, RIBBON_SNOOZE
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	setflag FLAG_GOT_SHOCK_RIBBON
	waitbutton
	closemsg
	releaseall
	end

_0209:
	get_std_msg_naix 0, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 49
	waitbutton
	closemsg
	releaseall
	end

_021D:
	get_std_msg_naix 0, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 51
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T30_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0629_T30_00000
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T30_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0D1
	gotoif TRUE, _0262
	npc_msg msg_0629_T30_00001
	waitbutton
	closemsg
	releaseall
	end

_0262:
	npc_msg msg_0629_T30_00002
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T30_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0629_T30_00003
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T30_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0629_T30_00004
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T30_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 2
	gotoif ne, _02B1
	npc_msg msg_0629_T30_00005
	goto _02B4

_02B1:
	npc_msg msg_0629_T30_00006
_02B4:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T30_016:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _03C1
	photo_album_is_full VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _03D5
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	get_player_facing VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, _0335
	apply_movement obj_player, _03EC
	apply_movement obj_T30_gsmiddleman1, _0424
	goto _0360

_0335:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _0350
	apply_movement obj_player, _0404
	goto _0360

_0350:
	apply_movement obj_player, _0410
	apply_movement obj_T30_gsmiddleman1, _0424
_0360:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _0387
	apply_movement obj_partner_poke, _0430
	wait_movement
_0387:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0x00
	wait_fade
	cameron_photo 44
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

_03C1:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

_03D5:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end
	.byte 0x00, 0x00, 0x00

_03EC:
	step 14, 1
	step 12, 2
	step 15, 1
	step 12, 3
	step 33, 1
	step_end

_0404:
	step 12, 3
	step 33, 1
	step_end

_0410:
	step 12, 1
	step 15, 1
	step 12, 3
	step 33, 1
	step_end

_0424:
	step 63, 1
	step 32, 1
	step_end

_0430:
	step 15, 1
	step 12, 1
	step 1, 1
	step_end
scr_seq_T30_008:
	direction_signpost msg_0629_T30_00010, 0, 20, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd std_signpost
	end

scr_seq_T30_009:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0629_T30_00011, VAR_SPECIAL_x800C
	callstd std_signpost
	end

scr_seq_T30_010:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0629_T30_00012, VAR_SPECIAL_x800C
	callstd std_signpost
	end

scr_seq_T30_011:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0629_T30_00013, VAR_SPECIAL_x800C
	callstd std_signpost
	end

scr_seq_T30_012:
	scrcmd_055 3, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0629_T30_00014, VAR_SPECIAL_x800C
	callstd std_signpost
	end

scr_seq_T30_013:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0629_T30_00007
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T30_014:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0629_T30_00008
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T30_015:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0629_T30_00009
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
