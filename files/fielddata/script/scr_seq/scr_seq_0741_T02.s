#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0741_T02_00AE ; 000
	scrdef scr_seq_0741_T02_00E2 ; 001
	scrdef scr_seq_0741_T02_0108 ; 002
	scrdef scr_seq_0741_T02_0314 ; 003
	scrdef scr_seq_0741_T02_0327 ; 004
	scrdef scr_seq_0741_T02_033E ; 005
	scrdef scr_seq_0741_T02_0353 ; 006
	scrdef scr_seq_0741_T02_0368 ; 007
	scrdef scr_seq_0741_T02_0032 ; 008
	scrdef scr_seq_0741_T02_015C ; 009
	scrdef scr_seq_0741_T02_00F5 ; 010
	scrdef scr_seq_0741_T02_0090 ; 011
	scrdef_end

scr_seq_0741_T02_0032:
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_0741_T02_0043
	clearflag FLAG_UNK_189
	end

scr_seq_0741_T02_0043:
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif ne, scr_seq_0741_T02_005E
	clearflag FLAG_HIDE_CAMERON
	goto scr_seq_0741_T02_0079

scr_seq_0741_T02_005E:
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif ne, scr_seq_0741_T02_0075
	clearflag FLAG_HIDE_CAMERON
	goto scr_seq_0741_T02_0079

scr_seq_0741_T02_0075:
	setflag FLAG_HIDE_CAMERON
scr_seq_0741_T02_0079:
	checkflag FLAG_UNK_12C
	gotoif TRUE, scr_seq_0741_T02_008E
	setflag FLAG_UNK_12C
	setvar VAR_UNK_4121, 1
scr_seq_0741_T02_008E:
	end

scr_seq_0741_T02_0090:
	setvar VAR_SPECIAL_x8004, 2
	setvar VAR_SPECIAL_x8005, 2
	setvar VAR_SPECIAL_x8006, 0
	callstd std_phone_call
	setvar VAR_UNK_4096, 2
	end

scr_seq_0741_T02_00AE:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0741_T02_00D7
	npc_msg 1
	goto scr_seq_0741_T02_00DA

scr_seq_0741_T02_00D7:
	npc_msg 2
scr_seq_0741_T02_00DA:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0741_T02_00E2:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0741_T02_00F5:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0741_T02_0108:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_12E
	gotoif TRUE, scr_seq_0741_T02_0147
	npc_msg 5
	setvar VAR_SPECIAL_x8004, 412
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0741_T02_0152
	callstd std_give_item_verbose
	setflag FLAG_UNK_12E
scr_seq_0741_T02_0147:
	npc_msg 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0741_T02_0152:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

scr_seq_0741_T02_015C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0741_T02_0284
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0741_T02_0298
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0741_T02_01D5
	apply_movement 255, scr_seq_0741_T02_02AC
	apply_movement 6, scr_seq_0741_T02_02F8
	goto scr_seq_0741_T02_0223

scr_seq_0741_T02_01D5:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0741_T02_01F0
	apply_movement 255, scr_seq_0741_T02_02C4
	goto scr_seq_0741_T02_0223

scr_seq_0741_T02_01F0:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0741_T02_0213
	apply_movement 255, scr_seq_0741_T02_02E4
	apply_movement 6, scr_seq_0741_T02_02F8
	goto scr_seq_0741_T02_0223

scr_seq_0741_T02_0213:
	apply_movement 255, scr_seq_0741_T02_02D0
	apply_movement 6, scr_seq_0741_T02_02F8
scr_seq_0741_T02_0223:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0741_T02_024A
	apply_movement 253, scr_seq_0741_T02_0304
	wait_movement
scr_seq_0741_T02_024A:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_615 69
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

scr_seq_0741_T02_0284:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0741_T02_0298:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end


scr_seq_0741_T02_02AC:
	.short 15, 1
	.short 12, 2
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0741_T02_02C4:
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0741_T02_02D0:
	.short 12, 1
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0741_T02_02E4:
	.short 12, 1
	.short 15, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0741_T02_02F8:
	.short 63, 1
	.short 32, 1
	.short 254, 0

scr_seq_0741_T02_0304:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
scr_seq_0741_T02_0314:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0741_T02_0327:
	scrcmd_055 8, 0, 2, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0741_T02_033E:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 9, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0741_T02_0353:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 10, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0741_T02_0368:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 11, VAR_SPECIAL_x800C
	callstd 2000
	end
	.balign 4, 0
