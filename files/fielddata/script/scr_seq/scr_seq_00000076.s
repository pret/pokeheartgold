#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000076_00001184 ; 000
	scrdef scr_seq_00000076_0000029C ; 001
	scrdef scr_seq_00000076_000002AF ; 002
	scrdef scr_seq_00000076_000002C2 ; 003
	scrdef scr_seq_00000076_000002D5 ; 004
	scrdef scr_seq_00000076_000002E8 ; 005
	scrdef scr_seq_00000076_000002FB ; 006
	scrdef scr_seq_00000076_0000030E ; 007
	scrdef scr_seq_00000076_00000321 ; 008
	scrdef scr_seq_00000076_00000334 ; 009
	scrdef scr_seq_00000076_00000347 ; 010
	scrdef scr_seq_00000076_0000035A ; 011
	scrdef scr_seq_00000076_0000036D ; 012
	scrdef scr_seq_00000076_00000380 ; 013
	scrdef scr_seq_00000076_00000393 ; 014
	scrdef scr_seq_00000076_000003A6 ; 015
	scrdef scr_seq_00000076_000003B9 ; 016
	scrdef scr_seq_00000076_000003CC ; 017
	scrdef scr_seq_00000076_000003DF ; 018
	scrdef scr_seq_00000076_000003F2 ; 019
	scrdef scr_seq_00000076_00000405 ; 020
	scrdef scr_seq_00000076_00000418 ; 021
	scrdef scr_seq_00000076_0000042B ; 022
	scrdef scr_seq_00000076_00000FAE ; 023
	scrdef scr_seq_00000076_00000B15 ; 024
	scrdef scr_seq_00000076_00000FD6 ; 025
	scrdef scr_seq_00000076_00000FEB ; 026
	scrdef scr_seq_00000076_00001000 ; 027
	scrdef scr_seq_00000076_00001015 ; 028
	scrdef scr_seq_00000076_0000102A ; 029
	scrdef scr_seq_00000076_0000103F ; 030
	scrdef scr_seq_00000076_00001050 ; 031
	scrdef scr_seq_00000076_00001061 ; 032
	scrdef scr_seq_00000076_00001072 ; 033
	scrdef scr_seq_00000076_000010B8 ; 034
	scrdef scr_seq_00000076_000010FC ; 035
	scrdef scr_seq_00000076_00001140 ; 036
	scrdef scr_seq_00000076_0000009E ; 037
	scrdef scr_seq_00000076_000000E1 ; 038
	scrdef_end

scr_seq_00000076_0000009E:
	checkflag FLAG_UNK_189
	gotoif lt, scr_seq_00000076_000000AF
	clearflag FLAG_UNK_189
	end

scr_seq_00000076_000000AF:
	scrcmd_484 16384
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif eq, scr_seq_00000076_000000D7
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif eq, scr_seq_00000076_000000D7
	setflag FLAG_UNK_27E
	goto scr_seq_00000076_000000DB

scr_seq_00000076_000000D7:
	setflag FLAG_UNK_27E
scr_seq_00000076_000000DB:
	setflag FLAG_UNK_234
	end

scr_seq_00000076_000000E1:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_438 2, 32780
	scrcmd_440 32780, 0
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000076_00000209
	scrcmd_618 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000076_0000021D
	scrcmd_438 2, 32780
	scrcmd_440 32780, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000076_0000015A
	apply_movement 255, scr_seq_00000076_00000234
	apply_movement 24, scr_seq_00000076_00000280
	goto scr_seq_00000076_000001A8

scr_seq_00000076_0000015A:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000076_00000175
	apply_movement 255, scr_seq_00000076_0000024C
	goto scr_seq_00000076_000001A8

scr_seq_00000076_00000175:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_00000076_00000198
	apply_movement 255, scr_seq_00000076_0000026C
	apply_movement 24, scr_seq_00000076_00000280
	goto scr_seq_00000076_000001A8

scr_seq_00000076_00000198:
	apply_movement 255, scr_seq_00000076_00000258
	apply_movement 24, scr_seq_00000076_00000280
scr_seq_00000076_000001A8:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000076_000001CF
	apply_movement 253, scr_seq_00000076_0000028C
	wait_movement
scr_seq_00000076_000001CF:
	setflag FLAG_UNK_189
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_615 31
	lockall
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	clearflag FLAG_UNK_189
	scrcmd_438 2, 32780
	scrcmd_440 32780, 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000076_00000209:
	scrcmd_438 2, 32780
	scrcmd_440 32780, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000076_0000021D:
	scrcmd_438 2, 32780
	scrcmd_440 32780, 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000076_00000231:
	.byte 0x00, 0x00, 0x00

scr_seq_00000076_00000234:
	.short 15, 1
	.short 12, 2
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000076_0000024C:
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000076_00000258:
	.short 12, 1
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000076_0000026C:
	.short 12, 1
	.short 15, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000076_00000280:
	.short 63, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000076_0000028C:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
scr_seq_00000076_0000029C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000076_000002AF:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000076_000002C2:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000076_000002D5:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000076_000002E8:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000076_000002FB:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000076_0000030E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000076_00000321:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000076_00000334:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000076_00000347:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000076_0000035A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000076_0000036D:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 11
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000076_00000380:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 12
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000076_00000393:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 13
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000076_000003A6:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 14
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000076_000003B9:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 15
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000076_000003CC:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 16
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000076_000003DF:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 17
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000076_000003F2:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 18
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000076_00000405:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 19
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000076_00000418:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 20
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000076_0000042B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_SPECIAL_x8000, 0
	scrcmd_784 3, 0
	scrcmd_116 1, 21, 1
	msgbox 21
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000076_00000B02
scr_seq_00000076_0000045C:
	msgbox 31
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 347, 255, 0
	scrcmd_751 348, 255, 1
	scrcmd_751 349, 255, 2
	scrcmd_751 350, 255, 3
	scrcmd_751 439, 255, 4
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000076_000004D1
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000076_00000630
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000076_00000762
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_00000076_000008C1
	goto scr_seq_00000076_00000B02

scr_seq_00000076_000004D1:
	setvar VAR_SPECIAL_x8007, 0
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 354, 396, 0
	scrcmd_751 355, 397, 1
	scrcmd_751 356, 398, 2
	scrcmd_751 357, 399, 3
	scrcmd_751 358, 400, 4
	scrcmd_751 359, 401, 5
	scrcmd_751 379, 402, 6
	scrcmd_751 440, 438, 7
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000076_00000588
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000076_000005A0
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000076_000005B8
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_00000076_000005D0
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_00000076_000005E8
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, scr_seq_00000076_00000600
	comparevartovalue VAR_SPECIAL_x8008, 6
	gotoif eq, scr_seq_00000076_00000618
	goto scr_seq_00000076_0000045C

scr_seq_00000076_00000588:
	setvar VAR_SPECIAL_x8004, 46
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 1
	goto scr_seq_00000076_000009F3

scr_seq_00000076_000005A0:
	setvar VAR_SPECIAL_x8004, 49
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 1
	goto scr_seq_00000076_000009F3

scr_seq_00000076_000005B8:
	setvar VAR_SPECIAL_x8004, 47
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 1
	goto scr_seq_00000076_000009F3

scr_seq_00000076_000005D0:
	setvar VAR_SPECIAL_x8004, 52
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 1
	goto scr_seq_00000076_000009F3

scr_seq_00000076_000005E8:
	setvar VAR_SPECIAL_x8004, 48
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 1
	goto scr_seq_00000076_000009F3

scr_seq_00000076_00000600:
	setvar VAR_SPECIAL_x8004, 45
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 1
	goto scr_seq_00000076_000009F3

scr_seq_00000076_00000618:
	setvar VAR_SPECIAL_x8004, 50
	setvar VAR_SPECIAL_x8005, 48
	setvar VAR_SPECIAL_x8006, 48
	goto scr_seq_00000076_000009F3

scr_seq_00000076_00000630:
	setvar VAR_SPECIAL_x8007, 1
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 360, 403, 0
	scrcmd_751 361, 404, 1
	scrcmd_751 362, 405, 2
	scrcmd_751 363, 406, 3
	scrcmd_751 364, 407, 4
	scrcmd_751 365, 408, 5
	scrcmd_751 440, 438, 6
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000076_000006D2
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000076_000006EA
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000076_00000702
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_00000076_0000071A
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_00000076_00000732
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, scr_seq_00000076_0000074A
	goto scr_seq_00000076_0000045C

scr_seq_00000076_000006D2:
	setvar VAR_SPECIAL_x8004, 289
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 16
	goto scr_seq_00000076_000009F3

scr_seq_00000076_000006EA:
	setvar VAR_SPECIAL_x8004, 290
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 16
	goto scr_seq_00000076_000009F3

scr_seq_00000076_00000702:
	setvar VAR_SPECIAL_x8004, 291
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 16
	goto scr_seq_00000076_000009F3

scr_seq_00000076_0000071A:
	setvar VAR_SPECIAL_x8004, 292
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 16
	goto scr_seq_00000076_000009F3

scr_seq_00000076_00000732:
	setvar VAR_SPECIAL_x8004, 293
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 16
	goto scr_seq_00000076_000009F3

scr_seq_00000076_0000074A:
	setvar VAR_SPECIAL_x8004, 294
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 16
	goto scr_seq_00000076_000009F3

scr_seq_00000076_00000762:
	setvar VAR_SPECIAL_x8007, 2
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 366, 409, 0
	scrcmd_751 367, 410, 1
	scrcmd_751 368, 411, 2
	scrcmd_751 369, 412, 3
	scrcmd_751 370, 413, 4
	scrcmd_751 372, 415, 5
	scrcmd_751 375, 418, 6
	scrcmd_751 440, 438, 7
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000076_00000819
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000076_00000831
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000076_00000849
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_00000076_00000861
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_00000076_00000879
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, scr_seq_00000076_00000891
	comparevartovalue VAR_SPECIAL_x8008, 6
	gotoif eq, scr_seq_00000076_000008A9
	goto scr_seq_00000076_0000045C

scr_seq_00000076_00000819:
	setvar VAR_SPECIAL_x8004, 272
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 16
	goto scr_seq_00000076_000009F3

scr_seq_00000076_00000831:
	setvar VAR_SPECIAL_x8004, 273
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 16
	goto scr_seq_00000076_000009F3

scr_seq_00000076_00000849:
	setvar VAR_SPECIAL_x8004, 214
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 32
	goto scr_seq_00000076_000009F3

scr_seq_00000076_00000861:
	setvar VAR_SPECIAL_x8004, 271
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 32
	goto scr_seq_00000076_000009F3

scr_seq_00000076_00000879:
	setvar VAR_SPECIAL_x8004, 213
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 48
	goto scr_seq_00000076_000009F3

scr_seq_00000076_00000891:
	setvar VAR_SPECIAL_x8004, 230
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 48
	goto scr_seq_00000076_000009F3

scr_seq_00000076_000008A9:
	setvar VAR_SPECIAL_x8004, 275
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 48
	goto scr_seq_00000076_000009F3

scr_seq_00000076_000008C1:
	setvar VAR_SPECIAL_x8007, 3
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 371, 414, 0
	scrcmd_751 376, 419, 1
	scrcmd_751 373, 416, 2
	scrcmd_751 374, 417, 3
	scrcmd_751 377, 420, 4
	scrcmd_751 378, 421, 5
	scrcmd_751 440, 438, 7
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000076_00000963
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000076_0000097B
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000076_00000993
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_00000076_000009AB
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_00000076_000009C3
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, scr_seq_00000076_000009DB
	goto scr_seq_00000076_0000045C

scr_seq_00000076_00000963:
	setvar VAR_SPECIAL_x8004, 220
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 48
	goto scr_seq_00000076_000009F3

scr_seq_00000076_0000097B:
	setvar VAR_SPECIAL_x8004, 287
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 48
	goto scr_seq_00000076_000009F3

scr_seq_00000076_00000993:
	setvar VAR_SPECIAL_x8004, 232
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 48
	goto scr_seq_00000076_000009F3

scr_seq_00000076_000009AB:
	setvar VAR_SPECIAL_x8004, 266
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 48
	goto scr_seq_00000076_000009F3

scr_seq_00000076_000009C3:
	setvar VAR_SPECIAL_x8004, 326
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 48
	goto scr_seq_00000076_000009F3

scr_seq_00000076_000009DB:
	setvar VAR_SPECIAL_x8004, 327
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 48
	goto scr_seq_00000076_000009F3

scr_seq_00000076_000009F3:
	scrcmd_194 0, 32772
	scrcmd_198 1, 32774
	msgbox 23
	scrcmd_748 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000076_00000A24
	comparevartovalue VAR_SPECIAL_x8000, 0
	gotoif eq, scr_seq_00000076_00000AB1
	goto scr_seq_00000076_00000F76

scr_seq_00000076_00000A24:
	scrcmd_557 32774, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000076_00000A9B
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000076_00000A85
	scrcmd_556 32774
	scrcmd_118 1
	play_se SEQ_SE_DP_REGI
	scrcmd_194 0, 32772
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_195 1, 32780
	msgbox 26
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8000, 0
	gotoif eq, scr_seq_00000076_00000AB1
	goto scr_seq_00000076_00000F76

scr_seq_00000076_00000A85:
	msgbox 29
	comparevartovalue VAR_SPECIAL_x8000, 0
	gotoif eq, scr_seq_00000076_00000AB1
	goto scr_seq_00000076_00000F76

scr_seq_00000076_00000A9B:
	msgbox 27
	comparevartovalue VAR_SPECIAL_x8000, 0
	gotoif eq, scr_seq_00000076_00000AB1
	goto scr_seq_00000076_00000F76

scr_seq_00000076_00000AB1:
	comparevartovalue VAR_SPECIAL_x8007, 0
	gotoif ne, scr_seq_00000076_00000ACA
	goto scr_seq_00000076_000004D1

scr_seq_00000076_00000AC4:
	.byte 0x16, 0x00, 0x38, 0x00, 0x00, 0x00
scr_seq_00000076_00000ACA:
	comparevartovalue VAR_SPECIAL_x8007, 1
	gotoif ne, scr_seq_00000076_00000AE3
	goto scr_seq_00000076_00000630

scr_seq_00000076_00000ADD:
	.byte 0x16, 0x00, 0x1f
	.byte 0x00, 0x00, 0x00
scr_seq_00000076_00000AE3:
	comparevartovalue VAR_SPECIAL_x8007, 2
	gotoif ne, scr_seq_00000076_00000AFC
	goto scr_seq_00000076_00000762

scr_seq_00000076_00000AF6:
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
scr_seq_00000076_00000AFC:
	goto scr_seq_00000076_000008C1

scr_seq_00000076_00000B02:
	scrcmd_117
	scrcmd_747
	msgbox 22
	waitbutton
	closemsg
	releaseall
	scrcmd_784 3, 1
	end

scr_seq_00000076_00000B15:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_SPECIAL_x8000, 1
	scrcmd_784 3, 0
	scrcmd_116 1, 21, 1
	msgbox 21
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000076_00000B02
scr_seq_00000076_00000B44:
	msgbox 30
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 351, 255, 0
	scrcmd_751 352, 255, 1
	scrcmd_751 353, 255, 2
	scrcmd_751 439, 255, 4
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000076_00000BA4
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000076_00000CFA
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000076_00000DEA
	goto scr_seq_00000076_00000B02

scr_seq_00000076_00000BA4:
	setvar VAR_SPECIAL_x8007, 0
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 380, 422, 0
	scrcmd_751 381, 423, 1
	scrcmd_751 382, 424, 2
	scrcmd_751 383, 425, 3
	scrcmd_751 384, 426, 4
	scrcmd_751 385, 427, 5
	scrcmd_751 440, 438, 6
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000076_00000C46
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000076_00000C64
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000076_00000C82
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_00000076_00000CA0
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_00000076_00000CBE
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, scr_seq_00000076_00000CDC
	goto scr_seq_00000076_00000B44

scr_seq_00000076_00000C46:
	setvar VAR_SPECIAL_x8004, 367
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 40
	setvar VAR_SPECIAL_x8001, 332
	goto scr_seq_00000076_00000F40

scr_seq_00000076_00000C64:
	setvar VAR_SPECIAL_x8004, 358
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 40
	setvar VAR_SPECIAL_x8001, 280
	goto scr_seq_00000076_00000F40

scr_seq_00000076_00000C82:
	setvar VAR_SPECIAL_x8004, 416
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 40
	setvar VAR_SPECIAL_x8001, 369
	goto scr_seq_00000076_00000F40

scr_seq_00000076_00000CA0:
	setvar VAR_SPECIAL_x8004, 408
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 64
	setvar VAR_SPECIAL_x8001, 404
	goto scr_seq_00000076_00000F40

scr_seq_00000076_00000CBE:
	setvar VAR_SPECIAL_x8004, 398
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 80
	setvar VAR_SPECIAL_x8001, 444
	goto scr_seq_00000076_00000F40

scr_seq_00000076_00000CDC:
	setvar VAR_SPECIAL_x8004, 353
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 80
	setvar VAR_SPECIAL_x8001, 89
	goto scr_seq_00000076_00000F40

scr_seq_00000076_00000CFA:
	setvar VAR_SPECIAL_x8007, 1
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 386, 428, 0
	scrcmd_751 387, 429, 1
	scrcmd_751 388, 430, 2
	scrcmd_751 389, 431, 3
	scrcmd_751 440, 438, 4
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000076_00000D72
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000076_00000D90
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000076_00000DAE
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_00000076_00000DCC
	goto scr_seq_00000076_00000B44

scr_seq_00000076_00000D72:
	setvar VAR_SPECIAL_x8004, 357
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 64
	setvar VAR_SPECIAL_x8001, 247
	goto scr_seq_00000076_00000F40

scr_seq_00000076_00000D90:
	setvar VAR_SPECIAL_x8004, 380
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 64
	setvar VAR_SPECIAL_x8001, 412
	goto scr_seq_00000076_00000F40

scr_seq_00000076_00000DAE:
	setvar VAR_SPECIAL_x8004, 363
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 80
	setvar VAR_SPECIAL_x8001, 188
	goto scr_seq_00000076_00000F40

scr_seq_00000076_00000DCC:
	setvar VAR_SPECIAL_x8004, 386
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 80
	setvar VAR_SPECIAL_x8001, 406
	goto scr_seq_00000076_00000F40

scr_seq_00000076_00000DEA:
	setvar VAR_SPECIAL_x8007, 2
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 390, 432, 0
	scrcmd_751 391, 433, 1
	scrcmd_751 392, 434, 2
	scrcmd_751 393, 435, 3
	scrcmd_751 394, 436, 4
	scrcmd_751 395, 437, 5
	scrcmd_751 440, 438, 6
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000076_00000E8C
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000076_00000EAA
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000076_00000EC8
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_00000076_00000EE6
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_00000076_00000F04
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, scr_seq_00000076_00000F22
	goto scr_seq_00000076_00000B44

scr_seq_00000076_00000E8C:
	setvar VAR_SPECIAL_x8004, 333
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 32
	setvar VAR_SPECIAL_x8001, 92
	goto scr_seq_00000076_00000F40

scr_seq_00000076_00000EAA:
	setvar VAR_SPECIAL_x8004, 400
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 32
	setvar VAR_SPECIAL_x8001, 86
	goto scr_seq_00000076_00000F40

scr_seq_00000076_00000EC8:
	setvar VAR_SPECIAL_x8004, 388
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 32
	setvar VAR_SPECIAL_x8001, 261
	goto scr_seq_00000076_00000F40

scr_seq_00000076_00000EE6:
	setvar VAR_SPECIAL_x8004, 372
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 32
	setvar VAR_SPECIAL_x8001, 213
	goto scr_seq_00000076_00000F40

scr_seq_00000076_00000F04:
	setvar VAR_SPECIAL_x8004, 335
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 48
	setvar VAR_SPECIAL_x8001, 339
	goto scr_seq_00000076_00000F40

scr_seq_00000076_00000F22:
	setvar VAR_SPECIAL_x8004, 331
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 48
	setvar VAR_SPECIAL_x8001, 347
	goto scr_seq_00000076_00000F40

scr_seq_00000076_00000F40:
	scrcmd_194 0, 32772
	scrcmd_197 1, 32769
	scrcmd_198 2, 32774
	msgbox 24
	scrcmd_748 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000076_00000A24
	comparevartovalue VAR_SPECIAL_x8000, 0
	gotoif eq, scr_seq_00000076_00000AB1
	goto scr_seq_00000076_00000F76

scr_seq_00000076_00000F76:
	comparevartovalue VAR_SPECIAL_x8007, 0
	gotoif ne, scr_seq_00000076_00000F8F
	goto scr_seq_00000076_00000BA4

scr_seq_00000076_00000F89:
	.byte 0x16, 0x00, 0x1f, 0x00, 0x00, 0x00
scr_seq_00000076_00000F8F:
	comparevartovalue VAR_SPECIAL_x8007, 1
	gotoif ne, scr_seq_00000076_00000FA8
	goto scr_seq_00000076_00000CFA

scr_seq_00000076_00000FA2:
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
scr_seq_00000076_00000FA8:
	goto scr_seq_00000076_00000DEA

scr_seq_00000076_00000FAE:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_649
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	releaseall
	end

scr_seq_00000076_00000FD6:
	scrcmd_056 3, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 34, 32780
	callstd 2000
	end

scr_seq_00000076_00000FEB:
	scrcmd_056 3, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 35, 32780
	callstd 2000
	end

scr_seq_00000076_00001000:
	scrcmd_056 3, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 36, 32780
	callstd 2000
	end

scr_seq_00000076_00001015:
	scrcmd_056 3, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 37, 32780
	callstd 2000
	end

scr_seq_00000076_0000102A:
	scrcmd_056 3, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 38, 32780
	callstd 2000
	end

scr_seq_00000076_0000103F:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 39
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000076_00001050:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 40
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000076_00001061:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 41
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000076_00001072:
	scrcmd_609
	lockall
	scrcmd_600
	apply_movement 255, scr_seq_00000076_000010B0
	wait_movement
	play_se SEQ_SE_DP_KAIDAN2
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_176 276, 0, 25, 9, 2
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	releaseall
	end

scr_seq_00000076_000010AE:
	.byte 0x00, 0x00

scr_seq_00000076_000010B0:
	.short 18, 5
	.short 254, 0
scr_seq_00000076_000010B8:
	scrcmd_609
	lockall
	scrcmd_600
	apply_movement 255, scr_seq_00000076_000010F4
	wait_movement
	play_se SEQ_SE_DP_KAIDAN2
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_176 277, 0, 21, 9, 2
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	releaseall
	end


scr_seq_00000076_000010F4:
	.short 18, 6
	.short 254, 0
scr_seq_00000076_000010FC:
	scrcmd_609
	lockall
	scrcmd_600
	apply_movement 255, scr_seq_00000076_00001138
	wait_movement
	play_se SEQ_SE_DP_KAIDAN2
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_176 278, 0, 1, 6, 3
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	releaseall
	end


scr_seq_00000076_00001138:
	.short 19, 5
	.short 254, 0
scr_seq_00000076_00001140:
	scrcmd_609
	lockall
	scrcmd_600
	apply_movement 255, scr_seq_00000076_0000117C
	wait_movement
	play_se SEQ_SE_DP_KAIDAN2
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_176 275, 0, 1, 7, 3
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	releaseall
	end


scr_seq_00000076_0000117C:
	.short 19, 6
	.short 254, 0
scr_seq_00000076_00001184:
	end
	.balign 4, 0
