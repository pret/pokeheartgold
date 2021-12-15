	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_020270C4
sub_020270C4: ; 0x020270C4
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x17
	bl SaveSubstruct_AssertCRC
	add r0, r4, #0
	mov r1, #0x17
	bl SavArray_get
	pop {r4, pc}
	thumb_func_end sub_020270C4

	thumb_func_start GetStoragePCPointer
GetStoragePCPointer: ; 0x020270D8
	ldr r3, _020270E0 ; =SavArray_get
	mov r1, #0x29
	bx r3
	nop
_020270E0: .word SavArray_get
	thumb_func_end GetStoragePCPointer

	thumb_func_start sub_020270E4
sub_020270E4: ; 0x020270E4
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x1b
	bl SaveSubstruct_AssertCRC
	add r0, r4, #0
	mov r1, #0x1b
	bl SavArray_get
	pop {r4, pc}
	thumb_func_end sub_020270E4

	thumb_func_start sub_020270F8
sub_020270F8: ; 0x020270F8
	ldr r3, _02027100 ; =SavArray_get
	mov r1, #0x1c
	bx r3
	nop
_02027100: .word SavArray_get
	thumb_func_end sub_020270F8

	thumb_func_start LoadHallOfFame
LoadHallOfFame: ; 0x02027104
	push {r3, lr}
	add r3, r2, #0
	mov r2, #0
	bl ReadSaveFileFromFlash
	pop {r3, pc}
	thumb_func_end LoadHallOfFame

	thumb_func_start SaveHallOfFame
SaveHallOfFame: ; 0x02027110
	ldr r3, _02027118 ; =WriteSaveFileToFlash
	add r2, r1, #0
	mov r1, #0
	bx r3
	.balign 4, 0
_02027118: .word WriteSaveFileToFlash
	thumb_func_end SaveHallOfFame

	thumb_func_start sub_0202711C
sub_0202711C: ; 0x0202711C
	push {r4, lr}
	sub sp, #8
	add r4, r2, #0
	add r2, sp, #4
	str r2, [sp]
	add r2, r3, #2
	add r3, r4, #0
	bl sub_020284A4
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0202711C

	thumb_func_start sub_02027134
sub_02027134: ; 0x02027134
	add r3, r1, #0
	add r1, r2, #2
	add r2, r3, #0
	ldr r3, _02027140 ; =sub_02028230
	bx r3
	nop
_02027140: .word sub_02028230
	thumb_func_end sub_02027134

	thumb_func_start sub_02027144
sub_02027144: ; 0x02027144
	push {r3, lr}
	sub sp, #8
	add r3, r2, #0
	add r2, sp, #4
	str r2, [sp]
	mov r2, #1
	bl sub_020284A4
	add sp, #8
	pop {r3, pc}
	thumb_func_end sub_02027144

	thumb_func_start sub_02027158
sub_02027158: ; 0x02027158
	ldr r3, _02027160 ; =sub_02028230
	add r2, r1, #0
	mov r1, #1
	bx r3
	.balign 4, 0
_02027160: .word sub_02028230
	thumb_func_end sub_02027158

	thumb_func_start sub_02027164
sub_02027164: ; 0x02027164
	ldr r3, _02027168 ; =sub_02074120
	bx r3
	.balign 4, 0
_02027168: .word sub_02074120
	thumb_func_end sub_02027164

	thumb_func_start sub_0202716C
sub_0202716C: ; 0x0202716C
	mov r0, #0x12
	bx lr
	thumb_func_end sub_0202716C

	thumb_func_start sub_02027170
sub_02027170: ; 0x02027170
	push {r3, lr}
	mov r1, #0x29
	bl SavArray_get
	bl PCStorage_GetBoxModifiedFlags
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02027170

	thumb_func_start sub_02027180
sub_02027180: ; 0x02027180
	push {r3, lr}
	mov r1, #0x29
	bl SavArray_get
	bl PCStorage_ResetBoxModifiedFlags
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02027180

	thumb_func_start sub_02027190
sub_02027190: ; 0x02027190
	push {r3, lr}
	mov r1, #0x29
	bl SavArray_get
	bl PCStorage_SetAllBoxesModified
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02027190

	thumb_func_start sub_020271A0
sub_020271A0: ; 0x020271A0
	push {r3, lr}
	mov r1, #0x29
	bl SavArray_get
	bl sub_02074128
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_020271A0
