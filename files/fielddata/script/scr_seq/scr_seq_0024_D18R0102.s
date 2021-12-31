#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D18R0102.h"
#include "msgdata/msg/msg_0061_D18R0102.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D18R0102_000
	scrdef scr_seq_D18R0102_001
	scrdef scr_seq_D18R0102_002
	scrdef_end

scr_seq_D18R0102_002:
	checkflag FLAG_UNK_0A4
	gotoif TRUE, _001B
	end

_001B:
	setflag FLAG_UNK_30E
	hide_person 12
	clearflag FLAG_UNK_0A4
	end

scr_seq_D18R0102_000:
	scrcmd_609
	lockall
	scrcmd_076 243, 0
	release obj_D18R0102_tsure_poke_616
	scrcmd_523 2, 2, 90, 2, 0
	lock obj_D18R0102_tsure_poke_616
	scrcmd_077
	scrcmd_076 244, 0
	release obj_D18R0102_tsure_poke_617
	scrcmd_523 1, 2, 90, 2, 0
	lock obj_D18R0102_tsure_poke_617
	scrcmd_077
	scrcmd_076 245, 0
	release obj_D18R0102_tsure_poke_618
	scrcmd_523 0, 2, 90, 2, 0
	lock obj_D18R0102_tsure_poke_618
	scrcmd_077
	apply_movement obj_D18R0102_tsure_poke_616, _0224
	wait_movement
	apply_movement obj_D18R0102_tsure_poke_617, _0234
	wait_movement
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	comparevartovalue VAR_SPECIAL_x8005, 16
	gotoif ne, _00C8
	apply_movement obj_D18R0102_tsure_poke_618, _0244
	wait_movement
	scrcmd_076 245, 0
	apply_movement obj_D18R0102_tsure_poke_618, _0254
	scrcmd_077
	goto _00E2

_00C8:
	apply_movement obj_D18R0102_tsure_poke_618, _0268
	wait_movement
	scrcmd_076 245, 0
	apply_movement obj_D18R0102_tsure_poke_618, _0278
	scrcmd_077
_00E2:
	wait_movement
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_player, _028C
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	setflag FLAG_UNK_1C9
	setflag FLAG_UNK_1CA
	setflag FLAG_UNK_1CB
	hide_person 2
	hide_person 1
	hide_person 0
	scrcmd_464 0
	scrcmd_464 1
	wait 15, VAR_SPECIAL_x800C
	clearflag FLAG_UNK_1C8
	play_se SEQ_SE_DP_KAIDAN2
	show_person 3
	lock obj_D18R0102_minaki
	wait_se SEQ_SE_DP_KAIDAN2
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	comparevartovalue VAR_SPECIAL_x8005, 16
	gotoif ne, _015B
	apply_movement obj_D18R0102_minaki, _029C
	goto _016B

_015B:
	apply_movement obj_D18R0102_minaki, _02B0
	apply_movement obj_player, _02D8
_016B:
	wait_movement
	npc_msg msg_0061_D18R0102_00000
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	comparevartovalue VAR_SPECIAL_x8005, 16
	gotoif ne, _0191
	apply_movement obj_D18R0102_minaki, _02C4
	goto _01A1

_0191:
	apply_movement obj_D18R0102_minaki, _02D0
	apply_movement obj_player, _02D8
_01A1:
	wait_movement
	buffer_players_name 0
	npc_msg msg_0061_D18R0102_00001
	closemsg
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	comparevartovalue VAR_SPECIAL_x8005, 16
	gotoif ne, _01CC
	apply_movement obj_D18R0102_minaki, _02E8
	goto _01D4

_01CC:
	apply_movement obj_D18R0102_minaki, _02F8
_01D4:
	wait_movement
	play_se SEQ_SE_DP_KAIDAN2
	wait 2, VAR_SPECIAL_x800C
	hide_person 3
	wait_se SEQ_SE_DP_KAIDAN2
	setflag FLAG_UNK_1C8
	setflag FLAG_UNK_1C7
	setflag FLAG_UNK_1CC
	setflag FLAG_UNK_1DE
	setflag FLAG_UNK_1DF
	setflag FLAG_UNK_1E0
	clearflag FLAG_UNK_1E1
	setvar VAR_UNK_40A1, 1
	setvar VAR_UNK_4076, 1
	setvar VAR_UNK_4079, 2
	setflag FLAG_UNK_247
	clearflag FLAG_UNK_248
	releaseall
	end
	.byte 0x00, 0x00

_0224:
	step 105, 1
	step 69, 1
	step_end
	.byte 0x02, 0x00, 0x00, 0x00

_0234:
	step 106, 1
	step 69, 1
	step_end
	.byte 0x02, 0x00, 0x00, 0x00

_0244:
	step 107, 1
	step 3, 1
	step_end
	.byte 0x02, 0x00, 0x00, 0x00

_0254:
	step 62, 6
	step 108, 1
	step 69, 1
	step_end
	.byte 0x02, 0x00, 0x00, 0x00

_0268:
	step 109, 1
	step 3, 1
	step_end
	.byte 0x02, 0x00, 0x00, 0x00

_0278:
	step 62, 6
	step 110, 1
	step 69, 1
	step_end
	.byte 0x02, 0x00, 0x00, 0x00

_028C:
	step 14, 1
	step 1, 1
	step_end
	.byte 0x02, 0x00, 0x00, 0x00

_029C:
	step 17, 1
	step 18, 3
	step 1, 1
	step_end
	.byte 0x02, 0x00, 0x00, 0x00

_02B0:
	step 18, 5
	step 17, 1
	step 1, 1
	step_end
	.byte 0x02, 0x00, 0x00, 0x00

_02C4:
	step 18, 1
	step 0, 1
	step_end

_02D0:
	step 3, 1
	step_end

_02D8:
	step 62, 6
	step 2, 1
	step_end
	.byte 0x02, 0x00, 0x00, 0x00

_02E8:
	step 19, 4
	step 16, 1
	step_end
	.byte 0x02, 0x00, 0x00, 0x00

_02F8:
	step 16, 1
	step 19, 5
	step 0, 1
	step_end
	.byte 0x02, 0x00
scr_seq_D18R0102_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 245, 0
	scrcmd_077
	setflag FLAG_UNK_0A4
	scrcmd_589 245, 40, 0
	clearflag FLAG_UNK_0A4
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _035C
	scrcmd_683 16386
	comparevartovalue VAR_TEMP_x4002, 3
	gotoif eq, _0358
	comparevartovalue VAR_TEMP_x4002, 4
	callif eq, _0362
_0358:
	releaseall
	end

_035C:
	white_out
	releaseall
	end

_0362:
	setflag FLAG_UNK_175
	return
	.balign 4, 0
