#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000216_0000013C ; 000
	scrdef scr_seq_00000216_000004FB ; 001
	scrdef scr_seq_00000216_00000808 ; 002
	scrdef scr_seq_00000216_0000002A ; 003
	scrdef scr_seq_00000216_00000573 ; 004
	scrdef scr_seq_00000216_000006BC ; 005
	scrdef scr_seq_00000216_000006CD ; 006
	scrdef scr_seq_00000216_000006DE ; 007
	scrdef scr_seq_00000216_00000121 ; 008
	scrdef scr_seq_00000216_000003A8 ; 009
	scrdef_end

scr_seq_00000216_0000002A:
	checkflag FLAG_UNK_189
	gotoif lt, scr_seq_00000216_0000003B
	clearflag FLAG_UNK_189
	end

scr_seq_00000216_0000003B:
	comparevartovalue VAR_UNK_4089, 2
	gotoif ne, scr_seq_00000216_00000050
	clearflag FLAG_UNK_2B2
	setflag FLAG_UNK_2A2
scr_seq_00000216_00000050:
	scrcmd_294 15, VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, scr_seq_00000216_0000011B
	comparevartovalue VAR_UNK_4089, 1
	gotoif eq, scr_seq_00000216_0000011B
	comparevartovalue VAR_UNK_4089, 2
	gotoif eq, scr_seq_00000216_0000011B
	scrcmd_142 29, 16385
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_00000216_00000115
	scrcmd_147 29, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000216_000000DD
	scrcmd_522 16384
	comparevartovalue VAR_TEMP_x4000, 16
	gotoif ne, scr_seq_00000216_000000BE
	clearflag FLAG_UNK_2CD
	goto scr_seq_00000216_000000DB

scr_seq_00000216_000000BE:
	comparevartovalue VAR_TEMP_x4000, 17
	gotoif ne, scr_seq_00000216_000000D5
	clearflag FLAG_UNK_2CD
	goto scr_seq_00000216_000000DB

scr_seq_00000216_000000D5:
	goto scr_seq_00000216_00000115

scr_seq_00000216_000000DB:
	end

scr_seq_00000216_000000DD:
	scrcmd_522 16384
	comparevartovalue VAR_TEMP_x4000, 14
	gotoif ne, scr_seq_00000216_000000F8
	clearflag FLAG_UNK_2CD
	goto scr_seq_00000216_00000113

scr_seq_00000216_000000F8:
	comparevartovalue VAR_TEMP_x4000, 15
	gotoif ne, scr_seq_00000216_0000010F
	clearflag FLAG_UNK_2CD
	goto scr_seq_00000216_00000113

scr_seq_00000216_0000010F:
	setflag FLAG_UNK_2CD
scr_seq_00000216_00000113:
	end

scr_seq_00000216_00000115:
	setflag FLAG_UNK_2CD
	end

scr_seq_00000216_0000011B:
	setflag FLAG_UNK_2CD
	end

scr_seq_00000216_00000121:
	checkflag FLAG_UNK_0A4
	gotoif eq, scr_seq_00000216_0000012E
	end

scr_seq_00000216_0000012E:
	setflag FLAG_UNK_2A1
	hide_person 12
	clearflag FLAG_UNK_0A4
	end

scr_seq_00000216_0000013C:
	scrcmd_609
	lockall
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 40
	gotoif ne, scr_seq_00000216_00000171
	apply_movement 8, scr_seq_00000216_0000029C
	apply_movement 9, scr_seq_00000216_000002B0
	apply_movement 255, scr_seq_00000216_00000304
	goto scr_seq_00000216_000001B4

scr_seq_00000216_00000171:
	comparevartovalue VAR_TEMP_x4001, 41
	gotoif ne, scr_seq_00000216_0000019C
	apply_movement 8, scr_seq_00000216_0000029C
	apply_movement 9, scr_seq_00000216_000002CC
	apply_movement 255, scr_seq_00000216_00000304
	goto scr_seq_00000216_000001B4

scr_seq_00000216_0000019C:
	apply_movement 8, scr_seq_00000216_0000029C
	apply_movement 9, scr_seq_00000216_000002E8
	apply_movement 255, scr_seq_00000216_00000310
scr_seq_00000216_000001B4:
	wait_movement
	scrcmd_081 1061
	play_bgm SEQ_GS_EYE_K_SHOUJO
	comparevartovalue VAR_TEMP_x4001, 40
	gotoif ne, scr_seq_00000216_000001E1
	apply_movement 8, scr_seq_00000216_0000032C
	apply_movement 255, scr_seq_00000216_00000350
	goto scr_seq_00000216_00000214

scr_seq_00000216_000001E1:
	comparevartovalue VAR_TEMP_x4001, 41
	gotoif ne, scr_seq_00000216_00000204
	apply_movement 8, scr_seq_00000216_00000338
	apply_movement 255, scr_seq_00000216_00000350
	goto scr_seq_00000216_00000214

scr_seq_00000216_00000204:
	apply_movement 8, scr_seq_00000216_00000344
	apply_movement 255, scr_seq_00000216_00000350
scr_seq_00000216_00000214:
	wait_movement
	msgbox 0
	closemsg
	comparevartovalue VAR_TEMP_x4001, 40
	gotoif ne, scr_seq_00000216_0000023E
	apply_movement 8, scr_seq_00000216_0000035C
	apply_movement 255, scr_seq_00000216_00000380
	goto scr_seq_00000216_00000271

scr_seq_00000216_0000023E:
	comparevartovalue VAR_TEMP_x4001, 41
	gotoif ne, scr_seq_00000216_00000261
	apply_movement 8, scr_seq_00000216_00000368
	apply_movement 255, scr_seq_00000216_00000380
	goto scr_seq_00000216_00000271

scr_seq_00000216_00000261:
	apply_movement 8, scr_seq_00000216_00000374
	apply_movement 255, scr_seq_00000216_00000394
scr_seq_00000216_00000271:
	wait_movement
	hide_person 9
	hide_person 8
	scrcmd_081 1113
	play_bgm SEQ_GS_R_12_24
	setflag FLAG_UNK_309
	setflag FLAG_UNK_256
	clearflag FLAG_UNK_253
	setvar VAR_UNK_4088, 2
	releaseall
	end

scr_seq_00000216_00000299:
	.byte 0x00, 0x00, 0x00

scr_seq_00000216_0000029C:
	.short 63, 1
	.short 2, 1
	.short 66, 2
	.short 0, 1
	.short 254, 0

scr_seq_00000216_000002B0:
	.short 66, 1
	.short 0, 1
	.short 75, 1
	.short 16, 5
	.short 18, 5
	.short 17, 8
	.short 254, 0

scr_seq_00000216_000002CC:
	.short 66, 1
	.short 0, 1
	.short 75, 1
	.short 16, 5
	.short 18, 5
	.short 17, 8
	.short 254, 0

scr_seq_00000216_000002E8:
	.short 66, 1
	.short 0, 1
	.short 75, 1
	.short 16, 6
	.short 18, 5
	.short 17, 9
	.short 254, 0

scr_seq_00000216_00000304:
	.short 65, 6
	.short 1, 1
	.short 254, 0

scr_seq_00000216_00000310:
	.short 65, 6
	.short 0, 1
	.short 63, 1
	.short 2, 1
	.short 63, 1
	.short 1, 1
	.short 254, 0

scr_seq_00000216_0000032C:
	.short 12, 7
	.short 14, 2
	.short 254, 0

scr_seq_00000216_00000338:
	.short 12, 6
	.short 14, 2
	.short 254, 0

scr_seq_00000216_00000344:
	.short 12, 5
	.short 14, 2
	.short 254, 0

scr_seq_00000216_00000350:
	.short 65, 3
	.short 3, 1
	.short 254, 0

scr_seq_00000216_0000035C:
	.short 13, 1
	.short 14, 11
	.short 254, 0

scr_seq_00000216_00000368:
	.short 13, 1
	.short 14, 11
	.short 254, 0

scr_seq_00000216_00000374:
	.short 12, 1
	.short 14, 11
	.short 254, 0

scr_seq_00000216_00000380:
	.short 63, 1
	.short 1, 1
	.short 63, 1
	.short 2, 1
	.short 254, 0

scr_seq_00000216_00000394:
	.short 63, 1
	.short 0, 1
	.short 62, 1
	.short 2, 1
	.short 254, 0
scr_seq_00000216_000003A8:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_147 29, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000216_00000456
	comparevartovalue VAR_TEMP_x4002, 1
	gotoif ge, scr_seq_00000216_0000044B
	msgbox 1
scr_seq_00000216_000003D3:
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000216_000003F7
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, scr_seq_00000216_0000043A
	end

scr_seq_00000216_000003F7:
	scrcmd_190 0
	msgbox 2
	play_fanfare SEQ_ME_POKEGEAR_REGIST
	wait_fanfare
	scrcmd_146 29
	msgbox 3
	waitbutton
	closemsg
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	setflag FLAG_UNK_2CD
	hide_person 15
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	releaseall
	end

scr_seq_00000216_0000043A:
	setvar VAR_TEMP_x4002, 1
	msgbox 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000216_0000044B:
	msgbox 5
	goto scr_seq_00000216_000003D3

scr_seq_00000216_00000454:
	.byte 0x02, 0x00
scr_seq_00000216_00000456:
	scrcmd_184 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000216_000004DA
	scrcmd_733 11, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000216_000004DA
	msgbox 6
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000216_000004E5
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000216_000004F0
	msgbox 7
	closemsg
	setflag FLAG_UNK_189
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_615 84
	faceplayer
	lockall
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	clearflag FLAG_UNK_189
	msgbox 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000216_000004DA:
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000216_000004E5:
	msgbox 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000216_000004F0:
	msgbox 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000216_000004FB:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_122
	gotoif eq, scr_seq_00000216_00000558
	msgbox 11
	setvar VAR_SPECIAL_x8004, 92
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000216_00000563
	callstd 2033
	setflag FLAG_UNK_122
	msgbox 13
	closemsg
	trainer_battle 361, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000216_0000056D
scr_seq_00000216_00000558:
	msgbox 14
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000216_00000563:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_00000216_0000056D:
	scrcmd_219
	releaseall
	end

scr_seq_00000216_00000573:
	scrcmd_609
	lockall
	setflag FLAG_UNK_2AC
	clearflag FLAG_UNK_2A2
	scrcmd_100 13
	apply_movement 255, scr_seq_00000216_00000648
	wait_movement
	scrcmd_076 245, 0
	scrcmd_099 12
	scrcmd_523 12, 2, 90, 2, 0
	scrcmd_098 12
	scrcmd_077
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 40
	gotoif ne, scr_seq_00000216_000005D4
	apply_movement 255, scr_seq_00000216_00000650
	goto scr_seq_00000216_000005F7

scr_seq_00000216_000005D4:
	comparevartovalue VAR_TEMP_x4001, 41
	gotoif ne, scr_seq_00000216_000005EF
	apply_movement 255, scr_seq_00000216_0000065C
	goto scr_seq_00000216_000005F7

scr_seq_00000216_000005EF:
	apply_movement 255, scr_seq_00000216_00000670
scr_seq_00000216_000005F7:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	callstd 2042
	apply_movement 13, scr_seq_00000216_0000069C
	apply_movement 255, scr_seq_00000216_00000690
	wait_movement
	msgbox 16
	closemsg
	apply_movement 13, scr_seq_00000216_000006B0
	apply_movement 255, scr_seq_00000216_00000684
	wait_movement
	msgbox 17
	waitbutton
	closemsg
	callstd 2043
	setvar VAR_UNK_4089, 2
	releaseall
	end

scr_seq_00000216_00000645:
	.byte 0x00, 0x00, 0x00

scr_seq_00000216_00000648:
	.short 75, 1
	.short 254, 0

scr_seq_00000216_00000650:
	.short 15, 3
	.short 0, 1
	.short 254, 0

scr_seq_00000216_0000065C:
	.short 15, 1
	.short 12, 1
	.short 15, 2
	.short 0, 1
	.short 254, 0

scr_seq_00000216_00000670:
	.short 15, 1
	.short 12, 2
	.short 15, 2
	.short 0, 1
	.short 254, 0

scr_seq_00000216_00000684:
	.short 65, 1
	.short 0, 1
	.short 254, 0

scr_seq_00000216_00000690:
	.short 63, 2
	.short 1, 1
	.short 254, 0

scr_seq_00000216_0000069C:
	.short 19, 8
	.short 15, 3
	.short 7, 1
	.short 0, 1
	.short 254, 0

scr_seq_00000216_000006B0:
	.short 15, 1
	.short 12, 2
	.short 254, 0
scr_seq_00000216_000006BC:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 17
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000216_000006CD:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 17
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000216_000006DE:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 245, 0
	scrcmd_099 12
	scrcmd_523 12, 2, 90, 2, 0
	scrcmd_098 12
	scrcmd_077
	setflag FLAG_UNK_0A4
	scrcmd_589 245, 40, 0
	clearflag FLAG_UNK_0A4
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000216_000007AA
	scrcmd_683 16386
	comparevartovalue VAR_TEMP_x4002, 3
	gotoif eq, scr_seq_00000216_000007A6
	comparevartovalue VAR_TEMP_x4002, 4
	callif eq, scr_seq_00000216_000007B0
	comparevartovalue VAR_TEMP_x4002, 5
	gotoif eq, scr_seq_00000216_000007B6
	scrcmd_190 0
	msgbox 18
	closemsg
	checkflag FLAG_UNK_2B2
	gotoif eq, scr_seq_00000216_00000766
	goto scr_seq_00000216_00000786

scr_seq_00000216_00000766:
	apply_movement 255, scr_seq_00000216_000007F4
	apply_movement 13, scr_seq_00000216_00000800
	wait_movement
	hide_person 13
	setflag FLAG_UNK_2A2
	goto scr_seq_00000216_000007A0

scr_seq_00000216_00000786:
	apply_movement 255, scr_seq_00000216_000007F4
	apply_movement 14, scr_seq_00000216_00000800
	wait_movement
	hide_person 14
	setflag FLAG_UNK_2B2
scr_seq_00000216_000007A0:
	setvar VAR_UNK_4089, 3
scr_seq_00000216_000007A6:
	releaseall
	end

scr_seq_00000216_000007AA:
	scrcmd_219
	releaseall
	end

scr_seq_00000216_000007B0:
	setflag FLAG_UNK_175
	return

scr_seq_00000216_000007B6:
	wait 20, VAR_SPECIAL_x8004
	apply_movement 255, scr_seq_00000216_000007EC
	wait_movement
	scrcmd_190 0
	msgbox 19
	closemsg
	checkflag FLAG_UNK_2B2
	gotoif eq, scr_seq_00000216_00000766
	goto scr_seq_00000216_00000786

scr_seq_00000216_000007DF:
	.byte 0x00
	.byte 0x01, 0x00, 0x01, 0x00, 0x3f, 0x00, 0x02, 0x00, 0xfe, 0x00, 0x00, 0x00

scr_seq_00000216_000007EC:
	.short 1, 1
	.short 254, 0

scr_seq_00000216_000007F4:
	.short 63, 2
	.short 2, 1
	.short 254, 0

scr_seq_00000216_00000800:
	.short 14, 11
	.short 254, 0
scr_seq_00000216_00000808:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 15, VAR_SPECIAL_x800C
	callstd 2000
	end
	.balign 4, 0
