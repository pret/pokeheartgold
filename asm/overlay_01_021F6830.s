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
	.include "overlay_01_021F6830.inc"
	.include "global.inc"

	.text

	thumb_func_start ov01_021F6830
ov01_021F6830: ; 0x021F6830
	push {r3, lr}
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x14]
	cmp r0, #0
	beq _021F683E
	bl ov35_02259D80
_021F683E:
	pop {r3, pc}
	thumb_func_end ov01_021F6830

	thumb_func_start ov01_021F6840
ov01_021F6840: ; 0x021F6840
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021F6860 ; =FS_OVERLAY_ID(OVY_27)
	mov r1, #2
	bl HandleLoadOverlay
	add r1, r4, #0
	ldr r0, [r4, #8]
	add r1, #0xd0
	add r2, r4, #0
	mov r3, #0
	bl ov30_0225D520
	add r4, #0xd4
	str r0, [r4]
	pop {r4, pc}
	.balign 4, 0
_021F6860: .word FS_OVERLAY_ID(OVY_27)
	thumb_func_end ov01_021F6840

	thumb_func_start ov01_021F6864
ov01_021F6864: ; 0x021F6864
	add r1, r0, #0
	ldr r0, [r1, #8]
	add r1, #0xd4
	ldr r3, _021F6870 ; =ov30_0225D64C
	ldr r1, [r1]
	bx r3
	.balign 4, 0
_021F6870: .word ov30_0225D64C
	thumb_func_end ov01_021F6864

	thumb_func_start ov01_021F6874
ov01_021F6874: ; 0x021F6874
	push {r3, lr}
	ldr r0, [r0, #8]
	bl ov30_0225D6FC
	cmp r0, #0
	beq _021F688A
	ldr r0, _021F6890 ; =FS_OVERLAY_ID(OVY_27)
	bl UnloadOverlayByID
	mov r0, #1
	pop {r3, pc}
_021F688A:
	mov r0, #0
	pop {r3, pc}
	nop
_021F6890: .word FS_OVERLAY_ID(OVY_27)
	thumb_func_end ov01_021F6874

	thumb_func_start ov01_021F6894
ov01_021F6894: ; 0x021F6894
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021F68B4 ; =FS_OVERLAY_ID(OVY_27)
	mov r1, #2
	bl HandleLoadOverlay
	add r1, r4, #0
	ldr r0, [r4, #8]
	add r1, #0xd0
	add r2, r4, #0
	bl ov01_021F68DC
	add r4, #0xd8
	str r0, [r4]
	pop {r4, pc}
	nop
_021F68B4: .word FS_OVERLAY_ID(OVY_27)
	thumb_func_end ov01_021F6894

	thumb_func_start ov01_021F68B8
ov01_021F68B8: ; 0x021F68B8
	ldr r3, _021F68BC ; =ov01_021F690C
	bx r3
	.balign 4, 0
_021F68BC: .word ov01_021F690C
	thumb_func_end ov01_021F68B8

	thumb_func_start ov01_021F68C0
ov01_021F68C0: ; 0x021F68C0
	push {r3, lr}
	bl ov01_021F6930
	cmp r0, #0
	beq _021F68D4
	ldr r0, _021F68D8 ; =FS_OVERLAY_ID(OVY_27)
	bl UnloadOverlayByID
	mov r0, #1
	pop {r3, pc}
_021F68D4:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_021F68D8: .word FS_OVERLAY_ID(OVY_27)
	thumb_func_end ov01_021F68C0

	thumb_func_start ov01_021F68DC
ov01_021F68DC: ; 0x021F68DC
	push {r3, r4, r5, lr}
	ldr r0, _021F6908 ; =ov01_021F69C0
	add r5, r2, #0
	mov r1, #0x10
	mov r2, #0xa
	mov r3, #4
	bl CreateSysTaskAndEnvironment
	add r4, r0, #0
	bl sub_0201F988
	ldr r1, [r5, #0x1c]
	strb r1, [r0]
	mov r1, #0
	strb r1, [r0, #1]
	str r1, [r0, #4]
	strb r1, [r0, #2]
	str r5, [r0, #8]
	str r1, [r0, #0xc]
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_021F6908: .word ov01_021F69C0
	thumb_func_end ov01_021F68DC

	thumb_func_start ov01_021F690C
ov01_021F690C: ; 0x021F690C
	push {r4, lr}
	add r4, r0, #0
	add r0, #0xd8
	ldr r0, [r0]
	bl sub_0201F988
	add r2, r0, #0
	ldr r1, [r2, #4]
	ldrb r2, [r2]
	ldr r0, [r4, #8]
	lsl r3, r2, #4
	ldr r2, _021F692C ; =ov01_02206C60 + 4
	ldr r2, [r2, r3]
	blx r2
	pop {r4, pc}
	nop
_021F692C: .word ov01_02206C60 + 4
	thumb_func_end ov01_021F690C

	thumb_func_start ov01_021F6930
ov01_021F6930: ; 0x021F6930
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0xd8
	ldr r0, [r0]
	bl sub_0201F988
	add r4, r0, #0
	ldrb r1, [r4]
	ldr r0, [r5, #8]
	lsl r2, r1, #4
	ldr r1, _021F6964 ; =ov01_02206C60 + 8
	ldr r1, [r1, r2]
	blx r1
	cmp r0, #1
	bne _021F6960
	add r0, r4, #0
	bl ov01_021F69A4
	add r5, #0xd8
	ldr r0, [r5]
	bl DestroySysTaskAndEnvironment
	mov r0, #1
	pop {r3, r4, r5, pc}
_021F6960:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021F6964: .word ov01_02206C60 + 8
	thumb_func_end ov01_021F6930

	thumb_func_start ov01_021F6968
ov01_021F6968: ; 0x021F6968
	push {r4, r5, r6, lr}
	add r4, r0, #0
	ldrb r0, [r4]
	lsl r1, r0, #4
	ldr r0, _021F699C ; =ov01_02206C60 + 12
	ldr r0, [r0, r1]
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _021F6982
	mov r1, #2
	bl HandleLoadOverlay
_021F6982:
	ldrb r5, [r4]
	ldr r2, [r4, #8]
	ldr r3, [r4, #0xc]
	lsl r6, r5, #4
	ldr r5, _021F69A0 ; =ov01_02206C60
	add r1, r2, #0
	ldr r0, [r2, #8]
	ldr r5, [r5, r6]
	add r1, #0xd0
	blx r5
	str r0, [r4, #4]
	pop {r4, r5, r6, pc}
	nop
_021F699C: .word ov01_02206C60 + 12
_021F69A0: .word ov01_02206C60
	thumb_func_end ov01_021F6968

	thumb_func_start ov01_021F69A4
ov01_021F69A4: ; 0x021F69A4
	push {r3, lr}
	ldrb r0, [r0]
	lsl r1, r0, #4
	ldr r0, _021F69BC ; =ov01_02206C60 + 12
	ldr r0, [r0, r1]
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _021F69BA
	bl UnloadOverlayByID
_021F69BA:
	pop {r3, pc}
	.balign 4, 0
_021F69BC: .word ov01_02206C60 + 12
	thumb_func_end ov01_021F69A4

	thumb_func_start ov01_021F69C0
ov01_021F69C0: ; 0x021F69C0
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r1, #0
	ldrb r0, [r4, #1]
	cmp r0, #7
	bhi _021F6A8E
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021F69D8: ; jump table
	.short _021F69E8 - _021F69D8 - 2 ; case 0
	.short _021F6A8E - _021F69D8 - 2 ; case 1
	.short _021F69F6 - _021F69D8 - 2 ; case 2
	.short _021F6A14 - _021F69D8 - 2 ; case 3
	.short _021F6A24 - _021F69D8 - 2 ; case 4
	.short _021F6A3C - _021F69D8 - 2 ; case 5
	.short _021F6A60 - _021F69D8 - 2 ; case 6
	.short _021F6A82 - _021F69D8 - 2 ; case 7
_021F69E8:
	add r0, r4, #0
	bl ov01_021F6968
	mov r0, #1
	add sp, #0xc
	strb r0, [r4, #1]
	pop {r3, r4, pc}
_021F69F6:
	mov r0, #2
	mov r1, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #4
	add r2, r1, #0
	add r3, r1, #0
	str r0, [sp, #8]
	bl BeginNormalPaletteFade
	mov r0, #3
	add sp, #0xc
	strb r0, [r4, #1]
	pop {r3, r4, pc}
_021F6A14:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021F6A8E
	mov r0, #4
	add sp, #0xc
	strb r0, [r4, #1]
	pop {r3, r4, pc}
_021F6A24:
	ldrb r2, [r4]
	ldr r0, [r4, #8]
	ldr r1, [r4, #4]
	lsl r3, r2, #4
	ldr r2, _021F6A94 ; =ov01_02206C60 + 4
	ldr r0, [r0, #8]
	ldr r2, [r2, r3]
	blx r2
	mov r0, #5
	add sp, #0xc
	strb r0, [r4, #1]
	pop {r3, r4, pc}
_021F6A3C:
	ldrb r1, [r4]
	ldr r0, [r4, #8]
	lsl r2, r1, #4
	ldr r1, _021F6A98 ; =ov01_02206C60 + 8
	ldr r0, [r0, #8]
	ldr r1, [r1, r2]
	blx r1
	cmp r0, #1
	bne _021F6A8E
	add r0, r4, #0
	bl ov01_021F69A4
	ldrb r0, [r4, #2]
	add sp, #0xc
	strb r0, [r4]
	mov r0, #6
	strb r0, [r4, #1]
	pop {r3, r4, pc}
_021F6A60:
	add r0, r4, #0
	bl ov01_021F6968
	mov r0, #2
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #4
	add r2, r1, #0
	mov r3, #0
	str r0, [sp, #8]
	bl BeginNormalPaletteFade
	mov r0, #7
	add sp, #0xc
	strb r0, [r4, #1]
	pop {r3, r4, pc}
_021F6A82:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021F6A8E
	mov r0, #1
	strb r0, [r4, #1]
_021F6A8E:
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_021F6A94: .word ov01_02206C60 + 4
_021F6A98: .word ov01_02206C60 + 8
	thumb_func_end ov01_021F69C0

	thumb_func_start ov01_021F6A9C
ov01_021F6A9C: ; 0x021F6A9C
	push {r3, r4, r5, lr}
	add r0, #0xd8
	ldr r0, [r0]
	add r5, r1, #0
	add r4, r2, #0
	bl sub_0201F988
	ldrb r1, [r0, #1]
	cmp r1, #1
	bne _021F6AB8
	mov r1, #2
	strb r1, [r0, #1]
	strb r5, [r0, #2]
	str r4, [r0, #0xc]
_021F6AB8:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021F6A9C

	thumb_func_start ov01_021F6ABC
ov01_021F6ABC: ; 0x021F6ABC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, #0xd8
	ldr r0, [r0]
	add r6, r1, #0
	add r7, r2, #0
	str r3, [sp]
	bl sub_0201F988
	ldr r0, [r0, #4]
	bl sub_0201F988
	add r4, r0, #0
	add r0, r5, #0
	bl ov01_021F6B00
	cmp r6, r0
	beq _021F6AE4
	bl GF_AssertFail
_021F6AE4:
	ldr r0, [sp]
	str r7, [r4]
	str r0, [r4, #4]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov01_021F6ABC

	thumb_func_start ov01_021F6AEC
ov01_021F6AEC: ; 0x021F6AEC
	push {r3, lr}
	add r0, #0xd8
	ldr r0, [r0]
	bl sub_0201F988
	ldr r0, [r0, #4]
	bl sub_0201F988
	ldr r0, [r0]
	pop {r3, pc}
	thumb_func_end ov01_021F6AEC

	thumb_func_start ov01_021F6B00
ov01_021F6B00: ; 0x021F6B00
	push {r3, lr}
	add r0, #0xd8
	ldr r0, [r0]
	bl sub_0201F988
	ldrb r0, [r0]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov01_021F6B00

	thumb_func_start ov01_021F6B10
ov01_021F6B10: ; 0x021F6B10
	push {r3, lr}
	add r0, #0xd8
	ldr r0, [r0]
	bl sub_0201F988
	ldrb r0, [r0, #1]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov01_021F6B10

	thumb_func_start ov01_021F6B20
ov01_021F6B20: ; 0x021F6B20
	push {r3, lr}
	add r0, #0xd8
	ldr r0, [r0]
	bl sub_0201F988
	ldr r0, [r0, #4]
	bl sub_0201F988
	add r0, #0xc
	pop {r3, pc}
	thumb_func_end ov01_021F6B20

	thumb_func_start ov01_021F6B34
ov01_021F6B34: ; 0x021F6B34
	push {r3, r4, r5, lr}
	add r0, #0xd8
	ldr r0, [r0]
	add r5, r1, #0
	add r4, r2, #0
	bl sub_0201F988
	ldr r0, [r0, #4]
	add r1, r5, #0
	add r2, r4, #0
	bl ov27_0225C41C
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021F6B34

	thumb_func_start ov01_021F6B50
ov01_021F6B50: ; 0x021F6B50
	push {r3, lr}
	add r0, #0xd8
	ldr r0, [r0]
	bl sub_0201F988
	ldr r0, [r0, #4]
	bl ov27_0225A2CC
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov01_021F6B50

	thumb_func_start ov01_021F6B64
ov01_021F6B64: ; 0x021F6B64
	push {r3, r4, r5, lr}
	add r0, #0xd8
	ldr r0, [r0]
	add r5, r1, #0
	bl sub_0201F988
	add r4, r0, #0
	cmp r5, #0
	ble _021F6B7A
	cmp r5, #3
	blt _021F6B7E
_021F6B7A:
	bl GF_AssertFail
_021F6B7E:
	ldr r0, [r4, #4]
	add r1, r5, #0
	bl ov27_0225A2EC
	pop {r3, r4, r5, pc}
	thumb_func_end ov01_021F6B64

	thumb_func_start ov01_021F6B88
ov01_021F6B88: ; 0x021F6B88
	push {r4, lr}
	add r4, r2, #0
	add r0, r4, #0
	bl ov34_0225D7A8
	add r1, r4, #0
	add r1, #0xdc
	add r4, #0xdc
	str r0, [r1]
	ldr r0, [r4]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021F6B88

	thumb_func_start ov01_021F6BA0
ov01_021F6BA0: ; 0x021F6BA0
	ldr r3, _021F6BA8 ; =ov34_0225D87C
	add r0, r1, #0
	bx r3
	nop
_021F6BA8: .word ov34_0225D87C
	thumb_func_end ov01_021F6BA0

	thumb_func_start ov01_021F6BAC
ov01_021F6BAC: ; 0x021F6BAC
	mov r0, #1
	bx lr
	thumb_func_end ov01_021F6BAC

	thumb_func_start ov01_021F6BB0
ov01_021F6BB0: ; 0x021F6BB0
	ldr r3, _021F6BCC ; =ov01_02206C08
	mov r2, #0
_021F6BB4:
	ldrh r1, [r3]
	cmp r0, r1
	bne _021F6BBE
	mov r0, #1
	bx lr
_021F6BBE:
	add r2, r2, #1
	add r3, r3, #2
	cmp r2, #0x2b
	blo _021F6BB4
	mov r0, #0
	bx lr
	nop
_021F6BCC: .word ov01_02206C08
	thumb_func_end ov01_021F6BB0

	thumb_func_start ov01_021F6BD0
ov01_021F6BD0: ; 0x021F6BD0
	ldr r1, _021F6C18 ; =0x00001B58
	cmp r0, r1
	blt _021F6BE0
	ldr r1, _021F6C1C ; =0x0000225F
	cmp r0, r1
	bgt _021F6BE0
	mov r0, #1
	bx lr
_021F6BE0:
	mov r1, #0xaf
	lsl r1, r1, #4
	cmp r0, r1
	blt _021F6BF2
	add r1, #0xc7
	cmp r0, r1
	bgt _021F6BF2
	mov r0, #1
	bx lr
_021F6BF2:
	ldr r1, _021F6C20 ; =0x00002710
	cmp r0, r1
	blt _021F6C02
	add r1, #0x63
	cmp r0, r1
	bgt _021F6C02
	mov r0, #1
	bx lr
_021F6C02:
	ldr r1, _021F6C24 ; =0x00002774
	cmp r0, r1
	blt _021F6C12
	add r1, #0x31
	cmp r0, r1
	bgt _021F6C12
	mov r0, #1
	bx lr
_021F6C12:
	mov r0, #0
	bx lr
	nop
_021F6C18: .word 0x00001B58
_021F6C1C: .word 0x0000225F
_021F6C20: .word 0x00002710
_021F6C24: .word 0x00002774
	thumb_func_end ov01_021F6BD0

	thumb_func_start ov01_021F6C28
ov01_021F6C28: ; 0x021F6C28
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x30]
	bl ov01_021F6B00
	add r4, r0, #0
	ldr r0, [r5, #0x30]
	bl ov01_021F6B10
	cmp r4, #6
	bne _021F6C46
	cmp r0, #1
	bne _021F6C46
	mov r0, #1
	pop {r3, r4, r5, pc}
_021F6C46:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021F6C28

	thumb_func_start ov01_021F6C4C
ov01_021F6C4C: ; 0x021F6C4C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x30]
	bl ov01_021F6B00
	add r4, r0, #0
	ldr r0, [r5, #0x30]
	bl ov01_021F6B10
	cmp r4, #3
	bne _021F6C78
	cmp r0, #1
	bne _021F6C78
	ldr r0, [r5, #0x30]
	mov r1, #3
	add r5, #0x90
	add r2, r1, #0
	add r3, r5, #0
	bl ov01_021F6ABC
	mov r0, #1
	pop {r3, r4, r5, pc}
_021F6C78:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov01_021F6C4C

	thumb_func_start ov01_021F6C7C
ov01_021F6C7C: ; 0x021F6C7C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x30]
	bl ov01_021F6B00
	add r4, r0, #0
	ldr r0, [r5, #0x30]
	bl ov01_021F6AEC
	cmp r4, #3
	bne _021F6C9A
	cmp r0, #6
	bne _021F6C9A
	mov r0, #1
	pop {r3, r4, r5, pc}
_021F6C9A:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021F6C7C

	thumb_func_start ov01_021F6CA0
ov01_021F6CA0: ; 0x021F6CA0
	push {r4, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x98
	ldrh r1, [r1]
	cmp r1, #0
	beq _021F6CB8
	cmp r1, #1
	beq _021F6CD0
	cmp r1, #2
	beq _021F6CE6
	b _021F6CF6
_021F6CB8:
	ldr r0, [r4, #0x30]
	mov r1, #3
	mov r2, #0
	bl ov01_021F6A9C
	add r0, r4, #0
	add r0, #0x98
	ldrh r0, [r0]
	add r4, #0x98
	add r0, r0, #1
	strh r0, [r4]
	b _021F6CF6
_021F6CD0:
	bl ov01_021F6C4C
	cmp r0, #1
	bne _021F6CF6
	add r0, r4, #0
	add r0, #0x98
	ldrh r0, [r0]
	add r4, #0x98
	add r0, r0, #1
	strh r0, [r4]
	b _021F6CF6
_021F6CE6:
	bl ov01_021F6C7C
	cmp r0, #1
	bne _021F6CF6
	mov r0, #0
	add r4, #0x98
	strh r0, [r4]
	pop {r4, pc}
_021F6CF6:
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021F6CA0

	.rodata

ov01_02206C08: ; 0x02206C08
	.short 0x0196, 0x015E, 0x018C, 0x0199
	.short 0x019A, 0x019B, 0x019C, 0x019D, 0x0193, 0x0194, 0x0054, 0x0055
	.short 0x0056, 0x0057, 0x0106, 0x017D, 0x011F, 0x017B, 0x018D, 0x018E
	.short 0x018F, 0x0190, 0x0191, 0x0192, 0x0120, 0x00B7, 0x0121, 0x0122
	.short 0x0123, 0x0124, 0x015D, 0x0178, 0x00D2, 0x017C, 0x00EA, 0x0106
	.short 0x00FB, 0x00FC, 0x00FD, 0x00FE, 0x00FF, 0x0100, 0x0101, 0x0000

ov01_02206C60: ; 0x02206C60
	.word ov27_02259F80, ov27_0225A19C, ov27_0225A2C8, 0xFFFFFFFF
	.word ov30_0225D520, ov30_0225D64C, ov30_0225D6FC, FS_OVERLAY_ID(touch_save_app)
	.word ov31_0225D520, ov31_0225D710, ov31_0225D758, FS_OVERLAY_ID(OVY_31)
	.word ov27_0225C250, ov27_0225C398, ov27_0225C418, 0xFFFFFFFF
	.word ov28_0225D520, ov28_0225D5EC, ov28_0225D624, FS_OVERLAY_ID(OVY_28)
	.word ov29_0225D520, ov29_0225D5EC, ov29_0225D61C, FS_OVERLAY_ID(OVY_29)
	.word ov32_0225D520, ov32_0225D5CC, ov32_0225D608, FS_OVERLAY_ID(OVY_32)
	.word ov33_0225D520, ov33_0225D5A8, ov33_0225D5CC, FS_OVERLAY_ID(OVY_33)
	.word ov01_021F6B88, ov01_021F6BA0, ov01_021F6BAC, FS_OVERLAY_ID(OVY_34)
