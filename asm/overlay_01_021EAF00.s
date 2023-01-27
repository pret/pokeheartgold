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
	.include "overlay_01_021EAF00.inc"
	.include "global.inc"

	.text

	thumb_func_start ov01_021EAF00
ov01_021EAF00: ; 0x021EAF00
	push {r4, lr}
	ldr r4, [r0, #0x18]
	cmp r4, #0
	bne _021EAF0C
	bl GF_AssertFail
_021EAF0C:
	cmp r4, #7
	blt _021EAF14
	bl GF_AssertFail
_021EAF14:
	sub r0, r4, #1
	pop {r4, pc}
	thumb_func_end ov01_021EAF00

	thumb_func_start ov01_021EAF18
ov01_021EAF18: ; 0x021EAF18
	push {r4, lr}
	add r4, r0, #0
	bl ov01_021EAF00
	add r1, r0, #0
	lsl r2, r1, #4
	ldr r1, _021EAF30 ; =ov01_022066DC
	add r0, r4, #0
	ldr r1, [r1, r2]
	blx r1
	pop {r4, pc}
	nop
_021EAF30: .word ov01_022066DC
	thumb_func_end ov01_021EAF18

	thumb_func_start ov01_021EAF34
ov01_021EAF34: ; 0x021EAF34
	push {r4, lr}
	add r4, r0, #0
	bl ov01_021EAF00
	lsl r1, r0, #4
	ldr r0, _021EAF50 ; =ov01_022066DC + 4
	ldr r1, [r0, r1]
	cmp r1, #0
	bne _021EAF4A
	mov r0, #1
	pop {r4, pc}
_021EAF4A:
	add r0, r4, #0
	blx r1
	pop {r4, pc}
	.balign 4, 0
_021EAF50: .word ov01_022066DC + 4
	thumb_func_end ov01_021EAF34

	thumb_func_start ov01_021EAF54
ov01_021EAF54: ; 0x021EAF54
	push {r4, lr}
	add r4, r0, #0
	bl ov01_021EAF00
	add r1, r0, #0
	lsl r2, r1, #4
	ldr r1, _021EAF6C ; =ov01_022066DC + 8
	add r0, r4, #0
	ldr r1, [r1, r2]
	blx r1
	pop {r4, pc}
	nop
_021EAF6C: .word ov01_022066DC + 8
	thumb_func_end ov01_021EAF54

	thumb_func_start ov01_021EAF70
ov01_021EAF70: ; 0x021EAF70
	push {r4, lr}
	add r4, r0, #0
	bl ov01_021EAF00
	add r1, r0, #0
	lsl r2, r1, #4
	ldr r1, _021EAF88 ; =ov01_022066DC + 12
	add r0, r4, #0
	ldr r1, [r1, r2]
	blx r1
	pop {r4, pc}
	nop
_021EAF88: .word ov01_022066DC + 12
	thumb_func_end ov01_021EAF70

	thumb_func_start ov01_021EAF8C
ov01_021EAF8C: ; 0x021EAF8C
	bx lr
	.balign 4, 0
	thumb_func_end ov01_021EAF8C

	thumb_func_start ov01_021EAF90
ov01_021EAF90: ; 0x021EAF90
	bx lr
	.balign 4, 0
	thumb_func_end ov01_021EAF90

	thumb_func_start ov01_021EAF94
ov01_021EAF94: ; 0x021EAF94
	mov r0, #1
	bx lr
	thumb_func_end ov01_021EAF94

	thumb_func_start ov01_021EAF98
ov01_021EAF98: ; 0x021EAF98
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021EAFB0 ; =FS_OVERLAY_ID(OVY_19)
	mov r1, #2
	bl HandleLoadOverlay
	add r0, r4, #0
	bl ov19_022598C0
	add r4, #0xd8
	str r0, [r4]
	pop {r4, pc}
	.balign 4, 0
_021EAFB0: .word FS_OVERLAY_ID(OVY_19)
	thumb_func_end ov01_021EAF98

	thumb_func_start ov01_021EAFB4
ov01_021EAFB4: ; 0x021EAFB4
	push {r4, lr}
	add r4, r0, #0
	bl ov19_02259918
	mov r0, #0
	add r4, #0xd8
	str r0, [r4]
	ldr r0, _021EAFCC ; =FS_OVERLAY_ID(OVY_19)
	bl UnloadOverlayByID
	pop {r4, pc}
	nop
_021EAFCC: .word FS_OVERLAY_ID(OVY_19)
	thumb_func_end ov01_021EAFB4

	thumb_func_start ov01_021EAFD0
ov01_021EAFD0: ; 0x021EAFD0
	mov r0, #1
	bx lr
	thumb_func_end ov01_021EAFD0

	.rodata

ov01_022066DC: ; 0x022066DC
	.word ov01_021F6894, 0x00000000, ov01_021F68B8, ov01_021F68C0
	.word ov01_021EAF8C, 0x00000000, ov01_021EAF90, ov01_021EAF94
	.word ov01_021F6894, 0x00000000, ov01_021F68B8, ov01_021F68C0
	.word ov01_021F6840, 0x00000000, ov01_021F6864, ov01_021F6874
	.word sub_0203DB6C, 0x00000000, sub_0203DB70, sub_0203DB74
	.word ov01_021EAF98, 0x00000000, ov01_021EAFB4, ov01_021EAFD0
