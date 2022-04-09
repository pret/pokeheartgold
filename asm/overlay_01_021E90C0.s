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
	.include "global.inc"

	.text

	thumb_func_start ov01_021E90C0
ov01_021E90C0: ; 0x021E90C0
	push {r3, lr}
	mov r0, #4
	mov r1, #0x20
	bl AllocFromHeapAtEnd
	mov r1, #0
	str r1, [r0]
	strh r1, [r0, #0x1c]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov01_021E90C0

	thumb_func_start ov01_021E90D4
ov01_021E90D4: ; 0x021E90D4
	ldr r3, _021E90D8 ; =FreeToHeap
	bx r3
	.balign 4, 0
_021E90D8: .word FreeToHeap
	thumb_func_end ov01_021E90D4

	thumb_func_start ov01_021E90DC
ov01_021E90DC: ; 0x021E90DC
	str r0, [r2, #4]
	str r1, [r2, #8]
	bx lr
	.balign 4, 0
	thumb_func_end ov01_021E90DC

	thumb_func_start ov01_021E90E4
ov01_021E90E4: ; 0x021E90E4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x58
	add r4, r1, #0
	add r6, r0, #0
	ldr r0, [r4]
	cmp r0, #0x64
	bgt _021E9112
	blt _021E90F6
	b _021E9308
_021E90F6:
	cmp r0, #5
	bhi _021E9118
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021E9106: ; jump table
	.short _021E911A - _021E9106 - 2 ; case 0
	.short _021E9218 - _021E9106 - 2 ; case 1
	.short _021E9256 - _021E9106 - 2 ; case 2
	.short _021E926A - _021E9106 - 2 ; case 3
	.short _021E92B0 - _021E9106 - 2 ; case 4
	.short _021E92F6 - _021E9106 - 2 ; case 5
_021E9112:
	cmp r0, #0x65
	bne _021E9118
	b _021E9336
_021E9118:
	b _021E934C
_021E911A:
	mov r0, #0
	str r0, [r4, #0x10]
	strb r0, [r4, #0xd]
	mov r0, #3
	str r0, [sp]
	mov r2, #1
	str r2, [sp, #4]
	add r0, sp, #0x48
	str r0, [sp, #8]
	sub r2, r2, #2
	ldr r0, [r4, #4]
	ldr r1, [r4, #8]
	add r3, r2, #0
	bl sub_02054A60
	mov r0, #1
	strb r0, [r4, #0xc]
	mov r0, #0
	str r0, [sp, #0x24]
	ldr r0, [r6, #0x34]
	bl ov01_021FB904
	str r0, [sp, #0x1c]
	mov r0, #0
	mov r1, #4
	str r0, [sp]
	add r0, r6, #0
	add r2, r1, #0
	add r3, sp, #0x48
	bl sub_02054D10
	str r0, [sp, #0x18]
	mov r7, #0
	add r5, r0, #0
_021E915E:
	ldr r1, [r5]
	cmp r1, #0
	beq _021E9190
	ldr r0, [sp, #0x1c]
	add r2, sp, #0x30
	bl NARC_ReadWholeMember
	add r0, sp, #0x2c
	ldrb r0, [r0, #8]
	cmp r0, #0
	beq _021E9190
	ldr r1, [sp, #0x18]
	lsl r5, r7, #2
	ldr r1, [r1, r5]
	add r0, r6, #0
	add r2, sp, #0x48
	add r3, sp, #0x2c
	bl sub_02054AE4
	mov r0, #1
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x18]
	ldr r0, [r0, r5]
	str r0, [sp, #0x20]
	b _021E9198
_021E9190:
	add r7, r7, #1
	add r5, r5, #4
	cmp r7, #4
	blt _021E915E
_021E9198:
	ldr r0, [sp, #0x18]
	bl FreeToHeap
	ldr r0, [sp, #0x24]
	cmp r0, #0
	beq _021E91F4
	ldr r0, [r6, #0x54]
	ldr r1, [sp, #0x20]
	bl ov01_021E8BAC
	add r7, r0, #0
	bne _021E91B6
	add sp, #0x58
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E91B6:
	ldr r0, [r6, #0x34]
	bl ov01_021FB9E0
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x2c]
	bl ov01_021F3B38
	add r5, r0, #0
	ldr r0, [sp, #0x2c]
	bl ov01_021F3B3C
	str r5, [sp]
	str r0, [sp, #4]
	ldr r0, [sp, #0x28]
	mov r2, #1
	str r0, [sp, #8]
	str r7, [sp, #0xc]
	str r2, [sp, #0x10]
	mov r0, #0
	str r0, [sp, #0x14]
	ldr r0, [r6, #0x54]
	ldr r1, [r6, #0x58]
	ldr r3, [sp, #0x20]
	bl ov01_021E8DE8
	mov r1, #1
	ldr r0, [r6, #0x58]
	add r2, r1, #0
	bl ov01_021E90B0
	b _021E91FA
_021E91F4:
	add sp, #0x58
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E91FA:
	ldr r0, [sp, #0x20]
	bl ov01_021E9700
	strh r0, [r4, #0x1e]
	ldrh r1, [r4, #0x1e]
	ldr r0, _021E9368 ; =0x0000FFFF
	cmp r1, r0
	beq _021E9210
	mov r0, #0x64
	str r0, [r4]
	b _021E934C
_021E9210:
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _021E934C
_021E9218:
	ldr r0, [r6, #0x58]
	mov r1, #1
	bl ov01_021E8F30
	add r5, r0, #0
	add r0, r6, #0
	add r1, r5, #0
	bl ov01_021EA1F4
	cmp r0, #0
	bne _021E9238
	ldr r0, [r6, #0x24]
	bl sub_02023234
	mov r0, #1
	str r0, [r4, #0x10]
_021E9238:
	add r0, r6, #0
	add r1, r5, #0
	mov r2, #1
	bl GetDoorSE
	add r3, r0, #0
	ldr r0, [r6, #0x58]
	mov r1, #1
	mov r2, #0
	bl ov01_021E8E98
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _021E934C
_021E9256:
	ldr r0, [r6, #0x58]
	mov r1, #1
	bl ov01_021E8F10
	cmp r0, #0
	beq _021E934C
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _021E934C
_021E926A:
	ldr r0, [r6, #0x40]
	bl PlayerAvatar_GetMapObject
	mov r1, #0xc
	add r5, r0, #0
	bl MapObject_SetHeldMovement
	add r0, r6, #0
	bl FollowingPokemon_IsActive
	cmp r0, #0
	beq _021E92A8
	add r0, r6, #0
	bl ov01_022057C4
	cmp r0, #0
	bne _021E92A8
	add r0, r5, #0
	bl MapObject_GetPrevX
	add r7, r0, #0
	add r0, r5, #0
	bl MapObject_GetPrevY
	add r3, r6, #0
	add r2, r0, #0
	mov r0, #0xc
	add r1, r7, #0
	add r3, #0xe4
	bl ov01_02205990
_021E92A8:
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _021E934C
_021E92B0:
	ldr r0, [r6, #0x40]
	bl PlayerAvatar_GetMapObject
	add r5, r0, #0
	bl MapObject_IsMovementPaused
	cmp r0, #1
	bne _021E934C
	add r0, r6, #0
	bl FollowingPokemon_IsActive
	cmp r0, #0
	beq _021E92EE
	add r0, r6, #0
	bl FollowingPokemon_GetMapObject
	add r7, r0, #0
	bl MapObject_IsMovementPaused
	cmp r0, #1
	bne _021E934C
	add r0, r5, #0
	bl MapObject_ClearHeldMovementIfActive
	add r0, r7, #0
	bl MapObject_ClearHeldMovementIfActive
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _021E934C
_021E92EE:
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _021E934C
_021E92F6:
	ldr r0, [r6, #0x40]
	bl PlayerAvatar_GetMapObject
	mov r1, #1
	bl sub_0205F690
	add sp, #0x58
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E9308:
	mov r0, #0x96
	ldr r1, _021E936C ; =0x00456000
	ldr r2, [r6, #0x24]
	lsl r0, r0, #0xc
	bl GF_Camera_SetClipBounds
	ldr r1, [r6, #0x24]
	mov r0, #4
	bl CreateCameraTranslationWrapper
	str r0, [r4, #0x18]
	ldrh r2, [r4, #0x1e]
	mov r1, #0x14
	ldr r3, _021E9370 ; =ov01_02206428
	mul r1, r2
	add r1, r3, r1
	mov r2, #0x18
	bl SetCameraTranslationPath
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _021E934C
_021E9336:
	ldr r0, [r4, #0x18]
	bl IsCameraTranslationFinished
	cmp r0, #0
	beq _021E934C
	ldr r0, [r4, #0x18]
	bl DeleteCameraTranslationWrapper
	mov r0, #1
	strh r0, [r4, #0x1c]
	str r0, [r4]
_021E934C:
	ldr r0, [r4, #0x10]
	cmp r0, #0
	beq _021E9362
	ldrh r0, [r4, #0x1c]
	cmp r0, #0
	bne _021E9362
	add r4, #0xd
	ldr r0, [r6, #0x24]
	add r1, r4, #0
	bl ov01_021E95CC
_021E9362:
	mov r0, #0
	add sp, #0x58
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E9368: .word 0x0000FFFF
_021E936C: .word 0x00456000
_021E9370: .word ov01_02206428
	thumb_func_end ov01_021E90E4

	thumb_func_start ov01_021E9374
ov01_021E9374: ; 0x021E9374
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x58
	add r6, r1, #0
	add r4, r0, #0
	ldr r0, [r6]
	cmp r0, #6
	bls _021E9384
	b _021E95B0
_021E9384:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021E9390: ; jump table
	.short _021E939E - _021E9390 - 2 ; case 0
	.short _021E94AA - _021E9390 - 2 ; case 1
	.short _021E94FA - _021E9390 - 2 ; case 2
	.short _021E951A - _021E9390 - 2 ; case 3
	.short _021E952E - _021E9390 - 2 ; case 4
	.short _021E9572 - _021E9390 - 2 ; case 5
	.short _021E95A2 - _021E9390 - 2 ; case 6
_021E939E:
	mov r3, #0
	str r3, [r6, #0x10]
	strb r3, [r6, #0xd]
	mov r0, #3
	str r0, [sp]
	mov r2, #1
	str r2, [sp, #4]
	add r0, sp, #0x48
	str r0, [sp, #8]
	ldr r0, [r6, #4]
	ldr r1, [r6, #8]
	sub r2, r2, #2
	bl sub_02054A60
	mov r0, #1
	strb r0, [r6, #0xc]
	mov r0, #0
	str r0, [sp, #0x24]
	ldr r0, [r4, #0x34]
	bl ov01_021FB904
	str r0, [sp, #0x1c]
	mov r0, #0
	mov r1, #4
	str r0, [sp]
	add r0, r4, #0
	add r2, r1, #0
	add r3, sp, #0x48
	bl sub_02054D10
	str r0, [sp, #0x18]
	mov r7, #0
	add r5, r0, #0
_021E93E0:
	ldr r1, [r5]
	cmp r1, #0
	beq _021E9412
	ldr r0, [sp, #0x1c]
	add r2, sp, #0x30
	bl NARC_ReadWholeMember
	add r0, sp, #0x2c
	ldrb r0, [r0, #8]
	cmp r0, #0
	beq _021E9412
	ldr r1, [sp, #0x18]
	lsl r5, r7, #2
	ldr r1, [r1, r5]
	add r0, r4, #0
	add r2, sp, #0x48
	add r3, sp, #0x2c
	bl sub_02054AE4
	mov r0, #1
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x18]
	ldr r0, [r0, r5]
	str r0, [sp, #0x20]
	b _021E941A
_021E9412:
	add r7, r7, #1
	add r5, r5, #4
	cmp r7, #4
	blt _021E93E0
_021E941A:
	ldr r0, [sp, #0x18]
	bl FreeToHeap
	ldr r0, [sp, #0x24]
	cmp r0, #0
	beq _021E9476
	ldr r0, [r4, #0x54]
	ldr r1, [sp, #0x20]
	bl ov01_021E8BAC
	add r7, r0, #0
	bne _021E9442
	mov r0, #1
	bl ov01_021E636C
	mov r0, #6
	str r0, [r6]
	add sp, #0x58
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E9442:
	ldr r0, [r4, #0x34]
	bl ov01_021FB9E0
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x2c]
	bl ov01_021F3B38
	add r5, r0, #0
	ldr r0, [sp, #0x2c]
	bl ov01_021F3B3C
	str r5, [sp]
	str r0, [sp, #4]
	ldr r0, [sp, #0x28]
	mov r2, #1
	str r0, [sp, #8]
	str r7, [sp, #0xc]
	str r2, [sp, #0x10]
	mov r0, #0
	str r0, [sp, #0x14]
	ldr r0, [r4, #0x54]
	ldr r1, [r4, #0x58]
	ldr r3, [sp, #0x20]
	bl ov01_021E8DE8
	b _021E9486
_021E9476:
	mov r0, #1
	bl ov01_021E636C
	mov r0, #6
	str r0, [r6]
	add sp, #0x58
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E9486:
	ldr r0, [r4, #0x24]
	bl GF_Camera_GetPerspectiveAngle
	strh r0, [r6, #0xe]
	ldr r1, [sp, #0x20]
	add r0, r4, #0
	bl ov01_021EA1F4
	cmp r0, #0
	bne _021E94A2
	ldr r0, _021E95C8 ; =0x0000FFA0
	ldr r1, [r4, #0x24]
	bl sub_020234D0
_021E94A2:
	ldr r0, [r6]
	add r0, r0, #1
	str r0, [r6]
	b _021E95B0
_021E94AA:
	mov r1, #0
	str r1, [sp]
	mov r0, #6
	str r0, [sp, #4]
	mov r3, #1
	str r3, [sp, #8]
	mov r0, #0xb
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x10]
	mov r2, #9
	bl sub_02055BF0
	ldr r0, [r4, #0x58]
	mov r1, #1
	bl ov01_021E8F30
	add r5, r0, #0
	add r0, r4, #0
	add r1, r5, #0
	bl ov01_021EA1F4
	cmp r0, #0
	bne _021E94DC
	mov r0, #1
	str r0, [r6, #0x10]
_021E94DC:
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #1
	bl GetDoorSE
	add r3, r0, #0
	ldr r0, [r4, #0x58]
	mov r1, #1
	mov r2, #0
	bl ov01_021E8E98
	ldr r0, [r6]
	add r0, r0, #1
	str r0, [r6]
	b _021E95B0
_021E94FA:
	ldr r0, [r4, #0x58]
	mov r1, #1
	bl ov01_021E8F10
	cmp r0, #0
	beq _021E95B0
	ldr r0, [r4, #0x40]
	bl PlayerAvatar_GetMapObject
	mov r1, #0
	bl sub_0205F690
	ldr r0, [r6]
	add r0, r0, #1
	str r0, [r6]
	b _021E95B0
_021E951A:
	ldr r0, [r4, #0x40]
	bl PlayerAvatar_GetMapObject
	mov r1, #0xd
	bl MapObject_SetHeldMovement
	ldr r0, [r6]
	add r0, r0, #1
	str r0, [r6]
	b _021E95B0
_021E952E:
	ldr r0, [r4, #0x40]
	bl PlayerAvatar_GetMapObject
	add r5, r0, #0
	bl MapObject_IsMovementPaused
	cmp r0, #1
	bne _021E95B0
	add r0, r5, #0
	bl MapObject_ClearHeldMovementIfActive
	add r0, r4, #0
	mov r1, #1
	bl ov01_02205790
	ldr r0, [r4, #0x58]
	mov r1, #1
	bl ov01_021E8F30
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #0
	bl GetDoorSE
	add r3, r0, #0
	mov r1, #1
	ldr r0, [r4, #0x58]
	add r2, r1, #0
	bl ov01_021E8E98
	ldr r0, [r6]
	add r0, r0, #1
	str r0, [r6]
	b _021E95B0
_021E9572:
	ldr r0, [r4, #0x58]
	mov r1, #1
	bl ov01_021E8F10
	cmp r0, #0
	beq _021E95B0
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021E95B0
	ldr r0, [r4, #0x24]
	bl GF_Camera_GetPerspectiveAngle
	ldrh r1, [r6, #0xe]
	cmp r1, r0
	bne _021E95B0
	ldr r0, [r4, #0x54]
	ldr r1, [r4, #0x58]
	mov r2, #1
	bl ov01_021E8ED0
	add sp, #0x58
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E95A2:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021E95B0
	add sp, #0x58
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E95B0:
	ldr r0, [r6, #0x10]
	cmp r0, #0
	beq _021E95C0
	add r6, #0xd
	ldr r0, [r4, #0x24]
	add r1, r6, #0
	bl ov01_021E9610
_021E95C0:
	mov r0, #0
	add sp, #0x58
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E95C8: .word 0x0000FFA0
	thumb_func_end ov01_021E9374

	thumb_func_start ov01_021E95CC
ov01_021E95CC: ; 0x021E95CC
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r6, r0, #0
	ldrb r0, [r5]
	mov r4, #0xc
	add r1, r0, #0
	mul r1, r4
	cmp r1, #0x60
	bgt _021E960C
	lsl r0, r1, #0x10
	lsr r0, r0, #0x10
	cmp r0, #0x60
	bls _021E95EC
	sub r0, #0x60
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
_021E95EC:
	add r0, r6, #0
	bl GF_Camera_GetPerspectiveAngle
	sub r0, r0, r4
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	beq _021E9606
	neg r0, r4
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	add r1, r6, #0
	bl sub_020234D0
_021E9606:
	ldrb r0, [r5]
	add r0, r0, #1
	strb r0, [r5]
_021E960C:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov01_021E95CC

	thumb_func_start ov01_021E9610
ov01_021E9610: ; 0x021E9610
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r6, r0, #0
	ldrb r0, [r5]
	lsl r0, r0, #4
	cmp r0, #0x60
	bge _021E964C
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	cmp r0, #0x60
	bls _021E962E
	sub r0, #0x60
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	b _021E9630
_021E962E:
	mov r4, #0x10
_021E9630:
	add r0, r6, #0
	bl GF_Camera_GetPerspectiveAngle
	add r0, r0, r4
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	beq _021E9646
	add r0, r4, #0
	add r1, r6, #0
	bl sub_020234D0
_021E9646:
	ldrb r0, [r5]
	add r0, r0, #1
	strb r0, [r5]
_021E964C:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov01_021E9610

	thumb_func_start GetDoorSE
GetDoorSE: ; 0x021E9650
	push {r3, r4, r5, lr}
	sub sp, #0x18
	ldr r0, [r0, #0x34]
	add r5, r1, #0
	add r4, r2, #0
	bl ov01_021FB904
	add r1, r5, #0
	add r2, sp, #0
	bl NARC_ReadWholeMember
	cmp r4, #0
	add r0, sp, #0
	beq _021E96AA
	ldrb r0, [r0, #4]
	cmp r0, #4
	bhi _021E96A0
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021E967E: ; jump table
	.short _021E96A0 - _021E967E - 2 ; case 0
	.short _021E9688 - _021E967E - 2 ; case 1
	.short _021E968E - _021E967E - 2 ; case 2
	.short _021E9694 - _021E967E - 2 ; case 3
	.short _021E969A - _021E967E - 2 ; case 4
_021E9688:
	add sp, #0x18
	ldr r0, _021E96E8 ; =SEQ_SE_DP_DOOR_OPEN
	pop {r3, r4, r5, pc}
_021E968E:
	add sp, #0x18
	ldr r0, _021E96EC ; =SEQ_SE_DP_DOOR10
	pop {r3, r4, r5, pc}
_021E9694:
	add sp, #0x18
	ldr r0, _021E96F0 ; =SEQ_SE_PL_DOOR_OPEN5
	pop {r3, r4, r5, pc}
_021E969A:
	add sp, #0x18
	ldr r0, _021E96F4 ; =SEQ_SE_GS_HIKIDO_OPEN
	pop {r3, r4, r5, pc}
_021E96A0:
	bl GF_AssertFail
	add sp, #0x18
	ldr r0, _021E96E8 ; =SEQ_SE_DP_DOOR_OPEN
	pop {r3, r4, r5, pc}
_021E96AA:
	ldrb r0, [r0, #4]
	cmp r0, #4
	bhi _021E96DE
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021E96BC: ; jump table
	.short _021E96DE - _021E96BC - 2 ; case 0
	.short _021E96C6 - _021E96BC - 2 ; case 1
	.short _021E96CC - _021E96BC - 2 ; case 2
	.short _021E96D2 - _021E96BC - 2 ; case 3
	.short _021E96D8 - _021E96BC - 2 ; case 4
_021E96C6:
	add sp, #0x18
	ldr r0, _021E96F8 ; =SEQ_SE_DP_DOOR_CLOSE2
	pop {r3, r4, r5, pc}
_021E96CC:
	add sp, #0x18
	mov r0, #0
	pop {r3, r4, r5, pc}
_021E96D2:
	add sp, #0x18
	mov r0, #0
	pop {r3, r4, r5, pc}
_021E96D8:
	add sp, #0x18
	ldr r0, _021E96FC ; =SEQ_SE_GS_HIKIDO_CLOSE
	pop {r3, r4, r5, pc}
_021E96DE:
	bl GF_AssertFail
	ldr r0, _021E96F8 ; =SEQ_SE_DP_DOOR_CLOSE2
	add sp, #0x18
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E96E8: .word SEQ_SE_DP_DOOR_OPEN
_021E96EC: .word SEQ_SE_DP_DOOR10
_021E96F0: .word SEQ_SE_PL_DOOR_OPEN5
_021E96F4: .word SEQ_SE_GS_HIKIDO_OPEN
_021E96F8: .word SEQ_SE_DP_DOOR_CLOSE2
_021E96FC: .word SEQ_SE_GS_HIKIDO_CLOSE
	thumb_func_end GetDoorSE

	thumb_func_start ov01_021E9700
ov01_021E9700: ; 0x021E9700
	ldr r1, _021E9718 ; =0x0000FFFF
	cmp r0, #0x3d
	beq _021E970C
	cmp r0, #0xe0
	beq _021E9710
	b _021E9712
_021E970C:
	mov r1, #0
	b _021E9712
_021E9710:
	mov r1, #1
_021E9712:
	add r0, r1, #0
	bx lr
	nop
_021E9718: .word 0x0000FFFF
	thumb_func_end ov01_021E9700

	thumb_func_start ov01_021E971C
ov01_021E971C: ; 0x021E971C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x40
	add r4, r1, #0
	add r6, r0, #0
	ldr r0, [r4]
	add r5, r2, #0
	cmp r0, #5
	bls _021E972E
	b _021E98E0
_021E972E:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021E973A: ; jump table
	.short _021E9746 - _021E973A - 2 ; case 0
	.short _021E9806 - _021E973A - 2 ; case 1
	.short _021E9846 - _021E973A - 2 ; case 2
	.short _021E9866 - _021E973A - 2 ; case 3
	.short _021E988E - _021E973A - 2 ; case 4
	.short _021E98B4 - _021E973A - 2 ; case 5
_021E9746:
	ldr r3, _021E98E8 ; =ov01_02206408
	add r2, sp, #0x20
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	cmp r5, #2
	bne _021E9770
	mov r0, #2
	str r0, [sp]
	mov r2, #1
	str r2, [sp, #4]
	add r0, sp, #0x30
	str r0, [sp, #8]
	ldr r0, [r4, #4]
	ldr r1, [r4, #8]
	sub r2, r2, #2
	mov r3, #0
	bl sub_02054A60
	b _021E9788
_021E9770:
	mov r0, #2
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	add r0, sp, #0x30
	str r0, [sp, #8]
	mov r2, #0
	ldr r0, [r4, #4]
	ldr r1, [r4, #8]
	add r3, r2, #0
	bl sub_02054A60
_021E9788:
	mov r0, #2
	strb r0, [r4, #0xc]
	add r0, sp, #0x1c
	str r0, [sp]
	add r0, sp, #0x18
	str r0, [sp, #4]
	add r0, r6, #0
	add r1, sp, #0x20
	mov r2, #4
	add r3, sp, #0x30
	bl sub_02054B74
	cmp r0, #0
	beq _021E97D6
	ldr r0, [r6, #0x34]
	bl ov01_021FB9E0
	add r7, r0, #0
	ldr r0, [sp, #0x1c]
	bl ov01_021F3B38
	add r5, r0, #0
	ldr r0, [sp, #0x1c]
	bl ov01_021F3B3C
	str r5, [sp]
	str r0, [sp, #4]
	str r7, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	ldr r0, [r6, #0x54]
	ldr r1, [r6, #0x58]
	ldr r3, [sp, #0x18]
	mov r2, #2
	bl ov01_021E8DE8
	b _021E97E0
_021E97D6:
	bl GF_AssertFail
	add sp, #0x40
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E97E0:
	ldr r0, [r6, #0x40]
	bl PlayerAvatar_GetMapObject
	add r5, r0, #0
	bl MapObject_AreBitsSetForMovementScriptInit
	cmp r0, #1
	bne _021E97FA
	add r0, r5, #0
	mov r1, #0x49
	bl MapObject_SetHeldMovement
	b _021E97FE
_021E97FA:
	bl GF_AssertFail
_021E97FE:
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _021E98E0
_021E9806:
	mov r0, #1
	bl ov01_021E636C
	ldr r0, [r6, #0x58]
	ldr r3, _021E98EC ; =SEQ_SE_DP_ESUKA
	mov r1, #2
	mov r2, #0
	bl ov01_021E8E98
	ldr r0, [r6, #0x40]
	bl PlayerAvatar_GetMapObject
	add r6, r0, #0
	bl MapObject_AreBitsSetForMovementScriptInit
	cmp r0, #1
	bne _021E983A
	cmp r5, #3
	bne _021E9830
	mov r1, #0xb
	b _021E9832
_021E9830:
	mov r1, #0xa
_021E9832:
	add r0, r6, #0
	bl MapObject_SetHeldMovement
	b _021E983E
_021E983A:
	bl GF_AssertFail
_021E983E:
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _021E98E0
_021E9846:
	ldr r0, [r6, #0x40]
	bl PlayerAvatar_GetMapObject
	add r5, r0, #0
	bl MapObject_AreBitsSetForMovementScriptInit
	cmp r0, #1
	bne _021E98E0
	add r0, r5, #0
	mov r1, #0x4a
	bl MapObject_SetHeldMovement
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _021E98E0
_021E9866:
	ldr r0, [r6, #0x40]
	bl PlayerAvatar_GetMapObject
	add r6, r0, #0
	bl MapObject_AreBitsSetForMovementScriptInit
	cmp r0, #1
	bne _021E98E0
	cmp r5, #3
	bne _021E987E
	mov r1, #0xb
	b _021E9880
_021E987E:
	mov r1, #0xa
_021E9880:
	add r0, r6, #0
	bl MapObject_SetHeldMovement
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _021E98E0
_021E988E:
	ldr r0, [r6, #0x40]
	bl PlayerAvatar_GetMapObject
	add r7, r0, #0
	bl MapObject_IsMovementPaused
	cmp r0, #1
	bne _021E98E0
	add r0, r7, #0
	bl MapObject_ClearHeldMovementIfActive
	add r0, r6, #0
	add r1, r5, #0
	bl ov01_02205790
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _021E98E0
_021E98B4:
	ldr r0, [r6, #0x58]
	mov r1, #2
	bl ov01_021E8F10
	cmp r0, #0
	beq _021E98E0
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021E98E0
	ldr r0, [r6, #0x54]
	ldr r1, [r6, #0x58]
	mov r2, #2
	bl ov01_021E8ED0
	ldr r0, _021E98EC ; =SEQ_SE_DP_ESUKA
	mov r1, #0
	bl StopSE
	add sp, #0x40
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E98E0:
	mov r0, #0
	add sp, #0x40
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E98E8: .word ov01_02206408
_021E98EC: .word SEQ_SE_DP_ESUKA
	thumb_func_end ov01_021E971C

	thumb_func_start ov01_021E98F0
ov01_021E98F0: ; 0x021E98F0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x44
	add r4, r1, #0
	add r6, r0, #0
	ldr r0, [r4]
	add r5, r2, #0
	cmp r0, #4
	bls _021E9902
	b _021E9AAC
_021E9902:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021E990E: ; jump table
	.short _021E9918 - _021E990E - 2 ; case 0
	.short _021E99DA - _021E990E - 2 ; case 1
	.short _021E9A3C - _021E990E - 2 ; case 2
	.short _021E9A62 - _021E990E - 2 ; case 3
	.short _021E9A80 - _021E990E - 2 ; case 4
_021E9918:
	ldr r3, _021E9AB4 ; =ov01_02206418
	add r2, sp, #0x24
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	cmp r5, #2
	bne _021E9942
	mov r0, #2
	str r0, [sp]
	mov r2, #1
	str r2, [sp, #4]
	add r0, sp, #0x34
	str r0, [sp, #8]
	ldr r0, [r4, #4]
	ldr r1, [r4, #8]
	sub r2, r2, #2
	mov r3, #0
	bl sub_02054A60
	b _021E995A
_021E9942:
	mov r0, #2
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	add r0, sp, #0x34
	str r0, [sp, #8]
	mov r2, #0
	ldr r0, [r4, #4]
	ldr r1, [r4, #8]
	add r3, r2, #0
	bl sub_02054A60
_021E995A:
	mov r0, #2
	strb r0, [r4, #0xc]
	add r0, sp, #0x20
	str r0, [sp]
	add r0, sp, #0x1c
	str r0, [sp, #4]
	add r0, r6, #0
	add r1, sp, #0x24
	mov r2, #4
	add r3, sp, #0x34
	bl sub_02054B74
	cmp r0, #0
	beq _021E99AA
	ldr r0, [r6, #0x34]
	bl ov01_021FB9E0
	add r7, r0, #0
	ldr r0, [sp, #0x20]
	bl ov01_021F3B38
	add r5, r0, #0
	ldr r0, [sp, #0x20]
	bl ov01_021F3B3C
	str r5, [sp]
	str r0, [sp, #4]
	str r7, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	mov r0, #0
	str r0, [sp, #0x14]
	ldr r0, [r6, #0x54]
	ldr r1, [r6, #0x58]
	ldr r3, [sp, #0x1c]
	mov r2, #2
	bl ov01_021E8DE8
	b _021E99B4
_021E99AA:
	bl GF_AssertFail
	add sp, #0x44
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_021E99B4:
	ldr r0, [r6, #0x40]
	bl PlayerAvatar_GetMapObject
	add r5, r0, #0
	bl MapObject_AreBitsSetForMovementScriptInit
	cmp r0, #1
	bne _021E99CE
	add r0, r5, #0
	mov r1, #0x49
	bl MapObject_SetHeldMovement
	b _021E99D2
_021E99CE:
	bl GF_AssertFail
_021E99D2:
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _021E9AAC
_021E99DA:
	ldr r0, [r6, #0x58]
	ldr r3, _021E9AB8 ; =SEQ_SE_DP_ESUKA
	mov r1, #2
	mov r2, #0
	bl ov01_021E8E98
	ldr r0, [r6, #0x40]
	bl PlayerAvatar_GetMapObject
	add r7, r0, #0
	bl MapObject_AreBitsSetForMovementScriptInit
	cmp r0, #1
	bne _021E9A30
	cmp r5, #2
	bne _021E99FE
	mov r5, #0xa
	b _021E9A00
_021E99FE:
	mov r5, #0xb
_021E9A00:
	add r0, r7, #0
	add r1, r5, #0
	bl MapObject_SetHeldMovement
	add r0, r6, #0
	bl FollowingPokemon_IsActive
	cmp r0, #0
	beq _021E9A34
	add r0, r7, #0
	bl MapObject_GetPrevX
	str r0, [sp, #0x18]
	add r0, r7, #0
	bl MapObject_GetPrevY
	add r6, #0xe4
	add r2, r0, #0
	ldr r1, [sp, #0x18]
	add r0, r5, #0
	add r3, r6, #0
	bl ov01_02205990
	b _021E9A34
_021E9A30:
	bl GF_AssertFail
_021E9A34:
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _021E9AAC
_021E9A3C:
	ldr r0, [r6, #0x40]
	bl PlayerAvatar_GetMapObject
	add r5, r0, #0
	bl MapObject_AreBitsSetForMovementScriptInit
	cmp r0, #1
	bne _021E9AAC
	add r0, r5, #0
	mov r1, #0x4a
	bl MapObject_SetHeldMovement
	mov r0, #0
	bl ov01_021E636C
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _021E9AAC
_021E9A62:
	ldr r0, [r6, #0x40]
	bl PlayerAvatar_GetMapObject
	add r5, r0, #0
	bl MapObject_IsMovementPaused
	cmp r0, #1
	bne _021E9AAC
	add r0, r5, #0
	bl MapObject_ClearHeldMovementIfActive
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _021E9AAC
_021E9A80:
	ldr r0, [r6, #0x58]
	mov r1, #2
	bl ov01_021E8F10
	cmp r0, #0
	beq _021E9AAC
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021E9AAC
	ldr r0, [r6, #0x54]
	ldr r1, [r6, #0x58]
	mov r2, #2
	bl ov01_021E8ED0
	ldr r0, _021E9AB8 ; =SEQ_SE_DP_ESUKA
	mov r1, #0
	bl StopSE
	add sp, #0x44
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_021E9AAC:
	mov r0, #0
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
	nop
_021E9AB4: .word ov01_02206418
_021E9AB8: .word SEQ_SE_DP_ESUKA
	thumb_func_end ov01_021E98F0

	thumb_func_start ov01_021E9ABC
ov01_021E9ABC: ; 0x021E9ABC
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl TaskManager_GetSys
	add r5, r0, #0
	add r0, r4, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldrb r1, [r4]
	ldr r0, [r5, #0x58]
	bl ov01_021E8F10
	cmp r0, #0
	beq _021E9AE4
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E9AE4:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov01_021E9ABC

	thumb_func_start ov01_021E9AE8
ov01_021E9AE8: ; 0x021E9AE8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x54
	add r7, r0, #0
	str r3, [sp, #0x18]
	mov r0, #3
	str r0, [sp]
	mov r3, #1
	str r3, [sp, #4]
	add r0, sp, #0x44
	str r0, [sp, #8]
	add r0, r1, #0
	add r1, r2, #0
	sub r2, r3, #2
	mov r3, #0
	bl sub_02054A60
	ldr r0, [r7, #0x34]
	bl ov01_021FB904
	add r6, r0, #0
	mov r0, #0
	mov r1, #4
	str r0, [sp]
	add r0, r7, #0
	add r2, r1, #0
	add r3, sp, #0x44
	bl sub_02054D10
	mov r4, #0
	str r0, [sp, #0x1c]
	str r4, [sp, #0x24]
	add r5, r0, #0
_021E9B28:
	ldr r1, [r5]
	cmp r1, #0
	beq _021E9B5A
	add r0, r6, #0
	add r2, sp, #0x2c
	bl NARC_ReadWholeMember
	add r0, sp, #0x28
	ldrb r0, [r0, #8]
	cmp r0, #0
	beq _021E9B5A
	ldr r1, [sp, #0x1c]
	lsl r4, r4, #2
	ldr r1, [r1, r4]
	add r0, r7, #0
	add r2, sp, #0x44
	add r3, sp, #0x28
	bl sub_02054AE4
	mov r0, #1
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x1c]
	ldr r0, [r0, r4]
	str r0, [sp, #0x20]
	b _021E9B62
_021E9B5A:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _021E9B28
_021E9B62:
	ldr r0, [sp, #0x1c]
	bl FreeToHeap
	ldr r0, [sp, #0x24]
	cmp r0, #0
	beq _021E9BB0
	ldr r0, [r7, #0x54]
	ldr r1, [sp, #0x20]
	bl ov01_021E8BAC
	add r5, r0, #0
	beq _021E9BB4
	ldr r0, [r7, #0x34]
	bl ov01_021FB9E0
	add r6, r0, #0
	ldr r0, [sp, #0x28]
	bl ov01_021F3B38
	add r4, r0, #0
	ldr r0, [sp, #0x28]
	bl ov01_021F3B3C
	str r4, [sp]
	str r0, [sp, #4]
	str r6, [sp, #8]
	str r5, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	mov r0, #0
	str r0, [sp, #0x14]
	ldr r0, [r7, #0x54]
	ldr r1, [r7, #0x58]
	ldr r2, [sp, #0x18]
	ldr r3, [sp, #0x20]
	bl ov01_021E8DE8
	add sp, #0x54
	pop {r4, r5, r6, r7, pc}
_021E9BB0:
	bl GF_AssertFail
_021E9BB4:
	add sp, #0x54
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov01_021E9AE8

	thumb_func_start ov01_021E9BB8
ov01_021E9BB8: ; 0x021E9BB8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x58]
	add r4, r1, #0
	bl ov01_021E8F30
	add r1, r0, #0
	add r0, r5, #0
	mov r2, #1
	bl GetDoorSE
	add r3, r0, #0
	ldr r0, [r5, #0x58]
	add r1, r4, #0
	mov r2, #0
	bl ov01_021E8E98
	pop {r3, r4, r5, pc}
	thumb_func_end ov01_021E9BB8

	thumb_func_start ov01_021E9BDC
ov01_021E9BDC: ; 0x021E9BDC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x58]
	add r4, r1, #0
	bl ov01_021E8F30
	add r1, r0, #0
	add r0, r5, #0
	mov r2, #0
	bl GetDoorSE
	add r3, r0, #0
	ldr r0, [r5, #0x58]
	add r1, r4, #0
	mov r2, #1
	bl ov01_021E8E98
	pop {r3, r4, r5, pc}
	thumb_func_end ov01_021E9BDC

	thumb_func_start ov01_021E9C00
ov01_021E9C00: ; 0x021E9C00
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #4
	mov r1, #1
	bl AllocFromHeapAtEnd
	add r2, r0, #0
	strb r4, [r2]
	ldr r0, [r5, #0x10]
	ldr r1, _021E9C1C ; =ov01_021E9ABC
	bl TaskManager_Call
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E9C1C: .word ov01_021E9ABC
	thumb_func_end ov01_021E9C00

	thumb_func_start ov01_021E9C20
ov01_021E9C20: ; 0x021E9C20
	add r3, r0, #0
	add r2, r1, #0
	ldr r0, [r3, #0x54]
	ldr r1, [r3, #0x58]
	ldr r3, _021E9C2C ; =ov01_021E8ED0
	bx r3
	.balign 4, 0
_021E9C2C: .word ov01_021E8ED0
	thumb_func_end ov01_021E9C20

	thumb_func_start ov01_021E9C30
ov01_021E9C30: ; 0x021E9C30
	push {r3, lr}
	mov r0, #4
	mov r1, #8
	bl AllocFromHeapAtEnd
	mov r1, #0
	strb r1, [r0]
	pop {r3, pc}
	thumb_func_end ov01_021E9C30

	thumb_func_start ov01_021E9C40
ov01_021E9C40: ; 0x021E9C40
	push {r4, r5, r6, r7, lr}
	sub sp, #0x5c
	add r5, r0, #0
	bl TaskManager_GetSys
	add r4, r0, #0
	add r0, r5, #0
	bl TaskManager_GetEnv
	add r6, r0, #0
	ldr r0, [r6]
	cmp r0, #8
	bls _021E9C5C
	b _021E9ECC
_021E9C5C:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021E9C68: ; jump table
	.short _021E9C7A - _021E9C68 - 2 ; case 0
	.short _021E9DAE - _021E9C68 - 2 ; case 1
	.short _021E9DCC - _021E9C68 - 2 ; case 2
	.short _021E9DEA - _021E9C68 - 2 ; case 3
	.short _021E9E04 - _021E9C68 - 2 ; case 4
	.short _021E9E28 - _021E9C68 - 2 ; case 5
	.short _021E9E46 - _021E9C68 - 2 ; case 6
	.short _021E9E58 - _021E9C68 - 2 ; case 7
	.short _021E9E9C - _021E9C68 - 2 ; case 8
_021E9C7A:
	ldr r0, [r4, #0x40]
	bl PlayerAvatar_GetMapObject
	str r0, [sp, #0x28]
	mov r0, #0
	str r0, [r6, #0x10]
	strb r0, [r6, #0xd]
	ldr r0, [r4, #0x24]
	bl GF_Camera_GetPerspectiveAngle
	strh r0, [r6, #0xe]
	ldr r0, _021E9EE4 ; =0x0000FFA0
	ldr r1, [r4, #0x24]
	bl sub_020234D0
	mov r0, #6
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #0xb
	str r0, [sp, #8]
	ldr r3, _021E9EE8 ; =0x00007FFF
	mov r0, #0
	add r2, r1, #0
	bl BeginNormalPaletteFade
	mov r0, #1
	str r0, [r6, #0x10]
	ldr r0, [r4, #0x40]
	bl PlayerAvatar_GetFacingDirection
	cmp r0, #1
	bne _021E9D88
	mov r1, #1
	strb r1, [r6, #0xc]
	mov r2, #3
	str r2, [sp]
	mov r0, #0
	str r0, [sp, #0x24]
	str r1, [sp, #4]
	add r0, sp, #0x4c
	str r0, [sp, #8]
	ldr r0, [r6, #4]
	ldr r1, [r6, #8]
	ldr r3, [sp, #0x24]
	sub r2, r2, #4
	bl sub_02054A60
	ldr r0, [r4, #0x34]
	bl ov01_021FB904
	str r0, [sp, #0x1c]
	mov r0, #0
	mov r1, #4
	str r0, [sp]
	add r0, r4, #0
	add r2, r1, #0
	add r3, sp, #0x4c
	bl sub_02054D10
	str r0, [sp, #0x18]
	mov r7, #0
	add r5, r0, #0
_021E9CF8:
	ldr r1, [r5]
	cmp r1, #0
	beq _021E9D2A
	ldr r0, [sp, #0x1c]
	add r2, sp, #0x34
	bl NARC_ReadWholeMember
	add r0, sp, #0x30
	ldrb r0, [r0, #8]
	cmp r0, #0
	beq _021E9D2A
	ldr r1, [sp, #0x18]
	lsl r5, r7, #2
	ldr r1, [r1, r5]
	add r0, r4, #0
	add r2, sp, #0x4c
	add r3, sp, #0x30
	bl sub_02054AE4
	mov r0, #1
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x18]
	ldr r0, [r0, r5]
	str r0, [sp, #0x20]
	b _021E9D32
_021E9D2A:
	add r7, r7, #1
	add r5, r5, #4
	cmp r7, #4
	blt _021E9CF8
_021E9D32:
	ldr r0, [sp, #0x18]
	bl FreeToHeap
	ldr r0, [sp, #0x24]
	cmp r0, #0
	beq _021E9D88
	ldr r0, [r4, #0x54]
	ldr r1, [sp, #0x20]
	bl ov01_021E8BAC
	add r7, r0, #0
	bne _021E9D50
	add sp, #0x5c
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_021E9D50:
	ldr r0, [r4, #0x34]
	bl ov01_021FB9E0
	str r0, [sp, #0x2c]
	ldr r0, [sp, #0x30]
	bl ov01_021F3B38
	add r5, r0, #0
	ldr r0, [sp, #0x30]
	bl ov01_021F3B3C
	str r5, [sp]
	str r0, [sp, #4]
	ldr r0, [sp, #0x2c]
	mov r2, #1
	str r0, [sp, #8]
	str r7, [sp, #0xc]
	str r2, [sp, #0x10]
	mov r0, #0
	str r0, [sp, #0x14]
	ldr r0, [r4, #0x54]
	ldr r1, [r4, #0x58]
	ldr r3, [sp, #0x20]
	bl ov01_021E8DE8
	mov r0, #4
	str r0, [r6]
	b _021E9ECC
_021E9D88:
	ldr r0, [r4, #0x40]
	bl PlayerAvatar_GetFacingDirection
	cmp r0, #1
	bne _021E9DA0
	ldr r0, [sp, #0x28]
	mov r1, #1
	bl sub_0205F690
	mov r0, #1
	str r0, [r6]
	b _021E9ECC
_021E9DA0:
	ldr r0, [sp, #0x28]
	mov r1, #0
	bl sub_0205F690
	mov r0, #3
	str r0, [r6]
	b _021E9ECC
_021E9DAE:
	ldr r0, [r4, #0x40]
	bl PlayerAvatar_GetMapObject
	add r5, r0, #0
	mov r1, #0
	bl sub_0205F690
	add r0, r5, #0
	mov r1, #0xd
	bl MapObject_SetHeldMovement
	ldr r0, [r6]
	add r0, r0, #1
	str r0, [r6]
	b _021E9ECC
_021E9DCC:
	ldr r0, [r4, #0x40]
	bl PlayerAvatar_GetMapObject
	add r5, r0, #0
	bl MapObject_IsMovementPaused
	cmp r0, #1
	bne _021E9ECC
	add r0, r5, #0
	bl MapObject_ClearHeldMovementIfActive
	ldr r0, [r6]
	add r0, r0, #1
	str r0, [r6]
	b _021E9ECC
_021E9DEA:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021E9ECC
	ldr r0, [r4, #0x24]
	bl GF_Camera_GetPerspectiveAngle
	ldrh r1, [r6, #0xe]
	cmp r1, r0
	bne _021E9ECC
	add sp, #0x5c
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_021E9E04:
	ldr r0, [r4, #0x58]
	mov r1, #1
	bl ov01_021E8F30
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #1
	bl GetDoorSE
	add r3, r0, #0
	ldr r0, [r4, #0x58]
	mov r1, #1
	mov r2, #0
	bl ov01_021E8E98
	mov r0, #5
	str r0, [r6]
	b _021E9ECC
_021E9E28:
	ldr r0, [r4, #0x58]
	mov r1, #1
	bl ov01_021E8F10
	cmp r0, #0
	beq _021E9ECC
	ldr r0, [r4, #0x40]
	bl PlayerAvatar_GetMapObject
	mov r1, #0
	bl sub_0205F690
	mov r0, #6
	str r0, [r6]
	b _021E9ECC
_021E9E46:
	ldr r0, [r4, #0x40]
	bl PlayerAvatar_GetMapObject
	mov r1, #0xd
	bl MapObject_SetHeldMovement
	mov r0, #7
	str r0, [r6]
	b _021E9ECC
_021E9E58:
	ldr r0, [r4, #0x40]
	bl PlayerAvatar_GetMapObject
	add r5, r0, #0
	bl MapObject_IsMovementPaused
	cmp r0, #1
	bne _021E9ECC
	add r0, r5, #0
	bl MapObject_ClearHeldMovementIfActive
	add r0, r4, #0
	mov r1, #1
	bl ov01_02205790
	ldr r0, [r4, #0x58]
	mov r1, #1
	bl ov01_021E8F30
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #0
	bl GetDoorSE
	add r3, r0, #0
	mov r1, #1
	ldr r0, [r4, #0x58]
	add r2, r1, #0
	bl ov01_021E8E98
	ldr r0, [r6]
	add r0, r0, #1
	str r0, [r6]
	b _021E9ECC
_021E9E9C:
	ldr r0, [r4, #0x58]
	mov r1, #1
	bl ov01_021E8F10
	cmp r0, #0
	beq _021E9ECC
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021E9ECC
	ldr r0, [r4, #0x24]
	bl GF_Camera_GetPerspectiveAngle
	ldrh r1, [r6, #0xe]
	cmp r1, r0
	bne _021E9ECC
	ldr r0, [r4, #0x54]
	ldr r1, [r4, #0x58]
	mov r2, #1
	bl ov01_021E8ED0
	add sp, #0x5c
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_021E9ECC:
	ldr r0, [r6, #0x10]
	cmp r0, #0
	beq _021E9EDC
	add r6, #0xd
	ldr r0, [r4, #0x24]
	add r1, r6, #0
	bl ov01_021E9610
_021E9EDC:
	mov r0, #0
	add sp, #0x5c
	pop {r4, r5, r6, r7, pc}
	nop
_021E9EE4: .word 0x0000FFA0
_021E9EE8: .word 0x00007FFF
	thumb_func_end ov01_021E9C40

	thumb_func_start ov01_021E9EEC
ov01_021E9EEC: ; 0x021E9EEC
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	bl TaskManager_GetSys
	add r4, r0, #0
	add r0, r5, #0
	bl TaskManager_GetEnv
	add r5, r0, #0
	ldrb r0, [r5]
	cmp r0, #0
	beq _021E9F0C
	cmp r0, #1
	beq _021E9F48
	b _021E9F5C
_021E9F0C:
	ldr r0, [r4, #0x40]
	bl PlayerAvatar_GetMapObject
	mov r1, #1
	bl sub_0205F690
	mov r0, #0
	str r0, [r5, #4]
	strb r0, [r5, #1]
	ldr r0, _021E9F70 ; =SEQ_SE_DP_KAIDAN2
	bl PlaySE
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0xb
	str r0, [sp, #8]
	mov r0, #0
	ldr r3, _021E9F74 ; =0x00007FFF
	add r1, r0, #0
	add r2, r0, #0
	bl BeginNormalPaletteFade
	mov r0, #1
	str r0, [r5, #4]
	ldrb r0, [r5]
	add r0, r0, #1
	strb r0, [r5]
	b _021E9F5C
_021E9F48:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021E9F5C
	add r0, r5, #0
	bl FreeToHeap
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, pc}
_021E9F5C:
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _021E9F6A
	ldr r0, [r4, #0x24]
	add r1, r5, #1
	bl ov01_021E95CC
_021E9F6A:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_021E9F70: .word SEQ_SE_DP_KAIDAN2
_021E9F74: .word 0x00007FFF
	thumb_func_end ov01_021E9EEC

	thumb_func_start ov01_021E9F78
ov01_021E9F78: ; 0x021E9F78
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	bl TaskManager_GetSys
	add r6, r0, #0
	add r0, r5, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldrb r0, [r4]
	cmp r0, #0
	beq _021E9F98
	cmp r0, #1
	beq _021E9FCA
	b _021E9FDE
_021E9F98:
	mov r0, #0
	str r0, [r4, #4]
	strb r0, [r4, #1]
	ldr r0, _021E9FF4 ; =SEQ_SE_DP_KAIDAN2
	bl PlaySE
	mov r1, #0
	str r1, [sp]
	mov r0, #6
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0xb
	str r0, [sp, #0xc]
	add r0, r5, #0
	mov r2, #0x10
	add r3, r1, #0
	bl sub_02055BF0
	mov r0, #1
	str r0, [r4, #4]
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _021E9FDE
_021E9FCA:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021E9FDE
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x10
	mov r0, #1
	pop {r4, r5, r6, pc}
_021E9FDE:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _021E9FEC
	ldr r0, [r6, #0x24]
	add r1, r4, #1
	bl ov01_021E95CC
_021E9FEC:
	mov r0, #0
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_021E9FF4: .word SEQ_SE_DP_KAIDAN2
	thumb_func_end ov01_021E9F78

	thumb_func_start ov01_021E9FF8
ov01_021E9FF8: ; 0x021E9FF8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r0, [sp, #0x10]
	bl TaskManager_GetSys
	add r5, r0, #0
	ldr r0, [sp, #0x10]
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldrb r0, [r4]
	cmp r0, #3
	bhi _021EA110
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021EA01E: ; jump table
	.short _021EA026 - _021EA01E - 2 ; case 0
	.short _021EA0B4 - _021EA01E - 2 ; case 1
	.short _021EA0D2 - _021EA01E - 2 ; case 2
	.short _021EA0F0 - _021EA01E - 2 ; case 3
_021EA026:
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetMapObject
	str r0, [sp, #0x14]
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetFacingDirection
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
	cmp r7, #1
	bne _021EA048
	ldr r0, [sp, #0x14]
	mov r1, #1
	bl sub_0205F690
	mov r0, #1
	b _021EA052
_021EA048:
	ldr r0, [sp, #0x14]
	mov r1, #0
	bl sub_0205F690
	mov r0, #3
_021EA052:
	strb r0, [r4]
	mov r0, #0
	str r0, [r4, #4]
	strb r0, [r4, #1]
	ldr r0, [r5, #0x24]
	bl GF_Camera_GetPerspectiveAngle
	strh r0, [r4, #2]
	ldr r0, _021EA124 ; =0x0000FFA0
	ldr r1, [r5, #0x24]
	bl sub_020234D0
	cmp r7, #3
	bhi _021EA092
	add r0, r7, r7
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021EA07A: ; jump table
	.short _021EA082 - _021EA07A - 2 ; case 0
	.short _021EA086 - _021EA07A - 2 ; case 1
	.short _021EA08A - _021EA07A - 2 ; case 2
	.short _021EA08E - _021EA07A - 2 ; case 3
_021EA082:
	mov r6, #3
	b _021EA096
_021EA086:
	mov r6, #5
	b _021EA096
_021EA08A:
	mov r6, #7
	b _021EA096
_021EA08E:
	mov r6, #0x27
	b _021EA096
_021EA092:
	bl GF_AssertFail
_021EA096:
	mov r1, #0
	str r1, [sp]
	mov r0, #6
	str r0, [sp, #4]
	mov r3, #1
	str r3, [sp, #8]
	mov r0, #0xb
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x10]
	add r2, r6, #0
	bl sub_02055BF0
	mov r0, #1
	str r0, [r4, #4]
	b _021EA110
_021EA0B4:
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetMapObject
	add r6, r0, #0
	mov r1, #0
	bl sub_0205F690
	add r0, r6, #0
	mov r1, #0xd
	bl MapObject_SetHeldMovement
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _021EA110
_021EA0D2:
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetMapObject
	add r6, r0, #0
	bl MapObject_IsMovementPaused
	cmp r0, #1
	bne _021EA110
	add r0, r6, #0
	bl MapObject_ClearHeldMovementIfActive
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _021EA110
_021EA0F0:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021EA110
	ldr r0, [r5, #0x24]
	bl GF_Camera_GetPerspectiveAngle
	ldrh r1, [r4, #2]
	cmp r1, r0
	bne _021EA110
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x18
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021EA110:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _021EA11E
	ldr r0, [r5, #0x24]
	add r1, r4, #1
	bl ov01_021E9610
_021EA11E:
	mov r0, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021EA124: .word 0x0000FFA0
	thumb_func_end ov01_021E9FF8

	thumb_func_start ov01_021EA128
ov01_021EA128: ; 0x021EA128
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r7, r0, #0
	bl TaskManager_GetSys
	add r5, r0, #0
	add r0, r7, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldrb r0, [r4]
	cmp r0, #3
	bhi _021EA1EE
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021EA14E: ; jump table
	.short _021EA156 - _021EA14E - 2 ; case 0
	.short _021EA19E - _021EA14E - 2 ; case 1
	.short _021EA1BC - _021EA14E - 2 ; case 2
	.short _021EA1DA - _021EA14E - 2 ; case 3
_021EA156:
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetMapObject
	add r6, r0, #0
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetFacingDirection
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #1
	bne _021EA178
	add r0, r6, #0
	mov r1, #1
	bl sub_0205F690
	mov r0, #1
	b _021EA182
_021EA178:
	add r0, r6, #0
	mov r1, #0
	bl sub_0205F690
	mov r0, #3
_021EA182:
	strb r0, [r4]
	mov r1, #0
	mov r2, #1
	str r1, [sp]
	mov r0, #6
	str r0, [sp, #4]
	str r2, [sp, #8]
	mov r0, #0xb
	str r0, [sp, #0xc]
	add r0, r7, #0
	add r3, r2, #0
	bl sub_02055BF0
	b _021EA1EE
_021EA19E:
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetMapObject
	add r5, r0, #0
	mov r1, #0
	bl sub_0205F690
	add r0, r5, #0
	mov r1, #0xd
	bl MapObject_SetHeldMovement
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _021EA1EE
_021EA1BC:
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetMapObject
	add r5, r0, #0
	bl MapObject_IsMovementPaused
	cmp r0, #1
	bne _021EA1EE
	add r0, r5, #0
	bl MapObject_ClearHeldMovementIfActive
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _021EA1EE
_021EA1DA:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021EA1EE
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x10
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021EA1EE:
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov01_021EA128

	thumb_func_start ov01_021EA1F4
ov01_021EA1F4: ; 0x021EA1F4
	push {r4, lr}
	ldr r0, [r0, #0x20]
	add r4, r1, #0
	ldr r0, [r0]
	bl sub_0203B58C
	cmp r0, #0
	beq _021EA214
	cmp r4, #0x3f
	beq _021EA210
	cmp r4, #0xa2
	beq _021EA210
	cmp r4, #0xc5
	bne _021EA21C
_021EA210:
	mov r0, #1
	pop {r4, pc}
_021EA214:
	cmp r4, #0x7c
	bne _021EA21C
	mov r0, #1
	pop {r4, pc}
_021EA21C:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov01_021EA1F4

	thumb_func_start ov01_021EA220
ov01_021EA220: ; 0x021EA220
	push {r4, r5, r6, lr}
	add r6, r1, #0
	add r5, r0, #0
	cmp r6, #5
	blo _021EA22E
	bl GF_AssertFail
_021EA22E:
	mov r0, #4
	mov r1, #0x14
	bl AllocFromHeap
	add r4, r0, #0
	ldr r0, _021EA280 ; =ov01_02206450
	lsl r1, r6, #2
	ldr r0, [r0, r1]
	str r5, [r4, #0xc]
	add r1, r4, #4
	bl ov01_021EA3E0
	str r0, [r4]
	mov r0, #0
	str r0, [r4, #8]
	bl GF_RTC_TimeToSec
	lsr r1, r0, #0x1f
	add r1, r0, r1
	asr r3, r1, #1
	ldr r5, [r4]
	mov r1, #0
	cmp r5, #0
	bls _021EA272
	ldr r2, [r4, #4]
_021EA260:
	ldr r0, [r2]
	cmp r0, r3
	bls _021EA26A
	str r1, [r4, #8]
	b _021EA272
_021EA26A:
	add r1, r1, #1
	add r2, #0x30
	cmp r1, r5
	blo _021EA260
_021EA272:
	mov r0, #1
	str r0, [r4, #0x10]
	add r0, r4, #0
	bl ov01_021EA398
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021EA280: .word ov01_02206450
	thumb_func_end ov01_021EA220

	thumb_func_start ov01_021EA284
ov01_021EA284: ; 0x021EA284
	push {r4, lr}
	add r4, r0, #0
	bne _021EA28E
	bl GF_AssertFail
_021EA28E:
	ldr r0, [r4]
	add r0, r0, #4
	bl ov01_021EA564
	ldr r1, [r4]
	mov r0, #4
	bl FreeToHeapExplicit
	mov r0, #0
	str r0, [r4]
	pop {r4, pc}
	thumb_func_end ov01_021EA284

	thumb_func_start ov01_021EA2A4
ov01_021EA2A4: ; 0x021EA2A4
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bne _021EA2AE
	bl GF_AssertFail
_021EA2AE:
	bl GF_RTC_TimeToSec
	lsr r1, r0, #0x1f
	add r1, r0, r1
	asr r0, r1, #1
	ldr r1, [r4]
	cmp r1, #1
	bls _021EA2FC
	ldr r1, [r4, #8]
	sub r5, r1, #1
	bmi _021EA2CE
	mov r2, #0x30
	ldr r3, [r4, #4]
	mul r2, r5
	ldr r2, [r3, r2]
	b _021EA2D0
_021EA2CE:
	mov r2, #0
_021EA2D0:
	mov r3, #0x30
	ldr r5, [r4, #4]
	mul r3, r1
	ldr r1, [r5, r3]
	cmp r0, r1
	bge _021EA2E0
	cmp r0, r2
	bge _021EA2FC
_021EA2E0:
	ldr r0, [r4, #8]
	add r1, r0, #1
	str r1, [r4, #8]
	ldr r0, [r4]
	cmp r1, r0
	blo _021EA2F0
	mov r0, #0
	str r0, [r4, #8]
_021EA2F0:
	ldr r0, [r4, #0x10]
	cmp r0, #0
	beq _021EA2FC
	add r0, r4, #0
	bl ov01_021EA398
_021EA2FC:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021EA2A4

	thumb_func_start ov01_021EA300
ov01_021EA300: ; 0x021EA300
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r0, [sp, #4]
	add r6, r1, #0
	mov r4, #0
	add r5, r0, #0
	add r7, r0, #0
_021EA30E:
	ldr r0, [sp, #4]
	ldrb r1, [r0, #4]
	mov r0, #1
	lsl r0, r4
	tst r0, r1
	beq _021EA33C
	mov r0, #0x12
	ldrsh r0, [r5, r0]
	mov r2, #0xe
	mov r3, #0x10
	str r0, [sp]
	ldrsh r2, [r5, r2]
	ldrsh r3, [r5, r3]
	add r0, r6, #0
	add r1, r4, #0
	bl ov01_021EAAB8
	ldrh r2, [r7, #6]
	add r0, r6, #0
	add r1, r4, #0
	bl ov01_021EAAE0
	b _021EA356
_021EA33C:
	mov r0, #0
	mov r2, #0
	str r0, [sp]
	add r0, r6, #0
	add r1, r4, #0
	add r3, r2, #0
	bl ov01_021EAAB8
	add r0, r6, #0
	add r1, r4, #0
	mov r2, #0
	bl ov01_021EAAE0
_021EA356:
	add r4, r4, #1
	add r5, r5, #6
	add r7, r7, #2
	cmp r4, #4
	blt _021EA30E
	ldr r1, [sp, #4]
	mov r2, #0
	ldrh r1, [r1, #0x26]
	add r0, r6, #0
	add r3, r2, #0
	bl ov01_021EAAF4
	ldr r1, [sp, #4]
	add r0, r6, #0
	ldrh r1, [r1, #0x28]
	mov r2, #1
	bl ov01_021EAB08
	ldr r1, [sp, #4]
	mov r2, #0
	ldrh r1, [r1, #0x2a]
	add r0, r6, #0
	add r3, r2, #0
	bl ov01_021EAB1C
	ldr r1, [sp, #4]
	add r0, r6, #0
	ldrh r1, [r1, #0x2c]
	mov r2, #1
	bl ov01_021EAB30
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov01_021EA300

	thumb_func_start ov01_021EA398
ov01_021EA398: ; 0x021EA398
	add r3, r0, #0
	ldr r1, [r3, #8]
	mov r0, #0x30
	mul r0, r1
	ldr r2, [r3, #4]
	ldr r1, [r3, #0xc]
	ldr r3, _021EA3AC ; =ov01_021EA300
	add r0, r2, r0
	bx r3
	nop
_021EA3AC: .word ov01_021EA300
	thumb_func_end ov01_021EA398

	thumb_func_start ov01_021EA3B0
ov01_021EA3B0: ; 0x021EA3B0
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x40
	bl NNSi_G3dModifyMatFlag
	add r0, r4, #0
	mov r1, #0
	mov r2, #0x80
	bl NNSi_G3dModifyMatFlag
	mov r2, #2
	add r0, r4, #0
	mov r1, #0
	lsl r2, r2, #8
	bl NNSi_G3dModifyMatFlag
	mov r2, #1
	add r0, r4, #0
	mov r1, #0
	lsl r2, r2, #0xa
	bl NNSi_G3dModifyMatFlag
	pop {r4, pc}
	thumb_func_end ov01_021EA3B0

	thumb_func_start ov01_021EA3E0
ov01_021EA3E0: ; 0x021EA3E0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1fc
	sub sp, #0x20
	add r2, r0, #0
	str r1, [sp]
	mov r0, #4
	add r1, r2, #0
	bl Sys_AllocAndReadFile
	mov r1, #0
	str r0, [sp, #0x14]
	str r1, [sp, #8]
	add r5, sp, #0x11c
	mov r6, #1
	mov r7, #2
	add r4, r1, #0
_021EA400:
	add r1, r5, #0
	mov r2, #0xd
	bl Ascii_GetDelim
	ldrsb r1, [r5, r4]
	cmp r1, #0x45
	bne _021EA41A
	ldrsb r1, [r5, r6]
	cmp r1, #0x4f
	bne _021EA41A
	ldrsb r1, [r5, r7]
	cmp r1, #0x46
	beq _021EA468
_021EA41A:
	add r1, r5, #0
	mov r2, #0xd
	bl Ascii_GetDelim
	add r1, r5, #0
	mov r2, #0xd
	bl Ascii_GetDelim
	add r1, r5, #0
	mov r2, #0xd
	bl Ascii_GetDelim
	add r1, r5, #0
	mov r2, #0xd
	bl Ascii_GetDelim
	add r1, r5, #0
	mov r2, #0xd
	bl Ascii_GetDelim
	add r1, r5, #0
	mov r2, #0xd
	bl Ascii_GetDelim
	add r1, r5, #0
	mov r2, #0xd
	bl Ascii_GetDelim
	add r1, r5, #0
	mov r2, #0xd
	bl Ascii_GetDelim
	add r1, r5, #0
	mov r2, #0xd
	bl Ascii_GetDelim
	ldr r1, [sp, #8]
	add r1, r1, #1
	str r1, [sp, #8]
_021EA468:
	mov r1, #0
	ldrsb r1, [r5, r1]
	cmp r1, #0x45
	bne _021EA400
	mov r1, #1
	ldrsb r1, [r5, r1]
	cmp r1, #0x4f
	bne _021EA400
	mov r1, #2
	ldrsb r1, [r5, r1]
	cmp r1, #0x46
	bne _021EA400
	ldr r0, [sp, #8]
	mov r1, #0x30
	add r4, r0, #0
	mul r4, r1
	mov r0, #4
	add r1, r4, #0
	bl AllocFromHeap
	ldr r1, [sp]
	add r2, r4, #0
	str r0, [r1]
	mov r1, #0
	bl MI_CpuFill8
	mov r1, #0
	str r1, [sp, #0x18]
	ldr r1, [sp, #8]
	ldr r0, [sp, #0x14]
	cmp r1, #0
	ble _021EA54E
	ldr r1, [sp, #0x18]
	str r1, [sp, #0x10]
_021EA4AC:
	ldr r1, [sp]
	mov r2, #0xd
	ldr r5, [r1]
	ldr r1, [sp, #0x10]
	add r4, r5, r1
	add r1, sp, #0x11c
	bl Ascii_GetDelim
	str r0, [sp, #4]
	add r0, sp, #0x11c
	add r1, sp, #0x1c
	mov r2, #0x2c
	bl Ascii_GetDelim
	add r0, sp, #0x1c
	bl Ascii_StrToL
	ldr r1, [sp, #0x10]
	add r6, r4, #0
	str r0, [r5, r1]
	add r0, r4, #6
	mov r7, #0
	add r6, #0xe
	str r0, [sp, #0xc]
	add r5, r4, #0
_021EA4DE:
	ldr r0, [sp, #4]
	ldr r1, [sp, #0xc]
	add r2, r6, #0
	bl ov01_021EA578
	str r0, [sp, #4]
	ldrh r1, [r5, #6]
	ldr r0, _021EA560 ; =0x0000FFFF
	cmp r1, r0
	beq _021EA4FE
	mov r0, #1
	ldrb r1, [r4, #4]
	lsl r0, r7
	orr r0, r1
	strb r0, [r4, #4]
	b _021EA502
_021EA4FE:
	mov r0, #0
	strh r0, [r5, #6]
_021EA502:
	ldr r0, [sp, #0xc]
	add r7, r7, #1
	add r0, r0, #2
	add r6, r6, #6
	add r5, r5, #2
	str r0, [sp, #0xc]
	cmp r7, #4
	blt _021EA4DE
	add r1, r4, #0
	ldr r0, [sp, #4]
	add r1, #0x26
	bl ov01_021EA668
	add r1, r4, #0
	add r1, #0x28
	bl ov01_021EA668
	add r1, r4, #0
	add r1, #0x2a
	bl ov01_021EA668
	add r4, #0x2c
	add r1, r4, #0
	bl ov01_021EA668
	add r1, sp, #0x11c
	mov r2, #0xd
	bl Ascii_GetDelim
	ldr r1, [sp, #0x10]
	add r1, #0x30
	str r1, [sp, #0x10]
	ldr r1, [sp, #0x18]
	add r2, r1, #1
	ldr r1, [sp, #8]
	str r2, [sp, #0x18]
	cmp r2, r1
	blt _021EA4AC
_021EA54E:
	ldr r1, [sp, #0x14]
	mov r0, #4
	bl FreeToHeapExplicit
	ldr r0, [sp, #8]
	add sp, #0x1fc
	add sp, #0x20
	pop {r4, r5, r6, r7, pc}
	nop
_021EA560: .word 0x0000FFFF
	thumb_func_end ov01_021EA3E0

	thumb_func_start ov01_021EA564
ov01_021EA564: ; 0x021EA564
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4]
	mov r0, #4
	bl FreeToHeapExplicit
	mov r0, #0
	str r0, [r4]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021EA564

	thumb_func_start ov01_021EA578
ov01_021EA578: ; 0x021EA578
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1fc
	sub sp, #0x20
	str r1, [sp, #4]
	add r7, r2, #0
	add r1, sp, #0x11c
	mov r2, #0xd
	bl Ascii_GetDelim
	str r0, [sp]
	add r0, sp, #0x11c
	add r1, sp, #0x1c
	mov r2, #0x2c
	bl Ascii_GetDelim
	add r4, r0, #0
	add r0, sp, #0x1c
	bl Ascii_StrToL
	cmp r0, #1
	bne _021EA650
	mov r6, #0
	add r5, sp, #8
_021EA5A6:
	add r0, r4, #0
	add r1, sp, #0x1c
	mov r2, #0x2c
	bl Ascii_GetDelim
	add r4, r0, #0
	add r0, sp, #0x1c
	bl Ascii_StrToL
	strh r0, [r5]
	add r6, r6, #1
	add r5, r5, #2
	cmp r6, #3
	blt _021EA5A6
	add r1, sp, #8
	ldrh r0, [r1, #4]
	ldrh r2, [r1]
	ldrh r1, [r1, #2]
	lsl r0, r0, #0xa
	mov r6, #0
	lsl r1, r1, #5
	orr r1, r2
	orr r1, r0
	ldr r0, [sp, #4]
	add r5, sp, #0x10
	strh r1, [r0]
_021EA5DA:
	add r0, r4, #0
	add r1, sp, #0x1c
	mov r2, #0x2c
	bl Ascii_GetDelim
	add r4, r0, #0
	add r0, sp, #0x1c
	bl Ascii_StrToL
	add r6, r6, #1
	stmia r5!, {r0}
	cmp r6, #3
	blt _021EA5DA
	ldr r0, [sp, #0x10]
	strh r0, [r7]
	ldr r0, [sp, #0x14]
	strh r0, [r7, #2]
	ldr r0, [sp, #0x18]
	strh r0, [r7, #4]
	mov r0, #0
	ldrsh r1, [r7, r0]
	mov r0, #1
	lsl r0, r0, #0xc
	cmp r1, r0
	ble _021EA60E
	strh r0, [r7]
_021EA60E:
	mov r0, #0
	ldrsh r1, [r7, r0]
	ldr r0, _021EA660 ; =0xFFFFF000
	cmp r1, r0
	bge _021EA61A
	strh r0, [r7]
_021EA61A:
	mov r0, #2
	ldrsh r2, [r7, r0]
	lsl r1, r0, #0xb
	cmp r2, r1
	ble _021EA628
	lsl r0, r0, #0xb
	strh r0, [r7, #2]
_021EA628:
	mov r0, #2
	ldrsh r1, [r7, r0]
	ldr r0, _021EA660 ; =0xFFFFF000
	cmp r1, r0
	bge _021EA634
	strh r0, [r7, #2]
_021EA634:
	mov r0, #4
	ldrsh r2, [r7, r0]
	lsl r1, r0, #0xa
	cmp r2, r1
	ble _021EA642
	lsl r0, r0, #0xa
	strh r0, [r7, #4]
_021EA642:
	mov r0, #4
	ldrsh r1, [r7, r0]
	ldr r0, _021EA660 ; =0xFFFFF000
	cmp r1, r0
	bge _021EA656
	strh r0, [r7, #4]
	b _021EA656
_021EA650:
	ldr r1, _021EA664 ; =0x0000FFFF
	ldr r0, [sp, #4]
	strh r1, [r0]
_021EA656:
	ldr r0, [sp]
	add sp, #0x1fc
	add sp, #0x20
	pop {r4, r5, r6, r7, pc}
	nop
_021EA660: .word 0xFFFFF000
_021EA664: .word 0x0000FFFF
	thumb_func_end ov01_021EA578

	thumb_func_start ov01_021EA668
ov01_021EA668: ; 0x021EA668
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x1fc
	sub sp, #0x14
	str r1, [sp, #4]
	add r1, sp, #0x10c
	add r1, #2
	mov r2, #0xd
	bl Ascii_GetDelim
	add r6, sp, #0x10c
	add r7, sp, #0xc
	str r0, [sp]
	add r6, #2
	mov r4, #0
	add r5, sp, #8
	add r7, #2
_021EA688:
	add r0, r6, #0
	add r1, r7, #0
	mov r2, #0x2c
	bl Ascii_GetDelim
	add r6, r0, #0
	add r0, r7, #0
	bl Ascii_StrToL
	strh r0, [r5]
	add r4, r4, #1
	add r5, r5, #2
	cmp r4, #3
	blt _021EA688
	add r0, sp, #8
	ldrh r1, [r0, #4]
	lsl r2, r1, #0xa
	ldrh r1, [r0]
	ldrh r0, [r0, #2]
	lsl r0, r0, #5
	orr r0, r1
	add r1, r2, #0
	orr r1, r0
	ldr r0, [sp, #4]
	strh r1, [r0]
	ldr r0, [sp]
	add sp, #0x1fc
	add sp, #0x14
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_021EA668

	thumb_func_start LoadAreaOrDungeonLightTxt
LoadAreaOrDungeonLightTxt: ; 0x021EA6C4
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r4, r0, #0
	add r6, r1, #0
	cmp r4, #5
	blo _021EA6D4
	bl GF_AssertFail
_021EA6D4:
	ldr r0, _021EA720 ; =ov01_02206450
	lsl r1, r4, #2
	ldr r0, [r0, r1]
	add r1, sp, #0
	bl ov01_021EA3E0
	add r4, r0, #0
	bl GF_RTC_TimeToSec
	lsr r1, r0, #0x1f
	add r1, r0, r1
	asr r3, r1, #1
	mov r1, #0
	cmp r4, #0
	ble _021EA706
	ldr r2, [sp]
_021EA6F4:
	ldr r0, [r2]
	cmp r0, r3
	bls _021EA6FE
	add r5, r1, #0
	b _021EA706
_021EA6FE:
	add r1, r1, #1
	add r2, #0x30
	cmp r1, r4
	blt _021EA6F4
_021EA706:
	mov r0, #0x30
	ldr r1, [sp]
	mul r0, r5
	add r0, r1, r0
	add r1, r6, #0
	bl ov01_021EA300
	add r0, sp, #0
	bl ov01_021EA564
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_021EA720: .word ov01_02206450
	thumb_func_end LoadAreaOrDungeonLightTxt

	.rodata

ov01_02206408: ; 0x02206408
	.byte 0x0B, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00
	.byte 0x0C, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00

ov01_02206418: ; 0x02206418
	.byte 0x0B, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00
	.byte 0x0C, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00

ov01_02206428: ; 0x02206428
	.byte 0x82, 0xE8, 0xC1, 0x05, 0x00, 0x00, 0x00, 0x00, 0xC3, 0xD4, 0x05, 0x00, 0x43, 0xC0, 0xFD, 0xFF, 0xC1, 0xAE, 0x29, 0x00
	.byte 0x62, 0xE2, 0xC1, 0x05, 0x00, 0x00, 0x00, 0x00, 0x9B, 0x20, 0x05, 0x00, 0xDA, 0x6B, 0xFC, 0xFF, 0xC1, 0x7E, 0x2C, 0x00

ov01_02206450:
	.word ov01_02209820
	.word ov01_02209850
	.word ov01_02209838
	.word ov01_02209868
	.word ov01_02209880

	.data

	.balign 4, 0
ov01_02209820:
	.asciz "data/area00light.txt"
	.balign 4, 0
ov01_02209838:
	.asciz "data/area02light.txt"
	.balign 4, 0
ov01_02209850:
	.asciz "data/area01light.txt"
	.balign 4, 0
ov01_02209868:
	.asciz "data/dun20_01light.txt"
	.balign 4, 0
ov01_02209880:
	.asciz "data/dun20_02light.txt"
