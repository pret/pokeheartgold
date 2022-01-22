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
	.byte 0x16, 0x00, 0x23, 0x00, 0x00, 0x00
_003B:
	compare VAR_TEMP_x4000, 2
	goto_if_ne _0054
	goto _007D
	.byte 0x16, 0x00
	.byte 0x0a, 0x00, 0x00, 0x00
_0054:
	setvar VAR_UNK_40F6, 1
	setflag FLAG_UNK_26E
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
	.byte 0x16, 0x00, 0x1f
	.byte 0x00, 0x00, 0x00
_00C3:
	compare VAR_TEMP_x4000, 2
	goto_if_ne _00DC
	goto _012A
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
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
	.byte 0x00, 0x00, 0x00

_0330:
	step 76, 2
	step_end

_0338:
	step 65, 1
	step 77, 2
	step_end

_0344:
	step 32, 5
	step 35, 1
	step_end

_0350:
	step 34, 5
	step 32, 1
	step_end

_035C:
	step 33, 5
	step 34, 1
	step_end

_0368:
	step 35, 5
	step 33, 1
	step_end

_0374:
	step 34, 6
	step_end

_037C:
	step 35, 6
	step_end

_0384:
	step 35, 6
	step 15, 1
	step 59, 1
	step_end

_0394:
	step 32, 6
	step 12, 1
	step 56, 1
	step_end

_03A4:
	step 34, 6
	step 14, 1
	step 58, 1
	step_end

_03B4:
	step 33, 6
	step 13, 1
	step 57, 1
	step_end

_03C4:
	step 34, 8
	step_end

_03CC:
	step 35, 8
	step_end

_03D4:
	step 32, 1
	step 34, 1
	step 33, 1
	step 35, 1
	step 12, 4
	step 56, 1
	step_end

_03F0:
	step 34, 1
	step 33, 1
	step 35, 1
	step 32, 1
	step 14, 4
	step 58, 1
	step_end

_040C:
	step 33, 1
	step 35, 1
	step 32, 1
	step 34, 1
	step 13, 4
	step 57, 1
	step_end

_0428:
	step 35, 1
	step 32, 1
	step 34, 1
	step 33, 1
	step 15, 4
	step 59, 1
	step_end

_0444:
	step 34, 1
	step 33, 1
	step 35, 1
	step 32, 1
	step 34, 1
	step 33, 1
	step 35, 1
	step 32, 1
	step_end

_0468:
	step 34, 1
	step 33, 1
	step 35, 1
	step 32, 1
	step 34, 1
	step 33, 1
	step 35, 1
	step 32, 1
	step_end

_048C:
	step 34, 1
	step 33, 1
	step 35, 1
	step 32, 1
	step 14, 4
	step 58, 1
	step_end

_04A8:
	step 33, 1
	step 35, 1
	step 32, 1
	step 34, 1
	step 13, 4
	step 57, 1
	step_end

_04C4:
	step 35, 1
	step 32, 1
	step 34, 1
	step 33, 1
	step 15, 4
	step 59, 1
	step_end

_04E0:
	step 32, 1
	step 34, 1
	step 33, 1
	step 35, 1
	step 12, 4
	step 56, 1
	step_end

_04FC:
	step 35, 1
	step 32, 1
	step 34, 1
	step 33, 1
	step 35, 1
	step 32, 1
	step 34, 1
	step 33, 1
	step_end

_0520:
	step 35, 1
	step 32, 1
	step 34, 1
	step 33, 1
	step 35, 1
	step 32, 1
	step 34, 1
	step 33, 1
	step_end

_0544:
	step 33, 1
	step 35, 1
	step 32, 1
	step 34, 1
	step 13, 4
	step 57, 1
	step_end

_0560:
	step 35, 1
	step 32, 1
	step 34, 1
	step 33, 1
	step 15, 4
	step 59, 1
	step_end

_057C:
	step 32, 1
	step 34, 1
	step 33, 1
	step 35, 1
	step 12, 4
	step 56, 1
	step_end

_0598:
	step 34, 1
	step 33, 1
	step 35, 1
	step 32, 1
	step 14, 4
	step 58, 1
	step_end

_05B4:
	step 34, 1
	step 33, 1
	step 35, 1
	step 32, 1
	step 34, 1
	step 33, 1
	step 35, 1
	step 32, 1
	step_end

_05D8:
	step 34, 1
	step 33, 1
	step 35, 1
	step 32, 1
	step 34, 1
	step 33, 1
	step 35, 1
	step 32, 1
	step_end

_05FC:
	step 35, 1
	step 32, 1
	step 34, 1
	step 33, 1
	step 75, 1
	step_end

_0614:
	step 32, 1
	step 34, 1
	step 33, 1
	step 35, 1
	step 12, 2
	step 56, 1
	step_end

_0630:
	step 34, 1
	step 33, 1
	step 35, 1
	step 32, 1
	step 14, 2
	step 58, 1
	step_end

_064C:
	step 33, 1
	step 35, 1
	step 32, 1
	step 34, 1
	step 13, 2
	step 57, 1
	step_end

_0668:
	step 35, 1
	step 32, 1
	step 34, 1
	step 33, 1
	step 35, 1
	step 32, 1
	step 34, 1
	step 33, 1
	step_end

_068C:
	step 35, 1
	step 32, 1
	step 34, 1
	step 33, 1
	step 35, 1
	step 32, 1
	step 34, 1
	step 33, 1
	step_end

_06B0:
	step 48, 3
	step 19, 6
	step 16, 3
	step 19, 3
	step 17, 3
	step 19, 1
	step 59, 1
	step 19, 2
	step_end

_06D4:
	step 33, 1
	step 75, 1
	step 17, 1
	step 19, 3
	step 17, 2
	step 19, 1
	step 59, 1
	step 19, 2
	step_end

_06F8:
	step 33, 1
	step 75, 1
	step 19, 4
	step 17, 3
	step 19, 3
	step 17, 2
	step 19, 1
	step 59, 1
	step 19, 2
	step_end

_0720:
	step 33, 1
	step 75, 1
	step 17, 2
	step 19, 6
	step 16, 3
	step 19, 2
	step 17, 3
	step 50, 2
	step_end

_0744:
	step 33, 1
	step 75, 1
	step 17, 2
	step 19, 2
	step 59, 1
	step 19, 3
	step_end

_0760:
	step 33, 1
	step 75, 1
	step 15, 2
	step 13, 3
	step 15, 5
	step 51, 2
	step_end

_077C:
	step 38, 2
	step 36, 4
	step 48, 2
	step 19, 2
	step 59, 1
	step 19, 3
	step_end

_0798:
	step 15, 1
	step 12, 3
	step 15, 3
	step 13, 3
	step 15, 1
	step 59, 1
	step 15, 3
	step_end
	.byte 0x46, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00
scr_seq_D02R0104_001:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0051_D02R0104_00001, VAR_SPECIAL_x800C
	callstd std_signpost
	end

scr_seq_D02R0104_003:
	setvar VAR_SPECIAL_x8008, 81
	setvar VAR_SPECIAL_x8009, 1
	goto _07E9
	.byte 0x02, 0x00
_07E9:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	wait_se SEQ_SE_DP_SELECT
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x8008
	copyvar VAR_SPECIAL_x8005, VAR_SPECIAL_x8009
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	compare VAR_SPECIAL_x800C, 1
	goto_if_eq _0825
	compare VAR_SPECIAL_x800C, 0
	goto_if_eq _0866
	end

_0825:
	callstd std_hidden_item_fanfare
	hide_person VAR_SPECIAL_x800D
	giveitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	buffer_players_name 0
	buffer_item_name 1, VAR_SPECIAL_x8004
	npc_msg msg_0051_D02R0104_00002
	wait_fanfare
	buffer_players_name 0
	buffer_item_name 1, VAR_SPECIAL_x8004
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	buffer_pocket_name 2, VAR_SPECIAL_x800C
	npc_msg msg_0051_D02R0104_00003
	waitbutton
	setvar VAR_SPECIAL_x800C, 1
_0860:
	closemsg
	releaseall
	end

_0866:
	buffer_item_name 0, VAR_SPECIAL_x8004
	npc_msg msg_0051_D02R0104_00004
	waitbutton
	setvar VAR_SPECIAL_x800C, 0
	goto _0860
	.byte 0x02, 0x00
scr_seq_D02R0104_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0051_D02R0104_00005
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
