#include "constants/sndseq.h"
#include "constants/species.h"
#include "constants/maps.h"
#include "constants/pokemon.h"
#include "constants/flags.h"
#include "constants/vars.h"
#include "constants/items.h"
#include "constants/std_script.h"
#include "fielddata/script/scr_seq/event_D24R0204.h"
#include "party_menu.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_0205C268
sub_0205C268: ; 0x0205C268
	push {r3, lr}
	cmp r0, #0x64
	bhs _0205C272
	mov r0, #0xff
	pop {r3, pc}
_0205C272:
	bl ov00_021E6EBC
	pop {r3, pc}
	thumb_func_end sub_0205C268

	thumb_func_start sub_0205C278
sub_0205C278: ; 0x0205C278
	push {r4, lr}
	bl sub_0203769C
	mov r1, #1
	eor r0, r1
	bl sub_02034818
	add r4, r0, #0
	bne _0205C28E
	bl GF_AssertFail
_0205C28E:
	add r0, r4, #0
	bl PlayerProfile_GetVersion
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0205C278

	thumb_func_start sub_0205C298
sub_0205C298: ; 0x0205C298
	push {r3, lr}
	bl Sav2_PlayerData_GetProfileAddr
	bl PlayerProfile_GetVersion
	cmp r0, #0
	bne _0205C2AA
	mov r0, #1
	pop {r3, pc}
_0205C2AA:
	bl sub_0205C278
	cmp r0, #0
	bne _0205C2B6
	mov r0, #1
	b _0205C2B8
_0205C2B6:
	mov r0, #0
_0205C2B8:
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0205C298

	thumb_func_start sub_0205C2C0
sub_0205C2C0: ; 0x0205C2C0
	cmp r0, #3
	bhi _0205C2E6
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0205C2D0: ; jump table
	.short _0205C2D8 - _0205C2D0 - 2 ; case 0
	.short _0205C2DC - _0205C2D0 - 2 ; case 1
	.short _0205C2E0 - _0205C2D0 - 2 ; case 2
	.short _0205C2E4 - _0205C2D0 - 2 ; case 3
_0205C2D8:
	mov r0, #0x5f
	bx lr
_0205C2DC:
	mov r0, #0x61
	bx lr
_0205C2E0:
	mov r0, #0x63
	bx lr
_0205C2E4:
	mov r0, #0x8f
_0205C2E6:
	bx lr
	thumb_func_end sub_0205C2C0

	thumb_func_start sub_0205C2E8
sub_0205C2E8: ; 0x0205C2E8
	cmp r0, #3
	bhi _0205C30E
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0205C2F8: ; jump table
	.short _0205C300 - _0205C2F8 - 2 ; case 0
	.short _0205C304 - _0205C2F8 - 2 ; case 1
	.short _0205C308 - _0205C2F8 - 2 ; case 2
	.short _0205C30C - _0205C2F8 - 2 ; case 3
_0205C300:
	mov r0, #0x5e
	bx lr
_0205C304:
	mov r0, #0x60
	bx lr
_0205C308:
	mov r0, #0x62
	bx lr
_0205C30C:
	mov r0, #0x8e
_0205C30E:
	bx lr
	thumb_func_end sub_0205C2E8

	thumb_func_start sub_0205C310
sub_0205C310: ; 0x0205C310
	push {r4, lr}
	cmp r0, #6
	bhi _0205C348
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0205C322: ; jump table
	.short _0205C330 - _0205C322 - 2 ; case 0
	.short _0205C334 - _0205C322 - 2 ; case 1
	.short _0205C338 - _0205C322 - 2 ; case 2
	.short _0205C33C - _0205C322 - 2 ; case 3
	.short _0205C340 - _0205C322 - 2 ; case 4
	.short _0205C348 - _0205C322 - 2 ; case 5
	.short _0205C344 - _0205C322 - 2 ; case 6
_0205C330:
	mov r4, #1
	b _0205C34C
_0205C334:
	mov r4, #3
	b _0205C34C
_0205C338:
	mov r4, #5
	b _0205C34C
_0205C33C:
	mov r4, #7
	b _0205C34C
_0205C340:
	mov r4, #9
	b _0205C34C
_0205C344:
	mov r4, #0x71
	b _0205C34C
_0205C348:
	bl GF_AssertFail
_0205C34C:
	add r0, r4, #0
	pop {r4, pc}
	thumb_func_end sub_0205C310

	thumb_func_start sub_0205C350
sub_0205C350: ; 0x0205C350
	push {r4, lr}
	cmp r0, #6
	bhi _0205C388
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0205C362: ; jump table
	.short _0205C370 - _0205C362 - 2 ; case 0
	.short _0205C374 - _0205C362 - 2 ; case 1
	.short _0205C378 - _0205C362 - 2 ; case 2
	.short _0205C37C - _0205C362 - 2 ; case 3
	.short _0205C380 - _0205C362 - 2 ; case 4
	.short _0205C388 - _0205C362 - 2 ; case 5
	.short _0205C384 - _0205C362 - 2 ; case 6
_0205C370:
	mov r4, #0
	b _0205C38C
_0205C374:
	mov r4, #2
	b _0205C38C
_0205C378:
	mov r4, #4
	b _0205C38C
_0205C37C:
	mov r4, #6
	b _0205C38C
_0205C380:
	mov r4, #8
	b _0205C38C
_0205C384:
	mov r4, #0x70
	b _0205C38C
_0205C388:
	bl GF_AssertFail
_0205C38C:
	add r0, r4, #0
	pop {r4, pc}
	thumb_func_end sub_0205C350

	thumb_func_start sub_0205C390
sub_0205C390: ; 0x0205C390
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	ldr r4, [sp, #0x2c]
	str r0, [sp, #8]
	add r5, r1, #0
	add r6, r2, #0
	str r3, [sp, #0xc]
	bl sub_0205C4E0
	ldr r1, [sp, #0x28]
	ldr r3, [sp, #0x34]
	add r2, r4, #0
	add r7, r0, #0
	bl sub_0205C500
	ldr r0, [sp, #0x30]
	cmp r0, #2
	bne _0205C3C0
	ldr r0, [sp, #0x28]
	add r1, r4, #0
	bl sub_0205C898
	add r2, r0, #0
	b _0205C3F0
_0205C3C0:
	cmp r0, #0
	bne _0205C3D2
	cmp r4, #0
	bne _0205C3CC
	ldr r2, _0205C404 ; =0x00000127
	b _0205C3F0
_0205C3CC:
	mov r2, #0x4a
	lsl r2, r2, #2
	b _0205C3F0
_0205C3D2:
	cmp r0, #1
	bne _0205C3E2
	cmp r4, #0
	bne _0205C3DE
	mov r2, #0xee
	b _0205C3F0
_0205C3DE:
	mov r2, #0xef
	b _0205C3F0
_0205C3E2:
	bl GF_AssertFail
	ldr r0, [sp, #0x28]
	add r1, r4, #0
	bl sub_0205C898
	add r2, r0, #0
_0205C3F0:
	ldr r1, [sp, #8]
	str r5, [sp]
	ldr r3, [sp, #0xc]
	add r0, r7, #0
	str r6, [sp, #4]
	bl sub_0205C564
	add r0, r7, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0205C404: .word 0x00000127
	thumb_func_end sub_0205C390

	thumb_func_start sub_0205C408
sub_0205C408: ; 0x0205C408
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r7, r0, #0
	add r6, r2, #0
	bl sub_0205C4E0
	add r5, r0, #0
	add r0, r4, #0
	bl sub_0205C7EC
	str r0, [sp]
	ldr r1, [sp]
	add r0, r5, #0
	add r2, r6, #0
	add r3, r4, #0
	bl sub_0205C500
	add r0, r7, #0
	bl sub_0205C640
	add r4, r0, #0
	ldr r0, [sp]
	add r1, r6, #0
	bl sub_0205C898
	add r1, r0, #0
	add r0, r4, #0
	bl sub_0205F258
	mov r1, #9
	add r0, r4, #0
	lsl r1, r1, #0xa
	bl sub_0205F20C
	mov r1, #6
	add r0, r4, #0
	lsl r1, r1, #6
	bl sub_0205F214
	add r0, r4, #0
	mov r1, #1
	bl sub_0205F89C
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205C6D8
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0205C408

	thumb_func_start sub_0205C46C
sub_0205C46C: ; 0x0205C46C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl sub_0205C6DC
	add r4, r0, #0
	bne _0205C47C
	bl GF_AssertFail
_0205C47C:
	add r0, r4, #0
	bl sub_0205F35C
	add r0, r5, #0
	bl ov01_022008B4
	add r0, r5, #0
	bl sub_0205C700
	cmp r0, #2
	bne _0205C4C0
	add r0, r5, #0
	bl GetPlayerXCoord
	add r6, r0, #0
	add r0, r5, #0
	bl GetPlayerYCoord
	add r7, r0, #0
	add r0, r5, #0
	bl PlayerAvatar_GetFacingDirection
	add r3, r0, #0
	mov r0, #1
	str r0, [sp]
	add r0, r4, #0
	add r1, r6, #0
	add r2, r7, #0
	bl ov01_021FE7DC
	add r1, r0, #0
	add r0, r5, #0
	bl sub_0205C78C
_0205C4C0:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0205C46C

	thumb_func_start sub_0205C4C4
sub_0205C4C4: ; 0x0205C4C4
	ldr r3, _0205C4C8 ; =FreeToHeap
	bx r3
	.balign 4, 0
_0205C4C8: .word FreeToHeap
	thumb_func_end sub_0205C4C4

	thumb_func_start sub_0205C4CC
sub_0205C4CC: ; 0x0205C4CC
	push {r4, lr}
	add r4, r0, #0
	bl sub_0205C6DC
	bl sub_0205E3CC
	add r0, r4, #0
	bl sub_0205C4C4
	pop {r4, pc}
	thumb_func_end sub_0205C4CC

	thumb_func_start sub_0205C4E0
sub_0205C4E0: ; 0x0205C4E0
	push {r4, lr}
	mov r0, #0xb
	mov r1, #0x40
	bl AllocFromHeap
	add r4, r0, #0
	bne _0205C4F2
	bl GF_AssertFail
_0205C4F2:
	add r0, r4, #0
	mov r1, #0
	mov r2, #0x40
	bl memset
	add r0, r4, #0
	pop {r4, pc}
	thumb_func_end sub_0205C4E0

	thumb_func_start sub_0205C500
sub_0205C500: ; 0x0205C500
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r1, r3, #0
	add r6, r2, #0
	bl sub_0205C794
	add r0, r5, #0
	mov r1, #0
	bl sub_0205C6C8
	add r0, r5, #0
	mov r1, #0
	bl sub_0205C6D0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205C6E4
	add r0, r5, #0
	add r1, r6, #0
	bl sub_0205C720
	add r0, r5, #0
	mov r1, #0
	bl sub_0205C718
	add r0, r5, #0
	bl sub_0205C74C
	mov r1, #0
	add r0, r5, #0
	mvn r1, r1
	bl sub_0205C768
	mov r1, #0
	add r0, r5, #0
	mvn r1, r1
	bl sub_0205C770
	add r0, r5, #0
	mov r1, #0xff
	bl sub_0205C79C
	add r0, r5, #0
	mov r1, #1
	bl sub_0205CA4C
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0205C500

	thumb_func_start sub_0205C564
sub_0205C564: ; 0x0205C564
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r0, #0
	str r2, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	add r0, r1, #0
	ldr r1, [sp, #0x18]
	ldr r2, [sp, #0x1c]
	bl sub_0205E294
	add r5, r0, #0
	bne _0205C584
	bl GF_AssertFail
_0205C584:
	add r0, r5, #0
	mov r1, #0xff
	bl sub_0205F248
	add r0, r5, #0
	mov r1, #0
	bl sub_0205F268
	add r0, r5, #0
	mov r1, #0
	bl sub_0205F270
	add r0, r5, #0
	mov r1, #0
	bl sub_0205F278
	mov r1, #0
	add r0, r5, #0
	add r2, r1, #0
	bl sub_0205F2D0
	add r0, r5, #0
	mov r1, #0
	mov r2, #1
	bl sub_0205F2D0
	add r0, r5, #0
	mov r1, #0
	mov r2, #2
	bl sub_0205F2D0
	mov r1, #0
	add r0, r5, #0
	mvn r1, r1
	bl sub_0205F318
	mov r1, #0
	add r0, r5, #0
	mvn r1, r1
	bl sub_0205F320
	mov r1, #9
	add r0, r5, #0
	lsl r1, r1, #0xa
	bl sub_0205F20C
	mov r1, #6
	add r0, r5, #0
	lsl r1, r1, #6
	bl sub_0205F214
	add r0, r5, #0
	mov r1, #1
	bl sub_0205F89C
	add r0, r4, #0
	add r1, r5, #0
	bl sub_0205C6D8
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0205C564

	thumb_func_start sub_0205C600
sub_0205C600: ; 0x0205C600
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	mov r1, #0
	str r1, [sp, #4]
	str r1, [sp]
	add r1, sp, #0
	add r2, sp, #4
	mov r3, #1
	add r5, r0, #0
	bl sub_0205EEF4
	cmp r0, #0
	beq _0205C63A
	add r4, sp, #0
	add r6, sp, #4
	mov r7, #1
_0205C620:
	ldr r0, [sp]
	bl sub_0205F264
	cmp r0, #1
	beq _0205C63A
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	add r3, r7, #0
	bl sub_0205EEF4
	cmp r0, #0
	bne _0205C620
_0205C63A:
	ldr r0, [sp]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0205C600

	thumb_func_start sub_0205C640
sub_0205C640: ; 0x0205C640
	push {r4, lr}
	bl sub_0205C600
	add r4, r0, #0
	bne _0205C64E
	bl GF_AssertFail
_0205C64E:
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0205C640

	thumb_func_start PlayerAvatar_GetFacingDirection
PlayerAvatar_GetFacingDirection: ; 0x0205C654
	push {r3, lr}
	bl sub_0205C6DC
	bl sub_0205F2A8
	pop {r3, pc}
	thumb_func_end PlayerAvatar_GetFacingDirection

	thumb_func_start sub_0205C660
sub_0205C660: ; 0x0205C660
	push {r4, lr}
	add r4, r1, #0
	bl sub_0205C6DC
	add r1, r4, #0
	bl sub_0205F290
	pop {r4, pc}
	thumb_func_end sub_0205C660

	thumb_func_start sub_0205C670
sub_0205C670: ; 0x0205C670
	push {r3, lr}
	bl sub_0205C6DC
	bl sub_0205F2B8
	pop {r3, pc}
	thumb_func_end sub_0205C670

	thumb_func_start GetPlayerXCoord
GetPlayerXCoord: ; 0x0205C67C
	push {r3, lr}
	bl sub_0205C6DC
	bl sub_0205F914
	pop {r3, pc}
	thumb_func_end GetPlayerXCoord

	thumb_func_start GetPlayerYCoord
GetPlayerYCoord: ; 0x0205C688
	push {r3, lr}
	bl sub_0205C6DC
	bl sub_0205F934
	pop {r3, pc}
	thumb_func_end GetPlayerYCoord

	thumb_func_start sub_0205C694
sub_0205C694: ; 0x0205C694
	push {r3, lr}
	bl sub_0205C6DC
	bl sub_0205F8FC
	pop {r3, pc}
	thumb_func_end sub_0205C694

	thumb_func_start sub_0205C6A0
sub_0205C6A0: ; 0x0205C6A0
	push {r3, lr}
	bl sub_0205C6DC
	bl sub_0205F90C
	pop {r3, pc}
	thumb_func_end sub_0205C6A0

	thumb_func_start sub_0205C6AC
sub_0205C6AC: ; 0x0205C6AC
	push {r4, lr}
	add r4, r1, #0
	bl sub_0205C6DC
	add r1, r4, #0
	bl sub_0205F944
	pop {r4, pc}
	thumb_func_end sub_0205C6AC

	thumb_func_start sub_0205C6BC
sub_0205C6BC: ; 0x0205C6BC
	push {r3, lr}
	bl sub_0205C6E0
	bl sub_0205F964
	pop {r3, pc}
	thumb_func_end sub_0205C6BC

	thumb_func_start sub_0205C6C8
sub_0205C6C8: ; 0x0205C6C8
	str r1, [r0, #0x10]
	bx lr
	thumb_func_end sub_0205C6C8

	thumb_func_start sub_0205C6CC
sub_0205C6CC: ; 0x0205C6CC
	ldr r0, [r0, #0x10]
	bx lr
	thumb_func_end sub_0205C6CC

	thumb_func_start sub_0205C6D0
sub_0205C6D0: ; 0x0205C6D0
	str r1, [r0, #0x14]
	bx lr
	thumb_func_end sub_0205C6D0

	thumb_func_start sub_0205C6D4
sub_0205C6D4: ; 0x0205C6D4
	ldr r0, [r0, #0x14]
	bx lr
	thumb_func_end sub_0205C6D4

	thumb_func_start sub_0205C6D8
sub_0205C6D8: ; 0x0205C6D8
	str r1, [r0, #0x30]
	bx lr
	thumb_func_end sub_0205C6D8

	thumb_func_start sub_0205C6DC
sub_0205C6DC: ; 0x0205C6DC
	ldr r0, [r0, #0x30]
	bx lr
	thumb_func_end sub_0205C6DC

	thumb_func_start sub_0205C6E0
sub_0205C6E0: ; 0x0205C6E0
	ldr r0, [r0, #0x30]
	bx lr
	thumb_func_end sub_0205C6E0

	thumb_func_start sub_0205C6E4
sub_0205C6E4: ; 0x0205C6E4
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #4
	blt _0205C6F2
	bl GF_AssertFail
_0205C6F2:
	add r0, r5, #0
	add r1, r4, #0
	str r4, [r5, #0x18]
	bl sub_0205C800
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0205C6E4

	thumb_func_start sub_0205C700
sub_0205C700: ; 0x0205C700
	push {r4, lr}
	add r4, r0, #0
	bne _0205C70A
	bl GF_AssertFail
_0205C70A:
	ldr r0, [r4, #0x18]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0205C700

	thumb_func_start sub_0205C710
sub_0205C710: ; 0x0205C710
	ldr r2, [r0, #4]
	orr r1, r2
	str r1, [r0, #4]
	bx lr
	thumb_func_end sub_0205C710

	thumb_func_start sub_0205C718
sub_0205C718: ; 0x0205C718
	str r1, [r0, #4]
	bx lr
	thumb_func_end sub_0205C718

	thumb_func_start sub_0205C71C
sub_0205C71C: ; 0x0205C71C
	ldr r0, [r0, #4]
	bx lr
	thumb_func_end sub_0205C71C

	thumb_func_start sub_0205C720
sub_0205C720: ; 0x0205C720
	str r1, [r0, #0x1c]
	bx lr
	thumb_func_end sub_0205C720

	thumb_func_start sub_0205C724
sub_0205C724: ; 0x0205C724
	ldr r0, [r0, #0x1c]
	bx lr
	thumb_func_end sub_0205C724

	thumb_func_start sub_0205C728
sub_0205C728: ; 0x0205C728
	ldr r2, [r0]
	orr r1, r2
	str r1, [r0]
	bx lr
	thumb_func_end sub_0205C728

	thumb_func_start sub_0205C730
sub_0205C730: ; 0x0205C730
	ldr r2, [r0]
	mvn r1, r1
	and r1, r2
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205C730

	thumb_func_start sub_0205C73C
sub_0205C73C: ; 0x0205C73C
	ldr r0, [r0]
	and r0, r1
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205C73C

	thumb_func_start sub_0205C744
sub_0205C744: ; 0x0205C744
	ldr r0, [r0, #0x24]
	bx lr
	thumb_func_end sub_0205C744

	thumb_func_start sub_0205C748
sub_0205C748: ; 0x0205C748
	str r1, [r0, #0x24]
	bx lr
	thumb_func_end sub_0205C748

	thumb_func_start sub_0205C74C
sub_0205C74C: ; 0x0205C74C
	ldr r3, _0205C754 ; =sub_0205CA78
	mov r1, #0
	str r1, [r0, #0x24]
	bx r3
	.balign 4, 0
_0205C754: .word sub_0205CA78
	thumb_func_end sub_0205C74C

	thumb_func_start sub_0205C758
sub_0205C758: ; 0x0205C758
	ldr r3, [r0, #0x24]
	add r1, r3, r1
	str r1, [r0, #0x24]
	cmp r1, r2
	ble _0205C764
	str r2, [r0, #0x24]
_0205C764:
	ldr r0, [r0, #0x24]
	bx lr
	thumb_func_end sub_0205C758

	thumb_func_start sub_0205C768
sub_0205C768: ; 0x0205C768
	str r1, [r0, #0x28]
	bx lr
	thumb_func_end sub_0205C768

	thumb_func_start sub_0205C76C
sub_0205C76C: ; 0x0205C76C
	ldr r0, [r0, #0x28]
	bx lr
	thumb_func_end sub_0205C76C

	thumb_func_start sub_0205C770
sub_0205C770: ; 0x0205C770
	str r1, [r0, #0x2c]
	bx lr
	thumb_func_end sub_0205C770

	thumb_func_start sub_0205C774
sub_0205C774: ; 0x0205C774
	ldr r0, [r0, #0x2c]
	bx lr
	thumb_func_end sub_0205C774

	thumb_func_start sub_0205C778
sub_0205C778: ; 0x0205C778
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r2, #0
	bl sub_0205C768
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205C770
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0205C778

	thumb_func_start sub_0205C78C
sub_0205C78C: ; 0x0205C78C
	str r1, [r0, #0x34]
	bx lr
	thumb_func_end sub_0205C78C

	thumb_func_start sub_0205C790
sub_0205C790: ; 0x0205C790
	ldr r0, [r0, #0x34]
	bx lr
	thumb_func_end sub_0205C790

	thumb_func_start sub_0205C794
sub_0205C794: ; 0x0205C794
	str r1, [r0, #0x38]
	bx lr
	thumb_func_end sub_0205C794

	thumb_func_start sub_0205C798
sub_0205C798: ; 0x0205C798
	ldr r0, [r0, #0x38]
	bx lr
	thumb_func_end sub_0205C798

	thumb_func_start sub_0205C79C
sub_0205C79C: ; 0x0205C79C
	str r1, [r0, #8]
	bx lr
	thumb_func_end sub_0205C79C

	thumb_func_start sub_0205C7A0
sub_0205C7A0: ; 0x0205C7A0
	ldr r0, [r0, #8]
	bx lr
	thumb_func_end sub_0205C7A0

	thumb_func_start sub_0205C7A4
sub_0205C7A4: ; 0x0205C7A4
	ldr r0, [r0, #0xc]
	bx lr
	thumb_func_end sub_0205C7A4

	thumb_func_start sub_0205C7A8
sub_0205C7A8: ; 0x0205C7A8
	ldr r1, [r0, #0xc]
	add r2, r1, #1
	mov r1, #1
	and r1, r2
	str r1, [r0, #0xc]
	bx lr
	thumb_func_end sub_0205C7A8

	thumb_func_start sub_0205C7B4
sub_0205C7B4: ; 0x0205C7B4
	mov r1, #0
	str r1, [r0, #0xc]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205C7B4

	thumb_func_start sub_0205C7BC
sub_0205C7BC: ; 0x0205C7BC
	mov r1, #0
	strh r1, [r0]
	strh r1, [r0, #2]
	str r1, [r0, #4]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205C7BC

	thumb_func_start sub_0205C7C8
sub_0205C7C8: ; 0x0205C7C8
	cmp r0, #0
	beq _0205C7D6
	ldrh r0, [r0]
	cmp r0, #1
	bne _0205C7D6
	mov r0, #1
	bx lr
_0205C7D6:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205C7C8

	thumb_func_start sub_0205C7DC
sub_0205C7DC: ; 0x0205C7DC
	cmp r1, #1
	bne _0205C7E6
	mov r1, #1
	strh r1, [r0]
	bx lr
_0205C7E6:
	mov r1, #0
	strh r1, [r0]
	bx lr
	thumb_func_end sub_0205C7DC

	thumb_func_start sub_0205C7EC
sub_0205C7EC: ; 0x0205C7EC
	cmp r0, #0
	beq _0205C7F4
	ldr r0, [r0, #4]
	bx lr
_0205C7F4:
	mov r0, #0
	bx lr
	thumb_func_end sub_0205C7EC

	thumb_func_start sub_0205C7F8
sub_0205C7F8: ; 0x0205C7F8
	cmp r0, #0
	beq _0205C7FE
	str r1, [r0, #4]
_0205C7FE:
	bx lr
	thumb_func_end sub_0205C7F8

	thumb_func_start sub_0205C800
sub_0205C800: ; 0x0205C800
	push {r4, lr}
	add r4, r1, #0
	bl sub_0205C798
	add r1, r4, #0
	bl sub_0205C7F8
	pop {r4, pc}
	thumb_func_end sub_0205C800

	thumb_func_start sub_0205C810
sub_0205C810: ; 0x0205C810
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r6, r2, #0
	add r5, r0, #0
	bl sub_0205C6DC
	add r1, r4, #0
	add r2, r6, #0
	bl sub_0205FBC0
	add r0, r5, #0
	mov r1, #0
	bl sub_0205C6C8
	add r0, r5, #0
	mov r1, #0
	bl sub_0205C6D0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0205C810

	thumb_func_start sub_0205C838
sub_0205C838: ; 0x0205C838
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r1, #0
	bl sub_0205C6DC
	add r4, r0, #0
	add r1, sp, #0
	bl sub_0205F944
	add r0, r4, #0
	add r1, sp, #0
	str r5, [sp, #4]
	bl sub_0205F954
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end sub_0205C838

	thumb_func_start sub_0205C858
sub_0205C858: ; 0x0205C858
	push {r4, lr}
	add r4, r1, #0
	bl sub_0205C6DC
	cmp r4, #1
	bne _0205C86C
	mov r1, #0
	bl sub_0205F768
	pop {r4, pc}
_0205C86C:
	mov r1, #1
	bl sub_0205F768
	pop {r4, pc}
	thumb_func_end sub_0205C858

	thumb_func_start sub_0205C874
sub_0205C874: ; 0x0205C874
	push {r3, r4, r5, lr}
	add r5, r1, #0
	bl sub_0205C6DC
	add r4, r0, #0
	cmp r5, #1
	bne _0205C890
	mov r1, #0
	bl sub_0205F768
	add r0, r4, #0
	bl sub_02061070
	pop {r3, r4, r5, pc}
_0205C890:
	mov r1, #1
	bl sub_0205F768
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0205C874

	thumb_func_start sub_0205C898
sub_0205C898: ; 0x0205C898
	push {r3, lr}
	cmp r1, #0
	bne _0205C90A
	cmp r0, #0xe
	bhi _0205C978
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0205C8AE: ; jump table
	.short _0205C8CC - _0205C8AE - 2 ; case 0
	.short _0205C8D0 - _0205C8AE - 2 ; case 1
	.short _0205C8D4 - _0205C8AE - 2 ; case 2
	.short _0205C8F4 - _0205C8AE - 2 ; case 3
	.short _0205C8D8 - _0205C8AE - 2 ; case 4
	.short _0205C8DC - _0205C8AE - 2 ; case 5
	.short _0205C8FE - _0205C8AE - 2 ; case 6
	.short _0205C8E0 - _0205C8AE - 2 ; case 7
	.short _0205C8E4 - _0205C8AE - 2 ; case 8
	.short _0205C8E8 - _0205C8AE - 2 ; case 9
	.short _0205C8EC - _0205C8AE - 2 ; case 10
	.short _0205C8F0 - _0205C8AE - 2 ; case 11
	.short _0205C8F8 - _0205C8AE - 2 ; case 12
	.short _0205C902 - _0205C8AE - 2 ; case 13
	.short _0205C906 - _0205C8AE - 2 ; case 14
_0205C8CC:
	mov r0, #0
	pop {r3, pc}
_0205C8D0:
	mov r0, #0x15
	pop {r3, pc}
_0205C8D4:
	mov r0, #0xb2
	pop {r3, pc}
_0205C8D8:
	mov r0, #0xb0
	pop {r3, pc}
_0205C8DC:
	mov r0, #0xb4
	pop {r3, pc}
_0205C8E0:
	mov r0, #0xbc
	pop {r3, pc}
_0205C8E4:
	mov r0, #0xc4
	pop {r3, pc}
_0205C8E8:
	mov r0, #0xc6
	pop {r3, pc}
_0205C8EC:
	mov r0, #0xc8
	pop {r3, pc}
_0205C8F0:
	mov r0, #0xf8
	pop {r3, pc}
_0205C8F4:
	ldr r0, _0205C980 ; =0x00000102
	pop {r3, pc}
_0205C8F8:
	mov r0, #0x41
	lsl r0, r0, #2
	pop {r3, pc}
_0205C8FE:
	ldr r0, _0205C984 ; =0x00000197
	pop {r3, pc}
_0205C902:
	ldr r0, _0205C988 ; =0x000001A7
	pop {r3, pc}
_0205C906:
	ldr r0, _0205C98C ; =0x00000129
	pop {r3, pc}
_0205C90A:
	cmp r0, #0xe
	bhi _0205C978
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0205C91A: ; jump table
	.short _0205C938 - _0205C91A - 2 ; case 0
	.short _0205C93C - _0205C91A - 2 ; case 1
	.short _0205C940 - _0205C91A - 2 ; case 2
	.short _0205C960 - _0205C91A - 2 ; case 3
	.short _0205C944 - _0205C91A - 2 ; case 4
	.short _0205C948 - _0205C91A - 2 ; case 5
	.short _0205C968 - _0205C91A - 2 ; case 6
	.short _0205C94C - _0205C91A - 2 ; case 7
	.short _0205C950 - _0205C91A - 2 ; case 8
	.short _0205C954 - _0205C91A - 2 ; case 9
	.short _0205C958 - _0205C91A - 2 ; case 10
	.short _0205C95C - _0205C91A - 2 ; case 11
	.short _0205C964 - _0205C91A - 2 ; case 12
	.short _0205C96E - _0205C91A - 2 ; case 13
	.short _0205C974 - _0205C91A - 2 ; case 14
_0205C938:
	mov r0, #0x61
	pop {r3, pc}
_0205C93C:
	mov r0, #0x62
	pop {r3, pc}
_0205C940:
	mov r0, #0xb3
	pop {r3, pc}
_0205C944:
	mov r0, #0xb1
	pop {r3, pc}
_0205C948:
	mov r0, #0xb5
	pop {r3, pc}
_0205C94C:
	mov r0, #0xbd
	pop {r3, pc}
_0205C950:
	mov r0, #0xc5
	pop {r3, pc}
_0205C954:
	mov r0, #0xc7
	pop {r3, pc}
_0205C958:
	mov r0, #0xc9
	pop {r3, pc}
_0205C95C:
	mov r0, #0xf9
	pop {r3, pc}
_0205C960:
	ldr r0, _0205C990 ; =0x00000103
	pop {r3, pc}
_0205C964:
	ldr r0, _0205C994 ; =0x00000105
	pop {r3, pc}
_0205C968:
	mov r0, #0x66
	lsl r0, r0, #2
	pop {r3, pc}
_0205C96E:
	mov r0, #0x6a
	lsl r0, r0, #2
	pop {r3, pc}
_0205C974:
	ldr r0, _0205C998 ; =0x0000012A
	pop {r3, pc}
_0205C978:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_0205C980: .word 0x00000102
_0205C984: .word 0x00000197
_0205C988: .word 0x000001A7
_0205C98C: .word 0x00000129
_0205C990: .word 0x00000103
_0205C994: .word 0x00000105
_0205C998: .word 0x0000012A
	thumb_func_end sub_0205C898

	thumb_func_start sub_0205C99C
sub_0205C99C: ; 0x0205C99C
	push {r3, lr}
	cmp r0, #0xe
	bhi _0205CA12
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0205C9AE: ; jump table
	.short _0205C9CC - _0205C9AE - 2 ; case 0
	.short _0205C9D0 - _0205C9AE - 2 ; case 1
	.short _0205C9D4 - _0205C9AE - 2 ; case 2
	.short _0205C9F4 - _0205C9AE - 2 ; case 3
	.short _0205CA12 - _0205C9AE - 2 ; case 4
	.short _0205C9D8 - _0205C9AE - 2 ; case 5
	.short _0205CA00 - _0205C9AE - 2 ; case 6
	.short _0205C9DC - _0205C9AE - 2 ; case 7
	.short _0205C9E0 - _0205C9AE - 2 ; case 8
	.short _0205C9E4 - _0205C9AE - 2 ; case 9
	.short _0205C9E8 - _0205C9AE - 2 ; case 10
	.short _0205C9EE - _0205C9AE - 2 ; case 11
	.short _0205C9FA - _0205C9AE - 2 ; case 12
	.short _0205CA06 - _0205C9AE - 2 ; case 13
	.short _0205CA0C - _0205C9AE - 2 ; case 14
_0205C9CC:
	mov r0, #1
	pop {r3, pc}
_0205C9D0:
	mov r0, #2
	pop {r3, pc}
_0205C9D4:
	mov r0, #4
	pop {r3, pc}
_0205C9D8:
	mov r0, #0x10
	pop {r3, pc}
_0205C9DC:
	mov r0, #0x20
	pop {r3, pc}
_0205C9E0:
	mov r0, #0x40
	pop {r3, pc}
_0205C9E4:
	mov r0, #0x80
	pop {r3, pc}
_0205C9E8:
	mov r0, #1
	lsl r0, r0, #8
	pop {r3, pc}
_0205C9EE:
	mov r0, #2
	lsl r0, r0, #8
	pop {r3, pc}
_0205C9F4:
	mov r0, #1
	lsl r0, r0, #0xa
	pop {r3, pc}
_0205C9FA:
	mov r0, #2
	lsl r0, r0, #0xa
	pop {r3, pc}
_0205CA00:
	mov r0, #1
	lsl r0, r0, #0xc
	pop {r3, pc}
_0205CA06:
	mov r0, #2
	lsl r0, r0, #0xc
	pop {r3, pc}
_0205CA0C:
	mov r0, #1
	lsl r0, r0, #0xe
	pop {r3, pc}
_0205CA12:
	bl GF_AssertFail
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0205C99C

	thumb_func_start sub_0205CA1C
sub_0205CA1C: ; 0x0205CA1C
	ldr r0, [r0, #0x40]
	bx lr
	thumb_func_end sub_0205CA1C

	thumb_func_start sub_0205CA20
sub_0205CA20: ; 0x0205CA20
	push {r3, lr}
	cmp r1, #1
	bne _0205CA2E
	mov r1, #1
	bl sub_0205C728
	pop {r3, pc}
_0205CA2E:
	mov r1, #1
	bl sub_0205C730
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0205CA20

	thumb_func_start sub_0205CA38
sub_0205CA38: ; 0x0205CA38
	push {r3, lr}
	mov r1, #1
	bl sub_0205C73C
	cmp r0, #0
	beq _0205CA48
	mov r0, #1
	pop {r3, pc}
_0205CA48:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_0205CA38

	thumb_func_start sub_0205CA4C
sub_0205CA4C: ; 0x0205CA4C
	push {r3, lr}
	cmp r1, #1
	bne _0205CA5A
	mov r1, #2
	bl sub_0205C728
	pop {r3, pc}
_0205CA5A:
	mov r1, #2
	bl sub_0205C730
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0205CA4C

	thumb_func_start sub_0205CA64
sub_0205CA64: ; 0x0205CA64
	push {r3, lr}
	mov r1, #2
	bl sub_0205C73C
	cmp r0, #0
	beq _0205CA74
	mov r0, #1
	pop {r3, pc}
_0205CA74:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_0205CA64

	thumb_func_start sub_0205CA78
sub_0205CA78: ; 0x0205CA78
	push {r3, lr}
	cmp r1, #1
	bne _0205CA86
	mov r1, #4
	bl sub_0205C728
	pop {r3, pc}
_0205CA86:
	mov r1, #4
	bl sub_0205C730
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0205CA78

	thumb_func_start sub_0205CA90
sub_0205CA90: ; 0x0205CA90
	push {r3, lr}
	mov r1, #4
	bl sub_0205C73C
	cmp r0, #0
	beq _0205CAA0
	mov r0, #1
	pop {r3, pc}
_0205CAA0:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_0205CA90

	thumb_func_start sub_0205CAA4
sub_0205CAA4: ; 0x0205CAA4
	push {r3, lr}
	cmp r1, #1
	bne _0205CAB2
	mov r1, #8
	bl sub_0205C728
	pop {r3, pc}
_0205CAB2:
	mov r1, #8
	bl sub_0205C730
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0205CAA4

	thumb_func_start sub_0205CABC
sub_0205CABC: ; 0x0205CABC
	push {r3, lr}
	mov r1, #8
	bl sub_0205C73C
	cmp r0, #0
	beq _0205CACC
	mov r0, #1
	pop {r3, pc}
_0205CACC:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_0205CABC

	thumb_func_start sub_0205CAD0
sub_0205CAD0: ; 0x0205CAD0
	push {r3, lr}
	cmp r1, #1
	bne _0205CADE
	mov r1, #0x20
	bl sub_0205C728
	pop {r3, pc}
_0205CADE:
	mov r1, #0x20
	bl sub_0205C730
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0205CAD0

	thumb_func_start sub_0205CAE8
sub_0205CAE8: ; 0x0205CAE8
	ldr r3, _0205CAF0 ; =sub_0205C728
	mov r1, #0x40
	bx r3
	nop
_0205CAF0: .word sub_0205C728
	thumb_func_end sub_0205CAE8

	thumb_func_start sub_0205CAF4
sub_0205CAF4: ; 0x0205CAF4
	ldr r3, _0205CAFC ; =sub_0205C730
	mov r1, #0x40
	bx r3
	nop
_0205CAFC: .word sub_0205C730
	thumb_func_end sub_0205CAF4

	thumb_func_start sub_0205CB00
sub_0205CB00: ; 0x0205CB00
	push {r3, lr}
	mov r1, #0x40
	bl sub_0205C73C
	cmp r0, #0
	beq _0205CB10
	mov r0, #1
	pop {r3, pc}
_0205CB10:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_0205CB00

	thumb_func_start sub_0205CB14
sub_0205CB14: ; 0x0205CB14
	push {r3, lr}
	cmp r1, #1
	bne _0205CB22
	mov r1, #0x80
	bl sub_0205C728
	pop {r3, pc}
_0205CB22:
	mov r1, #0x80
	bl sub_0205C730
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0205CB14

	thumb_func_start sub_0205CB2C
sub_0205CB2C: ; 0x0205CB2C
	ldr r3, _0205CB34 ; =sub_0205C73C
	mov r1, #0x80
	bx r3
	nop
_0205CB34: .word sub_0205C73C
	thumb_func_end sub_0205CB2C

	thumb_func_start sub_0205CB38
sub_0205CB38: ; 0x0205CB38
	ldr r0, [r0, #0x38]
	ldrh r0, [r0, #2]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205CB38

	thumb_func_start sub_0205CB40
sub_0205CB40: ; 0x0205CB40
	ldr r0, [r0, #0x38]
	strh r1, [r0, #2]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205CB40
