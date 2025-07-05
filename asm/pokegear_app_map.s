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
	.extern ov101_021E94C0
	.extern ov101_021E990C
	.extern ov101_021E9B70
	.extern ov101_021EA4D0
	.extern ov101_021EA608
	.extern ov101_021EA794
	.extern ov101_021EA8A8
	.extern ov101_021EAD90
	.extern ov101_021EAE54
	.extern ov101_021EAF40
	.extern ov101_021EB1E0
	.extern ov101_021EB2FC
	.extern ov101_021EB338
	.extern ov101_021EB364
	.extern ov101_021EB4C4
	.extern ov101_021EB94C
	.extern ov101_021EBC1C
	.extern ov101_021EC0AC
	.extern ov101_021EC304
	.extern ov101_021ECA30
	.extern ov101_021ECA84
	.extern ov101_021F7372

	thumb_func_start ov101_021ECC58
ov101_021ECC58: ; 0x021ECC58
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r0, #0
	add r0, #0x84
	ldr r0, [r0]
	add r6, r1, #0
	ldr r7, [r0, #8]
	bl System_GetTouchHeld
	cmp r0, #0
	bne _021ECC76
	mov r0, #0
	add sp, #0x1c
	mvn r0, r0
	pop {r4, r5, r6, r7, pc}
_021ECC76:
	ldr r0, _021ECE44 ; =0x00000139
	ldrb r0, [r5, r0]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	beq _021ECC88
	mov r0, #0
	add sp, #0x1c
	mvn r0, r0
	pop {r4, r5, r6, r7, pc}
_021ECC88:
	ldr r0, _021ECE48 ; =ov101_021F7EF4
	bl TouchscreenHitbox_FindRectAtTouchNew
	add r4, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	bne _021ECC9A
	b _021ECE3E
_021ECC9A:
	mov r1, #1
	str r1, [r6]
	cmp r4, #0x10
	bne _021ECCF4
	mov r0, #0x5f
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #6
	str r1, [sp]
	mov r1, #5
	str r1, [sp, #4]
	add r1, r0, #0
	add r1, #0xc
	str r1, [sp, #8]
	mov r1, #7
	str r1, [sp, #0xc]
	mov r1, #0x10
	str r1, [sp, #0x10]
	ldrh r1, [r0]
	mov r2, #0x17
	mov r3, #8
	lsl r1, r1, #0x15
	lsr r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	mov r1, #2
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x74]
	bl CopyToBgTilemapRect
	ldr r0, [r5, #0x10]
	mov r1, #2
	ldr r0, [r0, #0x74]
	bl ScheduleBgTilemapBufferTransfer
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	add sp, #0x1c
	mov r0, #0xa
	pop {r4, r5, r6, r7, pc}
_021ECCF4:
	cmp r4, #8
	blt _021ECD3C
	ldr r0, _021ECE44 ; =0x00000139
	mov r3, #0xf0
	ldrb r2, [r5, r0]
	bic r2, r3
	add r3, r4, #0
	sub r3, #8
	lsl r3, r3, #0x18
	lsr r3, r3, #0x18
	lsl r3, r3, #0x1c
	lsr r3, r3, #0x18
	orr r2, r3
	strb r2, [r5, r0]
	add r2, r0, #3
	ldrb r3, [r5, r2]
	mov r2, #0x7f
	add r0, r0, #3
	bic r3, r2
	add r2, r3, #0
	orr r2, r1
	strb r2, [r5, r0]
	add r4, #0x14
	mov r0, #0x28
	mul r0, r4
	add r0, r7, r0
	ldr r0, [r0, #0x20]
	bl thunk_Sprite_SetDrawPriority
	ldr r0, _021ECE4C ; =0x00000947
	bl PlaySE
	mov r0, #0
	add sp, #0x1c
	mvn r0, r0
	pop {r4, r5, r6, r7, pc}
_021ECD3C:
	lsl r1, r4, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl ov101_021ECA30
	cmp r0, #0
	beq _021ECE12
	lsr r0, r4, #0x1f
	add r0, r4, r0
	lsl r0, r0, #0xf
	lsr r6, r0, #0x10
	lsr r2, r4, #0x1f
	lsl r0, r4, #0x1f
	sub r0, r0, r2
	mov r1, #0x1f
	ror r0, r1
	add r0, r2, r0
	bne _021ECD92
	ldr r2, _021ECE44 ; =0x00000139
	mov r1, #0xf0
	ldrb r0, [r5, r2]
	bic r0, r1
	lsl r1, r6, #0x18
	lsr r1, r1, #0x18
	lsl r1, r1, #0x1c
	lsr r1, r1, #0x18
	orr r0, r1
	strb r0, [r5, r2]
	mov r1, #0
	add r0, r2, #7
	strh r1, [r5, r0]
	ldrsh r1, [r5, r0]
	add r0, r2, #5
	add r6, #0x14
	strh r1, [r5, r0]
	mov r0, #0x28
	mul r0, r6
	add r0, r7, r0
	ldr r0, [r0, #0x20]
	mov r1, #1
	bl thunk_Sprite_SetDrawPriority
	b _021ECDF4
_021ECD92:
	ldr r0, _021ECE44 ; =0x00000139
	mov r3, #0xf0
	ldrb r2, [r5, r0]
	bic r2, r3
	add r3, r6, #4
	lsl r3, r3, #0x18
	lsr r3, r3, #0x18
	lsl r3, r3, #0x1c
	lsr r3, r3, #0x18
	orr r2, r3
	strb r2, [r5, r0]
	lsr r2, r6, #0x1f
	lsl r0, r6, #0x1f
	sub r0, r0, r2
	ror r0, r1
	add r1, r2, r0
	add r2, r1, #0
	ldr r1, _021ECE50 ; =gSystem + 0x40
	mov r0, #0x68
	mul r2, r0
	ldrh r3, [r1, #0x20]
	add r2, #0x28
	sub r3, r2, r3
	add r2, r0, #0
	add r2, #0xd6
	strh r3, [r5, r2]
	lsr r2, r6, #1
	mov r3, #0x15
	mul r3, r2
	ldrh r1, [r1, #0x22]
	add r3, #0x1f
	add r0, #0xd8
	sub r1, r3, r1
	strh r1, [r5, r0]
	add r1, r6, #0
	add r1, #0x18
	mov r0, #0x28
	mul r0, r1
	add r0, r7, r0
	ldr r0, [r0, #0x20]
	mov r1, #1
	bl thunk_Sprite_SetDrawPriority
	lsl r0, r6, #4
	add r0, r5, r0
	ldr r0, [r0, #0x44]
	mov r1, #0
	bl sub_02013820
_021ECDF4:
	mov r1, #0x4f
	lsl r1, r1, #2
	ldrb r2, [r5, r1]
	mov r0, #0x7f
	bic r2, r0
	mov r0, #2
	orr r0, r2
	strb r0, [r5, r1]
	ldr r0, _021ECE4C ; =0x00000947
	bl PlaySE
	mov r0, #0
	add sp, #0x1c
	mvn r0, r0
	pop {r4, r5, r6, r7, pc}
_021ECE12:
	lsr r2, r4, #0x1f
	lsl r1, r4, #0x1f
	sub r1, r1, r2
	mov r0, #0x1f
	ror r1, r0
	add r1, r2, r1
	cmp r1, #1
	bne _021ECE3C
	add r2, r4, r2
	asr r1, r2, #1
	strh r1, [r5, #0x16]
	add r0, #0xf9
	ldr r0, [r5, r0]
	ldrh r0, [r0]
	strh r0, [r5, #0x2c]
	ldr r0, _021ECE54 ; =0x00000941
	bl PlaySE
	add sp, #0x1c
	mov r0, #0xb
	pop {r4, r5, r6, r7, pc}
_021ECE3C:
	sub r0, #0x20
_021ECE3E:
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_021ECE44: .word 0x00000139
_021ECE48: .word ov101_021F7EF4
_021ECE4C: .word 0x00000947
_021ECE50: .word gSystem + 0x40
_021ECE54: .word 0x00000941
	thumb_func_end ov101_021ECC58

	thumb_func_start ov101_021ECE58
ov101_021ECE58: ; 0x021ECE58
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x10]
	mov r1, #0
	ldr r0, [r0, #0x7c]
	bl ov100_021E73C8
	ldr r0, [r4, #0x10]
	ldr r1, _021ECEA4 ; =0x0000FFFF
	ldr r0, [r0, #0x7c]
	mov r2, #0
	bl PokegearAppSwitchCursor_SetCursorSpritesDrawState
	ldr r0, [r4, #0x10]
	mov r1, #1
	ldr r0, [r0, #0x7c]
	bl PokegearAppSwitch_GetSpecCursorPos
	add r2, r0, #0
	ldr r0, [r4, #0x10]
	mov r1, #1
	ldr r0, [r0, #0x7c]
	bl PokegearAppSwitch_SetSpecIndexAndCursorPos
	ldr r0, [r4, #0x10]
	ldr r1, _021ECEA4 ; =0x0000FFFF
	ldr r0, [r0, #0x7c]
	mov r2, #1
	bl PokegearAppSwitch_SetCursorSpritesAnimateFlag
	mov r1, #0x4f
	lsl r1, r1, #2
	ldrb r2, [r4, r1]
	mov r0, #0x7f
	bic r2, r0
	strb r2, [r4, r1]
	pop {r4, pc}
	nop
_021ECEA4: .word 0x0000FFFF
	thumb_func_end ov101_021ECE58

	thumb_func_start ov101_021ECEA8
ov101_021ECEA8: ; 0x021ECEA8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _021ECF8C ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r0, r1
	beq _021ECF06
	ldr r0, _021ECF90 ; =0x00000941
	bl PlaySE
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x7c]
	bl PokegearAppSwitch_GetCursorPos
	add r6, r0, #0
	ldr r0, [r5, #0x10]
	mov r1, #1
	ldr r0, [r0, #0x7c]
	bl PokegearAppSwitch_GetSpecCursorPos
	mov r1, #0x47
	lsl r1, r1, #2
	add r4, r0, #0
	ldr r0, [r5, r1]
	cmp r0, #0
	bne _021ECEEE
	sub r1, r1, #4
	ldr r1, [r5, r1]
	add r0, r5, #0
	ldrh r1, [r1]
	bl ov101_021ED64C
	mov r1, #0x47
	lsl r1, r1, #2
	str r0, [r5, r1]
_021ECEEE:
	mov r0, #0x47
	lsl r0, r0, #2
	lsl r1, r4, #0x17
	ldr r0, [r5, r0]
	lsr r1, r1, #0x18
	add r2, r6, #0
	bl ov101_021ED750
	add r0, r5, #0
	mov r1, #0
	bl ov101_021EAE54
_021ECF06:
	ldr r0, _021ECF8C ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #2
	tst r0, r1
	beq _021ECF24
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	add r0, r5, #0
	bl ov101_021ECE58
	mov r0, #0
	mvn r0, r0
	pop {r4, r5, r6, pc}
_021ECF24:
	bl System_GetTouchNew
	cmp r0, #0
	beq _021ECF54
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	add r0, r5, #0
	bl ov101_021ECE58
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0xc]
	cmp r0, #1
	beq _021ECF4E
	add r0, r5, #0
	bl ov101_021EB364
	ldr r0, [r5, #0x10]
	mov r1, #1
	str r1, [r0, #0xc]
_021ECF4E:
	mov r0, #0
	mvn r0, r0
	pop {r4, r5, r6, pc}
_021ECF54:
	ldr r0, _021ECF8C ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #0x20
	tst r0, r1
	beq _021ECF70
	ldr r0, _021ECF94 ; =0x0000093F
	bl PlaySE
	ldr r0, [r5, #0x10]
	mov r1, #0
	ldr r0, [r0, #0x7c]
	bl ov100_021E73AC
	b _021ECF86
_021ECF70:
	mov r0, #0x10
	tst r0, r1
	beq _021ECF86
	ldr r0, _021ECF94 ; =0x0000093F
	bl PlaySE
	ldr r0, [r5, #0x10]
	mov r1, #1
	ldr r0, [r0, #0x7c]
	bl ov100_021E73AC
_021ECF86:
	mov r0, #0
	mvn r0, r0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021ECF8C: .word gSystem
_021ECF90: .word 0x00000941
_021ECF94: .word 0x0000093F
	thumb_func_end ov101_021ECEA8

	thumb_func_start ov101_021ECF98
ov101_021ECF98: ; 0x021ECF98
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl System_GetTouchHeld
	cmp r0, #0
	beq _021ECFA6
	b _021ED0C8
_021ECFA6:
	ldr r2, _021ED100 ; =gSystem + 0x40
	ldr r0, _021ED104 ; =ov101_021F7EB8
	ldrh r1, [r2, #0x20]
	ldrh r2, [r2, #0x22]
	bl TouchscreenHitbox_FindHitboxAtPoint
	add r5, r0, #0
	ldr r0, _021ED108 ; =0x00000948
	bl PlaySE
	mov r0, #0
	mvn r0, r0
	cmp r5, r0
	bne _021ED028
	ldr r0, _021ED10C ; =0x00000139
	add r1, r4, #0
	ldrb r0, [r4, r0]
	add r1, #0x84
	ldr r1, [r1]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1c
	add r2, r0, #0
	ldr r3, [r1, #8]
	add r2, #0x1c
	mov r1, #0x28
	mul r1, r2
	add r2, r3, r1
	mov r1, #0x18
	mul r1, r0
	add r1, #0x28
	strh r1, [r2, #4]
	mov r0, #0x84
	strh r0, [r2, #6]
	mov r1, #4
	mov r3, #6
	ldr r0, [r2, #0x20]
	ldrsh r1, [r2, r1]
	ldrsh r2, [r2, r3]
	bl Sprite_SetPositionXY
	ldr r1, _021ED10C ; =0x00000139
	add r0, r4, #0
	ldrb r1, [r4, r1]
	add r0, #0x84
	ldr r0, [r0]
	lsl r1, r1, #0x18
	lsr r2, r1, #0x1c
	ldr r0, [r0, #8]
	add r2, #0x1c
	mov r1, #0x28
	mul r1, r2
	add r0, r0, r1
	ldr r0, [r0, #0x20]
	mov r1, #4
	bl thunk_Sprite_SetDrawPriority
	mov r1, #0x4f
	lsl r1, r1, #2
	ldrb r2, [r4, r1]
	mov r0, #0x7f
	bic r2, r0
	mov r0, #0
	strb r2, [r4, r1]
	mvn r0, r0
	pop {r3, r4, r5, pc}
_021ED028:
	mov r1, #0x47
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	cmp r0, #0
	bne _021ED044
	sub r1, r1, #4
	ldr r1, [r4, r1]
	add r0, r4, #0
	ldrh r1, [r1]
	bl ov101_021ED64C
	mov r1, #0x47
	lsl r1, r1, #2
	str r0, [r4, r1]
_021ED044:
	mov r2, #0x47
	lsl r2, r2, #2
	ldr r0, [r4, r2]
	add r2, #0x1d
	ldrb r2, [r4, r2]
	lsl r1, r5, #0x18
	lsr r1, r1, #0x18
	lsl r2, r2, #0x18
	lsr r2, r2, #0x1c
	bl ov101_021ED750
	add r0, r4, #0
	mov r1, #0
	bl ov101_021EAE54
	ldr r0, _021ED10C ; =0x00000139
	add r1, r4, #0
	ldrb r0, [r4, r0]
	add r1, #0x84
	ldr r1, [r1]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1c
	add r2, r0, #0
	ldr r3, [r1, #8]
	add r2, #0x1c
	mov r1, #0x28
	mul r1, r2
	add r2, r3, r1
	mov r1, #0x18
	mul r1, r0
	add r1, #0x28
	strh r1, [r2, #4]
	mov r0, #0x84
	strh r0, [r2, #6]
	mov r1, #4
	mov r3, #6
	ldr r0, [r2, #0x20]
	ldrsh r1, [r2, r1]
	ldrsh r2, [r2, r3]
	bl Sprite_SetPositionXY
	ldr r1, _021ED10C ; =0x00000139
	add r0, r4, #0
	ldrb r1, [r4, r1]
	add r0, #0x84
	ldr r0, [r0]
	lsl r1, r1, #0x18
	lsr r2, r1, #0x1c
	ldr r0, [r0, #8]
	add r2, #0x1c
	mov r1, #0x28
	mul r1, r2
	add r0, r0, r1
	ldr r0, [r0, #0x20]
	mov r1, #4
	bl thunk_Sprite_SetDrawPriority
	mov r1, #0x4f
	lsl r1, r1, #2
	ldrb r2, [r4, r1]
	mov r0, #0x7f
	bic r2, r0
	mov r0, #0
	strb r2, [r4, r1]
	mvn r0, r0
	pop {r3, r4, r5, pc}
_021ED0C8:
	ldr r2, _021ED10C ; =0x00000139
	add r1, r4, #0
	ldrb r2, [r4, r2]
	add r1, #0x84
	ldr r0, _021ED100 ; =gSystem + 0x40
	ldr r1, [r1]
	lsl r2, r2, #0x18
	lsr r4, r2, #0x1c
	ldrh r3, [r0, #0x22]
	ldr r1, [r1, #8]
	add r4, #0x1c
	mov r2, #0x28
	mul r2, r4
	add r2, r1, r2
	ldrh r0, [r0, #0x20]
	mov r1, #4
	strh r0, [r2, #4]
	strh r3, [r2, #6]
	mov r3, #6
	ldr r0, [r2, #0x20]
	ldrsh r1, [r2, r1]
	ldrsh r2, [r2, r3]
	bl Sprite_SetPositionXY
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
	nop
_021ED100: .word gSystem + 0x40
_021ED104: .word ov101_021F7EB8
_021ED108: .word 0x00000948
_021ED10C: .word 0x00000139
	thumb_func_end ov101_021ECF98

	thumb_func_start ov101_021ED110
ov101_021ED110: ; 0x021ED110
	push {r4, lr}
	add r4, r0, #0
	cmp r1, #0
	bne _021ED126
	mov r0, #0x47
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r1, r2, #0
	bl ov101_021ED760
	b _021ED132
_021ED126:
	mov r0, #0x47
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r1, r2, #0
	bl ov101_021ED7B0
_021ED132:
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #0
	bne _021ED14E
	mov r1, #0x47
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	add r0, r4, #0
	bl ov101_021ED6B8
	mov r0, #0x47
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
_021ED14E:
	add r0, r4, #0
	mov r1, #0
	bl ov101_021EAE54
	pop {r4, pc}
	thumb_func_end ov101_021ED110

	thumb_func_start ov101_021ED158
ov101_021ED158: ; 0x021ED158
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, _021ED1FC ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r0, r1
	beq _021ED1A0
	ldr r0, _021ED200 ; =0x00000946
	bl PlaySE
	ldr r0, [r4, #0x10]
	mov r1, #1
	ldr r0, [r0, #0x7c]
	bl PokegearAppSwitch_GetSpecCursorPos
	add r2, r0, #0
	lsr r5, r2, #0x1f
	lsl r3, r2, #0x1f
	lsl r2, r2, #0x17
	sub r3, r3, r5
	mov r1, #0x1f
	ror r3, r1
	add r1, r5, r3
	lsl r1, r1, #0x18
	add r0, r4, #0
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
	bl ov101_021ED110
	add r0, r4, #0
	bl ov101_021ECE58
	add r0, r4, #0
	mov r1, #0
	bl ov101_021ECA84
_021ED1A0:
	ldr r0, _021ED1FC ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #2
	tst r0, r1
	beq _021ED1C2
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	add r0, r4, #0
	bl ov101_021ECE58
	add r0, r4, #0
	mov r1, #0
	bl ov101_021ECA84
	b _021ED1F4
_021ED1C2:
	bl System_GetTouchNew
	cmp r0, #0
	beq _021ED1F4
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	add r0, r4, #0
	bl ov101_021ECE58
	add r0, r4, #0
	mov r1, #0
	bl ov101_021ECA84
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0xc]
	cmp r0, #1
	beq _021ED1F4
	add r0, r4, #0
	bl ov101_021EB364
	ldr r0, [r4, #0x10]
	mov r1, #1
	str r1, [r0, #0xc]
_021ED1F4:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
	nop
_021ED1FC: .word gSystem
_021ED200: .word 0x00000946
	thumb_func_end ov101_021ED158

	thumb_func_start ov101_021ED204
ov101_021ED204: ; 0x021ED204
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r0, #0x84
	ldr r0, [r0]
	cmp r1, #4
	ldr r5, [r0, #8]
	bhs _021ED25C
	ldr r0, _021ED2BC ; =0x00000139
	mov r1, #0x28
	ldrb r0, [r6, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1c
	add r2, r0, #0
	add r2, #0x14
	add r4, r2, #0
	lsr r6, r0, #0x1f
	lsl r3, r0, #0x1f
	sub r3, r3, r6
	mov r2, #0x1f
	ror r3, r2
	mul r4, r1
	add r3, r6, r3
	mov r2, #0x68
	mul r2, r3
	lsr r3, r0, #1
	mov r0, #0x15
	mul r0, r3
	add r1, r5, #4
	add r2, #0x20
	strh r2, [r1, r4]
	add r2, r5, #6
	add r0, #0x20
	strh r0, [r2, r4]
	add r5, #0x20
	ldrsh r1, [r1, r4]
	ldrsh r2, [r2, r4]
	ldr r0, [r5, r4]
	bl Sprite_SetPositionXY
	ldr r0, [r5, r4]
	mov r1, #4
	bl thunk_Sprite_SetDrawPriority
	pop {r3, r4, r5, r6, r7, pc}
_021ED25C:
	sub r0, r1, #4
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
	add r1, r7, #0
	add r1, #0x18
	add r4, r1, #0
	mov r0, #0x28
	mul r4, r0
	lsr r3, r7, #0x1f
	lsl r2, r7, #0x1f
	sub r2, r2, r3
	mov r0, #0x1f
	ror r2, r0
	add r2, r3, r2
	mov r0, #0x68
	mul r0, r2
	add r1, r5, #4
	add r0, #0x28
	strh r0, [r1, r4]
	add r2, r5, #6
	lsr r3, r7, #1
	mov r0, #0x15
	mul r0, r3
	add r0, #0x1f
	strh r0, [r2, r4]
	add r5, #0x20
	ldrsh r1, [r1, r4]
	ldrsh r2, [r2, r4]
	ldr r0, [r5, r4]
	bl Sprite_SetPositionXY
	ldr r0, [r5, r4]
	mov r1, #4
	bl thunk_Sprite_SetDrawPriority
	mov r1, #4
	add r2, r1, #0
	add r6, #0x44
	lsl r4, r7, #4
	ldr r0, [r6, r4]
	sub r2, #0xa
	bl sub_020136B4
	ldr r0, [r6, r4]
	mov r1, #3
	bl sub_02013820
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021ED2BC: .word 0x00000139
	thumb_func_end ov101_021ED204

	thumb_func_start ov101_021ED2C0
ov101_021ED2C0: ; 0x021ED2C0
	push {r4, r5, r6, lr}
	add r4, r0, #0
	bl System_GetTouchHeld
	cmp r0, #0
	beq _021ED2CE
	b _021ED3F8
_021ED2CE:
	ldr r2, _021ED480 ; =gSystem + 0x40
	ldr r0, _021ED484 ; =ov101_021F7ECC
	ldrh r1, [r2, #0x20]
	ldrh r2, [r2, #0x22]
	bl TouchscreenHitbox_FindHitboxAtPoint
	add r2, r0, #0
	cmp r2, #8
	bne _021ED330
	ldr r0, _021ED488 ; =0x00000139
	ldrb r0, [r4, r0]
	lsl r0, r0, #0x18
	lsr r2, r0, #0x1c
	lsr r5, r2, #0x1f
	lsl r3, r2, #0x1e
	lsl r1, r2, #0x16
	sub r3, r3, r5
	mov r2, #0x1e
	ror r3, r2
	add r2, r5, r3
	lsl r2, r2, #0x18
	add r0, r4, #0
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
	bl ov101_021ED110
	ldr r1, _021ED488 ; =0x00000139
	add r0, r4, #0
	ldrb r1, [r4, r1]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x1c
	bl ov101_021ED204
	add r0, r4, #0
	mov r1, #0
	bl ov101_021ECA84
	ldr r0, _021ED48C ; =0x00000946
	bl PlaySE
	mov r1, #0x4f
	lsl r1, r1, #2
	ldrb r2, [r4, r1]
	mov r0, #0x7f
	bic r2, r0
	mov r0, #0
	strb r2, [r4, r1]
	mvn r0, r0
	pop {r4, r5, r6, pc}
_021ED330:
	mov r0, #0
	mvn r0, r0
	cmp r2, r0
	beq _021ED352
	ldr r3, _021ED488 ; =0x00000139
	asr r0, r2, #1
	ldrb r1, [r4, r3]
	lsr r0, r0, #0x1e
	add r0, r2, r0
	lsl r1, r1, #0x18
	lsr r1, r1, #0x1c
	asr r0, r0, #2
	lsr r5, r1, #2
	cmp r5, r0
	bne _021ED352
	cmp r1, r2
	bne _021ED378
_021ED352:
	ldr r1, _021ED488 ; =0x00000139
	add r0, r4, #0
	ldrb r1, [r4, r1]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x1c
	bl ov101_021ED204
	ldr r0, _021ED490 ; =0x00000948
	bl PlaySE
	mov r1, #0x4f
	lsl r1, r1, #2
	ldrb r2, [r4, r1]
	mov r0, #0x7f
	bic r2, r0
	mov r0, #0
	strb r2, [r4, r1]
	mvn r0, r0
	pop {r4, r5, r6, pc}
_021ED378:
	cmp r0, #0
	bne _021ED3A4
	sub r3, #0x1d
	lsr r5, r1, #0x1f
	lsl r1, r1, #0x1e
	ldr r0, [r4, r3]
	sub r1, r1, r5
	mov r3, #0x1e
	ror r1, r3
	add r1, r5, r1
	lsr r5, r2, #0x1f
	lsl r2, r2, #0x1e
	sub r2, r2, r5
	ror r2, r3
	add r2, r5, r2
	lsl r1, r1, #0x18
	lsl r2, r2, #0x18
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
	bl ov101_021ED780
	b _021ED3CA
_021ED3A4:
	sub r3, #0x1d
	lsr r5, r1, #0x1f
	lsl r1, r1, #0x1e
	ldr r0, [r4, r3]
	sub r1, r1, r5
	mov r3, #0x1e
	ror r1, r3
	add r1, r5, r1
	lsr r5, r2, #0x1f
	lsl r2, r2, #0x1e
	sub r2, r2, r5
	ror r2, r3
	add r2, r5, r2
	lsl r1, r1, #0x18
	lsl r2, r2, #0x18
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
	bl ov101_021ED7D8
_021ED3CA:
	add r0, r4, #0
	mov r1, #0
	bl ov101_021EAE54
	ldr r1, _021ED488 ; =0x00000139
	add r0, r4, #0
	ldrb r1, [r4, r1]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x1c
	bl ov101_021ED204
	ldr r0, _021ED490 ; =0x00000948
	bl PlaySE
	mov r1, #0x4f
	lsl r1, r1, #2
	ldrb r2, [r4, r1]
	mov r0, #0x7f
	bic r2, r0
	mov r0, #0
	strb r2, [r4, r1]
	mvn r0, r0
	pop {r4, r5, r6, pc}
_021ED3F8:
	ldr r0, _021ED480 ; =gSystem + 0x40
	mov r5, #5
	lsl r5, r5, #6
	ldrh r2, [r0, #0x22]
	ldrsh r1, [r4, r5]
	add r3, r2, r1
	sub r2, r5, #7
	ldrb r2, [r4, r2]
	add r1, r4, #0
	add r1, #0x84
	ldr r1, [r1]
	lsl r2, r2, #0x18
	lsr r6, r2, #0x1c
	ldr r1, [r1, #8]
	add r6, #0x14
	mov r2, #0x28
	mul r2, r6
	add r2, r1, r2
	ldrh r1, [r0, #0x20]
	sub r0, r5, #2
	ldrsh r0, [r4, r0]
	add r0, r1, r0
	strh r0, [r2, #4]
	strh r3, [r2, #6]
	mov r1, #4
	mov r3, #6
	ldr r0, [r2, #0x20]
	ldrsh r1, [r2, r1]
	ldrsh r2, [r2, r3]
	bl Sprite_SetPositionXY
	sub r0, r5, #7
	ldrb r0, [r4, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1c
	cmp r0, #4
	blo _021ED454
	sub r0, r0, #4
	lsl r0, r0, #4
	add r0, r4, r0
	mov r1, #4
	add r2, r1, #0
	ldr r0, [r0, #0x44]
	sub r2, #0xa
	bl sub_020136B4
_021ED454:
	mov r0, #0x4f
	lsl r0, r0, #2
	ldrb r0, [r4, r0]
	ldr r2, _021ED480 ; =gSystem + 0x40
	lsl r0, r0, #0x18
	ldrh r1, [r2, #0x20]
	lsr r5, r0, #0x1f
	ldrh r2, [r2, #0x22]
	ldr r0, _021ED494 ; =ov101_021F7EEC
	bl TouchscreenHitbox_PointIsIn
	cmp r5, r0
	beq _021ED478
	mov r1, #1
	add r0, r4, #0
	eor r1, r5
	bl ov101_021ECA84
_021ED478:
	mov r0, #0
	mvn r0, r0
	pop {r4, r5, r6, pc}
	nop
_021ED480: .word gSystem + 0x40
_021ED484: .word ov101_021F7ECC
_021ED488: .word 0x00000139
_021ED48C: .word 0x00000946
_021ED490: .word 0x00000948
_021ED494: .word ov101_021F7EEC
	thumb_func_end ov101_021ED2C0

	thumb_func_start ov101_021ED498
ov101_021ED498: ; 0x021ED498
	mov r1, #0
	strb r1, [r0, #0x13]
	mov r1, #0xff
	strb r1, [r0, #0x12]
	ldrb r1, [r0, #0x12]
	ldr r3, _021ED4AC ; =sub_0202F3DC
	strb r1, [r0, #0x11]
	strb r1, [r0, #0x10]
	bx r3
	nop
_021ED4AC: .word sub_0202F3DC
	thumb_func_end ov101_021ED498

	thumb_func_start ov101_021ED4B0
ov101_021ED4B0: ; 0x021ED4B0
	push {r3, r4}
	ldr r3, _021ED4DC ; =0x0000022B
	mov r4, #0
	mov r2, #0x14
_021ED4B8:
	add r1, r4, #0
	mul r1, r2
	add r1, r0, r1
	ldrb r1, [r1, r3]
	cmp r1, #0
	bne _021ED4CA
	add r0, r4, #0
	pop {r3, r4}
	bx lr
_021ED4CA:
	add r1, r4, #1
	lsl r1, r1, #0x18
	lsr r4, r1, #0x18
	cmp r4, #0x64
	blo _021ED4B8
	mov r0, #0xff
	pop {r3, r4}
	bx lr
	nop
_021ED4DC: .word 0x0000022B
	thumb_func_end ov101_021ED4B0

	thumb_func_start ov101_021ED4E0
ov101_021ED4E0: ; 0x021ED4E0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x28]
	bl sub_0202EDF4
	str r0, [sp]
	ldr r0, _021ED5A0 ; =0x000009F1
	mov r1, #0xff
	strb r1, [r5, r0]
	ldrb r1, [r5, r0]
	sub r0, r0, #1
	mov r4, #0
	strb r1, [r5, r0]
	mov r0, #0x86
	lsl r0, r0, #2
	add r6, r5, r0
	mov r7, #0x14
_021ED506:
	add r0, r4, #0
	mul r0, r7
	add r0, r6, r0
	bl ov101_021ED498
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #0x64
	blo _021ED506
	mov r0, #0x86
	lsl r0, r0, #2
	mov r6, #0
	add r0, r5, r0
	add r7, r6, #0
	str r0, [sp, #4]
_021ED526:
	ldr r0, [sp]
	add r1, r7, #0
	bl sub_0202F4E8
	cmp r0, #0
	beq _021ED596
	mov r0, #0x14
	add r1, r6, #0
	mul r1, r0
	ldr r0, [sp, #4]
	add r2, r7, #0
	add r4, r0, r1
	ldr r0, [sp]
	add r1, r4, #0
	bl sub_0202F514
	strb r6, [r4, #0x10]
	mov r0, #1
	strb r0, [r4, #0x13]
	mov r0, #0x9f
	lsl r0, r0, #4
	ldrb r0, [r5, r0]
	cmp r0, #0xff
	bne _021ED56A
	ldrb r1, [r4, #0x10]
	mov r0, #0x9f
	lsl r0, r0, #4
	strb r1, [r5, r0]
	ldrb r1, [r4, #0x10]
	add r0, r0, #1
	strb r1, [r5, r0]
	mov r0, #0xff
	strb r0, [r4, #0x11]
	b _021ED586
_021ED56A:
	ldr r0, _021ED5A0 ; =0x000009F1
	ldr r1, _021ED5A0 ; =0x000009F1
	ldrb r0, [r5, r0]
	strb r0, [r4, #0x11]
	ldrb r2, [r5, r1]
	mov r1, #0x14
	ldrb r0, [r4, #0x10]
	mul r1, r2
	add r2, r5, r1
	ldr r1, _021ED5A4 ; =0x0000022A
	strb r0, [r2, r1]
	ldrb r1, [r4, #0x10]
	ldr r0, _021ED5A0 ; =0x000009F1
	strb r1, [r5, r0]
_021ED586:
	add r0, r6, #1
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	add r0, r7, #1
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
	cmp r7, #0x64
	blo _021ED526
_021ED596:
	ldr r0, _021ED5A8 ; =0x000009F2
	strb r6, [r5, r0]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021ED5A0: .word 0x000009F1
_021ED5A4: .word 0x0000022A
_021ED5A8: .word 0x000009F2
	thumb_func_end ov101_021ED4E0

	thumb_func_start ov101_021ED5AC
ov101_021ED5AC: ; 0x021ED5AC
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	ldr r0, [r7, #0x10]
	ldr r0, [r0, #0x28]
	bl sub_0202EDF4
	add r6, r0, #0
	mov r0, #0x9f
	lsl r0, r0, #4
	ldrb r0, [r7, r0]
	mov r5, #0
	cmp r0, #0xff
	beq _021ED5EE
	mov r1, #0x86
	lsl r1, r1, #2
	add r1, r7, r1
	str r1, [sp]
_021ED5CE:
	mov r1, #0x14
	mul r1, r0
	ldr r0, [sp]
	add r2, r5, #0
	add r4, r0, r1
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	add r0, r6, #0
	add r1, r4, #0
	mov r3, #1
	bl sub_0202F53C
	ldrb r0, [r4, #0x12]
	cmp r0, #0xff
	bne _021ED5CE
_021ED5EE:
	ldr r0, _021ED610 ; =0x000009F2
	ldrb r0, [r7, r0]
	cmp r5, r0
	bhs _021ED60C
	ldr r4, _021ED610 ; =0x000009F2
_021ED5F8:
	add r0, r6, #0
	add r1, r5, #0
	bl sub_0202F500
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	ldrb r0, [r7, r4]
	cmp r5, r0
	blo _021ED5F8
_021ED60C:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021ED610: .word 0x000009F2
	thumb_func_end ov101_021ED5AC

	thumb_func_start ov101_021ED614
ov101_021ED614: ; 0x021ED614
	push {r4, r5}
	cmp r1, #0
	bgt _021ED620
	mov r0, #0
	pop {r4, r5}
	bx lr
_021ED620:
	mov r2, #0x9f
	lsl r2, r2, #4
	ldrb r5, [r0, r2]
	cmp r5, #0xff
	beq _021ED644
	mov r2, #0x86
	lsl r2, r2, #2
	add r4, r0, r2
	mov r2, #0x14
_021ED632:
	add r3, r5, #0
	mul r3, r2
	add r0, r4, r3
	ldr r3, [r4, r3]
	cmp r3, r1
	beq _021ED646
	ldrb r5, [r0, #0x12]
	cmp r5, #0xff
	bne _021ED632
_021ED644:
	mov r0, #0
_021ED646:
	pop {r4, r5}
	bx lr
	.balign 4, 0
	thumb_func_end ov101_021ED614

	thumb_func_start ov101_021ED64C
ov101_021ED64C: ; 0x021ED64C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov101_021ED614
	cmp r0, #0
	bne _021ED6B6
	add r0, r5, #0
	bl ov101_021ED4B0
	cmp r0, #0xff
	bne _021ED66C
	bl GF_AssertFail
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021ED66C:
	mov r1, #0x86
	lsl r1, r1, #2
	mov r3, #0x14
	add r7, r0, #0
	add r2, r5, r1
	mul r7, r3
	add r3, r2, r7
	strb r0, [r3, #0x10]
	mov r6, #1
	strb r6, [r3, #0x13]
	str r4, [r2, r7]
	mov r2, #0x9f
	lsl r2, r2, #4
	ldrb r4, [r5, r2]
	cmp r4, #0xff
	bne _021ED69C
	add r1, r2, #1
	strb r0, [r5, r1]
	add r0, r1, #0
	ldrb r0, [r5, r0]
	strb r0, [r5, r2]
	mov r0, #0xff
	strb r0, [r3, #0x11]
	b _021ED6B4
_021ED69C:
	add r4, r2, #1
	ldrb r6, [r5, r4]
	mov r4, #0x14
	add r1, #0x12
	mul r4, r6
	add r4, r5, r4
	strb r0, [r4, r1]
	add r1, r2, #1
	ldrb r1, [r5, r1]
	strb r1, [r3, #0x11]
	add r1, r2, #1
	strb r0, [r5, r1]
_021ED6B4:
	add r0, r3, #0
_021ED6B6:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov101_021ED64C

	thumb_func_start ov101_021ED6B8
ov101_021ED6B8: ; 0x021ED6B8
	push {r4, r5, r6, lr}
	add r3, r1, #0
	bne _021ED6C2
	mov r0, #0
	pop {r4, r5, r6, pc}
_021ED6C2:
	mov r1, #0x9f
	lsl r1, r1, #4
	ldrb r4, [r3, #0x10]
	ldrb r2, [r0, r1]
	cmp r4, r2
	bne _021ED6FE
	ldrb r5, [r3, #0x12]
	cmp r5, #0xff
	bne _021ED6E0
	mov r4, #0xff
	add r2, r1, #1
	strb r4, [r0, r2]
	ldrb r2, [r0, r2]
	strb r2, [r0, r1]
	b _021ED742
_021ED6E0:
	mov r4, #0x14
	add r2, r5, #0
	mul r2, r4
	add r5, r0, r2
	mov r2, #0x8a
	lsl r2, r2, #2
	ldrb r5, [r5, r2]
	strb r5, [r0, r1]
	ldrb r5, [r3, #0x12]
	mov r1, #0xff
	mul r4, r5
	add r4, r0, r4
	add r0, r2, #1
	strb r1, [r4, r0]
	b _021ED742
_021ED6FE:
	add r2, r1, #1
	ldrb r2, [r0, r2]
	cmp r4, r2
	bne _021ED726
	ldrb r4, [r3, #0x11]
	mov r5, #0x14
	mov r2, #0xff
	add r6, r4, #0
	mul r6, r5
	ldr r4, _021ED74C ; =0x0000022A
	add r6, r0, r6
	strb r2, [r6, r4]
	ldrb r2, [r3, #0x11]
	add r1, r1, #1
	mul r5, r2
	add r5, r0, r5
	sub r2, r4, #2
	ldrb r2, [r5, r2]
	strb r2, [r0, r1]
	b _021ED742
_021ED726:
	ldrb r2, [r3, #0x11]
	ldrb r1, [r3, #0x12]
	mov r4, #0x14
	add r5, r2, #0
	mul r5, r4
	ldr r2, _021ED74C ; =0x0000022A
	add r5, r0, r5
	strb r1, [r5, r2]
	ldrb r5, [r3, #0x12]
	ldrb r1, [r3, #0x11]
	mul r4, r5
	add r4, r0, r4
	sub r0, r2, #1
	strb r1, [r4, r0]
_021ED742:
	add r0, r3, #0
	bl ov101_021ED498
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021ED74C: .word 0x0000022A
	thumb_func_end ov101_021ED6B8

	thumb_func_start ov101_021ED750
ov101_021ED750: ; 0x021ED750
	cmp r0, #0
	bne _021ED758
	mov r0, #0
	bx lr
_021ED758:
	add r0, r0, r1
	strb r2, [r0, #4]
	mov r0, #1
	bx lr
	thumb_func_end ov101_021ED750

	thumb_func_start ov101_021ED760
ov101_021ED760: ; 0x021ED760
	push {r3, lr}
	cmp r0, #0
	bne _021ED76A
	mov r0, #0
	pop {r3, pc}
_021ED76A:
	mov r2, #0xf
	add r1, r0, r1
	strb r2, [r1, #4]
	bl sub_0202F400
	cmp r0, #0
	beq _021ED77C
	mov r0, #1
	pop {r3, pc}
_021ED77C:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ov101_021ED760

	thumb_func_start ov101_021ED780
ov101_021ED780: ; 0x021ED780
	push {r3, r4}
	cmp r0, #0
	bne _021ED78C
	mov r0, #0
	pop {r3, r4}
	bx lr
_021ED78C:
	add r4, r0, #4
	ldrb r3, [r4, r1]
	ldrb r0, [r4, r2]
	strb r0, [r4, r1]
	strb r3, [r4, r2]
	mov r0, #1
	pop {r3, r4}
	bx lr
	thumb_func_end ov101_021ED780

	thumb_func_start ov101_021ED79C
ov101_021ED79C: ; 0x021ED79C
	cmp r0, #0
	bne _021ED7A4
	mov r0, #0
	bx lr
_021ED7A4:
	lsl r1, r1, #1
	add r0, r0, r1
	strh r2, [r0, #8]
	mov r0, #1
	bx lr
	.balign 4, 0
	thumb_func_end ov101_021ED79C

	thumb_func_start ov101_021ED7B0
ov101_021ED7B0: ; 0x021ED7B0
	push {r3, lr}
	cmp r0, #0
	bne _021ED7BA
	mov r0, #0
	pop {r3, pc}
_021ED7BA:
	lsl r1, r1, #1
	ldr r2, _021ED7D4 ; =0x0000FFFF
	add r1, r0, r1
	strh r2, [r1, #8]
	bl sub_0202F400
	cmp r0, #0
	beq _021ED7CE
	mov r0, #1
	pop {r3, pc}
_021ED7CE:
	mov r0, #0
	pop {r3, pc}
	nop
_021ED7D4: .word 0x0000FFFF
	thumb_func_end ov101_021ED7B0

	thumb_func_start ov101_021ED7D8
ov101_021ED7D8: ; 0x021ED7D8
	push {r3, r4}
	cmp r0, #0
	bne _021ED7E4
	mov r0, #0
	pop {r3, r4}
	bx lr
_021ED7E4:
	add r0, #8
	lsl r4, r1, #1
	lsl r2, r2, #1
	ldrh r3, [r0, r4]
	ldrh r1, [r0, r2]
	strh r1, [r0, r4]
	strh r3, [r0, r2]
	mov r0, #1
	pop {r3, r4}
	bx lr
	thumb_func_end ov101_021ED7D8

	// File boundary?

	thumb_func_start TownMap_Init
TownMap_Init: ; 0x021ED7F8
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl OverlayManager_GetArgs
	add r5, r0, #0
	ldr r0, _021ED8A4 ; =FS_OVERLAY_ID(OVY_100)
	mov r1, #2
	bl HandleLoadOverlay
	ldr r0, _021ED8A8 ; =FS_OVERLAY_ID(OVY_26)
	mov r1, #2
	bl HandleLoadOverlay
	mov r2, #1
	mov r0, #3
	mov r1, #0x5b
	lsl r2, r2, #0x12
	bl CreateHeap
	ldr r1, _021ED8AC ; =0x000009F4
	add r0, r4, #0
	mov r2, #0x5b
	bl OverlayManager_CreateAndGetData
	ldr r2, _021ED8AC ; =0x000009F4
	mov r1, #0
	add r4, r0, #0
	bl memset
	mov r0, #0x5b
	mov r1, #0xcc
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0xcc
	str r0, [r4, #0x10]
	bl memset
	mov r1, #0x5b
	str r1, [r4]
	ldr r0, [r4, #0x10]
	str r1, [r0]
	ldr r0, [r4, #0x10]
	str r5, [r0, #0x20]
	ldr r1, [r4, #0x10]
	ldr r0, [r1, #0x20]
	ldr r0, [r0, #0x24]
	str r0, [r1, #0x24]
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0x24]
	bl SaveData_Pokegear_Get
	ldr r1, [r4, #0x10]
	str r0, [r1, #0x28]
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0x24]
	bl Save_VarsFlags_Get
	ldr r1, [r4, #0x10]
	str r0, [r1, #0x2c]
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0x24]
	bl Save_PlayerData_GetOptionsAddr
	ldr r1, [r4, #0x10]
	str r0, [r1, #0x30]
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0x24]
	bl Save_PlayerData_GetProfile
	ldr r1, [r4, #0x10]
	str r0, [r1, #0x34]
	add r0, r4, #0
	bl ov101_021ED980
	mov r0, #0x85
	ldr r1, _021ED8B0 ; =ov101_021F7372
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r1, #0x64
	add r0, r1, #0
	add r0, #0xd2
	strb r1, [r4, r0]
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_021ED8A4: .word FS_OVERLAY_ID(OVY_100)
_021ED8A8: .word FS_OVERLAY_ID(OVY_26)
_021ED8AC: .word 0x000009F4
_021ED8B0: .word ov101_021F7372
	thumb_func_end TownMap_Init

	thumb_func_start TownMap_Main
TownMap_Main: ; 0x021ED8B4
	push {r4, lr}
	add r4, r1, #0
	bl OverlayManager_GetData
	ldr r1, [r4]
	cmp r1, #0xd
	bhi _021ED91E
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021ED8CE: ; jump table
	.short _021ED8EA - _021ED8CE - 2 ; case 0
	.short _021ED8F2 - _021ED8CE - 2 ; case 1
	.short _021ED8FA - _021ED8CE - 2 ; case 2
	.short _021ED91E - _021ED8CE - 2 ; case 3
	.short _021ED90A - _021ED8CE - 2 ; case 4
	.short _021ED912 - _021ED8CE - 2 ; case 5
	.short _021ED91E - _021ED8CE - 2 ; case 6
	.short _021ED91E - _021ED8CE - 2 ; case 7
	.short _021ED91E - _021ED8CE - 2 ; case 8
	.short _021ED91E - _021ED8CE - 2 ; case 9
	.short _021ED91E - _021ED8CE - 2 ; case 10
	.short _021ED91E - _021ED8CE - 2 ; case 11
	.short _021ED902 - _021ED8CE - 2 ; case 12
	.short _021ED91A - _021ED8CE - 2 ; case 13
_021ED8EA:
	bl ov101_021EDB1C
	str r0, [r4]
	b _021ED91E
_021ED8F2:
	bl ov101_021EDB30
	str r0, [r4]
	b _021ED91E
_021ED8FA:
	bl ov101_021EDBD4
	str r0, [r4]
	b _021ED91E
_021ED902:
	bl ov101_021EDBFC
	str r0, [r4]
	b _021ED91E
_021ED90A:
	bl ov101_021EDC04
	str r0, [r4]
	b _021ED91E
_021ED912:
	bl ov101_021EDC70
	str r0, [r4]
	b _021ED91E
_021ED91A:
	mov r0, #1
	pop {r4, pc}
_021ED91E:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end TownMap_Main

	thumb_func_start TownMap_Exit
TownMap_Exit: ; 0x021ED924
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	bl ov101_021EDAF8
	ldr r0, [r4, #0x38]
	bl MapMatrix_MapData_Free
	ldr r2, [r4, #0x10]
	ldr r0, [r2, #0x1c]
	cmp r0, #6
	beq _021ED948
	ldrb r1, [r2, #5]
	mov r0, #0x80
	orr r0, r1
	strb r0, [r2, #5]
_021ED948:
	ldr r0, [r4, #0x10]
	mov r1, #0
	mov r2, #0xcc
	bl MI_CpuFill8
	ldr r0, [r4, #0x10]
	bl FreeToHeap
	ldr r4, [r4]
	add r0, r5, #0
	bl OverlayManager_FreeData
	add r0, r4, #0
	bl DestroyHeap
	ldr r0, _021ED978 ; =FS_OVERLAY_ID(OVY_26)
	bl UnloadOverlayByID
	ldr r0, _021ED97C ; =FS_OVERLAY_ID(OVY_100)
	bl UnloadOverlayByID
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_021ED978: .word FS_OVERLAY_ID(OVY_26)
_021ED97C: .word FS_OVERLAY_ID(OVY_100)
	thumb_func_end TownMap_Exit

	thumb_func_start ov101_021ED980
ov101_021ED980: ; 0x021ED980
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0x10]
	str r4, [r1, #0x64]
	ldr r2, [r4, #0x10]
	ldr r1, [r2, #0x20]
	ldrb r1, [r1, #1]
	str r1, [r2, #0xc]
	ldr r1, [r4, #0x10]
	ldr r2, _021EDAE8 ; =ov101_021EB338
	ldr r1, [r1, #0x20]
	ldrb r1, [r1]
	add r1, r1, #1
	strb r1, [r4, #0xd]
	ldr r1, [r4, #0x10]
	str r2, [r1, #0x5c]
	ldr r2, _021EDAEC ; =ov101_021EB2FC
	ldr r1, [r4, #0x10]
	str r2, [r1, #0x60]
	bl ov101_021ED4E0
	mov r1, #0x4e
	lsl r1, r1, #2
	ldrb r2, [r4, r1]
	mov r0, #0x10
	bic r2, r0
	strb r2, [r4, r1]
	ldrb r2, [r4, r1]
	mov r0, #0xe
	bic r2, r0
	strb r2, [r4, r1]
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0x28]
	bl Pokegear_GetMapUnlockLevel
	mov r2, #0x4e
	lsl r2, r2, #2
	lsl r0, r0, #0x1e
	ldrb r3, [r4, r2]
	mov r1, #0x60
	lsr r0, r0, #0x19
	bic r3, r1
	orr r0, r3
	strb r0, [r4, r2]
	ldr r0, [r4]
	bl MapMatrix_MapData_New
	str r0, [r4, #0x38]
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0x24]
	bl SaveData_GetPhoneCallPersistentState
	mov r1, #0x49
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4]
	bl AllocAndReadPhoneBook
	mov r1, #0x4a
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, #0x10]
	ldr r1, [r4]
	ldr r0, [r0, #0x28]
	bl SavePokegear_AllocAndCopyPhonebook
	mov r1, #0x4b
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0x28]
	bl SavePokegear_FindEmptyPhonebookSlot
	mov r2, #0x13
	lsl r2, r2, #4
	strb r0, [r4, r2]
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0x20]
	add r0, #0x22
	ldrb r1, [r0]
	add r0, r2, #0
	sub r0, #0x28
	strh r1, [r4, r0]
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0x20]
	add r0, #0x23
	ldrb r0, [r0]
	add r1, r0, #2
	add r0, r2, #0
	sub r0, #0x26
	strh r1, [r4, r0]
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0x20]
	ldrh r1, [r0, #0x10]
	add r0, r2, #0
	sub r0, #0x24
	strh r1, [r4, r0]
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0x20]
	ldrb r1, [r0, #7]
	add r0, r2, #0
	sub r0, #0x22
	strh r1, [r4, r0]
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0x20]
	add r0, #0x22
	ldrb r1, [r0]
	add r0, r2, #0
	sub r0, #0x20
	strh r1, [r4, r0]
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0x20]
	add r0, #0x23
	ldrb r0, [r0]
	add r1, r0, #2
	add r0, r2, #0
	sub r0, #0x1e
	strh r1, [r4, r0]
	mov r1, #1
	add r0, r1, #0
	add r0, #0xff
	strh r1, [r4, r0]
	add r0, r2, #0
	sub r0, #0x2c
	strh r1, [r4, r0]
	add r0, r2, #0
	add r0, #8
	ldrb r0, [r4, r0]
	lsl r0, r0, #0x19
	lsr r0, r0, #0x1e
	lsl r1, r0, #1
	ldr r0, _021EDAF0 ; =ov101_021F7F3C
	ldrh r1, [r0, r1]
	add r0, r2, #0
	sub r0, #0x2e
	strh r1, [r4, r0]
	mov r1, #0x11
	add r0, r1, #0
	add r0, #0xf5
	strh r1, [r4, r0]
	mov r1, #0x20
	add r0, r2, #2
	strb r1, [r4, r0]
	mov r1, #8
	add r0, r2, #1
	strb r1, [r4, r0]
	mov r1, #0
	add r0, r2, #3
	strb r1, [r4, r0]
	sub r1, #0x18
	add r0, r2, #4
	strb r1, [r4, r0]
	add r0, r2, #0
	add r0, #0xd
	ldrb r0, [r4, r0]
	mov r1, #2
	add r2, #0xd
	orr r0, r1
	strb r0, [r4, r2]
	ldr r0, [r4, #0x10]
	mov r2, #0xf
	ldr r0, [r0, #0x2c]
	bl Save_VarsFlags_FlypointFlagAction
	ldr r3, _021EDAF4 ; =0x0000013D
	mov r2, #1
	ldrb r1, [r4, r3]
	lsl r0, r0, #0x18
	bic r1, r2
	lsr r2, r0, #0x18
	mov r0, #1
	and r0, r2
	orr r0, r1
	strb r0, [r4, r3]
	ldr r0, [r4, #0x10]
	bl ov100_021E5C80
	strb r0, [r4, #0xe]
	pop {r4, pc}
	nop
_021EDAE8: .word ov101_021EB338
_021EDAEC: .word ov101_021EB2FC
_021EDAF0: .word ov101_021F7F3C
_021EDAF4: .word 0x0000013D
	thumb_func_end ov101_021ED980

	thumb_func_start ov101_021EDAF8
ov101_021EDAF8: ; 0x021EDAF8
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x4b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl FreeToHeap
	mov r0, #0x4a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl FreePhoneBook
	ldr r0, [r4, #0x10]
	mov r1, #0
	str r1, [r0, #0x5c]
	ldr r0, [r4, #0x10]
	str r1, [r0, #0x60]
	pop {r4, pc}
	thumb_func_end ov101_021EDAF8

	thumb_func_start ov101_021EDB1C
ov101_021EDB1C: ; 0x021EDB1C
	push {r3, lr}
	bl ov101_021EDCE0
	cmp r0, #0
	beq _021EDB2A
	mov r0, #4
	pop {r3, pc}
_021EDB2A:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov101_021EDB1C

	thumb_func_start ov101_021EDB30
ov101_021EDB30: ; 0x021EDB30
	push {r3, r4, lr}
	sub sp, #4
	mov r1, #0
	str r1, [sp]
	ldr r1, _021EDBC8 ; =0x00000139
	add r4, r0, #0
	ldrb r1, [r4, r1]
	lsl r1, r1, #0x1c
	lsr r1, r1, #0x1f
	bne _021EDB4C
	add r1, sp, #0
	bl ov101_021EBC1C
	b _021EDB54
_021EDB4C:
	bl ov101_021EC0AC
	mov r1, #1
	str r1, [sp]
_021EDB54:
	ldr r1, [sp]
	cmp r1, #0
	beq _021EDB84
	ldr r1, [r4, #0x10]
	mov r2, #1
	str r2, [r1, #0xc]
	ldr r1, [r4, #0x10]
	str r0, [r1, #0x1c]
	sub r1, r2, #2
	cmp r0, r1
	beq _021EDB7E
	cmp r0, #4
	beq _021EDB78
	cmp r0, #8
	bne _021EDB7E
	add sp, #4
	mov r0, #0xc
	pop {r3, r4, pc}
_021EDB78:
	add sp, #4
	mov r0, #5
	pop {r3, r4, pc}
_021EDB7E:
	add sp, #4
	mov r0, #1
	pop {r3, r4, pc}
_021EDB84:
	ldr r0, _021EDBCC ; =gSystem
	ldr r1, [r0, #0x48]
	ldr r0, _021EDBD0 ; =0x00000CF3
	tst r0, r1
	beq _021EDB94
	ldr r0, [r4, #0x10]
	mov r1, #0
	str r1, [r0, #0xc]
_021EDB94:
	add r0, r4, #0
	bl ov101_021EB94C
	ldr r1, [r4, #0x10]
	str r0, [r1, #0x1c]
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _021EDBBA
	cmp r0, #4
	beq _021EDBB4
	cmp r0, #8
	bne _021EDBBA
	add sp, #4
	mov r0, #0xc
	pop {r3, r4, pc}
_021EDBB4:
	add sp, #4
	mov r0, #5
	pop {r3, r4, pc}
_021EDBBA:
	add r0, r4, #0
	bl ov101_021EC304
	mov r0, #1
	add sp, #4
	pop {r3, r4, pc}
	nop
_021EDBC8: .word 0x00000139
_021EDBCC: .word gSystem
_021EDBD0: .word 0x00000CF3
	thumb_func_end ov101_021EDB30

	thumb_func_start ov101_021EDBD4
ov101_021EDBD4: ; 0x021EDBD4
	push {r4, lr}
	add r4, r0, #0
	bl ov101_021EDDB0
	cmp r0, #0
	bne _021EDBE4
	mov r0, #2
	pop {r4, pc}
_021EDBE4:
	ldr r2, [r4, #0x10]
	add r4, #0x14
	add r2, #0x3c
	mov r1, #0xe
_021EDBEC:
	ldrh r0, [r4]
	add r4, r4, #2
	strh r0, [r2]
	add r2, r2, #2
	sub r1, r1, #1
	bne _021EDBEC
	mov r0, #0xd
	pop {r4, pc}
	thumb_func_end ov101_021EDBD4

	thumb_func_start ov101_021EDBFC
ov101_021EDBFC: ; 0x021EDBFC
	ldr r3, _021EDC00 ; =ov101_021EDDF4
	bx r3
	.balign 4, 0
_021EDC00: .word ov101_021EDDF4
	thumb_func_end ov101_021EDBFC

	thumb_func_start ov101_021EDC04
ov101_021EDC04: ; 0x021EDC04
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _021EDC16
	cmp r0, #1
	beq _021EDC58
	b _021EDC6A
_021EDC16:
	mov r0, #6
	mov r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r5]
	add r2, r1, #0
	str r0, [sp, #8]
	mov r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r4, #0
	mov r6, #1
_021EDC30:
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	add r1, r6, #0
	bl ToggleBgLayer
	add r4, r4, #1
	cmp r4, #8
	blt _021EDC30
	mov r0, #0x10
	mov r1, #1
	bl GfGfx_EngineATogglePlanes
	mov r0, #0x10
	mov r1, #1
	bl GfGfx_EngineBTogglePlanes
	ldr r0, [r5, #4]
	add r0, r0, #1
	str r0, [r5, #4]
	b _021EDC6A
_021EDC58:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021EDC6A
	mov r0, #0
	str r0, [r5, #4]
	add sp, #0xc
	mov r0, #1
	pop {r3, r4, r5, r6, pc}
_021EDC6A:
	mov r0, #4
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov101_021EDC04

	thumb_func_start ov101_021EDC70
ov101_021EDC70: ; 0x021EDC70
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _021EDC82
	cmp r0, #1
	beq _021EDCA2
	b _021EDCD8
_021EDC82:
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r5]
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	ldr r0, [r5, #4]
	add r0, r0, #1
	str r0, [r5, #4]
	b _021EDCD8
_021EDCA2:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021EDCD8
	mov r4, #0
	add r6, r4, #0
_021EDCAE:
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	add r1, r6, #0
	bl ToggleBgLayer
	add r4, r4, #1
	cmp r4, #8
	blt _021EDCAE
	mov r0, #0x10
	mov r1, #0
	bl GfGfx_EngineATogglePlanes
	mov r0, #0x10
	mov r1, #0
	bl GfGfx_EngineBTogglePlanes
	mov r0, #0
	str r0, [r5, #4]
	add sp, #0xc
	mov r0, #2
	pop {r3, r4, r5, r6, pc}
_021EDCD8:
	mov r0, #5
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov101_021EDC70

	thumb_func_start ov101_021EDCE0
ov101_021EDCE0: ; 0x021EDCE0
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #8]
	cmp r1, #4
	bhi _021EDD94
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021EDCF6: ; jump table
	.short _021EDD00 - _021EDCF6 - 2 ; case 0
	.short _021EDD94 - _021EDCF6 - 2 ; case 1
	.short _021EDD50 - _021EDCF6 - 2 ; case 2
	.short _021EDD68 - _021EDCF6 - 2 ; case 3
	.short _021EDD7A - _021EDCF6 - 2 ; case 4
_021EDD00:
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	bl GfGfx_DisableEngineAPlanes
	bl GfGfx_DisableEngineBPlanes
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _021EDDA0 ; =0xFFFFE0FF
	and r1, r0
	str r1, [r2]
	ldr r2, _021EDDA4 ; =0x04001000
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	mov r0, #0
	add r1, r0, #0
	bl sub_0200FBF4
	mov r0, #1
	mov r1, #0
	bl sub_0200FBF4
	mov r0, #0
	bl sub_0200FBDC
	mov r0, #1
	bl sub_0200FBDC
	bl sub_020210BC
	mov r0, #2
	bl sub_02021148
	b _021EDD94
_021EDD50:
	bl ov101_021EDE4C
	add r0, r4, #0
	bl ov101_021EDFF8
	add r0, r4, #0
	bl ov101_021EE1C4
	add r0, r4, #0
	bl ov101_021EE230
	b _021EDD94
_021EDD68:
	bl ov101_021EE394
	add r0, r4, #0
	bl ov101_021EE410
	add r0, r4, #0
	bl ov101_021EE350
	b _021EDD94
_021EDD7A:
	bl ov101_021EE670
	ldr r0, _021EDDA8 ; =PokegearApp_VBlankCB
	ldr r1, [r4, #0x10]
	bl Main_SetVBlankIntrCB
	ldr r1, _021EDDAC ; =ov101_021E9270
	ldr r0, [r4, #0x10]
	str r1, [r0, #0x58]
	mov r0, #0
	str r0, [r4, #8]
	mov r0, #1
	pop {r4, pc}
_021EDD94:
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	mov r0, #0
	pop {r4, pc}
	nop
_021EDDA0: .word 0xFFFFE0FF
_021EDDA4: .word 0x04001000
_021EDDA8: .word PokegearApp_VBlankCB
_021EDDAC: .word ov101_021E9270
	thumb_func_end ov101_021EDCE0

	thumb_func_start ov101_021EDDB0
ov101_021EDDB0: ; 0x021EDDB0
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0x10]
	mov r2, #0
	str r2, [r1, #0x58]
	bl ov101_021EE380
	add r0, r4, #0
	bl ov101_021EE664
	add r0, r4, #0
	bl ov101_021EE3D8
	add r0, r4, #0
	bl ov101_021EE2E8
	add r0, r4, #0
	bl ov101_021EE210
	add r0, r4, #0
	bl ov101_021EE190
	add r0, r4, #0
	bl ov101_021EDF54
	bl sub_02021238
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov101_021EDDB0

	thumb_func_start ov101_021EDDF4
ov101_021EDDF4: ; 0x021EDDF4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, #0xc4
	ldr r0, [r0]
	bl TouchscreenListMenu_HandleInput
	add r6, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r6, r0
	beq _021EDE46
	add r0, r5, #0
	add r0, #0xc4
	ldr r0, [r0]
	add r1, r0, #0
	add r1, #0x27
	ldrb r1, [r1]
	lsl r1, r1, #0x18
	lsr r4, r1, #0x19
	bl TouchscreenListMenu_Destroy
	ldr r1, [r5, #0x10]
	ldr r0, [r1, #0xc]
	cmp r4, r0
	beq _021EDE28
	str r4, [r1, #0xc]
_021EDE28:
	cmp r6, #0
	bne _021EDE38
	ldr r0, [r5, #0x10]
	mov r1, #1
	ldr r0, [r0, #0x20]
	str r1, [r0, #0x14]
	mov r0, #5
	pop {r4, r5, r6, pc}
_021EDE38:
	mov r1, #0
	add r0, r5, #0
	mvn r1, r1
	bl ov101_021EB4C4
	mov r0, #1
	pop {r4, r5, r6, pc}
_021EDE46:
	mov r0, #0xc
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov101_021EDDF4

	thumb_func_start ov101_021EDE4C
ov101_021EDE4C: ; 0x021EDE4C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0xf0
	add r5, r0, #0
	bl ov100_021E5FDC
	ldr r0, [r5]
	bl BgConfig_Alloc
	ldr r1, [r5, #0x10]
	ldr r2, _021EDF44 ; =0x04000304
	str r0, [r1, #0x74]
	ldrh r1, [r2]
	ldr r0, _021EDF48 ; =0xFFFF7FFF
	ldr r4, _021EDF4C ; =ov101_021F7F44
	and r0, r1
	strh r0, [r2]
	add r3, sp, #0
	add r2, r3, #0
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	ldr r4, _021EDF50 ; =ov101_021F7F9C
	add r3, sp, #0x10
	mov r2, #0x1c
_021EDE84:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021EDE84
	ldr r0, [r5, #0x10]
	mov r1, #0
	ldr r0, [r0, #0x74]
	add r2, sp, #0x10
	add r3, r1, #0
	bl InitBgFromTemplate
	ldr r0, [r5, #0x10]
	mov r1, #1
	ldr r0, [r0, #0x74]
	add r2, sp, #0x2c
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r5, #0x10]
	mov r1, #2
	ldr r0, [r0, #0x74]
	add r2, sp, #0x48
	add r3, r1, #0
	bl InitBgFromTemplate
	ldr r0, [r5, #0x10]
	mov r1, #3
	ldr r0, [r0, #0x74]
	add r2, sp, #0x64
	mov r3, #2
	bl InitBgFromTemplate
	ldr r0, [r5, #0x10]
	mov r1, #4
	ldr r0, [r0, #0x74]
	add r2, sp, #0x80
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r5, #0x10]
	mov r1, #5
	ldr r0, [r0, #0x74]
	add r2, sp, #0x9c
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r5, #0x10]
	mov r1, #6
	ldr r0, [r0, #0x74]
	add r2, sp, #0xb8
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r5, #0x10]
	mov r1, #7
	ldr r0, [r0, #0x74]
	add r2, sp, #0xd4
	mov r3, #0
	bl InitBgFromTemplate
	mov r0, #0xf
	mov r1, #0
	bl GfGfx_EngineATogglePlanes
	mov r0, #0xf
	mov r1, #0
	bl GfGfx_EngineBTogglePlanes
	mov r4, #0
	mov r6, #0x20
	add r7, r4, #0
_021EDF12:
	ldr r0, [r5, #0x10]
	lsl r1, r4, #0x18
	ldr r0, [r0, #0x74]
	lsr r1, r1, #0x18
	bl BgClearTilemapBufferAndCommit
	lsl r0, r4, #0x18
	ldr r3, [r5]
	lsr r0, r0, #0x18
	add r1, r6, #0
	add r2, r7, #0
	bl BG_ClearCharDataRange
	ldr r0, [r5, #0x10]
	lsl r1, r4, #0x18
	ldr r0, [r0, #0x74]
	lsr r1, r1, #0x18
	bl ScheduleBgTilemapBufferTransfer
	add r4, r4, #1
	cmp r4, #8
	blt _021EDF12
	add sp, #0xf0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021EDF44: .word 0x04000304
_021EDF48: .word 0xFFFF7FFF
_021EDF4C: .word ov101_021F7F44
_021EDF50: .word ov101_021F7F9C
	thumb_func_end ov101_021EDE4C

	thumb_func_start ov101_021EDF54
ov101_021EDF54: ; 0x021EDF54
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	mov r1, #7
	ldr r3, [r4]
	mov r0, #1
	lsl r1, r1, #6
	mov r2, #0
	bl BG_LoadBlankPltt
	mov r1, #6
	ldr r3, [r4]
	mov r0, #5
	lsl r1, r1, #6
	mov r2, #0
	bl BG_LoadBlankPltt
	ldr r0, [r4, #0x10]
	mov r1, #7
	ldr r0, [r0, #0x74]
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x10]
	mov r1, #6
	ldr r0, [r0, #0x74]
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x10]
	mov r1, #5
	ldr r0, [r0, #0x74]
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x10]
	mov r1, #4
	ldr r0, [r0, #0x74]
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x10]
	mov r1, #3
	ldr r0, [r0, #0x74]
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x10]
	mov r1, #2
	ldr r0, [r0, #0x74]
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x10]
	mov r1, #1
	ldr r0, [r0, #0x74]
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x10]
	mov r1, #0
	ldr r0, [r0, #0x74]
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0x74]
	bl FreeToHeap
	ldr r2, _021EDFEC ; =0x04000304
	ldr r0, _021EDFF0 ; =0xFFFF7FFF
	ldrh r1, [r2]
	and r0, r1
	strh r0, [r2]
	mov r1, #0
	ldr r0, _021EDFF4 ; =0x04000050
	add r2, r1, #0
	add r3, r1, #0
	str r1, [sp]
	bl G2x_SetBlendAlpha_
	add sp, #4
	pop {r3, r4, pc}
	nop
_021EDFEC: .word 0x04000304
_021EDFF0: .word 0xFFFF7FFF
_021EDFF4: .word 0x04000050
	thumb_func_end ov101_021EDF54

	thumb_func_start ov101_021EDFF8
ov101_021EDFF8: ; 0x021EDFF8
	push {r4, r5, lr}
	sub sp, #0x14
	add r5, r0, #0
	ldr r1, [r5]
	mov r0, #0x90
	bl NARC_New
	add r4, r0, #0
	mov r0, #0x42
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x10]
	ldr r1, [r5]
	ldr r0, [r0, #0x74]
	add r2, r4, #0
	mov r3, #0x90
	bl sub_0208820C
	mov r0, #0xa
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x10]
	ldr r1, [r5]
	ldr r0, [r0, #0x74]
	add r2, r4, #0
	mov r3, #0x90
	bl sub_0208820C
	mov r0, #0x40
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x10]
	ldr r1, [r5]
	ldr r0, [r0, #0x74]
	add r2, r4, #0
	mov r3, #0x90
	bl sub_0208820C
	mov r0, #0x44
	str r0, [sp]
	mov r0, #6
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x10]
	ldr r1, [r5]
	ldr r0, [r0, #0x74]
	add r2, r4, #0
	mov r3, #0x90
	bl sub_0208820C
	mov r0, #0xc
	str r0, [sp]
	mov r0, #7
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x10]
	ldr r1, [r5]
	ldr r0, [r0, #0x74]
	add r2, r4, #0
	mov r3, #0x90
	bl sub_0208820C
	mov r0, #0x3f
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x10]
	ldr r1, [r5]
	ldr r0, [r0, #0x74]
	add r2, r4, #0
	mov r3, #0x90
	bl sub_0208820C
	mov r0, #0x3e
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x10]
	ldr r1, [r5]
	ldr r0, [r0, #0x74]
	add r2, r4, #0
	mov r3, #0x90
	bl sub_0208820C
	mov r0, #0x41
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x10]
	ldr r1, [r5]
	ldr r0, [r0, #0x74]
	add r2, r4, #0
	mov r3, #0x90
	bl sub_0208820C
	ldr r0, [r5]
	mov r3, #0x5b
	lsl r3, r3, #2
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x45
	mov r2, #0
	add r3, r5, r3
	bl GfGfxLoader_GetScrnDataFromOpenNarc
	mov r3, #0x55
	lsl r3, r3, #2
	str r0, [r5, r3]
	ldr r0, [r5]
	add r3, #0x1c
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0xb
	mov r2, #0
	add r3, r5, r3
	bl GfGfxLoader_GetScrnDataFromOpenNarc
	mov r3, #0x56
	lsl r3, r3, #2
	str r0, [r5, r3]
	ldr r0, [r5]
	add r3, #0x1c
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0xd
	mov r2, #0
	add r3, r5, r3
	bl GfGfxLoader_GetScrnDataFromOpenNarc
	mov r3, #0x57
	lsl r3, r3, #2
	str r0, [r5, r3]
	ldr r0, [r5]
	add r3, #0x1c
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x43
	mov r2, #0
	add r3, r5, r3
	bl GfGfxLoader_GetScrnDataFromOpenNarc
	mov r1, #0x16
	lsl r1, r1, #4
	str r0, [r5, r1]
	add r0, r4, #0
	bl NARC_Delete
	ldr r0, [r5, #0x10]
	mov r1, #4
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
	ldr r1, [r5]
	mov r0, #4
	bl FontID_Alloc
	add sp, #0x14
	pop {r4, r5, pc}
	thumb_func_end ov101_021EDFF8

	thumb_func_start ov101_021EE190
ov101_021EE190: ; 0x021EE190
	push {r4, lr}
	add r4, r0, #0
	mov r0, #4
	bl FontID_Release
	mov r0, #0x16
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl FreeToHeap
	mov r0, #0x57
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl FreeToHeap
	mov r0, #0x56
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl FreeToHeap
	mov r0, #0x55
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end ov101_021EE190

	thumb_func_start ov101_021EE1C4
ov101_021EE1C4: ; 0x021EE1C4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r7, r0, #0
	mov r0, #0x61
	lsl r0, r0, #2
	ldr r4, _021EE20C ; =ov101_021F7F54
	mov r6, #0
	add r5, r7, r0
_021EE1D4:
	ldrb r0, [r4, #2]
	add r1, r5, #0
	str r0, [sp]
	ldrb r0, [r4, #3]
	str r0, [sp, #4]
	ldrb r0, [r4, #4]
	str r0, [sp, #8]
	ldrb r0, [r4, #5]
	str r0, [sp, #0xc]
	ldrh r0, [r4, #6]
	str r0, [sp, #0x10]
	ldr r0, [r7, #0x10]
	ldrb r2, [r4]
	ldrb r3, [r4, #1]
	ldr r0, [r0, #0x74]
	bl AddWindowParameterized
	add r0, r5, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r6, r6, #1
	add r4, #8
	add r5, #0x10
	cmp r6, #9
	blt _021EE1D4
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021EE20C: .word ov101_021F7F54
	thumb_func_end ov101_021EE1C4

	thumb_func_start ov101_021EE210
ov101_021EE210: ; 0x021EE210
	push {r3, r4, r5, lr}
	mov r1, #0x61
	lsl r1, r1, #2
	mov r4, #0
	add r5, r0, r1
_021EE21A:
	add r0, r5, #0
	bl ClearWindowTilemapAndCopyToVram
	add r0, r5, #0
	bl RemoveWindow
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #9
	blt _021EE21A
	pop {r3, r4, r5, pc}
	thumb_func_end ov101_021EE210

	thumb_func_start ov101_021EE230
ov101_021EE230: ; 0x021EE230
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0x1b
	add r2, r1, #0
	ldr r3, [r4]
	mov r0, #0
	add r2, #0xf6
	bl NewMsgDataFromNarc
	add r1, r4, #0
	add r1, #0x88
	str r0, [r1]
	ldr r2, [r4]
	mov r0, #2
	mov r1, #0x5b
	bl MessageFormat_New_Custom
	add r1, r4, #0
	add r1, #0x8c
	str r0, [r1]
	ldr r1, [r4]
	mov r0, #0x5b
	bl String_New
	add r1, r4, #0
	add r1, #0x90
	str r0, [r1]
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	mov r1, #1
	bl NewString_ReadMsgData
	add r1, r4, #0
	add r1, #0x9c
	str r0, [r1]
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	mov r1, #0
	bl NewString_ReadMsgData
	add r1, r4, #0
	add r1, #0xa0
	str r0, [r1]
	ldr r1, [r4]
	mov r0, #0x28
	bl String_New
	add r1, r4, #0
	add r1, #0xa4
	str r0, [r1]
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	mov r1, #4
	bl NewString_ReadMsgData
	add r1, r4, #0
	add r1, #0xa8
	str r0, [r1]
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	mov r1, #5
	bl NewString_ReadMsgData
	add r1, r4, #0
	add r1, #0xac
	str r0, [r1]
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	mov r1, #6
	bl NewString_ReadMsgData
	add r1, r4, #0
	add r1, #0xb0
	str r0, [r1]
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	mov r1, #3
	bl NewString_ReadMsgData
	add r1, r4, #0
	add r1, #0xb4
	str r0, [r1]
	mov r0, #2
	add r4, #0xb8
	strb r0, [r4]
	pop {r4, pc}
	thumb_func_end ov101_021EE230

	thumb_func_start ov101_021EE2E8
ov101_021EE2E8: ; 0x021EE2E8
	push {r4, lr}
	add r4, r0, #0
	add r0, #0xb4
	ldr r0, [r0]
	bl String_Delete
	add r0, r4, #0
	add r0, #0xb0
	ldr r0, [r0]
	bl String_Delete
	add r0, r4, #0
	add r0, #0xac
	ldr r0, [r0]
	bl String_Delete
	add r0, r4, #0
	add r0, #0xa8
	ldr r0, [r0]
	bl String_Delete
	add r0, r4, #0
	add r0, #0xa4
	ldr r0, [r0]
	bl String_Delete
	add r0, r4, #0
	add r0, #0xa0
	ldr r0, [r0]
	bl String_Delete
	add r0, r4, #0
	add r0, #0x9c
	ldr r0, [r0]
	bl String_Delete
	add r0, r4, #0
	add r0, #0x90
	ldr r0, [r0]
	bl String_Delete
	add r0, r4, #0
	add r0, #0x8c
	ldr r0, [r0]
	bl MessageFormat_Delete
	add r4, #0x88
	ldr r0, [r4]
	bl DestroyMsgData
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov101_021EE2E8

	thumb_func_start ov101_021EE350
ov101_021EE350: ; 0x021EE350
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r1, [r5]
	mov r0, #2
	bl ListMenuItems_New
	add r1, r5, #0
	add r1, #0xc0
	str r0, [r1]
	mov r4, #0
_021EE364:
	add r0, r5, #0
	add r1, r5, #0
	add r0, #0xc0
	add r1, #0x88
	ldr r0, [r0]
	ldr r1, [r1]
	add r2, r4, #7
	add r3, r4, #0
	bl ListMenuItems_AppendFromMsgData
	add r4, r4, #1
	cmp r4, #2
	blt _021EE364
	pop {r3, r4, r5, pc}
	thumb_func_end ov101_021EE350

	thumb_func_start ov101_021EE380
ov101_021EE380: ; 0x021EE380
	push {r4, lr}
	add r4, r0, #0
	add r0, #0xc0
	ldr r0, [r0]
	bl ListMenuItems_Delete
	mov r0, #0
	add r4, #0xc0
	str r0, [r4]
	pop {r4, pc}
	thumb_func_end ov101_021EE380

	thumb_func_start ov101_021EE394
ov101_021EE394: ; 0x021EE394
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x10]
	bl ov100_021E6914
	ldr r0, [r4, #0x10]
	mov r1, #2
	bl PokegearApp_CreateSpriteManager
	ldr r1, [r4]
	mov r0, #0x2a
	bl ov100_021E6E20
	add r1, r4, #0
	add r1, #0x84
	str r0, [r1]
	ldr r0, [r4, #0x10]
	add r0, #0x8c
	ldr r0, [r0]
	bl SpriteSystem_GetRenderer
	mov r2, #0xf
	mov r1, #0
	lsl r2, r2, #0x10
	bl G2dRenderer_SetSubSurfaceCoords
	ldr r1, [r4, #0x10]
	ldr r0, [r4]
	ldr r1, [r1, #0x78]
	bl TouchscreenListMenuSpawner_Create
	add r4, #0xbc
	str r0, [r4]
	pop {r4, pc}
	thumb_func_end ov101_021EE394

	thumb_func_start ov101_021EE3D8
ov101_021EE3D8: ; 0x021EE3D8
	push {r4, lr}
	add r4, r0, #0
	add r0, #0xbc
	ldr r0, [r0]
	bl TouchscreenListMenuSpawner_Destroy
	ldr r0, [r4, #0x10]
	add r0, #0x8c
	ldr r0, [r0]
	bl SpriteSystem_GetRenderer
	mov r2, #3
	mov r1, #0
	lsl r2, r2, #0x12
	bl G2dRenderer_SetSubSurfaceCoords
	add r0, r4, #0
	add r0, #0x84
	ldr r0, [r0]
	bl ov100_021E6E58
	ldr r0, [r4, #0x10]
	bl PokegearApp_DestroySpriteManager
	ldr r0, [r4, #0x10]
	bl ov100_021E6950
	pop {r4, pc}
	thumb_func_end ov101_021EE3D8

	thumb_func_start ov101_021EE410
ov101_021EE410: ; 0x021EE410
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, #0x84
	ldr r0, [r0]
	mov r6, #0
	ldr r0, [r0, #8]
	mov r7, #0x15
	str r0, [sp]
	add r4, r0, #0
_021EE422:
	ldr r1, [r5, #0x10]
	ldr r2, _021EE64C ; =ov101_021F807C
	add r0, r1, #0
	add r0, #0x8c
	add r1, #0x90
	ldr r0, [r0]
	ldr r1, [r1]
	bl SpriteSystem_CreateSpriteFromResourceHeader
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x84
	ldr r0, [r0]
	bl ov100_021E6EC4
	lsr r2, r6, #0x1f
	lsl r3, r6, #0x1f
	sub r3, r3, r2
	mov r1, #0x1f
	ror r3, r1
	add r3, r2, r3
	add r2, r6, r2
	mov r1, #0x68
	mul r1, r3
	asr r2, r2, #1
	add r3, r2, #0
	mul r3, r7
	add r1, #0x20
	add r3, #0xcb
	lsl r1, r1, #0x10
	lsl r2, r3, #0x10
	ldr r0, [r4, #0x20]
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	bl Sprite_SetPositionXY
	ldr r0, [r4, #0x20]
	mov r1, #0
	bl thunk_Sprite_SetPriority
	add r6, r6, #1
	add r4, #0x28
	cmp r6, #4
	blt _021EE422
	ldr r1, [r5, #0x10]
	ldr r2, _021EE650 ; =ov101_021F80A4
	add r0, r1, #0
	add r0, #0x8c
	add r1, #0x90
	ldr r0, [r0]
	ldr r1, [r1]
	bl SpriteSystem_CreateSpriteFromResourceHeader
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x84
	ldr r0, [r0]
	bl ov100_021E6EC4
	ldr r0, [sp]
	mov r1, #0
	add r0, #0xc0
	ldr r0, [r0]
	bl thunk_Sprite_SetPriority
	ldr r1, [r5, #0x10]
	ldr r2, _021EE654 ; =ov101_021F80CC
	add r0, r1, #0
	add r0, #0x8c
	add r1, #0x90
	ldr r0, [r0]
	ldr r1, [r1]
	bl SpriteSystem_CreateSpriteFromResourceHeader
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x84
	ldr r0, [r0]
	bl ov100_021E6EC4
	ldr r1, [r5, #0x10]
	ldr r2, _021EE658 ; =ov101_021F80F4
	add r0, r1, #0
	add r0, #0x8c
	add r1, #0x90
	ldr r0, [r0]
	ldr r1, [r1]
	bl SpriteSystem_CreateSpriteFromResourceHeader
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x84
	ldr r0, [r0]
	bl ov100_021E6EC4
	mov r7, #0
	ldr r6, [sp]
	add r4, r7, #0
_021EE4E6:
	ldr r1, [r5, #0x10]
	ldr r2, _021EE65C ; =ov101_021F811C
	add r0, r1, #0
	add r0, #0x8c
	add r1, #0x90
	ldr r0, [r0]
	ldr r1, [r1]
	bl SpriteSystem_CreateSpriteFromResourceHeader
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x84
	ldr r0, [r0]
	bl ov100_021E6EC4
	cmp r7, #0
	ble _021EE51A
	add r0, r4, #0
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _021EE528
_021EE51A:
	add r0, r4, #0
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_021EE528:
	bl _ffix
	add r1, r0, #0
	mov r0, #0x4e
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	bl Sprite_UpdateAnim
	mov r0, #1
	lsl r0, r0, #0xc
	add r7, r7, #1
	add r4, r4, r0
	add r6, #0x28
	cmp r7, #4
	blt _021EE4E6
	ldr r7, _021EE64C ; =ov101_021F807C
	mov r6, #0
_021EE54A:
	ldr r1, [r5, #0x10]
	add r3, r6, #5
	add r0, r1, #0
	add r0, #0x8c
	add r1, #0x90
	mov r2, #0x28
	mul r2, r3
	ldr r0, [r0]
	ldr r1, [r1]
	add r2, r7, r2
	bl SpriteSystem_CreateSpriteFromResourceHeader
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x84
	ldr r0, [r0]
	bl ov100_021E6EC4
	mov r1, #0x28
	mul r1, r0
	ldr r0, [sp]
	add r4, r0, r1
	ldr r0, [r4, #0x20]
	add r1, r4, #4
	add r2, r4, #6
	bl Sprite_GetPositionXY
	ldr r0, [r4, #0x20]
	mov r1, #0
	bl thunk_Sprite_SetPriority
	ldr r0, [r4, #0x20]
	mov r1, #1
	bl Sprite_SetAnimActiveFlag
	ldr r0, [r4, #0x20]
	mov r1, #0
	bl Sprite_SetDrawFlag
	add r6, r6, #1
	cmp r6, #4
	blt _021EE54A
	mov r6, #0
	mov r7, #0x28
_021EE5A2:
	ldr r1, [r5, #0x10]
	ldr r2, _021EE660 ; =ov101_021F81E4
	add r0, r1, #0
	add r0, #0x8c
	add r1, #0x90
	ldr r0, [r0]
	ldr r1, [r1]
	bl SpriteSystem_CreateSpriteFromResourceHeader
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x84
	ldr r0, [r0]
	bl ov100_021E6EC4
	add r1, r0, #0
	ldr r0, [sp]
	mul r1, r7
	add r4, r0, r1
	ldr r0, [r4, #0x20]
	add r1, r4, #4
	add r2, r4, #6
	bl Sprite_GetPositionXY
	ldr r0, [r4, #0x20]
	mov r1, #0
	bl Sprite_SetDrawFlag
	ldr r0, [r4, #0x20]
	mov r1, #0
	bl Sprite_SetAnimActiveFlag
	add r6, r6, #1
	cmp r6, #0x1b
	blt _021EE5A2
	mov r4, #0
	mov r7, #0x28
_021EE5EC:
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
	add r1, r0, #0
	ldr r0, [sp]
	mul r1, r7
	add r6, r0, r1
	ldr r0, [r6, #0x20]
	add r1, r6, #4
	add r2, r6, #6
	bl Sprite_GetPositionXY
	ldr r0, [r6, #0x20]
	mov r1, #0
	bl Sprite_SetDrawFlag
	add r4, r4, #1
	cmp r4, #0xb
	blt _021EE5EC
	ldr r0, [sp]
	mov r1, #1
	add r0, #0xe8
	ldr r0, [r0]
	bl Sprite_SetAnimActiveFlag
	mov r1, #0x11
	ldr r0, [sp]
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	mov r1, #0
	bl Sprite_SetAnimActiveFlag
	mov r1, #0x11
	ldr r0, [sp]
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	ldr r1, [r5, #0x10]
	ldr r1, [r1, #0x20]
	ldrb r1, [r1, #7]
	bl Sprite_SetAnimationFrame
	ldr r0, [sp]
	mov r1, #2
	add r0, #0xe8
	str r0, [sp]
	ldr r0, [r0]
	bl Sprite_SetAffineOverwriteMode
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021EE64C: .word ov101_021F807C
_021EE650: .word ov101_021F80A4
_021EE654: .word ov101_021F80CC
_021EE658: .word ov101_021F80F4
_021EE65C: .word ov101_021F811C
_021EE660: .word ov101_021F81E4
	thumb_func_end ov101_021EE410

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

	.balign 4, 0
	.global ov101_021F7B30
ov101_021F7B30: ; 0x021F7B30
	.short 0x0000
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x48, 0x54, 0xEE, 0x12, 0xF4, 0x06

	.global ov101_021F7B3C
ov101_021F7B3C: ; 0x021F7B3C
	.word 1
	.short 0
	.short 0
	.short 0
	.short 4
	.word 1
	.word 4
	.word 1
	.word 0
	.word 0
	.word 0
	.word 0

	.global ov101_021F7B64
ov101_021F7B64: ; 0x021F7B64
	.byte 0x05, 0x01, 0x08, 0x05, 0x03, 0x01
	.short 0x03F0
	.byte 0x05, 0x03, 0x0C, 0x0C, 0x02, 0x01
	.short 0x03D8
	.byte 0x05, 0x01, 0x0E, 0x1C, 0x04, 0x01
	.short 0x0368
	.byte 0x05, 0x05, 0x12, 0x0B, 0x05, 0x01
	.short 0x0331
	.byte 0x05, 0x12, 0x12, 0x0B, 0x05, 0x01
	.short 0x02FA
	.byte 0x05, 0x05, 0x14, 0x0B, 0x02, 0x01
	.short 0x02E4
	.byte 0x05, 0x12, 0x16, 0x0B, 0x02, 0x01
	.short 0x02CE
	.byte 0x01, 0x03, 0x00, 0x0C, 0x03, 0x0A
	.short 0x03DB

	.global ov101_021F7BA4
ov101_021F7BA4: ; 0x021F7BA4
	.short 0x0000
	.byte 0x07, 0x01, 0xFF, 0xFF, 0x28, 0x84, 0xF8, 0x08, 0xF8, 0x08
	.short 0x0001
	.byte 0x00, 0x02, 0xFF, 0xFF, 0x40, 0x84, 0xF8, 0x08, 0xF8, 0x08
	.short 0x0002
	.byte 0x01, 0x03, 0xFF, 0xFF, 0x58, 0x84, 0xF8, 0x08, 0xF8, 0x08
	.short 0x0003
	.byte 0x02, 0x04, 0xFF, 0xFF, 0x70, 0x84, 0xF8, 0x08, 0xF8, 0x08
	.short 0x0004
	.byte 0x03, 0x05, 0xFF, 0xFF, 0x88, 0x84, 0xF8, 0x08, 0xF8, 0x08
	.short 0x0005
	.byte 0x04, 0x06, 0xFF, 0xFF, 0xA0, 0x84, 0xF8, 0x08, 0xF8, 0x08
	.short 0x0006
	.byte 0x05, 0x07, 0xFF, 0xFF, 0xB8, 0x84, 0xF8, 0x08, 0xF8, 0x08
	.short 0x0007
	.byte 0x06, 0x00, 0xFF, 0xFF, 0xD0, 0x84, 0xF8, 0x08, 0xF8, 0x08

	.global ov101_021F7C04
ov101_021F7C04: ; 0x021F7C04
	.short 0x0000
	.byte 0x03, 0x01, 0x04, 0x04, 0x20, 0x20, 0xFA, 0x06, 0xFA, 0x06
	.short 0x0001
	.byte 0x00, 0x02, 0x05, 0x05, 0x28, 0x1F, 0x06, 0x50, 0xFA, 0x06
	.short 0x0002
	.byte 0x01, 0x03, 0x06, 0x06, 0x88, 0x20, 0xFA, 0x06, 0xFA, 0x06
	.short 0x0003
	.byte 0x02, 0x00, 0x08, 0x07, 0x90, 0x1F, 0x06, 0x50, 0xFA, 0x06
	.short 0x0004
	.byte 0x07, 0x05, 0x00, 0x00, 0x20, 0x35, 0xFA, 0x06, 0xFA, 0x06
	.short 0x0005
	.byte 0x04, 0x06, 0x01, 0x01, 0x28, 0x34, 0x06, 0x50, 0xFA, 0x06
	.short 0x0006
	.byte 0x05, 0x07, 0x02, 0x02, 0x88, 0x35, 0xFA, 0x06, 0xFA, 0x06
	.short 0x0007
	.byte 0x06, 0x04, 0x03, 0x08, 0x90, 0x34, 0x06, 0x50, 0xFA, 0x06
	.short 0x0008
	.byte 0xFF, 0xFF, 0x07, 0x03, 0xD0, 0x54, 0xF0, 0x10, 0xF7, 0x03

	.global ov101_021F7C70
ov101_021F7C70: ; 0x021F7C70
	.word 1
	.short 0
	.short 0
	.short 0
	.short 3
	.word 4
	.word 4
	.word 1
	.word 0
	.word 0
	.word 0
	.word 0

// ov101_021F7C98: ; 0x021F7C98
	.word 1
	.short 0
	.short 0
	.short 0
	.short 0
	.word 4
	.word 6
	.word 1
	.word 0
	.word 0
	.word 0
	.word 0

// ov101_021F7CC0: ; 0x021F7CC0
	.word 0
	.short 0
	.short 0
	.short 0
	.short 0
	.word 4
	.word 4
	.word 1
	.word 0
	.word 0
	.word 0
	.word 0

// ov101_021F7CE8: ; 0x021F7CE8
	.word 2
	.short 0
	.short 0
	.short 0
	.short 0
	.word 4
	.word 5
	.word 1
	.word 0
	.word 0
	.word 0
	.word 0

	.global ov101_021F7D10
	.balign 4, 0
ov101_021F7D10: ; 0x021F7D10
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
	.byte 0x01, 0x00, 0x1E, 0x00, 0x00, 0x00, 0x00, 0x00
	.word 0x00000000
	.word 0x00000000, 0x00000000, 0x00000800, 0x00000000
	.byte 0x01, 0x00, 0x1D, 0x00, 0x00, 0x01, 0x00, 0x00
	.word 0x00000000
	.word 0x00000000, 0x00000000, 0x00000800, 0x00000000
	.byte 0x01, 0x00, 0x1C, 0x04, 0x00, 0x02, 0x00, 0x00
	.word 0x00000000

	.global ov101_021F7DB8
ov101_021F7DB8: ; 0x021F7DB8
	.word 0
	.short 0x20
	.short 0x60
	.short 0
	.short 0
	.word 0
	.word 4
	.word 2
	.word 0
	.word 0
	.word 0
	.word 0

// ov101_021F7DE0: ; 0x021F7DE0
	.word 0
	.short 0x10
	.short 0x98
	.short 0
	.short 1
	.word 0
	.word 4
	.word 2
	.word 0
	.word 0
	.word 0
	.word 0

// ov101_021F7E08: ; 0x021F7E08
	.word 1
	.short 0x20
	.short 0x80
	.short 0
	.short 0
	.word 1
	.word 4
	.word 1
	.word 0
	.word 0
	.word 0
	.word 0

// ov101_021F7E30: ; 0x021F7E30
	.word 1
	.short 0x20
	.short 0x60
	.short 0
	.short 1
	.word 1
	.word 4
	.word 1
	.word 0
	.word 0
	.word 0
	.word 0

// ov101_021F7E58: ; 0x021F7E58
	.word 1
	.short 0x20
	.short 0x60
	.short 0
	.short 2
	.word 1
	.word 4
	.word 1
	.word 0
	.word 0
	.word 0
	.word 0

	.global ov101_021F7E80
ov101_021F7E80: ; 0x021F7E80
	.byte (1<<0)|(1<<1), 0, 0, 14, 0, 0
	.short 0x001C, 0x0001, 0x0040

	.global ov101_021F7E8C
ov101_021F7E8C: ; 0x021F7E8C
	.byte 0x16, 0x0A
	.byte 0x10, 0x07

ov101_021F7E90:
	.byte 0xFF, 0x00, 0x00, 0x00

	.global ov101_021F7E94
ov101_021F7E94: ; 0x021F7E94
	.byte 0x98, 0xB8, 0xC2, 0xFE
	.byte 0xFF, 0x00, 0x00, 0x00

	.global ov101_021F7E9C
ov101_021F7E9C: ; 0x021F7E9C
	.byte 0x01, 0x10, 0x01, 0x16
	.byte 0x01, 0x07, 0x01, 0x0A

	.global ov101_021F7EA4
ov101_021F7EA4: ; 0x021F7EA4
	.byte 0x08, 0x98, 0x08, 0xC8
	.byte 0x10, 0x90, 0x28, 0xE0

	.global ov101_021F7EAC
ov101_021F7EAC: ; 0x021F7EAC
	.byte 0x10, 0x40, 0xD8, 0xF8
	.byte 0x58, 0x98, 0xD8, 0xF8
	.byte 0xFF, 0x00, 0x00, 0x00

ov101_021F7EB8: ; 0x021F7EB8
	.byte 0x18, 0x2C, 0x18, 0x28
	.byte 0x18, 0x2C, 0x80, 0x90
	.byte 0x2C, 0x40, 0x18, 0x28
	.byte 0x2C, 0x40, 0x80, 0x90
	.byte 0xFF, 0x00, 0x00, 0x00

ov101_021F7ECC: ; 0x021F7ECC
	.byte 0x18, 0x2C, 0x18, 0x28
	.byte 0x18, 0x2C, 0x80, 0x90, 0x2C, 0x40, 0x18, 0x28, 0x2C, 0x40, 0x80, 0x90, 0x18, 0x2C, 0x28, 0x80
	.byte 0x18, 0x2C, 0x90, 0xE8, 0x2C, 0x40, 0x28, 0x80, 0x2C, 0x40, 0x90, 0xE8

ov101_021F7EEC: ; 0x021F7EEC
	.byte 0x44, 0x60, 0x2C, 0x64
	.byte 0xFF, 0x00, 0x00, 0x00

ov101_021F7EF4: ; 0x021F7EF4
	.byte 0x18, 0x2C, 0x18, 0x28, 0x18, 0x2C, 0x28, 0x80, 0x18, 0x2C, 0x80, 0x90
	.byte 0x18, 0x2C, 0x90, 0xE8, 0x2C, 0x40, 0x18, 0x28, 0x2C, 0x40, 0x28, 0x80, 0x2C, 0x40, 0x80, 0x90
	.byte 0x2C, 0x40, 0x90, 0xE8, 0x7C, 0x8C, 0x20, 0x30, 0x7C, 0x8C, 0x38, 0x48, 0x7C, 0x8C, 0x50, 0x60
	.byte 0x7C, 0x8C, 0x68, 0x78, 0x7C, 0x8C, 0x80, 0x90, 0x7C, 0x8C, 0x98, 0xA8, 0x7C, 0x8C, 0xB0, 0xC0
	.byte 0x7C, 0x8C, 0xC8, 0xD8, 0x40, 0x68, 0xC0, 0xE8, 0xFF, 0x00, 0x00, 0x00

ov101_021F7F3C: ; 0x021F7F3C
	.byte 0x1A, 0x00, 0x1D, 0x00
	.byte 0x2D, 0x00, 0x00, 0x00

ov101_021F7F44: ; 0x021F7F44
	.byte 0x01, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov101_021F7F54: ; 0x021F7F54
	.byte 0x05, 0x01, 0x08, 0x05, 0x03, 0x01, 0xF0, 0x03, 0x05, 0x03, 0x0B, 0x0C
	.byte 0x02, 0x01, 0xD8, 0x03, 0x05, 0x01, 0x0E, 0x1C, 0x04, 0x01, 0x68, 0x03, 0x05, 0x05, 0x12, 0x0B
	.byte 0x05, 0x01, 0x31, 0x03, 0x05, 0x12, 0x12, 0x0B, 0x05, 0x01, 0xFA, 0x02, 0x05, 0x05, 0x14, 0x0B
	.byte 0x02, 0x01, 0xE4, 0x02, 0x05, 0x12, 0x16, 0x0B, 0x02, 0x01, 0xCE, 0x02, 0x00, 0x00, 0x15, 0x19
	.byte 0x02, 0x0A, 0x5C, 0x00, 0x00, 0x19, 0x15, 0x06, 0x02, 0x0A, 0x8E, 0x00

ov101_021F7F9C: ; 0x021F7F9C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x02
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x00, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x04, 0x01, 0x1A, 0x04, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x01, 0x16, 0x04, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x02
	.byte 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1C, 0x04, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov101_021F807C: ; 0x021F807C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x20, 0x00, 0x60, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov101_021F80A4: ; 0x021F80A4
	.byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x90, 0x00, 0x00, 0x00, 0x01, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov101_021F80CC: ; 0x021F80CC
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0x20, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov101_021F80F4: ; 0x021F80F4
	.byte 0x01, 0x00, 0x00, 0x00, 0x20, 0x00, 0x60, 0x00, 0x00, 0x00, 0x01, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov101_021F811C: ; 0x021F811C
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0x20, 0x00, 0x60, 0x00, 0x00, 0x00, 0x02, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov101_021F81E4: ; 0x021F81E4
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x09, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
