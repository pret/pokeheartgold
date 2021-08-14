	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ListMenuItems_ctor
ListMenuItems_ctor: ; 0x02014918
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r1, r5, #1
	add r0, r4, #0
	lsl r1, r1, #3
	bl AllocFromHeap
	cmp r0, #0
	beq _0201494E
	mov r2, #0
	cmp r5, #0
	bls _02014942
	add r3, r0, #0
	add r1, r2, #0
_02014936:
	str r1, [r3]
	str r1, [r3, #4]
	add r2, r2, #1
	add r3, #8
	cmp r2, r5
	blo _02014936
_02014942:
	mov r1, #0
	lsl r2, r2, #3
	mvn r1, r1
	str r1, [r0, r2]
	add r1, r0, r2
	str r4, [r1, #4]
_0201494E:
	pop {r3, r4, r5, pc}
	thumb_func_end ListMenuItems_ctor

	thumb_func_start ListMenuItems_dtor
ListMenuItems_dtor: ; 0x02014950
	push {r4, lr}
	add r4, r0, #0
	bl ListMenuItems_DestroyMenuStrings
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end ListMenuItems_dtor

	thumb_func_start ListMenuItems_AppendFromMsgData
ListMenuItems_AppendFromMsgData: ; 0x02014960
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	add r1, sp, #0
	add r7, r2, #0
	add r5, r3, #0
	bl ListMenuItems_SeekEnd
	add r4, r0, #0
	beq _0201497E
	add r0, r6, #0
	add r1, r7, #0
	bl NewString_ReadMsgData
	str r0, [r4]
	str r5, [r4, #4]
_0201497E:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ListMenuItems_AppendFromMsgData

	thumb_func_start ListMenuItems_AddItem
ListMenuItems_AddItem: ; 0x02014980
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r6, r1, #0
	add r1, sp, #0
	add r5, r2, #0
	bl ListMenuItems_SeekEnd
	add r4, r0, #0
	beq _0201499E
	ldr r1, [sp]
	add r0, r6, #0
	bl StringDup
	str r0, [r4]
	str r5, [r4, #4]
_0201499E:
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ListMenuItems_AddItem

	thumb_func_start ListMenuItems_SeekEnd
ListMenuItems_SeekEnd: ; 0x020149A4
	push {r4, lr}
	ldr r3, [r0]
	cmp r3, #0
	beq _020149C4
	mov r2, #0
	mvn r2, r2
_020149B0:
	cmp r3, r2
	bne _020149BC
	bl GF_AssertFail
	mov r0, #0
	pop {r4, pc}
_020149BC:
	add r0, #8
	ldr r3, [r0]
	cmp r3, #0
	bne _020149B0
_020149C4:
	mov r2, #0
	mvn r2, r2
	add r4, r0, #0
	cmp r3, r2
	beq _020149D6
_020149CE:
	add r0, #8
	ldr r3, [r0]
	cmp r3, r2
	bne _020149CE
_020149D6:
	ldr r0, [r0, #4]
	str r0, [r1]
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ListMenuItems_SeekEnd

	thumb_func_start ListMenuItems_DestroyMenuStrings
ListMenuItems_DestroyMenuStrings: ; 0x020149E0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r0, #0
	ldr r1, [r5]
	mvn r0, r0
	cmp r1, r0
	beq _02014A06
	mov r4, #0
	add r6, r0, #0
_020149F2:
	ldr r0, [r5]
	cmp r0, #0
	beq _02014A06
	bl String_dtor
	str r4, [r5]
	add r5, #8
	ldr r0, [r5]
	cmp r0, r6
	bne _020149F2
_02014A06:
	pop {r4, r5, r6, pc}
	thumb_func_end ListMenuItems_DestroyMenuStrings
