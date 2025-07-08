#include "constants/species.h"
#include "constants/sndseq.h"
#include "constants/maps.h"
#include "constants/flypoints.h"
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

	.extern ov101_021E9270
	.extern ov101_021E990C
	.extern ov101_021E9B70
	.extern ov101_021EA4D0
	.extern ov101_021EA608
	.extern ov101_021EA794
	.extern ov101_021EA8A8
	.extern ov101_021EAD90
	.extern ov101_021EAF40
	.extern ov101_021EB1E0
	.extern ov101_021EB2FC
	.extern ov101_021EB338
	.extern ov101_021EB4C4

	thumb_func_start ov101_021EE664
ov101_021EE664: ; 0x021EE664
	ldr r3, _021EE66C ; =ov100_021E6EF4
	add r0, #0x84
	ldr r0, [r0]
	bx r3
	.balign 4, 0
_021EE66C: .word ov100_021E6EF4
	thumb_func_end ov101_021EE664

	thumb_func_start ov101_021EE670
ov101_021EE670: ; 0x021EE670
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r5, r0, #0
	add r0, #0x84
	ldr r0, [r0]
	mov r1, #4
	ldr r0, [r0, #8]
	mov r2, #8
	str r0, [sp, #0x1c]
	mov r0, #6
	str r0, [sp]
	ldr r0, _021EE8D8 ; =0x04000050
	mov r3, #0xa
	bl G2x_SetBlendAlpha_
	mov r4, #0
	mov r6, #3
	add r7, r4, #0
_021EE694:
	ldr r0, [r5, #0x10]
	add r1, r4, #1
	lsl r1, r1, #0x18
	ldr r0, [r0, #0x74]
	lsr r1, r1, #0x18
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x10]
	add r1, r4, #1
	lsl r1, r1, #0x18
	mov r2, #0
	ldr r0, [r0, #0x74]
	lsr r1, r1, #0x18
	add r3, r2, #0
	bl BgSetPosTextAndCommit
	ldr r0, [r5, #0x10]
	add r1, r4, #1
	lsl r1, r1, #0x18
	ldr r0, [r0, #0x74]
	lsr r1, r1, #0x18
	add r2, r6, #0
	add r3, r7, #0
	bl BgSetPosTextAndCommit
	add r4, r4, #1
	cmp r4, #3
	blt _021EE694
	ldr r1, _021EE8DC ; =ov101_021EB338
	ldr r0, [r5, #0x10]
	str r1, [r0, #0x5c]
	ldr r1, _021EE8E0 ; =ov101_021EB2FC
	ldr r0, [r5, #0x10]
	str r1, [r0, #0x60]
	add r0, r5, #0
	bl ov101_021E990C
	add r1, r5, #0
	add r0, r5, #0
	add r1, #0xc8
	bl ov101_021E9B70
	mov r0, #0x5e
	lsl r0, r0, #2
	mov r2, #0
	ldr r0, [r5, r0]
	mov r1, #0x20
	str r1, [sp]
	mov r1, #0x18
	str r1, [sp, #4]
	add r1, r0, #0
	add r1, #0xc
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	str r2, [sp, #0x10]
	ldrh r1, [r0]
	add r3, r2, #0
	lsl r1, r1, #0x15
	lsr r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	mov r1, #1
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x74]
	bl CopyToBgTilemapRect
	add r0, r5, #0
	bl ov101_021EAF40
	mov r0, #0
	mvn r0, r0
	strb r0, [r5, #0xf]
	ldrb r0, [r5, #0xd]
	cmp r0, #2
	bne _021EE7BC
	mov r0, #0x5b
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0x20
	str r1, [sp]
	mov r1, #6
	add r2, r0, #0
	str r1, [sp, #4]
	add r2, #0xc
	str r2, [sp, #8]
	mov r2, #0
	str r2, [sp, #0xc]
	mov r3, #8
	str r3, [sp, #0x10]
	ldrh r4, [r0]
	lsl r4, r4, #0x15
	lsr r4, r4, #0x18
	str r4, [sp, #0x14]
	ldrh r0, [r0, #2]
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x74]
	bl CopyToBgTilemapRect
	mov r3, #0x46
	lsl r3, r3, #2
	add r2, r3, #0
	add r1, r5, r3
	sub r2, #8
	sub r3, r3, #6
	ldrsh r2, [r5, r2]
	ldrsh r3, [r5, r3]
	add r0, r5, #0
	lsl r2, r2, #0x18
	lsl r3, r3, #0x18
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl ov101_021EA794
	add r0, r5, #0
	mov r1, #1
	bl ov101_021EAD90
	ldr r0, [r5, #0x10]
	mov r2, #3
	add r3, r2, #0
	ldr r0, [r0, #0x74]
	mov r1, #5
	sub r3, #0x54
	bl BgSetPosTextAndCommit
	ldr r0, [r5, #0x10]
	mov r2, #3
	add r3, r2, #0
	ldr r0, [r0, #0x74]
	mov r1, #6
	sub r3, #0x54
	bl BgSetPosTextAndCommit
	ldr r0, [r5, #0x10]
	mov r2, #3
	add r3, r2, #0
	ldr r0, [r0, #0x74]
	mov r1, #7
	sub r3, #0x54
	bl BgSetPosTextAndCommit
	b _021EE82A
_021EE7BC:
	add r0, r5, #0
	mov r1, #0
	bl ov101_021EA4D0
	mov r0, #0x5b
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0x20
	str r1, [sp]
	mov r1, #0x10
	str r1, [sp, #4]
	add r1, r0, #0
	add r1, #0xc
	str r1, [sp, #8]
	mov r2, #0
	str r2, [sp, #0xc]
	mov r3, #8
	str r3, [sp, #0x10]
	ldrh r1, [r0]
	lsl r1, r1, #0x15
	lsr r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	mov r1, #6
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x74]
	bl CopyToBgTilemapRect
	mov r3, #0x46
	lsl r3, r3, #2
	add r2, r3, #0
	add r1, r5, r3
	sub r2, #8
	sub r3, r3, #6
	ldrsh r2, [r5, r2]
	ldrsh r3, [r5, r3]
	add r0, r5, #0
	lsl r2, r2, #0x18
	lsl r3, r3, #0x18
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl ov101_021EA8A8
	add r0, r5, #0
	mov r1, #0
	bl ov101_021EAD90
	mov r1, #0
	add r0, r5, #0
	mvn r1, r1
	bl ov101_021EB4C4
_021EE82A:
	add r0, r5, #0
	mov r1, #1
	bl ov101_021EB1E0
	add r0, r5, #0
	mov r1, #1
	bl ov101_021EA608
	add r1, r5, #0
	add r1, #0xb0
	ldr r1, [r1]
	mov r0, #4
	mov r2, #0
	bl FontID_String_GetWidth
	lsl r0, r0, #0x10
	asr r1, r0, #0x10
	mov r0, #0x30
	sub r1, r0, r1
	lsr r0, r1, #0x1f
	add r0, r1, r0
	lsl r0, r0, #0xf
	mov r1, #0
	asr r3, r0, #0x10
	str r1, [sp]
	add r2, r5, #0
	ldr r0, _021EE8E4 ; =0x00030100
	str r1, [sp, #4]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	mov r0, #0x81
	add r2, #0xb0
	lsl r0, r0, #2
	ldr r2, [r2]
	add r0, r5, r0
	mov r1, #4
	bl AddTextPrinterParameterizedWithColor
	ldr r0, [sp, #0x1c]
	mov r1, #1
	add r0, #0xe8
	str r0, [sp, #0x1c]
	ldr r0, [r0]
	bl Sprite_SetDrawFlag
	add r0, r5, #0
	add r0, #0x84
	ldr r0, [r0]
	bl ov100_021E6E84
	ldr r0, [r5, #0x10]
	mov r1, #4
	ldr r0, [r0, #0x74]
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r5, #0x10]
	mov r1, #5
	ldr r0, [r0, #0x74]
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r5, #0x10]
	mov r1, #7
	ldr r0, [r0, #0x74]
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r5, #0x10]
	mov r1, #0
	ldr r0, [r0, #0x74]
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r5, #0x10]
	mov r1, #1
	ldr r0, [r0, #0x74]
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r5, #0x10]
	mov r1, #2
	ldr r0, [r0, #0x74]
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r5, #0x10]
	mov r1, #3
	ldr r0, [r0, #0x74]
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021EE8D8: .word 0x04000050
_021EE8DC: .word ov101_021EB338
_021EE8E0: .word ov101_021EB2FC
_021EE8E4: .word 0x00030100
	thumb_func_end ov101_021EE670

    .rodata

	.global ov101_021F7F44
ov101_021F7F44: ; 0x021F7F44
	.word 0x00000001
	.word 0x00000005
	.word 0x00000000
	.word 0x00000000

	.global ov101_021F7F54
ov101_021F7F54: ; 0x021F7F54
	.byte 0x05, 0x01, 0x08, 0x05, 0x03, 0x01
	.short 0x3F0
	.byte 0x05, 0x03, 0x0B, 0x0C, 0x02, 0x01
	.short 0x3D8
	.byte 0x05, 0x01, 0x0E, 0x1C, 0x04, 0x01
	.short 0x368
	.byte 0x05, 0x05, 0x12, 0x0B, 0x05, 0x01
	.short 0x331
	.byte 0x05, 0x12, 0x12, 0x0B, 0x05, 0x01
	.short 0x2FA
	.byte 0x05, 0x05, 0x14, 0x0B, 0x02, 0x01
	.short 0x2E4
	.byte 0x05, 0x12, 0x16, 0x0B, 0x02, 0x01
	.short 0x2CE
	.byte 0x00, 0x00, 0x15, 0x19, 0x02, 0x0A
	.short 0x05C
	.byte 0x00, 0x19, 0x15, 0x06, 0x02, 0x0A
	.short 0x08E

	.global ov101_021F7F9C
ov101_021F7F9C: ; 0x021F7F9C
	.word 0x00000000, 0x00000000, 0x00000800, 0x00000000
	.byte 0x01, 0x00, 0x1F, 0x02, 0x00, 0x00, 0x00, 0x00
	.word 0x00000000
	.word 0x00000000, 0x00000000, 0x00000800, 0x00000000
	.byte 0x01, 0x00, 0x1E, 0x00, 0x00, 0x01, 0x00, 0x00
	.word 0x00000000
	.word 0x00000000, 0x00000000, 0x00002000, 0x00000000
	.byte 0x04, 0x01, 0x1A, 0x04, 0x00, 0x02, 0x00, 0x00
	.word 0x00000000
	.word 0x00000000, 0x00000000, 0x00002000, 0x00000000
	.byte 0x04, 0x01, 0x16, 0x04, 0x00, 0x03, 0x00, 0x00
	.word 0x00000000
	.word 0x00000000, 0x00000000, 0x00000800, 0x00000000
	.byte 0x01, 0x00, 0x1F, 0x02, 0x00, 0x03, 0x00, 0x00
	.word 0x00000000
	.word 0x00000000, 0x00000000, 0x00000800, 0x00000000
	.byte 0x01, 0x00, 0x1E, 0x00, 0x00, 0x00, 0x00, 0x00
	.word 0x00000000
	.word 0x00000000, 0x00000000, 0x00000800, 0x00000000
	.byte 0x01, 0x00, 0x1D, 0x00, 0x00, 0x01, 0x00, 0x00
	.word 0x00000000
	.word 0x00000000, 0x00000000, 0x00000800, 0x00000000
	.byte 0x01, 0x00, 0x1C, 0x04, 0x00, 0x02, 0x00, 0x00
	.word 0x00000000

	.global ov101_021F807C
ov101_021F807C: ; 0x021F807C
	.word 0x00000000
	.short 0x0020, 0x0060, 0x0000, 0x0000
	.word 0x00000000, 0x00000000
	.word 0x00000002, 0x00000000, 0x00000000, 0x00000000
	.word 0x00000000

	.word 0x00000000
	.short 0x0010, 0x0090, 0x0000, 0x0001
	.word 0x00000000, 0x00000000, 0x00000002, 0x00000000, 0x00000000, 0x00000000, 0x00000000

	.word 0x00000001
	.short 0x0020, 0x0080, 0x0000, 0x0000
	.word 0x00000001, 0x00000000, 0x00000001, 0x00000000, 0x00000000, 0x00000000, 0x00000000

	.word 0x00000001
	.short 0x0020, 0x0060, 0x0000, 0x0001
	.word 0x00000002, 0x00000000, 0x00000001, 0x00000000, 0x00000000, 0x00000000, 0x00000000

	.word 0x00000001
	.short 0x0020, 0x0060, 0x0000, 0x0002
	.word 0x00000002, 0x00000000, 0x00000001, 0x00000000, 0x00000000, 0x00000000, 0x00000000
	; 200
	.word 0x00000001
	.short 0x0000, 0x0000, 0x0000, 0x0005
	.word 0x00000001, 0x00000002, 0x00000001, 0x00000000, 0x00000000, 0x00000000, 0x00000000
	; 240
	.word 0x00000001
	.short 0x0000, 0x0000, 0x0000, 0x0006
	.word 0x00000001, 0x00000002, 0x00000001, 0x00000000, 0x00000000, 0x00000000, 0x00000000
	; 280
	.word 0x00000001
	.short 0x0000, 0x0000, 0x0000, 0x0007
	.word 0x00000001, 0x00000002, 0x00000001, 0x00000000, 0x00000000, 0x00000000, 0x00000000
	;320
	.word 0x00000001
	.short 0x0000, 0x0000, 0x0000, 0x0008
	.word 0x00000001, 0x00000002, 0x00000001, 0x00000000, 0x00000000, 0x00000000, 0x00000000

	.word 0x00000001
	.short 0x0000, 0x0000, 0x0000, 0x0009
	.word 0x00000003, 0x00000000, 0x00000001, 0x00000000, 0x00000000, 0x00000000, 0x00000000
