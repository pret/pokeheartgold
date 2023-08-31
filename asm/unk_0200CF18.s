	.include "asm/macros.inc"
	.include "unk_0200CF18.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_0200DD88
sub_0200DD88: ; 0x0200DD88
	push {r3, r4, lr}
	sub sp, #0xc
	lsl r1, r1, #0xc
	str r1, [sp]
	lsl r1, r2, #0xc
	add r4, r0, #0
	str r1, [sp, #4]
	bl sub_02024B60
	cmp r0, #2
	bne _0200DDA8
	mov r0, #3
	ldr r1, [sp, #4]
	lsl r0, r0, #0x12
	add r0, r1, r0
	str r0, [sp, #4]
_0200DDA8:
	mov r0, #0
	str r0, [sp, #8]
	add r0, r4, #0
	add r1, sp, #0
	bl sub_020247D4
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end sub_0200DD88

	thumb_func_start sub_0200DDB8
sub_0200DDB8: ; 0x0200DDB8
	ldr r3, _0200DDC0 ; =sub_0200DD88
	ldr r0, [r0]
	bx r3
	nop
_0200DDC0: .word sub_0200DD88
	thumb_func_end sub_0200DDB8

	thumb_func_start sub_0200DDC4
sub_0200DDC4: ; 0x0200DDC4
	push {r4, r5, lr}
	sub sp, #0xc
	lsl r1, r1, #0xc
	str r1, [sp]
	lsl r1, r2, #0xc
	add r5, r0, #0
	add r4, r3, #0
	str r1, [sp, #4]
	bl sub_02024B60
	cmp r0, #2
	bne _0200DDE2
	ldr r0, [sp, #4]
	add r0, r0, r4
	str r0, [sp, #4]
_0200DDE2:
	mov r0, #0
	str r0, [sp, #8]
	add r0, r5, #0
	add r1, sp, #0
	bl sub_020247D4
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0200DDC4

	thumb_func_start sub_0200DDF4
sub_0200DDF4: ; 0x0200DDF4
	push {r3, lr}
	ldr r0, [r0]
	bl sub_0200DDC4
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0200DDF4

	thumb_func_start sub_0200DE00
sub_0200DE00: ; 0x0200DE00
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r6, r1, #0
	add r5, r2, #0
	bl sub_020248AC
	add r4, r0, #0
	ldr r1, [r4]
	asr r0, r1, #0xb
	lsr r0, r0, #0x14
	add r0, r1, r0
	asr r0, r0, #0xc
	strh r0, [r6]
	add r0, r7, #0
	bl sub_02024B60
	cmp r0, #2
	ldr r1, [r4, #4]
	bne _0200DE38
	mov r0, #3
	lsl r0, r0, #0x12
	sub r1, r1, r0
	asr r0, r1, #0xb
	lsr r0, r0, #0x14
	add r0, r1, r0
	asr r0, r0, #0xc
	strh r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_0200DE38:
	asr r0, r1, #0xb
	lsr r0, r0, #0x14
	add r0, r1, r0
	asr r0, r0, #0xc
	strh r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0200DE00

	thumb_func_start sub_0200DE44
sub_0200DE44: ; 0x0200DE44
	ldr r3, _0200DE4C ; =sub_0200DE00
	ldr r0, [r0]
	bx r3
	nop
_0200DE4C: .word sub_0200DE00
	thumb_func_end sub_0200DE44

	thumb_func_start sub_0200DE50
sub_0200DE50: ; 0x0200DE50
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	add r6, r1, #0
	add r5, r2, #0
	add r7, r3, #0
	bl sub_020248AC
	add r4, r0, #0
	ldr r1, [r4]
	asr r0, r1, #0xb
	lsr r0, r0, #0x14
	add r0, r1, r0
	asr r0, r0, #0xc
	strh r0, [r6]
	ldr r0, [sp]
	bl sub_02024B60
	cmp r0, #2
	bne _0200DE86
	ldr r0, [r4, #4]
	sub r1, r0, r7
	asr r0, r1, #0xb
	lsr r0, r0, #0x14
	add r0, r1, r0
	asr r0, r0, #0xc
	strh r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_0200DE86:
	ldr r1, [r4, #4]
	asr r0, r1, #0xb
	lsr r0, r0, #0x14
	add r0, r1, r0
	asr r0, r0, #0xc
	strh r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0200DE50

	thumb_func_start sub_0200DE94
sub_0200DE94: ; 0x0200DE94
	push {r3, lr}
	ldr r0, [r0]
	bl sub_0200DE50
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0200DE94

	thumb_func_start sub_0200DEA0
sub_0200DEA0: ; 0x0200DEA0
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r6, r0, #0
	add r5, r1, #0
	add r4, r2, #0
	bl sub_020248AC
	ldr r2, [r0]
	lsl r1, r5, #0xc
	add r1, r2, r1
	str r1, [sp]
	ldr r2, [r0, #4]
	lsl r1, r4, #0xc
	add r1, r2, r1
	str r1, [sp, #4]
	ldr r0, [r0, #8]
	add r1, sp, #0
	str r0, [sp, #8]
	add r0, r6, #0
	bl sub_020247D4
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0200DEA0

	thumb_func_start sub_0200DED0
sub_0200DED0: ; 0x0200DED0
	ldr r3, _0200DED8 ; =sub_0200DEA0
	ldr r0, [r0]
	bx r3
	nop
_0200DED8: .word sub_0200DEA0
	thumb_func_end sub_0200DED0

	thumb_func_start sub_0200DEDC
sub_0200DEDC: ; 0x0200DEDC
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r1, #0
	add r6, r2, #0
	bl sub_020248AC
	ldr r1, [r0]
	add r1, r1, r4
	str r1, [sp]
	ldr r1, [r0, #4]
	add r1, r1, r6
	str r1, [sp, #4]
	ldr r0, [r0, #8]
	add r1, sp, #0
	str r0, [sp, #8]
	ldr r0, [r5]
	bl sub_020247D4
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end sub_0200DEDC

	thumb_func_start sub_0200DF08
sub_0200DF08: ; 0x0200DF08
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r1, #0
	add r6, r2, #0
	bl sub_020248AC
	str r4, [sp]
	str r6, [sp, #4]
	ldr r0, [r0, #8]
	add r1, sp, #0
	str r0, [sp, #8]
	ldr r0, [r5]
	bl sub_020247D4
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end sub_0200DF08

	thumb_func_start sub_0200DF2C
sub_0200DF2C: ; 0x0200DF2C
	push {r3, r4, r5, lr}
	ldr r0, [r0]
	add r5, r1, #0
	add r4, r2, #0
	bl sub_020248AC
	ldr r1, [r0]
	str r1, [r5]
	ldr r0, [r0, #4]
	str r0, [r4]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0200DF2C

	thumb_func_start sub_0200DF44
sub_0200DF44: ; 0x0200DF44
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r6, r1, #0
	add r4, r2, #0
	add r7, r3, #0
	bl sub_02024B60
	cmp r0, #2
	bne _0200DF64
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, r7
	bl sub_0200DF08
	pop {r3, r4, r5, r6, r7, pc}
_0200DF64:
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	bl sub_0200DF08
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0200DF44

	thumb_func_start sub_0200DF70
sub_0200DF70: ; 0x0200DF70
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r2, #0
	add r6, r3, #0
	bl sub_0200DF2C
	ldr r0, [r5]
	bl sub_02024B60
	cmp r0, #2
	bne _0200DF8C
	ldr r0, [r4]
	sub r0, r0, r6
	str r0, [r4]
_0200DF8C:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0200DF70

	thumb_func_start sub_0200DF90
sub_0200DF90: ; 0x0200DF90
	ldr r3, _0200DF94 ; =sub_0202487C
	bx r3
	.balign 4, 0
_0200DF94: .word sub_0202487C
	thumb_func_end sub_0200DF90

	thumb_func_start sub_0200DF98
sub_0200DF98: ; 0x0200DF98
	ldr r3, _0200DFA0 ; =sub_0200DF90
	ldr r0, [r0]
	bx r3
	nop
_0200DFA0: .word sub_0200DF90
	thumb_func_end sub_0200DF98

	thumb_func_start sub_0200DFA4
sub_0200DFA4: ; 0x0200DFA4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r7, r0, #0
	add r6, r2, #0
	bl sub_020248B0
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #0
	bl _fgr
	ldr r0, _0200E020 ; =0x45800000
	bls _0200DFD0
	add r1, r5, #0
	bl _fmul
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _0200DFDE
_0200DFD0:
	add r1, r5, #0
	bl _fmul
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_0200DFDE:
	bl _ffix
	str r0, [r4]
	add r0, r6, #0
	mov r1, #0
	bl _fgr
	ldr r0, _0200E020 ; =0x45800000
	bls _0200E002
	add r1, r6, #0
	bl _fmul
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _0200E010
_0200E002:
	add r1, r6, #0
	bl _fmul
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_0200E010:
	bl _ffix
	str r0, [r4, #4]
	add r0, r7, #0
	add r1, r4, #0
	bl sub_020247F4
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0200E020: .word 0x45800000
	thumb_func_end sub_0200DFA4

	thumb_func_start sub_0200E024
sub_0200E024: ; 0x0200E024
	ldr r3, _0200E02C ; =sub_0200DFA4
	ldr r0, [r0]
	bx r3
	nop
_0200E02C: .word sub_0200DFA4
	thumb_func_end sub_0200E024

	thumb_func_start sub_0200E030
sub_0200E030: ; 0x0200E030
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r4, r2, #0
	bl sub_020248B0
	add r6, r0, #0
	ldr r0, [r6]
	bl _fflt
	ldr r1, _0200E05C ; =0x45800000
	bl _fdiv
	str r0, [r5]
	ldr r0, [r6, #4]
	bl _fflt
	ldr r1, _0200E05C ; =0x45800000
	bl _fdiv
	str r0, [r4]
	pop {r4, r5, r6, pc}
	nop
_0200E05C: .word 0x45800000
	thumb_func_end sub_0200E030

	thumb_func_start sub_0200E060
sub_0200E060: ; 0x0200E060
	ldr r3, _0200E068 ; =sub_0200E030
	ldr r0, [r0]
	bx r3
	nop
_0200E068: .word sub_0200E030
	thumb_func_end sub_0200E060

	thumb_func_start sub_0200E06C
sub_0200E06C: ; 0x0200E06C
	ldr r3, _0200E070 ; =sub_02024818
	bx r3
	.balign 4, 0
_0200E070: .word sub_02024818
	thumb_func_end sub_0200E06C

	thumb_func_start sub_0200E074
sub_0200E074: ; 0x0200E074
	ldr r3, _0200E07C ; =sub_0200E06C
	ldr r0, [r0]
	bx r3
	nop
_0200E07C: .word sub_0200E06C
	thumb_func_end sub_0200E074

	thumb_func_start sub_0200E080
sub_0200E080: ; 0x0200E080
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r0, #0
	bl sub_020248B4
	add r0, r0, r5
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	add r0, r4, #0
	bl sub_02024818
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0200E080

	thumb_func_start sub_0200E098
sub_0200E098: ; 0x0200E098
	ldr r3, _0200E0A0 ; =sub_0200E080
	ldr r0, [r0]
	bx r3
	nop
_0200E0A0: .word sub_0200E080
	thumb_func_end sub_0200E098

	thumb_func_start sub_0200E0A4
sub_0200E0A4: ; 0x0200E0A4
	ldr r3, _0200E0A8 ; =sub_020248B4
	bx r3
	.balign 4, 0
_0200E0A8: .word sub_020248B4
	thumb_func_end sub_0200E0A4

	thumb_func_start sub_0200E0AC
sub_0200E0AC: ; 0x0200E0AC
	ldr r3, _0200E0B4 ; =sub_0200E0A4
	ldr r0, [r0]
	bx r3
	nop
_0200E0B4: .word sub_0200E0A4
	thumb_func_end sub_0200E0AC

	thumb_func_start sub_0200E0B8
sub_0200E0B8: ; 0x0200E0B8
	ldr r3, _0200E0BC ; =sub_02024890
	bx r3
	.balign 4, 0
_0200E0BC: .word sub_02024890
	thumb_func_end sub_0200E0B8

	thumb_func_start sub_0200E0C0
sub_0200E0C0: ; 0x0200E0C0
	ldr r3, _0200E0C8 ; =sub_0200E0B8
	ldr r0, [r0]
	bx r3
	nop
_0200E0C8: .word sub_0200E0B8
	thumb_func_end sub_0200E0C0

	thumb_func_start sub_0200E0CC
sub_0200E0CC: ; 0x0200E0CC
	push {lr}
	sub sp, #0xc
	lsl r1, r1, #0xc
	str r1, [sp]
	lsl r1, r2, #0xc
	str r1, [sp, #4]
	mov r1, #0
	str r1, [sp, #8]
	ldr r0, [r0]
	add r1, sp, #0
	bl sub_020247E4
	add sp, #0xc
	pop {pc}
	thumb_func_end sub_0200E0CC

	thumb_func_start sub_0200E0E8
sub_0200E0E8: ; 0x0200E0E8
	ldr r3, _0200E0F0 ; =sub_02024B38
	ldr r0, [r0]
	bx r3
	nop
_0200E0F0: .word sub_02024B38
	thumb_func_end sub_0200E0E8

	thumb_func_start sub_0200E0F4
sub_0200E0F4: ; 0x0200E0F4
	ldr r3, _0200E0F8 ; =sub_02024B78
	bx r3
	.balign 4, 0
_0200E0F8: .word sub_02024B78
	thumb_func_end sub_0200E0F4

	thumb_func_start sub_0200E0FC
sub_0200E0FC: ; 0x0200E0FC
	ldr r3, _0200E104 ; =sub_0200E0F4
	ldr r0, [r0]
	bx r3
	nop
_0200E104: .word sub_0200E0F4
	thumb_func_end sub_0200E0FC

	thumb_func_start sub_0200E108
sub_0200E108: ; 0x0200E108
	ldr r3, _0200E10C ; =sub_02024BAC
	bx r3
	.balign 4, 0
_0200E10C: .word sub_02024BAC
	thumb_func_end sub_0200E108

	thumb_func_start sub_0200E110
sub_0200E110: ; 0x0200E110
	ldr r3, _0200E118 ; =sub_0200E108
	ldr r0, [r0]
	bx r3
	nop
_0200E118: .word sub_0200E108
	thumb_func_end sub_0200E110

	thumb_func_start sub_0200E11C
sub_0200E11C: ; 0x0200E11C
	ldr r3, _0200E124 ; =sub_02024C9C
	ldr r0, [r0]
	bx r3
	nop
_0200E124: .word sub_02024C9C
	thumb_func_end sub_0200E11C

	thumb_func_start sub_0200E128
sub_0200E128: ; 0x0200E128
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0xc]
	ldr r1, [sp, #0x28]
	add r6, r2, #0
	add r7, r3, #0
	bl _2DGfxResObjExistsById
	cmp r0, #0
	bne _0200E146
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_0200E146:
	ldr r0, [sp, #0x28]
	ldr r3, [sp, #0x20]
	str r0, [sp]
	ldr r0, [sp, #0x24]
	add r1, r6, #0
	str r0, [sp, #4]
	ldr r0, [r5]
	add r2, r7, #0
	str r0, [sp, #8]
	ldr r0, [r4, #0xc]
	bl AddCharResObjFromNarc
	add r5, r0, #0
	beq _0200E174
	bl sub_0200AD64
	ldr r0, [r4, #0x24]
	add r1, r5, #0
	bl sub_0200DAE4
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_0200E174:
	bl GF_AssertFail
	cmp r5, #0
	beq _0200E182
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_0200E182:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end sub_0200E128

	thumb_func_start sub_0200E188
sub_0200E188: ; 0x0200E188
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0xc]
	ldr r1, [sp, #0x28]
	add r6, r2, #0
	add r7, r3, #0
	bl _2DGfxResObjExistsById
	cmp r0, #0
	bne _0200E1A6
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_0200E1A6:
	ldr r0, [sp, #0x28]
	ldr r3, [sp, #0x20]
	str r0, [sp]
	ldr r0, [sp, #0x24]
	add r1, r6, #0
	str r0, [sp, #4]
	ldr r0, [r5]
	add r2, r7, #0
	str r0, [sp, #8]
	ldr r0, [r4, #0xc]
	bl AddCharResObjFromNarc
	add r5, r0, #0
	beq _0200E1D4
	bl sub_0200AE18
	ldr r0, [r4, #0x24]
	add r1, r5, #0
	bl sub_0200DAE4
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_0200E1D4:
	bl GF_AssertFail
	cmp r5, #0
	beq _0200E1E2
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_0200E1E2:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end sub_0200E188

	thumb_func_start sub_0200E1E8
sub_0200E1E8: ; 0x0200E1E8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0xc]
	ldr r1, [sp, #0x28]
	add r6, r2, #0
	add r7, r3, #0
	bl _2DGfxResObjExistsById
	cmp r0, #0
	bne _0200E206
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_0200E206:
	ldr r0, [sp, #0x28]
	ldr r3, [sp, #0x20]
	str r0, [sp]
	ldr r0, [sp, #0x24]
	add r1, r6, #0
	str r0, [sp, #4]
	ldr r0, [r5]
	add r2, r7, #0
	str r0, [sp, #8]
	ldr r0, [r4, #0xc]
	bl AddCharResObjFromOpenNarc
	add r5, r0, #0
	beq _0200E234
	bl sub_0200AE18
	ldr r0, [r4, #0x24]
	add r1, r5, #0
	bl sub_0200DAE4
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_0200E234:
	bl GF_AssertFail
	cmp r5, #0
	beq _0200E242
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_0200E242:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end sub_0200E1E8

	thumb_func_start sub_0200E248
sub_0200E248: ; 0x0200E248
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0xc]
	ldr r1, [sp, #0x24]
	add r7, r2, #0
	str r3, [sp, #8]
	bl Get2DGfxResObjById
	add r6, r0, #0
	ldr r0, [sp, #0x20]
	ldr r3, [sp, #8]
	str r0, [sp]
	ldr r0, [r5]
	add r1, r6, #0
	str r0, [sp, #4]
	ldr r0, [r4, #0xc]
	add r2, r7, #0
	bl ReplaceCharResObjFromNarc
	add r0, r6, #0
	bl sub_0200AE8C
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end sub_0200E248

	thumb_func_start sub_0200E27C
sub_0200E27C: ; 0x0200E27C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0x10]
	ldr r1, [sp, #0x24]
	add r7, r2, #0
	str r3, [sp, #8]
	bl Get2DGfxResObjById
	add r6, r0, #0
	ldr r0, [sp, #0x20]
	ldr r3, [sp, #8]
	str r0, [sp]
	ldr r0, [r5]
	add r1, r6, #0
	str r0, [sp, #4]
	ldr r0, [r4, #0x10]
	add r2, r7, #0
	bl ReplacePlttResObjFromNarc
	add r0, r6, #0
	bl sub_0200B084
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end sub_0200E27C

	thumb_func_start sub_0200E2B0
sub_0200E2B0: ; 0x0200E2B0
	ldr r0, [r0]
	bx lr
	thumb_func_end sub_0200E2B0

	thumb_func_start sub_0200E2B4
sub_0200E2B4: ; 0x0200E2B4
	str r1, [r0]
	bx lr
	thumb_func_end sub_0200E2B4

	thumb_func_start sub_0200E2B8
sub_0200E2B8: ; 0x0200E2B8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0xc]
	ldr r1, [sp, #0x24]
	add r7, r2, #0
	str r3, [sp, #8]
	bl Get2DGfxResObjById
	add r6, r0, #0
	ldr r0, [sp, #0x20]
	ldr r3, [sp, #8]
	str r0, [sp]
	ldr r0, [r5]
	add r1, r6, #0
	str r0, [sp, #4]
	ldr r0, [r4, #0xc]
	add r2, r7, #0
	bl ReplaceCharResObjFromOpenNarc
	add r0, r6, #0
	bl sub_0200AE8C
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end sub_0200E2B8

	thumb_func_start sub_0200E2EC
sub_0200E2EC: ; 0x0200E2EC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0x10]
	ldr r1, [sp, #0x24]
	add r7, r2, #0
	str r3, [sp, #8]
	bl Get2DGfxResObjById
	add r6, r0, #0
	ldr r0, [sp, #0x20]
	ldr r3, [sp, #8]
	str r0, [sp]
	ldr r0, [r5]
	add r1, r6, #0
	str r0, [sp, #4]
	ldr r0, [r4, #0x10]
	add r2, r7, #0
	bl ReplacePlttResObjFromOpenNarc
	add r0, r6, #0
	bl sub_0200B084
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end sub_0200E2EC
