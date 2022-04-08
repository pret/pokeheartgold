#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T11R0703.h"
#include "msgdata/msg/msg_0539_T11R0703.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T11R0703_000
	scrdef_end

scr_seq_T11R0703_000:
	scrcmd_609
	lockall
	get_party_lead_alive VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 479
	goto_if_ne _018C
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_player, _0154
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	apply_movement obj_partner_poke, _0170
	wait_movement
	play_cry SPECIES_ROTOM, 0
	wait_cry
	npc_msg msg_0539_T11R0703_00000
	closemsg
	goto _0066
	.byte 0x5e, 0x00, 0xff, 0x00
	.byte 0xf0, 0x00, 0x00, 0x00, 0x5f, 0x00
_0066:
	get_dynamic_warp_floor_no VAR_ELEVATOR_LAST_FLOOR
	switch VAR_ELEVATOR_LAST_FLOOR
	case 1, _008C
	case 0, _00C0
	end

_008C:
	setvar VAR_SPECIAL_x8004, 0
	call _00F4
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	warp MAP_T11R0701, 0, 3, 3, DIR_SOUTH
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	releaseall
	end

_00C0:
	setvar VAR_SPECIAL_x8004, 1
	call _00F4
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	warp MAP_T11R0702, 0, 7, 3, DIR_SOUTH
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	releaseall
	end

_00F4:
	wait_se SEQ_SE_DP_SELECT
	elevator_anim VAR_SPECIAL_x8004, 1
_00FE:
	scrcmd_729 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0142
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _011E
	end

_011E:
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_player, _0180
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	goto _014C

_0142:
	apply_movement obj_player, _0180
	wait_movement
_014C:
	play_se SEQ_SE_DP_KAIDAN2
	return
	.byte 0x00, 0x00

_0154:
	step 12, 2
	step 33, 1
	step_end

_0160:
	step 15, 1
	step 12, 1
	step 1, 1
	step_end

_0170:
	step 1, 1
	step 13, 1
	step 45, 3
	step_end

_0180:
	step 13, 2
	step 33, 1
	step_end
_018C:
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_player, _0154
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _01C5
	apply_movement obj_partner_poke, _0160
	wait_movement
_01C5:
	npc_msg msg_0539_T11R0703_00001
	closemsg
	get_dynamic_warp_floor_no VAR_ELEVATOR_LAST_FLOOR
	switch VAR_ELEVATOR_LAST_FLOOR
	case 1, _01F0
	case 0, _0224
	end

_01F0:
	setvar VAR_SPECIAL_x8004, 0
	call _00FE
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	warp MAP_T11R0702, 0, 7, 3, DIR_SOUTH
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	releaseall
	end

_0224:
	setvar VAR_SPECIAL_x8004, 1
	call _00FE
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	warp MAP_T11R0701, 0, 3, 3, DIR_SOUTH
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	releaseall
	end
	.balign 4, 0
