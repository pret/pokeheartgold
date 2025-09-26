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
	.include "overlay_01_02200040.inc"
	.include "global.inc"

	.text

	thumb_func_start ov01_02200040
ov01_02200040: ; 0x02200040
	push {r3, r4, r5, lr}
	mov r2, #0
	mov r1, #4
	add r3, r2, #0
	add r5, r0, #0
	bl ov01_021F1430
	add r4, r0, #0
	str r5, [r4]
	bl ov01_0220006C
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_02200040

	thumb_func_start ov01_0220005C
ov01_0220005C: ; 0x0220005C
	push {r4, lr}
	add r4, r0, #0
	bl ov01_022000B4
	add r0, r4, #0
	bl ov01_021F1448
	pop {r4, pc}
	thumb_func_end ov01_0220005C

	thumb_func_start ov01_0220006C
ov01_0220006C: ; 0x0220006C
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldr r0, [r4]
	mov r1, #9
	mov r2, #0x7c
	bl ov01_021F18D4
	ldr r0, [r4]
	mov r1, #9
	mov r2, #0x94
	bl ov01_021F1908
	ldr r0, [r4]
	mov r1, #0xa
	mov r2, #0x17
	mov r3, #1
	bl ov01_021F1930
	mov r0, #0xa
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, _022000B0 ; =ov01_022092A8
	mov r2, #9
	str r0, [sp, #8]
	ldr r0, [r4]
	mov r1, #0xb
	add r3, r2, #0
	bl ov01_021F1758
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_022000B0: .word ov01_022092A8
	thumb_func_end ov01_0220006C

	thumb_func_start ov01_022000B4
ov01_022000B4: ; 0x022000B4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	mov r1, #9
	bl ov01_021F18FC
	ldr r0, [r4]
	mov r1, #9
	bl ov01_021F1924
	ldr r0, [r4]
	mov r1, #0xa
	bl ov01_021F1970
	ldr r0, [r4]
	mov r1, #0xb
	bl ov01_021F18C8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_022000B4

	thumb_func_start ov01_022000DC
ov01_022000DC: ; 0x022000DC
	push {r3, r4, r5, r6, lr}
	sub sp, #0x24
	add r5, r0, #0
	bl ov01_021F146C
	add r4, r0, #0
	add r0, r5, #0
	bl MapObject_GetFieldSystem
	str r0, [sp, #0x14]
	add r0, r4, #0
	mov r1, #0xf
	str r4, [sp, #0x18]
	bl ov01_021F1450
	str r0, [sp, #0x1c]
	add r0, r5, #0
	add r1, sp, #8
	str r5, [sp, #0x20]
	bl MapObject_CopyPositionVector
	add r0, r5, #0
	bl MapObject_GetXCoord
	add r6, r0, #0
	add r0, r5, #0
	bl MapObject_GetZCoord
	add r1, r0, #0
	add r0, r6, #0
	add r2, sp, #8
	bl sub_020611C8
	add r0, r5, #0
	mov r1, #2
	bl MapObject_GetPriorityPlusValue
	add r1, sp, #0x14
	str r1, [sp]
	str r0, [sp, #4]
	ldr r1, _0220013C ; =ov01_02209294
	add r0, r4, #0
	add r2, sp, #8
	mov r3, #0
	bl ov01_021F1620
	add sp, #0x24
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_0220013C: .word ov01_02209294
	thumb_func_end ov01_022000DC

	thumb_func_start ov01_02200140
ov01_02200140: ; 0x02200140
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r5, r0, #0
	bl sub_02068D98
	add r2, r4, #0
	add r3, r0, #0
	add r2, #0x10
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r4, #0x1c]
	bl MapObject_GetID
	str r0, [r4, #4]
	ldr r0, [r4, #0x1c]
	bl MapObject_GetMapID
	str r0, [r4, #8]
	add r0, r5, #0
	add r1, sp, #0
	bl sub_02068DB8
	ldr r0, [r4, #0x14]
	mov r1, #0xb
	add r2, sp, #0
	bl ov01_021F1740
	str r0, [r4, #0x20]
	mov r0, #1
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov01_02200140

	thumb_func_start ov01_02200184
ov01_02200184: ; 0x02200184
	ldr r3, _0220018C ; =sub_02023DA4
	ldr r0, [r1, #0x20]
	bx r3
	nop
_0220018C: .word sub_02023DA4
	thumb_func_end ov01_02200184

	thumb_func_start ov01_02200190
ov01_02200190: ; 0x02200190
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	bne _022001BE
	mov r1, #1
	ldr r0, [r4, #0x20]
	lsl r1, r1, #0xc
	bl sub_02023F04
	ldr r0, [r4, #0x20]
	bl sub_02023F70
	asr r1, r0, #0xb
	lsr r1, r1, #0x14
	add r1, r0, r1
	asr r0, r1, #0xc
	cmp r0, #7
	blt _022001BE
	add r0, r5, #0
	bl ov01_021F1640
_022001BE:
	pop {r3, r4, r5, pc}
	thumb_func_end ov01_02200190

	thumb_func_start ov01_022001C0
ov01_022001C0: ; 0x022001C0
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r1, sp, #0
	bl sub_02068DB8
	mov r0, #2
	ldr r1, [sp, #8]
	lsl r0, r0, #0xe
	add r0, r1, r0
	str r0, [sp, #8]
	ldr r0, [r4, #0x20]
	add r1, sp, #0
	bl sub_02023E50
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov01_022001C0

	.rodata

ov01_02209294: ; 0x02209294
	.word 0x00000024
	.word ov01_02200140
	.word ov01_02200184
	.word ov01_02200190
	.word ov01_022001C0

ov01_022092A8: ; 0x022092A8
	.byte 0x00, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
