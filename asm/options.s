	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start Options_new
Options_new: ; 0x0202AC88
	push {r4, lr}
	mov r1, #2
	bl AllocFromHeap
	add r4, r0, #0
	bl Options_init
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end Options_new

	thumb_func_start Options_copy
Options_copy: ; 0x0202AC9C
	ldr r3, _0202ACA4 ; =MI_CpuCopy8
	mov r2, #2
	bx r3
	nop
_0202ACA4: .word MI_CpuCopy8
	thumb_func_end Options_copy

	thumb_func_start Options_init
Options_init: ; 0x0202ACA8
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0
	mov r2, #2
	bl MI_CpuFill8
	ldrh r1, [r4]
	mov r0, #0xf
	bic r1, r0
	mov r0, #1
	orr r0, r1
	strh r0, [r4]
	ldrh r1, [r4]
	mov r0, #0x30
	bic r1, r0
	strh r1, [r4]
	ldrh r1, [r4]
	mov r0, #0x40
	bic r1, r0
	strh r1, [r4]
	ldrh r1, [r4]
	mov r0, #0x80
	bic r1, r0
	strh r1, [r4]
	ldrh r1, [r4]
	ldr r0, _0202ACEC ; =0xFFFFFCFF
	and r0, r1
	strh r0, [r4]
	ldrh r1, [r4]
	ldr r0, _0202ACF0 ; =0xFFFF83FF
	and r0, r1
	strh r0, [r4]
	pop {r4, pc}
	nop
_0202ACEC: .word 0xFFFFFCFF
_0202ACF0: .word 0xFFFF83FF
	thumb_func_end Options_init

	thumb_func_start Options_SetButtonModeOnMain
Options_SetButtonModeOnMain: ; 0x0202ACF4
	push {r3, lr}
	cmp r0, #0
	beq _0202AD04
	bl Sav2_PlayerData_GetOptionsAddr
	bl Options_GetButtonMode
	add r1, r0, #0
_0202AD04:
	cmp r1, #0
	beq _0202AD14
	cmp r1, #1
	bne _0202AD14
	ldr r0, _0202AD1C ; =gMain
	mov r1, #3
	str r1, [r0, #0x34]
	pop {r3, pc}
_0202AD14:
	ldr r0, _0202AD1C ; =gMain
	mov r1, #0
	str r1, [r0, #0x34]
	pop {r3, pc}
	.balign 4, 0
_0202AD1C: .word gMain
	thumb_func_end Options_SetButtonModeOnMain

	thumb_func_start Options_GetTextSpeed
Options_GetTextSpeed: ; 0x0202AD20
	ldrh r0, [r0]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1c
	bx lr
	thumb_func_end Options_GetTextSpeed

	thumb_func_start Options_SetTextSpeed
Options_SetTextSpeed: ; 0x0202AD28
	ldrh r3, [r0]
	mov r2, #0xf
	lsl r1, r1, #0x10
	bic r3, r2
	lsr r2, r1, #0x10
	mov r1, #0xf
	and r1, r2
	orr r1, r3
	strh r1, [r0]
	bx lr
	thumb_func_end Options_SetTextSpeed

	thumb_func_start Options_GetTextFrameDelay
Options_GetTextFrameDelay: ; 0x0202AD3C
	push {r3, lr}
	bl Options_GetTextSpeed
	cmp r0, #0
	bne _0202AD4A
	mov r0, #8
	pop {r3, pc}
_0202AD4A:
	cmp r0, #1
	bne _0202AD52
	mov r0, #4
	pop {r3, pc}
_0202AD52:
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end Options_GetTextFrameDelay

	thumb_func_start Options_GetSoundMethod
Options_GetSoundMethod: ; 0x0202AD58
	ldrh r0, [r0]
	lsl r0, r0, #0x1a
	lsr r0, r0, #0x1e
	bx lr
	thumb_func_end Options_GetSoundMethod

	thumb_func_start Options_SetSoundMethod
Options_SetSoundMethod: ; 0x0202AD60
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	lsl r1, r1, #0x1e
	ldrh r3, [r0]
	mov r2, #0x30
	lsr r1, r1, #0x1a
	bic r3, r2
	orr r1, r3
	strh r1, [r0]
	bx lr
	thumb_func_end Options_SetSoundMethod

	thumb_func_start Options_GetBattleScene
Options_GetBattleScene: ; 0x0202AD74
	ldrh r0, [r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1f
	bx lr
	thumb_func_end Options_GetBattleScene

	thumb_func_start Options_SetBattleScene
Options_SetBattleScene: ; 0x0202AD7C
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	lsl r1, r1, #0x1f
	ldrh r3, [r0]
	mov r2, #0x80
	lsr r1, r1, #0x18
	bic r3, r2
	orr r1, r3
	strh r1, [r0]
	bx lr
	thumb_func_end Options_SetBattleScene

	thumb_func_start Options_GetBattleStyle
Options_GetBattleStyle: ; 0x0202AD90
	ldrh r0, [r0]
	lsl r0, r0, #0x19
	lsr r0, r0, #0x1f
	bx lr
	thumb_func_end Options_GetBattleStyle

	thumb_func_start Options_SetBattleStyle
Options_SetBattleStyle: ; 0x0202AD98
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	lsl r1, r1, #0x1f
	ldrh r3, [r0]
	mov r2, #0x40
	lsr r1, r1, #0x19
	bic r3, r2
	orr r1, r3
	strh r1, [r0]
	bx lr
	thumb_func_end Options_SetBattleStyle

	thumb_func_start Options_GetButtonMode
Options_GetButtonMode: ; 0x0202ADAC
	ldrh r0, [r0]
	lsl r0, r0, #0x16
	lsr r0, r0, #0x1e
	bx lr
	thumb_func_end Options_GetButtonMode

	thumb_func_start Options_SetButtonMode
Options_SetButtonMode: ; 0x0202ADB4
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	lsl r1, r1, #0x1e
	ldrh r3, [r0]
	ldr r2, _0202ADC8 ; =0xFFFFFCFF
	lsr r1, r1, #0x16
	and r2, r3
	orr r1, r2
	strh r1, [r0]
	bx lr
	.balign 4, 0
_0202ADC8: .word 0xFFFFFCFF
	thumb_func_end Options_SetButtonMode

	thumb_func_start Options_GetFrame
Options_GetFrame: ; 0x0202ADCC
	ldrh r0, [r0]
	lsl r0, r0, #0x11
	lsr r0, r0, #0x1b
	bx lr
	thumb_func_end Options_GetFrame

	thumb_func_start Options_SetFrame
Options_SetFrame: ; 0x0202ADD4
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	lsl r1, r1, #0x1b
	ldrh r3, [r0]
	ldr r2, _0202ADE8 ; =0xFFFF83FF
	lsr r1, r1, #0x11
	and r2, r3
	orr r1, r2
	strh r1, [r0]
	bx lr
	.balign 4, 0
_0202ADE8: .word 0xFFFF83FF
	thumb_func_end Options_SetFrame
