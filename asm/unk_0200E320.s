	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start CreateSysTask
CreateSysTask: ; 0x0200E320
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _0200E338 ; =gSystem
	add r4, r1, #0
	add r3, r2, #0
	ldr r0, [r0, #0x18]
	add r1, r5, #0
	add r2, r4, #0
	bl sub_0201F8C0
	pop {r3, r4, r5, pc}
	nop
_0200E338: .word gSystem
	thumb_func_end CreateSysTask

	thumb_func_start sub_0200E33C
sub_0200E33C: ; 0x0200E33C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _0200E354 ; =gSystem
	add r4, r1, #0
	add r3, r2, #0
	ldr r0, [r0, #0x1c]
	add r1, r5, #0
	add r2, r4, #0
	bl sub_0201F8C0
	pop {r3, r4, r5, pc}
	nop
_0200E354: .word gSystem
	thumb_func_end sub_0200E33C

	thumb_func_start sub_0200E358
sub_0200E358: ; 0x0200E358
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _0200E370 ; =gSystem
	add r4, r1, #0
	add r3, r2, #0
	ldr r0, [r0, #0x24]
	add r1, r5, #0
	add r2, r4, #0
	bl sub_0201F8C0
	pop {r3, r4, r5, pc}
	nop
_0200E370: .word gSystem
	thumb_func_end sub_0200E358

	thumb_func_start sub_0200E374
sub_0200E374: ; 0x0200E374
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _0200E38C ; =gSystem
	add r4, r1, #0
	add r3, r2, #0
	ldr r0, [r0, #0x20]
	add r1, r5, #0
	add r2, r4, #0
	bl sub_0201F8C0
	pop {r3, r4, r5, pc}
	nop
_0200E38C: .word gSystem
	thumb_func_end sub_0200E374

	thumb_func_start DestroySysTask
DestroySysTask: ; 0x0200E390
	ldr r3, _0200E394 ; =sub_0201F954
	bx r3
	.balign 4, 0
_0200E394: .word sub_0201F954
	thumb_func_end DestroySysTask
