#include "config.h"
	.include "asm/macros.inc"
	.include "unk_02068FC8.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_02068FC8
sub_02068FC8: ; 0x02068FC8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xa4
	str r0, [sp, #0x10]
	ldr r6, [sp, #0xb8]
	str r1, [sp, #0x14]
	str r2, [sp, #0x18]
	add r0, r6, #0
	str r3, [sp, #0x1c]
	ldr r5, [sp, #0xbc]
	bl FieldSystem_GetSaveData
	str r0, [sp, #0x20]
	bl Save_PlayerData_GetProfileAddr
	add r7, r0, #0
	ldr r0, [sp, #0x20]
	bl Save_GameStats_Get
	add r4, r0, #0
	ldr r2, _020691A0 ; =0x0000066C
	add r0, r5, #0
	mov r1, #0
	bl memset
	ldr r0, [sp, #0x1c]
	strb r0, [r5, #5]
	add r0, r6, #0
	bl sub_020691E8
	str r0, [sp, #0x24]
	add r0, r7, #0
	bl PlayerProfile_GetLanguage
	str r0, [sp]
	str r5, [sp, #4]
	ldr r0, [sp, #0x10]
	ldr r2, [sp, #0x24]
	ldr r3, [sp, #0x18]
	mov r1, #GAME_VERSION
	bl sub_020692A0
	add r0, r7, #0
	bl PlayerProfile_GetTrainerID_VisibleHalf
	str r0, [sp, #0x28]
	add r0, r7, #0
	bl PlayerProfile_GetTrainerGender
	str r0, [sp, #0x2c]
	add r0, r7, #0
	bl PlayerProfile_GetNamePtr
	str r0, [sp, #0x30]
	add r0, r7, #0
	bl PlayerProfile_GetMoney
	str r0, [sp, #0x34]
	ldr r0, [r6, #0xc]
	bl Save_Pokedex_Get
	bl Pokedex_CountDexOwned
	str r0, [sp, #0x38]
	ldr r0, [r6, #0xc]
	bl Save_Pokedex_Get
	bl Pokedex_IsEnabled
	str r0, [sp, #0x3c]
	add r0, r4, #0
	bl GameStats_GetStat2
	ldr r1, [sp, #0x38]
	ldr r2, [sp, #0x30]
	str r1, [sp]
	ldr r1, [sp, #0x3c]
	ldr r3, [sp, #0x34]
	str r1, [sp, #4]
	str r0, [sp, #8]
	ldr r1, [sp, #0x2c]
	ldr r0, [sp, #0x28]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	str r5, [sp, #0xc]
	bl sub_020692C4
	ldr r0, [sp, #0x20]
	bl Save_PlayerData_GetIGTAddr
	str r0, [sp, #0x40]
	add r0, r6, #0
	add r1, sp, #0x94
	add r2, sp, #0x78
	bl sub_02055624
	add r0, r6, #0
	add r1, sp, #0x84
	add r2, sp, #0x78
	bl FieldSystem_GetGameClearTime
	ldr r0, [r6, #0xc]
	bl Save_VarsFlags_Get
	bl CheckGameClearFlag
	add r1, sp, #0x78
	str r1, [sp]
	ldr r1, [sp, #0x14]
	lsl r0, r0, #0x18
	str r1, [sp, #4]
	ldr r1, [sp, #0x40]
	str r5, [sp, #8]
	lsr r0, r0, #0x18
	add r2, sp, #0x94
	add r3, sp, #0x84
	bl sub_02069308
	ldr r0, [r6, #0xc]
	bl Save_TrainerCard_Get
	str r0, [sp, #0x44]
	add r0, r4, #0
	mov r1, #0x21
	bl GameStats_GetCapped
	str r0, [sp, #0x48]
	add r0, r4, #0
	mov r1, #0x1a
	bl GameStats_GetCapped
	str r0, [sp, #0x4c]
	add r0, r4, #0
	mov r1, #0x15
	bl GameStats_GetCapped
	str r0, [sp, #0x50]
	add r0, r4, #0
	mov r1, #0x19
	bl GameStats_GetCapped
	str r0, [sp, #0x54]
	add r0, r4, #0
	mov r1, #0x5c
	bl GameStats_GetCapped
	str r0, [sp, #0x58]
	add r0, r4, #0
	mov r1, #0x14
	bl GameStats_GetCapped
	ldr r1, [sp, #0x58]
	add r1, r1, r0
	ldr r0, [sp, #0x54]
	add r1, r0, r1
	ldr r0, [sp, #0x50]
	add r1, r0, r1
	ldr r0, [sp, #0x4c]
	add r0, r0, r1
	str r0, [sp, #0x5c]
	add r0, r4, #0
	mov r1, #0x16
	bl GameStats_GetCapped
	str r0, [sp, #0x60]
	add r0, r4, #0
	mov r1, #0x1b
	bl GameStats_GetCapped
	str r0, [sp, #0x64]
	add r0, r4, #0
	mov r1, #0x17
	bl GameStats_GetCapped
	str r0, [sp, #0x68]
	add r0, r4, #0
	mov r1, #0x1c
	bl GameStats_GetCapped
	str r0, [sp, #0x6c]
	add r0, r4, #0
	mov r1, #0x14
	bl GameStats_GetCapped
	str r0, [sp, #0x70]
	add r0, r4, #0
	mov r1, #0x19
	bl GameStats_GetCapped
	add r4, r0, #0
	ldr r0, [sp, #0x44]
	bl TrainerCard_SignatureExists
	str r0, [sp, #0x74]
	ldr r0, [sp, #0x44]
	bl TrainerCard_GetSignature
	ldr r1, [sp, #0x74]
	ldr r2, [sp, #0x60]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	str r1, [sp]
	str r0, [sp, #4]
	ldr r1, [sp, #0x48]
	ldr r0, [sp, #0x5c]
	ldr r3, [sp, #0x68]
	add r0, r1, r0
	ldr r1, [sp, #0x64]
	str r5, [sp, #8]
	add r1, r2, r1
	ldr r2, [sp, #0x6c]
	add r2, r3, r2
	ldr r3, [sp, #0x70]
	add r3, r3, r4
	bl sub_020693AC
	add r0, r7, #0
	add r1, r6, #0
	add r2, r5, #0
	bl sub_0206940C
	mov r3, #0
	ldr r0, _020691A0 ; =0x0000066C
	add r2, r3, #0
_02069186:
	ldrb r1, [r5, r2]
	add r2, r2, #1
	eor r3, r1
	cmp r2, r0
	blo _02069186
	ldr r0, _020691A4 ; =0x00000668
	mov r1, #0
	strh r3, [r5, r0]
	add r0, r0, #2
	strh r1, [r5, r0]
	add sp, #0xa4
	pop {r4, r5, r6, r7, pc}
	nop
_020691A0: .word 0x0000066C
_020691A4: .word 0x00000668
	thumb_func_end sub_02068FC8

	thumb_func_start sub_020691A8
sub_020691A8: ; 0x020691A8
	push {r4, lr}
	ldr r1, _020691C0 ; =0x0000066C
	bl AllocFromHeap
	ldr r2, _020691C0 ; =0x0000066C
	mov r1, #0
	add r4, r0, #0
	bl memset
	add r0, r4, #0
	pop {r4, pc}
	nop
_020691C0: .word 0x0000066C
	thumb_func_end sub_020691A8

	thumb_func_start sub_020691C4
sub_020691C4: ; 0x020691C4
	push {r4, lr}
	ldr r1, _020691DC ; =0x0000067C
	bl AllocFromHeap
	ldr r2, _020691DC ; =0x0000067C
	mov r1, #0
	add r4, r0, #0
	bl memset
	add r0, r4, #0
	pop {r4, pc}
	nop
_020691DC: .word 0x0000067C
	thumb_func_end sub_020691C4

	thumb_func_start sub_020691E0
sub_020691E0: ; 0x020691E0
	ldr r3, _020691E4 ; =FreeToHeap
	bx r3
	.balign 4, 0
_020691E4: .word FreeToHeap
	thumb_func_end sub_020691E0

	thumb_func_start sub_020691E8
sub_020691E8: ; 0x020691E8
	push {r3, r4, r5, r6, r7, lr}
	bl FieldSystem_GetSaveData
	add r7, r0, #0
	bl Save_GameStats_Get
	add r0, r7, #0
	bl Save_VarsFlags_Get
	add r6, r0, #0
	add r0, r7, #0
	bl sub_0203107C
	add r5, r0, #0
	add r0, r6, #0
	mov r4, #0
	bl CheckGameClearFlag
	cmp r0, #0
	beq _02069216
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
_02069216:
	add r0, r7, #0
	bl Save_Pokedex_Get
	bl Pokedex_NationalDexIsComplete
	cmp r0, #0
	beq _0206922A
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
_0206922A:
	add r0, r5, #0
	mov r1, #0
	mov r2, #0xff
	bl sub_020310BC
	cmp r0, #0x64
	bhs _02069270
	add r0, r5, #0
	mov r1, #2
	mov r2, #0xff
	bl sub_020310BC
	cmp r0, #0x64
	bhs _02069270
	add r0, r5, #0
	mov r1, #4
	mov r2, #0xff
	bl sub_020310BC
	cmp r0, #0x64
	bhs _02069270
	add r0, r5, #0
	mov r1, #6
	mov r2, #0xff
	bl sub_020310BC
	cmp r0, #0x64
	bhs _02069270
	add r0, r5, #0
	mov r1, #8
	mov r2, #0xff
	bl sub_020310BC
	cmp r0, #0x64
	blo _02069276
_02069270:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
_02069276:
	add r0, r6, #0
	mov r1, #0xf1
	bl CheckFlagInArray
	cmp r0, #0
	beq _02069288
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
_02069288:
	mov r1, #0x61
	add r0, r6, #0
	lsl r1, r1, #2
	bl CheckFlagInArray
	cmp r0, #0
	beq _0206929C
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
_0206929C:
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_020691E8

	thumb_func_start sub_020692A0
sub_020692A0: ; 0x020692A0
	push {r3, r4, r5, r6}
	ldr r5, [sp, #0x14]
	mov r6, #1
	ldrb r4, [r5, #4]
	bic r4, r6
	mov r6, #1
	and r0, r6
	orr r0, r4
	strb r0, [r5, #4]
	strb r1, [r5]
	strb r2, [r5, #3]
	add r0, sp, #0
	ldrb r0, [r0, #0x10]
	strb r0, [r5, #1]
	strb r3, [r5, #2]
	pop {r3, r4, r5, r6}
	bx lr
	.balign 4, 0
	thumb_func_end sub_020692A0

	thumb_func_start sub_020692C4
sub_020692C4: ; 0x020692C4
	push {r4, r5, r6, lr}
	ldr r4, [sp, #0x1c]
	add r6, r1, #0
	strh r0, [r4, #0x28]
	ldrb r0, [r4, #4]
	add r1, r2, #0
	mov r2, #4
	bic r0, r2
	lsl r2, r6, #0x1f
	lsr r2, r2, #0x1d
	orr r0, r2
	strb r0, [r4, #4]
	add r0, r4, #0
	add r0, #8
	mov r2, #8
	add r5, r3, #0
	bl CopyU16StringArrayN
	ldr r0, [sp, #0x10]
	str r5, [r4, #0x1c]
	str r0, [r4, #0x20]
	ldrb r0, [r4, #4]
	mov r1, #8
	bic r0, r1
	ldr r1, [sp, #0x14]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	lsl r1, r1, #0x1f
	lsr r1, r1, #0x1c
	orr r0, r1
	strb r0, [r4, #4]
	ldr r0, [sp, #0x18]
	str r0, [r4, #0x24]
	pop {r4, r5, r6, pc}
	thumb_func_end sub_020692C4

	thumb_func_start sub_02069308
sub_02069308: ; 0x02069308
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r4, [sp, #0x28]
	str r0, [sp]
	str r1, [sp, #4]
	add r0, r1, #0
	add r5, r2, #0
	add r6, r3, #0
	ldr r7, [sp, #0x20]
	bl GetIGTHours
	strh r0, [r4, #0x2a]
	ldr r0, [sp, #4]
	bl GetIGTMinutes
	add r1, r4, #0
	add r1, #0x2e
	strb r0, [r1]
	add r0, r4, #0
	ldr r1, [r5]
	add r0, #0x2f
	strb r1, [r0]
	add r0, r4, #0
	ldr r1, [r5, #4]
	add r0, #0x30
	strb r1, [r0]
	add r0, r4, #0
	ldr r1, [r5, #8]
	add r0, #0x31
	strb r1, [r0]
	ldr r0, [sp]
	cmp r0, #0
	beq _0206936A
	add r0, r4, #0
	ldr r1, [r6]
	add r0, #0x32
	strb r1, [r0]
	add r0, r4, #0
	ldr r1, [r6, #4]
	add r0, #0x33
	strb r1, [r0]
	add r0, r4, #0
	ldr r1, [r6, #8]
	add r0, #0x34
	strb r1, [r0]
	ldr r0, [r7]
	strh r0, [r4, #0x2c]
	ldr r1, [r7, #4]
	b _02069380
_0206936A:
	add r0, r4, #0
	mov r1, #0
	add r0, #0x32
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x33
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x34
	strb r1, [r0]
	strh r1, [r4, #0x2c]
_02069380:
	add r0, r4, #0
	add r0, #0x35
	strb r1, [r0]
	ldrb r2, [r4, #4]
	mov r0, #2
	bic r2, r0
	add r0, sp, #0x10
	ldrb r0, [r0, #0x14]
	lsl r1, r0, #0x1f
	lsr r1, r1, #0x1e
	orr r1, r2
	strb r1, [r4, #4]
	cmp r0, #0
	beq _020693A4
	ldr r0, [sp, #4]
	add sp, #8
	str r0, [r4, #0x18]
	pop {r3, r4, r5, r6, r7, pc}
_020693A4:
	mov r0, #0
	str r0, [r4, #0x18]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02069308

	thumb_func_start sub_020693AC
sub_020693AC: ; 0x020693AC
	push {r3, r4, r5, lr}
	ldr r4, [sp, #0x18]
	ldr r5, _02069400 ; =0x000F423F
	str r0, [r4, #0x38]
	cmp r0, r5
	bls _020693BA
	str r5, [r4, #0x38]
_020693BA:
	str r1, [r4, #0x3c]
	str r2, [r4, #0x40]
	ldr r1, [r4, #0x3c]
	ldr r0, _02069404 ; =0x0000270F
	cmp r1, r0
	bls _020693C8
	str r0, [r4, #0x3c]
_020693C8:
	ldr r1, [r4, #0x40]
	ldr r0, _02069404 ; =0x0000270F
	cmp r1, r0
	bls _020693D2
	str r0, [r4, #0x40]
_020693D2:
	ldr r0, _02069408 ; =0x0001869F
	str r3, [r4, #0x44]
	cmp r3, r0
	bls _020693DC
	str r0, [r4, #0x44]
_020693DC:
	ldrb r1, [r4, #4]
	mov r0, #0x10
	mov r2, #6
	bic r1, r0
	add r0, sp, #0
	ldrb r0, [r0, #0x10]
	lsl r2, r2, #8
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1b
	orr r0, r1
	strb r0, [r4, #4]
	add r4, #0x68
	ldr r0, [sp, #0x14]
	add r1, r4, #0
	bl MI_CpuCopy8
	pop {r3, r4, r5, pc}
	nop
_02069400: .word 0x000F423F
_02069404: .word 0x0000270F
_02069408: .word 0x0001869F
	thumb_func_end sub_020693AC

	thumb_func_start sub_0206940C
sub_0206940C: ; 0x0206940C
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	ldr r0, [r1, #0xc]
	add r6, r2, #0
	bl Save_TrainerCard_Get
	bl TrainerCard_GetBadgeShininessArr
	add r1, r6, #0
	mov r2, #0
	add r1, #0x48
	mov r3, #1
	mov r5, #1
_02069426:
	lsl r0, r2, #2
	ldr r4, [r1, r0]
	bic r4, r3
	str r4, [r1, r0]
	ldr r4, [r1, r0]
	and r4, r5
	str r4, [r1, r0]
	add r0, r2, #1
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	cmp r2, #8
	blo _02069426
	mov r4, #1
	mov r5, #0
_02069442:
	add r0, r7, #0
	add r1, r5, #0
	bl PlayerProfile_TestBadgeFlag
	cmp r0, #0
	beq _02069454
	ldrh r0, [r6, #6]
	orr r0, r4
	strh r0, [r6, #6]
_02069454:
	lsl r0, r4, #0x11
	lsr r4, r0, #0x10
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #0x10
	blo _02069442
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0206940C

	thumb_func_start sub_02069464
sub_02069464: ; 0x02069464
	push {r3, r4, r5, lr}
	ldr r1, _02069490 ; =0x00000684
	add r5, r0, #0
	mov r0, #0xb
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	mov r0, #0
	str r0, [r4]
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl sub_0205ABD8
	str r0, [r4, #4]
	ldr r0, [r5, #0x10]
	ldr r1, _02069494 ; =sub_02069498
	add r2, r4, #0
	bl TaskManager_Call
	pop {r3, r4, r5, pc}
	nop
_02069490: .word 0x00000684
_02069494: .word sub_02069498
	thumb_func_end sub_02069464

	thumb_func_start sub_02069498
sub_02069498: ; 0x02069498
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl TaskManager_GetFieldSystem
	add r4, r0, #0
	add r0, r5, #0
	bl TaskManager_GetEnv
	add r5, r0, #0
	ldr r0, [r5]
	cmp r0, #0xa
	bgt _020694C2
	bge _020694E4
	cmp r0, #1
	bgt _0206951C
	cmp r0, #0
	blt _0206951C
	beq _020694C8
	cmp r0, #1
	beq _020694D4
	b _0206951C
_020694C2:
	cmp r0, #0xb
	beq _02069500
	b _0206951C
_020694C8:
	add r4, #0x80
	ldr r0, [r4]
	bl sub_0205AC70
	mov r0, #1
	str r0, [r5]
_020694D4:
	ldr r1, [r5, #4]
	ldr r0, _02069520 ; =0x0000066A
	ldrh r0, [r1, r0]
	cmp r0, #0
	beq _0206951C
	mov r0, #0xa
	str r0, [r5]
	b _0206951C
_020694E4:
	add r1, r5, #0
	ldr r0, [r5, #4]
	ldr r2, _02069524 ; =0x0000066C
	add r1, #8
	bl MI_CpuCopy8
	add r1, r5, #0
	add r0, r4, #0
	add r1, #8
	bl sub_0203F7B0
	mov r0, #0xb
	str r0, [r5]
	b _0206951C
_02069500:
	add r0, r4, #0
	bl FieldSystem_ApplicationIsRunning
	cmp r0, #0
	bne _0206951C
	add r4, #0x80
	ldr r0, [r4]
	bl sub_0205AC4C
	add r0, r5, #0
	bl FreeToHeap
	mov r0, #1
	pop {r3, r4, r5, pc}
_0206951C:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02069520: .word 0x0000066A
_02069524: .word 0x0000066C
	thumb_func_end sub_02069498
