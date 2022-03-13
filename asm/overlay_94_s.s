	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov94_021E5B54
ov94_021E5B54: ; 0x021E5B54
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	bl sub_02014DA0
	mov r1, #0x12
	mov r0, #0xc
	lsl r1, r1, #0xa
	bl AllocFromHeap
	add r2, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #0xc
	str r0, [sp, #4]
	mov r3, #0x12
	ldr r0, _021E5B98 ; =ov94_021E5CA0
	ldr r1, _021E5B9C ; =ov94_021E5CC4
	lsl r3, r3, #0xa
	bl sub_02014DB4
	str r0, [r4, #0x18]
	bl sub_02015524
	add r2, r0, #0
	mov r0, #1
	mov r1, #0xe1
	lsl r0, r0, #0xc
	lsl r1, r1, #0xe
	bl sub_02023240
	add sp, #8
	pop {r4, pc}
	nop
_021E5B98: .word ov94_021E5CA0
_021E5B9C: .word ov94_021E5CC4
	thumb_func_end ov94_021E5B54

	thumb_func_start ov94_021E5BA0
ov94_021E5BA0: ; 0x021E5BA0
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0x10]
	mov r0, #0xd0
	mov r2, #0xc
	bl sub_02015264
	add r1, r0, #0
	ldr r0, [r4, #0x18]
	mov r2, #0xa
	mov r3, #1
	bl sub_0201526C
	ldr r1, [r4, #0xc]
	ldr r0, _021E5C18 ; =0x000001E7
	cmp r1, r0
	beq _021E5BCA
	add r0, r0, #5
	cmp r1, r0
	beq _021E5BF6
	pop {r4, pc}
_021E5BCA:
	ldr r0, [r4, #0x18]
	ldr r2, _021E5C1C ; =ov94_021E5C28
	mov r1, #0
	add r3, r4, #0
	bl sub_02015494
	ldr r0, [r4, #0x18]
	ldr r2, _021E5C1C ; =ov94_021E5C28
	mov r1, #1
	add r3, r4, #0
	bl sub_02015494
	ldr r0, [r4, #0x18]
	ldr r2, _021E5C1C ; =ov94_021E5C28
	mov r1, #2
	add r3, r4, #0
	bl sub_02015494
	ldr r0, _021E5C20 ; =0x00000564
	bl PlaySE
	pop {r4, pc}
_021E5BF6:
	ldr r0, [r4, #0x18]
	ldr r2, _021E5C1C ; =ov94_021E5C28
	mov r1, #0
	add r3, r4, #0
	bl sub_02015494
	ldr r0, [r4, #0x18]
	ldr r2, _021E5C1C ; =ov94_021E5C28
	mov r1, #1
	add r3, r4, #0
	bl sub_02015494
	ldr r0, _021E5C24 ; =0x00000565
	bl PlaySE
	pop {r4, pc}
	nop
_021E5C18: .word 0x000001E7
_021E5C1C: .word ov94_021E5C28
_021E5C20: .word 0x00000564
_021E5C24: .word 0x00000565
	thumb_func_end ov94_021E5BA0

	thumb_func_start ov94_021E5C28
ov94_021E5C28: ; 0x021E5C28
	push {r4, lr}
	add r4, r0, #0
	bl sub_02015504
	ldr r1, [r0, #0x14]
	lsl r2, r1, #3
	ldr r1, _021E5C58 ; =_021E5CE8
	ldr r2, [r1, r2]
	ldr r1, [r4, #0x20]
	ldr r1, [r1]
	ldr r1, [r1, #4]
	add r1, r2, r1
	str r1, [r4, #0x28]
	ldr r0, [r0, #0x14]
	lsl r1, r0, #3
	ldr r0, _021E5C5C ; =ov94_021E5CEC
	ldr r1, [r0, r1]
	ldr r0, [r4, #0x20]
	ldr r0, [r0]
	ldr r0, [r0, #8]
	add r0, r1, r0
	str r0, [r4, #0x2c]
	pop {r4, pc}
	nop
_021E5C58: .word _021E5CE8
_021E5C5C: .word ov94_021E5CEC
	thumb_func_end ov94_021E5C28

	thumb_func_start ov94_021E5C60
ov94_021E5C60: ; 0x021E5C60
	push {r4, lr}
	bl sub_02026E48
	bl sub_0201543C
	add r4, r0, #0
	cmp r4, #0
	ble _021E5C74
	bl sub_02026E48
_021E5C74:
	bl sub_02015460
	mov r0, #1
	mov r1, #0
	bl sub_02026E50
	add r0, r4, #0
	pop {r4, pc}
	thumb_func_end ov94_021E5C60

	thumb_func_start ov94_021E5C84
ov94_021E5C84: ; 0x021E5C84
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x18]
	bl sub_020154D0
	add r4, r0, #0
	ldr r0, [r5, #0x18]
	bl sub_02014EBC
	add r0, r4, #0
	bl FreeToHeap
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov94_021E5C84

	thumb_func_start ov94_021E5CA0
ov94_021E5CA0: ; 0x021E5CA0
	push {r4, lr}
	ldr r3, _021E5CC0 ; =NNS_GfdDefaultFuncAllocTexVram
	mov r2, #0
	ldr r3, [r3]
	blx r3
	add r4, r0, #0
	bne _021E5CB2
	bl GF_AssertFail
_021E5CB2:
	add r0, r4, #0
	bl sub_02015354
	lsl r0, r4, #0x10
	lsr r0, r0, #0xd
	pop {r4, pc}
	nop
_021E5CC0: .word NNS_GfdDefaultFuncAllocTexVram
	thumb_func_end ov94_021E5CA0

	thumb_func_start ov94_021E5CC4
ov94_021E5CC4: ; 0x021E5CC4
	push {r4, lr}
	ldr r3, _021E5CE4 ; =NNS_GfdDefaultFuncAllocPlttVram
	mov r2, #1
	ldr r3, [r3]
	blx r3
	add r4, r0, #0
	bne _021E5CD6
	bl GF_AssertFail
_021E5CD6:
	add r0, r4, #0
	bl sub_02015394
	lsl r0, r4, #0x10
	lsr r0, r0, #0xd
	pop {r4, pc}
	nop
_021E5CE4: .word NNS_GfdDefaultFuncAllocPlttVram
	thumb_func_end ov94_021E5CC4

	.rodata

_021E5CE8:
	.byte 0x8C, 0xBF, 0xFF, 0xFF

ov94_021E5CEC: ; 0x021E5CEC
	.byte 0xE0, 0x2E, 0x00, 0x00
	.byte 0x88, 0x13, 0x00, 0x00, 0xEC, 0x2C, 0x00, 0x00, 0x8C, 0xBF, 0xFF, 0xFF, 0x88, 0x13, 0x00, 0x00
	.byte 0x88, 0x13, 0x00, 0x00, 0xAC, 0x0D, 0x00, 0x00, 0x8C, 0xBF, 0xFF, 0xFF, 0x48, 0xF4, 0xFF, 0xFF
	.byte 0x88, 0x13, 0x00, 0x00, 0x6C, 0xEE, 0xFF, 0xFF
