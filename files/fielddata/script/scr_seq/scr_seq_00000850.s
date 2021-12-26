#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000850_00000089 ; 000
	scrdef scr_seq_00000850_0000008B ; 001
	scrdef scr_seq_00000850_00000590 ; 002
	scrdef scr_seq_00000850_000006B4 ; 003
	scrdef scr_seq_00000850_000008C4 ; 004
	scrdef scr_seq_00000850_00000ADC ; 005
	scrdef scr_seq_00000850_00000AF1 ; 006
	scrdef scr_seq_00000850_00000B08 ; 007
	scrdef scr_seq_00000850_00000B1B ; 008
	scrdef scr_seq_00000850_00000919 ; 009
	scrdef scr_seq_00000850_0000002E ; 010
	scrdef_end

scr_seq_00000850_0000002E:
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_00000850_0000003F
	clearflag FLAG_UNK_189
	end

scr_seq_00000850_0000003F:
	scrcmd_294 2, VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, scr_seq_00000850_0000007D
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, scr_seq_00000850_00000083
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif eq, scr_seq_00000850_00000083
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif eq, scr_seq_00000850_00000083
scr_seq_00000850_0000007D:
	setflag FLAG_UNK_27E
	end

scr_seq_00000850_00000083:
	clearflag FLAG_UNK_27E
	end

scr_seq_00000850_00000089:
	end

scr_seq_00000850_0000008B:
	scrcmd_098 0
	apply_movement 0, scr_seq_00000850_00000350
	wait_movement
	callstd 2037
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 397
	gotoif ne, scr_seq_00000850_000000BE
	apply_movement 0, scr_seq_00000850_00000358
	goto scr_seq_00000850_00000109

scr_seq_00000850_000000BE:
	comparevartovalue VAR_TEMP_x4001, 398
	gotoif ne, scr_seq_00000850_000000D9
	apply_movement 0, scr_seq_00000850_00000360
	goto scr_seq_00000850_00000109

scr_seq_00000850_000000D9:
	comparevartovalue VAR_TEMP_x4001, 399
	gotoif ne, scr_seq_00000850_000000F4
	apply_movement 0, scr_seq_00000850_00000368
	goto scr_seq_00000850_00000109

scr_seq_00000850_000000F4:
	comparevartovalue VAR_TEMP_x4001, 400
	gotoif ne, scr_seq_00000850_00000109
	apply_movement 0, scr_seq_00000850_00000370
scr_seq_00000850_00000109:
	apply_movement 255, scr_seq_00000850_00000378
	wait_movement
	msgbox 0
	closemsg
	buffer_players_name 0
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 397
	gotoif ne, scr_seq_00000850_0000013C
	apply_movement 0, scr_seq_00000850_00000390
	goto scr_seq_00000850_00000187

scr_seq_00000850_0000013C:
	comparevartovalue VAR_TEMP_x4001, 398
	gotoif ne, scr_seq_00000850_00000157
	apply_movement 0, scr_seq_00000850_000003AC
	goto scr_seq_00000850_00000187

scr_seq_00000850_00000157:
	comparevartovalue VAR_TEMP_x4001, 399
	gotoif ne, scr_seq_00000850_00000172
	apply_movement 0, scr_seq_00000850_000003D0
	goto scr_seq_00000850_00000187

scr_seq_00000850_00000172:
	comparevartovalue VAR_TEMP_x4001, 400
	gotoif ne, scr_seq_00000850_00000187
	apply_movement 0, scr_seq_00000850_000003F4
scr_seq_00000850_00000187:
	wait_movement
	apply_movement 255, scr_seq_00000850_00000380
	wait_movement
	msgbox 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	comparevartovalue VAR_TEMP_x4001, 397
	gotoif ne, scr_seq_00000850_000001C5
	apply_movement 0, scr_seq_00000850_00000418
	apply_movement 255, scr_seq_00000850_00000478
	goto scr_seq_00000850_00000228

scr_seq_00000850_000001C5:
	comparevartovalue VAR_TEMP_x4001, 398
	gotoif ne, scr_seq_00000850_000001E8
	apply_movement 0, scr_seq_00000850_00000430
	apply_movement 255, scr_seq_00000850_00000488
	goto scr_seq_00000850_00000228

scr_seq_00000850_000001E8:
	comparevartovalue VAR_TEMP_x4001, 399
	gotoif ne, scr_seq_00000850_0000020B
	apply_movement 0, scr_seq_00000850_00000448
	apply_movement 255, scr_seq_00000850_00000498
	goto scr_seq_00000850_00000228

scr_seq_00000850_0000020B:
	comparevartovalue VAR_TEMP_x4001, 400
	gotoif ne, scr_seq_00000850_00000228
	apply_movement 0, scr_seq_00000850_00000460
	apply_movement 255, scr_seq_00000850_000004A8
scr_seq_00000850_00000228:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	msgbox 2
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 0, scr_seq_00000850_000004B8
	apply_movement 255, scr_seq_00000850_000004CC
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	msgbox 3
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 0, scr_seq_00000850_000004E0
	apply_movement 255, scr_seq_00000850_000004FC
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	msgbox 4
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 0, scr_seq_00000850_0000050C
	apply_movement 255, scr_seq_00000850_0000052C
	wait_movement
	play_se SEQ_SE_GS_N_UMIBE
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	msgbox 5
	closemsg
	scrcmd_074 2133
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 0, scr_seq_00000850_0000054C
	apply_movement 255, scr_seq_00000850_00000568
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	msgbox 6
	scrcmd_293
	buffer_players_name 0
	msgbox 7
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	msgbox 8
	closemsg
	apply_movement 0, scr_seq_00000850_00000580
	wait_movement
	scrcmd_307 17, 12, 14, 17, 77
	scrcmd_310 77
	scrcmd_308 77
	apply_movement 0, scr_seq_00000850_00000580
	wait_movement
	scrcmd_099 0
	scrcmd_099 253
	play_se SEQ_SE_DP_KAIDAN2
	hide_person 0
	wait_se SEQ_SE_DP_KAIDAN2
	setflag FLAG_UNK_198
	scrcmd_311 77
	scrcmd_308 77
	scrcmd_309 77
	callstd 2038
	setvar VAR_UNK_4073, 1
	end


scr_seq_00000850_00000350:
	.short 75, 1
	.short 254, 0

scr_seq_00000850_00000358:
	.short 62, 1
	.short 254, 0

scr_seq_00000850_00000360:
	.short 13, 1
	.short 254, 0

scr_seq_00000850_00000368:
	.short 13, 2
	.short 254, 0

scr_seq_00000850_00000370:
	.short 13, 3
	.short 254, 0

scr_seq_00000850_00000378:
	.short 32, 1
	.short 254, 0

scr_seq_00000850_00000380:
	.short 34, 1
	.short 254, 0

scr_seq_00000850_00000388:
	.short 35, 1
	.short 254, 0

scr_seq_00000850_00000390:
	.short 18, 2
	.short 16, 2
	.short 75, 1
	.short 37, 1
	.short 17, 3
	.short 19, 1
	.short 254, 0

scr_seq_00000850_000003AC:
	.short 18, 2
	.short 16, 3
	.short 63, 1
	.short 37, 1
	.short 66, 1
	.short 75, 1
	.short 17, 4
	.short 19, 1
	.short 254, 0

scr_seq_00000850_000003D0:
	.short 18, 2
	.short 16, 4
	.short 63, 1
	.short 37, 1
	.short 66, 1
	.short 75, 1
	.short 17, 5
	.short 19, 1
	.short 254, 0

scr_seq_00000850_000003F4:
	.short 18, 2
	.short 16, 4
	.short 63, 1
	.short 37, 1
	.short 66, 1
	.short 75, 1
	.short 17, 5
	.short 19, 1
	.short 254, 0

scr_seq_00000850_00000418:
	.short 18, 1
	.short 16, 3
	.short 37, 1
	.short 62, 4
	.short 36, 1
	.short 254, 0

scr_seq_00000850_00000430:
	.short 18, 1
	.short 16, 4
	.short 37, 1
	.short 62, 5
	.short 36, 1
	.short 254, 0

scr_seq_00000850_00000448:
	.short 18, 1
	.short 16, 5
	.short 37, 1
	.short 62, 6
	.short 36, 1
	.short 254, 0

scr_seq_00000850_00000460:
	.short 18, 1
	.short 16, 6
	.short 37, 1
	.short 62, 9
	.short 36, 1
	.short 254, 0

scr_seq_00000850_00000478:
	.short 14, 2
	.short 12, 2
	.short 63, 1
	.short 254, 0

scr_seq_00000850_00000488:
	.short 14, 2
	.short 12, 3
	.short 63, 1
	.short 254, 0

scr_seq_00000850_00000498:
	.short 14, 2
	.short 12, 4
	.short 63, 1
	.short 254, 0

scr_seq_00000850_000004A8:
	.short 14, 2
	.short 12, 5
	.short 63, 1
	.short 254, 0

scr_seq_00000850_000004B8:
	.short 18, 9
	.short 39, 1
	.short 62, 7
	.short 36, 1
	.short 254, 0

scr_seq_00000850_000004CC:
	.short 12, 1
	.short 14, 8
	.short 63, 2
	.short 32, 1
	.short 254, 0

scr_seq_00000850_000004E0:
	.short 18, 6
	.short 16, 2
	.short 18, 1
	.short 39, 1
	.short 62, 7
	.short 36, 1
	.short 254, 0

scr_seq_00000850_000004FC:
	.short 14, 7
	.short 12, 2
	.short 63, 1
	.short 254, 0

scr_seq_00000850_0000050C:
	.short 17, 2
	.short 18, 6
	.short 17, 8
	.short 14, 6
	.short 36, 1
	.short 62, 17
	.short 38, 1
	.short 254, 0

scr_seq_00000850_0000052C:
	.short 14, 1
	.short 13, 2
	.short 14, 6
	.short 13, 7
	.short 14, 6
	.short 63, 2
	.short 34, 1
	.short 254, 0

scr_seq_00000850_0000054C:
	.short 19, 16
	.short 38, 1
	.short 62, 6
	.short 17, 2
	.short 19, 6
	.short 38, 1
	.short 254, 0

scr_seq_00000850_00000568:
	.short 62, 1
	.short 13, 1
	.short 15, 16
	.short 13, 2
	.short 15, 5
	.short 254, 0

scr_seq_00000850_00000580:
	.short 12, 2
	.short 254, 0
	.byte 0x0c, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00
scr_seq_00000850_00000590:
	scrcmd_609
	lockall
	apply_movement 255, scr_seq_00000850_00000680
	wait_movement
	callstd 2037
	clearflag FLAG_UNK_198
	scrcmd_100 0
	scrcmd_098 0
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	show_person_at 0, VAR_TEMP_x4000, 1, 394, 0
	comparevartovalue VAR_TEMP_x4000, 549
	gotoif ne, scr_seq_00000850_000005DB
	apply_movement 0, scr_seq_00000850_0000068C
	goto scr_seq_00000850_000005FE

scr_seq_00000850_000005DB:
	comparevartovalue VAR_TEMP_x4000, 550
	gotoif ne, scr_seq_00000850_000005F6
	apply_movement 0, scr_seq_00000850_0000068C
	goto scr_seq_00000850_000005FE

scr_seq_00000850_000005F6:
	apply_movement 0, scr_seq_00000850_0000069C
scr_seq_00000850_000005FE:
	wait_movement
	comparevartovalue VAR_TEMP_x4000, 549
	gotoif ne, scr_seq_00000850_0000061B
	apply_movement 255, scr_seq_00000850_00000380
	goto scr_seq_00000850_0000063E

scr_seq_00000850_0000061B:
	comparevartovalue VAR_TEMP_x4000, 550
	gotoif ne, scr_seq_00000850_00000636
	apply_movement 255, scr_seq_00000850_00000380
	goto scr_seq_00000850_0000063E

scr_seq_00000850_00000636:
	apply_movement 255, scr_seq_00000850_00000388
scr_seq_00000850_0000063E:
	wait_movement
	msgbox 9
	buffer_players_name 0
	msgbox 10
	play_fanfare SEQ_ME_KEYITEM
	wait_fanfare
	msgbox 11
	msgbox 12
	closemsg
	apply_movement 0, scr_seq_00000850_000006AC
	wait_movement
	callstd 2038
	scrcmd_099 0
	hide_person 0
	setflag FLAG_UNK_198
	register_pokegear_card 1
	releaseall
	setvar VAR_UNK_4073, 2
	end

scr_seq_00000850_0000067E:
	.byte 0x00, 0x00

scr_seq_00000850_00000680:
	.short 75, 1
	.short 37, 1
	.short 254, 0

scr_seq_00000850_0000068C:
	.short 18, 1
	.short 16, 9
	.short 35, 1
	.short 254, 0

scr_seq_00000850_0000069C:
	.short 19, 1
	.short 16, 9
	.short 34, 1
	.short 254, 0

scr_seq_00000850_000006AC:
	.short 17, 9
	.short 254, 0
scr_seq_00000850_000006B4:
	scrcmd_609
	lockall
	fade_out_bgm 0, 3
	apply_movement 255, scr_seq_00000850_00000350
	wait_movement
	callstd 2031
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	show_person_at 4, 583, 0, VAR_TEMP_x4001, 2
	apply_movement 4, scr_seq_00000850_00000808
	wait_movement
	msgbox 13
	closemsg
	get_starter_choice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 152
	gotoif ne, scr_seq_00000850_0000070C
	trainer_battle 496, 0, 1, 0
	goto scr_seq_00000850_0000072F

scr_seq_00000850_0000070C:
	comparevartovalue VAR_SPECIAL_x800C, 155
	gotoif ne, scr_seq_00000850_00000727
	trainer_battle 497, 0, 1, 0
	goto scr_seq_00000850_0000072F

scr_seq_00000850_00000727:
	trainer_battle 495, 0, 1, 0
scr_seq_00000850_0000072F:
	scrcmd_220 VAR_SPECIAL_x800C
	callstd 2070
	msgbox 14
	closemsg
	play_se SEQ_SE_DP_WALL_HIT2
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 56
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	comparevartovalue VAR_SPECIAL_x8005, 398
	gotoif ne, scr_seq_00000850_0000076B
	apply_movement 255, scr_seq_00000850_00000890
	goto scr_seq_00000850_00000773

scr_seq_00000850_0000076B:
	apply_movement 255, scr_seq_00000850_000008A4
scr_seq_00000850_00000773:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	comparevartovalue VAR_SPECIAL_x8005, 398
	gotoif ne, scr_seq_00000850_0000079A
	apply_movement 4, scr_seq_00000850_00000810
	goto scr_seq_00000850_000007A2

scr_seq_00000850_0000079A:
	apply_movement 4, scr_seq_00000850_00000844
scr_seq_00000850_000007A2:
	wait_movement
	msgbox 15
	closemsg
	get_person_coords 4, VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	comparevartovalue VAR_SPECIAL_x8005, 401
	gotoif ne, scr_seq_00000850_000007D4
	apply_movement 4, scr_seq_00000850_00000880
	apply_movement 255, scr_seq_00000850_000008B8
	goto scr_seq_00000850_000007E4

scr_seq_00000850_000007D4:
	apply_movement 4, scr_seq_00000850_00000878
	apply_movement 255, scr_seq_00000850_000008B8
scr_seq_00000850_000007E4:
	wait_movement
	hide_person 4
	setflag FLAG_UNK_19C
	callstd 2071
	releaseall
	setvar VAR_UNK_4073, 4
	setflag FLAG_MET_PASSERBY_BOY
	end

scr_seq_00000850_00000800:
	.byte 0xdb, 0x00, 0x61, 0x00, 0x02, 0x00, 0x00, 0x00

scr_seq_00000850_00000808:
	.short 14, 7
	.short 254, 0

scr_seq_00000850_00000810:
	.short 14, 6
	.short 75, 1
	.short 37, 1
	.short 63, 1
	.short 36, 1
	.short 63, 1
	.short 37, 1
	.short 63, 1
	.short 35, 1
	.short 63, 1
	.short 15, 5
	.short 33, 1
	.short 254, 0

scr_seq_00000850_00000844:
	.short 14, 6
	.short 75, 1
	.short 37, 1
	.short 63, 1
	.short 36, 1
	.short 63, 1
	.short 37, 1
	.short 63, 1
	.short 35, 1
	.short 63, 1
	.short 15, 5
	.short 32, 1
	.short 254, 0

scr_seq_00000850_00000878:
	.short 14, 11
	.short 254, 0

scr_seq_00000850_00000880:
	.short 14, 5
	.short 12, 1
	.short 14, 6
	.short 254, 0

scr_seq_00000850_00000890:
	.short 0, 1
	.short 71, 1
	.short 17, 1
	.short 72, 1
	.short 254, 0

scr_seq_00000850_000008A4:
	.short 1, 1
	.short 71, 1
	.short 16, 1
	.short 72, 1
	.short 254, 0

scr_seq_00000850_000008B8:
	.short 63, 2
	.short 34, 1
	.short 254, 0
scr_seq_00000850_000008C4:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0F3
	gotoif TRUE, scr_seq_00000850_00000903
	msgbox 20
	setvar VAR_SPECIAL_x8004, 243
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000850_0000090E
	callstd 2033
	setflag FLAG_UNK_0F3
scr_seq_00000850_00000903:
	msgbox 21
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000850_0000090E:
	msgbox 22
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000850_00000919:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 0
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000850_00000A41
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000850_00000A55
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000850_00000992
	apply_movement 255, scr_seq_00000850_00000A6C
	apply_movement 5, scr_seq_00000850_00000AC0
	goto scr_seq_00000850_000009E0

scr_seq_00000850_00000992:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000850_000009AD
	apply_movement 255, scr_seq_00000850_00000A84
	goto scr_seq_00000850_000009E0

scr_seq_00000850_000009AD:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_00000850_000009D0
	apply_movement 255, scr_seq_00000850_00000AA4
	apply_movement 5, scr_seq_00000850_00000AC0
	goto scr_seq_00000850_000009E0

scr_seq_00000850_000009D0:
	apply_movement 255, scr_seq_00000850_00000A90
	apply_movement 5, scr_seq_00000850_00000AC0
scr_seq_00000850_000009E0:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000850_00000A07
	apply_movement 253, scr_seq_00000850_00000ACC
	wait_movement
scr_seq_00000850_00000A07:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_615 1
	lockall
	fade_screen 6, 1, 1, 0
	wait_fade
	clearflag FLAG_UNK_189
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000850_00000A41:
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000850_00000A55:
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000850_00000A69:
	.byte 0x00, 0x00, 0x00

scr_seq_00000850_00000A6C:
	.short 15, 1
	.short 12, 2
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000850_00000A84:
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000850_00000A90:
	.short 12, 1
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000850_00000AA4:
	.short 13, 1
	.short 15, 2
	.short 12, 2
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000850_00000AC0:
	.short 63, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000850_00000ACC:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
scr_seq_00000850_00000ADC:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 24, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000850_00000AF1:
	scrcmd_055 23, 0, 12, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000850_00000B08:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 19
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000850_00000B1B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 17
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
