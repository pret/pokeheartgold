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

	.text

	thumb_func_start ov01_022031C0
ov01_022031C0: ; 0x022031C0
	push {r3, r4, r5, lr}
	mov r1, #5
	mov r2, #0
	lsl r1, r1, #6
	add r3, r2, #0
	add r5, r0, #0
	bl ov01_021F1430
	add r4, r0, #0
	add r0, r4, #4
	mov r1, #4
	mov r2, #0x20
	str r5, [r4]
	bl GF_ExpHeap_FndInitAllocator
	add r0, r4, #0
	bl ov01_022031F8
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov01_022031C0

	thumb_func_start ov01_022031E8
ov01_022031E8: ; 0x022031E8
	push {r4, lr}
	add r4, r0, #0
	bl ov01_02203270
	add r0, r4, #0
	bl ov01_021F1448
	pop {r4, pc}
	thumb_func_end ov01_022031E8

	thumb_func_start ov01_022031F8
ov01_022031F8: ; 0x022031F8
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	ldr r0, [r4]
	mov r1, #0x81
	mov r2, #0
	bl ov01_021F14B4
	str r0, [r4, #0x14]
	add r0, r4, #0
	ldr r1, [r4, #0x14]
	add r0, #0x1c
	bl ov01_021FBD38
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0x3c
	add r1, #0x1c
	bl ov01_021FBF2C
	ldr r0, [r4]
	mov r1, #0x68
	mov r2, #0
	bl ov01_021F14B4
	str r0, [r4, #0x18]
	add r0, r4, #0
	ldr r1, [r4, #0x18]
	add r0, #0x2c
	bl ov01_021FBD38
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0xb4
	add r1, #0x2c
	bl ov01_021FBF2C
	mov r0, #4
	str r0, [sp]
	add r0, r4, #4
	str r0, [sp, #4]
	mov r0, #0x4b
	lsl r0, r0, #2
	add r1, r4, #0
	add r0, r4, r0
	add r1, #0x2c
	mov r2, #0x67
	mov r3, #0xa4
	bl ov01_021FBE44
	mov r1, #0x4b
	add r0, r4, #0
	lsl r1, r1, #2
	add r0, #0xb4
	add r1, r4, r1
	bl ov01_021FBF50
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_022031F8

	thumb_func_start ov01_02203270
ov01_02203270: ; 0x02203270
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x1c
	bl ov01_021FBDFC
	ldr r0, [r4, #0x14]
	bl ov01_021F1448
	add r0, r4, #0
	add r0, #0x2c
	bl ov01_021FBDFC
	ldr r0, [r4, #0x18]
	bl ov01_021F1448
	mov r0, #0x4b
	lsl r0, r0, #2
	add r0, r4, r0
	add r1, r4, #4
	bl ov01_021FBE80
	pop {r4, pc}
	thumb_func_end ov01_02203270

	thumb_func_start ov01_0220329C
ov01_0220329C: ; 0x0220329C
	push {r4, r5, r6, lr}
	sub sp, #0x38
	add r6, r0, #0
	add r5, r1, #0
	bl ov01_021F146C
	add r4, r0, #0
	add r0, r6, #0
	add r1, sp, #8
	bl MapObject_GetPositionVec
	mov r0, #6
	ldr r1, [sp, #0x10]
	lsl r0, r0, #0xc
	add r0, r1, r0
	str r0, [sp, #0x10]
	mov r1, #0
	add r0, sp, #8
	strh r1, [r0, #0x1c]
	strh r1, [r0, #0x1e]
	sub r1, r1, #1
	add r0, sp, #0x28
	strb r1, [r0]
	add r0, r4, #0
	str r4, [sp, #0x18]
	bl ov01_021F1468
	str r0, [sp, #0x14]
	add r0, r4, #0
	mov r1, #0x11
	bl ov01_021F1450
	str r0, [sp, #0x1c]
	add r0, r6, #0
	add r1, sp, #0x2c
	str r6, [sp, #0x20]
	bl MapObject_GetPositionVec
	add r0, r6, #0
	mov r1, #2
	bl sub_0205F09C
	cmp r5, #0
	add r1, sp, #8
	bne _0220330A
	str r1, [sp]
	str r0, [sp, #4]
	ldr r1, _0220334C ; =ov01_022094DC
	add r0, r4, #0
	add r2, sp, #0x2c
	mov r3, #1
	bl ov01_021F1620
	add sp, #0x38
	pop {r4, r5, r6, pc}
_0220330A:
	cmp r5, #1
	bne _02203322
	str r1, [sp]
	str r0, [sp, #4]
	ldr r1, _02203350 ; =ov01_022094F0
	add r0, r4, #0
	add r2, sp, #0x2c
	mov r3, #1
	bl ov01_021F1620
	add sp, #0x38
	pop {r4, r5, r6, pc}
_02203322:
	cmp r5, #2
	add r2, sp, #0x2c
	bne _0220333A
	str r1, [sp]
	str r0, [sp, #4]
	ldr r1, _02203354 ; =ov01_02209504
	add r0, r4, #0
	mov r3, #1
	bl ov01_021F1620
	add sp, #0x38
	pop {r4, r5, r6, pc}
_0220333A:
	str r1, [sp]
	str r0, [sp, #4]
	ldr r1, _02203358 ; =ov01_022094C8
	add r0, r4, #0
	mov r3, #1
	bl ov01_021F1620
	add sp, #0x38
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0220334C: .word ov01_022094DC
_02203350: .word ov01_022094F0
_02203354: .word ov01_02209504
_02203358: .word ov01_022094C8
	thumb_func_end ov01_0220329C

	thumb_func_start ov01_0220335C
ov01_0220335C: ; 0x0220335C
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r4, r1, #0
	bl sub_02068D98
	add r3, r0, #0
	mov r0, #0
	add r2, r4, #0
	str r0, [r4]
	add r2, #0x18
	mov r6, #4
_02203374:
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	sub r6, r6, #1
	bne _02203374
	ldr r0, [r3]
	str r0, [r2]
	ldr r0, [r4, #0x30]
	bl MapObject_GetGfxID
	str r0, [r4, #4]
	ldr r0, [r4, #0x30]
	bl MapObject_GetID
	str r0, [r4, #8]
	ldr r0, [r4, #0x30]
	bl sub_0205F254
	add r6, r4, #0
	add r3, sp, #0
	add r6, #0x18
	str r0, [r4, #0xc]
	ldmia r6!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldr r0, [r6]
	add r1, r2, #0
	str r0, [r3]
	ldr r0, [r4, #0x24]
	bl sub_0206121C
	str r0, [r4, #0x14]
	add r0, r5, #0
	add r1, sp, #0
	bl sub_02068DA8
	ldr r0, [r4, #0x2c]
	add r1, sp, #0
	add r0, #0x3c
	bl ov01_021FC014
	ldr r0, [r4, #0x2c]
	add r1, sp, #0
	add r0, #0xb4
	bl ov01_021FC014
	ldr r0, [r4, #0x2c]
	mov r1, #0
	add r0, #0xb4
	bl ov01_021FC004
	mov r0, #1
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov01_0220335C

	thumb_func_start ov01_022033E0
ov01_022033E0: ; 0x022033E0
	bx lr
	.balign 4, 0
	thumb_func_end ov01_022033E0

	thumb_func_start ov01_022033E4
ov01_022033E4: ; 0x022033E4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r4, r1, #0
	ldr r6, [r4, #0x30]
	ldr r1, [r4, #4]
	add r5, r0, #0
	ldr r2, [r4, #8]
	ldr r3, [r4, #0xc]
	add r0, r6, #0
	bl sub_0205F0F8
	cmp r0, #0
	bne _02203408
	add r0, r5, #0
	bl ov01_021F1640
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
_02203408:
	ldr r0, [r4, #0x14]
	cmp r0, #0
	bne _02203440
	add r0, r5, #0
	add r1, sp, #0xc
	bl sub_02068DB8
	add r3, r4, #0
	add r3, #0x18
	add r2, sp, #0
	ldmia r3!, {r0, r1}
	add r7, r2, #0
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	add r1, r7, #0
	str r0, [r2]
	ldr r0, [r4, #0x24]
	bl sub_0206121C
	str r0, [r4, #0x14]
	cmp r0, #1
	bne _02203440
	ldr r0, [sp, #4]
	add r1, sp, #0xc
	str r0, [sp, #0x10]
	add r0, r5, #0
	bl sub_02068DA8
_02203440:
	ldr r0, [r4]
	cmp r0, #0
	beq _02203452
	cmp r0, #1
	beq _02203464
	cmp r0, #2
	beq _02203498
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
_02203452:
	ldr r0, [r4, #0x10]
	add r0, r0, #1
	str r0, [r4, #0x10]
	cmp r0, #2
	blt _022034B2
	mov r0, #1
	add sp, #0x18
	str r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_02203464:
	ldr r0, [r4, #0x2c]
	mov r1, #0
	add r0, #0x3c
	bl ov01_021FC004
	ldr r0, [r4, #0x2c]
	mov r1, #1
	add r0, #0xb4
	bl ov01_021FC004
	add r0, r6, #0
	mov r1, #0
	bl sub_02069DC8
	add r0, r6, #0
	bl sub_0205F484
	mov r0, #0x4b
	ldr r1, [r4, #0x2c]
	lsl r0, r0, #2
	add r0, r1, r0
	mov r1, #0
	bl ov01_021FBF20
	mov r0, #2
	str r0, [r4]
_02203498:
	mov r0, #0x4b
	ldr r1, [r4, #0x2c]
	lsl r0, r0, #2
	add r0, r1, r0
	mov r1, #1
	lsl r1, r1, #0xc
	bl ov01_021FBEE4
	cmp r0, #0
	beq _022034B2
	add r0, r5, #0
	bl ov01_021F1640
_022034B2:
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_022033E4

	thumb_func_start ov01_022034B8
ov01_022034B8: ; 0x022034B8
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0x30]
	ldr r1, [r4, #4]
	ldr r2, [r4, #8]
	ldr r3, [r4, #0xc]
	bl sub_0205F0F8
	cmp r0, #0
	bne _022034DA
	add r0, r5, #0
	bl ov01_021F1640
	add sp, #0xc
	pop {r4, r5, pc}
_022034DA:
	add r0, r5, #0
	add r1, sp, #0
	bl sub_02068DB8
	ldr r0, [r4, #0x2c]
	add r0, #0x3c
	bl ov01_021FBF68
	ldr r0, [r4, #0x2c]
	add r0, #0xb4
	bl ov01_021FBF68
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_022034B8

	thumb_func_start ov01_022034F8
ov01_022034F8: ; 0x022034F8
	push {r4, r5, r6, lr}
	sub sp, #0x18
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0x30]
	ldr r1, [r4, #4]
	ldr r2, [r4, #8]
	ldr r3, [r4, #0xc]
	bl sub_0205F0F8
	cmp r0, #0
	bne _0220351A
	add r0, r5, #0
	bl ov01_021F1640
	add sp, #0x18
	pop {r4, r5, r6, pc}
_0220351A:
	ldr r0, [r4, #0x14]
	cmp r0, #0
	bne _02203552
	add r0, r5, #0
	add r1, sp, #0xc
	bl sub_02068DB8
	add r6, r4, #0
	add r6, #0x18
	add r3, sp, #0
	ldmia r6!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldr r0, [r6]
	add r1, r2, #0
	str r0, [r3]
	ldr r0, [r4, #0x24]
	bl sub_0206121C
	str r0, [r4, #0x14]
	cmp r0, #1
	bne _02203552
	ldr r0, [sp, #4]
	add r1, sp, #0xc
	str r0, [sp, #0x10]
	add r0, r5, #0
	bl sub_02068DA8
_02203552:
	ldr r0, [r4]
	cmp r0, #0
	beq _02203560
	cmp r0, #1
	beq _02203586
	add sp, #0x18
	pop {r4, r5, r6, pc}
_02203560:
	ldr r0, [r4, #0x2c]
	mov r1, #0
	add r0, #0x3c
	bl ov01_021FC004
	ldr r0, [r4, #0x2c]
	mov r1, #1
	add r0, #0xb4
	bl ov01_021FC004
	mov r0, #0x4b
	ldr r1, [r4, #0x2c]
	lsl r0, r0, #2
	add r0, r1, r0
	mov r1, #0
	bl ov01_021FBF20
	mov r0, #1
	str r0, [r4]
_02203586:
	mov r0, #0x4b
	ldr r1, [r4, #0x2c]
	lsl r0, r0, #2
	add r0, r1, r0
	mov r1, #1
	lsl r1, r1, #0xc
	bl ov01_021FBEE4
	cmp r0, #0
	beq _022035A0
	add r0, r5, #0
	bl ov01_021F1640
_022035A0:
	add sp, #0x18
	pop {r4, r5, r6, pc}
	thumb_func_end ov01_022034F8

	thumb_func_start ov01_022035A4
ov01_022035A4: ; 0x022035A4
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0x30]
	ldr r1, [r4, #4]
	ldr r2, [r4, #8]
	ldr r3, [r4, #0xc]
	bl sub_0205F0F8
	cmp r0, #0
	bne _022035C6
	add r0, r5, #0
	bl ov01_021F1640
	add sp, #0xc
	pop {r4, r5, pc}
_022035C6:
	add r0, r5, #0
	add r1, sp, #0
	bl sub_02068DB8
	ldr r0, [r4, #0x2c]
	add r0, #0xb4
	bl ov01_021FBF68
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_022035A4

	thumb_func_start ov01_022035DC
ov01_022035DC: ; 0x022035DC
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r4, r1, #0
	bl sub_02068D98
	add r3, r0, #0
	mov r0, #0
	add r2, r4, #0
	str r0, [r4]
	add r2, #0x18
	mov r6, #4
_022035F4:
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	sub r6, r6, #1
	bne _022035F4
	ldr r0, [r3]
	str r0, [r2]
	ldr r0, [r4, #0x30]
	bl MapObject_GetGfxID
	str r0, [r4, #4]
	ldr r0, [r4, #0x30]
	bl MapObject_GetID
	str r0, [r4, #8]
	ldr r0, [r4, #0x30]
	bl sub_0205F254
	add r6, r4, #0
	add r3, sp, #0
	add r6, #0x18
	str r0, [r4, #0xc]
	ldmia r6!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldr r0, [r6]
	add r1, r2, #0
	str r0, [r3]
	ldr r0, [r4, #0x24]
	bl sub_0206121C
	str r0, [r4, #0x14]
	add r0, r5, #0
	add r1, sp, #0
	bl sub_02068DA8
	ldr r0, [r4, #0x2c]
	add r1, sp, #0
	add r0, #0x3c
	bl ov01_021FC014
	ldr r0, [r4, #0x2c]
	mov r1, #0
	add r0, #0x3c
	bl ov01_021FC004
	mov r0, #1
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov01_022035DC

	thumb_func_start ov01_02203654
ov01_02203654: ; 0x02203654
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r5, r1, #0
	add r4, r0, #0
	ldr r0, [r5, #0x30]
	ldr r1, [r5, #4]
	ldr r2, [r5, #8]
	ldr r3, [r5, #0xc]
	str r0, [sp]
	bl sub_0205F0F8
	cmp r0, #0
	bne _02203678
	add r0, r4, #0
	bl ov01_021F1640
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
_02203678:
	ldr r0, [r5, #0x14]
	cmp r0, #0
	bne _022036B0
	add r0, r4, #0
	add r1, sp, #0x1c
	bl sub_02068DB8
	add r6, r5, #0
	add r6, #0x18
	add r3, sp, #0x10
	ldmia r6!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldr r0, [r6]
	add r1, r2, #0
	str r0, [r3]
	ldr r0, [r5, #0x24]
	bl sub_0206121C
	str r0, [r5, #0x14]
	cmp r0, #1
	bne _022036B0
	ldr r0, [sp, #0x14]
	add r1, sp, #0x1c
	str r0, [sp, #0x20]
	add r0, r4, #0
	bl sub_02068DA8
_022036B0:
	ldr r0, [r5]
	cmp r0, #0
	beq _022036C4
	cmp r0, #1
	beq _0220373E
	cmp r0, #2
	bne _022036C0
	b _022037C8
_022036C0:
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
_022036C4:
	ldr r0, [r5, #0x24]
	bl FollowingPokemon_GetMapObject
	add r6, r0, #0
	ldr r0, [r5, #0x24]
	ldr r0, [r0, #0x3c]
	bl ov01_021F771C
	add r7, r0, #0
	bl sub_02023FB0
	add r4, r0, #0
	add r0, r7, #0
	bl sub_02023FB0
	add r1, r0, #0
	ldr r3, _022037DC ; =0xFFFF0000
	lsl r1, r1, #0x10
	and r3, r4
	lsr r3, r3, #0x10
	ldr r2, _022037E0 ; =ov01_02209B18
	mov r0, #1
	lsr r1, r1, #0xd
	lsl r3, r3, #3
	bl GF_CreateNewVramTransferTask
	add r0, r6, #0
	bl ov01_022055DC
	cmp r0, #0
	beq _02203734
	add r0, r6, #0
	bl MapObject_GetFacingDirection
	lsl r0, r0, #0x18
	add r1, r5, #0
	lsr r4, r0, #0x18
	add r0, r6, #0
	add r1, #0x48
	bl MapObject_GetPositionVec
	add r1, r5, #0
	add r2, r5, #0
	add r0, r4, #0
	add r1, #0x48
	add r2, #0x3c
	bl ov01_022039BC
	ldr r0, [r5, #0x3c]
	ldr r0, [r0]
	str r0, [r5, #0x40]
	add r0, r4, #0
	bl ov01_022039E0
	str r0, [r5, #0x44]
	b _02203738
_02203734:
	mov r0, #0
	str r0, [r5, #0x3c]
_02203738:
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
_0220373E:
	ldr r3, _022037E4 ; =ov01_022094BC
	add r2, sp, #4
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r0, [r5, #0x10]
	add r1, r0, #1
	mov r0, #1
	str r1, [r5, #0x10]
	lsl r0, r0, #0xc
	bl _s32_div_f
	str r0, [sp, #4]
	mov r0, #1
	ldr r1, [r5, #0x10]
	lsl r0, r0, #0xc
	bl _s32_div_f
	str r0, [sp, #8]
	ldr r0, [r5, #0x24]
	ldr r0, [r0, #0x3c]
	bl ov01_021F771C
	add r1, sp, #4
	bl sub_02023E78
	ldr r0, [r5, #0x3c]
	cmp r0, #0
	beq _022037A2
	ldr r0, [r5, #0x24]
	bl FollowingPokemon_GetMapObject
	ldr r3, [r5, #0x10]
	ldr r2, [r5, #0x44]
	add r4, r3, #0
	lsl r2, r2, #0xc
	mul r4, r2
	asr r2, r4, #1
	lsr r2, r2, #0x1e
	add r2, r4, r2
	ldr r1, [r5, #0x40]
	asr r2, r2, #2
	add r2, r1, r2
	ldr r1, [r5, #0x3c]
	str r2, [r1]
	add r1, r5, #0
	add r1, #0x48
	bl MapObject_SetPositionVec
_022037A2:
	ldr r0, [r5, #0x10]
	cmp r0, #4
	blt _022037D8
	ldr r0, [r5]
	mov r1, #1
	add r0, r0, #1
	str r0, [r5]
	ldr r0, [r5, #0x2c]
	add r0, #0x3c
	bl ov01_021FC004
	ldr r0, [sp]
	mov r1, #1
	bl sub_0205F690
	mov r0, #0
	add sp, #0x28
	str r0, [r5, #0x10]
	pop {r3, r4, r5, r6, r7, pc}
_022037C8:
	ldr r0, [r5, #0x10]
	add r0, r0, #1
	str r0, [r5, #0x10]
	cmp r0, #4
	blt _022037D8
	add r0, r4, #0
	bl ov01_021F1640
_022037D8:
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022037DC: .word 0xFFFF0000
_022037E0: .word ov01_02209B18
_022037E4: .word ov01_022094BC
	thumb_func_end ov01_02203654

	thumb_func_start ov01_022037E8
ov01_022037E8: ; 0x022037E8
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0x30]
	ldr r1, [r4, #4]
	ldr r2, [r4, #8]
	ldr r3, [r4, #0xc]
	bl sub_0205F0F8
	cmp r0, #0
	bne _0220380A
	add r0, r5, #0
	bl ov01_021F1640
	add sp, #0xc
	pop {r4, r5, pc}
_0220380A:
	add r0, r5, #0
	add r1, sp, #0
	bl sub_02068DB8
	ldr r0, [r4, #0x2c]
	add r0, #0x3c
	bl ov01_021FBF68
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_022037E8

	thumb_func_start ov01_02203820
ov01_02203820: ; 0x02203820
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r4, r1, #0
	bl sub_02068D98
	add r3, r0, #0
	mov r0, #0
	add r2, r4, #0
	str r0, [r4]
	add r2, #0x18
	mov r6, #4
_02203838:
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	sub r6, r6, #1
	bne _02203838
	ldr r0, [r3]
	str r0, [r2]
	ldr r0, [r4, #0x30]
	bl MapObject_GetGfxID
	str r0, [r4, #4]
	ldr r0, [r4, #0x30]
	bl MapObject_GetID
	str r0, [r4, #8]
	ldr r0, [r4, #0x30]
	bl sub_0205F254
	add r6, r4, #0
	add r3, sp, #0
	add r6, #0x18
	str r0, [r4, #0xc]
	ldmia r6!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldr r0, [r6]
	add r1, r2, #0
	str r0, [r3]
	add r0, r5, #0
	bl sub_02068DA8
	ldr r0, [r4, #0x2c]
	add r1, sp, #0
	add r0, #0x3c
	bl ov01_021FC014
	ldr r0, [r4, #0x2c]
	mov r1, #0
	add r0, #0x3c
	bl ov01_021FC004
	mov r0, #1
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov01_02203820

	thumb_func_start ov01_02203890
ov01_02203890: ; 0x02203890
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r1, #0
	ldr r7, [r5, #0x30]
	ldr r1, [r5, #4]
	add r4, r0, #0
	ldr r2, [r5, #8]
	ldr r3, [r5, #0xc]
	add r0, r7, #0
	bl sub_0205F0F8
	cmp r0, #0
	bne _022038B4
	add r0, r4, #0
	bl ov01_021F1640
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_022038B4:
	ldr r0, [r5]
	cmp r0, #0
	beq _022038C6
	cmp r0, #1
	beq _0220391C
	cmp r0, #2
	beq _022039A4
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_022038C6:
	ldr r0, [r5, #0x24]
	bl FollowingPokemon_GetMapObject
	add r6, r0, #0
	ldr r0, [r5, #0x24]
	ldr r0, [r0, #0x3c]
	bl ov01_021F771C
	add r0, r6, #0
	bl ov01_022055DC
	cmp r0, #0
	beq _02203912
	add r0, r6, #0
	bl MapObject_GetFacingDirection
	lsl r0, r0, #0x18
	add r1, r5, #0
	lsr r4, r0, #0x18
	add r0, r6, #0
	add r1, #0x48
	bl MapObject_GetPositionVec
	add r1, r5, #0
	add r2, r5, #0
	add r0, r4, #0
	add r1, #0x48
	add r2, #0x3c
	bl ov01_022039BC
	ldr r0, [r5, #0x3c]
	ldr r0, [r0]
	str r0, [r5, #0x40]
	add r0, r4, #0
	bl ov01_022039E0
	str r0, [r5, #0x44]
	b _02203916
_02203912:
	mov r0, #0
	str r0, [r5, #0x3c]
_02203916:
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
_0220391C:
	ldr r3, _022039B8 ; =ov01_022094B0
	add r2, sp, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r0, [r5, #0x10]
	add r1, r0, #1
	mov r0, #1
	str r1, [r5, #0x10]
	lsl r0, r0, #0xc
	bl _s32_div_f
	str r0, [sp]
	mov r0, #1
	ldr r1, [r5, #0x10]
	lsl r0, r0, #0xc
	bl _s32_div_f
	str r0, [sp, #4]
	ldr r0, [r5, #0x24]
	ldr r0, [r0, #0x3c]
	bl ov01_021F771C
	add r1, sp, #0
	bl sub_02023E78
	ldr r0, [r5, #0x3c]
	cmp r0, #0
	beq _0220397E
	ldr r0, [r5, #0x24]
	bl FollowingPokemon_GetMapObject
	ldr r2, [r5, #0x44]
	ldr r1, [r5, #0x10]
	lsl r2, r2, #0xc
	mul r2, r1
	asr r1, r2, #1
	lsr r1, r1, #0x1e
	add r1, r2, r1
	ldr r3, [r5, #0x40]
	asr r1, r1, #2
	add r2, r3, r1
	ldr r1, [r5, #0x3c]
	str r2, [r1]
	add r1, r5, #0
	add r1, #0x48
	bl MapObject_SetPositionVec
_0220397E:
	ldr r0, [r5, #0x10]
	cmp r0, #4
	blt _022039B4
	ldr r0, [r5]
	mov r1, #1
	add r0, r0, #1
	str r0, [r5]
	ldr r0, [r5, #0x2c]
	add r0, #0x3c
	bl ov01_021FC004
	add r0, r7, #0
	mov r1, #1
	bl sub_02069DC8
	mov r0, #0
	add sp, #0xc
	str r0, [r5, #0x10]
	pop {r4, r5, r6, r7, pc}
_022039A4:
	ldr r0, [r5, #0x10]
	add r0, r0, #1
	str r0, [r5, #0x10]
	cmp r0, #0x10
	blt _022039B4
	add r0, r4, #0
	bl ov01_021F1640
_022039B4:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_022039B8: .word ov01_022094B0
	thumb_func_end ov01_02203890

	thumb_func_start ov01_022039BC
ov01_022039BC: ; 0x022039BC
	cmp r0, #3
	bhi _022039DC
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022039CC: ; jump table
	.short _022039D4 - _022039CC - 2 ; case 0
	.short _022039D4 - _022039CC - 2 ; case 1
	.short _022039DA - _022039CC - 2 ; case 2
	.short _022039DA - _022039CC - 2 ; case 3
_022039D4:
	add r1, #8
	str r1, [r2]
	bx lr
_022039DA:
	str r1, [r2]
_022039DC:
	bx lr
	.balign 4, 0
	thumb_func_end ov01_022039BC

	thumb_func_start ov01_022039E0
ov01_022039E0: ; 0x022039E0
	push {r3, lr}
	cmp r0, #3
	bhi _02203A0E
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022039F2: ; jump table
	.short _022039FA - _022039F2 - 2 ; case 0
	.short _02203A00 - _022039F2 - 2 ; case 1
	.short _02203A04 - _022039F2 - 2 ; case 2
	.short _02203A0A - _022039F2 - 2 ; case 3
_022039FA:
	mov r0, #0
	mvn r0, r0
	pop {r3, pc}
_02203A00:
	mov r0, #1
	pop {r3, pc}
_02203A04:
	mov r0, #9
	mvn r0, r0
	pop {r3, pc}
_02203A0A:
	mov r0, #0xa
	pop {r3, pc}
_02203A0E:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov01_022039E0

	thumb_func_start ov01_02203A18
ov01_02203A18: ; 0x02203A18
	push {r3, r4, r5, lr}
	mov r2, #0
	mov r1, #8
	add r3, r2, #0
	add r5, r0, #0
	bl ov01_021F1430
	add r4, r0, #0
	str r5, [r4]
	mov r1, #0
	str r1, [r4, #4]
	bl ov01_02203B28
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_02203A18

	thumb_func_start ov01_02203A38
ov01_02203A38: ; 0x02203A38
	push {r4, lr}
	add r4, r0, #0
	bl ov01_02203B70
	add r0, r4, #0
	bl ov01_021F1448
	pop {r4, pc}
	thumb_func_end ov01_02203A38

	thumb_func_start ov01_02203A48
ov01_02203A48: ; 0x02203A48
	push {r3, r4, r5, r6, lr}
	sub sp, #0x2c
	add r5, r0, #0
	add r4, r1, #0
	bl ov01_021F146C
	add r6, r0, #0
	mov r1, #0x12
	str r6, [sp, #0x20]
	bl ov01_021F1450
	str r0, [sp, #0x24]
	str r5, [sp, #0x28]
	ldr r1, [r0, #4]
	cmp r1, #0
	beq _02203A6E
	add sp, #0x2c
	mov r0, #0
	pop {r3, r4, r5, r6, pc}
_02203A6E:
	mov r1, #1
	str r1, [r0, #4]
	add r0, r5, #0
	add r1, sp, #0x14
	bl MapObject_GetPositionVec
	add r0, r5, #0
	add r1, sp, #8
	bl MapObject_GetFacingVec
	mov r0, #0
	str r0, [sp, #0xc]
	add r0, sp, #0x14
	add r1, sp, #8
	add r2, r0, #0
	bl VEC_Add
	add r0, r5, #0
	bl sub_0205F538
	add r1, r0, #1
	add r0, sp, #0x20
	str r0, [sp]
	str r1, [sp, #4]
	ldr r1, _02203AB0 ; =ov01_02209518
	add r0, r6, #0
	add r2, sp, #0x14
	add r3, r4, #0
	bl ov01_021F1620
	add sp, #0x2c
	pop {r3, r4, r5, r6, pc}
	nop
_02203AB0: .word ov01_02209518
	thumb_func_end ov01_02203A48

	thumb_func_start ov01_02203AB4
ov01_02203AB4: ; 0x02203AB4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #4
	mov r1, #8
	add r6, r2, #0
	bl AllocFromHeapAtEnd
	add r2, r0, #0
	str r6, [r2]
	str r4, [r2, #4]
	ldr r0, [r5, #0x10]
	ldr r1, _02203AD4 ; =ov01_02203AD8
	bl TaskManager_Call
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02203AD4: .word ov01_02203AD8
	thumb_func_end ov01_02203AB4

	thumb_func_start ov01_02203AD8
ov01_02203AD8: ; 0x02203AD8
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl TaskManager_GetStatePtr
	add r5, r0, #0
	add r0, r4, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldr r0, [r5]
	cmp r0, #0
	beq _02203AF6
	cmp r0, #1
	beq _02203B06
	b _02203B22
_02203AF6:
	ldr r0, [r4, #4]
	ldr r1, [r4]
	bl ov01_02203A48
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02203B22
_02203B06:
	ldr r0, [r4, #4]
	bl ov01_021F146C
	mov r1, #0x12
	bl ov01_021F1450
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _02203B22
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #1
	pop {r3, r4, r5, pc}
_02203B22:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_02203AD8

	thumb_func_start ov01_02203B28
ov01_02203B28: ; 0x02203B28
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldr r0, [r4]
	mov r1, #0xc
	mov r2, #0x82
	bl ov01_021F18D4
	ldr r0, [r4]
	mov r1, #0xc
	mov r2, #0x8c
	bl ov01_021F1908
	ldr r0, [r4]
	mov r1, #0xd
	mov r2, #0x1c
	mov r3, #1
	bl ov01_021F1930
	mov r0, #0xd
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, _02203B6C ; =ov01_0220952C
	mov r2, #0xc
	str r0, [sp, #8]
	ldr r0, [r4]
	mov r1, #0xe
	add r3, r2, #0
	bl ov01_021F1758
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_02203B6C: .word ov01_0220952C
	thumb_func_end ov01_02203B28

	thumb_func_start ov01_02203B70
ov01_02203B70: ; 0x02203B70
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	mov r1, #0xc
	bl ov01_021F18FC
	ldr r0, [r4]
	mov r1, #0xc
	bl ov01_021F1924
	ldr r0, [r4]
	mov r1, #0xd
	bl ov01_021F1970
	ldr r0, [r4]
	mov r1, #0xe
	bl ov01_021F18C8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_02203B70

	thumb_func_start ov01_02203B98
ov01_02203B98: ; 0x02203B98
	push {r4, lr}
	add r2, r1, #0
	mov r1, #0xe
	bl ov01_021F1740
	add r4, r0, #0
	bl sub_02023F90
	mov r1, #0
	bl NNS_G3dMdlSetMdlFogEnableFlagAll
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_02203B98

	thumb_func_start ov01_02203BB4
ov01_02203BB4: ; 0x02203BB4
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r6, r0, #0
	add r4, r1, #0
	bl sub_02068D98
	add r3, r0, #0
	add r2, r4, #0
	ldmia r3!, {r0, r1}
	add r2, #0x30
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r0, [r4, #0x38]
	bl MapObject_GetID
	str r0, [r4, #8]
	ldr r0, [r4, #0x38]
	bl sub_0205F254
	str r0, [r4, #0xc]
	mov r0, #6
	lsl r0, r0, #0xc
	str r0, [r4, #0x28]
	add r0, r6, #0
	bl sub_02068D90
	lsl r5, r0, #3
	ldr r1, _02203C94 ; =ov01_02209544
	ldr r0, [r4, #0x30]
	ldr r1, [r1, r5]
	mov r2, #1
	bl ov01_021F14B4
	ldr r1, _02203C98 ; =ov01_02209548
	str r0, [r4, #0x58]
	ldr r0, [r4, #0x30]
	ldr r1, [r1, r5]
	mov r2, #1
	bl ov01_021F14B4
	add r1, r4, #0
	str r0, [r4, #0x54]
	add r1, #0x40
	bl sub_02026E18
	ldr r0, [r4, #0x58]
	bl NNS_G3dGetTex
	str r0, [r4, #0x50]
	add r0, r4, #0
	mov r1, #0
	add r0, #0x64
	strh r1, [r0]
	add r0, r4, #0
	add r0, #0x66
	strh r1, [r0]
	ldr r0, [r4, #0x30]
	mov r1, #0xd
	bl ov01_021F1AD4
	add r5, r0, #0
	mov r1, #0
	bl sub_020209AC
	str r0, [r4, #0x60]
	add r0, r5, #0
	mov r1, #0
	bl sub_02020910
	str r0, [r4, #0x5c]
	ldr r0, [r4, #0x50]
	mov r1, #0
	bl sub_02020838
	add r2, r0, #0
	ldr r1, [r4, #0x5c]
	ldr r3, [r4, #0x60]
	mov r0, #0
	bl GF_CreateNewVramTransferTask
	ldr r0, [r5, #0x2c]
	mov r1, #0
	lsl r0, r0, #0x10
	lsr r5, r0, #0xd
	ldr r0, [r4, #0x50]
	bl sub_02020888
	add r2, r0, #0
	mov r0, #1
	add r1, r5, #0
	mov r3, #0x20
	bl GF_CreateNewVramTransferTask
	add r0, r6, #0
	add r1, sp, #0
	bl sub_02068DB8
	ldr r0, [r4, #0x30]
	add r1, sp, #0
	bl ov01_02203B98
	mov r1, #0
	str r0, [r4, #0x3c]
	bl sub_02023EA4
	ldr r0, _02203C9C ; =SEQ_SE_DP_DECIDE
	bl PlaySE
	mov r0, #1
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_02203C94: .word ov01_02209544
_02203C98: .word ov01_02209548
_02203C9C: .word SEQ_SE_DP_DECIDE
	thumb_func_end ov01_02203BB4

	thumb_func_start ov01_02203CA0
ov01_02203CA0: ; 0x02203CA0
	push {r4, lr}
	add r4, r1, #0
	ldr r0, [r4, #0x3c]
	bl sub_02023DA4
	ldr r0, [r4, #0x54]
	bl FreeToHeap
	ldr r0, [r4, #0x58]
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end ov01_02203CA0

	thumb_func_start ov01_02203CB8
ov01_02203CB8: ; 0x02203CB8
	push {r3, r4, r5, r6, lr}
	sub sp, #0x3c
	add r4, r1, #0
	ldr r5, [r4, #0x38]
	ldr r1, [r4, #8]
	add r6, r0, #0
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	bl sub_0205F0A8
	cmp r0, #0
	bne _02203CD4
	bl GF_AssertFail
_02203CD4:
	add r0, r5, #0
	add r1, sp, #0x24
	bl MapObject_GetPositionVec
	add r0, r5, #0
	add r1, sp, #0x18
	bl MapObject_GetFacingVec
	add r0, r5, #0
	add r1, sp, #0xc
	bl sub_0205F990
	add r0, r5, #0
	add r1, sp, #0
	bl sub_0205F9B0
	ldr r3, [sp, #0x24]
	ldr r2, [sp, #0x18]
	ldr r0, [sp, #0xc]
	add r2, r3, r2
	add r0, r0, r2
	ldr r1, [sp]
	ldr r2, [sp, #4]
	add r0, r1, r0
	str r0, [sp, #0x30]
	ldr r1, [sp, #0x28]
	ldr r0, [sp, #0x10]
	ldr r3, [sp, #8]
	add r0, r1, r0
	add r5, r2, r0
	ldr r1, [sp, #0x2c]
	ldr r0, [sp, #0x20]
	ldr r2, [sp, #0x14]
	add r0, r1, r0
	mov r1, #2
	add r0, r2, r0
	lsl r1, r1, #0x10
	add r0, r3, r0
	add r2, r5, r1
	str r5, [sp, #0x34]
	lsr r1, r1, #5
	str r0, [sp, #0x38]
	add r0, r0, r1
	str r2, [sp, #0x34]
	str r0, [sp, #0x38]
	ldr r0, [r4]
	cmp r0, #3
	bhi _02203DB4
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02203D40: ; jump table
	.short _02203D48 - _02203D40 - 2 ; case 0
	.short _02203D76 - _02203D40 - 2 ; case 1
	.short _02203D8A - _02203D40 - 2 ; case 2
	.short _02203DA4 - _02203D40 - 2 ; case 3
_02203D48:
	ldr r0, [r4, #0x3c]
	mov r1, #1
	bl sub_02023EA4
	ldr r1, [r4, #0x1c]
	ldr r0, [r4, #0x28]
	add r0, r1, r0
	str r0, [r4, #0x1c]
	cmp r0, #0
	ble _02203D68
	mov r0, #2
	ldr r1, [r4, #0x28]
	lsl r0, r0, #0xc
	sub r0, r1, r0
	str r0, [r4, #0x28]
	b _02203DB4
_02203D68:
	mov r0, #0
	str r0, [r4, #0x1c]
	str r0, [r4, #0x28]
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02203DB4
_02203D76:
	add r0, r4, #0
	add r0, #0x40
	bl ov01_02203DF8
	cmp r0, #0
	beq _02203DB4
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02203DB4
_02203D8A:
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	cmp r0, #2
	blt _02203DB4
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	mov r0, #0
	str r0, [r4, #4]
	mov r0, #1
	str r0, [r4, #0x14]
	b _02203DB4
_02203DA4:
	ldr r0, [r4, #0x34]
	mov r1, #0
	str r1, [r0, #4]
	add r0, r6, #0
	bl ov01_021F1640
	add sp, #0x3c
	pop {r3, r4, r5, r6, pc}
_02203DB4:
	add r0, r6, #0
	add r1, sp, #0x30
	bl sub_02068DA8
	add sp, #0x3c
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov01_02203CB8

	thumb_func_start ov01_02203DC0
ov01_02203DC0: ; 0x02203DC0
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r1, #0
	ldr r1, [r4, #0x10]
	cmp r1, #1
	beq _02203DF2
	add r1, sp, #0
	bl sub_02068DB8
	ldr r1, [sp]
	ldr r0, [r4, #0x18]
	add r0, r1, r0
	str r0, [sp]
	ldr r1, [sp, #4]
	ldr r0, [r4, #0x1c]
	add r0, r1, r0
	str r0, [sp, #4]
	ldr r1, [sp, #8]
	ldr r0, [r4, #0x20]
	add r0, r1, r0
	str r0, [sp, #8]
	ldr r0, [r4, #0x3c]
	add r1, sp, #0
	bl sub_02023E50
_02203DF2:
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov01_02203DC0

	thumb_func_start ov01_02203DF8
ov01_02203DF8: ; 0x02203DF8
	push {r4, lr}
	add r4, r0, #0
	ldrh r0, [r4, #0x24]
	add r0, r0, #1
	strh r0, [r4, #0x24]
	ldrh r1, [r4, #0x26]
	ldr r2, [r4]
	ldrh r3, [r4, #0x24]
	lsl r0, r1, #1
	ldrh r0, [r2, r0]
	cmp r3, r0
	blo _02203E3A
	add r0, r1, #1
	strh r0, [r4, #0x26]
	mov r0, #0
	strh r0, [r4, #0x24]
	ldrh r2, [r4, #0x26]
	ldr r0, [r4, #0xc]
	cmp r2, r0
	blo _02203E24
	mov r0, #1
	pop {r4, pc}
_02203E24:
	ldr r1, [r4, #4]
	ldr r0, [r4, #0x10]
	ldrb r1, [r1, r2]
	bl sub_02020838
	add r2, r0, #0
	ldr r1, [r4, #0x1c]
	ldr r3, [r4, #0x20]
	mov r0, #0
	bl GF_CreateNewVramTransferTask
_02203E3A:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_02203DF8

	thumb_func_start ov01_02203E40
ov01_02203E40: ; 0x02203E40
	push {r3, r4, r5, lr}
	mov r2, #0
	mov r1, #0x68
	add r3, r2, #0
	add r5, r0, #0
	bl ov01_021F1430
	add r4, r0, #0
	str r5, [r4]
	mov r1, #0
	str r1, [r4, #0x60]
	mov r1, #0xfe
	lsl r1, r1, #0x16
	str r1, [r4, #0x64]
	bl ov01_02203E74
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov01_02203E40

	thumb_func_start ov01_02203E64
ov01_02203E64: ; 0x02203E64
	push {r4, lr}
	add r4, r0, #0
	bl ov01_02203E94
	add r0, r4, #0
	bl ov01_021F1448
	pop {r4, pc}
	thumb_func_end ov01_02203E64

	thumb_func_start ov01_02203E74
ov01_02203E74: ; 0x02203E74
	push {r3, lr}
	sub sp, #8
	add r3, r0, #0
	add r0, #0x58
	str r0, [sp]
	add r0, r3, #0
	add r0, #0x5c
	str r0, [sp, #4]
	ldr r0, [r3]
	mov r1, #0x6a
	mov r2, #0
	add r3, r3, #4
	bl ov01_021F1AB8
	add sp, #8
	pop {r3, pc}
	thumb_func_end ov01_02203E74

	thumb_func_start ov01_02203E94
ov01_02203E94: ; 0x02203E94
	ldr r3, _02203E9C ; =ov01_021F1448
	ldr r0, [r0, #0x5c]
	bx r3
	nop
_02203E9C: .word ov01_021F1448
	thumb_func_end ov01_02203E94

	thumb_func_start ov01_02203EA0
ov01_02203EA0: ; 0x02203EA0
	push {r4, r5, r6, lr}
	sub sp, #0x48
	add r5, r0, #0
	bl ov01_021F146C
	add r4, r0, #0
	bl ov01_021F1468
	add r6, r0, #0
	str r4, [sp, #0x2c]
	add r0, r4, #0
	mov r1, #0x13
	bl ov01_021F1450
	str r0, [sp, #0x30]
	ldr r0, [r0, #0x60]
	cmp r0, #0
	bne _02203F24
	str r5, [sp, #0x34]
	add r0, r5, #0
	add r1, sp, #0x14
	bl MapObject_GetPositionVec
	ldr r1, [r6, #0x24]
	add r0, sp, #8
	bl sub_02023640
	add r0, sp, #8
	add r1, sp, #0x14
	add r2, sp, #0x3c
	bl VEC_Subtract
	add r0, sp, #8
	add r1, sp, #0x14
	bl VEC_Distance
	str r0, [sp, #0x38]
	mov r1, #3
	bl _s32_div_f
	str r0, [sp, #0x38]
	add r0, sp, #0x3c
	add r1, r0, #0
	bl VEC_Normalize
	add r0, r5, #0
	add r1, sp, #0x20
	bl MapObject_GetPositionVec
	add r0, r5, #0
	mov r1, #2
	bl sub_0205F09C
	add r1, sp, #0x2c
	str r1, [sp]
	str r0, [sp, #4]
	ldr r1, _02203F28 ; =ov01_022095B4
	add r0, r4, #0
	add r2, sp, #0x20
	mov r3, #0
	bl ov01_021F1620
	ldr r1, [sp, #0x30]
	str r0, [r1, #0x60]
	ldr r0, [sp, #0x30]
	ldr r0, [r0, #0x60]
_02203F24:
	add sp, #0x48
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02203F28: .word ov01_022095B4
	thumb_func_end ov01_02203EA0

	thumb_func_start ov01_02203F2C
ov01_02203F2C: ; 0x02203F2C
	push {r4, lr}
	add r4, r1, #0
	bl sub_02068D74
	ldr r0, [r0, #8]
	str r4, [r0, #0x64]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_02203F2C

	thumb_func_start ov01_02203F3C
ov01_02203F3C: ; 0x02203F3C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_02068D98
	add r3, r0, #0
	ldmia r3!, {r0, r1}
	add r2, r4, #4
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	add r0, r5, #0
	bl sub_02068D90
	str r0, [r4]
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_02203F3C

	thumb_func_start ov01_02203F68
ov01_02203F68: ; 0x02203F68
	bx lr
	.balign 4, 0
	thumb_func_end ov01_02203F68

	thumb_func_start ov01_02203F6C
ov01_02203F6C: ; 0x02203F6C
	push {r3, r4, r5, lr}
	sub sp, #0x18
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0xc]
	add r1, sp, #0xc
	bl MapObject_GetPositionVec
	ldr r0, [r4, #0x10]
	add r4, #0x14
	add r1, r4, #0
	add r2, sp, #0xc
	add r3, sp, #0
	bl VEC_MultAdd
	add r0, r5, #0
	add r1, sp, #0
	bl sub_02068DA8
	add sp, #0x18
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_02203F6C

	thumb_func_start ov01_02203F98
ov01_02203F98: ; 0x02203F98
	push {r3, r4, r5, r6, lr}
	sub sp, #0x3c
	ldr r6, _02203FFC ; =ov01_022095C8
	add r5, r0, #0
	add r4, r1, #0
	add r3, sp, #0
	mov r2, #4
_02203FA6:
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _02203FA6
	ldr r0, [r6]
	str r0, [r3]
	ldr r1, [r4, #8]
	ldr r0, _02204000 ; =0x45800000
	ldr r1, [r1, #0x64]
	bl _fmul
	bl _ffix
	str r0, [sp, #0x24]
	ldr r1, [r4, #8]
	ldr r0, _02204000 ; =0x45800000
	ldr r1, [r1, #0x64]
	bl _fmul
	bl _ffix
	str r0, [sp, #0x28]
	ldr r1, [r4, #8]
	ldr r0, _02204000 ; =0x45800000
	ldr r1, [r1, #0x64]
	bl _fmul
	bl _ffix
	str r0, [sp, #0x2c]
	add r0, r5, #0
	add r1, sp, #0x30
	bl sub_02068DB8
	ldr r0, [r4, #8]
	add r1, sp, #0x30
	add r0, r0, #4
	add r2, sp, #0
	add r3, sp, #0x24
	bl sub_0201F554
	add sp, #0x3c
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_02203FFC: .word ov01_022095C8
_02204000: .word 0x45800000
	thumb_func_end ov01_02203F98

	thumb_func_start ov01_02204004
ov01_02204004: ; 0x02204004
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	mov r1, #0x1c
	add r7, r0, #0
	add r5, r2, #0
	str r3, [sp]
	bl AllocFromHeap
	add r4, r0, #0
	mov r0, #0
	str r0, [r4, #0x10]
	str r6, [r4, #0x14]
	ldr r0, [sp]
	str r5, [r4, #0x18]
	str r0, [r4, #4]
	add r0, r7, #0
	add r1, r6, #0
	bl AllocFromHeap
	mov r2, #0
	str r0, [r4]
	cmp r6, #0
	ble _0220403E
	mov r1, #0xff
_02204034:
	ldr r0, [r4]
	strb r1, [r0, r2]
	add r2, r2, #1
	cmp r2, r6
	blt _02204034
_0220403E:
	mov r0, #0x5c
	add r6, r5, #0
	mul r6, r0
	add r0, r7, #0
	add r1, r6, #0
	bl AllocFromHeap
	str r0, [r4, #8]
	ldr r1, [r4, #8]
	mov r0, #0
	add r2, r6, #0
	bl MIi_CpuClearFast
	add r0, r7, #0
	lsl r1, r5, #2
	bl AllocFromHeap
	mov r6, #0
	str r0, [r4, #0xc]
	cmp r5, #0
	ble _0220407E
	add r2, r6, #0
	add r3, r6, #0
_0220406C:
	ldr r0, [r4, #8]
	add r6, r6, #1
	add r1, r0, r2
	ldr r0, [r4, #0xc]
	add r2, #0x5c
	str r1, [r0, r3]
	add r3, r3, #4
	cmp r6, r5
	blt _0220406C
_0220407E:
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_02204004

	thumb_func_start ov01_02204084
ov01_02204084: ; 0x02204084
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl FreeToHeap
	ldr r0, [r4, #8]
	bl FreeToHeap
	ldr r0, [r4, #0xc]
	bl FreeToHeap
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_02204084

	thumb_func_start ov01_022040A4
ov01_022040A4: ; 0x022040A4
	push {r3, lr}
	add r2, r1, #0
	ldr r3, [r0, #0x10]
	ldr r1, [r0]
	strb r3, [r1, r2]
	ldr r3, [r0, #4]
	lsl r1, r2, #2
	ldr r1, [r3, r1]
	str r1, [sp]
	add r1, sp, #0
	bl ov01_02204168
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov01_022040A4

	thumb_func_start ov01_022040C0
ov01_022040C0: ; 0x022040C0
	ldr r2, [r0, #0x10]
	sub r3, r2, #1
	str r3, [r0, #0x10]
	ldr r2, [r0, #0xc]
	lsl r0, r3, #2
	str r1, [r2, r0]
	bx lr
	.balign 4, 0
	thumb_func_end ov01_022040C0

	thumb_func_start ov01_022040D0
ov01_022040D0: ; 0x022040D0
	ldr r2, [r0]
	ldrb r2, [r2, r1]
	cmp r2, #0xff
	beq _022040E0
	ldr r1, [r0, #0xc]
	lsl r0, r2, #2
	ldr r0, [r1, r0]
	bx lr
_022040E0:
	mov r0, #0
	bx lr
	thumb_func_end ov01_022040D0

	thumb_func_start ov01_022040E4
ov01_022040E4: ; 0x022040E4
	push {r3, lr}
	add r2, r1, #0
	ldr r3, [r0, #4]
	lsl r1, r2, #2
	ldr r1, [r3, r1]
	str r1, [sp]
	add r1, sp, #0
	bl ov01_02204168
	pop {r3, pc}
	thumb_func_end ov01_022040E4

	thumb_func_start ov01_022040F8
ov01_022040F8: ; 0x022040F8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov01_02204144
	cmp r0, #0
	beq _02204110
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_022040D0
	pop {r3, r4, r5, pc}
_02204110:
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_022040E4
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_022040F8

	thumb_func_start ov01_0220411C
ov01_0220411C: ; 0x0220411C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bne _02204128
	mov r0, #0
	pop {r3, r4, r5, pc}
_02204128:
	ldr r1, [r4, #0x58]
	bl ov01_02204144
	cmp r0, #0
	bne _0220413E
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_022040C0
	mov r0, #1
	pop {r3, r4, r5, pc}
_0220413E:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_0220411C

	thumb_func_start ov01_02204144
ov01_02204144: ; 0x02204144
	ldr r0, [r0]
	ldrb r0, [r0, r1]
	cmp r0, #0xff
	beq _02204150
	mov r0, #1
	bx lr
_02204150:
	mov r0, #0
	bx lr
	thumb_func_end ov01_02204144

	thumb_func_start ov01_02204154
ov01_02204154: ; 0x02204154
	ldr r2, [r0, #4]
	lsl r0, r1, #2
	ldr r0, [r2, r0]
	cmp r0, #0
	beq _02204162
	mov r0, #1
	bx lr
_02204162:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov01_02204154

	thumb_func_start ov01_02204168
ov01_02204168: ; 0x02204168
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r1]
	add r4, r2, #0
	bl NNS_G3dGetMdlSet
	cmp r0, #0
	beq _02204198
	add r2, r0, #0
	add r2, #8
	beq _0220418C
	ldrb r1, [r0, #9]
	cmp r1, #0
	bls _0220418C
	ldrh r1, [r0, #0xe]
	add r1, r2, r1
	add r1, r1, #4
	b _0220418E
_0220418C:
	mov r1, #0
_0220418E:
	cmp r1, #0
	beq _02204198
	ldr r1, [r1]
	add r2, r0, r1
	b _0220419A
_02204198:
	mov r2, #0
_0220419A:
	ldr r0, [r5, #0x10]
	ldr r1, [r5, #0xc]
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	str r2, [r0, #0x54]
	ldr r0, [r5, #0x10]
	ldr r1, [r5, #0xc]
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	ldr r1, [r0, #0x54]
	bl NNS_G3dRenderObjInit
	ldr r1, [r5, #0x10]
	ldr r2, [r5, #0xc]
	lsl r0, r1, #2
	ldr r0, [r2, r0]
	add r1, r1, #1
	str r1, [r5, #0x10]
	str r4, [r0, #0x58]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_02204168

	thumb_func_start ov01_022041C4
ov01_022041C4: ; 0x022041C4
	push {r3, lr}
	mov r1, #0x10
	bl AllocFromHeap
	mov r1, #0
	str r1, [r0, #0xc]
	str r1, [r0]
	str r1, [r0, #4]
	str r1, [r0, #8]
	pop {r3, pc}
	thumb_func_end ov01_022041C4

	thumb_func_start ov01_022041D8
ov01_022041D8: ; 0x022041D8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	str r0, [sp]
	add r0, r5, #0
	mov r1, #0x24
	add r7, r2, #0
	bl AllocFromHeap
	add r4, r0, #0
	mov r1, #0
	strh r1, [r4, #0x22]
	strh r7, [r4, #0x20]
	str r1, [r4, #0x1c]
	add r1, r5, #0
	mov r2, #4
	bl GF_ExpHeap_FndInitAllocator
	lsl r6, r7, #5
	add r0, r5, #0
	add r1, r6, #0
	bl AllocFromHeap
	str r0, [r4, #0x10]
	ldr r1, [r4, #0x10]
	mov r0, #0
	add r2, r6, #0
	bl MIi_CpuClearFast
	add r0, r5, #0
	lsl r1, r7, #2
	bl AllocFromHeap
	mov r3, #0
	str r0, [r4, #0x14]
	cmp r7, #0
	ble _02204248
	add r5, r3, #0
	add r6, r3, #0
	add r2, r3, #0
_02204226:
	ldr r0, [r4, #0x10]
	add r3, r3, #1
	add r0, r0, r5
	str r2, [r0, #0x14]
	ldr r0, [r4, #0x10]
	add r0, r0, r5
	str r2, [r0, #4]
	ldr r0, [r4, #0x10]
	str r2, [r0, r5]
	ldr r0, [r4, #0x10]
	add r1, r0, r5
	ldr r0, [r4, #0x14]
	add r5, #0x20
	str r1, [r0, r6]
	add r6, r6, #4
	cmp r3, r7
	blt _02204226
_02204248:
	mov r0, #0
	str r0, [r4, #0x18]
	ldr r0, [sp]
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _0220425E
	ldr r0, [sp]
	str r4, [r0, #4]
	str r4, [r0, #8]
	str r4, [r0]
	b _02204268
_0220425E:
	ldr r0, [sp]
	ldr r0, [r0, #8]
	str r4, [r0, #0x18]
	ldr r0, [sp]
	str r4, [r0, #8]
_02204268:
	ldr r0, [sp]
	ldr r0, [r0, #0xc]
	add r1, r0, #1
	ldr r0, [sp]
	str r1, [r0, #0xc]
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_022041D8

	thumb_func_start ov01_02204278
ov01_02204278: ; 0x02204278
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r0, [sp]
	cmp r0, #0
	beq _022042F6
	add r1, r0, #0
	ldr r4, [r1, #4]
	cmp r4, #0
	bne _02204292
	bl FreeToHeap
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_02204292:
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, [sp]
	ldr r0, [r0, #0xc]
	cmp r0, #0
	ble _022042F0
_0220429E:
	ldrh r0, [r4, #0x20]
	mov r7, #0
	cmp r0, #0
	ble _022042CC
	add r5, r7, #0
_022042A8:
	ldr r0, [r4, #0x10]
	add r6, r0, r5
	ldr r0, [r6, #0x14]
	cmp r0, #1
	bne _022042C2
	add r0, r4, #0
	add r1, r6, #0
	bl ov01_02204500
	add r0, r4, #0
	add r1, r6, #0
	bl ov01_0220431C
_022042C2:
	ldrh r0, [r4, #0x20]
	add r7, r7, #1
	add r5, #0x20
	cmp r7, r0
	blt _022042A8
_022042CC:
	ldr r0, [r4, #0x10]
	bl FreeToHeap
	ldr r0, [r4, #0x14]
	bl FreeToHeap
	add r0, r4, #0
	ldr r4, [r4, #0x18]
	bl FreeToHeap
	ldr r0, [sp, #4]
	add r0, r0, #1
	str r0, [sp, #4]
	ldr r0, [sp]
	ldr r1, [r0, #0xc]
	ldr r0, [sp, #4]
	cmp r0, r1
	blt _0220429E
_022042F0:
	ldr r0, [sp]
	bl FreeToHeap
_022042F6:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_02204278

	thumb_func_start ov01_022042FC
ov01_022042FC: ; 0x022042FC
	push {r3, lr}
	ldrh r2, [r0, #0x22]
	ldrh r1, [r0, #0x20]
	cmp r2, r1
	blo _0220430E
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
_0220430E:
	add r1, r2, #1
	strh r1, [r0, #0x22]
	ldr r1, [r0, #0x14]
	lsl r0, r2, #2
	ldr r0, [r1, r0]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov01_022042FC

	thumb_func_start ov01_0220431C
ov01_0220431C: ; 0x0220431C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldrh r0, [r5, #0x22]
	add r4, r1, #0
	cmp r0, #0
	bne _0220432E
	bl GF_AssertFail
	pop {r3, r4, r5, pc}
_0220432E:
	sub r0, r0, #1
	strh r0, [r5, #0x22]
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0220433C
	bl FreeToHeap
_0220433C:
	mov r0, #0
	str r0, [r4]
	str r0, [r4, #0x14]
	ldrh r0, [r5, #0x22]
	ldr r1, [r5, #0x14]
	lsl r0, r0, #2
	str r4, [r1, r0]
	pop {r3, r4, r5, pc}
	thumb_func_end ov01_0220431C

	thumb_func_start ov01_0220434C
ov01_0220434C: ; 0x0220434C
	ldrh r0, [r0, #0x22]
	bx lr
	thumb_func_end ov01_0220434C

	thumb_func_start ov01_02204350
ov01_02204350: ; 0x02204350
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r0, [sp]
	cmp r0, #0
	beq _022043D4
	ldr r6, [r0, #4]
	cmp r6, #0
	beq _022043D4
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, [sp]
	ldr r0, [r0, #0xc]
	cmp r0, #0
	ble _022043D4
_0220436C:
	ldrh r0, [r6, #0x20]
	mov r7, #0
	cmp r0, #0
	ble _022043C2
	add r5, r7, #0
_02204376:
	ldr r0, [r6, #0x10]
	add r4, r0, r5
	ldr r0, [r4, #0x14]
	cmp r0, #1
	bne _022043B8
	ldr r0, [r4, #0xc]
	cmp r0, #1
	beq _022043B8
	ldr r0, [r4, #0x1c]
	cmp r0, #0
	beq _022043B8
	add r0, r4, #0
	bl ov01_02204594
	mov r0, #0
	ldr r1, [r4, #8]
	mvn r0, r0
	cmp r1, r0
	beq _022043B8
	add r0, r4, #0
	bl ov01_022045DC
	cmp r0, #0
	beq _022043B8
	ldr r0, [r4, #0x18]
	add r1, r0, #1
	ldr r0, [r4, #8]
	cmp r1, r0
	blt _022043B6
	mov r0, #0
	str r0, [r4, #0x1c]
	b _022043B8
_022043B6:
	str r1, [r4, #0x18]
_022043B8:
	ldrh r0, [r6, #0x20]
	add r7, r7, #1
	add r5, #0x20
	cmp r7, r0
	blt _02204376
_022043C2:
	ldr r0, [sp, #4]
	ldr r6, [r6, #0x18]
	add r0, r0, #1
	str r0, [sp, #4]
	ldr r0, [sp]
	ldr r1, [r0, #0xc]
	ldr r0, [sp, #4]
	cmp r0, r1
	blt _0220436C
_022043D4:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov01_02204350

	thumb_func_start ov01_022043D8
ov01_022043D8: ; 0x022043D8
	push {r4, r5, r6, r7}
	cmp r0, #0
	beq _0220441E
	ldr r5, [r0, #4]
	cmp r5, #0
	beq _0220441E
	ldr r1, [r0, #0xc]
	mov r3, #0
	cmp r1, #0
	ble _0220441E
	mov r1, #1
_022043EE:
	ldrh r2, [r5, #0x20]
	mov r4, #0
	cmp r2, #0
	ble _02204414
	add r6, r4, #0
_022043F8:
	ldr r2, [r5, #0x10]
	add r2, r2, r6
	ldr r7, [r2, #0x14]
	cmp r7, #1
	bne _0220440A
	ldr r7, [r2, #0x1c]
	cmp r7, #0
	beq _0220440A
	str r1, [r2, #0xc]
_0220440A:
	ldrh r2, [r5, #0x20]
	add r4, r4, #1
	add r6, #0x20
	cmp r4, r2
	blt _022043F8
_02204414:
	ldr r2, [r0, #0xc]
	add r3, r3, #1
	ldr r5, [r5, #0x18]
	cmp r3, r2
	blt _022043EE
_0220441E:
	pop {r4, r5, r6, r7}
	bx lr
	.balign 4, 0
	thumb_func_end ov01_022043D8

	thumb_func_start ov01_02204424
ov01_02204424: ; 0x02204424
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	cmp r0, #0
	beq _0220446E
	ldr r4, [r0, #4]
	cmp r4, #0
	beq _0220446E
	ldr r0, [r0, #0xc]
	mov r7, #0
	cmp r0, #0
	ble _0220446E
_0220443A:
	ldrh r0, [r4, #0x20]
	mov r6, #0
	cmp r0, #0
	ble _02204462
	add r5, r6, #0
_02204444:
	ldr r0, [r4, #0x10]
	add r0, r0, r5
	ldr r1, [r0, #0x14]
	cmp r1, #1
	bne _02204458
	ldr r1, [r0, #0x1c]
	cmp r1, #0
	beq _02204458
	bl ov01_022044E0
_02204458:
	ldrh r0, [r4, #0x20]
	add r6, r6, #1
	add r5, #0x20
	cmp r6, r0
	blt _02204444
_02204462:
	ldr r0, [sp]
	add r7, r7, #1
	ldr r0, [r0, #0xc]
	ldr r4, [r4, #0x18]
	cmp r7, r0
	blt _0220443A
_0220446E:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov01_02204424

	thumb_func_start ov01_02204470
ov01_02204470: ; 0x02204470
	push {r3, r4, r5, r6, r7, lr}
	add r4, r2, #0
	str r0, [sp]
	add r5, r1, #0
	add r0, r4, #0
	mov r1, #0
	add r6, r3, #0
	bl NNS_G3dGetAnmByIdx
	add r7, r0, #0
	bne _0220448A
	bl GF_AssertFail
_0220448A:
	ldr r0, [sp]
	add r1, r7, #0
	add r2, r6, #0
	bl NNS_G3dAllocAnmObj
	str r0, [r5]
	cmp r0, #0
	bne _0220449E
	bl GF_AssertFail
_0220449E:
	ldr r0, [r5]
	ldr r3, [sp, #0x18]
	add r1, r7, #0
	add r2, r6, #0
	bl NNS_G3dAnmObjInit
	str r4, [r5, #4]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_02204470

	thumb_func_start ov01_022044B0
ov01_022044B0: ; 0x022044B0
	push {r4, r5, r6, lr}
	ldr r6, [r0, #0x1c]
	add r5, r1, #0
	add r4, r2, #0
	cmp r6, #0
	beq _022044C0
	blx r6
	str r4, [r5, #4]
_022044C0:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov01_022044B0

	thumb_func_start ov01_022044C4
ov01_022044C4: ; 0x022044C4
	str r1, [r0, #0x1c]
	bx lr
	thumb_func_end ov01_022044C4

	thumb_func_start ov01_022044C8
ov01_022044C8: ; 0x022044C8
	push {r3, r4}
	mov r4, #0
	str r4, [r0, #0x18]
	mov r4, #1
	str r4, [r0, #0x1c]
	str r4, [r0, #0x14]
	str r1, [r0, #8]
	str r2, [r0, #0xc]
	str r3, [r0, #0x10]
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end ov01_022044C8

	thumb_func_start ov01_022044E0
ov01_022044E0: ; 0x022044E0
	ldr r1, [r0, #0x10]
	cmp r1, #0
	bne _022044EE
	ldr r0, [r0]
	mov r1, #0
	str r1, [r0]
	bx lr
_022044EE:
	ldr r2, [r0]
	ldr r0, [r2, #8]
	ldrh r0, [r0, #4]
	lsl r1, r0, #0xc
	mov r0, #1
	lsl r0, r0, #0xc
	sub r0, r1, r0
	str r0, [r2]
	bx lr
	thumb_func_end ov01_022044E0

	thumb_func_start ov01_02204500
ov01_02204500: ; 0x02204500
	ldr r3, _02204508 ; =NNS_G3dFreeAnmObj
	ldr r1, [r1]
	bx r3
	nop
_02204508: .word NNS_G3dFreeAnmObj
	thumb_func_end ov01_02204500

	thumb_func_start ov01_0220450C
ov01_0220450C: ; 0x0220450C
	ldr r3, _02204514 ; =NNS_G3dRenderObjAddAnmObj
	ldr r1, [r1]
	bx r3
	nop
_02204514: .word NNS_G3dRenderObjAddAnmObj
	thumb_func_end ov01_0220450C

	thumb_func_start ov01_02204518
ov01_02204518: ; 0x02204518
	push {r3, lr}
	cmp r1, #0
	bne _02204522
	mov r0, #0
	pop {r3, pc}
_02204522:
	ldr r1, [r1]
	cmp r1, #0
	bne _0220452C
	mov r0, #0
	pop {r3, pc}
_0220452C:
	cmp r0, #0
	bne _02204534
	mov r0, #0
	pop {r3, pc}
_02204534:
	ldr r2, [r0, #8]
	cmp r2, #0
	bne _0220454A
	ldr r2, [r0, #0x10]
	cmp r2, #0
	bne _0220454A
	ldr r2, [r0, #0x18]
	cmp r2, #0
	bne _0220454A
	mov r0, #0
	pop {r3, pc}
_0220454A:
	bl NNS_G3dRenderObjRemoveAnmObj
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov01_02204518

	thumb_func_start ov01_02204554
ov01_02204554: ; 0x02204554
	ldr r0, [r0, #8]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bx lr
	thumb_func_end ov01_02204554

	thumb_func_start ov01_0220455C
ov01_0220455C: ; 0x0220455C
	str r1, [r0, #0xc]
	bx lr
	thumb_func_end ov01_0220455C

	thumb_func_start ov01_02204560
ov01_02204560: ; 0x02204560
	ldr r0, [r0, #0x1c]
	cmp r0, #0
	bne _0220456A
	mov r0, #1
	bx lr
_0220456A:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov01_02204560

	thumb_func_start ov01_02204570
ov01_02204570: ; 0x02204570
	ldr r1, [r0, #0x10]
	cmp r1, #0
	bne _02204588
	ldr r2, [r0]
	ldr r0, [r2, #8]
	ldrh r0, [r0, #4]
	lsl r1, r0, #0xc
	mov r0, #1
	lsl r0, r0, #0xc
	sub r0, r1, r0
	str r0, [r2]
	bx lr
_02204588:
	ldr r0, [r0]
	mov r1, #0
	str r1, [r0]
	bx lr
	thumb_func_end ov01_02204570

	thumb_func_start ov01_02204590
ov01_02204590: ; 0x02204590
	str r1, [r0, #8]
	bx lr
	thumb_func_end ov01_02204590

	thumb_func_start ov01_02204594
ov01_02204594: ; 0x02204594
	ldr r1, [r0, #0x10]
	cmp r1, #0
	bne _022045BA
	ldr r3, [r0]
	mov r1, #1
	ldr r2, [r3]
	lsl r1, r1, #0xc
	add r1, r2, r1
	str r1, [r3]
	ldr r2, [r0]
	ldr r0, [r2, #8]
	ldr r1, [r2]
	ldrh r0, [r0, #4]
	lsl r0, r0, #0xc
	cmp r1, r0
	bne _022045DA
	mov r0, #0
	str r0, [r2]
	bx lr
_022045BA:
	ldr r0, [r0]
	ldr r2, [r0]
	cmp r2, #0
	bgt _022045D2
	ldr r1, [r0, #8]
	ldrh r1, [r1, #4]
	lsl r2, r1, #0xc
	mov r1, #1
	lsl r1, r1, #0xc
	sub r1, r2, r1
	str r1, [r0]
	bx lr
_022045D2:
	mov r1, #1
	lsl r1, r1, #0xc
	sub r1, r2, r1
	str r1, [r0]
_022045DA:
	bx lr
	thumb_func_end ov01_02204594

	thumb_func_start ov01_022045DC
ov01_022045DC: ; 0x022045DC
	ldr r1, [r0, #0x10]
	ldr r0, [r0]
	cmp r1, #0
	bne _022045FE
	ldr r2, [r0]
	ldr r0, [r0, #8]
	ldrh r0, [r0, #4]
	lsl r1, r0, #0xc
	mov r0, #1
	lsl r0, r0, #0xc
	sub r0, r1, r0
	cmp r2, r0
	blt _022045FA
	mov r0, #1
	bx lr
_022045FA:
	mov r0, #0
	bx lr
_022045FE:
	ldr r0, [r0]
	cmp r0, #0
	bne _02204608
	mov r0, #1
	bx lr
_02204608:
	mov r0, #0
	bx lr
	thumb_func_end ov01_022045DC

	thumb_func_start ov01_0220460C
ov01_0220460C: ; 0x0220460C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #4
	mov r1, #8
	bl AllocFromHeap
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #4
	mov r2, #1
	bl ov01_022041D8
	ldr r1, _02204630 ; =ov01_022046A4
	str r0, [r4]
	bl ov01_022044C4
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02204630: .word ov01_022046A4
	thumb_func_end ov01_0220460C

	thumb_func_start ov01_02204634
ov01_02204634: ; 0x02204634
	ldr r3, _02204638 ; =FreeToHeap
	bx r3
	.balign 4, 0
_02204638: .word FreeToHeap
	thumb_func_end ov01_02204634

	thumb_func_start ov01_0220463C
ov01_0220463C: ; 0x0220463C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r6, r1, #0
	bl ov01_022042FC
	add r4, r0, #0
	bne _02204650
	bl GF_AssertFail
_02204650:
	mov r1, #0
	mov r2, #0
	add r0, r4, #0
	mvn r1, r1
	add r3, r2, #0
	bl ov01_022044C8
	mov r0, #0x8c
	add r1, r6, #0
	mov r2, #4
	bl AllocAndReadWholeNarcMemberByIdPair
	add r2, r0, #0
	ldr r0, [r5]
	add r1, r4, #0
	mov r3, #0
	bl ov01_022044B0
	str r4, [r5, #4]
	pop {r4, r5, r6, pc}
	thumb_func_end ov01_0220463C

	thumb_func_start ov01_02204678
ov01_02204678: ; 0x02204678
	ldr r3, _02204684 ; =ov01_0220450C
	add r2, r0, #0
	add r0, r1, #0
	ldr r1, [r2, #4]
	bx r3
	nop
_02204684: .word ov01_0220450C
	thumb_func_end ov01_02204678

	thumb_func_start ov01_02204688
ov01_02204688: ; 0x02204688
	ldr r3, _02204694 ; =ov01_02204518
	add r2, r0, #0
	add r0, r1, #0
	ldr r1, [r2, #4]
	bx r3
	nop
_02204694: .word ov01_02204518
	thumb_func_end ov01_02204688

	thumb_func_start ov01_02204698
ov01_02204698: ; 0x02204698
	ldr r3, _022046A0 ; =ov01_0220434C
	ldr r0, [r0]
	bx r3
	nop
_022046A0: .word ov01_0220434C
	thumb_func_end ov01_02204698

	thumb_func_start ov01_022046A4
ov01_022046A4: ; 0x022046A4
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r5, r1, #0
	add r0, r2, #0
	mov r1, #0
	bl NNS_G3dGetAnmByIdx
	add r4, r0, #0
	add r0, r6, #0
	add r1, r4, #0
	bl ov01_022046D4
	add r1, r4, #0
	str r0, [r5]
	bl ov01_02204728
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov01_022046A4

	thumb_func_start ov01_022046C8
ov01_022046C8: ; 0x022046C8
	ldrb r0, [r0, #9]
	mov r1, #3
	lsl r0, r0, #1
	add r0, #0x1c
	bic r0, r1
	bx lr
	thumb_func_end ov01_022046C8

	thumb_func_start ov01_022046D4
ov01_022046D4: ; 0x022046D4
	push {r4, lr}
	add r4, r0, #0
	add r0, r1, #0
	bl ov01_022046C8
	add r1, r0, #0
	add r0, r4, #0
	bl NNS_FndAllocFromAllocator
	pop {r4, pc}
	thumb_func_end ov01_022046D4

	thumb_func_start ov01_022046E8
ov01_022046E8: ; 0x022046E8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _02204724 ; =_02110A0C
	add r4, r1, #0
	ldr r0, [r0]
	add r1, r5, #0
	str r0, [r5, #0xc]
	ldrb r2, [r4, #9]
	mov r0, #0
	add r1, #0x1a
	strb r2, [r5, #0x19]
	lsl r2, r2, #1
	bl MIi_CpuClear16
	ldrb r0, [r4, #9]
	mov r2, #0
	cmp r0, #0
	bls _02204720
	mov r0, #1
	lsl r0, r0, #8
_02204710:
	add r1, r2, #0
	orr r1, r0
	strh r1, [r5, #0x1a]
	ldrb r1, [r4, #9]
	add r2, r2, #1
	add r5, r5, #2
	cmp r2, r1
	blo _02204710
_02204720:
	pop {r3, r4, r5, pc}
	nop
_02204724: .word _02110A0C
	thumb_func_end ov01_022046E8

	thumb_func_start ov01_02204728
ov01_02204728: ; 0x02204728
	mov r3, #0
	str r3, [r0]
	str r1, [r0, #8]
	str r3, [r0, #0x10]
	mov r2, #0x7f
	strb r2, [r0, #0x18]
	mov r2, #1
	lsl r2, r2, #0xc
	str r2, [r0, #4]
	str r3, [r0, #0x14]
	ldr r3, _02204740 ; =ov01_022046E8
	bx r3
	.balign 4, 0
_02204740: .word ov01_022046E8
	thumb_func_end ov01_02204728

	thumb_func_start ov01_02204744
ov01_02204744: ; 0x02204744
	push {r4, lr}
	mov r1, #0x78
	bl AllocFromHeap
	add r4, r0, #0
	mov r0, #0
	add r1, r4, #0
	mov r2, #0x78
	bl MIi_CpuClearFast
	bl GF_RTC_GetTimeOfDay
	str r0, [r4]
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_02204744

	thumb_func_start ov01_02204764
ov01_02204764: ; 0x02204764
	ldr r3, _02204768 ; =FreeToHeap
	bx r3
	.balign 4, 0
_02204768: .word FreeToHeap
	thumb_func_end ov01_02204764

	thumb_func_start ov01_0220476C
ov01_0220476C: ; 0x0220476C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r7, r1, #0
	ldr r1, [r5, #4]
	add r4, r2, #0
	add r6, r3, #0
	cmp r1, #4
	bge _022047D4
	mov r0, #0x1c
	mul r0, r1
	add r0, r5, r0
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _0220478C
	bl GF_AssertFail
_0220478C:
	cmp r6, #4
	ble _02204794
	bl GF_AssertFail
_02204794:
	ldr r2, [r5, #4]
	add r1, r5, #0
	mov r0, #0x1c
	add r1, #8
	mul r0, r2
	mov r3, #1
	add r2, r1, r0
	str r3, [r1, r0]
	str r6, [r2, #4]
	cmp r6, #4
	ble _022047AE
	mov r0, #4
	str r0, [r2, #4]
_022047AE:
	ldr r1, [r2, #4]
	mov r0, #0
	cmp r1, #0
	ble _022047CA
_022047B6:
	lsl r1, r0, #2
	ldr r3, [r4, r1]
	add r1, r2, r1
	add r0, r0, #1
	str r3, [r1, #8]
	lsl r0, r0, #0x18
	ldr r1, [r2, #4]
	lsr r0, r0, #0x18
	cmp r0, r1
	blt _022047B6
_022047CA:
	str r7, [r2, #0x18]
	ldr r0, [r5, #4]
	add r0, r0, #1
	str r0, [r5, #4]
	pop {r3, r4, r5, r6, r7, pc}
_022047D4:
	bl GF_AssertFail
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_0220476C

	thumb_func_start ov01_022047DC
ov01_022047DC: ; 0x022047DC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl GF_RTC_GetTimeOfDay
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
	ldr r0, [r5]
	cmp r0, r7
	beq _0220482E
	lsl r0, r0, #0x18
	add r4, r5, #0
	lsr r0, r0, #0x18
	str r7, [r5]
	mov r6, #0
	add r4, #8
	str r0, [sp]
_022047FC:
	ldr r0, [r5, #8]
	cmp r0, #0
	beq _02204824
	ldr r2, _02204830 ; =ov01_022095EC
	ldr r1, [sp]
	ldr r0, [r4, #0x18]
	ldrb r1, [r2, r1]
	lsl r1, r1, #2
	add r1, r1, r4
	ldr r1, [r1, #8]
	bl ov01_02204518
	ldr r1, _02204830 ; =ov01_022095EC
	ldr r0, [r4, #0x18]
	ldrb r1, [r1, r7]
	lsl r1, r1, #2
	add r1, r1, r4
	ldr r1, [r1, #8]
	bl ov01_0220450C
_02204824:
	add r6, r6, #1
	add r5, #0x1c
	add r4, #0x1c
	cmp r6, #4
	blt _022047FC
_0220482E:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02204830: .word ov01_022095EC
	thumb_func_end ov01_022047DC

	thumb_func_start ov01_02204834
ov01_02204834: ; 0x02204834
	ldr r1, [r0]
	ldr r0, _0220483C ; =ov01_022095EC
	ldrb r0, [r0, r1]
	bx lr
	.balign 4, 0
_0220483C: .word ov01_022095EC
	thumb_func_end ov01_02204834

	thumb_func_start FieldSys_AnimApricornTree
FieldSys_AnimApricornTree: ; 0x02204840
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #0x20
	mov r1, #0x28
	add r7, r2, #0
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x28
	add r4, r0, #0
	bl MI_CpuFill8
	mov r0, #0
	str r0, [r4]
	str r6, [r4, #8]
	str r7, [r4, #0x24]
	ldr r0, [r5, #0x10]
	ldr r1, _02204870 ; =Task_AnimApricornTree
	add r2, r4, #0
	bl TaskManager_Call
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02204870: .word Task_AnimApricornTree
	thumb_func_end FieldSys_AnimApricornTree

	thumb_func_start Task_AnimApricornTree
Task_AnimApricornTree: ; 0x02204874
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	add r6, r0, #0
	bl TaskManager_GetSys
	add r5, r0, #0
	add r0, r6, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldr r1, [r4]
	cmp r1, #0xa
	bhi _0220493C
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0220489A: ; jump table
	.short _022048B0 - _0220489A - 2 ; case 0
	.short _022048E0 - _0220489A - 2 ; case 1
	.short _0220490A - _0220489A - 2 ; case 2
	.short _02204978 - _0220489A - 2 ; case 3
	.short _022049BE - _0220489A - 2 ; case 4
	.short _02204A06 - _0220489A - 2 ; case 5
	.short _02204A8E - _0220489A - 2 ; case 6
	.short _02204A1E - _0220489A - 2 ; case 7
	.short _02204A40 - _0220489A - 2 ; case 8
	.short _02204A66 - _0220489A - 2 ; case 9
	.short _02204A7C - _0220489A - 2 ; case 10
_022048B0:
	ldr r1, [r4, #8]
	add r0, r5, #0
	bl sub_02055708
	cmp r0, #0
	bne _022048C8
	ldr r0, [r4, #0x24]
	mov r1, #0
	strh r1, [r0]
	mov r0, #0xa
	str r0, [r4]
	b _02204A8E
_022048C8:
	mov r0, #0xb
	mov r1, #4
	bl AllocFromHeapAtEnd
	add r2, r0, #0
	ldr r1, _02204A94 ; =ov01_02204B78
	add r0, r6, #0
	bl TaskManager_Call
	mov r0, #1
	str r0, [r4]
	b _02204A8E
_022048E0:
	ldr r0, [r4, #8]
	bl MapObject_UnpauseMovement
	ldr r0, [r4, #8]
	mov r1, #1
	bl sub_0205F328
	add r0, r4, #0
	mov r1, #0
	add r0, #0x23
	strb r1, [r0]
	add r0, r4, #0
	mov r1, #0x10
	add r0, #0x22
	strb r1, [r0]
	mov r0, #2
	str r0, [r4]
	ldr r0, _02204A98 ; =SEQ_SE_GS_KI_YURERU
	bl PlaySE
	b _02204A8E
_0220490A:
	mov r1, #0x22
	ldrsb r0, [r4, r1]
	sub r2, r0, #1
	add r0, r4, #0
	add r0, #0x22
	strb r2, [r0]
	ldrsb r0, [r4, r1]
	cmp r0, #0
	bgt _02204932
	add r0, r4, #0
	add r0, #0x23
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x23
	strb r1, [r0]
	add r0, r4, #0
	mov r1, #0x10
	add r0, #0x22
	strb r1, [r0]
_02204932:
	add r0, r4, #0
	add r0, #0x23
	ldrb r0, [r0]
	cmp r0, #2
	bhs _0220493E
_0220493C:
	b _02204A8E
_0220493E:
	ldr r0, [r4, #8]
	mov r1, #0
	bl sub_0205F328
	ldr r0, [r4, #8]
	bl MapObject_PauseMovement
	ldr r1, [r4, #8]
	add r0, r5, #0
	bl sub_02055708
	cmp r0, #0
	beq _0220496C
	ldr r1, [r4, #8]
	add r0, r5, #0
	bl sub_02055760
	ldr r0, [r4, #0x24]
	mov r1, #1
	strh r1, [r0]
	mov r0, #3
	str r0, [r4]
	b _02204A8E
_0220496C:
	ldr r0, [r4, #0x24]
	mov r1, #0
	strh r1, [r0]
	mov r0, #0xa
	str r0, [r4]
	b _02204A8E
_02204978:
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetFacingDirection
	mov r1, #0
	str r1, [r4, #0x14]
	str r1, [r4, #0x1c]
	str r1, [r4, #0x18]
	cmp r0, #3
	bhi _022049B8
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02204996: ; jump table
	.short _0220499E - _02204996 - 2 ; case 0
	.short _022049A6 - _02204996 - 2 ; case 1
	.short _022049B2 - _02204996 - 2 ; case 2
	.short _022049AC - _02204996 - 2 ; case 3
_0220499E:
	mov r0, #1
	lsl r0, r0, #0xc
	str r0, [r4, #0x1c]
	b _022049B8
_022049A6:
	ldr r0, _02204A9C ; =0xFFFFF000
	str r0, [r4, #0x1c]
	b _022049B8
_022049AC:
	ldr r0, _02204A9C ; =0xFFFFF000
	str r0, [r4, #0x14]
	b _022049B8
_022049B2:
	mov r0, #1
	lsl r0, r0, #0xc
	str r0, [r4, #0x14]
_022049B8:
	mov r0, #4
	str r0, [r4]
	b _02204A8E
_022049BE:
	ldr r0, [r5, #0x40]
	add r1, sp, #4
	add r2, sp, #0
	bl sub_0205E02C
	ldr r1, [r4, #8]
	add r0, r5, #0
	bl sub_020557A0
	sub r6, r0, #1
	bpl _022049D8
	bl GF_AssertFail
_022049D8:
	ldr r1, _02204AA0 ; =0x0000010E
	ldr r0, [r5, #0x3c]
	ldr r2, [sp, #4]
	ldr r3, [sp]
	add r1, r6, r1
	bl ov01_02204AAC
	str r0, [r4, #4]
	add r1, sp, #8
	bl MapObject_GetPositionVec
	mov r0, #3
	ldr r1, [sp, #0xc]
	lsl r0, r0, #0xe
	add r0, r1, r0
	str r0, [sp, #0xc]
	ldr r0, [r4, #4]
	add r1, sp, #8
	bl MapObject_SetPositionVec
	mov r0, #5
	str r0, [r4]
	b _02204A8E
_02204A06:
	ldr r0, [r4, #4]
	bl ov01_021FA2D4
	cmp r0, #0
	bne _02204A8E
	ldr r0, [r4, #8]
	ldr r1, _02204AA4 ; =0x00000106
	bl ov01_021FA930
	mov r0, #7
	str r0, [r4]
	b _02204A8E
_02204A1E:
	ldr r0, [r4, #8]
	bl ov01_021FA2D4
	cmp r0, #0
	bne _02204A8E
	mov r0, #8
	strh r0, [r4, #0x20]
	ldr r0, [r4, #8]
	mov r1, #2
	bl sub_0205F328
	ldr r0, [r4, #8]
	bl MapObject_UnpauseMovement
	mov r0, #8
	str r0, [r4]
	b _02204A8E
_02204A40:
	mov r1, #0x20
	ldrsh r0, [r4, r1]
	sub r0, r0, #1
	strh r0, [r4, #0x20]
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bgt _02204A8E
	ldr r0, [r4, #4]
	lsl r1, r1, #4
	bl MapObject_ClearBits
	mov r0, #0
	str r0, [r4, #0xc]
	ldr r0, _02204AA8 ; =SEQ_SE_GS_FW255E
	bl PlaySE
	mov r0, #9
	str r0, [r4]
	b _02204A8E
_02204A66:
	bl ov01_02204B24
	cmp r0, #0
	beq _02204A8E
	ldr r0, [r4, #8]
	mov r1, #0
	bl sub_0205F328
	mov r0, #0xa
	str r0, [r4]
	b _02204A8E
_02204A7C:
	ldr r0, [r4, #8]
	bl MapObject_PauseMovement
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x14
	mov r0, #1
	pop {r3, r4, r5, r6, pc}
_02204A8E:
	mov r0, #0
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_02204A94: .word ov01_02204B78
_02204A98: .word SEQ_SE_GS_KI_YURERU
_02204A9C: .word 0xFFFFF000
_02204AA0: .word 0x0000010E
_02204AA4: .word 0x00000106
_02204AA8: .word SEQ_SE_GS_FW255E
	thumb_func_end Task_AnimApricornTree

	thumb_func_start ov01_02204AAC
ov01_02204AAC: ; 0x02204AAC
	push {r3, r4, lr}
	sub sp, #0xc
	str r1, [sp]
	mov r4, #0
	str r4, [sp, #4]
	mov r1, #1
	str r1, [sp, #8]
	add r1, r2, #0
	add r2, r3, #0
	add r3, r4, #0
	bl CreateSpecialFieldObject
	add r4, r0, #0
	bne _02204ACC
	bl GF_AssertFail
_02204ACC:
	add r0, r4, #0
	mov r1, #0xfc
	bl MapObject_SetID
	add r0, r4, #0
	mov r1, #0
	bl MapObject_SetType
	add r0, r4, #0
	mov r1, #0
	bl MapObject_SetFlagID
	mov r1, #0
	add r0, r4, #0
	mvn r1, r1
	bl MapObject_SetXRange
	mov r1, #0
	add r0, r4, #0
	mvn r1, r1
	bl MapObject_SetYRange
	mov r1, #9
	add r0, r4, #0
	lsl r1, r1, #0xa
	bl MapObject_SetBits
	mov r1, #6
	add r0, r4, #0
	lsl r1, r1, #6
	bl MapObject_ClearBits
	add r0, r4, #0
	mov r1, #1
	bl sub_0205F89C
	mov r1, #2
	add r0, r4, #0
	lsl r1, r1, #8
	bl MapObject_SetBits
	add r0, r4, #0
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov01_02204AAC

	thumb_func_start ov01_02204B24
ov01_02204B24: ; 0x02204B24
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldr r0, [r4, #4]
	add r1, sp, #0
	bl MapObject_GetPositionVec
	ldr r1, [r4, #0xc]
	ldr r0, _02204B74 ; =ov01_022095F4
	ldr r2, [sp, #4]
	ldrsb r0, [r0, r1]
	ldr r1, [sp]
	lsl r0, r0, #0xc
	add r0, r2, r0
	str r0, [sp, #4]
	ldr r0, [r4, #0x14]
	add r0, r1, r0
	str r0, [sp]
	ldr r1, [sp, #8]
	ldr r0, [r4, #0x1c]
	add r0, r1, r0
	str r0, [sp, #8]
	ldr r0, [r4, #4]
	add r1, sp, #0
	bl MapObject_SetPositionVec
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
	cmp r0, #0x10
	blt _02204B6E
	ldr r0, [r4, #4]
	bl MapObject_Remove
	add sp, #0xc
	mov r0, #1
	pop {r3, r4, pc}
_02204B6E:
	mov r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
_02204B74: .word ov01_022095F4
	thumb_func_end ov01_02204B24

	thumb_func_start ov01_02204B78
ov01_02204B78: ; 0x02204B78
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	bl TaskManager_GetSys
	add r5, r0, #0
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetMapObject
	add r6, r0, #0
	add r0, r7, #0
	bl TaskManager_GetStatePtr
	add r4, r0, #0
	add r0, r7, #0
	bl TaskManager_GetEnv
	add r7, r0, #0
	ldr r0, [r4]
	cmp r0, #3
	bhi _02204C40
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02204BAC: ; jump table
	.short _02204BB4 - _02204BAC - 2 ; case 0
	.short _02204BC2 - _02204BAC - 2 ; case 1
	.short _02204BF6 - _02204BAC - 2 ; case 2
	.short _02204C30 - _02204BAC - 2 ; case 3
_02204BB4:
	add r0, r6, #0
	bl MapObject_UnpauseMovement
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02204C40
_02204BC2:
	add r0, r6, #0
	bl MapObject_AreBitsSetForMovementScriptInit
	cmp r0, #1
	bne _02204C40
	add r0, r6, #0
	bl MapObject_ClearHeldMovementIfActive
	mov r1, #2
	ldr r0, [r5, #0x40]
	lsl r1, r1, #0xc
	bl ov01_PlayerAvatar_OrrTransitionFlags
	ldr r0, [r5, #0x40]
	bl ov01_PlayerAvatar_ApplyTransitionFlags
	add r0, r6, #0
	mov r1, #0
	bl sub_0205F328
	mov r0, #0
	str r0, [r7]
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02204C40
_02204BF6:
	ldr r0, [r7]
	add r0, r0, #1
	str r0, [r7]
	cmp r0, #0x18
	ble _02204C40
	add r0, r6, #0
	bl MapObject_AreBitsSetForMovementScriptInit
	cmp r0, #1
	bne _02204C40
	add r0, r6, #0
	bl MapObject_ClearHeldMovementIfActive
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetState
	bl sub_0205C99C
	add r1, r0, #0
	ldr r0, [r5, #0x40]
	bl ov01_PlayerAvatar_OrrTransitionFlags
	ldr r0, [r5, #0x40]
	bl ov01_PlayerAvatar_ApplyTransitionFlags
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02204C40
_02204C30:
	add r0, r6, #0
	bl MapObject_PauseMovement
	add r0, r7, #0
	bl FreeToHeap
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02204C40:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov01_02204B78

	thumb_func_start ov01_02204C44
ov01_02204C44: ; 0x02204C44
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #0xb
	mov r1, #0x18
	add r6, r2, #0
	add r7, r3, #0
	bl AllocFromHeapAtEnd
	add r2, r0, #0
	cmp r4, #0
	beq _02204C60
	mov r0, #1
	b _02204C62
_02204C60:
	mov r0, #0
_02204C62:
	str r0, [r2]
	str r6, [r2, #8]
	str r7, [r2, #0xc]
	ldr r0, [r2, #8]
	mov r1, #0
	strh r1, [r0]
	ldr r0, [r2, #0xc]
	strh r1, [r0]
	ldr r0, [r5, #0x10]
	ldr r1, _02204C7C ; =ov01_02204C80
	bl TaskManager_Call
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02204C7C: .word ov01_02204C80
	thumb_func_end ov01_02204C44

	thumb_func_start ov01_02204C80
ov01_02204C80: ; 0x02204C80
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	bl TaskManager_GetSys
	add r6, r0, #0
	add r0, r5, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	add r0, r6, #0
	add r1, sp, #0
	bl ov02_022470A0
	cmp r0, #0
	beq _02204CC0
	ldr r0, [r4, #8]
	mov r1, #0
	strh r1, [r0]
	ldr r0, [r4, #0xc]
	strh r1, [r0]
	add r0, r4, #0
	bl FreeToHeap
	ldr r2, [sp]
	add r0, r6, #0
	add r1, r5, #0
	bl sub_02050B90
	add sp, #4
	mov r0, #0
	pop {r3, r4, r5, r6, pc}
_02204CC0:
	add r0, r6, #0
	add r1, r4, #0
	bl ov01_02204CF8
	cmp r0, #0
	beq _02204CDC
	ldr r1, _02204CF4 ; =ov01_02204DA0
	add r0, r5, #0
	add r2, r4, #0
	bl TaskManager_Jump
	add sp, #4
	mov r0, #0
	pop {r3, r4, r5, r6, pc}
_02204CDC:
	ldr r0, [r4, #8]
	mov r1, #0
	strh r1, [r0]
	ldr r0, [r4, #0xc]
	strh r1, [r0]
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #1
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_02204CF4: .word ov01_02204DA0
	thumb_func_end ov01_02204C80

	thumb_func_start ov01_02204CF8
ov01_02204CF8: ; 0x02204CF8
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r6, r0, #0
	ldr r2, [r6, #0x20]
	add r5, r1, #0
	ldr r2, [r2]
	add r0, sp, #0
	mov r1, #0xff
	bl ReadWholeNarcMemberByIdPair
	add r0, sp, #0
	ldrh r4, [r0]
	cmp r4, #0
	bne _02204D1A
	add sp, #4
	mov r0, #0
	pop {r3, r4, r5, r6, pc}
_02204D1A:
	ldrh r0, [r0, #2]
	cmp r0, #3
	blo _02204D2A
	bl GF_AssertFail
	add sp, #4
	mov r0, #0
	pop {r3, r4, r5, r6, pc}
_02204D2A:
	ldr r0, [r6, #0xc]
	bl SavArray_PlayerParty_get
	mov r1, #0
	bl GetPartyMonByIndex
	mov r1, #0x4c
	mov r2, #0
	add r6, r0, #0
	bl GetMonData
	cmp r0, #0
	bne _02204D50
	add r0, r6, #0
	mov r1, #0xa
	mov r2, #0
	bl GetMonData
	b _02204D52
_02204D50:
	mov r0, #0x7b
_02204D52:
	str r0, [r5, #4]
	cmp r0, #0x15
	beq _02204D62
	cmp r0, #0x2a
	beq _02204D66
	cmp r0, #0x33
	beq _02204D6A
	b _02204D6C
_02204D62:
	add r4, r4, #5
	b _02204D6C
_02204D66:
	add r4, r4, #5
	b _02204D6C
_02204D6A:
	add r4, r4, #5
_02204D6C:
	ldr r0, [r5]
	cmp r0, #0
	beq _02204D74
	add r4, r4, #5
_02204D74:
	cmp r4, #0x64
	ble _02204D7A
	mov r4, #0x64
_02204D7A:
	bl LCRandom
	mov r1, #0x64
	bl _s32_div_f
	cmp r1, r4
	bge _02204D98
	add r0, sp, #0
	ldrh r1, [r0]
	add sp, #4
	strh r1, [r5, #0x10]
	ldrh r0, [r0, #2]
	strh r0, [r5, #0x12]
	mov r0, #1
	pop {r3, r4, r5, r6, pc}
_02204D98:
	mov r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov01_02204CF8

	thumb_func_start ov01_02204DA0
ov01_02204DA0: ; 0x02204DA0
	push {r4, r5, r6, lr}
	add r6, r0, #0
	bl TaskManager_GetStatePtr
	add r4, r0, #0
	add r0, r6, #0
	bl TaskManager_GetEnv
	add r5, r0, #0
	add r0, r6, #0
	bl TaskManager_GetSys
	ldr r1, [r4]
	cmp r1, #0
	beq _02204DC8
	cmp r1, #1
	beq _02204DEC
	cmp r1, #2
	beq _02204E04
	b _02204E7A
_02204DC8:
	ldr r1, [r5]
	cmp r1, #0
	beq _02204DD4
	bl FollowingPokemon_GetMapObject
	b _02204DDA
_02204DD4:
	ldr r0, [r0, #0x40]
	bl PlayerAvatar_GetMapObject
_02204DDA:
	mov r1, #0
	mov r2, #1
	bl ov01_02200540
	str r0, [r5, #0x14]
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02204E7A
_02204DEC:
	ldr r0, [r5, #0x14]
	bl ov01_022003F4
	cmp r0, #0
	beq _02204E7A
	ldr r0, [r5, #0x14]
	bl sub_02068B48
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02204E7A
_02204E04:
	bl ov01_02204E8C
	add r4, r0, #0
	ldr r0, [r5, #4]
	cmp r0, #0x20
	beq _02204E14
	cmp r0, #0x69
	bne _02204E1E
_02204E14:
	cmp r4, #7
	bhs _02204E1E
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
_02204E1E:
	cmp r4, #8
	blo _02204E26
	bl GF_AssertFail
_02204E26:
	ldrh r0, [r5, #0x12]
	cmp r0, #0
	beq _02204E36
	cmp r0, #1
	beq _02204E3E
	cmp r0, #2
	beq _02204E46
	b _02204E4E
_02204E36:
	ldr r0, _02204E80 ; =ov01_02209614
	lsl r1, r4, #1
	ldrh r2, [r0, r1]
	b _02204E66
_02204E3E:
	ldr r0, _02204E84 ; =ov01_02209604
	lsl r1, r4, #1
	ldrh r2, [r0, r1]
	b _02204E66
_02204E46:
	ldr r0, _02204E88 ; =ov01_02209624
	lsl r1, r4, #1
	ldrh r2, [r0, r1]
	b _02204E66
_02204E4E:
	bl GF_AssertFail
	ldr r0, [r5, #8]
	mov r1, #0
	strh r1, [r0]
	ldr r0, [r5, #0xc]
	strh r1, [r0]
	add r0, r5, #0
	bl FreeToHeap
	mov r0, #1
	pop {r4, r5, r6, pc}
_02204E66:
	ldr r0, [r5, #8]
	mov r1, #1
	strh r1, [r0]
	ldr r0, [r5, #0xc]
	strh r2, [r0]
	add r0, r5, #0
	bl FreeToHeap
	mov r0, #1
	pop {r4, r5, r6, pc}
_02204E7A:
	mov r0, #0
	pop {r4, r5, r6, pc}
	nop
_02204E80: .word ov01_02209614
_02204E84: .word ov01_02209604
_02204E88: .word ov01_02209624
	thumb_func_end ov01_02204DA0

	thumb_func_start ov01_02204E8C
ov01_02204E8C: ; 0x02204E8C
	push {r3, lr}
	bl LCRandom
	mov r1, #0x64
	bl _s32_div_f
	lsl r0, r1, #0x18
	lsr r0, r0, #0x18
	cmp r0, #0x19
	bhs _02204EA4
	mov r0, #0
	pop {r3, pc}
_02204EA4:
	cmp r0, #0x2d
	bhs _02204EAC
	mov r0, #1
	pop {r3, pc}
_02204EAC:
	cmp r0, #0x37
	bhs _02204EB4
	mov r0, #2
	pop {r3, pc}
_02204EB4:
	cmp r0, #0x41
	bhs _02204EBC
	mov r0, #3
	pop {r3, pc}
_02204EBC:
	cmp r0, #0x4b
	bhs _02204EC4
	mov r0, #4
	pop {r3, pc}
_02204EC4:
	cmp r0, #0x55
	bhs _02204ECC
	mov r0, #5
	pop {r3, pc}
_02204ECC:
	cmp r0, #0x5f
	bhs _02204ED4
	mov r0, #6
	pop {r3, pc}
_02204ED4:
	mov r0, #7
	pop {r3, pc}
	thumb_func_end ov01_02204E8C

	thumb_func_start ov01_02204ED8
ov01_02204ED8: ; 0x02204ED8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #0xb
	mov r1, #4
	bl AllocFromHeapAtEnd
	add r2, r0, #0
	str r4, [r2]
	mov r0, #0
	strh r0, [r4]
	ldr r0, [r5, #0x10]
	ldr r1, _02204EF8 ; =ov01_02204EFC
	bl TaskManager_Call
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02204EF8: .word ov01_02204EFC
	thumb_func_end ov01_02204ED8

	thumb_func_start ov01_02204EFC
ov01_02204EFC: ; 0x02204EFC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r7, r0, #0
	bl TaskManager_GetSys
	add r5, r0, #0
	add r0, r7, #0
	bl TaskManager_GetEnv
	ldr r1, [r5, #0x20]
	add r6, r0, #0
	ldr r1, [r1]
	mov r0, #0xfe
	mov r2, #0xb
	bl AllocAtEndAndReadWholeNarcMemberByIdPair
	add r4, r0, #0
	ldrh r0, [r4]
	cmp r0, #0
	bne _02204F2A
	ldrh r0, [r4, #2]
	cmp r0, #0
	beq _02204FCE
_02204F2A:
	add r0, r5, #0
	add r1, sp, #0xc
	add r2, sp, #8
	bl ov01_022050F8
	ldr r0, [r5, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	bl PlayerProfile_GetTrainerID
	add r2, r0, #0
	ldr r0, [sp, #8]
	str r0, [sp]
	add r0, r4, #0
	add r0, #0x4c
	str r0, [sp, #4]
	ldrh r0, [r4]
	ldrh r1, [r4, #2]
	ldr r3, [sp, #0xc]
	bl ov01_02204FE0
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _02204F6E
	add r0, r4, #0
	bl FreeToHeap
	add r0, r6, #0
	bl FreeToHeap
	add sp, #0x14
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_02204F6E:
	cmp r0, #0
	bne _02204F76
	add r2, r4, #4
	b _02204FA0
_02204F76:
	cmp r0, #1
	bne _02204F80
	add r2, r4, #0
	add r2, #0x1c
	b _02204FA0
_02204F80:
	cmp r0, #2
	bne _02204F8A
	add r2, r4, #0
	add r2, #0x34
	b _02204FA0
_02204F8A:
	bl GF_AssertFail
	add r0, r4, #0
	bl FreeToHeap
	add r0, r6, #0
	bl FreeToHeap
	add sp, #0x14
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_02204FA0:
	add r0, r5, #0
	add r1, sp, #0x10
	bl ov02_02247374
	cmp r0, #0
	beq _02204FCE
	ldr r0, [r6]
	mov r1, #1
	strh r1, [r0]
	add r0, r4, #0
	bl FreeToHeap
	add r0, r6, #0
	bl FreeToHeap
	ldr r2, [sp, #0x10]
	add r0, r5, #0
	add r1, r7, #0
	bl sub_02050B90
	add sp, #0x14
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_02204FCE:
	add r0, r4, #0
	bl FreeToHeap
	add r0, r6, #0
	bl FreeToHeap
	mov r0, #1
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov01_02204EFC

	thumb_func_start ov01_02204FE0
ov01_02204FE0: ; 0x02204FE0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r0, [sp]
	add r0, r1, #0
	ldr r1, [sp]
	mov r5, #6
	add r6, r1, #0
	mul r6, r5
	mul r5, r0
	lsl r1, r6, #0x10
	lsl r0, r5, #0x10
	lsr r0, r0, #0x10
	str r2, [sp, #4]
	add r4, r3, #0
	mov ip, r0
	lsr r1, r1, #0x10
	mov r0, #0
	ldr r3, [sp, #0x20]
	ldr r2, [sp, #0x24]
	cmp r1, #0
	bls _02205040
	mov r7, #2
_0220500C:
	lsl r5, r0, #2
	add r6, r2, r5
	ldrsh r5, [r2, r5]
	cmp r4, r5
	bne _02205036
	ldrsh r5, [r6, r7]
	cmp r3, r5
	bne _02205036
	mov r1, #6
	bl _s32_div_f
	ldr r1, [sp]
	lsl r0, r0, #0x18
	lsl r1, r1, #0x18
	ldr r2, [sp, #4]
	lsr r0, r0, #0x18
	lsr r1, r1, #0x18
	bl ov01_02205074
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_02205036:
	add r0, r0, #1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	cmp r0, r1
	blo _0220500C
_02205040:
	mov r0, ip
	add r5, r1, r0
	cmp r1, r5
	bge _0220506A
	mov r6, #2
_0220504A:
	lsl r7, r1, #2
	add r0, r2, r7
	ldrsh r7, [r2, r7]
	cmp r4, r7
	bne _02205060
	ldrsh r0, [r0, r6]
	cmp r3, r0
	bne _02205060
	add sp, #8
	mov r0, #2
	pop {r3, r4, r5, r6, r7, pc}
_02205060:
	add r0, r1, #1
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	cmp r1, r5
	blt _0220504A
_0220506A:
	mov r0, #0
	mvn r0, r0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_02204FE0

	thumb_func_start ov01_02205074
ov01_02205074: ; 0x02205074
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r5, r1, #0
	mov r7, #0
	add r0, r2, #0
	mov r1, #0xa
	mvn r7, r7
	bl _u32_div_f
	lsl r0, r1, #0x18
	lsr r4, r0, #0x18
	cmp r5, #5
	blo _022050A6
	add r0, r6, #0
	mov r1, #5
	bl _s32_div_f
	lsl r0, r4, #2
	add r3, r4, r0
	lsl r0, r1, #0x18
	ldr r2, _022050E4 ; =ov01_0220969A
	lsr r1, r0, #0x18
	add r0, r2, r3
	ldrsb r7, [r1, r0]
	b _022050E0
_022050A6:
	cmp r5, #4
	bne _022050B4
	ldr r0, _022050E8 ; =ov01_02209672
	lsl r1, r4, #2
	add r0, r0, r1
	ldrsb r7, [r6, r0]
	b _022050E0
_022050B4:
	cmp r5, #3
	bne _022050C4
	lsl r0, r4, #1
	add r1, r4, r0
	ldr r0, _022050EC ; =ov01_02209654
	add r0, r0, r1
	ldrsb r7, [r6, r0]
	b _022050E0
_022050C4:
	cmp r5, #2
	bne _022050D2
	ldr r0, _022050F0 ; =ov01_02209640
	lsl r1, r4, #1
	add r0, r0, r1
	ldrsb r7, [r6, r0]
	b _022050E0
_022050D2:
	cmp r5, #1
	bne _022050DC
	ldr r0, _022050F4 ; =ov01_02209634
	ldrsb r7, [r0, r4]
	b _022050E0
_022050DC:
	bl GF_AssertFail
_022050E0:
	add r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022050E4: .word ov01_0220969A
_022050E8: .word ov01_02209672
_022050EC: .word ov01_02209654
_022050F0: .word ov01_02209640
_022050F4: .word ov01_02209634
	thumb_func_end ov01_02205074

	thumb_func_start ov01_022050F8
ov01_022050F8: ; 0x022050F8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldr r0, [r4, #0x40]
	add r6, r1, #0
	str r2, [sp]
	add r1, sp, #8
	add r2, sp, #4
	bl sub_0205E02C
	add r0, r4, #0
	bl FollowingPokemon_IsActive
	cmp r0, #0
	beq _02205156
	add r0, r4, #0
	bl FollowingPokemon_GetMapObject
	add r7, r0, #0
	bl MapObject_GetCurrentX
	add r5, r0, #0
	add r0, r7, #0
	bl MapObject_GetCurrentY
	add r4, r0, #0
	ldr r0, [sp, #8]
	cmp r0, r5
	bne _02205156
	ldr r0, [sp, #4]
	cmp r0, r4
	bne _02205156
	add r0, r7, #0
	bl MapObject_GetFacingDirection
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
	add r0, r7, #0
	bl GetDeltaXByFacingDirection
	add r0, r5, r0
	str r0, [sp, #8]
	add r0, r7, #0
	bl GetDeltaYByFacingDirection
	add r0, r4, r0
	str r0, [sp, #4]
_02205156:
	ldr r0, [sp, #8]
	str r0, [r6]
	ldr r1, [sp, #4]
	ldr r0, [sp]
	str r1, [r0]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov01_022050F8

	thumb_func_start ScrCmd_795
ScrCmd_795: ; 0x02205164
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x80
	ldr r5, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r5, #0
	mov r1, #0x28
	bl FieldSysGetAttrAddr
	lsl r1, r6, #0x18
	lsl r2, r7, #0x18
	add r4, #0x80
	add r5, r0, #0
	ldr r0, [r4]
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
	bl ov01_021EED60
	str r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ScrCmd_795

	thumb_func_start ScrCmd_796
ScrCmd_796: ; 0x022051B4
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x28
	bl FieldSysGetAttrAddr
	ldr r0, [r0]
	bl ov01_021EEE30
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_796

	thumb_func_start ScrCmd_797
ScrCmd_797: ; 0x022051CC
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x28
	bl FieldSysGetAttrAddr
	add r1, r0, #0
	add r4, #0x80
	ldr r0, [r4]
	ldr r1, [r1]
	bl ov01_021EEE44
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_797

	thumb_func_start ov01_022051EC
ov01_022051EC: ; 0x022051EC
	push {r3, r4, r5, lr}
	mov r2, #0
	mov r1, #0xc4
	add r3, r2, #0
	add r5, r0, #0
	bl ov01_021F1430
	add r4, r0, #0
	str r5, [r4]
	bl ov01_02205218
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_022051EC

	thumb_func_start ov01_02205208
ov01_02205208: ; 0x02205208
	push {r4, lr}
	add r4, r0, #0
	bl ov01_022052A4
	add r0, r4, #0
	bl ov01_021F1448
	pop {r4, pc}
	thumb_func_end ov01_02205208

	thumb_func_start ov01_02205218
ov01_02205218: ; 0x02205218
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	add r0, r4, #4
	mov r1, #4
	mov r2, #0x20
	bl GF_ExpHeap_FndInitAllocator
	add r0, r4, #0
	add r0, #0x14
	mov r1, #0x67
	mov r2, #0x84
	mov r3, #4
	bl ov01_021FBCD8
	mov r0, #4
	str r0, [sp]
	add r0, r4, #4
	str r0, [sp, #4]
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0x24
	add r1, #0x14
	mov r2, #0x67
	mov r3, #0xa8
	bl ov01_021FBE44
	mov r0, #4
	str r0, [sp]
	add r0, r4, #4
	str r0, [sp, #4]
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0x38
	add r1, #0x14
	mov r2, #0x67
	mov r3, #0xa6
	bl ov01_021FBE44
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0x4c
	add r1, #0x14
	bl ov01_021FBF2C
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0x4c
	add r1, #0x24
	bl ov01_021FBF50
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0x4c
	add r1, #0x38
	bl ov01_021FBF50
	add r0, r4, #0
	add r0, #0x24
	mov r1, #2
	mov r2, #0
	bl ov01_022053C4
	add r4, #0x4c
	add r0, r4, #0
	mov r1, #0
	bl ov01_021FC004
	add sp, #8
	pop {r4, pc}
	thumb_func_end ov01_02205218

	thumb_func_start ov01_022052A4
ov01_022052A4: ; 0x022052A4
	push {r4, lr}
	add r4, r0, #0
	add r1, r4, #4
	add r0, #0x38
	bl ov01_021FBE80
	add r0, r4, #0
	add r0, #0x24
	add r1, r4, #4
	bl ov01_021FBE80
	add r4, #0x14
	add r0, r4, #0
	bl ov01_021FBDA8
	pop {r4, pc}
	thumb_func_end ov01_022052A4

	thumb_func_start ov01_022052C4
ov01_022052C4: ; 0x022052C4
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r4, r1, #0
	mov r1, #0x16
	str r5, [sp, #8]
	bl ov01_021F1450
	str r0, [sp, #0xc]
	add r0, sp, #8
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r1, _022052F0 ; =ov01_022096CC
	add r0, r5, #0
	add r2, r4, #0
	mov r3, #0
	bl ov01_021F1620
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_022052F0: .word ov01_022096CC
	thumb_func_end ov01_022052C4

	thumb_func_start ov01_022052F4
ov01_022052F4: ; 0x022052F4
	push {r3, lr}
	bl sub_02068D74
	ldr r0, [r0]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov01_022052F4

	thumb_func_start ov01_02205300
ov01_02205300: ; 0x02205300
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r4, r1, #0
	bl sub_02068D98
	ldr r1, [r0, #4]
	mov r2, #0
	str r1, [r4, #4]
	str r2, [r4]
	ldr r4, [r0, #4]
	mov r1, #2
	add r0, r4, #0
	add r0, #0x24
	bl ov01_022053C4
	add r0, r4, #0
	add r0, #0x4c
	mov r1, #1
	bl ov01_021FC004
	add r0, r5, #0
	add r1, sp, #0
	bl sub_02068DB8
	add r4, #0x4c
	ldr r1, [sp]
	ldr r2, [sp, #4]
	ldr r3, [sp, #8]
	add r0, r4, #0
	bl ov01_021FC00C
	mov r0, #SEQ_SE_GS_TUREARUKI>>4
	lsl r0, r0, #4
	bl PlaySE
	mov r0, #1
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_02205300

	thumb_func_start ov01_02205350
ov01_02205350: ; 0x02205350
	bx lr
	.balign 4, 0
	thumb_func_end ov01_02205350

	thumb_func_start ov01_02205354
ov01_02205354: ; 0x02205354
	ldr r0, [r1, #4]
	ldr r3, _02205360 ; =ov01_021FC004
	add r0, #0x4c
	mov r1, #0
	bx r3
	nop
_02205360: .word ov01_021FC004
	thumb_func_end ov01_02205354

	thumb_func_start ov01_02205364
ov01_02205364: ; 0x02205364
	push {r3, r4, r5, lr}
	add r5, r1, #0
	ldr r4, [r5, #4]
	mov r1, #2
	add r0, r4, #0
	add r0, #0x24
	bl ov01_02205388
	cmp r0, #0
	beq _0220537C
	mov r0, #1
	str r0, [r5]
_0220537C:
	add r4, #0x4c
	add r0, r4, #0
	bl ov01_021FBF68
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_02205364

	thumb_func_start ov01_02205388
ov01_02205388: ; 0x02205388
	push {r3, r4, r5, r6, r7, lr}
	mov r5, #0
	add r6, r1, #0
	add r7, r0, #0
	add r4, r5, #0
	cmp r6, #0
	bls _022053B8
_02205396:
	mov r0, #0x14
	mul r0, r4
	mov r1, #1
	add r0, r7, r0
	lsl r1, r1, #0xc
	bl ov01_021FBEE4
	cmp r0, #0
	beq _022053AE
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
_022053AE:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, r6
	blo _02205396
_022053B8:
	cmp r5, r6
	bne _022053C0
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_022053C0:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov01_02205388

	thumb_func_start ov01_022053C4
ov01_022053C4: ; 0x022053C4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r6, r0, #0
	add r7, r2, #0
	mov r4, #0
	cmp r5, #0
	bls _022053E8
_022053D2:
	mov r0, #0x14
	mul r0, r4
	add r0, r6, r0
	add r1, r7, #0
	bl ov01_021FBF20
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, r5
	blo _022053D2
_022053E8:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_022053C4

	thumb_func_start ScrCmd_808
ScrCmd_808: ; 0x022053EC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	ldr r6, _02205420 ; =FS_OVERLAY_ID(OVY_25)
	add r4, r0, #0
	add r0, r6, #0
	mov r1, #2
	bl HandleLoadOverlay
	add r5, #0x80
	ldr r0, [r5]
	add r1, r4, #0
	bl ov25_022598C0
	add r0, r6, #0
	bl UnloadOverlayByID
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02205420: .word FS_OVERLAY_ID(OVY_25)
	thumb_func_end ScrCmd_808

	thumb_func_start ov01_02205424
ov01_02205424: ; 0x02205424
	mov r1, #1
	add r0, #0xf9
	strb r1, [r0]
	bx lr
	thumb_func_end ov01_02205424

	thumb_func_start ov01_0220542C
ov01_0220542C: ; 0x0220542C
	push {r4, r5, r6, lr}
	sub sp, #0x40
	ldr r6, _022054D0 ; =ov01_02209720
	add r5, sp, #0x30
	add r4, r0, #0
	add r3, r1, #0
	ldmia r6!, {r0, r1}
	add r2, r5, #0
	stmia r5!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r5!, {r0, r1}
	ldr r6, _022054D4 ; =ov01_02209730
	add r5, sp, #0x20
	ldmia r6!, {r0, r1}
	stmia r5!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r5!, {r0, r1}
	ldr r6, _022054D8 ; =ov01_02209740
	add r5, sp, #0x10
	ldmia r6!, {r0, r1}
	stmia r5!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r5!, {r0, r1}
	ldr r6, _022054DC ; =ov01_02209710
	add r5, sp, #0
	ldmia r6!, {r0, r1}
	stmia r5!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r5!, {r0, r1}
	mov r1, #0
_02205468:
	lsl r0, r1, #2
	ldr r0, [r2, r0]
	cmp r3, r0
	bne _0220547A
	add r0, sp, #0x20
	lsl r1, r4, #2
	add sp, #0x40
	ldr r0, [r0, r1]
	pop {r4, r5, r6, pc}
_0220547A:
	add r0, r1, #1
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	cmp r1, #4
	blo _02205468
	mov r2, #0
	add r1, sp, #0x20
_02205488:
	lsl r0, r2, #2
	ldr r0, [r1, r0]
	cmp r3, r0
	bne _0220549A
	add r0, sp, #0x10
	lsl r1, r4, #2
	add sp, #0x40
	ldr r0, [r0, r1]
	pop {r4, r5, r6, pc}
_0220549A:
	add r0, r2, #1
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	cmp r2, #4
	blo _02205488
	mov r2, #0
	add r1, sp, #0x10
_022054A8:
	lsl r0, r2, #2
	ldr r0, [r1, r0]
	cmp r3, r0
	bne _022054BA
	add r0, sp, #0
	lsl r1, r4, #2
	add sp, #0x40
	ldr r0, [r0, r1]
	pop {r4, r5, r6, pc}
_022054BA:
	add r0, r2, #1
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	cmp r2, #4
	blo _022054A8
	bl GF_AssertFail
	mov r0, #0
	add sp, #0x40
	pop {r4, r5, r6, pc}
	nop
_022054D0: .word ov01_02209720
_022054D4: .word ov01_02209730
_022054D8: .word ov01_02209740
_022054DC: .word ov01_02209710
	thumb_func_end ov01_0220542C

	thumb_func_start ov01_022054E0
ov01_022054E0: ; 0x022054E0
	push {r3, r4, r5, lr}
	sub sp, #0xc0
	ldr r5, _02205538 ; =ov01_02209750
	add r4, r0, #0
	add r3, sp, #0
	mov r2, #0x18
_022054EC:
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _022054EC
	add r0, r4, #0
	bl ov01_02205584
	cmp r0, #0
	beq _02205504
	add sp, #0xc0
	mov r0, #0
	pop {r3, r4, r5, pc}
_02205504:
	add r0, r4, #0
	bl sub_020659A8
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	bne _02205516
	add sp, #0xc0
	mov r0, #0
	pop {r3, r4, r5, pc}
_02205516:
	add r0, r4, #0
	bl sub_0206599C
	add r4, r0, #0
	cmp r4, #0x10
	blt _02205526
	bl GF_AssertFail
_02205526:
	sub r0, r5, #1
	lsl r0, r0, #0x18
	lsr r2, r0, #0x12
	add r0, sp, #0
	lsl r1, r4, #2
	add r0, r0, r2
	ldr r0, [r1, r0]
	add sp, #0xc0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02205538: .word ov01_02209750
	thumb_func_end ov01_022054E0

	thumb_func_start ov01_0220553C
ov01_0220553C: ; 0x0220553C
	push {r4, lr}
	add r4, r0, #0
	bl MapObject_GetID
	cmp r0, #0xfd
	beq _02205554
	cmp r0, #0xfa
	beq _02205554
	cmp r0, #0xfb
	beq _02205554
	mov r0, #0
	pop {r4, pc}
_02205554:
	add r0, r4, #0
	mov r1, #2
	bl MapObject_GetParam
	mov r1, #1
	and r0, r1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_0220553C

	thumb_func_start ov01_02205564
ov01_02205564: ; 0x02205564
	push {r3, lr}
	bl MapObject_GetGfxID
	ldr r1, _02205580 ; =0x0000019F
	cmp r0, r1
	blt _0220557A
	add r1, r1, #5
	cmp r0, r1
	bgt _0220557A
	mov r0, #1
	pop {r3, pc}
_0220557A:
	mov r0, #0
	pop {r3, pc}
	nop
_02205580: .word 0x0000019F
	thumb_func_end ov01_02205564

	thumb_func_start ov01_02205584
ov01_02205584: ; 0x02205584
	push {r3, r4, r5, lr}
	mov r1, #1
	add r4, r0, #0
	bl MapObject_GetParam
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	add r0, r4, #0
	bl MapObject_GetID
	cmp r0, #0xfd
	beq _022055A0
	mov r0, #0
	pop {r3, r4, r5, pc}
_022055A0:
	lsl r0, r5, #0x18
	lsr r0, r0, #0x18
	asr r1, r0, #4
	mov r0, #0xf
	and r0, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r3, r4, r5, pc}
	thumb_func_end ov01_02205584

	thumb_func_start ov01_022055B0
ov01_022055B0: ; 0x022055B0
	push {r3, r4, r5, lr}
	mov r1, #1
	add r4, r0, #0
	bl MapObject_GetParam
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	add r0, r4, #0
	bl MapObject_GetID
	cmp r0, #0xfd
	beq _022055CC
	mov r0, #0
	pop {r3, r4, r5, pc}
_022055CC:
	lsl r0, r5, #0x18
	lsr r1, r0, #0x18
	mov r0, #0xf
	and r0, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_022055B0

	thumb_func_start ov01_022055DC
ov01_022055DC: ; 0x022055DC
	push {r3, r4, r5, lr}
	mov r1, #1
	add r4, r0, #0
	bl MapObject_GetParam
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	add r0, r4, #0
	bl MapObject_GetID
	cmp r0, #0xfd
	beq _022055F8
	mov r0, #0
	pop {r3, r4, r5, pc}
_022055F8:
	asr r1, r5, #8
	mov r0, #0xf
	and r0, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r3, r4, r5, pc}
	thumb_func_end ov01_022055DC

	thumb_func_start ov01_02205604
ov01_02205604: ; 0x02205604
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r4, r1, #0
	add r5, r2, #0
	bl MapObject_GetFacingDirection
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	add r0, r7, #0
	bl MapObject_GetCurrentX
	str r0, [r4]
	add r0, r7, #0
	bl MapObject_GetCurrentY
	str r0, [r5]
	cmp r6, #3
	bhi _0220565C
	add r0, r6, r6
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02205634: ; jump table
	.short _0220563C - _02205634 - 2 ; case 0
	.short _02205644 - _02205634 - 2 ; case 1
	.short _0220564C - _02205634 - 2 ; case 2
	.short _02205654 - _02205634 - 2 ; case 3
_0220563C:
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_02205644:
	ldr r0, [r5]
	sub r0, r0, #1
	str r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_0220564C:
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_02205654:
	ldr r0, [r4]
	sub r0, r0, #1
	str r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_0220565C:
	bl GF_AssertFail
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_02205604

	thumb_func_start ov01_02205664
ov01_02205664: ; 0x02205664
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r4, r1, #0
	add r5, r2, #0
	bl MapObject_GetFacingDirection
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	add r0, r7, #0
	bl MapObject_GetPrevX
	str r0, [r4]
	add r0, r7, #0
	bl MapObject_GetPrevY
	str r0, [r5]
	cmp r6, #3
	bhi _022056BC
	add r0, r6, r6
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02205694: ; jump table
	.short _0220569C - _02205694 - 2 ; case 0
	.short _022056A4 - _02205694 - 2 ; case 1
	.short _022056AC - _02205694 - 2 ; case 2
	.short _022056B4 - _02205694 - 2 ; case 3
_0220569C:
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_022056A4:
	ldr r0, [r5]
	sub r0, r0, #1
	str r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_022056AC:
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_022056B4:
	ldr r0, [r4]
	sub r0, r0, #1
	str r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_022056BC:
	bl GF_AssertFail
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_02205664

	thumb_func_start ov01_022056C4
ov01_022056C4: ; 0x022056C4
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r5, r1, #0
	bl MapObject_GetFieldSysPtr
	add r7, r0, #0
	add r0, r6, #0
	bl MapObject_GetCurrentX
	add r4, r0, #0
	add r0, r6, #0
	bl MapObject_GetCurrentY
	add r2, r0, #0
	cmp r5, #5
	bhi _02205716
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022056F0: ; jump table
	.short _022056FC - _022056F0 - 2 ; case 0
	.short _02205700 - _022056F0 - 2 ; case 1
	.short _02205708 - _022056F0 - 2 ; case 2
	.short _02205704 - _022056F0 - 2 ; case 3
	.short _0220570C - _022056F0 - 2 ; case 4
	.short _02205712 - _022056F0 - 2 ; case 5
_022056FC:
	sub r2, r2, #1
	b _02205716
_02205700:
	add r2, r2, #1
	b _02205716
_02205704:
	sub r4, r4, #1
	b _02205716
_02205708:
	add r4, r4, #1
	b _02205716
_0220570C:
	add r4, r4, #1
	add r2, r2, #1
	b _02205716
_02205712:
	sub r4, r4, #1
	add r2, r2, #1
_02205716:
	add r0, r7, #0
	add r1, r4, #0
	bl GetMetatileBehaviorAt
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov01_022056C4

	thumb_func_start ov01_02205720
ov01_02205720: ; 0x02205720
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r1, #0
	add r1, sp, #0
	add r4, r2, #0
	add r6, r3, #0
	bl MapObject_GetPositionVec
	cmp r4, #3
	bhi _02205776
	add r0, r4, r4
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02205740: ; jump table
	.short _02205748 - _02205740 - 2 ; case 0
	.short _02205754 - _02205740 - 2 ; case 1
	.short _0220576C - _02205740 - 2 ; case 2
	.short _02205760 - _02205740 - 2 ; case 3
_02205748:
	mov r0, #1
	ldr r1, [sp, #8]
	lsl r0, r0, #0x10
	sub r0, r1, r0
	str r0, [sp, #8]
	b _02205776
_02205754:
	mov r0, #1
	ldr r1, [sp, #8]
	lsl r0, r0, #0x10
	add r0, r1, r0
	str r0, [sp, #8]
	b _02205776
_02205760:
	mov r0, #1
	ldr r1, [sp]
	lsl r0, r0, #0x10
	add r0, r1, r0
	str r0, [sp]
	b _02205776
_0220576C:
	mov r0, #1
	ldr r1, [sp]
	lsl r0, r0, #0x10
	sub r0, r1, r0
	str r0, [sp]
_02205776:
	add r0, r5, #0
	add r1, sp, #0
	add r2, r6, #0
	bl sub_0205FBC0
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov01_02205720

	thumb_func_start ov01_02205784
ov01_02205784: ; 0x02205784
	ldr r3, _0220578C ; =ov01_0220329C
	mov r1, #0
	bx r3
	nop
_0220578C: .word ov01_0220329C
	thumb_func_end ov01_02205784

	thumb_func_start ov01_02205790
ov01_02205790: ; 0x02205790
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r4, r1, #0
	bl FollowingPokemon_IsActive
	cmp r0, #0
	beq _022057BE
	add r0, r5, #0
	bl FollowingPokemon_GetMapObject
	add r6, r0, #0
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetMapObject
	add r1, sp, #0
	bl MapObject_GetPositionVec
	add r0, r6, #0
	add r1, sp, #0
	add r2, r4, #0
	bl sub_0205FBC0
_022057BE:
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov01_02205790

	thumb_func_start ov01_022057C4
ov01_022057C4: ; 0x022057C4
	push {r3, lr}
	bl FollowingPokemon_GetMapObject
	bl sub_0205F684
	pop {r3, pc}
	thumb_func_end ov01_022057C4

	thumb_func_start ov01_022057D0
ov01_022057D0: ; 0x022057D0
	push {r3, lr}
	bl FollowingPokemon_GetMapObject
	bl sub_020659B8
	pop {r3, pc}
	thumb_func_end ov01_022057D0

	thumb_func_start ov01_022057DC
ov01_022057DC: ; 0x022057DC
	push {r3, lr}
	bl sub_0205F1A0
	add r0, #0xfc
	ldr r0, [r0]
	mov r1, #0x16
	bl ov01_021FC5A4
	ldr r2, [r0]
	add r1, r0, #4
	lsl r0, r2, #1
	add r0, r1, r0
	add r3, r0, r2
	mov r1, #0
	cmp r2, #0
	ble _02205806
	mov r0, #1
_022057FE:
	strb r0, [r3, r1]
	add r1, r1, #1
	cmp r1, r2
	blt _022057FE
_02205806:
	pop {r3, pc}
	thumb_func_end ov01_022057DC

	thumb_func_start ov01_02205808
ov01_02205808: ; 0x02205808
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r5, r1, #0
	add r6, r0, #0
	add r0, r5, #0
	add r4, r2, #0
	bl sub_0205F35C
	add r7, r0, #0
	add r0, r5, #0
	bl MapObject_GetGfxID
	add r1, r0, #0
	add r0, r7, #0
	add r2, sp, #0
	bl ov01_021F9744
	add r0, r5, #0
	bl MapObject_GetID
	cmp r0, #0xfd
	beq _0220583C
	cmp r0, #0xfa
	beq _0220583C
	cmp r0, #0xfb
	bne _0220586A
_0220583C:
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	add r3, sp, #0
	bl ov01_02205870
	add r0, r4, #0
	add r1, sp, #0
	bl sub_02023EC8
	add r0, r5, #0
	bl MapObject_GetFacingDirection
	bl ov01_021FA44C
	add r1, r0, #0
	add r0, r4, #0
	bl sub_02023EE0
	add r0, r4, #0
	mov r1, #0
	bl sub_02023F40
_0220586A:
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_02205808

	thumb_func_start ov01_02205870
ov01_02205870: ; 0x02205870
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, r1, #0
	add r4, r3, #0
	bl sub_0205F35C
	bl sub_0205F1A0
	cmp r5, #0
	beq _02205888
	mov r1, #0x16
	b _0220588A
_02205888:
	mov r1, #0x15
_0220588A:
	add r0, #0xfc
	ldr r0, [r0]
	bl ov01_021FC5A4
	add r4, #0xc
	add r1, r4, #0
	bl sub_02026E18
	pop {r3, r4, r5, pc}
	thumb_func_end ov01_02205870

	thumb_func_start ov01_0220589C
ov01_0220589C: ; 0x0220589C
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	mov r0, #0xb
	mov r1, #0x28
	add r5, r2, #0
	bl AllocFromHeapAtEnd
	mov r1, #0
	mov r2, #4
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r6, #0
	mov r1, #2
	bl MapObject_GetParam
	lsl r0, r0, #0xf
	lsr r0, r0, #0x10
	bl ov01_02206088
	add r7, r0, #0
	add r0, r6, #0
	bl sub_0205F35C
	bl FldObjSys_GetMModelNarc
	add r1, r7, #0
	mov r2, #0xb
	bl NARC_AllocAndReadWholeMember
	str r0, [r4]
	bl NNS_G3dGetTex
	add r6, r0, #0
	mov r1, #0
	bl sub_02020888
	add r7, r0, #0
	add r0, r6, #0
	mov r1, #0
	bl sub_02020838
	add r1, r4, #0
	str r0, [r4, #4]
	add r0, r7, #0
	add r1, #8
	mov r2, #0x20
	bl MIi_CpuCopy16
	add r0, r4, #0
	add r0, #8
	mov r1, #0x10
	bl sub_02003F04
	mov r0, #0
	mov r1, #0x10
	str r0, [sp]
	add r0, r4, #0
	add r2, r1, #0
	add r0, #8
	add r2, #0xf0
	mov r3, #0xb4
	bl TintPalette_CustomTone
	add r0, r5, #0
	bl sub_02023FB0
	add r1, r0, #0
	lsl r1, r1, #0x10
	add r2, r4, #0
	mov r0, #1
	lsr r1, r1, #0xd
	add r2, #8
	mov r3, #0x20
	bl GF_CreateNewVramTransferTask
	add r0, r5, #0
	bl sub_02023FA0
	add r6, r0, #0
	add r0, r5, #0
	bl sub_02023FA0
	add r1, r0, #0
	ldr r3, _02205964 ; =0x7FFF0000
	lsl r1, r1, #0x10
	and r3, r6
	lsr r3, r3, #0x10
	ldr r2, [r4, #4]
	mov r0, #0
	lsr r1, r1, #0xd
	lsl r3, r3, #4
	bl GF_CreateNewVramTransferTask
	ldr r0, _02205968 ; =ov01_0220596C
	add r1, r4, #0
	mov r2, #0
	bl sub_0200E374
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02205964: .word 0x7FFF0000
_02205968: .word ov01_0220596C
	thumb_func_end ov01_0220589C

	thumb_func_start ov01_0220596C
ov01_0220596C: ; 0x0220596C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl GF_GetNumPendingVramTransferTasks
	cmp r0, #0
	bne _0220598C
	add r0, r5, #0
	bl sub_0200E390
	ldr r0, [r4]
	bl FreeToHeap
	add r0, r4, #0
	bl FreeToHeap
_0220598C:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_0220596C

	thumb_func_start ov01_02205990
ov01_02205990: ; 0x02205990
	str r0, [r3, #4]
	str r1, [r3, #8]
	str r2, [r3, #0xc]
	ldr r0, [r3, #0x1c]
	cmp r0, #3
	bne _022059A2
	mov r0, #2
	str r0, [r3, #0x1c]
	bx lr
_022059A2:
	cmp r0, #0
	bne _022059AA
	mov r0, #1
	str r0, [r3, #0x1c]
_022059AA:
	bx lr
	thumb_func_end ov01_02205990

	thumb_func_start ov01_022059AC
ov01_022059AC: ; 0x022059AC
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	add r0, #0xf9
	ldrb r0, [r0]
	cmp r0, #0
	beq _02205A2A
	add r0, r5, #0
	add r0, #0xfa
	ldrb r0, [r0]
	cmp r0, #0
	bne _02205A02
	ldr r0, [r5, #0x40]
	bl GetPlayerXCoord
	add r4, r0, #0
	ldr r0, [r5, #0x40]
	bl GetPlayerYCoord
	add r6, r0, #0
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetFacingDirection
	add r3, r0, #0
	ldr r0, [r5, #0x20]
	add r1, r4, #0
	ldr r0, [r0]
	add r2, r6, #0
	str r0, [sp]
	ldr r0, [r5, #0x3c]
	bl sub_020699F8
	add r1, r5, #0
	add r1, #0xfa
	add r0, r5, #0
	add r0, #0xe4
	ldrb r1, [r1]
	ldr r0, [r0]
	cmp r1, #1
	bne _02205A2A
	bl ov01_021F9048
	b _02205A2A
_02205A02:
	add r0, r5, #0
	add r0, #0xe4
	ldr r0, [r0]
	bl FollowPokeObj_GetSpecies
	ldr r1, [r5, #0x20]
	ldr r1, [r1]
	bl GetFollowPokePermissionBySpeciesAndMap
	cmp r0, #0
	bne _02205A2A
	add r0, r5, #0
	add r0, #0xe4
	ldr r0, [r0]
	bl MapObject_Remove
	add r0, r5, #0
	mov r1, #0
	add r0, #0xfa
	strb r1, [r0]
_02205A2A:
	mov r0, #0
	add r5, #0xf9
	strb r0, [r5]
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov01_022059AC

	thumb_func_start ov01_02205A34
ov01_02205A34: ; 0x02205A34
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r0, #0
	add r5, r1, #0
	bl FollowingPokemon_IsActive
	cmp r0, #0
	beq _02205A5C
	add r0, r4, #0
	bl FollowingPokemon_GetMapObject
	add r4, r0, #0
	add r1, sp, #0
	bl MapObject_GetPositionVec
	add r0, r4, #0
	add r1, sp, #0
	str r5, [sp, #4]
	bl MapObject_SetPositionVec
_02205A5C:
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov01_02205A34

	thumb_func_start ov01_02205A60
ov01_02205A60: ; 0x02205A60
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl TaskManager_GetSys
	add r5, r0, #0
	add r0, r4, #0
	bl TaskManager_GetStatePtr
	add r4, r0, #0
	add r0, r5, #0
	bl FollowingPokemon_IsActive
	cmp r0, #0
	bne _02205A80
	mov r0, #1
	pop {r3, r4, r5, pc}
_02205A80:
	ldr r0, [r4]
	add r5, #0xe4
	ldr r5, [r5]
	cmp r0, #0
	beq _02205A94
	cmp r0, #1
	beq _02205AB0
	cmp r0, #2
	beq _02205ACE
	b _02205AE6
_02205A94:
	add r0, r5, #0
	bl sub_0205F714
	cmp r0, #0
	beq _02205AAA
	add r0, r5, #0
	bl MapObject_UnpauseMovement
	mov r0, #1
	str r0, [r4]
	b _02205AE6
_02205AAA:
	mov r0, #2
	str r0, [r4]
	b _02205AE6
_02205AB0:
	add r0, r5, #0
	bl MapObject_IsMovementPaused
	cmp r0, #0
	beq _02205AE6
	add r0, r5, #0
	bl MapObject_AreBitsSetForMovementScriptInit
	cmp r0, #0
	beq _02205AE6
	add r0, r5, #0
	bl MapObject_PauseMovement
	mov r0, #1
	pop {r3, r4, r5, pc}
_02205ACE:
	add r0, r5, #0
	bl MapObject_IsMovementPaused
	cmp r0, #0
	beq _02205AE6
	add r0, r5, #0
	bl MapObject_AreBitsSetForMovementScriptInit
	cmp r0, #0
	beq _02205AE6
	mov r0, #1
	pop {r3, r4, r5, pc}
_02205AE6:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_02205A60

	thumb_func_start ov01_02205AEC
ov01_02205AEC: ; 0x02205AEC
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xb
	mov r1, #0x48
	bl AllocFromHeapAtEnd
	add r2, r0, #0
	mov r0, #0
	strb r0, [r2]
	strb r0, [r2, #1]
	strb r0, [r2, #2]
	strb r0, [r2, #3]
	ldr r0, [r4, #0x10]
	ldr r1, _02205B10 ; =ov01_02205B14
	bl TaskManager_Call
	pop {r4, pc}
	nop
_02205B10: .word ov01_02205B14
	thumb_func_end ov01_02205AEC

	thumb_func_start ov01_02205B14
ov01_02205B14: ; 0x02205B14
	push {r4, r5, r6, lr}
	sub sp, #0x30
	add r4, r0, #0
	bl TaskManager_GetSys
	add r5, r0, #0
	add r0, r4, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldrb r1, [r4]
	cmp r1, #7
	bhi _02205BD2
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02205B3A: ; jump table
	.short _02205B4A - _02205B3A - 2 ; case 0
	.short _02205B86 - _02205B3A - 2 ; case 1
	.short _02205BA0 - _02205B3A - 2 ; case 2
	.short _02205BDC - _02205B3A - 2 ; case 3
	.short _02205BFC - _02205B3A - 2 ; case 4
	.short _02205C7E - _02205B3A - 2 ; case 5
	.short _02205C92 - _02205B3A - 2 ; case 6
	.short _02205CD0 - _02205B3A - 2 ; case 7
_02205B4A:
	add r0, r5, #0
	bl FollowingPokemon_IsActive
	cmp r0, #0
	bne _02205B60
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x30
	mov r0, #1
	pop {r4, r5, r6, pc}
_02205B60:
	add r0, r5, #0
	bl ov01_022057C4
	cmp r0, #0
	beq _02205B76
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x30
	mov r0, #1
	pop {r4, r5, r6, pc}
_02205B76:
	add r0, r5, #0
	bl FollowingPokemon_GetMapObject
	bl MapObject_UnpauseMovement
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
_02205B86:
	add r0, r5, #0
	bl FollowingPokemon_GetMapObject
	bl MapObject_IsMovementPaused
	cmp r0, #0
	beq _02205BD2
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_02205CF0
	strb r0, [r4]
	b _02205CDA
_02205BA0:
	ldr r0, _02205CE0 ; =ov01_022096E0
	ldr r1, [r0, #8]
	ldr r0, [r0, #0xc]
	str r1, [sp, #0x10]
	str r0, [sp, #0x14]
	add r0, r5, #0
	bl FollowingPokemon_GetMapObject
	add r5, r0, #0
	bl MapObject_IsMovementPaused
	cmp r0, #0
	beq _02205BD2
	ldrb r1, [r4, #3]
	add r0, r1, #1
	lsl r2, r1, #2
	add r1, sp, #0x10
	strb r0, [r4, #3]
	ldr r1, [r1, r2]
	add r0, r5, #0
	bl MapObject_SetHeldMovement
	ldrb r0, [r4, #3]
	cmp r0, #2
	bhs _02205BD4
_02205BD2:
	b _02205CDA
_02205BD4:
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _02205CDA
_02205BDC:
	add r0, r5, #0
	bl FollowingPokemon_GetMapObject
	add r5, r0, #0
	bl MapObject_IsMovementPaused
	cmp r0, #0
	beq _02205CDA
	add r0, r5, #0
	mov r1, #0
	bl MapObject_SetHeldMovement
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _02205CDA
_02205BFC:
	ldr r3, _02205CE4 ; =ov01_022096F0
	add r2, sp, #8
	mov r1, #8
_02205C02:
	ldrb r0, [r3]
	add r3, r3, #1
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _02205C02
	ldr r3, _02205CE8 ; =ov01_022096E0
	add r2, sp, #0
	mov r1, #8
_02205C14:
	ldrb r0, [r3]
	add r3, r3, #1
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _02205C14
	add r0, r5, #0
	bl FollowingPokemon_GetMapObject
	add r6, r0, #0
	mov r5, #2
	ldr r0, [r4, #0x44]
	lsl r5, r5, #0xc
	cmp r0, #0
	bne _02205C38
	mov r0, #0
	mvn r0, r0
	mul r5, r0
_02205C38:
	add r0, r6, #0
	add r1, sp, #0x24
	bl MapObject_GetPositionVec
	ldrb r2, [r4, #1]
	add r1, sp, #8
	ldr r0, [sp, #0x2c]
	ldrsb r1, [r1, r2]
	ldr r2, [sp, #0x28]
	lsl r1, r1, #0xc
	sub r0, r0, r1
	str r0, [sp, #0x2c]
	ldr r0, [sp, #0x24]
	add r0, r0, r5
	str r0, [sp, #0x24]
	ldrb r1, [r4, #1]
	add r0, sp, #0
	ldrsb r0, [r0, r1]
	add r1, sp, #0x24
	lsl r0, r0, #0xc
	add r0, r2, r0
	str r0, [sp, #0x28]
	add r0, r6, #0
	bl MapObject_SetPositionVec
	ldrb r0, [r4, #1]
	add r0, r0, #1
	strb r0, [r4, #1]
	ldrb r0, [r4, #1]
	cmp r0, #8
	blo _02205CDA
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _02205CDA
_02205C7E:
	add r0, r5, #0
	bl FollowingPokemon_GetMapObject
	mov r1, #3
	bl ov01_0220329C
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _02205CDA
_02205C92:
	ldrb r0, [r4, #2]
	add r0, r0, #1
	strb r0, [r4, #2]
	ldrb r0, [r4, #2]
	cmp r0, #0x14
	blo _02205CDA
	add r0, r5, #0
	mov r1, #0
	bl ov01_02205790
	ldr r3, _02205CEC ; =ov01_02209704
	add r2, sp, #0x18
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r0, [r5, #0x3c]
	bl ov01_021F771C
	add r1, sp, #0x18
	bl sub_02023E78
	add r5, #0xe4
	ldr r0, [r5]
	mov r1, #1
	bl sub_02069E84
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _02205CDA
_02205CD0:
	bl FreeToHeap
	add sp, #0x30
	mov r0, #1
	pop {r4, r5, r6, pc}
_02205CDA:
	mov r0, #0
	add sp, #0x30
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02205CE0: .word ov01_022096E0
_02205CE4: .word ov01_022096F0
_02205CE8: .word ov01_022096E0
_02205CEC: .word ov01_02209704
	thumb_func_end ov01_02205B14

	thumb_func_start ov01_02205CF0
ov01_02205CF0: ; 0x02205CF0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x40]
	add r4, r1, #0
	bl PlayerAvatar_GetMapObject
	bl MapObject_GetCurrentX
	str r0, [sp]
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetMapObject
	bl MapObject_GetCurrentY
	add r7, r0, #0
	add r0, r5, #0
	bl FollowingPokemon_GetMapObject
	bl MapObject_GetCurrentX
	add r6, r0, #0
	add r0, r5, #0
	bl FollowingPokemon_GetMapObject
	bl MapObject_GetCurrentY
	ldr r1, [sp]
	cmp r6, r1
	bne _02205D38
	add r1, r7, #1
	cmp r0, r1
	bne _02205D38
	mov r0, #1
	str r0, [r4, #0x44]
	mov r0, #2
	pop {r3, r4, r5, r6, r7, pc}
_02205D38:
	ldr r1, [sp]
	add r1, r1, #1
	cmp r6, r1
	bne _02205D4C
	cmp r0, r7
	bne _02205D4C
	mov r0, #0
	str r0, [r4, #0x44]
	mov r0, #3
	pop {r3, r4, r5, r6, r7, pc}
_02205D4C:
	ldr r1, [sp]
	add r2, r6, #1
	cmp r2, r1
	bne _02205D60
	cmp r0, r7
	bne _02205D60
	mov r0, #1
	str r0, [r4, #0x44]
	mov r0, #3
	pop {r3, r4, r5, r6, r7, pc}
_02205D60:
	bl GF_AssertFail
	mov r0, #2
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov01_02205CF0

	thumb_func_start ov01_02205D68
ov01_02205D68: ; 0x02205D68
	push {r4, lr}
	add r4, r0, #0
	bl FollowingPokemon_IsActive
	cmp r0, #0
	bne _02205D78
	mov r0, #0
	pop {r4, pc}
_02205D78:
	add r0, r4, #0
	bl ov01_022057C4
	cmp r0, #0
	beq _02205D94
	add r0, r4, #0
	bl sub_0206A054
	add r0, r4, #0
	mov r1, #0
	bl ov01_02205790
	mov r0, #0
	pop {r4, pc}
_02205D94:
	mov r0, #0xb
	mov r1, #0x44
	bl AllocFromHeapAtEnd
	add r2, r0, #0
	mov r0, #0
	str r0, [r2]
	ldr r0, [r4, #0x10]
	ldr r1, _02205DB0 ; =ov01_02205DB4
	bl TaskManager_Call
	mov r0, #1
	pop {r4, pc}
	nop
_02205DB0: .word ov01_02205DB4
	thumb_func_end ov01_02205D68

	thumb_func_start ov01_02205DB4
ov01_02205DB4: ; 0x02205DB4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r4, r0, #0
	bl TaskManager_GetSys
	add r5, r0, #0
	add r0, r4, #0
	bl TaskManager_GetEnv
	add r6, r0, #0
	add r0, r4, #0
	bl TaskManager_GetStatePtr
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #4
	bhi _02205ED2
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02205DE2: ; jump table
	.short _02205DEC - _02205DE2 - 2 ; case 0
	.short _02205DFC - _02205DE2 - 2 ; case 1
	.short _02205E12 - _02205DE2 - 2 ; case 2
	.short _02205E5A - _02205DE2 - 2 ; case 3
	.short _02205EC6 - _02205DE2 - 2 ; case 4
_02205DEC:
	add r0, r5, #0
	bl FollowingPokemon_GetMapObject
	bl MapObject_UnpauseMovement
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
_02205DFC:
	add r0, r5, #0
	bl FollowingPokemon_GetMapObject
	bl MapObject_IsMovementPaused
	cmp r0, #0
	beq _02205ED2
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02205ED2
_02205E12:
	add r0, r5, #0
	bl FollowingPokemon_GetMapObject
	str r0, [sp]
	bl MapObject_GetGfxID
	bl ov01_02206088
	add r7, r0, #0
	ldr r0, [r5, #0x3c]
	bl FldObjSys_GetMModelNarc
	add r1, r7, #0
	mov r2, #0xb
	bl NARC_AllocAndReadWholeMember
	add r5, r0, #0
	bl NNS_G3dGetTex
	ldr r1, [r0, #0x38]
	mov r2, #0x40
	add r0, r0, r1
	add r1, r6, #4
	bl MIi_CpuCopy16
	add r0, r5, #0
	bl FreeToHeap
	ldr r0, [sp]
	mov r1, #1
	bl ov01_0220329C
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02205ED2
_02205E5A:
	ldr r0, [r6]
	add r0, r0, #1
	str r0, [r6]
	cmp r0, #0x14
	blt _02205ED2
	add r0, r5, #0
	mov r1, #0
	bl ov01_02205790
	ldr r3, _02205ED8 ; =ov01_022096F8
	add r2, sp, #8
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r0, [r5, #0x3c]
	bl ov01_021F771C
	add r7, r0, #0
	add r1, sp, #8
	bl sub_02023E78
	add r0, r7, #0
	bl sub_02023FB0
	str r0, [sp, #4]
	add r0, r7, #0
	bl sub_02023FB0
	add r1, r0, #0
	add r2, r6, #4
	lsl r1, r1, #0x10
	ldr r6, _02205EDC ; =0xFFFF0000
	ldr r3, [sp, #4]
	mov r0, #1
	and r3, r6
	lsr r3, r3, #0x10
	lsr r1, r1, #0xd
	lsl r3, r3, #3
	bl GF_CreateNewVramTransferTask
	add r0, r5, #0
	bl sub_0206A054
	add r0, r5, #0
	bl FollowingPokemon_GetMapObject
	mov r1, #0
	bl sub_02069E28
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02205ED2
_02205EC6:
	add r0, r6, #0
	bl FreeToHeap
	add sp, #0x14
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_02205ED2:
	mov r0, #0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02205ED8: .word ov01_022096F8
_02205EDC: .word 0xFFFF0000
	thumb_func_end ov01_02205DB4

	thumb_func_start ov01_02205EE0
ov01_02205EE0: ; 0x02205EE0
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xb
	mov r1, #4
	bl AllocFromHeapAtEnd
	add r2, r0, #0
	mov r0, #0
	str r0, [r2]
	ldr r1, _02205EFC ; =ov01_02205F00
	add r0, r4, #0
	bl TaskManager_Call
	pop {r4, pc}
	.balign 4, 0
_02205EFC: .word ov01_02205F00
	thumb_func_end ov01_02205EE0

	thumb_func_start ov01_02205F00
ov01_02205F00: ; 0x02205F00
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl TaskManager_GetSys
	add r4, r0, #0
	add r0, r5, #0
	bl TaskManager_GetEnv
	add r6, r0, #0
	add r0, r5, #0
	bl TaskManager_GetStatePtr
	add r5, r0, #0
	ldr r0, [r5]
	cmp r0, #6
	bls _02205F22
	b _02206024
_02205F22:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02205F2E: ; jump table
	.short _02205F3C - _02205F2E - 2 ; case 0
	.short _02205F56 - _02205F2E - 2 ; case 1
	.short _02205F7A - _02205F2E - 2 ; case 2
	.short _02205FA4 - _02205F2E - 2 ; case 3
	.short _02205FB6 - _02205F2E - 2 ; case 4
	.short _02205FF2 - _02205F2E - 2 ; case 5
	.short _0220601A - _02205F2E - 2 ; case 6
_02205F3C:
	add r0, r4, #0
	add r0, #0xe4
	ldr r0, [r0]
	bl sub_020659CC
	add r4, #0xe4
	ldr r0, [r4]
	bl sub_0205F484
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02206024
_02205F56:
	add r0, r4, #0
	add r0, #0xe4
	ldr r0, [r0]
	bl MapObject_AreBitsSetForMovementScriptInit
	cmp r0, #1
	bne _02206024
	ldr r0, [r4, #0x40]
	bl PlayerAvatar_GetMapObject
	add r4, #0xe4
	ldr r1, [r4]
	bl ov01_02206028
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02206024
_02205F7A:
	add r0, r4, #0
	add r0, #0xe4
	ldr r0, [r0]
	bl MapObject_AreBitsSetForMovementScriptInit
	cmp r0, #1
	bne _02206024
	ldr r0, [r4, #0x40]
	bl PlayerAvatar_GetMapObject
	bl MapObject_GetFacingDirection
	add r4, #0xe4
	add r1, r0, #0
	ldr r0, [r4]
	bl MapObject_SetFacingDirection
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02206024
_02205FA4:
	ldr r0, [r6]
	add r0, r0, #1
	str r0, [r6]
	cmp r0, #0xa
	ble _02206024
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02206024
_02205FB6:
	add r0, r4, #0
	add r0, #0xe4
	ldr r0, [r0]
	bl MapObject_AreBitsSetForMovementScriptInit
	cmp r0, #1
	bne _02206024
	add r0, r4, #0
	add r0, #0xe4
	ldr r0, [r0]
	mov r1, #0
	bl sub_0206A040
	ldr r0, [r4, #0x40]
	bl PlayerAvatar_GetMapObject
	bl MapObject_GetFacingDirection
	mov r1, #0x34
	bl sub_0206234C
	add r4, #0xe4
	add r1, r0, #0
	ldr r0, [r4]
	bl MapObject_SetHeldMovement
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02206024
_02205FF2:
	add r0, r4, #0
	add r0, #0xe4
	ldr r0, [r0]
	bl MapObject_AreBitsSetForMovementScriptInit
	cmp r0, #1
	bne _02206024
	add r0, r4, #0
	add r0, #0xe4
	ldr r0, [r0]
	mov r1, #2
	bl ov01_0220329C
	add r0, r4, #0
	bl sub_0206A054
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02206024
_0220601A:
	add r0, r6, #0
	bl FreeToHeap
	mov r0, #1
	pop {r4, r5, r6, pc}
_02206024:
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov01_02205F00

	thumb_func_start ov01_02206028
ov01_02206028: ; 0x02206028
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	add r5, r1, #0
	bl MapObject_GetCurrentX
	add r6, r0, #0
	ldr r0, [sp]
	bl MapObject_GetCurrentY
	add r7, r0, #0
	add r0, r5, #0
	bl MapObject_GetCurrentX
	add r4, r0, #0
	add r0, r5, #0
	bl MapObject_GetCurrentY
	sub r6, r6, r4
	sub r4, r7, r0
	ldr r0, [sp]
	bl MapObject_GetFacingDirection
	cmp r6, #0
	bge _02206062
	add r0, r5, #0
	mov r1, #0xa
	bl MapObject_SetHeldMovement
	pop {r3, r4, r5, r6, r7, pc}
_02206062:
	ble _0220606E
	add r0, r5, #0
	mov r1, #0xb
	bl MapObject_SetHeldMovement
	pop {r3, r4, r5, r6, r7, pc}
_0220606E:
	cmp r4, #0
	bge _0220607C
	add r0, r5, #0
	mov r1, #8
	bl MapObject_SetHeldMovement
	pop {r3, r4, r5, r6, r7, pc}
_0220607C:
	ble _02206086
	add r0, r5, #0
	mov r1, #9
	bl MapObject_SetHeldMovement
_02206086:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov01_02206028

	thumb_func_start ov01_02206088
ov01_02206088: ; 0x02206088
	push {r3, lr}
	bl GetMoveModelNoBySpriteId
	cmp r0, #0
	bge _02206098
	bl GF_AssertFail
	mov r0, #0
_02206098:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov01_02206088

	thumb_func_start ov01_0220609C
ov01_0220609C: ; 0x0220609C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl FollowingPokemon_IsActive
	cmp r0, #0
	beq _022060B4
	add r5, #0xe4
	ldr r0, [r5]
	add r1, r4, #0
	bl MapObject_SetFacingDirection
_022060B4:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_0220609C

	thumb_func_start ov01_022060B8
ov01_022060B8: ; 0x022060B8
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r5, r1, #0
	add r7, r2, #0
	bl FollowingPokemon_IsActive
	cmp r0, #0
	bne _022060CC
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_022060CC:
	add r0, r6, #0
	bl ov01_022057C4
	cmp r0, #0
	beq _022060DA
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_022060DA:
	cmp r5, #0
	bne _022060E2
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_022060E2:
	mov r0, #0xb
	mov r1, #0x84
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x84
	bl MI_CpuFill8
	strb r5, [r4, #1]
	strb r7, [r4, #3]
	ldr r0, [r6, #0x10]
	ldr r1, _02206108 ; =ov01_0220610C
	add r2, r4, #0
	bl TaskManager_Call
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02206108: .word ov01_0220610C
	thumb_func_end ov01_022060B8

	thumb_func_start ov01_0220610C
ov01_0220610C: ; 0x0220610C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl TaskManager_GetSys
	add r6, r0, #0
	add r0, r5, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	add r0, r5, #0
	bl TaskManager_GetStatePtr
	add r5, r0, #0
	ldr r0, [r5]
	cmp r0, #3
	bls _0220612E
	b _0220625A
_0220612E:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0220613A: ; jump table
	.short _02206142 - _0220613A - 2 ; case 0
	.short _02206180 - _0220613A - 2 ; case 1
	.short _022061EA - _0220613A - 2 ; case 2
	.short _02206250 - _0220613A - 2 ; case 3
_02206142:
	add r0, r6, #0
	bl FollowingPokemon_GetMapObject
	bl MapObject_GetGfxID
	bl ov01_02206088
	add r7, r0, #0
	ldr r0, [r6, #0x3c]
	bl FldObjSys_GetMModelNarc
	add r1, r7, #0
	mov r2, #0xb
	bl NARC_AllocAndReadWholeMember
	add r6, r0, #0
	bl NNS_G3dGetTex
	ldr r1, [r0, #0x38]
	mov r2, #0x40
	add r0, r0, r1
	add r1, r4, #4
	bl MIi_CpuCopy16
	add r0, r6, #0
	bl FreeToHeap
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0220625A
_02206180:
	ldrb r0, [r4, #2]
	cmp r0, #0
	beq _0220618C
	sub r0, r0, #1
	strb r0, [r4, #2]
	b _0220625A
_0220618C:
	mov r0, #0
	ldrsb r2, [r4, r0]
	ldrb r1, [r4, #1]
	add r1, r2, r1
	strb r1, [r4]
	ldrsb r0, [r4, r0]
	cmp r0, #0x10
	blt _022061A6
	mov r0, #0x10
	strb r0, [r4]
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
_022061A6:
	ldr r0, _02206260 ; =0x0000FFFF
	add r1, r4, #0
	str r0, [sp]
	ldrb r3, [r4]
	add r0, r4, #4
	add r1, #0x44
	mov r2, #0x20
	bl sub_02003DE8
	ldr r0, [r6, #0x3c]
	bl ov01_021F771C
	add r6, r0, #0
	bl sub_02023FB0
	add r5, r0, #0
	add r0, r6, #0
	bl sub_02023FB0
	add r1, r0, #0
	ldr r3, _02206264 ; =0xFFFF0000
	lsl r1, r1, #0x10
	and r3, r5
	add r2, r4, #0
	lsr r3, r3, #0x10
	mov r0, #1
	lsr r1, r1, #0xd
	add r2, #0x44
	lsl r3, r3, #3
	bl GF_CreateNewVramTransferTask
	ldrb r0, [r4, #3]
	strb r0, [r4, #2]
	b _0220625A
_022061EA:
	ldrb r0, [r4, #2]
	cmp r0, #0
	beq _022061F6
	sub r0, r0, #1
	strb r0, [r4, #2]
	b _0220625A
_022061F6:
	mov r0, #0
	ldrsb r2, [r4, r0]
	ldrb r1, [r4, #1]
	sub r1, r2, r1
	strb r1, [r4]
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bgt _0220620C
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
_0220620C:
	ldr r0, _02206260 ; =0x0000FFFF
	add r1, r4, #0
	str r0, [sp]
	ldrb r3, [r4]
	add r0, r4, #4
	add r1, #0x44
	mov r2, #0x20
	bl sub_02003DE8
	ldr r0, [r6, #0x3c]
	bl ov01_021F771C
	add r6, r0, #0
	bl sub_02023FB0
	add r5, r0, #0
	add r0, r6, #0
	bl sub_02023FB0
	add r1, r0, #0
	ldr r3, _02206264 ; =0xFFFF0000
	lsl r1, r1, #0x10
	and r3, r5
	add r2, r4, #0
	lsr r3, r3, #0x10
	mov r0, #1
	lsr r1, r1, #0xd
	add r2, #0x44
	lsl r3, r3, #3
	bl GF_CreateNewVramTransferTask
	ldrb r0, [r4, #3]
	strb r0, [r4, #2]
	b _0220625A
_02206250:
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0220625A:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02206260: .word 0x0000FFFF
_02206264: .word 0xFFFF0000
	thumb_func_end ov01_0220610C

	thumb_func_start ov01_02206268
ov01_02206268: ; 0x02206268
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl sub_02069FB0
	cmp r0, #0
	bne _02206278
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02206278:
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetMapObject
	add r5, #0xe4
	add r4, r0, #0
	ldr r7, [r5]
	bl MapObject_GetCurrentX
	add r5, r0, #0
	add r0, r4, #0
	bl MapObject_GetCurrentY
	add r4, r0, #0
	add r0, r7, #0
	bl MapObject_GetCurrentX
	add r6, r0, #0
	add r0, r7, #0
	bl MapObject_GetCurrentY
	cmp r5, r6
	bne _022062B4
	add r1, r4, #1
	cmp r1, r0
	beq _022062B0
	sub r1, r4, #1
	cmp r1, r0
	bne _022062C8
_022062B0:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_022062B4:
	cmp r4, r0
	bne _022062C8
	add r0, r5, #1
	cmp r0, r6
	beq _022062C4
	sub r0, r5, #1
	cmp r0, r6
	bne _022062C8
_022062C4:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_022062C8:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov01_02206268

	thumb_func_start ov01_022062CC
ov01_022062CC: ; 0x022062CC
	push {r3, lr}
	ldr r0, [r0, #0xc]
	bl SavArray_PlayerParty_get
	bl GetIdxOfFirstAliveMonInParty_CrashIfNone
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov01_022062CC

	.rodata

ov01_022094B0: ; 0x022094B0
	.word 0x1000, 0x1000, 0x1000

ov01_022094BC: ; 0x022094BC
	.word 0x1000, 0x1000, 0x1000

ov01_022094C8: ; 0x022094C8
	.word 0x00000054
	.word ov01_02203820
	.word ov01_022033E0
	.word ov01_02203890
	.word ov01_022037E8

ov01_022094DC: ; 0x022094DC
	.word 0x00000054
	.word ov01_0220335C
	.word ov01_022033E0
	.word ov01_022033E4
	.word ov01_022034B8

ov01_022094F0: ; 0x022094F0
	.word 0x00000054
	.word ov01_022035DC
	.word ov01_022033E0
	.word ov01_02203654
	.word ov01_022037E8

ov01_02209504: ; 0x02209504
	.word 0x00000054
	.word ov01_0220335C
	.word ov01_022033E0
	.word ov01_022034F8
	.word ov01_022035A4

ov01_02209518: ; 0x02209518
	.word 0x00000068
	.word ov01_02203BB4
	.word ov01_02203CA0
	.word ov01_02203CB8
	.word ov01_02203DC0

ov01_0220952C: ; 0x0220952C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00

ov01_02209544: ; 0x02209544
	.byte 0x02, 0x00, 0x00, 0x00

ov01_02209548: ; 0x02209548
	.byte 0x96, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x97, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x98, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x99, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x9A, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00
	.byte 0x9B, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x9C, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00
	.byte 0x9D, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x9E, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00
	.byte 0x9F, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0xA0, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00
	.byte 0xA1, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00, 0xA2, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00
	.byte 0xA3, 0x00, 0x00, 0x00

ov01_022095B4: ; 0x022095B4
	.word 0x00000020
	.word ov01_02203F3C
	.word ov01_02203F68
	.word ov01_02203F6C
	.word ov01_02203F98

ov01_022095C8: ; 0x022095C8
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00

ov01_022095EC: ; 0x022095EC
	.byte 0x00, 0x01, 0x02, 0x03
	.byte 0x03, 0x00, 0x00, 0x00

ov01_022095F4: ; 0x022095F4
	.byte 0x04, 0x03, 0x03, 0x02, 0x02, 0x01, 0x01, 0x00, 0x00, 0xFF, 0xFE, 0xFD
	.byte 0xFC, 0xFB, 0xFA, 0xF9

ov01_02209604: ; 0x02209604
#ifdef HEARTGOLD
	.short ITEM_RED_SHARD, ITEM_YELLOW_SHARD, ITEM_HELIX_FOSSIL
#else
	.short ITEM_BLUE_SHARD, ITEM_GREEN_SHARD, ITEM_DOME_FOSSIL
#endif
	.short ITEM_MAX_ETHER
#ifdef HEARTGOLD
	.short ITEM_BLUE_SHARD, ITEM_GREEN_SHARD
#else
	.short ITEM_RED_SHARD, ITEM_YELLOW_SHARD
#endif
	.short ITEM_OLD_AMBER, ITEM_MAX_REVIVE

ov01_02209614: ; 0x02209614
	.short ITEM_MAX_ETHER, ITEM_REVIVE, ITEM_HEART_SCALE, ITEM_RED_SHARD, ITEM_BLUE_SHARD, ITEM_GREEN_SHARD
	.short ITEM_YELLOW_SHARD, ITEM_STAR_PIECE

ov01_02209624: ; 0x02209624
	.short ITEM_MAX_ETHER, ITEM_PEARL, ITEM_BIG_PEARL
#ifdef HEARTGOLD
	.short ITEM_RED_SHARD, ITEM_YELLOW_SHARD, ITEM_CLAW_FOSSIL, ITEM_CLAW_FOSSIL
#else
	.short ITEM_BLUE_SHARD, ITEM_GREEN_SHARD, ITEM_ROOT_FOSSIL, ITEM_ROOT_FOSSIL
#endif
	.short ITEM_RARE_BONE

ov01_02209634: ; 0x02209634
	.byte 0x00, 0x01, 0x00, 0x01, 0x00, 0x01, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00

ov01_02209640: ; 0x02209640
	.byte 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00
	.byte 0x00, 0x01, 0x01, 0x00

ov01_02209654: ; 0x02209654
	.byte 0x00, 0x01, 0xFF, 0x00, 0xFF, 0x01, 0x01, 0x00, 0xFF, 0x01, 0xFF, 0x00
	.byte 0xFF, 0x00, 0x01, 0xFF, 0x01, 0x00, 0x00, 0x01, 0xFF, 0x00, 0xFF, 0x01, 0x01, 0x00, 0xFF, 0x01
	.byte 0xFF, 0x00

ov01_02209672: ; 0x02209672
	.byte 0xFF, 0x00, 0x00, 0x01, 0x01, 0xFF, 0x00, 0x00, 0x01, 0x01, 0xFF, 0x00, 0x00, 0x01
	.byte 0x01, 0xFF, 0x00, 0x00, 0x01, 0x01, 0xFF, 0x00, 0x01, 0x00, 0x01, 0xFF, 0x00, 0x01, 0x00, 0x01
	.byte 0xFF, 0x00, 0x01, 0x00, 0x01, 0xFF, 0x00, 0x01, 0x00, 0x01

ov01_0220969A: ; 0x0220969A
	.byte 0xFF, 0x00, 0x00, 0x01, 0x01, 0x01
	.byte 0xFF, 0x00, 0x00, 0x01, 0x01, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x01, 0x01, 0xFF, 0x00, 0x00, 0x00
	.byte 0x01, 0x01, 0xFF, 0xFF, 0x00, 0x01, 0x00, 0x01, 0x01, 0xFF, 0x00, 0x01, 0x00, 0x00, 0x01, 0xFF
	.byte 0x00, 0x01, 0x01, 0x00, 0x01, 0xFF, 0x00, 0x00, 0x01, 0x00, 0x01, 0xFF

ov01_022096CC: ; 0x022096CC
	.word 0x00000008
	.word ov01_02205300
	.word ov01_02205354
	.word ov01_02205350
	.word ov01_02205364

ov01_022096E0: ; 0x022096E0
	.byte 0x01, 0x02, 0x02, 0x03, 0x03, 0x02, 0x02, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00

ov01_022096F0: ; 0x022096F0
	.byte 0x04, 0x04, 0x04, 0x02, 0x02, 0x02, 0x00, 0x00

ov01_022096F8: ; 0x022096F8
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x10, 0x00, 0x00

ov01_02209704: ; 0x02209704
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00

ov01_02209710: ; 0x02209710
	.byte 0x14, 0x00, 0x00, 0x00, 0x15, 0x00, 0x00, 0x00, 0x16, 0x00, 0x00, 0x00, 0x17, 0x00, 0x00, 0x00

ov01_02209720: ; 0x02209720
	.byte 0x08, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00

ov01_02209730: ; 0x02209730
	.byte 0x0C, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00

ov01_02209740: ; 0x02209740
	.byte 0x10, 0x00, 0x00, 0x00, 0x11, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00, 0x13, 0x00, 0x00, 0x00

ov01_02209750: ; 0x02209750
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0xA0, 0x00, 0x00
	.byte 0x00, 0xC0, 0x00, 0x00, 0x00, 0xA0, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00
	.byte 0x00, 0xA0, 0x00, 0x00, 0x00, 0xA0, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00
	.byte 0x00, 0xC0, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0xA0, 0x00, 0x00
	.byte 0x00, 0xA0, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00

	.data

	.balign 4, 0
ov01_02209B18: ; 0x02209B18
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
