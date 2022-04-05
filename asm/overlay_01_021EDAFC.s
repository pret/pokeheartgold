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

	thumb_func_start ov01_021EDAFC
ov01_021EDAFC: ; 0x021EDAFC
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	ldr r1, [sp, #0x2c]
	add r4, r0, #0
	add r5, r2, #0
	add r7, r3, #0
	cmp r1, #0
	bne _021EDB2A
	mov r0, #1
	mov r1, #0x1b ; msgdata/msg.narc
	mov r2, #0xbf ; msg_0191.gmm
	mov r3, #4
	bl NewMsgDataFromNarc
	add r1, r6, #0
	add r1, #0x8c
	str r0, [r1]
	add r0, r6, #0
	add r0, #0x97
	ldrb r1, [r0]
	mov r0, #2
	orr r1, r0
	b _021EDB3A
_021EDB2A:
	add r0, r6, #0
	add r0, #0x8c
	str r1, [r0]
	add r0, r6, #0
	add r0, #0x97
	ldrb r1, [r0]
	mov r0, #2
	bic r1, r0
_021EDB3A:
	add r0, r6, #0
	add r0, #0x97
	strb r1, [r0]
	add r0, r6, #0
	ldr r1, [sp, #0x24]
	add r0, #0x90
	str r1, [r0]
	add r0, r6, #0
	str r4, [r6]
	ldr r1, [sp, #0x20]
	add r0, #0xa0
	str r1, [r0]
	add r1, r6, #0
	mov r0, #0
	add r1, #0xa4
	str r0, [r1]
	add r1, r6, #0
	add r1, #0xa8
	str r0, [r1]
	add r1, r6, #0
	add r1, #0x97
	ldrb r3, [r1]
	add r4, sp, #8
	mov r1, #1
	bic r3, r1
	ldrb r2, [r4, #0x14]
	mov r1, #1
	and r1, r2
	add r2, r3, #0
	orr r2, r1
	add r1, r6, #0
	add r1, #0x97
	strb r2, [r1]
	add r1, r6, #0
	ldrb r2, [r4, #0x10]
	add r1, #0x96
	mov r3, #0x40
	strb r2, [r1]
	add r1, r6, #0
	add r1, #0x97
	ldrb r1, [r1]
	bic r1, r3
	add r3, r6, #0
	add r3, #0x97
	strb r1, [r3]
	add r1, r6, #0
	add r1, #0x97
	ldrb r1, [r1]
	mov r3, #0x80
	bic r1, r3
	add r3, r6, #0
	add r3, #0x97
	strb r1, [r3]
	add r1, r6, #0
	add r1, #0x98
	strb r5, [r1]
	add r1, r6, #0
	add r1, #0x99
	strb r7, [r1]
	add r1, r6, #0
	add r1, #0x9b
	strb r0, [r1]
	ldr r1, [sp, #0x28]
	mov r3, #3
	str r1, [r6, #0x18]
	add r1, r6, #0
	add r1, #0x94
	strb r3, [r1]
	mov r1, #0xb7
	lsl r1, r1, #2
	strh r2, [r6, r1]
	add r2, r6, #0
	add r3, r0, #0
_021EDBCC:
	add r1, r2, #0
	add r1, #0xbc
	str r3, [r1]
	add r1, r2, #0
	add r1, #0xc0
	add r0, r0, #1
	add r2, #8
	str r3, [r1]
	cmp r0, #0x1c
	blt _021EDBCC
	mov r7, #0xa9
	add r1, r6, #0
	add r2, r6, #0
	mov r5, #0
	mov r0, #0xff
	lsl r7, r7, #2
_021EDBEC:
	mov r4, #0x71
	lsl r4, r4, #2
	str r5, [r1, r4]
	add r4, r4, #4
	str r5, [r1, r4]
	strh r0, [r2, r7]
	add r3, r3, #1
	add r1, #8
	add r2, r2, #2
	cmp r3, #0x1c
	blt _021EDBEC
	add r4, r6, #0
	mov r7, #0x50
_021EDC06:
	add r0, r7, #0
	mov r1, #4
	bl String_ctor
	str r0, [r4, #0x1c]
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, #0x1c
	blt _021EDC06
	add r6, #0xa0
	ldr r1, _021EDC24 ; =0x0000EEEE
	ldr r0, [r6]
	strh r1, [r0]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021EDC24: .word 0x0000EEEE
	thumb_func_end ov01_021EDAFC

	thumb_func_start ov01_021EDC28
ov01_021EDC28: ; 0x021EDC28
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r7, r1, #0
	mov r1, #0x2e
	add r6, r0, #0
	mov r0, #4
	lsl r1, r1, #4
	str r2, [sp, #0x18]
	add r5, r3, #0
	bl AllocFromHeap
	add r4, r0, #0
	bne _021EDC48
	add sp, #0x1c
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_021EDC48:
	mov r2, #0x2e
	mov r1, #0
	lsl r2, r2, #4
	bl memset
	str r5, [sp]
	add r0, sp, #0x20
	ldrb r0, [r0, #0x10]
	add r1, r4, #0
	add r2, r7, #0
	str r0, [sp, #4]
	ldr r0, [sp, #0x34]
	str r0, [sp, #8]
	ldr r0, [sp, #0x38]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x3c]
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x40]
	str r0, [sp, #0x14]
	ldr r3, [sp, #0x18]
	add r0, r6, #0
	bl ov01_021EDAFC
	add r0, r4, #0
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov01_021EDC28

	thumb_func_start ov01_021EDC7C
ov01_021EDC7C: ; 0x021EDC7C
	ldr r3, _021EDC80 ; =ov01_021EDD68
	bx r3
	.balign 4, 0
_021EDC80: .word ov01_021EDD68
	thumb_func_end ov01_021EDC7C

	thumb_func_start ov01_021EDC84
ov01_021EDC84: ; 0x021EDC84
	push {r3, r4, lr}
	sub sp, #0x14
	add r4, r0, #0
	bl ov01_021EDDD8
	mov r1, #7
	tst r1, r0
	bne _021EDC98
	lsr r0, r0, #3
	b _021EDC9C
_021EDC98:
	lsr r0, r0, #3
	add r0, r0, #1
_021EDC9C:
	add r1, r4, #0
	add r1, #0x97
	ldrb r1, [r1]
	lsl r1, r1, #0x19
	lsr r1, r1, #0x1f
	beq _021EDCB6
	add r1, r4, #0
	add r1, #0x98
	ldrb r1, [r1]
	sub r2, r1, r0
	add r1, r4, #0
	add r1, #0x98
	strb r2, [r1]
_021EDCB6:
	add r1, r4, #0
	add r1, #0x97
	ldrb r1, [r1]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x1f
	beq _021EDCD8
	add r1, r4, #0
	add r1, #0x99
	ldrb r2, [r1]
	add r1, r4, #0
	add r1, #0x9b
	ldrb r1, [r1]
	lsl r1, r1, #1
	sub r2, r2, r1
	add r1, r4, #0
	add r1, #0x99
	strb r2, [r1]
_021EDCD8:
	add r1, r4, #0
	add r1, #0x99
	ldrb r1, [r1]
	lsl r0, r0, #0x18
	add r3, r4, #0
	str r1, [sp]
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0x9b
	ldrb r0, [r0]
	add r1, r4, #0
	add r3, #0x98
	lsl r0, r0, #0x19
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	mov r0, #0x3d
	str r0, [sp, #0x10]
	ldr r0, [r4]
	ldrb r3, [r3]
	ldr r0, [r0, #8]
	add r1, #8
	mov r2, #3
	bl AddWindowParameterized
	mov r0, #0
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, [r4]
	ldr r2, _021EDD60 ; =0x000003D9
	ldr r0, [r0, #8]
	mov r1, #3
	mov r3, #0xb
	bl LoadUserFrameGfx1
	add r0, r4, #0
	ldr r2, _021EDD60 ; =0x000003D9
	add r0, #8
	mov r1, #1
	mov r3, #0xb
	bl DrawFrameAndWindow1
	add r0, r4, #0
	bl ov01_021EDE18
	add r1, r4, #0
	add r1, #0x96
	add r0, r4, #0
	ldrb r1, [r1]
	add r0, #0xac
	mov r2, #4
	bl Create2dMenu
	add r1, r4, #0
	add r1, #0xb8
	str r0, [r1]
	ldr r0, _021EDD64 ; =ov01_021EDE8C
	add r1, r4, #0
	mov r2, #0
	bl CreateSysTask
	str r0, [r4, #4]
	add sp, #0x14
	pop {r3, r4, pc}
	nop
_021EDD60: .word 0x000003D9
_021EDD64: .word ov01_021EDE8C
	thumb_func_end ov01_021EDC84

	thumb_func_start ov01_021EDD68
ov01_021EDD68: ; 0x021EDD68
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r7, r1, #0
	mov r0, #0x50
	mov r1, #4
	add r6, r2, #0
	bl String_ctor
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x8c
	ldr r0, [r0]
	add r1, r7, #0
	add r2, r4, #0
	bl ReadMsgDataIntoString
	add r1, r5, #0
	add r1, #0x9b
	ldrb r1, [r1]
	add r0, r5, #0
	add r0, #0x90
	lsl r1, r1, #2
	add r1, r5, r1
	ldr r0, [r0]
	ldr r1, [r1, #0x1c]
	add r2, r4, #0
	bl StringExpandPlaceholders
	add r0, r5, #0
	add r0, #0x9b
	ldrb r2, [r0]
	lsl r0, r2, #2
	add r0, r5, r0
	ldr r1, [r0, #0x1c]
	lsl r0, r2, #3
	add r0, r5, r0
	add r0, #0xbc
	str r1, [r0]
	add r0, r4, #0
	bl String_dtor
	add r0, r5, #0
	add r0, #0x9b
	ldrb r0, [r0]
	lsl r0, r0, #3
	add r0, r5, r0
	add r0, #0xc0
	str r6, [r0]
	add r0, r5, #0
	add r0, #0x9b
	ldrb r0, [r0]
	add r5, #0x9b
	add r0, r0, #1
	strb r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_021EDD68

	thumb_func_start ov01_021EDDD8
ov01_021EDDD8: ; 0x021EDDD8
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r0, #0x9b
	ldrb r0, [r0]
	mov r6, #0
	add r4, r6, #0
	cmp r0, #0
	ble _021EDE10
	add r5, r7, #0
_021EDDEA:
	add r0, r5, #0
	add r0, #0xbc
	ldr r1, [r0]
	cmp r1, #0
	beq _021EDE10
	mov r0, #0
	add r2, r0, #0
	bl FontID_String_GetWidth
	cmp r6, r0
	bhs _021EDE02
	add r6, r0, #0
_021EDE02:
	add r0, r7, #0
	add r0, #0x9b
	ldrb r0, [r0]
	add r4, r4, #1
	add r5, #8
	cmp r4, r0
	blt _021EDDEA
_021EDE10:
	add r6, #0xc
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_021EDDD8

	thumb_func_start ov01_021EDE18
ov01_021EDE18: ; 0x021EDE18
	add r2, r0, #0
	add r1, r0, #0
	add r2, #0xbc
	add r1, #0xac
	str r2, [r1]
	add r2, r0, #0
	add r1, r0, #0
	add r2, #8
	add r1, #0xb0
	str r2, [r1]
	add r1, r0, #0
	mov r2, #0
	add r1, #0xb4
	strb r2, [r1]
	add r1, r0, #0
	mov r2, #1
	add r1, #0xb5
	strb r2, [r1]
	add r1, r0, #0
	add r1, #0x9b
	ldrb r2, [r1]
	add r1, r0, #0
	add r1, #0xb6
	strb r2, [r1]
	add r2, r0, #0
	add r2, #0xb7
	ldrb r3, [r2]
	mov r2, #0xf
	add r1, r0, #0
	bic r3, r2
	add r2, r0, #0
	add r2, #0xb7
	strb r3, [r2]
	add r2, r0, #0
	add r2, #0xb7
	ldrb r3, [r2]
	mov r2, #0x30
	add r1, #0xb7
	bic r3, r2
	add r2, r0, #0
	add r2, #0xb7
	strb r3, [r2]
	add r0, #0x9b
	ldrb r0, [r0]
	ldrb r2, [r1]
	cmp r0, #4
	blo _021EDE82
	mov r0, #0xc0
	bic r2, r0
	mov r0, #0x40
	orr r0, r2
	strb r0, [r1]
	bx lr
_021EDE82:
	mov r0, #0xc0
	bic r2, r0
	strb r2, [r1]
	bx lr
	.balign 4, 0
	thumb_func_end ov01_021EDE18

	thumb_func_start ov01_021EDE8C
ov01_021EDE8C: ; 0x021EDE8C
	push {r4, lr}
	add r4, r1, #0
	add r0, r4, #0
	add r0, #0x94
	ldrb r0, [r0]
	cmp r0, #0
	beq _021EDEA8
	add r0, r4, #0
	add r0, #0x94
	ldrb r0, [r0]
	add r4, #0x94
	sub r0, r0, #1
	strb r0, [r4]
	pop {r4, pc}
_021EDEA8:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021EDEF8
	add r0, r4, #0
	add r0, #0xb8
	ldr r0, [r0]
	bl Handle2dMenuInput
	mov r1, #1
	mvn r1, r1
	cmp r0, r1
	beq _021EDECA
	add r1, r1, #1
	cmp r0, r1
	beq _021EDEF8
	b _021EDEEA
_021EDECA:
	add r0, r4, #0
	add r0, #0x97
	ldrb r0, [r0]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _021EDEF8
	add r0, r4, #0
	add r0, #0xa0
	ldr r1, _021EDEFC ; =0x0000FFFE
	ldr r0, [r0]
	strh r1, [r0]
	add r0, r4, #0
	bl ov01_021EDF38
	pop {r4, pc}
_021EDEEA:
	add r1, r4, #0
	add r1, #0xa0
	ldr r1, [r1]
	strh r0, [r1]
	add r0, r4, #0
	bl ov01_021EDF38
_021EDEF8:
	pop {r4, pc}
	nop
_021EDEFC: .word 0x0000FFFE
	thumb_func_end ov01_021EDE8C

	thumb_func_start ov01_021EDF00
ov01_021EDF00: ; 0x021EDF00
	push {r4, r5, r6, lr}
	add r6, r0, #0
	mov r4, #0
	add r5, r6, #0
_021EDF08:
	ldr r0, [r5, #0x1c]
	bl String_dtor
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0x1c
	blt _021EDF08
	add r0, r6, #0
	add r0, #0x97
	ldrb r0, [r0]
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _021EDF2E
	add r0, r6, #0
	add r0, #0x8c
	ldr r0, [r0]
	bl DestroyMsgData
_021EDF2E:
	add r0, r6, #0
	bl FreeToHeap
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov01_021EDF00

	thumb_func_start ov01_021EDF38
ov01_021EDF38: ; 0x021EDF38
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021EDF74 ; =SEQ_SE_DP_SELECT
	bl PlaySE
	add r0, r4, #0
	add r0, #0xb8
	ldr r0, [r0]
	mov r1, #0
	bl Delete2dMenu
	add r0, r4, #0
	add r0, #0xb0
	ldr r0, [r0]
	mov r1, #0
	bl sub_0200E5D4
	add r0, r4, #0
	add r0, #0xb0
	ldr r0, [r0]
	bl RemoveWindow
	ldr r0, [r4, #4]
	bl DestroySysTask
	add r0, r4, #0
	bl ov01_021EDF00
	pop {r4, pc}
	nop
_021EDF74: .word SEQ_SE_DP_SELECT
	thumb_func_end ov01_021EDF38

	thumb_func_start ov01_021EDF78
ov01_021EDF78: ; 0x021EDF78
	push {r3, r4, lr}
	sub sp, #0x14
	add r4, sp, #0x10
	ldrb r4, [r4, #0x10]
	str r4, [sp]
	ldr r4, [sp, #0x24]
	str r4, [sp, #4]
	ldr r4, [sp, #0x28]
	str r4, [sp, #8]
	ldr r4, [sp, #0x2c]
	str r4, [sp, #0xc]
	ldr r4, [sp, #0x30]
	str r4, [sp, #0x10]
	bl ov01_021EDC28
	add sp, #0x14
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021EDF78

	thumb_func_start MoveTutorMenu_SetListItem
MoveTutorMenu_SetListItem: ; 0x021EDF9C
	push {r3, lr}
	bl MoveTutorMenu_SetListItem_Internal
	pop {r3, pc}
	thumb_func_end MoveTutorMenu_SetListItem

	thumb_func_start ov01_021EDFA4
ov01_021EDFA4: ; 0x021EDFA4
	push {r4, lr}
	add r4, r0, #0
	bl ov01_021EE2E4
	mov r1, #7
	tst r1, r0
	bne _021EDFB6
	lsr r1, r0, #3
	b _021EDFBA
_021EDFB6:
	lsr r0, r0, #3
	add r1, r0, #1
_021EDFBA:
	add r0, r4, #0
	add r0, #0x97
	ldrb r0, [r0]
	lsl r0, r0, #0x19
	lsr r0, r0, #0x1f
	beq _021EDFD4
	add r0, r4, #0
	add r0, #0x98
	ldrb r0, [r0]
	sub r2, r0, r1
	add r0, r4, #0
	add r0, #0x98
	strb r2, [r0]
_021EDFD4:
	add r0, r4, #0
	add r0, #0x97
	ldrb r0, [r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1f
	beq _021EE00A
	add r0, r4, #0
	add r0, #0x9b
	ldrb r3, [r0]
	cmp r3, #8
	bls _021EDFFA
	add r0, r4, #0
	add r0, #0x99
	ldrb r2, [r0]
	add r0, r4, #0
	add r0, #0x99
	sub r2, #0x10
	strb r2, [r0]
	b _021EE00A
_021EDFFA:
	add r0, r4, #0
	add r0, #0x99
	ldrb r2, [r0]
	lsl r0, r3, #1
	sub r2, r2, r0
	add r0, r4, #0
	add r0, #0x99
	strb r2, [r0]
_021EE00A:
	add r0, r4, #0
	bl ov01_021EE01C
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021EDFA4

	thumb_func_start ov01_021EE014
ov01_021EE014: ; 0x021EE014
	ldr r3, _021EE018 ; =ov01_021EE01C
	bx r3
	.balign 4, 0
_021EE018: .word ov01_021EE01C
	thumb_func_end ov01_021EE014

	thumb_func_start ov01_021EE01C
ov01_021EE01C: ; 0x021EE01C
	push {r3, r4, lr}
	sub sp, #0x14
	add r4, r0, #0
	add r0, #0x9b
	ldrb r2, [r0]
	cmp r2, #8
	bls _021EE05A
	add r0, r4, #0
	add r0, #0x99
	ldrb r0, [r0]
	add r3, r4, #0
	add r3, #0x98
	str r0, [sp]
	lsl r0, r1, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	mov r0, #0x10
	str r0, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	mov r0, #0x3d
	str r0, [sp, #0x10]
	ldr r0, [r4]
	add r1, r4, #0
	ldrb r3, [r3]
	ldr r0, [r0, #8]
	add r1, #8
	mov r2, #3
	bl AddWindowParameterized
	b _021EE08A
_021EE05A:
	add r0, r4, #0
	add r0, #0x99
	ldrb r0, [r0]
	add r3, r4, #0
	add r3, #0x98
	str r0, [sp]
	lsl r0, r1, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	lsl r0, r2, #0x19
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	mov r0, #0x3d
	str r0, [sp, #0x10]
	ldr r0, [r4]
	add r1, r4, #0
	ldrb r3, [r3]
	ldr r0, [r0, #8]
	add r1, #8
	mov r2, #3
	bl AddWindowParameterized
_021EE08A:
	mov r0, #0
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, [r4]
	ldr r2, _021EE0E4 ; =0x000003D9
	ldr r0, [r0, #8]
	mov r1, #3
	mov r3, #0xb
	bl LoadUserFrameGfx1
	add r0, r4, #0
	ldr r2, _021EE0E4 ; =0x000003D9
	add r0, #8
	mov r1, #1
	mov r3, #0xb
	bl DrawFrameAndWindow1
	add r0, r4, #0
	bl ov01_021EE324
	add r2, r4, #0
	add r2, #0x96
	mov r0, #0x67
	lsl r0, r0, #2
	ldrb r2, [r2]
	add r0, r4, r0
	mov r1, #0
	mov r3, #4
	bl ListMenuInit
	mov r1, #0x6f
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r0, r4, #0
	bl ov01_021EE634
	ldr r0, _021EE0E8 ; =ov01_021EE49C
	add r1, r4, #0
	mov r2, #0
	bl CreateSysTask
	str r0, [r4, #4]
	add sp, #0x14
	pop {r3, r4, pc}
	.balign 4, 0
_021EE0E4: .word 0x000003D9
_021EE0E8: .word ov01_021EE49C
	thumb_func_end ov01_021EE01C

	thumb_func_start ov01_021EE0EC
ov01_021EE0EC: ; 0x021EE0EC
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	bl ov01_021EE2E4
	mov r1, #7
	tst r1, r0
	bne _021EE104
	lsr r1, r0, #3
	b _021EE108
_021EE104:
	lsr r0, r0, #3
	add r1, r0, #1
_021EE108:
	add r0, r5, #0
	add r0, #0x97
	ldrb r0, [r0]
	lsl r0, r0, #0x19
	lsr r0, r0, #0x1f
	beq _021EE122
	add r0, r5, #0
	add r0, #0x98
	ldrb r0, [r0]
	sub r2, r0, r1
	add r0, r5, #0
	add r0, #0x98
	strb r2, [r0]
_021EE122:
	add r0, r5, #0
	add r0, #0x97
	ldrb r0, [r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1f
	beq _021EE158
	add r0, r5, #0
	add r0, #0x9b
	ldrb r3, [r0]
	cmp r3, #8
	bls _021EE148
	add r0, r5, #0
	add r0, #0x99
	ldrb r2, [r0]
	add r0, r5, #0
	add r0, #0x99
	sub r2, #0x10
	strb r2, [r0]
	b _021EE158
_021EE148:
	add r0, r5, #0
	add r0, #0x99
	ldrb r2, [r0]
	lsl r0, r3, #1
	sub r2, r2, r0
	add r0, r5, #0
	add r0, #0x99
	strb r2, [r0]
_021EE158:
	add r0, r5, #0
	add r0, #0x9b
	ldrb r0, [r0]
	cmp r0, #8
	bls _021EE192
	add r0, r5, #0
	add r0, #0x99
	ldrb r0, [r0]
	add r3, r5, #0
	add r3, #0x98
	str r0, [sp]
	lsl r0, r1, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	mov r0, #0x10
	str r0, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	mov r0, #0x3d
	str r0, [sp, #0x10]
	ldr r0, [r5]
	add r1, r5, #0
	ldrb r3, [r3]
	ldr r0, [r0, #8]
	add r1, #8
	mov r2, #3
	bl AddWindowParameterized
	b _021EE1C2
_021EE192:
	add r2, r5, #0
	add r2, #0x99
	ldrb r2, [r2]
	lsl r1, r1, #0x18
	lsl r0, r0, #0x19
	str r2, [sp]
	lsr r1, r1, #0x18
	str r1, [sp, #4]
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	mov r0, #0x3d
	add r3, r5, #0
	str r0, [sp, #0x10]
	ldr r0, [r5]
	add r3, #0x98
	add r1, r5, #0
	ldrb r3, [r3]
	ldr r0, [r0, #8]
	add r1, #8
	mov r2, #3
	bl AddWindowParameterized
_021EE1C2:
	mov r0, #0
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, [r5]
	ldr r2, _021EE23C ; =0x000003D9
	ldr r0, [r0, #8]
	mov r1, #3
	mov r3, #0xb
	bl LoadUserFrameGfx1
	add r0, r5, #0
	ldr r2, _021EE23C ; =0x000003D9
	add r0, #8
	mov r1, #1
	mov r3, #0xb
	bl DrawFrameAndWindow1
	add r0, r5, #0
	bl ov01_021EE324
	add r0, r5, #0
	add r0, #0xa4
	str r4, [r0]
	add r0, r5, #0
	add r0, #0xa8
	str r6, [r0]
	add r0, r5, #0
	add r0, #0xa4
	ldr r0, [r0]
	mov r3, #4
	ldrh r1, [r0]
	add r0, r5, #0
	add r0, #0xa8
	ldr r0, [r0]
	ldrh r0, [r0]
	add r1, r1, r0
	mov r0, #0xb7
	lsl r0, r0, #2
	strh r1, [r5, r0]
	mov r0, #0x67
	lsl r0, r0, #2
	ldrh r1, [r4]
	ldrh r2, [r6]
	add r0, r5, r0
	bl ListMenuInit
	mov r1, #0x6f
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r5, #0
	bl ov01_021EE634
	ldr r0, _021EE240 ; =ov01_021EE49C
	add r1, r5, #0
	mov r2, #0
	bl CreateSysTask
	str r0, [r5, #4]
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_021EE23C: .word 0x000003D9
_021EE240: .word ov01_021EE49C
	thumb_func_end ov01_021EE0EC

	thumb_func_start MoveTutorMenu_SetListItem_Internal
MoveTutorMenu_SetListItem_Internal: ; 0x021EE244
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	str r1, [sp]
	mov r0, #0x50
	mov r1, #4
	add r7, r2, #0
	add r4, r3, #0
	bl String_ctor
	add r6, r0, #0
	add r0, r5, #0
	add r0, #0x8c
	ldr r0, [r0]
	ldr r1, [sp]
	add r2, r6, #0
	bl ReadMsgDataIntoString
	add r1, r5, #0
	add r1, #0x9b
	ldrb r1, [r1]
	add r0, r5, #0
	add r0, #0x90
	lsl r1, r1, #2
	add r1, r5, r1
	ldr r0, [r0]
	ldr r1, [r1, #0x1c]
	add r2, r6, #0
	bl StringExpandPlaceholders
	add r0, r5, #0
	add r0, #0x9b
	ldrb r1, [r0]
	lsl r0, r1, #2
	add r0, r5, r0
	lsl r1, r1, #3
	add r2, r5, r1
	mov r1, #0x71
	ldr r0, [r0, #0x1c]
	lsl r1, r1, #2
	str r0, [r2, r1]
	add r0, r6, #0
	bl String_dtor
	cmp r4, #0xfa
	bne _021EE2B4
	add r0, r5, #0
	add r0, #0x9b
	ldrb r0, [r0]
	mov r2, #2
	mvn r2, r2
	lsl r0, r0, #3
	add r1, r5, r0
	mov r0, #0x72
	lsl r0, r0, #2
	str r2, [r1, r0]
	b _021EE2C4
_021EE2B4:
	add r0, r5, #0
	add r0, #0x9b
	ldrb r0, [r0]
	lsl r0, r0, #3
	add r1, r5, r0
	mov r0, #0x72
	lsl r0, r0, #2
	str r4, [r1, r0]
_021EE2C4:
	add r0, r5, #0
	add r0, #0x9b
	ldrb r0, [r0]
	lsl r0, r0, #1
	add r1, r5, r0
	mov r0, #0xa9
	lsl r0, r0, #2
	strh r7, [r1, r0]
	add r0, r5, #0
	add r0, #0x9b
	ldrb r0, [r0]
	add r5, #0x9b
	add r0, r0, #1
	strb r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end MoveTutorMenu_SetListItem_Internal

	thumb_func_start ov01_021EE2E4
ov01_021EE2E4: ; 0x021EE2E4
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r0, #0x9b
	ldrb r0, [r0]
	mov r6, #0
	add r4, r6, #0
	cmp r0, #0
	ble _021EE31C
	add r5, r7, #0
_021EE2F6:
	mov r0, #0x71
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	cmp r1, #0
	beq _021EE31C
	mov r0, #0
	add r2, r0, #0
	bl FontID_String_GetWidth
	cmp r6, r0
	bhs _021EE30E
	add r6, r0, #0
_021EE30E:
	add r0, r7, #0
	add r0, #0x9b
	ldrb r0, [r0]
	add r4, r4, #1
	add r5, #8
	cmp r4, r0
	blt _021EE2F6
_021EE31C:
	add r6, #0xc
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_021EE2E4

	thumb_func_start ov01_021EE324
ov01_021EE324: ; 0x021EE324
	push {r4, r5}
	mov r3, #0x71
	lsl r3, r3, #2
	add r1, r3, #0
	add r2, r0, r3
	sub r1, #0x28
	str r2, [r0, r1]
	add r1, r3, #0
	ldr r2, _021EE420 ; =ov01_021EE458
	sub r1, #0x24
	str r2, [r0, r1]
	add r1, r3, #0
	ldr r2, _021EE424 ; =ov01_021EE434
	sub r1, #0x20
	str r2, [r0, r1]
	add r2, r0, #0
	add r1, r3, #0
	add r2, #8
	sub r1, #0x1c
	str r2, [r0, r1]
	add r1, r0, #0
	add r1, #0x9b
	ldrb r2, [r1]
	add r1, r3, #0
	sub r1, #0x18
	strh r2, [r0, r1]
	add r1, r3, #0
	mov r2, #8
	sub r1, #0x16
	strh r2, [r0, r1]
	add r1, r3, #0
	mov r2, #1
	sub r1, #0x14
	strb r2, [r0, r1]
	add r1, r3, #0
	mov r4, #0xc
	sub r1, #0x13
	strb r4, [r0, r1]
	add r1, r3, #0
	mov r4, #2
	sub r1, #0x12
	strb r4, [r0, r1]
	add r1, r3, #0
	sub r1, #0x11
	ldrb r4, [r0, r1]
	mov r1, #0xf
	bic r4, r1
	orr r4, r2
	add r2, r3, #0
	sub r2, #0x11
	strb r4, [r0, r2]
	add r2, r3, #0
	sub r2, #0x11
	ldrb r5, [r0, r2]
	mov r2, #0xf0
	mov r4, #0x10
	bic r5, r2
	orr r5, r4
	add r4, r3, #0
	sub r4, #0x11
	strb r5, [r0, r4]
	add r4, r3, #0
	sub r4, #0x10
	ldrb r4, [r0, r4]
	bic r4, r1
	mov r1, #0xf
	orr r4, r1
	add r1, r3, #0
	sub r1, #0x10
	strb r4, [r0, r1]
	add r1, r3, #0
	sub r1, #0x10
	ldrb r4, [r0, r1]
	mov r1, #0x20
	bic r4, r2
	add r2, r4, #0
	orr r2, r1
	add r1, r3, #0
	sub r1, #0x10
	strb r2, [r0, r1]
	add r1, r3, #0
	sub r1, #0xe
	ldrh r2, [r0, r1]
	mov r1, #7
	bic r2, r1
	add r1, r3, #0
	sub r1, #0xe
	strh r2, [r0, r1]
	add r1, r3, #0
	sub r1, #0xe
	ldrh r2, [r0, r1]
	mov r1, #0x78
	bic r2, r1
	add r1, r3, #0
	sub r1, #0xe
	strh r2, [r0, r1]
	add r1, r3, #0
	sub r1, #0xe
	ldrh r2, [r0, r1]
	ldr r1, _021EE428 ; =0xFFFFFE7F
	and r2, r1
	mov r1, #0x80
	orr r2, r1
	add r1, r3, #0
	sub r1, #0xe
	strh r2, [r0, r1]
	add r1, r3, #0
	sub r1, #0xe
	ldrh r2, [r0, r1]
	ldr r1, _021EE42C ; =0xFFFF81FF
	and r2, r1
	add r1, r3, #0
	sub r1, #0xe
	strh r2, [r0, r1]
	add r1, r3, #0
	sub r1, #0xe
	ldrh r2, [r0, r1]
	ldr r1, _021EE430 ; =0xFFFF7FFF
	and r2, r1
	add r1, r3, #0
	sub r1, #0xe
	strh r2, [r0, r1]
	sub r3, #0xc
	str r0, [r0, r3]
	pop {r4, r5}
	bx lr
	.balign 4, 0
_021EE420: .word ov01_021EE458
_021EE424: .word ov01_021EE434
_021EE428: .word 0xFFFFFE7F
_021EE42C: .word 0xFFFF81FF
_021EE430: .word 0xFFFF7FFF
	thumb_func_end ov01_021EE324

	thumb_func_start ov01_021EE434
ov01_021EE434: ; 0x021EE434
	push {r3, lr}
	mov r2, #2
	mvn r2, r2
	cmp r1, r2
	bne _021EE44A
	mov r1, #3
	mov r2, #0xf
	mov r3, #4
	bl ListMenuOverrideSetColors
	pop {r3, pc}
_021EE44A:
	mov r1, #1
	mov r2, #0xf
	mov r3, #2
	bl ListMenuOverrideSetColors
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov01_021EE434

	thumb_func_start ov01_021EE458
ov01_021EE458: ; 0x021EE458
	push {r3, r4, r5, lr}
	mov r2, #0
	add r1, sp, #0
	strh r2, [r1, #2]
	strh r2, [r1]
	mov r1, #0x13
	add r5, r0, #0
	bl ListMenuGetTemplateField
	add r1, sp, #0
	add r4, r0, #0
	add r0, r5, #0
	add r1, #2
	add r2, sp, #0
	bl ListMenuGetScrollAndRow
	add r0, r4, #0
	add r0, #0xa4
	ldr r2, [r0]
	cmp r2, #0
	beq _021EE49A
	add r0, r4, #0
	add r0, #0xa8
	ldr r0, [r0]
	cmp r0, #0
	beq _021EE49A
	add r0, sp, #0
	ldrh r1, [r0, #2]
	add r4, #0xa8
	strh r1, [r2]
	ldrh r1, [r0]
	ldr r0, [r4]
	strh r1, [r0]
_021EE49A:
	pop {r3, r4, r5, pc}
	thumb_func_end ov01_021EE458

	thumb_func_start ov01_021EE49C
ov01_021EE49C: ; 0x021EE49C
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r0, r5, #0
	add r0, #0x94
	ldrb r0, [r0]
	cmp r0, #0
	beq _021EE4B8
	add r0, r5, #0
	add r0, #0x94
	ldrb r0, [r0]
	add r5, #0x94
	sub r0, r0, #1
	strb r0, [r5]
	pop {r4, r5, r6, pc}
_021EE4B8:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021EE55A
	mov r0, #0x6f
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl ListMenu_ProcessInput
	add r4, r0, #0
	mov r0, #0x6f
	mov r1, #0xb7
	lsl r0, r0, #2
	lsl r1, r1, #2
	ldrh r6, [r5, r1]
	ldr r0, [r5, r0]
	add r1, r5, r1
	bl ListMenuGetCurrentItemArrayId
	mov r0, #0xb7
	lsl r0, r0, #2
	ldrh r0, [r5, r0]
	cmp r6, r0
	beq _021EE4EE
	ldr r0, _021EE55C ; =SEQ_SE_DP_SELECT
	bl PlaySE
_021EE4EE:
	ldr r0, _021EE560 ; =gSystem
	mov r1, #0x40
	ldr r0, [r0, #0x4c]
	tst r1, r0
	bne _021EE50A
	mov r1, #0x80
	tst r1, r0
	bne _021EE50A
	mov r1, #0x20
	tst r1, r0
	bne _021EE50A
	mov r1, #0x10
	tst r0, r1
	beq _021EE510
_021EE50A:
	add r0, r5, #0
	bl ov01_021EE634
_021EE510:
	mov r0, #1
	mvn r0, r0
	cmp r4, r0
	beq _021EE520
	add r0, r0, #1
	cmp r4, r0
	beq _021EE55A
	b _021EE546
_021EE520:
	add r0, r5, #0
	add r0, #0x97
	ldrb r0, [r0]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _021EE55A
	ldr r0, _021EE55C ; =SEQ_SE_DP_SELECT
	bl PlaySE
	add r0, r5, #0
	add r0, #0xa0
	ldr r1, _021EE564 ; =0x0000FFFE
	ldr r0, [r0]
	strh r1, [r0]
	add r0, r5, #0
	bl ov01_021EE568
	pop {r4, r5, r6, pc}
_021EE546:
	ldr r0, _021EE55C ; =SEQ_SE_DP_SELECT
	bl PlaySE
	add r0, r5, #0
	add r0, #0xa0
	ldr r0, [r0]
	strh r4, [r0]
	add r0, r5, #0
	bl ov01_021EE568
_021EE55A:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021EE55C: .word SEQ_SE_DP_SELECT
_021EE560: .word gSystem
_021EE564: .word 0x0000FFFE
	thumb_func_end ov01_021EE49C

	thumb_func_start ov01_021EE568
ov01_021EE568: ; 0x021EE568
	push {r4, r5, r6, lr}
	add r6, r0, #0
	ldr r0, _021EE5CC ; =SEQ_SE_DP_SELECT
	bl PlaySE
	mov r0, #0x6f
	lsl r0, r0, #2
	mov r1, #0
	ldr r0, [r6, r0]
	add r2, r1, #0
	bl DestroyListMenu
	mov r0, #0x6a
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	mov r1, #0
	bl sub_0200E5D4
	add r0, r6, #0
	add r0, #8
	bl RemoveWindow
	mov r4, #0
	add r5, r6, #0
_021EE598:
	ldr r0, [r5, #0x1c]
	bl String_dtor
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0x1c
	blt _021EE598
	add r0, r6, #0
	add r0, #0x97
	ldrb r0, [r0]
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _021EE5BE
	add r0, r6, #0
	add r0, #0x8c
	ldr r0, [r0]
	bl DestroyMsgData
_021EE5BE:
	ldr r0, [r6, #4]
	bl DestroySysTask
	add r0, r6, #0
	bl FreeToHeap
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021EE5CC: .word SEQ_SE_DP_SELECT
	thumb_func_end ov01_021EE568

	thumb_func_start ov01_021EE5D0
ov01_021EE5D0: ; 0x021EE5D0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	str r1, [sp, #0xc]
	mov r0, #0x5a
	mov r1, #4
	add r7, r2, #0
	bl String_ctor
	add r4, r0, #0
	mov r0, #0x5a
	mov r1, #4
	bl String_ctor
	add r6, r0, #0
	ldr r0, [r5, #0x18]
	mov r1, #0xf
	bl FillWindowPixelBuffer
	add r0, r5, #0
	add r0, #0x8c
	ldr r0, [r0]
	ldr r1, [sp, #0xc]
	add r2, r4, #0
	bl ReadMsgDataIntoString
	add r0, r5, #0
	add r0, #0x90
	ldr r0, [r0]
	add r1, r6, #0
	add r2, r4, #0
	bl StringExpandPlaceholders
	mov r3, #0
	str r3, [sp]
	str r7, [sp, #4]
	str r3, [sp, #8]
	ldr r0, [r5, #0x18]
	mov r1, #1
	add r2, r6, #0
	bl AddTextPrinterParameterized
	add r0, r4, #0
	bl String_dtor
	add r0, r6, #0
	bl String_dtor
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov01_021EE5D0

	thumb_func_start ov01_021EE634
ov01_021EE634: ; 0x021EE634
	push {r4, lr}
	mov r1, #0x6f
	add r4, r0, #0
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	add r1, r1, #6
	add r1, r4, r1
	bl ListMenuGetCurrentItemArrayId
	ldr r0, _021EE660 ; =0x000001C2
	ldrh r1, [r4, r0]
	add r0, #0xe2
	lsl r1, r1, #1
	add r1, r4, r1
	ldrh r1, [r1, r0]
	cmp r1, #0xff
	beq _021EE65E
	add r0, r4, #0
	mov r2, #0
	bl ov01_021EE5D0
_021EE65E:
	pop {r4, pc}
	.balign 4, 0
_021EE660: .word 0x000001C2
	thumb_func_end ov01_021EE634

	thumb_func_start PrintCurFloorInNewWindow
PrintCurFloorInNewWindow: ; 0x021EE664
	push {r4, r5, r6, lr}
	sub sp, #0x18
	mov r4, #0
	str r4, [sp]
	str r3, [sp, #4]
	ldr r3, [sp, #0x28]
	add r6, r0, #0
	str r3, [sp, #8]
	str r4, [sp, #0xc]
	add r3, r4, #0
	str r4, [sp, #0x10]
	bl ov01_021EDC28
	add r5, r0, #0
	add r0, r4, #0
	add r1, r0, #0
	bl GetFontAttribute
	lsl r1, r0, #3
	mov r0, #7
	tst r0, r1
	bne _021EE694
	lsr r4, r1, #3
	b _021EE698
_021EE694:
	lsr r0, r1, #3
	add r4, r0, #1
_021EE698:
	add r0, r5, #0
	add r0, #0x99
	ldrb r0, [r0]
	add r3, r5, #0
	add r1, r5, #0
	str r0, [sp]
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	mov r0, #0xdd
	str r0, [sp, #0x10]
	ldr r0, [r5]
	add r3, #0x98
	ldrb r3, [r3]
	ldr r0, [r0, #8]
	add r1, #8
	mov r2, #3
	bl AddWindowParameterized
	mov r0, #0
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, [r5]
	ldr r2, _021EE74C ; =0x000003D9
	ldr r0, [r0, #8]
	mov r1, #3
	mov r3, #0xb
	bl LoadUserFrameGfx1
	add r0, r5, #0
	ldr r2, _021EE74C ; =0x000003D9
	add r0, #8
	mov r1, #1
	mov r3, #0xb
	bl DrawFrameAndWindow1
	lsl r0, r4, #0x13
	lsr r0, r0, #0x10
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	add r0, r5, #0
	mov r2, #0
	add r0, #8
	mov r1, #0xf
	add r3, r2, #0
	bl FillWindowPixelRect
	mov r2, #0
	add r0, r5, #0
	mov r1, #0x10
	add r3, r2, #0
	bl ov01_021EE754
	ldr r0, [r6, #0x20]
	add r1, sp, #0x18
	ldrh r1, [r1, #0x14]
	ldr r0, [r0]
	add r2, sp, #0x14
	bl ov01_021EE934
	add r1, r0, #0
	add r2, sp, #0x14
	lsl r1, r1, #0x10
	ldrb r2, [r2]
	add r0, r5, #0
	lsr r1, r1, #0x10
	mov r3, #0x10
	bl ov01_021EE754
	add r0, r5, #0
	add r1, r5, #0
	add r0, #8
	add r1, #0xb0
	str r0, [r1]
	bl CopyWindowToVram
	ldr r0, _021EE750 ; =ov01_021EE7B8
	add r1, r5, #0
	mov r2, #0
	bl CreateSysTask
	str r0, [r5, #4]
	add sp, #0x18
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021EE74C: .word 0x000003D9
_021EE750: .word ov01_021EE7B8
	thumb_func_end PrintCurFloorInNewWindow

	thumb_func_start ov01_021EE754
ov01_021EE754: ; 0x021EE754
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	str r1, [sp, #0xc]
	add r5, r0, #0
	mov r0, #0x5a
	mov r1, #4
	str r2, [sp, #0x10]
	add r7, r3, #0
	bl String_ctor
	add r4, r0, #0
	mov r0, #0x5a
	mov r1, #4
	bl String_ctor
	add r6, r0, #0
	add r0, r5, #0
	add r0, #0x8c
	ldr r0, [r0]
	ldr r1, [sp, #0xc]
	add r2, r4, #0
	bl ReadMsgDataIntoString
	add r0, r5, #0
	add r0, #0x90
	ldr r0, [r0]
	add r1, r6, #0
	add r2, r4, #0
	bl StringExpandPlaceholders
	str r7, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	mov r1, #0
	str r1, [sp, #8]
	add r5, #8
	ldr r3, [sp, #0x10]
	add r0, r5, #0
	add r2, r6, #0
	bl AddTextPrinterParameterized
	add r0, r4, #0
	bl String_dtor
	add r0, r6, #0
	bl String_dtor
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_021EE754

	thumb_func_start ov01_021EE7B8
ov01_021EE7B8: ; 0x021EE7B8
	push {r4, r5, r6, lr}
	add r6, r1, #0
	add r0, r6, #0
	add r0, #0xa0
	ldr r0, [r0]
	ldrh r1, [r0]
	ldr r0, _021EE818 ; =0x0000FFFF
	cmp r1, r0
	bne _021EE816
	add r0, r6, #0
	add r0, #0xb0
	ldr r0, [r0]
	mov r1, #0
	bl sub_0200E5D4
	add r0, r6, #0
	add r0, #0xb0
	ldr r0, [r0]
	bl RemoveWindow
	mov r4, #0
	add r5, r6, #0
_021EE7E4:
	ldr r0, [r5, #0x1c]
	bl String_dtor
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0x1c
	blt _021EE7E4
	add r0, r6, #0
	add r0, #0x97
	ldrb r0, [r0]
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _021EE80A
	add r0, r6, #0
	add r0, #0x8c
	ldr r0, [r0]
	bl DestroyMsgData
_021EE80A:
	ldr r0, [r6, #4]
	bl DestroySysTask
	add r0, r6, #0
	bl FreeToHeap
_021EE816:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021EE818: .word 0x0000FFFF
	thumb_func_end ov01_021EE7B8

	thumb_func_start MapNumToFloorNo
MapNumToFloorNo: ; 0x021EE81C
	push {r3, lr}
	ldr r1, _021EE92C ; =MAP_T07R0104
	cmp r0, r1
	bgt _021EE878
	bge _021EE906
	cmp r0, #MAP_D27R0107
	bgt _021EE860
	bge _021EE8D2
	cmp r0, #MAP_D27R0101
	bgt _021EE834
	beq _021EE8CE
	b _021EE922
_021EE834:
	add r1, r0, #0
	sub r1, #MAP_D23R0105
	cmp r1, #0xb
	bhi _021EE922
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021EE848: ; jump table
	.short _021EE8C6 - _021EE848 - 2 ; case MAP_D23R0105
	.short _021EE8CA - _021EE848 - 2 ; case MAP_D23R0106
	.short _021EE8DE - _021EE848 - 2 ; case MAP_T25R1001
	.short _021EE8E2 - _021EE848 - 2 ; case MAP_T25R1002
	.short _021EE8E6 - _021EE848 - 2 ; case MAP_T25R1003
	.short _021EE8EA - _021EE848 - 2 ; case MAP_T25R1004
	.short _021EE8EE - _021EE848 - 2 ; case MAP_T25R1005
	.short _021EE8F2 - _021EE848 - 2 ; case MAP_T25R1006
	.short _021EE922 - _021EE848 - 2 ; case MAP_T25R0501
	.short _021EE922 - _021EE848 - 2 ; case MAP_T25R0502
	.short _021EE922 - _021EE848 - 2 ; case MAP_D37R0102
	.short _021EE8F6 - _021EE848 - 2 ; case MAP_D37R0103
_021EE860:
	ldr r1, _021EE930 ; =MAP_T07R0102
	cmp r0, r1
	bgt _021EE870
	bge _021EE8FE
	sub r1, r1, #MAP_T07R0102-MAP_T07R0101
	cmp r0, r1
	beq _021EE8FA
	b _021EE922
_021EE870:
	add r1, r1, #MAP_T07R0103-MAP_T07R0102
	cmp r0, r1
	beq _021EE902
	b _021EE922
_021EE878:
	add r2, r1, #MAP_T07R0202-MAP_T07R0104
	cmp r0, r2
	bgt _021EE898
	bge _021EE916
	add r2, r1, #MAP_T07R0106-MAP_T07R0104
	cmp r0, r2
	bgt _021EE890
	bge _021EE90E
	add r1, r1, #MAP_T07R0105-MAP_T07R0104
	cmp r0, r1
	beq _021EE90A
	b _021EE922
_021EE890:
	add r1, r1, #MAP_T07R0201-MAP_T07R0104
	cmp r0, r1
	beq _021EE912
	b _021EE922
_021EE898:
	add r2, r1, #0
	add r2, #MAP_T11R0701-MAP_T07R0104
	cmp r0, r2
	bgt _021EE8BE
	add r2, r1, #0
	add r2, #MAP_T11R0701-MAP_T07R0104
	cmp r0, r2
	bge _021EE8D6
	add r2, r1, #MAP_T07R0204-MAP_T07R0104
	cmp r0, r2
	bgt _021EE922
	add r2, r1, #MAP_T07R0203-MAP_T07R0104
	cmp r0, r2
	blt _021EE922
	beq _021EE91A
	add r1, r1, #MAP_T07R0204-MAP_T07R0104
	cmp r0, r1
	beq _021EE91E
	b _021EE922
_021EE8BE:
	add r1, #MAP_T11R0702-MAP_T07R0104
	cmp r0, r1
	beq _021EE8DA
	b _021EE922
_021EE8C6:
	mov r0, #0
	pop {r3, pc}
_021EE8CA:
	mov r0, #1
	pop {r3, pc}
_021EE8CE:
	mov r0, #0
	pop {r3, pc}
_021EE8D2:
	mov r0, #1
	pop {r3, pc}
_021EE8D6:
	mov r0, #0
	pop {r3, pc}
_021EE8DA:
	mov r0, #1
	pop {r3, pc}
_021EE8DE:
	mov r0, #1
	pop {r3, pc}
_021EE8E2:
	mov r0, #2
	pop {r3, pc}
_021EE8E6:
	mov r0, #3
	pop {r3, pc}
_021EE8EA:
	mov r0, #4
	pop {r3, pc}
_021EE8EE:
	mov r0, #5
	pop {r3, pc}
_021EE8F2:
	mov r0, #6
	pop {r3, pc}
_021EE8F6:
	mov r0, #0
	pop {r3, pc}
_021EE8FA:
	mov r0, #0
	pop {r3, pc}
_021EE8FE:
	mov r0, #1
	pop {r3, pc}
_021EE902:
	mov r0, #2
	pop {r3, pc}
_021EE906:
	mov r0, #3
	pop {r3, pc}
_021EE90A:
	mov r0, #4
	pop {r3, pc}
_021EE90E:
	mov r0, #5
	pop {r3, pc}
_021EE912:
	mov r0, #0
	pop {r3, pc}
_021EE916:
	mov r0, #1
	pop {r3, pc}
_021EE91A:
	mov r0, #2
	pop {r3, pc}
_021EE91E:
	mov r0, #3
	pop {r3, pc}
_021EE922:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
	nop
_021EE92C: .word MAP_T07R0104
_021EE930: .word MAP_T07R0102
	thumb_func_end MapNumToFloorNo

	thumb_func_start ov01_021EE934
ov01_021EE934: ; 0x021EE934
	push {r3, r4}
	ldr r4, _021EE970 ; =0x000001B9
	cmp r0, r4
	beq _021EE94A
	add r3, r4, #2
	cmp r0, r3
	beq _021EE958
	add r3, r4, #3
	cmp r0, r3
	beq _021EE958
	b _021EE966
_021EE94A:
	cmp r1, #0
	bne _021EE966
	mov r0, #0x20
	strb r0, [r2]
	mov r0, #0x7a
	pop {r3, r4}
	bx lr
_021EE958:
	cmp r1, #3
	bne _021EE966
	mov r0, #0x10
	strb r0, [r2]
	mov r0, #0x7d
	pop {r3, r4}
	bx lr
_021EE966:
	mov r0, #0x20
	strb r0, [r2]
	mov r0, #0x11
	pop {r3, r4}
	bx lr
	.balign 4, 0
_021EE970: .word 0x000001B9
	thumb_func_end ov01_021EE934

	thumb_func_start ov01_021EE974
ov01_021EE974: ; 0x021EE974
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	add r6, r1, #0
	bl ov01_021EDDD8
	mov r1, #7
	tst r1, r0
	bne _021EE98A
	lsr r7, r0, #3
	b _021EE98E
_021EE98A:
	lsr r0, r0, #3
	add r7, r0, #1
_021EE98E:
	add r0, r5, #0
	add r0, #0x9b
	ldrb r0, [r0]
	add r1, r6, #0
	str r0, [sp, #0x14]
	bl _s32_div_f
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	ldr r0, [sp, #0x14]
	add r1, r6, #0
	bl _s32_div_f
	cmp r1, #0
	beq _021EE9B2
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
_021EE9B2:
	add r0, r5, #0
	add r0, #0x99
	ldrb r0, [r0]
	add r3, r5, #0
	add r1, r5, #0
	str r0, [sp]
	add r0, r7, #0
	mul r0, r6
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	lsl r0, r4, #0x19
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	mov r0, #0x3d
	str r0, [sp, #0x10]
	ldr r0, [r5]
	add r3, #0x98
	ldrb r3, [r3]
	ldr r0, [r0, #8]
	add r1, #8
	mov r2, #3
	bl AddWindowParameterized
	mov r0, #0
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, [r5]
	ldr r2, _021EEA3C ; =0x000003D9
	ldr r0, [r0, #8]
	mov r1, #3
	mov r3, #0xb
	bl LoadUserFrameGfx1
	add r0, r5, #0
	ldr r2, _021EEA3C ; =0x000003D9
	add r0, #8
	mov r1, #1
	mov r3, #0xb
	bl DrawFrameAndWindow1
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	bl ov01_021EEA44
	add r1, r5, #0
	add r1, #0x96
	add r0, r5, #0
	ldrb r1, [r1]
	add r0, #0xac
	mov r2, #4
	bl Create2dMenu
	add r1, r5, #0
	add r1, #0xb8
	str r0, [r1]
	ldr r0, _021EEA40 ; =ov01_021EDE8C
	add r1, r5, #0
	mov r2, #0
	bl CreateSysTask
	str r0, [r5, #4]
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021EEA3C: .word 0x000003D9
_021EEA40: .word ov01_021EDE8C
	thumb_func_end ov01_021EE974

	thumb_func_start ov01_021EEA44
ov01_021EEA44: ; 0x021EEA44
	push {r3, r4}
	add r4, r0, #0
	add r3, r0, #0
	add r4, #0xbc
	add r3, #0xac
	str r4, [r3]
	add r4, r0, #0
	add r3, r0, #0
	add r4, #8
	add r3, #0xb0
	str r4, [r3]
	add r3, r0, #0
	mov r4, #0
	add r3, #0xb4
	strb r4, [r3]
	add r3, r0, #0
	add r3, #0xb5
	strb r1, [r3]
	add r1, r0, #0
	add r1, #0xb6
	strb r2, [r1]
	add r1, r0, #0
	add r1, #0xb7
	ldrb r2, [r1]
	mov r1, #0xf
	bic r2, r1
	add r1, r0, #0
	add r1, #0xb7
	strb r2, [r1]
	add r1, r0, #0
	add r1, #0xb7
	ldrb r2, [r1]
	mov r1, #0x30
	add r0, #0xb7
	bic r2, r1
	strb r2, [r0]
	pop {r3, r4}
	bx lr
	thumb_func_end ov01_021EEA44

	thumb_func_start Fsys_ShowMoneyBox
Fsys_ShowMoneyBox: ; 0x021EEA90
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	add r7, r1, #0
	add r6, r2, #0
	mov r0, #4
	mov r1, #1
	bl AllocWindows
	add r4, r0, #0
	str r6, [sp]
	mov r0, #0xa
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	ldr r0, [r5, #8]
	add r1, r4, #0
	mov r2, #3
	add r3, r7, #0
	bl AddWindowParameterized
	mov r0, #0
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, [r5, #8]
	ldr r2, _021EEB30 ; =0x000003D9
	mov r1, #3
	mov r3, #0xb
	bl LoadUserFrameGfx1
	ldr r2, _021EEB30 ; =0x000003D9
	add r0, r4, #0
	mov r1, #1
	mov r3, #0xb
	bl DrawFrameAndWindow1
	add r0, r4, #0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	ldr r2, _021EEB34 ; =0x000001B3
	mov r0, #0
	mov r1, #0x1b
	mov r3, #4
	bl NewMsgDataFromNarc
	mov r1, #0x1e
	add r7, r0, #0
	bl NewString_ReadMsgData
	mov r1, #0
	add r6, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	add r0, r4, #0
	add r2, r6, #0
	add r3, r1, #0
	str r1, [sp, #8]
	bl AddTextPrinterParameterized
	add r0, r7, #0
	bl DestroyMsgData
	add r0, r6, #0
	bl String_dtor
	add r0, r5, #0
	add r1, r4, #0
	bl MoneyBoxSys_Update
	add r0, r4, #0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_021EEB30: .word 0x000003D9
_021EEB34: .word 0x000001B3
	thumb_func_end Fsys_ShowMoneyBox

	thumb_func_start MoneyBoxSys_Delete
MoneyBoxSys_Delete: ; 0x021EEB38
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0
	bl sub_0200E5D4
	add r0, r4, #0
	mov r1, #1
	bl WindowArray_dtor
	pop {r4, pc}
	thumb_func_end MoneyBoxSys_Delete

	thumb_func_start MoneyBoxSys_Update
MoneyBoxSys_Update: ; 0x021EEB4C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r7, r0, #0
	add r5, r1, #0
	mov r0, #0x50
	str r0, [sp]
	mov r3, #0x10
	add r0, r5, #0
	mov r1, #0xf
	mov r2, #0
	str r3, [sp, #4]
	bl FillWindowPixelRect
	ldr r2, _021EEBFC ; =0x000001B3
	mov r0, #0
	mov r1, #0x1b
	mov r3, #4
	bl NewMsgDataFromNarc
	str r0, [sp, #0xc]
	mov r0, #4
	bl ScrStrBufs_new
	add r6, r0, #0
	mov r0, #0x10
	mov r1, #4
	bl String_ctor
	add r4, r0, #0
	ldr r0, [sp, #0xc]
	mov r1, #0x1f
	bl NewString_ReadMsgData
	str r0, [sp, #0x10]
	ldr r0, [r7, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	bl PlayerProfile_GetMoney
	add r2, r0, #0
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	add r0, r6, #0
	mov r1, #0
	mov r3, #6
	bl BufferIntegerAsString
	ldr r2, [sp, #0x10]
	add r0, r6, #0
	add r1, r4, #0
	bl StringExpandPlaceholders
	mov r0, #0
	add r1, r4, #0
	add r2, r0, #0
	bl FontID_String_GetWidth
	mov r1, #0x50
	sub r3, r1, r0
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	mov r1, #0
	add r0, r5, #0
	add r2, r4, #0
	str r1, [sp, #8]
	bl AddTextPrinterParameterized
	ldr r0, [sp, #0x10]
	bl String_dtor
	add r0, r4, #0
	bl String_dtor
	add r0, r6, #0
	bl ScrStrBufs_delete
	ldr r0, [sp, #0xc]
	bl DestroyMsgData
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_021EEBFC: .word 0x000001B3
	thumb_func_end MoneyBoxSys_Update

	thumb_func_start ov01_021EEC00
ov01_021EEC00: ; 0x021EEC00
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	add r7, r1, #0
	str r2, [sp, #0x14]
	add r6, r3, #0
	mov r0, #4
	mov r1, #1
	bl AllocWindows
	add r4, r0, #0
	str r6, [sp]
	mov r0, #0xa
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	mov r0, #0x29
	str r0, [sp, #0x10]
	ldr r0, [r5, #8]
	ldr r3, [sp, #0x14]
	add r1, r4, #0
	mov r2, #3
	bl AddWindowParameterized
	mov r0, #0
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, [r5, #8]
	ldr r2, _021EEC64 ; =0x000003D9
	mov r1, #3
	mov r3, #0xb
	bl LoadUserFrameGfx1
	ldr r2, _021EEC64 ; =0x000003D9
	add r0, r4, #0
	mov r1, #1
	mov r3, #0xb
	bl DrawFrameAndWindow1
	add r0, r5, #0
	add r1, r4, #0
	add r2, r7, #0
	bl ov01_021EEC7C
	add r0, r4, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021EEC64: .word 0x000003D9
	thumb_func_end ov01_021EEC00

	thumb_func_start ov01_021EEC68
ov01_021EEC68: ; 0x021EEC68
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0
	bl sub_0200E5D4
	add r0, r4, #0
	mov r1, #1
	bl WindowArray_dtor
	pop {r4, pc}
	thumb_func_end ov01_021EEC68

	thumb_func_start ov01_021EEC7C
ov01_021EEC7C: ; 0x021EEC7C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	str r1, [sp, #0xc]
	add r0, r1, #0
	mov r1, #0xf
	add r4, r2, #0
	bl FillWindowPixelBuffer
	mov r0, #0
	mov r1, #0x1b
	mov r2, #0xbf
	mov r3, #4
	bl NewMsgDataFromNarc
	add r7, r0, #0
	mov r0, #4
	bl ScrStrBufs_new
	str r0, [sp, #0x10]
	mov r0, #0x10
	mov r1, #4
	bl String_ctor
	add r6, r0, #0
	cmp r4, #0
	beq _021EECBA
	cmp r4, #1
	beq _021EECD2
	cmp r4, #2
	b _021EECEE
_021EECBA:
	add r0, r7, #0
	mov r1, #0xc1
	bl NewString_ReadMsgData
	add r4, r0, #0
	ldr r0, [r5, #0xc]
	bl Sav2_PlayerData_GetCoinsAddr
	bl CheckCoins
	add r2, r0, #0
	b _021EED04
_021EECD2:
	add r0, r7, #0
	mov r1, #0xdc
	bl NewString_ReadMsgData
	add r4, r0, #0
	ldr r0, [r5, #0xc]
	bl Save_FrontierData_get
	mov r1, #0
	add r2, r1, #0
	bl FrontierData_BattlePointAction
	add r2, r0, #0
	b _021EED04
_021EECEE:
	add r0, r7, #0
	mov r1, #0xdf
	bl NewString_ReadMsgData
	add r4, r0, #0
	ldr r0, [r5, #0xc]
	bl Save_Pokeathlon_get
	bl SavePokeathlon_GetAthletePoints
	add r2, r0, #0
_021EED04:
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [sp, #0x10]
	mov r1, #0
	mov r3, #5
	bl BufferIntegerAsString
	ldr r0, [sp, #0x10]
	add r1, r6, #0
	add r2, r4, #0
	bl StringExpandPlaceholders
	mov r0, #0
	add r1, r6, #0
	add r2, r0, #0
	bl FontID_String_GetWidth
	mov r1, #0x50
	sub r3, r1, r0
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0xc]
	add r2, r6, #0
	str r1, [sp, #8]
	bl AddTextPrinterParameterized
	add r0, r4, #0
	bl String_dtor
	add r0, r6, #0
	bl String_dtor
	ldr r0, [sp, #0x10]
	bl ScrStrBufs_delete
	add r0, r7, #0
	bl DestroyMsgData
	ldr r0, [sp, #0xc]
	bl ScheduleWindowCopyToVram
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov01_021EEC7C

	thumb_func_start ov01_021EED60
ov01_021EED60: ; 0x021EED60
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	add r7, r1, #0
	add r6, r2, #0
	mov r0, #4
	mov r1, #1
	bl AllocWindows
	add r4, r0, #0
	str r6, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	mov r0, #8
	str r0, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	ldr r0, [r5, #8]
	add r1, r4, #0
	mov r2, #3
	add r3, r7, #0
	bl AddWindowParameterized
	mov r0, #0
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, [r5, #8]
	ldr r2, _021EEE24 ; =0x000003D9
	mov r1, #3
	mov r3, #0xb
	bl LoadUserFrameGfx1
	ldr r2, _021EEE24 ; =0x000003D9
	add r0, r4, #0
	mov r1, #1
	mov r3, #0xb
	bl DrawFrameAndWindow1
	add r0, r4, #0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	mov r0, #0
	mov r1, #0x1b
	mov r2, #0xbf
	mov r3, #4
	bl NewMsgDataFromNarc
	ldr r1, _021EEE28 ; =0x0000014A
	add r7, r0, #0
	bl NewString_ReadMsgData
	mov r1, #0
	add r6, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	add r0, r4, #0
	add r2, r6, #0
	add r3, r1, #0
	str r1, [sp, #8]
	bl AddTextPrinterParameterized
	add r0, r6, #0
	bl String_dtor
	ldr r1, _021EEE2C ; =0x0000014B
	add r0, r7, #0
	bl NewString_ReadMsgData
	add r6, r0, #0
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0xff
	mov r1, #0
	str r0, [sp, #4]
	add r0, r4, #0
	add r2, r6, #0
	add r3, r1, #0
	str r1, [sp, #8]
	bl AddTextPrinterParameterized
	add r0, r6, #0
	bl String_dtor
	add r0, r7, #0
	bl DestroyMsgData
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_021EEE44
	add r0, r4, #0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021EEE24: .word 0x000003D9
_021EEE28: .word 0x0000014A
_021EEE2C: .word 0x0000014B
	thumb_func_end ov01_021EED60

	thumb_func_start ov01_021EEE30
ov01_021EEE30: ; 0x021EEE30
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0
	bl sub_0200E5D4
	add r0, r4, #0
	mov r1, #1
	bl WindowArray_dtor
	pop {r4, pc}
	thumb_func_end ov01_021EEE30

	thumb_func_start ov01_021EEE44
ov01_021EEE44: ; 0x021EEE44
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	mov r3, #0x80
	add r7, r0, #0
	add r5, r1, #0
	str r3, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	add r0, r5, #0
	mov r1, #0xf
	mov r2, #0
	bl FillWindowPixelRect
	mov r0, #0x80
	str r0, [sp]
	mov r0, #0x10
	mov r3, #6
	str r0, [sp, #4]
	add r0, r5, #0
	mov r1, #0xf
	mov r2, #0
	lsl r3, r3, #6
	bl FillWindowPixelRect
	mov r0, #0
	mov r1, #0x1b
	mov r2, #0xbf
	mov r3, #4
	bl NewMsgDataFromNarc
	str r0, [sp, #0xc]
	mov r0, #4
	bl ScrStrBufs_new
	add r6, r0, #0
	mov r0, #0x10
	mov r1, #4
	bl String_ctor
	add r4, r0, #0
	mov r1, #0x53
	ldr r0, [sp, #0xc]
	lsl r1, r1, #2
	bl NewString_ReadMsgData
	str r0, [sp, #0x10]
	ldr r0, [r7, #0xc]
	bl SaveData_GetMomsSavingsAddr
	mov r1, #0
	add r2, r1, #0
	bl MomSavingsBalanceAction
	mov r1, #0
	add r2, r0, #0
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	add r0, r6, #0
	mov r3, #6
	bl BufferIntegerAsString
	ldr r2, [sp, #0x10]
	add r0, r6, #0
	add r1, r4, #0
	bl StringExpandPlaceholders
	mov r0, #0
	add r1, r4, #0
	add r2, r0, #0
	bl FontID_String_GetWidth
	mov r1, #0x80
	sub r3, r1, r0
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	mov r1, #0
	add r0, r5, #0
	add r2, r4, #0
	str r1, [sp, #8]
	bl AddTextPrinterParameterized
	ldr r0, [r7, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	bl PlayerProfile_GetMoney
	mov r1, #0
	add r2, r0, #0
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	add r0, r6, #0
	mov r3, #6
	bl BufferIntegerAsString
	ldr r2, [sp, #0x10]
	add r0, r6, #0
	add r1, r4, #0
	bl StringExpandPlaceholders
	mov r0, #0
	add r1, r4, #0
	add r2, r0, #0
	bl FontID_String_GetWidth
	mov r1, #0x80
	sub r3, r1, r0
	mov r0, #0x30
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	mov r1, #0
	add r0, r5, #0
	add r2, r4, #0
	str r1, [sp, #8]
	bl AddTextPrinterParameterized
	ldr r0, [sp, #0x10]
	bl String_dtor
	add r0, r4, #0
	bl String_dtor
	add r0, r6, #0
	bl ScrStrBufs_delete
	ldr r0, [sp, #0xc]
	bl DestroyMsgData
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_021EEE44

	thumb_func_start ov01_021EEF58
ov01_021EEF58: ; 0x021EEF58
	mov r1, #0x71
	lsl r1, r1, #2
	add r0, r0, r1
	bx lr
	thumb_func_end ov01_021EEF58

	thumb_func_start ov01_021EEF60
ov01_021EEF60: ; 0x021EEF60
	add r0, #0x9b
	ldrb r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end ov01_021EEF60

	thumb_func_start ov01_021EEF68
ov01_021EEF68: ; 0x021EEF68
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #4
	mov r1, #1
	bl AllocWindows
	add r4, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl ov03_02256730
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov01_021EEF68

	thumb_func_start ov01_021EEF88
ov01_021EEF88: ; 0x021EEF88
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0
	bl sub_0200E5D4
	add r0, r4, #0
	mov r1, #1
	bl WindowArray_dtor
	pop {r4, pc}
	thumb_func_end ov01_021EEF88

	thumb_func_start ov01_021EEF9C
ov01_021EEF9C: ; 0x021EEF9C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0xa9
	lsl r0, r0, #2
	add r4, r5, r0
	lsl r6, r1, #1
	ldrh r0, [r4, r6]
	cmp r0, #0xff
	beq _021EF006
	mov r0, #0x5a
	mov r1, #4
	bl String_ctor
	add r7, r0, #0
	mov r0, #0x5a
	mov r1, #4
	bl String_ctor
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x18]
	mov r1, #0xf
	bl FillWindowPixelBuffer
	add r0, r5, #0
	add r0, #0x8c
	ldrh r1, [r4, r6]
	ldr r0, [r0]
	add r2, r7, #0
	bl ReadMsgDataIntoString
	add r0, r5, #0
	add r0, #0x90
	ldr r0, [r0]
	ldr r1, [sp, #0xc]
	add r2, r7, #0
	bl StringExpandPlaceholders
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	str r3, [sp, #8]
	ldr r0, [r5, #0x18]
	ldr r2, [sp, #0xc]
	mov r1, #1
	bl AddTextPrinterParameterized
	add r0, r7, #0
	bl String_dtor
	ldr r0, [sp, #0xc]
	bl String_dtor
_021EF006:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_021EEF9C

	thumb_func_start ov01_021EF00C
ov01_021EF00C: ; 0x021EF00C
	add r0, #0x97
	ldrb r0, [r0]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	bx lr
	.balign 4, 0
	thumb_func_end ov01_021EF00C

	thumb_func_start ov01_021EF018
ov01_021EF018: ; 0x021EF018
	add r2, r0, #0
	add r2, #0x97
	ldrb r3, [r2]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	mov r2, #0x40
	lsl r1, r1, #0x1f
	bic r3, r2
	lsr r1, r1, #0x19
	orr r1, r3
	add r0, #0x97
	strb r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end ov01_021EF018

	thumb_func_start ov01_021EF034
ov01_021EF034: ; 0x021EF034
	add r2, r0, #0
	add r2, #0x97
	ldrb r3, [r2]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	mov r2, #0x80
	lsl r1, r1, #0x1f
	bic r3, r2
	lsr r1, r1, #0x18
	orr r1, r3
	add r0, #0x97
	strb r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end ov01_021EF034
