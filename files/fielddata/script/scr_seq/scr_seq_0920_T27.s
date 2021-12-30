#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0920_T27_0046 ; 000
	scrdef scr_seq_0920_T27_0390 ; 001
	scrdef scr_seq_0920_T27_03A7 ; 002
	scrdef scr_seq_0920_T27_03BC ; 003
	scrdef scr_seq_0920_T27_03D1 ; 004
	scrdef scr_seq_0920_T27_00DC ; 005
	scrdef scr_seq_0920_T27_0474 ; 006
	scrdef scr_seq_0920_T27_04B3 ; 007
	scrdef scr_seq_0920_T27_03FB ; 008
	scrdef scr_seq_0920_T27_0422 ; 009
	scrdef scr_seq_0920_T27_044B ; 010
	scrdef scr_seq_0920_T27_04C6 ; 011
	scrdef scr_seq_0920_T27_007A ; 012
	scrdef scr_seq_0920_T27_01FC ; 013
	scrdef scr_seq_0920_T27_020F ; 014
	scrdef scr_seq_0920_T27_0048 ; 015
	scrdef scr_seq_0920_T27_03E6 ; 016
	scrdef_end

scr_seq_0920_T27_0046:
	end

scr_seq_0920_T27_0048:
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_0920_T27_0059
	clearflag FLAG_UNK_189
	end

scr_seq_0920_T27_0059:
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif ne, scr_seq_0920_T27_0074
	clearflag FLAG_HIDE_CAMERON
	goto scr_seq_0920_T27_0078

scr_seq_0920_T27_0074:
	setflag FLAG_HIDE_CAMERON
scr_seq_0920_T27_0078:
	end

scr_seq_0920_T27_007A:
	scrcmd_609
	lockall
	scrcmd_307 11, 5, 25, 23, 1
	scrcmd_310 1
	scrcmd_308 1
	apply_movement 255, scr_seq_0920_T27_00D0
	wait_movement
	lock 253
	scrcmd_596 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0920_T27_00B6
	scrcmd_606
	goto scr_seq_0920_T27_00B8

scr_seq_0920_T27_00B6:
	scrcmd_607
scr_seq_0920_T27_00B8:
	release 253
	setvar VAR_UNK_4079, 0
	scrcmd_311 1
	scrcmd_308 1
	scrcmd_309 1
	releaseall
	end

scr_seq_0920_T27_00CF:
	.byte 0x00

scr_seq_0920_T27_00D0:
	step 17, 2
	step 63, 1
	step_end
scr_seq_0920_T27_00DC:
	scrcmd_609
	lockall
	clearflag FLAG_UNK_23F
	show_person 6
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 56
	apply_movement 6, scr_seq_0920_T27_019C
	apply_movement 255, scr_seq_0920_T27_01B0
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	play_se SEQ_SE_DP_WALL_HIT2
	npc_msg 16
	wait 30, VAR_SPECIAL_x800C
	scrcmd_191 1
	npc_msg 17
	closemsg
	apply_movement 6, scr_seq_0920_T27_01C4
	wait_movement
	buffer_players_name 0
	scrcmd_191 1
	npc_msg 18
	closemsg
	play_se SEQ_SE_DP_WALL_HIT2
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 56
	apply_movement 6, scr_seq_0920_T27_01D4
	apply_movement 255, scr_seq_0920_T27_01B0
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	apply_movement 6, scr_seq_0920_T27_01E0
	apply_movement 255, scr_seq_0920_T27_01F0
	wait_movement
	hide_person 6
	setflag FLAG_UNK_23F
	releaseall
	setvar VAR_UNK_4079, 4
	setvar VAR_UNK_410C, 4
	clearflag FLAG_UNK_23C
	setflag FLAG_UNK_241
	end

scr_seq_0920_T27_0194:
	.byte 0x4b, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00

scr_seq_0920_T27_019C:
	step 71, 1
	step 17, 1
	step 36, 1
	step 72, 1
	step_end

scr_seq_0920_T27_01B0:
	step 0, 1
	step 71, 1
	step 17, 1
	step 72, 1
	step_end

scr_seq_0920_T27_01C4:
	step 75, 1
	step 63, 1
	step 33, 1
	step_end

scr_seq_0920_T27_01D4:
	step 17, 1
	step 37, 1
	step_end

scr_seq_0920_T27_01E0:
	step 10, 3
	step 63, 3
	step 18, 6
	step_end

scr_seq_0920_T27_01F0:
	step 63, 3
	step 34, 1
	step_end
scr_seq_0920_T27_01FC:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 19
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0920_T27_020F:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0920_T27_0314
	photo_album_is_full VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0920_T27_0328
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0920_T27_0288
	apply_movement 255, scr_seq_0920_T27_033C
	apply_movement 8, scr_seq_0920_T27_0374
	goto scr_seq_0920_T27_02B3

scr_seq_0920_T27_0288:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0920_T27_02A3
	apply_movement 255, scr_seq_0920_T27_0354
	goto scr_seq_0920_T27_02B3

scr_seq_0920_T27_02A3:
	apply_movement 255, scr_seq_0920_T27_0360
	apply_movement 8, scr_seq_0920_T27_0374
scr_seq_0920_T27_02B3:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0920_T27_02DA
	apply_movement 253, scr_seq_0920_T27_0380
	wait_movement
scr_seq_0920_T27_02DA:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0
	wait_fade
	cameron_photo 19
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

scr_seq_0920_T27_0314:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0920_T27_0328:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end


scr_seq_0920_T27_033C:
	step 15, 1
	step 12, 2
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

scr_seq_0920_T27_0354:
	step 12, 3
	step 33, 1
	step_end

scr_seq_0920_T27_0360:
	step 12, 1
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

scr_seq_0920_T27_0374:
	step 63, 1
	step 32, 1
	step_end

scr_seq_0920_T27_0380:
	step 15, 1
	step 12, 1
	step 1, 1
	step_end
scr_seq_0920_T27_0390:
	scrcmd_055 11, 0, 18, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0920_T27_03A7:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 12, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0920_T27_03BC:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 13, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0920_T27_03D1:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 14, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0920_T27_03E6:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 15, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0920_T27_03FB:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_96A
	gotoif TRUE, scr_seq_0920_T27_0417
	npc_msg 8
	goto scr_seq_0920_T27_041A

scr_seq_0920_T27_0417:
	npc_msg 9
scr_seq_0920_T27_041A:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0920_T27_0422:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_964
	gotoif TRUE, scr_seq_0920_T27_0440
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0920_T27_0440:
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0920_T27_044B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_410C, 2
	gotoif gt, scr_seq_0920_T27_0469
	npc_msg 2
	goto scr_seq_0920_T27_046C

scr_seq_0920_T27_0469:
	npc_msg 3
scr_seq_0920_T27_046C:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0920_T27_0474:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_964
	gotoif TRUE, scr_seq_0920_T27_04A8
	comparevartovalue VAR_UNK_40A1, 0
	gotoif ne, scr_seq_0920_T27_049D
	npc_msg 5
	goto scr_seq_0920_T27_04A0

scr_seq_0920_T27_049D:
	npc_msg 6
scr_seq_0920_T27_04A0:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0920_T27_04A8:
	npc_msg 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0920_T27_04B3:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0920_T27_04C6:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
