#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D24R0209.h"
#include "msgdata/msg/msg_0003_EVERYWHERE.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D24R0209_000
	scrdef scr_seq_D24R0209_001
	scrdef scr_seq_D24R0209_002
	scrdef_end

scr_seq_D24R0209_000:
	play_se SEQ_SE_GS_RAKKA01
	apply_movement obj_player, _0064
	scrcmd_374 obj_player
	wait_movement
	screen_shake 0, 1, 1, 8
	play_se SEQ_SE_DP_SUTYA2
	setvar VAR_UNK_40D8, 0
	compare VAR_UNK_40F0, 1
	goto_if_eq _004D
	setvar VAR_UNK_40F0, 1
	addvar VAR_UNK_40F1, 1
_004D:
	end

scr_seq_D24R0209_001:
	compare VAR_UNK_40D8, 1
	goto_if_ne _0060
	scrcmd_375 obj_player
_0060:
	end

	.balign 4, 0
_0064:
	step 68, 1
	step_end

scr_seq_D24R0209_002:
	scrcmd_609
	lockall
	setvar VAR_UNK_40CE, 1
	setflag FLAG_UNK_111
	scrcmd_729 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _009A
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _00FF
	end

_009A:
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _00B9
	apply_movement obj_player, _0218
	goto _00F7

_00B9:
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _00D4
	apply_movement obj_player, _0234
	goto _00F7

_00D4:
	compare VAR_SPECIAL_RESULT, 2
	goto_if_ne _00EF
	apply_movement obj_player, _0250
	goto _00F7

_00EF:
	apply_movement obj_player, _026C
_00F7:
	wait_movement
	goto _017E

_00FF:
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _0126
	apply_movement obj_player, _0218
	apply_movement obj_partner_poke, _0224
	goto _017C

_0126:
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0149
	apply_movement obj_player, _0234
	apply_movement obj_partner_poke, _0240
	goto _017C

_0149:
	compare VAR_SPECIAL_RESULT, 2
	goto_if_ne _016C
	apply_movement obj_player, _0250
	apply_movement obj_partner_poke, _025C
	goto _017C

_016C:
	apply_movement obj_player, _026C
	apply_movement obj_partner_poke, _0278
_017C:
	wait_movement
_017E:
	play_se SEQ_SE_GS_RAKKA01
	compare VAR_UNOWN_REPORT_LEVEL, 7
	goto_if_ge _01C4
	compare VAR_UNOWN_REPORT_LEVEL, 6
	goto_if_eq _01EE
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	warp MAP_D24R0205, 0, 5, 24, VAR_SPECIAL_RESULT
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
_01C0:
	releaseall
	end

_01C4:
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	warp MAP_D24R0218, 0, 5, 24, VAR_SPECIAL_RESULT
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	goto _01C0

_01EE:
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	warp MAP_D24R0216, 0, 5, 24, VAR_SPECIAL_RESULT
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	goto _01C0

	.balign 4, 0
_0218:
	step 40, 4
	step 69, 1
	step_end

	.balign 4, 0
_0224:
	step 62, 3
	step 20, 1
	step 69, 1
	step_end

	.balign 4, 0
_0234:
	step 41, 4
	step 69, 1
	step_end

	.balign 4, 0
_0240:
	step 62, 3
	step 21, 1
	step 69, 1
	step_end

	.balign 4, 0
_0250:
	step 42, 4
	step 69, 1
	step_end

	.balign 4, 0
_025C:
	step 62, 3
	step 22, 1
	step 69, 1
	step_end

	.balign 4, 0
_026C:
	step 43, 4
	step 69, 1
	step_end

	.balign 4, 0
_0278:
	step 62, 3
	step 23, 1
	step 69, 1
	step_end
	.balign 4, 0
