#include "constants/pokemon.h"
	.include "asm/macros.inc"
	.include "unk_0202B614.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_0202B614
sub_0202B614: ; 0x0202B614
	ldr r1, _0202B628 ; =0x00001234
	cmp r0, r1
	beq _0202B620
	ldr r1, _0202B62C ; =0x00002345
	cmp r0, r1
	bne _0202B624
_0202B620:
	mov r0, #1
	bx lr
_0202B624:
	mov r0, #0
	bx lr
	.balign 4, 0
_0202B628: .word 0x00001234
_0202B62C: .word 0x00002345
	thumb_func_end sub_0202B614

	thumb_func_start sub_0202B630
sub_0202B630: ; 0x0202B630
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r1, #0
	add r6, r2, #0
	add r4, r0, #0
	add r1, sp, #4
	add r2, sp, #0
	add r7, r3, #0
	bl ov41_02249780
	add r0, r4, #0
	bl ov41_02249710
	add r4, r0, #0
	mov r0, #1
	ldr r1, [sp, #4]
	lsl r0, r0, #8
	cmp r1, r0
	blt _0202B65A
	bl GF_AssertFail
_0202B65A:
	mov r0, #1
	ldr r1, [sp]
	lsl r0, r0, #8
	cmp r1, r0
	blt _0202B668
	bl GF_AssertFail
_0202B668:
	mov r0, #0x7f
	mvn r0, r0
	cmp r4, r0
	bgt _0202B674
	bl GF_AssertFail
_0202B674:
	ldr r0, [sp, #4]
	strb r0, [r5]
	ldr r0, [sp]
	strb r0, [r6]
	strb r4, [r7]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0202B630

	thumb_func_start sub_0202B684
sub_0202B684: ; 0x0202B684
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r6, r2, #0
	add r0, r4, #0
	mov r1, #MON_DATA_SPECIES
	mov r2, #0
	add r7, r3, #0
	bl GetMonData
	add r2, r5, #0
	strh r0, [r5, #8]
	add r0, r4, #0
	mov r1, #MON_DATA_NICKNAME
	add r2, #0xa
	bl GetMonData
	mov r1, #MON_DATA_PERSONALITY
	add r0, r4, #0
	add r2, r1, #0
	bl GetMonData
	str r0, [r5]
	add r0, r4, #0
	mov r1, #MON_DATA_OTID
	mov r2, #0
	bl GetMonData
	str r0, [r5, #4]
	add r0, r4, #0
	mov r1, #MON_DATA_FORM
	mov r2, #0
	bl GetMonData
	add r1, r5, #0
	add r1, #0x33
	strb r0, [r1]
	add r0, r5, #0
	add r0, #0x31
	strb r6, [r0]
	add r0, r5, #0
	add r0, #0x32
	strb r7, [r0]
	add r1, sp, #8
	mov r0, #0x10
	ldrsb r0, [r1, r0]
	add r5, #0x30
	strb r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0202B684

	thumb_func_start sub_0202B6E8
sub_0202B6E8: ; 0x0202B6E8
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	add r4, r1, #0
	add r0, r2, #0
	add r1, sp, #4
	add r2, sp, #4
	add r1, #2
	add r2, #1
	add r3, sp, #4
	bl sub_0202B630
	add r3, sp, #4
	mov r0, #0
	ldrsb r0, [r3, r0]
	add r1, r4, #0
	str r0, [sp]
	ldrb r2, [r3, #2]
	ldrb r3, [r3, #1]
	add r0, r5, #0
	bl sub_0202B684
	add sp, #8
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0202B6E8

	thumb_func_start sub_0202B718
sub_0202B718: ; 0x0202B718
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, r1, #0
	add r1, r5, #0
	add r4, r2, #0
	add r1, #0x20
	mov r2, #8
	bl CopyStringToU16Array
	add r5, #0x34
	strb r4, [r5]
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0202B718

	thumb_func_start sub_0202B730
sub_0202B730: ; 0x0202B730
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r4, r1, #0
	mov r1, #1
	add r5, r0, #0
	str r1, [sp]
	ldr r0, [r5]
	mov r2, #0
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r0, [r5, #4]
	add r3, r2, #0
	str r0, [sp, #0xc]
	ldrh r1, [r5, #8]
	add r0, r4, #0
	bl CreateMon
	add r2, r5, #0
	add r0, r4, #0
	mov r1, #0x75
	add r2, #0xa
	bl SetMonData
	add r5, #0x33
	add r0, r4, #0
	mov r1, #0x70
	add r2, r5, #0
	bl SetMonData
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0202B730

	thumb_func_start sub_0202B770
sub_0202B770: ; 0x0202B770
	strb r1, [r0]
	ldr r1, _0202B780 ; =0xFFFFFFF0
	strb r2, [r0, #1]
	strb r3, [r0, #2]
	add r1, sp
	ldrb r1, [r1, #0x10]
	strb r1, [r0, #3]
	bx lr
	.balign 4, 0
_0202B780: .word 0xFFFFFFF0
	thumb_func_end sub_0202B770

	thumb_func_start sub_0202B784
sub_0202B784: ; 0x0202B784
	push {r4, r5, r6, lr}
	add r4, r2, #0
	add r5, r0, #0
	add r6, r1, #0
	cmp r4, #0x3d
	blo _0202B794
	bl GF_AssertFail
_0202B794:
	lsr r2, r4, #0x1f
	lsl r1, r4, #0x1d
	sub r1, r1, r2
	mov r0, #0x1d
	ror r1, r0
	add r0, r2, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	lsl r0, r0, #0x1a
	lsr r1, r0, #0x18
	lsr r0, r4, #3
	lsl r0, r0, #0x18
	mov r2, #0xf
	lsr r0, r0, #0x16
	lsl r2, r1
	ldr r3, [r5, r0]
	mvn r2, r2
	and r2, r3
	str r2, [r5, r0]
	add r2, r6, #0
	ldr r3, [r5, r0]
	lsl r2, r1
	add r1, r3, #0
	orr r1, r2
	str r1, [r5, r0]
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0202B784

	thumb_func_start sub_0202B7C8
sub_0202B7C8: ; 0x0202B7C8
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #0x3d
	blo _0202B7D6
	bl GF_AssertFail
_0202B7D6:
	lsr r3, r4, #0x1f
	lsl r2, r4, #0x1d
	lsr r0, r4, #3
	lsl r0, r0, #0x18
	lsr r0, r0, #0x16
	sub r2, r2, r3
	mov r1, #0x1d
	ror r2, r1
	add r1, r3, r2
	lsl r1, r1, #0x18
	ldr r0, [r5, r0]
	lsr r1, r1, #0x18
	lsl r1, r1, #0x1a
	add r2, r0, #0
	lsr r1, r1, #0x18
	lsr r2, r1
	mov r0, #0xf
	and r0, r2
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #9
	bls _0202B804
	mov r0, #9
_0202B804:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0202B7C8

	thumb_func_start sub_0202B808
sub_0202B808: ; 0x0202B808
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r6, r2, #0
	cmp r4, #2
	blo _0202B818
	bl GF_AssertFail
_0202B818:
	lsr r2, r6, #0x1f
	lsl r1, r6, #0x1b
	sub r1, r1, r2
	mov r0, #0x1b
	ror r1, r0
	add r0, r2, r1
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	lsr r0, r6, #5
	lsl r0, r0, #0x18
	mov r2, #1
	lsr r0, r0, #0x16
	lsl r2, r1
	ldr r3, [r5, r0]
	mvn r2, r2
	and r2, r3
	str r2, [r5, r0]
	add r2, r4, #0
	ldr r3, [r5, r0]
	lsl r2, r1
	add r1, r3, #0
	orr r1, r2
	str r1, [r5, r0]
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0202B808

	thumb_func_start sub_0202B848
sub_0202B848: ; 0x0202B848
	lsr r2, r1, #5
	lsl r2, r2, #0x18
	lsr r2, r2, #0x16
	ldr r3, [r0, r2]
	lsr r2, r1, #0x1f
	lsl r1, r1, #0x1b
	sub r1, r1, r2
	mov r0, #0x1b
	ror r1, r0
	add r0, r2, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	add r1, r3, #0
	lsr r1, r0
	mov r0, #1
	and r0, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202B848

	thumb_func_start sub_0202B870
sub_0202B870: ; 0x0202B870
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r6, r2, #0
	cmp r4, #0x12
	bls _0202B880
	bl GF_AssertFail
_0202B880:
	lsr r2, r6, #0x1f
	lsl r1, r6, #0x1e
	sub r1, r1, r2
	mov r0, #0x1e
	ror r1, r0
	add r0, r2, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	lsl r0, r0, #0x1b
	lsr r1, r0, #0x18
	lsr r0, r6, #2
	lsl r0, r0, #0x18
	mov r2, #0xff
	lsr r0, r0, #0x16
	lsl r2, r1
	ldr r3, [r5, r0]
	mvn r2, r2
	and r2, r3
	str r2, [r5, r0]
	add r2, r4, #0
	ldr r3, [r5, r0]
	lsl r2, r1
	add r1, r3, #0
	orr r1, r2
	str r1, [r5, r0]
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0202B870

	thumb_func_start sub_0202B8B4
sub_0202B8B4: ; 0x0202B8B4
	lsr r2, r1, #2
	lsl r2, r2, #0x18
	lsr r2, r2, #0x16
	ldr r0, [r0, r2]
	lsr r3, r1, #0x1f
	lsl r2, r1, #0x1e
	sub r2, r2, r3
	mov r1, #0x1e
	ror r2, r1
	add r1, r3, r2
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	lsl r1, r1, #0x1b
	lsr r1, r1, #0x18
	lsr r0, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bx lr
	thumb_func_end sub_0202B8B4

	thumb_func_start sub_0202B8D8
sub_0202B8D8: ; 0x0202B8D8
	push {r4, r5, r6, lr}
	mov r5, #0
	add r6, r0, #0
	add r4, r5, #0
_0202B8E0:
	lsl r1, r4, #0x18
	add r0, r6, #0
	lsr r1, r1, #0x18
	bl sub_0202B8B4
	cmp r0, #0x12
	beq _0202B8F0
	add r5, r5, #1
_0202B8F0:
	add r4, r4, #1
	cmp r4, #0x12
	blt _0202B8E0
	lsl r0, r5, #0x18
	lsr r0, r0, #0x18
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0202B8D8

	thumb_func_start sub_0202B8FC
sub_0202B8FC: ; 0x0202B8FC
	cmp r0, #0x3d
	bhs _0202B904
	mov r0, #1
	bx lr
_0202B904:
	mov r0, #0
	bx lr
	thumb_func_end sub_0202B8FC

	thumb_func_start sub_0202B908
sub_0202B908: ; 0x0202B908
	push {r4, r5, r6, lr}
	mov r1, #0
	mov r2, #0x40
	add r5, r0, #0
	bl memset
	mov r4, #0
	add r5, #0x28
	mov r6, #0x12
_0202B91A:
	lsl r2, r4, #0x18
	add r0, r5, #0
	add r1, r6, #0
	lsr r2, r2, #0x18
	bl sub_0202B870
	add r4, r4, #1
	cmp r4, #0x12
	blt _0202B91A
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0202B908

	thumb_func_start Save_FashionData_Init
Save_FashionData_Init: ; 0x0202B930
	push {r3, r4, r5, r6, r7, lr}
	mov r4, #0
	ldr r6, _0202B980 ; =0x00001234
	str r0, [sp]
	add r5, r0, #0
	add r7, r4, #0
_0202B93C:
	add r0, r5, #0
	add r1, r7, #0
	mov r2, #0x74
	bl memset
	str r6, [r5]
	add r4, r4, #1
	add r5, #0x74
	cmp r4, #0xb
	blt _0202B93C
	ldr r0, [sp]
	ldr r1, _0202B984 ; =0x000004FC
	ldr r7, _0202B980 ; =0x00001234
	mov r6, #0
	add r4, r0, r1
	add r5, r0, #0
_0202B95C:
	add r0, r4, #0
	mov r1, #0
	mov r2, #0x98
	bl memset
	ldr r0, _0202B984 ; =0x000004FC
	add r6, r6, #1
	str r7, [r5, r0]
	add r4, #0x98
	add r5, #0x98
	cmp r6, #5
	blt _0202B95C
	ldr r1, _0202B988 ; =0x000007F4
	ldr r0, [sp]
	add r0, r0, r1
	bl sub_0202B908
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0202B980: .word 0x00001234
_0202B984: .word 0x000004FC
_0202B988: .word 0x000007F4
	thumb_func_end Save_FashionData_Init

	thumb_func_start Save_FashionData_sizeof
Save_FashionData_sizeof: ; 0x0202B98C
	ldr r0, _0202B990 ; =0x00000834
	bx lr
	.balign 4, 0
_0202B990: .word 0x00000834
	thumb_func_end Save_FashionData_sizeof

	thumb_func_start sub_0202B994
sub_0202B994: ; 0x0202B994
	mov r0, #0x74
	bx lr
	thumb_func_end sub_0202B994

	thumb_func_start sub_0202B998
sub_0202B998: ; 0x0202B998
	push {r4, lr}
	mov r1, #0x74
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x74
	add r4, r0, #0
	bl memset
	ldr r0, _0202B9B4 ; =0x00001234
	str r0, [r4]
	add r0, r4, #0
	pop {r4, pc}
	nop
_0202B9B4: .word 0x00001234
	thumb_func_end sub_0202B998

	thumb_func_start sub_0202B9B8
sub_0202B9B8: ; 0x0202B9B8
	push {r4, r5, r6, lr}
	add r6, r1, #0
	add r5, r0, #0
	cmp r6, #0xb
	blt _0202B9C6
	bl GF_AssertFail
_0202B9C6:
	mov r0, #0x74
	add r4, r6, #0
	mul r4, r0
	ldr r0, [r5, r4]
	bl sub_0202B614
	cmp r0, #0
	bne _0202B9DA
	bl GF_AssertFail
_0202B9DA:
	add r0, r5, r4
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0202B9B8

	thumb_func_start Save_FashionData_GetFashionCase
Save_FashionData_GetFashionCase: ; 0x0202B9E0
	ldr r1, _0202B9E8 ; =0x000007F4
	add r0, r0, r1
	bx lr
	nop
_0202B9E8: .word 0x000007F4
	thumb_func_end Save_FashionData_GetFashionCase

	thumb_func_start sub_0202B9EC
sub_0202B9EC: ; 0x0202B9EC
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #0xb
	blt _0202B9FA
	bl GF_AssertFail
_0202B9FA:
	mov r0, #0x74
	mul r0, r4
	add r0, r5, r0
	bl sub_0202BC10
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0202B9EC

	thumb_func_start sub_0202BA08
sub_0202BA08: ; 0x0202BA08
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #5
	blt _0202BA16
	bl GF_AssertFail
_0202BA16:
	ldr r0, _0202BA28 ; =0x000004FC
	add r1, r5, r0
	mov r0, #0x98
	mul r0, r4
	add r0, r1, r0
	bl sub_0202BEA4
	pop {r3, r4, r5, pc}
	nop
_0202BA28: .word 0x000004FC
	thumb_func_end sub_0202BA08

	thumb_func_start sub_0202BA2C
sub_0202BA2C: ; 0x0202BA2C
	push {r3, r4, r5, r6, r7, lr}
	add r7, r1, #0
	add r5, r2, #0
	mov r4, #1
	bl sub_0202BA70
	add r6, r0, #0
	add r0, r7, #0
	bl sub_0202B8FC
	cmp r0, #0
	beq _0202BA4E
	add r0, r6, r5
	cmp r0, #9
	bls _0202BA56
	mov r4, #0
	b _0202BA56
_0202BA4E:
	add r0, r6, r5
	cmp r0, #1
	bls _0202BA56
	mov r4, #0
_0202BA56:
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0202BA2C

	thumb_func_start sub_0202BA5C
sub_0202BA5C: ; 0x0202BA5C
	push {r3, lr}
	bl sub_0202BAB0
	cmp r0, #0x12
	beq _0202BA6A
	mov r0, #1
	pop {r3, pc}
_0202BA6A:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0202BA5C

	thumb_func_start sub_0202BA70
sub_0202BA70: ; 0x0202BA70
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r0, #0
	cmp r5, #0x64
	blo _0202BA7E
	bl GF_AssertFail
_0202BA7E:
	add r0, r5, #0
	bl sub_0202B8FC
	cmp r0, #0
	beq _0202BA94
	lsl r1, r5, #0x18
	add r0, r4, #0
	lsr r1, r1, #0x18
	bl sub_0202B7C8
	pop {r3, r4, r5, pc}
_0202BA94:
	cmp r5, #0x3d
	bhs _0202BA9C
	bl GF_AssertFail
_0202BA9C:
	sub r5, #0x3d
	lsl r0, r5, #0x18
	lsr r1, r0, #0x18
	add r4, #0x20
	lsl r1, r1, #0x18
	add r0, r4, #0
	lsr r1, r1, #0x18
	bl sub_0202B848
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0202BA70

	thumb_func_start sub_0202BAB0
sub_0202BAB0: ; 0x0202BAB0
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #0x12
	blo _0202BABE
	bl GF_AssertFail
_0202BABE:
	add r5, #0x28
	lsl r1, r4, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl sub_0202B8B4
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0202BAB0

	thumb_func_start FashionCase_CountAccessories
FashionCase_CountAccessories: ; 0x0202BACC
	push {r4, r5, r6, lr}
	mov r5, #0
	add r6, r0, #0
	add r4, r5, #0
_0202BAD4:
	add r0, r6, #0
	add r1, r4, #0
	bl sub_0202BA70
	add r4, r4, #1
	add r5, r5, r0
	cmp r4, #0x64
	blt _0202BAD4
	add r0, r5, #0
	pop {r4, r5, r6, pc}
	thumb_func_end FashionCase_CountAccessories

	thumb_func_start FashionCase_CountWallpapers
FashionCase_CountWallpapers: ; 0x0202BAE8
	push {r4, r5, r6, lr}
	mov r5, #0
	add r6, r0, #0
	add r4, r5, #0
_0202BAF0:
	add r0, r6, #0
	add r1, r4, #0
	bl sub_0202BAB0
	cmp r0, #0x12
	beq _0202BAFE
	add r5, r5, #1
_0202BAFE:
	add r4, r4, #1
	cmp r4, #0x12
	blt _0202BAF0
	add r0, r5, #0
	pop {r4, r5, r6, pc}
	thumb_func_end FashionCase_CountWallpapers

	thumb_func_start sub_0202BB08
sub_0202BB08: ; 0x0202BB08
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r6, r2, #0
	cmp r4, #0x64
	blo _0202BB18
	bl GF_AssertFail
_0202BB18:
	add r0, r4, #0
	bl sub_0202B8FC
	cmp r0, #0
	beq _0202BB44
	lsl r1, r4, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl sub_0202B7C8
	add r0, r0, r6
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	cmp r1, #9
	bls _0202BB38
	mov r1, #9
_0202BB38:
	lsl r2, r4, #0x18
	add r0, r5, #0
	lsr r2, r2, #0x18
	bl sub_0202B784
	pop {r4, r5, r6, pc}
_0202BB44:
	add r0, r5, #0
	lsl r1, r4, #0x18
	add r0, #0x20
	lsr r1, r1, #0x18
	bl sub_0202B848
	add r0, r0, r6
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	cmp r6, #1
	bls _0202BB5C
	mov r6, #1
_0202BB5C:
	cmp r4, #0x3d
	bhs _0202BB64
	bl GF_AssertFail
_0202BB64:
	sub r4, #0x3d
	lsl r0, r4, #0x18
	lsr r2, r0, #0x18
	add r5, #0x20
	lsl r2, r2, #0x18
	add r0, r5, #0
	add r1, r6, #0
	lsr r2, r2, #0x18
	bl sub_0202B808
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0202BB08

	thumb_func_start sub_0202BB7C
sub_0202BB7C: ; 0x0202BB7C
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r6, r2, #0
	cmp r4, #0x64
	blo _0202BB8C
	bl GF_AssertFail
_0202BB8C:
	add r0, r4, #0
	bl sub_0202B8FC
	cmp r0, #0
	beq _0202BBBA
	lsl r1, r4, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl sub_0202B7C8
	cmp r0, r6
	bls _0202BBAC
	sub r0, r0, r6
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	b _0202BBAE
_0202BBAC:
	mov r1, #0
_0202BBAE:
	lsl r2, r4, #0x18
	add r0, r5, #0
	lsr r2, r2, #0x18
	bl sub_0202B784
	pop {r4, r5, r6, pc}
_0202BBBA:
	cmp r4, #0x3d
	bhs _0202BBC2
	bl GF_AssertFail
_0202BBC2:
	sub r4, #0x3d
	lsl r0, r4, #0x18
	lsr r2, r0, #0x18
	add r5, #0x20
	lsl r2, r2, #0x18
	add r0, r5, #0
	mov r1, #0
	lsr r2, r2, #0x18
	bl sub_0202B808
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0202BB7C

	thumb_func_start sub_0202BBD8
sub_0202BBD8: ; 0x0202BBD8
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #0x12
	blo _0202BBE6
	bl GF_AssertFail
_0202BBE6:
	add r0, r5, #0
	lsl r1, r4, #0x18
	add r0, #0x28
	lsr r1, r1, #0x18
	bl sub_0202B8B4
	cmp r0, #0x12
	bne _0202BC0C
	add r0, r5, #0
	add r0, #0x28
	bl sub_0202B8D8
	lsl r2, r4, #0x18
	add r5, #0x28
	add r1, r0, #0
	add r0, r5, #0
	lsr r2, r2, #0x18
	bl sub_0202B870
_0202BC0C:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0202BBD8

	thumb_func_start sub_0202BC10
sub_0202BC10: ; 0x0202BC10
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl sub_0202B614
	cmp r0, #0
	bne _0202BC22
	bl GF_AssertFail
_0202BC22:
	ldr r1, [r4]
	ldr r0, _0202BC34 ; =0x00002345
	cmp r1, r0
	bne _0202BC2E
	mov r0, #1
	pop {r4, pc}
_0202BC2E:
	mov r0, #0
	pop {r4, pc}
	nop
_0202BC34: .word 0x00002345
	thumb_func_end sub_0202BC10

	thumb_func_start sub_0202BC38
sub_0202BC38: ; 0x0202BC38
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl sub_0202B614
	cmp r0, #0
	bne _0202BC4A
	bl GF_AssertFail
_0202BC4A:
	ldr r0, _0202BC58 ; =0x00002345
	str r0, [r4]
	ldr r0, _0202BC5C ; =gGameLanguage
	add r4, #0x71
	ldrb r0, [r0]
	strb r0, [r4]
	pop {r4, pc}
	.balign 4, 0
_0202BC58: .word 0x00002345
_0202BC5C: .word gGameLanguage
	thumb_func_end sub_0202BC38

	thumb_func_start sub_0202BC60
sub_0202BC60: ; 0x0202BC60
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl sub_0202B614
	cmp r0, #0
	bne _0202BC72
	bl GF_AssertFail
_0202BC72:
	add r0, r4, #0
	mov r1, #0
	mov r2, #0x74
	bl memset
	ldr r0, _0202BC84 ; =0x00001234
	str r0, [r4]
	pop {r4, pc}
	nop
_0202BC84: .word 0x00001234
	thumb_func_end sub_0202BC60

	thumb_func_start sub_0202BC88
sub_0202BC88: ; 0x0202BC88
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r1, #0
	add r6, r2, #0
	bl sub_0202B614
	cmp r0, #0
	bne _0202BC9E
	bl GF_AssertFail
_0202BC9E:
	add r0, r5, #4
	add r1, r4, #0
	add r2, r6, #0
	bl sub_0202B6E8
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0202BC88

	thumb_func_start sub_0202BCAC
sub_0202BCAC: ; 0x0202BCAC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #4]
	add r6, r2, #0
	bl sub_02015FCC
	add r1, sp, #0xc
	strh r0, [r1]
	lsr r0, r0, #0x10
	strh r0, [r1, #2]
	ldrh r0, [r1]
	strh r0, [r1, #4]
	ldrh r0, [r1, #2]
	strh r0, [r1, #6]
	ldr r0, [r4, #4]
	bl sub_02015FF8
	add r7, r0, #0
	cmp r6, #0xa
	blt _0202BCDC
	bl GF_AssertFail
_0202BCDC:
	add r1, sp, #0xc
	mov r0, #4
	ldrsh r1, [r1, r0]
	add r0, #0xfc
	cmp r1, r0
	blt _0202BCEC
	bl GF_AssertFail
_0202BCEC:
	add r0, sp, #0xc
	mov r1, #6
	ldrsh r0, [r0, r1]
	add r1, #0xfa
	str r0, [sp, #8]
	ldr r0, [sp, #8]
	cmp r0, r1
	blt _0202BD00
	bl GF_AssertFail
_0202BD00:
	mov r0, #0x7f
	mvn r0, r0
	cmp r7, r0
	bgt _0202BD0C
	bl GF_AssertFail
_0202BD0C:
	mov r0, #1
	lsl r0, r6
	ldr r1, [r5, #0x3c]
	str r0, [sp, #4]
	tst r0, r1
	beq _0202BD1C
	bl GF_AssertFail
_0202BD1C:
	ldr r0, [r5]
	bl sub_0202B614
	cmp r0, #0
	bne _0202BD2A
	bl GF_AssertFail
_0202BD2A:
	lsl r0, r7, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	add r1, r5, #0
	add r3, sp, #0xc
	mov r2, #4
	ldrsh r2, [r3, r2]
	ldr r3, [sp, #8]
	add r1, #0x48
	lsl r0, r6, #2
	add r0, r1, r0
	ldr r1, [r4]
	lsl r2, r2, #0x18
	lsl r1, r1, #0x18
	lsl r3, r3, #0x18
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl sub_0202B770
	ldr r1, [r5, #0x3c]
	ldr r0, [sp, #4]
	orr r0, r1
	str r0, [r5, #0x3c]
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0202BCAC

	thumb_func_start sub_0202BD60
sub_0202BD60: ; 0x0202BD60
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r1, #0
	bl sub_0202B614
	cmp r0, #0
	bne _0202BD74
	bl GF_AssertFail
_0202BD74:
	add r5, #0x70
	strb r4, [r5]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0202BD60

	thumb_func_start sub_0202BD7C
sub_0202BD7C: ; 0x0202BD7C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r1, #0
	bl sub_0202B614
	cmp r0, #0
	bne _0202BD90
	bl GF_AssertFail
_0202BD90:
	add r0, r5, #0
	add r0, #0x40
	bl MailMsg_Init
	add r5, #0x40
	add r0, r5, #0
	mov r1, #0
	add r2, r4, #0
	bl MailMsg_SetFieldI
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0202BD7C

	thumb_func_start sub_0202BDA8
sub_0202BDA8: ; 0x0202BDA8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r1, #0
	bl sub_0202B614
	cmp r0, #0
	bne _0202BDBC
	bl GF_AssertFail
_0202BDBC:
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0x74
	bl memcpy
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0202BDA8

	thumb_func_start sub_0202BDC8
sub_0202BDC8: ; 0x0202BDC8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r1, #0
	add r6, r2, #0
	bl sub_0202B614
	cmp r0, #0
	bne _0202BDDE
	bl GF_AssertFail
_0202BDDE:
	add r0, r5, #4
	add r1, r4, #0
	add r2, r6, #0
	bl sub_0202B718
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0202BDC8

	thumb_func_start sub_0202BDEC
sub_0202BDEC: ; 0x0202BDEC
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #0xa
	blt _0202BDFA
	bl GF_AssertFail
_0202BDFA:
	ldr r0, [r5]
	bl sub_0202B614
	cmp r0, #0
	bne _0202BE08
	bl GF_AssertFail
_0202BE08:
	mov r0, #1
	ldr r1, [r5, #0x3c]
	lsl r0, r4
	and r0, r1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0202BDEC

	thumb_func_start sub_0202BE14
sub_0202BE14: ; 0x0202BE14
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl sub_0202B614
	cmp r0, #0
	bne _0202BE26
	bl GF_AssertFail
_0202BE26:
	add r0, r4, #4
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0202BE14

	thumb_func_start sub_0202BE2C
sub_0202BE2C: ; 0x0202BE2C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #0xa
	blt _0202BE3A
	bl GF_AssertFail
_0202BE3A:
	mov r0, #1
	ldr r1, [r5, #0x3c]
	lsl r0, r4
	tst r0, r1
	bne _0202BE48
	bl GF_AssertFail
_0202BE48:
	ldr r0, [r5]
	bl sub_0202B614
	cmp r0, #0
	bne _0202BE56
	bl GF_AssertFail
_0202BE56:
	add r5, #0x48
	lsl r0, r4, #2
	add r0, r5, r0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0202BE2C

	thumb_func_start sub_0202BE60
sub_0202BE60: ; 0x0202BE60
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r1, #0
	bl sub_0202B614
	cmp r0, #0
	bne _0202BE74
	bl GF_AssertFail
_0202BE74:
	add r0, r5, #4
	add r1, r4, #0
	bl sub_0202BECC
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0202BE60

	thumb_func_start sub_0202BE80
sub_0202BE80: ; 0x0202BE80
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl sub_0202B614
	cmp r0, #0
	bne _0202BE92
	bl GF_AssertFail
_0202BE92:
	add r4, #0x70
	ldrb r0, [r4]
	pop {r4, pc}
	thumb_func_end sub_0202BE80

	thumb_func_start sub_0202BE98
sub_0202BE98: ; 0x0202BE98
	ldr r3, _0202BEA0 ; =MailMsg_GetFieldI
	add r0, #0x40
	mov r1, #0
	bx r3
	.balign 4, 0
_0202BEA0: .word MailMsg_GetFieldI
	thumb_func_end sub_0202BE98

	thumb_func_start sub_0202BEA4
sub_0202BEA4: ; 0x0202BEA4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl sub_0202B614
	cmp r0, #0
	bne _0202BEB6
	bl GF_AssertFail
_0202BEB6:
	ldr r1, [r4]
	ldr r0, _0202BEC8 ; =0x00002345
	cmp r1, r0
	bne _0202BEC2
	mov r0, #1
	pop {r4, pc}
_0202BEC2:
	mov r0, #0
	pop {r4, pc}
	nop
_0202BEC8: .word 0x00002345
	thumb_func_end sub_0202BEA4

	thumb_func_start sub_0202BECC
sub_0202BECC: ; 0x0202BECC
	add r2, r0, #0
	ldr r3, _0202BED8 ; =CopyU16ArrayToString
	add r2, #0x20
	add r0, r1, #0
	add r1, r2, #0
	bx r3
	.balign 4, 0
_0202BED8: .word CopyU16ArrayToString
	thumb_func_end sub_0202BECC

	thumb_func_start sub_0202BEDC
sub_0202BEDC: ; 0x0202BEDC
	mov r1, #0x30
	ldrsb r0, [r0, r1]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202BEDC

	thumb_func_start sub_0202BEE4
sub_0202BEE4: ; 0x0202BEE4
	add r0, #0x31
	ldrb r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202BEE4

	thumb_func_start sub_0202BEEC
sub_0202BEEC: ; 0x0202BEEC
	add r0, #0x32
	ldrb r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202BEEC

	thumb_func_start sub_0202BEF4
sub_0202BEF4: ; 0x0202BEF4
	ldr r3, _0202BEF8 ; =sub_0202B730
	bx r3
	.balign 4, 0
_0202BEF8: .word sub_0202B730
	thumb_func_end sub_0202BEF4

	thumb_func_start sub_0202BEFC
sub_0202BEFC: ; 0x0202BEFC
	ldrb r0, [r0]
	bx lr
	thumb_func_end sub_0202BEFC

	thumb_func_start sub_0202BF00
sub_0202BF00: ; 0x0202BF00
	ldrb r0, [r0, #1]
	bx lr
	thumb_func_end sub_0202BF00

	thumb_func_start sub_0202BF04
sub_0202BF04: ; 0x0202BF04
	ldrb r0, [r0, #2]
	bx lr
	thumb_func_end sub_0202BF04

	thumb_func_start sub_0202BF08
sub_0202BF08: ; 0x0202BF08
	mov r1, #3
	ldrsb r0, [r0, r1]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202BF08

	thumb_func_start sub_0202BF10
sub_0202BF10: ; 0x0202BF10
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1fc
	sub sp, #0x1fc
	sub sp, #0xc
	add r7, r0, #0
	mov r0, #1
	add r4, r1, #0
	str r0, [sp]
	add r0, r4, #0
	bl sub_0202BC10
	cmp r0, #1
	bne _0202BF6E
	ldr r1, _0202BF7C ; =0xEDB88320
	add r0, sp, #4
	bl MATHi_CRC32InitTableRev
	add r0, sp, #4
	add r1, r4, #0
	mov r2, #0x74
	bl MATH_CalcCRC32
	add r6, r0, #0
	mov r5, #0
_0202BF40:
	add r0, r7, #0
	add r1, r5, #0
	bl sub_0202B9B8
	add r4, r0, #0
	ldr r1, _0202BF7C ; =0xEDB88320
	add r0, sp, #4
	bl MATHi_CRC32InitTableRev
	add r0, sp, #4
	add r1, r4, #0
	mov r2, #0x74
	bl MATH_CalcCRC32
	cmp r0, r6
	bne _0202BF66
	mov r0, #0
	str r0, [sp]
	b _0202BF72
_0202BF66:
	add r5, r5, #1
	cmp r5, #0xb
	blt _0202BF40
	b _0202BF72
_0202BF6E:
	mov r0, #0
	str r0, [sp]
_0202BF72:
	ldr r0, [sp]
	add sp, #0x1fc
	add sp, #0x1fc
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0202BF7C: .word 0xEDB88320
	thumb_func_end sub_0202BF10

	thumb_func_start sub_0202BF80
sub_0202BF80: ; 0x0202BF80
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp]
	mov r7, #0
	ldr r0, [sp]
	str r1, [sp, #4]
	add r5, r2, #0
	add r6, r7, #0
	str r3, [sp, #8]
	cmp r0, #0
	ble _0202BFBA
	add r4, r3, #0
_0202BF98:
	ldr r0, [sp, #4]
	cmp r6, r0
	beq _0202BFB0
	ldr r1, [r4]
	cmp r1, #0
	beq _0202BFB0
	add r0, r5, #0
	bl sub_0202BF10
	cmp r0, #1
	bne _0202BFB0
	add r7, r7, #1
_0202BFB0:
	ldr r0, [sp]
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, r0
	blt _0202BF98
_0202BFBA:
	mov r4, #0xa
_0202BFBC:
	add r1, r4, r7
	cmp r1, #0xb
	bge _0202BFDA
	add r0, r5, #0
	bl sub_0202B9B8
	add r6, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0202B9B8
	add r1, r0, #0
	add r0, r6, #0
	bl sub_0202BDA8
_0202BFDA:
	sub r4, r4, #1
	cmp r4, #1
	bge _0202BFBC
	ldr r0, [sp]
	mov r6, #1
	mov r4, #0
	cmp r0, #0
	ble _0202C022
_0202BFEA:
	ldr r0, [sp, #4]
	cmp r4, r0
	beq _0202C014
	ldr r0, [sp, #8]
	ldr r7, [r0]
	cmp r7, #0
	beq _0202C014
	add r0, r5, #0
	add r1, r7, #0
	bl sub_0202BF10
	cmp r0, #1
	bne _0202C014
	add r0, r5, #0
	add r1, r6, #0
	bl sub_0202B9B8
	add r1, r7, #0
	add r6, r6, #1
	bl sub_0202BDA8
_0202C014:
	ldr r0, [sp, #8]
	add r4, r4, #1
	add r0, r0, #4
	str r0, [sp, #8]
	ldr r0, [sp]
	cmp r4, r0
	blt _0202BFEA
_0202C022:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0202BF80

	thumb_func_start Save_FashionData_Get
Save_FashionData_Get: ; 0x0202C028
	ldr r3, _0202C030 ; =SaveArray_Get
	mov r1, #0xc
	bx r3
	nop
_0202C030: .word SaveArray_Get
	thumb_func_end Save_FashionData_Get
