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
	.include "overlay_01_021EA6C4.inc"
	.include "global.inc"

	.text

	thumb_func_start ov01_021EA724
ov01_021EA724: ; 0x021EA724
	push {r4, lr}
	mov r0, #4
	mov r1, #8
	bl Heap_Alloc
	add r4, r0, #0
	bne _021EA736
	bl GF_AssertFail
_021EA736:
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021EA724

	thumb_func_start ov01_021EA73C
ov01_021EA73C: ; 0x021EA73C
	push {r3, r4, r5, r6, lr}
	sub sp, #0x4c
	add r4, r0, #0
	add r0, sp, #4
	add r5, r1, #0
	bl FS_InitFile
	add r0, sp, #4
	add r1, r4, #0
	bl FS_OpenFile
	cmp r0, #0
	beq _021EA7D8
	add r1, sp, #0
	add r0, sp, #4
	add r1, #2
	mov r2, #2
	bl FS_ReadFile
	cmp r0, #0
	bge _021EA76A
	bl GF_AssertFail
_021EA76A:
	add r0, sp, #4
	add r1, sp, #0
	mov r2, #2
	bl FS_ReadFile
	cmp r0, #0
	bge _021EA77C
	bl GF_AssertFail
_021EA77C:
	add r0, sp, #0
	ldrh r1, [r0, #2]
	ldrh r0, [r0]
	lsl r6, r1, #2
	lsl r4, r0, #2
	mov r0, #4
	add r1, r6, #0
	bl Heap_Alloc
	str r0, [r5]
	cmp r0, #0
	bne _021EA798
	bl GF_AssertFail
_021EA798:
	mov r0, #4
	add r1, r4, #0
	bl Heap_Alloc
	str r0, [r5, #4]
	cmp r0, #0
	bne _021EA7AA
	bl GF_AssertFail
_021EA7AA:
	ldr r1, [r5]
	add r0, sp, #4
	add r2, r6, #0
	bl FS_ReadFile
	cmp r0, #0
	bge _021EA7BC
	bl GF_AssertFail
_021EA7BC:
	ldr r1, [r5, #4]
	add r0, sp, #4
	add r2, r4, #0
	bl FS_ReadFile
	cmp r0, #0
	bge _021EA7CE
	bl GF_AssertFail
_021EA7CE:
	add r0, sp, #4
	bl FS_CloseFile
	add sp, #0x4c
	pop {r3, r4, r5, r6, pc}
_021EA7D8:
	bl GF_AssertFail
	add sp, #0x4c
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov01_021EA73C

	thumb_func_start ov01_021EA7E0
ov01_021EA7E0: ; 0x021EA7E0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #4]
	bl Heap_Free
	ldr r0, [r4]
	bl Heap_Free
	add r0, r4, #0
	bl Heap_Free
	pop {r4, pc}
	thumb_func_end ov01_021EA7E0

	thumb_func_start ov01_021EA7F8
ov01_021EA7F8: ; 0x021EA7F8
	ldr r1, [r1]
	lsl r0, r0, #2
	ldrh r0, [r1, r0]
	strh r0, [r2]
	bx lr
	.balign 4, 0
	thumb_func_end ov01_021EA7F8

	thumb_func_start ov01_021EA804
ov01_021EA804: ; 0x021EA804
	push {r3, r4}
	lsl r4, r0, #2
	ldr r0, [r1]
	ldrh r0, [r0, r4]
	strh r0, [r2]
	ldr r0, [r1]
	add r0, r0, r4
	ldrh r0, [r0, #2]
	strh r0, [r3]
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end ov01_021EA804

	thumb_func_start ov01_021EA81C
ov01_021EA81C: ; 0x021EA81C
	ldr r1, [r1, #4]
	lsl r0, r0, #2
	add r0, r1, r0
	bx lr
	thumb_func_end ov01_021EA81C
