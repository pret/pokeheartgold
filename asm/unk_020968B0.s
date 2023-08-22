#include "constants/easy_chat.h"
#include "constants/items.h"
#include "constants/maps.h"
#include "constants/moves.h"
#include "constants/species.h"
	.include "asm/macros.inc"
	.include "unk_020968B0.inc"
	.include "global.inc"
	.public _02108584

	.text

	thumb_func_start sub_020968B0
sub_020968B0: ; 0x020968B0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #0xb
	mov r1, #0x28
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x28
	bl MI_CpuFill8
	str r6, [r4]
	ldr r0, [r5, #0xc]
	bl Save_PlayerData_GetOptionsAddr
	str r0, [r4, #4]
	ldr r0, [r5, #0xc]
	mov r1, #0xe
	str r0, [r4, #8]
	add r0, r5, #0
	add r0, #0x94
	ldr r0, [r0]
	add r2, r4, #0
	str r0, [r4, #0xc]
	add r0, r5, #0
	add r0, #0xb0
	ldr r0, [r0]
	str r0, [r4, #0x1c]
	mov r0, #0
	str r0, [r4, #0x10]
	str r0, [r4, #0x14]
	ldr r0, [r5, #0x20]
	ldr r0, [r0]
	str r0, [r4, #0x18]
	add r0, r4, #0
	add r0, #0x20
	strb r1, [r0]
	ldr r1, _0209690C ; =_02108584
	add r0, r5, #0
	str r5, [r4, #0x24]
	bl FieldSystem_LaunchApplication
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	nop
_0209690C: .word _02108584
	thumb_func_end sub_020968B0
