	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start MapMatrix_MapMatrixData_Load
MapMatrix_MapMatrixData_Load: ; 0x0203AEAC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r4, r0, #0
	str r2, [sp]
	mov r2, #0
	strb r2, [r4, #1]
	mov r7, #0x19
	mov r6, #0x96
	ldr r0, _0203AF94 ; =0x0000031F
	mov ip, r1
	strb r2, [r4]
	add r3, r4, #0
	add r5, r2, #0
	lsl r7, r7, #6
	lsl r6, r6, #4
_0203AECA:
	add r1, r4, r2
	strh r5, [r3, #2]
	strb r5, [r1, r7]
	strh r5, [r3, r6]
	add r2, r2, #1
	add r3, r3, #2
	cmp r2, r0
	blt _0203AECA
	ldr r0, _0203AF98 ; =0x00000F9E
	mov r2, #0
_0203AEDE:
	add r1, r4, r5
	add r5, r5, #1
	strb r2, [r1, r0]
	cmp r5, #0x10
	blt _0203AEDE
	mov r0, #0x29
	mov r1, ip
	mov r2, #0xb
	bl AllocAtEndAndReadWholeNarcMemberByIdPair
	add r6, r0, #0
	ldrb r0, [r6]
	add r5, r6, #5
	strb r0, [r4, #1]
	ldrb r0, [r6, #1]
	strb r0, [r4]
	ldrb r0, [r6, #2]
	str r0, [sp, #8]
	ldrb r0, [r6, #3]
	str r0, [sp, #4]
	ldrb r7, [r6, #4]
	cmp r7, #0x10
	bls _0203AF10
	bl GF_AssertFail
_0203AF10:
	ldr r1, _0203AF98 ; =0x00000F9E
	add r0, r5, #0
	add r1, r4, r1
	add r2, r7, #0
	bl MI_CpuCopy8
	ldr r0, [sp, #8]
	add r5, r5, r7
	cmp r0, #0
	beq _0203AF40
	ldrb r3, [r4, #1]
	ldrb r2, [r4]
	add r0, r5, #0
	add r1, r4, #2
	mul r2, r3
	lsl r2, r2, #1
	bl MI_CpuCopy8
	ldrb r1, [r4, #1]
	ldrb r0, [r4]
	mul r0, r1
	lsl r0, r0, #1
	add r5, r5, r0
	b _0203AF54
_0203AF40:
	ldrb r3, [r4, #1]
	ldrb r2, [r4]
	ldr r0, [sp]
	add r1, r4, #2
	lsl r0, r0, #0x10
	mul r2, r3
	lsr r0, r0, #0x10
	lsl r2, r2, #1
	bl MIi_CpuClear16
_0203AF54:
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _0203AF74
	ldrb r3, [r4, #1]
	ldrb r2, [r4]
	mov r1, #0x19
	lsl r1, r1, #6
	add r0, r5, #0
	add r1, r4, r1
	mul r2, r3
	bl MI_CpuCopy8
	ldrb r1, [r4, #1]
	ldrb r0, [r4]
	mul r0, r1
	add r5, r5, r0
_0203AF74:
	ldrb r3, [r4, #1]
	ldrb r2, [r4]
	mov r1, #0x96
	lsl r1, r1, #4
	mul r2, r3
	add r0, r5, #0
	add r1, r4, r1
	lsl r2, r2, #1
	bl MI_CpuCopy8
	add r0, r6, #0
	bl FreeToHeap
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0203AF94: .word 0x0000031F
_0203AF98: .word 0x00000F9E
	thumb_func_end MapMatrix_MapMatrixData_Load

	thumb_func_start MapMatrix_New
MapMatrix_New: ; 0x0203AF9C
	push {r3, lr}
	ldr r1, _0203AFB0 ; =0x00000FB2
	mov r0, #0xb
	bl AllocFromHeap
	mov r1, #0
	strb r1, [r0]
	strb r1, [r0, #1]
	strb r1, [r0, #2]
	pop {r3, pc}
	.balign 4, 0
_0203AFB0: .word 0x00000FB2
	thumb_func_end MapMatrix_New

	thumb_func_start MapMatrix_Load
MapMatrix_Load: ; 0x0203AFB4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl MapHeader_GetMatrixId
	add r6, r0, #0
	add r0, r4, #4
	add r1, r6, #0
	add r2, r5, #0
	bl MapMatrix_MapMatrixData_Load
	strb r6, [r4, #2]
	ldrb r0, [r4, #4]
	strb r0, [r4, #1]
	ldrb r0, [r4, #5]
	strb r0, [r4]
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end MapMatrix_Load

	thumb_func_start MapMatrix_Free
MapMatrix_Free: ; 0x0203AFD8
	ldr r3, _0203AFDC ; =FreeToHeap
	bx r3
	.balign 4, 0
_0203AFDC: .word FreeToHeap
	thumb_func_end MapMatrix_Free

	thumb_func_start sub_0203AFE0
sub_0203AFE0: ; 0x0203AFE0
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldrb r1, [r4]
	ldrb r0, [r4, #1]
	mul r0, r1
	cmp r5, r0
	blt _0203AFF4
	bl GF_AssertFail
_0203AFF4:
	lsl r0, r5, #1
	add r1, r4, r0
	ldr r0, _0203B000 ; =0x00000964
	ldrh r0, [r1, r0]
	pop {r3, r4, r5, pc}
	nop
_0203B000: .word 0x00000964
	thumb_func_end sub_0203AFE0

	thumb_func_start sub_0203B004
sub_0203B004: ; 0x0203B004
	push {r4, lr}
	add r4, r0, #0
	bne _0203B00E
	bl GF_AssertFail
_0203B00E:
	ldrb r0, [r4]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0203B004

	thumb_func_start sub_0203B014
sub_0203B014: ; 0x0203B014
	push {r4, lr}
	add r4, r0, #0
	bne _0203B01E
	bl GF_AssertFail
_0203B01E:
	ldrb r0, [r4, #1]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0203B014

	thumb_func_start sub_0203B024
sub_0203B024: ; 0x0203B024
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	ldrb r0, [r7, #1]
	add r5, r1, #0
	add r4, r2, #0
	ldrb r6, [r7]
	str r0, [sp]
	cmp r5, #0
	blt _0203B03A
	cmp r5, r6
	blt _0203B03E
_0203B03A:
	bl GF_AssertFail
_0203B03E:
	cmp r4, #0
	blt _0203B048
	ldr r0, [sp]
	cmp r4, r0
	blt _0203B04C
_0203B048:
	bl GF_AssertFail
_0203B04C:
	add r0, r4, #0
	mul r0, r6
	add r0, r5, r0
	lsl r0, r0, #1
	add r0, r7, r0
	ldrh r0, [r0, #6]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0203B024

	thumb_func_start sub_0203B05C
sub_0203B05C: ; 0x0203B05C
	ldrb r0, [r0, #2]
	bx lr
	thumb_func_end sub_0203B05C

	thumb_func_start sub_0203B060
sub_0203B060: ; 0x0203B060
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [sp, #0x10]
	add r4, r2, #0
	add r6, r3, #0
	cmp r4, r0
	blt _0203B072
	bl GF_AssertFail
_0203B072:
	ldr r0, [sp, #0x10]
	mul r0, r6
	add r4, r4, r0
	ldr r0, _0203B08C ; =0x0000031F
	cmp r4, r0
	blt _0203B082
	bl GF_AssertFail
_0203B082:
	ldr r0, _0203B090 ; =0x00000644
	add r1, r5, r4
	ldrb r0, [r1, r0]
	pop {r4, r5, r6, pc}
	nop
_0203B08C: .word 0x0000031F
_0203B090: .word 0x00000644
	thumb_func_end sub_0203B060

	thumb_func_start sub_0203B094
sub_0203B094: ; 0x0203B094
	push {r3, r4, r5, lr}
	ldr r1, _0203B0C4 ; =0x0000063E
	add r4, r0, #0
	bl AllocFromHeap
	add r5, r0, #0
	mov r0, #0x29
	mov r1, #0
	add r2, r4, #0
	bl AllocAtEndAndReadWholeNarcMemberByIdPair
	add r4, r0, #0
	ldrb r1, [r4, #4]
	add r0, r4, #5
	ldr r2, _0203B0C4 ; =0x0000063E
	add r0, r0, r1
	add r1, r5, #0
	bl MI_CpuCopy8
	add r0, r4, #0
	bl FreeToHeap
	add r0, r5, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0203B0C4: .word 0x0000063E
	thumb_func_end sub_0203B094

	thumb_func_start sub_0203B0C8
sub_0203B0C8: ; 0x0203B0C8
	push {r4, lr}
	add r4, r0, #0
	bne _0203B0D2
	bl GF_AssertFail
_0203B0D2:
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0203B0C8

	thumb_func_start sub_0203B0DC
sub_0203B0DC: ; 0x0203B0DC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bne _0203B0E8
	bl GF_AssertFail
_0203B0E8:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0203AFE0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0203B0DC

	thumb_func_start sub_0203B0F4
sub_0203B0F4: ; 0x0203B0F4
	ldr r1, _0203B110 ; =0x00000964
	ldrb r2, [r0]
	add r3, r0, r1
	ldrb r0, [r0, #2]
	cmp r0, #0
	bne _0203B10C
	lsl r0, r2, #2
	add r0, r2, r0
	add r0, #0x10
	mov r1, #0x56
	lsl r0, r0, #1
	strh r1, [r3, r0]
_0203B10C:
	bx lr
	nop
_0203B110: .word 0x00000964
	thumb_func_end sub_0203B0F4

	thumb_func_start sub_0203B114
sub_0203B114: ; 0x0203B114
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r1, #0
	bl SavArray_Flags_get
	add r4, r0, #0
	add r0, sp, #0
	bl GF_RTC_CopyDate
	add r0, r4, #0
	mov r1, #0xca
	bl CheckFlagInArray
	cmp r0, #0
	bne _0203B140
	add r0, r4, #0
	mov r1, #1
	bl sub_02066C4C
	add sp, #0x10
	mov r0, #0
	pop {r3, r4, r5, pc}
_0203B140:
	cmp r5, #0x58
	beq _0203B148
	cmp r5, #0x2d
	bne _0203B14E
_0203B148:
	ldr r0, [sp, #0xc]
	cmp r0, #3
	beq _0203B15C
_0203B14E:
	add r0, r4, #0
	mov r1, #1
	bl sub_02066C4C
	add sp, #0x10
	mov r0, #0
	pop {r3, r4, r5, pc}
_0203B15C:
	add r0, r4, #0
	mov r1, #1
	bl sub_02066C1C
	mov r0, #1
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0203B114

	thumb_func_start sub_0203B16C
sub_0203B16C: ; 0x0203B16C
	ldr r2, _0203B1F8 ; =0x00000964
	add r3, r0, r2
	ldrb r2, [r0]
	ldrb r0, [r0, #2]
	cmp r0, #0
	bne _0203B1F6
	cmp r1, #0
	beq _0203B1BA
	add r0, r2, #0
	add r0, #0xf
	mov r1, #0x5f
	lsl r0, r0, #1
	strh r1, [r3, r0]
	add r0, r2, #0
	add r0, #0x10
	mov r1, #0x60
	lsl r0, r0, #1
	strh r1, [r3, r0]
	add r0, r2, #0
	add r0, #0x11
	mov r1, #0x61
	lsl r0, r0, #1
	strh r1, [r3, r0]
	lsl r0, r2, #1
	add r1, r0, #0
	add r1, #0xf
	mov r2, #0x62
	lsl r1, r1, #1
	strh r2, [r3, r1]
	add r1, r0, #0
	add r1, #0x10
	add r0, #0x11
	mov r2, #0x63
	lsl r1, r1, #1
	strh r2, [r3, r1]
	mov r1, #0x64
	lsl r0, r0, #1
	strh r1, [r3, r0]
	bx lr
_0203B1BA:
	add r0, r2, #0
	add r0, #0xf
	mov r1, #0x59
	lsl r0, r0, #1
	strh r1, [r3, r0]
	add r0, r2, #0
	add r0, #0x10
	mov r1, #0x5a
	lsl r0, r0, #1
	strh r1, [r3, r0]
	add r0, r2, #0
	add r0, #0x11
	mov r1, #0x5b
	lsl r0, r0, #1
	strh r1, [r3, r0]
	lsl r0, r2, #1
	add r1, r0, #0
	add r1, #0xf
	mov r2, #0x5c
	lsl r1, r1, #1
	strh r2, [r3, r1]
	add r1, r0, #0
	add r1, #0x10
	add r0, #0x11
	mov r2, #0x5d
	lsl r1, r1, #1
	strh r2, [r3, r1]
	mov r1, #0x5e
	lsl r0, r0, #1
	strh r1, [r3, r0]
_0203B1F6:
	bx lr
	.balign 4, 0
_0203B1F8: .word 0x00000964
	thumb_func_end sub_0203B16C

	thumb_func_start sub_0203B1FC
sub_0203B1FC: ; 0x0203B1FC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r2, _0203B264 ; =0x00000964
	add r2, r0, r2
	str r2, [sp, #8]
	ldrb r2, [r0]
	ldrb r0, [r0, #2]
	str r2, [sp, #4]
	cmp r0, #0xd4
	bne _0203B260
	add r0, r1, #0
	bl sub_0202F57C
	mov r1, #3
	bl sub_0202F630
	mov r7, #0
	str r0, [sp]
	ldr r0, [sp, #4]
	add r6, r7, #0
	lsl r0, r0, #1
	mov ip, r0
	mov r0, #0xa3
	add r2, r7, #0
	lsl r0, r0, #2
_0203B22E:
	mov r3, #0x7a
	add r4, r6, #0
	mul r4, r3
	ldr r3, [sp]
	lsl r5, r2, #1
	add r3, r3, r4
	ldr r4, [sp, #8]
	mov r1, #0
	add r5, r4, r5
	mov r4, ip
	add r4, r5, r4
_0203B244:
	ldrb r5, [r3]
	add r1, r1, #1
	add r3, #0x7a
	add r5, r5, r0
	strh r5, [r4, #2]
	add r4, r4, #2
	cmp r1, #3
	blt _0203B244
	ldr r1, [sp, #4]
	add r7, r7, #1
	add r6, r6, #3
	add r2, r2, r1
	cmp r7, #2
	blt _0203B22E
_0203B260:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0203B264: .word 0x00000964
	thumb_func_end sub_0203B1FC
