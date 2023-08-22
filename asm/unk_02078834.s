#include "constants/items.h"
#include "constants/moves.h"
#include "constants/pokemon.h"
#include "constants/ribbon.h"
#include "constants/party_menu.h"
#include "msgdata/msg/msg_0300.h"
	.include "asm/macros.inc"
	.include "unk_02078834.inc"
	.include "global.inc"

	.public _020FA484
	.public gNatureStatMods

	.text

	thumb_func_start sub_02078834
sub_02078834: ; 0x02078834
	push {r4, r5, r6, lr}
	add r6, r0, #0
	bl TaskManager_GetFieldSystem
	add r5, r0, #0
	add r0, r6, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldr r1, [r4, #4]
	cmp r1, #0x19
	bls _0207884E
	b _02078B1C
_0207884E:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0207885A: ; jump table
	.short _0207888E - _0207885A - 2 ; case 0
	.short _02078894 - _0207885A - 2 ; case 1
	.short _020788B8 - _0207885A - 2 ; case 2
	.short _020788CA - _0207885A - 2 ; case 3
	.short _0207899C - _0207885A - 2 ; case 4
	.short _020789B2 - _0207885A - 2 ; case 5
	.short _020789B8 - _0207885A - 2 ; case 6
	.short _020789C6 - _0207885A - 2 ; case 7
	.short _020789CC - _0207885A - 2 ; case 8
	.short _020789E8 - _0207885A - 2 ; case 9
	.short _020789E8 - _0207885A - 2 ; case 10
	.short _020789E8 - _0207885A - 2 ; case 11
	.short _020789FE - _0207885A - 2 ; case 12
	.short _02078A16 - _0207885A - 2 ; case 13
	.short _02078A2C - _0207885A - 2 ; case 14
	.short _02078A3E - _0207885A - 2 ; case 15
	.short _02078A52 - _0207885A - 2 ; case 16
	.short _02078A66 - _0207885A - 2 ; case 17
	.short _02078A7C - _0207885A - 2 ; case 18
	.short _02078A8E - _0207885A - 2 ; case 19
	.short _02078AA2 - _0207885A - 2 ; case 20
	.short _02078AB6 - _0207885A - 2 ; case 21
	.short _02078ACC - _0207885A - 2 ; case 22
	.short _02078ADE - _0207885A - 2 ; case 23
	.short _02078AF2 - _0207885A - 2 ; case 24
	.short _02078B06 - _0207885A - 2 ; case 25
_0207888E:
	ldr r1, [r5, #0xc]
	ldr r0, [r4]
	str r1, [r0]
_02078894:
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	ldr r0, [r4]
	ldr r0, [r0, #4]
	cmp r0, #1
	bne _020788E6
	ldr r0, [r5, #0xc]
	bl sub_0203A05C
	cmp r0, #0
	beq _020788E6
	mov r0, #0xa
	str r0, [r4, #4]
	ldr r0, [r4, #8]
	mov r1, #0
	strh r1, [r0]
	b _02078B20
_020788B8:
	ldr r1, _02078B24 ; =_02101290
	ldr r2, [r4]
	add r0, r6, #0
	bl CallApplicationAsTask
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _02078B20
_020788CA:
	ldr r0, [r5, #0xc]
	bl sub_0203A05C
	cmp r0, #0
	beq _020788DE
	ldr r0, [r5, #0xc]
	bl Save_VarsFlags_Get
	bl SetFlag970
_020788DE:
	ldr r0, [r4]
	ldr r0, [r0, #4]
	cmp r0, #0xf
	bls _020788E8
_020788E6:
	b _02078B20
_020788E8:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_020788F4: ; jump table
	.short _02078B20 - _020788F4 - 2 ; case 0
	.short _02078920 - _020788F4 - 2 ; case 1
	.short _0207892E - _020788F4 - 2 ; case 2
	.short _02078914 - _020788F4 - 2 ; case 3
	.short _0207894A - _020788F4 - 2 ; case 4
	.short _02078958 - _020788F4 - 2 ; case 5
	.short _0207893C - _020788F4 - 2 ; case 6
	.short _02078966 - _020788F4 - 2 ; case 7
	.short _02078978 - _020788F4 - 2 ; case 8
	.short _02078996 - _020788F4 - 2 ; case 9
	.short _0207896C - _020788F4 - 2 ; case 10
	.short _02078B20 - _020788F4 - 2 ; case 11
	.short _0207897E - _020788F4 - 2 ; case 12
	.short _02078984 - _020788F4 - 2 ; case 13
	.short _0207898A - _020788F4 - 2 ; case 14
	.short _02078990 - _020788F4 - 2 ; case 15
_02078914:
	mov r0, #0
	strb r0, [r4, #0xc]
	strb r0, [r4, #0xd]
	mov r0, #4
	str r0, [r4, #4]
	b _02078B20
_02078920:
	mov r0, #0x32
	strb r0, [r4, #0xc]
	mov r0, #0
	strb r0, [r4, #0xd]
	mov r0, #4
	str r0, [r4, #4]
	b _02078B20
_0207892E:
	mov r0, #0x64
	strb r0, [r4, #0xc]
	mov r0, #0
	strb r0, [r4, #0xd]
	mov r0, #4
	str r0, [r4, #4]
	b _02078B20
_0207893C:
	mov r0, #0
	strb r0, [r4, #0xc]
	mov r0, #1
	strb r0, [r4, #0xd]
	mov r0, #4
	str r0, [r4, #4]
	b _02078B20
_0207894A:
	mov r0, #0x32
	strb r0, [r4, #0xc]
	mov r0, #1
	strb r0, [r4, #0xd]
	mov r0, #4
	str r0, [r4, #4]
	b _02078B20
_02078958:
	mov r0, #0x64
	strb r0, [r4, #0xc]
	mov r0, #1
	strb r0, [r4, #0xd]
	mov r0, #4
	str r0, [r4, #4]
	b _02078B20
_02078966:
	mov r0, #6
	str r0, [r4, #4]
	b _02078B20
_0207896C:
	ldr r0, [r4, #8]
	mov r1, #1
	strh r1, [r0]
	mov r0, #0xb
	str r0, [r4, #4]
	b _02078B20
_02078978:
	mov r0, #9
	str r0, [r4, #4]
	b _02078B20
_0207897E:
	mov r0, #0xc
	str r0, [r4, #4]
	b _02078B20
_02078984:
	mov r0, #0xe
	str r0, [r4, #4]
	b _02078B20
_0207898A:
	mov r0, #0x12
	str r0, [r4, #4]
	b _02078B20
_02078990:
	mov r0, #0x16
	str r0, [r4, #4]
	b _02078B20
_02078996:
	mov r0, #8
	str r0, [r4, #4]
	b _02078B20
_0207899C:
	ldr r1, [r4]
	ldrb r2, [r4, #0xc]
	ldrb r3, [r4, #0xd]
	ldr r1, [r1, #8]
	add r0, r6, #0
	bl sub_020514A4
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _02078B20
_020789B2:
	mov r0, #2
	str r0, [r4, #4]
	b _02078B20
_020789B8:
	add r0, r6, #0
	bl sub_0203F4A8
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _02078B20
_020789C6:
	mov r0, #2
	str r0, [r4, #4]
	b _02078B20
_020789CC:
	ldr r2, _02078B28 ; =0x00040100
	mov r0, #3
	mov r1, #0x35
	bl CreateHeap
	bl LoadOVY13
	mov r0, #0x35
	bl ov13_0221BA00
	mov r0, #0
	bl OS_ResetSystem
	b _02078B20
_020789E8:
	ldr r0, [r4]
	bl FreeToHeap
	add r0, r4, #0
	bl FreeToHeap
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	mov r0, #1
	pop {r4, r5, r6, pc}
_020789FE:
	mov r0, #0
	bl sub_020378E4
	add r0, r5, #0
	mov r1, #0
	bl sub_020968B0
	str r0, [r4, #0x10]
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _02078B20
_02078A16:
	add r0, r5, #0
	bl FieldSystem_ApplicationIsRunning
	cmp r0, #0
	bne _02078B20
	ldr r0, [r4, #0x10]
	bl FreeToHeap
	mov r0, #2
	str r0, [r4, #4]
	b _02078B20
_02078A2C:
	add r1, r5, #0
	mov r2, #0xb
	mov r3, #1
	bl sub_02078B9C
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _02078B20
_02078A3E:
	add r0, r5, #0
	bl FieldSystem_ApplicationIsRunning
	cmp r0, #0
	bne _02078B20
	add r0, r4, #0
	bl sub_02078BD8
	str r0, [r4, #4]
	b _02078B20
_02078A52:
	ldr r2, [r4, #0x14]
	add r0, r5, #0
	mov r1, #0xb
	bl sub_02078C18
	str r0, [r4, #0x10]
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _02078B20
_02078A66:
	add r0, r5, #0
	bl FieldSystem_ApplicationIsRunning
	cmp r0, #0
	bne _02078B20
	mov r0, #2
	str r0, [r4, #4]
	ldr r0, [r4, #0x10]
	bl sub_02078C60
	b _02078B20
_02078A7C:
	add r1, r5, #0
	mov r2, #0xb
	mov r3, #2
	bl sub_02078B9C
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _02078B20
_02078A8E:
	add r0, r5, #0
	bl FieldSystem_ApplicationIsRunning
	cmp r0, #0
	bne _02078B20
	add r0, r4, #0
	bl sub_02078BD8
	str r0, [r4, #4]
	b _02078B20
_02078AA2:
	ldr r2, [r4, #0x14]
	add r0, r5, #0
	mov r1, #0xb
	bl sub_02078C74
	str r0, [r4, #0x10]
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _02078B20
_02078AB6:
	add r0, r5, #0
	bl FieldSystem_ApplicationIsRunning
	cmp r0, #0
	bne _02078B20
	mov r0, #2
	str r0, [r4, #4]
	ldr r0, [r4, #0x10]
	bl sub_02078CB4
	b _02078B20
_02078ACC:
	add r1, r5, #0
	mov r2, #0xb
	mov r3, #3
	bl sub_02078B9C
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _02078B20
_02078ADE:
	add r0, r5, #0
	bl FieldSystem_ApplicationIsRunning
	cmp r0, #0
	bne _02078B20
	add r0, r4, #0
	bl sub_02078BD8
	str r0, [r4, #4]
	b _02078B20
_02078AF2:
	ldr r2, [r4, #0x14]
	add r0, r5, #0
	mov r1, #0xb
	bl sub_02078CC8
	str r0, [r4, #0x10]
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _02078B20
_02078B06:
	add r0, r5, #0
	bl FieldSystem_ApplicationIsRunning
	cmp r0, #0
	bne _02078B20
	mov r0, #2
	str r0, [r4, #4]
	ldr r0, [r4, #0x10]
	bl sub_02078D10
	b _02078B20
_02078B1C:
	mov r0, #1
	pop {r4, r5, r6, pc}
_02078B20:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02078B24: .word _02101290
_02078B28: .word 0x00040100
	thumb_func_end sub_02078834

	thumb_func_start sub_02078B2C
sub_02078B2C: ; 0x02078B2C
	push {r4, lr}
	mov r0, #0xb
	mov r1, #0x18
	bl AllocFromHeapAtEnd
	mov r1, #0
	mov r2, #0x18
	add r4, r0, #0
	bl MI_CpuFill8
	mov r0, #0xb
	mov r1, #0xc
	bl AllocFromHeapAtEnd
	mov r1, #0
	mov r2, #0xc
	str r0, [r4]
	bl MI_CpuFill8
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02078B2C

	thumb_func_start sub_02078B58
sub_02078B58: ; 0x02078B58
	push {r4, lr}
	add r4, r0, #0
	bl sub_02078B2C
	add r2, r0, #0
	ldr r0, [r2]
	mov r1, #2
	str r1, [r0, #4]
	ldr r1, _02078B74 ; =sub_02078834
	add r0, r4, #0
	bl TaskManager_Call
	pop {r4, pc}
	nop
_02078B74: .word sub_02078834
	thumb_func_end sub_02078B58

	thumb_func_start sub_02078B78
sub_02078B78: ; 0x02078B78
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_02078B2C
	add r2, r0, #0
	ldr r0, [r2]
	mov r1, #1
	str r1, [r0, #4]
	ldr r1, _02078B98 ; =sub_02078834
	add r0, r5, #0
	str r4, [r2, #8]
	bl TaskManager_Call
	pop {r3, r4, r5, pc}
	nop
_02078B98: .word sub_02078834
	thumb_func_end sub_02078B78

	thumb_func_start sub_02078B9C
sub_02078B9C: ; 0x02078B9C
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r5, r1, #0
	add r0, r2, #0
	mov r1, #0xc
	add r4, r3, #0
	bl AllocFromHeap
	add r2, r0, #0
	strb r4, [r2]
	mov r0, #2
	strb r0, [r2, #1]
	ldr r0, _02078BD0 ; =_0210125C
	ldr r1, _02078BD4 ; =_02101280
	ldrb r0, [r0, r4]
	strb r0, [r2, #2]
	mov r0, #0
	strb r0, [r2, #3]
	strb r0, [r2, #4]
	ldr r0, [r5, #0xc]
	str r0, [r2, #8]
	add r0, r5, #0
	str r2, [r6, #0x10]
	bl FieldSystem_LaunchApplication
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02078BD0: .word _0210125C
_02078BD4: .word _02101280
	thumb_func_end sub_02078B9C

	thumb_func_start sub_02078BD8
sub_02078BD8: ; 0x02078BD8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x10]
	ldrb r1, [r0, #3]
	cmp r1, #1
	bne _02078C04
	ldrb r1, [r0]
	cmp r1, #1
	beq _02078BF2
	cmp r1, #2
	beq _02078BF8
	cmp r1, #3
	b _02078BFE
_02078BF2:
	mov r1, #0x10
	str r1, [r4, #4]
	b _02078C08
_02078BF8:
	mov r1, #0x14
	str r1, [r4, #4]
	b _02078C08
_02078BFE:
	mov r1, #0x18
	str r1, [r4, #4]
	b _02078C08
_02078C04:
	mov r1, #1
	str r1, [r4, #4]
_02078C08:
	ldrb r0, [r0, #4]
	str r0, [r4, #0x14]
	ldr r0, [r4, #0x10]
	bl FreeToHeap
	ldr r0, [r4, #4]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02078BD8

	thumb_func_start sub_02078C18
sub_02078C18: ; 0x02078C18
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, r1, #0
	mov r1, #0x3c
	add r6, r2, #0
	bl AllocFromHeap
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x3c
	bl memset
	add r0, r4, #0
	add r0, #0x38
	strb r6, [r0]
	add r0, r4, #0
	mov r1, #0
	add r0, #0x39
	strb r1, [r0]
	ldr r0, [r5, #0xc]
	mov r1, #2
	str r0, [r4, #0x34]
	ldr r0, _02078C58 ; =FS_OVERLAY_ID(OVY_90)
	bl HandleLoadOverlay
	ldr r1, _02078C5C ; =_02101260
	add r0, r5, #0
	add r2, r4, #0
	bl FieldSystem_LaunchApplication
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02078C58: .word FS_OVERLAY_ID(OVY_90)
_02078C5C: .word _02101260
	thumb_func_end sub_02078C18

	thumb_func_start sub_02078C60
sub_02078C60: ; 0x02078C60
	push {r3, lr}
	bl FreeToHeap
	ldr r0, _02078C70 ; =FS_OVERLAY_ID(OVY_90)
	bl UnloadOverlayByID
	pop {r3, pc}
	nop
_02078C70: .word FS_OVERLAY_ID(OVY_90)
	thumb_func_end sub_02078C60

	thumb_func_start sub_02078C74
sub_02078C74: ; 0x02078C74
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, r1, #0
	mov r1, #0x40
	add r6, r2, #0
	bl AllocFromHeap
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x40
	bl memset
	str r6, [r4, #0x3c]
	mov r0, #0
	str r0, [r4, #0x38]
	ldr r0, [r5, #0xc]
	mov r1, #2
	str r0, [r4, #0x34]
	ldr r0, _02078CAC ; =FS_OVERLAY_ID(OVY_90)
	bl HandleLoadOverlay
	ldr r1, _02078CB0 ; =_02101270
	add r0, r5, #0
	add r2, r4, #0
	bl FieldSystem_LaunchApplication
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02078CAC: .word FS_OVERLAY_ID(OVY_90)
_02078CB0: .word _02101270
	thumb_func_end sub_02078C74

	thumb_func_start sub_02078CB4
sub_02078CB4: ; 0x02078CB4
	push {r3, lr}
	bl FreeToHeap
	ldr r0, _02078CC4 ; =FS_OVERLAY_ID(OVY_90)
	bl UnloadOverlayByID
	pop {r3, pc}
	nop
_02078CC4: .word FS_OVERLAY_ID(OVY_90)
	thumb_func_end sub_02078CB4

	thumb_func_start sub_02078CC8
sub_02078CC8: ; 0x02078CC8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, r1, #0
	mov r1, #0x3c
	add r6, r2, #0
	bl AllocFromHeap
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x3c
	bl MI_CpuFill8
	add r0, r4, #0
	add r0, #0x38
	strb r6, [r0]
	add r0, r4, #0
	mov r1, #0
	add r0, #0x39
	strb r1, [r0]
	ldr r0, [r5, #0xc]
	mov r1, #2
	str r0, [r4, #0x34]
	ldr r0, _02078D08 ; =FS_OVERLAY_ID(OVY_90)
	bl HandleLoadOverlay
	ldr r1, _02078D0C ; =_021012A0
	add r0, r5, #0
	add r2, r4, #0
	bl FieldSystem_LaunchApplication
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02078D08: .word FS_OVERLAY_ID(OVY_90)
_02078D0C: .word _021012A0
	thumb_func_end sub_02078CC8

	thumb_func_start sub_02078D10
sub_02078D10: ; 0x02078D10
	push {r3, lr}
	bl FreeToHeap
	ldr r0, _02078D20 ; =FS_OVERLAY_ID(OVY_90)
	bl UnloadOverlayByID
	pop {r3, pc}
	nop
_02078D20: .word FS_OVERLAY_ID(OVY_90)
	thumb_func_end sub_02078D10

	thumb_func_start sub_02078D24
sub_02078D24: ; 0x02078D24
	push {r4, lr}
	add r4, r0, #0
	bl sub_020398C8
	mov r1, #0x24
	ldrb r2, [r0, #0x1b]
	mul r1, r4
	add r0, r0, r1
	add r0, #0x3f
	ldrb r0, [r0]
	cmp r2, #0xc
	bne _02078D44
	cmp r0, #5
	bne _02078D44
	mov r0, #1
	pop {r4, pc}
_02078D44:
	cmp r2, #0xd
	bne _02078D50
	cmp r0, #6
	bne _02078D50
	mov r0, #1
	pop {r4, pc}
_02078D50:
	cmp r2, #0xe
	bne _02078D5C
	cmp r0, #7
	bne _02078D5C
	mov r0, #1
	pop {r4, pc}
_02078D5C:
	cmp r2, #9
	bne _02078D68
	cmp r0, #2
	bne _02078D68
	mov r0, #1
	pop {r4, pc}
_02078D68:
	cmp r2, #0xa
	bne _02078D74
	cmp r0, #3
	bne _02078D74
	mov r0, #1
	pop {r4, pc}
_02078D74:
	cmp r2, #0xb
	bne _02078D80
	cmp r0, #4
	bne _02078D80
	mov r0, #1
	pop {r4, pc}
_02078D80:
	cmp r2, #0xf
	bne _02078D8C
	cmp r0, #8
	bne _02078D8C
	mov r0, #1
	pop {r4, pc}
_02078D8C:
	cmp r2, #0x13
	bne _02078D98
	cmp r0, #0x12
	bne _02078D98
	mov r0, #1
	pop {r4, pc}
_02078D98:
	cmp r2, #0x15
	bne _02078DA4
	cmp r0, #0x14
	bne _02078DA4
	mov r0, #1
	pop {r4, pc}
_02078DA4:
	cmp r2, #0x17
	bne _02078DB0
	cmp r0, #0x16
	bne _02078DB0
	mov r0, #1
	pop {r4, pc}
_02078DB0:
	cmp r2, #0x19
	bne _02078DBC
	cmp r0, #0x18
	bne _02078DBC
	mov r0, #1
	pop {r4, pc}
_02078DBC:
	cmp r2, #0x1b
	bne _02078DC8
	cmp r0, #0x1a
	bne _02078DC8
	mov r0, #1
	pop {r4, pc}
_02078DC8:
	cmp r2, #0x10
	bne _02078DD4
	cmp r0, #1
	bne _02078DD4
	mov r0, #1
	pop {r4, pc}
_02078DD4:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end sub_02078D24

	.rodata

_0210125C:
	.byte 0x03, 0x04, 0x04, 0x04
_02101260:
	.word ov91_0225C540, ov91_0225C58C, ov91_0225C9EC, FS_OVERLAY_ID(OVY_91)
_02101270:
	.word ov92_0225CAB4, ov92_0225CDF4, ov92_0225D36C, FS_OVERLAY_ID(OVY_92)
_02101280:
	.word ov44_02232EA8, ov44_02232F64, ov44_022330A8, FS_OVERLAY_ID(OVY_44)
_02101290:
	.word ov44_0222A4B4, ov44_0222A60C, ov44_0222A758, FS_OVERLAY_ID(OVY_44)
_021012A0:
	.word ov93_0225C540, ov93_0225C574, ov93_0225C6C0, FS_OVERLAY_ID(OVY_93)
