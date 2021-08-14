	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start LoadSingleElementFromNarc
LoadSingleElementFromNarc: ; 0x0200B610
	ldr r3, _0200B614 ; =AllocAndReadWholeNarcMemberByIdPair
	bx r3
	.balign 4, 0
_0200B614: .word AllocAndReadWholeNarcMemberByIdPair
	thumb_func_end LoadSingleElementFromNarc

	thumb_func_start FreeMsgDataRawData
FreeMsgDataRawData: ; 0x0200B618
	ldr r3, _0200B61C ; =FreeToHeap
	bx r3
	.balign 4, 0
_0200B61C: .word FreeToHeap
	thumb_func_end FreeMsgDataRawData

	thumb_func_start ReadMsgData_ExistingTable_ExistingArray
ReadMsgData_ExistingTable_ExistingArray: ; 0x0200B620
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r3, r0, #0
	ldrh r0, [r3]
	add r5, r1, #0
	add r4, r2, #0
	cmp r5, r0
	bhs _0200B690
	lsl r0, r5, #3
	add r0, r3, r0
	ldr r2, [r0, #4]
	ldr r1, [r0, #8]
	ldr r6, _0200B698 ; =0x000002FD
	str r2, [sp]
	str r1, [sp, #4]
	ldrh r0, [r3, #2]
	add r7, r5, #1
	mul r6, r0
	add r0, r7, #0
	mul r0, r6
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	lsl r0, r6, #0x10
	orr r0, r6
	eor r2, r0
	eor r0, r1
	str r0, [sp, #4]
	str r2, [sp]
	add r1, r3, r2
	add r0, r4, #0
	add r2, sp, #0
	bl CopyEncryptedMessage16
	ldr r2, [sp, #4]
	ldr r0, _0200B69C ; =0x00091BD3
	add r1, r7, #0
	mul r0, r1
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	sub r3, r2, #1
	cmp r2, #0
	beq _0200B694
	ldr r0, _0200B6A0 ; =0x0000493D
_0200B676:
	ldrh r1, [r4]
	eor r1, r5
	strh r1, [r4]
	add r1, r5, r0
	lsl r1, r1, #0x10
	lsr r5, r1, #0x10
	add r1, r3, #0
	add r4, r4, #2
	sub r3, r3, #1
	cmp r1, #0
	bne _0200B676
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_0200B690:
	bl GF_AssertFail
_0200B694:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0200B698: .word 0x000002FD
_0200B69C: .word 0x00091BD3
_0200B6A0: .word 0x0000493D
	thumb_func_end ReadMsgData_ExistingTable_ExistingArray

	thumb_func_start ReadMsgData_NewNarc_ExistingArray
ReadMsgData_NewNarc_ExistingArray: ; 0x0200B6A4
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r1, #0
	add r1, r3, #0
	add r4, r2, #0
	bl NARC_ctor
	add r6, r0, #0
	beq _0200B73A
	add r1, sp, #0xc
	str r1, [sp]
	add r1, r5, #0
	mov r2, #0
	mov r3, #4
	bl NARC_ReadFromMember
	add r0, sp, #4
	lsl r2, r4, #3
	str r0, [sp]
	add r0, r6, #0
	add r1, r5, #0
	add r2, r2, #4
	mov r3, #8
	bl NARC_ReadFromMember
	add r0, sp, #4
	ldrh r2, [r0, #0xa]
	ldr r0, _0200B740 ; =0x000002FD
	add r1, r4, #1
	mul r0, r2
	mul r0, r1
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	lsl r0, r1, #0x10
	orr r1, r0
	ldr r0, [sp, #4]
	eor r0, r1
	str r0, [sp, #4]
	ldr r0, [sp, #8]
	eor r0, r1
	str r0, [sp, #8]
	ldr r0, [sp, #0x20]
	add r1, r5, #0
	str r0, [sp]
	ldr r3, [sp, #8]
	ldr r2, [sp, #4]
	add r0, r6, #0
	lsl r3, r3, #1
	bl NARC_ReadFromMember
	ldr r2, _0200B744 ; =0x00091BD3
	add r3, r4, #1
	mul r2, r3
	lsl r2, r2, #0x10
	ldr r0, [sp, #8]
	lsr r3, r2, #0x10
	sub r2, r0, #1
	ldr r1, [sp, #0x20]
	cmp r0, #0
	beq _0200B734
	ldr r0, _0200B748 ; =0x0000493D
_0200B71E:
	ldrh r4, [r1]
	eor r4, r3
	strh r4, [r1]
	add r3, r3, r0
	lsl r3, r3, #0x10
	add r4, r2, #0
	add r1, r1, #2
	lsr r3, r3, #0x10
	sub r2, r2, #1
	cmp r4, #0
	bne _0200B71E
_0200B734:
	add r0, r6, #0
	bl NARC_dtor
_0200B73A:
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_0200B740: .word 0x000002FD
_0200B744: .word 0x00091BD3
_0200B748: .word 0x0000493D
	thumb_func_end ReadMsgData_NewNarc_ExistingArray

	thumb_func_start CopyEncryptedMessage16
CopyEncryptedMessage16: ; 0x0200B74C
	add r3, r0, #0
	add r0, r1, #0
	add r1, r3, #0
	ldr r2, [r2, #4]
	ldr r3, _0200B75C ; =MIi_CpuCopy16
	lsl r2, r2, #1
	bx r3
	nop
_0200B75C: .word MIi_CpuCopy16
	thumb_func_end CopyEncryptedMessage16

	thumb_func_start ReadMsgData_ExistingTable_ExistingString
ReadMsgData_ExistingTable_ExistingString: ; 0x0200B760
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldrh r0, [r5]
	add r4, r1, #0
	str r2, [sp]
	cmp r4, r0
	bhs _0200B7F6
	lsl r0, r4, #3
	add r0, r5, r0
	ldr r3, [r0, #4]
	ldr r2, [r0, #8]
	ldrh r1, [r5, #2]
	ldr r6, _0200B804 ; =0x000002FD
	add r0, r4, #1
	mul r6, r1
	add r1, r0, #0
	mul r1, r6
	lsl r0, r1, #0x10
	lsr r1, r0, #0x10
	lsl r0, r1, #0x10
	orr r1, r0
	add r0, r3, #0
	add r6, r2, #0
	str r3, [sp, #8]
	eor r0, r1
	eor r6, r1
	str r0, [sp, #8]
	lsl r0, r6, #1
	str r0, [sp, #4]
	str r2, [sp, #0xc]
	ldr r1, [sp, #4]
	mov r0, #0
	str r6, [sp, #0xc]
	bl AllocFromHeapAtEnd
	add r7, r0, #0
	beq _0200B800
	ldr r0, [sp, #8]
	ldr r2, [sp, #4]
	add r0, r5, r0
	add r1, r7, #0
	bl MIi_CpuCopy16
	ldr r1, _0200B808 ; =0x00091BD3
	add r2, r4, #1
	mul r1, r2
	lsl r1, r1, #0x10
	lsr r2, r1, #0x10
	add r0, r7, #0
	sub r1, r6, #1
	cmp r6, #0
	beq _0200B7E2
	ldr r3, _0200B80C ; =0x0000493D
_0200B7CC:
	ldrh r4, [r0]
	eor r4, r2
	strh r4, [r0]
	add r2, r2, r3
	lsl r2, r2, #0x10
	add r4, r1, #0
	add r0, r0, #2
	lsr r2, r2, #0x10
	sub r1, r1, #1
	cmp r4, #0
	bne _0200B7CC
_0200B7E2:
	ldr r0, [sp]
	add r1, r7, #0
	add r2, r6, #0
	bl CopyU16ArrayToStringN
	add r0, r7, #0
	bl FreeToHeap
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_0200B7F6:
	bl GF_AssertFail
	ldr r0, [sp]
	bl StringSetEmpty
_0200B800:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0200B804: .word 0x000002FD
_0200B808: .word 0x00091BD3
_0200B80C: .word 0x0000493D
	thumb_func_end ReadMsgData_ExistingTable_ExistingString

	thumb_func_start ReadMsgData_ExistingTable_NewString
ReadMsgData_ExistingTable_NewString: ; 0x0200B810
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldrh r0, [r5]
	add r4, r1, #0
	str r2, [sp]
	cmp r4, r0
	bhs _0200B8B8
	lsl r0, r4, #3
	add r0, r5, r0
	ldr r3, [r0, #4]
	ldr r2, [r0, #8]
	ldrh r1, [r5, #2]
	ldr r6, _0200B8C8 ; =0x000002FD
	add r0, r4, #1
	mul r6, r1
	add r1, r0, #0
	mul r1, r6
	lsl r0, r1, #0x10
	lsr r1, r0, #0x10
	lsl r0, r1, #0x10
	orr r1, r0
	add r0, r3, #0
	add r6, r2, #0
	str r3, [sp, #8]
	eor r0, r1
	eor r6, r1
	str r0, [sp, #8]
	lsl r0, r6, #1
	str r0, [sp, #4]
	str r2, [sp, #0xc]
	ldr r0, [sp]
	ldr r1, [sp, #4]
	str r6, [sp, #0xc]
	bl AllocFromHeapAtEnd
	add r7, r0, #0
	beq _0200B8B2
	ldr r0, [sp, #8]
	ldr r2, [sp, #4]
	add r0, r5, r0
	add r1, r7, #0
	bl MIi_CpuCopy16
	ldr r1, _0200B8CC ; =0x00091BD3
	add r2, r4, #1
	mul r1, r2
	lsl r1, r1, #0x10
	lsr r2, r1, #0x10
	add r0, r7, #0
	sub r1, r6, #1
	cmp r6, #0
	beq _0200B892
	ldr r3, _0200B8D0 ; =0x0000493D
_0200B87C:
	ldrh r4, [r0]
	eor r4, r2
	strh r4, [r0]
	add r2, r2, r3
	lsl r2, r2, #0x10
	add r4, r1, #0
	add r0, r0, #2
	lsr r2, r2, #0x10
	sub r1, r1, #1
	cmp r4, #0
	bne _0200B87C
_0200B892:
	ldr r1, [sp]
	add r0, r6, #0
	bl String_ctor
	add r4, r0, #0
	beq _0200B8A6
	add r1, r7, #0
	add r2, r6, #0
	bl CopyU16ArrayToStringN
_0200B8A6:
	add r0, r7, #0
	bl FreeToHeap
	add sp, #0x10
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_0200B8B2:
	add sp, #0x10
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0200B8B8:
	bl GF_AssertFail
	ldr r1, [sp]
	mov r0, #4
	bl String_ctor
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0200B8C8: .word 0x000002FD
_0200B8CC: .word 0x00091BD3
_0200B8D0: .word 0x0000493D
	thumb_func_end ReadMsgData_ExistingTable_NewString

	thumb_func_start ReadMsgData_NewNarc_ExistingString
ReadMsgData_NewNarc_ExistingString: ; 0x0200B8D4
	push {r3, r4, r5, r6, r7, lr}
	add r7, r3, #0
	add r5, r1, #0
	add r1, r7, #0
	add r4, r2, #0
	bl NARC_ctor
	add r6, r0, #0
	beq _0200B8FA
	ldr r1, [sp, #0x18]
	add r2, r4, #0
	str r1, [sp]
	add r1, r5, #0
	add r3, r7, #0
	bl ReadMsgData_ExistingNarc_ExistingString
	add r0, r6, #0
	bl NARC_dtor
_0200B8FA:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ReadMsgData_NewNarc_ExistingString

	thumb_func_start ReadMsgData_ExistingNarc_ExistingString
ReadMsgData_ExistingNarc_ExistingString: ; 0x0200B8FC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r2, #0
	add r2, sp, #0x10
	add r4, r3, #0
	str r2, [sp]
	mov r2, #0
	mov r3, #4
	add r7, r0, #0
	str r1, [sp, #4]
	bl NARC_ReadFromMember
	add r0, sp, #8
	ldrh r0, [r0, #8]
	cmp r5, r0
	bhs _0200B9AA
	add r0, sp, #8
	lsl r2, r5, #3
	str r0, [sp]
	ldr r1, [sp, #4]
	add r0, r7, #0
	add r2, r2, #4
	mov r3, #8
	bl NARC_ReadFromMember
	add r0, sp, #8
	ldrh r2, [r0, #0xa]
	ldr r0, _0200B9B8 ; =0x000002FD
	add r1, r5, #1
	mul r0, r2
	mul r0, r1
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	lsl r0, r1, #0x10
	orr r1, r0
	ldr r0, [sp, #8]
	eor r0, r1
	str r0, [sp, #8]
	ldr r0, [sp, #0xc]
	eor r0, r1
	lsl r6, r0, #1
	str r0, [sp, #0xc]
	add r0, r4, #0
	add r1, r6, #0
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	beq _0200B9B4
	str r4, [sp]
	ldr r1, [sp, #4]
	ldr r2, [sp, #8]
	add r0, r7, #0
	add r3, r6, #0
	bl NARC_ReadFromMember
	ldr r2, _0200B9BC ; =0x00091BD3
	add r3, r5, #1
	mul r2, r3
	lsl r2, r2, #0x10
	ldr r0, [sp, #0xc]
	lsr r3, r2, #0x10
	add r1, r4, #0
	sub r2, r0, #1
	cmp r0, #0
	beq _0200B996
	ldr r0, _0200B9C0 ; =0x0000493D
_0200B980:
	ldrh r5, [r1]
	eor r5, r3
	strh r5, [r1]
	add r3, r3, r0
	lsl r3, r3, #0x10
	add r5, r2, #0
	add r1, r1, #2
	lsr r3, r3, #0x10
	sub r2, r2, #1
	cmp r5, #0
	bne _0200B980
_0200B996:
	ldr r0, [sp, #0x28]
	ldr r2, [sp, #0xc]
	add r1, r4, #0
	bl CopyU16ArrayToStringN
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
_0200B9AA:
	bl GF_AssertFail
	ldr r0, [sp, #0x28]
	bl StringSetEmpty
_0200B9B4:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0200B9B8: .word 0x000002FD
_0200B9BC: .word 0x00091BD3
_0200B9C0: .word 0x0000493D
	thumb_func_end ReadMsgData_ExistingNarc_ExistingString

	thumb_func_start ReadMsgData_NewNarc_NewString
ReadMsgData_NewNarc_NewString: ; 0x0200B9C4
	push {r3, r4, r5, r6, r7, lr}
	add r6, r3, #0
	add r5, r1, #0
	add r1, r6, #0
	add r4, r2, #0
	bl NARC_ctor
	add r7, r0, #0
	beq _0200B9EA
	add r1, r5, #0
	add r2, r4, #0
	add r3, r6, #0
	bl ReadMsgData_ExistingNarc_NewString
	add r4, r0, #0
	add r0, r7, #0
	bl NARC_dtor
	b _0200B9F4
_0200B9EA:
	mov r0, #4
	add r1, r6, #0
	bl String_ctor
	add r4, r0, #0
_0200B9F4:
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ReadMsgData_NewNarc_NewString

	thumb_func_start ReadMsgData_ExistingNarc_NewString
ReadMsgData_ExistingNarc_NewString: ; 0x0200B9F8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r4, r2, #0
	add r2, sp, #0x14
	add r5, r3, #0
	str r2, [sp]
	mov r2, #0
	mov r3, #4
	add r7, r0, #0
	str r1, [sp, #4]
	bl NARC_ReadFromMember
	add r0, sp, #0xc
	ldrh r0, [r0, #8]
	cmp r4, r0
	bhs _0200BAB6
	add r0, sp, #0xc
	lsl r2, r4, #3
	str r0, [sp]
	ldr r1, [sp, #4]
	add r0, r7, #0
	add r2, r2, #4
	mov r3, #8
	bl NARC_ReadFromMember
	add r0, sp, #0xc
	ldrh r2, [r0, #0xa]
	ldr r0, _0200BAC8 ; =0x000002FD
	add r1, r4, #1
	mul r0, r2
	mul r0, r1
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	lsl r0, r1, #0x10
	orr r1, r0
	ldr r0, [sp, #0xc]
	eor r0, r1
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x10]
	eor r0, r1
	add r1, r5, #0
	str r0, [sp, #0x10]
	bl String_ctor
	str r0, [sp, #8]
	cmp r0, #0
	beq _0200BAB0
	ldr r0, [sp, #0x10]
	lsl r6, r0, #1
	add r0, r5, #0
	add r1, r6, #0
	bl AllocFromHeapAtEnd
	add r5, r0, #0
	beq _0200BAB0
	str r5, [sp]
	ldr r1, [sp, #4]
	ldr r2, [sp, #0xc]
	add r0, r7, #0
	add r3, r6, #0
	bl NARC_ReadFromMember
	ldr r2, _0200BACC ; =0x00091BD3
	add r3, r4, #1
	mul r2, r3
	lsl r2, r2, #0x10
	ldr r0, [sp, #0x10]
	lsr r3, r2, #0x10
	add r1, r5, #0
	sub r2, r0, #1
	cmp r0, #0
	beq _0200BAA0
	ldr r0, _0200BAD0 ; =0x0000493D
_0200BA8A:
	ldrh r4, [r1]
	eor r4, r3
	strh r4, [r1]
	add r3, r3, r0
	lsl r3, r3, #0x10
	add r4, r2, #0
	add r1, r1, #2
	lsr r3, r3, #0x10
	sub r2, r2, #1
	cmp r4, #0
	bne _0200BA8A
_0200BAA0:
	ldr r0, [sp, #8]
	ldr r2, [sp, #0x10]
	add r1, r5, #0
	bl CopyU16ArrayToStringN
	add r0, r5, #0
	bl FreeToHeap
_0200BAB0:
	ldr r0, [sp, #8]
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
_0200BAB6:
	bl GF_AssertFail
	mov r0, #4
	add r1, r5, #0
	bl String_ctor
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0200BAC8: .word 0x000002FD
_0200BACC: .word 0x00091BD3
_0200BAD0: .word 0x0000493D
	thumb_func_end ReadMsgData_ExistingNarc_NewString

	thumb_func_start GetMsgCount_ExistingTable
GetMsgCount_ExistingTable: ; 0x0200BAD4
	ldrh r0, [r0]
	bx lr
	thumb_func_end GetMsgCount_ExistingTable

	thumb_func_start GetMsgCount_TableFromNarc
GetMsgCount_TableFromNarc: ; 0x0200BAD8
	push {r3, lr}
	sub sp, #8
	add r3, r0, #0
	mov r0, #4
	add r2, r1, #0
	str r0, [sp]
	add r1, r3, #0
	add r0, sp, #4
	mov r3, #0
	bl ReadFromNarcMemberByIdPair
	add r0, sp, #4
	ldrh r0, [r0]
	add sp, #8
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end GetMsgCount_TableFromNarc

	thumb_func_start NewMsgDataFromNarc
NewMsgDataFromNarc: ; 0x0200BAF8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	add r0, r3, #0
	mov r1, #0xc
	add r7, r2, #0
	str r3, [sp]
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	beq _0200BB40
	cmp r5, #0
	bne _0200BB2C
	ldr r2, [sp]
	add r0, r6, #0
	add r1, r7, #0
	bl LoadSingleElementFromNarc
	str r0, [r4, #8]
	cmp r0, #0
	bne _0200BB36
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0200BB2C:
	ldr r1, [sp]
	add r0, r6, #0
	bl NARC_ctor
	str r0, [r4, #8]
_0200BB36:
	strh r5, [r4]
	strh r6, [r4, #4]
	ldr r0, [sp]
	strh r7, [r4, #6]
	strh r0, [r4, #2]
_0200BB40:
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end NewMsgDataFromNarc

	thumb_func_start DestroyMsgData
DestroyMsgData: ; 0x0200BB44
	push {r4, lr}
	add r4, r0, #0
	beq _0200BB6A
	ldrh r0, [r4]
	cmp r0, #0
	beq _0200BB56
	cmp r0, #1
	beq _0200BB5E
	b _0200BB64
_0200BB56:
	ldr r0, [r4, #8]
	bl FreeMsgDataRawData
	b _0200BB64
_0200BB5E:
	ldr r0, [r4, #8]
	bl NARC_dtor
_0200BB64:
	add r0, r4, #0
	bl FreeToHeap
_0200BB6A:
	pop {r4, pc}
	thumb_func_end DestroyMsgData

	thumb_func_start ReadMsgDataIntoString
ReadMsgDataIntoString: ; 0x0200BB6C
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	ldrh r0, [r4]
	add r3, r1, #0
	cmp r0, #0
	beq _0200BB82
	cmp r0, #1
	beq _0200BB8C
	add sp, #4
	pop {r3, r4, pc}
_0200BB82:
	ldr r0, [r4, #8]
	bl ReadMsgData_ExistingTable_ExistingString
	add sp, #4
	pop {r3, r4, pc}
_0200BB8C:
	str r2, [sp]
	add r2, r3, #0
	ldrh r1, [r4, #6]
	ldrh r3, [r4, #2]
	ldr r0, [r4, #8]
	bl ReadMsgData_ExistingNarc_ExistingString
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ReadMsgDataIntoString

	thumb_func_start NewString_ReadMsgData
NewString_ReadMsgData: ; 0x0200BBA0
	push {r3, lr}
	add r3, r0, #0
	ldrh r0, [r3]
	add r2, r1, #0
	cmp r0, #0
	beq _0200BBB2
	cmp r0, #1
	beq _0200BBBC
	b _0200BBC8
_0200BBB2:
	ldrh r2, [r3, #2]
	ldr r0, [r3, #8]
	bl ReadMsgData_ExistingTable_NewString
	pop {r3, pc}
_0200BBBC:
	ldr r0, [r3, #8]
	ldrh r1, [r3, #6]
	ldrh r3, [r3, #2]
	bl ReadMsgData_ExistingNarc_NewString
	pop {r3, pc}
_0200BBC8:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end NewString_ReadMsgData

	thumb_func_start MsgDataGetCount
MsgDataGetCount: ; 0x0200BBCC
	push {r3, lr}
	add r1, r0, #0
	ldrh r0, [r1]
	cmp r0, #0
	beq _0200BBDC
	cmp r0, #1
	beq _0200BBE4
	b _0200BBEE
_0200BBDC:
	ldr r0, [r1, #8]
	bl GetMsgCount_ExistingTable
	pop {r3, pc}
_0200BBE4:
	ldrh r0, [r1, #4]
	ldrh r1, [r1, #6]
	bl GetMsgCount_TableFromNarc
	pop {r3, pc}
_0200BBEE:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end MsgDataGetCount

	thumb_func_start ReadMsgDataIntoU16Array
ReadMsgDataIntoU16Array: ; 0x0200BBF4
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	ldrh r0, [r4]
	add r3, r1, #0
	cmp r0, #0
	beq _0200BC0A
	cmp r0, #1
	beq _0200BC14
	add sp, #4
	pop {r3, r4, pc}
_0200BC0A:
	ldr r0, [r4, #8]
	bl ReadMsgData_ExistingTable_ExistingArray
	add sp, #4
	pop {r3, r4, pc}
_0200BC14:
	str r2, [sp]
	add r2, r3, #0
	ldrh r0, [r4, #4]
	ldrh r1, [r4, #6]
	ldrh r3, [r4, #2]
	bl ReadMsgData_NewNarc_ExistingArray
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ReadMsgDataIntoU16Array

	thumb_func_start GetSpeciesNameIntoArray
GetSpeciesNameIntoArray: ; 0x0200BC28
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r3, r1, #0
	add r4, r2, #0
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0xed
	bl NewMsgDataFromNarc
	add r6, r0, #0
	add r1, r5, #0
	add r2, r4, #0
	bl ReadMsgDataIntoU16Array
	add r0, r6, #0
	bl DestroyMsgData
	pop {r4, r5, r6, pc}
	thumb_func_end GetSpeciesNameIntoArray

	thumb_func_start ReadMsgData_ExpandPlaceholders
ReadMsgData_ExpandPlaceholders: ; 0x0200BC4C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r7, r0, #0
	mov r0, #0
	str r0, [sp, #4]
	add r5, r1, #0
	mov r0, #1
	ldr r1, [sp, #4]
	lsl r0, r0, #0xa
	add r6, r2, #0
	str r3, [sp]
	bl String_ctor
	add r4, r0, #0
	beq _0200BC96
	add r0, r5, #0
	add r1, r6, #0
	bl NewString_ReadMsgData
	add r5, r0, #0
	beq _0200BC90
	add r0, r7, #0
	add r1, r4, #0
	add r2, r5, #0
	bl StringExpandPlaceholders
	ldr r1, [sp]
	add r0, r4, #0
	bl StringDup
	str r0, [sp, #4]
	add r0, r5, #0
	bl String_dtor
_0200BC90:
	add r0, r4, #0
	bl String_dtor
_0200BC96:
	ldr r0, [sp, #4]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ReadMsgData_ExpandPlaceholders

	thumb_func_start GetMoveName
GetMoveName: ; 0x0200BC9C
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r6, r0, #0
	ldr r2, _0200BCD8 ; =0x000002EE
	mov r0, #1
	mov r1, #0x1b
	add r3, r5, #0
	bl NewMsgDataFromNarc
	add r4, r0, #0
	beq _0200BCD2
	mov r0, #0x10
	add r1, r5, #0
	bl String_ctor
	add r5, r0, #0
	beq _0200BCC8
	add r0, r4, #0
	add r1, r6, #0
	add r2, r5, #0
	bl ReadMsgDataIntoString
_0200BCC8:
	add r0, r4, #0
	bl DestroyMsgData
	add r0, r5, #0
	pop {r4, r5, r6, pc}
_0200BCD2:
	mov r0, #0
	pop {r4, r5, r6, pc}
	nop
_0200BCD8: .word 0x000002EE
	thumb_func_end GetMoveName

	thumb_func_start GetSpeciesName
GetSpeciesName: ; 0x0200BCDC
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r3, r1, #0
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0xed
	bl NewMsgDataFromNarc
	add r5, r0, #0
	beq _0200BD02
	add r1, r4, #0
	bl NewString_ReadMsgData
	add r4, r0, #0
	add r0, r5, #0
	bl DestroyMsgData
	add r0, r4, #0
	pop {r3, r4, r5, pc}
_0200BD02:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end GetSpeciesName
