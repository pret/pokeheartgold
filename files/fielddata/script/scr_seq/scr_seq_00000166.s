#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000166_00000036 ; 000
	scrdef scr_seq_00000166_0000004E ; 001
	scrdef scr_seq_00000166_00000050 ; 002
	scrdef scr_seq_00000166_00000054 ; 003
	scrdef scr_seq_00000166_00000068 ; 004
	scrdef scr_seq_00000166_00000070 ; 005
	scrdef scr_seq_00000166_00000083 ; 006
	scrdef scr_seq_00000166_000000A2 ; 007
	scrdef scr_seq_00000166_00000590 ; 008
	scrdef scr_seq_00000166_00000590 ; 009
	scrdef scr_seq_00000166_00000590 ; 010
	scrdef scr_seq_00000166_00000590 ; 011
	scrdef scr_seq_00000166_00000AA2 ; 012
	scrdef_end

scr_seq_00000166_00000036:
	scrcmd_609
	lockall
	setvar VAR_SPECIAL_x800C, 7
	clearflag FLAG_UNK_966
	setvar VAR_UNK_4133, 0
	releaseall
	end

scr_seq_00000166_0000004E:
	end

scr_seq_00000166_00000050:
	end

scr_seq_00000166_00000052:
	return

scr_seq_00000166_00000054:
	scrcmd_521
	call scr_seq_00000166_00000064
	call scr_seq_00000166_00000052
	end

scr_seq_00000166_00000064:
	return

scr_seq_00000166_00000066:
	.byte 0x1b, 0x00
scr_seq_00000166_00000068:
	end

scr_seq_00000166_0000006A:
	.byte 0x77, 0x01, 0xff, 0x00, 0x1b, 0x00
scr_seq_00000166_00000070:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000166_00000083:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x4003, 0
	setvar VAR_SPECIAL_x8007, 2
	msgbox 3
	goto scr_seq_00000166_000000C1

scr_seq_00000166_000000A0:
	.byte 0x02, 0x00
scr_seq_00000166_000000A2:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x4003, 1
	setvar VAR_SPECIAL_x8007, 2
	msgbox 7
	goto scr_seq_00000166_000000C1

scr_seq_00000166_000000BF:
	.byte 0x02
	.byte 0x00
scr_seq_00000166_000000C1:
	comparevartovalue VAR_TEMP_x4003, 1
	gotoif eq, scr_seq_00000166_000000D7
	msgbox 4
	goto scr_seq_00000166_000000DA

scr_seq_00000166_000000D7:
	msgbox 12
scr_seq_00000166_000000DA:
	scrcmd_065 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_066 8, 0
	scrcmd_066 9, 1
	scrcmd_066 10, 2
	scrcmd_067
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000166_0000012F
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000166_00000137
	goto scr_seq_00000166_00000118

scr_seq_00000166_00000116:
	.byte 0x02, 0x00
scr_seq_00000166_00000118:
	scrcmd_283
	setvar VAR_UNK_4133, 0
	clearflag FLAG_UNK_966
	msgbox 11
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000166_0000012F:
	goto scr_seq_00000166_00000254

scr_seq_00000166_00000135:
	.byte 0x02, 0x00
scr_seq_00000166_00000137:
	comparevartovalue VAR_TEMP_x4003, 1
	gotoif eq, scr_seq_00000166_0000014C
	goto scr_seq_00000166_00000155

scr_seq_00000166_0000014A:
	.byte 0x02, 0x00
scr_seq_00000166_0000014C:
	msgbox 13
	goto scr_seq_00000166_000000C1

scr_seq_00000166_00000155:
	msgbox 5
scr_seq_00000166_00000158:
	scrcmd_064 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_066 96, 0
	scrcmd_066 97, 1
	scrcmd_066 98, 2
	scrcmd_066 99, 3
	scrcmd_067
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000166_000001A7
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000166_000001AF
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000166_000001BA
	goto scr_seq_00000166_000000C1

scr_seq_00000166_000001A5:
	.byte 0x02, 0x00
scr_seq_00000166_000001A7:
	goto scr_seq_00000166_000001C8

scr_seq_00000166_000001AD:
	.byte 0x02, 0x00
scr_seq_00000166_000001AF:
	msgbox 18
	goto scr_seq_00000166_00000155

scr_seq_00000166_000001B8:
	.byte 0x02, 0x00
scr_seq_00000166_000001BA:
	msgbox 19
	goto scr_seq_00000166_00000155

scr_seq_00000166_000001C3:
	.byte 0x02, 0x00
scr_seq_00000166_000001C5:
	msgbox 117
scr_seq_00000166_000001C8:
	scrcmd_065 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_066 36, 0
	scrcmd_066 37, 1
	scrcmd_066 38, 2
	scrcmd_066 39, 3
	scrcmd_066 40, 4
	scrcmd_067
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000166_00000228
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000166_00000233
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000166_0000023E
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_00000166_00000249
	goto scr_seq_00000166_00000158

scr_seq_00000166_00000226:
	.byte 0x02, 0x00
scr_seq_00000166_00000228:
	msgbox 14
	goto scr_seq_00000166_000001C5

scr_seq_00000166_00000231:
	.byte 0x02, 0x00
scr_seq_00000166_00000233:
	msgbox 15
	goto scr_seq_00000166_000001C5

scr_seq_00000166_0000023C:
	.byte 0x02, 0x00
scr_seq_00000166_0000023E:
	msgbox 16
	goto scr_seq_00000166_000001C5

scr_seq_00000166_00000247:
	.byte 0x02, 0x00
scr_seq_00000166_00000249:
	msgbox 17
	goto scr_seq_00000166_000001C5

scr_seq_00000166_00000252:
	.byte 0x02, 0x00
scr_seq_00000166_00000254:
	msgbox 219
	scrcmd_064 18, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_066 14, 0
	scrcmd_066 15, 1
	scrcmd_066 5, 2
	scrcmd_067
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000166_00000295
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000166_000002E7
	goto scr_seq_00000166_00000118

scr_seq_00000166_00000293:
	.byte 0x02, 0x00
scr_seq_00000166_00000295:
	msgbox 212
	scrcmd_063 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000166_00000254
	closemsg
	scrcmd_226 8, 32773, 32772, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000166_000002D7
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, scr_seq_00000166_000002DF
	goto scr_seq_00000166_00000339

scr_seq_00000166_000002D5:
	.byte 0x02, 0x00
scr_seq_00000166_000002D7:
	goto scr_seq_00000166_00000254

scr_seq_00000166_000002DD:
	.byte 0x02, 0x00
scr_seq_00000166_000002DF:
	goto scr_seq_00000166_00000254

scr_seq_00000166_000002E5:
	.byte 0x02, 0x00
scr_seq_00000166_000002E7:
	msgbox 212
	scrcmd_063 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000166_00000254
	closemsg
	scrcmd_227 8, 32773, 32772, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000166_00000329
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, scr_seq_00000166_00000331
	goto scr_seq_00000166_00000339

scr_seq_00000166_00000327:
	.byte 0x02, 0x00
scr_seq_00000166_00000329:
	goto scr_seq_00000166_00000254

scr_seq_00000166_0000032F:
	.byte 0x02
	.byte 0x00
scr_seq_00000166_00000331:
	scrcmd_283
	closemsg
	releaseall
	end

scr_seq_00000166_00000339:
	scrcmd_234 32772, 32773, 32775, 16386
	scrcmd_232 25
	scrcmd_233 25
	comparevartovalue VAR_TEMP_x4003, 0
	gotoif eq, scr_seq_00000166_0000038D
	comparevartovalue VAR_TEMP_x4003, 1
	gotoif eq, scr_seq_00000166_00000395
	comparevartovalue VAR_TEMP_x4003, 2
	gotoif eq, scr_seq_00000166_000003A7
	end

scr_seq_00000166_00000374:
	.byte 0xec, 0x00, 0x0c, 0x80, 0x27, 0x00, 0x0c, 0x80, 0x01, 0x00, 0x2d, 0x00
	.byte 0xb1, 0xec, 0x00, 0x0c, 0x80, 0x35, 0x00, 0x16, 0x00, 0xbe, 0xff, 0xff, 0xff
scr_seq_00000166_0000038D:
	goto scr_seq_00000166_000003B4

scr_seq_00000166_00000393:
	.byte 0x02, 0x00
scr_seq_00000166_00000395:
	setflag FLAG_UNK_966
	setvar VAR_UNK_4133, 5
	goto scr_seq_00000166_000003B4

scr_seq_00000166_000003A5:
	.byte 0x02, 0x00
scr_seq_00000166_000003A7:
	scrcmd_048 211
	closemsg
	goto scr_seq_00000166_000003B4

scr_seq_00000166_000003B2:
	.byte 0x02, 0x00
scr_seq_00000166_000003B4:
	get_player_gender VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000166_000003CD
	goto scr_seq_00000166_000003DB

scr_seq_00000166_000003CB:
	.byte 0x02, 0x00
scr_seq_00000166_000003CD:
	buffer_players_name 0
	scrcmd_048 66
	goto scr_seq_00000166_000003E9

scr_seq_00000166_000003D9:
	.byte 0x02, 0x00
scr_seq_00000166_000003DB:
	buffer_players_name 0
	scrcmd_048 67
	goto scr_seq_00000166_000003E9

scr_seq_00000166_000003E7:
	.byte 0x02, 0x00
scr_seq_00000166_000003E9:
	scrcmd_048 68
	scrcmd_232 26
	scrcmd_233 26
	closemsg
	goto scr_seq_00000166_000003FE

scr_seq_00000166_000003FC:
	.byte 0x02, 0x00
scr_seq_00000166_000003FE:
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
	goto scr_seq_00000166_00000443

scr_seq_00000166_00000443:
	releaseall
	end

scr_seq_00000166_00000447:
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
scr_seq_00000166_00000590:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x4003, 2
	setvar VAR_SPECIAL_x8004, 0
	msgbox 111
	goto scr_seq_00000166_000005AF

scr_seq_00000166_000005AD:
	.byte 0x02, 0x00
scr_seq_00000166_000005AF:
	msgbox 112
	scrcmd_065 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_066 113, 0
	scrcmd_066 114, 1
	scrcmd_066 115, 2
	scrcmd_067
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000166_000005FD
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000166_00000872
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000166_00000A97
	goto scr_seq_00000166_00000A97

scr_seq_00000166_000005FB:
	.byte 0x02, 0x00
scr_seq_00000166_000005FD:
	scrcmd_065 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_066 155, 0
	scrcmd_066 156, 1
	scrcmd_066 157, 2
	scrcmd_066 158, 3
	scrcmd_067
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000166_0000064C
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000166_00000660
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000166_0000067A
	goto scr_seq_00000166_0000068E

scr_seq_00000166_0000064A:
	.byte 0x02, 0x00
scr_seq_00000166_0000064C:
	setvar VAR_TEMP_x4004, 0
	setvar VAR_SPECIAL_x8007, 3
	goto scr_seq_00000166_00000743

scr_seq_00000166_0000065E:
	.byte 0x02, 0x00
scr_seq_00000166_00000660:
	setvar VAR_TEMP_x4004, 1
	setvar VAR_SPECIAL_x8005, 0
	setvar VAR_SPECIAL_x8007, 5
	goto scr_seq_00000166_00000743

scr_seq_00000166_00000678:
	.byte 0x02, 0x00
scr_seq_00000166_0000067A:
	setvar VAR_TEMP_x4004, 0
	setvar VAR_SPECIAL_x8007, 7
	goto scr_seq_00000166_00000743

scr_seq_00000166_0000068C:
	.byte 0x02, 0x00
scr_seq_00000166_0000068E:
	msgbox 159
	waitbutton
	goto scr_seq_00000166_00000A9C

scr_seq_00000166_00000699:
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
scr_seq_00000166_00000743:
	comparevartovalue VAR_TEMP_x4004, 1
	gotoif eq, scr_seq_00000166_0000081D
	goto scr_seq_00000166_00000756

scr_seq_00000166_00000756:
	msgbox 160
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
	gotoif eq, scr_seq_00000166_000007CA
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000166_000007D8
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000166_000007E6
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_00000166_000007F4
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_00000166_00000802
	goto scr_seq_00000166_00000810

scr_seq_00000166_000007C8:
	.byte 0x02, 0x00
scr_seq_00000166_000007CA:
	setvar VAR_SPECIAL_x8005, 0
	goto scr_seq_00000166_0000081D

scr_seq_00000166_000007D6:
	.byte 0x02, 0x00
scr_seq_00000166_000007D8:
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_00000166_0000081D

scr_seq_00000166_000007E4:
	.byte 0x02, 0x00
scr_seq_00000166_000007E6:
	setvar VAR_SPECIAL_x8005, 2
	goto scr_seq_00000166_0000081D

scr_seq_00000166_000007F2:
	.byte 0x02, 0x00
scr_seq_00000166_000007F4:
	setvar VAR_SPECIAL_x8005, 3
	goto scr_seq_00000166_0000081D

scr_seq_00000166_00000800:
	.byte 0x02, 0x00
scr_seq_00000166_00000802:
	setvar VAR_SPECIAL_x8005, 4
	goto scr_seq_00000166_0000081D

scr_seq_00000166_0000080E:
	.byte 0x02, 0x00
scr_seq_00000166_00000810:
	msgbox 167
	waitbutton
	goto scr_seq_00000166_00000A9C

scr_seq_00000166_0000081B:
	.byte 0x02, 0x00
scr_seq_00000166_0000081D:
	msgbox 175
	msgbox 176
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	setvar VAR_SPECIAL_x800C, 0
scr_seq_00000166_00000837:
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000166_0000084F
	scrcmd_353 0, 32780
	goto scr_seq_00000166_00000837

scr_seq_00000166_0000084F:
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	comparevartovalue VAR_TEMP_x4002, 255
	gotoif eq, scr_seq_00000166_00000810
	goto scr_seq_00000166_00000339

scr_seq_00000166_00000870:
	.byte 0x02, 0x00
scr_seq_00000166_00000872:
	msgbox 117
scr_seq_00000166_00000875:
	scrcmd_065 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_066 121, 0
	scrcmd_066 118, 1
	scrcmd_066 119, 2
	scrcmd_066 120, 3
	scrcmd_066 122, 4
	scrcmd_067
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000166_00000A7E
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000166_000008D8
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000166_00000953
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_00000166_000009EA
	goto scr_seq_00000166_000005AF

scr_seq_00000166_000008D3:
	.byte 0x02, 0x00
scr_seq_00000166_000008D5:
	msgbox 117
scr_seq_00000166_000008D8:
	scrcmd_065 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_066 125, 0
	scrcmd_066 126, 1
	scrcmd_066 127, 2
	scrcmd_066 129, 3
	scrcmd_067
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000166_00000927
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000166_00000932
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000166_0000093D
	goto scr_seq_00000166_00000948

scr_seq_00000166_00000925:
	.byte 0x02, 0x00
scr_seq_00000166_00000927:
	msgbox 130
	goto scr_seq_00000166_000008D5

scr_seq_00000166_00000930:
	.byte 0x02, 0x00
scr_seq_00000166_00000932:
	msgbox 131
	goto scr_seq_00000166_000008D5

scr_seq_00000166_0000093B:
	.byte 0x02, 0x00
scr_seq_00000166_0000093D:
	msgbox 132
	goto scr_seq_00000166_000008D5

scr_seq_00000166_00000946:
	.byte 0x02, 0x00
scr_seq_00000166_00000948:
	goto scr_seq_00000166_00000875

scr_seq_00000166_0000094E:
	.byte 0x02, 0x00
scr_seq_00000166_00000950:
	msgbox 117
scr_seq_00000166_00000953:
	scrcmd_065 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_066 135, 0
	scrcmd_066 136, 1
	scrcmd_066 137, 2
	scrcmd_066 138, 3
	scrcmd_066 139, 4
	scrcmd_067
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000166_000009B3
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000166_000009BE
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000166_000009C9
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_00000166_000009D4
	goto scr_seq_00000166_000009DF

scr_seq_00000166_000009B1:
	.byte 0x02, 0x00
scr_seq_00000166_000009B3:
	msgbox 140
	goto scr_seq_00000166_00000950

scr_seq_00000166_000009BC:
	.byte 0x02, 0x00
scr_seq_00000166_000009BE:
	msgbox 141
	goto scr_seq_00000166_00000950

scr_seq_00000166_000009C7:
	.byte 0x02, 0x00
scr_seq_00000166_000009C9:
	msgbox 142
	goto scr_seq_00000166_00000950

scr_seq_00000166_000009D2:
	.byte 0x02, 0x00
scr_seq_00000166_000009D4:
	msgbox 143
	goto scr_seq_00000166_00000950

scr_seq_00000166_000009DD:
	.byte 0x02, 0x00
scr_seq_00000166_000009DF:
	goto scr_seq_00000166_00000875

scr_seq_00000166_000009E5:
	.byte 0x02, 0x00
scr_seq_00000166_000009E7:
	msgbox 117
scr_seq_00000166_000009EA:
	scrcmd_065 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_066 145, 0
	scrcmd_066 146, 1
	scrcmd_066 147, 2
	scrcmd_066 148, 3
	scrcmd_066 149, 4
	scrcmd_067
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000166_00000A4A
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000166_00000A55
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000166_00000A60
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_00000166_00000A6B
	goto scr_seq_00000166_00000A76

scr_seq_00000166_00000A48:
	.byte 0x02, 0x00
scr_seq_00000166_00000A4A:
	msgbox 150
	goto scr_seq_00000166_000009E7

scr_seq_00000166_00000A53:
	.byte 0x02, 0x00
scr_seq_00000166_00000A55:
	msgbox 151
	goto scr_seq_00000166_000009E7

scr_seq_00000166_00000A5E:
	.byte 0x02, 0x00
scr_seq_00000166_00000A60:
	msgbox 152
	goto scr_seq_00000166_000009E7

scr_seq_00000166_00000A69:
	.byte 0x02, 0x00
scr_seq_00000166_00000A6B:
	msgbox 153
	goto scr_seq_00000166_000009E7

scr_seq_00000166_00000A74:
	.byte 0x02, 0x00
scr_seq_00000166_00000A76:
	goto scr_seq_00000166_00000875

scr_seq_00000166_00000A7C:
	.byte 0x02, 0x00
scr_seq_00000166_00000A7E:
	msgbox 124
	msgbox 117
	goto scr_seq_00000166_00000875

scr_seq_00000166_00000A8A:
	.byte 0x02, 0x00, 0x2d, 0x00, 0x7b, 0x16
	.byte 0x00, 0x07, 0x00, 0x00, 0x00, 0x02, 0x00
scr_seq_00000166_00000A97:
	msgbox 116
	waitbutton
scr_seq_00000166_00000A9C:
	closemsg
	releaseall
	end

scr_seq_00000166_00000AA2:
	end
	.balign 4, 0
