	.include "asm/macros.inc"
	.include "unk_0202C034.inc"
	.include "global.inc"

	.bss

_021D2230:
	.space 0x8C0

	.text

	thumb_func_start sub_0202C034
sub_0202C034: ; 0x0202C034
	mov r0, #0x23
	lsl r0, r0, #6
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202C034

	thumb_func_start sub_0202C03C
sub_0202C03C: ; 0x0202C03C
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	mov r2, #0x23
	mov r0, #0
	add r1, r7, #0
	lsl r2, r2, #6
	bl MIi_CpuClearFast
	mov r0, #0x1d
	lsl r0, r0, #4
	add r1, r0, #0
	add r2, r0, #0
	ldr r4, _0202C084 ; =0x0000FFFF
	mov r5, #0
	add r6, r7, #0
	mov r3, #2
	sub r1, #0x10
	add r2, #0x1e
_0202C060:
	strh r4, [r6, r0]
	strh r4, [r6, r1]
	strb r3, [r6, r2]
	add r5, r5, #1
	add r6, #0x38
	cmp r5, #0x20
	blt _0202C060
	add r0, r7, #0
	bl sub_0203A01C
	mov r2, #0x23
	ldr r1, _0202C088 ; =_021D2230
	add r0, r7, #0
	lsl r2, r2, #6
	bl MI_CpuCopy8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0202C084: .word 0x0000FFFF
_0202C088: .word _021D2230
	thumb_func_end sub_0202C03C

	thumb_func_start sub_0202C08C
sub_0202C08C: ; 0x0202C08C
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202C08C

	thumb_func_start sub_0202C090
sub_0202C090: ; 0x0202C090
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r7, r2, #0
	cmp r4, #0x20
	blt _0202C0A0
	bl GF_AssertFail
_0202C0A0:
	cmp r7, #0xc
	bhi _0202C170
	add r0, r7, r7
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0202C0B0: ; jump table
	.short _0202C0CA - _0202C0B0 - 2 ; case 0
	.short _0202C0D8 - _0202C0B0 - 2 ; case 1
	.short _0202C0E6 - _0202C0B0 - 2 ; case 2
	.short _0202C0F2 - _0202C0B0 - 2 ; case 3
	.short _0202C100 - _0202C0B0 - 2 ; case 4
	.short _0202C10C - _0202C0B0 - 2 ; case 5
	.short _0202C11A - _0202C0B0 - 2 ; case 6
	.short _0202C132 - _0202C0B0 - 2 ; case 7
	.short _0202C126 - _0202C0B0 - 2 ; case 8
	.short _0202C13E - _0202C0B0 - 2 ; case 9
	.short _0202C14C - _0202C0B0 - 2 ; case 10
	.short _0202C158 - _0202C0B0 - 2 ; case 11
	.short _0202C166 - _0202C0B0 - 2 ; case 12
_0202C0CA:
	mov r0, #0x38
	mul r0, r4
	add r1, r5, r0
	mov r0, #0x1e
	lsl r0, r0, #4
	ldr r6, [r1, r0]
	b _0202C170
_0202C0D8:
	mov r0, #0x38
	mul r0, r4
	add r1, r5, r0
	mov r0, #0x79
	lsl r0, r0, #2
	ldrh r6, [r1, r0]
	b _0202C170
_0202C0E6:
	mov r0, #0x38
	mul r0, r4
	add r1, r5, r0
	ldr r0, _0202C174 ; =0x000001E6
	ldrh r6, [r1, r0]
	b _0202C170
_0202C0F2:
	mov r0, #0x38
	mul r0, r4
	add r1, r5, r0
	mov r0, #0x7a
	lsl r0, r0, #2
	ldrh r6, [r1, r0]
	b _0202C170
_0202C100:
	mov r0, #0x38
	mul r0, r4
	add r1, r5, r0
	ldr r0, _0202C178 ; =0x000001EA
	ldrh r6, [r1, r0]
	b _0202C170
_0202C10C:
	mov r0, #0x38
	mul r0, r4
	add r1, r5, r0
	mov r0, #0x7b
	lsl r0, r0, #2
	ldrb r6, [r1, r0]
	b _0202C170
_0202C11A:
	mov r0, #0x38
	mul r0, r4
	add r1, r5, r0
	ldr r0, _0202C17C ; =0x000001ED
	ldrb r6, [r1, r0]
	b _0202C170
_0202C126:
	mov r0, #0x38
	mul r0, r4
	add r1, r5, r0
	ldr r0, _0202C180 ; =0x000001EE
	ldrb r6, [r1, r0]
	b _0202C170
_0202C132:
	mov r0, #0x38
	mul r0, r4
	add r1, r5, r0
	ldr r0, _0202C184 ; =0x000001EF
	ldrb r6, [r1, r0]
	b _0202C170
_0202C13E:
	mov r0, #0x38
	mul r0, r4
	add r1, r5, r0
	mov r0, #0x1f
	lsl r0, r0, #4
	ldrh r6, [r1, r0]
	b _0202C170
_0202C14C:
	mov r0, #0x38
	mul r0, r4
	add r1, r5, r0
	ldr r0, _0202C188 ; =0x000001F2
	ldrh r6, [r1, r0]
	b _0202C170
_0202C158:
	mov r0, #0x38
	mul r0, r4
	add r1, r5, r0
	mov r0, #0x7d
	lsl r0, r0, #2
	ldrh r6, [r1, r0]
	b _0202C170
_0202C166:
	mov r0, #0x38
	mul r0, r4
	add r1, r5, r0
	ldr r0, _0202C18C ; =0x000001F6
	ldrh r6, [r1, r0]
_0202C170:
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0202C174: .word 0x000001E6
_0202C178: .word 0x000001EA
_0202C17C: .word 0x000001ED
_0202C180: .word 0x000001EE
_0202C184: .word 0x000001EF
_0202C188: .word 0x000001F2
_0202C18C: .word 0x000001F6
	thumb_func_end sub_0202C090

	thumb_func_start sub_0202C190
sub_0202C190: ; 0x0202C190
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r7, r2, #0
	add r6, r3, #0
	cmp r4, #0x20
	blt _0202C1A2
	bl GF_AssertFail
_0202C1A2:
	cmp r7, #9
	bhi _0202C228
	add r0, r7, r7
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0202C1B2: ; jump table
	.short _0202C1C6 - _0202C1B2 - 2 ; case 0
	.short _0202C1D4 - _0202C1B2 - 2 ; case 1
	.short _0202C1DA - _0202C1B2 - 2 ; case 2
	.short _0202C1E0 - _0202C1B2 - 2 ; case 3
	.short _0202C1E6 - _0202C1B2 - 2 ; case 4
	.short _0202C1F2 - _0202C1B2 - 2 ; case 5
	.short _0202C200 - _0202C1B2 - 2 ; case 6
	.short _0202C218 - _0202C1B2 - 2 ; case 7
	.short _0202C20C - _0202C1B2 - 2 ; case 8
	.short _0202C224 - _0202C1B2 - 2 ; case 9
_0202C1C6:
	mov r0, #0x38
	mul r0, r4
	add r1, r5, r0
	mov r0, #0x1e
	lsl r0, r0, #4
	str r6, [r1, r0]
	pop {r3, r4, r5, r6, r7, pc}
_0202C1D4:
	bl GF_AssertFail
	pop {r3, r4, r5, r6, r7, pc}
_0202C1DA:
	bl GF_AssertFail
	pop {r3, r4, r5, r6, r7, pc}
_0202C1E0:
	bl GF_AssertFail
	pop {r3, r4, r5, r6, r7, pc}
_0202C1E6:
	mov r0, #0x38
	mul r0, r4
	add r1, r5, r0
	ldr r0, _0202C22C ; =0x000001EA
	strh r6, [r1, r0]
	pop {r3, r4, r5, r6, r7, pc}
_0202C1F2:
	mov r0, #0x38
	mul r0, r4
	add r1, r5, r0
	mov r0, #0x7b
	lsl r0, r0, #2
	strb r6, [r1, r0]
	pop {r3, r4, r5, r6, r7, pc}
_0202C200:
	mov r0, #0x38
	mul r0, r4
	add r1, r5, r0
	ldr r0, _0202C230 ; =0x000001ED
	strb r6, [r1, r0]
	pop {r3, r4, r5, r6, r7, pc}
_0202C20C:
	mov r0, #0x38
	mul r0, r4
	add r1, r5, r0
	ldr r0, _0202C234 ; =0x000001EE
	strb r6, [r1, r0]
	pop {r3, r4, r5, r6, r7, pc}
_0202C218:
	mov r0, #0x38
	mul r0, r4
	add r1, r5, r0
	ldr r0, _0202C238 ; =0x000001EF
	strb r6, [r1, r0]
	pop {r3, r4, r5, r6, r7, pc}
_0202C224:
	bl GF_AssertFail
_0202C228:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0202C22C: .word 0x000001EA
_0202C230: .word 0x000001ED
_0202C234: .word 0x000001EE
_0202C238: .word 0x000001EF
	thumb_func_end sub_0202C190

	thumb_func_start sub_0202C23C
sub_0202C23C: ; 0x0202C23C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #0x20
	blt _0202C24A
	bl GF_AssertFail
_0202C24A:
	mov r0, #0xc
	add r5, #0x40
	mul r0, r4
	add r0, r5, r0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0202C23C

	thumb_func_start sub_0202C254
sub_0202C254: ; 0x0202C254
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #0x20
	blt _0202C262
	bl GF_AssertFail
_0202C262:
	mov r0, #0x1d
	lsl r0, r0, #4
	add r1, r5, r0
	mov r0, #0x38
	mul r0, r4
	add r0, r1, r0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0202C254

	thumb_func_start sub_0202C270
sub_0202C270: ; 0x0202C270
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r6, r2, #0
	cmp r4, #0x20
	blt _0202C280
	bl GF_AssertFail
_0202C280:
	mov r1, #0x1d
	lsl r1, r1, #4
	add r2, r5, r1
	mov r1, #0x38
	mul r1, r4
	add r1, r2, r1
	add r0, r6, #0
	mov r2, #0x10
	bl CopyStringToU16Array
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0202C270

	thumb_func_start sub_0202C298
sub_0202C298: ; 0x0202C298
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #0x20
	blt _0202C2A6
	bl GF_AssertFail
_0202C2A6:
	mov r0, #7
	lsl r0, r0, #6
	add r1, r5, r0
	mov r0, #0x38
	mul r0, r4
	add r0, r1, r0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0202C298

	thumb_func_start sub_0202C2B4
sub_0202C2B4: ; 0x0202C2B4
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r6, r2, #0
	cmp r4, #0x20
	blt _0202C2C4
	bl GF_AssertFail
_0202C2C4:
	mov r1, #7
	lsl r1, r1, #6
	add r2, r5, r1
	mov r1, #0x38
	mul r1, r4
	add r1, r2, r1
	add r0, r6, #0
	mov r2, #0x10
	bl CopyStringToU16Array
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0202C2B4

	thumb_func_start sub_0202C2DC
sub_0202C2DC: ; 0x0202C2DC
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #0x20
	blt _0202C2EA
	bl GF_AssertFail
_0202C2EA:
	mov r0, #0xc
	add r5, #0x40
	mul r0, r4
	add r0, r5, r0
	bl DWC_IsValidFriendData
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0202C2DC

	thumb_func_start sub_0202C2F8
sub_0202C2F8: ; 0x0202C2F8
	push {r4, r5, r6, lr}
	mov r5, #0
	add r6, r0, #0
	add r4, r5, #0
_0202C300:
	add r0, r6, #0
	add r1, r4, #0
	bl sub_0202C2DC
	cmp r0, #0
	beq _0202C30E
	add r5, r5, #1
_0202C30E:
	add r4, r4, #1
	cmp r4, #0x20
	blt _0202C300
	add r0, r5, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0202C2F8

	thumb_func_start sub_0202C318
sub_0202C318: ; 0x0202C318
	push {r4, r5, r6, lr}
	mov r6, #0
	add r5, r0, #0
	add r4, r6, #0
_0202C320:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0202C2DC
	cmp r0, #0
	beq _0202C32E
	add r6, r4, #1
_0202C32E:
	add r4, r4, #1
	cmp r4, #0x20
	blt _0202C320
	add r0, r6, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0202C318

	thumb_func_start sub_0202C338
sub_0202C338: ; 0x0202C338
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp]
	add r5, r1, #0
	bmi _0202C3D8
	cmp r5, #0x20
	bge _0202C3D8
	cmp r5, #0x1f
	bge _0202C39E
	mov r1, #7
	lsl r1, r1, #6
	add r0, r0, r1
	str r0, [sp, #4]
	mov r0, #0x38
	add r1, r5, #0
	mul r1, r0
	ldr r0, [sp, #4]
	add r6, r0, r1
	ldr r0, [sp]
	add r1, r5, #0
	str r0, [sp, #8]
	add r0, #0x40
	str r0, [sp, #8]
	mov r0, #0xc
	mul r1, r0
	ldr r0, [sp, #8]
	add r4, r0, r1
_0202C36E:
	add r7, r5, #1
	mov r0, #0x38
	add r1, r7, #0
	mul r1, r0
	ldr r0, [sp, #4]
	mov r2, #0x38
	add r0, r0, r1
	add r1, r6, #0
	bl MI_CpuCopy8
	mov r0, #0xc
	add r1, r7, #0
	mul r1, r0
	ldr r0, [sp, #8]
	mov r2, #0xc
	add r0, r0, r1
	add r1, r4, #0
	bl MI_CpuCopy8
	add r5, r5, #1
	add r6, #0x38
	add r4, #0xc
	cmp r5, #0x1f
	blt _0202C36E
_0202C39E:
	mov r2, #7
	ldr r1, [sp]
	lsl r2, r2, #6
	add r2, r1, r2
	ldr r1, _0202C3DC ; =0x000006C8
	mov r0, #0
	add r1, r2, r1
	mov r2, #0x38
	bl MIi_CpuClearFast
	ldr r2, [sp]
	mov r1, #0x5d
	add r2, #0x40
	lsl r1, r1, #2
	add r1, r2, r1
	mov r0, #0
	mov r2, #0xc
	bl MIi_CpuClearFast
	ldr r2, _0202C3E0 ; =0x00000898
	ldr r3, _0202C3E4 ; =0x0000FFFF
	ldr r0, [sp]
	add r1, r2, #0
	strh r3, [r0, r2]
	sub r1, #0x10
	strh r3, [r0, r1]
	mov r1, #2
	add r2, #0x1e
	strb r1, [r0, r2]
_0202C3D8:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0202C3DC: .word 0x000006C8
_0202C3E0: .word 0x00000898
_0202C3E4: .word 0x0000FFFF
	thumb_func_end sub_0202C338

	thumb_func_start sub_0202C3E8
sub_0202C3E8: ; 0x0202C3E8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r1, #0
	add r6, r2, #0
	str r0, [sp]
	cmp r5, #0
	blt _0202C462
	cmp r5, #0x20
	bge _0202C462
	cmp r6, #0
	blt _0202C462
	cmp r6, #0x20
	bge _0202C462
	mov r2, #0x38
	lsl r1, r2, #3
	add r0, r0, r1
	str r0, [sp, #4]
	add r4, r6, #0
	add r3, r5, #0
	mul r4, r2
	ldr r1, [sp, #4]
	mul r3, r2
	add r0, r0, r4
	add r1, r1, r3
	bl MI_CpuCopy8
	ldr r7, [sp]
	mov r2, #0xc
	add r0, r6, #0
	add r1, r5, #0
	mul r0, r2
	add r7, #0x40
	mul r1, r2
	str r0, [sp, #8]
	add r0, r7, r0
	add r1, r7, r1
	bl MI_CpuCopy8
	ldr r1, [sp, #4]
	mov r0, #0
	add r1, r1, r4
	mov r2, #0x38
	bl MIi_CpuClearFast
	ldr r1, [sp, #8]
	mov r0, #0
	add r1, r7, r1
	mov r2, #0xc
	bl MIi_CpuClearFast
	ldr r0, [sp]
	mov r1, #0x1d
	add r2, r0, r4
	ldr r3, _0202C468 ; =0x0000FFFF
	lsl r1, r1, #4
	strh r3, [r2, r1]
	ldr r0, [sp, #4]
	add r1, #0x1e
	strh r3, [r0, r4]
	mov r0, #2
	strb r0, [r2, r1]
_0202C462:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0202C468: .word 0x0000FFFF
	thumb_func_end sub_0202C3E8

	thumb_func_start sub_0202C46C
sub_0202C46C: ; 0x0202C46C
	push {r3, r4, r5, r6, r7, lr}
	mov r5, #0
	mvn r5, r5
	add r6, r0, #0
	mov r4, #0
	add r7, r5, #0
_0202C478:
	add r0, r6, #0
	add r1, r4, #0
	bl sub_0202C2DC
	cmp r0, #0
	beq _0202C49C
	mov r0, #0
	mvn r0, r0
	cmp r5, r0
	beq _0202C4A6
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	bl sub_0202C3E8
	add r4, r7, #0
	add r5, r7, #0
	b _0202C4A6
_0202C49C:
	mov r0, #0
	mvn r0, r0
	cmp r5, r0
	bne _0202C4A6
	add r5, r4, #0
_0202C4A6:
	add r4, r4, #1
	cmp r4, #0x20
	blt _0202C478
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0202C46C

	thumb_func_start sub_0202C4B0
sub_0202C4B0: ; 0x0202C4B0
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r0, sp, #0
	add r4, r1, #0
	bl GF_RTC_CopyDate
	cmp r4, #0
	blt _0202C4E6
	cmp r4, #0x20
	bge _0202C4E6
	mov r0, #0x38
	add r2, r4, #0
	mul r2, r0
	mov r0, #0x7d
	ldr r1, [sp]
	lsl r0, r0, #4
	add r1, r1, r0
	ldr r0, _0202C4EC ; =0x000001EA
	add r3, r5, r2
	strh r1, [r3, r0]
	add r1, r0, #2
	ldr r2, [sp, #4]
	add r0, r0, #3
	strb r2, [r3, r1]
	ldr r1, [sp, #8]
	strb r1, [r3, r0]
_0202C4E6:
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_0202C4EC: .word 0x000001EA
	thumb_func_end sub_0202C4B0

	thumb_func_start sub_0202C4F0
sub_0202C4F0: ; 0x0202C4F0
	push {r4, r5, r6, lr}
	add r4, r0, #0
	cmp r1, #0
	blt _0202C548
	cmp r1, #0x20
	bge _0202C548
	mov r5, #0x79
	mov r0, #0x38
	lsl r5, r5, #2
	mul r0, r1
	add r5, r4, r5
	ldrh r6, [r5, r0]
	add r2, r6, r2
	strh r2, [r5, r0]
	ldrh r6, [r5, r0]
	ldr r2, _0202C54C ; =0x0000270F
	cmp r6, r2
	bls _0202C516
	strh r2, [r5, r0]
_0202C516:
	ldr r2, _0202C550 ; =0x000001E6
	add r2, r4, r2
	ldrh r5, [r2, r0]
	add r3, r5, r3
	strh r3, [r2, r0]
	ldrh r5, [r2, r0]
	ldr r3, _0202C54C ; =0x0000270F
	cmp r5, r3
	bls _0202C52A
	strh r3, [r2, r0]
_0202C52A:
	mov r2, #0x7a
	lsl r2, r2, #2
	add r2, r4, r2
	ldrh r5, [r2, r0]
	ldr r3, [sp, #0x10]
	add r3, r5, r3
	strh r3, [r2, r0]
	ldrh r5, [r2, r0]
	ldr r3, _0202C54C ; =0x0000270F
	cmp r5, r3
	bls _0202C542
	strh r3, [r2, r0]
_0202C542:
	add r0, r4, #0
	bl sub_0202C4B0
_0202C548:
	pop {r4, r5, r6, pc}
	nop
_0202C54C: .word 0x0000270F
_0202C550: .word 0x000001E6
	thumb_func_end sub_0202C4F0

	thumb_func_start sub_0202C554
sub_0202C554: ; 0x0202C554
	push {r3, r4, r5, lr}
	cmp r1, #0
	blt _0202C57A
	cmp r1, #0x20
	bge _0202C57A
	ldr r3, _0202C57C ; =0x000001F2
	add r4, r0, r3
	mov r3, #0x38
	mul r3, r1
	ldrh r5, [r4, r3]
	add r2, r5, r2
	strh r2, [r4, r3]
	ldrh r5, [r4, r3]
	ldr r2, _0202C580 ; =0x0000270F
	cmp r5, r2
	bls _0202C576
	strh r2, [r4, r3]
_0202C576:
	bl sub_0202C4B0
_0202C57A:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0202C57C: .word 0x000001F2
_0202C580: .word 0x0000270F
	thumb_func_end sub_0202C554

	thumb_func_start sub_0202C584
sub_0202C584: ; 0x0202C584
	push {r3, r4, r5, lr}
	cmp r1, #0
	blt _0202C5AC
	cmp r1, #0x20
	bge _0202C5AC
	mov r3, #0x7d
	lsl r3, r3, #2
	add r4, r0, r3
	mov r3, #0x38
	mul r3, r1
	ldrh r5, [r4, r3]
	add r2, r5, r2
	strh r2, [r4, r3]
	ldrh r5, [r4, r3]
	ldr r2, _0202C5B0 ; =0x0000270F
	cmp r5, r2
	bls _0202C5A8
	strh r2, [r4, r3]
_0202C5A8:
	bl sub_0202C4B0
_0202C5AC:
	pop {r3, r4, r5, pc}
	nop
_0202C5B0: .word 0x0000270F
	thumb_func_end sub_0202C584

	thumb_func_start sub_0202C5B4
sub_0202C5B4: ; 0x0202C5B4
	push {r3, r4, r5, lr}
	cmp r1, #0
	blt _0202C5DA
	cmp r1, #0x20
	bge _0202C5DA
	ldr r3, _0202C5DC ; =0x000001F6
	add r4, r0, r3
	mov r3, #0x38
	mul r3, r1
	ldrh r5, [r4, r3]
	add r2, r5, r2
	strh r2, [r4, r3]
	ldrh r5, [r4, r3]
	ldr r2, _0202C5E0 ; =0x0000270F
	cmp r5, r2
	bls _0202C5D6
	strh r2, [r4, r3]
_0202C5D6:
	bl sub_0202C4B0
_0202C5DA:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0202C5DC: .word 0x000001F6
_0202C5E0: .word 0x0000270F
	thumb_func_end sub_0202C5B4

	thumb_func_start sub_0202C5E4
sub_0202C5E4: ; 0x0202C5E4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	cmp r2, #0
	blt _0202C6DE
	cmp r2, #0x20
	bge _0202C6DE
	cmp r1, #0
	blt _0202C6DE
	cmp r1, #0x20
	bge _0202C6DE
	add r4, r1, #0
	mov r0, #0x38
	mov r3, #0x79
	mul r4, r0
	add r1, r2, #0
	lsl r3, r3, #2
	mul r1, r0
	add r2, r5, r3
	add r6, r5, r4
	ldrh r0, [r2, r1]
	ldrh r3, [r6, r3]
	add r0, r0, r3
	strh r0, [r2, r1]
	ldrh r3, [r2, r1]
	ldr r0, _0202C6E0 ; =0x0000270F
	cmp r3, r0
	bls _0202C61C
	strh r0, [r2, r1]
_0202C61C:
	ldr r3, _0202C6E4 ; =0x000001E6
	add r6, r5, r4
	add r2, r5, r3
	ldrh r0, [r2, r1]
	ldrh r3, [r6, r3]
	add r0, r0, r3
	strh r0, [r2, r1]
	ldrh r3, [r2, r1]
	ldr r0, _0202C6E0 ; =0x0000270F
	cmp r3, r0
	bls _0202C634
	strh r0, [r2, r1]
_0202C634:
	mov r3, #0x7a
	lsl r3, r3, #2
	add r2, r5, r3
	add r6, r5, r4
	ldrh r0, [r2, r1]
	ldrh r3, [r6, r3]
	add r0, r0, r3
	strh r0, [r2, r1]
	ldrh r3, [r2, r1]
	ldr r0, _0202C6E0 ; =0x0000270F
	cmp r3, r0
	bls _0202C64E
	strh r0, [r2, r1]
_0202C64E:
	mov r3, #0x1f
	lsl r3, r3, #4
	add r2, r5, r3
	add r6, r5, r4
	ldrh r0, [r2, r1]
	ldrh r3, [r6, r3]
	add r0, r0, r3
	strh r0, [r2, r1]
	ldrh r3, [r2, r1]
	ldr r0, _0202C6E0 ; =0x0000270F
	cmp r3, r0
	bls _0202C668
	strh r0, [r2, r1]
_0202C668:
	ldr r3, _0202C6E8 ; =0x000001F2
	add r6, r5, r4
	add r2, r5, r3
	ldrh r0, [r2, r1]
	ldrh r3, [r6, r3]
	add r0, r0, r3
	strh r0, [r2, r1]
	ldrh r3, [r2, r1]
	ldr r0, _0202C6E0 ; =0x0000270F
	cmp r3, r0
	bls _0202C680
	strh r0, [r2, r1]
_0202C680:
	mov r3, #0x7d
	lsl r3, r3, #2
	add r2, r5, r3
	add r6, r5, r4
	ldrh r0, [r2, r1]
	ldrh r3, [r6, r3]
	add r0, r0, r3
	strh r0, [r2, r1]
	ldrh r3, [r2, r1]
	ldr r0, _0202C6E0 ; =0x0000270F
	cmp r3, r0
	bls _0202C69A
	strh r0, [r2, r1]
_0202C69A:
	ldr r3, _0202C6EC ; =0x000001F6
	add r6, r5, r4
	add r2, r5, r3
	ldrh r0, [r2, r1]
	ldrh r3, [r6, r3]
	add r0, r0, r3
	strh r0, [r2, r1]
	ldrh r3, [r2, r1]
	ldr r0, _0202C6E0 ; =0x0000270F
	cmp r3, r0
	bls _0202C6B2
	strh r0, [r2, r1]
_0202C6B2:
	mov r0, #7
	lsl r0, r0, #6
	add r6, r5, r0
	add r0, r6, r4
	add r1, r6, r1
	mov r2, #0x10
	bl MIi_CpuCopyFast
	mov r0, #0
	add r1, r6, r4
	mov r2, #0x38
	bl MIi_CpuClearFast
	mov r0, #0x1d
	ldr r1, _0202C6F0 ; =0x0000FFFF
	add r2, r5, r4
	lsl r0, r0, #4
	strh r1, [r2, r0]
	strh r1, [r6, r4]
	mov r1, #2
	add r0, #0x1e
	strb r1, [r2, r0]
_0202C6DE:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0202C6E0: .word 0x0000270F
_0202C6E4: .word 0x000001E6
_0202C6E8: .word 0x000001F2
_0202C6EC: .word 0x000001F6
_0202C6F0: .word 0x0000FFFF
	thumb_func_end sub_0202C5E4

	thumb_func_start sub_0202C6F4
sub_0202C6F4: ; 0x0202C6F4
	ldr r0, _0202C6F8 ; =_021D2230
	bx lr
	.balign 4, 0
_0202C6F8: .word _021D2230
	thumb_func_end sub_0202C6F4

	thumb_func_start sub_0202C6FC
sub_0202C6FC: ; 0x0202C6FC
	push {r3, lr}
	mov r1, #0x19
	bl SaveArray_Get
	mov r2, #0x23
	ldr r1, _0202C710 ; =_021D2230
	lsl r2, r2, #6
	bl MI_CpuCopy8
	pop {r3, pc}
	.balign 4, 0
_0202C710: .word _021D2230
	thumb_func_end sub_0202C6FC

	thumb_func_start sub_0202C714
sub_0202C714: ; 0x0202C714
	push {r3, lr}
	mov r1, #0x19
	bl SaveArray_Get
	add r1, r0, #0
	mov r2, #0x23
	ldr r0, _0202C72C ; =_021D2230
	lsl r2, r2, #6
	bl MI_CpuCopy8
	pop {r3, pc}
	nop
_0202C72C: .word _021D2230
	thumb_func_end sub_0202C714
