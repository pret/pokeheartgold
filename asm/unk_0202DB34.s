	.include "asm/macros.inc"
	.include "unk_0202DB34.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_0202DB34
sub_0202DB34: ; 0x0202DB34
	ldr r3, _0202DB3C ; =SaveArray_Get
	mov r1, #0x16
	bx r3
	nop
_0202DB3C: .word SaveArray_Get
	thumb_func_end sub_0202DB34

	thumb_func_start sub_0202DB40
sub_0202DB40: ; 0x0202DB40
	mov r0, #0xf8
	bx lr
	thumb_func_end sub_0202DB40

	thumb_func_start sub_0202DB44
sub_0202DB44: ; 0x0202DB44
	ldr r3, _0202DB50 ; =MIi_CpuClearFast
	add r1, r0, #0
	mov r0, #0
	mov r2, #0xf8
	bx r3
	nop
_0202DB50: .word MIi_CpuClearFast
	thumb_func_end sub_0202DB44

	thumb_func_start sub_0202DB54
sub_0202DB54: ; 0x0202DB54
	add r0, #0xec
	ldrh r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202DB54

	thumb_func_start sub_0202DB5C
sub_0202DB5C: ; 0x0202DB5C
	add r0, #0xec
	strh r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202DB5C

	thumb_func_start sub_0202DB64
sub_0202DB64: ; 0x0202DB64
	ldr r3, _0202DB6C ; =MIi_CpuCopyFast
	mov r2, #0xec
	bx r3
	nop
_0202DB6C: .word MIi_CpuCopyFast
	thumb_func_end sub_0202DB64

	thumb_func_start sub_0202DB70
sub_0202DB70: ; 0x0202DB70
	ldr r3, _0202DB7C ; =MIi_CpuCopyFast
	add r2, r0, #0
	add r0, r1, #0
	add r1, r2, #0
	mov r2, #0xec
	bx r3
	.balign 4, 0
_0202DB7C: .word MIi_CpuCopyFast
	thumb_func_end sub_0202DB70

	thumb_func_start sub_0202DB80
sub_0202DB80: ; 0x0202DB80
	add r0, #0xf0
	ldr r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202DB80

	thumb_func_start sub_0202DB88
sub_0202DB88: ; 0x0202DB88
	add r0, #0xf0
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202DB88

	thumb_func_start sub_0202DB90
sub_0202DB90: ; 0x0202DB90
	add r0, #0xf4
	ldr r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202DB90

	thumb_func_start sub_0202DB98
sub_0202DB98: ; 0x0202DB98
	add r0, #0xf4
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202DB98

	thumb_func_start sub_0202DBA0
sub_0202DBA0: ; 0x0202DBA0
	add r0, #0xee
	ldrh r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202DBA0
