#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0249_R39_00E9 ; 000
	scrdef scr_seq_0249_R39_0022 ; 001
	scrdef scr_seq_0249_R39_0104 ; 002
	scrdef scr_seq_0249_R39_049B ; 003
	scrdef scr_seq_0249_R39_04B2 ; 004
	scrdef scr_seq_0249_R39_04C7 ; 005
	scrdef scr_seq_0249_R39_0264 ; 006
	scrdef scr_seq_0249_R39_041C ; 007
	scrdef_end

scr_seq_0249_R39_0022:
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_0249_R39_0033
	clearflag FLAG_UNK_189
	end

scr_seq_0249_R39_0033:
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif eq, scr_seq_0249_R39_005B
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, scr_seq_0249_R39_005B
	setflag FLAG_UNK_27E
	goto scr_seq_0249_R39_005F

scr_seq_0249_R39_005B:
	clearflag FLAG_UNK_27E
scr_seq_0249_R39_005F:
	scrcmd_379 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif eq, scr_seq_0249_R39_0087
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif eq, scr_seq_0249_R39_0087
	clearflag FLAG_UNK_226
	goto scr_seq_0249_R39_008B

scr_seq_0249_R39_0087:
	setflag FLAG_UNK_226
scr_seq_0249_R39_008B:
	checkflag FLAG_UNK_162
	gotoif FALSE, scr_seq_0249_R39_00E3
	scrcmd_142 36, 16385
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_0249_R39_00E3
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif ne, scr_seq_0249_R39_00C4
	clearflag FLAG_UNK_314
	goto scr_seq_0249_R39_00E1

scr_seq_0249_R39_00C4:
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif ne, scr_seq_0249_R39_00DB
	clearflag FLAG_UNK_314
	goto scr_seq_0249_R39_00E1

scr_seq_0249_R39_00DB:
	goto scr_seq_0249_R39_00E3

scr_seq_0249_R39_00E1:
	end

scr_seq_0249_R39_00E3:
	setflag FLAG_UNK_314
	end

scr_seq_0249_R39_00E9:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 241, 0
	npc_msg 3
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0249_R39_0104:
	scrcmd_609
	lockall
	apply_movement 8, scr_seq_0249_R39_0208
	wait_movement
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 171
	gotoif ne, scr_seq_0249_R39_0133
	apply_movement 8, scr_seq_0249_R39_0214
	goto scr_seq_0249_R39_0156

scr_seq_0249_R39_0133:
	comparevartovalue VAR_TEMP_x4001, 172
	gotoif ne, scr_seq_0249_R39_014E
	apply_movement 8, scr_seq_0249_R39_0220
	goto scr_seq_0249_R39_0156

scr_seq_0249_R39_014E:
	apply_movement 8, scr_seq_0249_R39_0228
scr_seq_0249_R39_0156:
	wait_movement
	npc_msg 4
	npc_msg 5
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0249_R39_01E3
scr_seq_0249_R39_0173:
	npc_msg 6
	scrcmd_146 24
	buffer_players_name 0
	npc_msg 8
	play_fanfare SEQ_ME_POKEGEAR_REGIST
	wait_fanfare
	npc_msg 9
	closemsg
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 171
	gotoif ne, scr_seq_0249_R39_01AC
	apply_movement 8, scr_seq_0249_R39_0234
	goto scr_seq_0249_R39_01CF

scr_seq_0249_R39_01AC:
	comparevartovalue VAR_TEMP_x4001, 172
	gotoif ne, scr_seq_0249_R39_01C7
	apply_movement 8, scr_seq_0249_R39_0244
	goto scr_seq_0249_R39_01CF

scr_seq_0249_R39_01C7:
	apply_movement 8, scr_seq_0249_R39_0254
scr_seq_0249_R39_01CF:
	wait_movement
	hide_person 8
	setflag FLAG_UNK_228
	releaseall
	setvar VAR_UNK_408F, 1
	end

scr_seq_0249_R39_01E3:
	npc_msg 7
	npc_msg 5
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0249_R39_01E3
	goto scr_seq_0249_R39_0173

scr_seq_0249_R39_0204:
	.byte 0x02, 0x00, 0x00, 0x00

scr_seq_0249_R39_0208:
	.short 75, 1
	.short 35, 1
	.short 254, 0

scr_seq_0249_R39_0214:
	.short 12, 1
	.short 15, 2
	.short 254, 0

scr_seq_0249_R39_0220:
	.short 15, 2
	.short 254, 0

scr_seq_0249_R39_0228:
	.short 13, 1
	.short 15, 2
	.short 254, 0

scr_seq_0249_R39_0234:
	.short 13, 1
	.short 14, 2
	.short 13, 9
	.short 254, 0

scr_seq_0249_R39_0244:
	.short 13, 1
	.short 14, 2
	.short 13, 8
	.short 254, 0

scr_seq_0249_R39_0254:
	.short 13, 1
	.short 14, 2
	.short 13, 7
	.short 254, 0
scr_seq_0249_R39_0264:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 0
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0249_R39_038C
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0249_R39_03A0
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0249_R39_02DD
	apply_movement 255, scr_seq_0249_R39_03B4
	apply_movement 11, scr_seq_0249_R39_0400
	goto scr_seq_0249_R39_032B

scr_seq_0249_R39_02DD:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0249_R39_02F8
	apply_movement 255, scr_seq_0249_R39_03CC
	goto scr_seq_0249_R39_032B

scr_seq_0249_R39_02F8:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0249_R39_031B
	apply_movement 255, scr_seq_0249_R39_03EC
	apply_movement 11, scr_seq_0249_R39_0400
	goto scr_seq_0249_R39_032B

scr_seq_0249_R39_031B:
	apply_movement 255, scr_seq_0249_R39_03D8
	apply_movement 11, scr_seq_0249_R39_0400
scr_seq_0249_R39_032B:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0249_R39_0352
	apply_movement 253, scr_seq_0249_R39_040C
	wait_movement
scr_seq_0249_R39_0352:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_615 28
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

scr_seq_0249_R39_038C:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0249_R39_03A0:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end


scr_seq_0249_R39_03B4:
	.short 15, 1
	.short 12, 2
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0249_R39_03CC:
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0249_R39_03D8:
	.short 12, 1
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0249_R39_03EC:
	.short 12, 1
	.short 15, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0249_R39_0400:
	.short 63, 1
	.short 32, 1
	.short 254, 0

scr_seq_0249_R39_040C:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
scr_seq_0249_R39_041C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 10
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0249_R39_0485
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0249_R39_0490
	npc_msg 11
	closemsg
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_615 80
	faceplayer
	lockall
	fade_screen 6, 1, 1, 0
	wait_fade
	clearflag FLAG_UNK_189
	npc_msg 12
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0249_R39_0485:
	npc_msg 13
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0249_R39_0490:
	npc_msg 14
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0249_R39_049B:
	scrcmd_055 0, 1, 21, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0249_R39_04B2:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 1, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0249_R39_04C7:
	scrcmd_056 3, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 2, VAR_SPECIAL_x800C
	callstd 2000
	end
	.balign 4, 0
