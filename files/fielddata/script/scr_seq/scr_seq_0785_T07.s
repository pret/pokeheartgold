#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T07.h"
#include "msgdata/msg/msg_0491_T07.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T07_000
	scrdef scr_seq_T07_001
	scrdef scr_seq_T07_002
	scrdef scr_seq_T07_003
	scrdef scr_seq_T07_004
	scrdef scr_seq_T07_005
	scrdef scr_seq_T07_006
	scrdef scr_seq_T07_007
	scrdef scr_seq_T07_008
	scrdef scr_seq_T07_009
	scrdef scr_seq_T07_010
	scrdef scr_seq_T07_011
	scrdef scr_seq_T07_012
	scrdef scr_seq_T07_013
	scrdef scr_seq_T07_014
	scrdef scr_seq_T07_015
	scrdef scr_seq_T07_016
	scrdef scr_seq_T07_017
	scrdef scr_seq_T07_018
	scrdef_end

scr_seq_T07_015:
	checkflag FLAG_UNK_189
	gotoif FALSE, _005F
	clearflag FLAG_UNK_189
	end

_005F:
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, _007A
	clearflag FLAG_HIDE_CAMERON
	goto _0095

_007A:
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif ne, _0091
	clearflag FLAG_HIDE_CAMERON
	goto _0095

_0091:
	setflag FLAG_HIDE_CAMERON
_0095:
	scrcmd_147 28, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, _015E
	check_badge 15, VAR_TEMP_x4002
	comparevartovalue VAR_TEMP_x4002, 1
	gotoif eq, _00C3
	goto _0198
	.byte 0x02, 0x00
_00C3:
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif ne, _00E0
	goto _0101
	.byte 0x16, 0x00, 0x1f, 0x00, 0x00, 0x00
_00E0:
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, _00F9
	goto _0101
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
_00F9:
	goto _0198
	.byte 0x02
	.byte 0x00
_0101:
	scrcmd_522 16384
	comparevartovalue VAR_TEMP_x4000, 14
	gotoif ne, _0120
	clearflag FLAG_UNK_25D
	clearflag FLAG_UNK_2E1
	goto _015C

_0120:
	comparevartovalue VAR_TEMP_x4000, 15
	gotoif ne, _013B
	clearflag FLAG_UNK_25D
	clearflag FLAG_UNK_2E1
	goto _015C

_013B:
	comparevartovalue VAR_TEMP_x4000, 16
	gotoif ne, _0156
	clearflag FLAG_UNK_25D
	clearflag FLAG_UNK_2E1
	goto _015C

_0156:
	goto _0198

_015C:
	end

_015E:
	get_phone_book_rematch 28, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, _0198
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif ne, _0190
	clearflag FLAG_UNK_25D
	setflag FLAG_UNK_2E1
	goto _0196

_0190:
	goto _0198

_0196:
	end

_0198:
	setflag FLAG_UNK_25D
	setflag FLAG_UNK_2E1
	end

scr_seq_T07_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0491_T07_00000
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T07_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 62, 0
	npc_msg msg_0491_T07_00001
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T07_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0491_T07_00002
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T07_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0491_T07_00003
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T07_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0491_T07_00004
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T07_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0491_T07_00005
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T07_006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0491_T07_00006
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T07_007:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0491_T07_00007
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T07_008:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0491_T07_00008
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T07_009:
	scrcmd_055 30, 0, 7, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_T07_010:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 31, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_T07_011:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 32, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_T07_012:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 33, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_T07_013:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 34, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_T07_014:
	scrcmd_056 3, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 35, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_T07_016:
	scrcmd_147 28, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, _046C
	comparevartovalue VAR_TEMP_x4005, 2
	gotoif eq, _0434
	comparevartovalue VAR_TEMP_x4005, 1
	gotoif eq, _03AA
_0302:
	play_se SEQ_SE_DP_SELECT
	lockall
	setvar VAR_TEMP_x4005, 1
	apply_movement obj_T07_gsleader12, _045C
	wait_movement
	npc_msg msg_0491_T07_00009
	closemsg
	apply_movement obj_T07_gsleader6, _0464
	wait_movement
	npc_msg msg_0491_T07_00010
	closemsg
	apply_movement obj_T07_gsleader12, _045C
	wait_movement
	npc_msg msg_0491_T07_00011
	closemsg
	apply_movement obj_T07_gsleader6, _0464
	wait_movement
	npc_msg msg_0491_T07_00012
	closemsg
	apply_movement obj_T07_gsleader12, _045C
	wait_movement
	npc_msg msg_0491_T07_00013
	closemsg
	apply_movement obj_T07_gsleader6, _0464
	wait_movement
	npc_msg msg_0491_T07_00014
	closemsg
	apply_movement obj_T07_gsleader12, _045C
	wait_movement
	npc_msg msg_0491_T07_00015
	closemsg
	apply_movement obj_T07_gsleader6, _0464
	wait_movement
	npc_msg msg_0491_T07_00016
	closemsg
	apply_movement obj_T07_gsleader12, _045C
	wait_movement
	npc_msg msg_0491_T07_00017
	closemsg
	apply_movement obj_T07_gsleader6, _0464
	wait_movement
	npc_msg msg_0491_T07_00018
	waitbutton
	closemsg
	releaseall
	end

_03AA:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x4005, 2
	buffer_players_name 0
	npc_msg msg_0491_T07_00019
_03BE:
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _03E2
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, _0429
	end

_03E2:
	buffer_players_name 0
	npc_msg msg_0491_T07_00020
	play_fanfare SEQ_ME_POKEGEAR_REGIST
	wait_fanfare
	register_gear_number 28
	npc_msg msg_0491_T07_00021
	waitbutton
	closemsg
	fade_screen 6, 1, 0, 0x00
	wait_fade
	setflag FLAG_UNK_25D
	hide_person 9
	hide_person 10
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 1, 0x00
	wait_fade
	releaseall
	end

_0429:
	npc_msg msg_0491_T07_00022
	waitbutton
	closemsg
	releaseall
	end

_0434:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0491_T07_00023
	goto _03BE
	.byte 0x02, 0x00, 0x49, 0x00, 0xdc, 0x05, 0x60, 0x00, 0x68, 0x00, 0x2d
	.byte 0x00, 0x15, 0x32, 0x00, 0x35, 0x00, 0x61, 0x00, 0x02, 0x00, 0x00, 0x00

_045C:
	step 35, 1
	step_end

_0464:
	step 34, 1
	step_end
_046C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0491_T07_00024
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _04D5
	photo_album_is_full VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _04E0
	npc_msg msg_0491_T07_00025
	closemsg
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0x00
	wait_fade
	cameron_photo 81
	faceplayer
	lockall
	fade_screen 6, 1, 1, 0x00
	wait_fade
	clearflag FLAG_UNK_189
	npc_msg msg_0491_T07_00026
	waitbutton
	closemsg
	releaseall
	end

_04D5:
	npc_msg msg_0491_T07_00027
	waitbutton
	closemsg
	releaseall
	end

_04E0:
	npc_msg msg_0491_T07_00028
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T07_017:
	comparevartovalue VAR_TEMP_x4002, 1
	gotoif ge, _0500
	goto _0302
	.byte 0x02, 0x00
_0500:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0491_T07_00029
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T07_018:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _063B
	photo_album_is_full VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _064F
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, _058C
	apply_movement obj_player, _0664
	apply_movement obj_T07_gsmiddleman1, _06B0
	goto _05DA

_058C:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _05A7
	apply_movement obj_player, _067C
	goto _05DA

_05A7:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, _05CA
	apply_movement obj_player, _069C
	apply_movement obj_T07_gsmiddleman1, _06B0
	goto _05DA

_05CA:
	apply_movement obj_player, _0688
	apply_movement obj_T07_gsmiddleman1, _06B0
_05DA:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _0601
	apply_movement 253, _06BC
	wait_movement
_0601:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0x00
	wait_fade
	cameron_photo 57
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

_063B:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

_064F:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end
	.byte 0x00

_0664:
	step 15, 1
	step 12, 2
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_067C:
	step 12, 3
	step 33, 1
	step_end

_0688:
	step 12, 1
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_069C:
	step 12, 1
	step 15, 1
	step 12, 3
	step 33, 1
	step_end

_06B0:
	step 63, 1
	step 32, 1
	step_end

_06BC:
	step 15, 1
	step 12, 1
	step 1, 1
	step_end
	.balign 4, 0
