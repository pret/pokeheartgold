#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R10.h"
#include "msgdata/msg/msg_0341_R10.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R10_000
	scrdef scr_seq_R10_001
	scrdef scr_seq_R10_002
	scrdef scr_seq_R10_003
	scrdef scr_seq_R10_004
	scrdef scr_seq_R10_005
	scrdef scr_seq_R10_006
	scrdef_end

scr_seq_R10_004:
	checkflag FLAG_ENGAGING_STATIC_POKEMON
	gotoif TRUE, _002B
	end

_002B:
	setflag FLAG_HIDE_ROUTE_10_ZAPDOS
	hide_person obj_R10_tsure_poke_604
	clearflag FLAG_ENGAGING_STATIC_POKEMON
	end

scr_seq_R10_001:
	check_badge 15, VAR_TEMP_x4004
	comparevartovalue VAR_TEMP_x4004, 1
	gotoif eq, _0052
	goto _00BF

_0052:
	checkflag FLAG_UNK_14A
	gotoif FALSE, _00BF
	scrcmd_147 36, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, _00BF
	scrcmd_522 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 9
	gotoif ne, _008B
	clearflag FLAG_HIDE_ROUTE_10_LT_SURGE
	goto _00BD

_008B:
	comparevartovalue VAR_TEMP_x4000, 10
	gotoif ne, _00A2
	clearflag FLAG_HIDE_ROUTE_10_LT_SURGE
	goto _00BD

_00A2:
	comparevartovalue VAR_TEMP_x4000, 11
	gotoif ne, _00B9
	clearflag FLAG_HIDE_ROUTE_10_LT_SURGE
	goto _00BD

_00B9:
	setflag FLAG_HIDE_ROUTE_10_LT_SURGE
_00BD:
	end

_00BF:
	end

scr_seq_R10_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_147 36, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, _0148
	scrcmd_184 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0197
	get_lead_mon_index VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 25
	gotoif ne, _0197
	comparevartovalue VAR_TEMP_x4002, 1
	gotoif ge, _018C
	npc_msg msg_0341_R10_00000
_0114:
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0138
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, _017B
	end

_0138:
	buffer_players_name 0
	npc_msg msg_0341_R10_00001
	play_fanfare SEQ_ME_POKEGEAR_REGIST
	wait_fanfare
	register_gear_number 36
_0148:
	npc_msg msg_0341_R10_00002
	waitbutton
	closemsg
	fade_screen 6, 1, 0, 0x0000
	wait_fade
	setflag FLAG_HIDE_ROUTE_10_LT_SURGE
	hide_person obj_R10_gsleader9
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 1, 0x0000
	wait_fade
	releaseall
	end

_017B:
	setvar VAR_TEMP_x4002, 1
	npc_msg msg_0341_R10_00003
	waitbutton
	closemsg
	releaseall
	end

_018C:
	npc_msg msg_0341_R10_00004
	goto _0114
	.byte 0x02, 0x00
_0197:
	npc_msg msg_0341_R10_00005
	waitbutton
	closemsg
	releaseall
	end

scr_seq_R10_000:
	scrcmd_609
	lockall
	checkflag FLAG_RESTORED_POWER
	gotoif TRUE, _0209
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _01D5
	scrcmd_596 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _01D5
	scrcmd_600
_01D5:
	play_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 0, 0x0000
	wait_fade
	scrcmd_176 489, 0, 7, 20, 0
	fade_screen 6, 1, 1, 0x0000
	wait_fade
	scrcmd_582 18, 1423, 185
	releaseall
	end

_0209:
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _022D
	scrcmd_596 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _022D
	scrcmd_600
_022D:
	play_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 0, 0x0000
	wait_fade
	scrcmd_176 467, 0, 7, 20, 0
	fade_screen 6, 1, 1, 0x0000
	wait_fade
	scrcmd_582 18, 1423, 185
	releaseall
	end

scr_seq_R10_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	play_cry SPECIES_ZAPDOS, 0
	wait_cry
	setflag FLAG_ENGAGING_STATIC_POKEMON
	wild_battle SPECIES_ZAPDOS, 50, 0
	clearflag FLAG_ENGAGING_STATIC_POKEMON
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _02B3
	scrcmd_683 VAR_TEMP_x4002
	comparevartovalue VAR_TEMP_x4002, 3
	gotoif eq, _02AF
	comparevartovalue VAR_TEMP_x4002, 4
	callif eq, _02B9
_02AF:
	releaseall
	end

_02B3:
	white_out
	releaseall
	end

_02B9:
	setflag FLAG_UNK_14A
	return

scr_seq_R10_005:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0341_R10_00008, VAR_SPECIAL_x800C
	callstd std_signpost
	end

scr_seq_R10_006:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0341_R10_00009, VAR_SPECIAL_x800C
	callstd std_signpost
	end
	.balign 4, 0
