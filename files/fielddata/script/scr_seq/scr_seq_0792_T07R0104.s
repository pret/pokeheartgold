#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0792_T07R0104_0284 ; 000
	scrdef scr_seq_0792_T07R0104_02A0 ; 001
	scrdef scr_seq_0792_T07R0104_02B3 ; 002
	scrdef scr_seq_0792_T07R0104_02C6 ; 003
	scrdef scr_seq_0792_T07R0104_001E ; 004
	scrdef scr_seq_0792_T07R0104_019A ; 005
	scrdef scr_seq_0792_T07R0104_024C ; 006
	scrdef_end

scr_seq_0792_T07R0104_001E:
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_0792_T07R0104_002F
	clearflag FLAG_UNK_189
	end

scr_seq_0792_T07R0104_002F:
	scrcmd_147 18, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0792_T07R0104_0082
	check_badge 12, VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, scr_seq_0792_T07R0104_005B
	goto scr_seq_0792_T07R0104_00C2

scr_seq_0792_T07R0104_005B:
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif ne, scr_seq_0792_T07R0104_007A
	clearflag FLAG_UNK_260
	clearflag FLAG_UNK_2E2
	goto scr_seq_0792_T07R0104_0080

scr_seq_0792_T07R0104_007A:
	goto scr_seq_0792_T07R0104_00C2

scr_seq_0792_T07R0104_0080:
	end

scr_seq_0792_T07R0104_0082:
	get_phone_book_rematch 18, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_0792_T07R0104_00C2
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif ne, scr_seq_0792_T07R0104_00BA
	clearflag FLAG_UNK_260
	setflag FLAG_UNK_2E2
	scrcmd_341 3, 1
	goto scr_seq_0792_T07R0104_00C0

scr_seq_0792_T07R0104_00BA:
	goto scr_seq_0792_T07R0104_00C2

scr_seq_0792_T07R0104_00C0:
	end

scr_seq_0792_T07R0104_00C2:
	setflag FLAG_UNK_260
	setflag FLAG_UNK_2E2
	end

scr_seq_0792_T07R0104_00CC:
	play_se SEQ_SE_DP_SELECT
	lockall
	apply_movement 3, scr_seq_0792_T07R0104_026C
	wait_movement
	npc_msg 0
	closemsg
	apply_movement 4, scr_seq_0792_T07R0104_0274
	wait_movement
	npc_msg 1
	closemsg
	apply_movement 3, scr_seq_0792_T07R0104_026C
	wait_movement
	npc_msg 2
	closemsg
	apply_movement 4, scr_seq_0792_T07R0104_0274
	wait_movement
	npc_msg 3
	closemsg
	apply_movement 3, scr_seq_0792_T07R0104_027C
	wait_movement
	npc_msg 4
scr_seq_0792_T07R0104_011B:
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0792_T07R0104_013F
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, scr_seq_0792_T07R0104_0189
	end

scr_seq_0792_T07R0104_013F:
	npc_msg 5
	register_gear_number 18
	buffer_players_name 0
	npc_msg 6
	play_fanfare SEQ_ME_POKEGEAR_REGIST
	wait_fanfare
	npc_msg 7
	waitbutton
	closemsg
	fade_screen 6, 1, 0, 0x00
	wait_fade
	setflag FLAG_UNK_260
	hide_person 3
	hide_person 4
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 1, 0x00
	wait_fade
	releaseall
	end

scr_seq_0792_T07R0104_0189:
	setvar VAR_TEMP_x4004, 1
	npc_msg 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0792_T07R0104_019A:
	scrcmd_147 18, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0792_T07R0104_01CD
	comparevartovalue VAR_TEMP_x4004, 1
	gotoif ne, scr_seq_0792_T07R0104_00CC
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 9
	goto scr_seq_0792_T07R0104_011B

scr_seq_0792_T07R0104_01CB:
	.byte 0x02, 0x00
scr_seq_0792_T07R0104_01CD:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 10
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0792_T07R0104_0236
	photo_album_is_full VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0792_T07R0104_0241
	npc_msg 11
	closemsg
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0x00
	wait_fade
	cameron_photo 2
	faceplayer
	lockall
	fade_screen 6, 1, 1, 0x00
	wait_fade
	clearflag FLAG_UNK_189
	npc_msg 12
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0792_T07R0104_0236:
	npc_msg 13
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0792_T07R0104_0241:
	npc_msg 14
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0792_T07R0104_024C:
	comparevartovalue VAR_TEMP_x4004, 1
	gotoif ne, scr_seq_0792_T07R0104_00CC
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 15
	waitbutton
	closemsg
	releaseall
	end


scr_seq_0792_T07R0104_026C:
	step 34, 1
	step_end

scr_seq_0792_T07R0104_0274:
	step 35, 1
	step_end

scr_seq_0792_T07R0104_027C:
	step 33, 1
	step_end
scr_seq_0792_T07R0104_0284:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd 2011
	scrcmd_054
	setvar VAR_SPECIAL_x8004, 21
	callstd 2052
	releaseall
	end

scr_seq_0792_T07R0104_02A0:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 16
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0792_T07R0104_02B3:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 17
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0792_T07R0104_02C6:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 18
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
