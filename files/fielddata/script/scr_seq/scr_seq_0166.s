#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0166_0036 ; 000
	scrdef scr_seq_0166_004E ; 001
	scrdef scr_seq_0166_0050 ; 002
	scrdef scr_seq_0166_0054 ; 003
	scrdef scr_seq_0166_0068 ; 004
	scrdef scr_seq_0166_0070 ; 005
	scrdef scr_seq_0166_0083 ; 006
	scrdef scr_seq_0166_00A2 ; 007
	scrdef scr_seq_0166_0590 ; 008
	scrdef scr_seq_0166_0590 ; 009
	scrdef scr_seq_0166_0590 ; 010
	scrdef scr_seq_0166_0590 ; 011
	scrdef scr_seq_0166_0AA2 ; 012
	scrdef_end

scr_seq_0166_0036:
	scrcmd_609
	lockall
	setvar VAR_SPECIAL_x800C, 7
	clearflag FLAG_UNK_966
	setvar VAR_UNK_4133, 0
	releaseall
	end

scr_seq_0166_004E:
	end

scr_seq_0166_0050:
	end

scr_seq_0166_0052:
	return

scr_seq_0166_0054:
	scrcmd_521
	call scr_seq_0166_0064
	call scr_seq_0166_0052
	end

scr_seq_0166_0064:
	return

scr_seq_0166_0066:
	.byte 0x1b, 0x00
scr_seq_0166_0068:
	end

scr_seq_0166_006A:
	.byte 0x77, 0x01, 0xff, 0x00, 0x1b, 0x00
scr_seq_0166_0070:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0166_0083:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x4003, 0
	setvar VAR_SPECIAL_x8007, 2
	npc_msg 3
	goto scr_seq_0166_00C1

scr_seq_0166_00A0:
	.byte 0x02, 0x00
scr_seq_0166_00A2:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x4003, 1
	setvar VAR_SPECIAL_x8007, 2
	npc_msg 7
	goto scr_seq_0166_00C1

scr_seq_0166_00BF:
	.byte 0x02
	.byte 0x00
scr_seq_0166_00C1:
	comparevartovalue VAR_TEMP_x4003, 1
	gotoif eq, scr_seq_0166_00D7
	npc_msg 4
	goto scr_seq_0166_00DA

scr_seq_0166_00D7:
	npc_msg 12
scr_seq_0166_00DA:
	scrcmd_065 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_066 8, 0
	scrcmd_066 9, 1
	scrcmd_066 10, 2
	scrcmd_067
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0166_012F
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0166_0137
	goto scr_seq_0166_0118

scr_seq_0166_0116:
	.byte 0x02, 0x00
scr_seq_0166_0118:
	scrcmd_283
	setvar VAR_UNK_4133, 0
	clearflag FLAG_UNK_966
	npc_msg 11
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0166_012F:
	goto scr_seq_0166_0254

scr_seq_0166_0135:
	.byte 0x02, 0x00
scr_seq_0166_0137:
	comparevartovalue VAR_TEMP_x4003, 1
	gotoif eq, scr_seq_0166_014C
	goto scr_seq_0166_0155

scr_seq_0166_014A:
	.byte 0x02, 0x00
scr_seq_0166_014C:
	npc_msg 13
	goto scr_seq_0166_00C1

scr_seq_0166_0155:
	npc_msg 5
scr_seq_0166_0158:
	scrcmd_064 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_066 96, 0
	scrcmd_066 97, 1
	scrcmd_066 98, 2
	scrcmd_066 99, 3
	scrcmd_067
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0166_01A7
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0166_01AF
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0166_01BA
	goto scr_seq_0166_00C1

scr_seq_0166_01A5:
	.byte 0x02, 0x00
scr_seq_0166_01A7:
	goto scr_seq_0166_01C8

scr_seq_0166_01AD:
	.byte 0x02, 0x00
scr_seq_0166_01AF:
	npc_msg 18
	goto scr_seq_0166_0155

scr_seq_0166_01B8:
	.byte 0x02, 0x00
scr_seq_0166_01BA:
	npc_msg 19
	goto scr_seq_0166_0155

scr_seq_0166_01C3:
	.byte 0x02, 0x00
scr_seq_0166_01C5:
	npc_msg 117
scr_seq_0166_01C8:
	scrcmd_065 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_066 36, 0
	scrcmd_066 37, 1
	scrcmd_066 38, 2
	scrcmd_066 39, 3
	scrcmd_066 40, 4
	scrcmd_067
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0166_0228
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0166_0233
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0166_023E
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0166_0249
	goto scr_seq_0166_0158

scr_seq_0166_0226:
	.byte 0x02, 0x00
scr_seq_0166_0228:
	npc_msg 14
	goto scr_seq_0166_01C5

scr_seq_0166_0231:
	.byte 0x02, 0x00
scr_seq_0166_0233:
	npc_msg 15
	goto scr_seq_0166_01C5

scr_seq_0166_023C:
	.byte 0x02, 0x00
scr_seq_0166_023E:
	npc_msg 16
	goto scr_seq_0166_01C5

scr_seq_0166_0247:
	.byte 0x02, 0x00
scr_seq_0166_0249:
	npc_msg 17
	goto scr_seq_0166_01C5

scr_seq_0166_0252:
	.byte 0x02, 0x00
scr_seq_0166_0254:
	npc_msg 219
	scrcmd_064 18, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_066 14, 0
	scrcmd_066 15, 1
	scrcmd_066 5, 2
	scrcmd_067
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0166_0295
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0166_02E7
	goto scr_seq_0166_0118

scr_seq_0166_0293:
	.byte 0x02, 0x00
scr_seq_0166_0295:
	npc_msg 212
	scrcmd_063 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0166_0254
	closemsg
	scrcmd_226 8, 32773, 32772, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0166_02D7
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, scr_seq_0166_02DF
	goto scr_seq_0166_0339

scr_seq_0166_02D5:
	.byte 0x02, 0x00
scr_seq_0166_02D7:
	goto scr_seq_0166_0254

scr_seq_0166_02DD:
	.byte 0x02, 0x00
scr_seq_0166_02DF:
	goto scr_seq_0166_0254

scr_seq_0166_02E5:
	.byte 0x02, 0x00
scr_seq_0166_02E7:
	npc_msg 212
	scrcmd_063 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0166_0254
	closemsg
	scrcmd_227 8, 32773, 32772, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0166_0329
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, scr_seq_0166_0331
	goto scr_seq_0166_0339

scr_seq_0166_0327:
	.byte 0x02, 0x00
scr_seq_0166_0329:
	goto scr_seq_0166_0254

scr_seq_0166_032F:
	.byte 0x02
	.byte 0x00
scr_seq_0166_0331:
	scrcmd_283
	closemsg
	releaseall
	end

scr_seq_0166_0339:
	scrcmd_234 32772, 32773, 32775, 16386
	scrcmd_232 25
	scrcmd_233 25
	comparevartovalue VAR_TEMP_x4003, 0
	gotoif eq, scr_seq_0166_038D
	comparevartovalue VAR_TEMP_x4003, 1
	gotoif eq, scr_seq_0166_0395
	comparevartovalue VAR_TEMP_x4003, 2
	gotoif eq, scr_seq_0166_03A7
	end

scr_seq_0166_0374:
	.byte 0xec, 0x00, 0x0c, 0x80, 0x27, 0x00, 0x0c, 0x80, 0x01, 0x00, 0x2d, 0x00
	.byte 0xb1, 0xec, 0x00, 0x0c, 0x80, 0x35, 0x00, 0x16, 0x00, 0xbe, 0xff, 0xff, 0xff
scr_seq_0166_038D:
	goto scr_seq_0166_03B4

scr_seq_0166_0393:
	.byte 0x02, 0x00
scr_seq_0166_0395:
	setflag FLAG_UNK_966
	setvar VAR_UNK_4133, 5
	goto scr_seq_0166_03B4

scr_seq_0166_03A5:
	.byte 0x02, 0x00
scr_seq_0166_03A7:
	scrcmd_048 211
	closemsg
	goto scr_seq_0166_03B4

scr_seq_0166_03B2:
	.byte 0x02, 0x00
scr_seq_0166_03B4:
	get_player_gender VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0166_03CD
	goto scr_seq_0166_03DB

scr_seq_0166_03CB:
	.byte 0x02, 0x00
scr_seq_0166_03CD:
	buffer_players_name 0
	scrcmd_048 66
	goto scr_seq_0166_03E9

scr_seq_0166_03D9:
	.byte 0x02, 0x00
scr_seq_0166_03DB:
	buffer_players_name 0
	scrcmd_048 67
	goto scr_seq_0166_03E9

scr_seq_0166_03E7:
	.byte 0x02, 0x00
scr_seq_0166_03E9:
	scrcmd_048 68
	scrcmd_232 26
	scrcmd_233 26
	closemsg
	goto scr_seq_0166_03FE

scr_seq_0166_03FC:
	.byte 0x02, 0x00
scr_seq_0166_03FE:
	scrcmd_232 4
	scrcmd_233 4
	scrcmd_257 239
	scrcmd_611 1, 0, 32768, 32780, 32769, 32770, 32771
	scrcmd_237
	scrcmd_048 78
	closemsg
	scrcmd_232 24
	scrcmd_233 24
	scrcmd_587
	wait 10, VAR_SPECIAL_x800C
	scrcmd_235 16386
	clearflag FLAG_UNK_966
	setvar VAR_UNK_4133, 0
	goto scr_seq_0166_0443

scr_seq_0166_0443:
	releaseall
	end

scr_seq_0166_0447:
	.byte 0x49, 0x00, 0x44, 0x06, 0x11, 0x00, 0x0c, 0x80, 0x01
	.byte 0x00, 0x1d, 0x00, 0x01, 0x36, 0x00, 0x00, 0x00, 0x11, 0x00, 0x0c, 0x80, 0x02, 0x00, 0x1d, 0x00
	.byte 0x01, 0x33, 0x00, 0x00, 0x00, 0x11, 0x00, 0x0c, 0x80, 0x03, 0x00, 0x1d, 0x00, 0x01, 0x3a, 0x00
	.byte 0x00, 0x00, 0x11, 0x00, 0x0c, 0x80, 0x04, 0x00, 0x1d, 0x00, 0x01, 0x49, 0x00, 0x00, 0x00, 0x11
	.byte 0x00, 0x0c, 0x80, 0x05, 0x00, 0x1d, 0x00, 0x04, 0x62, 0x00, 0x00, 0x00, 0x1b, 0x00, 0x49, 0x00
	.byte 0x45, 0x06, 0x4b, 0x00, 0x45, 0x06, 0x1b, 0x00, 0x49, 0x00, 0x45, 0x06, 0x03, 0x00, 0x05, 0x00
	.byte 0x0c, 0x80, 0x49, 0x00, 0x45, 0x06, 0x4b, 0x00, 0x45, 0x06, 0x1b, 0x00, 0x49, 0x00, 0x45, 0x06
	.byte 0x4b, 0x00, 0x45, 0x06, 0x49, 0x00, 0x45, 0x06, 0x03, 0x00, 0x05, 0x00, 0x0c, 0x80, 0x49, 0x00
	.byte 0x45, 0x06, 0x4b, 0x00, 0x45, 0x06, 0x1b, 0x00, 0x49, 0x00, 0x45, 0x06, 0x03, 0x00, 0x05, 0x00
	.byte 0x0c, 0x80, 0x49, 0x00, 0x45, 0x06, 0x4b, 0x00, 0x45, 0x06, 0x49, 0x00, 0x45, 0x06, 0x03, 0x00
	.byte 0x05, 0x00, 0x0c, 0x80, 0x49, 0x00, 0x45, 0x06, 0x4b, 0x00, 0x45, 0x06, 0x1b, 0x00, 0x49, 0x00
	.byte 0x45, 0x06, 0x03, 0x00, 0x05, 0x00, 0x0c, 0x80, 0x49, 0x00, 0x45, 0x06, 0x03, 0x00, 0x05, 0x00
	.byte 0x0c, 0x80, 0x49, 0x00, 0x45, 0x06, 0x03, 0x00, 0x0a, 0x00, 0x0c, 0x80, 0x49, 0x00, 0x45, 0x06
	.byte 0x03, 0x00, 0x05, 0x00, 0x0c, 0x80, 0x49, 0x00, 0x45, 0x06, 0x4b, 0x00, 0x45, 0x06, 0x1b, 0x00
	.byte 0x3e, 0x00, 0x01, 0x00, 0x03, 0x00, 0x01, 0x00, 0x3e, 0x00, 0x01, 0x00, 0x01, 0x00, 0x01, 0x00
	.byte 0x3d, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00, 0x3c, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00
	.byte 0x3c, 0x00, 0x01, 0x00, 0x03, 0x00, 0x01, 0x00, 0x3c, 0x00, 0x01, 0x00, 0x01, 0x00, 0x01, 0x00
	.byte 0xfe, 0x00, 0x00, 0x00, 0x3f, 0x00, 0x02, 0x00, 0x22, 0x00, 0x01, 0x00, 0x3f, 0x00, 0x01, 0x00
	.byte 0x23, 0x00, 0x01, 0x00, 0x3f, 0x00, 0x01, 0x00, 0x25, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00
	.byte 0x22, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00, 0x20, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00
	.byte 0x23, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00, 0x21, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00
scr_seq_0166_0590:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x4003, 2
	setvar VAR_SPECIAL_x8004, 0
	npc_msg 111
	goto scr_seq_0166_05AF

scr_seq_0166_05AD:
	.byte 0x02, 0x00
scr_seq_0166_05AF:
	npc_msg 112
	scrcmd_065 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_066 113, 0
	scrcmd_066 114, 1
	scrcmd_066 115, 2
	scrcmd_067
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0166_05FD
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0166_0872
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0166_0A97
	goto scr_seq_0166_0A97

scr_seq_0166_05FB:
	.byte 0x02, 0x00
scr_seq_0166_05FD:
	scrcmd_065 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_066 155, 0
	scrcmd_066 156, 1
	scrcmd_066 157, 2
	scrcmd_066 158, 3
	scrcmd_067
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0166_064C
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0166_0660
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0166_067A
	goto scr_seq_0166_068E

scr_seq_0166_064A:
	.byte 0x02, 0x00
scr_seq_0166_064C:
	setvar VAR_TEMP_x4004, 0
	setvar VAR_SPECIAL_x8007, 3
	goto scr_seq_0166_0743

scr_seq_0166_065E:
	.byte 0x02, 0x00
scr_seq_0166_0660:
	setvar VAR_TEMP_x4004, 1
	setvar VAR_SPECIAL_x8005, 0
	setvar VAR_SPECIAL_x8007, 5
	goto scr_seq_0166_0743

scr_seq_0166_0678:
	.byte 0x02, 0x00
scr_seq_0166_067A:
	setvar VAR_TEMP_x4004, 0
	setvar VAR_SPECIAL_x8007, 7
	goto scr_seq_0166_0743

scr_seq_0166_068C:
	.byte 0x02, 0x00
scr_seq_0166_068E:
	npc_msg 159
	waitbutton
	goto scr_seq_0166_0A9C

scr_seq_0166_0699:
	.byte 0x02, 0x00, 0x2d, 0x00, 0xa8, 0x41, 0x00
	.byte 0x01, 0x01, 0x00, 0x01, 0x0c, 0x80, 0x42, 0x00, 0xa9, 0x00, 0x42, 0x00, 0xaa, 0x01, 0x42, 0x00
	.byte 0xab, 0x02, 0x42, 0x00, 0xac, 0x03, 0x42, 0x00, 0xad, 0x04, 0x43, 0x00, 0x2a, 0x00, 0x08, 0x80
	.byte 0x0c, 0x80, 0x11, 0x00, 0x08, 0x80, 0x00, 0x00, 0x1c, 0x00, 0x01, 0x2f, 0x00, 0x00, 0x00, 0x11
	.byte 0x00, 0x08, 0x80, 0x01, 0x00, 0x1c, 0x00, 0x01, 0x30, 0x00, 0x00, 0x00, 0x11, 0x00, 0x08, 0x80
	.byte 0x02, 0x00, 0x1c, 0x00, 0x01, 0x31, 0x00, 0x00, 0x00, 0x11, 0x00, 0x08, 0x80, 0x03, 0x00, 0x1c
	.byte 0x00, 0x01, 0x32, 0x00, 0x00, 0x00, 0x16, 0x00, 0x3a, 0x00, 0x00, 0x00, 0x02, 0x00, 0x29, 0x00
	.byte 0x04, 0x80, 0x00, 0x00, 0x16, 0x00, 0x39, 0x00, 0x00, 0x00, 0x02, 0x00, 0x29, 0x00, 0x04, 0x80
	.byte 0x01, 0x00, 0x16, 0x00, 0x2b, 0x00, 0x00, 0x00, 0x02, 0x00, 0x29, 0x00, 0x04, 0x80, 0x02, 0x00
	.byte 0x16, 0x00, 0x1d, 0x00, 0x00, 0x00, 0x02, 0x00, 0x29, 0x00, 0x04, 0x80, 0x03, 0x00, 0x16, 0x00
	.byte 0x0f, 0x00, 0x00, 0x00, 0x02, 0x00, 0x2d, 0x00, 0xae, 0x32, 0x00, 0x16, 0x00, 0x5b, 0x03, 0x00
	.byte 0x00, 0x02, 0x00
scr_seq_0166_0743:
	comparevartovalue VAR_TEMP_x4004, 1
	gotoif eq, scr_seq_0166_081D
	goto scr_seq_0166_0756

scr_seq_0166_0756:
	npc_msg 160
	scrcmd_065 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_066 161, 0
	scrcmd_066 162, 1
	scrcmd_066 163, 2
	scrcmd_066 164, 3
	scrcmd_066 165, 4
	scrcmd_066 166, 5
	scrcmd_067
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0166_07CA
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0166_07D8
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0166_07E6
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0166_07F4
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_0166_0802
	goto scr_seq_0166_0810

scr_seq_0166_07C8:
	.byte 0x02, 0x00
scr_seq_0166_07CA:
	setvar VAR_SPECIAL_x8005, 0
	goto scr_seq_0166_081D

scr_seq_0166_07D6:
	.byte 0x02, 0x00
scr_seq_0166_07D8:
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0166_081D

scr_seq_0166_07E4:
	.byte 0x02, 0x00
scr_seq_0166_07E6:
	setvar VAR_SPECIAL_x8005, 2
	goto scr_seq_0166_081D

scr_seq_0166_07F2:
	.byte 0x02, 0x00
scr_seq_0166_07F4:
	setvar VAR_SPECIAL_x8005, 3
	goto scr_seq_0166_081D

scr_seq_0166_0800:
	.byte 0x02, 0x00
scr_seq_0166_0802:
	setvar VAR_SPECIAL_x8005, 4
	goto scr_seq_0166_081D

scr_seq_0166_080E:
	.byte 0x02, 0x00
scr_seq_0166_0810:
	npc_msg 167
	waitbutton
	goto scr_seq_0166_0A9C

scr_seq_0166_081B:
	.byte 0x02, 0x00
scr_seq_0166_081D:
	npc_msg 175
	npc_msg 176
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	setvar VAR_SPECIAL_x800C, 0
scr_seq_0166_0837:
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0166_084F
	scrcmd_353 0, 32780
	goto scr_seq_0166_0837

scr_seq_0166_084F:
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	comparevartovalue VAR_TEMP_x4002, 255
	gotoif eq, scr_seq_0166_0810
	goto scr_seq_0166_0339

scr_seq_0166_0870:
	.byte 0x02, 0x00
scr_seq_0166_0872:
	npc_msg 117
scr_seq_0166_0875:
	scrcmd_065 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_066 121, 0
	scrcmd_066 118, 1
	scrcmd_066 119, 2
	scrcmd_066 120, 3
	scrcmd_066 122, 4
	scrcmd_067
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0166_0A7E
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0166_08D8
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0166_0953
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0166_09EA
	goto scr_seq_0166_05AF

scr_seq_0166_08D3:
	.byte 0x02, 0x00
scr_seq_0166_08D5:
	npc_msg 117
scr_seq_0166_08D8:
	scrcmd_065 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_066 125, 0
	scrcmd_066 126, 1
	scrcmd_066 127, 2
	scrcmd_066 129, 3
	scrcmd_067
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0166_0927
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0166_0932
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0166_093D
	goto scr_seq_0166_0948

scr_seq_0166_0925:
	.byte 0x02, 0x00
scr_seq_0166_0927:
	npc_msg 130
	goto scr_seq_0166_08D5

scr_seq_0166_0930:
	.byte 0x02, 0x00
scr_seq_0166_0932:
	npc_msg 131
	goto scr_seq_0166_08D5

scr_seq_0166_093B:
	.byte 0x02, 0x00
scr_seq_0166_093D:
	npc_msg 132
	goto scr_seq_0166_08D5

scr_seq_0166_0946:
	.byte 0x02, 0x00
scr_seq_0166_0948:
	goto scr_seq_0166_0875

scr_seq_0166_094E:
	.byte 0x02, 0x00
scr_seq_0166_0950:
	npc_msg 117
scr_seq_0166_0953:
	scrcmd_065 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_066 135, 0
	scrcmd_066 136, 1
	scrcmd_066 137, 2
	scrcmd_066 138, 3
	scrcmd_066 139, 4
	scrcmd_067
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0166_09B3
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0166_09BE
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0166_09C9
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0166_09D4
	goto scr_seq_0166_09DF

scr_seq_0166_09B1:
	.byte 0x02, 0x00
scr_seq_0166_09B3:
	npc_msg 140
	goto scr_seq_0166_0950

scr_seq_0166_09BC:
	.byte 0x02, 0x00
scr_seq_0166_09BE:
	npc_msg 141
	goto scr_seq_0166_0950

scr_seq_0166_09C7:
	.byte 0x02, 0x00
scr_seq_0166_09C9:
	npc_msg 142
	goto scr_seq_0166_0950

scr_seq_0166_09D2:
	.byte 0x02, 0x00
scr_seq_0166_09D4:
	npc_msg 143
	goto scr_seq_0166_0950

scr_seq_0166_09DD:
	.byte 0x02, 0x00
scr_seq_0166_09DF:
	goto scr_seq_0166_0875

scr_seq_0166_09E5:
	.byte 0x02, 0x00
scr_seq_0166_09E7:
	npc_msg 117
scr_seq_0166_09EA:
	scrcmd_065 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_066 145, 0
	scrcmd_066 146, 1
	scrcmd_066 147, 2
	scrcmd_066 148, 3
	scrcmd_066 149, 4
	scrcmd_067
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0166_0A4A
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0166_0A55
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0166_0A60
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0166_0A6B
	goto scr_seq_0166_0A76

scr_seq_0166_0A48:
	.byte 0x02, 0x00
scr_seq_0166_0A4A:
	npc_msg 150
	goto scr_seq_0166_09E7

scr_seq_0166_0A53:
	.byte 0x02, 0x00
scr_seq_0166_0A55:
	npc_msg 151
	goto scr_seq_0166_09E7

scr_seq_0166_0A5E:
	.byte 0x02, 0x00
scr_seq_0166_0A60:
	npc_msg 152
	goto scr_seq_0166_09E7

scr_seq_0166_0A69:
	.byte 0x02, 0x00
scr_seq_0166_0A6B:
	npc_msg 153
	goto scr_seq_0166_09E7

scr_seq_0166_0A74:
	.byte 0x02, 0x00
scr_seq_0166_0A76:
	goto scr_seq_0166_0875

scr_seq_0166_0A7C:
	.byte 0x02, 0x00
scr_seq_0166_0A7E:
	npc_msg 124
	npc_msg 117
	goto scr_seq_0166_0875

scr_seq_0166_0A8A:
	.byte 0x02, 0x00, 0x2d, 0x00, 0x7b, 0x16
	.byte 0x00, 0x07, 0x00, 0x00, 0x00, 0x02, 0x00
scr_seq_0166_0A97:
	npc_msg 116
	waitbutton
scr_seq_0166_0A9C:
	closemsg
	releaseall
	end

scr_seq_0166_0AA2:
	end
	.balign 4, 0
