	.include "asm/macros.inc"
	.include "unk_020210A0.inc"
	.include "global.inc"

	.bss

_021D2198:
	.space 0x5C

	.text

	thumb_func_start GF_TouchpadInit
GF_TouchpadInit: ; 0x020210A0
	mov r0, #0
	ldr r3, _020210B8 ; =_021D2198
	add r1, r0, #0
	mov r2, #5
_020210A8:
	stmia r3!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _020210A8
	stmia r3!, {r0, r1}
	str r0, [r3]
	bx lr
	nop
_020210B8: .word _021D2198
	thumb_func_end GF_TouchpadInit

	thumb_func_start sub_020210BC
sub_020210BC: ; 0x020210BC
	push {r3, lr}
	ldr r0, _020210D4 ; =_021D2198 + 0x40
	ldrh r0, [r0, #0x18]
	cmp r0, #0
	beq _020210CA
	bl GF_AssertFail
_020210CA:
	ldr r0, _020210D4 ; =_021D2198 + 0x40
	mov r1, #0
	strh r1, [r0, #0x18]
	pop {r3, pc}
	nop
_020210D4: .word _021D2198 + 0x40
	thumb_func_end sub_020210BC

	thumb_func_start sub_020210D8
sub_020210D8: ; 0x020210D8
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, _02021144 ; =_021D2198 + 0x40
	add r6, r1, #0
	ldrh r1, [r0, #0x1a]
	add r4, r2, #0
	cmp r1, #0
	beq _02021104
	mov r0, #0
	str r0, [sp]
	lsl r0, r4, #1
	str r0, [sp, #4]
	mov r0, #1
	add r1, r0, #0
	add r2, r5, #0
	add r3, r6, #0
	bl sub_020211AC
	add sp, #8
	mov r0, #1
	pop {r4, r5, r6, pc}
_02021104:
	cmp r4, #5
	bhs _0202110C
	cmp r4, #0
	bne _02021112
_0202110C:
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_02021112:
	ldrh r0, [r0, #0x18]
	cmp r0, #0
	beq _0202111E
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_0202111E:
	add r0, r4, #0
	bl GF_TouchpadStartAutoSampling
	cmp r0, #1
	bne _0202113E
	mov r0, #0
	str r0, [sp]
	lsl r0, r4, #1
	str r0, [sp, #4]
	mov r0, #1
	add r1, r0, #0
	add r2, r5, #0
	add r3, r6, #0
	bl sub_020211AC
	mov r0, #1
_0202113E:
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_02021144: .word _021D2198 + 0x40
	thumb_func_end sub_020210D8

	thumb_func_start sub_02021148
sub_02021148: ; 0x02021148
	push {r4, lr}
	sub sp, #8
	ldr r1, _020211A8 ; =_021D2198 + 0x40
	add r4, r0, #0
	ldrh r2, [r1, #0x1a]
	cmp r2, #0
	beq _0202116E
	mov r2, #0
	str r2, [sp]
	lsl r0, r4, #1
	str r0, [sp, #4]
	mov r0, #2
	mov r1, #1
	add r3, r2, #0
	bl sub_020211AC
	add sp, #8
	mov r0, #1
	pop {r4, pc}
_0202116E:
	cmp r4, #5
	bhs _02021176
	cmp r4, #0
	bne _0202117C
_02021176:
	add sp, #8
	mov r0, #0
	pop {r4, pc}
_0202117C:
	ldrh r1, [r1, #0x18]
	cmp r1, #0
	beq _02021188
	add sp, #8
	mov r0, #0
	pop {r4, pc}
_02021188:
	bl GF_TouchpadStartAutoSampling
	cmp r0, #1
	bne _020211A4
	mov r2, #0
	str r2, [sp]
	lsl r0, r4, #1
	str r0, [sp, #4]
	mov r0, #2
	mov r1, #1
	add r3, r2, #0
	bl sub_020211AC
	mov r0, #1
_020211A4:
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
_020211A8: .word _021D2198 + 0x40
	thumb_func_end sub_02021148

	thumb_func_start sub_020211AC
sub_020211AC: ; 0x020211AC
	push {r4, lr}
	ldr r4, _020211D0 ; =_021D2198 + 0x40
	strh r0, [r4, #0x18]
	ldr r0, _020211D4 ; =gSystem + 0x60
	strb r1, [r0, #8]
	ldr r0, _020211D8 ; =_021D2198
	ldr r1, [sp, #0xc]
	str r2, [r0]
	str r3, [r0, #4]
	str r1, [r0, #8]
	ldr r1, [sp, #8]
	str r1, [r0, #0x54]
	ldr r0, _020211DC ; =_021D2198 + 0xC
	mov r1, #9
	bl sub_020211E0
	pop {r4, pc}
	nop
_020211D0: .word _021D2198 + 0x40
_020211D4: .word gSystem + 0x60
_020211D8: .word _021D2198
_020211DC: .word _021D2198 + 0xC
	thumb_func_end sub_020211AC

	thumb_func_start sub_020211E0
sub_020211E0: ; 0x020211E0
	mov r3, #0
	cmp r1, #0
	ble _020211F2
	add r2, r3, #0
_020211E8:
	add r3, r3, #1
	strh r2, [r0, #4]
	add r0, #8
	cmp r3, r1
	blt _020211E8
_020211F2:
	bx lr
	thumb_func_end sub_020211E0

	thumb_func_start GF_TouchpadStopAutoSampling
GF_TouchpadStopAutoSampling: ; 0x020211F4
	push {r4, r5, r6, lr}
	ldr r0, _02021234 ; =_021D2198 + 0x40
	mov r5, #0
	ldrh r0, [r0, #0x18]
	cmp r0, #0
	bne _02021204
	mov r0, #1
	pop {r4, r5, r6, pc}
_02021204:
	mov r4, #4
	add r6, r4, #0
_02021208:
	bl TP_RequestAutoSamplingStopAsync
	add r0, r4, #0
	bl TP_WaitBusy
	add r0, r6, #0
	bl TP_CheckBusy
	cmp r0, #0
	beq _0202121E
	add r5, r5, #1
_0202121E:
	cmp r0, #0
	beq _02021226
	cmp r5, #5
	bls _02021208
_02021226:
	cmp r5, #5
	bls _0202122E
	mov r0, #2
	pop {r4, r5, r6, pc}
_0202122E:
	mov r0, #1
	pop {r4, r5, r6, pc}
	nop
_02021234: .word _021D2198 + 0x40
	thumb_func_end GF_TouchpadStopAutoSampling

	thumb_func_start sub_02021238
sub_02021238: ; 0x02021238
	push {r4, lr}
	sub sp, #8
	ldr r0, _0202127C ; =_021D2198 + 0x40
	ldrh r0, [r0, #0x1a]
	cmp r0, #0
	beq _0202125A
	mov r0, #0
	str r0, [sp]
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	str r0, [sp, #4]
	bl sub_020211AC
	add sp, #8
	mov r0, #1
	pop {r4, pc}
_0202125A:
	bl GF_TouchpadStopAutoSampling
	add r4, r0, #0
	cmp r4, #1
	bne _02021274
	mov r0, #0
	str r0, [sp]
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	str r0, [sp, #4]
	bl sub_020211AC
_02021274:
	add r0, r4, #0
	add sp, #8
	pop {r4, pc}
	nop
_0202127C: .word _021D2198 + 0x40
	thumb_func_end sub_02021238

	thumb_func_start sub_02021280
sub_02021280: ; 0x02021280
	push {r3, r4, r5, r6, r7, lr}
	add r7, r2, #0
	ldr r2, _020212E4 ; =_021D2198 + 0x40
	add r4, r1, #0
	ldrh r3, [r2, #0x1a]
	add r5, r0, #0
	mov r1, #3
	cmp r3, #0
	beq _020212A6
	cmp r5, #0
	beq _0202129A
	bl sub_02021528
_0202129A:
	cmp r4, #2
	bne _020212A2
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_020212A2:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_020212A6:
	ldrh r0, [r2, #0x18]
	cmp r0, #0
	beq _020212DE
	bl TP_GetLatestIndexInAuto
	add r6, r0, #0
	ldr r0, _020212E8 ; =_021D2198 + 0xC
	mov r1, #9
	bl sub_020212EC
	cmp r5, #0
	beq _020212C6
	add r0, r5, #0
	add r1, r6, #0
	bl sub_02021540
_020212C6:
	ldr r0, _020212E4 ; =_021D2198 + 0x40
	ldrh r0, [r0, #0x18]
	cmp r0, #1
	bne _020212DC
	add r0, r4, #0
	add r1, r6, #0
	add r2, r7, #0
	bl sub_020213C8
	add r1, r0, #0
	b _020212DE
_020212DC:
	mov r1, #1
_020212DE:
	add r0, r1, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_020212E4: .word _021D2198 + 0x40
_020212E8: .word _021D2198 + 0xC
	thumb_func_end sub_02021280

	thumb_func_start sub_020212EC
sub_020212EC: ; 0x020212EC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r7, #0
	str r1, [sp]
	add r0, r1, #0
	beq _02021322
	add r4, r5, #0
	add r6, sp, #4
_020212FE:
	add r0, sp, #4
	add r1, r5, #0
	bl TP_GetCalibratedPoint
	ldrh r0, [r6]
	add r7, r7, #1
	add r5, #8
	strh r0, [r4]
	ldrh r0, [r6, #2]
	strh r0, [r4, #2]
	ldrh r0, [r6, #4]
	strh r0, [r4, #4]
	ldrh r0, [r6, #6]
	strh r0, [r4, #6]
	ldr r0, [sp]
	add r4, #8
	cmp r7, r0
	blo _020212FE
_02021322:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_020212EC

	thumb_func_start GF_TouchpadResumeOnLidOpen
GF_TouchpadResumeOnLidOpen: ; 0x02021328
	push {r3, lr}
	ldr r0, _02021354 ; =_021D2198 + 0x40
	ldrh r1, [r0, #0x1a]
	cmp r1, #0
	beq _02021350
	ldrh r0, [r0, #0x18]
	cmp r0, #0
	beq _02021350
	ldr r0, _02021358 ; =_021D2198
	ldr r0, [r0, #8]
	lsr r0, r0, #1
	bl GF_TouchpadStartAutoSampling
	cmp r0, #1
	beq _0202134A
	bl GF_AssertFail
_0202134A:
	ldr r0, _02021354 ; =_021D2198 + 0x40
	mov r1, #0
	strh r1, [r0, #0x1a]
_02021350:
	pop {r3, pc}
	nop
_02021354: .word _021D2198 + 0x40
_02021358: .word _021D2198
	thumb_func_end GF_TouchpadResumeOnLidOpen

	thumb_func_start GF_TouchpadPauseOnLidClose
GF_TouchpadPauseOnLidClose: ; 0x0202135C
	push {r3, lr}
	ldr r0, _02021380 ; =_021D2198 + 0x40
	ldrh r1, [r0, #0x1a]
	cmp r1, #1
	beq _0202137E
	ldrh r0, [r0, #0x18]
	cmp r0, #0
	beq _0202137E
	bl GF_TouchpadStopAutoSampling
	cmp r0, #1
	beq _02021378
	bl GF_AssertFail
_02021378:
	ldr r0, _02021380 ; =_021D2198 + 0x40
	mov r1, #1
	strh r1, [r0, #0x1a]
_0202137E:
	pop {r3, pc}
	.balign 4, 0
_02021380: .word _021D2198 + 0x40
	thumb_func_end GF_TouchpadPauseOnLidClose

	thumb_func_start GF_TouchpadStartAutoSampling
GF_TouchpadStartAutoSampling: ; 0x02021384
	push {r3, r4, r5, r6, r7, lr}
	mov r5, #0
	lsl r0, r0, #0x10
	ldr r7, _020213C4 ; =_021D2198 + 0xC
	add r6, r5, #0
	lsr r4, r0, #0x10
_02021390:
	add r0, r6, #0
	add r1, r4, #0
	add r2, r7, #0
	mov r3, #9
	bl TP_RequestAutoSamplingStartAsync
	mov r0, #2
	bl TP_WaitBusy
	mov r0, #2
	bl TP_CheckBusy
	cmp r0, #0
	beq _020213AE
	add r5, r5, #1
_020213AE:
	cmp r0, #0
	beq _020213B6
	cmp r5, #5
	ble _02021390
_020213B6:
	cmp r5, #5
	ble _020213BE
	mov r0, #2
	pop {r3, r4, r5, r6, r7, pc}
_020213BE:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	nop
_020213C4: .word _021D2198 + 0xC
	thumb_func_end GF_TouchpadStartAutoSampling

	thumb_func_start sub_020213C8
sub_020213C8: ; 0x020213C8
	push {r3, lr}
	cmp r0, #5
	bhi _020213F2
	add r3, r0, r0
	add r3, pc
	ldrh r3, [r3, #6]
	lsl r3, r3, #0x10
	asr r3, r3, #0x10
	add pc, r3
_020213DA: ; jump table
	.short _020213F2 - _020213DA - 2 ; case 0
	.short _020213E6 - _020213DA - 2 ; case 1
	.short _020213F2 - _020213DA - 2 ; case 2
	.short _020213E6 - _020213DA - 2 ; case 3
	.short _020213EC - _020213DA - 2 ; case 4
	.short _020213EC - _020213DA - 2 ; case 5
_020213E6:
	bl sub_020213F8
	pop {r3, pc}
_020213EC:
	bl sub_020214B0
	pop {r3, pc}
_020213F2:
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_020213C8

	thumb_func_start sub_020213F8
sub_020213F8: ; 0x020213F8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r5, _020214A8 ; =_021D2198
	str r1, [sp, #4]
	ldr r1, [r5, #8]
	str r0, [sp]
	add r7, r2, #0
	mov r4, #0
	cmp r1, #0
	bls _0202149E
_0202140C:
	ldr r0, [sp, #4]
	sub r0, r0, r1
	add r0, r4, r0
	add r0, r0, #1
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	bpl _02021420
	add r0, #9
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
_02021420:
	lsl r1, r0, #3
	ldr r0, _020214AC ; =_021D2198
	add r1, r0, r1
	ldrh r0, [r1, #0x10]
	cmp r0, #1
	bne _02021496
	ldrh r0, [r1, #0x12]
	cmp r0, #0
	bne _02021496
	ldr r2, [r5, #0x54]
	ldr r0, [r5]
	lsl r2, r2, #3
	add r2, r0, r2
	add r0, r2, #0
	sub r0, #8
	ldrh r3, [r1, #0xc]
	ldrh r0, [r0]
	cmp r0, r3
	blt _0202144A
	sub r3, r0, r3
	b _0202144C
_0202144A:
	sub r3, r3, r0
_0202144C:
	sub r6, r2, #6
	ldrh r0, [r1, #0xe]
	ldrh r6, [r6]
	cmp r6, r0
	blt _0202145A
	sub r0, r6, r0
	b _0202145C
_0202145A:
	sub r0, r0, r6
_0202145C:
	cmp r3, r7
	bhs _02021464
	cmp r0, r7
	blo _02021496
_02021464:
	ldrh r0, [r1, #0xc]
	strh r0, [r2]
	ldrh r0, [r1, #0xe]
	strh r0, [r2, #2]
	ldrh r0, [r1, #0x10]
	strh r0, [r2, #4]
	ldrh r0, [r1, #0x12]
	strh r0, [r2, #6]
	ldr r0, [r5, #0x54]
	add r0, r0, #1
	str r0, [r5, #0x54]
	ldr r1, [r5, #4]
	cmp r0, r1
	blo _02021496
	ldr r2, [sp]
	cmp r2, #1
	bne _0202148E
	bl _u32_div_f
	str r1, [r5, #0x54]
	b _02021496
_0202148E:
	mov r0, #0
	add sp, #8
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02021496:
	ldr r1, [r5, #8]
	add r4, r4, #1
	cmp r4, r1
	blo _0202140C
_0202149E:
	ldr r0, _020214A8 ; =_021D2198
	ldr r0, [r0, #0x54]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_020214A8: .word _021D2198
_020214AC: .word _021D2198
	thumb_func_end sub_020213F8

	thumb_func_start sub_020214B0
sub_020214B0: ; 0x020214B0
	push {r3, r4, r5, r6, r7, lr}
	ldr r5, _02021520 ; =_021D2198
	str r1, [sp]
	ldr r1, [r5, #8]
	add r7, r0, #0
	mov r4, #0
	cmp r1, #0
	bls _02021518
_020214C0:
	ldr r0, [sp]
	sub r0, r0, r1
	add r0, r4, r0
	add r0, r0, #1
	lsl r0, r0, #0x10
	asr r1, r0, #0x10
	bpl _020214D4
	add r1, #9
	lsl r0, r1, #0x10
	asr r1, r0, #0x10
_020214D4:
	ldr r0, [r5, #0x54]
	lsl r1, r1, #3
	lsl r3, r0, #3
	ldr r0, _02021524 ; =_021D2198
	ldr r6, [r5]
	add r2, r0, r1
	ldrh r0, [r2, #0xc]
	add r1, r6, r3
	strh r0, [r6, r3]
	ldrh r0, [r2, #0xe]
	strh r0, [r1, #2]
	ldrh r0, [r2, #0x10]
	strh r0, [r1, #4]
	ldrh r0, [r2, #0x12]
	strh r0, [r1, #6]
	ldr r0, [r5, #0x54]
	add r0, r0, #1
	str r0, [r5, #0x54]
	ldr r1, [r5, #4]
	cmp r0, r1
	blo _02021510
	cmp r7, #4
	bne _0202150A
	bl _u32_div_f
	str r1, [r5, #0x54]
	b _02021510
_0202150A:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02021510:
	ldr r1, [r5, #8]
	add r4, r4, #1
	cmp r4, r1
	blo _020214C0
_02021518:
	ldr r0, _02021520 ; =_021D2198
	ldr r0, [r0, #0x54]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02021520: .word _021D2198
_02021524: .word _021D2198
	thumb_func_end sub_020214B0

	thumb_func_start sub_02021528
sub_02021528: ; 0x02021528
	mov r2, #0
	strh r2, [r0]
	add r1, r2, #0
_0202152E:
	strh r1, [r0, #8]
	strh r1, [r0, #6]
	strh r1, [r0, #2]
	strh r1, [r0, #4]
	add r2, r2, #1
	add r0, #8
	cmp r2, #8
	blt _0202152E
	bx lr
	thumb_func_end sub_02021528

	thumb_func_start sub_02021540
sub_02021540: ; 0x02021540
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_02021528
	ldr r0, _02021598 ; =_021D2198
	mov r6, #0
	ldr r1, [r0, #8]
	cmp r1, #0
	bls _02021596
	ldr r2, _0202159C ; =_021D2198
_02021556:
	sub r1, r4, r1
	add r1, r6, r1
	add r1, r1, #1
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	bpl _02021568
	add r1, #9
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
_02021568:
	lsl r1, r1, #3
	add r3, r2, r1
	ldrh r1, [r3, #0x12]
	cmp r1, #0
	bne _0202158E
	ldrh r1, [r5]
	ldrh r7, [r3, #0xc]
	lsl r1, r1, #3
	add r1, r5, r1
	strh r7, [r1, #2]
	ldrh r7, [r3, #0xe]
	strh r7, [r1, #4]
	ldrh r7, [r3, #0x10]
	strh r7, [r1, #6]
	ldrh r3, [r3, #0x12]
	strh r3, [r1, #8]
	ldrh r1, [r5]
	add r1, r1, #1
	strh r1, [r5]
_0202158E:
	ldr r1, [r0, #8]
	add r6, r6, #1
	cmp r6, r1
	blo _02021556
_02021596:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02021598: .word _021D2198
_0202159C: .word _021D2198
	thumb_func_end sub_02021540
