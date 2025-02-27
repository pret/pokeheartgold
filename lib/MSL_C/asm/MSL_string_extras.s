	.include "asm/macros.inc"
	.include "MSL_string_extras.inc"
	.include "global.inc"

	.text

	arm_func_start stricmp
stricmp: ; 0x020F0368
	stmdb sp!, {r3, lr}
	ldr r3, _020F03CC ; =__lower_mapC
_020F0370:
	ldrb r2, [r0], #1
	cmp r2, #0
	blt _020F0388
	cmp r2, #0x80
	bge _020F0388
	ldrb r2, [r3, r2]
_020F0388:
	ldrb lr, [r1], #1
	and ip, r2, #0xff
	cmp lr, #0
	blt _020F03A4
	cmp lr, #0x80
	bge _020F03A4
	ldrb lr, [r3, lr]
_020F03A4:
	and r2, lr, #0xff
	cmp ip, r2
	mvnlo r0, #0
	ldmloia sp!, {r3, pc}
	movhi r0, #1
	ldmhiia sp!, {r3, pc}
	cmp ip, #0
	bne _020F0370
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_020F03CC: .word __lower_mapC
	arm_func_end stricmp

	arm_func_start strnicmp
strnicmp: ; 0x020F03D0
	ldr ip, _020F03D8 ; =stricmp
	bx ip
	.align 2, 0
_020F03D8: .word stricmp
	arm_func_end strnicmp
