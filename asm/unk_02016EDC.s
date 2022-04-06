	.include "asm/macros.inc"
	.include "global.inc"

	.rodata

_020F61BC:
	.word sub_02017D20
_020F61C0:
	.word 0x00000006
_020F61C4:
	.word 0x00000001
	.word sub_02017DD8, 0x00000006, 0x00000001
	.word sub_02017E98, 0x00000004, 0x00000000
	.word sub_02017ED4, 0x00000003, 0x00000000
	.word sub_02017F10, 0x00000004, 0x00000000
_020F61F8:
	.word sub_020174A4
	.word sub_020174B4
	.word sub_020174BC
	.word sub_020175EC
	.word sub_020176CC
	.word sub_02017504
	.word sub_0201752C
	.word sub_02017550
	.word sub_02017578
	.word sub_0201759C
	.word sub_020175C4
	.word sub_020176F0
	.word sub_02017714
	.word sub_02017730
	.word sub_0201775C
	.word sub_02017788
	.word sub_02017808
	.word sub_0201783C
	.word sub_02017874
	.word sub_020178BC
	.word sub_0201790C
	.word sub_020179D4
	.word sub_02017A1C
	.word sub_02017A84
	.word sub_02017B48
	.word sub_02017B54
	.word sub_02017B8C
	.word sub_02017B98
	.word sub_02017BA4
	.word sub_02017BB0
	.word sub_02017BBC
	.word sub_02017AD8
	.word sub_02017AEC
	.word sub_02017B2C

	.text

	thumb_func_start sub_02016EDC
sub_02016EDC: ; 0x02016EDC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	mov r1, #0xc
	add r6, r0, #0
	add r7, r2, #0
	bl AllocFromHeap
	add r4, r0, #0
	strb r7, [r4, #8]
	mov r0, #0x1d
	strb r5, [r4, #9]
	lsl r0, r0, #4
	add r7, r5, #0
	mul r7, r0
	add r0, r6, #0
	add r1, r7, #0
	str r6, [r4, #4]
	bl AllocFromHeap
	mov r1, #0
	add r2, r7, #0
	str r0, [r4]
	bl MI_CpuFill8
	mov r3, #0
	cmp r5, #0
	ble _02016F28
	mov r0, #0x1d
	add r6, r3, #0
	mov r2, #1
	lsl r0, r0, #4
_02016F1A:
	ldr r1, [r4]
	add r3, r3, #1
	add r1, r1, r6
	str r2, [r1, #0x20]
	add r6, r6, r0
	cmp r3, r5
	blt _02016F1A
_02016F28:
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02016EDC

	thumb_func_start sub_02016F2C
sub_02016F2C: ; 0x02016F2C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl FreeToHeap
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02016F2C

	thumb_func_start sub_02016F40
sub_02016F40: ; 0x02016F40
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	str r3, [sp, #4]
	add r0, r2, #0
	ldrh r6, [r0]
	ldrh r0, [r0, #2]
	add r7, r1, #0
	ldrb r1, [r5, #9]
	str r0, [sp, #8]
	ldr r0, [sp, #4]
	str r2, [sp]
	cmp r0, r1
	blo _02016F60
	bl GF_AssertFail
_02016F60:
	ldr r0, [sp, #4]
	mov r1, #0x1d
	add r4, r0, #0
	lsl r1, r1, #4
	ldr r0, [r5]
	mul r4, r1
	add r0, r0, r4
	ldr r0, [r0, #0x10]
	cmp r0, #0
	beq _02016F78
	bl GF_AssertFail
_02016F78:
	ldr r0, [r5]
	mov r2, #0x1d
	add r0, r0, r4
	mov r1, #0
	lsl r2, r2, #4
	bl MI_CpuFill8
	ldr r0, [r5]
	mov r1, #1
	add r0, r0, r4
	str r1, [r0, #0x10]
	ldr r0, [r5]
	cmp r6, #0x8f
	str r7, [r0, r4]
	blt _02016F9A
	mov r6, #0
	str r6, [sp, #8]
_02016F9A:
	ldr r0, [r5]
	add r0, r0, r4
	str r6, [r0, #0x14]
	ldrb r0, [r5, #8]
	cmp r0, #0
	beq _02016FAC
	ldr r0, [sp]
	ldrb r2, [r0, #4]
	b _02016FAE
_02016FAC:
	mov r2, #0
_02016FAE:
	ldr r0, [r5]
	add r1, r0, r4
	mov r0, #0x73
	lsl r0, r0, #2
	strb r2, [r1, r0]
	ldr r1, [r5]
	ldr r2, [r5, #4]
	add r1, r1, r4
	ldr r1, [r1, #0x14]
	mov r0, #0x5a
	bl AllocAtEndAndReadWholeNarcMemberByIdPair
	ldr r1, [r5]
	mov r2, #0
	add r1, r1, r4
	str r0, [r1, #8]
	ldr r0, [r5]
	mov r6, #0x1c
	add r1, r0, r4
	ldr r0, [r1, #8]
	str r0, [r1, #0xc]
	ldr r0, [r5]
	add r0, r0, r4
	str r2, [r0, #0x1c]
	ldr r0, [r5]
	add r0, r0, r4
	str r2, [r0, #0x20]
	ldr r0, [r5]
	add r1, r0, r4
	ldr r0, _02017060 ; =0x000001CD
	strb r2, [r1, r0]
	ldr r1, [r5]
	add r3, r1, r4
	add r1, r0, #1
	strb r6, [r3, r1]
	ldr r1, [r5]
	add r0, r0, #2
	add r1, r1, r4
	strb r2, [r1, r0]
	ldr r1, [r5]
	ldr r0, _02017064 ; =sub_020170C4
	add r1, r1, r4
	bl CreateSysTask
	ldr r1, [r5]
	add r1, r1, r4
	str r0, [r1, #4]
	ldr r0, [r5]
	add r1, r0, r4
	ldr r0, [sp, #8]
	str r0, [r1, #0x54]
	add r0, r7, #0
	mov r1, #0
	bl sub_02008A78
	ldr r1, [r5]
	add r1, r1, r4
	str r0, [r1, #0x58]
	add r0, r7, #0
	mov r1, #1
	bl sub_02008A78
	ldr r1, [r5]
	add r1, r1, r4
	str r0, [r1, #0x5c]
	ldr r1, [r5]
	mov r0, #0
	add r1, r1, r4
	str r0, [r1, #0x60]
	ldr r1, [r5]
	add r1, r1, r4
	str r0, [r1, #0x64]
	ldr r1, [r5]
	add r1, r1, r4
	str r0, [r1, #0x68]
	ldr r1, [r5]
	add r1, r1, r4
	str r0, [r1, #0x6c]
	ldr r1, [r5]
	add r1, r1, r4
	str r0, [r1, #0x70]
	ldr r1, [r5]
	add r1, r1, r4
	str r0, [r1, #0x74]
	ldr r1, [r5]
	add r1, r1, r4
	str r0, [r1, #0x78]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02017060: .word 0x000001CD
_02017064: .word sub_020170C4
	thumb_func_end sub_02016F40

	thumb_func_start sub_02017068
sub_02017068: ; 0x02017068
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldrb r0, [r5, #9]
	add r4, r1, #0
	cmp r4, r0
	blo _02017078
	bl GF_AssertFail
_02017078:
	mov r0, #0x1d
	lsl r0, r0, #4
	ldr r1, [r5]
	mul r0, r4
	add r0, r1, r0
	ldr r0, [r0, #0x20]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02017068

	thumb_func_start sub_02017088
sub_02017088: ; 0x02017088
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x1d
	lsl r0, r0, #4
	add r4, r1, #0
	mul r4, r0
	ldr r0, [r5]
	add r0, r0, r4
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _020170C2
	bl DestroySysTask
	ldr r1, [r5]
	mov r0, #0
	add r1, r1, r4
	str r0, [r1, #4]
	ldr r1, [r5]
	mov r2, #1
	add r1, r1, r4
	str r2, [r1, #0x20]
	ldr r1, [r5]
	add r1, r1, r4
	str r0, [r1, #0x10]
	ldr r0, [r5]
	add r0, r0, r4
	ldr r0, [r0, #8]
	bl FreeToHeap
_020170C2:
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02017088

	thumb_func_start sub_020170C4
sub_020170C4: ; 0x020170C4
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0x54]
	cmp r0, #0
	bne _020170D8
	add r0, r4, #0
	bl sub_020170FC
	b _020170DC
_020170D8:
	sub r0, r0, #1
	str r0, [r4, #0x54]
_020170DC:
	ldr r0, [r4, #0x1c]
	cmp r0, #0
	beq _020170FA
	mov r0, #1
	str r0, [r4, #0x20]
	mov r0, #0
	str r0, [r4, #0x10]
	add r0, r5, #0
	bl DestroySysTask
	mov r0, #0
	str r0, [r4, #4]
	ldr r0, [r4, #8]
	bl FreeToHeap
_020170FA:
	pop {r3, r4, r5, pc}
	thumb_func_end sub_020170C4

	thumb_func_start sub_020170FC
sub_020170FC: ; 0x020170FC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r6, #0
	str r6, [r5, #0x18]
	add r7, r5, #0
	str r6, [r5, #0x44]
	add r4, r6, #0
	add r7, #0x7c
_0201710C:
	mov r0, #0x54
	add r1, r4, #0
	mul r1, r0
	add r0, r7, r1
	ldr r1, [r7, r1]
	cmp r1, #0
	beq _0201713A
	add r1, r0, #0
	add r1, #0x2d
	ldrb r1, [r1]
	cmp r1, #0
	bne _0201712C
	ldr r2, [r0, #0x50]
	add r1, r5, #0
	blx r2
	b _02017140
_0201712C:
	add r1, r0, #0
	add r1, #0x2d
	ldrb r1, [r1]
	add r0, #0x2d
	sub r1, r1, #1
	strb r1, [r0]
	b _02017140
_0201713A:
	add r0, r6, #1
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
_02017140:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #4
	blo _0201710C
	cmp r6, #4
	bne _02017154
	ldr r0, _020171E8 ; =0x000001CD
	mov r1, #0
	strb r1, [r5, r0]
_02017154:
	ldr r0, _020171E8 ; =0x000001CD
	ldrb r1, [r5, r0]
	cmp r1, #0
	beq _0201716A
	add r0, r5, #0
	bl sub_020179D4
	add r0, r5, #0
	bl sub_02017A1C
	pop {r3, r4, r5, r6, r7, pc}
_0201716A:
	add r0, r0, #2
	ldrb r0, [r5, r0]
	cmp r0, #0
	beq _02017182
	ldr r0, [r5]
	bl sub_02009138
	cmp r0, #0
	bne _020171E4
	ldr r0, _020171EC ; =0x000001CF
	mov r1, #0
	strb r1, [r5, r0]
_02017182:
	add r6, r5, #0
	add r4, r5, #0
	ldr r7, _020171F0 ; =_020F61F8
	add r6, #0xc
	add r4, #0x44
_0201718C:
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	ldr r0, [r5, #0xc]
	ldr r0, [r0]
	cmp r0, #0x22
	blo _0201719E
	bl GF_AssertFail
_0201719E:
	ldr r1, [r5, #0xc]
	add r0, r5, #0
	ldr r1, [r1]
	lsl r1, r1, #2
	ldr r1, [r7, r1]
	blx r1
	ldr r0, [r5, #0x1c]
	cmp r0, #0
	bne _020171E4
	ldr r0, [r6]
	add r0, r0, #4
	str r0, [r6]
	ldr r0, [r5, #0x18]
	cmp r0, #0
	bne _020171E4
	ldr r0, _020171E8 ; =0x000001CD
	ldrb r0, [r5, r0]
	cmp r0, #0
	beq _020171D2
	add r0, r5, #0
	bl sub_020179D4
	add r0, r5, #0
	bl sub_02017A1C
	pop {r3, r4, r5, r6, r7, pc}
_020171D2:
	mov r0, #1
	ldr r1, [r5, #0x44]
	lsl r0, r0, #8
	cmp r1, r0
	blt _0201718C
	bl GF_AssertFail
	mov r0, #1
	str r0, [r5, #0x1c]
_020171E4:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_020171E8: .word 0x000001CD
_020171EC: .word 0x000001CF
_020171F0: .word _020F61F8
	thumb_func_end sub_020170FC

	thumb_func_start sub_020171F4
sub_020171F4: ; 0x020171F4
	push {r4, lr}
	lsl r1, r1, #2
	ldr r4, [r0, r1]
	cmp r2, #1
	beq _02017202
	bl GF_AssertFail
_02017202:
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020171F4

	thumb_func_start sub_02017208
sub_02017208: ; 0x02017208
	ldr r3, _02017210 ; =sub_020171F4
	add r2, r1, #0
	mov r1, #0
	bx r3
	.balign 4, 0
_02017210: .word sub_020171F4
	thumb_func_end sub_02017208

	thumb_func_start sub_02017214
sub_02017214: ; 0x02017214
	ldr r3, _0201721C ; =sub_02017208
	mov r1, #1
	bx r3
	nop
_0201721C: .word sub_02017208
	thumb_func_end sub_02017214

	thumb_func_start sub_02017220
sub_02017220: ; 0x02017220
	push {r3, r4, r5, lr}
	add r5, r1, #0
	mov r3, #0
	add r0, #0x7c
	mov r2, #0x54
_0201722A:
	add r1, r3, #0
	mul r1, r2
	add r4, r0, r1
	ldr r1, [r0, r1]
	cmp r1, #0
	bne _02017254
	add r0, r4, #0
	mov r1, #0
	mov r2, #0x54
	bl MI_CpuFill8
	mov r0, #1
	str r0, [r4]
	mov r0, #0xc
	add r1, r5, #0
	mul r1, r0
	ldr r0, _02017268 ; =_020F61BC
	ldr r0, [r0, r1]
	str r0, [r4, #0x50]
	add r0, r4, #0
	pop {r3, r4, r5, pc}
_02017254:
	add r1, r3, #1
	lsl r1, r1, #0x18
	lsr r3, r1, #0x18
	cmp r3, #4
	blo _0201722A
	bl GF_AssertFail
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_02017268: .word _020F61BC
	thumb_func_end sub_02017220

	thumb_func_start sub_0201726C
sub_0201726C: ; 0x0201726C
	push {r4, lr}
	add r4, r1, #0
	ldr r1, [r0, #0xc]
	add r1, r1, #4
	str r1, [r0, #0xc]
	add r0, r1, #0
	bl sub_02017214
	str r0, [r4]
	pop {r4, pc}
	thumb_func_end sub_0201726C

	thumb_func_start sub_02017280
sub_02017280: ; 0x02017280
	push {r4, lr}
	add r4, r1, #0
	ldr r1, [r0, #0xc]
	add r1, r1, #4
	str r1, [r0, #0xc]
	add r0, r1, #0
	bl sub_02017214
	strb r0, [r4]
	pop {r4, pc}
	thumb_func_end sub_02017280

	thumb_func_start sub_02017294
sub_02017294: ; 0x02017294
	push {r4, lr}
	add r4, r1, #0
	ldr r1, [r0, #0xc]
	add r1, r1, #4
	str r1, [r0, #0xc]
	add r0, r1, #0
	bl sub_02017214
	strb r0, [r4]
	ldrb r0, [r4]
	cmp r0, #8
	blo _020172B0
	bl GF_AssertFail
_020172B0:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02017294

	thumb_func_start sub_020172B4
sub_020172B4: ; 0x020172B4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r2, #0
	bl sub_02017294
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02017294
	pop {r3, r4, r5, pc}
	thumb_func_end sub_020172B4

	thumb_func_start sub_020172C8
sub_020172C8: ; 0x020172C8
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	add r4, r2, #0
	add r6, r3, #0
	bl sub_02017294
	add r0, r5, #0
	add r1, sp, #0
	bl sub_02017280
	add r0, sp, #0
	ldrb r0, [r0]
	cmp r0, #0x12
	bne _02017308
	add r1, sp, #0
	add r0, r5, #0
	add r1, #2
	bl sub_02017294
	add r0, sp, #0
	ldrb r0, [r0, #2]
	add r1, r6, #0
	lsl r0, r0, #2
	add r0, r5, r0
	ldr r0, [r0, #0x24]
	str r0, [r4]
	add r0, r5, #0
	bl sub_0201726C
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_02017308:
	cmp r0, #0x13
	bne _02017334
	add r1, sp, #0
	add r2, sp, #0
	add r0, r5, #0
	add r1, #2
	add r2, #1
	bl sub_020172B4
	add r0, sp, #0
	ldrb r1, [r0, #2]
	add sp, #4
	lsl r1, r1, #2
	add r1, r5, r1
	ldr r1, [r1, #0x24]
	str r1, [r4]
	ldrb r0, [r0, #1]
	lsl r0, r0, #2
	add r0, r5, r0
	ldr r0, [r0, #0x24]
	str r0, [r6]
	pop {r3, r4, r5, r6, pc}
_02017334:
	bl GF_AssertFail
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	thumb_func_end sub_020172C8

	thumb_func_start sub_0201733C
sub_0201733C: ; 0x0201733C
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	add r4, r2, #0
	add r6, r3, #0
	bl sub_02017294
	add r1, sp, #0
	add r0, r5, #0
	add r1, #1
	bl sub_02017280
	add r0, r5, #0
	add r1, sp, #0
	bl sub_02017280
	add r0, sp, #0
	ldrb r0, [r0, #1]
	cmp r0, #0x12
	bne _0201736E
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0201726C
	b _0201738E
_0201736E:
	cmp r0, #0x13
	bne _0201738A
	add r1, sp, #0
	add r0, r5, #0
	add r1, #3
	bl sub_02017294
	add r0, sp, #0
	ldrb r0, [r0, #3]
	lsl r0, r0, #2
	add r0, r5, r0
	ldr r0, [r0, #0x24]
	str r0, [r4]
	b _0201738E
_0201738A:
	bl GF_AssertFail
_0201738E:
	add r0, sp, #0
	ldrb r0, [r0]
	cmp r0, #0x12
	bne _020173A2
	add r0, r5, #0
	add r1, r6, #0
	bl sub_0201726C
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_020173A2:
	cmp r0, #0x13
	bne _020173C0
	add r1, sp, #0
	add r0, r5, #0
	add r1, #2
	bl sub_02017294
	add r0, sp, #0
	ldrb r0, [r0, #2]
	add sp, #4
	lsl r0, r0, #2
	add r0, r5, r0
	ldr r0, [r0, #0x24]
	str r0, [r6]
	pop {r3, r4, r5, r6, pc}
_020173C0:
	bl GF_AssertFail
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	thumb_func_end sub_0201733C

	thumb_func_start sub_020173C8
sub_020173C8: ; 0x020173C8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r2, #0
	add r2, sp, #0
	add r2, #3
	add r5, r0, #0
	add r6, r3, #0
	bl sub_020172B4
	add r0, sp, #0
	ldrb r0, [r0, #3]
	add r1, sp, #0
	lsl r0, r0, #2
	add r0, r5, r0
	ldr r7, [r0, #0x24]
	add r0, r5, #0
	bl sub_02017280
	add r0, sp, #0
	ldrb r0, [r0]
	cmp r0, #0x14
	bne _020173FE
	add r0, r5, #0
	add r1, r6, #0
	bl sub_0201726C
	b _0201741E
_020173FE:
	cmp r0, #0x15
	bne _0201741A
	add r1, sp, #0
	add r0, r5, #0
	add r1, #2
	bl sub_02017294
	add r0, sp, #0
	ldrb r0, [r0, #2]
	lsl r0, r0, #2
	add r0, r5, r0
	ldr r0, [r0, #0x24]
	str r0, [r6]
	b _0201741E
_0201741A:
	bl GF_AssertFail
_0201741E:
	add r0, r5, #0
	add r1, sp, #0
	bl sub_02017280
	add r0, sp, #0
	ldrb r0, [r0]
	cmp r0, #0x14
	bne _02017438
	add r0, r5, #0
	add r1, sp, #4
	bl sub_0201726C
	b _02017458
_02017438:
	cmp r0, #0x15
	bne _02017454
	add r1, sp, #0
	add r0, r5, #0
	add r1, #1
	bl sub_02017294
	add r0, sp, #0
	ldrb r0, [r0, #1]
	lsl r0, r0, #2
	add r0, r5, r0
	ldr r0, [r0, #0x24]
	str r0, [sp, #4]
	b _02017458
_02017454:
	bl GF_AssertFail
_02017458:
	ldr r0, [sp, #4]
	add r0, r7, r0
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x10
	sub r1, r1, r2
	mov r0, #0x10
	ror r1, r0
	add r0, r2, r1
	str r0, [r4]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_020173C8

	thumb_func_start sub_02017470
sub_02017470: ; 0x02017470
	ldr r2, [r0]
	ldr r0, [r1]
	sub r0, r2, r0
	bpl _0201747C
	mov r0, #0xf
	bx lr
_0201747C:
	cmp r0, #0
	ble _02017484
	mov r0, #0x10
	bx lr
_02017484:
	mov r0, #0x11
	bx lr
	thumb_func_end sub_02017470

	thumb_func_start sub_02017488
sub_02017488: ; 0x02017488
	add r2, r0, #0
	ldr r0, [r2]
	ldr r2, [r2, #0x74]
	mov r1, #1
	neg r3, r2
	asr r2, r3, #2
	lsr r2, r2, #0x1d
	add r2, r3, r2
	ldr r3, _020174A0 ; =sub_02008C2C
	asr r2, r2, #3
	bx r3
	nop
_020174A0: .word sub_02008C2C
	thumb_func_end sub_02017488

	thumb_func_start sub_020174A4
sub_020174A4: ; 0x020174A4
	push {r4, lr}
	add r4, r0, #0
	bl sub_020174BC
	mov r0, #1
	str r0, [r4, #0x18]
	str r0, [r4, #0x1c]
	pop {r4, pc}
	thumb_func_end sub_020174A4

	thumb_func_start sub_020174B4
sub_020174B4: ; 0x020174B4
	mov r1, #1
	str r1, [r0, #0x18]
	bx lr
	.balign 4, 0
	thumb_func_end sub_020174B4

	thumb_func_start sub_020174BC
sub_020174BC: ; 0x020174BC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	ldr r2, [r4, #0x58]
	mov r1, #0
	bl sub_020087A4
	ldr r0, [r4]
	ldr r2, [r4, #0x5c]
	mov r1, #1
	bl sub_020087A4
	ldr r0, [r4]
	mov r1, #9
	mov r2, #0
	bl sub_020087A4
	ldr r0, [r4]
	mov r1, #0xa
	mov r2, #0
	bl sub_020087A4
	mov r1, #0xc
	add r2, r1, #0
	ldr r0, [r4]
	add r2, #0xf4
	bl sub_020087A4
	mov r1, #0xd
	add r2, r1, #0
	ldr r0, [r4]
	add r2, #0xf3
	bl sub_020087A4
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020174BC

	thumb_func_start sub_02017504
sub_02017504: ; 0x02017504
	push {r3, r4, lr}
	sub sp, #4
	add r1, sp, #0
	add r1, #1
	add r2, sp, #0
	add r4, r0, #0
	bl sub_020172B4
	add r0, sp, #0
	ldrb r1, [r0]
	ldrb r0, [r0, #1]
	lsl r1, r1, #2
	add r1, r4, r1
	lsl r0, r0, #2
	ldr r1, [r1, #0x24]
	add r0, r4, r0
	str r1, [r0, #0x24]
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end sub_02017504

	thumb_func_start sub_0201752C
sub_0201752C: ; 0x0201752C
	push {r3, r4, lr}
	sub sp, #0xc
	add r1, sp, #0
	add r2, sp, #8
	add r3, sp, #4
	add r4, r0, #0
	bl sub_020172C8
	ldr r1, [sp, #8]
	ldr r0, [sp, #4]
	add r1, r1, r0
	add r0, sp, #0
	ldrb r0, [r0]
	lsl r0, r0, #2
	add r0, r4, r0
	str r1, [r0, #0x24]
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end sub_0201752C

	thumb_func_start sub_02017550
sub_02017550: ; 0x02017550
	push {r3, r4, lr}
	sub sp, #0xc
	add r1, sp, #0
	add r2, sp, #8
	add r3, sp, #4
	add r4, r0, #0
	bl sub_020172C8
	ldr r1, [sp, #8]
	ldr r0, [sp, #4]
	add r2, r1, #0
	mul r2, r0
	add r0, sp, #0
	ldrb r0, [r0]
	lsl r0, r0, #2
	add r0, r4, r0
	str r2, [r0, #0x24]
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end sub_02017550

	thumb_func_start sub_02017578
sub_02017578: ; 0x02017578
	push {r3, r4, lr}
	sub sp, #0xc
	add r1, sp, #0
	add r2, sp, #8
	add r3, sp, #4
	add r4, r0, #0
	bl sub_0201733C
	ldr r1, [sp, #8]
	ldr r0, [sp, #4]
	sub r1, r1, r0
	add r0, sp, #0
	ldrb r0, [r0]
	lsl r0, r0, #2
	add r0, r4, r0
	str r1, [r0, #0x24]
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end sub_02017578

	thumb_func_start sub_0201759C
sub_0201759C: ; 0x0201759C
	push {r3, r4, lr}
	sub sp, #0xc
	add r1, sp, #0
	add r2, sp, #8
	add r3, sp, #4
	add r4, r0, #0
	bl sub_0201733C
	ldr r0, [sp, #8]
	ldr r1, [sp, #4]
	bl _s32_div_f
	add r1, sp, #0
	ldrb r1, [r1]
	lsl r1, r1, #2
	add r1, r4, r1
	str r0, [r1, #0x24]
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end sub_0201759C

	thumb_func_start sub_020175C4
sub_020175C4: ; 0x020175C4
	push {r3, r4, lr}
	sub sp, #0xc
	add r1, sp, #0
	add r2, sp, #8
	add r3, sp, #4
	add r4, r0, #0
	bl sub_0201733C
	ldr r0, [sp, #8]
	ldr r1, [sp, #4]
	bl _s32_div_f
	add r0, sp, #0
	ldrb r0, [r0]
	lsl r0, r0, #2
	add r0, r4, r0
	str r1, [r0, #0x24]
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end sub_020175C4

	thumb_func_start sub_020175EC
sub_020175EC: ; 0x020175EC
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r1, sp, #0
	add r5, r0, #0
	bl sub_02017280
	add r0, sp, #0
	ldrb r0, [r0]
	cmp r0, #0x14
	bne _02017620
	add r1, sp, #0
	add r0, r5, #0
	add r1, #3
	bl sub_02017294
	add r0, sp, #0
	ldrb r0, [r0, #3]
	add r1, sp, #8
	lsl r0, r0, #2
	add r0, r5, r0
	ldr r0, [r0, #0x24]
	str r0, [sp, #0xc]
	add r0, r5, #0
	bl sub_0201726C
	b _0201764E
_02017620:
	cmp r0, #0x15
	bne _0201764A
	add r1, sp, #0
	add r2, sp, #0
	add r0, r5, #0
	add r1, #3
	add r2, #2
	bl sub_020172B4
	add r0, sp, #0
	ldrb r1, [r0, #3]
	lsl r1, r1, #2
	add r1, r5, r1
	ldr r1, [r1, #0x24]
	str r1, [sp, #0xc]
	ldrb r0, [r0, #2]
	lsl r0, r0, #2
	add r0, r5, r0
	ldr r0, [r0, #0x24]
	str r0, [sp, #8]
	b _0201764E
_0201764A:
	bl GF_AssertFail
_0201764E:
	add r1, sp, #0
	add r0, r5, #0
	add r1, #1
	bl sub_02017280
	add r0, sp, #0
	ldrb r0, [r0, #1]
	cmp r0, #0x11
	bls _02017664
	bl GF_AssertFail
_02017664:
	add r0, sp, #0xc
	add r1, sp, #8
	bl sub_02017470
	add r4, r0, #0
	add r0, r5, #0
	add r1, sp, #0
	bl sub_02017280
	add r0, sp, #0
	ldrb r0, [r0]
	cmp r0, #0x14
	bne _02017692
	add r1, sp, #0
	add r0, r5, #0
	add r1, #3
	bl sub_02017294
	add r0, r5, #0
	add r1, sp, #4
	bl sub_0201726C
	b _020176B6
_02017692:
	cmp r0, #0x15
	bne _020176B2
	add r1, sp, #0
	add r2, sp, #0
	add r0, r5, #0
	add r1, #3
	add r2, #2
	bl sub_020172B4
	add r0, sp, #0
	ldrb r0, [r0, #2]
	lsl r0, r0, #2
	add r0, r5, r0
	ldr r0, [r0, #0x24]
	str r0, [sp, #4]
	b _020176B6
_020176B2:
	bl GF_AssertFail
_020176B6:
	add r0, sp, #0
	ldrb r1, [r0, #1]
	cmp r1, r4
	bne _020176C8
	ldrb r0, [r0, #3]
	ldr r1, [sp, #4]
	lsl r0, r0, #2
	add r0, r5, r0
	str r1, [r0, #0x24]
_020176C8:
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end sub_020175EC

	thumb_func_start sub_020176CC
sub_020176CC: ; 0x020176CC
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	add r1, sp, #0
	bl sub_02017294
	ldr r0, [r4, #0xc]
	add r0, r0, #4
	str r0, [r4, #0xc]
	bl sub_02017214
	add r1, sp, #0
	ldrb r1, [r1]
	lsl r1, r1, #2
	add r1, r4, r1
	str r0, [r1, #0x24]
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end sub_020176CC

	thumb_func_start sub_020176F0
sub_020176F0: ; 0x020176F0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x50]
	cmp r0, #0
	beq _020176FE
	bl GF_AssertFail
_020176FE:
	ldr r0, [r4, #0xc]
	add r0, r0, #4
	str r0, [r4, #0xc]
	str r0, [r4, #0x50]
	ldr r0, [r4, #0xc]
	bl sub_02017214
	str r0, [r4, #0x48]
	mov r0, #0
	str r0, [r4, #0x4c]
	pop {r4, pc}
	thumb_func_end sub_020176F0

	thumb_func_start sub_02017714
sub_02017714: ; 0x02017714
	ldr r1, [r0, #0x4c]
	add r2, r1, #1
	str r2, [r0, #0x4c]
	ldr r1, [r0, #0x48]
	cmp r2, r1
	blt _0201772A
	mov r1, #0
	str r1, [r0, #0x50]
	str r1, [r0, #0x4c]
	str r1, [r0, #0x48]
	bx lr
_0201772A:
	ldr r1, [r0, #0x50]
	str r1, [r0, #0xc]
	bx lr
	thumb_func_end sub_02017714

	thumb_func_start sub_02017730
sub_02017730: ; 0x02017730
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	add r1, sp, #4
	bl sub_0201726C
	add r0, r4, #0
	add r1, sp, #0
	bl sub_02017294
	add r2, sp, #0
	ldrb r2, [r2]
	ldr r0, [r4]
	ldr r1, [sp, #4]
	lsl r2, r2, #2
	add r2, r4, r2
	ldr r2, [r2, #0x24]
	bl sub_020087A4
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02017730

	thumb_func_start sub_0201775C
sub_0201775C: ; 0x0201775C
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	add r1, sp, #4
	bl sub_0201726C
	add r0, r4, #0
	add r1, sp, #0
	bl sub_02017294
	add r2, sp, #0
	ldrb r2, [r2]
	ldr r0, [r4]
	ldr r1, [sp, #4]
	lsl r2, r2, #2
	add r2, r4, r2
	ldr r2, [r2, #0x24]
	bl sub_02008C2C
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0201775C

	thumb_func_start sub_02017788
sub_02017788: ; 0x02017788
	push {r3, r4, lr}
	sub sp, #0xc
	add r1, sp, #8
	add r4, r0, #0
	bl sub_0201726C
	add r1, sp, #0
	add r0, r4, #0
	add r1, #1
	bl sub_02017280
	add r0, sp, #0
	ldrb r0, [r0, #1]
	cmp r0, #0x14
	bne _020177B0
	add r0, r4, #0
	add r1, sp, #4
	bl sub_0201726C
	b _020177D0
_020177B0:
	cmp r0, #0x15
	bne _020177CC
	add r1, sp, #0
	add r0, r4, #0
	add r1, #2
	bl sub_02017294
	add r0, sp, #0
	ldrb r0, [r0, #2]
	lsl r0, r0, #2
	add r0, r4, r0
	ldr r0, [r0, #0x24]
	str r0, [sp, #4]
	b _020177D0
_020177CC:
	bl GF_AssertFail
_020177D0:
	add r0, r4, #0
	add r1, sp, #0
	bl sub_02017280
	add r0, sp, #0
	ldrb r0, [r0]
	cmp r0, #0x16
	bne _020177EE
	ldr r0, [r4]
	ldr r1, [sp, #8]
	ldr r2, [sp, #4]
	bl sub_020087A4
	add sp, #0xc
	pop {r3, r4, pc}
_020177EE:
	cmp r0, #0x17
	bne _02017800
	ldr r0, [r4]
	ldr r1, [sp, #8]
	ldr r2, [sp, #4]
	bl sub_02008C2C
	add sp, #0xc
	pop {r3, r4, pc}
_02017800:
	bl GF_AssertFail
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end sub_02017788

	thumb_func_start sub_02017808
sub_02017808: ; 0x02017808
	push {r3, r4, lr}
	sub sp, #0xc
	add r1, sp, #0
	add r2, sp, #8
	add r3, sp, #4
	add r4, r0, #0
	bl sub_020173C8
	ldr r0, [sp, #8]
	ldr r2, [sp, #4]
	asr r0, r0, #4
	lsl r1, r0, #2
	ldr r0, _02017838 ; =FX_SinCosTable_
	ldrsh r0, [r0, r1]
	mul r0, r2
	asr r1, r0, #0xc
	add r0, sp, #0
	ldrb r0, [r0]
	lsl r0, r0, #2
	add r0, r4, r0
	str r1, [r0, #0x24]
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_02017838: .word FX_SinCosTable_
	thumb_func_end sub_02017808

	thumb_func_start sub_0201783C
sub_0201783C: ; 0x0201783C
	push {r3, r4, lr}
	sub sp, #0xc
	add r1, sp, #0
	add r2, sp, #8
	add r3, sp, #4
	add r4, r0, #0
	bl sub_020173C8
	ldr r1, [sp, #8]
	ldr r0, [sp, #4]
	asr r1, r1, #4
	lsl r1, r1, #1
	add r1, r1, #1
	lsl r2, r1, #1
	ldr r1, _02017870 ; =FX_SinCosTable_
	ldrsh r1, [r1, r2]
	mul r1, r0
	add r0, sp, #0
	ldrb r0, [r0]
	asr r1, r1, #0xc
	lsl r0, r0, #2
	add r0, r4, r0
	str r1, [r0, #0x24]
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_02017870: .word FX_SinCosTable_
	thumb_func_end sub_0201783C

	thumb_func_start sub_02017874
sub_02017874: ; 0x02017874
	push {r3, r4, lr}
	sub sp, #4
	add r1, sp, #0
	add r4, r0, #0
	add r1, #1
	bl sub_02017294
	add r0, r4, #0
	add r1, sp, #0
	bl sub_02017280
	add r0, sp, #0
	ldrb r1, [r0]
	cmp r1, #8
	bne _020178A0
	ldrb r0, [r0, #1]
	add sp, #4
	lsl r0, r0, #2
	add r0, r4, r0
	ldr r0, [r0, #0x24]
	str r0, [r4, #0x60]
	pop {r3, r4, pc}
_020178A0:
	cmp r1, #9
	bne _020178B2
	ldrb r0, [r0, #1]
	add sp, #4
	lsl r0, r0, #2
	add r0, r4, r0
	ldr r0, [r0, #0x24]
	str r0, [r4, #0x64]
	pop {r3, r4, pc}
_020178B2:
	bl GF_AssertFail
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end sub_02017874

	thumb_func_start sub_020178BC
sub_020178BC: ; 0x020178BC
	push {r3, r4, lr}
	sub sp, #4
	add r1, sp, #0
	add r4, r0, #0
	add r1, #1
	bl sub_02017294
	add r0, r4, #0
	add r1, sp, #0
	bl sub_02017280
	add r0, sp, #0
	ldrb r1, [r0]
	cmp r1, #8
	bne _020178EC
	ldrb r0, [r0, #1]
	ldr r1, [r4, #0x60]
	add sp, #4
	lsl r0, r0, #2
	add r0, r4, r0
	ldr r0, [r0, #0x24]
	add r0, r1, r0
	str r0, [r4, #0x60]
	pop {r3, r4, pc}
_020178EC:
	cmp r1, #9
	bne _02017902
	ldrb r0, [r0, #1]
	ldr r1, [r4, #0x64]
	add sp, #4
	lsl r0, r0, #2
	add r0, r4, r0
	ldr r0, [r0, #0x24]
	add r0, r1, r0
	str r0, [r4, #0x64]
	pop {r3, r4, pc}
_02017902:
	bl GF_AssertFail
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end sub_020178BC

	thumb_func_start sub_0201790C
sub_0201790C: ; 0x0201790C
	push {r3, r4, r5, lr}
	sub sp, #8
	add r1, sp, #0
	add r1, #3
	add r5, r0, #0
	bl sub_02017280
	add r0, sp, #0
	ldrb r0, [r0, #3]
	cmp r0, #8
	bne _02017928
	add r4, r5, #0
	add r4, #0x60
	b _02017968
_02017928:
	cmp r0, #9
	bne _02017932
	add r4, r5, #0
	add r4, #0x64
	b _02017968
_02017932:
	cmp r0, #0xa
	bne _0201793C
	add r4, r5, #0
	add r4, #0x68
	b _02017968
_0201793C:
	cmp r0, #0xb
	bne _02017946
	add r4, r5, #0
	add r4, #0x6c
	b _02017968
_02017946:
	cmp r0, #0xc
	bne _02017950
	add r4, r5, #0
	add r4, #0x70
	b _02017968
_02017950:
	cmp r0, #0xd
	bne _0201795A
	add r4, r5, #0
	add r4, #0x74
	b _02017968
_0201795A:
	cmp r0, #0xe
	bne _02017964
	add r4, r5, #0
	add r4, #0x78
	b _02017968
_02017964:
	bl GF_AssertFail
_02017968:
	add r1, sp, #0
	add r0, r5, #0
	add r1, #1
	bl sub_02017280
	add r0, sp, #0
	ldrb r0, [r0, #1]
	cmp r0, #0x14
	bne _02017984
	add r0, r5, #0
	add r1, sp, #4
	bl sub_0201726C
	b _020179A4
_02017984:
	cmp r0, #0x15
	bne _020179A0
	add r1, sp, #0
	add r0, r5, #0
	add r1, #2
	bl sub_02017294
	add r0, sp, #0
	ldrb r0, [r0, #2]
	lsl r0, r0, #2
	add r0, r5, r0
	ldr r0, [r0, #0x24]
	str r0, [sp, #4]
	b _020179A4
_020179A0:
	bl GF_AssertFail
_020179A4:
	add r0, r5, #0
	add r1, sp, #0
	bl sub_02017280
	add r0, sp, #0
	ldrb r0, [r0]
	cmp r0, #0x16
	bne _020179BC
	ldr r0, [sp, #4]
	add sp, #8
	str r0, [r4]
	pop {r3, r4, r5, pc}
_020179BC:
	cmp r0, #0x17
	bne _020179CC
	ldr r0, [sp, #4]
	ldr r1, [r4]
	add sp, #8
	add r0, r1, r0
	str r0, [r4]
	pop {r3, r4, r5, pc}
_020179CC:
	bl GF_AssertFail
	add sp, #8
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0201790C

	thumb_func_start sub_020179D4
sub_020179D4: ; 0x020179D4
	push {r3, r4, r5, lr}
	add r4, r0, #0
	mov r0, #0x73
	lsl r0, r0, #2
	ldrb r0, [r4, r0]
	cmp r0, #0
	ldr r0, [r4]
	beq _020179F6
	ldr r3, [r4, #0x60]
	ldr r2, [r4, #0x68]
	ldr r5, [r4, #0x58]
	add r2, r3, r2
	mov r1, #0
	sub r2, r5, r2
	bl sub_020087A4
	b _02017A06
_020179F6:
	ldr r3, [r4, #0x58]
	ldr r2, [r4, #0x60]
	ldr r5, [r4, #0x68]
	add r2, r3, r2
	mov r1, #0
	add r2, r5, r2
	bl sub_020087A4
_02017A06:
	ldr r3, [r4, #0x5c]
	ldr r2, [r4, #0x64]
	ldr r5, [r4, #0x6c]
	add r2, r3, r2
	ldr r0, [r4]
	mov r1, #1
	add r2, r5, r2
	bl sub_020087A4
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_020179D4

	thumb_func_start sub_02017A1C
sub_02017A1C: ; 0x02017A1C
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0xc
	add r2, r1, #0
	ldr r3, [r4, #0x70]
	add r2, #0xf4
	ldr r0, [r4]
	add r2, r3, r2
	bl sub_020087A4
	mov r1, #0xd
	add r2, r1, #0
	ldr r3, [r4, #0x74]
	add r2, #0xf3
	ldr r0, [r4]
	add r2, r3, r2
	bl sub_020087A4
	ldr r2, [r4, #0x78]
	ldr r0, [r4]
	lsl r2, r2, #0x10
	mov r1, #9
	lsr r2, r2, #0x10
	bl sub_020087A4
	ldr r0, _02017A80 ; =0x000001CE
	ldrb r0, [r4, r0]
	cmp r0, #0x1b
	bne _02017A64
	ldr r0, [r4, #0x74]
	cmp r0, #0
	bge _02017A7E
	add r0, r4, #0
	bl sub_02017488
	pop {r4, pc}
_02017A64:
	cmp r0, #0x1d
	bne _02017A76
	ldr r0, [r4, #0x74]
	cmp r0, #0
	beq _02017A7E
	add r0, r4, #0
	bl sub_02017488
	pop {r4, pc}
_02017A76:
	cmp r0, #0x1c
	beq _02017A7E
	bl GF_AssertFail
_02017A7E:
	pop {r4, pc}
	.balign 4, 0
_02017A80: .word 0x000001CE
	thumb_func_end sub_02017A1C

	thumb_func_start sub_02017A84
sub_02017A84: ; 0x02017A84
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	add r1, sp, #0
	bl sub_02017294
	ldr r0, [r4, #0xc]
	add r0, r0, #4
	str r0, [r4, #0xc]
	bl sub_02017214
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #8
	beq _02017AA6
	cmp r0, #0xa
	bne _02017AB6
_02017AA6:
	add r0, sp, #0
	ldrb r0, [r0]
	add sp, #4
	lsl r0, r0, #2
	add r0, r4, r0
	ldr r0, [r0, #0x24]
	str r0, [r4, #0x68]
	pop {r3, r4, pc}
_02017AB6:
	cmp r0, #9
	beq _02017ABE
	cmp r0, #0xb
	bne _02017ACE
_02017ABE:
	add r0, sp, #0
	ldrb r0, [r0]
	add sp, #4
	lsl r0, r0, #2
	add r0, r4, r0
	ldr r0, [r0, #0x24]
	str r0, [r4, #0x6c]
	pop {r3, r4, pc}
_02017ACE:
	bl GF_AssertFail
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end sub_02017A84

	thumb_func_start sub_02017AD8
sub_02017AD8: ; 0x02017AD8
	push {r4, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x54
	bl sub_0201726C
	mov r0, #1
	str r0, [r4, #0x18]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02017AD8

	thumb_func_start sub_02017AEC
sub_02017AEC: ; 0x02017AEC
	push {r3, r4, lr}
	sub sp, #0xc
	add r1, sp, #4
	add r1, #2
	add r4, r0, #0
	bl sub_02017280
	add r1, sp, #4
	add r0, r4, #0
	add r1, #1
	bl sub_02017280
	add r0, r4, #0
	add r1, sp, #4
	bl sub_02017280
	add r0, r4, #0
	add r1, sp, #8
	bl sub_0201726C
	ldr r0, [sp, #8]
	add r3, sp, #4
	str r0, [sp]
	ldrb r1, [r3, #2]
	ldrb r2, [r3, #1]
	ldrb r3, [r3]
	ldr r0, [r4]
	bl sub_020090B4
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end sub_02017AEC

	thumb_func_start sub_02017B2C
sub_02017B2C: ; 0x02017B2C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl sub_02009138
	cmp r0, #0
	beq _02017B42
	ldr r0, _02017B44 ; =0x000001CF
	mov r1, #1
	strb r1, [r4, r0]
	str r1, [r4, #0x18]
_02017B42:
	pop {r4, pc}
	.balign 4, 0
_02017B44: .word 0x000001CF
	thumb_func_end sub_02017B2C

	thumb_func_start sub_02017B48
sub_02017B48: ; 0x02017B48
	ldr r1, _02017B50 ; =0x000001CD
	mov r2, #1
	strb r2, [r0, r1]
	bx lr
	.balign 4, 0
_02017B50: .word 0x000001CD
	thumb_func_end sub_02017B48

	thumb_func_start sub_02017B54
sub_02017B54: ; 0x02017B54
	push {r4, lr}
	ldr r1, _02017B88 ; =0x000001CE
	add r4, r0, #0
	add r1, r4, r1
	bl sub_02017280
	ldr r0, _02017B88 ; =0x000001CE
	mov r1, #1
	ldrb r0, [r4, r0]
	add r2, r1, #0
	cmp r0, #0x1b
	beq _02017B72
	cmp r0, #0x1d
	beq _02017B72
	mov r2, #0
_02017B72:
	cmp r2, #0
	bne _02017B7C
	cmp r0, #0x1c
	beq _02017B7C
	mov r1, #0
_02017B7C:
	cmp r1, #0
	bne _02017B84
	bl GF_AssertFail
_02017B84:
	pop {r4, pc}
	nop
_02017B88: .word 0x000001CE
	thumb_func_end sub_02017B54

	thumb_func_start sub_02017B8C
sub_02017B8C: ; 0x02017B8C
	ldr r3, _02017B94 ; =sub_02017C78
	mov r1, #0
	bx r3
	nop
_02017B94: .word sub_02017C78
	thumb_func_end sub_02017B8C

	thumb_func_start sub_02017B98
sub_02017B98: ; 0x02017B98
	ldr r3, _02017BA0 ; =sub_02017C78
	mov r1, #1
	bx r3
	nop
_02017BA0: .word sub_02017C78
	thumb_func_end sub_02017B98

	thumb_func_start sub_02017BA4
sub_02017BA4: ; 0x02017BA4
	ldr r3, _02017BAC ; =sub_02017C78
	mov r1, #2
	bx r3
	nop
_02017BAC: .word sub_02017C78
	thumb_func_end sub_02017BA4

	thumb_func_start sub_02017BB0
sub_02017BB0: ; 0x02017BB0
	ldr r3, _02017BB8 ; =sub_02017C78
	mov r1, #3
	bx r3
	nop
_02017BB8: .word sub_02017C78
	thumb_func_end sub_02017BB0

	thumb_func_start sub_02017BBC
sub_02017BBC: ; 0x02017BBC
	ldr r3, _02017BC4 ; =sub_02017C78
	mov r1, #4
	bx r3
	nop
_02017BC4: .word sub_02017C78
	thumb_func_end sub_02017BBC

	thumb_func_start sub_02017BC8
sub_02017BC8: ; 0x02017BC8
	push {r3, lr}
	cmp r0, #0x18
	bne _02017BD4
	ldr r0, [r2]
	str r0, [r3]
	pop {r3, pc}
_02017BD4:
	cmp r0, #0x19
	bne _02017BE2
	ldr r1, [r1]
	ldr r0, [r2]
	add r0, r1, r0
	str r0, [r3]
	pop {r3, pc}
_02017BE2:
	cmp r0, #0x1a
	bne _02017BF0
	ldr r1, [r3]
	ldr r0, [r2]
	add r0, r1, r0
	str r0, [r3]
	pop {r3, pc}
_02017BF0:
	bl GF_AssertFail
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02017BC8

	thumb_func_start sub_02017BF8
sub_02017BF8: ; 0x02017BF8
	push {r3, lr}
	sub r0, #0x23
	cmp r0, #4
	bhi _02017C70
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02017C0C: ; jump table
	.short _02017C16 - _02017C0C - 2 ; case 0
	.short _02017C28 - _02017C0C - 2 ; case 1
	.short _02017C3A - _02017C0C - 2 ; case 2
	.short _02017C4C - _02017C0C - 2 ; case 3
	.short _02017C5E - _02017C0C - 2 ; case 4
_02017C16:
	add r0, r1, #0
	add r0, #0x3c
	str r0, [r1, #0x24]
	add r0, r2, #0
	add r0, #0x68
	str r0, [r1, #0x28]
	ldr r0, [r2, #0x68]
	str r0, [r1, #0x30]
	pop {r3, pc}
_02017C28:
	add r0, r1, #0
	add r0, #0x40
	str r0, [r1, #0x24]
	add r0, r2, #0
	add r0, #0x6c
	str r0, [r1, #0x28]
	ldr r0, [r2, #0x6c]
	str r0, [r1, #0x30]
	pop {r3, pc}
_02017C3A:
	add r0, r1, #0
	add r0, #0x44
	str r0, [r1, #0x24]
	add r0, r2, #0
	add r0, #0x70
	str r0, [r1, #0x28]
	ldr r0, [r2, #0x70]
	str r0, [r1, #0x30]
	pop {r3, pc}
_02017C4C:
	add r0, r1, #0
	add r0, #0x48
	str r0, [r1, #0x24]
	add r0, r2, #0
	add r0, #0x74
	str r0, [r1, #0x28]
	ldr r0, [r2, #0x74]
	str r0, [r1, #0x30]
	pop {r3, pc}
_02017C5E:
	add r0, r1, #0
	add r0, #0x4c
	str r0, [r1, #0x24]
	add r0, r2, #0
	add r0, #0x78
	str r0, [r1, #0x28]
	ldr r0, [r2, #0x78]
	str r0, [r1, #0x30]
	pop {r3, pc}
_02017C70:
	bl GF_AssertFail
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02017BF8

	thumb_func_start sub_02017C78
sub_02017C78: ; 0x02017C78
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r6, r1, #0
	lsl r1, r6, #0x18
	lsr r1, r1, #0x18
	add r5, r0, #0
	bl sub_02017220
	str r0, [sp, #4]
	ldr r1, [sp, #4]
	add r0, r5, #0
	add r1, #0x2c
	bl sub_02017280
	ldr r1, [sp, #4]
	add r0, r5, #0
	add r1, #0x2d
	bl sub_02017280
	mov r0, #0xc
	mul r0, r6
	ldr r1, _02017D14 ; =_020F61C0
	str r0, [sp]
	ldr r0, [r1, r0]
	mov r4, #0
	cmp r0, #0
	ble _02017CCE
	ldr r1, _02017D18 ; =_020F61BC
	ldr r0, [sp]
	add r6, r1, r0
	ldr r0, [sp, #4]
	add r7, r0, #4
_02017CB8:
	lsl r1, r4, #2
	add r0, r5, #0
	add r1, r7, r1
	bl sub_0201726C
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	ldr r0, [r6, #4]
	cmp r4, r0
	blt _02017CB8
_02017CCE:
	ldr r1, _02017D1C ; =_020F61C4
	ldr r0, [sp]
	add r2, r5, #0
	ldr r0, [r1, r0]
	lsl r1, r0, #2
	ldr r0, [sp, #4]
	add r0, r0, r1
	ldr r0, [r0, #4]
	ldr r1, [sp, #4]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_02017BF8
	ldr r0, [sp, #4]
	add r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	bne _02017D00
	ldr r0, [sp, #4]
	add r1, r5, #0
	add r2, r0, #0
	ldr r2, [r2, #0x50]
	blx r2
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_02017D00:
	ldr r0, [sp, #4]
	add r0, #0x2d
	ldrb r0, [r0]
	sub r1, r0, #1
	ldr r0, [sp, #4]
	add r0, #0x2d
	str r0, [sp, #4]
	strb r1, [r0]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02017D14: .word _020F61C0
_02017D18: .word _020F61BC
_02017D1C: .word _020F61C4
	thumb_func_end sub_02017C78

	thumb_func_start sub_02017D20
sub_02017D20: ; 0x02017D20
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x1c]
	ldr r1, [r4, #0x10]
	add r0, r0, #1
	ldr r2, [r4, #0x14]
	mul r0, r1
	add r0, r2, r0
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	ldr r0, [r4, #4]
	sub r0, #0x1e
	cmp r0, #3
	bhi _02017DAC
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02017D48: ; jump table
	.short _02017D50 - _02017D48 - 2 ; case 0
	.short _02017D64 - _02017D48 - 2 ; case 1
	.short _02017D7C - _02017D48 - 2 ; case 2
	.short _02017D92 - _02017D48 - 2 ; case 3
_02017D50:
	asr r0, r1, #4
	lsl r1, r0, #2
	ldr r0, _02017DD4 ; =FX_SinCosTable_
	ldr r2, [r4, #0xc]
	ldrsh r0, [r0, r1]
	mul r0, r2
	asr r1, r0, #0xc
	ldr r0, [r4, #0x24]
	str r1, [r0]
	b _02017DB0
_02017D64:
	asr r1, r1, #4
	lsl r1, r1, #1
	add r1, r1, #1
	lsl r2, r1, #1
	ldr r1, _02017DD4 ; =FX_SinCosTable_
	ldr r0, [r4, #0xc]
	ldrsh r1, [r1, r2]
	mul r1, r0
	ldr r0, [r4, #0x24]
	asr r1, r1, #0xc
	str r1, [r0]
	b _02017DB0
_02017D7C:
	asr r0, r1, #4
	lsl r1, r0, #2
	ldr r0, _02017DD4 ; =FX_SinCosTable_
	ldr r2, [r4, #0xc]
	ldrsh r0, [r0, r1]
	mul r0, r2
	asr r0, r0, #0xc
	neg r1, r0
	ldr r0, [r4, #0x24]
	str r1, [r0]
	b _02017DB0
_02017D92:
	asr r1, r1, #4
	lsl r1, r1, #1
	add r1, r1, #1
	lsl r2, r1, #1
	ldr r1, _02017DD4 ; =FX_SinCosTable_
	ldr r0, [r4, #0xc]
	ldrsh r1, [r1, r2]
	mul r1, r0
	asr r0, r1, #0xc
	neg r1, r0
	ldr r0, [r4, #0x24]
	str r1, [r0]
	b _02017DB0
_02017DAC:
	bl GF_AssertFail
_02017DB0:
	add r0, r4, #0
	add r0, #0x2c
	ldrb r0, [r0]
	add r1, r4, #0
	ldr r2, [r4, #0x24]
	ldr r3, [r4, #0x28]
	add r1, #0x30
	bl sub_02017BC8
	ldr r0, [r4, #0x1c]
	add r1, r0, #1
	str r1, [r4, #0x1c]
	ldr r0, [r4, #0x18]
	cmp r1, r0
	blt _02017DD2
	mov r0, #0
	str r0, [r4]
_02017DD2:
	pop {r4, pc}
	.balign 4, 0
_02017DD4: .word FX_SinCosTable_
	thumb_func_end sub_02017D20

	thumb_func_start sub_02017DD8
sub_02017DD8: ; 0x02017DD8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x1c]
	ldr r1, [r4, #0x10]
	add r0, r0, #1
	mul r0, r1
	ldr r1, [r4, #0x18]
	bl _s32_div_f
	ldr r1, [r4, #0x14]
	add r0, r1, r0
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	ldr r0, [r4, #4]
	sub r0, #0x1e
	cmp r0, #3
	bhi _02017E6A
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02017E06: ; jump table
	.short _02017E0E - _02017E06 - 2 ; case 0
	.short _02017E22 - _02017E06 - 2 ; case 1
	.short _02017E3A - _02017E06 - 2 ; case 2
	.short _02017E50 - _02017E06 - 2 ; case 3
_02017E0E:
	asr r0, r1, #4
	lsl r1, r0, #2
	ldr r0, _02017E94 ; =FX_SinCosTable_
	ldr r2, [r4, #0xc]
	ldrsh r0, [r0, r1]
	mul r0, r2
	asr r1, r0, #0xc
	ldr r0, [r4, #0x24]
	str r1, [r0]
	b _02017E6E
_02017E22:
	asr r1, r1, #4
	lsl r1, r1, #1
	add r1, r1, #1
	lsl r2, r1, #1
	ldr r1, _02017E94 ; =FX_SinCosTable_
	ldr r0, [r4, #0xc]
	ldrsh r1, [r1, r2]
	mul r1, r0
	ldr r0, [r4, #0x24]
	asr r1, r1, #0xc
	str r1, [r0]
	b _02017E6E
_02017E3A:
	asr r0, r1, #4
	lsl r1, r0, #2
	ldr r0, _02017E94 ; =FX_SinCosTable_
	ldr r2, [r4, #0xc]
	ldrsh r0, [r0, r1]
	mul r0, r2
	asr r0, r0, #0xc
	neg r1, r0
	ldr r0, [r4, #0x24]
	str r1, [r0]
	b _02017E6E
_02017E50:
	asr r1, r1, #4
	lsl r1, r1, #1
	add r1, r1, #1
	lsl r2, r1, #1
	ldr r1, _02017E94 ; =FX_SinCosTable_
	ldr r0, [r4, #0xc]
	ldrsh r1, [r1, r2]
	mul r1, r0
	asr r0, r1, #0xc
	neg r1, r0
	ldr r0, [r4, #0x24]
	str r1, [r0]
	b _02017E6E
_02017E6A:
	bl GF_AssertFail
_02017E6E:
	add r0, r4, #0
	add r0, #0x2c
	ldrb r0, [r0]
	add r1, r4, #0
	ldr r2, [r4, #0x24]
	ldr r3, [r4, #0x28]
	add r1, #0x30
	bl sub_02017BC8
	ldr r0, [r4, #0x1c]
	add r1, r0, #1
	str r1, [r4, #0x1c]
	ldr r0, [r4, #0x18]
	cmp r1, r0
	blt _02017E90
	mov r0, #0
	str r0, [r4]
_02017E90:
	pop {r4, pc}
	nop
_02017E94: .word FX_SinCosTable_
	thumb_func_end sub_02017DD8

	thumb_func_start sub_02017E98
sub_02017E98: ; 0x02017E98
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r1, [r4, #0x24]
	ldr r3, [r4, #0xc]
	ldr r2, [r4, #0x14]
	ldr r5, [r4, #8]
	mul r2, r3
	ldr r0, [r1]
	add r2, r5, r2
	add r0, r0, r2
	str r0, [r1]
	add r0, r4, #0
	add r0, #0x2c
	add r1, r4, #0
	ldrb r0, [r0]
	ldr r2, [r4, #0x24]
	ldr r3, [r4, #0x28]
	add r1, #0x30
	bl sub_02017BC8
	ldr r0, [r4, #0x14]
	add r1, r0, #1
	str r1, [r4, #0x14]
	ldr r0, [r4, #0x10]
	cmp r1, r0
	blt _02017ED0
	mov r0, #0
	str r0, [r4]
_02017ED0:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02017E98

	thumb_func_start sub_02017ED4
sub_02017ED4: ; 0x02017ED4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x10]
	add r1, r0, #1
	ldr r0, [r4, #8]
	mul r0, r1
	ldr r1, [r4, #0xc]
	bl _s32_div_f
	ldr r1, [r4, #0x24]
	str r0, [r1]
	add r0, r4, #0
	add r0, #0x2c
	add r1, r4, #0
	ldrb r0, [r0]
	ldr r2, [r4, #0x24]
	ldr r3, [r4, #0x28]
	add r1, #0x30
	bl sub_02017BC8
	ldr r0, [r4, #0x10]
	add r1, r0, #1
	str r1, [r4, #0x10]
	ldr r0, [r4, #0xc]
	cmp r1, r0
	blt _02017F0C
	mov r0, #0
	str r0, [r4]
_02017F0C:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02017ED4

	thumb_func_start sub_02017F10
sub_02017F10: ; 0x02017F10
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #8]
	mul r0, r1
	ldr r1, [r4, #0x24]
	add r2, r2, r0
	ldr r0, [r1]
	add r0, r0, r2
	str r0, [r1]
	add r0, r4, #0
	add r0, #0x2c
	ldrb r0, [r0]
	cmp r0, #0x18
	beq _02017F34
	cmp r0, #0x1a
	bne _02017F5A
_02017F34:
	cmp r2, #0
	ldr r2, [r4, #0x10]
	bge _02017F4A
	ldr r1, [r4, #0x24]
	ldr r0, [r1]
	cmp r0, r2
	bgt _02017F90
	str r2, [r1]
	mov r0, #0
	str r0, [r4]
	b _02017F90
_02017F4A:
	ldr r1, [r4, #0x24]
	ldr r0, [r1]
	cmp r0, r2
	blt _02017F90
	str r2, [r1]
	mov r0, #0
	str r0, [r4]
	b _02017F90
_02017F5A:
	cmp r0, #0x19
	bne _02017F8C
	ldr r1, [r4, #0x24]
	ldr r3, [r4, #0x30]
	ldr r0, [r1]
	add r3, r3, r0
	cmp r2, #0
	ldr r2, [r4, #0x10]
	bge _02017F7C
	cmp r3, r2
	bgt _02017F90
	sub r2, r2, r3
	add r0, r0, r2
	str r0, [r1]
	mov r0, #0
	str r0, [r4]
	b _02017F90
_02017F7C:
	cmp r3, r2
	blt _02017F90
	sub r2, r3, r2
	sub r0, r0, r2
	str r0, [r1]
	mov r0, #0
	str r0, [r4]
	b _02017F90
_02017F8C:
	bl GF_AssertFail
_02017F90:
	add r0, r4, #0
	add r0, #0x2c
	ldrb r0, [r0]
	add r1, r4, #0
	ldr r2, [r4, #0x24]
	ldr r3, [r4, #0x28]
	add r1, #0x30
	bl sub_02017BC8
	ldr r0, [r4, #0x14]
	add r0, r0, #1
	str r0, [r4, #0x14]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02017F10
