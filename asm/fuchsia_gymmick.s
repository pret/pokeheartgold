#include "fielddata/script/scr_seq/event_T27GYM0101.h"
#include "constants/sndseq.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov04_02256650
ov04_02256650: ; 0x02256650
	push {r4, lr}
	add r4, r0, #0
	bl Fsys_GetSaveDataPtr
	bl Sav2_GetGymmickPtr
	mov r1, #7
	bl SavGymmick_AssertMagic_GetData
	ldr r1, _02256698 ; =0x00001DD8
	mov r0, #4
	bl AllocFromHeap
	ldr r1, [r4, #4]
	ldr r2, _02256698 ; =0x00001DD8
	str r0, [r1, #0x24]
	ldr r0, [r4, #4]
	mov r1, #0
	ldr r0, [r0, #0x24]
	bl MI_CpuFill8
	ldr r0, [r4, #4]
	mov r1, #4
	ldr r4, [r0, #0x24]
	add r0, r4, #0
	bl ov04_02256758
	mov r2, #0
	ldr r0, _0225669C ; =0x00001DB6
	sub r1, r2, #1
_0225668C:
	add r2, r2, #1
	strh r1, [r4, r0]
	add r4, #0xc
	cmp r2, #3
	blt _0225668C
	pop {r4, pc}
	.balign 4, 0
_02256698: .word 0x00001DD8
_0225669C: .word 0x00001DB6
	thumb_func_end ov04_02256650

	thumb_func_start ov04_022566A0
ov04_022566A0: ; 0x022566A0
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	ldr r0, [r0, #4]
	ldr r5, [r0, #0x24]
	add r0, r5, #0
	bl ov04_0225686C
	ldr r6, _022566E4 ; =0x00001DB4
	mov r4, #0
	mov r7, #0xc
_022566B4:
	add r0, r4, #0
	mul r0, r7
	add r1, r5, r0
	ldrh r0, [r1, r6]
	cmp r0, #0
	beq _022566C8
	ldr r0, _022566E8 ; =0x00001DBC
	ldr r0, [r1, r0]
	bl DestroySysTask
_022566C8:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #3
	blo _022566B4
	add r0, r5, #0
	bl FreeToHeap
	ldr r0, [sp]
	mov r1, #0
	ldr r0, [r0, #4]
	str r1, [r0, #0x24]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022566E4: .word 0x00001DB4
_022566E8: .word 0x00001DBC
	thumb_func_end ov04_022566A0

	thumb_func_start ov04_022566EC
ov04_022566EC: ; 0x022566EC
	push {r4, r5, r6, lr}
	add r6, r0, #0
	ldr r0, [r6, #4]
	ldr r5, [r0, #0x24]
	add r0, r1, #0
	add r1, r2, #0
	bl ov04_022568F0
	add r4, r0, #0
	bpl _0225670A
	mov r0, #SEQ_SE_DP_WALL_HIT>>8
	lsl r0, r0, #8
	bl PlaySE
	pop {r4, r5, r6, pc}
_0225670A:
	ldr r0, _0225672C ; =0x00001DB4
	add r1, r4, #0
	add r0, r5, r0
	bl ov04_02256920
	cmp r0, #0
	bne _0225672A
	lsl r2, r4, #0x18
	add r0, r5, #0
	add r1, r6, #0
	lsr r2, r2, #0x18
	bl ov04_02256950
	ldr r0, _02256730 ; =SEQ_SE_GS_TOUMEINAKABEHIT
	bl PlaySE
_0225672A:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0225672C: .word 0x00001DB4
_02256730: .word SEQ_SE_GS_TOUMEINAKABEHIT
	thumb_func_end ov04_022566EC

	thumb_func_start ov04_02256734
ov04_02256734: ; 0x02256734
	push {r3, r4, r5, lr}
	add r5, r1, #0
	ldr r4, [r5, #4]
	mov r1, #4
	add r0, r4, #4
	bl ov04_02256A54
	cmp r0, #0
	beq _0225674E
	add r0, r5, #0
	bl ov04_02256B3C
	pop {r3, r4, r5, pc}
_0225674E:
	add r4, #0x54
	add r0, r4, #0
	bl ov01_021FBF68
	pop {r3, r4, r5, pc}
	thumb_func_end ov04_02256734

	thumb_func_start ov04_02256758
ov04_02256758: ; 0x02256758
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	mov r2, #0x20
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	bl GF_ExpHeap_FndInitAllocator
	mov r0, #0
	str r0, [sp, #0x14]
_0225676A:
	ldr r0, [sp, #0x14]
	mov r1, #0x9a
	add r4, r0, #0
	lsl r1, r1, #2
	mul r4, r1
	ldr r0, [sp, #8]
	mov r1, #0
	add r0, r0, r4
	add r0, #0xd4
	str r1, [r0]
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #8]
	lsl r0, r0, #4
	add r1, #0x10
	str r0, [sp, #0x10]
	add r0, r1, r0
	ldr r2, [sp, #0x14]
	ldr r3, [sp, #0xc]
	mov r1, #0xf8
	bl ov01_021FBCD8
	mov r0, #0
	str r0, [sp, #0x1c]
	ldr r0, [sp, #8]
	add r0, #0xd8
	add r0, r0, r4
	str r0, [sp, #0x18]
	ldr r0, [sp, #8]
	str r0, [sp, #0x24]
	add r0, #0x10
	str r0, [sp, #0x24]
_022567A8:
	ldr r1, [sp, #0x1c]
	mov r0, #0xcc
	add r2, r1, #0
	mul r2, r0
	ldr r0, [sp, #0x18]
	mov r1, #0
	add r0, r0, r2
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x18]
	add r5, r1, #0
	str r1, [r0, r2]
	ldr r0, [sp, #0x20]
	add r4, r0, #4
_022567C2:
	ldr r0, [sp, #0xc]
	add r3, r5, #1
	str r0, [sp]
	ldr r0, [sp, #8]
	mov r6, #0xc
	str r0, [sp, #4]
	mov r0, #0x14
	mul r6, r3
	ldr r3, [sp, #0x14]
	mul r0, r5
	ldr r2, [sp, #0x24]
	ldr r1, [sp, #0x10]
	add r0, r4, r0
	add r1, r2, r1
	mov r2, #0xf8
	add r3, r6, r3
	bl ov01_021FBE44
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #4
	blo _022567C2
	ldr r0, [sp, #0x20]
	ldr r2, [sp, #0x24]
	ldr r1, [sp, #0x10]
	add r0, #0x54
	add r1, r2, r1
	bl ov01_021FBF2C
	ldr r0, [sp, #0x20]
	mov r5, #0
	add r7, r0, #0
	add r4, r0, #4
	add r7, #0x54
_02256808:
	mov r0, #0x14
	add r6, r5, #0
	mul r6, r0
	add r0, r7, #0
	add r1, r4, r6
	bl ov01_021FBF50
	add r0, r4, r6
	mov r1, #0
	bl ov01_021FBF20
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #4
	blo _02256808
	mov r1, #0
	add r0, sp, #0x28
	str r1, [r0]
	str r1, [r0, #4]
	str r1, [r0, #8]
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	ldr r3, [sp, #0x30]
	add r0, #0x54
	bl ov01_021FC00C
	ldr r0, [sp, #0x20]
	mov r1, #0
	add r0, #0x54
	str r0, [sp, #0x20]
	bl ov01_021FC004
	ldr r0, [sp, #0x1c]
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x1c]
	cmp r0, #3
	blo _022567A8
	ldr r0, [sp, #0x14]
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x14]
	cmp r0, #0xc
	blo _0225676A
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov04_02256758

	thumb_func_start ov04_0225686C
ov04_0225686C: ; 0x0225686C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r6, r0, #0
	mov r0, #0
	str r0, [sp, #8]
	add r0, r6, #0
	str r0, [sp, #0xc]
	add r0, #0x10
	str r0, [sp, #0xc]
	add r0, r6, #0
	str r0, [sp, #0x10]
	add r0, #0xd8
	str r0, [sp, #0x10]
	mov r7, #0x14
_02256888:
	ldr r0, [sp, #8]
	lsl r1, r0, #4
	ldr r0, [sp, #0xc]
	add r0, r0, r1
	bl ov01_021FBDA8
	mov r0, #0
	str r0, [sp, #4]
	ldr r1, [sp, #8]
	mov r0, #0x9a
	lsl r0, r0, #2
	add r2, r1, #0
	mul r2, r0
	ldr r0, [sp, #0x10]
	add r0, r0, r2
	str r0, [sp]
_022568A8:
	ldr r1, [sp, #4]
	mov r0, #0xcc
	add r2, r1, #0
	mul r2, r0
	ldr r0, [sp]
	mov r5, #0
	add r0, r0, r2
	add r4, r0, #4
_022568B8:
	add r0, r5, #0
	mul r0, r7
	add r0, r4, r0
	add r1, r6, #0
	bl ov01_021FBE80
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #4
	blo _022568B8
	ldr r0, [sp, #4]
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	cmp r0, #3
	blo _022568A8
	ldr r0, [sp, #8]
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	cmp r0, #0xc
	blo _02256888
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov04_0225686C

	thumb_func_start ov04_022568F0
ov04_022568F0: ; 0x022568F0
	push {r3, r4}
	ldr r4, _0225691C ; =ov04_0225766C
	mov r3, #0
_022568F6:
	ldr r2, [r4]
	cmp r0, r2
	bne _02256908
	ldr r2, [r4, #4]
	cmp r1, r2
	bne _02256908
	add r0, r3, #0
	pop {r3, r4}
	bx lr
_02256908:
	add r2, r3, #1
	lsl r2, r2, #0x10
	asr r3, r2, #0x10
	add r4, #0x14
	cmp r3, #0x3c
	blt _022568F6
	mov r0, #0
	mvn r0, r0
	pop {r3, r4}
	bx lr
	.balign 4, 0
_0225691C: .word ov04_0225766C
	thumb_func_end ov04_022568F0

	thumb_func_start ov04_02256920
ov04_02256920: ; 0x02256920
	push {r3, r4, r5, r6}
	mov r2, #0
	mov r3, #2
	mov r4, #0xc
_02256928:
	add r5, r2, #0
	mul r5, r4
	add r6, r0, r5
	ldrh r5, [r0, r5]
	cmp r5, #0
	beq _02256940
	ldrsh r5, [r6, r3]
	cmp r1, r5
	bne _02256940
	mov r0, #1
	pop {r3, r4, r5, r6}
	bx lr
_02256940:
	add r2, r2, #1
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	cmp r2, #3
	blo _02256928
	mov r0, #0
	pop {r3, r4, r5, r6}
	bx lr
	thumb_func_end ov04_02256920

	thumb_func_start ov04_02256950
ov04_02256950: ; 0x02256950
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r6, r0, #0
	add r7, r2, #0
	add r2, r6, #0
	add r2, #0xd0
	str r1, [sp]
	ldr r1, _02256A38 ; =0x00001DB4
	ldr r3, [r2]
	mov r2, #0xc
	add r1, r6, r1
	mul r2, r3
	add r5, r1, r2
	ldrh r1, [r1, r2]
	cmp r1, #0
	beq _02256978
	bl GF_AssertFail
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_02256978:
	add r1, r7, #0
	bl ov04_02256AC4
	mov r0, #1
	strh r0, [r5]
	mov r0, #0x14
	add r4, r7, #0
	mul r4, r0
	ldr r1, _02256A3C ; =ov04_0225766C + 8
	add r0, r6, #0
	ldrh r1, [r1, r4]
	add r0, #0xd4
	strh r7, [r5, #2]
	lsl r1, r1, #0x18
	lsr r2, r1, #0x18
	mov r1, #0x9a
	lsl r1, r1, #2
	mul r1, r2
	add r0, r0, r1
	bl ov04_02256A90
	str r0, [r5, #4]
	ldr r0, _02256A40 ; =ov04_02256734
	add r1, r5, #0
	mov r2, #0
	bl CreateSysTask
	str r0, [r5, #8]
	ldr r0, [r5, #4]
	mov r1, #1
	add r0, #0x54
	bl ov01_021FC004
	add r1, sp, #4
	mov r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	ldr r0, [sp]
	ldr r0, [r0, #0x40]
	bl PlayerAvatar_GetMapObject
	add r1, sp, #4
	bl MapObject_GetPositionVec
	ldr r0, _02256A44 ; =ov04_0225766C
	ldr r2, _02256A48 ; =ov04_0225766C + 11
	ldr r0, [r0, r4]
	ldrsb r2, [r2, r4]
	lsl r1, r0, #4
	ldr r0, _02256A4C ; =ov04_0225766C + 10
	add r1, #8
	ldrsb r0, [r0, r4]
	lsl r2, r2, #4
	lsl r0, r0, #4
	add r0, r1, r0
	lsl r1, r0, #0xc
	ldr r0, _02256A50 ; =ov04_0225766C + 4
	str r1, [sp, #4]
	ldr r0, [r0, r4]
	lsl r0, r0, #4
	add r0, #8
	add r0, r0, r2
	lsl r3, r0, #0xc
	str r3, [sp, #0xc]
	ldr r0, [r5, #4]
	ldr r2, [sp, #8]
	add r0, #0x54
	bl ov01_021FC00C
	mov r4, #0
	mov r7, #0x14
_02256A08:
	ldr r0, [r5, #4]
	add r1, r0, #4
	add r0, r4, #0
	mul r0, r7
	add r0, r1, r0
	mov r1, #0
	bl ov01_021FBF20
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #4
	blo _02256A08
	add r0, r6, #0
	add r0, #0xd0
	ldr r0, [r0]
	mov r1, #3
	add r0, r0, #1
	bl _s32_div_f
	add r6, #0xd0
	str r1, [r6]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02256A38: .word 0x00001DB4
_02256A3C: .word ov04_0225766C + 8
_02256A40: .word ov04_02256734
_02256A44: .word ov04_0225766C
_02256A48: .word ov04_0225766C + 11
_02256A4C: .word ov04_0225766C + 10
_02256A50: .word ov04_0225766C + 4
	thumb_func_end ov04_02256950

	thumb_func_start ov04_02256A54
ov04_02256A54: ; 0x02256A54
	push {r3, r4, r5, r6, r7, lr}
	mov r5, #0
	add r6, r1, #0
	add r7, r0, #0
	add r4, r5, #0
	cmp r6, #0
	bls _02256A84
_02256A62:
	mov r0, #0x14
	mul r0, r4
	mov r1, #1
	add r0, r7, r0
	lsl r1, r1, #0xc
	bl ov01_021FBEE4
	cmp r0, #0
	beq _02256A7A
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
_02256A7A:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, r6
	blo _02256A62
_02256A84:
	cmp r5, r6
	bne _02256A8C
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02256A8C:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov04_02256A54

	thumb_func_start ov04_02256A90
ov04_02256A90: ; 0x02256A90
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r1, [r5]
	mov r0, #0xcc
	mul r0, r1
	add r0, r5, r0
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _02256AA6
	bl GF_AssertFail
_02256AA6:
	ldr r1, [r5]
	mov r0, #0xcc
	add r6, r1, #0
	mul r6, r0
	add r4, r5, #4
	mov r0, #1
	str r0, [r4, r6]
	ldr r0, [r5]
	mov r1, #3
	add r0, r0, #1
	bl _s32_div_f
	str r1, [r5]
	add r0, r4, r6
	pop {r4, r5, r6, pc}
	thumb_func_end ov04_02256A90

	thumb_func_start ov04_02256AC4
ov04_02256AC4: ; 0x02256AC4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r4, r0, #0
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #0x14
	ldr r2, _02256B30 ; =ov04_0225766C
	mul r0, r1
	add r0, r2, r0
	str r0, [sp]
	ldr r0, _02256B34 ; =0x00001DB4
	ldr r5, _02256B34 ; =0x00001DB4
	add r0, r4, r0
	str r0, [sp, #8]
	mov r7, #0xc
_02256AE2:
	ldr r1, [sp]
	ldr r0, [sp, #4]
	add r0, r1, r0
	mov r1, #0xc
	ldrsb r1, [r0, r1]
	cmp r1, #0
	blt _02256B2C
	mov r1, #0xc
	ldrsb r6, [r0, r1]
	mov r2, #0
_02256AF6:
	add r1, r2, #0
	mul r1, r7
	add r0, r4, r1
	ldrh r3, [r0, r5]
	cmp r3, #0
	beq _02256B14
	ldr r3, _02256B38 ; =0x00001DB6
	ldrsh r0, [r0, r3]
	cmp r0, r6
	bne _02256B14
	ldr r0, [sp, #8]
	add r0, r0, r1
	bl ov04_02256B3C
	b _02256B1E
_02256B14:
	add r0, r2, #1
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	cmp r2, #3
	blo _02256AF6
_02256B1E:
	ldr r0, [sp, #4]
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	cmp r0, #6
	blo _02256AE2
_02256B2C:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02256B30: .word ov04_0225766C
_02256B34: .word 0x00001DB4
_02256B38: .word 0x00001DB6
	thumb_func_end ov04_02256AC4

	thumb_func_start ov04_02256B3C
ov04_02256B3C: ; 0x02256B3C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #4]
	mov r1, #0
	add r0, #0x54
	bl ov01_021FC004
	ldr r0, [r4, #4]
	mov r1, #0
	str r1, [r0]
	strh r1, [r4]
	sub r0, r1, #1
	strh r0, [r4, #2]
	str r1, [r4, #4]
	ldr r0, [r4, #8]
	bl DestroySysTask
	mov r0, #0
	str r0, [r4, #8]
	pop {r4, pc}
	thumb_func_end ov04_02256B3C

	.rodata

ov04_0225766C: ; 0x0225766C
	.balign 4, 0
	.word 4, 4
	.short 0
	.byte 0, 0
	.byte 1, 2, -1, -1, -1, -1

	.balign 4, 0
	.word 5, 4
	.short 1
	.byte 0, 0
	.byte 0, 2, 3, -1, -1, -1

	.balign 4, 0
	.word 6, 4
	.short 1
	.byte 0, 0
	.byte 1, 3, -1, -1, -1, -1

	.balign 4, 0
	.word 7, 4
	.short 9
	.byte 0, 0
	.byte 1, 2, 5, -1, -1, -1

	.balign 4, 0
	.word 11, 4
	.short 2
	.byte 0, 0
	.byte 7, -1, -1, -1, -1, -1

	.balign 4, 0
	.word 7, 5
	.short 6
	.byte 0, 0
	.byte 3, 6, 8, -1, -1, -1

	.balign 4, 0
	.word 8, 5
	.short 0
	.byte -1, 0
	.byte 3, 5, 8, -1, -1, -1

	.balign 4, 0
	.word 11, 5
	.short 3
	.byte 0, 0
	.byte 4, 9, -1, -1, -1, -1

	.balign 4, 0
	.word 7, 6
	.short 3
	.byte 0, 0
	.byte 3, 5, 6, 13, 15, -1

	.balign 4, 0
	.word 11, 6
	.short 3
	.byte 0, 0
	.byte 4, 7, 14, 16, -1, -1

	.balign 4, 0
	.word 1, 7
	.short 0
	.byte 0, 0
	.byte 11, 12, -1, -1, -1, -1

	.balign 4, 0
	.word 2, 7
	.short 1
	.byte 0, 0
	.byte 10, 11, -1, -1, -1, -1

	.balign 4, 0
	.word 3, 7
	.short 0
	.byte -1, 0
	.byte 10, 11, -1, -1, -1, -1

	.balign 4, 0
	.word 7, 7
	.short 3
	.byte 0, 0
	.byte 5, 13, 15, 17, -1, -1

	.balign 4, 0
	.word 11, 7
	.short 3
	.byte 0, 0
	.byte 7, 16, -1, -1, -1, -1

	.balign 4, 0
	.word 7, 8
	.short 3
	.byte 0, 0
	.byte 8, 13, 17, 18, -1, -1

	.balign 4, 0
	.word 11, 8
	.short 2
	.byte 0, -1
	.byte 9, 14, -1, -1, -1, -1

	.balign 4, 0
	.word 7, 9
	.short 10
	.byte 0, 0
	.byte 13, 18, 19, -1, -1, -1

	.balign 4, 0
	.word 8, 9
	.short 1
	.byte 0, 0
	.byte 15, 17, 19, 20, -1, -1

	.balign 4, 0
	.word 9, 9
	.short 1
	.byte 0, 0
	.byte 17, 18, 20, 25, -1, -1

	.balign 4, 0
	.word 10, 9
	.short 9
	.byte 0, 0
	.byte 18, 19, 25, 27, -1, -1

	.balign 4, 0
	.word 1, 10
	.short 2
	.byte 0, 0
	.byte 26, -1, -1, -1, -1, -1

	.balign 4, 0
	.word 4, 10
	.short 0
	.byte 0, 0
	.byte 23, 24, -1, -1, -1, -1

	.balign 4, 0
	.word 5, 10
	.short 1
	.byte 0, 0
	.byte 22, 24, -1, -1, -1, -1

	.balign 4, 0
	.word 6, 10
	.short 0
	.byte -1, 0
	.byte 22, 23, -1, -1, -1, -1

	.balign 4, 0
	.word 10, 10
	.short 3
	.byte 0, 0
	.byte 19, 20, 27, 28, -1, -1

	.balign 4, 0
	.word 1, 11
	.short 2
	.byte 0, -1
	.byte 21, -1, -1, -1, -1, -1

	.balign 4, 0
	.word 10, 11
	.short 3
	.byte 0, 0
	.byte 20, 25, 28, 35, -1, -1

	.balign 4, 0
	.word 10, 12
	.short 3
	.byte 0, 0
	.byte 25, 27, 35, 37, 34, -1

	.balign 4, 0
	.word 4, 13
	.short 8
	.byte 0, 0
	.byte 26, 30, 31, -1, -1, -1

	.balign 4, 0
	.word 5, 13
	.short 1
	.byte 0, 0
	.byte 36, 29, 31, 32, 32, -1

	.balign 4, 0
	.word 6, 13
	.short 1
	.byte 0, 0
	.byte 29, 30, 32, 33, -1, -1

	.balign 4, 0
	.word 7, 13
	.short 1
	.byte 0, 0
	.byte 30, 31, 33, 34, -1, -1

	.balign 4, 0
	.word 8, 13
	.short 1
	.byte 0, 0
	.byte 31, 32, 34, 35, -1, -1

	.balign 4, 0
	.word 9, 13
	.short 1
	.byte 0, 0
	.byte 32, 33, 35, 28, 37, -1

	.balign 4, 0
	.word 10, 13
	.short 7
	.byte 0, 0
	.byte 27, 28, 37, 34, -1, -1

	.balign 4, 0
	.word 4, 14
	.short 2
	.byte 0, -1
	.byte 29, 30, -1, -1, -1, -1

	.balign 4, 0
	.word 10, 14
	.short 2
	.byte 0, -1
	.byte 28, 34, 35, 37, -1, -1

	.balign 4, 0
	.word 11, 15
	.short 2
	.byte 0, 0
	.byte 39, 44, -1, -1, -1, -1

	.balign 4, 0
	.word 11, 16
	.short 3
	.byte 0, 0
	.byte 38, 44, 46, -1, -1, -1

	.balign 4, 0
	.word 2, 17
	.short 0
	.byte 0, 0
	.byte 41, 42, -1, -1, -1, -1

	.balign 4, 0
	.word 3, 17
	.short 1
	.byte 0, 0
	.byte 40, 42, 43, 45, -1, -1

	.balign 4, 0
	.word 4, 17
	.short 4
	.byte 0, 0
	.byte 40, 41, 43, 45, -1, -1

	.balign 4, 0
	.word 5, 17
	.short 0
	.byte -1, 0
	.byte 41, 45, -1, -1, -1, -1

	.balign 4, 0
	.word 11, 17
	.short 3
	.byte 0, 0
	.byte 38, 39, 46, 48, -1, -1

	.balign 4, 0
	.word 4, 18
	.short 3
	.byte 0, 0
	.byte 41, 43, 42, 47, 52, -1

	.balign 4, 0
	.word 11, 18
	.short 3
	.byte 0, 0
	.byte 39, 44, 48, 59, -1, -1

	.balign 4, 0
	.word 4, 19
	.short 3
	.byte 0, 0
	.byte 42, 45, 51, 52, 53, -1

	.balign 4, 0
	.word 11, 19
	.short 3
	.byte 0, 0
	.byte 44, 46, 59, 58, -1, -1

	.balign 4, 0
	.word 1, 20
	.short 0
	.byte 0, 0
	.byte 50, 51, -1, -1, -1, -1

	.balign 4, 0
	.word 2, 20
	.short 1
	.byte 0, 0
	.byte 49, 51, 52, -1, -1, -1

	.balign 4, 0
	.word 3, 20
	.short 1
	.byte 0, 0
	.byte 49, 50, 52, 53, 47, -1

	.balign 4, 0
	.word 4, 20
	.short 5
	.byte 0, 0
	.byte 50, 51, 45, 47, 53, 54

	.balign 4, 0
	.word 5, 20
	.short 1
	.byte 0, 0
	.byte 47, 51, 52, 54, 55, -1

	.balign 4, 0
	.word 6, 20
	.short 1
	.byte 0, 0
	.byte 52, 53, 55, 56, -1, -1

	.balign 4, 0
	.word 7, 20
	.short 1
	.byte 0, 0
	.byte 53, 54, 56, 57, -1, -1

	.balign 4, 0
	.word 8, 20
	.short 1
	.byte 0, 0
	.byte 54, 55, 57, 58, 59, -1

	.balign 4, 0
	.word 9, 20
	.short 1
	.byte 0, 0
	.byte 55, 56, 58, 59, -1, -1

	.balign 4, 0
	.word 10, 20
	.short 1
	.byte 0, 0
	.byte 56, 57, 59, 48, -1, -1

	.balign 4, 0
	.word 11, 20
	.short 11
	.byte 0, 0
	.byte 58, 48, 57, 46, -1, -1
