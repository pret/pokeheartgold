	.include "asm/macros.inc"
	.include "global.inc"

	.rodata

_020FFB90:
	.byte 0, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0
	.byte 0, 1, 1, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0
	.byte 0, 1, 0, 1, 1, 0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 1
	.byte 0, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 1, 0
	.byte 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1, 0, 0
	.byte 1, 0, 1, 0, 1, 1, 0, 1, 1, 2, 1, 0, 1, 0, 1, 0
	.byte 1, 0, 0, 1, 0, 1, 0, 1, 0, 1, 1, 1, 0, 0, 0, 0
	.byte 2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0

	.text

	thumb_func_start EnemyTrainerSet_Init
EnemyTrainerSet_Init: ; 0x020733C0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x48
	str r2, [sp, #4]
	ldr r2, _0207346C ; =0x000002D9
	str r0, [sp]
	add r4, r1, #0
	ldr r3, [sp, #4]
	mov r0, #1
	mov r1, #0x1b
	bl NewMsgDataFromNarc
	str r0, [sp, #0x10]
	add r0, r4, #0
	bl Sav2_Misc_const_get
	bl Sav2_Misc_RivalName_get
	ldr r4, [sp]
	str r0, [sp, #0xc]
	add r0, r4, #0
	add r5, r4, #0
	mov r7, #0
	str r0, [sp, #8]
	add r5, #0x3c
_020733F0:
	ldr r0, [r4, #0x18]
	cmp r0, #0
	beq _02073444
	add r1, sp, #0x14
	bl TrainerData_ReadTrData
	ldr r3, [sp, #8]
	add r6, sp, #0x14
	add r3, #0x28
	mov r2, #6
_02073404:
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _02073404
	ldr r0, [r6]
	str r0, [r3]
	add r0, sp, #0x14
	ldrb r0, [r0, #1]
	cmp r0, #0x17
	bne _02073422
	ldr r1, [sp, #0xc]
	add r0, r5, #0
	bl CopyU16StringArray
	b _0207343A
_02073422:
	ldr r0, [sp, #0x10]
	ldr r1, [r4, #0x18]
	bl NewString_ReadMsgData
	add r6, r0, #0
	add r1, r5, #0
	mov r2, #8
	bl CopyStringToU16Array
	add r0, r6, #0
	bl String_dtor
_0207343A:
	ldr r0, [sp]
	ldr r2, [sp, #4]
	add r1, r7, #0
	bl CreateNPCTrainerParty
_02073444:
	ldr r0, [sp, #8]
	add r7, r7, #1
	add r0, #0x34
	add r4, r4, #4
	add r5, #0x34
	str r0, [sp, #8]
	cmp r7, #4
	blt _020733F0
	ldr r0, [sp]
	ldr r1, [r0]
	ldr r0, [sp, #0x24]
	orr r1, r0
	ldr r0, [sp]
	str r1, [r0]
	ldr r0, [sp, #0x10]
	bl DestroyMsgData
	add sp, #0x48
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0207346C: .word 0x000002D9
	thumb_func_end EnemyTrainerSet_Init

	thumb_func_start TrainerData_GetAttr
TrainerData_GetAttr: ; 0x02073470
	push {r4, r5, lr}
	sub sp, #0x34
	add r5, r1, #0
	add r1, sp, #0
	bl TrainerData_ReadTrData
	cmp r5, #9
	bhi _020734C8
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0207348C: ; jump table
	.short _020734A0 - _0207348C - 2 ; case 0
	.short _020734A6 - _0207348C - 2 ; case 1
	.short _020734AC - _0207348C - 2 ; case 2
	.short _020734B2 - _0207348C - 2 ; case 3
	.short _020734B8 - _0207348C - 2 ; case 4
	.short _020734B8 - _0207348C - 2 ; case 5
	.short _020734B8 - _0207348C - 2 ; case 6
	.short _020734B8 - _0207348C - 2 ; case 7
	.short _020734C2 - _0207348C - 2 ; case 8
	.short _020734C6 - _0207348C - 2 ; case 9
_020734A0:
	add r0, sp, #0
	ldrb r4, [r0]
	b _020734C8
_020734A6:
	add r0, sp, #0
	ldrb r4, [r0, #1]
	b _020734C8
_020734AC:
	add r0, sp, #0
	ldrb r4, [r0, #2]
	b _020734C8
_020734B2:
	add r0, sp, #0
	ldrb r4, [r0, #3]
	b _020734C8
_020734B8:
	sub r0, r5, #4
	lsl r1, r0, #1
	add r0, sp, #4
	ldrh r4, [r0, r1]
	b _020734C8
_020734C2:
	ldr r4, [sp, #0xc]
	b _020734C8
_020734C6:
	ldr r4, [sp, #0x10]
_020734C8:
	add r0, r4, #0
	add sp, #0x34
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end TrainerData_GetAttr

	thumb_func_start TrainerMessageWithIdPairExists
TrainerMessageWithIdPairExists: ; 0x020734D0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	mov r0, #0
	str r0, [sp, #4]
	add r7, r1, #0
	ldr r1, [sp, #4]
	mov r0, #0x39
	add r4, r2, #0
	bl GetNarcMemberSizeByIdPair
	add r6, r0, #0
	mov r0, #2
	str r0, [sp]
	add r0, sp, #0xc
	mov r1, #0x83
	mov r2, #0
	lsl r3, r5, #1
	bl ReadFromNarcMemberByIdPair
	mov r0, #0x39
	add r1, r4, #0
	bl NARC_ctor
	add r4, sp, #0xc
	ldrh r2, [r4]
	str r0, [sp, #8]
	cmp r2, r6
	beq _0207353C
_0207350A:
	add r0, sp, #0xc
	add r0, #2
	str r0, [sp]
	ldr r0, [sp, #8]
	mov r1, #0
	mov r3, #4
	bl NARC_ReadFromMember
	ldrh r1, [r4, #2]
	cmp r1, r5
	bne _0207352C
	ldrh r0, [r4, #4]
	cmp r0, r7
	bne _0207352C
	mov r0, #1
	str r0, [sp, #4]
	b _0207353C
_0207352C:
	cmp r1, r5
	bne _0207353C
	ldrh r0, [r4]
	add r0, r0, #4
	strh r0, [r4]
	ldrh r2, [r4]
	cmp r2, r6
	bne _0207350A
_0207353C:
	ldr r0, [sp, #8]
	bl NARC_dtor
	ldr r0, [sp, #4]
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end TrainerMessageWithIdPairExists

	thumb_func_start GetTrainerMessageByIdPair
GetTrainerMessageByIdPair: ; 0x02073548
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r6, r0, #0
	add r7, r1, #0
	mov r0, #0x39
	mov r1, #0
	str r2, [sp, #4]
	str r3, [sp, #8]
	bl GetNarcMemberSizeByIdPair
	add r5, r0, #0
	mov r0, #2
	str r0, [sp]
	add r0, sp, #0x10
	mov r1, #0x83
	mov r2, #0
	lsl r3, r6, #1
	bl ReadFromNarcMemberByIdPair
	ldr r1, [sp, #8]
	mov r0, #0x39
	bl NARC_ctor
	add r4, sp, #0x10
	ldrh r2, [r4]
	str r0, [sp, #0xc]
	cmp r2, r5
	beq _020735C0
_02073580:
	add r0, sp, #0x10
	add r0, #2
	str r0, [sp]
	ldr r0, [sp, #0xc]
	mov r1, #0
	mov r3, #4
	bl NARC_ReadFromMember
	ldrh r0, [r4, #2]
	cmp r0, r6
	bne _020735B4
	ldrh r0, [r4, #4]
	cmp r0, r7
	bne _020735B4
	ldr r0, [sp, #4]
	mov r1, #0xb6
	str r0, [sp]
	add r2, sp, #0x10
	ldrh r2, [r2]
	ldr r3, [sp, #8]
	mov r0, #0x1b
	lsl r1, r1, #2
	lsr r2, r2, #2
	bl ReadMsgData_NewNarc_ExistingString
	b _020735C0
_020735B4:
	ldrh r0, [r4]
	add r0, r0, #4
	strh r0, [r4]
	ldrh r2, [r4]
	cmp r2, r5
	bne _02073580
_020735C0:
	ldr r0, [sp, #0xc]
	bl NARC_dtor
	add r0, sp, #0x10
	ldrh r0, [r0]
	cmp r0, r5
	bne _020735D4
	ldr r0, [sp, #4]
	bl StringSetEmpty
_020735D4:
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end GetTrainerMessageByIdPair

	thumb_func_start TrainerData_ReadTrData
TrainerData_ReadTrData: ; 0x020735D8
	ldr r3, _020735E4 ; =ReadWholeNarcMemberByIdPair
	add r2, r0, #0
	add r0, r1, #0
	mov r1, #0x37
	bx r3
	nop
_020735E4: .word ReadWholeNarcMemberByIdPair
	thumb_func_end TrainerData_ReadTrData

	thumb_func_start TrainerData_ReadTrPoke
TrainerData_ReadTrPoke: ; 0x020735E8
	ldr r3, _020735F4 ; =ReadWholeNarcMemberByIdPair
	add r2, r0, #0
	add r0, r1, #0
	mov r1, #0x38
	bx r3
	nop
_020735F4: .word ReadWholeNarcMemberByIdPair
	thumb_func_end TrainerData_ReadTrPoke

	thumb_func_start TrainerClass_GetGenderOrTrainerCount
TrainerClass_GetGenderOrTrainerCount: ; 0x020735F8
	ldr r1, _02073600 ; =_020FFB90
	ldrb r0, [r1, r0]
	bx lr
	nop
_02073600: .word _020FFB90
	thumb_func_end TrainerClass_GetGenderOrTrainerCount

	thumb_func_start CreateNPCTrainerParty
CreateNPCTrainerParty: ; 0x02073604
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x80
	str r1, [sp, #0x10]
	add r4, r0, #0
	str r2, [sp, #0x14]
	bl GetLCRNGSeed
	str r0, [sp, #0x68]
	ldr r0, [sp, #0x10]
	mov r1, #6
	lsl r7, r0, #2
	add r0, r4, r7
	ldr r0, [r0, #4]
	bl InitPartyWithMaxSize
	ldr r0, [sp, #0x14]
	mov r1, #0x6c
	bl AllocFromHeap
	str r0, [sp, #0x74]
	ldr r0, [sp, #0x14]
	bl AllocMonZeroed
	add r6, r0, #0
	add r0, r4, r7
	ldr r0, [r0, #0x18]
	ldr r1, [sp, #0x74]
	bl TrainerData_ReadTrPoke
	ldr r0, [sp, #0x10]
	mov r1, #0x34
	add r5, r0, #0
	mul r5, r1
	add r0, r4, r5
	add r0, #0x29
	ldrb r0, [r0]
	bl TrainerClass_GetGenderOrTrainerCount
	cmp r0, #1
	bne _02073658
	mov r0, #0x78
	b _0207365A
_02073658:
	mov r0, #0x88
_0207365A:
	str r0, [sp, #0x7c]
	add r0, r4, r5
	add r0, #0x28
	ldrb r0, [r0]
	cmp r0, #3
	bhi _02073762
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02073672: ; jump table
	.short _0207367A - _02073672 - 2 ; case 0
	.short _02073764 - _02073672 - 2 ; case 1
	.short _0207386E - _02073672 - 2 ; case 2
	.short _02073964 - _02073672 - 2 ; case 3
_0207367A:
	mov r0, #0
	str r0, [sp, #0x70]
	add r0, r4, r5
	add r0, #0x2b
	ldrb r0, [r0]
	cmp r0, #0
	ble _02073762
	ldr r0, [sp, #0x74]
	str r0, [sp, #0x44]
	add r0, r4, r7
	str r0, [sp, #0x40]
_02073690:
	ldr r0, [sp, #0x44]
	mov r1, #0x3f
	ldrh r0, [r0, #4]
	lsl r1, r1, #0xa
	add r3, sp, #0x7c
	and r1, r0
	asr r2, r1, #0xa
	add r1, sp, #0x78
	strb r2, [r1, #3]
	ldr r2, _02073994 ; =0x000003FF
	ldrb r1, [r1, #3]
	and r0, r2
	ldr r2, [sp, #0x44]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	ldrb r2, [r2, #1]
	str r0, [sp, #0x3c]
	bl TrMon_OverridePidGender
	ldr r1, [sp, #0x44]
	ldr r0, [sp, #0x40]
	ldrb r2, [r1]
	ldrh r1, [r1, #2]
	ldr r0, [r0, #0x18]
	add r2, r2, r1
	ldr r1, [sp, #0x3c]
	add r1, r1, r2
	add r0, r0, r1
	str r0, [sp, #0x6c]
	bl SetLCRNGSeed
	add r0, r4, r5
	add r0, #0x29
	ldrb r0, [r0]
	mov r7, #0
	cmp r0, #0
	ble _020736EC
_020736DA:
	bl LCRandom
	str r0, [sp, #0x6c]
	add r0, r4, r5
	add r0, #0x29
	ldrb r0, [r0]
	add r7, r7, #1
	cmp r7, r0
	blt _020736DA
_020736EC:
	ldr r0, [sp, #0x6c]
	lsl r1, r0, #8
	ldr r0, [sp, #0x7c]
	add r7, r1, r0
	ldr r0, [sp, #0x44]
	ldrb r1, [r0]
	mov r0, #0x1f
	mul r0, r1
	mov r1, #0xff
	bl _s32_div_f
	add r3, r0, #0
	mov r0, #1
	str r0, [sp]
	lsl r3, r3, #0x18
	str r7, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r2, [sp, #0x44]
	ldr r1, [sp, #0x3c]
	ldrh r2, [r2, #2]
	add r0, r6, #0
	lsr r3, r3, #0x18
	bl CreateMon
	ldr r0, [sp, #0x44]
	ldr r2, [sp, #0x14]
	ldrh r0, [r0, #6]
	add r1, r6, #0
	bl SetTrMonCapsule
	add r2, sp, #0x78
	add r0, r6, #0
	mov r1, #0x70
	add r2, #3
	bl SetMonData
	add r0, r6, #0
	bl TrMon_FrustrationCheckAndSetFriendship
	ldr r0, [sp, #0x40]
	add r1, r6, #0
	ldr r0, [r0, #4]
	bl AddMonToParty
	ldr r0, [sp, #0x44]
	add r0, #8
	str r0, [sp, #0x44]
	ldr r0, [sp, #0x70]
	add r0, r0, #1
	str r0, [sp, #0x70]
	add r0, r4, r5
	add r0, #0x2b
	ldrb r1, [r0]
	ldr r0, [sp, #0x70]
	cmp r0, r1
	blt _02073690
_02073762:
	b _02073A82
_02073764:
	mov r0, #0
	str r0, [sp, #0x24]
	add r0, r4, r5
	add r0, #0x2b
	ldrb r0, [r0]
	cmp r0, #0
	ble _0207386C
	ldr r0, [sp, #0x74]
	str r0, [sp, #0x50]
	add r0, r4, r7
	str r0, [sp, #0x4c]
_0207377A:
	ldr r0, [sp, #0x50]
	mov r1, #0x3f
	ldrh r0, [r0, #4]
	lsl r1, r1, #0xa
	add r3, sp, #0x7c
	and r1, r0
	asr r2, r1, #0xa
	add r1, sp, #0x78
	strb r2, [r1, #2]
	ldr r2, _02073994 ; =0x000003FF
	ldrb r1, [r1, #2]
	and r0, r2
	ldr r2, [sp, #0x50]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	ldrb r2, [r2, #1]
	str r0, [sp, #0x38]
	bl TrMon_OverridePidGender
	ldr r1, [sp, #0x50]
	ldr r0, [sp, #0x4c]
	ldrb r2, [r1]
	ldrh r1, [r1, #2]
	ldr r0, [r0, #0x18]
	add r2, r2, r1
	ldr r1, [sp, #0x38]
	add r1, r1, r2
	add r0, r0, r1
	str r0, [sp, #0x18]
	bl SetLCRNGSeed
	add r0, r4, r5
	add r0, #0x29
	ldrb r0, [r0]
	mov r7, #0
	cmp r0, #0
	ble _020737D6
_020737C4:
	bl LCRandom
	str r0, [sp, #0x18]
	add r0, r4, r5
	add r0, #0x29
	ldrb r0, [r0]
	add r7, r7, #1
	cmp r7, r0
	blt _020737C4
_020737D6:
	ldr r0, [sp, #0x18]
	lsl r1, r0, #8
	ldr r0, [sp, #0x7c]
	add r7, r1, r0
	ldr r0, [sp, #0x50]
	ldrb r1, [r0]
	mov r0, #0x1f
	mul r0, r1
	mov r1, #0xff
	bl _s32_div_f
	add r3, r0, #0
	mov r0, #1
	str r0, [sp]
	lsl r3, r3, #0x18
	str r7, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r2, [sp, #0x50]
	ldr r1, [sp, #0x38]
	ldrh r2, [r2, #2]
	add r0, r6, #0
	lsr r3, r3, #0x18
	bl CreateMon
	ldr r0, [sp, #0x50]
	mov r7, #0
	str r0, [sp, #0x48]
_02073812:
	ldr r1, [sp, #0x48]
	lsl r2, r7, #0x18
	ldrh r1, [r1, #6]
	add r0, r6, #0
	lsr r2, r2, #0x18
	bl MonSetMoveInSlot
	ldr r0, [sp, #0x48]
	add r7, r7, #1
	add r0, r0, #2
	str r0, [sp, #0x48]
	cmp r7, #4
	blt _02073812
	ldr r0, [sp, #0x50]
	ldr r2, [sp, #0x14]
	ldrh r0, [r0, #0xe]
	add r1, r6, #0
	bl SetTrMonCapsule
	add r2, sp, #0x78
	add r0, r6, #0
	mov r1, #0x70
	add r2, #2
	bl SetMonData
	add r0, r6, #0
	bl TrMon_FrustrationCheckAndSetFriendship
	ldr r0, [sp, #0x4c]
	add r1, r6, #0
	ldr r0, [r0, #4]
	bl AddMonToParty
	ldr r0, [sp, #0x50]
	add r0, #0x10
	str r0, [sp, #0x50]
	ldr r0, [sp, #0x24]
	add r0, r0, #1
	str r0, [sp, #0x24]
	add r0, r4, r5
	add r0, #0x2b
	ldrb r1, [r0]
	ldr r0, [sp, #0x24]
	cmp r0, r1
	blt _0207377A
_0207386C:
	b _02073A82
_0207386E:
	mov r0, #0
	str r0, [sp, #0x28]
	add r0, r4, r5
	add r0, #0x2b
	ldrb r0, [r0]
	cmp r0, #0
	ble _02073962
	ldr r0, [sp, #0x74]
	str r0, [sp, #0x58]
	add r0, r4, r7
	str r0, [sp, #0x54]
_02073884:
	ldr r0, [sp, #0x58]
	mov r1, #0x3f
	ldrh r0, [r0, #4]
	lsl r1, r1, #0xa
	add r3, sp, #0x7c
	and r1, r0
	asr r2, r1, #0xa
	add r1, sp, #0x78
	strb r2, [r1, #1]
	ldr r2, _02073994 ; =0x000003FF
	ldrb r1, [r1, #1]
	and r0, r2
	ldr r2, [sp, #0x58]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	ldrb r2, [r2, #1]
	str r0, [sp, #0x34]
	bl TrMon_OverridePidGender
	ldr r1, [sp, #0x58]
	ldr r0, [sp, #0x54]
	ldrb r2, [r1]
	ldrh r1, [r1, #2]
	ldr r0, [r0, #0x18]
	add r2, r2, r1
	ldr r1, [sp, #0x34]
	add r1, r1, r2
	add r0, r0, r1
	str r0, [sp, #0x1c]
	bl SetLCRNGSeed
	add r0, r4, r5
	add r0, #0x29
	ldrb r0, [r0]
	mov r7, #0
	cmp r0, #0
	ble _020738E0
_020738CE:
	bl LCRandom
	str r0, [sp, #0x1c]
	add r0, r4, r5
	add r0, #0x29
	ldrb r0, [r0]
	add r7, r7, #1
	cmp r7, r0
	blt _020738CE
_020738E0:
	ldr r0, [sp, #0x1c]
	lsl r1, r0, #8
	ldr r0, [sp, #0x7c]
	add r7, r1, r0
	ldr r0, [sp, #0x58]
	ldrb r1, [r0]
	mov r0, #0x1f
	mul r0, r1
	mov r1, #0xff
	bl _s32_div_f
	add r3, r0, #0
	mov r0, #1
	str r0, [sp]
	lsl r3, r3, #0x18
	str r7, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r2, [sp, #0x58]
	ldr r1, [sp, #0x34]
	ldrh r2, [r2, #2]
	add r0, r6, #0
	lsr r3, r3, #0x18
	bl CreateMon
	ldr r2, [sp, #0x58]
	add r0, r6, #0
	mov r1, #6
	add r2, r2, #6
	bl SetMonData
	ldr r0, [sp, #0x58]
	ldr r2, [sp, #0x14]
	ldrh r0, [r0, #8]
	add r1, r6, #0
	bl SetTrMonCapsule
	add r2, sp, #0x78
	add r0, r6, #0
	mov r1, #0x70
	add r2, #1
	bl SetMonData
	add r0, r6, #0
	bl TrMon_FrustrationCheckAndSetFriendship
	ldr r0, [sp, #0x54]
	add r1, r6, #0
	ldr r0, [r0, #4]
	bl AddMonToParty
	ldr r0, [sp, #0x58]
	add r0, #0xa
	str r0, [sp, #0x58]
	ldr r0, [sp, #0x28]
	add r0, r0, #1
	str r0, [sp, #0x28]
	add r0, r4, r5
	add r0, #0x2b
	ldrb r1, [r0]
	ldr r0, [sp, #0x28]
	cmp r0, r1
	blt _02073884
_02073962:
	b _02073A82
_02073964:
	mov r0, #0
	str r0, [sp, #0x2c]
	add r0, r4, r5
	add r0, #0x2b
	ldrb r0, [r0]
	cmp r0, #0
	bgt _02073974
	b _02073A82
_02073974:
	ldr r0, [sp, #0x74]
	str r0, [sp, #0x64]
	add r0, r4, r7
	str r0, [sp, #0x60]
_0207397C:
	ldr r0, [sp, #0x64]
	mov r1, #0x3f
	ldrh r0, [r0, #4]
	lsl r1, r1, #0xa
	add r3, sp, #0x7c
	and r1, r0
	asr r2, r1, #0xa
	add r1, sp, #0x78
	strb r2, [r1]
	ldr r2, _02073994 ; =0x000003FF
	b _02073998
	nop
_02073994: .word 0x000003FF
_02073998:
	ldrb r1, [r1]
	and r0, r2
	ldr r2, [sp, #0x64]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	ldrb r2, [r2, #1]
	str r0, [sp, #0x30]
	bl TrMon_OverridePidGender
	ldr r1, [sp, #0x64]
	ldr r0, [sp, #0x60]
	ldrb r2, [r1]
	ldrh r1, [r1, #2]
	ldr r0, [r0, #0x18]
	add r2, r2, r1
	ldr r1, [sp, #0x30]
	add r1, r1, r2
	add r0, r0, r1
	str r0, [sp, #0x20]
	bl SetLCRNGSeed
	add r0, r4, r5
	add r0, #0x29
	ldrb r0, [r0]
	mov r7, #0
	cmp r0, #0
	ble _020739E0
_020739CE:
	bl LCRandom
	str r0, [sp, #0x20]
	add r0, r4, r5
	add r0, #0x29
	ldrb r0, [r0]
	add r7, r7, #1
	cmp r7, r0
	blt _020739CE
_020739E0:
	ldr r0, [sp, #0x20]
	lsl r1, r0, #8
	ldr r0, [sp, #0x7c]
	add r7, r1, r0
	ldr r0, [sp, #0x64]
	ldrb r1, [r0]
	mov r0, #0x1f
	mul r0, r1
	mov r1, #0xff
	bl _s32_div_f
	add r3, r0, #0
	mov r0, #1
	str r0, [sp]
	lsl r3, r3, #0x18
	str r7, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r2, [sp, #0x64]
	ldr r1, [sp, #0x30]
	ldrh r2, [r2, #2]
	add r0, r6, #0
	lsr r3, r3, #0x18
	bl CreateMon
	ldr r2, [sp, #0x64]
	add r0, r6, #0
	mov r1, #6
	add r2, r2, #6
	bl SetMonData
	ldr r0, [sp, #0x64]
	mov r7, #0
	str r0, [sp, #0x5c]
_02073A28:
	ldr r1, [sp, #0x5c]
	lsl r2, r7, #0x18
	ldrh r1, [r1, #8]
	add r0, r6, #0
	lsr r2, r2, #0x18
	bl MonSetMoveInSlot
	ldr r0, [sp, #0x5c]
	add r7, r7, #1
	add r0, r0, #2
	str r0, [sp, #0x5c]
	cmp r7, #4
	blt _02073A28
	ldr r0, [sp, #0x64]
	ldr r2, [sp, #0x14]
	ldrh r0, [r0, #0x10]
	add r1, r6, #0
	bl SetTrMonCapsule
	add r0, r6, #0
	mov r1, #0x70
	add r2, sp, #0x78
	bl SetMonData
	add r0, r6, #0
	bl TrMon_FrustrationCheckAndSetFriendship
	ldr r0, [sp, #0x60]
	add r1, r6, #0
	ldr r0, [r0, #4]
	bl AddMonToParty
	ldr r0, [sp, #0x64]
	add r0, #0x12
	str r0, [sp, #0x64]
	ldr r0, [sp, #0x2c]
	add r0, r0, #1
	str r0, [sp, #0x2c]
	add r0, r4, r5
	add r0, #0x2b
	ldrb r1, [r0]
	ldr r0, [sp, #0x2c]
	cmp r0, r1
	bge _02073A82
	b _0207397C
_02073A82:
	ldr r0, [sp, #0x74]
	bl FreeToHeap
	add r0, r6, #0
	bl FreeToHeap
	ldr r0, [sp, #0x68]
	bl SetLCRNGSeed
	add sp, #0x80
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end CreateNPCTrainerParty

	thumb_func_start TrMon_OverridePidGender
TrMon_OverridePidGender: ; 0x02073A98
	push {r4, r5, r6, lr}
	add r5, r3, #0
	mov r3, #0xf
	add r6, r2, #0
	and r6, r3
	mov r3, #0xf0
	and r3, r2
	asr r4, r3, #4
	cmp r2, #0
	beq _02073AE2
	cmp r6, #0
	beq _02073AC8
	mov r2, #0x12
	bl GetMonBaseStat_HandleAlternateForme
	str r0, [r5]
	cmp r6, #1
	ldr r0, [r5]
	bne _02073AC4
	add r0, r0, #2
	str r0, [r5]
	b _02073AC8
_02073AC4:
	sub r0, r0, #2
	str r0, [r5]
_02073AC8:
	cmp r4, #1
	bne _02073AD6
	ldr r1, [r5]
	mov r0, #1
	bic r1, r0
	str r1, [r5]
	pop {r4, r5, r6, pc}
_02073AD6:
	cmp r4, #2
	bne _02073AE2
	ldr r1, [r5]
	mov r0, #1
	orr r0, r1
	str r0, [r5]
_02073AE2:
	pop {r4, r5, r6, pc}
	thumb_func_end TrMon_OverridePidGender

	thumb_func_start TrMon_FrustrationCheckAndSetFriendship
TrMon_FrustrationCheckAndSetFriendship: ; 0x02073AE4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r4, #0
	mov r0, #0xff
	add r7, sp, #0
	strb r0, [r7]
	add r6, r4, #0
_02073AF2:
	add r1, r4, #0
	add r0, r5, #0
	add r1, #0x36
	mov r2, #0
	bl GetMonData
	cmp r0, #0xda
	bne _02073B04
	strb r6, [r7]
_02073B04:
	add r4, r4, #1
	cmp r4, #4
	blt _02073AF2
	add r0, r5, #0
	mov r1, #9
	add r2, sp, #0
	bl SetMonData
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end TrMon_FrustrationCheckAndSetFriendship
