	.include "asm/macros.inc"
	.include "overlay_80_02235390.inc"
	.include "global.inc"

    .text

	thumb_func_start ov80_02235390
ov80_02235390: ; 0x02235390
	push {r3, lr}
	bl ov80_0222BE10
	bl PlaySE
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_02235390

	thumb_func_start ov80_022353A0
ov80_022353A0: ; 0x022353A0
	push {r3, lr}
	bl ov80_0222BE10
	mov r1, #0
	bl StopSE
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ov80_022353A0

	thumb_func_start ov80_022353B0
ov80_022353B0: ; 0x022353B0
	push {r4, lr}
	add r4, r0, #0
	bl ov80_0222BE10
	add r1, r4, #0
	add r1, #0x78
	strh r0, [r1]
	ldr r1, _022353CC ; =ov80_022353D0
	add r0, r4, #0
	bl ov80_0222AB84
	mov r0, #1
	pop {r4, pc}
	nop
_022353CC: .word ov80_022353D0
	thumb_func_end ov80_022353B0

	thumb_func_start ov80_022353D0
ov80_022353D0: ; 0x022353D0
	push {r3, lr}
	add r0, #0x78
	ldrh r0, [r0]
	bl IsSEPlaying
	cmp r0, #0
	bne _022353E2
	mov r0, #1
	pop {r3, pc}
_022353E2:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_022353D0

	thumb_func_start ov80_022353E8
ov80_022353E8: ; 0x022353E8
	push {r3, lr}
	bl ov80_0222AC58
	bl PlayFanfare
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_022353E8

	thumb_func_start ov80_022353F8
ov80_022353F8: ; 0x022353F8
	push {r3, lr}
	ldr r1, _02235404 ; =ov80_02235408
	bl ov80_0222AB84
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
_02235404: .word ov80_02235408
	thumb_func_end ov80_022353F8

	thumb_func_start ov80_02235408
ov80_02235408: ; 0x02235408
	push {r3, lr}
	bl IsFanfarePlaying
	cmp r0, #0
	bne _02235416
	mov r0, #1
	pop {r3, pc}
_02235416:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_02235408

	thumb_func_start ov80_0223541C
ov80_0223541C: ; 0x0223541C
	push {r4, lr}
	bl ov80_0222AC58
	add r4, r0, #0
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
	bl sub_02004AC8
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
	bl PlayBGM
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov80_0223541C
