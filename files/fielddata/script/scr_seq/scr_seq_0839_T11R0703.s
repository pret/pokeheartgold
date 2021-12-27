#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0839_0006 ; 000
	scrdef_end

scr_seq_0839_0006:
	scrcmd_609
	lockall
	get_lead_mon_index VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 479
	gotoif ne, scr_seq_0839_018C
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0839_0154
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	apply_movement 253, scr_seq_0839_0170
	wait_movement
	scrcmd_076 479, 0
	scrcmd_077
	npc_msg 0
	closemsg
	goto scr_seq_0839_0066

scr_seq_0839_005C:
	.byte 0x5e, 0x00, 0xff, 0x00
	.byte 0xf0, 0x00, 0x00, 0x00, 0x5f, 0x00
scr_seq_0839_0066:
	scrcmd_241 16659
	copyvar VAR_SPECIAL_x8008, VAR_UNK_4113
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0839_008C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0839_00C0
	end

scr_seq_0839_008C:
	setvar VAR_SPECIAL_x8004, 0
	call scr_seq_0839_00F4
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 402, 0, 3, 3, 1
	fade_screen 6, 1, 1, 0
	wait_fade
	releaseall
	end

scr_seq_0839_00C0:
	setvar VAR_SPECIAL_x8004, 1
	call scr_seq_0839_00F4
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 403, 0, 7, 3, 1
	fade_screen 6, 1, 1, 0
	wait_fade
	releaseall
	end

scr_seq_0839_00F4:
	wait_se SEQ_SE_DP_SELECT
	scrcmd_488 32772, 1
scr_seq_0839_00FE:
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0839_0142
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0839_011E
	end

scr_seq_0839_011E:
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0839_0180
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	goto scr_seq_0839_014C

scr_seq_0839_0142:
	apply_movement 255, scr_seq_0839_0180
	wait_movement
scr_seq_0839_014C:
	play_se SEQ_SE_DP_KAIDAN2
	return

scr_seq_0839_0152:
	.byte 0x00, 0x00

scr_seq_0839_0154:
	.short 12, 2
	.short 33, 1
	.short 254, 0

scr_seq_0839_0160:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0

scr_seq_0839_0170:
	.short 1, 1
	.short 13, 1
	.short 45, 3
	.short 254, 0

scr_seq_0839_0180:
	.short 13, 2
	.short 33, 1
	.short 254, 0
scr_seq_0839_018C:
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0839_0154
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0839_01C5
	apply_movement 253, scr_seq_0839_0160
	wait_movement
scr_seq_0839_01C5:
	npc_msg 1
	closemsg
	scrcmd_241 16659
	copyvar VAR_SPECIAL_x8008, VAR_UNK_4113
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0839_01F0
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0839_0224
	end

scr_seq_0839_01F0:
	setvar VAR_SPECIAL_x8004, 0
	call scr_seq_0839_00FE
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 403, 0, 7, 3, 1
	fade_screen 6, 1, 1, 0
	wait_fade
	releaseall
	end

scr_seq_0839_0224:
	setvar VAR_SPECIAL_x8004, 1
	call scr_seq_0839_00FE
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 402, 0, 3, 3, 1
	fade_screen 6, 1, 1, 0
	wait_fade
	releaseall
	end
	.balign 4, 0
