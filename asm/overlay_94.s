	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov94_021E5900
ov94_021E5900: ; 0x021E5900
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x32
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021E5912
	bl GF_AssertFail
_021E5912:
	mov r0, #0xc
	mov r1, #0x1c
	bl sub_0201AA8C
	mov r1, #0x32
	lsl r1, r1, #6
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	mov r1, #0
	mov r2, #0x1c
	bl sub_020D4994
	ldr r0, _021E5938 ; =0x00000C65
	ldrb r1, [r4, r0]
	add r0, #0x1b
	ldr r0, [r4, r0]
	str r1, [r0, #0x14]
	pop {r4, pc}
	nop
_021E5938: .word 0x00000C65
	thumb_func_end ov94_021E5900

	thumb_func_start ov94_021E593C
ov94_021E593C: ; 0x021E593C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r1, #0x32
	ldr r0, _021E5AD8 ; =0x00000654
	lsl r1, r1, #6
	ldr r4, [r5, r1]
	ldr r0, [r5, r0]
	sub r1, #0x1b
	ldrb r1, [r5, r1]
	ldr r0, [r0]
	bl sub_02074644
	ldr r1, [r4]
	add r6, r0, #0
	cmp r1, #0xa
	bls _021E595E
	b _021E5AD2
_021E595E:
	add r2, r1, r1
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_021E596A: ; jump table
	.short _021E5980 - _021E596A - 2 ; case 0
	.short _021E59E2 - _021E596A - 2 ; case 1
	.short _021E59E2 - _021E596A - 2 ; case 2
	.short _021E59E8 - _021E596A - 2 ; case 3
	.short _021E59F6 - _021E596A - 2 ; case 4
	.short _021E5A0C - _021E596A - 2 ; case 5
	.short _021E5A40 - _021E596A - 2 ; case 6
	.short _021E5A4E - _021E596A - 2 ; case 7
	.short _021E5A5A - _021E596A - 2 ; case 8
	.short _021E5A6A - _021E596A - 2 ; case 9
	.short _021E5AB2 - _021E596A - 2 ; case 10
_021E5980:
	mov r1, #5
	mov r2, #0
	bl sub_0206E540
	ldr r2, _021E5ADC ; =0x000001DF
	str r0, [r4, #0xc]
	cmp r0, r2
	beq _021E59C2
	add r1, r2, #0
	add r1, #8
	cmp r0, r1
	beq _021E59A0
	add r2, #0xd
	cmp r0, r2
	beq _021E59B0
	b _021E59C2
_021E59A0:
	add r0, r6, #0
	bl sub_02071CA0
	mov r0, #0x41
	str r0, [r4, #8]
	mov r0, #0
	str r0, [r4, #0x10]
	b _021E59C6
_021E59B0:
	add r0, r6, #0
	mov r1, #1
	bl sub_02071D6C
	mov r0, #0x23
	str r0, [r4, #8]
	mov r0, #1
	str r0, [r4, #0x10]
	b _021E59C6
_021E59C2:
	bl GF_AssertFail
_021E59C6:
	ldr r0, _021E5AD8 ; =0x00000654
	ldr r0, [r5, r0]
	ldr r0, [r0, #0x1c]
	bl sub_0203E344
	bl sub_0202A634
	add r1, r6, #0
	bl sub_0202A434
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _021E5AD2
_021E59E2:
	add r0, r1, #1
	str r0, [r4]
	b _021E5AD2
_021E59E8:
	add r0, r5, #0
	bl ov94_021E5B04
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _021E5AD2
_021E59F6:
	mov r0, #1
	add r1, r0, #0
	bl sub_02022C60
	add r0, r4, #0
	bl ov94_021E5BA0
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _021E5AD2
_021E5A0C:
	ldr r0, [r4, #4]
	add r1, r0, #1
	str r1, [r4, #4]
	ldr r0, [r4, #8]
	cmp r1, r0
	bne _021E5A22
	ldr r1, _021E5AE0 ; =0x00000C65
	add r0, r5, #0
	ldrb r1, [r5, r1]
	bl sub_0207ECE0
_021E5A22:
	bl ov94_021E5C60
	ldr r1, [r4, #4]
	ldr r0, [r4, #8]
	cmp r1, r0
	ble _021E5AD2
	ldr r0, [r4, #0x18]
	bl sub_020154B0
	cmp r0, #0
	bne _021E5AD2
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _021E5AD2
_021E5A40:
	add r0, r5, #0
	bl ov94_021E5B30
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _021E5AD2
_021E5A4E:
	bl sub_020720D4
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _021E5AD2
_021E5A5A:
	bl sub_02006360
	cmp r0, #0
	bne _021E5AD2
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _021E5AD2
_021E5A6A:
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #0xbc
	bl sub_0200BBA0
	add r7, r0, #0
	add r0, r6, #0
	bl sub_02070DB0
	add r2, r0, #0
	ldr r0, _021E5AE4 ; =0x000007C4
	mov r1, #0
	ldr r0, [r5, r0]
	bl sub_0200BF8C
	ldr r1, _021E5AE4 ; =0x000007C4
	add r2, r7, #0
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	bl sub_0200CBBC
	add r0, r7, #0
	bl sub_02026380
	mov r1, #0
	add r0, r5, #0
	mvn r1, r1
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _021E5AD2
_021E5AB2:
	ldr r0, _021E5AE8 ; =0x00000C64
	ldrb r0, [r5, r0]
	bl sub_02020094
	cmp r0, #0
	bne _021E5AD2
	add r0, r5, #0
	bl ov94_021E5AEC
	ldr r0, _021E5AD8 ; =0x00000654
	mov r1, #0
	ldr r0, [r5, r0]
	add r0, #0x27
	strb r1, [r0]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E5AD2:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E5AD8: .word 0x00000654
_021E5ADC: .word 0x000001DF
_021E5AE0: .word 0x00000C65
_021E5AE4: .word 0x000007C4
_021E5AE8: .word 0x00000C64
	thumb_func_end ov94_021E593C

	thumb_func_start ov94_021E5AEC
ov94_021E5AEC: ; 0x021E5AEC
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x32
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	bl sub_0201AB0C
	mov r0, #0x32
	mov r1, #0
	lsl r0, r0, #6
	str r1, [r4, r0]
	pop {r4, pc}
	thumb_func_end ov94_021E5AEC

	thumb_func_start ov94_021E5B04
ov94_021E5B04: ; 0x021E5B04
	push {r3, r4, lr}
	sub sp, #4
	mov r1, #0
	add r4, r0, #0
	bl sub_0207991C
	mov r0, #0x32
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	bl ov94_021E5B54
	mov r1, #0
	ldr r0, _021E5B2C ; =0x04000050
	mov r2, #0x3f
	mov r3, #0x1f
	str r1, [sp]
	bl sub_020CF15C
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_021E5B2C: .word 0x04000050
	thumb_func_end ov94_021E5B04

	thumb_func_start ov94_021E5B30
ov94_021E5B30: ; 0x021E5B30
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x32
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	bl ov94_021E5C84
	add r0, r4, #0
	mov r1, #1
	bl sub_0207991C
	ldr r0, _021E5B50 ; =0x04000050
	mov r1, #0
	strh r1, [r0]
	pop {r4, pc}
	nop
_021E5B50: .word 0x04000050
	thumb_func_end ov94_021E5B30

	thumb_func_start ov94_021E5B54
ov94_021E5B54: ; 0x021E5B54
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	bl sub_02014DA0
	mov r1, #0x12
	mov r0, #0xc
	lsl r1, r1, #0xa
	bl sub_0201AA8C
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
	bl sub_0200604C
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
	bl sub_0200604C
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
	ldr r1, _021E5C58 ; =0x021E5CE8
	ldr r2, [r1, r2]
	ldr r1, [r4, #0x20]
	ldr r1, [r1]
	ldr r1, [r1, #4]
	add r1, r2, r1
	str r1, [r4, #0x28]
	ldr r0, [r0, #0x14]
	lsl r1, r0, #3
	ldr r0, _021E5C5C ; =0x021E5CEC
	ldr r1, [r0, r1]
	ldr r0, [r4, #0x20]
	ldr r0, [r0]
	ldr r0, [r0, #8]
	add r0, r1, r0
	str r0, [r4, #0x2c]
	pop {r4, pc}
	nop
_021E5C58: .word 0x021E5CE8
_021E5C5C: .word 0x021E5CEC
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
	bl sub_0201AB0C
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov94_021E5C84

	thumb_func_start ov94_021E5CA0
ov94_021E5CA0: ; 0x021E5CA0
	push {r4, lr}
	ldr r3, _021E5CC0 ; =0x02110924
	mov r2, #0
	ldr r3, [r3]
	bl r3
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
_021E5CC0: .word 0x02110924
	thumb_func_end ov94_021E5CA0

	thumb_func_start ov94_021E5CC4
ov94_021E5CC4: ; 0x021E5CC4
	push {r4, lr}
	ldr r3, _021E5CE4 ; =0x0211092C
	mov r2, #1
	ldr r3, [r3]
	bl r3
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
_021E5CE4: .word 0x0211092C
	thumb_func_end ov94_021E5CC4

	.rodata

_021E5CE8:
	.byte 0x8C, 0xBF, 0xFF, 0xFF, 0xE0, 0x2E, 0x00, 0x00
	.byte 0x88, 0x13, 0x00, 0x00, 0xEC, 0x2C, 0x00, 0x00, 0x8C, 0xBF, 0xFF, 0xFF, 0x88, 0x13, 0x00, 0x00
	.byte 0x88, 0x13, 0x00, 0x00, 0xAC, 0x0D, 0x00, 0x00, 0x8C, 0xBF, 0xFF, 0xFF, 0x48, 0xF4, 0xFF, 0xFF
	.byte 0x88, 0x13, 0x00, 0x00, 0x6C, 0xEE, 0xFF, 0xFF
