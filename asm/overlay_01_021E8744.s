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
	.include "overlay_01_021E8744.inc"
	.include "global.inc"

	.text

	thumb_func_start ov01_021E8D10
ov01_021E8D10: ; 0x021E8D10
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x40]
	str r1, [sp, #0x1c]
	str r0, [sp, #0x40]
	ldr r0, [sp, #0x4c]
	str r2, [sp, #0x20]
	str r0, [sp, #0x4c]
	add r0, r3, #0
	mov r5, #0
	str r3, [sp, #0x24]
	ldr r6, [sp, #0x44]
	ldr r7, [sp, #0x48]
	cmp r0, #0
	ble _021E8D68
_021E8D30:
	str r6, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [sp, #0x1c]
	ldr r2, [sp, #0x40]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x20]
	add r1, r5, #0
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x18]
	mov r3, #0
	str r7, [sp, #0x14]
	bl MapPropAnimationManager_LoadPropAnimationForOneShot
	add r4, r0, #0
	bne _021E8D56
	bl GF_AssertFail
_021E8D56:
	ldr r0, [sp, #0x4c]
	add r1, r5, #0
	add r2, r4, #0
	bl MapPropOneShotAnimation_SetAnimation
	ldr r0, [sp, #0x24]
	add r5, r5, #1
	cmp r5, r0
	blt _021E8D30
_021E8D68:
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov01_021E8D10

	thumb_func_start ov01_021E8D6C
ov01_021E8D6C: ; 0x021E8D6C
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	str r0, [sp]
	ldr r0, [r6, #0x2c]
	bl MapPropAnimationData_GetAnimation
	add r7, r0, #0
	mov r4, #0
	add r5, r6, #0
_021E8D7E:
	ldr r0, [r5, #0x14]
	cmp r0, #0
	beq _021E8D8A
	add r1, r7, #0
	bl ov01_02204518
_021E8D8A:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #6
	blt _021E8D7E
	ldr r0, [r6, #0x10]
	mov r5, #0
	cmp r0, #0
	ble _021E8DB0
	add r4, r6, #0
	add r7, r5, #0
_021E8D9E:
	ldr r0, [r4]
	ldr r1, [sp]
	bl MapPropAnimationManager_UnloadAnimation
	stmia r4!, {r7}
	ldr r0, [r6, #0x10]
	add r5, r5, #1
	cmp r5, r0
	blt _021E8D9E
_021E8DB0:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_021E8D6C

	thumb_func_start ov01_021E8DB4
ov01_021E8DB4: ; 0x021E8DB4
	push {r4, lr}
	mov r1, #0xe
	mov r0, #4
	lsl r1, r1, #6
	bl Heap_Alloc
	add r4, r0, #0
	mov r2, #0xe
	mov r0, #0
	add r1, r4, #0
	lsl r2, r2, #6
	bl MIi_CpuClearFast
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021E8DB4

	thumb_func_start ov01_021E8DD4
ov01_021E8DD4: ; 0x021E8DD4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _021E8DE6
	bl Heap_Free
	mov r0, #0
	str r0, [r4]
_021E8DE6:
	pop {r4, pc}
	thumb_func_end ov01_021E8DD4

	thumb_func_start ov01_021E8DE8
ov01_021E8DE8: ; 0x021E8DE8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r7, r0, #0
	add r0, r1, #0
	lsl r1, r2, #0x18
	lsr r1, r1, #0x18
	add r6, r3, #0
	bl MapPropOneShotAnimationManager_AllocateAnimation
	add r5, r0, #0
	bne _021E8E06
	bl GF_AssertFail
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_021E8E06:
	ldr r0, [sp, #0x28]
	ldr r1, [sp, #0x34]
	add r2, r5, #0
	bl MapPropOneShotAnimation_Init
	add r0, sp, #0x38
	ldrb r4, [r0]
	cmp r4, #0
	bne _021E8E1C
	bl GF_AssertFail
_021E8E1C:
	cmp r4, #0
	bne _021E8E22
	mov r4, #1
_021E8E22:
	ldr r0, [sp, #0x3c]
	str r4, [sp]
	str r0, [sp, #4]
	str r7, [sp, #8]
	ldr r1, [sp, #0x2c]
	ldr r2, [sp, #0x30]
	ldr r3, [sp, #0x34]
	add r0, r6, #0
	str r5, [sp, #0xc]
	bl ov01_021E8D10
	str r6, [r5, #0x30]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_021E8DE8

	thumb_func_start ov01_021E8E40
ov01_021E8E40: ; 0x021E8E40
	push {r3, r4, r5, r6, r7, lr}
	add r4, r2, #0
	add r5, r0, #0
	add r7, r1, #0
	add r6, r3, #0
	cmp r4, #6
	blo _021E8E52
	bl GF_AssertFail
_021E8E52:
	add r0, r5, #0
	add r1, r7, #0
	bl MapPropOneShotAnimationManager_GetAnimation
	add r5, r0, #0
	add r5, #0x14
	lsl r4, r4, #2
	ldr r0, [r5, r4]
	cmp r0, #0
	beq _021E8E6A
	bl GF_AssertFail
_021E8E6A:
	str r6, [r5, r4]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_021E8E40

	thumb_func_start ov01_021E8E70
ov01_021E8E70: ; 0x021E8E70
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r6, r2, #0
	cmp r4, #0
	bne _021E8E80
	bl GF_AssertFail
_021E8E80:
	add r0, r5, #0
	add r1, r4, #0
	bl MapPropOneShotAnimationManager_GetAnimation
	add r1, r6, #0
	bl MapPropOneShotAnimation_SwitchAnimation
	mov r1, #0
	bl MapPropAnimationData_SetAnimationPaused
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov01_021E8E70

	thumb_func_start ov01_021E8E98
ov01_021E8E98: ; 0x021E8E98
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r6, r0, #0
	add r7, r2, #0
	add r4, r3, #0
	cmp r5, #0
	bne _021E8EAA
	bl GF_AssertFail
_021E8EAA:
	add r0, r6, #0
	add r1, r5, #0
	bl MapPropOneShotAnimationManager_GetAnimation
	add r1, r7, #0
	bl MapPropOneShotAnimation_SwitchAnimation
	add r5, r0, #0
	cmp r4, #0
	beq _021E8EC6
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
	bl PlaySE
_021E8EC6:
	add r0, r5, #0
	mov r1, #0
	bl MapPropAnimationData_SetAnimationPaused
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov01_021E8E98

	thumb_func_start ov01_021E8ED0
ov01_021E8ED0: ; 0x021E8ED0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	bne _021E8EDE
	bl GF_AssertFail
_021E8EDE:
	add r0, r4, #0
	add r1, r6, #0
	bl MapPropOneShotAnimationManager_GetAnimation
	add r4, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_021E8D6C
	add r0, r4, #0
	bl MapPropOneShotAnimation_Reset
	pop {r4, r5, r6, pc}
	thumb_func_end ov01_021E8ED0

	thumb_func_start ov01_021E8EF8
ov01_021E8EF8: ; 0x021E8EF8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bne _021E8F04
	bl GF_AssertFail
_021E8F04:
	add r0, r5, #0
	add r1, r4, #0
	bl MapPropOneShotAnimationManager_GetAnimation
	ldr r0, [r0, #0x2c]
	pop {r3, r4, r5, pc}
	thumb_func_end ov01_021E8EF8

	thumb_func_start ov01_021E8F10
ov01_021E8F10: ; 0x021E8F10
	push {r4, lr}
	bl ov01_021E8EF8
	add r4, r0, #0
	bne _021E8F1E
	bl GF_AssertFail
_021E8F1E:
	ldr r0, [r4]
	bl MapPropAnimation_IsLoopFinished
	cmp r0, #0
	beq _021E8F2C
	mov r0, #1
	pop {r4, pc}
_021E8F2C:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov01_021E8F10

	thumb_func_start ov01_021E8F30
ov01_021E8F30: ; 0x021E8F30
	push {r3, lr}
	bl MapPropOneShotAnimationManager_GetAnimation
	ldr r0, [r0, #0x30]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov01_021E8F30

	thumb_func_start ov01_021E8F3C
ov01_021E8F3C: ; 0x021E8F3C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	add r4, r0, #0
	ldr r0, [sp, #0x50]
	ldr r7, [sp, #0x54]
	str r0, [sp, #0x50]
	mov r0, #0
	str r0, [sp, #0x1c]
	add r0, r7, #0
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	str r3, [sp, #0x10]
	bl MapPropAnimationManager_GetAnimListNARCFileCount
	cmp r4, r0
	bge _021E8F86
	ldr r0, [sp, #0x50]
	ldrb r0, [r0]
	cmp r0, #0
	beq _021E8F86
	mov r0, #0
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x50]
	str r0, [sp, #0x18]
_021E8F6C:
	ldr r0, [sp, #0x18]
	mov r1, #0
	ldr r0, [r0, #8]
	mvn r1, r1
	str r0, [sp, #0x24]
	cmp r0, r1
	beq _021E8F86
	ldr r0, [sp, #0x50]
	ldrb r0, [r0, #1]
	bl MapPropAnimation_CheckDeferredLoadingFlag
	cmp r0, #0
	beq _021E8F88
_021E8F86:
	b _021E90AC
_021E8F88:
	ldr r0, [sp, #0x50]
	ldrb r0, [r0, #1]
	bl MapPropAnimation_CheckDeferredAddToRenderObjFlag
	cmp r0, #0
	bne _021E8F9A
	mov r0, #1
	str r0, [sp, #0x14]
	b _021E8F9E
_021E8F9A:
	mov r0, #0
	str r0, [sp, #0x14]
_021E8F9E:
	mov r4, #0
	add r1, r7, #0
_021E8FA2:
	ldr r0, [r1, #0x14]
	cmp r0, #0
	bne _021E9062
	lsl r0, r4, #4
	add r5, r7, r0
	mov r0, #1
	str r0, [r5, #0x14]
	mov r0, #0x4e
	lsl r0, r0, #2
	ldr r0, [r7, r0]
	bl ov01_022042FC
	add r6, r0, #0
	bne _021E8FC2
	bl GF_AssertFail
_021E8FC2:
	ldr r0, [sp, #0x50]
	ldrb r0, [r0, #2]
	cmp r0, #0
	beq _021E8FD8
	mov r1, #1
	add r0, r6, #0
	add r2, r1, #0
	mov r3, #0
	bl ov01_022044C8
	b _021E8FE6
_021E8FD8:
	mov r1, #0
	mov r2, #0
	add r0, r6, #0
	mvn r1, r1
	add r3, r2, #0
	bl ov01_022044C8
_021E8FE6:
	ldr r0, [sp, #0x24]
	mov r1, #0x13
	str r0, [r5, #0x18]
	mov r0, #0
	str r0, [r5, #0x1c]
	ldr r0, [sp, #8]
	lsl r1, r1, #4
	str r0, [sp]
	ldr r0, [sp, #0x10]
	ldr r3, [sp, #0x24]
	str r0, [sp, #4]
	ldr r0, [r7, r1]
	add r1, #8
	ldr r1, [r7, r1]
	add r2, r6, #0
	bl ov01_021E87A8
	add r0, r6, #0
	str r6, [r5, #0x10]
	bl MapPropAnimation_GoToFirstFrame
	ldr r0, [sp, #0x14]
	cmp r0, #0
	beq _021E9044
	ldr r0, [sp, #0x50]
	ldrb r0, [r0, #2]
	cmp r0, #0
	beq _021E9034
	ldr r3, [sp, #0x24]
	mov r0, #0x11
	lsl r0, r0, #4
	lsl r3, r3, #0x18
	ldr r1, [sp, #0xc]
	ldr r2, [r5, #0x10]
	add r0, r7, r0
	lsr r3, r3, #0x18
	bl BicycleSlopeAnimation_Load
	b _021E9036
_021E9034:
	mov r0, #1
_021E9036:
	cmp r0, #0
	beq _021E906A
	ldr r0, [sp, #0xc]
	ldr r1, [r5, #0x10]
	bl ov01_0220450C
	b _021E906A
_021E9044:
	ldr r0, [sp, #0x50]
	ldrb r0, [r0, #1]
	cmp r0, #8
	bne _021E906A
	ldr r0, [sp, #0x1c]
	add r1, r0, #0
	add r1, r1, #1
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	str r1, [sp, #0x1c]
	ldr r2, [r5, #0x10]
	lsl r1, r0, #2
	add r0, sp, #0x28
	str r2, [r0, r1]
	b _021E906A
_021E9062:
	add r4, r4, #1
	add r1, #0x10
	cmp r4, #0x10
	blt _021E8FA2
_021E906A:
	cmp r4, #0x10
	bne _021E9072
	bl GF_AssertFail
_021E9072:
	ldr r0, [sp, #0x18]
	add r0, r0, #4
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x20]
	add r0, r0, #1
	str r0, [sp, #0x20]
	cmp r0, #4
	bge _021E9084
	b _021E8F6C
_021E9084:
	ldr r0, [sp, #0x50]
	ldrb r0, [r0, #1]
	cmp r0, #8
	bne _021E90AC
	ldr r0, [sp, #0x58]
	bl ov01_02204834
	add r1, r0, #0
	lsl r2, r1, #2
	add r1, sp, #0x28
	ldr r0, [sp, #0xc]
	ldr r1, [r1, r2]
	bl ov01_0220450C
	ldr r0, [sp, #0x58]
	ldr r1, [sp, #0xc]
	add r2, sp, #0x28
	mov r3, #4
	bl ov01_0220476C
_021E90AC:
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov01_021E8F3C

	thumb_func_start ov01_021E90B0
ov01_021E90B0: ; 0x021E90B0
	push {r4, lr}
	add r4, r2, #0
	bl MapPropOneShotAnimationManager_GetAnimation
	add r0, #0x35
	strb r4, [r0]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021E90B0
