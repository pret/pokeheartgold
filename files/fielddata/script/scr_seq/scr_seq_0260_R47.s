#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0260_R47_0016 ; 000
	scrdef scr_seq_0260_R47_017C ; 001
	scrdef scr_seq_0260_R47_010C ; 002
	scrdef scr_seq_0260_R47_01A9 ; 003
	scrdef scr_seq_0260_R47_024C ; 004
	scrdef_end

scr_seq_0260_R47_0016:
	setvar VAR_UNK_40EB, 1
	setflag FLAG_UNK_9C9
	scrcmd_495 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 7
	gotoif ne, scr_seq_0260_R47_004F
	scrcmd_342 4, 87, 385
	scrcmd_342 5, 87, 389
	scrcmd_342 6, 87, 385
	goto scr_seq_0260_R47_0067

scr_seq_0260_R47_004F:
	scrcmd_342 4, 87, 389
	scrcmd_342 5, 87, 385
	scrcmd_342 6, 87, 385
scr_seq_0260_R47_0067:
	comparevartovalue VAR_UNK_40F9, 2
	gotoif eq, scr_seq_0260_R47_00E6
	comparevartovalue VAR_UNK_40F9, 3
	gotoif eq, scr_seq_0260_R47_00E6
	comparevartovalue VAR_UNK_40F9, 5
	gotoif ge, scr_seq_0260_R47_00EC
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_0260_R47_009F
	clearflag FLAG_UNK_189
	end

scr_seq_0260_R47_009F:
	checkflag FLAG_GAME_CLEAR
	gotoif TRUE, scr_seq_0260_R47_00B2
	goto scr_seq_0260_R47_00E6

scr_seq_0260_R47_00B0:
	.byte 0x02, 0x00
scr_seq_0260_R47_00B2:
	get_phone_book_rematch 32, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_0260_R47_00E6
	get_weekday VAR_TEMP_x4002
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif ne, scr_seq_0260_R47_00E0
	clearflag FLAG_UNK_304
	goto scr_seq_0260_R47_00E4

scr_seq_0260_R47_00E0:
	setflag FLAG_UNK_304
scr_seq_0260_R47_00E4:
	end

scr_seq_0260_R47_00E6:
	setflag FLAG_UNK_304
	end

scr_seq_0260_R47_00EC:
	scrcmd_342 4, 87, 385
	scrcmd_342 5, 87, 385
	scrcmd_342 6, 87, 389
	goto scr_seq_0260_R47_00E6

scr_seq_0260_R47_010A:
	.byte 0x02, 0x00
scr_seq_0260_R47_010C:
	comparevartovalue VAR_UNK_40F9, 5
	gotoif ge, scr_seq_0260_R47_0162
	scrcmd_495 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 7
	gotoif ne, scr_seq_0260_R47_0148
	scrcmd_342 4, 87, 385
	scrcmd_342 5, 87, 389
	scrcmd_342 6, 87, 385
	goto scr_seq_0260_R47_0160

scr_seq_0260_R47_0148:
	scrcmd_342 4, 87, 389
	scrcmd_342 5, 87, 385
	scrcmd_342 6, 87, 385
scr_seq_0260_R47_0160:
	end

scr_seq_0260_R47_0162:
	scrcmd_342 4, 87, 385
	scrcmd_342 5, 87, 385
	scrcmd_342 6, 87, 389
	end

scr_seq_0260_R47_017C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_151
	gotoif TRUE, scr_seq_0260_R47_019E
	npc_msg 0
	waitbutton
	closemsg
	setflag FLAG_UNK_151
	releaseall
	end

scr_seq_0260_R47_019E:
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0260_R47_01A9:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_157
	gotoif TRUE, scr_seq_0260_R47_0210
	npc_msg 2
	apply_movement 5, scr_seq_0260_R47_022C
	wait_movement
	npc_msg 3
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0260_R47_01EB
	apply_movement 5, scr_seq_0260_R47_0234
	goto scr_seq_0260_R47_020E

scr_seq_0260_R47_01EB:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0260_R47_0206
	apply_movement 5, scr_seq_0260_R47_023C
	goto scr_seq_0260_R47_020E

scr_seq_0260_R47_0206:
	apply_movement 5, scr_seq_0260_R47_0244
scr_seq_0260_R47_020E:
	wait_movement
scr_seq_0260_R47_0210:
	buffer_players_name 0
	npc_msg 4
	closemsg
	apply_movement 5, scr_seq_0260_R47_022C
	wait_movement
	setflag FLAG_UNK_157
	releaseall
	end

scr_seq_0260_R47_022A:
	.byte 0x00, 0x00

scr_seq_0260_R47_022C:
	step 32, 1
	step_end

scr_seq_0260_R47_0234:
	step 33, 1
	step_end

scr_seq_0260_R47_023C:
	step 34, 1
	step_end

scr_seq_0260_R47_0244:
	step 35, 1
	step_end
scr_seq_0260_R47_024C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 5
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0260_R47_02B5
	photo_album_is_full VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0260_R47_02C0
	npc_msg 6
	closemsg
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0x00
	wait_fade
	cameron_photo 91
	faceplayer
	lockall
	fade_screen 6, 1, 1, 0x00
	wait_fade
	clearflag FLAG_UNK_189
	npc_msg 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0260_R47_02B5:
	npc_msg 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0260_R47_02C0:
	npc_msg 9
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
