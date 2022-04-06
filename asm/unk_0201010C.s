	.include "asm/macros.inc"
	.include "global.inc"

	.rodata

_020F5D58:
	.byte 0xC0, 0x00, 0x00, 0x00
_020F5D5C:
	.byte 0x00, 0xC0, 0x00, 0x00
_020F5D60:
	.byte 0x00, 0xC0, 0x01, 0x00
_020F5D64:
	.byte 0xC0, 0x00, 0x01, 0x00
_020F5D68:
	.byte 0x60, 0x00, 0x00, 0x00, 0x60, 0xC0, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x1F, 0x20, 0x3F, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x1F, 0x3F, 0x20, 0x01, 0x00
_020F5D80:
	.byte 0x60, 0x00, 0x01, 0x00, 0x60, 0xC0, 0x01, 0x00, 0x00, 0x00, 0x49, 0x7F, 0x20, 0x3F, 0x01, 0x00
_020F5D90:
	.byte 0x00, 0x60, 0x01, 0x00, 0xC0, 0x60, 0x01, 0x00
_020F5D98:
	.byte 0x00, 0x5E, 0x01, 0x00, 0xC0, 0x62, 0x01, 0x00
_020F5DA0:
	.byte 0x00, 0x00, 0xFF, 0x3F, 0x00, 0x3F, 0x20, 0x00
_020F5DA8:
	.byte 0xFF, 0x3F, 0x00, 0x00, 0x00, 0x3F, 0x20, 0x01
_020F5DB0:
	.byte 0x5E, 0x00, 0x00, 0x00, 0x62, 0xC0, 0x00, 0x00
_020F5DB8:
	.byte 0x00, 0x60, 0x00, 0x00, 0xC0, 0x60, 0x00, 0x00
	.byte 0x00, 0x00, 0x49, 0x7F, 0x3F, 0x20, 0x00, 0x00
_020F5DC8:
	.byte 0x00, 0x00, 0xFF, 0x3F, 0x00, 0x3F, 0x20, 0x00
_020F5DD0:
	.byte 0xFF, 0x3F, 0x00, 0x00, 0x00, 0x3F, 0x20, 0x01
_020F5DD8:
	.byte 0x00, 0x02, 0x00, 0x00, 0x80, 0x00, 0x20, 0x01
	.byte 0x00, 0x3F, 0x20, 0x01
_020F5DE4:
	.byte 0x00, 0x00, 0x00, 0x02, 0x80, 0x00, 0x20, 0x01, 0x00, 0x3F, 0x20, 0x00
_020F5DF0:
	.byte 0x40, 0x00, 0x00, 0x00, 0x80, 0x40, 0x00, 0x00, 0xC0, 0x80, 0x00, 0x00
_020F5DFC:
	.byte 0x00, 0x00, 0x00, 0xC0
	.byte 0x00, 0x00, 0xFF, 0xC0, 0x00, 0x20, 0x3F, 0x01
_020F5E08:
	.byte 0x00, 0x00, 0xFF, 0xC0, 0x80, 0x60, 0x80, 0x60
	.byte 0x00, 0x3F, 0x20, 0x01
_020F5E14:
	.byte 0x80, 0x60, 0x80, 0x60, 0x00, 0x00, 0xFF, 0xC0, 0x00, 0x3F, 0x20, 0x00
_020F5E20:
	.byte 0x80, 0x60, 0x80, 0x60, 0x00, 0x00, 0xFF, 0xC0, 0x00, 0x20, 0x3F, 0x01
_020F5E2C:
	.byte 0x00, 0x00, 0xFF, 0xC0
	.byte 0x00, 0x00, 0x00, 0xC0, 0x00, 0x3F, 0x20, 0x01
_020F5E38:
	.byte 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0xFF, 0xC0
	.byte 0x00, 0x3F, 0x20, 0x00
_020F5E44:
	.byte 0x00, 0x00, 0xFF, 0xC0, 0x80, 0x60, 0x80, 0x60, 0x00, 0x20, 0x3F, 0x00
_020F5E50:
	.byte 0x00, 0x00, 0xFF, 0xC0, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x20, 0x3F, 0x00
_020F5E5C:
	.byte 0x00, 0x00, 0xFF, 0xC0
	.byte 0x80, 0x00, 0x80, 0xC0, 0x00, 0x3F, 0x20, 0x01
_020F5E68:
	.byte 0x80, 0x00, 0x80, 0xC0, 0x00, 0x00, 0xFF, 0xC0
	.byte 0x00, 0x3F, 0x20, 0x00
_020F5E74:
	.byte 0x80, 0x00, 0x60, 0x00, 0x38, 0x8E, 0x00, 0x00, 0x00, 0x20, 0x3F, 0x01
_020F5E80:
	.byte 0x80, 0x00, 0x80, 0xC0, 0x00, 0x00, 0x80, 0xC0, 0x00, 0x20, 0x3F, 0x01
_020F5E8C:
	.byte 0x80, 0x00, 0x80, 0xC0
	.byte 0x80, 0x00, 0xFF, 0xC0, 0x01, 0x20, 0x3F, 0x01
_020F5E98:
	.byte 0x00, 0x02, 0x00, 0x00, 0x80, 0x00, 0xB0, 0xFF
	.byte 0x00, 0x3F, 0x20, 0x01
_020F5EA4:
	.byte 0x00, 0x00, 0x80, 0xC0, 0x80, 0x00, 0x80, 0xC0, 0x00, 0x20, 0x3F, 0x00
_020F5EB0:
	.byte 0x80, 0x00, 0xFF, 0xC0, 0x80, 0x00, 0x80, 0xC0, 0x01, 0x20, 0x3F, 0x00
_020F5EBC:
	.byte 0x00, 0x40, 0x01, 0x00
	.byte 0x40, 0x80, 0x01, 0x00, 0x80, 0xC0, 0x01, 0x00
_020F5EC8:
	.byte 0x00, 0x01, 0x00, 0x00, 0x80, 0x00, 0x60, 0x00
	.byte 0x00, 0x3F, 0x20, 0x01
_020F5ED4:
	.byte 0x00, 0x00, 0x00, 0x01, 0x80, 0x00, 0x60, 0x00, 0x00, 0x3F, 0x20, 0x00
_020F5EE0:
	.byte 0x00, 0x00, 0x00, 0x02, 0x80, 0x00, 0xB0, 0xFF, 0x00, 0x3F, 0x20, 0x00
_020F5EEC:
	.byte 0x00, 0x00, 0xFF, 0x30
	.byte 0x00, 0x2F, 0xFF, 0x60, 0x00, 0x60, 0xFF, 0x90, 0x00, 0x90, 0xFF, 0xC0
_020F5EFC:
	.byte 0x00, 0x00, 0x00, 0x30
	.byte 0xFF, 0x2F, 0xFF, 0x60, 0x00, 0x60, 0x00, 0x90, 0xFF, 0x90, 0xFF, 0xC0
_020F5F0C:
	.byte 0xFF, 0x00, 0xFF, 0x30
	.byte 0x00, 0x2F, 0x00, 0x60, 0xFF, 0x60, 0xFF, 0x90, 0x00, 0x90, 0x00, 0xC0
_020F5F1C:
	.byte 0x00, 0x00, 0xFF, 0x30
	.byte 0x00, 0x2F, 0xFF, 0x60, 0x00, 0x60, 0xFF, 0x90, 0x00, 0x90, 0xFF, 0xC0

	.data

_0210F64C:
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00
_0210F654:
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x01, 0x00
_0210F65C:
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
_0210F664:
	.byte 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
_0210F66C:
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00
_0210F674:
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
_0210F67C:
	.byte 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x01, 0x00
_0210F684:
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
_0210F68C:
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
_0210F694:
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x01, 0x00
_0210F69C:
	.byte 0x00, 0x5E, 0xFF, 0x62, 0x80, 0x60, 0x80, 0x60, 0x00, 0x3F, 0x20, 0x01
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x01, 0x00, 0x33, 0x0B, 0x00, 0x00
_0210F6B4:
	.byte 0x80, 0x60, 0x80, 0x60, 0x00, 0x5E, 0xFF, 0x62, 0x00, 0x3F, 0x20, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x33, 0x0B, 0x00, 0x00

	.text

	thumb_func_start FadeFunc_00
FadeFunc_00: ; 0x0201010C
	push {r3, lr}
	ldr r1, [r0, #0xc]
	cmp r1, #0
	bne _02010122
	mov r1, #1
	str r1, [r0, #0x28]
	str r1, [r0, #0x2c]
	bl sub_02010B14
	mov r0, #0
	pop {r3, pc}
_02010122:
	bl sub_02010BB4
	pop {r3, pc}
	thumb_func_end FadeFunc_00

	thumb_func_start FadeFunc_01
FadeFunc_01: ; 0x02010128
	push {r3, lr}
	ldr r1, [r0, #0xc]
	cmp r1, #0
	bne _02010140
	mov r1, #0
	str r1, [r0, #0x28]
	mov r2, #1
	str r2, [r0, #0x2c]
	bl sub_02010B14
	mov r0, #0
	pop {r3, pc}
_02010140:
	bl sub_02010BB4
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end FadeFunc_01

	thumb_func_start FadeFunc_02
FadeFunc_02: ; 0x02010148
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0xc]
	cmp r1, #0
	bne _02010170
	ldr r1, _02010178 ; =_020F5D60
	ldr r0, _0201017C ; =_0210F64C
	str r1, [r0]
	ldrh r0, [r4, #0x24]
	bl sub_0200FCDC
	ldr r1, _02010180 ; =_0210F64C
	add r0, r4, #0
	bl sub_0201289C
	mov r0, #1
	str r0, [r4, #0x28]
	mov r0, #0
	str r0, [r4, #0x2c]
	pop {r4, pc}
_02010170:
	bl sub_020128E0
	pop {r4, pc}
	nop
_02010178: .word _020F5D60
_0201017C: .word _0210F64C
_02010180: .word _0210F64C
	thumb_func_end FadeFunc_02

	thumb_func_start FadeFunc_03
FadeFunc_03: ; 0x02010184
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0xc]
	cmp r1, #0
	bne _020101AA
	ldr r1, _020101B0 ; =_020F5D5C
	ldr r0, _020101B4 ; =_0210F64C
	str r1, [r0, #0x10]
	ldrh r0, [r4, #0x24]
	bl sub_0200FCDC
	ldr r1, _020101B8 ; =_0210F65C
	add r0, r4, #0
	bl sub_0201289C
	mov r0, #0
	str r0, [r4, #0x28]
	str r0, [r4, #0x2c]
	pop {r4, pc}
_020101AA:
	bl sub_020128E0
	pop {r4, pc}
	.balign 4, 0
_020101B0: .word _020F5D5C
_020101B4: .word _0210F64C
_020101B8: .word _0210F65C
	thumb_func_end FadeFunc_03

	thumb_func_start FadeFunc_04
FadeFunc_04: ; 0x020101BC
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0xc]
	cmp r1, #0
	bne _020101E4
	ldr r1, _020101EC ; =_020F5D64
	ldr r0, _020101F0 ; =_0210F64C
	str r1, [r0, #0x20]
	ldrh r0, [r4, #0x24]
	bl sub_0200FCDC
	ldr r1, _020101F4 ; =_0210F66C
	add r0, r4, #0
	bl sub_0201289C
	mov r0, #1
	str r0, [r4, #0x28]
	mov r0, #0
	str r0, [r4, #0x2c]
	pop {r4, pc}
_020101E4:
	bl sub_020128E0
	pop {r4, pc}
	nop
_020101EC: .word _020F5D64
_020101F0: .word _0210F64C
_020101F4: .word _0210F66C
	thumb_func_end FadeFunc_04

	thumb_func_start FadeFunc_05
FadeFunc_05: ; 0x020101F8
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0xc]
	cmp r1, #0
	bne _0201021E
	ldr r1, _02010224 ; =_020F5D58
	ldr r0, _02010228 ; =_0210F64C
	str r1, [r0, #0x28]
	ldrh r0, [r4, #0x24]
	bl sub_0200FCDC
	ldr r1, _0201022C ; =_0210F674
	add r0, r4, #0
	bl sub_0201289C
	mov r0, #0
	str r0, [r4, #0x28]
	str r0, [r4, #0x2c]
	pop {r4, pc}
_0201021E:
	bl sub_020128E0
	pop {r4, pc}
	.balign 4, 0
_02010224: .word _020F5D58
_02010228: .word _0210F64C
_0201022C: .word _0210F674
	thumb_func_end FadeFunc_05

	thumb_func_start FadeFunc_06
FadeFunc_06: ; 0x02010230
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0xc]
	cmp r1, #0
	bne _02010252
	ldrh r0, [r4, #0x24]
	bl sub_0200FCDC
	ldr r1, _02010258 ; =_020F5E2C
	add r0, r4, #0
	bl sub_0201164C
	mov r0, #1
	str r0, [r4, #0x28]
	mov r0, #0
	str r0, [r4, #0x2c]
	pop {r4, pc}
_02010252:
	bl sub_0201169C
	pop {r4, pc}
	.balign 4, 0
_02010258: .word _020F5E2C
	thumb_func_end FadeFunc_06

	thumb_func_start FadeFunc_07
FadeFunc_07: ; 0x0201025C
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0xc]
	cmp r1, #0
	bne _0201027C
	ldrh r0, [r4, #0x24]
	bl sub_0200FCDC
	ldr r1, _02010284 ; =_020F5E38
	add r0, r4, #0
	bl sub_0201164C
	mov r0, #0
	str r0, [r4, #0x28]
	str r0, [r4, #0x2c]
	pop {r4, pc}
_0201027C:
	bl sub_0201169C
	pop {r4, pc}
	nop
_02010284: .word _020F5E38
	thumb_func_end FadeFunc_07

	thumb_func_start FadeFunc_08
FadeFunc_08: ; 0x02010288
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0xc]
	cmp r1, #0
	bne _020102B0
	ldr r1, _020102B8 ; =_020F5D90
	ldr r0, _020102BC ; =_0210F64C
	str r1, [r0, #8]
	ldrh r0, [r4, #0x24]
	bl sub_0200FCDC
	ldr r1, _020102C0 ; =_0210F654
	add r0, r4, #0
	bl sub_0201289C
	mov r0, #1
	str r0, [r4, #0x28]
	mov r0, #0
	str r0, [r4, #0x2c]
	pop {r4, pc}
_020102B0:
	bl sub_020128E0
	pop {r4, pc}
	nop
_020102B8: .word _020F5D90
_020102BC: .word _0210F64C
_020102C0: .word _0210F654
	thumb_func_end FadeFunc_08

	thumb_func_start FadeFunc_09
FadeFunc_09: ; 0x020102C4
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0xc]
	cmp r1, #0
	bne _020102EA
	ldr r1, _020102F0 ; =_020F5D68
	ldr r0, _020102F4 ; =_0210F64C
	str r1, [r0, #0x38]
	ldrh r0, [r4, #0x24]
	bl sub_0200FCDC
	ldr r1, _020102F8 ; =_0210F684
	add r0, r4, #0
	bl sub_0201289C
	mov r0, #0
	str r0, [r4, #0x28]
	str r0, [r4, #0x2c]
	pop {r4, pc}
_020102EA:
	bl sub_020128E0
	pop {r4, pc}
	.balign 4, 0
_020102F0: .word _020F5D68
_020102F4: .word _0210F64C
_020102F8: .word _0210F684
	thumb_func_end FadeFunc_09

	thumb_func_start FadeFunc_10
FadeFunc_10: ; 0x020102FC
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0xc]
	cmp r1, #0
	bne _02010324
	ldr r1, _0201032C ; =_020F5D80
	ldr r0, _02010330 ; =_0210F64C
	str r1, [r0, #0x48]
	ldrh r0, [r4, #0x24]
	bl sub_0200FCDC
	ldr r1, _02010334 ; =_0210F694
	add r0, r4, #0
	bl sub_0201289C
	mov r0, #1
	str r0, [r4, #0x28]
	mov r0, #0
	str r0, [r4, #0x2c]
	pop {r4, pc}
_02010324:
	bl sub_020128E0
	pop {r4, pc}
	nop
_0201032C: .word _020F5D80
_02010330: .word _0210F64C
_02010334: .word _0210F694
	thumb_func_end FadeFunc_10

	thumb_func_start FadeFunc_11
FadeFunc_11: ; 0x02010338
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0xc]
	cmp r1, #0
	bne _0201035E
	ldr r1, _02010364 ; =_020F5DB8
	ldr r0, _02010368 ; =_0210F64C
	str r1, [r0, #0x40]
	ldrh r0, [r4, #0x24]
	bl sub_0200FCDC
	ldr r1, _0201036C ; =_0210F68C
	add r0, r4, #0
	bl sub_0201289C
	mov r0, #0
	str r0, [r4, #0x28]
	str r0, [r4, #0x2c]
	pop {r4, pc}
_0201035E:
	bl sub_020128E0
	pop {r4, pc}
	.balign 4, 0
_02010364: .word _020F5DB8
_02010368: .word _0210F64C
_0201036C: .word _0210F68C
	thumb_func_end FadeFunc_11

	thumb_func_start FadeFunc_12
FadeFunc_12: ; 0x02010370
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0xc]
	cmp r1, #0
	bne _02010392
	ldrh r0, [r4, #0x24]
	bl sub_0200FCDC
	ldr r1, _02010398 ; =_020F5E5C
	add r0, r4, #0
	bl sub_0201164C
	mov r0, #1
	str r0, [r4, #0x28]
	mov r0, #0
	str r0, [r4, #0x2c]
	pop {r4, pc}
_02010392:
	bl sub_0201169C
	pop {r4, pc}
	.balign 4, 0
_02010398: .word _020F5E5C
	thumb_func_end FadeFunc_12

	thumb_func_start FadeFunc_13
FadeFunc_13: ; 0x0201039C
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0xc]
	cmp r1, #0
	bne _020103BC
	ldrh r0, [r4, #0x24]
	bl sub_0200FCDC
	ldr r1, _020103C4 ; =_020F5E68
	add r0, r4, #0
	bl sub_0201164C
	mov r0, #0
	str r0, [r4, #0x28]
	str r0, [r4, #0x2c]
	pop {r4, pc}
_020103BC:
	bl sub_0201169C
	pop {r4, pc}
	nop
_020103C4: .word _020F5E68
	thumb_func_end FadeFunc_13

	thumb_func_start FadeFunc_14
FadeFunc_14: ; 0x020103C8
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0xc]
	cmp r1, #0
	bne _020103EC
	ldrh r0, [r4, #0x24]
	bl sub_0200FCDC
	ldr r1, _020103F4 ; =_020F5E80
	ldr r2, _020103F8 ; =_020F5E8C
	add r0, r4, #0
	bl sub_020116EC
	mov r0, #1
	str r0, [r4, #0x28]
	mov r0, #0
	str r0, [r4, #0x2c]
	pop {r4, pc}
_020103EC:
	bl sub_02011744
	pop {r4, pc}
	nop
_020103F4: .word _020F5E80
_020103F8: .word _020F5E8C
	thumb_func_end FadeFunc_14

	thumb_func_start FadeFunc_15
FadeFunc_15: ; 0x020103FC
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0xc]
	cmp r1, #0
	bne _0201041E
	ldrh r0, [r4, #0x24]
	bl sub_0200FCDC
	ldr r1, _02010424 ; =_020F5EA4
	ldr r2, _02010428 ; =_020F5EB0
	add r0, r4, #0
	bl sub_020116EC
	mov r0, #0
	str r0, [r4, #0x28]
	str r0, [r4, #0x2c]
	pop {r4, pc}
_0201041E:
	bl sub_02011744
	pop {r4, pc}
	.balign 4, 0
_02010424: .word _020F5EA4
_02010428: .word _020F5EB0
	thumb_func_end FadeFunc_15

	thumb_func_start FadeFunc_16
FadeFunc_16: ; 0x0201042C
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0xc]
	cmp r1, #0
	bne _0201044E
	ldrh r0, [r4, #0x24]
	bl sub_0200FCDC
	ldr r1, _02010454 ; =_020F5EC8
	add r0, r4, #0
	bl sub_02011884
	mov r0, #1
	str r0, [r4, #0x28]
	mov r0, #0
	str r0, [r4, #0x2c]
	pop {r4, pc}
_0201044E:
	bl sub_020118BC
	pop {r4, pc}
	.balign 4, 0
_02010454: .word _020F5EC8
	thumb_func_end FadeFunc_16

	thumb_func_start FadeFunc_17
FadeFunc_17: ; 0x02010458
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0xc]
	cmp r1, #0
	bne _02010478
	ldrh r0, [r4, #0x24]
	bl sub_0200FCDC
	ldr r1, _02010480 ; =_020F5ED4
	add r0, r4, #0
	bl sub_02011884
	mov r0, #0
	str r0, [r4, #0x28]
	str r0, [r4, #0x2c]
	pop {r4, pc}
_02010478:
	bl sub_020118BC
	pop {r4, pc}
	nop
_02010480: .word _020F5ED4
	thumb_func_end FadeFunc_17

	thumb_func_start FadeFunc_18
FadeFunc_18: ; 0x02010484
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0xc]
	cmp r1, #0
	bne _020104A6
	ldrh r0, [r4, #0x24]
	bl sub_0200FCDC
	ldr r1, _020104AC ; =_020F5DD8
	add r0, r4, #0
	bl sub_02011884
	mov r0, #1
	str r0, [r4, #0x28]
	mov r0, #0
	str r0, [r4, #0x2c]
	pop {r4, pc}
_020104A6:
	bl sub_020118BC
	pop {r4, pc}
	.balign 4, 0
_020104AC: .word _020F5DD8
	thumb_func_end FadeFunc_18

	thumb_func_start FadeFunc_19
FadeFunc_19: ; 0x020104B0
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0xc]
	cmp r1, #0
	bne _020104D0
	ldrh r0, [r4, #0x24]
	bl sub_0200FCDC
	ldr r1, _020104D8 ; =_020F5DE4
	add r0, r4, #0
	bl sub_02011884
	mov r0, #0
	str r0, [r4, #0x28]
	str r0, [r4, #0x2c]
	pop {r4, pc}
_020104D0:
	bl sub_020118BC
	pop {r4, pc}
	nop
_020104D8: .word _020F5DE4
	thumb_func_end FadeFunc_19

	thumb_func_start FadeFunc_20
FadeFunc_20: ; 0x020104DC
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0xc]
	cmp r1, #0
	bne _020104FE
	ldrh r0, [r4, #0x24]
	bl sub_0200FCDC
	ldr r1, _02010504 ; =_020F5DD0
	add r0, r4, #0
	bl sub_02011B5C
	mov r0, #1
	str r0, [r4, #0x28]
	mov r0, #0
	str r0, [r4, #0x2c]
	pop {r4, pc}
_020104FE:
	bl sub_02011B94
	pop {r4, pc}
	.balign 4, 0
_02010504: .word _020F5DD0
	thumb_func_end FadeFunc_20

	thumb_func_start FadeFunc_21
FadeFunc_21: ; 0x02010508
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0xc]
	cmp r1, #0
	bne _02010528
	ldrh r0, [r4, #0x24]
	bl sub_0200FCDC
	ldr r1, _02010530 ; =_020F5DC8
	add r0, r4, #0
	bl sub_02011B5C
	mov r0, #0
	str r0, [r4, #0x28]
	str r0, [r4, #0x2c]
	pop {r4, pc}
_02010528:
	bl sub_02011B94
	pop {r4, pc}
	nop
_02010530: .word _020F5DC8
	thumb_func_end FadeFunc_21

	thumb_func_start FadeFunc_22
FadeFunc_22: ; 0x02010534
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0xc]
	cmp r1, #0
	bne _02010556
	ldrh r0, [r4, #0x24]
	bl sub_0200FCDC
	ldr r1, _0201055C ; =_020F5E08
	add r0, r4, #0
	bl sub_0201164C
	mov r0, #1
	str r0, [r4, #0x28]
	mov r0, #0
	str r0, [r4, #0x2c]
	pop {r4, pc}
_02010556:
	bl sub_0201169C
	pop {r4, pc}
	.balign 4, 0
_0201055C: .word _020F5E08
	thumb_func_end FadeFunc_22

	thumb_func_start FadeFunc_23
FadeFunc_23: ; 0x02010560
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0xc]
	cmp r1, #0
	bne _02010580
	ldrh r0, [r4, #0x24]
	bl sub_0200FCDC
	ldr r1, _02010588 ; =_020F5E14
	add r0, r4, #0
	bl sub_0201164C
	mov r0, #0
	str r0, [r4, #0x28]
	str r0, [r4, #0x2c]
	pop {r4, pc}
_02010580:
	bl sub_0201169C
	pop {r4, pc}
	nop
_02010588: .word _020F5E14
	thumb_func_end FadeFunc_23

	thumb_func_start FadeFunc_24
FadeFunc_24: ; 0x0201058C
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0xc]
	cmp r1, #0
	bne _020105AE
	ldrh r0, [r4, #0x24]
	bl sub_0200FCDC
	ldr r1, _020105B4 ; =_020F5E20
	add r0, r4, #0
	bl sub_0201164C
	mov r0, #1
	str r0, [r4, #0x28]
	mov r0, #0
	str r0, [r4, #0x2c]
	pop {r4, pc}
_020105AE:
	bl sub_0201169C
	pop {r4, pc}
	.balign 4, 0
_020105B4: .word _020F5E20
	thumb_func_end FadeFunc_24

	thumb_func_start FadeFunc_25
FadeFunc_25: ; 0x020105B8
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0xc]
	cmp r1, #0
	bne _020105D8
	ldrh r0, [r4, #0x24]
	bl sub_0200FCDC
	ldr r1, _020105E0 ; =_020F5E44
	add r0, r4, #0
	bl sub_0201164C
	mov r0, #0
	str r0, [r4, #0x28]
	str r0, [r4, #0x2c]
	pop {r4, pc}
_020105D8:
	bl sub_0201169C
	pop {r4, pc}
	nop
_020105E0: .word _020F5E44
	thumb_func_end FadeFunc_25

	thumb_func_start FadeFunc_26
FadeFunc_26: ; 0x020105E4
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0xc]
	cmp r1, #0
	bne _02010606
	ldrh r0, [r4, #0x24]
	bl sub_0200FCDC
	ldr r1, _0201060C ; =_020F5DA8
	add r0, r4, #0
	bl sub_02011D60
	mov r0, #1
	str r0, [r4, #0x28]
	mov r0, #0
	str r0, [r4, #0x2c]
	pop {r4, pc}
_02010606:
	bl sub_02011D98
	pop {r4, pc}
	.balign 4, 0
_0201060C: .word _020F5DA8
	thumb_func_end FadeFunc_26

	thumb_func_start FadeFunc_27
FadeFunc_27: ; 0x02010610
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0xc]
	cmp r1, #0
	bne _02010630
	ldrh r0, [r4, #0x24]
	bl sub_0200FCDC
	ldr r1, _02010638 ; =_020F5DA0
	add r0, r4, #0
	bl sub_02011D60
	mov r0, #0
	str r0, [r4, #0x28]
	str r0, [r4, #0x2c]
	pop {r4, pc}
_02010630:
	bl sub_02011D98
	pop {r4, pc}
	nop
_02010638: .word _020F5DA0
	thumb_func_end FadeFunc_27

	thumb_func_start FadeFunc_28
FadeFunc_28: ; 0x0201063C
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	ldr r1, [r4, #0xc]
	cmp r1, #0
	bne _02010680
	ldr r0, _02010688 ; =_020F5EEC
	mov r1, #4
	str r0, [sp]
	ldr r0, _0201068C ; =_020F5EFC
	str r0, [sp, #4]
	add r0, sp, #0
	strh r1, [r0, #8]
	mov r1, #0
	strh r1, [r0, #0xa]
	mov r1, #0x3f
	strb r1, [r0, #0xc]
	mov r1, #0x20
	strb r1, [r0, #0xd]
	mov r1, #1
	strh r1, [r0, #0xe]
	ldrh r0, [r4, #0x24]
	bl sub_0200FCDC
	add r0, r4, #0
	add r1, sp, #0
	bl sub_02011FF8
	mov r0, #1
	str r0, [r4, #0x28]
	mov r0, #0
	add sp, #0x10
	str r0, [r4, #0x2c]
	pop {r4, pc}
_02010680:
	bl sub_02012030
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
_02010688: .word _020F5EEC
_0201068C: .word _020F5EFC
	thumb_func_end FadeFunc_28

	thumb_func_start FadeFunc_29
FadeFunc_29: ; 0x02010690
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	ldr r1, [r4, #0xc]
	cmp r1, #0
	bne _020106D0
	ldr r0, _020106D8 ; =_020F5F0C
	mov r1, #4
	str r0, [sp]
	ldr r0, _020106DC ; =_020F5F1C
	mov r2, #0
	str r0, [sp, #4]
	add r0, sp, #0
	strh r1, [r0, #8]
	strh r2, [r0, #0xa]
	mov r1, #0x3f
	strb r1, [r0, #0xc]
	mov r1, #0x20
	strb r1, [r0, #0xd]
	strh r2, [r0, #0xe]
	ldrh r0, [r4, #0x24]
	bl sub_0200FCDC
	add r0, r4, #0
	add r1, sp, #0
	bl sub_02011FF8
	mov r0, #0
	str r0, [r4, #0x28]
	add sp, #0x10
	str r0, [r4, #0x2c]
	pop {r4, pc}
_020106D0:
	bl sub_02012030
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
_020106D8: .word _020F5F0C
_020106DC: .word _020F5F1C
	thumb_func_end FadeFunc_29

	thumb_func_start FadeFunc_30
FadeFunc_30: ; 0x020106E0
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0xc]
	cmp r1, #0
	bne _02010708
	ldr r1, _02010710 ; =_020F5EBC
	ldr r0, _02010714 ; =_0210F64C
	str r1, [r0, #0x30]
	ldrh r0, [r4, #0x24]
	bl sub_0200FCDC
	ldr r1, _02010718 ; =_0210F67C
	add r0, r4, #0
	bl sub_0201289C
	mov r0, #1
	str r0, [r4, #0x28]
	mov r0, #0
	str r0, [r4, #0x2c]
	pop {r4, pc}
_02010708:
	bl sub_020128E0
	pop {r4, pc}
	nop
_02010710: .word _020F5EBC
_02010714: .word _0210F64C
_02010718: .word _0210F67C
	thumb_func_end FadeFunc_30

	thumb_func_start FadeFunc_31
FadeFunc_31: ; 0x0201071C
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0xc]
	cmp r1, #0
	bne _02010742
	ldr r1, _02010748 ; =_020F5DF0
	ldr r0, _0201074C ; =_0210F64C
	str r1, [r0, #0x18]
	ldrh r0, [r4, #0x24]
	bl sub_0200FCDC
	ldr r1, _02010750 ; =_0210F664
	add r0, r4, #0
	bl sub_0201289C
	mov r0, #0
	str r0, [r4, #0x28]
	str r0, [r4, #0x2c]
	pop {r4, pc}
_02010742:
	bl sub_020128E0
	pop {r4, pc}
	.balign 4, 0
_02010748: .word _020F5DF0
_0201074C: .word _0210F64C
_02010750: .word _0210F664
	thumb_func_end FadeFunc_31

	thumb_func_start FadeFunc_32
FadeFunc_32: ; 0x02010754
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	ldr r1, [r4, #0xc]
	cmp r1, #0
	bne _0201078E
	ldr r1, _02010798 ; =_020F5D58
	add r0, sp, #0
	ldrh r2, [r1, #0x30]
	strh r2, [r0]
	ldrh r2, [r1, #0x32]
	strh r2, [r0, #2]
	ldrh r2, [r1, #0x34]
	ldrh r1, [r1, #0x36]
	strh r2, [r0, #4]
	strh r1, [r0, #6]
	ldrh r0, [r4, #0x24]
	bl sub_0200FCDC
	add r0, r4, #0
	add r1, sp, #0
	bl sub_020122B8
	mov r0, #1
	str r0, [r4, #0x28]
	mov r0, #0
	add sp, #8
	str r0, [r4, #0x2c]
	pop {r4, pc}
_0201078E:
	bl sub_020122F8
	add sp, #8
	pop {r4, pc}
	nop
_02010798: .word _020F5D58
	thumb_func_end FadeFunc_32

	thumb_func_start FadeFunc_33
FadeFunc_33: ; 0x0201079C
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	ldr r1, [r4, #0xc]
	cmp r1, #0
	bne _020107D4
	ldr r1, _020107DC ; =_020F5D98
	add r0, sp, #0
	ldrh r2, [r1, #0x28]
	strh r2, [r0]
	ldrh r2, [r1, #0x2a]
	strh r2, [r0, #2]
	ldrh r2, [r1, #0x2c]
	ldrh r1, [r1, #0x2e]
	strh r2, [r0, #4]
	strh r1, [r0, #6]
	ldrh r0, [r4, #0x24]
	bl sub_0200FCDC
	add r0, r4, #0
	add r1, sp, #0
	bl sub_020122B8
	mov r0, #0
	str r0, [r4, #0x28]
	add sp, #8
	str r0, [r4, #0x2c]
	pop {r4, pc}
_020107D4:
	bl sub_020122F8
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
_020107DC: .word _020F5D98
	thumb_func_end FadeFunc_33

	thumb_func_start FadeFunc_34
FadeFunc_34: ; 0x020107E0
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	ldr r1, [r4, #0xc]
	cmp r1, #0
	bne _0201081A
	ldr r1, _02010824 ; =_020F5D58
	add r0, sp, #0
	ldrh r2, [r1, #0x20]
	strh r2, [r0]
	ldrh r2, [r1, #0x22]
	strh r2, [r0, #2]
	ldrh r2, [r1, #0x24]
	ldrh r1, [r1, #0x26]
	strh r2, [r0, #4]
	strh r1, [r0, #6]
	ldrh r0, [r4, #0x24]
	bl sub_0200FCDC
	add r0, r4, #0
	add r1, sp, #0
	bl sub_020125EC
	mov r0, #1
	str r0, [r4, #0x28]
	mov r0, #0
	add sp, #8
	str r0, [r4, #0x2c]
	pop {r4, pc}
_0201081A:
	bl sub_0201262C
	add sp, #8
	pop {r4, pc}
	nop
_02010824: .word _020F5D58
	thumb_func_end FadeFunc_34

	thumb_func_start FadeFunc_35
FadeFunc_35: ; 0x02010828
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	ldr r1, [r4, #0xc]
	cmp r1, #0
	bne _02010860
	ldr r1, _02010868 ; =_020F5D58
	add r0, sp, #0
	ldrh r2, [r1, #0x18]
	strh r2, [r0]
	ldrh r2, [r1, #0x1a]
	strh r2, [r0, #2]
	ldrh r2, [r1, #0x1c]
	ldrh r1, [r1, #0x1e]
	strh r2, [r0, #4]
	strh r1, [r0, #6]
	ldrh r0, [r4, #0x24]
	bl sub_0200FCDC
	add r0, r4, #0
	add r1, sp, #0
	bl sub_020125EC
	mov r0, #0
	str r0, [r4, #0x28]
	add sp, #8
	str r0, [r4, #0x2c]
	pop {r4, pc}
_02010860:
	bl sub_0201262C
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
_02010868: .word _020F5D58
	thumb_func_end FadeFunc_35

	thumb_func_start FadeFunc_36
FadeFunc_36: ; 0x0201086C
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0xc]
	cmp r1, #0
	bne _0201088E
	ldrh r0, [r4, #0x24]
	bl sub_0200FCDC
	ldr r1, _02010894 ; =_020F5E98
	add r0, r4, #0
	bl sub_02011884
	mov r0, #1
	str r0, [r4, #0x28]
	mov r0, #0
	str r0, [r4, #0x2c]
	pop {r4, pc}
_0201088E:
	bl sub_020118BC
	pop {r4, pc}
	.balign 4, 0
_02010894: .word _020F5E98
	thumb_func_end FadeFunc_36

	thumb_func_start FadeFunc_37
FadeFunc_37: ; 0x02010898
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0xc]
	cmp r1, #0
	bne _020108B8
	ldrh r0, [r4, #0x24]
	bl sub_0200FCDC
	ldr r1, _020108C0 ; =_020F5EE0
	add r0, r4, #0
	bl sub_02011884
	mov r0, #0
	str r0, [r4, #0x28]
	str r0, [r4, #0x2c]
	pop {r4, pc}
_020108B8:
	bl sub_020118BC
	pop {r4, pc}
	nop
_020108C0: .word _020F5EE0
	thumb_func_end FadeFunc_37

	thumb_func_start FadeFunc_38
FadeFunc_38: ; 0x020108C4
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0xc]
	cmp r1, #0
	bne _020108E6
	ldrh r0, [r4, #0x24]
	bl sub_0200FCDC
	ldr r1, _020108EC ; =_020F5DFC
	add r0, r4, #0
	bl sub_0201164C
	mov r0, #1
	str r0, [r4, #0x28]
	mov r0, #0
	str r0, [r4, #0x2c]
	pop {r4, pc}
_020108E6:
	bl sub_0201169C
	pop {r4, pc}
	.balign 4, 0
_020108EC: .word _020F5DFC
	thumb_func_end FadeFunc_38

	thumb_func_start FadeFunc_39
FadeFunc_39: ; 0x020108F0
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0xc]
	cmp r1, #0
	bne _02010910
	ldrh r0, [r4, #0x24]
	bl sub_0200FCDC
	ldr r1, _02010918 ; =_020F5E50
	add r0, r4, #0
	bl sub_0201164C
	mov r0, #0
	str r0, [r4, #0x28]
	str r0, [r4, #0x2c]
	pop {r4, pc}
_02010910:
	bl sub_0201169C
	pop {r4, pc}
	nop
_02010918: .word _020F5E50
	thumb_func_end FadeFunc_39

	thumb_func_start FadeFunc_40
FadeFunc_40: ; 0x0201091C
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0xc]
	cmp r1, #0
	bne _02010944
	ldr r1, _0201094C ; =_020F5D98
	ldr r0, _02010950 ; =_0210F64C
	str r1, [r0, #0x5c]
	ldrh r0, [r4, #0x24]
	bl sub_0200FCDC
	ldr r1, _02010954 ; =_0210F69C
	add r0, r4, #0
	bl sub_02012B1C
	mov r0, #1
	str r0, [r4, #0x28]
	mov r0, #0
	str r0, [r4, #0x2c]
	pop {r4, pc}
_02010944:
	bl sub_02012B80
	pop {r4, pc}
	nop
_0201094C: .word _020F5D98
_02010950: .word _0210F64C
_02010954: .word _0210F69C
	thumb_func_end FadeFunc_40

	thumb_func_start FadeFunc_41
FadeFunc_41: ; 0x02010958
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0xc]
	cmp r1, #0
	bne _0201097E
	ldr r1, _02010984 ; =_020F5DB0
	ldr r0, _02010988 ; =_0210F64C
	str r1, [r0, #0x74]
	ldrh r0, [r4, #0x24]
	bl sub_0200FCDC
	ldr r1, _0201098C ; =_0210F6B4
	add r0, r4, #0
	bl sub_02012B1C
	mov r0, #0
	str r0, [r4, #0x28]
	str r0, [r4, #0x2c]
	pop {r4, pc}
_0201097E:
	bl sub_02012B80
	pop {r4, pc}
	.balign 4, 0
_02010984: .word _020F5DB0
_02010988: .word _0210F64C
_0201098C: .word _0210F6B4
	thumb_func_end FadeFunc_41

	thumb_func_start FadeFunc_42
FadeFunc_42: ; 0x02010990
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0xc]
	cmp r1, #0
	bne _020109B2
	ldrh r0, [r4, #0x24]
	bl sub_0200FCDC
	ldr r1, _020109B8 ; =_020F5E74
	add r0, r4, #0
	bl sub_02012DD8
	mov r0, #1
	str r0, [r4, #0x28]
	mov r0, #0
	str r0, [r4, #0x2c]
	pop {r4, pc}
_020109B2:
	bl sub_02012E10
	pop {r4, pc}
	.balign 4, 0
_020109B8: .word _020F5E74
	thumb_func_end FadeFunc_42

	thumb_func_start sub_020109BC
sub_020109BC: ; 0x020109BC
	asr r0, r0, #4
	lsl r1, r0, #1
	lsl r0, r1, #1
	ldr r2, _020109D0 ; =FX_SinCosTable_
	add r1, r1, #1
	lsl r1, r1, #1
	ldr r3, _020109D4 ; =FX_Div
	ldrsh r0, [r2, r0]
	ldrsh r1, [r2, r1]
	bx r3
	.balign 4, 0
_020109D0: .word FX_SinCosTable_
_020109D4: .word FX_Div
	thumb_func_end sub_020109BC

	thumb_func_start sub_020109D8
sub_020109D8: ; 0x020109D8
	push {r4, lr}
	add r4, r1, #0
	bl sub_020109BC
	lsl r2, r4, #0xc
	asr r1, r0, #0x1f
	asr r3, r2, #0x1f
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r2, r0, r2
	adc r1, r3
	lsl r0, r1, #0x14
	lsr r1, r2, #0xc
	orr r1, r0
	asr r0, r1, #0xc
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020109D8

	thumb_func_start sub_02010A00
sub_02010A00: ; 0x02010A00
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r1, #0
	add r7, r2, #0
	add r6, r3, #0
	bl sub_020109BC
	cmp r6, r7
	bge _02010A4A
	lsl r1, r6, #2
	str r0, [sp]
	asr r0, r0, #0x1f
	lsl r4, r6, #0xc
	add r5, r5, r1
	str r0, [sp, #4]
_02010A1E:
	ldr r0, [sp]
	ldr r1, [sp, #4]
	asr r3, r4, #0x1f
	add r2, r4, #0
	bl _ll_mul
	mov r2, #2
	lsl r2, r2, #0xa
	add r0, r0, r2
	ldr r2, _02010A50 ; =0x00000000
	adc r1, r2
	lsl r1, r1, #0x14
	lsr r0, r0, #0xc
	orr r0, r1
	asr r0, r0, #0xc
	stmia r5!, {r0}
	mov r0, #1
	lsl r0, r0, #0xc
	add r6, r6, #1
	add r4, r4, r0
	cmp r6, r7
	blt _02010A1E
_02010A4A:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02010A50: .word 0x00000000
	thumb_func_end sub_02010A00

	thumb_func_start sub_02010A54
sub_02010A54: ; 0x02010A54
	push {r4, lr}
	add r4, r1, #0
	bl sub_020109BC
	add r1, r0, #0
	lsr r0, r4, #0x1f
	add r0, r4, r0
	asr r0, r0, #1
	lsl r0, r0, #0xc
	bl FX_Div
	pop {r4, pc}
	thumb_func_end sub_02010A54

	thumb_func_start sub_02010A6C
sub_02010A6C: ; 0x02010A6C
	ldr r3, _02010A78 ; =_s32_div_f
	sub r0, r1, r0
	lsl r0, r0, #7
	add r1, r2, #0
	bx r3
	nop
_02010A78: .word _s32_div_f
	thumb_func_end sub_02010A6C

	thumb_func_start sub_02010A7C
sub_02010A7C: ; 0x02010A7C
	add r0, r0, r1
	bpl _02010A82
	mov r0, #0
_02010A82:
	cmp r0, #0xff
	ble _02010A88
	mov r0, #0xff
_02010A88:
	bx lr
	.balign 4, 0
	thumb_func_end sub_02010A7C

	thumb_func_start sub_02010A8C
sub_02010A8C: ; 0x02010A8C
	ldr r3, [r0]
	ldr r2, [r1]
	add r2, r3, r2
	str r2, [r0]
	ldr r3, [r0, #4]
	ldr r2, [r1, #4]
	add r2, r3, r2
	str r2, [r0, #4]
	ldr r3, [r0, #8]
	ldr r2, [r1, #8]
	add r2, r3, r2
	str r2, [r0, #8]
	ldr r2, [r0, #0xc]
	ldr r1, [r1, #0xc]
	add r1, r2, r1
	str r1, [r0, #0xc]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02010A8C

	thumb_func_start sub_02010AB0
sub_02010AB0: ; 0x02010AB0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r3, #0
	add r6, r2, #0
	ldrb r2, [r5]
	ldr r4, [sp, #0x18]
	ldr r7, [sp, #0x1c]
	lsl r2, r2, #7
	str r2, [r0]
	ldrb r2, [r5, #1]
	lsl r2, r2, #7
	str r2, [r0, #4]
	ldrb r2, [r5, #2]
	lsl r2, r2, #7
	str r2, [r0, #8]
	ldrb r2, [r5, #3]
	lsl r2, r2, #7
	str r2, [r0, #0xc]
	ldrb r0, [r4]
	add r2, r7, #0
	str r0, [r1]
	ldrb r0, [r4, #1]
	str r0, [r1, #4]
	ldrb r0, [r4, #2]
	str r0, [r1, #8]
	ldrb r0, [r4, #3]
	str r0, [r1, #0xc]
	ldrb r0, [r5]
	ldrb r1, [r4]
	bl sub_02010A6C
	str r0, [r6]
	ldrb r0, [r5, #1]
	ldrb r1, [r4, #1]
	add r2, r7, #0
	bl sub_02010A6C
	str r0, [r6, #4]
	ldrb r0, [r5, #2]
	ldrb r1, [r4, #2]
	add r2, r7, #0
	bl sub_02010A6C
	str r0, [r6, #8]
	ldrb r0, [r5, #3]
	ldrb r1, [r4, #3]
	add r2, r7, #0
	bl sub_02010A6C
	str r0, [r6, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02010AB0

	thumb_func_start sub_02010B14
sub_02010B14: ; 0x02010B14
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x20]
	add r6, r1, #0
	mov r1, #0x1c
	bl AllocFromHeap
	str r0, [r5, #0x14]
	mov r2, #0x1c
	mov r1, #0
_02010B28:
	strb r1, [r0]
	add r0, r0, #1
	sub r2, r2, #1
	bne _02010B28
	ldr r4, [r5, #0x14]
	cmp r6, #0
	ldrh r1, [r5, #0x24]
	ldr r0, _02010BB0 ; =0x00007FFF
	bne _02010B5C
	cmp r1, r0
	bne _02010B44
	mov r7, #0x10
	mov r6, #0
	b _02010B7C
_02010B44:
	cmp r1, #0
	bne _02010B50
	mov r7, #0xf
	mvn r7, r7
	mov r6, #0
	b _02010B7C
_02010B50:
	mov r7, #0xf
	mvn r7, r7
	mov r6, #0
	bl GF_AssertFail
	b _02010B7C
_02010B5C:
	cmp r1, r0
	bne _02010B66
	mov r7, #0
	mov r6, #0x10
	b _02010B7C
_02010B66:
	cmp r1, #0
	bne _02010B72
	mov r7, #0
	add r6, r7, #0
	sub r6, #0x10
	b _02010B7C
_02010B72:
	mov r7, #0
	add r6, r7, #0
	sub r6, #0x10
	bl GF_AssertFail
_02010B7C:
	ldr r0, [r5, #0x10]
	add r1, r7, #0
	bl SetMasterBrightness
	ldr r0, [r5, #4]
	add r1, r6, #0
	str r0, [r4]
	ldr r0, [r5, #8]
	str r0, [r4, #4]
	mov r0, #0
	str r0, [r4, #8]
	lsl r0, r7, #7
	str r0, [r4, #0xc]
	lsl r0, r6, #7
	str r0, [r4, #0x10]
	ldr r2, [r5, #4]
	add r0, r7, #0
	bl sub_02010A6C
	str r0, [r4, #0x14]
	ldr r0, [r5, #0x10]
	str r0, [r4, #0x18]
	ldr r0, [r5, #0xc]
	add r0, r0, #1
	str r0, [r5, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02010BB0: .word 0x00007FFF
	thumb_func_end sub_02010B14

	thumb_func_start sub_02010BB4
sub_02010BB4: ; 0x02010BB4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r1, [r5, #0xc]
	mov r4, #0
	ldr r0, [r5, #0x14]
	cmp r1, #1
	beq _02010BCC
	cmp r1, #2
	beq _02010BDC
	cmp r1, #3
	beq _02010BEE
	b _02010BF0
_02010BCC:
	bl sub_02010BF4
	cmp r0, #1
	bne _02010BF0
	ldr r0, [r5, #0xc]
	add r0, r0, #1
	str r0, [r5, #0xc]
	b _02010BF0
_02010BDC:
	bl FreeToHeap
	add r0, r4, #0
	str r0, [r5, #0x14]
	ldr r0, [r5, #0xc]
	mov r4, #1
	add r0, r0, #1
	str r0, [r5, #0xc]
	b _02010BF0
_02010BEE:
	mov r4, #1
_02010BF0:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02010BB4

	thumb_func_start sub_02010BF4
sub_02010BF4: ; 0x02010BF4
	push {r4, lr}
	add r1, r0, #0
	ldr r0, [r1, #8]
	mov r4, #0
	add r2, r0, #1
	str r2, [r1, #8]
	ldr r0, [r1, #4]
	cmp r2, r0
	blt _02010C32
	str r4, [r1, #8]
	ldr r0, [r1]
	sub r0, r0, #1
	cmp r0, #0
	ble _02010C1C
	str r0, [r1]
	ldr r2, [r1, #0xc]
	ldr r0, [r1, #0x14]
	add r0, r2, r0
	str r0, [r1, #0xc]
	b _02010C22
_02010C1C:
	ldr r0, [r1, #0x10]
	mov r4, #1
	str r0, [r1, #0xc]
_02010C22:
	ldr r2, [r1, #0xc]
	ldr r0, [r1, #0x18]
	asr r1, r2, #6
	lsr r1, r1, #0x19
	add r1, r2, r1
	asr r1, r1, #7
	bl SetMasterBrightness
_02010C32:
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02010BF4

	thumb_func_start sub_02010C38
sub_02010C38: ; 0x02010C38
	push {r4, r5, r6, lr}
	add r4, r0, #0
	bne _02010C42
	bl GF_AssertFail
_02010C42:
	ldr r0, _02010E54 ; =0x04000006
	ldrh r0, [r0]
	cmp r0, #0xc0
	bge _02010CE8
	add r5, r0, #1
	cmp r5, #0xbf
	ble _02010C52
	sub r5, #0xc0
_02010C52:
	ldr r0, [r4, #4]
	cmp r0, #1
	bne _02010D02
	add r0, r4, #0
	mov r1, #0
	bl sub_02010EE0
	ldr r3, [r4, #8]
	lsl r5, r5, #1
	mov r4, #6
	add r1, r0, r5
	lsl r4, r4, #6
	ldrsh r2, [r1, r4]
	lsl r4, r4, #2
	ldrsh r1, [r0, r5]
	ldr r0, [r0, r4]
	cmp r0, #0
	ldr r0, _02010E58 ; =0x04000004
	bne _02010CBC
	cmp r3, #0
	bne _02010C9C
	ldrh r4, [r0]
	mov r3, #2
	tst r3, r4
	beq _02010CE8
	lsl r3, r1, #8
	mov r1, #0xff
	lsl r1, r1, #8
	and r3, r1
	lsl r1, r2, #0x18
	lsr r1, r1, #0x18
	orr r1, r3
	strh r1, [r0, #0x3c]
	mov r1, #0xc0
	add r0, #0x40
	strh r1, [r0]
	pop {r4, r5, r6, pc}
_02010C9C:
	ldrh r3, [r0]
	mov r0, #2
	tst r0, r3
	beq _02010CE8
	mov r0, #0xff
	lsl r1, r1, #8
	lsl r0, r0, #8
	and r1, r0
	lsl r0, r2, #0x18
	lsr r0, r0, #0x18
	orr r0, r1
	ldr r1, _02010E5C ; =0x04001040
	strh r0, [r1]
	mov r0, #0xc0
	strh r0, [r1, #4]
	pop {r4, r5, r6, pc}
_02010CBC:
	cmp r3, #0
	bne _02010CE0
	ldrh r4, [r0]
	mov r3, #2
	tst r3, r4
	beq _02010CE8
	lsl r3, r1, #8
	mov r1, #0xff
	lsl r1, r1, #8
	and r3, r1
	lsl r1, r2, #0x18
	lsr r1, r1, #0x18
	orr r1, r3
	strh r1, [r0, #0x3e]
	mov r1, #0xc0
	add r0, #0x42
	strh r1, [r0]
	pop {r4, r5, r6, pc}
_02010CE0:
	ldrh r3, [r0]
	mov r0, #2
	tst r0, r3
	bne _02010CEA
_02010CE8:
	b _02010E50
_02010CEA:
	mov r0, #0xff
	lsl r1, r1, #8
	lsl r0, r0, #8
	and r1, r0
	lsl r0, r2, #0x18
	lsr r0, r0, #0x18
	orr r0, r1
	ldr r1, _02010E60 ; =0x04001042
	strh r0, [r1]
	mov r0, #0xc0
	strh r0, [r1, #4]
	pop {r4, r5, r6, pc}
_02010D02:
	add r0, r4, #0
	mov r1, #0
	bl sub_02010EE0
	add r3, r0, #0
	lsl r5, r5, #1
	mov r6, #6
	add r1, r3, r5
	lsl r6, r6, #6
	ldrsh r2, [r1, r6]
	lsl r6, r6, #2
	ldrsh r1, [r3, r5]
	ldr r3, [r3, r6]
	ldr r0, [r4, #8]
	cmp r3, #0
	bne _02010D68
	cmp r0, #0
	ldr r0, _02010E58 ; =0x04000004
	bne _02010D48
	ldrh r6, [r0]
	mov r3, #2
	tst r3, r6
	beq _02010DAC
	lsl r3, r1, #8
	mov r1, #0xff
	lsl r1, r1, #8
	and r3, r1
	lsl r1, r2, #0x18
	lsr r1, r1, #0x18
	orr r1, r3
	strh r1, [r0, #0x3c]
	mov r1, #0xc0
	add r0, #0x40
	strh r1, [r0]
	b _02010DAC
_02010D48:
	ldrh r3, [r0]
	mov r0, #2
	tst r0, r3
	beq _02010DAC
	mov r0, #0xff
	lsl r1, r1, #8
	lsl r0, r0, #8
	and r1, r0
	lsl r0, r2, #0x18
	lsr r0, r0, #0x18
	orr r0, r1
	ldr r1, _02010E5C ; =0x04001040
	strh r0, [r1]
	mov r0, #0xc0
	strh r0, [r1, #4]
	b _02010DAC
_02010D68:
	cmp r0, #0
	ldr r0, _02010E58 ; =0x04000004
	bne _02010D8E
	ldrh r6, [r0]
	mov r3, #2
	tst r3, r6
	beq _02010DAC
	lsl r3, r1, #8
	mov r1, #0xff
	lsl r1, r1, #8
	and r3, r1
	lsl r1, r2, #0x18
	lsr r1, r1, #0x18
	orr r1, r3
	strh r1, [r0, #0x3e]
	mov r1, #0xc0
	add r0, #0x42
	strh r1, [r0]
	b _02010DAC
_02010D8E:
	ldrh r3, [r0]
	mov r0, #2
	tst r0, r3
	beq _02010DAC
	mov r0, #0xff
	lsl r1, r1, #8
	lsl r0, r0, #8
	and r1, r0
	lsl r0, r2, #0x18
	lsr r0, r0, #0x18
	orr r0, r1
	ldr r1, _02010E60 ; =0x04001042
	strh r0, [r1]
	mov r0, #0xc0
	strh r0, [r1, #4]
_02010DAC:
	add r0, r4, #0
	mov r1, #1
	bl sub_02010EE0
	ldr r3, [r4, #8]
	mov r4, #6
	add r1, r0, r5
	lsl r4, r4, #6
	ldrsh r2, [r1, r4]
	lsl r4, r4, #2
	ldrsh r1, [r0, r5]
	ldr r0, [r0, r4]
	cmp r0, #0
	ldr r0, _02010E58 ; =0x04000004
	bne _02010E0E
	cmp r3, #0
	bne _02010DEE
	ldrh r4, [r0]
	mov r3, #2
	tst r3, r4
	beq _02010E50
	lsl r3, r1, #8
	mov r1, #0xff
	lsl r1, r1, #8
	and r3, r1
	lsl r1, r2, #0x18
	lsr r1, r1, #0x18
	orr r1, r3
	strh r1, [r0, #0x3c]
	mov r1, #0xc0
	add r0, #0x40
	strh r1, [r0]
	pop {r4, r5, r6, pc}
_02010DEE:
	ldrh r3, [r0]
	mov r0, #2
	tst r0, r3
	beq _02010E50
	mov r0, #0xff
	lsl r1, r1, #8
	lsl r0, r0, #8
	and r1, r0
	lsl r0, r2, #0x18
	lsr r0, r0, #0x18
	orr r0, r1
	ldr r1, _02010E5C ; =0x04001040
	strh r0, [r1]
	mov r0, #0xc0
	strh r0, [r1, #4]
	pop {r4, r5, r6, pc}
_02010E0E:
	cmp r3, #0
	bne _02010E32
	ldrh r4, [r0]
	mov r3, #2
	tst r3, r4
	beq _02010E50
	lsl r3, r1, #8
	mov r1, #0xff
	lsl r1, r1, #8
	and r3, r1
	lsl r1, r2, #0x18
	lsr r1, r1, #0x18
	orr r1, r3
	strh r1, [r0, #0x3e]
	mov r1, #0xc0
	add r0, #0x42
	strh r1, [r0]
	pop {r4, r5, r6, pc}
_02010E32:
	ldrh r3, [r0]
	mov r0, #2
	tst r0, r3
	beq _02010E50
	mov r0, #0xff
	lsl r1, r1, #8
	lsl r0, r0, #8
	and r1, r0
	lsl r0, r2, #0x18
	lsr r0, r0, #0x18
	orr r0, r1
	ldr r1, _02010E60 ; =0x04001042
	strh r0, [r1]
	mov r0, #0xc0
	strh r0, [r1, #4]
_02010E50:
	pop {r4, r5, r6, pc}
	nop
_02010E54: .word 0x04000006
_02010E58: .word 0x04000004
_02010E5C: .word 0x04001040
_02010E60: .word 0x04001042
	thumb_func_end sub_02010C38

	thumb_func_start sub_02010E64
sub_02010E64: ; 0x02010E64
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r6, r2, #0
	cmp r4, #0
	beq _02010E7A
	cmp r4, #1
	beq _02010E7A
	cmp r4, #2
	beq _02010E94
	pop {r4, r5, r6, pc}
_02010E7A:
	ldr r1, _02010EC0 ; =0x00000604
	add r0, r3, #0
	bl AllocFromHeap
	str r0, [r5]
	mov r0, #1
	str r0, [r5, #4]
	str r6, [r5, #8]
	mov r0, #6
	ldr r1, [r5]
	lsl r0, r0, #8
	str r4, [r1, r0]
	pop {r4, r5, r6, pc}
_02010E94:
	ldr r1, _02010EC4 ; =0x00000C08
	add r0, r3, #0
	bl AllocFromHeap
	str r0, [r5]
	mov r0, #2
	str r0, [r5, #4]
	mov r0, #6
	mov r3, #0
	lsl r0, r0, #8
	str r6, [r5, #8]
	add r4, r3, #0
	add r1, r0, #4
_02010EAE:
	ldr r2, [r5]
	add r2, r2, r4
	str r3, [r2, r0]
	add r3, r3, #1
	add r4, r4, r1
	cmp r3, #2
	blt _02010EAE
	pop {r4, r5, r6, pc}
	nop
_02010EC0: .word 0x00000604
_02010EC4: .word 0x00000C08
	thumb_func_end sub_02010E64

	thumb_func_start sub_02010EC8
sub_02010EC8: ; 0x02010EC8
	ldr r3, _02010ECC ; =sub_02010ED0
	bx r3
	.balign 4, 0
_02010ECC: .word sub_02010ED0
	thumb_func_end sub_02010EC8

	thumb_func_start sub_02010ED0
sub_02010ED0: ; 0x02010ED0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4]
	pop {r4, pc}
	thumb_func_end sub_02010ED0

	thumb_func_start sub_02010EE0
sub_02010EE0: ; 0x02010EE0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #4]
	add r4, r1, #0
	cmp r0, r4
	bgt _02010EF0
	bl GF_AssertFail
_02010EF0:
	ldr r0, _02010EFC ; =0x00000604
	ldr r1, [r5]
	mul r0, r4
	add r0, r1, r0
	pop {r3, r4, r5, pc}
	nop
_02010EFC: .word 0x00000604
	thumb_func_end sub_02010EE0

	thumb_func_start sub_02010F00
sub_02010F00: ; 0x02010F00
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	str r0, [sp]
	ldr r0, [r5, #4]
	mov r4, #0
	cmp r0, #0
	ble _02010F2C
	mov r7, #3
	lsl r7, r7, #8
	add r6, r7, #0
_02010F14:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02010EE0
	add r1, r0, r6
	add r2, r7, #0
	bl memcpy
	ldr r0, [r5, #4]
	add r4, r4, #1
	cmp r4, r0
	blt _02010F14
_02010F2C:
	ldr r0, [sp]
	bl DestroySysTask
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02010F00

	thumb_func_start sub_02010F34
sub_02010F34: ; 0x02010F34
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r1, #0
	add r4, r2, #0
	cmp r0, #0
	bne _02010F4C
	add r0, r5, #0
	mov r1, #0
	bl sub_02013424
	add sp, #0xc
	pop {r4, r5, pc}
_02010F4C:
	add r0, r5, #0
	mov r1, #1
	bl sub_02013424
	mov r2, #0
	add r0, r5, #0
	mov r1, #0x3f
	add r3, r2, #0
	str r4, [sp]
	bl sub_02013440
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	add r0, r5, #0
	add r2, r1, #0
	add r3, r1, #0
	str r4, [sp, #8]
	bl sub_02013488
	add r0, r5, #0
	mov r1, #0x20
	mov r2, #0
	add r3, r4, #0
	bl sub_02013468
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end sub_02010F34

	thumb_func_start sub_02010F84
sub_02010F84: ; 0x02010F84
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r7, r2, #0
	ldr r2, [sp, #0x34]
	add r6, r0, #0
	add r5, r3, #0
	ldr r4, [sp, #0x20]
	cmp r2, #0
	bne _02010FC0
	add r0, r1, #0
	mov r1, #0
	add r2, r5, #0
	add r3, r4, #0
	bl sub_02013220
	add r0, r7, #0
	mov r1, #0
	add r2, r4, #0
	bl sub_020132A8
	str r5, [sp]
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	ldr r3, [sp, #0x30]
	str r4, [sp, #4]
	bl sub_02013364
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_02010FC0:
	mov r2, #0
	str r4, [sp]
	bl sub_02013440
	add r0, r6, #0
	add r1, r7, #0
	mov r2, #0
	add r3, r4, #0
	bl sub_02013468
	ldr r0, [sp, #0x30]
	ldr r1, [sp, #0x24]
	str r0, [sp]
	str r5, [sp, #4]
	ldr r2, [sp, #0x28]
	ldr r3, [sp, #0x2c]
	add r0, r6, #0
	str r4, [sp, #8]
	bl sub_02013488
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end sub_02010F84

	thumb_func_start sub_02010FEC
sub_02010FEC: ; 0x02010FEC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r1, #0
	add r4, r2, #0
	add r6, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	add r7, r3, #0
	bl sub_020132E8
	add r1, sp, #4
	strb r0, [r1, #1]
	ldrb r0, [r1, #1]
	strb r0, [r1, #3]
	add r0, r4, #0
	bl sub_0201333C
	add r1, sp, #4
	strb r0, [r1]
	ldrb r0, [r1]
	cmp r7, #0
	strb r0, [r1, #2]
	bne _0201103E
	ldrb r0, [r1, #2]
	mov r1, #0
	add r2, r5, #0
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x1b
	add r3, r4, #0
	bl sub_02013220
	add r0, sp, #4
	ldrb r0, [r0, #3]
	mov r1, #0
	add r2, r4, #0
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x1b
	bl sub_020132A8
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_0201103E:
	str r4, [sp]
	ldrb r1, [r1, #2]
	add r0, r6, #0
	mov r2, #0
	lsl r1, r1, #0x1b
	lsr r1, r1, #0x1b
	add r3, r5, #0
	bl sub_02013440
	add r1, sp, #4
	ldrb r1, [r1, #3]
	add r0, r6, #0
	mov r2, #0
	lsl r1, r1, #0x1b
	lsr r1, r1, #0x1b
	add r3, r4, #0
	bl sub_02013468
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02010FEC

	thumb_func_start sub_02011068
sub_02011068: ; 0x02011068
	push {r3, lr}
	cmp r3, #0
	bne _02011078
	add r0, r1, #0
	add r1, r2, #0
	bl sub_020131F4
	pop {r3, pc}
_02011078:
	bl sub_02013424
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02011068

	thumb_func_start sub_02011080
sub_02011080: ; 0x02011080
	push {r3, r4, r5, r6, r7, lr}
	add r4, r2, #0
	mov r2, #0xc3
	add r6, r1, #0
	mov r1, #0
	lsl r2, r2, #2
	add r5, r0, #0
	add r7, r3, #0
	bl memset
	cmp r4, #1
	bne _020110AA
	mov r0, #6
	lsl r0, r0, #6
	str r7, [r5, r0]
	mov r0, #0xc2
	lsl r0, r0, #2
	strb r4, [r5, r0]
	add r0, r0, #1
	strb r6, [r5, r0]
	pop {r3, r4, r5, r6, r7, pc}
_020110AA:
	mov r0, #6
	lsl r0, r0, #6
	str r7, [r5, r0]
	mov r0, #0xc1
	ldr r1, [sp, #0x18]
	lsl r0, r0, #2
	str r1, [r5, r0]
	add r1, r0, #4
	strb r4, [r5, r1]
	add r0, r0, #5
	strb r6, [r5, r0]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02011080

	thumb_func_start sub_020110C4
sub_020110C4: ; 0x020110C4
	ldr r3, _020110D0 ; =sub_0200E374
	add r1, r0, #0
	ldr r0, _020110D4 ; =sub_02011104
	ldr r2, _020110D8 ; =0x000003FF
	bx r3
	nop
_020110D0: .word sub_0200E374
_020110D4: .word sub_02011104
_020110D8: .word 0x000003FF
	thumb_func_end sub_020110C4

	thumb_func_start sub_020110DC
sub_020110DC: ; 0x020110DC
	push {r3, lr}
	ldr r3, _020110EC ; =0x00000309
	str r2, [sp]
	ldrb r3, [r1, r3]
	ldr r2, _020110F0 ; =sub_02011130
	bl sub_0200FF88
	pop {r3, pc}
	.balign 4, 0
_020110EC: .word 0x00000309
_020110F0: .word sub_02011130
	thumb_func_end sub_020110DC

	thumb_func_start sub_020110F4
sub_020110F4: ; 0x020110F4
	ldr r3, _020110FC ; =0x00000309
	ldrb r1, [r1, r3]
	ldr r3, _02011100 ; =sub_0200FFB4
	bx r3
	.balign 4, 0
_020110FC: .word 0x00000309
_02011100: .word sub_0200FFB4
	thumb_func_end sub_020110F4

	thumb_func_start sub_02011104
sub_02011104: ; 0x02011104
	push {r3, r4, r5, r6, r7, lr}
	mov r7, #0xc0
	add r6, r7, #0
	str r0, [sp]
	add r5, r1, #0
	mov r4, #0
	add r6, #0xc4
_02011112:
	add r0, r5, #0
	add r0, #0xc0
	add r1, r5, #0
	add r2, r7, #0
	bl memcpy
	add r4, r4, #1
	add r5, r5, r6
	cmp r4, #2
	blt _02011112
	ldr r0, [sp]
	bl DestroySysTask
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02011104

	thumb_func_start sub_02011130
sub_02011130: ; 0x02011130
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bne _0201113A
	bl GF_AssertFail
_0201113A:
	ldr r0, _02011428 ; =0x04000006
	ldrh r0, [r0]
	cmp r0, #0xc0
	bge _020111BC
	add r0, r0, #1
	cmp r0, #0xbf
	ble _0201114A
	sub r0, #0xc0
_0201114A:
	mov r2, #0xc2
	lsl r2, r2, #2
	ldrb r1, [r4, r2]
	cmp r1, #1
	beq _02011156
	b _020112F0
_02011156:
	add r0, r4, r0
	add r0, #0xc0
	ldrb r0, [r0]
	cmp r0, #0
	bne _02011226
	add r0, r2, #1
	ldrb r0, [r4, r0]
	cmp r0, #0
	ldr r0, _0201142C ; =0x04000004
	bne _02011186
	ldrh r2, [r0]
	mov r1, #2
	tst r1, r2
	beq _020111A0
	add r0, #0x46
	ldrh r2, [r0]
	mov r1, #0x3f
	bic r2, r1
	mov r1, #0x3f
	orr r2, r1
	mov r1, #0x20
	orr r1, r2
	strh r1, [r0]
	b _020111A0
_02011186:
	ldrh r1, [r0]
	mov r0, #2
	tst r0, r1
	beq _020111A0
	ldr r1, _02011430 ; =0x0400104A
	mov r0, #0x3f
	ldrh r2, [r1]
	bic r2, r0
	mov r0, #0x3f
	orr r2, r0
	mov r0, #0x20
	orr r0, r2
	strh r0, [r1]
_020111A0:
	ldr r0, _02011434 ; =0x00000309
	ldrb r1, [r4, r0]
	mov r0, #6
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _020111EC
	cmp r1, #0
	bne _020111D0
	ldr r2, _0201142C ; =0x04000004
	mov r0, #2
	ldrh r1, [r2]
	tst r0, r1
	bne _020111BE
_020111BC:
	b _02011634
_020111BE:
	add r2, #0x44
	ldrh r1, [r2]
	mov r0, #0x3f
	bic r1, r0
	mov r0, #0x20
	orr r1, r0
	orr r0, r1
	strh r0, [r2]
	pop {r3, r4, r5, pc}
_020111D0:
	ldr r0, _0201142C ; =0x04000004
	ldrh r1, [r0]
	mov r0, #2
	tst r0, r1
	beq _020112D8
	ldr r1, _02011438 ; =0x04001048
	mov r0, #0x3f
	ldrh r2, [r1]
	bic r2, r0
	mov r0, #0x20
	orr r2, r0
	orr r0, r2
	strh r0, [r1]
	pop {r3, r4, r5, pc}
_020111EC:
	cmp r1, #0
	ldr r0, _0201142C ; =0x04000004
	bne _0201120C
	ldrh r1, [r0]
	mov r2, #2
	tst r1, r2
	beq _020112D8
	add r0, #0x44
	ldrh r3, [r0]
	ldr r1, _0201143C ; =0xFFFFC0FF
	and r3, r1
	lsl r1, r2, #0xc
	orr r3, r1
	orr r1, r3
	strh r1, [r0]
	pop {r3, r4, r5, pc}
_0201120C:
	ldrh r1, [r0]
	mov r0, #2
	tst r0, r1
	beq _020112D8
	ldr r2, _02011438 ; =0x04001048
	ldr r0, _0201143C ; =0xFFFFC0FF
	ldrh r1, [r2]
	and r1, r0
	lsr r0, r2, #0xd
	orr r1, r0
	orr r0, r1
	strh r0, [r2]
	pop {r3, r4, r5, pc}
_02011226:
	add r0, r2, #1
	ldrb r0, [r4, r0]
	cmp r0, #0
	ldr r0, _0201142C ; =0x04000004
	bne _0201124A
	ldrh r2, [r0]
	mov r1, #2
	tst r1, r2
	beq _02011262
	add r0, #0x46
	ldrh r2, [r0]
	mov r1, #0x3f
	bic r2, r1
	mov r1, #0x20
	orr r2, r1
	orr r1, r2
	strh r1, [r0]
	b _02011262
_0201124A:
	ldrh r1, [r0]
	mov r0, #2
	tst r0, r1
	beq _02011262
	ldr r1, _02011430 ; =0x0400104A
	mov r0, #0x3f
	ldrh r2, [r1]
	bic r2, r0
	mov r0, #0x20
	orr r2, r0
	orr r0, r2
	strh r0, [r1]
_02011262:
	ldr r0, _02011434 ; =0x00000309
	ldrb r1, [r4, r0]
	mov r0, #6
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	cmp r0, #0
	ldr r0, _0201142C ; =0x04000004
	bne _020112AE
	cmp r1, #0
	bne _02011292
	ldrh r2, [r0]
	mov r1, #2
	tst r1, r2
	beq _020112D8
	add r0, #0x44
	ldrh r2, [r0]
	mov r1, #0x3f
	bic r2, r1
	mov r1, #0x3f
	orr r2, r1
	mov r1, #0x20
	orr r1, r2
	strh r1, [r0]
	pop {r3, r4, r5, pc}
_02011292:
	ldrh r1, [r0]
	mov r0, #2
	tst r0, r1
	beq _020112D8
	ldr r1, _02011438 ; =0x04001048
	mov r0, #0x3f
	ldrh r2, [r1]
	bic r2, r0
	mov r0, #0x3f
	orr r2, r0
	mov r0, #0x20
	orr r0, r2
	strh r0, [r1]
	pop {r3, r4, r5, pc}
_020112AE:
	cmp r1, #0
	bne _020112D0
	ldrh r1, [r0]
	mov r2, #2
	tst r1, r2
	beq _020112D8
	add r0, #0x44
	ldrh r3, [r0]
	ldr r1, _0201143C ; =0xFFFFC0FF
	and r3, r1
	mov r1, #0x3f
	lsl r1, r1, #8
	orr r3, r1
	lsl r1, r2, #0xc
	orr r1, r3
	strh r1, [r0]
	pop {r3, r4, r5, pc}
_020112D0:
	ldrh r1, [r0]
	mov r0, #2
	tst r0, r1
	bne _020112DA
_020112D8:
	b _02011634
_020112DA:
	ldr r2, _02011438 ; =0x04001048
	ldr r0, _0201143C ; =0xFFFFC0FF
	ldrh r1, [r2]
	and r1, r0
	mov r0, #0x3f
	lsl r0, r0, #8
	orr r1, r0
	lsr r0, r2, #0xd
	orr r0, r1
	strh r0, [r2]
	pop {r3, r4, r5, pc}
_020112F0:
	add r1, r4, r0
	add r1, #0xc0
	ldrb r1, [r1]
	cmp r1, #0
	bne _020113BC
	add r1, r2, #1
	ldrb r1, [r4, r1]
	cmp r1, #0
	ldr r1, _0201142C ; =0x04000004
	bne _02011320
	ldrh r3, [r1]
	mov r2, #2
	tst r2, r3
	beq _0201133A
	add r1, #0x46
	ldrh r3, [r1]
	mov r2, #0x3f
	bic r3, r2
	mov r2, #0x3f
	orr r3, r2
	mov r2, #0x20
	orr r2, r3
	strh r2, [r1]
	b _0201133A
_02011320:
	ldrh r2, [r1]
	mov r1, #2
	tst r1, r2
	beq _0201133A
	ldr r2, _02011430 ; =0x0400104A
	mov r1, #0x3f
	ldrh r3, [r2]
	bic r3, r1
	mov r1, #0x3f
	orr r3, r1
	mov r1, #0x20
	orr r1, r3
	strh r1, [r2]
_0201133A:
	ldr r1, _02011434 ; =0x00000309
	ldrb r2, [r4, r1]
	mov r1, #6
	lsl r1, r1, #6
	ldr r1, [r4, r1]
	cmp r1, #0
	ldr r1, _0201142C ; =0x04000004
	bne _02011382
	cmp r2, #0
	bne _02011368
	ldrh r3, [r1]
	mov r2, #2
	tst r2, r3
	beq _0201138E
	add r1, #0x44
	ldrh r3, [r1]
	mov r2, #0x3f
	bic r3, r2
	mov r2, #0x20
	orr r3, r2
	orr r2, r3
	strh r2, [r1]
	b _0201149A
_02011368:
	ldrh r2, [r1]
	mov r1, #2
	tst r1, r2
	beq _0201138E
	ldr r2, _02011438 ; =0x04001048
	mov r1, #0x3f
	ldrh r3, [r2]
	bic r3, r1
	mov r1, #0x20
	orr r3, r1
	orr r1, r3
	strh r1, [r2]
	b _0201149A
_02011382:
	cmp r2, #0
	bne _020113A2
	ldrh r2, [r1]
	mov r3, #2
	tst r2, r3
	bne _02011390
_0201138E:
	b _0201149A
_02011390:
	add r1, #0x44
	ldrh r5, [r1]
	ldr r2, _0201143C ; =0xFFFFC0FF
	and r5, r2
	lsl r2, r3, #0xc
	orr r5, r2
	orr r2, r5
	strh r2, [r1]
	b _0201149A
_020113A2:
	ldrh r2, [r1]
	mov r1, #2
	tst r1, r2
	beq _0201149A
	ldr r3, _02011438 ; =0x04001048
	ldr r1, _0201143C ; =0xFFFFC0FF
	ldrh r2, [r3]
	and r2, r1
	lsr r1, r3, #0xd
	orr r2, r1
	orr r1, r2
	strh r1, [r3]
	b _0201149A
_020113BC:
	add r1, r2, #1
	ldrb r1, [r4, r1]
	cmp r1, #0
	ldr r1, _0201142C ; =0x04000004
	bne _020113E0
	ldrh r3, [r1]
	mov r2, #2
	tst r2, r3
	beq _020113F8
	add r1, #0x46
	ldrh r3, [r1]
	mov r2, #0x3f
	bic r3, r2
	mov r2, #0x20
	orr r3, r2
	orr r2, r3
	strh r2, [r1]
	b _020113F8
_020113E0:
	ldrh r2, [r1]
	mov r1, #2
	tst r1, r2
	beq _020113F8
	ldr r2, _02011430 ; =0x0400104A
	mov r1, #0x3f
	ldrh r3, [r2]
	bic r3, r1
	mov r1, #0x20
	orr r3, r1
	orr r1, r3
	strh r1, [r2]
_020113F8:
	ldr r1, _02011434 ; =0x00000309
	ldrb r2, [r4, r1]
	mov r1, #6
	lsl r1, r1, #6
	ldr r1, [r4, r1]
	cmp r1, #0
	ldr r1, _0201142C ; =0x04000004
	bne _0201145C
	cmp r2, #0
	bne _02011440
	ldrh r3, [r1]
	mov r2, #2
	tst r2, r3
	beq _0201149A
	add r1, #0x44
	ldrh r3, [r1]
	mov r2, #0x3f
	bic r3, r2
	mov r2, #0x3f
	orr r3, r2
	mov r2, #0x20
	orr r2, r3
	strh r2, [r1]
	b _0201149A
	.balign 4, 0
_02011428: .word 0x04000006
_0201142C: .word 0x04000004
_02011430: .word 0x0400104A
_02011434: .word 0x00000309
_02011438: .word 0x04001048
_0201143C: .word 0xFFFFC0FF
_02011440:
	ldrh r2, [r1]
	mov r1, #2
	tst r1, r2
	beq _0201149A
	ldr r2, _02011638 ; =0x04001048
	mov r1, #0x3f
	ldrh r3, [r2]
	bic r3, r1
	mov r1, #0x3f
	orr r3, r1
	mov r1, #0x20
	orr r1, r3
	strh r1, [r2]
	b _0201149A
_0201145C:
	cmp r2, #0
	bne _0201147E
	ldrh r2, [r1]
	mov r3, #2
	tst r2, r3
	beq _0201149A
	add r1, #0x44
	ldrh r5, [r1]
	ldr r2, _0201163C ; =0xFFFFC0FF
	and r5, r2
	mov r2, #0x3f
	lsl r2, r2, #8
	orr r5, r2
	lsl r2, r3, #0xc
	orr r2, r5
	strh r2, [r1]
	b _0201149A
_0201147E:
	ldrh r2, [r1]
	mov r1, #2
	tst r1, r2
	beq _0201149A
	ldr r3, _02011638 ; =0x04001048
	ldr r1, _0201163C ; =0xFFFFC0FF
	ldrh r2, [r3]
	and r2, r1
	mov r1, #0x3f
	lsl r1, r1, #8
	orr r2, r1
	lsr r1, r3, #0xd
	orr r1, r2
	strh r1, [r3]
_0201149A:
	mov r1, #0x61
	lsl r1, r1, #2
	add r1, r4, r1
	add r0, r1, r0
	add r0, #0xc0
	ldrb r0, [r0]
	cmp r0, #0
	ldr r0, _02011640 ; =0x00000309
	bne _02011570
	ldrb r0, [r4, r0]
	cmp r0, #0
	ldr r0, _02011644 ; =0x04000004
	bne _020114D0
	ldrh r3, [r0]
	mov r2, #2
	tst r2, r3
	beq _020114EA
	add r0, #0x46
	ldrh r3, [r0]
	mov r2, #0x3f
	bic r3, r2
	mov r2, #0x3f
	orr r3, r2
	mov r2, #0x20
	orr r2, r3
	strh r2, [r0]
	b _020114EA
_020114D0:
	ldrh r2, [r0]
	mov r0, #2
	tst r0, r2
	beq _020114EA
	ldr r2, _02011648 ; =0x0400104A
	mov r0, #0x3f
	ldrh r3, [r2]
	bic r3, r0
	mov r0, #0x3f
	orr r3, r0
	mov r0, #0x20
	orr r0, r3
	strh r0, [r2]
_020114EA:
	ldr r0, _02011640 ; =0x00000309
	ldrb r2, [r4, r0]
	mov r0, #6
	lsl r0, r0, #6
	ldr r0, [r1, r0]
	cmp r0, #0
	bne _02011536
	cmp r2, #0
	bne _02011518
	ldr r2, _02011644 ; =0x04000004
	mov r0, #2
	ldrh r1, [r2]
	tst r0, r1
	beq _02011522
	add r2, #0x44
	ldrh r1, [r2]
	mov r0, #0x3f
	bic r1, r0
	mov r0, #0x20
	orr r1, r0
	orr r0, r1
	strh r0, [r2]
	pop {r3, r4, r5, pc}
_02011518:
	ldr r0, _02011644 ; =0x04000004
	ldrh r1, [r0]
	mov r0, #2
	tst r0, r1
	bne _02011524
_02011522:
	b _02011634
_02011524:
	ldr r1, _02011638 ; =0x04001048
	mov r0, #0x3f
	ldrh r2, [r1]
	bic r2, r0
	mov r0, #0x20
	orr r2, r0
	orr r0, r2
	strh r0, [r1]
	pop {r3, r4, r5, pc}
_02011536:
	cmp r2, #0
	ldr r0, _02011644 ; =0x04000004
	bne _02011556
	ldrh r1, [r0]
	mov r2, #2
	tst r1, r2
	beq _02011634
	add r0, #0x44
	ldrh r3, [r0]
	ldr r1, _0201163C ; =0xFFFFC0FF
	and r3, r1
	lsl r1, r2, #0xc
	orr r3, r1
	orr r1, r3
	strh r1, [r0]
	pop {r3, r4, r5, pc}
_02011556:
	ldrh r1, [r0]
	mov r0, #2
	tst r0, r1
	beq _02011634
	ldr r2, _02011638 ; =0x04001048
	ldr r0, _0201163C ; =0xFFFFC0FF
	ldrh r1, [r2]
	and r1, r0
	lsr r0, r2, #0xd
	orr r1, r0
	orr r0, r1
	strh r0, [r2]
	pop {r3, r4, r5, pc}
_02011570:
	ldrb r0, [r4, r0]
	cmp r0, #0
	ldr r0, _02011644 ; =0x04000004
	bne _02011592
	ldrh r3, [r0]
	mov r2, #2
	tst r2, r3
	beq _020115AA
	add r0, #0x46
	ldrh r3, [r0]
	mov r2, #0x3f
	bic r3, r2
	mov r2, #0x20
	orr r3, r2
	orr r2, r3
	strh r2, [r0]
	b _020115AA
_02011592:
	ldrh r2, [r0]
	mov r0, #2
	tst r0, r2
	beq _020115AA
	ldr r2, _02011648 ; =0x0400104A
	mov r0, #0x3f
	ldrh r3, [r2]
	bic r3, r0
	mov r0, #0x20
	orr r3, r0
	orr r0, r3
	strh r0, [r2]
_020115AA:
	ldr r0, _02011640 ; =0x00000309
	ldrb r2, [r4, r0]
	mov r0, #6
	lsl r0, r0, #6
	ldr r0, [r1, r0]
	cmp r0, #0
	ldr r0, _02011644 ; =0x04000004
	bne _020115F6
	cmp r2, #0
	bne _020115DA
	ldrh r2, [r0]
	mov r1, #2
	tst r1, r2
	beq _02011634
	add r0, #0x44
	ldrh r2, [r0]
	mov r1, #0x3f
	bic r2, r1
	mov r1, #0x3f
	orr r2, r1
	mov r1, #0x20
	orr r1, r2
	strh r1, [r0]
	pop {r3, r4, r5, pc}
_020115DA:
	ldrh r1, [r0]
	mov r0, #2
	tst r0, r1
	beq _02011634
	ldr r1, _02011638 ; =0x04001048
	mov r0, #0x3f
	ldrh r2, [r1]
	bic r2, r0
	mov r0, #0x3f
	orr r2, r0
	mov r0, #0x20
	orr r0, r2
	strh r0, [r1]
	pop {r3, r4, r5, pc}
_020115F6:
	cmp r2, #0
	bne _02011618
	ldrh r1, [r0]
	mov r2, #2
	tst r1, r2
	beq _02011634
	add r0, #0x44
	ldrh r3, [r0]
	ldr r1, _0201163C ; =0xFFFFC0FF
	and r3, r1
	mov r1, #0x3f
	lsl r1, r1, #8
	orr r3, r1
	lsl r1, r2, #0xc
	orr r1, r3
	strh r1, [r0]
	pop {r3, r4, r5, pc}
_02011618:
	ldrh r1, [r0]
	mov r0, #2
	tst r0, r1
	beq _02011634
	ldr r2, _02011638 ; =0x04001048
	ldr r0, _0201163C ; =0xFFFFC0FF
	ldrh r1, [r2]
	and r1, r0
	mov r0, #0x3f
	lsl r0, r0, #8
	orr r1, r0
	lsr r0, r2, #0xd
	orr r0, r1
	strh r0, [r2]
_02011634:
	pop {r3, r4, r5, pc}
	nop
_02011638: .word 0x04001048
_0201163C: .word 0xFFFFC0FF
_02011640: .word 0x00000309
_02011644: .word 0x04000004
_02011648: .word 0x0400104A
	thumb_func_end sub_02011130

	thumb_func_start sub_0201164C
sub_0201164C: ; 0x0201164C
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, [r5, #0x20]
	add r6, r1, #0
	mov r1, #0x4c
	bl AllocFromHeap
	str r0, [r5, #0x14]
	add r4, r0, #0
	ldr r0, [r5, #0x10]
	add r1, r6, #0
	str r0, [sp]
	ldr r0, [r5, #0x18]
	str r0, [sp, #4]
	ldr r2, [r5, #4]
	ldr r3, [r5, #8]
	add r0, r4, #0
	bl sub_020117A0
	ldrb r0, [r6, #8]
	cmp r0, #0
	ldr r0, [r5, #0x18]
	bne _02011688
	ldr r2, [r4, #0x30]
	ldr r3, [r4, #0x44]
	mov r1, #1
	bl sub_02011068
	b _02011692
_02011688:
	ldr r2, [r4, #0x30]
	ldr r3, [r4, #0x44]
	mov r1, #2
	bl sub_02011068
_02011692:
	ldr r0, [r5, #0xc]
	add r0, r0, #1
	str r0, [r5, #0xc]
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0201164C

	thumb_func_start sub_0201169C
sub_0201169C: ; 0x0201169C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	mov r6, #0
	ldr r4, [r5, #0x14]
	cmp r0, #1
	beq _020116B4
	cmp r0, #2
	beq _020116D0
	cmp r0, #3
	beq _020116E4
	b _020116E6
_020116B4:
	add r0, r4, #0
	bl sub_020117FC
	cmp r0, #1
	bne _020116E6
	ldr r0, [r4, #0x44]
	ldr r1, [r5, #0x18]
	ldr r2, [r5, #0x10]
	bl sub_02010F34
	ldr r0, [r5, #0xc]
	add r0, r0, #1
	str r0, [r5, #0xc]
	b _020116E6
_020116D0:
	add r0, r4, #0
	bl FreeToHeap
	add r0, r6, #0
	str r0, [r5, #0x14]
	ldr r0, [r5, #0xc]
	mov r6, #1
	add r0, r0, #1
	str r0, [r5, #0xc]
	b _020116E6
_020116E4:
	mov r6, #1
_020116E6:
	add r0, r6, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0201169C

	thumb_func_start sub_020116EC
sub_020116EC: ; 0x020116EC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, [r5, #0x20]
	add r6, r1, #0
	mov r1, #0x98
	add r7, r2, #0
	bl AllocFromHeap
	str r0, [r5, #0x14]
	add r4, r0, #0
	ldr r0, [r5, #0x10]
	add r1, r6, #0
	str r0, [sp]
	ldr r0, [r5, #0x18]
	str r0, [sp, #4]
	ldr r2, [r5, #4]
	ldr r3, [r5, #8]
	add r0, r4, #0
	bl sub_020117A0
	ldr r0, [r5, #0x10]
	add r1, r7, #0
	str r0, [sp]
	ldr r0, [r5, #0x18]
	str r0, [sp, #4]
	add r0, r4, #0
	ldr r2, [r5, #4]
	ldr r3, [r5, #8]
	add r0, #0x4c
	bl sub_020117A0
	ldr r0, [r5, #0x18]
	ldr r2, [r5, #0x10]
	ldr r3, [r4, #0x44]
	mov r1, #3
	bl sub_02011068
	ldr r0, [r5, #0xc]
	add r0, r0, #1
	str r0, [r5, #0xc]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_020116EC

	thumb_func_start sub_02011744
sub_02011744: ; 0x02011744
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	mov r7, #0
	ldr r6, [r5, #0x14]
	cmp r0, #1
	beq _0201175C
	cmp r0, #2
	beq _02011784
	cmp r0, #3
	beq _02011798
	b _0201179A
_0201175C:
	add r0, r6, #0
	bl sub_020117FC
	add r4, r0, #0
	add r0, r6, #0
	add r0, #0x4c
	bl sub_020117FC
	add r0, r4, r0
	cmp r0, #2
	bne _0201179A
	ldr r0, [r6, #0x44]
	ldr r1, [r5, #0x18]
	ldr r2, [r5, #0x10]
	bl sub_02010F34
	ldr r0, [r5, #0xc]
	add r0, r0, #1
	str r0, [r5, #0xc]
	b _0201179A
_02011784:
	add r0, r6, #0
	bl FreeToHeap
	add r0, r7, #0
	str r0, [r5, #0x14]
	ldr r0, [r5, #0xc]
	mov r7, #1
	add r0, r0, #1
	str r0, [r5, #0xc]
	b _0201179A
_02011798:
	mov r7, #1
_0201179A:
	add r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02011744

	thumb_func_start sub_020117A0
sub_020117A0: ; 0x020117A0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r4, r1, #0
	add r1, r4, #4
	add r5, r0, #0
	add r6, r2, #0
	str r1, [sp]
	add r1, r5, #0
	add r2, r5, #0
	add r7, r3, #0
	add r1, #0x20
	add r2, #0x10
	add r3, r4, #0
	str r6, [sp, #4]
	bl sub_02010AB0
	ldr r1, [sp, #0x30]
	str r1, [r5, #0x30]
	ldrb r0, [r4, #8]
	str r0, [r5, #0x34]
	str r6, [r5, #0x38]
	str r7, [r5, #0x3c]
	mov r0, #0
	str r0, [r5, #0x40]
	ldr r0, [sp, #0x34]
	str r0, [r5, #0x48]
	ldrb r2, [r4, #0xb]
	str r2, [r5, #0x44]
	str r1, [sp]
	ldrb r1, [r4]
	str r1, [sp, #4]
	ldrb r1, [r4, #1]
	str r1, [sp, #8]
	ldrb r1, [r4, #2]
	str r1, [sp, #0xc]
	ldrb r1, [r4, #3]
	str r1, [sp, #0x10]
	ldr r1, [r5, #0x44]
	str r1, [sp, #0x14]
	ldrb r1, [r4, #9]
	ldrb r2, [r4, #0xa]
	ldrb r3, [r4, #8]
	bl sub_02010F84
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_020117A0

	thumb_func_start sub_020117FC
sub_020117FC: ; 0x020117FC
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldr r1, [r4, #0x40]
	add r2, r1, #1
	str r2, [r4, #0x40]
	ldr r1, [r4, #0x3c]
	cmp r2, r1
	blt _0201187C
	mov r1, #0
	str r1, [r4, #0x40]
	ldr r1, [r4, #0x38]
	sub r1, r1, #1
	cmp r1, #0
	ble _02011826
	str r1, [r4, #0x38]
	add r1, r4, #0
	add r1, #0x10
	bl sub_02010A8C
	b _02011844
_02011826:
	ldr r0, [r4, #0x2c]
	str r0, [sp]
	ldr r0, [r4, #0x34]
	str r0, [sp, #4]
	ldr r0, [r4, #0x30]
	str r0, [sp, #8]
	ldr r0, [r4, #0x48]
	ldr r1, [r4, #0x20]
	ldr r2, [r4, #0x24]
	ldr r3, [r4, #0x28]
	bl sub_02013488
	add sp, #0xc
	mov r0, #1
	pop {r3, r4, pc}
_02011844:
	ldr r1, [r4, #0xc]
	asr r0, r1, #6
	lsr r0, r0, #0x19
	add r0, r1, r0
	asr r0, r0, #7
	str r0, [sp]
	ldr r0, [r4, #0x34]
	str r0, [sp, #4]
	ldr r0, [r4, #0x30]
	str r0, [sp, #8]
	ldr r2, [r4]
	ldr r3, [r4, #4]
	asr r1, r2, #6
	lsr r1, r1, #0x19
	add r1, r2, r1
	ldr r0, [r4, #0x48]
	asr r2, r3, #6
	lsr r2, r2, #0x19
	add r2, r3, r2
	ldr r4, [r4, #8]
	asr r1, r1, #7
	asr r3, r4, #6
	lsr r3, r3, #0x19
	add r3, r4, r3
	asr r2, r2, #7
	asr r3, r3, #7
	bl sub_02013488
_0201187C:
	mov r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end sub_020117FC

	thumb_func_start sub_02011884
sub_02011884: ; 0x02011884
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r0, [r5, #0x20]
	add r4, r1, #0
	mov r1, #0x38
	bl AllocFromHeap
	str r0, [r5, #0x14]
	ldr r0, [r5, #0x10]
	add r1, r4, #0
	str r0, [sp]
	ldr r0, [r5, #0x18]
	str r0, [sp, #4]
	ldr r0, [r5, #0x1c]
	str r0, [sp, #8]
	ldr r0, [r5, #0x20]
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x14]
	ldr r2, [r5, #4]
	ldr r3, [r5, #8]
	bl sub_02011918
	ldr r0, [r5, #0xc]
	add r0, r0, #1
	str r0, [r5, #0xc]
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02011884

	thumb_func_start sub_020118BC
sub_020118BC: ; 0x020118BC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	mov r6, #0
	ldr r4, [r5, #0x14]
	cmp r0, #1
	beq _020118D4
	cmp r0, #2
	beq _020118F0
	cmp r0, #3
	beq _0201190A
	b _0201190E
_020118D4:
	add r0, r4, #0
	bl sub_020119F4
	cmp r0, #1
	bne _02011912
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	ldr r2, [r5, #0x10]
	bl sub_02010F34
	ldr r0, [r5, #0xc]
	add r0, r0, #1
	str r0, [r5, #0xc]
	b _02011912
_020118F0:
	add r0, r4, #0
	bl sub_02010EC8
	ldr r0, [r5, #0x14]
	bl FreeToHeap
	add r0, r6, #0
	str r0, [r5, #0x14]
	ldr r0, [r5, #0xc]
	mov r6, #1
	add r0, r0, #1
	str r0, [r5, #0xc]
	b _02011912
_0201190A:
	mov r6, #1
	b _02011912
_0201190E:
	bl GF_AssertFail
_02011912:
	add r0, r6, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_020118BC

	thumb_func_start sub_02011918
sub_02011918: ; 0x02011918
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #0
	mov r1, #2
	ldrsh r0, [r4, r0]
	ldrsh r1, [r4, r1]
	str r2, [sp, #0x18]
	str r3, [sp, #0x1c]
	ldr r6, [sp, #0x38]
	ldr r7, [sp, #0x3c]
	bl sub_02010A6C
	str r0, [sp, #0x20]
	ldrb r1, [r4, #8]
	ldr r3, [sp, #0x44]
	add r0, r5, #0
	add r2, r6, #0
	bl sub_02010E64
	mov r0, #0
	ldrsh r1, [r4, r0]
	lsl r1, r1, #7
	str r1, [r5, #0xc]
	mov r1, #4
	ldrsh r1, [r4, r1]
	str r1, [r5, #0x10]
	mov r1, #6
	ldrsh r1, [r4, r1]
	str r1, [r5, #0x14]
	ldr r1, [sp, #0x20]
	str r1, [r5, #0x18]
	ldr r1, [sp, #0x18]
	str r1, [r5, #0x1c]
	ldr r1, [sp, #0x1c]
	str r1, [r5, #0x20]
	str r0, [r5, #0x24]
	ldr r0, [sp, #0x40]
	str r7, [r5, #0x30]
	str r0, [r5, #0x34]
	ldr r0, [sp, #0x44]
	str r0, [r5, #0x28]
	ldrb r0, [r4, #0xb]
	str r0, [r5, #0x2c]
	add r0, r5, #0
	bl sub_02011AD8
	ldr r0, _020119E8 ; =sub_02010F00
	ldr r2, _020119EC ; =0x000003FF
	add r1, r5, #0
	bl sub_0200E374
	add r0, r5, #0
	mov r1, #0
	bl sub_02010EE0
	mov r1, #3
	str r6, [sp]
	lsl r1, r1, #8
	ldrsh r1, [r0, r1]
	str r1, [sp, #4]
	mov r1, #0
	str r1, [sp, #8]
	mov r1, #0x12
	lsl r1, r1, #6
	ldrsh r0, [r0, r1]
	str r0, [sp, #0xc]
	mov r0, #0xc0
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x2c]
	str r0, [sp, #0x14]
	ldrb r1, [r4, #9]
	ldrb r2, [r4, #0xa]
	ldrb r3, [r4, #8]
	add r0, r7, #0
	bl sub_02010F84
	ldrb r0, [r4, #8]
	cmp r0, #0
	bne _020119C8
	ldr r3, [r5, #0x2c]
	add r0, r7, #0
	mov r1, #1
	add r2, r6, #0
	bl sub_02011068
	b _020119D4
_020119C8:
	ldr r3, [r5, #0x2c]
	add r0, r7, #0
	mov r1, #2
	add r2, r6, #0
	bl sub_02011068
_020119D4:
	ldr r0, [sp, #0x44]
	ldr r2, _020119F0 ; =sub_02010C38
	str r0, [sp]
	ldr r0, [r5, #0x34]
	add r1, r5, #0
	add r3, r6, #0
	bl sub_0200FF88
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_020119E8: .word sub_02010F00
_020119EC: .word 0x000003FF
_020119F0: .word sub_02010C38
	thumb_func_end sub_02011918

	thumb_func_start sub_020119F4
sub_020119F4: ; 0x020119F4
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0x24]
	add r2, r1, #1
	str r2, [r4, #0x24]
	ldr r1, [r4, #0x20]
	cmp r2, r1
	blt _02011A38
	mov r1, #0
	str r1, [r4, #0x24]
	ldr r1, [r4, #0x1c]
	sub r1, r1, #1
	cmp r1, #0
	ble _02011A2A
	str r1, [r4, #0x1c]
	ldr r2, [r4, #0xc]
	ldr r1, [r4, #0x18]
	add r1, r2, r1
	str r1, [r4, #0xc]
	bl sub_02011AD8
	ldr r0, _02011A3C ; =sub_02010F00
	ldr r2, _02011A40 ; =0x000003FF
	add r1, r4, #0
	bl sub_0200E374
	b _02011A38
_02011A2A:
	ldr r0, [r4, #0x34]
	ldr r1, [r4, #8]
	ldr r2, [r4, #0x28]
	bl sub_0200FFB4
	mov r0, #1
	pop {r4, pc}
_02011A38:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_02011A3C: .word sub_02010F00
_02011A40: .word 0x000003FF
	thumb_func_end sub_020119F4

	thumb_func_start sub_02011A44
sub_02011A44: ; 0x02011A44
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r1, [sp]
	asr r1, r0, #6
	lsr r1, r1, #0x19
	add r1, r0, r1
	asr r1, r1, #7
	ldr r5, [sp, #0x20]
	ldr r4, [sp, #0x24]
	sub r0, r3, r2
	bpl _02011A5C
	neg r0, r0
_02011A5C:
	cmp r0, r1
	blt _02011A6A
	mov r0, #0
	str r0, [r5]
	add sp, #0xc
	str r0, [r4]
	pop {r4, r5, r6, r7, pc}
_02011A6A:
	lsl r0, r0, #0xc
	str r0, [sp, #4]
	asr r7, r0, #0x1f
	lsl r0, r1, #0xc
	asr r1, r0, #0x1f
	add r2, r0, #0
	add r3, r1, #0
	bl _ll_mul
	str r0, [sp, #8]
	ldr r0, [sp, #4]
	add r6, r1, #0
	add r1, r7, #0
	add r2, r0, #0
	add r3, r7, #0
	bl _ll_mul
	add r2, r0, #0
	add r3, r1, #0
	mov r0, #2
	ldr r1, [sp, #8]
	mov r7, #0
	lsl r0, r0, #0xa
	add r0, r1, r0
	adc r6, r7
	lsl r1, r6, #0x14
	lsr r0, r0, #0xc
	orr r0, r1
	mov r1, #2
	lsl r1, r1, #0xa
	add r2, r2, r1
	adc r3, r7
	lsl r1, r3, #0x14
	lsr r2, r2, #0xc
	orr r2, r1
	sub r0, r0, r2
	bl FX_Sqrt
	asr r2, r0, #0xc
	ldr r0, [sp]
	sub r0, r0, r2
	str r0, [r5]
	bpl _02011AC4
	add r0, r7, #0
	str r0, [r5]
_02011AC4:
	ldr r1, [r5]
	lsl r0, r2, #1
	add r0, r1, r0
	str r0, [r4]
	cmp r0, #0xff
	ble _02011AD4
	mov r0, #0xff
	str r0, [r4]
_02011AD4:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end sub_02011A44

	thumb_func_start sub_02011AD8
sub_02011AD8: ; 0x02011AD8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	mov r1, #0
	add r5, r0, #0
	bl sub_02010EE0
	add r7, r0, #0
	mov r4, #0
	add r6, r7, #0
_02011AEA:
	ldr r2, [r5, #0x14]
	cmp r4, r2
	bgt _02011B04
	add r0, sp, #0xc
	str r0, [sp]
	add r0, sp, #8
	str r0, [sp, #4]
	ldr r0, [r5, #0xc]
	ldr r1, [r5, #0x10]
	add r3, r4, #0
	bl sub_02011A44
	b _02011B3E
_02011B04:
	lsl r0, r2, #1
	cmp r4, r0
	bgt _02011B2C
	sub r0, r0, r4
	lsl r0, r0, #1
	add r1, r7, r0
	mov r0, #3
	lsl r0, r0, #8
	ldrsh r0, [r1, r0]
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x14]
	lsl r0, r0, #1
	sub r0, r0, r4
	lsl r0, r0, #1
	add r1, r7, r0
	mov r0, #0x12
	lsl r0, r0, #6
	ldrsh r0, [r1, r0]
	str r0, [sp, #8]
	b _02011B3E
_02011B2C:
	add r0, sp, #0xc
	str r0, [sp]
	add r0, sp, #8
	str r0, [sp, #4]
	ldr r0, [r5, #0xc]
	ldr r1, [r5, #0x10]
	add r3, r4, #0
	bl sub_02011A44
_02011B3E:
	mov r0, #3
	ldr r1, [sp, #0xc]
	lsl r0, r0, #8
	strh r1, [r6, r0]
	mov r0, #0x12
	ldr r1, [sp, #8]
	lsl r0, r0, #6
	strh r1, [r6, r0]
	add r4, r4, #1
	add r6, r6, #2
	cmp r4, #0xc0
	blt _02011AEA
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02011AD8

	thumb_func_start sub_02011B5C
sub_02011B5C: ; 0x02011B5C
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r0, [r5, #0x20]
	add r4, r1, #0
	mov r1, #0x30
	bl AllocFromHeap
	str r0, [r5, #0x14]
	ldr r0, [r5, #0x10]
	add r1, r4, #0
	str r0, [sp]
	ldr r0, [r5, #0x18]
	str r0, [sp, #4]
	ldr r0, [r5, #0x1c]
	str r0, [sp, #8]
	ldr r0, [r5, #0x20]
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x14]
	ldr r2, [r5, #4]
	ldr r3, [r5, #8]
	bl sub_02011BF0
	ldr r0, [r5, #0xc]
	add r0, r0, #1
	str r0, [r5, #0xc]
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02011B5C

	thumb_func_start sub_02011B94
sub_02011B94: ; 0x02011B94
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	mov r6, #0
	ldr r4, [r5, #0x14]
	cmp r0, #1
	beq _02011BAC
	cmp r0, #2
	beq _02011BC8
	cmp r0, #3
	beq _02011BE2
	b _02011BE6
_02011BAC:
	add r0, r4, #0
	bl sub_02011CB8
	cmp r0, #1
	bne _02011BEA
	ldr r0, [r4, #0x20]
	ldr r1, [r4, #0x24]
	ldr r2, [r5, #0x10]
	bl sub_02010F34
	ldr r0, [r5, #0xc]
	add r0, r0, #1
	str r0, [r5, #0xc]
	b _02011BEA
_02011BC8:
	add r0, r4, #0
	bl sub_02010EC8
	ldr r0, [r5, #0x14]
	bl FreeToHeap
	add r0, r6, #0
	str r0, [r5, #0x14]
	ldr r0, [r5, #0xc]
	mov r6, #1
	add r0, r0, #1
	str r0, [r5, #0xc]
	b _02011BEA
_02011BE2:
	mov r6, #1
	b _02011BEA
_02011BE6:
	bl GF_AssertFail
_02011BEA:
	add r0, r6, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02011B94

	thumb_func_start sub_02011BF0
sub_02011BF0: ; 0x02011BF0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r4, r1, #0
	add r5, r0, #0
	ldrh r0, [r4]
	ldrh r1, [r4, #2]
	str r2, [sp, #0x18]
	str r3, [sp, #0x1c]
	ldr r6, [sp, #0x38]
	ldr r7, [sp, #0x3c]
	bl sub_02010A6C
	str r0, [r5, #0x10]
	ldrb r1, [r4, #4]
	ldr r3, [sp, #0x44]
	add r0, r5, #0
	add r2, r6, #0
	bl sub_02010E64
	ldrh r0, [r4]
	lsl r0, r0, #7
	str r0, [r5, #0xc]
	ldr r0, [sp, #0x18]
	str r0, [r5, #0x14]
	ldr r0, [sp, #0x1c]
	str r0, [r5, #0x18]
	mov r0, #0
	str r0, [r5, #0x1c]
	ldr r0, [sp, #0x40]
	str r7, [r5, #0x24]
	str r0, [r5, #0x28]
	ldr r0, [sp, #0x44]
	str r0, [r5, #0x2c]
	ldrb r0, [r4, #7]
	str r0, [r5, #0x20]
	add r0, r5, #0
	bl sub_02011D08
	ldr r0, _02011CAC ; =sub_02010F00
	ldr r2, _02011CB0 ; =0x000003FF
	add r1, r5, #0
	bl sub_0200E374
	add r0, r5, #0
	mov r1, #0
	bl sub_02010EE0
	mov r1, #3
	str r6, [sp]
	lsl r1, r1, #8
	ldrsh r1, [r0, r1]
	str r1, [sp, #4]
	mov r1, #0
	str r1, [sp, #8]
	mov r1, #0x12
	lsl r1, r1, #6
	ldrsh r0, [r0, r1]
	str r0, [sp, #0xc]
	mov r0, #0xc0
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x20]
	str r0, [sp, #0x14]
	ldrb r1, [r4, #5]
	ldrb r2, [r4, #6]
	ldrb r3, [r4, #4]
	add r0, r7, #0
	bl sub_02010F84
	ldrb r0, [r4, #4]
	cmp r0, #0
	bne _02011C8C
	ldr r3, [r5, #0x20]
	add r0, r7, #0
	mov r1, #1
	add r2, r6, #0
	bl sub_02011068
	b _02011C98
_02011C8C:
	ldr r3, [r5, #0x20]
	add r0, r7, #0
	mov r1, #2
	add r2, r6, #0
	bl sub_02011068
_02011C98:
	ldr r0, [sp, #0x44]
	ldr r2, _02011CB4 ; =sub_02010C38
	str r0, [sp]
	ldr r0, [r5, #0x28]
	add r1, r5, #0
	add r3, r6, #0
	bl sub_0200FF88
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02011CAC: .word sub_02010F00
_02011CB0: .word 0x000003FF
_02011CB4: .word sub_02010C38
	thumb_func_end sub_02011BF0

	thumb_func_start sub_02011CB8
sub_02011CB8: ; 0x02011CB8
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0x1c]
	add r2, r1, #1
	str r2, [r4, #0x1c]
	ldr r1, [r4, #0x18]
	cmp r2, r1
	blt _02011CFC
	mov r1, #0
	str r1, [r4, #0x1c]
	ldr r1, [r4, #0x14]
	sub r1, r1, #1
	cmp r1, #0
	ble _02011CEE
	str r1, [r4, #0x14]
	ldr r2, [r4, #0xc]
	ldr r1, [r4, #0x10]
	add r1, r2, r1
	str r1, [r4, #0xc]
	bl sub_02011D08
	ldr r0, _02011D00 ; =sub_02010F00
	ldr r2, _02011D04 ; =0x000003FF
	add r1, r4, #0
	bl sub_0200E374
	b _02011CFC
_02011CEE:
	ldr r0, [r4, #0x28]
	ldr r1, [r4, #8]
	ldr r2, [r4, #0x2c]
	bl sub_0200FFB4
	mov r0, #1
	pop {r4, pc}
_02011CFC:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_02011D00: .word sub_02010F00
_02011D04: .word 0x000003FF
	thumb_func_end sub_02011CB8

	thumb_func_start sub_02011D08
sub_02011D08: ; 0x02011D08
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x1fc
	sub sp, #0x104
	add r4, r0, #0
	mov r1, #0
	bl sub_02010EE0
	ldr r1, [r4, #0xc]
	add r5, r0, #0
	asr r0, r1, #6
	lsr r0, r0, #0x19
	add r0, r1, r0
	asr r0, r0, #7
	add r1, sp, #0
	mov r2, #0xc0
	mov r3, #0
	bl sub_02010A00
	mov r7, #0x12
	mov r6, #0
	add r4, sp, #0
	lsl r7, r7, #6
_02011D34:
	ldr r1, [r4]
	mov r0, #0x80
	neg r1, r1
	bl sub_02010A7C
	mov r1, #3
	lsl r1, r1, #8
	strh r0, [r5, r1]
	ldr r1, [r4]
	mov r0, #0x80
	bl sub_02010A7C
	strh r0, [r5, r7]
	add r6, r6, #1
	add r4, r4, #4
	add r5, r5, #2
	cmp r6, #0xc0
	blt _02011D34
	add sp, #0x1fc
	add sp, #0x104
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02011D08

	thumb_func_start sub_02011D60
sub_02011D60: ; 0x02011D60
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r0, [r5, #0x20]
	add r4, r1, #0
	mov r1, #0x34
	bl AllocFromHeap
	str r0, [r5, #0x14]
	ldr r0, [r5, #0x10]
	add r1, r4, #0
	str r0, [sp]
	ldr r0, [r5, #0x18]
	str r0, [sp, #4]
	ldr r0, [r5, #0x1c]
	str r0, [sp, #8]
	ldr r0, [r5, #0x20]
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x14]
	ldr r2, [r5, #4]
	ldr r3, [r5, #8]
	bl sub_02011DEC
	ldr r0, [r5, #0xc]
	add r0, r0, #1
	str r0, [r5, #0xc]
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02011D60

	thumb_func_start sub_02011D98
sub_02011D98: ; 0x02011D98
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	mov r6, #0
	ldr r4, [r5, #0x14]
	cmp r0, #1
	beq _02011DB0
	cmp r0, #2
	beq _02011DCC
	cmp r0, #3
	beq _02011DE6
	b _02011DE8
_02011DB0:
	add r0, r4, #0
	bl sub_02011EC0
	cmp r0, #1
	bne _02011DE8
	ldr r0, [r4, #0x24]
	ldr r1, [r4, #0x28]
	ldr r2, [r5, #0x10]
	bl sub_02010F34
	ldr r0, [r5, #0xc]
	add r0, r0, #1
	str r0, [r5, #0xc]
	b _02011DE8
_02011DCC:
	add r0, r4, #0
	bl sub_02010EC8
	ldr r0, [r5, #0x14]
	bl FreeToHeap
	add r0, r6, #0
	str r0, [r5, #0x14]
	ldr r0, [r5, #0xc]
	mov r6, #1
	add r0, r0, #1
	str r0, [r5, #0xc]
	b _02011DE8
_02011DE6:
	mov r6, #1
_02011DE8:
	add r0, r6, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02011D98

	thumb_func_start sub_02011DEC
sub_02011DEC: ; 0x02011DEC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r4, r1, #0
	add r5, r0, #0
	ldrh r1, [r4, #2]
	ldrh r0, [r4]
	str r2, [sp, #0x18]
	str r3, [sp, #0x1c]
	sub r0, r1, r0
	add r1, r2, #0
	ldr r6, [sp, #0x38]
	ldr r7, [sp, #0x3c]
	bl _s32_div_f
	str r0, [sp, #0x20]
	ldrb r1, [r4, #4]
	ldr r3, [sp, #0x44]
	add r0, r5, #0
	add r2, r6, #0
	bl sub_02010E64
	mov r0, #2
	lsl r0, r0, #0x12
	str r0, [r5, #0xc]
	ldrh r0, [r4]
	str r0, [r5, #0x10]
	ldr r0, [sp, #0x20]
	str r0, [r5, #0x14]
	ldr r0, [sp, #0x18]
	str r0, [r5, #0x18]
	ldr r0, [sp, #0x1c]
	str r0, [r5, #0x1c]
	mov r0, #0
	str r0, [r5, #0x20]
	ldr r0, [sp, #0x40]
	str r7, [r5, #0x28]
	str r0, [r5, #0x2c]
	ldr r0, [sp, #0x44]
	str r0, [r5, #0x30]
	ldrb r0, [r4, #7]
	str r0, [r5, #0x24]
	add r0, r5, #0
	bl sub_02011F10
	ldr r0, _02011EB4 ; =sub_02010F00
	ldr r2, _02011EB8 ; =0x000003FF
	add r1, r5, #0
	bl sub_0200E374
	add r0, r5, #0
	mov r1, #0
	bl sub_02010EE0
	mov r1, #0xf
	str r6, [sp]
	lsl r1, r1, #6
	ldrsh r1, [r0, r1]
	str r1, [sp, #4]
	mov r1, #0
	str r1, [sp, #8]
	mov r1, #0x15
	lsl r1, r1, #6
	ldrsh r0, [r0, r1]
	str r0, [sp, #0xc]
	mov r0, #0xc0
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x24]
	str r0, [sp, #0x14]
	ldrb r1, [r4, #5]
	ldrb r2, [r4, #6]
	ldrb r3, [r4, #4]
	add r0, r7, #0
	bl sub_02010F84
	ldrb r0, [r4, #4]
	cmp r0, #0
	bne _02011E94
	ldr r3, [r5, #0x24]
	add r0, r7, #0
	mov r1, #1
	add r2, r6, #0
	bl sub_02011068
	b _02011EA0
_02011E94:
	ldr r3, [r5, #0x24]
	add r0, r7, #0
	mov r1, #2
	add r2, r6, #0
	bl sub_02011068
_02011EA0:
	ldr r0, [sp, #0x44]
	ldr r2, _02011EBC ; =sub_02010C38
	str r0, [sp]
	ldr r0, [r5, #0x2c]
	add r1, r5, #0
	add r3, r6, #0
	bl sub_0200FF88
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02011EB4: .word sub_02010F00
_02011EB8: .word 0x000003FF
_02011EBC: .word sub_02010C38
	thumb_func_end sub_02011DEC

	thumb_func_start sub_02011EC0
sub_02011EC0: ; 0x02011EC0
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0x20]
	add r2, r1, #1
	str r2, [r4, #0x20]
	ldr r1, [r4, #0x1c]
	cmp r2, r1
	blt _02011F04
	mov r1, #0
	str r1, [r4, #0x20]
	ldr r1, [r4, #0x18]
	sub r1, r1, #1
	cmp r1, #0
	ble _02011EF6
	str r1, [r4, #0x18]
	ldr r2, [r4, #0x10]
	ldr r1, [r4, #0x14]
	add r1, r2, r1
	str r1, [r4, #0x10]
	bl sub_02011F10
	ldr r0, _02011F08 ; =sub_02010F00
	ldr r2, _02011F0C ; =0x000003FF
	add r1, r4, #0
	bl sub_0200E374
	b _02011F04
_02011EF6:
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #8]
	ldr r2, [r4, #0x30]
	bl sub_0200FFB4
	mov r0, #1
	pop {r4, pc}
_02011F04:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_02011F08: .word sub_02010F00
_02011F0C: .word 0x000003FF
	thumb_func_end sub_02011EC0

	thumb_func_start sub_02011F10
sub_02011F10: ; 0x02011F10
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1fc
	sub sp, #0x110
	add r4, r0, #0
	mov r1, #0
	bl sub_02010EE0
	str r0, [sp]
	ldr r0, [r4, #0x10]
	ldr r2, [r4, #0xc]
	asr r0, r0, #4
	lsl r1, r0, #2
	ldr r0, _02011FF0 ; =FX_SinCosTable_
	asr r3, r2, #0x1f
	ldrsh r0, [r0, r1]
	asr r1, r0, #0x1f
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r2, r0, r2
	adc r1, r3
	lsl r0, r1, #0x14
	lsr r1, r2, #0xc
	orr r1, r0
	asr r7, r1, #0xc
	lsl r0, r7, #1
	mov r1, #0x15
	bl _s32_div_f
	add r0, r0, #1
	lsl r0, r0, #1
	mov r1, #0xb4
	sub r2, r1, r0
	ldr r0, _02011FF4 ; =0x0000FFFF
	add r1, #0xb4
	mul r0, r2
	bl _s32_div_f
	lsr r1, r0, #0x1f
	add r1, r0, r1
	asr r4, r1, #1
	mov r1, #1
	add r0, r4, #0
	lsl r1, r1, #8
	bl sub_02010A54
	asr r0, r0, #0xc
	str r0, [sp, #4]
	cmp r0, #0xc0
	blt _02011F7C
	bl GF_AssertFail
_02011F7C:
	ldr r2, [sp, #4]
	add r0, r4, #0
	add r1, sp, #0xc
	mov r3, #0
	bl sub_02010A00
	ldr r5, [sp]
	mov r4, #0
_02011F8C:
	ldr r0, [sp, #4]
	add r1, r4, #1
	sub r0, r0, r1
	add r6, r7, #0
	cmp r0, #0
	ble _02011FA4
	lsl r1, r0, #2
	add r0, sp, #0xc
	ldr r0, [r0, r1]
	cmp r0, r7
	ble _02011FA4
	add r6, r0, #0
_02011FA4:
	mov r0, #0x80
	neg r1, r6
	bl sub_02010A7C
	str r0, [sp, #8]
	mov r0, #0x80
	add r1, r6, #0
	bl sub_02010A7C
	ldr r1, [sp, #8]
	lsl r0, r0, #0x10
	lsl r1, r1, #0x10
	asr r2, r1, #0x10
	mov r1, #3
	lsl r1, r1, #8
	strh r2, [r5, r1]
	asr r1, r0, #0x10
	mov r0, #0x12
	lsl r0, r0, #6
	strh r1, [r5, r0]
	mov r0, #0xbf
	sub r0, r0, r4
	lsl r3, r0, #1
	ldr r0, [sp]
	add r4, r4, #1
	add r0, r0, r3
	mov r3, #3
	lsl r3, r3, #8
	strh r2, [r0, r3]
	mov r2, #0x12
	lsl r2, r2, #6
	add r5, r5, #2
	strh r1, [r0, r2]
	cmp r4, #0x60
	blt _02011F8C
	add sp, #0x1fc
	add sp, #0x110
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02011FF0: .word FX_SinCosTable_
_02011FF4: .word 0x0000FFFF
	thumb_func_end sub_02011F10

	thumb_func_start sub_02011FF8
sub_02011FF8: ; 0x02011FF8
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r0, [r5, #0x20]
	add r4, r1, #0
	mov r1, #0x30
	bl AllocFromHeap
	str r0, [r5, #0x14]
	ldr r0, [r5, #0x10]
	add r1, r4, #0
	str r0, [sp]
	ldr r0, [r5, #0x18]
	str r0, [sp, #4]
	ldr r0, [r5, #0x1c]
	str r0, [sp, #8]
	ldr r0, [r5, #0x20]
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x14]
	ldr r2, [r5, #4]
	ldr r3, [r5, #8]
	bl sub_02012090
	ldr r0, [r5, #0xc]
	add r0, r0, #1
	str r0, [r5, #0xc]
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02011FF8

	thumb_func_start sub_02012030
sub_02012030: ; 0x02012030
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	mov r6, #0
	ldr r4, [r5, #0x14]
	cmp r0, #1
	beq _02012048
	cmp r0, #2
	beq _02012064
	cmp r0, #3
	beq _02012084
	b _02012088
_02012048:
	add r0, r4, #0
	bl sub_020121A4
	cmp r0, #1
	bne _0201208C
	ldr r0, [r4, #0x20]
	ldr r1, [r4, #0x24]
	ldr r2, [r5, #0x10]
	bl sub_02010F34
	ldr r0, [r5, #0xc]
	add r0, r0, #1
	str r0, [r5, #0xc]
	b _0201208C
_02012064:
	add r0, r4, #0
	bl sub_020121F4
	add r0, r4, #0
	bl sub_02010EC8
	ldr r0, [r5, #0x14]
	bl FreeToHeap
	add r0, r6, #0
	str r0, [r5, #0x14]
	ldr r0, [r5, #0xc]
	mov r6, #1
	add r0, r0, #1
	str r0, [r5, #0xc]
	b _0201208C
_02012084:
	mov r6, #1
	b _0201208C
_02012088:
	bl GF_AssertFail
_0201208C:
	add r0, r6, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02012030

	thumb_func_start sub_02012090
sub_02012090: ; 0x02012090
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r5, r1, #0
	add r6, r0, #0
	str r2, [sp, #0x18]
	ldr r0, [sp, #0x38]
	ldrh r2, [r5, #8]
	str r0, [sp, #0x38]
	ldr r0, [sp, #0x44]
	mov r1, #0x30
	mul r1, r2
	str r3, [sp, #0x1c]
	str r0, [sp, #0x44]
	bl AllocFromHeap
	str r0, [r6, #0xc]
	cmp r0, #0
	bne _020120B8
	bl GF_AssertFail
_020120B8:
	ldrh r0, [r5, #8]
	str r0, [r6, #0x10]
	mov r0, #0
	str r0, [sp, #0x20]
	ldrh r0, [r5, #8]
	cmp r0, #0
	ble _020120F8
	ldr r4, [sp, #0x20]
	add r7, r4, #0
_020120CA:
	ldr r0, [r5, #4]
	ldr r2, [r6, #0xc]
	add r0, r0, r4
	str r0, [sp]
	ldr r0, [sp, #0x18]
	str r0, [sp, #4]
	add r0, r2, r7
	ldr r3, [r5]
	add r1, r0, #0
	add r2, r2, r7
	add r1, #0x20
	add r2, #0x10
	add r3, r3, r4
	bl sub_02010AB0
	ldr r0, [sp, #0x20]
	ldrh r1, [r5, #8]
	add r0, r0, #1
	add r4, r4, #4
	add r7, #0x30
	str r0, [sp, #0x20]
	cmp r0, r1
	blt _020120CA
_020120F8:
	ldrh r1, [r5, #0xa]
	ldr r2, [sp, #0x38]
	ldr r3, [sp, #0x44]
	add r0, r6, #0
	bl sub_02010E64
	ldr r0, [sp, #0x18]
	str r0, [r6, #0x14]
	ldr r0, [sp, #0x1c]
	str r0, [r6, #0x18]
	mov r0, #0
	str r0, [r6, #0x1c]
	ldr r0, [sp, #0x3c]
	str r0, [r6, #0x24]
	ldr r0, [sp, #0x40]
	str r0, [r6, #0x28]
	ldr r0, [sp, #0x44]
	str r0, [r6, #0x2c]
	ldrh r0, [r5, #0xe]
	str r0, [r6, #0x20]
	add r0, r6, #0
	bl sub_02012204
	ldr r0, _02012198 ; =sub_02010F00
	ldr r2, _0201219C ; =0x000003FF
	add r1, r6, #0
	bl sub_0200E374
	add r0, r6, #0
	mov r1, #0
	bl sub_02010EE0
	ldr r1, [sp, #0x38]
	str r1, [sp]
	mov r1, #3
	lsl r1, r1, #8
	ldrsh r1, [r0, r1]
	str r1, [sp, #4]
	mov r1, #0
	str r1, [sp, #8]
	mov r1, #0x12
	lsl r1, r1, #6
	ldrsh r0, [r0, r1]
	str r0, [sp, #0xc]
	mov r0, #0xc0
	str r0, [sp, #0x10]
	ldr r0, [r6, #0x20]
	str r0, [sp, #0x14]
	ldrb r1, [r5, #0xc]
	ldrb r2, [r5, #0xd]
	ldrh r3, [r5, #0xa]
	ldr r0, [sp, #0x3c]
	bl sub_02010F84
	ldrh r0, [r5, #0xa]
	cmp r0, #0
	ldr r0, [r6, #0x24]
	bne _02012178
	ldr r2, [sp, #0x38]
	ldr r3, [r6, #0x20]
	mov r1, #1
	bl sub_02011068
	b _02012182
_02012178:
	ldr r2, [sp, #0x38]
	ldr r3, [r6, #0x20]
	mov r1, #2
	bl sub_02011068
_02012182:
	ldr r0, [sp, #0x44]
	ldr r2, _020121A0 ; =sub_02010C38
	str r0, [sp]
	ldr r0, [r6, #0x28]
	ldr r3, [sp, #0x38]
	add r1, r6, #0
	bl sub_0200FF88
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_02012198: .word sub_02010F00
_0201219C: .word 0x000003FF
_020121A0: .word sub_02010C38
	thumb_func_end sub_02012090

	thumb_func_start sub_020121A4
sub_020121A4: ; 0x020121A4
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0x1c]
	add r2, r1, #1
	str r2, [r4, #0x1c]
	ldr r1, [r4, #0x18]
	cmp r2, r1
	blt _020121E6
	mov r1, #0
	str r1, [r4, #0x1c]
	ldr r1, [r4, #0x14]
	sub r1, r1, #1
	cmp r1, #0
	ble _020121D8
	str r1, [r4, #0x14]
	bl sub_02012290
	add r0, r4, #0
	bl sub_02012204
	ldr r0, _020121EC ; =sub_02010F00
	ldr r2, _020121F0 ; =0x000003FF
	add r1, r4, #0
	bl sub_0200E374
	b _020121E6
_020121D8:
	ldr r0, [r4, #0x28]
	ldr r1, [r4, #8]
	ldr r2, [r4, #0x2c]
	bl sub_0200FFB4
	mov r0, #1
	pop {r4, pc}
_020121E6:
	mov r0, #0
	pop {r4, pc}
	nop
_020121EC: .word sub_02010F00
_020121F0: .word 0x000003FF
	thumb_func_end sub_020121A4

	thumb_func_start sub_020121F4
sub_020121F4: ; 0x020121F4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4, #0xc]
	pop {r4, pc}
	thumb_func_end sub_020121F4

	thumb_func_start sub_02012204
sub_02012204: ; 0x02012204
	push {r4, r5, r6, lr}
	mov r1, #0
	add r6, r0, #0
	bl sub_02010EE0
	mov r2, #3
	lsl r2, r2, #8
	add r0, r0, r2
	mov r1, #0
	bl memset
	ldr r0, [r6, #0x10]
	sub r4, r0, #1
	bmi _02012236
	mov r0, #0x30
	add r5, r4, #0
	mul r5, r0
_02012226:
	ldr r1, [r6, #0xc]
	add r0, r6, #0
	add r1, r1, r5
	bl sub_02012238
	sub r5, #0x30
	sub r4, r4, #1
	bpl _02012226
_02012236:
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02012204

	thumb_func_start sub_02012238
sub_02012238: ; 0x02012238
	push {r4, r5, r6, lr}
	add r4, r1, #0
	mov r1, #0
	bl sub_02010EE0
	ldr r2, [r4]
	ldr r3, [r4, #8]
	asr r1, r2, #6
	lsr r1, r1, #0x19
	add r1, r2, r1
	asr r2, r1, #7
	asr r1, r3, #6
	ldr r5, [r4, #0xc]
	lsr r1, r1, #0x19
	add r1, r3, r1
	asr r3, r5, #6
	lsr r3, r3, #0x19
	add r3, r5, r3
	ldr r4, [r4, #4]
	asr r5, r3, #7
	asr r3, r4, #6
	lsr r3, r3, #0x19
	add r3, r4, r3
	asr r3, r3, #7
	asr r1, r1, #7
	cmp r3, r5
	bge _0201228E
	lsl r4, r3, #1
	lsl r1, r1, #0x10
	add r4, r0, r4
	lsl r0, r2, #0x10
	asr r6, r1, #0x10
	mov r1, #3
	mov r2, #0x12
	asr r0, r0, #0x10
	lsl r1, r1, #8
	lsl r2, r2, #6
_02012282:
	strh r0, [r4, r1]
	strh r6, [r4, r2]
	add r3, r3, #1
	add r4, r4, #2
	cmp r3, r5
	blt _02012282
_0201228E:
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02012238

	thumb_func_start sub_02012290
sub_02012290: ; 0x02012290
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x10]
	mov r6, #0
	cmp r0, #0
	ble _020122B4
	add r4, r6, #0
_0201229E:
	ldr r1, [r5, #0xc]
	add r0, r1, r4
	add r1, r1, r4
	add r1, #0x10
	bl sub_02010A8C
	ldr r0, [r5, #0x10]
	add r6, r6, #1
	add r4, #0x30
	cmp r6, r0
	blt _0201229E
_020122B4:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02012290

	thumb_func_start sub_020122B8
sub_020122B8: ; 0x020122B8
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r0, [r5, #0x20]
	add r4, r1, #0
	mov r1, #0x38
	bl AllocFromHeap
	str r0, [r5, #0x14]
	mov r1, #0
	mov r2, #0x38
	bl memset
	ldr r0, [r5, #0x10]
	add r1, r4, #0
	str r0, [sp]
	ldr r0, [r5, #0x18]
	str r0, [sp, #4]
	ldr r0, [r5, #0x1c]
	str r0, [sp, #8]
	ldr r0, [r5, #0x20]
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x14]
	ldr r2, [r5, #4]
	ldr r3, [r5, #8]
	bl sub_02012358
	ldr r0, [r5, #0xc]
	add r0, r0, #1
	str r0, [r5, #0xc]
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end sub_020122B8

	thumb_func_start sub_020122F8
sub_020122F8: ; 0x020122F8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	mov r6, #0
	ldr r4, [r5, #0x14]
	cmp r0, #1
	beq _02012310
	cmp r0, #2
	beq _0201232C
	cmp r0, #3
	beq _0201234C
	b _02012350
_02012310:
	add r0, r4, #0
	bl sub_02012454
	cmp r0, #1
	bne _02012354
	ldr r0, [r4, #0x28]
	ldr r1, [r4, #0x30]
	ldr r2, [r5, #0x10]
	bl sub_02010F34
	ldr r0, [r5, #0xc]
	add r0, r0, #1
	str r0, [r5, #0xc]
	b _02012354
_0201232C:
	add r0, r4, #0
	bl sub_020124AC
	add r0, r4, #0
	bl sub_02010EC8
	ldr r0, [r5, #0x14]
	bl FreeToHeap
	add r0, r6, #0
	str r0, [r5, #0x14]
	ldr r0, [r5, #0xc]
	mov r6, #1
	add r0, r0, #1
	str r0, [r5, #0xc]
	b _02012354
_0201234C:
	mov r6, #1
	b _02012354
_02012350:
	bl GF_AssertFail
_02012354:
	add r0, r6, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_020122F8

	thumb_func_start sub_02012358
sub_02012358: ; 0x02012358
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r4, r1, #0
	add r5, r0, #0
	mov r1, #0
	str r1, [r5, #0xc]
	ldrh r1, [r4]
	str r2, [sp, #0x18]
	str r3, [sp, #0x1c]
	str r1, [r5, #0x10]
	ldrh r2, [r4, #2]
	ldrh r1, [r4]
	ldr r6, [sp, #0x40]
	ldr r3, [sp, #0x4c]
	sub r1, r2, r1
	str r1, [r5, #0x14]
	mov r1, #2
	add r2, r6, #0
	ldr r7, [sp, #0x44]
	bl sub_02010E64
	ldr r0, [sp, #0x18]
	mov r1, #0
	str r0, [r5, #0x18]
	ldr r0, [sp, #0x1c]
	str r1, [r5, #0x1c]
	str r0, [r5, #0x20]
	str r1, [r5, #0x24]
	ldr r0, [sp, #0x48]
	str r7, [r5, #0x30]
	str r0, [r5, #0x34]
	ldr r0, [sp, #0x4c]
	str r0, [r5, #0x2c]
	ldrh r0, [r4, #6]
	str r0, [r5, #0x28]
	add r0, r5, #0
	ldr r1, [r5, #0x1c]
	ldr r2, [r5, #0x18]
	add r0, #0xc
	bl sub_020125D4
	add r0, r5, #0
	bl sub_020124B0
	ldr r0, _02012448 ; =sub_02010F00
	ldr r2, _0201244C ; =0x000003FF
	add r1, r5, #0
	bl sub_0200E374
	add r0, r5, #0
	mov r1, #0
	bl sub_02010EE0
	str r0, [sp, #0x20]
	add r0, r5, #0
	mov r1, #1
	bl sub_02010EE0
	str r0, [sp, #0x24]
	mov r1, #3
	ldr r0, [sp, #0x20]
	str r6, [sp]
	lsl r1, r1, #8
	ldrsh r0, [r0, r1]
	mov r1, #0x12
	mov r3, #0
	str r0, [sp, #4]
	ldr r0, [sp, #0x20]
	str r3, [sp, #8]
	lsl r1, r1, #6
	ldrsh r0, [r0, r1]
	str r0, [sp, #0xc]
	mov r0, #0xc0
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x28]
	str r0, [sp, #0x14]
	ldrb r1, [r4, #4]
	ldrb r2, [r4, #5]
	add r0, r7, #0
	bl sub_02010F84
	mov r1, #3
	ldr r0, [sp, #0x24]
	str r6, [sp]
	lsl r1, r1, #8
	ldrsh r0, [r0, r1]
	mov r1, #0x12
	lsl r1, r1, #6
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	ldr r0, [sp, #0x24]
	mov r3, #1
	ldrsh r0, [r0, r1]
	str r0, [sp, #0xc]
	mov r0, #0xc0
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x28]
	str r0, [sp, #0x14]
	ldrb r1, [r4, #4]
	ldrb r2, [r4, #5]
	add r0, r7, #0
	bl sub_02010F84
	ldr r3, [r5, #0x28]
	add r0, r7, #0
	mov r1, #3
	add r2, r6, #0
	bl sub_02011068
	ldr r0, [sp, #0x4c]
	ldr r2, _02012450 ; =sub_02010C38
	str r0, [sp]
	ldr r0, [r5, #0x34]
	add r1, r5, #0
	add r3, r6, #0
	bl sub_0200FF88
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02012448: .word sub_02010F00
_0201244C: .word 0x000003FF
_02012450: .word sub_02010C38
	thumb_func_end sub_02012358

	thumb_func_start sub_02012454
sub_02012454: ; 0x02012454
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x24]
	add r1, r0, #1
	str r1, [r4, #0x24]
	ldr r0, [r4, #0x20]
	cmp r1, r0
	blt _0201249E
	mov r0, #0
	str r0, [r4, #0x24]
	ldr r0, [r4, #0x1c]
	add r1, r0, #1
	ldr r0, [r4, #0x18]
	cmp r1, r0
	bgt _02012490
	str r1, [r4, #0x1c]
	add r0, r4, #0
	ldr r2, [r4, #0x18]
	add r0, #0xc
	bl sub_020125D4
	add r0, r4, #0
	bl sub_020124B0
	ldr r0, _020124A4 ; =sub_02010F00
	ldr r2, _020124A8 ; =0x000003FF
	add r1, r4, #0
	bl sub_0200E374
	b _0201249E
_02012490:
	ldr r0, [r4, #0x34]
	ldr r1, [r4, #8]
	ldr r2, [r4, #0x2c]
	bl sub_0200FFB4
	mov r0, #1
	pop {r4, pc}
_0201249E:
	mov r0, #0
	pop {r4, pc}
	nop
_020124A4: .word sub_02010F00
_020124A8: .word 0x000003FF
	thumb_func_end sub_02012454

	thumb_func_start sub_020124AC
sub_020124AC: ; 0x020124AC
	bx lr
	.balign 4, 0
	thumb_func_end sub_020124AC

	thumb_func_start sub_020124B0
sub_020124B0: ; 0x020124B0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r0, [sp]
	ldr r0, [r0, #0xc]
	ldr r1, _020125D0 ; =0x00003FFF
	bl _s32_div_f
	lsl r0, r1, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #4]
	ldr r0, [sp]
	mov r1, #0
	bl sub_02010EE0
	add r7, r0, #0
	ldr r0, [sp]
	mov r1, #1
	bl sub_02010EE0
	add r4, r0, #0
	mov r6, #0
	add r5, r4, #0
_020124DC:
	ldr r0, [sp]
	ldr r1, [r0, #0xc]
	ldr r0, _020125D0 ; =0x00003FFF
	cmp r1, r0
	bge _02012520
	mov r1, #0x60
	ldr r0, [sp, #4]
	sub r1, r1, r6
	bl sub_020109D8
	cmp r0, #0x7f
	ble _020124F6
	mov r0, #0x7f
_020124F6:
	mov r1, #0xbf
	sub r1, r1, r6
	lsl r1, r1, #1
	add r3, r7, r1
	mov r1, #0x80
	sub r2, r1, r0
	mov r1, #3
	lsl r1, r1, #8
	strh r2, [r3, r1]
	mov r1, #0x12
	mov r2, #0x80
	lsl r1, r1, #6
	strh r2, [r3, r1]
	mov r1, #3
	lsl r1, r1, #8
	strh r2, [r5, r1]
	mov r1, #0x12
	add r0, #0x80
	lsl r1, r1, #6
	strh r0, [r5, r1]
	b _02012548
_02012520:
	mov r0, #0xbf
	sub r0, r0, r6
	lsl r0, r0, #1
	mov r1, #3
	add r0, r7, r0
	mov r2, #0
	lsl r1, r1, #8
	strh r2, [r0, r1]
	mov r1, #0x12
	mov r2, #0x80
	lsl r1, r1, #6
	strh r2, [r0, r1]
	mov r0, #3
	add r1, r2, #0
	lsl r0, r0, #8
	strh r1, [r5, r0]
	mov r0, #0x12
	mov r1, #0xff
	lsl r0, r0, #6
	strh r1, [r5, r0]
_02012548:
	add r6, r6, #1
	add r5, r5, #2
	cmp r6, #0x60
	blt _020124DC
	ldr r1, _020125D0 ; =0x00003FFF
	ldr r0, [sp, #4]
	mov r5, #0x60
	add r4, #0xc0
	sub r6, r1, r0
_0201255A:
	ldr r0, [sp]
	ldr r1, [r0, #0xc]
	ldr r0, _020125D0 ; =0x00003FFF
	cmp r1, r0
	bge _0201258A
	mov r0, #0xbf
	sub r0, r0, r5
	lsl r0, r0, #1
	mov r1, #3
	add r0, r7, r0
	mov r2, #0x80
	lsl r1, r1, #8
	strh r2, [r0, r1]
	mov r1, #0x12
	lsl r1, r1, #6
	strh r2, [r0, r1]
	mov r0, #3
	add r1, r2, #0
	lsl r0, r0, #8
	strh r1, [r4, r0]
	mov r0, #0x12
	lsl r0, r0, #6
	strh r1, [r4, r0]
	b _020125C4
_0201258A:
	add r1, r5, #0
	add r0, r6, #0
	sub r1, #0x60
	bl sub_020109D8
	add r1, r0, #0
	cmp r1, #0x7f
	ble _0201259C
	mov r1, #0x7f
_0201259C:
	mov r0, #0xbf
	sub r0, r0, r5
	lsl r0, r0, #1
	mov r2, #3
	add r0, r7, r0
	mov r3, #0
	lsl r2, r2, #8
	strh r3, [r0, r2]
	mov r2, #0x80
	sub r3, r2, r1
	mov r2, #0x12
	lsl r2, r2, #6
	strh r3, [r0, r2]
	mov r0, #3
	add r1, #0x80
	lsl r0, r0, #8
	strh r1, [r4, r0]
	mov r1, #0xff
	add r0, r2, #0
	strh r1, [r4, r0]
_020125C4:
	add r5, r5, #1
	add r4, r4, #2
	cmp r5, #0xc0
	blt _0201255A
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_020125D0: .word 0x00003FFF
	thumb_func_end sub_020124B0

	thumb_func_start sub_020125D4
sub_020125D4: ; 0x020125D4
	push {r4, lr}
	add r4, r0, #0
	ldr r3, [r4, #8]
	add r0, r3, #0
	mul r0, r1
	add r1, r2, #0
	bl _s32_div_f
	ldr r1, [r4, #4]
	add r0, r0, r1
	str r0, [r4]
	pop {r4, pc}
	thumb_func_end sub_020125D4

	thumb_func_start sub_020125EC
sub_020125EC: ; 0x020125EC
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r0, [r5, #0x20]
	add r4, r1, #0
	mov r1, #0x38
	bl AllocFromHeap
	str r0, [r5, #0x14]
	mov r1, #0
	mov r2, #0x38
	bl memset
	ldr r0, [r5, #0x10]
	add r1, r4, #0
	str r0, [sp]
	ldr r0, [r5, #0x18]
	str r0, [sp, #4]
	ldr r0, [r5, #0x1c]
	str r0, [sp, #8]
	ldr r0, [r5, #0x20]
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x14]
	ldr r2, [r5, #4]
	ldr r3, [r5, #8]
	bl sub_0201268C
	ldr r0, [r5, #0xc]
	add r0, r0, #1
	str r0, [r5, #0xc]
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end sub_020125EC

	thumb_func_start sub_0201262C
sub_0201262C: ; 0x0201262C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	mov r6, #0
	ldr r4, [r5, #0x14]
	cmp r0, #1
	beq _02012644
	cmp r0, #2
	beq _02012660
	cmp r0, #3
	beq _02012680
	b _02012684
_02012644:
	add r0, r4, #0
	bl sub_0201275C
	cmp r0, #1
	bne _02012688
	ldr r0, [r4, #0x28]
	ldr r1, [r4, #0x30]
	ldr r2, [r5, #0x10]
	bl sub_02010F34
	ldr r0, [r5, #0xc]
	add r0, r0, #1
	str r0, [r5, #0xc]
	b _02012688
_02012660:
	add r0, r4, #0
	bl sub_020127B4
	add r0, r4, #0
	bl sub_02010EC8
	ldr r0, [r5, #0x14]
	bl FreeToHeap
	add r0, r6, #0
	str r0, [r5, #0x14]
	ldr r0, [r5, #0xc]
	mov r6, #1
	add r0, r0, #1
	str r0, [r5, #0xc]
	b _02012688
_02012680:
	mov r6, #1
	b _02012688
_02012684:
	bl GF_AssertFail
_02012688:
	add r0, r6, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0201262C

	thumb_func_start sub_0201268C
sub_0201268C: ; 0x0201268C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r4, r1, #0
	ldrh r1, [r4]
	add r5, r0, #0
	str r3, [sp, #0x1c]
	str r1, [r5, #0xc]
	ldrh r1, [r4]
	str r2, [sp, #0x18]
	ldr r6, [sp, #0x38]
	str r1, [r5, #0x10]
	ldrh r2, [r4, #2]
	ldrh r1, [r4]
	ldr r3, [sp, #0x44]
	ldr r7, [sp, #0x3c]
	sub r1, r2, r1
	str r1, [r5, #0x14]
	mov r1, #2
	add r2, r6, #0
	bl sub_02010E64
	ldr r0, [sp, #0x18]
	mov r1, #0
	str r0, [r5, #0x18]
	ldr r0, [sp, #0x1c]
	str r1, [r5, #0x1c]
	str r0, [r5, #0x20]
	str r1, [r5, #0x24]
	ldr r0, [sp, #0x40]
	str r7, [r5, #0x30]
	str r0, [r5, #0x34]
	ldr r0, [sp, #0x44]
	str r0, [r5, #0x2c]
	ldrh r0, [r4, #6]
	str r0, [r5, #0x28]
	add r0, r5, #0
	bl sub_020127B8
	ldr r0, _02012750 ; =sub_02010F00
	ldr r2, _02012754 ; =0x000003FF
	add r1, r5, #0
	bl sub_0200E374
	add r0, r5, #0
	mov r1, #0
	bl sub_02010EE0
	add r0, r5, #0
	mov r1, #1
	bl sub_02010EE0
	str r6, [sp]
	mov r3, #0
	str r3, [sp, #4]
	str r3, [sp, #8]
	mov r0, #0xff
	str r0, [sp, #0xc]
	mov r0, #0xc0
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x28]
	str r0, [sp, #0x14]
	ldrb r1, [r4, #4]
	ldrb r2, [r4, #5]
	add r0, r7, #0
	bl sub_02010F84
	str r6, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0xff
	str r0, [sp, #0xc]
	mov r0, #0xc0
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x28]
	mov r3, #1
	str r0, [sp, #0x14]
	ldrb r1, [r4, #4]
	ldrb r2, [r4, #5]
	add r0, r7, #0
	bl sub_02010F84
	ldr r3, [r5, #0x28]
	add r0, r7, #0
	mov r1, #3
	add r2, r6, #0
	bl sub_02011068
	ldr r0, [sp, #0x44]
	ldr r2, _02012758 ; =sub_02010C38
	str r0, [sp]
	ldr r0, [r5, #0x34]
	add r1, r5, #0
	add r3, r6, #0
	bl sub_0200FF88
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02012750: .word sub_02010F00
_02012754: .word 0x000003FF
_02012758: .word sub_02010C38
	thumb_func_end sub_0201268C

	thumb_func_start sub_0201275C
sub_0201275C: ; 0x0201275C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x24]
	add r1, r0, #1
	str r1, [r4, #0x24]
	ldr r0, [r4, #0x20]
	cmp r1, r0
	blt _020127A6
	mov r0, #0
	str r0, [r4, #0x24]
	ldr r0, [r4, #0x1c]
	add r1, r0, #1
	ldr r0, [r4, #0x18]
	cmp r1, r0
	bgt _02012798
	str r1, [r4, #0x1c]
	add r0, r4, #0
	ldr r2, [r4, #0x18]
	add r0, #0xc
	bl sub_02012884
	add r0, r4, #0
	bl sub_020127B8
	ldr r0, _020127AC ; =sub_02010F00
	ldr r2, _020127B0 ; =0x000003FF
	add r1, r4, #0
	bl sub_0200E374
	b _020127A6
_02012798:
	ldr r0, [r4, #0x34]
	ldr r1, [r4, #8]
	ldr r2, [r4, #0x2c]
	bl sub_0200FFB4
	mov r0, #1
	pop {r4, pc}
_020127A6:
	mov r0, #0
	pop {r4, pc}
	nop
_020127AC: .word sub_02010F00
_020127B0: .word 0x000003FF
	thumb_func_end sub_0201275C

	thumb_func_start sub_020127B4
sub_020127B4: ; 0x020127B4
	bx lr
	.balign 4, 0
	thumb_func_end sub_020127B4

	thumb_func_start sub_020127B8
sub_020127B8: ; 0x020127B8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r4, r0, #0
	ldr r1, [r4, #0xc]
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	str r1, [sp, #8]
	mov r1, #0
	bl sub_02010EE0
	str r0, [sp, #0x10]
	add r0, r4, #0
	mov r1, #1
	bl sub_02010EE0
	str r0, [sp, #0xc]
	add r5, r0, #0
	ldr r1, _02012880 ; =0x00003FFF
	ldr r0, [sp, #8]
	ldr r6, [sp, #0x10]
	sub r0, r1, r0
	mov r7, #0
	str r0, [sp, #4]
_020127E6:
	mov r0, #0x60
	sub r0, r0, r7
	str r0, [sp]
	ldr r0, [sp, #8]
	ldr r1, [sp]
	bl sub_020109D8
	add r4, r0, #0
	ldr r0, [sp, #4]
	ldr r1, [sp]
	bl sub_020109D8
	cmp r4, #0x7f
	ble _02012804
	mov r4, #0x7f
_02012804:
	cmp r0, #0x7f
	ble _0201280A
	mov r0, #0x7f
_0201280A:
	mov r1, #0x80
	sub r1, r1, r0
	lsl r1, r1, #0x10
	mov r2, #3
	asr r1, r1, #0x10
	lsl r2, r2, #8
	str r1, [sp, #0x14]
	strh r1, [r6, r2]
	mov r1, #0x80
	sub r1, r1, r4
	lsl r1, r1, #0x10
	asr r2, r1, #0x10
	mov r1, #0x12
	lsl r1, r1, #6
	strh r2, [r6, r1]
	mov r1, #0xbf
	sub r1, r1, r7
	mov ip, r2
	lsl r1, r1, #1
	ldr r2, [sp, #0x10]
	add r0, #0x80
	add r3, r2, r1
	str r1, [sp, #0x18]
	mov r2, #3
	ldr r1, [sp, #0x14]
	lsl r2, r2, #8
	strh r1, [r3, r2]
	mov r1, #0x12
	mov r2, ip
	lsl r1, r1, #6
	strh r2, [r3, r1]
	add r4, #0x80
	lsl r1, r4, #0x10
	asr r2, r1, #0x10
	mov r1, #3
	lsl r1, r1, #8
	lsl r0, r0, #0x10
	strh r2, [r5, r1]
	asr r1, r0, #0x10
	mov r0, #0x12
	lsl r0, r0, #6
	strh r1, [r5, r0]
	ldr r3, [sp, #0xc]
	ldr r0, [sp, #0x18]
	add r7, r7, #1
	add r0, r3, r0
	mov r3, #3
	lsl r3, r3, #8
	strh r2, [r0, r3]
	mov r2, #0x12
	lsl r2, r2, #6
	strh r1, [r0, r2]
	add r6, r6, #2
	add r5, r5, #2
	cmp r7, #0x60
	blt _020127E6
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_02012880: .word 0x00003FFF
	thumb_func_end sub_020127B8

	thumb_func_start sub_02012884
sub_02012884: ; 0x02012884
	push {r4, lr}
	add r4, r0, #0
	ldr r3, [r4, #8]
	add r0, r3, #0
	mul r0, r1
	add r1, r2, #0
	bl _s32_div_f
	ldr r1, [r4, #4]
	add r0, r0, r1
	str r0, [r4]
	pop {r4, pc}
	thumb_func_end sub_02012884

	thumb_func_start sub_0201289C
sub_0201289C: ; 0x0201289C
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r4, r1, #0
	mov r1, #0xcd
	ldr r0, [r5, #0x20]
	lsl r1, r1, #2
	bl AllocFromHeap
	mov r2, #0xcd
	str r0, [r5, #0x14]
	mov r1, #0
	lsl r2, r2, #2
	bl memset
	ldr r0, [r5, #0x10]
	add r1, r4, #0
	str r0, [sp]
	ldr r0, [r5, #0x18]
	str r0, [sp, #4]
	ldr r0, [r5, #0x1c]
	str r0, [sp, #8]
	ldr r0, [r5, #0x20]
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x14]
	ldr r2, [r5, #4]
	ldr r3, [r5, #8]
	bl sub_02012940
	ldr r0, [r5, #0xc]
	add r0, r0, #1
	str r0, [r5, #0xc]
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0201289C

	thumb_func_start sub_020128E0
sub_020128E0: ; 0x020128E0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	mov r6, #0
	ldr r4, [r5, #0x14]
	cmp r0, #1
	beq _020128F8
	cmp r0, #2
	beq _0201291A
	cmp r0, #3
	beq _02012934
	b _02012938
_020128F8:
	add r0, r4, #0
	bl sub_02012A2C
	cmp r0, #1
	bne _0201293C
	mov r1, #0xc9
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	add r1, #8
	ldr r1, [r4, r1]
	ldr r2, [r5, #0x10]
	bl sub_02010F34
	ldr r0, [r5, #0xc]
	add r0, r0, #1
	str r0, [r5, #0xc]
	b _0201293C
_0201291A:
	add r0, r4, #0
	bl sub_02012A8C
	ldr r0, [r5, #0x14]
	bl FreeToHeap
	add r0, r6, #0
	str r0, [r5, #0x14]
	ldr r0, [r5, #0xc]
	mov r6, #1
	add r0, r0, #1
	str r0, [r5, #0xc]
	b _0201293C
_02012934:
	mov r6, #1
	b _0201293C
_02012938:
	bl GF_AssertFail
_0201293C:
	add r0, r6, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_020128E0

	thumb_func_start sub_02012940
sub_02012940: ; 0x02012940
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	ldr r7, [sp, #0x38]
	str r3, [sp, #0x1c]
	mov r3, #0
	add r4, r1, #0
	str r2, [sp, #0x18]
	str r3, [sp]
	add r1, r7, #0
	mov r2, #1
	add r5, r0, #0
	ldr r6, [sp, #0x3c]
	bl sub_02011080
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _0201297A
	add r0, r5, #0
	mov r1, #1
	mov r2, #0xc0
	bl memset
	add r0, r5, #0
	add r0, #0xc0
	mov r1, #1
	mov r2, #0xc0
	bl memset
	b _02012990
_0201297A:
	add r0, r5, #0
	mov r1, #0
	mov r2, #0xc0
	bl memset
	add r0, r5, #0
	add r0, #0xc0
	mov r1, #0
	mov r2, #0xc0
	bl memset
_02012990:
	mov r1, #0xc3
	ldr r0, [r4]
	lsl r1, r1, #2
	str r0, [r5, r1]
	ldrh r2, [r4, #4]
	add r0, r1, #4
	ldr r3, [sp, #0x44]
	str r2, [r5, r0]
	add r0, r1, #0
	ldrh r2, [r4, #6]
	add r0, #0x18
	str r2, [r5, r0]
	add r0, r1, #0
	add r0, #0x1c
	str r3, [r5, r0]
	add r2, r1, #0
	ldr r0, [sp, #0x18]
	add r2, #8
	str r0, [r5, r2]
	add r2, r1, #0
	add r2, #0xc
	mov r0, #0
	str r0, [r5, r2]
	add r2, r1, #0
	ldr r0, [sp, #0x1c]
	add r2, #0x10
	str r0, [r5, r2]
	add r2, r1, #0
	add r2, #0x14
	mov r0, #0
	str r0, [r5, r2]
	add r0, r1, #0
	add r0, #0x20
	str r6, [r5, r0]
	ldr r0, [sp, #0x40]
	add r1, #0x24
	str r0, [r5, r1]
	add r1, r5, #0
	add r2, r3, #0
	bl sub_020110DC
	ldrh r0, [r4, #6]
	cmp r0, #1
	str r7, [sp]
	bne _02012A02
	mov r3, #0
	str r3, [sp, #4]
	str r3, [sp, #8]
	str r3, [sp, #0xc]
	str r3, [sp, #0x10]
	str r0, [sp, #0x14]
	add r0, r6, #0
	mov r1, #0x20
	mov r2, #0x3f
	bl sub_02010F84
	b _02012A18
_02012A02:
	mov r3, #0
	str r3, [sp, #4]
	str r3, [sp, #8]
	str r3, [sp, #0xc]
	str r3, [sp, #0x10]
	str r0, [sp, #0x14]
	add r0, r6, #0
	mov r1, #0x3f
	mov r2, #0x20
	bl sub_02010F84
_02012A18:
	mov r3, #0xc9
	lsl r3, r3, #2
	ldr r3, [r5, r3]
	add r0, r6, #0
	mov r1, #1
	add r2, r7, #0
	bl sub_02011068
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02012940

	thumb_func_start sub_02012A2C
sub_02012A2C: ; 0x02012A2C
	push {r4, lr}
	mov r2, #0x32
	add r4, r0, #0
	lsl r2, r2, #4
	ldr r1, [r4, r2]
	add r1, r1, #1
	str r1, [r4, r2]
	sub r1, r2, #4
	ldr r3, [r4, r2]
	ldr r1, [r4, r1]
	cmp r3, r1
	blt _02012A86
	mov r1, #0
	str r1, [r4, r2]
	add r1, r2, #0
	sub r1, #8
	ldr r1, [r4, r1]
	add r3, r1, #1
	add r1, r2, #0
	sub r1, #0xc
	ldr r1, [r4, r1]
	cmp r3, r1
	bgt _02012A72
	add r1, r2, #0
	sub r1, #8
	ldr r1, [r4, r1]
	sub r2, #8
	add r1, r1, #1
	str r1, [r4, r2]
	bl sub_02012A90
	add r0, r4, #0
	bl sub_020110C4
	b _02012A86
_02012A72:
	add r0, r2, #0
	add r0, #0x10
	add r2, #8
	ldr r0, [r4, r0]
	ldr r2, [r4, r2]
	add r1, r4, #0
	bl sub_020110F4
	mov r0, #1
	pop {r4, pc}
_02012A86:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02012A2C

	thumb_func_start sub_02012A8C
sub_02012A8C: ; 0x02012A8C
	bx lr
	.balign 4, 0
	thumb_func_end sub_02012A8C

	thumb_func_start sub_02012A90
sub_02012A90: ; 0x02012A90
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #0x31
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r6, #0
	cmp r0, #0
	ble _02012ACA
	mov r7, #0x31
	add r4, r6, #0
	lsl r7, r7, #4
_02012AA6:
	mov r0, #0xc3
	lsl r0, r0, #2
	mov r2, #0xc6
	mov r3, #0xc5
	ldr r0, [r5, r0]
	lsl r2, r2, #2
	lsl r3, r3, #2
	ldr r2, [r5, r2]
	ldr r3, [r5, r3]
	add r0, r0, r4
	add r1, r5, #0
	bl sub_02012ACC
	ldr r0, [r5, r7]
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, r0
	blt _02012AA6
_02012ACA:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02012A90

	thumb_func_start sub_02012ACC
sub_02012ACC: ; 0x02012ACC
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	ldrb r6, [r7]
	ldrb r4, [r7, #1]
	add r5, r1, #0
	add r1, r3, #0
	sub r0, r4, r6
	mul r0, r2
	bl _s32_div_f
	add r0, r0, r6
	cmp r6, r4
	bhi _02012AEC
	add r1, r6, #0
	ldrh r6, [r7, #2]
	b _02012AFC
_02012AEC:
	ldrh r2, [r7, #2]
	add r1, r4, #0
	add r4, r6, #0
	cmp r2, #0
	bne _02012AFA
	mov r6, #1
	b _02012AFC
_02012AFA:
	mov r6, #0
_02012AFC:
	cmp r1, r4
	bge _02012B1A
	mov r2, #0
	mov r3, #1
_02012B04:
	cmp r1, r0
	bne _02012B12
	cmp r6, #0
	bne _02012B10
	add r6, r3, #0
	b _02012B12
_02012B10:
	add r6, r2, #0
_02012B12:
	strb r6, [r5, r1]
	add r1, r1, #1
	cmp r1, r4
	blt _02012B04
_02012B1A:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02012ACC

	thumb_func_start sub_02012B1C
sub_02012B1C: ; 0x02012B1C
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r4, r1, #0
	mov r1, #0xe2
	ldr r0, [r5, #0x20]
	lsl r1, r1, #2
	bl AllocFromHeap
	mov r2, #0xe2
	str r0, [r5, #0x14]
	mov r1, #0
	lsl r2, r2, #2
	bl memset
	ldrb r1, [r4, #0xb]
	ldr r0, [r5, #0x14]
	cmp r1, #0
	ldr r1, [r5, #0x10]
	bne _02012B5E
	str r1, [sp]
	ldr r1, [r5, #0x18]
	str r1, [sp, #4]
	ldr r1, [r5, #0x1c]
	str r1, [sp, #8]
	ldr r1, [r5, #0x20]
	str r1, [sp, #0xc]
	ldr r2, [r5, #4]
	ldr r3, [r5, #8]
	add r1, r4, #0
	bl sub_02012BE8
	b _02012B76
_02012B5E:
	str r1, [sp]
	ldr r1, [r5, #0x18]
	str r1, [sp, #4]
	ldr r1, [r5, #0x1c]
	str r1, [sp, #8]
	ldr r1, [r5, #0x20]
	str r1, [sp, #0xc]
	ldr r2, [r5, #4]
	ldr r3, [r5, #8]
	add r1, r4, #0
	bl sub_02012CDC
_02012B76:
	ldr r0, [r5, #0xc]
	add r0, r0, #1
	str r0, [r5, #0xc]
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02012B1C

	thumb_func_start sub_02012B80
sub_02012B80: ; 0x02012B80
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r1, [r5, #0xc]
	mov r4, #0
	ldr r0, [r5, #0x14]
	cmp r1, #1
	beq _02012B98
	cmp r1, #2
	beq _02012BC4
	cmp r1, #3
	beq _02012BD6
	b _02012BDA
_02012B98:
	ldr r1, _02012BE4 ; =0x00000386
	ldrb r1, [r0, r1]
	cmp r1, #0
	bne _02012BA8
	add r1, r5, #0
	bl sub_02012C68
	b _02012BAE
_02012BA8:
	add r1, r5, #0
	bl sub_02012D4C
_02012BAE:
	cmp r0, #1
	bne _02012BDE
	ldr r0, [r5, #0x28]
	ldr r1, [r5, #0x18]
	ldr r2, [r5, #0x10]
	bl sub_02010F34
	ldr r0, [r5, #0xc]
	add r0, r0, #1
	str r0, [r5, #0xc]
	b _02012BDE
_02012BC4:
	bl FreeToHeap
	add r0, r4, #0
	str r0, [r5, #0x14]
	ldr r0, [r5, #0xc]
	mov r4, #1
	add r0, r0, #1
	str r0, [r5, #0xc]
	b _02012BDE
_02012BD6:
	mov r4, #1
	b _02012BDE
_02012BDA:
	bl GF_AssertFail
_02012BDE:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_02012BE4: .word 0x00000386
	thumb_func_end sub_02012B80

	thumb_func_start sub_02012BE8
sub_02012BE8: ; 0x02012BE8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r1, #0
	add r6, r2, #0
	add r5, r0, #0
	lsl r0, r6, #0xc
	ldr r2, [r4, #0x14]
	add r7, r3, #0
	asr r1, r0, #0x1f
	asr r3, r2, #0x1f
	bl _ll_mul
	add r2, r0, #0
	mov r0, #2
	mov r3, #0
	lsl r0, r0, #0xa
	add r0, r2, r0
	adc r1, r3
	lsl r1, r1, #0x14
	lsr r0, r0, #0xc
	orr r0, r1
	asr r2, r0, #0xc
	mov r0, #0xe1
	sub r1, r6, r2
	lsl r0, r0, #2
	strb r1, [r5, r0]
	sub r1, r0, #4
	str r4, [r5, r1]
	ldrb r1, [r4, #0xb]
	add r0, r0, #2
	add r3, r7, #0
	strb r1, [r5, r0]
	ldr r0, [sp, #0x20]
	add r1, r4, #0
	str r0, [sp]
	ldr r0, [sp, #0x24]
	str r0, [sp, #4]
	add r0, r5, #0
	bl sub_020117A0
	ldrb r0, [r4, #8]
	cmp r0, #0
	bne _02012C4C
	ldrb r3, [r4, #0xb]
	ldr r0, [sp, #0x24]
	ldr r2, [sp, #0x20]
	mov r1, #1
	bl sub_02011068
	b _02012C58
_02012C4C:
	ldrb r3, [r4, #0xb]
	ldr r0, [sp, #0x24]
	ldr r2, [sp, #0x20]
	mov r1, #2
	bl sub_02011068
_02012C58:
	ldr r0, _02012C64 ; =0x00000385
	mov r1, #0
	strb r1, [r5, r0]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02012C64: .word 0x00000385
	thumb_func_end sub_02012BE8

	thumb_func_start sub_02012C68
sub_02012C68: ; 0x02012C68
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r4, r1, #0
	ldr r1, _02012CD8 ; =0x00000385
	add r5, r0, #0
	ldrb r1, [r5, r1]
	mov r6, #0
	cmp r1, #0
	beq _02012C84
	cmp r1, #1
	beq _02012CBA
	cmp r1, #2
	beq _02012CD0
	b _02012CD2
_02012C84:
	bl sub_020117FC
	cmp r0, #1
	bne _02012CD2
	ldr r2, _02012CD8 ; =0x00000385
	ldrb r0, [r5, r2]
	sub r1, r2, #5
	add r0, r0, #1
	strb r0, [r5, r2]
	ldr r0, [r4, #0x10]
	sub r2, r2, #1
	str r0, [sp]
	ldr r0, [r4, #0x18]
	str r0, [sp, #4]
	ldr r0, [r4, #0x1c]
	str r0, [sp, #8]
	ldr r0, [r4, #0x20]
	str r0, [sp, #0xc]
	ldr r1, [r5, r1]
	add r0, r5, #0
	ldrb r2, [r5, r2]
	ldr r3, [r4, #8]
	add r0, #0x4c
	add r1, #0xc
	bl sub_02012940
	b _02012CD2
_02012CBA:
	add r0, #0x4c
	bl sub_02012A2C
	cmp r0, #1
	bne _02012CD2
	ldr r0, _02012CD8 ; =0x00000385
	mov r6, #1
	ldrb r1, [r5, r0]
	add r1, r1, #1
	strb r1, [r5, r0]
	b _02012CD2
_02012CD0:
	mov r6, #1
_02012CD2:
	add r0, r6, #0
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02012CD8: .word 0x00000385
	thumb_func_end sub_02012C68

	thumb_func_start sub_02012CDC
sub_02012CDC: ; 0x02012CDC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r4, r1, #0
	add r6, r2, #0
	add r5, r0, #0
	lsl r0, r6, #0xc
	ldr r2, [r4, #0x14]
	add r7, r3, #0
	asr r1, r0, #0x1f
	asr r3, r2, #0x1f
	bl _ll_mul
	add r2, r0, #0
	mov r0, #2
	mov r3, #0
	lsl r0, r0, #0xa
	add r0, r2, r0
	adc r1, r3
	lsl r1, r1, #0x14
	lsr r0, r0, #0xc
	orr r0, r1
	mov r1, #0xe1
	asr r0, r0, #0xc
	lsl r1, r1, #2
	strb r0, [r5, r1]
	ldrb r0, [r5, r1]
	sub r2, r6, r0
	sub r0, r1, #4
	str r4, [r5, r0]
	add r0, r1, #2
	ldrb r3, [r4, #0xb]
	sub r1, r1, #4
	strb r3, [r5, r0]
	ldr r0, [sp, #0x28]
	add r3, r7, #0
	str r0, [sp]
	ldr r0, [sp, #0x2c]
	str r0, [sp, #4]
	ldr r0, [sp, #0x30]
	str r0, [sp, #8]
	ldr r0, [sp, #0x34]
	str r0, [sp, #0xc]
	ldr r1, [r5, r1]
	add r0, r5, #0
	add r0, #0x4c
	add r1, #0xc
	bl sub_02012940
	ldr r0, _02012D48 ; =0x00000385
	mov r1, #0
	strb r1, [r5, r0]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02012D48: .word 0x00000385
	thumb_func_end sub_02012CDC

	thumb_func_start sub_02012D4C
sub_02012D4C: ; 0x02012D4C
	push {r4, r5, r6, lr}
	sub sp, #8
	add r4, r1, #0
	ldr r1, _02012DD4 ; =0x00000385
	add r5, r0, #0
	ldrb r1, [r5, r1]
	mov r6, #0
	cmp r1, #0
	beq _02012D68
	cmp r1, #1
	beq _02012DB8
	cmp r1, #2
	beq _02012DCC
	b _02012DCE
_02012D68:
	add r0, #0x4c
	bl sub_02012A2C
	cmp r0, #1
	bne _02012DCE
	ldr r2, _02012DD4 ; =0x00000385
	ldrb r0, [r5, r2]
	sub r1, r2, #5
	add r0, r0, #1
	strb r0, [r5, r2]
	ldr r0, [r4, #0x10]
	sub r2, r2, #1
	str r0, [sp]
	ldr r0, [r4, #0x18]
	str r0, [sp, #4]
	ldrb r2, [r5, r2]
	ldr r1, [r5, r1]
	ldr r3, [r4, #8]
	add r0, r5, #0
	bl sub_020117A0
	mov r0, #0xe
	lsl r0, r0, #6
	ldr r3, [r5, r0]
	ldrb r0, [r3, #8]
	cmp r0, #0
	ldr r0, [r4, #0x18]
	bne _02012DAC
	ldrb r3, [r3, #0xb]
	ldr r2, [r4, #0x10]
	mov r1, #1
	bl sub_02011068
	b _02012DCE
_02012DAC:
	ldrb r3, [r3, #0xb]
	ldr r2, [r4, #0x10]
	mov r1, #2
	bl sub_02011068
	b _02012DCE
_02012DB8:
	bl sub_020117FC
	cmp r0, #1
	bne _02012DCE
	ldr r0, _02012DD4 ; =0x00000385
	mov r6, #1
	ldrb r1, [r5, r0]
	add r1, r1, #1
	strb r1, [r5, r0]
	b _02012DCE
_02012DCC:
	mov r6, #1
_02012DCE:
	add r0, r6, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02012DD4: .word 0x00000385
	thumb_func_end sub_02012D4C
