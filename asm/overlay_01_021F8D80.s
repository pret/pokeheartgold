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
	.include "overlay_01_021F8D80.inc"
	.include "global.inc"

	.text

	thumb_func_start ov01_021F8D80
ov01_021F8D80: ; 0x021F8D80
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	str r1, [sp]
	add r4, r2, #0
	add r6, r3, #0
	bl ov01_021F9344
	str r0, [sp, #4]
	add r0, r5, #0
	bl MapObject_CheckFlag4
	add r7, r0, #0
	add r0, r5, #0
	bl ov01_02205564
	ldrb r1, [r4, #0x17]
	lsl r1, r1, #0x1d
	lsr r1, r1, #0x1f
	beq _021F8DBA
	add r0, r5, #0
	add r1, sp, #8
	bl MapObject_GetFacingVec
	mov r0, #0x14
	ldrsb r0, [r4, r0]
	lsl r0, r0, #0xc
	str r0, [sp, #0xc]
	b _021F8DFC
_021F8DBA:
	ldr r1, [sp, #4]
	cmp r1, #0
	bne _021F8DC8
	cmp r7, #0
	bne _021F8DC8
	cmp r0, #0
	beq _021F8DD8
_021F8DC8:
	add r0, r5, #0
	add r1, sp, #8
	bl MapObject_GetFacingVec
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0x10]
	b _021F8DE0
_021F8DD8:
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
_021F8DE0:
	ldr r0, [sp, #0x28]
	cmp r0, #0
	beq _021F8DF0
	add r0, r5, #0
	add r1, r6, #0
	add r2, sp, #8
	bl ov01_021F8E70
_021F8DF0:
	add r0, r5, #0
	bl ov01_022054E0
	ldr r1, [sp, #0xc]
	add r0, r1, r0
	str r0, [sp, #0xc]
_021F8DFC:
	mov r0, #0x10
	ldrsb r0, [r4, r0]
	cmp r6, r0
	beq _021F8E1E
	add r0, r6, #0
	bl ov01_021FA44C
	add r1, r0, #0
	ldr r0, [sp]
	bl sub_02023EE0
	ldr r0, [sp]
	mov r1, #0
	bl sub_02023F40
	mov r0, #0
	strb r0, [r4, #0x15]
_021F8E1E:
	ldr r0, [sp, #4]
	cmp r0, #0
	bne _021F8E56
	cmp r7, #0
	bne _021F8E56
	mov r1, #1
	ldr r0, [sp]
	lsl r1, r1, #0xc
	bl sub_02023F04
	lsl r0, r6, #0x18
	ldr r2, [sp]
	lsr r0, r0, #0x18
	add r1, r5, #0
	bl ov01_021F8FC0
	cmp r0, #0
	beq _021F8E52
	mov r0, #2
	ldr r1, [sp, #0xc]
	lsl r0, r0, #0xc
	sub r0, r1, r0
	str r0, [sp, #0xc]
	mov r0, #1
	strb r0, [r4, #0x15]
	b _021F8E56
_021F8E52:
	mov r0, #0
	strb r0, [r4, #0x15]
_021F8E56:
	cmp r7, #0
	beq _021F8E64
	mov r1, #1
	ldr r0, [sp]
	lsl r1, r1, #0xc
	bl sub_02023F04
_021F8E64:
	add r0, r5, #0
	add r1, sp, #8
	bl MapObject_SetFacingVec
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov01_021F8D80

	thumb_func_start ov01_021F8E70
ov01_021F8E70: ; 0x021F8E70
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r1, #0
	add r6, r0, #0
	add r1, sp, #0
	add r4, r2, #0
	bl MapObject_GetFacingVec
	add r0, r6, #0
	bl MapObject_GetGfxID
	bl ov01_021FA298
	cmp r0, #0xa
	bne _021F8EDE
	cmp r5, #3
	bhi _021F8F02
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021F8E9E: ; jump table
	.short _021F8EA6 - _021F8E9E - 2 ; case 0
	.short _021F8EB4 - _021F8E9E - 2 ; case 1
	.short _021F8EC2 - _021F8E9E - 2 ; case 2
	.short _021F8ED0 - _021F8E9E - 2 ; case 3
_021F8EA6:
	mov r0, #1
	ldr r1, [r4, #8]
	lsl r0, r0, #0xc
	add r0, r1, r0
	add sp, #0xc
	str r0, [r4, #8]
	pop {r3, r4, r5, r6, pc}
_021F8EB4:
	mov r0, #1
	ldr r1, [r4, #8]
	lsl r0, r0, #0xc
	sub r0, r1, r0
	add sp, #0xc
	str r0, [r4, #8]
	pop {r3, r4, r5, r6, pc}
_021F8EC2:
	mov r0, #0xa
	ldr r1, [r4]
	lsl r0, r0, #0xc
	add r0, r1, r0
	add sp, #0xc
	str r0, [r4]
	pop {r3, r4, r5, r6, pc}
_021F8ED0:
	mov r0, #0xa
	ldr r1, [r4]
	lsl r0, r0, #0xc
	sub r0, r1, r0
	add sp, #0xc
	str r0, [r4]
	pop {r3, r4, r5, r6, pc}
_021F8EDE:
	cmp r5, #2
	beq _021F8EEA
	cmp r5, #3
	beq _021F8EF8
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
_021F8EEA:
	mov r0, #2
	ldr r1, [r4]
	lsl r0, r0, #0xc
	add r0, r1, r0
	add sp, #0xc
	str r0, [r4]
	pop {r3, r4, r5, r6, pc}
_021F8EF8:
	mov r0, #2
	ldr r1, [r4]
	lsl r0, r0, #0xc
	sub r0, r1, r0
	str r0, [r4]
_021F8F02:
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov01_021F8E70

	thumb_func_start ov01_021F8F08
ov01_021F8F08: ; 0x021F8F08
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r6, r0, #0
	add r5, r1, #0
	bl sub_0205F40C
	add r4, r0, #0
	cmp r5, #0
	beq _021F8F54
	add r1, sp, #0
	mov r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	ldrb r1, [r4, #0x17]
	mov r0, #4
	orr r0, r1
	strb r0, [r4, #0x17]
	add r0, r6, #0
	bl MapObject_GetFacingDirection
	add r1, sp, #0
	bl ov01_021FD9CC
	ldr r1, [sp]
	asr r0, r1, #0xb
	lsr r0, r0, #0x14
	add r0, r1, r0
	asr r0, r0, #0xc
	strb r0, [r4, #0x12]
	ldr r1, [sp, #8]
	add sp, #0xc
	asr r0, r1, #0xb
	lsr r0, r0, #0x14
	add r0, r1, r0
	asr r0, r0, #0xc
	strb r0, [r4, #0x13]
	pop {r3, r4, r5, r6, pc}
_021F8F54:
	ldrb r1, [r4, #0x17]
	mov r0, #4
	bic r1, r0
	strb r1, [r4, #0x17]
	mov r0, #0
	strb r0, [r4, #0x12]
	strb r0, [r4, #0x13]
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov01_021F8F08

	thumb_func_start ov01_021F8F68
ov01_021F8F68: ; 0x021F8F68
	push {r4, lr}
	add r4, r1, #0
	bl sub_0205F40C
	strb r4, [r0, #0x14]
	pop {r4, pc}
	thumb_func_end ov01_021F8F68

	thumb_func_start ov01_021F8F74
ov01_021F8F74: ; 0x021F8F74
	push {r4, lr}
	add r4, r1, #0
	bl sub_0205F40C
	mov r1, #0x14
	ldrsb r1, [r0, r1]
	add r1, r1, r4
	strb r1, [r0, #0x14]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021F8F74

	thumb_func_start ov01_021F8F88
ov01_021F8F88: ; 0x021F8F88
	push {r3, lr}
	bl sub_0205F40C
	ldrb r0, [r0, #0x17]
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1f
	bne _021F8F9A
	mov r0, #1
	pop {r3, pc}
_021F8F9A:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov01_021F8F88

	thumb_func_start ov01_021F8FA0
ov01_021F8FA0: ; 0x021F8FA0
	push {r4, lr}
	add r4, r1, #0
	bl sub_0205F40C
	mov r1, #0x12
	ldrsb r1, [r0, r1]
	lsl r1, r1, #0xc
	str r1, [r4]
	mov r1, #0x13
	ldrsb r0, [r0, r1]
	lsl r0, r0, #0xc
	str r0, [r4, #8]
	mov r0, #0
	str r0, [r4, #4]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021F8FA0

	thumb_func_start ov01_021F8FC0
ov01_021F8FC0: ; 0x021F8FC0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, r2, #0
	add r6, r1, #0
	bl sub_02023F30
	asr r1, r0, #0xb
	lsr r1, r1, #0x14
	add r1, r0, r1
	asr r4, r1, #0xc
	cmp r5, #3
	bhi _021F8FF6
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021F8FE4: ; jump table
	.short _021F8FF6 - _021F8FE4 - 2 ; case 0
	.short _021F8FEC - _021F8FE4 - 2 ; case 1
	.short _021F8FF0 - _021F8FE4 - 2 ; case 2
	.short _021F8FF4 - _021F8FE4 - 2 ; case 3
_021F8FEC:
	sub r4, #0x14
	b _021F8FF6
_021F8FF0:
	sub r4, #0x28
	b _021F8FF6
_021F8FF4:
	sub r4, #0x3c
_021F8FF6:
	add r0, r6, #0
	bl ov01_022055B0
	cmp r0, #0
	beq _021F9018
	cmp r5, #1
	bne _021F9010
	cmp r4, #5
	blt _021F900C
	cmp r4, #0xf
	blt _021F9028
_021F900C:
	mov r0, #1
	pop {r4, r5, r6, pc}
_021F9010:
	cmp r4, #0xa
	bge _021F9028
	mov r0, #1
	pop {r4, r5, r6, pc}
_021F9018:
	cmp r4, #5
	blt _021F9020
	cmp r4, #0xa
	blt _021F9024
_021F9020:
	cmp r4, #0xf
	blt _021F9028
_021F9024:
	mov r0, #1
	pop {r4, r5, r6, pc}
_021F9028:
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov01_021F8FC0

	thumb_func_start ov01_021F902C
ov01_021F902C: ; 0x021F902C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	bl sub_0205F40C
	add r2, r0, #0
	ldr r2, [r2]
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_02205808
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021F902C

	thumb_func_start ov01_021F9048
ov01_021F9048: ; 0x021F9048
	push {r3, lr}
	bl sub_0205F40C
	ldrb r2, [r0, #0x17]
	mov r1, #1
	bic r2, r1
	strb r2, [r0, #0x17]
	pop {r3, pc}
	thumb_func_end ov01_021F9048

	thumb_func_start ov01_021F9058
ov01_021F9058: ; 0x021F9058
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	bl ov01_021F9140
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	add r0, r4, #0
	add r1, sp, #0
	bl sub_0205F9A0
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021F9058

	thumb_func_start ov01_021F9078
ov01_021F9078: ; 0x021F9078
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl sub_0205F40C
	add r7, r0, #0
	add r0, r5, #0
	ldr r4, [r7]
	bl ov01_021FA2D4
	cmp r0, #1
	beq _021F90C0
	cmp r4, #0
	beq _021F90C0
	add r0, r5, #0
	bl sub_0205F330
	add r3, r0, #0
	lsl r6, r3, #2
	ldr r3, _021F90C4 ; =ov01_02208B5C
	add r0, r5, #0
	ldr r3, [r3, r6]
	add r1, r4, #0
	add r2, r7, #0
	blx r3
	add r0, r5, #0
	bl sub_0205F330
	str r0, [r7, #0x10]
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_021FA3E8
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_021F91A4
_021F90C0:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F90C4: .word ov01_02208B5C
	thumb_func_end ov01_021F9078

	thumb_func_start ov01_021F90C8
ov01_021F90C8: ; 0x021F90C8
	ldr r3, _021F90CC ; =ov01_021F91E4
	bx r3
	.balign 4, 0
_021F90CC: .word ov01_021F91E4
	thumb_func_end ov01_021F90C8

	thumb_func_start ov01_021F90D0
ov01_021F90D0: ; 0x021F90D0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_0205F40C
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _021F90E6
	add r1, r4, #4
	bl ov01_021F9610
_021F90E6:
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_021F95A8
	mov r1, #2
	add r0, r5, #0
	lsl r1, r1, #0x14
	bl MapObject_SetFlagsBits
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021F90D0

	thumb_func_start ov01_021F90FC
ov01_021F90FC: ; 0x021F90FC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_0205F40C
	add r4, r0, #0
	add r0, r5, #0
	bl ov01_021FA2D4
	cmp r0, #1
	beq _021F913C
	ldr r0, [r4]
	cmp r0, #0
	bne _021F911E
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_021F9510
_021F911E:
	ldr r0, [r4]
	cmp r0, #0
	beq _021F913C
	add r1, r4, #4
	bl ov01_021F9630
	ldr r1, [r4]
	add r0, r5, #0
	bl ov01_021FA3E8
	mov r1, #2
	add r0, r5, #0
	lsl r1, r1, #0x14
	bl MapObject_ClearFlagsBits
_021F913C:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021F90FC

	thumb_func_start ov01_021F9140
ov01_021F9140: ; 0x021F9140
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0x14
	bl sub_0205F3E8
	add r1, r0, #0
	add r0, r4, #0
	bl ov01_021F9510
	pop {r4, pc}
	thumb_func_end ov01_021F9140

	thumb_func_start ov01_021F9154
ov01_021F9154: ; 0x021F9154
	push {r4, lr}
	ldr r0, [r2, #0x10]
	add r4, r1, #0
	cmp r0, #0
	beq _021F916E
	add r0, r4, #0
	mov r1, #0
	bl sub_02023EE0
	add r0, r4, #0
	mov r1, #0
	bl sub_02023F40
_021F916E:
	mov r1, #1
	add r0, r4, #0
	lsl r1, r1, #0xc
	bl sub_02023F04
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021F9154

	thumb_func_start ov01_021F917C
ov01_021F917C: ; 0x021F917C
	push {r4, lr}
	ldr r0, [r2, #0x10]
	add r4, r1, #0
	cmp r0, #1
	beq _021F9196
	add r0, r4, #0
	mov r1, #1
	bl sub_02023EE0
	add r0, r4, #0
	mov r1, #0
	bl sub_02023F40
_021F9196:
	mov r1, #1
	add r0, r4, #0
	lsl r1, r1, #0xc
	bl sub_02023F04
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021F917C

	thumb_func_start ov01_021F91A4
ov01_021F91A4: ; 0x021F91A4
	push {r4, r5, r6, lr}
	mov r4, #1
	add r6, r1, #0
	lsl r1, r4, #9
	add r5, r0, #0
	bl MapObject_TestFlagsBits
	cmp r0, #1
	bne _021F91B8
	mov r4, #0
_021F91B8:
	mov r1, #1
	add r0, r5, #0
	lsl r1, r1, #0xc
	bl MapObject_TestFlagsBits
	cmp r0, #1
	bne _021F91D6
	mov r1, #2
	add r0, r5, #0
	lsl r1, r1, #0xc
	bl MapObject_TestFlagsBits
	cmp r0, #0
	bne _021F91D6
	mov r4, #0
_021F91D6:
	lsl r1, r4, #0x18
	add r0, r6, #0
	lsr r1, r1, #0x18
	bl sub_02023EA4
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov01_021F91A4

	thumb_func_start ov01_021F91E4
ov01_021F91E4: ; 0x021F91E4
	push {r4, lr}
	add r4, r0, #0
	bl sub_0205F40C
	add r1, r0, #0
	add r0, r4, #0
	bl ov01_021F95A8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021F91E4

	thumb_func_start ov01_021F91F8
ov01_021F91F8: ; 0x021F91F8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r4, r1, #0
	mov r1, #1
	add r5, r0, #0
	add r6, r2, #0
	add r7, r3, #0
	bl MapObjectManager_GetFlagsBitsMask
	cmp r0, #0
	beq _021F9212
	bl GF_AssertFail
_021F9212:
	add r0, r5, #0
	bl FldObjSys_OpenMModelNarc
	add r0, r5, #0
	bl MapObjectManager_GetCount
	str r0, [sp, #0x14]
	add r0, r5, #0
	bl MapObjectManager_GetHeapID
	sub r0, r0, #1
	str r0, [sp, #0x10]
	add r0, r5, #0
	bl sub_0205F1A0
	str r4, [sp]
	str r6, [sp, #4]
	ldr r1, [sp, #0x30]
	str r7, [sp, #8]
	str r1, [sp, #0xc]
	ldr r2, [sp, #0x14]
	ldr r3, [sp, #0x10]
	add r1, r5, #0
	bl ov01_021F944C
	add r0, r5, #0
	mov r1, #1
	bl MapObjectManager_SetFlagsBits
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov01_021F91F8

	thumb_func_start ov01_021F9250
ov01_021F9250: ; 0x021F9250
	push {r4, lr}
	add r4, r0, #0
	bl sub_0205F5D4
	cmp r0, #1
	beq _021F9260
	bl GF_AssertFail
_021F9260:
	add r0, r4, #0
	bl sub_0205F1A0
	bl ov01_021F94A0
	add r0, r4, #0
	mov r1, #1
	bl MapObjectManager_ClearFlagsBits
	add r0, r4, #0
	bl FldObjSys_CloseMModelNarc
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021F9250

	thumb_func_start FldObjSys_OpenMModelNarc
FldObjSys_OpenMModelNarc: ; 0x021F927C
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x51 ; NARC_data_mmodel_mmodel
	mov r1, #4
	bl NARC_New
	add r1, r0, #0
	add r0, r4, #0
	bl FldObjSys_SetMModelNarc
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end FldObjSys_OpenMModelNarc

	thumb_func_start FldObjSys_CloseMModelNarc
FldObjSys_CloseMModelNarc: ; 0x021F9294
	push {r3, lr}
	bl FldObjSys_GetMModelNarc
	bl NARC_Delete
	pop {r3, pc}
	thumb_func_end FldObjSys_CloseMModelNarc

	thumb_func_start ov01_021F92A0
ov01_021F92A0: ; 0x021F92A0
	push {r4, lr}
	add r4, r0, #0
	bl MapObject_GetManager
	mov r1, #4
	bl MapObjectManager_GetFlagsBitsMask
	cmp r0, #0
	bne _021F92DA
	mov r1, #1
	add r0, r4, #0
	lsl r1, r1, #0xe
	bl MapObject_GetFlagsMask
	cmp r0, #0
	beq _021F92DA
	add r0, r4, #0
	bl sub_0205F714
	cmp r0, #0
	beq _021F92D4
	add r0, r4, #0
	bl MapObject_CheckFlag4
	cmp r0, #0
	beq _021F92DA
_021F92D4:
	add r0, r4, #0
	bl sub_0205F484
_021F92DA:
	pop {r4, pc}
	thumb_func_end ov01_021F92A0

	thumb_func_start GetObjectEventGfxInfoPtr
GetObjectEventGfxInfoPtr: ; 0x021F92DC
	push {r3, lr}
	ldr r3, _021F92FC ; =ov01_022074A8
	ldr r1, _021F9300 ; =0x0000FFFF
_021F92E2:
	ldrh r2, [r3]
	cmp r2, r0
	bne _021F92EC
	add r0, r3, #0
	pop {r3, pc}
_021F92EC:
	add r3, r3, #6
	ldrh r2, [r3]
	cmp r2, r1
	bne _021F92E2
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_021F92FC: .word ov01_022074A8
_021F9300: .word 0x0000FFFF
	thumb_func_end GetObjectEventGfxInfoPtr

	thumb_func_start GetMoveModelNoBySpriteId
GetMoveModelNoBySpriteId: ; 0x021F9304
	push {r3, lr}
	bl GetObjectEventGfxInfoPtr
	cmp r0, #0
	bne _021F9314
	mov r0, #0
	mvn r0, r0
	pop {r3, pc}
_021F9314:
	ldrh r0, [r0, #2]
	pop {r3, pc}
	thumb_func_end GetMoveModelNoBySpriteId

	thumb_func_start ov01_021F9318
ov01_021F9318: ; 0x021F9318
	push {r3, lr}
	bl MapObject_GetGfxID
	bl ov01_021F9324
	pop {r3, pc}
	thumb_func_end ov01_021F9318

	thumb_func_start ov01_021F9324
ov01_021F9324: ; 0x021F9324
	push {r3, lr}
	bl GetObjectEventGfxInfoPtr
	cmp r0, #0
	bne _021F9332
	mov r0, #0
	pop {r3, pc}
_021F9332:
	ldrh r0, [r0, #4]
	ldr r1, _021F9340 ; =ov01_02206D00
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x1a
	add r0, r1, r0
	pop {r3, pc}
	nop
_021F9340: .word ov01_02206D00
	thumb_func_end ov01_021F9324

	thumb_func_start ov01_021F9344
ov01_021F9344: ; 0x021F9344
	push {r4, lr}
	add r4, r0, #0
	bl sub_0205F714
	cmp r0, #1
	bne _021F935E
	add r0, r4, #0
	bl MapObject_CheckFlag4
	cmp r0, #0
	bne _021F935E
	mov r0, #1
	pop {r4, pc}
_021F935E:
	mov r1, #1
	add r0, r4, #0
	lsl r1, r1, #8
	bl MapObject_GetFlagsMask
	cmp r0, #0
	beq _021F9370
	mov r0, #1
	pop {r4, pc}
_021F9370:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov01_021F9344

	thumb_func_start ReadMModelFromNarcInternal
ReadMModelFromNarcInternal: ; 0x021F9374
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r2, #0
	bl FldObjSys_GetMModelNarc
	add r1, r4, #0
	add r6, r0, #0
	bl NARC_GetMemberSize
	add r1, r0, #0
	cmp r5, #1
	bne _021F9394
	mov r0, #4
	bl AllocFromHeap
	b _021F939A
_021F9394:
	mov r0, #4
	bl AllocFromHeapAtEnd
_021F939A:
	add r5, r0, #0
	add r0, r6, #0
	add r1, r4, #0
	add r2, r5, #0
	bl NARC_ReadWholeMember
	add r0, r5, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ReadMModelFromNarcInternal

	thumb_func_start ov01_021F93AC
ov01_021F93AC: ; 0x021F93AC
	push {r3, r4, r5, lr}
	sub sp, #0x30
	add r4, r1, #0
	add r5, r0, #0
	add r1, sp, #0x24
	bl MapObject_GetPositionVec
	add r0, r5, #0
	add r1, sp, #0x18
	bl MapObject_GetFacingVec
	add r0, r5, #0
	add r1, sp, #0xc
	bl sub_0205F990
	add r0, r5, #0
	add r1, sp, #0
	bl sub_0205F9B0
	ldr r1, [sp, #0x24]
	ldr r0, [sp, #0x18]
	ldr r2, [sp, #0xc]
	add r0, r1, r0
	ldr r3, [sp]
	add r0, r2, r0
	add r0, r3, r0
	str r0, [r4]
	ldr r1, [sp, #0x28]
	ldr r0, [sp, #0x1c]
	ldr r2, [sp, #0x10]
	add r0, r1, r0
	ldr r3, [sp, #4]
	add r0, r2, r0
	add r0, r3, r0
	str r0, [r4, #4]
	ldr r1, [sp, #0x2c]
	ldr r0, [sp, #0x20]
	ldr r2, [sp, #0x14]
	add r0, r1, r0
	ldr r3, [sp, #8]
	add r0, r2, r0
	add r0, r3, r0
	str r0, [r4, #8]
	add sp, #0x30
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021F93AC

	thumb_func_start ov01_021F9408
ov01_021F9408: ; 0x021F9408
	push {r4, lr}
	add r4, r0, #0
	bl MapObject_SetFacingDirection
	add r0, r4, #0
	bl MapObject_CheckFlag14
	cmp r0, #1
	bne _021F9420
	add r0, r4, #0
	bl sub_0205F484
_021F9420:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021F9408

	thumb_func_start ov01_021F9424
ov01_021F9424: ; 0x021F9424
	push {r4, lr}
	mov r1, #1
	add r4, r0, #0
	bl MapObject_SetVisible
	mov r1, #1
	add r0, r4, #0
	lsl r1, r1, #0x14
	bl MapObject_SetFlagsBits
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021F9424

	thumb_func_start ov01_021F943C
ov01_021F943C: ; 0x021F943C
	bx lr
	.balign 4, 0
	thumb_func_end ov01_021F943C

	thumb_func_start ov01_021F9440
ov01_021F9440: ; 0x021F9440
	bx lr
	.balign 4, 0
	thumb_func_end ov01_021F9440

	thumb_func_start ov01_021F9444
ov01_021F9444: ; 0x021F9444
	bx lr
	.balign 4, 0
	thumb_func_end ov01_021F9444

	thumb_func_start ov01_021F9448
ov01_021F9448: ; 0x021F9448
	bx lr
	.balign 4, 0
	thumb_func_end ov01_021F9448

	.rodata

ov01_02208B5C: ; 0x02208B5C
	.word ov01_021F9154
	.word ov01_021F917C
