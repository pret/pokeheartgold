#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0048_D24R0211_0071 ; 000
	scrdef scr_seq_0048_D24R0211_0082 ; 001
	scrdef scr_seq_0048_D24R0211_0168 ; 002
	scrdef scr_seq_0048_D24R0211_0016 ; 003
	scrdef scr_seq_0048_D24R0211_0320 ; 004
	scrdef_end

scr_seq_0048_D24R0211_0016:
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_0048_D24R0211_0027
	clearflag FLAG_UNK_189
	end

scr_seq_0048_D24R0211_0027:
	check_badge 2, VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, scr_seq_0048_D24R0211_0065
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, scr_seq_0048_D24R0211_006B
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif eq, scr_seq_0048_D24R0211_006B
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif eq, scr_seq_0048_D24R0211_006B
scr_seq_0048_D24R0211_0065:
	setflag FLAG_HIDE_CAMERON
	end

scr_seq_0048_D24R0211_006B:
	clearflag FLAG_HIDE_CAMERON
	end

scr_seq_0048_D24R0211_0071:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0048_D24R0211_0082:
	scrcmd_609
	lockall
	move_person 0, 25, 0, 30, 0
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0048_D24R0211_0120
	apply_movement 0, scr_seq_0048_D24R0211_0144
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	wait 15, VAR_SPECIAL_x8005
	npc_msg 1
	apply_movement 0, scr_seq_0048_D24R0211_0160
	wait_movement
	npc_msg 2
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 321, 0, 7, 4, 3
	fade_screen 6, 1, 1, 0
	wait_fade
	scrcmd_344 2, 2
	npc_msg 3
	scrcmd_527 4
	npc_msg 5
	buffer_players_name 0
	npc_msg 6
	play_fanfare SEQ_ME_LVUP
	wait_fanfare
	addvar VAR_UNK_403E, 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0048_D24R0211_011E:
	.byte 0x00, 0x00

scr_seq_0048_D24R0211_0120:
	step 62, 1
	step 15, 1
	step 1, 1
	step 75, 1
	step 15, 1
	step 13, 2
	step 14, 2
	step 0, 1
	step_end

scr_seq_0048_D24R0211_0144:
	step 63, 4
	step 16, 4
	step 19, 1
	step 16, 6
	step 18, 1
	step 32, 1
	step_end

scr_seq_0048_D24R0211_0160:
	step 1, 1
	step_end
scr_seq_0048_D24R0211_0168:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0048_D24R0211_0290
	photo_album_is_full VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0048_D24R0211_02A4
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0048_D24R0211_01E1
	apply_movement 255, scr_seq_0048_D24R0211_02B8
	apply_movement 1, scr_seq_0048_D24R0211_0304
	goto scr_seq_0048_D24R0211_022F

scr_seq_0048_D24R0211_01E1:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0048_D24R0211_01FC
	apply_movement 255, scr_seq_0048_D24R0211_02D0
	goto scr_seq_0048_D24R0211_022F

scr_seq_0048_D24R0211_01FC:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0048_D24R0211_021F
	apply_movement 255, scr_seq_0048_D24R0211_02F0
	apply_movement 1, scr_seq_0048_D24R0211_0304
	goto scr_seq_0048_D24R0211_022F

scr_seq_0048_D24R0211_021F:
	apply_movement 255, scr_seq_0048_D24R0211_02DC
	apply_movement 1, scr_seq_0048_D24R0211_0304
scr_seq_0048_D24R0211_022F:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0048_D24R0211_0256
	apply_movement 253, scr_seq_0048_D24R0211_0310
	wait_movement
scr_seq_0048_D24R0211_0256:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0
	wait_fade
	cameron_photo 4
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

scr_seq_0048_D24R0211_0290:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0048_D24R0211_02A4:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end


scr_seq_0048_D24R0211_02B8:
	step 15, 1
	step 12, 2
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

scr_seq_0048_D24R0211_02D0:
	step 12, 3
	step 33, 1
	step_end

scr_seq_0048_D24R0211_02DC:
	step 12, 1
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

scr_seq_0048_D24R0211_02F0:
	step 12, 1
	step 15, 1
	step 12, 3
	step 33, 1
	step_end

scr_seq_0048_D24R0211_0304:
	step 63, 1
	step 32, 1
	step_end

scr_seq_0048_D24R0211_0310:
	step 15, 1
	step 12, 1
	step 1, 1
	step_end
scr_seq_0048_D24R0211_0320:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0048_D24R0211_0290
	photo_album_is_full VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0048_D24R0211_02A4
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0048_D24R0211_0399
	apply_movement 255, scr_seq_0048_D24R0211_02B8
	apply_movement 2, scr_seq_0048_D24R0211_0304
	goto scr_seq_0048_D24R0211_03E7

scr_seq_0048_D24R0211_0399:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0048_D24R0211_03B4
	apply_movement 255, scr_seq_0048_D24R0211_02D0
	goto scr_seq_0048_D24R0211_03E7

scr_seq_0048_D24R0211_03B4:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0048_D24R0211_03D7
	apply_movement 255, scr_seq_0048_D24R0211_02F0
	apply_movement 2, scr_seq_0048_D24R0211_0304
	goto scr_seq_0048_D24R0211_03E7

scr_seq_0048_D24R0211_03D7:
	apply_movement 255, scr_seq_0048_D24R0211_02DC
	apply_movement 2, scr_seq_0048_D24R0211_0304
scr_seq_0048_D24R0211_03E7:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0048_D24R0211_040E
	apply_movement 253, scr_seq_0048_D24R0211_0310
	wait_movement
scr_seq_0048_D24R0211_040E:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0
	wait_fade
	cameron_photo 4
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
	.balign 4, 0
