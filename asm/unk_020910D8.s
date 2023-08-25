#include "constants/easy_chat.h"
#include "constants/items.h"
#include "constants/maps.h"
#include "constants/moves.h"
#include "constants/pokemon.h"
#include "constants/species.h"
	.include "asm/macros.inc"
	.include "unk_020910D8.inc"
	.include "global.inc"

	.public _02102610

	.text

	thumb_func_start sub_020910D8
sub_020910D8: ; 0x020910D8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldr r1, [r4]
	cmp r1, #6
	bls _020910EC
	b _02091232
_020910EC:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_020910F8: ; jump table
	.short _02091106 - _020910F8 - 2 ; case 0
	.short _0209111C - _020910F8 - 2 ; case 1
	.short _0209112E - _020910F8 - 2 ; case 2
	.short _0209119A - _020910F8 - 2 ; case 3
	.short _020911FA - _020910F8 - 2 ; case 4
	.short _0209121A - _020910F8 - 2 ; case 5
	.short _02091228 - _020910F8 - 2 ; case 6
_02091106:
	ldr r0, [r4, #0xc]
	mov r1, #0xb
	bl sub_0206D328
	add r0, r5, #0
	bl sub_0205525C
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02091232
_0209111C:
	ldr r1, _02091238 ; =_02106048
	add r0, r5, #0
	add r2, r4, #0
	bl CallApplicationAsTask
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02091232
_0209112E:
	add r0, r5, #0
	bl TaskManager_GetFieldSystem
	add r6, r0, #0
	ldr r5, [r4, #0xc]
	bl FieldSystem_GetSaveData
	bl Save_PlayerData_GetProfileAddr
	add r7, r0, #0
	ldr r0, [r6, #0x20]
	ldr r0, [r0]
	bl MapHeader_GetMapSec
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	add r0, r5, #0
	mov r1, #0x4c
	add r2, sp, #0xc
	bl SetMonData
	mov r0, #0xb
	str r0, [sp]
	ldr r3, [sp, #8]
	add r0, r5, #0
	add r1, r7, #0
	mov r2, #6
	bl MonSetTrainerMemo
	add r0, r5, #0
	mov r1, #0xb3
	mov r2, #0
	bl SetMonData
	add r0, r6, #0
	add r1, r5, #0
	bl sub_02093134
	add r0, r6, #0
	bl FieldSystem_GetSaveData
	ldr r1, [r4, #0xc]
	bl UpdatePokedexWithReceivedSpecies
	ldr r0, [r4, #4]
	cmp r0, #1
	bne _02091194
	mov r0, #3
	str r0, [r4]
	b _02091232
_02091194:
	mov r0, #5
	str r0, [r4]
	b _02091232
_0209119A:
	add r0, r5, #0
	bl TaskManager_GetFieldSystem
	add r6, r0, #0
	ldr r0, [r4, #0xc]
	mov r1, #MON_DATA_SPECIES
	mov r2, #0
	bl GetMonData
	add r7, r0, #0
	add r0, r6, #0
	bl FieldSystem_GetSaveData
	bl Save_PlayerData_GetOptionsAddr
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #0xb
	mov r1, #1
	add r2, r7, #0
	mov r3, #0xa
	bl sub_020830D8
	str r0, [r4, #8]
	ldr r0, [r4, #0xc]
	mov r1, #MON_DATA_GENDER
	mov r2, #0
	bl GetMonData
	ldr r1, [r4, #8]
	mov r2, #0
	str r0, [r1, #0x10]
	ldr r0, [r4, #0xc]
	mov r1, #MON_DATA_FORM
	bl GetMonData
	ldr r1, [r4, #8]
	str r0, [r1, #8]
	ldr r1, _0209123C ; =_02102610
	ldr r2, [r4, #8]
	add r0, r5, #0
	bl CallApplicationAsTask
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02091232
_020911FA:
	ldr r2, [r4, #8]
	ldr r0, [r2, #0x14]
	cmp r0, #0
	bne _0209120C
	ldr r0, [r4, #0xc]
	ldr r2, [r2, #0x18]
	mov r1, #0x78
	bl SetMonData
_0209120C:
	ldr r0, [r4, #8]
	bl sub_0208311C
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02091232
_0209121A:
	add r0, r5, #0
	bl sub_020552A4
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02091232
_02091228:
	bl FreeToHeap
	add sp, #0x10
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02091232:
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02091238: .word _02106048
_0209123C: .word _02102610
	thumb_func_end sub_020910D8

	thumb_func_start sub_02091240
sub_02091240: ; 0x02091240
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #0xb
	mov r1, #0x1c
	bl AllocFromHeapAtEnd
	add r2, r0, #0
	add r3, r2, #0
	mov r1, #0x1c
	mov r0, #0
_02091256:
	strb r0, [r3]
	add r3, r3, #1
	sub r1, r1, #1
	bne _02091256
	add r3, r2, #0
	add r3, #0xc
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r1, _02091274 ; =sub_020910D8
	add r0, r5, #0
	bl TaskManager_Call
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02091274: .word sub_020910D8
	thumb_func_end sub_02091240

	.rodata

_02106048:
	.word ov95_021E6D70, ov95_021E6E88, ov95_021E6F0C, FS_OVERLAY_ID(OVY_95)
