#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0957_UNION_0022 ; 000
	scrdef scr_seq_0957_UNION_0024 ; 001
	scrdef scr_seq_0957_UNION_0026 ; 002
	scrdef scr_seq_0957_UNION_002A ; 003
	scrdef scr_seq_0957_UNION_07C8 ; 004
	scrdef scr_seq_0957_UNION_0BE8 ; 005
	scrdef scr_seq_0957_UNION_0BFB ; 006
	scrdef scr_seq_0957_UNION_0C0D ; 007
	scrdef_end

scr_seq_0957_UNION_0022:
	end

scr_seq_0957_UNION_0024:
	end

scr_seq_0957_UNION_0026:
	scrcmd_270
	end

scr_seq_0957_UNION_002A:
	play_se SEQ_SE_DP_SELECT
	scrcmd_609
	lockall
	faceplayer
	scrcmd_268 32780
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 5
	gotoif eq, scr_seq_0957_UNION_0499
	scrcmd_264 0
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, scr_seq_0957_UNION_04AF
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, scr_seq_0957_UNION_05DB
	comparevartovalue VAR_SPECIAL_x800C, 4
	gotoif eq, scr_seq_0957_UNION_0528
	scrcmd_274 32772, 32780
	scrcmd_268 32780
	comparevartovalue VAR_SPECIAL_x800C, 5
	gotoif eq, scr_seq_0957_UNION_0499
	npc_msg 199
	scrcmd_269 32780
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0957_UNION_07CC
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0957_UNION_0488
	goto scr_seq_0957_UNION_00BC

scr_seq_0957_UNION_00BA:
	.byte 0x02, 0x00
scr_seq_0957_UNION_00BC:
	scrcmd_257 100
	scrcmd_267 2, 32780
	scrcmd_592 32780
	goto scr_seq_0957_UNION_00EC

scr_seq_0957_UNION_00D0:
	.byte 0x02, 0x00
scr_seq_0957_UNION_00D2:
	scrcmd_257 100
	scrcmd_261 11
	scrcmd_267 22, 32780
	scrcmd_046 VAR_SPECIAL_x800C
	goto scr_seq_0957_UNION_00EC

scr_seq_0957_UNION_00EA:
	.byte 0x02, 0x00
scr_seq_0957_UNION_00EC:
	scrcmd_064 31, 3, 0, 1, VAR_SPECIAL_x800C
	scrcmd_841 1
	scrcmd_066 168, 0
	scrcmd_066 59, 1
	scrcmd_066 52, 2
	scrcmd_066 23, 3
	scrcmd_066 142, 4
	scrcmd_066 141, 5
	scrcmd_066 24, 99
	scrcmd_585
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0957_UNION_0184
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0957_UNION_0336
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0957_UNION_0276
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0957_UNION_01ED
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_0957_UNION_0396
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, scr_seq_0957_UNION_03F6
	comparevartovalue VAR_SPECIAL_x8008, 7
	gotoif eq, scr_seq_0957_UNION_07A0
	scrcmd_271 0, 7
	goto scr_seq_0957_UNION_0784

scr_seq_0957_UNION_0182:
	.byte 0x02, 0x00
scr_seq_0957_UNION_0184:
	scrcmd_271 0, 1
	scrcmd_267 9, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0957_UNION_01A1
	scrcmd_046 VAR_SPECIAL_x800C
scr_seq_0957_UNION_01A1:
	scrcmd_272 32780
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif eq, scr_seq_0957_UNION_06AE
	scrcmd_261 5
	scrcmd_267 1, 32780
	scrcmd_046 VAR_SPECIAL_x800C
	wait 30, VAR_SPECIAL_x800C
	scrcmd_257 1
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_160
	scrcmd_150
	call scr_seq_0957_UNION_0BDA
	non_npc_msg 16
	goto scr_seq_0957_UNION_00D2

scr_seq_0957_UNION_01EB:
	.byte 0x02, 0x00
scr_seq_0957_UNION_01ED:
	party_count_not_egg VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif lt, scr_seq_0957_UNION_0264
	scrcmd_271 0, 3
	scrcmd_267 9, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0957_UNION_021B
	scrcmd_046 VAR_SPECIAL_x800C
scr_seq_0957_UNION_021B:
	scrcmd_272 32780
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif eq, scr_seq_0957_UNION_06F6
	scrcmd_261 7
	scrcmd_267 1, 32780
	scrcmd_046 VAR_SPECIAL_x800C
	wait 30, VAR_SPECIAL_x800C
	scrcmd_257 3
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_161
	scrcmd_150
	call scr_seq_0957_UNION_0BDA
	goto scr_seq_0957_UNION_00D2

scr_seq_0957_UNION_0262:
	.byte 0x02, 0x00
scr_seq_0957_UNION_0264:
	scrcmd_267 20, 32780
	scrcmd_046 VAR_SPECIAL_x800C
	goto scr_seq_0957_UNION_00D2

scr_seq_0957_UNION_0274:
	.byte 0x02, 0x00
scr_seq_0957_UNION_0276:
	scrcmd_434 32780, 30
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif lt, scr_seq_0957_UNION_0324
	scrcmd_271 0, 2
	scrcmd_267 9, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0957_UNION_02A6
	scrcmd_046 VAR_SPECIAL_x800C
scr_seq_0957_UNION_02A6:
	scrcmd_272 32780
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif eq, scr_seq_0957_UNION_06DE
	scrcmd_261 6
	scrcmd_267 1, 32780
	scrcmd_046 VAR_SPECIAL_x800C
	wait 30, VAR_SPECIAL_x800C
	scrcmd_257 2
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_350
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	npc_msg 202
	scrcmd_257 102
	closemsg
	scrcmd_586 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0957_UNION_0B8B
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, scr_seq_0957_UNION_0B8B
	scrcmd_230
	call scr_seq_0957_UNION_0BDA
	goto scr_seq_0957_UNION_00D2

scr_seq_0957_UNION_0322:
	.byte 0x02, 0x00
scr_seq_0957_UNION_0324:
	scrcmd_267 19, 32780
	scrcmd_046 VAR_SPECIAL_x800C
	goto scr_seq_0957_UNION_00D2

scr_seq_0957_UNION_0334:
	.byte 0x02, 0x00
scr_seq_0957_UNION_0336:
	scrcmd_271 0, 4
	scrcmd_267 9, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0957_UNION_0353
	scrcmd_046 VAR_SPECIAL_x800C
scr_seq_0957_UNION_0353:
	scrcmd_272 32780
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif eq, scr_seq_0957_UNION_06C6
	scrcmd_267 1, 32780
	scrcmd_046 VAR_SPECIAL_x800C
	scrcmd_348 30
	scrcmd_257 4
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_159
	scrcmd_150
	call scr_seq_0957_UNION_0BDA
	goto scr_seq_0957_UNION_0478

scr_seq_0957_UNION_0394:
	.byte 0x02, 0x00
scr_seq_0957_UNION_0396:
	scrcmd_271 0, 5
	scrcmd_267 9, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0957_UNION_03B3
	scrcmd_046 VAR_SPECIAL_x800C
scr_seq_0957_UNION_03B3:
	scrcmd_272 32780
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif eq, scr_seq_0957_UNION_0726
	scrcmd_267 1, 32780
	scrcmd_046 VAR_SPECIAL_x800C
	scrcmd_348 30
	scrcmd_257 5
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_162
	scrcmd_150
	call scr_seq_0957_UNION_0BDA
	goto scr_seq_0957_UNION_0478

scr_seq_0957_UNION_03F4:
	.byte 0x02, 0x00
scr_seq_0957_UNION_03F6:
	scrcmd_359 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0957_UNION_074F
	scrcmd_630 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0957_UNION_0761
	scrcmd_271 0, 6
	scrcmd_267 9, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0957_UNION_0435
	scrcmd_046 VAR_SPECIAL_x800C
scr_seq_0957_UNION_0435:
	scrcmd_272 32780
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif eq, scr_seq_0957_UNION_076C
	scrcmd_267 1, 32780
	scrcmd_046 VAR_SPECIAL_x800C
	scrcmd_348 30
	scrcmd_257 6
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_629
	scrcmd_150
	call scr_seq_0957_UNION_0BDA
	goto scr_seq_0957_UNION_0478

scr_seq_0957_UNION_0476:
	.byte 0x02, 0x00
scr_seq_0957_UNION_0478:
	releaseall
	end

scr_seq_0957_UNION_047C:
	.byte 0x0f, 0x01, 0x00, 0x00
	.byte 0x01, 0x00, 0x35, 0x00, 0x61, 0x00, 0x02, 0x00
scr_seq_0957_UNION_0488:
	npc_msg 38
	wait 30, VAR_SPECIAL_x800C
	closemsg
	scrcmd_263
	releaseall
	end

scr_seq_0957_UNION_0499:
	scrcmd_262
	scrcmd_267 0, 32780
	scrcmd_046 VAR_SPECIAL_x800C
	scrcmd_049
	closemsg
	scrcmd_263
	releaseall
	end

scr_seq_0957_UNION_04AF:
	scrcmd_262
	scrcmd_267 10, 32780
	scrcmd_046 VAR_SPECIAL_x800C
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0957_UNION_05C3
	scrcmd_274 32772, 32780
	comparevartovalue VAR_SPECIAL_x800C, 5
	gotoif eq, scr_seq_0957_UNION_0488
	scrcmd_269 32780
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, scr_seq_0957_UNION_0488
	scrcmd_267 13, 32780
	scrcmd_046 VAR_SPECIAL_x800C
	wait 30, VAR_SPECIAL_x800C
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_159
	scrcmd_150
	fade_screen 6, 1, 1, 0
	goto scr_seq_0957_UNION_0478

scr_seq_0957_UNION_0526:
	.byte 0x02, 0x00
scr_seq_0957_UNION_0528:
	scrcmd_262
	scrcmd_267 12, 32780
	scrcmd_046 VAR_SPECIAL_x800C
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0957_UNION_066C
	scrcmd_359 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0957_UNION_0698
	scrcmd_584 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0957_UNION_0682
	scrcmd_274 32772, 32780
	comparevartovalue VAR_SPECIAL_x800C, 5
	gotoif eq, scr_seq_0957_UNION_0488
	scrcmd_269 32780
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, scr_seq_0957_UNION_0488
	scrcmd_267 15, 32780
	scrcmd_046 VAR_SPECIAL_x800C
	wait 30, VAR_SPECIAL_x800C
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_629
	scrcmd_150
	fade_screen 6, 1, 1, 0
	goto scr_seq_0957_UNION_0478

scr_seq_0957_UNION_05C1:
	.byte 0x02, 0x00
scr_seq_0957_UNION_05C3:
	scrcmd_267 16, 32780
	scrcmd_046 VAR_SPECIAL_x800C
	wait 30, VAR_SPECIAL_x800C
	scrcmd_263
	closemsg
	releaseall
	end

scr_seq_0957_UNION_05DB:
	scrcmd_262
	scrcmd_267 11, 32780
	scrcmd_046 VAR_SPECIAL_x800C
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0957_UNION_0654
	scrcmd_274 32772, 32780
	comparevartovalue VAR_SPECIAL_x800C, 5
	gotoif eq, scr_seq_0957_UNION_0488
	scrcmd_269 32780
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, scr_seq_0957_UNION_0488
	scrcmd_267 14, 32780
	scrcmd_046 VAR_SPECIAL_x800C
	wait 30, VAR_SPECIAL_x800C
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_162
	scrcmd_150
	fade_screen 6, 1, 1, 0
	goto scr_seq_0957_UNION_0478

scr_seq_0957_UNION_0652:
	.byte 0x02, 0x00
scr_seq_0957_UNION_0654:
	scrcmd_267 17, 32780
	scrcmd_046 VAR_SPECIAL_x800C
	wait 30, VAR_SPECIAL_x800C
	closemsg
	scrcmd_263
	releaseall
	end

scr_seq_0957_UNION_066C:
	scrcmd_267 18, 32780
	scrcmd_046 VAR_SPECIAL_x800C
	wait 30, VAR_SPECIAL_x800C
	closemsg
	releaseall
	end

scr_seq_0957_UNION_0682:
	scrcmd_267 26, 32780
	scrcmd_046 VAR_SPECIAL_x800C
	wait 30, VAR_SPECIAL_x800C
	closemsg
	releaseall
	end

scr_seq_0957_UNION_0698:
	scrcmd_267 21, 32780
	scrcmd_046 VAR_SPECIAL_x800C
	wait 30, VAR_SPECIAL_x800C
	closemsg
	releaseall
	end

scr_seq_0957_UNION_06AE:
	scrcmd_267 3, 32780
	scrcmd_046 VAR_SPECIAL_x800C
	wait 30, VAR_SPECIAL_x800C
	goto scr_seq_0957_UNION_07BC

scr_seq_0957_UNION_06C4:
	.byte 0x02, 0x00
scr_seq_0957_UNION_06C6:
	scrcmd_267 4, 32780
	scrcmd_046 VAR_SPECIAL_x800C
	wait 30, VAR_SPECIAL_x800C
	goto scr_seq_0957_UNION_07BC

scr_seq_0957_UNION_06DC:
	.byte 0x02, 0x00
scr_seq_0957_UNION_06DE:
	scrcmd_267 5, 32780
	scrcmd_046 VAR_SPECIAL_x800C
	wait 30, VAR_SPECIAL_x800C
	goto scr_seq_0957_UNION_07BC

scr_seq_0957_UNION_06F4:
	.byte 0x02, 0x00
scr_seq_0957_UNION_06F6:
	scrcmd_267 6, 32780
	scrcmd_046 VAR_SPECIAL_x800C
	wait 30, VAR_SPECIAL_x800C
	goto scr_seq_0957_UNION_07BC

scr_seq_0957_UNION_070C:
	.byte 0x02, 0x00, 0x0b, 0x01
	.byte 0x07, 0x00, 0x0c, 0x80, 0x2e, 0x00, 0x0c, 0x80, 0x03, 0x00, 0x1e, 0x00, 0x0c, 0x80, 0x16, 0x00
	.byte 0x98, 0x00, 0x00, 0x00, 0x02, 0x00
scr_seq_0957_UNION_0726:
	scrcmd_267 8, 32780
	scrcmd_046 VAR_SPECIAL_x800C
	wait 30, VAR_SPECIAL_x800C
	goto scr_seq_0957_UNION_07BC

scr_seq_0957_UNION_073C:
	.byte 0x02, 0x00
scr_seq_0957_UNION_073E:
	scrcmd_271 1, 1
	npc_msg 36
	goto scr_seq_0957_UNION_0BC2

scr_seq_0957_UNION_074D:
	.byte 0x02, 0x00
scr_seq_0957_UNION_074F:
	scrcmd_267 21, 32780
	scrcmd_046 VAR_SPECIAL_x800C
	goto scr_seq_0957_UNION_00D2

scr_seq_0957_UNION_075F:
	.byte 0x02
	.byte 0x00
scr_seq_0957_UNION_0761:
	npc_msg 218
	goto scr_seq_0957_UNION_00D2

scr_seq_0957_UNION_076A:
	.byte 0x02, 0x00
scr_seq_0957_UNION_076C:
	scrcmd_267 8, 32780
	scrcmd_046 VAR_SPECIAL_x800C
	wait 30, VAR_SPECIAL_x800C
	goto scr_seq_0957_UNION_07BC

scr_seq_0957_UNION_0782:
	.byte 0x02, 0x00
scr_seq_0957_UNION_0784:
	scrcmd_267 23, 32780
	scrcmd_046 VAR_SPECIAL_x800C
	wait 30, VAR_SPECIAL_x800C
	scrcmd_257 101
	closemsg
	scrcmd_266
	releaseall
	end

scr_seq_0957_UNION_07A0:
	scrcmd_267 24, 32780
	scrcmd_046 VAR_SPECIAL_x800C
	wait 30, VAR_SPECIAL_x800C
	scrcmd_257 101
	closemsg
	scrcmd_266
	releaseall
	end

scr_seq_0957_UNION_07BC:
	scrcmd_257 101
	closemsg
	scrcmd_266
	releaseall
	end

scr_seq_0957_UNION_07C8:
	scrcmd_609
	lockall
scr_seq_0957_UNION_07CC:
	play_se SEQ_SE_DP_BUTTON9
	scrcmd_264 1
	scrcmd_592 7
	scrcmd_348 30
	goto scr_seq_0957_UNION_07E4

scr_seq_0957_UNION_07E2:
	.byte 0x02, 0x00
scr_seq_0957_UNION_07E4:
	npc_msg 9
	scrcmd_257 100
	scrcmd_261 11
	scrcmd_273 32780
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0957_UNION_0863
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_0957_UNION_0B11
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0957_UNION_0974
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0957_UNION_08DB
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, scr_seq_0957_UNION_0A44
	comparevartovalue VAR_SPECIAL_x8008, 6
	gotoif eq, scr_seq_0957_UNION_0AA2
	comparevartovalue VAR_SPECIAL_x8008, 7
	gotoif eq, scr_seq_0957_UNION_0BA0
	comparevartovalue VAR_SPECIAL_x8008, 8
	gotoif eq, scr_seq_0957_UNION_0BB1
	end

scr_seq_0957_UNION_0863:
	npc_msg 11
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0957_UNION_08CA
	scrcmd_271 1, 0
	closemsg
	scrcmd_272 32780
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif eq, scr_seq_0957_UNION_0B80
	scrcmd_576 32780
	scrcmd_046 VAR_SPECIAL_x800C
	wait 30, VAR_SPECIAL_x800C
	scrcmd_257 1
	closemsg
	scrcmd_261 5
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_160
	scrcmd_150
	call scr_seq_0957_UNION_0BDA
	goto scr_seq_0957_UNION_07E4

scr_seq_0957_UNION_08C8:
	.byte 0x02, 0x00
scr_seq_0957_UNION_08CA:
	scrcmd_271 1, 1
	npc_msg 17
	goto scr_seq_0957_UNION_0BC2

scr_seq_0957_UNION_08D9:
	.byte 0x02, 0x00
scr_seq_0957_UNION_08DB:
	npc_msg 26
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0957_UNION_0952
	party_count_not_egg VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif lt, scr_seq_0957_UNION_0963
	scrcmd_271 1, 0
	closemsg
	scrcmd_272 32780
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif eq, scr_seq_0957_UNION_0BA0
	npc_msg 27
	wait 30, VAR_SPECIAL_x800C
	scrcmd_257 3
	closemsg
	scrcmd_261 7
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_161
	scrcmd_150
	scrcmd_261 11
	call scr_seq_0957_UNION_0BDA
	goto scr_seq_0957_UNION_07E4

scr_seq_0957_UNION_0950:
	.byte 0x02, 0x00
scr_seq_0957_UNION_0952:
	scrcmd_271 1, 1
	npc_msg 20
	goto scr_seq_0957_UNION_0BC2

scr_seq_0957_UNION_0961:
	.byte 0x02, 0x00
scr_seq_0957_UNION_0963:
	scrcmd_271 1, 1
	npc_msg 29
	goto scr_seq_0957_UNION_0BC2

scr_seq_0957_UNION_0972:
	.byte 0x02, 0x00
scr_seq_0957_UNION_0974:
	npc_msg 21
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0957_UNION_0A22
	scrcmd_434 32780, 30
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif lt, scr_seq_0957_UNION_0A33
	scrcmd_271 1, 0
	closemsg
	scrcmd_272 32780
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif eq, scr_seq_0957_UNION_0BA0
	npc_msg 22
	wait 30, VAR_SPECIAL_x800C
	scrcmd_257 2
	closemsg
	scrcmd_261 6
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_350
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	npc_msg 202
	scrcmd_257 102
	closemsg
	scrcmd_586 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0957_UNION_0B8B
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, scr_seq_0957_UNION_0B8B
	scrcmd_230
	scrcmd_261 11
	call scr_seq_0957_UNION_0BDA
	goto scr_seq_0957_UNION_07E4

scr_seq_0957_UNION_0A20:
	.byte 0x02, 0x00
scr_seq_0957_UNION_0A22:
	scrcmd_271 1, 1
	npc_msg 23
	goto scr_seq_0957_UNION_0BC2

scr_seq_0957_UNION_0A31:
	.byte 0x02, 0x00
scr_seq_0957_UNION_0A33:
	scrcmd_271 1, 1
	npc_msg 24
	goto scr_seq_0957_UNION_0BC2

scr_seq_0957_UNION_0A42:
	.byte 0x02, 0x00
scr_seq_0957_UNION_0A44:
	npc_msg 30
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0957_UNION_0A22
	scrcmd_271 1, 0
	closemsg
	scrcmd_272 32780
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif eq, scr_seq_0957_UNION_0BA0
	npc_msg 31
	wait 30, VAR_SPECIAL_x800C
	scrcmd_257 5
	closemsg
	scrcmd_261 2
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_162
	scrcmd_150
	call scr_seq_0957_UNION_0BDA
	releaseall
	end

scr_seq_0957_UNION_0AA2:
	npc_msg 33
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0957_UNION_0A22
	scrcmd_271 1, 0
	closemsg
	scrcmd_359 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0957_UNION_073E
	scrcmd_272 32780
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif eq, scr_seq_0957_UNION_0BA0
	npc_msg 34
	wait 30, VAR_SPECIAL_x800C
	scrcmd_257 6
	closemsg
	scrcmd_261 13
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_629
	scrcmd_150
	call scr_seq_0957_UNION_0BDA
	releaseall
	end

scr_seq_0957_UNION_0B11:
	npc_msg 18
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0957_UNION_0B6F
	scrcmd_271 1, 0
	closemsg
	scrcmd_272 32780
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif eq, scr_seq_0957_UNION_0BA0
	npc_msg 19
	wait 30, VAR_SPECIAL_x800C
	scrcmd_257 4
	closemsg
	scrcmd_261 1
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_159
	scrcmd_150
	call scr_seq_0957_UNION_0BDA
	releaseall
	end

scr_seq_0957_UNION_0B6F:
	scrcmd_271 1, 1
	npc_msg 28
	goto scr_seq_0957_UNION_0BC2

scr_seq_0957_UNION_0B7E:
	.byte 0x02, 0x00
scr_seq_0957_UNION_0B80:
	npc_msg 35
	goto scr_seq_0957_UNION_0BC2

scr_seq_0957_UNION_0B89:
	.byte 0x02, 0x00
scr_seq_0957_UNION_0B8B:
	scrcmd_261 11
	npc_msg 25
	wait 30, VAR_SPECIAL_x800C
	goto scr_seq_0957_UNION_0BC2

scr_seq_0957_UNION_0B9E:
	.byte 0x02, 0x00
scr_seq_0957_UNION_0BA0:
	npc_msg 8
	wait 30, VAR_SPECIAL_x800C
	goto scr_seq_0957_UNION_0BC2

scr_seq_0957_UNION_0BAF:
	.byte 0x02
	.byte 0x00
scr_seq_0957_UNION_0BB1:
	npc_msg 10
	wait 30, VAR_SPECIAL_x800C
	goto scr_seq_0957_UNION_0BC2

scr_seq_0957_UNION_0BC0:
	.byte 0x02, 0x00
scr_seq_0957_UNION_0BC2:
	scrcmd_257 101
	closemsg
	scrcmd_266
	releaseall
	end

scr_seq_0957_UNION_0BCE:
	.byte 0x0f, 0x01
	.byte 0x01, 0x00, 0x01, 0x00, 0x35, 0x00, 0x61, 0x00, 0x02, 0x00
scr_seq_0957_UNION_0BDA:
	scrcmd_265
	fade_screen 6, 1, 1, 0
	return

scr_seq_0957_UNION_0BE8:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 207
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0957_UNION_0BFB:
	play_se SEQ_SE_DP_SELECT
	scrcmd_609
	lockall
	faceplayer
	goto scr_seq_0957_UNION_0499

scr_seq_0957_UNION_0C0B:
	.byte 0x02, 0x00
scr_seq_0957_UNION_0C0D:
	play_se SEQ_SE_DP_SELECT
	scrcmd_609
	lockall
	faceplayer
	goto scr_seq_0957_UNION_0C1F

scr_seq_0957_UNION_0C1D:
	.byte 0x02, 0x00
scr_seq_0957_UNION_0C1F:
	scrcmd_262
	checkflag FLAG_UNK_069
	callif TRUE, scr_seq_0957_UNION_0C87
	touchscreen_menu_hide
scr_seq_0957_UNION_0C2E:
	checkflag FLAG_UNK_069
	callif FALSE, scr_seq_0957_UNION_0C8C
	setflag FLAG_UNK_069
	scrcmd_749 21, 11, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 11, 255, 0
	scrcmd_751 169, 255, 1
	scrcmd_751 24, 255, 2
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0957_UNION_0CAF
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0957_UNION_0C91
	goto scr_seq_0957_UNION_0CA5

scr_seq_0957_UNION_0C85:
	.byte 0x02, 0x00
scr_seq_0957_UNION_0C87:
	npc_msg 158
	return

scr_seq_0957_UNION_0C8C:
	npc_msg 157
	return

scr_seq_0957_UNION_0C91:
	touchscreen_menu_show
	scrcmd_260 32780
	scrcmd_046 VAR_SPECIAL_x800C
	touchscreen_menu_hide
	goto scr_seq_0957_UNION_0C2E

scr_seq_0957_UNION_0CA3:
	.byte 0x02, 0x00
scr_seq_0957_UNION_0CA5:
	touchscreen_menu_show
	scrcmd_263
	closemsg
	releaseall
	end

scr_seq_0957_UNION_0CAF:
	npc_msg 159
	scrcmd_749 24, 3, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 52, 255, 0
	scrcmd_751 23, 255, 1
	scrcmd_751 142, 255, 2
	scrcmd_751 59, 255, 3
	scrcmd_751 170, 255, 4
	scrcmd_751 141, 255, 5
	scrcmd_751 13, 255, 6
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0957_UNION_0D50
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0957_UNION_0D5F
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0957_UNION_0D6E
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0957_UNION_0D7D
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_0957_UNION_0D8C
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, scr_seq_0957_UNION_0D9B
	goto scr_seq_0957_UNION_0C2E

scr_seq_0957_UNION_0D4E:
	.byte 0x02, 0x00
scr_seq_0957_UNION_0D50:
	touchscreen_menu_show
	npc_msg 160
	touchscreen_menu_hide
	goto scr_seq_0957_UNION_0CAF

scr_seq_0957_UNION_0D5D:
	.byte 0x02, 0x00
scr_seq_0957_UNION_0D5F:
	touchscreen_menu_show
	npc_msg 161
	touchscreen_menu_hide
	goto scr_seq_0957_UNION_0CAF

scr_seq_0957_UNION_0D6C:
	.byte 0x02, 0x00
scr_seq_0957_UNION_0D6E:
	touchscreen_menu_show
	npc_msg 162
	touchscreen_menu_hide
	goto scr_seq_0957_UNION_0CAF

scr_seq_0957_UNION_0D7B:
	.byte 0x02, 0x00
scr_seq_0957_UNION_0D7D:
	touchscreen_menu_show
	npc_msg 164
	touchscreen_menu_hide
	goto scr_seq_0957_UNION_0CAF

scr_seq_0957_UNION_0D8A:
	.byte 0x02, 0x00
scr_seq_0957_UNION_0D8C:
	touchscreen_menu_show
	npc_msg 165
	touchscreen_menu_hide
	goto scr_seq_0957_UNION_0CAF

scr_seq_0957_UNION_0D99:
	.byte 0x02, 0x00
scr_seq_0957_UNION_0D9B:
	touchscreen_menu_show
	npc_msg 163
	touchscreen_menu_hide
	goto scr_seq_0957_UNION_0CAF

scr_seq_0957_UNION_0DA8:
	.byte 0x02, 0x00, 0x16, 0x00, 0x7e, 0xfe, 0xff, 0xff
	.byte 0x02, 0x00, 0x00, 0x00
	.balign 4, 0
