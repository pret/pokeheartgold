#include "constants/items.h"
#include "constants/moves.h"
#include "constants/pokemon.h"
#include "constants/ribbon.h"
#include "constants/field_move_response.h"
#include "msgdata/msg/msg_0300.h"
	.include "asm/macros.inc"
	.include "unk_02078DD8.inc"
	.include "global.inc"

	.public gOverlayTemplate_Battle
	.public gNatureStatMods

	.text

	thumb_func_start sub_02078DD8
sub_02078DD8: ; 0x02078DD8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, r1, #0
	mov r1, #0x24
	bl Heap_Alloc
	mov r1, #0
	mov r2, #0x24
	add r4, r0, #0
	bl memset
	mov r0, #0x1c
	strb r0, [r4, #0x1b]
	add r0, r5, #0
	bl PlayerProfile_GetTrainerGender
	strb r0, [r4, #0x1e]
	add r0, r5, #0
	bl PlayerProfile_GetAvatar
	strb r0, [r4, #0x1d]
	add r0, r5, #0
	bl PlayerProfile_GetVersion
	strb r0, [r4, #0x18]
	add r0, r5, #0
	bl PlayerProfile_GetLanguage
	strb r0, [r4, #0x19]
	add r0, r4, #0
	mov r1, #0x24
	bl ov00_021E6D60
	cmp r0, #1
	beq _02078E22
	bl GF_AssertFail
_02078E22:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02078DD8

	thumb_func_start sub_02078E28
sub_02078E28: ; 0x02078E28
	ldr r3, _02078E2C ; =Heap_Free
	bx r3
	.balign 4, 0
_02078E2C: .word Heap_Free
	thumb_func_end sub_02078E28
