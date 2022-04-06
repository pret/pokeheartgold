	.include "asm/macros.inc"
	.include "global.inc"

	.rodata

_020F5F2C:
	.byte 0x08
_020F5F2D:
	.byte 0x08, 0x08, 0x04
	.byte 0x04, 0x08, 0x04, 0x04, 0x04, 0x02, 0x04, 0x01, 0x02, 0x04, 0x02, 0x02, 0x02, 0x01, 0x01, 0x04
	.byte 0x01, 0x02, 0x01, 0x01

	.text

	thumb_func_start sub_02013534
sub_02013534: ; 0x02013534
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r7, r1, #0
	str r0, [sp, #4]
	add r0, r7, #0
	mov r1, #0x68
	bl AllocFromHeap
	str r0, [sp, #8]
	cmp r0, #0
	bne _0201354E
	bl GF_AssertFail
_0201354E:
	ldr r4, [sp, #8]
	ldr r5, [sp, #8]
	mov r6, #0
	add r4, #0x30
_02013556:
	mov r0, #0x23
	add r1, r6, #0
	mov r2, #0
	add r3, r4, #0
	str r7, [sp]
	bl GfGfxLoader_GetCellBank
	str r0, [r5]
	cmp r0, #0
	bne _0201356E
	bl GF_AssertFail
_0201356E:
	add r6, r6, #1
	add r4, r4, #4
	add r5, r5, #4
	cmp r6, #0xc
	blt _02013556
	ldr r0, [sp, #4]
	mov r1, #0x14
	add r4, r0, #0
	mul r4, r1
	add r0, r7, #0
	add r1, r4, #0
	bl AllocFromHeap
	ldr r1, [sp, #8]
	cmp r0, #0
	str r0, [r1, #0x60]
	bne _02013594
	bl GF_AssertFail
_02013594:
	ldr r1, [sp, #4]
	ldr r0, [sp, #8]
	add r2, r4, #0
	str r1, [r0, #0x64]
	ldr r0, [r0, #0x60]
	mov r1, #0
	bl memset
	ldr r0, [sp, #8]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02013534

	thumb_func_start sub_020135AC
sub_020135AC: ; 0x020135AC
	push {r4, r5, r6, lr}
	add r6, r0, #0
	bne _020135B6
	bl GF_AssertFail
_020135B6:
	mov r4, #0
	add r5, r6, #0
_020135BA:
	ldr r0, [r5]
	bl FreeToHeap
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0xc
	blt _020135BA
	ldr r0, [r6, #0x60]
	bl FreeToHeap
	add r0, r6, #0
	bl FreeToHeap
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_020135AC

	thumb_func_start sub_020135D8
sub_020135D8: ; 0x020135D8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r0, #0
	bne _020135E4
	bl GF_AssertFail
_020135E4:
	ldr r0, [r5]
	bl sub_02013AD0
	add r4, r0, #0
	bne _020135F2
	bl GF_AssertFail
_020135F2:
	ldr r0, [r5, #0x10]
	add r3, sp, #8
	str r0, [r4, #8]
	ldr r0, [r5, #0x18]
	str r0, [r4, #0xc]
	ldr r0, [r5, #0x1c]
	str r0, [r4, #0x10]
	str r3, [sp, #0x14]
	str r3, [sp, #0x18]
	ldr r1, [r5, #4]
	ldr r2, [r5, #0x2c]
	ldrb r0, [r1, #7]
	ldrb r1, [r1, #8]
	bl sub_02013BD4
	add r6, r0, #0
	mov r1, #0x24
	ldr r0, [r5, #0x2c]
	mul r1, r6
	bl AllocFromHeapAtEnd
	add r7, r0, #0
	mov r1, #0xc
	ldr r0, [r5, #0x2c]
	mul r1, r6
	bl AllocFromHeap
	str r0, [r4]
	str r6, [r4, #4]
	ldr r0, [r5, #0x28]
	add r1, sp, #8
	str r0, [sp]
	ldr r0, [r5, #0x2c]
	add r2, r7, #0
	str r0, [sp, #4]
	ldr r0, [r5, #4]
	ldr r3, [r5, #0x14]
	bl sub_02013C5C
	add r0, r5, #0
	add r1, sp, #8
	add r2, r7, #0
	add r3, r4, #0
	bl sub_02013E78
	add r0, r7, #0
	bl FreeToHeap
	add r0, sp, #8
	bl sub_02013FA8
	add r0, r4, #0
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_020135D8

	thumb_func_start sub_02013660
sub_02013660: ; 0x02013660
	push {r4, lr}
	add r4, r0, #0
	bne _0201366A
	bl GF_AssertFail
_0201366A:
	ldr r0, [r4]
	cmp r0, #0
	bne _02013674
	bl GF_AssertFail
_02013674:
	add r0, r4, #0
	bl sub_02013ECC
	ldr r0, [r4]
	bl FreeToHeap
	add r0, r4, #0
	bl sub_02013AC0
	pop {r4, pc}
	thumb_func_end sub_02013660

	thumb_func_start sub_02013688
sub_02013688: ; 0x02013688
	push {r4, r5, lr}
	sub sp, #0x14
	add r3, sp, #0
	add r5, r0, #0
	str r3, [sp, #0xc]
	str r3, [sp, #0x10]
	add r4, r1, #0
	ldrb r0, [r5, #7]
	ldrb r1, [r5, #8]
	bl sub_02013BD4
	add r0, sp, #0
	add r1, r4, #0
	bl sub_02013E24
	add r4, r0, #0
	add r0, sp, #0
	bl sub_02013FA8
	add r0, r4, #0
	add sp, #0x14
	pop {r4, r5, pc}
	thumb_func_end sub_02013688

	thumb_func_start sub_020136B4
sub_020136B4: ; 0x020136B4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r7, r2, #0
	str r1, [sp]
	cmp r5, #0
	bne _020136C6
	bl GF_AssertFail
_020136C6:
	ldr r0, [sp]
	str r0, [r5, #0xc]
	str r7, [r5, #0x10]
	lsl r0, r0, #0xc
	str r0, [sp]
	ldr r0, [r5, #8]
	lsl r7, r7, #0xc
	cmp r0, #0
	beq _020136E8
	bl sub_020248AC
	ldr r2, [r0]
	ldr r1, [sp]
	ldr r0, [r0, #4]
	add r1, r1, r2
	str r1, [sp]
	add r7, r7, r0
_020136E8:
	mov r6, #0
	str r6, [sp, #0xc]
	ldr r0, [r5, #4]
	cmp r0, #0
	ble _02013722
	add r4, r6, #0
_020136F4:
	ldr r0, [r5]
	add r0, r0, r4
	ldr r0, [r0, #4]
	lsl r1, r0, #0xc
	ldr r0, [sp]
	add r0, r0, r1
	str r0, [sp, #4]
	ldr r0, [r5]
	add r1, sp, #4
	add r0, r0, r4
	ldr r0, [r0, #8]
	lsl r0, r0, #0xc
	add r0, r7, r0
	str r0, [sp, #8]
	ldr r0, [r5]
	ldr r0, [r0, r4]
	bl sub_020247D4
	ldr r0, [r5, #4]
	add r6, r6, #1
	add r4, #0xc
	cmp r6, r0
	blt _020136F4
_02013722:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_020136B4

	thumb_func_start sub_02013728
sub_02013728: ; 0x02013728
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	bne _02013734
	bl GF_AssertFail
_02013734:
	ldr r0, [r5, #8]
	cmp r0, #0
	beq _0201378E
	ldr r1, [r5, #0xc]
	lsl r1, r1, #0xc
	str r1, [sp]
	ldr r1, [r5, #0x10]
	lsl r7, r1, #0xc
	bl sub_020248AC
	ldr r2, [r0]
	ldr r0, [r0, #4]
	mov r6, #0
	ldr r1, [sp]
	str r6, [sp, #0xc]
	add r7, r7, r0
	add r1, r1, r2
	ldr r0, [r5, #4]
	str r1, [sp]
	cmp r0, #0
	ble _0201378E
	add r4, r6, #0
_02013760:
	ldr r0, [r5]
	add r0, r0, r4
	ldr r0, [r0, #4]
	lsl r1, r0, #0xc
	ldr r0, [sp]
	add r0, r0, r1
	str r0, [sp, #4]
	ldr r0, [r5]
	add r1, sp, #4
	add r0, r0, r4
	ldr r0, [r0, #8]
	lsl r0, r0, #0xc
	add r0, r7, r0
	str r0, [sp, #8]
	ldr r0, [r5]
	ldr r0, [r0, r4]
	bl sub_020247D4
	ldr r0, [r5, #4]
	add r6, r6, #1
	add r4, #0xc
	cmp r6, r0
	blt _02013760
_0201378E:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02013728

	thumb_func_start sub_02013794
sub_02013794: ; 0x02013794
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	cmp r5, #0
	bne _020137A4
	bl GF_AssertFail
_020137A4:
	cmp r4, #0
	bne _020137AC
	bl GF_AssertFail
_020137AC:
	cmp r6, #0
	bne _020137B4
	bl GF_AssertFail
_020137B4:
	ldr r0, [r5, #0xc]
	str r0, [r4]
	ldr r0, [r5, #0x10]
	str r0, [r6]
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02013794

	thumb_func_start sub_020137C0
sub_020137C0: ; 0x020137C0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r7, r1, #0
	cmp r5, #0
	bne _020137CE
	bl GF_AssertFail
_020137CE:
	ldr r0, [r5, #4]
	mov r6, #0
	cmp r0, #0
	ble _020137EC
	add r4, r6, #0
_020137D8:
	ldr r0, [r5]
	add r1, r7, #0
	ldr r0, [r0, r4]
	bl Set2dSpriteVisibleFlag
	ldr r0, [r5, #4]
	add r6, r6, #1
	add r4, #0xc
	cmp r6, r0
	blt _020137D8
_020137EC:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_020137C0

	thumb_func_start sub_020137F0
sub_020137F0: ; 0x020137F0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r7, r1, #0
	cmp r5, #0
	bne _020137FE
	bl GF_AssertFail
_020137FE:
	ldr r0, [r5, #4]
	mov r6, #0
	cmp r0, #0
	ble _0201381C
	add r4, r6, #0
_02013808:
	ldr r0, [r5]
	add r1, r7, #0
	ldr r0, [r0, r4]
	bl sub_02024A04
	ldr r0, [r5, #4]
	add r6, r6, #1
	add r4, #0xc
	cmp r6, r0
	blt _02013808
_0201381C:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_020137F0

	thumb_func_start sub_02013820
sub_02013820: ; 0x02013820
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r7, r1, #0
	cmp r5, #0
	bne _0201382E
	bl GF_AssertFail
_0201382E:
	ldr r0, [r5, #4]
	mov r6, #0
	cmp r0, #0
	ble _0201384C
	add r4, r6, #0
_02013838:
	ldr r0, [r5]
	add r1, r7, #0
	ldr r0, [r0, r4]
	bl sub_02024ADC
	ldr r0, [r5, #4]
	add r6, r6, #1
	add r4, #0xc
	cmp r6, r0
	blt _02013838
_0201384C:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02013820

	thumb_func_start sub_02013850
sub_02013850: ; 0x02013850
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r7, r1, #0
	cmp r5, #0
	bne _0201385E
	bl GF_AssertFail
_0201385E:
	ldr r0, [r5, #4]
	mov r6, #0
	cmp r0, #0
	ble _0201387C
	add r4, r6, #0
_02013868:
	ldr r0, [r5]
	add r1, r7, #0
	ldr r0, [r0, r4]
	bl sub_02024A14
	ldr r0, [r5, #4]
	add r6, r6, #1
	add r4, #0xc
	cmp r6, r0
	blt _02013868
_0201387C:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02013850

	thumb_func_start sub_02013880
sub_02013880: ; 0x02013880
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r7, r1, #0
	cmp r5, #0
	bne _0201388E
	bl GF_AssertFail
_0201388E:
	ldr r0, [r5, #4]
	mov r6, #0
	cmp r0, #0
	ble _020138AC
	add r4, r6, #0
_02013898:
	ldr r0, [r5]
	add r1, r7, #0
	ldr r0, [r0, r4]
	bl sub_02024A48
	ldr r0, [r5, #4]
	add r6, r6, #1
	add r4, #0xc
	cmp r6, r0
	blt _02013898
_020138AC:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02013880

	thumb_func_start sub_020138B0
sub_020138B0: ; 0x020138B0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r7, r1, #0
	cmp r5, #0
	bne _020138BE
	bl GF_AssertFail
_020138BE:
	ldr r0, [r5, #4]
	mov r6, #0
	cmp r0, #0
	ble _020138DC
	add r4, r6, #0
_020138C8:
	ldr r0, [r5]
	add r1, r7, #0
	ldr r0, [r0, r4]
	bl sub_02024A74
	ldr r0, [r5, #4]
	add r6, r6, #1
	add r4, #0xc
	cmp r6, r0
	blt _020138C8
_020138DC:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_020138B0

	thumb_func_start sub_020138E0
sub_020138E0: ; 0x020138E0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r7, r1, #0
	cmp r5, #0
	bne _020138EE
	bl GF_AssertFail
_020138EE:
	ldr r0, [r5, #4]
	mov r6, #0
	cmp r0, #0
	ble _0201390C
	add r4, r6, #0
_020138F8:
	ldr r0, [r5]
	add r1, r7, #0
	ldr r0, [r0, r4]
	bl sub_02024AA8
	ldr r0, [r5, #4]
	add r6, r6, #1
	add r4, #0xc
	cmp r6, r0
	blt _020138F8
_0201390C:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_020138E0

	thumb_func_start sub_02013910
sub_02013910: ; 0x02013910
	push {r4, r5, r6, lr}
	add r6, r1, #0
	add r5, r0, #0
	add r0, r6, #0
	mov r1, #0x18
	bl AllocFromHeap
	add r4, r0, #0
	str r4, [r4, #0xc]
	str r4, [r4, #0x10]
	ldrb r0, [r5, #7]
	ldrb r1, [r5, #8]
	add r2, r6, #0
	add r3, r4, #0
	bl sub_02013BD4
	str r0, [r4, #0x14]
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02013910

	thumb_func_start sub_02013938
sub_02013938: ; 0x02013938
	push {r4, lr}
	add r4, r0, #0
	bl sub_02013FA8
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end sub_02013938

	thumb_func_start sub_02013948
sub_02013948: ; 0x02013948
	ldr r3, _0201394C ; =sub_02013E24
	bx r3
	.balign 4, 0
_0201394C: .word sub_02013E24
	thumb_func_end sub_02013948

	thumb_func_start sub_02013950
sub_02013950: ; 0x02013950
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r6, r1, #0
	cmp r5, #0
	bne _02013960
	bl GF_AssertFail
_02013960:
	ldr r0, [r5]
	bl sub_02013AD0
	add r4, r0, #0
	bne _0201396E
	bl GF_AssertFail
_0201396E:
	ldr r0, [r5, #0x10]
	mov r1, #0x24
	str r0, [r4, #8]
	ldr r0, [r5, #0x18]
	str r0, [r4, #0xc]
	ldr r0, [r5, #0x1c]
	str r0, [r4, #0x10]
	ldr r2, [r6, #0x14]
	ldr r0, [r5, #0x2c]
	mul r1, r2
	bl AllocFromHeapAtEnd
	add r7, r0, #0
	ldr r2, [r6, #0x14]
	mov r1, #0xc
	ldr r0, [r5, #0x2c]
	mul r1, r2
	bl AllocFromHeap
	str r0, [r4]
	ldr r0, [r6, #0x14]
	add r1, r6, #0
	str r0, [r4, #4]
	ldr r0, [r5, #0x28]
	add r2, r7, #0
	str r0, [sp]
	ldr r0, [r5, #0x2c]
	str r0, [sp, #4]
	ldr r0, [r5, #4]
	ldr r3, [r5, #0x14]
	bl sub_02013C5C
	add r0, r5, #0
	add r1, r6, #0
	add r2, r7, #0
	add r3, r4, #0
	bl sub_02013E78
	add r0, r7, #0
	bl FreeToHeap
	add r0, r4, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02013950

	thumb_func_start sub_020139C8
sub_020139C8: ; 0x020139C8
	ldr r3, _020139CC ; =sub_02013660
	bx r3
	.balign 4, 0
_020139CC: .word sub_02013660
	thumb_func_end sub_020139C8

	thumb_func_start sub_020139D0
sub_020139D0: ; 0x020139D0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	ldr r0, [r0]
	add r7, r1, #0
	ldr r0, [r0]
	str r2, [sp, #4]
	add r5, r3, #0
	str r0, [sp, #8]
	bl sub_02024B60
	str r0, [sp, #0xc]
	ldr r1, [sp, #0xc]
	add r0, r7, #0
	bl sub_02013948
	add r6, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	bl AllocFromHeapAtEnd
	mov r1, #0
	add r2, r6, #0
	add r4, r0, #0
	bl memset
	ldr r0, [sp, #4]
	ldr r3, [sp, #0xc]
	add r1, r4, #0
	add r2, r7, #0
	str r5, [sp]
	bl sub_02013D88
	add r0, r4, #0
	add r1, r6, #0
	bl DC_FlushRange
	ldr r0, [sp, #8]
	bl sub_02024B1C
	ldr r1, [sp, #0xc]
	cmp r1, #1
	bne _02013A36
	mov r1, #1
	bl NNS_G2dGetImageLocation
	add r1, r0, #0
	add r0, r4, #0
	add r2, r6, #0
	bl GX_LoadOBJ
	b _02013A46
_02013A36:
	mov r1, #2
	bl NNS_G2dGetImageLocation
	add r1, r0, #0
	add r0, r4, #0
	add r2, r6, #0
	bl GXS_LoadOBJ
_02013A46:
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_020139D0

	thumb_func_start sub_02013A50
sub_02013A50: ; 0x02013A50
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r6, r0, #0
	ldr r0, [sp, #0x20]
	add r7, r1, #0
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x24]
	ldrb r1, [r6, #7]
	str r0, [sp, #0x24]
	add r0, r3, #0
	add r0, r7, r0
	str r2, [sp]
	str r3, [sp, #4]
	cmp r1, r0
	bge _02013A72
	bl GF_AssertFail
_02013A72:
	ldrb r2, [r6, #8]
	ldr r1, [sp]
	ldr r0, [sp, #0x20]
	add r0, r1, r0
	cmp r2, r0
	bge _02013A82
	bl GF_AssertFail
_02013A82:
	ldr r0, [sp]
	mov r4, #0
	cmp r0, #0
	ble _02013ABA
	lsl r0, r7, #5
	add r5, r4, #0
	str r0, [sp, #8]
_02013A90:
	ldrb r1, [r6, #7]
	ldr r0, [sp, #0x20]
	add r2, r1, #0
	add r0, r4, r0
	mul r2, r0
	ldr r0, [sp, #4]
	lsl r1, r5, #5
	add r2, r2, r0
	ldr r0, [sp, #0x24]
	lsl r2, r2, #5
	add r0, r0, r1
	ldr r1, [r6, #0xc]
	add r1, r1, r2
	ldr r2, [sp, #8]
	bl memcpy
	ldr r0, [sp]
	add r4, r4, #1
	add r5, r5, r7
	cmp r4, r0
	blt _02013A90
_02013ABA:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02013A50

	thumb_func_start sub_02013AC0
sub_02013AC0: ; 0x02013AC0
	mov r2, #0x14
	mov r1, #0
_02013AC4:
	strb r1, [r0]
	add r0, r0, #1
	sub r2, r2, #1
	bne _02013AC4
	bx lr
	.balign 4, 0
	thumb_func_end sub_02013AC0

	thumb_func_start sub_02013AD0
sub_02013AD0: ; 0x02013AD0
	ldr r1, [r0, #0x64]
	mov r2, #0
	cmp r1, #0
	ble _02013AF4
	ldr r3, [r0, #0x60]
_02013ADA:
	ldr r1, [r3]
	cmp r1, #0
	bne _02013AEA
	ldr r1, [r0, #0x60]
	mov r0, #0x14
	mul r0, r2
	add r0, r1, r0
	bx lr
_02013AEA:
	ldr r1, [r0, #0x64]
	add r2, r2, #1
	add r3, #0x14
	cmp r2, r1
	blt _02013ADA
_02013AF4:
	mov r0, #0
	bx lr
	thumb_func_end sub_02013AD0

	thumb_func_start sub_02013AF8
sub_02013AF8: ; 0x02013AF8
	push {r3, r4}
	ldr r4, _02013B20 ; =_020F5F2C
	mov r3, #0
_02013AFE:
	ldrb r2, [r4]
	cmp r2, r0
	bgt _02013B10
	ldrb r2, [r4, #1]
	cmp r2, r1
	bgt _02013B10
	add r0, r3, #0
	pop {r3, r4}
	bx lr
_02013B10:
	add r3, r3, #1
	add r4, r4, #2
	cmp r3, #0xc
	blt _02013AFE
	mov r0, #0xc
	pop {r3, r4}
	bx lr
	nop
_02013B20: .word _020F5F2C
	thumb_func_end sub_02013AF8

	thumb_func_start sub_02013B24
sub_02013B24: ; 0x02013B24
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r1, #0
	add r0, r2, #0
	bl sub_02013F78
	ldr r1, [r6, #0x10]
	add r4, r0, #0
	bl sub_02013FC0
	ldr r0, [r5, #8]
	ldr r1, [r5, #0xc]
	bl sub_02013AF8
	str r0, [r4, #8]
	ldr r0, [r5, #4]
	ldr r1, _02013BCC ; =_020F5F2C
	str r0, [r4]
	ldr r0, [r5]
	ldr r6, _02013BD0 ; =_020F5F2D
	str r0, [r4, #4]
	ldr r0, [r4, #8]
	ldr r2, [r5, #8]
	lsl r3, r0, #1
	ldrb r0, [r1, r3]
	ldrb r3, [r6, r3]
	sub r2, r2, r0
	ldr r0, [r5, #0xc]
	sub r6, r0, r3
	cmp r2, #0
	ble _02013B8C
	str r0, [r5, #0x1c]
	str r2, [r5, #0x18]
	ldr r0, [r5]
	str r0, [r5, #0x10]
	ldr r2, [r4, #8]
	ldr r0, [r5, #4]
	lsl r2, r2, #1
	ldrb r1, [r1, r2]
	add r0, r0, r1
	str r0, [r5, #0x14]
	add r0, r5, #0
	add r0, #0x20
	ldrb r0, [r0]
	cmp r0, #1
	bne _02013B84
	bl GF_AssertFail
_02013B84:
	add r0, r5, #0
	mov r1, #1
	add r0, #0x20
	strb r1, [r0]
_02013B8C:
	cmp r6, #0
	ble _02013BA2
	ldr r0, [r4, #8]
	ldr r2, [r5]
	lsl r1, r0, #1
	ldr r0, _02013BD0 ; =_020F5F2D
	ldrb r0, [r0, r1]
	add r0, r2, r0
	str r0, [r5]
	str r6, [r5, #0xc]
	b _02013BC6
_02013BA2:
	add r0, r5, #0
	add r0, #0x20
	ldrb r0, [r0]
	cmp r0, #1
	bne _02013BC2
	add r3, r5, #0
	add r3, #0x10
	add r2, r5, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	mov r0, #0
	add r5, #0x20
	strb r0, [r5]
	b _02013BC6
_02013BC2:
	mov r0, #1
	pop {r4, r5, r6, pc}
_02013BC6:
	mov r0, #0
	pop {r4, r5, r6, pc}
	nop
_02013BCC: .word _020F5F2C
_02013BD0: .word _020F5F2D
	thumb_func_end sub_02013B24

	thumb_func_start sub_02013BD4
sub_02013BD4: ; 0x02013BD4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	add r7, r0, #0
	str r1, [sp]
	add r5, r2, #0
	add r6, r3, #0
	cmp r7, #0
	bne _02013BE8
	bl GF_AssertFail
_02013BE8:
	ldr r0, [sp]
	cmp r0, #0
	bne _02013BF2
	bl GF_AssertFail
_02013BF2:
	ldr r0, [sp]
	mov r4, #0
	str r0, [sp, #0x10]
	str r4, [sp, #4]
	str r4, [sp, #8]
	str r7, [sp, #0xc]
	add r0, sp, #0x24
	strb r4, [r0]
	ldr r0, [sp]
	str r4, [sp, #0x2c]
	str r7, [sp, #0x30]
	cmp r0, #0
	beq _02013C50
	add r7, sp, #4
_02013C0E:
	ldr r0, [sp, #0xc]
	ldr r1, [sp]
	bl sub_02013AF8
	lsl r1, r0, #1
	ldr r0, _02013C58 ; =_020F5F2C
	add r0, r0, r1
	ldrb r0, [r0, #1]
	ldr r1, [sp, #4]
	add r1, r1, r0
	str r1, [sp, #0x28]
	ldr r1, [sp, #0x10]
	sub r1, r1, r0
	str r1, [sp, #0x34]
	str r0, [sp, #0x10]
_02013C2C:
	add r0, r7, #0
	add r1, r6, #0
	add r2, r5, #0
	add r4, r4, #1
	bl sub_02013B24
	cmp r0, #0
	beq _02013C2C
	add r2, sp, #0x28
	add r3, sp, #4
	ldmia r2!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r2!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [sp, #0x10]
	str r0, [sp]
	cmp r0, #0
	bne _02013C0E
_02013C50:
	add r0, r4, #0
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02013C58: .word _020F5F2C
	thumb_func_end sub_02013BD4

	thumb_func_start sub_02013C5C
sub_02013C5C: ; 0x02013C5C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x30]
	str r1, [sp, #0x14]
	str r0, [sp, #0x30]
	ldr r0, [sp, #0x34]
	add r5, r2, #0
	str r0, [sp, #0x34]
	ldr r0, [sp, #0x30]
	add r6, r3, #0
	cmp r0, #1
	bne _02013C7E
	mov r0, #1
	lsl r0, r0, #0x1a
	ldr r1, [r0]
	b _02013C82
_02013C7E:
	ldr r0, _02013CC8 ; =0x04001000
	ldr r1, [r0]
_02013C82:
	ldr r0, _02013CCC ; =0x00300010
	add r7, r1, #0
	and r7, r0
	add r0, r7, #0
	bl sub_02022448
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x14]
	ldr r4, [r0, #0xc]
	cmp r4, r0
	beq _02013CC2
_02013C98:
	add r0, r5, #0
	bl NNS_G2dInitImageProxy
	str r7, [sp]
	ldr r0, [sp, #0x30]
	str r6, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [sp, #0x34]
	ldr r3, [sp, #0x18]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x10]
	add r1, r4, #0
	add r2, r5, #0
	bl sub_02013CD0
	add r6, r0, #0
	ldr r4, [r4, #0xc]
	ldr r0, [sp, #0x14]
	add r5, #0x24
	cmp r4, r0
	bne _02013C98
_02013CC2:
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_02013CC8: .word 0x04001000
_02013CCC: .word 0x00300010
	thumb_func_end sub_02013C5C

	thumb_func_start sub_02013CD0
sub_02013CD0: ; 0x02013CD0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r6, r1, #0
	str r0, [sp, #8]
	ldr r0, [r6, #8]
	add r5, r2, #0
	lsl r1, r0, #1
	ldr r0, _02013D74 ; =_020F5F2C
	ldrb r0, [r0, r1]
	str r0, [sp, #0x10]
	ldr r0, _02013D78 ; =_020F5F2D
	ldrb r0, [r0, r1]
	ldr r1, [sp, #0x10]
	add r4, r1, #0
	mul r4, r0
	str r0, [sp, #0xc]
	cmp r4, r3
	bge _02013CF6
	add r4, r3, #0
_02013CF6:
	lsl r4, r4, #5
	ldr r0, [sp, #0x34]
	add r1, r4, #0
	bl AllocFromHeapAtEnd
	add r7, r0, #0
	ldr r0, [r6, #4]
	ldr r1, [sp, #0x10]
	str r0, [sp]
	str r7, [sp, #4]
	ldr r0, [sp, #8]
	ldr r2, [sp, #0xc]
	ldr r3, [r6]
	bl sub_02013A50
	add r0, r7, #0
	add r1, r4, #0
	bl DC_FlushRange
	ldr r0, [sp, #0x30]
	cmp r0, #1
	bne _02013D38
	ldr r6, [sp, #0x2c]
	add r0, r7, #0
	add r1, r6, #0
	add r2, r4, #0
	bl GX_LoadOBJ
	mov r0, #1
	str r6, [r5, #4]
	lsl r0, r0, #0x1a
	ldr r1, [r0]
	b _02013D4A
_02013D38:
	ldr r6, [sp, #0x2c]
	add r0, r7, #0
	add r1, r6, #0
	add r2, r4, #0
	bl GXS_LoadOBJ
	ldr r0, _02013D7C ; =0x04001000
	str r6, [r5, #8]
	ldr r1, [r0]
_02013D4A:
	ldr r0, _02013D80 ; =0x00300010
	and r0, r1
	str r0, [r5, #0x20]
	ldr r0, _02013D84 ; =0x0000FFFF
	str r0, [r5, #0xc]
	str r0, [r5, #0x10]
	mov r0, #3
	str r0, [r5, #0x14]
	mov r0, #0
	str r0, [r5, #0x18]
	mov r0, #1
	str r0, [r5, #0x1c]
	ldr r0, [sp, #0x28]
	str r0, [r5, #0x20]
	add r0, r7, #0
	bl FreeToHeap
	ldr r0, [sp, #0x2c]
	add r0, r0, r4
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02013D74: .word _020F5F2C
_02013D78: .word _020F5F2D
_02013D7C: .word 0x04001000
_02013D80: .word 0x00300010
_02013D84: .word 0x0000FFFF
	thumb_func_end sub_02013CD0

	thumb_func_start sub_02013D88
sub_02013D88: ; 0x02013D88
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r6, r2, #0
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	ldr r7, [sp, #0x30]
	cmp r3, #1
	bne _02013DA0
	mov r0, #1
	lsl r0, r0, #0x1a
	ldr r1, [r0]
	b _02013DA4
_02013DA0:
	ldr r0, _02013DD8 ; =0x04001000
	ldr r1, [r0]
_02013DA4:
	ldr r0, _02013DDC ; =0x00300010
	add r5, r1, #0
	and r5, r0
	add r0, r5, #0
	bl sub_02022448
	ldr r4, [r6, #0xc]
	str r0, [sp, #0x14]
	mov r3, #0
	cmp r4, r6
	beq _02013DD4
_02013DBA:
	ldr r0, [sp, #0x14]
	ldr r2, [sp, #0x10]
	str r0, [sp]
	str r5, [sp, #4]
	ldr r0, [sp, #0xc]
	str r7, [sp, #8]
	add r1, r4, #0
	bl sub_02013DE0
	ldr r4, [r4, #0xc]
	add r3, r0, #0
	cmp r4, r6
	bne _02013DBA
_02013DD4:
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02013DD8: .word 0x04001000
_02013DDC: .word 0x00300010
	thumb_func_end sub_02013D88

	thumb_func_start sub_02013DE0
sub_02013DE0: ; 0x02013DE0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r6, r1, #0
	ldr r1, [r6, #8]
	add r7, r0, #0
	add r0, r2, #0
	lsl r2, r1, #1
	ldr r1, _02013E1C ; =_020F5F2C
	add r5, r3, #0
	ldrb r1, [r1, r2]
	ldr r3, _02013E20 ; =_020F5F2D
	ldrb r2, [r3, r2]
	add r4, r1, #0
	ldr r3, [sp, #0x20]
	mul r4, r2
	cmp r4, r3
	bge _02013E04
	add r4, r3, #0
_02013E04:
	ldr r3, [r6, #4]
	add r0, r0, r5
	str r3, [sp]
	str r0, [sp, #4]
	ldr r3, [r6]
	add r0, r7, #0
	bl sub_02013A50
	lsl r0, r4, #5
	add r0, r5, r0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02013E1C: .word _020F5F2C
_02013E20: .word _020F5F2D
	thumb_func_end sub_02013DE0

	thumb_func_start sub_02013E24
sub_02013E24: ; 0x02013E24
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	cmp r1, #1
	bne _02013E34
	mov r0, #1
	lsl r0, r0, #0x1a
	ldr r1, [r0]
	b _02013E38
_02013E34:
	ldr r0, _02013E6C ; =0x04001000
	ldr r1, [r0]
_02013E38:
	ldr r0, _02013E70 ; =0x00300010
	and r0, r1
	bl sub_02022448
	ldr r2, [r4, #0xc]
	mov r3, #0
	cmp r2, r4
	beq _02013E66
	ldr r1, _02013E74 ; =_020F5F2C
_02013E4A:
	ldr r5, [r2, #8]
	lsl r5, r5, #1
	add r7, r1, r5
	ldrb r6, [r1, r5]
	ldrb r5, [r7, #1]
	mul r5, r6
	cmp r5, r0
	bge _02013E5C
	add r5, r0, #0
_02013E5C:
	ldr r2, [r2, #0xc]
	lsl r5, r5, #5
	add r3, r3, r5
	cmp r2, r4
	bne _02013E4A
_02013E66:
	add r0, r3, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02013E6C: .word 0x04001000
_02013E70: .word 0x00300010
_02013E74: .word _020F5F2C
	thumb_func_end sub_02013E24

	thumb_func_start sub_02013E78
sub_02013E78: ; 0x02013E78
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r0, [sp]
	add r0, r1, #0
	ldr r4, [r0, #0xc]
	str r1, [sp, #4]
	add r7, r2, #0
	add r6, r3, #0
	cmp r4, r0
	beq _02013EC8
	mov r5, #0
_02013E8E:
	ldr r0, [sp]
	add r1, r4, #0
	add r2, r7, #0
	bl sub_02013EF0
	ldr r1, [r6]
	str r0, [r1, r5]
	ldr r0, [r6]
	ldr r0, [r0, r5]
	cmp r0, #0
	bne _02013EA8
	bl GF_AssertFail
_02013EA8:
	ldr r0, [r4]
	add r7, #0x24
	lsl r1, r0, #3
	ldr r0, [r6]
	add r0, r0, r5
	str r1, [r0, #4]
	ldr r0, [r4, #4]
	lsl r1, r0, #3
	ldr r0, [r6]
	add r0, r0, r5
	str r1, [r0, #8]
	ldr r4, [r4, #0xc]
	ldr r0, [sp, #4]
	add r5, #0xc
	cmp r4, r0
	bne _02013E8E
_02013EC8:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02013E78

	thumb_func_start sub_02013ECC
sub_02013ECC: ; 0x02013ECC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #4]
	mov r6, #0
	cmp r0, #0
	ble _02013EEC
	add r4, r6, #0
_02013EDA:
	ldr r0, [r5]
	ldr r0, [r0, r4]
	bl sub_02024758
	ldr r0, [r5, #4]
	add r6, r6, #1
	add r4, #0xc
	cmp r6, r0
	blt _02013EDA
_02013EEC:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02013ECC

	thumb_func_start sub_02013EF0
sub_02013EF0: ; 0x02013EF0
	push {r4, r5, lr}
	sub sp, #0x44
	add r5, r0, #0
	mov r0, #0
	str r2, [sp]
	str r0, [sp, #4]
	add r4, r1, #0
	ldr r1, [r5, #0xc]
	str r1, [sp, #8]
	ldr r1, [r4, #8]
	ldr r2, [r5]
	lsl r1, r1, #2
	add r1, r2, r1
	ldr r1, [r1, #0x30]
	str r1, [sp, #0xc]
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	str r0, [sp, #0x18]
	str r0, [sp, #0x1c]
	ldr r2, [r5, #0x20]
	add r1, sp, #0x20
	strb r2, [r1]
	ldr r1, [r5, #8]
	str r1, [sp, #0x24]
	add r1, sp, #0
	str r1, [sp, #0x28]
	ldr r1, [r5, #0x24]
	str r1, [sp, #0x38]
	ldr r1, [r5, #0x28]
	str r1, [sp, #0x3c]
	ldr r1, [r5, #0x2c]
	str r1, [sp, #0x40]
	str r0, [sp, #0x2c]
	str r0, [sp, #0x30]
	str r0, [sp, #0x34]
	ldr r0, [r5, #0x10]
	cmp r0, #0
	beq _02013F4C
	bl sub_020248AC
	add r3, r0, #0
	ldmia r3!, {r0, r1}
	add r2, sp, #0x2c
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
_02013F4C:
	ldr r1, [r4]
	ldr r2, [r5, #0x18]
	lsl r1, r1, #3
	add r1, r2, r1
	ldr r0, [sp, #0x2c]
	lsl r1, r1, #0xc
	add r0, r0, r1
	str r0, [sp, #0x2c]
	ldr r1, [r4, #4]
	ldr r2, [r5, #0x1c]
	lsl r1, r1, #3
	add r1, r2, r1
	ldr r0, [sp, #0x30]
	lsl r1, r1, #0xc
	add r0, r0, r1
	str r0, [sp, #0x30]
	add r0, sp, #0x24
	bl sub_02024714
	add sp, #0x44
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02013EF0

	thumb_func_start sub_02013F78
sub_02013F78: ; 0x02013F78
	push {r4, lr}
	mov r1, #0x14
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	bne _02013F88
	bl GF_AssertFail
_02013F88:
	mov r0, #0
	str r0, [r4, #0xc]
	str r0, [r4, #0x10]
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02013F78

	thumb_func_start sub_02013F94
sub_02013F94: ; 0x02013F94
	push {r4, lr}
	add r4, r0, #0
	bne _02013F9E
	bl GF_AssertFail
_02013F9E:
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02013F94

	thumb_func_start sub_02013FA8
sub_02013FA8: ; 0x02013FA8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	cmp r0, r5
	beq _02013FBE
_02013FB2:
	ldr r4, [r0, #0xc]
	bl sub_02013F94
	add r0, r4, #0
	cmp r4, r5
	bne _02013FB2
_02013FBE:
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02013FA8

	thumb_func_start sub_02013FC0
sub_02013FC0: ; 0x02013FC0
	ldr r2, [r1, #0xc]
	str r2, [r0, #0xc]
	str r1, [r0, #0x10]
	ldr r2, [r1, #0xc]
	str r0, [r2, #0x10]
	str r0, [r1, #0xc]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02013FC0

	thumb_func_start sub_02013FD0
sub_02013FD0: ; 0x02013FD0
	ldr r3, _02013FD8 ; =sub_02013728
	str r1, [r0, #8]
	bx r3
	nop
_02013FD8: .word sub_02013728
	thumb_func_end sub_02013FD0
