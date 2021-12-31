#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D22R0101.h"
#include "msgdata/msg/msg_0062_D22R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D22R0101_000
	scrdef scr_seq_D22R0101_001
	scrdef scr_seq_D22R0101_002
	scrdef scr_seq_D22R0101_003
	scrdef scr_seq_D22R0101_004
	scrdef scr_seq_D22R0101_005
	scrdef scr_seq_D22R0101_006
	scrdef scr_seq_D22R0101_007
	scrdef scr_seq_D22R0101_008
	scrdef scr_seq_D22R0101_009
	scrdef scr_seq_D22R0101_010
	scrdef scr_seq_D22R0101_011
	scrdef scr_seq_D22R0101_012
	scrdef scr_seq_D22R0101_013
	scrdef scr_seq_D22R0101_014
	scrdef scr_seq_D22R0101_015
	scrdef scr_seq_D22R0101_016
	scrdef scr_seq_D22R0101_017
	scrdef scr_seq_D22R0101_018
	scrdef scr_seq_D22R0101_019
	scrdef scr_seq_D22R0101_020
	scrdef scr_seq_D22R0101_021
	scrdef scr_seq_D22R0101_022
	scrdef scr_seq_D22R0101_023
	scrdef scr_seq_D22R0101_024
	scrdef scr_seq_D22R0101_025
	scrdef scr_seq_D22R0101_026
	scrdef_end

scr_seq_D22R0101_011:
	comparevartovalue VAR_UNK_40F7, 1
	callif eq, _007D
	end

_007D:
	move_person 20, 51, 0, 48, 1
	setvar VAR_TEMP_x4000, 0
	setvar VAR_TEMP_x4001, 10
	setvar VAR_TEMP_x4002, 48
	scrcmd_784 1, 0
_009F:
	scrcmd_790 16384, 16388
	comparevartovalue VAR_TEMP_x4004, 1
	gotoif ne, _00C4
	move_person VAR_TEMP_x4001, VAR_TEMP_x4002, 0, 50, 0
	addvar VAR_TEMP_x4002, 2
_00C4:
	addvar VAR_TEMP_x4000, 1
	addvar VAR_TEMP_x4001, 1
	comparevartovalue VAR_TEMP_x4000, 10
	gotoif lt, _009F
	scrcmd_784 1, 1
	return

scr_seq_D22R0101_025:
	checkflag FLAG_UNK_189
	gotoif FALSE, _00F4
	clearflag FLAG_UNK_189
	end

_00F4:
	comparevartovalue VAR_UNK_40F7, 1
	gotoif eq, _0162
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, _0154
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif eq, _0154
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif eq, _0162
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif eq, _0162
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif eq, _0162
	setflag FLAG_HIDE_CAMERON
	clearflag FLAG_UNK_27F
	goto _016E

_0154:
	clearflag FLAG_HIDE_CAMERON
	setflag FLAG_UNK_27F
	goto _016E

_0162:
	setflag FLAG_HIDE_CAMERON
	setflag FLAG_UNK_27F
	clearflag FLAG_UNK_996
_016E:
	checkflag FLAG_GAME_CLEAR
	gotoif TRUE, _017F
	setflag FLAG_UNK_288
	end

_017F:
	get_phone_book_rematch 34, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, _01C9
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, _01C3
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif eq, _01C3
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif eq, _01C3
	setflag FLAG_UNK_288
	end

_01C3:
	clearflag FLAG_UNK_288
	end

_01C9:
	setflag FLAG_UNK_288
	end

scr_seq_D22R0101_012:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0062_D22R0101_00045
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D22R0101_013:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0062_D22R0101_00048
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D22R0101_014:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0062_D22R0101_00051
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D22R0101_015:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0062_D22R0101_00054
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D22R0101_016:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0062_D22R0101_00057
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D22R0101_017:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0062_D22R0101_00060
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D22R0101_018:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0062_D22R0101_00063
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D22R0101_019:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0062_D22R0101_00066
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D22R0101_020:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0062_D22R0101_00069
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D22R0101_021:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0062_D22R0101_00072
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D22R0101_022:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0062_D22R0101_00042
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D22R0101_026:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif eq, _02C7
	buffer_players_name 0
	npc_msg msg_0062_D22R0101_00084
	waitbutton
	closemsg
	releaseall
	end

_02C7:
	buffer_players_name 0
	npc_msg msg_0062_D22R0101_00085
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _032B
	photo_album_is_full VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0336
	npc_msg msg_0062_D22R0101_00086
	closemsg
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0x00
	wait_fade
	cameron_photo 7
	faceplayer
	lockall
	fade_screen 6, 1, 1, 0x00
	wait_fade
	clearflag FLAG_UNK_189
	npc_msg msg_0062_D22R0101_00087
	waitbutton
	closemsg
	releaseall
	end

_032B:
	npc_msg msg_0062_D22R0101_00088
	waitbutton
	closemsg
	releaseall
	end

_0336:
	npc_msg msg_0062_D22R0101_00089
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D22R0101_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_10E
	gotoif TRUE, _0380
	npc_msg msg_0062_D22R0101_00002
	setvar VAR_SPECIAL_x8004, 217
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _038B
	callstd std_give_item_verbose
	setflag FLAG_UNK_10E
_0380:
	npc_msg msg_0062_D22R0101_00004
	waitbutton
	closemsg
	releaseall
	end

_038B:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

scr_seq_D22R0101_023:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0650
	photo_album_is_full VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0664
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, _040E
	apply_movement obj_player, _04C0
	apply_movement obj_D22R0101_gsmiddleman1_3, _050C
	goto _045C

_040E:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _0429
	apply_movement obj_player, _04D8
	goto _045C

_0429:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, _044C
	apply_movement obj_player, _04F8
	apply_movement obj_D22R0101_gsmiddleman1_3, _050C
	goto _045C

_044C:
	apply_movement obj_player, _04E4
	apply_movement obj_D22R0101_gsmiddleman1_3, _050C
_045C:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _0483
	apply_movement obj_partner_poke, _0518
	wait_movement
_0483:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0x00
	wait_fade
	cameron_photo 16
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
	.byte 0x00, 0x00, 0x00

_04C0:
	step 15, 1
	step 12, 2
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_04D8:
	step 12, 3
	step 33, 1
	step_end

_04E4:
	step 12, 1
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_04F8:
	step 12, 1
	step 15, 1
	step 12, 3
	step 33, 1
	step_end

_050C:
	step 63, 1
	step 32, 1
	step_end

_0518:
	step 15, 1
	step 12, 1
	step 1, 1
	step_end
scr_seq_D22R0101_024:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0650
	photo_album_is_full VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0664
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, _05A1
	apply_movement obj_player, _04C0
	apply_movement obj_D22R0101_gsmiddleman1_4, _050C
	goto _05EF

_05A1:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _05BC
	apply_movement obj_player, _04D8
	goto _05EF

_05BC:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, _05DF
	apply_movement obj_player, _0678
	apply_movement obj_D22R0101_gsmiddleman1_4, _050C
	goto _05EF

_05DF:
	apply_movement obj_player, _04E4
	apply_movement obj_D22R0101_gsmiddleman1_4, _050C
_05EF:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _0616
	apply_movement obj_partner_poke, _0518
	wait_movement
_0616:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0x00
	wait_fade
	cameron_photo 17
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

_0650:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

_0664:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end


_0678:
	step 13, 1
	step 15, 2
	step 12, 2
	step 14, 1
	step 12, 2
	step 33, 1
	step_end
scr_seq_D22R0101_001:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 22, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_D22R0101_002:
	scrcmd_056 3, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 23, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_D22R0101_003:
	scrcmd_056 3, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 24, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_D22R0101_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0062_D22R0101_00000
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D22R0101_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0062_D22R0101_00001
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D22R0101_006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0062_D22R0101_00005
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D22R0101_007:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0062_D22R0101_00006
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D22R0101_008:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0062_D22R0101_00009
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D22R0101_009:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0062_D22R0101_00007
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D22R0101_010:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0062_D22R0101_00008
	play_cry SPECIES_PERSIAN, 0
	wait_cry
	waitbutton
	closemsg
	releaseall
	end
	.byte 0x02, 0x00, 0x00, 0x00
	.balign 4, 0
