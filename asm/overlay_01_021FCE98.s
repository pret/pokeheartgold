#include "constants/sndseq.h"
#include "constants/moves.h"
#include "constants/std_script.h"
#include "constants/species.h"
#include "constants/sprites.h"
#include "constants/maps.h"
#include "constants/mmodel.h"
#include "constants/items.h"
#include "msgdata/msg/msg_0096_D31R0201.h"
#include "msgdata/msg/msg_0066_D23R0102.h"
	.include "asm/macros.inc"
	.include "overlay_01_021FCE98.inc"
	.include "global.inc"

	.text

	thumb_func_start Task_UseSweetScentInField
Task_UseSweetScentInField: ; 0x021FCE98
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	bl TaskManager_GetFieldSystem
	add r6, r0, #0
	ldr r0, [sp]
	bl TaskManager_GetEnv
	add r7, r0, #0
	ldr r0, [sp]
	bl TaskManager_GetStatePtr
	add r4, r0, #0
	ldr r0, [r4]
	ldr r5, [r7, #4]
	cmp r0, #7
	bls _021FCEBC
	b _021FCFDE
_021FCEBC:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021FCEC8: ; jump table
	.short _021FCED8 - _021FCEC8 - 2 ; case 0
	.short _021FCEF4 - _021FCEC8 - 2 ; case 1
	.short _021FCF4E - _021FCEC8 - 2 ; case 2
	.short _021FCF6A - _021FCEC8 - 2 ; case 3
	.short _021FCF80 - _021FCEC8 - 2 ; case 4
	.short _021FCFAE - _021FCEC8 - 2 ; case 5
	.short _021FCFBC - _021FCEC8 - 2 ; case 6
	.short _021FCFCE - _021FCEC8 - 2 ; case 7
_021FCED8:
	ldr r6, [r5]
	add r0, r5, #0
	bl FreeToHeap
	mov r0, #0xb
	mov r1, #0xc
	bl AllocFromHeapAtEnd
	str r0, [r7, #4]
	str r6, [r0, #8]
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _021FCFDE
_021FCEF4:
	bl GetHoneySweetScentWorkSize
	add r7, r0, #0
	mov r0, #0xb
	add r1, r7, #0
	bl AllocFromHeapAtEnd
	str r0, [r5, #4]
	mov r1, #0
	add r2, r7, #0
	bl memset
	ldr r0, [r6, #0x40]
	bl PlayerAvatar_GetState
	sub r0, r0, #1
	cmp r0, #1  ; walking or biking?
	bhi _021FCF20
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _021FCFDE
_021FCF20:
	add r0, r6, #0
	bl ov01_022062CC
	ldr r1, [r5, #8]
	cmp r1, r0
	bne _021FCF46
	add r0, r6, #0
	bl sub_02069FB0
	cmp r0, #0
	beq _021FCF46
	ldr r0, [sp]
	ldr r1, _021FCFE4 ; =ov01_02205A60
	mov r2, #0
	bl TaskManager_Call
	mov r0, #4
	str r0, [r4]
	b _021FCFDE
_021FCF46:
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _021FCFDE
_021FCF4E:
	ldr r0, [r6, #0x40]
	bl PlayerAvatar_GetGender
	add r3, r0, #0
	ldr r2, [r7]
	add r0, r6, #0
	mov r1, #0
	bl ov02_02249458
	str r0, [r5]
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _021FCFDE
_021FCF6A:
	ldr r0, [r5]
	bl ov02_0224953C
	cmp r0, #0
	beq _021FCFDE
	ldr r0, [r5]
	bl ov02_02249548
	mov r0, #6
	str r0, [r4]
	b _021FCFDE
_021FCF80:
	add r0, r6, #0
	mov r1, #0xc
	bl ov02_02250780
	cmp r0, #0
	beq _021FCF9C
	mov r0, #0x42
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	mov r1, #1
	mov r5, #2
	bl FieldSystemUnkSub108_AddMonMood
	b _021FCF9E
_021FCF9C:
	mov r5, #1
_021FCF9E:
	add r0, r6, #0
	add r1, r5, #0
	bl ov02_022507B4
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _021FCFDE
_021FCFAE:
	add r0, r6, #0
	bl ov01_021FCFEC
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _021FCFDE
_021FCFBC:
	ldr r0, [sp]
	ldr r1, _021FCFE8 ; =Task_HoneyOrSweetScent
	ldr r2, [r5, #4]
	bl TaskManager_Call
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _021FCFDE
_021FCFCE:
	add r0, r5, #0
	bl FreeToHeap
	add r0, r7, #0
	bl FreeToHeap
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021FCFDE:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021FCFE4: .word ov01_02205A60
_021FCFE8: .word Task_HoneyOrSweetScent
	thumb_func_end Task_UseSweetScentInField

	thumb_func_start ov01_021FCFEC
ov01_021FCFEC: ; 0x021FCFEC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #4
	mov r1, #0xd4
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	mov r0, #4
	add r1, r5, #0
	add r2, r4, #0
	bl ov01_021FD064
	ldr r0, [r5, #0x10]
	ldr r1, _021FD010 ; =ov01_021FD014
	add r2, r4, #0
	bl TaskManager_Call
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021FD010: .word ov01_021FD014
	thumb_func_end ov01_021FCFEC

	thumb_func_start ov01_021FD014
ov01_021FD014: ; 0x021FD014
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl TaskManager_GetEnv
	add r5, r0, #0
	add r0, r4, #0
	bl TaskManager_GetStatePtr
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _021FD032
	cmp r0, #1
	beq _021FD050
	b _021FD060
_021FD032:
	add r0, r5, #0
	add r0, #0x20
	mov r1, #3
	bl ov01_021FD154
	cmp r0, #0
	beq _021FD046
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
_021FD046:
	add r5, #0x5c
	add r0, r5, #0
	bl ov01_021FBF68
	b _021FD060
_021FD050:
	add r0, r5, #0
	bl ov01_021FD128
	add r0, r5, #0
	bl FreeToHeap
	mov r0, #1
	pop {r3, r4, r5, pc}
_021FD060:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov01_021FD014

	thumb_func_start ov01_021FD064
ov01_021FD064: ; 0x021FD064
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	add r4, r2, #0
	add r5, r0, #0
	add r6, r1, #0
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #0x20
	bl GF_ExpHeap_FndInitAllocator
	add r0, r4, #0
	add r0, #0x10
	mov r1, #0x86
	mov r2, #0x17
	add r3, r5, #0
	bl ov01_021FBCD8
	add r0, r4, #0
	add r1, r4, #0
	str r5, [sp]
	add r0, #0x20
	add r1, #0x10
	mov r2, #0x86
	mov r3, #0x15
	str r4, [sp, #4]
	bl ov01_021FBE44
	add r0, r4, #0
	add r1, r4, #0
	str r5, [sp]
	add r0, #0x34
	add r1, #0x10
	mov r2, #0x86
	mov r3, #0x16
	str r4, [sp, #4]
	bl ov01_021FBE44
	add r0, r4, #0
	add r1, r4, #0
	str r5, [sp]
	add r0, #0x48
	add r1, #0x10
	mov r2, #0x86
	mov r3, #0x14
	str r4, [sp, #4]
	bl ov01_021FBE44
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0x5c
	add r1, #0x10
	bl ov01_021FBF2C
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0x5c
	add r1, #0x20
	bl ov01_021FBF50
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0x5c
	add r1, #0x34
	bl ov01_021FBF50
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0x5c
	add r1, #0x48
	bl ov01_021FBF50
	add r0, r4, #0
	add r0, #0x20
	mov r1, #3
	mov r2, #0
	bl ov01_021FD190
	add r0, r6, #0
	bl FollowingPokemon_GetMapObject
	add r1, sp, #8
	bl MapObject_GetPositionVec
	add r0, r4, #0
	ldr r1, [sp, #8]
	ldr r2, [sp, #0xc]
	ldr r3, [sp, #0x10]
	add r0, #0x5c
	bl ov01_021FC00C
	add r4, #0x5c
	add r0, r4, #0
	mov r1, #1
	bl ov01_021FC004
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov01_021FD064

	thumb_func_start ov01_021FD128
ov01_021FD128: ; 0x021FD128
	push {r4, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r0, #0x48
	bl ov01_021FBE80
	add r0, r4, #0
	add r0, #0x34
	add r1, r4, #0
	bl ov01_021FBE80
	add r0, r4, #0
	add r0, #0x20
	add r1, r4, #0
	bl ov01_021FBE80
	add r4, #0x10
	add r0, r4, #0
	bl ov01_021FBDA8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021FD128

	thumb_func_start ov01_021FD154
ov01_021FD154: ; 0x021FD154
	push {r3, r4, r5, r6, r7, lr}
	mov r5, #0
	add r6, r1, #0
	add r7, r0, #0
	add r4, r5, #0
	cmp r6, #0
	bls _021FD184
_021FD162:
	mov r0, #0x14
	mul r0, r4
	mov r1, #1
	add r0, r7, r0
	lsl r1, r1, #0xc
	bl ov01_021FBEE4
	cmp r0, #0
	beq _021FD17A
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
_021FD17A:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, r6
	blo _021FD162
_021FD184:
	cmp r5, r6
	bne _021FD18C
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021FD18C:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov01_021FD154

	thumb_func_start ov01_021FD190
ov01_021FD190: ; 0x021FD190
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r6, r0, #0
	add r7, r2, #0
	mov r4, #0
	cmp r5, #0
	bls _021FD1B4
_021FD19E:
	mov r0, #0x14
	mul r0, r4
	add r0, r6, r0
	add r1, r7, #0
	bl ov01_021FBF20
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, r5
	blo _021FD19E
_021FD1B4:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_021FD190
