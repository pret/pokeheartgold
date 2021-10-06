	.include "asm/macros.inc"
	.include "global.inc"

	.public SDK_AUTOLOAD_START
	.public SDK_AUTOLOAD_LIST
	.public SDK_AUTOLOAD_LIST_END
	.public SDK_AUTOLOAD_WRAM_SIZE
	.public SDK_AUTOLOAD_WRAM_BSS_SIZE
	.public SDK_AUTOLOAD_MAIN_BSS_END
	.public SDK_SUBPRIV_ARENA_LO

	; Temporary until ARM7 bss is defined
	.public WVR_BSS_START
	.set o_wvrStatus,                  0x0
	.set o_wvrVramImageBuf,            0x4
	.set o_wvrHeapHandle,              0x8
	.set o_wvrVramImageBufSize,        0xC
	.set o_wvrThread,                 0x10
	.set o_wvrWlStaElement,           0xB4
	.set o_wvrThreadStack,           0x274
	.set o_wvrWlStack,               0x674
	.set o_wvrWlWork,                0xC74

	.text

	arm_func_start WVR_ShelterExtWram
WVR_ShelterExtWram: ; 0x027E0000
	stmdb sp!, {r4, r5, r6, lr}
	ldr r6, _027E00A4 ; =SDK_AUTOLOAD_START
	ldr r2, _027E00A8 ; =SDK_AUTOLOAD_LIST
	ldr r0, _027E00AC ; =SDK_AUTOLOAD_LIST_END
	b _027E0094
_027E0014:
	ldmia r2, {r1, r4, r5}
	cmp r1, #0x6000000
	add r2, r2, #0xc
	bne _027E0090
	ldr r1, _027E00B0 ; =SDK_AUTOLOAD_MAIN_BSS_END
	ldr r0, _027E00B4 ; =WVR_BSS_START
	add r3, r4, r5
	str r1, [r0, #o_wvrVramImageBuf]
	ldr r2, _027E00B8 ; =SDK_SUBPRIV_ARENA_LO
	add r1, r1, r3
	str r3, [r0, #o_wvrVramImageBufSize]
	cmp r2, r1
	beq _027E004C
	bl OS_Terminate
_027E004C:
	ldr r0, _027E00B4 ; =WVR_BSS_START
	mov r1, #0
	ldr r2, [r0, #o_wvrVramImageBuf]
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
_027E00A4: .word SDK_AUTOLOAD_START
_027E00A8: .word SDK_AUTOLOAD_LIST
_027E00AC: .word SDK_AUTOLOAD_LIST_END
_027E00B0: .word SDK_AUTOLOAD_MAIN_BSS_END
_027E00B4: .word WVR_BSS_START
_027E00B8: .word SDK_SUBPRIV_ARENA_LO

	.section .wram,4,1,5

