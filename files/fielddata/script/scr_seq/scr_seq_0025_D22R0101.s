#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0025_D22R0101_0341 ; 000
	scrdef scr_seq_0025_D22R0101_0694 ; 001
	scrdef scr_seq_0025_D22R0101_06A9 ; 002
	scrdef scr_seq_0025_D22R0101_06BE ; 003
	scrdef scr_seq_0025_D22R0101_06D3 ; 004
	scrdef scr_seq_0025_D22R0101_06E6 ; 005
	scrdef scr_seq_0025_D22R0101_06F9 ; 006
	scrdef scr_seq_0025_D22R0101_070C ; 007
	scrdef scr_seq_0025_D22R0101_071F ; 008
	scrdef scr_seq_0025_D22R0101_0732 ; 009
	scrdef scr_seq_0025_D22R0101_0745 ; 010
	scrdef scr_seq_0025_D22R0101_006E ; 011
	scrdef scr_seq_0025_D22R0101_01CF ; 012
	scrdef scr_seq_0025_D22R0101_01E2 ; 013
	scrdef scr_seq_0025_D22R0101_01F5 ; 014
	scrdef scr_seq_0025_D22R0101_0208 ; 015
	scrdef scr_seq_0025_D22R0101_021B ; 016
	scrdef scr_seq_0025_D22R0101_022E ; 017
	scrdef scr_seq_0025_D22R0101_0241 ; 018
	scrdef scr_seq_0025_D22R0101_0254 ; 019
	scrdef scr_seq_0025_D22R0101_0267 ; 020
	scrdef scr_seq_0025_D22R0101_027A ; 021
	scrdef scr_seq_0025_D22R0101_028D ; 022
	scrdef scr_seq_0025_D22R0101_0395 ; 023
	scrdef scr_seq_0025_D22R0101_0528 ; 024
	scrdef scr_seq_0025_D22R0101_00E3 ; 025
	scrdef scr_seq_0025_D22R0101_02A0 ; 026
	scrdef_end

scr_seq_0025_D22R0101_006E:
	comparevartovalue VAR_UNK_40F7, 1
	callif eq, scr_seq_0025_D22R0101_007D
	end

scr_seq_0025_D22R0101_007D:
	move_person 20, 51, 0, 48, 1
	setvar VAR_TEMP_x4000, 0
	setvar VAR_TEMP_x4001, 10
	setvar VAR_TEMP_x4002, 48
	scrcmd_784 1, 0
scr_seq_0025_D22R0101_009F:
	scrcmd_790 16384, 16388
	comparevartovalue VAR_TEMP_x4004, 1
	gotoif ne, scr_seq_0025_D22R0101_00C4
	move_person VAR_TEMP_x4001, VAR_TEMP_x4002, 0, 50, 0
	addvar VAR_TEMP_x4002, 2
scr_seq_0025_D22R0101_00C4:
	addvar VAR_TEMP_x4000, 1
	addvar VAR_TEMP_x4001, 1
	comparevartovalue VAR_TEMP_x4000, 10
	gotoif lt, scr_seq_0025_D22R0101_009F
	scrcmd_784 1, 1
	return

scr_seq_0025_D22R0101_00E3:
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_0025_D22R0101_00F4
	clearflag FLAG_UNK_189
	end

scr_seq_0025_D22R0101_00F4:
	comparevartovalue VAR_UNK_40F7, 1
	gotoif eq, scr_seq_0025_D22R0101_0162
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, scr_seq_0025_D22R0101_0154
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif eq, scr_seq_0025_D22R0101_0154
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif eq, scr_seq_0025_D22R0101_0162
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif eq, scr_seq_0025_D22R0101_0162
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif eq, scr_seq_0025_D22R0101_0162
	setflag FLAG_HIDE_CAMERON
	clearflag FLAG_UNK_27F
	goto scr_seq_0025_D22R0101_016E

scr_seq_0025_D22R0101_0154:
	clearflag FLAG_HIDE_CAMERON
	setflag FLAG_UNK_27F
	goto scr_seq_0025_D22R0101_016E

scr_seq_0025_D22R0101_0162:
	setflag FLAG_HIDE_CAMERON
	setflag FLAG_UNK_27F
	clearflag FLAG_UNK_996
scr_seq_0025_D22R0101_016E:
	checkflag FLAG_GAME_CLEAR
	gotoif TRUE, scr_seq_0025_D22R0101_017F
	setflag FLAG_UNK_288
	end

scr_seq_0025_D22R0101_017F:
	get_phone_book_rematch 34, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_0025_D22R0101_01C9
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, scr_seq_0025_D22R0101_01C3
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif eq, scr_seq_0025_D22R0101_01C3
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif eq, scr_seq_0025_D22R0101_01C3
	setflag FLAG_UNK_288
	end

scr_seq_0025_D22R0101_01C3:
	clearflag FLAG_UNK_288
	end

scr_seq_0025_D22R0101_01C9:
	setflag FLAG_UNK_288
	end

scr_seq_0025_D22R0101_01CF:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 45
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0025_D22R0101_01E2:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 48
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0025_D22R0101_01F5:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 51
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0025_D22R0101_0208:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 54
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0025_D22R0101_021B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 57
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0025_D22R0101_022E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 60
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0025_D22R0101_0241:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 63
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0025_D22R0101_0254:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 66
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0025_D22R0101_0267:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 69
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0025_D22R0101_027A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 72
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0025_D22R0101_028D:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 42
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0025_D22R0101_02A0:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif eq, scr_seq_0025_D22R0101_02C7
	buffer_players_name 0
	npc_msg 84
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0025_D22R0101_02C7:
	buffer_players_name 0
	npc_msg 85
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0025_D22R0101_032B
	photo_album_is_full VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0025_D22R0101_0336
	npc_msg 86
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
	npc_msg 87
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0025_D22R0101_032B:
	npc_msg 88
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0025_D22R0101_0336:
	npc_msg 89
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0025_D22R0101_0341:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_10E
	gotoif TRUE, scr_seq_0025_D22R0101_0380
	npc_msg 2
	setvar VAR_SPECIAL_x8004, 217
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0025_D22R0101_038B
	callstd std_give_item_verbose
	setflag FLAG_UNK_10E
scr_seq_0025_D22R0101_0380:
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0025_D22R0101_038B:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

scr_seq_0025_D22R0101_0395:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0025_D22R0101_0650
	photo_album_is_full VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0025_D22R0101_0664
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0025_D22R0101_040E
	apply_movement 255, scr_seq_0025_D22R0101_04C0
	apply_movement 26, scr_seq_0025_D22R0101_050C
	goto scr_seq_0025_D22R0101_045C

scr_seq_0025_D22R0101_040E:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0025_D22R0101_0429
	apply_movement 255, scr_seq_0025_D22R0101_04D8
	goto scr_seq_0025_D22R0101_045C

scr_seq_0025_D22R0101_0429:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0025_D22R0101_044C
	apply_movement 255, scr_seq_0025_D22R0101_04F8
	apply_movement 26, scr_seq_0025_D22R0101_050C
	goto scr_seq_0025_D22R0101_045C

scr_seq_0025_D22R0101_044C:
	apply_movement 255, scr_seq_0025_D22R0101_04E4
	apply_movement 26, scr_seq_0025_D22R0101_050C
scr_seq_0025_D22R0101_045C:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0025_D22R0101_0483
	apply_movement 253, scr_seq_0025_D22R0101_0518
	wait_movement
scr_seq_0025_D22R0101_0483:
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

scr_seq_0025_D22R0101_04BD:
	.byte 0x00, 0x00, 0x00

scr_seq_0025_D22R0101_04C0:
	step 15, 1
	step 12, 2
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

scr_seq_0025_D22R0101_04D8:
	step 12, 3
	step 33, 1
	step_end

scr_seq_0025_D22R0101_04E4:
	step 12, 1
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

scr_seq_0025_D22R0101_04F8:
	step 12, 1
	step 15, 1
	step 12, 3
	step 33, 1
	step_end

scr_seq_0025_D22R0101_050C:
	step 63, 1
	step 32, 1
	step_end

scr_seq_0025_D22R0101_0518:
	step 15, 1
	step 12, 1
	step 1, 1
	step_end
scr_seq_0025_D22R0101_0528:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0025_D22R0101_0650
	photo_album_is_full VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0025_D22R0101_0664
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0025_D22R0101_05A1
	apply_movement 255, scr_seq_0025_D22R0101_04C0
	apply_movement 27, scr_seq_0025_D22R0101_050C
	goto scr_seq_0025_D22R0101_05EF

scr_seq_0025_D22R0101_05A1:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0025_D22R0101_05BC
	apply_movement 255, scr_seq_0025_D22R0101_04D8
	goto scr_seq_0025_D22R0101_05EF

scr_seq_0025_D22R0101_05BC:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0025_D22R0101_05DF
	apply_movement 255, scr_seq_0025_D22R0101_0678
	apply_movement 27, scr_seq_0025_D22R0101_050C
	goto scr_seq_0025_D22R0101_05EF

scr_seq_0025_D22R0101_05DF:
	apply_movement 255, scr_seq_0025_D22R0101_04E4
	apply_movement 27, scr_seq_0025_D22R0101_050C
scr_seq_0025_D22R0101_05EF:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0025_D22R0101_0616
	apply_movement 253, scr_seq_0025_D22R0101_0518
	wait_movement
scr_seq_0025_D22R0101_0616:
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

scr_seq_0025_D22R0101_0650:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0025_D22R0101_0664:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end


scr_seq_0025_D22R0101_0678:
	step 13, 1
	step 15, 2
	step 12, 2
	step 14, 1
	step 12, 2
	step 33, 1
	step_end
scr_seq_0025_D22R0101_0694:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 22, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0025_D22R0101_06A9:
	scrcmd_056 3, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 23, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0025_D22R0101_06BE:
	scrcmd_056 3, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 24, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0025_D22R0101_06D3:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0025_D22R0101_06E6:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0025_D22R0101_06F9:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0025_D22R0101_070C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0025_D22R0101_071F:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0025_D22R0101_0732:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0025_D22R0101_0745:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 8
	scrcmd_076 53, 0
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0025_D22R0101_0760:
	.byte 0x02, 0x00, 0x00, 0x00
	.balign 4, 0
