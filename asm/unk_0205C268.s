#include "constants/sndseq.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.data

_0210FACC:
	.word _020FDA84
	.word _020FDAC4
	.word _020FDB04
_0210FAD8:
	.byte 0xC2, 0x01, 0xBD, 0x01, 0xBE, 0x01, 0xBF, 0x01
	.byte 0xB0, 0x01, 0xB2, 0x01, 0xB3, 0x01, 0xBC, 0x01

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
	bl sub_0205C67C
	add r6, r0, #0
	add r0, r5, #0
	bl sub_0205C688
	add r7, r0, #0
	add r0, r5, #0
	bl sub_0205C654
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

	thumb_func_start sub_0205C654
sub_0205C654: ; 0x0205C654
	push {r3, lr}
	bl sub_0205C6DC
	bl sub_0205F2A8
	pop {r3, pc}
	thumb_func_end sub_0205C654

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

	thumb_func_start sub_0205C67C
sub_0205C67C: ; 0x0205C67C
	push {r3, lr}
	bl sub_0205C6DC
	bl sub_0205F914
	pop {r3, pc}
	thumb_func_end sub_0205C67C

	thumb_func_start sub_0205C688
sub_0205C688: ; 0x0205C688
	push {r3, lr}
	bl sub_0205C6DC
	bl sub_0205F934
	pop {r3, pc}
	thumb_func_end sub_0205C688

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
	mov r0, #0x19
	lsl r0, r0, #6
	bl PlaySE
_0205CCE4:
	add r0, r5, #0
	bl sub_0205B7A4
	cmp r0, #1
	bne _0205CCF4
	ldr r0, _0205CD60 ; =0x00000641
	bl PlaySE
_0205CCF4:
	add r0, r5, #0
	bl sub_0205B798
	add r0, r5, #0
	bl sub_0205B8AC
	cmp r0, #1
	bne _0205CD0A
	ldr r0, _0205CD64 ; =0x00000654
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
	ldr r0, _0205CD68 ; =0x00000652
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
	ldr r0, _0205CD6C ; =0x00000877
	bl PlaySE
_0205CD56:
	add r0, r4, #0
	add r1, r6, #0
	bl sub_0205CD70
_0205CD5E:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0205CD60: .word 0x00000641
_0205CD64: .word 0x00000654
_0205CD68: .word 0x00000652
_0205CD6C: .word 0x00000877
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
	ldr r0, _0205CE64 ; =_020FCB9A
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
_0205CE64: .word _020FCB9A
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
	ldr r0, _0205D078 ; =_020FCB8C
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
_0205D078: .word _020FCB8C
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
	bl sub_0205C654
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
	mov r0, #6
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
	mov r0, #6
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
	bl sub_0205C654
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
	mov r0, #6
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
	mov r0, #6
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
	mov r0, #6
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
	bl sub_0205C654
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
	mov r0, #6
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
	bl sub_0205C67C
	add r4, r0, #0
	add r0, r5, #0
	bl sub_02060F0C
	add r0, r4, r0
	str r0, [r6]
	ldr r0, [sp]
	bl sub_0205C688
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
	bl sub_0205C654
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

	thumb_func_start sub_0205E9AC
sub_0205E9AC: ; 0x0205E9AC
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
	thumb_func_end sub_0205E9AC

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
	bl sub_0205EF70
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
	ldr r5, _0205ED7C ; =0x0220724C
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
_0205ED7C: .word 0x0220724C
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

	thumb_func_start sub_0205EF70
sub_0205EF70: ; 0x0205EF70
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
	thumb_func_end sub_0205EF70

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

	thumb_func_start sub_0205F1EC
sub_0205F1EC: ; 0x0205F1EC
	str r1, [r0, #0x14]
	bx lr
	thumb_func_end sub_0205F1EC

	thumb_func_start sub_0205F1F0
sub_0205F1F0: ; 0x0205F1F0
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
	thumb_func_end sub_0205F1F0

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
	bl ov01_021F92DC
	cmp r0, #0
	bne _0205FB46
	mov r0, #0
	pop {r3, pc}
_0205FB46:
	ldrh r0, [r0, #4]
	lsl r0, r0, #0x16
	lsr r0, r0, #0x1b
	lsl r1, r0, #2
	ldr r0, _0205FB54 ; =0x02209A38
	ldr r0, [r0, r1]
	pop {r3, pc}
	.balign 4, 0
_0205FB54: .word 0x02209A38
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
	ldr r0, _0205FCFC ; =0x0220724C
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
_0205FCFC: .word 0x0220724C
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

	thumb_func_start sub_0205FD20
sub_0205FD20: ; 0x0205FD20
	push {r4, lr}
	add r4, r0, #0
	bl sub_0205F41C
	add r0, r4, #0
	bl sub_02063A14
	pop {r4, pc}
	thumb_func_end sub_0205FD20

	thumb_func_start sub_0205FD30
sub_0205FD30: ; 0x0205FD30
	push {r4, lr}
	mov r1, #2
	add r4, r0, #0
	bl sub_0205F5E8
	cmp r0, #0
	bne _0205FD94
	add r0, r4, #0
	bl sub_0205FE0C
	add r0, r4, #0
	bl sub_0205FE24
	add r0, r4, #0
	bl sub_0205FE48
	add r0, r4, #0
	mov r1, #0x10
	bl sub_0205F220
	cmp r0, #0
	beq _0205FD64
	add r0, r4, #0
	bl sub_02062400
	b _0205FD88
_0205FD64:
	add r0, r4, #0
	bl sub_0205F714
	cmp r0, #0
	bne _0205FD88
	add r0, r4, #0
	bl sub_0205FD98
	cmp r0, #1
	bne _0205FD88
	add r0, r4, #0
	bl sub_02063A1C
	cmp r0, #0
	bne _0205FD88
	add r0, r4, #0
	bl sub_0205F430
_0205FD88:
	add r0, r4, #0
	bl sub_0205FE6C
	add r0, r4, #0
	bl sub_0205FEA4
_0205FD94:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0205FD30

	thumb_func_start sub_0205FD98
sub_0205FD98: ; 0x0205FD98
	push {r4, lr}
	add r4, r0, #0
	bl sub_0205F648
	cmp r0, #1
	bne _0205FDA8
	mov r0, #1
	pop {r4, pc}
_0205FDA8:
	mov r1, #6
	add r0, r4, #0
	lsl r1, r1, #0xa
	bl sub_0205F220
	cmp r0, #0
	bne _0205FDBA
	mov r0, #1
	pop {r4, pc}
_0205FDBA:
	add r0, r4, #0
	bl sub_0205F264
	cmp r0, #0x32
	bne _0205FDC8
	mov r0, #1
	pop {r4, pc}
_0205FDC8:
	add r0, r4, #0
	bl sub_0205F264
	cmp r0, #0x30
	bne _0205FDD6
	mov r0, #1
	pop {r4, pc}
_0205FDD6:
	add r0, r4, #0
	bl sub_0205F208
	mov r1, #1
	lsl r1, r1, #0xc
	add r2, r0, #0
	tst r2, r1
	beq _0205FDF0
	lsl r1, r1, #0xb
	tst r1, r0
	bne _0205FDF0
	mov r0, #0
	pop {r4, pc}
_0205FDF0:
	mov r1, #2
	lsl r1, r1, #0xa
	tst r0, r1
	beq _0205FE06
	add r0, r4, #0
	bl sub_0205F8D0
	cmp r0, #0
	bne _0205FE06
	mov r0, #0
	pop {r4, pc}
_0205FE06:
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0205FD98

	thumb_func_start sub_0205FE0C
sub_0205FE0C: ; 0x0205FE0C
	push {r4, lr}
	mov r1, #1
	lsl r1, r1, #0xc
	add r4, r0, #0
	bl sub_0205F220
	cmp r0, #0
	beq _0205FE22
	add r0, r4, #0
	bl sub_02061070
_0205FE22:
	pop {r4, pc}
	thumb_func_end sub_0205FE0C

	thumb_func_start sub_0205FE24
sub_0205FE24: ; 0x0205FE24
	push {r4, lr}
	mov r1, #2
	lsl r1, r1, #0xa
	add r4, r0, #0
	bl sub_0205F220
	cmp r0, #0
	beq _0205FE44
	add r0, r4, #0
	bl sub_02061108
	cmp r0, #1
	bne _0205FE44
	add r0, r4, #0
	bl sub_0205F654
_0205FE44:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0205FE24

	thumb_func_start sub_0205FE48
sub_0205FE48: ; 0x0205FE48
	push {r4, lr}
	mov r1, #4
	add r4, r0, #0
	bl sub_0205F220
	cmp r0, #0
	beq _0205FE5C
	add r0, r4, #0
	bl sub_0205FEDC
_0205FE5C:
	ldr r1, _0205FE68 ; =0x00010004
	add r0, r4, #0
	bl sub_0205F214
	pop {r4, pc}
	nop
_0205FE68: .word 0x00010004
	thumb_func_end sub_0205FE48

	thumb_func_start sub_0205FE6C
sub_0205FE6C: ; 0x0205FE6C
	push {r4, lr}
	mov r1, #1
	lsl r1, r1, #0x10
	add r4, r0, #0
	bl sub_0205F220
	cmp r0, #0
	beq _0205FE84
	add r0, r4, #0
	bl sub_02060020
	b _0205FE96
_0205FE84:
	add r0, r4, #0
	mov r1, #4
	bl sub_0205F220
	cmp r0, #0
	beq _0205FE96
	add r0, r4, #0
	bl sub_0205FF6C
_0205FE96:
	ldr r1, _0205FEA0 ; =0x00010004
	add r0, r4, #0
	bl sub_0205F214
	pop {r4, pc}
	.balign 4, 0
_0205FEA0: .word 0x00010004
	thumb_func_end sub_0205FE6C

	thumb_func_start sub_0205FEA4
sub_0205FEA4: ; 0x0205FEA4
	push {r4, lr}
	mov r1, #2
	lsl r1, r1, #0x10
	add r4, r0, #0
	bl sub_0205F220
	cmp r0, #0
	beq _0205FEBC
	add r0, r4, #0
	bl sub_02060114
	b _0205FECE
_0205FEBC:
	add r0, r4, #0
	mov r1, #8
	bl sub_0205F220
	cmp r0, #0
	beq _0205FECE
	add r0, r4, #0
	bl sub_0206008C
_0205FECE:
	ldr r1, _0205FED8 ; =0x00020008
	add r0, r4, #0
	bl sub_0205F214
	pop {r4, pc}
	.balign 4, 0
_0205FED8: .word 0x00020008
	thumb_func_end sub_0205FEA4

	thumb_func_start sub_0205FEDC
sub_0205FEDC: ; 0x0205FEDC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl sub_02061108
	add r0, r5, #0
	bl sub_0205F73C
	cmp r0, #1
	bne _0205FF6A
	add r0, r5, #0
	bl sub_0205F504
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	add r0, r5, #0
	bl sub_0205F514
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	add r0, r5, #0
	bl ov01_021F9318
	add r7, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_02060AB8
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_020601BC
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_0206039C
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_020603DC
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_020601A4
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_02060698
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_02060700
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_020607D8
_0205FF6A:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0205FEDC

	thumb_func_start sub_0205FF6C
sub_0205FF6C: ; 0x0205FF6C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl sub_02061108
	add r0, r5, #0
	bl sub_0205F73C
	cmp r0, #1
	bne _0206001E
	add r0, r5, #0
	bl sub_0205F504
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	add r0, r5, #0
	bl sub_0205F514
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	add r0, r5, #0
	bl ov01_021F9318
	add r7, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_02060AB8
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_02060274
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_02060328
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_0206039C
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_020603F8
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_020606CC
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_02060704
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_02060708
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_02060770
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_020607D8
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_02060AF0
_0206001E:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0205FF6C

	thumb_func_start sub_02060020
sub_02060020: ; 0x02060020
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl sub_02061108
	add r0, r5, #0
	bl sub_0205F73C
	cmp r0, #1
	bne _0206008A
	add r0, r5, #0
	bl sub_0205F504
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	add r0, r5, #0
	bl sub_0205F514
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	add r0, r5, #0
	bl ov01_021F9318
	add r7, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_02060AB8
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_020603F8
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_020607D8
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_020603D0
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_02060AF0
_0206008A:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02060020

	thumb_func_start sub_0206008C
sub_0206008C: ; 0x0206008C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl sub_0205F514
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	add r0, r5, #0
	bl sub_0205F51C
	add r0, r5, #0
	bl sub_02061108
	add r0, r5, #0
	bl sub_0205F73C
	cmp r0, #1
	bne _02060112
	add r0, r5, #0
	bl sub_0205F504
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	add r0, r5, #0
	bl sub_0205F514
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	add r0, r5, #0
	bl ov01_021F9318
	add r7, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_020601A4
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_0206073C
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_020607A4
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_0206039C
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_020609D4
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_02060530
_02060112:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0206008C

	thumb_func_start sub_02060114
sub_02060114: ; 0x02060114
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl sub_02061108
	add r0, r5, #0
	bl sub_0205F73C
	cmp r0, #1
	bne _020601A2
	add r0, r5, #0
	bl sub_0205F504
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	add r0, r5, #0
	bl sub_0205F514
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	add r0, r5, #0
	bl ov01_021F9318
	add r7, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_020601A4
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_0206073C
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_020607A4
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_0206039C
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_020609D4
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_02060530
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_02060274
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_0206064C
_020601A2:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02060114

	thumb_func_start sub_020601A4
sub_020601A4: ; 0x020601A4
	push {lr}
	sub sp, #0xc
	add r1, sp, #0
	mov r2, #0
	str r2, [r1]
	str r2, [r1, #4]
	str r2, [r1, #8]
	bl sub_0205F9C0
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end sub_020601A4

	thumb_func_start sub_020601BC
sub_020601BC: ; 0x020601BC
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r6, r1, #0
	add r5, r0, #0
	bl sub_0205F24C
	add r4, r0, #0
	add r0, r6, #0
	bl sub_0205B6E8
	cmp r0, #1
	bne _020601EE
	cmp r4, #0xfd
	bne _020601E6
	mov r1, #2
	add r0, r5, #0
	lsl r1, r1, #8
	bl sub_0205F228
	cmp r0, #1
	beq _02060270
_020601E6:
	add r0, r5, #0
	mov r1, #0
	bl ov01_021FF070
_020601EE:
	add r0, r5, #0
	bl sub_0205F24C
	cmp r0, #0xfd
	bne _02060270
	add r0, r5, #0
	bl ov01_022055DC
	cmp r0, #0
	beq _02060270
	add r0, r5, #0
	bl sub_0205F2A8
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	add r0, r5, #0
	bl sub_0205F52C
	add r4, #0xfe
	add r6, r0, #0
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	cmp r0, #1
	bhi _02060270
	add r0, r5, #0
	add r1, sp, #8
	add r2, sp, #4
	bl ov01_02205604
	ldr r1, [sp, #8]
	ldr r2, [sp, #4]
	add r0, r6, #0
	bl sub_02054918
	add r4, r0, #0
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B6E8
	cmp r0, #1
	bne _02060254
	mov r0, #1
	str r0, [sp]
	ldr r2, [sp, #8]
	ldr r3, [sp, #4]
	add r0, r5, #0
	mov r1, #0
	bl ov01_021FF0E4
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
_02060254:
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B6F4
	cmp r0, #1
	bne _02060270
	mov r0, #1
	str r0, [sp]
	ldr r2, [sp, #8]
	ldr r3, [sp, #4]
	add r0, r5, #0
	mov r1, #0
	bl ov01_021FF964
_02060270:
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end sub_020601BC

	thumb_func_start sub_02060274
sub_02060274: ; 0x02060274
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r6, r1, #0
	add r5, r0, #0
	bl sub_0205F24C
	add r4, r0, #0
	add r0, r6, #0
	bl sub_0205B6E8
	cmp r0, #1
	bne _020602A6
	cmp r4, #0xfd
	bne _0206029E
	mov r1, #2
	add r0, r5, #0
	lsl r1, r1, #8
	bl sub_0205F228
	cmp r0, #1
	beq _02060324
_0206029E:
	add r0, r5, #0
	mov r1, #1
	bl ov01_021FF070
_020602A6:
	add r0, r5, #0
	bl sub_0205F24C
	cmp r0, #0xfd
	bne _02060324
	add r0, r5, #0
	bl ov01_022055DC
	cmp r0, #0
	beq _02060324
	add r0, r5, #0
	bl sub_0205F2A8
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	add r0, r5, #0
	bl sub_0205F52C
	add r4, #0xfe
	add r6, r0, #0
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	cmp r0, #1
	bhi _02060324
	add r0, r5, #0
	add r1, sp, #8
	add r2, sp, #4
	bl ov01_02205604
	ldr r1, [sp, #8]
	ldr r2, [sp, #4]
	add r0, r6, #0
	bl sub_02054918
	add r4, r0, #0
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B6E8
	cmp r0, #1
	bne _0206030A
	mov r1, #1
	str r1, [sp]
	ldr r2, [sp, #8]
	ldr r3, [sp, #4]
	add r0, r5, #0
	bl ov01_021FF0E4
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
_0206030A:
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B6F4
	cmp r0, #1
	bne _02060324
	mov r1, #1
	str r1, [sp]
	ldr r2, [sp, #8]
	ldr r3, [sp, #4]
	add r0, r5, #0
	bl ov01_021FF964
_02060324:
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end sub_02060274

	thumb_func_start sub_02060328
sub_02060328: ; 0x02060328
	push {r4, r5, r6, lr}
	add r4, r3, #0
	add r5, r0, #0
	ldrh r0, [r4]
	add r6, r2, #0
	lsl r0, r0, #0x15
	lsr r0, r0, #0x1c
	beq _0206039A
	add r0, r6, #0
	bl sub_0205BA94
	cmp r0, #1
	bne _0206035E
	ldrh r0, [r4]
	lsl r0, r0, #0x15
	lsr r0, r0, #0x1c
	cmp r0, #1
	bne _02060354
	add r0, r5, #0
	bl ov01_021FE3E8
	b _0206035E
_02060354:
	cmp r0, #2
	bne _0206035E
	add r0, r5, #0
	bl ov01_021FE3F4
_0206035E:
	add r0, r5, #0
	add r1, r6, #0
	bl sub_02060EA4
	cmp r0, #1
	bne _02060388
	ldrh r0, [r4]
	lsl r0, r0, #0x15
	lsr r0, r0, #0x1c
	cmp r0, #1
	bne _0206037C
	add r0, r5, #0
	bl ov01_021FE3C4
	pop {r4, r5, r6, pc}
_0206037C:
	cmp r0, #2
	bne _0206039A
	add r0, r5, #0
	bl ov01_021FE3D0
	pop {r4, r5, r6, pc}
_02060388:
	add r0, r5, #0
	add r1, r6, #0
	bl sub_02060ED4
	cmp r0, #1
	bne _0206039A
	add r0, r5, #0
	bl ov01_021FE3DC
_0206039A:
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02060328

	thumb_func_start sub_0206039C
sub_0206039C: ; 0x0206039C
	push {r4, lr}
	add r4, r0, #0
	add r0, r1, #0
	bl sub_0205B7A4
	cmp r0, #1
	bne _020603C6
	add r0, r4, #0
	bl sub_0205F808
	cmp r0, #0
	bne _020603CE
	add r0, r4, #0
	mov r1, #1
	bl ov01_021FF4FC
	add r0, r4, #0
	mov r1, #1
	bl sub_0205F7EC
	pop {r4, pc}
_020603C6:
	add r0, r4, #0
	mov r1, #0
	bl sub_0205F7EC
_020603CE:
	pop {r4, pc}
	thumb_func_end sub_0206039C

	thumb_func_start sub_020603D0
sub_020603D0: ; 0x020603D0
	ldr r3, _020603D8 ; =sub_0205F7EC
	mov r1, #0
	bx r3
	nop
_020603D8: .word sub_0205F7EC
	thumb_func_end sub_020603D0

	thumb_func_start sub_020603DC
sub_020603DC: ; 0x020603DC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r3, #0
	bl sub_0205F524
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	add r0, r5, #0
	add r1, r4, #0
	add r3, r6, #0
	bl sub_020603F8
	pop {r4, r5, r6, pc}
	thumb_func_end sub_020603DC

	thumb_func_start sub_020603F8
sub_020603F8: ; 0x020603F8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	bl sub_0205F35C
	bl sub_0205F610
	cmp r0, #0
	beq _02060416
	ldrh r0, [r7]
	lsl r0, r0, #0x19
	lsr r0, r0, #0x1d
	bne _02060418
_02060416:
	b _0206052E
_02060418:
	cmp r0, #2
	bne _020604B0
	add r0, r4, #0
	bl sub_0205B6E8
	cmp r0, #1
	beq _02060484
	add r0, r4, #0
	bl sub_0205B6F4
	cmp r0, #1
	beq _02060484
	add r0, r6, #0
	bl sub_0205B6E8
	cmp r0, #1
	beq _02060484
	add r0, r6, #0
	bl sub_0205B6F4
	cmp r0, #1
	beq _02060484
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02060E54
	cmp r0, #1
	beq _02060484
	add r0, r4, #0
	bl sub_0205B984
	cmp r0, #1
	beq _02060484
	add r0, r4, #0
	bl sub_0205B7A4
	cmp r0, #1
	beq _02060484
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02060EBC
	cmp r0, #1
	beq _02060484
	add r0, r4, #0
	bl sub_0205B8AC
	cmp r0, #1
	beq _02060484
	add r0, r4, #0
	bl sub_0205BA70
	cmp r0, #0
	beq _02060490
_02060484:
	mov r1, #1
	add r0, r5, #0
	lsl r1, r1, #0x14
	bl sub_0205F20C
	pop {r3, r4, r5, r6, r7, pc}
_02060490:
	mov r1, #2
	add r0, r5, #0
	lsl r1, r1, #0xe
	bl sub_0205F220
	cmp r0, #0
	bne _0206052E
	add r0, r5, #0
	bl ov01_021FD684
	mov r1, #2
	add r0, r5, #0
	lsl r1, r1, #0xe
	bl sub_0205F20C
	pop {r3, r4, r5, r6, r7, pc}
_020604B0:
	add r0, r4, #0
	bl sub_0205B6E8
	cmp r0, #1
	beq _02060504
	add r0, r4, #0
	bl sub_0205B6F4
	cmp r0, #1
	beq _02060504
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02060E54
	cmp r0, #1
	beq _02060504
	add r0, r4, #0
	bl sub_0205B984
	cmp r0, #1
	beq _02060504
	add r0, r4, #0
	bl sub_0205B7A4
	cmp r0, #1
	beq _02060504
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02060EBC
	cmp r0, #1
	beq _02060504
	add r0, r4, #0
	bl sub_0205B8AC
	cmp r0, #1
	beq _02060504
	add r0, r4, #0
	bl sub_0205BA70
	cmp r0, #0
	beq _02060510
_02060504:
	mov r1, #1
	add r0, r5, #0
	lsl r1, r1, #0x14
	bl sub_0205F20C
	pop {r3, r4, r5, r6, r7, pc}
_02060510:
	mov r1, #2
	add r0, r5, #0
	lsl r1, r1, #0xe
	bl sub_0205F220
	cmp r0, #0
	bne _0206052E
	add r0, r5, #0
	bl ov01_021FD640
	mov r1, #2
	add r0, r5, #0
	lsl r1, r1, #0xe
	bl sub_0205F20C
_0206052E:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_020603F8

	thumb_func_start sub_02060530
sub_02060530: ; 0x02060530
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r3, #0
	bl sub_0205F35C
	bl sub_0205F610
	cmp r0, #0
	bne _02060546
	b _0206064A
_02060546:
	ldrh r0, [r6]
	lsl r0, r0, #0x19
	lsr r0, r0, #0x1d
	beq _0206064A
	cmp r0, #2
	bne _020605E0
	add r0, r5, #0
	bl sub_0205F524
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	add r0, r4, #0
	bl sub_0205B6E8
	cmp r0, #1
	beq _020605C8
	add r0, r4, #0
	bl sub_0205B6F4
	cmp r0, #1
	beq _020605C8
	lsl r0, r6, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B6E8
	cmp r0, #1
	beq _020605C8
	lsl r0, r6, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B6F4
	cmp r0, #1
	beq _020605C8
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02060E54
	cmp r0, #1
	beq _020605C8
	add r0, r4, #0
	bl sub_0205B984
	cmp r0, #1
	beq _020605C8
	add r0, r4, #0
	bl sub_0205B7A4
	cmp r0, #1
	beq _020605C8
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02060EBC
	cmp r0, #1
	beq _020605C8
	add r0, r4, #0
	bl sub_0205B8AC
	cmp r0, #1
	beq _020605C8
	add r0, r4, #0
	bl sub_0205BA70
	cmp r0, #0
	beq _020605D4
_020605C8:
	mov r1, #1
	add r0, r5, #0
	lsl r1, r1, #0x14
	bl sub_0205F20C
	pop {r4, r5, r6, pc}
_020605D4:
	mov r1, #1
	add r0, r5, #0
	lsl r1, r1, #0x14
	bl sub_0205F214
	pop {r4, r5, r6, pc}
_020605E0:
	add r0, r4, #0
	bl sub_0205B6E8
	cmp r0, #1
	beq _02060634
	add r0, r4, #0
	bl sub_0205B6F4
	cmp r0, #1
	beq _02060634
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02060E54
	cmp r0, #1
	beq _02060634
	add r0, r4, #0
	bl sub_0205B984
	cmp r0, #1
	beq _02060634
	add r0, r4, #0
	bl sub_0205B7A4
	cmp r0, #1
	beq _02060634
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02060EBC
	cmp r0, #1
	beq _02060634
	add r0, r4, #0
	bl sub_0205B8AC
	cmp r0, #1
	beq _02060634
	add r0, r4, #0
	bl sub_0205BA70
	cmp r0, #0
	beq _02060640
_02060634:
	mov r1, #1
	add r0, r5, #0
	lsl r1, r1, #0x14
	bl sub_0205F20C
	pop {r4, r5, r6, pc}
_02060640:
	mov r1, #1
	add r0, r5, #0
	lsl r1, r1, #0x14
	bl sub_0205F214
_0206064A:
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02060530

	thumb_func_start sub_0206064C
sub_0206064C: ; 0x0206064C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_02060E54
	cmp r0, #1
	beq _02060694
	add r0, r4, #0
	bl sub_0205B7A4
	cmp r0, #1
	beq _02060694
	add r0, r4, #0
	bl sub_0205B828
	cmp r0, #1
	beq _02060694
	add r0, r4, #0
	bl sub_0205B8AC
	cmp r0, #1
	beq _02060694
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02060EBC
	cmp r0, #1
	beq _02060694
	add r0, r5, #0
	bl sub_0205F684
	cmp r0, #0
	bne _02060694
	add r0, r5, #0
	bl ov01_021FF74C
_02060694:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0206064C

	thumb_func_start sub_02060698
sub_02060698: ; 0x02060698
	push {r4, r5, r6, lr}
	add r6, r1, #0
	add r5, r0, #0
	bl sub_0205F24C
	add r4, r0, #0
	add r0, r6, #0
	bl sub_0205B6F4
	cmp r0, #1
	bne _020606C8
	cmp r4, #0xfd
	bne _020606C0
	mov r1, #2
	add r0, r5, #0
	lsl r1, r1, #8
	bl sub_0205F228
	cmp r0, #1
	beq _020606C8
_020606C0:
	add r0, r5, #0
	mov r1, #0
	bl ov01_021FF8F0
_020606C8:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02060698

	thumb_func_start sub_020606CC
sub_020606CC: ; 0x020606CC
	push {r4, r5, r6, lr}
	add r6, r1, #0
	add r5, r0, #0
	bl sub_0205F24C
	add r4, r0, #0
	add r0, r6, #0
	bl sub_0205B6F4
	cmp r0, #1
	bne _020606FC
	cmp r4, #0xfd
	bne _020606F4
	mov r1, #2
	add r0, r5, #0
	lsl r1, r1, #8
	bl sub_0205F228
	cmp r0, #1
	beq _020606FC
_020606F4:
	add r0, r5, #0
	mov r1, #1
	bl ov01_021FF8F0
_020606FC:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_020606CC

	thumb_func_start sub_02060700
sub_02060700: ; 0x02060700
	bx lr
	.balign 4, 0
	thumb_func_end sub_02060700

	thumb_func_start sub_02060704
sub_02060704: ; 0x02060704
	bx lr
	.balign 4, 0
	thumb_func_end sub_02060704

	thumb_func_start sub_02060708
sub_02060708: ; 0x02060708
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, r2, #0
	bl sub_0205B984
	cmp r0, #1
	bne _02060738
	add r0, r5, #0
	bl sub_0205F8FC
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0205F904
	add r6, r0, #0
	add r0, r5, #0
	bl sub_0205F90C
	add r3, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl ov01_021FECA0
_02060738:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02060708

	thumb_func_start sub_0206073C
sub_0206073C: ; 0x0206073C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, r1, #0
	bl sub_0205B984
	cmp r0, #1
	bne _0206076C
	add r0, r5, #0
	bl sub_0205F914
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0205F924
	add r6, r0, #0
	add r0, r5, #0
	bl sub_0205F934
	add r3, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl ov01_021FECA0
_0206076C:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0206073C

	thumb_func_start sub_02060770
sub_02060770: ; 0x02060770
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, r2, #0
	bl sub_0205B8AC
	cmp r0, #1
	bne _020607A0
	add r0, r5, #0
	bl sub_0205F8FC
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0205F904
	add r6, r0, #0
	add r0, r5, #0
	bl sub_0205F90C
	add r3, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl ov01_021FEE04
_020607A0:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02060770

	thumb_func_start sub_020607A4
sub_020607A4: ; 0x020607A4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, r1, #0
	bl sub_0205B8AC
	cmp r0, #1
	bne _020607D4
	add r0, r5, #0
	bl sub_0205F914
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0205F924
	add r6, r0, #0
	add r0, r5, #0
	bl sub_0205F934
	add r3, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl ov01_021FEE04
_020607D4:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_020607A4

	thumb_func_start sub_020607D8
sub_020607D8: ; 0x020607D8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r6, r1, #0
	ldrh r1, [r3]
	add r5, r0, #0
	lsl r1, r1, #0x13
	lsr r1, r1, #0x1e
	beq _020607F0
	bl sub_0205F870
	cmp r0, #1
	bne _020607F2
_020607F0:
	b _020609CE
_020607F2:
	bl sub_0205BA6C
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0205F24C
	cmp r0, #0xfd
	beq _02060804
	b _0206096A
_02060804:
	add r0, r5, #0
	bl ov01_022055DC
	cmp r0, #0
	beq _02060902
	add r0, r5, #0
	bl sub_0205F870
	cmp r0, #0
	beq _0206081A
	b _020609CE
_0206081A:
	add r0, r6, #0
	bl sub_0205B9B8
	cmp r0, #1
	bne _02060828
	add r4, r6, #0
	b _020608CA
_02060828:
	add r0, r5, #0
	mov r1, #1
	bl sub_02060FA8
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0xc]
	add r0, r5, #0
	mov r1, #3
	bl sub_02060FA8
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	add r0, r5, #0
	mov r1, #2
	bl sub_02060FA8
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	add r0, r5, #0
	mov r1, #4
	bl ov01_022056C4
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	add r0, r5, #0
	mov r1, #5
	bl ov01_022056C4
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
	ldr r0, [sp, #0xc]
	mov r6, #0
	bl sub_0205B9B8
	cmp r0, #1
	bne _02060880
	ldr r0, [sp, #0xc]
	mov r6, #1
	str r0, [sp, #0x10]
	b _020608C4
_02060880:
	ldr r0, [sp, #8]
	bl sub_0205B9B8
	cmp r0, #1
	bne _02060892
	ldr r0, [sp, #8]
	mov r6, #1
	str r0, [sp, #0x10]
	b _020608C4
_02060892:
	ldr r0, [sp, #4]
	bl sub_0205B9B8
	cmp r0, #1
	bne _020608A4
	ldr r0, [sp, #4]
	mov r6, #1
	str r0, [sp, #0x10]
	b _020608C4
_020608A4:
	ldr r0, [sp]
	bl sub_0205B9B8
	cmp r0, #1
	bne _020608B6
	ldr r0, [sp]
	mov r6, #1
	str r0, [sp, #0x10]
	b _020608C4
_020608B6:
	add r0, r7, #0
	bl sub_0205B9B8
	cmp r0, #1
	bne _020608C4
	str r7, [sp, #0x10]
	mov r6, #1
_020608C4:
	cmp r6, #1
	bne _020608CA
	ldr r4, [sp, #0x10]
_020608CA:
	bl sub_0205BA6C
	cmp r4, r0
	beq _020609CE
	add r0, r5, #0
	mov r1, #1
	bl sub_0205F854
	add r0, r4, #0
	bl sub_0205BA70
	cmp r0, #1
	bne _020608E8
	mov r1, #5
	b _020608F8
_020608E8:
	add r0, r4, #0
	bl sub_0205B984
	cmp r0, #1
	bne _020608F6
	mov r1, #3
	b _020608F8
_020608F6:
	mov r1, #4
_020608F8:
	add r0, r5, #0
	bl ov01_021FDF88
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
_02060902:
	add r0, r5, #0
	bl sub_0205F870
	cmp r0, #0
	bne _020609CE
	add r0, r6, #0
	bl sub_0205B9B8
	cmp r0, #1
	bne _0206091A
	add r4, r6, #0
	b _02060932
_0206091A:
	add r0, r5, #0
	mov r1, #1
	bl sub_02060FA8
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	add r0, r6, #0
	bl sub_0205B9B8
	cmp r0, #1
	bne _02060932
	add r4, r6, #0
_02060932:
	bl sub_0205BA6C
	cmp r4, r0
	beq _020609CE
	add r0, r5, #0
	mov r1, #1
	bl sub_0205F854
	add r0, r4, #0
	bl sub_0205BA70
	cmp r0, #1
	bne _02060950
	mov r1, #2
	b _02060960
_02060950:
	add r0, r4, #0
	bl sub_0205B984
	cmp r0, #1
	bne _0206095E
	mov r1, #0
	b _02060960
_0206095E:
	mov r1, #1
_02060960:
	add r0, r5, #0
	bl ov01_021FDF88
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
_0206096A:
	add r0, r5, #0
	bl sub_0205F870
	cmp r0, #0
	bne _020609CE
	add r0, r6, #0
	bl sub_0205B9B8
	cmp r0, #1
	bne _02060982
	add r4, r6, #0
	b _0206099A
_02060982:
	add r0, r5, #0
	mov r1, #1
	bl sub_02060FA8
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	add r0, r6, #0
	bl sub_0205B9B8
	cmp r0, #1
	bne _0206099A
	add r4, r6, #0
_0206099A:
	bl sub_0205BA6C
	cmp r4, r0
	beq _020609CE
	add r0, r5, #0
	mov r1, #1
	bl sub_0205F854
	add r0, r4, #0
	bl sub_0205BA70
	cmp r0, #1
	bne _020609B8
	mov r1, #2
	b _020609C8
_020609B8:
	add r0, r4, #0
	bl sub_0205B984
	cmp r0, #1
	bne _020609C6
	mov r1, #0
	b _020609C8
_020609C6:
	mov r1, #1
_020609C8:
	add r0, r5, #0
	bl ov01_021FDA74
_020609CE:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_020607D8

	thumb_func_start sub_020609D4
sub_020609D4: ; 0x020609D4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldrh r1, [r3]
	add r5, r0, #0
	lsl r1, r1, #0x13
	lsr r1, r1, #0x1e
	beq _02060AB2
	bl sub_0205F870
	cmp r0, #0
	beq _02060AB2
	add r0, r5, #0
	bl sub_0205F24C
	cmp r0, #0xfd
	bne _02060A96
	add r0, r5, #0
	bl ov01_022055DC
	cmp r0, #0
	beq _02060A96
	add r0, r5, #0
	mov r1, #1
	bl sub_02060FA8
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	add r0, r5, #0
	mov r1, #3
	bl sub_02060FA8
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	add r0, r5, #0
	mov r1, #2
	bl sub_02060FA8
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	add r0, r5, #0
	mov r1, #4
	bl ov01_022056C4
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
	add r0, r5, #0
	mov r1, #5
	bl ov01_022056C4
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	ldr r0, [sp, #8]
	mov r4, #0
	bl sub_0205B9B8
	cmp r0, #1
	bne _02060A50
	mov r4, #1
	b _02060A86
_02060A50:
	ldr r0, [sp, #4]
	bl sub_0205B9B8
	cmp r0, #1
	bne _02060A5E
	mov r4, #1
	b _02060A86
_02060A5E:
	ldr r0, [sp]
	bl sub_0205B9B8
	cmp r0, #1
	bne _02060A6C
	mov r4, #1
	b _02060A86
_02060A6C:
	add r0, r7, #0
	bl sub_0205B9B8
	cmp r0, #1
	bne _02060A7A
	mov r4, #1
	b _02060A86
_02060A7A:
	add r0, r6, #0
	bl sub_0205B9B8
	cmp r0, #1
	bne _02060A86
	mov r4, #1
_02060A86:
	cmp r4, #0
	bne _02060AB2
	add r0, r5, #0
	mov r1, #0
	bl sub_0205F854
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_02060A96:
	add r0, r5, #0
	mov r1, #1
	bl sub_02060FA8
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B9B8
	cmp r0, #0
	bne _02060AB2
	add r0, r5, #0
	mov r1, #0
	bl sub_0205F854
_02060AB2:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_020609D4

	thumb_func_start sub_02060AB8
sub_02060AB8: ; 0x02060AB8
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	bl sub_0205BA24
	cmp r0, #1
	bne _02060AD2
	add r0, r5, #0
	mov r1, #1
	bl sub_0205F820
	pop {r3, r4, r5, pc}
_02060AD2:
	add r0, r5, #0
	bl sub_0205F83C
	cmp r0, #1
	bne _02060AEE
	add r0, r4, #0
	bl sub_0205BA30
	cmp r0, #0
	bne _02060AEE
	add r0, r5, #0
	mov r1, #0
	bl sub_0205F820
_02060AEE:
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02060AB8

	thumb_func_start sub_02060AF0
sub_02060AF0: ; 0x02060AF0
	bx lr
	.balign 4, 0
	thumb_func_end sub_02060AF0

	thumb_func_start sub_02060AF4
sub_02060AF4: ; 0x02060AF4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	ldr r7, [sp, #0x28]
	add r5, r2, #0
	str r1, [sp, #4]
	str r3, [sp, #8]
	add r2, r3, #0
	add r1, r5, #0
	add r3, r7, #0
	add r6, r0, #0
	mov r4, #0
	bl sub_02060D94
	cmp r0, #1
	bne _02060B16
	mov r0, #1
	orr r4, r0
_02060B16:
	add r0, r6, #0
	bl sub_0205F52C
	add r1, sp, #0xc
	str r1, [sp]
	ldr r1, [sp, #4]
	add r2, r5, #0
	add r3, r7, #0
	bl sub_020549A8
	cmp r0, #1
	bne _02060B40
	mov r0, #2
	orr r4, r0
	add r1, sp, #0xc
	mov r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _02060B40
	mov r0, #8
	orr r4, r0
_02060B40:
	ldr r3, [sp, #0x2c]
	add r0, r6, #0
	add r1, r5, #0
	add r2, r7, #0
	bl sub_02060DEC
	cmp r0, #1
	bne _02060B54
	mov r0, #2
	orr r4, r0
_02060B54:
	bl sub_0203993C
	bl sub_0203401C
	cmp r0, #0
	beq _02060B76
	ldr r2, [sp, #8]
	add r0, r6, #0
	add r1, r5, #0
	add r3, r7, #0
	bl sub_02060BFC
	cmp r0, #1
	bne _02060B8A
	mov r0, #4
	orr r4, r0
	b _02060B8A
_02060B76:
	ldr r2, [sp, #8]
	add r0, r6, #0
	add r1, r5, #0
	add r3, r7, #0
	bl sub_02060CA8
	cmp r0, #1
	bne _02060B8A
	mov r0, #4
	orr r4, r0
_02060B8A:
	add r0, r4, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02060AF4

	thumb_func_start sub_02060B90
sub_02060B90: ; 0x02060B90
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r6, r1, #0
	add r1, sp, #8
	add r5, r0, #0
	add r7, r2, #0
	add r4, r3, #0
	bl sub_0205F944
	ldr r0, [sp, #0x28]
	str r4, [sp]
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, sp, #8
	add r2, r6, #0
	add r3, r7, #0
	bl sub_02060AF4
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end sub_02060B90

	thumb_func_start sub_02060BB8
sub_02060BB8: ; 0x02060BB8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r5, r0, #0
	bl sub_0205F914
	add r6, r0, #0
	add r0, r4, #0
	bl sub_02060F0C
	add r7, r0, #0
	add r0, r5, #0
	bl sub_0205F924
	str r0, [sp, #4]
	add r0, r5, #0
	bl sub_0205F934
	str r0, [sp, #8]
	add r0, r4, #0
	bl sub_02060F18
	str r4, [sp]
	add r3, r0, #0
	ldr r4, [sp, #8]
	ldr r2, [sp, #4]
	add r0, r5, #0
	add r1, r6, r7
	add r3, r4, r3
	bl sub_02060B90
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02060BB8

	thumb_func_start sub_02060BFC
sub_02060BFC: ; 0x02060BFC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp]
	add r4, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	bl sub_0205F35C
	add r5, r0, #0
	bl sub_0205F1AC
	str r0, [sp, #8]
	add r0, r5, #0
	bl sub_0205F168
	str r0, [sp, #4]
_02060C1C:
	ldr r0, [sp, #8]
	ldr r1, [sp]
	cmp r0, r1
	beq _02060C94
	mov r1, #1
	bl sub_0205F220
	cmp r0, #0
	beq _02060C94
	mov r1, #1
	ldr r0, [sp, #8]
	lsl r1, r1, #0x12
	bl sub_0205F220
	cmp r0, #0
	bne _02060C94
	ldr r0, [sp, #8]
	bl sub_0205F914
	add r5, r0, #0
	ldr r0, [sp, #8]
	bl sub_0205F934
	cmp r5, r4
	bne _02060C68
	cmp r0, r7
	bne _02060C68
	ldr r0, [sp, #8]
	bl sub_0205F924
	sub r0, r0, r6
	bpl _02060C5E
	neg r0, r0
_02060C5E:
	cmp r0, #2
	bge _02060C68
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_02060C68:
	ldr r0, [sp, #8]
	bl sub_0205F8FC
	add r5, r0, #0
	ldr r0, [sp, #8]
	bl sub_0205F90C
	cmp r5, r4
	bne _02060C94
	cmp r0, r7
	bne _02060C94
	ldr r0, [sp, #8]
	bl sub_0205F924
	sub r0, r0, r6
	bpl _02060C8A
	neg r0, r0
_02060C8A:
	cmp r0, #2
	bge _02060C94
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_02060C94:
	add r0, sp, #8
	bl sub_0205F1C4
	ldr r0, [sp, #4]
	sub r0, r0, #1
	str r0, [sp, #4]
	bne _02060C1C
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end sub_02060BFC

	thumb_func_start sub_02060CA8
sub_02060CA8: ; 0x02060CA8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r0, [sp]
	add r5, r1, #0
	add r4, r2, #0
	add r6, r3, #0
	bl sub_0205F35C
	add r7, r0, #0
	bl sub_0205F1AC
	str r0, [sp, #4]
	add r0, r7, #0
	bl sub_0205F168
	add r7, r0, #0
_02060CC8:
	ldr r0, [sp, #4]
	ldr r1, [sp]
	cmp r0, r1
	beq _02060D84
	mov r1, #1
	bl sub_0205F220
	cmp r0, #0
	beq _02060D84
	ldr r0, [sp, #4]
	bl sub_0205F914
	str r0, [sp, #0xc]
	ldr r0, [sp, #4]
	bl sub_0205F934
	ldr r1, [sp, #0xc]
	str r0, [sp, #8]
	cmp r1, r5
	bne _02060D0A
	cmp r0, r6
	bne _02060D0A
	ldr r0, [sp, #4]
	bl sub_0205F924
	sub r0, r0, r4
	bpl _02060D00
	neg r0, r0
_02060D00:
	cmp r0, #2
	bge _02060D0A
	add sp, #0x10
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02060D0A:
	ldr r0, [sp, #4]
	bl sub_0205F8FC
	str r0, [sp, #0xc]
	ldr r0, [sp, #4]
	bl sub_0205F90C
	ldr r1, [sp, #0xc]
	str r0, [sp, #8]
	cmp r1, r5
	bne _02060D3A
	cmp r0, r6
	bne _02060D3A
	ldr r0, [sp, #4]
	bl sub_0205F924
	sub r0, r0, r4
	bpl _02060D30
	neg r0, r0
_02060D30:
	cmp r0, #2
	bge _02060D3A
	add sp, #0x10
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02060D3A:
	ldr r0, [sp, #4]
	bl sub_0205F24C
	cmp r0, #0xfd
	bne _02060D84
	ldr r0, [sp, #4]
	bl ov01_022055DC
	cmp r0, #0
	beq _02060D84
	ldr r0, [sp, #4]
	bl sub_0205F684
	cmp r0, #0
	bne _02060D84
	ldr r0, [sp, #4]
	add r1, sp, #0xc
	add r2, sp, #8
	bl ov01_02205664
	ldr r0, [sp, #0xc]
	cmp r0, r5
	bne _02060D84
	ldr r0, [sp, #8]
	cmp r0, r6
	bne _02060D84
	ldr r0, [sp, #4]
	bl sub_0205F924
	sub r0, r0, r4
	bpl _02060D7A
	neg r0, r0
_02060D7A:
	cmp r0, #2
	bge _02060D84
	add sp, #0x10
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02060D84:
	add r0, sp, #4
	bl sub_0205F1C4
	sub r7, r7, #1
	bne _02060CC8
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02060CA8

	thumb_func_start sub_02060D94
sub_02060D94: ; 0x02060D94
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r5, r1, #0
	add r4, r3, #0
	bl sub_0205F8E4
	add r7, r0, #0
	add r0, r6, #0
	bl sub_0205F31C
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _02060DC0
	add r1, r7, r0
	sub r0, r7, r0
	cmp r0, r5
	bgt _02060DBC
	cmp r1, r5
	bge _02060DC0
_02060DBC:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02060DC0:
	add r0, r6, #0
	bl sub_0205F8F4
	add r5, r0, #0
	add r0, r6, #0
	bl sub_0205F324
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _02060DE6
	add r1, r5, r0
	sub r0, r5, r0
	cmp r0, r4
	bgt _02060DE2
	cmp r1, r4
	bge _02060DE6
_02060DE2:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02060DE6:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02060D94

	thumb_func_start sub_02060DEC
sub_02060DEC: ; 0x02060DEC
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	add r6, r1, #0
	add r7, r2, #0
	add r5, r3, #0
	bl sub_0205F8D0
	cmp r0, #0
	bne _02060E46
	add r0, r4, #0
	bl sub_0205F52C
	str r0, [sp]
	add r0, r4, #0
	bl sub_0205F504
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	ldr r0, [sp]
	add r1, r6, #0
	add r2, r7, #0
	bl sub_02054918
	add r6, r0, #0
	bl sub_0205BA6C
	cmp r6, r0
	bne _02060E28
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02060E28:
	ldr r1, _02060E4C ; =_020FD4CC
	lsl r5, r5, #2
	ldr r1, [r1, r5]
	add r0, r4, #0
	blx r1
	cmp r0, #1
	beq _02060E42
	ldr r1, _02060E50 ; =_020FD4BC
	add r0, r6, #0
	ldr r1, [r1, r5]
	blx r1
	cmp r0, #1
	bne _02060E46
_02060E42:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02060E46:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02060E4C: .word _020FD4CC
_02060E50: .word _020FD4BC
	thumb_func_end sub_02060DEC

	thumb_func_start sub_02060E54
sub_02060E54: ; 0x02060E54
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	bl sub_0205BA54
	cmp r0, #0
	beq _02060E74
	add r0, r5, #0
	bl sub_0205F83C
	cmp r0, #0
	bne _02060EA0
	mov r0, #1
	pop {r3, r4, r5, pc}
_02060E74:
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B778
	cmp r0, #0
	beq _02060E84
	mov r0, #1
	pop {r3, r4, r5, pc}
_02060E84:
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B78C
	cmp r0, #0
	beq _02060EA0
	add r0, r5, #0
	bl sub_0205F25C
	sub r0, #0xb2
	cmp r0, #1
	bhi _02060EA0
	mov r0, #1
	pop {r3, r4, r5, pc}
_02060EA0:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02060E54

	thumb_func_start sub_02060EA4
sub_02060EA4: ; 0x02060EA4
	push {r3, lr}
	lsl r0, r1, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B798
	cmp r0, #0
	beq _02060EB6
	mov r0, #1
	pop {r3, pc}
_02060EB6:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02060EA4

	thumb_func_start sub_02060EBC
sub_02060EBC: ; 0x02060EBC
	push {r3, lr}
	lsl r0, r1, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B8B8
	cmp r0, #0
	beq _02060ECE
	mov r0, #1
	pop {r3, pc}
_02060ECE:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02060EBC

	thumb_func_start sub_02060ED4
sub_02060ED4: ; 0x02060ED4
	push {r3, lr}
	lsl r0, r1, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B8C4
	cmp r0, #0
	beq _02060EE6
	mov r0, #1
	pop {r3, pc}
_02060EE6:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02060ED4

	thumb_func_start sub_02060EEC
sub_02060EEC: ; 0x02060EEC
	push {r4, lr}
	add r4, r1, #0
	bl sub_0205F83C
	cmp r0, #1
	bne _02060F08
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	bl sub_0205BA30
	cmp r0, #1
	bne _02060F08
	mov r0, #1
	pop {r4, pc}
_02060F08:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end sub_02060EEC

	thumb_func_start sub_02060F0C
sub_02060F0C: ; 0x02060F0C
	lsl r1, r0, #2
	ldr r0, _02060F14 ; =_020FD4AC
	ldr r0, [r0, r1]
	bx lr
	.balign 4, 0
_02060F14: .word _020FD4AC
	thumb_func_end sub_02060F0C

	thumb_func_start sub_02060F18
sub_02060F18: ; 0x02060F18
	lsl r1, r0, #2
	ldr r0, _02060F20 ; =_020FD49C
	ldr r0, [r0, r1]
	bx lr
	.balign 4, 0
_02060F20: .word _020FD49C
	thumb_func_end sub_02060F18

	thumb_func_start sub_02060F24
sub_02060F24: ; 0x02060F24
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0205F914
	add r1, r0, #0
	add r0, r5, #0
	bl sub_0205F900
	add r0, r5, #0
	bl sub_0205F924
	add r1, r0, #0
	add r0, r5, #0
	bl sub_0205F908
	add r0, r5, #0
	bl sub_0205F934
	add r1, r0, #0
	add r0, r5, #0
	bl sub_0205F910
	add r0, r4, #0
	bl sub_02060F0C
	add r1, r0, #0
	add r0, r5, #0
	bl sub_0205F91C
	add r0, r5, #0
	mov r1, #0
	bl sub_0205F92C
	add r0, r4, #0
	bl sub_02060F18
	add r1, r0, #0
	add r0, r5, #0
	bl sub_0205F93C
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02060F24

	thumb_func_start sub_02060F78
sub_02060F78: ; 0x02060F78
	push {r4, lr}
	add r4, r0, #0
	bl sub_0205F914
	add r1, r0, #0
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
	add r0, r4, #0
	bl sub_0205F910
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02060F78

	thumb_func_start sub_02060FA8
sub_02060FA8: ; 0x02060FA8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r4, r0, #0
	bl sub_0205F914
	add r6, r0, #0
	add r0, r5, #0
	bl sub_02060F0C
	add r7, r0, #0
	add r0, r4, #0
	bl sub_0205F934
	str r0, [sp]
	add r0, r5, #0
	bl sub_02060F18
	add r5, r0, #0
	add r0, r4, #0
	bl sub_0205F52C
	ldr r2, [sp]
	add r1, r6, r7
	add r2, r2, r5
	bl sub_02054918
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02060FA8

	thumb_func_start sub_02060FE0
sub_02060FE0: ; 0x02060FE0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r4, r0, #0
	bl sub_0205F914
	add r6, r0, #0
	add r0, r5, #0
	bl sub_02060F0C
	add r7, r0, #0
	add r0, r4, #0
	bl sub_0205F934
	str r0, [sp]
	add r0, r5, #0
	bl sub_02060F18
	add r5, r0, #0
	add r0, r4, #0
	bl sub_0205F52C
	ldr r2, [sp]
	add r1, r6, r7
	add r2, r2, r5
	bl sub_020548EC
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02060FE0

	thumb_func_start sub_0206101C
sub_0206101C: ; 0x0206101C
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r1, #0
	add r1, sp, #0
	add r6, r0, #0
	add r4, r2, #0
	bl sub_0205F944
	cmp r5, #3
	bhi _02061062
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0206103C: ; jump table
	.short _02061044 - _0206103C - 2 ; case 0
	.short _0206104C - _0206103C - 2 ; case 1
	.short _02061054 - _0206103C - 2 ; case 2
	.short _0206105C - _0206103C - 2 ; case 3
_02061044:
	ldr r0, [sp, #8]
	sub r0, r0, r4
	str r0, [sp, #8]
	b _02061062
_0206104C:
	ldr r0, [sp, #8]
	add r0, r0, r4
	str r0, [sp, #8]
	b _02061062
_02061054:
	ldr r0, [sp]
	sub r0, r0, r4
	str r0, [sp]
	b _02061062
_0206105C:
	ldr r0, [sp]
	add r0, r0, r4
	str r0, [sp]
_02061062:
	add r0, r6, #0
	add r1, sp, #0
	bl sub_0205F954
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0206101C

	thumb_func_start sub_02061070
sub_02061070: ; 0x02061070
	push {r3, r4, r5, lr}
	sub sp, #0x18
	add r1, sp, #0xc
	add r5, r0, #0
	bl sub_0205F944
	add r3, sp, #0xc
	ldmia r3!, {r0, r1}
	add r2, sp, #0
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	add r0, r5, #0
	bl sub_0205F784
	cmp r0, #1
	bne _020610A2
	mov r1, #1
	add r0, r5, #0
	lsl r1, r1, #0xc
	bl sub_0205F214
	add sp, #0x18
	mov r0, #0
	pop {r3, r4, r5, pc}
_020610A2:
	add r0, r5, #0
	bl sub_0205F8B8
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0205F52C
	add r1, sp, #0
	add r2, r4, #0
	bl sub_02061248
	add r4, r0, #0
	cmp r4, #1
	bne _020610F6
	ldr r0, [sp, #4]
	add r1, sp, #0xc
	str r0, [sp, #0x10]
	add r0, r5, #0
	bl sub_0205F954
	add r0, r5, #0
	bl sub_0205F924
	add r1, r0, #0
	add r0, r5, #0
	bl sub_0205F908
	ldr r1, [sp, #0x10]
	add r0, r5, #0
	asr r2, r1, #3
	asr r1, r2, #0xb
	lsr r1, r1, #0x14
	add r1, r2, r1
	asr r1, r1, #0xc
	bl sub_0205F928
	mov r1, #1
	add r0, r5, #0
	lsl r1, r1, #0xc
	bl sub_0205F214
	b _02061100
_020610F6:
	mov r1, #1
	add r0, r5, #0
	lsl r1, r1, #0xc
	bl sub_0205F20C
_02061100:
	add r0, r4, #0
	add sp, #0x18
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02061070

	thumb_func_start sub_02061108
sub_02061108: ; 0x02061108
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl sub_0205BA6C
	add r6, r0, #0
	add r0, r5, #0
	add r4, r6, #0
	bl sub_0205F8D0
	cmp r0, #0
	bne _0206115A
	add r0, r5, #0
	bl sub_0205F8FC
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0205F90C
	add r6, r0, #0
	add r0, r5, #0
	bl sub_0205F52C
	add r1, r4, #0
	add r2, r6, #0
	add r7, r0, #0
	bl sub_02054918
	add r6, r0, #0
	add r0, r5, #0
	bl sub_0205F914
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0205F934
	add r2, r0, #0
	add r0, r7, #0
	add r1, r4, #0
	bl sub_02054918
	add r4, r0, #0
_0206115A:
	add r0, r5, #0
	add r1, r6, #0
	bl sub_0205F50C
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205F4FC
	add r0, r4, #0
	bl sub_0205BA60
	cmp r0, #1
	bne _02061182
	mov r1, #2
	add r0, r5, #0
	lsl r1, r1, #0xa
	bl sub_0205F20C
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02061182:
	mov r1, #2
	add r0, r5, #0
	lsl r1, r1, #0xa
	bl sub_0205F214
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02061108

	thumb_func_start sub_02061190
sub_02061190: ; 0x02061190
	cmp r0, #3
	bhi _020611C6
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_020611A0: ; jump table
	.short _020611A8 - _020611A0 - 2 ; case 0
	.short _020611B0 - _020611A0 - 2 ; case 1
	.short _020611B8 - _020611A0 - 2 ; case 2
	.short _020611C0 - _020611A0 - 2 ; case 3
_020611A8:
	ldr r0, [r1, #8]
	sub r0, r0, r2
	str r0, [r1, #8]
	bx lr
_020611B0:
	ldr r0, [r1, #8]
	add r0, r0, r2
	str r0, [r1, #8]
	bx lr
_020611B8:
	ldr r0, [r1]
	sub r0, r0, r2
	str r0, [r1]
	bx lr
_020611C0:
	ldr r0, [r1]
	add r0, r0, r2
	str r0, [r1]
_020611C6:
	bx lr
	thumb_func_end sub_02061190

	thumb_func_start sub_020611C8
sub_020611C8: ; 0x020611C8
	lsl r3, r0, #0x10
	mov r0, #2
	lsl r0, r0, #0xe
	add r3, r3, r0
	lsl r1, r1, #0x10
	str r3, [r2]
	add r0, r1, r0
	str r0, [r2, #8]
	bx lr
	.balign 4, 0
	thumb_func_end sub_020611C8

	thumb_func_start sub_020611DC
sub_020611DC: ; 0x020611DC
	push {r4, lr}
	add r4, r0, #0
	bl sub_0205F264
	sub r0, #0x33
	cmp r0, #3
	bhi _020611F0
	add r0, r4, #0
	bl sub_0205F430
_020611F0:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020611DC

	thumb_func_start sub_020611F4
sub_020611F4: ; 0x020611F4
	lsl r1, r0, #2
	ldr r0, _020611FC ; =_020FD4DC
	ldr r0, [r0, r1]
	bx lr
	.balign 4, 0
_020611FC: .word _020FD4DC
	thumb_func_end sub_020611F4

	thumb_func_start sub_02061200
sub_02061200: ; 0x02061200
	cmp r0, r2
	ble _02061208
	mov r0, #2
	bx lr
_02061208:
	cmp r0, r2
	bge _02061210
	mov r0, #3
	bx lr
_02061210:
	cmp r1, r3
	bgt _02061218
	mov r0, #1
	bx lr
_02061218:
	mov r0, #0
	bx lr
	thumb_func_end sub_02061200

	thumb_func_start sub_0206121C
sub_0206121C: ; 0x0206121C
	push {r4, lr}
	sub sp, #8
	add r4, r1, #0
	add r1, sp, #4
	str r1, [sp]
	ldr r1, [r4, #4]
	ldr r2, [r4]
	ldr r3, [r4, #8]
	bl sub_02054940
	add r1, sp, #4
	ldrb r1, [r1]
	cmp r1, #0
	bne _0206123E
	add sp, #8
	mov r0, #0
	pop {r4, pc}
_0206123E:
	str r0, [r4, #4]
	mov r0, #1
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0206121C

	thumb_func_start sub_02061248
sub_02061248: ; 0x02061248
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r1, #0
	add r1, sp, #4
	str r1, [sp]
	add r4, r2, #0
	ldr r1, [r5, #4]
	ldr r2, [r5]
	ldr r3, [r5, #8]
	bl sub_02054940
	add r1, sp, #4
	ldrb r1, [r1]
	cmp r1, #0
	bne _0206126C
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, pc}
_0206126C:
	cmp r1, #2
	bne _0206127A
	cmp r4, #0
	bne _0206127A
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, pc}
_0206127A:
	str r0, [r5, #4]
	mov r0, #1
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02061248

	thumb_func_start sub_02061284
sub_02061284: ; 0x02061284
	push {r4, r5, r6, lr}
	add r6, r1, #0
	mov r1, #8
	add r5, r0, #0
	bl sub_0205F370
	add r4, r0, #0
	mov r1, #0
	ldr r0, _020612B0 ; =_020FD7B8
	mvn r1, r1
	bl sub_02061E20
	strh r0, [r4, #2]
	add r0, r5, #0
	mov r1, #0
	str r6, [r4, #4]
	bl sub_0205F328
	add r0, r5, #0
	bl sub_0205F63C
	pop {r4, r5, r6, pc}
	.balign 4, 0
_020612B0: .word _020FD7B8
	thumb_func_end sub_02061284

	thumb_func_start sub_020612B4
sub_020612B4: ; 0x020612B4
	ldr r3, _020612BC ; =sub_02061284
	mov r1, #0
	bx r3
	nop
_020612BC: .word sub_02061284
	thumb_func_end sub_020612B4

	thumb_func_start sub_020612C0
sub_020612C0: ; 0x020612C0
	ldr r3, _020612C8 ; =sub_02061284
	mov r1, #1
	bx r3
	nop
_020612C8: .word sub_02061284
	thumb_func_end sub_020612C0

	thumb_func_start sub_020612CC
sub_020612CC: ; 0x020612CC
	ldr r3, _020612D4 ; =sub_02061284
	mov r1, #2
	bx r3
	nop
_020612D4: .word sub_02061284
	thumb_func_end sub_020612CC

	thumb_func_start sub_020612D8
sub_020612D8: ; 0x020612D8
	ldr r3, _020612E0 ; =sub_02061284
	mov r1, #3
	bx r3
	nop
_020612E0: .word sub_02061284
	thumb_func_end sub_020612D8

	thumb_func_start sub_020612E4
sub_020612E4: ; 0x020612E4
	ldr r3, _020612EC ; =sub_02061284
	mov r1, #4
	bx r3
	nop
_020612EC: .word sub_02061284
	thumb_func_end sub_020612E4

	thumb_func_start sub_020612F0
sub_020612F0: ; 0x020612F0
	ldr r3, _020612F8 ; =sub_02061284
	mov r1, #5
	bx r3
	nop
_020612F8: .word sub_02061284
	thumb_func_end sub_020612F0

	thumb_func_start sub_020612FC
sub_020612FC: ; 0x020612FC
	ldr r3, _02061304 ; =sub_02061284
	mov r1, #6
	bx r3
	nop
_02061304: .word sub_02061284
	thumb_func_end sub_020612FC

	thumb_func_start sub_02061308
sub_02061308: ; 0x02061308
	ldr r3, _02061310 ; =sub_02061284
	mov r1, #7
	bx r3
	nop
_02061310: .word sub_02061284
	thumb_func_end sub_02061308

	thumb_func_start sub_02061314
sub_02061314: ; 0x02061314
	ldr r3, _0206131C ; =sub_02061284
	mov r1, #8
	bx r3
	nop
_0206131C: .word sub_02061284
	thumb_func_end sub_02061314

	thumb_func_start sub_02061320
sub_02061320: ; 0x02061320
	ldr r3, _02061328 ; =sub_02061284
	mov r1, #9
	bx r3
	nop
_02061328: .word sub_02061284
	thumb_func_end sub_02061320

	thumb_func_start sub_0206132C
sub_0206132C: ; 0x0206132C
	ldr r3, _02061334 ; =sub_02061284
	mov r1, #0xa
	bx r3
	nop
_02061334: .word sub_02061284
	thumb_func_end sub_0206132C

	thumb_func_start sub_02061338
sub_02061338: ; 0x02061338
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_0205F394
	add r4, r0, #0
	mov r2, #0
	ldr r1, [r4, #4]
	add r0, r5, #0
	mvn r2, r2
	bl sub_02061F5C
	mov r2, #0
	add r1, r0, #0
	mvn r2, r2
	cmp r1, r2
	beq _02061360
	add r0, r5, #0
	bl sub_0205F290
	b _02061390
_02061360:
	ldrh r0, [r4]
	cmp r0, #0
	bne _02061390
	mov r0, #2
	ldrsh r1, [r4, r0]
	sub r1, r1, #1
	strh r1, [r4, #2]
	ldrsh r0, [r4, r0]
	cmp r0, #0
	bgt _02061390
	ldr r0, _02061398 ; =_020FD7B8
	add r1, r2, #0
	bl sub_02061E20
	strh r0, [r4, #2]
	mov r1, #0
	ldr r0, [r4, #4]
	mvn r1, r1
	bl sub_02061E44
	add r1, r0, #0
	add r0, r5, #0
	bl sub_0205F290
_02061390:
	add r0, r5, #0
	bl sub_02060F78
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02061398: .word _020FD7B8
	thumb_func_end sub_02061338

	thumb_func_start sub_0206139C
sub_0206139C: ; 0x0206139C
	bx lr
	.balign 4, 0
	thumb_func_end sub_0206139C

	thumb_func_start sub_020613A0
sub_020613A0: ; 0x020613A0
	push {r3, lr}
	mov r1, #0xc
	mov r2, #0xb
	mov r3, #0
	bl sub_020613D0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_020613A0

	thumb_func_start sub_020613B0
sub_020613B0: ; 0x020613B0
	push {r3, lr}
	mov r1, #0xc
	add r2, r1, #0
	mov r3, #0
	bl sub_020613D0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_020613B0

	thumb_func_start sub_020613C0
sub_020613C0: ; 0x020613C0
	push {r3, lr}
	mov r1, #0xc
	mov r2, #0xd
	mov r3, #0
	bl sub_020613D0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_020613C0

	thumb_func_start sub_020613D0
sub_020613D0: ; 0x020613D0
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r7, r3, #0
	mov r1, #0x10
	add r5, r0, #0
	add r6, r2, #0
	bl sub_0205F370
	str r7, [r0, #4]
	str r4, [r0, #8]
	str r6, [r0, #0xc]
	add r0, r5, #0
	mov r1, #0
	bl sub_0205F328
	add r0, r5, #0
	bl sub_0205F63C
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_020613D0

	thumb_func_start sub_020613F8
sub_020613F8: ; 0x020613F8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl sub_0205F394
	add r4, r0, #0
	mov r0, #0
	ldrsh r0, [r4, r0]
	cmp r0, #4
	bhi _020614EE
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02061416: ; jump table
	.short _02061420 - _02061416 - 2 ; case 0
	.short _0206144A - _02061416 - 2 ; case 1
	.short _02061468 - _02061416 - 2 ; case 2
	.short _0206147E - _02061416 - 2 ; case 3
	.short _020614DA - _02061416 - 2 ; case 4
_02061420:
	add r0, r5, #0
	bl sub_0205F63C
	add r0, r5, #0
	bl sub_0205F660
	add r0, r5, #0
	bl sub_0205F2A8
	mov r1, #0
	bl sub_0206234C
	add r1, r0, #0
	add r0, r5, #0
	bl sub_0206217C
	mov r0, #0
	ldrsh r0, [r4, r0]
	add r0, r0, #1
	strh r0, [r4]
	pop {r4, r5, r6, pc}
_0206144A:
	add r0, r5, #0
	bl sub_02062428
	cmp r0, #0
	beq _020614EE
	mov r1, #0
	ldr r0, _020614F0 ; =_020FD7B8
	mvn r1, r1
	bl sub_02061E20
	strh r0, [r4, #2]
	mov r0, #0
	ldrsh r0, [r4, r0]
	add r0, r0, #1
	strh r0, [r4]
_02061468:
	mov r0, #2
	ldrsh r1, [r4, r0]
	sub r1, r1, #1
	strh r1, [r4, #2]
	ldrsh r0, [r4, r0]
	cmp r0, #0
	bne _020614EE
	mov r0, #0
	ldrsh r0, [r4, r0]
	add r0, r0, #1
	strh r0, [r4]
_0206147E:
	mov r1, #0
	ldr r0, [r4, #0xc]
	mvn r1, r1
	bl sub_02061E44
	add r6, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	bl sub_0205F2BC
	ldr r0, [r4, #4]
	cmp r0, #1
	bne _020614AA
	add r0, r5, #0
	add r1, r6, #0
	bl sub_020615F0
	cmp r0, #0
	bne _020614AA
	mov r0, #0
	strh r0, [r4]
	pop {r4, r5, r6, pc}
_020614AA:
	add r0, r5, #0
	add r1, r6, #0
	bl sub_02060BB8
	cmp r0, #0
	beq _020614BC
	mov r0, #0
	strh r0, [r4]
	pop {r4, r5, r6, pc}
_020614BC:
	ldr r1, [r4, #8]
	add r0, r6, #0
	bl sub_0206234C
	add r1, r0, #0
	add r0, r5, #0
	bl sub_0206217C
	add r0, r5, #0
	bl sub_0205F630
	mov r0, #0
	ldrsh r0, [r4, r0]
	add r0, r0, #1
	strh r0, [r4]
_020614DA:
	add r0, r5, #0
	bl sub_02062428
	cmp r0, #0
	beq _020614EE
	add r0, r5, #0
	bl sub_0205F63C
	mov r0, #0
	strh r0, [r4]
_020614EE:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_020614F0: .word _020FD7B8
	thumb_func_end sub_020613F8

	thumb_func_start sub_020614F4
sub_020614F4: ; 0x020614F4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r0, [sp]
	add r4, r1, #0
	bl sub_0205F8E4
	add r6, r0, #0
	ldr r0, [sp]
	bl sub_0205F8F4
	add r5, r0, #0
	ldr r0, [sp]
	bl sub_0205F31C
	add r7, r0, #0
	ldr r0, [sp]
	bl sub_0205F324
	str r0, [sp, #4]
	ldr r0, [sp]
	bl sub_0205F264
	cmp r0, #0xd
	bhi _020615E8
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02061530: ; jump table
	.short _020615E8 - _02061530 - 2 ; case 0
	.short _020615E8 - _02061530 - 2 ; case 1
	.short _020615E8 - _02061530 - 2 ; case 2
	.short _020615E8 - _02061530 - 2 ; case 3
	.short _020615E8 - _02061530 - 2 ; case 4
	.short _020615E8 - _02061530 - 2 ; case 5
	.short _0206154C - _02061530 - 2 ; case 6
	.short _0206155E - _02061530 - 2 ; case 7
	.short _02061570 - _02061530 - 2 ; case 8
	.short _02061582 - _02061530 - 2 ; case 9
	.short _02061594 - _02061530 - 2 ; case 10
	.short _020615AA - _02061530 - 2 ; case 11
	.short _020615C0 - _02061530 - 2 ; case 12
	.short _020615D4 - _02061530 - 2 ; case 13
_0206154C:
	sub r0, r6, r7
	str r0, [r4]
	ldr r0, [sp, #4]
	str r6, [r4, #8]
	sub r0, r5, r0
	str r0, [r4, #4]
	add sp, #8
	str r5, [r4, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
_0206155E:
	str r6, [r4]
	add r0, r6, r7
	str r0, [r4, #8]
	ldr r0, [sp, #4]
	add sp, #8
	sub r0, r5, r0
	str r0, [r4, #4]
	str r5, [r4, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
_02061570:
	sub r0, r6, r7
	str r0, [r4]
	ldr r0, [sp, #4]
	str r6, [r4, #8]
	str r5, [r4, #4]
	add r0, r5, r0
	add sp, #8
	str r0, [r4, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
_02061582:
	str r6, [r4]
	add r0, r6, r7
	str r0, [r4, #8]
	ldr r0, [sp, #4]
	str r5, [r4, #4]
	add r0, r5, r0
	add sp, #8
	str r0, [r4, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
_02061594:
	sub r0, r6, r7
	str r0, [r4]
	ldr r0, [sp, #4]
	str r6, [r4, #8]
	sub r0, r5, r0
	str r0, [r4, #4]
	ldr r0, [sp, #4]
	add sp, #8
	add r0, r5, r0
	str r0, [r4, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
_020615AA:
	str r6, [r4]
	add r0, r6, r7
	str r0, [r4, #8]
	ldr r0, [sp, #4]
	sub r0, r5, r0
	str r0, [r4, #4]
	ldr r0, [sp, #4]
	add sp, #8
	add r0, r5, r0
	str r0, [r4, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
_020615C0:
	sub r0, r6, r7
	str r0, [r4]
	add r0, r6, r7
	str r0, [r4, #8]
	ldr r0, [sp, #4]
	add sp, #8
	sub r0, r5, r0
	str r0, [r4, #4]
	str r5, [r4, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
_020615D4:
	sub r0, r6, r7
	str r0, [r4]
	add r0, r6, r7
	str r0, [r4, #8]
	ldr r0, [sp, #4]
	str r5, [r4, #4]
	add r0, r5, r0
	add sp, #8
	str r0, [r4, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
_020615E8:
	bl GF_AssertFail
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_020614F4

	thumb_func_start sub_020615F0
sub_020615F0: ; 0x020615F0
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r6, r1, #0
	add r5, r0, #0
	add r1, sp, #0
	bl sub_020614F4
	add r0, r5, #0
	bl sub_0205F914
	add r4, r0, #0
	add r0, r6, #0
	bl sub_02060F0C
	add r4, r4, r0
	add r0, r5, #0
	bl sub_0205F934
	add r5, r0, #0
	add r0, r6, #0
	bl sub_02060F18
	add r1, r5, r0
	ldr r0, [sp]
	cmp r0, r4
	bgt _0206162A
	ldr r0, [sp, #8]
	cmp r0, r4
	bge _02061630
_0206162A:
	add sp, #0x10
	mov r0, #0
	pop {r4, r5, r6, pc}
_02061630:
	ldr r0, [sp, #4]
	cmp r0, r1
	bgt _0206163C
	ldr r0, [sp, #0xc]
	cmp r0, r1
	bge _02061642
_0206163C:
	add sp, #0x10
	mov r0, #0
	pop {r4, r5, r6, pc}
_02061642:
	mov r0, #1
	add sp, #0x10
	pop {r4, r5, r6, pc}
	thumb_func_end sub_020615F0

	thumb_func_start sub_02061648
sub_02061648: ; 0x02061648
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	mov r1, #8
	bl sub_0205F370
	str r4, [r0]
	add r0, r5, #0
	mov r1, #0
	bl sub_0205F328
	add r0, r5, #0
	bl sub_0205F63C
	add r0, r5, #0
	bl sub_02060F78
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02061648

	thumb_func_start sub_0206166C
sub_0206166C: ; 0x0206166C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_0205F394
	add r4, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _02061680
	cmp r0, #1
	pop {r3, r4, r5, pc}
_02061680:
	ldr r1, [r4]
	add r0, r5, #0
	bl sub_0205F290
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0206166C

	thumb_func_start sub_02061690
sub_02061690: ; 0x02061690
	ldr r3, _02061698 ; =sub_02061648
	mov r1, #0
	bx r3
	nop
_02061698: .word sub_02061648
	thumb_func_end sub_02061690

	thumb_func_start sub_0206169C
sub_0206169C: ; 0x0206169C
	ldr r3, _020616A4 ; =sub_02061648
	mov r1, #1
	bx r3
	nop
_020616A4: .word sub_02061648
	thumb_func_end sub_0206169C

	thumb_func_start sub_020616A8
sub_020616A8: ; 0x020616A8
	ldr r3, _020616B0 ; =sub_02061648
	mov r1, #2
	bx r3
	nop
_020616B0: .word sub_02061648
	thumb_func_end sub_020616A8

	thumb_func_start sub_020616B4
sub_020616B4: ; 0x020616B4
	ldr r3, _020616BC ; =sub_02061648
	mov r1, #3
	bx r3
	nop
_020616BC: .word sub_02061648
	thumb_func_end sub_020616B4

	thumb_func_start sub_020616C0
sub_020616C0: ; 0x020616C0
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	mov r1, #8
	bl sub_0205F370
	strb r4, [r0]
	add r0, r5, #0
	mov r1, #0
	bl sub_0205F328
	add r0, r5, #0
	bl sub_0205F63C
	add r0, r5, #0
	bl sub_02060F78
	pop {r3, r4, r5, pc}
	thumb_func_end sub_020616C0

	thumb_func_start sub_020616E4
sub_020616E4: ; 0x020616E4
	ldr r3, _020616EC ; =sub_020616C0
	mov r1, #2
	bx r3
	nop
_020616EC: .word sub_020616C0
	thumb_func_end sub_020616E4

	thumb_func_start sub_020616F0
sub_020616F0: ; 0x020616F0
	ldr r3, _020616F8 ; =sub_020616C0
	mov r1, #3
	bx r3
	nop
_020616F8: .word sub_020616C0
	thumb_func_end sub_020616F0

	thumb_func_start sub_020616FC
sub_020616FC: ; 0x020616FC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl sub_0205F394
	ldr r6, _0206171C ; =_020FD5D0
	add r4, r0, #0
	mov r7, #2
_0206170A:
	ldrsb r2, [r4, r7]
	add r0, r5, #0
	add r1, r4, #0
	lsl r2, r2, #2
	ldr r2, [r6, r2]
	blx r2
	cmp r0, #1
	beq _0206170A
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0206171C: .word _020FD5D0
	thumb_func_end sub_020616FC

	thumb_func_start sub_02061720
sub_02061720: ; 0x02061720
	push {r3, r4, r5, lr}
	add r4, r1, #0
	mov r1, #0x26
	add r2, r1, #0
	sub r2, #0x27
	add r5, r0, #0
	bl sub_02061F5C
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _0206173E
	add r0, r5, #0
	bl sub_0205F2A8
_0206173E:
	mov r1, #0
	bl sub_0206234C
	add r1, r0, #0
	add r0, r5, #0
	bl sub_0206217C
	mov r0, #1
	strb r0, [r4, #2]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02061720

	thumb_func_start sub_02061754
sub_02061754: ; 0x02061754
	push {r4, lr}
	add r4, r1, #0
	bl sub_02062428
	cmp r0, #0
	bne _02061764
	mov r0, #0
	pop {r4, pc}
_02061764:
	mov r0, #0
	str r0, [r4, #4]
	mov r0, #2
	strb r0, [r4, #2]
	mov r0, #1
	pop {r4, pc}
	thumb_func_end sub_02061754

	thumb_func_start sub_02061770
sub_02061770: ; 0x02061770
	push {r4, lr}
	add r4, r1, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	beq _02061794
	mov r1, #0x26
	add r2, r1, #0
	sub r2, #0x27
	bl sub_02061F5C
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _02061794
	mov r0, #0
	strb r0, [r4, #2]
	mov r0, #1
	pop {r4, pc}
_02061794:
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	cmp r0, #0x18
	bge _020617A2
	mov r0, #0
	pop {r4, pc}
_020617A2:
	mov r0, #3
	strb r0, [r4, #2]
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02061770

	thumb_func_start sub_020617AC
sub_020617AC: ; 0x020617AC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	ldr r3, _0206183C ; =_020FD754
	add r2, sp, #0x14
	add r7, r0, #0
	add r6, r1, #0
	ldmia r3!, {r0, r1}
	add r5, r2, #0
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	ldr r4, _02061840 ; =_020FD768
	str r0, [r2]
	add r3, sp, #0
	ldmia r4!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r4]
	str r0, [r3]
	mov r0, #0
	ldrsb r0, [r6, r0]
	cmp r0, #2
	beq _020617E2
	add r5, r2, #0
_020617E2:
	add r0, r7, #0
	bl sub_0205F2A8
	mov r4, #0
	ldr r2, [r5]
	sub r1, r4, #1
	cmp r2, r1
	beq _02061806
	add r1, r5, #0
	sub r2, r4, #1
_020617F6:
	ldr r3, [r1]
	cmp r0, r3
	beq _02061806
	add r1, r1, #4
	ldr r3, [r1]
	add r4, r4, #1
	cmp r3, r2
	bne _020617F6
_02061806:
	lsl r0, r4, #2
	ldr r1, [r5, r0]
	mov r0, #0
	mvn r0, r0
	cmp r1, r0
	bne _02061816
	bl GF_AssertFail
_02061816:
	add r4, r4, #1
	lsl r0, r4, #2
	ldr r1, [r5, r0]
	mov r0, #0
	mvn r0, r0
	cmp r1, r0
	bne _02061826
	mov r4, #0
_02061826:
	lsl r1, r4, #2
	ldr r1, [r5, r1]
	add r0, r7, #0
	bl sub_0205F290
	mov r0, #0
	strb r0, [r6, #2]
	mov r0, #1
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0206183C: .word _020FD754
_02061840: .word _020FD768
	thumb_func_end sub_020617AC

	thumb_func_start sub_02061844
sub_02061844: ; 0x02061844
	ldr r3, _0206184C ; =sub_020616C0
	mov r1, #3
	bx r3
	nop
_0206184C: .word sub_020616C0
	thumb_func_end sub_02061844

	thumb_func_start sub_02061850
sub_02061850: ; 0x02061850
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl sub_0205F394
	ldr r6, _02061870 ; =_020FD5A0
	add r4, r0, #0
	mov r7, #2
_0206185E:
	ldrsb r2, [r4, r7]
	add r0, r5, #0
	add r1, r4, #0
	lsl r2, r2, #2
	ldr r2, [r6, r2]
	blx r2
	cmp r0, #1
	beq _0206185E
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02061870: .word _020FD5A0
	thumb_func_end sub_02061850

	thumb_func_start sub_02061874
sub_02061874: ; 0x02061874
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0205F2A8
	mov r1, #0
	bl sub_0206234C
	add r1, r0, #0
	add r0, r5, #0
	bl sub_0206217C
	mov r0, #1
	strb r0, [r4, #2]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02061874

	thumb_func_start sub_02061894
sub_02061894: ; 0x02061894
	push {r4, lr}
	add r4, r1, #0
	bl sub_02062428
	cmp r0, #0
	bne _020618A4
	mov r0, #0
	pop {r4, pc}
_020618A4:
	mov r0, #0
	str r0, [r4, #4]
	mov r0, #2
	strb r0, [r4, #2]
	mov r0, #1
	pop {r4, pc}
	thumb_func_end sub_02061894

	thumb_func_start sub_020618B0
sub_020618B0: ; 0x020618B0
	ldr r0, [r1, #4]
	add r0, r0, #1
	str r0, [r1, #4]
	cmp r0, #0x18
	bge _020618BE
	mov r0, #0
	bx lr
_020618BE:
	mov r0, #3
	strb r0, [r1, #2]
	mov r0, #1
	bx lr
	.balign 4, 0
	thumb_func_end sub_020618B0

	thumb_func_start sub_020618C8
sub_020618C8: ; 0x020618C8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	ldr r3, _02061974 ; =_020FD77C
	add r2, sp, #0x14
	add r7, r0, #0
	add r6, r1, #0
	ldmia r3!, {r0, r1}
	add r5, r2, #0
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	ldr r3, _02061978 ; =_020FD7A4
	str r0, [r2]
	add r2, sp, #0
	ldmia r3!, {r0, r1}
	add r4, r2, #0
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	mov r0, #0
	ldrsb r0, [r6, r0]
	cmp r0, #2
	beq _020618FE
	add r5, r4, #0
_020618FE:
	add r0, r7, #0
	bl sub_0205F2A8
	mov r4, #0
	ldr r2, [r5]
	sub r1, r4, #1
	cmp r2, r1
	beq _02061922
	add r1, r5, #0
	sub r2, r4, #1
_02061912:
	ldr r3, [r1]
	cmp r0, r3
	beq _02061922
	add r1, r1, #4
	ldr r3, [r1]
	add r4, r4, #1
	cmp r3, r2
	bne _02061912
_02061922:
	lsl r0, r4, #2
	ldr r1, [r5, r0]
	mov r0, #0
	mvn r0, r0
	cmp r1, r0
	bne _02061932
	bl GF_AssertFail
_02061932:
	add r4, r4, #1
	lsl r0, r4, #2
	ldr r1, [r5, r0]
	mov r0, #0
	mvn r0, r0
	cmp r1, r0
	bne _02061942
	mov r4, #0
_02061942:
	lsl r1, r4, #2
	ldr r1, [r5, r1]
	add r0, r7, #0
	bl sub_0205F290
	add r0, r7, #0
	bl sub_0205F2A8
	add r4, r0, #0
	add r0, r7, #0
	bl sub_0205F284
	cmp r4, r0
	bne _02061968
	mov r0, #0
	ldrsb r0, [r6, r0]
	bl sub_020611F4
	strb r0, [r6]
_02061968:
	mov r0, #0
	strb r0, [r6, #2]
	mov r0, #1
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02061974: .word _020FD77C
_02061978: .word _020FD7A4
	thumb_func_end sub_020618C8

	thumb_func_start sub_0206197C
sub_0206197C: ; 0x0206197C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r1, #8
	bl sub_0205F370
	add r4, r0, #0
	add r0, r5, #0
	bl sub_02062050
	cmp r0, #1
	bne _0206199A
	add r0, r5, #0
	add r1, r4, #4
	bl sub_02062064
_0206199A:
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0206197C

	thumb_func_start sub_0206199C
sub_0206199C: ; 0x0206199C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl sub_0205F394
	ldr r6, _020619BC ; =_020FD548
	add r4, r0, #0
	mov r7, #0
_020619AA:
	ldrsh r2, [r4, r7]
	add r0, r5, #0
	add r1, r4, #0
	lsl r2, r2, #2
	ldr r2, [r6, r2]
	blx r2
	cmp r0, #1
	beq _020619AA
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_020619BC: .word _020FD548
	thumb_func_end sub_0206199C

	thumb_func_start sub_020619C0
sub_020619C0: ; 0x020619C0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0205F284
	mov r1, #2
	ldrsh r1, [r4, r1]
	add r6, r0, #0
	cmp r1, #1
	bne _020619DA
	bl sub_020611F4
	add r6, r0, #0
_020619DA:
	add r0, r5, #0
	add r1, r6, #0
	bl sub_0205F2B0
	add r0, r5, #0
	bl sub_02062050
	cmp r0, #0
	bne _020619F4
	add r0, r5, #0
	add r1, r6, #0
	bl sub_0205F290
_020619F4:
	mov r0, #1
	strh r0, [r4]
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_020619C0

	thumb_func_start sub_020619FC
sub_020619FC: ; 0x020619FC
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	mov r1, #2
	ldrsh r1, [r6, r1]
	add r5, r0, #0
	cmp r1, #0
	beq _02061A5A
	bl sub_0205F8E4
	add r7, r0, #0
	add r0, r5, #0
	bl sub_0205F8F4
	str r0, [sp]
	add r0, r5, #0
	bl sub_0205F914
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0205F934
	cmp r7, r4
	bne _02061A5A
	ldr r1, [sp]
	cmp r1, r0
	bne _02061A5A
	add r0, r5, #0
	bl sub_0205F2B8
	bl sub_020611F4
	add r4, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205F2B0
	add r0, r5, #0
	bl sub_02062050
	cmp r0, #0
	bne _02061A56
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205F290
_02061A56:
	mov r0, #0
	strh r0, [r6, #2]
_02061A5A:
	add r0, r5, #0
	bl sub_0205F2B8
	add r4, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02060BB8
	mov r1, #1
	add r2, r0, #0
	tst r2, r1
	beq _02061A84
	add r0, r4, #0
	strh r1, [r6, #2]
	bl sub_020611F4
	add r4, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02060BB8
_02061A84:
	mov r1, #0xc
	cmp r0, #0
	beq _02061A8C
	mov r1, #0x20
_02061A8C:
	add r0, r4, #0
	bl sub_0206234C
	add r1, r0, #0
	add r0, r5, #0
	bl sub_0206217C
	add r0, r5, #0
	bl sub_02062050
	cmp r0, #1
	bne _02061AAC
	add r0, r5, #0
	add r1, r6, #4
	bl sub_0206207C
_02061AAC:
	add r0, r5, #0
	bl sub_0205F630
	mov r0, #2
	strh r0, [r6]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_020619FC

	thumb_func_start sub_02061ABC
sub_02061ABC: ; 0x02061ABC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_02062428
	cmp r0, #1
	bne _02061AE6
	add r0, r5, #0
	bl sub_0205F63C
	add r0, r5, #0
	bl sub_02062050
	cmp r0, #1
	bne _02061AE2
	add r0, r5, #0
	add r1, r4, #4
	bl sub_020620F8
_02061AE2:
	mov r0, #0
	strh r0, [r4]
_02061AE6:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02061ABC

	thumb_func_start sub_02061AEC
sub_02061AEC: ; 0x02061AEC
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	mov r1, #0xc
	add r5, r0, #0
	add r7, r2, #0
	str r3, [sp]
	bl sub_0205F370
	add r4, r0, #0
	strb r6, [r4, #2]
	ldr r0, [sp]
	strb r7, [r4, #3]
	str r0, [r4, #4]
	add r0, r5, #0
	bl sub_02062050
	cmp r0, #1
	bne _02061B1A
	add r4, #8
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02062064
_02061B1A:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02061AEC

	thumb_func_start sub_02061B1C
sub_02061B1C: ; 0x02061B1C
	push {r3, lr}
	mov r1, #2
	mov r2, #0
	mov r3, #0xe
	bl sub_02061AEC
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02061B1C

	thumb_func_start sub_02061B2C
sub_02061B2C: ; 0x02061B2C
	push {r3, lr}
	mov r1, #2
	mov r2, #0
	mov r3, #0xf
	bl sub_02061AEC
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02061B2C

	thumb_func_start sub_02061B3C
sub_02061B3C: ; 0x02061B3C
	push {r3, lr}
	mov r1, #2
	mov r2, #1
	mov r3, #0x10
	bl sub_02061AEC
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02061B3C

	thumb_func_start sub_02061B4C
sub_02061B4C: ; 0x02061B4C
	push {r3, lr}
	mov r1, #2
	mov r2, #1
	mov r3, #0x11
	bl sub_02061AEC
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02061B4C

	thumb_func_start sub_02061B5C
sub_02061B5C: ; 0x02061B5C
	push {r3, lr}
	mov r1, #2
	mov r2, #0
	mov r3, #0x12
	bl sub_02061AEC
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02061B5C

	thumb_func_start sub_02061B6C
sub_02061B6C: ; 0x02061B6C
	push {r3, lr}
	mov r1, #2
	mov r2, #0
	mov r3, #0x13
	bl sub_02061AEC
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02061B6C

	thumb_func_start sub_02061B7C
sub_02061B7C: ; 0x02061B7C
	push {r3, lr}
	mov r1, #2
	mov r2, #1
	mov r3, #0x14
	bl sub_02061AEC
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02061B7C

	thumb_func_start sub_02061B8C
sub_02061B8C: ; 0x02061B8C
	push {r3, lr}
	mov r1, #2
	mov r2, #1
	mov r3, #0x15
	bl sub_02061AEC
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02061B8C

	thumb_func_start sub_02061B9C
sub_02061B9C: ; 0x02061B9C
	push {r3, lr}
	mov r1, #2
	mov r2, #1
	mov r3, #0x16
	bl sub_02061AEC
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02061B9C

	thumb_func_start sub_02061BAC
sub_02061BAC: ; 0x02061BAC
	push {r3, lr}
	mov r1, #2
	mov r2, #1
	mov r3, #0x17
	bl sub_02061AEC
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02061BAC

	thumb_func_start sub_02061BBC
sub_02061BBC: ; 0x02061BBC
	push {r3, lr}
	mov r1, #2
	mov r2, #0
	mov r3, #0x18
	bl sub_02061AEC
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02061BBC

	thumb_func_start sub_02061BCC
sub_02061BCC: ; 0x02061BCC
	push {r3, lr}
	mov r1, #2
	mov r2, #0
	mov r3, #0x19
	bl sub_02061AEC
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02061BCC

	thumb_func_start sub_02061BDC
sub_02061BDC: ; 0x02061BDC
	push {r3, lr}
	mov r1, #2
	mov r2, #1
	mov r3, #0x1a
	bl sub_02061AEC
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02061BDC

	thumb_func_start sub_02061BEC
sub_02061BEC: ; 0x02061BEC
	push {r3, lr}
	mov r1, #2
	mov r2, #1
	mov r3, #0x1b
	bl sub_02061AEC
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02061BEC

	thumb_func_start sub_02061BFC
sub_02061BFC: ; 0x02061BFC
	push {r3, lr}
	mov r1, #2
	mov r2, #0
	mov r3, #0x1c
	bl sub_02061AEC
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02061BFC

	thumb_func_start sub_02061C0C
sub_02061C0C: ; 0x02061C0C
	push {r3, lr}
	mov r1, #2
	mov r2, #0
	mov r3, #0x1d
	bl sub_02061AEC
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02061C0C

	thumb_func_start sub_02061C1C
sub_02061C1C: ; 0x02061C1C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl sub_0205F394
	ldr r6, _02061C3C ; =_020FD4EC
	add r4, r0, #0
_02061C28:
	ldrb r2, [r4]
	add r0, r5, #0
	add r1, r4, #0
	lsl r2, r2, #2
	ldr r2, [r6, r2]
	blx r2
	cmp r0, #1
	beq _02061C28
	pop {r4, r5, r6, pc}
	nop
_02061C3C: .word _020FD4EC
	thumb_func_end sub_02061C1C

	thumb_func_start sub_02061C40
sub_02061C40: ; 0x02061C40
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	ldrb r2, [r4, #1]
	ldrb r1, [r4, #2]
	add r6, r0, #0
	cmp r2, r1
	bne _02061C82
	ldrb r1, [r4, #3]
	cmp r1, #0
	bne _02061C6C
	bl sub_0205F8E4
	add r5, r0, #0
	add r0, r6, #0
	bl sub_0205F914
	cmp r5, r0
	bne _02061C82
	ldrb r0, [r4, #1]
	add r0, r0, #1
	strb r0, [r4, #1]
	b _02061C82
_02061C6C:
	bl sub_0205F8F4
	add r5, r0, #0
	add r0, r6, #0
	bl sub_0205F934
	cmp r5, r0
	bne _02061C82
	ldrb r0, [r4, #1]
	add r0, r0, #1
	strb r0, [r4, #1]
_02061C82:
	ldrb r0, [r4, #1]
	cmp r0, #3
	bne _02061CB4
	add r0, r6, #0
	bl sub_0205F8E4
	add r7, r0, #0
	add r0, r6, #0
	bl sub_0205F8F4
	str r0, [sp]
	add r0, r6, #0
	bl sub_0205F914
	add r5, r0, #0
	add r0, r6, #0
	bl sub_0205F934
	cmp r7, r5
	bne _02061CB4
	ldr r1, [sp]
	cmp r1, r0
	bne _02061CB4
	mov r0, #0
	strb r0, [r4, #1]
_02061CB4:
	ldr r0, [r4, #4]
	bl sub_02061E6C
	add r7, r0, #0
	ldrb r0, [r4, #1]
	lsl r0, r0, #2
	ldr r5, [r7, r0]
	add r0, r6, #0
	add r1, r5, #0
	bl sub_0205F2B0
	add r0, r6, #0
	bl sub_02062050
	cmp r0, #0
	bne _02061CDC
	add r0, r6, #0
	add r1, r5, #0
	bl sub_0205F290
_02061CDC:
	add r0, r6, #0
	add r1, r5, #0
	bl sub_02060BB8
	mov r1, #1
	tst r1, r0
	beq _02061D18
	ldrb r0, [r4, #1]
	add r0, r0, #1
	strb r0, [r4, #1]
	ldrb r0, [r4, #1]
	lsl r0, r0, #2
	ldr r5, [r7, r0]
	add r0, r6, #0
	add r1, r5, #0
	bl sub_0205F2B0
	add r0, r6, #0
	bl sub_02062050
	cmp r0, #0
	bne _02061D10
	add r0, r6, #0
	add r1, r5, #0
	bl sub_0205F290
_02061D10:
	add r0, r6, #0
	add r1, r5, #0
	bl sub_02060BB8
_02061D18:
	mov r1, #0xc
	cmp r0, #0
	beq _02061D20
	mov r1, #0x20
_02061D20:
	add r0, r5, #0
	bl sub_0206234C
	add r1, r0, #0
	add r0, r6, #0
	bl sub_0206217C
	add r0, r6, #0
	bl sub_02062050
	cmp r0, #1
	bne _02061D42
	add r1, r4, #0
	add r0, r6, #0
	add r1, #8
	bl sub_0206207C
_02061D42:
	add r0, r6, #0
	bl sub_0205F630
	mov r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02061C40

	thumb_func_start sub_02061D50
sub_02061D50: ; 0x02061D50
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_02062428
	cmp r0, #1
	bne _02061D7C
	add r0, r5, #0
	bl sub_0205F63C
	add r0, r5, #0
	bl sub_02062050
	cmp r0, #1
	bne _02061D78
	add r1, r4, #0
	add r0, r5, #0
	add r1, #8
	bl sub_020620F8
_02061D78:
	mov r0, #0
	strb r0, [r4]
_02061D7C:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02061D50

	thumb_func_start sub_02061D80
sub_02061D80: ; 0x02061D80
	push {r3, lr}
	mov r1, #2
	mov r2, #1
	mov r3, #0x1e
	bl sub_02061AEC
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02061D80

	thumb_func_start sub_02061D90
sub_02061D90: ; 0x02061D90
	push {r3, lr}
	mov r1, #2
	mov r2, #1
	mov r3, #0x1f
	bl sub_02061AEC
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02061D90

	thumb_func_start sub_02061DA0
sub_02061DA0: ; 0x02061DA0
	push {r3, lr}
	mov r1, #2
	mov r2, #0
	mov r3, #0x20
	bl sub_02061AEC
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02061DA0

	thumb_func_start sub_02061DB0
sub_02061DB0: ; 0x02061DB0
	push {r3, lr}
	mov r1, #2
	mov r2, #0
	mov r3, #0x21
	bl sub_02061AEC
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02061DB0

	thumb_func_start sub_02061DC0
sub_02061DC0: ; 0x02061DC0
	push {r3, lr}
	mov r1, #2
	mov r2, #1
	mov r3, #0x22
	bl sub_02061AEC
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02061DC0

	thumb_func_start sub_02061DD0
sub_02061DD0: ; 0x02061DD0
	push {r3, lr}
	mov r1, #2
	mov r2, #1
	mov r3, #0x23
	bl sub_02061AEC
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02061DD0

	thumb_func_start sub_02061DE0
sub_02061DE0: ; 0x02061DE0
	push {r3, lr}
	mov r1, #2
	mov r2, #0
	mov r3, #0x24
	bl sub_02061AEC
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02061DE0

	thumb_func_start sub_02061DF0
sub_02061DF0: ; 0x02061DF0
	push {r3, lr}
	mov r1, #2
	mov r2, #0
	mov r3, #0x25
	bl sub_02061AEC
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02061DF0

	thumb_func_start sub_02061E00
sub_02061E00: ; 0x02061E00
	push {r4, lr}
	ldr r2, [r0]
	mov r4, #0
	cmp r1, r2
	beq _02061E14
_02061E0A:
	add r0, r0, #4
	ldr r2, [r0]
	add r4, r4, #1
	cmp r1, r2
	bne _02061E0A
_02061E14:
	cmp r4, #0
	bne _02061E1C
	bl GF_AssertFail
_02061E1C:
	add r0, r4, #0
	pop {r4, pc}
	thumb_func_end sub_02061E00

	thumb_func_start sub_02061E20
sub_02061E20: ; 0x02061E20
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl LCRandom
	add r6, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02061E00
	add r1, r0, #0
	add r0, r6, #0
	bl _s32_div_f
	lsl r0, r1, #2
	ldr r0, [r5, r0]
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02061E20

	thumb_func_start sub_02061E44
sub_02061E44: ; 0x02061E44
	push {r4, r5, r6, lr}
	add r5, r1, #0
	bl sub_02061E6C
	add r4, r0, #0
	bl LCRandom
	add r6, r0, #0
	add r0, r4, #0
	add r1, r5, #0
	bl sub_02061E00
	add r1, r0, #0
	add r0, r6, #0
	bl _s32_div_f
	lsl r0, r1, #2
	ldr r0, [r4, r0]
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02061E44

	thumb_func_start sub_02061E6C
sub_02061E6C: ; 0x02061E6C
	push {r3, lr}
	ldr r1, _02061E8C ; =_020FD838
	mov r2, #0
_02061E72:
	cmp r2, r0
	bne _02061E7A
	ldr r0, [r1, #4]
	pop {r3, pc}
_02061E7A:
	add r1, #8
	ldr r2, [r1]
	cmp r2, #0x27
	bne _02061E72
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
	nop
_02061E8C: .word _020FD838
	thumb_func_end sub_02061E6C

	thumb_func_start sub_02061E90
sub_02061E90: ; 0x02061E90
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl sub_0205F26C
	cmp r0, #1
	beq _02061EA6
	cmp r0, #2
	beq _02061EA6
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02061EA6:
	add r0, r5, #0
	bl sub_0205F52C
	bl sub_0205CA1C
	add r6, r0, #0
	bl sub_0205DE98
	cmp r0, #0
	bne _02061EC0
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02061EC0:
	add r0, r5, #0
	mov r4, #0
	bl sub_0205F264
	ldr r1, _02061F58 ; =_020FD800
_02061ECA:
	lsl r2, r4, #2
	ldr r2, [r1, r2]
	add r4, r4, #1
	cmp r2, r0
	beq _02061ED8
	cmp r2, #0xff
	bne _02061ECA
_02061ED8:
	cmp r0, r2
	beq _02061EE2
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02061EE2:
	add r0, r6, #0
	bl sub_0205C6DC
	bl sub_0205F9D0
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0205F9D0
	cmp r4, r0
	beq _02061EFE
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02061EFE:
	add r0, r6, #0
	bl sub_0205C67C
	add r4, r0, #0
	add r0, r6, #0
	bl sub_0205C688
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #0
	bl sub_0205F2F4
	str r0, [sp]
	add r0, r5, #0
	bl sub_0205F914
	add r7, r0, #0
	add r0, r5, #0
	bl sub_0205F934
	add r2, r0, #0
	ldr r3, [sp]
	ldr r0, [sp]
	add r5, r2, r3
	sub r1, r7, r0
	sub r3, r2, r3
	add r0, r7, r0
	cmp r3, r6
	bgt _02061F52
	cmp r5, r6
	blt _02061F52
	cmp r1, r4
	bgt _02061F52
	cmp r0, r4
	blt _02061F52
	add r1, r2, #0
	add r0, r7, #0
	add r2, r4, #0
	add r3, r6, #0
	bl sub_02061200
	pop {r3, r4, r5, r6, r7, pc}
_02061F52:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02061F58: .word _020FD800
	thumb_func_end sub_02061E90

	thumb_func_start sub_02061F5C
sub_02061F5C: ; 0x02061F5C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	str r0, [sp]
	add r4, r2, #0
	add r0, r1, #0
	bl sub_02061E6C
	add r1, r4, #0
	add r5, r0, #0
	bl sub_02061E00
	add r4, r0, #0
	cmp r4, #1
	bne _02061F80
	mov r0, #0
	add sp, #0x14
	mvn r0, r0
	pop {r4, r5, r6, r7, pc}
_02061F80:
	ldr r0, [sp]
	bl sub_02061E90
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _0206204A
	mov r2, #0
	add r3, r5, #0
_02061F92:
	ldr r1, [r3]
	cmp r0, r1
	beq _0206204A
	add r2, r2, #1
	add r3, r3, #4
	cmp r2, r4
	blt _02061F92
	mov r7, #0
	mvn r7, r7
	ldr r0, [sp]
	add r6, r7, #0
	bl sub_0205F914
	str r0, [sp, #8]
	ldr r0, [sp]
	bl sub_0205F934
	str r0, [sp, #4]
	ldr r0, [sp]
	bl sub_0205F52C
	bl sub_0205CA1C
	str r0, [sp, #0xc]
	bl sub_0205C67C
	str r0, [sp, #0x10]
	ldr r0, [sp, #0xc]
	bl sub_0205C688
	ldr r2, [sp, #8]
	ldr r1, [sp, #0x10]
	cmp r2, r1
	ble _02061FDA
	mov r7, #2
	b _02061FE0
_02061FDA:
	cmp r2, r1
	bge _02061FE0
	mov r7, #3
_02061FE0:
	ldr r1, [sp, #4]
	cmp r1, r0
	ble _02061FEA
	mov r6, #0
	b _02061FF0
_02061FEA:
	cmp r1, r0
	bge _02061FF0
	mov r6, #1
_02061FF0:
	mov r0, #0
	sub r1, r0, #1
	cmp r7, r1
	bne _0206200E
_02061FF8:
	ldr r1, [r5]
	cmp r6, r1
	bne _02062004
	add sp, #0x14
	add r0, r6, #0
	pop {r4, r5, r6, r7, pc}
_02062004:
	add r0, r0, #1
	add r5, r5, #4
	cmp r0, r4
	blt _02061FF8
	b _02062046
_0206200E:
	cmp r6, r1
	bne _02062028
_02062012:
	ldr r1, [r5]
	cmp r7, r1
	bne _0206201E
	add sp, #0x14
	add r0, r7, #0
	pop {r4, r5, r6, r7, pc}
_0206201E:
	add r0, r0, #1
	add r5, r5, #4
	cmp r0, r4
	blt _02062012
	b _02062046
_02062028:
	ldr r1, [r5]
	cmp r7, r1
	bne _02062034
	add sp, #0x14
	add r0, r7, #0
	pop {r4, r5, r6, r7, pc}
_02062034:
	cmp r6, r1
	bne _0206203E
	add sp, #0x14
	add r0, r6, #0
	pop {r4, r5, r6, r7, pc}
_0206203E:
	add r0, r0, #1
	add r5, r5, #4
	cmp r0, r4
	blt _02062028
_02062046:
	mov r0, #0
	mvn r0, r0
_0206204A:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02061F5C

	thumb_func_start sub_02062050
sub_02062050: ; 0x02062050
	push {r3, lr}
	bl sub_0205F26C
	sub r0, r0, #7
	cmp r0, #1
	bhi _02062060
	mov r0, #1
	pop {r3, pc}
_02062060:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_02062050

	thumb_func_start sub_02062064
sub_02062064: ; 0x02062064
	push {r4, lr}
	add r4, r1, #0
	bl sub_0205F26C
	cmp r0, #7
	bne _02062076
	mov r0, #0
	strb r0, [r4, #1]
	pop {r4, pc}
_02062076:
	mov r0, #1
	strb r0, [r4, #1]
	pop {r4, pc}
	thumb_func_end sub_02062064

	thumb_func_start sub_0206207C
sub_0206207C: ; 0x0206207C
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r5, r1, #0
	bl sub_0205F2A8
	mov r4, #0
	add r6, r0, #0
	add r1, r4, #0
	ldr r0, _020620F4 ; =_020FD7E0
	mov r2, #1
	b _02062096
_02062092:
	add r1, r1, #4
	add r4, r4, #1
_02062096:
	cmp r4, #4
	bge _020620A6
	ldrsb r3, [r5, r2]
	lsl r3, r3, #4
	add r3, r0, r3
	ldr r3, [r1, r3]
	cmp r6, r3
	bne _02062092
_020620A6:
	cmp r4, #4
	blt _020620AE
	bl GF_AssertFail
_020620AE:
	add r0, r4, #1
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x1e
	sub r1, r1, r2
	mov r0, #0x1e
	ror r1, r0
	strb r6, [r5]
	mov r0, #1
	add r1, r2, r1
	ldrsb r0, [r5, r0]
	lsl r1, r1, #2
	lsl r2, r0, #4
	ldr r0, _020620F4 ; =_020FD7E0
	add r0, r0, r2
	ldr r4, [r1, r0]
	add r0, r7, #0
	mov r1, #0x80
	bl sub_0205F220
	cmp r0, #0
	beq _020620DC
	mov r0, #1
	b _020620DE
_020620DC:
	mov r0, #0
_020620DE:
	strb r0, [r5, #2]
	add r0, r7, #0
	add r1, r4, #0
	bl sub_0205F290
	add r0, r7, #0
	mov r1, #0x80
	bl sub_0205F20C
	pop {r3, r4, r5, r6, r7, pc}
	nop
_020620F4: .word _020FD7E0
	thumb_func_end sub_0206207C

	thumb_func_start sub_020620F8
sub_020620F8: ; 0x020620F8
	push {r3, lr}
	ldrb r1, [r1, #2]
	cmp r1, #0
	bne _02062106
	mov r1, #0x80
	bl sub_0205F214
_02062106:
	pop {r3, pc}
	thumb_func_end sub_020620F8

	thumb_func_start sub_02062108
sub_02062108: ; 0x02062108
	push {r4, lr}
	mov r1, #1
	add r4, r0, #0
	bl sub_0205F228
	cmp r0, #0
	bne _0206211A
	mov r0, #0
	pop {r4, pc}
_0206211A:
	add r0, r4, #0
	mov r1, #2
	bl sub_0205F228
	cmp r0, #1
	bne _0206212A
	mov r0, #0
	pop {r4, pc}
_0206212A:
	add r0, r4, #0
	mov r1, #0x10
	bl sub_0205F228
	cmp r0, #1
	bne _02062146
	add r0, r4, #0
	mov r1, #0x20
	bl sub_0205F228
	cmp r0, #0
	bne _02062146
	mov r0, #0
	pop {r4, pc}
_02062146:
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02062108

	thumb_func_start sub_0206214C
sub_0206214C: ; 0x0206214C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #0x71
	blt _0206215A
	bl GF_AssertFail
_0206215A:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205F4CC
	add r0, r5, #0
	mov r1, #0
	bl sub_0205F4DC
	add r0, r5, #0
	mov r1, #0x10
	bl sub_0205F20C
	add r0, r5, #0
	mov r1, #0x20
	bl sub_0205F214
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0206214C

	thumb_func_start sub_0206217C
sub_0206217C: ; 0x0206217C
	push {r4, lr}
	add r4, r0, #0
	bl sub_0205F4CC
	add r0, r4, #0
	mov r1, #0
	bl sub_0205F4DC
	add r0, r4, #0
	mov r1, #0x20
	bl sub_0205F214
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0206217C

	thumb_func_start sub_02062198
sub_02062198: ; 0x02062198
	push {r4, lr}
	mov r1, #0x10
	add r4, r0, #0
	bl sub_0205F228
	cmp r0, #0
	bne _020621AA
	mov r0, #1
	pop {r4, pc}
_020621AA:
	add r0, r4, #0
	mov r1, #0x20
	bl sub_0205F228
	cmp r0, #0
	beq _020621BA
	mov r0, #1
	pop {r4, pc}
_020621BA:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02062198

	thumb_func_start sub_020621C0
sub_020621C0: ; 0x020621C0
	push {r4, lr}
	mov r1, #0x10
	add r4, r0, #0
	bl sub_0205F228
	cmp r0, #0
	bne _020621D2
	mov r0, #1
	pop {r4, pc}
_020621D2:
	add r0, r4, #0
	mov r1, #0x20
	bl sub_0205F228
	cmp r0, #0
	bne _020621E2
	mov r0, #0
	pop {r4, pc}
_020621E2:
	add r0, r4, #0
	mov r1, #0x30
	bl sub_0205F214
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020621C0

	thumb_func_start sub_020621F0
sub_020621F0: ; 0x020621F0
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0x10
	bl sub_0205F214
	add r0, r4, #0
	mov r1, #0x20
	bl sub_0205F20C
	add r0, r4, #0
	mov r1, #0xff
	bl sub_0205F4CC
	add r0, r4, #0
	mov r1, #0
	bl sub_0205F4DC
	pop {r4, pc}
	thumb_func_end sub_020621F0

	thumb_func_start sub_02062214
sub_02062214: ; 0x02062214
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #4
	mov r1, #0x14
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	bne _0206222A
	bl GF_AssertFail
_0206222A:
	add r2, r4, #0
	mov r1, #0x14
	mov r0, #0
_02062230:
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _02062230
	add r0, r5, #0
	bl sub_0205F35C
	bl sub_0205F19C
	sub r2, r0, #1
	ldr r0, _0206225C ; =sub_0206229C
	add r1, r4, #0
	bl sub_0200E320
	add r7, r0, #0
	bne _02062254
	bl GF_AssertFail
_02062254:
	str r5, [r4, #0xc]
	str r6, [r4, #0x10]
	add r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0206225C: .word sub_0206229C
	thumb_func_end sub_02062214

	thumb_func_start sub_02062260
sub_02062260: ; 0x02062260
	push {r3, lr}
	bl sub_0201F988
	ldr r0, [r0, #4]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02062260

	thumb_func_start sub_0206226C
sub_0206226C: ; 0x0206226C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_0201F988
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	bl sub_02062198
	cmp r0, #1
	beq _02062284
	bl GF_AssertFail
_02062284:
	ldr r0, [r4, #0xc]
	bl sub_020621C0
	mov r0, #4
	add r1, r4, #0
	bl FreeToHeapExplicit
	add r0, r5, #0
	bl sub_0200E390
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0206226C

	thumb_func_start sub_0206229C
sub_0206229C: ; 0x0206229C
	push {r3, r4, r5, lr}
	ldr r4, _020622B4 ; =_020FDA38
	add r5, r1, #0
_020622A2:
	ldr r1, [r5]
	add r0, r5, #0
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	blx r1
	cmp r0, #1
	beq _020622A2
	pop {r3, r4, r5, pc}
	nop
_020622B4: .word _020FDA38
	thumb_func_end sub_0206229C

	thumb_func_start sub_020622B8
sub_020622B8: ; 0x020622B8
	mov r1, #0
	str r1, [r0, #8]
	mov r1, #1
	str r1, [r0]
	add r0, r1, #0
	bx lr
	thumb_func_end sub_020622B8

	thumb_func_start sub_020622C4
sub_020622C4: ; 0x020622C4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	bl sub_02062108
	cmp r0, #0
	bne _020622D6
	mov r0, #0
	pop {r4, pc}
_020622D6:
	mov r0, #2
	str r0, [r4]
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020622C4

	thumb_func_start sub_020622E0
sub_020622E0: ; 0x020622E0
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0x10]
	ldr r0, [r4, #0xc]
	ldrh r1, [r1]
	bl sub_0206214C
	mov r0, #3
	str r0, [r4]
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020622E0

	thumb_func_start sub_020622F8
sub_020622F8: ; 0x020622F8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	bl sub_02062198
	cmp r0, #0
	bne _0206230A
	mov r0, #0
	pop {r4, pc}
_0206230A:
	mov r0, #4
	str r0, [r4]
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020622F8

	thumb_func_start sub_02062314
sub_02062314: ; 0x02062314
	ldr r1, [r0, #8]
	ldr r3, [r0, #0x10]
	add r2, r1, #1
	str r2, [r0, #8]
	ldrh r1, [r3, #2]
	cmp r2, r1
	bge _0206232A
	mov r1, #1
	str r1, [r0]
	add r0, r1, #0
	bx lr
_0206232A:
	add r1, r3, #4
	str r1, [r0, #0x10]
	ldrh r1, [r3, #4]
	cmp r1, #0xfe
	beq _0206233C
	mov r1, #0
	str r1, [r0]
	mov r0, #1
	bx lr
_0206233C:
	mov r1, #1
	str r1, [r0, #4]
	mov r1, #5
	str r1, [r0]
	mov r0, #0
	bx lr
	thumb_func_end sub_02062314

	thumb_func_start sub_02062348
sub_02062348: ; 0x02062348
	mov r0, #0
	bx lr
	thumb_func_end sub_02062348

	thumb_func_start sub_0206234C
sub_0206234C: ; 0x0206234C
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r4, r1, #0
	cmp r7, #4
	blt _0206235A
	bl GF_AssertFail
_0206235A:
	ldr r3, _0206238C ; =_020FD198
	ldr r6, [r3]
	cmp r6, #0
	beq _02062384
	mov r1, #0
_02062364:
	add r2, r1, #0
	add r5, r6, #0
_02062368:
	ldr r0, [r5]
	cmp r4, r0
	bne _02062374
	lsl r0, r7, #2
	ldr r0, [r6, r0]
	pop {r3, r4, r5, r6, r7, pc}
_02062374:
	add r2, r2, #1
	add r5, r5, #4
	cmp r2, #4
	blt _02062368
	add r3, r3, #4
	ldr r6, [r3]
	cmp r6, #0
	bne _02062364
_02062384:
	bl GF_AssertFail
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0206238C: .word _020FD198
	thumb_func_end sub_0206234C

	thumb_func_start sub_02062390
sub_02062390: ; 0x02062390
	push {r4, r5}
	ldr r4, _020623C4 ; =_020FD198
	ldr r5, [r4]
	cmp r5, #0
	beq _020623BA
	mov r2, #0
_0206239C:
	add r3, r2, #0
_0206239E:
	ldr r1, [r5]
	cmp r0, r1
	bne _020623AA
	add r0, r3, #0
	pop {r4, r5}
	bx lr
_020623AA:
	add r3, r3, #1
	add r5, r5, #4
	cmp r3, #4
	blt _0206239E
	add r4, r4, #4
	ldr r5, [r4]
	cmp r5, #0
	bne _0206239C
_020623BA:
	mov r0, #0
	mvn r0, r0
	pop {r4, r5}
	bx lr
	nop
_020623C4: .word _020FD198
	thumb_func_end sub_02062390

	thumb_func_start sub_020623C8
sub_020623C8: ; 0x020623C8
	sub r0, #0x38
	cmp r0, #3
	bhi _020623D2
	mov r0, #1
	bx lr
_020623D2:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end sub_020623C8

	thumb_func_start sub_020623D8
sub_020623D8: ; 0x020623D8
	push {r4, lr}
	sub sp, #0x10
	ldr r3, _020623FC ; =_020FDA28
	add r2, sp, #0
	add r4, r0, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	cmp r4, #4
	blt _020623F2
	bl GF_AssertFail
_020623F2:
	lsl r1, r4, #2
	add r0, sp, #0
	ldr r0, [r0, r1]
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
_020623FC: .word _020FDA28
	thumb_func_end sub_020623D8

	thumb_func_start sub_02062400
sub_02062400: ; 0x02062400
	push {r3, r4, r5, lr}
	add r5, r0, #0
_02062404:
	add r0, r5, #0
	bl sub_0205F4D4
	add r4, r0, #0
	cmp r4, #0xff
	beq _02062424
	add r0, r5, #0
	bl sub_0205F4F4
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0206245C
	cmp r0, #0
	bne _02062404
_02062424:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02062400

	thumb_func_start sub_02062428
sub_02062428: ; 0x02062428
	push {r4, lr}
	add r4, r0, #0
	bl sub_02062400
	add r0, r4, #0
	mov r1, #0x20
	bl sub_0205F228
	cmp r0, #0
	bne _02062440
	mov r0, #0
	pop {r4, pc}
_02062440:
	add r0, r4, #0
	mov r1, #0x20
	bl sub_0205F214
	add r0, r4, #0
	mov r1, #0xff
	bl sub_0205F4CC
	add r0, r4, #0
	mov r1, #0
	bl sub_0205F4DC
	mov r0, #1
	pop {r4, pc}
	thumb_func_end sub_02062428

	thumb_func_start sub_0206245C
sub_0206245C: ; 0x0206245C
	push {r3, lr}
	lsl r3, r1, #2
	ldr r1, _0206246C ; =_020FD2D8
	ldr r3, [r1, r3]
	lsl r1, r2, #2
	ldr r1, [r3, r1]
	blx r1
	pop {r3, pc}
	.balign 4, 0
_0206246C: .word _020FD2D8
	thumb_func_end sub_0206245C

	thumb_func_start sub_02062470
sub_02062470: ; 0x02062470
	push {r3, lr}
	mov r1, #0x20
	bl sub_0205F20C
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_02062470

	thumb_func_start sub_0206247C
sub_0206247C: ; 0x0206247C
	push {r4, lr}
	add r4, r0, #0
	bl sub_0205F290
	add r0, r4, #0
	mov r1, #0
	bl sub_0205F328
	add r0, r4, #0
	bl sub_02060F78
	add r0, r4, #0
	bl sub_0205F4E4
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0206247C

	thumb_func_start sub_0206249C
sub_0206249C: ; 0x0206249C
	push {r3, lr}
	mov r1, #0
	bl sub_0206247C
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_0206249C

	thumb_func_start sub_020624A8
sub_020624A8: ; 0x020624A8
	push {r3, lr}
	mov r1, #1
	bl sub_0206247C
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_020624A8

	thumb_func_start sub_020624B4
sub_020624B4: ; 0x020624B4
	push {r3, lr}
	mov r1, #2
	bl sub_0206247C
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_020624B4

	thumb_func_start sub_020624C0
sub_020624C0: ; 0x020624C0
	push {r3, lr}
	mov r1, #3
	bl sub_0206247C
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_020624C0

	thumb_func_start sub_020624CC
sub_020624CC: ; 0x020624CC
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	mov r1, #0xc
	add r5, r0, #0
	add r6, r2, #0
	add r7, r3, #0
	bl sub_0205F3C0
	add r1, sp, #8
	ldrh r1, [r1, #0x10]
	strh r1, [r0]
	strh r7, [r0, #2]
	str r4, [r0, #4]
	str r6, [r0, #8]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02060F24
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205F2BC
	add r1, sp, #8
	ldrh r1, [r1, #0x10]
	add r0, r5, #0
	bl sub_0205F328
	add r0, r5, #0
	mov r1, #4
	bl sub_0205F20C
	add r0, r5, #0
	bl sub_0205F4E4
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_020624CC

	thumb_func_start sub_02062514
sub_02062514: ; 0x02062514
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_0205F3E4
	add r4, r0, #0
	ldr r1, [r4, #4]
	ldr r2, [r4, #8]
	add r0, r5, #0
	bl sub_0206101C
	add r0, r5, #0
	bl sub_02061070
	mov r0, #2
	ldrsh r1, [r4, r0]
	sub r1, r1, #1
	strh r1, [r4, #2]
	ldrsh r0, [r4, r0]
	cmp r0, #0
	ble _02062540
	mov r0, #0
	pop {r3, r4, r5, pc}
_02062540:
	add r0, r5, #0
	mov r1, #0x28
	bl sub_0205F20C
	add r0, r5, #0
	bl sub_02060F78
	add r0, r5, #0
	bl sub_0205F484
	add r0, r5, #0
	mov r1, #0
	bl sub_0205F328
	add r0, r5, #0
	bl sub_0205F4E4
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02062514

	thumb_func_start sub_02062568
sub_02062568: ; 0x02062568
	push {r3, lr}
	mov r2, #1
	str r2, [sp]
	mov r1, #0
	lsl r2, r2, #0xb
	mov r3, #0x20
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02062568

	thumb_func_start sub_0206257C
sub_0206257C: ; 0x0206257C
	push {r3, lr}
	mov r1, #1
	lsl r2, r1, #0xb
	mov r3, #0x20
	str r1, [sp]
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0206257C

	thumb_func_start sub_02062590
sub_02062590: ; 0x02062590
	push {r3, lr}
	mov r1, #1
	str r1, [sp]
	mov r1, #2
	lsl r2, r1, #0xa
	mov r3, #0x20
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02062590

	thumb_func_start sub_020625A4
sub_020625A4: ; 0x020625A4
	push {r3, lr}
	mov r2, #1
	str r2, [sp]
	mov r1, #3
	lsl r2, r2, #0xb
	mov r3, #0x20
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_020625A4

	thumb_func_start sub_020625B8
sub_020625B8: ; 0x020625B8
	push {r3, lr}
	mov r2, #2
	str r2, [sp]
	mov r1, #0
	lsl r2, r2, #0xb
	mov r3, #0x10
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_020625B8

	thumb_func_start sub_020625CC
sub_020625CC: ; 0x020625CC
	push {r3, lr}
	mov r1, #2
	str r1, [sp]
	mov r1, #1
	lsl r2, r1, #0xc
	mov r3, #0x10
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_020625CC

	thumb_func_start sub_020625E0
sub_020625E0: ; 0x020625E0
	push {r3, lr}
	mov r1, #2
	lsl r2, r1, #0xb
	mov r3, #0x10
	str r1, [sp]
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_020625E0

	thumb_func_start sub_020625F4
sub_020625F4: ; 0x020625F4
	push {r3, lr}
	mov r2, #2
	str r2, [sp]
	mov r1, #3
	lsl r2, r2, #0xb
	mov r3, #0x10
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_020625F4

	thumb_func_start sub_02062608
sub_02062608: ; 0x02062608
	push {r3, lr}
	mov r1, #3
	mov r2, #2
	str r1, [sp]
	mov r1, #0
	lsl r2, r2, #0xc
	mov r3, #8
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02062608

	thumb_func_start sub_02062620
sub_02062620: ; 0x02062620
	push {r3, lr}
	mov r1, #3
	str r1, [sp]
	mov r1, #1
	lsl r2, r1, #0xd
	mov r3, #8
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02062620

	thumb_func_start sub_02062634
sub_02062634: ; 0x02062634
	push {r3, lr}
	mov r1, #3
	str r1, [sp]
	mov r1, #2
	lsl r2, r1, #0xc
	mov r3, #8
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02062634

	thumb_func_start sub_02062648
sub_02062648: ; 0x02062648
	push {r3, lr}
	mov r2, #2
	mov r1, #3
	lsl r2, r2, #0xc
	mov r3, #8
	str r1, [sp]
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02062648

	thumb_func_start sub_0206265C
sub_0206265C: ; 0x0206265C
	push {r3, lr}
	mov r3, #4
	mov r1, #0
	lsl r2, r3, #0xc
	str r3, [sp]
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0206265C

	thumb_func_start sub_02062670
sub_02062670: ; 0x02062670
	push {r3, lr}
	mov r1, #1
	mov r3, #4
	lsl r2, r1, #0xe
	str r3, [sp]
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02062670

	thumb_func_start sub_02062684
sub_02062684: ; 0x02062684
	push {r3, lr}
	mov r1, #2
	mov r3, #4
	lsl r2, r1, #0xd
	str r3, [sp]
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02062684

	thumb_func_start sub_02062698
sub_02062698: ; 0x02062698
	push {r3, lr}
	mov r3, #4
	mov r1, #3
	lsl r2, r3, #0xc
	str r3, [sp]
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02062698

	thumb_func_start sub_020626AC
sub_020626AC: ; 0x020626AC
	push {r3, lr}
	mov r1, #5
	mov r2, #2
	str r1, [sp]
	mov r1, #0
	lsl r2, r2, #0xe
	mov r3, #2
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_020626AC

	thumb_func_start sub_020626C4
sub_020626C4: ; 0x020626C4
	push {r3, lr}
	mov r1, #5
	str r1, [sp]
	mov r1, #1
	lsl r2, r1, #0xf
	mov r3, #2
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_020626C4

	thumb_func_start sub_020626D8
sub_020626D8: ; 0x020626D8
	push {r3, lr}
	mov r1, #5
	str r1, [sp]
	mov r1, #2
	lsl r2, r1, #0xe
	add r3, r1, #0
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_020626D8

	thumb_func_start sub_020626EC
sub_020626EC: ; 0x020626EC
	push {r3, lr}
	mov r1, #5
	mov r2, #2
	str r1, [sp]
	mov r1, #3
	lsl r2, r2, #0xe
	mov r3, #2
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_020626EC

	thumb_func_start sub_02062704
sub_02062704: ; 0x02062704
	push {r3, lr}
	mov r2, #1
	mov r1, #0
	lsl r2, r2, #0x10
	mov r3, #1
	str r1, [sp]
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02062704

	thumb_func_start sub_02062718
sub_02062718: ; 0x02062718
	push {r3, lr}
	mov r1, #0
	str r1, [sp]
	mov r1, #1
	lsl r2, r1, #0x10
	add r3, r1, #0
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02062718

	thumb_func_start sub_0206272C
sub_0206272C: ; 0x0206272C
	push {r3, lr}
	mov r1, #0
	str r1, [sp]
	mov r1, #2
	lsl r2, r1, #0xf
	mov r3, #1
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_0206272C

	thumb_func_start sub_02062740
sub_02062740: ; 0x02062740
	push {r3, lr}
	mov r1, #0
	mov r2, #1
	str r1, [sp]
	mov r1, #3
	lsl r2, r2, #0x10
	mov r3, #1
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02062740

	thumb_func_start sub_02062758
sub_02062758: ; 0x02062758
	push {r3, lr}
	mov r1, #9
	mov r2, #1
	str r1, [sp]
	mov r1, #0
	lsl r2, r2, #0xe
	mov r3, #4
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02062758

	thumb_func_start sub_02062770
sub_02062770: ; 0x02062770
	push {r3, lr}
	mov r1, #9
	str r1, [sp]
	mov r1, #1
	lsl r2, r1, #0xe
	mov r3, #4
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02062770

	thumb_func_start sub_02062784
sub_02062784: ; 0x02062784
	push {r3, lr}
	mov r1, #9
	str r1, [sp]
	mov r1, #2
	lsl r2, r1, #0xd
	mov r3, #4
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02062784

	thumb_func_start sub_02062798
sub_02062798: ; 0x02062798
	push {r3, lr}
	mov r1, #9
	mov r2, #1
	str r1, [sp]
	mov r1, #3
	lsl r2, r2, #0xe
	mov r3, #4
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02062798

	thumb_func_start sub_020627B0
sub_020627B0: ; 0x020627B0
	push {r3, r4, r5, r6, r7, lr}
	add r7, r1, #0
	add r6, r2, #0
	add r4, r3, #0
	mov r1, #0xc
	add r5, r0, #0
	bl sub_0205F3C0
	strh r4, [r0]
	add r1, r6, #1
	strh r1, [r0, #2]
	add r0, r5, #0
	add r1, r7, #0
	bl sub_0205F290
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205F328
	add r0, r5, #0
	bl sub_02060F78
	add r0, r5, #0
	bl sub_0205F4E4
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_020627B0

	thumb_func_start sub_020627E4
sub_020627E4: ; 0x020627E4
	push {r4, lr}
	add r4, r0, #0
	bl sub_0205F3E4
	mov r1, #2
	ldrsh r2, [r0, r1]
	sub r2, r2, #1
	strh r2, [r0, #2]
	ldrsh r0, [r0, r1]
	cmp r0, #0
	ble _020627FE
	mov r0, #0
	pop {r4, pc}
_020627FE:
	add r0, r4, #0
	mov r1, #0x20
	bl sub_0205F20C
	add r0, r4, #0
	mov r1, #0
	bl sub_0205F328
	add r0, r4, #0
	bl sub_0205F4E4
	mov r0, #1
	pop {r4, pc}
	thumb_func_end sub_020627E4

	thumb_func_start sub_02062818
sub_02062818: ; 0x02062818
	push {r3, lr}
	mov r1, #0
	mov r2, #0x20
	mov r3, #1
	bl sub_020627B0
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02062818

	thumb_func_start sub_02062828
sub_02062828: ; 0x02062828
	push {r3, lr}
	mov r1, #1
	mov r2, #0x20
	add r3, r1, #0
	bl sub_020627B0
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02062828

	thumb_func_start sub_02062838
sub_02062838: ; 0x02062838
	push {r3, lr}
	mov r1, #2
	mov r2, #0x20
	mov r3, #1
	bl sub_020627B0
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02062838

	thumb_func_start sub_02062848
sub_02062848: ; 0x02062848
	push {r3, lr}
	mov r1, #3
	mov r2, #0x20
	mov r3, #1
	bl sub_020627B0
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02062848

	thumb_func_start sub_02062858
sub_02062858: ; 0x02062858
	push {r3, lr}
	mov r1, #0
	mov r2, #0x10
	mov r3, #2
	bl sub_020627B0
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02062858

	thumb_func_start sub_02062868
sub_02062868: ; 0x02062868
	push {r3, lr}
	mov r1, #1
	mov r2, #0x10
	mov r3, #2
	bl sub_020627B0
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02062868

	thumb_func_start sub_02062878
sub_02062878: ; 0x02062878
	push {r3, lr}
	mov r1, #2
	mov r2, #0x10
	add r3, r1, #0
	bl sub_020627B0
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02062878

	thumb_func_start sub_02062888
sub_02062888: ; 0x02062888
	push {r3, lr}
	mov r1, #3
	mov r2, #0x10
	mov r3, #2
	bl sub_020627B0
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02062888

	thumb_func_start sub_02062898
sub_02062898: ; 0x02062898
	push {r3, lr}
	mov r1, #0
	mov r2, #8
	mov r3, #3
	bl sub_020627B0
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02062898

	thumb_func_start sub_020628A8
sub_020628A8: ; 0x020628A8
	push {r3, lr}
	mov r1, #1
	mov r2, #8
	mov r3, #3
	bl sub_020627B0
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_020628A8

	thumb_func_start sub_020628B8
sub_020628B8: ; 0x020628B8
	push {r3, lr}
	mov r1, #2
	mov r2, #8
	mov r3, #3
	bl sub_020627B0
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_020628B8

	thumb_func_start sub_020628C8
sub_020628C8: ; 0x020628C8
	push {r3, lr}
	mov r1, #3
	mov r2, #8
	add r3, r1, #0
	bl sub_020627B0
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_020628C8

	thumb_func_start sub_020628D8
sub_020628D8: ; 0x020628D8
	push {r3, lr}
	mov r2, #4
	mov r1, #0
	add r3, r2, #0
	bl sub_020627B0
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_020628D8

	thumb_func_start sub_020628E8
sub_020628E8: ; 0x020628E8
	push {r3, lr}
	mov r2, #4
	mov r1, #1
	add r3, r2, #0
	bl sub_020627B0
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_020628E8

	thumb_func_start sub_020628F8
sub_020628F8: ; 0x020628F8
	push {r3, lr}
	mov r2, #4
	mov r1, #2
	add r3, r2, #0
	bl sub_020627B0
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_020628F8

	thumb_func_start sub_02062908
sub_02062908: ; 0x02062908
	push {r3, lr}
	mov r2, #4
	mov r1, #3
	add r3, r2, #0
	bl sub_020627B0
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02062908

	thumb_func_start sub_02062918
sub_02062918: ; 0x02062918
	push {r3, lr}
	mov r1, #0
	mov r2, #2
	mov r3, #5
	bl sub_020627B0
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02062918

	thumb_func_start sub_02062928
sub_02062928: ; 0x02062928
	push {r3, lr}
	mov r1, #1
	mov r2, #2
	mov r3, #5
	bl sub_020627B0
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02062928

	thumb_func_start sub_02062938
sub_02062938: ; 0x02062938
	push {r3, lr}
	mov r1, #2
	add r2, r1, #0
	mov r3, #5
	bl sub_020627B0
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02062938

	thumb_func_start sub_02062948
sub_02062948: ; 0x02062948
	push {r3, lr}
	mov r1, #3
	mov r2, #2
	mov r3, #5
	bl sub_020627B0
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02062948

	thumb_func_start sub_02062958
sub_02062958: ; 0x02062958
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	mov r1, #0x10
	add r5, r0, #0
	add r6, r2, #0
	add r7, r3, #0
	bl sub_0205F3C0
	strb r4, [r0, #0xc]
	str r6, [r0]
	strb r7, [r0, #0xd]
	add r2, sp, #8
	ldrh r1, [r2, #0x10]
	strb r1, [r0, #0xe]
	mov r1, #0x14
	ldrsh r1, [r2, r1]
	cmp r6, #0
	strb r1, [r0, #0xf]
	ldrh r1, [r2, #0x18]
	strh r1, [r0, #8]
	bne _0206298A
	add r0, r5, #0
	bl sub_02060F78
	b _02062992
_0206298A:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02060F24
_02062992:
	ldr r1, _020629C4 ; =0x00010004
	add r0, r5, #0
	bl sub_0205F20C
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205F2BC
	add r1, sp, #8
	ldrh r1, [r1, #0x10]
	add r0, r5, #0
	bl sub_0205F328
	add r0, r5, #0
	bl sub_0205F4E4
	add r0, r5, #0
	bl sub_0205F684
	cmp r0, #0
	bne _020629C2
	ldr r0, _020629C8 ; =0x0000060A
	bl PlaySE
_020629C2:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_020629C4: .word 0x00010004
_020629C8: .word 0x0000060A
	thumb_func_end sub_02062958

	thumb_func_start sub_020629CC
sub_020629CC: ; 0x020629CC
	push {r3, r4, r5, lr}
	sub sp, #0x18
	add r5, r0, #0
	bl sub_0205F3E4
	add r4, r0, #0
	ldr r2, [r4]
	cmp r2, #0
	beq _02062A1C
	mov r1, #0xc
	ldrsb r1, [r4, r1]
	add r0, r5, #0
	bl sub_0206101C
	add r0, r5, #0
	bl sub_02061070
	mov r0, #1
	ldr r1, [r4, #4]
	lsl r0, r0, #0x10
	cmp r1, r0
	blt _02062A0E
	mov r0, #0
	str r0, [r4, #4]
	mov r1, #0xc
	ldrsb r1, [r4, r1]
	add r0, r5, #0
	bl sub_02060F24
	add r0, r5, #0
	mov r1, #4
	bl sub_0205F20C
_02062A0E:
	ldr r1, [r4]
	cmp r1, #0
	bge _02062A16
	neg r1, r1
_02062A16:
	ldr r0, [r4, #4]
	add r0, r0, r1
	str r0, [r4, #4]
_02062A1C:
	ldrh r1, [r4, #0xa]
	ldrh r0, [r4, #8]
	add r0, r1, r0
	strh r0, [r4, #0xa]
	mov r0, #0xf
	ldrh r1, [r4, #0xa]
	lsl r0, r0, #8
	cmp r1, r0
	bls _02062A30
	strh r0, [r4, #0xa]
_02062A30:
	mov r1, #0xf
	ldrsb r1, [r4, r1]
	ldrh r0, [r4, #0xa]
	lsl r2, r1, #2
	ldr r1, _02062AB0 ; =0x0210FACC
	lsr r0, r0, #8
	lsl r0, r0, #0x10
	ldr r2, [r1, r2]
	mov r1, #0
	str r1, [sp, #0xc]
	lsr r0, r0, #0xe
	ldr r0, [r2, r0]
	str r0, [sp, #0x10]
	str r1, [sp, #0x14]
	add r0, r5, #0
	add r1, sp, #0xc
	bl sub_0205F97C
	mov r0, #0xd
	ldrsb r1, [r4, r0]
	sub r1, r1, #1
	strb r1, [r4, #0xd]
	ldrsb r0, [r4, r0]
	cmp r0, #0
	ble _02062A68
	add sp, #0x18
	mov r0, #0
	pop {r3, r4, r5, pc}
_02062A68:
	add r1, sp, #0
	mov r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	add r0, r5, #0
	bl sub_0205F97C
	ldr r1, _02062AB4 ; =0x00020028
	add r0, r5, #0
	bl sub_0205F20C
	add r0, r5, #0
	bl sub_02060F78
	add r0, r5, #0
	bl sub_0205F484
	add r0, r5, #0
	mov r1, #0
	bl sub_0205F328
	add r0, r5, #0
	bl sub_0205F4E4
	add r0, r5, #0
	bl sub_0205F684
	cmp r0, #0
	bne _02062AAA
	ldr r0, _02062AB8 ; =0x00000646
	bl PlaySE
_02062AAA:
	mov r0, #1
	add sp, #0x18
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02062AB0: .word 0x0210FACC
_02062AB4: .word 0x00020028
_02062AB8: .word 0x00000646
	thumb_func_end sub_020629CC

	thumb_func_start sub_02062ABC
sub_02062ABC: ; 0x02062ABC
	push {lr}
	sub sp, #0xc
	mov r2, #2
	str r2, [sp]
	mov r1, #0
	str r1, [sp, #4]
	add r2, #0xfe
	str r2, [sp, #8]
	add r2, r1, #0
	mov r3, #0x10
	bl sub_02062958
	mov r0, #1
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end sub_02062ABC

	thumb_func_start sub_02062ADC
sub_02062ADC: ; 0x02062ADC
	push {lr}
	sub sp, #0xc
	mov r1, #2
	str r1, [sp]
	mov r2, #0
	str r2, [sp, #4]
	add r1, #0xfe
	str r1, [sp, #8]
	mov r1, #1
	mov r3, #0x10
	bl sub_02062958
	mov r0, #1
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end sub_02062ADC

	thumb_func_start sub_02062AFC
sub_02062AFC: ; 0x02062AFC
	push {lr}
	sub sp, #0xc
	mov r1, #2
	add r3, r1, #0
	str r1, [sp]
	mov r2, #0
	str r2, [sp, #4]
	add r3, #0xfe
	str r3, [sp, #8]
	mov r3, #0x10
	bl sub_02062958
	mov r0, #1
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end sub_02062AFC

	thumb_func_start sub_02062B1C
sub_02062B1C: ; 0x02062B1C
	push {lr}
	sub sp, #0xc
	mov r1, #2
	str r1, [sp]
	mov r2, #0
	str r2, [sp, #4]
	add r1, #0xfe
	str r1, [sp, #8]
	mov r1, #3
	mov r3, #0x10
	bl sub_02062958
	mov r0, #1
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end sub_02062B1C

	thumb_func_start sub_02062B3C
sub_02062B3C: ; 0x02062B3C
	push {lr}
	sub sp, #0xc
	mov r1, #3
	str r1, [sp]
	mov r1, #0
	mov r2, #2
	str r1, [sp, #4]
	lsl r2, r2, #8
	str r2, [sp, #8]
	add r2, r1, #0
	mov r3, #8
	bl sub_02062958
	mov r0, #1
	add sp, #0xc
	pop {pc}
	thumb_func_end sub_02062B3C

	thumb_func_start sub_02062B5C
sub_02062B5C: ; 0x02062B5C
	push {lr}
	sub sp, #0xc
	mov r1, #3
	str r1, [sp]
	mov r2, #0
	mov r1, #2
	str r2, [sp, #4]
	lsl r1, r1, #8
	str r1, [sp, #8]
	mov r1, #1
	mov r3, #8
	bl sub_02062958
	mov r0, #1
	add sp, #0xc
	pop {pc}
	thumb_func_end sub_02062B5C

	thumb_func_start sub_02062B7C
sub_02062B7C: ; 0x02062B7C
	push {lr}
	sub sp, #0xc
	mov r1, #3
	str r1, [sp]
	mov r2, #0
	mov r1, #2
	str r2, [sp, #4]
	lsl r1, r1, #8
	str r1, [sp, #8]
	mov r1, #2
	mov r3, #8
	bl sub_02062958
	mov r0, #1
	add sp, #0xc
	pop {pc}
	thumb_func_end sub_02062B7C

	thumb_func_start sub_02062B9C
sub_02062B9C: ; 0x02062B9C
	push {lr}
	sub sp, #0xc
	mov r1, #3
	mov r3, #2
	str r1, [sp]
	mov r2, #0
	str r2, [sp, #4]
	lsl r3, r3, #8
	str r3, [sp, #8]
	mov r3, #8
	bl sub_02062958
	mov r0, #1
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end sub_02062B9C

	thumb_func_start sub_02062BBC
sub_02062BBC: ; 0x02062BBC
	push {lr}
	sub sp, #0xc
	mov r1, #3
	str r1, [sp]
	mov r1, #0
	mov r2, #2
	str r1, [sp, #4]
	lsl r2, r2, #8
	str r2, [sp, #8]
	lsl r2, r2, #4
	mov r3, #8
	bl sub_02062958
	mov r0, #1
	add sp, #0xc
	pop {pc}
	thumb_func_end sub_02062BBC

	thumb_func_start sub_02062BDC
sub_02062BDC: ; 0x02062BDC
	push {lr}
	sub sp, #0xc
	mov r1, #3
	str r1, [sp]
	mov r1, #0
	str r1, [sp, #4]
	mov r1, #2
	lsl r1, r1, #8
	str r1, [sp, #8]
	mov r1, #1
	lsl r2, r1, #0xd
	mov r3, #8
	bl sub_02062958
	mov r0, #1
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end sub_02062BDC

	thumb_func_start sub_02062C00
sub_02062C00: ; 0x02062C00
	push {lr}
	sub sp, #0xc
	mov r1, #3
	str r1, [sp]
	mov r1, #0
	str r1, [sp, #4]
	mov r1, #2
	lsl r1, r1, #8
	str r1, [sp, #8]
	mov r1, #2
	lsl r2, r1, #0xc
	mov r3, #8
	bl sub_02062958
	mov r0, #1
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end sub_02062C00

	thumb_func_start sub_02062C24
sub_02062C24: ; 0x02062C24
	push {lr}
	sub sp, #0xc
	mov r1, #3
	str r1, [sp]
	mov r2, #0
	str r2, [sp, #4]
	mov r2, #2
	lsl r2, r2, #8
	str r2, [sp, #8]
	lsl r2, r2, #4
	mov r3, #8
	bl sub_02062958
	mov r0, #1
	add sp, #0xc
	pop {pc}
	thumb_func_end sub_02062C24

	thumb_func_start sub_02062C44
sub_02062C44: ; 0x02062C44
	push {lr}
	sub sp, #0xc
	mov r2, #3
	str r2, [sp]
	mov r1, #0
	str r1, [sp, #4]
	add r2, #0xfd
	str r2, [sp, #8]
	mov r2, #2
	lsl r2, r2, #0xc
	mov r3, #0x10
	bl sub_02062958
	mov r0, #1
	add sp, #0xc
	pop {pc}
	thumb_func_end sub_02062C44

	thumb_func_start sub_02062C64
sub_02062C64: ; 0x02062C64
	push {lr}
	sub sp, #0xc
	mov r2, #3
	str r2, [sp]
	mov r1, #0
	str r1, [sp, #4]
	add r2, #0xfd
	mov r1, #1
	str r2, [sp, #8]
	lsl r2, r1, #0xd
	mov r3, #0x10
	bl sub_02062958
	mov r0, #1
	add sp, #0xc
	pop {pc}
	thumb_func_end sub_02062C64

	thumb_func_start sub_02062C84
sub_02062C84: ; 0x02062C84
	push {lr}
	sub sp, #0xc
	mov r2, #3
	str r2, [sp]
	mov r1, #0
	str r1, [sp, #4]
	add r2, #0xfd
	mov r1, #2
	str r2, [sp, #8]
	lsl r2, r1, #0xc
	mov r3, #0x10
	bl sub_02062958
	mov r0, #1
	add sp, #0xc
	pop {pc}
	thumb_func_end sub_02062C84

	thumb_func_start sub_02062CA4
sub_02062CA4: ; 0x02062CA4
	push {lr}
	sub sp, #0xc
	mov r1, #3
	str r1, [sp]
	mov r2, #0
	str r2, [sp, #4]
	add r2, r1, #0
	add r2, #0xfd
	str r2, [sp, #8]
	mov r2, #2
	lsl r2, r2, #0xc
	mov r3, #0x10
	bl sub_02062958
	mov r0, #1
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end sub_02062CA4

	thumb_func_start sub_02062CC8
sub_02062CC8: ; 0x02062CC8
	push {lr}
	sub sp, #0xc
	mov r1, #0xa
	str r1, [sp]
	mov r1, #0
	str r1, [sp, #4]
	mov r1, #0xf0
	str r1, [sp, #8]
	mov r1, #2
	lsl r2, r1, #0xb
	mov r3, #0x10
	bl sub_02062958
	mov r0, #1
	add sp, #0xc
	pop {pc}
	thumb_func_end sub_02062CC8

	thumb_func_start sub_02062CE8
sub_02062CE8: ; 0x02062CE8
	push {lr}
	sub sp, #0xc
	mov r1, #0xa
	str r1, [sp]
	mov r1, #0
	str r1, [sp, #4]
	mov r1, #0xf0
	mov r2, #1
	str r1, [sp, #8]
	mov r1, #3
	lsl r2, r2, #0xc
	mov r3, #0x10
	bl sub_02062958
	mov r0, #1
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end sub_02062CE8

	thumb_func_start sub_02062D0C
sub_02062D0C: ; 0x02062D0C
	push {lr}
	sub sp, #0xc
	mov r1, #0xb
	str r1, [sp]
	mov r1, #0
	str r1, [sp, #4]
	mov r1, #5
	lsl r1, r1, #6
	str r1, [sp, #8]
	mov r1, #2
	lsl r2, r1, #0xd
	mov r3, #0xc
	bl sub_02062958
	mov r0, #1
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end sub_02062D0C

	thumb_func_start sub_02062D30
sub_02062D30: ; 0x02062D30
	push {lr}
	sub sp, #0xc
	mov r1, #0xb
	str r1, [sp]
	mov r1, #0
	str r1, [sp, #4]
	mov r1, #5
	lsl r1, r1, #6
	mov r2, #1
	str r1, [sp, #8]
	mov r1, #3
	lsl r2, r2, #0xe
	mov r3, #0xc
	bl sub_02062958
	mov r0, #1
	add sp, #0xc
	pop {pc}
	thumb_func_end sub_02062D30

	thumb_func_start sub_02062D54
sub_02062D54: ; 0x02062D54
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	mov r1, #4
	bl sub_0205F3C0
	str r4, [r0]
	add r0, r5, #0
	bl sub_0205F4E4
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02062D54

	thumb_func_start sub_02062D6C
sub_02062D6C: ; 0x02062D6C
	push {r4, lr}
	add r4, r0, #0
	bl sub_0205F3E4
	ldr r1, [r0]
	cmp r1, #0
	beq _02062D82
	sub r1, r1, #1
	str r1, [r0]
	mov r0, #0
	pop {r4, pc}
_02062D82:
	add r0, r4, #0
	bl sub_0205F4E4
	mov r0, #1
	pop {r4, pc}
	thumb_func_end sub_02062D6C

	thumb_func_start sub_02062D8C
sub_02062D8C: ; 0x02062D8C
	push {r3, lr}
	mov r1, #1
	bl sub_02062D54
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02062D8C

	thumb_func_start sub_02062D98
sub_02062D98: ; 0x02062D98
	push {r3, lr}
	mov r1, #2
	bl sub_02062D54
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02062D98

	thumb_func_start sub_02062DA4
sub_02062DA4: ; 0x02062DA4
	push {r3, lr}
	mov r1, #4
	bl sub_02062D54
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02062DA4

	thumb_func_start sub_02062DB0
sub_02062DB0: ; 0x02062DB0
	push {r3, lr}
	mov r1, #8
	bl sub_02062D54
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02062DB0

	thumb_func_start sub_02062DBC
sub_02062DBC: ; 0x02062DBC
	push {r3, lr}
	mov r1, #0xf
	bl sub_02062D54
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02062DBC

	thumb_func_start sub_02062DC8
sub_02062DC8: ; 0x02062DC8
	push {r3, lr}
	mov r1, #0x10
	bl sub_02062D54
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02062DC8

	thumb_func_start sub_02062DD4
sub_02062DD4: ; 0x02062DD4
	push {r3, lr}
	mov r1, #0x20
	bl sub_02062D54
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02062DD4

	thumb_func_start sub_02062DE0
sub_02062DE0: ; 0x02062DE0
	push {r4, lr}
	mov r1, #8
	add r4, r0, #0
	bl sub_0205F3C0
	mov r1, #1
	lsl r1, r1, #0x10
	str r1, [r0, #4]
	add r0, r4, #0
	mov r1, #0
	bl sub_0205F328
	add r0, r4, #0
	bl sub_0205F4E4
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02062DE0

	thumb_func_start sub_02062E04
sub_02062E04: ; 0x02062E04
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	bl sub_0205F3E4
	add r4, r0, #0
	ldr r1, [r4]
	ldr r0, [r4, #4]
	add r0, r1, r0
	str r0, [r4]
	add r1, sp, #0
	mov r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	ldr r0, [r4]
	str r0, [sp, #4]
	add r0, r5, #0
	bl sub_0205F97C
	ldr r1, [r4]
	asr r0, r1, #0xe
	lsr r0, r0, #0x11
	add r0, r1, r0
	asr r0, r0, #0xf
	cmp r0, #0x28
	bge _02062E40
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, pc}
_02062E40:
	add r0, r5, #0
	bl sub_0205F4E4
	mov r0, #1
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end sub_02062E04

	thumb_func_start sub_02062E4C
sub_02062E4C: ; 0x02062E4C
	push {r4, lr}
	mov r1, #8
	add r4, r0, #0
	bl sub_0205F3C0
	mov r1, #5
	lsl r1, r1, #0x12
	str r1, [r0]
	ldr r1, _02062E74 ; =0xFFFF0000
	str r1, [r0, #4]
	add r0, r4, #0
	mov r1, #0
	bl sub_0205F328
	add r0, r4, #0
	bl sub_0205F4E4
	mov r0, #1
	pop {r4, pc}
	nop
_02062E74: .word 0xFFFF0000
	thumb_func_end sub_02062E4C

	thumb_func_start sub_02062E78
sub_02062E78: ; 0x02062E78
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	bl sub_0205F3E4
	add r4, r0, #0
	ldr r1, [r4]
	ldr r0, [r4, #4]
	add r0, r1, r0
	str r0, [r4]
	bpl _02062E92
	mov r0, #0
	str r0, [r4]
_02062E92:
	add r1, sp, #0
	mov r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	ldr r0, [r4]
	str r0, [sp, #4]
	add r0, r5, #0
	bl sub_0205F97C
	ldr r0, [r4]
	cmp r0, #0
	ble _02062EB2
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, pc}
_02062EB2:
	add r0, r5, #0
	bl sub_0205F4E4
	mov r0, #1
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02062E78

	thumb_func_start sub_02062EC0
sub_02062EC0: ; 0x02062EC0
	push {r4, lr}
	mov r1, #2
	add r4, r0, #0
	lsl r1, r1, #8
	bl sub_0205F20C
	add r0, r4, #0
	bl sub_0205F4E4
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02062EC0

	thumb_func_start sub_02062ED8
sub_02062ED8: ; 0x02062ED8
	push {r4, lr}
	mov r1, #2
	add r4, r0, #0
	lsl r1, r1, #8
	bl sub_0205F214
	add r0, r4, #0
	bl sub_0205F4E4
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02062ED8

	thumb_func_start sub_02062EF0
sub_02062EF0: ; 0x02062EF0
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0x80
	bl sub_0205F20C
	add r0, r4, #0
	bl sub_0205F4E4
	mov r0, #1
	pop {r4, pc}
	thumb_func_end sub_02062EF0

	thumb_func_start sub_02062F04
sub_02062F04: ; 0x02062F04
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0x80
	bl sub_0205F214
	add r0, r4, #0
	bl sub_0205F4E4
	mov r0, #1
	pop {r4, pc}
	thumb_func_end sub_02062F04

	thumb_func_start sub_02062F18
sub_02062F18: ; 0x02062F18
	push {r4, lr}
	mov r1, #1
	add r4, r0, #0
	lsl r1, r1, #8
	bl sub_0205F20C
	add r0, r4, #0
	bl sub_0205F4E4
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02062F18

	thumb_func_start sub_02062F30
sub_02062F30: ; 0x02062F30
	push {r4, lr}
	mov r1, #1
	add r4, r0, #0
	lsl r1, r1, #8
	bl sub_0205F214
	add r0, r4, #0
	bl sub_0205F4E4
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02062F30

	thumb_func_start sub_02062F48
sub_02062F48: ; 0x02062F48
	push {r4, r5, r6, lr}
	add r6, r1, #0
	mov r1, #8
	add r5, r0, #0
	bl sub_0205F3C0
	add r4, r0, #0
	str r6, [r4]
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #1
	bl ov01_02200540
	str r0, [r4, #4]
	add r0, r5, #0
	bl sub_0205F4E4
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02062F48

	thumb_func_start sub_02062F6C
sub_02062F6C: ; 0x02062F6C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_0205F3E4
	add r4, r0, #0
	ldr r0, [r4, #4]
	bl ov01_022003F4
	cmp r0, #1
	bne _02062F90
	ldr r0, [r4, #4]
	bl sub_02068B48
	add r0, r5, #0
	bl sub_0205F4E4
	mov r0, #1
	pop {r3, r4, r5, pc}
_02062F90:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02062F6C

	thumb_func_start sub_02062F94
sub_02062F94: ; 0x02062F94
	push {r3, lr}
	mov r1, #0
	bl sub_02062F48
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_02062F94

	thumb_func_start sub_02062FA0
sub_02062FA0: ; 0x02062FA0
	push {r3, lr}
	mov r1, #1
	bl sub_02062F48
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_02062FA0

	thumb_func_start sub_02062FAC
sub_02062FAC: ; 0x02062FAC
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	mov r1, #8
	add r5, r0, #0
	add r7, r2, #0
	add r6, r3, #0
	bl sub_0205F3C0
	strh r4, [r0]
	strh r6, [r0, #2]
	strh r7, [r0, #4]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02060F24
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205F2BC
	add r0, r5, #0
	add r1, r6, #0
	bl sub_0205F328
	add r0, r5, #0
	mov r1, #4
	bl sub_0205F20C
	add r0, r5, #0
	bl sub_0205F4E4
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02062FAC

	thumb_func_start sub_02062FEC
sub_02062FEC: ; 0x02062FEC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r1, #0
	bl sub_0205F3E4
	add r4, r0, #0
	mov r2, #6
	ldrsh r2, [r4, r2]
	mov r1, #0
	ldrsh r1, [r4, r1]
	lsl r2, r2, #2
	ldr r2, [r6, r2]
	add r0, r5, #0
	bl sub_0206101C
	add r0, r5, #0
	bl sub_02061070
	mov r0, #6
	ldrsh r1, [r4, r0]
	add r1, r1, #1
	strh r1, [r4, #6]
	ldrsh r1, [r4, r0]
	mov r0, #4
	ldrsh r0, [r4, r0]
	cmp r1, r0
	bge _02063026
	mov r0, #0
	pop {r4, r5, r6, pc}
_02063026:
	add r0, r5, #0
	mov r1, #0x28
	bl sub_0205F20C
	add r0, r5, #0
	bl sub_02060F78
	add r0, r5, #0
	bl sub_0205F484
	add r0, r5, #0
	mov r1, #0
	bl sub_0205F328
	add r0, r5, #0
	bl sub_0205F4E4
	mov r0, #1
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02062FEC

	thumb_func_start sub_0206304C
sub_0206304C: ; 0x0206304C
	push {r3, lr}
	mov r2, #6
	mov r1, #0
	add r3, r2, #0
	bl sub_02062FAC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_0206304C

	thumb_func_start sub_0206305C
sub_0206305C: ; 0x0206305C
	push {r3, lr}
	mov r2, #6
	mov r1, #1
	add r3, r2, #0
	bl sub_02062FAC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_0206305C

	thumb_func_start sub_0206306C
sub_0206306C: ; 0x0206306C
	push {r3, lr}
	mov r2, #6
	mov r1, #2
	add r3, r2, #0
	bl sub_02062FAC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_0206306C

	thumb_func_start sub_0206307C
sub_0206307C: ; 0x0206307C
	push {r3, lr}
	mov r2, #6
	mov r1, #3
	add r3, r2, #0
	bl sub_02062FAC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_0206307C

	thumb_func_start sub_0206308C
sub_0206308C: ; 0x0206308C
	push {r3, lr}
	ldr r1, _020630A0 ; =_020FDA50
	bl sub_02062FEC
	cmp r0, #1
	bne _0206309C
	mov r0, #1
	pop {r3, pc}
_0206309C:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_020630A0: .word _020FDA50
	thumb_func_end sub_0206308C

	thumb_func_start sub_020630A4
sub_020630A4: ; 0x020630A4
	push {r3, lr}
	mov r1, #0
	mov r2, #3
	mov r3, #7
	bl sub_02062FAC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_020630A4

	thumb_func_start sub_020630B4
sub_020630B4: ; 0x020630B4
	push {r3, lr}
	mov r1, #1
	mov r2, #3
	mov r3, #7
	bl sub_02062FAC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_020630B4

	thumb_func_start sub_020630C4
sub_020630C4: ; 0x020630C4
	push {r3, lr}
	mov r1, #2
	mov r2, #3
	mov r3, #7
	bl sub_02062FAC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_020630C4

	thumb_func_start sub_020630D4
sub_020630D4: ; 0x020630D4
	push {r3, lr}
	mov r1, #3
	add r2, r1, #0
	mov r3, #7
	bl sub_02062FAC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_020630D4

	thumb_func_start sub_020630E4
sub_020630E4: ; 0x020630E4
	push {r3, lr}
	ldr r1, _020630F8 ; =_020FDA1C
	bl sub_02062FEC
	cmp r0, #1
	bne _020630F4
	mov r0, #1
	pop {r3, pc}
_020630F4:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_020630F8: .word _020FDA1C
	thumb_func_end sub_020630E4

	thumb_func_start sub_020630FC
sub_020630FC: ; 0x020630FC
	push {r3, lr}
	mov r1, #0
	mov r2, #7
	mov r3, #8
	bl sub_02062FAC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_020630FC

	thumb_func_start sub_0206310C
sub_0206310C: ; 0x0206310C
	push {r3, lr}
	mov r1, #1
	mov r2, #7
	mov r3, #8
	bl sub_02062FAC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_0206310C

	thumb_func_start sub_0206311C
sub_0206311C: ; 0x0206311C
	push {r3, lr}
	mov r1, #2
	mov r2, #7
	mov r3, #8
	bl sub_02062FAC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_0206311C

	thumb_func_start sub_0206312C
sub_0206312C: ; 0x0206312C
	push {r3, lr}
	mov r1, #3
	mov r2, #7
	mov r3, #8
	bl sub_02062FAC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_0206312C

	thumb_func_start sub_0206313C
sub_0206313C: ; 0x0206313C
	push {r3, lr}
	ldr r1, _02063150 ; =_020FDA68
	bl sub_02062FEC
	cmp r0, #1
	bne _0206314C
	mov r0, #1
	pop {r3, pc}
_0206314C:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_02063150: .word _020FDA68
	thumb_func_end sub_0206313C

	thumb_func_start sub_02063154
sub_02063154: ; 0x02063154
	push {r4, lr}
	add r4, r0, #0
	mov r1, #4
	bl sub_0205F3C0
	add r0, r4, #0
	mov r1, #9
	bl sub_0205F328
	add r0, r4, #0
	bl sub_0205F4E4
	mov r0, #0
	pop {r4, pc}
	thumb_func_end sub_02063154

	thumb_func_start sub_02063170
sub_02063170: ; 0x02063170
	push {r4, lr}
	add r4, r0, #0
	bl sub_0205F3E4
	ldr r1, [r0]
	add r1, r1, #1
	str r1, [r0]
	cmp r1, #8
	blt _02063198
	add r0, r4, #0
	mov r1, #1
	bl sub_0205F290
	add r0, r4, #0
	mov r1, #0
	bl sub_0205F328
	add r0, r4, #0
	bl sub_0205F4E4
_02063198:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end sub_02063170

	thumb_func_start sub_0206319C
sub_0206319C: ; 0x0206319C
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	mov r1, #4
	bl sub_0205F3C0
	add r0, r4, #0
	bl sub_0206642C
	cmp r0, #0
	beq _020631B6
	bl sub_02068B48
_020631B6:
	add r1, sp, #0
	mov r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	add r0, r4, #0
	bl sub_0205F97C
	add r0, r4, #0
	bl ov01_022000DC
	ldr r1, _020631EC ; =0x00010004
	add r0, r4, #0
	bl sub_0205F20C
	mov r1, #1
	add r0, r4, #0
	lsl r1, r1, #0x14
	bl sub_0205F214
	add r0, r4, #0
	bl sub_0205F4E4
	mov r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_020631EC: .word 0x00010004
	thumb_func_end sub_0206319C

	thumb_func_start sub_020631F0
sub_020631F0: ; 0x020631F0
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	bl sub_0205F3E4
	add r4, r0, #0
	ldr r0, _02063250 ; =0x0210FACC
	add r1, sp, #0
	ldr r2, [r0]
	mov r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	ldr r0, [r4]
	lsl r0, r0, #2
	ldr r0, [r2, r0]
	str r0, [sp, #4]
	add r0, r5, #0
	bl sub_0205F97C
	ldr r0, [r4]
	add r0, r0, #2
	str r0, [r4]
	cmp r0, #0x10
	bhs _02063228
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, pc}
_02063228:
	mov r0, #0
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, sp, #0
	bl sub_0205F97C
	ldr r1, _02063254 ; =0x00020028
	add r0, r5, #0
	bl sub_0205F20C
	add r0, r5, #0
	bl sub_02066438
	add r0, r5, #0
	bl sub_0205F4E4
	mov r0, #1
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_02063250: .word 0x0210FACC
_02063254: .word 0x00020028
	thumb_func_end sub_020631F0

	thumb_func_start sub_02063258
sub_02063258: ; 0x02063258
	push {r4, lr}
	add r4, r0, #0
	mov r1, #4
	bl sub_0205F3C0
	add r0, r4, #0
	mov r1, #0
	bl sub_0205F328
	add r0, r4, #0
	bl sub_0205F4E4
	mov r0, #0
	pop {r4, pc}
	thumb_func_end sub_02063258

	thumb_func_start sub_02063274
sub_02063274: ; 0x02063274
	push {r4, lr}
	add r4, r0, #0
	mov r1, #4
	bl sub_0205F3C0
	add r0, r4, #0
	mov r1, #1
	bl sub_0205F328
	add r0, r4, #0
	bl sub_0205F4E4
	mov r0, #0
	pop {r4, pc}
	thumb_func_end sub_02063274

	thumb_func_start sub_02063290
sub_02063290: ; 0x02063290
	push {r4, lr}
	add r4, r0, #0
	bl sub_0205F3E4
	ldr r1, [r0]
	add r1, r1, #1
	str r1, [r0]
	cmp r1, #0x15
	bhs _020632A6
	mov r0, #0
	pop {r4, pc}
_020632A6:
	add r0, r4, #0
	bl sub_0205F4E4
	mov r0, #1
	pop {r4, pc}
	thumb_func_end sub_02063290

	thumb_func_start sub_020632B0
sub_020632B0: ; 0x020632B0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r6, r1, #0
	str r3, [sp, #4]
	mov r1, #0xc
	str r0, [sp]
	add r7, r2, #0
	ldr r5, [sp, #0x24]
	bl sub_0205F3C0
	add r4, r0, #0
	mov r0, #0xb
	mov r1, #0x1c
	bl AllocFromHeapAtEnd
	mov r1, #0
	mov r2, #0x1c
	str r0, [r4, #8]
	bl MI_CpuFill8
	mov r0, #0x10
	add r1, sp, #0x10
	ldrsb r0, [r1, r0]
	cmp r5, #0
	strb r0, [r4]
	strb r5, [r4, #1]
	ldrh r0, [r1, #0x18]
	strb r0, [r4, #3]
	ble _020632FC
	lsl r0, r5, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _0206330A
_020632FC:
	lsl r0, r5, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_0206330A:
	bl _ffix
	str r0, [sp, #8]
	ldr r0, [r4, #8]
	strb r6, [r0, #1]
	ldr r0, [r4, #8]
	strb r7, [r0, #2]
	ldr r1, [r4, #8]
	ldr r0, [sp, #4]
	strb r0, [r1, #3]
	lsl r0, r6, #4
	cmp r0, #0
	ble _02063336
	lsl r0, r6, #0x10
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _02063344
_02063336:
	lsl r0, r6, #0x10
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_02063344:
	bl _ffix
	ldr r1, [sp, #8]
	bl FX_Div
	ldr r1, [r4, #8]
	str r0, [r1, #4]
	lsl r0, r7, #4
	cmp r0, #0
	ble _0206336A
	lsl r0, r7, #0x10
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _02063378
_0206336A:
	lsl r0, r7, #0x10
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_02063378:
	bl _ffix
	ldr r1, [sp, #8]
	bl FX_Div
	ldr r1, [r4, #8]
	str r0, [r1, #8]
	ldr r0, [sp, #4]
	lsl r0, r0, #4
	cmp r0, #0
	ble _020633A2
	ldr r0, [sp, #4]
	lsl r0, r0, #0x10
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _020633B2
_020633A2:
	ldr r0, [sp, #4]
	lsl r0, r0, #0x10
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_020633B2:
	bl _ffix
	ldr r1, [sp, #8]
	bl FX_Div
	ldr r1, [r4, #8]
	str r0, [r1, #0xc]
	mov r0, #0xb4
	add r1, r5, #0
	bl _s32_div_f
	ldr r1, [r4, #8]
	strb r0, [r1]
	ldr r1, [r4, #8]
	ldr r0, [sp]
	add r1, #0x10
	bl sub_0205F944
	ldr r0, [r4, #8]
	ldr r0, [r0, #0x14]
	str r0, [r4, #4]
	ldr r0, [sp]
	bl sub_02060F78
	ldr r0, [sp]
	ldr r1, _0206341C ; =0x00010004
	bl sub_0205F20C
	add r2, sp, #0x10
	mov r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [sp]
	bl sub_0205F2BC
	add r1, sp, #0x10
	ldrh r1, [r1, #0x18]
	ldr r0, [sp]
	bl sub_0205F328
	ldr r0, [sp]
	bl sub_0205F4E4
	ldr r0, [sp]
	bl sub_0205F684
	cmp r0, #0
	bne _02063416
	ldr r0, _02063420 ; =0x0000060A
	bl PlaySE
_02063416:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0206341C: .word 0x00010004
_02063420: .word 0x0000060A
	thumb_func_end sub_020632B0

	thumb_func_start sub_02063424
sub_02063424: ; 0x02063424
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	bl sub_0205F3E4
	add r4, r0, #0
	ldrb r0, [r4, #2]
	cmp r0, #0
	beq _02063448
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _02063456
_02063448:
	lsl r0, r0, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_02063456:
	bl _ffix
	str r0, [sp]
	asr r0, r0, #0x1f
	str r0, [sp, #4]
	ldr r6, [r4, #8]
	ldr r2, [sp]
	ldr r0, [r6, #4]
	ldr r3, [sp, #4]
	asr r1, r0, #0x1f
	bl _ll_mul
	ldr r3, [r6, #0x10]
	mov r6, #2
	mov r2, #0
	lsl r6, r6, #0xa
	add r6, r0, r6
	adc r1, r2
	lsl r0, r1, #0x14
	lsr r1, r6, #0xc
	orr r1, r0
	add r0, r3, r1
	str r2, [sp, #0xc]
	str r0, [sp, #8]
	ldr r6, [r4, #8]
	ldr r2, [sp]
	ldr r0, [r6, #0xc]
	ldr r3, [sp, #4]
	asr r1, r0, #0x1f
	bl _ll_mul
	mov r3, #2
	ldr r2, [r6, #0x18]
	mov r6, #0
	lsl r3, r3, #0xa
	add r3, r0, r3
	adc r1, r6
	lsl r0, r1, #0x14
	lsr r1, r3, #0xc
	orr r1, r0
	add r0, r2, r1
	str r0, [sp, #0x10]
	add r0, r5, #0
	bl sub_0205F52C
	add r6, r0, #0
	add r0, r5, #0
	bl sub_0205F8B8
	add r2, r0, #0
	add r0, r6, #0
	add r1, sp, #8
	bl sub_02061248
	cmp r0, #0
	beq _020634CC
	ldr r0, [sp, #0xc]
	str r0, [r4, #4]
	b _020634D0
_020634CC:
	ldr r0, [r4, #4]
	str r0, [sp, #0xc]
_020634D0:
	add r0, r5, #0
	add r1, sp, #8
	bl sub_0205F954
	ldr r0, [r4, #8]
	ldrb r1, [r0]
	ldrb r0, [r4, #2]
	mul r0, r1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl sub_0201FBB8
	ldr r7, [r4, #8]
	add r6, r0, #0
	ldr r0, [r7, #8]
	ldr r2, [sp]
	ldr r3, [sp, #4]
	asr r1, r0, #0x1f
	bl _ll_mul
	add r2, r0, #0
	ldr r0, [r7, #0x14]
	mov r3, #0
	mov r7, #2
	lsl r7, r7, #0xa
	add r2, r2, r7
	adc r1, r3
	lsl r1, r1, #0x14
	lsr r2, r2, #0xc
	orr r2, r1
	add r0, r0, r2
	asr r2, r6, #0x1f
	lsr r1, r6, #0x10
	lsl r2, r2, #0x10
	orr r2, r1
	lsl r1, r6, #0x10
	add r6, r1, r7
	adc r2, r3
	lsl r1, r2, #0x14
	lsr r2, r6, #0xc
	orr r2, r1
	add r1, r0, r2
	ldr r0, [sp, #0xc]
	str r3, [sp, #8]
	sub r0, r1, r0
	str r0, [sp, #0xc]
	add r0, r5, #0
	add r1, sp, #8
	str r3, [sp, #0x10]
	bl sub_0205F9A0
	mov r0, #1
	ldrsb r1, [r4, r0]
	sub r1, r1, #1
	strb r1, [r4, #1]
	ldrb r1, [r4, #2]
	add r1, r1, #1
	strb r1, [r4, #2]
	ldrsb r0, [r4, r0]
	cmp r0, #0
	ble _02063550
	add sp, #0x14
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_02063550:
	mov r0, #0
	str r0, [sp, #0x10]
	str r0, [sp, #0xc]
	str r0, [sp, #8]
	add r0, r5, #0
	add r1, sp, #8
	bl sub_0205F97C
	add r0, r5, #0
	add r1, sp, #8
	bl sub_0205F9A0
	ldr r2, [r4, #8]
	mov r1, #1
	ldrsb r1, [r2, r1]
	add r0, r5, #0
	bl sub_0205F91C
	ldr r2, [r4, #8]
	mov r1, #2
	ldrsb r1, [r2, r1]
	add r0, r5, #0
	bl sub_0205F92C
	ldr r2, [r4, #8]
	mov r1, #3
	ldrsb r1, [r2, r1]
	add r0, r5, #0
	bl sub_0205F93C
	ldr r6, [r4, #8]
	mov r0, #1
	ldrsb r1, [r6, r0]
	lsl r0, r1, #4
	cmp r0, #0
	ble _020635AA
	lsl r0, r1, #0x10
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _020635B8
_020635AA:
	lsl r0, r1, #0x10
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_020635B8:
	bl _ffix
	ldr r1, [r6, #0x10]
	add r0, r1, r0
	str r0, [sp, #8]
	ldr r6, [r4, #8]
	mov r0, #2
	ldrsb r1, [r6, r0]
	lsl r0, r1, #4
	cmp r0, #0
	ble _020635E0
	lsl r0, r1, #0x10
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _020635EE
_020635E0:
	lsl r0, r1, #0x10
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_020635EE:
	bl _ffix
	ldr r1, [r6, #0x14]
	add r0, r1, r0
	str r0, [sp, #0xc]
	ldr r6, [r4, #8]
	mov r0, #3
	ldrsb r1, [r6, r0]
	lsl r0, r1, #4
	cmp r0, #0
	ble _02063616
	lsl r0, r1, #0x10
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _02063624
_02063616:
	lsl r0, r1, #0x10
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_02063624:
	bl _ffix
	ldr r1, [r6, #0x18]
	add r0, r1, r0
	str r0, [sp, #0x10]
	add r0, r5, #0
	add r1, sp, #8
	bl sub_0205F954
	add r0, r5, #0
	bl sub_02061070
	ldr r1, _0206367C ; =0x00020008
	add r0, r5, #0
	bl sub_0205F20C
	add r0, r5, #0
	bl sub_02060F78
	add r0, r5, #0
	bl sub_0205F484
	add r0, r5, #0
	mov r1, #0
	bl sub_0205F328
	add r0, r5, #0
	bl sub_0205F4E4
	add r0, r5, #0
	bl sub_0205F684
	cmp r0, #0
	bne _0206366E
	ldr r0, _02063680 ; =0x00000646
	bl PlaySE
_0206366E:
	ldr r0, [r4, #8]
	bl FreeToHeap
	mov r0, #0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_0206367C: .word 0x00020008
_02063680: .word 0x00000646
	thumb_func_end sub_02063424

	thumb_func_start sub_02063684
sub_02063684: ; 0x02063684
	push {lr}
	sub sp, #0xc
	mov r2, #1
	str r2, [sp]
	mov r1, #0xf
	str r1, [sp, #4]
	mov r1, #3
	str r1, [sp, #8]
	mov r1, #0
	mov r3, #5
	bl sub_020632B0
	mov r0, #1
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end sub_02063684

	thumb_func_start sub_020636A4
sub_020636A4: ; 0x020636A4
	push {lr}
	sub sp, #0xc
	mov r2, #3
	str r2, [sp]
	mov r1, #0xc
	str r1, [sp, #4]
	str r2, [sp, #8]
	mov r2, #0
	mov r1, #4
	add r3, r2, #0
	bl sub_020632B0
	mov r0, #1
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end sub_020636A4

	thumb_func_start sub_020636C4
sub_020636C4: ; 0x020636C4
	push {lr}
	sub sp, #0xc
	mov r1, #0
	str r1, [sp]
	mov r2, #0xf
	str r2, [sp, #4]
	mov r3, #3
	str r3, [sp, #8]
	add r2, r1, #0
	sub r3, #8
	bl sub_020632B0
	mov r0, #1
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end sub_020636C4

	thumb_func_start sub_020636E4
sub_020636E4: ; 0x020636E4
	push {lr}
	sub sp, #0xc
	mov r2, #0
	str r2, [sp]
	mov r1, #9
	str r1, [sp, #4]
	mov r3, #3
	str r3, [sp, #8]
	sub r1, r3, #5
	sub r3, r3, #6
	bl sub_020632B0
	mov r0, #1
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end sub_020636E4

	thumb_func_start sub_02063704
sub_02063704: ; 0x02063704
	push {lr}
	sub sp, #0xc
	mov r1, #2
	str r1, [sp]
	mov r1, #0xc
	str r1, [sp, #4]
	mov r1, #3
	str r1, [sp, #8]
	sub r1, r1, #7
	mov r2, #1
	add r3, r1, #0
	bl sub_020632B0
	mov r0, #1
	add sp, #0xc
	pop {pc}
	thumb_func_end sub_02063704

	thumb_func_start sub_02063724
sub_02063724: ; 0x02063724
	push {lr}
	sub sp, #0xc
	mov r2, #3
	str r2, [sp]
	mov r1, #6
	str r1, [sp, #4]
	str r2, [sp, #8]
	mov r1, #2
	mov r2, #1
	mov r3, #0
	bl sub_020632B0
	mov r0, #1
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end sub_02063724

	thumb_func_start sub_02063744
sub_02063744: ; 0x02063744
	push {lr}
	sub sp, #0xc
	mov r1, #1
	str r1, [sp]
	mov r1, #0xc
	str r1, [sp, #4]
	mov r1, #3
	str r1, [sp, #8]
	sub r1, r1, #4
	mov r2, #0
	mov r3, #5
	bl sub_020632B0
	mov r0, #1
	add sp, #0xc
	pop {pc}
	thumb_func_end sub_02063744

	thumb_func_start sub_02063764
sub_02063764: ; 0x02063764
	push {lr}
	sub sp, #0xc
	mov r1, #2
	str r1, [sp]
	mov r1, #6
	str r1, [sp, #4]
	mov r1, #3
	mov r2, #0
	str r1, [sp, #8]
	sub r1, r1, #6
	add r3, r2, #0
	bl sub_020632B0
	mov r0, #1
	add sp, #0xc
	pop {pc}
	thumb_func_end sub_02063764

	thumb_func_start sub_02063784
sub_02063784: ; 0x02063784
	push {lr}
	sub sp, #0xc
	mov r1, #2
	str r1, [sp]
	mov r1, #9
	str r1, [sp, #4]
	mov r1, #3
	mov r2, #0
	str r1, [sp, #8]
	sub r1, r1, #6
	add r3, r2, #0
	bl sub_020632B0
	mov r0, #1
	add sp, #0xc
	pop {pc}
	thumb_func_end sub_02063784

	thumb_func_start sub_020637A4
sub_020637A4: ; 0x020637A4
	push {lr}
	sub sp, #0xc
	mov r1, #3
	str r1, [sp]
	mov r2, #6
	str r2, [sp, #4]
	mov r2, #1
	sub r3, r2, #2
	str r1, [sp, #8]
	bl sub_020632B0
	mov r0, #1
	add sp, #0xc
	pop {pc}
	thumb_func_end sub_020637A4

	thumb_func_start sub_020637C0
sub_020637C0: ; 0x020637C0
	push {lr}
	sub sp, #0xc
	mov r1, #1
	str r1, [sp]
	mov r1, #9
	str r1, [sp, #4]
	mov r1, #3
	str r1, [sp, #8]
	mov r1, #0
	add r2, r1, #0
	mov r3, #4
	bl sub_020632B0
	mov r0, #1
	add sp, #0xc
	pop {pc}
	thumb_func_end sub_020637C0

	thumb_func_start sub_020637E0
sub_020637E0: ; 0x020637E0
	push {lr}
	sub sp, #0xc
	mov r1, #2
	str r1, [sp]
	mov r1, #0xc
	str r1, [sp, #4]
	mov r1, #3
	mov r2, #0
	str r1, [sp, #8]
	sub r1, r1, #7
	add r3, r2, #0
	bl sub_020632B0
	mov r0, #1
	add sp, #0xc
	pop {pc}
	thumb_func_end sub_020637E0

	thumb_func_start sub_02063800
sub_02063800: ; 0x02063800
	push {lr}
	sub sp, #0xc
	mov r1, #0
	str r1, [sp]
	mov r2, #6
	str r2, [sp, #4]
	mov r3, #3
	str r3, [sp, #8]
	sub r2, r3, #4
	sub r3, r3, #7
	bl sub_020632B0
	mov r0, #1
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end sub_02063800

	thumb_func_start sub_02063820
sub_02063820: ; 0x02063820
	push {lr}
	sub sp, #0xc
	mov r1, #0
	str r1, [sp]
	mov r1, #9
	str r1, [sp, #4]
	mov r1, #3
	str r1, [sp, #8]
	mov r1, #1
	add r2, r1, #0
	sub r3, r1, #4
	bl sub_020632B0
	mov r0, #1
	add sp, #0xc
	pop {pc}
	thumb_func_end sub_02063820

	thumb_func_start sub_02063840
sub_02063840: ; 0x02063840
	push {lr}
	sub sp, #0xc
	mov r1, #3
	str r1, [sp]
	mov r2, #9
	str r2, [sp, #4]
	mov r2, #0
	add r3, r2, #0
	str r1, [sp, #8]
	bl sub_020632B0
	mov r0, #1
	add sp, #0xc
	pop {pc}
	thumb_func_end sub_02063840

	thumb_func_start sub_0206385C
sub_0206385C: ; 0x0206385C
	push {lr}
	sub sp, #0xc
	mov r1, #1
	str r1, [sp]
	mov r1, #0xc
	str r1, [sp, #4]
	mov r1, #3
	str r1, [sp, #8]
	mov r1, #0
	add r2, r1, #0
	mov r3, #4
	bl sub_020632B0
	mov r0, #1
	add sp, #0xc
	pop {pc}
	thumb_func_end sub_0206385C

	thumb_func_start sub_0206387C
sub_0206387C: ; 0x0206387C
	push {lr}
	sub sp, #0xc
	mov r1, #1
	str r1, [sp]
	mov r1, #0xc
	str r1, [sp, #4]
	mov r1, #3
	str r1, [sp, #8]
	mov r1, #0
	add r2, r1, #0
	mov r3, #5
	bl sub_020632B0
	mov r0, #1
	add sp, #0xc
	pop {pc}
	thumb_func_end sub_0206387C

	thumb_func_start sub_0206389C
sub_0206389C: ; 0x0206389C
	push {lr}
	sub sp, #0xc
	mov r2, #1
	str r2, [sp]
	mov r1, #9
	str r1, [sp, #4]
	mov r1, #3
	str r1, [sp, #8]
	mov r1, #2
	mov r3, #5
	bl sub_020632B0
	mov r0, #1
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end sub_0206389C

	thumb_func_start sub_020638BC
sub_020638BC: ; 0x020638BC
	push {lr}
	sub sp, #0xc
	mov r2, #1
	str r2, [sp]
	mov r1, #9
	str r1, [sp, #4]
	mov r1, #3
	str r1, [sp, #8]
	mov r1, #2
	mov r3, #4
	bl sub_020632B0
	mov r0, #1
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end sub_020638BC

	thumb_func_start sub_020638DC
sub_020638DC: ; 0x020638DC
	push {lr}
	sub sp, #0xc
	mov r1, #1
	str r1, [sp]
	mov r2, #0xc
	str r2, [sp, #4]
	mov r2, #3
	str r2, [sp, #8]
	mov r2, #0
	mov r3, #5
	bl sub_020632B0
	mov r0, #1
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end sub_020638DC

	thumb_func_start sub_020638FC
sub_020638FC: ; 0x020638FC
	push {lr}
	sub sp, #0xc
	mov r1, #1
	str r1, [sp]
	mov r1, #6
	str r1, [sp, #4]
	mov r1, #3
	str r1, [sp, #8]
	mov r1, #0
	add r2, r1, #0
	mov r3, #2
	bl sub_020632B0
	mov r0, #1
	add sp, #0xc
	pop {pc}
	thumb_func_end sub_020638FC

	thumb_func_start sub_0206391C
sub_0206391C: ; 0x0206391C
	push {lr}
	sub sp, #0xc
	mov r2, #3
	str r2, [sp]
	mov r1, #6
	str r1, [sp, #4]
	str r2, [sp, #8]
	mov r2, #0
	mov r1, #2
	add r3, r2, #0
	bl sub_020632B0
	mov r0, #1
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end sub_0206391C

	thumb_func_start sub_0206393C
sub_0206393C: ; 0x0206393C
	push {lr}
	sub sp, #0xc
	mov r1, #3
	str r1, [sp]
	mov r2, #9
	str r2, [sp, #4]
	mov r2, #0
	add r3, r2, #0
	str r1, [sp, #8]
	bl sub_020632B0
	mov r0, #1
	add sp, #0xc
	pop {pc}
	thumb_func_end sub_0206393C

	thumb_func_start sub_02063958
sub_02063958: ; 0x02063958
	push {lr}
	sub sp, #0xc
	mov r1, #1
	str r1, [sp]
	mov r1, #6
	str r1, [sp, #4]
	mov r1, #3
	str r1, [sp, #8]
	mov r1, #0
	add r2, r1, #0
	mov r3, #2
	bl sub_020632B0
	mov r0, #1
	add sp, #0xc
	pop {pc}
	thumb_func_end sub_02063958

	thumb_func_start sub_02063978
sub_02063978: ; 0x02063978
	push {lr}
	sub sp, #0xc
	mov r1, #2
	str r1, [sp]
	mov r1, #9
	str r1, [sp, #4]
	mov r1, #3
	mov r2, #0
	str r1, [sp, #8]
	sub r1, r1, #6
	add r3, r2, #0
	bl sub_020632B0
	mov r0, #1
	add sp, #0xc
	pop {pc}
	thumb_func_end sub_02063978

	thumb_func_start sub_02063998
sub_02063998: ; 0x02063998
	push {lr}
	sub sp, #0xc
	mov r1, #0
	str r1, [sp]
	mov r2, #6
	str r2, [sp, #4]
	mov r3, #3
	str r3, [sp, #8]
	add r2, r1, #0
	sub r3, r3, #5
	bl sub_020632B0
	mov r0, #1
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end sub_02063998

	thumb_func_start sub_020639B8
sub_020639B8: ; 0x020639B8
	push {lr}
	sub sp, #0xc
	mov r1, #0
	str r1, [sp]
	mov r2, #9
	str r2, [sp, #4]
	mov r3, #3
	str r3, [sp, #8]
	add r2, r1, #0
	sub r3, r3, #6
	bl sub_020632B0
	mov r0, #1
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end sub_020639B8

	thumb_func_start sub_020639D8
sub_020639D8: ; 0x020639D8
	push {lr}
	sub sp, #0xc
	mov r3, #1
	str r3, [sp]
	mov r1, #9
	str r1, [sp, #4]
	mov r1, #3
	mov r2, #0
	str r1, [sp, #8]
	bl sub_020632B0
	mov r0, #1
	add sp, #0xc
	pop {pc}
	thumb_func_end sub_020639D8

	thumb_func_start sub_020639F4
sub_020639F4: ; 0x020639F4
	push {lr}
	sub sp, #0xc
	mov r2, #3
	str r2, [sp]
	mov r1, #9
	str r1, [sp, #4]
	str r2, [sp, #8]
	mov r2, #0
	mov r1, #4
	add r3, r2, #0
	bl sub_020632B0
	mov r0, #1
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end sub_020639F4

	thumb_func_start sub_02063A14
sub_02063A14: ; 0x02063A14
	ldr r3, _02063A18 ; =sub_02063A40
	bx r3
	.balign 4, 0
_02063A18: .word sub_02063A40
	thumb_func_end sub_02063A14

	thumb_func_start sub_02063A1C
sub_02063A1C: ; 0x02063A1C
	push {r4, lr}
	add r4, r0, #0
	bl sub_02063A5C
	cmp r0, #0
	bne _02063A2C
	mov r0, #0
	pop {r4, pc}
_02063A2C:
	add r0, r4, #0
	bl sub_02063A78
	cmp r0, #0
	beq _02063A3A
	mov r0, #1
	pop {r4, pc}
_02063A3A:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02063A1C

	thumb_func_start sub_02063A40
sub_02063A40: ; 0x02063A40
	push {r4, lr}
	add r4, r0, #0
	bl sub_0205F26C
	add r1, r0, #0
	lsl r2, r1, #2
	ldr r1, _02063A58 ; =_020FE104
	add r0, r4, #0
	ldr r1, [r1, r2]
	blx r1
	pop {r4, pc}
	nop
_02063A58: .word _020FE104
	thumb_func_end sub_02063A40

	thumb_func_start sub_02063A5C
sub_02063A5C: ; 0x02063A5C
	push {r4, lr}
	add r4, r0, #0
	bl sub_0205F26C
	add r1, r0, #0
	lsl r2, r1, #2
	ldr r1, _02063A74 ; =_020FE134
	add r0, r4, #0
	ldr r1, [r1, r2]
	blx r1
	pop {r4, pc}
	nop
_02063A74: .word _020FE134
	thumb_func_end sub_02063A5C

	thumb_func_start sub_02063A78
sub_02063A78: ; 0x02063A78
	push {r4, lr}
	add r4, r0, #0
	bl sub_0205F26C
	add r1, r0, #0
	lsl r2, r1, #2
	ldr r1, _02063A90 ; =_020FE164
	add r0, r4, #0
	ldr r1, [r1, r2]
	blx r1
	pop {r4, pc}
	nop
_02063A90: .word _020FE164
	thumb_func_end sub_02063A78

	thumb_func_start sub_02063A94
sub_02063A94: ; 0x02063A94
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl sub_0205F914
	add r5, r0, #0
	add r0, r4, #0
	bl sub_0205F8FC
	cmp r5, r0
	beq _02063AAC
	mov r0, #1
	pop {r3, r4, r5, pc}
_02063AAC:
	add r0, r4, #0
	bl sub_0205F934
	add r5, r0, #0
	add r0, r4, #0
	bl sub_0205F90C
	cmp r5, r0
	beq _02063AC2
	mov r0, #1
	pop {r3, r4, r5, pc}
_02063AC2:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02063A94

	thumb_func_start sub_02063AC8
sub_02063AC8: ; 0x02063AC8
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl sub_0205F914
	add r5, r0, #0
	add r0, r4, #0
	bl sub_0205F8FC
	cmp r5, r0
	beq _02063AE0
	mov r0, #0
	pop {r3, r4, r5, pc}
_02063AE0:
	add r0, r4, #0
	bl sub_0205F934
	add r5, r0, #0
	add r0, r4, #0
	bl sub_0205F90C
	cmp r5, r0
	bne _02063AF6
	mov r0, #1
	pop {r3, r4, r5, pc}
_02063AF6:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02063AC8

	thumb_func_start sub_02063AFC
sub_02063AFC: ; 0x02063AFC
	bx lr
	.balign 4, 0
	thumb_func_end sub_02063AFC

	thumb_func_start sub_02063B00
sub_02063B00: ; 0x02063B00
	mov r0, #0
	bx lr
	thumb_func_end sub_02063B00

	thumb_func_start sub_02063B04
sub_02063B04: ; 0x02063B04
	mov r0, #0
	bx lr
	thumb_func_end sub_02063B04

	thumb_func_start sub_02063B08
sub_02063B08: ; 0x02063B08
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r1, #9
	bl sub_0205F398
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #1
	bl sub_0205F2F4
	strb r0, [r4, #3]
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02063B08

	thumb_func_start sub_02063B20
sub_02063B20: ; 0x02063B20
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_0205F3BC
	add r4, r0, #0
	ldrb r0, [r4]
	cmp r0, #3
	bhi _02063B98
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02063B3C: ; jump table
	.short _02063B44 - _02063B3C - 2 ; case 0
	.short _02063B56 - _02063B3C - 2 ; case 1
	.short _02063B7E - _02063B3C - 2 ; case 2
	.short _02063B94 - _02063B3C - 2 ; case 3
_02063B44:
	add r0, r5, #0
	bl sub_02063A94
	cmp r0, #1
	bne _02063B98
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _02063B98
_02063B56:
	add r0, r5, #0
	bl sub_02063AC8
	cmp r0, #0
	beq _02063B98
	mov r0, #2
	ldrsb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, #2]
	ldrsb r1, [r4, r0]
	mov r0, #3
	ldrsb r0, [r4, r0]
	cmp r1, r0
	bge _02063B78
	mov r0, #0
	strb r0, [r4]
	b _02063B98
_02063B78:
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
_02063B7E:
	add r0, r5, #0
	bl sub_0205F648
	cmp r0, #1
	beq _02063B98
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	mov r0, #0
	strb r0, [r4, #2]
	strb r0, [r4, #1]
_02063B94:
	mov r0, #1
	pop {r3, r4, r5, pc}
_02063B98:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02063B20

	thumb_func_start sub_02063B9C
sub_02063B9C: ; 0x02063B9C
	push {r4, r5, r6, lr}
	sub sp, #0x20
	add r5, r0, #0
	bl sub_0205F3BC
	add r4, r0, #0
	ldrb r0, [r4, #1]
	cmp r0, #3
	bhi _02063C7A
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02063BBA: ; jump table
	.short _02063BC2 - _02063BBA - 2 ; case 0
	.short _02063BE4 - _02063BBA - 2 ; case 1
	.short _02063C16 - _02063BBA - 2 ; case 2
	.short _02063C2C - _02063BBA - 2 ; case 3
_02063BC2:
	ldr r3, _02063C80 ; =_020FE0C4
	add r2, sp, #0x10
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	add r0, r5, #0
	bl sub_0205F2A8
	strb r0, [r4, #4]
	lsl r1, r0, #2
	add r0, sp, #0x10
	ldr r0, [r0, r1]
	strb r0, [r4, #5]
	ldrb r0, [r4, #1]
	add r0, r0, #1
	strb r0, [r4, #1]
_02063BE4:
	ldr r6, _02063C84 ; =_020FE0D4
	add r3, sp, #0
	add r2, r3, #0
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	mov r0, #5
	ldrsb r0, [r4, r0]
	lsl r3, r0, #3
	mov r0, #6
	ldrsb r0, [r4, r0]
	lsl r1, r0, #2
	add r0, r2, r3
	ldr r0, [r1, r0]
	mov r1, #0
	bl sub_0206234C
	add r1, r0, #0
	add r0, r5, #0
	bl sub_0206217C
	ldrb r0, [r4, #1]
	add r0, r0, #1
	strb r0, [r4, #1]
_02063C16:
	add r0, r5, #0
	bl sub_02062428
	cmp r0, #0
	bne _02063C26
	add sp, #0x20
	mov r0, #1
	pop {r4, r5, r6, pc}
_02063C26:
	ldrb r0, [r4, #1]
	add r0, r0, #1
	strb r0, [r4, #1]
_02063C2C:
	mov r0, #8
	ldrsb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, #8]
	ldrsb r0, [r4, r0]
	cmp r0, #8
	bge _02063C40
	add sp, #0x20
	mov r0, #1
	pop {r4, r5, r6, pc}
_02063C40:
	mov r0, #0
	strb r0, [r4, #8]
	mov r0, #7
	ldrsb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, #7]
	ldrsb r0, [r4, r0]
	cmp r0, #4
	bge _02063C64
	mov r0, #6
	ldrsb r0, [r4, r0]
	add sp, #0x20
	add r1, r0, #1
	mov r0, #1
	and r1, r0
	strb r1, [r4, #6]
	strb r0, [r4, #1]
	pop {r4, r5, r6, pc}
_02063C64:
	mov r1, #4
	ldrsb r1, [r4, r1]
	add r0, r5, #0
	bl sub_0205F290
	ldrb r0, [r4, #1]
	add r0, r0, #1
	strb r0, [r4, #1]
	mov r0, #0
	strb r0, [r4, #7]
	strb r0, [r4]
_02063C7A:
	mov r0, #0
	add sp, #0x20
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02063C80: .word _020FE0C4
_02063C84: .word _020FE0D4
	thumb_func_end sub_02063B9C

	thumb_func_start sub_02063C88
sub_02063C88: ; 0x02063C88
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r1, #9
	bl sub_0205F398
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #1
	bl sub_0205F2F4
	strb r0, [r4, #3]
	add r0, r5, #0
	bl sub_0205F26C
	cmp r0, #5
	beq _02063CAC
	mov r0, #1
	b _02063CAE
_02063CAC:
	mov r0, #0
_02063CAE:
	strb r0, [r4, #5]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02063C88

	thumb_func_start sub_02063CB4
sub_02063CB4: ; 0x02063CB4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_0205F3BC
	add r4, r0, #0
	ldrb r0, [r4]
	cmp r0, #3
	bhi _02063D2C
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02063CD0: ; jump table
	.short _02063CD8 - _02063CD0 - 2 ; case 0
	.short _02063CEA - _02063CD0 - 2 ; case 1
	.short _02063D12 - _02063CD0 - 2 ; case 2
	.short _02063D28 - _02063CD0 - 2 ; case 3
_02063CD8:
	add r0, r5, #0
	bl sub_02063A94
	cmp r0, #1
	bne _02063D2C
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _02063D2C
_02063CEA:
	add r0, r5, #0
	bl sub_02063AC8
	cmp r0, #0
	beq _02063D2C
	mov r0, #2
	ldrsb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, #2]
	ldrsb r1, [r4, r0]
	mov r0, #3
	ldrsb r0, [r4, r0]
	cmp r1, r0
	bge _02063D0C
	mov r0, #0
	strb r0, [r4]
	b _02063D2C
_02063D0C:
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
_02063D12:
	add r0, r5, #0
	bl sub_0205F648
	cmp r0, #1
	beq _02063D2C
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	mov r0, #0
	strb r0, [r4, #2]
	strb r0, [r4, #1]
_02063D28:
	mov r0, #1
	pop {r3, r4, r5, pc}
_02063D2C:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02063CB4

	thumb_func_start sub_02063D30
sub_02063D30: ; 0x02063D30
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	ldr r3, _02063E4C ; =_020FE0E4
	add r2, sp, #0
	add r7, r0, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	add r0, r7, #0
	bl sub_0205F3BC
	add r4, r0, #0
	ldrb r0, [r4, #1]
	cmp r0, #3
	bhi _02063E46
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02063D64: ; jump table
	.short _02063D6C - _02063D64 - 2 ; case 0
	.short _02063DB2 - _02063D64 - 2 ; case 1
	.short _02063DD8 - _02063D64 - 2 ; case 2
	.short _02063DEE - _02063D64 - 2 ; case 3
_02063D6C:
	add r0, r7, #0
	bl sub_0205F2A8
	mov r5, #0
	add r6, r0, #0
	add r1, r5, #0
	add r0, sp, #0
	mov r2, #5
	b _02063D82
_02063D7E:
	add r1, r1, #4
	add r5, r5, #1
_02063D82:
	cmp r5, #4
	bge _02063D92
	ldrsb r3, [r4, r2]
	lsl r3, r3, #4
	add r3, r0, r3
	ldr r3, [r1, r3]
	cmp r6, r3
	bne _02063D7E
_02063D92:
	cmp r5, #4
	blt _02063D9A
	bl GF_AssertFail
_02063D9A:
	add r0, r5, #1
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x1e
	sub r1, r1, r2
	mov r0, #0x1e
	ror r1, r0
	strb r6, [r4, #4]
	add r0, r2, r1
	strb r0, [r4, #6]
	ldrb r0, [r4, #1]
	add r0, r0, #1
	strb r0, [r4, #1]
_02063DB2:
	mov r0, #5
	ldrsb r0, [r4, r0]
	add r2, sp, #0
	lsl r3, r0, #4
	mov r0, #6
	ldrsb r0, [r4, r0]
	lsl r1, r0, #2
	add r0, r2, r3
	ldr r0, [r1, r0]
	mov r1, #0
	bl sub_0206234C
	add r1, r0, #0
	add r0, r7, #0
	bl sub_0206217C
	ldrb r0, [r4, #1]
	add r0, r0, #1
	strb r0, [r4, #1]
_02063DD8:
	add r0, r7, #0
	bl sub_02062428
	cmp r0, #0
	bne _02063DE8
	add sp, #0x20
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02063DE8:
	ldrb r0, [r4, #1]
	add r0, r0, #1
	strb r0, [r4, #1]
_02063DEE:
	mov r0, #8
	ldrsb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, #8]
	ldrsb r0, [r4, r0]
	cmp r0, #8
	bge _02063E02
	add sp, #0x20
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02063E02:
	mov r0, #0
	strb r0, [r4, #8]
	mov r0, #7
	ldrsb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, #7]
	ldrsb r0, [r4, r0]
	cmp r0, #4
	bge _02063E30
	mov r0, #6
	ldrsb r0, [r4, r0]
	add sp, #0x20
	add r0, r0, #1
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x1e
	sub r1, r1, r2
	mov r0, #0x1e
	ror r1, r0
	add r0, r2, r1
	strb r0, [r4, #6]
	mov r0, #1
	strb r0, [r4, #1]
	pop {r3, r4, r5, r6, r7, pc}
_02063E30:
	mov r1, #4
	ldrsb r1, [r4, r1]
	add r0, r7, #0
	bl sub_0205F290
	ldrb r0, [r4, #1]
	add r0, r0, #1
	strb r0, [r4, #1]
	mov r0, #0
	strb r0, [r4, #7]
	strb r0, [r4]
_02063E46:
	mov r0, #0
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02063E4C: .word _020FE0E4
	thumb_func_end sub_02063D30

	thumb_func_start sub_02063E50
sub_02063E50: ; 0x02063E50
	push {r4, lr}
	mov r1, #0x18
	add r4, r0, #0
	bl sub_0205F3E8
	ldr r1, _02063E6C ; =0x00000106
	str r1, [r0]
	mov r1, #0
	str r1, [r0, #4]
	add r0, r4, #0
	bl sub_0205F484
	pop {r4, pc}
	nop
_02063E6C: .word 0x00000106
	thumb_func_end sub_02063E50

	thumb_func_start sub_02063E70
sub_02063E70: ; 0x02063E70
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl sub_0205F394
	add r7, r0, #0
	add r0, r5, #0
	bl sub_0205F40C
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0205F52C
	add r1, r5, #0
	bl sub_02055780
	add r6, r0, #0
	add r0, r5, #0
	bl ov01_021FA2D4
	cmp r0, #1
	bne _02063E9C
	b _02063FDC
_02063E9C:
	ldr r0, [r4, #8]
	cmp r0, #0
	bne _02063ECC
	add r0, r5, #0
	bl sub_0205F52C
	add r1, r5, #0
	bl sub_020557A0
	add r1, r6, #0
	bl sub_020640A4
	str r0, [r4]
	ldr r1, [r4]
	add r0, r5, #0
	bl sub_0205F258
	add r1, r4, #0
	ldr r2, [r4]
	add r0, r5, #0
	add r1, #8
	bl ov01_021F94C0
	b _02063F22
_02063ECC:
	ldr r0, [r4, #4]
	cmp r6, r0
	beq _02063F22
	add r1, r4, #0
	ldr r2, [r4]
	add r0, r5, #0
	add r1, #8
	bl ov01_021F95CC
	add r0, r5, #0
	bl sub_0205F52C
	add r1, r5, #0
	bl sub_020557A0
	add r1, r6, #0
	bl sub_020640A4
	str r0, [r4]
	ldr r1, [r4]
	add r0, r5, #0
	bl sub_0205F258
	ldr r1, [r4]
	ldr r0, _02063FE0 ; =0x0000FFFF
	cmp r1, r0
	beq _02063F1A
	cmp r6, #1
	bne _02063F0C
	add r0, r5, #0
	bl ov01_021FE66C
_02063F0C:
	add r1, r4, #0
	ldr r2, [r4]
	add r0, r5, #0
	add r1, #8
	bl ov01_021F94C0
	b _02063F1E
_02063F1A:
	bl GF_AssertFail
_02063F1E:
	mov r0, #0
	strh r0, [r7, #2]
_02063F22:
	add r0, r5, #0
	str r6, [r4, #4]
	bl ov01_021FA2D4
	cmp r0, #1
	beq _02063FDC
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _02063FDC
	add r0, r5, #0
	bl ov01_021FA3E8
	add r0, r5, #0
	bl ov01_021F9344
	cmp r0, #0
	bne _02063FD4
	add r0, r5, #0
	bl sub_0205F330
	cmp r0, #0
	beq _02063F58
	cmp r0, #1
	beq _02063F74
	cmp r0, #2
	beq _02063F90
	b _02063FAC
_02063F58:
	ldr r0, [r4, #8]
	bl sub_02023EF4
	cmp r0, #0
	beq _02063FCA
	ldr r0, [r4, #8]
	mov r1, #0
	bl sub_02023EE0
	ldr r0, [r4, #8]
	mov r1, #0
	bl sub_02023F40
	b _02063FCA
_02063F74:
	ldr r0, [r4, #8]
	bl sub_02023EF4
	cmp r0, #1
	beq _02063FCA
	ldr r0, [r4, #8]
	mov r1, #1
	bl sub_02023EE0
	ldr r0, [r4, #8]
	mov r1, #0
	bl sub_02023F40
	b _02063FCA
_02063F90:
	ldr r0, [r4, #8]
	bl sub_02023EF4
	cmp r0, #2
	beq _02063FCA
	ldr r0, [r4, #8]
	mov r1, #2
	bl sub_02023EE0
	ldr r0, [r4, #8]
	mov r1, #0
	bl sub_02023F40
	b _02063FCA
_02063FAC:
	bl GF_AssertFail
	ldr r0, [r4, #8]
	bl sub_02023EF4
	cmp r0, #0
	beq _02063FCA
	ldr r0, [r4, #8]
	mov r1, #0
	bl sub_02023EE0
	ldr r0, [r4, #8]
	mov r1, #0
	bl sub_02023F40
_02063FCA:
	mov r1, #1
	ldr r0, [r4, #8]
	lsl r1, r1, #0xc
	bl sub_02023F04
_02063FD4:
	ldr r1, [r4, #8]
	add r0, r5, #0
	bl ov01_021FA40C
_02063FDC:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02063FE0: .word 0x0000FFFF
	thumb_func_end sub_02063E70

	thumb_func_start sub_02063FE4
sub_02063FE4: ; 0x02063FE4
	push {r4, lr}
	add r4, r0, #0
	bl sub_0205F40C
	add r2, r0, #0
	add r1, r2, #0
	ldr r2, [r2]
	add r0, r4, #0
	add r1, #8
	bl ov01_021F95CC
	pop {r4, pc}
	thumb_func_end sub_02063FE4

	thumb_func_start sub_02063FFC
sub_02063FFC: ; 0x02063FFC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_0205F40C
	add r4, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _02064014
	add r1, r4, #0
	add r1, #0xc
	bl ov01_021F9610
_02064014:
	add r1, r4, #0
	ldr r2, [r4]
	add r0, r5, #0
	add r1, #8
	bl ov01_021F95CC
	mov r1, #2
	add r0, r5, #0
	lsl r1, r1, #0x14
	bl sub_0205F20C
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02063FFC

	thumb_func_start sub_0206402C
sub_0206402C: ; 0x0206402C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_0205F40C
	add r4, r0, #0
	add r0, r5, #0
	bl ov01_021FA2D4
	cmp r0, #1
	beq _0206407E
	ldr r0, [r4, #8]
	cmp r0, #0
	bne _0206405E
	ldr r2, [r4]
	ldr r0, _02064080 ; =0x0000FFFF
	cmp r2, r0
	beq _0206405A
	add r1, r4, #0
	add r0, r5, #0
	add r1, #8
	bl ov01_021F94C0
	b _0206405E
_0206405A:
	bl GF_AssertFail
_0206405E:
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0206407E
	add r1, r4, #0
	add r1, #0xc
	bl ov01_021F9630
	ldr r1, [r4, #8]
	add r0, r5, #0
	bl ov01_021FA3E8
	mov r1, #2
	add r0, r5, #0
	lsl r1, r1, #0x14
	bl sub_0205F214
_0206407E:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02064080: .word 0x0000FFFF
	thumb_func_end sub_0206402C

	thumb_func_start sub_02064084
sub_02064084: ; 0x02064084
	push {r4, lr}
	add r4, r0, #0
	bl ov01_021FA2D4
	cmp r0, #1
	bne _02064098
	bl GF_AssertFail
	mov r0, #0
	pop {r4, pc}
_02064098:
	add r0, r4, #0
	bl sub_0205F40C
	ldr r0, [r0, #8]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02064084

	thumb_func_start sub_020640A4
sub_020640A4: ; 0x020640A4
	push {r4, lr}
	add r4, r0, #0
	cmp r1, #0
	bne _020640B0
	ldr r0, _020640C0 ; =0x00000106
	pop {r4, pc}
_020640B0:
	cmp r4, #0
	bne _020640B8
	bl GF_AssertFail
_020640B8:
	ldr r0, _020640C4 ; =0x02207274
	lsl r1, r4, #2
	ldr r0, [r0, r1]
	pop {r4, pc}
	.balign 4, 0
_020640C0: .word 0x00000106
_020640C4: .word 0x02207274
	thumb_func_end sub_020640A4

	thumb_func_start sub_020640C8
sub_020640C8: ; 0x020640C8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x58
	add r5, r0, #0
	ldr r7, [r5, #0x40]
	add r4, r1, #0
	ldr r6, [r5, #0x3c]
	add r1, sp, #0x40
	str r1, [sp]
	add r1, r6, #0
	add r2, r7, #0
	mov r3, #0
	bl sub_020641EC
	cmp r0, #0
	bne _020640EC
	add sp, #0x58
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_020640EC:
	ldr r0, [sp, #0x50]
	cmp r0, #0
	bne _02064172
	ldr r1, _020641E8 ; =0x00000E9B
	ldr r2, [sp, #0x54]
	add r0, r5, #0
	bl sub_0203FE74
	cmp r4, #0
	beq _02064114
	add r0, sp, #0x28
	str r0, [sp]
	ldr r3, [sp, #0x54]
	add r0, r5, #0
	add r1, r6, #0
	add r2, r7, #0
	bl sub_020641EC
	cmp r0, #0
	bne _02064134
_02064114:
	ldr r0, [sp, #0x48]
	str r0, [sp]
	ldr r0, [sp, #0x4c]
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	ldr r1, [sp, #0x54]
	ldr r2, [sp, #0x40]
	ldr r3, [sp, #0x44]
	add r0, r5, #0
	bl sub_0203FEA4
	add sp, #0x58
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02064134:
	ldr r0, [sp, #0x48]
	str r0, [sp]
	ldr r0, [sp, #0x4c]
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r1, [sp, #0x54]
	ldr r2, [sp, #0x40]
	ldr r3, [sp, #0x44]
	add r0, r5, #0
	bl sub_0203FEA4
	ldr r0, [sp, #0x30]
	str r0, [sp]
	ldr r0, [sp, #0x34]
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	ldr r1, [sp, #0x3c]
	ldr r2, [sp, #0x28]
	ldr r3, [sp, #0x2c]
	add r0, r5, #0
	bl sub_0203FEA4
	add sp, #0x58
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02064172:
	cmp r0, #1
	bne _020641DE
	cmp r4, #0
	bne _02064180
	add sp, #0x58
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02064180:
	ldr r2, [sp, #0x54]
	ldr r3, [sp, #0x4c]
	add r0, r5, #0
	add r1, r6, #0
	bl sub_02064520
	add r1, r0, #0
	ldr r2, [sp, #0x40]
	ldr r3, [sp, #0x44]
	add r0, sp, #0x10
	bl sub_0206426C
	ldr r1, _020641E8 ; =0x00000E9B
	ldr r2, [sp, #0x54]
	add r0, r5, #0
	bl sub_0203FE74
	ldr r0, [sp, #0x48]
	str r0, [sp]
	ldr r0, [sp, #0x4c]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r1, [sp, #0x54]
	ldr r2, [sp, #0x40]
	ldr r3, [sp, #0x44]
	add r0, r5, #0
	bl sub_0203FEA4
	ldr r0, [sp, #0x18]
	str r0, [sp]
	ldr r0, [sp, #0x1c]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	ldr r1, [sp, #0x24]
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	add r0, r5, #0
	bl sub_0203FEA4
	add sp, #0x58
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_020641DE:
	bl GF_AssertFail
	mov r0, #0
	add sp, #0x58
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_020641E8: .word 0x00000E9B
	thumb_func_end sub_020640C8

	thumb_func_start sub_020641EC
sub_020641EC: ; 0x020641EC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0
	add r6, r1, #0
	add r7, r2, #0
	add r4, r3, #0
	str r0, [sp, #0xc]
	str r0, [sp, #4]
	add r0, r6, #0
	add r1, sp, #4
	add r2, sp, #0xc
	mov r3, #1
	bl sub_0205EEF4
	cmp r0, #0
	beq _02064264
_0206420E:
	cmp r4, #0
	beq _02064218
	ldr r0, [sp, #4]
	cmp r4, r0
	beq _02064254
_02064218:
	ldr r0, [sp, #4]
	add r1, r7, #0
	add r2, sp, #8
	bl sub_020642C4
	mov r1, #0
	mvn r1, r1
	str r0, [sp]
	cmp r0, r1
	beq _02064254
	ldr r0, [sp, #4]
	bl sub_02064508
	add r1, r0, #0
	lsl r1, r1, #0x10
	ldr r0, [r5, #0xc]
	lsr r1, r1, #0x10
	bl TrainerFlagCheck
	cmp r0, #0
	bne _02064254
	ldr r0, [sp, #0x28]
	ldr r1, [sp, #4]
	ldr r2, [sp]
	ldr r3, [sp, #8]
	bl sub_0206426C
	add sp, #0x10
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02064254:
	add r0, r6, #0
	add r1, sp, #4
	add r2, sp, #0xc
	mov r3, #1
	bl sub_0205EEF4
	cmp r0, #0
	bne _0206420E
_02064264:
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_020641EC

	thumb_func_start sub_0206426C
sub_0206426C: ; 0x0206426C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	str r2, [r5]
	str r3, [r5, #4]
	add r0, r4, #0
	bl sub_0205F27C
	str r0, [r5, #8]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl sub_020404C8
	str r0, [r5, #0xc]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl sub_02040500
	str r0, [r5, #0x10]
	str r4, [r5, #0x14]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0206426C

	thumb_func_start sub_02064298
sub_02064298: ; 0x02064298
	push {r3, lr}
	bl sub_0205F26C
	cmp r0, #8
	bhi _020642C2
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_020642AE: ; jump table
	.short _020642C2 - _020642AE - 2 ; case 0
	.short _020642C2 - _020642AE - 2 ; case 1
	.short _020642C2 - _020642AE - 2 ; case 2
	.short _020642C2 - _020642AE - 2 ; case 3
	.short _020642C0 - _020642AE - 2 ; case 4
	.short _020642C0 - _020642AE - 2 ; case 5
	.short _020642C0 - _020642AE - 2 ; case 6
	.short _020642C0 - _020642AE - 2 ; case 7
	.short _020642C0 - _020642AE - 2 ; case 8
_020642C0:
	mov r0, #1
_020642C2:
	pop {r3, pc}
	thumb_func_end sub_02064298

	thumb_func_start sub_020642C4
sub_020642C4: ; 0x020642C4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	add r4, r1, #0
	str r2, [sp, #8]
	bl sub_02064298
	cmp r0, #1
	bne _02064332
	add r0, r4, #0
	bl sub_0205C67C
	add r7, r0, #0
	add r0, r4, #0
	bl sub_0205C688
	add r6, r0, #0
	add r0, r5, #0
	bl sub_0205F2A8
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #0
	bl sub_0205F2F4
	add r2, r0, #0
	str r6, [sp]
	mov r0, #0
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, r4, #0
	add r3, r7, #0
	bl sub_0206439C
	add r6, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r6, r0
	beq _0206432A
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl sub_02064468
	cmp r0, #0
	bne _0206432A
	ldr r0, [sp, #8]
	add sp, #0x14
	str r4, [r0]
	add r0, r6, #0
	pop {r4, r5, r6, r7, pc}
_0206432A:
	mov r0, #0
	add sp, #0x14
	mvn r0, r0
	pop {r4, r5, r6, r7, pc}
_02064332:
	cmp r0, #2
	bne _02064394
	add r0, r4, #0
	bl sub_0205C67C
	str r0, [sp, #0x10]
	add r0, r4, #0
	bl sub_0205C688
	add r7, r0, #0
	add r0, r5, #0
	mov r1, #0
	bl sub_0205F2F4
	str r0, [sp, #0xc]
	mov r4, #0
_02064352:
	str r7, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r2, [sp, #0xc]
	ldr r3, [sp, #0x10]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0206439C
	add r6, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r6, r0
	beq _02064386
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl sub_02064468
	cmp r0, #0
	bne _02064386
	ldr r0, [sp, #8]
	add sp, #0x14
	str r4, [r0]
	add r0, r6, #0
	pop {r4, r5, r6, r7, pc}
_02064386:
	add r4, r4, #1
	cmp r4, #4
	blt _02064352
	mov r0, #0
	add sp, #0x14
	mvn r0, r0
	pop {r4, r5, r6, r7, pc}
_02064394:
	mov r0, #0
	mvn r0, r0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end sub_020642C4

	thumb_func_start sub_0206439C
sub_0206439C: ; 0x0206439C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldr r1, [sp, #0x14]
	lsl r5, r4, #2
	ldr r4, _020643B4 ; =_020FE194
	str r1, [sp]
	add r1, r2, #0
	add r2, r3, #0
	ldr r3, [sp, #0x10]
	ldr r4, [r4, r5]
	blx r4
	pop {r3, r4, r5, pc}
	.balign 4, 0
_020643B4: .word _020FE194
	thumb_func_end sub_0206439C

	thumb_func_start sub_020643B8
sub_020643B8: ; 0x020643B8
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r5, r1, #0
	add r6, r2, #0
	add r4, r3, #0
	bl sub_0205F914
	cmp r0, r6
	bne _020643DE
	add r0, r7, #0
	bl sub_0205F934
	cmp r4, r0
	bge _020643DE
	sub r1, r0, r5
	cmp r4, r1
	blt _020643DE
	sub r0, r0, r4
	pop {r3, r4, r5, r6, r7, pc}
_020643DE:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_020643B8

	thumb_func_start sub_020643E4
sub_020643E4: ; 0x020643E4
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r5, r1, #0
	add r6, r2, #0
	add r4, r3, #0
	bl sub_0205F914
	cmp r0, r6
	bne _0206440A
	add r0, r7, #0
	bl sub_0205F934
	cmp r4, r0
	ble _0206440A
	add r1, r0, r5
	cmp r4, r1
	bgt _0206440A
	sub r0, r4, r0
	pop {r3, r4, r5, r6, r7, pc}
_0206440A:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_020643E4

	thumb_func_start sub_02064410
sub_02064410: ; 0x02064410
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r6, r1, #0
	add r5, r2, #0
	add r4, r3, #0
	bl sub_0205F934
	cmp r0, r4
	bne _02064436
	add r0, r7, #0
	bl sub_0205F914
	cmp r5, r0
	bge _02064436
	sub r1, r0, r6
	cmp r5, r1
	blt _02064436
	sub r0, r0, r5
	pop {r3, r4, r5, r6, r7, pc}
_02064436:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02064410

	thumb_func_start sub_0206443C
sub_0206443C: ; 0x0206443C
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r6, r1, #0
	add r5, r2, #0
	add r4, r3, #0
	bl sub_0205F934
	cmp r0, r4
	bne _02064462
	add r0, r7, #0
	bl sub_0205F914
	cmp r5, r0
	ble _02064462
	add r1, r0, r6
	cmp r5, r1
	bgt _02064462
	sub r0, r5, r0
	pop {r3, r4, r5, r6, r7, pc}
_02064462:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0206443C

	thumb_func_start sub_02064468
sub_02064468: ; 0x02064468
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r1, #0
	str r0, [sp, #4]
	str r2, [sp, #8]
	cmp r2, #0
	bne _0206447C
	add sp, #0x18
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0206447C:
	bl sub_0205F914
	add r4, r0, #0
	ldr r0, [sp, #4]
	bl sub_0205F934
	add r7, r0, #0
	ldr r0, [sp, #4]
	bl sub_0205F924
	str r0, [sp, #0xc]
	add r0, r5, #0
	bl sub_02060F0C
	add r6, r4, r0
	add r0, r5, #0
	bl sub_02060F18
	add r4, r7, r0
	ldr r0, [sp, #8]
	mov r7, #0
	sub r0, r0, #1
	str r0, [sp, #0x10]
	cmp r0, #0
	ble _020644E4
	mov r0, #1
	str r0, [sp, #0x14]
_020644B2:
	ldr r0, [sp, #4]
	ldr r2, [sp, #0xc]
	add r1, r6, #0
	add r3, r4, #0
	str r5, [sp]
	bl sub_02060B90
	ldr r1, [sp, #0x14]
	bic r0, r1
	beq _020644CC
	add sp, #0x18
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_020644CC:
	add r0, r5, #0
	bl sub_02060F0C
	add r6, r6, r0
	add r0, r5, #0
	bl sub_02060F18
	add r4, r4, r0
	ldr r0, [sp, #0x10]
	add r7, r7, #1
	cmp r7, r0
	blt _020644B2
_020644E4:
	ldr r0, [sp, #4]
	ldr r2, [sp, #0xc]
	add r1, r6, #0
	add r3, r4, #0
	str r5, [sp]
	bl sub_02060B90
	mov r1, #1
	bic r0, r1
	cmp r0, #4
	bne _02064500
	add sp, #0x18
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02064500:
	mov r0, #1
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02064468

	thumb_func_start sub_02064508
sub_02064508: ; 0x02064508
	push {r3, lr}
	bl sub_0205F27C
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl sub_020404C8
	pop {r3, pc}
	thumb_func_end sub_02064508

	thumb_func_start sub_02064518
sub_02064518: ; 0x02064518
	ldr r3, _0206451C ; =sub_02064508
	bx r3
	.balign 4, 0
_0206451C: .word sub_02064508
	thumb_func_end sub_02064518

	thumb_func_start sub_02064520
sub_02064520: ; 0x02064520
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r1, #0
	mov r0, #0
	add r4, r2, #0
	add r6, r3, #0
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, sp, #0
	add r2, sp, #4
	mov r3, #1
	bl sub_0205EEF4
	cmp r0, #0
	beq _02064570
	add r7, sp, #0
_02064540:
	ldr r0, [sp]
	cmp r0, r4
	beq _02064560
	bl sub_02064298
	sub r0, r0, #1
	cmp r0, #1
	bhi _02064560
	ldr r0, [sp]
	bl sub_02064508
	cmp r6, r0
	bne _02064560
	ldr r0, [sp]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_02064560:
	add r0, r5, #0
	add r1, r7, #0
	add r2, sp, #4
	mov r3, #1
	bl sub_0205EEF4
	cmp r0, #0
	bne _02064540
_02064570:
	bl GF_AssertFail
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02064520

	thumb_func_start sub_0206457C
sub_0206457C: ; 0x0206457C
	push {r4, lr}
	sub sp, #0x10
	ldr r4, [sp, #0x18]
	str r4, [sp]
	ldr r4, [sp, #0x1c]
	str r4, [sp, #4]
	ldr r4, [sp, #0x20]
	str r4, [sp, #8]
	ldr r4, [sp, #0x24]
	str r4, [sp, #0xc]
	bl sub_020645B4
	add sp, #0x10
	pop {r4, pc}
	thumb_func_end sub_0206457C

	thumb_func_start sub_02064598
sub_02064598: ; 0x02064598
	push {r4, lr}
	add r4, r0, #0
	bne _020645A2
	bl GF_AssertFail
_020645A2:
	add r0, r4, #0
	bl sub_0206460C
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02064598

	thumb_func_start sub_020645AC
sub_020645AC: ; 0x020645AC
	ldr r3, _020645B0 ; =sub_02064618
	bx r3
	.balign 4, 0
_020645B0: .word sub_02064618
	thumb_func_end sub_020645AC

	thumb_func_start sub_020645B4
sub_020645B4: ; 0x020645B4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #4
	mov r1, #0x30
	add r7, r2, #0
	str r3, [sp]
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	bne _020645CE
	bl GF_AssertFail
_020645CE:
	add r0, r4, #0
	mov r1, #0
	mov r2, #0x30
	bl memset
	ldr r0, [sp]
	add r1, r4, #0
	str r0, [r4, #8]
	ldr r0, [sp, #0x18]
	mov r2, #0xff
	str r0, [r4, #0xc]
	ldr r0, [sp, #0x1c]
	str r0, [r4, #0x10]
	ldr r0, [sp, #0x20]
	str r0, [r4, #0x14]
	ldr r0, [sp, #0x24]
	str r0, [r4, #0x18]
	str r5, [r4, #0x2c]
	str r6, [r4, #0x24]
	ldr r0, _02064608 ; =sub_02064630
	str r7, [r4, #0x28]
	bl sub_0200E320
	add r4, r0, #0
	bne _02064604
	bl GF_AssertFail
_02064604:
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02064608: .word sub_02064630
	thumb_func_end sub_020645B4

	thumb_func_start sub_0206460C
sub_0206460C: ; 0x0206460C
	push {r3, lr}
	bl sub_0201F988
	ldr r0, [r0, #4]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0206460C

	thumb_func_start sub_02064618
sub_02064618: ; 0x02064618
	push {r4, lr}
	add r4, r0, #0
	bl sub_0201F988
	add r1, r0, #0
	mov r0, #4
	bl FreeToHeapExplicit
	add r0, r4, #0
	bl sub_0200E390
	pop {r4, pc}
	thumb_func_end sub_02064618

	thumb_func_start sub_02064630
sub_02064630: ; 0x02064630
	push {r3, r4, r5, lr}
	ldr r4, _02064648 ; =_020FE1A4
	add r5, r1, #0
_02064636:
	ldr r1, [r5]
	add r0, r5, #0
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	blx r1
	cmp r0, #1
	beq _02064636
	pop {r3, r4, r5, pc}
	nop
_02064648: .word _020FE1A4
	thumb_func_end sub_02064630

	thumb_func_start sub_0206464C
sub_0206464C: ; 0x0206464C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r4, [r5, #0x24]
	add r0, r4, #0
	bl sub_0205F648
	cmp r0, #1
	bne _02064662
	add r0, r4, #0
	bl sub_0205F708
_02064662:
	mov r0, #1
	str r0, [r5]
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0206464C

	thumb_func_start sub_02064668
sub_02064668: ; 0x02064668
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r5, [r4, #0x24]
	add r0, r5, #0
	bl sub_0205F648
	cmp r0, #1
	bne _0206467C
	mov r0, #0
	pop {r3, r4, r5, pc}
_0206467C:
	ldr r0, [r4, #0x24]
	ldr r1, [r4, #8]
	bl ov01_021F9408
	add r0, r5, #0
	mov r1, #0x40
	bl sub_0205F20C
	mov r0, #2
	str r0, [r4]
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02064668

	thumb_func_start sub_02064694
sub_02064694: ; 0x02064694
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x28]
	bl sub_0205C6DC
	bl sub_02062198
	cmp r0, #0
	bne _020646AA
	mov r0, #0
	pop {r4, pc}
_020646AA:
	ldr r0, [r4, #0x24]
	bl sub_0205F264
	sub r0, #0x33
	cmp r0, #3
	bhi _020646D2
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_020646C2: ; jump table
	.short _020646CA - _020646C2 - 2 ; case 0
	.short _020646CA - _020646C2 - 2 ; case 1
	.short _020646CA - _020646C2 - 2 ; case 2
	.short _020646CA - _020646C2 - 2 ; case 3
_020646CA:
	mov r0, #7
	str r0, [r4]
	mov r0, #1
	pop {r4, pc}
_020646D2:
	mov r0, #3
	str r0, [r4]
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02064694

	thumb_func_start sub_020646DC
sub_020646DC: ; 0x020646DC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x24]
	bl sub_02062108
	cmp r0, #0
	bne _020646EE
	mov r0, #0
	pop {r4, pc}
_020646EE:
	mov r0, #0
	ldr r1, [r4, #8]
	mvn r0, r0
	cmp r1, r0
	bne _020646FC
	bl GF_AssertFail
_020646FC:
	ldr r0, [r4, #8]
	mov r1, #0
	bl sub_0206234C
	add r1, r0, #0
	ldr r0, [r4, #0x24]
	bl sub_0206214C
	mov r0, #4
	str r0, [r4]
	mov r0, #0
	pop {r4, pc}
	thumb_func_end sub_020646DC

	thumb_func_start sub_02064714
sub_02064714: ; 0x02064714
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x24]
	bl sub_02062198
	cmp r0, #0
	bne _02064726
	mov r0, #0
	pop {r4, pc}
_02064726:
	mov r0, #5
	str r0, [r4]
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02064714

	thumb_func_start sub_02064730
sub_02064730: ; 0x02064730
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0
	ldr r0, [r4, #0x24]
	add r2, r1, #0
	bl ov01_02200540
	str r0, [r4, #0x20]
	mov r0, #6
	str r0, [r4]
	mov r0, #0
	pop {r4, pc}
	thumb_func_end sub_02064730

	thumb_func_start sub_02064748
sub_02064748: ; 0x02064748
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x20]
	bl ov01_022003F4
	cmp r0, #1
	bne _02064760
	ldr r0, [r4, #0x20]
	bl sub_02068B48
	mov r0, #9
	str r0, [r4]
_02064760:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end sub_02064748

	thumb_func_start sub_02064764
sub_02064764: ; 0x02064764
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x24]
	mov r1, #0x65
	bl sub_0206214C
	mov r0, #8
	str r0, [r4]
	mov r0, #0
	pop {r4, pc}
	thumb_func_end sub_02064764

	thumb_func_start sub_02064778
sub_02064778: ; 0x02064778
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x24]
	bl sub_02062198
	cmp r0, #1
	bne _0206478A
	mov r0, #9
	str r0, [r4]
_0206478A:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02064778

	thumb_func_start sub_02064790
sub_02064790: ; 0x02064790
	ldr r1, [r0, #0x1c]
	add r1, r1, #1
	str r1, [r0, #0x1c]
	cmp r1, #0x1e
	blt _020647A2
	mov r1, #0
	str r1, [r0, #0x1c]
	mov r1, #0xa
	str r1, [r0]
_020647A2:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end sub_02064790

	thumb_func_start sub_020647A8
sub_020647A8: ; 0x020647A8
	ldr r1, [r0, #0xc]
	cmp r1, #1
	bgt _020647B6
	mov r1, #0xd
	str r1, [r0]
	mov r0, #1
	bx lr
_020647B6:
	mov r1, #0xb
	str r1, [r0]
	mov r0, #1
	bx lr
	.balign 4, 0
	thumb_func_end sub_020647A8

	thumb_func_start sub_020647C0
sub_020647C0: ; 0x020647C0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x24]
	bl sub_02062108
	cmp r0, #1
	bne _020647E2
	ldr r0, [r4, #8]
	mov r1, #0xc
	bl sub_0206234C
	add r1, r0, #0
	ldr r0, [r4, #0x24]
	bl sub_0206214C
	mov r0, #0xc
	str r0, [r4]
_020647E2:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020647C0

	thumb_func_start sub_020647E8
sub_020647E8: ; 0x020647E8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x24]
	bl sub_02062198
	cmp r0, #0
	bne _020647FA
	mov r0, #0
	pop {r4, pc}
_020647FA:
	ldr r0, [r4, #0xc]
	sub r0, r0, #1
	str r0, [r4, #0xc]
	mov r0, #0xa
	str r0, [r4]
	mov r0, #1
	pop {r4, pc}
	thumb_func_end sub_020647E8

	thumb_func_start sub_02064808
sub_02064808: ; 0x02064808
	ldr r1, [r0, #0x1c]
	add r1, r1, #1
	str r1, [r0, #0x1c]
	cmp r1, #8
	bge _02064816
	mov r0, #0
	bx lr
_02064816:
	mov r1, #0
	str r1, [r0, #0x1c]
	mov r1, #0xe
	str r1, [r0]
	mov r0, #1
	bx lr
	.balign 4, 0
	thumb_func_end sub_02064808

	thumb_func_start sub_02064824
sub_02064824: ; 0x02064824
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x28]
	bl sub_0205C6DC
	add r4, r0, #0
	bl sub_0205F914
	add r6, r0, #0
	add r0, r4, #0
	bl sub_0205F934
	add r7, r0, #0
	ldr r0, [r5, #0x24]
	bl sub_0205F914
	str r0, [sp]
	ldr r0, [r5, #0x24]
	bl sub_0205F934
	add r3, r0, #0
	ldr r2, [sp]
	add r0, r6, #0
	add r1, r7, #0
	bl sub_02061200
	add r6, r0, #0
	ldr r0, [r5, #0x28]
	bl sub_0205C654
	cmp r6, r0
	beq _02064898
	ldr r0, [r5, #0x18]
	cmp r0, #0
	beq _02064870
	ldr r0, [r5, #0x14]
	cmp r0, #2
	bne _02064898
_02064870:
	add r0, r4, #0
	bl sub_02062108
	cmp r0, #1
	bne _0206489C
	add r0, r4, #0
	mov r1, #0x80
	bl sub_0205F214
	add r0, r6, #0
	mov r1, #0
	bl sub_0206234C
	add r1, r0, #0
	add r0, r4, #0
	bl sub_0206214C
	mov r0, #0xf
	str r0, [r5]
	b _0206489C
_02064898:
	mov r0, #0x10
	str r0, [r5]
_0206489C:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02064824

	thumb_func_start sub_020648A0
sub_020648A0: ; 0x020648A0
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x28]
	bl sub_0205C6DC
	add r5, r0, #0
	bl sub_02062198
	cmp r0, #0
	bne _020648B8
	mov r0, #0
	pop {r3, r4, r5, pc}
_020648B8:
	add r0, r5, #0
	bl sub_020621C0
	mov r0, #0x10
	str r0, [r4]
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_020648A0

	thumb_func_start sub_020648C8
sub_020648C8: ; 0x020648C8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x24]
	bl sub_020621C0
	ldr r0, [r4, #0x24]
	mov r1, #0
	bl sub_0205FC94
	mov r0, #0x11
	str r0, [r4]
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020648C8

	thumb_func_start sub_020648E4
sub_020648E4: ; 0x020648E4
	mov r1, #1
	str r1, [r0, #4]
	mov r0, #0
	bx lr
	thumb_func_end sub_020648E4

	thumb_func_start sub_020648EC
sub_020648EC: ; 0x020648EC
	push {r4, lr}
	add r4, r0, #0
	bl ScriptEnvironment_GetSav2Ptr
	bl sub_0202A998
	bl sub_0202AEBC
	add r1, r0, #0
	beq _0206490A
	lsl r2, r1, #2
	ldr r1, _0206490C ; =_020FE214
	add r0, r4, #0
	ldr r1, [r1, r2]
	blx r1
_0206490A:
	pop {r4, pc}
	.balign 4, 0
_0206490C: .word _020FE214
	thumb_func_end sub_020648EC

	thumb_func_start sub_02064910
sub_02064910: ; 0x02064910
	push {r4, lr}
	add r4, r0, #0
	bl ScriptEnvironment_GetSav2Ptr
	bl sub_0202A998
	bl sub_0202AEBC
	cmp r0, #0
	beq _02064932
	lsl r1, r0, #2
	ldr r0, _02064934 ; =_020FE1EC
	ldr r1, [r0, r1]
	cmp r1, #0
	beq _02064932
	add r0, r4, #0
	blx r1
_02064932:
	pop {r4, pc}
	.balign 4, 0
_02064934: .word _020FE1EC
	thumb_func_end sub_02064910

	thumb_func_start sub_02064938
sub_02064938: ; 0x02064938
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r4, r1, #0
	add r7, r2, #0
	str r3, [sp, #4]
	bl ScriptEnvironment_GetSav2Ptr
	bl sub_0202A998
	bl sub_0202AEBC
	cmp r0, #0
	bne _0206495A
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0206495A:
	lsl r1, r0, #2
	ldr r0, _0206497C ; =_020FE23C
	ldr r6, [r0, r1]
	cmp r6, #0
	beq _02064976
	ldr r0, [sp, #0x20]
	ldr r3, [sp, #4]
	str r0, [sp]
	add r0, r5, #0
	add r1, r4, #0
	add r2, r7, #0
	blx r6
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_02064976:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0206497C: .word _020FE23C
	thumb_func_end sub_02064938

	thumb_func_start sub_02064980
sub_02064980: ; 0x02064980
	cmp r0, #0
	bne _02064990
	mov r0, #0xc
	add r2, r1, #0
	mul r2, r0
	ldr r0, _020649AC ; =_020FE264
	ldr r0, [r0, r2]
	bx lr
_02064990:
	cmp r0, #1
	bne _020649A0
	mov r0, #0xc
	add r2, r1, #0
	mul r2, r0
	ldr r0, _020649B0 ; =_020FE264 + 4
	ldr r0, [r0, r2]
	bx lr
_020649A0:
	mov r0, #0xc
	add r2, r1, #0
	mul r2, r0
	ldr r0, _020649B4 ; =_020FE264 + 8
	ldr r0, [r0, r2]
	bx lr
	.balign 4, 0
_020649AC: .word _020FE264
_020649B0: .word _020FE264 + 4
_020649B4: .word _020FE264 + 8
	thumb_func_end sub_02064980

	thumb_func_start sub_020649B8
sub_020649B8: ; 0x020649B8
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	add r5, r1, #0
	str r4, [r5, #0x14]
	ldr r0, [r4, #0x20]
	ldr r0, [r0]
	str r0, [r5]
	ldr r0, [r4, #0xc]
	bl SavArray_Flags_get
	bl sub_02066644
	ldrh r1, [r5, #8]
	mov r2, #1
	lsl r0, r0, #0x10
	bic r1, r2
	lsr r2, r0, #0x10
	mov r0, #1
	and r0, r2
	orr r0, r1
	strh r0, [r5, #8]
	ldr r0, [r4, #0xc]
	bl SavArray_Flags_get
	bl sub_020666B4
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	lsl r0, r0, #0x1f
	ldrh r1, [r5, #8]
	mov r2, #2
	lsr r0, r0, #0x1e
	bic r1, r2
	orr r0, r1
	strh r0, [r5, #8]
	ldr r0, [r4, #0x40]
	bl sub_0205C700
	str r0, [r5, #4]
	ldr r0, [r4, #0x40]
	bl sub_0205C67C
	add r6, r0, #0
	ldr r0, [r4, #0x40]
	bl sub_0205C688
	add r7, r0, #0
	add r0, r4, #0
	add r1, r6, #0
	add r2, r7, #0
	bl sub_02054918
	strh r0, [r5, #0xc]
	ldr r0, [r4, #0x40]
	bl sub_0205C654
	cmp r0, #3
	bhi _02064A4E
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02064A38: ; jump table
	.short _02064A40 - _02064A38 - 2 ; case 0
	.short _02064A44 - _02064A38 - 2 ; case 1
	.short _02064A4C - _02064A38 - 2 ; case 2
	.short _02064A48 - _02064A38 - 2 ; case 3
_02064A40:
	sub r7, r7, #1
	b _02064A4E
_02064A44:
	add r7, r7, #1
	b _02064A4E
_02064A48:
	add r6, r6, #1
	b _02064A4E
_02064A4C:
	sub r6, r6, #1
_02064A4E:
	add r0, r4, #0
	add r1, r6, #0
	add r2, r7, #0
	bl sub_02054918
	strh r0, [r5, #0xa]
	add r0, r4, #0
	add r1, sp, #0
	bl sub_0203DBF8
	ldr r0, [r4, #0x40]
	str r0, [r5, #0x10]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_020649B8

	thumb_func_start sub_02064A68
sub_02064A68: ; 0x02064A68
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #0x20
	mov r1, #0xc
	add r6, r2, #0
	add r7, r3, #0
	bl AllocFromHeap
	str r5, [r0]
	strh r4, [r0, #4]
	strh r6, [r0, #6]
	strh r7, [r0, #8]
	add r1, sp, #8
	ldrh r1, [r1, #0x10]
	strh r1, [r0, #0xa]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02064A68

	thumb_func_start sub_02064A8C
sub_02064A8C: ; 0x02064A8C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r6, r2, #0
	bl sub_0205064C
	add r7, r0, #0
	ldr r0, [r5]
	bl sub_02050650
	add r4, r0, #0
	add r0, r7, #0
	bl sub_020505C0
	mov r0, #0xd5
	mov r2, #0
	ldr r1, _02064ACC ; =sub_02064AD0
	lsl r0, r0, #2
	str r1, [r4, r0]
	str r2, [sp]
	ldrh r1, [r5, #4]
	add r0, r6, #0
	add r3, r2, #0
	bl sub_02064A68
	mov r1, #0xe
	lsl r1, r1, #6
	str r0, [r4, r1]
	mov r0, #0xc
	strh r0, [r4, #0x26]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02064ACC: .word sub_02064AD0
	thumb_func_end sub_02064A8C

	thumb_func_start sub_02064AD0
sub_02064AD0: ; 0x02064AD0
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	bl sub_0205064C
	add r5, r0, #0
	add r0, r7, #0
	bl sub_02050650
	add r4, r0, #0
	add r0, r7, #0
	bl sub_02050654
	add r6, r0, #0
	ldr r0, [r6]
	cmp r0, #0
	beq _02064AF6
	cmp r0, #1
	beq _02064B46
	b _02064B50
_02064AF6:
	add r0, r5, #0
	add r1, sp, #0
	bl sub_0203DBF8
	ldr r1, [r4]
	ldr r2, [sp]
	lsl r1, r1, #0x10
	add r0, r7, #0
	lsr r1, r1, #0x10
	mov r3, #0
	bl sub_0203FED4
	add r0, r5, #0
	mov r1, #0x2a
	bl FieldSysGetAttrAddr
	ldrh r1, [r4, #4]
	strh r1, [r0]
	add r0, r5, #0
	mov r1, #0x2b
	bl FieldSysGetAttrAddr
	ldrh r1, [r4, #6]
	strh r1, [r0]
	add r0, r5, #0
	mov r1, #0x2c
	bl FieldSysGetAttrAddr
	ldrh r1, [r4, #8]
	strh r1, [r0]
	add r0, r5, #0
	mov r1, #0x2d
	bl FieldSysGetAttrAddr
	ldrh r1, [r4, #0xa]
	strh r1, [r0]
	ldr r0, [r6]
	add r0, r0, #1
	str r0, [r6]
	b _02064B50
_02064B46:
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02064B50:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02064AD0

	thumb_func_start sub_02064B54
sub_02064B54: ; 0x02064B54
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, [r6]
	bl sub_0205064C
	add r5, r0, #0
	ldr r0, [r6]
	bl sub_02050650
	add r7, r0, #0
	mov r0, #0xb
	mov r1, #0x44
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x44
	add r4, r0, #0
	bl memset
	ldr r0, [r5, #0xc]
	bl SavArray_PlayerParty_get
	str r0, [r4]
	ldr r0, [r5, #0xc]
	bl Sav2_Bag_get
	str r0, [r4, #4]
	ldr r0, [r5, #0xc]
	bl Sav2_Mailbox_get
	str r0, [r4, #8]
	ldr r0, [r5, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [r4, #0xc]
	ldr r0, [r5, #0xc]
	bl sub_020270C4
	str r0, [r4, #0x10]
	mov r0, #0x37
	lsl r0, r0, #4
	add r0, r7, r0
	str r0, [r4, #0x18]
	add r0, r4, #0
	mov r1, #0
	add r0, #0x25
	strb r1, [r0]
	add r0, r4, #0
	mov r1, #5
	add r0, #0x24
	strb r1, [r0]
	str r5, [r4, #0x1c]
	ldrh r0, [r6, #4]
	add r2, r4, #0
	strh r0, [r4, #0x28]
	add r0, r4, #0
	ldrb r1, [r6, #6]
	add r0, #0x26
	strb r1, [r0]
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r5, r0
	str r0, [r4, #0x20]
	ldr r1, _02064BEC ; =0x0210159C
	add r0, r5, #0
	bl ScrUnk80_AddOvyMan
	mov r0, #0xe
	lsl r0, r0, #6
	str r4, [r7, r0]
	ldr r1, _02064BF0 ; =sub_0203CA9C
	add r0, r7, #0
	bl sub_0203C8F0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02064BEC: .word 0x0210159C
_02064BF0: .word sub_0203CA9C
	thumb_func_end sub_02064B54

	thumb_func_start sub_02064BF4
sub_02064BF4: ; 0x02064BF4
	mov r0, #0
	mvn r0, r0
	bx lr
	.balign 4, 0
	thumb_func_end sub_02064BF4

	thumb_func_start sub_02064BFC
sub_02064BFC: ; 0x02064BFC
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl sub_0205064C
	add r5, r0, #0
	ldr r0, [r4]
	bl sub_02050650
	add r4, r0, #0
	add r0, r5, #0
	bl sub_020505C0
	mov r0, #0xd5
	ldr r1, _02064C2C ; =sub_02064C58
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r1, #0
	add r0, #0x2c
	str r1, [r4, r0]
	mov r0, #0xc
	strh r0, [r4, #0x26]
	pop {r3, r4, r5, pc}
	nop
_02064C2C: .word sub_02064C58
	thumb_func_end sub_02064BFC

	thumb_func_start sub_02064C30
sub_02064C30: ; 0x02064C30
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	ldr r1, _02064C54 ; =sub_02064C58
	mov r2, #0
	bl sub_020504F0
	ldr r2, [r4]
	add r0, r2, #0
	add r0, #0xd2
	ldrb r1, [r0]
	mov r0, #0x80
	add r2, #0xd2
	orr r0, r1
	strb r0, [r2]
	mov r0, #0
	pop {r4, pc}
	nop
_02064C54: .word sub_02064C58
	thumb_func_end sub_02064C30

	thumb_func_start sub_02064C58
sub_02064C58: ; 0x02064C58
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl sub_0205064C
	add r4, r0, #0
	add r0, r5, #0
	bl sub_02050654
	add r5, r0, #0
	ldr r0, [r5]
	cmp r0, #0
	beq _02064C7C
	cmp r0, #1
	beq _02064CC2
	cmp r0, #2
	bne _02064C7A
	b _02064D94
_02064C7A:
	b _02064D9E
_02064C7C:
	add r0, r4, #0
	bl sub_02069F88
	cmp r0, #0
	beq _02064CBA
	add r0, r4, #0
	bl sub_02069D68
	bl sub_02062198
	cmp r0, #0
	bne _02064C96
	b _02064D9E
_02064C96:
	ldr r0, [r4, #0x40]
	bl sub_0205C700
	cmp r0, #1
	bne _02064CA4
	mov r6, #0x30
	b _02064CA6
_02064CA4:
	mov r6, #0x38
_02064CA6:
	add r0, r4, #0
	bl sub_02069D68
	add r1, r6, #0
	bl sub_0205FC94
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02064D9E
_02064CBA:
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02064D9E
_02064CC2:
	ldr r0, [r4, #0x40]
	bl sub_0205C700
	cmp r0, #1
	bne _02064D3E
	ldr r0, [r4, #0x40]
	bl sub_0205C6DC
	bl sub_0205F708
	ldr r0, [r4, #0x40]
	mov r1, #1
	bl ov01_021F1AFC
	ldr r0, [r4, #0x40]
	bl ov01_021F1B04
	add r0, r4, #0
	mov r1, #0
	bl sub_02054F28
	bl SndRadio_GetSeqNo
	cmp r0, #0
	bne _02064D08
	ldr r1, [r4, #0x20]
	add r0, r4, #0
	ldr r1, [r1]
	bl sub_02054F60
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #1
	bl sub_02054FDC
_02064D08:
	ldr r0, [r4, #0x40]
	bl sub_0205C654
	add r1, r0, #0
	lsl r1, r1, #0x18
	add r0, r4, #0
	lsr r1, r1, #0x18
	bl ov01_02205790
	add r0, r4, #0
	bl sub_02069F88
	cmp r0, #0
	beq _02064D8C
	add r0, r4, #0
	bl sub_02069D68
	mov r1, #1
	bl sub_02069E84
	add r0, r4, #0
	bl sub_02069D68
	mov r1, #1
	bl sub_02069DC8
	b _02064D8C
_02064D3E:
	bl SndRadio_GetSeqNo
	cmp r0, #0
	bne _02064D58
	ldr r1, _02064DA4 ; =0x000003F5
	add r0, r4, #0
	bl sub_02054F28
	ldr r1, _02064DA4 ; =0x000003F5
	add r0, r4, #0
	mov r2, #1
	bl sub_02054FDC
_02064D58:
	ldr r0, [r4, #0x40]
	bl sub_0205C6DC
	bl sub_0205F708
	ldr r0, [r4, #0x40]
	mov r1, #2
	bl ov01_021F1AFC
	ldr r0, [r4, #0x40]
	bl ov01_021F1B04
	add r0, r4, #0
	bl ov01_02205D68
	add r0, r4, #0
	bl sub_02069F88
	cmp r0, #0
	beq _02064D8C
	add r0, r4, #0
	bl sub_02069D68
	mov r1, #0
	bl sub_02069E84
_02064D8C:
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02064D9E
_02064D94:
	ldr r0, [r4, #0x3c]
	bl sub_0205F5A4
	mov r0, #1
	pop {r4, r5, r6, pc}
_02064D9E:
	mov r0, #0
	pop {r4, r5, r6, pc}
	nop
_02064DA4: .word 0x000003F5
	thumb_func_end sub_02064C58

	thumb_func_start sub_02064DA8
sub_02064DA8: ; 0x02064DA8
	push {r4, lr}
	add r4, r0, #0
	ldrh r0, [r4, #8]
	lsl r1, r0, #0x1f
	lsr r1, r1, #0x1f
	cmp r1, #1
	bne _02064DBA
	mov r0, #2
	pop {r4, pc}
_02064DBA:
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _02064DC6
	mov r0, #3
	pop {r4, pc}
_02064DC6:
	ldr r0, [r4, #0x10]
	bl sub_0205CABC
	cmp r0, #1
	bne _02064DD4
	mov r0, #1
	pop {r4, pc}
_02064DD4:
	ldrh r0, [r4, #0xc]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B6F4
	cmp r0, #1
	beq _02064DF0
	ldrh r0, [r4, #0xc]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B8AC
	cmp r0, #1
	bne _02064DF6
_02064DF0:
	mov r0, #0
	mvn r0, r0
	pop {r4, pc}
_02064DF6:
	ldr r0, [r4]
	bl MapHeader_IsBikeAllowed
	cmp r0, #0
	bne _02064E06
	mov r0, #0
	mvn r0, r0
	pop {r4, pc}
_02064E06:
	ldr r0, [r4, #4]
	cmp r0, #2
	bne _02064E12
	mov r0, #0
	mvn r0, r0
	pop {r4, pc}
_02064E12:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02064DA8

	thumb_func_start sub_02064E18
sub_02064E18: ; 0x02064E18
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, [r6]
	bl sub_0205064C
	add r5, r0, #0
	ldr r0, [r6]
	bl sub_02050650
	add r7, r0, #0
	mov r0, #0xb
	mov r1, #0x44
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x44
	add r4, r0, #0
	bl memset
	ldr r0, [r5, #0xc]
	bl SavArray_PlayerParty_get
	str r0, [r4]
	ldr r0, [r5, #0xc]
	bl Sav2_Bag_get
	str r0, [r4, #4]
	ldr r0, [r5, #0xc]
	bl Sav2_Mailbox_get
	str r0, [r4, #8]
	ldr r0, [r5, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [r4, #0xc]
	mov r0, #0x37
	lsl r0, r0, #4
	add r0, r7, r0
	str r0, [r4, #0x18]
	add r0, r4, #0
	mov r1, #0
	add r0, #0x25
	strb r1, [r0]
	add r0, r4, #0
	mov r1, #6
	add r0, #0x24
	strb r1, [r0]
	str r5, [r4, #0x1c]
	ldrh r0, [r6, #4]
	strh r0, [r4, #0x28]
	add r0, r4, #0
	ldrb r1, [r6, #6]
	add r0, #0x26
	strb r1, [r0]
	ldrh r0, [r6, #4]
	bl TMHMGetMove
	strh r0, [r4, #0x2a]
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r5, r0
	str r0, [r4, #0x20]
	ldr r1, _02064EB0 ; =0x0210159C
	add r0, r5, #0
	add r2, r4, #0
	bl ScrUnk80_AddOvyMan
	mov r0, #0xe
	lsl r0, r0, #6
	str r4, [r7, r0]
	ldr r1, _02064EB4 ; =sub_0203CA9C
	add r0, r7, #0
	bl sub_0203C8F0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02064EB0: .word 0x0210159C
_02064EB4: .word sub_0203CA9C
	thumb_func_end sub_02064E18

	thumb_func_start sub_02064EB8
sub_02064EB8: ; 0x02064EB8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5]
	bl sub_0205064C
	add r6, r0, #0
	ldr r0, [r5]
	bl sub_02050650
	add r4, r0, #0
	ldrh r0, [r5, #4]
	bl ItemToMailId
	add r2, r0, #0
	add r0, r6, #0
	mov r1, #3
	mov r3, #0xb
	bl sub_0203F018
	add r6, r0, #0
	ldrh r0, [r5, #4]
	mov r1, #3
	mov r2, #0
	bl sub_0203D818
	mov r1, #0xe1
	lsl r1, r1, #2
	str r0, [r4, r1]
	sub r0, r1, #4
	str r6, [r4, r0]
	ldr r1, _02064F00 ; =sub_0203D830
	add r0, r4, #0
	bl sub_0203C8F0
	pop {r4, r5, r6, pc}
	nop
_02064F00: .word sub_0203D830
	thumb_func_end sub_02064EB8

	thumb_func_start sub_02064F04
sub_02064F04: ; 0x02064F04
	mov r0, #0
	bx lr
	thumb_func_end sub_02064F04

	thumb_func_start sub_02064F08
sub_02064F08: ; 0x02064F08
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r1, #0
	bl sub_0205064C
	ldr r0, [r5]
	bl sub_02050650
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02064B54
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02064F08

	thumb_func_start sub_02064F24
sub_02064F24: ; 0x02064F24
	mov r0, #0
	bx lr
	thumb_func_end sub_02064F24

	thumb_func_start sub_02064F28
sub_02064F28: ; 0x02064F28
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl sub_0205064C
	add r5, r0, #0
	ldr r0, [r4]
	bl sub_02050650
	add r4, r0, #0
	ldr r1, [r5, #0xc]
	add r0, r5, #0
	mov r2, #0xb
	bl sub_0203F53C
	mov r1, #0xe
	lsl r1, r1, #6
	str r0, [r4, r1]
	ldr r1, _02064F58 ; =sub_0203D718
	add r0, r4, #0
	bl sub_0203C8F0
	pop {r3, r4, r5, pc}
	nop
_02064F58: .word sub_0203D718
	thumb_func_end sub_02064F28

	thumb_func_start sub_02064F5C
sub_02064F5C: ; 0x02064F5C
	push {r3, lr}
	ldr r1, _02064F6C ; =sub_02064F70
	mov r2, #0
	bl sub_020658B8
	mov r0, #1
	pop {r3, pc}
	nop
_02064F6C: .word sub_02064F70
	thumb_func_end sub_02064F5C

	thumb_func_start sub_02064F70
sub_02064F70: ; 0x02064F70
	ldr r3, _02064F78 ; =sub_0203F53C
	ldr r1, [r0, #0xc]
	mov r2, #0xb
	bx r3
	.balign 4, 0
_02064F78: .word sub_0203F53C
	thumb_func_end sub_02064F70

	thumb_func_start sub_02064F7C
sub_02064F7C: ; 0x02064F7C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5]
	bl sub_0205064C
	add r6, r0, #0
	ldr r0, [r5]
	bl sub_02050650
	add r4, r0, #0
	add r0, r6, #0
	bl sub_020505C0
	bl ov01_021FC30C
	str r0, [sp]
	ldr r1, [sp]
	mov r0, #0xb
	bl AllocFromHeapAtEnd
	ldr r2, [sp]
	mov r1, #0
	add r7, r0, #0
	bl memset
	mov r0, #0xd5
	ldr r1, _02064FD0 ; =0x021FC311
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, #0x2c
	str r7, [r4, r0]
	mov r0, #0xc
	strh r0, [r4, #0x26]
	ldr r0, [r6, #0xc]
	bl Sav2_Bag_get
	ldrh r1, [r5, #4]
	mov r2, #1
	mov r3, #0xb
	bl Bag_TakeItem
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02064FD0: .word 0x021FC311
	thumb_func_end sub_02064F7C

	thumb_func_start sub_02064FD4
sub_02064FD4: ; 0x02064FD4
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl sub_0205064C
	add r5, r0, #0
	ldr r0, [r4]
	bl sub_02050650
	add r4, r0, #0
	add r0, r5, #0
	bl sub_020505C0
	mov r0, #0xd5
	ldr r1, _0206500C ; =0x021FC699
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, r5, #0
	mov r1, #0xb
	mov r2, #0
	bl ov01_021FC66C
	mov r1, #0xe
	lsl r1, r1, #6
	str r0, [r4, r1]
	mov r0, #0xc
	strh r0, [r4, #0x26]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0206500C: .word 0x021FC699
	thumb_func_end sub_02064FD4

	thumb_func_start sub_02065010
sub_02065010: ; 0x02065010
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	mov r1, #4
	mov r2, #0
	bl ov01_021FC66C
	add r2, r0, #0
	ldr r0, [r4]
	ldr r1, _0206502C ; =0x021FC699
	bl sub_020504F0
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_0206502C: .word 0x021FC699
	thumb_func_end sub_02065010

	thumb_func_start sub_02065030
sub_02065030: ; 0x02065030
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl sub_0205064C
	add r5, r0, #0
	ldr r0, [r4]
	bl sub_02050650
	add r4, r0, #0
	add r0, r5, #0
	bl sub_020505C0
	mov r0, #0xd5
	ldr r1, _02065068 ; =0x021FC699
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, r5, #0
	mov r1, #0xb
	mov r2, #1
	bl ov01_021FC66C
	mov r1, #0xe
	lsl r1, r1, #6
	str r0, [r4, r1]
	mov r0, #0xc
	strh r0, [r4, #0x26]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02065068: .word 0x021FC699
	thumb_func_end sub_02065030

	thumb_func_start sub_0206506C
sub_0206506C: ; 0x0206506C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	mov r1, #4
	mov r2, #1
	bl ov01_021FC66C
	add r2, r0, #0
	ldr r0, [r4]
	ldr r1, _02065088 ; =0x021FC699
	bl sub_020504F0
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_02065088: .word 0x021FC699
	thumb_func_end sub_0206506C

	thumb_func_start sub_0206508C
sub_0206508C: ; 0x0206508C
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl sub_0205064C
	add r5, r0, #0
	ldr r0, [r4]
	bl sub_02050650
	add r4, r0, #0
	add r0, r5, #0
	bl sub_020505C0
	mov r0, #0xd5
	ldr r1, _020650C4 ; =0x021FC699
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, r5, #0
	mov r1, #0xb
	mov r2, #2
	bl ov01_021FC66C
	mov r1, #0xe
	lsl r1, r1, #6
	str r0, [r4, r1]
	mov r0, #0xc
	strh r0, [r4, #0x26]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_020650C4: .word 0x021FC699
	thumb_func_end sub_0206508C

	thumb_func_start sub_020650C8
sub_020650C8: ; 0x020650C8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	mov r1, #4
	mov r2, #2
	bl ov01_021FC66C
	add r2, r0, #0
	ldr r0, [r4]
	ldr r1, _020650E4 ; =0x021FC699
	bl sub_020504F0
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_020650E4: .word 0x021FC699
	thumb_func_end sub_020650C8

	thumb_func_start sub_020650E8
sub_020650E8: ; 0x020650E8
	push {r4, lr}
	add r4, r0, #0
	ldrh r0, [r4, #8]
	lsl r1, r0, #0x1f
	lsr r1, r1, #0x1f
	cmp r1, #1
	bne _020650FA
	mov r0, #2
	pop {r4, pc}
_020650FA:
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _02065106
	mov r0, #3
	pop {r4, pc}
_02065106:
	ldrh r0, [r4, #0xa]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B778
	cmp r0, #1
	bne _02065148
	ldrh r0, [r4, #0xc]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_0205BA30
	cmp r0, #1
	beq _02065130
	ldrh r0, [r4, #0xc]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_0205BA24
	cmp r0, #1
	bne _02065144
_02065130:
	ldr r0, [r4, #0x10]
	bl sub_0205C6DC
	bl sub_0205F83C
	cmp r0, #1
	bne _02065144
	mov r0, #0
	mvn r0, r0
	pop {r4, pc}
_02065144:
	mov r0, #0
	pop {r4, pc}
_02065148:
	mov r0, #0
	mvn r0, r0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020650E8

	thumb_func_start sub_02065150
sub_02065150: ; 0x02065150
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0xb
	mov r1, #0x18
	bl AllocFromHeap
	add r4, r0, #0
	mov r0, #0
	strh r0, [r4, #0x16]
	mov r0, #0x80
	mov r1, #0xb
	bl String_ctor
	str r0, [r4, #0x10]
	ldr r0, [r5]
	ldrh r2, [r5, #0x24]
	ldr r0, [r0, #0xc]
	ldr r1, [r4, #0x10]
	mov r3, #0xb
	bl TryFormatRegisteredKeyItemUseMessage
	ldr r0, [r5]
	ldr r1, _02065188 ; =sub_0206518C
	add r2, r4, #0
	bl sub_020504F0
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02065188: .word sub_0206518C
	thumb_func_end sub_02065150

	thumb_func_start sub_0206518C
sub_0206518C: ; 0x0206518C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_0205064C
	add r4, r0, #0
	add r0, r5, #0
	bl sub_02050650
	add r5, r0, #0
	ldrh r0, [r5, #0x16]
	cmp r0, #0
	beq _020651AE
	cmp r0, #1
	beq _020651F4
	cmp r0, #2
	beq _02065232
	b _0206524E
_020651AE:
	add r0, r4, #0
	add r0, #0xd2
	ldrb r1, [r0]
	mov r0, #0x40
	orr r1, r0
	add r0, r4, #0
	add r0, #0xd2
	strb r1, [r0]
	ldr r0, [r4, #0x3c]
	bl sub_0205F574
	ldr r0, [r4, #8]
	add r1, r5, #0
	mov r2, #3
	bl sub_0205B514
	ldr r0, [r4, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	add r4, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205B564
	ldr r1, [r5, #0x10]
	add r0, r5, #0
	add r2, r4, #0
	mov r3, #1
	bl sub_0205B5B4
	strh r0, [r5, #0x14]
	ldrh r0, [r5, #0x16]
	add r0, r0, #1
	strh r0, [r5, #0x16]
	b _0206524E
_020651F4:
	ldrh r0, [r5, #0x14]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B624
	cmp r0, #1
	bne _0206524E
	ldr r1, _02065254 ; =gMain
	mov r0, #0xf3
	ldr r2, [r1, #0x48]
	tst r0, r2
	bne _02065214
	ldr r1, [r1, #0x5c]
	mov r0, #1
	tst r0, r1
	beq _0206524E
_02065214:
	add r0, r4, #0
	add r0, #0xd2
	ldrb r1, [r0]
	mov r0, #0x40
	add r4, #0xd2
	bic r1, r0
	strb r1, [r4]
	add r0, r5, #0
	mov r1, #0
	bl ClearFrameAndWindow2
	ldrh r0, [r5, #0x16]
	add r0, r0, #1
	strh r0, [r5, #0x16]
	b _0206524E
_02065232:
	ldr r0, [r4, #0x3c]
	bl sub_0205F5A4
	add r0, r5, #0
	bl RemoveWindow
	ldr r0, [r5, #0x10]
	bl String_dtor
	add r0, r5, #0
	bl FreeToHeap
	mov r0, #1
	pop {r3, r4, r5, pc}
_0206524E:
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_02065254: .word gMain
	thumb_func_end sub_0206518C

	thumb_func_start sub_02065258
sub_02065258: ; 0x02065258
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, [r6]
	add r4, r1, #0
	bl sub_0205064C
	ldrh r1, [r6, #4]
	add r5, r0, #0
	cmp r1, #0x54
	bne _02065280
	bl sub_0206BD7C
	cmp r0, #0
	beq _02065280
	add r0, r6, #0
	add r1, r4, #0
	mov r2, #3
	bl sub_02064A8C
	pop {r3, r4, r5, r6, r7, pc}
_02065280:
	ldr r0, [r6]
	bl sub_02050650
	add r7, r0, #0
	mov r0, #0xb
	mov r1, #0x44
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x44
	add r4, r0, #0
	bl memset
	ldr r0, [r5, #0xc]
	bl SavArray_PlayerParty_get
	str r0, [r4]
	ldr r0, [r5, #0xc]
	bl Sav2_Bag_get
	str r0, [r4, #4]
	ldr r0, [r5, #0xc]
	bl Sav2_Mailbox_get
	str r0, [r4, #8]
	ldr r0, [r5, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [r4, #0xc]
	ldr r0, [r5, #0xc]
	bl sub_020270C4
	str r0, [r4, #0x10]
	mov r0, #0x37
	lsl r0, r0, #4
	add r0, r7, r0
	str r0, [r4, #0x18]
	add r0, r4, #0
	mov r1, #0
	add r0, #0x25
	strb r1, [r0]
	add r1, r4, #0
	mov r0, #0x10
	add r1, #0x24
	strb r0, [r1]
	ldrh r1, [r6, #4]
	add r0, #0xfc
	add r0, r5, r0
	strh r1, [r4, #0x28]
	add r1, r4, #0
	ldrb r2, [r6, #6]
	add r1, #0x26
	strb r2, [r1]
	str r5, [r4, #0x1c]
	str r0, [r4, #0x20]
	ldr r1, _02065308 ; =0x0210159C
	add r0, r5, #0
	add r2, r4, #0
	bl ScrUnk80_AddOvyMan
	mov r0, #0xe
	lsl r0, r0, #6
	str r4, [r7, r0]
	ldr r1, _0206530C ; =sub_0203CA9C
	add r0, r7, #0
	bl sub_0203C8F0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02065308: .word 0x0210159C
_0206530C: .word sub_0203CA9C
	thumb_func_end sub_02065258

	thumb_func_start sub_02065310
sub_02065310: ; 0x02065310
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0x14]
	bl sub_0206BD10
	cmp r0, #0
	beq _0206532C
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #3
	bl sub_02064A8C
	pop {r4, r5, r6, pc}
_0206532C:
	ldr r0, [r5]
	bl sub_0205064C
	add r6, r0, #0
	ldr r0, [r5]
	bl sub_02050650
	add r4, r0, #0
	add r0, r6, #0
	bl sub_020505C0
	mov r0, #0xd5
	ldr r1, _02065368 ; =sub_020653B8
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r1, #0
	add r0, #0x2c
	str r1, [r4, r0]
	mov r0, #0xc
	strh r0, [r4, #0x26]
	ldr r0, [r6, #0xc]
	bl Sav2_Bag_get
	ldrh r1, [r5, #4]
	mov r2, #1
	mov r3, #0xb
	bl Bag_TakeItem
	pop {r4, r5, r6, pc}
	nop
_02065368: .word sub_020653B8
	thumb_func_end sub_02065310

	thumb_func_start sub_0206536C
sub_0206536C: ; 0x0206536C
	push {r4, lr}
	add r4, r0, #0
	ldrh r0, [r4, #8]
	lsl r1, r0, #0x1f
	lsr r1, r1, #0x1f
	cmp r1, #1
	bne _0206537E
	mov r0, #2
	pop {r4, pc}
_0206537E:
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _0206538A
	mov r0, #3
	pop {r4, pc}
_0206538A:
	ldr r0, [r4, #0x14]
	bl sub_0206BD10
	cmp r0, #0
	beq _02065398
	mov r0, #0
	pop {r4, pc}
_02065398:
	ldr r0, [r4]
	bl MapHeader_IsCave
	cmp r0, #1
	bne _020653B0
	ldr r0, [r4]
	bl MapHeader_IsEscapeRopeAllowed
	cmp r0, #1
	bne _020653B0
	mov r0, #0
	pop {r4, pc}
_020653B0:
	mov r0, #0
	mvn r0, r0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0206536C

	thumb_func_start sub_020653B8
sub_020653B8: ; 0x020653B8
	push {r4, lr}
	add r4, r0, #0
	bl sub_0205064C
	mov r1, #0xb
	bl ov02_0224BFD8
	add r2, r0, #0
	ldr r1, _020653D4 ; =0x0224C021
	add r0, r4, #0
	bl sub_02050510
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_020653D4: .word 0x0224C021
	thumb_func_end sub_020653B8

	thumb_func_start sub_020653D8
sub_020653D8: ; 0x020653D8
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl sub_0205064C
	add r5, r0, #0
	ldr r0, [r4]
	bl sub_02050650
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #1
	bl sub_0203ED24
	mov r1, #0xe
	lsl r1, r1, #6
	str r0, [r4, r1]
	ldr r1, _02065404 ; =sub_0203D718
	add r0, r4, #0
	bl sub_0203C8F0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02065404: .word sub_0203D718
	thumb_func_end sub_020653D8

	thumb_func_start sub_02065408
sub_02065408: ; 0x02065408
	push {r3, lr}
	ldr r1, _02065418 ; =sub_0206541C
	mov r2, #0
	bl sub_020658B8
	mov r0, #1
	pop {r3, pc}
	nop
_02065418: .word sub_0206541C
	thumb_func_end sub_02065408

	thumb_func_start sub_0206541C
sub_0206541C: ; 0x0206541C
	ldr r3, _02065424 ; =sub_0203ED24
	mov r1, #1
	bx r3
	nop
_02065424: .word sub_0203ED24
	thumb_func_end sub_0206541C

	thumb_func_start sub_02065428
sub_02065428: ; 0x02065428
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl sub_0205064C
	add r5, r0, #0
	ldr r0, [r4]
	bl sub_02050650
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0203ECC0
	mov r1, #0xe
	lsl r1, r1, #6
	str r0, [r4, r1]
	ldr r1, _02065454 ; =sub_0203D718
	add r0, r4, #0
	bl sub_0203C8F0
	pop {r3, r4, r5, pc}
	nop
_02065454: .word sub_0203D718
	thumb_func_end sub_02065428

	thumb_func_start sub_02065458
sub_02065458: ; 0x02065458
	push {r3, lr}
	ldr r1, _02065468 ; =sub_0206546C
	mov r2, #0
	bl sub_020658B8
	mov r0, #1
	pop {r3, pc}
	nop
_02065468: .word sub_0206546C
	thumb_func_end sub_02065458

	thumb_func_start sub_0206546C
sub_0206546C: ; 0x0206546C
	ldr r3, _02065470 ; =sub_0203ECC0
	bx r3
	.balign 4, 0
_02065470: .word sub_0203ECC0
	thumb_func_end sub_0206546C

	thumb_func_start sub_02065474
sub_02065474: ; 0x02065474
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl sub_0205064C
	add r5, r0, #0
	ldr r0, [r4]
	bl sub_02050650
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0203EC64
	mov r1, #0xe
	lsl r1, r1, #6
	str r0, [r4, r1]
	ldr r1, _020654A0 ; =sub_0203D718
	add r0, r4, #0
	bl sub_0203C8F0
	pop {r3, r4, r5, pc}
	nop
_020654A0: .word sub_0203D718
	thumb_func_end sub_02065474

	thumb_func_start sub_020654A4
sub_020654A4: ; 0x020654A4
	push {r3, lr}
	ldr r1, _020654B4 ; =sub_020654B8
	mov r2, #0
	bl sub_020658B8
	mov r0, #1
	pop {r3, pc}
	nop
_020654B4: .word sub_020654B8
	thumb_func_end sub_020654A4

	thumb_func_start sub_020654B8
sub_020654B8: ; 0x020654B8
	ldr r3, _020654BC ; =sub_0203EC64
	bx r3
	.balign 4, 0
_020654BC: .word sub_0203EC64
	thumb_func_end sub_020654B8

	thumb_func_start sub_020654C0
sub_020654C0: ; 0x020654C0
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl sub_0205064C
	add r5, r0, #0
	ldr r0, [r4]
	bl sub_02050650
	add r4, r0, #0
	add r0, r5, #0
	bl sub_020505C0
	mov r0, #0xd5
	ldr r1, _020654F0 ; =sub_02065508
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r1, #0
	add r0, #0x2c
	str r1, [r4, r0]
	mov r0, #0xc
	strh r0, [r4, #0x26]
	pop {r3, r4, r5, pc}
	nop
_020654F0: .word sub_02065508
	thumb_func_end sub_020654C0

	thumb_func_start sub_020654F4
sub_020654F4: ; 0x020654F4
	push {r3, lr}
	ldr r0, [r0]
	ldr r1, _02065504 ; =sub_02065508
	mov r2, #0
	bl sub_020504F0
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_02065504: .word sub_02065508
	thumb_func_end sub_020654F4

	thumb_func_start sub_02065508
sub_02065508: ; 0x02065508
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl sub_0205064C
	add r5, r0, #0
	add r0, r4, #0
	bl sub_02050654
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _02065526
	cmp r0, #1
	beq _02065546
	b _0206555A
_02065526:
	add r0, r5, #0
	mov r1, #4
	mov r2, #0
	bl ov01_021F6A9C
	add r0, r5, #0
	add r0, #0xd2
	ldrb r1, [r0]
	mov r0, #0x80
	add r5, #0xd2
	orr r0, r1
	strb r0, [r5]
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0206555A
_02065546:
	add r0, r5, #0
	bl ov01_021F6B10
	cmp r0, #1
	bne _0206555A
	ldr r0, [r5, #0x3c]
	bl sub_0205F5A4
	mov r0, #1
	pop {r3, r4, r5, pc}
_0206555A:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02065508

	thumb_func_start sub_02065560
sub_02065560: ; 0x02065560
	push {r4, r5, r6, lr}
	add r6, r0, #0
	mov r0, #0xb
	mov r1, #0x18
	bl AllocFromHeap
	add r4, r0, #0
	mov r0, #0
	mov r1, #0x1b
	mov r2, #0xa
	mov r3, #0xb
	strh r0, [r4, #0x16]
	bl NewMsgDataFromNarc
	add r5, r0, #0
	bl sub_02005C18
	cmp r0, #1
	bne _02065590
	add r0, r5, #0
	mov r1, #0x69
	bl NewString_ReadMsgData
	b _02065598
_02065590:
	add r0, r5, #0
	mov r1, #0x68
	bl NewString_ReadMsgData
_02065598:
	str r0, [r4, #0x10]
	add r0, r5, #0
	bl DestroyMsgData
	bl sub_02005C24
	ldr r0, [r6]
	ldr r1, _020655B4 ; =sub_0206518C
	add r2, r4, #0
	bl sub_020504F0
	mov r0, #0
	pop {r4, r5, r6, pc}
	nop
_020655B4: .word sub_0206518C
	thumb_func_end sub_02065560

	thumb_func_start sub_020655B8
sub_020655B8: ; 0x020655B8
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl sub_0205064C
	add r5, r0, #0
	ldr r0, [r4]
	bl sub_02050650
	add r4, r0, #0
	ldr r2, _020655E8 ; =0x000001D2
	add r0, r5, #0
	mov r1, #0xb
	bl sub_0203FAE8
	mov r1, #0xe
	lsl r1, r1, #6
	str r0, [r4, r1]
	ldr r1, _020655EC ; =sub_0203CA9C
	add r0, r4, #0
	bl sub_0203C8F0
	pop {r3, r4, r5, pc}
	nop
_020655E8: .word 0x000001D2
_020655EC: .word sub_0203CA9C
	thumb_func_end sub_020655B8

	thumb_func_start sub_020655F0
sub_020655F0: ; 0x020655F0
	push {r3, lr}
	ldr r1, _02065600 ; =sub_02065604
	mov r2, #0
	bl sub_020658B8
	mov r0, #1
	pop {r3, pc}
	nop
_02065600: .word sub_02065604
	thumb_func_end sub_020655F0

	thumb_func_start sub_02065604
sub_02065604: ; 0x02065604
	ldr r3, _0206560C ; =sub_0203FAE8
	mov r1, #0xb
	ldr r2, _02065610 ; =0x000001D2
	bx r3
	.balign 4, 0
_0206560C: .word sub_0203FAE8
_02065610: .word 0x000001D2
	thumb_func_end sub_02065604

	thumb_func_start sub_02065614
sub_02065614: ; 0x02065614
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl sub_0205064C
	add r5, r0, #0
	ldr r0, [r4]
	bl sub_02050650
	add r4, r0, #0
	ldr r1, [r5, #0xc]
	add r0, r5, #0
	bl sub_0203F570
	mov r0, #0xe
	mov r1, #0
	lsl r0, r0, #6
	str r1, [r4, r0]
	ldr r1, _02065644 ; =sub_0203D9B4
	add r0, r4, #0
	bl sub_0203C8F0
	pop {r3, r4, r5, pc}
	nop
_02065644: .word sub_0203D9B4
	thumb_func_end sub_02065614

	thumb_func_start sub_02065648
sub_02065648: ; 0x02065648
	push {r3, lr}
	ldr r1, _02065658 ; =sub_0206565C
	mov r2, #0
	bl sub_020658B8
	mov r0, #1
	pop {r3, pc}
	nop
_02065658: .word sub_0206565C
	thumb_func_end sub_02065648

	thumb_func_start sub_0206565C
sub_0206565C: ; 0x0206565C
	push {r4, lr}
	add r4, r0, #0
	bl ov01_021F4440
	ldr r1, [r4, #0xc]
	add r0, r4, #0
	bl sub_0203F570
	mov r0, #0
	pop {r4, pc}
	thumb_func_end sub_0206565C

	thumb_func_start sub_02065670
sub_02065670: ; 0x02065670
	ldr r3, _0206568C ; =0x0210FAD8
	mov r2, #0
_02065674:
	ldrh r0, [r3]
	cmp r1, r0
	bne _0206567E
	mov r0, #0
	bx lr
_0206567E:
	add r2, r2, #1
	add r3, r3, #2
	cmp r2, #8
	blo _02065674
	mov r0, #1
	bx lr
	nop
_0206568C: .word 0x0210FAD8
	thumb_func_end sub_02065670

	thumb_func_start sub_02065690
sub_02065690: ; 0x02065690
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #1
	beq _020656A2
	cmp r4, #2
	beq _020656A2
	bl GF_AssertFail
_020656A2:
	add r0, r5, #0
	bl sub_02067584
	cmp r0, #1
	bne _020656B0
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_020656B0:
	ldr r0, [r5, #0xc]
	bl SavArray_Flags_get
	bl sub_020668A0
	cmp r0, #1
	bne _020656C2
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_020656C2:
	ldr r0, [r5, #0xc]
	bl SavArray_Flags_get
	bl sub_02066870
	cmp r0, #1
	bne _020656D4
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_020656D4:
	add r0, r5, #0
	bl ov01_021F6B10
	cmp r0, #1
	beq _020656E2
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_020656E2:
	cmp r4, #1
	ldr r0, [r5, #0xc]
	bne _020656F2
	bl Sav2_Bag_get
	bl Bag_GetRegisteredItemSlot1
	b _020656FA
_020656F2:
	bl Sav2_Bag_get
	bl Bag_GetRegisteredItemSlot2
_020656FA:
	add r6, r0, #0
	ldr r0, _020657A0 ; =0x000001D7
	cmp r6, r0
	bne _02065710
	add r0, r5, #0
	bl ov01_021F6B00
	cmp r0, #4
	bne _02065710
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02065710:
	add r0, r6, #0
	mov r1, #6
	mov r2, #0xb
	bl GetItemAttr
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	mov r0, #2
	add r1, r4, #0
	bl sub_02064980
	add r7, r0, #0
	mov r0, #1
	add r1, r4, #0
	bl sub_02064980
	str r0, [sp]
	cmp r0, #0
	bne _0206573A
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0206573A:
	mov r0, #0xb
	mov r1, #0x28
	bl AllocFromHeap
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x28
	bl memset
	str r5, [r4]
	add r0, r5, #0
	add r1, r4, #4
	strh r6, [r4, #0x24]
	bl sub_020649B8
	mov r6, #0
	cmp r7, #0
	bne _02065768
	ldr r1, [sp]
	add r0, r4, #0
	blx r1
	add r6, r0, #0
	b _02065780
_02065768:
	add r0, r4, #4
	blx r7
	add r1, r0, #0
	bne _0206577A
	ldr r1, [sp]
	add r0, r4, #0
	blx r1
	add r6, r0, #0
	b _02065780
_0206577A:
	add r0, r4, #0
	bl sub_020657A4
_02065780:
	cmp r6, #0
	bne _0206578C
	add r0, r4, #0
	bl FreeToHeap
	b _0206579C
_0206578C:
	ldrh r1, [r4, #0x24]
	add r0, r5, #0
	bl sub_02065670
	cmp r0, #0
	beq _0206579C
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0206579C:
	mov r0, #2
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_020657A0: .word 0x000001D7
	thumb_func_end sub_02065690

	thumb_func_start sub_020657A4
sub_020657A4: ; 0x020657A4
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #0xb
	mov r1, #0x18
	bl AllocFromHeap
	add r4, r0, #0
	mov r0, #0
	strh r0, [r4, #0x16]
	mov r0, #0x80
	mov r1, #0xb
	bl String_ctor
	str r0, [r4, #0x10]
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	mov r1, #0xb
	str r1, [sp]
	ldrh r2, [r5, #0x24]
	ldr r1, [r4, #0x10]
	add r3, r6, #0
	bl GetItemUseErrorMessage
	ldr r0, [r5]
	ldr r1, _020657E8 ; =sub_0206518C
	add r2, r4, #0
	bl sub_020504F0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_020657E8: .word sub_0206518C
	thumb_func_end sub_020657A4

	thumb_func_start sub_020657EC
sub_020657EC: ; 0x020657EC
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl sub_0205064C
	add r5, r0, #0
	add r0, r4, #0
	bl sub_02050650
	add r4, r0, #0
	add r0, #0x26
	ldrb r0, [r0]
	cmp r0, #5
	bhi _020658B4
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02065812: ; jump table
	.short _0206581E - _02065812 - 2 ; case 0
	.short _02065832 - _02065812 - 2 ; case 1
	.short _0206585C - _02065812 - 2 ; case 2
	.short _02065866 - _02065812 - 2 ; case 3
	.short _0206587E - _02065812 - 2 ; case 4
	.short _0206589C - _02065812 - 2 ; case 5
_0206581E:
	ldr r0, [r5, #0x3c]
	bl sub_0205F574
	mov r0, #0
	bl ov01_021E636C
	mov r0, #1
	add r4, #0x26
	strb r0, [r4]
	b _020658B4
_02065832:
	bl sub_0200FB5C
	cmp r0, #0
	beq _020658B4
	ldr r1, [r4, #0x1c]
	add r0, r5, #0
	blx r1
	str r0, [r4, #0x20]
	add r0, r4, #0
	add r0, #0x27
	ldrb r0, [r0]
	cmp r0, #0
	bne _02065854
	mov r0, #2
	add r4, #0x26
	strb r0, [r4]
	b _020658B4
_02065854:
	mov r0, #3
	add r4, #0x26
	strb r0, [r4]
	b _020658B4
_0206585C:
	add r0, r5, #0
	bl sub_020505A0
	cmp r0, #0
	bne _020658B4
_02065866:
	ldr r0, [r4, #0x20]
	cmp r0, #0
	beq _02065870
	bl FreeToHeap
_02065870:
	add r0, r5, #0
	bl sub_020505C0
	mov r0, #4
	add r4, #0x26
	strb r0, [r4]
	b _020658B4
_0206587E:
	add r0, r5, #0
	bl sub_020505C8
	cmp r0, #0
	beq _020658B4
	ldr r0, [r5, #0x3c]
	bl sub_0205F574
	mov r0, #1
	bl ov01_021E636C
	mov r0, #5
	add r4, #0x26
	strb r0, [r4]
	b _020658B4
_0206589C:
	bl sub_0200FB5C
	cmp r0, #0
	beq _020658B4
	ldr r0, [r5, #0x3c]
	bl sub_0205F5A4
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #1
	pop {r3, r4, r5, pc}
_020658B4:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_020657EC

	thumb_func_start sub_020658B8
sub_020658B8: ; 0x020658B8
	add r3, r0, #0
	str r1, [r3, #0x1c]
	add r0, #0x27
	strb r2, [r0]
	ldr r0, [r3]
	add r2, r3, #0
	ldr r3, _020658CC ; =sub_020504F0
	ldr r1, _020658D0 ; =sub_020657EC
	bx r3
	nop
_020658CC: .word sub_020504F0
_020658D0: .word sub_020657EC
	thumb_func_end sub_020658B8

	thumb_func_start sub_020658D4
sub_020658D4: ; 0x020658D4
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0xc
	bl sub_0205F370
	add r1, r0, #0
	add r0, r4, #0
	bl sub_02065CD0
	add r0, r4, #0
	mov r1, #0
	bl sub_0205F328
	add r0, r4, #0
	bl sub_0205F63C
	add r0, r4, #0
	mov r1, #0
	bl sub_0205F6AC
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020658D4

	thumb_func_start sub_02065900
sub_02065900: ; 0x02065900
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl sub_0205F394
	add r4, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02065CD0
	cmp r0, #0
	beq _02065930
	add r0, r5, #0
	mov r1, #0
	bl sub_0205F6AC
	ldr r6, _02065934 ; =_020FE404
_02065920:
	ldrb r2, [r4]
	add r0, r5, #0
	add r1, r4, #0
	lsl r2, r2, #2
	ldr r2, [r6, r2]
	blx r2
	cmp r0, #1
	beq _02065920
_02065930:
	pop {r4, r5, r6, pc}
	nop
_02065934: .word _020FE404
	thumb_func_end sub_02065900

	thumb_func_start sub_02065938
sub_02065938: ; 0x02065938
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl sub_0205F394
	add r4, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02065CD0
	cmp r0, #0
	beq _02065960
	ldr r6, _02065964 ; =_020FE414
_02065950:
	ldrb r2, [r4]
	add r0, r5, #0
	add r1, r4, #0
	lsl r2, r2, #2
	ldr r2, [r6, r2]
	blx r2
	cmp r0, #1
	beq _02065950
_02065960:
	pop {r4, r5, r6, pc}
	nop
_02065964: .word _020FE414
	thumb_func_end sub_02065938

	thumb_func_start sub_02065968
sub_02065968: ; 0x02065968
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl sub_0205F394
	add r4, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02065CD0
	cmp r0, #0
	beq _02065990
	ldr r6, _02065994 ; =_020FE424
_02065980:
	ldrb r2, [r4]
	add r0, r5, #0
	add r1, r4, #0
	lsl r2, r2, #2
	ldr r2, [r6, r2]
	blx r2
	cmp r0, #1
	beq _02065980
_02065990:
	pop {r4, r5, r6, pc}
	nop
_02065994: .word _020FE424
	thumb_func_end sub_02065968

	thumb_func_start sub_02065998
sub_02065998: ; 0x02065998
	bx lr
	.balign 4, 0
	thumb_func_end sub_02065998

	thumb_func_start sub_0206599C
sub_0206599C: ; 0x0206599C
	push {r3, lr}
	bl sub_0205F394
	ldrb r0, [r0, #3]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0206599C

	thumb_func_start sub_020659A8
sub_020659A8: ; 0x020659A8
	push {r3, lr}
	bl sub_0205F394
	ldrh r0, [r0, #0xa]
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1e
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_020659A8

	thumb_func_start sub_020659B8
sub_020659B8: ; 0x020659B8
	push {r3, lr}
	bl sub_0205F394
	ldrh r2, [r0, #0xa]
	mov r1, #1
	bic r2, r1
	mov r1, #1
	orr r1, r2
	strh r1, [r0, #0xa]
	pop {r3, pc}
	thumb_func_end sub_020659B8

	thumb_func_start sub_020659CC
sub_020659CC: ; 0x020659CC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl sub_0205F52C
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0205F394
	add r6, r0, #0
	add r0, r5, #0
	bl sub_0205F63C
	add r0, r5, #0
	bl sub_0205F660
	add r0, r5, #0
	mov r1, #0x20
	bl sub_0205F214
	add r0, r5, #0
	mov r1, #0xff
	bl sub_0205F4CC
	add r0, r5, #0
	mov r1, #0
	bl sub_0205F4DC
	mov r1, #0
	add r0, r4, #0
	strb r1, [r6]
	add r0, #0xe8
	str r1, [r0]
	mov r0, #1
	lsl r0, r0, #8
	str r1, [r4, r0]
	add r0, r4, #0
	add r0, #0xec
	str r1, [r0]
	add r4, #0xf0
	add r0, r5, #0
	str r1, [r4]
	bl sub_0205F914
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0205F924
	add r6, r0, #0
	add r0, r5, #0
	bl sub_0205F934
	add r7, r0, #0
	add r0, r5, #0
	bl sub_0205F2A8
	str r0, [sp]
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	add r3, r7, #0
	bl sub_0205FC2C
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_020659CC

	thumb_func_start sub_02065A4C
sub_02065A4C: ; 0x02065A4C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r1, #0
	bl sub_0205F52C
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0205F63C
	add r0, r5, #0
	bl sub_0205F660
	mov r0, #1
	lsl r0, r0, #8
	ldr r1, [r4, r0]
	cmp r1, #1
	bne _02065A76
	mov r1, #2
	str r1, [r4, r0]
	mov r0, #0
	pop {r4, r5, r6, pc}
_02065A76:
	cmp r1, #2
	bne _02065B64
	add r0, r5, #0
	add r1, r6, #0
	bl sub_02065D58
	add r0, r5, #0
	bl sub_0205F914
	add r1, r4, #0
	add r1, #0xec
	ldr r1, [r1]
	cmp r1, r0
	bne _02065B12
	add r0, r5, #0
	bl sub_0205F934
	add r1, r4, #0
	add r1, #0xf0
	ldr r1, [r1]
	cmp r1, r0
	bne _02065B12
	mov r0, #1
	mov r1, #0
	lsl r0, r0, #8
	str r1, [r4, r0]
	mov r0, #3
	strb r0, [r6]
	add r0, r5, #0
	bl sub_02069E14
	cmp r0, #0
	beq _02065AEA
	ldrh r0, [r6, #0xa]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	bne _02065AEA
	add r0, r5, #0
	bl sub_02069EAC
	cmp r0, #0
	beq _02065ADC
	add r0, r5, #0
	mov r1, #0
	bl ov01_0220329C
	add r0, r5, #0
	mov r1, #0
	bl sub_02069E84
	b _02065AE4
_02065ADC:
	add r0, r5, #0
	mov r1, #0
	bl sub_02069DC8
_02065AE4:
	add r0, r5, #0
	bl sub_020664D8
_02065AEA:
	add r0, r5, #0
	bl sub_02065D78
	bl sub_020623C8
	cmp r0, #0
	beq _02065B0E
	add r0, r4, #0
	bl sub_0205CA1C
	bl sub_0205C654
	add r1, r0, #0
	lsl r1, r1, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl sub_02069E28
_02065B0E:
	mov r0, #1
	pop {r4, r5, r6, pc}
_02065B12:
	add r0, r5, #0
	add r1, r6, #0
	bl sub_02065DF4
	cmp r0, #1
	bne _02065B6C
	add r0, r5, #0
	bl sub_02069E14
	cmp r0, #0
	beq _02065B52
	add r0, r5, #0
	bl sub_02069EAC
	cmp r0, #0
	beq _02065B44
	add r0, r5, #0
	mov r1, #0
	bl ov01_0220329C
	add r0, r5, #0
	mov r1, #0
	bl sub_02069E84
	b _02065B4C
_02065B44:
	add r0, r5, #0
	mov r1, #0
	bl sub_02069DC8
_02065B4C:
	add r0, r5, #0
	bl sub_020664D8
_02065B52:
	add r0, r5, #0
	bl sub_0205F630
	mov r1, #3
	add r0, r1, #0
	add r0, #0xfd
	str r1, [r4, r0]
	mov r0, #1
	pop {r4, r5, r6, pc}
_02065B64:
	cmp r1, #3
	bne _02065B6C
	mov r1, #0
	str r1, [r4, r0]
_02065B6C:
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02065A4C

	thumb_func_start sub_02065B70
sub_02065B70: ; 0x02065B70
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0205F63C
	add r0, r5, #0
	bl sub_0205F660
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02065D24
	cmp r0, #1
	bne _02065BE2
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02065D58
	add r0, r5, #0
	bl sub_02069E14
	cmp r0, #0
	beq _02065BC8
	add r0, r5, #0
	bl sub_02069EAC
	cmp r0, #0
	beq _02065BBA
	add r0, r5, #0
	mov r1, #0
	bl ov01_0220329C
	add r0, r5, #0
	mov r1, #0
	bl sub_02069E84
	b _02065BC2
_02065BBA:
	add r0, r5, #0
	mov r1, #0
	bl sub_02069DC8
_02065BC2:
	add r0, r5, #0
	bl sub_020664D8
_02065BC8:
	add r0, r5, #0
	bl sub_02065F44
	cmp r0, #1
	bne _02065BE2
	add r0, r5, #0
	bl sub_0205F630
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	mov r0, #1
	pop {r3, r4, r5, pc}
_02065BE2:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02065B70

	thumb_func_start sub_02065BE8
sub_02065BE8: ; 0x02065BE8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0205F63C
	add r0, r5, #0
	bl sub_0205F660
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02065D24
	cmp r0, #1
	bne _02065C26
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02065D58
	add r0, r5, #0
	bl sub_02065FBC
	cmp r0, #1
	bne _02065C26
	add r0, r5, #0
	bl sub_0205F630
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	mov r0, #1
	pop {r3, r4, r5, pc}
_02065C26:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02065BE8

	thumb_func_start sub_02065C2C
sub_02065C2C: ; 0x02065C2C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_02062428
	cmp r0, #1
	bne _02065C44
	add r0, r5, #0
	bl sub_0205F63C
	mov r0, #0
	strb r0, [r4]
_02065C44:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02065C2C

	thumb_func_start sub_02065C48
sub_02065C48: ; 0x02065C48
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_02062428
	cmp r0, #1
	bne _02065C86
	ldrb r0, [r4, #2]
	add r0, r0, #1
	strb r0, [r4, #2]
	ldrb r0, [r4, #2]
	cmp r0, #2
	blo _02065C78
	add r0, r5, #0
	bl sub_0205F63C
	mov r0, #0
	strb r0, [r4]
	strb r0, [r4, #3]
	ldrh r2, [r4, #0xa]
	mov r1, #6
	bic r2, r1
	strh r2, [r4, #0xa]
	pop {r3, r4, r5, pc}
_02065C78:
	add r0, r5, #0
	bl sub_02069ED4
	add r1, r0, #0
	add r0, r5, #0
	bl sub_0206217C
_02065C86:
	ldrb r0, [r4, #3]
	add r0, r0, #1
	strb r0, [r4, #3]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02065C48

	thumb_func_start sub_02065C90
sub_02065C90: ; 0x02065C90
	push {r4, r5, r6, lr}
	add r5, r1, #0
	bl sub_0205F52C
	bl sub_0205CA1C
	add r4, r0, #0
	bl sub_0205C6DC
	mov r1, #0x10
	add r6, r0, #0
	bl sub_0205F228
	cmp r0, #1
	bne _02065CBE
	add r0, r6, #0
	mov r1, #0x20
	bl sub_0205F228
	cmp r0, #1
	bne _02065CBE
	mov r0, #0
	strb r0, [r5]
_02065CBE:
	add r0, r4, #0
	bl sub_0205C6D4
	cmp r0, #3
	bne _02065CCC
	mov r0, #0
	strb r0, [r5]
_02065CCC:
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02065C90

	thumb_func_start sub_02065CD0
sub_02065CD0: ; 0x02065CD0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0205F35C
	bl sub_0205C600
	cmp r0, #0
	bne _02065CE8
	mov r0, #0
	strb r0, [r4, #1]
	pop {r3, r4, r5, pc}
_02065CE8:
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _02065CF6
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02065CFC
_02065CF6:
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02065CD0

	thumb_func_start sub_02065CFC
sub_02065CFC: ; 0x02065CFC
	push {r3, r4, r5, lr}
	add r5, r1, #0
	bl sub_0205F52C
	bl sub_0205CA1C
	mov r1, #1
	add r4, r0, #0
	strb r1, [r5, #1]
	bl sub_0205C67C
	strh r0, [r5, #4]
	add r0, r4, #0
	bl sub_0205C688
	strh r0, [r5, #6]
	mov r0, #0xff
	strh r0, [r5, #8]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02065CFC

	thumb_func_start sub_02065D24
sub_02065D24: ; 0x02065D24
	push {r4, r5, r6, lr}
	add r5, r1, #0
	bl sub_0205F52C
	bl sub_0205CA1C
	add r6, r0, #0
	beq _02065D54
	bl sub_0205C67C
	add r4, r0, #0
	add r0, r6, #0
	bl sub_0205C688
	mov r1, #4
	ldrsh r1, [r5, r1]
	cmp r4, r1
	bne _02065D50
	mov r1, #6
	ldrsh r1, [r5, r1]
	cmp r0, r1
	beq _02065D54
_02065D50:
	mov r0, #1
	pop {r4, r5, r6, pc}
_02065D54:
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02065D24

	thumb_func_start sub_02065D58
sub_02065D58: ; 0x02065D58
	push {r3, r4, r5, lr}
	add r5, r1, #0
	bl sub_0205F52C
	bl sub_0205CA1C
	add r4, r0, #0
	bl sub_0205C67C
	strh r0, [r5, #4]
	add r0, r4, #0
	bl sub_0205C688
	strh r0, [r5, #6]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02065D58

	thumb_func_start sub_02065D78
sub_02065D78: ; 0x02065D78
	push {r4, lr}
	bl sub_0205F52C
	add r4, r0, #0
	bl sub_0205CA1C
	add r4, #0xe8
	ldr r0, [r4]
	add r1, r0, #0
	sub r1, #0x58
	cmp r1, #3
	bhi _02065DB2
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02065D9C: ; jump table
	.short _02065DA4 - _02065D9C - 2 ; case 0
	.short _02065DA8 - _02065D9C - 2 ; case 1
	.short _02065DAC - _02065D9C - 2 ; case 2
	.short _02065DB0 - _02065D9C - 2 ; case 3
_02065DA4:
	mov r0, #0x10
	pop {r4, pc}
_02065DA8:
	mov r0, #0x11
	pop {r4, pc}
_02065DAC:
	mov r0, #0x12
	pop {r4, pc}
_02065DB0:
	mov r0, #0x13
_02065DB2:
	pop {r4, pc}
	thumb_func_end sub_02065D78

	thumb_func_start sub_02065DB4
sub_02065DB4: ; 0x02065DB4
	push {r3, lr}
	bl sub_0205F52C
	bl sub_0205CA1C
	bl sub_0205C6DC
	bl sub_0205F4D4
	add r1, r0, #0
	sub r1, #0x58
	cmp r1, #3
	bhi _02065DF0
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02065DDA: ; jump table
	.short _02065DE2 - _02065DDA - 2 ; case 0
	.short _02065DE6 - _02065DDA - 2 ; case 1
	.short _02065DEA - _02065DDA - 2 ; case 2
	.short _02065DEE - _02065DDA - 2 ; case 3
_02065DE2:
	mov r0, #0x10
	pop {r3, pc}
_02065DE6:
	mov r0, #0x11
	pop {r3, pc}
_02065DEA:
	mov r0, #0x12
	pop {r3, pc}
_02065DEE:
	mov r0, #0x13
_02065DF0:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02065DB4

	thumb_func_start sub_02065DF4
sub_02065DF4: ; 0x02065DF4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0205F52C
	bl sub_0205CA1C
	add r7, r0, #0
	add r0, r5, #0
	bl sub_0205F914
	str r0, [sp, #8]
	add r0, r5, #0
	bl sub_0205F934
	str r0, [sp, #4]
	add r0, r7, #0
	bl sub_0205C694
	str r0, [sp]
	add r0, r7, #0
	bl sub_0205C6A0
	add r6, r0, #0
	ldr r1, [sp, #8]
	ldr r0, [sp]
	cmp r1, r0
	bne _02065E36
	ldr r0, [sp, #4]
	cmp r0, r6
	bne _02065E36
	b _02065F3C
_02065E36:
	add r0, r5, #0
	bl sub_02065D78
	str r0, [sp, #0x10]
	ldr r0, [sp, #8]
	ldr r1, [sp, #4]
	ldr r2, [sp]
	add r3, r6, #0
	bl sub_02061200
	str r0, [sp, #0x14]
	add r0, r5, #0
	bl sub_02069EC0
	add r6, r0, #0
	ldr r0, [sp, #0x10]
	bl sub_020623C8
	mov r1, #1
	str r1, [sp, #0xc]
	cmp r6, #0
	beq _02065F00
	cmp r0, #0
	beq _02065EB4
	add r0, r6, #0
	bl sub_020623D8
	add r1, r0, #0
	add r0, r6, #0
	bl ov01_0220542C
	add r6, r0, #0
	bl sub_02066444
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	lsl r0, r0, #0x1e
	ldrh r1, [r4, #0xa]
	mov r2, #6
	lsr r0, r0, #0x1d
	bic r1, r2
	orr r0, r1
	lsl r1, r6, #0x18
	strh r0, [r4, #0xa]
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl sub_02069E50
	mov r0, #2
	str r0, [sp, #0xc]
	mov r0, #0
	strb r0, [r4, #2]
	strb r0, [r4, #3]
	add r0, r7, #0
	bl sub_0205C654
	add r1, r0, #0
	lsl r1, r1, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl sub_02069E28
	b _02065F2A
_02065EB4:
	add r0, r7, #0
	bl sub_0205CB00
	cmp r0, #0
	bne _02065EC4
	add sp, #0x18
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02065EC4:
	ldr r1, [sp, #0x10]
	add r0, r6, #0
	bl ov01_0220542C
	add r6, r0, #0
	bl sub_02066444
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	lsl r0, r0, #0x1e
	ldrh r1, [r4, #0xa]
	mov r2, #6
	lsr r0, r0, #0x1d
	bic r1, r2
	orr r0, r1
	lsl r1, r6, #0x18
	strh r0, [r4, #0xa]
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl sub_02069E50
	mov r0, #2
	str r0, [sp, #0xc]
	mov r1, #0
	strb r1, [r4, #2]
	add r0, r5, #0
	strb r1, [r4, #3]
	bl sub_02069E28
	b _02065F2A
_02065F00:
	cmp r0, #0
	beq _02065F20
	ldr r0, [sp, #0x14]
	bl sub_020623D8
	add r6, r0, #0
	add r0, r7, #0
	bl sub_0205C654
	add r1, r0, #0
	lsl r1, r1, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl sub_02069E28
	b _02065F2A
_02065F20:
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x10]
	bl sub_0206234C
	add r6, r0, #0
_02065F2A:
	add r0, r5, #0
	add r1, r6, #0
	bl sub_0206217C
	ldr r0, [sp, #0xc]
	add sp, #0x18
	strb r0, [r4]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02065F3C:
	mov r0, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02065DF4

	thumb_func_start sub_02065F44
sub_02065F44: ; 0x02065F44
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	bl sub_0205F52C
	bl sub_0205CA1C
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0205F914
	str r0, [sp]
	add r0, r5, #0
	bl sub_0205F934
	add r7, r0, #0
	add r0, r4, #0
	bl sub_0205C694
	add r6, r0, #0
	add r0, r4, #0
	bl sub_0205C6A0
	add r4, r0, #0
	ldr r0, [sp]
	cmp r0, r6
	bne _02065F7E
	cmp r7, r4
	beq _02065FB4
_02065F7E:
	add r0, r5, #0
	bl sub_02065DB4
	str r0, [sp, #4]
	ldr r0, [sp]
	add r1, r7, #0
	add r2, r6, #0
	add r3, r4, #0
	bl sub_02061200
	ldr r1, [sp, #4]
	cmp r1, #0xff
	bne _02065FA2
	bl GF_AssertFail
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02065FA2:
	bl sub_0206234C
	add r1, r0, #0
	add r0, r5, #0
	bl sub_0206217C
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02065FB4:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02065F44

	thumb_func_start sub_02065FBC
sub_02065FBC: ; 0x02065FBC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_0205F52C
	bl sub_0205CA1C
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0205F914
	add r0, r5, #0
	bl sub_0205F934
	add r0, r4, #0
	bl sub_0205C694
	add r0, r4, #0
	bl sub_0205C6A0
	add r0, r5, #0
	bl sub_02065DB4
	add r1, r0, #0
	cmp r1, #0xff
	bne _02065FF2
	mov r0, #0
	pop {r3, r4, r5, pc}
_02065FF2:
	add r0, r5, #0
	bl sub_0206217C
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02065FBC

	thumb_func_start sub_02065FFC
sub_02065FFC: ; 0x02065FFC
	push {r3, r4, r5, lr}
	mov r1, #0xc
	add r5, r0, #0
	bl sub_0205F370
	add r4, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02066150
	add r0, r5, #0
	mov r1, #0
	bl sub_0205F328
	add r0, r5, #0
	bl sub_0205F63C
	mov r0, #0
	strb r0, [r4, #1]
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02065FFC

	thumb_func_start sub_02066024
sub_02066024: ; 0x02066024
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl sub_0205F394
	add r4, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02066150
	cmp r0, #0
	beq _0206604C
	ldr r6, _02066050 ; =_020FE3D4
_0206603C:
	ldrb r2, [r4]
	add r0, r5, #0
	add r1, r4, #0
	lsl r2, r2, #2
	ldr r2, [r6, r2]
	blx r2
	cmp r0, #1
	beq _0206603C
_0206604C:
	pop {r4, r5, r6, pc}
	nop
_02066050: .word _020FE3D4
	thumb_func_end sub_02066024

	thumb_func_start sub_02066054
sub_02066054: ; 0x02066054
	bx lr
	.balign 4, 0
	thumb_func_end sub_02066054

	thumb_func_start sub_02066058
sub_02066058: ; 0x02066058
	push {r3, lr}
	bl sub_0205F394
	mov r1, #0
	strb r1, [r0, #1]
	pop {r3, pc}
	thumb_func_end sub_02066058

	thumb_func_start sub_02066064
sub_02066064: ; 0x02066064
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0205F63C
	add r0, r5, #0
	bl sub_0205F660
	add r0, r5, #0
	add r1, r4, #0
	bl sub_020661F0
	cmp r0, #1
	bne _0206609C
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0206623C
	cmp r0, #1
	bne _0206609C
	add r0, r5, #0
	bl sub_0205F630
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	mov r0, #1
	pop {r3, r4, r5, pc}
_0206609C:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02066064

	thumb_func_start sub_020660A0
sub_020660A0: ; 0x020660A0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_02062428
	cmp r0, #0
	bne _020660B2
	mov r0, #0
	pop {r3, r4, r5, pc}
_020660B2:
	add r0, r5, #0
	bl sub_0205F63C
	mov r0, #0
	strb r0, [r4]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_020660A0

	thumb_func_start sub_020660C0
sub_020660C0: ; 0x020660C0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	mov r1, #0
	add r4, r0, #0
	str r1, [sp, #8]
	bl sub_0205F26C
	str r0, [sp]
	add r0, r4, #0
	bl sub_0205F254
	add r6, r0, #0
	add r0, r4, #0
	bl sub_02064518
	add r5, r0, #0
	add r0, r4, #0
	bl sub_0205F35C
	ldr r1, [sp]
	add r7, r0, #0
	cmp r1, #8
	bhi _02066148
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_020660FA: ; jump table
	.short _02066148 - _020660FA - 2 ; case 0
	.short _0206610C - _020660FA - 2 ; case 1
	.short _0206610C - _020660FA - 2 ; case 2
	.short _0206610C - _020660FA - 2 ; case 3
	.short _0206610C - _020660FA - 2 ; case 4
	.short _0206610C - _020660FA - 2 ; case 5
	.short _0206610C - _020660FA - 2 ; case 6
	.short _0206610C - _020660FA - 2 ; case 7
	.short _0206610C - _020660FA - 2 ; case 8
_0206610C:
	add r1, sp, #4
	add r2, sp, #8
	mov r3, #1
	bl sub_0205EEF4
	cmp r0, #1
	bne _02066148
_0206611A:
	ldr r0, [sp, #4]
	cmp r4, r0
	beq _02066138
	bl sub_0205F254
	cmp r6, r0
	bne _02066138
	ldr r0, [sp, #4]
	bl sub_02064518
	cmp r5, r0
	bne _02066138
	ldr r0, [sp, #4]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_02066138:
	add r0, r7, #0
	add r1, sp, #4
	add r2, sp, #8
	mov r3, #1
	bl sub_0205EEF4
	cmp r0, #1
	beq _0206611A
_02066148:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_020660C0

	thumb_func_start sub_02066150
sub_02066150: ; 0x02066150
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	str r1, [sp]
	bl sub_0205F35C
	add r4, r0, #0
	mov r0, #0
	str r0, [sp, #8]
	add r0, r5, #0
	bl sub_0205F254
	add r7, r0, #0
	add r0, r5, #0
	bl sub_02064518
	add r6, r0, #0
	add r0, r4, #0
	add r1, sp, #4
	add r2, sp, #8
	mov r3, #1
	bl sub_0205EEF4
	cmp r0, #1
	bne _020661C2
_02066182:
	ldr r0, [sp, #4]
	cmp r5, r0
	beq _020661B2
	bl sub_0205F254
	cmp r7, r0
	bne _020661B2
	ldr r0, [sp, #4]
	bl sub_02064518
	cmp r6, r0
	bne _020661B2
	ldr r0, [sp]
	ldrb r0, [r0, #1]
	cmp r0, #0
	bne _020661AC
	ldr r1, [sp]
	ldr r2, [sp, #4]
	add r0, r5, #0
	bl sub_020661CC
_020661AC:
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_020661B2:
	add r0, r4, #0
	add r1, sp, #4
	add r2, sp, #8
	mov r3, #1
	bl sub_0205EEF4
	cmp r0, #1
	beq _02066182
_020661C2:
	ldr r1, [sp]
	mov r0, #0
	strb r0, [r1, #1]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end sub_02066150

	thumb_func_start sub_020661CC
sub_020661CC: ; 0x020661CC
	push {r3, r4, r5, lr}
	add r5, r1, #0
	mov r0, #1
	add r4, r2, #0
	strb r0, [r5, #1]
	add r0, r4, #0
	bl sub_0205F914
	strh r0, [r5, #2]
	add r0, r4, #0
	bl sub_0205F934
	strh r0, [r5, #4]
	mov r0, #0xff
	strh r0, [r5, #6]
	str r4, [r5, #8]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_020661CC

	thumb_func_start sub_020661F0
sub_020661F0: ; 0x020661F0
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	ldr r5, [r1, #8]
	bl sub_0205F914
	add r6, r0, #0
	add r0, r4, #0
	bl sub_0205F934
	add r7, r0, #0
	add r0, r5, #0
	bl sub_0205F8FC
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0205F90C
	cmp r6, r4
	bne _0206621A
	cmp r7, r0
	beq _02066236
_0206621A:
	add r0, r5, #0
	bl sub_0205F648
	cmp r0, #1
	beq _02066232
	mov r1, #0x61
	add r0, r5, #0
	lsl r1, r1, #6
	bl sub_0205F220
	cmp r0, #0
	bne _02066236
_02066232:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02066236:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_020661F0

	thumb_func_start sub_0206623C
sub_0206623C: ; 0x0206623C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp]
	add r5, r1, #0
	bl sub_0205F914
	add r4, r0, #0
	ldr r0, [sp]
	bl sub_0205F934
	add r6, r0, #0
	ldr r0, [r5, #8]
	bl sub_0205F914
	str r0, [sp, #8]
	ldr r0, [r5, #8]
	bl sub_0205F934
	add r7, r0, #0
	ldr r0, [r5, #8]
	bl sub_0205F8FC
	str r0, [sp, #4]
	ldr r0, [r5, #8]
	bl sub_0205F90C
	add r3, r0, #0
	ldr r0, [sp, #8]
	cmp r4, r0
	bne _02066282
	cmp r6, r7
	bne _02066282
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_02066282:
	ldr r2, [sp, #4]
	add r0, r4, #0
	add r1, r6, #0
	bl sub_02061200
	add r5, r0, #0
	bl sub_02060F0C
	add r4, r4, r0
	add r0, r5, #0
	bl sub_02060F18
	add r1, r6, r0
	ldr r0, [sp, #8]
	cmp r4, r0
	bne _020662A6
	cmp r1, r7
	beq _020662BC
_020662A6:
	add r0, r5, #0
	mov r1, #0xc
	bl sub_0206234C
	add r1, r0, #0
	ldr r0, [sp]
	bl sub_0206217C
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_020662BC:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0206623C

	thumb_func_start sub_020662C4
sub_020662C4: ; 0x020662C4
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r1, #0
	add r4, r0, #0
	mov r1, #8
	bl sub_0205F370
	strb r5, [r0, #1]
	add r0, r4, #0
	mov r1, #0
	bl sub_0205F328
	add r0, r4, #0
	bl sub_0205F63C
	mov r1, #1
	add r0, r4, #0
	lsl r1, r1, #0x14
	bl sub_0205F20C
	ldr r5, _02066308 ; =_020FE3DC
	add r3, sp, #0
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	add r1, r2, #0
	str r0, [r3]
	add r0, r4, #0
	bl sub_0205F97C
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_02066308: .word _020FE3DC
	thumb_func_end sub_020662C4

	thumb_func_start sub_0206630C
sub_0206630C: ; 0x0206630C
	ldr r3, _02066314 ; =sub_020662C4
	mov r1, #0
	bx r3
	nop
_02066314: .word sub_020662C4
	thumb_func_end sub_0206630C

	thumb_func_start sub_02066318
sub_02066318: ; 0x02066318
	ldr r3, _02066320 ; =sub_020662C4
	mov r1, #1
	bx r3
	nop
_02066320: .word sub_020662C4
	thumb_func_end sub_02066318

	thumb_func_start sub_02066324
sub_02066324: ; 0x02066324
	ldr r3, _0206632C ; =sub_020662C4
	mov r1, #2
	bx r3
	nop
_0206632C: .word sub_020662C4
	thumb_func_end sub_02066324

	thumb_func_start sub_02066330
sub_02066330: ; 0x02066330
	ldr r3, _02066338 ; =sub_020662C4
	mov r1, #3
	bx r3
	nop
_02066338: .word sub_020662C4
	thumb_func_end sub_02066330

	thumb_func_start sub_0206633C
sub_0206633C: ; 0x0206633C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl sub_0205F394
	ldr r6, _0206635C ; =_020FE3CC
	add r4, r0, #0
_02066348:
	ldrb r2, [r4]
	add r0, r5, #0
	add r1, r4, #0
	lsl r2, r2, #2
	ldr r2, [r6, r2]
	blx r2
	cmp r0, #1
	beq _02066348
	pop {r4, r5, r6, pc}
	nop
_0206635C: .word _020FE3CC
	thumb_func_end sub_0206633C

	thumb_func_start sub_02066360
sub_02066360: ; 0x02066360
	push {r3, lr}
	bl sub_0206642C
	cmp r0, #0
	beq _0206636E
	bl ov01_021F1640
_0206636E:
	pop {r3, pc}
	thumb_func_end sub_02066360

	thumb_func_start sub_02066370
sub_02066370: ; 0x02066370
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r0, #0
	bl sub_0205F394
	add r5, r0, #0
	mov r1, #0
	strb r1, [r5]
	add r0, r4, #0
	bl sub_02066420
	ldrb r0, [r5, #2]
	cmp r0, #0
	bne _020663AC
	ldr r5, _020663B0 ; =_020FE3E8
	add r3, sp, #0
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	add r1, r2, #0
	str r0, [r3]
	add r0, r4, #0
	bl sub_0205F97C
	mov r1, #1
	add r0, r4, #0
	lsl r1, r1, #0x14
	bl sub_0205F20C
_020663AC:
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_020663B0: .word _020FE3E8
	thumb_func_end sub_02066370

	thumb_func_start sub_020663B4
sub_020663B4: ; 0x020663B4
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldrb r1, [r4, #2]
	add r5, r0, #0
	cmp r1, #0
	bne _020663CE
	ldrb r1, [r4, #1]
	bl ov01_021FFF5C
	add r1, r0, #0
	add r0, r5, #0
	bl sub_02066420
_020663CE:
	add r0, r5, #0
	bl sub_0205F63C
	add r0, r5, #0
	bl sub_0205F660
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_020663B4

	thumb_func_start sub_020663E4
sub_020663E4: ; 0x020663E4
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldrb r1, [r4, #2]
	add r5, r0, #0
	cmp r1, #0
	bne _0206641C
	bl sub_0206642C
	cmp r0, #0
	bne _02066412
	add r0, r5, #0
	bl sub_0205F73C
	cmp r0, #1
	bne _02066412
	ldrb r1, [r4, #1]
	add r0, r5, #0
	bl ov01_021FFF5C
	add r1, r0, #0
	add r0, r5, #0
	bl sub_02066420
_02066412:
	mov r1, #1
	add r0, r5, #0
	lsl r1, r1, #0x14
	bl sub_0205F20C
_0206641C:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_020663E4

	thumb_func_start sub_02066420
sub_02066420: ; 0x02066420
	push {r4, lr}
	add r4, r1, #0
	bl sub_0205F394
	str r4, [r0, #4]
	pop {r4, pc}
	thumb_func_end sub_02066420

	thumb_func_start sub_0206642C
sub_0206642C: ; 0x0206642C
	push {r3, lr}
	bl sub_0205F394
	ldr r0, [r0, #4]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0206642C

	thumb_func_start sub_02066438
sub_02066438: ; 0x02066438
	push {r3, lr}
	bl sub_0205F394
	mov r1, #1
	strb r1, [r0, #2]
	pop {r3, pc}
	thumb_func_end sub_02066438

	thumb_func_start sub_02066444
sub_02066444: ; 0x02066444
	push {r3, r4, r5, lr}
	sub sp, #0x30
	ldr r5, _020664CC ; =_020FE3F4
	add r3, r0, #0
	ldmia r5!, {r0, r1}
	add r4, sp, #0x20
	add r2, r4, #0
	stmia r4!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	ldr r5, _020664D0 ; =_020FE434
	add r4, sp, #0x10
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	ldr r5, _020664D4 ; =_020FE444
	add r4, sp, #0
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	mov r1, #0
_02066472:
	lsl r0, r1, #2
	ldr r0, [r2, r0]
	cmp r3, r0
	bne _02066480
	add sp, #0x30
	mov r0, #3
	pop {r3, r4, r5, pc}
_02066480:
	add r0, r1, #1
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	cmp r1, #4
	blo _02066472
	mov r2, #0
	add r1, sp, #0x10
_0206648E:
	lsl r0, r2, #2
	ldr r0, [r1, r0]
	cmp r3, r0
	bne _0206649C
	add sp, #0x30
	mov r0, #2
	pop {r3, r4, r5, pc}
_0206649C:
	add r0, r2, #1
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	cmp r2, #4
	blo _0206648E
	mov r2, #0
	add r1, sp, #0
_020664AA:
	lsl r0, r2, #2
	ldr r0, [r1, r0]
	cmp r3, r0
	bne _020664B8
	add sp, #0x30
	mov r0, #1
	pop {r3, r4, r5, pc}
_020664B8:
	add r0, r2, #1
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	cmp r2, #4
	blo _020664AA
	bl GF_AssertFail
	mov r0, #0
	add sp, #0x30
	pop {r3, r4, r5, pc}
	.balign 4, 0
_020664CC: .word _020FE3F4
_020664D0: .word _020FE434
_020664D4: .word _020FE444
	thumb_func_end sub_02066444

	thumb_func_start sub_020664D8
sub_020664D8: ; 0x020664D8
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	bl sub_0205F52C
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0205F914
	str r0, [sp, #8]
	add r0, r5, #0
	bl sub_0205F934
	add r2, r0, #0
	ldr r1, [sp, #8]
	add r0, r4, #0
	str r2, [sp, #4]
	bl sub_02054918
	add r6, r0, #0
	lsl r0, r6, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B6E8
	cmp r0, #1
	bne _02066516
	add r0, r5, #0
	mov r1, #0
	bl ov01_021FF070
	b _0206652A
_02066516:
	lsl r0, r6, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B6F4
	cmp r0, #1
	bne _0206652A
	add r0, r5, #0
	mov r1, #0
	bl ov01_021FF8F0
_0206652A:
	add r0, r5, #0
	bl ov01_022055DC
	cmp r0, #0
	beq _02066596
	add r0, r5, #0
	bl sub_0205F2A8
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	add r0, #0xfe
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #1
	bhi _02066596
	add r0, r5, #0
	add r1, sp, #8
	add r2, sp, #4
	bl ov01_02205604
	ldr r1, [sp, #8]
	ldr r2, [sp, #4]
	add r0, r4, #0
	bl sub_02054918
	add r4, r0, #0
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B6E8
	cmp r0, #1
	bne _0206657C
	mov r1, #1
	str r1, [sp]
	ldr r2, [sp, #8]
	ldr r3, [sp, #4]
	add r0, r5, #0
	bl ov01_021FF0E4
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
_0206657C:
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B6F4
	cmp r0, #1
	bne _02066596
	mov r1, #1
	str r1, [sp]
	ldr r2, [sp, #8]
	ldr r3, [sp, #4]
	add r0, r5, #0
	bl ov01_021FF964
_02066596:
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_020664D8

	thumb_func_start sub_0206659C
sub_0206659C: ; 0x0206659C
	ldr r3, _020665A0 ; =SetFlagInArray
	bx r3
	.balign 4, 0
_020665A0: .word SetFlagInArray
	thumb_func_end sub_0206659C

	thumb_func_start sub_020665A4
sub_020665A4: ; 0x020665A4
	ldr r3, _020665A8 ; =ClearFlagInArray
	bx r3
	.balign 4, 0
_020665A8: .word ClearFlagInArray
	thumb_func_end sub_020665A4

	thumb_func_start sub_020665AC
sub_020665AC: ; 0x020665AC
	ldr r3, _020665B0 ; =CheckFlagInArray
	bx r3
	.balign 4, 0
_020665B0: .word CheckFlagInArray
	thumb_func_end sub_020665AC

	thumb_func_start sub_020665B4
sub_020665B4: ; 0x020665B4
	push {r3, lr}
	cmp r1, #0
	beq _020665CE
	cmp r1, #1
	beq _020665C4
	cmp r1, #2
	beq _020665D8
	b _020665E2
_020665C4:
	lsl r1, r2, #0x10
	lsr r1, r1, #0x10
	bl sub_0206659C
	b _020665E6
_020665CE:
	lsl r1, r2, #0x10
	lsr r1, r1, #0x10
	bl sub_020665A4
	b _020665E6
_020665D8:
	lsl r1, r2, #0x10
	lsr r1, r1, #0x10
	bl sub_020665AC
	pop {r3, pc}
_020665E2:
	bl GF_AssertFail
_020665E6:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_020665B4

	thumb_func_start sub_020665EC
sub_020665EC: ; 0x020665EC
	ldr r3, _020665F4 ; =sub_0206659C
	mov r1, #0x96
	lsl r1, r1, #4
	bx r3
	.balign 4, 0
_020665F4: .word sub_0206659C
	thumb_func_end sub_020665EC

	thumb_func_start sub_020665F8
sub_020665F8: ; 0x020665F8
	ldr r3, _02066600 ; =sub_020665AC
	mov r1, #0x96
	lsl r1, r1, #4
	bx r3
	.balign 4, 0
_02066600: .word sub_020665AC
	thumb_func_end sub_020665F8

	thumb_func_start sub_02066604
sub_02066604: ; 0x02066604
	ldr r3, _0206660C ; =sub_0206659C
	ldr r1, _02066610 ; =0x00000964
	bx r3
	nop
_0206660C: .word sub_0206659C
_02066610: .word 0x00000964
	thumb_func_end sub_02066604

	thumb_func_start sub_02066614
sub_02066614: ; 0x02066614
	ldr r3, _0206661C ; =sub_020665AC
	ldr r1, _02066620 ; =0x00000964
	bx r3
	nop
_0206661C: .word sub_020665AC
_02066620: .word 0x00000964
	thumb_func_end sub_02066614

	thumb_func_start sub_02066624
sub_02066624: ; 0x02066624
	ldr r3, _0206662C ; =sub_0206659C
	ldr r1, _02066630 ; =0x00000961
	bx r3
	nop
_0206662C: .word sub_0206659C
_02066630: .word 0x00000961
	thumb_func_end sub_02066624

	thumb_func_start sub_02066634
sub_02066634: ; 0x02066634
	ldr r3, _0206663C ; =sub_020665A4
	ldr r1, _02066640 ; =0x00000961
	bx r3
	nop
_0206663C: .word sub_020665A4
_02066640: .word 0x00000961
	thumb_func_end sub_02066634

	thumb_func_start sub_02066644
sub_02066644: ; 0x02066644
	ldr r3, _0206664C ; =sub_020665AC
	ldr r1, _02066650 ; =0x00000961
	bx r3
	nop
_0206664C: .word sub_020665AC
_02066650: .word 0x00000961
	thumb_func_end sub_02066644

	thumb_func_start sub_02066654
sub_02066654: ; 0x02066654
	ldr r3, _0206665C ; =sub_0206659C
	ldr r1, _02066660 ; =0x0000099C
	bx r3
	nop
_0206665C: .word sub_0206659C
_02066660: .word 0x0000099C
	thumb_func_end sub_02066654

	thumb_func_start sub_02066664
sub_02066664: ; 0x02066664
	ldr r3, _0206666C ; =sub_0206659C
	ldr r1, _02066670 ; =0x00000965
	bx r3
	nop
_0206666C: .word sub_0206659C
_02066670: .word 0x00000965
	thumb_func_end sub_02066664

	thumb_func_start sub_02066674
sub_02066674: ; 0x02066674
	ldr r3, _0206667C ; =sub_020665A4
	ldr r1, _02066680 ; =0x00000965
	bx r3
	nop
_0206667C: .word sub_020665A4
_02066680: .word 0x00000965
	thumb_func_end sub_02066674

	thumb_func_start sub_02066684
sub_02066684: ; 0x02066684
	ldr r3, _0206668C ; =sub_020665AC
	ldr r1, _02066690 ; =0x00000965
	bx r3
	nop
_0206668C: .word sub_020665AC
_02066690: .word 0x00000965
	thumb_func_end sub_02066684

	thumb_func_start sub_02066694
sub_02066694: ; 0x02066694
	ldr r3, _0206669C ; =sub_0206659C
	ldr r1, _020666A0 ; =0x00000969
	bx r3
	nop
_0206669C: .word sub_0206659C
_020666A0: .word 0x00000969
	thumb_func_end sub_02066694

	thumb_func_start sub_020666A4
sub_020666A4: ; 0x020666A4
	ldr r3, _020666AC ; =sub_020665A4
	ldr r1, _020666B0 ; =0x00000969
	bx r3
	nop
_020666AC: .word sub_020665A4
_020666B0: .word 0x00000969
	thumb_func_end sub_020666A4

	thumb_func_start sub_020666B4
sub_020666B4: ; 0x020666B4
	ldr r3, _020666BC ; =sub_020665AC
	ldr r1, _020666C0 ; =0x00000969
	bx r3
	nop
_020666BC: .word sub_020665AC
_020666C0: .word 0x00000969
	thumb_func_end sub_020666B4

	thumb_func_start sub_020666C4
sub_020666C4: ; 0x020666C4
	ldr r2, _020666D0 ; =0x0000097B
	ldr r3, _020666D4 ; =sub_020665AC
	add r1, r1, r2
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bx r3
	.balign 4, 0
_020666D0: .word 0x0000097B
_020666D4: .word sub_020665AC
	thumb_func_end sub_020666C4

	thumb_func_start sub_020666D8
sub_020666D8: ; 0x020666D8
	push {r3, lr}
	cmp r1, #3
	bhi _02066710
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_020666EA: ; jump table
	.short _020666F2 - _020666EA - 2 ; case 0
	.short _020666FA - _020666EA - 2 ; case 1
	.short _02066702 - _020666EA - 2 ; case 2
	.short _0206670A - _020666EA - 2 ; case 3
_020666F2:
	ldr r1, _02066714 ; =0x00000977
	bl sub_0206659C
	pop {r3, pc}
_020666FA:
	ldr r1, _02066718 ; =0x00000978
	bl sub_0206659C
	pop {r3, pc}
_02066702:
	ldr r1, _0206671C ; =0x00000979
	bl sub_0206659C
	pop {r3, pc}
_0206670A:
	ldr r1, _02066720 ; =0x0000097A
	bl sub_0206659C
_02066710:
	pop {r3, pc}
	nop
_02066714: .word 0x00000977
_02066718: .word 0x00000978
_0206671C: .word 0x00000979
_02066720: .word 0x0000097A
	thumb_func_end sub_020666D8

	thumb_func_start sub_02066724
sub_02066724: ; 0x02066724
	push {r3, lr}
	mov r2, #0
	cmp r1, #3
	bhi _02066766
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02066738: ; jump table
	.short _02066740 - _02066738 - 2 ; case 0
	.short _0206674A - _02066738 - 2 ; case 1
	.short _02066754 - _02066738 - 2 ; case 2
	.short _0206675E - _02066738 - 2 ; case 3
_02066740:
	ldr r1, _0206676C ; =0x00000977
	bl sub_020665AC
	add r2, r0, #0
	b _02066766
_0206674A:
	ldr r1, _02066770 ; =0x00000978
	bl sub_020665AC
	add r2, r0, #0
	b _02066766
_02066754:
	ldr r1, _02066774 ; =0x00000979
	bl sub_020665AC
	add r2, r0, #0
	b _02066766
_0206675E:
	ldr r1, _02066778 ; =0x0000097A
	bl sub_020665AC
	add r2, r0, #0
_02066766:
	add r0, r2, #0
	pop {r3, pc}
	nop
_0206676C: .word 0x00000977
_02066770: .word 0x00000978
_02066774: .word 0x00000979
_02066778: .word 0x0000097A
	thumb_func_end sub_02066724

	thumb_func_start sub_0206677C
sub_0206677C: ; 0x0206677C
	push {r3, lr}
	cmp r1, #0
	ldr r1, _02066790 ; =0x00000986
	beq _0206678A
	bl sub_0206659C
	pop {r3, pc}
_0206678A:
	bl sub_020665A4
	pop {r3, pc}
	.balign 4, 0
_02066790: .word 0x00000986
	thumb_func_end sub_0206677C

	thumb_func_start sub_02066794
sub_02066794: ; 0x02066794
	ldr r3, _0206679C ; =sub_020665AC
	ldr r1, _020667A0 ; =0x00000986
	bx r3
	nop
_0206679C: .word sub_020665AC
_020667A0: .word 0x00000986
	thumb_func_end sub_02066794

	thumb_func_start GetOverriddenMapMusic
GetOverriddenMapMusic: ; 0x020667A4
	push {r3, r4, r5, r6, r7, lr}
	ldr r5, _020667D8 ; =_020FE454
	add r7, r0, #0
	add r6, r1, #0
	mov r4, #0
_020667AE:
	ldrh r0, [r5]
	cmp r6, r0
	bne _020667CC
	ldrh r1, [r5, #2]
	add r0, r7, #0
	bl sub_020665AC
	cmp r0, #0
	beq _020667CC
	mov r0, #6
	add r1, r4, #0
	mul r1, r0
	ldr r0, _020667DC ; =_020FE454 + 4
	ldrh r0, [r0, r1]
	pop {r3, r4, r5, r6, r7, pc}
_020667CC:
	add r4, r4, #1
	add r5, r5, #6
	cmp r4, #0xd
	blo _020667AE
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_020667D8: .word _020FE454
_020667DC: .word _020FE454 + 4
	thumb_func_end GetOverriddenMapMusic

	thumb_func_start sub_020667E0
sub_020667E0: ; 0x020667E0
	ldr r3, _020667E8 ; =sub_0206659C
	ldr r1, _020667EC ; =0x00000966
	bx r3
	nop
_020667E8: .word sub_0206659C
_020667EC: .word 0x00000966
	thumb_func_end sub_020667E0

	thumb_func_start sub_020667F0
sub_020667F0: ; 0x020667F0
	ldr r3, _020667F8 ; =sub_020665A4
	ldr r1, _020667FC ; =0x00000966
	bx r3
	nop
_020667F8: .word sub_020665A4
_020667FC: .word 0x00000966
	thumb_func_end sub_020667F0

	thumb_func_start sub_02066800
sub_02066800: ; 0x02066800
	ldr r3, _02066808 ; =sub_020665AC
	ldr r1, _0206680C ; =0x00000966
	bx r3
	nop
_02066808: .word sub_020665AC
_0206680C: .word 0x00000966
	thumb_func_end sub_02066800

	thumb_func_start sub_02066810
sub_02066810: ; 0x02066810
	ldr r3, _02066818 ; =sub_020665AC
	ldr r1, _0206681C ; =0x00000976
	bx r3
	nop
_02066818: .word sub_020665AC
_0206681C: .word 0x00000976
	thumb_func_end sub_02066810

	thumb_func_start sub_02066820
sub_02066820: ; 0x02066820
	ldr r3, _02066828 ; =sub_0206659C
	ldr r1, _0206682C ; =0x00000975
	bx r3
	nop
_02066828: .word sub_0206659C
_0206682C: .word 0x00000975
	thumb_func_end sub_02066820

	thumb_func_start sub_02066830
sub_02066830: ; 0x02066830
	ldr r3, _02066838 ; =sub_020665A4
	ldr r1, _0206683C ; =0x00000975
	bx r3
	nop
_02066838: .word sub_020665A4
_0206683C: .word 0x00000975
	thumb_func_end sub_02066830

	thumb_func_start sub_02066840
sub_02066840: ; 0x02066840
	ldr r3, _02066848 ; =sub_0206659C
	ldr r1, _0206684C ; =0x00000967
	bx r3
	nop
_02066848: .word sub_0206659C
_0206684C: .word 0x00000967
	thumb_func_end sub_02066840

	thumb_func_start sub_02066850
sub_02066850: ; 0x02066850
	ldr r3, _02066858 ; =sub_020665A4
	ldr r1, _0206685C ; =0x00000967
	bx r3
	nop
_02066858: .word sub_020665A4
_0206685C: .word 0x00000967
	thumb_func_end sub_02066850

	thumb_func_start sub_02066860
sub_02066860: ; 0x02066860
	ldr r3, _02066868 ; =sub_020665AC
	ldr r1, _0206686C ; =0x00000967
	bx r3
	nop
_02066868: .word sub_020665AC
_0206686C: .word 0x00000967
	thumb_func_end sub_02066860

	thumb_func_start sub_02066870
sub_02066870: ; 0x02066870
	ldr r3, _02066878 ; =sub_020665AC
	ldr r1, _0206687C ; =0x00000996
	bx r3
	nop
_02066878: .word sub_020665AC
_0206687C: .word 0x00000996
	thumb_func_end sub_02066870

	thumb_func_start sub_02066880
sub_02066880: ; 0x02066880
	ldr r3, _02066888 ; =sub_0206659C
	ldr r1, _0206688C ; =0x00000971
	bx r3
	nop
_02066888: .word sub_0206659C
_0206688C: .word 0x00000971
	thumb_func_end sub_02066880

	thumb_func_start sub_02066890
sub_02066890: ; 0x02066890
	ldr r3, _02066898 ; =sub_020665A4
	ldr r1, _0206689C ; =0x00000971
	bx r3
	nop
_02066898: .word sub_020665A4
_0206689C: .word 0x00000971
	thumb_func_end sub_02066890

	thumb_func_start sub_020668A0
sub_020668A0: ; 0x020668A0
	ldr r3, _020668A8 ; =sub_020665AC
	ldr r1, _020668AC ; =0x00000971
	bx r3
	nop
_020668A8: .word sub_020665AC
_020668AC: .word 0x00000971
	thumb_func_end sub_020668A0

	thumb_func_start sub_020668B0
sub_020668B0: ; 0x020668B0
	ldr r3, _020668B8 ; =sub_020665A4
	ldr r1, _020668BC ; =0x00000972
	bx r3
	nop
_020668B8: .word sub_020665A4
_020668BC: .word 0x00000972
	thumb_func_end sub_020668B0

	thumb_func_start sub_020668C0
sub_020668C0: ; 0x020668C0
	ldr r3, _020668C8 ; =sub_020665B4
	ldr r2, _020668CC ; =0x00000962
	bx r3
	nop
_020668C8: .word sub_020665B4
_020668CC: .word 0x00000962
	thumb_func_end sub_020668C0

	thumb_func_start sub_020668D0
sub_020668D0: ; 0x020668D0
	ldr r3, _020668D8 ; =sub_0206659C
	ldr r1, _020668DC ; =0x00000973
	bx r3
	nop
_020668D8: .word sub_0206659C
_020668DC: .word 0x00000973
	thumb_func_end sub_020668D0

	thumb_func_start sub_020668E0
sub_020668E0: ; 0x020668E0
	ldr r3, _020668E8 ; =sub_020665A4
	ldr r1, _020668EC ; =0x00000973
	bx r3
	nop
_020668E8: .word sub_020665A4
_020668EC: .word 0x00000973
	thumb_func_end sub_020668E0

	thumb_func_start sub_020668F0
sub_020668F0: ; 0x020668F0
	ldr r3, _020668F8 ; =sub_020665AC
	ldr r1, _020668FC ; =0x00000973
	bx r3
	nop
_020668F8: .word sub_020665AC
_020668FC: .word 0x00000973
	thumb_func_end sub_020668F0

	thumb_func_start sub_02066900
sub_02066900: ; 0x02066900
	ldr r3, _02066908 ; =sub_0206659C
	ldr r1, _0206690C ; =0x00000974
	bx r3
	nop
_02066908: .word sub_0206659C
_0206690C: .word 0x00000974
	thumb_func_end sub_02066900

	thumb_func_start sub_02066910
sub_02066910: ; 0x02066910
	ldr r3, _02066918 ; =sub_020665A4
	ldr r1, _0206691C ; =0x00000974
	bx r3
	nop
_02066918: .word sub_020665A4
_0206691C: .word 0x00000974
	thumb_func_end sub_02066910

	thumb_func_start sub_02066920
sub_02066920: ; 0x02066920
	ldr r3, _02066928 ; =sub_020665AC
	ldr r1, _0206692C ; =0x00000974
	bx r3
	nop
_02066928: .word sub_020665AC
_0206692C: .word 0x00000974
	thumb_func_end sub_02066920

	thumb_func_start sub_02066930
sub_02066930: ; 0x02066930
	push {r4, r5, r6, lr}
	add r4, r2, #0
	add r5, r0, #0
	add r6, r1, #0
	cmp r4, #0x26
	blo _02066940
	bl GF_AssertFail
_02066940:
	mov r2, #0x9b
	lsl r2, r2, #4
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, r2
	bl sub_020665B4
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02066930

	thumb_func_start sub_02066950
sub_02066950: ; 0x02066950
	ldr r3, _02066958 ; =sub_0206659C
	mov r1, #0x97
	lsl r1, r1, #4
	bx r3
	.balign 4, 0
_02066958: .word sub_0206659C
	thumb_func_end sub_02066950

	thumb_func_start sub_0206695C
sub_0206695C: ; 0x0206695C
	ldr r3, _02066964 ; =sub_020665AC
	mov r1, #0x6a
	bx r3
	nop
_02066964: .word sub_020665AC
	thumb_func_end sub_0206695C

	thumb_func_start sub_02066968
sub_02066968: ; 0x02066968
	ldr r3, _02066970 ; =sub_020665AC
	mov r1, #0x9c
	bx r3
	nop
_02066970: .word sub_020665AC
	thumb_func_end sub_02066968

	thumb_func_start sub_02066974
sub_02066974: ; 0x02066974
	ldr r3, _0206697C ; =sub_020665AC
	mov r1, #0x6b
	bx r3
	nop
_0206697C: .word sub_020665AC
	thumb_func_end sub_02066974

	thumb_func_start sub_02066980
sub_02066980: ; 0x02066980
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #4
	blt _0206698E
	bl GF_AssertFail
_0206698E:
	ldr r1, _020669A0 ; =0x0000011B
	add r0, r5, #0
	add r1, r4, r1
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl sub_020665AC
	pop {r3, r4, r5, pc}
	nop
_020669A0: .word 0x0000011B
	thumb_func_end sub_02066980

	thumb_func_start sub_020669A4
sub_020669A4: ; 0x020669A4
	ldr r3, _020669AC ; =sub_020665AC
	ldr r1, _020669B0 ; =0x0000096A
	bx r3
	nop
_020669AC: .word sub_020665AC
_020669B0: .word 0x0000096A
	thumb_func_end sub_020669A4

	thumb_func_start sub_020669B4
sub_020669B4: ; 0x020669B4
	push {r3, lr}
	cmp r1, #2
	bls _020669BE
	mov r0, #0
	pop {r3, pc}
_020669BE:
	ldr r2, _020669CC ; =0x0000096B
	add r1, r1, r2
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl sub_020665AC
	pop {r3, pc}
	.balign 4, 0
_020669CC: .word 0x0000096B
	thumb_func_end sub_020669B4

	thumb_func_start sub_020669D0
sub_020669D0: ; 0x020669D0
	ldr r3, _020669D8 ; =sub_020665AC
	ldr r1, _020669DC ; =0x00000981
	bx r3
	nop
_020669D8: .word sub_020665AC
_020669DC: .word 0x00000981
	thumb_func_end sub_020669D0

	thumb_func_start sub_020669E0
sub_020669E0: ; 0x020669E0
	ldr r3, _020669E8 ; =sub_020665AC
	ldr r1, _020669EC ; =0x000009A6
	bx r3
	nop
_020669E8: .word sub_020665AC
_020669EC: .word 0x000009A6
	thumb_func_end sub_020669E0

	thumb_func_start sub_020669F0
sub_020669F0: ; 0x020669F0
	ldr r3, _020669F8 ; =sub_020665AC
	ldr r1, _020669FC ; =0x00000982
	bx r3
	nop
_020669F8: .word sub_020665AC
_020669FC: .word 0x00000982
	thumb_func_end sub_020669F0

	thumb_func_start sub_02066A00
sub_02066A00: ; 0x02066A00
	ldr r3, _02066A08 ; =sub_020665AC
	mov r1, #0x9a
	bx r3
	nop
_02066A08: .word sub_020665AC
	thumb_func_end sub_02066A00

	thumb_func_start sub_02066A0C
sub_02066A0C: ; 0x02066A0C
	ldr r3, _02066A14 ; =sub_020665AC
	ldr r1, _02066A18 ; =0x00000997
	bx r3
	nop
_02066A14: .word sub_020665AC
_02066A18: .word 0x00000997
	thumb_func_end sub_02066A0C

	thumb_func_start sub_02066A1C
sub_02066A1C: ; 0x02066A1C
	ldr r3, _02066A24 ; =sub_0206659C
	ldr r1, _02066A28 ; =0x0000099A
	bx r3
	nop
_02066A24: .word sub_0206659C
_02066A28: .word 0x0000099A
	thumb_func_end sub_02066A1C

	thumb_func_start sub_02066A2C
sub_02066A2C: ; 0x02066A2C
	ldr r3, _02066A34 ; =sub_020665A4
	ldr r1, _02066A38 ; =0x0000099A
	bx r3
	nop
_02066A34: .word sub_020665A4
_02066A38: .word 0x0000099A
	thumb_func_end sub_02066A2C

	thumb_func_start sub_02066A3C
sub_02066A3C: ; 0x02066A3C
	ldr r3, _02066A44 ; =sub_020665AC
	ldr r1, _02066A48 ; =0x0000099A
	bx r3
	nop
_02066A44: .word sub_020665AC
_02066A48: .word 0x0000099A
	thumb_func_end sub_02066A3C

	thumb_func_start sub_02066A4C
sub_02066A4C: ; 0x02066A4C
	ldr r3, _02066A54 ; =sub_020665AC
	mov r1, #0xf9
	bx r3
	nop
_02066A54: .word sub_020665AC
	thumb_func_end sub_02066A4C

	thumb_func_start sub_02066A58
sub_02066A58: ; 0x02066A58
	ldr r3, _02066A60 ; =sub_020665AC
	mov r1, #0xca
	bx r3
	nop
_02066A60: .word sub_020665AC
	thumb_func_end sub_02066A58

	thumb_func_start sub_02066A64
sub_02066A64: ; 0x02066A64
	push {r3, lr}
	cmp r1, #0
	ldr r1, _02066A78 ; =0x0000099D
	beq _02066A72
	bl sub_0206659C
	pop {r3, pc}
_02066A72:
	bl sub_020665A4
	pop {r3, pc}
	.balign 4, 0
_02066A78: .word 0x0000099D
	thumb_func_end sub_02066A64

	thumb_func_start sub_02066A7C
sub_02066A7C: ; 0x02066A7C
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r2, #0
	bl GetVarAddr
	mov r1, #1
	lsl r1, r1, #0xe
	cmp r5, r1
	blo _02066A94
	lsl r1, r1, #1
	cmp r5, r1
	bls _02066A9C
_02066A94:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, r4, r5, pc}
_02066A9C:
	cmp r0, #0
	bne _02066AA4
	mov r0, #0
	pop {r3, r4, r5, pc}
_02066AA4:
	strh r4, [r0]
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02066A7C

	thumb_func_start sub_02066AAC
sub_02066AAC: ; 0x02066AAC
	push {r3, lr}
	bl GetVarAddr
	cmp r0, #0
	bne _02066ABA
	mov r0, #0
	pop {r3, pc}
_02066ABA:
	ldrh r0, [r0]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02066AAC

	thumb_func_start sub_02066AC0
sub_02066AC0: ; 0x02066AC0
	ldr r3, _02066AC8 ; =sub_02066A7C
	add r2, r1, #0
	ldr r1, _02066ACC ; =0x0000403F
	bx r3
	.balign 4, 0
_02066AC8: .word sub_02066A7C
_02066ACC: .word 0x0000403F
	thumb_func_end sub_02066AC0

	thumb_func_start sub_02066AD0
sub_02066AD0: ; 0x02066AD0
	ldr r3, _02066AD8 ; =sub_02066AAC
	ldr r1, _02066ADC ; =0x0000403F
	bx r3
	nop
_02066AD8: .word sub_02066AAC
_02066ADC: .word 0x0000403F
	thumb_func_end sub_02066AD0

	thumb_func_start sub_02066AE0
sub_02066AE0: ; 0x02066AE0
	ldr r3, _02066AE8 ; =sub_02066A7C
	add r2, r1, #0
	ldr r1, _02066AEC ; =0x00004030
	bx r3
	.balign 4, 0
_02066AE8: .word sub_02066A7C
_02066AEC: .word 0x00004030
	thumb_func_end sub_02066AE0

	thumb_func_start sub_02066AF0
sub_02066AF0: ; 0x02066AF0
	ldr r3, _02066AF8 ; =sub_02066AAC
	ldr r1, _02066AFC ; =0x00004030
	bx r3
	nop
_02066AF8: .word sub_02066AAC
_02066AFC: .word 0x00004030
	thumb_func_end sub_02066AF0

	thumb_func_start sub_02066B00
sub_02066B00: ; 0x02066B00
	push {r3, lr}
	ldr r1, _02066B20 ; =0x00004030
	bl sub_02066AAC
	ldr r2, _02066B24 ; =0x00000183
	cmp r0, r2
	bne _02066B12
	add r2, r2, #3
	b _02066B1A
_02066B12:
	add r1, r2, #3
	cmp r0, r1
	bne _02066B1A
	add r2, r2, #6
_02066B1A:
	add r0, r2, #0
	pop {r3, pc}
	nop
_02066B20: .word 0x00004030
_02066B24: .word 0x00000183
	thumb_func_end sub_02066B00

	thumb_func_start sub_02066B28
sub_02066B28: ; 0x02066B28
	push {r3, lr}
	ldr r1, _02066B48 ; =0x00004030
	bl sub_02066AAC
	ldr r2, _02066B4C ; =0x00000183
	cmp r0, r2
	bne _02066B3A
	add r2, r2, #6
	b _02066B42
_02066B3A:
	add r1, r2, #3
	cmp r0, r1
	beq _02066B42
	add r2, r2, #3
_02066B42:
	add r0, r2, #0
	pop {r3, pc}
	nop
_02066B48: .word 0x00004030
_02066B4C: .word 0x00000183
	thumb_func_end sub_02066B28

	thumb_func_start sub_02066B50
sub_02066B50: ; 0x02066B50
	ldr r3, _02066B58 ; =sub_02066AAC
	ldr r1, _02066B5C ; =0x00004035
	bx r3
	nop
_02066B58: .word sub_02066AAC
_02066B5C: .word 0x00004035
	thumb_func_end sub_02066B50

	thumb_func_start sub_02066B60
sub_02066B60: ; 0x02066B60
	ldr r3, _02066B68 ; =sub_02066A7C
	add r2, r1, #0
	ldr r1, _02066B6C ; =0x00004035
	bx r3
	.balign 4, 0
_02066B68: .word sub_02066A7C
_02066B6C: .word 0x00004035
	thumb_func_end sub_02066B60

	thumb_func_start sub_02066B70
sub_02066B70: ; 0x02066B70
	ldr r3, _02066B78 ; =sub_02066AAC
	ldr r1, _02066B7C ; =0x0000403E
	bx r3
	nop
_02066B78: .word sub_02066AAC
_02066B7C: .word 0x0000403E
	thumb_func_end sub_02066B70

	thumb_func_start sub_02066B80
sub_02066B80: ; 0x02066B80
	push {r4, lr}
	add r4, r0, #0
	bmi _02066B8A
	cmp r4, #2
	blo _02066B8E
_02066B8A:
	bl GF_AssertFail
_02066B8E:
	ldr r0, _02066B98 ; =_020FE4A4
	lsl r1, r4, #1
	ldrh r0, [r0, r1]
	pop {r4, pc}
	nop
_02066B98: .word _020FE4A4
	thumb_func_end sub_02066B80

	thumb_func_start sub_02066B9C
sub_02066B9C: ; 0x02066B9C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	bl sub_02066B80
	ldr r1, _02066BBC ; =0x00004043
	add r2, r0, #0
	add r1, r4, r1
	lsl r1, r1, #0x10
	add r0, r5, #0
	lsr r1, r1, #0x10
	bl sub_02066A7C
	pop {r3, r4, r5, pc}
	nop
_02066BBC: .word 0x00004043
	thumb_func_end sub_02066B9C

	thumb_func_start sub_02066BC0
sub_02066BC0: ; 0x02066BC0
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldr r1, _02066BE4 ; =0x00004043
	add r1, r4, r1
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl sub_02066AAC
	add r5, r0, #0
	add r0, r4, #0
	bl sub_02066B80
	cmp r5, r0
	bne _02066BE0
	mov r0, #1
	pop {r3, r4, r5, pc}
_02066BE0:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02066BE4: .word 0x00004043
	thumb_func_end sub_02066BC0

	thumb_func_start sub_02066BE8
sub_02066BE8: ; 0x02066BE8
	push {r3, lr}
	cmp r1, #4
	bhs _02066BFA
	ldr r3, _02066BFC ; =0x00004045
	add r1, r1, r3
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl sub_02066A7C
_02066BFA:
	pop {r3, pc}
	.balign 4, 0
_02066BFC: .word 0x00004045
	thumb_func_end sub_02066BE8

	thumb_func_start sub_02066C00
sub_02066C00: ; 0x02066C00
	push {r4, lr}
	add r4, r0, #0
	bmi _02066C0A
	cmp r4, #4
	blt _02066C0E
_02066C0A:
	bl GF_AssertFail
_02066C0E:
	ldr r0, _02066C18 ; =_020FE4A8
	lsl r1, r4, #1
	ldrh r0, [r0, r1]
	pop {r4, pc}
	nop
_02066C18: .word _020FE4A8
	thumb_func_end sub_02066C00

	thumb_func_start sub_02066C1C
sub_02066C1C: ; 0x02066C1C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bmi _02066C28
	cmp r4, #4
	blt _02066C2C
_02066C28:
	bl GF_AssertFail
_02066C2C:
	add r0, r4, #0
	bl sub_02066C00
	add r2, r0, #0
	ldr r1, _02066C48 ; =0x00004036
	lsl r2, r2, #0x10
	add r1, r4, r1
	lsl r1, r1, #0x10
	add r0, r5, #0
	lsr r1, r1, #0x10
	lsr r2, r2, #0x10
	bl sub_02066A7C
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02066C48: .word 0x00004036
	thumb_func_end sub_02066C1C

	thumb_func_start sub_02066C4C
sub_02066C4C: ; 0x02066C4C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bmi _02066C58
	cmp r4, #4
	blt _02066C5C
_02066C58:
	bl GF_AssertFail
_02066C5C:
	ldr r1, _02066C70 ; =0x00004036
	add r0, r5, #0
	add r1, r4, r1
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	mov r2, #0
	bl sub_02066A7C
	pop {r3, r4, r5, pc}
	nop
_02066C70: .word 0x00004036
	thumb_func_end sub_02066C4C

	thumb_func_start sub_02066C74
sub_02066C74: ; 0x02066C74
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bmi _02066C80
	cmp r4, #4
	blt _02066C84
_02066C80:
	bl GF_AssertFail
_02066C84:
	ldr r1, _02066CA8 ; =0x00004036
	add r0, r5, #0
	add r1, r4, r1
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl sub_02066AAC
	add r5, r0, #0
	add r0, r4, #0
	bl sub_02066C00
	cmp r5, r0
	bne _02066CA2
	mov r0, #1
	pop {r3, r4, r5, pc}
_02066CA2:
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_02066CA8: .word 0x00004036
	thumb_func_end sub_02066C74

	thumb_func_start sub_02066CAC
sub_02066CAC: ; 0x02066CAC
	push {r3, r4, r5, lr}
	add r4, r1, #0
	lsl r2, r4, #0x10
	ldr r1, _02066CCC ; =0x0000403C
	lsr r2, r2, #0x10
	add r5, r0, #0
	bl sub_02066A7C
	lsr r2, r4, #0x10
	lsl r2, r2, #0x10
	ldr r1, _02066CCC ; =0x0000403C
	add r0, r5, #0
	lsr r2, r2, #0x10
	bl sub_02066A7C
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02066CCC: .word 0x0000403C
	thumb_func_end sub_02066CAC

	thumb_func_start sub_02066CD0
sub_02066CD0: ; 0x02066CD0
	push {r3, r4, r5, lr}
	ldr r1, _02066CEC ; =0x0000403C
	add r5, r0, #0
	bl sub_02066AAC
	add r4, r0, #0
	ldr r1, _02066CF0 ; =0x0000403D
	add r0, r5, #0
	bl sub_02066AAC
	lsl r0, r0, #0x10
	orr r0, r4
	pop {r3, r4, r5, pc}
	nop
_02066CEC: .word 0x0000403C
_02066CF0: .word 0x0000403D
	thumb_func_end sub_02066CD0

	thumb_func_start sub_02066CF4
sub_02066CF4: ; 0x02066CF4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl LCRandom
	add r4, r0, #0
	bl LCRandom
	add r1, r0, #0
	lsl r1, r1, #0x10
	add r0, r5, #0
	orr r1, r4
	bl sub_02066CAC
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02066CF4

	thumb_func_start sub_02066D10
sub_02066D10: ; 0x02066D10
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl SavArray_Flags_get
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0202C854
	bl sub_0202C7DC
	add r2, r0, #0
	ldr r1, _02066D38 ; =0x41C64E6D
	add r0, r4, #0
	mul r2, r1
	ldr r1, _02066D3C ; =0x00003039
	add r1, r2, r1
	bl sub_02066CAC
	pop {r3, r4, r5, pc}
	nop
_02066D38: .word 0x41C64E6D
_02066D3C: .word 0x00003039
	thumb_func_end sub_02066D10

	thumb_func_start sub_02066D40
sub_02066D40: ; 0x02066D40
	ldr r3, _02066D48 ; =sub_02066AAC
	ldr r1, _02066D4C ; =0x00004041
	bx r3
	nop
_02066D48: .word sub_02066AAC
_02066D4C: .word 0x00004041
	thumb_func_end sub_02066D40

	thumb_func_start sub_02066D50
sub_02066D50: ; 0x02066D50
	ldr r3, _02066D58 ; =sub_02066A7C
	add r2, r1, #0
	ldr r1, _02066D5C ; =0x00004041
	bx r3
	.balign 4, 0
_02066D58: .word sub_02066A7C
_02066D5C: .word 0x00004041
	thumb_func_end sub_02066D50

	thumb_func_start sub_02066D60
sub_02066D60: ; 0x02066D60
	push {r4, lr}
	bl SavArray_Flags_get
	add r4, r0, #0
	bl LCRandom
	mov r1, #0x62
	bl _s32_div_f
	add r1, r1, #2
	lsl r1, r1, #0x10
	add r0, r4, #0
	lsr r1, r1, #0x10
	bl sub_02066D50
	pop {r4, pc}
	thumb_func_end sub_02066D60

	thumb_func_start sub_02066D80
sub_02066D80: ; 0x02066D80
	push {r4, lr}
	ldr r1, _02066DA0 ; =0x00004042
	add r4, r0, #0
	bl sub_02066AAC
	ldr r2, _02066DA4 ; =0x00002710
	cmp r0, r2
	bhs _02066D96
	add r0, r0, #1
	lsl r0, r0, #0x10
	lsr r2, r0, #0x10
_02066D96:
	ldr r1, _02066DA0 ; =0x00004042
	add r0, r4, #0
	bl sub_02066A7C
	pop {r4, pc}
	.balign 4, 0
_02066DA0: .word 0x00004042
_02066DA4: .word 0x00002710
	thumb_func_end sub_02066D80

	thumb_func_start sub_02066DA8
sub_02066DA8: ; 0x02066DA8
	ldr r3, _02066DB0 ; =sub_02066AAC
	ldr r1, _02066DB4 ; =0x00004042
	bx r3
	nop
_02066DB0: .word sub_02066AAC
_02066DB4: .word 0x00004042
	thumb_func_end sub_02066DA8

	thumb_func_start sub_02066DB8
sub_02066DB8: ; 0x02066DB8
	ldr r3, _02066DC0 ; =sub_02066AAC
	ldr r1, _02066DC4 ; =0x0000404B
	bx r3
	nop
_02066DC0: .word sub_02066AAC
_02066DC4: .word 0x0000404B
	thumb_func_end sub_02066DB8

	thumb_func_start sub_02066DC8
sub_02066DC8: ; 0x02066DC8
	ldr r3, _02066DD0 ; =sub_02066A7C
	add r2, r1, #0
	ldr r1, _02066DD4 ; =0x0000404B
	bx r3
	.balign 4, 0
_02066DD0: .word sub_02066A7C
_02066DD4: .word 0x0000404B
	thumb_func_end sub_02066DC8

	thumb_func_start sub_02066DD8
sub_02066DD8: ; 0x02066DD8
	ldr r3, _02066DE0 ; =sub_02066AAC
	ldr r1, _02066DE4 ; =0x0000404E
	bx r3
	nop
_02066DE0: .word sub_02066AAC
_02066DE4: .word 0x0000404E
	thumb_func_end sub_02066DD8

	thumb_func_start sub_02066DE8
sub_02066DE8: ; 0x02066DE8
	ldr r3, _02066DF0 ; =sub_02066AAC
	ldr r1, _02066DF4 ; =0x0000404F
	bx r3
	nop
_02066DF0: .word sub_02066AAC
_02066DF4: .word 0x0000404F
	thumb_func_end sub_02066DE8

	thumb_func_start sub_02066DF8
sub_02066DF8: ; 0x02066DF8
	ldr r3, _02066E00 ; =sub_02066AAC
	ldr r1, _02066E04 ; =0x00004050
	bx r3
	nop
_02066E00: .word sub_02066AAC
_02066E04: .word 0x00004050
	thumb_func_end sub_02066DF8

	thumb_func_start sub_02066E08
sub_02066E08: ; 0x02066E08
	ldr r3, _02066E10 ; =sub_02066AAC
	ldr r1, _02066E14 ; =0x00004051
	bx r3
	nop
_02066E10: .word sub_02066AAC
_02066E14: .word 0x00004051
	thumb_func_end sub_02066E08

	thumb_func_start sub_02066E18
sub_02066E18: ; 0x02066E18
	ldr r3, _02066E20 ; =sub_02066AAC
	ldr r1, _02066E24 ; =0x0000404D
	bx r3
	nop
_02066E20: .word sub_02066AAC
_02066E24: .word 0x0000404D
	thumb_func_end sub_02066E18

	thumb_func_start sub_02066E28
sub_02066E28: ; 0x02066E28
	ldr r3, _02066E30 ; =sub_02066AAC
	ldr r1, _02066E34 ; =0x0000404C
	bx r3
	nop
_02066E30: .word sub_02066AAC
_02066E34: .word 0x0000404C
	thumb_func_end sub_02066E28

	thumb_func_start sub_02066E38
sub_02066E38: ; 0x02066E38
	ldr r3, _02066E40 ; =sub_02066A7C
	add r2, r1, #0
	ldr r1, _02066E44 ; =0x0000404C
	bx r3
	.balign 4, 0
_02066E40: .word sub_02066A7C
_02066E44: .word 0x0000404C
	thumb_func_end sub_02066E38

	thumb_func_start sub_02066E48
sub_02066E48: ; 0x02066E48
	ldr r3, _02066E50 ; =sub_02066AAC
	ldr r1, _02066E54 ; =0x00004052
	bx r3
	nop
_02066E50: .word sub_02066AAC
_02066E54: .word 0x00004052
	thumb_func_end sub_02066E48

	thumb_func_start sub_02066E58
sub_02066E58: ; 0x02066E58
	push {r3, lr}
	ldr r1, _02066E70 ; =0x00004077
	bl sub_02066AAC
	cmp r0, #2
	blo _02066E68
	cmp r0, #4
	bls _02066E6C
_02066E68:
	mov r0, #0
	pop {r3, pc}
_02066E6C:
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
_02066E70: .word 0x00004077
	thumb_func_end sub_02066E58

	thumb_func_start sub_02066E74
sub_02066E74: ; 0x02066E74
	ldr r3, _02066E7C ; =sub_02066AAC
	ldr r1, _02066E80 ; =0x00004057
	bx r3
	nop
_02066E7C: .word sub_02066AAC
_02066E80: .word 0x00004057
	thumb_func_end sub_02066E74

	thumb_func_start sub_02066E84
sub_02066E84: ; 0x02066E84
	ldr r3, _02066E8C ; =sub_02066A7C
	add r2, r1, #0
	ldr r1, _02066E90 ; =0x00004057
	bx r3
	.balign 4, 0
_02066E8C: .word sub_02066A7C
_02066E90: .word 0x00004057
	thumb_func_end sub_02066E84

	thumb_func_start sub_02066E94
sub_02066E94: ; 0x02066E94
	push {r3, r4, r5, lr}
	ldr r1, _02066EC8 ; =0x00004033
	add r5, r0, #0
	bl sub_02066AAC
	add r4, r0, #0
	bl LCRandom
	mov r1, #0x1e
	bl _s32_div_f
	lsl r0, r1, #0x10
	lsr r2, r0, #0x10
	cmp r4, r2
	bne _02066EBE
	add r0, r2, #1
	mov r1, #0x1e
	bl _s32_div_f
	lsl r0, r1, #0x10
	lsr r2, r0, #0x10
_02066EBE:
	ldr r1, _02066EC8 ; =0x00004033
	add r0, r5, #0
	bl sub_02066A7C
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02066EC8: .word 0x00004033
	thumb_func_end sub_02066E94

	thumb_func_start sub_02066ECC
sub_02066ECC: ; 0x02066ECC
	ldr r3, _02066ED4 ; =sub_02066AAC
	ldr r1, _02066ED8 ; =0x00004033
	bx r3
	nop
_02066ED4: .word sub_02066AAC
_02066ED8: .word 0x00004033
	thumb_func_end sub_02066ECC

	thumb_func_start sub_02066EDC
sub_02066EDC: ; 0x02066EDC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	add r0, r2, #0
	mov r1, #0x44
	bl AllocFromHeapAtEnd
	ldr r7, [r6, #0xc]
	mov r1, #0
	mov r2, #0x44
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r7, #0
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [r4, #0xc]
	add r0, r7, #0
	bl SavArray_PlayerParty_get
	str r0, [r4]
	add r0, r7, #0
	bl Sav2_Bag_get
	str r0, [r4, #4]
	add r0, r4, #0
	mov r2, #0
	add r0, #0x25
	strb r2, [r0]
	add r0, r4, #0
	ldrb r1, [r5, #8]
	add r0, #0x24
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x36
	ldrb r1, [r0]
	mov r0, #0xf
	ldrb r3, [r5, #0xa]
	bic r1, r0
	mov r0, #0xf
	and r3, r0
	orr r3, r1
	add r1, r4, #0
	add r1, #0x36
	strb r3, [r1]
	add r1, r4, #0
	add r1, #0x36
	add r0, #0xfd
	ldrb r1, [r1]
	mov r3, #0xf0
	add r0, r6, r0
	bic r1, r3
	ldrb r3, [r5, #0xb]
	lsl r3, r3, #0x1c
	lsr r3, r3, #0x18
	orr r3, r1
	add r1, r4, #0
	add r1, #0x36
	strb r3, [r1]
	add r1, r4, #0
	ldrb r3, [r5, #0xc]
	add r1, #0x37
	strb r3, [r1]
	add r1, r4, #0
	ldrb r3, [r5, #0xd]
	add r1, #0x26
	strb r3, [r1]
	str r0, [r4, #0x20]
_02066F64:
	add r0, r5, r2
	ldrb r1, [r0, #0xe]
	add r0, r4, r2
	add r0, #0x30
	strb r1, [r0]
	add r0, r2, #1
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	cmp r2, #6
	blo _02066F64
	ldr r1, _02066F8C ; =0x0210159C
	add r0, r6, #0
	add r2, r4, #0
	bl ScrUnk80_AddOvyMan
	ldr r0, [r5, #0x14]
	str r4, [r0]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02066F8C: .word 0x0210159C
	thumb_func_end sub_02066EDC

	thumb_func_start sub_02066F90
sub_02066F90: ; 0x02066F90
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, r1, #0
	bl sub_020505A0
	cmp r0, #0
	beq _02066FA2
	mov r0, #1
	pop {r3, r4, r5, pc}
_02066FA2:
	ldr r0, [r5, #0x14]
	ldr r4, [r0]
	add r0, r4, #0
	add r0, #0x26
	ldrb r0, [r0]
	cmp r0, #6
	beq _02066FBC
	cmp r0, #7
	bne _02066FC4
	mov r0, #0
	str r0, [r5]
	mov r0, #4
	pop {r3, r4, r5, pc}
_02066FBC:
	mov r0, #1
	str r0, [r5]
	mov r0, #4
	pop {r3, r4, r5, pc}
_02066FC4:
	add r0, r4, #0
	add r1, r5, #0
	add r0, #0x30
	add r1, #0xe
	mov r2, #6
	bl MI_CpuCopy8
	add r0, r4, #0
	add r0, #0x26
	ldrb r0, [r0]
	strb r0, [r5, #0xd]
	add r0, r4, #0
	bl FreeToHeap
	ldr r0, [r5, #0x14]
	mov r1, #0
	str r1, [r0]
	mov r0, #2
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02066F90

	thumb_func_start sub_02066FEC
sub_02066FEC: ; 0x02066FEC
	push {r3, r4, r5, r6, r7, lr}
	add r7, r1, #0
	add r6, r0, #0
	ldr r5, [r7, #0xc]
	add r0, r2, #0
	mov r1, #0x3c
	bl AllocFromHeapAtEnd
	mov r1, #0
	mov r2, #0x3c
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r5, #0
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [r4, #4]
	add r0, r5, #0
	bl SavArray_PlayerParty_get
	str r0, [r4]
	add r0, r5, #0
	bl SavArray_IsNatDexEnabled
	str r0, [r4, #0x1c]
	add r0, r5, #0
	bl sub_02088288
	str r0, [r4, #0x2c]
	mov r0, #1
	strb r0, [r4, #0x11]
	ldrb r0, [r6, #0xd]
	strb r0, [r4, #0x14]
	ldr r0, [r4]
	bl GetPartyCount
	strb r0, [r4, #0x13]
	mov r0, #0
	strh r0, [r4, #0x18]
	ldrb r0, [r6, #9]
	strb r0, [r4, #0x12]
	add r0, r5, #0
	bl sub_0202D95C
	str r0, [r4, #0x20]
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r7, r0
	str r0, [r4, #0x30]
	add r0, r5, #0
	bl sub_0208828C
	str r0, [r4, #0x34]
	ldr r1, _02067080 ; =_020FE4B0
	add r0, r4, #0
	bl sub_02089D40
	add r0, r5, #0
	bl Sav2_PlayerData_GetProfileAddr
	add r1, r0, #0
	add r0, r4, #0
	bl sub_0208AD34
	ldr r1, _02067084 ; =0x02103A1C
	add r0, r7, #0
	add r2, r4, #0
	bl ScrUnk80_AddOvyMan
	ldr r0, [r6, #0x14]
	str r4, [r0]
	mov r0, #3
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02067080: .word _020FE4B0
_02067084: .word 0x02103A1C
	thumb_func_end sub_02066FEC

	thumb_func_start sub_02067088
sub_02067088: ; 0x02067088
	push {r4, lr}
	add r4, r0, #0
	add r0, r1, #0
	bl sub_020505A0
	cmp r0, #0
	beq _0206709A
	mov r0, #3
	pop {r4, pc}
_0206709A:
	ldr r0, [r4, #0x14]
	ldr r0, [r0]
	ldrb r1, [r0, #0x14]
	strb r1, [r4, #0xd]
	bl FreeToHeap
	ldr r1, [r4, #0x14]
	mov r0, #0
	str r0, [r1]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02067088

	thumb_func_start sub_020670B0
sub_020670B0: ; 0x020670B0
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl sub_0205064C
	add r5, r0, #0
	add r0, r4, #0
	bl sub_02050650
	add r4, r0, #0
	ldr r1, [r4, #4]
	cmp r1, #4
	bhi _02067112
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_020670D4: ; jump table
	.short _020670DE - _020670D4 - 2 ; case 0
	.short _020670EA - _020670D4 - 2 ; case 1
	.short _020670F4 - _020670D4 - 2 ; case 2
	.short _02067100 - _020670D4 - 2 ; case 3
	.short _0206710A - _020670D4 - 2 ; case 4
_020670DE:
	add r1, r5, #0
	mov r2, #0xb
	bl sub_02066EDC
	str r0, [r4, #4]
	b _02067112
_020670EA:
	add r1, r5, #0
	bl sub_02066F90
	str r0, [r4, #4]
	b _02067112
_020670F4:
	add r1, r5, #0
	mov r2, #0xb
	bl sub_02066FEC
	str r0, [r4, #4]
	b _02067112
_02067100:
	add r1, r5, #0
	bl sub_02067088
	str r0, [r4, #4]
	b _02067112
_0206710A:
	bl FreeToHeap
	mov r0, #1
	pop {r3, r4, r5, pc}
_02067112:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_020670B0

	thumb_func_start sub_02067118
sub_02067118: ; 0x02067118
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	bl sub_0205064C
	str r0, [sp]
	mov r0, #0xb
	mov r1, #0x18
	bl AllocFromHeap
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x18
	bl MI_CpuFill8
	strb r6, [r4, #8]
	strb r7, [r4, #9]
	add r0, sp, #8
	ldrb r1, [r0, #0x10]
	add r2, r4, #0
	strb r1, [r4, #0xa]
	ldrb r1, [r0, #0x14]
	strb r1, [r4, #0xb]
	ldrb r1, [r0, #0x18]
	strb r1, [r4, #0xc]
	ldrb r0, [r0, #0x1c]
	ldr r1, _02067160 ; =sub_020670B0
	strb r0, [r4, #0xd]
	ldr r0, [sp]
	str r5, [r4, #0x14]
	ldr r0, [r0, #0x10]
	bl sub_02050530
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02067160: .word sub_020670B0
	thumb_func_end sub_02067118

	thumb_func_start sub_02067164
sub_02067164: ; 0x02067164
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r0, #0
	ldr r0, [r5, #0xc]
	bl sub_0203A05C
	cmp r0, #0
	beq _02067184
	ldrh r1, [r4, #0x12]
	ldrh r2, [r4, #0x14]
	add r0, r5, #0
	bl sub_0203F8EC
	str r0, [r4, #8]
	mov r0, #1
	pop {r3, r4, r5, pc}
_02067184:
	mov r0, #1
	str r0, [r4]
	mov r0, #2
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02067164

	thumb_func_start sub_0206718C
sub_0206718C: ; 0x0206718C
	push {r4, lr}
	add r4, r0, #0
	add r0, r1, #0
	bl sub_020505A0
	cmp r0, #0
	beq _0206719E
	mov r0, #1
	pop {r4, pc}
_0206719E:
	ldr r0, [r4, #8]
	ldr r0, [r0, #0x20]
	str r0, [r4]
	ldr r0, [r4, #8]
	bl FreeToHeap
	mov r0, #2
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0206718C

	thumb_func_start sub_020671B0
sub_020671B0: ; 0x020671B0
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl sub_0205064C
	add r5, r0, #0
	add r0, r4, #0
	bl sub_02050650
	add r4, r0, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	beq _020671D2
	cmp r1, #1
	beq _020671DC
	cmp r1, #2
	beq _020671E6
	b _020671FC
_020671D2:
	add r1, r5, #0
	bl sub_02067164
	str r0, [r4, #4]
	b _020671FC
_020671DC:
	add r1, r5, #0
	bl sub_0206718C
	str r0, [r4, #4]
	b _020671FC
_020671E6:
	ldrh r1, [r4, #0x10]
	add r0, r5, #0
	bl GetVarPointer
	ldr r1, [r4]
	strh r1, [r0]
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #1
	pop {r3, r4, r5, pc}
_020671FC:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_020671B0

	thumb_func_start sub_02067200
sub_02067200: ; 0x02067200
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	bl sub_0205064C
	str r0, [sp]
	mov r0, #0xb
	mov r1, #0x18
	bl AllocFromHeap
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x18
	bl MI_CpuFill8
	strh r5, [r4, #0x12]
	strh r7, [r4, #0x14]
	ldr r0, [sp]
	strh r6, [r4, #0x10]
	ldr r0, [r0, #0x10]
	ldr r1, _02067234 ; =sub_020671B0
	add r2, r4, #0
	bl sub_02050530
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02067234: .word sub_020671B0
	thumb_func_end sub_02067200

	thumb_func_start sub_02067238
sub_02067238: ; 0x02067238
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	bl sub_0205064C
	add r6, r0, #0
	add r0, r4, #0
	bl sub_02050650
	add r5, r0, #0
	bl sub_0203769C
	mov r1, #1
	sub r0, r1, r0
	bl sub_02037C44
	add r7, r0, #0
	bne _0206725E
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0206725E:
	ldrh r1, [r5, #2]
	add r0, r6, #0
	bl GetVarPointer
	add r4, r0, #0
	ldrh r0, [r5]
	cmp r0, #0
	beq _02067278
	cmp r0, #1
	beq _02067284
	cmp r0, #2
	beq _02067290
	b _0206729A
_02067278:
	add r0, r6, #0
	add r1, r7, #0
	bl sub_0204B610
	strh r0, [r4]
	b _0206729A
_02067284:
	add r0, r6, #0
	add r1, r7, #0
	bl sub_0204B66C
	strh r0, [r4]
	b _0206729A
_02067290:
	add r0, r6, #0
	add r1, r7, #0
	bl sub_0204B690
	strh r0, [r4]
_0206729A:
	add r0, r5, #0
	bl FreeToHeap
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02067238

	thumb_func_start sub_020672A4
sub_020672A4: ; 0x020672A4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r6, r2, #0
	bl sub_0205064C
	add r7, r0, #0
	mov r0, #0xb
	mov r1, #4
	bl AllocFromHeap
	add r4, r0, #0
	mov r1, #0
	mov r2, #4
	bl MI_CpuFill8
	strh r5, [r4]
	strh r6, [r4, #2]
	ldr r0, [r7, #0x10]
	ldr r1, _020672D4 ; =sub_02067238
	add r2, r4, #0
	bl sub_02050530
	pop {r3, r4, r5, r6, r7, pc}
	nop
_020672D4: .word sub_02067238
	thumb_func_end sub_020672A4

	thumb_func_start sub_020672D8
sub_020672D8: ; 0x020672D8
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	bl sub_0203107C
	mov r1, #0
	mov r2, #0xff
	bl sub_020310BC
	str r0, [sp]
	cmp r0, #0x14
	bhs _020672F2
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_020672F2:
	add r0, r4, #0
	bl Save_FrontierData_get
	mov r1, #0xd
	mov r2, #0
	add r4, r0, #0
	bl sub_0202D5DC
	lsl r0, r0, #0x18
	mov r1, #0
	lsr r7, r0, #0x18
	add r0, r4, #0
	add r2, r1, #0
	bl sub_0202D5DC
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	add r0, r4, #0
	mov r1, #1
	mov r2, #0
	bl sub_0202D5DC
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	add r0, r4, #0
	mov r1, #0xe
	mov r2, #0
	bl sub_0202D5DC
	add r0, r4, #0
	mov r1, #2
	mov r2, #0
	bl sub_0202D5DC
	add r0, r4, #0
	mov r1, #3
	mov r2, #0
	bl sub_0202D5DC
	cmp r7, #0
	beq _02067350
	cmp r6, #0
	beq _02067350
	cmp r5, #0
	beq _02067350
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02067350:
	cmp r7, #0
	bne _02067362
	add r0, r4, #0
	mov r1, #0xd
	mov r2, #1
	bl sub_0202D5DC
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02067362:
	ldr r0, [sp]
	cmp r0, #0x32
	bhs _0206736C
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0206736C:
	cmp r6, #0
	bne _0206737E
	add r0, r4, #0
	mov r1, #0
	mov r2, #1
	bl sub_0202D5DC
	mov r0, #2
	pop {r3, r4, r5, r6, r7, pc}
_0206737E:
	cmp r0, #0x64
	blo _02067386
	cmp r5, #0
	beq _0206738A
_02067386:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0206738A:
	mov r1, #1
	add r0, r4, #0
	add r2, r1, #0
	bl sub_0202D5DC
	mov r0, #3
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_020672D8

	thumb_func_start sub_02067398
sub_02067398: ; 0x02067398
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r4, r0, #0
	bl sub_0203107C
	mov r1, #0
	mov r2, #0xff
	bl sub_020310BC
	str r0, [sp, #8]
	cmp r0, #0x14
	bhs _020673B6
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_020673B6:
	add r0, r4, #0
	bl Save_FrontierData_get
	mov r1, #0xd
	mov r2, #0
	add r7, r0, #0
	bl sub_0202D5DC
	lsl r0, r0, #0x18
	mov r1, #0
	lsr r6, r0, #0x18
	add r0, r7, #0
	add r2, r1, #0
	bl sub_0202D5DC
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	add r0, r7, #0
	mov r1, #1
	mov r2, #0
	bl sub_0202D5DC
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	add r0, r7, #0
	mov r1, #0xe
	mov r2, #0
	bl sub_0202D5DC
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	add r0, r7, #0
	mov r1, #2
	mov r2, #0
	bl sub_0202D5DC
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	add r0, r7, #0
	mov r1, #3
	mov r2, #0
	bl sub_0202D5DC
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	cmp r6, #0
	beq _02067426
	cmp r4, #0
	beq _02067426
	cmp r5, #0
	beq _02067426
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_02067426:
	cmp r6, #0
	bne _0206743C
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _02067436
	add sp, #0xc
	mov r0, #4
	pop {r4, r5, r6, r7, pc}
_02067436:
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_0206743C:
	ldr r0, [sp, #8]
	cmp r0, #0x32
	bhs _02067448
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_02067448:
	cmp r4, #0
	bne _0206745E
	ldr r0, [sp]
	cmp r0, #0
	beq _02067458
	add sp, #0xc
	mov r0, #5
	pop {r4, r5, r6, r7, pc}
_02067458:
	add sp, #0xc
	mov r0, #2
	pop {r4, r5, r6, r7, pc}
_0206745E:
	cmp r0, #0x64
	bhs _02067468
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_02067468:
	cmp r5, #0
	beq _02067472
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_02067472:
	cmp r1, #0
	beq _0206747C
	add sp, #0xc
	mov r0, #6
	pop {r4, r5, r6, r7, pc}
_0206747C:
	mov r0, #3
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02067398

	thumb_func_start sub_02067484
sub_02067484: ; 0x02067484
	add r0, #0xa0
	ldr r0, [r0]
	ldr r2, [r1]
	ldrh r3, [r0, #0x24]
	add r2, r3, r2
	strh r2, [r0, #0x24]
	ldrh r3, [r0, #0x28]
	ldr r2, [r1, #4]
	add r2, r3, r2
	strh r2, [r0, #0x28]
	ldrh r2, [r0, #0x26]
	ldr r1, [r1, #8]
	add r1, r2, r1
	strh r1, [r0, #0x26]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02067484

	thumb_func_start sub_020674A4
sub_020674A4: ; 0x020674A4
	ldr r1, _020674AC ; =0x02E90EDD
	mul r1, r0
	add r0, r1, #1
	bx lr
	.balign 4, 0
_020674AC: .word 0x02E90EDD
	thumb_func_end sub_020674A4

	thumb_func_start sub_020674B0
sub_020674B0: ; 0x020674B0
	ldr r1, _020674B8 ; =0x5D588B65
	mul r1, r0
	add r0, r1, #1
	bx lr
	.balign 4, 0
_020674B8: .word 0x5D588B65
	thumb_func_end sub_020674B0

	thumb_func_start sub_020674BC
sub_020674BC: ; 0x020674BC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_0202C854
	bl sub_0202C7DC
	bl sub_020674B0
	add r4, r0, #0
	add r0, r5, #0
	bl Save_FrontierData_get
	add r1, r4, #0
	bl sub_0202D638
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_020674BC

	thumb_func_start sub_020674E0
sub_020674E0: ; 0x020674E0
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	bl Save_FrontierData_get
	add r6, r0, #0
	bl sub_0202D63C
	bl sub_020674B0
	add r4, r0, #0
	add r0, r6, #0
	add r1, r4, #0
	bl sub_0202D638
	add r0, r4, #0
	bl sub_020674A4
	str r0, [sp]
	add r0, r5, #0
	bl sub_0202D908
	mov r1, #0xa
	add r2, sp, #0
	bl sub_0202D308
	ldr r0, [sp]
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_020674E0

	thumb_func_start sub_0206751C
sub_0206751C: ; 0x0206751C
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r6, r0, #0
	bl Save_FrontierData_get
	add r4, r0, #0
	add r0, r6, #0
	bl sub_0202D908
	add r5, r0, #0
	add r0, r4, #0
	bl sub_0202D63C
	bl sub_020674A4
	mov r1, #0
	str r0, [sp]
	add r0, r5, #0
	add r2, r1, #0
	bl sub_0202D284
	add r1, r0, #0
	lsl r1, r1, #0x10
	add r0, r4, #0
	lsr r1, r1, #0x10
	mov r2, #0
	bl sub_0202D57C
	mov r1, #0x18
	add r5, r0, #0
	mul r5, r1
	mov r4, #0
	cmp r5, #0
	ble _0206756E
	ldr r0, [sp]
_02067562:
	bl sub_020674A4
	add r4, r4, #1
	str r0, [sp]
	cmp r4, r5
	blt _02067562
_0206756E:
	add r0, r6, #0
	bl sub_0202D908
	mov r1, #0xa
	add r2, sp, #0
	bl sub_0202D308
	ldr r0, [sp]
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0206751C

	thumb_func_start sub_02067584
sub_02067584: ; 0x02067584
	ldr r0, [r0, #0x20]
	ldr r1, [r0]
	ldr r0, _02067598 ; =0x0000010F
	cmp r1, r0
	bne _02067592
	mov r0, #1
	bx lr
_02067592:
	mov r0, #0
	bx lr
	nop
_02067598: .word 0x0000010F
	thumb_func_end sub_02067584

	thumb_func_start sub_0206759C
sub_0206759C: ; 0x0206759C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	str r1, [sp]
	cmp r1, #0
	ble _02067606
	bl sub_0202C9D8
	bl sub_0202CA10
	add r4, r0, #0
	add r0, r5, #0
	bl Sav2_PlayerData_GetProfileAddr
	add r7, r0, #0
	ldr r0, [sp]
	mov r1, #0xa
	add r6, r0, #0
	mov r5, #0
	mul r6, r1
_020675C2:
	add r0, r7, #0
	add r1, r5, #0
	bl PlayerProfile_TestBadgeFlag
	cmp r0, #0
	beq _020675FC
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0202CA14
	add r1, r0, #0
	cmp r1, #0
	ble _020675E4
	cmp r1, #0xc8
	bge _020675E4
	sub r1, r1, r6
	b _020675EE
_020675E4:
	cmp r1, #0xc8
	blt _020675EC
	bl GF_AssertFail
_020675EC:
	mov r1, #0
_020675EE:
	cmp r1, #0
	bge _020675F4
	mov r1, #0
_020675F4:
	add r0, r5, #0
	add r2, r4, #0
	bl sub_0202CA1C
_020675FC:
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #8
	blo _020675C2
_02067606:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0206759C

	thumb_func_start sub_02067608
sub_02067608: ; 0x02067608
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0202D9F4
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02067830
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02067608

	thumb_func_start sub_02067620
sub_02067620: ; 0x02067620
	push {r3, r4, r5, lr}
	add r4, r0, #0
	mov r5, #0
_02067626:
	add r0, r4, #0
	add r1, r5, #0
	bl sub_0202DA28
	cmp r0, #0
	beq _0206763A
	add r0, r4, #0
	add r1, r5, #0
	bl sub_02067608
_0206763A:
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #4
	blo _02067626
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02067620

	thumb_func_start sub_02067648
sub_02067648: ; 0x02067648
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r4, #0
	mov r6, #0x1c
_02067650:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0202DA28
	cmp r0, #0
	beq _0206768A
	bl LCRandom
	lsr r1, r0, #0x1f
	lsl r0, r0, #0x1c
	sub r0, r0, r1
	ror r0, r6
	add r0, r1, r0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bne _0206767A
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02067608
	b _0206768A
_0206767A:
	add r0, r5, #0
	bl sub_0202D9F4
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02067884
_0206768A:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #4
	blo _02067650
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02067648

	thumb_func_start sub_02067698
sub_02067698: ; 0x02067698
	push {r4, lr}
	add r4, r0, #0
	cmp r4, #0x29
	blo _020676A4
	bl GF_AssertFail
_020676A4:
	ldr r0, _020676AC ; =_020FE4B8
	lsl r1, r4, #2
	ldr r0, [r0, r1]
	pop {r4, pc}
	.balign 4, 0
_020676AC: .word _020FE4B8
	thumb_func_end sub_02067698

	thumb_func_start sub_020676B0
sub_020676B0: ; 0x020676B0
	push {r3, r4, r5, lr}
	add r4, r0, #0
	mov r5, #0
_020676B6:
	add r0, r4, #0
	add r1, r5, #0
	bl sub_0202DA28
	cmp r0, #0
	beq _020676C6
	mov r0, #1
	pop {r3, r4, r5, pc}
_020676C6:
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #4
	blo _020676B6
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_020676B0

	thumb_func_start sub_020676D4
sub_020676D4: ; 0x020676D4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_020676B0
	cmp r0, #0
	beq _020676EA
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0202D9E8
_020676EA:
	pop {r3, r4, r5, pc}
	thumb_func_end sub_020676D4

	thumb_func_start sub_020676EC
sub_020676EC: ; 0x020676EC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	str r1, [sp, #0x10]
	add r7, r0, #0
	bl sub_0202D9C4
	ldr r1, [sp, #0x10]
	str r0, [sp, #0x14]
	bl sub_0202DA54
	add r4, r0, #0
	ldr r0, [sp, #0x10]
	cmp r0, #3
	bhi _02067736
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02067714: ; jump table
	.short _0206771C - _02067714 - 2 ; case 0
	.short _02067722 - _02067714 - 2 ; case 1
	.short _02067728 - _02067714 - 2 ; case 2
	.short _02067730 - _02067714 - 2 ; case 3
_0206771C:
	mov r6, #0xf3
	mov r5, #0x28
	b _0206773E
_02067722:
	mov r6, #0xf4
	mov r5, #0x28
	b _0206773E
_02067728:
	mov r6, #0x5f
	lsl r6, r6, #2
	mov r5, #0x23
	b _0206773E
_02067730:
	ldr r6, _020677F0 ; =0x0000017D
	mov r5, #0x23
	b _0206773E
_02067736:
	bl GF_AssertFail
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
_0206773E:
	add r0, r4, #0
	mov r1, #4
	add r2, r6, #0
	bl sub_0202DAB8
	add r0, r4, #0
	mov r1, #6
	add r2, r5, #0
	bl sub_0202DAB8
	add r0, r7, #0
	bl Sav2_PlayerData_GetProfileAddr
	str r0, [sp, #0x18]
	mov r0, #4
	bl AllocMonZeroed
	add r7, r0, #0
	bl ZeroMonData
	ldr r0, [sp, #0x18]
	bl PlayerProfile_GetTrainerID_VisibleHalf
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	mov r1, #1
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	add r0, r7, #0
	add r1, r6, #0
	add r2, r5, #0
	mov r3, #0x20
	bl CreateMon
	add r0, r4, #0
	mov r1, #7
	mov r2, #0
	bl sub_0202DAB8
	add r0, r4, #0
	mov r1, #8
	mov r2, #1
	bl sub_0202DAB8
	add r0, r7, #0
	mov r1, #0xaf
	mov r2, #0
	bl GetMonData
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #2
	bl sub_0202DAB8
	mov r1, #0
	add r0, r7, #0
	add r2, r1, #0
	bl GetMonData
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #3
	bl sub_0202DAB8
	add r0, r7, #0
	mov r1, #0xa4
	mov r2, #0
	bl GetMonData
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #5
	bl sub_0202DAB8
	add r0, r7, #0
	bl FreeToHeap
	ldr r0, [sp, #0x14]
	bl sub_0202D9F4
	add r2, r0, #0
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x10]
	bl sub_02067830
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_020677F0: .word 0x0000017D
	thumb_func_end sub_020676EC

	thumb_func_start sub_020677F4
sub_020677F4: ; 0x020677F4
	push {r3, lr}
	mov r1, #0x5f
	lsl r1, r1, #2
	cmp r0, r1
	bgt _02067810
	bge _02067824
	cmp r0, #0xf4
	bgt _02067828
	cmp r0, #0xf3
	blt _02067828
	beq _02067818
	cmp r0, #0xf4
	beq _0206781C
	b _02067828
_02067810:
	add r1, r1, #1
	cmp r0, r1
	beq _02067820
	b _02067828
_02067818:
	mov r0, #0
	pop {r3, pc}
_0206781C:
	mov r0, #1
	pop {r3, pc}
_02067820:
	mov r0, #3
	pop {r3, pc}
_02067824:
	mov r0, #2
	pop {r3, pc}
_02067828:
	bl GF_AssertFail
	mov r0, #4
	pop {r3, pc}
	thumb_func_end sub_020677F4

	thumb_func_start sub_02067830
sub_02067830: ; 0x02067830
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r0, [sp]
	str r1, [sp, #4]
	add r7, r2, #0
	bl sub_0202D9F8
	lsl r1, r0, #2
	ldr r0, _02067880 ; =_020FE4B8
	ldr r6, [r0, r1]
	ldr r0, [sp, #4]
	cmp r0, #1
	bhi _02067850
	mov r4, #0x10
	mov r5, #0
	b _02067854
_02067850:
	mov r4, #0x19
	mov r5, #0x10
_02067854:
	bl LCRandom
	add r1, r4, #0
	bl _s32_div_f
	add r0, r5, r1
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	ldr r0, _02067880 ; =_020FE4B8
	lsl r1, r2, #2
	ldr r3, [r0, r1]
	cmp r3, r7
	beq _02067854
	cmp r3, r6
	beq _02067854
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl sub_02067914
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02067880: .word _020FE4B8
	thumb_func_end sub_02067830

	thumb_func_start sub_02067884
sub_02067884: ; 0x02067884
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r0, [sp]
	str r1, [sp, #4]
	add r6, r2, #0
	bl sub_0202D9F8
	mov r1, #0xe
	ldr r2, _0206790C ; =_020FE55C
	mul r1, r0
	ldrh r0, [r2, r1]
	add r4, r2, r1
	cmp r0, #1
	bne _020678CA
	ldrh r0, [r4, #2]
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	ldr r0, _02067910 ; =_020FE4B8
	lsl r1, r2, #2
	ldr r3, [r0, r1]
	cmp r3, r6
	bne _020678BE
	ldr r0, [sp]
	ldr r1, [sp, #4]
	add r2, r6, #0
	bl sub_02067830
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_020678BE:
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl sub_02067914
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_020678CA:
	ldr r7, _02067910 ; =_020FE4B8
_020678CC:
	ldrh r5, [r4]
	cmp r5, #0
	bne _020678D6
	bl GF_AssertFail
_020678D6:
	cmp r5, #1
	bhi _020678DE
	mov r0, #0
	b _020678EC
_020678DE:
	bl LCRandom
	add r1, r5, #0
	bl _s32_div_f
	lsl r0, r1, #0x10
	lsr r0, r0, #0x10
_020678EC:
	lsl r0, r0, #0x18
	lsr r0, r0, #0x17
	add r0, r4, r0
	ldrh r0, [r0, #2]
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	lsl r0, r2, #2
	ldr r3, [r7, r0]
	cmp r3, r6
	beq _020678CC
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl sub_02067914
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0206790C: .word _020FE55C
_02067910: .word _020FE4B8
	thumb_func_end sub_02067884

	thumb_func_start sub_02067914
sub_02067914: ; 0x02067914
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	bl sub_0202DA54
	str r0, [sp]
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl sub_0202DA10
	ldr r0, [sp]
	mov r1, #1
	add r2, r7, #0
	bl sub_0202DAB8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02067914

	thumb_func_start sub_0206793C
sub_0206793C: ; 0x0206793C
	push {r4, lr}
	add r4, r0, #0
	bl sub_0205064C
	add r0, r4, #0
	bl sub_02050650
	add r2, r0, #0
	ldr r1, _02067958 ; =_020FE79C
	add r0, r4, #0
	add r2, #0xc
	bl sub_02050624
	pop {r4, pc}
	.balign 4, 0
_02067958: .word _020FE79C
	thumb_func_end sub_0206793C

	thumb_func_start sub_0206795C
sub_0206795C: ; 0x0206795C
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	bl sub_0205064C
	add r6, r0, #0
	add r0, r5, #0
	bl sub_02050650
	add r4, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #6
	bhi _02067A16
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02067982: ; jump table
	.short _02067990 - _02067982 - 2 ; case 0
	.short _020679B8 - _02067982 - 2 ; case 1
	.short _020679C6 - _02067982 - 2 ; case 2
	.short _020679D4 - _02067982 - 2 ; case 3
	.short _020679E2 - _02067982 - 2 ; case 4
	.short _020679F0 - _02067982 - 2 ; case 5
	.short _020679FE - _02067982 - 2 ; case 6
_02067990:
	ldr r0, [r4, #0x24]
	add r3, r4, #0
	str r0, [sp]
	ldr r0, [r4, #0x28]
	add r3, #0xc
	str r0, [sp, #4]
	ldr r1, [r4]
	ldr r2, [r4, #8]
	add r0, r6, #0
	bl ov23_02259B88
	ldr r1, [r4]
	ldr r2, [r4, #8]
	add r0, r6, #0
	bl ov23_02259B68
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _02067A16
_020679B8:
	add r0, r5, #0
	bl sub_020552E8
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _02067A16
_020679C6:
	add r0, r5, #0
	bl sub_0205525C
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _02067A16
_020679D4:
	add r0, r5, #0
	bl sub_0206793C
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _02067A16
_020679E2:
	add r0, r5, #0
	bl sub_020552A4
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _02067A16
_020679F0:
	add r0, r5, #0
	bl sub_0205532C
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _02067A16
_020679FE:
	ldr r0, [r4, #0x24]
	bl FreeToHeap
	ldr r0, [r4, #0x28]
	bl FreeToHeap
	add r0, r4, #0
	bl FreeToHeap
	add sp, #8
	mov r0, #1
	pop {r4, r5, r6, pc}
_02067A16:
	mov r0, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0206795C

	thumb_func_start sub_02067A1C
sub_02067A1C: ; 0x02067A1C
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r5, r1, #0
	add r0, r3, #0
	mov r1, #0x2c
	add r6, r2, #0
	str r3, [sp]
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x2c
	add r4, r0, #0
	bl memset
	mov r0, #0
	str r0, [r4, #4]
	str r5, [r4]
	ldr r0, [sp]
	str r6, [r4, #8]
	bl AllocMonZeroed
	str r0, [r4, #0x24]
	ldr r0, [sp]
	bl AllocMonZeroed
	str r0, [r4, #0x28]
	ldr r1, _02067A5C ; =sub_0206795C
	add r0, r7, #0
	add r2, r4, #0
	bl sub_02050530
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02067A5C: .word sub_0206795C
	thumb_func_end sub_02067A1C

	thumb_func_start sub_02067A60
sub_02067A60: ; 0x02067A60
	push {r4, lr}
	mov r1, #0x24
	bl AllocFromHeap
	add r4, r0, #0
	mov r0, #0
	add r1, r4, #0
	mov r2, #0x24
	bl MIi_CpuClearFast
	add r0, r4, #0
	pop {r4, pc}
	thumb_func_end sub_02067A60

	thumb_func_start sub_02067A78
sub_02067A78: ; 0x02067A78
	ldr r3, _02067A7C ; =FreeToHeap
	bx r3
	.balign 4, 0
_02067A7C: .word FreeToHeap
	thumb_func_end sub_02067A78

	thumb_func_start sub_02067A80
sub_02067A80: ; 0x02067A80
	add r0, #0xac
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02067A80

	thumb_func_start sub_02067A88
sub_02067A88: ; 0x02067A88
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	bl SavArray_Flags_get
	mov r1, #0
	bl sub_020668C0
	ldr r1, [r5, #0x20]
	add r0, r5, #0
	ldr r1, [r1]
	bl sub_0203BB70
	ldr r0, [r5, #0xc]
	bl sub_0202D9C4
	mov r1, #0
	bl sub_0202DB18
	add r0, r5, #0
	mov r1, #0
	add r0, #0x7e
	strh r1, [r0]
	add r0, r5, #0
	add r0, #0x7c
	strh r1, [r0]
	ldr r0, [r5, #0xc]
	bl SavArray_Flags_get
	bl sub_02066860
	cmp r0, #0
	bne _02067AE0
	ldr r0, [r5, #0xc]
	bl sub_0202D9C4
	ldr r1, [r5, #0x20]
	add r4, r0, #0
	ldr r1, [r1]
	bl sub_020676D4
	add r0, r4, #0
	bl sub_02067648
_02067AE0:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02067A88

	thumb_func_start sub_02067AE4
sub_02067AE4: ; 0x02067AE4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0xac
	ldr r0, [r0]
	cmp r0, #1
	beq _02067B84
	ldr r0, [r5, #0xc]
	bl SavArray_Flags_get
	bl sub_020668B0
	ldr r0, [r5, #0xc]
	bl SavArray_Flags_get
	mov r1, #0
	bl sub_020668C0
	ldr r1, [r5, #0x20]
	add r0, r5, #0
	ldr r1, [r1]
	bl sub_0203BB70
	ldr r0, [r5, #0xc]
	bl sub_0202D9C4
	mov r1, #0
	bl sub_0202DB18
	add r0, r5, #0
	mov r1, #0
	add r0, #0x7e
	strh r1, [r0]
	add r0, r5, #0
	add r0, #0x7c
	strh r1, [r0]
	ldr r0, [r5, #0xc]
	bl sub_0202D9C4
	ldr r1, [r5, #0x20]
	ldr r1, [r1]
	bl sub_020676D4
	ldr r0, [r5, #0x20]
	ldr r0, [r0]
	bl MapHeader_IsCave
	cmp r0, #0
	bne _02067B56
	ldr r0, [r5, #0xc]
	bl SavArray_Flags_get
	add r4, r0, #0
	bl sub_020668E0
	add r0, r4, #0
	bl sub_02066910
_02067B56:
	ldr r0, [r5, #0xc]
	bl sub_0203B9C4
	bl sub_0203B9B4
	add r4, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #1
	bne _02067B7A
	ldr r0, [r5, #0x20]
	ldr r0, [r0]
	bl MapHeader_IsBikeAllowed
	cmp r0, #0
	bne _02067B7A
	mov r0, #0
	str r0, [r4, #4]
	pop {r3, r4, r5, pc}
_02067B7A:
	ldr r0, [r4, #4]
	cmp r0, #2
	bne _02067B84
	mov r0, #0
	str r0, [r4, #4]
_02067B84:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02067AE4

	thumb_func_start sub_02067B88
sub_02067B88: ; 0x02067B88
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	bl SavArray_Flags_get
	bl sub_02066850
	ldr r0, [r4, #0xc]
	bl sub_0202D9C4
	bl sub_02067620
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02067B88

	thumb_func_start sub_02067BA4
sub_02067BA4: ; 0x02067BA4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	bl SavArray_Flags_get
	bl sub_02066850
	ldr r0, [r4, #0xc]
	bl sub_0202D9C4
	bl sub_02067620
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02067BA4

	thumb_func_start sub_02067BC0
sub_02067BC0: ; 0x02067BC0
	push {r3, lr}
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl sub_02066850
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02067BC0

	thumb_func_start sub_02067BD0
sub_02067BD0: ; 0x02067BD0
	push {r4, lr}
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	add r4, r0, #0
	bl sub_02066634
	add r0, r4, #0
	mov r1, #0
	bl sub_02066AC0
	pop {r4, pc}
	thumb_func_end sub_02067BD0

	thumb_func_start sub_02067BE8
sub_02067BE8: ; 0x02067BE8
	push {r3, lr}
	ldr r0, [r0, #0xc]
	bl sub_0202D9C4
	bl sub_02067620
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02067BE8

	thumb_func_start sub_02067BF8
sub_02067BF8: ; 0x02067BF8
	push {r4, r5, r6, lr}
	add r5, r1, #0
	mov r1, #0x1c
	add r4, r2, #0
	add r6, r3, #0
	bl AllocFromHeapAtEnd
	add r3, r0, #0
	mov r2, #0x1c
	mov r1, #0
_02067C0C:
	strb r1, [r3]
	add r3, r3, #1
	sub r2, r2, #1
	bne _02067C0C
	str r5, [r0]
	str r4, [r0, #0x10]
	add r2, sp, #0
	ldrh r1, [r2, #0x10]
	strh r1, [r0, #8]
	mov r1, #0x14
	ldrsh r1, [r2, r1]
	strh r1, [r0, #0xa]
	mov r1, #0x18
	ldrsh r1, [r2, r1]
	strh r1, [r0, #0xc]
	strh r6, [r0, #0xe]
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02067BF8

	thumb_func_start sub_02067C30
sub_02067C30: ; 0x02067C30
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r6, r0, #0
	bl sub_0205064C
	add r5, r0, #0
	add r0, r6, #0
	bl sub_02050650
	add r4, r0, #0
	ldrh r0, [r4, #4]
	cmp r0, #6
	bls _02067C4C
	b _02067DE4
_02067C4C:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02067C58: ; jump table
	.short _02067C66 - _02067C58 - 2 ; case 0
	.short _02067C78 - _02067C58 - 2 ; case 1
	.short _02067CF2 - _02067C58 - 2 ; case 2
	.short _02067D1E - _02067C58 - 2 ; case 3
	.short _02067D2E - _02067C58 - 2 ; case 4
	.short _02067D44 - _02067C58 - 2 ; case 5
	.short _02067D8C - _02067C58 - 2 ; case 6
_02067C66:
	ldr r1, _02067DEC ; =0x02205A61
	add r0, r6, #0
	mov r2, #0
	bl sub_02050530
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _02067DE4
_02067C78:
	ldr r0, [r5, #0x40]
	bl sub_0205C700
	sub r0, r0, #1
	cmp r0, #1
	bhi _02067C8E
	mov r0, #4
	strh r0, [r4, #4]
	mov r0, #0
	strh r0, [r4, #6]
	b _02067DE4
_02067C8E:
	ldr r0, [r5, #0xc]
	bl SavArray_PlayerParty_get
	bl GetIdxOfFirstAliveMonInParty_CrashIfNone
	ldrh r1, [r4, #0xe]
	cmp r1, r0
	beq _02067CAE
	ldr r0, [r4]
	bl ov01_02205D68
	mov r0, #4
	strh r0, [r4, #4]
	mov r0, #0
	strh r0, [r4, #6]
	b _02067DE4
_02067CAE:
	add r0, r5, #0
	bl sub_02069FB0
	cmp r0, #0
	beq _02067CE8
	add r0, r5, #0
	mov r1, #2
	bl ov02_02250780
	cmp r0, #0
	beq _02067CD4
	mov r0, #0x42
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	mov r6, #2
	bl sub_0206A1F4
	b _02067CD6
_02067CD4:
	mov r6, #1
_02067CD6:
	add r0, r5, #0
	add r1, r6, #0
	bl ov02_022507B4
	mov r0, #1
	strh r0, [r4, #6]
	mov r0, #2
	strh r0, [r4, #4]
	b _02067DE4
_02067CE8:
	mov r0, #4
	strh r0, [r4, #4]
	mov r0, #0
	strh r0, [r4, #6]
	b _02067DE4
_02067CF2:
	ldr r0, [r4, #0x10]
	mov r1, #5
	mov r2, #0
	bl GetMonData
	add r5, r0, #0
	ldr r0, [r4, #0x10]
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	add r1, r0, #0
	lsl r0, r5, #0x10
	lsl r1, r1, #0x18
	lsr r0, r0, #0x10
	lsr r1, r1, #0x18
	bl PlayCry
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _02067DE4
_02067D1E:
	bl sub_02006360
	cmp r0, #0
	bne _02067DE4
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _02067DE4
_02067D2E:
	ldr r0, [r5, #0x40]
	bl sub_0205C6DC
	ldr r1, _02067DF0 ; =_020FE7AC
	bl sub_02062214
	str r0, [r4, #0x18]
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _02067DE4
_02067D44:
	ldr r0, [r4, #0x18]
	bl sub_02062260
	cmp r0, #0
	beq _02067DE4
	ldr r0, [r4, #0x18]
	bl sub_0206226C
	ldrh r0, [r4, #6]
	cmp r0, #0
	ldr r0, [r4]
	bne _02067D70
	ldr r0, [r0, #0x40]
	bl sub_0205C724
	add r3, r0, #0
	ldr r0, [r4]
	ldr r2, [r4, #0x10]
	mov r1, #1
	bl ov02_02249458
	b _02067D82
_02067D70:
	ldr r0, [r0, #0x40]
	bl sub_0205C724
	add r3, r0, #0
	ldr r0, [r4]
	ldr r2, [r4, #0x10]
	mov r1, #2
	bl ov02_02249458
_02067D82:
	str r0, [r4, #0x14]
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _02067DE4
_02067D8C:
	ldr r0, [r4, #0x14]
	bl ov02_0224953C
	cmp r0, #0
	beq _02067DE4
	ldr r0, [r4, #0x14]
	bl ov02_02249548
	ldr r0, [r5, #0xc]
	bl sub_0203B9C4
	add r7, r0, #0
	ldrh r0, [r4, #8]
	bl sub_0203BB50
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	bne _02067DB4
	bl GF_AssertFail
_02067DB4:
	add r0, r5, #0
	add r1, sp, #8
	bl sub_0203BA74
	add r0, r7, #0
	bl sub_0203B964
	add r1, r0, #0
	add r0, r5, #0
	bl sub_0203BAE8
	ldr r0, [sp, #0x14]
	mov r2, #1
	str r0, [sp]
	str r2, [sp, #4]
	ldr r1, [sp, #8]
	ldr r3, [sp, #0x10]
	add r0, r6, #0
	sub r2, r2, #2
	bl sub_02053908
	add r0, r4, #0
	bl FreeToHeap
_02067DE4:
	mov r0, #0
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_02067DEC: .word 0x02205A61
_02067DF0: .word _020FE7AC
	thumb_func_end sub_02067C30

	thumb_func_start sub_02067DF4
sub_02067DF4: ; 0x02067DF4
	cmp r0, #0
	bne _02067E00
	ldr r0, _02067E08 ; =_020FE7BC
	lsl r1, r1, #3
	ldr r0, [r0, r1]
	bx lr
_02067E00:
	ldr r0, _02067E0C ; =_020FE7BC + 4
	lsl r1, r1, #3
	ldr r0, [r0, r1]
	bx lr
	.balign 4, 0
_02067E08: .word _020FE7BC
_02067E0C: .word _020FE7BC + 4
	thumb_func_end sub_02067DF4

	thumb_func_start sub_02067E10
sub_02067E10: ; 0x02067E10
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r4, r1, #0
	str r5, [r4, #4]
	ldr r1, [r5, #0x20]
	ldr r1, [r1]
	str r1, [r4]
	mov r1, #0
	strh r1, [r4, #0xc]
	add r1, sp, #8
	bl sub_0203DBF8
	ldr r0, [sp, #8]
	str r0, [r4, #8]
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _02067E62
	bl sub_0205F25C
	cmp r0, #0x54
	beq _02067E46
	cmp r0, #0x55
	beq _02067E50
	cmp r0, #0x56
	beq _02067E5A
	b _02067E62
_02067E46:
	ldrh r1, [r4, #0xc]
	mov r0, #8
	orr r0, r1
	strh r0, [r4, #0xc]
	b _02067E62
_02067E50:
	ldrh r1, [r4, #0xc]
	mov r0, #0x10
	orr r0, r1
	strh r0, [r4, #0xc]
	b _02067E62
_02067E5A:
	ldrh r1, [r4, #0xc]
	mov r0, #1
	orr r0, r1
	strh r0, [r4, #0xc]
_02067E62:
	ldr r0, [r5, #0x40]
	bl sub_0205C67C
	str r0, [sp, #4]
	ldr r0, [r5, #0x40]
	bl sub_0205C688
	add r2, r0, #0
	ldr r1, [sp, #4]
	str r2, [sp]
	add r0, r5, #0
	bl sub_02054918
	add r7, r0, #0
	ldr r0, [r5, #0x40]
	add r1, sp, #4
	add r2, sp, #0
	bl sub_0205E02C
	ldr r1, [sp, #4]
	ldr r2, [sp]
	add r0, r5, #0
	bl sub_02054918
	add r6, r0, #0
	ldr r0, [r5, #0x40]
	add r1, r7, #0
	add r2, r6, #0
	bl ov01_021F20C0
	cmp r0, #0
	beq _02067EAA
	ldrh r1, [r4, #0xc]
	mov r0, #4
	orr r0, r1
	strh r0, [r4, #0xc]
_02067EAA:
	ldr r0, [r5, #0x40]
	bl sub_0205C654
	add r1, r0, #0
	add r0, r6, #0
	bl ov01_021F25E8
	cmp r0, #0
	beq _02067EC4
	ldrh r1, [r4, #0xc]
	mov r0, #0x40
	orr r0, r1
	strh r0, [r4, #0xc]
_02067EC4:
	lsl r0, r6, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B8DC
	cmp r0, #0
	beq _02067ED8
	ldrh r1, [r4, #0xc]
	mov r0, #0x20
	orr r0, r1
	strh r0, [r4, #0xc]
_02067ED8:
	lsl r0, r6, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B8E8
	cmp r0, #0
	beq _02067EEE
	ldrh r1, [r4, #0xc]
	mov r0, #1
	lsl r0, r0, #0xc
	orr r0, r1
	strh r0, [r4, #0xc]
_02067EEE:
	ldr r0, [r5, #0xc]
	bl sub_0203B9C4
	bl sub_0203B984
	cmp r0, #0xb
	bne _02067F04
	ldrh r1, [r4, #0xc]
	mov r0, #0x80
	orr r0, r1
	strh r0, [r4, #0xc]
_02067F04:
	lsl r0, r6, #0x18
	lsr r0, r0, #0x18
	bl sub_0205BAF8
	cmp r0, #0
	bne _02067F1A
	add r0, r5, #0
	bl ov01_021E7FA8
	cmp r0, #0
	beq _02067F24
_02067F1A:
	ldrh r1, [r4, #0xc]
	mov r0, #2
	lsl r0, r0, #0xc
	orr r0, r1
	strh r0, [r4, #0xc]
_02067F24:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end sub_02067E10

	thumb_func_start sub_02067F28
sub_02067F28: ; 0x02067F28
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #0x20
	mov r1, #0x10
	bl AllocFromHeap
	ldr r1, _02067F48 ; =0x19740205
	str r1, [r0]
	ldr r1, [r4, #8]
	str r1, [r0, #4]
	ldr r2, [r5]
	ldr r1, [r5, #4]
	str r2, [r0, #8]
	str r1, [r0, #0xc]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02067F48: .word 0x19740205
	thumb_func_end sub_02067F28

	thumb_func_start sub_02067F4C
sub_02067F4C: ; 0x02067F4C
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4]
	ldr r0, _02067F64 ; =0x19740205
	cmp r1, r0
	beq _02067F5C
	bl GF_AssertFail
_02067F5C:
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
_02067F64: .word 0x19740205
	thumb_func_end sub_02067F4C

	thumb_func_start sub_02067F68
sub_02067F68: ; 0x02067F68
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #4]
	ldr r0, [r1, #0x70]
	sub r0, r0, #2
	cmp r0, #1
	bhi _02067F7A
	mov r0, #1
	pop {r4, pc}
_02067F7A:
	ldr r0, [r1, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	mov r1, #1
	bl PlayerProfile_TestBadgeFlag
	cmp r0, #0
	bne _02067F8E
	mov r0, #2
	pop {r4, pc}
_02067F8E:
	ldrh r1, [r4, #0xc]
	mov r0, #1
	tst r1, r0
	beq _02067F98
	mov r0, #0
_02067F98:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02067F68

	thumb_func_start sub_02067F9C
sub_02067F9C: ; 0x02067F9C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r6, r1, #0
	bl sub_02050650
	add r4, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	bl sub_02067F28
	add r5, r0, #0
	ldr r0, [r6, #4]
	bl sub_020505C0
	mov r0, #0xd5
	ldr r1, _02067FCC ; =sub_02067FD0
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, #0x2c
	str r5, [r4, r0]
	mov r0, #0xc
	strh r0, [r4, #0x26]
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02067FCC: .word sub_02067FD0
	thumb_func_end sub_02067F9C

	thumb_func_start sub_02067FD0
sub_02067FD0: ; 0x02067FD0
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	bl sub_02050650
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0205064C
	add r6, r0, #0
	ldr r1, _02068008 ; =0x00002717
	ldr r2, [r4, #4]
	add r0, r5, #0
	bl sub_0203FF0C
	mov r2, #0
	str r2, [sp]
	ldrh r1, [r4, #0xc]
	add r0, r6, #0
	add r3, r2, #0
	bl sub_02040490
	add r0, r4, #0
	bl sub_02067F4C
	mov r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_02068008: .word 0x00002717
	thumb_func_end sub_02067FD0

	thumb_func_start sub_0206800C
sub_0206800C: ; 0x0206800C
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #4]
	ldr r0, [r1, #0x70]
	sub r0, r0, #2
	cmp r0, #1
	bhi _0206801E
	mov r0, #1
	pop {r4, pc}
_0206801E:
	ldr r0, [r1, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	mov r1, #4
	bl PlayerProfile_TestBadgeFlag
	cmp r0, #0
	bne _02068032
	mov r0, #2
	pop {r4, pc}
_02068032:
	ldr r0, [r4]
	bl MapHeader_IsFlyAllowed
	cmp r0, #0
	bne _02068040
	mov r0, #1
	pop {r4, pc}
_02068040:
	ldr r0, [r4, #4]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl sub_02066644
	cmp r0, #1
	bne _02068054
	mov r0, #3
	pop {r4, pc}
_02068054:
	ldr r0, [r4, #4]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl sub_020666B4
	cmp r0, #1
	bne _02068068
	mov r0, #5
	pop {r4, pc}
_02068068:
	ldr r0, [r4, #4]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl sub_02066860
	cmp r0, #1
	beq _02068088
	ldr r0, [r4, #4]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl sub_020668A0
	cmp r0, #1
	bne _0206808C
_02068088:
	mov r0, #1
	b _0206808E
_0206808C:
	mov r0, #0
_0206808E:
	cmp r0, #1
	bne _02068096
	mov r0, #1
	pop {r4, pc}
_02068096:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0206800C

	thumb_func_start sub_0206809C
sub_0206809C: ; 0x0206809C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5]
	bl sub_0205064C
	add r6, r0, #0
	ldr r0, [r5]
	bl sub_02050650
	add r4, r0, #0
	mov r0, #0xb
	mov r1, #4
	bl AllocFromHeap
	ldrh r1, [r5, #4]
	str r1, [r0]
	mov r1, #0xe1
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r0, r6, #0
	mov r1, #0
	bl Radio_new
	mov r1, #0xe
	lsl r1, r1, #6
	str r0, [r4, r1]
	ldr r1, _020680DC ; =sub_0203D758
	add r0, r4, #0
	bl sub_0203C8F0
	pop {r4, r5, r6, pc}
	nop
_020680DC: .word sub_0203D758
	thumb_func_end sub_0206809C

	thumb_func_start sub_020680E0
sub_020680E0: ; 0x020680E0
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #4]
	ldr r0, [r1, #0x70]
	sub r0, r0, #2
	cmp r0, #1
	bhi _020680F2
	mov r0, #1
	pop {r4, pc}
_020680F2:
	ldr r0, [r1, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	mov r1, #3
	bl PlayerProfile_TestBadgeFlag
	cmp r0, #0
	bne _02068106
	mov r0, #2
	pop {r4, pc}
_02068106:
	ldr r0, [r4, #4]
	ldr r0, [r0, #0x40]
	bl sub_0205C700
	cmp r0, #2
	bne _02068116
	mov r0, #4
	pop {r4, pc}
_02068116:
	ldrh r1, [r4, #0xc]
	mov r0, #4
	tst r0, r1
	bne _02068122
	mov r0, #1
	pop {r4, pc}
_02068122:
	ldr r0, [r4, #4]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl sub_02066644
	cmp r0, #1
	bne _02068136
	mov r0, #3
	pop {r4, pc}
_02068136:
	ldr r0, [r4, #4]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl sub_020666B4
	cmp r0, #1
	bne _0206814A
	mov r0, #5
	pop {r4, pc}
_0206814A:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020680E0

	thumb_func_start sub_02068150
sub_02068150: ; 0x02068150
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r6, r1, #0
	bl sub_02050650
	add r4, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	bl sub_02067F28
	add r5, r0, #0
	ldr r0, [r6, #4]
	bl sub_020505C0
	mov r0, #0xd5
	ldr r1, _02068180 ; =sub_02068184
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, #0x2c
	str r5, [r4, r0]
	mov r0, #0xc
	strh r0, [r4, #0x26]
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02068180: .word sub_02068184
	thumb_func_end sub_02068150

	thumb_func_start sub_02068184
sub_02068184: ; 0x02068184
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	bl sub_02050650
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0205064C
	add r6, r0, #0
	ldr r1, _020681BC ; =0x0000271B
	add r0, r5, #0
	mov r2, #0
	bl sub_0203FF0C
	mov r2, #0
	str r2, [sp]
	ldrh r1, [r4, #0xc]
	add r0, r6, #0
	add r3, r2, #0
	bl sub_02040490
	add r0, r4, #0
	bl sub_02067F4C
	mov r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_020681BC: .word 0x0000271B
	thumb_func_end sub_02068184

	thumb_func_start sub_020681C0
sub_020681C0: ; 0x020681C0
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #4]
	ldr r0, [r1, #0x70]
	sub r0, r0, #2
	cmp r0, #1
	bhi _020681D2
	mov r0, #1
	pop {r4, pc}
_020681D2:
	ldr r0, [r1, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	mov r1, #2
	bl PlayerProfile_TestBadgeFlag
	cmp r0, #0
	bne _020681E6
	mov r0, #2
	pop {r4, pc}
_020681E6:
	ldr r0, [r4]
	cmp r0, #0xee
	bne _020681F0
	mov r0, #1
	pop {r4, pc}
_020681F0:
	ldrh r1, [r4, #0xc]
	mov r0, #8
	tst r0, r1
	beq _020681FC
	mov r0, #0
	pop {r4, pc}
_020681FC:
	mov r0, #1
	pop {r4, pc}
	thumb_func_end sub_020681C0

	thumb_func_start sub_02068200
sub_02068200: ; 0x02068200
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r6, r1, #0
	bl sub_02050650
	add r4, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	bl sub_02067F28
	add r5, r0, #0
	ldr r0, [r6, #4]
	bl sub_020505C0
	mov r0, #0xd5
	ldr r1, _02068230 ; =sub_02068234
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, #0x2c
	str r5, [r4, r0]
	mov r0, #0xc
	strh r0, [r4, #0x26]
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02068230: .word sub_02068234
	thumb_func_end sub_02068200

	thumb_func_start sub_02068234
sub_02068234: ; 0x02068234
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	bl sub_02050650
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0205064C
	add r6, r0, #0
	ldr r1, _0206826C ; =0x00002719
	ldr r2, [r4, #4]
	add r0, r5, #0
	bl sub_0203FF0C
	mov r2, #0
	str r2, [sp]
	ldrh r1, [r4, #0xc]
	add r0, r6, #0
	add r3, r2, #0
	bl sub_02040490
	add r0, r4, #0
	bl sub_02067F4C
	mov r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_0206826C: .word 0x00002719
	thumb_func_end sub_02068234

	thumb_func_start sub_02068270
sub_02068270: ; 0x02068270
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #4]
	ldr r0, [r1, #0x70]
	sub r0, r0, #2
	cmp r0, #1
	bhi _02068282
	mov r0, #1
	pop {r4, pc}
_02068282:
	ldr r0, [r1, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	mov r1, #0
	bl PlayerProfile_TestBadgeFlag
	cmp r0, #0
	bne _02068296
	mov r0, #2
	pop {r4, pc}
_02068296:
	ldrh r1, [r4, #0xc]
	mov r0, #0x10
	tst r0, r1
	beq _020682A2
	mov r0, #0
	pop {r4, pc}
_020682A2:
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02068270

	thumb_func_start sub_020682A8
sub_020682A8: ; 0x020682A8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r6, r1, #0
	bl sub_02050650
	add r4, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	bl sub_02067F28
	add r5, r0, #0
	ldr r0, [r6, #4]
	bl sub_020505C0
	mov r0, #0xd5
	ldr r1, _020682D8 ; =sub_020682DC
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, #0x2c
	str r5, [r4, r0]
	mov r0, #0xc
	strh r0, [r4, #0x26]
	pop {r4, r5, r6, pc}
	.balign 4, 0
_020682D8: .word sub_020682DC
	thumb_func_end sub_020682A8

	thumb_func_start sub_020682DC
sub_020682DC: ; 0x020682DC
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	bl sub_02050650
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0205064C
	add r6, r0, #0
	ldr r1, _02068314 ; =0x00002718
	ldr r2, [r4, #4]
	add r0, r5, #0
	bl sub_0203FF0C
	mov r2, #0
	str r2, [sp]
	ldrh r1, [r4, #0xc]
	add r0, r6, #0
	add r3, r2, #0
	bl sub_02040490
	add r0, r4, #0
	bl sub_02067F4C
	mov r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_02068314: .word 0x00002718
	thumb_func_end sub_020682DC

	thumb_func_start sub_02068318
sub_02068318: ; 0x02068318
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #4]
	ldr r0, [r1, #0x70]
	sub r0, r0, #2
	cmp r0, #1
	bhi _0206832A
	mov r0, #1
	pop {r4, pc}
_0206832A:
	ldr r0, [r1, #0x40]
	bl sub_0205C700
	cmp r0, #2
	beq _02068338
	mov r0, #1
	pop {r4, pc}
_02068338:
	ldr r0, [r4, #4]
	ldr r0, [r0, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	mov r1, #7
	bl PlayerProfile_TestBadgeFlag
	cmp r0, #0
	bne _0206834E
	mov r0, #2
	pop {r4, pc}
_0206834E:
	ldrh r1, [r4, #0xc]
	mov r0, #0x20
	tst r0, r1
	beq _0206835A
	mov r0, #0
	pop {r4, pc}
_0206835A:
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02068318

	thumb_func_start sub_02068360
sub_02068360: ; 0x02068360
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r6, r1, #0
	bl sub_02050650
	add r4, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	bl sub_02067F28
	add r5, r0, #0
	ldr r0, [r6, #4]
	bl sub_020505C0
	mov r0, #0xd5
	ldr r1, _02068390 ; =sub_02068394
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, #0x2c
	str r5, [r4, r0]
	mov r0, #0xc
	strh r0, [r4, #0x26]
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02068390: .word sub_02068394
	thumb_func_end sub_02068360

	thumb_func_start sub_02068394
sub_02068394: ; 0x02068394
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	bl sub_02050650
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0205064C
	add r6, r0, #0
	ldr r1, _020683CC ; =0x0000271C
	add r0, r5, #0
	mov r2, #0
	bl sub_0203FF0C
	mov r2, #0
	str r2, [sp]
	ldrh r1, [r4, #0xc]
	add r0, r6, #0
	add r3, r2, #0
	bl sub_02040490
	add r0, r4, #0
	bl sub_02067F4C
	mov r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_020683CC: .word 0x0000271C
	thumb_func_end sub_02068394

	thumb_func_start sub_020683D0
sub_020683D0: ; 0x020683D0
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #4]
	ldr r0, [r1, #0x70]
	sub r0, r0, #2
	cmp r0, #1
	bhi _020683E2
	mov r0, #1
	pop {r4, pc}
_020683E2:
	ldr r0, [r1, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	mov r1, #0xf
	bl PlayerProfile_TestBadgeFlag
	cmp r0, #0
	bne _020683F6
	mov r0, #2
	pop {r4, pc}
_020683F6:
	ldrh r1, [r4, #0xc]
	mov r0, #0x40
	tst r0, r1
	bne _02068402
	mov r0, #1
	pop {r4, pc}
_02068402:
	ldr r0, [r4, #4]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl sub_02066644
	cmp r0, #1
	bne _02068416
	mov r0, #3
	pop {r4, pc}
_02068416:
	ldr r0, [r4, #4]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl sub_020666B4
	cmp r0, #1
	bne _0206842A
	mov r0, #5
	pop {r4, pc}
_0206842A:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020683D0

	thumb_func_start sub_02068430
sub_02068430: ; 0x02068430
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r6, r1, #0
	bl sub_02050650
	add r4, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	bl sub_02067F28
	add r5, r0, #0
	ldr r0, [r6, #4]
	bl sub_020505C0
	mov r0, #0xd5
	ldr r1, _02068460 ; =sub_02068464
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, #0x2c
	str r5, [r4, r0]
	mov r0, #0xc
	strh r0, [r4, #0x26]
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02068460: .word sub_02068464
	thumb_func_end sub_02068430

	thumb_func_start sub_02068464
sub_02068464: ; 0x02068464
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	bl sub_02050650
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0205064C
	add r6, r0, #0
	ldr r1, _0206849C ; =0x0000271A
	add r0, r5, #0
	mov r2, #0
	bl sub_0203FF0C
	mov r2, #0
	str r2, [sp]
	ldrh r1, [r4, #0xc]
	add r0, r6, #0
	add r3, r2, #0
	bl sub_02040490
	add r0, r4, #0
	bl sub_02067F4C
	mov r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_0206849C: .word 0x0000271A
	thumb_func_end sub_02068464

	thumb_func_start sub_020684A0
sub_020684A0: ; 0x020684A0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #4]
	ldr r1, [r0, #0x70]
	sub r1, r1, #2
	cmp r1, #1
	bhi _020684B2
	mov r0, #1
	pop {r4, pc}
_020684B2:
	bl sub_0206BD44
	cmp r0, #0
	beq _020684BE
	mov r0, #0
	pop {r4, pc}
_020684BE:
	ldrh r1, [r4, #0xc]
	mov r0, #0x80
	tst r0, r1
	beq _020684CA
	mov r0, #0
	pop {r4, pc}
_020684CA:
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020684A0

	thumb_func_start sub_020684D0
sub_020684D0: ; 0x020684D0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r6, r1, #0
	bl sub_02050650
	add r4, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	bl sub_02067F28
	add r5, r0, #0
	ldr r0, [r6, #4]
	bl sub_020505C0
	mov r0, #0xd5
	ldr r1, _02068500 ; =sub_02068504
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, #0x2c
	str r5, [r4, r0]
	mov r0, #0xc
	strh r0, [r4, #0x26]
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02068500: .word sub_02068504
	thumb_func_end sub_020684D0

	thumb_func_start sub_02068504
sub_02068504: ; 0x02068504
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	bl sub_02050650
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0205064C
	add r6, r0, #0
	bl sub_0206BD44
	cmp r0, #0
	beq _0206852C
	add r0, r5, #0
	mov r1, #3
	mov r2, #0
	bl sub_0203FF0C
	b _02068536
_0206852C:
	ldr r1, _02068550 ; =0x0000271D
	add r0, r5, #0
	mov r2, #0
	bl sub_0203FF0C
_02068536:
	mov r2, #0
	str r2, [sp]
	ldrh r1, [r4, #0xc]
	add r0, r6, #0
	add r3, r2, #0
	bl sub_02040490
	add r0, r4, #0
	bl sub_02067F4C
	mov r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_02068550: .word 0x0000271D
	thumb_func_end sub_02068504

	thumb_func_start sub_02068554
sub_02068554: ; 0x02068554
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #4]
	ldr r0, [r0, #0x70]
	sub r0, r0, #2
	cmp r0, #1
	bhi _02068566
	mov r0, #1
	pop {r4, pc}
_02068566:
	ldr r0, [r4]
	bl MapHeader_IsOutdoors
	cmp r0, #0
	bne _02068574
	mov r0, #1
	pop {r4, pc}
_02068574:
	ldr r0, [r4, #4]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl sub_02066644
	cmp r0, #1
	bne _02068588
	mov r0, #3
	pop {r4, pc}
_02068588:
	ldr r0, [r4, #4]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl sub_020666B4
	cmp r0, #1
	bne _0206859C
	mov r0, #5
	pop {r4, pc}
_0206859C:
	ldr r0, [r4, #4]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl sub_02066860
	cmp r0, #1
	beq _020685BC
	ldr r0, [r4, #4]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl sub_020668A0
	cmp r0, #1
	bne _020685C0
_020685BC:
	mov r0, #1
	b _020685C2
_020685C0:
	mov r0, #0
_020685C2:
	cmp r0, #1
	bne _020685CA
	mov r0, #1
	pop {r4, pc}
_020685CA:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02068554

	thumb_func_start sub_020685D0
sub_020685D0: ; 0x020685D0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5]
	bl sub_0205064C
	add r6, r0, #0
	ldr r0, [r5]
	bl sub_02050650
	add r4, r0, #0
	add r0, r6, #0
	bl sub_020505C0
	ldrh r1, [r5, #4]
	ldr r2, [r6, #0xc]
	mov r0, #0xb
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl sub_020689A4
	add r6, r0, #0
	mov r0, #0xb
	mov r1, #4
	bl AllocFromHeapAtEnd
	str r0, [r6, #4]
	ldrh r1, [r5, #4]
	str r1, [r0]
	mov r0, #0xd5
	ldr r1, _0206861C ; =sub_02068620
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, #0x2c
	str r6, [r4, r0]
	mov r0, #0xc
	strh r0, [r4, #0x26]
	pop {r4, r5, r6, pc}
	nop
_0206861C: .word sub_02068620
	thumb_func_end sub_020685D0

	thumb_func_start sub_02068620
sub_02068620: ; 0x02068620
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl sub_0205064C
	add r6, r0, #0
	add r0, r5, #0
	bl sub_02050650
	add r4, r0, #0
	ldr r2, [r4, #4]
	ldr r1, [r4]
	ldr r2, [r2]
	add r0, r6, #0
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	mov r3, #4
	bl ov02_0224C500
	add r6, r0, #0
	ldr r0, [r4, #4]
	bl FreeToHeap
	add r0, r4, #0
	bl FreeToHeap
	ldr r1, _02068660 ; =0x0224C559
	add r0, r5, #0
	add r2, r6, #0
	bl sub_02050510
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02068660: .word 0x0224C559
	thumb_func_end sub_02068620

	thumb_func_start sub_02068664
sub_02068664: ; 0x02068664
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #4]
	ldr r0, [r0, #0x70]
	sub r0, r0, #2
	cmp r0, #1
	bhi _02068676
	mov r0, #1
	pop {r4, pc}
_02068676:
	ldr r0, [r4]
	bl MapHeader_IsCave
	cmp r0, #1
	bne _0206868A
	ldr r0, [r4]
	bl MapHeader_IsEscapeRopeAllowed
	cmp r0, #1
	beq _0206868E
_0206868A:
	mov r0, #1
	pop {r4, pc}
_0206868E:
	ldr r0, [r4, #4]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl sub_02066644
	cmp r0, #1
	bne _020686A2
	mov r0, #3
	pop {r4, pc}
_020686A2:
	ldr r0, [r4, #4]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl sub_020666B4
	cmp r0, #1
	bne _020686B6
	mov r0, #5
	pop {r4, pc}
_020686B6:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02068664

	thumb_func_start sub_020686BC
sub_020686BC: ; 0x020686BC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5]
	bl sub_0205064C
	add r6, r0, #0
	ldr r0, [r5]
	bl sub_02050650
	add r4, r0, #0
	add r0, r6, #0
	bl sub_020505C0
	ldrh r1, [r5, #4]
	ldr r2, [r6, #0xc]
	mov r0, #0xb
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl sub_020689A4
	add r6, r0, #0
	mov r0, #0xb
	mov r1, #4
	bl AllocFromHeapAtEnd
	str r0, [r6, #4]
	ldrh r1, [r5, #4]
	str r1, [r0]
	mov r0, #0xd5
	ldr r1, _02068708 ; =sub_0206870C
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, #0x2c
	str r6, [r4, r0]
	mov r0, #0xc
	strh r0, [r4, #0x26]
	pop {r4, r5, r6, pc}
	nop
_02068708: .word sub_0206870C
	thumb_func_end sub_020686BC

	thumb_func_start sub_0206870C
sub_0206870C: ; 0x0206870C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl sub_0205064C
	add r6, r0, #0
	add r0, r5, #0
	bl sub_02050650
	add r4, r0, #0
	ldr r2, [r4, #4]
	ldr r1, [r4]
	ldr r2, [r2]
	add r0, r6, #0
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	mov r3, #0xb
	bl ov02_0224C368
	add r6, r0, #0
	ldr r0, [r4, #4]
	bl FreeToHeap
	add r0, r4, #0
	bl FreeToHeap
	ldr r1, _0206874C ; =0x0224C3AD
	add r0, r5, #0
	add r2, r6, #0
	bl sub_02050510
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0206874C: .word 0x0224C3AD
	thumb_func_end sub_0206870C

	thumb_func_start sub_02068750
sub_02068750: ; 0x02068750
	push {r3, lr}
	ldr r1, [r0, #4]
	ldr r0, [r1, #0x70]
	sub r0, r0, #2
	cmp r0, #1
	bhi _02068760
	mov r0, #1
	pop {r3, pc}
_02068760:
	ldr r0, [r1, #0xc]
	bl SavArray_Flags_get
	bl sub_020668A0
	cmp r0, #1
	bne _02068772
	mov r0, #1
	b _02068774
_02068772:
	mov r0, #0
_02068774:
	cmp r0, #1
	bne _0206877C
	mov r0, #1
	pop {r3, pc}
_0206877C:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_02068750

	thumb_func_start sub_02068780
sub_02068780: ; 0x02068780
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5]
	bl sub_0205064C
	add r7, r0, #0
	ldr r0, [r5]
	bl sub_02050650
	ldrh r1, [r5, #4]
	add r4, r0, #0
	ldr r2, [r7, #0xc]
	lsl r1, r1, #0x18
	mov r0, #0xb
	lsr r1, r1, #0x18
	bl sub_020689A4
	add r6, r0, #0
	mov r0, #0xb
	mov r1, #4
	bl AllocFromHeapAtEnd
	str r0, [r6, #4]
	ldrh r1, [r5, #4]
	str r1, [r0]
	add r0, r7, #0
	bl sub_020505C0
	mov r0, #0xd5
	ldr r1, _020687CC ; =0x021FCE99
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, #0x2c
	str r6, [r4, r0]
	mov r0, #0xc
	strh r0, [r4, #0x26]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_020687CC: .word 0x021FCE99
	thumb_func_end sub_02068780

	thumb_func_start sub_020687D0
sub_020687D0: ; 0x020687D0
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x70]
	sub r0, r0, #2
	cmp r0, #1
	bhi _020687DE
	mov r0, #1
	bx lr
_020687DE:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end sub_020687D0

	thumb_func_start sub_020687E4
sub_020687E4: ; 0x020687E4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r6, r1, #0
	bl sub_0205064C
	add r7, r0, #0
	ldr r0, [r5]
	bl sub_02050650
	add r4, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	bl sub_02067F28
	add r5, r0, #0
	add r0, r7, #0
	bl sub_020505C0
	mov r0, #0xd5
	ldr r1, _0206881C ; =sub_02068820
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, #0x2c
	str r5, [r4, r0]
	mov r0, #0xc
	strh r0, [r4, #0x26]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0206881C: .word sub_02068820
	thumb_func_end sub_020687E4

	thumb_func_start sub_02068820
sub_02068820: ; 0x02068820
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	bl sub_02050650
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0205064C
	add r6, r0, #0
	ldr r1, _02068858 ; =0x000022C4
	add r0, r5, #0
	mov r2, #0
	bl sub_0203FF0C
	mov r2, #0
	str r2, [sp]
	ldrh r1, [r4, #0xc]
	add r0, r6, #0
	add r3, r2, #0
	bl sub_02040490
	add r0, r4, #0
	bl sub_02067F4C
	mov r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_02068858: .word 0x000022C4
	thumb_func_end sub_02068820

	thumb_func_start sub_0206885C
sub_0206885C: ; 0x0206885C
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #4]
	ldr r0, [r1, #0x70]
	sub r0, r0, #2
	cmp r0, #1
	bhi _0206886E
	mov r0, #1
	pop {r4, pc}
_0206886E:
	ldr r0, [r1, #0x40]
	bl sub_0205C700
	cmp r0, #2
	beq _0206887C
	mov r0, #1
	pop {r4, pc}
_0206887C:
	ldr r0, [r4, #4]
	ldr r0, [r0, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	mov r1, #6
	bl PlayerProfile_TestBadgeFlag
	cmp r0, #0
	bne _02068892
	mov r0, #2
	pop {r4, pc}
_02068892:
	ldrh r1, [r4, #0xc]
	mov r0, #1
	lsl r0, r0, #0xc
	tst r0, r1
	beq _020688A0
	mov r0, #0
	pop {r4, pc}
_020688A0:
	mov r0, #1
	pop {r4, pc}
	thumb_func_end sub_0206885C

	thumb_func_start sub_020688A4
sub_020688A4: ; 0x020688A4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r6, r1, #0
	bl sub_02050650
	add r4, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	bl sub_02067F28
	add r5, r0, #0
	ldr r0, [r6, #4]
	bl sub_020505C0
	mov r0, #0xd5
	ldr r1, _020688D4 ; =sub_020688D8
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, #0x2c
	str r5, [r4, r0]
	mov r0, #0xc
	strh r0, [r4, #0x26]
	pop {r4, r5, r6, pc}
	.balign 4, 0
_020688D4: .word sub_020688D8
	thumb_func_end sub_020688A4

	thumb_func_start sub_020688D8
sub_020688D8: ; 0x020688D8
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	bl sub_02050650
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0205064C
	add r6, r0, #0
	ldr r1, _02068910 ; =0x00002721
	add r0, r5, #0
	mov r2, #0
	bl sub_0203FF0C
	mov r2, #0
	str r2, [sp]
	ldrh r1, [r4, #0xc]
	add r0, r6, #0
	add r3, r2, #0
	bl sub_02040490
	add r0, r4, #0
	bl sub_02067F4C
	mov r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_02068910: .word 0x00002721
	thumb_func_end sub_020688D8

	thumb_func_start sub_02068914
sub_02068914: ; 0x02068914
	ldr r1, [r0, #4]
	ldr r1, [r1, #0x70]
	sub r1, r1, #2
	cmp r1, #1
	bhi _02068922
	mov r0, #1
	bx lr
_02068922:
	ldrh r1, [r0, #0xc]
	mov r0, #2
	lsl r0, r0, #0xc
	tst r0, r1
	beq _02068930
	mov r0, #0
	bx lr
_02068930:
	mov r0, #1
	bx lr
	thumb_func_end sub_02068914

	thumb_func_start sub_02068934
sub_02068934: ; 0x02068934
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r6, r1, #0
	bl sub_02050650
	add r4, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	bl sub_02067F28
	add r5, r0, #0
	ldr r0, [r6, #4]
	bl sub_020505C0
	mov r0, #0xd5
	ldr r1, _02068964 ; =sub_02068968
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, #0x2c
	str r5, [r4, r0]
	mov r0, #0xc
	strh r0, [r4, #0x26]
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02068964: .word sub_02068968
	thumb_func_end sub_02068934

	thumb_func_start sub_02068968
sub_02068968: ; 0x02068968
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	bl sub_02050650
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0205064C
	add r6, r0, #0
	ldr r1, _020689A0 ; =0x00002722
	ldr r2, [r4, #4]
	add r0, r5, #0
	bl sub_0203FF0C
	mov r2, #0
	str r2, [sp]
	ldrh r1, [r4, #0xc]
	add r0, r6, #0
	add r3, r2, #0
	bl sub_02040490
	add r0, r4, #0
	bl sub_02067F4C
	mov r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_020689A0: .word 0x00002722
	thumb_func_end sub_02068968

	thumb_func_start sub_020689A4
sub_020689A4: ; 0x020689A4
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r6, r2, #0
	mov r1, #8
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	add r0, r6, #0
	bl SavArray_PlayerParty_get
	add r1, r5, #0
	bl GetPartyMonByIndex
	str r0, [r4]
	mov r0, #0
	str r0, [r4, #4]
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_020689A4

	thumb_func_start sub_020689C8
sub_020689C8: ; 0x020689C8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r1, #0
	bl sub_02068C08
	add r4, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	bl sub_02068C38
	str r0, [r4, #0xc]
	str r6, [r4]
	str r5, [r4, #8]
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_020689C8

	thumb_func_start sub_020689E8
sub_020689E8: ; 0x020689E8
	push {r4, lr}
	add r4, r0, #0
	bl sub_02068C5C
	add r0, r4, #0
	bl sub_02068C2C
	pop {r4, pc}
	thumb_func_end sub_020689E8

	thumb_func_start sub_020689F8
sub_020689F8: ; 0x020689F8
	push {r4, lr}
	add r4, r0, #0
	bl sub_02068B80
	add r0, r4, #0
	bl sub_020689E8
	pop {r4, pc}
	thumb_func_end sub_020689F8

	thumb_func_start sub_02068A08
sub_02068A08: ; 0x02068A08
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r0, [sp]
	add r7, r1, #0
	str r2, [sp, #4]
	str r3, [sp, #8]
	mov r4, #0
	bl sub_02068CC4
	add r6, r0, #0
	ldr r0, [sp]
	bl sub_02068CC8
	add r5, r0, #0
_02068A24:
	add r0, r5, #0
	bl sub_02068CCC
	cmp r0, #0
	beq _02068A36
	add r4, r4, #1
	add r5, #0xc8
	cmp r4, r6
	blt _02068A24
_02068A36:
	cmp r4, r6
	blt _02068A40
	add sp, #0x18
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02068A40:
	add r0, r5, #0
	bl sub_02068CD8
	ldr r1, [sp, #8]
	add r0, r5, #0
	bl sub_02068D8C
	ldr r1, [sp, #0x30]
	add r0, r5, #0
	bl sub_02068D94
	ldr r1, [sp]
	add r0, r5, #0
	bl sub_02068DA4
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _02068A6E
	ldr r1, [sp, #4]
	add r0, r5, #0
	bl sub_02068DA8
	b _02068A7E
_02068A6E:
	add r1, sp, #0xc
	mov r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	add r0, r5, #0
	bl sub_02068DA8
_02068A7E:
	ldr r1, [r7]
	add r0, r5, #0
	bl sub_02068D78
	ldr r1, [r7, #4]
	add r0, r5, #0
	bl sub_02068CF4
	ldr r1, [r7, #8]
	add r0, r5, #0
	bl sub_02068D48
	ldr r1, [r7, #0xc]
	add r0, r5, #0
	bl sub_02068D10
	ldr r1, [r7, #0x10]
	add r0, r5, #0
	bl sub_02068D2C
	ldr r1, [r7, #0x14]
	add r0, r5, #0
	bl sub_02068D64
	ldr r1, [r7, #0x18]
	add r0, r5, #0
	bl sub_02068D6C
	ldr r1, [sp, #0x34]
	add r0, r5, #0
	bl sub_02068BDC
	add r4, r0, #0
	bne _02068ACE
	add r0, r5, #0
	bl sub_02068C6C
	add sp, #0x18
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02068ACE:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02068D9C
	add r0, r5, #0
	bl sub_02068CFC
	cmp r0, #0
	bne _02068AF2
	add r0, r4, #0
	bl sub_0200E390
	add r0, r5, #0
	bl sub_02068C6C
	add sp, #0x18
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02068AF2:
	add r0, r5, #0
	mov r1, #2
	bl sub_02068CE4
	ldr r0, [sp]
	ldr r0, [r0, #4]
	add r1, r0, #1
	ldr r0, [sp]
	str r1, [r0, #4]
	add r0, r5, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02068A08

	thumb_func_start sub_02068B0C
sub_02068B0C: ; 0x02068B0C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r5, r1, #0
	add r6, r0, #0
	add r4, sp, #8
	ldmia r5!, {r0, r1}
	add r7, r4, #0
	stmia r4!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	ldr r0, [r5]
	add r1, r7, #0
	str r0, [r4]
	ldr r0, _02068B40 ; =sub_02068DD8
	str r0, [sp, #0x1c]
	ldr r0, _02068B44 ; =sub_02068DDC
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x38]
	str r0, [sp]
	ldr r0, [sp, #0x3c]
	str r0, [sp, #4]
	add r0, r6, #0
	bl sub_02068A08
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02068B40: .word sub_02068DD8
_02068B44: .word sub_02068DDC
	thumb_func_end sub_02068B0C

	thumb_func_start sub_02068B48
sub_02068B48: ; 0x02068B48
	push {r4, lr}
	add r4, r0, #0
	bne _02068B52
	bl GF_AssertFail
_02068B52:
	add r0, r4, #0
	bl sub_02068CCC
	cmp r0, #0
	beq _02068B7E
	add r0, r4, #0
	bl sub_02068D50
	ldr r1, [r4, #0x14]
	ldr r0, [r1, #4]
	sub r0, r0, #1
	str r0, [r1, #4]
	add r0, r4, #0
	bl sub_02068DA0
	cmp r0, #0
	beq _02068B78
	bl sub_0200E390
_02068B78:
	add r0, r4, #0
	bl sub_02068C6C
_02068B7E:
	pop {r4, pc}
	thumb_func_end sub_02068B48

	thumb_func_start sub_02068B80
sub_02068B80: ; 0x02068B80
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_02068CC4
	add r4, r0, #0
	add r0, r5, #0
	bl sub_02068CC8
	add r5, r0, #0
_02068B92:
	add r0, r5, #0
	bl sub_02068CCC
	cmp r0, #1
	bne _02068BA2
	add r0, r5, #0
	bl sub_02068B48
_02068BA2:
	add r5, #0xc8
	sub r4, r4, #1
	bne _02068B92
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02068B80

	thumb_func_start sub_02068BAC
sub_02068BAC: ; 0x02068BAC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl sub_02068CC4
	add r4, r0, #0
	add r0, r5, #0
	bl sub_02068CC8
	add r5, r0, #0
	mov r6, #3
_02068BC0:
	add r0, r5, #0
	add r1, r6, #0
	bl sub_02068CEC
	cmp r0, #3
	bne _02068BD2
	add r0, r5, #0
	bl sub_02068D34
_02068BD2:
	add r5, #0xc8
	sub r4, r4, #1
	bne _02068BC0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02068BAC

	thumb_func_start sub_02068BDC
sub_02068BDC: ; 0x02068BDC
	push {r4, lr}
	add r3, r0, #0
	add r2, r1, #0
	ldr r0, _02068BF8 ; =sub_02068BFC
	add r1, r3, #0
	bl sub_0200E320
	add r4, r0, #0
	bne _02068BF2
	bl GF_AssertFail
_02068BF2:
	add r0, r4, #0
	pop {r4, pc}
	nop
_02068BF8: .word sub_02068BFC
	thumb_func_end sub_02068BDC

	thumb_func_start sub_02068BFC
sub_02068BFC: ; 0x02068BFC
	ldr r3, _02068C04 ; =sub_02068D18
	add r0, r1, #0
	bx r3
	nop
_02068C04: .word sub_02068D18
	thumb_func_end sub_02068BFC

	thumb_func_start sub_02068C08
sub_02068C08: ; 0x02068C08
	push {r4, lr}
	mov r1, #0x10
	bl AllocFromHeap
	add r4, r0, #0
	bne _02068C18
	bl GF_AssertFail
_02068C18:
	add r2, r4, #0
	mov r1, #0x10
	mov r0, #0
_02068C1E:
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _02068C1E
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02068C08

	thumb_func_start sub_02068C2C
sub_02068C2C: ; 0x02068C2C
	ldr r3, _02068C34 ; =FreeToHeapExplicit
	add r1, r0, #0
	ldr r0, [r1, #8]
	bx r3
	.balign 4, 0
_02068C34: .word FreeToHeapExplicit
	thumb_func_end sub_02068C2C

	thumb_func_start sub_02068C38
sub_02068C38: ; 0x02068C38
	push {r3, r4, r5, lr}
	mov r2, #0xc8
	add r5, r1, #0
	mul r5, r2
	add r1, r5, #0
	bl AllocFromHeap
	add r4, r0, #0
	bne _02068C4E
	bl GF_AssertFail
_02068C4E:
	add r0, r4, #0
	mov r1, #0
	add r2, r5, #0
	bl memset
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02068C38

	thumb_func_start sub_02068C5C
sub_02068C5C: ; 0x02068C5C
	ldr r3, _02068C68 ; =FreeToHeapExplicit
	add r1, r0, #0
	ldr r0, [r1, #8]
	ldr r1, [r1, #0xc]
	bx r3
	nop
_02068C68: .word FreeToHeapExplicit
	thumb_func_end sub_02068C5C

	thumb_func_start sub_02068C6C
sub_02068C6C: ; 0x02068C6C
	push {r4, lr}
	mov r1, #0
	mov r2, #0xc8
	add r4, r0, #0
	bl memset
	ldr r1, _02068CAC ; =sub_02068DC8
	add r0, r4, #0
	bl sub_02068CF4
	ldr r1, _02068CB0 ; =sub_02068DD4
	add r0, r4, #0
	bl sub_02068D48
	ldr r1, _02068CB4 ; =sub_02068DCC
	add r0, r4, #0
	bl sub_02068D10
	ldr r1, _02068CB8 ; =sub_02068DD0
	add r0, r4, #0
	bl sub_02068D2C
	ldr r1, _02068CBC ; =sub_02068DD8
	add r0, r4, #0
	bl sub_02068D64
	ldr r1, _02068CC0 ; =sub_02068DDC
	add r0, r4, #0
	bl sub_02068D6C
	pop {r4, pc}
	nop
_02068CAC: .word sub_02068DC8
_02068CB0: .word sub_02068DD4
_02068CB4: .word sub_02068DCC
_02068CB8: .word sub_02068DD0
_02068CBC: .word sub_02068DD8
_02068CC0: .word sub_02068DDC
	thumb_func_end sub_02068C6C

	thumb_func_start sub_02068CC4
sub_02068CC4: ; 0x02068CC4
	ldr r0, [r0]
	bx lr
	thumb_func_end sub_02068CC4

	thumb_func_start sub_02068CC8
sub_02068CC8: ; 0x02068CC8
	ldr r0, [r0, #0xc]
	bx lr
	thumb_func_end sub_02068CC8

	thumb_func_start sub_02068CCC
sub_02068CCC: ; 0x02068CCC
	ldr r1, [r0]
	mov r0, #1
	tst r1, r0
	bne _02068CD6
	mov r0, #0
_02068CD6:
	bx lr
	thumb_func_end sub_02068CCC

	thumb_func_start sub_02068CD8
sub_02068CD8: ; 0x02068CD8
	ldr r2, [r0]
	mov r1, #1
	orr r1, r2
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02068CD8

	thumb_func_start sub_02068CE4
sub_02068CE4: ; 0x02068CE4
	ldr r2, [r0]
	orr r1, r2
	str r1, [r0]
	bx lr
	thumb_func_end sub_02068CE4

	thumb_func_start sub_02068CEC
sub_02068CEC: ; 0x02068CEC
	ldr r0, [r0]
	and r0, r1
	bx lr
	.balign 4, 0
	thumb_func_end sub_02068CEC

	thumb_func_start sub_02068CF4
sub_02068CF4: ; 0x02068CF4
	add r0, #0xb0
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02068CF4

	thumb_func_start sub_02068CFC
sub_02068CFC: ; 0x02068CFC
	push {r4, lr}
	add r4, r0, #0
	bl sub_02068D74
	add r1, r0, #0
	add r0, r4, #0
	add r4, #0xb0
	ldr r2, [r4]
	blx r2
	pop {r4, pc}
	thumb_func_end sub_02068CFC

	thumb_func_start sub_02068D10
sub_02068D10: ; 0x02068D10
	add r0, #0xb4
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02068D10

	thumb_func_start sub_02068D18
sub_02068D18: ; 0x02068D18
	push {r4, lr}
	add r4, r0, #0
	bl sub_02068D74
	add r1, r0, #0
	add r0, r4, #0
	add r4, #0xb4
	ldr r2, [r4]
	blx r2
	pop {r4, pc}
	thumb_func_end sub_02068D18

	thumb_func_start sub_02068D2C
sub_02068D2C: ; 0x02068D2C
	add r0, #0xb8
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02068D2C

	thumb_func_start sub_02068D34
sub_02068D34: ; 0x02068D34
	push {r4, lr}
	add r4, r0, #0
	bl sub_02068D74
	add r1, r0, #0
	add r0, r4, #0
	add r4, #0xb8
	ldr r2, [r4]
	blx r2
	pop {r4, pc}
	thumb_func_end sub_02068D34

	thumb_func_start sub_02068D48
sub_02068D48: ; 0x02068D48
	add r0, #0xbc
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02068D48

	thumb_func_start sub_02068D50
sub_02068D50: ; 0x02068D50
	push {r4, lr}
	add r4, r0, #0
	bl sub_02068D74
	add r1, r0, #0
	add r0, r4, #0
	add r4, #0xbc
	ldr r2, [r4]
	blx r2
	pop {r4, pc}
	thumb_func_end sub_02068D50

	thumb_func_start sub_02068D64
sub_02068D64: ; 0x02068D64
	add r0, #0xc0
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02068D64

	thumb_func_start sub_02068D6C
sub_02068D6C: ; 0x02068D6C
	add r0, #0xc4
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02068D6C

	thumb_func_start sub_02068D74
sub_02068D74: ; 0x02068D74
	add r0, #0x30
	bx lr
	thumb_func_end sub_02068D74

	thumb_func_start sub_02068D78
sub_02068D78: ; 0x02068D78
	push {r4, lr}
	add r4, r1, #0
	bl sub_02068D74
	mov r1, #0
	add r2, r4, #0
	bl memset
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02068D78

	thumb_func_start sub_02068D8C
sub_02068D8C: ; 0x02068D8C
	str r1, [r0, #4]
	bx lr
	thumb_func_end sub_02068D8C

	thumb_func_start sub_02068D90
sub_02068D90: ; 0x02068D90
	ldr r0, [r0, #4]
	bx lr
	thumb_func_end sub_02068D90

	thumb_func_start sub_02068D94
sub_02068D94: ; 0x02068D94
	str r1, [r0, #0xc]
	bx lr
	thumb_func_end sub_02068D94

	thumb_func_start sub_02068D98
sub_02068D98: ; 0x02068D98
	ldr r0, [r0, #0xc]
	bx lr
	thumb_func_end sub_02068D98

	thumb_func_start sub_02068D9C
sub_02068D9C: ; 0x02068D9C
	str r1, [r0, #0x10]
	bx lr
	thumb_func_end sub_02068D9C

	thumb_func_start sub_02068DA0
sub_02068DA0: ; 0x02068DA0
	ldr r0, [r0, #0x10]
	bx lr
	thumb_func_end sub_02068DA0

	thumb_func_start sub_02068DA4
sub_02068DA4: ; 0x02068DA4
	str r1, [r0, #0x14]
	bx lr
	thumb_func_end sub_02068DA4

	thumb_func_start sub_02068DA8
sub_02068DA8: ; 0x02068DA8
	add r3, r1, #0
	add r2, r0, #0
	ldmia r3!, {r0, r1}
	add r2, #0x24
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	bx lr
	thumb_func_end sub_02068DA8

	thumb_func_start sub_02068DB8
sub_02068DB8: ; 0x02068DB8
	add r2, r0, #0
	add r2, #0x24
	add r3, r1, #0
	ldmia r2!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r2]
	str r0, [r3]
	bx lr
	thumb_func_end sub_02068DB8

	thumb_func_start sub_02068DC8
sub_02068DC8: ; 0x02068DC8
	mov r0, #1
	bx lr
	thumb_func_end sub_02068DC8

	thumb_func_start sub_02068DCC
sub_02068DCC: ; 0x02068DCC
	bx lr
	.balign 4, 0
	thumb_func_end sub_02068DCC

	thumb_func_start sub_02068DD0
sub_02068DD0: ; 0x02068DD0
	bx lr
	.balign 4, 0
	thumb_func_end sub_02068DD0

	thumb_func_start sub_02068DD4
sub_02068DD4: ; 0x02068DD4
	bx lr
	.balign 4, 0
	thumb_func_end sub_02068DD4

	thumb_func_start sub_02068DD8
sub_02068DD8: ; 0x02068DD8
	bx lr
	.balign 4, 0
	thumb_func_end sub_02068DD8

	thumb_func_start sub_02068DDC
sub_02068DDC: ; 0x02068DDC
	bx lr
	.balign 4, 0
	thumb_func_end sub_02068DDC

	.rodata

_020FCB7C:
	.word sub_0205D09C
	.word sub_0205D0A8
	.word sub_0205D190
_020FCB88:
	.word sub_0205B828
_020FCB8C:
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
_020FCB98:
	.byte 0x6C, 0x08
_020FCB9A:
	.byte 0x00, 0x00
_020FCB9C:
	.byte 0x6D, 0x08, 0x00, 0x00
	.byte 0x6A, 0x08, 0x00, 0x00, 0x76, 0x08, 0x00, 0x00, 0x77, 0x08, 0x00, 0x00, 0x6E, 0x08, 0x01, 0x00
	.byte 0x70, 0x08, 0x01, 0x00, 0x71, 0x08, 0x00, 0x00, 0x72, 0x08, 0x00, 0x00, 0x6E, 0x08, 0x01, 0x00
	.byte 0x73, 0x08, 0x01, 0x00, 0x70, 0x08, 0x00, 0x00, 0x75, 0x08, 0x00, 0x00, 0x74, 0x08, 0x00, 0x00
	.byte 0xEB, 0x05, 0x00, 0x00, 0xEA, 0x05, 0x00, 0x00, 0x24, 0x00, 0x00, 0x00, 0x25, 0x00, 0x00, 0x00
	.byte 0x26, 0x00, 0x00, 0x00, 0x27, 0x00, 0x00, 0x00, 0x34, 0x00, 0x00, 0x00, 0x35, 0x00, 0x00, 0x00
	.byte 0x36, 0x00, 0x00, 0x00, 0x37, 0x00, 0x00, 0x00, 0x5E, 0x00, 0x00, 0x00, 0x5F, 0x00, 0x00, 0x00
	.byte 0x5E, 0x00, 0x00, 0x00, 0x5F, 0x00, 0x00, 0x00, 0x28, 0x00, 0x00, 0x00, 0x29, 0x00, 0x00, 0x00
	.byte 0x2A, 0x00, 0x00, 0x00, 0x2B, 0x00, 0x00, 0x00, 0x5C, 0x00, 0x00, 0x00, 0x5D, 0x00, 0x00, 0x00
	.byte 0x5C, 0x00, 0x00, 0x00, 0x5D, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x21, 0x00, 0x00, 0x00
	.byte 0x22, 0x00, 0x00, 0x00, 0x23, 0x00, 0x00, 0x00, 0x4C, 0x00, 0x00, 0x00, 0x4D, 0x00, 0x00, 0x00
	.byte 0x4E, 0x00, 0x00, 0x00, 0x4F, 0x00, 0x00, 0x00, 0x54, 0x00, 0x00, 0x00, 0x55, 0x00, 0x00, 0x00
	.byte 0x56, 0x00, 0x00, 0x00, 0x57, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00, 0x31, 0x00, 0x00, 0x00
	.byte 0x32, 0x00, 0x00, 0x00, 0x33, 0x00, 0x00, 0x00, 0x58, 0x00, 0x00, 0x00, 0x59, 0x00, 0x00, 0x00
	.byte 0x5A, 0x00, 0x00, 0x00, 0x5B, 0x00, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x00, 0x1D, 0x00, 0x00, 0x00
	.byte 0x1E, 0x00, 0x00, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x38, 0x00, 0x00, 0x00, 0x39, 0x00, 0x00, 0x00
	.byte 0x3A, 0x00, 0x00, 0x00, 0x3B, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x19, 0x00, 0x00, 0x00
	.byte 0x1A, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x11, 0x00, 0x00, 0x00
	.byte 0x12, 0x00, 0x00, 0x00, 0x13, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x15, 0x00, 0x00, 0x00
	.byte 0x16, 0x00, 0x00, 0x00, 0x17, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0x61, 0x00, 0x00, 0x00
	.byte 0x62, 0x00, 0x00, 0x00, 0x63, 0x00, 0x00, 0x00, 0x50, 0x00, 0x00, 0x00, 0x51, 0x00, 0x00, 0x00
	.byte 0x52, 0x00, 0x00, 0x00, 0x53, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00
	.byte 0x0E, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x2C, 0x00, 0x00, 0x00, 0x2D, 0x00, 0x00, 0x00
	.byte 0x2E, 0x00, 0x00, 0x00, 0x2F, 0x00, 0x00, 0x00, 0x34, 0x00, 0x00, 0x00, 0x19, 0x63, 0x06, 0x02
	.byte 0x3D, 0x63, 0x06, 0x02, 0x61, 0x63, 0x06, 0x02, 0x71, 0x63, 0x06, 0x02, 0x03, 0x00, 0x00, 0x00
	.byte 0x2D, 0x1B, 0x06, 0x02, 0x1D, 0x1C, 0x06, 0x02, 0xBD, 0xFC, 0x05, 0x02, 0xC1, 0xFC, 0x05, 0x02
	.byte 0x36, 0x00, 0x00, 0x00, 0x31, 0x63, 0x06, 0x02, 0x3D, 0x63, 0x06, 0x02, 0x61, 0x63, 0x06, 0x02
	.byte 0x71, 0x63, 0x06, 0x02, 0x03, 0x00, 0x00, 0x00, 0xD5, 0x58, 0x06, 0x02, 0x39, 0x59, 0x06, 0x02
	.byte 0x99, 0x59, 0x06, 0x02, 0xC1, 0xFC, 0x05, 0x02, 0x03, 0x00, 0x00, 0x00, 0x1D, 0x1B, 0x06, 0x02
	.byte 0x1D, 0x1C, 0x06, 0x02, 0xBD, 0xFC, 0x05, 0x02, 0xC1, 0xFC, 0x05, 0x02, 0x35, 0x00, 0x00, 0x00
	.byte 0x25, 0x63, 0x06, 0x02, 0x3D, 0x63, 0x06, 0x02, 0x61, 0x63, 0x06, 0x02, 0x71, 0x63, 0x06, 0x02
	.byte 0x03, 0x00, 0x00, 0x00, 0xF1, 0x16, 0x06, 0x02, 0xFD, 0x16, 0x06, 0x02, 0xBD, 0xFC, 0x05, 0x02
	.byte 0xC1, 0xFC, 0x05, 0x02, 0x33, 0x00, 0x00, 0x00, 0x0D, 0x63, 0x06, 0x02, 0x3D, 0x63, 0x06, 0x02
	.byte 0x61, 0x63, 0x06, 0x02, 0x71, 0x63, 0x06, 0x02, 0x03, 0x00, 0x00, 0x00, 0x6D, 0x1B, 0x06, 0x02
	.byte 0x1D, 0x1C, 0x06, 0x02, 0xBD, 0xFC, 0x05, 0x02, 0xC1, 0xFC, 0x05, 0x02, 0x03, 0x00, 0x00, 0x00
	.byte 0xD5, 0x58, 0x06, 0x02, 0x69, 0x59, 0x06, 0x02, 0x99, 0x59, 0x06, 0x02, 0xC1, 0xFC, 0x05, 0x02
	.byte 0x03, 0x00, 0x00, 0x00, 0x7D, 0x1B, 0x06, 0x02, 0x1D, 0x1C, 0x06, 0x02, 0xBD, 0xFC, 0x05, 0x02
	.byte 0xC1, 0xFC, 0x05, 0x02, 0x03, 0x00, 0x00, 0x00, 0x8D, 0x1B, 0x06, 0x02, 0x1D, 0x1C, 0x06, 0x02
	.byte 0xBD, 0xFC, 0x05, 0x02, 0xC1, 0xFC, 0x05, 0x02, 0x03, 0x00, 0x00, 0x00, 0x9D, 0x1B, 0x06, 0x02
	.byte 0x1D, 0x1C, 0x06, 0x02, 0xBD, 0xFC, 0x05, 0x02, 0xC1, 0xFC, 0x05, 0x02, 0x03, 0x00, 0x00, 0x00
	.byte 0xAD, 0x1B, 0x06, 0x02, 0x1D, 0x1C, 0x06, 0x02, 0xBD, 0xFC, 0x05, 0x02, 0xC1, 0xFC, 0x05, 0x02
	.byte 0x03, 0x00, 0x00, 0x00, 0xCD, 0x1B, 0x06, 0x02, 0x1D, 0x1C, 0x06, 0x02, 0xBD, 0xFC, 0x05, 0x02
	.byte 0xC1, 0xFC, 0x05, 0x02, 0x03, 0x00, 0x00, 0x00, 0xDD, 0x1B, 0x06, 0x02, 0x1D, 0x1C, 0x06, 0x02
	.byte 0xBD, 0xFC, 0x05, 0x02, 0xC1, 0xFC, 0x05, 0x02, 0x03, 0x00, 0x00, 0x00, 0xED, 0x1B, 0x06, 0x02
	.byte 0x1D, 0x1C, 0x06, 0x02, 0xBD, 0xFC, 0x05, 0x02, 0xC1, 0xFC, 0x05, 0x02, 0x03, 0x00, 0x00, 0x00
	.byte 0xFD, 0x1B, 0x06, 0x02, 0x1D, 0x1C, 0x06, 0x02, 0xBD, 0xFC, 0x05, 0x02, 0xC1, 0xFC, 0x05, 0x02
	.byte 0x03, 0x00, 0x00, 0x00, 0x0D, 0x1C, 0x06, 0x02, 0x1D, 0x1C, 0x06, 0x02, 0xBD, 0xFC, 0x05, 0x02
	.byte 0xC1, 0xFC, 0x05, 0x02, 0x03, 0x00, 0x00, 0x00, 0x81, 0x1D, 0x06, 0x02, 0x1D, 0x1C, 0x06, 0x02
	.byte 0xBD, 0xFC, 0x05, 0x02, 0xC1, 0xFC, 0x05, 0x02, 0x00, 0x00, 0x00, 0x00, 0xB5, 0xFC, 0x05, 0x02
	.byte 0xB9, 0xFC, 0x05, 0x02, 0xBD, 0xFC, 0x05, 0x02, 0xC1, 0xFC, 0x05, 0x02, 0x01, 0x00, 0x00, 0x00
	.byte 0xB5, 0xFC, 0x05, 0x02, 0xB9, 0xFC, 0x05, 0x02, 0xBD, 0xFC, 0x05, 0x02, 0xC1, 0xFC, 0x05, 0x02
	.byte 0x03, 0x00, 0x00, 0x00, 0x91, 0x1D, 0x06, 0x02, 0x1D, 0x1C, 0x06, 0x02, 0xBD, 0xFC, 0x05, 0x02
	.byte 0xC1, 0xFC, 0x05, 0x02, 0x03, 0x00, 0x00, 0x00, 0xBD, 0x1B, 0x06, 0x02, 0x1D, 0x1C, 0x06, 0x02
	.byte 0xBD, 0xFC, 0x05, 0x02, 0xC1, 0xFC, 0x05, 0x02, 0x03, 0x00, 0x00, 0x00, 0xA1, 0x1D, 0x06, 0x02
	.byte 0x1D, 0x1C, 0x06, 0x02, 0xBD, 0xFC, 0x05, 0x02, 0xC1, 0xFC, 0x05, 0x02, 0x03, 0x00, 0x00, 0x00
	.byte 0xC1, 0x13, 0x06, 0x02, 0xF9, 0x13, 0x06, 0x02, 0xBD, 0xFC, 0x05, 0x02, 0xC1, 0xFC, 0x05, 0x02
	.byte 0x03, 0x00, 0x00, 0x00, 0xB1, 0x1D, 0x06, 0x02, 0x1D, 0x1C, 0x06, 0x02, 0xBD, 0xFC, 0x05, 0x02
	.byte 0xC1, 0xFC, 0x05, 0x02, 0x03, 0x00, 0x00, 0x00, 0xC1, 0x1D, 0x06, 0x02, 0x1D, 0x1C, 0x06, 0x02
	.byte 0xBD, 0xFC, 0x05, 0x02, 0xC1, 0xFC, 0x05, 0x02, 0x03, 0x00, 0x00, 0x00, 0xD9, 0x12, 0x06, 0x02
	.byte 0x39, 0x13, 0x06, 0x02, 0x9D, 0x13, 0x06, 0x02, 0xC1, 0xFC, 0x05, 0x02, 0x03, 0x00, 0x00, 0x00
	.byte 0x5D, 0x1B, 0x06, 0x02, 0x1D, 0x1C, 0x06, 0x02, 0xBD, 0xFC, 0x05, 0x02, 0xC1, 0xFC, 0x05, 0x02
	.byte 0x03, 0x00, 0x00, 0x00, 0x4D, 0x1B, 0x06, 0x02, 0x1D, 0x1C, 0x06, 0x02, 0xBD, 0xFC, 0x05, 0x02
	.byte 0xC1, 0xFC, 0x05, 0x02, 0x03, 0x00, 0x00, 0x00, 0x3D, 0x1B, 0x06, 0x02, 0x1D, 0x1C, 0x06, 0x02
	.byte 0xBD, 0xFC, 0x05, 0x02, 0xC1, 0xFC, 0x05, 0x02, 0x03, 0x00, 0x00, 0x00, 0xE5, 0x12, 0x06, 0x02
	.byte 0x39, 0x13, 0x06, 0x02, 0x9D, 0x13, 0x06, 0x02, 0xC1, 0xFC, 0x05, 0x02, 0x03, 0x00, 0x00, 0x00
	.byte 0xD1, 0x1D, 0x06, 0x02, 0x1D, 0x1C, 0x06, 0x02, 0xBD, 0xFC, 0x05, 0x02, 0xC1, 0xFC, 0x05, 0x02
	.byte 0x03, 0x00, 0x00, 0x00, 0x7D, 0x19, 0x06, 0x02, 0x9D, 0x19, 0x06, 0x02, 0xBD, 0xFC, 0x05, 0x02
	.byte 0xC1, 0xFC, 0x05, 0x02, 0x03, 0x00, 0x00, 0x00, 0x45, 0x18, 0x06, 0x02, 0x51, 0x18, 0x06, 0x02
	.byte 0xBD, 0xFC, 0x05, 0x02, 0xC1, 0xFC, 0x05, 0x02, 0x03, 0x00, 0x00, 0x00, 0xE1, 0x1D, 0x06, 0x02
	.byte 0x1D, 0x1C, 0x06, 0x02, 0xBD, 0xFC, 0x05, 0x02, 0xC1, 0xFC, 0x05, 0x02, 0x03, 0x00, 0x00, 0x00
	.byte 0xE5, 0x16, 0x06, 0x02, 0xFD, 0x16, 0x06, 0x02, 0xBD, 0xFC, 0x05, 0x02, 0xC1, 0xFC, 0x05, 0x02
	.byte 0x03, 0x00, 0x00, 0x00, 0xB5, 0x16, 0x06, 0x02, 0x6D, 0x16, 0x06, 0x02, 0xBD, 0xFC, 0x05, 0x02
	.byte 0xC1, 0xFC, 0x05, 0x02, 0x03, 0x00, 0x00, 0x00, 0xA9, 0x16, 0x06, 0x02, 0x6D, 0x16, 0x06, 0x02
	.byte 0xBD, 0xFC, 0x05, 0x02, 0xC1, 0xFC, 0x05, 0x02, 0x03, 0x00, 0x00, 0x00, 0x15, 0x13, 0x06, 0x02
	.byte 0x39, 0x13, 0x06, 0x02, 0x9D, 0x13, 0x06, 0x02, 0xC1, 0xFC, 0x05, 0x02, 0x03, 0x00, 0x00, 0x00
	.byte 0xF1, 0x1D, 0x06, 0x02, 0x1D, 0x1C, 0x06, 0x02, 0xBD, 0xFC, 0x05, 0x02, 0xC1, 0xFC, 0x05, 0x02
	.byte 0x03, 0x00, 0x00, 0x00, 0x21, 0x13, 0x06, 0x02, 0x39, 0x13, 0x06, 0x02, 0x9D, 0x13, 0x06, 0x02
	.byte 0xC1, 0xFC, 0x05, 0x02, 0x03, 0x00, 0x00, 0x00, 0x2D, 0x13, 0x06, 0x02, 0x39, 0x13, 0x06, 0x02
	.byte 0x9D, 0x13, 0x06, 0x02, 0xC1, 0xFC, 0x05, 0x02, 0x03, 0x00, 0x00, 0x00, 0xD5, 0x58, 0x06, 0x02
	.byte 0x01, 0x59, 0x06, 0x02, 0x99, 0x59, 0x06, 0x02, 0xC1, 0xFC, 0x05, 0x02, 0x03, 0x00, 0x00, 0x00
	.byte 0x09, 0x13, 0x06, 0x02, 0x39, 0x13, 0x06, 0x02, 0x9D, 0x13, 0x06, 0x02, 0xC1, 0xFC, 0x05, 0x02
	.byte 0x03, 0x00, 0x00, 0x00, 0xFD, 0x12, 0x06, 0x02, 0x39, 0x13, 0x06, 0x02, 0x9D, 0x13, 0x06, 0x02
	.byte 0xC1, 0xFC, 0x05, 0x02, 0x03, 0x00, 0x00, 0x00, 0xF1, 0x12, 0x06, 0x02, 0x39, 0x13, 0x06, 0x02
	.byte 0x9D, 0x13, 0x06, 0x02, 0xC1, 0xFC, 0x05, 0x02, 0x03, 0x00, 0x00, 0x00, 0x91, 0x16, 0x06, 0x02
	.byte 0x6D, 0x16, 0x06, 0x02, 0xBD, 0xFC, 0x05, 0x02, 0xC1, 0xFC, 0x05, 0x02, 0x03, 0x00, 0x00, 0x00
	.byte 0x9D, 0x16, 0x06, 0x02, 0x6D, 0x16, 0x06, 0x02, 0xBD, 0xFC, 0x05, 0x02, 0xC1, 0xFC, 0x05, 0x02
	.byte 0x03, 0x00, 0x00, 0x00, 0xCD, 0x12, 0x06, 0x02, 0x39, 0x13, 0x06, 0x02, 0x9D, 0x13, 0x06, 0x02
	.byte 0xC1, 0xFC, 0x05, 0x02, 0x03, 0x00, 0x00, 0x00, 0xC1, 0x12, 0x06, 0x02, 0x39, 0x13, 0x06, 0x02
	.byte 0x9D, 0x13, 0x06, 0x02, 0xC1, 0xFC, 0x05, 0x02, 0x03, 0x00, 0x00, 0x00, 0xFD, 0x5F, 0x06, 0x02
	.byte 0x25, 0x60, 0x06, 0x02, 0x55, 0x60, 0x06, 0x02, 0x59, 0x60, 0x06, 0x02, 0x03, 0x00, 0x00, 0x00
	.byte 0xB1, 0x13, 0x06, 0x02, 0xF9, 0x13, 0x06, 0x02, 0xBD, 0xFC, 0x05, 0x02, 0xC1, 0xFC, 0x05, 0x02
	.byte 0x03, 0x00, 0x00, 0x00, 0xA1, 0x13, 0x06, 0x02, 0xF9, 0x13, 0x06, 0x02, 0xBD, 0xFC, 0x05, 0x02
	.byte 0xC1, 0xFC, 0x05, 0x02, 0x02, 0x00, 0x00, 0x00, 0xB5, 0x12, 0x06, 0x02, 0x39, 0x13, 0x06, 0x02
	.byte 0x9D, 0x13, 0x06, 0x02, 0xC1, 0xFC, 0x05, 0x02
_020FD198:
	.byte 0xF8, 0xCC, 0x0F, 0x02, 0x08, 0xCD, 0x0F, 0x02
	.byte 0x18, 0xCD, 0x0F, 0x02, 0xE8, 0xCC, 0x0F, 0x02, 0xA8, 0xCC, 0x0F, 0x02, 0xB8, 0xCC, 0x0F, 0x02
	.byte 0x98, 0xCC, 0x0F, 0x02, 0x78, 0xCC, 0x0F, 0x02, 0x28, 0xCC, 0x0F, 0x02, 0xD8, 0xCB, 0x0F, 0x02
	.byte 0x08, 0xCC, 0x0F, 0x02, 0x28, 0xCD, 0x0F, 0x02, 0x58, 0xCC, 0x0F, 0x02, 0xE8, 0xCB, 0x0F, 0x02
	.byte 0x88, 0xCC, 0x0F, 0x02, 0x38, 0xCC, 0x0F, 0x02, 0xD8, 0xCC, 0x0F, 0x02, 0x48, 0xCC, 0x0F, 0x02
	.byte 0x68, 0xCC, 0x0F, 0x02, 0x18, 0xCC, 0x0F, 0x02, 0xF8, 0xCB, 0x0F, 0x02, 0xC8, 0xCC, 0x0F, 0x02
	.byte 0x00, 0x00, 0x00, 0x00
_020FD1F4:
	.byte 0xC8, 0xCE, 0x0F, 0x02, 0xDC, 0xCE, 0x0F, 0x02, 0x84, 0xD1, 0x0F, 0x02
	.byte 0x70, 0xD1, 0x0F, 0x02, 0x5C, 0xD1, 0x0F, 0x02, 0x2C, 0xCF, 0x0F, 0x02, 0x34, 0xD1, 0x0F, 0x02
	.byte 0x20, 0xD1, 0x0F, 0x02, 0x68, 0xCF, 0x0F, 0x02, 0xB8, 0xCF, 0x0F, 0x02, 0xE4, 0xD0, 0x0F, 0x02
	.byte 0xD0, 0xD0, 0x0F, 0x02, 0xBC, 0xD0, 0x0F, 0x02, 0x58, 0xD0, 0x0F, 0x02, 0xF8, 0xD0, 0x0F, 0x02
	.byte 0x0C, 0xD1, 0x0F, 0x02, 0x44, 0xD0, 0x0F, 0x02, 0x30, 0xD0, 0x0F, 0x02, 0x1C, 0xD0, 0x0F, 0x02
	.byte 0xB0, 0xCD, 0x0F, 0x02, 0xE0, 0xCF, 0x0F, 0x02, 0x88, 0xCD, 0x0F, 0x02, 0x4C, 0xCD, 0x0F, 0x02
	.byte 0xA4, 0xCF, 0x0F, 0x02, 0x90, 0xCF, 0x0F, 0x02, 0x7C, 0xCF, 0x0F, 0x02, 0xD8, 0xCD, 0x0F, 0x02
	.byte 0x00, 0xCE, 0x0F, 0x02, 0x14, 0xCE, 0x0F, 0x02, 0x28, 0xCE, 0x0F, 0x02, 0x3C, 0xCE, 0x0F, 0x02
	.byte 0x04, 0xCF, 0x0F, 0x02, 0x50, 0xCE, 0x0F, 0x02, 0x64, 0xCE, 0x0F, 0x02, 0x78, 0xCE, 0x0F, 0x02
	.byte 0x8C, 0xCE, 0x0F, 0x02, 0xA0, 0xCE, 0x0F, 0x02, 0xB4, 0xCE, 0x0F, 0x02, 0xF0, 0xCE, 0x0F, 0x02
	.byte 0x18, 0xCF, 0x0F, 0x02, 0x40, 0xCF, 0x0F, 0x02, 0x54, 0xCF, 0x0F, 0x02, 0xCC, 0xCF, 0x0F, 0x02
	.byte 0x08, 0xD0, 0x0F, 0x02, 0x6C, 0xD0, 0x0F, 0x02, 0x80, 0xD0, 0x0F, 0x02, 0x94, 0xD0, 0x0F, 0x02
	.byte 0x00, 0x00, 0x00, 0x00, 0xA8, 0xD0, 0x0F, 0x02, 0xF4, 0xCF, 0x0F, 0x02, 0x48, 0xD1, 0x0F, 0x02
	.byte 0xC4, 0xCD, 0x0F, 0x02, 0x38, 0xCD, 0x0F, 0x02, 0x9C, 0xCD, 0x0F, 0x02, 0x60, 0xCD, 0x0F, 0x02
	.byte 0x74, 0xCD, 0x0F, 0x02, 0xEC, 0xCD, 0x0F, 0x02
_020FD2D8:
	.byte 0xB0, 0xD9, 0x0F, 0x02, 0x78, 0xD9, 0x0F, 0x02
	.byte 0xB8, 0xD9, 0x0F, 0x02, 0x80, 0xD9, 0x0F, 0x02, 0x04, 0xDA, 0x0F, 0x02, 0xC8, 0xDE, 0x0F, 0x02
	.byte 0xEC, 0xD9, 0x0F, 0x02, 0xE0, 0xDB, 0x0F, 0x02, 0xF4, 0xDC, 0x0F, 0x02, 0x28, 0xDF, 0x0F, 0x02
	.byte 0xC8, 0xD9, 0x0F, 0x02, 0x10, 0xDA, 0x0F, 0x02, 0x58, 0xDF, 0x0F, 0x02, 0x4C, 0xDF, 0x0F, 0x02
	.byte 0x40, 0xDF, 0x0F, 0x02, 0x34, 0xDF, 0x0F, 0x02, 0xC4, 0xDC, 0x0F, 0x02, 0x1C, 0xDF, 0x0F, 0x02
	.byte 0x10, 0xDF, 0x0F, 0x02, 0x04, 0xDF, 0x0F, 0x02, 0xF8, 0xDE, 0x0F, 0x02, 0xEC, 0xDE, 0x0F, 0x02
	.byte 0xE0, 0xDE, 0x0F, 0x02, 0xD4, 0xDE, 0x0F, 0x02, 0x98, 0xDE, 0x0F, 0x02, 0x8C, 0xDE, 0x0F, 0x02
	.byte 0x80, 0xDE, 0x0F, 0x02, 0x74, 0xDE, 0x0F, 0x02, 0x68, 0xDE, 0x0F, 0x02, 0x5C, 0xDE, 0x0F, 0x02
	.byte 0x58, 0xDC, 0x0F, 0x02, 0x44, 0xDE, 0x0F, 0x02, 0x4C, 0xDC, 0x0F, 0x02, 0x2C, 0xDE, 0x0F, 0x02
	.byte 0x40, 0xDC, 0x0F, 0x02, 0x14, 0xDE, 0x0F, 0x02, 0x34, 0xDC, 0x0F, 0x02, 0xFC, 0xDD, 0x0F, 0x02
	.byte 0x28, 0xDC, 0x0F, 0x02, 0xE4, 0xDD, 0x0F, 0x02, 0x1C, 0xDC, 0x0F, 0x02, 0xCC, 0xDD, 0x0F, 0x02
	.byte 0xC0, 0xDD, 0x0F, 0x02, 0xB4, 0xDD, 0x0F, 0x02, 0xA8, 0xDD, 0x0F, 0x02, 0x9C, 0xDD, 0x0F, 0x02
	.byte 0x90, 0xDD, 0x0F, 0x02, 0x54, 0xDD, 0x0F, 0x02, 0x60, 0xDD, 0x0F, 0x02, 0x84, 0xDD, 0x0F, 0x02
	.byte 0xD8, 0xDD, 0x0F, 0x02, 0x08, 0xDE, 0x0F, 0x02, 0x20, 0xDE, 0x0F, 0x02, 0x3C, 0xDD, 0x0F, 0x02
	.byte 0x30, 0xDD, 0x0F, 0x02, 0xD4, 0xDB, 0x0F, 0x02, 0xBC, 0xDB, 0x0F, 0x02, 0x18, 0xDD, 0x0F, 0x02
	.byte 0x0C, 0xDD, 0x0F, 0x02, 0x00, 0xDD, 0x0F, 0x02, 0x8C, 0xDB, 0x0F, 0x02, 0xB8, 0xDC, 0x0F, 0x02
	.byte 0xAC, 0xDC, 0x0F, 0x02, 0xA0, 0xDC, 0x0F, 0x02, 0x74, 0xDB, 0x0F, 0x02, 0x88, 0xDC, 0x0F, 0x02
	.byte 0x7C, 0xDC, 0x0F, 0x02, 0x70, 0xDC, 0x0F, 0x02, 0x64, 0xDC, 0x0F, 0x02, 0xA8, 0xD9, 0x0F, 0x02
	.byte 0xA0, 0xD9, 0x0F, 0x02, 0xC0, 0xD9, 0x0F, 0x02, 0x98, 0xD9, 0x0F, 0x02, 0x88, 0xD9, 0x0F, 0x02
	.byte 0x90, 0xD9, 0x0F, 0x02, 0xF8, 0xDB, 0x0F, 0x02, 0x48, 0xDD, 0x0F, 0x02, 0x6C, 0xDD, 0x0F, 0x02
	.byte 0xF0, 0xDD, 0x0F, 0x02, 0x38, 0xDE, 0x0F, 0x02, 0xC8, 0xDB, 0x0F, 0x02, 0x24, 0xDD, 0x0F, 0x02
	.byte 0xB0, 0xDB, 0x0F, 0x02, 0xE0, 0xD9, 0x0F, 0x02, 0x94, 0xDC, 0x0F, 0x02, 0xBC, 0xDE, 0x0F, 0x02
	.byte 0xB0, 0xDE, 0x0F, 0x02, 0xA4, 0xDE, 0x0F, 0x02, 0x98, 0xDB, 0x0F, 0x02, 0xD4, 0xD9, 0x0F, 0x02
	.byte 0x80, 0xDB, 0x0F, 0x02, 0xF8, 0xD9, 0x0F, 0x02, 0xA4, 0xDB, 0x0F, 0x02, 0xE8, 0xDC, 0x0F, 0x02
	.byte 0xDC, 0xDC, 0x0F, 0x02, 0xD0, 0xDC, 0x0F, 0x02, 0x68, 0xDB, 0x0F, 0x02, 0x5C, 0xDB, 0x0F, 0x02
	.byte 0x44, 0xDB, 0x0F, 0x02, 0x50, 0xDB, 0x0F, 0x02, 0xEC, 0xDB, 0x0F, 0x02, 0x10, 0xDC, 0x0F, 0x02
	.byte 0x78, 0xDD, 0x0F, 0x02, 0x04, 0xDC, 0x0F, 0x02, 0x50, 0xDE, 0x0F, 0x02, 0xCC, 0xDF, 0x0F, 0x02
	.byte 0xA8, 0xDF, 0x0F, 0x02, 0xF8, 0xDF, 0x0F, 0x02, 0x64, 0xDF, 0x0F, 0x02, 0x34, 0xE0, 0x0F, 0x02
	.byte 0x78, 0xDF, 0x0F, 0x02, 0x70, 0xE0, 0x0F, 0x02, 0x8C, 0xDF, 0x0F, 0x02
_020FD49C:
	.byte 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_020FD4AC:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x00, 0x00, 0x00
_020FD4BC:
	.byte 0x19, 0xB9, 0x05, 0x02
	.byte 0xF5, 0xB8, 0x05, 0x02, 0x61, 0xB9, 0x05, 0x02, 0x3D, 0xB9, 0x05, 0x02
_020FD4CC:
	.byte 0xF5, 0xB8, 0x05, 0x02
	.byte 0x19, 0xB9, 0x05, 0x02, 0x3D, 0xB9, 0x05, 0x02, 0x61, 0xB9, 0x05, 0x02
_020FD4DC:
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
_020FD4EC:
	.word sub_02061C40
	.word sub_02061D50
_020FD4F4:
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
_020FD500:
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
_020FD50C:
	.byte 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
_020FD518:
	.byte 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
_020FD524:
	.byte 0x01, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
_020FD530:
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
_020FD53C:
	.byte 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
_020FD548:
	.word sub_020619C0
	.word sub_020619FC
	.word sub_02061ABC
_020FD554:
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
_020FD560:
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
_020FD570:
	.byte 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
_020FD580:
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
_020FD590:
	.byte 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
_020FD5A0:
	.word sub_02061874
	.word sub_02061894
	.word sub_020618B0
	.word sub_020618C8
_020FD5B0:
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_020FD5C0:
	.byte 0x01, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
_020FD5D0:
	.word sub_02061720
	.word sub_02061754
	.word sub_02061770
	.word sub_020617AC
_020FD5E0:
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
_020FD5F0:
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
_020FD600:
	.byte 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_020FD610:
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
_020FD620:
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
_020FD630:
	.byte 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
_020FD640:
	.byte 0x03, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_020FD650:
	.byte 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
_020FD660:
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
_020FD670:
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
_020FD680:
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
_020FD690:
	.byte 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_020FD6A0:
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
_020FD6B0:
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
_020FD6C0:
	.byte 0x03, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
_020FD6D0:
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
_020FD6E0:
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
_020FD6F0:
	.byte 0x01, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_020FD700:
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
_020FD710:
	.byte 0x03, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_020FD720:
	.byte 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_020FD730:
	.byte 0x03, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
_020FD740:
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF
_020FD754:
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
_020FD768:
	.byte 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
_020FD77C:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
_020FD790:
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF
_020FD7A4:
	.byte 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
_020FD7B8:
	.byte 0x10, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00
	.byte 0x30, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
_020FD7CC:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
_020FD7E0:
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
_020FD800:
	.byte 0x02, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x09, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00
	.byte 0x0D, 0x00, 0x00, 0x00, 0x2D, 0x00, 0x00, 0x00, 0x2E, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00
	.byte 0x13, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00
_020FD838:
	.word 0x00000000, _020FD7CC
	.word 0x00000001, _020FD4F4
	.word 0x00000002, _020FD518
	.word 0x00000003, _020FD500
	.word 0x00000004, _020FD524
	.word 0x00000005, _020FD6E0
	.word 0x00000006, _020FD6A0
	.word 0x00000007, _020FD6B0
	.word 0x00000008, _020FD6D0
	.word 0x00000009, _020FD554
	.word 0x0000000A, _020FD53C
	.word 0x0000000B, _020FD740
	.word 0x0000000C, _020FD530
	.word 0x0000000D, _020FD50C
	.word 0x0000000E, _020FD650
	.word 0x0000000F, _020FD640
	.word 0x00000010, _020FD620
	.word 0x00000011, _020FD630
	.word 0x00000012, _020FD720
	.word 0x00000013, _020FD600
	.word 0x00000014, _020FD560
	.word 0x00000015, _020FD730
	.word 0x00000016, _020FD660
	.word 0x00000017, _020FD670
	.word 0x00000018, _020FD6C0
	.word 0x00000019, _020FD6F0
	.word 0x0000001A, _020FD680
	.word 0x0000001B, _020FD580
	.word 0x0000001C, _020FD570
	.word 0x0000001D, _020FD5B0
	.word 0x0000001E, _020FD610
	.word 0x0000001F, _020FD5C0
	.word 0x00000020, _020FD690
	.word 0x00000021, _020FD700
	.word 0x00000022, _020FD590
	.word 0x00000023, _020FD5E0
	.word 0x00000024, _020FD5F0
	.word 0x00000025, _020FD710
	.word 0x00000026, _020FD790
	.word 0x00000027, 0
_020FD978:
	.word sub_020624A8
	.word sub_02062470
	.word sub_020624C0
	.word sub_02062470
	.word sub_02062F18
	.word sub_02062470
	.word sub_02062F30
	.word sub_02062470
	.word sub_02062F04
	.word sub_02062470
	.word sub_02062ED8
	.word sub_02062470
	.word sub_02062EC0
	.word sub_02062470
	.word sub_0206249C
	.word sub_02062470
	.word sub_020624B4
	.word sub_02062470
	.word sub_02062EF0
	.word sub_02062470
	.word sub_020625E0
	.word sub_02062514
	.word sub_02062470
	.word sub_02062770
	.word sub_02062514
	.word sub_02062470
	.word sub_020630D4
	.word sub_020630E4
	.word sub_02062470
	.word sub_02062590
	.word sub_02062514
	.word sub_02062470
	.word sub_02062798
	.word sub_02062514
	.word sub_02062470
	.word sub_02062568
	.word sub_02062514
	.word sub_02062470
	.word sub_020625F4
	.word sub_02062514
	.word sub_02062470
_020FDA1C:
	.byte 0x00, 0x50, 0x00, 0x00
	.byte 0x00, 0x60, 0x00, 0x00, 0x00, 0x50, 0x00, 0x00
_020FDA28:
	.byte 0x08, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00
_020FDA38:
	.word sub_020622B8
	.word sub_020622C4
	.word sub_020622E0
	.word sub_020622F8
	.word sub_02062314
	.word sub_02062348
_020FDA50:
	.byte 0x00, 0x20, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00
	.byte 0x00, 0x30, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00
_020FDA68:
	.byte 0x00, 0x25, 0x00, 0x00, 0x80, 0x24, 0x00, 0x00
	.byte 0x80, 0x24, 0x00, 0x00, 0x80, 0x24, 0x00, 0x00, 0x80, 0x24, 0x00, 0x00, 0x80, 0x24, 0x00, 0x00
	.byte 0x80, 0x24, 0x00, 0x00
_020FDA84:
	.byte 0x00, 0x40, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00
	.byte 0x00, 0xA0, 0x00, 0x00, 0x00, 0xB0, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00
	.byte 0x00, 0xC0, 0x00, 0x00, 0x00, 0xB0, 0x00, 0x00, 0x00, 0xA0, 0x00, 0x00, 0x00, 0x90, 0x00, 0x00
	.byte 0x00, 0x80, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
_020FDAC4:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00
	.byte 0x00, 0x40, 0x00, 0x00, 0x00, 0x50, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00
	.byte 0x00, 0x60, 0x00, 0x00, 0x00, 0x50, 0x00, 0x00, 0x00, 0x50, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00
	.byte 0x00, 0x30, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
_020FDB04:
	.byte 0x00, 0x20, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00
	.byte 0x00, 0x80, 0x00, 0x00, 0x00, 0x90, 0x00, 0x00, 0x00, 0xA0, 0x00, 0x00, 0x00, 0xA0, 0x00, 0x00
	.byte 0x00, 0xA0, 0x00, 0x00, 0x00, 0x90, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00
	.byte 0x00, 0x50, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
_020FDB44:
	.word sub_0206311C
	.word sub_0206313C
	.word sub_02062470
	.word sub_0206312C
	.word sub_0206313C
	.word sub_02062470
	.word sub_0206310C
	.word sub_0206313C
	.word sub_02062470
	.word sub_020630FC
	.word sub_0206313C
	.word sub_02062470
	.word sub_02062DBC
	.word sub_02062D6C
	.word sub_02062470
	.word sub_02062784
	.word sub_02062514
	.word sub_02062470
	.word sub_02062D8C
	.word sub_02062D6C
	.word sub_02062470
	.word sub_02062758
	.word sub_02062514
	.word sub_02062470
	.word sub_02062CC8
	.word sub_020629CC
	.word sub_02062470
	.word sub_020630C4
	.word sub_020630E4
	.word sub_02062470
	.word sub_02062C44
	.word sub_020629CC
	.word sub_02062470
	.word sub_020630A4
	.word sub_020630E4
	.word sub_02062470
	.word sub_02062C24
	.word sub_020629CC
	.word sub_02062470
	.word sub_020625A4
	.word sub_02062514
	.word sub_02062470
	.word sub_02063154
	.word sub_02063170
	.word sub_02062470
	.word sub_02062F94
	.word sub_02062F6C
	.word sub_02062470
	.word sub_02062FA0
	.word sub_02062F6C
	.word sub_02062470
	.word sub_0206319C
	.word sub_020631F0
	.word sub_02062470
	.word sub_02062918
	.word sub_020627E4
	.word sub_02062470
	.word sub_020628F8
	.word sub_020627E4
	.word sub_02062470
	.word sub_020628D8
	.word sub_020627E4
	.word sub_02062470
	.word sub_020628B8
	.word sub_020627E4
	.word sub_02062470
	.word sub_02062898
	.word sub_020627E4
	.word sub_02062470
	.word sub_02062878
	.word sub_020627E4
	.word sub_02062470
	.word sub_02062E4C
	.word sub_02062E78
	.word sub_02062470
	.word sub_02062DE0
	.word sub_02062E04
	.word sub_02062470
	.word sub_02062DD4
	.word sub_02062D6C
	.word sub_02062470
	.word sub_02062DC8
	.word sub_02062D6C
	.word sub_02062470
	.word sub_02062704
	.word sub_02062514
	.word sub_02062470
	.word sub_02062DB0
	.word sub_02062D6C
	.word sub_02062470
	.word sub_02062DA4
	.word sub_02062D6C
	.word sub_02062470
	.word sub_02062D98
	.word sub_02062D6C
	.word sub_02062470
	.word sub_0206265C
	.word sub_02062514
	.word sub_02062470
	.word sub_02062D30
	.word sub_020629CC
	.word sub_02062470
	.word sub_02062D0C
	.word sub_020629CC
	.word sub_02062470
	.word sub_02062CE8
	.word sub_020629CC
	.word sub_02062470
	.word sub_020625B8
	.word sub_02062514
	.word sub_02062470
	.word sub_02062CA4
	.word sub_020629CC
	.word sub_02062470
	.word sub_02062C84
	.word sub_020629CC
	.word sub_02062470
	.word sub_02062C64
	.word sub_020629CC
	.word sub_02062470
	.word sub_020630B4
	.word sub_020630E4
	.word sub_02062470
	.word sub_02062C00
	.word sub_020629CC
	.word sub_02062470
	.word sub_02062BDC
	.word sub_020629CC
	.word sub_02062470
	.word sub_0206304C
	.word sub_0206308C
	.word sub_02062470
	.word sub_02062B1C
	.word sub_020629CC
	.word sub_02062470
	.word sub_02062B3C
	.word sub_020629CC
	.word sub_02062470
	.word sub_0206305C
	.word sub_0206308C
	.word sub_02062470
	.word sub_02063258
	.word sub_02063290
	.word sub_02062470
	.word sub_02062B5C
	.word sub_020629CC
	.word sub_02062470
	.word sub_02062AFC
	.word sub_020629CC
	.word sub_02062470
	.word sub_02062ADC
	.word sub_020629CC
	.word sub_02062470
	.word sub_02062ABC
	.word sub_020629CC
	.word sub_02062470
	.word sub_02062948
	.word sub_020627E4
	.word sub_02062470
	.word sub_02062938
	.word sub_020627E4
	.word sub_02062470
	.word sub_02062928
	.word sub_020627E4
	.word sub_02062470
	.word sub_02062B7C
	.word sub_020629CC
	.word sub_02062470
	.word sub_02062908
	.word sub_020627E4
	.word sub_02062470
	.word sub_0206306C
	.word sub_0206308C
	.word sub_02062470
	.word sub_020628E8
	.word sub_020627E4
	.word sub_02062470
	.word sub_02062B9C
	.word sub_020629CC
	.word sub_02062470
	.word sub_020628C8
	.word sub_020627E4
	.word sub_02062470
	.word sub_02062BBC
	.word sub_020629CC
	.word sub_02062470
	.word sub_020628A8
	.word sub_020627E4
	.word sub_02062470
	.word sub_0206307C
	.word sub_0206308C
	.word sub_02062470
	.word sub_02062888
	.word sub_020627E4
	.word sub_02062470
	.word sub_02063274
	.word sub_02063290
	.word sub_02062470
	.word sub_02062868
	.word sub_020627E4
	.word sub_02062470
	.word sub_02062858
	.word sub_020627E4
	.word sub_02062470
	.word sub_02062848
	.word sub_020627E4
	.word sub_02062470
	.word sub_02062838
	.word sub_020627E4
	.word sub_02062470
	.word sub_02062828
	.word sub_020627E4
	.word sub_02062470
	.word sub_02062818
	.word sub_020627E4
	.word sub_02062470
	.word sub_02062740
	.word sub_02062514
	.word sub_02062470
	.word sub_0206272C
	.word sub_02062514
	.word sub_02062470
	.word sub_02062718
	.word sub_02062514
	.word sub_02062470
	.word sub_0206257C
	.word sub_02062514
	.word sub_02062470
	.word sub_020626EC
	.word sub_02062514
	.word sub_02062470
	.word sub_020626D8
	.word sub_02062514
	.word sub_02062470
	.word sub_020626C4
	.word sub_02062514
	.word sub_02062470
	.word sub_020626AC
	.word sub_02062514
	.word sub_02062470
	.word sub_02062698
	.word sub_02062514
	.word sub_02062470
	.word sub_02062684
	.word sub_02062514
	.word sub_02062470
	.word sub_02062670
	.word sub_02062514
	.word sub_02062470
	.word sub_020625CC
	.word sub_02062514
	.word sub_02062470
	.word sub_02062648
	.word sub_02062514
	.word sub_02062470
	.word sub_02062634
	.word sub_02062514
	.word sub_02062470
	.word sub_02062620
	.word sub_02062514
	.word sub_02062470
	.word sub_02062608
	.word sub_02062514
	.word sub_02062470
	.word sub_0206389C
	.word sub_02063424
	.word sub_020638DC
	.word sub_02063424
	.word sub_02062470
	.word sub_020638BC
	.word sub_02063424
	.word sub_020638DC
	.word sub_02063424
	.word sub_02062470
	.word sub_020639F4
	.word sub_02063424
	.word sub_020639F4
	.word sub_02063424
	.word sub_020639F4
	.word sub_02063424
	.word sub_02062470
	.word sub_02063724
	.word sub_02063424
	.word sub_02063744
	.word sub_02063424
	.word sub_02063764
	.word sub_02063424
	.word sub_02063784
	.word sub_02063424
	.word sub_02062470
	.word sub_02063684
	.word sub_02063424
	.word sub_020636A4
	.word sub_02063424
	.word sub_020636C4
	.word sub_02063424
	.word sub_020636E4
	.word sub_02063424
	.word sub_02063704
	.word sub_02063424
	.word sub_02062470
	.word sub_020637A4
	.word sub_02063424
	.word sub_020637C0
	.word sub_02063424
	.word sub_020637E0
	.word sub_02063424
	.word sub_02063800
	.word sub_02063424
	.word sub_02063820
	.word sub_02063424
	.word sub_02063840
	.word sub_02063424
	.word sub_0206385C
	.word sub_02063424
	.word sub_02062470
	.word sub_020637A4
	.word sub_02063424
	.word sub_020637C0
	.word sub_02063424
	.word sub_020637E0
	.word sub_02063424
	.word sub_02063800
	.word sub_02063424
	.word sub_02063820
	.word sub_02063424
	.word sub_02063840
	.word sub_02063424
	.word sub_0206387C
	.word sub_02063424
	.word sub_02062470
	.word sub_020638FC
	.word sub_02063424
	.word sub_0206391C
	.word sub_02063424
	.word sub_0206393C
	.word sub_02063424
	.word sub_02063958
	.word sub_02063424
	.word sub_02063958
	.word sub_02063424
	.word sub_02063978
	.word sub_02063424
	.word sub_02063978
	.word sub_02063424
	.word sub_02063998
	.word sub_02063424
	.word sub_020639B8
	.word sub_02063424
	.word sub_020639D8
	.word sub_02063424
	.word sub_02062470

_020FE0C4:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00
_020FE0D4:
	.byte 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00
_020FE0E4:
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00
_020FE104:
	.word sub_02063AFC
	.word sub_02063AFC
	.word sub_02063AFC
	.word sub_02063AFC
	.word sub_02063B08
	.word sub_02063C88
	.word sub_02063C88
	.word sub_02063AFC
	.word sub_02063AFC
	.word sub_02063AFC
	.word sub_02063AFC
	.word sub_02063AFC
_020FE134:
	.word sub_02063B00
	.word sub_02063B00
	.word sub_02063B00
	.word sub_02063B00
	.word sub_02063B20
	.word sub_02063CB4
	.word sub_02063CB4
	.word sub_02063B00
	.word sub_02063B00
	.word sub_02063B00
	.word sub_02063B00
	.word sub_02063B00
_020FE164:
	.word sub_02063B04
	.word sub_02063B04
	.word sub_02063B04
	.word sub_02063B04
	.word sub_02063B9C
	.word sub_02063D30
	.word sub_02063D30
	.word sub_02063B04
	.word sub_02063B04
	.word sub_02063B04
	.word sub_02063B04
	.word sub_02063B04
_020FE194:
	.word sub_020643B8
	.word sub_020643E4
	.word sub_02064410
	.word sub_0206443C
_020FE1A4:
	.word sub_0206464C
	.word sub_02064668
	.word sub_02064694
	.word sub_020646DC
	.word sub_02064714
	.word sub_02064730
	.word sub_02064748
	.word sub_02064764
	.word sub_02064778
	.word sub_02064790
	.word sub_020647A8
	.word sub_020647C0
	.word sub_020647E8
	.word sub_02064808
	.word sub_02064824
	.word sub_020648A0
	.word sub_020648C8
	.word sub_020648E4
_020FE1EC:
	.word 0
	.word ov04_02254D84
	.word ov04_02256044
	.word ov04_022563B0
	.word 0
	.word ov04_02254710
	.word ov04_0225507C
	.word ov04_022566A0
	.word ov04_02256BA0
	.word ov04_02256EB0
_020FE214:
	.word 0
	.word ov04_02254CBC
	.word ov04_02255FC0
	.word ov04_02256304
	.word ov04_02253E20
	.word ov04_02254190
	.word ov04_02254F8C
	.word ov04_02256650
	.word ov04_02256B64
	.word ov04_02256E60
_020FE23C:
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word ov04_022550D4
	.word 0
	.word 0
	.word 0
_020FE264:
	.word 0, sub_02065150, 0
	.word sub_02064B54, 0, 0
	.word 0, 0, sub_02064BF4
	.word 0, 0, sub_02064BF4
	.word sub_02064BFC, sub_02064C30, sub_02064DA8
	.word 0, 0, sub_02064BF4
	.word sub_02064E18, 0, 0
	.word sub_02064EB8, 0, 0
	.word sub_02064F08, 0, sub_02064F04
	.word 0, 0, sub_02064BF4
	.word sub_02064F28, sub_02064F5C, 0
	.word 0, 0, sub_02064BF4
	.word 0, 0, sub_02064BF4
	.word 0, 0, sub_02064BF4
	.word sub_02064F7C, 0, 0
	.word 0, 0, sub_02064BF4
	.word sub_02064FD4, sub_02065010, sub_020650E8
	.word sub_02065030, sub_0206506C, sub_020650E8
	.word sub_0206508C, sub_020650C8, sub_020650E8
	.word 0, sub_02065150, 0
	.word sub_02065258, 0, 0
	.word sub_02065310, 0, sub_0206536C
	.word 0, 0, sub_02064BF4
	.word sub_020653D8, sub_02065408, 0
	.word sub_02065428, sub_02065458, 0
	.word sub_02065474, sub_020654A4, 0
	.word sub_020654C0, sub_020654F4, 0
	.word 0, sub_02065560, 0
	.word sub_020655B8, sub_020655F0, 0
	.word sub_02065614, sub_02065648, 0
_020FE3CC:
	.word sub_020663B4
	.word sub_020663E4
_020FE3D4:
	.word sub_02066064
	.word sub_020660A0
_020FE3DC:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0xFE, 0xFF, 0x00, 0x00, 0x00, 0x00
_020FE3E8:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFE, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00
_020FE3F4:
	.word 12, 13, 14, 15
_020FE404:
	.word sub_02065A4C
	.word sub_02065C2C
	.word sub_02065C48
	.word sub_02065C90
_020FE414:
	.word sub_02065B70
	.word sub_02065C2C
	.word sub_02065C48
	.word sub_02065C90
_020FE424:
	.word sub_02065BE8
	.word sub_02065C2C
	.word sub_02065C48
	.word sub_02065C90
_020FE434:
	.word 16, 17, 18, 19
_020FE444:
	.word 20, 21, 22, 23
_020FE454:
	.short 0x0060, 0x0993, SEQ_GS_TAIKAIMAE_D5
	.short 0x0066, 0x0993, SEQ_GS_TAIKAIMAE
	.short 0x0068, 0x0993, SEQ_GS_TAIKAIMAE
	.short 0x01AB, 0x0994, SEQ_GS_EYE_ROCKET
	.short 0x001C, 0x0995, SEQ_GS_EYE_ROCKET
	.short 0x006D, 0x0999, SEQ_GS_SAFARI_FIELD
	.short 0x0070, 0x099B, SEQ_GS_SENKYO
	.short 0x00BA, 0x099B, SEQ_GS_SENKYO
	.short 0x00BB, 0x099B, SEQ_GS_SENKYO
	.short 0x00BC, 0x099B, SEQ_GS_SENKYO
	.short 0x00BD, 0x099B, SEQ_GS_SENKYO
	.short 0x00BE, 0x099B, SEQ_GS_SENKYO
	.short 0x01BF, 0x099B, SEQ_GS_SENKYO

	.balign 4, 0
_020FE4A4:
	.byte 0xF2, 0x06, 0x7C, 0xAD
_020FE4A8:
	.byte 0x08, 0x62, 0x29, 0xF2, 0x82, 0x03, 0x28, 0x12
_020FE4B0:
	.byte 0x00, 0x01, 0x02, 0x03, 0x04, 0x00, 0x00, 0x00
_020FE4B8:
	.byte 0x21, 0x00, 0x00, 0x00, 0x22, 0x00, 0x00, 0x00
	.byte 0x23, 0x00, 0x00, 0x00, 0x24, 0x00, 0x00, 0x00, 0x25, 0x00, 0x00, 0x00, 0x26, 0x00, 0x00, 0x00
	.byte 0x27, 0x00, 0x00, 0x00, 0x28, 0x00, 0x00, 0x00, 0x29, 0x00, 0x00, 0x00, 0x2A, 0x00, 0x00, 0x00
	.byte 0x2B, 0x00, 0x00, 0x00, 0x2C, 0x00, 0x00, 0x00, 0x2D, 0x00, 0x00, 0x00, 0x2E, 0x00, 0x00, 0x00
	.byte 0x2F, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x0B, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00
	.byte 0x0F, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x11, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00
	.byte 0x13, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x15, 0x00, 0x00, 0x00, 0x16, 0x00, 0x00, 0x00
	.byte 0x17, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x19, 0x00, 0x00, 0x00, 0x1A, 0x00, 0x00, 0x00
	.byte 0x5B, 0x00, 0x00, 0x00, 0x5C, 0x00, 0x00, 0x00, 0x5D, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x00, 0x00
	.byte 0x1C, 0x00, 0x00, 0x00, 0x1E, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00
_020FE55C:
	.byte 0x02, 0x00, 0x01, 0x00
	.byte 0x0F, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x01, 0x00, 0x03, 0x00, 0x07, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x02, 0x00, 0x04, 0x00, 0x07, 0x00, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x02, 0x00, 0x03, 0x00, 0x05, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0x02, 0x00, 0x04, 0x00, 0x06, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x02, 0x00, 0x05, 0x00, 0x07, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00
	.byte 0x02, 0x00, 0x03, 0x00, 0x08, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x07, 0x00
	.byte 0x09, 0x00, 0x0B, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x08, 0x00, 0x0A, 0x00
	.byte 0x0B, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x00, 0x09, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x04, 0x00, 0x08, 0x00, 0x09, 0x00, 0x0C, 0x00, 0x0D, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x02, 0x00, 0x0B, 0x00, 0x0D, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0x03, 0x00, 0x0B, 0x00, 0x0C, 0x00, 0x0F, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x02, 0x00, 0x0D, 0x00, 0x0F, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x02, 0x00
	.byte 0x00, 0x00, 0x0E, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x02, 0x00, 0x11, 0x00
	.byte 0x25, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x10, 0x00, 0x25, 0x00
	.byte 0x12, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x02, 0x00, 0x11, 0x00, 0x13, 0x00, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x12, 0x00, 0x14, 0x00, 0x26, 0x00, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x06, 0x00, 0x13, 0x00, 0x15, 0x00, 0x16, 0x00, 0x17, 0x00, 0x18, 0x00
	.byte 0x26, 0x00, 0x03, 0x00, 0x16, 0x00, 0x17, 0x00, 0x1A, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x04, 0x00, 0x14, 0x00, 0x15, 0x00, 0x17, 0x00, 0x1F, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x05, 0x00
	.byte 0x14, 0x00, 0x15, 0x00, 0x16, 0x00, 0x19, 0x00, 0x1B, 0x00, 0xFF, 0xFF, 0x04, 0x00, 0x13, 0x00
	.byte 0x14, 0x00, 0x19, 0x00, 0x26, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x17, 0x00, 0x18, 0x00
	.byte 0x1B, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x02, 0x00, 0x15, 0x00, 0x1B, 0x00, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x04, 0x00, 0x17, 0x00, 0x19, 0x00, 0x1A, 0x00, 0x1C, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x02, 0x00, 0x1B, 0x00, 0x1D, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0x02, 0x00, 0x1C, 0x00, 0x1E, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x03, 0x00, 0x1D, 0x00, 0x21, 0x00, 0x22, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x02, 0x00
	.byte 0x16, 0x00, 0x25, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x02, 0x00, 0x1F, 0x00
	.byte 0x21, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x1E, 0x00, 0x20, 0x00
	.byte 0x22, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x02, 0x00, 0x1E, 0x00, 0x21, 0x00, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x02, 0x00, 0x22, 0x00, 0x24, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x02, 0x00, 0x10, 0x00, 0x22, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x04, 0x00, 0x10, 0x00, 0x11, 0x00, 0x27, 0x00, 0x28, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x03, 0x00, 0x13, 0x00, 0x14, 0x00, 0x18, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x02, 0x00
	.byte 0x25, 0x00, 0x28, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x25, 0x00
	.byte 0x27, 0x00, 0x18, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00
_020FE79C:
	.word ov71_02246960, ov71_02246BB8, ov71_02246B58, SDK_OVERLAY_OVY_71_ID
_020FE7AC:
	.byte 0x49, 0x00, 0x01, 0x00
	.byte 0x21, 0x00, 0x01, 0x00, 0x4A, 0x00, 0x01, 0x00, 0xFE, 0x00, 0x00, 0x00
_020FE7BC:
	.word sub_02067F9C, sub_02067F68
	.word sub_0206809C, sub_0206800C
	.word sub_02068150, sub_020680E0
	.word sub_02068200, sub_020681C0
	.word sub_020682A8, sub_02068270
	.word sub_02068360, sub_02068318
	.word sub_02068430, sub_020683D0
	.word sub_020684D0, sub_020684A0
	.word sub_020685D0, sub_02068554
	.word sub_020686BC, sub_02068664
	.word sub_02068780, sub_02068750
	.word sub_020687E4, sub_020687D0
	.word sub_020688A4, sub_0206885C
	.word sub_02068934, sub_02068914
