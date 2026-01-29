#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_0166.h"
#include "msgdata/msg/msg_0043.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0166_000
	scrdef scr_seq_0166_001
	scrdef scr_seq_0166_002
	scrdef scr_seq_0166_003
	scrdef scr_seq_0166_004
	scrdef scr_seq_0166_005
	scrdef scr_seq_0166_006
	scrdef scr_seq_0166_007
	scrdef scr_seq_0166_008
	scrdef scr_seq_0166_009
	scrdef scr_seq_0166_010
	scrdef scr_seq_0166_011
	scrdef scr_seq_0166_012
	scrdef_end

scr_seq_0166_000:
	scrcmd_609
	lockall
	setvar VAR_SPECIAL_RESULT, 7
	clearflag FLAG_UNK_966
	setvar VAR_UNK_4133, 0
	releaseall
	end

scr_seq_0166_001:
	end

scr_seq_0166_002:
	end

_0052:
	return

scr_seq_0166_003:
	scrcmd_521
	call _0064
	call _0052
	end

_0064:
	return
	return
scr_seq_0166_004:
	end
	make_object_visible 0xFF
	return
scr_seq_0166_005:
	simple_npc_msg msg_0043_00000
	end

scr_seq_0166_006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x4003, 0
	setvar VAR_SPECIAL_x8007, 2
	npc_msg msg_0043_00003
	goto _00C1
	end
scr_seq_0166_007:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x4003, 1
	setvar VAR_SPECIAL_x8007, 2
	npc_msg msg_0043_00007
	goto _00C1
	end
_00C1:
	compare VAR_TEMP_x4003, 1
	goto_if_eq _00D7
	npc_msg msg_0043_00004
	goto _00DA

_00D7:
	npc_msg msg_0043_00012
_00DA:
	scrcmd_065 1, 1, 0, 1, VAR_SPECIAL_RESULT
	scrcmd_066 msg_0043_00008, 0
	scrcmd_066 msg_0043_00009, 1
	scrcmd_066 msg_0043_00010, 2
	scrcmd_067
	switch VAR_SPECIAL_RESULT
	case 0, _012F
	case 1, _0137
	goto _0118
	end
_0118:
	scrcmd_283
	setvar VAR_UNK_4133, 0
	clearflag FLAG_UNK_966
	npc_msg msg_0043_00011
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_012F:
	goto _0254
	end
_0137:
	compare VAR_TEMP_x4003, 1
	goto_if_eq _014C
	goto _0155
	end
_014C:
	npc_msg msg_0043_00013
	goto _00C1

_0155:
	npc_msg msg_0043_00005
_0158:
	scrcmd_064 1, 1, 0, 1, VAR_SPECIAL_RESULT
	scrcmd_066 msg_0043_00096, 0
	scrcmd_066 msg_0043_00097, 1
	scrcmd_066 msg_0043_00098, 2
	scrcmd_066 msg_0043_00099, 3
	scrcmd_067
	switch VAR_SPECIAL_RESULT
	case 0, _01A7
	case 1, _01AF
	case 2, _01BA
	goto _00C1
	end
_01A7:
	goto _01C8
	end
_01AF:
	npc_msg msg_0043_00018
	goto _0155
	end
_01BA:
	npc_msg msg_0043_00019
	goto _0155
	end
_01C5:
	npc_msg msg_0043_00117
_01C8:
	scrcmd_065 1, 1, 0, 1, VAR_SPECIAL_RESULT
	scrcmd_066 msg_0043_00036, 0
	scrcmd_066 msg_0043_00037, 1
	scrcmd_066 msg_0043_00038, 2
	scrcmd_066 msg_0043_00039, 3
	scrcmd_066 msg_0043_00040, 4
	scrcmd_067
	switch VAR_SPECIAL_RESULT
	case 0, _0228
	case 1, _0233
	case 2, _023E
	case 3, _0249
	goto _0158
	end
_0228:
	npc_msg msg_0043_00014
	goto _01C5
	end
_0233:
	npc_msg msg_0043_00015
	goto _01C5
	end
_023E:
	npc_msg msg_0043_00016
	goto _01C5
	end
_0249:
	npc_msg msg_0043_00017
	goto _01C5
	end
_0254:
	npc_msg msg_0043_00219
	scrcmd_064 18, 1, 0, 1, VAR_SPECIAL_RESULT
	scrcmd_066 msg_0043_00014, 0
	scrcmd_066 msg_0043_00015, 1
	scrcmd_066 msg_0043_00005, 2
	scrcmd_067
	switch VAR_SPECIAL_RESULT
	case 0, _0295
	case 1, _02E7
	goto _0118
	end
_0295:
	npc_msg msg_0043_00212
	yesno VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0254
	closemsg
	scrcmd_226 8, VAR_SPECIAL_x8005, VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _02D7
	compare VAR_SPECIAL_RESULT, 3
	goto_if_eq _02DF
	goto _0339
	end
_02D7:
	goto _0254
	end
_02DF:
	goto _0254
	end
_02E7:
	npc_msg msg_0043_00212
	yesno VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0254
	closemsg
	scrcmd_227 8, VAR_SPECIAL_x8005, VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0329
	compare VAR_SPECIAL_RESULT, 3
	goto_if_eq _0331
	goto _0339
	end
_0329:
	goto _0254
	end
_0331:
	scrcmd_283
	closemsg
	releaseall
	end

_0339:
	scrcmd_234 VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x8007, VAR_TEMP_x4002
	scrcmd_232 25
	scrcmd_233 25
_0347:
	compare VAR_TEMP_x4003, 0
	goto_if_eq _038D
	compare VAR_TEMP_x4003, 1
	goto_if_eq _0395
	compare VAR_TEMP_x4003, 2
	goto_if_eq _03A7
	end
	scrcmd_236 VAR_SPECIAL_RESULT
	addvar VAR_SPECIAL_RESULT, 1
	npc_msg msg_0043_00177
	scrcmd_236 VAR_SPECIAL_RESULT
	closemsg
	goto _0347
_038D:
	goto _03B4
	end
_0395:
	setflag FLAG_UNK_966
	setvar VAR_UNK_4133, 5
	goto _03B4
	end
_03A7:
	scrcmd_048 msg_0043_00211
	closemsg
	goto _03B4
	end
_03B4:
	get_player_gender VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _03CD
	goto _03DB
	end
_03CD:
	buffer_players_name 0
	scrcmd_048 msg_0043_00066
	goto _03E9
	end
_03DB:
	buffer_players_name 0
	scrcmd_048 msg_0043_00067
	goto _03E9
	end
_03E9:
	scrcmd_048 msg_0043_00068
	scrcmd_232 26
	scrcmd_233 26
	closemsg
	goto _03FE
	end
_03FE:
	scrcmd_232 4
	scrcmd_233 4
	scrcmd_257 239
	pokeathlon 1, 0, VAR_SPECIAL_x8000, VAR_SPECIAL_RESULT, VAR_SPECIAL_x8001, VAR_SPECIAL_x8002, VAR_SPECIAL_x8003
	scrcmd_237
	scrcmd_048 msg_0043_00078
	closemsg
	scrcmd_232 24
	scrcmd_233 24
	scrcmd_587
	wait 10, VAR_SPECIAL_RESULT
	scrcmd_235 VAR_TEMP_x4002
	clearflag FLAG_UNK_966
	setvar VAR_UNK_4133, 0
	goto _0443

_0443:
	releaseall
	end

_0447: ; unreferenced
	   play_se SEQ_SE_DP_CON_F007
	   compare VAR_SPECIAL_RESULT, 1
	   call_if_eq _048E
	   compare VAR_SPECIAL_RESULT, 2
	   call_if_eq _0498
	   compare VAR_SPECIAL_RESULT, 3
	   call_if_eq _04AC
	   compare VAR_SPECIAL_RESULT, 4
	   call_if_eq _04C8
	   compare VAR_SPECIAL_RESULT, 5
	   call_if_ge _04EE
	   return

_048E:
	   play_se SEQ_SE_DP_CON_015
	   wait_se SEQ_SE_DP_CON_015
	   return

_0498:
	   play_se SEQ_SE_DP_CON_015
	   wait 5, VAR_SPECIAL_RESULT
	   play_se SEQ_SE_DP_CON_015
	   wait_se SEQ_SE_DP_CON_015
	   return

_04AC:
	   play_se SEQ_SE_DP_CON_015
	   wait_se SEQ_SE_DP_CON_015
	   play_se SEQ_SE_DP_CON_015
	   wait 5, VAR_SPECIAL_RESULT
	   play_se SEQ_SE_DP_CON_015
	   wait_se SEQ_SE_DP_CON_015
	   return

_04C8:
	   play_se SEQ_SE_DP_CON_015
	   wait 5, VAR_SPECIAL_RESULT
	   play_se SEQ_SE_DP_CON_015
	   wait_se SEQ_SE_DP_CON_015
	   play_se SEQ_SE_DP_CON_015
	   wait 5, VAR_SPECIAL_RESULT
	   play_se SEQ_SE_DP_CON_015
	   wait_se SEQ_SE_DP_CON_015
	   return

_04EE:
	   play_se SEQ_SE_DP_CON_015
	   wait 5, VAR_SPECIAL_RESULT
	   play_se SEQ_SE_DP_CON_015
	   wait 5, VAR_SPECIAL_RESULT
	   play_se SEQ_SE_DP_CON_015
	   wait 10, VAR_SPECIAL_RESULT
	   play_se SEQ_SE_DP_CON_015
	   wait 5, VAR_SPECIAL_RESULT
	   play_se SEQ_SE_DP_CON_015
	   wait_se SEQ_SE_DP_CON_015
	   return

	.balign 4, 0
_0520: ; unreferenced
	Delay4
	FaceEast
	Delay4
	FaceSouth
	Delay2
	FaceWest
	Delay1
	FaceNorth
	Delay1
	FaceEast
	Delay1
	FaceSouth
	EndMovement

	.balign 4, 0
_0554: ; unreferenced
	Delay8 2
	WalkOnSpotNormalWest
	Delay8
	WalkOnSpotNormalEast
	Delay8
	WalkOnSpotFastSouth
	EndMovement

	.balign 4, 0
_0570: ; unreferenced
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0578: ; unreferenced
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0580: ; unreferenced
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_0588: ; unreferenced
	WalkOnSpotNormalSouth
	EndMovement

scr_seq_0166_008:
scr_seq_0166_009:
scr_seq_0166_010:
scr_seq_0166_011:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x4003, 2
	setvar VAR_SPECIAL_x8004, 0
	npc_msg msg_0043_00111
	goto _05AF
	end
_05AF:
	npc_msg msg_0043_00112
	scrcmd_065 1, 1, 0, 1, VAR_SPECIAL_RESULT
	scrcmd_066 msg_0043_00113, 0
	scrcmd_066 msg_0043_00114, 1
	scrcmd_066 msg_0043_00115, 2
	scrcmd_067
	switch VAR_SPECIAL_RESULT
	case 0, _05FD
	case 1, _0872
	case 2, _0A97
	goto _0A97
	end
_05FD:
	scrcmd_065 1, 1, 0, 1, VAR_SPECIAL_RESULT
	scrcmd_066 msg_0043_00155, 0
	scrcmd_066 msg_0043_00156, 1
	scrcmd_066 msg_0043_00157, 2
	scrcmd_066 msg_0043_00158, 3
	scrcmd_067
	switch VAR_SPECIAL_RESULT
	case 0, _064C
	case 1, _0660
	case 2, _067A
	goto _068E
	end
_064C:
	setvar VAR_TEMP_x4004, 0
	setvar VAR_SPECIAL_x8007, 3
	goto _0743
	end
_0660:
	setvar VAR_TEMP_x4004, 1
	setvar VAR_SPECIAL_x8005, 0
	setvar VAR_SPECIAL_x8007, 5
	goto _0743
	end
_067A:
	setvar VAR_TEMP_x4004, 0
	setvar VAR_SPECIAL_x8007, 7
	goto _0743
	end
_068E:
	npc_msg msg_0043_00159
	wait_button_or_walk_away
	goto _0A9C
	end

_069B:
	npc_msg msg_0043_00168
	scrcmd_065 1, 1, 0, 1, VAR_SPECIAL_RESULT
	scrcmd_066 msg_0043_00169, 0
	scrcmd_066 msg_0043_00170, 1
	scrcmd_066 msg_0043_00171, 2
	scrcmd_066 msg_0043_00172, 3
	scrcmd_066 msg_0043_00173, 4
	scrcmd_067
	switch VAR_SPECIAL_RESULT
	case 0, _06FE
	case 1, _070C
	case 2, _071A
	case 3, _0728
	goto _0736
	end
_06FE:
	setvar VAR_SPECIAL_x8004, 0
	goto _0743
	end
_070C:
	setvar VAR_SPECIAL_x8004, 1
	goto _0743
	end
_071A:
	setvar VAR_SPECIAL_x8004, 2
	goto _0743
	end
_0728:
	setvar VAR_SPECIAL_x8004, 3
	goto _0743
	end
_0736:
	npc_msg msg_0043_00174
	wait_button_or_walk_away
	goto _0A9C
	end
_0743:
	compare VAR_TEMP_x4004, 1
	goto_if_eq _081D
	goto _0756

_0756:
	npc_msg msg_0043_00160
	scrcmd_065 1, 1, 0, 1, VAR_SPECIAL_RESULT
	scrcmd_066 msg_0043_00161, 0
	scrcmd_066 msg_0043_00162, 1
	scrcmd_066 msg_0043_00163, 2
	scrcmd_066 msg_0043_00164, 3
	scrcmd_066 msg_0043_00165, 4
	scrcmd_066 msg_0043_00166, 5
	scrcmd_067
	switch VAR_SPECIAL_RESULT
	case 0, _07CA
	case 1, _07D8
	case 2, _07E6
	case 3, _07F4
	case 4, _0802
	goto _0810
	end
_07CA:
	setvar VAR_SPECIAL_x8005, 0
	goto _081D
	end
_07D8:
	setvar VAR_SPECIAL_x8005, 1
	goto _081D
	end
_07E6:
	setvar VAR_SPECIAL_x8005, 2
	goto _081D
	end
_07F4:
	setvar VAR_SPECIAL_x8005, 3
	goto _081D
	end
_0802:
	setvar VAR_SPECIAL_x8005, 4
	goto _081D
	end
_0810:
	npc_msg msg_0043_00167
	wait_button_or_walk_away
	goto _0A9C
	end
_081D:
	npc_msg msg_0043_00175
	npc_msg msg_0043_00176
	closemsg
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	setvar VAR_SPECIAL_RESULT, 0
_0837:
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _084F
	get_move_selection 0, VAR_SPECIAL_RESULT
	goto _0837

_084F:
	restore_overworld
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	compare VAR_TEMP_x4002, 255
	goto_if_eq _0810
	goto _0339
	end
_0872:
	npc_msg msg_0043_00117
_0875:
	scrcmd_065 1, 1, 0, 1, VAR_SPECIAL_RESULT
	scrcmd_066 msg_0043_00121, 0
	scrcmd_066 msg_0043_00118, 1
	scrcmd_066 msg_0043_00119, 2
	scrcmd_066 msg_0043_00120, 3
	scrcmd_066 msg_0043_00122, 4
	scrcmd_067
	switch VAR_SPECIAL_RESULT
	case 0, _0A7E
	case 1, _08D8
	case 2, _0953
	case 3, _09EA
	goto _05AF
	end
_08D5:
	npc_msg msg_0043_00117
_08D8:
	scrcmd_065 1, 1, 0, 1, VAR_SPECIAL_RESULT
	scrcmd_066 msg_0043_00125, 0
	scrcmd_066 msg_0043_00126, 1
	scrcmd_066 msg_0043_00127, 2
	scrcmd_066 msg_0043_00129, 3
	scrcmd_067
	switch VAR_SPECIAL_RESULT
	case 0, _0927
	case 1, _0932
	case 2, _093D
	goto _0948
	end
_0927:
	npc_msg msg_0043_00130
	goto _08D5
	end
_0932:
	npc_msg msg_0043_00131
	goto _08D5
	end
_093D:
	npc_msg msg_0043_00132
	goto _08D5
	end
_0948:
	goto _0875
	end
_0950:
	npc_msg msg_0043_00117
_0953:
	scrcmd_065 1, 1, 0, 1, VAR_SPECIAL_RESULT
	scrcmd_066 msg_0043_00135, 0
	scrcmd_066 msg_0043_00136, 1
	scrcmd_066 msg_0043_00137, 2
	scrcmd_066 msg_0043_00138, 3
	scrcmd_066 msg_0043_00139, 4
	scrcmd_067
	switch VAR_SPECIAL_RESULT
	case 0, _09B3
	case 1, _09BE
	case 2, _09C9
	case 3, _09D4
	goto _09DF
	end
_09B3:
	npc_msg msg_0043_00140
	goto _0950
	end
_09BE:
	npc_msg msg_0043_00141
	goto _0950
	end
_09C9:
	npc_msg msg_0043_00142
	goto _0950
	end
_09D4:
	npc_msg msg_0043_00143
	goto _0950
	end
_09DF:
	goto _0875
	end
_09E7:
	npc_msg msg_0043_00117
_09EA:
	scrcmd_065 1, 1, 0, 1, VAR_SPECIAL_RESULT
	scrcmd_066 msg_0043_00145, 0
	scrcmd_066 msg_0043_00146, 1
	scrcmd_066 msg_0043_00147, 2
	scrcmd_066 msg_0043_00148, 3
	scrcmd_066 msg_0043_00149, 4
	scrcmd_067
	switch VAR_SPECIAL_RESULT
	case 0, _0A4A
	case 1, _0A55
	case 2, _0A60
	case 3, _0A6B
	goto _0A76
	end
_0A4A:
	npc_msg msg_0043_00150
	goto _09E7
	end
_0A55:
	npc_msg msg_0043_00151
	goto _09E7
	end
_0A60:
	npc_msg msg_0043_00152
	goto _09E7
	end
_0A6B:
	npc_msg msg_0043_00153
	goto _09E7
	end
_0A76:
	goto _0875
	end
_0A7E:
	npc_msg msg_0043_00124
	npc_msg msg_0043_00117
	goto _0875
	end
_0A8C: ; unreferenced
	npc_msg msg_0043_00123
	goto _0A9C
	end
_0A97:
	npc_msg msg_0043_00116
	wait_button_or_walk_away
_0A9C:
	closemsg
	releaseall
	end

scr_seq_0166_012:
	end
	.balign 4, 0
