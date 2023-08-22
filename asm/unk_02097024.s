#include "constants/easy_chat.h"
#include "constants/items.h"
#include "constants/maps.h"
#include "constants/moves.h"
#include "constants/species.h"
	.include "asm/macros.inc"
	.include "unk_02097024.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_02097024
sub_02097024: ; 0x02097024
	push {r4, r5, r6, lr}
	add r6, r1, #0
	add r5, r0, #0
	add r0, r6, #0
	mov r1, #0x3c
	bl AllocFromHeap
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x3c
	bl memset
	add r2, r4, #0
	ldmia r5!, {r0, r1}
	add r2, #0x14
	stmia r2!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r5]
	add r1, r6, #0
	str r0, [r2]
	add r0, r4, #0
	bl sub_02096C88
	str r0, [r4, #0x30]
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02097024

	thumb_func_start sub_02097060
sub_02097060: ; 0x02097060
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x30]
	bl sub_02096CF4
	ldr r0, [r4, #0x30]
	bl sub_02096CC8
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end sub_02097060

	thumb_func_start sub_02097078
sub_02097078: ; 0x02097078
	ldr r0, [r0, #0x10]
	bx lr
	thumb_func_end sub_02097078

	thumb_func_start sub_0209707C
sub_0209707C: ; 0x0209707C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0xb
	mov r1, #0x34
	bl AllocFromHeap
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x34
	bl memset
	str r5, [r4, #0x28]
	ldr r0, [r5, #0xc]
	str r0, [r4, #0x10]
	add r0, r5, #0
	add r0, #0x84
	ldr r0, [r0]
	str r0, [r4, #0x14]
	ldr r0, [r5, #0xc]
	bl Save_PlayerData_GetOptionsAddr
	str r0, [r4, #0x18]
	ldr r0, [r5, #0xc]
	bl Save_GameStats_Get
	str r0, [r4, #0x1c]
	ldr r0, [r4, #0x18]
	bl Options_GetFrame
	str r0, [r4, #0xc]
	str r5, [r4, #0x20]
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0209707C

	thumb_func_start sub_020970C0
sub_020970C0: ; 0x020970C0
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4]
	lsl r2, r1, #2
	ldr r1, _020970E0 ; =_02108EC0
	ldr r1, [r1, r2]
	blx r1
	cmp r0, #1
	bne _020970DC
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #1
	pop {r4, pc}
_020970DC:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_020970E0: .word _02108EC0
	thumb_func_end sub_020970C0

	thumb_func_start sub_020970E4
sub_020970E4: ; 0x020970E4
	push {r4, lr}
	add r4, r0, #0
	add r0, #8
	mov r1, #0xb
	bl sub_02097024
	str r0, [r4, #0x24]
	mov r0, #1
	str r0, [r4]
	ldr r0, [r4, #0x28]
	ldr r1, _02097104 ; =_02108EA0
	ldr r2, [r4, #0x24]
	bl FieldSystem_LaunchApplication
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_02097104: .word _02108EA0
	thumb_func_end sub_020970E4

	thumb_func_start sub_02097108
sub_02097108: ; 0x02097108
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x28]
	bl FieldSystem_ApplicationIsRunning
	cmp r0, #0
	bne _02097142
	ldr r0, [r4, #0x24]
	bl sub_02097078
	cmp r0, #0
	bne _02097126
	mov r0, #5
	str r0, [r4]
	b _02097142
_02097126:
	mov r0, #1
	add r1, r0, #0
	bl sub_020398D4
	ldr r0, [r4, #0x28]
	ldr r1, [r4, #4]
	bl sub_0203E740
	str r0, [r4, #0x2c]
	ldr r0, [r4, #0x24]
	mov r1, #1
	str r1, [r0]
	mov r0, #2
	str r0, [r4]
_02097142:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02097108

	thumb_func_start sub_02097148
sub_02097148: ; 0x02097148
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x28]
	bl FieldSystem_ApplicationIsRunning
	cmp r0, #0
	bne _020971A4
	ldr r0, [r5, #0x2c]
	add r1, r0, #0
	add r1, #0x26
	ldrb r4, [r1]
	bl FreeToHeap
	ldr r0, [r5, #0x2c]
	add r0, #0x27
	ldrb r0, [r0]
	cmp r0, #1
	bne _0209718C
	ldr r0, [r5, #0x28]
	mov r1, #3
	mov r2, #0
	bl sub_0203E76C
	str r0, [r5, #0x30]
	str r4, [r5, #4]
	ldr r0, [r5, #0x30]
	strb r4, [r0, #0x14]
	ldr r0, [r5, #0x28]
	ldr r1, [r5, #0x30]
	bl sub_0203E4EC
	mov r0, #3
	str r0, [r5]
	b _020971A4
_0209718C:
	ldr r0, [r5, #0x24]
	ldr r1, _020971A8 ; =_02108EB0
	str r4, [r0, #4]
	ldr r0, [r5, #0x28]
	ldr r2, [r5, #0x24]
	bl FieldSystem_LaunchApplication
	ldr r0, [r5, #0x24]
	mov r1, #3
	str r1, [r0]
	mov r0, #4
	str r0, [r5]
_020971A4:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_020971A8: .word _02108EB0
	thumb_func_end sub_02097148

	thumb_func_start sub_020971AC
sub_020971AC: ; 0x020971AC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x28]
	bl FieldSystem_ApplicationIsRunning
	cmp r0, #0
	bne _020971CE
	ldr r0, [r4, #0x30]
	bl FreeToHeap
	ldr r0, [r4, #0x28]
	ldr r1, [r4, #4]
	bl sub_0203E740
	str r0, [r4, #0x2c]
	mov r0, #2
	str r0, [r4]
_020971CE:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020971AC

	thumb_func_start sub_020971D4
sub_020971D4: ; 0x020971D4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x28]
	bl FieldSystem_ApplicationIsRunning
	cmp r0, #0
	bne _020971E6
	mov r0, #5
	str r0, [r4]
_020971E6:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020971D4

	thumb_func_start sub_020971EC
sub_020971EC: ; 0x020971EC
	push {r3, lr}
	ldr r0, [r0, #0x24]
	bl sub_02097060
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_020971EC

	.rodata

_02108EA0:
	.word ov85_021E88AC, ov85_021E8A08, ov85_021E8B08, FS_OVERLAY_ID(OVY_85)
_02108EB0:
	.word ov85_021E5900, ov85_021E5AAC, ov85_021E5A34, FS_OVERLAY_ID(OVY_85)
_02108EC0:
	.word sub_020970E4
	.word sub_02097108
	.word sub_02097148
	.word sub_020971AC
	.word sub_020971D4
	.word sub_020971EC
