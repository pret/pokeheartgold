#include "constants/sndseq.h"
#include "constants/moves.h"
#include "constants/std_script.h"
#include "constants/species.h"
#include "constants/sprites.h"
#include "constants/maps.h"
#include "constants/mmodel.h"
#include "constants/items.h"
#include "msgdata/msg/msg_0096_D31R0201.h"
#include "msgdata/msg/msg_0066_D23R0102.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.public ov01_02208C5C

	.text

	thumb_func_start ov01_021F1348
ov01_021F1348: ; 0x021F1348
	push {r3, r4, r5, r6, r7, lr}
	add r7, r2, #0
	add r6, r0, #0
	add r5, r1, #0
	add r0, r7, #0
	mov r1, #0x24
	bl AllocFromHeap
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x24
	bl memset
	str r7, [r4]
	str r5, [r4, #4]
	str r6, [r4, #0x10]
	add r0, r7, #0
	lsl r1, r5, #3
	bl AllocFromHeap
	str r0, [r4, #0x14]
	add r0, r4, #0
	bl ov01_021F14DC
	add r0, r4, #0
	bl ov01_021F147C
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_021F1348

	thumb_func_start ov01_021F1384
ov01_021F1384: ; 0x021F1384
	ldr r3, _021F138C ; =ov01_021F15EC
	str r1, [r0, #8]
	bx r3
	nop
_021F138C: .word ov01_021F15EC
	thumb_func_end ov01_021F1384

	thumb_func_start ov01_021F1390
ov01_021F1390: ; 0x021F1390
	push {r3, r4, lr}
	sub sp, #0x14
	ldr r4, [sp, #0x20]
	str r4, [sp]
	ldr r4, [sp, #0x24]
	str r4, [sp, #4]
	ldr r4, [sp, #0x28]
	str r4, [sp, #8]
	ldr r4, [sp, #0x2c]
	str r4, [sp, #0xc]
	ldr r4, [sp, #0x30]
	str r4, [sp, #0x10]
	bl ov01_021F1648
	add sp, #0x14
	pop {r3, r4, pc}
	thumb_func_end ov01_021F1390

	thumb_func_start ov01_021F13B0
ov01_021F13B0: ; 0x021F13B0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov01_021F1588
	cmp r0, #0
	beq _021F13C4
	bl GF_AssertFail
	pop {r3, r4, r5, pc}
_021F13C4:
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_021F14F4
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021F13B0

	thumb_func_start ov01_021F13D0
ov01_021F13D0: ; 0x021F13D0
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldr r1, [r4]
	add r5, r0, #0
	cmp r1, #0x17
	beq _021F13EA
_021F13DC:
	add r0, r5, #0
	bl ov01_021F13B0
	add r4, r4, #4
	ldr r1, [r4]
	cmp r1, #0x17
	bne _021F13DC
_021F13EA:
	pop {r3, r4, r5, pc}
	thumb_func_end ov01_021F13D0

	thumb_func_start ov01_021F13EC
ov01_021F13EC: ; 0x021F13EC
	ldr r3, _021F13F0 ; =ov01_021F1610
	bx r3
	.balign 4, 0
_021F13F0: .word ov01_021F1610
	thumb_func_end ov01_021F13EC

	thumb_func_start ov01_021F13F4
ov01_021F13F4: ; 0x021F13F4
	push {r4, lr}
	add r4, r0, #0
	bl ov01_021F15FC
	add r0, r4, #0
	bl ov01_021F1538
	add r0, r4, #0
	bl ov01_021F16B8
	add r0, r4, #0
	bl ov01_021F1490
	ldr r0, [r4, #0x14]
	bl FreeToHeap
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end ov01_021F13F4

	thumb_func_start ov01_021F141C
ov01_021F141C: ; 0x021F141C
	push {r3, lr}
	cmp r2, #0
	ldr r0, [r0]
	bne _021F142A
	bl AllocFromHeap
	pop {r3, pc}
_021F142A:
	bl AllocFromHeapAtEnd
	pop {r3, pc}
	thumb_func_end ov01_021F141C

	thumb_func_start ov01_021F1430
ov01_021F1430: ; 0x021F1430
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r4, r3, #0
	bl ov01_021F141C
	add r1, r4, #0
	add r2, r5, #0
	add r6, r0, #0
	bl memset
	add r0, r6, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov01_021F1430

	thumb_func_start ov01_021F1448
ov01_021F1448: ; 0x021F1448
	ldr r3, _021F144C ; =FreeToHeap
	bx r3
	.balign 4, 0
_021F144C: .word FreeToHeap
	thumb_func_end ov01_021F1448

	thumb_func_start ov01_021F1450
ov01_021F1450: ; 0x021F1450
	push {r3, lr}
	bl ov01_021F1588
	cmp r0, #0
	bne _021F1462
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
_021F1462:
	ldr r0, [r0, #4]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov01_021F1450

	thumb_func_start ov01_021F1468
ov01_021F1468: ; 0x021F1468
	ldr r0, [r0, #0x10]
	bx lr
	thumb_func_end ov01_021F1468

	thumb_func_start ov01_021F146C
ov01_021F146C: ; 0x021F146C
	push {r3, lr}
	bl MapObject_GetFieldSysPtr
	ldr r0, [r0, #0x44]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov01_021F146C

	thumb_func_start ov01_021F1478
ov01_021F1478: ; 0x021F1478
	ldr r0, [r0]
	bx lr
	thumb_func_end ov01_021F1478

	thumb_func_start ov01_021F147C
ov01_021F147C: ; 0x021F147C
	push {r4, lr}
	add r4, r0, #0
	bl ov01_021F1478
	add r1, r0, #0
	mov r0, #0x67
	bl NARC_ctor
	str r0, [r4, #0x18]
	pop {r4, pc}
	thumb_func_end ov01_021F147C

	thumb_func_start ov01_021F1490
ov01_021F1490: ; 0x021F1490
	ldr r3, _021F1498 ; =NARC_dtor
	ldr r0, [r0, #0x18]
	bx r3
	nop
_021F1498: .word NARC_dtor
	thumb_func_end ov01_021F1490

	thumb_func_start ov01_021F149C
ov01_021F149C: ; 0x021F149C
	ldr r3, _021F14A4 ; =NARC_GetMemberSize
	ldr r0, [r0, #0x18]
	bx r3
	nop
_021F14A4: .word NARC_GetMemberSize
	thumb_func_end ov01_021F149C

	thumb_func_start ov01_021F14A8
ov01_021F14A8: ; 0x021F14A8
	ldr r3, _021F14B0 ; =NARC_ReadWholeMember
	ldr r0, [r0, #0x18]
	bx r3
	nop
_021F14B0: .word NARC_ReadWholeMember
	thumb_func_end ov01_021F14A8

	thumb_func_start ov01_021F14B4
ov01_021F14B4: ; 0x021F14B4
	push {r4, r5, r6, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x18]
	add r5, r2, #0
	add r6, r1, #0
	bl NARC_GetMemberSize
	add r1, r0, #0
	add r0, r4, #0
	add r2, r5, #0
	bl ov01_021F141C
	add r5, r0, #0
	ldr r0, [r4, #0x18]
	add r1, r6, #0
	add r2, r5, #0
	bl NARC_ReadWholeMember
	add r0, r5, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov01_021F14B4

	thumb_func_start ov01_021F14DC
ov01_021F14DC: ; 0x021F14DC
	push {r3, r4, r5, lr}
	ldr r4, [r0, #4]
	ldr r5, [r0, #0x14]
	cmp r4, #0
	beq _021F14F2
_021F14E6:
	add r0, r5, #0
	bl ov01_021F15A0
	add r5, #8
	sub r4, r4, #1
	bne _021F14E6
_021F14F2:
	pop {r3, r4, r5, pc}
	thumb_func_end ov01_021F14DC

	thumb_func_start ov01_021F14F4
ov01_021F14F4: ; 0x021F14F4
	push {r4, r5, r6, lr}
	add r6, r1, #0
	add r5, r0, #0
	add r0, r6, #0
	bl ov01_021F15C4
	add r1, r0, #0
	ldr r1, [r1, #4]
	add r0, r5, #0
	blx r1
	add r4, r0, #0
	add r0, r5, #0
	bl ov01_021F1560
	add r1, r6, #0
	add r2, r4, #0
	bl ov01_021F15AC
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov01_021F14F4

	thumb_func_start ov01_021F151C
ov01_021F151C: ; 0x021F151C
	push {r4, lr}
	add r4, r1, #0
	ldr r0, [r4]
	bl ov01_021F15C4
	add r1, r0, #0
	ldr r0, [r4, #4]
	ldr r1, [r1, #8]
	blx r1
	add r0, r4, #0
	bl ov01_021F15A0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021F151C

	thumb_func_start ov01_021F1538
ov01_021F1538: ; 0x021F1538
	push {r4, r5, r6, lr}
	add r6, r0, #0
	ldr r4, [r6, #4]
	ldr r5, [r6, #0x14]
	cmp r4, #0
	beq _021F155C
_021F1544:
	add r0, r5, #0
	bl ov01_021F15B4
	cmp r0, #0
	bne _021F1556
	add r0, r6, #0
	add r1, r5, #0
	bl ov01_021F151C
_021F1556:
	add r5, #8
	sub r4, r4, #1
	bne _021F1544
_021F155C:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov01_021F1538

	thumb_func_start ov01_021F1560
ov01_021F1560: ; 0x021F1560
	push {r3, r4, r5, lr}
	ldr r4, [r0, #4]
	ldr r5, [r0, #0x14]
	cmp r4, #0
	beq _021F157E
_021F156A:
	add r0, r5, #0
	bl ov01_021F15B4
	cmp r0, #1
	bne _021F1578
	add r0, r5, #0
	pop {r3, r4, r5, pc}
_021F1578:
	add r5, #8
	sub r4, r4, #1
	bne _021F156A
_021F157E:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021F1560

	thumb_func_start ov01_021F1588
ov01_021F1588: ; 0x021F1588
	ldr r3, [r0, #4]
	ldr r0, [r0, #0x14]
	cmp r3, #0
	beq _021F159C
_021F1590:
	ldr r2, [r0]
	cmp r2, r1
	beq _021F159E
	add r0, #8
	sub r3, r3, #1
	bne _021F1590
_021F159C:
	mov r0, #0
_021F159E:
	bx lr
	thumb_func_end ov01_021F1588

	thumb_func_start ov01_021F15A0
ov01_021F15A0: ; 0x021F15A0
	mov r1, #0x17
	str r1, [r0]
	mov r1, #0
	str r1, [r0, #4]
	bx lr
	.balign 4, 0
	thumb_func_end ov01_021F15A0

	thumb_func_start ov01_021F15AC
ov01_021F15AC: ; 0x021F15AC
	str r1, [r0]
	str r2, [r0, #4]
	bx lr
	.balign 4, 0
	thumb_func_end ov01_021F15AC

	thumb_func_start ov01_021F15B4
ov01_021F15B4: ; 0x021F15B4
	ldr r0, [r0]
	cmp r0, #0x17
	bne _021F15BE
	mov r0, #1
	bx lr
_021F15BE:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov01_021F15B4

	thumb_func_start ov01_021F15C4
ov01_021F15C4: ; 0x021F15C4
	push {r3, lr}
	ldr r1, _021F15E8 ; =ov01_02208C5C
	ldr r2, [r1]
	cmp r2, #0x17
	beq _021F15DE
_021F15CE:
	cmp r2, r0
	bne _021F15D6
	add r0, r1, #0
	pop {r3, pc}
_021F15D6:
	add r1, #0xc
	ldr r2, [r1]
	cmp r2, #0x17
	bne _021F15CE
_021F15DE:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
	nop
_021F15E8: .word ov01_02208C5C
	thumb_func_end ov01_021F15C4

	thumb_func_start ov01_021F15EC
ov01_021F15EC: ; 0x021F15EC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	ldr r1, [r4, #8]
	bl sub_020689C8
	str r0, [r4, #0x1c]
	pop {r4, pc}
	thumb_func_end ov01_021F15EC

	thumb_func_start ov01_021F15FC
ov01_021F15FC: ; 0x021F15FC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x1c]
	cmp r0, #0
	beq _021F160E
	bl sub_020689F8
	mov r0, #0
	str r0, [r4, #0x1c]
_021F160E:
	pop {r4, pc}
	thumb_func_end ov01_021F15FC

	thumb_func_start ov01_021F1610
ov01_021F1610: ; 0x021F1610
	push {r3, lr}
	ldr r0, [r0, #0x1c]
	cmp r0, #0
	beq _021F161C
	bl sub_02068BAC
_021F161C:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov01_021F1610

	thumb_func_start ov01_021F1620
ov01_021F1620: ; 0x021F1620
	push {r4, lr}
	sub sp, #8
	ldr r4, [sp, #0x10]
	str r4, [sp]
	ldr r4, [sp, #0x14]
	str r4, [sp, #4]
	ldr r0, [r0, #0x1c]
	bl sub_02068B0C
	add r4, r0, #0
	bne _021F163A
	bl GF_AssertFail
_021F163A:
	add r0, r4, #0
	add sp, #8
	pop {r4, pc}
	thumb_func_end ov01_021F1620

	thumb_func_start ov01_021F1640
ov01_021F1640: ; 0x021F1640
	ldr r3, _021F1644 ; =sub_02068B48
	bx r3
	.balign 4, 0
_021F1644: .word sub_02068B48
	thumb_func_end ov01_021F1640

	thumb_func_start ov01_021F1648
ov01_021F1648: ; 0x021F1648
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r6, r2, #0
	add r5, r1, #0
	mov r2, #0
	str r3, [sp]
	mov r1, #0x24
	add r3, r2, #0
	add r7, r0, #0
	bl ov01_021F1430
	add r4, r0, #0
	str r4, [r7, #0x20]
	str r5, [r4]
	ldr r0, [sp]
	strh r6, [r4, #4]
	strh r0, [r4, #6]
	ldr r0, [sp, #0x20]
	ldr r2, [sp, #0x28]
	strh r0, [r4, #8]
	ldr r0, [sp, #0x24]
	ldr r3, [sp]
	strh r0, [r4, #0xa]
	add r0, r5, #0
	mov r1, #0x44
	bl ov01_021FC4C4
	str r0, [r4, #0x10]
	ldr r2, [sp, #0x2c]
	ldr r3, [sp, #0x20]
	add r0, r5, #0
	mov r1, #0x45
	bl ov01_021FC4C4
	str r0, [r4, #0x14]
	ldr r0, [sp, #0x24]
	add r1, r5, #0
	bl sub_02025780
	str r0, [r4, #0x18]
	add r0, r7, #0
	add r1, r4, #0
	add r2, r6, #0
	bl ov01_021F17BC
	add r0, r7, #0
	str r6, [sp, #4]
	bl ov01_021F1478
	str r0, [sp, #8]
	add r0, sp, #4
	bl sub_020237EC
	str r0, [r4, #0xc]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov01_021F1648

	thumb_func_start ov01_021F16B8
ov01_021F16B8: ; 0x021F16B8
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r5, [r4, #0x20]
	cmp r5, #0
	beq _021F16EA
	ldr r0, [r5, #0xc]
	bl sub_02023874
	add r0, r5, #0
	bl ov01_021F17F0
	ldr r0, [r5, #0x10]
	bl ov01_021FC520
	ldr r0, [r5, #0x14]
	bl ov01_021FC520
	ldr r0, [r5, #0x18]
	bl sub_020257C4
	add r0, r5, #0
	bl ov01_021F1448
	mov r0, #0
	str r0, [r4, #0x20]
_021F16EA:
	pop {r3, r4, r5, pc}
	thumb_func_end ov01_021F16B8

	thumb_func_start ov01_021F16EC
ov01_021F16EC: ; 0x021F16EC
	push {r4, lr}
	sub sp, #0x20
	ldr r0, [r0, #0x20]
	add r3, sp, #8
	ldr r0, [r0, #0xc]
	str r0, [sp]
	str r1, [sp, #4]
	ldmia r2!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r2]
	add r2, sp, #0x14
	str r0, [r3]
	ldr r3, _021F173C ; =ov01_02206988
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	add r0, sp, #0
	bl sub_02023D44
	add r4, r0, #0
	bne _021F171C
	bl GF_AssertFail
_021F171C:
	cmp r4, #0
	beq _021F1736
	add r0, r4, #0
	bl sub_02023F90
	mov r1, #1
	bl NNS_G3dMdlSetMdlFogEnableFlagAll
	add r0, r4, #0
	bl sub_02023F90
	bl ov01_021EA3B0
_021F1736:
	add r0, r4, #0
	add sp, #0x20
	pop {r4, pc}
	.balign 4, 0
_021F173C: .word ov01_02206988
	thumb_func_end ov01_021F16EC

	thumb_func_start ov01_021F1740
ov01_021F1740: ; 0x021F1740
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x20]
	add r4, r2, #0
	bl ov01_021F18A8
	add r1, r0, #0
	add r0, r5, #0
	add r2, r4, #0
	bl ov01_021F16EC
	pop {r3, r4, r5, pc}
	thumb_func_end ov01_021F1740

	thumb_func_start ov01_021F1758
ov01_021F1758: ; 0x021F1758
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	ldr r5, [r0, #0x20]
	add r6, r1, #0
	ldr r0, [r5, #0x10]
	add r1, r2, #0
	add r4, r3, #0
	bl ov01_021FC5A4
	add r7, r0, #0
	ldr r0, [r5, #0x14]
	add r1, r4, #0
	bl ov01_021FC5A4
	add r1, sp, #0xc
	bl sub_02026E18
	ldr r0, [r5, #0x18]
	ldr r1, [sp, #0x30]
	bl sub_02025940
	add r4, r0, #0
	bne _021F178A
	bl GF_AssertFail
_021F178A:
	add r0, r4, #0
	bl sub_0202599C
	ldr r1, [sp, #0x34]
	cmp r1, #1
	bne _021F1798
	mov r4, #0
_021F1798:
	str r0, [sp]
	ldr r0, [sp, #0x38]
	str r4, [sp, #4]
	str r0, [sp, #8]
	add r0, r5, #0
	add r1, r6, #0
	add r2, r7, #0
	add r3, sp, #0xc
	bl ov01_021F1824
	add r4, r0, #0
	bne _021F17B4
	bl GF_AssertFail
_021F17B4:
	add r0, r4, #0
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_021F1758

	thumb_func_start ov01_021F17BC
ov01_021F17BC: ; 0x021F17BC
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	add r5, r2, #0
	mov r1, #0x28
	add r7, r0, #0
	mul r1, r5
	mov r2, #0
	bl ov01_021F141C
	add r4, r0, #0
	add r0, r7, #0
	lsl r1, r5, #3
	mov r2, #0
	str r4, [r6, #0x20]
	bl ov01_021F141C
	str r0, [r6, #0x1c]
	mov r1, #0xf
_021F17E0:
	str r1, [r0]
	str r4, [r0, #4]
	add r0, #8
	add r4, #0x28
	sub r5, r5, #1
	bne _021F17E0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_021F17BC

	thumb_func_start ov01_021F17F0
ov01_021F17F0: ; 0x021F17F0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x1c]
	bl ov01_021F1448
	ldr r0, [r4, #0x20]
	bl ov01_021F1448
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021F17F0

	thumb_func_start ov01_021F1804
ov01_021F1804: ; 0x021F1804
	push {r3, lr}
	ldrh r2, [r0, #4]
	ldr r3, [r0, #0x1c]
_021F180A:
	ldr r0, [r3]
	cmp r0, r1
	bne _021F1816
	mov r0, #0xf
	str r0, [r3]
	pop {r3, pc}
_021F1816:
	add r3, #8
	sub r2, r2, #1
	bne _021F180A
	bl GF_AssertFail
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov01_021F1804

	thumb_func_start ov01_021F1824
ov01_021F1824: ; 0x021F1824
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldrh r5, [r6, #4]
	add r0, r1, #0
	ldr r1, [sp, #0x1c]
	str r2, [sp]
	ldr r6, [r6, #0x1c]
	add r7, r3, #0
	str r1, [sp, #0x1c]
	mov r4, #0
	add r2, r5, #0
	add r3, r6, #0
_021F183C:
	ldr r1, [r3]
	cmp r1, r0
	bne _021F1846
	ldr r0, [r3, #4]
	pop {r3, r4, r5, r6, r7, pc}
_021F1846:
	add r3, #8
	sub r2, r2, #1
	bne _021F183C
_021F184C:
	ldr r1, [r6]
	cmp r1, #0xf
	bne _021F1858
	str r0, [r6]
	ldr r4, [r6, #4]
	b _021F185E
_021F1858:
	add r6, #8
	sub r5, r5, #1
	bne _021F184C
_021F185E:
	cmp r4, #0
	bne _021F1866
	bl GF_AssertFail
_021F1866:
	add r0, r4, #0
	mov r1, #0
	mov r2, #0x28
	bl memset
	ldr r0, [sp]
	add r2, r4, #0
	str r0, [r4]
	add r2, #0xc
	ldmia r7!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r7!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [sp, #0x18]
	str r0, [r4, #4]
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	beq _021F18A0
	bl sub_02025A9C
	str r0, [r4, #0x1c]
	ldr r0, [sp, #0x1c]
	bl sub_02025AAC
	str r0, [r4, #0x20]
	ldr r0, [sp, #0x1c]
	bl sub_02025ABC
	str r0, [r4, #0x24]
_021F18A0:
	ldr r0, [sp, #0x20]
	str r0, [r4, #8]
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov01_021F1824

	thumb_func_start ov01_021F18A8
ov01_021F18A8: ; 0x021F18A8
	push {r3, lr}
	ldrh r2, [r0, #4]
	ldr r3, [r0, #0x1c]
_021F18AE:
	ldr r0, [r3]
	cmp r0, r1
	bne _021F18B8
	ldr r0, [r3, #4]
	pop {r3, pc}
_021F18B8:
	add r3, #8
	sub r2, r2, #1
	bne _021F18AE
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov01_021F18A8

	thumb_func_start ov01_021F18C8
ov01_021F18C8: ; 0x021F18C8
	ldr r3, _021F18D0 ; =ov01_021F1804
	ldr r0, [r0, #0x20]
	bx r3
	nop
_021F18D0: .word ov01_021F1804
	thumb_func_end ov01_021F18C8

	thumb_func_start ov01_021F18D4
ov01_021F18D4: ; 0x021F18D4
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	mov r0, #0
	str r0, [sp]
	ldr r0, [r4, #0x20]
	add r3, r2, #0
	ldr r0, [r0, #0x10]
	ldr r2, [r4, #0x18]
	bl ov01_021FC5CC
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021F18D4

	thumb_func_start ov01_021F18F0
ov01_021F18F0: ; 0x021F18F0
	ldr r0, [r0, #0x20]
	ldr r3, _021F18F8 ; =ov01_021FC5A4
	ldr r0, [r0, #0x10]
	bx r3
	.balign 4, 0
_021F18F8: .word ov01_021FC5A4
	thumb_func_end ov01_021F18F0

	thumb_func_start ov01_021F18FC
ov01_021F18FC: ; 0x021F18FC
	ldr r0, [r0, #0x20]
	ldr r3, _021F1904 ; =ov01_021FC588
	ldr r0, [r0, #0x10]
	bx r3
	.balign 4, 0
_021F1904: .word ov01_021FC588
	thumb_func_end ov01_021F18FC

	thumb_func_start ov01_021F1908
ov01_021F1908: ; 0x021F1908
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	mov r0, #0
	str r0, [sp]
	ldr r0, [r4, #0x20]
	add r3, r2, #0
	ldr r0, [r0, #0x14]
	ldr r2, [r4, #0x18]
	bl ov01_021FC5CC
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021F1908

	thumb_func_start ov01_021F1924
ov01_021F1924: ; 0x021F1924
	ldr r0, [r0, #0x20]
	ldr r3, _021F192C ; =ov01_021FC588
	ldr r0, [r0, #0x14]
	bx r3
	.balign 4, 0
_021F192C: .word ov01_021FC588
	thumb_func_end ov01_021F1924

	thumb_func_start ov01_021F1930
ov01_021F1930: ; 0x021F1930
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r6, r1, #0
	add r1, r2, #0
	ldr r4, [r5, #0x20]
	mov r2, #1
	add r7, r3, #0
	bl ov01_021F14B4
	str r0, [sp, #4]
	add r0, r5, #0
	bl ov01_021F1478
	str r0, [sp]
	ldr r0, [r4, #0x18]
	ldr r1, [sp, #4]
	add r2, r6, #0
	add r3, r7, #0
	bl sub_02025844
	cmp r0, #0
	bne _021F1962
	bl GF_AssertFail
_021F1962:
	ldr r2, [r4, #0x18]
	add r0, r5, #0
	add r1, r6, #0
	bl ov01_021F197C
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov01_021F1930

	thumb_func_start ov01_021F1970
ov01_021F1970: ; 0x021F1970
	ldr r0, [r0, #0x20]
	ldr r3, _021F1978 ; =sub_020258E0
	ldr r0, [r0, #0x18]
	bx r3
	.balign 4, 0
_021F1978: .word sub_020258E0
	thumb_func_end ov01_021F1970

	thumb_func_start ov01_021F197C
ov01_021F197C: ; 0x021F197C
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r6, r2, #0
	mov r1, #0xc
	mov r2, #1
	bl ov01_021F141C
	add r4, r0, #0
	mov r0, #1
	str r0, [r4]
	str r5, [r4, #4]
	ldr r0, _021F19AC ; =ov01_021F19B4
	add r1, r4, #0
	mov r2, #0xff
	str r6, [r4, #8]
	bl sub_0200E33C
	ldr r0, _021F19B0 ; =ov01_021F19D0
	add r1, r4, #0
	mov r2, #0xff
	bl sub_0200E374
	pop {r4, r5, r6, pc}
	nop
_021F19AC: .word ov01_021F19B4
_021F19B0: .word ov01_021F19D0
	thumb_func_end ov01_021F197C

	thumb_func_start ov01_021F19B4
ov01_021F19B4: ; 0x021F19B4
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #8]
	ldr r1, [r4, #4]
	bl sub_020259E0
	mov r0, #1
	str r0, [r4]
	add r0, r5, #0
	bl DestroySysTask
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021F19B4

	thumb_func_start ov01_021F19D0
ov01_021F19D0: ; 0x021F19D0
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4]
	cmp r0, #1
	bne _021F19F0
	ldr r0, [r4, #8]
	ldr r1, [r4, #4]
	bl sub_02025A48
	add r0, r4, #0
	bl ov01_021F1448
	add r0, r5, #0
	bl DestroySysTask
_021F19F0:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021F19D0

	thumb_func_start ov01_021F19F4
ov01_021F19F4: ; 0x021F19F4
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r1, #0
	str r0, [sp]
	ldr r0, [sp, #0x18]
	add r1, r2, #0
	str r0, [sp, #4]
	ldr r2, [r5, #0x18]
	add r0, r4, #0
	bl sub_020696C4
	add r0, r4, #0
	bl sub_02069714
	add sp, #8
	pop {r3, r4, r5, pc}
	thumb_func_end ov01_021F19F4

	thumb_func_start ov01_021F1A18
ov01_021F1A18: ; 0x021F1A18
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	ldr r0, [r4]
	str r0, [sp]
	ldr r0, [sp, #0x10]
	str r0, [sp, #4]
	add r0, r1, #0
	add r1, r2, #0
	ldr r2, [r4, #0x18]
	bl sub_020697DC
	add sp, #8
	pop {r4, pc}
	thumb_func_end ov01_021F1A18

	thumb_func_start ov01_021F1A34
ov01_021F1A34: ; 0x021F1A34
	push {r3, lr}
	ldr r0, [r0]
	str r0, [sp]
	add r0, r1, #0
	add r1, r2, #0
	add r2, r3, #0
	ldr r3, [sp, #8]
	bl sub_02069894
	pop {r3, pc}
	thumb_func_end ov01_021F1A34

	thumb_func_start ov01_021F1A48
ov01_021F1A48: ; 0x021F1A48
	push {r4, r5, r6, lr}
	add r4, r3, #0
	ldr r0, [r4]
	add r6, r1, #0
	add r5, r2, #0
	bl NNS_G3dGetTex
	cmp r0, #0
	beq _021F1A78
	bl sub_0201F53C
	cmp r0, #0
	bne _021F1A78
	ldr r0, [r4]
	ldr r1, [r0, #8]
	bl DC_FlushRange
	ldr r0, [r4]
	bl NNS_G3dResDefaultSetup
	cmp r0, #0
	bne _021F1A78
	bl GF_AssertFail
_021F1A78:
	ldr r0, [r4]
	bl NNS_G3dGetMdlSet
	cmp r0, #0
	beq _021F1AA2
	add r2, r0, #0
	add r2, #8
	beq _021F1A96
	ldrb r1, [r0, #9]
	cmp r1, #0
	bls _021F1A96
	ldrh r1, [r0, #0xe]
	add r1, r2, r1
	add r1, r1, #4
	b _021F1A98
_021F1A96:
	mov r1, #0
_021F1A98:
	cmp r1, #0
	beq _021F1AA2
	ldr r1, [r1]
	add r0, r0, r1
	b _021F1AA4
_021F1AA2:
	mov r0, #0
_021F1AA4:
	str r0, [r5]
	cmp r5, #0
	bne _021F1AAE
	bl GF_AssertFail
_021F1AAE:
	ldr r1, [r5]
	add r0, r6, #0
	bl NNS_G3dRenderObjInit
	pop {r4, r5, r6, pc}
	thumb_func_end ov01_021F1A48

	thumb_func_start ov01_021F1AB8
ov01_021F1AB8: ; 0x021F1AB8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r3, #0
	bl ov01_021F14B4
	ldr r3, [sp, #0x14]
	ldr r2, [sp, #0x10]
	str r0, [r3]
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_021F1A48
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021F1AB8

	thumb_func_start ov01_021F1AD4
ov01_021F1AD4: ; 0x021F1AD4
	push {r3, r4, r5, lr}
	ldr r0, [r0, #0x20]
	ldr r0, [r0, #0x18]
	bl sub_02025940
	add r5, r0, #0
	ldr r4, _021F1AF8 ; =0x00000000
	bne _021F1AE8
	bl GF_AssertFail
_021F1AE8:
	cmp r5, #0
	beq _021F1AF4
	add r0, r5, #0
	bl sub_0202599C
	add r4, r0, #0
_021F1AF4:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021F1AF8: .word 0x00000000
	thumb_func_end ov01_021F1AD4

	.rodata

ov01_02206988: ; 0x02206988
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x10, 0x00, 0x00
