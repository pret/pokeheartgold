#include "constants/species.h"
#include "constants/sndseq.h"
#include "constants/maps.h"
#include "constants/items.h"
#include "constants/phone_contacts.h"
#include "constants/flags.h"
#include "msgdata/msg/msg_0271.h"
#include "msgdata/msg/msg_0416.h"
#include "msgdata/msg/msg_0411.h"
#include "msgdata/msg/msg_0640.h"
#include "msgdata/msg/msg_0664.h"
	.include "asm/macros.inc"
	.include "overlay_101.inc"
	.include "global.inc"

	.text

	.extern ov101_021EF4DC
	.extern ov101_021EF50C

	thumb_func_start ov101_021EF5A4
ov101_021EF5A4: ; 0x021EF5A4
	push {r4, r5, r6, lr}
	add r4, r1, #0
	cmp r2, #0
	beq _021EF680
	ldr r1, _021EF6B8 ; =0x04000048
	mov r3, #0x3f
	ldrh r2, [r1]
	mov r5, #0x1f
	bic r2, r3
	orr r2, r5
	strh r2, [r1]
	ldrh r6, [r1]
	ldr r2, _021EF6BC ; =0xFFFFC0FF
	and r6, r2
	lsl r2, r5, #8
	orr r2, r6
	strh r2, [r1]
	ldrh r2, [r1, #2]
	bic r2, r3
	add r3, r2, #0
	orr r3, r5
	mov r2, #0x20
	orr r2, r3
	strh r2, [r1, #2]
	ldr r6, [r0, #0x40]
	add r0, r6, #0
	add r0, #0x28
	ldrb r0, [r0]
	lsl r5, r0, #3
	add r0, r6, #0
	add r6, #0x26
	ldrb r6, [r6]
	add r0, #0x29
	ldrb r0, [r0]
	add r6, r6, #2
	lsl r6, r6, #3
	lsl r3, r0, #3
	lsl r2, r5, #8
	mov r0, #0xff
	add r5, r5, r6
	lsl r0, r0, #8
	lsl r5, r5, #0x18
	and r2, r0
	lsr r5, r5, #0x18
	orr r5, r2
	add r2, r1, #0
	sub r2, #8
	strh r5, [r2]
	lsl r2, r3, #8
	add r3, #0x38
	and r2, r0
	lsl r0, r3, #0x18
	lsr r0, r0, #0x18
	orr r2, r0
	sub r0, r1, #4
	strh r2, [r0]
	add r0, r4, #0
	mov r1, #3
	bl _s32_div_f
	mov r0, #0x50
	add r2, r1, #0
	mul r2, r0
	add r0, r2, #0
	add r0, #0x18
	lsl r1, r0, #8
	mov r0, #0xff
	lsl r0, r0, #8
	add r2, #0x48
	and r1, r0
	lsl r0, r2, #0x18
	lsr r0, r0, #0x18
	orr r1, r0
	ldr r0, _021EF6C0 ; =0x04000042
	strh r1, [r0]
	add r0, r4, #0
	mov r1, #3
	bl _s32_div_f
	mov r1, #0x48
	add r2, r0, #0
	mul r2, r1
	add r0, r2, #0
	add r0, #0x18
	lsl r1, r0, #8
	mov r0, #0xff
	lsl r0, r0, #8
	add r2, #0x40
	and r1, r0
	lsl r0, r2, #0x18
	lsr r0, r0, #0x18
	orr r1, r0
	ldr r0, _021EF6C4 ; =0x04000046
	add r3, r0, #0
	strh r1, [r0]
	sub r3, #0x46
	ldr r2, [r3]
	ldr r1, _021EF6C8 ; =0xFFFF1FFF
	add r0, #0xa
	and r2, r1
	mov r1, #6
	lsl r1, r1, #0xc
	orr r1, r2
	str r1, [r3]
	mov r1, #0x1f
	add r2, r1, #0
	sub r2, #0x27
	bl G2x_SetBlendBrightness_
	pop {r4, r5, r6, pc}
_021EF680:
	ldr r0, _021EF6B8 ; =0x04000048
	mov r2, #0x3f
	ldrh r1, [r0]
	bic r1, r2
	strh r1, [r0]
	ldrh r3, [r0]
	ldr r1, _021EF6BC ; =0xFFFFC0FF
	and r1, r3
	strh r1, [r0]
	ldrh r1, [r0, #2]
	add r3, r0, #0
	sub r3, #0x48
	bic r1, r2
	strh r1, [r0, #2]
	ldr r2, [r3]
	ldr r1, _021EF6C8 ; =0xFFFF1FFF
	add r0, #8
	and r1, r2
	str r1, [r3]
	mov r1, #0x1f
	mov r2, #0
	bl G2x_SetBlendBrightness_
	ldr r0, _021EF6CC ; =0x04000050
	mov r1, #0
	strh r1, [r0]
	pop {r4, r5, r6, pc}
	nop
_021EF6B8: .word 0x04000048
_021EF6BC: .word 0xFFFFC0FF
_021EF6C0: .word 0x04000042
_021EF6C4: .word 0x04000046
_021EF6C8: .word 0xFFFF1FFF
_021EF6CC: .word 0x04000050
	thumb_func_end ov101_021EF5A4

	thumb_func_start ov101_021EF6D0
ov101_021EF6D0: ; 0x021EF6D0
	mov r2, #1
	ldrh r0, [r0, #0x12]
	lsl r2, r1
	lsl r1, r2, #0x10
	lsl r0, r0, #0x17
	lsr r1, r1, #0x10
	lsr r0, r0, #0x17
	and r0, r1
	bx lr
	.balign 4, 0
	thumb_func_end ov101_021EF6D0

	thumb_func_start ov101_021EF6E4
ov101_021EF6E4: ; 0x021EF6E4
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, _021EF7C8 ; =gSystem
	mov r2, #2
	ldr r0, [r0, #0x48]
	add r1, r0, #0
	tst r1, r2
	beq _021EF730
	ldr r0, [r4, #0xc]
	mov r1, #1
	strb r1, [r0, #6]
	ldr r0, [r4, #0xc]
	mov r2, #0
	ldr r0, [r0, #0x7c]
	bl PokegearAppSwitch_SetCursorSpritesDrawState
	ldr r0, [r4, #0xc]
	mov r1, #0
	ldr r0, [r0, #0x7c]
	mov r2, #1
	bl PokegearAppSwitch_SetCursorSpritesDrawState
	ldr r0, [r4, #0xc]
	bl PokegearApp_AppIDtoButtonIndex
	add r2, r0, #0
	ldr r0, [r4, #0xc]
	mov r1, #0
	ldr r0, [r0, #0x7c]
	bl PokegearAppSwitch_SetSpecIndexAndCursorPos
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
_021EF730:
	mov r1, #1
	add r3, r0, #0
	tst r3, r1
	beq _021EF766
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0x7c]
	bl PokegearAppSwitch_GetCursorPos
	add r5, r0, #0
	add r0, r4, #0
	add r1, r5, #0
	bl ov101_021EF6D0
	cmp r0, #0
	bne _021EF754
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
_021EF754:
	add r0, r4, #0
	add r1, r5, #0
	bl ov101_021EF50C
	ldr r0, _021EF7CC ; =0x00000941
	bl PlaySE
	mov r0, #8
	pop {r3, r4, r5, pc}
_021EF766:
	mov r3, #0x20
	tst r3, r0
	beq _021EF77E
	ldr r0, [r4, #0xc]
	mov r1, #0
	ldr r0, [r0, #0x7c]
	bl PokegearAppSwitch_MoveActiveCursor
	ldr r0, _021EF7D0 ; =0x0000093F
	bl PlaySE
	b _021EF7C2
_021EF77E:
	mov r3, #0x10
	tst r3, r0
	beq _021EF794
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0x7c]
	bl PokegearAppSwitch_MoveActiveCursor
	ldr r0, _021EF7D0 ; =0x0000093F
	bl PlaySE
	b _021EF7C2
_021EF794:
	mov r1, #0x40
	tst r1, r0
	beq _021EF7AC
	ldr r0, [r4, #0xc]
	add r1, r2, #0
	ldr r0, [r0, #0x7c]
	bl PokegearAppSwitch_MoveActiveCursor
	ldr r0, _021EF7D0 ; =0x0000093F
	bl PlaySE
	b _021EF7C2
_021EF7AC:
	mov r1, #0x80
	tst r0, r1
	beq _021EF7C2
	ldr r0, [r4, #0xc]
	mov r1, #3
	ldr r0, [r0, #0x7c]
	bl PokegearAppSwitch_MoveActiveCursor
	ldr r0, _021EF7D0 ; =0x0000093F
	bl PlaySE
_021EF7C2:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021EF7C8: .word gSystem
_021EF7CC: .word 0x00000941
_021EF7D0: .word 0x0000093F
	thumb_func_end ov101_021EF6E4

	thumb_func_start ov101_021EF7D4
ov101_021EF7D4: ; 0x021EF7D4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	bl PokegearApp_HandleTouchInput_SwitchApps
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _021EF83C
	ldr r0, _021EF840 ; =ov101_021F83E4
	bl TouchscreenHitbox_FindRectAtTouchNew
	add r4, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	beq _021EF83C
	lsl r1, r4, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl ov101_021EF6D0
	cmp r0, #0
	bne _021EF80A
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
_021EF80A:
	ldr r0, [r5, #0xc]
	ldrb r0, [r0, #6]
	cmp r0, #1
	bne _021EF818
	add r0, r5, #0
	bl ov101_021EF4DC
_021EF818:
	ldr r0, [r5, #0xc]
	lsl r1, r4, #0x18
	ldr r0, [r0, #0x7c]
	lsr r1, r1, #0x18
	bl PokegearAppSwitch_SetActiveCursorPosition
	lsl r1, r4, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl ov101_021EF50C
	ldr r0, _021EF844 ; =0x00000941
	bl PlaySE
	ldr r0, [r5, #0xc]
	mov r1, #1
	str r1, [r0, #0xc]
	mov r0, #8
_021EF83C:
	pop {r3, r4, r5, pc}
	nop
_021EF840: .word ov101_021F83E4
_021EF844: .word 0x00000941
	thumb_func_end ov101_021EF7D4

    .rodata

	.global ov101_021F820C
ov101_021F820C: ; 0x021F820C
	.short 0x0000
	.byte 0x02, 0x01, 0x03, 0x03, 0x30, 0x2C, -22, 22, -18, 18

	.short 0x0001
	.byte 0x00, 0x02, 0x04, 0x04, 0x80, 0x2C, -22, 22, -18, 18

	.short 0x0002
	.byte 0x01, 0x00, 0x05, 0x05, 0xD0, 0x2C, -22, 22, -18, 18

	.short 0x0003
	.byte 0x05, 0x04, 0x00, 0x00, 0x30, 0x74, -22, 22, -18, 18

	.short 0x0004
	.byte 0x03, 0x05, 0x01, 0x01, 0x80, 0x74, -22, 22, -18, 18

	.short 0x0005
	.byte 0x04, 0x03, 0x02, 0x02, 0xD0, 0x74, -22, 22, -18, 18

	.global ov101_021F8254
ov101_021F8254: ; 0x021F8254
	.word 0x00000000, 0x00000000, 0x00000800, 0x00000000
	.byte 0x01, 0x00, 0x1E, 0x04, 0x00, 0x01, 0x00, 0x00
	.word 0x00000000

	.word 0x00000000, 0x00000000, 0x00000800, 0x00000000
	.byte 0x01, 0x00, 0x1D, 0x00, 0x00, 0x02, 0x00, 0x00
	.word 0x00000000

	.word 0x00000000, 0x00000000, 0x00000800, 0x00000000
	.byte 0x01, 0x00, 0x1C, 0x00, 0x00, 0x03, 0x00, 0x00
	.word 0x00000000

	.word 0x00000000, 0x00000000, 0x00000800, 0x00000000
	.byte 0x01, 0x00, 0x1E, 0x00, 0x00, 0x00, 0x00, 0x00
	.word 0x00000000

	.word 0x00000000, 0x00000000, 0x00000800, 0x00000000
	.byte 0x01, 0x00, 0x1D, 0x00, 0x00, 0x01, 0x00, 0x00
	.word 0x00000000

	.word 0x00000000, 0x00000000, 0x00000800, 0x00000000
	.byte 0x01, 0x00, 0x1C, 0x00, 0x00, 0x02, 0x00, 0x00
	.word 0x00000000

	.global ov101_021F82FC
ov101_021F82FC: ; 0x021F82FC
	.word 0x00000000
	.short 0x0000, 0x0000, 0x0000, 0x0000
	.word 0x00000001, 0x00000006, 0x00000001, 0x00000000, 0x00000000, 0x00000000, 0x00000000

	.word 0x00000000
	.short 0x0000, 0x0000, 0x0000, 0x0001
	.word 0x00000001, 0x00000006, 0x00000001, 0x00000000, 0x00000000, 0x00000000, 0x00000000

	.word 0x00000000
	.short 0x0000, 0x0000, 0x0000, 0x0002
	.word 0x00000001, 0x00000006, 0x00000001, 0x00000000, 0x00000000, 0x00000000, 0x00000000

	.word 0x00000000
	.short 0x0000, 0x0000, 0x0000, 0x0003
	.word 0x00000001, 0x00000006, 0x00000001, 0x00000000, 0x00000000, 0x00000000, 0x00000000

	.word 0x00000000
	.short 0x0000, 0x0000, 0x0000, 0x0008
	.word 0x00000001, 0x00000004, 0x00000001, 0x00000000, 0x00000000, 0x00000000, 0x00000000

	// file boundary

	.global ov101_021F83C4
ov101_021F83C4: ; 0x021F83C4
	.byte 0x03 | (0<<7)
	.byte 0x00
	.byte 0x01
	.byte 0x0A
	.byte 0x01
	.byte 0x01
	.short 0x001C
	.short 0x0001
	.short 0x0040

	.global ov101_021F83D0
ov101_021F83D0: ; 0x021F83D0
	.byte 0x0A, 0x02, 0x00
	.byte 0x14, 0x02, 0x00
	.byte 0x16, 0x02, 0x02
	.byte 0x0A, 0x0B, 0x00
	.byte 0x14, 0x0B, 0x00
	.byte 0x16, 0x0B, 0x02

	.balign 4, 0
	.global ov101_021F83E4
ov101_021F83E4: ; 0x021F83E4
	.byte 0x18, 0x40, 0x18, 0x48
	.byte 0x18, 0x40, 0x68, 0x98
	.byte 0x18, 0x40, 0xB8, 0xE8
	.byte 0x60, 0x88, 0x18, 0x48
	.byte 0x60, 0x88, 0x68, 0x98
	.byte 0x60, 0x88, 0xB8, 0xE8
	.byte 0xFF, 0x00, 0x00, 0x00
