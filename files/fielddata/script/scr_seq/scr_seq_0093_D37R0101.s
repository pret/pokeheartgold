#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0093_0407 ; 000
	scrdef scr_seq_0093_045C ; 001
	scrdef scr_seq_0093_0018 ; 002
	scrdef scr_seq_0093_0012 ; 003
	scrdef_end

scr_seq_0093_0012:
	scrcmd_144 16416
	end

scr_seq_0093_0018:
	scrcmd_609
	lockall
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 3
	gotoif eq, scr_seq_0093_0228
	clearflag FLAG_UNK_2C8
	scrcmd_100 3
	comparevartovalue VAR_TEMP_x4001, 30
	gotoif ne, scr_seq_0093_0050
	show_person_at 3, 9, 0, 25, 2
scr_seq_0093_0050:
	play_se SEQ_SE_DP_KAIDAN2
	apply_movement 3, scr_seq_0093_0174
	wait_movement
	wait 8, VAR_SPECIAL_x800C
	scrcmd_076 183, 0
	scrcmd_077
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0093_01BC
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	clearflag FLAG_UNK_2C8
	scrcmd_100 2
	comparevartovalue VAR_TEMP_x4001, 30
	gotoif ne, scr_seq_0093_00AB
	show_person_at 2, 9, 0, 25, 2
scr_seq_0093_00AB:
	play_se SEQ_SE_DP_KAIDAN2
	callstd 2029
	apply_movement 2, scr_seq_0093_01C4
	wait_movement
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0093_00EE
	apply_movement 3, scr_seq_0093_0218
	apply_movement 255, scr_seq_0093_0218
	apply_movement 253, scr_seq_0093_0218
	wait_movement
	goto scr_seq_0093_0100

scr_seq_0093_00EE:
	apply_movement 3, scr_seq_0093_0218
	apply_movement 255, scr_seq_0093_0218
	wait_movement
scr_seq_0093_0100:
	buffer_players_name 0
	gender_msgbox 6, 9
	closemsg
	apply_movement 2, scr_seq_0093_01D0
	apply_movement 3, scr_seq_0093_01E0
	wait_movement
	gender_msgbox 7, 10
	setvar VAR_SPECIAL_x8004, 435
	setvar VAR_SPECIAL_x8005, 1
	callstd 2033
	call scr_seq_0093_0354
	gender_msgbox 8, 11
	closemsg
	apply_movement 2, scr_seq_0093_01F0
	apply_movement 3, scr_seq_0093_0204
	wait_movement
	play_se SEQ_SE_DP_KAIDAN2
	setflag FLAG_UNK_2C8
	hide_person 2
	hide_person 3
	wait_se SEQ_SE_DP_KAIDAN2
	callstd 2030
	setvar VAR_UNK_40F8, 1
	setflag FLAG_UNK_14C
	releaseall
	end

scr_seq_0093_0173:
	.byte 0x00

scr_seq_0093_0174:
	.short 78, 1
	.short 39, 1
	.short 50, 2
	.short 18, 3
	.short 0, 1
	.short 60, 1
	.short 3, 1
	.short 60, 1
	.short 1, 1
	.short 60, 1
	.short 2, 1
	.short 60, 1
	.short 0, 1
	.short 60, 1
	.short 3, 1
	.short 60, 1
	.short 1, 1
	.short 254, 0

scr_seq_0093_01BC:
	.short 12, 3
	.short 254, 0

scr_seq_0093_01C4:
	.short 14, 1
	.short 75, 1
	.short 254, 0

scr_seq_0093_01D0:
	.short 14, 1
	.short 13, 2
	.short 14, 1
	.short 254, 0

scr_seq_0093_01E0:
	.short 63, 3
	.short 15, 1
	.short 13, 1
	.short 254, 0

scr_seq_0093_01F0:
	.short 13, 2
	.short 14, 1
	.short 13, 1
	.short 69, 1
	.short 254, 0

scr_seq_0093_0204:
	.short 13, 3
	.short 14, 1
	.short 13, 1
	.short 69, 1
	.short 254, 0

scr_seq_0093_0218:
	.short 35, 1
	.short 254, 0

scr_seq_0093_0220:
	.short 33, 1
	.short 254, 0
scr_seq_0093_0228:
	clearflag FLAG_UNK_2C8
	scrcmd_100 2
	clearflag FLAG_UNK_2C8
	scrcmd_100 3
	scrcmd_098 3
	callstd 2029
	show_person_at 2, 25, 0, 9, 0
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	apply_movement 255, scr_seq_0093_0220
	apply_movement 2, scr_seq_0093_0308
	wait_movement
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0093_0310
	apply_movement 2, scr_seq_0093_0318
	wait 8, VAR_SPECIAL_x800C
	show_person_at 3, 25, 0, 9, 0
	apply_movement 3, scr_seq_0093_0320
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	buffer_players_name 0
	gender_msgbox 6, 9
	gender_msgbox 7, 10
	setvar VAR_SPECIAL_x8004, 435
	setvar VAR_SPECIAL_x8005, 1
	callstd 2033
	call scr_seq_0093_0354
	gender_msgbox 8, 11
	closemsg
	apply_movement 2, scr_seq_0093_0328
	apply_movement 3, scr_seq_0093_033C
	wait_movement
	play_se SEQ_SE_DP_KAIDAN2
	setflag FLAG_UNK_2C8
	hide_person 2
	hide_person 3
	wait_se SEQ_SE_DP_KAIDAN2
	callstd 2030
	setvar VAR_UNK_40F8, 1
	setflag FLAG_UNK_14C
	releaseall
	end

scr_seq_0093_0305:
	.byte 0x00, 0x00, 0x00

scr_seq_0093_0308:
	.short 75, 1
	.short 254, 0

scr_seq_0093_0310:
	.short 13, 2
	.short 254, 0

scr_seq_0093_0318:
	.short 12, 2
	.short 254, 0

scr_seq_0093_0320:
	.short 12, 1
	.short 254, 0

scr_seq_0093_0328:
	.short 15, 1
	.short 12, 4
	.short 14, 2
	.short 69, 1
	.short 254, 0

scr_seq_0093_033C:
	.short 12, 1
	.short 15, 1
	.short 12, 4
	.short 14, 2
	.short 69, 1
	.short 254, 0
scr_seq_0093_0354:
	call scr_seq_0093_03A8
	call scr_seq_0093_03A8
	call scr_seq_0093_03A8
	call scr_seq_0093_03A8
	call scr_seq_0093_03A8
	call scr_seq_0093_03C2
	call scr_seq_0093_03C2
	call scr_seq_0093_03C2
	call scr_seq_0093_03C2
	call scr_seq_0093_03C2
	scrcmd_406 0
	setvar VAR_TEMP_x4001, 9999
	call scr_seq_0093_03DC
	call scr_seq_0093_03DC
	return

scr_seq_0093_03A8:
	scrcmd_380 32780, 6
	setvar VAR_SPECIAL_x8004, 0
	addvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_403 32772, 1
	return

scr_seq_0093_03C2:
	scrcmd_380 32780, 6
	setvar VAR_SPECIAL_x8004, 18
	addvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_403 32772, 1
	return

scr_seq_0093_03DC:
	scrcmd_380 32780, 8
	comparevartovar VAR_TEMP_x4001, VAR_SPECIAL_x800C
	gotoif eq, scr_seq_0093_03DC
	copyvar VAR_TEMP_x4001, VAR_SPECIAL_x800C
	setvar VAR_SPECIAL_x8004, 1
	addvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_406 32772
	return

scr_seq_0093_0407:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 2
	gotoif ne, scr_seq_0093_0425
	npc_msg 2
	goto scr_seq_0093_0454

scr_seq_0093_0425:
	comparevartovalue VAR_UNK_4077, 4
	gotoif ne, scr_seq_0093_043B
	npc_msg 2
	goto scr_seq_0093_0454

scr_seq_0093_043B:
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_0093_0451
	npc_msg 1
	goto scr_seq_0093_0454

scr_seq_0093_0451:
	npc_msg 0
scr_seq_0093_0454:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0093_045C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 2
	gotoif ne, scr_seq_0093_047A
	npc_msg 5
	goto scr_seq_0093_04A9

scr_seq_0093_047A:
	comparevartovalue VAR_UNK_4077, 4
	gotoif ne, scr_seq_0093_0490
	npc_msg 5
	goto scr_seq_0093_04A9

scr_seq_0093_0490:
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_0093_04A6
	npc_msg 4
	goto scr_seq_0093_04A9

scr_seq_0093_04A6:
	npc_msg 3
scr_seq_0093_04A9:
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
