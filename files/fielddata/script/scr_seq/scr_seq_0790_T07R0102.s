#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0790_T07R0102_0054 ; 000
	scrdef scr_seq_0790_T07R0102_0070 ; 001
	scrdef scr_seq_0790_T07R0102_042C ; 002
	scrdef scr_seq_0790_T07R0102_043F ; 003
	scrdef scr_seq_0790_T07R0102_0452 ; 004
	scrdef scr_seq_0790_T07R0102_0274 ; 005
	scrdef scr_seq_0790_T07R0102_0022 ; 006
	scrdef scr_seq_0790_T07R0102_008C ; 007
	scrdef_end

scr_seq_0790_T07R0102_0022:
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_0790_T07R0102_0033
	clearflag FLAG_UNK_189
	end

scr_seq_0790_T07R0102_0033:
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif ne, scr_seq_0790_T07R0102_004E
	clearflag FLAG_HIDE_CAMERON
	goto scr_seq_0790_T07R0102_0052

scr_seq_0790_T07R0102_004E:
	setflag FLAG_HIDE_CAMERON
scr_seq_0790_T07R0102_0052:
	end

scr_seq_0790_T07R0102_0054:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd 2011
	scrcmd_054
	setvar VAR_SPECIAL_x8004, 18
	callstd 2052
	releaseall
	end

scr_seq_0790_T07R0102_0070:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd 2011
	scrcmd_054
	setvar VAR_SPECIAL_x8004, 19
	callstd 2052
	releaseall
	end

scr_seq_0790_T07R0102_008C:
	play_se SEQ_SE_DP_SELECT
	lockall
	hasitem ITEM_FASHION_CASE, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0790_T07R0102_01DA
	npc_msg 3
	scrcmd_386 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, scr_seq_0790_T07R0102_00C9
	apply_movement 5, scr_seq_0790_T07R0102_01E8
	goto scr_seq_0790_T07R0102_00D1

scr_seq_0790_T07R0102_00C9:
	apply_movement 5, scr_seq_0790_T07R0102_0200
scr_seq_0790_T07R0102_00D1:
	wait_movement
	npc_msg 4
	apply_movement 5, scr_seq_0790_T07R0102_0218
	wait_movement
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_0790_T07R0102_00FB
	apply_movement 5, scr_seq_0790_T07R0102_0220
	goto scr_seq_0790_T07R0102_011E

scr_seq_0790_T07R0102_00FB:
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, scr_seq_0790_T07R0102_0116
	apply_movement 5, scr_seq_0790_T07R0102_0230
	goto scr_seq_0790_T07R0102_011E

scr_seq_0790_T07R0102_0116:
	apply_movement 5, scr_seq_0790_T07R0102_0228
scr_seq_0790_T07R0102_011E:
	wait_movement
	npc_msg 5
	setvar VAR_SPECIAL_x8004, 92
	setvar VAR_SPECIAL_x8005, 1
	callstd 2007
	npc_msg 6
	setvar VAR_SPECIAL_x8004, 93
	setvar VAR_SPECIAL_x8005, 1
	callstd 2007
	npc_msg 7
	setvar VAR_SPECIAL_x8004, 94
	setvar VAR_SPECIAL_x8005, 1
	callstd 2007
	npc_msg 8
	closemsg
	comparevartovalue VAR_TEMP_x4000, 3
	callif eq, scr_seq_0790_T07R0102_01A0
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif ne, scr_seq_0790_T07R0102_0186
	apply_movement 5, scr_seq_0790_T07R0102_0250
	goto scr_seq_0790_T07R0102_018E

scr_seq_0790_T07R0102_0186:
	apply_movement 5, scr_seq_0790_T07R0102_0238
scr_seq_0790_T07R0102_018E:
	wait_movement
	hide_person 5
	setflag FLAG_UNK_313
	clearflag FLAG_UNK_2DF
	releaseall
	end

scr_seq_0790_T07R0102_01A0:
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0790_T07R0102_01D8
	get_person_coords 253, VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	comparevartovalue VAR_SPECIAL_x8005, 5
	gotoif ne, scr_seq_0790_T07R0102_01D8
	release 253
	apply_movement 253, scr_seq_0790_T07R0102_0264
	wait_movement
	lock 253
scr_seq_0790_T07R0102_01D8:
	return

scr_seq_0790_T07R0102_01DA:
	npc_msg 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0790_T07R0102_01E5:
	.byte 0x00, 0x00, 0x00

scr_seq_0790_T07R0102_01E8:
	step 14, 1
	step 32, 1
	step 63, 1
	step 15, 1
	step 32, 1
	step_end

scr_seq_0790_T07R0102_0200:
	step 15, 1
	step 32, 1
	step 63, 1
	step 14, 1
	step 32, 1
	step_end

scr_seq_0790_T07R0102_0218:
	step 75, 1
	step_end

scr_seq_0790_T07R0102_0220:
	step 33, 1
	step_end

scr_seq_0790_T07R0102_0228:
	step 34, 1
	step_end

scr_seq_0790_T07R0102_0230:
	step 35, 1
	step_end

scr_seq_0790_T07R0102_0238:
	step 14, 2
	step 13, 1
	step 14, 4
	step 12, 1
	step 14, 4
	step_end

scr_seq_0790_T07R0102_0250:
	step 13, 1
	step 14, 6
	step 12, 1
	step 14, 4
	step_end

scr_seq_0790_T07R0102_0264:
	step 78, 1
	step 76, 1
	step 1, 1
	step_end
scr_seq_0790_T07R0102_0274:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0790_T07R0102_039C
	photo_album_is_full VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0790_T07R0102_03B0
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0790_T07R0102_02ED
	apply_movement 255, scr_seq_0790_T07R0102_03C4
	apply_movement 4, scr_seq_0790_T07R0102_0410
	goto scr_seq_0790_T07R0102_033B

scr_seq_0790_T07R0102_02ED:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0790_T07R0102_0308
	apply_movement 255, scr_seq_0790_T07R0102_03DC
	goto scr_seq_0790_T07R0102_033B

scr_seq_0790_T07R0102_0308:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0790_T07R0102_032B
	apply_movement 255, scr_seq_0790_T07R0102_03FC
	apply_movement 4, scr_seq_0790_T07R0102_0410
	goto scr_seq_0790_T07R0102_033B

scr_seq_0790_T07R0102_032B:
	apply_movement 255, scr_seq_0790_T07R0102_03E8
	apply_movement 4, scr_seq_0790_T07R0102_0410
scr_seq_0790_T07R0102_033B:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0790_T07R0102_0362
	apply_movement 253, scr_seq_0790_T07R0102_041C
	wait_movement
scr_seq_0790_T07R0102_0362:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0x00
	wait_fade
	cameron_photo 58
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

scr_seq_0790_T07R0102_039C:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0790_T07R0102_03B0:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end


scr_seq_0790_T07R0102_03C4:
	step 15, 1
	step 12, 2
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

scr_seq_0790_T07R0102_03DC:
	step 12, 3
	step 33, 1
	step_end

scr_seq_0790_T07R0102_03E8:
	step 12, 1
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

scr_seq_0790_T07R0102_03FC:
	step 12, 1
	step 15, 1
	step 12, 3
	step 33, 1
	step_end

scr_seq_0790_T07R0102_0410:
	step 63, 1
	step 32, 1
	step_end

scr_seq_0790_T07R0102_041C:
	step 15, 1
	step 12, 1
	step 1, 1
	step_end
scr_seq_0790_T07R0102_042C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0790_T07R0102_043F:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0790_T07R0102_0452:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
