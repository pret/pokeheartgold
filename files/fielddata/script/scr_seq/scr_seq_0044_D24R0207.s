#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D24R0207.h"
#include "msgdata/msg/msg_0003_EVERYWHERE.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D24R0207_000
	scrdef scr_seq_D24R0207_001
	scrdef scr_seq_D24R0207_002
	scrdef_end

scr_seq_D24R0207_000:
	play_se SEQ_SE_GS_RAKKA01
	apply_movement obj_player, _0068
	scrcmd_374 255
	wait_movement
	scrcmd_561 0, 1, 1, 8
	play_se SEQ_SE_DP_SUTYA2
	setvar VAR_UNK_40D5, 0
	comparevartovalue VAR_UNK_40EF, 1
	gotoif eq, _004D
	setvar VAR_UNK_40EF, 1
	addvar VAR_UNK_40F1, 1
_004D:
	end

scr_seq_D24R0207_001:
	comparevartovalue VAR_UNK_40D5, 1
	gotoif ne, _0064
	scrcmd_490 VAR_UNK_40D5
	scrcmd_375 255
_0064:
	end
	.byte 0x00, 0x00

_0068:
	step 68, 1
	step_end
scr_seq_D24R0207_002:
	scrcmd_609
	lockall
	setvar VAR_UNK_40CE, 1
	setflag FLAG_UNK_111
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _009E
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0103
	end

_009E:
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, _00BD
	apply_movement obj_player, _021C
	goto _00FB

_00BD:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _00D8
	apply_movement obj_player, _0238
	goto _00FB

_00D8:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, _00F3
	apply_movement obj_player, _0254
	goto _00FB

_00F3:
	apply_movement obj_player, _0270
_00FB:
	wait_movement
	goto _0182

_0103:
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, _012A
	apply_movement obj_player, _021C
	apply_movement obj_partner_poke, _0228
	goto _0180

_012A:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _014D
	apply_movement obj_player, _0238
	apply_movement obj_partner_poke, _0244
	goto _0180

_014D:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, _0170
	apply_movement obj_player, _0254
	apply_movement obj_partner_poke, _0260
	goto _0180

_0170:
	apply_movement obj_player, _0270
	apply_movement obj_partner_poke, _027C
_0180:
	wait_movement
_0182:
	play_se SEQ_SE_GS_RAKKA01
	comparevartovalue VAR_UNK_403E, 7
	gotoif ge, _01C8
	comparevartovalue VAR_UNK_403E, 6
	gotoif eq, _01F2
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_176 315, 0, 5, 42, VAR_SPECIAL_x800C
	fade_screen 6, 1, 1, 0x00
	wait_fade
_01C4:
	releaseall
	end

_01C8:
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_176 492, 0, 5, 42, VAR_SPECIAL_x800C
	fade_screen 6, 1, 1, 0x00
	wait_fade
	goto _01C4

_01F2:
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_176 490, 0, 5, 42, VAR_SPECIAL_x800C
	fade_screen 6, 1, 1, 0x00
	wait_fade
	goto _01C4


_021C:
	step 40, 4
	step 69, 1
	step_end

_0228:
	step 62, 3
	step 20, 1
	step 69, 1
	step_end

_0238:
	step 41, 4
	step 69, 1
	step_end

_0244:
	step 62, 3
	step 21, 1
	step 69, 1
	step_end

_0254:
	step 42, 4
	step 69, 1
	step_end

_0260:
	step 62, 3
	step 22, 1
	step 69, 1
	step_end

_0270:
	step 43, 4
	step 69, 1
	step_end

_027C:
	step 62, 3
	step 23, 1
	step 69, 1
	step_end
	.balign 4, 0
