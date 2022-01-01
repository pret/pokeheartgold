#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R03.h"
#include "msgdata/msg/msg_0326_R03.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R03_000
	scrdef scr_seq_R03_001
	scrdef scr_seq_R03_002
	scrdef scr_seq_R03_003
	scrdef scr_seq_R03_004
	scrdef_end

scr_seq_R03_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_517 386, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _02DF
	get_lead_mon_index VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 386
	gotoif eq, _0050
	scrcmd_518 3
	goto _00BE

_0050:
	scrcmd_518 3
	fade_screen 6, 1, 0, 0x00
	wait_fade
	get_player_coords VAR_SPECIAL_x8006, VAR_SPECIAL_x8007
	scrcmd_386 VAR_SPECIAL_x800C
	scrcmd_176 11, 0, 32774, 32775, 32780
	scrcmd_184 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _00B2
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _009E
	scrcmd_605 0, 1
	goto _00A2

_009E:
	scrcmd_605 3, 2
_00A2:
	scrcmd_602 0
	scrcmd_608
	wait 10, VAR_SPECIAL_x800C
	scrcmd_602 1
_00B2:
	fade_screen 6, 1, 1, 0x00
	wait_fade
_00BE:
	play_cry SPECIES_DEOXYS, 0
	npc_msg msg_0326_R03_00002
	goto _02D5

scr_seq_R03_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_517 386, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _02DF
	get_lead_mon_index VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 386
	gotoif eq, _0107
	scrcmd_518 2
	goto _018C

_0107:
	scrcmd_518 2
	fade_screen 6, 1, 0, 0x00
	wait_fade
	get_player_coords VAR_SPECIAL_x8006, VAR_SPECIAL_x8007
	scrcmd_386 VAR_SPECIAL_x800C
	scrcmd_176 11, 0, 32774, 32775, 32780
	scrcmd_184 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0180
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _0155
	scrcmd_605 0, 1
	goto _0170

_0155:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, _016C
	scrcmd_605 0, 1
	goto _0170

_016C:
	scrcmd_605 3, 2
_0170:
	scrcmd_602 0
	scrcmd_608
	wait 10, VAR_SPECIAL_x800C
	scrcmd_602 1
_0180:
	fade_screen 6, 1, 1, 0x00
	wait_fade
_018C:
	play_cry SPECIES_DEOXYS, 0
	npc_msg msg_0326_R03_00003
	goto _02D5

scr_seq_R03_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_517 386, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _02DF
	get_lead_mon_index VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 386
	gotoif eq, _01D5
	scrcmd_518 1
	goto _022C

_01D5:
	scrcmd_518 1
	fade_screen 6, 1, 0, 0x00
	wait_fade
	get_player_coords VAR_SPECIAL_x8006, VAR_SPECIAL_x8007
	scrcmd_386 VAR_SPECIAL_x800C
	scrcmd_176 11, 0, 32774, 32775, 32780
	scrcmd_184 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0220
	scrcmd_605 2, 3
	scrcmd_602 0
	scrcmd_608
	wait 10, VAR_SPECIAL_x800C
	scrcmd_602 1
_0220:
	fade_screen 6, 1, 1, 0x00
	wait_fade
_022C:
	play_cry SPECIES_DEOXYS, 0
	npc_msg msg_0326_R03_00004
	goto _02D5

scr_seq_R03_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_517 386, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _02DF
	get_lead_mon_index VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 386
	gotoif eq, _0275
	scrcmd_518 0
	goto _02CC

_0275:
	scrcmd_518 0
	fade_screen 6, 1, 0, 0x00
	wait_fade
	get_player_coords VAR_SPECIAL_x8006, VAR_SPECIAL_x8007
	scrcmd_386 VAR_SPECIAL_x800C
	scrcmd_176 11, 0, 32774, 32775, 32780
	scrcmd_184 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _02C0
	scrcmd_605 3, 2
	scrcmd_602 0
	scrcmd_608
	wait 10, VAR_SPECIAL_x800C
	scrcmd_602 1
_02C0:
	fade_screen 6, 1, 1, 0x00
	wait_fade
_02CC:
	play_cry SPECIES_DEOXYS, 0
	npc_msg msg_0326_R03_00005
_02D5:
	waitbutton
	wait_cry
	closemsg
	releaseall
	end

_02DF:
	npc_msg msg_0326_R03_00001
	waitbutton
	closemsg
	releaseall
	end

scr_seq_R03_000:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0326_R03_00000, VAR_SPECIAL_x800C
	callstd std_signpost
	end
	.balign 4, 0
