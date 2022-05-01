	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov39_02227060
ov39_02227060: ; 0x02227060
	push {r3, r4, r5, lr}
	add r4, r2, #0
	add r5, r0, #0
	add r0, r1, #0
	add r1, r4, #0
	bl ov39_0222915C
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0x5c
	bl SavArray_CalcCRC16
	add r4, #0x5c
	strh r0, [r4]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov39_02227060

	thumb_func_start ov39_02227080
ov39_02227080: ; 0x02227080
	ldr r3, _02227084 ; =ov39_02229224
	bx r3
	.balign 4, 0
_02227084: .word ov39_02229224
	thumb_func_end ov39_02227080

	thumb_func_start ov39_02227088
ov39_02227088: ; 0x02227088
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r6, r2, #0
	mov r2, #0x67
	add r5, r1, #0
	add r7, r3, #0
	str r0, [sp, #4]
	add r0, r7, #0
	mov r1, #0
	lsl r2, r2, #2
	bl MI_CpuFill8
	ldr r1, [sp, #0x28]
	mov r0, #0x3c
	bl String_ctor
	add r4, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	bl PCStorage_GetBoxName
	add r0, r4, #0
	add r1, r7, #0
	mov r2, #0x14
	bl CopyStringToU16Array
	add r0, r4, #0
	bl String_dtor
	mov r4, #0
	str r7, [sp, #0xc]
	str r7, [sp, #8]
_022270CA:
	mov r0, #0
	str r0, [sp]
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	mov r3, #5
	bl PCStorage_GetMonDataByIndexPair
	ldr r1, [sp, #0xc]
	add r2, r4, #0
	strh r0, [r1, #0x28]
	mov r0, #0
	str r0, [sp]
	add r0, r5, #0
	add r1, r6, #0
	mov r3, #0
	bl PCStorage_GetMonDataByIndexPair
	ldr r1, [sp, #8]
	add r2, r4, #0
	str r0, [r1, #0x64]
	mov r0, #0
	str r0, [sp]
	add r0, r5, #0
	add r1, r6, #0
	mov r3, #7
	bl PCStorage_GetMonDataByIndexPair
	ldr r1, [sp, #8]
	add r2, r4, #0
	add r1, #0xdc
	str r0, [r1]
	mov r0, #0
	str r0, [sp]
	add r0, r5, #0
	add r1, r6, #0
	mov r3, #0xae
	bl PCStorage_GetMonDataByIndexPair
	ldr r1, _02227180 ; =0x000001EE
	cmp r0, r1
	bne _02227130
	add r0, r1, #0
	sub r0, #0x9a
	ldr r1, [r7, r0]
	mov r0, #1
	lsl r0, r4
	orr r1, r0
	mov r0, #0x55
	lsl r0, r0, #2
	str r1, [r7, r0]
_02227130:
	mov r0, #0
	str r0, [sp]
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	mov r3, #0x70
	bl PCStorage_GetMonDataByIndexPair
	mov r1, #0x56
	add r2, r7, r4
	lsl r1, r1, #2
	strb r0, [r2, r1]
	ldr r0, [sp, #0xc]
	add r4, r4, #1
	add r0, r0, #2
	str r0, [sp, #0xc]
	ldr r0, [sp, #8]
	add r0, r0, #4
	str r0, [sp, #8]
	cmp r4, #0x1e
	blt _022270CA
	add r0, r5, #0
	add r1, r6, #0
	bl PCStorage_GetBoxWallpaper
	ldr r2, _02227184 ; =0x00000176
	mov r1, #0
	strb r0, [r7, r2]
	add r0, r2, #1
	strb r1, [r7, r0]
	ldr r0, [sp, #4]
	add r1, r7, #0
	add r2, #0x22
	bl SavArray_CalcCRC16
	mov r1, #0x66
	lsl r1, r1, #2
	strh r0, [r7, r1]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02227180: .word 0x000001EE
_02227184: .word 0x00000176
	thumb_func_end ov39_02227088

	thumb_func_start ov39_02227188
ov39_02227188: ; 0x02227188
	push {r4, lr}
	ldr r3, _022271A0 ; =0x00000177
	add r4, r1, #0
	strb r2, [r4, r3]
	add r3, #0x21
	add r2, r3, #0
	bl SavArray_CalcCRC16
	mov r1, #0x66
	lsl r1, r1, #2
	strh r0, [r4, r1]
	pop {r4, pc}
	.balign 4, 0
_022271A0: .word 0x00000177
	thumb_func_end ov39_02227188

	thumb_func_start ov39_022271A4
ov39_022271A4: ; 0x022271A4
	push {r3, r4, r5, lr}
	add r4, r2, #0
	add r5, r1, #0
	add r0, r4, #0
	mov r1, #0
	mov r2, #0x80
	bl MI_CpuFill8
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0x80
	bl MI_CpuCopy8
	pop {r3, r4, r5, pc}
	thumb_func_end ov39_022271A4

	thumb_func_start ov39_022271C0
ov39_022271C0: ; 0x022271C0
	ldr r3, _022271C8 ; =MI_CpuCopy8
	mov r2, #0x80
	bx r3
	nop
_022271C8: .word MI_CpuCopy8
	thumb_func_end ov39_022271C0

	thumb_func_start ov39_022271CC
ov39_022271CC: ; 0x022271CC
	push {r3, r4, r5, lr}
	add r4, r2, #0
	add r5, r1, #0
	add r0, r4, #0
	mov r1, #0
	mov r2, #8
	bl MI_CpuFill8
	ldrb r0, [r5, #0x19]
	mov r1, #1
	strb r0, [r4]
	ldrb r0, [r5, #0x1a]
	strb r0, [r4, #1]
	ldrb r0, [r5, #0x15]
	strb r0, [r4, #2]
	ldrb r0, [r5, #0x16]
	strb r0, [r4, #3]
	ldrh r0, [r5, #0x1c]
	strh r0, [r4, #4]
	ldrb r0, [r4, #6]
	bic r0, r1
	ldrb r1, [r5, #0x1b]
	lsl r1, r1, #0x1f
	lsr r2, r1, #0x1f
	mov r1, #1
	and r1, r2
	orr r0, r1
	strb r0, [r4, #6]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov39_022271CC

	thumb_func_start ov39_02227208
ov39_02227208: ; 0x02227208
	push {r4, r5, r6, lr}
	ldr r2, _022272E4 ; =0x00000414
	add r4, r1, #0
	mov r1, #0
	add r5, r0, #0
	bl MI_CpuFill8
	mov r0, #0x51
	add r3, r4, #0
	ldr r1, [r4, #4]
	lsl r0, r0, #2
	str r1, [r5, r0]
	ldr r1, [r4, #8]
	add r0, #0xc
	str r1, [r5]
	add r3, #0xc
	add r2, r5, r0
	mov r6, #5
_0222722C:
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	sub r6, r6, #1
	bne _0222722C
	ldr r0, [r3]
	mov r1, #0x53
	str r0, [r2]
	ldr r0, [r4, #0x3c]
	lsl r1, r1, #2
	str r0, [r5, #8]
	ldr r0, [r4, #0x38]
	ldr r2, _022272E8 ; =0x000059DC
	str r0, [r5, #4]
	mov r0, #0
	mvn r0, r0
	str r0, [r5, r1]
	mov r1, #0xfa
	lsl r1, r1, #2
	str r2, [r5, r1]
	add r1, r1, #4
	str r2, [r5, r1]
	bl ov39_0222A2C0
	add r1, r0, #0
	ldr r0, [r4, #4]
	bl AllocFromHeap
	mov r1, #0xed
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #0
	mvn r0, r0
	bl ov39_0222A2C0
	add r2, r0, #0
	mov r0, #0xed
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl MI_CpuFill8
	mov r2, #0x32
	ldr r3, [r4, #4]
	mov r0, #0
	mov r1, #0x1b
	lsl r2, r2, #4
	bl NewMsgDataFromNarc
	mov r1, #0xfd
	lsl r1, r1, #2
	str r0, [r5, r1]
	ldr r0, [r4, #4]
	bl ScrStrBufs_new
	mov r1, #0xfe
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #1
	ldr r1, [r4, #4]
	lsl r0, r0, #8
	bl String_ctor
	mov r1, #0xff
	lsl r1, r1, #2
	str r0, [r5, r1]
	ldr r0, [r4, #4]
	bl ov39_02227DEC
	mov r1, #0x63
	lsl r1, r1, #2
	str r0, [r5, r1]
	ldr r0, [r4]
	str r0, [r5, #0xc]
	mov r0, #GAME_VERSION
	strb r0, [r5, #0x10]
	mov r0, #2
	strb r0, [r5, #0x11]
	add r0, r5, #0
	add r0, #0xc
	bl ov39_0222A110
	cmp r0, #1
	beq _022272D6
	bl GF_AssertFail
_022272D6:
	mov r1, #0xf1
	mov r0, #1
	lsl r1, r1, #2
	str r0, [r5, r1]
	sub r1, #0xc
	str r0, [r5, r1]
	pop {r4, r5, r6, pc}
	.balign 4, 0
_022272E4: .word 0x00000414
_022272E8: .word 0x000059DC
	thumb_func_end ov39_02227208

	thumb_func_start ov39_022272EC
ov39_022272EC: ; 0x022272EC
	push {r4, lr}
	add r4, r0, #0
	bl ov39_0222A130
	mov r0, #0xf1
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, #0x38
	ldr r0, [r4, r0]
	bl String_dtor
	mov r0, #0xfe
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ScrStrBufs_delete
	mov r0, #0xfd
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl DestroyMsgData
	mov r0, #0xed
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl FreeToHeap
	bl ov39_02227E3C
	mov r0, #0x63
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov39_022272EC

	thumb_func_start ov39_02227334
ov39_02227334: ; 0x02227334
	push {r4, lr}
	add r4, r0, #0
	bl ov39_0222A130
	mov r0, #0xf1
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ov39_02227334

	thumb_func_start ov39_02227348
ov39_02227348: ; 0x02227348
	push {r4, lr}
	add r4, r0, #0
	bl ov00_021EC210
	bl ov00_021EC8D8
	bl sub_0203946C
	mov r0, #0xf2
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ov39_02227348

	thumb_func_start ov39_02227364
ov39_02227364: ; 0x02227364
	push {r4, lr}
	mov r1, #0x3e
	add r4, r0, #0
	lsl r1, r1, #4
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	neg r0, r0
	bl ov00_021E6A70
	mov r2, #0x3e
	lsl r2, r2, #4
	ldr r2, [r4, r2]
	add r1, r0, #0
	add r0, r4, #0
	neg r2, r2
	bl ov39_02227D5C
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ov39_02227364

	thumb_func_start ov39_0222738C
ov39_0222738C: ; 0x0222738C
	push {r3, lr}
	ldr r1, _022273AC ; =gSystem
	ldr r2, [r1, #0x48]
	mov r1, #1
	tst r1, r2
	bne _0222739E
	mov r1, #2
	tst r1, r2
	beq _022273A8
_0222739E:
	mov r1, #0
	bl ov39_02227D50
	mov r0, #1
	pop {r3, pc}
_022273A8:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_022273AC: .word gSystem
	thumb_func_end ov39_0222738C

	thumb_func_start ov39_022273B0
ov39_022273B0: ; 0x022273B0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	bl ov39_02227DB8
	cmp r0, #0
	bne _022273C4
	mov r0, #0
	pop {r4, r5, r6, pc}
_022273C4:
	mov r2, #0x19
	lsl r2, r2, #4
	ldr r0, [r5]
	add r1, r4, #0
	add r2, r5, r2
	bl ov39_022271A4
	mov r2, #0x21
	lsl r2, r2, #4
	ldr r0, [r5]
	add r1, r6, #0
	add r2, r5, r2
	bl ov39_02227060
	ldr r0, _022273F0 ; =0x00000411
	mov r1, #0x3c
	strb r1, [r5, r0]
	ldr r1, _022273F4 ; =0x00004E20
	sub r0, #0x29
	str r1, [r5, r0]
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
_022273F0: .word 0x00000411
_022273F4: .word 0x00004E20
	thumb_func_end ov39_022273B0

	thumb_func_start ov39_022273F8
ov39_022273F8: ; 0x022273F8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov39_02227DB8
	cmp r0, #0
	bne _0222740A
	mov r0, #0
	pop {r3, r4, r5, pc}
_0222740A:
	mov r0, #0xeb
	lsl r0, r0, #2
	strh r4, [r5, r0]
	ldr r1, _0222741C ; =0x00004E21
	add r0, #0x3c
	str r1, [r5, r0]
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_0222741C: .word 0x00004E21
	thumb_func_end ov39_022273F8

	thumb_func_start ov39_02227420
ov39_02227420: ; 0x02227420
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	bl ov39_02227DB8
	cmp r0, #0
	bne _02227436
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02227436:
	mov r0, #0xeb
	lsl r0, r0, #2
	strb r4, [r5, r0]
	mov r2, #0x19
	lsl r2, r2, #4
	ldr r1, [sp, #0x18]
	add r0, r0, #1
	strb r1, [r5, r0]
	ldr r0, [r5]
	add r1, r6, #0
	add r2, r5, r2
	bl ov39_022271A4
	mov r3, #0x51
	lsl r3, r3, #2
	ldr r0, [r5, r3]
	add r3, #0xcc
	str r0, [sp]
	ldr r0, [r5]
	ldr r2, [sp, #0x18]
	add r1, r7, #0
	add r3, r5, r3
	bl ov39_02227088
	mov r1, #0x21
	lsl r1, r1, #4
	ldr r0, [r5]
	add r1, r5, r1
	add r2, r4, #0
	bl ov39_02227188
	ldr r0, _02227484 ; =0x00000411
	mov r1, #0x3c
	strb r1, [r5, r0]
	ldr r1, _02227488 ; =0x00005208
	sub r0, #0x29
	str r1, [r5, r0]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02227484: .word 0x00000411
_02227488: .word 0x00005208
	thumb_func_end ov39_02227420

	thumb_func_start ov39_0222748C
ov39_0222748C: ; 0x0222748C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov39_02227DB8
	cmp r0, #0
	bne _0222749E
	mov r0, #0
	pop {r3, r4, r5, pc}
_0222749E:
	mov r0, #0xeb
	lsl r0, r0, #2
	strb r4, [r5, r0]
	ldr r1, _022274B0 ; =0x00005209
	add r0, #0x3c
	str r1, [r5, r0]
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_022274B0: .word 0x00005209
	thumb_func_end ov39_0222748C

	thumb_func_start ov39_022274B4
ov39_022274B4: ; 0x022274B4
	push {r4, lr}
	add r4, r0, #0
	bl ov39_02227DB8
	cmp r0, #0
	bne _022274C4
	mov r0, #0
	pop {r4, pc}
_022274C4:
	mov r0, #0xfa
	ldr r1, _022274D0 ; =0x000055F0
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_022274D0: .word 0x000055F0
	thumb_func_end ov39_022274B4

	thumb_func_start ov39_022274D4
ov39_022274D4: ; 0x022274D4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	add r4, r2, #0
	bl ov39_02227DB8
	cmp r0, #0
	bne _022274E8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_022274E8:
	ldr r0, [r5]
	bl Sav2_PlayerData_GetIGTAddr
	mov r1, #0x66
	lsl r1, r1, #2
	add r1, r5, r1
	mov r2, #4
	bl MI_CpuCopy8
	mov r2, #0x19
	lsl r2, r2, #4
	ldr r0, [r5]
	add r1, r6, #0
	add r2, r5, r2
	bl ov39_022271CC
	mov r0, #0x67
	lsl r0, r0, #2
	mov r6, #0
	add r7, r5, #0
	add r1, r0, #4
_02227512:
	ldr r3, [r4]
	ldr r2, [r4, #4]
	add r6, r6, #1
	str r3, [r7, r0]
	str r2, [r7, r1]
	add r4, #8
	add r7, #8
	cmp r6, #3
	blt _02227512
	mov r0, #0xfa
	ldr r1, _02227530 ; =0x000055F1
	lsl r0, r0, #2
	str r1, [r5, r0]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02227530: .word 0x000055F1
	thumb_func_end ov39_022274D4

	thumb_func_start ov39_02227534
ov39_02227534: ; 0x02227534
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov39_02227DB8
	cmp r0, #0
	bne _02227546
	mov r0, #0
	pop {r3, r4, r5, pc}
_02227546:
	bl sub_0202FBCC
	sub r1, r0, #4
	ldr r0, _02227584 ; =0x00001D4C
	cmp r1, r0
	beq _02227556
	bl GF_AssertFail
_02227556:
	bl sub_0202FC74
	mov r1, #0x19
	lsl r1, r1, #4
	str r0, [r5, r1]
	ldr r0, [r5]
	bl ov40_02244B3C
	bl sub_020307DC
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #0x80
	bl MI_CpuCopy8
	ldr r0, _02227588 ; =0x00000411
	mov r1, #0x3c
	strb r1, [r5, r0]
	ldr r1, _0222758C ; =0x000059D8
	sub r0, #0x29
	str r1, [r5, r0]
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02227584: .word 0x00001D4C
_02227588: .word 0x00000411
_0222758C: .word 0x000059D8
	thumb_func_end ov39_02227534

	thumb_func_start ov39_02227590
ov39_02227590: ; 0x02227590
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	bl ov39_02227DB8
	cmp r0, #0
	bne _022275A6
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_022275A6:
	mov r0, #0x19
	lsl r0, r0, #4
	add r0, r5, r0
	mov r1, #0
	mov r2, #0x10
	bl MI_CpuFill8
	mov r1, #0x19
	lsl r1, r1, #4
	strh r4, [r5, r1]
	add r0, r1, #2
	strb r6, [r5, r0]
	add r0, r1, #3
	strb r7, [r5, r0]
	add r0, sp, #8
	ldrb r2, [r0, #0x10]
	add r0, r1, #4
	strb r2, [r5, r0]
	add r0, r1, #0
	sub r0, #0x50
	add r1, #8
	str r0, [r5, r1]
	mov r0, #0x3f
	mov r1, #0
	lsl r0, r0, #4
	str r1, [r5, r0]
	ldr r1, _022275E4 ; =0x000059D9
	sub r0, #8
	str r1, [r5, r0]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022275E4: .word 0x000059D9
	thumb_func_end ov39_02227590

	thumb_func_start ov39_022275E8
ov39_022275E8: ; 0x022275E8
	push {r4, lr}
	add r4, r0, #0
	bl ov39_02227DB8
	cmp r0, #0
	bne _022275F8
	mov r0, #0
	pop {r4, pc}
_022275F8:
	mov r0, #0x19
	lsl r0, r0, #4
	add r0, r4, r0
	mov r1, #0
	mov r2, #0x10
	bl MI_CpuFill8
	mov r0, #0x19
	ldr r1, _02227640 ; =0x0000FFFF
	lsl r0, r0, #4
	strh r1, [r4, r0]
	mov r1, #0xfe
	add r0, r1, #0
	add r0, #0x94
	strb r1, [r4, r0]
	mov r1, #0xff
	add r0, r1, #0
	add r0, #0x94
	strb r1, [r4, r0]
	add r0, r1, #0
	add r0, #0x95
	strb r1, [r4, r0]
	add r0, r1, #0
	add r0, #0x41
	add r1, #0x99
	str r0, [r4, r1]
	mov r0, #0x3f
	mov r1, #0
	lsl r0, r0, #4
	str r1, [r4, r0]
	ldr r1, _02227644 ; =0x000059D9
	sub r0, #8
	str r1, [r4, r0]
	mov r0, #1
	pop {r4, pc}
	nop
_02227640: .word 0x0000FFFF
_02227644: .word 0x000059D9
	thumb_func_end ov39_022275E8

	thumb_func_start ov39_02227648
ov39_02227648: ; 0x02227648
	push {r4, lr}
	add r4, r0, #0
	bl ov39_02227DB8
	cmp r0, #0
	bne _02227658
	mov r0, #0
	pop {r4, pc}
_02227658:
	mov r0, #0x19
	lsl r0, r0, #4
	add r0, r4, r0
	mov r1, #0
	mov r2, #0x10
	bl MI_CpuFill8
	mov r0, #0x19
	ldr r1, _0222769C ; =0x0000FFFF
	lsl r0, r0, #4
	strh r1, [r4, r0]
	mov r1, #0xff
	add r0, r1, #0
	add r0, #0x93
	strb r1, [r4, r0]
	add r0, r1, #0
	add r0, #0x94
	strb r1, [r4, r0]
	add r0, r1, #0
	add r0, #0x95
	strb r1, [r4, r0]
	add r0, r1, #0
	add r0, #0x41
	add r1, #0x99
	str r0, [r4, r1]
	mov r0, #0x3f
	mov r1, #0
	lsl r0, r0, #4
	str r1, [r4, r0]
	ldr r1, _022276A0 ; =0x000059D9
	sub r0, #8
	str r1, [r4, r0]
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_0222769C: .word 0x0000FFFF
_022276A0: .word 0x000059D9
	thumb_func_end ov39_02227648

	thumb_func_start ov39_022276A4
ov39_022276A4: ; 0x022276A4
	push {r4, lr}
	add r4, r0, #0
	bl ov39_02227DB8
	cmp r0, #0
	bne _022276B4
	mov r0, #0
	pop {r4, pc}
_022276B4:
	mov r0, #0x19
	lsl r0, r0, #4
	add r0, r4, r0
	mov r1, #0
	mov r2, #4
	bl MI_CpuFill8
	mov r1, #5
	lsl r1, r1, #6
	add r0, r1, #0
	add r0, #0x50
	str r1, [r4, r0]
	mov r1, #0x3f
	mov r0, #1
	lsl r1, r1, #4
	str r0, [r4, r1]
	ldr r2, _022276DC ; =0x000059D9
	sub r1, #8
	str r2, [r4, r1]
	pop {r4, pc}
	.balign 4, 0
_022276DC: .word 0x000059D9
	thumb_func_end ov39_022276A4

	thumb_func_start ov39_022276E0
ov39_022276E0: ; 0x022276E0
	push {r4, lr}
	add r4, r0, #0
	bl ov39_02227DB8
	cmp r0, #0
	bne _022276F0
	mov r0, #0
	pop {r4, pc}
_022276F0:
	mov r0, #0x19
	lsl r0, r0, #4
	add r0, r4, r0
	mov r1, #0
	mov r2, #4
	bl MI_CpuFill8
	mov r1, #5
	lsl r1, r1, #6
	add r0, r1, #0
	add r0, #0x50
	str r1, [r4, r0]
	mov r0, #0x3f
	mov r1, #2
	lsl r0, r0, #4
	str r1, [r4, r0]
	ldr r1, _0222771C ; =0x000059D9
	sub r0, #8
	str r1, [r4, r0]
	mov r0, #1
	pop {r4, pc}
	nop
_0222771C: .word 0x000059D9
	thumb_func_end ov39_022276E0

	thumb_func_start ov39_02227720
ov39_02227720: ; 0x02227720
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	bl ov39_02227DB8
	cmp r0, #0
	bne _02227734
	mov r0, #0
	pop {r4, r5, r6, pc}
_02227734:
	mov r1, #0xeb
	lsl r1, r1, #2
	str r4, [r5, r1]
	add r0, r1, #4
	str r6, [r5, r0]
	ldr r0, _02227748 ; =0x000059DA
	add r1, #0x3c
	str r0, [r5, r1]
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02227748: .word 0x000059DA
	thumb_func_end ov39_02227720

	thumb_func_start ov39_0222774C
ov39_0222774C: ; 0x0222774C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	bl ov39_02227DB8
	cmp r0, #0
	bne _02227760
	mov r0, #0
	pop {r4, r5, r6, pc}
_02227760:
	mov r1, #0xeb
	lsl r1, r1, #2
	str r4, [r5, r1]
	add r0, r1, #4
	str r6, [r5, r0]
	ldr r0, _02227774 ; =0x000059DB
	add r1, #0x3c
	str r0, [r5, r1]
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02227774: .word 0x000059DB
	thumb_func_end ov39_0222774C

	thumb_func_start ov39_02227778
ov39_02227778: ; 0x02227778
	push {r4, lr}
	mov r1, #0xf1
	add r4, r0, #0
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	cmp r0, #1
	bne _02227836
	add r0, r1, #0
	add r0, #0x24
	ldr r2, [r4, r0]
	ldr r0, _022278C8 ; =0x000059DC
	cmp r2, r0
	beq _022277E4
	add r0, r1, #0
	add r0, #0x4d
	ldrb r0, [r4, r0]
	cmp r0, #0
	beq _022277AA
	add r0, r1, #0
	add r0, #0x4d
	ldrb r0, [r4, r0]
	add r1, #0x4d
	sub r0, r0, #1
	strb r0, [r4, r1]
	b _022277E4
_022277AA:
	bl ov39_0222A13C
	cmp r0, #9
	bhi _022277E4
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022277BE: ; jump table
	.short _022277E4 - _022277BE - 2 ; case 0
	.short _022277D2 - _022277BE - 2 ; case 1
	.short _022277E4 - _022277BE - 2 ; case 2
	.short _022277E4 - _022277BE - 2 ; case 3
	.short _022277E4 - _022277BE - 2 ; case 4
	.short _022277E4 - _022277BE - 2 ; case 5
	.short _022277E4 - _022277BE - 2 ; case 6
	.short _022277D2 - _022277BE - 2 ; case 7
	.short _022277D2 - _022277BE - 2 ; case 8
	.short _022277D2 - _022277BE - 2 ; case 9
_022277D2:
	add r0, r4, #0
	bl ov39_022278D4
	cmp r0, #1
	bne _022277E4
	mov r0, #0xfa
	ldr r1, _022278C8 ; =0x000059DC
	lsl r0, r0, #2
	str r1, [r4, r0]
_022277E4:
	add r0, r4, #0
	bl ov39_02227A5C
	ldr r1, _022278CC ; =0x0000040C
	ldr r2, [r4, r1]
	cmp r2, #0
	beq _02227836
	sub r1, #0xc
	add r0, r4, #0
	add r1, r4, r1
	blx r2
	cmp r0, #1
	bne _02227836
	ldr r0, _022278CC ; =0x0000040C
	mov r1, #0
	str r1, [r4, r0]
	sub r0, #0xc
	ldr r2, [r4, r0]
	cmp r2, #0
	beq _02227820
	mov r1, #0x15
	lsl r1, r1, #4
	ldr r0, [r4, r1]
	add r1, #0x2c
	add r1, r4, r1
	blx r2
	mov r0, #1
	mov r1, #0
	lsl r0, r0, #0xa
	str r1, [r4, r0]
_02227820:
	mov r0, #1
	lsl r0, r0, #0xa
	add r0, r4, r0
	mov r1, #0
	mov r2, #0x10
	bl MI_CpuFill8
	mov r0, #0xfb
	ldr r1, _022278C8 ; =0x000059DC
	lsl r0, r0, #2
	str r1, [r4, r0]
_02227836:
	mov r3, #0xef
	lsl r3, r3, #2
	ldr r0, [r4, r3]
	lsl r1, r0, #2
	ldr r0, _022278D0 ; =ov39_0222A8B4
	ldr r2, [r0, r1]
	cmp r2, #0
	beq _022278C2
	add r1, r3, #0
	add r3, r3, #4
	ldr r3, [r4, r3]
	add r1, #0x10
	lsl r3, r3, #2
	ldr r2, [r2, r3]
	add r0, r4, #0
	add r1, r4, r1
	blx r2
	cmp r0, #0
	beq _022278C2
	cmp r0, #1
	beq _02227866
	cmp r0, #2
	beq _022278AC
	b _022278C2
_02227866:
	mov r0, #0xf3
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #0
	mov r2, #0xc
	bl MI_CpuFill8
	mov r0, #0xf
	lsl r0, r0, #6
	ldr r1, [r4, r0]
	mov r2, #0xc
	add r1, r1, #1
	str r1, [r4, r0]
	add r0, #0xc
	add r0, r4, r0
	mov r1, #0
	bl MI_CpuFill8
	mov r1, #0xef
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	lsl r2, r0, #2
	ldr r0, _022278D0 ; =ov39_0222A8B4
	ldr r2, [r0, r2]
	add r0, r1, #4
	ldr r0, [r4, r0]
	lsl r0, r0, #2
	ldr r0, [r2, r0]
	cmp r0, #0
	bne _022278C2
	mov r2, #0
	add r0, r1, #4
	str r2, [r4, r0]
	str r2, [r4, r1]
	b _022278C2
_022278AC:
	mov r0, #0xf3
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #0
	mov r2, #0xc
	bl MI_CpuFill8
	mov r0, #0xf
	mov r1, #0
	lsl r0, r0, #6
	str r1, [r4, r0]
_022278C2:
	mov r0, #1
	pop {r4, pc}
	nop
_022278C8: .word 0x000059DC
_022278CC: .word 0x0000040C
_022278D0: .word ov39_0222A8B4
	thumb_func_end ov39_02227778

	thumb_func_start ov39_022278D4
ov39_022278D4: ; 0x022278D4
	push {r3, r4, r5, lr}
	mov r3, #0xfa
	add r5, r0, #0
	lsl r3, r3, #2
	ldr r1, [r5, r3]
	ldr r2, _02227A4C ; =0x000055F0
	mov r4, #0
	cmp r1, r2
	bgt _0222790C
	bge _02227986
	ldr r0, _02227A50 ; =0x00005208
	cmp r1, r0
	bgt _02227904
	bge _0222795C
	ldr r2, _02227A54 ; =0x00004E21
	cmp r1, r2
	bgt _02227902
	sub r0, r2, #1
	cmp r1, r0
	blt _02227902
	beq _02227938
	cmp r1, r2
	beq _0222794A
_02227902:
	b _02227A34
_02227904:
	add r0, r0, #1
	cmp r1, r0
	beq _02227974
	b _02227A34
_0222790C:
	ldr r0, _02227A58 ; =0x000059D8
	cmp r1, r0
	bgt _0222791C
	bge _022279A4
	add r0, r2, #1
	cmp r1, r0
	beq _02227992
	b _02227A34
_0222791C:
	add r2, r0, #3
	cmp r1, r2
	bgt _02227936
	add r2, r0, #1
	cmp r1, r2
	blt _02227936
	beq _022279B6
	add r2, r0, #2
	cmp r1, r2
	beq _02227A00
	add r0, r0, #3
	cmp r1, r0
	beq _02227A1C
_02227936:
	b _02227A34
_02227938:
	mov r0, #0x19
	sub r3, #0x34
	lsl r0, r0, #4
	ldr r1, [r5, r3]
	add r0, r5, r0
	bl ov39_0222A164
	add r4, r0, #0
	b _02227A38
_0222794A:
	add r0, r3, #0
	sub r0, #0x3c
	sub r3, #0x34
	ldrh r0, [r5, r0]
	ldr r1, [r5, r3]
	bl ov39_0222A1C0
	add r4, r0, #0
	b _02227A38
_0222795C:
	add r0, r3, #0
	sub r0, #0x3c
	mov r1, #0x19
	sub r3, #0x34
	lsl r1, r1, #4
	ldrb r0, [r5, r0]
	ldr r2, [r5, r3]
	add r1, r5, r1
	bl ov39_0222A200
	add r4, r0, #0
	b _02227A38
_02227974:
	add r0, r3, #0
	sub r0, #0x3c
	sub r3, #0x34
	ldrb r0, [r5, r0]
	ldr r1, [r5, r3]
	bl ov39_0222A268
	add r4, r0, #0
	b _02227A38
_02227986:
	sub r3, #0x34
	ldr r0, [r5, r3]
	bl ov39_0222A2CC
	add r4, r0, #0
	b _02227A38
_02227992:
	mov r0, #0x19
	sub r3, #0x34
	lsl r0, r0, #4
	ldr r1, [r5, r3]
	add r0, r5, r0
	bl ov39_0222A2EC
	add r4, r0, #0
	b _02227A38
_022279A4:
	mov r0, #0x19
	lsl r0, r0, #4
	sub r3, #0x34
	ldr r0, [r5, r0]
	ldr r1, [r5, r3]
	bl ov39_0222A33C
	add r4, r0, #0
	b _02227A38
_022279B6:
	add r0, r3, #0
	add r0, #8
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _022279CA
	cmp r0, #1
	beq _022279DC
	cmp r0, #2
	beq _022279EE
	b _02227A38
_022279CA:
	mov r0, #0x19
	sub r3, #0x34
	lsl r0, r0, #4
	ldr r1, [r5, r3]
	add r0, r5, r0
	bl ov39_0222A394
	add r4, r0, #0
	b _02227A38
_022279DC:
	mov r0, #0x19
	sub r3, #0x34
	lsl r0, r0, #4
	ldr r1, [r5, r3]
	add r0, r5, r0
	bl ov39_0222A3DC
	add r4, r0, #0
	b _02227A38
_022279EE:
	mov r0, #0x19
	sub r3, #0x34
	lsl r0, r0, #4
	ldr r1, [r5, r3]
	add r0, r5, r0
	bl ov39_0222A434
	add r4, r0, #0
	b _02227A38
_02227A00:
	add r0, r3, #0
	add r1, r3, #0
	sub r0, #0x3c
	sub r1, #0x38
	sub r3, #0x34
	mov r2, #5
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r3, [r5, r3]
	lsl r2, r2, #6
	bl ov39_0222A48C
	add r4, r0, #0
	b _02227A38
_02227A1C:
	add r0, r3, #0
	add r1, r3, #0
	sub r0, #0x3c
	sub r1, #0x38
	sub r3, #0x34
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r2, [r5, r3]
	bl ov39_0222A4C0
	add r4, r0, #0
	b _02227A38
_02227A34:
	bl GF_AssertFail
_02227A38:
	cmp r4, #1
	bne _02227A46
	mov r0, #0xfa
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	add r0, r0, #4
	str r1, [r5, r0]
_02227A46:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_02227A4C: .word 0x000055F0
_02227A50: .word 0x00005208
_02227A54: .word 0x00004E21
_02227A58: .word 0x000059D8
	thumb_func_end ov39_022278D4

	thumb_func_start ov39_02227A5C
ov39_02227A5C: ; 0x02227A5C
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xfb
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	ldr r0, _02227B0C ; =0x000059DC
	cmp r1, r0
	bne _02227A70
	mov r0, #1
	pop {r4, pc}
_02227A70:
	bl ov39_0222A13C
	mov r1, #0x52
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r0, r1, #4
	ldr r2, [r4, r1]
	ldr r0, [r4, r0]
	cmp r2, r0
	beq _02227B06
	cmp r2, #9
	bhi _02227AFC
	add r0, r2, r2
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02227A94: ; jump table
	.short _02227AFC - _02227A94 - 2 ; case 0
	.short _02227AFC - _02227A94 - 2 ; case 1
	.short _02227AFC - _02227A94 - 2 ; case 2
	.short _02227AFC - _02227A94 - 2 ; case 3
	.short _02227AFC - _02227A94 - 2 ; case 4
	.short _02227AFC - _02227A94 - 2 ; case 5
	.short _02227AFC - _02227A94 - 2 ; case 6
	.short _02227AA8 - _02227A94 - 2 ; case 7
	.short _02227ACC - _02227A94 - 2 ; case 8
	.short _02227ADA - _02227A94 - 2 ; case 9
_02227AA8:
	add r0, r1, #0
	mov r3, #1
	add r0, #0x38
	str r3, [r4, r0]
	add r0, r1, #0
	mov r2, #0
	add r0, #0x3c
	str r2, [r4, r0]
	add r0, r1, #0
	mov r2, #7
	add r0, #0x40
	str r2, [r4, r0]
	add r1, #0x34
	str r3, [r4, r1]
	ldr r1, _02227B10 ; =ov39_02227B58
	ldr r0, _02227B14 ; =0x0000040C
	str r1, [r4, r0]
	b _02227AFC
_02227ACC:
	ldr r1, _02227B18 ; =ov39_02227B1C
	ldr r0, _02227B14 ; =0x0000040C
	str r1, [r4, r0]
	add r0, r4, #0
	bl ov39_02227B5C
	b _02227AFC
_02227ADA:
	add r0, r1, #0
	mov r2, #0
	add r0, #0x38
	str r2, [r4, r0]
	add r1, #0x3c
	str r2, [r4, r1]
	bl ov39_0222A158
	mov r1, #0x62
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #1
	sub r1, #0xc
	str r0, [r4, r1]
	ldr r1, _02227B10 ; =ov39_02227B58
	ldr r0, _02227B14 ; =0x0000040C
	str r1, [r4, r0]
_02227AFC:
	mov r0, #0x52
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	add r0, r0, #4
	str r1, [r4, r0]
_02227B06:
	mov r0, #1
	pop {r4, pc}
	nop
_02227B0C: .word 0x000059DC
_02227B10: .word ov39_02227B58
_02227B14: .word 0x0000040C
_02227B18: .word ov39_02227B1C
	thumb_func_end ov39_02227A5C

	thumb_func_start ov39_02227B1C
ov39_02227B1C: ; 0x02227B1C
	mov r0, #1
	bx lr
	thumb_func_end ov39_02227B1C

	thumb_func_start ov39_02227B20
ov39_02227B20: ; 0x02227B20
	mov r0, #1
	bx lr
	thumb_func_end ov39_02227B20

	thumb_func_start ov39_02227B24
ov39_02227B24: ; 0x02227B24
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	bl ov39_0222A2B4
	add r2, r0, #0
	add r0, r4, #6
	str r0, [sp]
	ldr r1, [r2, #4]
	ldr r0, [r5]
	ldr r2, [r2, #8]
	add r3, r4, #4
	bl ov40_02244B70
	sub r0, r0, #2
	cmp r0, #1
	bhi _02227B4A
	mov r0, #1
	pop {r3, r4, r5, pc}
_02227B4A:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov39_02227B24

	thumb_func_start ov39_02227B50
ov39_02227B50: ; 0x02227B50
	mov r0, #1
	bx lr
	thumb_func_end ov39_02227B50

	thumb_func_start ov39_02227B54
ov39_02227B54: ; 0x02227B54
	mov r0, #1
	bx lr
	thumb_func_end ov39_02227B54

	thumb_func_start ov39_02227B58
ov39_02227B58: ; 0x02227B58
	mov r0, #1
	bx lr
	thumb_func_end ov39_02227B58

	thumb_func_start ov39_02227B5C
ov39_02227B5C: ; 0x02227B5C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r6, #1
	bl ov39_0222A2B4
	add r4, r0, #0
	bl ov39_0222A2A8
	mov r0, #0xfb
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	ldrh r0, [r4]
	cmp r1, r0
	beq _02227B7C
	bl GF_AssertFail
_02227B7C:
	mov r0, #1
	mov r1, #0
	lsl r0, r0, #0xa
	str r1, [r5, r0]
	ldrh r1, [r4]
	ldr r0, _02227D14 ; =0x00005209
	cmp r1, r0
	bgt _02227BAE
	bge _02227C34
	ldr r2, _02227D18 ; =0x00004E21
	cmp r1, r2
	bgt _02227BA6
	sub r0, r2, #1
	cmp r1, r0
	blt _02227BA2
	beq _02227BE4
	cmp r1, r2
	beq _02227C00
	b _02227CE6
_02227BA2:
	cmp r1, #0
	b _02227CE6
_02227BA6:
	sub r0, r0, #1
	cmp r1, r0
	beq _02227C18
	b _02227CE6
_02227BAE:
	ldr r0, _02227D1C ; =0x000055F1
	cmp r1, r0
	bgt _02227BBE
	bge _02227C64
	sub r0, r0, #1
	cmp r1, r0
	beq _02227C4C
	b _02227CE6
_02227BBE:
	ldr r0, _02227D20 ; =0x000059D8
	cmp r1, r0
	bgt _02227BC8
	beq _02227C7C
	b _02227CE6
_02227BC8:
	add r2, r0, #3
	cmp r1, r2
	bgt _02227BE2
	add r2, r0, #1
	cmp r1, r2
	blt _02227BE2
	beq _02227CA0
	add r2, r0, #2
	cmp r1, r2
	beq _02227CB8
	add r0, r0, #3
	cmp r1, r0
	beq _02227CD0
_02227BE2:
	b _02227CE6
_02227BE4:
	add r0, r5, #0
	add r1, r4, #0
	bl ov39_02227E48
	add r6, r0, #0
	ldr r0, _02227D24 ; =0x00000154
	ldr r1, [r5, r0]
	ldr r0, _02227D28 ; =0x00000400
	str r1, [r5, r0]
	bne _02227CE6
	ldr r1, _02227D2C ; =ov39_02227B50
	add r0, #0xc
	str r1, [r5, r0]
	b _02227CE6
_02227C00:
	add r0, r5, #0
	add r1, r4, #0
	bl ov39_02227E6C
	add r6, r0, #0
	mov r0, #0x56
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	mov r0, #1
	lsl r0, r0, #0xa
	str r1, [r5, r0]
	b _02227CE6
_02227C18:
	add r0, r5, #0
	add r1, r4, #0
	bl ov39_02227ECC
	add r6, r0, #0
	ldr r0, _02227D30 ; =0x0000015C
	ldr r1, [r5, r0]
	ldr r0, _02227D28 ; =0x00000400
	str r1, [r5, r0]
	bne _02227CE6
	ldr r1, _02227D34 ; =ov39_02227B54
	add r0, #0xc
	str r1, [r5, r0]
	b _02227CE6
_02227C34:
	add r0, r5, #0
	add r1, r4, #0
	bl ov39_02227EF4
	add r6, r0, #0
	mov r0, #0x16
	lsl r0, r0, #4
	ldr r1, [r5, r0]
	mov r0, #1
	lsl r0, r0, #0xa
	str r1, [r5, r0]
	b _02227CE6
_02227C4C:
	add r0, r5, #0
	add r1, r4, #0
	bl ov39_02227F60
	add r6, r0, #0
	mov r0, #0x59
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	mov r0, #1
	lsl r0, r0, #0xa
	str r1, [r5, r0]
	b _02227CE6
_02227C64:
	add r0, r5, #0
	add r1, r4, #0
	bl ov39_02227F84
	add r6, r0, #0
	mov r0, #0x5a
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	mov r0, #1
	lsl r0, r0, #0xa
	str r1, [r5, r0]
	b _02227CE6
_02227C7C:
	add r0, r5, #0
	add r1, r4, #0
	bl ov39_02227FC4
	add r6, r0, #0
	ldr r0, _02227D38 ; =0x0000016C
	ldr r1, [r5, r0]
	ldr r0, _02227D28 ; =0x00000400
	str r1, [r5, r0]
	bne _02227C98
	ldr r1, _02227D3C ; =ov39_02227B20
	add r0, #0xc
	str r1, [r5, r0]
	b _02227CE6
_02227C98:
	ldr r1, _02227D40 ; =ov39_02227B24
	add r0, #0xc
	str r1, [r5, r0]
	b _02227CE6
_02227CA0:
	add r0, r5, #0
	add r1, r4, #0
	bl ov39_02227FFC
	add r6, r0, #0
	mov r0, #0x17
	lsl r0, r0, #4
	ldr r1, [r5, r0]
	mov r0, #1
	lsl r0, r0, #0xa
	str r1, [r5, r0]
	b _02227CE6
_02227CB8:
	add r0, r5, #0
	add r1, r4, #0
	bl ov39_022280B4
	add r6, r0, #0
	mov r0, #0x5d
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	mov r0, #1
	lsl r0, r0, #0xa
	str r1, [r5, r0]
	b _02227CE6
_02227CD0:
	add r0, r5, #0
	add r1, r4, #0
	bl ov39_02228120
	add r6, r0, #0
	mov r0, #0x5e
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	mov r0, #1
	lsl r0, r0, #0xa
	str r1, [r5, r0]
_02227CE6:
	cmp r6, #0
	bne _02227D06
	mov r0, #6
	mov r1, #2
	lsl r0, r0, #6
	str r1, [r5, r0]
	ldrh r2, [r4]
	add r1, r0, #4
	str r2, [r5, r1]
	add r1, r0, #0
	ldrh r2, [r4, #2]
	add r1, #8
	sub r0, r0, #4
	str r2, [r5, r1]
	mov r1, #1
	b _02227D0C
_02227D06:
	mov r0, #0x5f
	mov r1, #0
	lsl r0, r0, #2
_02227D0C:
	str r1, [r5, r0]
	add r0, r6, #0
	pop {r4, r5, r6, pc}
	nop
_02227D14: .word 0x00005209
_02227D18: .word 0x00004E21
_02227D1C: .word 0x000055F1
_02227D20: .word 0x000059D8
_02227D24: .word 0x00000154
_02227D28: .word 0x00000400
_02227D2C: .word ov39_02227B50
_02227D30: .word 0x0000015C
_02227D34: .word ov39_02227B54
_02227D38: .word 0x0000016C
_02227D3C: .word ov39_02227B20
_02227D40: .word ov39_02227B24
	thumb_func_end ov39_02227B5C

	thumb_func_start ov39_02227D44
ov39_02227D44: ; 0x02227D44
	mov r2, #0x5f
	lsl r2, r2, #2
	add r0, r0, r2
	str r0, [r1]
	ldr r0, [r0]
	bx lr
	thumb_func_end ov39_02227D44

	thumb_func_start ov39_02227D50
ov39_02227D50: ; 0x02227D50
	push {r3, lr}
	add r2, r0, #0
	ldr r0, [r2, #8]
	ldr r2, [r2, #4]
	blx r2
	pop {r3, pc}
	thumb_func_end ov39_02227D50

	thumb_func_start ov39_02227D5C
ov39_02227D5C: ; 0x02227D5C
	push {r3, r4, r5, lr}
	sub sp, #8
	add r4, r0, #0
	mov r0, #0
	add r5, r1, #0
	mvn r0, r0
	cmp r5, r0
	bne _02227D6E
	mov r5, #0xb
_02227D6E:
	mov r0, #2
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0xfe
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	mov r3, #5
	bl BufferIntegerAsString
	mov r0, #0xfd
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r1, r5, #0
	bl NewString_ReadMsgData
	mov r1, #0xfe
	add r5, r0, #0
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	add r2, r5, #0
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	mov r1, #0xff
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	add r0, r4, #0
	bl ov39_02227D50
	add sp, #8
	pop {r3, r4, r5, pc}
	thumb_func_end ov39_02227D5C

	thumb_func_start ov39_02227DB8
ov39_02227DB8: ; 0x02227DB8
	push {r4, lr}
	add r4, r0, #0
	bl ov39_02227DE4
	cmp r0, #0
	bne _02227DDC
	mov r0, #0xfa
	lsl r0, r0, #2
	ldr r2, [r4, r0]
	ldr r1, _02227DE0 ; =0x000059DC
	cmp r2, r1
	bne _02227DDC
	add r0, r0, #4
	ldr r0, [r4, r0]
	cmp r0, r1
	bne _02227DDC
	mov r0, #1
	pop {r4, pc}
_02227DDC:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_02227DE0: .word 0x000059DC
	thumb_func_end ov39_02227DB8

	thumb_func_start ov39_02227DE4
ov39_02227DE4: ; 0x02227DE4
	mov r1, #0xef
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	bx lr
	thumb_func_end ov39_02227DE4

	thumb_func_start ov39_02227DEC
ov39_02227DEC: ; 0x02227DEC
	push {r4, r5, r6, lr}
	mov r1, #2
	lsl r1, r1, #0xc
	bl AllocFromHeap
	add r5, r0, #0
	mov r6, #2
	lsl r6, r6, #0xc
	mov r0, #0
	add r1, r5, #0
	add r2, r5, r6
	mov r3, #1
	bl OS_InitAlloc
	add r4, r0, #0
	mov r0, #0
	add r1, r4, #0
	bl OS_SetArenaLo
	add r2, r5, r6
	add r4, #0x1f
	mov r0, #0x1f
	bic r4, r0
	add r2, #0x1f
	bic r2, r0
	mov r0, #0
	add r1, r4, #0
	bl OS_CreateHeap
	add r1, r0, #0
	ldr r0, _02227E38 ; =_0222AB80
	str r1, [r0]
	mov r0, #0
	bl OS_SetCurrentHeap
	add r0, r5, #0
	pop {r4, r5, r6, pc}
	nop
_02227E38: .word _0222AB80
	thumb_func_end ov39_02227DEC

	thumb_func_start ov39_02227E3C
ov39_02227E3C: ; 0x02227E3C
	ldr r3, _02227E44 ; =OS_ClearAlloc
	mov r0, #0
	bx r3
	nop
_02227E44: .word OS_ClearAlloc
	thumb_func_end ov39_02227E3C

	thumb_func_start ov39_02227E48
ov39_02227E48: ; 0x02227E48
	ldrh r1, [r1, #2]
	mov r0, #0
	cmp r1, #5
	bhi _02227E6A
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02227E5C: ; jump table
	.short _02227E68 - _02227E5C - 2 ; case 0
	.short _02227E6A - _02227E5C - 2 ; case 1
	.short _02227E6A - _02227E5C - 2 ; case 2
	.short _02227E6A - _02227E5C - 2 ; case 3
	.short _02227E6A - _02227E5C - 2 ; case 4
	.short _02227E6A - _02227E5C - 2 ; case 5
_02227E68:
	mov r0, #1
_02227E6A:
	bx lr
	thumb_func_end ov39_02227E48

	thumb_func_start ov39_02227E6C
ov39_02227E6C: ; 0x02227E6C
	ldrh r1, [r1, #2]
	mov r0, #0
	cmp r1, #3
	bhi _02227E8A
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02227E80: ; jump table
	.short _02227E88 - _02227E80 - 2 ; case 0
	.short _02227E8A - _02227E80 - 2 ; case 1
	.short _02227E8A - _02227E80 - 2 ; case 2
	.short _02227E8A - _02227E80 - 2 ; case 3
_02227E88:
	mov r0, #1
_02227E8A:
	bx lr
	thumb_func_end ov39_02227E6C

	thumb_func_start ov39_02227E8C
ov39_02227E8C: ; 0x02227E8C
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r4, r2, #0
	bl ov39_0222A2B4
	add r1, r0, #4
	ldr r0, [r0, #4]
	cmp r0, r4
	ble _02227EA0
	add r0, r4, #0
_02227EA0:
	add r3, r1, #4
	mov r2, #0
	cmp r0, #0
	ble _02227EB8
	add r6, r5, #0
_02227EAA:
	add r1, r3, #0
	add r1, #0xc
	add r2, r2, #1
	stmia r6!, {r1}
	add r3, #0xec
	cmp r2, r0
	blt _02227EAA
_02227EB8:
	cmp r2, r4
	bge _02227ECA
	lsl r1, r2, #2
	add r3, r5, r1
	mov r1, #0
_02227EC2:
	add r2, r2, #1
	stmia r3!, {r1}
	cmp r2, r4
	blt _02227EC2
_02227ECA:
	pop {r4, r5, r6, pc}
	thumb_func_end ov39_02227E8C

	thumb_func_start ov39_02227ECC
ov39_02227ECC: ; 0x02227ECC
	ldrh r1, [r1, #2]
	mov r0, #0
	cmp r1, #6
	bhi _02227EF0
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02227EE0: ; jump table
	.short _02227EEE - _02227EE0 - 2 ; case 0
	.short _02227EF0 - _02227EE0 - 2 ; case 1
	.short _02227EF0 - _02227EE0 - 2 ; case 2
	.short _02227EF0 - _02227EE0 - 2 ; case 3
	.short _02227EF0 - _02227EE0 - 2 ; case 4
	.short _02227EF0 - _02227EE0 - 2 ; case 5
	.short _02227EF0 - _02227EE0 - 2 ; case 6
_02227EEE:
	mov r0, #1
_02227EF0:
	bx lr
	.balign 4, 0
	thumb_func_end ov39_02227ECC

	thumb_func_start ov39_02227EF4
ov39_02227EF4: ; 0x02227EF4
	ldrh r1, [r1, #2]
	mov r0, #0
	cmp r1, #3
	bhi _02227F12
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02227F08: ; jump table
	.short _02227F10 - _02227F08 - 2 ; case 0
	.short _02227F12 - _02227F08 - 2 ; case 1
	.short _02227F12 - _02227F08 - 2 ; case 2
	.short _02227F12 - _02227F08 - 2 ; case 3
_02227F10:
	mov r0, #1
_02227F12:
	bx lr
	thumb_func_end ov39_02227EF4

	thumb_func_start ov39_02227F14
ov39_02227F14: ; 0x02227F14
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	add r5, r2, #0
	bl ov39_0222A2B4
	ldr r4, [r0, #4]
	add r7, r0, #4
	cmp r4, r5
	ble _02227F2C
	add r4, r5, #0
	bl GF_AssertFail
_02227F2C:
	add r3, r7, #4
	mov r2, #0
	cmp r4, #0
	ble _02227F48
	mov r0, #0x8b
	add r7, r6, #0
	lsl r0, r0, #2
_02227F3A:
	add r1, r3, #0
	add r1, #0x10
	add r2, r2, #1
	stmia r7!, {r1}
	add r3, r3, r0
	cmp r2, r4
	blt _02227F3A
_02227F48:
	cmp r2, r5
	bge _02227F5A
	lsl r0, r2, #2
	add r1, r6, r0
	mov r0, #0
_02227F52:
	add r2, r2, #1
	stmia r1!, {r0}
	cmp r2, r5
	blt _02227F52
_02227F5A:
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov39_02227F14

	thumb_func_start ov39_02227F60
ov39_02227F60: ; 0x02227F60
	ldrh r1, [r1, #2]
	mov r0, #0
	cmp r1, #0
	beq _02227F70
	cmp r1, #1
	beq _02227F72
	cmp r1, #2
	bx lr
_02227F70:
	mov r0, #1
_02227F72:
	bx lr
	thumb_func_end ov39_02227F60

	thumb_func_start ov39_02227F74
ov39_02227F74: ; 0x02227F74
	push {r4, lr}
	add r4, r1, #0
	bl ov39_0222A2B4
	add r0, r0, #4
	str r0, [r4]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov39_02227F74

	thumb_func_start ov39_02227F84
ov39_02227F84: ; 0x02227F84
	ldrh r1, [r1, #2]
	mov r0, #0
	cmp r1, #5
	bhi _02227FA6
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02227F98: ; jump table
	.short _02227FA4 - _02227F98 - 2 ; case 0
	.short _02227FA6 - _02227F98 - 2 ; case 1
	.short _02227FA6 - _02227F98 - 2 ; case 2
	.short _02227FA6 - _02227F98 - 2 ; case 3
	.short _02227FA6 - _02227F98 - 2 ; case 4
	.short _02227FA6 - _02227F98 - 2 ; case 5
_02227FA4:
	mov r0, #1
_02227FA6:
	bx lr
	thumb_func_end ov39_02227F84

	thumb_func_start ov39_02227FA8
ov39_02227FA8: ; 0x02227FA8
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r2, #0
	bl ov39_0222A2B4
	add r1, r0, #4
	ldr r0, _02227FC0 ; =0x00000558
	str r1, [r5]
	add r0, r1, r0
	str r0, [r4]
	pop {r3, r4, r5, pc}
	nop
_02227FC0: .word 0x00000558
	thumb_func_end ov39_02227FA8

	thumb_func_start ov39_02227FC4
ov39_02227FC4: ; 0x02227FC4
	ldrh r1, [r1, #2]
	mov r0, #0
	cmp r1, #7
	bhi _02227FEA
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02227FD8: ; jump table
	.short _02227FE8 - _02227FD8 - 2 ; case 0
	.short _02227FEA - _02227FD8 - 2 ; case 1
	.short _02227FEA - _02227FD8 - 2 ; case 2
	.short _02227FEA - _02227FD8 - 2 ; case 3
	.short _02227FEA - _02227FD8 - 2 ; case 4
	.short _02227FEA - _02227FD8 - 2 ; case 5
	.short _02227FEA - _02227FD8 - 2 ; case 6
	.short _02227FEA - _02227FD8 - 2 ; case 7
_02227FE8:
	mov r0, #1
_02227FEA:
	bx lr
	thumb_func_end ov39_02227FC4

	thumb_func_start ov39_02227FEC
ov39_02227FEC: ; 0x02227FEC
	push {r3, lr}
	bl ov39_0222A2B4
	ldr r2, [r0, #4]
	ldr r1, [r0, #8]
	add r0, r2, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov39_02227FEC

	thumb_func_start ov39_02227FFC
ov39_02227FFC: ; 0x02227FFC
	ldrh r1, [r1, #2]
	mov r0, #0
	cmp r1, #3
	bhi _0222801A
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02228010: ; jump table
	.short _02228018 - _02228010 - 2 ; case 0
	.short _0222801A - _02228010 - 2 ; case 1
	.short _0222801A - _02228010 - 2 ; case 2
	.short _0222801A - _02228010 - 2 ; case 3
_02228018:
	mov r0, #1
_0222801A:
	bx lr
	thumb_func_end ov39_02227FFC

	thumb_func_start ov39_0222801C
ov39_0222801C: ; 0x0222801C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r2, [sp, #8]
	str r0, [sp]
	str r1, [sp, #4]
	bl ov39_0222A2B4
	ldr r1, [r0, #4]
	add r4, r0, #4
	ldr r0, [sp, #8]
	str r1, [sp, #0xc]
	cmp r1, r0
	ble _0222803C
	str r0, [sp, #0xc]
	bl GF_AssertFail
_0222803C:
	ldr r0, [sp, #0xc]
	add r5, r4, #4
	mov r6, #0
	cmp r0, #0
	ble _02228096
	ldr r4, [sp, #4]
_02228048:
	add r2, r5, #0
	add r2, #0xc
	add r3, r2, #0
	str r2, [r4]
	add r3, #0xd8
	ldr r3, [r3]
	ldr r0, [r5, #8]
	mov ip, r3
	add r3, r2, #0
	add r3, #0xdc
	ldr r3, [r3]
	add r7, r0, #0
	eor r7, r3
	ldr r1, [r5, #4]
	mov r3, ip
	eor r3, r1
	orr r3, r7
	beq _0222808A
	add r3, r2, #0
	add r3, #0xd8
	str r1, [r3]
	add r2, #0xdc
	str r0, [r2]
	ldr r0, [sp]
	ldr r1, [r4]
	ldr r0, [r0]
	add r1, #0x80
	mov r2, #0x58
	bl SavArray_CalcCRC16
	ldr r1, [r4]
	add r1, #0xe0
	strh r0, [r1]
_0222808A:
	ldr r0, [sp, #0xc]
	add r6, r6, #1
	add r5, #0xf0
	add r4, r4, #4
	cmp r6, r0
	blt _02228048
_02228096:
	ldr r0, [sp, #8]
	cmp r6, r0
	bge _022280AE
	ldr r0, [sp, #4]
	lsl r1, r6, #2
	add r2, r0, r1
	mov r1, #0
_022280A4:
	ldr r0, [sp, #8]
	add r6, r6, #1
	stmia r2!, {r1}
	cmp r6, r0
	blt _022280A4
_022280AE:
	ldr r0, [sp, #0xc]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov39_0222801C

	thumb_func_start ov39_022280B4
ov39_022280B4: ; 0x022280B4
	ldrh r1, [r1, #2]
	mov r0, #0
	cmp r1, #3
	bhi _022280D2
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_022280C8: ; jump table
	.short _022280D0 - _022280C8 - 2 ; case 0
	.short _022280D2 - _022280C8 - 2 ; case 1
	.short _022280D2 - _022280C8 - 2 ; case 2
	.short _022280D2 - _022280C8 - 2 ; case 3
_022280D0:
	mov r0, #1
_022280D2:
	bx lr
	thumb_func_end ov39_022280B4

	thumb_func_start ov39_022280D4
ov39_022280D4: ; 0x022280D4
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r5, r1, #0
	bl ov39_0222A2B4
	add r4, r0, #0
	add r0, r4, #4
	add r0, #0xc
	str r0, [r5]
	add r0, r4, #4
	add r0, #0xe4
	ldr r1, [r0]
	add r0, r4, #4
	add r0, #0xe8
	ldr r3, [r4, #8]
	ldr r2, [r4, #0xc]
	ldr r0, [r0]
	eor r1, r3
	eor r0, r2
	orr r0, r1
	beq _0222811C
	add r0, r4, #4
	add r0, #0xe4
	str r3, [r0]
	add r0, r4, #4
	add r0, #0xe8
	str r2, [r0]
	ldr r1, [r5]
	ldr r0, [r6]
	add r1, #0x80
	mov r2, #0x58
	bl SavArray_CalcCRC16
	ldr r1, [r5]
	add r1, #0xe0
	strh r0, [r1]
_0222811C:
	ldr r0, [r4, #8]
	pop {r4, r5, r6, pc}
	thumb_func_end ov39_022280D4

	thumb_func_start ov39_02228120
ov39_02228120: ; 0x02228120
	ldrh r1, [r1, #2]
	mov r0, #0
	cmp r1, #3
	bhi _0222813E
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02228134: ; jump table
	.short _0222813C - _02228134 - 2 ; case 0
	.short _0222813E - _02228134 - 2 ; case 1
	.short _0222813E - _02228134 - 2 ; case 2
	.short _0222813E - _02228134 - 2 ; case 3
_0222813C:
	mov r0, #1
_0222813E:
	bx lr
	thumb_func_end ov39_02228120

	thumb_func_start ov39_02228140
ov39_02228140: ; 0x02228140
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r0, #0
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	bl GX_DisableEngineALayers
	bl GX_DisableEngineBLayers
	mov r1, #1
	lsl r1, r1, #0x1a
	ldr r0, [r1]
	ldr r2, _022282EC ; =0xFFFFE0FF
	and r0, r2
	str r0, [r1]
	ldr r0, _022282F0 ; =0x04001000
	ldr r3, [r0]
	and r2, r3
	str r2, [r0]
	ldr r3, [r1]
	ldr r2, _022282F4 ; =0xFFFF1FFF
	and r3, r2
	str r3, [r1]
	ldr r3, [r0]
	add r1, #0x50
	and r2, r3
	str r2, [r0]
	mov r2, #0
	strh r2, [r1]
	add r0, #0x50
	strh r2, [r0]
	mov r2, #5
	mov r0, #3
	mov r1, #0x7c
	lsl r2, r2, #0x10
	bl CreateHeap
	mov r1, #0xf6
	add r0, r4, #0
	lsl r1, r1, #2
	mov r2, #0x7c
	bl OverlayManager_CreateAndGetData
	mov r2, #0xf6
	mov r1, #0
	lsl r2, r2, #2
	add r5, r0, #0
	bl MI_CpuFill8
	add r0, r4, #0
	bl OverlayManager_GetParentWork
	str r0, [r5]
	mov r0, #0x7c
	bl BgConfig_Alloc
	str r0, [r5, #4]
	mov r0, #0x40
	mov r1, #0x7c
	bl GF_CreateVramTransferManager
	mov r0, #4
	mov r1, #8
	bl SetKeyRepeatTimers
	ldr r0, [r5, #4]
	bl ov39_02228440
	bl sub_020210BC
	mov r0, #4
	bl sub_02021148
	mov r0, #0xb
	mov r1, #0x40
	mov r2, #0x7c
	bl ScrStrBufs_new_custom
	str r0, [r5, #0x20]
	ldr r2, _022282F8 ; =0x00000307
	mov r0, #0
	mov r1, #0x1b
	mov r3, #0x7c
	bl NewMsgDataFromNarc
	str r0, [r5, #0x24]
	ldr r2, _022282FC ; =0x0000030A
	mov r0, #0
	mov r1, #0x1b
	mov r3, #0x7c
	bl NewMsgDataFromNarc
	mov r2, #0x32
	str r0, [r5, #0x28]
	mov r0, #0
	mov r1, #0x1b
	lsl r2, r2, #4
	mov r3, #0x7c
	bl NewMsgDataFromNarc
	str r0, [r5, #0x2c]
	mov r0, #0xb4
	mov r1, #0x7c
	bl String_ctor
	str r0, [r5, #0x34]
	mov r0, #1
	lsl r0, r0, #8
	mov r1, #0x7c
	bl String_ctor
	str r0, [r5, #0x3c]
	ldr r0, [r5, #0x24]
	mov r1, #0x1f
	bl NewString_ReadMsgData
	str r0, [r5, #0x38]
	add r0, r5, #0
	bl ov39_022285CC
	add r0, r5, #0
	bl ov39_022288A0
	mov r0, #6
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #0x7c
	str r0, [sp, #8]
	mov r0, #0
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineAToggleLayers
	mov r0, #2
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineBToggleLayers
	mov r0, #2
	mov r1, #1
	bl GX_EngineBToggleLayers
	ldr r0, _02228300 ; =gSystem + 0x60
	mov r1, #1
	strb r1, [r0, #9]
	bl GX_SwapDisplay
	mov r0, #1
	bl TextFlags_SetCanABSpeedUpPrint
	mov r0, #0
	bl sub_02002B50
	mov r0, #1
	bl sub_02002B8C
	ldr r0, _02228304 ; =ov39_02228418
	add r1, r5, #0
	bl Main_SetVBlankIntrCB
	ldr r1, [r5]
	ldr r0, [r1, #4]
	cmp r0, #0
	beq _022282B8
	bl sub_0203A880
	add r0, r5, #0
	mov r1, #0xd
	mov r2, #8
	bl ov39_02228B6C
	b _022282CA
_022282B8:
	ldr r0, [r1]
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _022282C6
	mov r0, #1
	str r0, [r5, #8]
	b _022282CA
_022282C6:
	mov r0, #0
	str r0, [r5, #8]
_022282CA:
	ldr r0, [r5]
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bl Sav2_PlayerData_GetOptionsAddr
	bl Options_GetTextFrameDelay
	add r1, r5, #0
	add r1, #0x90
	str r0, [r1]
	ldr r0, [r5]
	mov r1, #0
	str r1, [r0, #0x7c]
	mov r0, #1
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_022282EC: .word 0xFFFFE0FF
_022282F0: .word 0x04001000
_022282F4: .word 0xFFFF1FFF
_022282F8: .word 0x00000307
_022282FC: .word 0x0000030A
_02228300: .word gSystem + 0x60
_02228304: .word ov39_02228418
	thumb_func_end ov39_02228140

	thumb_func_start ov39_02228308
ov39_02228308: ; 0x02228308
	push {r4, r5, r6, lr}
	add r5, r1, #0
	bl OverlayManager_GetData
	ldr r1, [r5]
	add r4, r0, #0
	cmp r1, #0
	beq _02228322
	cmp r1, #1
	beq _02228330
	cmp r1, #2
	beq _0222835C
	b _02228368
_02228322:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _02228368
	mov r0, #1
	str r0, [r5]
	b _02228368
_02228330:
	ldr r6, [r4, #8]
	ldr r1, _0222836C ; =ov39_0222AA20
	lsl r2, r6, #2
	ldr r1, [r1, r2]
	blx r1
	ldr r1, [r4, #8]
	cmp r6, r1
	beq _02228352
	add r1, r4, #0
	mov r2, #0
	add r1, #0x94
	str r2, [r1]
	add r1, r4, #0
	add r1, #0x9c
	str r2, [r1]
	add r4, #0x98
	str r2, [r4]
_02228352:
	cmp r0, #1
	bne _02228368
	mov r0, #2
	str r0, [r5]
	b _02228368
_0222835C:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _02228368
	mov r0, #1
	pop {r4, r5, r6, pc}
_02228368:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0222836C: .word ov39_0222AA20
	thumb_func_end ov39_02228308

	thumb_func_start ov39_02228370
ov39_02228370: ; 0x02228370
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	add r0, #0xa8
	ldr r0, [r0]
	cmp r0, #0
	beq _02228394
	bl DestroySysTask
	add r0, r4, #0
	mov r1, #0
	add r0, #0xa8
	str r1, [r0]
	add r0, r4, #0
	add r0, #0xac
	str r1, [r0]
_02228394:
	ldr r0, [r4, #0x2c]
	bl DestroyMsgData
	ldr r0, [r4, #0x28]
	bl DestroyMsgData
	ldr r0, [r4, #0x24]
	bl DestroyMsgData
	ldr r0, [r4, #0x20]
	bl ScrStrBufs_delete
	ldr r0, [r4, #0x38]
	bl String_dtor
	ldr r0, [r4, #0x3c]
	bl String_dtor
	ldr r0, [r4, #0x34]
	bl String_dtor
	add r0, r4, #0
	bl ov39_02228948
	ldr r0, [r4, #4]
	bl FreeToHeap
	ldr r0, [r4, #4]
	bl ov39_022285A8
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	bl GF_DestroyVramTransferManager
	bl sub_02021238
	mov r0, #0
	bl TextFlags_SetCanABSpeedUpPrint
	mov r0, #0
	bl sub_02002B50
	mov r0, #0
	bl sub_02002B8C
	bl sub_0203A914
	add r0, r5, #0
	bl OverlayManager_FreeData
	mov r0, #0x7c
	bl DestroyHeap
	ldr r0, _02228414 ; =gSystem + 0x60
	mov r1, #0
	strb r1, [r0, #9]
	bl GX_SwapDisplay
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02228414: .word gSystem + 0x60
	thumb_func_end ov39_02228370

	thumb_func_start ov39_02228418
ov39_02228418: ; 0x02228418
	push {r4, lr}
	add r4, r0, #0
	bl GF_RunVramTransferTasks
	bl OamManager_ApplyAndResetBuffers
	ldr r0, [r4, #4]
	bl BgConfig_HandleScheduledScrollAndTransferOps
	ldr r3, _02228438 ; =0x027E0000
	ldr r1, _0222843C ; =0x00003FF8
	mov r0, #1
	ldr r2, [r3, r1]
	orr r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	.balign 4, 0
_02228438: .word 0x027E0000
_0222843C: .word 0x00003FF8
	thumb_func_end ov39_02228418

	thumb_func_start ov39_02228440
ov39_02228440: ; 0x02228440
	push {r3, r4, r5, lr}
	sub sp, #0xa8
	add r4, r0, #0
	bl GX_DisableEngineALayers
	bl GX_DisableEngineBLayers
	ldr r5, _02228598 ; =ov39_0222A8E4
	add r3, sp, #0x80
	mov r2, #5
_02228454:
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _02228454
	add r0, sp, #0x80
	bl GX_SetBanks
	mov r1, #6
	mov r2, #2
	mov r0, #0
	lsl r1, r1, #0x18
	lsl r2, r2, #0x12
	bl MIi_CpuClear32
	mov r1, #0x62
	mov r2, #2
	mov r0, #0
	lsl r1, r1, #0x14
	lsl r2, r2, #0x10
	bl MIi_CpuClear32
	mov r1, #0x19
	mov r2, #1
	mov r0, #0
	lsl r1, r1, #0x16
	lsl r2, r2, #0x12
	bl MIi_CpuClear32
	mov r1, #0x66
	mov r2, #2
	mov r0, #0
	lsl r1, r1, #0x14
	lsl r2, r2, #0x10
	bl MIi_CpuClear32
	ldr r5, _0222859C ; =ov39_0222A8D4
	add r3, sp, #0x70
	add r2, r3, #0
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	ldr r5, _022285A0 ; =ov39_0222A90C
	add r3, sp, #0x38
	mov r2, #7
_022284B4:
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _022284B4
	mov r1, #0
	add r0, r4, #0
	add r2, sp, #0x38
	add r3, r1, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #0
	bl BgClearTilemapBufferAndCommit
	mov r1, #0
	add r0, r4, #0
	add r2, r1, #0
	add r3, r1, #0
	bl BgSetPosTextAndCommit
	mov r1, #0
	add r0, r4, #0
	mov r2, #3
	add r3, r1, #0
	bl BgSetPosTextAndCommit
	add r0, r4, #0
	mov r1, #1
	add r2, sp, #0x54
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #1
	bl BgClearTilemapBufferAndCommit
	mov r2, #0
	add r0, r4, #0
	mov r1, #1
	add r3, r2, #0
	bl BgSetPosTextAndCommit
	add r0, r4, #0
	mov r1, #1
	mov r2, #3
	mov r3, #0
	bl BgSetPosTextAndCommit
	ldr r5, _022285A4 ; =ov39_0222A944
	add r3, sp, #0
	mov r2, #7
_0222851A:
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _0222851A
	add r0, r4, #0
	mov r1, #4
	add r2, sp, #0
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #4
	bl BgClearTilemapBufferAndCommit
	mov r2, #0
	add r0, r4, #0
	mov r1, #4
	add r3, r2, #0
	bl BgSetPosTextAndCommit
	add r0, r4, #0
	mov r1, #4
	mov r2, #3
	mov r3, #0
	bl BgSetPosTextAndCommit
	add r0, r4, #0
	mov r1, #5
	add r2, sp, #0x1c
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #5
	bl BgClearTilemapBufferAndCommit
	mov r2, #0
	add r0, r4, #0
	mov r1, #5
	add r3, r2, #0
	bl BgSetPosTextAndCommit
	add r0, r4, #0
	mov r1, #5
	mov r2, #3
	mov r3, #0
	bl BgSetPosTextAndCommit
	mov r0, #0
	mov r1, #0x20
	add r2, r0, #0
	mov r3, #0x7c
	bl BG_ClearCharDataRange
	mov r0, #4
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x7c
	bl BG_ClearCharDataRange
	add sp, #0xa8
	pop {r3, r4, r5, pc}
	nop
_02228598: .word ov39_0222A8E4
_0222859C: .word ov39_0222A8D4
_022285A0: .word ov39_0222A90C
_022285A4: .word ov39_0222A944
	thumb_func_end ov39_02228440

	thumb_func_start ov39_022285A8
ov39_022285A8: ; 0x022285A8
	push {r4, lr}
	add r4, r0, #0
	mov r1, #5
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #4
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #1
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #0
	bl FreeBgTilemapBuffer
	pop {r4, pc}
	thumb_func_end ov39_022285A8

	thumb_func_start ov39_022285CC
ov39_022285CC: ; 0x022285CC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	str r0, [sp, #0x10]
	ldr r4, [r0, #4]
	mov r0, #0x58
	mov r1, #0x7c
	bl NARC_ctor
	mov r2, #0
	str r2, [sp]
	mov r1, #0x7c
	str r1, [sp, #4]
	mov r1, #3
	add r3, r2, #0
	str r0, [sp, #0x2c]
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r3, #0
	str r3, [sp]
	mov r0, #0x7c
	str r0, [sp, #4]
	ldr r0, [sp, #0x2c]
	mov r1, #3
	mov r2, #4
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r1, #0x1a
	mov r0, #0
	lsl r1, r1, #4
	mov r2, #0x7c
	bl LoadFontPal1
	mov r1, #0x1a
	mov r0, #4
	lsl r1, r1, #4
	mov r2, #0x7c
	bl LoadFontPal1
	ldr r0, [sp, #0x10]
	ldr r0, [r0]
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bl Sav2_PlayerData_GetOptionsAddr
	bl Options_GetFrame
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0x7c
	str r0, [sp, #4]
	add r0, r4, #0
	mov r1, #0
	mov r2, #1
	mov r3, #0xa
	bl LoadUserFrameGfx2
	mov r1, #0
	str r1, [sp]
	mov r0, #0x7c
	str r0, [sp, #4]
	add r0, r4, #0
	mov r2, #0x1f
	mov r3, #0xb
	bl LoadUserFrameGfx1
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x7c
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x2c]
	mov r1, #2
	add r2, r4, #0
	mov r3, #1
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r1, #0
	mov r0, #6
	str r1, [sp]
	lsl r0, r0, #8
	str r0, [sp, #4]
	str r1, [sp, #8]
	mov r0, #0x7c
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x2c]
	mov r1, #6
	add r2, r4, #0
	mov r3, #1
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x7c
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x2c]
	mov r1, #0xb
	add r2, r4, #0
	mov r3, #5
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r1, #0
	mov r0, #6
	str r1, [sp]
	lsl r0, r0, #8
	str r0, [sp, #4]
	str r1, [sp, #8]
	mov r0, #0x7c
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x2c]
	mov r1, #0xc
	add r2, r4, #0
	mov r3, #5
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0
	add r1, r0, #0
	bl BG_SetMaskColor
	mov r0, #4
	mov r1, #0
	bl BG_SetMaskColor
	ldr r0, [sp, #0x10]
	mov r2, #0x33
	add r0, #0xa8
	mov r1, #0
	lsl r2, r2, #4
	bl MI_CpuFill8
	ldr r0, [sp, #0x2c]
	mov r1, #5
	add r2, sp, #0x38
	mov r3, #0x7c
	bl GfGfxLoader_GetPlttDataFromOpenNarc
	add r4, r0, #0
	ldr r0, [sp, #0x38]
	ldr r1, [sp, #0x10]
	ldr r0, [r0, #0xc]
	add r1, #0xb0
	mov r2, #0x80
	bl MIi_CpuCopy16
	ldr r0, [sp, #0x38]
	mov r2, #0x13
	ldr r1, [sp, #0x10]
	lsl r2, r2, #4
	add r1, r1, r2
	ldr r0, [r0, #0xc]
	mov r2, #0x80
	bl MIi_CpuCopy16
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0
	mov r1, #0x13
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x10]
	lsl r1, r1, #4
	add r0, r0, r1
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x10]
	str r0, [sp, #0x14]
	add r0, #0xb0
	str r0, [sp, #0x14]
_02228722:
	mov r0, #0
	str r0, [sp, #0x20]
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x28]
	add r0, r0, #1
	lsl r1, r0, #5
	ldr r0, [sp, #0x10]
	add r0, r0, r1
	str r0, [sp, #0x30]
_02228734:
	ldr r0, [sp, #0x24]
	cmp r0, #0x15
	blt _0222873E
	bl GF_AssertFail
_0222873E:
	ldr r0, [sp, #0x30]
	mov r7, #1
	add r6, r0, #2
	ldr r0, [sp, #0x18]
	add r4, r0, #2
	ldr r0, [sp, #0x14]
	add r5, r0, #2
	ldr r0, [sp, #0x20]
	asr r0, r0, #8
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x34]
_02228756:
	add r0, r6, #0
	add r0, #0xb0
	ldrh r0, [r0]
	ldr r3, [sp, #0x34]
	add r1, r4, #0
	str r0, [sp]
	add r0, r5, #0
	mov r2, #1
	bl sub_02003DE8
	add r7, r7, #1
	add r6, r6, #2
	add r4, r4, #2
	add r5, r5, #2
	cmp r7, #0x10
	blt _02228756
	ldr r0, [sp, #0x18]
	add r0, #0x20
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x24]
	add r0, r0, #1
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x1c]
	cmp r0, #1
	beq _022287A2
	mov r0, #3
	ldr r1, [sp, #0x20]
	lsl r0, r0, #8
	add r1, r1, r0
	mov r0, #1
	lsl r0, r0, #0xc
	str r1, [sp, #0x20]
	cmp r1, r0
	blt _02228734
	str r0, [sp, #0x20]
	mov r0, #1
	str r0, [sp, #0x1c]
	b _02228734
_022287A2:
	ldr r0, [sp, #0x14]
	add r0, #0x20
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x28]
	add r0, r0, #1
	str r0, [sp, #0x28]
	cmp r0, #3
	blt _02228722
	mov r1, #0x13
	ldr r0, [sp, #0x10]
	lsl r1, r1, #4
	add r0, r0, r1
	mov r1, #0x2a
	lsl r1, r1, #4
	bl DC_FlushRange
	ldr r0, [sp, #0x10]
	mov r1, #1
	add r0, #0xac
	str r1, [r0]
	mov r1, #0xf5
	ldr r0, [sp, #0x10]
	mov r2, #0
	lsl r1, r1, #2
	str r2, [r0, r1]
	ldr r1, [sp, #0x10]
	ldr r0, _022287F4 ; =ov39_022287F8
	add r1, #0xa8
	mov r2, #0x14
	bl sub_0200E33C
	ldr r1, [sp, #0x10]
	add r1, #0xa8
	str r0, [r1]
	ldr r0, [sp, #0x2c]
	str r1, [sp, #0x10]
	bl NARC_dtor
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	nop
_022287F4: .word ov39_022287F8
	thumb_func_end ov39_022285CC

	thumb_func_start ov39_022287F8
ov39_022287F8: ; 0x022287F8
	push {r4, lr}
	add r4, r1, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _02228896
	ldr r1, _02228898 ; =0x0000032B
	mov r0, #1
	ldrb r2, [r4, r1]
	eor r2, r0
	strb r2, [r4, r1]
	ldrb r2, [r4, r1]
	tst r0, r2
	bne _02228896
	add r0, r1, #1
	ldr r0, [r4, r0]
	cmp r0, #1
	bhi _0222882E
	sub r0, r1, #3
	ldrsh r0, [r4, r0]
	add r2, r4, #0
	add r2, #0x88
	lsl r0, r0, #5
	add r0, r2, r0
	mov r1, #0
	mov r2, #0x20
	bl GX_LoadBGPltt
_0222882E:
	mov r0, #0xcb
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0222883C
	cmp r0, #2
	bne _02228852
_0222883C:
	mov r0, #0xca
	lsl r0, r0, #2
	ldrsh r0, [r4, r0]
	add r1, r4, #0
	add r1, #0x88
	lsl r0, r0, #5
	add r0, r1, r0
	mov r1, #0
	mov r2, #0x20
	bl GXS_LoadBGPltt
_02228852:
	ldr r0, _0222889C ; =0x0000032A
	ldrsb r1, [r4, r0]
	cmp r1, #0
	bne _0222887A
	sub r1, r0, #2
	ldrsh r1, [r4, r1]
	add r2, r1, #1
	sub r1, r0, #2
	strh r2, [r4, r1]
	ldrsh r1, [r4, r1]
	cmp r1, #0x15
	blt _02228896
	mov r2, #0x13
	sub r1, r0, #2
	strh r2, [r4, r1]
	ldrsb r2, [r4, r0]
	mov r1, #1
	eor r1, r2
	strb r1, [r4, r0]
	pop {r4, pc}
_0222887A:
	sub r1, r0, #2
	ldrsh r1, [r4, r1]
	sub r2, r1, #1
	sub r1, r0, #2
	strh r2, [r4, r1]
	ldrsh r1, [r4, r1]
	cmp r1, #0
	bge _02228896
	mov r2, #1
	sub r1, r0, #2
	strh r2, [r4, r1]
	ldrsb r1, [r4, r0]
	eor r1, r2
	strb r1, [r4, r0]
_02228896:
	pop {r4, pc}
	.balign 4, 0
_02228898: .word 0x0000032B
_0222889C: .word 0x0000032A
	thumb_func_end ov39_022287F8

	thumb_func_start ov39_022288A0
ov39_022288A0: ; 0x022288A0
	push {r3, r4, lr}
	sub sp, #0x14
	mov r3, #4
	add r4, r0, #0
	str r3, [sp]
	mov r0, #0x17
	str r0, [sp, #4]
	mov r0, #0x10
	str r0, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	mov r0, #0x94
	str r0, [sp, #0x10]
	add r1, r4, #0
	ldr r0, [r4, #4]
	add r1, #0x64
	mov r2, #0
	bl AddWindowParameterized
	add r0, r4, #0
	add r0, #0x64
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #1
	str r0, [sp]
	mov r0, #0x18
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	mov r0, #0x81
	lsl r0, r0, #2
	str r0, [sp, #0x10]
	add r1, r4, #0
	ldr r0, [r4, #4]
	add r1, #0x54
	mov r2, #0
	mov r3, #4
	bl AddWindowParameterized
	add r0, r4, #0
	add r0, #0x54
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r3, #1
	ldr r0, _02228944 ; =0x000F0E00
	str r3, [sp]
	str r0, [sp, #4]
	add r0, r4, #0
	ldr r1, [r4, #0x38]
	add r0, #0x54
	mov r2, #0
	bl ov39_0222899C
	mov r0, #0x13
	str r0, [sp]
	mov r0, #0x1b
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	mov r0, #0x28
	str r0, [sp, #0x10]
	add r1, r4, #0
	ldr r0, [r4, #4]
	add r1, #0x44
	mov r2, #0
	mov r3, #2
	bl AddWindowParameterized
	add r4, #0x44
	add r0, r4, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	add sp, #0x14
	pop {r3, r4, pc}
	nop
_02228944: .word 0x000F0E00
	thumb_func_end ov39_022288A0

	thumb_func_start ov39_02228948
ov39_02228948: ; 0x02228948
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x44
	bl RemoveWindow
	add r0, r4, #0
	add r0, #0x54
	bl RemoveWindow
	add r4, #0x64
	add r0, r4, #0
	bl RemoveWindow
	pop {r4, pc}
	thumb_func_end ov39_02228948

	thumb_func_start ov39_02228964
ov39_02228964: ; 0x02228964
	push {r4, lr}
	add r4, r0, #0
	cmp r3, #1
	beq _02228972
	cmp r3, #2
	beq _02228988
	b _02228996
_02228972:
	ldr r0, [sp, #0xc]
	mov r2, #0
	bl FontID_String_GetWidth
	ldrb r1, [r4, #7]
	lsl r1, r1, #3
	sub r1, r1, r0
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r2, r0, #1
	b _02228996
_02228988:
	ldr r0, [sp, #0xc]
	mov r2, #0
	bl FontID_String_GetWidth
	ldrb r1, [r4, #7]
	lsl r1, r1, #3
	sub r2, r1, r0
_02228996:
	add r0, r2, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov39_02228964

	thumb_func_start ov39_0222899C
ov39_0222899C: ; 0x0222899C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r4, r3, #0
	ldr r3, [sp, #0x24]
	add r5, r0, #0
	str r3, [sp]
	mov r3, #1
	str r3, [sp, #4]
	ldr r3, [sp, #0x20]
	add r6, r1, #0
	bl ov39_02228964
	add r3, r0, #0
	str r4, [sp]
	mov r1, #0
	ldr r0, [sp, #0x24]
	str r1, [sp, #4]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	add r0, r5, #0
	mov r1, #1
	add r2, r6, #0
	bl AddTextPrinterParameterized2
	add sp, #0x10
	pop {r4, r5, r6, pc}
	thumb_func_end ov39_0222899C

	thumb_func_start ov39_022289D0
ov39_022289D0: ; 0x022289D0
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r0, #1
	add r6, r1, #0
	lsl r0, r0, #8
	mov r1, #0x7c
	bl String_ctor
	add r4, r0, #0
	ldr r0, [r5, #0x2c]
	add r1, r6, #0
	add r2, r4, #0
	bl ReadMsgDataIntoString
	ldr r0, [r5, #0x20]
	ldr r1, [r5, #0x3c]
	add r2, r4, #0
	bl StringExpandPlaceholders
	add r0, r5, #0
	add r0, #0x64
	mov r1, #0xf
	bl FillWindowPixelBuffer
	add r0, r5, #0
	add r0, #0x64
	mov r1, #1
	mov r2, #0x1f
	mov r3, #0xb
	bl DrawFrameAndWindow1
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	str r3, [sp, #8]
	add r0, r5, #0
	ldr r2, [r5, #0x3c]
	add r0, #0x64
	mov r1, #1
	bl AddTextPrinterParameterized
	mov r0, #0xff
	str r0, [r5, #0x40]
	add r0, r4, #0
	bl String_dtor
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov39_022289D0

	thumb_func_start ov39_02228A34
ov39_02228A34: ; 0x02228A34
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	mov r0, #0
	add r4, r1, #0
	mvn r0, r0
	cmp r4, r0
	bne _02228A46
	mov r4, #0xb
_02228A46:
	mov r0, #2
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r5, #0x20]
	mov r1, #0
	mov r3, #5
	bl BufferIntegerAsString
	add r0, r5, #0
	add r0, #0x44
	mov r1, #1
	bl ClearFrameAndWindow2
	add r0, r5, #0
	add r1, r4, #0
	bl ov39_022289D0
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov39_02228A34

	thumb_func_start ov39_02228A70
ov39_02228A70: ; 0x02228A70
	push {r3, lr}
	cmp r0, #0xff
	beq _02228A82
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _02228A86
_02228A82:
	mov r0, #0
	pop {r3, pc}
_02228A86:
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov39_02228A70

	thumb_func_start ov39_02228A8C
ov39_02228A8C: ; 0x02228A8C
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x88
	ldr r0, [r0]
	cmp r0, #0
	bne _02228AA6
	add r0, r4, #0
	add r0, #0x44
	mov r1, #1
	bl sub_0200F0AC
	add r4, #0x88
	str r0, [r4]
_02228AA6:
	pop {r4, pc}
	thumb_func_end ov39_02228A8C

	thumb_func_start ov39_02228AA8
ov39_02228AA8: ; 0x02228AA8
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x88
	ldr r0, [r0]
	cmp r0, #0
	beq _02228ABE
	bl sub_0200F450
	mov r0, #0
	add r4, #0x88
	str r0, [r4]
_02228ABE:
	pop {r4, pc}
	thumb_func_end ov39_02228AA8

	thumb_func_start ov39_02228AC0
ov39_02228AC0: ; 0x02228AC0
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	add r5, r0, #0
	mov r0, #0x7c
	add r4, r1, #0
	bl sub_0201660C
	mov r1, #0
	mov r2, #0xe
	str r2, [sp, #0xc]
	str r5, [sp]
	str r1, [sp, #4]
	str r4, [sp, #8]
	mov r2, #0x19
	add r3, sp, #0
	strb r2, [r3, #0x10]
	mov r2, #0xa
	strb r2, [r3, #0x11]
	ldrb r4, [r3, #0x12]
	mov r2, #0xf
	add r6, r0, #0
	bic r4, r2
	strb r4, [r3, #0x12]
	ldrb r4, [r3, #0x12]
	mov r2, #0xf0
	bic r4, r2
	strb r4, [r3, #0x12]
	strb r1, [r3, #0x13]
	add r1, sp, #0
	bl sub_020166FC
	add r0, r6, #0
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov39_02228AC0

	thumb_func_start ov39_02228B04
ov39_02228B04: ; 0x02228B04
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r0, r1, #0
	add r1, r2, #0
	add r4, r3, #0
	bl NewString_ReadMsgData
	add r6, r0, #0
	ldr r0, [r5, #0x20]
	ldr r1, [r5, #0x34]
	add r2, r6, #0
	bl StringExpandPlaceholders
	add r0, r6, #0
	bl String_dtor
	add r0, r5, #0
	add r0, #0x44
	mov r1, #0xf
	bl FillWindowPixelBuffer
	add r0, r5, #0
	add r0, #0x44
	mov r1, #0
	mov r2, #1
	mov r3, #0xa
	bl DrawFrameAndWindow2
	mov r3, #0
	str r3, [sp]
	str r4, [sp, #4]
	str r3, [sp, #8]
	add r0, r5, #0
	ldr r2, [r5, #0x34]
	add r0, #0x44
	mov r1, #1
	bl AddTextPrinterParameterized
	str r0, [r5, #0x40]
	add r0, r5, #0
	mov r1, #0
	add r0, #0x8c
	str r1, [r0]
	cmp r4, #0xff
	beq _02228B64
	cmp r4, #0
	bne _02228B68
_02228B64:
	mov r0, #0xff
	str r0, [r5, #0x40]
_02228B68:
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov39_02228B04

	thumb_func_start ov39_02228B6C
ov39_02228B6C: ; 0x02228B6C
	str r1, [r0, #8]
	str r2, [r0, #0xc]
	bx lr
	.balign 4, 0
	thumb_func_end ov39_02228B6C

	thumb_func_start ov39_02228B74
ov39_02228B74: ; 0x02228B74
	push {r3, lr}
	bl ov00_021E6A70
	cmp r0, #0xb
	bhi _02228BA6
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02228B8A: ; jump table
	.short _02228BA6 - _02228B8A - 2 ; case 0
	.short _02228BA2 - _02228B8A - 2 ; case 1
	.short _02228BA6 - _02228B8A - 2 ; case 2
	.short _02228BA6 - _02228B8A - 2 ; case 3
	.short _02228BA2 - _02228B8A - 2 ; case 4
	.short _02228BA2 - _02228B8A - 2 ; case 5
	.short _02228BA2 - _02228B8A - 2 ; case 6
	.short _02228BA2 - _02228B8A - 2 ; case 7
	.short _02228BA2 - _02228B8A - 2 ; case 8
	.short _02228BA2 - _02228B8A - 2 ; case 9
	.short _02228BA2 - _02228B8A - 2 ; case 10
	.short _02228BA2 - _02228B8A - 2 ; case 11
_02228BA2:
	mov r0, #1
	pop {r3, pc}
_02228BA6:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov39_02228B74

	thumb_func_start ov39_02228BAC
ov39_02228BAC: ; 0x02228BAC
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	ldr r0, [r4, #0x40]
	bl ov39_02228A70
	cmp r0, #1
	bne _02228BC2
	add sp, #4
	mov r0, #0
	pop {r3, r4, pc}
_02228BC2:
	add r0, r4, #0
	add r0, #0x94
	ldr r0, [r0]
	cmp r0, #4
	bhi _02228C6E
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02228BD8: ; jump table
	.short _02228BE2 - _02228BD8 - 2 ; case 0
	.short _02228BF0 - _02228BD8 - 2 ; case 1
	.short _02228C12 - _02228BD8 - 2 ; case 2
	.short _02228C30 - _02228BD8 - 2 ; case 3
	.short _02228C6A - _02228BD8 - 2 ; case 4
_02228BE2:
	add r0, r4, #0
	add r0, #0x94
	ldr r0, [r0]
	add r4, #0x94
	add r0, r0, #1
	str r0, [r4]
	b _02228C6E
_02228BF0:
	ldr r0, _02228C74 ; =0x00000F0F
	add r3, r4, #0
	str r0, [sp]
	add r3, #0x90
	ldr r1, [r4, #0x2c]
	ldr r3, [r3]
	add r0, r4, #0
	mov r2, #0x11
	bl ov39_02228B04
	add r0, r4, #0
	add r0, #0x94
	ldr r0, [r0]
	add r4, #0x94
	add r0, r0, #1
	str r0, [r4]
	b _02228C6E
_02228C12:
	mov r1, #0x8d
	ldr r0, [r4, #4]
	lsl r1, r1, #2
	bl ov39_02228AC0
	add r1, r4, #0
	add r1, #0x84
	str r0, [r1]
	add r0, r4, #0
	add r0, #0x94
	ldr r0, [r0]
	add r4, #0x94
	add r0, r0, #1
	str r0, [r4]
	b _02228C6E
_02228C30:
	add r0, r4, #0
	add r0, #0x84
	ldr r0, [r0]
	bl sub_020168F4
	cmp r0, #1
	bne _02228C56
	add r0, r4, #0
	add r0, #0x84
	ldr r0, [r0]
	bl sub_02016624
	add r0, r4, #0
	add r0, #0x94
	ldr r0, [r0]
	add r4, #0x94
	add r0, r0, #1
	str r0, [r4]
	b _02228C6E
_02228C56:
	cmp r0, #2
	bne _02228C6E
	add r0, r4, #0
	add r0, #0x84
	ldr r0, [r0]
	bl sub_02016624
	mov r0, #8
	str r0, [r4, #8]
	b _02228C6E
_02228C6A:
	mov r0, #1
	str r0, [r4, #8]
_02228C6E:
	mov r0, #0
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_02228C74: .word 0x00000F0F
	thumb_func_end ov39_02228BAC

	thumb_func_start ov39_02228C78
ov39_02228C78: ; 0x02228C78
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	add r0, #0x94
	ldr r0, [r0]
	cmp r0, #0
	beq _02228C90
	cmp r0, #1
	beq _02228CCC
	cmp r0, #2
	beq _02228CE4
	b _02228D00
_02228C90:
	ldr r0, [r4]
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bl sub_02039418
	mov r0, #4
	bl Sys_SetSleepDisableFlag
	bl sub_0203A880
	ldr r0, _02228D08 ; =0x00000F0F
	add r3, r4, #0
	str r0, [sp]
	add r3, #0x90
	ldr r1, [r4, #0x28]
	ldr r3, [r3]
	add r0, r4, #0
	mov r2, #1
	bl ov39_02228B04
	add r0, r4, #0
	bl ov39_02228A8C
	add r0, r4, #0
	add r0, #0x94
	ldr r0, [r0]
	add r4, #0x94
	add r0, r0, #1
	str r0, [r4]
	b _02228D00
_02228CCC:
	ldr r0, [r4, #0x40]
	bl ov39_02228A70
	cmp r0, #0
	bne _02228D00
	add r0, r4, #0
	add r0, #0x94
	ldr r0, [r0]
	add r4, #0x94
	add r0, r0, #1
	str r0, [r4]
	b _02228D00
_02228CE4:
	ldr r0, [r4]
	mov r1, #2
	add r0, #0x14
	mov r2, #1
	mov r3, #0x14
	bl ov00_021EC3F0
	mov r0, #2
	bl ov00_021EC454
	bl ov00_021EC4A4
	mov r0, #2
	str r0, [r4, #8]
_02228D00:
	mov r0, #0
	add sp, #4
	pop {r3, r4, pc}
	nop
_02228D08: .word 0x00000F0F
	thumb_func_end ov39_02228C78

	thumb_func_start ov39_02228D0C
ov39_02228D0C: ; 0x02228D0C
	push {r4, lr}
	sub sp, #0x48
	add r4, r0, #0
	bl ov00_021EC60C
	bl ov00_021EC5B4
	cmp r0, #0
	beq _02228D8A
	bl ov00_021EC724
	cmp r0, #8
	bhi _02228D6A
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02228D32: ; jump table
	.short _02228D6A - _02228D32 - 2 ; case 0
	.short _02228D6A - _02228D32 - 2 ; case 1
	.short _02228D6A - _02228D32 - 2 ; case 2
	.short _02228D6A - _02228D32 - 2 ; case 3
	.short _02228D80 - _02228D32 - 2 ; case 4
	.short _02228D6A - _02228D32 - 2 ; case 5
	.short _02228D6A - _02228D32 - 2 ; case 6
	.short _02228D44 - _02228D32 - 2 ; case 7
	.short _02228D6A - _02228D32 - 2 ; case 8
_02228D44:
	add r0, sp, #8
	add r1, sp, #4
	bl ov00_021EC11C
	str r0, [r4, #0x14]
	ldr r0, [sp, #8]
	str r0, [r4, #0x18]
	ldr r0, [sp, #4]
	str r0, [r4, #0x1c]
	bl ov00_021EC210
	bl ov00_021EC8D8
	add r0, r4, #0
	bl ov39_02228AA8
	mov r0, #6
	str r0, [r4, #8]
	b _02228D8A
_02228D6A:
	add r0, sp, #0
	bl ov00_021EC0FC
	add r0, r4, #0
	bl ov39_02228AA8
	mov r0, #0xa
	str r0, [r4, #8]
	sub r0, #0xc
	str r0, [r4, #0x10]
	b _02228D8A
_02228D80:
	add r0, sp, #0xc
	bl ov00_021EC9E0
	mov r0, #3
	str r0, [r4, #8]
_02228D8A:
	mov r0, #0
	add sp, #0x48
	pop {r4, pc}
	thumb_func_end ov39_02228D0C

	thumb_func_start ov39_02228D90
ov39_02228D90: ; 0x02228D90
	push {r4, lr}
	add r4, r0, #0
	bl ov00_021ECD04
	mov r0, #4
	str r0, [r4, #8]
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov39_02228D90

	thumb_func_start ov39_02228DA0
ov39_02228DA0: ; 0x02228DA0
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	bl ov00_021ECDC8
	cmp r0, #5
	bhi _02228E44
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02228DBA: ; jump table
	.short _02228DCC - _02228DBA - 2 ; case 0
	.short _02228E44 - _02228DBA - 2 ; case 1
	.short _02228E44 - _02228DBA - 2 ; case 2
	.short _02228DC6 - _02228DBA - 2 ; case 3
	.short _02228DCC - _02228DBA - 2 ; case 4
	.short _02228DCC - _02228DBA - 2 ; case 5
_02228DC6:
	mov r0, #5
	str r0, [r4, #8]
	b _02228E44
_02228DCC:
	add r0, r4, #0
	bl ov39_02228AA8
	add r0, sp, #4
	add r1, sp, #0
	bl ov00_021EC11C
	str r0, [r4, #0x14]
	ldr r0, [sp, #4]
	str r0, [r4, #0x18]
	ldr r0, [sp]
	str r0, [r4, #0x1c]
	bl ov00_021EC210
	bl ov00_021EC8D8
	mov r0, #6
	str r0, [r4, #8]
	ldr r1, [sp]
	cmp r1, #7
	bhi _02228E32
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02228E02: ; jump table
	.short _02228E32 - _02228E02 - 2 ; case 0
	.short _02228E12 - _02228E02 - 2 ; case 1
	.short _02228E12 - _02228E02 - 2 ; case 2
	.short _02228E24 - _02228E02 - 2 ; case 3
	.short _02228E16 - _02228E02 - 2 ; case 4
	.short _02228E2E - _02228E02 - 2 ; case 5
	.short _02228E20 - _02228E02 - 2 ; case 6
	.short _02228E2E - _02228E02 - 2 ; case 7
_02228E12:
	str r0, [r4, #8]
	b _02228E32
_02228E16:
	bl ov00_021FA0D8
	mov r0, #6
	str r0, [r4, #8]
	b _02228E32
_02228E20:
	str r0, [r4, #8]
	b _02228E32
_02228E24:
	bl ov00_021ED9B4
	mov r0, #6
	str r0, [r4, #8]
	b _02228E32
_02228E2E:
	bl sub_020399EC
_02228E32:
	ldr r1, [sp, #4]
	ldr r0, _02228E4C ; =0xFFFFB1E0
	cmp r1, r0
	bge _02228E44
	ldr r0, _02228E50 ; =0xFFFF8AD1
	cmp r1, r0
	blt _02228E44
	mov r0, #6
	str r0, [r4, #8]
_02228E44:
	mov r0, #0
	add sp, #8
	pop {r4, pc}
	nop
_02228E4C: .word 0xFFFFB1E0
_02228E50: .word 0xFFFF8AD1
	thumb_func_end ov39_02228DA0

	thumb_func_start ov39_02228E54
ov39_02228E54: ; 0x02228E54
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bl sub_0202C6F4
	add r6, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bl Sav2_SysInfo_get
	add r4, r0, #0
	add r0, r6, #0
	bl sub_0202C08C
	add r0, r4, #0
	bl Sav2_SysInfo_GetField4C
	cmp r0, #0
	bne _02228E8E
	add r0, r6, #0
	bl sub_0203A040
	add r1, r0, #0
	add r0, r4, #0
	bl Sav2_SysInfo_SetField4C
_02228E8E:
	add r0, r4, #0
	bl Sav2_SysInfo_GetField4C
	mov r0, #9
	str r0, [r5, #8]
	ldr r0, [r5]
	mov r1, #1
	str r1, [r0, #0x7c]
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov39_02228E54

	thumb_func_start ov39_02228EA4
ov39_02228EA4: ; 0x02228EA4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x18]
	ldr r1, [r4, #0x1c]
	neg r0, r0
	bl ov00_021E6A70
	ldr r2, [r4, #0x18]
	add r1, r0, #0
	add r0, r4, #0
	neg r2, r2
	bl ov39_02228A34
	mov r0, #7
	str r0, [r4, #8]
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov39_02228EA4

	thumb_func_start ov39_02228EC8
ov39_02228EC8: ; 0x02228EC8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _02228F14 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r0, r1
	bne _02228EE4
	mov r0, #2
	tst r0, r1
	bne _02228EE4
	bl System_GetTouchNew
	cmp r0, #1
	bne _02228F0E
_02228EE4:
	add r0, r4, #0
	add r0, #0x64
	mov r1, #0
	bl sub_0200E5D4
	add r0, r4, #0
	mov r1, #0
	add r0, #0x94
	str r1, [r0]
	ldr r0, [r4, #0x18]
	ldr r1, [r4, #0x1c]
	neg r0, r0
	bl ov39_02228B74
	cmp r0, #1
	bne _02228F0A
	mov r0, #0
	str r0, [r4, #8]
	b _02228F0E
_02228F0A:
	mov r0, #8
	str r0, [r4, #8]
_02228F0E:
	mov r0, #0
	pop {r4, pc}
	nop
_02228F14: .word gSystem
	thumb_func_end ov39_02228EC8

	thumb_func_start ov39_02228F18
ov39_02228F18: ; 0x02228F18
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #9
	beq _02228F28
	bl sub_0203946C
_02228F28:
	bl sub_0203A914
	add r0, r4, #0
	bl ov39_02228AA8
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x7c
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r0, #0
	str r0, [r4, #8]
	mov r0, #1
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov39_02228F18

	thumb_func_start ov39_02228F54
ov39_02228F54: ; 0x02228F54
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	ldr r0, [r4, #0x10]
	mov r2, #0
	add r0, #0xf
	cmp r0, #0x11
	bhi _02228FA2
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02228F70: ; jump table
	.short _02228FA0 - _02228F70 - 2 ; case 0
	.short _02228F9C - _02228F70 - 2 ; case 1
	.short _02228FA2 - _02228F70 - 2 ; case 2
	.short _02228FA0 - _02228F70 - 2 ; case 3
	.short _02228FA2 - _02228F70 - 2 ; case 4
	.short _02228FA2 - _02228F70 - 2 ; case 5
	.short _02228FA2 - _02228F70 - 2 ; case 6
	.short _02228FA2 - _02228F70 - 2 ; case 7
	.short _02228FA2 - _02228F70 - 2 ; case 8
	.short _02228FA2 - _02228F70 - 2 ; case 9
	.short _02228FA0 - _02228F70 - 2 ; case 10
	.short _02228FA2 - _02228F70 - 2 ; case 11
	.short _02228FA0 - _02228F70 - 2 ; case 12
	.short _02228F9C - _02228F70 - 2 ; case 13
	.short _02228F98 - _02228F70 - 2 ; case 14
	.short _02228FA2 - _02228F70 - 2 ; case 15
	.short _02228F94 - _02228F70 - 2 ; case 16
	.short _02228F98 - _02228F70 - 2 ; case 17
_02228F94:
	mov r2, #0x96
	b _02228FA2
_02228F98:
	mov r2, #0x97
	b _02228FA2
_02228F9C:
	mov r2, #0x9c
	b _02228FA2
_02228FA0:
	mov r2, #0x9b
_02228FA2:
	ldr r0, _02228FC4 ; =0x00000F0F
	add r3, r4, #0
	str r0, [sp]
	add r3, #0x90
	ldr r1, [r4, #0x24]
	ldr r3, [r3]
	add r0, r4, #0
	bl ov39_02228B04
	add r0, r4, #0
	mov r1, #0xc
	mov r2, #0xb
	bl ov39_02228B6C
	mov r0, #0
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_02228FC4: .word 0x00000F0F
	thumb_func_end ov39_02228F54

	thumb_func_start ov39_02228FC8
ov39_02228FC8: ; 0x02228FC8
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x94
	ldr r1, [r1]
	cmp r1, #3
	bhi _02229064
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02228FE4: ; jump table
	.short _02228FEC - _02228FE4 - 2 ; case 0
	.short _0222900C - _02228FE4 - 2 ; case 1
	.short _0222902C - _02228FE4 - 2 ; case 2
	.short _0222904C - _02228FE4 - 2 ; case 3
_02228FEC:
	ldr r1, _02229088 ; =0x00000F0F
	add r3, r4, #0
	str r1, [sp]
	add r3, #0x90
	ldr r1, [r4, #0x24]
	ldr r3, [r3]
	mov r2, #0xba
	bl ov39_02228B04
	add r0, r4, #0
	add r0, #0x94
	ldr r0, [r0]
	add r4, #0x94
	add r0, r0, #1
	str r0, [r4]
	b _02229080
_0222900C:
	ldr r0, [r4, #0x40]
	bl ov39_02228A70
	cmp r0, #0
	bne _02229080
	bl sub_0203946C
	bl ov00_021EC8D8
	add r0, r4, #0
	add r0, #0x94
	ldr r0, [r0]
	add r4, #0x94
	add r0, r0, #1
	str r0, [r4]
	b _02229080
_0222902C:
	ldr r1, _02229088 ; =0x00000F0F
	add r3, r4, #0
	str r1, [sp]
	add r3, #0x90
	ldr r1, [r4, #0x24]
	ldr r3, [r3]
	mov r2, #0xbb
	bl ov39_02228B04
	add r0, r4, #0
	add r0, #0x94
	ldr r0, [r0]
	add r4, #0x94
	add r0, r0, #1
	str r0, [r4]
	b _02229080
_0222904C:
	ldr r0, [r4, #0x40]
	bl ov39_02228A70
	cmp r0, #0
	bne _02229080
	add r0, r4, #0
	add r0, #0x94
	ldr r0, [r0]
	add r4, #0x94
	add r0, r0, #1
	str r0, [r4]
	b _02229080
_02229064:
	add r0, r4, #0
	add r0, #0x98
	ldr r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x98
	str r1, [r0]
	add r0, r4, #0
	add r0, #0x98
	ldr r0, [r0]
	cmp r0, #0x1e
	ble _02229080
	mov r0, #8
	str r0, [r4, #8]
_02229080:
	mov r0, #0
	add sp, #4
	pop {r3, r4, pc}
	nop
_02229088: .word 0x00000F0F
	thumb_func_end ov39_02228FC8

	thumb_func_start ov39_0222908C
ov39_0222908C: ; 0x0222908C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x40]
	bl ov39_02228A70
	cmp r0, #0
	bne _0222909E
	ldr r0, [r4, #0xc]
	str r0, [r4, #8]
_0222909E:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov39_0222908C

	thumb_func_start ov39_022290A4
ov39_022290A4: ; 0x022290A4
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	ldr r0, [r4, #0x40]
	bl ov39_02228A70
	cmp r0, #1
	bne _022290BA
	add sp, #4
	mov r0, #0
	pop {r3, r4, pc}
_022290BA:
	add r0, r4, #0
	add r0, #0x94
	ldr r0, [r0]
	cmp r0, #3
	bhi _02229152
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022290D0: ; jump table
	.short _022290D8 - _022290D0 - 2 ; case 0
	.short _022290FA - _022290D0 - 2 ; case 1
	.short _02229110 - _022290D0 - 2 ; case 2
	.short _02229136 - _022290D0 - 2 ; case 3
_022290D8:
	ldr r0, _02229158 ; =0x00000F0F
	add r3, r4, #0
	str r0, [sp]
	add r3, #0x90
	ldr r1, [r4, #0x2c]
	ldr r3, [r3]
	add r0, r4, #0
	mov r2, #0x1a
	bl ov39_02228B04
	add r0, r4, #0
	add r0, #0x94
	ldr r0, [r0]
	add r4, #0x94
	add r0, r0, #1
	str r0, [r4]
	b _02229152
_022290FA:
	bl ov00_021EC8D8
	bl sub_0203946C
	add r0, r4, #0
	add r0, #0x94
	ldr r0, [r0]
	add r4, #0x94
	add r0, r0, #1
	str r0, [r4]
	b _02229152
_02229110:
	bl sub_0203A914
	ldr r0, _02229158 ; =0x00000F0F
	add r3, r4, #0
	str r0, [sp]
	add r3, #0x90
	ldr r1, [r4, #0x2c]
	ldr r3, [r3]
	add r0, r4, #0
	mov r2, #0x1b
	bl ov39_02228B04
	add r0, r4, #0
	add r0, #0x94
	ldr r0, [r0]
	add r4, #0x94
	add r0, r0, #1
	str r0, [r4]
	b _02229152
_02229136:
	add r0, r4, #0
	add r0, #0x98
	ldr r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x98
	str r1, [r0]
	add r0, r4, #0
	add r0, #0x98
	ldr r0, [r0]
	cmp r0, #0x1e
	ble _02229152
	ldr r0, [r4, #0xc]
	str r0, [r4, #8]
_02229152:
	mov r0, #0
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_02229158: .word 0x00000F0F
	thumb_func_end ov39_022290A4

	thumb_func_start ov39_0222915C
ov39_0222915C: ; 0x0222915C
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #0
	mov r2, #0x60
	bl MI_CpuFill8
	ldr r0, [r5]
	mov r1, #0
	str r0, [r4]
	ldr r0, [r5, #4]
	add r2, r5, #0
	str r0, [r4, #4]
	ldr r0, [r5, #8]
	add r3, r4, #0
	str r0, [r4, #8]
	ldrh r0, [r5, #0xc]
	strh r0, [r4, #0xc]
_02229182:
	ldrh r0, [r2, #0x24]
	add r1, r1, #1
	add r2, r2, #2
	strh r0, [r3, #0xe]
	add r3, r3, #2
	cmp r1, #8
	blt _02229182
	mov r0, #0x34
	ldrsb r0, [r5, r0]
	mov r2, #0
	strb r0, [r4, #0x1e]
	add r0, r5, #0
	add r0, #0x35
	ldrb r0, [r0]
	strb r0, [r4, #0x1f]
	add r0, r5, #0
	add r0, #0x36
	ldrb r1, [r0]
	add r0, r4, #0
	add r0, #0x20
	strb r1, [r0]
	add r0, r5, #0
	add r0, #0x37
	ldrb r1, [r0]
	add r0, r4, #0
	add r0, #0x21
	strb r1, [r0]
	ldr r0, [r5, #0x3c]
	add r1, r4, #0
	str r0, [r4, #0x24]
	add r0, r5, #0
	add r0, #0x40
	ldrh r0, [r0]
	strh r0, [r4, #0x28]
	add r0, r5, #0
	add r0, #0x42
	ldrh r0, [r0]
	strh r0, [r4, #0x2a]
	add r0, r5, #0
	add r0, #0x44
	ldrh r0, [r0]
	strh r0, [r4, #0x2c]
	add r0, r5, #0
	add r0, #0x46
	ldrh r0, [r0]
	strh r0, [r4, #0x2e]
	add r0, r5, #0
	add r0, #0x48
_022291E2:
	ldrb r6, [r0]
	add r3, r1, #0
	add r3, #0x30
	strb r6, [r3]
	add r3, r1, #0
	ldrb r6, [r0, #1]
	add r3, #0x31
	add r2, r2, #1
	strb r6, [r3]
	add r3, r1, #0
	ldrb r6, [r0, #2]
	add r3, #0x32
	strb r6, [r3]
	add r3, r1, #0
	ldrb r6, [r0, #3]
	add r3, #0x33
	add r0, r0, #4
	add r1, r1, #4
	strb r6, [r3]
	cmp r2, #0xa
	blt _022291E2
	add r0, r5, #0
	add r0, #0x70
	ldrb r1, [r0]
	add r0, r4, #0
	add r0, #0x58
	add r5, #0x71
	strb r1, [r0]
	ldrb r0, [r5]
	add r4, #0x59
	strb r0, [r4]
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov39_0222915C

	thumb_func_start ov39_02229224
ov39_02229224: ; 0x02229224
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	bl sub_0202B994
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #0
	bl MI_CpuFill8
	ldr r0, [r5]
	mov r1, #0
	str r0, [r4]
	ldr r0, [r5, #4]
	add r2, r5, #0
	str r0, [r4, #4]
	ldr r0, [r5, #8]
	add r3, r4, #0
	str r0, [r4, #8]
	ldrh r0, [r5, #0xc]
	strh r0, [r4, #0xc]
_0222924E:
	ldrh r0, [r2, #0xe]
	add r1, r1, #1
	add r2, r2, #2
	strh r0, [r3, #0x24]
	add r3, r3, #2
	cmp r1, #8
	blt _0222924E
	mov r0, #0x1e
	ldrsb r1, [r5, r0]
	add r0, r4, #0
	add r0, #0x34
	strb r1, [r0]
	add r0, r4, #0
	ldrb r1, [r5, #0x1f]
	add r0, #0x35
	mov r2, #0
	strb r1, [r0]
	add r0, r5, #0
	add r0, #0x20
	ldrb r1, [r0]
	add r0, r4, #0
	add r0, #0x36
	strb r1, [r0]
	add r0, r5, #0
	add r0, #0x21
	ldrb r1, [r0]
	add r0, r4, #0
	add r0, #0x37
	strb r1, [r0]
	ldr r0, [r5, #0x24]
	str r0, [r4, #0x3c]
	add r0, r4, #0
	ldrh r1, [r5, #0x28]
	add r0, #0x40
	strh r1, [r0]
	add r0, r4, #0
	ldrh r1, [r5, #0x2a]
	add r0, #0x42
	strh r1, [r0]
	add r0, r4, #0
	ldrh r1, [r5, #0x2c]
	add r0, #0x44
	strh r1, [r0]
	add r0, r4, #0
	ldrh r1, [r5, #0x2e]
	add r0, #0x46
	strh r1, [r0]
	add r0, r5, #0
	add r0, #0x30
	add r1, r4, #0
_022292B2:
	ldrb r6, [r0]
	add r3, r1, #0
	add r3, #0x48
	strb r6, [r3]
	add r3, r1, #0
	ldrb r6, [r0, #1]
	add r3, #0x49
	add r2, r2, #1
	strb r6, [r3]
	add r3, r1, #0
	ldrb r6, [r0, #2]
	add r3, #0x4a
	strb r6, [r3]
	add r3, r1, #0
	ldrb r6, [r0, #3]
	add r3, #0x4b
	add r0, r0, #4
	add r1, r1, #4
	strb r6, [r3]
	cmp r2, #0xa
	blt _022292B2
	add r0, r5, #0
	add r0, #0x58
	ldrb r1, [r0]
	add r0, r4, #0
	add r0, #0x70
	strb r1, [r0]
	add r5, #0x59
	add r0, r4, #0
	ldrb r1, [r5]
	add r0, #0x71
	mov r2, #0
	strb r1, [r0]
	ldr r0, _0222930C ; =0x0000FFFF
	add r1, r4, #0
_022292F8:
	add r2, r2, #1
	strh r0, [r1, #0xe]
	add r1, r1, #2
	cmp r2, #0xb
	blt _022292F8
	mov r0, #0
	add r4, #0x38
	strb r0, [r4]
	pop {r4, r5, r6, pc}
	nop
_0222930C: .word 0x0000FFFF
	thumb_func_end ov39_02229224

	.rodata

ov39_0222A8B0:
	.byte 0x00, 0x00, 0x00, 0x00

ov39_0222A8B4: ; 0x0222A8B4
	.byte 0x00, 0x00, 0x00, 0x00
	.word ov39_0222A8C0
	.word ov39_0222A8B0

ov39_0222A8C0:
	.word ov39_02227348
	.word ov39_02227334
	.word ov39_02227364
	.word ov39_0222738C
	.byte 0x00, 0x00, 0x00, 0x00

ov39_0222A8D4: ; 0x0222A8D4
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov39_0222A8E4: ; 0x0222A8E4
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00

ov39_0222A90C: ; 0x0222A90C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x02, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov39_0222A944: ; 0x0222A944
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1B, 0x02, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00

	.data

ov39_0222AA20:
	.word ov39_02228BAC
	.word ov39_02228C78
	.word ov39_02228D0C
	.word ov39_02228D90
	.word ov39_02228DA0
	.word ov39_02228E54
	.word ov39_02228EA4
	.word ov39_02228EC8
	.word ov39_02228F18
	.word ov39_02228F18
	.word ov39_02228F54
	.word ov39_02228FC8
	.word ov39_0222908C
	.word ov39_022290A4

	.bss

_0222AB80:
	.space 0x4
