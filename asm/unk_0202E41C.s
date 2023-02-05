	.include "asm/macros.inc"
	.include "unk_0202E41C.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_0202E41C
sub_0202E41C: ; 0x0202E41C
	ldr r0, _0202E420 ; =0x00000BC8
	bx lr
	.balign 4, 0
_0202E420: .word 0x00000BC8
	thumb_func_end sub_0202E41C

	thumb_func_start sub_0202E424
sub_0202E424: ; 0x0202E424
	push {r3, lr}
	ldr r2, _0202E438 ; =0x00000BC8
	add r1, r0, #0
	mov r0, #0
	bl MIi_CpuClearFast
	mov r0, #0x17
	bl SaveSubstruct_UpdateCRC
	pop {r3, pc}
	.balign 4, 0
_0202E438: .word 0x00000BC8
	thumb_func_end sub_0202E424

	thumb_func_start sub_0202E43C
sub_0202E43C: ; 0x0202E43C
	push {r4, lr}
	add r4, r0, #0
	add r1, r4, #0
	mov r0, #0
	add r1, #0xc
	mov r2, #0xc0
	bl MIi_CpuClearFast
	add r1, r4, #0
	mov r0, #0
	add r1, #0xcc
	mov r2, #0xc0
	bl MIi_CpuClearFast
	mov r1, #0x63
	lsl r1, r1, #2
	mov r0, #0
	add r1, r4, r1
	mov r2, #0xc0
	bl MIi_CpuClearFast
	add r0, r4, #0
	bl sub_0202E474
	mov r0, #0x17
	bl SaveSubstruct_UpdateCRC
	pop {r4, pc}
	thumb_func_end sub_0202E43C

	thumb_func_start sub_0202E474
sub_0202E474: ; 0x0202E474
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0
	bl sub_0202E48C
	add r0, r4, #0
	bl sub_0202E498
	mov r0, #0x17
	bl SaveSubstruct_UpdateCRC
	pop {r4, pc}
	thumb_func_end sub_0202E474

	thumb_func_start sub_0202E48C
sub_0202E48C: ; 0x0202E48C
	ldr r3, _0202E494 ; =SaveSubstruct_UpdateCRC
	strb r1, [r0, #8]
	mov r0, #0x17
	bx r3
	.balign 4, 0
_0202E494: .word SaveSubstruct_UpdateCRC
	thumb_func_end sub_0202E48C

	thumb_func_start sub_0202E498
sub_0202E498: ; 0x0202E498
	mov r2, #0
	add r1, r2, #0
_0202E49C:
	strb r1, [r0, r2]
	add r2, r2, #1
	cmp r2, #4
	blt _0202E49C
	ldr r3, _0202E4AC ; =SaveSubstruct_UpdateCRC
	mov r0, #0x17
	bx r3
	nop
_0202E4AC: .word SaveSubstruct_UpdateCRC
	thumb_func_end sub_0202E498
