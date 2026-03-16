	.include "asm/macros.inc"
	.include "overlay_80_02235390.inc"
	.include "global.inc"

    .text

	thumb_func_start FrtCmd_085
FrtCmd_085: ; 0x02235390
	push {r3, lr}
	bl FrontierScript_ReadVar
	bl PlaySE
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end FrtCmd_085

	thumb_func_start FrtCmd_086
FrtCmd_086: ; 0x022353A0
	push {r3, lr}
	bl FrontierScript_ReadVar
	mov r1, #0
	bl StopSE
	mov r0, #0
	pop {r3, pc}
	thumb_func_end FrtCmd_086

	thumb_func_start FrtCmd_087
FrtCmd_087: ; 0x022353B0
	push {r4, lr}
	add r4, r0, #0
	bl FrontierScript_ReadVar
	add r1, r4, #0
	add r1, #0x78
	strh r0, [r1]
	ldr r1, _022353CC ; =ov80_022353D0
	add r0, r4, #0
	bl FrontierScriptContext_Pause
	mov r0, #1
	pop {r4, pc}
	nop
_022353CC: .word ov80_022353D0
	thumb_func_end FrtCmd_087

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

	thumb_func_start FrtCmd_088
FrtCmd_088: ; 0x022353E8
	push {r3, lr}
	bl FrontierScriptContext_ReadHalfWord
	bl PlayFanfare
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end FrtCmd_088

	thumb_func_start FrtCmd_089
FrtCmd_089: ; 0x022353F8
	push {r3, lr}
	ldr r1, _02235404 ; =ov80_02235408
	bl FrontierScriptContext_Pause
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
_02235404: .word ov80_02235408
	thumb_func_end FrtCmd_089

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

	thumb_func_start FrtCmd_090
FrtCmd_090: ; 0x0223541C
	push {r4, lr}
	bl FrontierScriptContext_ReadHalfWord
	add r4, r0, #0
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
	bl sub_02004AC8
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
	bl PlayBGM
	mov r0, #0
	pop {r4, pc}
	thumb_func_end FrtCmd_090
