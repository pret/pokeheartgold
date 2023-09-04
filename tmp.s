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

	; 0x0066
	.byte 0x1b, 0x00
scr_seq_0166_004:
	end

	; 0x006A
	.byte 0x77, 0x01, 0xff, 0x00, 0x1b, 0x00
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

	; 0x00A0
	.byte 0x02, 0x00
scr_seq_0166_007:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x4003, 1
	setvar VAR_SPECIAL_x8007, 2
	npc_msg msg_0043_00007
	goto _00C1

	; 0x00BF
	.byte 0x02
	.byte 0x00
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

	; 0x0116
	.byte 0x02, 0x00
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

	; 0x0135
	.byte 0x02, 0x00
_0137:
	compare VAR_TEMP_x4003, 1
	goto_if_eq _014C
	goto _0155

	; 0x014A
	.byte 0x02, 0x00
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

	; 0x01A5
	.byte 0x02, 0x00
_01A7:
	goto _01C8

	; 0x01AD
	.byte 0x02, 0x00
_01AF:
	npc_msg msg_0043_00018
	goto _0155

	; 0x01B8
	.byte 0x02, 0x00
_01BA:
	npc_msg msg_0043_00019
	goto _0155

	; 0x01C3
	.byte 0x02, 0x00
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

	; 0x0226
	.byte 0x02, 0x00
_0228:
	npc_msg msg_0043_00014
	goto _01C5

	; 0x0231
	.byte 0x02, 0x00
_0233:
	npc_msg msg_0043_00015
	goto _01C5

	; 0x023C
	.byte 0x02, 0x00
_023E:
	npc_msg msg_0043_00016
	goto _01C5

	; 0x0247
	.byte 0x02, 0x00
_0249:
	npc_msg msg_0043_00017
	goto _01C5

	; 0x0252
	.byte 0x02, 0x00
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

	; 0x0293
	.byte 0x02, 0x00
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

	; 0x02D5
	.byte 0x02, 0x00
_02D7:
	goto _0254

	; 0x02DD
	.byte 0x02, 0x00
_02DF:
	goto _0254

	; 0x02E5
	.byte 0x02, 0x00
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

	; 0x0327
	.byte 0x02, 0x00
_0329:
	goto _0254

	; 0x032F
	.byte 0x02
	.byte 0x00
_0331:
	scrcmd_283
	closemsg
	releaseall
	end

_0339:
	scrcmd_234 VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x8007, VAR_TEMP_x4002
	scrcmd_232 25
	scrcmd_233 25
	compare VAR_TEMP_x4003, 0
	goto_if_eq _038D
	compare VAR_TEMP_x4003, 1
	goto_if_eq _0395
	compare VAR_TEMP_x4003, 2
	goto_if_eq _03A7
	end

	; 0x0374
	.byte 0xec, 0x00, 0x0c, 0x80, 0x27, 0x00, 0x0c, 0x80, 0x01, 0x00, 0x2d, 0x00
	.byte 0xb1, 0xec, 0x00, 0x0c, 0x80, 0x35, 0x00, 0x16, 0x00, 0xbe, 0xff, 0xff, 0xff
_038D:
	goto _03B4

	; 0x0393
	.byte 0x02, 0x00
_0395:
	setflag FLAG_UNK_966
	setvar VAR_UNK_4133, 5
	goto _03B4

	; 0x03A5
	.byte 0x02, 0x00
_03A7:
	scrcmd_048 msg_0043_00211
	closemsg
	goto _03B4

	; 0x03B2
	.byte 0x02, 0x00
_03B4:
	get_player_gender VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _03CD
	goto _03DB

	; 0x03CB
	.byte 0x02, 0x00
_03CD:
	buffer_players_name 0
	scrcmd_048 msg_0043_00066
	goto _03E9

	; 0x03D9
	.byte 0x02, 0x00
_03DB:
	buffer_players_name 0
	scrcmd_048 msg_0043_00067
	goto _03E9

	; 0x03E7
	.byte 0x02, 0x00
_03E9:
	scrcmd_048 msg_0043_00068
	scrcmd_232 26
	scrcmd_233 26
	closemsg
	goto _03FE

	; 0x03FC
	.byte 0x02, 0x00
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

_0447:
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

	; 0x0520
	.byte 0x3e, 0x00, 0x01, 0x00, 0x03, 0x00, 0x01, 0x00, 0x3e, 0x00, 0x01, 0x00, 0x01, 0x00, 0x01, 0x00
	.byte 0x3d, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00, 0x3c, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00
	.byte 0x3c, 0x00, 0x01, 0x00, 0x03, 0x00, 0x01, 0x00, 0x3c, 0x00, 0x01, 0x00, 0x01, 0x00, 0x01, 0x00
	.byte 0xfe, 0x00, 0x00, 0x00, 0x3f, 0x00, 0x02, 0x00, 0x22, 0x00, 0x01, 0x00, 0x3f, 0x00, 0x01, 0x00
	.byte 0x23, 0x00, 0x01, 0x00, 0x3f, 0x00, 0x01, 0x00, 0x25, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00
	.byte 0x22, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00, 0x20, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00
	.byte 0x23, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00, 0x21, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00
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

	; 0x05AD
	.byte 0x02, 0x00
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

	; 0x05FB
	.byte 0x02, 0x00
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

	; 0x064A
	.byte 0x02, 0x00
_064C:
	setvar VAR_TEMP_x4004, 0
	setvar VAR_SPECIAL_x8007, 3
	goto _0743

	; 0x065E
	.byte 0x02, 0x00
_0660:
	setvar VAR_TEMP_x4004, 1
	setvar VAR_SPECIAL_x8005, 0
	setvar VAR_SPECIAL_x8007, 5
	goto _0743

	; 0x0678
	.byte 0x02, 0x00
_067A:
	setvar VAR_TEMP_x4004, 0
	setvar VAR_SPECIAL_x8007, 7
	goto _0743

	; 0x068C
	.byte 0x02, 0x00
_068E:
	npc_msg msg_0043_00159
	wait_button_or_walk_away
	goto _0A9C

	; 0x0699
	.byte 0x02, 0x00
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

	; 0x06FC
	.byte 0x02, 0x00
_06FE:
	setvar VAR_SPECIAL_x8004, 0
	goto _0743

	; 0x070A
	.byte 0x02, 0x00
_070C:
	setvar VAR_SPECIAL_x8004, 1
	goto _0743

	; 0x0718
	.byte 0x02, 0x00
_071A:
	setvar VAR_SPECIAL_x8004, 2
	goto _0743

	; 0x0726
	.byte 0x02, 0x00
_0728:
	setvar VAR_SPECIAL_x8004, 3
	goto _0743

	; 0x0734
	.byte 0x02, 0x00
_0736:
	npc_msg msg_0043_00174
	wait_button_or_walk_away
	goto _0A9C

	; 0x0741
	.byte 0x02, 0x00
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

	; 0x07C8
	.byte 0x02, 0x00
_07CA:
	setvar VAR_SPECIAL_x8005, 0
	goto _081D

	; 0x07D6
	.byte 0x02, 0x00
_07D8:
	setvar VAR_SPECIAL_x8005, 1
	goto _081D

	; 0x07E4
	.byte 0x02, 0x00
_07E6:
	setvar VAR_SPECIAL_x8005, 2
	goto _081D

	; 0x07F2
	.byte 0x02, 0x00
_07F4:
	setvar VAR_SPECIAL_x8005, 3
	goto _081D

	; 0x0800
	.byte 0x02, 0x00
_0802:
	setvar VAR_SPECIAL_x8005, 4
	goto _081D

	; 0x080E
	.byte 0x02, 0x00
_0810:
	npc_msg msg_0043_00167
	wait_button_or_walk_away
	goto _0A9C

	; 0x081B
	.byte 0x02, 0x00
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
	scrcmd_150
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	compare VAR_TEMP_x4002, 255
	goto_if_eq _0810
	goto _0339

	; 0x0870
	.byte 0x02, 0x00
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

	; 0x08D3
	.byte 0x02, 0x00
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

	; 0x0925
	.byte 0x02, 0x00
_0927:
	npc_msg msg_0043_00130
	goto _08D5

	; 0x0930
	.byte 0x02, 0x00
_0932:
	npc_msg msg_0043_00131
	goto _08D5

	; 0x093B
	.byte 0x02, 0x00
_093D:
	npc_msg msg_0043_00132
	goto _08D5

	; 0x0946
	.byte 0x02, 0x00
_0948:
	goto _0875

	; 0x094E
	.byte 0x02, 0x00
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

	; 0x09B1
	.byte 0x02, 0x00
_09B3:
	npc_msg msg_0043_00140
	goto _0950

	; 0x09BC
	.byte 0x02, 0x00
_09BE:
	npc_msg msg_0043_00141
	goto _0950

	; 0x09C7
	.byte 0x02, 0x00
_09C9:
	npc_msg msg_0043_00142
	goto _0950

	; 0x09D2
	.byte 0x02, 0x00
_09D4:
	npc_msg msg_0043_00143
	goto _0950

	; 0x09DD
	.byte 0x02, 0x00
_09DF:
	goto _0875

	; 0x09E5
	.byte 0x02, 0x00
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

	; 0x0A48
	.byte 0x02, 0x00
_0A4A:
	npc_msg msg_0043_00150
	goto _09E7

	; 0x0A53
	.byte 0x02, 0x00
_0A55:
	npc_msg msg_0043_00151
	goto _09E7

	; 0x0A5E
	.byte 0x02, 0x00
_0A60:
	npc_msg msg_0043_00152
	goto _09E7

	; 0x0A69
	.byte 0x02, 0x00
_0A6B:
	npc_msg msg_0043_00153
	goto _09E7

	; 0x0A74
	.byte 0x02, 0x00
_0A76:
	goto _0875

	; 0x0A7C
	.byte 0x02, 0x00
_0A7E:
	npc_msg msg_0043_00124
	npc_msg msg_0043_00117
	goto _0875

	; 0x0A8A
	.byte 0x02, 0x00
_0A8C:
	npc_msg msg_0043_00123
	goto _0A9C

	; 0x0A95
	.byte 0x02, 0x00
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

