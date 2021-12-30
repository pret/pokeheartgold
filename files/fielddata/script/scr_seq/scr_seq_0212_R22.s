#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0212_R22_045C ; 000
	scrdef scr_seq_0212_R22_0016 ; 001
	scrdef scr_seq_0212_R22_0614 ; 002
	scrdef scr_seq_0212_R22_0099 ; 003
	scrdef scr_seq_0212_R22_0064 ; 004
	scrdef_end

scr_seq_0212_R22_0016:
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_0212_R22_0027
	clearflag FLAG_UNK_189
	end

scr_seq_0212_R22_0027:
	comparevartovalue VAR_UNK_40FE, 1
	gotoif eq, scr_seq_0212_R22_005E
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif eq, scr_seq_0212_R22_0058
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, scr_seq_0212_R22_0058
	setflag FLAG_HIDE_CAMERON
	end

scr_seq_0212_R22_0058:
	clearflag FLAG_HIDE_CAMERON
	end

scr_seq_0212_R22_005E:
	setflag FLAG_HIDE_CAMERON
	end

scr_seq_0212_R22_0064:
	comparevartovalue VAR_UNK_40FE, 1
	gotoif eq, scr_seq_0212_R22_0073
	end

scr_seq_0212_R22_0073:
	move_person 1, 947, 1, 266, 2
	move_person 2, 950, 1, 266, 2
	move_person 3, 952, 1, 280, 3
	end

scr_seq_0212_R22_0099:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0212_R22_037C
	wait_movement
	apply_movement 3, scr_seq_0212_R22_02CC
	wait_movement
	gender_msgbox 12, 11
	closemsg
	apply_movement 3, scr_seq_0212_R22_02E0
	wait_movement
	buffer_players_name 0
	gender_msgbox 14, 13
	closemsg
	apply_movement 3, scr_seq_0212_R22_02FC
	wait_movement
	gender_msgbox 16, 15
	closemsg
	apply_movement 3, scr_seq_0212_R22_0304
	apply_movement 255, scr_seq_0212_R22_03D0
	wait_movement
	gender_msgbox 18, 17
	closemsg
	apply_movement 3, scr_seq_0212_R22_0338
	wait_movement
	buffer_players_name 0
	gender_msgbox 20, 19
	closemsg
	apply_movement 255, scr_seq_0212_R22_03A0
	apply_movement 3, scr_seq_0212_R22_0310
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	scrcmd_102 VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	apply_movement 241, scr_seq_0212_R22_03DC
	wait_movement
	fade_out_bgm 0, 30
	apply_movement 2, scr_seq_0212_R22_03F4
	wait_movement
	scrcmd_191 0
	npc_msg 2
	closemsg
	apply_movement 1, scr_seq_0212_R22_0438
	wait_movement
	npc_msg 8
	closemsg
	apply_movement 2, scr_seq_0212_R22_03FC
	wait_movement
	scrcmd_191 0
	npc_msg 3
	closemsg
	apply_movement 1, scr_seq_0212_R22_0444
	wait_movement
	npc_msg 9
	closemsg
	apply_movement 2, scr_seq_0212_R22_03F4
	wait_movement
	scrcmd_191 0
	npc_msg 4
	closemsg
	apply_movement 1, scr_seq_0212_R22_044C
	wait_movement
	npc_msg 10
	closemsg
	apply_movement 1, scr_seq_0212_R22_0454
	wait_movement
	apply_movement 2, scr_seq_0212_R22_03F4
	wait_movement
	scrcmd_191 0
	npc_msg 5
	closemsg
	apply_movement 2, scr_seq_0212_R22_03F4
	wait_movement
	npc_msg 6
	closemsg
	callstd std_play_rival_intro_music
	apply_movement 241, scr_seq_0212_R22_03E8
	apply_movement 2, scr_seq_0212_R22_0404
	wait_movement
	scrcmd_103
	scrcmd_191 0
	npc_msg 7
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 56
	apply_movement 2, scr_seq_0212_R22_0420
	play_se SEQ_SE_DP_WALL_HIT2
	apply_movement 255, scr_seq_0212_R22_03B0
	apply_movement 3, scr_seq_0212_R22_03D0
	wait_movement
	apply_movement 2, scr_seq_0212_R22_042C
	apply_movement 255, scr_seq_0212_R22_03D0
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	hide_person 1
	hide_person 2
	setflag FLAG_UNK_301
	callstd 2032
	gender_msgbox 22, 21
	closemsg
	fade_out_bgm 20, 30
	apply_movement 253, scr_seq_0212_R22_0350
	wait_movement
	play_se SEQ_SE_GS_SUZUSYUTUGEN_HO
	fade_screen 6, 6, 0, 32767
	wait_fade
	wait 15, VAR_SPECIAL_x800C
	fade_screen 6, 6, 1, 32767
	wait_fade
	apply_movement 255, scr_seq_0212_R22_03C4
	apply_movement 3, scr_seq_0212_R22_0320
	wait_movement
	gender_msgbox 24, 23
	closemsg
	play_se SEQ_SE_GS_TIMESLIP
	scrcmd_810
	setvar VAR_UNK_40FE, 2
	clearflag FLAG_UNK_303
	clearflag FLAG_UNK_311
	scrcmd_176 298, 0, 6, 8, 1
	fade_screen 6, 15, 1, 32767
	wait_fade
	releaseall
	end

scr_seq_0212_R22_02C9:
	.byte 0x00, 0x00, 0x00

scr_seq_0212_R22_02CC:
	step 75, 1
	step 63, 1
	step 35, 1
	step 65, 1
	step_end

scr_seq_0212_R22_02E0:
	step 16, 2
	step 63, 1
	step 34, 1
	step 65, 1
	step 35, 1
	step 65, 1
	step_end

scr_seq_0212_R22_02FC:
	step 13, 1
	step_end

scr_seq_0212_R22_0304:
	step 13, 1
	step 35, 1
	step_end

scr_seq_0212_R22_0310:
	step 12, 2
	step 14, 2
	step 12, 1
	step_end

scr_seq_0212_R22_0320:
	step 34, 1
	step 65, 1
	step 35, 1
	step 65, 1
	step 33, 1
	step_end

scr_seq_0212_R22_0338:
	step 75, 1
	step 63, 1
	step 12, 2
	step 15, 1
	step 12, 2
	step_end

scr_seq_0212_R22_0350:
	step 1, 1
	step 57, 1
	step 71, 1
	step 52, 1
	step 71, 1
	step_end
	.byte 0x47, 0x00, 0x01, 0x00, 0x13, 0x00, 0x02, 0x00
	.byte 0x48, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00

scr_seq_0212_R22_037C:
	step 32, 1
	step 12, 1
	step 63, 1
	step 34, 1
	step 65, 1
	step 35, 1
	step 65, 1
	step 32, 1
	step_end

scr_seq_0212_R22_03A0:
	step 12, 5
	step 14, 2
	step 12, 2
	step_end

scr_seq_0212_R22_03B0:
	step 62, 1
	step 71, 1
	step 53, 1
	step 72, 1
	step_end

scr_seq_0212_R22_03C4:
	step 75, 1
	step 63, 1
	step_end

scr_seq_0212_R22_03D0:
	step 65, 1
	step 33, 1
	step_end

scr_seq_0212_R22_03DC:
	step 12, 5
	step 14, 2
	step_end

scr_seq_0212_R22_03E8:
	step 19, 2
	step 17, 4
	step_end

scr_seq_0212_R22_03F4:
	step 14, 1
	step_end

scr_seq_0212_R22_03FC:
	step 34, 1
	step_end

scr_seq_0212_R22_0404:
	step 66, 1
	step 19, 6
	step 17, 4
	step 63, 1
	step 75, 1
	step 63, 1
	step_end

scr_seq_0212_R22_0420:
	step 17, 2
	step 65, 1
	step_end

scr_seq_0212_R22_042C:
	step 19, 1
	step 17, 8
	step_end

scr_seq_0212_R22_0438:
	step 35, 1
	step 63, 1
	step_end

scr_seq_0212_R22_0444:
	step 35, 1
	step_end

scr_seq_0212_R22_044C:
	step 34, 1
	step_end

scr_seq_0212_R22_0454:
	step 14, 6
	step_end
scr_seq_0212_R22_045C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0212_R22_0584
	photo_album_is_full VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0212_R22_0598
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0212_R22_04D5
	apply_movement 255, scr_seq_0212_R22_05AC
	apply_movement 0, scr_seq_0212_R22_05F8
	goto scr_seq_0212_R22_0523

scr_seq_0212_R22_04D5:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0212_R22_04F0
	apply_movement 255, scr_seq_0212_R22_05C4
	goto scr_seq_0212_R22_0523

scr_seq_0212_R22_04F0:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0212_R22_0513
	apply_movement 255, scr_seq_0212_R22_05E4
	apply_movement 0, scr_seq_0212_R22_05F8
	goto scr_seq_0212_R22_0523

scr_seq_0212_R22_0513:
	apply_movement 255, scr_seq_0212_R22_05D0
	apply_movement 0, scr_seq_0212_R22_05F8
scr_seq_0212_R22_0523:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0212_R22_054A
	apply_movement 253, scr_seq_0212_R22_0604
	wait_movement
scr_seq_0212_R22_054A:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0
	wait_fade
	cameron_photo 71
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

scr_seq_0212_R22_0584:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0212_R22_0598:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end


scr_seq_0212_R22_05AC:
	step 15, 1
	step 12, 2
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

scr_seq_0212_R22_05C4:
	step 12, 3
	step 33, 1
	step_end

scr_seq_0212_R22_05D0:
	step 12, 1
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

scr_seq_0212_R22_05E4:
	step 12, 1
	step 15, 1
	step 12, 3
	step 33, 1
	step_end

scr_seq_0212_R22_05F8:
	step 63, 1
	step 32, 1
	step_end

scr_seq_0212_R22_0604:
	step 15, 1
	step 12, 1
	step 1, 1
	step_end
scr_seq_0212_R22_0614:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 0, VAR_SPECIAL_x800C
	callstd 2000
	end
	.balign 4, 0
