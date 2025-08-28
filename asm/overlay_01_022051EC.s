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
	.include "overlay_01_022051EC.inc"
	.include "global.inc"

	.text

	thumb_func_start ov01_022051EC
ov01_022051EC: ; 0x022051EC
	push {r3, r4, r5, lr}
	mov r2, #0
	mov r1, #0xc4
	add r3, r2, #0
	add r5, r0, #0
	bl ov01_021F1430
	add r4, r0, #0
	str r5, [r4]
	bl ov01_02205218
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_022051EC

	thumb_func_start ov01_02205208
ov01_02205208: ; 0x02205208
	push {r4, lr}
	add r4, r0, #0
	bl ov01_022052A4
	add r0, r4, #0
	bl ov01_021F1448
	pop {r4, pc}
	thumb_func_end ov01_02205208

	thumb_func_start ov01_02205218
ov01_02205218: ; 0x02205218
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	add r0, r4, #4
	mov r1, #4
	mov r2, #0x20
	bl HeapExp_FndInitAllocator
	add r0, r4, #0
	add r0, #0x14
	mov r1, #0x67
	mov r2, #0x84
	mov r3, #4
	bl Field3dModel_LoadFromFilesystem
	mov r0, #4
	str r0, [sp]
	add r0, r4, #4
	str r0, [sp, #4]
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0x24
	add r1, #0x14
	mov r2, #0x67
	mov r3, #0xa8
	bl Field3dModelAnimation_LoadFromFilesystem
	mov r0, #4
	str r0, [sp]
	add r0, r4, #4
	str r0, [sp, #4]
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0x38
	add r1, #0x14
	mov r2, #0x67
	mov r3, #0xa6
	bl Field3dModelAnimation_LoadFromFilesystem
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0x4c
	add r1, #0x14
	bl Field3dObject_InitFromModel
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0x4c
	add r1, #0x24
	bl Field3dObject_AddAnimation
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0x4c
	add r1, #0x38
	bl Field3dObject_AddAnimation
	add r0, r4, #0
	add r0, #0x24
	mov r1, #2
	mov r2, #0
	bl ov01_022053C4
	add r4, #0x4c
	add r0, r4, #0
	mov r1, #0
	bl Field3dObject_SetActiveFlag
	add sp, #8
	pop {r4, pc}
	thumb_func_end ov01_02205218

	thumb_func_start ov01_022052A4
ov01_022052A4: ; 0x022052A4
	push {r4, lr}
	add r4, r0, #0
	add r1, r4, #4
	add r0, #0x38
	bl Field3dModelAnimation_Unload
	add r0, r4, #0
	add r0, #0x24
	add r1, r4, #4
	bl Field3dModelAnimation_Unload
	add r4, #0x14
	add r0, r4, #0
	bl Field3dModel_Unload
	pop {r4, pc}
	thumb_func_end ov01_022052A4

	thumb_func_start ov01_022052C4
ov01_022052C4: ; 0x022052C4
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r4, r1, #0
	mov r1, #0x16
	str r5, [sp, #8]
	bl ov01_021F1450
	str r0, [sp, #0xc]
	add r0, sp, #8
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r1, _022052F0 ; =ov01_022096CC
	add r0, r5, #0
	add r2, r4, #0
	mov r3, #0
	bl ov01_021F1620
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_022052F0: .word ov01_022096CC
	thumb_func_end ov01_022052C4

	thumb_func_start ov01_022052F4
ov01_022052F4: ; 0x022052F4
	push {r3, lr}
	bl sub_02068D74
	ldr r0, [r0]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov01_022052F4

	thumb_func_start ov01_02205300
ov01_02205300: ; 0x02205300
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r4, r1, #0
	bl sub_02068D98
	ldr r1, [r0, #4]
	mov r2, #0
	str r1, [r4, #4]
	str r2, [r4]
	ldr r4, [r0, #4]
	mov r1, #2
	add r0, r4, #0
	add r0, #0x24
	bl ov01_022053C4
	add r0, r4, #0
	add r0, #0x4c
	mov r1, #1
	bl Field3dObject_SetActiveFlag
	add r0, r5, #0
	add r1, sp, #0
	bl sub_02068DB8
	add r4, #0x4c
	ldr r1, [sp]
	ldr r2, [sp, #4]
	ldr r3, [sp, #8]
	add r0, r4, #0
	bl Field3dObject_SetPosEx
	mov r0, #SEQ_SE_GS_TUREARUKI>>4
	lsl r0, r0, #4
	bl PlaySE
	mov r0, #1
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_02205300

	thumb_func_start ov01_02205350
ov01_02205350: ; 0x02205350
	bx lr
	.balign 4, 0
	thumb_func_end ov01_02205350

	thumb_func_start ov01_02205354
ov01_02205354: ; 0x02205354
	ldr r0, [r1, #4]
	ldr r3, _02205360 ; =Field3dObject_SetActiveFlag
	add r0, #0x4c
	mov r1, #0
	bx r3
	nop
_02205360: .word Field3dObject_SetActiveFlag
	thumb_func_end ov01_02205354

	thumb_func_start ov01_02205364
ov01_02205364: ; 0x02205364
	push {r3, r4, r5, lr}
	add r5, r1, #0
	ldr r4, [r5, #4]
	mov r1, #2
	add r0, r4, #0
	add r0, #0x24
	bl ov01_02205388
	cmp r0, #0
	beq _0220537C
	mov r0, #1
	str r0, [r5]
_0220537C:
	add r4, #0x4c
	add r0, r4, #0
	bl Field3dObject_Draw
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_02205364

	thumb_func_start ov01_02205388
ov01_02205388: ; 0x02205388
	push {r3, r4, r5, r6, r7, lr}
	mov r5, #0
	add r6, r1, #0
	add r7, r0, #0
	add r4, r5, #0
	cmp r6, #0
	bls _022053B8
_02205396:
	mov r0, #0x14
	mul r0, r4
	mov r1, #1
	add r0, r7, r0
	lsl r1, r1, #0xc
	bl Field3dModelAnimation_FrameAdvanceAndCheck
	cmp r0, #0
	beq _022053AE
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
_022053AE:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, r6
	blo _02205396
_022053B8:
	cmp r5, r6
	bne _022053C0
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_022053C0:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov01_02205388

	thumb_func_start ov01_022053C4
ov01_022053C4: ; 0x022053C4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r6, r0, #0
	add r7, r2, #0
	mov r4, #0
	cmp r5, #0
	bls _022053E8
_022053D2:
	mov r0, #0x14
	mul r0, r4
	add r0, r6, r0
	add r1, r7, #0
	bl Field3dModelAnimation_FrameSet
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, r5
	blo _022053D2
_022053E8:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_022053C4

	.rodata

ov01_022096CC: ; 0x022096CC
	.word 0x00000008
	.word ov01_02205300
	.word ov01_02205354
	.word ov01_02205350
	.word ov01_02205364
