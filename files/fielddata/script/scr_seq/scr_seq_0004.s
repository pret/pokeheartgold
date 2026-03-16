#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_0004.h"
#include "msgdata/msg/msg_0191.h"
#include "msgdata/msg/msg_0046.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0004_000
	scrdef scr_seq_0004_001
	scrdef scr_seq_0004_002
	scrdef scr_seq_0004_003
	scrdef scr_seq_0004_004
	scrdef scr_seq_0004_005
	scrdef scr_seq_0004_006
	scrdef scr_seq_0004_007
	scrdef scr_seq_0004_008
	scrdef scr_seq_0004_009
	scrdef scr_seq_0004_010
	scrdef scr_seq_0004_011
	scrdef scr_seq_0004_012
	scrdef scr_seq_0004_013
	scrdef scr_seq_0004_014
	scrdef scr_seq_0004_015
	scrdef scr_seq_0004_016
	scrdef scr_seq_0004_017
	scrdef_end

scr_seq_0004_000:
	compare VAR_UNK_4133, 2
	goto_if_eq _0066
	compare VAR_UNK_4133, 1
	goto_if_eq _0066
	end

_0066:
	make_object_visible obj_player
	end

scr_seq_0004_012:
scr_seq_0004_014:
scr_seq_0004_015:
	scrcmd_609
	lockall
	scrcmd_446 VAR_SPECIAL_RESULT
	scrcmd_840 VAR_SPECIAL_RESULT, VAR_SPECIAL_x8004
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_SPECIAL_x8004, 0
	goto_if_ne _0099
	goto _027A

_0093:
	goto _0141

_0099:
	compare VAR_SPECIAL_x8004, 1
	goto_if_ne _00F0
	compare VAR_TEMP_x4000, 12
	goto_if_eq _00BF
	goto _027A

_00B9:
	goto _00D2

_00BF:
	compare VAR_TEMP_x4001, 2
	goto_if_eq _00D2
	goto _027A

_00D2:
	setvar VAR_TEMP_x4000, 12
	setvar VAR_TEMP_x4001, 2
	setvar VAR_TEMP_x4002, 5
	goto _0222

_00EA:
	goto _0141

_00F0:
	compare VAR_SPECIAL_x8004, 2
	goto_if_ne _0141
	compare VAR_TEMP_x4000, 18
	goto_if_eq _0116
	goto _027A

_0110:
	goto _0129

_0116:
	compare VAR_TEMP_x4001, 11
	goto_if_eq _0129
	goto _027A

_0129:
	setvar VAR_TEMP_x4000, 18
	setvar VAR_TEMP_x4001, 11
	setvar VAR_TEMP_x4002, 14
	goto _0222

_0141:
	goto _027A

scr_seq_0004_013:
	scrcmd_609
	lockall
	scrcmd_446 VAR_SPECIAL_RESULT
	scrcmd_840 VAR_SPECIAL_RESULT, VAR_SPECIAL_x8004
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_SPECIAL_x8004, 0
	goto_if_ne _0174
	goto _027A

_016E:
	goto _021C

_0174:
	compare VAR_SPECIAL_x8004, 1
	goto_if_ne _01CB
	compare VAR_TEMP_x4000, 7
	goto_if_eq _019A
	goto _027A

_0194:
	goto _01AD

_019A:
	compare VAR_TEMP_x4001, 2
	goto_if_eq _01AD
	goto _027A

_01AD:
	setvar VAR_TEMP_x4000, 7
	setvar VAR_TEMP_x4001, 2
	setvar VAR_TEMP_x4002, 5
	goto _0222

_01C5:
	goto _021C

_01CB:
	compare VAR_SPECIAL_x8004, 2
	goto_if_ne _021C
	compare VAR_TEMP_x4000, 4
	goto_if_eq _01F1
	goto _027A

_01EB:
	goto _0204

_01F1:
	compare VAR_TEMP_x4001, 11
	goto_if_eq _0204
	goto _027A

_0204:
	setvar VAR_TEMP_x4000, 4
	setvar VAR_TEMP_x4001, 11
	setvar VAR_TEMP_x4002, 14
	goto _0222

_021C:
	goto _027A

_0222:
	scrcmd_307 0, 0, VAR_TEMP_x4000, VAR_TEMP_x4001, 77
	call _0BC2
	apply_movement obj_player, _0288
	wait_movement
	call _0BCA
	scrcmd_307 0, 0, VAR_TEMP_x4000, VAR_TEMP_x4002, 77
	call _0BC2
	apply_movement obj_player, _02A0
	wait_movement
	call _0BCA
	scrcmd_606
	clearflag FLAG_UNK_966
	setvar VAR_UNK_4133, 0
	setvar VAR_UNK_4133, 0
	releaseall
	end

_027A:
	setvar VAR_UNK_4133, 0
	scrcmd_374 obj_player
	releaseall
	end

	.balign 4, 0
_0288:
	FaceSouth
	SetVisible
	WalkNormalSouth 2
	EndMovement

	.balign 4, 0
_0290:
	WalkNormalSouth
	EndMovement

	.balign 4, 0
_02A0:
	WalkNormalSouth 2
	EndMovement

scr_seq_0004_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	party_legal_check VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0F27
	get_player_state VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 3
	goto_if_eq _0C10
	npc_msg msg_0046_00000
	goto _02DD
	end
_02DD:
	npc_msg msg_0046_00002
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	menu_item_add msg_0191_00166, 255, 0
	menu_item_add msg_0191_00167, 255, 1
	menu_item_add msg_0191_00011, 255, 2
	menu_item_add msg_0191_00012, 255, 3
	menu_exec
	switch VAR_SPECIAL_RESULT
	case 0, _0364
	case 1, _03DF
	case 2, _033F
	goto _034C

_033F:
	npc_msg msg_0046_00006
	closemsg
	goto _02DD
	end
_034C:
	npc_msg msg_0046_00029
	wait_button_or_walk_away
	closemsg
	touchscreen_menu_show
	releaseall
	end

_0359:
	npc_msg msg_0046_00029
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0364:
	npc_msg msg_0046_00001
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	menu_item_add msg_0191_00006, 255, 0
	menu_item_add msg_0191_00007, 255, 1
	menu_item_add msg_0191_00008, 255, 2
	menu_item_add msg_0191_00010, 255, 3
	menu_item_add msg_0191_00013, 255, 4
	menu_exec
	copyvar VAR_TEMP_x4003, VAR_SPECIAL_RESULT
	switch VAR_SPECIAL_RESULT
	case 0, _0415
	case 1, _0423
	case 2, _044D
	case 3, _04A1
	goto _02DD

_03DF:
	npc_msg msg_0046_00003
	menu_init 1, 1, 0, 1, VAR_SPECIAL_RESULT
	menu_item_add msg_0046_00004, 255, 0
	menu_item_add msg_0046_00005, 255, 1
	menu_exec
	switch VAR_SPECIAL_RESULT
	case 0, _0477
	goto _02DD

_0415:
	setvar VAR_SPECIAL_x8004, 1
	goto _04AF
	end
_0423:
	setvar VAR_SPECIAL_x8004, 2
	party_count_not_egg VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 2
	goto_if_lt _0440
	goto _04AF

_0440:
	npc_msg msg_0046_00010
	wait_button_or_walk_away
	closemsg
	touchscreen_menu_show
	releaseall
	end

_044D:
	setvar VAR_SPECIAL_x8004, 3
	party_count_not_egg VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 3
	goto_if_lt _046A
	goto _0905

_046A:
	npc_msg msg_0046_00141
	wait_button_or_walk_away
	closemsg
	touchscreen_menu_show
	releaseall
	end

_0477:
	setvar VAR_SPECIAL_x8004, 4
	party_count_not_egg VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 3
	goto_if_lt _0494
	goto _0905

_0494:
	npc_msg msg_0046_00140
	wait_button_or_walk_away
	closemsg
	touchscreen_menu_show
	releaseall
	end

_04A1:
	setvar VAR_SPECIAL_x8004, 37
	goto _059A
	end
_04AF:
	npc_msg msg_0046_00120
	menu_init 1, 1, 0, 1, VAR_TEMP_x4000
	menu_item_add msg_0046_00020, 255, 12
	buffer_ruleset_name 0
	menu_item_add msg_0046_00019, 255, 0
	buffer_ruleset_name 1
	menu_item_add msg_0046_00019, 255, 1
	buffer_ruleset_name 2
	menu_item_add msg_0046_00019, 255, 2
	buffer_ruleset_name 3
	menu_item_add msg_0046_00019, 255, 3
	buffer_ruleset_name 4
	menu_item_add msg_0046_00019, 255, 4
	scrcmd_837 VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 0
	goto_if_eq _051B
	buffer_ruleset_name 5
	menu_item_add msg_0046_00019, 255, 5
_051B:
	menu_item_add msg_0046_00022, 255, 255
	menu_exec
	switch VAR_TEMP_x4000
	case 12, _08F9
	case 0, _058E
	case 1, _058E
	case 2, _058E
	case 3, _058E
	case 4, _058E
	case 5, _058E
	goto _02DD
	end
_058E:
	scrcmd_800 VAR_TEMP_x4000
	goto _0682
	end
_059A:
	setvar VAR_SPECIAL_x8004, 37
	npc_msg msg_0046_00120
	menu_init 1, 1, 0, 1, VAR_TEMP_x4000
	menu_item_add msg_0046_00020, 255, 6
	buffer_ruleset_name 7
	menu_item_add msg_0046_00019, 255, 7
	buffer_ruleset_name 8
	menu_item_add msg_0046_00019, 255, 8
	buffer_ruleset_name 9
	menu_item_add msg_0046_00019, 255, 9
	buffer_ruleset_name 10
	menu_item_add msg_0046_00023, 255, 10
	buffer_ruleset_name 11
	menu_item_add msg_0046_00019, 255, 11
	menu_item_add msg_0046_00022, 255, 255
	menu_exec
	switch VAR_TEMP_x4000
	case 6, _08F9
	case 7, _058E
	case 8, _058E
	case 9, _0653
	case 10, _065F
	case 11, _0653
	goto _02DD

_0653:
	setvar VAR_SPECIAL_x8004, 38
	goto _058E

_065F:
	setvar VAR_SPECIAL_x8004, 38
	scrcmd_800 VAR_TEMP_x4000
	scrcmd_803 VAR_TEMP_x4000, VAR_TEMP_x4002
	compare VAR_TEMP_x4002, 1
	goto_if_eq _0440
	goto _0905

_0682:
	scrcmd_799 VAR_TEMP_x4000
	npc_msg msg_0046_00121
	menu_init 1, 1, 0, 1, VAR_SPECIAL_RESULT
	menu_item_add msg_0046_00130, 255, 0
	menu_item_add msg_0046_00131, 255, 1
	compare VAR_TEMP_x4000, 11
	goto_if_ne _06B6
	menu_item_add msg_0046_00024, 255, 2
_06B6:
	menu_item_add msg_0046_00022, 255, 3
	menu_exec
	switch VAR_SPECIAL_RESULT
	case 0, _0702
	case 1, _0751
	compare VAR_TEMP_x4000, 11
	goto_if_ne _06FA
	case 2, _0778
_06FA:
	goto _0763
	end
_0702:
	scrcmd_803 VAR_TEMP_x4000, VAR_TEMP_x4002
	compare VAR_TEMP_x4002, 0
	goto_if_eq _0905
	compare VAR_TEMP_x4002, 1
	goto_if_eq _072A
	goto _0744
	end
_072A:
	npc_msg msg_0046_00122
	wait_button
	compare VAR_TEMP_x4003, 3
	goto_if_eq _059A
	goto _04AF
	end
_0744:
	npc_msg msg_0046_00136
	wait_button
	goto _04AF
	end
_0751:
	closemsg
	scrcmd_801 VAR_TEMP_x4000
	wait_button
	scrcmd_802
	goto _0682
	end
_0763:
	compare VAR_TEMP_x4003, 3
	goto_if_eq _059A
	goto _04AF
	end
_0778:
	touchscreen_menu_show
	buffer_players_name 0
	npc_msg msg_0046_00025
	setvar VAR_TEMP_x4005, 0
	check_mon_seen SPECIES_MEWTWO, VAR_TEMP_x4004
	compare VAR_TEMP_x4004, 1
	goto_if_ne _07AA
	buffer_species_name 0, SPECIES_MEWTWO, 0, 0
	npc_msg msg_0046_00026
	setvar VAR_TEMP_x4005, 1
_07AA:
	check_mon_seen SPECIES_LUGIA, VAR_TEMP_x4004
	compare VAR_TEMP_x4004, 1
	goto_if_ne _07CE
	buffer_species_name 0, SPECIES_LUGIA, 0, 0
	npc_msg msg_0046_00026
	setvar VAR_TEMP_x4005, 1
_07CE:
	check_mon_seen SPECIES_HO_OH, VAR_TEMP_x4004
	compare VAR_TEMP_x4004, 1
	goto_if_ne _07F2
	buffer_species_name 0, SPECIES_HO_OH, 0, 0
	npc_msg msg_0046_00026
	setvar VAR_TEMP_x4005, 1
_07F2:
	check_mon_seen SPECIES_KYOGRE, VAR_TEMP_x4004
	compare VAR_TEMP_x4004, 1
	goto_if_ne _0816
	buffer_species_name 0, SPECIES_KYOGRE, 0, 0
	npc_msg msg_0046_00026
	setvar VAR_TEMP_x4005, 1
_0816:
	check_mon_seen SPECIES_GROUDON, VAR_TEMP_x4004
	compare VAR_TEMP_x4004, 1
	goto_if_ne _083A
	buffer_species_name 0, SPECIES_GROUDON, 0, 0
	npc_msg msg_0046_00026
	setvar VAR_TEMP_x4005, 1
_083A:
	check_mon_seen SPECIES_RAYQUAZA, VAR_TEMP_x4004
	compare VAR_TEMP_x4004, 1
	goto_if_ne _085E
	buffer_species_name 0, SPECIES_RAYQUAZA, 0, 0
	npc_msg msg_0046_00026
	setvar VAR_TEMP_x4005, 1
_085E:
	check_mon_seen SPECIES_DIALGA, VAR_TEMP_x4004
	compare VAR_TEMP_x4004, 1
	goto_if_ne _0882
	buffer_species_name 0, SPECIES_DIALGA, 0, 0
	npc_msg msg_0046_00026
	setvar VAR_TEMP_x4005, 1
_0882:
	check_mon_seen SPECIES_PALKIA, VAR_TEMP_x4004
	compare VAR_TEMP_x4004, 1
	goto_if_ne _08A6
	buffer_species_name 0, SPECIES_PALKIA, 0, 0
	npc_msg msg_0046_00026
	setvar VAR_TEMP_x4005, 1
_08A6:
	check_mon_seen SPECIES_GIRATINA, VAR_TEMP_x4004
	compare VAR_TEMP_x4004, 1
	goto_if_ne _08CA
	buffer_species_name 0, SPECIES_GIRATINA, 0, 0
	npc_msg msg_0046_00026
	setvar VAR_TEMP_x4005, 1
_08CA:
	compare VAR_TEMP_x4005, 1
	goto_if_ne _08E0
	npc_msg msg_0046_00027
	goto _08E3

_08E0:
	npc_msg msg_0046_00028
_08E3:
	touchscreen_menu_hide
	goto _0682

_08EB:
	setvar VAR_SPECIAL_x8005, 0
	goto _0905
	end
_08F9:
	scrcmd_800 VAR_TEMP_x4000
	goto _0905
	end
_0905:
	callstd std_prompt_save
	copyvar VAR_SPECIAL_RESULT, VAR_TEMP_x4000
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0924
	goto _0359
	end
_0924:
	touchscreen_menu_hide
_0926:
	compare VAR_SPECIAL_x8004, 1
	call_if_eq _09BE
	compare VAR_SPECIAL_x8004, 2
	call_if_eq _09BE
	compare VAR_SPECIAL_x8004, 3
	call_if_eq _09BE
	compare VAR_SPECIAL_x8004, 37
	call_if_eq _09BE
	compare VAR_SPECIAL_x8004, 38
	call_if_eq _09BE
	compare VAR_SPECIAL_x8004, 4
	call_if_eq _09C3
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	menu_item_add msg_0191_00014, 255, 0
	menu_item_add msg_0191_00015, 255, 1
	menu_item_add msg_0191_00005, 255, 2
	menu_exec
	switch VAR_SPECIAL_RESULT
	case 0, _09C8
	case 1, _0A41
	goto _034C
	end
_09BE:
	npc_msg msg_0046_00036
	return

_09C3:
	npc_msg msg_0046_00057
	return

_09C8:
	npc_msg msg_0046_00139
	getmenuchoice VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0926
	closemsg
	scrcmd_226 VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, 0, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0A17
	compare VAR_SPECIAL_RESULT, 3
	goto_if_eq _0A23
	compare VAR_SPECIAL_RESULT, 4
	goto_if_eq _0A32
	goto _0ABA
	end
_0A17:
	scrcmd_283
	touchscreen_menu_hide
	goto _0926
	end
_0A23:
	scrcmd_283
	touchscreen_menu_show
	npc_msg msg_0046_00030
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0A32:
	scrcmd_283
	npc_msg msg_0046_00029
	wait_button_or_walk_away
	closemsg
	touchscreen_menu_show
	releaseall
	end

_0A41:
	npc_msg msg_0046_00139
	getmenuchoice VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0926
	closemsg
	scrcmd_227 VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, 0, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0A90
	compare VAR_SPECIAL_RESULT, 3
	goto_if_eq _0A9C
	compare VAR_SPECIAL_RESULT, 4
	goto_if_eq _0AAB
	goto _0ABA
	end
_0A90:
	scrcmd_283
	touchscreen_menu_hide
	goto _0926
	end
_0A9C:
	scrcmd_283
	npc_msg msg_0046_00030
	wait_button_or_walk_away
	closemsg
	touchscreen_menu_show
	releaseall
	end

_0AAB:
	scrcmd_283
	npc_msg msg_0046_00029
	wait_button_or_walk_away
	closemsg
	touchscreen_menu_show
	releaseall
	end

_0ABA:
	setvar VAR_UNK_4133, 1
	setflag FLAG_UNK_966
	npc_msg_var msg_0046_00066
	wait_button_or_delay 45
	scrcmd_257 96
	closemsg
	scrcmd_600
	heal_party
	scrcmd_815 0
	scrcmd_446 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 300
	goto_if_ne _0B13
	apply_movement obj_player, _0BE8
	wait_movement
	setvar VAR_TEMP_x4000, 18
	setvar VAR_TEMP_x4001, 11
	setvar VAR_TEMP_x4002, 14
	goto _0B35

_0B0D:
	goto _0B35

_0B13:
	apply_movement obj_player, _0BDC
	wait_movement
	setvar VAR_TEMP_x4000, 12
	setvar VAR_TEMP_x4001, 2
	setvar VAR_TEMP_x4002, 5
	goto _0B35

_0B35:
	scrcmd_307 0, 0, VAR_TEMP_x4000, VAR_TEMP_x4002, 77
	call _0BC2
	apply_movement obj_player, _0BF4
	wait_movement
	call _0BCA
	apply_movement obj_player, _0BFC
	wait_movement
	scrcmd_307 0, 0, VAR_TEMP_x4000, VAR_TEMP_x4001, 77
	call _0BC2
	apply_movement obj_player, _0C04
	wait_movement
	call _0BCA
	compare VAR_SPECIAL_x8004, 4
	goto_if_eq _0BA8
	scrcmd_451 VAR_SPECIAL_RESULT
	addvar VAR_SPECIAL_RESULT, 7
	scrcmd_448 MAP_WIFI_SINGLE_BATTLE_AREA, 0, VAR_SPECIAL_RESULT, 11, DIR_NORTH
	releaseall
	end

_0BA8:
	scrcmd_451 VAR_SPECIAL_RESULT
	addvar VAR_SPECIAL_RESULT, 6
	scrcmd_448 MAP_WIFI_MULTI_BATTLE_AREA, 0, VAR_SPECIAL_RESULT, 11, DIR_NORTH
	releaseall
	end

_0BC2:
	scrcmd_310 77
	scrcmd_308 77
	return

_0BCA:
	scrcmd_311 77
	scrcmd_308 77
	scrcmd_309 77
	return

scr_seq_0004_002:
	scrcmd_230
	scrcmd_284
	end

	.balign 4, 0
_0BDC:
	WalkNormalEast
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0BE8:
	WalkNormalWest
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0BF4:
	WalkNormalNorth 2
	EndMovement

	.balign 4, 0
_0BFC:
	WalkNormalNorth
	EndMovement

	.balign 4, 0
_0C04:
	WalkNormalNorth
	SetInvisible
	EndMovement

_0C10:
	npc_msg msg_0046_00144
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_0004_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	party_legal_check VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0F27
	get_player_state VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 3
	goto_if_eq _0E3A
	get_party_count VAR_TEMP_x4009
	setvar VAR_TEMP_x400A, 0
_0C4F:
	get_partymon_species VAR_TEMP_x400A, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 172
	goto_if_ne _0C7B
	get_partymon_form VAR_TEMP_x400A, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0C7B
	goto _0E45

_0C7B:
	addvar VAR_TEMP_x400A, 1
	compare VAR_TEMP_x400A, VAR_TEMP_x4009
	goto_if_ge _0C94
	goto _0C4F

_0C94:
	goto _0C9C
	end
_0C9C:
	npc_msg msg_0046_00071
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	menu_item_add msg_0191_00042, 255, 0
	menu_item_add msg_0191_00011, 255, 1
	menu_item_add msg_0191_00045, 255, 2
	menu_exec
	switch VAR_SPECIAL_RESULT
	case 0, _0D14
	case 1, _0CF8
	case 2, _034C
	goto _034C
	end
_0CF8:
	npc_msg msg_0046_00072
	getmenuchoice VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0D14
	goto _034C
	end
_0D14:
	setvar VAR_SPECIAL_x8004, 9
	npc_msg msg_0046_00139
	getmenuchoice VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _034C
	comm_sanitize_party VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 255
	goto_if_eq _0E34
	setvar VAR_UNK_4133, 2
	setflag FLAG_UNK_966
	callstd std_prompt_save
	copyvar VAR_SPECIAL_RESULT, VAR_TEMP_x4000
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0D70
	setvar VAR_UNK_4133, 0
	clearflag FLAG_UNK_966
	goto _0359

_0D70:
	setvar VAR_UNK_4133, 2
	setflag FLAG_UNK_966
	npc_msg msg_0046_00077
	closemsg
	scrcmd_600
	heal_party
	apply_movement obj_player, _0BDC
	wait_movement
	scrcmd_815 0
	goto _0D99
	end
_0D99:
	scrcmd_446 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 300
	goto_if_ne _0DC8
	setvar VAR_TEMP_x4000, 4
	setvar VAR_TEMP_x4001, 11
	setvar VAR_TEMP_x4002, 14
	goto _0DE2

_0DC2:
	goto _0DE0

_0DC8:
	setvar VAR_TEMP_x4000, 7
	setvar VAR_TEMP_x4001, 2
	setvar VAR_TEMP_x4002, 5
	goto _0DE2

_0DE0:
	end

_0DE2:
	scrcmd_307 0, 0, VAR_TEMP_x4000, VAR_TEMP_x4002, 77
	call _0BC2
	apply_movement obj_player, _0BF4
	wait_movement
	call _0BCA
	apply_movement obj_player, _0BFC
	wait_movement
	scrcmd_307 0, 0, VAR_TEMP_x4000, VAR_TEMP_x4001, 77
	call _0BC2
	apply_movement obj_player, _0C04
	wait_movement
	call _0BCA
	releaseall
	scrcmd_286
	end

_0E34:
	callstd std_bag_is_full_griseous_orb
	end

_0E3A:
	npc_msg msg_0046_00146
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0E45:
	compare VAR_UNK_412F, 0
	goto_if_ne _0E5B
	npc_msg msg_0046_00172
	goto _0E5E

_0E5B:
	npc_msg msg_0046_00147
_0E5E:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_0004_004:
	end

scr_seq_0004_005:
	end

scr_seq_0004_006:
	end

scr_seq_0004_007:
	end

scr_seq_0004_008:
	end

scr_seq_0004_009:
	end

scr_seq_0004_010:
	scrcmd_436
	scrcmd_152
	restore_overworld
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	end

scr_seq_0004_011:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setflag FLAG_UNK_066
	npc_msg msg_0046_00116
	goto _0E9D
	end
_0E9D:
	npc_msg msg_0046_00117
	scrcmd_064 1, 1, 0, 1, VAR_SPECIAL_RESULT
	scrcmd_066 msg_0046_00042, 0
	scrcmd_066 msg_0046_00043, 1
	scrcmd_066 msg_0046_00011, 2
	scrcmd_067
	switch VAR_SPECIAL_RESULT
	case 0, _0EF6
	case 1, _0F1C
	case 2, _0EEB
	goto _0F1C
	end
_0EEB:
	npc_msg msg_0046_00119
	goto _0E9D
	end
_0EF6:
	closemsg
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	scrcmd_252
	restore_overworld
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	goto _0F1C
	end
_0F1C:
	npc_msg msg_0046_00118
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0F27:
	call _0F3F
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_0004_016:
	call _0F3F
	endstd
	end

_0F3F:
	npc_msg msg_0046_00142
	return

scr_seq_0004_017:
	simple_npc_msg msg_0046_00149
	end
	.balign 4, 0
