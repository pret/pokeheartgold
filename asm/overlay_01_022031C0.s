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
	.include "overlay_01_022031C0.inc"
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
	bl MapObject_SetVisible
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

	.data

	.balign 4, 0
ov01_02209B18: ; 0x02209B18
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
