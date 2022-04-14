#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D50R0101.h"
#include "msgdata/msg/msg_0144_D50R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D50R0101_000
	scrdef scr_seq_D50R0101_001
	scrdef_end

scr_seq_D50R0101_001:
	nat_dex_flag_action 2, VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 1
	goto_if_eq _0064
	move_person_facing obj_D50R0101_breakrock, 30, 1, 30, DIR_NORTH
	move_person_facing obj_D50R0101_breakrock_2, 30, 1, 30, DIR_NORTH
	move_person_facing obj_D50R0101_breakrock_3, 30, 1, 30, DIR_NORTH
	move_person_facing obj_D50R0101_breakrock_4, 30, 1, 30, DIR_NORTH
	move_person_facing obj_D50R0101_breakrock_5, 30, 1, 30, DIR_NORTH
	move_person_facing obj_D50R0101_breakrock_6, 30, 1, 30, DIR_NORTH
_0064:
	end

scr_seq_D50R0101_000:
	simple_npc_msg msg_0144_D50R0101_00000
	end
	.balign 4, 0
