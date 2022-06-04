	.include "asm/macros.inc"
	.include "global.inc"

	.extern ov76_021E7098
	.extern ov76_021E7094
	.extern ov76_021E709C
	.extern ov76_021E70A0

	thumb_func_start ov76_021E6B8C
ov76_021E6B8C:
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	mov r2, #0
	add r6, r1, #0
	add r4, r0, #0
	add r3, r2, #0
	cmp r6, #5
	bne _021E6BB0
	mov r0, #0x81
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r2, #1
	cmp r0, #1
	bne _021E6BAC
	mov r0, #7
	b _021E6BC6
_021E6BAC:
	mov r0, #5
	b _021E6BC6
_021E6BB0:
	cmp r6, #7
	bne _021E6BC6
	mov r1, #0x81
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	mov r3, #1
	cmp r1, #1
	bne _021E6BC4
	mov r1, #5
	b _021E6BC6
_021E6BC4:
	mov r1, #7
_021E6BC6:
	cmp r2, #0
	beq _021E6BF2
	ldr r1, _021E6CE4 ; =ov76_021E7098
	lsl r5, r0, #4
	mov r0, #0x49
	str r0, [sp]
	ldr r0, [r4]
	ldr r1, [r1, r5]
	mov r2, #1
	add r3, sp, #0x10
	bl GfGfxLoader_GetCharDataFromOpenNarc
	ldr r1, _021E6CE8 ; =ov76_021E7094
	str r0, [sp, #8]
	ldr r0, [r4]
	ldr r1, [r1, r5]
	add r2, sp, #0xc
	mov r3, #0x49
	bl GfGfxLoader_GetPlttDataFromOpenNarc
	str r0, [sp, #4]
	b _021E6C42
_021E6BF2:
	cmp r3, #0
	add r3, sp, #0x10
	beq _021E6C1E
	lsl r5, r1, #4
	ldr r1, _021E6CE4 ; =ov76_021E7098
	mov r0, #0x49
	str r0, [sp]
	ldr r0, [r4]
	ldr r1, [r1, r5]
	mov r2, #1
	bl GfGfxLoader_GetCharDataFromOpenNarc
	ldr r1, _021E6CE8 ; =ov76_021E7094
	str r0, [sp, #8]
	ldr r0, [r4]
	ldr r1, [r1, r5]
	add r2, sp, #0xc
	mov r3, #0x49
	bl GfGfxLoader_GetPlttDataFromOpenNarc
	str r0, [sp, #4]
	b _021E6C42
_021E6C1E:
	ldr r1, _021E6CE4 ; =ov76_021E7098
	lsl r5, r6, #4
	mov r0, #0x49
	str r0, [sp]
	ldr r0, [r4]
	ldr r1, [r1, r5]
	mov r2, #1
	bl GfGfxLoader_GetCharDataFromOpenNarc
	ldr r1, _021E6CE8 ; =ov76_021E7094
	str r0, [sp, #8]
	ldr r0, [r4]
	ldr r1, [r1, r5]
	add r2, sp, #0xc
	mov r3, #0x49
	bl GfGfxLoader_GetPlttDataFromOpenNarc
	str r0, [sp, #4]
_021E6C42:
	ldr r1, [sp, #0x10]
	ldr r0, [r1, #0x14]
	ldr r1, [r1, #0x10]
	bl DC_FlushRange
	ldr r2, [sp, #0x10]
	ldrh r3, [r4, #4]
	mov r1, #0x34
	ldr r0, [r2, #0x14]
	mul r1, r3
	add r1, r4, r1
	ldr r1, [r1, #0xc]
	ldr r2, [r2, #0x10]
	bl GX_LoadOBJ
	ldr r1, [sp, #0xc]
	ldr r0, [r1, #0xc]
	ldr r1, [r1, #8]
	bl DC_FlushRange
	ldr r0, [sp, #0xc]
	ldrh r2, [r4, #4]
	mov r1, #0x34
	ldr r0, [r0, #0xc]
	mul r1, r2
	add r1, r4, r1
	ldr r1, [r1, #0x10]
	mov r2, #0x20
	bl GX_LoadOBJPltt
	mov r0, #0x49
	str r0, [sp]
	lsl r5, r6, #4
	ldr r1, _021E6CEC ; =ov76_021E709C
	add r7, r4, #0
	ldrh r6, [r4, #4]
	mov r3, #0x34
	ldr r0, [r4]
	ldr r1, [r1, r5]
	add r7, #0x24
	mul r3, r6
	mov r2, #1
	add r3, r7, r3
	bl GfGfxLoader_GetCellBankFromOpenNarc
	ldrh r1, [r4, #4]
	add r3, r4, #0
	mov r6, #0x34
	add r2, r1, #0
	mul r2, r6
	add r1, r4, r2
	str r0, [r1, #0x34]
	mov r0, #0x49
	ldr r1, _021E6CF0 ; =ov76_021E70A0
	str r0, [sp]
	ldr r1, [r1, r5]
	ldrh r5, [r4, #4]
	ldr r0, [r4]
	add r3, #0x28
	mul r6, r5
	mov r2, #1
	add r3, r3, r6
	bl GfGfxLoader_GetAnimBankFromOpenNarc
	ldrh r2, [r4, #4]
	mov r1, #0x34
	mul r1, r2
	add r1, r4, r1
	str r0, [r1, #0x38]
	ldr r0, [sp, #8]
	bl FreeToHeap
	ldr r0, [sp, #4]
	bl FreeToHeap
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_021E6CE4: .word ov76_021E7098
_021E6CE8: .word ov76_021E7094
_021E6CEC: .word ov76_021E709C
_021E6CF0: .word ov76_021E70A0
	thumb_func_end ov76_021E6B8C
