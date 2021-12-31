#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T07R0104.h"
#include "msgdata/msg/msg_0497_T07R0104.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T07R0104_000
	scrdef scr_seq_T07R0104_001
	scrdef scr_seq_T07R0104_002
	scrdef scr_seq_T07R0104_003
	scrdef scr_seq_T07R0104_004
	scrdef scr_seq_T07R0104_005
	scrdef scr_seq_T07R0104_006
	scrdef_end

scr_seq_T07R0104_004:
	checkflag FLAG_UNK_189
	gotoif FALSE, _002F
	clearflag FLAG_UNK_189
	end

_002F:
	scrcmd_147 18, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, _0082
	check_badge 12, VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, _005B
	goto _00C2

_005B:
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif ne, _007A
	clearflag FLAG_UNK_260
	clearflag FLAG_UNK_2E2
	goto _0080

_007A:
	goto _00C2

_0080:
	end

_0082:
	get_phone_book_rematch 18, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, _00C2
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif ne, _00BA
	clearflag FLAG_UNK_260
	setflag FLAG_UNK_2E2
	scrcmd_341 3, 1
	goto _00C0

_00BA:
	goto _00C2

_00C0:
	end

_00C2:
	setflag FLAG_UNK_260
	setflag FLAG_UNK_2E2
	end

_00CC:
	play_se SEQ_SE_DP_SELECT
	lockall
	apply_movement obj_T07R0104_gsleader1, _026C
	wait_movement
	npc_msg msg_0497_T07R0104_00000
	closemsg
	apply_movement obj_T07R0104_gsleader13, _0274
	wait_movement
	npc_msg msg_0497_T07R0104_00001
	closemsg
	apply_movement obj_T07R0104_gsleader1, _026C
	wait_movement
	npc_msg msg_0497_T07R0104_00002
	closemsg
	apply_movement obj_T07R0104_gsleader13, _0274
	wait_movement
	npc_msg msg_0497_T07R0104_00003
	closemsg
	apply_movement obj_T07R0104_gsleader1, _027C
	wait_movement
	npc_msg msg_0497_T07R0104_00004
_011B:
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _013F
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, _0189
	end

_013F:
	npc_msg msg_0497_T07R0104_00005
	register_gear_number 18
	buffer_players_name 0
	npc_msg msg_0497_T07R0104_00006
	play_fanfare SEQ_ME_POKEGEAR_REGIST
	wait_fanfare
	npc_msg msg_0497_T07R0104_00007
	waitbutton
	closemsg
	fade_screen 6, 1, 0, 0x00
	wait_fade
	setflag FLAG_UNK_260
	hide_person obj_T07R0104_gsleader1
	hide_person obj_T07R0104_gsleader13
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 1, 0x00
	wait_fade
	releaseall
	end

_0189:
	setvar VAR_TEMP_x4004, 1
	npc_msg msg_0497_T07R0104_00008
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T07R0104_005:
	scrcmd_147 18, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, _01CD
	comparevartovalue VAR_TEMP_x4004, 1
	gotoif ne, _00CC
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0497_T07R0104_00009
	goto _011B
	.byte 0x02, 0x00
_01CD:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0497_T07R0104_00010
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0236
	photo_album_is_full VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0241
	npc_msg msg_0497_T07R0104_00011
	closemsg
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0x00
	wait_fade
	cameron_photo 2
	faceplayer
	lockall
	fade_screen 6, 1, 1, 0x00
	wait_fade
	clearflag FLAG_UNK_189
	npc_msg msg_0497_T07R0104_00012
	waitbutton
	closemsg
	releaseall
	end

_0236:
	npc_msg msg_0497_T07R0104_00013
	waitbutton
	closemsg
	releaseall
	end

_0241:
	npc_msg msg_0497_T07R0104_00014
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T07R0104_006:
	comparevartovalue VAR_TEMP_x4004, 1
	gotoif ne, _00CC
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0497_T07R0104_00015
	waitbutton
	closemsg
	releaseall
	end


_026C:
	step 34, 1
	step_end

_0274:
	step 35, 1
	step_end

_027C:
	step 33, 1
	step_end
scr_seq_T07R0104_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd 2011
	scrcmd_054
	setvar VAR_SPECIAL_x8004, 21
	callstd 2052
	releaseall
	end

scr_seq_T07R0104_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0497_T07R0104_00016
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T07R0104_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0497_T07R0104_00017
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T07R0104_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0497_T07R0104_00018
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
