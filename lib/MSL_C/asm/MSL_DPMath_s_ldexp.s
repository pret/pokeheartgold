	.include "asm/macros.inc"
	.include "MSL_DPMath_s_ldexp.inc"
	.include "global.inc"

	.text

	arm_func_start ldexp
ldexp: ; 0x020EEB80
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, lr}
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	mov r4, r2
	bl __fpclassifyd
	cmp r0, #2
	ble _020EEBB8
	mov r0, #0
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	mov r1, r0
	bl _deq
	bne _020EEBCC
_020EEBB8:
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
_020EEBCC:
	ldr r3, [sp, #0xc]
	ldr r0, _020EEDA0 ; =0x7FF00000
	ldr r1, [sp, #8]
	and r0, r3, r0
	movs ip, r0, asr #0x14
	bne _020EEC58
	bic r0, r3, #0x80000000
	orrs r0, r1, r0
	ldreq r0, [sp, #8]
	ldreq r1, [sp, #0xc]
	ldmeqia sp!, {r4, lr}
	addeq sp, sp, #0x10
	bxeq lr
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	ldr r3, _020EEDA4 ; =0x43500000
	mov r2, #0
	bl _dmul
	mov r3, r1
	ldr r1, _020EEDA0 ; =0x7FF00000
	ldr ip, _020EEDA8 ; =0xFFFF3CB0
	and r1, r3, r1
	mov r2, r0
	mov r0, r1, asr #0x14
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	cmp r4, ip
	sub ip, r0, #0x36
	bge _020EEC58
	ldr r0, _020EEDAC ; =0xC2F8F359
	ldr r1, _020EEDB0 ; =0x01A56E1F
	bl _dmul
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
_020EEC58:
	ldr r0, _020EEDB4 ; =0x000007FF
	cmp ip, r0
	bne _020EEC84
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	mov r2, r0
	mov r3, r1
	bl _dadd
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
_020EEC84:
	add r2, ip, r4
	sub r0, r0, #1
	cmp r2, r0
	ble _020EECC8
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	ldr r0, _020EEDB8 ; =0x8800759C
	ldr r1, _020EEDBC ; =0x7E37E43C
	bl copysign
	mov r2, r0
	mov r3, r1
	ldr r0, _020EEDB8 ; =0x8800759C
	ldr r1, _020EEDBC ; =0x7E37E43C
	bl _dmul
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
_020EECC8:
	cmp r2, #0
	ble _020EECF0
	ldr r1, _020EEDC0 ; =0x800FFFFF
	ldr r0, [sp, #8]
	and r1, r3, r1
	orr r1, r1, r2, lsl #20
	str r1, [sp, #0xc]
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
_020EECF0:
	mvn r0, #0x35
	cmp r2, r0
	bgt _020EED70
	ldr r0, _020EEDC4 ; =0x0000C350
	cmp r4, r0
	ble _020EED3C
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	ldr r0, _020EEDB8 ; =0x8800759C
	ldr r1, _020EEDBC ; =0x7E37E43C
	bl copysign
	mov r2, r0
	mov r3, r1
	ldr r0, _020EEDB8 ; =0x8800759C
	ldr r1, _020EEDBC ; =0x7E37E43C
	bl _dmul
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
_020EED3C:
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	ldr r0, _020EEDAC ; =0xC2F8F359
	ldr r1, _020EEDB0 ; =0x01A56E1F
	bl copysign
	mov r2, r0
	mov r3, r1
	ldr r0, _020EEDAC ; =0xC2F8F359
	ldr r1, _020EEDB0 ; =0x01A56E1F
	bl _dmul
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
_020EED70:
	ldr r0, _020EEDC0 ; =0x800FFFFF
	add r1, r2, #0x36
	and r0, r3, r0
	orr r3, r0, r1, lsl #20
	ldr r2, [sp, #8]
	ldr r1, _020EEDC8 ; =0x3C900000
	mov r0, #0
	str r3, [sp, #0xc]
	bl _dmul
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_020EEDA0: .word 0x7FF00000
_020EEDA4: .word 0x43500000
_020EEDA8: .word 0xFFFF3CB0
_020EEDAC: .word 0xC2F8F359
_020EEDB0: .word 0x01A56E1F
_020EEDB4: .word 0x000007FF
_020EEDB8: .word 0x8800759C
_020EEDBC: .word 0x7E37E43C
_020EEDC0: .word 0x800FFFFF
_020EEDC4: .word 0x0000C350
_020EEDC8: .word 0x3C900000
	arm_func_end ldexp

	exception ldexp, 0x024D, 0x00300120
