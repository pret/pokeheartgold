#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T07R0102.h"
#include "msgdata/msg/msg_0495_T07R0102.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T07R0102_000
	scrdef scr_seq_T07R0102_001
	scrdef scr_seq_T07R0102_002
	scrdef scr_seq_T07R0102_003
	scrdef scr_seq_T07R0102_004
	scrdef scr_seq_T07R0102_005
	scrdef scr_seq_T07R0102_006
	scrdef scr_seq_T07R0102_007
	scrdef_end

scr_seq_T07R0102_006:
	checkflag FLAG_UNK_189
	gotoif FALSE, _0033
	clearflag FLAG_UNK_189
	end

_0033:
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif ne, _004E
	clearflag FLAG_HIDE_CAMERON
	goto _0052

_004E:
	setflag FLAG_HIDE_CAMERON
_0052:
	end

scr_seq_T07R0102_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd std_mart_intro
	scrcmd_054
	setvar VAR_SPECIAL_x8004, 18
	callstd std_special_mart
	releaseall
	end

scr_seq_T07R0102_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd std_mart_intro
	scrcmd_054
	setvar VAR_SPECIAL_x8004, 19
	callstd std_special_mart
	releaseall
	end

scr_seq_T07R0102_007:
	play_se SEQ_SE_DP_SELECT
	lockall
	hasitem ITEM_FASHION_CASE, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _01DA
	npc_msg msg_0495_T07R0102_00003
	scrcmd_386 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, _00C9
	apply_movement obj_T07R0102_leader3, _01E8
	goto _00D1

_00C9:
	apply_movement obj_T07R0102_leader3, _0200
_00D1:
	wait_movement
	npc_msg msg_0495_T07R0102_00004
	apply_movement obj_T07R0102_leader3, _0218
	wait_movement
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, _00FB
	apply_movement obj_T07R0102_leader3, _0220
	goto _011E

_00FB:
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, _0116
	apply_movement obj_T07R0102_leader3, _0230
	goto _011E

_0116:
	apply_movement obj_T07R0102_leader3, _0228
_011E:
	wait_movement
	npc_msg msg_0495_T07R0102_00005
	setvar VAR_SPECIAL_x8004, 92
	setvar VAR_SPECIAL_x8005, 1
	callstd std_receive_accessory
	npc_msg msg_0495_T07R0102_00006
	setvar VAR_SPECIAL_x8004, 93
	setvar VAR_SPECIAL_x8005, 1
	callstd std_receive_accessory
	npc_msg msg_0495_T07R0102_00007
	setvar VAR_SPECIAL_x8004, 94
	setvar VAR_SPECIAL_x8005, 1
	callstd std_receive_accessory
	npc_msg msg_0495_T07R0102_00008
	closemsg
	comparevartovalue VAR_TEMP_x4000, 3
	callif eq, _01A0
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif ne, _0186
	apply_movement obj_T07R0102_leader3, _0250
	goto _018E

_0186:
	apply_movement obj_T07R0102_leader3, _0238
_018E:
	wait_movement
	hide_person obj_T07R0102_leader3
	setflag FLAG_UNK_313
	clearflag FLAG_HIDE_ROUTE_47_CRASHER_WAKE
	releaseall
	end

_01A0:
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _01D8
	get_person_coords 253, VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	comparevartovalue VAR_SPECIAL_x8005, 5
	gotoif ne, _01D8
	release obj_partner_poke
	apply_movement obj_partner_poke, _0264
	wait_movement
	lock obj_partner_poke
_01D8:
	return

_01DA:
	npc_msg msg_0495_T07R0102_00009
	waitbutton
	closemsg
	releaseall
	end
	.byte 0x00, 0x00, 0x00

_01E8:
	step 14, 1
	step 32, 1
	step 63, 1
	step 15, 1
	step 32, 1
	step_end

_0200:
	step 15, 1
	step 32, 1
	step 63, 1
	step 14, 1
	step 32, 1
	step_end

_0218:
	step 75, 1
	step_end

_0220:
	step 33, 1
	step_end

_0228:
	step 34, 1
	step_end

_0230:
	step 35, 1
	step_end

_0238:
	step 14, 2
	step 13, 1
	step 14, 4
	step 12, 1
	step 14, 4
	step_end

_0250:
	step 13, 1
	step 14, 6
	step 12, 1
	step 14, 4
	step_end

_0264:
	step 78, 1
	step 76, 1
	step 1, 1
	step_end
scr_seq_T07R0102_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _039C
	photo_album_is_full VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _03B0
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, _02ED
	apply_movement obj_player, _03C4
	apply_movement obj_T07R0102_gsmiddleman1_2, _0410
	goto _033B

_02ED:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _0308
	apply_movement obj_player, _03DC
	goto _033B

_0308:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, _032B
	apply_movement obj_player, _03FC
	apply_movement obj_T07R0102_gsmiddleman1_2, _0410
	goto _033B

_032B:
	apply_movement obj_player, _03E8
	apply_movement obj_T07R0102_gsmiddleman1_2, _0410
_033B:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _0362
	apply_movement obj_partner_poke, _041C
	wait_movement
_0362:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0x00
	wait_fade
	cameron_photo 58
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

_039C:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

_03B0:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end


_03C4:
	step 15, 1
	step 12, 2
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_03DC:
	step 12, 3
	step 33, 1
	step_end

_03E8:
	step 12, 1
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_03FC:
	step 12, 1
	step 15, 1
	step 12, 3
	step 33, 1
	step_end

_0410:
	step 63, 1
	step 32, 1
	step_end

_041C:
	step 15, 1
	step 12, 1
	step 1, 1
	step_end
scr_seq_T07R0102_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0495_T07R0102_00000
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T07R0102_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0495_T07R0102_00001
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T07R0102_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0495_T07R0102_00002
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
