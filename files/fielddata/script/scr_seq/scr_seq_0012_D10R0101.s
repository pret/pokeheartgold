#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0012_D10R0101_001A ; 000
	scrdef scr_seq_0012_D10R0101_0020 ; 001
	scrdef scr_seq_0012_D10R0101_0085 ; 002
	scrdef scr_seq_0012_D10R0101_00B1 ; 003
	scrdef scr_seq_0012_D10R0101_00E5 ; 004
	scrdef scr_seq_0012_D10R0101_013C ; 005
	scrdef_end

scr_seq_0012_D10R0101_001A:
	scrcmd_508 2
	end

scr_seq_0012_D10R0101_0020:
	play_se SEQ_SE_DP_SELECT
	lockall
	non_npc_msg 6
	wait 30, VAR_SPECIAL_x800C
	non_npc_msg 7
	play_se SEQ_SE_DP_DECIDE
	wait 30, VAR_SPECIAL_x800C
	non_npc_msg 8
	play_se SEQ_SE_DP_DECIDE
	wait 30, VAR_SPECIAL_x800C
	non_npc_msg 9
	play_se SEQ_SE_DP_DECIDE
	wait 30, VAR_SPECIAL_x800C
	non_npc_msg 10
	play_se SEQ_SE_DP_CON_016
	wait 30, VAR_SPECIAL_x800C
	scrcmd_508 0
	setvar VAR_UNK_4124, 1
	closemsg
	releaseall
	end

scr_seq_0012_D10R0101_0073:
	.byte 0xfc, 0x01, 0x00, 0x00, 0x29, 0x00, 0x24, 0x41, 0x01, 0x00, 0x32, 0x00, 0x35
	.byte 0x00, 0x61, 0x00, 0x02, 0x00
scr_seq_0012_D10R0101_0085:
	play_se SEQ_SE_DP_SELECT
	lockall
	play_se SEQ_SE_DP_PINPON
	buffer_players_name 0
	npc_msg 4
	play_bgm SEQ_SILENCE_DUNGEON
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	closemsg
	releaseall
	setvar VAR_UNK_4124, 1
	call scr_seq_0012_D10R0101_01D4
	end

scr_seq_0012_D10R0101_00B1:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 5
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0012_D10R0101_00D5
	releaseall
	end

scr_seq_0012_D10R0101_00D5:
	setvar VAR_UNK_4124, 2
	releaseall
	call scr_seq_0012_D10R0101_01D4
	end

scr_seq_0012_D10R0101_00E5:
	play_se SEQ_SE_DP_SELECT
	lockall
	call scr_seq_0012_D10R0101_0180
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0012_D10R0101_0110
	setvar VAR_UNK_4124, 2
	releaseall
	call scr_seq_0012_D10R0101_01D4
	end

scr_seq_0012_D10R0101_0110:
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0012_D10R0101_0134
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	releaseall
	end

scr_seq_0012_D10R0101_0132:
	.byte 0x00, 0x00

scr_seq_0012_D10R0101_0134:
	.short 12, 1
	.short 254, 0
scr_seq_0012_D10R0101_013C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	call scr_seq_0012_D10R0101_0180
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0012_D10R0101_0169
	setvar VAR_UNK_4124, 2
	releaseall
	call scr_seq_0012_D10R0101_01D4
	end

scr_seq_0012_D10R0101_0169:
	apply_movement 0, scr_seq_0012_D10R0101_0178
	wait_movement
	releaseall
	end

scr_seq_0012_D10R0101_0177:
	.byte 0x00

scr_seq_0012_D10R0101_0178:
	.short 34, 1
	.short 254, 0
scr_seq_0012_D10R0101_0180:
	npc_msg 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0012_D10R0101_01C9
	get_player_gender VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0012_D10R0101_01B9
	buffer_players_name 0
	npc_msg 2
	waitbutton
	setvar VAR_SPECIAL_x800C, 0
	return

scr_seq_0012_D10R0101_01B9:
	buffer_players_name 0
	npc_msg 3
	waitbutton
	setvar VAR_SPECIAL_x800C, 0
	return

scr_seq_0012_D10R0101_01C9:
	npc_msg 1
	setvar VAR_SPECIAL_x800C, 1
	return

scr_seq_0012_D10R0101_01D4:
	scrcmd_508 1
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 479, 0, 7, 7, 1
	fade_screen 6, 1, 1, 0
	wait_fade
	return
	.balign 4, 0
