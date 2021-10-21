	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_020483D8
sub_020483D8: ; 0x020483D8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x10
	bl sub_020402F0
	ldr r1, [r5, #8]
	add r6, r0, #0
	add r0, r1, #1
	str r0, [r5, #8]
	add r0, r5, #0
	ldrb r4, [r1]
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	add r2, r0, #0
	lsl r2, r2, #0x18
	ldr r0, [r6]
	add r1, r4, #0
	lsr r2, r2, #0x18
	bl BufferStatName
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_020483D8

	thumb_func_start sub_02048414
sub_02048414: ; 0x02048414
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r6, [r0]
	mov r1, #0x10
	add r0, r6, #0
	bl sub_020402F0
	ldr r1, [r5, #8]
	add r4, r0, #0
	add r0, r1, #1
	str r0, [r5, #8]
	ldrb r5, [r1]
	add r0, r6, #0
	bl ScriptEnvironment_GetSav2Ptr
	bl Sav2_PlayerData_GetProfileAddr
	add r2, r0, #0
	ldr r0, [r4]
	add r1, r5, #0
	bl BufferPlayersName
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02048414

	thumb_func_start sub_02048448
sub_02048448: ; 0x02048448
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r4, [r0]
	mov r1, #0x10
	add r0, r4, #0
	bl sub_020402F0
	ldr r2, [r5, #8]
	add r1, r2, #1
	str r1, [r5, #8]
	ldrb r1, [r2]
	ldr r0, [r0]
	ldr r2, [r4, #0xc]
	bl BufferRivalsName
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02048448

	thumb_func_start sub_0204846C
sub_0204846C: ; 0x0204846C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r4, [r0]
	mov r1, #0x10
	add r0, r4, #0
	bl sub_020402F0
	ldr r2, [r5, #8]
	add r1, r2, #1
	str r1, [r5, #8]
	ldrb r1, [r2]
	ldr r0, [r0]
	ldr r2, [r4, #0xc]
	bl BufferFriendsName
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0204846C

	thumb_func_start sub_02048490
sub_02048490: ; 0x02048490
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r6, [r0]
	mov r1, #0x10
	add r0, r6, #0
	bl sub_020402F0
	ldr r1, [r5, #8]
	add r7, r0, #0
	add r0, r1, #1
	str r0, [r5, #8]
	add r0, r5, #0
	ldrb r4, [r1]
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	add r5, r0, #0
	ldr r0, [r6, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r5, #0
	bl GetPartyMonByIndex
	add r2, r0, #0
	ldr r0, [r7]
	add r1, r4, #0
	bl BufferBoxMonSpeciesName
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02048490

	thumb_func_start sub_020484D8
sub_020484D8: ; 0x020484D8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x10
	bl sub_020402F0
	ldr r1, [r5, #8]
	add r6, r0, #0
	add r0, r1, #1
	str r0, [r5, #8]
	add r0, r5, #0
	ldrb r4, [r1]
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	add r2, r0, #0
	ldr r0, [r6]
	add r1, r4, #0
	bl BufferTypeName
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_020484D8

	thumb_func_start sub_02048510
sub_02048510: ; 0x02048510
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x10
	bl sub_020402F0
	ldr r1, [r5, #8]
	add r6, r0, #0
	add r0, r1, #1
	str r0, [r5, #8]
	add r0, r5, #0
	ldrb r4, [r1]
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	add r2, r0, #0
	ldr r0, [r6]
	add r1, r4, #0
	bl BufferItemName
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02048510

	thumb_func_start sub_02048548
sub_02048548: ; 0x02048548
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x10
	bl sub_020402F0
	ldr r1, [r5, #8]
	add r6, r0, #0
	add r0, r1, #1
	str r0, [r5, #8]
	add r0, r5, #0
	ldrb r4, [r1]
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	add r2, r0, #0
	ldr r0, [r6]
	add r1, r4, #0
	bl BufferPocketName
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02048548

	thumb_func_start sub_02048580
sub_02048580: ; 0x02048580
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x10
	bl sub_020402F0
	ldr r1, [r5, #8]
	add r6, r0, #0
	add r0, r1, #1
	str r0, [r5, #8]
	add r0, r5, #0
	ldrb r4, [r1]
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	bl TMHMGetMove
	add r2, r0, #0
	ldr r0, [r6]
	add r1, r4, #0
	bl BufferMoveName
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02048580

	thumb_func_start sub_020485BC
sub_020485BC: ; 0x020485BC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x10
	bl sub_020402F0
	ldr r1, [r5, #8]
	add r6, r0, #0
	add r0, r1, #1
	str r0, [r5, #8]
	add r0, r5, #0
	ldrb r4, [r1]
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	add r2, r0, #0
	ldr r0, [r6]
	add r1, r4, #0
	bl BufferMoveName
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_020485BC

	thumb_func_start sub_020485F4
sub_020485F4: ; 0x020485F4
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x10
	bl sub_020402F0
	ldr r1, [r5, #8]
	add r6, r0, #0
	add r0, r1, #1
	str r0, [r5, #8]
	add r0, r5, #0
	ldrb r4, [r1]
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	add r5, r0, #0
	bl sub_0205BB1C
	add r3, r0, #0
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [r6]
	add r1, r4, #0
	add r2, r5, #0
	bl BufferIntegerAsString
	mov r0, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end sub_020485F4

	thumb_func_start sub_0204863C
sub_0204863C: ; 0x0204863C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x10
	bl sub_020402F0
	ldr r1, [r5, #8]
	add r7, r0, #0
	add r0, r1, #1
	str r0, [r5, #8]
	add r0, r5, #0
	ldrb r6, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	str r0, [sp, #8]
	ldr r1, [r5, #8]
	add r2, r1, #1
	str r2, [r5, #8]
	ldrb r4, [r1]
	add r1, r2, #1
	str r1, [r5, #8]
	ldrb r3, [r2]
	cmp r4, #0
	bne _02048684
	bl sub_0205BB1C
	lsl r0, r0, #0x18
	lsr r3, r0, #0x18
_02048684:
	str r4, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r7]
	ldr r2, [sp, #8]
	add r1, r6, #0
	bl BufferIntegerAsString
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0204863C

	thumb_func_start sub_0204869C
sub_0204869C: ; 0x0204869C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x10
	bl sub_020402F0
	ldr r1, [r5, #8]
	add r7, r0, #0
	add r0, r1, #1
	str r0, [r5, #8]
	add r0, r5, #0
	ldrb r6, [r1]
	bl ScriptReadWord
	ldr r1, [r5, #8]
	str r0, [sp, #8]
	add r2, r1, #1
	str r2, [r5, #8]
	ldrb r4, [r1]
	add r1, r2, #1
	str r1, [r5, #8]
	ldrb r3, [r2]
	cmp r4, #0
	bne _020486D8
	bl sub_0205BB1C
	lsl r0, r0, #0x18
	lsr r3, r0, #0x18
_020486D8:
	str r4, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r7]
	ldr r2, [sp, #8]
	add r1, r6, #0
	bl BufferIntegerAsString
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0204869C

	thumb_func_start sub_020486F0
sub_020486F0: ; 0x020486F0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r6, [r0]
	mov r1, #0x10
	add r0, r6, #0
	bl sub_020402F0
	ldr r1, [r5, #8]
	add r7, r0, #0
	add r0, r1, #1
	str r0, [r5, #8]
	add r0, r5, #0
	ldrb r4, [r1]
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	add r5, r0, #0
	ldr r0, [r6, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r5, #0
	bl GetPartyMonByIndex
	add r2, r0, #0
	ldr r0, [r7]
	add r1, r4, #0
	bl BufferBoxMonNickname
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_020486F0

	thumb_func_start sub_02048738
sub_02048738: ; 0x02048738
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r4, [r0]
	ldr r0, [r4, #0xc]
	bl GetStoragePCPointer
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x10
	bl sub_020402F0
	ldr r1, [r5, #8]
	add r6, r0, #0
	add r0, r1, #1
	str r0, [r5, #8]
	add r0, r5, #0
	ldrb r4, [r1]
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	add r5, r0, #0
	mov r1, #0x1e
	bl _s32_div_f
	add r7, r0, #0
	add r0, r5, #0
	mov r1, #0x1e
	bl _s32_div_f
	add r2, r1, #0
	ldr r0, [sp]
	add r1, r7, #0
	bl PCStorage_GetMonByIndexPair
	add r2, r0, #0
	ldr r0, [r6]
	add r1, r4, #0
	bl BufferBoxMonNickname
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02048738

	thumb_func_start sub_02048794
sub_02048794: ; 0x02048794
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x10
	bl sub_020402F0
	ldr r1, [r5, #8]
	add r6, r0, #0
	add r0, r1, #1
	str r0, [r5, #8]
	add r0, r5, #0
	ldrb r4, [r1]
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	add r2, r0, #0
	ldr r0, [r6]
	add r1, r4, #0
	bl BufferTrainerClassName
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02048794

	thumb_func_start sub_020487CC
sub_020487CC: ; 0x020487CC
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r0, #0x80
	ldr r5, [r0]
	add r0, r5, #0
	bl ScriptEnvironment_GetSav2Ptr
	bl Sav2_PlayerData_GetProfileAddr
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #0x10
	bl sub_020402F0
	ldr r1, [r7, #8]
	add r6, r0, #0
	add r0, r1, #1
	str r0, [r7, #8]
	add r0, r4, #0
	ldrb r5, [r1]
	bl PlayerProfile_GetTrainerGender
	add r7, r0, #0
	add r0, r4, #0
	bl PlayerProfile_GetAvatar
	add r1, r0, #0
	add r0, r7, #0
	mov r2, #2
	bl sub_0205B46C
	add r2, r0, #0
	ldr r0, [r6]
	add r1, r5, #0
	bl BufferTrainerClassNameWithArticle
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_020487CC

	thumb_func_start sub_02048818
sub_02048818: ; 0x02048818
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x10
	bl sub_020402F0
	ldr r1, [r5, #8]
	add r7, r0, #0
	add r0, r1, #1
	str r0, [r5, #8]
	add r0, r5, #0
	ldrb r4, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	ldr r1, [r5, #8]
	str r0, [sp, #8]
	add r0, r1, #1
	str r0, [r5, #8]
	ldrb r5, [r1]
	add r0, r6, #0
	mov r1, #4
	bl sub_02048880
	add r6, r0, #0
	str r5, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, [r7]
	ldr r3, [sp, #8]
	add r1, r4, #0
	add r2, r6, #0
	bl BufferString
	add r0, r6, #0
	bl String_dtor
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02048818

	thumb_func_start sub_02048880
sub_02048880: ; 0x02048880
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r3, r1, #0
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0xed
	bl NewMsgDataFromNarc
	add r5, r0, #0
	add r1, r4, #0
	bl NewString_ReadMsgData
	add r4, r0, #0
	add r0, r5, #0
	bl DestroyMsgData
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02048880

	thumb_func_start sub_020488A4
sub_020488A4: ; 0x020488A4
	push {r4, r5, r6, lr}
	sub sp, #8
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x10
	bl sub_020402F0
	ldr r1, [r4, #8]
	add r6, r0, #0
	add r0, r1, #1
	str r0, [r4, #8]
	add r4, #0x80
	ldr r0, [r4]
	ldrb r5, [r1]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl sub_02066AF0
	mov r1, #4
	bl sub_02048880
	add r4, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, [r6]
	add r1, r5, #0
	add r2, r4, #0
	mov r3, #0
	bl BufferString
	add r0, r4, #0
	bl String_dtor
	mov r0, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end sub_020488A4

	thumb_func_start sub_020488F4
sub_020488F4: ; 0x020488F4
	push {r4, r5, r6, lr}
	sub sp, #8
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x10
	bl sub_020402F0
	ldr r1, [r4, #8]
	add r6, r0, #0
	add r0, r1, #1
	str r0, [r4, #8]
	add r4, #0x80
	ldr r0, [r4]
	ldrb r5, [r1]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl sub_02066B00
	mov r1, #4
	bl sub_02048880
	add r4, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, [r6]
	add r1, r5, #0
	add r2, r4, #0
	mov r3, #0
	bl BufferString
	add r0, r4, #0
	bl String_dtor
	mov r0, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end sub_020488F4

	thumb_func_start sub_02048944
sub_02048944: ; 0x02048944
	push {r4, r5, r6, lr}
	sub sp, #8
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x10
	bl sub_020402F0
	ldr r1, [r4, #8]
	add r6, r0, #0
	add r0, r1, #1
	str r0, [r4, #8]
	add r4, #0x80
	ldr r0, [r4]
	ldrb r5, [r1]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl sub_02066B28
	mov r1, #4
	bl sub_02048880
	add r4, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, [r6]
	add r1, r5, #0
	add r2, r4, #0
	mov r3, #0
	bl BufferString
	add r0, r4, #0
	bl String_dtor
	mov r0, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02048944

	thumb_func_start sub_02048994
sub_02048994: ; 0x02048994
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x10
	bl sub_020402F0
	ldr r1, [r5, #8]
	add r6, r0, #0
	add r0, r1, #1
	str r0, [r5, #8]
	add r0, r5, #0
	ldrb r4, [r1]
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	add r2, r0, #0
	ldr r0, [r6]
	add r1, r4, #0
	bl BufferDecorationName
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02048994

	thumb_func_start sub_020489CC
sub_020489CC: ; 0x020489CC
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x10
	bl sub_020402F0
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl VarGet
	mov r0, #0
	pop {r4, pc}
	thumb_func_end sub_020489CC

	thumb_func_start sub_020489F4
sub_020489F4: ; 0x020489F4
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x10
	bl sub_020402F0
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl VarGet
	mov r0, #0
	pop {r4, pc}
	thumb_func_end sub_020489F4

	thumb_func_start sub_02048A1C
sub_02048A1C: ; 0x02048A1C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	mov r0, #0x16
	mov r1, #4
	bl String_ctor
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x10
	bl sub_020402F0
	ldr r1, [r5, #8]
	add r7, r0, #0
	add r0, r1, #1
	str r0, [r5, #8]
	add r0, r5, #0
	ldrb r6, [r1]
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	mov r1, #4
	add r2, r4, #0
	bl sub_02068F98
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, [r7]
	add r1, r6, #0
	add r2, r4, #0
	mov r3, #0
	bl BufferString
	add r0, r4, #0
	bl String_dtor
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02048A1C

	thumb_func_start sub_02048A7C
sub_02048A7C: ; 0x02048A7C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x10
	bl sub_020402F0
	ldr r1, [r4, #8]
	add r7, r0, #0
	add r0, r1, #1
	str r0, [r4, #8]
	add r0, r4, #0
	ldrb r6, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r5, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl VarGet
	sub r5, #0x95
	add r4, r0, #0
	lsl r0, r5, #0x10
	lsr r0, r0, #0x10
	mov r1, #0x20
	bl GetNutName
	add r5, r0, #0
	cmp r4, #2
	bhs _02048AD2
	mov r0, #1
	b _02048AD4
_02048AD2:
	mov r0, #0
_02048AD4:
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, [r7]
	add r1, r6, #0
	add r2, r5, #0
	mov r3, #0
	bl BufferString
	add r0, r5, #0
	bl String_dtor
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02048A7C

	thumb_func_start sub_02048AF4
sub_02048AF4: ; 0x02048AF4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x10
	bl sub_020402F0
	ldr r1, [r5, #8]
	add r6, r0, #0
	add r0, r1, #1
	str r0, [r5, #8]
	add r0, r5, #0
	ldrb r4, [r1]
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	add r2, r0, #0
	ldr r0, [r6]
	add r1, r4, #0
	bl BufferNatureName
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02048AF4

	thumb_func_start sub_02048B2C
sub_02048B2C: ; 0x02048B2C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x10
	bl sub_020402F0
	ldr r1, [r5, #8]
	add r6, r0, #0
	add r0, r1, #1
	str r0, [r5, #8]
	add r0, r5, #0
	ldrb r4, [r1]
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	add r2, r0, #0
	ldr r0, [r6]
	add r1, r4, #0
	bl BufferFashionName
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02048B2C

	thumb_func_start sub_02048B64
sub_02048B64: ; 0x02048B64
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r6, [r0]
	mov r1, #0x10
	add r0, r6, #0
	bl sub_020402F0
	ldr r1, [r4, #8]
	add r7, r0, #0
	add r0, r1, #1
	str r0, [r4, #8]
	add r0, r4, #0
	ldrb r5, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	str r0, [sp]
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl VarGet
	add r4, r0, #0
	ldr r0, [r6, #0xc]
	bl SavArray_PlayerParty_get
	ldr r1, [sp]
	bl GetPartyMonByIndex
	add r4, #0x36
	add r1, r4, #0
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r2, r0, #0x10
	ldr r0, [r7]
	add r1, r5, #0
	bl BufferMoveName
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02048B64

	thumb_func_start sub_02048BCC
sub_02048BCC: ; 0x02048BCC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x10
	bl sub_020402F0
	ldr r1, [r5, #8]
	add r6, r0, #0
	add r0, r1, #1
	str r0, [r5, #8]
	add r0, r5, #0
	ldrb r4, [r1]
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	mov r1, #3
	bl sub_0208E55C
	lsl r0, r0, #0x10
	lsr r2, r0, #0x10
	ldr r0, [r6]
	add r1, r4, #0
	bl BufferRibbonNameOrDesc
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02048BCC

	thumb_func_start sub_02048C10
sub_02048C10: ; 0x02048C10
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x10
	bl sub_020402F0
	ldr r1, [r5, #8]
	add r6, r0, #0
	add r0, r1, #1
	str r0, [r5, #8]
	add r0, r5, #0
	ldrb r4, [r1]
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	add r2, r0, #0
	ldr r0, [r6]
	add r1, r4, #0
	bl BufferSealName
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02048C10

	thumb_func_start sub_02048C48
sub_02048C48: ; 0x02048C48
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x10
	bl sub_020402F0
	ldr r1, [r5, #8]
	add r6, r0, #0
	add r0, r1, #1
	str r0, [r5, #8]
	add r0, r5, #0
	ldrb r4, [r1]
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	add r2, r0, #0
	ldr r0, [r6]
	add r1, r4, #0
	bl BufferTrainerName
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02048C48

	thumb_func_start sub_02048C80
sub_02048C80: ; 0x02048C80
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x10
	bl sub_020402F0
	ldr r1, [r5, #8]
	add r6, r0, #0
	add r0, r1, #1
	str r0, [r5, #8]
	add r0, r5, #0
	ldrb r4, [r1]
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	add r2, r0, #0
	lsl r2, r2, #0x18
	ldr r0, [r6]
	add r1, r4, #0
	lsr r2, r2, #0x18
	bl sub_0200CA0C
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02048C80

	thumb_func_start sub_02048CBC
sub_02048CBC: ; 0x02048CBC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x10
	bl sub_020402F0
	ldr r1, [r5, #8]
	add r6, r0, #0
	add r0, r1, #1
	str r0, [r5, #8]
	add r0, r5, #0
	ldrb r4, [r1]
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	add r2, r0, #0
	ldr r0, [r6]
	add r1, r4, #0
	bl BufferItemNameWithIndefArticle
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02048CBC

	thumb_func_start sub_02048CF4
sub_02048CF4: ; 0x02048CF4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x10
	bl sub_020402F0
	ldr r1, [r5, #8]
	add r6, r0, #0
	add r0, r1, #1
	str r0, [r5, #8]
	add r0, r5, #0
	ldrb r4, [r1]
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	add r2, r0, #0
	ldr r0, [r6]
	add r1, r4, #0
	bl BufferItemNamePlural
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02048CF4

	thumb_func_start sub_02048D2C
sub_02048D2C: ; 0x02048D2C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r6, [r0]
	mov r1, #0x10
	add r0, r6, #0
	bl sub_020402F0
	ldr r1, [r5, #8]
	add r7, r0, #0
	add r0, r1, #1
	str r0, [r5, #8]
	add r0, r5, #0
	ldrb r4, [r1]
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	add r5, r0, #0
	ldr r0, [r6, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r5, #0
	bl GetPartyMonByIndex
	add r2, r0, #0
	ldr r0, [r7]
	add r1, r4, #0
	bl BufferBoxMonSpeciesNameWithArticle
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02048D2C

	thumb_func_start sub_02048D74
sub_02048D74: ; 0x02048D74
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x10
	bl sub_020402F0
	ldr r1, [r5, #8]
	add r6, r0, #0
	add r0, r1, #1
	str r0, [r5, #8]
	add r0, r5, #0
	ldrb r4, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	ldr r0, [r5, #8]
	add r1, r4, #0
	add r0, r0, #1
	str r0, [r5, #8]
	ldr r0, [r6]
	add r2, r7, #0
	bl BufferSpeciesNameWithArticle
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02048D74

	thumb_func_start sub_02048DBC
sub_02048DBC: ; 0x02048DBC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x10
	bl sub_020402F0
	ldr r1, [r5, #8]
	add r6, r0, #0
	add r0, r1, #1
	str r0, [r5, #8]
	add r5, #0x80
	ldr r0, [r5]
	ldrb r4, [r1]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl sub_02066B28
	add r2, r0, #0
	ldr r0, [r6]
	add r1, r4, #0
	bl BufferSpeciesNameWithArticle
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02048DBC

	thumb_func_start sub_02048DF0
sub_02048DF0: ; 0x02048DF0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x10
	bl sub_020402F0
	ldr r1, [r5, #8]
	add r6, r0, #0
	add r0, r1, #1
	str r0, [r5, #8]
	add r0, r5, #0
	ldrb r4, [r1]
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	add r2, r0, #0
	ldr r0, [r6]
	add r1, r4, #0
	bl BufferFashionNameWithArticle
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02048DF0

	thumb_func_start sub_02048E28
sub_02048E28: ; 0x02048E28
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x10
	bl sub_020402F0
	ldr r1, [r5, #8]
	add r6, r0, #0
	add r0, r1, #1
	str r0, [r5, #8]
	add r0, r5, #0
	ldrb r4, [r1]
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	add r2, r0, #0
	ldr r0, [r6]
	add r1, r4, #0
	bl BufferTrainerClassNameWithArticle
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02048E28

	thumb_func_start sub_02048E60
sub_02048E60: ; 0x02048E60
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x10
	bl sub_020402F0
	ldr r1, [r5, #8]
	add r6, r0, #0
	add r0, r1, #1
	str r0, [r5, #8]
	add r0, r5, #0
	ldrb r4, [r1]
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	add r2, r0, #0
	ldr r0, [r6]
	add r1, r4, #0
	bl BufferSealNamePlural
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02048E60

	thumb_func_start sub_02048E98
sub_02048E98: ; 0x02048E98
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x10
	bl sub_020402F0
	ldr r2, [r4, #8]
	add r1, r2, #1
	str r1, [r4, #8]
	ldrb r1, [r2]
	ldr r0, [r0]
	bl ScrStrBufs_UpperFirstChar
	mov r0, #0
	pop {r4, pc}
	thumb_func_end sub_02048E98
