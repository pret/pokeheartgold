#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D39R0102.h"
#include "msgdata/msg/msg_0003_EVERYWHERE.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D39R0102_000
	scrdef scr_seq_D39R0102_001
	scrdef scr_seq_D39R0102_002
	scrdef scr_seq_D39R0102_003
	scrdef_end

scr_seq_D39R0102_000:
	setvar VAR_TEMP_x4000, 12
	setvar VAR_TEMP_x4001, 12
	goto _0062
	.byte 0x02, 0x00
scr_seq_D39R0102_001:
	setvar VAR_TEMP_x4000, 10
	setvar VAR_TEMP_x4001, 21
	goto _0062
	.byte 0x02, 0x00
scr_seq_D39R0102_002:
	setvar VAR_TEMP_x4000, 20
	setvar VAR_TEMP_x4001, 10
	goto _0062
	.byte 0x02, 0x00
scr_seq_D39R0102_003:
	setvar VAR_TEMP_x4000, 21
	setvar VAR_TEMP_x4001, 23
	goto _0062
	.byte 0x02, 0x00
_0062:
	scrcmd_609
	lockall
	setvar VAR_UNK_40AB, 1
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, _0093
	apply_movement obj_player, _0118
	apply_movement obj_partner_poke, _0124
	goto _00E9

_0093:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _00B6
	apply_movement obj_player, _0134
	apply_movement obj_partner_poke, _0140
	goto _00E9

_00B6:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, _00D9
	apply_movement obj_player, _0150
	apply_movement obj_partner_poke, _015C
	goto _00E9

_00D9:
	apply_movement obj_player, _016C
	apply_movement obj_partner_poke, _0178
_00E9:
	wait_movement
	play_se SEQ_SE_GS_RAKKA01
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_176 238, 0, 16384, 16385, VAR_SPECIAL_x800C
	fade_screen 6, 1, 1, 0x00
	wait_fade
	releaseall
	end
	.byte 0x00

_0118:
	step 40, 4
	step 69, 1
	step_end

_0124:
	step 62, 3
	step 20, 1
	step 69, 1
	step_end

_0134:
	step 41, 4
	step 69, 1
	step_end

_0140:
	step 62, 3
	step 21, 1
	step 69, 1
	step_end

_0150:
	step 42, 4
	step 69, 1
	step_end

_015C:
	step 62, 3
	step 22, 1
	step 69, 1
	step_end

_016C:
	step 43, 4
	step 69, 1
	step_end

_0178:
	step 62, 3
	step 23, 1
	step 69, 1
	step_end
	.balign 4, 0
