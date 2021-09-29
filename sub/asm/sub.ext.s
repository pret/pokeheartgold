	.include "asm/macros.inc"
	.include "global.inc"

	.text

	arm_func_start WVR_ShelterExtWram
WVR_ShelterExtWram: ; 0x027E0000
	stmdb sp!, {r4, r5, r6, lr}
	ldr r6, _027E00A4 ; =0x023801B0
	ldr r2, _027E00A8 ; =0x023A76B4
	ldr r0, _027E00AC ; =0x023A76D8
	b _027E0094
_027E0014:
	ldmia r2, {r1, r4, r5}
	cmp r1, #0x6000000
	add r2, r2, #0xc
	bne _027E0090
	ldr r1, _027E00B0 ; =0x027E00BC
	ldr r0, _027E00B4 ; =0x03809884
	add r3, r4, r5
	str r1, [r0, #4]
	ldr r2, _027E00B8 ; =0x027F9EF0
	add r1, r1, r3
	str r3, [r0, #0xc]
	cmp r2, r1
	beq _027E004C
	bl OS_Terminate
_027E004C:
	ldr r0, _027E00B4 ; =0x03809884
	mov r1, #0
	ldr r2, [r0, #4]
	b _027E0068
_027E005C:
	ldr r0, [r6], #4
	add r1, r1, #1
	str r0, [r2], #4
_027E0068:
	cmp r1, r4, lsr #2
	blo _027E005C
	mov r1, #0
	mov r0, r1
	b _027E0084
_027E007C:
	str r0, [r2], #4
	add r1, r1, #1
_027E0084:
	cmp r1, r5, lsr #2
	blo _027E007C
	b _027E009C
_027E0090:
	add r6, r6, r4
_027E0094:
	cmp r2, r0
	bne _027E0014
_027E009C:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_027E00A4: .word 0x023801B0
_027E00A8: .word 0x023A76B4
_027E00AC: .word 0x023A76D8
_027E00B0: .word 0x027E00BC
_027E00B4: .word 0x03809884
_027E00B8: .word 0x027F9EF0
; SDK_AUTOLOAD_ext_TEXT_END
