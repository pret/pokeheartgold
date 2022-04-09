#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D02R0102.h"
#include "msgdata/msg/msg_0003_EVERYWHERE.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D02R0102_000
	scrdef_end

scr_seq_D02R0102_000:
	goto_if_set FLAG_UNK_AB5, _004D
	get_weekday VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 1
	goto_if_ne _002E
	goto _004F
	.byte 0x16, 0x00, 0x1f, 0x00, 0x00, 0x00
_002E:
	compare VAR_TEMP_x4000, 2
	goto_if_ne _0047
	goto _008E
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
_0047:
	goto _004D

_004D:
	end

_004F:
	scrcmd_379 VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 3
	goto_if_ne _0086
	move_warp 1, 1, 7
	move_warp 4, 5, 6
	move_warp 2, 1, 26
	move_warp 5, 5, 25
	goto _008C

_0086:
	goto _004D

_008C:
	end

_008E:
	scrcmd_379 VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 4
	goto_if_ne _00C5
	move_warp 1, 1, 7
	move_warp 4, 5, 6
	move_warp 2, 1, 26
	move_warp 5, 5, 25
	goto _00CB

_00C5:
	goto _004D

_00CB:
	end
	.byte 0x02, 0x00, 0x00
	.balign 4, 0
