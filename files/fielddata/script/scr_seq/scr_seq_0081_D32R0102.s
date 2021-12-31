#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D32R0102.h"
#include "msgdata/msg/msg_0104_D32R0102.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D32R0102_000
	scrdef scr_seq_D32R0102_001
	scrdef scr_seq_D32R0102_002
	scrdef scr_seq_D32R0102_003
	scrdef scr_seq_D32R0102_004
	scrdef scr_seq_D32R0102_005
	scrdef scr_seq_D32R0102_006
	scrdef scr_seq_D32R0102_007
	scrdef scr_seq_D32R0102_008
	scrdef_end

scr_seq_D32R0102_002:
	comparevartovalue VAR_UNK_40E5, 2
	gotoif eq, _0035
	end

_0035:
	move_person 0, 17, 1, 25, 2
	end

scr_seq_D32R0102_004:
	checkflag FLAG_UNK_189
	gotoif FALSE, _0054
	clearflag FLAG_UNK_189
	end

_0054:
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif eq, _0078
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif eq, _0078
	setflag FLAG_HIDE_CAMERON
	end

_0078:
	clearflag FLAG_HIDE_CAMERON
	end

scr_seq_D32R0102_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_40E5, 2
	gotoif eq, _009E
	npc_msg msg_0104_D32R0102_00002
	waitbutton
	closemsg
	releaseall
	end

_009E:
	npc_msg msg_0104_D32R0102_00003
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D32R0102_001:
	scrcmd_609
	lockall
	npc_msg msg_0104_D32R0102_00000
	closemsg
	move_person 0, 14, 1, 36, 0
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	comparevartovalue VAR_SPECIAL_x8004, 12
	gotoif ne, _00E7
	apply_movement obj_D32R0102_gsmiddleman1, _019C
	apply_movement obj_player, _0224
	goto _0183

_00E7:
	comparevartovalue VAR_SPECIAL_x8004, 13
	gotoif ne, _010A
	apply_movement obj_D32R0102_gsmiddleman1, _01B4
	apply_movement obj_player, _0224
	goto _0183

_010A:
	comparevartovalue VAR_SPECIAL_x8004, 14
	gotoif ne, _012D
	apply_movement obj_D32R0102_gsmiddleman1, _01C8
	apply_movement obj_player, _0224
	goto _0183

_012D:
	comparevartovalue VAR_SPECIAL_x8004, 15
	gotoif ne, _0150
	apply_movement obj_D32R0102_gsmiddleman1, _01E0
	apply_movement obj_player, _0230
	goto _0183

_0150:
	comparevartovalue VAR_SPECIAL_x8004, 16
	gotoif ne, _0173
	apply_movement obj_D32R0102_gsmiddleman1, _01F4
	apply_movement obj_player, _0230
	goto _0183

_0173:
	apply_movement obj_D32R0102_gsmiddleman1, _020C
	apply_movement obj_player, _0230
_0183:
	wait_movement
	npc_msg msg_0104_D32R0102_00001
	waitbutton
	closemsg
	releaseall
	setvar VAR_UNK_40E5, 1
	setflag FLAG_UNK_25B
	end
	.byte 0x00, 0x00

_019C:
	step 18, 1
	step 16, 5
	step 76, 2
	step 12, 1
	step 34, 1
	step_end

_01B4:
	step 16, 5
	step 76, 2
	step 12, 1
	step 34, 1
	step_end

_01C8:
	step 15, 1
	step 16, 5
	step 76, 2
	step 12, 1
	step 34, 1
	step_end

_01E0:
	step 16, 5
	step 76, 2
	step 12, 1
	step 35, 1
	step_end

_01F4:
	step 15, 1
	step 16, 5
	step 76, 2
	step 12, 1
	step 35, 1
	step_end

_020C:
	step 19, 2
	step 16, 5
	step 76, 2
	step 12, 1
	step 35, 1
	step_end

_0224:
	step 63, 5
	step 35, 1
	step_end

_0230:
	step 63, 5
	step 34, 1
	step_end
scr_seq_D32R0102_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0364
	photo_album_is_full VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0378
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, _02B5
	apply_movement obj_player, _038C
	apply_movement obj_D32R0102_gsmiddleman1_2, _03D8
	goto _0303

_02B5:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _02D0
	apply_movement obj_player, _03A4
	goto _0303

_02D0:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, _02F3
	apply_movement obj_player, _03C4
	apply_movement obj_D32R0102_gsmiddleman1_2, _03D8
	goto _0303

_02F3:
	apply_movement obj_player, _03B0
	apply_movement obj_D32R0102_gsmiddleman1_2, _03D8
_0303:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _032A
	apply_movement 253, _03E4
	wait_movement
_032A:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0x00
	wait_fade
	cameron_photo 29
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

_0364:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

_0378:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end


_038C:
	step 15, 1
	step 12, 2
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_03A4:
	step 12, 3
	step 33, 1
	step_end

_03B0:
	step 12, 1
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_03C4:
	step 12, 1
	step 15, 1
	step 12, 3
	step 33, 1
	step_end

_03D8:
	step 63, 1
	step 32, 1
	step_end

_03E4:
	step 15, 1
	step 12, 1
	step 1, 1
	step_end
scr_seq_D32R0102_005:
	checkflag FLAG_UNK_150
	gotoif TRUE, _0421
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0104_D32R0102_00004
	apply_movement obj_D32R0102_gsman1, _043C
	wait_movement
	npc_msg msg_0104_D32R0102_00005
	closemsg
	setflag FLAG_UNK_150
	goto _042E

_0421:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0104_D32R0102_00006
	closemsg
_042E:
	apply_movement obj_D32R0102_gsman1, _0444
	wait_movement
	releaseall
	end


_043C:
	step 1, 1
	step_end

_0444:
	step 0, 1
	step_end
scr_seq_D32R0102_006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0104_D32R0102_00007
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D32R0102_007:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0104_D32R0102_00008
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D32R0102_008:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 9, VAR_SPECIAL_x800C
	callstd 2000
	end
	.balign 4, 0
