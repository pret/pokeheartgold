#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D32.h"
#include "msgdata/msg/msg_0100_D32.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D32_000
	scrdef scr_seq_D32_001
	scrdef scr_seq_D32_002
	scrdef scr_seq_D32_003
	scrdef scr_seq_D32_004
	scrdef scr_seq_D32_005
	scrdef scr_seq_D32_006
	scrdef scr_seq_D32_007
	scrdef scr_seq_D32_008
	scrdef scr_seq_D32_009
	scrdef scr_seq_D32_010
	scrdef scr_seq_D32_011
	scrdef scr_seq_D32_012
	scrdef scr_seq_D32_013
	scrdef scr_seq_D32_014
	scrdef scr_seq_D32_015
	scrdef scr_seq_D32_016
	scrdef scr_seq_D32_017
	scrdef scr_seq_D32_018
	scrdef scr_seq_D32_019
	scrdef scr_seq_D32_020
	scrdef scr_seq_D32_021
	scrdef scr_seq_D32_022
	scrdef scr_seq_D32_023
	scrdef scr_seq_D32_024
	scrdef scr_seq_D32_025
	scrdef scr_seq_D32_026
	scrdef scr_seq_D32_027
	scrdef scr_seq_D32_028
	scrdef scr_seq_D32_029
	scrdef scr_seq_D32_030
	scrdef scr_seq_D32_031
	scrdef scr_seq_D32_032
	scrdef scr_seq_D32_033
	scrdef scr_seq_D32_034
	scrdef scr_seq_D32_035
	scrdef scr_seq_D32_036
	scrdef scr_seq_D32_037
	scrdef scr_seq_D32_038
	scrdef_end

scr_seq_D32_037:
	checkflag FLAG_UNK_189
	gotoif FALSE, _00AF
	clearflag FLAG_UNK_189
	end

_00AF:
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif eq, _00D7
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif eq, _00D7
	setflag FLAG_HIDE_CAMERON
	goto _00DB

_00D7:
	setflag FLAG_HIDE_CAMERON
_00DB:
	setflag FLAG_UNK_234
	end

scr_seq_D32_038:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0209
	photo_album_is_full VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _021D
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, _015A
	apply_movement obj_player, _0234
	apply_movement obj_D32_gsmiddleman1_2, _0280
	goto _01A8

_015A:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _0175
	apply_movement obj_player, _024C
	goto _01A8

_0175:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, _0198
	apply_movement obj_player, _026C
	apply_movement obj_D32_gsmiddleman1_2, _0280
	goto _01A8

_0198:
	apply_movement obj_player, _0258
	apply_movement obj_D32_gsmiddleman1_2, _0280
_01A8:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _01CF
	apply_movement obj_partner_poke, _028C
	wait_movement
_01CF:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0x00
	wait_fade
	cameron_photo 31
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

_0209:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

_021D:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end
	.byte 0x00, 0x00, 0x00

_0234:
	step 15, 1
	step 12, 2
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_024C:
	step 12, 3
	step 33, 1
	step_end

_0258:
	step 12, 1
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_026C:
	step 12, 1
	step 15, 1
	step 12, 3
	step 33, 1
	step_end

_0280:
	step 63, 1
	step 32, 1
	step_end

_028C:
	step 15, 1
	step 12, 1
	step 1, 1
	step_end
scr_seq_D32_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0100_D32_00000
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D32_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0100_D32_00001
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D32_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0100_D32_00002
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D32_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0100_D32_00003
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D32_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0100_D32_00004
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D32_006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0100_D32_00005
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D32_007:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0100_D32_00006
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D32_008:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0100_D32_00007
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D32_009:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0100_D32_00008
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D32_010:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0100_D32_00009
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D32_011:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0100_D32_00010
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D32_012:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0100_D32_00011
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D32_013:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0100_D32_00012
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D32_014:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0100_D32_00013
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D32_015:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0100_D32_00014
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D32_016:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0100_D32_00015
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D32_017:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0100_D32_00016
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D32_018:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0100_D32_00017
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D32_019:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0100_D32_00018
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D32_020:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0100_D32_00019
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D32_021:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0100_D32_00020
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D32_022:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_SPECIAL_x8000, 0
	scrcmd_784 3, 0
	scrcmd_116 1, 21, 1
	npc_msg msg_0100_D32_00021
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0B02
_045C:
	npc_msg msg_0100_D32_00031
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 347, 255, 0
	menu_item_add 348, 255, 1
	menu_item_add 349, 255, 2
	menu_item_add 350, 255, 3
	menu_item_add 439, 255, 4
	menu_exec
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, _04D1
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, _0630
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, _0762
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, _08C1
	goto _0B02

_04D1:
	setvar VAR_SPECIAL_x8007, 0
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 354, 396, 0
	menu_item_add 355, 397, 1
	menu_item_add 356, 398, 2
	menu_item_add 357, 399, 3
	menu_item_add 358, 400, 4
	menu_item_add 359, 401, 5
	menu_item_add 379, 402, 6
	menu_item_add 440, 438, 7
	menu_exec
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, _0588
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, _05A0
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, _05B8
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, _05D0
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, _05E8
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, _0600
	comparevartovalue VAR_SPECIAL_x8008, 6
	gotoif eq, _0618
	goto _045C

_0588:
	setvar VAR_SPECIAL_x8004, 46
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 1
	goto _09F3

_05A0:
	setvar VAR_SPECIAL_x8004, 49
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 1
	goto _09F3

_05B8:
	setvar VAR_SPECIAL_x8004, 47
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 1
	goto _09F3

_05D0:
	setvar VAR_SPECIAL_x8004, 52
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 1
	goto _09F3

_05E8:
	setvar VAR_SPECIAL_x8004, 48
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 1
	goto _09F3

_0600:
	setvar VAR_SPECIAL_x8004, 45
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 1
	goto _09F3

_0618:
	setvar VAR_SPECIAL_x8004, 50
	setvar VAR_SPECIAL_x8005, 48
	setvar VAR_SPECIAL_x8006, 48
	goto _09F3

_0630:
	setvar VAR_SPECIAL_x8007, 1
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 360, 403, 0
	menu_item_add 361, 404, 1
	menu_item_add 362, 405, 2
	menu_item_add 363, 406, 3
	menu_item_add 364, 407, 4
	menu_item_add 365, 408, 5
	menu_item_add 440, 438, 6
	menu_exec
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, _06D2
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, _06EA
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, _0702
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, _071A
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, _0732
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, _074A
	goto _045C

_06D2:
	setvar VAR_SPECIAL_x8004, 289
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 16
	goto _09F3

_06EA:
	setvar VAR_SPECIAL_x8004, 290
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 16
	goto _09F3

_0702:
	setvar VAR_SPECIAL_x8004, 291
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 16
	goto _09F3

_071A:
	setvar VAR_SPECIAL_x8004, 292
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 16
	goto _09F3

_0732:
	setvar VAR_SPECIAL_x8004, 293
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 16
	goto _09F3

_074A:
	setvar VAR_SPECIAL_x8004, 294
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 16
	goto _09F3

_0762:
	setvar VAR_SPECIAL_x8007, 2
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 366, 409, 0
	menu_item_add 367, 410, 1
	menu_item_add 368, 411, 2
	menu_item_add 369, 412, 3
	menu_item_add 370, 413, 4
	menu_item_add 372, 415, 5
	menu_item_add 375, 418, 6
	menu_item_add 440, 438, 7
	menu_exec
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, _0819
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, _0831
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, _0849
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, _0861
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, _0879
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, _0891
	comparevartovalue VAR_SPECIAL_x8008, 6
	gotoif eq, _08A9
	goto _045C

_0819:
	setvar VAR_SPECIAL_x8004, 272
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 16
	goto _09F3

_0831:
	setvar VAR_SPECIAL_x8004, 273
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 16
	goto _09F3

_0849:
	setvar VAR_SPECIAL_x8004, 214
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 32
	goto _09F3

_0861:
	setvar VAR_SPECIAL_x8004, 271
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 32
	goto _09F3

_0879:
	setvar VAR_SPECIAL_x8004, 213
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 48
	goto _09F3

_0891:
	setvar VAR_SPECIAL_x8004, 230
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 48
	goto _09F3

_08A9:
	setvar VAR_SPECIAL_x8004, 275
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 48
	goto _09F3

_08C1:
	setvar VAR_SPECIAL_x8007, 3
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 371, 414, 0
	menu_item_add 376, 419, 1
	menu_item_add 373, 416, 2
	menu_item_add 374, 417, 3
	menu_item_add 377, 420, 4
	menu_item_add 378, 421, 5
	menu_item_add 440, 438, 7
	menu_exec
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, _0963
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, _097B
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, _0993
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, _09AB
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, _09C3
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, _09DB
	goto _045C

_0963:
	setvar VAR_SPECIAL_x8004, 220
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 48
	goto _09F3

_097B:
	setvar VAR_SPECIAL_x8004, 287
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 48
	goto _09F3

_0993:
	setvar VAR_SPECIAL_x8004, 232
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 48
	goto _09F3

_09AB:
	setvar VAR_SPECIAL_x8004, 266
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 48
	goto _09F3

_09C3:
	setvar VAR_SPECIAL_x8004, 326
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 48
	goto _09F3

_09DB:
	setvar VAR_SPECIAL_x8004, 327
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 48
	goto _09F3

_09F3:
	buffer_item_name 0, VAR_SPECIAL_x8004
	buffer_int 1, VAR_SPECIAL_x8006
	npc_msg msg_0100_D32_00023
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0A24
	comparevartovalue VAR_SPECIAL_x8000, 0
	gotoif eq, _0AB1
	goto _0F76

_0A24:
	scrcmd_557 32774, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0A9B
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0A85
	scrcmd_556 32774
	scrcmd_118 1
	play_se SEQ_SE_DP_REGI
	buffer_item_name 0, VAR_SPECIAL_x8004
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	buffer_pocket_name 1, VAR_SPECIAL_x800C
	npc_msg msg_0100_D32_00026
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8000, 0
	gotoif eq, _0AB1
	goto _0F76

_0A85:
	npc_msg msg_0100_D32_00029
	comparevartovalue VAR_SPECIAL_x8000, 0
	gotoif eq, _0AB1
	goto _0F76

_0A9B:
	npc_msg msg_0100_D32_00027
	comparevartovalue VAR_SPECIAL_x8000, 0
	gotoif eq, _0AB1
	goto _0F76

_0AB1:
	comparevartovalue VAR_SPECIAL_x8007, 0
	gotoif ne, _0ACA
	goto _04D1
	.byte 0x16, 0x00, 0x38, 0x00, 0x00, 0x00
_0ACA:
	comparevartovalue VAR_SPECIAL_x8007, 1
	gotoif ne, _0AE3
	goto _0630
	.byte 0x16, 0x00, 0x1f
	.byte 0x00, 0x00, 0x00
_0AE3:
	comparevartovalue VAR_SPECIAL_x8007, 2
	gotoif ne, _0AFC
	goto _0762
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
_0AFC:
	goto _08C1

_0B02:
	scrcmd_117
	touchscreen_menu_show
	npc_msg msg_0100_D32_00022
	waitbutton
	closemsg
	releaseall
	scrcmd_784 3, 1
	end

scr_seq_D32_024:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_SPECIAL_x8000, 1
	scrcmd_784 3, 0
	scrcmd_116 1, 21, 1
	npc_msg msg_0100_D32_00021
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0B02
_0B44:
	npc_msg msg_0100_D32_00030
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 351, 255, 0
	menu_item_add 352, 255, 1
	menu_item_add 353, 255, 2
	menu_item_add 439, 255, 4
	menu_exec
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, _0BA4
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, _0CFA
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, _0DEA
	goto _0B02

_0BA4:
	setvar VAR_SPECIAL_x8007, 0
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 380, 422, 0
	menu_item_add 381, 423, 1
	menu_item_add 382, 424, 2
	menu_item_add 383, 425, 3
	menu_item_add 384, 426, 4
	menu_item_add 385, 427, 5
	menu_item_add 440, 438, 6
	menu_exec
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, _0C46
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, _0C64
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, _0C82
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, _0CA0
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, _0CBE
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, _0CDC
	goto _0B44

_0C46:
	setvar VAR_SPECIAL_x8004, 367
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 40
	setvar VAR_SPECIAL_x8001, 332
	goto _0F40

_0C64:
	setvar VAR_SPECIAL_x8004, 358
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 40
	setvar VAR_SPECIAL_x8001, 280
	goto _0F40

_0C82:
	setvar VAR_SPECIAL_x8004, 416
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 40
	setvar VAR_SPECIAL_x8001, 369
	goto _0F40

_0CA0:
	setvar VAR_SPECIAL_x8004, 408
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 64
	setvar VAR_SPECIAL_x8001, 404
	goto _0F40

_0CBE:
	setvar VAR_SPECIAL_x8004, 398
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 80
	setvar VAR_SPECIAL_x8001, 444
	goto _0F40

_0CDC:
	setvar VAR_SPECIAL_x8004, 353
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 80
	setvar VAR_SPECIAL_x8001, 89
	goto _0F40

_0CFA:
	setvar VAR_SPECIAL_x8007, 1
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 386, 428, 0
	menu_item_add 387, 429, 1
	menu_item_add 388, 430, 2
	menu_item_add 389, 431, 3
	menu_item_add 440, 438, 4
	menu_exec
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, _0D72
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, _0D90
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, _0DAE
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, _0DCC
	goto _0B44

_0D72:
	setvar VAR_SPECIAL_x8004, 357
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 64
	setvar VAR_SPECIAL_x8001, 247
	goto _0F40

_0D90:
	setvar VAR_SPECIAL_x8004, 380
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 64
	setvar VAR_SPECIAL_x8001, 412
	goto _0F40

_0DAE:
	setvar VAR_SPECIAL_x8004, 363
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 80
	setvar VAR_SPECIAL_x8001, 188
	goto _0F40

_0DCC:
	setvar VAR_SPECIAL_x8004, 386
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 80
	setvar VAR_SPECIAL_x8001, 406
	goto _0F40

_0DEA:
	setvar VAR_SPECIAL_x8007, 2
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 390, 432, 0
	menu_item_add 391, 433, 1
	menu_item_add 392, 434, 2
	menu_item_add 393, 435, 3
	menu_item_add 394, 436, 4
	menu_item_add 395, 437, 5
	menu_item_add 440, 438, 6
	menu_exec
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, _0E8C
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, _0EAA
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, _0EC8
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, _0EE6
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, _0F04
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, _0F22
	goto _0B44

_0E8C:
	setvar VAR_SPECIAL_x8004, 333
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 32
	setvar VAR_SPECIAL_x8001, 92
	goto _0F40

_0EAA:
	setvar VAR_SPECIAL_x8004, 400
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 32
	setvar VAR_SPECIAL_x8001, 86
	goto _0F40

_0EC8:
	setvar VAR_SPECIAL_x8004, 388
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 32
	setvar VAR_SPECIAL_x8001, 261
	goto _0F40

_0EE6:
	setvar VAR_SPECIAL_x8004, 372
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 32
	setvar VAR_SPECIAL_x8001, 213
	goto _0F40

_0F04:
	setvar VAR_SPECIAL_x8004, 335
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 48
	setvar VAR_SPECIAL_x8001, 339
	goto _0F40

_0F22:
	setvar VAR_SPECIAL_x8004, 331
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 48
	setvar VAR_SPECIAL_x8001, 347
	goto _0F40

_0F40:
	buffer_item_name 0, VAR_SPECIAL_x8004
	buffer_move_name 1, VAR_SPECIAL_x8001
	buffer_int 2, VAR_SPECIAL_x8006
	npc_msg msg_0100_D32_00024
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0A24
	comparevartovalue VAR_SPECIAL_x8000, 0
	gotoif eq, _0AB1
	goto _0F76

_0F76:
	comparevartovalue VAR_SPECIAL_x8007, 0
	gotoif ne, _0F8F
	goto _0BA4
	.byte 0x16, 0x00, 0x1f, 0x00, 0x00, 0x00
_0F8F:
	comparevartovalue VAR_SPECIAL_x8007, 1
	gotoif ne, _0FA8
	goto _0CFA
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
_0FA8:
	goto _0DEA

scr_seq_D32_023:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_649
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
	releaseall
	end

scr_seq_D32_025:
	scrcmd_056 3, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 34, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_D32_026:
	scrcmd_056 3, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 35, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_D32_027:
	scrcmd_056 3, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 36, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_D32_028:
	scrcmd_056 3, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 37, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_D32_029:
	scrcmd_056 3, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 38, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_D32_030:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0100_D32_00039
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D32_031:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0100_D32_00040
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D32_032:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0100_D32_00041
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D32_033:
	scrcmd_609
	lockall
	scrcmd_600
	apply_movement obj_player, _10B0
	wait_movement
	play_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_176 276, 0, 25, 9, 2
	fade_screen 6, 1, 1, 0x00
	wait_fade
	releaseall
	end
	.byte 0x00, 0x00

_10B0:
	step 18, 5
	step_end
scr_seq_D32_034:
	scrcmd_609
	lockall
	scrcmd_600
	apply_movement obj_player, _10F4
	wait_movement
	play_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_176 277, 0, 21, 9, 2
	fade_screen 6, 1, 1, 0x00
	wait_fade
	releaseall
	end


_10F4:
	step 18, 6
	step_end
scr_seq_D32_035:
	scrcmd_609
	lockall
	scrcmd_600
	apply_movement obj_player, _1138
	wait_movement
	play_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_176 278, 0, 1, 6, 3
	fade_screen 6, 1, 1, 0x00
	wait_fade
	releaseall
	end


_1138:
	step 19, 5
	step_end
scr_seq_D32_036:
	scrcmd_609
	lockall
	scrcmd_600
	apply_movement obj_player, _117C
	wait_movement
	play_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_176 275, 0, 1, 7, 3
	fade_screen 6, 1, 1, 0x00
	wait_fade
	releaseall
	end


_117C:
	step 19, 6
	step_end
scr_seq_D32_000:
	end
	.balign 4, 0
