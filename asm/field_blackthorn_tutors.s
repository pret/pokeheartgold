#include "constants/easy_chat.h"
#include "constants/items.h"
#include "constants/maps.h"
#include "constants/moves.h"
#include "constants/species.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start MoveRelearner_new
MoveRelearner_new: ; 0x0209174C
	push {r3, lr}
	mov r1, #0x1c
	bl AllocFromHeap
	add r3, r0, #0
	mov r2, #0x1c
	mov r1, #0
_0209175A:
	strb r1, [r3]
	add r3, r3, #1
	sub r2, r2, #1
	bne _0209175A
	pop {r3, pc}
	thumb_func_end MoveRelearner_new

	thumb_func_start MoveRelearner_delete
MoveRelearner_delete: ; 0x02091764
	ldr r3, _02091768 ; =FreeToHeap
	bx r3
	.balign 4, 0
_02091768: .word FreeToHeap
	thumb_func_end MoveRelearner_delete

	thumb_func_start GetEligibleLevelUpMoves
GetEligibleLevelUpMoves: ; 0x0209176C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r1, [sp]
	mov r1, #5
	mov r2, #0
	add r5, r0, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0xc]
	add r0, r5, #0
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	add r0, r5, #0
	mov r1, #0xa1
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	mov r4, #0
	str r0, [sp, #4]
	add r7, r4, #0
	add r6, sp, #0x10
_020917A8:
	add r1, r4, #0
	add r0, r5, #0
	add r1, #0x36
	add r2, r7, #0
	bl GetMonData
	lsl r1, r4, #1
	strh r0, [r6, r1]
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #4
	blo _020917A8
	ldr r0, [sp]
	mov r1, #0x2a
	bl AllocFromHeap
	add r7, r0, #0
	ldr r0, [sp]
	mov r1, #0x2a
	bl AllocFromHeap
	add r4, r0, #0
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #8]
	add r2, r7, #0
	bl LoadWotbl_HandleAlternateForme
	mov r2, #0
	mov ip, r2
_020917E4:
	mov r0, ip
	lsl r0, r0, #1
	ldrh r5, [r7, r0]
	ldr r6, _02091868 ; =0x0000FFFF
	cmp r5, r6
	bne _020917F6
	lsl r0, r2, #1
	strh r6, [r4, r0]
	b _0209185C
_020917F6:
	mov r1, #0xfe
	lsl r1, r1, #8
	and r1, r5
	asr r3, r1, #9
	ldr r1, [sp, #4]
	cmp r3, r1
	bgt _0209184E
	lsr r1, r6, #7
	and r1, r5
	strh r1, [r7, r0]
	ldrh r3, [r7, r0]
	mov r1, #0
	add r6, sp, #0x10
_02091810:
	lsl r5, r1, #1
	ldrh r5, [r6, r5]
	cmp r3, r5
	beq _02091822
	add r1, r1, #1
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	cmp r1, #4
	blo _02091810
_02091822:
	cmp r1, #4
	bne _0209184E
	mov r1, #0
	cmp r2, #0
	bls _0209183E
_0209182C:
	lsl r5, r1, #1
	ldrh r5, [r4, r5]
	cmp r5, r3
	beq _0209183E
	add r1, r1, #1
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	cmp r1, r2
	blo _0209182C
_0209183E:
	cmp r1, r2
	bne _0209184E
	ldrh r1, [r7, r0]
	lsl r0, r2, #1
	strh r1, [r4, r0]
	add r0, r2, #1
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
_0209184E:
	mov r0, ip
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	mov ip, r0
	cmp r0, #0x15
	blo _020917E4
_0209185C:
	add r0, r7, #0
	bl FreeToHeap
	add r0, r4, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02091868: .word 0x0000FFFF
	thumb_func_end GetEligibleLevelUpMoves

	thumb_func_start sub_0209186C
sub_0209186C: ; 0x0209186C
	ldrh r1, [r0]
	ldr r0, _0209187C ; =0x0000FFFF
	cmp r1, r0
	beq _02091878
	mov r0, #1
	bx lr
_02091878:
	mov r0, #0
	bx lr
	.balign 4, 0
_0209187C: .word 0x0000FFFF
	thumb_func_end sub_0209186C
