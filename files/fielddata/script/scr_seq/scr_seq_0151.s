#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_0151.h"
#include "msgdata/msg/msg_0246.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0151_000
	scrdef scr_seq_0151_001
	scrdef scr_seq_0151_002
	scrdef scr_seq_0151_003
	scrdef scr_seq_0151_004
	scrdef scr_seq_0151_005
	scrdef scr_seq_0151_006
	scrdef scr_seq_0151_007
	scrdef scr_seq_0151_008
	scrdef scr_seq_0151_009
	scrdef scr_seq_0151_010
	scrdef scr_seq_0151_011
	scrdef scr_seq_0151_012
	scrdef scr_seq_0151_013
	scrdef scr_seq_0151_014
	scrdef scr_seq_0151_015
	scrdef scr_seq_0151_016
	scrdef scr_seq_0151_017
	scrdef scr_seq_0151_018
	scrdef scr_seq_0151_019
	scrdef scr_seq_0151_020
	scrdef scr_seq_0151_021
	scrdef scr_seq_0151_022
	scrdef scr_seq_0151_023
	scrdef scr_seq_0151_024
	scrdef scr_seq_0151_025
	scrdef scr_seq_0151_026
	scrdef scr_seq_0151_027
	scrdef scr_seq_0151_028
	scrdef_end

_0076:
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_176 96, 0, 46, 50, 0
	fade_screen 6, 1, 1, 0x00
	wait_fade
	return

scr_seq_0151_000:
	scrcmd_609
	lockall
	play_se SEQ_SE_DP_PINPON
	npc_msg msg_0246_00000
	closemsg
	call _0076
	releaseall
	end

scr_seq_0151_001:
	scrcmd_609
	lockall
	play_se SEQ_SE_DP_PINPON
	npc_msg msg_0246_00001
	closemsg
	call _0076
	releaseall
	end

scr_seq_0151_002:
	end

scr_seq_0151_003:
	end

scr_seq_0151_004:
	scrcmd_609
	lockall
	scrcmd_789 0
	npc_msg msg_0246_00003
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, _00F9
	call _0076
	releaseall
	end

_00F9:
	releaseall
	end

scr_seq_0151_005:
	comparevartovalue VAR_UNK_4058, 0
	gotoif eq, _0114
	call _02BC
	endstd
	end

_0114:
	checkflag FLAG_DAILY_DID_BUG_CONTEST
	gotoif TRUE, _02A6
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, _0139
	npc_msg msg_0246_00004
	goto _016E

_0139:
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif ne, _014F
	npc_msg msg_0246_00005
	goto _016E

_014F:
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif ne, _0165
	npc_msg msg_0246_00006
	goto _016E

_0165:
	npc_msg msg_0246_00007
	goto _0260

_016E:
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _018E
	npc_msg msg_0246_00017
	goto _0260
	.byte 0x02, 0x00
_018E:
	count_pc_empty_space VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, _01B0
	get_party_count VAR_SPECIAL_x8004
	comparevartovalue VAR_SPECIAL_x8004, 6
	gotoif eq, _02B1
_01B0:
	count_alive_mons VAR_SPECIAL_x8005, 6
	comparevartovalue VAR_SPECIAL_x8005, 1
	gotoif ne, _01D4
	get_party_count VAR_SPECIAL_x8004
	comparevartovalue VAR_SPECIAL_x8004, 1
	gotoif eq, _021A
_01D4:
	get_lead_mon_index VAR_SPECIAL_x800C
	bufferpartymonnick 0, VAR_SPECIAL_x800C
	npc_msg msg_0246_00010
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0200
	npc_msg msg_0246_00028
	goto _0260
	.byte 0x02, 0x00
_0200:
	fade_out_bgm 0, 10
	play_bgm SEQ_GS_TAIKAIMAE
	buffer_players_name 0
	npc_msg msg_0246_00013
	setflag FLAG_UNK_15F
	goto _0224

_021A:
	fade_out_bgm 0, 10
	play_bgm SEQ_GS_TAIKAIMAE
_0224:
	buffer_players_name 0
	npc_msg msg_0246_00014
	npc_msg msg_0246_00015
	setflag FLAG_UNK_993
	setflag FLAG_UNK_24E
	setvar VAR_UNK_4118, 1
	setvar VAR_UNK_40F7, 1
	script_overlay_cmd 1, 0
	scrcmd_785 0, 16384
	call _0268
	script_overlay_cmd 1, 1
	setflag FLAG_UNK_996
	goto _0262
	.byte 0x02, 0x00
_0260:
	waitbutton
_0262:
	closemsg
	endstd
	end

_0268:
	setvar VAR_SPECIAL_x8004, 0
	setvar VAR_SPECIAL_x8005, 627
_0274:
	scrcmd_790 32772, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, _028B
	setflagvar VAR_SPECIAL_x8005
_028B:
	addvar VAR_SPECIAL_x8004, 1
	addvar VAR_SPECIAL_x8005, 1
	comparevartovalue VAR_SPECIAL_x8004, 10
	gotoif lt, _0274
	return

_02A6:
	npc_msg msg_0246_00018
	goto _0260
	.byte 0x02
	.byte 0x00
_02B1:
	npc_msg msg_0246_00016
	goto _0260
	.byte 0x02, 0x00
_02BC:
	buffer_players_name 0
	npc_msg msg_0246_00020
	hasspaceforitem VAR_UNK_4058, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _02F3
	copyvar VAR_SPECIAL_x8004, VAR_UNK_4058
	setvar VAR_SPECIAL_x8005, 1
	callstd std_obtain_item_verbose
	setvar VAR_UNK_4058, 0
	goto _02F8

_02F3:
	npc_msg msg_0246_00021
	waitbutton
_02F8:
	closemsg
	return
	.byte 0x2d, 0x00, 0x12, 0x16
	.byte 0x00, 0x5b, 0xff, 0xff, 0xff, 0x02, 0x00
scr_seq_0151_006:
	scrcmd_789 0
	npc_msg msg_0246_00023
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _032B
	npc_msg msg_0246_00026
	closemsg
	endstd
	end

_032B:
	npc_msg msg_0246_00027
	closemsg
	setvar VAR_UNK_4118, 2
	call _0076
	endstd
	end

scr_seq_0151_007:
	scrcmd_609
	lockall
	setvar VAR_UNK_4118, 0
	setvar VAR_UNK_40F7, 0
	script_overlay_cmd 1, 0
	scrcmd_787 16384, 16385, 16386
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	scrcmd_102 VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	apply_movement 241, _053C
	wait_movement
	npc_msg msg_0246_00029
	scrcmd_786 2
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, _038E
	npc_msg msg_0246_00030
	goto _0391

_038E:
	npc_msg msg_0246_00031
_0391:
	play_fanfare SEQ_ME_MUSHITORI3
	wait_fanfare
	npc_msg msg_0246_00032
	scrcmd_786 1
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif ne, _03B3
	npc_msg msg_0246_00033
	goto _03B6

_03B3:
	npc_msg msg_0246_00034
_03B6:
	play_fanfare SEQ_ME_MUSHITORI2
	wait_fanfare
	npc_msg msg_0246_00032
	scrcmd_786 0
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, _03DC
	setflag FLAG_UNK_141
	npc_msg msg_0246_00035
	goto _03E3

_03DC:
	clearflag FLAG_UNK_141
	npc_msg msg_0246_00036
_03E3:
	play_fanfare SEQ_ME_MUSHITORI1
	wait_fanfare
	npc_msg msg_0246_00032
	buffer_players_name 0
	buffer_item_name 3, VAR_TEMP_x4001
	setvar VAR_SPECIAL_x8004, 37
	addvar VAR_SPECIAL_x8004, VAR_TEMP_x4000
	non_npc_msg_var VAR_SPECIAL_x8004
	copyvar VAR_SPECIAL_x8004, VAR_TEMP_x4001
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _042F
	callstd std_give_item_verbose
	goto _043B

_042F:
	buffer_players_name 0
	npc_msg msg_0246_00045
	copyvar VAR_UNK_4058, VAR_TEMP_x4001
_043B:
	checkflag FLAG_UNK_15F
	callif TRUE, _04F6
	npc_msg msg_0246_00042
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif ne, _045E
	closemsg
	goto _04B5

_045E:
	buffer_species_name 1, VAR_TEMP_x4002, 2, 1
	npc_msg msg_0246_00043
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _049E
	fade_screen 6, 1, 0, 0x00
	wait_fade
	nickname_input 255, VAR_SPECIAL_x800C
	fade_screen 6, 1, 1, 0x00
	wait_fade
_049E:
	scrcmd_788 5, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _04B5
	npc_msg msg_0246_00046
	closemsg
_04B5:
	apply_movement 241, _0544
	wait_movement
	fade_out_bgm 0, 10
	play_bgm SEQ_GS_D_KOUEN
	scrcmd_103
	call _04FD
	setflag FLAG_DAILY_DID_BUG_CONTEST
	clearflag FLAG_UNK_993
	clearflag FLAG_UNK_24E
	clearflag FLAG_UNK_15F
	scrcmd_785 1, 0
	script_overlay_cmd 1, 1
	fade_out_bgm 0, 30
	reset_bgm
	releaseall
	end

_04F6:
	npc_msg msg_0246_00047
	closemsg
	return

_04FD:
	setvar VAR_SPECIAL_x8004, 0
	setvar VAR_SPECIAL_x8005, 10
	setvar VAR_SPECIAL_x8006, 627
_050F:
	scrcmd_109 VAR_SPECIAL_x8005, 2
	clearflagvar VAR_SPECIAL_x8006
	addvar VAR_SPECIAL_x8004, 1
	addvar VAR_SPECIAL_x8005, 1
	addvar VAR_SPECIAL_x8006, 1
	comparevartovalue VAR_SPECIAL_x8004, 10
	gotoif lt, _050F
	return
	.byte 0x00, 0x00

_053C:
	step 15, 5
	step_end

_0544:
	step 14, 5
	step_end
scr_seq_0151_008:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0246_00048
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0151_009:
	checkflag FLAG_UNK_141
	gotoif TRUE, _0581
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0246_00049
	waitbutton
	closemsg
	releaseall
	goto _0592

_0581:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0246_00050
	waitbutton
	closemsg
	releaseall
_0592:
	end

scr_seq_0151_010:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0246_00051
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0151_011:
	checkflag FLAG_UNK_141
	gotoif TRUE, _05C9
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0246_00052
	waitbutton
	closemsg
	releaseall
	goto _05DA

_05C9:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0246_00053
	waitbutton
	closemsg
	releaseall
_05DA:
	end

scr_seq_0151_012:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0246_00054
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0151_013:
	checkflag FLAG_UNK_141
	gotoif TRUE, _0611
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0246_00055
	waitbutton
	closemsg
	releaseall
	goto _0622

_0611:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0246_00056
	waitbutton
	closemsg
	releaseall
_0622:
	end

scr_seq_0151_014:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0246_00057
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0151_015:
	checkflag FLAG_UNK_141
	gotoif TRUE, _0659
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0246_00058
	waitbutton
	closemsg
	releaseall
	goto _066A

_0659:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0246_00059
	waitbutton
	closemsg
	releaseall
_066A:
	end

scr_seq_0151_016:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0246_00060
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0151_017:
	checkflag FLAG_UNK_141
	gotoif TRUE, _06A1
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0246_00061
	waitbutton
	closemsg
	releaseall
	goto _06B2

_06A1:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0246_00062
	waitbutton
	closemsg
	releaseall
_06B2:
	end

scr_seq_0151_018:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0246_00063
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0151_019:
	checkflag FLAG_UNK_141
	gotoif TRUE, _06E9
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0246_00064
	waitbutton
	closemsg
	releaseall
	goto _06FA

_06E9:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0246_00065
	waitbutton
	closemsg
	releaseall
_06FA:
	end

scr_seq_0151_020:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0246_00066
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0151_021:
	checkflag FLAG_UNK_141
	gotoif TRUE, _0731
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0246_00067
	waitbutton
	closemsg
	releaseall
	goto _0742

_0731:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0246_00068
	waitbutton
	closemsg
	releaseall
_0742:
	end

scr_seq_0151_022:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0246_00069
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0151_023:
	checkflag FLAG_UNK_141
	gotoif TRUE, _0779
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0246_00070
	waitbutton
	closemsg
	releaseall
	goto _078A

_0779:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0246_00071
	waitbutton
	closemsg
	releaseall
_078A:
	end

scr_seq_0151_024:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0246_00072
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0151_025:
	checkflag FLAG_UNK_141
	gotoif TRUE, _07C1
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0246_00073
	waitbutton
	closemsg
	releaseall
	goto _07D2

_07C1:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0246_00074
	waitbutton
	closemsg
	releaseall
_07D2:
	end

scr_seq_0151_026:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0246_00075
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0151_027:
	checkflag FLAG_UNK_141
	gotoif TRUE, _0809
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0246_00076
	waitbutton
	closemsg
	releaseall
	goto _081A

_0809:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0246_00077
	waitbutton
	closemsg
	releaseall
_081A:
	end

scr_seq_0151_028:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4058, 0
	gotoif eq, _083D
	call _02BC
	goto _0844

_083D:
	npc_msg msg_0246_00022
	waitbutton
	closemsg
_0844:
	releaseall
	end
	.balign 4, 0
