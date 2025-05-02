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

	.extern ov101_021F8400
	.extern ov101_021F09B0
	.extern ov101_021F0ACC
	.extern ov101_021F2110
	.extern ov101_021F217C
	.extern PhoneCallMessagePrint
	.extern PhoneCallMessagePrint_Gendered
	.extern PhoneCallMessagePrint_Ungendered
	.extern ov101_021F2220
	.extern ov101_021F2248
	.extern ov101_021F2308
	.extern ov101_021F2384
	.extern ov101_021F2338
	.extern ov101_021F2344
	.extern ov101_021F2374
	.extern ov101_021F2384
	.extern ov101_021F23F0
	.extern ov101_021F243C
	.extern ov101_021F2494
	.extern ov101_021F2510
	.extern ov101_021F2598
	.extern ov101_021F2614
	.extern ov101_021F2680
	.extern ov101_021F2C78
	.extern ov101_021F2E04
	.extern ov101_021F2E74

	thumb_func_start PhoneCall_GetScriptId_DayCareMan
PhoneCall_GetScriptId_DayCareMan: ; 0x021F36F4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r1, [sp]
	add r7, r0, #0
	ldr r0, [sp]
	mov r1, #0
	strh r1, [r0, #0x20]
	ldrb r0, [r0, #0x19]
	cmp r0, #0
	beq _021F3720
	ldr r0, [r7, #0x28]
	ldr r1, _021F3794 ; =0x00000992
	bl Save_VarsFlags_CheckFlagInArray
	cmp r0, #0
	beq _021F371A
	add sp, #8
	mov r0, #0x60
	pop {r3, r4, r5, r6, r7, pc}
_021F371A:
	add sp, #8
	mov r0, #0x5f
	pop {r3, r4, r5, r6, r7, pc}
_021F3720:
	ldr r0, [r7, #0x1c]
	bl Save_Daycare_Get
	ldr r1, [sp]
	str r0, [sp, #4]
	str r0, [r1, #0x50]
	add r0, r1, #0
	add r4, r1, #0
	mov r5, #0
	add r0, #0x4a
	strb r5, [r0]
	add r4, #0x4a
_021F3738:
	ldr r0, [sp, #4]
	add r1, r5, #0
	bl Save_Daycare_GetMonX
	add r6, r0, #0
	bl DaycareMon_GetBoxMon
	mov r1, #5
	mov r2, #0
	bl GetBoxMonData
	cmp r0, #0
	beq _021F376A
	add r0, r6, #0
	bl DaycareMon_GetBoxMon
	add r2, r0, #0
	add r1, r5, #0
	ldr r0, [r7, #0x50]
	add r1, #0xa
	bl BufferBoxMonNickname
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
_021F376A:
	add r5, r5, #1
	cmp r5, #2
	blt _021F3738
	ldr r0, [sp]
	add r0, #0x4a
	ldrb r0, [r0]
	cmp r0, #2
	bne _021F3786
	ldr r0, [sp, #4]
	bl Save_Daycare_CalcCompatibility
	ldr r1, [sp]
	add r1, #0x48
	strh r0, [r1]
_021F3786:
	ldr r0, [sp]
	mov r1, #7
	strh r1, [r0, #0x20]
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F3794: .word 0x00000992
	thumb_func_end PhoneCall_GetScriptId_DayCareMan

	thumb_func_start ov101_021F3798
ov101_021F3798: ; 0x021F3798
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r5, #0
	add r4, #0x88
	ldr r1, [r4, #4]
	cmp r1, #3
	bhi _021F386A
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021F37B2: ; jump table
	.short _021F37BA - _021F37B2 - 2 ; case 0
	.short _021F37CA - _021F37B2 - 2 ; case 1
	.short _021F3830 - _021F37B2 - 2 ; case 2
	.short _021F3852 - _021F37B2 - 2 ; case 3
_021F37BA:
	bl ov101_021F2110
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #2
	bl PhoneCallMessagePrint_Ungendered
	b _021F3882
_021F37CA:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F37D6
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F37D6:
	ldr r0, [r4, #0x50]
	bl Save_Daycare_HasEgg
	cmp r0, #0
	beq _021F37F0
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #3
	bl PhoneCallMessagePrint_Ungendered
	mov r0, #0xff
	str r0, [r4, #4]
	b _021F382C
_021F37F0:
	add r0, r4, #0
	add r0, #0x4a
	ldrb r0, [r0]
	cmp r0, #0
	bne _021F380A
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #4
	bl PhoneCallMessagePrint_Ungendered
	mov r0, #3
	str r0, [r4, #4]
	b _021F382C
_021F380A:
	cmp r0, #1
	bne _021F381E
	mov r0, #3
	str r0, [r4, #4]
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #5
	bl PhoneCallMessagePrint_Ungendered
	b _021F382C
_021F381E:
	mov r0, #2
	str r0, [r4, #4]
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #6
	bl PhoneCallMessagePrint_Ungendered
_021F382C:
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F3830:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F383C
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F383C:
	add r2, r4, #0
	add r2, #0x48
	ldrh r2, [r2]
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	add r2, r2, #7
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	bl PhoneCallMessagePrint_Ungendered
	b _021F3882
_021F3852:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F385E
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F385E:
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #0xb
	bl PhoneCallMessagePrint_Ungendered
	b _021F3882
_021F386A:
	add r0, r5, #0
	bl ov101_021F2220
	cmp r0, #0
	bne _021F3878
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F3878:
	ldr r0, [r5, #0x4c]
	bl DestroyMsgData
	mov r0, #1
	pop {r3, r4, r5, pc}
_021F3882:
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov101_021F3798

	thumb_func_start PhoneCall_GetScriptId_DayCareLady
PhoneCall_GetScriptId_DayCareLady: ; 0x021F388C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	mov r1, #0
	strh r1, [r5, #0x20]
	ldr r1, [r5, #0x10]
	ldrh r2, [r1, #6]
	ldrh r1, [r0, #0x30]
	cmp r2, r1
	bne _021F38A2
	mov r0, #0x61
	pop {r3, r4, r5, r6, r7, pc}
_021F38A2:
	ldr r0, [r0, #0x1c]
	bl Save_Daycare_Get
	add r6, r5, #0
	str r0, [sp]
	str r0, [r5, #0x50]
	add r0, r5, #0
	mov r4, #0
	add r0, #0x4a
	strb r4, [r0]
	add r6, #0x4a
_021F38B8:
	ldr r0, [sp]
	add r1, r4, #0
	bl Save_Daycare_GetMonX
	add r7, r0, #0
	bl DaycareMon_GetBoxMon
	mov r1, #5
	mov r2, #0
	bl GetBoxMonData
	cmp r0, #0
	beq _021F38E4
	ldrb r0, [r6]
	add r0, r0, #1
	strb r0, [r6]
	add r0, r7, #0
	bl DaycareMon_CalcLevelGrowth
	add r1, r5, r4
	add r1, #0x4b
	b _021F38EA
_021F38E4:
	add r1, r5, r4
	add r1, #0x4b
	mov r0, #0
_021F38EA:
	add r4, r4, #1
	strb r0, [r1]
	cmp r4, #2
	blt _021F38B8
	mov r0, #6
	strh r0, [r5, #0x20]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end PhoneCall_GetScriptId_DayCareLady

	thumb_func_start ov101_021F38FC
ov101_021F38FC: ; 0x021F38FC
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	add r4, r5, #0
	add r4, #0x88
	ldr r1, [r4, #4]
	cmp r1, #4
	bls _021F390E
	b _021F3A7A
_021F390E:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021F391A: ; jump table
	.short _021F3924 - _021F391A - 2 ; case 0
	.short _021F3936 - _021F391A - 2 ; case 1
	.short _021F396E - _021F391A - 2 ; case 2
	.short _021F3A02 - _021F391A - 2 ; case 3
	.short _021F3A4A - _021F391A - 2 ; case 4
_021F3924:
	bl ov101_021F2110
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #3
	mov r3, #4
	bl PhoneCallMessagePrint_Gendered
	b _021F3A96
_021F3936:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F3944
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F3944:
	add r0, r4, #0
	add r0, #0x4a
	ldrb r0, [r0]
	cmp r0, #0
	bne _021F3962
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #0xa
	bl PhoneCallMessagePrint_Ungendered
	mov r0, #0xff
	str r0, [r4, #4]
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F3962:
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #5
	bl PhoneCallMessagePrint_Ungendered
	b _021F3A96
_021F396E:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F397C
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F397C:
	add r0, r4, #0
	add r0, #0x4b
	ldrb r0, [r0]
	cmp r0, #0
	beq _021F399E
	add r0, r4, #0
	add r0, #0x4c
	ldrb r0, [r0]
	mov r6, #0
	cmp r0, #0
	bne _021F3998
	mov r0, #4
	str r0, [r4, #4]
	b _021F39C4
_021F3998:
	mov r0, #3
	str r0, [r4, #4]
	b _021F39C4
_021F399E:
	add r0, r4, #0
	add r0, #0x4c
	ldrb r0, [r0]
	cmp r0, #0
	beq _021F39B0
	mov r0, #4
	mov r6, #1
	str r0, [r4, #4]
	b _021F39C4
_021F39B0:
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #9
	bl PhoneCallMessagePrint_Ungendered
	mov r0, #0xff
	str r0, [r4, #4]
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F39C4:
	ldr r0, [r4, #0x50]
	add r1, r6, #0
	bl Save_Daycare_GetMonX
	bl DaycareMon_GetBoxMon
	add r2, r0, #0
	ldr r0, [r5, #0x50]
	mov r1, #0xa
	bl BufferBoxMonNickname
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	add r2, r4, r6
	str r0, [sp, #4]
	add r2, #0x4b
	ldrb r2, [r2]
	ldr r0, [r5, #0x50]
	mov r1, #0xb
	mov r3, #3
	bl BufferIntegerAsString
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #6
	bl PhoneCallMessagePrint_Ungendered
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F3A02:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F3A10
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F3A10:
	ldr r0, [r4, #0x50]
	mov r1, #1
	bl Save_Daycare_GetMonX
	bl DaycareMon_GetBoxMon
	add r2, r0, #0
	ldr r0, [r5, #0x50]
	mov r1, #0xa
	bl BufferBoxMonNickname
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	add r2, r4, #0
	str r0, [sp, #4]
	add r2, #0x4c
	ldrb r2, [r2]
	ldr r0, [r5, #0x50]
	mov r1, #0xb
	mov r3, #3
	bl BufferIntegerAsString
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #6
	bl PhoneCallMessagePrint_Ungendered
	b _021F3A96
_021F3A4A:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F3A58
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F3A58:
	add r0, r4, #0
	add r0, #0x4a
	ldrb r0, [r0]
	cmp r0, #1
	bne _021F3A6E
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #8
	bl PhoneCallMessagePrint_Ungendered
	b _021F3A96
_021F3A6E:
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #9
	bl PhoneCallMessagePrint_Ungendered
	b _021F3A96
_021F3A7A:
	add r0, r5, #0
	bl ov101_021F2220
	cmp r0, #0
	bne _021F3A8A
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F3A8A:
	ldr r0, [r5, #0x4c]
	bl DestroyMsgData
	add sp, #8
	mov r0, #1
	pop {r4, r5, r6, pc}
_021F3A96:
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	mov r0, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov101_021F38FC

	thumb_func_start PhoneCall_GetScriptId_Buena
PhoneCall_GetScriptId_Buena: ; 0x021F3AA4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #0
	strh r0, [r4, #0x20]
	ldr r0, [r5, #0x28]
	bl CheckGameClearFlag
	add r1, r4, #0
	add r1, #0x4d
	ldrb r1, [r1]
	mov r2, #1
	lsl r0, r0, #0x18
	bic r1, r2
	lsr r2, r0, #0x18
	mov r0, #1
	and r0, r2
	orr r1, r0
	add r0, r4, #0
	add r0, #0x4d
	strb r1, [r0]
	ldr r0, [r4, #0x38]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl ov101_021F3C60
	add r1, r4, #0
	add r1, #0x4a
	strb r0, [r1]
	ldr r0, [r5, #0x28]
	bl Save_VarsFlags_IsInRocketTakeover
	cmp r0, #0
	beq _021F3AEC
	mov r0, #0x63
	pop {r3, r4, r5, pc}
_021F3AEC:
	ldrb r0, [r4, #0x19]
	cmp r0, #0
	beq _021F3AFA
	mov r0, #9
	strh r0, [r4, #0x20]
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F3AFA:
	add r0, r4, #0
	add r0, #0x4a
	ldrb r0, [r0]
	cmp r0, #3
	bne _021F3B08
	mov r0, #0x64
	pop {r3, r4, r5, pc}
_021F3B08:
	ldr r0, [r4, #0x10]
	ldrh r1, [r0, #6]
	ldrh r0, [r5, #0x30]
	cmp r1, r0
	bne _021F3B16
	mov r0, #0x62
	pop {r3, r4, r5, pc}
_021F3B16:
	mov r0, #8
	strh r0, [r4, #0x20]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end PhoneCall_GetScriptId_Buena

	thumb_func_start ov101_021F3B20
ov101_021F3B20: ; 0x021F3B20
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r5, #0
	add r4, #0x88
	ldr r1, [r4, #4]
	cmp r1, #0
	beq _021F3B34
	cmp r1, #1
	beq _021F3B56
	b _021F3B7E
_021F3B34:
	bl ov101_021F2110
	add r0, r4, #0
	add r0, #0x23
	ldrb r0, [r0]
	ldr r1, [r5, #0x4c]
	lsl r3, r0, #1
	add r2, r3, #3
	add r3, r3, #4
	lsl r2, r2, #0x18
	lsl r3, r3, #0x18
	add r0, r5, #0
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl PhoneCallMessagePrint_Gendered
	b _021F3B94
_021F3B56:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F3B62
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F3B62:
	bl LCRandom
	mov r1, #3
	bl _s32_div_f
	add r2, r1, #0
	add r2, #0xa
	lsl r2, r2, #0x18
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	lsr r2, r2, #0x18
	bl PhoneCallMessagePrint_Ungendered
	b _021F3B94
_021F3B7E:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F3B8A
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F3B8A:
	ldr r0, [r5, #0x4c]
	bl DestroyMsgData
	mov r0, #1
	pop {r3, r4, r5, pc}
_021F3B94:
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov101_021F3B20

	thumb_func_start ov101_021F3BA0
ov101_021F3BA0: ; 0x021F3BA0
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r4, r6, #0
	add r4, #0x88
	ldr r1, [r4, #4]
	cmp r1, #0
	beq _021F3BB4
	cmp r1, #1
	beq _021F3BD8
	b _021F3C3E
_021F3BB4:
	bl ov101_021F2110
	add r0, r4, #0
	add r0, #0x23
	ldrb r0, [r0]
	ldr r1, [r6, #0x4c]
	lsl r3, r0, #1
	add r2, r3, #0
	add r2, #0xf
	add r3, #0x10
	lsl r2, r2, #0x18
	lsl r3, r3, #0x18
	add r0, r6, #0
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl PhoneCallMessagePrint_Gendered
	b _021F3C54
_021F3BD8:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F3BE4
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F3BE4:
	add r0, r4, #0
	add r0, #0x4a
	ldrb r0, [r0]
	cmp r0, #3
	bne _021F3BFA
	ldr r1, [r6, #0x4c]
	add r0, r6, #0
	mov r2, #0x24
	bl PhoneCallMessagePrint_Ungendered
	b _021F3C54
_021F3BFA:
	add r0, r4, #0
	add r0, #0x4d
	ldrb r0, [r0]
	lsl r0, r0, #0x1f
	lsr r1, r0, #0x1f
	lsl r0, r1, #1
	add r0, r1, r0
	add r0, #0xb
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	bl LCRandom
	add r1, r5, #0
	bl _s32_div_f
	lsl r0, r1, #0x18
	lsr r2, r0, #0x18
	cmp r2, #0xd
	bne _021F3C2E
	ldr r1, [r6, #0x4c]
	add r0, r6, #0
	mov r2, #0x22
	mov r3, #0x23
	bl PhoneCallMessagePrint_Gendered
	b _021F3C54
_021F3C2E:
	add r2, #0x15
	lsl r2, r2, #0x18
	ldr r1, [r6, #0x4c]
	add r0, r6, #0
	lsr r2, r2, #0x18
	bl PhoneCallMessagePrint_Ungendered
	b _021F3C54
_021F3C3E:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F3C4A
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F3C4A:
	ldr r0, [r6, #0x4c]
	bl DestroyMsgData
	mov r0, #1
	pop {r4, r5, r6, pc}
_021F3C54:
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov101_021F3BA0

	thumb_func_start ov101_021F3C60
ov101_021F3C60: ; 0x021F3C60
	push {r4, lr}
	add r4, r0, #0
	bl sub_02095FF8
	cmp r0, #0
	beq _021F3C70
	mov r0, #3
	pop {r4, pc}
_021F3C70:
	cmp r4, #3
	bls _021F3C7C
	cmp r4, #0xa
	bhs _021F3C7C
	mov r0, #0
	pop {r4, pc}
_021F3C7C:
	cmp r4, #9
	bls _021F3C88
	cmp r4, #0x14
	bhs _021F3C88
	mov r0, #1
	pop {r4, pc}
_021F3C88:
	mov r0, #2
	pop {r4, pc}
	thumb_func_end ov101_021F3C60

	thumb_func_start PhoneCall_GetScriptId_EthanLyra
PhoneCall_GetScriptId_EthanLyra: ; 0x021F3C8C
	ldrb r2, [r1, #0x19]
	cmp r2, #0
	beq _021F3C9A
	mov r0, #0xb
	strh r0, [r1, #0x20]
	mov r0, #0
	bx lr
_021F3C9A:
	ldr r2, [r1, #0x10]
	ldrh r3, [r2, #6]
	ldrh r2, [r0, #0x30]
	cmp r3, r2
	bne _021F3CB4
	mov r2, #0
	strh r2, [r1, #0x20]
	add r0, #0x36
	ldrb r0, [r0]
	lsl r1, r0, #1
	ldr r0, _021F3CBC ; =ov101_021F86C8
	ldrh r0, [r0, r1]
	bx lr
_021F3CB4:
	mov r0, #0xa
	strh r0, [r1, #0x20]
	mov r0, #0
	bx lr
	.balign 4, 0
_021F3CBC: .word ov101_021F86C8
	thumb_func_end PhoneCall_GetScriptId_EthanLyra

	thumb_func_start ov101_021F3CC0
ov101_021F3CC0: ; 0x021F3CC0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r5, #0
	add r4, #0x88
	ldr r1, [r4, #4]
	cmp r1, #0
	beq _021F3CD8
	cmp r1, #1
	beq _021F3CDE
	cmp r1, #2
	beq _021F3CF2
	b _021F3D14
_021F3CD8:
	bl ov101_021F2110
	b _021F3D2A
_021F3CDE:
	add r2, r4, #0
	add r2, #0x23
	ldrb r2, [r2]
	ldr r1, [r5, #0x4c]
	add r2, r2, #4
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	bl PhoneCallMessagePrint_Ungendered
	b _021F3D2A
_021F3CF2:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F3CFE
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F3CFE:
	ldrh r0, [r5, #0x32]
	bl ov101_021F3E74
	add r2, r0, #0
	lsl r2, r2, #0x18
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	lsr r2, r2, #0x18
	bl PhoneCallMessagePrint_Ungendered
	b _021F3D2A
_021F3D14:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F3D20
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F3D20:
	ldr r0, [r5, #0x4c]
	bl DestroyMsgData
	mov r0, #1
	pop {r3, r4, r5, pc}
_021F3D2A:
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov101_021F3CC0

	thumb_func_start ov101_021F3D34
ov101_021F3D34: ; 0x021F3D34
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	ldr r0, [r5, #0x1c]
	mov r4, #0
	bl SaveData_GSPlayerMisc_Get
	bl sub_0202EE70
	add r6, r0, #0
	mov r1, #1
	add r0, sp, #0
	strb r1, [r0]
	ldr r0, [r5, #0x28]
	mov r1, #2
	mov r2, #0x19
	bl Save_VarsFlags_FlypointFlagAction
	cmp r0, #0
	beq _021F3D62
	mov r1, #1
	add r0, sp, #0
	strb r1, [r0, #1]
_021F3D62:
	cmp r6, #0
	beq _021F3D6C
	mov r1, #1
	add r0, sp, #0
	strb r1, [r0, #2]
_021F3D6C:
	cmp r6, #1
	bls _021F3D76
	mov r1, #1
	add r0, sp, #0
	strb r1, [r0, #3]
_021F3D76:
	ldr r0, [r5]
	mov r1, #0x49
	bl AllocFromHeapAtEnd
	mov r1, #0
	mov r2, #0x49
	add r5, r0, #0
	bl MI_CpuFill8
	ldr r3, _021F3DC4 ; =ov101_021F8760
	mov r1, #0
	add r0, sp, #0
_021F3D8E:
	ldrb r2, [r3]
	ldrb r2, [r0, r2]
	cmp r2, #0
	beq _021F3DA0
	add r2, r4, #0
	add r4, r4, #1
	lsl r4, r4, #0x18
	lsr r4, r4, #0x18
	strb r1, [r5, r2]
_021F3DA0:
	add r1, r1, #1
	add r3, r3, #1
	cmp r1, #0x49
	blt _021F3D8E
	bl LCRandom
	add r1, r4, #0
	bl _s32_div_f
	ldrb r4, [r5, r1]
	add r0, r5, #0
	bl FreeToHeap
	add r4, #0x56
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_021F3DC4: .word ov101_021F8760
	thumb_func_end ov101_021F3D34

	thumb_func_start ov101_021F3DC8
ov101_021F3DC8: ; 0x021F3DC8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r5, #0
	add r4, #0x88
	ldr r1, [r4, #4]
	cmp r1, #0
	beq _021F3DE0
	cmp r1, #1
	beq _021F3DE6
	cmp r1, #2
	beq _021F3DFA
	b _021F3E54
_021F3DE0:
	bl ov101_021F2110
	b _021F3E6A
_021F3DE6:
	add r2, r4, #0
	add r2, #0x23
	ldrb r2, [r2]
	ldr r1, [r5, #0x4c]
	add r2, r2, #7
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	bl PhoneCallMessagePrint_Ungendered
	b _021F3E6A
_021F3DFA:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F3E06
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F3E06:
	bl LCRandom
	mov r1, #0xfa
	lsl r1, r1, #2
	bl _s32_div_f
	mov r0, #0x7d
	lsl r0, r0, #2
	cmp r1, r0
	bge _021F3E42
	bl LCRandom
	mov r1, #0xe1
	lsl r1, r1, #2
	bl _s32_div_f
	add r0, r1, #0
	mov r1, #0x4b
	lsl r1, r1, #2
	bl _s32_div_f
	add r2, r0, #0
	add r2, #0xa
	lsl r2, r2, #0x18
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	lsr r2, r2, #0x18
	bl PhoneCallMessagePrint_Ungendered
	b _021F3E6A
_021F3E42:
	add r0, r5, #0
	bl ov101_021F3D34
	add r2, r0, #0
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	bl PhoneCallMessagePrint_Ungendered
	b _021F3E6A
_021F3E54:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F3E60
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F3E60:
	ldr r0, [r5, #0x4c]
	bl DestroyMsgData
	mov r0, #1
	pop {r3, r4, r5, pc}
_021F3E6A:
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov101_021F3DC8

	thumb_func_start ov101_021F3E74
ov101_021F3E74: ; 0x021F3E74
	push {r3, lr}
	ldr r3, _021F3EA4 ; =ov101_021F86CC
	mov r2, #0
_021F3E7A:
	ldrh r1, [r3]
	cmp r0, r1
	bne _021F3E88
	add r2, #0xd
	lsl r0, r2, #0x10
	lsr r0, r0, #0x10
	pop {r3, pc}
_021F3E88:
	add r2, r2, #1
	add r3, r3, #2
	cmp r2, #0x49
	blt _021F3E7A
	bl LCRandom
	mov r1, #3
	bl _s32_div_f
	add r1, #0xa
	lsl r0, r1, #0x10
	lsr r0, r0, #0x10
	pop {r3, pc}
	nop
_021F3EA4: .word ov101_021F86CC
	thumb_func_end ov101_021F3E74

	thumb_func_start PhoneCall_GetScriptId_GymLeader
PhoneCall_GetScriptId_GymLeader: ; 0x021F3EA8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x24]
	add r4, r1, #0
	bl PlayerProfile_CountBadges
	cmp r0, #0x10
	blt _021F3EC8
	add r0, r4, #0
	add r0, #0x4d
	ldrb r1, [r0]
	mov r0, #1
	bic r1, r0
	mov r0, #1
	orr r1, r0
	b _021F3ED2
_021F3EC8:
	add r0, r4, #0
	add r0, #0x4d
	ldrb r1, [r0]
	mov r0, #1
	bic r1, r0
_021F3ED2:
	add r0, r4, #0
	add r0, #0x4d
	strb r1, [r0]
	ldrb r1, [r4, #0x18]
	ldr r0, [r5, #0x20]
	bl PhoneRematches_IsSeeking
	add r1, r4, #0
	add r1, #0x4d
	ldrb r2, [r1]
	lsl r0, r0, #0x18
	mov r1, #2
	lsr r0, r0, #0x18
	bic r2, r1
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1e
	add r1, r2, #0
	orr r1, r0
	add r0, r4, #0
	add r0, #0x4d
	strb r1, [r0]
	ldrb r0, [r4, #0x19]
	cmp r0, #0
	beq _021F3F06
	mov r0, #0xe
	b _021F3F08
_021F3F06:
	mov r0, #0xd
_021F3F08:
	strh r0, [r4, #0x20]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end PhoneCall_GetScriptId_GymLeader

	thumb_func_start ov101_021F3F10
ov101_021F3F10: ; 0x021F3F10
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r5, #0
	add r4, #0x88
	ldr r1, [r4, #4]
	cmp r1, #3
	bls _021F3F20
	b _021F4042
_021F3F20:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021F3F2C: ; jump table
	.short _021F3F34 - _021F3F2C - 2 ; case 0
	.short _021F3F60 - _021F3F2C - 2 ; case 1
	.short _021F3FD6 - _021F3F2C - 2 ; case 2
	.short _021F3FEC - _021F3F2C - 2 ; case 3
_021F3F34:
	bl ov101_021F2110
	ldr r0, [r4, #0x10]
	ldrh r1, [r0, #6]
	ldrh r0, [r5, #0x30]
	cmp r1, r0
	bne _021F3F54
	mov r0, #0xff
	str r0, [r4, #4]
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #1
	bl PhoneCallMessagePrint_Ungendered
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F3F54:
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #2
	bl PhoneCallMessagePrint_Ungendered
	b _021F405A
_021F3F60:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F3F6C
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F3F6C:
	add r0, r4, #0
	add r0, #0x4d
	ldrb r0, [r0]
	lsl r1, r0, #0x1f
	lsr r1, r1, #0x1f
	bne _021F3F8A
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #3
	bl PhoneCallMessagePrint_Ungendered
	mov r0, #0xff
	str r0, [r4, #4]
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F3F8A:
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1f
	beq _021F3FA2
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #9
	bl PhoneCallMessagePrint_Ungendered
	mov r0, #0xff
	str r0, [r4, #4]
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F3FA2:
	ldr r2, [r4, #0x10]
	ldr r1, [r4, #0x34]
	ldrb r0, [r2, #0xd]
	cmp r1, r0
	bne _021F3FB8
	add r0, r4, #0
	add r0, #0x23
	ldrb r1, [r0]
	ldrb r0, [r2, #0xe]
	cmp r1, r0
	beq _021F3FCA
_021F3FB8:
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #4
	bl PhoneCallMessagePrint_Ungendered
	mov r0, #0xff
	str r0, [r4, #4]
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F3FCA:
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #5
	bl PhoneCallMessagePrint_Ungendered
	b _021F405A
_021F3FD6:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F3FE2
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F3FE2:
	add r0, r5, #0
	mov r1, #6
	bl ov101_021F2308
	b _021F405A
_021F3FEC:
	bl ov101_021F2338
	add r6, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r6, r0
	bne _021F3FFE
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F3FFE:
	add r0, r5, #0
	bl ov101_021F2344
	cmp r6, #0
	beq _021F4014
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #7
	bl PhoneCallMessagePrint_Ungendered
	b _021F405A
_021F4014:
	ldrb r1, [r4, #0x18]
	add r0, r5, #0
	bl ov101_021F40E8
	cmp r0, #0
	beq _021F4036
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #6
	bl PhoneCallMessagePrint_Ungendered
	ldrb r1, [r4, #0x18]
	ldr r0, [r5, #0x20]
	mov r2, #1
	bl PhoneRematches_SetSeeking
	b _021F405A
_021F4036:
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #8
	bl PhoneCallMessagePrint_Ungendered
	b _021F405A
_021F4042:
	add r0, r5, #0
	bl ov101_021F2220
	cmp r0, #0
	bne _021F4050
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F4050:
	ldr r0, [r5, #0x4c]
	bl DestroyMsgData
	mov r0, #1
	pop {r4, r5, r6, pc}
_021F405A:
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov101_021F3F10

	thumb_func_start ov101_021F4064
ov101_021F4064: ; 0x021F4064
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r5, #0
	add r4, #0x88
	ldr r1, [r4, #4]
	cmp r1, #0
	beq _021F4078
	cmp r1, #1
	beq _021F4088
	b _021F40C8
_021F4078:
	bl ov101_021F2110
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #0xa
	bl PhoneCallMessagePrint_Ungendered
	b _021F40DE
_021F4088:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F4094
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F4094:
	add r0, r4, #0
	add r0, #0x4d
	ldrb r0, [r0]
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1f
	beq _021F40AC
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #0xb
	bl PhoneCallMessagePrint_Ungendered
	b _021F40DE
_021F40AC:
	bl LCRandom
	mov r1, #3
	bl _s32_div_f
	add r2, r1, #0
	add r2, #0xc
	lsl r2, r2, #0x18
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	lsr r2, r2, #0x18
	bl PhoneCallMessagePrint_Ungendered
	b _021F40DE
_021F40C8:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F40D4
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F40D4:
	ldr r0, [r5, #0x4c]
	bl DestroyMsgData
	mov r0, #1
	pop {r3, r4, r5, pc}
_021F40DE:
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov101_021F4064

	thumb_func_start ov101_021F40E8
ov101_021F40E8: ; 0x021F40E8
	push {r4, lr}
	mov r4, #0
	cmp r1, #0x12
	beq _021F40FE
	ldr r0, [r0, #0x20]
	mov r1, #0x12
	bl PhoneRematches_IsSeeking
	cmp r0, #0
	beq _021F40FE
	add r4, r4, #1
_021F40FE:
	cmp r4, #5
	bge _021F4106
	mov r0, #1
	pop {r4, pc}
_021F4106:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov101_021F40E8

	thumb_func_start PhoneCall_GetScriptId_Baoba
PhoneCall_GetScriptId_Baoba: ; 0x021F410C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #0
	strh r0, [r4, #0x20]
	ldrb r0, [r4, #0x1a]
	cmp r0, #2
	bne _021F4120
	mov r0, #0x8d
	pop {r4, r5, r6, pc}
_021F4120:
	ldrb r0, [r4, #0x19]
	cmp r0, #0
	beq _021F419A
	ldr r0, [r5, #0x1c]
	bl Save_SafariZone_Get
	ldrh r1, [r4, #0x1c]
	add r6, r0, #0
	cmp r1, #0
	bgt _021F4138
	beq _021F4154
	b _021F4186
_021F4138:
	sub r1, #0x8e
	cmp r1, #4
	bhi _021F4186
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021F414A: ; jump table
	.short _021F415C - _021F414A - 2 ; case 0
	.short _021F4168 - _021F414A - 2 ; case 1
	.short _021F4168 - _021F414A - 2 ; case 2
	.short _021F417E - _021F414A - 2 ; case 3
	.short _021F417E - _021F414A - 2 ; case 4
_021F4154:
	mov r0, #0xf
	strh r0, [r4, #0x20]
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F415C:
	ldr r0, [r5, #0x28]
	mov r1, #4
	bl Save_VarsFlags_SetVar4057
	ldrh r0, [r4, #0x1c]
	pop {r4, r5, r6, pc}
_021F4168:
	mov r1, #1
	bl sub_0202F730
	ldr r0, [r5, #0x1c]
	bl Save_PlayerData_GetIGTAddr
	add r1, r0, #0
	add r0, r6, #0
	bl sub_0202F784
	b _021F418E
_021F417E:
	mov r1, #4
	bl sub_0202F730
	b _021F418E
_021F4186:
	mov r0, #0x9a
	strh r0, [r4, #0x1c]
	ldrh r0, [r4, #0x1c]
	pop {r4, r5, r6, pc}
_021F418E:
	ldr r0, [r5, #0x28]
	mov r1, #7
	bl Save_VarsFlags_SetVar4057
	ldrh r0, [r4, #0x1c]
	pop {r4, r5, r6, pc}
_021F419A:
	ldr r0, [r4, #0x10]
	ldrh r1, [r0, #6]
	ldrh r0, [r5, #0x30]
	cmp r1, r0
	bne _021F41A8
	mov r0, #0x8c
	pop {r4, r5, r6, pc}
_021F41A8:
	ldr r0, [r5, #0x28]
	bl Save_VarsFlags_GetVar4057
	add r0, #0x93
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end PhoneCall_GetScriptId_Baoba

	thumb_func_start ov101_021F41B8
ov101_021F41B8: ; 0x021F41B8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r1, r5, #0
	str r1, [sp]
	add r1, #0x88
	str r1, [sp]
	ldr r1, [r1, #4]
	cmp r1, #0
	bne _021F424A
	bl ov101_021F2110
	ldr r0, [r5, #0x20]
	ldr r2, [r5]
	add r1, sp, #4
	bl sub_0202F340
	add r7, sp, #4
	add r6, r0, #0
	ldrb r0, [r7]
	cmp r0, #0
	bne _021F41F2
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #0x26
	mov r3, #0x27
	bl PhoneCallMessagePrint_Gendered
	b _021F4242
_021F41F2:
	cmp r0, #6
	blo _021F4204
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #0x18
	mov r3, #0x19
	bl PhoneCallMessagePrint_Gendered
	b _021F4242
_021F4204:
	mov r4, #0
	cmp r0, #0
	bls _021F4222
_021F420A:
	ldrb r2, [r6, r4]
	add r1, r4, #0
	ldr r0, [r5, #0x50]
	add r1, #0xa
	bl BufferSafariZoneAreaName
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	ldrb r0, [r7]
	cmp r4, r0
	blo _021F420A
_021F4222:
	sub r0, r0, #1
	lsl r1, r0, #1
	add r0, sp, #4
	strb r1, [r0]
	ldrb r3, [r0]
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	add r2, r3, #0
	add r2, #0xe
	add r3, #0xf
	lsl r2, r2, #0x18
	lsl r3, r3, #0x18
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl PhoneCallMessagePrint_Gendered
_021F4242:
	add r0, r6, #0
	bl FreeToHeap
	b _021F4264
_021F424A:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F4258
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021F4258:
	ldr r0, [r5, #0x4c]
	bl DestroyMsgData
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021F4264:
	ldr r0, [sp]
	ldr r0, [r0, #4]
	add r1, r0, #1
	ldr r0, [sp]
	str r1, [r0, #4]
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov101_021F41B8

	thumb_func_start PhoneCall_GetScriptId_Irwin
PhoneCall_GetScriptId_Irwin: ; 0x021F4274
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r7, r1, #0
	mov r0, #0
	strh r0, [r7, #0x20]
	ldrb r0, [r7, #0x19]
	cmp r0, #0
	bne _021F42A4
	ldr r0, [r5, #0x28]
	bl Save_VarsFlags_IsInRocketTakeover
	cmp r0, #0
	beq _021F4292
	mov r0, #0x9c
	pop {r3, r4, r5, r6, r7, pc}
_021F4292:
	bl LCRandom
	mov r1, #3
	bl _s32_div_f
	add r1, #0xac
	lsl r0, r1, #0x10
	lsr r0, r0, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_021F42A4:
	ldr r0, [r5, #0x24]
	bl PlayerProfile_CountBadges
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	ldr r0, [r5, #0x24]
	mov r1, #2
	bl PlayerProfile_TestBadgeFlag
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	add r0, r5, #0
	add r1, r7, #0
	add r2, r6, #0
	add r3, r4, #0
	bl ov101_021F42E4
	ldr r1, _021F42E0 ; =0x0000FFFF
	cmp r0, r1
	bne _021F42DE
	cmp r4, #0
	bne _021F42D4
	mov r0, #0xa9
	pop {r3, r4, r5, r6, r7, pc}
_021F42D4:
	cmp r6, #0x10
	bhs _021F42DC
	mov r0, #0xaa
	pop {r3, r4, r5, r6, r7, pc}
_021F42DC:
	mov r0, #0xab
_021F42DE:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021F42E0: .word 0x0000FFFF
	thumb_func_end PhoneCall_GetScriptId_Irwin

	thumb_func_start ov101_021F42E4
ov101_021F42E4: ; 0x021F42E4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x28]
	ldr r1, _021F445C ; =0x00000998
	add r4, r2, #0
	add r6, r3, #0
	bl Save_VarsFlags_CheckFlagInArray
	cmp r0, #0
	bne _021F42FC
	ldr r0, _021F4460 ; =0x0000FFFF
	pop {r4, r5, r6, pc}
_021F42FC:
	ldr r0, [r5, #0x28]
	ldr r1, _021F445C ; =0x00000998
	bl Save_VarsFlags_ClearFlagInArray
	cmp r4, #0x10
	blo _021F4324
	ldr r0, [r5, #0x28]
	ldr r1, _021F4464 ; =0x000009A4
	bl Save_VarsFlags_CheckFlagInArray
	cmp r0, #0
	bne _021F4320
	ldr r0, [r5, #0x28]
	ldr r1, _021F4464 ; =0x000009A4
	bl Save_VarsFlags_SetFlagInArray
	mov r0, #0xa8
	pop {r4, r5, r6, pc}
_021F4320:
	ldr r0, _021F4460 ; =0x0000FFFF
	pop {r4, r5, r6, pc}
_021F4324:
	ldr r0, [r5, #0x24]
	mov r1, #0xd
	bl PlayerProfile_TestBadgeFlag
	cmp r0, #0
	ldr r0, [r5, #0x28]
	beq _021F434C
	ldr r1, _021F4468 ; =0x000009A3
	bl Save_VarsFlags_CheckFlagInArray
	cmp r0, #0
	bne _021F4348
	ldr r0, [r5, #0x28]
	ldr r1, _021F4468 ; =0x000009A3
	bl Save_VarsFlags_SetFlagInArray
	mov r0, #0xa7
	pop {r4, r5, r6, pc}
_021F4348:
	ldr r0, _021F4460 ; =0x0000FFFF
	pop {r4, r5, r6, pc}
_021F434C:
	mov r1, #0xf9
	bl Save_VarsFlags_CheckFlagInArray
	cmp r0, #0
	ldr r0, [r5, #0x28]
	beq _021F4372
	ldr r1, _021F446C ; =0x000009A2
	bl Save_VarsFlags_CheckFlagInArray
	cmp r0, #0
	bne _021F436E
	ldr r0, [r5, #0x28]
	ldr r1, _021F446C ; =0x000009A2
	bl Save_VarsFlags_SetFlagInArray
	mov r0, #0xa6
	pop {r4, r5, r6, pc}
_021F436E:
	ldr r0, _021F4460 ; =0x0000FFFF
	pop {r4, r5, r6, pc}
_021F4372:
	mov r1, #0x87
	bl Save_VarsFlags_CheckFlagInArray
	cmp r0, #0
	ldr r0, [r5, #0x28]
	beq _021F4398
	ldr r1, _021F4470 ; =0x000009A1
	bl Save_VarsFlags_CheckFlagInArray
	cmp r0, #0
	bne _021F4394
	ldr r0, [r5, #0x28]
	ldr r1, _021F4470 ; =0x000009A1
	bl Save_VarsFlags_SetFlagInArray
	mov r0, #0xa5
	pop {r4, r5, r6, pc}
_021F4394:
	ldr r0, _021F4460 ; =0x0000FFFF
	pop {r4, r5, r6, pc}
_021F4398:
	mov r1, #2
	mov r2, #5
	bl Save_VarsFlags_FlypointFlagAction
	cmp r0, #0
	beq _021F43A8
	mov r0, #0xa4
	pop {r4, r5, r6, pc}
_021F43A8:
	ldr r0, [r5, #0x28]
	bl CheckGameClearFlag
	cmp r0, #0
	beq _021F43CE
	ldr r0, [r5, #0x28]
	ldr r1, _021F4474 ; =0x000009A5
	bl Save_VarsFlags_CheckFlagInArray
	cmp r0, #0
	bne _021F43CA
	ldr r0, [r5, #0x28]
	ldr r1, _021F4474 ; =0x000009A5
	bl Save_VarsFlags_SetFlagInArray
	mov r0, #0xa3
	pop {r4, r5, r6, pc}
_021F43CA:
	ldr r0, _021F4460 ; =0x0000FFFF
	pop {r4, r5, r6, pc}
_021F43CE:
	ldr r0, [r5, #0x24]
	mov r1, #7
	bl PlayerProfile_TestBadgeFlag
	cmp r0, #0
	beq _021F43DE
	mov r0, #0xa2
	pop {r4, r5, r6, pc}
_021F43DE:
	ldr r0, [r5, #0x28]
	mov r1, #0xc6
	bl Save_VarsFlags_CheckFlagInArray
	cmp r0, #0
	beq _021F43EE
	mov r0, #0xa1
	pop {r4, r5, r6, pc}
_021F43EE:
	ldr r0, [r5, #0x28]
	mov r1, #0xca
	bl Save_VarsFlags_CheckFlagInArray
	cmp r0, #0
	ldr r0, [r5, #0x28]
	beq _021F441A
	mov r1, #0x9a
	lsl r1, r1, #4
	bl Save_VarsFlags_CheckFlagInArray
	cmp r0, #0
	bne _021F4416
	mov r1, #0x9a
	ldr r0, [r5, #0x28]
	lsl r1, r1, #4
	bl Save_VarsFlags_SetFlagInArray
	mov r0, #0xa0
	pop {r4, r5, r6, pc}
_021F4416:
	ldr r0, _021F4460 ; =0x0000FFFF
	pop {r4, r5, r6, pc}
_021F441A:
	ldr r1, _021F4478 ; =0x0000096A
	bl Save_VarsFlags_CheckFlagInArray
	cmp r0, #0
	beq _021F4440
	ldr r0, [r5, #0x28]
	ldr r1, _021F447C ; =0x0000099F
	bl Save_VarsFlags_CheckFlagInArray
	cmp r0, #0
	bne _021F443C
	ldr r0, [r5, #0x28]
	ldr r1, _021F447C ; =0x0000099F
	bl Save_VarsFlags_SetFlagInArray
	mov r0, #0x9f
	pop {r4, r5, r6, pc}
_021F443C:
	ldr r0, _021F4460 ; =0x0000FFFF
	pop {r4, r5, r6, pc}
_021F4440:
	ldr r0, [r5, #0x24]
	mov r1, #3
	bl PlayerProfile_TestBadgeFlag
	cmp r0, #0
	beq _021F4450
	mov r0, #0x9e
	pop {r4, r5, r6, pc}
_021F4450:
	cmp r6, #0
	beq _021F4458
	mov r0, #0x9d
	pop {r4, r5, r6, pc}
_021F4458:
	ldr r0, _021F4460 ; =0x0000FFFF
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021F445C: .word 0x00000998
_021F4460: .word 0x0000FFFF
_021F4464: .word 0x000009A4
_021F4468: .word 0x000009A3
_021F446C: .word 0x000009A2
_021F4470: .word 0x000009A1
_021F4474: .word 0x000009A5
_021F4478: .word 0x0000096A
_021F447C: .word 0x0000099F
	thumb_func_end ov101_021F42E4

    .rodata

    ; file boundary?

	.balign 4, 0
ov101_021F86C8: ; 0x021F86C8
	.short 0x0066
	.short 0x0065

ov101_021F86CC: ; 0x021F86CC
	.short 0x0009, 0x000A
	.short 0x000B, 0x000C, 0x000D, 0x000E, 0x000F, 0x0010, 0x0011, 0x0012
	.short 0x0013, 0x0014, 0x0015, 0x0016, 0x0017, 0x0018, 0x0019, 0x001A
	.short 0x005B, 0x005C, 0x005D, 0x001B, 0x001C, 0x001D, 0x001E, 0x001F
	.short 0x0020, 0x0021, 0x0022, 0x0023, 0x0024, 0x0025, 0x0026, 0x0027
	.short 0x0028, 0x0029, 0x002A, 0x002B, 0x005E, 0x005F, 0x002C, 0x002D
	.short 0x002E, 0x002F, 0x0030, 0x0097, 0x0098, 0x0031, 0x0032, 0x0033
	.short 0x0034, 0x0035, 0x0036, 0x0037, 0x0038, 0x0039, 0x003A, 0x003B
	.short 0x003C, 0x0043, 0x0049, 0x004A, 0x004B, 0x004C, 0x004D, 0x004E
	.short 0x0057, 0x0058, 0x0059, 0x005A, 0x0060, 0x0071, 0x00AE, 0x0000

ov101_021F8760: ; 0x021F8760
	.byte 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03
	.byte 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x02, 0x02, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x03
	.byte 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x02, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01
