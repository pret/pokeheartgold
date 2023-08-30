	.include "asm/macros.inc"
	.include "unk_02069528.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_02069528
sub_02069528: ; 0x02069528
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r6, r0, #0
	str r1, [sp]
	add r7, r2, #0
	bl Save_PlayerData_GetProfileAddr
	add r4, r0, #0
	add r0, r6, #0
	bl sub_0202CA44
	add r5, r0, #0
	add r0, r6, #0
	bl Save_FrontierData_Get
	str r0, [sp, #4]
	add r0, r7, #0
	mov r1, #0
	mov r2, #0xe4
	bl MI_CpuFill8
	add r0, r4, #0
	bl PlayerProfile_GetNamePtr
	add r1, r7, #0
	add r1, #0xa8
	mov r2, #0x10
	bl MI_CpuCopy8
	add r0, r4, #0
	bl PlayerProfile_GetTrainerID
	add r1, r7, #0
	add r1, #0xbc
	str r0, [r1]
	ldr r0, _02069658 ; =gGameVersion
	ldrb r1, [r0]
	add r0, r7, #0
	add r0, #0xb8
	strb r1, [r0]
	ldr r0, _0206965C ; =gGameLanguage
	ldrb r1, [r0]
	add r0, r7, #0
	add r0, #0xb9
	strb r1, [r0]
	add r0, r5, #0
	bl sub_0202CA8C
	add r1, r7, #0
	add r1, #0xba
	strb r0, [r1]
	add r0, r5, #0
	bl sub_0202CA90
	add r1, r7, #0
	add r1, #0xbb
	strb r0, [r1]
	add r0, r4, #0
	bl PlayerProfile_GetTrainerGender
	add r1, r7, #0
	add r1, #0xc8
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	lsl r0, r0, #0x1f
	ldrb r1, [r1]
	mov r2, #2
	lsr r0, r0, #0x1e
	bic r1, r2
	orr r1, r0
	add r0, r7, #0
	add r0, #0xc8
	strb r1, [r0]
	add r0, r4, #0
	bl PlayerProfile_GetAvatar
	add r1, r0, #0
	add r0, r7, #0
	add r0, #0xc8
	ldrb r0, [r0]
	mov r2, #1
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1f
	bl GetUnionRoomAvatarAttrBySprite
	add r1, r7, #0
	add r1, #0xc9
	strb r0, [r1]
	add r0, r7, #0
	mov r4, #0
	str r0, [sp, #8]
	add r0, #0xca
	add r5, r4, #0
	str r0, [sp, #8]
_020695E4:
	add r0, r6, #0
	add r1, r4, #0
	bl sub_0202D660
	ldr r1, [sp, #8]
	mov r2, #8
	add r1, r1, r5
	bl MI_CpuCopy8
	add r4, r4, #1
	add r5, #8
	cmp r4, #3
	blt _020695E4
	add r0, r6, #0
	mov r1, #3
	bl sub_0202D660
	add r1, r7, #0
	add r1, #0xc0
	mov r2, #8
	bl MI_CpuCopy8
	ldr r0, [sp]
	cmp r0, #0
	bne _0206963E
	ldr r0, [sp, #4]
	mov r1, #7
	mov r2, #0
	bl sub_0202D5DC
	add r1, r7, #0
	add r1, #0xe2
	strh r0, [r1]
	add r0, r7, #0
	add r0, #0xe2
	ldrh r0, [r0]
	cmp r0, #0
	beq _02069654
	ldr r0, [sp, #4]
	ldr r1, [sp]
	add r2, r7, #0
	bl sub_0202D4DC
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_0206963E:
	ldr r0, [sp, #4]
	bl sub_0202D564
	add r1, r7, #0
	add r1, #0xe2
	strh r0, [r1]
	ldr r0, [sp, #4]
	ldr r1, [sp]
	add r2, r7, #0
	bl sub_0202D4DC
_02069654:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02069658: .word gGameVersion
_0206965C: .word gGameLanguage
	thumb_func_end sub_02069528
