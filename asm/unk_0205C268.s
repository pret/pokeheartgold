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

	thumb_func_start sub_0205CB48
sub_0205CB48: ; 0x0205CB48
	push {r3, r4, r5, r6, r7, lr}
	add r7, r1, #0
	mov r1, #0
	add r4, r2, #0
	mvn r1, r1
	add r5, r0, #0
	add r6, r3, #0
	cmp r4, r1
	bne _0205CB66
	add r2, sp, #8
	ldrh r2, [r2, #0x10]
	add r1, r6, #0
	bl sub_0205DDD4
	add r4, r0, #0
_0205CB66:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205CBEC
	cmp r0, #0
	beq _0205CBE2
	add r3, sp, #8
	ldrh r3, [r3, #0x10]
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl sub_0205CC4C
	add r0, r5, #0
	bl ov01_021F1B04
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205D004
	cmp r0, #1
	bne _0205CB9A
	add r0, r5, #0
	bl ov01_021F2F24
	pop {r3, r4, r5, r6, r7, pc}
_0205CB9A:
	add r0, r5, #0
	bl sub_0205C700
	cmp r0, #0
	bne _0205CBC4
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205D40C
	cmp r0, #0
	beq _0205CBB8
	add r0, r5, #0
	bl ov01_021F2F24
	b _0205CBC4
_0205CBB8:
	ldr r0, [sp, #0x1c]
	cmp r0, #1
	bne _0205CBC4
	add r0, r5, #0
	bl ov01_021F2EDC
_0205CBC4:
	add r0, sp, #8
	ldrh r0, [r0, #0x10]
	add r1, r7, #0
	add r2, r4, #0
	str r0, [sp]
	add r0, r5, #0
	add r3, r6, #0
	bl sub_0205D340
	add r0, r5, #0
	bl sub_0205CC74
	add r0, r5, #0
	bl sub_0205CC94
_0205CBE2:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0205CB48

	thumb_func_start sub_0205CBE4
sub_0205CBE4: ; 0x0205CBE4
	ldr r3, _0205CBE8 ; =sub_0205CBEC
	bx r3
	.balign 4, 0
_0205CBE8: .word sub_0205CBEC
	thumb_func_end sub_0205CBE4

	thumb_func_start sub_0205CBEC
sub_0205CBEC: ; 0x0205CBEC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0205C6DC
	add r6, r0, #0
	bl sub_02062108
	cmp r0, #1
	bne _0205CC04
	mov r0, #1
	pop {r4, r5, r6, pc}
_0205CC04:
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	bne _0205CC10
	mov r0, #0
	pop {r4, r5, r6, pc}
_0205CC10:
	add r0, r6, #0
	bl sub_0205F4D4
	bl sub_0205DE64
	cmp r0, #1
	bne _0205CC46
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	bl sub_0205DA34
	cmp r0, #0
	bne _0205CC30
	mov r0, #1
	pop {r4, r5, r6, pc}
_0205CC30:
	cmp r0, #0x20
	bne _0205CC42
	add r0, r5, #0
	bl sub_0205C700
	cmp r0, #2
	bne _0205CC42
	mov r0, #1
	pop {r4, r5, r6, pc}
_0205CC42:
	mov r0, #0
	pop {r4, r5, r6, pc}
_0205CC46:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0205CBEC

	thumb_func_start sub_0205CC4C
sub_0205CC4C: ; 0x0205CC4C
	push {r4, r5, r6, lr}
	add r6, r3, #0
	add r5, r0, #0
	add r0, r6, #0
	bl sub_0205DD9C
	add r4, r0, #0
	add r0, r6, #0
	bl sub_0205DDB8
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205C778
	add r0, r5, #0
	bl sub_0205CAF4
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0205CC4C

	thumb_func_start sub_0205CC74
sub_0205CC74: ; 0x0205CC74
	push {r4, lr}
	add r4, r0, #0
	bl sub_0205CB00
	cmp r0, #1
	bne _0205CC92
	add r0, r4, #0
	bl sub_0205C6CC
	cmp r0, #1
	bne _0205CC92
	add r0, r4, #0
	mov r1, #0
	bl sub_0205CA4C
_0205CC92:
	pop {r4, pc}
	thumb_func_end sub_0205CC74

	thumb_func_start sub_0205CC94
sub_0205CC94: ; 0x0205CC94
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	bl sub_0205C6CC
	cmp r0, #1
	bne _0205CD5E
	add r0, r6, #0
	bl sub_0205C6DC
	add r4, r0, #0
	bl sub_0205F504
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	add r0, r4, #0
	bl sub_0205F4D4
	bl sub_02062390
	add r1, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r1, r0
	bne _0205CCC8
	add r7, r5, #0
	b _0205CCD2
_0205CCC8:
	add r0, r4, #0
	bl sub_02060FA8
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
_0205CCD2:
	add r0, r5, #0
	bl sub_0205B984
	cmp r0, #1
	bne _0205CCE4
	mov r0, #SEQ_SE_DP_FOOT3_0>>6
	lsl r0, r0, #6
	bl PlaySE
_0205CCE4:
	add r0, r5, #0
	bl sub_0205B7A4
	cmp r0, #1
	bne _0205CCF4
	ldr r0, _0205CD60 ; =SEQ_SE_DP_FOOT3_1
	bl PlaySE
_0205CCF4:
	add r0, r5, #0
	bl sub_0205B798
	add r0, r5, #0
	bl sub_0205B8AC
	cmp r0, #1
	bne _0205CD0A
	ldr r0, _0205CD64 ; =SEQ_SE_DP_MARSH_WALK
	bl PlaySE
_0205CD0A:
	add r0, r4, #0
	bl sub_0205F4D4
	str r0, [sp]
	add r0, r6, #0
	bl sub_0205C700
	ldr r0, [sp]
	bl sub_0205DE64
	cmp r0, #0
	bne _0205CD56
	add r0, r5, #0
	bl sub_0205B6F4
	cmp r0, #1
	beq _0205CD36
	add r0, r7, #0
	bl sub_0205B6F4
	cmp r0, #1
	bne _0205CD3C
_0205CD36:
	ldr r0, _0205CD68 ; =SEQ_SE_DP_KUSA
	bl PlaySE
_0205CD3C:
	add r0, r5, #0
	bl sub_0205B6E8
	cmp r0, #1
	beq _0205CD50
	add r0, r7, #0
	bl sub_0205B6E8
	cmp r0, #1
	bne _0205CD56
_0205CD50:
	ldr r0, _0205CD6C ; =SEQ_SE_GS_KUSA2
	bl PlaySE
_0205CD56:
	add r0, r4, #0
	add r1, r6, #0
	bl sub_0205CD70
_0205CD5E:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0205CD60: .word SEQ_SE_DP_FOOT3_1
_0205CD64: .word SEQ_SE_DP_MARSH_WALK
_0205CD68: .word SEQ_SE_DP_KUSA
_0205CD6C: .word SEQ_SE_GS_KUSA2
	thumb_func_end sub_0205CC94

	thumb_func_start sub_0205CD70
sub_0205CD70: ; 0x0205CD70
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r5, r1, #0
	bl sub_0205F4D4
	bl sub_02062390
	str r0, [sp]
	add r0, r6, #0
	bl sub_0205F504
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	add r0, r6, #0
	bl sub_0205F504
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
	add r0, r7, #0
	bl sub_0205B6F4
	cmp r0, #0
	bne _0205CE58
	add r0, r7, #0
	bl sub_0205B984
	cmp r0, #1
	beq _0205CE58
	add r0, r7, #0
	bl sub_0205B7A4
	cmp r0, #1
	beq _0205CE58
	add r0, r7, #0
	bl sub_0205B6E8
	cmp r0, #0
	bne _0205CE58
	mov r1, #0
	ldr r0, [sp]
	mvn r1, r1
	cmp r0, r1
	beq _0205CDD2
	ldr r1, [sp]
	add r0, r6, #0
	bl sub_02060FE0
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
_0205CDD2:
	ldr r0, _0205CE5C ; =_020FCB98
	lsl r1, r4, #2
	ldrh r1, [r0, r1]
	ldr r0, _0205CE60 ; =0x00000876
	cmp r1, r0
	bne _0205CDE6
	add r0, r5, #0
	bl sub_0205C7B4
	b _0205CDFE
_0205CDE6:
	add r0, r5, #0
	bl sub_0205C6D4
	cmp r0, #0
	bne _0205CDF8
	add r0, r5, #0
	bl sub_0205C7B4
	b _0205CDFE
_0205CDF8:
	add r0, r5, #0
	bl sub_0205C7A8
_0205CDFE:
	add r0, r5, #0
	bl sub_0205C7A4
	cmp r0, #0
	bne _0205CE58
	add r0, r5, #0
	bl sub_0205C700
	cmp r0, #1
	beq _0205CE58
	cmp r0, #2
	beq _0205CE58
	cmp r4, #0x10
	bhs _0205CE52
	cmp r4, #0
	bne _0205CE2A
	add r0, r5, #0
	bl sub_0205DE98
	cmp r0, #1
	bne _0205CE2A
	mov r4, #1
_0205CE2A:
	ldr r0, _0205CE64 ; =_020FCB98 + 2
	lsl r1, r4, #2
	ldrh r0, [r0, r1]
	cmp r0, #1
	bne _0205CE40
	ldr r0, _0205CE5C ; =_020FCB98
	ldrh r4, [r0, r1]
	add r0, r4, #0
	bl sub_02006088
	b _0205CE4A
_0205CE40:
	ldr r0, _0205CE5C ; =_020FCB98
	ldrh r4, [r0, r1]
	add r0, r4, #0
	bl PlaySE
_0205CE4A:
	add r0, r4, #0
	bl sub_02005BA8
	pop {r3, r4, r5, r6, r7, pc}
_0205CE52:
	blo _0205CE58
	bl GF_AssertFail
_0205CE58:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0205CE5C: .word _020FCB98
_0205CE60: .word 0x00000876
_0205CE64: .word _020FCB98 + 2
	thumb_func_end sub_0205CD70

	thumb_func_start sub_0205CE68
sub_0205CE68: ; 0x0205CE68
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl sub_0205C6CC
	add r6, r0, #0
	add r0, r5, #0
	bl sub_0205C6D4
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0205C6DC
	add r7, r0, #0
	add r0, r5, #0
	mov r1, #0
	bl sub_0205C6D0
	mov r1, #0
	add r0, r5, #0
	mvn r1, r1
	bl sub_0205D01C
	cmp r0, #0
	beq _0205CEA6
	cmp r0, #2
	beq _0205CEA6
	add r0, r5, #0
	mov r1, #2
	bl sub_0205C6D0
	pop {r3, r4, r5, r6, r7, pc}
_0205CEA6:
	add r0, r7, #0
	bl sub_02062108
	cmp r0, #0
	bne _0205CEF2
	cmp r6, #0
	beq _0205CF40
	cmp r6, #1
	beq _0205CEBE
	cmp r6, #2
	beq _0205CEE8
	pop {r3, r4, r5, r6, r7, pc}
_0205CEBE:
	add r0, r7, #0
	bl sub_0205F4D4
	bl sub_0205DE64
	cmp r0, #1
	beq _0205CF40
	cmp r4, #0
	beq _0205CED4
	cmp r4, #3
	bne _0205CEDE
_0205CED4:
	add r0, r5, #0
	mov r1, #1
	bl sub_0205C6D0
	pop {r3, r4, r5, r6, r7, pc}
_0205CEDE:
	add r0, r5, #0
	mov r1, #2
	bl sub_0205C6D0
	pop {r3, r4, r5, r6, r7, pc}
_0205CEE8:
	add r0, r5, #0
	mov r1, #2
	bl sub_0205C6D0
	pop {r3, r4, r5, r6, r7, pc}
_0205CEF2:
	add r0, r7, #0
	bl sub_02062198
	cmp r0, #1
	bne _0205CF40
	cmp r6, #0
	beq _0205CF40
	cmp r6, #1
	beq _0205CF0A
	cmp r6, #2
	beq _0205CF26
	pop {r3, r4, r5, r6, r7, pc}
_0205CF0A:
	cmp r4, #0
	beq _0205CF40
	cmp r4, #3
	bne _0205CF1C
	add r0, r5, #0
	mov r1, #0
	bl sub_0205C6D0
	pop {r3, r4, r5, r6, r7, pc}
_0205CF1C:
	add r0, r5, #0
	mov r1, #3
	bl sub_0205C6D0
	pop {r3, r4, r5, r6, r7, pc}
_0205CF26:
	cmp r4, #0
	beq _0205CF40
	cmp r4, #3
	bne _0205CF38
	add r0, r5, #0
	mov r1, #0
	bl sub_0205C6D0
	pop {r3, r4, r5, r6, r7, pc}
_0205CF38:
	add r0, r5, #0
	mov r1, #3
	bl sub_0205C6D0
_0205CF40:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0205CE68

	thumb_func_start sub_0205CF44
sub_0205CF44: ; 0x0205CF44
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0
	bl sub_0205C6C8
	add r0, r4, #0
	mov r1, #0
	bl sub_0205C6D0
	add r0, r4, #0
	bl sub_0205C74C
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0205CF44

	thumb_func_start sub_0205CF60
sub_0205CF60: ; 0x0205CF60
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_0205C6CC
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0205C6D4
	cmp r4, #0
	bne _0205CF78
	mov r0, #1
	pop {r3, r4, r5, pc}
_0205CF78:
	cmp r4, #2
	bne _0205CF80
	mov r0, #1
	pop {r3, r4, r5, pc}
_0205CF80:
	cmp r4, #1
	bne _0205CFB6
	cmp r0, #0
	beq _0205CF8C
	cmp r0, #3
	bne _0205CF90
_0205CF8C:
	mov r0, #1
	pop {r3, r4, r5, pc}
_0205CF90:
	add r0, r5, #0
	bl sub_0205C6DC
	add r4, r0, #0
	bl sub_02062108
	cmp r0, #1
	bne _0205CFA4
	mov r0, #1
	pop {r3, r4, r5, pc}
_0205CFA4:
	add r0, r4, #0
	bl sub_0205F4D4
	bl sub_0205DE64
	cmp r0, #1
	bne _0205CFB6
	mov r0, #1
	pop {r3, r4, r5, pc}
_0205CFB6:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0205CF60

	thumb_func_start sub_0205CFBC
sub_0205CFBC: ; 0x0205CFBC
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r0, #0
	mov r1, #0
	bl sub_0205C6C8
	add r0, r4, #0
	mov r1, #0
	bl sub_0205C6D0
	add r0, r4, #0
	bl sub_0205C6DC
	add r4, r0, #0
	add r1, r5, #0
	bl sub_0205F290
	add r0, r4, #0
	mov r1, #0
	bl sub_0205F328
	add r0, r4, #0
	bl sub_02060F78
	add r0, r4, #0
	bl sub_020621F0
	add r0, r5, #0
	mov r1, #0
	bl sub_0206234C
	add r1, r0, #0
	add r0, r4, #0
	bl sub_0206214C
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0205CFBC

	thumb_func_start sub_0205D004
sub_0205D004: ; 0x0205D004
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0205D01C
	add r1, r0, #0
	add r0, r5, #0
	add r2, r4, #0
	bl sub_0205D07C
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0205D004

	thumb_func_start sub_0205D01C
sub_0205D01C: ; 0x0205D01C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	mov r4, #0
	bl sub_0205C6DC
	bl sub_0205F504
	add r7, r0, #0
	add r0, r5, #0
	add r1, r7, #0
	add r2, r6, #0
	bl sub_0205E078
	cmp r0, #1
	bne _0205D040
	mov r0, #2
	pop {r3, r4, r5, r6, r7, pc}
_0205D040:
	add r0, r5, #0
	bl sub_0205CA64
	cmp r0, #1
	bne _0205D04E
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_0205D04E:
	lsl r0, r7, #0x18
	ldr r5, _0205D074 ; =_020FCB88
	lsr r6, r0, #0x18
_0205D054:
	ldr r1, [r5]
	add r0, r6, #0
	blx r1
	cmp r0, #1
	bne _0205D066
	ldr r0, _0205D078 ; =_020FCB88 + 4
	lsl r1, r4, #3
	ldr r0, [r0, r1]
	pop {r3, r4, r5, r6, r7, pc}
_0205D066:
	add r5, #8
	ldr r0, [r5]
	add r4, r4, #1
	cmp r0, #0
	bne _0205D054
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0205D074: .word _020FCB88
_0205D078: .word _020FCB88 + 4
	thumb_func_end sub_0205D01C

	thumb_func_start sub_0205D07C
sub_0205D07C: ; 0x0205D07C
	push {r3, lr}
	add r3, r1, #0
	add r1, r2, #0
	ldr r2, _0205D098 ; =_020FCB7C
	lsl r3, r3, #2
	ldr r2, [r2, r3]
	blx r2
	cmp r0, #1
	bne _0205D092
	mov r0, #1
	pop {r3, pc}
_0205D092:
	mov r0, #0
	pop {r3, pc}
	nop
_0205D098: .word _020FCB7C
	thumb_func_end sub_0205D07C

	thumb_func_start sub_0205D09C
sub_0205D09C: ; 0x0205D09C
	push {r3, lr}
	bl sub_0205D1FC
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0205D09C

	thumb_func_start sub_0205D0A8
sub_0205D0A8: ; 0x0205D0A8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl sub_0205C6DC
	add r4, r0, #0
	bl sub_0205F2B8
	add r6, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	bl sub_0205D240
	str r0, [sp]
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl sub_0205DA34
	add r7, r0, #0
	add r0, r5, #0
	mov r1, #1
	bl sub_0205CA20
	cmp r7, #0
	beq _0205D10A
	add r0, r4, #0
	bl sub_0205F52C
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #1
	bl sub_0205CA4C
	add r0, r5, #0
	mov r1, #0
	bl sub_0205C6C8
	add r0, r4, #0
	bl sub_0206D494
	cmp r0, #0
	bne _0205D106
	add r0, r5, #0
	bl sub_0205D1FC
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0205D106:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0205D10A:
	ldr r1, [sp]
	add r0, r5, #0
	bl sub_0205D2A0
	cmp r0, #0
	bne _0205D170
	add r0, r5, #0
	bl sub_0205D1FC
	add r0, r6, #0
	bl sub_020611F4
	add r6, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl sub_0205DA34
	cmp r0, #0
	beq _0205D136
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0205D136:
	mov r1, #6
	add r0, r4, #0
	lsl r1, r1, #6
	bl sub_0205F20C
	add r0, r6, #0
	mov r1, #8
	bl sub_0206234C
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205DA1C
	add r0, r5, #0
	mov r1, #1
	bl sub_0205CA4C
	add r0, r5, #0
	mov r1, #1
	bl sub_0205CA20
	mov r1, #0
	mvn r1, r1
	add r0, r5, #0
	add r2, r1, #0
	bl sub_0205C778
	b _0205D182
_0205D170:
	mov r1, #6
	add r0, r4, #0
	lsl r1, r1, #6
	bl sub_0205F20C
	add r0, r5, #0
	add r1, r6, #0
	bl sub_0205D2D0
_0205D182:
	add r0, r5, #0
	mov r1, #1
	bl sub_0205C6C8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0205D0A8

	thumb_func_start sub_0205D190
sub_0205D190: ; 0x0205D190
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_0205C6DC
	add r4, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #1
	bl sub_0205DA34
	cmp r0, #0
	bne _0205D1CE
	mov r0, #1
	mov r1, #0x14
	bl sub_0206234C
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205DA1C
	add r0, r5, #0
	mov r1, #1
	bl sub_0205C6C8
	add r0, r5, #0
	mov r1, #3
	bl sub_0205C748
	mov r0, #1
	pop {r3, r4, r5, pc}
_0205D1CE:
	mov r0, #1
	add r1, r0, #0
	bl sub_0206234C
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205DA1C
	add r0, r5, #0
	bl sub_0205C74C
	add r0, r5, #0
	mov r1, #0
	bl sub_0205C6C8
	add r0, r5, #0
	mov r1, #0
	bl sub_0205CA78
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0205D190

	thumb_func_start sub_0205D1FC
sub_0205D1FC: ; 0x0205D1FC
	push {r4, lr}
	add r4, r0, #0
	bl sub_0205CA38
	cmp r0, #1
	bne _0205D23E
	add r0, r4, #0
	bl sub_0205C6DC
	mov r1, #6
	lsl r1, r1, #6
	bl sub_0205F214
	add r0, r4, #0
	bl sub_0205CB2C
	cmp r0, #0
	bne _0205D226
	add r0, r4, #0
	bl sub_0205C74C
_0205D226:
	add r0, r4, #0
	mov r1, #0
	bl sub_0205CA20
	add r0, r4, #0
	mov r1, #0
	bl sub_0205CB14
	add r0, r4, #0
	mov r1, #0
	bl sub_0205CAD0
_0205D23E:
	pop {r4, pc}
	thumb_func_end sub_0205D1FC

	thumb_func_start sub_0205D240
sub_0205D240: ; 0x0205D240
	push {r4, r5, r6, lr}
	sub sp, #0x18
	add r5, r1, #0
	bl sub_0205C6DC
	add r4, r0, #0
	bl sub_0205F52C
	add r6, r0, #0
	add r0, r4, #0
	add r1, sp, #0xc
	bl sub_0205F944
	add r4, sp, #0xc
	add r3, sp, #0
	ldmia r4!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldr r0, [r4]
	add r1, r2, #0
	mov r2, #1
	str r0, [r3]
	add r0, r5, #0
	lsl r2, r2, #0xe
	bl sub_02061190
	add r0, r6, #0
	add r1, sp, #0
	bl sub_0206121C
	cmp r0, #0
	beq _0205D288
	ldr r1, [sp, #4]
	ldr r0, [sp, #0x10]
	cmp r0, r1
	bne _0205D28E
_0205D288:
	add sp, #0x18
	mov r0, #0
	pop {r4, r5, r6, pc}
_0205D28E:
	cmp r0, r1
	ble _0205D298
	add sp, #0x18
	mov r0, #2
	pop {r4, r5, r6, pc}
_0205D298:
	mov r0, #1
	add sp, #0x18
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0205D240

	thumb_func_start sub_0205D2A0
sub_0205D2A0: ; 0x0205D2A0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0205C744
	add r1, r0, #0
	cmp r4, #1
	bne _0205D2B8
	sub r1, r1, #1
	bpl _0205D2C4
	mov r0, #0
	pop {r3, r4, r5, pc}
_0205D2B8:
	cmp r4, #2
	bne _0205D2C4
	add r1, r1, #1
	cmp r1, #3
	ble _0205D2C4
	mov r1, #3
_0205D2C4:
	add r0, r5, #0
	bl sub_0205C748
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0205D2A0

	thumb_func_start sub_0205D2D0
sub_0205D2D0: ; 0x0205D2D0
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r7, r1, #0
	bl sub_0205C6DC
	add r4, r0, #0
	add r0, r6, #0
	mov r5, #0x10
	bl sub_0205C744
	cmp r0, #1
	beq _0205D2F2
	cmp r0, #2
	beq _0205D2F6
	cmp r0, #3
	beq _0205D2FA
	b _0205D2FC
_0205D2F2:
	mov r5, #0x50
	b _0205D2FC
_0205D2F6:
	mov r5, #0x14
	b _0205D2FC
_0205D2FA:
	mov r5, #0x14
_0205D2FC:
	add r0, r7, #0
	add r1, r5, #0
	bl sub_0206234C
	add r7, r0, #0
	add r0, r6, #0
	add r1, r4, #0
	add r2, r7, #0
	bl sub_0205DA1C
	add r0, r4, #0
	bl sub_0205F52C
	add r5, r0, #0
	bl sub_02069F88
	cmp r0, #0
	beq _0205D33C
	add r0, r4, #0
	bl sub_0205F8FC
	add r6, r0, #0
	add r0, r4, #0
	bl sub_0205F90C
	add r5, #0xe4
	add r2, r0, #0
	add r0, r7, #0
	add r1, r6, #0
	add r3, r5, #0
	bl ov01_02205990
_0205D33C:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0205D2D0

	thumb_func_start sub_0205D340
sub_0205D340: ; 0x0205D340
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r6, r0, #0
	add r7, r1, #0
	str r2, [sp, #8]
	add r4, r3, #0
	bl sub_0205C700
	add r5, r0, #0
	add r0, r6, #0
	bl sub_0205C6DC
	add r1, r0, #0
	cmp r5, #3
	bhi _0205D39E
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0205D36A: ; jump table
	.short _0205D372 - _0205D36A - 2 ; case 0
	.short _0205D388 - _0205D36A - 2 ; case 1
	.short _0205D372 - _0205D36A - 2 ; case 2
	.short _0205D372 - _0205D36A - 2 ; case 3
_0205D372:
	str r4, [sp]
	add r0, sp, #0x10
	ldrh r0, [r0, #0x10]
	ldr r3, [sp, #8]
	add r2, r7, #0
	str r0, [sp, #4]
	add r0, r6, #0
	bl sub_0205D3A8
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_0205D388:
	str r4, [sp]
	add r0, sp, #0x10
	ldrh r0, [r0, #0x10]
	ldr r3, [sp, #8]
	add r2, r7, #0
	str r0, [sp, #4]
	add r0, r6, #0
	bl sub_0205D640
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_0205D39E:
	bl GF_AssertFail
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0205D340

	thumb_func_start sub_0205D3A8
sub_0205D3A8: ; 0x0205D3A8
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r6, r3, #0
	add r4, r1, #0
	add r1, r6, #0
	add r5, r0, #0
	bl sub_0205D40C
	cmp r0, #0
	beq _0205D3C8
	cmp r0, #1
	beq _0205D3DE
	cmp r0, #2
	beq _0205D3F4
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_0205D3C8:
	add r3, sp, #8
	ldrh r0, [r3, #0x14]
	add r1, r4, #0
	add r2, r6, #0
	str r0, [sp]
	ldrh r3, [r3, #0x10]
	add r0, r5, #0
	bl sub_0205D494
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_0205D3DE:
	add r3, sp, #8
	ldrh r0, [r3, #0x14]
	add r1, r4, #0
	add r2, r6, #0
	str r0, [sp]
	ldrh r3, [r3, #0x10]
	add r0, r5, #0
	bl sub_0205D4B4
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_0205D3F4:
	add r3, sp, #8
	ldrh r0, [r3, #0x14]
	add r1, r4, #0
	add r2, r6, #0
	str r0, [sp]
	ldrh r3, [r3, #0x10]
	add r0, r5, #0
	bl sub_0205D610
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0205D3A8

	thumb_func_start sub_0205D40C
sub_0205D40C: ; 0x0205D40C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_0205D450
	add r4, r0, #0
	bl sub_0205D428
	add r1, r0, #0
	add r0, r5, #0
	bl sub_0205C6C8
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0205D40C

	thumb_func_start sub_0205D428
sub_0205D428: ; 0x0205D428
	push {r3, lr}
	cmp r0, #0
	beq _0205D438
	cmp r0, #1
	beq _0205D43C
	cmp r0, #2
	beq _0205D440
	b _0205D444
_0205D438:
	mov r0, #0
	pop {r3, pc}
_0205D43C:
	mov r0, #1
	pop {r3, pc}
_0205D440:
	mov r0, #2
	pop {r3, pc}
_0205D444:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_0205D428

	thumb_func_start sub_0205D44C
sub_0205D44C: ; 0x0205D44C
	add r0, r2, #0
	bx lr
	thumb_func_end sub_0205D44C

	thumb_func_start sub_0205D450
sub_0205D450: ; 0x0205D450
	push {r3, r4, r5, lr}
	add r4, r1, #0
	mov r1, #0
	mvn r1, r1
	add r5, r0, #0
	cmp r4, r1
	bne _0205D468
	mov r1, #0
	bl sub_0205C6C8
	mov r0, #0
	pop {r3, r4, r5, pc}
_0205D468:
	bl PlayerAvatar_GetFacingDirection
	cmp r0, r4
	beq _0205D486
	add r0, r5, #0
	bl sub_0205C6CC
	cmp r0, #1
	beq _0205D486
	add r0, r5, #0
	mov r1, #2
	bl sub_0205C6C8
	mov r0, #2
	pop {r3, r4, r5, pc}
_0205D486:
	add r0, r5, #0
	mov r1, #1
	bl sub_0205C6C8
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0205D450

	thumb_func_start sub_0205D494
sub_0205D494: ; 0x0205D494
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	bl sub_0205F2A8
	mov r1, #0
	bl sub_0206234C
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205DA1C
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0205D494

	thumb_func_start sub_0205D4B4
sub_0205D4B4: ; 0x0205D4B4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	mov r3, #0
	add r6, r0, #0
	add r5, r1, #0
	add r7, r2, #0
	str r3, [sp, #4]
	bl sub_0205DA34
	add r4, r0, #0
	add r0, r6, #0
	bl sub_0205C700
	cmp r0, #2
	beq _0205D588
	mov r0, #4
	tst r0, r4
	beq _0205D4DE
	mov r0, #0x38
	str r0, [sp]
	b _0205D5CE
_0205D4DE:
	cmp r4, #0
	beq _0205D544
	mov r0, #0x1c
	str r0, [sp]
	mov r0, #8
	tst r0, r4
	bne _0205D536
	add r0, r5, #0
	bl sub_0205F52C
	mov r1, #7
	str r0, [sp, #8]
	bl sub_02068F68
	cmp r0, #0
	beq _0205D52E
	add r0, r5, #0
	bl sub_0205F914
	add r4, r0, #0
	add r0, r7, #0
	bl sub_02060F0C
	str r0, [sp, #0xc]
	add r0, r5, #0
	bl sub_0205F934
	str r0, [sp, #0x10]
	add r0, r7, #0
	bl sub_02060F18
	ldr r1, [sp, #0xc]
	add r2, r0, #0
	ldr r3, [sp, #0x10]
	ldr r0, [sp, #8]
	add r1, r4, r1
	add r2, r3, r2
	bl ov04_022566EC
	b _0205D536
_0205D52E:
	mov r0, #SEQ_SE_DP_WALL_HIT>>8
	lsl r0, r0, #8
	bl PlaySE
_0205D536:
	add r0, r5, #0
	add r1, r7, #0
	bl sub_0205F2B0
	mov r0, #1
	str r0, [sp, #4]
	b _0205D5CE
_0205D544:
	add r0, r6, #0
	mov r4, #0xc
	bl sub_0205C798
	bl sub_0205C7C8
	cmp r0, #1
	bne _0205D564
	add r1, sp, #0x18
	ldrh r1, [r1, #0x10]
	add r0, r6, #0
	bl sub_0205DE88
	cmp r0, #1
	bne _0205D564
	mov r4, #0x58
_0205D564:
	add r0, r5, #0
	bl sub_0205F504
	add r1, r0, #0
	lsl r1, r1, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	add r2, r4, #0
	bl sub_0205D44C
	str r0, [sp]
	add r0, r6, #0
	bl sub_0205E048
	add r0, r6, #0
	bl sub_0205CAE8
	b _0205D5CE
_0205D588:
	cmp r4, #0
	beq _0205D590
	cmp r4, #0x20
	bne _0205D5B4
_0205D590:
	add r0, r5, #0
	bl sub_0205F504
	add r1, r0, #0
	lsl r1, r1, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	mov r2, #0x10
	bl sub_0205D44C
	str r0, [sp]
	add r0, r6, #0
	bl sub_0205E048
	add r0, r6, #0
	bl sub_0205CAE8
	b _0205D5CE
_0205D5B4:
	mov r0, #0x1c
	str r0, [sp]
	mov r0, #8
	tst r0, r4
	bne _0205D5C6
	mov r0, #SEQ_SE_DP_WALL_HIT>>8
	lsl r0, r0, #8
	bl PlaySE
_0205D5C6:
	add r0, r5, #0
	add r1, r7, #0
	bl sub_0205F2B0
_0205D5CE:
	ldr r1, [sp]
	add r0, r7, #0
	bl sub_0206234C
	add r7, r0, #0
	add r0, r6, #0
	add r1, r5, #0
	add r2, r7, #0
	bl sub_0205DA1C
	ldr r0, [sp, #4]
	cmp r0, #0
	bne _0205D60C
	add r0, r5, #0
	bl sub_0205F52C
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0205F8FC
	add r6, r0, #0
	add r0, r5, #0
	bl sub_0205F90C
	add r4, #0xe4
	add r2, r0, #0
	add r0, r7, #0
	add r1, r6, #0
	add r3, r4, #0
	bl ov01_02205990
_0205D60C:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end sub_0205D4B4

	thumb_func_start sub_0205D610
sub_0205D610: ; 0x0205D610
	push {r4, r5, r6, lr}
	add r6, r2, #0
	add r5, r0, #0
	add r4, r1, #0
	add r0, r6, #0
	mov r1, #0x28
	bl sub_0206234C
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205DA1C
	add r0, r4, #0
	add r1, r6, #0
	bl sub_0205F2B0
	add r0, r5, #0
	bl sub_0205C7B4
	add r0, r5, #0
	bl sub_0205C7A8
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0205D610

	thumb_func_start sub_0205D640
sub_0205D640: ; 0x0205D640
	push {r3, r4, r5, lr}
	sub sp, #8
	add r4, sp, #8
	ldrh r5, [r4, #0x10]
	str r5, [sp]
	ldrh r4, [r4, #0x14]
	str r4, [sp, #4]
	bl sub_0205D6E8
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0205D640

	thumb_func_start sub_0205D658
sub_0205D658: ; 0x0205D658
	push {r3, r4, r5, lr}
	add r5, r1, #0
	mov r4, #0x4c
	bl sub_0205C744
	cmp r0, #1
	beq _0205D670
	cmp r0, #2
	beq _0205D674
	cmp r0, #3
	beq _0205D678
	b _0205D67A
_0205D670:
	mov r4, #0x10
	b _0205D67A
_0205D674:
	mov r4, #0x50
	b _0205D67A
_0205D678:
	mov r4, #0x14
_0205D67A:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0206234C
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0205D658

	thumb_func_start sub_0205D684
sub_0205D684: ; 0x0205D684
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r1, #1
	mov r2, #3
	bl sub_0205C758
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0205CA90
	cmp r0, #0
	bne _0205D6A8
	cmp r4, #2
	blt _0205D6A8
	add r0, r5, #0
	mov r1, #1
	bl sub_0205CA78
_0205D6A8:
	cmp r4, #3
	bne _0205D6B0
	mov r0, #1
	pop {r3, r4, r5, pc}
_0205D6B0:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0205D684

	thumb_func_start sub_0205D6B4
sub_0205D6B4: ; 0x0205D6B4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r6, #1
	bl sub_0205C744
	sub r4, r0, #1
	bpl _0205D6C6
	mov r4, #0
	add r6, r4, #0
_0205D6C6:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205C748
	add r0, r5, #0
	bl sub_0205CA90
	cmp r0, #1
	bne _0205D6E4
	cmp r4, #0
	bne _0205D6E4
	add r0, r5, #0
	mov r1, #0
	bl sub_0205CA78
_0205D6E4:
	add r0, r6, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0205D6B4

	thumb_func_start sub_0205D6E8
sub_0205D6E8: ; 0x0205D6E8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r7, r1, #0
	add r1, r3, #0
	add r6, r0, #0
	str r3, [sp, #4]
	ldr r5, [sp, #0x20]
	ldr r4, [sp, #0x24]
	bl sub_0205D75C
	cmp r0, #3
	bhi _0205D758
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0205D70C: ; jump table
	.short _0205D714 - _0205D70C - 2 ; case 0
	.short _0205D726 - _0205D70C - 2 ; case 1
	.short _0205D738 - _0205D70C - 2 ; case 2
	.short _0205D74A - _0205D70C - 2 ; case 3
_0205D714:
	ldr r2, [sp, #4]
	add r0, r6, #0
	add r1, r7, #0
	add r3, r5, #0
	str r4, [sp]
	bl sub_0205D818
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_0205D726:
	ldr r2, [sp, #4]
	add r0, r6, #0
	add r1, r7, #0
	add r3, r5, #0
	str r4, [sp]
	bl sub_0205D83C
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_0205D738:
	ldr r2, [sp, #4]
	add r0, r6, #0
	add r1, r7, #0
	add r3, r5, #0
	str r4, [sp]
	bl sub_0205D948
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_0205D74A:
	ldr r2, [sp, #4]
	add r0, r6, #0
	add r1, r7, #0
	add r3, r5, #0
	str r4, [sp]
	bl sub_0205D978
_0205D758:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0205D6E8

	thumb_func_start sub_0205D75C
sub_0205D75C: ; 0x0205D75C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_0205D7AC
	add r4, r0, #0
	bl sub_0205D778
	add r1, r0, #0
	add r0, r5, #0
	bl sub_0205C6C8
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0205D75C

	thumb_func_start sub_0205D778
sub_0205D778: ; 0x0205D778
	push {r3, lr}
	cmp r0, #3
	bhi _0205D7A2
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0205D78A: ; jump table
	.short _0205D792 - _0205D78A - 2 ; case 0
	.short _0205D796 - _0205D78A - 2 ; case 1
	.short _0205D79A - _0205D78A - 2 ; case 2
	.short _0205D79E - _0205D78A - 2 ; case 3
_0205D792:
	mov r0, #0
	pop {r3, pc}
_0205D796:
	mov r0, #1
	pop {r3, pc}
_0205D79A:
	mov r0, #2
	pop {r3, pc}
_0205D79E:
	mov r0, #1
	pop {r3, pc}
_0205D7A2:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0205D778

	thumb_func_start sub_0205D7AC
sub_0205D7AC: ; 0x0205D7AC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0205C744
	add r6, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	bne _0205D7DC
	cmp r6, #2
	bge _0205D7D0
	add r0, r5, #0
	mov r1, #0
	bl sub_0205C6C8
	mov r0, #0
	pop {r4, r5, r6, pc}
_0205D7D0:
	add r0, r5, #0
	mov r1, #1
	bl sub_0205C6C8
	mov r0, #3
	pop {r4, r5, r6, pc}
_0205D7DC:
	add r0, r5, #0
	bl PlayerAvatar_GetFacingDirection
	cmp r0, r4
	beq _0205D80C
	add r0, r5, #0
	bl sub_0205C6CC
	cmp r0, #1
	beq _0205D80C
	cmp r6, #2
	bge _0205D800
	add r0, r5, #0
	mov r1, #2
	bl sub_0205C6C8
	mov r0, #2
	pop {r4, r5, r6, pc}
_0205D800:
	add r0, r5, #0
	mov r1, #1
	bl sub_0205C6C8
	mov r0, #3
	pop {r4, r5, r6, pc}
_0205D80C:
	add r0, r5, #0
	mov r1, #1
	bl sub_0205C6C8
	mov r0, #1
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0205D7AC

	thumb_func_start sub_0205D818
sub_0205D818: ; 0x0205D818
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	bl sub_0205F2A8
	mov r1, #0
	bl sub_0206234C
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205DA1C
	add r0, r5, #0
	bl sub_0205C74C
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0205D818

	thumb_func_start sub_0205D83C
sub_0205D83C: ; 0x0205D83C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r7, r1, #0
	add r6, r2, #0
	bl sub_0205DA34
	add r4, r0, #0
	mov r0, #4
	tst r0, r4
	beq _0205D86E
	add r0, r6, #0
	mov r1, #0x38
	bl sub_0206234C
	str r0, [sp]
	add r0, r5, #0
	bl sub_0205D684
	add r0, r5, #0
	bl sub_0205E048
	add r0, r5, #0
	bl sub_0205CAE8
	b _0205D93A
_0205D86E:
	mov r0, #0x10
	tst r0, r4
	beq _0205D8C0
	add r0, r5, #0
	bl sub_0205C744
	cmp r0, #3
	blt _0205D898
	add r0, r5, #0
	add r1, r6, #0
	bl sub_0205D658
	str r0, [sp]
	add r0, r5, #0
	bl sub_0205CAE8
	add r0, r5, #0
	mov r1, #1
	bl sub_0205CA20
	b _0205D93A
_0205D898:
	add r0, r6, #0
	mov r1, #0x1c
	bl sub_0206234C
	str r0, [sp]
	mov r0, #8
	tst r0, r4
	bne _0205D8B0
	mov r0, #SEQ_SE_DP_WALL_HIT>>8
	lsl r0, r0, #8
	bl PlaySE
_0205D8B0:
	add r0, r7, #0
	add r1, r6, #0
	bl sub_0205F2B0
	add r0, r5, #0
	bl sub_0205C74C
	b _0205D93A
_0205D8C0:
	mov r0, #0x40
	tst r0, r4
	beq _0205D8F2
	add r0, r7, #0
	bl sub_0205F2B8
	add r4, r0, #0
	mov r1, #0
	bl sub_0206234C
	str r0, [sp]
	add r0, r7, #0
	add r1, r4, #0
	bl sub_0205F2B0
	add r0, r5, #0
	bl sub_0205C74C
	mov r1, #0
	mvn r1, r1
	add r0, r5, #0
	add r2, r1, #0
	bl sub_0205C778
	b _0205D93A
_0205D8F2:
	cmp r4, #0
	beq _0205D91E
	add r0, r6, #0
	mov r1, #0x1c
	bl sub_0206234C
	str r0, [sp]
	mov r0, #8
	tst r0, r4
	bne _0205D90E
	mov r0, #SEQ_SE_DP_WALL_HIT>>8
	lsl r0, r0, #8
	bl PlaySE
_0205D90E:
	add r0, r7, #0
	add r1, r6, #0
	bl sub_0205F2B0
	add r0, r5, #0
	bl sub_0205C74C
	b _0205D93A
_0205D91E:
	add r0, r5, #0
	add r1, r6, #0
	bl sub_0205D658
	str r0, [sp]
	add r0, r5, #0
	bl sub_0205D684
	add r0, r5, #0
	bl sub_0205E048
	add r0, r5, #0
	bl sub_0205CAE8
_0205D93A:
	ldr r2, [sp]
	add r0, r5, #0
	add r1, r7, #0
	bl sub_0205DA1C
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0205D83C

	thumb_func_start sub_0205D948
sub_0205D948: ; 0x0205D948
	push {r4, r5, r6, lr}
	add r6, r2, #0
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0205C74C
	add r0, r6, #0
	mov r1, #0x28
	bl sub_0206234C
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205DA1C
	add r0, r4, #0
	add r1, r6, #0
	bl sub_0205F2B0
	add r0, r5, #0
	bl sub_0205C74C
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0205D948

	thumb_func_start sub_0205D978
sub_0205D978: ; 0x0205D978
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r7, r1, #0
	bl sub_0205D6B4
	str r0, [sp]
	add r0, r5, #0
	bl sub_0205C670
	add r6, r0, #0
	add r0, r5, #0
	add r1, r7, #0
	add r2, r6, #0
	bl sub_0205DA34
	add r4, r0, #0
	mov r0, #4
	tst r0, r4
	beq _0205D9AC
	add r0, r6, #0
	mov r1, #0x38
	bl sub_0206234C
	str r0, [sp, #4]
	b _0205D9FE
_0205D9AC:
	mov r0, #0x40
	tst r0, r4
	beq _0205D9C4
	add r0, r6, #0
	mov r1, #0
	bl sub_0206234C
	str r0, [sp, #4]
	add r0, r5, #0
	bl sub_0205C74C
	b _0205D9FE
_0205D9C4:
	cmp r4, #0
	beq _0205D9F4
	mov r0, #0
	str r0, [sp]
	add r0, r6, #0
	mov r1, #0x1c
	bl sub_0206234C
	str r0, [sp, #4]
	mov r0, #8
	tst r0, r4
	bne _0205D9E4
	mov r0, #SEQ_SE_DP_WALL_HIT>>8
	lsl r0, r0, #8
	bl PlaySE
_0205D9E4:
	add r0, r7, #0
	add r1, r6, #0
	bl sub_0205F2B0
	add r0, r5, #0
	bl sub_0205C74C
	b _0205D9FE
_0205D9F4:
	add r0, r5, #0
	add r1, r6, #0
	bl sub_0205D658
	str r0, [sp, #4]
_0205D9FE:
	ldr r0, [sp]
	cmp r0, #0
	bne _0205DA0C
	add r0, r5, #0
	mov r1, #0
	bl sub_0205CA78
_0205DA0C:
	ldr r2, [sp, #4]
	add r0, r5, #0
	add r1, r7, #0
	bl sub_0205DA1C
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0205D978

	thumb_func_start sub_0205DA1C
sub_0205DA1C: ; 0x0205DA1C
	push {r3, r4, r5, lr}
	add r4, r2, #0
	add r5, r1, #0
	add r1, r4, #0
	bl sub_0205C79C
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0206214C
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0205DA1C

	thumb_func_start sub_0205DA34
sub_0205DA34: ; 0x0205DA34
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	add r7, r2, #0
	mov r4, #0
	bl sub_0205DAA8
	mov r1, #0xa
	str r0, [sp]
	tst r0, r1
	beq _0205DA60
	mov r0, #1
	orr r4, r0
	add r0, r5, #0
	add r1, r6, #0
	add r2, r7, #0
	bl sub_0205DBF4
	cmp r0, #0
	beq _0205DA60
	mov r0, #8
	orr r4, r0
_0205DA60:
	ldr r0, [sp]
	mov r1, #4
	tst r0, r1
	beq _0205DA6C
	mov r0, #2
	orr r4, r0
_0205DA6C:
	add r0, r5, #0
	add r1, r6, #0
	add r2, r7, #0
	bl sub_0205DB68
	cmp r0, #0
	beq _0205DA7E
	mov r0, #4
	orr r4, r0
_0205DA7E:
	add r0, r5, #0
	add r1, r6, #0
	add r2, r7, #0
	bl sub_0205DCA0
	cmp r0, #1
	bne _0205DA90
	mov r0, #0x20
	orr r4, r0
_0205DA90:
	add r0, r5, #0
	add r1, r6, #0
	add r2, r7, #0
	bl sub_0205DCFC
	cmp r0, #1
	bne _0205DAA2
	mov r0, #1
	orr r4, r0
_0205DAA2:
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0205DA34

	thumb_func_start sub_0205DAA8
sub_0205DAA8: ; 0x0205DAA8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r5, r1, #0
	str r2, [sp, #4]
	add r0, r5, #0
	bl sub_0205F914
	add r7, r0, #0
	ldr r0, [sp, #4]
	bl sub_02060F0C
	str r0, [sp, #0x14]
	add r0, r5, #0
	bl sub_0205F924
	str r0, [sp, #8]
	add r0, r5, #0
	bl sub_0205F934
	str r0, [sp, #0xc]
	ldr r0, [sp, #4]
	bl sub_02060F18
	str r0, [sp, #0x10]
	add r0, r5, #0
	add r1, sp, #0x1c
	bl sub_0205F944
	ldr r1, [sp, #0x14]
	ldr r6, [sp, #0xc]
	ldr r3, [sp, #0x10]
	ldr r2, [sp, #8]
	add r0, r5, #0
	add r1, r7, r1
	add r3, r6, r3
	mov r4, #0
	bl sub_02060D94
	cmp r0, #1
	bne _0205DAFC
	mov r0, #1
	orr r4, r0
_0205DAFC:
	add r0, r5, #0
	bl sub_0205F52C
	ldr r2, [sp, #0x14]
	add r1, sp, #0x18
	str r1, [sp]
	ldr r6, [sp, #0xc]
	ldr r3, [sp, #0x10]
	add r1, sp, #0x1c
	add r2, r7, r2
	add r3, r6, r3
	bl sub_020549F4
	cmp r0, #1
	bne _0205DB2C
	mov r0, #2
	orr r4, r0
	add r1, sp, #0x18
	mov r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0205DB2C
	mov r0, #8
	orr r4, r0
_0205DB2C:
	ldr r3, [sp, #0xc]
	ldr r2, [sp, #0x10]
	ldr r1, [sp, #0x14]
	add r2, r3, r2
	ldr r3, [sp, #4]
	add r0, r5, #0
	add r1, r7, r1
	bl sub_02060DEC
	cmp r0, #1
	bne _0205DB46
	mov r0, #2
	orr r4, r0
_0205DB46:
	add r0, r5, #0
	ldr r1, [sp, #0x14]
	ldr r5, [sp, #0xc]
	ldr r3, [sp, #0x10]
	ldr r2, [sp, #8]
	add r1, r7, r1
	add r3, r5, r3
	bl sub_02060BFC
	cmp r0, #1
	bne _0205DB60
	mov r0, #4
	orr r4, r0
_0205DB60:
	add r0, r4, #0
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0205DAA8

	thumb_func_start sub_0205DB68
sub_0205DB68: ; 0x0205DB68
	push {r3, r4, r5, r6, r7, lr}
	mov r0, #0
	add r4, r2, #0
	mvn r0, r0
	add r5, r1, #0
	cmp r4, r0
	beq _0205DBF0
	add r0, r5, #0
	bl sub_0205F52C
	str r0, [sp]
	add r0, r5, #0
	bl sub_0205F914
	add r6, r0, #0
	add r0, r4, #0
	bl sub_02060F0C
	add r7, r0, #0
	add r0, r5, #0
	bl sub_0205F934
	add r5, r0, #0
	add r0, r4, #0
	bl sub_02060F18
	add r2, r0, #0
	ldr r0, [sp]
	add r1, r6, r7
	add r2, r5, r2
	bl sub_02054918
	cmp r4, #3
	bhi _0205DBF0
	add r1, r4, r4
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0205DBB8: ; jump table
	.short _0205DBC0 - _0205DBB8 - 2 ; case 0
	.short _0205DBCC - _0205DBB8 - 2 ; case 1
	.short _0205DBD8 - _0205DBB8 - 2 ; case 2
	.short _0205DBE4 - _0205DBB8 - 2 ; case 3
_0205DBC0:
	bl sub_0205B7B0
	cmp r0, #1
	bne _0205DBF0
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0205DBCC:
	bl sub_0205B7BC
	cmp r0, #1
	bne _0205DBF0
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0205DBD8:
	bl sub_0205B7C8
	cmp r0, #1
	bne _0205DBF0
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0205DBE4:
	bl sub_0205B7D4
	cmp r0, #1
	bne _0205DBF0
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0205DBF0:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0205DB68

	thumb_func_start sub_0205DBF4
sub_0205DBF4: ; 0x0205DBF4
	push {r3, r4, r5, r6, r7, lr}
	mov r0, #0
	add r4, r2, #0
	mvn r0, r0
	add r5, r1, #0
	cmp r4, r0
	beq _0205DC9C
	add r0, r5, #0
	bl sub_0205F52C
	add r7, r0, #0
	add r0, r5, #0
	bl sub_0205F914
	add r6, r0, #0
	add r0, r5, #0
	bl sub_0205F934
	str r0, [sp]
	ldr r2, [sp]
	add r0, r7, #0
	add r1, r6, #0
	bl sub_02054918
	add r5, r0, #0
	cmp r4, #3
	bhi _0205DC74
	add r1, r4, r4
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0205DC36: ; jump table
	.short _0205DC3E - _0205DC36 - 2 ; case 0
	.short _0205DC4A - _0205DC36 - 2 ; case 1
	.short _0205DC58 - _0205DC36 - 2 ; case 2
	.short _0205DC66 - _0205DC36 - 2 ; case 3
_0205DC3E:
	bl sub_0205B730
	cmp r0, #1
	bne _0205DC4A
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0205DC4A:
	add r0, r5, #0
	bl sub_0205B73C
	cmp r0, #1
	bne _0205DC58
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0205DC58:
	add r0, r5, #0
	bl sub_0205B724
	cmp r0, #1
	bne _0205DC66
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0205DC66:
	add r0, r5, #0
	bl sub_0205B718
	cmp r0, #1
	bne _0205DC74
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0205DC74:
	add r0, r4, #0
	bl sub_02060F0C
	add r5, r0, #0
	add r0, r4, #0
	bl sub_02060F18
	add r3, r0, #0
	ldr r2, [sp]
	add r0, r7, #0
	add r1, r6, r5
	add r2, r2, r3
	bl sub_02054918
	bl sub_0205B70C
	cmp r0, #1
	bne _0205DC9C
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0205DC9C:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0205DBF4

	thumb_func_start sub_0205DCA0
sub_0205DCA0: ; 0x0205DCA0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	mov r0, #0
	add r4, r2, #0
	mvn r0, r0
	add r5, r1, #0
	cmp r4, r0
	beq _0205DCF6
	add r0, r5, #0
	bl sub_0205F52C
	str r0, [sp]
	add r0, r5, #0
	bl sub_0205F914
	add r6, r0, #0
	add r0, r4, #0
	bl sub_02060F0C
	add r7, r0, #0
	add r0, r5, #0
	bl sub_0205F934
	str r0, [sp, #4]
	add r0, r4, #0
	bl sub_02060F18
	add r3, r0, #0
	ldr r2, [sp, #4]
	ldr r0, [sp]
	add r1, r6, r7
	add r2, r2, r3
	bl sub_02054918
	add r1, r0, #0
	add r0, r5, #0
	bl sub_02060E54
	cmp r0, #0
	beq _0205DCF6
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0205DCF6:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0205DCA0

	thumb_func_start sub_0205DCFC
sub_0205DCFC: ; 0x0205DCFC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r1, #0
	mov r1, #0
	add r4, r2, #0
	mvn r1, r1
	cmp r4, r1
	beq _0205DD8E
	bl sub_0205C700
	cmp r0, #1
	bne _0205DD8E
	add r0, r5, #0
	bl sub_0205F52C
	str r0, [sp]
	add r0, r5, #0
	bl sub_0205F914
	add r6, r0, #0
	add r0, r4, #0
	bl sub_02060F0C
	add r7, r0, #0
	add r0, r5, #0
	bl sub_0205F934
	str r0, [sp, #4]
	add r0, r4, #0
	bl sub_02060F18
	add r3, r0, #0
	ldr r2, [sp, #4]
	ldr r0, [sp]
	add r1, r6, r7
	add r2, r2, r3
	bl sub_02054918
	add r4, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02060E54
	cmp r0, #0
	beq _0205DD5C
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0205DD5C:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02060EBC
	cmp r0, #0
	beq _0205DD6E
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0205DD6E:
	add r0, r4, #0
	bl sub_0205B6F4
	cmp r0, #0
	beq _0205DD7E
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0205DD7E:
	add r0, r4, #0
	bl sub_0205B8AC
	cmp r0, #0
	beq _0205DD8E
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0205DD8E:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0205DCFC

	thumb_func_start sub_0205DD94
sub_0205DD94: ; 0x0205DD94
	ldr r3, _0205DD98 ; =sub_0205DDD4
	bx r3
	.balign 4, 0
_0205DD98: .word sub_0205DDD4
	thumb_func_end sub_0205DD94

	thumb_func_start sub_0205DD9C
sub_0205DD9C: ; 0x0205DD9C
	mov r1, #0x20
	tst r1, r0
	beq _0205DDA6
	mov r0, #2
	bx lr
_0205DDA6:
	mov r1, #0x10
	tst r0, r1
	beq _0205DDB0
	mov r1, #3
	b _0205DDB2
_0205DDB0:
	sub r1, #0x11
_0205DDB2:
	add r0, r1, #0
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205DD9C

	thumb_func_start sub_0205DDB8
sub_0205DDB8: ; 0x0205DDB8
	mov r1, #0x40
	tst r1, r0
	beq _0205DDC2
	mov r0, #0
	bx lr
_0205DDC2:
	mov r1, #0x80
	tst r0, r1
	beq _0205DDCC
	mov r1, #1
	b _0205DDCE
_0205DDCC:
	sub r1, #0x81
_0205DDCE:
	add r0, r1, #0
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205DDB8

	thumb_func_start sub_0205DDD4
sub_0205DDD4: ; 0x0205DDD4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r2, #0
	add r6, r0, #0
	add r0, r5, #0
	bl sub_0205DD9C
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0205DDB8
	mov r1, #0
	mvn r1, r1
	add r5, r0, #0
	cmp r4, r1
	beq _0205DE34
	cmp r5, r1
	bne _0205DDFA
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_0205DDFA:
	add r0, r6, #0
	bl sub_0205C670
	add r7, r0, #0
	add r0, r6, #0
	bl sub_0205C76C
	str r0, [sp]
	add r0, r6, #0
	bl sub_0205C774
	mov r1, #0
	mvn r1, r1
	cmp r7, r1
	beq _0205DE32
	ldr r1, [sp]
	cmp r4, r1
	bne _0205DE26
	cmp r5, r0
	bne _0205DE26
	add r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
_0205DE26:
	cmp r5, r0
	beq _0205DE2E
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
_0205DE2E:
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_0205DE32:
	add r0, r5, #0
_0205DE34:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0205DDD4

	thumb_func_start sub_0205DE38
sub_0205DE38: ; 0x0205DE38
	push {r4, lr}
	bl sub_0205C6DC
	add r4, r0, #0
	bl sub_02062108
	cmp r0, #1
	bne _0205DE4C
	mov r0, #1
	pop {r4, pc}
_0205DE4C:
	add r0, r4, #0
	bl sub_0205F4D4
	bl sub_0205DE64
	cmp r0, #1
	bne _0205DE5E
	mov r0, #1
	pop {r4, pc}
_0205DE5E:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0205DE38

	thumb_func_start sub_0205DE64
sub_0205DE64: ; 0x0205DE64
	sub r0, #0x1c
	cmp r0, #3
	bhi _0205DE82
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0205DE76: ; jump table
	.short _0205DE7E - _0205DE76 - 2 ; case 0
	.short _0205DE7E - _0205DE76 - 2 ; case 1
	.short _0205DE7E - _0205DE76 - 2 ; case 2
	.short _0205DE7E - _0205DE76 - 2 ; case 3
_0205DE7E:
	mov r0, #1
	bx lr
_0205DE82:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205DE64

	thumb_func_start sub_0205DE88
sub_0205DE88: ; 0x0205DE88
	mov r0, #2
	tst r0, r1
	beq _0205DE92
	mov r0, #1
	bx lr
_0205DE92:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205DE88

	thumb_func_start sub_0205DE98
sub_0205DE98: ; 0x0205DE98
	push {r3, lr}
	bl sub_0205C7A0
	sub r0, #0x58
	cmp r0, #3
	bhi _0205DEBC
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0205DEB0: ; jump table
	.short _0205DEB8 - _0205DEB0 - 2 ; case 0
	.short _0205DEB8 - _0205DEB0 - 2 ; case 1
	.short _0205DEB8 - _0205DEB0 - 2 ; case 2
	.short _0205DEB8 - _0205DEB0 - 2 ; case 3
_0205DEB8:
	mov r0, #1
	pop {r3, pc}
_0205DEBC:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_0205DE98

	thumb_func_start sub_0205DEC0
sub_0205DEC0: ; 0x0205DEC0
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r5, r1, #0
	bl sub_0205C700
	cmp r0, #3
	bhi _0205DF02
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0205DEDA: ; jump table
	.short _0205DEE2 - _0205DEDA - 2 ; case 0
	.short _0205DEF2 - _0205DEDA - 2 ; case 1
	.short _0205DEE2 - _0205DEDA - 2 ; case 2
	.short _0205DEE2 - _0205DEDA - 2 ; case 3
_0205DEE2:
	add r0, r4, #0
	add r1, r5, #0
	bl sub_0205D450
	bl sub_0205D428
	add r4, r0, #0
	b _0205DF08
_0205DEF2:
	add r0, r4, #0
	add r1, r5, #0
	bl sub_0205D7AC
	bl sub_0205D778
	add r4, r0, #0
	b _0205DF08
_0205DF02:
	mov r4, #0
	bl GF_AssertFail
_0205DF08:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0205DEC0

	thumb_func_start sub_0205DF0C
sub_0205DF0C: ; 0x0205DF0C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r7, r2, #0
	add r6, r3, #0
	bl sub_0205DDD4
	str r0, [sp]
	ldr r1, [sp]
	add r0, r5, #0
	bl sub_0205DEC0
	add r4, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205C6C8
	cmp r4, #0
	bne _0205DF3E
	add r0, r5, #0
	bl PlayerAvatar_GetFacingDirection
	mov r1, #0
	bl sub_0206234C
	pop {r3, r4, r5, r6, r7, pc}
_0205DF3E:
	cmp r4, #2
	bne _0205DF4C
	ldr r0, [sp]
	mov r1, #0x28
	bl sub_0206234C
	pop {r3, r4, r5, r6, r7, pc}
_0205DF4C:
	add r0, r5, #0
	bl sub_0205C6DC
	ldr r0, [sp, #0x1c]
	mov r4, #4
	add r1, r0, #0
	tst r1, r4
	beq _0205DF60
	mov r4, #0x38
	b _0205DFBE
_0205DF60:
	cmp r0, #0
	beq _0205DF76
	mov r1, #8
	mov r4, #0x1c
	tst r0, r1
	bne _0205DFBE
	mov r0, #SEQ_SE_DP_WALL_HIT>>8
	lsl r0, r0, #8
	bl PlaySE
	b _0205DFBE
_0205DF76:
	cmp r6, #5
	bhi _0205DFA8
	add r0, r6, r6
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0205DF86: ; jump table
	.short _0205DF92 - _0205DF86 - 2 ; case 0
	.short _0205DF94 - _0205DF86 - 2 ; case 1
	.short _0205DF98 - _0205DF86 - 2 ; case 2
	.short _0205DF9C - _0205DF86 - 2 ; case 3
	.short _0205DFA0 - _0205DF86 - 2 ; case 4
	.short _0205DFA4 - _0205DF86 - 2 ; case 5
_0205DF92:
	b _0205DFAA
_0205DF94:
	mov r4, #8
	b _0205DFAA
_0205DF98:
	mov r4, #0xc
	b _0205DFAA
_0205DF9C:
	mov r4, #0x4c
	b _0205DFAA
_0205DFA0:
	mov r4, #0x10
	b _0205DFAA
_0205DFA4:
	mov r4, #0x14
	b _0205DFAA
_0205DFA8:
	mov r4, #4
_0205DFAA:
	ldr r0, [sp, #0x18]
	cmp r0, #1
	bne _0205DFBE
	add r0, r5, #0
	add r1, r7, #0
	bl sub_0205DE88
	cmp r0, #1
	bne _0205DFBE
	mov r4, #0x58
_0205DFBE:
	ldr r0, [sp]
	add r1, r4, #0
	bl sub_0206234C
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0205DF0C

	thumb_func_start sub_0205DFC8
sub_0205DFC8: ; 0x0205DFC8
	push {r3, lr}
	bl sub_0205C6DC
	bl sub_02062108
	pop {r3, pc}
	thumb_func_end sub_0205DFC8

	thumb_func_start sub_0205DFD4
sub_0205DFD4: ; 0x0205DFD4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0205C6DC
	add r1, r0, #0
	add r0, r5, #0
	add r2, r4, #0
	bl sub_0205DA1C
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0205DFD4

	thumb_func_start sub_0205DFEC
sub_0205DFEC: ; 0x0205DFEC
	push {r4, lr}
	add r4, r1, #0
	bl sub_0205C6DC
	add r1, r4, #0
	bl sub_02060FA8
	pop {r4, pc}
	thumb_func_end sub_0205DFEC

	thumb_func_start sub_0205DFFC
sub_0205DFFC: ; 0x0205DFFC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	str r0, [sp]
	add r6, r2, #0
	add r7, r3, #0
	bl GetPlayerXCoord
	add r4, r0, #0
	add r0, r5, #0
	bl sub_02060F0C
	add r0, r4, r0
	str r0, [r6]
	ldr r0, [sp]
	bl GetPlayerYCoord
	add r4, r0, #0
	add r0, r5, #0
	bl sub_02060F18
	add r0, r4, r0
	str r0, [r7]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0205DFFC

	thumb_func_start sub_0205E02C
sub_0205E02C: ; 0x0205E02C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	bl PlayerAvatar_GetFacingDirection
	add r1, r0, #0
	add r0, r5, #0
	add r2, r4, #0
	add r3, r6, #0
	bl sub_0205DFFC
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0205E02C

	thumb_func_start sub_0205E048
sub_0205E048: ; 0x0205E048
	push {r3, r4, r5, lr}
	bl sub_0205C6DC
	bl sub_0205F52C
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	bl Sav2_GameStats_get
	mov r1, #0
	add r4, r0, #0
	bl GameStats_Inc
	ldr r0, [r5, #0x40]
	bl sub_0205C700
	cmp r0, #1
	bne _0205E074
	add r0, r4, #0
	mov r1, #1
	bl GameStats_Inc
_0205E074:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0205E048

	thumb_func_start sub_0205E078
sub_0205E078: ; 0x0205E078
	push {r3, r4, r5, lr}
	add r4, r1, #0
	mov r1, #0
	mvn r1, r1
	add r5, r0, #0
	cmp r2, r1
	beq _0205E08A
	mov r0, #0
	pop {r3, r4, r5, pc}
_0205E08A:
	bl sub_0205C700
	cmp r0, #1
	beq _0205E096
	mov r0, #0
	pop {r3, r4, r5, pc}
_0205E096:
	add r0, r5, #0
	bl sub_0205CABC
	cmp r0, #0
	bne _0205E0A4
	mov r0, #0
	pop {r3, r4, r5, pc}
_0205E0A4:
	add r0, r5, #0
	bl sub_0205C6DC
	add r1, r4, #0
	bl sub_02060EEC
	cmp r0, #1
	bne _0205E0B8
	mov r0, #1
	pop {r3, r4, r5, pc}
_0205E0B8:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0205E078

	thumb_func_start sub_0205E0BC
sub_0205E0BC: ; 0x0205E0BC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r6, r0, #0
	add r0, r5, #0
	add r7, r2, #0
	bl sub_0205E180
	add r4, r0, #0
	add r1, r6, #0
	bl sub_0205F1DC
	add r0, r4, #0
	add r1, r5, #0
	bl sub_0205F164
	add r0, r4, #0
	add r1, r7, #0
	bl sub_0205F198
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0205E0BC

	thumb_func_start sub_0205E0E8
sub_0205E0E8: ; 0x0205E0E8
	push {r4, lr}
	add r4, r0, #0
	bl sub_0205F1BC
	add r1, r0, #0
	mov r0, #0xb
	bl FreeToHeapExplicit
	mov r0, #0xb
	add r1, r4, #0
	bl FreeToHeapExplicit
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0205E0E8

	thumb_func_start sub_0205E104
sub_0205E104: ; 0x0205E104
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r0, [sp]
	add r5, r2, #0
	str r3, [sp, #4]
	ldr r7, [sp, #0x20]
	bl sub_0205F168
	add r6, r0, #0
	ldr r0, [sp]
	bl sub_0205F1BC
	add r4, r0, #0
	cmp r6, #0
	beq _0205E16C
_0205E122:
	add r0, r4, #0
	bl sub_0205F624
	cmp r0, #1
	bne _0205E162
	ldr r2, [sp, #4]
	add r0, r4, #0
	add r1, r5, #0
	add r3, r7, #0
	bl sub_0205ED90
	cmp r0, #0
	beq _0205E144
	cmp r0, #1
	beq _0205E162
	cmp r0, #2
	b _0205E162
_0205E144:
	add r0, r4, #0
	bl sub_0205F254
	cmp r5, r0
	beq _0205E162
	mov r1, #1
	add r0, r4, #0
	lsl r1, r1, #0xa
	bl sub_0205F228
	cmp r0, #0
	bne _0205E162
	add r0, r4, #0
	bl sub_0205E3CC
_0205E162:
	mov r0, #0x4b
	lsl r0, r0, #2
	add r4, r4, r0
	sub r6, r6, #1
	bne _0205E122
_0205E16C:
	ldr r0, [sp]
	bl sub_0205F1A0
	add r1, r0, #0
	ldr r0, [sp]
	bl ov01_021F9FB0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0205E104

	thumb_func_start sub_0205E180
sub_0205E180: ; 0x0205E180
	push {r4, r5, r6, lr}
	mov r1, #0x4b
	add r4, r0, #0
	mov r0, #0xb
	lsl r1, r1, #2
	bl AllocFromHeap
	add r5, r0, #0
	bne _0205E196
	bl GF_AssertFail
_0205E196:
	mov r2, #0x4b
	add r0, r5, #0
	mov r1, #0
	lsl r2, r2, #2
	bl memset
	mov r0, #0x4b
	lsl r0, r0, #2
	add r6, r4, #0
	mul r6, r0
	mov r0, #0xb
	add r1, r6, #0
	bl AllocFromHeap
	add r4, r0, #0
	bne _0205E1BA
	bl GF_AssertFail
_0205E1BA:
	add r0, r4, #0
	mov r1, #0
	add r2, r6, #0
	bl memset
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205F1A4
	add r0, r5, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0205E180

	thumb_func_start sub_0205E1D0
sub_0205E1D0: ; 0x0205E1D0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r7, r2, #0
	add r2, sp, #0
	add r3, r1, #0
	add r5, r0, #0
	add r6, r2, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	add r0, r6, #0
	bl sub_0205F9E8
	add r4, r0, #0
	add r0, r6, #0
	bl sub_0205FACC
	cmp r0, #0
	bne _0205E21C
	add r0, r5, #0
	add r1, r4, #0
	add r2, r7, #0
	bl sub_0205EA98
	add r4, r0, #0
	beq _0205E23E
	add r1, r6, #0
	add r2, r7, #0
	bl sub_0205F014
	add sp, #0x20
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_0205E21C:
	add r0, r6, #0
	bl sub_0205FAE8
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205EE10
	add r4, r0, #0
	beq _0205E23E
	add r1, r7, #0
	add r2, r6, #0
	bl sub_0205F058
	add sp, #0x20
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_0205E23E:
	add r0, r5, #0
	bl sub_0205EA64
	add r4, r0, #0
	beq _0205E290
	add r0, r5, #0
	bl sub_0205F1E4
	add r2, r0, #0
	add r0, r4, #0
	add r1, r6, #0
	bl sub_0205EB2C
	add r0, r4, #0
	add r1, r5, #0
	bl sub_0205EC90
	add r0, r4, #0
	add r1, r7, #0
	bl sub_0205F250
	add r0, r4, #0
	bl sub_0205EFA4
	add r0, r4, #0
	bl sub_0205EFB4
	add r0, r4, #0
	mov r1, #4
	bl sub_0205F20C
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205EAF0
	add r0, r5, #0
	bl sub_0205F160
	bl sub_0205F16C
	add r0, r4, #0
_0205E290:
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0205E1D0

	thumb_func_start sub_0205E294
sub_0205E294: ; 0x0205E294
	push {r4, lr}
	sub sp, #0x18
	ldr r4, [sp, #0x20]
	str r4, [sp]
	ldr r4, [sp, #0x24]
	str r4, [sp, #4]
	ldr r4, [sp, #0x28]
	str r4, [sp, #8]
	mov r4, #0
	str r4, [sp, #0xc]
	str r4, [sp, #0x10]
	str r4, [sp, #0x14]
	bl sub_0205E2B4
	add sp, #0x18
	pop {r4, pc}
	thumb_func_end sub_0205E294

	thumb_func_start sub_0205E2B4
sub_0205E2B4: ; 0x0205E2B4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r5, r0, #0
	add r4, r1, #0
	add r0, sp, #0
	mov r1, #0
	add r6, r2, #0
	add r7, r3, #0
	bl sub_0205F9E4
	ldr r1, [sp, #0x38]
	add r0, sp, #0
	bl sub_0205F9EC
	ldr r1, [sp, #0x3c]
	add r0, sp, #0
	bl sub_0205F9F4
	add r0, sp, #0
	mov r1, #0
	bl sub_0205F9FC
	add r0, sp, #0
	mov r1, #0
	bl sub_0205FA04
	add r0, sp, #0
	mov r1, #0
	bl sub_0205FA0C
	add r0, sp, #0
	add r1, r7, #0
	bl sub_0205FA14
	ldr r1, [sp, #0x44]
	add r0, sp, #0
	mov r2, #0
	bl sub_0205FA20
	ldr r1, [sp, #0x48]
	add r0, sp, #0
	mov r2, #1
	bl sub_0205FA20
	ldr r1, [sp, #0x4c]
	add r0, sp, #0
	mov r2, #2
	bl sub_0205FA20
	add r0, sp, #0
	mov r1, #0
	bl sub_0205FA68
	add r0, sp, #0
	mov r1, #0
	bl sub_0205FA74
	add r0, sp, #0
	add r1, r4, #0
	bl sub_0205FA80
	add r0, sp, #0
	add r1, r6, #0
	bl sub_0205FA90
	add r0, sp, #0
	mov r1, #0
	bl sub_0205FA88
	ldr r2, [sp, #0x40]
	add r0, r5, #0
	add r1, sp, #0
	bl sub_0205E1D0
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0205E2B4

	thumb_func_start sub_0205E34C
sub_0205E34C: ; 0x0205E34C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, r1, #0
	add r1, r2, #0
	ldr r2, [sp, #0x18]
	add r7, r3, #0
	mov r6, #0
	bl sub_0205FA98
	str r0, [sp]
	cmp r0, #0
	beq _0205E388
	bl sub_0205FA08
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0205F1E4
	lsl r1, r4, #0x10
	lsr r1, r1, #0x10
	bl FlagGet
	cmp r0, #0
	bne _0205E388
	ldr r1, [sp]
	add r0, r5, #0
	add r2, r7, #0
	bl sub_0205E1D0
	add r6, r0, #0
_0205E388:
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0205E34C

	thumb_func_start sub_0205E38C
sub_0205E38C: ; 0x0205E38C
	push {r4, lr}
	add r4, r0, #0
	bl sub_0205F258
	add r0, r4, #0
	bl sub_0205EF48
	mov r1, #1
	add r0, r4, #0
	lsl r1, r1, #0xe
	bl sub_0205F214
	add r0, r4, #0
	bl sub_0205EFB4
	pop {r4, pc}
	thumb_func_end sub_0205E38C

	thumb_func_start sub_0205E3AC
sub_0205E3AC: ; 0x0205E3AC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0205F73C
	cmp r0, #1
	bne _0205E3C0
	add r0, r5, #0
	bl sub_0205E420
_0205E3C0:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205E38C
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0205E3AC

	thumb_func_start sub_0205E3CC
sub_0205E3CC: ; 0x0205E3CC
	push {r4, lr}
	add r4, r0, #0
	bl sub_0205F35C
	bl sub_0205F5D4
	cmp r0, #1
	bne _0205E3E2
	add r0, r4, #0
	bl sub_0205F498
_0205E3E2:
	add r0, r4, #0
	bl sub_0205F444
	add r0, r4, #0
	bl sub_0205F348
	add r0, r4, #0
	bl sub_0205F364
	bl sub_0205F174
	add r0, r4, #0
	bl sub_0205ED80
	pop {r4, pc}
	thumb_func_end sub_0205E3CC

	thumb_func_start sub_0205E400
sub_0205E400: ; 0x0205E400
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl sub_0205F274
	add r5, r0, #0
	add r0, r4, #0
	bl sub_0205F52C
	lsl r1, r5, #0x10
	lsr r1, r1, #0x10
	bl FlagSet
	add r0, r4, #0
	bl sub_0205E3CC
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0205E400

	thumb_func_start sub_0205E420
sub_0205E420: ; 0x0205E420
	push {r4, lr}
	add r4, r0, #0
	bl sub_0205F35C
	bl sub_0205F5D4
	cmp r0, #1
	bne _0205E44E
	mov r1, #1
	add r0, r4, #0
	lsl r1, r1, #0xe
	bl sub_0205F220
	cmp r0, #0
	beq _0205E444
	add r0, r4, #0
	bl sub_0205F498
_0205E444:
	mov r1, #1
	add r0, r4, #0
	lsl r1, r1, #0xe
	bl sub_0205F214
_0205E44E:
	ldr r1, _0205E480 ; =0x0000FFFF
	add r0, r4, #0
	bl sub_0205F258
	ldr r1, _0205E484 ; =sub_0205FCC4
	add r0, r4, #0
	bl sub_0205F468
	ldr r1, _0205E488 ; =sub_0205FCC8
	add r0, r4, #0
	bl sub_0205F47C
	ldr r1, _0205E488 ; =sub_0205FCC8
	add r0, r4, #0
	bl sub_0205F490
	ldr r1, _0205E48C ; =sub_0205FCCC
	add r0, r4, #0
	bl sub_0205F4A4
	ldr r1, _0205E490 ; =sub_0205FCD0
	add r0, r4, #0
	bl sub_0205F4B8
	pop {r4, pc}
	.balign 4, 0
_0205E480: .word 0x0000FFFF
_0205E484: .word sub_0205FCC4
_0205E488: .word sub_0205FCC8
_0205E48C: .word sub_0205FCCC
_0205E490: .word sub_0205FCD0
	thumb_func_end sub_0205E420

	thumb_func_start sub_0205E494
sub_0205E494: ; 0x0205E494
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r4, #0
	bl sub_0205F168
	add r6, r0, #0
	add r0, r5, #0
	bl sub_0205F1BC
	mov r7, #0x4b
	add r5, r0, #0
	lsl r7, r7, #2
_0205E4AC:
	add r0, r5, #0
	mov r1, #1
	bl sub_0205F220
	cmp r0, #0
	beq _0205E4BE
	add r0, r5, #0
	bl sub_0205E3CC
_0205E4BE:
	add r4, r4, #1
	add r5, r5, r7
	cmp r4, r6
	blt _0205E4AC
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0205E494

	thumb_func_start sub_0205E4C8
sub_0205E4C8: ; 0x0205E4C8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl sub_0205F5D4
	cmp r0, #1
	beq _0205E4D8
	bl GF_AssertFail
_0205E4D8:
	add r0, r5, #0
	mov r4, #0
	bl sub_0205F168
	add r6, r0, #0
	add r0, r5, #0
	bl sub_0205F1BC
	mov r7, #0x4b
	add r5, r0, #0
	lsl r7, r7, #2
_0205E4EE:
	add r0, r5, #0
	mov r1, #1
	bl sub_0205F220
	cmp r0, #0
	beq _0205E514
	mov r1, #1
	add r0, r5, #0
	lsl r1, r1, #0xe
	bl sub_0205F220
	cmp r0, #0
	beq _0205E514
	add r0, r5, #0
	bl sub_0205F4AC
	add r0, r5, #0
	bl sub_0205EF6C
_0205E514:
	add r4, r4, #1
	add r5, r5, r7
	cmp r4, r6
	blt _0205E4EE
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0205E4C8

	thumb_func_start sub_0205E520
sub_0205E520: ; 0x0205E520
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl sub_0205F5D4
	cmp r0, #1
	beq _0205E530
	bl GF_AssertFail
_0205E530:
	add r0, r5, #0
	mov r4, #0
	bl sub_0205F168
	add r6, r0, #0
	add r0, r5, #0
	bl sub_0205F1BC
	mov r7, #0x4b
	add r5, r0, #0
	lsl r7, r7, #2
_0205E546:
	add r0, r5, #0
	bl sub_0205F624
	cmp r0, #1
	bne _0205E574
	add r0, r5, #0
	bl sub_0205F678
	cmp r0, #1
	bne _0205E562
	add r0, r5, #0
	bl sub_0205F4C0
	b _0205E568
_0205E562:
	add r0, r5, #0
	bl sub_0205EFB4
_0205E568:
	add r0, r5, #0
	bl sub_0205EF48
	add r0, r5, #0
	bl sub_020611DC
_0205E574:
	add r4, r4, #1
	add r5, r5, r7
	cmp r4, r6
	blt _0205E546
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0205E520

	thumb_func_start sub_0205E580
sub_0205E580: ; 0x0205E580
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl sub_0205F5D4
	cmp r0, #1
	beq _0205E590
	bl GF_AssertFail
_0205E590:
	add r0, r5, #0
	mov r4, #0
	bl sub_0205F168
	add r6, r0, #0
	add r0, r5, #0
	bl sub_0205F1BC
	mov r7, #0x4b
	add r5, r0, #0
	lsl r7, r7, #2
_0205E5A6:
	add r0, r5, #0
	bl sub_0205F624
	cmp r0, #1
	bne _0205E5E0
	add r0, r5, #0
	bl sub_0205F24C
	cmp r0, #0xff
	bne _0205E5E0
	add r0, r5, #0
	bl sub_0205F678
	cmp r0, #1
	bne _0205E5CC
	add r0, r5, #0
	bl sub_0205F4C0
	b _0205E5D2
_0205E5CC:
	add r0, r5, #0
	bl sub_0205EFB4
_0205E5D2:
	add r0, r5, #0
	bl sub_0205EF48
	add r0, r5, #0
	bl sub_020611DC
	pop {r3, r4, r5, r6, r7, pc}
_0205E5E0:
	add r4, r4, #1
	add r5, r5, r7
	cmp r4, r6
	blt _0205E5A6
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0205E580

	thumb_func_start sub_0205E5EC
sub_0205E5EC: ; 0x0205E5EC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r7, r0, #0
	add r6, r1, #0
	mov r0, #0
	add r5, r2, #0
	add r4, r3, #0
	str r0, [sp, #4]
	add r0, r6, #0
	add r1, sp, #0
	add r2, sp, #4
	mov r3, #1
	bl sub_0205EEF4
	cmp r0, #0
	beq _0205E632
_0205E60C:
	ldr r1, [sp]
	add r0, r7, #0
	add r2, r5, #0
	bl sub_0205E680
	sub r4, r4, #1
	add r5, #0x50
	cmp r4, #0
	bgt _0205E622
	bl GF_AssertFail
_0205E622:
	add r0, r6, #0
	add r1, sp, #0
	add r2, sp, #4
	mov r3, #1
	bl sub_0205EEF4
	cmp r0, #0
	bne _0205E60C
_0205E632:
	cmp r4, #0
	beq _0205E642
	mov r2, #0x50
	add r0, r5, #0
	mov r1, #0
	mul r2, r4
	bl memset
_0205E642:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0205E5EC

	thumb_func_start sub_0205E648
sub_0205E648: ; 0x0205E648
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r5, r1, #0
	add r7, r2, #0
	beq _0205E67E
_0205E652:
	ldr r1, [r5]
	mov r0, #1
	tst r0, r1
	beq _0205E678
	add r0, r6, #0
	bl sub_0205EA64
	add r4, r0, #0
	bne _0205E668
	bl GF_AssertFail
_0205E668:
	add r0, r4, #0
	add r1, r5, #0
	bl sub_0205E7C4
	add r0, r6, #0
	add r1, r4, #0
	bl sub_0205E8EC
_0205E678:
	add r5, #0x50
	sub r7, r7, #1
	bne _0205E652
_0205E67E:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0205E648

	thumb_func_start sub_0205E680
sub_0205E680: ; 0x0205E680
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r1, #0
	add r6, r0, #0
	add r4, r2, #0
	add r0, r5, #0
	bl sub_0205F208
	str r0, [r4]
	add r0, r5, #0
	bl sub_0205F23C
	str r0, [r4, #4]
	add r0, r5, #0
	bl sub_0205F24C
	strb r0, [r4, #8]
	add r0, r5, #0
	bl sub_0205F254
	strh r0, [r4, #0x10]
	add r0, r5, #0
	bl sub_0205F25C
	strh r0, [r4, #0x12]
	add r0, r5, #0
	bl sub_0205F264
	strb r0, [r4, #9]
	add r0, r5, #0
	bl sub_0205F26C
	strh r0, [r4, #0x14]
	add r0, r5, #0
	bl sub_0205F274
	strh r0, [r4, #0x16]
	add r0, r5, #0
	bl sub_0205F27C
	strh r0, [r4, #0x18]
	add r0, r5, #0
	bl sub_0205F284
	strb r0, [r4, #0xc]
	add r0, r5, #0
	bl sub_0205F2A8
	strb r0, [r4, #0xd]
	add r0, r5, #0
	bl sub_0205F2B8
	strb r0, [r4, #0xe]
	add r0, r5, #0
	mov r1, #0
	bl sub_0205F2F4
	strh r0, [r4, #0x1a]
	add r0, r5, #0
	mov r1, #1
	bl sub_0205F2F4
	strh r0, [r4, #0x1c]
	add r0, r5, #0
	mov r1, #2
	bl sub_0205F2F4
	strh r0, [r4, #0x1e]
	add r0, r5, #0
	bl sub_0205F31C
	strb r0, [r4, #0xa]
	add r0, r5, #0
	bl sub_0205F324
	strb r0, [r4, #0xb]
	add r0, r5, #0
	bl sub_0205F8E4
	strh r0, [r4, #0x20]
	add r0, r5, #0
	bl sub_0205F8EC
	strh r0, [r4, #0x22]
	add r0, r5, #0
	bl sub_0205F8F4
	strh r0, [r4, #0x24]
	add r0, r5, #0
	bl sub_0205F914
	strh r0, [r4, #0x26]
	add r0, r5, #0
	bl sub_0205F924
	strh r0, [r4, #0x28]
	add r0, r5, #0
	bl sub_0205F934
	strh r0, [r4, #0x2a]
	mov r0, #0x26
	mov r1, #0x2a
	ldrsh r0, [r4, r0]
	ldrsh r1, [r4, r1]
	add r2, sp, #0
	bl sub_020611C8
	add r0, r5, #0
	bl sub_0205F968
	str r0, [sp, #4]
	add r0, r5, #0
	bl sub_0205F8B8
	add r2, r0, #0
	add r0, r6, #0
	add r1, sp, #0
	bl sub_02061248
	cmp r0, #0
	bne _0205E77C
	add r0, r5, #0
	bl sub_0205F968
	str r0, [r4, #0x2c]
	b _0205E792
_0205E77C:
	add r0, r5, #0
	bl sub_0205F784
	cmp r0, #1
	bne _0205E78E
	add r0, r5, #0
	bl sub_0205F968
	str r0, [sp, #4]
_0205E78E:
	ldr r0, [sp, #4]
	str r0, [r4, #0x2c]
_0205E792:
	add r0, r5, #0
	bl sub_0205F394
	add r3, r4, #0
	add r3, #0x30
	mov r2, #0x10
_0205E79E:
	ldrb r1, [r0]
	add r0, r0, #1
	strb r1, [r3]
	add r3, r3, #1
	sub r2, r2, #1
	bne _0205E79E
	add r0, r5, #0
	bl sub_0205F3BC
	add r4, #0x40
	mov r2, #0x10
_0205E7B4:
	ldrb r1, [r0]
	add r0, r0, #1
	strb r1, [r4]
	add r4, r4, #1
	sub r2, r2, #1
	bne _0205E7B4
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end sub_0205E680

	thumb_func_start sub_0205E7C4
sub_0205E7C4: ; 0x0205E7C4
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r1, #0
	ldr r1, [r4]
	add r5, r0, #0
	bl sub_0205F204
	ldr r1, [r4, #4]
	add r0, r5, #0
	bl sub_0205F238
	ldrb r1, [r4, #8]
	add r0, r5, #0
	bl sub_0205F248
	ldrh r1, [r4, #0x10]
	add r0, r5, #0
	bl sub_0205F250
	ldrh r1, [r4, #0x12]
	add r0, r5, #0
	bl sub_0205F258
	ldrb r1, [r4, #9]
	add r0, r5, #0
	bl sub_0205F260
	ldrh r1, [r4, #0x14]
	add r0, r5, #0
	bl sub_0205F268
	ldrh r1, [r4, #0x16]
	add r0, r5, #0
	bl sub_0205F270
	ldrh r1, [r4, #0x18]
	add r0, r5, #0
	bl sub_0205F278
	mov r1, #0xc
	ldrsb r1, [r4, r1]
	add r0, r5, #0
	bl sub_0205F280
	mov r1, #0xd
	ldrsb r1, [r4, r1]
	add r0, r5, #0
	bl sub_0205F288
	mov r1, #0xe
	ldrsb r1, [r4, r1]
	add r0, r5, #0
	bl sub_0205F2B0
	mov r1, #0x1a
	ldrsh r1, [r4, r1]
	add r0, r5, #0
	mov r2, #0
	bl sub_0205F2D0
	mov r1, #0x1c
	ldrsh r1, [r4, r1]
	add r0, r5, #0
	mov r2, #1
	bl sub_0205F2D0
	mov r1, #0x1e
	ldrsh r1, [r4, r1]
	add r0, r5, #0
	mov r2, #2
	bl sub_0205F2D0
	mov r1, #0xa
	ldrsb r1, [r4, r1]
	add r0, r5, #0
	bl sub_0205F318
	mov r1, #0xb
	ldrsb r1, [r4, r1]
	add r0, r5, #0
	bl sub_0205F320
	mov r1, #0x20
	ldrsh r1, [r4, r1]
	add r0, r5, #0
	bl sub_0205F8E8
	mov r1, #0x22
	ldrsh r1, [r4, r1]
	add r0, r5, #0
	bl sub_0205F8F0
	mov r1, #0x24
	ldrsh r1, [r4, r1]
	add r0, r5, #0
	bl sub_0205F8F8
	mov r1, #0x26
	ldrsh r1, [r4, r1]
	add r0, r5, #0
	bl sub_0205F918
	mov r1, #0x28
	ldrsh r1, [r4, r1]
	add r0, r5, #0
	bl sub_0205F928
	mov r1, #0x2a
	ldrsh r1, [r4, r1]
	add r0, r5, #0
	bl sub_0205F938
	add r1, sp, #0
	mov r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	ldr r0, [r4, #0x2c]
	str r0, [sp, #4]
	add r0, r5, #0
	bl sub_0205F954
	add r0, r5, #0
	bl sub_0205F394
	add r3, r4, #0
	add r3, #0x30
	mov r2, #0x10
_0205E8C4:
	ldrb r1, [r3]
	add r3, r3, #1
	strb r1, [r0]
	add r0, r0, #1
	sub r2, r2, #1
	bne _0205E8C4
	add r0, r5, #0
	bl sub_0205F3BC
	add r4, #0x40
	mov r2, #0x10
_0205E8DA:
	ldrb r1, [r4]
	add r4, r4, #1
	strb r1, [r0]
	add r0, r0, #1
	sub r2, r2, #1
	bne _0205E8DA
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0205E7C4

	thumb_func_start sub_0205E8EC
sub_0205E8EC: ; 0x0205E8EC
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	bl sub_0205E934
	add r0, r4, #0
	bl sub_0205E954
	add r0, r4, #0
	add r1, r5, #0
	bl sub_0205F354
	add r0, r4, #0
	bl sub_0205ECE0
	add r0, r4, #0
	bl sub_020621F0
	add r0, r4, #0
	bl sub_0205EFB4
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205EAF0
	add r0, r4, #0
	bl sub_0205F450
	add r0, r5, #0
	bl sub_0205F160
	bl sub_0205F16C
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0205E8EC

	thumb_func_start sub_0205E934
sub_0205E934: ; 0x0205E934
	push {r4, lr}
	mov r1, #5
	add r4, r0, #0
	bl sub_0205F20C
	ldr r1, _0205E950 ; =0x00EF4248
	add r0, r4, #0
	bl sub_0205F214
	add r0, r4, #0
	bl sub_0205EF5C
	pop {r4, pc}
	nop
_0205E950: .word 0x00EF4248
	thumb_func_end sub_0205E934

	thumb_func_start sub_0205E954
sub_0205E954: ; 0x0205E954
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	add r1, sp, #0
	bl sub_0205F944
	add r0, r4, #0
	bl sub_0205F914
	add r1, r0, #0
	mov r0, #2
	lsl r2, r1, #0x10
	lsl r0, r0, #0xe
	add r0, r2, r0
	str r0, [sp]
	add r0, r4, #0
	bl sub_0205F900
	add r0, r4, #0
	bl sub_0205F924
	add r1, r0, #0
	add r0, r4, #0
	bl sub_0205F908
	add r0, r4, #0
	bl sub_0205F934
	add r1, r0, #0
	mov r0, #2
	lsl r2, r1, #0x10
	lsl r0, r0, #0xe
	add r0, r2, r0
	str r0, [sp, #8]
	add r0, r4, #0
	bl sub_0205F910
	add r0, r4, #0
	add r1, sp, #0
	bl sub_0205F954
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end sub_0205E954

	thumb_func_start InitMapObjectsFromEventTemplates
InitMapObjectsFromEventTemplates: ; 0x0205E9AC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r2, #0
	add r7, r0, #0
	add r4, r3, #0
	str r1, [sp]
	cmp r5, #0
	bne _0205E9C0
	bl GF_AssertFail
_0205E9C0:
	lsl r0, r5, #5
	str r0, [sp, #4]
	ldr r1, [sp, #4]
	mov r0, #0xb
	bl AllocFromHeapAtEnd
	add r6, r0, #0
	bne _0205E9D4
	bl GF_AssertFail
_0205E9D4:
	ldr r2, [sp, #4]
	add r0, r6, #0
	add r1, r4, #0
	bl memcpy
	mov r0, #0xb
	mov r1, #0x14
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	bne _0205E9EE
	bl GF_AssertFail
_0205E9EE:
	ldr r0, [sp]
	str r0, [r4]
	str r5, [r4, #4]
	mov r0, #0
	str r0, [r4, #8]
	str r7, [r4, #0xc]
	add r0, r4, #0
	str r6, [r4, #0x10]
	bl sub_0205EA08
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end InitMapObjectsFromEventTemplates

	thumb_func_start sub_0205EA08
sub_0205EA08: ; 0x0205EA08
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	bl sub_0205F1E4
	add r6, r5, #0
	ldr r4, [r5, #0x10]
	add r7, r0, #0
	add r6, #8
_0205EA1A:
	add r0, r4, #0
	bl sub_0205FACC
	cmp r0, #1
	beq _0205EA30
	ldrh r1, [r4, #8]
	add r0, r7, #0
	bl FlagGet
	cmp r0, #0
	bne _0205EA42
_0205EA30:
	ldr r0, [r5, #0xc]
	ldr r2, [r5]
	add r1, r4, #0
	bl sub_0205E1D0
	cmp r0, #0
	bne _0205EA42
	bl GF_AssertFail
_0205EA42:
	ldr r0, [r6]
	add r4, #0x20
	add r0, r0, #1
	str r0, [r6]
	ldr r1, [r5, #8]
	ldr r0, [r5, #4]
	cmp r1, r0
	blt _0205EA1A
	ldr r1, [r5, #0x10]
	mov r0, #0xb
	bl FreeToHeapExplicit
	mov r0, #0xb
	add r1, r5, #0
	bl FreeToHeapExplicit
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0205EA08

	thumb_func_start sub_0205EA64
sub_0205EA64: ; 0x0205EA64
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r4, #0
	bl sub_0205F168
	add r6, r0, #0
	add r0, r5, #0
	bl sub_0205F1BC
	mov r7, #0x4b
	add r5, r0, #0
	lsl r7, r7, #2
_0205EA7C:
	add r0, r5, #0
	mov r1, #1
	bl sub_0205F220
	cmp r0, #0
	bne _0205EA8C
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
_0205EA8C:
	add r4, r4, #1
	add r5, r5, r7
	cmp r4, r6
	blt _0205EA7C
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0205EA64

	thumb_func_start sub_0205EA98
sub_0205EA98: ; 0x0205EA98
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r1, #0
	mov r1, #0
	add r4, r2, #0
	str r1, [sp, #4]
	add r1, sp, #0
	add r2, sp, #4
	mov r3, #1
	add r6, r0, #0
	bl sub_0205EEF4
	cmp r0, #1
	bne _0205EAEA
	add r7, sp, #0
_0205EAB6:
	ldr r0, [sp]
	bl sub_0205F7D4
	cmp r0, #1
	bne _0205EADA
	ldr r0, [sp]
	bl sub_0205F24C
	cmp r5, r0
	bne _0205EADA
	ldr r0, [sp]
	bl sub_0205F544
	cmp r4, r0
	bne _0205EADA
	ldr r0, [sp]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_0205EADA:
	add r0, r6, #0
	add r1, r7, #0
	add r2, sp, #4
	mov r3, #1
	bl sub_0205EEF4
	cmp r0, #1
	beq _0205EAB6
_0205EAEA:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0205EA98

	thumb_func_start sub_0205EAF0
sub_0205EAF0: ; 0x0205EAF0
	push {r3, r4, r5, lr}
	add r4, r1, #0
	bl sub_0205F19C
	add r5, r0, #0
	add r0, r4, #0
	bl sub_0205F264
	cmp r0, #0x30
	beq _0205EB08
	cmp r0, #0x32
	bne _0205EB0A
_0205EB08:
	add r5, r5, #2
_0205EB0A:
	ldr r0, _0205EB28 ; =sub_0205F12C
	add r1, r4, #0
	add r2, r5, #0
	bl sub_0200E320
	add r5, r0, #0
	bne _0205EB1C
	bl GF_AssertFail
_0205EB1C:
	add r0, r4, #0
	add r1, r5, #0
	bl sub_0205F338
	pop {r3, r4, r5, pc}
	nop
_0205EB28: .word sub_0205F12C
	thumb_func_end sub_0205EAF0

	thumb_func_start sub_0205EB2C
sub_0205EB2C: ; 0x0205EB2C
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	add r6, r2, #0
	bl sub_0205F9E8
	add r1, r0, #0
	add r0, r5, #0
	bl sub_0205F248
	add r0, r4, #0
	bl sub_0205F9F0
	add r1, r0, #0
	add r0, r6, #0
	bl ResolveObjectGfxId
	add r1, r0, #0
	add r0, r5, #0
	bl sub_0205F258
	add r0, r4, #0
	bl sub_0205F9F8
	add r1, r0, #0
	add r0, r5, #0
	bl sub_0205F260
	add r0, r4, #0
	bl sub_0205FA00
	add r1, r0, #0
	add r0, r5, #0
	bl sub_0205F268
	add r0, r4, #0
	bl sub_0205FA08
	add r1, r0, #0
	add r0, r5, #0
	bl sub_0205F270
	add r0, r4, #0
	bl sub_0205FA10
	add r1, r0, #0
	add r0, r5, #0
	bl sub_0205F278
	add r0, r4, #0
	bl sub_0205FA18
	add r1, r0, #0
	add r0, r5, #0
	bl sub_0205F280
	add r0, r4, #0
	mov r1, #0
	bl sub_0205FA44
	add r1, r0, #0
	add r0, r5, #0
	mov r2, #0
	bl sub_0205F2D0
	add r0, r4, #0
	mov r1, #1
	bl sub_0205FA44
	add r1, r0, #0
	add r0, r5, #0
	mov r2, #1
	bl sub_0205F2D0
	add r0, r4, #0
	mov r1, #2
	bl sub_0205FA44
	add r1, r0, #0
	add r0, r5, #0
	mov r2, #2
	bl sub_0205F2D0
	add r0, r4, #0
	bl sub_0205FA6C
	add r1, r0, #0
	add r0, r5, #0
	bl sub_0205F318
	add r0, r4, #0
	bl sub_0205FA78
	add r1, r0, #0
	add r0, r5, #0
	bl sub_0205F320
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205EBFC
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0205EB2C

	thumb_func_start sub_0205EBFC
sub_0205EBFC: ; 0x0205EBFC
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r6, r1, #0
	add r4, r0, #0
	add r0, r6, #0
	bl sub_0205FA84
	add r5, r0, #0
	mov r0, #2
	lsl r1, r5, #0x10
	lsl r0, r0, #0xe
	add r0, r1, r0
	str r0, [sp]
	add r0, r4, #0
	add r1, r5, #0
	bl sub_0205F8E8
	add r0, r4, #0
	add r1, r5, #0
	bl sub_0205F900
	add r0, r4, #0
	add r1, r5, #0
	bl sub_0205F918
	add r0, r6, #0
	bl sub_0205FA8C
	asr r1, r0, #3
	str r0, [sp, #4]
	asr r0, r1, #0xb
	lsr r0, r0, #0x14
	add r0, r1, r0
	asr r5, r0, #0xc
	add r0, r4, #0
	add r1, r5, #0
	bl sub_0205F8F0
	add r0, r4, #0
	add r1, r5, #0
	bl sub_0205F908
	add r0, r4, #0
	add r1, r5, #0
	bl sub_0205F928
	add r0, r6, #0
	bl sub_0205FA94
	add r5, r0, #0
	mov r0, #2
	lsl r1, r5, #0x10
	lsl r0, r0, #0xe
	add r0, r1, r0
	str r0, [sp, #8]
	add r0, r4, #0
	add r1, r5, #0
	bl sub_0205F8F8
	add r0, r4, #0
	add r1, r5, #0
	bl sub_0205F910
	add r0, r4, #0
	add r1, r5, #0
	bl sub_0205F938
	add r0, r4, #0
	add r1, sp, #0
	bl sub_0205F954
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0205EBFC

	thumb_func_start sub_0205EC90
sub_0205EC90: ; 0x0205EC90
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldr r1, _0205ECDC ; =0x00001801
	add r5, r0, #0
	bl sub_0205F20C
	add r0, r5, #0
	bl sub_0205EFF8
	cmp r0, #1
	bne _0205ECAE
	add r0, r5, #0
	mov r1, #1
	bl sub_0205F7B8
_0205ECAE:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205F354
	add r0, r5, #0
	bl sub_0205F284
	add r1, r0, #0
	add r0, r5, #0
	bl sub_0205F288
	add r0, r5, #0
	bl sub_0205F284
	add r1, r0, #0
	add r0, r5, #0
	bl sub_0205F2B0
	add r0, r5, #0
	bl sub_020621F0
	pop {r3, r4, r5, pc}
	nop
_0205ECDC: .word 0x00001801
	thumb_func_end sub_0205EC90

	thumb_func_start sub_0205ECE0
sub_0205ECE0: ; 0x0205ECE0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_0205F264
	bl sub_0205FB00
	add r4, r0, #0
	bl sub_0205FB18
	add r1, r0, #0
	add r0, r5, #0
	bl sub_0205F414
	add r0, r4, #0
	bl sub_0205FB1C
	add r1, r0, #0
	add r0, r5, #0
	bl sub_0205F428
	add r0, r4, #0
	bl sub_0205FB20
	add r1, r0, #0
	add r0, r5, #0
	bl sub_0205F43C
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0205ECE0

	thumb_func_start sub_0205ED18
sub_0205ED18: ; 0x0205ED18
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl sub_0205F25C
	mov r1, #2
	lsl r1, r1, #0xc
	cmp r0, r1
	bne _0205ED2C
	ldr r5, _0205ED7C ; =ov01_0220724C
	b _0205ED32
_0205ED2C:
	bl sub_0205FB38
	add r5, r0, #0
_0205ED32:
	add r0, r5, #0
	bl sub_0205FB24
	add r1, r0, #0
	add r0, r4, #0
	bl sub_0205F468
	add r0, r5, #0
	bl sub_0205FB28
	add r1, r0, #0
	add r0, r4, #0
	bl sub_0205F47C
	add r0, r5, #0
	bl sub_0205FB2C
	add r1, r0, #0
	add r0, r4, #0
	bl sub_0205F490
	add r0, r5, #0
	bl sub_0205FB30
	add r1, r0, #0
	add r0, r4, #0
	bl sub_0205F4A4
	add r0, r5, #0
	bl sub_0205FB34
	add r1, r0, #0
	add r0, r4, #0
	bl sub_0205F4B8
	pop {r3, r4, r5, pc}
	nop
_0205ED7C: .word ov01_0220724C
	thumb_func_end sub_0205ED18

	thumb_func_start sub_0205ED80
sub_0205ED80: ; 0x0205ED80
	ldr r3, _0205ED8C ; =memset
	mov r2, #0x4b
	mov r1, #0
	lsl r2, r2, #2
	bx r3
	nop
_0205ED8C: .word memset
	thumb_func_end sub_0205ED80

	thumb_func_start sub_0205ED90
sub_0205ED90: ; 0x0205ED90
	push {r3, r4, r5, r6, r7, lr}
	add r7, r2, #0
	add r5, r0, #0
	add r6, r3, #0
	str r1, [sp]
	cmp r7, #0
	beq _0205EE0A
_0205ED9E:
	add r0, r6, #0
	bl sub_0205F9E8
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0205F24C
	cmp r4, r0
	bne _0205EE02
	add r0, r6, #0
	bl sub_0205FACC
	cmp r0, #1
	bne _0205EDE8
	add r0, r6, #0
	bl sub_0205FAE8
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0205F7D4
	cmp r0, #1
	bne _0205EDDA
	add r0, r5, #0
	bl sub_0205F544
	cmp r4, r0
	bne _0205EE02
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0205EDDA:
	add r0, r5, #0
	bl sub_0205F254
	cmp r4, r0
	bne _0205EE02
	mov r0, #2
	pop {r3, r4, r5, r6, r7, pc}
_0205EDE8:
	add r0, r5, #0
	bl sub_0205F7D4
	cmp r0, #1
	bne _0205EE02
	add r0, r5, #0
	bl sub_0205F544
	ldr r1, [sp]
	cmp r1, r0
	bne _0205EE02
	mov r0, #2
	pop {r3, r4, r5, r6, r7, pc}
_0205EE02:
	sub r7, r7, #1
	add r6, #0x20
	cmp r7, #0
	bne _0205ED9E
_0205EE0A:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0205ED90

	thumb_func_start sub_0205EE10
sub_0205EE10: ; 0x0205EE10
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r1, #0
	mov r1, #0
	add r4, r2, #0
	str r1, [sp, #4]
	add r1, sp, #0
	add r2, sp, #4
	mov r3, #1
	add r6, r0, #0
	bl sub_0205EEF4
	cmp r0, #1
	bne _0205EE58
	add r7, sp, #0
_0205EE2E:
	ldr r0, [sp]
	bl sub_0205F24C
	cmp r5, r0
	bne _0205EE48
	ldr r0, [sp]
	bl sub_0205F254
	cmp r4, r0
	bne _0205EE48
	ldr r0, [sp]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_0205EE48:
	add r0, r6, #0
	add r1, r7, #0
	add r2, sp, #4
	mov r3, #1
	bl sub_0205EEF4
	cmp r0, #1
	beq _0205EE2E
_0205EE58:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0205EE10

	thumb_func_start sub_0205EE60
sub_0205EE60: ; 0x0205EE60
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	cmp r5, #0
	bne _0205EE6E
	bl GF_AssertFail
_0205EE6E:
	add r0, r5, #0
	bl sub_0205F168
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0205F1B4
	mov r7, #0x4b
	add r5, r0, #0
	lsl r7, r7, #2
_0205EE82:
	add r0, r5, #0
	mov r1, #1
	bl sub_0205F228
	cmp r0, #1
	bne _0205EEA6
	add r0, r5, #0
	bl sub_0205F7D4
	cmp r0, #0
	bne _0205EEA6
	add r0, r5, #0
	bl sub_0205F24C
	cmp r6, r0
	bne _0205EEA6
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
_0205EEA6:
	sub r4, r4, #1
	add r5, r5, r7
	cmp r4, #0
	bgt _0205EE82
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0205EE60

	thumb_func_start sub_0205EEB4
sub_0205EEB4: ; 0x0205EEB4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	bl sub_0205F168
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0205F1B4
	mov r7, #0x4b
	add r5, r0, #0
	lsl r7, r7, #2
_0205EECC:
	add r0, r5, #0
	mov r1, #1
	bl sub_0205F228
	cmp r0, #1
	bne _0205EEE6
	add r0, r5, #0
	bl sub_0205F264
	cmp r6, r0
	bne _0205EEE6
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
_0205EEE6:
	sub r4, r4, #1
	add r5, r5, r7
	cmp r4, #0
	bgt _0205EECC
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0205EEB4

	thumb_func_start sub_0205EEF4
sub_0205EEF4: ; 0x0205EEF4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r2, #0
	add r4, r0, #0
	str r1, [sp]
	add r6, r3, #0
	bl sub_0205F168
	add r7, r0, #0
	ldr r0, [r5]
	cmp r0, r7
	blt _0205EF0E
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0205EF0E:
	add r0, r4, #0
	bl sub_0205F1B4
	mov r1, #0x4b
	ldr r2, [r5]
	lsl r1, r1, #2
	mul r1, r2
	add r4, r0, r1
_0205EF1E:
	ldr r0, [r5]
	add r1, r6, #0
	add r0, r0, #1
	str r0, [r5]
	add r0, r4, #0
	bl sub_0205F220
	cmp r6, r0
	bne _0205EF38
	ldr r0, [sp]
	str r4, [r0]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0205EF38:
	mov r0, #0x4b
	lsl r0, r0, #2
	add r4, r4, r0
	ldr r0, [r5]
	cmp r0, r7
	blt _0205EF1E
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0205EEF4

	thumb_func_start sub_0205EF48
sub_0205EF48: ; 0x0205EF48
	push {r4, lr}
	add r4, r0, #0
	mov r1, #4
	bl sub_0205F20C
	add r0, r4, #0
	bl sub_0205EF5C
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0205EF48

	thumb_func_start sub_0205EF5C
sub_0205EF5C: ; 0x0205EF5C
	ldr r3, _0205EF64 ; =sub_0205F214
	ldr r1, _0205EF68 ; =0x05108000
	bx r3
	nop
_0205EF64: .word sub_0205F214
_0205EF68: .word 0x05108000
	thumb_func_end sub_0205EF5C

	thumb_func_start sub_0205EF6C
sub_0205EF6C: ; 0x0205EF6C
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205EF6C

	thumb_func_start ResolveObjectGfxId
ResolveObjectGfxId: ; 0x0205EF70
	push {r3, lr}
	cmp r1, #0x65
	blt _0205EF86
	cmp r1, #0x75
	bgt _0205EF86
	sub r1, #0x65
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl VarGetObjectEventGraphicsId
	add r1, r0, #0
_0205EF86:
	add r0, r1, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ResolveObjectGfxId

	thumb_func_start sub_0205EF8C
sub_0205EF8C: ; 0x0205EF8C
	push {r4, lr}
	mov r1, #1
	lsl r1, r1, #0xc
	add r4, r0, #0
	bl sub_0205F220
	cmp r0, #0
	beq _0205EFA2
	add r0, r4, #0
	bl sub_02061070
_0205EFA2:
	pop {r4, pc}
	thumb_func_end sub_0205EF8C

	thumb_func_start sub_0205EFA4
sub_0205EFA4: ; 0x0205EFA4
	push {r4, lr}
	add r4, r0, #0
	bl sub_0205ECE0
	add r0, r4, #0
	bl sub_0205FD20
	pop {r4, pc}
	thumb_func_end sub_0205EFA4

	thumb_func_start sub_0205EFB4
sub_0205EFB4: ; 0x0205EFB4
	push {r4, lr}
	add r4, r0, #0
	bl sub_0205F35C
	bl sub_0205F5D4
	cmp r0, #0
	beq _0205EFF6
	add r0, r4, #0
	bl sub_0205EF8C
	add r0, r4, #0
	mov r1, #0
	bl sub_0205F328
	add r0, r4, #0
	mov r1, #0
	bl ov01_021FA2B8
	add r0, r4, #0
	bl sub_0205F678
	cmp r0, #0
	bne _0205EFF6
	add r0, r4, #0
	bl sub_0205ED18
	add r0, r4, #0
	bl sub_0205F470
	add r0, r4, #0
	bl sub_0205F66C
_0205EFF6:
	pop {r4, pc}
	thumb_func_end sub_0205EFB4

	thumb_func_start sub_0205EFF8
sub_0205EFF8: ; 0x0205EFF8
	push {r3, lr}
	bl sub_0205F27C
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	ldr r0, _0205F010 ; =0x0000FFFF
	cmp r1, r0
	bne _0205F00C
	mov r0, #1
	pop {r3, pc}
_0205F00C:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_0205F010: .word 0x0000FFFF
	thumb_func_end sub_0205EFF8

	thumb_func_start sub_0205F014
sub_0205F014: ; 0x0205F014
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	bl sub_0205F7D4
	cmp r0, #1
	beq _0205F028
	bl GF_AssertFail
_0205F028:
	add r0, r5, #0
	mov r1, #0
	bl sub_0205F7B8
	add r0, r5, #0
	add r1, r6, #0
	bl sub_0205F250
	add r0, r4, #0
	bl sub_0205FA10
	add r1, r0, #0
	add r0, r5, #0
	bl sub_0205F278
	add r0, r4, #0
	bl sub_0205FA08
	add r1, r0, #0
	add r0, r5, #0
	bl sub_0205F270
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0205F014

	thumb_func_start sub_0205F058
sub_0205F058: ; 0x0205F058
	push {r4, r5, r6, lr}
	add r6, r2, #0
	add r5, r0, #0
	add r0, r6, #0
	add r4, r1, #0
	bl sub_0205FACC
	cmp r0, #1
	beq _0205F06E
	bl GF_AssertFail
_0205F06E:
	add r0, r5, #0
	mov r1, #1
	bl sub_0205F7B8
	add r0, r6, #0
	bl sub_0205FA10
	add r1, r0, #0
	add r0, r5, #0
	bl sub_0205F278
	add r0, r6, #0
	bl sub_0205FAE8
	add r1, r0, #0
	add r0, r5, #0
	bl sub_0205F270
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205F250
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0205F058

	thumb_func_start sub_0205F09C
sub_0205F09C: ; 0x0205F09C
	push {r4, lr}
	add r4, r1, #0
	bl sub_0205F538
	add r0, r0, r4
	pop {r4, pc}
	thumb_func_end sub_0205F09C

	thumb_func_start sub_0205F0A8
sub_0205F0A8: ; 0x0205F0A8
	push {r4, r5, r6, lr}
	add r6, r1, #0
	mov r1, #1
	add r5, r0, #0
	add r4, r2, #0
	bl sub_0205F228
	cmp r0, #0
	bne _0205F0BE
	mov r0, #0
	pop {r4, r5, r6, pc}
_0205F0BE:
	add r0, r5, #0
	bl sub_0205F24C
	cmp r6, r0
	beq _0205F0CC
	mov r0, #0
	pop {r4, r5, r6, pc}
_0205F0CC:
	add r0, r5, #0
	bl sub_0205F254
	cmp r4, r0
	beq _0205F0F2
	add r0, r5, #0
	bl sub_0205F7D4
	cmp r0, #0
	bne _0205F0E4
	mov r0, #0
	pop {r4, r5, r6, pc}
_0205F0E4:
	add r0, r5, #0
	bl sub_0205F544
	cmp r4, r0
	beq _0205F0F2
	mov r0, #0
	pop {r4, r5, r6, pc}
_0205F0F2:
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0205F0A8

	thumb_func_start sub_0205F0F8
sub_0205F0F8: ; 0x0205F0F8
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	mov r1, #1
	add r5, r0, #0
	add r6, r2, #0
	add r7, r3, #0
	bl sub_0205F228
	cmp r0, #0
	bne _0205F110
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0205F110:
	add r0, r5, #0
	bl sub_0205F25C
	cmp r0, r4
	beq _0205F11E
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0205F11E:
	add r0, r5, #0
	add r1, r6, #0
	add r2, r7, #0
	bl sub_0205F0A8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0205F0F8

	thumb_func_start sub_0205F12C
sub_0205F12C: ; 0x0205F12C
	push {r4, lr}
	add r4, r1, #0
	add r0, r4, #0
	bl sub_0205FD30
	add r0, r4, #0
	bl sub_0205F624
	cmp r0, #0
	beq _0205F146
	add r0, r4, #0
	bl sub_0205F148
_0205F146:
	pop {r4, pc}
	thumb_func_end sub_0205F12C

	thumb_func_start sub_0205F148
sub_0205F148: ; 0x0205F148
	push {r4, lr}
	add r4, r0, #0
	bl sub_0205F35C
	bl sub_0205F5D4
	cmp r0, #1
	bne _0205F15E
	add r0, r4, #0
	bl ov01_021F92A0
_0205F15E:
	pop {r4, pc}
	thumb_func_end sub_0205F148

	thumb_func_start sub_0205F160
sub_0205F160: ; 0x0205F160
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205F160

	thumb_func_start sub_0205F164
sub_0205F164: ; 0x0205F164
	str r1, [r0, #4]
	bx lr
	thumb_func_end sub_0205F164

	thumb_func_start sub_0205F168
sub_0205F168: ; 0x0205F168
	ldr r0, [r0, #4]
	bx lr
	thumb_func_end sub_0205F168

	thumb_func_start sub_0205F16C
sub_0205F16C: ; 0x0205F16C
	ldr r1, [r0, #8]
	add r1, r1, #1
	str r1, [r0, #8]
	bx lr
	thumb_func_end sub_0205F16C

	thumb_func_start sub_0205F174
sub_0205F174: ; 0x0205F174
	ldr r1, [r0, #8]
	sub r1, r1, #1
	str r1, [r0, #8]
	bx lr
	thumb_func_end sub_0205F174

	thumb_func_start sub_0205F17C
sub_0205F17C: ; 0x0205F17C
	ldr r2, [r0]
	orr r1, r2
	str r1, [r0]
	bx lr
	thumb_func_end sub_0205F17C

	thumb_func_start sub_0205F184
sub_0205F184: ; 0x0205F184
	ldr r2, [r0]
	mvn r1, r1
	and r1, r2
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205F184

	thumb_func_start sub_0205F190
sub_0205F190: ; 0x0205F190
	ldr r0, [r0]
	and r0, r1
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205F190

	thumb_func_start sub_0205F198
sub_0205F198: ; 0x0205F198
	str r1, [r0, #0xc]
	bx lr
	thumb_func_end sub_0205F198

	thumb_func_start sub_0205F19C
sub_0205F19C: ; 0x0205F19C
	ldr r0, [r0, #0xc]
	bx lr
	thumb_func_end sub_0205F19C

	thumb_func_start sub_0205F1A0
sub_0205F1A0: ; 0x0205F1A0
	add r0, #0x18
	bx lr
	thumb_func_end sub_0205F1A0

	thumb_func_start sub_0205F1A4
sub_0205F1A4: ; 0x0205F1A4
	mov r2, #0x49
	lsl r2, r2, #2
	str r1, [r0, r2]
	bx lr
	thumb_func_end sub_0205F1A4

	thumb_func_start sub_0205F1AC
sub_0205F1AC: ; 0x0205F1AC
	mov r1, #0x49
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	bx lr
	thumb_func_end sub_0205F1AC

	thumb_func_start sub_0205F1B4
sub_0205F1B4: ; 0x0205F1B4
	mov r1, #0x49
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	bx lr
	thumb_func_end sub_0205F1B4

	thumb_func_start sub_0205F1BC
sub_0205F1BC: ; 0x0205F1BC
	mov r1, #0x49
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	bx lr
	thumb_func_end sub_0205F1BC

	thumb_func_start sub_0205F1C4
sub_0205F1C4: ; 0x0205F1C4
	mov r1, #0x4b
	ldr r2, [r0]
	lsl r1, r1, #2
	add r1, r2, r1
	str r1, [r0]
	bx lr
	thumb_func_end sub_0205F1C4

	thumb_func_start sub_0205F1D0
sub_0205F1D0: ; 0x0205F1D0
	mov r1, #0x4b
	ldr r2, [r0]
	lsl r1, r1, #2
	add r1, r2, r1
	str r1, [r0]
	bx lr
	thumb_func_end sub_0205F1D0

	thumb_func_start sub_0205F1DC
sub_0205F1DC: ; 0x0205F1DC
	mov r2, #0x4a
	lsl r2, r2, #2
	str r1, [r0, r2]
	bx lr
	thumb_func_end sub_0205F1DC

	thumb_func_start sub_0205F1E4
sub_0205F1E4: ; 0x0205F1E4
	mov r1, #0x4a
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	bx lr
	thumb_func_end sub_0205F1E4

	thumb_func_start FldObjSys_SetMModelNarc
FldObjSys_SetMModelNarc: ; 0x0205F1EC
	str r1, [r0, #0x14]
	bx lr
	thumb_func_end FldObjSys_SetMModelNarc

	thumb_func_start FldObjSys_GetMModelNarc
FldObjSys_GetMModelNarc: ; 0x0205F1F0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x14]
	cmp r0, #0
	bne _0205F1FE
	bl GF_AssertFail
_0205F1FE:
	ldr r0, [r4, #0x14]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end FldObjSys_GetMModelNarc

	thumb_func_start sub_0205F204
sub_0205F204: ; 0x0205F204
	str r1, [r0]
	bx lr
	thumb_func_end sub_0205F204

	thumb_func_start sub_0205F208
sub_0205F208: ; 0x0205F208
	ldr r0, [r0]
	bx lr
	thumb_func_end sub_0205F208

	thumb_func_start sub_0205F20C
sub_0205F20C: ; 0x0205F20C
	ldr r2, [r0]
	orr r1, r2
	str r1, [r0]
	bx lr
	thumb_func_end sub_0205F20C

	thumb_func_start sub_0205F214
sub_0205F214: ; 0x0205F214
	ldr r2, [r0]
	mvn r1, r1
	and r1, r2
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205F214

	thumb_func_start sub_0205F220
sub_0205F220: ; 0x0205F220
	ldr r0, [r0]
	and r0, r1
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205F220

	thumb_func_start sub_0205F228
sub_0205F228: ; 0x0205F228
	ldr r0, [r0]
	tst r0, r1
	beq _0205F232
	mov r0, #1
	bx lr
_0205F232:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205F228

	thumb_func_start sub_0205F238
sub_0205F238: ; 0x0205F238
	str r1, [r0, #4]
	bx lr
	thumb_func_end sub_0205F238

	thumb_func_start sub_0205F23C
sub_0205F23C: ; 0x0205F23C
	ldr r0, [r0, #4]
	bx lr
	thumb_func_end sub_0205F23C

	thumb_func_start sub_0205F240
sub_0205F240: ; 0x0205F240
	ldr r0, [r0, #4]
	and r0, r1
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205F240

	thumb_func_start sub_0205F248
sub_0205F248: ; 0x0205F248
	str r1, [r0, #8]
	bx lr
	thumb_func_end sub_0205F248

	thumb_func_start sub_0205F24C
sub_0205F24C: ; 0x0205F24C
	ldr r0, [r0, #8]
	bx lr
	thumb_func_end sub_0205F24C

	thumb_func_start sub_0205F250
sub_0205F250: ; 0x0205F250
	str r1, [r0, #0xc]
	bx lr
	thumb_func_end sub_0205F250

	thumb_func_start sub_0205F254
sub_0205F254: ; 0x0205F254
	ldr r0, [r0, #0xc]
	bx lr
	thumb_func_end sub_0205F254

	thumb_func_start sub_0205F258
sub_0205F258: ; 0x0205F258
	str r1, [r0, #0x10]
	bx lr
	thumb_func_end sub_0205F258

	thumb_func_start sub_0205F25C
sub_0205F25C: ; 0x0205F25C
	ldr r0, [r0, #0x10]
	bx lr
	thumb_func_end sub_0205F25C

	thumb_func_start sub_0205F260
sub_0205F260: ; 0x0205F260
	str r1, [r0, #0x14]
	bx lr
	thumb_func_end sub_0205F260

	thumb_func_start sub_0205F264
sub_0205F264: ; 0x0205F264
	ldr r0, [r0, #0x14]
	bx lr
	thumb_func_end sub_0205F264

	thumb_func_start sub_0205F268
sub_0205F268: ; 0x0205F268
	str r1, [r0, #0x18]
	bx lr
	thumb_func_end sub_0205F268

	thumb_func_start sub_0205F26C
sub_0205F26C: ; 0x0205F26C
	ldr r0, [r0, #0x18]
	bx lr
	thumb_func_end sub_0205F26C

	thumb_func_start sub_0205F270
sub_0205F270: ; 0x0205F270
	str r1, [r0, #0x1c]
	bx lr
	thumb_func_end sub_0205F270

	thumb_func_start sub_0205F274
sub_0205F274: ; 0x0205F274
	ldr r0, [r0, #0x1c]
	bx lr
	thumb_func_end sub_0205F274

	thumb_func_start sub_0205F278
sub_0205F278: ; 0x0205F278
	str r1, [r0, #0x20]
	bx lr
	thumb_func_end sub_0205F278

	thumb_func_start sub_0205F27C
sub_0205F27C: ; 0x0205F27C
	ldr r0, [r0, #0x20]
	bx lr
	thumb_func_end sub_0205F27C

	thumb_func_start sub_0205F280
sub_0205F280: ; 0x0205F280
	str r1, [r0, #0x24]
	bx lr
	thumb_func_end sub_0205F280

	thumb_func_start sub_0205F284
sub_0205F284: ; 0x0205F284
	ldr r0, [r0, #0x24]
	bx lr
	thumb_func_end sub_0205F284

	thumb_func_start sub_0205F288
sub_0205F288: ; 0x0205F288
	ldr r2, [r0, #0x28]
	str r2, [r0, #0x30]
	str r1, [r0, #0x28]
	bx lr
	thumb_func_end sub_0205F288

	thumb_func_start sub_0205F290
sub_0205F290: ; 0x0205F290
	push {r3, r4, r5, lr}
	add r4, r1, #0
	mov r1, #0x80
	add r5, r0, #0
	bl sub_0205F220
	cmp r0, #0
	bne _0205F2A6
	ldr r0, [r5, #0x28]
	str r0, [r5, #0x30]
	str r4, [r5, #0x28]
_0205F2A6:
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0205F290

	thumb_func_start sub_0205F2A8
sub_0205F2A8: ; 0x0205F2A8
	ldr r0, [r0, #0x28]
	bx lr
	thumb_func_end sub_0205F2A8

	thumb_func_start sub_0205F2AC
sub_0205F2AC: ; 0x0205F2AC
	ldr r0, [r0, #0x30]
	bx lr
	thumb_func_end sub_0205F2AC

	thumb_func_start sub_0205F2B0
sub_0205F2B0: ; 0x0205F2B0
	ldr r2, [r0, #0x2c]
	str r2, [r0, #0x34]
	str r1, [r0, #0x2c]
	bx lr
	thumb_func_end sub_0205F2B0

	thumb_func_start sub_0205F2B8
sub_0205F2B8: ; 0x0205F2B8
	ldr r0, [r0, #0x2c]
	bx lr
	thumb_func_end sub_0205F2B8

	thumb_func_start sub_0205F2BC
sub_0205F2BC: ; 0x0205F2BC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0205F290
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205F2B0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0205F2BC

	thumb_func_start sub_0205F2D0
sub_0205F2D0: ; 0x0205F2D0
	push {r3, lr}
	cmp r2, #0
	beq _0205F2E0
	cmp r2, #1
	beq _0205F2E4
	cmp r2, #2
	beq _0205F2E8
	b _0205F2EC
_0205F2E0:
	str r1, [r0, #0x38]
	pop {r3, pc}
_0205F2E4:
	str r1, [r0, #0x3c]
	pop {r3, pc}
_0205F2E8:
	str r1, [r0, #0x40]
	pop {r3, pc}
_0205F2EC:
	bl GF_AssertFail
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0205F2D0

	thumb_func_start sub_0205F2F4
sub_0205F2F4: ; 0x0205F2F4
	push {r3, lr}
	cmp r1, #0
	beq _0205F304
	cmp r1, #1
	beq _0205F308
	cmp r1, #2
	beq _0205F30C
	b _0205F310
_0205F304:
	ldr r0, [r0, #0x38]
	pop {r3, pc}
_0205F308:
	ldr r0, [r0, #0x3c]
	pop {r3, pc}
_0205F30C:
	ldr r0, [r0, #0x40]
	pop {r3, pc}
_0205F310:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_0205F2F4

	thumb_func_start sub_0205F318
sub_0205F318: ; 0x0205F318
	str r1, [r0, #0x44]
	bx lr
	thumb_func_end sub_0205F318

	thumb_func_start sub_0205F31C
sub_0205F31C: ; 0x0205F31C
	ldr r0, [r0, #0x44]
	bx lr
	thumb_func_end sub_0205F31C

	thumb_func_start sub_0205F320
sub_0205F320: ; 0x0205F320
	str r1, [r0, #0x48]
	bx lr
	thumb_func_end sub_0205F320

	thumb_func_start sub_0205F324
sub_0205F324: ; 0x0205F324
	ldr r0, [r0, #0x48]
	bx lr
	thumb_func_end sub_0205F324

	thumb_func_start sub_0205F328
sub_0205F328: ; 0x0205F328
	add r0, #0xa0
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205F328

	thumb_func_start sub_0205F330
sub_0205F330: ; 0x0205F330
	add r0, #0xa0
	ldr r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205F330

	thumb_func_start sub_0205F338
sub_0205F338: ; 0x0205F338
	add r0, #0xb0
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205F338

	thumb_func_start sub_0205F340
sub_0205F340: ; 0x0205F340
	add r0, #0xb0
	ldr r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205F340

	thumb_func_start sub_0205F348
sub_0205F348: ; 0x0205F348
	push {r3, lr}
	bl sub_0205F340
	bl sub_0200E390
	pop {r3, pc}
	thumb_func_end sub_0205F348

	thumb_func_start sub_0205F354
sub_0205F354: ; 0x0205F354
	add r0, #0xb4
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205F354

	thumb_func_start sub_0205F35C
sub_0205F35C: ; 0x0205F35C
	add r0, #0xb4
	ldr r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205F35C

	thumb_func_start sub_0205F364
sub_0205F364: ; 0x0205F364
	ldr r3, _0205F36C ; =sub_0205F160
	add r0, #0xb4
	ldr r0, [r0]
	bx r3
	.balign 4, 0
_0205F36C: .word sub_0205F160
	thumb_func_end sub_0205F364

	thumb_func_start sub_0205F370
sub_0205F370: ; 0x0205F370
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r0, #0
	cmp r5, #0x10
	ble _0205F37E
	bl GF_AssertFail
_0205F37E:
	add r0, r4, #0
	bl sub_0205F394
	mov r1, #0
	add r2, r5, #0
	add r4, r0, #0
	bl memset
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0205F370

	thumb_func_start sub_0205F394
sub_0205F394: ; 0x0205F394
	add r0, #0xd8
	bx lr
	thumb_func_end sub_0205F394

	thumb_func_start sub_0205F398
sub_0205F398: ; 0x0205F398
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r0, #0
	cmp r5, #0x10
	ble _0205F3A6
	bl GF_AssertFail
_0205F3A6:
	add r0, r4, #0
	bl sub_0205F3BC
	mov r1, #0
	add r2, r5, #0
	add r4, r0, #0
	bl memset
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0205F398

	thumb_func_start sub_0205F3BC
sub_0205F3BC: ; 0x0205F3BC
	add r0, #0xe8
	bx lr
	thumb_func_end sub_0205F3BC

	thumb_func_start sub_0205F3C0
sub_0205F3C0: ; 0x0205F3C0
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r0, #0
	cmp r5, #0x10
	ble _0205F3CE
	bl GF_AssertFail
_0205F3CE:
	add r0, r4, #0
	bl sub_0205F3E4
	mov r1, #0
	add r2, r5, #0
	add r4, r0, #0
	bl memset
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0205F3C0

	thumb_func_start sub_0205F3E4
sub_0205F3E4: ; 0x0205F3E4
	add r0, #0xf8
	bx lr
	thumb_func_end sub_0205F3E4

	thumb_func_start sub_0205F3E8
sub_0205F3E8: ; 0x0205F3E8
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r0, #0
	cmp r5, #0x20
	ble _0205F3F6
	bl GF_AssertFail
_0205F3F6:
	add r0, r4, #0
	bl sub_0205F40C
	mov r1, #0
	add r2, r5, #0
	add r4, r0, #0
	bl memset
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0205F3E8

	thumb_func_start sub_0205F40C
sub_0205F40C: ; 0x0205F40C
	mov r1, #0x42
	lsl r1, r1, #2
	add r0, r0, r1
	bx lr
	thumb_func_end sub_0205F40C

	thumb_func_start sub_0205F414
sub_0205F414: ; 0x0205F414
	add r0, #0xb8
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205F414

	thumb_func_start sub_0205F41C
sub_0205F41C: ; 0x0205F41C
	push {r3, lr}
	add r1, r0, #0
	add r1, #0xb8
	ldr r1, [r1]
	blx r1
	pop {r3, pc}
	thumb_func_end sub_0205F41C

	thumb_func_start sub_0205F428
sub_0205F428: ; 0x0205F428
	add r0, #0xbc
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205F428

	thumb_func_start sub_0205F430
sub_0205F430: ; 0x0205F430
	push {r3, lr}
	add r1, r0, #0
	add r1, #0xbc
	ldr r1, [r1]
	blx r1
	pop {r3, pc}
	thumb_func_end sub_0205F430

	thumb_func_start sub_0205F43C
sub_0205F43C: ; 0x0205F43C
	add r0, #0xc0
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205F43C

	thumb_func_start sub_0205F444
sub_0205F444: ; 0x0205F444
	push {r3, lr}
	add r1, r0, #0
	add r1, #0xc0
	ldr r1, [r1]
	blx r1
	pop {r3, pc}
	thumb_func_end sub_0205F444

	thumb_func_start sub_0205F450
sub_0205F450: ; 0x0205F450
	push {r4, lr}
	add r4, r0, #0
	bl sub_0205F264
	bl sub_0205FB00
	add r1, r0, #0
	ldr r1, [r1, #0x10]
	add r0, r4, #0
	blx r1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0205F450

	thumb_func_start sub_0205F468
sub_0205F468: ; 0x0205F468
	add r0, #0xc4
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205F468

	thumb_func_start sub_0205F470
sub_0205F470: ; 0x0205F470
	push {r3, lr}
	add r1, r0, #0
	add r1, #0xc4
	ldr r1, [r1]
	blx r1
	pop {r3, pc}
	thumb_func_end sub_0205F470

	thumb_func_start sub_0205F47C
sub_0205F47C: ; 0x0205F47C
	add r0, #0xc8
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205F47C

	thumb_func_start sub_0205F484
sub_0205F484: ; 0x0205F484
	push {r3, lr}
	add r1, r0, #0
	add r1, #0xc8
	ldr r1, [r1]
	blx r1
	pop {r3, pc}
	thumb_func_end sub_0205F484

	thumb_func_start sub_0205F490
sub_0205F490: ; 0x0205F490
	add r0, #0xcc
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205F490

	thumb_func_start sub_0205F498
sub_0205F498: ; 0x0205F498
	push {r3, lr}
	add r1, r0, #0
	add r1, #0xcc
	ldr r1, [r1]
	blx r1
	pop {r3, pc}
	thumb_func_end sub_0205F498

	thumb_func_start sub_0205F4A4
sub_0205F4A4: ; 0x0205F4A4
	add r0, #0xd0
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205F4A4

	thumb_func_start sub_0205F4AC
sub_0205F4AC: ; 0x0205F4AC
	push {r3, lr}
	add r1, r0, #0
	add r1, #0xd0
	ldr r1, [r1]
	blx r1
	pop {r3, pc}
	thumb_func_end sub_0205F4AC

	thumb_func_start sub_0205F4B8
sub_0205F4B8: ; 0x0205F4B8
	add r0, #0xd4
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205F4B8

	thumb_func_start sub_0205F4C0
sub_0205F4C0: ; 0x0205F4C0
	push {r3, lr}
	add r1, r0, #0
	add r1, #0xd4
	ldr r1, [r1]
	blx r1
	pop {r3, pc}
	thumb_func_end sub_0205F4C0

	thumb_func_start sub_0205F4CC
sub_0205F4CC: ; 0x0205F4CC
	add r0, #0xa4
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205F4CC

	thumb_func_start sub_0205F4D4
sub_0205F4D4: ; 0x0205F4D4
	add r0, #0xa4
	ldr r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205F4D4

	thumb_func_start sub_0205F4DC
sub_0205F4DC: ; 0x0205F4DC
	add r0, #0xa8
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205F4DC

	thumb_func_start sub_0205F4E4
sub_0205F4E4: ; 0x0205F4E4
	add r1, r0, #0
	add r1, #0xa8
	ldr r1, [r1]
	add r0, #0xa8
	add r1, r1, #1
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205F4E4

	thumb_func_start sub_0205F4F4
sub_0205F4F4: ; 0x0205F4F4
	add r0, #0xa8
	ldr r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205F4F4

	thumb_func_start sub_0205F4FC
sub_0205F4FC: ; 0x0205F4FC
	add r0, #0xac
	strh r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205F4FC

	thumb_func_start sub_0205F504
sub_0205F504: ; 0x0205F504
	add r0, #0xac
	ldrh r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205F504

	thumb_func_start sub_0205F50C
sub_0205F50C: ; 0x0205F50C
	add r0, #0xae
	strh r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205F50C

	thumb_func_start sub_0205F514
sub_0205F514: ; 0x0205F514
	add r0, #0xae
	ldrh r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205F514

	thumb_func_start sub_0205F51C
sub_0205F51C: ; 0x0205F51C
	mov r2, #0x4a
	lsl r2, r2, #2
	strh r1, [r0, r2]
	bx lr
	thumb_func_end sub_0205F51C

	thumb_func_start sub_0205F524
sub_0205F524: ; 0x0205F524
	mov r1, #0x4a
	lsl r1, r1, #2
	ldrh r0, [r0, r1]
	bx lr
	thumb_func_end sub_0205F524

	thumb_func_start sub_0205F52C
sub_0205F52C: ; 0x0205F52C
	push {r3, lr}
	bl sub_0205F364
	bl sub_0205F1E4
	pop {r3, pc}
	thumb_func_end sub_0205F52C

	thumb_func_start sub_0205F538
sub_0205F538: ; 0x0205F538
	push {r3, lr}
	bl sub_0205F35C
	bl sub_0205F19C
	pop {r3, pc}
	thumb_func_end sub_0205F538

	thumb_func_start sub_0205F544
sub_0205F544: ; 0x0205F544
	push {r4, lr}
	add r4, r0, #0
	bl sub_0205F7D4
	cmp r0, #1
	beq _0205F554
	bl GF_AssertFail
_0205F554:
	add r0, r4, #0
	bl sub_0205F274
	pop {r4, pc}
	thumb_func_end sub_0205F544

	thumb_func_start sub_0205F55C
sub_0205F55C: ; 0x0205F55C
	ldr r3, _0205F564 ; =sub_0205F17C
	mov r1, #6
	bx r3
	nop
_0205F564: .word sub_0205F17C
	thumb_func_end sub_0205F55C

	thumb_func_start sub_0205F568
sub_0205F568: ; 0x0205F568
	ldr r3, _0205F570 ; =sub_0205F184
	mov r1, #6
	bx r3
	nop
_0205F570: .word sub_0205F184
	thumb_func_end sub_0205F568

	thumb_func_start sub_0205F574
sub_0205F574: ; 0x0205F574
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl sub_0205F168
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0205F1BC
	mov r6, #0x4b
	add r5, r0, #0
	lsl r6, r6, #2
_0205F58A:
	add r0, r5, #0
	bl sub_0205F624
	cmp r0, #0
	beq _0205F59A
	add r0, r5, #0
	bl sub_0205F6FC
_0205F59A:
	add r5, r5, r6
	sub r4, r4, #1
	bne _0205F58A
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0205F574

	thumb_func_start sub_0205F5A4
sub_0205F5A4: ; 0x0205F5A4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl sub_0205F168
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0205F1BC
	mov r6, #0x4b
	add r5, r0, #0
	lsl r6, r6, #2
_0205F5BA:
	add r0, r5, #0
	bl sub_0205F624
	cmp r0, #0
	beq _0205F5CA
	add r0, r5, #0
	bl sub_0205F708
_0205F5CA:
	add r5, r5, r6
	sub r4, r4, #1
	bne _0205F5BA
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0205F5A4

	thumb_func_start sub_0205F5D4
sub_0205F5D4: ; 0x0205F5D4
	push {r3, lr}
	mov r1, #1
	bl sub_0205F190
	cmp r0, #0
	beq _0205F5E4
	mov r0, #1
	pop {r3, pc}
_0205F5E4:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_0205F5D4

	thumb_func_start sub_0205F5E8
sub_0205F5E8: ; 0x0205F5E8
	push {r4, lr}
	add r4, r1, #0
	bl sub_0205F35C
	add r1, r4, #0
	bl sub_0205F190
	pop {r4, pc}
	thumb_func_end sub_0205F5E8

	thumb_func_start sub_0205F5F8
sub_0205F5F8: ; 0x0205F5F8
	push {r3, lr}
	cmp r1, #0
	bne _0205F606
	mov r1, #8
	bl sub_0205F17C
	pop {r3, pc}
_0205F606:
	mov r1, #8
	bl sub_0205F184
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0205F5F8

	thumb_func_start sub_0205F610
sub_0205F610: ; 0x0205F610
	push {r3, lr}
	mov r1, #8
	bl sub_0205F190
	cmp r0, #0
	bne _0205F620
	mov r0, #1
	pop {r3, pc}
_0205F620:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_0205F610

	thumb_func_start sub_0205F624
sub_0205F624: ; 0x0205F624
	ldr r3, _0205F62C ; =sub_0205F228
	mov r1, #1
	bx r3
	nop
_0205F62C: .word sub_0205F228
	thumb_func_end sub_0205F624

	thumb_func_start sub_0205F630
sub_0205F630: ; 0x0205F630
	ldr r3, _0205F638 ; =sub_0205F20C
	mov r1, #2
	bx r3
	nop
_0205F638: .word sub_0205F20C
	thumb_func_end sub_0205F630

	thumb_func_start sub_0205F63C
sub_0205F63C: ; 0x0205F63C
	ldr r3, _0205F644 ; =sub_0205F214
	mov r1, #2
	bx r3
	nop
_0205F644: .word sub_0205F214
	thumb_func_end sub_0205F63C

	thumb_func_start sub_0205F648
sub_0205F648: ; 0x0205F648
	ldr r3, _0205F650 ; =sub_0205F228
	mov r1, #2
	bx r3
	nop
_0205F650: .word sub_0205F228
	thumb_func_end sub_0205F648

	thumb_func_start sub_0205F654
sub_0205F654: ; 0x0205F654
	ldr r3, _0205F65C ; =sub_0205F20C
	mov r1, #4
	bx r3
	nop
_0205F65C: .word sub_0205F20C
	thumb_func_end sub_0205F654

	thumb_func_start sub_0205F660
sub_0205F660: ; 0x0205F660
	ldr r3, _0205F668 ; =sub_0205F214
	mov r1, #8
	bx r3
	nop
_0205F668: .word sub_0205F214
	thumb_func_end sub_0205F660

	thumb_func_start sub_0205F66C
sub_0205F66C: ; 0x0205F66C
	ldr r3, _0205F674 ; =sub_0205F20C
	mov r1, #1
	lsl r1, r1, #0xe
	bx r3
	.balign 4, 0
_0205F674: .word sub_0205F20C
	thumb_func_end sub_0205F66C

	thumb_func_start sub_0205F678
sub_0205F678: ; 0x0205F678
	ldr r3, _0205F680 ; =sub_0205F228
	mov r1, #1
	lsl r1, r1, #0xe
	bx r3
	.balign 4, 0
_0205F680: .word sub_0205F228
	thumb_func_end sub_0205F678

	thumb_func_start sub_0205F684
sub_0205F684: ; 0x0205F684
	ldr r3, _0205F68C ; =sub_0205F228
	mov r1, #2
	lsl r1, r1, #8
	bx r3
	.balign 4, 0
_0205F68C: .word sub_0205F228
	thumb_func_end sub_0205F684

	thumb_func_start sub_0205F690
sub_0205F690: ; 0x0205F690
	push {r3, lr}
	cmp r1, #1
	bne _0205F6A0
	mov r1, #2
	lsl r1, r1, #8
	bl sub_0205F20C
	pop {r3, pc}
_0205F6A0:
	mov r1, #2
	lsl r1, r1, #8
	bl sub_0205F214
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0205F690

	thumb_func_start sub_0205F6AC
sub_0205F6AC: ; 0x0205F6AC
	push {r3, lr}
	cmp r1, #1
	bne _0205F6BC
	mov r1, #1
	lsl r1, r1, #0x12
	bl sub_0205F214
	pop {r3, pc}
_0205F6BC:
	mov r1, #1
	lsl r1, r1, #0x12
	bl sub_0205F20C
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0205F6AC

	thumb_func_start sub_0205F6C8
sub_0205F6C8: ; 0x0205F6C8
	push {r3, lr}
	mov r1, #2
	lsl r1, r1, #0x12
	bl sub_0205F228
	cmp r0, #1
	beq _0205F6DA
	mov r0, #1
	pop {r3, pc}
_0205F6DA:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0205F6C8

	thumb_func_start sub_0205F6E0
sub_0205F6E0: ; 0x0205F6E0
	push {r3, lr}
	cmp r1, #1
	bne _0205F6F0
	mov r1, #2
	lsl r1, r1, #0x12
	bl sub_0205F20C
	pop {r3, pc}
_0205F6F0:
	mov r1, #2
	lsl r1, r1, #0x12
	bl sub_0205F214
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0205F6E0

	thumb_func_start sub_0205F6FC
sub_0205F6FC: ; 0x0205F6FC
	ldr r3, _0205F704 ; =sub_0205F20C
	mov r1, #0x40
	bx r3
	nop
_0205F704: .word sub_0205F20C
	thumb_func_end sub_0205F6FC

	thumb_func_start sub_0205F708
sub_0205F708: ; 0x0205F708
	ldr r3, _0205F710 ; =sub_0205F214
	mov r1, #0x40
	bx r3
	nop
_0205F710: .word sub_0205F214
	thumb_func_end sub_0205F708

	thumb_func_start sub_0205F714
sub_0205F714: ; 0x0205F714
	push {r4, lr}
	mov r1, #1
	lsl r1, r1, #0x1e
	add r4, r0, #0
	bl sub_0205F228
	cmp r0, #1
	bne _0205F728
	mov r0, #1
	pop {r4, pc}
_0205F728:
	add r0, r4, #0
	mov r1, #0x40
	bl sub_0205F228
	cmp r0, #1
	bne _0205F738
	mov r0, #1
	pop {r4, pc}
_0205F738:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end sub_0205F714

	thumb_func_start sub_0205F73C
sub_0205F73C: ; 0x0205F73C
	push {r4, lr}
	add r4, r0, #0
	bl sub_0205F35C
	bl sub_0205F5D4
	cmp r0, #0
	bne _0205F750
	mov r0, #0
	pop {r4, pc}
_0205F750:
	mov r1, #1
	add r0, r4, #0
	lsl r1, r1, #0xe
	bl sub_0205F220
	cmp r0, #0
	beq _0205F762
	mov r0, #1
	pop {r4, pc}
_0205F762:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0205F73C

	thumb_func_start sub_0205F768
sub_0205F768: ; 0x0205F768
	push {r3, lr}
	cmp r1, #1
	bne _0205F778
	mov r1, #2
	lsl r1, r1, #0x16
	bl sub_0205F20C
	pop {r3, pc}
_0205F778:
	mov r1, #2
	lsl r1, r1, #0x16
	bl sub_0205F214
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0205F768

	thumb_func_start sub_0205F784
sub_0205F784: ; 0x0205F784
	push {r3, lr}
	mov r1, #2
	lsl r1, r1, #0x16
	bl sub_0205F220
	cmp r0, #0
	beq _0205F796
	mov r0, #1
	pop {r3, pc}
_0205F796:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0205F784

	thumb_func_start sub_0205F79C
sub_0205F79C: ; 0x0205F79C
	push {r3, lr}
	cmp r1, #1
	bne _0205F7AC
	mov r1, #1
	lsl r1, r1, #0xa
	bl sub_0205F20C
	pop {r3, pc}
_0205F7AC:
	mov r1, #1
	lsl r1, r1, #0xa
	bl sub_0205F214
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0205F79C

	thumb_func_start sub_0205F7B8
sub_0205F7B8: ; 0x0205F7B8
	push {r3, lr}
	cmp r1, #1
	bne _0205F7C8
	mov r1, #2
	lsl r1, r1, #0x18
	bl sub_0205F20C
	pop {r3, pc}
_0205F7C8:
	mov r1, #2
	lsl r1, r1, #0x18
	bl sub_0205F214
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0205F7B8

	thumb_func_start sub_0205F7D4
sub_0205F7D4: ; 0x0205F7D4
	push {r3, lr}
	mov r1, #2
	lsl r1, r1, #0x18
	bl sub_0205F220
	cmp r0, #0
	beq _0205F7E6
	mov r0, #1
	pop {r3, pc}
_0205F7E6:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0205F7D4

	thumb_func_start sub_0205F7EC
sub_0205F7EC: ; 0x0205F7EC
	push {r3, lr}
	cmp r1, #1
	bne _0205F7FC
	mov r1, #1
	lsl r1, r1, #0x1a
	bl sub_0205F20C
	pop {r3, pc}
_0205F7FC:
	mov r1, #1
	lsl r1, r1, #0x1a
	bl sub_0205F214
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0205F7EC

	thumb_func_start sub_0205F808
sub_0205F808: ; 0x0205F808
	push {r3, lr}
	mov r1, #1
	lsl r1, r1, #0x1a
	bl sub_0205F220
	cmp r0, #0
	beq _0205F81A
	mov r0, #1
	pop {r3, pc}
_0205F81A:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0205F808

	thumb_func_start sub_0205F820
sub_0205F820: ; 0x0205F820
	push {r3, lr}
	cmp r1, #1
	bne _0205F830
	mov r1, #1
	lsl r1, r1, #0x1c
	bl sub_0205F20C
	pop {r3, pc}
_0205F830:
	mov r1, #1
	lsl r1, r1, #0x1c
	bl sub_0205F214
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0205F820

	thumb_func_start sub_0205F83C
sub_0205F83C: ; 0x0205F83C
	push {r3, lr}
	mov r1, #1
	lsl r1, r1, #0x1c
	bl sub_0205F220
	cmp r0, #0
	beq _0205F84E
	mov r0, #1
	pop {r3, pc}
_0205F84E:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0205F83C

	thumb_func_start sub_0205F854
sub_0205F854: ; 0x0205F854
	push {r3, lr}
	cmp r1, #1
	bne _0205F864
	mov r1, #1
	lsl r1, r1, #0x18
	bl sub_0205F20C
	pop {r3, pc}
_0205F864:
	mov r1, #1
	lsl r1, r1, #0x18
	bl sub_0205F214
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0205F854

	thumb_func_start sub_0205F870
sub_0205F870: ; 0x0205F870
	push {r3, lr}
	mov r1, #1
	lsl r1, r1, #0x18
	bl sub_0205F220
	cmp r0, #0
	beq _0205F882
	mov r0, #1
	pop {r3, pc}
_0205F882:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0205F870

	thumb_func_start sub_0205F888
sub_0205F888: ; 0x0205F888
	push {r3, lr}
	mov r1, #0x10
	bl sub_0205F220
	cmp r0, #0
	beq _0205F898
	mov r0, #1
	pop {r3, pc}
_0205F898:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_0205F888

	thumb_func_start sub_0205F89C
sub_0205F89C: ; 0x0205F89C
	push {r3, lr}
	cmp r1, #1
	bne _0205F8AC
	mov r1, #2
	lsl r1, r1, #0x1c
	bl sub_0205F20C
	pop {r3, pc}
_0205F8AC:
	mov r1, #2
	lsl r1, r1, #0x1c
	bl sub_0205F214
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0205F89C

	thumb_func_start sub_0205F8B8
sub_0205F8B8: ; 0x0205F8B8
	push {r3, lr}
	mov r1, #2
	lsl r1, r1, #0x1c
	bl sub_0205F220
	cmp r0, #0
	beq _0205F8CA
	mov r0, #1
	pop {r3, pc}
_0205F8CA:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0205F8B8

	thumb_func_start sub_0205F8D0
sub_0205F8D0: ; 0x0205F8D0
	push {r3, lr}
	mov r1, #4
	bl sub_0205F240
	cmp r0, #0
	beq _0205F8E0
	mov r0, #1
	pop {r3, pc}
_0205F8E0:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_0205F8D0

	thumb_func_start sub_0205F8E4
sub_0205F8E4: ; 0x0205F8E4
	ldr r0, [r0, #0x4c]
	bx lr
	thumb_func_end sub_0205F8E4

	thumb_func_start sub_0205F8E8
sub_0205F8E8: ; 0x0205F8E8
	str r1, [r0, #0x4c]
	bx lr
	thumb_func_end sub_0205F8E8

	thumb_func_start sub_0205F8EC
sub_0205F8EC: ; 0x0205F8EC
	ldr r0, [r0, #0x50]
	bx lr
	thumb_func_end sub_0205F8EC

	thumb_func_start sub_0205F8F0
sub_0205F8F0: ; 0x0205F8F0
	str r1, [r0, #0x50]
	bx lr
	thumb_func_end sub_0205F8F0

	thumb_func_start sub_0205F8F4
sub_0205F8F4: ; 0x0205F8F4
	ldr r0, [r0, #0x54]
	bx lr
	thumb_func_end sub_0205F8F4

	thumb_func_start sub_0205F8F8
sub_0205F8F8: ; 0x0205F8F8
	str r1, [r0, #0x54]
	bx lr
	thumb_func_end sub_0205F8F8

	thumb_func_start sub_0205F8FC
sub_0205F8FC: ; 0x0205F8FC
	ldr r0, [r0, #0x58]
	bx lr
	thumb_func_end sub_0205F8FC

	thumb_func_start sub_0205F900
sub_0205F900: ; 0x0205F900
	str r1, [r0, #0x58]
	bx lr
	thumb_func_end sub_0205F900

	thumb_func_start sub_0205F904
sub_0205F904: ; 0x0205F904
	ldr r0, [r0, #0x5c]
	bx lr
	thumb_func_end sub_0205F904

	thumb_func_start sub_0205F908
sub_0205F908: ; 0x0205F908
	str r1, [r0, #0x5c]
	bx lr
	thumb_func_end sub_0205F908

	thumb_func_start sub_0205F90C
sub_0205F90C: ; 0x0205F90C
	ldr r0, [r0, #0x60]
	bx lr
	thumb_func_end sub_0205F90C

	thumb_func_start sub_0205F910
sub_0205F910: ; 0x0205F910
	str r1, [r0, #0x60]
	bx lr
	thumb_func_end sub_0205F910

	thumb_func_start sub_0205F914
sub_0205F914: ; 0x0205F914
	ldr r0, [r0, #0x64]
	bx lr
	thumb_func_end sub_0205F914

	thumb_func_start sub_0205F918
sub_0205F918: ; 0x0205F918
	str r1, [r0, #0x64]
	bx lr
	thumb_func_end sub_0205F918

	thumb_func_start sub_0205F91C
sub_0205F91C: ; 0x0205F91C
	ldr r2, [r0, #0x64]
	add r1, r2, r1
	str r1, [r0, #0x64]
	bx lr
	thumb_func_end sub_0205F91C

	thumb_func_start sub_0205F924
sub_0205F924: ; 0x0205F924
	ldr r0, [r0, #0x68]
	bx lr
	thumb_func_end sub_0205F924

	thumb_func_start sub_0205F928
sub_0205F928: ; 0x0205F928
	str r1, [r0, #0x68]
	bx lr
	thumb_func_end sub_0205F928

	thumb_func_start sub_0205F92C
sub_0205F92C: ; 0x0205F92C
	ldr r2, [r0, #0x68]
	add r1, r2, r1
	str r1, [r0, #0x68]
	bx lr
	thumb_func_end sub_0205F92C

	thumb_func_start sub_0205F934
sub_0205F934: ; 0x0205F934
	ldr r0, [r0, #0x6c]
	bx lr
	thumb_func_end sub_0205F934

	thumb_func_start sub_0205F938
sub_0205F938: ; 0x0205F938
	str r1, [r0, #0x6c]
	bx lr
	thumb_func_end sub_0205F938

	thumb_func_start sub_0205F93C
sub_0205F93C: ; 0x0205F93C
	ldr r2, [r0, #0x6c]
	add r1, r2, r1
	str r1, [r0, #0x6c]
	bx lr
	thumb_func_end sub_0205F93C

	thumb_func_start sub_0205F944
sub_0205F944: ; 0x0205F944
	add r2, r0, #0
	add r2, #0x70
	add r3, r1, #0
	ldmia r2!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r2]
	str r0, [r3]
	bx lr
	thumb_func_end sub_0205F944

	thumb_func_start sub_0205F954
sub_0205F954: ; 0x0205F954
	add r3, r1, #0
	add r2, r0, #0
	ldmia r3!, {r0, r1}
	add r2, #0x70
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	bx lr
	thumb_func_end sub_0205F954

	thumb_func_start sub_0205F964
sub_0205F964: ; 0x0205F964
	add r0, #0x70
	bx lr
	thumb_func_end sub_0205F964

	thumb_func_start sub_0205F968
sub_0205F968: ; 0x0205F968
	ldr r0, [r0, #0x74]
	bx lr
	thumb_func_end sub_0205F968

	thumb_func_start sub_0205F96C
sub_0205F96C: ; 0x0205F96C
	add r2, r0, #0
	add r2, #0x7c
	add r3, r1, #0
	ldmia r2!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r2]
	str r0, [r3]
	bx lr
	thumb_func_end sub_0205F96C

	thumb_func_start sub_0205F97C
sub_0205F97C: ; 0x0205F97C
	add r3, r1, #0
	add r2, r0, #0
	ldmia r3!, {r0, r1}
	add r2, #0x7c
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	bx lr
	thumb_func_end sub_0205F97C

	thumb_func_start sub_0205F98C
sub_0205F98C: ; 0x0205F98C
	add r0, #0x7c
	bx lr
	thumb_func_end sub_0205F98C

	thumb_func_start sub_0205F990
sub_0205F990: ; 0x0205F990
	add r2, r0, #0
	add r2, #0x88
	add r3, r1, #0
	ldmia r2!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r2]
	str r0, [r3]
	bx lr
	thumb_func_end sub_0205F990

	thumb_func_start sub_0205F9A0
sub_0205F9A0: ; 0x0205F9A0
	add r3, r1, #0
	add r2, r0, #0
	ldmia r3!, {r0, r1}
	add r2, #0x88
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	bx lr
	thumb_func_end sub_0205F9A0

	thumb_func_start sub_0205F9B0
sub_0205F9B0: ; 0x0205F9B0
	add r2, r0, #0
	add r2, #0x94
	add r3, r1, #0
	ldmia r2!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r2]
	str r0, [r3]
	bx lr
	thumb_func_end sub_0205F9B0

	thumb_func_start sub_0205F9C0
sub_0205F9C0: ; 0x0205F9C0
	add r3, r1, #0
	add r2, r0, #0
	ldmia r3!, {r0, r1}
	add r2, #0x94
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	bx lr
	thumb_func_end sub_0205F9C0

	thumb_func_start sub_0205F9D0
sub_0205F9D0: ; 0x0205F9D0
	push {r3, lr}
	bl sub_0205F968
	asr r1, r0, #3
	asr r0, r1, #0xb
	lsr r0, r0, #0x14
	add r0, r1, r0
	asr r0, r0, #0xc
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0205F9D0

	thumb_func_start sub_0205F9E4
sub_0205F9E4: ; 0x0205F9E4
	strh r1, [r0]
	bx lr
	thumb_func_end sub_0205F9E4

	thumb_func_start sub_0205F9E8
sub_0205F9E8: ; 0x0205F9E8
	ldrh r0, [r0]
	bx lr
	thumb_func_end sub_0205F9E8

	thumb_func_start sub_0205F9EC
sub_0205F9EC: ; 0x0205F9EC
	strh r1, [r0, #2]
	bx lr
	thumb_func_end sub_0205F9EC

	thumb_func_start sub_0205F9F0
sub_0205F9F0: ; 0x0205F9F0
	ldrh r0, [r0, #2]
	bx lr
	thumb_func_end sub_0205F9F0

	thumb_func_start sub_0205F9F4
sub_0205F9F4: ; 0x0205F9F4
	strh r1, [r0, #4]
	bx lr
	thumb_func_end sub_0205F9F4

	thumb_func_start sub_0205F9F8
sub_0205F9F8: ; 0x0205F9F8
	ldrh r0, [r0, #4]
	bx lr
	thumb_func_end sub_0205F9F8

	thumb_func_start sub_0205F9FC
sub_0205F9FC: ; 0x0205F9FC
	strh r1, [r0, #6]
	bx lr
	thumb_func_end sub_0205F9FC

	thumb_func_start sub_0205FA00
sub_0205FA00: ; 0x0205FA00
	ldrh r0, [r0, #6]
	bx lr
	thumb_func_end sub_0205FA00

	thumb_func_start sub_0205FA04
sub_0205FA04: ; 0x0205FA04
	strh r1, [r0, #8]
	bx lr
	thumb_func_end sub_0205FA04

	thumb_func_start sub_0205FA08
sub_0205FA08: ; 0x0205FA08
	ldrh r0, [r0, #8]
	bx lr
	thumb_func_end sub_0205FA08

	thumb_func_start sub_0205FA0C
sub_0205FA0C: ; 0x0205FA0C
	strh r1, [r0, #0xa]
	bx lr
	thumb_func_end sub_0205FA0C

	thumb_func_start sub_0205FA10
sub_0205FA10: ; 0x0205FA10
	ldrh r0, [r0, #0xa]
	bx lr
	thumb_func_end sub_0205FA10

	thumb_func_start sub_0205FA14
sub_0205FA14: ; 0x0205FA14
	strh r1, [r0, #0xc]
	bx lr
	thumb_func_end sub_0205FA14

	thumb_func_start sub_0205FA18
sub_0205FA18: ; 0x0205FA18
	mov r1, #0xc
	ldrsh r0, [r0, r1]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205FA18

	thumb_func_start sub_0205FA20
sub_0205FA20: ; 0x0205FA20
	push {r3, lr}
	cmp r2, #0
	beq _0205FA30
	cmp r2, #1
	beq _0205FA34
	cmp r2, #2
	beq _0205FA38
	b _0205FA3C
_0205FA30:
	strh r1, [r0, #0xe]
	pop {r3, pc}
_0205FA34:
	strh r1, [r0, #0x10]
	pop {r3, pc}
_0205FA38:
	strh r1, [r0, #0x12]
	pop {r3, pc}
_0205FA3C:
	bl GF_AssertFail
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0205FA20

	thumb_func_start sub_0205FA44
sub_0205FA44: ; 0x0205FA44
	push {r3, lr}
	cmp r1, #0
	beq _0205FA54
	cmp r1, #1
	beq _0205FA58
	cmp r1, #2
	beq _0205FA5C
	b _0205FA60
_0205FA54:
	ldrh r0, [r0, #0xe]
	pop {r3, pc}
_0205FA58:
	ldrh r0, [r0, #0x10]
	pop {r3, pc}
_0205FA5C:
	ldrh r0, [r0, #0x12]
	pop {r3, pc}
_0205FA60:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_0205FA44

	thumb_func_start sub_0205FA68
sub_0205FA68: ; 0x0205FA68
	strh r1, [r0, #0x14]
	bx lr
	thumb_func_end sub_0205FA68

	thumb_func_start sub_0205FA6C
sub_0205FA6C: ; 0x0205FA6C
	mov r1, #0x14
	ldrsh r0, [r0, r1]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205FA6C

	thumb_func_start sub_0205FA74
sub_0205FA74: ; 0x0205FA74
	strh r1, [r0, #0x16]
	bx lr
	thumb_func_end sub_0205FA74

	thumb_func_start sub_0205FA78
sub_0205FA78: ; 0x0205FA78
	mov r1, #0x16
	ldrsh r0, [r0, r1]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205FA78

	thumb_func_start sub_0205FA80
sub_0205FA80: ; 0x0205FA80
	strh r1, [r0, #0x18]
	bx lr
	thumb_func_end sub_0205FA80

	thumb_func_start sub_0205FA84
sub_0205FA84: ; 0x0205FA84
	ldrh r0, [r0, #0x18]
	bx lr
	thumb_func_end sub_0205FA84

	thumb_func_start sub_0205FA88
sub_0205FA88: ; 0x0205FA88
	str r1, [r0, #0x1c]
	bx lr
	thumb_func_end sub_0205FA88

	thumb_func_start sub_0205FA8C
sub_0205FA8C: ; 0x0205FA8C
	ldr r0, [r0, #0x1c]
	bx lr
	thumb_func_end sub_0205FA8C

	thumb_func_start sub_0205FA90
sub_0205FA90: ; 0x0205FA90
	strh r1, [r0, #0x1a]
	bx lr
	thumb_func_end sub_0205FA90

	thumb_func_start sub_0205FA94
sub_0205FA94: ; 0x0205FA94
	ldrh r0, [r0, #0x1a]
	bx lr
	thumb_func_end sub_0205FA94

	thumb_func_start sub_0205FA98
sub_0205FA98: ; 0x0205FA98
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r7, r1, #0
	str r2, [sp]
	mov r4, #0
	add r5, r2, #0
_0205FAA4:
	add r0, r5, #0
	bl sub_0205FACC
	cmp r0, #0
	bne _0205FAC0
	add r0, r5, #0
	bl sub_0205F9E8
	cmp r6, r0
	bne _0205FAC0
	ldr r0, [sp]
	lsl r1, r4, #5
	add r0, r0, r1
	pop {r3, r4, r5, r6, r7, pc}
_0205FAC0:
	add r4, r4, #1
	add r5, #0x20
	cmp r4, r7
	blt _0205FAA4
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0205FA98

	thumb_func_start sub_0205FACC
sub_0205FACC: ; 0x0205FACC
	push {r3, lr}
	bl sub_0205FA10
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	ldr r0, _0205FAE4 ; =0x0000FFFF
	cmp r1, r0
	bne _0205FAE0
	mov r0, #1
	pop {r3, pc}
_0205FAE0:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_0205FAE4: .word 0x0000FFFF
	thumb_func_end sub_0205FACC

	thumb_func_start sub_0205FAE8
sub_0205FAE8: ; 0x0205FAE8
	push {r4, lr}
	add r4, r0, #0
	bl sub_0205FACC
	cmp r0, #1
	beq _0205FAF8
	bl GF_AssertFail
_0205FAF8:
	add r0, r4, #0
	bl sub_0205FA08
	pop {r4, pc}
	thumb_func_end sub_0205FAE8

	thumb_func_start sub_0205FB00
sub_0205FB00: ; 0x0205FB00
	push {r4, lr}
	add r4, r0, #0
	cmp r4, #0x39
	blo _0205FB0C
	bl GF_AssertFail
_0205FB0C:
	ldr r0, _0205FB14 ; =_020FD1F4
	lsl r1, r4, #2
	ldr r0, [r0, r1]
	pop {r4, pc}
	.balign 4, 0
_0205FB14: .word _020FD1F4
	thumb_func_end sub_0205FB00

	thumb_func_start sub_0205FB18
sub_0205FB18: ; 0x0205FB18
	ldr r0, [r0, #4]
	bx lr
	thumb_func_end sub_0205FB18

	thumb_func_start sub_0205FB1C
sub_0205FB1C: ; 0x0205FB1C
	ldr r0, [r0, #8]
	bx lr
	thumb_func_end sub_0205FB1C

	thumb_func_start sub_0205FB20
sub_0205FB20: ; 0x0205FB20
	ldr r0, [r0, #0xc]
	bx lr
	thumb_func_end sub_0205FB20

	thumb_func_start sub_0205FB24
sub_0205FB24: ; 0x0205FB24
	ldr r0, [r0]
	bx lr
	thumb_func_end sub_0205FB24

	thumb_func_start sub_0205FB28
sub_0205FB28: ; 0x0205FB28
	ldr r0, [r0, #4]
	bx lr
	thumb_func_end sub_0205FB28

	thumb_func_start sub_0205FB2C
sub_0205FB2C: ; 0x0205FB2C
	ldr r0, [r0, #8]
	bx lr
	thumb_func_end sub_0205FB2C

	thumb_func_start sub_0205FB30
sub_0205FB30: ; 0x0205FB30
	ldr r0, [r0, #0xc]
	bx lr
	thumb_func_end sub_0205FB30

	thumb_func_start sub_0205FB34
sub_0205FB34: ; 0x0205FB34
	ldr r0, [r0, #0x10]
	bx lr
	thumb_func_end sub_0205FB34

	thumb_func_start sub_0205FB38
sub_0205FB38: ; 0x0205FB38
	push {r3, lr}
	bl GetObjectEventGfxInfoPtr
	cmp r0, #0
	bne _0205FB46
	mov r0, #0
	pop {r3, pc}
_0205FB46:
	ldrh r0, [r0, #4]
	lsl r0, r0, #0x16
	lsr r0, r0, #0x1b
	lsl r1, r0, #2
	ldr r0, _0205FB54 ; =ov01_02209A38
	ldr r0, [r0, r1]
	pop {r3, pc}
	.balign 4, 0
_0205FB54: .word ov01_02209A38
	thumb_func_end sub_0205FB38

	thumb_func_start sub_0205FB58
sub_0205FB58: ; 0x0205FB58
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	add r5, r1, #0
	add r6, r2, #0
	str r3, [sp]
	bl sub_0205F168
	add r7, r0, #0
	add r0, r4, #0
	bl sub_0205F1BC
	add r4, r0, #0
_0205FB70:
	add r0, r4, #0
	mov r1, #1
	bl sub_0205F220
	cmp r0, #0
	beq _0205FBB2
	ldr r0, [sp]
	cmp r0, #0
	beq _0205FB9A
	add r0, r4, #0
	bl sub_0205F8FC
	cmp r5, r0
	bne _0205FB9A
	add r0, r4, #0
	bl sub_0205F90C
	cmp r6, r0
	bne _0205FB9A
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_0205FB9A:
	add r0, r4, #0
	bl sub_0205F914
	cmp r5, r0
	bne _0205FBB2
	add r0, r4, #0
	bl sub_0205F934
	cmp r6, r0
	bne _0205FBB2
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_0205FBB2:
	mov r0, #0x4b
	lsl r0, r0, #2
	add r4, r4, r0
	sub r7, r7, #1
	bne _0205FB70
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0205FB58

	thumb_func_start sub_0205FBC0
sub_0205FBC0: ; 0x0205FBC0
	push {r4, r5, r6, lr}
	add r4, r1, #0
	ldr r1, [r4]
	add r6, r2, #0
	asr r2, r1, #4
	asr r1, r2, #0xb
	lsr r1, r1, #0x14
	add r1, r2, r1
	asr r1, r1, #0xc
	add r5, r0, #0
	bl sub_0205F918
	ldr r1, [r4, #4]
	add r0, r5, #0
	asr r2, r1, #3
	asr r1, r2, #0xb
	lsr r1, r1, #0x14
	add r1, r2, r1
	asr r1, r1, #0xc
	bl sub_0205F928
	ldr r1, [r4, #8]
	add r0, r5, #0
	asr r2, r1, #4
	asr r1, r2, #0xb
	lsr r1, r1, #0x14
	add r1, r2, r1
	asr r1, r1, #0xc
	bl sub_0205F938
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205F954
	add r0, r5, #0
	bl sub_02060F78
	add r0, r5, #0
	add r1, r6, #0
	bl sub_0205F288
	add r0, r5, #0
	bl sub_020621F0
	add r0, r5, #0
	mov r1, #4
	bl sub_0205F20C
	add r0, r5, #0
	mov r1, #0xa
	bl sub_0205F214
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0205FBC0

	thumb_func_start sub_0205FC2C
sub_0205FC2C: ; 0x0205FC2C
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r4, r2, #0
	mov r2, #2
	add r6, r3, #0
	lsl r3, r1, #0x10
	lsl r2, r2, #0xe
	add r2, r3, r2
	add r5, r0, #0
	str r2, [sp]
	bl sub_0205F918
	lsl r0, r4, #0xf
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205F928
	mov r0, #2
	lsl r1, r6, #0x10
	lsl r0, r0, #0xe
	add r0, r1, r0
	str r0, [sp, #8]
	add r0, r5, #0
	add r1, r6, #0
	bl sub_0205F938
	add r0, r5, #0
	add r1, sp, #0
	bl sub_0205F954
	add r0, r5, #0
	bl sub_02060F78
	ldr r1, [sp, #0x20]
	add r0, r5, #0
	bl sub_0205F288
	add r0, r5, #0
	mov r1, #4
	bl sub_0205F20C
	add r0, r5, #0
	mov r1, #0xa
	bl sub_0205F214
	add r0, r5, #0
	bl sub_020621F0
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0205FC2C

	thumb_func_start sub_0205FC94
sub_0205FC94: ; 0x0205FC94
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0205F444
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205F260
	add r0, r5, #0
	bl sub_0205ECE0
	add r0, r5, #0
	bl sub_0205FD20
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0205FC94

	thumb_func_start sub_0205FCB4
sub_0205FCB4: ; 0x0205FCB4
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205FCB4

	thumb_func_start sub_0205FCB8
sub_0205FCB8: ; 0x0205FCB8
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205FCB8

	thumb_func_start sub_0205FCBC
sub_0205FCBC: ; 0x0205FCBC
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205FCBC

	thumb_func_start sub_0205FCC0
sub_0205FCC0: ; 0x0205FCC0
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205FCC0

	thumb_func_start sub_0205FCC4
sub_0205FCC4: ; 0x0205FCC4
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205FCC4

	thumb_func_start sub_0205FCC8
sub_0205FCC8: ; 0x0205FCC8
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205FCC8

	thumb_func_start sub_0205FCCC
sub_0205FCCC: ; 0x0205FCCC
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205FCCC

	thumb_func_start sub_0205FCD0
sub_0205FCD0: ; 0x0205FCD0
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205FCD0

	thumb_func_start sub_0205FCD4
sub_0205FCD4: ; 0x0205FCD4
	push {r4, lr}
	add r4, r0, #0
	bl sub_0205F25C
	mov r1, #2
	lsl r1, r1, #0xc
	cmp r0, r1
	bne _0205FCE8
	ldr r0, _0205FCFC ; =ov01_0220724C
	b _0205FCEC
_0205FCE8:
	bl sub_0205FB38
_0205FCEC:
	bl sub_0205FB28
	add r1, r0, #0
	add r0, r4, #0
	bl sub_0205F47C
	pop {r4, pc}
	nop
_0205FCFC: .word ov01_0220724C
	thumb_func_end sub_0205FCD4

	thumb_func_start sub_0205FD00
sub_0205FD00: ; 0x0205FD00
	push {r3, r4}
	cmp r1, #0
	beq _0205FD1A
	mov r3, #1
_0205FD08:
	ldr r4, [r0]
	tst r4, r3
	beq _0205FD14
	ldrh r4, [r0, #0x12]
	cmp r4, r2
	beq _0205FD1C
_0205FD14:
	add r0, #0x50
	sub r1, r1, #1
	bne _0205FD08
_0205FD1A:
	mov r0, #0
_0205FD1C:
	pop {r3, r4}
	bx lr
	thumb_func_end sub_0205FD00

	.rodata

_020FCB7C:
	.word sub_0205D09C
	.word sub_0205D0A8
	.word sub_0205D190
_020FCB88:
	.word sub_0205B828, 1
	.word 0, 3
_020FCB98:
	.short SEQ_SE_GS_ASHIOTO_A_WALK, 0
	.short SEQ_SE_GS_ASHIOTO_A, 0
	.short SEQ_SE_GS_OCHIBA, 0
	.short SEQ_SE_GS_EDAPAKI, 0
	.short SEQ_SE_GS_KUSA2, 0
	.short SEQ_SE_GS_ASHIOTO_B, 1
	.short SEQ_SE_GS_ASHIOTO_D, 1
	.short SEQ_SE_GS_ASHIOTO_D_2, 0
	.short SEQ_SE_GS_ASHIOTO_E, 0
	.short SEQ_SE_GS_ASHIOTO_B, 1
	.short SEQ_SE_GS_ASHIOTO_F, 1
	.short SEQ_SE_GS_ASHIOTO_D, 0
	.short SEQ_SE_GS_ASHIOTO_H, 0
	.short SEQ_SE_GS_ASHIOTO_G, 0
	.short SEQ_SE_DP_BOX02, 0
	.short SEQ_SE_DP_BOX01, 0

	; file boundary
