#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0153_P01R0102_014C ; 000
	scrdef scr_seq_0153_P01R0102_001E ; 001
	scrdef scr_seq_0153_P01R0102_00C7 ; 002
	scrdef scr_seq_0153_P01R0102_0118 ; 003
	scrdef scr_seq_0153_P01R0102_0129 ; 004
	scrdef scr_seq_0153_P01R0102_003B ; 005
	scrdef scr_seq_0153_P01R0102_0274 ; 006
	scrdef_end

scr_seq_0153_P01R0102_001E:
	comparevartovalue VAR_UNK_40E1, 2
	gotoif eq, scr_seq_0153_P01R0102_002D
	end

scr_seq_0153_P01R0102_002D:
	move_person 0, 28, 0, 22, 2
	end

scr_seq_0153_P01R0102_003B:
	scrcmd_582 77, 279, 276
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_0153_P01R0102_0054
	clearflag FLAG_UNK_189
	end

scr_seq_0153_P01R0102_0054:
	scrcmd_147 35, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0153_P01R0102_0097
	check_badge 13, VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, scr_seq_0153_P01R0102_0080
	goto scr_seq_0153_P01R0102_00C1

scr_seq_0153_P01R0102_0080:
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif ne, scr_seq_0153_P01R0102_00C1
	clearflag FLAG_UNK_2C9
	end

scr_seq_0153_P01R0102_0097:
	get_phone_book_rematch 35, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_0153_P01R0102_00C1
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif ne, scr_seq_0153_P01R0102_00C1
	clearflag FLAG_UNK_2C9
	end

scr_seq_0153_P01R0102_00C1:
	setflag FLAG_UNK_2C9
	end

scr_seq_0153_P01R0102_00C7:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0153_P01R0102_0104
	wait_movement
	apply_movement 0, scr_seq_0153_P01R0102_010C
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	setvar VAR_UNK_40E1, 0
	clearflag FLAG_UNK_092
	releaseall
	end

scr_seq_0153_P01R0102_0101:
	.byte 0x00, 0x00, 0x00

scr_seq_0153_P01R0102_0104:
	.short 13, 3
	.short 254, 0

scr_seq_0153_P01R0102_010C:
	.short 14, 1
	.short 33, 1
	.short 254, 0
scr_seq_0153_P01R0102_0118:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0153_P01R0102_0129:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 3
	closemsg
	apply_movement 2, scr_seq_0153_P01R0102_0144
	wait_movement
	releaseall
	end


scr_seq_0153_P01R0102_0144:
	.short 32, 1
	.short 254, 0
scr_seq_0153_P01R0102_014C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0EB
	gotoif TRUE, scr_seq_0153_P01R0102_0211
	npc_msg 0
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, scr_seq_0153_P01R0102_0197
	apply_movement 0, scr_seq_0153_P01R0102_021C
	wait_movement
	apply_movement 255, scr_seq_0153_P01R0102_024C
	goto scr_seq_0153_P01R0102_01F3

scr_seq_0153_P01R0102_0197:
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif ne, scr_seq_0153_P01R0102_01BC
	apply_movement 0, scr_seq_0153_P01R0102_022C
	wait_movement
	apply_movement 255, scr_seq_0153_P01R0102_025C
	goto scr_seq_0153_P01R0102_01F3

scr_seq_0153_P01R0102_01BC:
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_0153_P01R0102_01E1
	apply_movement 0, scr_seq_0153_P01R0102_023C
	wait_movement
	apply_movement 255, scr_seq_0153_P01R0102_026C
	goto scr_seq_0153_P01R0102_01F3

scr_seq_0153_P01R0102_01E1:
	apply_movement 0, scr_seq_0153_P01R0102_023C
	wait_movement
	apply_movement 255, scr_seq_0153_P01R0102_026C
scr_seq_0153_P01R0102_01F3:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	play_se SEQ_SE_DP_KAIDAN2
	scrcmd_723 0, 0, 307, 24, 19
	releaseall
	end

scr_seq_0153_P01R0102_0211:
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end


scr_seq_0153_P01R0102_021C:
	.short 2, 1
	.short 14, 1
	.short 35, 1
	.short 254, 0

scr_seq_0153_P01R0102_022C:
	.short 3, 1
	.short 15, 1
	.short 34, 1
	.short 254, 0

scr_seq_0153_P01R0102_023C:
	.short 3, 1
	.short 15, 1
	.short 34, 1
	.short 254, 0

scr_seq_0153_P01R0102_024C:
	.short 14, 1
	.short 0, 1
	.short 12, 2
	.short 254, 0

scr_seq_0153_P01R0102_025C:
	.short 15, 1
	.short 0, 1
	.short 12, 2
	.short 254, 0

scr_seq_0153_P01R0102_026C:
	.short 12, 2
	.short 254, 0
scr_seq_0153_P01R0102_0274:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_147 35, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0153_P01R0102_0322
	comparevartovalue VAR_TEMP_x4004, 1
	gotoif ge, scr_seq_0153_P01R0102_0317
	npc_msg 4
scr_seq_0153_P01R0102_029F:
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0153_P01R0102_02C3
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, scr_seq_0153_P01R0102_0306
	end

scr_seq_0153_P01R0102_02C3:
	buffer_players_name 0
	npc_msg 5
	play_fanfare SEQ_ME_POKEGEAR_REGIST
	wait_fanfare
	register_gear_number 35
	npc_msg 6
	waitbutton
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	setflag FLAG_UNK_2C9
	hide_person 3
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 1, 0
	wait_fade
	releaseall
	end

scr_seq_0153_P01R0102_0306:
	setvar VAR_TEMP_x4004, 1
	npc_msg 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0153_P01R0102_0317:
	npc_msg 8
	goto scr_seq_0153_P01R0102_029F

scr_seq_0153_P01R0102_0320:
	.byte 0x02, 0x00
scr_seq_0153_P01R0102_0322:
	npc_msg 9
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0153_P01R0102_0383
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0153_P01R0102_038E
	npc_msg 10
	closemsg
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_615 88
	faceplayer
	lockall
	fade_screen 6, 1, 1, 0
	wait_fade
	clearflag FLAG_UNK_189
	npc_msg 11
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0153_P01R0102_0383:
	npc_msg 12
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0153_P01R0102_038E:
	npc_msg 13
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
