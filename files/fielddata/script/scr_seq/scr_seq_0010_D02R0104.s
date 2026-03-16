#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D02R0104.h"
#include "msgdata/msg/msg_0051_D02R0104.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D02R0104_000
	scrdef scr_seq_D02R0104_001
	scrdef scr_seq_D02R0104_002
	scrdef scr_seq_D02R0104_003
	scrdef scr_seq_D02R0104_004
	scrdef scr_seq_D02R0104_005
	scrdef_end

scr_seq_D02R0104_000:
	setflag FLAG_UNK_298
	get_weekday VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 1
	goto_if_ne _003B
	goto _0060

_0035:
	goto _005E

_003B:
	compare VAR_TEMP_x4000, 2
	goto_if_ne _0054
	goto _007D

_004E:
	goto _005E

_0054:
	setvar VAR_UNK_40F6, 1
	setflag FLAG_UNK_26E
_005E:
	end

_0060:
	scrcmd_379 VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 3
	goto_if_eq _009A
	setvar VAR_UNK_40F6, 1
	setflag FLAG_UNK_26E
	end

_007D:
	scrcmd_379 VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 4
	goto_if_eq _009A
	setvar VAR_UNK_40F6, 1
	setflag FLAG_UNK_26E
	end

_009A:
	setvar VAR_UNK_40F6, 0
	clearflag FLAG_UNK_26E
	end

scr_seq_D02R0104_005:
	get_weekday VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 1
	goto_if_ne _00C3
	goto _0113

_00BD:
	goto _00E2

_00C3:
	compare VAR_TEMP_x4000, 2
	goto_if_ne _00DC
	goto _012A

_00D6:
	goto _00E2

_00DC:
	goto _00E2

_00E2:
	compare VAR_UNK_40F6, 1
	goto_if_eq _0141
	setflag FLAG_UNK_26E
	hide_person obj_D02R0104_tsure_poke_static_clefairy
	hide_person obj_D02R0104_tsure_poke_static_clefairy_2
	hide_person obj_D02R0104_tsure_poke_static_clefairy_3
	hide_person obj_D02R0104_tsure_poke_static_clefairy_4
	hide_person obj_D02R0104_tsure_poke_static_clefairy_5
	hide_person obj_D02R0104_tsure_poke_static_clefairy_6
	setvar VAR_UNK_40F6, 1
	end

_0113:
	scrcmd_379 VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 3
	goto_if_eq _0141
	goto _00E2

_012A:
	scrcmd_379 VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 4
	goto_if_eq _0141
	goto _00E2

_0141:
	end

scr_seq_D02R0104_002:
	scrcmd_609
	lockall
	clearflag FLAG_UNK_298
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	scrcmd_102 VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	apply_movement 241, _0330
	apply_movement obj_D02R0104_tsure_poke_static_clefairy, _0344
	apply_movement obj_D02R0104_tsure_poke_static_clefairy_2, _0350
	apply_movement obj_D02R0104_tsure_poke_static_clefairy_3, _035C
	apply_movement obj_D02R0104_tsure_poke_static_clefairy_4, _0368
	apply_movement obj_D02R0104_tsure_poke_static_clefairy_5, _0374
	apply_movement obj_D02R0104_tsure_poke_static_clefairy_6, _037C
	wait_movement
	play_cry SPECIES_CLEFAIRY, 0
	apply_movement obj_D02R0104_tsure_poke_static_clefairy, _0384
	apply_movement obj_D02R0104_tsure_poke_static_clefairy_2, _0394
	apply_movement obj_D02R0104_tsure_poke_static_clefairy_3, _03A4
	apply_movement obj_D02R0104_tsure_poke_static_clefairy_4, _03B4
	apply_movement obj_D02R0104_tsure_poke_static_clefairy_5, _03C4
	apply_movement obj_D02R0104_tsure_poke_static_clefairy_6, _03CC
	wait_movement
	play_cry SPECIES_CLEFAIRY, 0
	apply_movement obj_D02R0104_tsure_poke_static_clefairy, _03D4
	apply_movement obj_D02R0104_tsure_poke_static_clefairy_2, _03F0
	apply_movement obj_D02R0104_tsure_poke_static_clefairy_3, _040C
	apply_movement obj_D02R0104_tsure_poke_static_clefairy_4, _0428
	apply_movement obj_D02R0104_tsure_poke_static_clefairy_5, _0444
	apply_movement obj_D02R0104_tsure_poke_static_clefairy_6, _0468
	wait_movement
	play_cry SPECIES_CLEFAIRY, 0
	apply_movement obj_D02R0104_tsure_poke_static_clefairy, _048C
	apply_movement obj_D02R0104_tsure_poke_static_clefairy_2, _04A8
	apply_movement obj_D02R0104_tsure_poke_static_clefairy_3, _04C4
	apply_movement obj_D02R0104_tsure_poke_static_clefairy_4, _04E0
	apply_movement obj_D02R0104_tsure_poke_static_clefairy_5, _04FC
	apply_movement obj_D02R0104_tsure_poke_static_clefairy_6, _0520
	wait_movement
	play_cry SPECIES_CLEFAIRY, 0
	apply_movement obj_D02R0104_tsure_poke_static_clefairy, _0544
	apply_movement obj_D02R0104_tsure_poke_static_clefairy_2, _0560
	apply_movement obj_D02R0104_tsure_poke_static_clefairy_3, _057C
	apply_movement obj_D02R0104_tsure_poke_static_clefairy_4, _0598
	apply_movement obj_D02R0104_tsure_poke_static_clefairy_5, _05B4
	apply_movement obj_D02R0104_tsure_poke_static_clefairy_6, _05D8
	wait_movement
	play_cry SPECIES_CLEFAIRY, 0
	apply_movement obj_D02R0104_tsure_poke_static_clefairy, _05FC
	apply_movement obj_D02R0104_tsure_poke_static_clefairy_2, _0614
	apply_movement obj_D02R0104_tsure_poke_static_clefairy_3, _0630
	apply_movement obj_D02R0104_tsure_poke_static_clefairy_4, _064C
	apply_movement obj_D02R0104_tsure_poke_static_clefairy_5, _0668
	apply_movement obj_D02R0104_tsure_poke_static_clefairy_6, _068C
	wait_movement
	play_cry SPECIES_CLEFAIRY, 0
	apply_movement obj_D02R0104_tsure_poke_static_clefairy, _06B0
	apply_movement obj_D02R0104_tsure_poke_static_clefairy_2, _06D4
	apply_movement obj_D02R0104_tsure_poke_static_clefairy_3, _06F8
	apply_movement obj_D02R0104_tsure_poke_static_clefairy_4, _0720
	apply_movement obj_D02R0104_tsure_poke_static_clefairy_5, _0744
	apply_movement obj_D02R0104_tsure_poke_static_clefairy_6, _0760
	wait_movement
	show_person obj_D02R0104_monstarball
	apply_movement obj_D02R0104_tsure_poke_static_clefairy_4, _077C
	apply_movement obj_D02R0104_tsure_poke_static_clefairy_6, _0798
	wait_movement
	hide_person obj_D02R0104_tsure_poke_static_clefairy
	hide_person obj_D02R0104_tsure_poke_static_clefairy_2
	hide_person obj_D02R0104_tsure_poke_static_clefairy_3
	hide_person obj_D02R0104_tsure_poke_static_clefairy_4
	hide_person obj_D02R0104_tsure_poke_static_clefairy_5
	hide_person obj_D02R0104_tsure_poke_static_clefairy_6
	setflag FLAG_UNK_26E
	setvar VAR_UNK_40F6, 1
	setflag FLAG_UNK_AB5
	apply_movement 241, _0338
	wait_movement
	scrcmd_103
	releaseall
	end

	.balign 4, 0
_0330:
	WalkSlightlyFastNorth 2
	EndMovement

	.balign 4, 0
_0338:
	Delay16
	WalkSlightlyFastSouth 2
	EndMovement

	.balign 4, 0
_0344:
	WalkOnSpotNormalNorth 5
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_0350:
	WalkOnSpotNormalWest 5
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_035C:
	WalkOnSpotNormalSouth 5
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0368:
	WalkOnSpotNormalEast 5
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0374:
	WalkOnSpotNormalWest 6
	EndMovement

	.balign 4, 0
_037C:
	WalkOnSpotNormalEast 6
	EndMovement

	.balign 4, 0
_0384:
	WalkOnSpotNormalEast 6
	WalkNormalEast
	JumpFarEast
	EndMovement

	.balign 4, 0
_0394:
	WalkOnSpotNormalNorth 6
	WalkNormalNorth
	JumpFarNorth
	EndMovement

	.balign 4, 0
_03A4:
	WalkOnSpotNormalWest 6
	WalkNormalWest
	JumpFarWest
	EndMovement

	.balign 4, 0
_03B4:
	WalkOnSpotNormalSouth 6
	WalkNormalSouth
	JumpFarSouth
	EndMovement

	.balign 4, 0
_03C4:
	WalkOnSpotNormalWest 8
	EndMovement

	.balign 4, 0
_03CC:
	WalkOnSpotNormalEast 8
	EndMovement

	.balign 4, 0
_03D4:
	WalkOnSpotNormalNorth
	WalkOnSpotNormalWest
	WalkOnSpotNormalSouth
	WalkOnSpotNormalEast
	WalkNormalNorth 4
	JumpFarNorth
	EndMovement

	.balign 4, 0
_03F0:
	WalkOnSpotNormalWest
	WalkOnSpotNormalSouth
	WalkOnSpotNormalEast
	WalkOnSpotNormalNorth
	WalkNormalWest 4
	JumpFarWest
	EndMovement

	.balign 4, 0
_040C:
	WalkOnSpotNormalSouth
	WalkOnSpotNormalEast
	WalkOnSpotNormalNorth
	WalkOnSpotNormalWest
	WalkNormalSouth 4
	JumpFarSouth
	EndMovement

	.balign 4, 0
_0428:
	WalkOnSpotNormalEast
	WalkOnSpotNormalNorth
	WalkOnSpotNormalWest
	WalkOnSpotNormalSouth
	WalkNormalEast 4
	JumpFarEast
	EndMovement

	.balign 4, 0
_0444:
	WalkOnSpotNormalWest
	WalkOnSpotNormalSouth
	WalkOnSpotNormalEast
	WalkOnSpotNormalNorth
	WalkOnSpotNormalWest
	WalkOnSpotNormalSouth
	WalkOnSpotNormalEast
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0468:
	WalkOnSpotNormalWest
	WalkOnSpotNormalSouth
	WalkOnSpotNormalEast
	WalkOnSpotNormalNorth
	WalkOnSpotNormalWest
	WalkOnSpotNormalSouth
	WalkOnSpotNormalEast
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_048C:
	WalkOnSpotNormalWest
	WalkOnSpotNormalSouth
	WalkOnSpotNormalEast
	WalkOnSpotNormalNorth
	WalkNormalWest 4
	JumpFarWest
	EndMovement

	.balign 4, 0
_04A8:
	WalkOnSpotNormalSouth
	WalkOnSpotNormalEast
	WalkOnSpotNormalNorth
	WalkOnSpotNormalWest
	WalkNormalSouth 4
	JumpFarSouth
	EndMovement

	.balign 4, 0
_04C4:
	WalkOnSpotNormalEast
	WalkOnSpotNormalNorth
	WalkOnSpotNormalWest
	WalkOnSpotNormalSouth
	WalkNormalEast 4
	JumpFarEast
	EndMovement

	.balign 4, 0
_04E0:
	WalkOnSpotNormalNorth
	WalkOnSpotNormalWest
	WalkOnSpotNormalSouth
	WalkOnSpotNormalEast
	WalkNormalNorth 4
	JumpFarNorth
	EndMovement

	.balign 4, 0
_04FC:
	WalkOnSpotNormalEast
	WalkOnSpotNormalNorth
	WalkOnSpotNormalWest
	WalkOnSpotNormalSouth
	WalkOnSpotNormalEast
	WalkOnSpotNormalNorth
	WalkOnSpotNormalWest
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0520:
	WalkOnSpotNormalEast
	WalkOnSpotNormalNorth
	WalkOnSpotNormalWest
	WalkOnSpotNormalSouth
	WalkOnSpotNormalEast
	WalkOnSpotNormalNorth
	WalkOnSpotNormalWest
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0544:
	WalkOnSpotNormalSouth
	WalkOnSpotNormalEast
	WalkOnSpotNormalNorth
	WalkOnSpotNormalWest
	WalkNormalSouth 4
	JumpFarSouth
	EndMovement

	.balign 4, 0
_0560:
	WalkOnSpotNormalEast
	WalkOnSpotNormalNorth
	WalkOnSpotNormalWest
	WalkOnSpotNormalSouth
	WalkNormalEast 4
	JumpFarEast
	EndMovement

	.balign 4, 0
_057C:
	WalkOnSpotNormalNorth
	WalkOnSpotNormalWest
	WalkOnSpotNormalSouth
	WalkOnSpotNormalEast
	WalkNormalNorth 4
	JumpFarNorth
	EndMovement

	.balign 4, 0
_0598:
	WalkOnSpotNormalWest
	WalkOnSpotNormalSouth
	WalkOnSpotNormalEast
	WalkOnSpotNormalNorth
	WalkNormalWest 4
	JumpFarWest
	EndMovement

	.balign 4, 0
_05B4:
	WalkOnSpotNormalWest
	WalkOnSpotNormalSouth
	WalkOnSpotNormalEast
	WalkOnSpotNormalNorth
	WalkOnSpotNormalWest
	WalkOnSpotNormalSouth
	WalkOnSpotNormalEast
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_05D8:
	WalkOnSpotNormalWest
	WalkOnSpotNormalSouth
	WalkOnSpotNormalEast
	WalkOnSpotNormalNorth
	WalkOnSpotNormalWest
	WalkOnSpotNormalSouth
	WalkOnSpotNormalEast
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_05FC:
	WalkOnSpotNormalEast
	WalkOnSpotNormalNorth
	WalkOnSpotNormalWest
	WalkOnSpotNormalSouth
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_0614:
	WalkOnSpotNormalNorth
	WalkOnSpotNormalWest
	WalkOnSpotNormalSouth
	WalkOnSpotNormalEast
	WalkNormalNorth 2
	JumpFarNorth
	EndMovement

	.balign 4, 0
_0630:
	WalkOnSpotNormalWest
	WalkOnSpotNormalSouth
	WalkOnSpotNormalEast
	WalkOnSpotNormalNorth
	WalkNormalWest 2
	JumpFarWest
	EndMovement

	.balign 4, 0
_064C:
	WalkOnSpotNormalSouth
	WalkOnSpotNormalEast
	WalkOnSpotNormalNorth
	WalkOnSpotNormalWest
	WalkNormalSouth 2
	JumpFarSouth
	EndMovement

	.balign 4, 0
_0668:
	WalkOnSpotNormalEast
	WalkOnSpotNormalNorth
	WalkOnSpotNormalWest
	WalkOnSpotNormalSouth
	WalkOnSpotNormalEast
	WalkOnSpotNormalNorth
	WalkOnSpotNormalWest
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_068C:
	WalkOnSpotNormalEast
	WalkOnSpotNormalNorth
	WalkOnSpotNormalWest
	WalkOnSpotNormalSouth
	WalkOnSpotNormalEast
	WalkOnSpotNormalNorth
	WalkOnSpotNormalWest
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_06B0:
	JumpOnSpotFastNorth 3
	WalkFastEast 6
	WalkFastNorth 3
	WalkFastEast 3
	WalkFastSouth 3
	WalkFastEast
	JumpFarEast
	WalkFastEast 2
	EndMovement

	.balign 4, 0
_06D4:
	WalkOnSpotNormalSouth
	EmoteExclamationMark
	WalkFastSouth
	WalkFastEast 3
	WalkFastSouth 2
	WalkFastEast
	JumpFarEast
	WalkFastEast 2
	EndMovement

	.balign 4, 0
_06F8:
	WalkOnSpotNormalSouth
	EmoteExclamationMark
	WalkFastEast 4
	WalkFastSouth 3
	WalkFastEast 3
	WalkFastSouth 2
	WalkFastEast
	JumpFarEast
	WalkFastEast 2
	EndMovement

	.balign 4, 0
_0720:
	WalkOnSpotNormalSouth
	EmoteExclamationMark
	WalkFastSouth 2
	WalkFastEast 6
	WalkFastNorth 3
	WalkFastEast 2
	WalkFastSouth 3
	JumpOnSpotFastWest 2
	EndMovement

	.balign 4, 0
_0744:
	WalkOnSpotNormalSouth
	EmoteExclamationMark
	WalkFastSouth 2
	WalkFastEast 2
	JumpFarEast
	WalkFastEast 3
	EndMovement

	.balign 4, 0
_0760:
	WalkOnSpotNormalSouth
	EmoteExclamationMark
	WalkNormalEast 2
	WalkNormalSouth 3
	WalkNormalEast 5
	JumpOnSpotFastEast 2
	EndMovement

	.balign 4, 0
_077C:
	WalkOnSpotFastWest 2
	WalkOnSpotFastNorth 4
	JumpOnSpotFastNorth 2
	WalkFastEast 2
	JumpFarEast
	WalkFastEast 3
	EndMovement

	.balign 4, 0
_0798:
	WalkNormalEast
	WalkNormalNorth 3
	WalkNormalEast 3
	WalkNormalSouth 3
	WalkNormalEast
	JumpFarEast
	WalkNormalEast 3
	EndMovement

	.balign 4, 0
_07B8:
	SetVisible
	EndMovement

scr_seq_D02R0104_001:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0051_D02R0104_00001, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_D02R0104_003:
	setvar VAR_SPECIAL_x8008, 81
	setvar VAR_SPECIAL_x8009, 1
	goto _07E9
	end

_07E9:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	wait_se SEQ_SE_DP_SELECT
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x8008
	copyvar VAR_SPECIAL_x8005, VAR_SPECIAL_x8009
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0825
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0866
	end

_0825:
	callstd std_hidden_item_fanfare
	hide_person VAR_SPECIAL_LAST_TALKED
	giveitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	buffer_players_name 0
	buffer_item_name 1, VAR_SPECIAL_x8004
	npc_msg msg_0051_D02R0104_00002
	wait_fanfare
	buffer_players_name 0
	buffer_item_name 1, VAR_SPECIAL_x8004
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	buffer_pocket_name 2, VAR_SPECIAL_RESULT
	npc_msg msg_0051_D02R0104_00003
	wait_button_or_walk_away
	setvar VAR_SPECIAL_RESULT, 1
_0860:
	closemsg
	releaseall
	end

_0866:
	buffer_item_name 0, VAR_SPECIAL_x8004
	npc_msg msg_0051_D02R0104_00004
	wait_button_or_walk_away
	setvar VAR_SPECIAL_RESULT, 0
	goto _0860
	end

scr_seq_D02R0104_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0051_D02R0104_00005
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
