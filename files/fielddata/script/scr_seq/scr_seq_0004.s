#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_0004.h"
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
	comparevartovalue VAR_UNK_4133, 2
	gotoif eq, _0066
	comparevartovalue VAR_UNK_4133, 1
	gotoif eq, _0066
	end

_0066:
	scrcmd_375 255
	end

scr_seq_0004_012:
scr_seq_0004_014:
scr_seq_0004_015:
	scrcmd_609
	lockall
	scrcmd_446 VAR_SPECIAL_x800C
	scrcmd_840 VAR_SPECIAL_x800C, VAR_SPECIAL_x8004
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_SPECIAL_x8004, 0
	gotoif ne, _0099
	goto _027A
	.byte 0x16, 0x00, 0xa8, 0x00, 0x00, 0x00
_0099:
	comparevartovalue VAR_SPECIAL_x8004, 1
	gotoif ne, _00F0
	comparevartovalue VAR_TEMP_x4000, 12
	gotoif eq, _00BF
	goto _027A
	.byte 0x16, 0x00, 0x13, 0x00, 0x00, 0x00
_00BF:
	comparevartovalue VAR_TEMP_x4001, 2
	gotoif eq, _00D2
	goto _027A

_00D2:
	setvar VAR_TEMP_x4000, 12
	setvar VAR_TEMP_x4001, 2
	setvar VAR_TEMP_x4002, 5
	goto _0222
	.byte 0x16, 0x00, 0x51, 0x00, 0x00, 0x00
_00F0:
	comparevartovalue VAR_SPECIAL_x8004, 2
	gotoif ne, _0141
	comparevartovalue VAR_TEMP_x4000, 18
	gotoif eq, _0116
	goto _027A
	.byte 0x16, 0x00, 0x13, 0x00, 0x00, 0x00
_0116:
	comparevartovalue VAR_TEMP_x4001, 11
	gotoif eq, _0129
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
	scrcmd_446 VAR_SPECIAL_x800C
	scrcmd_840 VAR_SPECIAL_x800C, VAR_SPECIAL_x8004
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_SPECIAL_x8004, 0
	gotoif ne, _0174
	goto _027A
	.byte 0x16, 0x00
	.byte 0xa8, 0x00, 0x00, 0x00
_0174:
	comparevartovalue VAR_SPECIAL_x8004, 1
	gotoif ne, _01CB
	comparevartovalue VAR_TEMP_x4000, 7
	gotoif eq, _019A
	goto _027A
	.byte 0x16, 0x00, 0x13, 0x00, 0x00, 0x00
_019A:
	comparevartovalue VAR_TEMP_x4001, 2
	gotoif eq, _01AD
	goto _027A

_01AD:
	setvar VAR_TEMP_x4000, 7
	setvar VAR_TEMP_x4001, 2
	setvar VAR_TEMP_x4002, 5
	goto _0222
	.byte 0x16, 0x00, 0x51, 0x00, 0x00, 0x00
_01CB:
	comparevartovalue VAR_SPECIAL_x8004, 2
	gotoif ne, _021C
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif eq, _01F1
	goto _027A
	.byte 0x16, 0x00, 0x13, 0x00, 0x00
	.byte 0x00
_01F1:
	comparevartovalue VAR_TEMP_x4001, 11
	gotoif eq, _0204
	goto _027A

_0204:
	setvar VAR_TEMP_x4000, 4
	setvar VAR_TEMP_x4001, 11
	setvar VAR_TEMP_x4002, 14
	goto _0222

_021C:
	goto _027A

_0222:
	scrcmd_307 0, 0, 16384, 16385, 77
	call _0BC2
	apply_movement obj_player, _0288
	wait_movement
	call _0BCA
	scrcmd_307 0, 0, 16384, 16386, 77
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
	scrcmd_374 255
	releaseall
	end


_0288:
	step 1, 1
	step 70, 1
	step 13, 2
	step_end
	.byte 0x0d, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00

_02A0:
	step 13, 2
	step_end
scr_seq_0004_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_584 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0F27
	get_player_state VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, _0C10
	npc_msg msg_0046_00000
	goto _02DD
	.byte 0x02, 0x00
_02DD:
	npc_msg msg_0046_00002
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 166, 255, 0
	menu_item_add 167, 255, 1
	menu_item_add 11, 255, 2
	menu_item_add 12, 255, 3
	menu_exec
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, _0364
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, _03DF
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, _033F
	goto _034C

_033F:
	npc_msg msg_0046_00006
	closemsg
	goto _02DD
	.byte 0x02, 0x00
_034C:
	npc_msg msg_0046_00029
	waitbutton
	closemsg
	touchscreen_menu_show
	releaseall
	end

_0359:
	npc_msg msg_0046_00029
	waitbutton
	closemsg
	releaseall
	end

_0364:
	npc_msg msg_0046_00001
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 6, 255, 0
	menu_item_add 7, 255, 1
	menu_item_add 8, 255, 2
	menu_item_add 10, 255, 3
	menu_item_add 13, 255, 4
	menu_exec
	copyvar VAR_TEMP_x4003, VAR_SPECIAL_x800C
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, _0415
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, _0423
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, _044D
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, _04A1
	goto _02DD

_03DF:
	npc_msg msg_0046_00003
	menu_init 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 4, 255, 0
	menu_item_add 5, 255, 1
	menu_exec
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, _0477
	goto _02DD

_0415:
	setvar VAR_SPECIAL_x8004, 1
	goto _04AF
	.byte 0x02, 0x00
_0423:
	setvar VAR_SPECIAL_x8004, 2
	party_count_not_egg VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif lt, _0440
	goto _04AF

_0440:
	npc_msg msg_0046_00010
	waitbutton
	closemsg
	touchscreen_menu_show
	releaseall
	end

_044D:
	setvar VAR_SPECIAL_x8004, 3
	party_count_not_egg VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif lt, _046A
	goto _0905

_046A:
	npc_msg msg_0046_00141
	waitbutton
	closemsg
	touchscreen_menu_show
	releaseall
	end

_0477:
	setvar VAR_SPECIAL_x8004, 4
	party_count_not_egg VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif lt, _0494
	goto _0905

_0494:
	npc_msg msg_0046_00140
	waitbutton
	closemsg
	touchscreen_menu_show
	releaseall
	end

_04A1:
	setvar VAR_SPECIAL_x8004, 37
	goto _059A
	.byte 0x02, 0x00
_04AF:
	npc_msg msg_0046_00120
	menu_init 1, 1, 0, 1, VAR_TEMP_x4000
	menu_item_add 20, 255, 12
	scrcmd_798 0
	menu_item_add 19, 255, 0
	scrcmd_798 1
	menu_item_add 19, 255, 1
	scrcmd_798 2
	menu_item_add 19, 255, 2
	scrcmd_798 3
	menu_item_add 19, 255, 3
	scrcmd_798 4
	menu_item_add 19, 255, 4
	scrcmd_837 16384
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, _051B
	scrcmd_798 5
	menu_item_add 19, 255, 5
_051B:
	menu_item_add 22, 255, 255
	menu_exec
	copyvar VAR_SPECIAL_x8008, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x8008, 12
	gotoif eq, _08F9
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, _058E
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, _058E
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, _058E
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, _058E
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, _058E
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, _058E
	goto _02DD
	.byte 0x02, 0x00
_058E:
	scrcmd_800 16384
	goto _0682
	.byte 0x02, 0x00
_059A:
	setvar VAR_SPECIAL_x8004, 37
	npc_msg msg_0046_00120
	menu_init 1, 1, 0, 1, VAR_TEMP_x4000
	menu_item_add 20, 255, 6
	scrcmd_798 7
	menu_item_add 19, 255, 7
	scrcmd_798 8
	menu_item_add 19, 255, 8
	scrcmd_798 9
	menu_item_add 19, 255, 9
	scrcmd_798 10
	menu_item_add 23, 255, 10
	scrcmd_798 11
	menu_item_add 19, 255, 11
	menu_item_add 22, 255, 255
	menu_exec
	copyvar VAR_SPECIAL_x8008, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x8008, 6
	gotoif eq, _08F9
	comparevartovalue VAR_SPECIAL_x8008, 7
	gotoif eq, _058E
	comparevartovalue VAR_SPECIAL_x8008, 8
	gotoif eq, _058E
	comparevartovalue VAR_SPECIAL_x8008, 9
	gotoif eq, _0653
	comparevartovalue VAR_SPECIAL_x8008, 10
	gotoif eq, _065F
	comparevartovalue VAR_SPECIAL_x8008, 11
	gotoif eq, _0653
	goto _02DD

_0653:
	setvar VAR_SPECIAL_x8004, 38
	goto _058E

_065F:
	setvar VAR_SPECIAL_x8004, 38
	scrcmd_800 16384
	scrcmd_803 16384, 16386
	comparevartovalue VAR_TEMP_x4002, 1
	gotoif eq, _0440
	goto _0905

_0682:
	scrcmd_799 16384
	npc_msg msg_0046_00121
	menu_init 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 130, 255, 0
	menu_item_add 131, 255, 1
	comparevartovalue VAR_TEMP_x4000, 11
	gotoif ne, _06B6
	menu_item_add 24, 255, 2
_06B6:
	menu_item_add 22, 255, 3
	menu_exec
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, _0702
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, _0751
	comparevartovalue VAR_TEMP_x4000, 11
	gotoif ne, _06FA
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, _0778
_06FA:
	goto _0763
	.byte 0x02, 0x00
_0702:
	scrcmd_803 16384, 16386
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif eq, _0905
	comparevartovalue VAR_TEMP_x4002, 1
	gotoif eq, _072A
	goto _0744
	.byte 0x02, 0x00
_072A:
	npc_msg msg_0046_00122
	scrcmd_049
	comparevartovalue VAR_TEMP_x4003, 3
	gotoif eq, _059A
	goto _04AF
	.byte 0x02, 0x00
_0744:
	npc_msg msg_0046_00136
	scrcmd_049
	goto _04AF
	.byte 0x02
	.byte 0x00
_0751:
	closemsg
	scrcmd_801 16384
	scrcmd_049
	scrcmd_802
	goto _0682
	.byte 0x02, 0x00
_0763:
	comparevartovalue VAR_TEMP_x4003, 3
	gotoif eq, _059A
	goto _04AF
	.byte 0x02, 0x00
_0778:
	touchscreen_menu_show
	buffer_players_name 0
	npc_msg msg_0046_00025
	setvar VAR_TEMP_x4005, 0
	scrcmd_707 150, 16388
	comparevartovalue VAR_TEMP_x4004, 1
	gotoif ne, _07AA
	buffer_species_name 0, SPECIES_MEWTWO, 0, 0
	npc_msg msg_0046_00026
	setvar VAR_TEMP_x4005, 1
_07AA:
	scrcmd_707 249, 16388
	comparevartovalue VAR_TEMP_x4004, 1
	gotoif ne, _07CE
	buffer_species_name 0, SPECIES_LUGIA, 0, 0
	npc_msg msg_0046_00026
	setvar VAR_TEMP_x4005, 1
_07CE:
	scrcmd_707 250, 16388
	comparevartovalue VAR_TEMP_x4004, 1
	gotoif ne, _07F2
	buffer_species_name 0, SPECIES_HO_OH, 0, 0
	npc_msg msg_0046_00026
	setvar VAR_TEMP_x4005, 1
_07F2:
	scrcmd_707 382, 16388
	comparevartovalue VAR_TEMP_x4004, 1
	gotoif ne, _0816
	buffer_species_name 0, SPECIES_KYOGRE, 0, 0
	npc_msg msg_0046_00026
	setvar VAR_TEMP_x4005, 1
_0816:
	scrcmd_707 383, 16388
	comparevartovalue VAR_TEMP_x4004, 1
	gotoif ne, _083A
	buffer_species_name 0, SPECIES_GROUDON, 0, 0
	npc_msg msg_0046_00026
	setvar VAR_TEMP_x4005, 1
_083A:
	scrcmd_707 384, 16388
	comparevartovalue VAR_TEMP_x4004, 1
	gotoif ne, _085E
	buffer_species_name 0, SPECIES_RAYQUAZA, 0, 0
	npc_msg msg_0046_00026
	setvar VAR_TEMP_x4005, 1
_085E:
	scrcmd_707 483, 16388
	comparevartovalue VAR_TEMP_x4004, 1
	gotoif ne, _0882
	buffer_species_name 0, SPECIES_DIALGA, 0, 0
	npc_msg msg_0046_00026
	setvar VAR_TEMP_x4005, 1
_0882:
	scrcmd_707 484, 16388
	comparevartovalue VAR_TEMP_x4004, 1
	gotoif ne, _08A6
	buffer_species_name 0, SPECIES_PALKIA, 0, 0
	npc_msg msg_0046_00026
	setvar VAR_TEMP_x4005, 1
_08A6:
	scrcmd_707 487, 16388
	comparevartovalue VAR_TEMP_x4004, 1
	gotoif ne, _08CA
	buffer_species_name 0, SPECIES_GIRATINA, 0, 0
	npc_msg msg_0046_00026
	setvar VAR_TEMP_x4005, 1
_08CA:
	comparevartovalue VAR_TEMP_x4005, 1
	gotoif ne, _08E0
	npc_msg msg_0046_00027
	goto _08E3

_08E0:
	npc_msg msg_0046_00028
_08E3:
	touchscreen_menu_hide
	goto _0682
	.byte 0x29, 0x00, 0x05, 0x80, 0x00
	.byte 0x00, 0x16, 0x00, 0x0e, 0x00, 0x00, 0x00, 0x02, 0x00
_08F9:
	scrcmd_800 16384
	goto _0905
	.byte 0x02, 0x00
_0905:
	callstd 2006
	copyvar VAR_SPECIAL_x800C, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0924
	goto _0359
	.byte 0x02, 0x00
_0924:
	touchscreen_menu_hide
_0926:
	comparevartovalue VAR_SPECIAL_x8004, 1
	callif eq, _09BE
	comparevartovalue VAR_SPECIAL_x8004, 2
	callif eq, _09BE
	comparevartovalue VAR_SPECIAL_x8004, 3
	callif eq, _09BE
	comparevartovalue VAR_SPECIAL_x8004, 37
	callif eq, _09BE
	comparevartovalue VAR_SPECIAL_x8004, 38
	callif eq, _09BE
	comparevartovalue VAR_SPECIAL_x8004, 4
	callif eq, _09C3
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 14, 255, 0
	menu_item_add 15, 255, 1
	menu_item_add 5, 255, 2
	menu_exec
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, _09C8
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, _0A41
	goto _034C
	.byte 0x02, 0x00
_09BE:
	npc_msg msg_0046_00036
	return

_09C3:
	npc_msg msg_0046_00057
	return

_09C8:
	npc_msg msg_0046_00139
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0926
	closemsg
	scrcmd_226 32772, 32773, 0, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0A17
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, _0A23
	comparevartovalue VAR_SPECIAL_x800C, 4
	gotoif eq, _0A32
	goto _0ABA
	.byte 0x02, 0x00
_0A17:
	scrcmd_283
	touchscreen_menu_hide
	goto _0926
	.byte 0x02, 0x00
_0A23:
	scrcmd_283
	touchscreen_menu_show
	npc_msg msg_0046_00030
	waitbutton
	closemsg
	releaseall
	end

_0A32:
	scrcmd_283
	npc_msg msg_0046_00029
	waitbutton
	closemsg
	touchscreen_menu_show
	releaseall
	end

_0A41:
	npc_msg msg_0046_00139
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0926
	closemsg
	scrcmd_227 32772, 32773, 0, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0A90
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, _0A9C
	comparevartovalue VAR_SPECIAL_x800C, 4
	gotoif eq, _0AAB
	goto _0ABA
	.byte 0x02, 0x00
_0A90:
	scrcmd_283
	touchscreen_menu_hide
	goto _0926
	.byte 0x02, 0x00
_0A9C:
	scrcmd_283
	npc_msg msg_0046_00030
	waitbutton
	closemsg
	touchscreen_menu_show
	releaseall
	end

_0AAB:
	scrcmd_283
	npc_msg msg_0046_00029
	waitbutton
	closemsg
	touchscreen_menu_show
	releaseall
	end

_0ABA:
	setvar VAR_UNK_4133, 1
	setflag FLAG_UNK_966
	npc_msg_var msg_0046_00066
	scrcmd_348 45
	scrcmd_257 96
	closemsg
	scrcmd_600
	heal_party
	scrcmd_815 0
	scrcmd_446 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 300
	gotoif ne, _0B13
	apply_movement obj_player, _0BE8
	wait_movement
	setvar VAR_TEMP_x4000, 18
	setvar VAR_TEMP_x4001, 11
	setvar VAR_TEMP_x4002, 14
	goto _0B35
	.byte 0x16, 0x00, 0x22
	.byte 0x00, 0x00, 0x00
_0B13:
	apply_movement obj_player, _0BDC
	wait_movement
	setvar VAR_TEMP_x4000, 12
	setvar VAR_TEMP_x4001, 2
	setvar VAR_TEMP_x4002, 5
	goto _0B35

_0B35:
	scrcmd_307 0, 0, 16384, 16386, 77
	call _0BC2
	apply_movement obj_player, _0BF4
	wait_movement
	call _0BCA
	apply_movement obj_player, _0BFC
	wait_movement
	scrcmd_307 0, 0, 16384, 16385, 77
	call _0BC2
	apply_movement obj_player, _0C04
	wait_movement
	call _0BCA
	comparevartovalue VAR_SPECIAL_x8004, 4
	gotoif eq, _0BA8
	scrcmd_451 32780
	addvar VAR_SPECIAL_x800C, 7
	scrcmd_448 4, 0, 32780, 11, 0
	releaseall
	end

_0BA8:
	scrcmd_451 32780
	addvar VAR_SPECIAL_x800C, 6
	scrcmd_448 5, 0, 32780, 11, 0
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
	.byte 0x00

_0BDC:
	step 15, 1
	step 32, 1
	step_end

_0BE8:
	step 14, 1
	step 32, 1
	step_end

_0BF4:
	step 12, 2
	step_end

_0BFC:
	step 12, 1
	step_end

_0C04:
	step 12, 1
	step 69, 1
	step_end
_0C10:
	npc_msg msg_0046_00144
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0004_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_584 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0F27
	get_player_state VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, _0E3A
	get_party_count VAR_TEMP_x4009
	setvar VAR_TEMP_x400A, 0
_0C4F:
	get_partymon_species VAR_TEMP_x400A, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 172
	gotoif ne, _0C7B
	get_partymon_forme VAR_TEMP_x400A, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _0C7B
	goto _0E45

_0C7B:
	addvar VAR_TEMP_x400A, 1
	comparevartovar VAR_TEMP_x400A, VAR_TEMP_x4009
	gotoif ge, _0C94
	goto _0C4F

_0C94:
	goto _0C9C
	.byte 0x02, 0x00
_0C9C:
	npc_msg msg_0046_00071
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 42, 255, 0
	menu_item_add 11, 255, 1
	menu_item_add 45, 255, 2
	menu_exec
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, _0D14
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, _0CF8
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, _034C
	goto _034C
	.byte 0x02, 0x00
_0CF8:
	npc_msg msg_0046_00072
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0D14
	goto _034C
	.byte 0x02, 0x00
_0D14:
	setvar VAR_SPECIAL_x8004, 9
	npc_msg msg_0046_00139
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _034C
	scrcmd_689 32780
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, _0E34
	setvar VAR_UNK_4133, 2
	setflag FLAG_UNK_966
	callstd 2006
	copyvar VAR_SPECIAL_x800C, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0D70
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
	.byte 0x02, 0x00
_0D99:
	scrcmd_446 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 300
	gotoif ne, _0DC8
	setvar VAR_TEMP_x4000, 4
	setvar VAR_TEMP_x4001, 11
	setvar VAR_TEMP_x4002, 14
	goto _0DE2
	.byte 0x16, 0x00, 0x18, 0x00, 0x00, 0x00
_0DC8:
	setvar VAR_TEMP_x4000, 7
	setvar VAR_TEMP_x4001, 2
	setvar VAR_TEMP_x4002, 5
	goto _0DE2
	.byte 0x02, 0x00
_0DE2:
	scrcmd_307 0, 0, 16384, 16386, 77
	call _0BC2
	apply_movement obj_player, _0BF4
	wait_movement
	call _0BCA
	apply_movement obj_player, _0BFC
	wait_movement
	scrcmd_307 0, 0, 16384, 16385, 77
	call _0BC2
	apply_movement obj_player, _0C04
	wait_movement
	call _0BCA
	releaseall
	scrcmd_286
	end

_0E34:
	callstd 2041
	end

_0E3A:
	npc_msg msg_0046_00146
	waitbutton
	closemsg
	releaseall
	end

_0E45:
	comparevartovalue VAR_UNK_412F, 0
	gotoif ne, _0E5B
	npc_msg msg_0046_00172
	goto _0E5E

_0E5B:
	npc_msg msg_0046_00147
_0E5E:
	waitbutton
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
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
	end

scr_seq_0004_011:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setflag FLAG_UNK_066
	npc_msg msg_0046_00116
	goto _0E9D
	.byte 0x02, 0x00
_0E9D:
	npc_msg msg_0046_00117
	scrcmd_064 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_066 42, 0
	scrcmd_066 43, 1
	scrcmd_066 11, 2
	scrcmd_067
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, _0EF6
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, _0F1C
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, _0EEB
	goto _0F1C
	.byte 0x02, 0x00
_0EEB:
	npc_msg msg_0046_00119
	goto _0E9D
	.byte 0x02, 0x00
_0EF6:
	closemsg
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_252
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
	goto _0F1C
	.byte 0x02, 0x00
_0F1C:
	npc_msg msg_0046_00118
	waitbutton
	closemsg
	releaseall
	end

_0F27:
	call _0F3F
	waitbutton
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
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0046_00149
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
