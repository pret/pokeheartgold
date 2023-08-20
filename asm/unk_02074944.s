#include "constants/items.h"
#include "constants/moves.h"
	.include "asm/macros.inc"
	.include "unk_02074944.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_02074944
sub_02074944: ; 0x02074944
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl PokedexData_Create
	mov r1, #0
	add r2, r5, #0
	add r4, r0, #0
	bl PokedexData_LoadAll
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02074944

	thumb_func_start sub_0207495C
sub_0207495C: ; 0x0207495C
	push {r4, lr}
	add r4, r0, #0
	bl PokedexData_UnloadAll
	add r0, r4, #0
	bl PokedexData_Delete
	pop {r4, pc}
	thumb_func_end sub_0207495C

	thumb_func_start sub_0207496C
sub_0207496C: ; 0x0207496C
	push {r3, r4, r5, r6, r7, lr}
	add r7, r1, #0
	add r4, r0, #0
	str r2, [sp]
	add r0, r7, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	cmp r4, #0
	bne _0207498A
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0207498A:
	add r0, r4, #0
	mov r1, #2
	bl sub_020290FC
	add r5, r0, #0
	add r0, r7, #0
	mov r1, #0xa1
	mov r2, #0
	bl GetMonData
	cmp r0, r5
	bls _020749A6
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_020749A6:
	add r0, r7, #0
	mov r1, #0x4c
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _020749B8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_020749B8:
	add r0, r4, #0
	mov r1, #4
	bl sub_020290FC
	cmp r0, #0
	bne _020749D2
	add r0, r6, #0
	bl GetEggSpecies
	cmp r6, r0
	beq _020749D2
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_020749D2:
	add r0, r4, #0
	mov r1, #5
	bl sub_020290FC
	add r5, r0, #0
	beq _020749FC
	ldr r0, [sp]
	add r1, r6, #0
	bl PokedexData_GetHeight
	cmp r5, #0
	ble _020749F2
	cmp r0, r5
	bge _020749FC
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_020749F2:
	neg r1, r5
	cmp r0, r1
	ble _020749FC
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_020749FC:
	add r0, r4, #0
	mov r1, #7
	bl sub_020290FC
	mov r1, #0xa
	add r5, r0, #0
	mul r5, r1
	beq _02074A2A
	ldr r0, [sp]
	add r1, r6, #0
	bl PokedexData_GetWeight
	cmp r5, #0
	ble _02074A20
	cmp r0, r5
	bge _02074A2A
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02074A20:
	neg r1, r5
	cmp r0, r1
	ble _02074A2A
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02074A2A:
	add r0, r4, #0
	mov r1, #0xd
	bl sub_020290FC
	mov r1, #2
	lsl r1, r1, #0xe
	cmp r0, r1
	bne _02074A4C
	add r0, r6, #0
	bl SpeciesIsMythical
	cmp r0, #1
	beq _02074A48
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02074A48:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02074A4C:
	add r0, r4, #0
	mov r1, #0xb
	bl sub_020290FC
	cmp r0, #0
	bne _02074A66
	add r0, r7, #0
	bl MonCheckFrontierIneligibility
	cmp r0, #0
	beq _02074A66
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02074A66:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0207496C

	thumb_func_start sub_02074A6C
sub_02074A6C: ; 0x02074A6C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #0x14]
	str r0, [sp, #0x10]
	ldr r0, [sp]
	str r1, [sp, #4]
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	cmp r0, #0
	bne _02074A8A
	ldr r0, [sp, #0x14]
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
_02074A8A:
	ldr r1, [sp, #0x14]
	add r2, sp, #0x24
	add r3, sp, #0x18
	mov r0, #0
_02074A92:
	ldr r4, [sp, #0xc]
	strh r0, [r2]
	strh r0, [r3]
	ldrb r4, [r4, r1]
	cmp r4, #0
	beq _02074AA4
	ldr r4, [sp, #0x14]
	add r4, r4, #1
	str r4, [sp, #0x14]
_02074AA4:
	add r1, r1, #1
	add r2, r2, #2
	add r3, r3, #2
	cmp r1, #6
	blt _02074A92
	ldr r0, [sp]
	mov r1, #1
	bl sub_020290FC
	ldr r1, [sp, #0x14]
	cmp r1, r0
	beq _02074AC2
	add sp, #0x30
	mov r0, #4
	pop {r3, r4, r5, r6, r7, pc}
_02074AC2:
	mov r5, #0
	add r7, sp, #0x24
	add r6, sp, #0x18
_02074AC8:
	ldr r0, [sp, #0xc]
	ldrb r1, [r0, r5]
	cmp r1, #0
	beq _02074B16
	ldr r0, [sp, #4]
	sub r1, r1, #1
	bl Party_GetMonByIndex
	add r4, r0, #0
	ldr r0, [sp]
	ldr r2, [sp, #8]
	add r1, r4, #0
	bl sub_0207496C
	cmp r0, #0
	bne _02074AEE
	add sp, #0x30
	mov r0, #5
	pop {r3, r4, r5, r6, r7, pc}
_02074AEE:
	add r0, r4, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	strh r0, [r7]
	add r0, r4, #0
	mov r1, #6
	mov r2, #0
	bl GetMonData
	strh r0, [r6]
	add r0, r4, #0
	mov r1, #0xa1
	mov r2, #0
	bl GetMonData
	ldr r1, [sp, #0x10]
	add r0, r1, r0
	str r0, [sp, #0x10]
_02074B16:
	add r5, r5, #1
	add r7, r7, #2
	add r6, r6, #2
	cmp r5, #6
	blt _02074AC8
	ldr r0, [sp]
	mov r1, #3
	bl sub_020290FC
	ldr r1, [sp, #0x10]
	cmp r1, r0
	ble _02074B38
	cmp r0, #0
	beq _02074B38
	add sp, #0x30
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02074B38:
	ldr r0, [sp]
	mov r1, #0xd
	bl sub_020290FC
	mov r1, #2
	lsl r1, r1, #0xe
	cmp r0, r1
	bne _02074B7E
	mov r4, #0
	add r6, r4, #0
	add r5, sp, #0x24
	add r7, r4, #0
_02074B50:
	ldrh r0, [r5]
	cmp r0, #0
	beq _02074B6C
	add r1, r7, #0
	bl IsPokemonBannedFromBattleFrontier 
	cmp r0, #0
	beq _02074B6C
	ldrh r0, [r5]
	bl SpeciesIsMythical
	cmp r0, #0
	bne _02074B6C
	add r4, r4, #1
_02074B6C:
	add r6, r6, #1
	add r5, r5, #2
	cmp r6, #6
	blt _02074B50
	cmp r4, #2
	ble _02074B7E
	add sp, #0x30
	mov r0, #6
	pop {r3, r4, r5, r6, r7, pc}
_02074B7E:
	ldr r0, [sp]
	mov r1, #0xa
	bl sub_020290FC
	cmp r0, #0
	bne _02074BC2
	ldr r0, [sp, #0x14]
	cmp r0, #1
	ble _02074BC2
	add r4, sp, #0x24
	mov r0, #0
	add r3, r4, #0
_02074B96:
	add r1, r0, #1
	cmp r1, #6
	bge _02074BBA
	ldrh r6, [r4]
	lsl r2, r1, #1
	add r5, r3, r2
_02074BA2:
	ldrh r2, [r5]
	cmp r6, r2
	bne _02074BB2
	cmp r6, #0
	beq _02074BB2
	add sp, #0x30
	mov r0, #2
	pop {r3, r4, r5, r6, r7, pc}
_02074BB2:
	add r1, r1, #1
	add r5, r5, #2
	cmp r1, #6
	blt _02074BA2
_02074BBA:
	add r0, r0, #1
	add r4, r4, #2
	cmp r0, #5
	blt _02074B96
_02074BC2:
	ldr r0, [sp]
	mov r1, #0xd
	bl sub_020290FC
	mov r1, #2
	lsl r1, r1, #0xe
	cmp r0, r1
	bne _02074BF8
	mov r4, #0
	add r2, sp, #0x18
	add r3, sp, #0x24
_02074BD8:
	ldrh r1, [r2]
	cmp r1, #0xe1
	bne _02074BEE
	ldrh r0, [r3]
	cmp r0, #0
	beq _02074BEE
	cmp r1, #0
	beq _02074BEE
	add sp, #0x30
	mov r0, #8
	pop {r3, r4, r5, r6, r7, pc}
_02074BEE:
	add r4, r4, #1
	add r2, r2, #2
	add r3, r3, #2
	cmp r4, #6
	blt _02074BD8
_02074BF8:
	ldr r0, [sp]
	mov r1, #9
	bl sub_020290FC
	cmp r0, #0
	bne _02074C48
	ldr r0, [sp, #0x14]
	cmp r0, #1
	ble _02074C48
	add r2, sp, #0x18
	mov r5, #0
	add r7, sp, #0x24
	mov ip, r2
_02074C12:
	add r6, r5, #1
	cmp r6, #6
	bge _02074C3E
	lsl r1, r6, #1
	mov r0, ip
	add r3, r0, r1
	ldrh r4, [r2]
	ldrh r0, [r7]
_02074C22:
	ldrh r1, [r3]
	cmp r4, r1
	bne _02074C36
	cmp r0, #0
	beq _02074C36
	cmp r4, #0
	beq _02074C36
	add sp, #0x30
	mov r0, #3
	pop {r3, r4, r5, r6, r7, pc}
_02074C36:
	add r6, r6, #1
	add r3, r3, #2
	cmp r6, #6
	blt _02074C22
_02074C3E:
	add r5, r5, #1
	add r2, r2, #2
	add r7, r7, #2
	cmp r5, #5
	blt _02074C12
_02074C48:
	mov r0, #0
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02074A6C

	thumb_func_start sub_02074C50
sub_02074C50: ; 0x02074C50
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x30]
	str r1, [sp, #0x10]
	lsl r0, r0, #1
	ldr r1, [sp, #0xc]
	str r0, [sp, #0x18]
	ldrh r0, [r1, r0]
	add r6, r2, #0
	str r3, [sp, #0x14]
	ldr r5, [sp, #0x38]
	ldr r7, [sp, #0x34]
	cmp r0, #0
	beq _02074C9A
	ldr r0, [sp, #0x18]
	ldrh r0, [r6, r0]
	cmp r0, #0
	bne _02074C9A
	ldr r1, [sp, #0x10]
	ldr r0, [sp, #0x18]
	ldrh r1, [r1, r0]
	add r0, r3, #0
	sub r0, r0, r1
	str r0, [sp, #0x14]
	bpl _02074C8A
	add sp, #0x1c
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_02074C8A:
	sub r7, r7, #1
	bne _02074C94
	add sp, #0x1c
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_02074C94:
	ldr r0, [sp, #0x18]
	mov r1, #1
	strh r1, [r6, r0]
_02074C9A:
	ldr r0, [sp, #0x30]
	add r4, r0, #1
	cmp r4, r5
	bge _02074CC4
_02074CA2:
	str r4, [sp]
	str r7, [sp, #4]
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	ldr r3, [sp, #0x14]
	add r2, r6, #0
	str r5, [sp, #8]
	bl sub_02074C50
	cmp r0, #0
	beq _02074CBE
	add sp, #0x1c
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_02074CBE:
	add r4, r4, #1
	cmp r4, r5
	blt _02074CA2
_02074CC4:
	ldr r1, [sp, #0x18]
	mov r0, #0
	strh r0, [r6, r1]
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02074C50

	thumb_func_start sub_02074CD0
sub_02074CD0: ; 0x02074CD0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x54
	str r0, [sp, #0xc]
	add r0, r1, #0
	str r1, [sp, #0x10]
	str r2, [sp, #0x14]
	bl Party_GetCount
	str r0, [sp, #0x20]
	add r6, r0, #0
	add r0, sp, #0x30
	mov r1, #0
	mov r2, #0xc
	bl MI_CpuFill8
	ldr r0, [sp, #0x20]
	mov r7, #0
	cmp r0, #0
	ble _02074D3A
	add r4, sp, #0x48
	add r5, sp, #0x3c
_02074CFA:
	ldr r0, [sp, #0x10]
	add r1, r7, #0
	bl Party_GetMonByIndex
	str r0, [sp, #0x24]
	mov r1, #5
	mov r2, #0
	bl GetMonData
	strh r0, [r4]
	ldr r0, [sp, #0x24]
	mov r1, #0xa1
	mov r2, #0
	bl GetMonData
	strh r0, [r5]
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x24]
	ldr r2, [sp, #0x14]
	bl sub_0207496C
	cmp r0, #0
	bne _02074D2E
	mov r0, #0
	strh r0, [r4]
	sub r6, r6, #1
_02074D2E:
	ldr r0, [sp, #0x20]
	add r7, r7, #1
	add r4, r4, #2
	add r5, r5, #2
	cmp r7, r0
	blt _02074CFA
_02074D3A:
	ldr r0, [sp, #0xc]
	mov r1, #0xa
	bl sub_020290FC
	cmp r0, #0
	bne _02074DBA
	ldr r0, [sp, #0x20]
	cmp r0, #1
	ble _02074DBA
	mov r0, #0
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x20]
	sub r0, r0, #1
	str r0, [sp, #0x28]
	cmp r0, #0
	ble _02074DBA
	add r0, sp, #0x3c
	add r3, sp, #0x48
	str r0, [sp, #0x1c]
	str r3, [sp, #0x2c]
	mov ip, r0
_02074D64:
	ldr r0, [sp, #0x18]
	add r2, r0, #1
	ldr r0, [sp, #0x20]
	cmp r2, r0
	bge _02074DA6
	ldr r1, [sp, #0x2c]
	lsl r0, r2, #1
	add r4, r1, r0
	mov r1, ip
	add r5, r1, r0
	ldr r0, [sp, #0x1c]
	ldrh r7, [r0]
_02074D7C:
	ldrh r1, [r3]
	ldrh r0, [r4]
	cmp r1, r0
	bne _02074D9A
	cmp r1, #0
	beq _02074D9A
	ldrh r0, [r5]
	cmp r7, r0
	bls _02074D94
	mov r0, #0
	strh r0, [r3]
	b _02074D98
_02074D94:
	mov r0, #0
	strh r0, [r4]
_02074D98:
	sub r6, r6, #1
_02074D9A:
	ldr r0, [sp, #0x20]
	add r2, r2, #1
	add r4, r4, #2
	add r5, r5, #2
	cmp r2, r0
	blt _02074D7C
_02074DA6:
	ldr r0, [sp, #0x1c]
	add r3, r3, #2
	add r0, r0, #2
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x18]
	add r1, r0, #1
	ldr r0, [sp, #0x28]
	str r1, [sp, #0x18]
	cmp r1, r0
	blt _02074D64
_02074DBA:
	ldr r0, [sp, #0xc]
	mov r1, #0xd
	bl sub_020290FC
	mov r1, #2
	lsl r1, r1, #0xe
	cmp r0, r1
	bne _02074DFE
	mov r7, #0
	add r5, r7, #0
	add r4, sp, #0x48
_02074DD0:
	ldrh r0, [r4]
	cmp r0, #0
	beq _02074DF6
	bl SpeciesIsMythical
	cmp r0, #0
	bne _02074DF6
	ldrh r0, [r4]
	mov r1, #0
	bl IsPokemonBannedFromBattleFrontier 
	cmp r0, #1
	bne _02074DF6
	add r7, r7, #1
	cmp r7, #2
	ble _02074DF6
	mov r0, #0
	strh r0, [r4]
	sub r6, r6, #1
_02074DF6:
	add r5, r5, #1
	add r4, r4, #2
	cmp r5, #6
	blt _02074DD0
_02074DFE:
	ldr r0, [sp, #0xc]
	mov r1, #1
	bl sub_020290FC
	add r7, r0, #0
	cmp r6, r7
	bge _02074E12
	add sp, #0x54
	mov r0, #4
	pop {r4, r5, r6, r7, pc}
_02074E12:
	ldr r0, [sp, #0xc]
	mov r1, #3
	bl sub_020290FC
	add r5, r0, #0
	bne _02074E24
	add sp, #0x54
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_02074E24:
	ldr r0, [sp, #0x20]
	mov r4, #0
	cmp r0, #0
	ble _02074E54
	add r6, sp, #0x48
_02074E2E:
	str r4, [sp]
	ldr r0, [sp, #0x20]
	str r7, [sp, #4]
	str r0, [sp, #8]
	add r0, r6, #0
	add r1, sp, #0x3c
	add r2, sp, #0x30
	add r3, r5, #0
	bl sub_02074C50
	cmp r0, #0
	beq _02074E4C
	add sp, #0x54
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_02074E4C:
	ldr r0, [sp, #0x20]
	add r4, r4, #1
	cmp r4, r0
	blt _02074E2E
_02074E54:
	mov r0, #1
	add sp, #0x54
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02074CD0
