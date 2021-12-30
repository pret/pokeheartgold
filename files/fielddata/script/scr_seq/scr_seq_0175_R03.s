#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0175_R03_02EA ; 000
	scrdef scr_seq_0175_R03_0016 ; 001
	scrdef scr_seq_0175_R03_00CD ; 002
	scrdef scr_seq_0175_R03_019B ; 003
	scrdef scr_seq_0175_R03_023B ; 004
	scrdef_end

scr_seq_0175_R03_0016:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_517 386, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0175_R03_02DF
	get_lead_mon_index VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 386
	gotoif eq, scr_seq_0175_R03_0050
	scrcmd_518 3
	goto scr_seq_0175_R03_00BE

scr_seq_0175_R03_0050:
	scrcmd_518 3
	fade_screen 6, 1, 0, 0x00
	wait_fade
	get_player_coords VAR_SPECIAL_x8006, VAR_SPECIAL_x8007
	scrcmd_386 VAR_SPECIAL_x800C
	scrcmd_176 11, 0, 32774, 32775, 32780
	scrcmd_184 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0175_R03_00B2
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0175_R03_009E
	scrcmd_605 0, 1
	goto scr_seq_0175_R03_00A2

scr_seq_0175_R03_009E:
	scrcmd_605 3, 2
scr_seq_0175_R03_00A2:
	scrcmd_602 0
	scrcmd_608
	wait 10, VAR_SPECIAL_x800C
	scrcmd_602 1
scr_seq_0175_R03_00B2:
	fade_screen 6, 1, 1, 0x00
	wait_fade
scr_seq_0175_R03_00BE:
	scrcmd_076 386, 0
	npc_msg 2
	goto scr_seq_0175_R03_02D5

scr_seq_0175_R03_00CD:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_517 386, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0175_R03_02DF
	get_lead_mon_index VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 386
	gotoif eq, scr_seq_0175_R03_0107
	scrcmd_518 2
	goto scr_seq_0175_R03_018C

scr_seq_0175_R03_0107:
	scrcmd_518 2
	fade_screen 6, 1, 0, 0x00
	wait_fade
	get_player_coords VAR_SPECIAL_x8006, VAR_SPECIAL_x8007
	scrcmd_386 VAR_SPECIAL_x800C
	scrcmd_176 11, 0, 32774, 32775, 32780
	scrcmd_184 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0175_R03_0180
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0175_R03_0155
	scrcmd_605 0, 1
	goto scr_seq_0175_R03_0170

scr_seq_0175_R03_0155:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0175_R03_016C
	scrcmd_605 0, 1
	goto scr_seq_0175_R03_0170

scr_seq_0175_R03_016C:
	scrcmd_605 3, 2
scr_seq_0175_R03_0170:
	scrcmd_602 0
	scrcmd_608
	wait 10, VAR_SPECIAL_x800C
	scrcmd_602 1
scr_seq_0175_R03_0180:
	fade_screen 6, 1, 1, 0x00
	wait_fade
scr_seq_0175_R03_018C:
	scrcmd_076 386, 0
	npc_msg 3
	goto scr_seq_0175_R03_02D5

scr_seq_0175_R03_019B:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_517 386, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0175_R03_02DF
	get_lead_mon_index VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 386
	gotoif eq, scr_seq_0175_R03_01D5
	scrcmd_518 1
	goto scr_seq_0175_R03_022C

scr_seq_0175_R03_01D5:
	scrcmd_518 1
	fade_screen 6, 1, 0, 0x00
	wait_fade
	get_player_coords VAR_SPECIAL_x8006, VAR_SPECIAL_x8007
	scrcmd_386 VAR_SPECIAL_x800C
	scrcmd_176 11, 0, 32774, 32775, 32780
	scrcmd_184 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0175_R03_0220
	scrcmd_605 2, 3
	scrcmd_602 0
	scrcmd_608
	wait 10, VAR_SPECIAL_x800C
	scrcmd_602 1
scr_seq_0175_R03_0220:
	fade_screen 6, 1, 1, 0x00
	wait_fade
scr_seq_0175_R03_022C:
	scrcmd_076 386, 0
	npc_msg 4
	goto scr_seq_0175_R03_02D5

scr_seq_0175_R03_023B:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_517 386, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0175_R03_02DF
	get_lead_mon_index VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 386
	gotoif eq, scr_seq_0175_R03_0275
	scrcmd_518 0
	goto scr_seq_0175_R03_02CC

scr_seq_0175_R03_0275:
	scrcmd_518 0
	fade_screen 6, 1, 0, 0x00
	wait_fade
	get_player_coords VAR_SPECIAL_x8006, VAR_SPECIAL_x8007
	scrcmd_386 VAR_SPECIAL_x800C
	scrcmd_176 11, 0, 32774, 32775, 32780
	scrcmd_184 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0175_R03_02C0
	scrcmd_605 3, 2
	scrcmd_602 0
	scrcmd_608
	wait 10, VAR_SPECIAL_x800C
	scrcmd_602 1
scr_seq_0175_R03_02C0:
	fade_screen 6, 1, 1, 0x00
	wait_fade
scr_seq_0175_R03_02CC:
	scrcmd_076 386, 0
	npc_msg 5
scr_seq_0175_R03_02D5:
	waitbutton
	scrcmd_077
	closemsg
	releaseall
	end

scr_seq_0175_R03_02DF:
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0175_R03_02EA:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 0, VAR_SPECIAL_x800C
	callstd 2000
	end
	.balign 4, 0
