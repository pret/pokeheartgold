#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D43R0103.h"
#include "msgdata/msg/msg_0128_D43R0103.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D43R0103_000
	scrdef scr_seq_D43R0103_001
	scrdef scr_seq_D43R0103_002
	scrdef scr_seq_D43R0103_003
	scrdef scr_seq_D43R0103_004
	scrdef scr_seq_D43R0103_005
	scrdef scr_seq_D43R0103_006
	scrdef_end

scr_seq_D43R0103_000:
	scrcmd_609
	lockall
	apply_movement obj_player, _0168
	wait_movement
	clearflag FLAG_UNK_20A
	show_person 0
	callstd std_play_rival_intro_music
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4000, 37
	gotoif ne, _0059
	apply_movement obj_D43R0103_gsrivel, _0180
	goto _007C

_0059:
	comparevartovalue VAR_TEMP_x4000, 38
	gotoif ne, _0074
	apply_movement obj_D43R0103_gsrivel, _0198
	goto _007C

_0074:
	apply_movement obj_D43R0103_gsrivel, _01B0
_007C:
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_player, _0178
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	buffer_players_name 0
	npc_msg msg_0128_D43R0103_00000
	closemsg
	get_starter_choice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 152
	gotoif ne, _00C1
	trainer_battle TRAINER_RIVAL_SILVER_9, 0, 0, 0
	goto _00E4

_00C1:
	comparevartovalue VAR_SPECIAL_x800C, 155
	gotoif ne, _00DC
	trainer_battle TRAINER_RIVAL_SILVER_13, 0, 0, 0
	goto _00E4

_00DC:
	trainer_battle TRAINER_RIVAL_SILVER_5, 0, 0, 0
_00E4:
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _015A
	callstd std_play_rival_outro_music
	npc_msg msg_0128_D43R0103_00001
	closemsg
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4000, 37
	gotoif ne, _011F
	apply_movement obj_D43R0103_gsrivel, _01C8
	goto _0142

_011F:
	comparevartovalue VAR_TEMP_x4000, 38
	gotoif ne, _013A
	apply_movement obj_D43R0103_gsrivel, _01E4
	goto _0142

_013A:
	apply_movement obj_D43R0103_gsrivel, _0200
_0142:
	wait_movement
	setflag FLAG_UNK_20A
	hide_person 0
	callstd std_fade_end_rival_outro_music
	setvar VAR_UNK_40C5, 1
	releaseall
	end

_015A:
	hide_person 0
	setflag FLAG_UNK_20A
	white_out
	releaseall
	end


_0168:
	step 75, 1
	step 63, 2
	step 1, 2
	step_end

_0178:
	step 9, 1
	step_end

_0180:
	step 16, 3
	step 3, 2
	step 19, 4
	step 0, 2
	step 16, 3
	step_end

_0198:
	step 16, 3
	step 3, 2
	step 19, 5
	step 0, 2
	step 16, 3
	step_end

_01B0:
	step 16, 3
	step 3, 2
	step 19, 6
	step 0, 2
	step 16, 3
	step_end

_01C8:
	step 1, 2
	step 13, 2
	step 2, 2
	step 14, 5
	step 1, 2
	step 13, 7
	step_end

_01E4:
	step 1, 2
	step 13, 2
	step 2, 2
	step 14, 6
	step 1, 2
	step 13, 7
	step_end

_0200:
	step 1, 2
	step 13, 2
	step 2, 2
	step 14, 7
	step 1, 2
	step 13, 7
	step_end
scr_seq_D43R0103_001:
	end

scr_seq_D43R0103_002:
	setvar VAR_TEMP_x4000, 57
	setvar VAR_TEMP_x4001, 42
	goto _0278

scr_seq_D43R0103_003:
	setvar VAR_TEMP_x4000, 28
	setvar VAR_TEMP_x4001, 38
	goto _0278

scr_seq_D43R0103_004:
	setvar VAR_TEMP_x4000, 31
	setvar VAR_TEMP_x4001, 44
	goto _0278

scr_seq_D43R0103_005:
	setvar VAR_TEMP_x4000, 22
	setvar VAR_TEMP_x4001, 17
	goto _0278

scr_seq_D43R0103_006:
	setvar VAR_TEMP_x4000, 58
	setvar VAR_TEMP_x4001, 28
	goto _0278

_0278:
	scrcmd_609
	lockall
	setvar VAR_UNK_40CA, 1
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, _02A9
	apply_movement obj_player, _0330
	apply_movement 253, _033C
	goto _02FF

_02A9:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _02CC
	apply_movement obj_player, _034C
	apply_movement 253, _0358
	goto _02FF

_02CC:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, _02EF
	apply_movement obj_player, _0384
	apply_movement 253, _0390
	goto _02FF

_02EF:
	apply_movement obj_player, _0368
	apply_movement 253, _0374
_02FF:
	wait_movement
	play_se SEQ_SE_GS_RAKKA01
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_176 178, 0, 16384, 16385, 32780
	fade_screen 6, 1, 1, 0x00
	wait_fade
	releaseall
	end
	.byte 0x00, 0x00, 0x00

_0330:
	step 40, 4
	step 69, 1
	step_end

_033C:
	step 62, 3
	step 20, 1
	step 69, 1
	step_end

_034C:
	step 41, 4
	step 69, 1
	step_end

_0358:
	step 62, 3
	step 21, 1
	step 69, 1
	step_end

_0368:
	step 42, 4
	step 69, 1
	step_end

_0374:
	step 62, 3
	step 22, 1
	step 69, 1
	step_end

_0384:
	step 43, 4
	step 69, 1
	step_end

_0390:
	step 62, 3
	step 23, 1
	step 69, 1
	step_end
	.balign 4, 0
