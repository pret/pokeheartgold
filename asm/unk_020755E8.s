#include "constants/items.h"
#include "constants/moves.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.rodata

_020FFEC0:
	.byte 0x01, 0x04, 0x00, 0x00
_020FFEC4:
	.byte 0x80, 0x00
_020FFEC6:
	.byte 0x48, 0x00, 0x80, 0x00, 0x78, 0x00
_020FFECC:
	.byte 0x32, 0x5C, 0x03, 0xFB
	.byte 0x63, 0x8C, 0x03, 0xFB
	.byte 0xFF, 0x00, 0x00, 0x00
_020FFED8:
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
_020FFEE8:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x40, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
_020FFEFC:
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
_020FFF14:
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x20, 0x00, 0x00, 0x00
_020FFF34:
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00
_020FFF5C:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_020FFF90:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x02, 0x03
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x06, 0x04, 0x00, 0x03, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
_020FFFE4:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0E, 0x01, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x0D, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0C, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.text

	thumb_func_start sub_020755E8
sub_020755E8: ; 0x020755E8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	ldr r4, _0207562C ; =_020FFF5C
	add r6, r2, #0
	add r5, r3, #0
	add r7, r0, #0
	mov ip, r1
	add r3, sp, #0
	mov r2, #6
_020755FA:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _020755FA
	ldr r0, [r4]
	add r1, sp, #0
	str r0, [r3]
	strh r6, [r1]
	strh r5, [r1, #2]
	add r0, sp, #0x38
	ldrb r0, [r0, #0x10]
	add r2, sp, #0
	strh r0, [r1, #6]
	add r0, r7, #0
	mov r1, ip
	bl sub_0200D734
	mov r1, #1
	add r4, r0, #0
	bl sub_0200DC78
	add r0, r4, #0
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	nop
_0207562C: .word _020FFF5C
	thumb_func_end sub_020755E8

	thumb_func_start sub_02075630
sub_02075630: ; 0x02075630
	push {r4, r5, r6, r7, lr}
	sub sp, #0x5c
	add r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl sub_0200CF18
	add r1, r5, #0
	add r1, #0xac
	str r0, [r1]
	add r0, r5, #0
	add r0, #0xac
	ldr r0, [r0]
	bl sub_0200CF38
	add r1, r5, #0
	add r1, #0xb0
	add r2, sp, #0x3c
	ldr r4, _02075764 ; =_020FFF14
	str r0, [r1]
	ldmia r4!, {r0, r1}
	add r3, r2, #0
	stmia r2!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r4!, {r0, r1}
	ldr r6, _02075768 ; =_020FFEE8
	stmia r2!, {r0, r1}
	add r4, sp, #0x28
	ldmia r6!, {r0, r1}
	add r2, r4, #0
	stmia r4!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r4!, {r0, r1}
	ldr r0, [r6]
	add r1, r3, #0
	str r0, [r4]
	mov r0, #0x10
	str r0, [sp, #0x28]
	add r0, r5, #0
	add r0, #0xac
	ldr r0, [r0]
	mov r3, #0x20
	bl sub_0200CF70
	add r0, r5, #0
	add r1, r5, #0
	add r0, #0xac
	add r1, #0xb0
	ldr r0, [r0]
	ldr r1, [r1]
	mov r2, #0x10
	bl sub_0200CFF4
	ldr r4, _0207576C ; =_020FFEFC
	add r3, sp, #0x10
	add r2, r3, #0
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r5, #0
	add r1, r5, #0
	add r0, #0xac
	add r1, #0xb0
	ldr r0, [r0]
	ldr r1, [r1]
	bl sub_0200D3F8
	add r0, r5, #0
	add r0, #0xac
	ldr r6, [r0]
	add r0, r5, #0
	add r0, #0xb0
	ldr r4, [r0]
	ldr r1, [r5, #0x5c]
	mov r0, #0xef
	bl NARC_ctor
	add r7, r0, #0
	mov r1, #0
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	add r0, r6, #0
	add r1, r4, #0
	add r2, r7, #0
	mov r3, #0xb
	bl sub_0200D5D4
	mov r1, #0
	str r1, [sp]
	mov r0, #2
	str r0, [sp, #4]
	str r1, [sp, #8]
	add r0, r6, #0
	add r1, r4, #0
	add r2, r7, #0
	mov r3, #0xc
	bl sub_0200D504
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	add r0, r6, #0
	add r1, r4, #0
	add r2, r7, #0
	mov r3, #0xd
	bl sub_0200D6EC
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	add r0, r6, #0
	add r1, r4, #0
	add r2, r7, #0
	mov r3, #0xe
	bl sub_0200D71C
	add r0, r7, #0
	bl NARC_dtor
	mov r0, #1
	str r0, [sp]
	add r0, r5, #0
	add r1, r5, #0
	add r0, #0xac
	add r1, #0xb0
	ldr r0, [r0]
	ldr r1, [r1]
	mov r2, #0x80
	mov r3, #0x48
	bl sub_020755E8
	add r1, r5, #0
	add r1, #0xb4
	str r0, [r1]
	add r0, r5, #0
	add r0, #0xb4
	ldr r0, [r0]
	mov r1, #0
	bl sub_0200DCE8
	mov r0, #1
	add r5, #0xb8
	str r0, [r5]
	add sp, #0x5c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02075764: .word _020FFF14
_02075768: .word _020FFEE8
_0207576C: .word _020FFEFC
	thumb_func_end sub_02075630

	thumb_func_start sub_02075770
sub_02075770: ; 0x02075770
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, #0xac
	ldr r4, [r0]
	add r0, r5, #0
	add r0, #0xb0
	ldr r6, [r0]
	add r0, r5, #0
	add r0, #0xb4
	ldr r0, [r0]
	cmp r0, #0
	bne _0207578C
	bl GF_AssertFail
_0207578C:
	add r0, r5, #0
	add r0, #0xb4
	ldr r0, [r0]
	bl sub_0200D9DC
	add r0, r4, #0
	add r1, r6, #0
	bl sub_0200D998
	add r0, r4, #0
	bl sub_0200D108
	mov r0, #0
	add r5, #0xb8
	str r0, [r5]
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02075770

	thumb_func_start sub_020757AC
sub_020757AC: ; 0x020757AC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0xb8
	ldr r0, [r0]
	cmp r0, #0
	bne _020757BC
	bl GF_AssertFail
_020757BC:
	add r0, r5, #0
	add r0, #0xb4
	ldr r0, [r0]
	cmp r0, #0
	bne _020757CA
	bl GF_AssertFail
_020757CA:
	add r0, r5, #0
	add r0, #0x8b
	ldrb r0, [r0]
	cmp r0, #1
	beq _020757DA
	cmp r0, #2
	beq _020757DE
	b _020757E2
_020757DA:
	mov r4, #0
	b _020757E6
_020757DE:
	mov r4, #1
	b _020757E6
_020757E2:
	bl GF_AssertFail
_020757E6:
	ldr r1, _020757FC ; =_020FFEC4
	lsl r3, r4, #2
	ldr r2, _02075800 ; =_020FFEC6
	add r5, #0xb4
	ldrsh r1, [r1, r3]
	ldrsh r2, [r2, r3]
	ldr r0, [r5]
	bl sub_0200DDB8
	pop {r3, r4, r5, pc}
	nop
_020757FC: .word _020FFEC4
_02075800: .word _020FFEC6
	thumb_func_end sub_020757AC

	thumb_func_start sub_02075804
sub_02075804: ; 0x02075804
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r4, r0, #0
	add r5, r1, #0
	add r2, r3, #0
	ldr r0, [r4, #0xc]
	ldr r1, [r4, #8]
	ldr r3, [r4, #0x5c]
	bl ReadMsgData_ExpandPlaceholders
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r3, #0
	str r3, [sp]
	ldr r0, _02075848 ; =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	add r0, r5, #0
	mov r1, #4
	add r2, r4, #0
	str r3, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r5, #0
	bl CopyWindowToVram
	add r0, r4, #0
	bl String_dtor
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02075848: .word 0x00010200
	thumb_func_end sub_02075804

	thumb_func_start sub_0207584C
sub_0207584C: ; 0x0207584C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, #0xb8
	ldr r6, _020758C8 ; =0x0000049D
	ldr r0, [r0]
	add r7, r1, #0
	add r4, r6, #1
	cmp r0, #0
	bne _02075862
	bl GF_AssertFail
_02075862:
	cmp r7, #0
	bne _02075878
	add r2, r5, #0
	add r2, #0x6c
	ldrh r2, [r2]
	ldr r0, [r5, #0xc]
	mov r1, #0
	bl BufferMoveName
	ldr r6, _020758CC ; =0x000004A2
	add r4, r6, #1
_02075878:
	add r1, r5, #0
	ldr r2, [r5, #8]
	add r0, r5, #0
	add r1, #0x8c
	add r3, r6, #0
	bl sub_02075804
	add r1, r5, #0
	ldr r2, [r5, #8]
	add r0, r5, #0
	add r1, #0x9c
	add r3, r4, #0
	bl sub_02075804
	add r0, r5, #0
	mov r1, #0
	add r0, #0x8a
	strb r1, [r0]
	add r0, r5, #0
	mov r1, #1
	add r0, #0x8b
	strb r1, [r0]
	add r0, r5, #0
	bl sub_020757AC
	mov r0, #5
	mov r1, #1
	bl ToggleBgLayer
	mov r0, #6
	mov r1, #1
	bl ToggleBgLayer
	add r5, #0xb4
	ldr r0, [r5]
	mov r1, #1
	bl sub_0200DCE8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_020758C8: .word 0x0000049D
_020758CC: .word 0x000004A2
	thumb_func_end sub_0207584C

	thumb_func_start sub_020758D0
sub_020758D0: ; 0x020758D0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _020759C0 ; =_020FFECC
	mov r4, #0
	bl sub_02025224
	add r6, r0, #0
	add r0, r5, #0
	add r0, #0xb8
	ldr r0, [r0]
	cmp r0, #0
	bne _020758EC
	bl GF_AssertFail
_020758EC:
	mov r0, #0
	mvn r0, r0
	cmp r6, r0
	beq _02075920
	ldr r0, _020759C4 ; =0x000005DC
	bl PlaySE
	cmp r6, #0
	beq _02075904
	cmp r6, #1
	beq _0207590E
	b _0207591A
_02075904:
	add r0, r5, #0
	mov r4, #1
	add r0, #0x8b
	strb r4, [r0]
	b _020759A0
_0207590E:
	add r0, r5, #0
	mov r1, #2
	add r0, #0x8b
	strb r1, [r0]
	mov r4, #1
	b _020759A0
_0207591A:
	bl GF_AssertFail
	b _020759A0
_02075920:
	ldr r0, _020759C8 ; =gSystem
	mov r1, #0x40
	ldr r0, [r0, #0x48]
	tst r1, r0
	beq _0207594A
	add r0, r5, #0
	add r0, #0x8b
	ldrb r0, [r0]
	cmp r0, #1
	beq _020759A0
	add r0, r5, #0
	mov r1, #1
	add r0, #0x8b
	strb r1, [r0]
	add r0, r5, #0
	bl sub_020757AC
	ldr r0, _020759C4 ; =0x000005DC
	bl PlaySE
	b _020759A0
_0207594A:
	mov r1, #0x80
	tst r1, r0
	beq _02075970
	add r0, r5, #0
	add r0, #0x8b
	ldrb r0, [r0]
	cmp r0, #2
	beq _020759A0
	add r0, r5, #0
	mov r1, #2
	add r0, #0x8b
	strb r1, [r0]
	add r0, r5, #0
	bl sub_020757AC
	ldr r0, _020759C4 ; =0x000005DC
	bl PlaySE
	b _020759A0
_02075970:
	mov r1, #1
	add r2, r0, #0
	tst r2, r1
	beq _02075992
	add r0, r5, #0
	add r0, #0x8b
	ldrb r0, [r0]
	cmp r0, #0
	bne _0207598E
	bl GF_AssertFail
	add r0, r5, #0
	mov r1, #2
	add r0, #0x8b
	strb r1, [r0]
_0207598E:
	mov r4, #1
	b _020759A0
_02075992:
	mov r2, #2
	tst r0, r2
	beq _020759A0
	add r0, r5, #0
	add r0, #0x8b
	strb r2, [r0]
	add r4, r1, #0
_020759A0:
	cmp r4, #0
	beq _020759BA
	add r0, r5, #0
	bl sub_020757AC
	add r5, #0xb4
	ldr r0, [r5]
	mov r1, #3
	bl sub_0200DC4C
	ldr r0, _020759C4 ; =0x000005DC
	bl PlaySE
_020759BA:
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	nop
_020759C0: .word _020FFECC
_020759C4: .word 0x000005DC
_020759C8: .word gSystem
	thumb_func_end sub_020758D0

	thumb_func_start sub_020759CC
sub_020759CC: ; 0x020759CC
	push {r4, lr}
	add r4, r0, #0
	add r0, #0xb8
	ldr r0, [r0]
	cmp r0, #0
	bne _020759DC
	bl GF_AssertFail
_020759DC:
	add r0, r4, #0
	add r0, #0xb4
	ldr r0, [r0]
	bl sub_0200DC64
	cmp r0, #3
	beq _020759EE
	bl GF_AssertFail
_020759EE:
	add r4, #0xb4
	ldr r0, [r4]
	bl sub_0200DCA0
	cmp r0, #0
	bne _020759FE
	mov r0, #1
	pop {r4, pc}
_020759FE:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020759CC

	thumb_func_start sub_02075A04
sub_02075A04: ; 0x02075A04
	push {r4, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x8a
	ldrb r1, [r1]
	cmp r1, #0
	beq _02075A18
	cmp r1, #1
	beq _02075A2E
	b _02075A74
_02075A18:
	bl sub_020758D0
	cmp r0, #0
	beq _02075A78
	add r0, r4, #0
	add r0, #0x8a
	ldrb r0, [r0]
	add r4, #0x8a
	add r0, r0, #1
	strb r0, [r4]
	b _02075A78
_02075A2E:
	bl sub_020759CC
	cmp r0, #0
	beq _02075A78
	add r0, r4, #0
	add r0, #0xb8
	ldr r0, [r0]
	cmp r0, #0
	bne _02075A44
	bl GF_AssertFail
_02075A44:
	add r0, r4, #0
	add r0, #0x8b
	ldrb r0, [r0]
	cmp r0, #0
	bne _02075A52
	bl GF_AssertFail
_02075A52:
	mov r0, #5
	mov r1, #0
	bl ToggleBgLayer
	mov r0, #6
	mov r1, #0
	bl ToggleBgLayer
	add r0, r4, #0
	add r0, #0xb4
	ldr r0, [r0]
	mov r1, #0
	bl sub_0200DCE8
	add r4, #0x8b
	ldrb r0, [r4]
	pop {r4, pc}
_02075A74:
	bl GF_AssertFail
_02075A78:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end sub_02075A04

	thumb_func_start sub_02075A7C
sub_02075A7C: ; 0x02075A7C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r6, r0, #0
	add r7, r1, #0
	ldr r5, [sp, #0x50]
	ldr r0, _02075CFC ; =gSystem + 0x60
	mov r1, #0
	str r2, [sp, #0x14]
	str r3, [sp, #0x18]
	strb r1, [r0, #9]
	bl GX_SwapDisplay
	mov r0, #4
	add r1, r5, #0
	bl FontID_Alloc
	add r0, r5, #0
	mov r1, #0xbc
	bl AllocFromHeap
	add r4, r0, #0
	mov r0, #0
	add r1, r4, #0
	mov r2, #0xbc
	bl MIi_CpuClearFast
	bl sub_02026E8C
	str r0, [sp, #0x1c]
	bl sub_02026E84
	add r1, r0, #0
	ldr r2, [sp, #0x1c]
	mov r0, #0
	bl MIi_CpuClear16
	bl sub_02026E9C
	str r0, [sp, #0x20]
	bl sub_02026E94
	add r1, r0, #0
	ldr r2, [sp, #0x20]
	mov r0, #0
	bl MIi_CpuClear16
	str r6, [r4, #0x24]
	add r0, r7, #0
	mov r1, #5
	mov r2, #0
	str r7, [r4, #0x28]
	bl GetMonData
	add r1, r4, #0
	add r1, #0x60
	strh r0, [r1]
	add r0, r7, #0
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	add r1, r4, #0
	add r1, #0x80
	strb r0, [r1]
	add r1, r4, #0
	ldr r0, [sp, #0x14]
	add r1, #0x62
	strh r0, [r1]
	str r5, [r4, #0x5c]
	mov r0, #0
	str r0, [r4, #0x38]
	mov r0, #0xb4
	add r1, r5, #0
	bl NARC_ctor
	add r1, r4, #0
	add r1, #0x84
	str r0, [r1]
	add r2, r4, #0
	add r0, r4, #0
	add r2, #0x60
	add r0, #0x84
	add r1, r4, #0
	ldrh r2, [r2]
	ldr r0, [r0]
	add r1, #0x88
	mov r3, #1
	bl sub_020729A4
	add r2, r4, #0
	add r0, r4, #0
	add r2, #0x62
	add r0, #0x84
	add r1, r4, #0
	ldrh r2, [r2]
	ldr r0, [r0]
	add r1, #0x89
	mov r3, #1
	bl sub_020729A4
	add r0, r5, #0
	bl sub_020030E8
	str r0, [r4, #0x14]
	mov r1, #1
	bl sub_02003B50
	mov r2, #2
	ldr r0, [r4, #0x14]
	mov r1, #0
	lsl r2, r2, #8
	add r3, r5, #0
	bl PaletteData_AllocBuffers
	mov r1, #1
	ldr r0, [r4, #0x14]
	lsl r2, r1, #9
	add r3, r5, #0
	bl PaletteData_AllocBuffers
	mov r2, #7
	ldr r0, [r4, #0x14]
	mov r1, #2
	lsl r2, r2, #6
	add r3, r5, #0
	bl PaletteData_AllocBuffers
	add r0, r5, #0
	bl BgConfig_Alloc
	str r0, [r4]
	add r0, r5, #0
	mov r1, #1
	bl AllocWindows
	str r0, [r4, #4]
	ldr r0, [sp, #0x18]
	str r0, [r4, #0x2c]
	add r0, r5, #0
	bl sub_02077400
	str r0, [r4, #0x34]
	bl sub_020773AC
	bl sub_020773D4
	bl sub_020774A0
	ldr r1, [r4]
	add r0, r4, #0
	bl sub_02076E64
	add r0, r4, #0
	bl sub_02075630
	mov r0, #0x13
	str r0, [sp]
	mov r0, #0x1b
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0xb
	str r0, [sp, #0xc]
	mov r0, #0x1f
	str r0, [sp, #0x10]
	ldr r0, [r4]
	ldr r1, [r4, #4]
	mov r2, #1
	mov r3, #2
	bl AddWindowParameterized
	ldr r0, [r4, #4]
	mov r1, #0xff
	bl FillWindowPixelBuffer
	ldr r0, [r4, #4]
	mov r1, #0
	mov r2, #1
	mov r3, #0xa
	bl DrawFrameAndWindow2
	mov r0, #8
	str r0, [sp]
	mov r0, #0x1a
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0xf
	str r0, [sp, #0xc]
	mov r0, #0x50
	str r0, [sp, #0x10]
	add r1, r4, #0
	ldr r0, [r4]
	add r1, #0x8c
	mov r2, #6
	mov r3, #3
	bl AddWindowParameterized
	mov r0, #0xe
	str r0, [sp]
	mov r0, #0x1a
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0xf
	str r0, [sp, #0xc]
	mov r0, #0x84
	str r0, [sp, #0x10]
	add r1, r4, #0
	ldr r0, [r4]
	add r1, #0x9c
	mov r2, #6
	mov r3, #3
	bl AddWindowParameterized
	add r0, r5, #0
	bl sub_02007FD4
	str r0, [r4, #0x18]
	add r0, r5, #0
	mov r1, #1
	mov r2, #0
	bl sub_02016EDC
	str r0, [r4, #0x44]
	add r0, r4, #0
	mov r1, #0
	add r0, #0x67
	strb r1, [r0]
	add r0, r4, #0
	mov r1, #2
	add r0, #0x66
	strb r1, [r0]
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0xc5
	add r3, r5, #0
	bl NewMsgDataFromNarc
	str r0, [r4, #8]
	add r0, r5, #0
	bl ScrStrBufs_new
	str r0, [r4, #0xc]
	mov r0, #5
	lsl r0, r0, #6
	add r1, r5, #0
	bl String_ctor
	str r0, [r4, #0x10]
	add r0, r5, #0
	mov r1, #0x3c
	bl AllocFromHeap
	str r0, [r4, #0x3c]
	ldr r1, [r4, #0x3c]
	mov r0, #0
	mov r2, #0x3c
	bl MIi_CpuClearFast
	ldr r1, [sp, #0x38]
	ldr r0, [r4, #0x3c]
	str r1, [r0, #0x2c]
	ldr r0, [sp, #0x3c]
	str r0, [r4, #0x48]
	ldr r0, [sp, #0x40]
	str r0, [r4, #0x4c]
	ldr r0, [sp, #0x44]
	str r0, [r4, #0x50]
	ldr r0, [sp, #0x48]
	str r0, [r4, #0x78]
	ldr r0, [sp, #0x4c]
	str r0, [r4, #0x7c]
	add r0, r4, #0
	bl sub_020771E8
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r4, #0x14]
	ldr r2, _02075D00 ; =0x0000FFFF
	mov r1, #0xf
	mov r3, #1
	bl sub_02003370
	mov r2, #0
	str r2, [sp]
	ldr r0, [r4, #0x18]
	mov r1, #0x10
	add r3, r2, #0
	bl sub_020090E4
	ldr r0, [r4, #0x14]
	mov r1, #0
	mov r2, #0xb
	add r3, r5, #0
	bl sub_020163E0
	mov r1, #1
	str r0, [r4, #0x58]
	bl sub_0201649C
	ldr r0, _02075D04 ; =sub_02075D08
	add r1, r4, #0
	mov r2, #0
	bl CreateSysTask
	mov r0, #1
	bl TextFlags_SetCanABSpeedUpPrint
	mov r0, #1
	bl sub_02002B8C
	bl sub_0203A880
	add r0, r4, #0
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02075CFC: .word gSystem + 0x60
_02075D00: .word 0x0000FFFF
_02075D04: .word sub_02075D08
	thumb_func_end sub_02075A7C

	thumb_func_start sub_02075D08
sub_02075D08: ; 0x02075D08
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	bl sub_02075E14
	ldr r0, [r4, #0x38]
	cmp r0, #0
	bne _02075D2C
	ldr r0, [r4, #0x18]
	bl sub_02008120
	bl sub_020774E0
	mov r0, #1
	mov r1, #0
	bl sub_02026E50
_02075D2C:
	add r4, #0x67
	ldrb r0, [r4]
	cmp r0, #0
	beq _02075D3A
	add r0, r5, #0
	bl DestroySysTask
_02075D3A:
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02075D08

	thumb_func_start sub_02075D3C
sub_02075D3C: ; 0x02075D3C
	add r0, #0x67
	ldrb r0, [r0]
	cmp r0, #1
	bne _02075D48
	mov r0, #1
	bx lr
_02075D48:
	mov r0, #0
	bx lr
	thumb_func_end sub_02075D3C

	thumb_func_start sub_02075D4C
sub_02075D4C: ; 0x02075D4C
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0
	add r1, r0, #0
	bl sub_0200FBF4
	mov r0, #1
	mov r1, #0
	bl sub_0200FBF4
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	mov r0, #4
	bl FontID_Release
	add r0, r4, #0
	bl sub_02075770
	ldr r0, [r4, #4]
	mov r1, #1
	bl WindowArray_dtor
	add r0, r4, #0
	add r0, #0x8c
	bl RemoveWindow
	add r0, r4, #0
	add r0, #0x9c
	bl RemoveWindow
	ldr r0, [r4, #0x14]
	mov r1, #0
	bl PaletteData_FreeBuffers
	ldr r0, [r4, #0x14]
	mov r1, #1
	bl PaletteData_FreeBuffers
	ldr r0, [r4, #0x14]
	mov r1, #2
	bl PaletteData_FreeBuffers
	ldr r0, [r4, #0x14]
	bl sub_02003104
	ldr r0, [r4, #0x18]
	bl sub_02008524
	ldr r0, [r4, #0x44]
	bl sub_02016F2C
	ldr r0, [r4, #0x34]
	bl GF_3DVramMan_Delete
	ldr r0, [r4]
	bl sub_020771A0
	ldr r0, [r4, #8]
	bl DestroyMsgData
	ldr r0, [r4, #0xc]
	bl ScrStrBufs_delete
	ldr r0, [r4, #0x10]
	bl FreeToHeap
	ldr r0, [r4, #0x3c]
	bl FreeToHeap
	ldr r0, [r4, #0x58]
	bl sub_020164C4
	ldr r0, [r4]
	bl FreeToHeap
	add r0, r4, #0
	add r0, #0x84
	ldr r0, [r0]
	bl NARC_dtor
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0
	bl TextFlags_SetCanABSpeedUpPrint
	mov r0, #0
	bl sub_02002B8C
	ldr r0, _02075E10 ; =gSystem + 0x60
	mov r1, #1
	strb r1, [r0, #9]
	bl GX_SwapDisplay
	pop {r4, pc}
	nop
_02075E10: .word gSystem + 0x60
	thumb_func_end sub_02075D4C

	thumb_func_start sub_02075E14
sub_02075E14: ; 0x02075E14
	push {r4, lr}
	sub sp, #0x90
	add r4, r0, #0
	add r0, #0x70
	ldrb r1, [r0]
	cmp r1, #0
	beq _02075EF0
	mov r0, #1
	tst r0, r1
	ldr r0, [r4, #0x1c]
	bne _02075E82
	add r2, r4, #0
	add r2, #0x71
	ldrb r2, [r2]
	mov r1, #0xc
	neg r2, r2
	bl sub_02008C2C
	add r2, r4, #0
	add r2, #0x71
	ldrb r2, [r2]
	ldr r0, [r4, #0x1c]
	mov r1, #0xd
	neg r2, r2
	bl sub_02008C2C
	add r2, r4, #0
	add r2, #0x71
	ldrb r2, [r2]
	ldr r0, [r4, #0x20]
	mov r1, #0xc
	bl sub_02008C2C
	add r2, r4, #0
	add r2, #0x71
	ldrb r2, [r2]
	ldr r0, [r4, #0x20]
	mov r1, #0xd
	bl sub_02008C2C
	ldr r0, [r4, #0x1c]
	mov r1, #0xc
	bl sub_02008A78
	cmp r0, #0
	bne _02075EF0
	add r0, r4, #0
	add r0, #0x70
	ldrb r1, [r0]
	mov r0, #1
	eor r1, r0
	add r0, r4, #0
	add r0, #0x70
	strb r1, [r0]
	b _02075EF0
_02075E82:
	add r2, r4, #0
	add r2, #0x71
	ldrb r2, [r2]
	mov r1, #0xc
	bl sub_02008C2C
	add r2, r4, #0
	add r2, #0x71
	ldrb r2, [r2]
	ldr r0, [r4, #0x1c]
	mov r1, #0xd
	bl sub_02008C2C
	add r2, r4, #0
	add r2, #0x71
	ldrb r2, [r2]
	ldr r0, [r4, #0x20]
	mov r1, #0xc
	neg r2, r2
	bl sub_02008C2C
	add r2, r4, #0
	add r2, #0x71
	ldrb r2, [r2]
	ldr r0, [r4, #0x20]
	mov r1, #0xd
	neg r2, r2
	bl sub_02008C2C
	ldr r0, [r4, #0x20]
	mov r1, #0xc
	bl sub_02008A78
	cmp r0, #0
	bne _02075EF0
	add r0, r4, #0
	add r0, #0x70
	ldrb r1, [r0]
	mov r0, #1
	eor r1, r0
	add r0, r4, #0
	add r0, #0x70
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x71
	ldrb r0, [r0]
	cmp r0, #0x40
	bhs _02075EF0
	add r0, r4, #0
	add r0, #0x71
	ldrb r0, [r0]
	lsl r1, r0, #1
	add r0, r4, #0
	add r0, #0x71
	strb r1, [r0]
_02075EF0:
	ldr r1, [r4, #0x7c]
	mov r0, #1
	tst r0, r1
	beq _02075F2A
	add r0, r4, #0
	add r0, #0x64
	ldrb r0, [r0]
	cmp r0, #8
	bne _02075F2A
	ldr r0, _02076210 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #2
	tst r0, r1
	beq _02075F2A
	mov r3, #0
	str r3, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	ldr r0, _02076214 ; =0x00007FFF
	ldr r2, _02076218 ; =0x0000F3FF
	str r0, [sp, #8]
	ldr r0, [r4, #0x14]
	mov r1, #0xf
	bl sub_02003370
	add r0, r4, #0
	mov r1, #0x29
	add r0, #0x64
	strb r1, [r0]
_02075F2A:
	add r0, r4, #0
	add r0, #0x64
	ldrb r0, [r0]
	cmp r0, #0x2d
	bhi _0207602A
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02075F40: ; jump table
	.short _02075F9C - _02075F40 - 2 ; case 0
	.short _02075FC4 - _02075F40 - 2 ; case 1
	.short _02075FF2 - _02075F40 - 2 ; case 2
	.short _0207601C - _02075F40 - 2 ; case 3
	.short _02076038 - _02075F40 - 2 ; case 4
	.short _020760CE - _02075F40 - 2 ; case 5
	.short _0207611A - _02075F40 - 2 ; case 6
	.short _0207619C - _02075F40 - 2 ; case 7
	.short _02076254 - _02075F40 - 2 ; case 8
	.short _020762F4 - _02075F40 - 2 ; case 9
	.short _02076382 - _02075F40 - 2 ; case 10
	.short _020763FC - _02075F40 - 2 ; case 11
	.short _02076478 - _02075F40 - 2 ; case 12
	.short _020764DE - _02075F40 - 2 ; case 13
	.short _02076558 - _02075F40 - 2 ; case 14
	.short _02076620 - _02075F40 - 2 ; case 15
	.short _0207659C - _02075F40 - 2 ; case 16
	.short _02076620 - _02075F40 - 2 ; case 17
	.short _020765D2 - _02075F40 - 2 ; case 18
	.short _02076620 - _02075F40 - 2 ; case 19
	.short _02076658 - _02075F40 - 2 ; case 20
	.short _02076670 - _02075F40 - 2 ; case 21
	.short _020766BC - _02075F40 - 2 ; case 22
	.short _02076748 - _02075F40 - 2 ; case 23
	.short _020767D0 - _02075F40 - 2 ; case 24
	.short _020768E0 - _02075F40 - 2 ; case 25
	.short _02076620 - _02075F40 - 2 ; case 26
	.short _02076906 - _02075F40 - 2 ; case 27
	.short _02076620 - _02075F40 - 2 ; case 28
	.short _02076958 - _02075F40 - 2 ; case 29
	.short _02076620 - _02075F40 - 2 ; case 30
	.short _0207697E - _02075F40 - 2 ; case 31
	.short _02076808 - _02075F40 - 2 ; case 32
	.short _02076620 - _02075F40 - 2 ; case 33
	.short _0207683C - _02075F40 - 2 ; case 34
	.short _02076854 - _02075F40 - 2 ; case 35
	.short _020768AE - _02075F40 - 2 ; case 36
	.short _02076A06 - _02075F40 - 2 ; case 37
	.short _02076A24 - _02075F40 - 2 ; case 38
	.short _02076A50 - _02075F40 - 2 ; case 39
	.short _02076A84 - _02075F40 - 2 ; case 40
	.short _02076AA4 - _02075F40 - 2 ; case 41
	.short _02076B4A - _02075F40 - 2 ; case 42
	.short _02076BB8 - _02075F40 - 2 ; case 43
	.short _02076C0C - _02075F40 - 2 ; case 44
	.short _02076C66 - _02075F40 - 2 ; case 45
_02075F9C:
	add r0, r4, #0
	add r0, #0x66
	ldrb r0, [r0]
	sub r1, r0, #1
	add r0, r4, #0
	add r0, #0x66
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x66
	ldrb r0, [r0]
	cmp r0, #0
	bne _0207602A
	add r0, r4, #0
	add r0, #0x64
	ldrb r0, [r0]
	add r4, #0x64
	add sp, #0x90
	add r0, r0, #1
	strb r0, [r4]
	pop {r4, pc}
_02075FC4:
	mov r0, #0
	bl SetMasterBrightnessNeutral
	mov r0, #1
	bl SetMasterBrightnessNeutral
	ldr r0, [r4, #0x58]
	mov r1, #0
	bl sub_0201649C
	ldr r1, [r4, #0x7c]
	mov r0, #2
	tst r1, r0
	beq _02075FE8
	add r4, #0x64
	add sp, #0x90
	strb r0, [r4]
	pop {r4, pc}
_02075FE8:
	mov r0, #4
	add r4, #0x64
	add sp, #0x90
	strb r0, [r4]
	pop {r4, pc}
_02075FF2:
	ldr r0, [r4, #0x14]
	bl sub_02003B44
	cmp r0, #0
	bne _0207602A
	mov r1, #0xe5
	add r0, r4, #0
	lsl r1, r1, #2
	bl sub_020772F8
	add r1, r4, #0
	add r1, #0x65
	strb r0, [r1]
	add r0, r4, #0
	add r0, #0x64
	ldrb r0, [r0]
	add r4, #0x64
	add sp, #0x90
	add r0, r0, #1
	strb r0, [r4]
	pop {r4, pc}
_0207601C:
	add r0, r4, #0
	add r0, #0x65
	ldrb r0, [r0]
	bl TextPrinterCheckActive
	cmp r0, #0
	beq _0207602E
_0207602A:
	bl _02076C76
_0207602E:
	mov r0, #4
	add r4, #0x64
	add sp, #0x90
	strb r0, [r4]
	pop {r4, pc}
_02076038:
	ldr r0, [r4, #0x14]
	bl sub_02003B44
	cmp r0, #0
	bne _02076132
	mov r0, #2
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	add r3, r4, #0
	add r0, r4, #0
	add r3, #0x60
	add r0, #0x84
	ldrh r3, [r3]
	ldr r0, [r0]
	ldr r1, [r4, #0x44]
	ldr r2, [r4, #0x1c]
	bl sub_0207294C
	add r2, r4, #0
	add r0, r4, #0
	add r2, #0x60
	add r0, #0x84
	ldrh r2, [r2]
	ldr r0, [r0]
	add r1, sp, #0x68
	mov r3, #1
	bl sub_02072914
	ldr r0, [r4, #0x1c]
	add r1, sp, #0x68
	bl sub_020085C8
	ldr r0, [r4, #0x1c]
	mov r1, #0
	bl sub_02008550
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0x60
	add r1, #0x80
	ldrh r0, [r0]
	ldrb r1, [r1]
	bl PlayCry
	ldr r0, [r4, #0x28]
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, [r4, #0xc]
	mov r1, #0
	bl BufferBoxMonNickname
	ldr r1, [r4, #0x7c]
	mov r0, #2
	tst r0, r1
	beq _020760B6
	ldr r1, _0207621C ; =0x00000395
	add r0, r4, #0
	bl sub_020772F8
	b _020760BE
_020760B6:
	ldr r1, _02076220 ; =0x00000393
	add r0, r4, #0
	bl sub_020772F8
_020760BE:
	add r1, r4, #0
	add r1, #0x65
	strb r0, [r1]
	mov r0, #5
	add r4, #0x64
	add sp, #0x90
	strb r0, [r4]
	pop {r4, pc}
_020760CE:
	add r0, r4, #0
	add r0, #0x65
	ldrb r0, [r0]
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _02076132
	bl IsCryFinished
	cmp r0, #0
	bne _02076132
	ldr r0, [r4, #0x44]
	mov r1, #0
	bl sub_02017068
	cmp r0, #1
	bne _02076132
	ldr r0, [r4, #0x1c]
	bl sub_020085DC
	cmp r0, #0
	bne _02076132
	ldr r0, [r4, #0x58]
	mov r1, #1
	bl sub_0201649C
	ldr r0, _02076224 ; =0x000003F3
	bl sub_02005D10
	add r0, r4, #0
	mov r1, #0x14
	add r0, #0x66
	strb r1, [r0]
	mov r0, #6
	add r4, #0x64
	add sp, #0x90
	strb r0, [r4]
	pop {r4, pc}
_0207611A:
	add r0, r4, #0
	add r0, #0x66
	ldrb r0, [r0]
	sub r1, r0, #1
	add r0, r4, #0
	add r0, #0x66
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x66
	ldrb r0, [r0]
	cmp r0, #0
	beq _02076136
_02076132:
	bl _02076C76
_02076136:
	ldr r0, [r4, #0x5c]
	str r0, [sp, #0x10]
	mov r0, #0
	str r0, [sp, #0x14]
	add r0, sp, #0x10
	bl sub_02077604
	mov r1, #0
	str r0, [r4, #0x30]
	bl sub_02077634
	ldr r0, _02076214 ; =0x00007FFF
	mov r1, #0
	str r0, [sp]
	ldr r0, [r4, #0x1c]
	mov r2, #0x10
	mov r3, #4
	bl sub_020090B4
	ldr r0, _02076214 ; =0x00007FFF
	mov r1, #0
	str r0, [sp]
	ldr r0, [r4, #0x20]
	mov r2, #0x10
	mov r3, #4
	bl sub_020090B4
	ldr r0, [r4, #0x5c]
	bl GF_ExpHeap_FndGetTotalFreeSize
	mov r1, #2
	lsl r1, r1, #0xe
	cmp r0, r1
	bhi _0207617E
	bl GF_AssertFail
_0207617E:
	ldr r0, _02076228 ; =0x000005F8
	bl PlaySE
	add r0, r4, #0
	mov r1, #0x28
	add r0, #0x66
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x64
	ldrb r0, [r0]
	add r4, #0x64
	add sp, #0x90
	add r0, r0, #1
	strb r0, [r4]
	pop {r4, pc}
_0207619C:
	add r0, r4, #0
	add r0, #0x73
	ldrb r0, [r0]
	cmp r0, #0x28
	bhs _020761C2
	add r0, r4, #0
	add r0, #0x73
	ldrb r0, [r0]
	add r1, r0, #2
	add r0, r4, #0
	add r0, #0x73
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x75
	ldrb r0, [r0]
	sub r1, r0, #2
	add r0, r4, #0
	add r0, #0x75
	strb r1, [r0]
_020761C2:
	add r0, r4, #0
	add r0, #0x66
	ldrb r0, [r0]
	sub r1, r0, #1
	add r0, r4, #0
	add r0, #0x66
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x66
	ldrb r0, [r0]
	cmp r0, #0
	bne _0207625E
	ldr r0, [r4, #0x30]
	mov r1, #1
	bl sub_02077634
	ldr r0, [r4, #0x30]
	mov r1, #2
	bl sub_02077634
	ldr r0, [r4, #0x30]
	mov r1, #7
	bl sub_02077634
	ldr r0, [r4, #0x30]
	mov r1, #8
	bl sub_02077634
	ldr r0, [r4, #0x30]
	mov r1, #9
	bl sub_02077634
	ldr r0, [r4, #0x30]
	mov r1, #0xb
	bl sub_02077634
	ldr r0, _0207622C ; =0x000005F9
	b _02076230
	nop
_02076210: .word gSystem
_02076214: .word 0x00007FFF
_02076218: .word 0x0000F3FF
_0207621C: .word 0x00000395
_02076220: .word 0x00000393
_02076224: .word 0x000003F3
_02076228: .word 0x000005F8
_0207622C: .word 0x000005F9
_02076230:
	bl PlaySE
	add r0, r4, #0
	mov r1, #0x10
	add r0, #0x70
	strb r1, [r0]
	add r0, r4, #0
	mov r1, #8
	add r0, #0x71
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x64
	ldrb r0, [r0]
	add r4, #0x64
	add sp, #0x90
	add r0, r0, #1
	strb r0, [r4]
	pop {r4, pc}
_02076254:
	ldr r0, [r4, #0x30]
	bl sub_02077650
	cmp r0, #0
	beq _02076262
_0207625E:
	bl _02076C76
_02076262:
	ldr r0, [r4, #0x30]
	mov r1, #3
	bl sub_02077634
	ldr r0, [r4, #0x30]
	mov r1, #4
	bl sub_02077634
	ldr r0, [r4, #0x30]
	mov r1, #5
	bl sub_02077634
	ldr r0, [r4, #0x30]
	mov r1, #6
	bl sub_02077634
	ldr r0, [r4, #0x30]
	mov r1, #0xa
	bl sub_02077634
	mov r0, #0
	str r0, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	ldr r0, _020765D8 ; =0x00007FFF
	ldr r2, _020765DC ; =0x0000F3FF
	str r0, [sp, #8]
	ldr r0, [r4, #0x14]
	mov r1, #0xf
	mov r3, #2
	bl sub_02003370
	ldr r0, [r4, #0x1c]
	mov r1, #0xc
	mov r2, #0
	bl sub_020087A4
	ldr r0, [r4, #0x1c]
	mov r1, #0xd
	mov r2, #0
	bl sub_020087A4
	mov r1, #0xc
	add r2, r1, #0
	ldr r0, [r4, #0x20]
	add r2, #0xf4
	bl sub_020087A4
	mov r1, #0xd
	add r2, r1, #0
	ldr r0, [r4, #0x20]
	add r2, #0xf3
	bl sub_020087A4
	ldr r0, _020765E0 ; =0x000005FA
	bl PlaySE
	add r0, r4, #0
	mov r1, #0
	add r0, #0x70
	strb r1, [r0]
	add r0, r4, #0
	mov r1, #8
	add r0, #0x66
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x64
	ldrb r0, [r0]
	add r4, #0x64
	add sp, #0x90
	add r0, r0, #1
	strb r0, [r4]
	pop {r4, pc}
_020762F4:
	add r0, r4, #0
	add r0, #0x73
	ldrb r0, [r0]
	cmp r0, #0
	beq _0207631A
	add r0, r4, #0
	add r0, #0x73
	ldrb r0, [r0]
	sub r1, r0, #2
	add r0, r4, #0
	add r0, #0x73
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x75
	ldrb r0, [r0]
	add r1, r0, #2
	add r0, r4, #0
	add r0, #0x75
	strb r1, [r0]
_0207631A:
	ldr r0, [r4, #0x14]
	bl sub_02003B44
	cmp r0, #0
	bne _02076396
	add r0, r4, #0
	add r0, #0x66
	ldrb r0, [r0]
	sub r1, r0, #1
	add r0, r4, #0
	add r0, #0x66
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x66
	ldrb r0, [r0]
	cmp r0, #0
	bne _02076396
	ldr r0, [r4, #0x30]
	mov r1, #0xc
	bl sub_02077634
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, _020765D8 ; =0x00007FFF
	ldr r2, _020765DC ; =0x0000F3FF
	str r0, [sp, #8]
	ldr r0, [r4, #0x14]
	mov r1, #0xf
	mov r3, #4
	bl sub_02003370
	ldr r0, _020765D8 ; =0x00007FFF
	mov r1, #0x10
	str r0, [sp]
	ldr r0, [r4, #0x18]
	mov r2, #0
	mov r3, #3
	bl sub_020090E4
	ldr r0, _020765E4 ; =0x000005FB
	bl PlaySE
	add r0, r4, #0
	add r0, #0x64
	ldrb r0, [r0]
	add r4, #0x64
	add sp, #0x90
	add r0, r0, #1
	strb r0, [r4]
	pop {r4, pc}
_02076382:
	ldr r0, [r4, #0x14]
	bl sub_02003B44
	cmp r0, #0
	bne _02076396
	ldr r0, [r4, #0x30]
	bl sub_02077650
	cmp r0, #0
	beq _0207639A
_02076396:
	bl _02076C76
_0207639A:
	mov r0, #2
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	add r3, r4, #0
	add r0, r4, #0
	add r3, #0x62
	add r0, #0x84
	ldrh r3, [r3]
	ldr r0, [r0]
	ldr r1, [r4, #0x44]
	ldr r2, [r4, #0x20]
	bl sub_0207294C
	add r2, r4, #0
	add r0, r4, #0
	add r2, #0x62
	add r0, #0x84
	ldrh r2, [r2]
	ldr r0, [r0]
	add r1, sp, #0x40
	mov r3, #1
	bl sub_02072914
	ldr r0, [r4, #0x20]
	add r1, sp, #0x40
	bl sub_020085C8
	ldr r0, [r4, #0x20]
	mov r1, #0
	bl sub_02008550
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0x62
	add r1, #0x80
	ldrh r0, [r0]
	ldrb r1, [r1]
	bl PlayCry
	add r0, r4, #0
	add r0, #0x64
	ldrb r0, [r0]
	add r4, #0x64
	add sp, #0x90
	add r0, r0, #1
	strb r0, [r4]
	pop {r4, pc}
_020763FC:
	bl IsCryFinished
	cmp r0, #0
	bne _020764F4
	ldr r0, [r4, #0x44]
	mov r1, #0
	bl sub_02017068
	cmp r0, #1
	bne _020764F4
	ldr r0, [r4, #0x20]
	bl sub_020085DC
	cmp r0, #0
	bne _020764F4
	add r2, r4, #0
	ldr r0, [r4, #0x28]
	mov r1, #5
	add r2, #0x62
	bl SetMonData
	ldr r0, [r4, #0x28]
	bl UpdateMonAbility
	ldr r0, [r4, #0x28]
	bl CalcMonLevelAndStats
	ldr r0, [r4, #0x28]
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, [r4, #0xc]
	mov r1, #0
	bl BufferBoxMonNickname
	ldr r0, [r4, #0x28]
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, [r4, #0xc]
	mov r1, #1
	bl BufferBoxMonSpeciesName
	ldr r1, _020765E8 ; =0x00000396
	add r0, r4, #0
	bl sub_020772F8
	add r1, r4, #0
	add r1, #0x65
	strb r0, [r1]
	add r0, r4, #0
	mov r1, #0x28
	add r0, #0x66
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x64
	ldrb r0, [r0]
	add r4, #0x64
	add sp, #0x90
	add r0, r0, #1
	strb r0, [r4]
	pop {r4, pc}
_02076478:
	add r0, r4, #0
	add r0, #0x65
	ldrb r0, [r0]
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _020764F4
	add r0, r4, #0
	add r0, #0x66
	ldrb r0, [r0]
	sub r1, r0, #1
	add r0, r4, #0
	add r0, #0x66
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x66
	ldrb r0, [r0]
	cmp r0, #0
	bne _020764F4
	ldr r0, [r4, #0x48]
	ldr r1, [r4, #0x28]
	bl Pokedex_SetMonCaughtFlag
	ldr r0, [r4, #0x50]
	mov r1, #0xd
	bl GameStats_Inc
	ldr r0, [r4, #0x50]
	mov r1, #0x15
	bl GameStats_AddSpecial
	ldr r0, [r4, #0x28]
	mov r1, #0x4d
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _020764CE
	ldr r0, [r4, #0x28]
	mov r1, #0xb3
	mov r2, #0
	bl SetMonData
_020764CE:
	add r0, r4, #0
	add r0, #0x64
	ldrb r0, [r0]
	add r4, #0x64
	add sp, #0x90
	add r0, r0, #1
	strb r0, [r4]
	pop {r4, pc}
_020764DE:
	add r1, r4, #0
	ldr r0, [r4, #0x28]
	add r1, #0x68
	add r2, sp, #0xc
	bl MonTryLearnMoveOnLevelUp
	cmp r0, #0
	beq _020764FE
	ldr r1, _020765EC ; =0x0000FFFE
	cmp r0, r1
	bne _020764F6
_020764F4:
	b _02076C76
_020764F6:
	add r1, r1, #1
	cmp r0, r1
	beq _02076508
	b _0207651C
_020764FE:
	mov r0, #0x27
	add r4, #0x64
	add sp, #0x90
	strb r0, [r4]
	pop {r4, pc}
_02076508:
	add r0, sp, #0xc
	ldrh r1, [r0]
	add r0, r4, #0
	add r0, #0x6c
	strh r1, [r0]
	mov r0, #0xe
	add r4, #0x64
	add sp, #0x90
	strb r0, [r4]
	pop {r4, pc}
_0207651C:
	ldr r0, [r4, #0x28]
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, [r4, #0xc]
	mov r1, #0
	bl BufferBoxMonNickname
	add r2, sp, #0xc
	ldrh r2, [r2]
	ldr r0, [r4, #0xc]
	mov r1, #1
	bl BufferMoveName
	add r0, r4, #0
	mov r1, #4
	bl sub_020772F8
	add r1, r4, #0
	add r1, #0x65
	strb r0, [r1]
	add r0, r4, #0
	mov r1, #0x1e
	add r0, #0x66
	strb r1, [r0]
	mov r0, #0x25
	add r4, #0x64
	add sp, #0x90
	strb r0, [r4]
	pop {r4, pc}
_02076558:
	ldr r0, [r4, #0x28]
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, [r4, #0xc]
	mov r1, #0
	bl BufferBoxMonNickname
	add r2, r4, #0
	add r2, #0x6c
	ldrh r2, [r2]
	ldr r0, [r4, #0xc]
	mov r1, #1
	bl BufferMoveName
	ldr r1, _020765F0 ; =0x000004A9
	add r0, r4, #0
	bl sub_020772F8
	add r1, r4, #0
	add r1, #0x65
	strb r0, [r1]
	add r0, r4, #0
	mov r1, #0x1e
	add r0, #0x66
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x64
	ldrb r0, [r0]
	add r4, #0x64
	add sp, #0x90
	add r0, r0, #1
	strb r0, [r4]
	pop {r4, pc}
_0207659C:
	ldr r0, [r4, #0x28]
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, [r4, #0xc]
	mov r1, #0
	bl BufferBoxMonNickname
	ldr r1, _020765F4 ; =0x000004AA
	add r0, r4, #0
	bl sub_020772F8
	add r1, r4, #0
	add r1, #0x65
	strb r0, [r1]
	add r0, r4, #0
	mov r1, #0x1e
	add r0, #0x66
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x64
	ldrb r0, [r0]
	add r4, #0x64
	add sp, #0x90
	add r0, r0, #1
	strb r0, [r4]
	pop {r4, pc}
_020765D2:
	ldr r1, _020765F8 ; =0x000004AB
	b _020765FC
	nop
_020765D8: .word 0x00007FFF
_020765DC: .word 0x0000F3FF
_020765E0: .word 0x000005FA
_020765E4: .word 0x000005FB
_020765E8: .word 0x00000396
_020765EC: .word 0x0000FFFE
_020765F0: .word 0x000004A9
_020765F4: .word 0x000004AA
_020765F8: .word 0x000004AB
_020765FC:
	add r0, r4, #0
	bl sub_020772F8
	add r1, r4, #0
	add r1, #0x65
	strb r0, [r1]
	add r0, r4, #0
	mov r1, #1
	add r0, #0x66
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x64
	ldrb r0, [r0]
	add r4, #0x64
	add sp, #0x90
	add r0, r0, #1
	strb r0, [r4]
	pop {r4, pc}
_02076620:
	add r0, r4, #0
	add r0, #0x65
	ldrb r0, [r0]
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _02076646
	add r0, r4, #0
	add r0, #0x66
	ldrb r0, [r0]
	sub r1, r0, #1
	add r0, r4, #0
	add r0, #0x66
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x66
	ldrb r0, [r0]
	cmp r0, #0
	beq _02076648
_02076646:
	b _02076C76
_02076648:
	add r0, r4, #0
	add r0, #0x64
	ldrb r0, [r0]
	add r4, #0x64
	add sp, #0x90
	add r0, r0, #1
	strb r0, [r4]
	pop {r4, pc}
_02076658:
	add r0, r4, #0
	mov r1, #1
	bl sub_0207584C
	add r0, r4, #0
	add r0, #0x64
	ldrb r0, [r0]
	add r4, #0x64
	add sp, #0x90
	add r0, r0, #1
	strb r0, [r4]
	pop {r4, pc}
_02076670:
	add r0, r4, #0
	bl sub_02075A04
	cmp r0, #1
	beq _02076682
	cmp r0, #2
	beq _020766B2
	add sp, #0x90
	pop {r4, pc}
_02076682:
	add r0, r4, #0
	mov r1, #0x16
	add r0, #0x64
	strb r1, [r0]
	mov r1, #0
	str r1, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r0, [r4, #0x14]
	ldr r2, _020769A0 ; =0x0000FFFF
	mov r1, #0xf
	mov r3, #1
	bl sub_02003370
	mov r1, #0
	str r1, [sp]
	ldr r0, [r4, #0x18]
	mov r2, #0x10
	add r3, r1, #0
	bl sub_020090E4
	add sp, #0x90
	pop {r4, pc}
_020766B2:
	mov r0, #0x20
	add r4, #0x64
	add sp, #0x90
	strb r0, [r4]
	pop {r4, pc}
_020766BC:
	ldr r0, [r4, #0x14]
	bl sub_02003B44
	cmp r0, #0
	bne _02076752
	mov r0, #0
	add r1, r0, #0
	bl sub_0200FBF4
	mov r0, #1
	mov r1, #0
	bl sub_0200FBF4
	ldr r0, [r4]
	bl sub_020771A0
	add r0, r4, #0
	bl sub_02075770
	ldr r0, [r4, #0x1c]
	mov r1, #6
	mov r2, #1
	bl sub_020087A4
	ldr r0, [r4, #0x20]
	mov r1, #6
	mov r2, #1
	bl sub_020087A4
	ldr r1, [r4, #0x28]
	ldr r0, [r4, #0x3c]
	mov r2, #1
	str r1, [r0]
	ldr r1, [r4, #0x2c]
	ldr r0, [r4, #0x3c]
	str r1, [r0, #4]
	ldr r1, [r4, #0x3c]
	mov r0, #0
	strb r0, [r1, #0x11]
	ldr r1, [r4, #0x3c]
	strb r0, [r1, #0x14]
	ldr r1, [r4, #0x3c]
	strb r2, [r1, #0x13]
	add r1, r4, #0
	add r1, #0x6c
	ldrh r2, [r1]
	ldr r1, [r4, #0x3c]
	strh r2, [r1, #0x18]
	ldr r1, [r4, #0x3c]
	mov r2, #2
	strb r2, [r1, #0x12]
	ldr r1, [r4, #0x3c]
	str r0, [r1, #0x28]
	ldr r1, [r4, #0x3c]
	str r0, [r1, #0x30]
	ldr r0, [r4, #0x3c]
	ldr r1, _020769A4 ; =_020FFEC0
	bl sub_02089D40
	add r0, r4, #0
	bl sub_02077394
	add r0, r4, #0
	add r0, #0x64
	ldrb r0, [r0]
	add r4, #0x64
	add sp, #0x90
	add r0, r0, #1
	strb r0, [r4]
	pop {r4, pc}
_02076748:
	ldr r0, [r4, #0x38]
	bl OverlayManager_run
	cmp r0, #0
	bne _02076754
_02076752:
	b _02076C76
_02076754:
	ldr r0, [r4, #0x38]
	bl OverlayManager_delete
	mov r0, #0
	str r0, [r4, #0x38]
	ldr r1, [r4]
	add r0, r4, #0
	bl sub_02076E64
	add r0, r4, #0
	bl sub_02075630
	ldr r0, [r4, #4]
	mov r1, #0
	mov r2, #1
	mov r3, #0xa
	bl DrawFrameAndWindow2
	ldr r0, [r4, #0x1c]
	mov r1, #6
	mov r2, #0
	bl sub_020087A4
	ldr r0, [r4, #0x20]
	mov r1, #6
	mov r2, #0
	bl sub_020087A4
	ldr r0, [r4, #0x1c]
	bl sub_02009324
	ldr r0, [r4, #0x20]
	bl sub_02009324
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r4, #0x14]
	ldr r2, _020769A0 ; =0x0000FFFF
	mov r1, #0xf
	mov r3, #1
	bl sub_02003370
	mov r2, #0
	str r2, [sp]
	ldr r0, [r4, #0x18]
	mov r1, #0x10
	add r3, r2, #0
	bl sub_020090E4
	bl sub_0203A880
	add r0, r4, #0
	add r0, #0x64
	ldrb r0, [r0]
	add r4, #0x64
	add sp, #0x90
	add r0, r0, #1
	strb r0, [r4]
	pop {r4, pc}
_020767D0:
	mov r0, #0
	bl SetMasterBrightnessNeutral
	mov r0, #1
	bl SetMasterBrightnessNeutral
	ldr r0, [r4, #0x14]
	bl sub_02003B44
	cmp r0, #0
	bne _020768D4
	ldr r0, [r4, #0x3c]
	ldrb r1, [r0, #0x16]
	cmp r1, #4
	bne _020767F8
	mov r0, #0x20
	add r4, #0x64
	add sp, #0x90
	strb r0, [r4]
	pop {r4, pc}
_020767F8:
	add r0, r4, #0
	add r0, #0x6e
	strb r1, [r0]
	mov r0, #0x19
	add r4, #0x64
	add sp, #0x90
	strb r0, [r4]
	pop {r4, pc}
_02076808:
	add r2, r4, #0
	add r2, #0x6c
	ldrh r2, [r2]
	ldr r0, [r4, #0xc]
	mov r1, #0
	bl BufferMoveName
	ldr r1, _020769A8 ; =0x000004AD
	add r0, r4, #0
	bl sub_020772F8
	add r1, r4, #0
	add r1, #0x65
	strb r0, [r1]
	add r0, r4, #0
	mov r1, #1
	add r0, #0x66
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x64
	ldrb r0, [r0]
	add r4, #0x64
	add sp, #0x90
	add r0, r0, #1
	strb r0, [r4]
	pop {r4, pc}
_0207683C:
	add r0, r4, #0
	mov r1, #0
	bl sub_0207584C
	add r0, r4, #0
	add r0, #0x64
	ldrb r0, [r0]
	add r4, #0x64
	add sp, #0x90
	add r0, r0, #1
	strb r0, [r4]
	pop {r4, pc}
_02076854:
	add r0, r4, #0
	bl sub_02075A04
	cmp r0, #1
	beq _02076866
	cmp r0, #2
	beq _020768A4
	add sp, #0x90
	pop {r4, pc}
_02076866:
	ldr r0, [r4, #0x28]
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, [r4, #0xc]
	mov r1, #0
	bl BufferBoxMonNickname
	add r2, r4, #0
	add r2, #0x6c
	ldrh r2, [r2]
	ldr r0, [r4, #0xc]
	mov r1, #1
	bl BufferMoveName
	ldr r1, _020769AC ; =0x000004AE
	add r0, r4, #0
	bl sub_020772F8
	add r1, r4, #0
	add r1, #0x65
	strb r0, [r1]
	add r0, r4, #0
	mov r1, #0x1e
	add r0, #0x66
	strb r1, [r0]
	mov r0, #0x24
	add r4, #0x64
	add sp, #0x90
	strb r0, [r4]
	pop {r4, pc}
_020768A4:
	mov r0, #0xe
	add r4, #0x64
	add sp, #0x90
	strb r0, [r4]
	pop {r4, pc}
_020768AE:
	add r0, r4, #0
	add r0, #0x65
	ldrb r0, [r0]
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _020768D4
	add r0, r4, #0
	add r0, #0x66
	ldrb r0, [r0]
	sub r1, r0, #1
	add r0, r4, #0
	add r0, #0x66
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x66
	ldrb r0, [r0]
	cmp r0, #0
	beq _020768D6
_020768D4:
	b _02076C76
_020768D6:
	mov r0, #0xd
	add r4, #0x64
	add sp, #0x90
	strb r0, [r4]
	pop {r4, pc}
_020768E0:
	ldr r1, _020769B0 ; =0x000004AF
	add r0, r4, #0
	bl sub_020772F8
	add r1, r4, #0
	add r1, #0x65
	strb r0, [r1]
	add r0, r4, #0
	mov r1, #0x1e
	add r0, #0x66
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x64
	ldrb r0, [r0]
	add r4, #0x64
	add sp, #0x90
	add r0, r0, #1
	strb r0, [r4]
	pop {r4, pc}
_02076906:
	ldr r0, [r4, #0x28]
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, [r4, #0xc]
	mov r1, #0
	bl BufferBoxMonNickname
	add r1, r4, #0
	add r1, #0x6e
	ldrb r1, [r1]
	ldr r0, [r4, #0x28]
	mov r2, #0
	add r1, #0x36
	bl GetMonData
	add r2, r0, #0
	ldr r0, [r4, #0xc]
	mov r1, #1
	bl BufferMoveName
	mov r1, #0x4b
	add r0, r4, #0
	lsl r1, r1, #4
	bl sub_020772F8
	add r1, r4, #0
	add r1, #0x65
	strb r0, [r1]
	add r0, r4, #0
	mov r1, #0x1e
	add r0, #0x66
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x64
	ldrb r0, [r0]
	add r4, #0x64
	add sp, #0x90
	add r0, r0, #1
	strb r0, [r4]
	pop {r4, pc}
_02076958:
	ldr r1, _020769B4 ; =0x000004B1
	add r0, r4, #0
	bl sub_020772F8
	add r1, r4, #0
	add r1, #0x65
	strb r0, [r1]
	add r0, r4, #0
	mov r1, #0x1e
	add r0, #0x66
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x64
	ldrb r0, [r0]
	add r4, #0x64
	add sp, #0x90
	add r0, r0, #1
	strb r0, [r4]
	pop {r4, pc}
_0207697E:
	ldr r0, [r4, #0x28]
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, [r4, #0xc]
	mov r1, #0
	bl BufferBoxMonNickname
	add r2, r4, #0
	add r2, #0x6c
	ldrh r2, [r2]
	ldr r0, [r4, #0xc]
	mov r1, #1
	bl BufferMoveName
	ldr r1, _020769B8 ; =0x000004B2
	b _020769BC
	.balign 4, 0
_020769A0: .word 0x0000FFFF
_020769A4: .word _020FFEC0
_020769A8: .word 0x000004AD
_020769AC: .word 0x000004AE
_020769B0: .word 0x000004AF
_020769B4: .word 0x000004B1
_020769B8: .word 0x000004B2
_020769BC:
	add r0, r4, #0
	bl sub_020772F8
	add r1, r4, #0
	add r1, #0x65
	strb r0, [r1]
	add r0, r4, #0
	add r2, r4, #0
	mov r1, #0
	add r0, #0x66
	strb r1, [r0]
	add r1, r4, #0
	add r1, #0x6e
	ldrb r1, [r1]
	ldr r0, [r4, #0x28]
	add r2, #0x66
	add r1, #0x3e
	bl SetMonData
	add r1, r4, #0
	add r2, r4, #0
	add r1, #0x6c
	add r2, #0x6e
	ldrh r1, [r1]
	ldrb r2, [r2]
	ldr r0, [r4, #0x28]
	bl MonSetMoveInSlot
	add r0, r4, #0
	mov r1, #0x1e
	add r0, #0x66
	strb r1, [r0]
	mov r0, #0x25
	add r4, #0x64
	add sp, #0x90
	strb r0, [r4]
	pop {r4, pc}
_02076A06:
	add r0, r4, #0
	add r0, #0x65
	ldrb r0, [r0]
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _02076A44
	add r0, r4, #0
	add r0, #0x64
	ldrb r0, [r0]
	add r4, #0x64
	add sp, #0x90
	add r0, r0, #1
	strb r0, [r4]
	pop {r4, pc}
_02076A24:
	bl IsFanfarePlaying
	cmp r0, #0
	bne _02076A44
	add r0, r4, #0
	add r0, #0x66
	ldrb r0, [r0]
	sub r1, r0, #1
	add r0, r4, #0
	add r0, #0x66
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x66
	ldrb r0, [r0]
	cmp r0, #0
	beq _02076A46
_02076A44:
	b _02076C76
_02076A46:
	mov r0, #0xd
	add r4, #0x64
	add sp, #0x90
	strb r0, [r4]
	pop {r4, pc}
_02076A50:
	mov r1, #0
	str r1, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r0, [r4, #0x14]
	ldr r2, _02076C7C ; =0x0000FFFF
	mov r1, #0xf
	mov r3, #1
	bl sub_02003370
	mov r1, #0
	str r1, [sp]
	ldr r0, [r4, #0x18]
	mov r2, #0x10
	add r3, r1, #0
	bl sub_020090E4
	add r0, r4, #0
	add r0, #0x64
	ldrb r0, [r0]
	add r4, #0x64
	add sp, #0x90
	add r0, r0, #1
	strb r0, [r4]
	pop {r4, pc}
_02076A84:
	ldr r0, [r4, #0x14]
	bl sub_02003B44
	cmp r0, #0
	bne _02076B54
	ldr r0, [r4, #0x30]
	bl sub_02077664
	add r0, r4, #0
	bl sub_02076C90
	mov r0, #1
	add r4, #0x67
	add sp, #0x90
	strb r0, [r4]
	pop {r4, pc}
_02076AA4:
	ldr r0, [r4, #0x14]
	bl sub_02003B44
	cmp r0, #0
	bne _02076B54
	mov r1, #0xc
	add r2, r1, #0
	ldr r0, [r4, #0x1c]
	add r2, #0xf4
	bl sub_020087A4
	mov r1, #0xd
	add r2, r1, #0
	ldr r0, [r4, #0x1c]
	add r2, #0xf3
	bl sub_020087A4
	ldr r0, [r4, #0x20]
	mov r1, #0xc
	mov r2, #0
	bl sub_020087A4
	ldr r0, [r4, #0x20]
	mov r1, #0xd
	mov r2, #0
	bl sub_020087A4
	ldr r0, [r4, #0x20]
	mov r1, #6
	mov r2, #1
	bl sub_020087A4
	mov r0, #0x10
	str r0, [sp]
	mov r3, #0
	ldr r0, _02076C80 ; =0x00007FFF
	str r3, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r4, #0x14]
	ldr r2, _02076C84 ; =0x0000F3FF
	mov r1, #0xf
	bl sub_02003370
	ldr r0, _02076C80 ; =0x00007FFF
	mov r2, #0
	str r0, [sp]
	ldr r0, [r4, #0x18]
	mov r1, #0x10
	add r3, r2, #0
	bl sub_020090E4
	add r0, r4, #0
	mov r1, #0
	add r0, #0x72
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x73
	strb r1, [r0]
	add r0, r4, #0
	mov r2, #0xff
	add r0, #0x74
	strb r2, [r0]
	add r0, r4, #0
	mov r2, #0xa0
	add r0, #0x75
	strb r2, [r0]
	add r0, r4, #0
	add r0, #0x70
	strb r1, [r0]
	ldr r0, _02076C88 ; =0x000003F3
	bl StopBGM
	ldr r0, [r4, #0x30]
	bl sub_02077664
	add r0, r4, #0
	add r0, #0x64
	ldrb r0, [r0]
	add r4, #0x64
	add sp, #0x90
	add r0, r0, #1
	strb r0, [r4]
	pop {r4, pc}
_02076B4A:
	ldr r0, [r4, #0x14]
	bl sub_02003B44
	cmp r0, #0
	beq _02076B56
_02076B54:
	b _02076C76
_02076B56:
	mov r0, #2
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	add r3, r4, #0
	add r0, r4, #0
	add r3, #0x60
	add r0, #0x84
	ldrh r3, [r3]
	ldr r0, [r0]
	ldr r1, [r4, #0x44]
	ldr r2, [r4, #0x1c]
	bl sub_0207294C
	add r2, r4, #0
	add r0, r4, #0
	add r2, #0x60
	add r0, #0x84
	ldrh r2, [r2]
	ldr r0, [r0]
	add r1, sp, #0x18
	mov r3, #1
	bl sub_02072914
	ldr r0, [r4, #0x1c]
	add r1, sp, #0x18
	bl sub_020085C8
	ldr r0, [r4, #0x1c]
	mov r1, #0
	bl sub_02008550
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0x60
	add r1, #0x80
	ldrh r0, [r0]
	ldrb r1, [r1]
	bl PlayCry
	add r0, r4, #0
	add r0, #0x64
	ldrb r0, [r0]
	add r4, #0x64
	add sp, #0x90
	add r0, r0, #1
	strb r0, [r4]
	pop {r4, pc}
_02076BB8:
	bl IsCryFinished
	cmp r0, #0
	bne _02076C76
	ldr r0, [r4, #0x44]
	mov r1, #0
	bl sub_02017068
	cmp r0, #1
	bne _02076C76
	ldr r0, [r4, #0x1c]
	bl sub_020085DC
	cmp r0, #0
	bne _02076C76
	ldr r0, [r4, #0x28]
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, [r4, #0xc]
	mov r1, #0
	bl BufferBoxMonNickname
	ldr r1, _02076C8C ; =0x00000397
	add r0, r4, #0
	bl sub_020772F8
	add r1, r4, #0
	add r1, #0x65
	strb r0, [r1]
	add r0, r4, #0
	mov r1, #0x14
	add r0, #0x66
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x64
	ldrb r0, [r0]
	add r4, #0x64
	add sp, #0x90
	add r0, r0, #1
	strb r0, [r4]
	pop {r4, pc}
_02076C0C:
	add r0, r4, #0
	add r0, #0x65
	ldrb r0, [r0]
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _02076C76
	add r0, r4, #0
	add r0, #0x66
	ldrb r0, [r0]
	sub r1, r0, #1
	add r0, r4, #0
	add r0, #0x66
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x66
	ldrb r0, [r0]
	cmp r0, #0
	bne _02076C76
	mov r1, #0
	str r1, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r0, [r4, #0x14]
	ldr r2, _02076C7C ; =0x0000FFFF
	mov r1, #0xf
	mov r3, #1
	bl sub_02003370
	mov r1, #0
	str r1, [sp]
	ldr r0, [r4, #0x18]
	mov r2, #0x10
	add r3, r1, #0
	bl sub_020090E4
	add r0, r4, #0
	add r0, #0x64
	ldrb r0, [r0]
	add r4, #0x64
	add sp, #0x90
	add r0, r0, #1
	strb r0, [r4]
	pop {r4, pc}
_02076C66:
	ldr r0, [r4, #0x14]
	bl sub_02003B44
	cmp r0, #0
	bne _02076C76
	mov r0, #1
	add r4, #0x67
	strb r0, [r4]
_02076C76:
	add sp, #0x90
	pop {r4, pc}
	nop
_02076C7C: .word 0x0000FFFF
_02076C80: .word 0x00007FFF
_02076C84: .word 0x0000F3FF
_02076C88: .word 0x000003F3
_02076C8C: .word 0x00000397
	thumb_func_end sub_02075E14

	thumb_func_start sub_02076C90
sub_02076C90: ; 0x02076C90
	push {r4, r5, r6, lr}
	sub sp, #0x20
	add r4, r0, #0
	ldr r0, [r4, #0x78]
	cmp r0, #6
	bgt _02076CA4
	bne _02076CA0
	b _02076E50
_02076CA0:
	add sp, #0x20
	pop {r4, r5, r6, pc}
_02076CA4:
	sub r0, #0xd
	cmp r0, #6
	bhi _02076CE4
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02076CB6: ; jump table
	.short _02076CC4 - _02076CB6 - 2 ; case 0
	.short _02076CC4 - _02076CB6 - 2 ; case 1
	.short _02076E5E - _02076CB6 - 2 ; case 2
	.short _02076E5E - _02076CB6 - 2 ; case 3
	.short _02076E5E - _02076CB6 - 2 ; case 4
	.short _02076E50 - _02076CB6 - 2 ; case 5
	.short _02076E50 - _02076CB6 - 2 ; case 6
_02076CC4:
	ldr r0, [r4, #0x4c]
	ldr r2, [r4, #0x5c]
	mov r1, #4
	bl Bag_GetQuantity
	cmp r0, #0
	beq _02076CE4
	ldr r0, [r4, #0x24]
	bl GetPartyCount
	add r5, r0, #0
	ldr r0, [r4, #0x24]
	bl GetPartyMaxCount
	cmp r5, r0
	blt _02076CE6
_02076CE4:
	b _02076E5E
_02076CE6:
	ldr r0, [r4, #0x5c]
	bl AllocMonZeroed
	add r5, r0, #0
	ldr r0, [r4, #0x28]
	add r1, r5, #0
	bl CopyPokemonToPokemon
	mov r0, #0x49
	lsl r0, r0, #2
	str r0, [sp]
	add r0, r5, #0
	mov r1, #5
	add r2, sp, #0
	bl SetMonData
	mov r0, #4
	str r0, [sp]
	add r0, r5, #0
	mov r1, #0x9b
	add r2, sp, #0
	bl SetMonData
	mov r0, #0
	str r0, [sp]
	add r0, r5, #0
	mov r1, #6
	add r2, sp, #0
	bl SetMonData
	add r0, r5, #0
	mov r1, #0xb
	add r2, sp, #0
	bl SetMonData
	mov r1, #0x19
	str r1, [sp, #4]
	add r6, sp, #0
_02076D32:
	add r0, r5, #0
	add r2, r6, #0
	bl SetMonData
	ldr r0, [sp, #4]
	add r1, r0, #1
	str r1, [sp, #4]
	cmp r1, #0x36
	blt _02076D32
	mov r1, #0x4e
	str r1, [sp, #4]
	add r6, sp, #0
_02076D4A:
	add r0, r5, #0
	add r2, r6, #0
	bl SetMonData
	ldr r0, [sp, #4]
	add r1, r0, #1
	str r1, [sp, #4]
	cmp r1, #0x6e
	blt _02076D4A
	mov r1, #0x7b
	str r1, [sp, #4]
	add r6, sp, #0
_02076D62:
	add r0, r5, #0
	add r2, r6, #0
	bl SetMonData
	ldr r0, [sp, #4]
	add r1, r0, #1
	str r1, [sp, #4]
	cmp r1, #0x90
	blt _02076D62
	add r0, r5, #0
	mov r1, #0xb5
	add r2, sp, #0
	bl SetMonData
	add r0, r5, #0
	mov r1, #0xb6
	add r2, sp, #0
	bl SetMonData
	add r0, r5, #0
	mov r1, #0xb7
	add r2, sp, #0
	bl SetMonData
	add r0, r5, #0
	mov r1, #0xb8
	add r2, sp, #0
	bl SetMonData
	add r0, r5, #0
	mov r1, #0xb9
	add r2, sp, #0
	bl SetMonData
	add r0, r5, #0
	mov r1, #0xba
	add r2, sp, #0
	bl SetMonData
	add r0, r5, #0
	mov r1, #0xbb
	add r2, sp, #0
	bl SetMonData
	add r0, r5, #0
	mov r1, #0xb3
	mov r2, #0
	bl SetMonData
	add r0, r5, #0
	mov r1, #0x4d
	add r2, sp, #0
	bl SetMonData
	add r0, r5, #0
	mov r1, #0xa0
	add r2, sp, #0
	bl SetMonData
	ldr r0, [r4, #0x5c]
	bl Mail_new
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #0xaa
	add r2, r6, #0
	bl SetMonData
	add r0, r6, #0
	bl FreeToHeap
	add r0, r5, #0
	mov r1, #0xa2
	add r2, sp, #0
	bl SetMonData
	mov r0, #0
	add r1, sp, #8
	mov r2, #0x18
	bl MIi_CpuClearFast
	add r0, r5, #0
	mov r1, #0xab
	add r2, sp, #8
	bl SetMonData
	add r0, r5, #0
	bl UpdateMonAbility
	add r0, r5, #0
	bl CalcMonLevelAndStats
	ldr r0, [r4, #0x24]
	add r1, r5, #0
	bl AddMonToParty
	ldr r0, [r4, #0x48]
	add r1, r5, #0
	bl Pokedex_SetMonCaughtFlag
	ldr r0, [r4, #0x50]
	mov r1, #0xd
	bl GameStats_Inc
	ldr r0, [r4, #0x50]
	mov r1, #0x15
	bl GameStats_AddSpecial
	add r0, r5, #0
	bl FreeToHeap
	ldr r0, [r4, #0x4c]
	ldr r3, [r4, #0x5c]
	mov r1, #4
	mov r2, #1
	bl Bag_TakeItem
	add sp, #0x20
	pop {r4, r5, r6, pc}
_02076E50:
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, [r4, #0x28]
	mov r1, #6
	add r2, sp, #4
	bl SetMonData
_02076E5E:
	add sp, #0x20
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02076C90

	thumb_func_start sub_02076E64
sub_02076E64: ; 0x02076E64
	push {r4, r5, r6, lr}
	sub sp, #0xf0
	add r5, r0, #0
	add r4, r1, #0
	bl GX_DisableEngineALayers
	ldr r6, _02077180 ; =_020FFF34
	add r3, sp, #0x20
	mov r2, #5
_02076E76:
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _02076E76
	add r0, sp, #0x20
	bl GX_SetBanks
	mov r1, #6
	mov r2, #2
	mov r0, #0
	lsl r1, r1, #0x18
	lsl r2, r2, #0x12
	bl MIi_CpuClear32
	mov r1, #0x62
	mov r2, #2
	mov r0, #0
	lsl r1, r1, #0x14
	lsl r2, r2, #0x10
	bl MIi_CpuClear32
	mov r1, #0x19
	mov r2, #1
	mov r0, #0
	lsl r1, r1, #0x16
	lsl r2, r2, #0x12
	bl MIi_CpuClear32
	mov r1, #0x66
	mov r2, #2
	mov r0, #0
	lsl r1, r1, #0x14
	lsl r2, r2, #0x10
	bl MIi_CpuClear32
	ldr r6, _02077184 ; =_020FFED8
	add r3, sp, #0x10
	add r2, r3, #0
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	ldr r6, _02077188 ; =_020FFF90
	add r3, sp, #0x9c
	mov r2, #0xa
_02076ED6:
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _02076ED6
	ldr r0, [r6]
	mov r1, #1
	str r0, [r3]
	add r0, r4, #0
	add r2, sp, #0x9c
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #1
	bl BgClearTilemapBufferAndCommit
	add r0, r4, #0
	mov r1, #2
	add r2, sp, #0xb8
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	add r0, r4, #0
	mov r1, #3
	add r2, sp, #0xd4
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	ldr r1, _0207718C ; =0x04000008
	mov r0, #3
	ldrh r2, [r1]
	bic r2, r0
	mov r0, #1
	orr r2, r0
	strh r2, [r1]
	add r1, r0, #0
	bl GX_EngineAToggleLayers
	ldr r6, _02077190 ; =_020FFFE4
	add r3, sp, #0x48
	mov r2, #0xa
_02076F38:
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _02076F38
	ldr r0, [r6]
	mov r1, #4
	str r0, [r3]
	add r0, r4, #0
	add r2, sp, #0x48
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #4
	bl BgClearTilemapBufferAndCommit
	add r0, r4, #0
	mov r1, #5
	add r2, sp, #0x64
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #5
	bl BgClearTilemapBufferAndCommit
	add r0, r4, #0
	mov r1, #6
	add r2, sp, #0x80
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #6
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x2c]
	bl Options_GetFrame
	add r6, r0, #0
	lsl r0, r6, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	ldr r0, [r5, #0x5c]
	mov r1, #1
	str r0, [sp, #4]
	add r0, r4, #0
	add r2, r1, #0
	mov r3, #0xa
	bl sub_0200EB80
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, [r5, #0x5c]
	add r2, r4, #0
	str r0, [sp, #0xc]
	mov r0, #0x73
	mov r3, #3
	bl GfGfxLoader_LoadCharData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r1, #1
	str r1, [sp, #8]
	ldr r0, [r5, #0x5c]
	add r2, r4, #0
	str r0, [sp, #0xc]
	mov r0, #0x73
	mov r3, #3
	bl GfGfxLoader_LoadScrnData
	mov r1, #0
	str r1, [sp]
	mov r0, #0x40
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r0, [r5, #0x14]
	ldr r3, [r5, #0x5c]
	mov r1, #0x73
	mov r2, #8
	bl PaletteData_LoadNarc
	add r0, r6, #0
	bl sub_0200E640
	add r2, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0xa0
	str r0, [sp, #8]
	ldr r0, [r5, #0x14]
	ldr r3, [r5, #0x5c]
	mov r1, #0x26
	bl PaletteData_LoadNarc
	mov r0, #0
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0xb0
	str r0, [sp, #8]
	ldr r0, [r5, #0x14]
	ldr r3, [r5, #0x5c]
	mov r1, #0x10
	mov r2, #8
	bl PaletteData_LoadNarc
	ldr r0, [r5, #0x5c]
	mov r1, #2
	str r0, [sp]
	ldr r0, [r5]
	mov r2, #1
	mov r3, #0
	bl sub_0200E398
	bl sub_0200E3D8
	add r2, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0x80
	str r0, [sp, #8]
	ldr r0, [r5, #0x14]
	ldr r3, [r5, #0x5c]
	mov r1, #0x26
	bl PaletteData_LoadNarc
	mov r0, #1
	str r0, [sp]
	mov r0, #0xa0
	str r0, [sp, #4]
	mov r2, #0
	str r2, [sp, #8]
	ldr r0, [r5, #0x14]
	ldr r3, [r5, #0x5c]
	mov r1, #0xef
	bl PaletteData_LoadNarc
	mov r0, #1
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0x90
	str r0, [sp, #8]
	ldr r0, [r5, #0x14]
	ldr r3, [r5, #0x5c]
	mov r1, #0xef
	mov r2, #0xf
	bl PaletteData_LoadNarc
	mov r0, #1
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0xf0
	str r0, [sp, #8]
	ldr r0, [r5, #0x14]
	ldr r3, [r5, #0x5c]
	mov r1, #0x10
	mov r2, #9
	bl PaletteData_LoadNarc
	ldr r1, [r5, #0x5c]
	mov r0, #0xef
	bl NARC_ctor
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	ldr r1, [r5, #0x5c]
	add r2, r4, #0
	str r1, [sp, #0xc]
	mov r1, #0x10
	mov r3, #4
	add r6, r0, #0
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5, #0x5c]
	mov r1, #0x11
	str r0, [sp, #0xc]
	add r0, r6, #0
	add r2, r4, #0
	mov r3, #4
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5, #0x5c]
	mov r1, #1
	str r0, [sp, #0xc]
	add r0, r6, #0
	add r2, r4, #0
	mov r3, #5
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5, #0x5c]
	mov r1, #0xa
	str r0, [sp, #0xc]
	add r0, r6, #0
	add r2, r4, #0
	mov r3, #5
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	add r0, r6, #0
	bl NARC_dtor
	mov r0, #5
	mov r1, #0
	bl ToggleBgLayer
	mov r0, #6
	mov r1, #0
	bl ToggleBgLayer
	mov r0, #1
	lsl r0, r0, #0x1a
	ldr r1, [r0]
	ldr r2, _02077194 ; =0xFFFF1FFF
	add r3, r1, #0
	and r3, r2
	lsr r1, r0, #0xd
	orr r1, r3
	ldr r3, _02077198 ; =0x04001000
	str r1, [r0]
	ldr r1, [r3]
	and r1, r2
	str r1, [r3]
	add r3, r0, #0
	add r3, #0x48
	ldrh r4, [r3]
	mov r1, #0x3f
	mov r2, #0x1f
	bic r4, r1
	orr r2, r4
	strh r2, [r3]
	add r0, #0x4a
	ldrh r2, [r0]
	bic r2, r1
	mov r1, #0x12
	orr r1, r2
	strh r1, [r0]
	add r0, r5, #0
	mov r1, #0
	add r0, #0x72
	strb r1, [r0]
	add r0, r5, #0
	add r0, #0x73
	strb r1, [r0]
	add r0, r5, #0
	mov r1, #0xff
	add r0, #0x74
	strb r1, [r0]
	add r0, r5, #0
	mov r1, #0xa0
	add r0, #0x75
	strb r1, [r0]
	bl GX_BothDispOn
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	ldr r0, _0207719C ; =sub_02077270
	add r1, r5, #0
	bl Main_SetVBlankIntrCB
	add sp, #0xf0
	pop {r4, r5, r6, pc}
	nop
_02077180: .word _020FFF34
_02077184: .word _020FFED8
_02077188: .word _020FFF90
_0207718C: .word 0x04000008
_02077190: .word _020FFFE4
_02077194: .word 0xFFFF1FFF
_02077198: .word 0x04001000
_0207719C: .word sub_02077270
	thumb_func_end sub_02076E64

	thumb_func_start sub_020771A0
sub_020771A0: ; 0x020771A0
	push {r4, lr}
	add r4, r0, #0
	mov r0, #1
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #2
	mov r1, #0
	bl GX_EngineAToggleLayers
	add r0, r4, #0
	mov r1, #1
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #2
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #3
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #4
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #5
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #6
	bl FreeBgTilemapBuffer
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020771A0

	thumb_func_start sub_020771E8
sub_020771E8: ; 0x020771E8
	push {r3, r4, r5, lr}
	sub sp, #0x20
	add r4, r0, #0
	ldr r1, [r4, #0x28]
	add r0, sp, #0x10
	mov r2, #2
	bl GetPokemonSpriteCharAndPlttNarcIds
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x18]
	add r1, sp, #0x10
	mov r2, #0x80
	mov r3, #0x50
	bl sub_020085EC
	str r0, [r4, #0x1c]
	ldr r0, [r4, #0x5c]
	bl AllocMonZeroed
	add r5, r0, #0
	ldr r0, [r4, #0x28]
	add r1, r5, #0
	bl CopyPokemonToPokemon
	add r2, r4, #0
	add r0, r5, #0
	mov r1, #5
	add r2, #0x62
	bl SetMonData
	add r0, r5, #0
	bl CalcMonLevelAndStats
	add r0, sp, #0x10
	add r1, r5, #0
	mov r2, #2
	bl GetPokemonSpriteCharAndPlttNarcIds
	add r0, r5, #0
	bl FreeToHeap
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x18]
	add r1, sp, #0x10
	mov r2, #0x80
	mov r3, #0x50
	bl sub_020085EC
	str r0, [r4, #0x20]
	mov r1, #0xc
	mov r2, #0
	bl sub_020087A4
	ldr r0, [r4, #0x20]
	mov r1, #0xd
	mov r2, #0
	bl sub_020087A4
	add sp, #0x20
	pop {r3, r4, r5, pc}
	thumb_func_end sub_020771E8

	thumb_func_start sub_02077270
sub_02077270: ; 0x02077270
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r0, #0x75
	ldrb r2, [r0]
	add r0, r4, #0
	add r0, #0x73
	ldrb r1, [r0]
	add r0, r4, #0
	add r0, #0x72
	ldrb r0, [r0]
	mov r3, #0xff
	lsl r3, r3, #8
	lsl r0, r0, #8
	add r5, r0, #0
	add r0, r4, #0
	add r0, #0x74
	lsl r1, r1, #8
	and r1, r3
	ldrb r0, [r0]
	and r5, r3
	orr r1, r2
	orr r5, r0
	ldr r0, _020772EC ; =0x04000040
	strh r5, [r0]
	strh r1, [r0, #4]
	ldr r0, [r4, #0x18]
	bl sub_02009418
	add r0, r4, #0
	add r0, #0xb8
	ldr r0, [r0]
	cmp r0, #0
	beq _020772CE
	add r0, r4, #0
	add r0, #0xb0
	ldr r0, [r0]
	cmp r0, #0
	bne _020772C0
	bl GF_AssertFail
_020772C0:
	add r0, r4, #0
	add r0, #0xb0
	ldr r0, [r0]
	bl sub_0200D020
	bl sub_0200D034
_020772CE:
	bl GF_RunVramTransferTasks
	ldr r0, [r4, #0x14]
	bl sub_0200398C
	ldr r0, [r4]
	bl BgConfig_HandleScheduledScrollAndTransferOps
	ldr r3, _020772F0 ; =OS_IRQTable
	ldr r1, _020772F4 ; =0x00003FF8
	mov r0, #1
	ldr r2, [r3, r1]
	orr r0, r2
	str r0, [r3, r1]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_020772EC: .word 0x04000040
_020772F0: .word OS_IRQTable
_020772F4: .word 0x00003FF8
	thumb_func_end sub_02077270

	thumb_func_start sub_020772F8
sub_020772F8: ; 0x020772F8
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldr r0, [r4, #8]
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r0, [r4, #0xc]
	ldr r1, [r4, #0x10]
	add r2, r5, #0
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl FreeToHeap
	ldr r0, [r4, #4]
	mov r1, #0xff
	bl FillWindowPixelBuffer
	ldr r0, [r4, #0x2c]
	bl Options_GetTextFrameDelay
	mov r3, #0
	str r3, [sp]
	str r0, [sp, #4]
	ldr r0, _0207733C ; =sub_02077340
	mov r1, #1
	str r0, [sp, #8]
	ldr r0, [r4, #4]
	ldr r2, [r4, #0x10]
	bl AddTextPrinterParameterized
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_0207733C: .word sub_02077340
	thumb_func_end sub_020772F8

	thumb_func_start sub_02077340
sub_02077340: ; 0x02077340
	push {r4, lr}
	mov r4, #0
	cmp r1, #5
	bhi _02077388
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02077354: ; jump table
	.short _02077388 - _02077354 - 2 ; case 0
	.short _02077360 - _02077354 - 2 ; case 1
	.short _02077368 - _02077354 - 2 ; case 2
	.short _02077370 - _02077354 - 2 ; case 3
	.short _02077378 - _02077354 - 2 ; case 4
	.short _02077380 - _02077354 - 2 ; case 5
_02077360:
	bl GF_IsAnySEPlaying
	add r4, r0, #0
	b _02077388
_02077368:
	bl IsFanfarePlaying
	add r4, r0, #0
	b _02077388
_02077370:
	ldr r0, _0207738C ; =0x000004A4
	bl PlayFanfare
	b _02077388
_02077378:
	ldr r0, _02077390 ; =0x000005E6
	bl PlaySE
	b _02077388
_02077380:
	mov r0, #0x4a
	lsl r0, r0, #4
	bl PlayFanfare
_02077388:
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
_0207738C: .word 0x000004A4
_02077390: .word 0x000005E6
	thumb_func_end sub_02077340

	thumb_func_start sub_02077394
sub_02077394: ; 0x02077394
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _020773A8 ; =_02103A1C
	ldr r1, [r4, #0x3c]
	ldr r2, [r4, #0x5c]
	bl OverlayManager_new
	str r0, [r4, #0x38]
	pop {r4, pc}
	nop
_020773A8: .word _02103A1C
	thumb_func_end sub_02077394
