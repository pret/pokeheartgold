#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0076_D32_1184 ; 000
	scrdef scr_seq_0076_D32_029C ; 001
	scrdef scr_seq_0076_D32_02AF ; 002
	scrdef scr_seq_0076_D32_02C2 ; 003
	scrdef scr_seq_0076_D32_02D5 ; 004
	scrdef scr_seq_0076_D32_02E8 ; 005
	scrdef scr_seq_0076_D32_02FB ; 006
	scrdef scr_seq_0076_D32_030E ; 007
	scrdef scr_seq_0076_D32_0321 ; 008
	scrdef scr_seq_0076_D32_0334 ; 009
	scrdef scr_seq_0076_D32_0347 ; 010
	scrdef scr_seq_0076_D32_035A ; 011
	scrdef scr_seq_0076_D32_036D ; 012
	scrdef scr_seq_0076_D32_0380 ; 013
	scrdef scr_seq_0076_D32_0393 ; 014
	scrdef scr_seq_0076_D32_03A6 ; 015
	scrdef scr_seq_0076_D32_03B9 ; 016
	scrdef scr_seq_0076_D32_03CC ; 017
	scrdef scr_seq_0076_D32_03DF ; 018
	scrdef scr_seq_0076_D32_03F2 ; 019
	scrdef scr_seq_0076_D32_0405 ; 020
	scrdef scr_seq_0076_D32_0418 ; 021
	scrdef scr_seq_0076_D32_042B ; 022
	scrdef scr_seq_0076_D32_0FAE ; 023
	scrdef scr_seq_0076_D32_0B15 ; 024
	scrdef scr_seq_0076_D32_0FD6 ; 025
	scrdef scr_seq_0076_D32_0FEB ; 026
	scrdef scr_seq_0076_D32_1000 ; 027
	scrdef scr_seq_0076_D32_1015 ; 028
	scrdef scr_seq_0076_D32_102A ; 029
	scrdef scr_seq_0076_D32_103F ; 030
	scrdef scr_seq_0076_D32_1050 ; 031
	scrdef scr_seq_0076_D32_1061 ; 032
	scrdef scr_seq_0076_D32_1072 ; 033
	scrdef scr_seq_0076_D32_10B8 ; 034
	scrdef scr_seq_0076_D32_10FC ; 035
	scrdef scr_seq_0076_D32_1140 ; 036
	scrdef scr_seq_0076_D32_009E ; 037
	scrdef scr_seq_0076_D32_00E1 ; 038
	scrdef_end

scr_seq_0076_D32_009E:
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_0076_D32_00AF
	clearflag FLAG_UNK_189
	end

scr_seq_0076_D32_00AF:
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif eq, scr_seq_0076_D32_00D7
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif eq, scr_seq_0076_D32_00D7
	setflag FLAG_UNK_27E
	goto scr_seq_0076_D32_00DB

scr_seq_0076_D32_00D7:
	setflag FLAG_UNK_27E
scr_seq_0076_D32_00DB:
	setflag FLAG_UNK_234
	end

scr_seq_0076_D32_00E1:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 0
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0076_D32_0209
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0076_D32_021D
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0076_D32_015A
	apply_movement 255, scr_seq_0076_D32_0234
	apply_movement 24, scr_seq_0076_D32_0280
	goto scr_seq_0076_D32_01A8

scr_seq_0076_D32_015A:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0076_D32_0175
	apply_movement 255, scr_seq_0076_D32_024C
	goto scr_seq_0076_D32_01A8

scr_seq_0076_D32_0175:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0076_D32_0198
	apply_movement 255, scr_seq_0076_D32_026C
	apply_movement 24, scr_seq_0076_D32_0280
	goto scr_seq_0076_D32_01A8

scr_seq_0076_D32_0198:
	apply_movement 255, scr_seq_0076_D32_0258
	apply_movement 24, scr_seq_0076_D32_0280
scr_seq_0076_D32_01A8:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0076_D32_01CF
	apply_movement 253, scr_seq_0076_D32_028C
	wait_movement
scr_seq_0076_D32_01CF:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_615 31
	lockall
	fade_screen 6, 1, 1, 0
	wait_fade
	clearflag FLAG_UNK_189
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0076_D32_0209:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0076_D32_021D:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0076_D32_0231:
	.byte 0x00, 0x00, 0x00

scr_seq_0076_D32_0234:
	.short 15, 1
	.short 12, 2
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0076_D32_024C:
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0076_D32_0258:
	.short 12, 1
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0076_D32_026C:
	.short 12, 1
	.short 15, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0076_D32_0280:
	.short 63, 1
	.short 32, 1
	.short 254, 0

scr_seq_0076_D32_028C:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
scr_seq_0076_D32_029C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0076_D32_02AF:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0076_D32_02C2:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0076_D32_02D5:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0076_D32_02E8:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0076_D32_02FB:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0076_D32_030E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0076_D32_0321:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0076_D32_0334:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0076_D32_0347:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0076_D32_035A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0076_D32_036D:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 11
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0076_D32_0380:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 12
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0076_D32_0393:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 13
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0076_D32_03A6:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 14
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0076_D32_03B9:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 15
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0076_D32_03CC:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 16
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0076_D32_03DF:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 17
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0076_D32_03F2:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 18
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0076_D32_0405:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 19
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0076_D32_0418:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 20
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0076_D32_042B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_SPECIAL_x8000, 0
	scrcmd_784 3, 0
	scrcmd_116 1, 21, 1
	npc_msg 21
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0076_D32_0B02
scr_seq_0076_D32_045C:
	npc_msg 31
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 347, 255, 0
	scrcmd_751 348, 255, 1
	scrcmd_751 349, 255, 2
	scrcmd_751 350, 255, 3
	scrcmd_751 439, 255, 4
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0076_D32_04D1
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0076_D32_0630
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0076_D32_0762
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0076_D32_08C1
	goto scr_seq_0076_D32_0B02

scr_seq_0076_D32_04D1:
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
	gotoif eq, scr_seq_0076_D32_0588
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0076_D32_05A0
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0076_D32_05B8
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0076_D32_05D0
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_0076_D32_05E8
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, scr_seq_0076_D32_0600
	comparevartovalue VAR_SPECIAL_x8008, 6
	gotoif eq, scr_seq_0076_D32_0618
	goto scr_seq_0076_D32_045C

scr_seq_0076_D32_0588:
	setvar VAR_SPECIAL_x8004, 46
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 1
	goto scr_seq_0076_D32_09F3

scr_seq_0076_D32_05A0:
	setvar VAR_SPECIAL_x8004, 49
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 1
	goto scr_seq_0076_D32_09F3

scr_seq_0076_D32_05B8:
	setvar VAR_SPECIAL_x8004, 47
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 1
	goto scr_seq_0076_D32_09F3

scr_seq_0076_D32_05D0:
	setvar VAR_SPECIAL_x8004, 52
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 1
	goto scr_seq_0076_D32_09F3

scr_seq_0076_D32_05E8:
	setvar VAR_SPECIAL_x8004, 48
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 1
	goto scr_seq_0076_D32_09F3

scr_seq_0076_D32_0600:
	setvar VAR_SPECIAL_x8004, 45
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 1
	goto scr_seq_0076_D32_09F3

scr_seq_0076_D32_0618:
	setvar VAR_SPECIAL_x8004, 50
	setvar VAR_SPECIAL_x8005, 48
	setvar VAR_SPECIAL_x8006, 48
	goto scr_seq_0076_D32_09F3

scr_seq_0076_D32_0630:
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
	gotoif eq, scr_seq_0076_D32_06D2
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0076_D32_06EA
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0076_D32_0702
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0076_D32_071A
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_0076_D32_0732
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, scr_seq_0076_D32_074A
	goto scr_seq_0076_D32_045C

scr_seq_0076_D32_06D2:
	setvar VAR_SPECIAL_x8004, 289
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 16
	goto scr_seq_0076_D32_09F3

scr_seq_0076_D32_06EA:
	setvar VAR_SPECIAL_x8004, 290
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 16
	goto scr_seq_0076_D32_09F3

scr_seq_0076_D32_0702:
	setvar VAR_SPECIAL_x8004, 291
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 16
	goto scr_seq_0076_D32_09F3

scr_seq_0076_D32_071A:
	setvar VAR_SPECIAL_x8004, 292
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 16
	goto scr_seq_0076_D32_09F3

scr_seq_0076_D32_0732:
	setvar VAR_SPECIAL_x8004, 293
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 16
	goto scr_seq_0076_D32_09F3

scr_seq_0076_D32_074A:
	setvar VAR_SPECIAL_x8004, 294
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 16
	goto scr_seq_0076_D32_09F3

scr_seq_0076_D32_0762:
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
	gotoif eq, scr_seq_0076_D32_0819
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0076_D32_0831
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0076_D32_0849
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0076_D32_0861
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_0076_D32_0879
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, scr_seq_0076_D32_0891
	comparevartovalue VAR_SPECIAL_x8008, 6
	gotoif eq, scr_seq_0076_D32_08A9
	goto scr_seq_0076_D32_045C

scr_seq_0076_D32_0819:
	setvar VAR_SPECIAL_x8004, 272
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 16
	goto scr_seq_0076_D32_09F3

scr_seq_0076_D32_0831:
	setvar VAR_SPECIAL_x8004, 273
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 16
	goto scr_seq_0076_D32_09F3

scr_seq_0076_D32_0849:
	setvar VAR_SPECIAL_x8004, 214
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 32
	goto scr_seq_0076_D32_09F3

scr_seq_0076_D32_0861:
	setvar VAR_SPECIAL_x8004, 271
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 32
	goto scr_seq_0076_D32_09F3

scr_seq_0076_D32_0879:
	setvar VAR_SPECIAL_x8004, 213
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 48
	goto scr_seq_0076_D32_09F3

scr_seq_0076_D32_0891:
	setvar VAR_SPECIAL_x8004, 230
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 48
	goto scr_seq_0076_D32_09F3

scr_seq_0076_D32_08A9:
	setvar VAR_SPECIAL_x8004, 275
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 48
	goto scr_seq_0076_D32_09F3

scr_seq_0076_D32_08C1:
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
	gotoif eq, scr_seq_0076_D32_0963
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0076_D32_097B
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0076_D32_0993
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0076_D32_09AB
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_0076_D32_09C3
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, scr_seq_0076_D32_09DB
	goto scr_seq_0076_D32_045C

scr_seq_0076_D32_0963:
	setvar VAR_SPECIAL_x8004, 220
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 48
	goto scr_seq_0076_D32_09F3

scr_seq_0076_D32_097B:
	setvar VAR_SPECIAL_x8004, 287
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 48
	goto scr_seq_0076_D32_09F3

scr_seq_0076_D32_0993:
	setvar VAR_SPECIAL_x8004, 232
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 48
	goto scr_seq_0076_D32_09F3

scr_seq_0076_D32_09AB:
	setvar VAR_SPECIAL_x8004, 266
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 48
	goto scr_seq_0076_D32_09F3

scr_seq_0076_D32_09C3:
	setvar VAR_SPECIAL_x8004, 326
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 48
	goto scr_seq_0076_D32_09F3

scr_seq_0076_D32_09DB:
	setvar VAR_SPECIAL_x8004, 327
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 48
	goto scr_seq_0076_D32_09F3

scr_seq_0076_D32_09F3:
	scrcmd_194 0, 32772
	scrcmd_198 1, 32774
	npc_msg 23
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0076_D32_0A24
	comparevartovalue VAR_SPECIAL_x8000, 0
	gotoif eq, scr_seq_0076_D32_0AB1
	goto scr_seq_0076_D32_0F76

scr_seq_0076_D32_0A24:
	scrcmd_557 32774, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0076_D32_0A9B
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0076_D32_0A85
	scrcmd_556 32774
	scrcmd_118 1
	play_se SEQ_SE_DP_REGI
	scrcmd_194 0, 32772
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_195 1, 32780
	npc_msg 26
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8000, 0
	gotoif eq, scr_seq_0076_D32_0AB1
	goto scr_seq_0076_D32_0F76

scr_seq_0076_D32_0A85:
	npc_msg 29
	comparevartovalue VAR_SPECIAL_x8000, 0
	gotoif eq, scr_seq_0076_D32_0AB1
	goto scr_seq_0076_D32_0F76

scr_seq_0076_D32_0A9B:
	npc_msg 27
	comparevartovalue VAR_SPECIAL_x8000, 0
	gotoif eq, scr_seq_0076_D32_0AB1
	goto scr_seq_0076_D32_0F76

scr_seq_0076_D32_0AB1:
	comparevartovalue VAR_SPECIAL_x8007, 0
	gotoif ne, scr_seq_0076_D32_0ACA
	goto scr_seq_0076_D32_04D1

scr_seq_0076_D32_0AC4:
	.byte 0x16, 0x00, 0x38, 0x00, 0x00, 0x00
scr_seq_0076_D32_0ACA:
	comparevartovalue VAR_SPECIAL_x8007, 1
	gotoif ne, scr_seq_0076_D32_0AE3
	goto scr_seq_0076_D32_0630

scr_seq_0076_D32_0ADD:
	.byte 0x16, 0x00, 0x1f
	.byte 0x00, 0x00, 0x00
scr_seq_0076_D32_0AE3:
	comparevartovalue VAR_SPECIAL_x8007, 2
	gotoif ne, scr_seq_0076_D32_0AFC
	goto scr_seq_0076_D32_0762

scr_seq_0076_D32_0AF6:
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
scr_seq_0076_D32_0AFC:
	goto scr_seq_0076_D32_08C1

scr_seq_0076_D32_0B02:
	scrcmd_117
	scrcmd_747
	npc_msg 22
	waitbutton
	closemsg
	releaseall
	scrcmd_784 3, 1
	end

scr_seq_0076_D32_0B15:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_SPECIAL_x8000, 1
	scrcmd_784 3, 0
	scrcmd_116 1, 21, 1
	npc_msg 21
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0076_D32_0B02
scr_seq_0076_D32_0B44:
	npc_msg 30
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 351, 255, 0
	scrcmd_751 352, 255, 1
	scrcmd_751 353, 255, 2
	scrcmd_751 439, 255, 4
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0076_D32_0BA4
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0076_D32_0CFA
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0076_D32_0DEA
	goto scr_seq_0076_D32_0B02

scr_seq_0076_D32_0BA4:
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
	gotoif eq, scr_seq_0076_D32_0C46
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0076_D32_0C64
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0076_D32_0C82
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0076_D32_0CA0
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_0076_D32_0CBE
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, scr_seq_0076_D32_0CDC
	goto scr_seq_0076_D32_0B44

scr_seq_0076_D32_0C46:
	setvar VAR_SPECIAL_x8004, 367
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 40
	setvar VAR_SPECIAL_x8001, 332
	goto scr_seq_0076_D32_0F40

scr_seq_0076_D32_0C64:
	setvar VAR_SPECIAL_x8004, 358
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 40
	setvar VAR_SPECIAL_x8001, 280
	goto scr_seq_0076_D32_0F40

scr_seq_0076_D32_0C82:
	setvar VAR_SPECIAL_x8004, 416
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 40
	setvar VAR_SPECIAL_x8001, 369
	goto scr_seq_0076_D32_0F40

scr_seq_0076_D32_0CA0:
	setvar VAR_SPECIAL_x8004, 408
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 64
	setvar VAR_SPECIAL_x8001, 404
	goto scr_seq_0076_D32_0F40

scr_seq_0076_D32_0CBE:
	setvar VAR_SPECIAL_x8004, 398
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 80
	setvar VAR_SPECIAL_x8001, 444
	goto scr_seq_0076_D32_0F40

scr_seq_0076_D32_0CDC:
	setvar VAR_SPECIAL_x8004, 353
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 80
	setvar VAR_SPECIAL_x8001, 89
	goto scr_seq_0076_D32_0F40

scr_seq_0076_D32_0CFA:
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
	gotoif eq, scr_seq_0076_D32_0D72
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0076_D32_0D90
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0076_D32_0DAE
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0076_D32_0DCC
	goto scr_seq_0076_D32_0B44

scr_seq_0076_D32_0D72:
	setvar VAR_SPECIAL_x8004, 357
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 64
	setvar VAR_SPECIAL_x8001, 247
	goto scr_seq_0076_D32_0F40

scr_seq_0076_D32_0D90:
	setvar VAR_SPECIAL_x8004, 380
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 64
	setvar VAR_SPECIAL_x8001, 412
	goto scr_seq_0076_D32_0F40

scr_seq_0076_D32_0DAE:
	setvar VAR_SPECIAL_x8004, 363
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 80
	setvar VAR_SPECIAL_x8001, 188
	goto scr_seq_0076_D32_0F40

scr_seq_0076_D32_0DCC:
	setvar VAR_SPECIAL_x8004, 386
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 80
	setvar VAR_SPECIAL_x8001, 406
	goto scr_seq_0076_D32_0F40

scr_seq_0076_D32_0DEA:
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
	gotoif eq, scr_seq_0076_D32_0E8C
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0076_D32_0EAA
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0076_D32_0EC8
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0076_D32_0EE6
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_0076_D32_0F04
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, scr_seq_0076_D32_0F22
	goto scr_seq_0076_D32_0B44

scr_seq_0076_D32_0E8C:
	setvar VAR_SPECIAL_x8004, 333
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 32
	setvar VAR_SPECIAL_x8001, 92
	goto scr_seq_0076_D32_0F40

scr_seq_0076_D32_0EAA:
	setvar VAR_SPECIAL_x8004, 400
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 32
	setvar VAR_SPECIAL_x8001, 86
	goto scr_seq_0076_D32_0F40

scr_seq_0076_D32_0EC8:
	setvar VAR_SPECIAL_x8004, 388
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 32
	setvar VAR_SPECIAL_x8001, 261
	goto scr_seq_0076_D32_0F40

scr_seq_0076_D32_0EE6:
	setvar VAR_SPECIAL_x8004, 372
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 32
	setvar VAR_SPECIAL_x8001, 213
	goto scr_seq_0076_D32_0F40

scr_seq_0076_D32_0F04:
	setvar VAR_SPECIAL_x8004, 335
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 48
	setvar VAR_SPECIAL_x8001, 339
	goto scr_seq_0076_D32_0F40

scr_seq_0076_D32_0F22:
	setvar VAR_SPECIAL_x8004, 331
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 48
	setvar VAR_SPECIAL_x8001, 347
	goto scr_seq_0076_D32_0F40

scr_seq_0076_D32_0F40:
	scrcmd_194 0, 32772
	scrcmd_197 1, 32769
	scrcmd_198 2, 32774
	npc_msg 24
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0076_D32_0A24
	comparevartovalue VAR_SPECIAL_x8000, 0
	gotoif eq, scr_seq_0076_D32_0AB1
	goto scr_seq_0076_D32_0F76

scr_seq_0076_D32_0F76:
	comparevartovalue VAR_SPECIAL_x8007, 0
	gotoif ne, scr_seq_0076_D32_0F8F
	goto scr_seq_0076_D32_0BA4

scr_seq_0076_D32_0F89:
	.byte 0x16, 0x00, 0x1f, 0x00, 0x00, 0x00
scr_seq_0076_D32_0F8F:
	comparevartovalue VAR_SPECIAL_x8007, 1
	gotoif ne, scr_seq_0076_D32_0FA8
	goto scr_seq_0076_D32_0CFA

scr_seq_0076_D32_0FA2:
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
scr_seq_0076_D32_0FA8:
	goto scr_seq_0076_D32_0DEA

scr_seq_0076_D32_0FAE:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_649
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	releaseall
	end

scr_seq_0076_D32_0FD6:
	scrcmd_056 3, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 34, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0076_D32_0FEB:
	scrcmd_056 3, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 35, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0076_D32_1000:
	scrcmd_056 3, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 36, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0076_D32_1015:
	scrcmd_056 3, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 37, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0076_D32_102A:
	scrcmd_056 3, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 38, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0076_D32_103F:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 39
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0076_D32_1050:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 40
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0076_D32_1061:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 41
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0076_D32_1072:
	scrcmd_609
	lockall
	scrcmd_600
	apply_movement 255, scr_seq_0076_D32_10B0
	wait_movement
	play_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 276, 0, 25, 9, 2
	fade_screen 6, 1, 1, 0
	wait_fade
	releaseall
	end

scr_seq_0076_D32_10AE:
	.byte 0x00, 0x00

scr_seq_0076_D32_10B0:
	.short 18, 5
	.short 254, 0
scr_seq_0076_D32_10B8:
	scrcmd_609
	lockall
	scrcmd_600
	apply_movement 255, scr_seq_0076_D32_10F4
	wait_movement
	play_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 277, 0, 21, 9, 2
	fade_screen 6, 1, 1, 0
	wait_fade
	releaseall
	end


scr_seq_0076_D32_10F4:
	.short 18, 6
	.short 254, 0
scr_seq_0076_D32_10FC:
	scrcmd_609
	lockall
	scrcmd_600
	apply_movement 255, scr_seq_0076_D32_1138
	wait_movement
	play_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 278, 0, 1, 6, 3
	fade_screen 6, 1, 1, 0
	wait_fade
	releaseall
	end


scr_seq_0076_D32_1138:
	.short 19, 5
	.short 254, 0
scr_seq_0076_D32_1140:
	scrcmd_609
	lockall
	scrcmd_600
	apply_movement 255, scr_seq_0076_D32_117C
	wait_movement
	play_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 275, 0, 1, 7, 3
	fade_screen 6, 1, 1, 0
	wait_fade
	releaseall
	end


scr_seq_0076_D32_117C:
	.short 19, 6
	.short 254, 0
scr_seq_0076_D32_1184:
	end
	.balign 4, 0
