	.include "asm/macros.inc"
	.include "global.inc"

	.rodata

_020F5C1C:
	.byte 0x17, 0x01, 0x19, 0x01
	.byte 0x18, 0x01, 0x00, 0x00
_020F5C24:
	.byte 0x40, 0x01
_020F5C26:
	.byte 0x08, 0x00, 0x60, 0x01, 0x10, 0x00, 0xA0, 0x01, 0x10, 0x00
	.byte 0xE0, 0x01, 0x10, 0x00, 0x20, 0x02, 0x10, 0x00, 0x60, 0x02, 0x10, 0x00, 0xA0, 0x02, 0x10, 0x00

	.text

	thumb_func_start ScrStrBufs_new
ScrStrBufs_new: ; 0x0200BD08
	ldr r3, _0200BD14 ; =ScrStrBufs_new_custom
	add r2, r0, #0
	mov r0, #8
	mov r1, #0x20
	bx r3
	nop
_0200BD14: .word ScrStrBufs_new_custom
	thumb_func_end ScrStrBufs_new

	thumb_func_start ScrStrBufs_new_custom
ScrStrBufs_new_custom: ; 0x0200BD18
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r7, r0, #0
	str r1, [sp]
	str r2, [sp, #4]
	bne _0200BD28
	bl GF_AssertFail
_0200BD28:
	ldr r0, [sp]
	cmp r0, #0
	bne _0200BD32
	bl GF_AssertFail
_0200BD32:
	ldr r0, [sp, #4]
	mov r1, #0x10
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	beq _0200BD98
	ldr r0, [sp, #4]
	str r7, [r4]
	str r0, [r4, #4]
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl String_ctor
	str r0, [r4, #0xc]
	cmp r0, #0
	beq _0200BD98
	ldr r0, [sp, #4]
	lsl r1, r7, #3
	bl AllocFromHeapAtEnd
	str r0, [r4, #8]
	cmp r0, #0
	beq _0200BD98
	mov r6, #0
	cmp r7, #0
	bls _0200BD8E
	add r5, r6, #0
_0200BD68:
	add r0, r0, r5
	bl ScrStrBufs_InitSub
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl String_ctor
	ldr r1, [r4, #8]
	add r1, r1, r5
	str r0, [r1, #4]
	ldr r0, [r4, #8]
	add r1, r0, r5
	ldr r1, [r1, #4]
	cmp r1, #0
	beq _0200BD8E
	add r6, r6, #1
	add r5, #8
	cmp r6, r7
	blo _0200BD68
_0200BD8E:
	cmp r6, r7
	bne _0200BD98
	add sp, #8
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_0200BD98:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ScrStrBufs_new_custom

	thumb_func_start ScrStrBufs_delete
ScrStrBufs_delete: ; 0x0200BDA0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5]
	cmp r0, #0
	bne _0200BDAE
	bl GF_AssertFail
_0200BDAE:
	ldr r0, [r5, #8]
	cmp r0, #0
	beq _0200BDDC
	ldr r0, [r5]
	mov r6, #0
	cmp r0, #0
	bls _0200BDD6
	add r4, r6, #0
_0200BDBE:
	ldr r0, [r5, #8]
	add r0, r0, r4
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _0200BDD6
	bl String_dtor
	ldr r0, [r5]
	add r6, r6, #1
	add r4, #8
	cmp r6, r0
	blo _0200BDBE
_0200BDD6:
	ldr r0, [r5, #8]
	bl FreeToHeap
_0200BDDC:
	ldr r0, [r5, #0xc]
	cmp r0, #0
	beq _0200BDE6
	bl String_dtor
_0200BDE6:
	mov r0, #0
	str r0, [r5]
	add r0, r5, #0
	bl FreeToHeap
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ScrStrBufs_delete

	thumb_func_start ScrStrBufs_InitSub
ScrStrBufs_InitSub: ; 0x0200BDF4
	bx lr
	.balign 4, 0
	thumb_func_end ScrStrBufs_InitSub

	thumb_func_start SetStringAsPlaceholder
SetStringAsPlaceholder: ; 0x0200BDF8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r6, r1, #0
	add r7, r2, #0
	add r4, r3, #0
	cmp r6, r0
	blo _0200BE0C
	bl GF_AssertFail
_0200BE0C:
	ldr r0, [r5]
	cmp r6, r0
	bhs _0200BE3A
	cmp r4, #0
	beq _0200BE2C
	ldrb r0, [r4]
	ldr r3, [r5, #8]
	lsl r2, r6, #3
	strb r0, [r3, r2]
	ldrb r0, [r4, #1]
	add r1, r3, r2
	strb r0, [r1, #1]
	ldrb r0, [r4, #2]
	strb r0, [r1, #2]
	ldrb r0, [r4, #3]
	strb r0, [r1, #3]
_0200BE2C:
	ldr r1, [r5, #8]
	lsl r0, r6, #3
	add r0, r1, r0
	ldr r0, [r0, #4]
	add r1, r7, #0
	bl StringCopy
_0200BE3A:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end SetStringAsPlaceholder

	thumb_func_start BufferString
BufferString: ; 0x0200BE3C
	push {r3, lr}
	mov r3, #0
	bl SetStringAsPlaceholder
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end BufferString

	thumb_func_start BufferPlayersName
BufferPlayersName: ; 0x0200BE48
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, r2, #0
	add r4, r1, #0
	bl PlayerProfile_GetNamePtr
	add r1, r0, #0
	ldr r0, [r5, #0xc]
	bl CopyU16ArrayToString
	ldr r2, [r5, #0xc]
	add r0, r5, #0
	add r1, r4, #0
	mov r3, #0
	bl SetStringAsPlaceholder
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end BufferPlayersName

	thumb_func_start BufferRivalsName
BufferRivalsName: ; 0x0200BE6C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, r2, #0
	add r4, r1, #0
	bl Sav2_Misc_const_get
	bl Sav2_Misc_RivalName_get
	add r1, r0, #0
	ldr r0, [r5, #0xc]
	bl CopyU16ArrayToString
	ldr r2, [r5, #0xc]
	add r0, r5, #0
	add r1, r4, #0
	mov r3, #0
	bl SetStringAsPlaceholder
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end BufferRivalsName

	thumb_func_start BufferFriendsName
BufferFriendsName: ; 0x0200BE94
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, r2, #0
	add r6, r1, #0
	bl Sav2_PlayerData_GetProfileAddr
	add r7, r0, #0
	ldr r2, _0200BEE4 ; =0x000001BD
	ldr r3, [r5, #4]
	mov r0, #1
	mov r1, #0x1b
	bl NewMsgDataFromNarc
	add r4, r0, #0
	add r0, r7, #0
	bl PlayerProfile_GetTrainerGender
	cmp r0, #0
	bne _0200BEC6
	ldr r2, [r5, #0xc]
	add r0, r4, #0
	mov r1, #1
	bl ReadMsgDataIntoString
	b _0200BED0
_0200BEC6:
	ldr r2, [r5, #0xc]
	add r0, r4, #0
	mov r1, #0
	bl ReadMsgDataIntoString
_0200BED0:
	ldr r2, [r5, #0xc]
	add r0, r5, #0
	add r1, r6, #0
	mov r3, #0
	bl SetStringAsPlaceholder
	add r0, r4, #0
	bl DestroyMsgData
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0200BEE4: .word 0x000001BD
	thumb_func_end BufferFriendsName

	thumb_func_start BufferSpeciesName
BufferSpeciesName: ; 0x0200BEE8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r3, [r5, #4]
	add r4, r1, #0
	add r6, r2, #0
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0xed
	bl NewMsgDataFromNarc
	ldr r2, [r5, #0xc]
	add r1, r6, #0
	add r7, r0, #0
	bl ReadMsgDataIntoString
	ldr r2, [r5, #0xc]
	add r0, r5, #0
	add r1, r4, #0
	mov r3, #0
	bl SetStringAsPlaceholder
	add r0, r7, #0
	bl DestroyMsgData
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end BufferSpeciesName

	thumb_func_start BufferBoxMonSpeciesName
BufferBoxMonSpeciesName: ; 0x0200BF1C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r0, r2, #0
	mov r1, #5
	mov r2, #0
	bl GetBoxMonData
	add r2, r0, #0
	lsl r2, r2, #0x10
	add r0, r5, #0
	add r1, r4, #0
	lsr r2, r2, #0x10
	bl BufferSpeciesName
	pop {r3, r4, r5, pc}
	thumb_func_end BufferBoxMonSpeciesName

	thumb_func_start BufferBoxMonSpeciesNameWithArticle
BufferBoxMonSpeciesNameWithArticle: ; 0x0200BF3C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r0, r2, #0
	mov r1, #5
	mov r2, #0
	bl GetBoxMonData
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl BufferSpeciesNameWithArticle
	pop {r3, r4, r5, pc}
	thumb_func_end BufferBoxMonSpeciesNameWithArticle

	thumb_func_start BufferSpeciesNameWithArticle
BufferSpeciesNameWithArticle: ; 0x0200BF58
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r3, [r5, #4]
	add r4, r1, #0
	add r6, r2, #0
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0xee
	bl NewMsgDataFromNarc
	ldr r2, [r5, #0xc]
	add r1, r6, #0
	add r7, r0, #0
	bl ReadMsgDataIntoString
	ldr r2, [r5, #0xc]
	add r0, r5, #0
	add r1, r4, #0
	mov r3, #0
	bl SetStringAsPlaceholder
	add r0, r7, #0
	bl DestroyMsgData
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end BufferSpeciesNameWithArticle

	thumb_func_start BufferBoxMonNickname
BufferBoxMonNickname: ; 0x0200BF8C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, r2, #0
	add r4, r1, #0
	ldr r2, [r5, #0xc]
	mov r1, #0x77
	bl GetBoxMonData
	ldr r2, [r5, #0xc]
	add r0, r5, #0
	add r1, r4, #0
	mov r3, #0
	bl SetStringAsPlaceholder
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end BufferBoxMonNickname

	thumb_func_start BufferBoxMonOTName
BufferBoxMonOTName: ; 0x0200BFAC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, r2, #0
	add r4, r1, #0
	ldr r2, [r5, #0xc]
	mov r1, #0x91
	bl GetBoxMonData
	ldr r2, [r5, #0xc]
	add r0, r5, #0
	add r1, r4, #0
	mov r3, #0
	bl SetStringAsPlaceholder
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end BufferBoxMonOTName

	thumb_func_start BufferIntegerAsString
BufferIntegerAsString: ; 0x0200BFCC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [sp, #0x14]
	add r4, r1, #0
	str r0, [sp]
	add r1, r2, #0
	add r2, r3, #0
	ldr r0, [r5, #0xc]
	ldr r3, [sp, #0x10]
	bl String16_FormatInteger
	ldr r2, [r5, #0xc]
	add r0, r5, #0
	add r1, r4, #0
	mov r3, #0
	bl SetStringAsPlaceholder
	pop {r3, r4, r5, pc}
	thumb_func_end BufferIntegerAsString

	thumb_func_start BufferMoveName
BufferMoveName: ; 0x0200BFF0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r2, #0
	add r4, r1, #0
	ldr r2, _0200C024 ; =0x000002EE
	ldr r3, [r5, #4]
	mov r0, #1
	mov r1, #0x1b
	bl NewMsgDataFromNarc
	add r7, r0, #0
	beq _0200C022
	ldr r2, [r5, #0xc]
	add r1, r6, #0
	bl ReadMsgDataIntoString
	ldr r2, [r5, #0xc]
	add r0, r5, #0
	add r1, r4, #0
	mov r3, #0
	bl SetStringAsPlaceholder
	add r0, r7, #0
	bl DestroyMsgData
_0200C022:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0200C024: .word 0x000002EE
	thumb_func_end BufferMoveName

	thumb_func_start BufferRibbonNameOrDesc
BufferRibbonNameOrDesc: ; 0x0200C028
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r2, #0
	mov r2, #0x6a
	add r4, r1, #0
	ldr r3, [r5, #4]
	mov r0, #1
	mov r1, #0x1b
	lsl r2, r2, #2
	bl NewMsgDataFromNarc
	add r7, r0, #0
	beq _0200C05C
	ldr r2, [r5, #0xc]
	add r1, r6, #0
	bl ReadMsgDataIntoString
	ldr r2, [r5, #0xc]
	add r0, r5, #0
	add r1, r4, #0
	mov r3, #0
	bl SetStringAsPlaceholder
	add r0, r7, #0
	bl DestroyMsgData
_0200C05C:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end BufferRibbonNameOrDesc

	thumb_func_start BufferAbilityName
BufferAbilityName: ; 0x0200C060
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r2, #0
	mov r2, #0x2d
	add r4, r1, #0
	ldr r3, [r5, #4]
	mov r0, #1
	mov r1, #0x1b
	lsl r2, r2, #4
	bl NewMsgDataFromNarc
	add r7, r0, #0
	beq _0200C094
	ldr r2, [r5, #0xc]
	add r1, r6, #0
	bl ReadMsgDataIntoString
	ldr r2, [r5, #0xc]
	add r0, r5, #0
	add r1, r4, #0
	mov r3, #0
	bl SetStringAsPlaceholder
	add r0, r7, #0
	bl DestroyMsgData
_0200C094:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end BufferAbilityName

	thumb_func_start BufferNatureName
BufferNatureName: ; 0x0200C098
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r3, [r5, #4]
	add r4, r1, #0
	add r6, r2, #0
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0x22
	bl NewMsgDataFromNarc
	ldr r2, [r5, #0xc]
	add r1, r6, #0
	add r7, r0, #0
	bl ReadMsgDataIntoString
	ldr r2, [r5, #0xc]
	add r0, r5, #0
	add r1, r4, #0
	mov r3, #0
	bl SetStringAsPlaceholder
	add r0, r7, #0
	bl DestroyMsgData
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end BufferNatureName

	thumb_func_start BufferItemName
BufferItemName: ; 0x0200C0CC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r3, [r5, #4]
	add r4, r1, #0
	add r6, r2, #0
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0xde
	bl NewMsgDataFromNarc
	add r7, r0, #0
	beq _0200C0FE
	ldr r2, [r5, #0xc]
	add r1, r6, #0
	bl ReadMsgDataIntoString
	ldr r2, [r5, #0xc]
	add r0, r5, #0
	add r1, r4, #0
	mov r3, #0
	bl SetStringAsPlaceholder
	add r0, r7, #0
	bl DestroyMsgData
_0200C0FE:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end BufferItemName

	thumb_func_start BufferItemNameWithIndefArticle
BufferItemNameWithIndefArticle: ; 0x0200C100
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r3, [r5, #4]
	add r4, r1, #0
	add r6, r2, #0
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0xdf
	bl NewMsgDataFromNarc
	add r7, r0, #0
	beq _0200C132
	ldr r2, [r5, #0xc]
	add r1, r6, #0
	bl ReadMsgDataIntoString
	ldr r2, [r5, #0xc]
	add r0, r5, #0
	add r1, r4, #0
	mov r3, #0
	bl SetStringAsPlaceholder
	add r0, r7, #0
	bl DestroyMsgData
_0200C132:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end BufferItemNameWithIndefArticle

	thumb_func_start BufferItemNamePlural
BufferItemNamePlural: ; 0x0200C134
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r3, [r5, #4]
	add r4, r1, #0
	add r6, r2, #0
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0xe0
	bl NewMsgDataFromNarc
	add r7, r0, #0
	beq _0200C166
	ldr r2, [r5, #0xc]
	add r1, r6, #0
	bl ReadMsgDataIntoString
	ldr r2, [r5, #0xc]
	add r0, r5, #0
	add r1, r4, #0
	mov r3, #0
	bl SetStringAsPlaceholder
	add r0, r7, #0
	bl DestroyMsgData
_0200C166:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end BufferItemNamePlural

	thumb_func_start BufferPocketName
BufferPocketName: ; 0x0200C168
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r3, [r5, #4]
	add r4, r1, #0
	add r6, r2, #0
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0xe2
	bl NewMsgDataFromNarc
	add r7, r0, #0
	beq _0200C19A
	ldr r2, [r5, #0xc]
	add r1, r6, #0
	bl ReadMsgDataIntoString
	ldr r2, [r5, #0xc]
	add r0, r5, #0
	add r1, r4, #0
	mov r3, #0
	bl SetStringAsPlaceholder
	add r0, r7, #0
	bl DestroyMsgData
_0200C19A:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end BufferPocketName

	thumb_func_start BufferTypeName
BufferTypeName: ; 0x0200C19C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r2, #0
	add r4, r1, #0
	ldr r2, _0200C1D0 ; =0x000002DF
	ldr r3, [r5, #4]
	mov r0, #1
	mov r1, #0x1b
	bl NewMsgDataFromNarc
	add r7, r0, #0
	beq _0200C1CE
	ldr r2, [r5, #0xc]
	add r1, r6, #0
	bl ReadMsgDataIntoString
	ldr r2, [r5, #0xc]
	add r0, r5, #0
	add r1, r4, #0
	mov r3, #0
	bl SetStringAsPlaceholder
	add r0, r7, #0
	bl DestroyMsgData
_0200C1CE:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0200C1D0: .word 0x000002DF
	thumb_func_end BufferTypeName

	thumb_func_start BufferStatName
BufferStatName: ; 0x0200C1D4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r2, #0
	add r4, r1, #0
	ldr r2, _0200C208 ; =0x000001BB
	ldr r3, [r5, #4]
	mov r0, #1
	mov r1, #0x1b
	bl NewMsgDataFromNarc
	add r7, r0, #0
	beq _0200C206
	ldr r2, [r5, #0xc]
	add r1, r6, #0
	bl ReadMsgDataIntoString
	ldr r2, [r5, #0xc]
	add r0, r5, #0
	add r1, r4, #0
	mov r3, #0
	bl SetStringAsPlaceholder
	add r0, r7, #0
	bl DestroyMsgData
_0200C206:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0200C208: .word 0x000001BB
	thumb_func_end BufferStatName

	thumb_func_start BufferStatusName
BufferStatusName: ; 0x0200C20C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r3, [r5, #4]
	add r4, r1, #0
	add r6, r2, #0
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0x2c
	bl NewMsgDataFromNarc
	add r7, r0, #0
	beq _0200C23E
	ldr r2, [r5, #0xc]
	add r1, r6, #0
	bl ReadMsgDataIntoString
	ldr r2, [r5, #0xc]
	add r0, r5, #0
	add r1, r4, #0
	mov r3, #0
	bl SetStringAsPlaceholder
	add r0, r7, #0
	bl DestroyMsgData
_0200C23E:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end BufferStatusName

	thumb_func_start BufferFlavorDislikeText
BufferFlavorDislikeText: ; 0x0200C240
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r2, #0
	add r4, r1, #0
	ldr r2, _0200C274 ; =0x0000027F
	ldr r3, [r5, #4]
	mov r0, #1
	mov r1, #0x1b
	bl NewMsgDataFromNarc
	add r7, r0, #0
	beq _0200C272
	ldr r2, [r5, #0xc]
	add r1, r6, #0
	bl ReadMsgDataIntoString
	ldr r2, [r5, #0xc]
	add r0, r5, #0
	add r1, r4, #0
	mov r3, #0
	bl SetStringAsPlaceholder
	add r0, r7, #0
	bl DestroyMsgData
_0200C272:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0200C274: .word 0x0000027F
	thumb_func_end BufferFlavorDislikeText

	thumb_func_start BufferLandmarkName
BufferLandmarkName: ; 0x0200C278
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r7, r1, #0
	mov r1, #0x1b
	add r4, r2, #0
	add r2, r1, #0
	ldr r3, [r5, #4]
	mov r0, #1
	add r2, #0xfc
	bl NewMsgDataFromNarc
	add r6, r0, #0
	beq _0200C2D2
	cmp r4, #0
	beq _0200C29E
	bl MsgDataGetCount
	cmp r4, r0
	blo _0200C2B6
_0200C29E:
	add r0, r6, #0
	bl DestroyMsgData
	mov r1, #0x1b
	add r2, r1, #0
	ldr r3, [r5, #4]
	mov r0, #1
	add r2, #0xfd
	bl NewMsgDataFromNarc
	add r6, r0, #0
	mov r4, #2
_0200C2B6:
	ldr r2, [r5, #0xc]
	add r0, r6, #0
	add r1, r4, #0
	bl ReadMsgDataIntoString
	ldr r2, [r5, #0xc]
	add r0, r5, #0
	add r1, r7, #0
	mov r3, #0
	bl SetStringAsPlaceholder
	add r0, r6, #0
	bl DestroyMsgData
_0200C2D2:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end BufferLandmarkName

	thumb_func_start BufferTrainerClassName
BufferTrainerClassName: ; 0x0200C2D4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r2, #0
	add r4, r1, #0
	ldr r2, _0200C308 ; =0x000002DA
	ldr r3, [r5, #4]
	mov r0, #1
	mov r1, #0x1b
	bl NewMsgDataFromNarc
	add r7, r0, #0
	beq _0200C306
	ldr r2, [r5, #0xc]
	add r1, r6, #0
	bl ReadMsgDataIntoString
	ldr r2, [r5, #0xc]
	add r0, r5, #0
	add r1, r4, #0
	mov r3, #0
	bl SetStringAsPlaceholder
	add r0, r7, #0
	bl DestroyMsgData
_0200C306:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0200C308: .word 0x000002DA
	thumb_func_end BufferTrainerClassName

	thumb_func_start BufferTrainerClassNameWithArticle
BufferTrainerClassNameWithArticle: ; 0x0200C30C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r2, #0
	add r4, r1, #0
	ldr r2, _0200C340 ; =0x000002DB
	ldr r3, [r5, #4]
	mov r0, #1
	mov r1, #0x1b
	bl NewMsgDataFromNarc
	add r7, r0, #0
	beq _0200C33E
	ldr r2, [r5, #0xc]
	add r1, r6, #0
	bl ReadMsgDataIntoString
	ldr r2, [r5, #0xc]
	add r0, r5, #0
	add r1, r4, #0
	mov r3, #0
	bl SetStringAsPlaceholder
	add r0, r7, #0
	bl DestroyMsgData
_0200C33E:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0200C340: .word 0x000002DB
	thumb_func_end BufferTrainerClassNameWithArticle

	thumb_func_start BufferTrainerClassNameFromDataStruct
BufferTrainerClassNameFromDataStruct: ; 0x0200C344
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r2, #0
	add r6, r1, #0
	ldr r2, _0200C378 ; =0x000002DA
	ldr r3, [r5, #4]
	mov r0, #1
	mov r1, #0x1b
	bl NewMsgDataFromNarc
	add r7, r0, #0
	beq _0200C376
	ldrb r1, [r4, #1]
	ldr r2, [r5, #0xc]
	bl ReadMsgDataIntoString
	ldr r2, [r5, #0xc]
	add r0, r5, #0
	add r1, r6, #0
	mov r3, #0
	bl SetStringAsPlaceholder
	add r0, r7, #0
	bl DestroyMsgData
_0200C376:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0200C378: .word 0x000002DA
	thumb_func_end BufferTrainerClassNameFromDataStruct

	thumb_func_start BufferTrainerName
BufferTrainerName: ; 0x0200C37C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r2, #0
	add r4, r1, #0
	ldr r2, _0200C3B0 ; =0x000002D9
	ldr r3, [r5, #4]
	mov r0, #1
	mov r1, #0x1b
	bl NewMsgDataFromNarc
	add r7, r0, #0
	beq _0200C3AE
	ldr r2, [r5, #0xc]
	add r1, r6, #0
	bl ReadMsgDataIntoString
	ldr r2, [r5, #0xc]
	add r0, r5, #0
	add r1, r4, #0
	mov r3, #0
	bl SetStringAsPlaceholder
	add r0, r7, #0
	bl DestroyMsgData
_0200C3AE:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0200C3B0: .word 0x000002D9
	thumb_func_end BufferTrainerName

	thumb_func_start BufferFrontierOpponentName
BufferFrontierOpponentName: ; 0x0200C3B4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r1, #0x1b
	add r6, r2, #0
	ldr r3, [r5, #4]
	mov r0, #1
	add r2, r1, #0
	bl NewMsgDataFromNarc
	add r7, r0, #0
	beq _0200C3E6
	ldr r2, [r5, #0xc]
	add r1, r6, #0
	bl ReadMsgDataIntoString
	ldr r2, [r5, #0xc]
	add r0, r5, #0
	add r1, r4, #0
	mov r3, #0
	bl SetStringAsPlaceholder
	add r0, r7, #0
	bl DestroyMsgData
_0200C3E6:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end BufferFrontierOpponentName

	thumb_func_start BufferTrainerNameFromDataStruct
BufferTrainerNameFromDataStruct: ; 0x0200C3E8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	add r2, #0x14
	add r4, r1, #0
	add r1, r2, #0
	bl CopyU16ArrayToString
	ldr r2, [r5, #0xc]
	add r0, r5, #0
	add r1, r4, #0
	mov r3, #0
	bl SetStringAsPlaceholder
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end BufferTrainerNameFromDataStruct

	thumb_func_start BufferDecorationName
BufferDecorationName: ; 0x0200C408
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r2, #0
	add r4, r1, #0
	ldr r2, _0200C43C ; =0x000002E1
	ldr r3, [r5, #4]
	mov r0, #1
	mov r1, #0x1b
	bl NewMsgDataFromNarc
	add r7, r0, #0
	beq _0200C43A
	ldr r2, [r5, #0xc]
	add r1, r6, #0
	bl ReadMsgDataIntoString
	ldr r2, [r5, #0xc]
	add r0, r5, #0
	add r1, r4, #0
	mov r3, #0
	bl SetStringAsPlaceholder
	add r0, r7, #0
	bl DestroyMsgData
_0200C43A:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0200C43C: .word 0x000002E1
	thumb_func_end BufferDecorationName

	thumb_func_start sub_0200C440
sub_0200C440: ; 0x0200C440
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r3, [r5, #4]
	add r6, r1, #0
	add r4, r2, #0
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0x28
	bl NewMsgDataFromNarc
	add r7, r0, #0
	cmp r4, #0
	beq _0200C460
	cmp r4, #1
	beq _0200C46A
	b _0200C474
_0200C460:
	ldr r2, [r5, #0xc]
	mov r1, #0x37
	bl ReadMsgDataIntoString
	b _0200C47A
_0200C46A:
	ldr r2, [r5, #0xc]
	mov r1, #0x38
	bl ReadMsgDataIntoString
	b _0200C47A
_0200C474:
	ldr r0, [r5, #0xc]
	bl StringSetEmpty
_0200C47A:
	ldr r2, [r5, #0xc]
	add r0, r5, #0
	add r1, r6, #0
	mov r3, #0
	bl SetStringAsPlaceholder
	add r0, r7, #0
	bl DestroyMsgData
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0200C440

	thumb_func_start sub_0200C490
sub_0200C490: ; 0x0200C490
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, r2, #0
	add r4, r1, #0
	ldr r2, [r5, #0xc]
	add r1, r3, #0
	bl PCStorage_GetBoxName
	ldr r2, [r5, #0xc]
	add r0, r5, #0
	add r1, r4, #0
	mov r3, #0
	bl SetStringAsPlaceholder
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0200C490

	thumb_func_start BufferCountryName
BufferCountryName: ; 0x0200C4B0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r2, #0
	add r4, r1, #0
	ldr r2, _0200C4E4 ; =0x0000031E
	ldr r3, [r5, #4]
	mov r0, #1
	mov r1, #0x1b
	bl NewMsgDataFromNarc
	add r7, r0, #0
	beq _0200C4E2
	ldr r2, [r5, #0xc]
	add r1, r6, #0
	bl ReadMsgDataIntoString
	ldr r2, [r5, #0xc]
	add r0, r5, #0
	add r1, r4, #0
	mov r3, #0
	bl SetStringAsPlaceholder
	add r0, r7, #0
	bl DestroyMsgData
_0200C4E2:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0200C4E4: .word 0x0000031E
	thumb_func_end BufferCountryName

	thumb_func_start BufferCityName
BufferCityName: ; 0x0200C4E8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, r2, #0
	add r6, r1, #0
	add r4, r3, #0
	bl GetCityNamesMsgdataIdByCountry
	add r2, r0, #0
	beq _0200C526
	cmp r4, #0
	beq _0200C526
	ldr r3, [r5, #4]
	mov r0, #1
	mov r1, #0x1b
	bl NewMsgDataFromNarc
	add r7, r0, #0
	beq _0200C526
	ldr r2, [r5, #0xc]
	add r1, r4, #0
	bl ReadMsgDataIntoString
	ldr r2, [r5, #0xc]
	add r0, r5, #0
	add r1, r6, #0
	mov r3, #0
	bl SetStringAsPlaceholder
	add r0, r7, #0
	bl DestroyMsgData
_0200C526:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end BufferCityName

	thumb_func_start sub_0200C528
sub_0200C528: ; 0x0200C528
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	ldr r1, [r5, #0xc]
	add r0, r2, #0
	bl GetECWordIntoStringByIndex
	ldr r2, [r5, #0xc]
	add r0, r5, #0
	add r1, r4, #0
	mov r3, #0
	bl SetStringAsPlaceholder
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0200C528

	thumb_func_start BufferSealName
BufferSealName: ; 0x0200C544
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r3, [r5, #4]
	add r4, r1, #0
	add r6, r2, #0
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0xf
	bl NewMsgDataFromNarc
	add r7, r0, #0
	beq _0200C576
	ldr r2, [r5, #0xc]
	add r1, r6, #0
	bl ReadMsgDataIntoString
	ldr r2, [r5, #0xc]
	add r0, r5, #0
	add r1, r4, #0
	mov r3, #0
	bl SetStringAsPlaceholder
	add r0, r7, #0
	bl DestroyMsgData
_0200C576:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end BufferSealName

	thumb_func_start BufferSealNamePlural
BufferSealNamePlural: ; 0x0200C578
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r3, [r5, #4]
	add r4, r1, #0
	add r6, r2, #0
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0x10
	bl NewMsgDataFromNarc
	add r7, r0, #0
	beq _0200C5AA
	ldr r2, [r5, #0xc]
	add r1, r6, #0
	bl ReadMsgDataIntoString
	ldr r2, [r5, #0xc]
	add r0, r5, #0
	add r1, r4, #0
	mov r3, #0
	bl SetStringAsPlaceholder
	add r0, r7, #0
	bl DestroyMsgData
_0200C5AA:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end BufferSealNamePlural

	thumb_func_start BufferLocationName
BufferLocationName: ; 0x0200C5AC
	push {r3, r4, r5, r6, r7, lr}
	add r4, r2, #0
	add r5, r0, #0
	add r0, r4, #0
	str r1, [sp]
	bl sub_02017FAC
	add r6, r0, #0
	add r0, r4, #0
	bl sub_02017FCC
	add r4, r0, #0
	ldr r2, _0200C64C ; =_020F5C1C
	lsl r3, r6, #1
	ldrh r2, [r2, r3]
	ldr r3, [r5, #4]
	mov r0, #1
	mov r1, #0x1b
	bl NewMsgDataFromNarc
	add r7, r0, #0
	beq _0200C648
	bl MsgDataGetCount
	cmp r4, r0
	bhs _0200C606
	cmp r6, #0
	bne _0200C5E8
	cmp r4, #0
	beq _0200C606
_0200C5E8:
	ldr r2, [r5, #0xc]
	add r0, r7, #0
	add r1, r4, #0
	bl ReadMsgDataIntoString
	ldr r1, [sp]
	ldr r2, [r5, #0xc]
	add r0, r5, #0
	mov r3, #0
	bl SetStringAsPlaceholder
	add r0, r7, #0
	bl DestroyMsgData
	pop {r3, r4, r5, r6, r7, pc}
_0200C606:
	add r0, r7, #0
	bl DestroyMsgData
	cmp r6, #0
	bne _0200C61A
	cmp r4, #0
	bne _0200C61A
	ldr r2, _0200C650 ; =0x00000119
	mov r4, #0xc
	b _0200C620
_0200C61A:
	mov r2, #0x46
	lsl r2, r2, #2
	mov r4, #2
_0200C620:
	ldr r3, [r5, #4]
	mov r0, #1
	mov r1, #0x1b
	bl NewMsgDataFromNarc
	add r6, r0, #0
	beq _0200C648
	ldr r2, [r5, #0xc]
	add r1, r4, #0
	bl ReadMsgDataIntoString
	ldr r1, [sp]
	ldr r2, [r5, #0xc]
	add r0, r5, #0
	mov r3, #0
	bl SetStringAsPlaceholder
	add r0, r6, #0
	bl DestroyMsgData
_0200C648:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0200C64C: .word _020F5C1C
_0200C650: .word 0x00000119
	thumb_func_end BufferLocationName

	thumb_func_start BufferFashionName
BufferFashionName: ; 0x0200C654
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r3, [r5, #4]
	add r4, r1, #0
	add r6, r2, #0
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0xd8
	bl NewMsgDataFromNarc
	add r7, r0, #0
	beq _0200C686
	ldr r2, [r5, #0xc]
	add r1, r6, #0
	bl ReadMsgDataIntoString
	ldr r2, [r5, #0xc]
	add r0, r5, #0
	add r1, r4, #0
	mov r3, #0
	bl SetStringAsPlaceholder
	add r0, r7, #0
	bl DestroyMsgData
_0200C686:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end BufferFashionName

	thumb_func_start BufferFashionNameWithArticle
BufferFashionNameWithArticle: ; 0x0200C688
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r3, [r5, #4]
	add r4, r1, #0
	add r6, r2, #0
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0xd9
	bl NewMsgDataFromNarc
	add r7, r0, #0
	beq _0200C6BA
	ldr r2, [r5, #0xc]
	add r1, r6, #0
	bl ReadMsgDataIntoString
	ldr r2, [r5, #0xc]
	add r0, r5, #0
	add r1, r4, #0
	mov r3, #0
	bl SetStringAsPlaceholder
	add r0, r7, #0
	bl DestroyMsgData
_0200C6BA:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end BufferFashionNameWithArticle

	thumb_func_start BufferContestBackgroundName
BufferContestBackgroundName: ; 0x0200C6BC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r3, [r5, #4]
	add r4, r1, #0
	add r6, r2, #0
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0xda
	bl NewMsgDataFromNarc
	add r7, r0, #0
	beq _0200C6EE
	ldr r2, [r5, #0xc]
	add r1, r6, #0
	bl ReadMsgDataIntoString
	ldr r2, [r5, #0xc]
	add r0, r5, #0
	add r1, r4, #0
	mov r3, #0
	bl SetStringAsPlaceholder
	add r0, r7, #0
	bl DestroyMsgData
_0200C6EE:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end BufferContestBackgroundName

	thumb_func_start BufferEasyChatWord
BufferEasyChatWord: ; 0x0200C6F0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	str r0, [sp, #8]
	add r5, r2, #0
	add r0, r1, #0
	str r3, [sp, #0xc]
	bl sub_0202C854
	add r6, r0, #0
	add r1, r5, #0
	bl sub_0202C830
	str r0, [sp, #0x10]
	add r0, r6, #0
	add r1, r5, #0
	bl sub_0202C83C
	add r7, r0, #0
	mov r0, #0x40
	mov r1, #4
	bl String_ctor
	add r4, r0, #0
	ldr r2, [sp, #0x28]
	add r0, r6, #0
	add r1, r5, #0
	bl sub_0202C7E0
	add r1, r0, #0
	add r0, r4, #0
	bl CopyU16ArrayToString
	mov r0, #1
	str r0, [sp]
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	ldr r3, [sp, #0x10]
	add r2, r4, #0
	str r7, [sp, #4]
	bl BufferString
	add r0, r4, #0
	bl String_dtor
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end BufferEasyChatWord

	thumb_func_start sub_0200C74C
sub_0200C74C: ; 0x0200C74C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r2, #0
	add r4, r1, #0
	ldr r2, _0200C780 ; =0x000002F3
	ldr r3, [r5, #4]
	mov r0, #1
	mov r1, #0x1b
	bl NewMsgDataFromNarc
	add r7, r0, #0
	beq _0200C77E
	ldr r2, [r5, #0xc]
	add r1, r6, #0
	bl ReadMsgDataIntoString
	ldr r2, [r5, #0xc]
	add r0, r5, #0
	add r1, r4, #0
	mov r3, #0
	bl SetStringAsPlaceholder
	add r0, r7, #0
	bl DestroyMsgData
_0200C77E:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0200C780: .word 0x000002F3
	thumb_func_end sub_0200C74C

	thumb_func_start sub_0200C784
sub_0200C784: ; 0x0200C784
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r2, #0
	add r4, r1, #0
	ldr r2, _0200C7B8 ; =0x000002F1
	ldr r3, [r5, #4]
	mov r0, #1
	mov r1, #0x1b
	bl NewMsgDataFromNarc
	add r7, r0, #0
	beq _0200C7B6
	ldr r2, [r5, #0xc]
	add r1, r6, #0
	bl ReadMsgDataIntoString
	ldr r2, [r5, #0xc]
	add r0, r5, #0
	add r1, r4, #0
	mov r3, #0
	bl SetStringAsPlaceholder
	add r0, r7, #0
	bl DestroyMsgData
_0200C7B6:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0200C7B8: .word 0x000002F1
	thumb_func_end sub_0200C784

	thumb_func_start sub_0200C7BC
sub_0200C7BC: ; 0x0200C7BC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r2, #0
	mov r2, #0xbd
	add r4, r1, #0
	ldr r3, [r5, #4]
	mov r0, #1
	mov r1, #0x1b
	lsl r2, r2, #2
	bl NewMsgDataFromNarc
	add r7, r0, #0
	beq _0200C7F0
	ldr r2, [r5, #0xc]
	add r1, r6, #0
	bl ReadMsgDataIntoString
	ldr r2, [r5, #0xc]
	add r0, r5, #0
	add r1, r4, #0
	mov r3, #0
	bl SetStringAsPlaceholder
	add r0, r7, #0
	bl DestroyMsgData
_0200C7F0:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0200C7BC

	thumb_func_start sub_0200C7F4
sub_0200C7F4: ; 0x0200C7F4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r2, #0
	add r4, r1, #0
	ldr r2, _0200C828 ; =0x00000303
	ldr r3, [r5, #4]
	mov r0, #1
	mov r1, #0x1b
	bl NewMsgDataFromNarc
	add r7, r0, #0
	beq _0200C826
	ldr r2, [r5, #0xc]
	add r1, r6, #0
	bl ReadMsgDataIntoString
	ldr r2, [r5, #0xc]
	add r0, r5, #0
	add r1, r4, #0
	mov r3, #0
	bl SetStringAsPlaceholder
	add r0, r7, #0
	bl DestroyMsgData
_0200C826:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0200C828: .word 0x00000303
	thumb_func_end sub_0200C7F4

	thumb_func_start sub_0200C82C
sub_0200C82C: ; 0x0200C82C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r2, #0
	add r4, r1, #0
	ldr r2, _0200C860 ; =0x000002FF
	ldr r3, [r5, #4]
	mov r0, #1
	mov r1, #0x1b
	bl NewMsgDataFromNarc
	add r7, r0, #0
	beq _0200C85E
	ldr r2, [r5, #0xc]
	add r1, r6, #0
	bl ReadMsgDataIntoString
	ldr r2, [r5, #0xc]
	add r0, r5, #0
	add r1, r4, #0
	mov r3, #0
	bl SetStringAsPlaceholder
	add r0, r7, #0
	bl DestroyMsgData
_0200C85E:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0200C860: .word 0x000002FF
	thumb_func_end sub_0200C82C

	thumb_func_start sub_0200C864
sub_0200C864: ; 0x0200C864
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r2, #0
	mov r2, #3
	add r4, r1, #0
	ldr r3, [r5, #4]
	mov r0, #1
	mov r1, #0x1b
	lsl r2, r2, #8
	bl NewMsgDataFromNarc
	add r7, r0, #0
	beq _0200C898
	ldr r2, [r5, #0xc]
	add r1, r6, #0
	bl ReadMsgDataIntoString
	ldr r2, [r5, #0xc]
	add r0, r5, #0
	add r1, r4, #0
	mov r3, #0
	bl SetStringAsPlaceholder
	add r0, r7, #0
	bl DestroyMsgData
_0200C898:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0200C864

	thumb_func_start sub_0200C89C
sub_0200C89C: ; 0x0200C89C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r2, #0
	add r4, r1, #0
	ldr r2, _0200C8D0 ; =0x00000302
	ldr r3, [r5, #4]
	mov r0, #1
	mov r1, #0x1b
	bl NewMsgDataFromNarc
	add r7, r0, #0
	beq _0200C8CE
	ldr r2, [r5, #0xc]
	add r1, r6, #0
	bl ReadMsgDataIntoString
	ldr r2, [r5, #0xc]
	add r0, r5, #0
	add r1, r4, #0
	mov r3, #0
	bl SetStringAsPlaceholder
	add r0, r7, #0
	bl DestroyMsgData
_0200C8CE:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0200C8D0: .word 0x00000302
	thumb_func_end sub_0200C89C

	thumb_func_start sub_0200C8D4
sub_0200C8D4: ; 0x0200C8D4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r2, #0
	add r4, r1, #0
	ldr r2, _0200C908 ; =0x00000301
	ldr r3, [r5, #4]
	mov r0, #1
	mov r1, #0x1b
	bl NewMsgDataFromNarc
	add r7, r0, #0
	beq _0200C906
	ldr r2, [r5, #0xc]
	add r1, r6, #0
	bl ReadMsgDataIntoString
	ldr r2, [r5, #0xc]
	add r0, r5, #0
	add r1, r4, #0
	mov r3, #0
	bl SetStringAsPlaceholder
	add r0, r7, #0
	bl DestroyMsgData
_0200C906:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0200C908: .word 0x00000301
	thumb_func_end sub_0200C8D4

	thumb_func_start sub_0200C90C
sub_0200C90C: ; 0x0200C90C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r2, #0
	mov r2, #0xc1
	add r4, r1, #0
	ldr r3, [r5, #4]
	mov r0, #1
	mov r1, #0x1b
	lsl r2, r2, #2
	bl NewMsgDataFromNarc
	add r7, r0, #0
	beq _0200C940
	ldr r2, [r5, #0xc]
	add r1, r6, #0
	bl ReadMsgDataIntoString
	ldr r2, [r5, #0xc]
	add r0, r5, #0
	add r1, r4, #0
	mov r3, #0
	bl SetStringAsPlaceholder
	add r0, r7, #0
	bl DestroyMsgData
_0200C940:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0200C90C

	thumb_func_start sub_0200C944
sub_0200C944: ; 0x0200C944
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r2, #0
	add r7, r1, #0
	ldr r2, _0200C980 ; =0x00000139
	ldr r3, [r5, #4]
	mov r0, #1
	mov r1, #0x1b
	bl NewMsgDataFromNarc
	add r6, r0, #0
	cmp r4, #0xb
	blo _0200C962
	bl GF_AssertFail
_0200C962:
	ldr r2, [r5, #0xc]
	add r0, r6, #0
	add r1, r4, #0
	bl ReadMsgDataIntoString
	ldr r2, [r5, #0xc]
	add r0, r5, #0
	add r1, r7, #0
	mov r3, #0
	bl SetStringAsPlaceholder
	add r0, r6, #0
	bl DestroyMsgData
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0200C980: .word 0x00000139
	thumb_func_end sub_0200C944

	thumb_func_start sub_0200C984
sub_0200C984: ; 0x0200C984
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r2, #0
	add r7, r1, #0
	ldr r2, _0200C9C4 ; =0x00000139
	ldr r3, [r5, #4]
	mov r0, #1
	mov r1, #0x1b
	bl NewMsgDataFromNarc
	add r6, r0, #0
	cmp r4, #5
	blo _0200C9A2
	bl GF_AssertFail
_0200C9A2:
	add r4, #0xf
	ldr r2, [r5, #0xc]
	add r0, r6, #0
	add r1, r4, #0
	bl ReadMsgDataIntoString
	ldr r2, [r5, #0xc]
	add r0, r5, #0
	add r1, r7, #0
	mov r3, #0
	bl SetStringAsPlaceholder
	add r0, r6, #0
	bl DestroyMsgData
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0200C9C4: .word 0x00000139
	thumb_func_end sub_0200C984

	thumb_func_start sub_0200C9C8
sub_0200C9C8: ; 0x0200C9C8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r2, #0
	add r7, r1, #0
	ldr r2, _0200CA08 ; =0x00000139
	ldr r3, [r5, #4]
	mov r0, #1
	mov r1, #0x1b
	bl NewMsgDataFromNarc
	add r6, r0, #0
	cmp r4, #0xa
	blo _0200C9E6
	bl GF_AssertFail
_0200C9E6:
	add r4, #0x14
	ldr r2, [r5, #0xc]
	add r0, r6, #0
	add r1, r4, #0
	bl ReadMsgDataIntoString
	ldr r2, [r5, #0xc]
	add r0, r5, #0
	add r1, r7, #0
	mov r3, #0
	bl SetStringAsPlaceholder
	add r0, r6, #0
	bl DestroyMsgData
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0200CA08: .word 0x00000139
	thumb_func_end sub_0200C9C8

	thumb_func_start sub_0200CA0C
sub_0200CA0C: ; 0x0200CA0C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r3, [r5, #4]
	add r7, r1, #0
	add r4, r2, #0
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0x15
	bl NewMsgDataFromNarc
	add r6, r0, #0
	cmp r4, #7
	blo _0200CA2E
	blo _0200CA2C
	bl GF_AssertFail
_0200CA2C:
	mov r4, #0
_0200CA2E:
	ldr r2, [r5, #0xc]
	add r0, r6, #0
	add r1, r4, #7
	bl ReadMsgDataIntoString
	ldr r2, [r5, #0xc]
	add r0, r5, #0
	add r1, r7, #0
	mov r3, #0
	bl SetStringAsPlaceholder
	add r0, r6, #0
	bl DestroyMsgData
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0200CA0C

	thumb_func_start sub_0200CA4C
sub_0200CA4C: ; 0x0200CA4C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r2, #0
	add r7, r1, #0
	ldr r2, _0200CA90 ; =0x000001AE
	ldr r3, [r5, #4]
	mov r0, #1
	mov r1, #0x1b
	bl NewMsgDataFromNarc
	add r6, r0, #0
	cmp r4, #0x18
	blo _0200CA6E
	blo _0200CA6C
	bl GF_AssertFail
_0200CA6C:
	mov r4, #0
_0200CA6E:
	add r4, #0xe
	ldr r2, [r5, #0xc]
	add r0, r6, #0
	add r1, r4, #0
	bl ReadMsgDataIntoString
	ldr r2, [r5, #0xc]
	add r0, r5, #0
	add r1, r7, #0
	mov r3, #0
	bl SetStringAsPlaceholder
	add r0, r6, #0
	bl DestroyMsgData
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0200CA90: .word 0x000001AE
	thumb_func_end sub_0200CA4C

	thumb_func_start BufferSafariZoneAreaName
BufferSafariZoneAreaName: ; 0x0200CA94
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r2, #0
	mov r2, #0x6b
	add r7, r1, #0
	ldr r3, [r5, #4]
	mov r0, #1
	mov r1, #0x1b
	lsl r2, r2, #2
	bl NewMsgDataFromNarc
	add r6, r0, #0
	cmp r4, #0xc
	blo _0200CAB8
	blo _0200CAB6
	bl GF_AssertFail
_0200CAB6:
	mov r4, #0
_0200CAB8:
	ldr r2, [r5, #0xc]
	add r0, r6, #0
	add r1, r4, #0
	bl ReadMsgDataIntoString
	ldr r2, [r5, #0xc]
	add r0, r5, #0
	add r1, r7, #0
	mov r3, #0
	bl SetStringAsPlaceholder
	add r0, r6, #0
	bl DestroyMsgData
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end BufferSafariZoneAreaName

	thumb_func_start BufferPokewalkerMessage
BufferPokewalkerMessage: ; 0x0200CAD8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r7, r1, #0
	mov r1, #0x1b
	add r4, r2, #0
	add r2, r1, #0
	ldr r3, [r5, #4]
	mov r0, #1
	add r2, #0xf7
	bl NewMsgDataFromNarc
	add r6, r0, #0
	cmp r4, #0x1b
	blo _0200CAFC
	blo _0200CAFA
	bl GF_AssertFail
_0200CAFA:
	mov r4, #0
_0200CAFC:
	add r4, #0x5b
	ldr r2, [r5, #0xc]
	add r0, r6, #0
	add r1, r4, #0
	bl ReadMsgDataIntoString
	ldr r2, [r5, #0xc]
	add r0, r5, #0
	add r1, r7, #0
	mov r3, #0
	bl SetStringAsPlaceholder
	add r0, r6, #0
	bl DestroyMsgData
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end BufferPokewalkerMessage

	thumb_func_start BufferMonthNameAbbr
BufferMonthNameAbbr: ; 0x0200CB1C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r3, [r5, #4]
	add r7, r1, #0
	add r4, r2, #0
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0xef
	bl NewMsgDataFromNarc
	add r6, r0, #0
	beq _0200CB5A
	cmp r4, #1
	blo _0200CB3C
	cmp r4, #0xc
	bls _0200CB3E
_0200CB3C:
	mov r4, #1
_0200CB3E:
	ldr r2, [r5, #0xc]
	add r0, r6, #0
	sub r1, r4, #1
	bl ReadMsgDataIntoString
	ldr r2, [r5, #0xc]
	add r0, r5, #0
	add r1, r7, #0
	mov r3, #0
	bl SetStringAsPlaceholder
	add r0, r6, #0
	bl DestroyMsgData
_0200CB5A:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end BufferMonthNameAbbr

	thumb_func_start ScrStrBufs_UpperFirstChar
ScrStrBufs_UpperFirstChar: ; 0x0200CB5C
	ldr r2, [r0, #8]
	lsl r0, r1, #3
	add r0, r2, r0
	ldr r3, _0200CB6C ; =StrUpperFirstChar
	ldr r0, [r0, #4]
	mov r1, #0
	bx r3
	nop
_0200CB6C: .word StrUpperFirstChar
	thumb_func_end ScrStrBufs_UpperFirstChar

	thumb_func_start sub_0200CB70
sub_0200CB70: ; 0x0200CB70
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r3, [r5, #4]
	add r7, r1, #0
	add r4, r2, #0
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0xbf
	bl NewMsgDataFromNarc
	add r6, r0, #0
	cmp r4, #6
	bls _0200CB8E
	bl GF_AssertFail
_0200CB8E:
	cmp r6, #0
	beq _0200CBB8
	cmp r4, #0
	bne _0200CB9A
	mov r4, #0x7a
	b _0200CB9C
_0200CB9A:
	add r4, #0x73
_0200CB9C:
	ldr r2, [r5, #0xc]
	add r0, r6, #0
	add r1, r4, #0
	bl ReadMsgDataIntoString
	ldr r2, [r5, #0xc]
	add r0, r5, #0
	add r1, r7, #0
	mov r3, #0
	bl SetStringAsPlaceholder
	add r0, r6, #0
	bl DestroyMsgData
_0200CBB8:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0200CB70

	thumb_func_start StringExpandPlaceholders
StringExpandPlaceholders: ; 0x0200CBBC
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r6, r1, #0
	add r0, r2, #0
	bl String_c_str
	add r5, r0, #0
	add r0, r6, #0
	bl StringSetEmpty
	ldrh r1, [r5]
	ldr r0, _0200CC48 ; =0x0000FFFF
	cmp r1, r0
	beq _0200CC44
_0200CBD8:
	ldr r0, _0200CC4C ; =0x0000FFFE
	cmp r1, r0
	bne _0200CC32
	add r0, r5, #0
	bl MsgArray_ControlCodeIsStrVar
	cmp r0, #0
	beq _0200CC14
	add r0, r5, #0
	mov r1, #0
	bl MsgArray_ControlCodeGetField
	add r4, r0, #0
	ldr r0, [r7]
	cmp r4, r0
	blo _0200CBFC
	bl GF_AssertFail
_0200CBFC:
	ldr r2, [r7, #8]
	lsl r1, r4, #3
	add r1, r2, r1
	ldr r1, [r1, #4]
	add r0, r6, #0
	bl StringCat_HandleTrainerName
	add r0, r5, #0
	bl MsgArray_SkipControlCode
	add r5, r0, #0
	b _0200CC3C
_0200CC14:
	add r0, r5, #0
	add r4, r5, #0
	bl MsgArray_SkipControlCode
	add r5, r0, #0
	cmp r4, r5
	bhs _0200CC3C
_0200CC22:
	ldrh r1, [r4]
	add r0, r6, #0
	add r4, r4, #2
	bl StrAddChar
	cmp r4, r5
	blo _0200CC22
	b _0200CC3C
_0200CC32:
	ldrh r1, [r5]
	add r0, r6, #0
	add r5, r5, #2
	bl StrAddChar
_0200CC3C:
	ldrh r1, [r5]
	ldr r0, _0200CC48 ; =0x0000FFFF
	cmp r1, r0
	bne _0200CBD8
_0200CC44:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0200CC48: .word 0x0000FFFF
_0200CC4C: .word 0x0000FFFE
	thumb_func_end StringExpandPlaceholders

	thumb_func_start ScrStrBufs_ResetBuffers
ScrStrBufs_ResetBuffers: ; 0x0200CC50
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5]
	mov r6, #0
	cmp r0, #0
	bls _0200CC72
	add r4, r6, #0
_0200CC5E:
	ldr r0, [r5, #8]
	add r0, r0, r4
	ldr r0, [r0, #4]
	bl StringSetEmpty
	ldr r0, [r5]
	add r6, r6, #1
	add r4, #8
	cmp r6, r0
	blo _0200CC5E
_0200CC72:
	pop {r4, r5, r6, pc}
	thumb_func_end ScrStrBufs_ResetBuffers

	thumb_func_start MessagePrinter_new
MessagePrinter_new: ; 0x0200CC74
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	add r4, r3, #0
	add r5, r0, #0
	add r6, r1, #0
	add r0, r4, #0
	mov r1, #0x2c
	str r2, [sp, #4]
	bl AllocFromHeap
	str r0, [sp, #8]
	cmp r0, #0
	beq _0200CD8E
	ldr r3, [sp, #8]
	mov r0, #0x10
	mov r1, #5
	mov r2, #1
	add r3, r3, #4
	str r4, [sp]
	bl GfGfxLoader_GetCharData
	ldr r1, [sp, #8]
	mov r3, #0
	str r0, [r1]
	add r0, r1, #0
	ldr r0, [r0, #4]
	ldr r4, [r0, #0x14]
	ldr r0, [r0, #0x10]
	cmp r0, #0
	bls _0200CD88
	ldr r0, [sp, #4]
	ldr r1, [sp, #4]
	lsl r0, r0, #4
	orr r1, r0
	str r1, [sp, #0xc]
	add r1, r0, #0
	orr r1, r5
	str r1, [sp, #0x10]
	orr r0, r6
	str r0, [sp, #0x14]
	ldr r1, [sp, #4]
	lsl r0, r5, #4
	orr r1, r0
	str r1, [sp, #0x18]
	add r1, r5, #0
	orr r1, r0
	str r1, [sp, #0x1c]
	orr r0, r6
	lsl r2, r6, #4
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #4]
	add r7, r2, #0
	orr r7, r1
	add r1, r2, #0
	orr r1, r5
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	orr r2, r6
	str r1, [sp, #0x28]
	lsl r1, r7, #0x18
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
	ldr r0, [sp, #0x18]
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	lsr r1, r1, #0x18
	lsl r0, r0, #0x18
	mov ip, r2
	str r1, [sp, #0x24]
	lsr r6, r0, #0x18
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0xc]
	lsl r0, r0, #0x18
	lsl r1, r1, #0x18
	lsl r2, r2, #0x18
	lsr r0, r0, #0x18
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
_0200CD18:
	ldrb r5, [r4, r3]
	cmp r5, #0x12
	bgt _0200CD40
	bge _0200CD66
	cmp r5, #0x10
	bgt _0200CD3A
	bge _0200CD5E
	cmp r5, #2
	bgt _0200CD7C
	cmp r5, #0
	blt _0200CD7C
	beq _0200CD52
	cmp r5, #1
	beq _0200CD56
	cmp r5, #2
	beq _0200CD5A
	b _0200CD7C
_0200CD3A:
	cmp r5, #0x11
	beq _0200CD62
	b _0200CD7C
_0200CD40:
	cmp r5, #0x21
	bgt _0200CD4C
	bge _0200CD72
	cmp r5, #0x20
	beq _0200CD6C
	b _0200CD7C
_0200CD4C:
	cmp r5, #0x22
	beq _0200CD78
	b _0200CD7C
_0200CD52:
	strb r2, [r4, r3]
	b _0200CD7C
_0200CD56:
	strb r1, [r4, r3]
	b _0200CD7C
_0200CD5A:
	strb r0, [r4, r3]
	b _0200CD7C
_0200CD5E:
	strb r6, [r4, r3]
	b _0200CD7C
_0200CD62:
	strb r7, [r4, r3]
	b _0200CD7C
_0200CD66:
	ldr r5, [sp, #0x20]
	strb r5, [r4, r3]
	b _0200CD7C
_0200CD6C:
	ldr r5, [sp, #0x24]
	strb r5, [r4, r3]
	b _0200CD7C
_0200CD72:
	ldr r5, [sp, #0x28]
	strb r5, [r4, r3]
	b _0200CD7C
_0200CD78:
	mov r5, ip
	strb r5, [r4, r3]
_0200CD7C:
	ldr r5, [sp, #8]
	add r3, r3, #1
	ldr r5, [r5, #4]
	ldr r5, [r5, #0x10]
	cmp r3, r5
	blo _0200CD18
_0200CD88:
	ldr r1, [sp, #4]
	ldr r0, [sp, #8]
	str r1, [r0, #0x28]
_0200CD8E:
	ldr r0, [sp, #8]
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end MessagePrinter_new

	thumb_func_start MessagePrinter_delete
MessagePrinter_delete: ; 0x0200CD94
	push {r4, lr}
	add r4, r0, #0
	beq _0200CDAA
	ldr r0, [r4]
	cmp r0, #0
	beq _0200CDA4
	bl FreeToHeap
_0200CDA4:
	add r0, r4, #0
	bl FreeToHeap
_0200CDAA:
	pop {r4, pc}
	thumb_func_end MessagePrinter_delete

	thumb_func_start sub_0200CDAC
sub_0200CDAC: ; 0x0200CDAC
	push {r3, r4, r5, lr}
	sub sp, #0x18
	add r4, r0, #0
	ldr r0, _0200CDE8 ; =_020F5C26
	lsl r5, r1, #2
	ldrh r1, [r0, r5]
	lsl r3, r3, #0x10
	mov r0, #8
	str r1, [sp]
	str r0, [sp, #4]
	lsr r3, r3, #0x10
	str r3, [sp, #8]
	ldr r3, [sp, #0x28]
	lsl r3, r3, #0x10
	lsr r3, r3, #0x10
	str r3, [sp, #0xc]
	str r1, [sp, #0x10]
	str r0, [sp, #0x14]
	ldr r1, [r4, #4]
	add r0, r2, #0
	ldr r2, [r1, #0x14]
	ldr r1, _0200CDEC ; =_020F5C24
	ldrh r1, [r1, r5]
	add r1, r2, r1
	mov r2, #0
	add r3, r2, #0
	bl BlitBitmapRectToWindow
	add sp, #0x18
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0200CDE8: .word _020F5C26
_0200CDEC: .word _020F5C24
	thumb_func_end sub_0200CDAC

	thumb_func_start sub_0200CDF0
sub_0200CDF0: ; 0x0200CDF0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r6, r0, #0
	ldr r0, [sp, #0x30]
	add r4, r2, #0
	str r0, [sp, #0x30]
	add r0, r6, #0
	add r2, r3, #0
	add r0, #8
	add r3, r4, #0
	ldr r5, [sp, #0x34]
	ldr r7, [sp, #0x38]
	bl ConvertUIntToDecimalString
	ldrh r1, [r6, #8]
	ldr r0, _0200CE78 ; =0x0000FFFF
	cmp r1, r0
	beq _0200CE72
	lsl r0, r7, #0x10
	add r4, r6, #0
	lsr r7, r0, #0x10
_0200CE1A:
	ldrh r2, [r4, #8]
	cmp r2, #0xa2
	blo _0200CE4E
	cmp r2, #0xab
	bhi _0200CE4E
	mov r0, #8
	str r0, [sp]
	str r0, [sp, #4]
	lsl r0, r5, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #8]
	str r7, [sp, #0xc]
	mov r0, #8
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	ldr r1, [r6, #4]
	sub r2, #0xa2
	ldr r1, [r1, #0x14]
	lsl r2, r2, #5
	add r1, r1, r2
	mov r2, #0
	ldr r0, [sp, #0x30]
	add r3, r2, #0
	bl BlitBitmapRectToWindow
	b _0200CE66
_0200CE4E:
	mov r0, #8
	str r0, [sp]
	str r0, [sp, #4]
	ldr r1, [r6, #0x28]
	lsl r2, r5, #0x10
	lsl r1, r1, #0x18
	ldr r0, [sp, #0x30]
	lsr r1, r1, #0x18
	lsr r2, r2, #0x10
	add r3, r7, #0
	bl FillWindowPixelRect
_0200CE66:
	add r4, r4, #2
	ldrh r1, [r4, #8]
	ldr r0, _0200CE78 ; =0x0000FFFF
	add r5, #8
	cmp r1, r0
	bne _0200CE1A
_0200CE72:
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0200CE78: .word 0x0000FFFF
	thumb_func_end sub_0200CDF0
