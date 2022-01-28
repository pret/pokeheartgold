#include "constants/easy_chat.h"
#include "constants/items.h"
#include "constants/maps.h"
#include "constants/moves.h"
#include "constants/species.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.bss

_021D43B4:
	.space 4

	.text

	thumb_func_start sub_02092B04
sub_02092B04: ; 0x02092B04
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl TaskManager_GetSys
	add r6, r0, #0
	add r0, r5, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldr r0, _02092B3C ; =0x00000272
	ldrb r0, [r4, r0]
	cmp r0, #0x18
	beq _02092B24
	cmp r0, #0x19
	beq _02092B32
	b _02092B38
_02092B24:
	add r0, r6, #0
	add r1, r4, #0
	bl sub_02092B40
	ldr r1, _02092B3C ; =0x00000272
	strb r0, [r4, r1]
	b _02092B38
_02092B32:
	add r0, r5, #0
	bl sub_02092B7C
_02092B38:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02092B3C: .word 0x00000272
	thumb_func_end sub_02092B04

	thumb_func_start sub_02092B40
sub_02092B40: ; 0x02092B40
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl FieldSys_ApplicationIsRunning
	cmp r0, #0
	beq _02092B52
	mov r0, #0x18
	pop {r3, r4, r5, pc}
_02092B52:
	mov r0, #0x2a
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _02092B6A
	ldr r0, [r4, #4]
	bl sub_0207791C
	mov r1, #0x2a
	lsl r1, r1, #4
	ldr r1, [r4, r1]
	strh r0, [r1, #2]
_02092B6A:
	ldr r0, [r4, #4]
	bl FreeToHeap
	add r0, r5, #0
	bl sub_020505C0
	mov r0, #0x19
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02092B40

	thumb_func_start sub_02092B7C
sub_02092B7C: ; 0x02092B7C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl TaskManager_GetSys
	add r6, r0, #0
	add r0, r5, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	add r0, r6, #0
	bl sub_020505C8
	cmp r0, #0
	beq _02092BAE
	mov r0, #1
	bl ov01_021E636C
	ldr r1, _02092BB0 ; =ov03_02256E2C
	add r0, r5, #0
	add r2, r4, #0
	bl NowRunTask
	ldr r0, _02092BB4 ; =0x00000272
	mov r1, #0x1a
	strb r1, [r4, r0]
_02092BAE:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02092BB0: .word ov03_02256E2C
_02092BB4: .word 0x00000272
	thumb_func_end sub_02092B7C

	thumb_func_start sub_02092BB8
sub_02092BB8: ; 0x02092BB8
	push {r4, lr}
	mov r1, #4
	bl AllocFromHeap
	mov r1, #0
	mov r2, #2
	add r4, r0, #0
	bl sub_02092BD8
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02092BB8

	thumb_func_start sub_02092BD0
sub_02092BD0: ; 0x02092BD0
	ldr r3, _02092BD4 ; =FreeToHeap
	bx r3
	.balign 4, 0
_02092BD4: .word FreeToHeap
	thumb_func_end sub_02092BD0

	thumb_func_start sub_02092BD8
sub_02092BD8: ; 0x02092BD8
	strh r1, [r0]
	strh r2, [r0, #2]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02092BD8

	thumb_func_start sub_02092BE0
sub_02092BE0: ; 0x02092BE0
	ldrh r0, [r0, #2]
	bx lr
	thumb_func_end sub_02092BE0

	thumb_func_start sub_02092BE4
sub_02092BE4: ; 0x02092BE4
	ldrh r0, [r0]
	bx lr
	thumb_func_end sub_02092BE4

	thumb_func_start sub_02092BE8
sub_02092BE8: ; 0x02092BE8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	add r4, r1, #0
	str r2, [sp]
	bl SavArray_Flags_get
	ldr r0, [r5, #0xc]
	bl Save_FlyPoints_get
	add r7, r0, #0
	bl FlyPoints_GetSpecialSpawnWarpPtr
	add r6, r0, #0
	add r0, r7, #0
	bl FlyPoints_GetPosition
	str r0, [sp, #4]
	add r0, r5, #0
	bl sub_02092DEC
	add r7, r0, #0
	ldr r0, [r5, #0xc]
	str r0, [r4, #0x24]
	ldr r0, [sp, #4]
	ldr r0, [r0]
	strh r0, [r4, #0x10]
	ldrh r0, [r4, #0x10]
	bl MapHeader_MapIsOnMainMatrix
	cmp r0, #0
	beq _02092C60
	ldr r0, [r5, #0x40]
	bl GetPlayerXCoord
	str r0, [r4, #8]
	ldr r0, [r5, #0x40]
	bl GetPlayerYCoord
	str r0, [r4, #0xc]
	ldr r1, [r4, #8]
	asr r0, r1, #4
	lsr r0, r0, #0x1b
	add r0, r1, r0
	asr r1, r0, #5
	add r0, r4, #0
	add r0, #0x22
	strb r1, [r0]
	ldr r1, [r4, #0xc]
	asr r0, r1, #4
	lsr r0, r0, #0x1b
	add r0, r1, r0
	asr r1, r0, #5
	add r0, r4, #0
	add r0, #0x23
	strb r1, [r0]
	ldrh r0, [r4, #0x10]
	strh r0, [r4, #0x12]
	b _02092CE2
_02092C60:
	ldr r0, [r6, #8]
	add r1, sp, #8
	str r0, [r4, #8]
	ldr r0, [r6, #0xc]
	add r1, #2
	str r0, [r4, #0xc]
	ldrh r0, [r4, #0x10]
	add r2, sp, #8
	bl MapHeader_GetWorldMapCoords
	bl MapMatrix_New
	add r6, r0, #0
	mov r0, #0x3c
	add r1, r6, #0
	bl MapMatrix_Load
	add r0, sp, #8
	mov r1, #2
	ldrsh r1, [r0, r1]
	cmp r1, #0
	bne _02092CB6
	mov r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne _02092CB6
	ldr r1, [r4, #8]
	asr r0, r1, #4
	lsr r0, r0, #0x1b
	add r0, r1, r0
	asr r1, r0, #5
	add r0, r4, #0
	add r0, #0x22
	strb r1, [r0]
	ldr r1, [r4, #0xc]
	asr r0, r1, #4
	lsr r0, r0, #0x1b
	add r0, r1, r0
	asr r1, r0, #5
	add r0, r4, #0
	add r0, #0x23
	strb r1, [r0]
	b _02092CC8
_02092CB6:
	add r0, r4, #0
	add r0, #0x22
	strb r1, [r0]
	add r1, sp, #8
	mov r0, #0
	ldrsh r1, [r1, r0]
	add r0, r4, #0
	add r0, #0x23
	strb r1, [r0]
_02092CC8:
	add r1, r4, #0
	add r2, r4, #0
	add r1, #0x22
	add r2, #0x23
	ldrb r1, [r1]
	ldrb r2, [r2]
	add r0, r6, #0
	bl MapMatrix_GetMapHeader
	strh r0, [r4, #0x12]
	add r0, r6, #0
	bl MapMatrix_Free
_02092CE2:
	add r0, r5, #0
	bl ScriptEnvironment_GetSav2Ptr
	bl Sav2_PlayerData_GetProfileAddr
	bl PlayerProfile_GetTrainerGender
	strb r0, [r4, #7]
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r5, r0
	str r0, [r4, #0x28]
	add r0, r5, #0
	bl sub_0203DF3C
	strb r0, [r4, #1]
	ldrh r1, [r4, #0x10]
	add r0, r5, #0
	bl sub_02054F60
	strh r0, [r4, #2]
	ldr r0, [sp]
	cmp r0, #0
	bne _02092D7A
	add r0, r7, #0
	bl sub_02092E08
	cmp r0, #0
	beq _02092D76
	add r0, r7, #0
	add r1, sp, #0xc
	bl ov02_02251EE8
	strb r0, [r4, #4]
	ldrb r0, [r4, #4]
	cmp r0, #0x4b
	blo _02092D34
	mov r0, #0
	add sp, #0x14
	strb r0, [r4]
	pop {r4, r5, r6, r7, pc}
_02092D34:
	add r0, sp, #8
	ldrb r1, [r0, #8]
	strb r1, [r4, #6]
	ldrb r0, [r0, #7]
	strb r0, [r4, #5]
	cmp r0, #3
	bne _02092D52
	ldr r0, [r5, #0xc]
	bl SaveData_GetPhoneRematches
	add r1, sp, #8
	ldrb r1, [r1, #6]
	bl sub_0202F050
	b _02092D68
_02092D52:
	cmp r0, #0
	bne _02092D68
	ldr r0, [r5, #0xc]
	bl Sav2_Misc_get
	add r2, sp, #8
	ldrb r1, [r2, #4]
	ldrb r2, [r2, #5]
	ldrb r3, [r4, #4]
	bl sub_0202AB18
_02092D68:
	add r0, r7, #0
	bl sub_02092F64
	mov r0, #1
	add sp, #0x14
	strb r0, [r4]
	pop {r4, r5, r6, r7, pc}
_02092D76:
	mov r0, #0
	strb r0, [r4]
_02092D7A:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02092BE8

	thumb_func_start sub_02092D80
sub_02092D80: ; 0x02092D80
	ldr r3, _02092D88 ; =sub_02092BE8
	mov r2, #0
	bx r3
	nop
_02092D88: .word sub_02092BE8
	thumb_func_end sub_02092D80

	thumb_func_start sub_02092D8C
sub_02092D8C: ; 0x02092D8C
	ldr r3, _02092D94 ; =sub_02092BE8
	mov r2, #1
	bx r3
	nop
_02092D94: .word sub_02092BE8
	thumb_func_end sub_02092D8C

	thumb_func_start sub_02092D98
sub_02092D98: ; 0x02092D98
	push {r3, r4, r5, lr}
	add r5, r1, #0
	mov r1, #0x48
	bl AllocFromHeap
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x48
	bl MI_CpuFill8
	add r0, r4, #0
	bl sub_02092F64
	mov r0, #0xa
	str r0, [r4, #0xc]
	mov r0, #0x1e
	strh r0, [r4, #0x10]
	mov r0, #0x32
	strh r0, [r4, #0x12]
	ldr r0, [r5, #0xc]
	str r0, [r4, #0x38]
	bl SaveData_GSPlayerMisc_get
	str r0, [r4, #0x30]
	ldr r0, [r4, #0x38]
	bl SaveData_GetPhoneRematches
	str r0, [r4, #0x34]
	str r5, [r4, #0x3c]
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02092D98

	thumb_func_start sub_02092DD8
sub_02092DD8: ; 0x02092DD8
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x48
	bl MI_CpuFill8
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end sub_02092DD8

	; r0 = FieldSystem *
	thumb_func_start sub_02092DEC
sub_02092DEC: ; 0x02092DEC
	mov r1, #0x45
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	bx lr
	thumb_func_end sub_02092DEC

	thumb_func_start sub_02092DF4
sub_02092DF4: ; 0x02092DF4
	ldrb r2, [r0]
	mov r1, #1
	bic r2, r1
	mov r1, #1
	orr r1, r2
	strb r1, [r0]
	mov r1, #0
	str r1, [r0, #0x14]
	str r1, [r0, #0x18]
	bx lr
	thumb_func_end sub_02092DF4

	thumb_func_start sub_02092E08
sub_02092E08: ; 0x02092E08
	ldrb r0, [r0]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	bx lr
	thumb_func_end sub_02092E08

	thumb_func_start sub_02092E10
sub_02092E10: ; 0x02092E10
	add r0, #0x1c
	bx lr
	thumb_func_end sub_02092E10

	thumb_func_start sub_02092E14
sub_02092E14: ; 0x02092E14
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x34]
	add r5, r2, #0
	bl sub_0202F01C
	cmp r5, #0
	beq _02092E30
	ldr r0, [r4, #0xc]
	sub r1, r0, #1
	ldr r0, [r4, #8]
	cmp r0, r1
	bge _02092E30
	str r1, [r4, #8]
_02092E30:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02092E14

	thumb_func_start sub_02092E34
sub_02092E34: ; 0x02092E34
	push {r3, lr}
	ldrb r3, [r0]
	lsl r2, r3, #0x1d
	lsr r2, r2, #0x1f
	bne _02092E48
	mov r2, #4
	orr r2, r3
	strb r2, [r0]
	cmp r1, #0xa
	bge _02092E52
_02092E48:
	ldr r2, [r0, #8]
	add r1, r2, r1
	str r1, [r0, #8]
	bl sub_02092E54
_02092E52:
	pop {r3, pc}
	thumb_func_end sub_02092E34

	thumb_func_start sub_02092E54
sub_02092E54: ; 0x02092E54
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x38]
	bl SavArray_Flags_get
	add r5, r0, #0
	ldr r0, [r4, #0x38]
	bl Save_SafariZone_get
	add r7, r0, #0
	ldr r0, [r4, #0x38]
	bl Sav2_PlayerData_GetIGTAddr
	str r0, [sp]
	add r0, r5, #0
	bl sub_02066E74
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	mov r5, #0
_02092E7C:
	add r1, r5, #7
	lsl r1, r1, #0x18
	ldr r0, [r4, #0x34]
	lsr r1, r1, #0x18
	bl sub_0202F08C
	cmp r0, #0
	bne _02092F2E
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #5
	blo _02092E7C
	add r0, r7, #0
	bl sub_0202F720
	add r5, r0, #0
	cmp r6, #3
	blo _02092F2E
	cmp r5, #4
	bhs _02092F2E
	cmp r6, #3
	bne _02092EC4
	ldr r1, [sp]
	add r0, r7, #0
	mov r2, #3
	bl sub_0202F798
	cmp r0, #0
	beq _02092F2E
	add r0, r4, #0
	mov r1, #7
	mov r2, #1
	bl sub_02092E14
	pop {r3, r4, r5, r6, r7, pc}
_02092EC4:
	cmp r6, #6
	blo _02092F2E
	ldr r0, [r4, #0x38]
	bl Sav2_Pokedex_get
	bl Pokedex_GetNatDexFlag
	cmp r0, #0
	beq _02092F2E
	ldr r1, [sp]
	add r0, r7, #0
	mov r2, #3
	bl sub_0202F798
	cmp r0, #0
	beq _02092F2E
	cmp r0, #1
	bls _02092F04
	cmp r5, #3
	bhs _02092EF8
	add r0, r4, #0
	mov r1, #0xb
	mov r2, #1
	bl sub_02092E14
	pop {r3, r4, r5, r6, r7, pc}
_02092EF8:
	add r0, r4, #0
	mov r1, #0xa
	mov r2, #1
	bl sub_02092E14
	pop {r3, r4, r5, r6, r7, pc}
_02092F04:
	cmp r5, #0
	bne _02092F14
	add r0, r4, #0
	mov r1, #8
	mov r2, #1
	bl sub_02092E14
	pop {r3, r4, r5, r6, r7, pc}
_02092F14:
	cmp r5, #3
	bne _02092F24
	add r0, r4, #0
	mov r1, #0xa
	mov r2, #1
	bl sub_02092E14
	pop {r3, r4, r5, r6, r7, pc}
_02092F24:
	add r0, r4, #0
	mov r1, #9
	mov r2, #1
	bl sub_02092E14
_02092F2E:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02092E54

	thumb_func_start sub_02092F30
sub_02092F30: ; 0x02092F30
	push {r4, r5, r6, lr}
	ldrb r3, [r0]
	lsl r3, r3, #0x1f
	lsr r3, r3, #0x1f
	beq _02092F62
	ldr r3, [r0, #0x14]
	mov r4, #0
	ldr r6, [r0, #0x18]
	mov r5, #0
	eor r5, r6
	eor r4, r3
	orr r4, r5
	bne _02092F50
	str r1, [r0, #0x14]
	str r2, [r0, #0x18]
	pop {r4, r5, r6, pc}
_02092F50:
	sub r2, r1, r3
	bmi _02092F5E
	ldrh r1, [r0, #0x10]
	cmp r2, r1
	bgt _02092F5E
	cmp r2, #0x3b
	ble _02092F62
_02092F5E:
	bl sub_02092FA0
_02092F62:
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02092F30

	thumb_func_start sub_02092F64
sub_02092F64: ; 0x02092F64
	push {r4, lr}
	mov r1, #0
	add r4, r0, #0
	bl sub_02093010
	mov r0, #0
	str r0, [r4, #8]
	str r0, [r4, #0x14]
	str r0, [r4, #0x18]
	ldrb r2, [r4]
	mov r1, #1
	bic r2, r1
	strb r2, [r4]
	ldrb r2, [r4]
	mov r1, #2
	bic r2, r1
	strb r2, [r4]
	ldrb r2, [r4]
	mov r1, #8
	bic r2, r1
	strb r2, [r4]
	mov r1, #0xff
	strb r1, [r4, #2]
	strb r0, [r4, #3]
	strb r0, [r4, #4]
	strb r0, [r4, #7]
	strb r1, [r4, #0x1c]
	mov r0, #0x32
	strh r0, [r4, #0x12]
	pop {r4, pc}
	thumb_func_end sub_02092F64

	thumb_func_start sub_02092FA0
sub_02092FA0: ; 0x02092FA0
	ldr r3, _02092FA4 ; =sub_02092F64
	bx r3
	.balign 4, 0
_02092FA4: .word sub_02092F64
	thumb_func_end sub_02092FA0

	thumb_func_start sub_02092FA8
sub_02092FA8: ; 0x02092FA8
	push {r3, lr}
	ldrb r1, [r0]
	lsl r1, r1, #0x1f
	lsr r1, r1, #0x1f
	beq _02092FB6
	bl sub_02092F64
_02092FB6:
	pop {r3, pc}
	thumb_func_end sub_02092FA8

	thumb_func_start sub_02092FB8
sub_02092FB8: ; 0x02092FB8
	push {r4, lr}
	add r4, r1, #0
	add r0, r4, #0
	add r0, #0x44
	ldrb r2, [r0]
	add r0, r4, #0
	add r0, #0x44
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x44
	strb r1, [r0]
	cmp r2, #0
	bne _02092FFA
	ldr r0, _0209300C ; =0x00000879
	bl sub_02006184
	cmp r0, #0
	bne _02092FE8
	ldr r0, _0209300C ; =0x00000879
	mov r1, #0
	bl sub_02006134
	b _02092FFA
_02092FE8:
	add r0, r4, #0
	add r0, #0x44
	ldrb r0, [r0]
	cmp r0, #0xf
	bhs _02092FFA
	add r0, r4, #0
	mov r1, #0xf
	add r0, #0x44
	strb r1, [r0]
_02092FFA:
	add r0, r4, #0
	add r0, #0x44
	ldrb r0, [r0]
	cmp r0, #0x1e
	blo _0209300A
	mov r0, #0
	add r4, #0x44
	strb r0, [r4]
_0209300A:
	pop {r4, pc}
	.balign 4, 0
_0209300C: .word 0x00000879
	thumb_func_end sub_02092FB8

	thumb_func_start sub_02093010
sub_02093010: ; 0x02093010
	push {r4, lr}
	add r4, r0, #0
	cmp r1, #0
	ldrb r0, [r4]
	beq _02093044
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1f
	bne _02093068
	add r0, r4, #0
	add r0, #0x40
	mov r1, #0
	mov r2, #8
	bl MI_CpuFill8
	mov r2, #0
	ldr r0, _0209306C ; =sub_02092FB8
	add r1, r4, #0
	mvn r2, r2
	bl sub_0200E320
	str r0, [r4, #0x40]
	ldrb r1, [r4]
	mov r0, #8
	orr r0, r1
	strb r0, [r4]
	pop {r4, pc}
_02093044:
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1f
	beq _02093068
	ldr r0, [r4, #0x40]
	cmp r0, #0
	beq _02093054
	bl sub_0200E390
_02093054:
	add r0, r4, #0
	add r0, #0x40
	mov r1, #0
	mov r2, #8
	bl MI_CpuFill8
	ldrb r1, [r4]
	mov r0, #8
	bic r1, r0
	strb r1, [r4]
_02093068:
	pop {r4, pc}
	nop
_0209306C: .word sub_02092FB8
	thumb_func_end sub_02093010

	thumb_func_start sub_02093070
sub_02093070: ; 0x02093070
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	bl SaveData_GSPlayerMisc_get
	mov r1, #9
	bl GSPlayerMisc_IsGearNumberRegistered
	cmp r0, #0xff
	bne _02093088
	mov r0, #0
	pop {r4, pc}
_02093088:
	ldr r0, [r4, #0xc]
	bl SavArray_Flags_get
	ldr r1, _020930C0 ; =0x00000985
	bl CheckFlagInArray
	cmp r0, #0
	beq _0209309C
	mov r0, #0
	pop {r4, pc}
_0209309C:
	ldr r0, [r4, #0xc]
	bl GetStoragePCPointer
	bl PCStorage_CountEmptySpotsInAllBoxes
	cmp r0, #0
	beq _020930AE
	mov r0, #0
	pop {r4, pc}
_020930AE:
	add r0, r4, #0
	bl sub_02092DEC
	mov r1, #3
	mov r2, #1
	bl sub_02092E14
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_020930C0: .word 0x00000985
	thumb_func_end sub_02093070

	thumb_func_start sub_020930C4
sub_020930C4: ; 0x020930C4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	bl Sav2_Pokedex_get
	bl Pokedex_CountNationalDexOwned
	add r6, r0, #0
	ldr r0, [r5, #0xc]
	bl SavArray_Flags_get
	add r4, r0, #0
	ldr r0, [r5, #0xc]
	bl SaveData_GSPlayerMisc_get
	mov r1, #2
	bl GSPlayerMisc_IsGearNumberRegistered
	cmp r0, #0xff
	bne _020930F0
	mov r0, #0
	pop {r4, r5, r6, pc}
_020930F0:
	add r0, r6, #0
	mov r1, #0x32
	bl _s32_div_f
	lsl r0, r0, #0x10
	lsr r2, r0, #0x10
	bne _02093102
	mov r0, #0
	pop {r4, r5, r6, pc}
_02093102:
	cmp r2, #9
	bls _02093108
	mov r2, #9
_02093108:
	ldr r1, _02093130 ; =0x00000988
	add r0, r4, #0
	add r1, r2, r1
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl CheckFlagInArray
	cmp r0, #0
	bne _0209312C
	add r0, r5, #0
	bl sub_02092DEC
	mov r1, #4
	mov r2, #0
	bl sub_02092E14
	mov r0, #1
	pop {r4, r5, r6, pc}
_0209312C:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02093130: .word 0x00000988
	thumb_func_end sub_020930C4

	thumb_func_start sub_02093134
sub_02093134: ; 0x02093134
	push {r4, lr}
	add r4, r0, #0
	add r0, r1, #0
	ldr r1, [r4, #0xc]
	bl sub_0206D8D0
	cmp r0, #0
	bne _02093148
	mov r0, #0
	pop {r4, pc}
_02093148:
	add r0, r4, #0
	bl sub_02092DEC
	mov r1, #0
	mov r2, #1
	bl sub_02092E14
	ldr r0, [r4, #0xc]
	bl SavArray_Flags_get
	ldr r1, _02093168 ; =0x00000983
	bl SetFlagInArray
	mov r0, #1
	pop {r4, pc}
	nop
_02093168: .word 0x00000983
	thumb_func_end sub_02093134

	thumb_func_start sub_0209316C
sub_0209316C: ; 0x0209316C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	bl SavArray_Flags_get
	add r4, r0, #0
	ldr r0, [r5, #0xc]
	bl SaveData_GSPlayerMisc_get
	mov r1, #6
	bl GSPlayerMisc_IsGearNumberRegistered
	cmp r0, #0xff
	bne _0209318C
	mov r0, #0
	pop {r3, r4, r5, pc}
_0209318C:
	ldr r1, _020931BC ; =0x00000992
	add r0, r4, #0
	bl CheckFlagInArray
	cmp r0, #0
	beq _020931A8
	ldr r1, _020931C0 ; =0x0000099E
	add r0, r4, #0
	bl CheckFlagInArray
	cmp r0, #0
	bne _020931A8
	mov r0, #0
	pop {r3, r4, r5, pc}
_020931A8:
	add r0, r5, #0
	bl sub_02092DEC
	mov r1, #5
	mov r2, #1
	bl sub_02092E14
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_020931BC: .word 0x00000992
_020931C0: .word 0x0000099E
	thumb_func_end sub_0209316C

	thumb_func_start sub_020931C4
sub_020931C4: ; 0x020931C4
	push {r3, r4, r5, r6, r7, lr}
	mov r7, #0
	ldr r4, _02093228 ; =_02108374
	add r5, r0, #0
	str r1, [sp]
	add r6, r7, #0
_020931D0:
	lsl r1, r6, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl sub_0202F1B4
	cmp r0, #0
	bne _02093212
	ldrh r1, [r4, #2]
	ldr r0, [sp]
	cmp r0, r1
	blo _0209321A
	lsl r1, r6, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl sub_0202F198
	ldrh r1, [r4]
	add r0, r5, #0
	mov r2, #1
	bl sub_0202F1C4
	ldrh r2, [r4, #4]
	add r0, r5, #0
	mov r1, #3
	bl MomSavingsBalanceAction
	str r0, [sp]
	add r0, r5, #0
	add r7, r7, #1
	bl sub_0202F240
	cmp r0, #0
	bne _0209321A
_02093212:
	add r6, r6, #1
	add r4, r4, #6
	cmp r6, #9
	blt _020931D0
_0209321A:
	cmp r7, #0
	beq _02093222
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02093222:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02093228: .word _02108374
	thumb_func_end sub_020931C4

	thumb_func_start sub_0209322C
sub_0209322C: ; 0x0209322C
	push {r4, r5, r6, lr}
	add r4, r0, #0
	add r5, r1, #0
	add r6, r2, #0
	bl sub_0202F240
	cmp r0, #0
	beq _02093240
	mov r0, #0
	pop {r4, r5, r6, pc}
_02093240:
	add r0, r4, #0
	add r1, r5, #0
	bl sub_020931C4
	cmp r0, #0
	beq _02093250
	mov r0, #1
	pop {r4, r5, r6, pc}
_02093250:
	ldr r1, _0209329C ; =0x00000BB8
	add r0, r5, #0
	bl _u32_div_f
	add r5, r0, #0
	ldr r1, _0209329C ; =0x00000BB8
	add r0, r6, #0
	bl _u32_div_f
	cmp r5, r0
	bhi _0209326A
	mov r0, #0
	pop {r4, r5, r6, pc}
_0209326A:
	bl LCRandom
	mov r1, #0x11
	bl _s32_div_f
	lsl r0, r1, #1
	add r1, r1, r0
	ldr r2, _020932A0 ; =_02108340
	add r0, r4, #0
	add r5, r2, r1
	ldrb r1, [r2, r1]
	ldrb r2, [r5, #1]
	add r1, #0x95
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl sub_0202F1C4
	ldrb r2, [r5, #2]
	add r0, r4, #0
	mov r1, #3
	bl MomSavingsBalanceAction
	mov r0, #1
	pop {r4, r5, r6, pc}
	nop
_0209329C: .word 0x00000BB8
_020932A0: .word _02108340
	thumb_func_end sub_0209322C

	thumb_func_start PhoneBookTrainerGetRematchInfo
PhoneBookTrainerGetRematchInfo: ; 0x020932A4
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	add r6, r2, #0
	add r7, r3, #0
	bl SaveData_GetPhoneRematches
	add r1, r5, #0
	bl PhoneRematches_IsSeeking
	cmp r0, #0
	bne _020932C2
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_020932C2:
	cmp r5, #0x10
	bne _020932CE
	cmp r7, #1
	beq _020932CE
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_020932CE:
	mov r1, #0x14
	ldr r2, [r6, #4]
	mul r1, r5
	add r1, r2, r1
	ldrh r1, [r1, #4]
	add r0, r4, #0
	bl TryGetRematchTrainerIdByBaseTrainerId
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end PhoneBookTrainerGetRematchInfo

	thumb_func_start sub_020932E0
sub_020932E0: ; 0x020932E0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	ldr r1, _02093348 ; =0x000046E8
	add r6, r0, #0
	add r7, r2, #0
	bl AllocFromHeap
	ldr r2, _02093348 ; =0x000046E8
	mov r1, #0
	add r4, r0, #0
	bl memset
	cmp r5, #0
	bne _02093300
	bl GF_AssertFail
_02093300:
	str r6, [r4, #4]
	strb r5, [r4, #0xd]
	strb r7, [r4, #0x10]
	ldrb r0, [r4, #0xd]
	cmp r0, #3
	bls _02093314
	bl GF_AssertFail
	mov r0, #3
	strb r0, [r4, #0xd]
_02093314:
	ldrb r2, [r4, #0xd]
	mov r1, #0xc
	ldr r0, [r4, #4]
	mul r1, r2
	bl AllocFromHeap
	mov r1, #0x8d
	lsl r1, r1, #4
	str r0, [r4, r1]
	ldrb r1, [r4, #0xd]
	ldr r0, [r4, #4]
	add r1, #0x22
	lsl r1, r1, #2
	bl AllocFromHeap
	ldr r1, _0209334C ; =0x000007E4
	str r0, [r4, r1]
	add r1, r4, #0
	ldr r0, [r4, #4]
	add r1, #0xf
	bl sub_02095CE0
	ldr r1, _02093350 ; =0x000046B8
	str r0, [r4, r1]
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02093348: .word 0x000046E8
_0209334C: .word 0x000007E4
_02093350: .word 0x000046B8
	thumb_func_end sub_020932E0

	thumb_func_start sub_02093354
sub_02093354: ; 0x02093354
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, _0209341C ; =0x000046B8
	ldr r0, [r5, r0]
	bl sub_02095D2C
	add r0, r5, #0
	bl sub_0209515C
	ldr r0, _02093420 ; =0x00004650
	mov r1, #1
	add r0, r5, r0
	bl sub_020950F8
	ldr r0, _02093424 ; =0x00004670
	add r0, r5, r0
	bl RemoveWindow
	add r0, r5, #0
	bl sub_020950D4
	ldr r0, _02093428 ; =0x000046C8
	ldr r0, [r5, r0]
	bl FreeToHeap
	ldr r0, _0209342C ; =0x000046CC
	ldr r0, [r5, r0]
	bl FreeToHeap
	mov r0, #0x57
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_0200AEB0
	mov r0, #0x16
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl sub_0200B0A8
	mov r7, #0x51
	mov r6, #0
	add r4, r5, #0
	lsl r7, r7, #2
_020933AA:
	ldr r0, [r4, r7]
	bl sub_0200A0D0
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #6
	blt _020933AA
	ldr r0, [r5, #0x18]
	bl sub_02024504
	ldr r0, _02093430 ; =0x000046A4
	ldr r0, [r5, r0]
	bl FreeToHeap
	ldr r0, [r5, #8]
	bl sub_02016624
	ldr r0, _02093434 ; =0x000007E4
	ldr r0, [r5, r0]
	bl FreeToHeap
	mov r0, #0x8d
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl FreeToHeap
	mov r0, #4
	bl sub_02002DB4
	ldr r0, _02093438 ; =gMain + 0x60
	mov r1, #0
	strb r1, [r0, #9]
	bl GX_SwapDisplay
	ldr r0, _0209343C ; =0x04000050
	mov r1, #0
	strh r1, [r0]
	ldr r0, [r5]
	bl FreeBgTilemapBuffer
	ldr r0, [r5]
	mov r1, #1
	bl FreeBgTilemapBuffer
	ldr r0, [r5]
	mov r1, #2
	bl FreeBgTilemapBuffer
	ldr r0, [r5]
	mov r1, #3
	bl FreeBgTilemapBuffer
	add r0, r5, #0
	bl FreeToHeap
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0209341C: .word 0x000046B8
_02093420: .word 0x00004650
_02093424: .word 0x00004670
_02093428: .word 0x000046C8
_0209342C: .word 0x000046CC
_02093430: .word 0x000046A4
_02093434: .word 0x000007E4
_02093438: .word gMain + 0x60
_0209343C: .word 0x04000050
	thumb_func_end sub_02093354

	thumb_func_start sub_02093440
sub_02093440: ; 0x02093440
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	ldr r0, [r5, #4]
	add r4, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	bl sub_0201660C
	str r0, [r5, #8]
	ldr r0, _02093580 ; =0x0000463C
	ldr r2, [sp, #0x48]
	str r6, [r5, r0]
	add r1, r0, #4
	str r7, [r5, r1]
	add r1, r0, #0
	str r4, [r5]
	add r1, #0xa0
	str r2, [r5, r1]
	add r1, r0, #0
	ldr r2, [sp, #0x44]
	add r1, #0x9c
	str r2, [r5, r1]
	ldr r1, [sp, #0x34]
	mov r2, #0
	strb r1, [r5, #0xf]
	add r1, r0, #0
	mvn r2, r2
	add r1, #0xa8
	str r2, [r5, r1]
	add r0, #0xa4
	str r2, [r5, r0]
	ldr r0, [sp, #0x30]
	strb r0, [r5, #0x13]
	ldr r0, [r5]
	ldr r1, [r5, #4]
	bl sub_02094D9C
	add r0, r5, #0
	bl sub_02093A50
	add r0, r5, #0
	bl sub_02093B40
	add r0, r5, #0
	bl sub_02094004
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	ldr r1, [r5, #4]
	mov r0, #4
	bl sub_02002CEC
	mov r1, #0x1a
	ldr r2, [r5, #4]
	mov r0, #0
	lsl r1, r1, #4
	bl sub_02003030
	mov r1, #6
	ldr r2, [r5, #4]
	mov r0, #0
	lsl r1, r1, #6
	bl sub_02003030
	ldr r0, [sp, #0x28]
	ldr r1, [sp, #0x30]
	strb r0, [r5, #0x11]
	ldr r0, [sp, #0x2c]
	lsl r1, r1, #0x18
	strb r0, [r5, #0x12]
	ldr r0, _02093584 ; =0x000046B8
	lsr r1, r1, #0x18
	ldr r0, [r5, r0]
	bl sub_02095D1C
	ldr r0, _02093584 ; =0x000046B8
	mov r1, #2
	ldr r0, [r5, r0]
	mov r2, #0
	bl sub_02095D40
	add r0, r5, #0
	bl sub_02093B84
	ldr r0, [sp, #0x38]
	ldr r1, _02093588 ; =0x00004648
	ldr r2, [sp, #0x3c]
	str r0, [r5, r1]
	add r0, r1, #4
	str r2, [r5, r0]
	mov r2, #1
	add r1, #8
	str r2, [sp]
	mov r3, #0xd
	str r3, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	mov r0, #0xa0
	str r0, [sp, #0x10]
	ldr r0, [r5]
	add r1, r5, r1
	mov r3, #4
	bl AddWindowParameterized
	mov r0, #0x15
	str r0, [sp]
	mov r0, #6
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0xc
	str r0, [sp, #0xc]
	mov r0, #0xba
	ldr r1, _0209358C ; =0x00004670
	str r0, [sp, #0x10]
	ldr r0, [r5]
	add r1, r5, r1
	mov r2, #1
	mov r3, #0x19
	bl AddWindowParameterized
	add r0, r5, #0
	bl sub_02094D1C
	ldr r1, [r5]
	ldr r2, [r5, #4]
	add r0, r5, #0
	bl sub_020941CC
	add r0, r5, #0
	bl sub_020942B0
	add r0, r5, #0
	bl sub_020943EC
	add r0, r5, #0
	bl sub_020950C0
	bl sub_02095794
	ldr r0, [sp, #0x40]
	ldr r1, _02093590 ; =0x000046B4
	mov r2, #0
	str r0, [r5, r1]
	add r0, r1, #0
	str r2, [r5, #0x14]
	add r0, #8
	str r2, [r5, r0]
	add r0, r1, #0
	add r0, #0xc
	str r2, [r5, r0]
	add r1, #0x10
	str r2, [r5, r1]
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_02093580: .word 0x0000463C
_02093584: .word 0x000046B8
_02093588: .word 0x00004648
_0209358C: .word 0x00004670
_02093590: .word 0x000046B4
	thumb_func_end sub_02093440

	thumb_func_start sub_02093594
sub_02093594: ; 0x02093594
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _020935D0 ; =0x00004644
	ldr r1, [r4, r0]
	cmp r1, #0
	beq _020935B2
	ldr r0, _020935D4 ; =0x000008D4
	add r0, r4, r0
	blx r1
	ldr r0, _020935D0 ; =0x00004644
	mov r1, #0
	str r1, [r4, r0]
	add r0, r4, #0
	bl sub_020956B8
_020935B2:
	bl sub_0202061C
	bl sub_0200B224
	ldr r0, [r4]
	bl BgConfig_HandleScheduledScrollAndTransferOps
	ldr r3, _020935D8 ; =OS_IRQTable
	ldr r1, _020935DC ; =0x00003FF8
	mov r0, #1
	ldr r2, [r3, r1]
	orr r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	nop
_020935D0: .word 0x00004644
_020935D4: .word 0x000008D4
_020935D8: .word OS_IRQTable
_020935DC: .word 0x00003FF8
	thumb_func_end sub_02093594

	thumb_func_start sub_020935E0
sub_020935E0: ; 0x020935E0
	push {r3, lr}
	ldr r1, [r0, #0x14]
	cmp r1, #6
	bhi _0209362E
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_020935F4: ; jump table
	.short _02093602 - _020935F4 - 2 ; case 0
	.short _02093608 - _020935F4 - 2 ; case 1
	.short _02093610 - _020935F4 - 2 ; case 2
	.short _0209362E - _020935F4 - 2 ; case 3
	.short _02093618 - _020935F4 - 2 ; case 4
	.short _02093620 - _020935F4 - 2 ; case 5
	.short _02093628 - _020935F4 - 2 ; case 6
_02093602:
	bl sub_02093630
	pop {r3, pc}
_02093608:
	bl sub_0209389C
	mov r0, #0
	pop {r3, pc}
_02093610:
	bl sub_02093908
	mov r0, #0
	pop {r3, pc}
_02093618:
	bl sub_0209396C
	mov r0, #0
	pop {r3, pc}
_02093620:
	bl sub_020939B8
	mov r0, #0
	pop {r3, pc}
_02093628:
	bl sub_0209511C
	mov r0, #2
_0209362E:
	pop {r3, pc}
	thumb_func_end sub_020935E0

	thumb_func_start sub_02093630
sub_02093630: ; 0x02093630
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	mov r4, #0
	add r5, r0, #0
	str r4, [sp]
	bl sub_0202534C
	cmp r0, #0
	bne _02093714
	ldr r0, _02093874 ; =0x000046C0
	ldr r1, [r5, r0]
	cmp r1, #0
	bne _02093714
	ldr r1, _02093878 ; =gMain
	ldr r4, [r1, #0x48]
	cmp r4, #0
	beq _02093714
	sub r0, #8
	ldr r0, [r5, r0]
	mov r7, #0
	add r6, r7, #0
	bl sub_02095DD8
	cmp r4, #0x20
	bgt _0209367A
	bge _02093688
	cmp r4, #2
	bgt _02093674
	cmp r4, #1
	blt _020936EE
	beq _020936C0
	cmp r4, #2
	beq _020936D8
	b _020936EE
_02093674:
	cmp r4, #0x10
	beq _0209369C
	b _020936EE
_0209367A:
	cmp r4, #0x40
	bgt _02093682
	beq _020936B0
	b _020936EE
_02093682:
	cmp r4, #0x80
	beq _020936B8
	b _020936EE
_02093688:
	cmp r0, #5
	bne _02093694
	add r0, r5, #0
	bl sub_02095540
	b _020936EE
_02093694:
	sub r0, r7, #1
	lsl r0, r0, #0x18
	asr r7, r0, #0x18
	b _020936EE
_0209369C:
	cmp r0, #5
	bne _020936A8
	add r0, r5, #0
	bl sub_020955EC
	b _020936EE
_020936A8:
	add r0, r7, #1
	lsl r0, r0, #0x18
	asr r7, r0, #0x18
	b _020936EE
_020936B0:
	sub r0, r6, #1
	lsl r0, r0, #0x18
	asr r6, r0, #0x18
	b _020936EE
_020936B8:
	add r0, r6, #1
	lsl r0, r0, #0x18
	asr r6, r0, #0x18
	b _020936EE
_020936C0:
	add r0, r5, #0
	bl sub_02095354
	str r0, [sp]
	cmp r0, #0
	beq _020936EE
	cmp r0, #3
	beq _020936EE
	ldr r0, _0209387C ; =0x000005DD
	bl PlaySE
	b _020936EE
_020936D8:
	add r0, r5, #0
	bl sub_020954CC
	str r0, [sp]
	cmp r0, #0
	beq _020936EE
	cmp r0, #3
	beq _020936EE
	ldr r0, _0209387C ; =0x000005DD
	bl PlaySE
_020936EE:
	cmp r7, #0
	bne _020936F6
	cmp r6, #0
	beq _02093714
_020936F6:
	ldr r0, _02093880 ; =0x000046B8
	add r1, r7, #0
	ldr r0, [r5, r0]
	add r2, r6, #0
	bl sub_02095D88
	add r6, r0, #0
	add r0, r5, #0
	bl sub_02095238
	cmp r6, #0
	beq _02093714
	ldr r0, _02093884 ; =0x000005DC
	bl PlaySE
_02093714:
	cmp r4, #0
	bne _02093720
	ldr r0, _02093888 ; =0x000046BC
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _02093722
_02093720:
	b _02093860
_02093722:
	bl sub_02025358
	cmp r0, #0
	bne _0209372C
	b _02093832
_0209372C:
	ldr r0, _0209388C ; =0x00004680
	ldr r1, [r5, r0]
	cmp r1, #0
	bne _02093832
	mov r1, #1
	add r0, #0x44
	str r1, [r5, r0]
	ldr r0, _02093890 ; =0x000007E4
	ldr r0, [r5, r0]
	bl sub_02025224
	add r4, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	beq _0209382A
	cmp r4, #0x1e
	bge _0209378A
	ldrb r0, [r5, #0xf]
	cmp r0, #0x12
	bne _0209375A
	cmp r4, #6
	bge _02093824
_0209375A:
	ldr r0, _02093880 ; =0x000046B8
	lsl r2, r4, #0x18
	ldr r0, [r5, r0]
	mov r1, #2
	lsr r2, r2, #0x18
	bl sub_02095D40
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02094794
	cmp r0, #1
	bne _02093824
	ldr r0, _02093894 ; =0x000005EB
	bl PlaySE
	add r0, r5, #0
	mov r1, #1
	add r2, r4, #0
	bl sub_020948C4
	mov r0, #1
	str r0, [sp]
	b _02093824
_0209378A:
	cmp r4, #0x21
	blt _020937CE
	ldrb r0, [r5, #0xd]
	add r0, #0x21
	cmp r4, r0
	bge _020937CE
	ldr r0, _02093880 ; =0x000046B8
	add r2, r4, #0
	sub r2, #0x21
	lsl r2, r2, #0x18
	ldr r0, [r5, r0]
	mov r1, #3
	lsr r2, r2, #0x18
	bl sub_02095D40
	add r1, r4, #0
	add r0, r5, #0
	sub r1, #0x21
	bl sub_02094860
	cmp r0, #1
	bne _02093824
	ldr r0, _02093894 ; =0x000005EB
	bl PlaySE
	sub r4, #0x21
	add r0, r5, #0
	mov r1, #2
	add r2, r4, #0
	bl sub_020948C4
	mov r0, #1
	str r0, [sp]
	b _02093824
_020937CE:
	cmp r4, #0x1e
	beq _020937EC
	cmp r4, #0x1f
	beq _020937DC
	cmp r4, #0x20
	beq _020937E4
	b _02093824
_020937DC:
	add r0, r5, #0
	bl sub_02095540
	b _02093824
_020937E4:
	add r0, r5, #0
	bl sub_020955EC
	b _02093824
_020937EC:
	ldrb r0, [r5, #0x13]
	cmp r0, #0
	beq _02093824
	mov r0, #0xe
	lsl r0, r0, #0x10
	str r0, [sp, #4]
	mov r0, #0xb
	lsl r0, r0, #0x10
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	mov r0, #0x23
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	add r1, sp, #4
	bl sub_020247D4
	ldr r0, _02093880 ; =0x000046B8
	mov r1, #1
	ldr r0, [r5, r0]
	mov r2, #0
	bl sub_02095D40
	add r0, r5, #0
	bl sub_0209569C
	mov r0, #3
	str r0, [sp]
_02093824:
	add r0, r5, #0
	bl sub_020956B8
_0209382A:
	ldr r0, _02093874 ; =0x000046C0
	mov r1, #1
	str r1, [r5, r0]
	b _02093860
_02093832:
	bl sub_0202534C
	cmp r0, #0
	beq _02093850
	ldr r0, _02093898 ; =0x000046C4
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _02093850
	add r0, r5, #0
	bl sub_020949F4
	ldr r0, _02093874 ; =0x000046C0
	mov r1, #1
	str r1, [r5, r0]
	b _02093860
_02093850:
	add r0, r5, #0
	bl sub_02094A70
	ldr r0, _02093874 ; =0x000046C0
	mov r1, #0
	str r1, [r5, r0]
	add r0, r0, #4
	str r1, [r5, r0]
_02093860:
	ldrb r1, [r5, #0xe]
	ldrb r0, [r5, #0xd]
	cmp r1, r0
	bne _0209386C
	mov r0, #1
	str r0, [r5, #0x14]
_0209386C:
	ldr r0, [sp]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02093874: .word 0x000046C0
_02093878: .word gMain
_0209387C: .word 0x000005DD
_02093880: .word 0x000046B8
_02093884: .word 0x000005DC
_02093888: .word 0x000046BC
_0209388C: .word 0x00004680
_02093890: .word 0x000007E4
_02093894: .word 0x000005EB
_02093898: .word 0x000046C4
	thumb_func_end sub_02093630

	thumb_func_start sub_0209389C
sub_0209389C: ; 0x0209389C
	push {r3, r4, lr}
	sub sp, #0x14
	add r4, r0, #0
	add r0, sp, #0
	mov r1, #0
	mov r2, #0x14
	bl MI_CpuFill8
	ldr r0, [r4]
	mov r1, #0x19
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #2
	lsl r0, r0, #8
	str r0, [sp, #8]
	mov r0, #8
	str r0, [sp, #0xc]
	add r0, sp, #0
	strb r1, [r0, #0x10]
	mov r1, #0xf
	strb r1, [r0, #0x11]
	ldr r0, [r4, #8]
	add r1, sp, #0
	bl sub_020166FC
	ldrb r0, [r4, #0xd]
	cmp r0, #1
	bne _020938EC
	ldr r0, _02093904 ; =0x00004660
	mov r1, #0
	add r0, r4, r0
	bl sub_020950F8
	add r0, r4, #0
	mov r1, #3
	mov r2, #1
	bl sub_0209501C
	b _020938F6
_020938EC:
	add r0, r4, #0
	mov r1, #2
	mov r2, #1
	bl sub_0209501C
_020938F6:
	bl sub_02095780
	mov r0, #2
	str r0, [r4, #0x14]
	add sp, #0x14
	pop {r3, r4, pc}
	nop
_02093904: .word 0x00004660
	thumb_func_end sub_0209389C

	thumb_func_start sub_02093908
sub_02093908: ; 0x02093908
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #8]
	bl sub_020168F4
	cmp r0, #1
	beq _0209391C
	cmp r0, #2
	beq _02093932
	pop {r4, pc}
_0209391C:
	ldr r0, _02093964 ; =0x00004660
	mov r1, #1
	add r0, r4, r0
	bl sub_020950F8
	ldr r0, [r4, #8]
	bl sub_020169CC
	mov r0, #6
	str r0, [r4, #0x14]
	pop {r4, pc}
_02093932:
	ldr r0, _02093964 ; =0x00004660
	mov r1, #1
	add r0, r4, r0
	bl sub_020950F8
	ldr r0, [r4, #8]
	bl sub_020169CC
	ldr r1, _02093968 ; =0x000046B0
	add r0, r4, #0
	ldr r1, [r4, r1]
	bl sub_02094F5C
	add r0, r4, #0
	bl sub_020950C0
	bl sub_02095794
	add r0, r4, #0
	bl sub_020956B8
	mov r0, #0
	str r0, [r4, #0x14]
	pop {r4, pc}
	nop
_02093964: .word 0x00004660
_02093968: .word 0x000046B0
	thumb_func_end sub_02093908

	thumb_func_start sub_0209396C
sub_0209396C: ; 0x0209396C
	push {r3, r4, lr}
	sub sp, #0x14
	add r4, r0, #0
	add r0, sp, #0
	mov r1, #0
	mov r2, #0x14
	bl MI_CpuFill8
	ldr r0, [r4]
	mov r1, #0x19
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #2
	lsl r0, r0, #8
	str r0, [sp, #8]
	mov r0, #8
	str r0, [sp, #0xc]
	add r0, sp, #0
	strb r1, [r0, #0x10]
	mov r1, #0xf
	strb r1, [r0, #0x11]
	ldr r0, [r4, #8]
	add r1, sp, #0
	bl sub_020166FC
	add r0, r4, #0
	mov r1, #4
	mov r2, #0
	bl sub_0209501C
	bl sub_02095780
	mov r0, #5
	str r0, [r4, #0x14]
	add sp, #0x14
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end sub_0209396C

	thumb_func_start sub_020939B8
sub_020939B8: ; 0x020939B8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #8]
	bl sub_020168F4
	cmp r0, #1
	beq _020939CC
	cmp r0, #2
	beq _02093A10
	pop {r4, pc}
_020939CC:
	ldr r0, _02093A34 ; =0x00004660
	mov r1, #1
	add r0, r4, r0
	bl sub_020950F8
	ldr r0, [r4, #8]
	bl sub_020169CC
	ldr r1, _02093A38 ; =0x00004684
	add r0, r4, #0
	ldr r1, [r4, r1]
	bl sub_02094F5C
	mov r0, #0x23
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0x2d
	bl sub_020248F0
	add r0, r4, #0
	mov r1, #2
	bl sub_02094A90
	ldr r0, _02093A3C ; =0x000046BC
	mov r1, #0
	str r1, [r4, r0]
	bl sub_02095794
	add r0, r4, #0
	bl sub_020956B8
	mov r0, #0
	str r0, [r4, #0x14]
	pop {r4, pc}
_02093A10:
	ldr r0, _02093A34 ; =0x00004660
	mov r1, #1
	add r0, r4, r0
	bl sub_020950F8
	ldr r0, [r4, #8]
	bl sub_020169CC
	add r0, r4, #0
	mov r1, #0
	bl sub_02094A90
	bl sub_02095794
	mov r0, #0
	str r0, [r4, #0x14]
	pop {r4, pc}
	nop
_02093A34: .word 0x00004660
_02093A38: .word 0x00004684
_02093A3C: .word 0x000046BC
	thumb_func_end sub_020939B8

	thumb_func_start sub_02093A40
sub_02093A40: ; 0x02093A40
	push {r3, lr}
	ldr r0, [r0, #0x18]
	cmp r0, #0
	beq _02093A4C
	bl sub_0202457C
_02093A4C:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02093A40

	thumb_func_start sub_02093A50
sub_02093A50: ; 0x02093A50
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r1, r5, #0
	ldr r2, [r5, #4]
	mov r0, #0x2b
	add r1, #0x1c
	bl sub_02009F40
	str r0, [r5, #0x18]
	add r0, r5, #0
	mov r2, #1
	add r0, #0x1c
	mov r1, #0
	lsl r2, r2, #0x14
	bl sub_02009FC8
	mov r7, #0x51
	mov r6, #0
	add r4, r5, #0
	lsl r7, r7, #2
_02093A7A:
	ldr r2, [r5, #4]
	mov r0, #3
	add r1, r6, #0
	bl sub_0200A090
	str r0, [r4, r7]
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #6
	blt _02093A7A
	mov r0, #0
	str r0, [sp]
	mov r3, #1
	str r3, [sp, #4]
	ldr r0, [r5, #4]
	mov r1, #0x97
	str r0, [sp, #8]
	mov r0, #0x51
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r2, #8
	bl sub_0200A1D8
	mov r1, #0x57
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r3, #0
	str r3, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	ldr r0, [r5, #4]
	sub r1, #0x14
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	mov r1, #0x97
	mov r2, #5
	bl sub_0200A234
	mov r1, #0x16
	lsl r1, r1, #4
	str r0, [r5, r1]
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, [r5, #4]
	sub r1, #0x14
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	mov r1, #0x97
	mov r2, #7
	mov r3, #1
	bl sub_0200A294
	mov r1, #0x59
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #0
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	ldr r0, [r5, #4]
	sub r1, #0x14
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	mov r1, #0x97
	mov r2, #6
	mov r3, #1
	bl sub_0200A294
	mov r1, #0x5a
	lsl r1, r1, #2
	str r0, [r5, r1]
	sub r1, #0xc
	ldr r0, [r5, r1]
	bl sub_0200ADA4
	mov r0, #0x16
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl sub_0200AF94
	bl sub_02074490
	add r1, r0, #0
	mov r0, #0
	str r0, [sp]
	ldr r0, [r5, #4]
	mov r2, #1
	add r3, r2, #0
	str r0, [sp, #4]
	mov r0, #0x14
	add r3, #0xff
	bl GfGfxLoader_GXLoadPal
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02093A50

	thumb_func_start sub_02093B40
sub_02093B40: ; 0x02093B40
	push {lr}
	sub sp, #0x2c
	mov r1, #0
	str r1, [sp]
	sub r2, r1, #1
	str r2, [sp, #4]
	str r2, [sp, #8]
	str r1, [sp, #0xc]
	mov r3, #0x51
	str r1, [sp, #0x10]
	lsl r3, r3, #2
	ldr r2, [r0, r3]
	str r2, [sp, #0x14]
	add r2, r3, #4
	ldr r2, [r0, r2]
	str r2, [sp, #0x18]
	add r2, r3, #0
	add r2, #8
	ldr r2, [r0, r2]
	str r2, [sp, #0x1c]
	add r2, r3, #0
	add r2, #0xc
	ldr r2, [r0, r2]
	add r3, #0x30
	str r2, [sp, #0x20]
	str r1, [sp, #0x24]
	add r0, r0, r3
	add r2, r1, #0
	add r3, r1, #0
	str r1, [sp, #0x28]
	bl sub_02009D48
	add sp, #0x2c
	pop {pc}
	thumb_func_end sub_02093B40

	thumb_func_start sub_02093B84
sub_02093B84: ; 0x02093B84
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x40
	add r5, r0, #0
	add r0, sp, #0x10
	add r1, r5, #0
	mov r2, #1
	bl sub_02094150
	ldrb r1, [r5, #0xd]
	ldr r0, [r5, #4]
	lsl r1, r1, #3
	bl AllocFromHeap
	ldr r1, _02093CD0 ; =0x000046A4
	mov r7, #0
	str r0, [r5, r1]
	ldrb r0, [r5, #0xd]
	cmp r0, #0
	ble _02093C78
	mov r0, #0x20
	str r0, [sp, #0xc]
	mov r0, #0x2c
	add r6, r7, #0
	str r7, [sp, #8]
	add r4, r5, #0
	str r0, [sp, #4]
_02093BB8:
	ldr r0, _02093CD0 ; =0x000046A4
	ldr r1, [r5, r0]
	ldr r0, [sp, #0xc]
	strb r0, [r1, r6]
	ldr r0, _02093CD0 ; =0x000046A4
	ldr r0, [r5, r0]
	add r1, r0, r6
	ldrb r0, [r0, r6]
	add r0, #0x18
	strb r0, [r1, #2]
	ldr r0, _02093CD0 ; =0x000046A4
	ldr r0, [r5, r0]
	add r1, r0, r6
	mov r0, #0xc0
	strb r0, [r1, #1]
	ldr r0, _02093CD0 ; =0x000046A4
	ldr r0, [r5, r0]
	add r1, r0, r6
	ldrb r0, [r1, #1]
	add r0, #0x20
	strb r0, [r1, #3]
	ldr r0, _02093CD0 ; =0x000046A4
	ldr r0, [r5, r0]
	add r1, r0, r6
	mov r0, #0
	str r0, [r1, #4]
	mov r0, #0x35
	lsl r0, r0, #0xe
	str r0, [sp, #0x18]
	ldr r0, [sp, #8]
	add r0, #0x28
	lsl r0, r0, #0xc
	str r0, [sp, #0x1c]
	ldr r0, _02093CD4 ; =0x000007E8
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _02093C0C
	add r0, sp, #0x10
	bl sub_02024624
	ldr r1, _02093CD4 ; =0x000007E8
	str r0, [r4, r1]
_02093C0C:
	ldr r0, _02093CD4 ; =0x000007E8
	mov r1, #1
	ldr r0, [r4, r0]
	bl sub_0202484C
	ldr r0, _02093CD4 ; =0x000007E8
	add r1, r7, #0
	ldr r0, [r4, r0]
	add r1, #0x27
	bl sub_020248F0
	ldr r0, _02093CD4 ; =0x000007E8
	mov r1, #1
	ldr r0, [r4, r0]
	bl sub_02024A04
	ldr r0, _02093CD4 ; =0x000007E8
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_02024830
	ldr r0, _02093CD4 ; =0x000007E8
	mov r1, #6
	ldr r0, [r4, r0]
	bl sub_02024ADC
	mov r0, #0x18
	str r0, [sp]
	ldr r0, _02093CD8 ; =0x000007E4
	ldr r2, [sp, #4]
	ldr r1, [r5, r0]
	add r0, r7, #0
	add r0, #0x21
	lsl r0, r0, #2
	add r0, r1, r0
	mov r1, #0xd4
	mov r3, #0x18
	bl sub_0209428C
	ldr r0, [sp, #0xc]
	add r7, r7, #1
	add r0, #0x28
	str r0, [sp, #0xc]
	ldr r0, [sp, #8]
	add r6, #8
	add r0, #0x28
	str r0, [sp, #8]
	ldr r0, [sp, #4]
	add r4, #0x34
	add r0, #0x28
	str r0, [sp, #4]
	ldrb r0, [r5, #0xd]
	cmp r7, r0
	blt _02093BB8
_02093C78:
	mov r6, #0
	cmp r7, #3
	bge _02093CAE
	mov r0, #0x28
	add r4, r7, #0
	mul r4, r0
	add r4, #0x2c
_02093C86:
	mov r0, #1
	str r0, [sp]
	add r0, r5, #0
	mov r1, #0xd4
	add r2, r4, #0
	mov r3, #0x2f
	bl sub_0209417C
	add r1, r6, #0
	add r2, r6, #1
	lsl r2, r2, #0x18
	lsl r1, r1, #2
	lsr r6, r2, #0x18
	add r2, r5, r1
	ldr r1, _02093CDC ; =0x000008C8
	add r7, r7, #1
	add r4, #0x28
	str r0, [r2, r1]
	cmp r7, #3
	blt _02093C86
_02093CAE:
	ldr r0, _02093CE0 ; =0x000046A8
	mov r1, #0x20
	strb r1, [r5, r0]
	mov r3, #0x97
	add r1, r0, #2
	strb r3, [r5, r1]
	mov r2, #8
	add r1, r0, #1
	strb r2, [r5, r1]
	add r1, r0, #3
	strb r3, [r5, r1]
	mov r1, #0
	add r0, r0, #4
	str r1, [r5, r0]
	add sp, #0x40
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02093CD0: .word 0x000046A4
_02093CD4: .word 0x000007E8
_02093CD8: .word 0x000007E4
_02093CDC: .word 0x000008C8
_02093CE0: .word 0x000046A8
	thumb_func_end sub_02093B84

	thumb_func_start sub_02093CE4
sub_02093CE4: ; 0x02093CE4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	ldr r3, _02093E68 ; =0x0000469C
	add r1, r0, #0
	ldr r1, [r1, r3]
	str r0, [sp]
	cmp r1, #1
	bne _02093DA2
	mov r0, #0
	str r0, [sp, #0x18]
	ldr r0, [sp]
	ldrb r0, [r0, #0xd]
	mov ip, r0
	cmp r0, #0
	ble _02093DA0
	ldr r0, [sp]
	add r3, #8
	ldr r4, [r0, r3]
	ldr r5, [sp, #0x18]
	str r4, [sp, #8]
_02093D0C:
	ldr r0, [r4, #4]
	cmp r0, #0
	ldr r0, _02093E6C ; =0x00004698
	bne _02093D4E
	ldr r1, [sp]
	ldr r7, [r1, r0]
	ldr r0, [sp, #8]
	add r3, r0, r5
	ldrb r6, [r0, r5]
	ldrb r0, [r3, #2]
	ldrb r2, [r3, #1]
	str r0, [sp, #0x1c]
	ldr r0, _02093E70 ; =0x00004694
	ldr r0, [r1, r0]
	ldrb r1, [r3, #3]
	sub r0, r0, r2
	sub r1, r1, r2
	cmp r0, r1
	bhs _02093D90
	ldr r0, [sp, #0x1c]
	sub r1, r7, r6
	sub r0, r0, r6
	cmp r1, r0
	bhs _02093D90
	ldr r1, [sp, #0x18]
	ldr r0, [sp]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl sub_02093E7C
	add sp, #0x24
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_02093D4E:
	ldr r1, [sp]
	ldr r7, [r1, r0]
	ldr r0, [sp, #8]
	add r3, r0, r5
	ldrb r6, [r0, r5]
	ldrb r0, [r3, #2]
	ldrb r2, [r3, #1]
	str r0, [sp, #0x20]
	ldr r0, _02093E70 ; =0x00004694
	ldr r0, [r1, r0]
	ldrb r1, [r3, #3]
	sub r0, r0, r2
	sub r1, r1, r2
	cmp r0, r1
	bhs _02093D90
	ldr r0, [sp, #0x20]
	sub r1, r7, r6
	sub r0, r0, r6
	cmp r1, r0
	bhs _02093D90
	ldr r0, [sp]
	ldr r1, [sp, #0x18]
	bl sub_02094F5C
	ldr r1, [sp, #0x18]
	ldr r0, [sp]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl sub_02093E7C
	add sp, #0x24
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_02093D90:
	ldr r0, [sp, #0x18]
	add r4, #8
	add r1, r0, #1
	mov r0, ip
	add r5, #8
	str r1, [sp, #0x18]
	cmp r1, r0
	blt _02093D0C
_02093DA0:
	b _02093E62
_02093DA2:
	cmp r1, #2
	bne _02093E5E
	sub r2, r3, #4
	add r1, r0, #0
	ldr r1, [r1, r2]
	add r2, r3, #0
	str r1, [sp, #0x14]
	add r2, #0xd
	add r1, r0, #0
	ldrb r6, [r1, r2]
	add r2, r3, #0
	add r2, #0xc
	ldrb r5, [r1, r2]
	add r2, r3, #0
	add r2, #0xe
	ldrb r4, [r1, r2]
	add r2, r3, #0
	sub r2, #8
	ldr r1, [r1, r2]
	add r2, r3, #0
	str r1, [sp, #0x10]
	sub r7, r1, r6
	add r2, #0xf
	add r1, r0, #0
	ldrb r1, [r1, r2]
	sub r1, r1, r6
	cmp r7, r1
	bhs _02093DFA
	ldr r1, [sp, #0x14]
	sub r2, r1, r5
	sub r1, r4, r5
	cmp r2, r1
	bhs _02093DFA
	sub r3, #0x18
	add r1, r0, #0
	ldr r1, [r1, r3]
	bl sub_02094F5C
	ldr r0, [sp]
	bl sub_020956B8
	add sp, #0x24
	mov r0, #2
	pop {r4, r5, r6, r7, pc}
_02093DFA:
	ldr r0, [sp]
	mov r7, #0
	ldrb r0, [r0, #0xd]
	str r0, [sp, #0xc]
	cmp r0, #0
	ble _02093E62
	ldr r1, _02093E74 ; =0x000046A4
	ldr r0, [sp]
	add r6, r7, #0
	ldr r5, [r0, r1]
	str r5, [sp, #4]
_02093E10:
	ldr r0, [r5, #4]
	cmp r0, #0
	bne _02093E50
	ldr r0, [sp, #4]
	add r4, r0, r6
	ldrb r3, [r4, #1]
	ldrb r1, [r4, #2]
	ldrb r2, [r0, r6]
	ldr r0, [sp, #0x10]
	ldrb r4, [r4, #3]
	sub r0, r0, r3
	sub r3, r4, r3
	cmp r0, r3
	bhs _02093E50
	ldr r0, [sp, #0x14]
	sub r3, r0, r2
	sub r0, r1, r2
	cmp r3, r0
	bhs _02093E50
	ldr r0, [sp]
	ldr r2, _02093E78 ; =0x00004684
	add r1, r0, #0
	ldr r1, [r1, r2]
	lsl r2, r7, #0x18
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
	bl sub_02093F84
	add sp, #0x24
	mov r0, #3
	pop {r4, r5, r6, r7, pc}
_02093E50:
	ldr r0, [sp, #0xc]
	add r7, r7, #1
	add r5, #8
	add r6, #8
	cmp r7, r0
	blt _02093E10
	b _02093E62
_02093E5E:
	bl GF_AssertFail
_02093E62:
	mov r0, #0
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02093E68: .word 0x0000469C
_02093E6C: .word 0x00004698
_02093E70: .word 0x00004694
_02093E74: .word 0x000046A4
_02093E78: .word 0x00004684
	thumb_func_end sub_02093CE4

	thumb_func_start sub_02093E7C
sub_02093E7C: ; 0x02093E7C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r0, _02093F70 ; =0x000005EA
	str r1, [sp]
	bl PlaySE
	ldr r2, _02093F74 ; =0x000046A4
	ldr r0, [sp]
	ldr r1, [r5, r2]
	lsl r0, r0, #3
	mov r3, #1
	add r0, r1, r0
	str r3, [r0, #4]
	sub r2, #0x20
	ldr r2, [r5, r2]
	ldr r1, [sp]
	lsl r2, r2, #0x18
	add r0, r5, #0
	lsr r2, r2, #0x18
	mov r3, #0
	bl sub_02094668
	ldrb r1, [r5, #0xd]
	mov r4, #0
	cmp r1, #0
	bls _02093F6A
	mov r0, #0x8d
	lsl r0, r0, #4
	mov r7, #0xc
	add r2, r7, #0
	ldr r0, [r5, r0]
	sub r2, #0xd
_02093EBE:
	add r6, r4, #0
	mul r6, r7
	add r3, r0, r6
	ldr r3, [r3, #4]
	cmp r3, r2
	bne _02093F60
	ldr r0, _02093F78 ; =0x00004688
	add r2, sp, #4
	add r3, r5, r0
	ldmia r3!, {r0, r1}
	add r7, r2, #0
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	mov r0, #2
	ldr r1, [sp, #4]
	lsl r0, r0, #0xe
	sub r1, r1, r0
	str r1, [sp, #4]
	ldr r1, [sp, #8]
	lsr r0, r0, #1
	sub r0, r1, r0
	str r0, [sp, #8]
	mov r0, #0x8d
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	add r1, r7, #0
	ldr r0, [r0, r6]
	bl sub_020247D4
	mov r0, #0x8d
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #1
	ldr r0, [r0, r6]
	bl sub_02024830
	ldr r0, _02093F7C ; =0x00004684
	lsr r2, r0, #3
	ldr r2, [r5, r2]
	ldr r1, [r5, r0]
	add r2, r2, r6
	str r1, [r2, #4]
	lsr r2, r0, #3
	ldr r2, [r5, r2]
	ldrb r1, [r5, #0xf]
	add r2, r2, r6
	str r1, [r2, #8]
	ldrb r1, [r5, #0xe]
	add r1, r1, #1
	strb r1, [r5, #0xe]
	ldr r1, [r5, r0]
	mov r0, #0x34
	mul r0, r1
	add r1, r5, r0
	mov r0, #0x66
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #1
	bl sub_02024B78
	ldr r0, [sp]
	ldr r3, _02093F80 ; =0x00000888
	lsl r1, r0, #4
	ldr r0, _02093F7C ; =0x00004684
	add r1, r5, r1
	ldr r2, [r5, r0]
	add r0, #0x2c
	str r2, [r1, r3]
	ldrb r6, [r5, #0xf]
	sub r2, r3, #4
	str r6, [r1, r2]
	add r2, r3, #4
	str r4, [r1, r2]
	mov r2, #1
	add r3, #8
	str r2, [r1, r3]
	ldr r1, [sp]
	add sp, #0x10
	str r1, [r5, r0]
	pop {r3, r4, r5, r6, r7, pc}
_02093F60:
	add r3, r4, #1
	lsl r3, r3, #0x18
	lsr r4, r3, #0x18
	cmp r4, r1
	blo _02093EBE
_02093F6A:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02093F70: .word 0x000005EA
_02093F74: .word 0x000046A4
_02093F78: .word 0x00004688
_02093F7C: .word 0x00004684
_02093F80: .word 0x00000888
	thumb_func_end sub_02093E7C

	thumb_func_start sub_02093F84
sub_02093F84: ; 0x02093F84
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, _02093FF4 ; =0x000005EA
	add r4, r1, #0
	add r6, r2, #0
	bl PlaySE
	lsl r7, r4, #4
	mov r2, #0x89
	mov r1, #0
	add r0, r5, r7
	lsl r2, r2, #4
	str r1, [r0, r2]
	mov r0, #0x34
	mul r0, r4
	add r0, r5, r0
	sub r2, #0xa8
	ldr r0, [r0, r2]
	bl sub_02024830
	ldr r1, _02093FF8 ; =0x000046A4
	mov r0, #0
	ldr r2, [r5, r1]
	lsl r1, r4, #3
	add r1, r2, r1
	str r0, [r1, #4]
	ldr r0, _02093FF8 ; =0x000046A4
	mov r3, #1
	ldr r1, [r5, r0]
	lsl r0, r6, #3
	add r0, r1, r0
	str r3, [r0, #4]
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	bl sub_02094668
	lsl r1, r6, #4
	ldr r0, _02093FFC ; =0x00000888
	add r2, r5, r7
	ldr r3, [r2, r0]
	add r1, r5, r1
	str r3, [r1, r0]
	sub r3, r0, #4
	ldr r4, [r2, r3]
	str r4, [r1, r3]
	add r3, r0, #4
	ldr r3, [r2, r3]
	add r2, r0, #4
	str r3, [r1, r2]
	mov r2, #1
	add r0, #8
	str r2, [r1, r0]
	ldr r0, _02094000 ; =0x000046B0
	str r6, [r5, r0]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02093FF4: .word 0x000005EA
_02093FF8: .word 0x000046A4
_02093FFC: .word 0x00000888
_02094000: .word 0x000046B0
	thumb_func_end sub_02093F84

	thumb_func_start sub_02094004
sub_02094004: ; 0x02094004
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #0x20
	str r0, [sp]
	ldr r0, _0209413C ; =0x000007E4
	mov r1, #0xe0
	ldr r0, [r5, r0]
	mov r2, #0xb0
	add r0, #0x78
	mov r3, #0x32
	bl sub_0209428C
	mov r0, #1
	str r0, [sp]
	add r0, r5, #0
	mov r1, #0xe0
	mov r2, #0xb0
	mov r3, #4
	bl sub_0209417C
	ldr r1, _02094140 ; =0x000008B4
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	mov r1, #3
	bl sub_02024A04
	ldrb r0, [r5, #0x13]
	cmp r0, #0
	bne _02094048
	ldr r0, _02094140 ; =0x000008B4
	mov r1, #0
	ldr r0, [r5, r0]
	bl sub_02024830
_02094048:
	mov r3, #0x20
	ldr r0, _0209413C ; =0x000007E4
	str r3, [sp]
	ldr r0, [r5, r0]
	mov r1, #0x90
	add r0, #0x80
	mov r2, #0x10
	bl sub_0209428C
	mov r0, #1
	str r0, [sp]
	add r0, r5, #0
	mov r1, #0x90
	mov r2, #0x10
	mov r3, #2
	bl sub_0209417C
	ldr r1, _02094144 ; =0x000008B8
	mov r3, #0x20
	str r0, [r5, r1]
	str r3, [sp]
	sub r1, #0xd4
	ldr r0, [r5, r1]
	mov r1, #0x10
	add r0, #0x7c
	add r2, r1, #0
	bl sub_0209428C
	mov r0, #1
	mov r1, #0x10
	str r0, [sp]
	add r0, r5, #0
	add r2, r1, #0
	mov r3, #0
	bl sub_0209417C
	ldr r1, _02094148 ; =0x000008BC
	mov r3, #0x32
	str r0, [r5, r1]
	mov r1, #0
	add r0, r5, #0
	add r2, r1, #0
	str r1, [sp]
	bl sub_0209417C
	ldr r1, _0209414C ; =0x000008C4
	mov r2, #0xff
	str r0, [r5, r1]
	ldrb r0, [r5, #0xd]
	sub r1, #0xe0
	ldr r1, [r5, r1]
	add r0, #0x21
	lsl r0, r0, #2
	strb r2, [r1, r0]
	ldrb r0, [r5, #0xd]
	mov r7, #0
	cmp r0, #0
	ble _0209410C
	add r6, r7, #0
	add r4, r7, #0
_020940C0:
	mov r0, #0
	str r0, [sp]
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #0x40
	mov r3, #6
	bl sub_0209417C
	mov r1, #0x8d
	lsl r1, r1, #4
	ldr r1, [r5, r1]
	str r0, [r1, r4]
	mov r0, #0x8d
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	add r1, r0, r4
	mov r0, #0
	mvn r0, r0
	str r0, [r1, #4]
	mov r1, #0x8d
	lsl r1, r1, #4
	ldr r1, [r5, r1]
	ldrb r0, [r5, #0x10]
	add r1, r1, r4
	str r0, [r1, #8]
	mov r0, #0x8d
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #4
	ldr r0, [r0, r4]
	bl sub_02024ADC
	ldrb r0, [r5, #0xd]
	add r7, r7, #1
	add r6, #0x24
	add r4, #0xc
	cmp r7, r0
	blt _020940C0
_0209410C:
	mov r0, #0
	strb r0, [r5, #0xe]
	mov r0, #1
	str r0, [sp]
	add r0, r5, #0
	mov r1, #0x14
	mov r2, #0x28
	mov r3, #0x2d
	bl sub_0209417C
	mov r1, #0x23
	lsl r1, r1, #6
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	mov r1, #1
	bl sub_02024A04
	mov r0, #0x23
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #1
	bl sub_02024ADC
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0209413C: .word 0x000007E4
_02094140: .word 0x000008B4
_02094144: .word 0x000008B8
_02094148: .word 0x000008BC
_0209414C: .word 0x000008C4
	thumb_func_end sub_02094004

	thumb_func_start sub_02094150
sub_02094150: ; 0x02094150
	push {r3, r4}
	ldr r3, [r1, #0x18]
	mov r4, #0
	str r3, [r0]
	mov r3, #0x5d
	lsl r3, r3, #2
	add r3, r1, r3
	str r3, [r0, #4]
	mov r3, #1
	str r4, [r0, #0x10]
	lsl r3, r3, #0xc
	str r3, [r0, #0x14]
	str r3, [r0, #0x18]
	str r3, [r0, #0x1c]
	strh r4, [r0, #0x20]
	mov r3, #0x14
	str r3, [r0, #0x24]
	str r2, [r0, #0x28]
	ldr r1, [r1, #4]
	str r1, [r0, #0x2c]
	pop {r3, r4}
	bx lr
	thumb_func_end sub_02094150

	thumb_func_start sub_0209417C
sub_0209417C: ; 0x0209417C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	add r6, r0, #0
	add r5, r1, #0
	add r4, r2, #0
	add r0, sp, #0
	add r1, r6, #0
	mov r2, #1
	add r7, r3, #0
	bl sub_02094150
	lsl r0, r5, #0xc
	str r0, [sp, #8]
	lsl r0, r4, #0xc
	str r0, [sp, #0xc]
	mov r0, #0xa
	str r0, [sp, #0x24]
	add r0, sp, #0
	bl sub_02024624
	add r4, r0, #0
	mov r1, #1
	bl sub_0202484C
	add r0, r4, #0
	add r1, r7, #0
	bl sub_020248F0
	add r0, r4, #0
	mov r1, #1
	bl sub_02024A04
	ldr r1, [sp, #0x48]
	add r0, r4, #0
	bl sub_02024830
	add r0, r4, #0
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0209417C

	thumb_func_start sub_020941CC
sub_020941CC: ; 0x020941CC
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #6
	lsl r0, r0, #8
	add r6, r1, #0
	str r0, [sp, #4]
	mov r1, #1
	add r4, r2, #0
	str r1, [sp, #8]
	mov r0, #0x97
	add r2, r6, #0
	mov r3, #2
	str r4, [sp, #0xc]
	bl GfGfxLoader_LoadScrnData
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0x18
	str r0, [sp, #4]
	mov r0, #1
	mov r2, #0
	str r0, [sp, #8]
	add r0, r6, #0
	mov r1, #2
	add r3, r2, #0
	bl BgTilemapRectChangePalette
	add r0, r6, #0
	mov r1, #2
	bl BgCommitTilemapBufferToVram
	mov r0, #0
	str r0, [sp]
	mov r0, #6
	lsl r0, r0, #8
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x97
	mov r1, #4
	add r2, r6, #0
	mov r3, #3
	str r4, [sp, #0xc]
	bl GfGfxLoader_LoadScrnData
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0x18
	str r0, [sp, #4]
	mov r0, #1
	mov r2, #0
	str r0, [sp, #8]
	add r0, r6, #0
	mov r1, #3
	add r3, r2, #0
	bl BgTilemapRectChangePalette
	add r0, r6, #0
	mov r1, #3
	bl BgCommitTilemapBufferToVram
	ldr r3, _02094280 ; =0x000046D0
	mov r0, #0x97
	mov r1, #3
	mov r2, #1
	add r3, r5, r3
	str r4, [sp]
	bl GfGfxLoader_GetScrnData
	ldr r3, _02094284 ; =0x000046C8
	mov r1, #1
	str r0, [r5, r3]
	add r3, #0xc
	mov r0, #0x97
	add r2, r1, #0
	add r3, r5, r3
	str r4, [sp]
	bl GfGfxLoader_GetScrnData
	ldr r1, _02094288 ; =0x000046CC
	str r0, [r5, r1]
	mov r0, #8
	mov r1, #0
	bl GX_EngineAToggleLayers
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02094280: .word 0x000046D0
_02094284: .word 0x000046C8
_02094288: .word 0x000046CC
	thumb_func_end sub_020941CC

	thumb_func_start sub_0209428C
sub_0209428C: ; 0x0209428C
	push {r4, r5}
	ldr r5, [sp, #8]
	lsr r4, r5, #0x1f
	add r4, r5, r4
	asr r4, r4, #1
	sub r5, r2, r4
	strb r5, [r0]
	lsr r5, r3, #0x1f
	add r5, r3, r5
	asr r5, r5, #1
	sub r3, r1, r5
	strb r3, [r0, #2]
	add r2, r2, r4
	strb r2, [r0, #1]
	add r1, r1, r5
	strb r1, [r0, #3]
	pop {r4, r5}
	bx lr
	thumb_func_end sub_0209428C

	thumb_func_start sub_020942B0
sub_020942B0: ; 0x020942B0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x48
	str r0, [sp, #4]
	ldr r1, [sp, #4]
	add r0, sp, #0x18
	mov r2, #1
	bl sub_02094150
	mov r6, #0
	mov r0, #0x28
	ldr r4, [sp, #4]
	str r6, [sp, #0x10]
	str r0, [sp, #0xc]
	add r7, r6, #0
_020942CC:
	mov r0, #0
	str r0, [sp, #0x14]
	ldr r0, [sp, #0xc]
	mov r5, #0x14
	lsl r0, r0, #0xc
	str r0, [sp, #8]
_020942D8:
	mov r0, #0x18
	str r0, [sp]
	ldr r1, [sp, #4]
	ldr r0, _020943E8 ; =0x000007E4
	ldr r2, [sp, #0xc]
	ldr r0, [r1, r0]
	add r1, r5, #0
	add r0, r0, r7
	mov r3, #0x18
	bl sub_0209428C
	lsl r0, r5, #0xc
	str r0, [sp, #0x20]
	ldr r0, [sp, #8]
	str r0, [sp, #0x24]
	mov r0, #0x66
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0209430C
	add r0, sp, #0x18
	bl sub_02024624
	mov r1, #0x66
	lsl r1, r1, #2
	str r0, [r4, r1]
_0209430C:
	mov r0, #0x66
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_0202484C
	mov r0, #0x66
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r1, r6, #7
	bl sub_020248F0
	mov r0, #0x66
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_02024A04
	mov r0, #0x66
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_02024830
	mov r0, #0x66
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #6
	bl sub_02024ADC
	ldr r0, [sp, #0x14]
	add r7, r7, #4
	add r0, r0, #1
	add r4, #0x34
	add r6, r6, #1
	add r5, #0x18
	str r0, [sp, #0x14]
	cmp r0, #6
	blt _020942D8
	ldr r0, [sp, #0xc]
	add r0, #0x18
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x10]
	add r0, r0, #1
	str r0, [sp, #0x10]
	cmp r0, #5
	blt _020942CC
	mov r0, #5
	lsl r0, r0, #0xe
	str r0, [sp, #0x20]
	lsl r0, r0, #1
	str r0, [sp, #0x24]
	mov r1, #0x7b
	ldr r0, [sp, #4]
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	cmp r0, #0
	bne _0209438E
	add r0, sp, #0x18
	bl sub_02024624
	mov r2, #0x7b
	ldr r1, [sp, #4]
	lsl r2, r2, #4
	str r0, [r1, r2]
_0209438E:
	mov r1, #0x7b
	ldr r0, [sp, #4]
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	mov r1, #1
	bl sub_0202484C
	mov r1, #0x7b
	ldr r0, [sp, #4]
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	mov r1, #0x30
	bl sub_020248F0
	mov r1, #0x7b
	ldr r0, [sp, #4]
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	mov r1, #1
	bl sub_02024A04
	mov r1, #0x7b
	ldr r0, [sp, #4]
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	mov r1, #0
	bl sub_02024830
	mov r1, #0x7b
	ldr r0, [sp, #4]
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	mov r1, #8
	bl sub_02024ADC
	mov r1, #0x7b
	ldr r0, [sp, #4]
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	mov r1, #1
	bl sub_02024B78
	add sp, #0x48
	pop {r3, r4, r5, r6, r7, pc}
	nop
_020943E8: .word 0x000007E4
	thumb_func_end sub_020942B0

	thumb_func_start sub_020943EC
sub_020943EC: ; 0x020943EC
	push {r3, lr}
	ldrb r1, [r0, #0xf]
	cmp r1, #0x12
	bne _020943FA
	bl sub_02094528
	pop {r3, pc}
_020943FA:
	bl sub_02094400
	pop {r3, pc}
	thumb_func_end sub_020943EC

	thumb_func_start sub_02094400
sub_02094400: ; 0x02094400
	push {r4, r5, r6, r7, lr}
	sub sp, #0x54
	add r5, r0, #0
	ldr r1, [r5, #4]
	mov r0, #0x14
	bl NARC_ctor
	str r0, [sp, #0x1c]
	mov r1, #1
	ldr r0, [r5, #4]
	lsl r1, r1, #0xc
	bl AllocFromHeapAtEnd
	str r0, [sp, #0x20]
	mov r7, #0
	add r4, r5, #0
_02094420:
	mov r0, #0x66
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_02024B78
	ldr r6, _02094514 ; =0x0000463C
	ldrb r1, [r5, #0xf]
	ldr r0, [r5, r6]
	add r6, #0xc
	ldr r6, [r5, r6]
	add r2, r7, #0
	add r3, sp, #0x24
	blx r6
	cmp r0, #0
	beq _02094494
	mov r0, #0x67
	lsl r0, r0, #2
	add r3, sp, #0x24
	add r2, r4, r0
	mov r6, #6
_0209444A:
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	sub r6, r6, #1
	bne _0209444A
	ldr r0, [sp, #0x20]
	mov r3, #0x66
	str r0, [sp]
	ldr r0, [sp, #0x1c]
	ldr r1, _02094518 ; =0x000008D4
	str r0, [sp, #4]
	mov r0, #0x40
	str r0, [sp, #8]
	lsl r3, r3, #2
	ldr r3, [r4, r3]
	add r0, sp, #0x24
	add r1, r5, r1
	add r2, r7, #0
	bl sub_02094C08
	add r0, sp, #0x24
	ldrh r0, [r0, #8]
	cmp r0, #0
	beq _02094486
	mov r0, #0x66
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_02024B78
	b _020944BA
_02094486:
	mov r0, #0x66
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_02024B78
	b _020944BA
_02094494:
	ldr r0, [sp, #0x20]
	ldr r1, _02094518 ; =0x000008D4
	str r0, [sp]
	ldr r0, [sp, #0x1c]
	add r1, r5, r1
	str r0, [sp, #4]
	mov r0, #0x40
	str r0, [sp, #8]
	add r0, sp, #0x24
	add r2, r7, #0
	mov r3, #0
	bl sub_02094C08
	mov r0, #0x66
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_02024830
_020944BA:
	add r7, r7, #1
	add r4, #0x34
	cmp r7, #0x1e
	blt _02094420
	ldr r0, [sp, #0x20]
	bl FreeToHeap
	ldr r0, [sp, #0x1c]
	bl NARC_dtor
	ldr r1, _0209451C ; =sub_02094758
	ldr r0, _02094520 ; =0x00004644
	str r1, [r5, r0]
	ldrb r1, [r5, #0xf]
	add r0, r5, #0
	bl sub_02094C88
	add r0, r5, #0
	bl sub_02094EB4
	mov r0, #0x14
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _02094524 ; =0x000046D4
	mov r2, #0
	ldr r0, [r5, r0]
	mov r1, #2
	add r0, #0xc
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	str r2, [sp, #0x10]
	mov r0, #0x20
	str r0, [sp, #0x14]
	mov r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5]
	add r3, r2, #0
	bl CopyRectToBgTilemapRect
	ldr r0, [r5]
	mov r1, #2
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x54
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02094514: .word 0x0000463C
_02094518: .word 0x000008D4
_0209451C: .word sub_02094758
_02094520: .word 0x00004644
_02094524: .word 0x000046D4
	thumb_func_end sub_02094400

	thumb_func_start sub_02094528
sub_02094528: ; 0x02094528
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x58
	add r6, r0, #0
	ldr r1, [r6, #4]
	mov r0, #0x14
	bl NARC_ctor
	str r0, [sp, #0x20]
	mov r1, #1
	ldr r0, [r6, #4]
	lsl r1, r1, #0xc
	bl AllocFromHeapAtEnd
	str r0, [sp, #0x24]
	ldr r0, _02094654 ; =0x00004640
	ldr r0, [r6, r0]
	bl GetPartyCount
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	mov r4, #0
	str r0, [sp, #0x1c]
	cmp r0, #0
	ble _020945C0
	add r5, r6, #0
_0209455A:
	add r0, r6, #0
	add r1, r4, #0
	add r2, sp, #0x28
	bl sub_02094F14
	mov r0, #0x67
	lsl r0, r0, #2
	add r3, sp, #0x28
	add r2, r5, r0
	mov r7, #6
_0209456E:
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	sub r7, r7, #1
	bne _0209456E
	ldr r0, [sp, #0x24]
	mov r3, #0x66
	str r0, [sp]
	ldr r0, [sp, #0x20]
	ldr r1, _02094658 ; =0x000008D4
	str r0, [sp, #4]
	mov r0, #0x40
	str r0, [sp, #8]
	lsl r3, r3, #2
	ldr r3, [r5, r3]
	add r0, sp, #0x28
	add r1, r6, r1
	add r2, r4, #0
	bl sub_02094C08
	add r0, sp, #0x28
	ldrh r0, [r0, #8]
	cmp r0, #0
	beq _020945AA
	mov r0, #0x66
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl sub_02024B78
	b _020945B6
_020945AA:
	mov r0, #0x66
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_02024B78
_020945B6:
	ldr r0, [sp, #0x1c]
	add r4, r4, #1
	add r5, #0x34
	cmp r4, r0
	blt _0209455A
_020945C0:
	mov r1, #0
	str r1, [sp, #0x28]
	add r0, sp, #0x28
	strh r1, [r0, #8]
	strh r1, [r0, #0xa]
	strh r1, [r0, #0xc]
	strh r1, [r0, #0xe]
	cmp r4, #0x1e
	bge _02094606
	mov r0, #0x34
	mul r0, r4
	add r5, r6, r0
	mov r7, #0x40
_020945DA:
	ldr r0, [sp, #0x24]
	ldr r1, _02094658 ; =0x000008D4
	str r0, [sp]
	ldr r0, [sp, #0x20]
	add r1, r6, r1
	str r0, [sp, #4]
	add r0, sp, #0x28
	add r2, r4, #0
	mov r3, #0
	str r7, [sp, #8]
	bl sub_02094C08
	mov r0, #0x66
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_02024830
	add r4, r4, #1
	add r5, #0x34
	cmp r4, #0x1e
	blt _020945DA
_02094606:
	ldr r0, [sp, #0x24]
	bl FreeToHeap
	ldr r0, [sp, #0x20]
	bl NARC_dtor
	ldr r1, _0209465C ; =sub_02094758
	ldr r0, _02094660 ; =0x00004644
	str r1, [r6, r0]
	ldrb r1, [r6, #0xf]
	add r0, r6, #0
	bl sub_02094C88
	add r0, r6, #0
	bl sub_02094EB4
	mov r1, #0x14
	str r1, [sp]
	mov r2, #0
	ldr r0, _02094664 ; =0x000046D0
	str r1, [sp, #4]
	ldr r0, [r6, r0]
	add r3, r2, #0
	add r0, #0xc
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	str r2, [sp, #0x10]
	str r1, [sp, #0x14]
	str r1, [sp, #0x18]
	ldr r0, [r6]
	mov r1, #2
	bl CopyRectToBgTilemapRect
	ldr r0, [r6]
	mov r1, #2
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x58
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02094654: .word 0x00004640
_02094658: .word 0x000008D4
_0209465C: .word sub_02094758
_02094660: .word 0x00004644
_02094664: .word 0x000046D0
	thumb_func_end sub_02094528

	thumb_func_start sub_02094668
sub_02094668: ; 0x02094668
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r4, r0, #0
	str r1, [sp, #0xc]
	ldr r1, [r4, #4]
	mov r0, #0x14
	add r7, r2, #0
	add r6, r3, #0
	bl NARC_ctor
	str r0, [sp, #0x14]
	mov r1, #1
	ldr r0, [r4, #4]
	lsl r1, r1, #0xc
	bl AllocFromHeapAtEnd
	str r0, [sp, #0x18]
	mov r3, #0
	mov r1, #0x83
	ldr r0, _02094740 ; =0x000008DC
	add r5, r4, #0
	add r2, r3, #0
	lsl r1, r1, #2
_02094696:
	add r3, r3, #1
	str r2, [r5, r0]
	add r5, r5, r1
	cmp r3, #0x1e
	blt _02094696
	cmp r6, #0
	beq _020946E6
	ldr r1, [sp, #0xc]
	ldr r0, _02094744 ; =0x000007EC
	add r3, r7, #0
	mov r2, #0x34
	mul r3, r2
	mul r2, r1
	add r1, r4, r2
	add r5, r4, r0
	mov ip, r2
	add r2, r5, r3
	add r6, r1, r0
	mov r7, #6
_020946BC:
	ldmia r2!, {r0, r1}
	stmia r6!, {r0, r1}
	sub r7, r7, #1
	bne _020946BC
	ldr r0, [sp, #0x18]
	str r0, [sp]
	ldr r0, [sp, #0x14]
	str r0, [sp, #4]
	ldr r0, _02094748 ; =0x00000222
	str r0, [sp, #8]
	add r0, r5, r3
	ldr r5, _0209474C ; =0x000008D4
	mov r3, ip
	add r1, r4, r5
	add r3, r4, r3
	sub r5, #0xec
	ldr r2, [sp, #0xc]
	ldr r3, [r3, r5]
	bl sub_02094C08
	b _0209472A
_020946E6:
	mov r0, #0x67
	lsl r0, r0, #2
	add r6, r4, r0
	add r5, r7, #0
	mov r1, #0x34
	mul r5, r1
	ldr r0, [sp, #0xc]
	add r3, r6, r5
	mul r1, r0
	str r1, [sp, #0x10]
	ldr r0, _02094744 ; =0x000007EC
	add r1, r4, r1
	add r2, r1, r0
	mov r7, #6
_02094702:
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	sub r7, r7, #1
	bne _02094702
	ldr r0, [sp, #0x18]
	ldr r3, [sp, #0x10]
	str r0, [sp]
	ldr r0, [sp, #0x14]
	add r3, r4, r3
	str r0, [sp, #4]
	ldr r0, _02094748 ; =0x00000222
	str r0, [sp, #8]
	add r0, r6, r5
	ldr r5, _0209474C ; =0x000008D4
	ldr r2, [sp, #0xc]
	add r1, r4, r5
	sub r5, #0xec
	ldr r3, [r3, r5]
	bl sub_02094C08
_0209472A:
	ldr r0, [sp, #0x18]
	bl FreeToHeap
	ldr r0, [sp, #0x14]
	bl NARC_dtor
	ldr r1, _02094750 ; =sub_02094758
	ldr r0, _02094754 ; =0x00004644
	str r1, [r4, r0]
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02094740: .word 0x000008DC
_02094744: .word 0x000007EC
_02094748: .word 0x00000222
_0209474C: .word 0x000008D4
_02094750: .word sub_02094758
_02094754: .word 0x00004644
	thumb_func_end sub_02094668

	thumb_func_start sub_02094758
sub_02094758: ; 0x02094758
	push {r3, r4, r5, r6, r7, lr}
	mov r6, #2
	lsl r6, r6, #8
	add r7, r6, #0
	add r5, r0, #0
	mov r4, #0
	add r7, #0xc
_02094766:
	ldr r0, [r5, #8]
	cmp r0, #0
	beq _0209478A
	add r0, r5, #0
	add r0, #0xc
	add r1, r6, #0
	bl DC_FlushRange
	add r0, r5, #0
	ldr r1, [r5]
	add r0, #0xc
	add r2, r6, #0
	bl GX_LoadOBJ
	ldr r0, [r5, #8]
	mov r1, #1
	bl sub_02024830
_0209478A:
	add r4, r4, #1
	add r5, r5, r7
	cmp r4, #0x1e
	blt _02094766
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02094758

	thumb_func_start sub_02094794
sub_02094794: ; 0x02094794
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #0x34
	mul r0, r4
	add r1, r5, r0
	mov r0, #0x66
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	bl sub_020248AC
	add r1, r0, #0
	mov r0, #0x23
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	bl sub_020247D4
	add r0, r5, #0
	add r1, r4, #0
	bl sub_020947C0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02094794

	thumb_func_start sub_020947C0
sub_020947C0: ; 0x020947C0
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	mov r0, #0x34
	add r6, r4, #0
	mul r6, r0
	mov r0, #0x66
	add r1, r5, r6
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _020947E4
	bl sub_020248B8
	cmp r0, #0
	bne _020947E4
	mov r0, #3
	pop {r3, r4, r5, r6, r7, pc}
_020947E4:
	mov r0, #0x69
	add r1, r5, r6
	lsl r0, r0, #2
	ldrh r0, [r1, r0]
	cmp r0, #0
	beq _020947F4
	mov r0, #3
	pop {r3, r4, r5, r6, r7, pc}
_020947F4:
	mov r1, #0
	mov r0, #0
	mvn r1, r1
	add r2, r0, #0
	b _0209481A
_020947FE:
	mov r3, #0x8d
	lsl r3, r3, #4
	ldr r3, [r5, r3]
	ldrb r6, [r5, #0xf]
	add r7, r3, r2
	ldr r3, [r7, #8]
	cmp r6, r3
	bne _02094816
	ldr r3, [r7, #4]
	cmp r4, r3
	bne _02094816
	add r1, r0, #0
_02094816:
	add r2, #0xc
	add r0, r0, #1
_0209481A:
	mov r3, #0
	mvn r3, r3
	cmp r1, r3
	bne _02094828
	ldrb r3, [r5, #0xd]
	cmp r0, r3
	blt _020947FE
_02094828:
	mov r0, #0
	mvn r0, r0
	cmp r1, r0
	bne _0209485C
	ldrb r3, [r5, #0xd]
	ldrb r0, [r5, #0xe]
	cmp r0, r3
	bne _0209483C
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0209483C:
	mov r4, #0
	cmp r3, #0
	ble _0209485C
	mov r0, #0x8d
	lsl r0, r0, #4
	ldr r2, [r5, r0]
	sub r0, r4, #1
_0209484A:
	ldr r1, [r2, #4]
	cmp r1, r0
	bne _02094854
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02094854:
	add r4, r4, #1
	add r2, #0xc
	cmp r4, r3
	blt _0209484A
_0209485C:
	mov r0, #2
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_020947C0

	thumb_func_start sub_02094860
sub_02094860: ; 0x02094860
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_02094894
	ldrb r1, [r5, #0xd]
	add r6, r0, #0
	cmp r4, r1
	bge _0209488E
	mov r0, #0x34
	mul r0, r4
	add r1, r5, r0
	ldr r0, _02094890 ; =0x000007E8
	ldr r0, [r1, r0]
	bl sub_020248AC
	add r1, r0, #0
	mov r0, #0x23
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	bl sub_020247D4
	add r0, r6, #0
_0209488E:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02094890: .word 0x000007E8
	thumb_func_end sub_02094860

	thumb_func_start sub_02094894
sub_02094894: ; 0x02094894
	push {r3, lr}
	ldrb r2, [r0, #0xd]
	cmp r1, r2
	blt _020948A0
	mov r0, #3
	pop {r3, pc}
_020948A0:
	mov r2, #0x34
	mul r2, r1
	add r1, r0, r2
	ldr r0, _020948C0 ; =0x000007E8
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _020948BA
	bl sub_020248B8
	cmp r0, #0
	bne _020948BA
	mov r0, #3
	pop {r3, pc}
_020948BA:
	mov r0, #1
	pop {r3, pc}
	nop
_020948C0: .word 0x000007E8
	thumb_func_end sub_02094894

	thumb_func_start sub_020948C4
sub_020948C4: ; 0x020948C4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r5, r0, #0
	ldr r1, _020949D4 ; =0x00004680
	mov r0, #1
	str r0, [r5, r1]
	add r6, r2, #0
	add r0, r1, #4
	str r6, [r5, r0]
	add r0, r1, #0
	add r0, #0x1c
	str r4, [r5, r0]
	cmp r4, #1
	bne _020948EE
	mov r0, #0x66
	lsl r0, r0, #2
	add r7, r5, r0
	add r1, #0x20
	str r7, [r5, r1]
	b _02094900
_020948EE:
	cmp r4, #2
	bne _020948FC
	ldr r0, _020949D8 ; =0x000007E8
	add r1, #0x20
	add r7, r5, r0
	str r7, [r5, r1]
	b _02094900
_020948FC:
	bl GF_AssertFail
_02094900:
	mov r0, #0x34
	mul r0, r6
	ldr r0, [r7, r0]
	bl sub_020248AC
	add r3, r0, #0
	ldr r0, _020949DC ; =0x00004688
	add r2, r5, r0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	mov r1, #0x2e
	str r0, [r2]
	mov r0, #0x23
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	bl sub_020248F0
	ldr r0, _020949E0 ; =0x000046A0
	ldr r2, [r5, r0]
	sub r0, #0x1c
	ldr r1, [r5, r0]
	mov r0, #0x34
	mul r0, r1
	ldr r0, [r2, r0]
	mov r1, #3
	bl sub_02024ADC
	cmp r4, #1
	bne _020949D0
	ldr r0, _020949E0 ; =0x000046A0
	ldr r2, [r5, r0]
	sub r0, #0x1c
	ldr r1, [r5, r0]
	mov r0, #0x34
	mul r0, r1
	ldr r0, [r2, r0]
	bl sub_020248AC
	add r6, r0, #0
	mov r3, #0
	mov r1, #0x83
	ldr r0, _020949E4 ; =0x000008DC
	add r4, r5, #0
	add r2, r3, #0
	lsl r1, r1, #2
_0209495C:
	add r3, r3, #1
	str r2, [r4, r0]
	add r4, r4, r1
	cmp r3, #0x1e
	blt _0209495C
	ldr r1, [r5, #4]
	mov r0, #0x14
	bl NARC_ctor
	add r4, r0, #0
	mov r1, #1
	ldr r0, [r5, #4]
	lsl r1, r1, #0xc
	bl AllocFromHeapAtEnd
	add r7, r0, #0
	ldr r3, _020949E0 ; =0x000046A0
	str r7, [sp]
	add r1, r3, #0
	ldr r0, _020949E8 ; =0x000002B1
	str r4, [sp, #4]
	str r0, [sp, #8]
	sub r1, #0x1c
	ldr r2, [r5, r1]
	mov r1, #0x34
	mul r1, r2
	ldr r0, [r5, r3]
	mov r2, #0
	add r0, r0, r1
	lsr r1, r3, #3
	mov r3, #0x7b
	lsl r3, r3, #4
	ldr r3, [r5, r3]
	add r0, r0, #4
	add r1, r5, r1
	bl sub_02094C08
	mov r0, #0x7b
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	add r1, r6, #0
	bl sub_020247D4
	mov r0, #0x7b
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #1
	bl sub_02024830
	add r0, r7, #0
	bl FreeToHeap
	add r0, r4, #0
	bl NARC_dtor
	ldr r1, _020949EC ; =sub_02094758
	ldr r0, _020949F0 ; =0x00004644
	str r1, [r5, r0]
_020949D0:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_020949D4: .word 0x00004680
_020949D8: .word 0x000007E8
_020949DC: .word 0x00004688
_020949E0: .word 0x000046A0
_020949E4: .word 0x000008DC
_020949E8: .word 0x000002B1
_020949EC: .word sub_02094758
_020949F0: .word 0x00004644
	thumb_func_end sub_020948C4

	thumb_func_start sub_020949F4
sub_020949F4: ; 0x020949F4
	push {r3, r4, r5, lr}
	sub sp, #0x20
	add r4, r0, #0
	ldr r0, _02094A64 ; =0x00004680
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _02094A5E
	add r0, sp, #4
	add r1, sp, #0
	bl sub_02025364
	ldr r0, [sp, #4]
	add r5, sp, #0x14
	lsl r0, r0, #0xc
	str r0, [sp, #0x14]
	ldr r0, [sp]
	add r3, sp, #8
	lsl r0, r0, #0xc
	str r0, [sp, #0x18]
	mov r0, #0
	str r0, [sp, #0x1c]
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	str r0, [r3]
	mov r0, #1
	ldr r1, [sp, #0xc]
	lsl r0, r0, #0xe
	sub r0, r1, r0
	str r0, [sp, #0xc]
	ldr r0, _02094A68 ; =0x000046A0
	ldr r3, [r4, r0]
	sub r0, #0x1c
	ldr r1, [r4, r0]
	mov r0, #0x34
	mul r0, r1
	ldr r0, [r3, r0]
	add r1, r2, #0
	bl sub_020247D4
	mov r0, #0x23
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	add r1, sp, #0x14
	bl sub_020247D4
	ldr r1, [sp, #4]
	ldr r0, _02094A6C ; =0x00004694
	str r1, [r4, r0]
	ldr r1, [sp]
	add r0, r0, #4
	str r1, [r4, r0]
_02094A5E:
	add sp, #0x20
	pop {r3, r4, r5, pc}
	nop
_02094A64: .word 0x00004680
_02094A68: .word 0x000046A0
_02094A6C: .word 0x00004694
	thumb_func_end sub_020949F4

	thumb_func_start sub_02094A70
sub_02094A70: ; 0x02094A70
	push {r4, lr}
	ldr r1, _02094A8C ; =0x00004680
	add r4, r0, #0
	ldr r1, [r4, r1]
	cmp r1, #0
	beq _02094A88
	bl sub_02093CE4
	add r1, r0, #0
	add r0, r4, #0
	bl sub_02094A90
_02094A88:
	pop {r4, pc}
	nop
_02094A8C: .word 0x00004680
	thumb_func_end sub_02094A70

	thumb_func_start sub_02094A90
sub_02094A90: ; 0x02094A90
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r0, #0
	cmp r1, #0
	beq _02094B1A
	ldr r2, _02094BF0 ; =0x0000469C
	ldr r0, [r4, r2]
	cmp r0, #2
	bne _02094AE8
	cmp r1, #2
	bne _02094AC0
	add r0, r2, #0
	sub r0, #0x14
	add r5, r4, r0
	ldmia r5!, {r0, r1}
	add r3, sp, #0
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	sub r2, #0x18
	str r0, [r3]
	ldr r0, [r4, r2]
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	b _02094B0E
_02094AC0:
	add r0, r2, #0
	add r0, #0x14
	ldr r0, [r4, r0]
	add r2, #0x14
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	mov r0, #0x35
	lsl r0, r0, #0xe
	str r0, [sp]
	add r1, r1, #1
	mov r0, #0x28
	mul r0, r1
	lsl r0, r0, #0xc
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	ldr r0, [r4, r2]
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	b _02094B0E
_02094AE8:
	add r0, r2, #0
	add r0, #0x14
	ldr r0, [r4, r0]
	add r2, #0x14
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	mov r0, #0x35
	lsl r0, r0, #0xe
	str r0, [sp]
	add r1, r1, #1
	mov r0, #0x28
	mul r0, r1
	lsl r0, r0, #0xc
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	ldr r0, [r4, r2]
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
_02094B0E:
	ldr r0, _02094BF4 ; =0x000046B8
	mov r1, #3
	ldr r0, [r4, r0]
	bl sub_02095D40
	b _02094B5C
_02094B1A:
	ldr r2, _02094BF8 ; =0x00004688
	add r3, sp, #0
	add r5, r4, r2
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	str r0, [r3]
	add r0, r2, #0
	add r0, #0x14
	ldr r0, [r4, r0]
	cmp r0, #2
	bne _02094B48
	add r0, r2, #0
	sub r2, r2, #4
	ldr r2, [r4, r2]
	add r0, #0x30
	lsl r2, r2, #0x18
	ldr r0, [r4, r0]
	mov r1, #3
	lsr r2, r2, #0x18
	bl sub_02095D40
	b _02094B5C
_02094B48:
	add r0, r2, #0
	sub r2, r2, #4
	ldr r2, [r4, r2]
	add r0, #0x30
	lsl r2, r2, #0x18
	ldr r0, [r4, r0]
	mov r1, #2
	lsr r2, r2, #0x18
	bl sub_02095D40
_02094B5C:
	ldr r1, _02094BFC ; =0x000046A0
	add r0, r1, #0
	sub r0, #0x1c
	ldr r2, [r4, r0]
	ldr r3, [r4, r1]
	mov r0, #0x34
	mul r0, r2
	sub r1, #0x18
	ldr r0, [r3, r0]
	add r1, r4, r1
	bl sub_020247D4
	ldr r0, _02094BFC ; =0x000046A0
	ldr r2, [r4, r0]
	sub r0, #0x1c
	ldr r1, [r4, r0]
	mov r0, #0x34
	mul r0, r1
	ldr r0, [r2, r0]
	mov r1, #6
	bl sub_02024ADC
	mov r0, #0x23
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	add r1, sp, #0
	bl sub_020247D4
	mov r0, #0x23
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0x2d
	bl sub_020248F0
	ldr r0, _02094C00 ; =0x000046BC
	ldr r1, [r4, r0]
	cmp r1, #0
	beq _02094BAC
	mov r1, #0
	str r1, [r4, r0]
_02094BAC:
	ldr r0, _02094C04 ; =0x00004680
	mov r1, #0
	str r1, [r4, r0]
	sub r3, r1, #1
	add r2, r0, #4
	str r3, [r4, r2]
	add r2, r0, #0
	add r2, #8
	str r1, [r4, r2]
	add r2, r0, #0
	add r2, #0xc
	str r1, [r4, r2]
	add r2, r0, #0
	add r2, #0x10
	str r1, [r4, r2]
	add r2, r0, #0
	add r2, #0x14
	str r1, [r4, r2]
	add r2, r0, #0
	add r2, #0x18
	str r1, [r4, r2]
	add r2, r0, #0
	add r2, #0x20
	str r1, [r4, r2]
	add r0, #0x1c
	str r1, [r4, r0]
	mov r0, #0x7b
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_02024830
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_02094BF0: .word 0x0000469C
_02094BF4: .word 0x000046B8
_02094BF8: .word 0x00004688
_02094BFC: .word 0x000046A0
_02094C00: .word 0x000046BC
_02094C04: .word 0x00004680
	thumb_func_end sub_02094A90

	thumb_func_start sub_02094C08
sub_02094C08: ; 0x02094C08
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	mov r0, #0x83
	add r7, r2, #0
	lsl r0, r0, #2
	mul r0, r7
	add r5, r3, #0
	add r4, r1, r0
	cmp r5, #0
	beq _02094C64
	ldrh r1, [r6, #8]
	ldrh r2, [r6, #0xa]
	ldr r0, [r6]
	bl sub_020741BC
	ldr r2, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	add r1, sp, #0
	bl sub_02094C6C
	ldr r0, [sp]
	add r1, r4, #0
	mov r2, #2
	ldr r0, [r0, #0x14]
	add r1, #0xc
	lsl r2, r2, #8
	bl MIi_CpuCopyFast
	ldr r1, [sp, #0x20]
	lsl r0, r7, #4
	add r0, r1, r0
	lsl r0, r0, #5
	str r0, [r4]
	str r5, [r4, #8]
	ldrh r1, [r6, #0xa]
	ldrh r2, [r6, #8]
	ldr r0, [r6]
	bl sub_02074364
	add r0, #8
	str r0, [r4, #4]
	ldr r1, [r4, #4]
	add r0, r5, #0
	bl sub_02024A14
	pop {r3, r4, r5, r6, r7, pc}
_02094C64:
	mov r0, #0
	str r0, [r4, #8]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02094C08

	thumb_func_start sub_02094C6C
sub_02094C6C: ; 0x02094C6C
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r5, r1, #0
	add r4, r2, #0
	add r0, r3, #0
	add r1, r6, #0
	bl NARC_ReadWholeMember
	add r0, r4, #0
	add r1, r5, #0
	bl NNS_G2dGetUnpackedBGCharacterData
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02094C6C

	thumb_func_start sub_02094C88
sub_02094C88: ; 0x02094C88
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r6, r1, #0
	add r5, r0, #0
	cmp r6, #0x12
	bne _02094CB2
	ldr r2, _02094D0C ; =0x0000012A
	ldr r3, [r5, #4]
	mov r0, #1
	mov r1, #0x1b
	bl NewMsgDataFromNarc
	add r6, r0, #0
	mov r1, #1
	bl NewString_ReadMsgData
	add r4, r0, #0
	add r0, r6, #0
	bl DestroyMsgData
	b _02094CC8
_02094CB2:
	ldr r1, [r5, #4]
	mov r0, #0x40
	bl String_ctor
	ldr r3, _02094D10 ; =0x0000463C
	add r2, r6, #0
	ldr r1, [r5, r3]
	add r3, #0x10
	ldr r3, [r5, r3]
	add r4, r0, #0
	blx r3
_02094CC8:
	ldr r0, _02094D14 ; =0x00004650
	mov r1, #0
	add r0, r5, r0
	bl FillWindowPixelBuffer
	mov r0, #0
	add r1, r4, #0
	add r2, r0, #0
	mov r3, #0x60
	bl sub_020030A0
	mov r1, #0
	add r3, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _02094D18 ; =0x00010200
	add r2, r4, #0
	str r0, [sp, #8]
	ldr r0, _02094D14 ; =0x00004650
	str r1, [sp, #0xc]
	add r0, r5, r0
	bl AddTextPrinterParameterized2
	ldr r0, _02094D14 ; =0x00004650
	add r0, r5, r0
	bl CopyWindowToVram
	add r0, r4, #0
	bl String_dtor
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_02094D0C: .word 0x0000012A
_02094D10: .word 0x0000463C
_02094D14: .word 0x00004650
_02094D18: .word 0x00010200
	thumb_func_end sub_02094C88

	thumb_func_start sub_02094D1C
sub_02094D1C: ; 0x02094D1C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r2, _02094D90 ; =0x0000012A
	ldr r3, [r5, #4]
	mov r0, #1
	mov r1, #0x1b
	bl NewMsgDataFromNarc
	mov r1, #0
	add r6, r0, #0
	bl NewString_ReadMsgData
	add r4, r0, #0
	ldr r0, _02094D94 ; =0x00004670
	mov r1, #0
	add r0, r5, r0
	bl FillWindowPixelBuffer
	ldrb r0, [r5, #0x13]
	cmp r0, #0
	beq _02094D78
	ldr r0, _02094D94 ; =0x00004670
	add r0, r5, r0
	bl GetWindowWidth
	lsl r3, r0, #3
	mov r0, #4
	add r1, r4, #0
	mov r2, #0
	bl sub_020030A0
	mov r1, #0
	add r3, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _02094D98 ; =0x000F0100
	add r2, r4, #0
	str r0, [sp, #8]
	ldr r0, _02094D94 ; =0x00004670
	str r1, [sp, #0xc]
	add r0, r5, r0
	mov r1, #4
	bl AddTextPrinterParameterized2
_02094D78:
	ldr r0, _02094D94 ; =0x00004670
	add r0, r5, r0
	bl CopyWindowToVram
	add r0, r4, #0
	bl String_dtor
	add r0, r6, #0
	bl DestroyMsgData
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02094D90: .word 0x0000012A
_02094D94: .word 0x00004670
_02094D98: .word 0x000F0100
	thumb_func_end sub_02094D1C

	thumb_func_start sub_02094D9C
sub_02094D9C: ; 0x02094D9C
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r4, r1, #0
	bl sub_02094DF8
	ldr r0, _02094DF4 ; =gMain + 0x60
	mov r1, #1
	strb r1, [r0, #9]
	bl GX_SwapDisplay
	mov r1, #0
	mov r0, #0xc0
	str r0, [sp]
	mov r0, #0x97
	add r2, r1, #0
	add r3, r1, #0
	str r4, [sp, #4]
	bl GfGfxLoader_GXLoadPal
	mov r0, #0
	str r0, [sp]
	mov r0, #5
	lsl r0, r0, #0xa
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r1, #2
	mov r0, #0x97
	add r2, r5, #0
	add r3, r1, #0
	str r4, [sp, #0xc]
	bl GfGfxLoader_LoadCharData
	mov r1, #0
	add r0, r5, #0
	add r2, r1, #0
	mov r3, #1
	str r1, [sp]
	bl BG_FillCharDataRange
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_02094DF4: .word gMain + 0x60
	thumb_func_end sub_02094D9C

	thumb_func_start sub_02094DF8
sub_02094DF8: ; 0x02094DF8
	push {r3, r4, r5, lr}
	sub sp, #0x70
	ldr r5, _02094EA4 ; =_021083E4
	add r4, r0, #0
	ldmia r5!, {r0, r1}
	add r3, sp, #0x54
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #0
	str r0, [r3]
	add r0, r4, #0
	add r3, r1, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #0
	bl BgClearTilemapBufferAndCommit
	ldr r5, _02094EA8 ; =_021083C8
	add r3, sp, #0x38
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #1
	str r0, [r3]
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #1
	bl BgClearTilemapBufferAndCommit
	ldr r5, _02094EAC ; =_021083AC
	add r3, sp, #0x1c
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #2
	str r0, [r3]
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	ldr r5, _02094EB0 ; =_02108400
	add r3, sp, #0
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #3
	str r0, [r3]
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	add sp, #0x70
	pop {r3, r4, r5, pc}
	nop
_02094EA4: .word _021083E4
_02094EA8: .word _021083C8
_02094EAC: .word _021083AC
_02094EB0: .word _02108400
	thumb_func_end sub_02094DF8

	thumb_func_start sub_02094EB4
sub_02094EB4: ; 0x02094EB4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldrb r0, [r5, #0xd]
	mov r6, #0
	cmp r0, #0
	ble _02094F12
	add r4, r6, #0
	sub r7, r6, #1
_02094EC4:
	mov r0, #0x8d
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	add r0, r0, r4
	ldr r1, [r0, #4]
	cmp r1, r7
	beq _02094F00
	ldrb r2, [r5, #0xf]
	ldr r1, [r0, #8]
	cmp r2, r1
	bne _02094F00
	ldr r0, [r0]
	mov r1, #1
	bl sub_02024830
	mov r0, #0x8d
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	add r0, r0, r4
	ldr r1, [r0, #4]
	mov r0, #0x34
	mul r0, r1
	add r1, r5, r0
	mov r0, #0x66
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #1
	bl sub_02024B78
	b _02094F08
_02094F00:
	ldr r0, [r0]
	mov r1, #0
	bl sub_02024830
_02094F08:
	ldrb r0, [r5, #0xd]
	add r6, r6, #1
	add r4, #0xc
	cmp r6, r0
	blt _02094EC4
_02094F12:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02094EB4

	thumb_func_start sub_02094F14
sub_02094F14: ; 0x02094F14
	push {r3, r4, r5, lr}
	add r4, r2, #0
	ldr r2, _02094F58 ; =0x00004640
	ldr r0, [r0, r2]
	bl GetPartyMonByIndex
	add r5, r0, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	str r0, [r4]
	add r0, r5, #0
	mov r1, #0x4c
	mov r2, #0
	bl GetMonData
	strh r0, [r4, #8]
	add r0, r5, #0
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	strh r0, [r4, #0xa]
	add r0, r5, #0
	mov r1, #6
	mov r2, #0
	bl GetMonData
	strh r0, [r4, #0xc]
	mov r0, #0
	strh r0, [r4, #0xe]
	pop {r3, r4, r5, pc}
	nop
_02094F58: .word 0x00004640
	thumb_func_end sub_02094F14

	thumb_func_start sub_02094F5C
sub_02094F5C: ; 0x02094F5C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r6, r1, #0
	add r5, r0, #0
	lsl r7, r6, #4
	ldr r1, _02095010 ; =0x0000088C
	add r0, r5, r7
	ldr r2, [r0, r1]
	mov r0, #0xc
	add r4, r2, #0
	add r1, #0x44
	mul r4, r0
	ldr r0, [r5, r1]
	add r2, r0, r4
	ldr r1, [r2, #8]
	ldr r0, [r0, r4]
	str r1, [sp, #4]
	ldr r1, [r2, #4]
	str r1, [sp]
	mov r1, #0
	bl sub_02024830
	mov r0, #0x8d
	lsl r0, r0, #4
	ldr r2, [r5, r0]
	mov r1, #0
	mvn r1, r1
	add r2, r2, r4
	str r1, [r2, #4]
	ldrb r1, [r5, #0xe]
	sub r1, r1, #1
	strb r1, [r5, #0xe]
	ldrb r2, [r5, #0xf]
	ldr r1, [sp, #4]
	cmp r1, r2
	bne _02094FBA
	ldr r0, [sp]
	mov r1, #0x34
	mul r1, r0
	mov r0, #0x66
	add r1, r5, r1
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #0
	bl sub_02024B78
	b _02094FE6
_02094FBA:
	mov r1, #0x34
	mul r1, r6
	add r1, r5, r1
	sub r0, #0xe8
	ldr r0, [r1, r0]
	bl sub_020248AC
	add r1, r0, #0
	ldr r0, _02095014 ; =0x000008C4
	ldr r0, [r5, r0]
	bl sub_020247D4
	ldr r0, _02095014 ; =0x000008C4
	mov r1, #1
	ldr r0, [r5, r0]
	bl sub_02024830
	ldr r0, _02095014 ; =0x000008C4
	mov r1, #0x32
	ldr r0, [r5, r0]
	bl sub_020248F0
_02094FE6:
	mov r2, #0x89
	mov r1, #0
	add r0, r5, r7
	lsl r2, r2, #4
	str r1, [r0, r2]
	mov r0, #0x34
	mul r0, r6
	add r0, r5, r0
	sub r2, #0xa8
	ldr r0, [r0, r2]
	bl sub_02024830
	ldr r0, _02095018 ; =0x000046A4
	mov r2, #0
	ldr r1, [r5, r0]
	lsl r0, r6, #3
	add r0, r1, r0
	str r2, [r0, #4]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02095010: .word 0x0000088C
_02095014: .word 0x000008C4
_02095018: .word 0x000046A4
	thumb_func_end sub_02094F5C

	thumb_func_start sub_0209501C
sub_0209501C: ; 0x0209501C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r1, #0
	mov r1, #0
	add r4, r0, #0
	str r1, [sp]
	ldr r0, [r4, #4]
	add r6, r2, #0
	str r0, [sp, #4]
	ldr r0, [r4]
	ldr r2, _020950B0 ; =0x000003D2
	mov r3, #0xb
	bl sub_0200E644
	mov r0, #0x15
	str r0, [sp]
	str r0, [sp, #4]
	mov r3, #2
	ldr r1, _020950B4 ; =0x00004660
	str r3, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	mov r0, #0xc6
	str r0, [sp, #0x10]
	ldr r0, [r4]
	add r1, r4, r1
	mov r2, #3
	bl AddWindowParameterized
	ldr r2, _020950B8 ; =0x0000012A
	ldr r3, [r4, #4]
	mov r0, #1
	mov r1, #0x1b
	bl NewMsgDataFromNarc
	add r1, r5, #0
	add r7, r0, #0
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r0, _020950B4 ; =0x00004660
	mov r1, #0xf
	add r0, r4, r0
	bl FillWindowPixelBuffer
	mov r3, #0
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _020950BC ; =0x0001020F
	add r1, r6, #0
	str r0, [sp, #8]
	ldr r0, _020950B4 ; =0x00004660
	add r2, r5, #0
	add r0, r4, r0
	str r3, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r5, #0
	bl String_dtor
	add r0, r7, #0
	bl DestroyMsgData
	ldr r0, _020950B4 ; =0x00004660
	add r0, r4, r0
	bl CopyWindowToVram
	mov r0, #8
	mov r1, #1
	bl GX_EngineAToggleLayers
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_020950B0: .word 0x000003D2
_020950B4: .word 0x00004660
_020950B8: .word 0x0000012A
_020950BC: .word 0x0001020F
	thumb_func_end sub_0209501C

	thumb_func_start sub_020950C0
sub_020950C0: ; 0x020950C0
	push {r3, lr}
	ldrb r1, [r0, #0xd]
	cmp r1, #1
	bne _020950D0
	mov r1, #5
	mov r2, #1
	bl sub_0209501C
_020950D0:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_020950C0

	thumb_func_start sub_020950D4
sub_020950D4: ; 0x020950D4
	push {r4, lr}
	add r4, r0, #0
	ldrb r0, [r4, #0xd]
	cmp r0, #1
	bne _020950F2
	ldr r0, _020950F4 ; =0x00004660
	add r0, r4, r0
	bl GetWindowBgConfig
	cmp r0, #0
	beq _020950F2
	ldr r0, _020950F4 ; =0x00004660
	add r0, r4, r0
	bl RemoveWindow
_020950F2:
	pop {r4, pc}
	.balign 4, 0
_020950F4: .word 0x00004660
	thumb_func_end sub_020950D4

	thumb_func_start sub_020950F8
sub_020950F8: ; 0x020950F8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _0209511A
	cmp r1, #0
	beq _0209510E
	mov r0, #8
	mov r1, #0
	bl GX_EngineAToggleLayers
_0209510E:
	add r0, r4, #0
	bl ClearWindowTilemapAndCopyToVram
	add r0, r4, #0
	bl RemoveWindow
_0209511A:
	pop {r4, pc}
	thumb_func_end sub_020950F8

	thumb_func_start sub_0209511C
sub_0209511C: ; 0x0209511C
	push {r4, r5, r6, r7}
	ldrb r1, [r0, #0xd]
	mov r4, #0
	cmp r1, #0
	ble _0209514C
	ldr r1, _02095150 ; =0x00000888
	ldr r2, _02095154 ; =0x000046B4
	add r5, r0, #0
	add r6, r4, #0
_0209512E:
	ldr r3, _02095158 ; =0x00000884
	ldr r7, _02095154 ; =0x000046B4
	ldr r3, [r5, r3]
	ldr r7, [r0, r7]
	add r4, r4, #1
	str r3, [r7, r6]
	ldr r7, [r0, r2]
	ldr r3, [r5, r1]
	add r7, r7, r6
	str r3, [r7, #4]
	ldrb r3, [r0, #0xd]
	add r5, #0x10
	add r6, #8
	cmp r4, r3
	blt _0209512E
_0209514C:
	pop {r4, r5, r6, r7}
	bx lr
	.balign 4, 0
_02095150: .word 0x00000888
_02095154: .word 0x000046B4
_02095158: .word 0x00000884
	thumb_func_end sub_0209511C

	thumb_func_start sub_0209515C
sub_0209515C: ; 0x0209515C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r7, #0x66
	mov r6, #0
	add r4, r5, #0
	lsl r7, r7, #2
_02095168:
	ldr r0, [r4, r7]
	cmp r0, #0
	beq _02095172
	bl sub_02024758
_02095172:
	add r6, r6, #1
	add r4, #0x34
	cmp r6, #0x1e
	blt _02095168
	ldrb r0, [r5, #0xd]
	mov r6, #0
	cmp r0, #0
	ble _0209519A
	ldr r7, _02095220 ; =0x000007E8
	add r4, r5, #0
_02095186:
	ldr r0, [r4, r7]
	cmp r0, #0
	beq _02095190
	bl sub_02024758
_02095190:
	ldrb r0, [r5, #0xd]
	add r6, r6, #1
	add r4, #0x34
	cmp r6, r0
	blt _02095186
_0209519A:
	mov r6, #0
	cmp r0, #0
	ble _020951BC
	mov r7, #0x8d
	add r4, r6, #0
	lsl r7, r7, #4
_020951A6:
	ldr r0, [r5, r7]
	ldr r0, [r0, r4]
	cmp r0, #0
	beq _020951B2
	bl sub_02024758
_020951B2:
	ldrb r0, [r5, #0xd]
	add r6, r6, #1
	add r4, #0xc
	cmp r6, r0
	blt _020951A6
_020951BC:
	ldr r0, _02095224 ; =0x000008B4
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _020951C8
	bl sub_02024758
_020951C8:
	ldr r0, _02095228 ; =0x000008BC
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _020951D4
	bl sub_02024758
_020951D4:
	ldr r0, _0209522C ; =0x000008B8
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _020951E0
	bl sub_02024758
_020951E0:
	ldr r0, _02095230 ; =0x000008C4
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _020951EC
	bl sub_02024758
_020951EC:
	mov r0, #0x23
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _020951FA
	bl sub_02024758
_020951FA:
	ldrb r1, [r5, #0xd]
	mov r0, #3
	mov r4, #0
	sub r0, r0, r1
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	cmp r6, #0
	ble _0209521E
	ldr r7, _02095234 ; =0x000008C8
_0209520C:
	ldr r0, [r5, r7]
	cmp r0, #0
	beq _02095216
	bl sub_02024758
_02095216:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, r6
	blt _0209520C
_0209521E:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02095220: .word 0x000007E8
_02095224: .word 0x000008B4
_02095228: .word 0x000008BC
_0209522C: .word 0x000008B8
_02095230: .word 0x000008C4
_02095234: .word 0x000008C8
	thumb_func_end sub_0209515C

	thumb_func_start sub_02095238
sub_02095238: ; 0x02095238
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r4, r0, #0
	ldr r0, _02095348 ; =0x000046B8
	mov r5, #0
	ldr r0, [r4, r0]
	bl sub_02095DD8
	add r7, r0, #0
	ldr r0, _02095348 ; =0x000046B8
	ldr r0, [r4, r0]
	bl sub_02095DE8
	add r1, r5, #0
	add r6, r0, #0
	str r1, [sp, #0x14]
	cmp r7, #6
	bhi _0209532C
	add r1, r7, r7
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02095268: ; jump table
	.short _0209532C - _02095268 - 2 ; case 0
	.short _0209531E - _02095268 - 2 ; case 1
	.short _02095286 - _02095268 - 2 ; case 2
	.short _020952B4 - _02095268 - 2 ; case 3
	.short _020952C8 - _02095268 - 2 ; case 4
	.short _02095276 - _02095268 - 2 ; case 5
	.short _02095286 - _02095268 - 2 ; case 6
_02095276:
	mov r0, #5
	lsl r0, r0, #0x10
	str r0, [sp, #0xc]
	mov r0, #1
	lsl r0, r0, #0x10
	str r0, [sp, #0x10]
	mov r5, #1
	b _0209532C
_02095286:
	mov r1, #6
	bl _s32_div_f
	lsl r0, r1, #0x18
	lsr r1, r0, #0x18
	mov r0, #0x18
	mul r0, r1
	add r0, #0x14
	lsl r0, r0, #0xc
	str r0, [sp, #0xc]
	add r0, r6, #0
	mov r1, #6
	bl _s32_div_f
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	mov r0, #0x18
	mul r0, r1
	add r0, #0x28
	lsl r0, r0, #0xc
	str r0, [sp, #0x10]
	mov r5, #1
	b _0209532C
_020952B4:
	mov r0, #0x35
	lsl r0, r0, #0xe
	str r0, [sp, #0xc]
	add r1, r6, #1
	mov r0, #0x28
	mul r0, r1
	lsl r0, r0, #0xc
	str r0, [sp, #0x10]
	mov r5, #1
	b _0209532C
_020952C8:
	mov r0, #0x35
	lsl r0, r0, #0xe
	add r1, r6, #1
	str r0, [sp, #0xc]
	mov r0, #0x28
	add r5, r1, #0
	mul r5, r0
	lsl r0, r5, #0xc
	ldr r2, _0209534C ; =0x000046BC
	str r0, [sp, #0x10]
	ldr r0, [r4, r2]
	cmp r0, #0
	beq _0209531A
	add r6, sp, #0xc
	ldmia r6!, {r0, r1}
	add r3, sp, #0
	add r7, r3, #0
	stmia r3!, {r0, r1}
	ldr r0, [r6]
	str r0, [r3]
	mov r0, #1
	ldr r1, [sp, #4]
	lsl r0, r0, #0xe
	sub r0, r1, r0
	str r0, [sp, #4]
	add r0, r2, #0
	sub r2, #0x38
	sub r0, #0x1c
	ldr r2, [r4, r2]
	mov r1, #0x34
	ldr r0, [r4, r0]
	mul r1, r2
	ldr r0, [r0, r1]
	add r1, r7, #0
	bl sub_020247D4
	ldr r0, _02095350 ; =0x00004694
	mov r1, #0xd4
	str r1, [r4, r0]
	add r0, r0, #4
	str r5, [r4, r0]
_0209531A:
	mov r5, #1
	b _0209532C
_0209531E:
	mov r0, #0xe
	lsl r0, r0, #0x10
	str r0, [sp, #0xc]
	mov r0, #0xb
	lsl r0, r0, #0x10
	str r0, [sp, #0x10]
	mov r5, #1
_0209532C:
	cmp r5, #0
	beq _02095342
	mov r0, #0x23
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	add r1, sp, #0xc
	bl sub_020247D4
	add r0, r4, #0
	bl sub_020956B8
_02095342:
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02095348: .word 0x000046B8
_0209534C: .word 0x000046BC
_02095350: .word 0x00004694
	thumb_func_end sub_02095238

	thumb_func_start sub_02095354
sub_02095354: ; 0x02095354
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r4, r0, #0
	ldr r0, _020954B8 ; =0x000046B8
	mov r5, #0
	ldr r0, [r4, r0]
	bl sub_02095DD8
	add r6, r0, #0
	ldr r0, _020954B8 ; =0x000046B8
	ldr r0, [r4, r0]
	bl sub_02095DE8
	add r7, r0, #0
	cmp r6, #6
	bhi _0209539A
	add r0, r6, r6
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02095380: ; jump table
	.short _020954B2 - _02095380 - 2 ; case 0
	.short _020954A2 - _02095380 - 2 ; case 1
	.short _0209538E - _02095380 - 2 ; case 2
	.short _02095442 - _02095380 - 2 ; case 3
	.short _020954AC - _02095380 - 2 ; case 4
	.short _020954B2 - _02095380 - 2 ; case 5
	.short _0209538E - _02095380 - 2 ; case 6
_0209538E:
	add r0, r4, #0
	add r1, r7, #0
	bl sub_02094794
	cmp r0, #1
	beq _0209539C
_0209539A:
	b _020954B2
_0209539C:
	add r0, r4, #0
	mov r1, #1
	add r2, r7, #0
	bl sub_020948C4
	ldrb r0, [r4, #0xd]
	cmp r0, #0
	ble _0209543A
	ldr r2, _020954BC ; =0x000046A4
	add r1, r5, #0
	add r6, sp, #0x18
	add r0, r5, #0
_020953B4:
	str r0, [r6]
	str r0, [r6, #4]
	str r0, [r6, #8]
	ldr r3, [r4, r2]
	add r3, r3, r1
	ldr r3, [r3, #4]
	cmp r3, #0
	bne _02095430
	ldr r2, _020954C0 ; =0x00004694
	mov r0, #0xd4
	str r0, [r4, r2]
	lsl r0, r5, #0x18
	lsr r0, r0, #0x18
	add r1, r0, #1
	mov r0, #0x28
	add r3, r1, #0
	mul r3, r0
	add r0, r2, #4
	str r3, [r4, r0]
	ldr r0, [r4, r2]
	add r3, sp, #0xc
	lsl r0, r0, #0xc
	str r0, [sp, #0x18]
	add r0, r2, #4
	ldr r0, [r4, r0]
	add r7, r3, #0
	lsl r0, r0, #0xc
	str r0, [sp, #0x1c]
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r6]
	str r0, [r3]
	mov r0, #1
	ldr r1, [sp, #0x10]
	lsl r0, r0, #0xe
	sub r0, r1, r0
	str r0, [sp, #0x10]
	add r0, r2, #0
	sub r2, #0x10
	add r0, #0xc
	ldr r2, [r4, r2]
	mov r1, #0x34
	ldr r0, [r4, r0]
	mul r1, r2
	ldr r0, [r0, r1]
	add r1, r7, #0
	bl sub_020247D4
	mov r0, #0x23
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	add r1, sp, #0x18
	bl sub_020247D4
	ldr r0, _020954B8 ; =0x000046B8
	lsl r2, r5, #0x18
	ldr r0, [r4, r0]
	mov r1, #4
	lsr r2, r2, #0x18
	bl sub_02095D40
	b _0209543A
_02095430:
	ldrb r3, [r4, #0xd]
	add r5, r5, #1
	add r1, #8
	cmp r5, r3
	blt _020953B4
_0209543A:
	ldr r0, _020954C4 ; =0x000046BC
	mov r5, #1
	str r5, [r4, r0]
	b _020954B2
_02095442:
	add r0, r4, #0
	add r1, r7, #0
	bl sub_02094860
	cmp r0, #1
	bne _020954B2
	add r0, r4, #0
	mov r1, #2
	add r2, r7, #0
	bl sub_020948C4
	ldr r0, _020954C8 ; =0x000046A0
	ldr r2, [r4, r0]
	sub r0, #0x1c
	ldr r1, [r4, r0]
	mov r0, #0x34
	mul r0, r1
	ldr r0, [r2, r0]
	bl sub_020248AC
	add r5, r0, #0
	add r3, sp, #0
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	str r0, [r3]
	mov r0, #1
	ldr r1, [sp, #4]
	lsl r0, r0, #0xe
	sub r0, r1, r0
	str r0, [sp, #4]
	ldr r0, _020954C8 ; =0x000046A0
	ldr r3, [r4, r0]
	sub r0, #0x1c
	ldr r1, [r4, r0]
	mov r0, #0x34
	mul r0, r1
	ldr r0, [r3, r0]
	add r1, r2, #0
	bl sub_020247D4
	ldr r0, _020954C4 ; =0x000046BC
	mov r5, #1
	str r5, [r4, r0]
	mov r0, #4
	str r0, [r4, #0x14]
	b _020954B2
_020954A2:
	add r0, r4, #0
	bl sub_0209569C
	mov r5, #3
	b _020954B2
_020954AC:
	add r0, r4, #0
	bl sub_02094A70
_020954B2:
	add r0, r5, #0
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_020954B8: .word 0x000046B8
_020954BC: .word 0x000046A4
_020954C0: .word 0x00004694
_020954C4: .word 0x000046BC
_020954C8: .word 0x000046A0
	thumb_func_end sub_02095354

	thumb_func_start sub_020954CC
sub_020954CC: ; 0x020954CC
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, _02095538 ; =0x000046B8
	mov r4, #0
	ldr r0, [r5, r0]
	bl sub_02095DD8
	cmp r0, #1
	beq _020954F4
	cmp r0, #4
	bne _020954FE
	ldr r0, _0209553C ; =0x000005DC
	bl PlaySE
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02094A90
	b _02095532
_020954F4:
	add r0, r5, #0
	bl sub_0209569C
	mov r4, #3
	b _02095532
_020954FE:
	ldrb r0, [r5, #0x13]
	cmp r0, #0
	beq _02095532
	ldr r0, _02095538 ; =0x000046B8
	mov r1, #1
	ldr r0, [r5, r0]
	add r2, r4, #0
	bl sub_02095D40
	mov r0, #0xe
	lsl r0, r0, #0x10
	str r0, [sp]
	mov r0, #0xb
	lsl r0, r0, #0x10
	str r0, [sp, #4]
	add r0, r4, #0
	str r0, [sp, #8]
	mov r0, #0x23
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	add r1, sp, #0
	bl sub_020247D4
	ldr r0, _0209553C ; =0x000005DC
	bl PlaySE
_02095532:
	add r0, r4, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_02095538: .word 0x000046B8
_0209553C: .word 0x000005DC
	thumb_func_end sub_020954CC

	thumb_func_start sub_02095540
sub_02095540: ; 0x02095540
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldrb r0, [r5, #0xf]
	cmp r0, #0
	bne _02095550
	ldrb r0, [r5, #0x10]
	b _02095550
_02095550:
	sub r0, r0, #1
	strb r0, [r5, #0xf]
	ldr r0, _020955E0 ; =0x000008BC
	mov r1, #1
	ldr r0, [r5, r0]
	bl sub_020248F0
	add r0, r5, #0
	bl sub_020943EC
	ldr r0, _020955E4 ; =0x000005DC
	bl PlaySE
	ldrb r0, [r5, #0xf]
	cmp r0, #0x12
	ldr r0, _020955E8 ; =0x000046B8
	bne _020955BE
	ldr r0, [r5, r0]
	bl sub_02095DD8
	cmp r0, #2
	bne _020955DC
	ldr r0, _020955E8 ; =0x000046B8
	ldr r0, [r5, r0]
	bl sub_02095DE8
	mov r1, #6
	bl _s32_div_f
	lsl r0, r1, #0x18
	lsr r4, r0, #0x18
	ldr r0, _020955E8 ; =0x000046B8
	mov r1, #6
	ldr r0, [r5, r0]
	add r2, r4, #0
	bl sub_02095D40
	mov r0, #0x18
	mul r0, r4
	add r0, #0x14
	lsl r0, r0, #0xc
	str r0, [sp]
	mov r0, #0xa
	lsl r0, r0, #0xe
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #0x23
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	add r1, sp, #0
	bl sub_020247D4
	add sp, #0xc
	pop {r4, r5, pc}
_020955BE:
	ldr r0, [r5, r0]
	bl sub_02095DD8
	cmp r0, #6
	bne _020955DC
	ldr r0, _020955E8 ; =0x000046B8
	ldr r0, [r5, r0]
	bl sub_02095DE8
	add r2, r0, #0
	ldr r0, _020955E8 ; =0x000046B8
	mov r1, #2
	ldr r0, [r5, r0]
	bl sub_02095D40
_020955DC:
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_020955E0: .word 0x000008BC
_020955E4: .word 0x000005DC
_020955E8: .word 0x000046B8
	thumb_func_end sub_02095540

	thumb_func_start sub_020955EC
sub_020955EC: ; 0x020955EC
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldrb r0, [r5, #0xf]
	add r0, r0, #1
	strb r0, [r5, #0xf]
	ldrb r1, [r5, #0xf]
	ldrb r0, [r5, #0x10]
	cmp r1, r0
	bne _02095604
	mov r0, #0
	strb r0, [r5, #0xf]
_02095604:
	ldr r0, _02095690 ; =0x000008B8
	mov r1, #3
	ldr r0, [r5, r0]
	bl sub_020248F0
	add r0, r5, #0
	bl sub_020943EC
	ldr r0, _02095694 ; =0x000005DC
	bl PlaySE
	ldrb r0, [r5, #0xf]
	cmp r0, #0x12
	ldr r0, _02095698 ; =0x000046B8
	bne _0209566E
	ldr r0, [r5, r0]
	bl sub_02095DD8
	cmp r0, #2
	bne _0209568C
	ldr r0, _02095698 ; =0x000046B8
	ldr r0, [r5, r0]
	bl sub_02095DE8
	mov r1, #6
	bl _s32_div_f
	lsl r0, r1, #0x18
	lsr r4, r0, #0x18
	ldr r0, _02095698 ; =0x000046B8
	mov r1, #6
	ldr r0, [r5, r0]
	add r2, r4, #0
	bl sub_02095D40
	mov r0, #0x18
	mul r0, r4
	add r0, #0x14
	lsl r0, r0, #0xc
	str r0, [sp]
	mov r0, #0xa
	lsl r0, r0, #0xe
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #0x23
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	add r1, sp, #0
	bl sub_020247D4
	add sp, #0xc
	pop {r4, r5, pc}
_0209566E:
	ldr r0, [r5, r0]
	bl sub_02095DD8
	cmp r0, #6
	bne _0209568C
	ldr r0, _02095698 ; =0x000046B8
	ldr r0, [r5, r0]
	bl sub_02095DE8
	add r2, r0, #0
	ldr r0, _02095698 ; =0x000046B8
	mov r1, #2
	ldr r0, [r5, r0]
	bl sub_02095D40
_0209568C:
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_02095690: .word 0x000008B8
_02095694: .word 0x000005DC
_02095698: .word 0x000046B8
	thumb_func_end sub_020955EC

	thumb_func_start sub_0209569C
sub_0209569C: ; 0x0209569C
	push {r3, lr}
	ldr r1, _020956B0 ; =0x000008B4
	ldr r0, [r0, r1]
	mov r1, #5
	bl sub_020248F0
	ldr r0, _020956B4 ; =0x000005DC
	bl PlaySE
	pop {r3, pc}
	.balign 4, 0
_020956B0: .word 0x000008B4
_020956B4: .word 0x000005DC
	thumb_func_end sub_0209569C

	thumb_func_start sub_020956B8
sub_020956B8: ; 0x020956B8
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	ldr r0, _02095768 ; =0x000046D8
	ldr r1, [r4, r0]
	cmp r1, #0
	beq _02095764
	sub r0, #0x20
	mov r6, #0
	mvn r6, r6
	ldr r0, [r4, r0]
	add r5, r6, #0
	bl sub_02095DD8
	cmp r0, #6
	bhi _0209573E
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_020956E2: ; jump table
	.short _0209573E - _020956E2 - 2 ; case 0
	.short _0209573E - _020956E2 - 2 ; case 1
	.short _020956F0 - _020956E2 - 2 ; case 2
	.short _0209570C - _020956E2 - 2 ; case 3
	.short _02095730 - _020956E2 - 2 ; case 4
	.short _0209573E - _020956E2 - 2 ; case 5
	.short _020956F0 - _020956E2 - 2 ; case 6
_020956F0:
	ldr r0, _0209576C ; =0x000046B8
	ldrb r5, [r4, #0xf]
	ldr r0, [r4, r0]
	bl sub_02095DE8
	add r7, r0, #0
	add r0, r4, #0
	add r1, r7, #0
	bl sub_020947C0
	cmp r0, #1
	bne _0209573E
	add r6, r7, #0
	b _0209573E
_0209570C:
	ldr r0, _0209576C ; =0x000046B8
	ldr r0, [r4, r0]
	bl sub_02095DE8
	add r7, r0, #0
	add r0, r4, #0
	add r1, r7, #0
	bl sub_02094894
	cmp r0, #1
	bne _0209573E
	lsl r0, r7, #4
	add r1, r4, r0
	ldr r0, _02095770 ; =0x00000884
	ldr r5, [r1, r0]
	add r0, r0, #4
	ldr r6, [r1, r0]
	b _0209573E
_02095730:
	ldr r0, _02095774 ; =0x00004680
	ldr r1, [r4, r0]
	cmp r1, #0
	beq _0209573E
	add r0, r0, #4
	ldrb r5, [r4, #0xf]
	ldr r6, [r4, r0]
_0209573E:
	ldr r0, _02095778 ; =0x000046E4
	ldr r1, [r4, r0]
	cmp r1, r5
	bne _0209574E
	sub r0, r0, #4
	ldr r0, [r4, r0]
	cmp r0, r6
	beq _0209575C
_0209574E:
	ldr r3, _0209577C ; =0x000046DC
	add r0, r5, #0
	ldr r2, [r4, r3]
	sub r3, r3, #4
	ldr r3, [r4, r3]
	add r1, r6, #0
	blx r3
_0209575C:
	ldr r0, _02095778 ; =0x000046E4
	str r5, [r4, r0]
	sub r0, r0, #4
	str r6, [r4, r0]
_02095764:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02095768: .word 0x000046D8
_0209576C: .word 0x000046B8
_02095770: .word 0x00000884
_02095774: .word 0x00004680
_02095778: .word 0x000046E4
_0209577C: .word 0x000046DC
	thumb_func_end sub_020956B8

	thumb_func_start sub_02095780
sub_02095780: ; 0x02095780
	mov r1, #0x16
	add r2, r1, #0
	ldr r3, _0209578C ; =G2x_SetBlendBrightness_
	ldr r0, _02095790 ; =0x04000050
	sub r2, #0x1d
	bx r3
	.balign 4, 0
_0209578C: .word G2x_SetBlendBrightness_
_02095790: .word 0x04000050
	thumb_func_end sub_02095780

	thumb_func_start sub_02095794
sub_02095794: ; 0x02095794
	push {r3, lr}
	ldr r0, _020957AC ; =0x04000050
	mov r1, #0
	strh r1, [r0]
	mov r2, #0xa
	str r2, [sp]
	mov r2, #4
	mov r3, #6
	bl G2x_SetBlendAlpha_
	pop {r3, pc}
	nop
_020957AC: .word 0x04000050
	thumb_func_end sub_02095794

	thumb_func_start sub_020957B0
sub_020957B0: ; 0x020957B0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, sp, #0x10
	mov r4, #0x10
	ldrsb r4, [r5, r4]
	add r7, r0, #0
	add r6, r1, #0
	str r4, [sp]
	bl sub_02095BF0
	str r0, [sp, #4]
	cmp r0, #4
	bhi _02095834
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_020957D6: ; jump table
	.short _02095834 - _020957D6 - 2 ; case 0
	.short _020957E0 - _020957D6 - 2 ; case 1
	.short _020957F6 - _020957D6 - 2 ; case 2
	.short _0209580C - _020957D6 - 2 ; case 3
	.short _02095822 - _020957D6 - 2 ; case 4
_020957E0:
	mov r0, #1
	ldrsb r1, [r6, r0]
	add r0, sp, #4
	add r2, sp, #4
	strb r1, [r0, #4]
	add r0, r7, #0
	mov r1, #3
	bl sub_02095CB8
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_020957F6:
	mov r0, #1
	ldrsb r1, [r6, r0]
	add r0, sp, #4
	add r2, sp, #4
	strb r1, [r0, #4]
	add r0, r7, #0
	mov r1, #3
	bl sub_02095CB8
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_0209580C:
	mov r0, #0
	ldrsb r1, [r6, r0]
	add r0, sp, #4
	add r2, sp, #4
	strb r1, [r0, #4]
	add r0, r7, #0
	mov r1, #5
	bl sub_02095CB8
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_02095822:
	mov r0, #0
	ldrsb r1, [r6, r0]
	add r0, sp, #4
	add r2, sp, #4
	strb r1, [r0, #4]
	add r0, r7, #0
	mov r1, #5
	bl sub_02095CB8
_02095834:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end sub_020957B0

	thumb_func_start sub_02095838
sub_02095838: ; 0x02095838
	push {r3, r4}
	ldr r0, [r3]
	cmp r0, #4
	bhi _020958BA
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0209584C: ; jump table
	.short _020958BA - _0209584C - 2 ; case 0
	.short _0209588C - _0209584C - 2 ; case 1
	.short _020958A8 - _0209584C - 2 ; case 2
	.short _02095870 - _0209584C - 2 ; case 3
	.short _02095856 - _0209584C - 2 ; case 4
_02095856:
	mov r0, #2
	strb r0, [r1]
	mov r0, #0
	strb r0, [r1, #1]
	ldrsb r4, [r1, r0]
	mov r0, #1
	ldrsb r3, [r1, r0]
	ldrb r0, [r2]
	mul r0, r3
	add r0, r4, r0
	strb r0, [r1, #2]
	pop {r3, r4}
	bx lr
_02095870:
	mov r0, #2
	strb r0, [r1]
	mov r0, #4
	strb r0, [r1, #1]
	mov r0, #0
	ldrsb r4, [r1, r0]
	mov r0, #1
	ldrsb r3, [r1, r0]
	ldrb r0, [r2]
	mul r0, r3
	add r0, r4, r0
	strb r0, [r1, #2]
	pop {r3, r4}
	bx lr
_0209588C:
	mov r0, #5
	strb r0, [r1]
	ldrb r0, [r3, #4]
	strb r0, [r1, #1]
	mov r0, #0
	ldrsb r4, [r1, r0]
	mov r0, #1
	ldrsb r3, [r1, r0]
	ldrb r0, [r2]
	mul r0, r3
	add r0, r4, r0
	strb r0, [r1, #2]
	pop {r3, r4}
	bx lr
_020958A8:
	mov r0, #0
	strb r0, [r1]
	ldrb r0, [r3, #4]
	strb r0, [r1, #1]
	mov r0, #1
	ldrsb r3, [r1, r0]
	ldrb r0, [r2]
	mul r0, r3
	strb r0, [r1, #2]
_020958BA:
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end sub_02095838

	thumb_func_start sub_020958C0
sub_020958C0: ; 0x020958C0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r6, sp, #0x10
	mov r5, #0x10
	ldrsb r5, [r6, r5]
	add r4, r0, #0
	add r7, r1, #0
	str r5, [sp]
	bl sub_02095BF0
	mov r2, #0
	str r0, [sp, #4]
	ldrsb r3, [r7, r2]
	add r1, sp, #4
	cmp r0, #1
	strb r3, [r1, #4]
	beq _020958F6
	cmp r0, #3
	bne _0209591C
	strb r2, [r1, #4]
	add r0, r4, #0
	mov r1, #3
	add r2, sp, #4
	bl sub_02095CB8
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_020958F6:
	ldr r0, [r4, #4]
	ldrb r0, [r0]
	cmp r0, #0x12
	bne _0209590E
	strb r2, [r1, #4]
	add r0, r4, #0
	mov r1, #6
	add r2, sp, #4
	bl sub_02095CB8
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_0209590E:
	mov r0, #4
	strb r0, [r1, #4]
	add r0, r4, #0
	mov r1, #2
	add r2, sp, #4
	bl sub_02095CB8
_0209591C:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end sub_020958C0

	thumb_func_start sub_02095920
sub_02095920: ; 0x02095920
	mov r0, #0
	strb r0, [r1]
	strb r0, [r1, #1]
	strb r0, [r1, #2]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02095920

	thumb_func_start sub_0209592C
sub_0209592C: ; 0x0209592C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r6, sp, #0x10
	mov r5, #0x10
	ldrsb r5, [r6, r5]
	add r4, r0, #0
	add r7, r1, #0
	str r5, [sp]
	bl sub_02095BF0
	str r0, [sp, #4]
	mov r1, #1
	ldrsb r1, [r7, r1]
	cmp r1, #0
	bne _02095952
	mov r2, #0
	add r1, sp, #4
	strb r2, [r1, #4]
	b _02095962
_02095952:
	cmp r1, #1
	add r1, sp, #4
	bne _0209595E
	mov r2, #2
	strb r2, [r1, #4]
	b _02095962
_0209595E:
	mov r2, #3
	strb r2, [r1, #4]
_02095962:
	cmp r0, #1
	beq _02095972
	cmp r0, #2
	beq _0209599A
	cmp r0, #4
	beq _020959C2
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_02095972:
	ldr r0, [r4, #4]
	add r2, sp, #4
	ldrb r0, [r0]
	cmp r0, #0x12
	bne _0209598E
	mov r1, #0
	add r0, sp, #4
	strb r1, [r0, #4]
	add r0, r4, #0
	mov r1, #6
	bl sub_02095CB8
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_0209598E:
	add r0, r4, #0
	mov r1, #2
	bl sub_02095CB8
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_0209599A:
	ldr r0, [r4, #4]
	add r2, sp, #4
	ldrb r0, [r0]
	cmp r0, #0x12
	bne _020959B6
	mov r1, #0
	add r0, sp, #4
	strb r1, [r0, #4]
	add r0, r4, #0
	mov r1, #6
	bl sub_02095CB8
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_020959B6:
	add r0, r4, #0
	mov r1, #2
	bl sub_02095CB8
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_020959C2:
	ldrb r0, [r4, #2]
	cmp r0, #0
	beq _020959D2
	add r0, r4, #0
	mov r1, #1
	add r2, sp, #4
	bl sub_02095CB8
_020959D2:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0209592C

	thumb_func_start sub_020959D8
sub_020959D8: ; 0x020959D8
	push {r4, r5, r6, lr}
	ldr r0, [r3]
	add r5, r1, #0
	add r4, r2, #0
	cmp r0, #1
	beq _02095A12
	cmp r0, #2
	beq _02095A12
	cmp r0, #3
	bne _02095A32
	ldrb r6, [r4]
	ldrb r0, [r4, #2]
	add r1, r6, #0
	sub r0, r0, #1
	bl _s32_div_f
	mul r0, r6
	strb r0, [r5, #2]
	ldrb r0, [r5, #2]
	ldrb r1, [r4]
	bl _s32_div_f
	strb r1, [r5]
	ldrb r0, [r5, #2]
	ldrb r1, [r4]
	bl _s32_div_f
	strb r0, [r5, #1]
	pop {r4, r5, r6, pc}
_02095A12:
	ldrb r0, [r3, #4]
	cmp r0, #2
	bhs _02095A1E
	mov r0, #0
	strb r0, [r5, #2]
	b _02095A2A
_02095A1E:
	bls _02095A26
	mov r0, #2
	strb r0, [r5, #2]
	b _02095A2A
_02095A26:
	mov r0, #1
	strb r0, [r5, #2]
_02095A2A:
	mov r0, #0
	strb r0, [r5]
	ldrb r0, [r5, #2]
	strb r0, [r5, #1]
_02095A32:
	pop {r4, r5, r6, pc}
	thumb_func_end sub_020959D8

	thumb_func_start sub_02095A34
sub_02095A34: ; 0x02095A34
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r6, sp, #0x10
	mov r5, #0x10
	ldrsb r5, [r6, r5]
	add r4, r0, #0
	str r5, [sp]
	bl sub_02095BF0
	mov r2, #0
	str r0, [sp, #4]
	add r1, sp, #4
	strb r2, [r1, #4]
	cmp r0, #3
	beq _02095A5A
	cmp r0, #4
	beq _02095A68
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
_02095A5A:
	add r0, r4, #0
	mov r1, #4
	add r2, sp, #4
	bl sub_02095CB8
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
_02095A68:
	add r0, r4, #0
	mov r1, #4
	add r2, sp, #4
	bl sub_02095CB8
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02095A34

	thumb_func_start sub_02095A78
sub_02095A78: ; 0x02095A78
	bx lr
	.balign 4, 0
	thumb_func_end sub_02095A78

	thumb_func_start sub_02095A7C
sub_02095A7C: ; 0x02095A7C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, sp, #0x10
	mov r4, #0x10
	ldrsb r4, [r5, r4]
	add r6, r0, #0
	add r7, r1, #0
	str r4, [sp]
	bl sub_02095BF0
	mov r1, #0
	str r0, [sp, #4]
	ldrsb r2, [r7, r1]
	add r1, sp, #4
	cmp r0, #4
	strb r2, [r1, #4]
	bhi _02095AF4
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02095AAA: ; jump table
	.short _02095AF4 - _02095AAA - 2 ; case 0
	.short _02095AF4 - _02095AAA - 2 ; case 1
	.short _02095AF4 - _02095AAA - 2 ; case 2
	.short _02095AB4 - _02095AAA - 2 ; case 3
	.short _02095AD6 - _02095AAA - 2 ; case 4
_02095AB4:
	ldr r0, [r6, #4]
	add r2, sp, #4
	ldrb r0, [r0]
	cmp r0, #0x12
	bne _02095ACA
	add r0, r6, #0
	mov r1, #6
	bl sub_02095CB8
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_02095ACA:
	add r0, r6, #0
	mov r1, #2
	bl sub_02095CB8
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_02095AD6:
	ldr r0, [r6, #4]
	add r2, sp, #4
	ldrb r0, [r0]
	cmp r0, #0x12
	bne _02095AEC
	add r0, r6, #0
	mov r1, #6
	bl sub_02095CB8
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_02095AEC:
	add r0, r6, #0
	mov r1, #2
	bl sub_02095CB8
_02095AF4:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end sub_02095A7C

	thumb_func_start sub_02095AF8
sub_02095AF8: ; 0x02095AF8
	mov r0, #0
	strb r0, [r1]
	strb r0, [r1, #1]
	strb r0, [r1, #2]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02095AF8

	thumb_func_start sub_02095B04
sub_02095B04: ; 0x02095B04
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, sp, #0x10
	mov r4, #0x10
	ldrsb r4, [r5, r4]
	add r7, r0, #0
	add r6, r1, #0
	str r4, [sp]
	bl sub_02095BF0
	mov r1, #0
	str r0, [sp, #4]
	ldrsb r3, [r6, r1]
	add r2, sp, #4
	cmp r0, #4
	strb r3, [r2, #4]
	bhi _02095B84
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02095B32: ; jump table
	.short _02095B84 - _02095B32 - 2 ; case 0
	.short _02095B3C - _02095B32 - 2 ; case 1
	.short _02095B50 - _02095B32 - 2 ; case 2
	.short _02095B64 - _02095B32 - 2 ; case 3
	.short _02095B76 - _02095B32 - 2 ; case 4
_02095B3C:
	mov r0, #1
	ldrsb r0, [r6, r0]
	mov r1, #3
	strb r0, [r2, #4]
	add r0, r7, #0
	add r2, sp, #4
	bl sub_02095CB8
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_02095B50:
	mov r0, #1
	ldrsb r0, [r6, r0]
	mov r1, #3
	strb r0, [r2, #4]
	add r0, r7, #0
	add r2, sp, #4
	bl sub_02095CB8
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_02095B64:
	ldrsb r0, [r6, r1]
	mov r1, #5
	strb r0, [r2, #4]
	add r0, r7, #0
	add r2, sp, #4
	bl sub_02095CB8
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_02095B76:
	ldrsb r0, [r6, r1]
	mov r1, #5
	strb r0, [r2, #4]
	add r0, r7, #0
	add r2, sp, #4
	bl sub_02095CB8
_02095B84:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end sub_02095B04

	thumb_func_start sub_02095B88
sub_02095B88: ; 0x02095B88
	push {r3, r4}
	ldr r0, [r3]
	cmp r0, #4
	bhi _02095BEA
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02095B9C: ; jump table
	.short _02095BEA - _02095B9C - 2 ; case 0
	.short _02095BC0 - _02095B9C - 2 ; case 1
	.short _02095BDA - _02095B9C - 2 ; case 2
	.short _02095BA6 - _02095B9C - 2 ; case 3
	.short _02095BA6 - _02095B9C - 2 ; case 4
_02095BA6:
	mov r0, #2
	strb r0, [r1]
	mov r0, #0
	strb r0, [r1, #1]
	ldrsb r4, [r1, r0]
	mov r0, #1
	ldrsb r3, [r1, r0]
	ldrb r0, [r2]
	mul r0, r3
	add r0, r4, r0
	strb r0, [r1, #2]
	pop {r3, r4}
	bx lr
_02095BC0:
	mov r0, #5
	strb r0, [r1]
	mov r0, #0
	strb r0, [r1, #1]
	ldrsb r4, [r1, r0]
	mov r0, #1
	ldrsb r3, [r1, r0]
	ldrb r0, [r2]
	mul r0, r3
	add r0, r4, r0
	strb r0, [r1, #2]
	pop {r3, r4}
	bx lr
_02095BDA:
	mov r0, #0
	strb r0, [r1]
	strb r0, [r1, #1]
	mov r0, #1
	ldrsb r3, [r1, r0]
	ldrb r0, [r2]
	mul r0, r3
	strb r0, [r1, #2]
_02095BEA:
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end sub_02095B88

	thumb_func_start sub_02095BF0
sub_02095BF0: ; 0x02095BF0
	push {r4, r5, r6, r7}
	add r7, r2, #0
	ldrb r2, [r7, #1]
	add r4, r1, #0
	mov r0, #0
	ldrb r1, [r7]
	mov ip, r2
	cmp r3, #0
	beq _02095C3C
	ldrsb r2, [r4, r0]
	add r2, r2, r3
	lsl r2, r2, #0x18
	asr r5, r2, #0x18
	ldr r2, _02095C8C ; =SDK_OVERLAY_OVY_1_ID
	ldrsb r6, [r4, r2]
	bpl _02095C14
	add r0, r2, #0
	b _02095C2E
_02095C14:
	cmp r5, r1
	blt _02095C1C
	mov r0, #2
	b _02095C2E
_02095C1C:
	add r2, r6, #0
	mul r2, r1
	add r2, r5, r2
	lsl r2, r2, #0x18
	lsr r3, r2, #0x18
	ldrb r2, [r7, #2]
	cmp r3, r2
	blo _02095C2E
	mov r0, #2
_02095C2E:
	cmp r0, #0
	bne _02095C86
	add r2, r6, #0
	mul r2, r1
	strb r5, [r4]
	add r2, r5, r2
	strb r2, [r4, #2]
_02095C3C:
	add r3, sp, #0
	mov r2, #0x10
	ldrsb r2, [r3, r2]
	cmp r2, #0
	beq _02095C84
	mov r5, #1
	ldrsb r5, [r4, r5]
	mov r3, #0
	ldrsb r3, [r4, r3]
	add r2, r5, r2
	lsl r2, r2, #0x18
	asr r2, r2, #0x18
	bpl _02095C5A
	mov r0, #3
	b _02095C76
_02095C5A:
	mov r5, ip
	cmp r2, r5
	blt _02095C64
	mov r0, #4
	b _02095C76
_02095C64:
	add r5, r2, #0
	mul r5, r1
	add r5, r3, r5
	lsl r5, r5, #0x18
	lsr r6, r5, #0x18
	ldrb r5, [r7, #2]
	cmp r6, r5
	blo _02095C76
	mov r0, #4
_02095C76:
	cmp r0, #0
	bne _02095C86
	add r0, r2, #0
	mul r0, r1
	strb r2, [r4, #1]
	add r0, r3, r0
	strb r0, [r4, #2]
_02095C84:
	mov r0, #0
_02095C86:
	pop {r4, r5, r6, r7}
	bx lr
	nop
_02095C8C: .word SDK_OVERLAY_OVY_1_ID
	thumb_func_end sub_02095BF0

	thumb_func_start sub_02095C90
sub_02095C90: ; 0x02095C90
	push {r4, r5}
	ldrb r5, [r0, #1]
	mov r3, #0
	cmp r5, #0
	ble _02095CB2
	ldr r4, [r0, #8]
_02095C9C:
	ldr r2, [r4]
	ldrb r2, [r2, #3]
	cmp r1, r2
	bne _02095CAA
	strb r3, [r0]
	pop {r4, r5}
	bx lr
_02095CAA:
	add r3, r3, #1
	add r4, #0xc
	cmp r3, r5
	blt _02095C9C
_02095CB2:
	pop {r4, r5}
	bx lr
	.balign 4, 0
	thumb_func_end sub_02095C90

	thumb_func_start sub_02095CB8
sub_02095CB8: ; 0x02095CB8
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	add r7, r2, #0
	bl sub_02095C90
	ldrb r1, [r4]
	mov r0, #0xc
	ldr r5, [r4, #8]
	add r6, r1, #0
	mul r6, r0
	ldr r2, [r4, #0xc]
	add r0, r4, #0
	lsl r1, r1, #2
	add r4, r5, r6
	add r1, r2, r1
	ldr r2, [r5, r6]
	ldr r4, [r4, #8]
	add r3, r7, #0
	blx r4
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02095CB8

	thumb_func_start sub_02095CE0
sub_02095CE0: ; 0x02095CE0
	push {r4, r5, r6, lr}
	add r5, r1, #0
	mov r1, #0x10
	add r6, r0, #0
	bl AllocFromHeap
	add r4, r0, #0
	add r2, r4, #0
	mov r1, #0x10
	mov r0, #0
_02095CF4:
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _02095CF4
	mov r0, #6
	strb r0, [r4, #1]
	ldrb r1, [r4, #1]
	add r0, r6, #0
	lsl r1, r1, #2
	bl AllocFromHeap
	str r0, [r4, #0xc]
	ldrb r2, [r4, #1]
	mov r1, #0
	lsl r2, r2, #2
	bl memset
	str r5, [r4, #4]
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02095CE0

	thumb_func_start sub_02095D1C
sub_02095D1C: ; 0x02095D1C
	mov r2, #0
	strb r2, [r0]
	ldr r2, _02095D28 ; =_02108434
	str r2, [r0, #8]
	strb r1, [r0, #2]
	bx lr
	.balign 4, 0
_02095D28: .word _02108434
	thumb_func_end sub_02095D1C

	thumb_func_start sub_02095D2C
sub_02095D2C: ; 0x02095D2C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	bl FreeToHeap
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02095D2C

	thumb_func_start sub_02095D40
sub_02095D40: ; 0x02095D40
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r2, #0
	bl sub_02095C90
	ldrb r0, [r5]
	ldr r2, [r5, #0xc]
	lsl r1, r0, #2
	add r4, r2, r1
	mov r1, #0xc
	ldr r2, [r5, #8]
	mul r1, r0
	ldr r5, [r2, r1]
	ldrb r0, [r5, #2]
	cmp r6, r0
	blo _02095D64
	bl GF_AssertFail
_02095D64:
	strb r6, [r4, #2]
	ldrb r1, [r4, #2]
	ldrb r0, [r5, #2]
	cmp r1, r0
	blo _02095D72
	mov r0, #0
	strb r0, [r4, #2]
_02095D72:
	ldrb r0, [r4, #2]
	ldrb r1, [r5]
	bl _s32_div_f
	strb r1, [r4]
	ldrb r0, [r4, #2]
	ldrb r1, [r5]
	bl _s32_div_f
	strb r0, [r4, #1]
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02095D40

	thumb_func_start sub_02095D88
sub_02095D88: ; 0x02095D88
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r4, r0, #0
	str r2, [sp, #8]
	ldrb r7, [r4]
	ldr r2, [r4, #0xc]
	mov ip, r1
	lsl r1, r7, #2
	add r5, r2, r1
	mov r1, #0xc
	add r3, r7, #0
	mul r3, r1
	ldr r2, [r4, #8]
	ldrb r1, [r5, #2]
	add r6, r2, r3
	str r1, [sp, #4]
	ldr r1, [sp, #8]
	str r1, [sp]
	ldr r2, [r2, r3]
	ldr r6, [r6, #4]
	add r1, r5, #0
	mov r3, ip
	blx r6
	ldrb r0, [r4]
	cmp r7, r0
	beq _02095DC2
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_02095DC2:
	ldrb r1, [r5, #2]
	ldr r0, [sp, #4]
	cmp r0, r1
	beq _02095DD0
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_02095DD0:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02095D88

	thumb_func_start sub_02095DD8
sub_02095DD8: ; 0x02095DD8
	ldrb r1, [r0]
	ldr r2, [r0, #8]
	mov r0, #0xc
	mul r0, r1
	ldr r0, [r2, r0]
	ldrb r0, [r0, #3]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02095DD8

	thumb_func_start sub_02095DE8
sub_02095DE8: ; 0x02095DE8
	ldr r1, [r0, #0xc]
	ldrb r0, [r0]
	lsl r0, r0, #2
	add r0, r1, r0
	ldrb r0, [r0, #2]
	bx lr
	thumb_func_end sub_02095DE8

	thumb_func_start sub_02095DF4
sub_02095DF4: ; 0x02095DF4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #0xb
	mov r1, #0x20
	add r6, r2, #0
	add r7, r3, #0
	bl AllocFromHeapAtEnd
	add r2, r0, #0
	mov r0, #0
	str r0, [r2]
	str r4, [r2, #8]
	strh r6, [r2, #0xe]
	ldr r0, [sp, #0x18]
	strh r7, [r2, #0xc]
	str r0, [r2, #0x10]
	ldr r0, [sp, #0x1c]
	ldr r1, _02095E2C ; =sub_02095E30
	str r0, [r2, #0x14]
	ldr r0, [sp, #0x20]
	str r0, [r2, #0x18]
	ldr r0, [sp, #0x24]
	str r0, [r2, #0x1c]
	ldr r0, [r5, #0x10]
	bl QueueTask
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02095E2C: .word sub_02095E30
	thumb_func_end sub_02095DF4

	thumb_func_start sub_02095E30
sub_02095E30: ; 0x02095E30
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl TaskManager_GetSys
	add r5, r0, #0
	add r0, r4, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #3
	bhi _02095EF4
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02095E54: ; jump table
	.short _02095E5C - _02095E54 - 2 ; case 0
	.short _02095E9E - _02095E54 - 2 ; case 1
	.short _02095EB4 - _02095E54 - 2 ; case 2
	.short _02095EC4 - _02095E54 - 2 ; case 3
_02095E5C:
	mov r0, #0xb
	mov r1, #0x10
	bl AllocFromHeapAtEnd
	str r0, [r4, #4]
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _02095E70
	mov r1, #1
	b _02095E72
_02095E70:
	mov r1, #0
_02095E72:
	ldr r0, [r4, #4]
	str r1, [r0, #4]
	add r0, r5, #0
	bl ScriptEnvironment_GetSav2Ptr
	ldr r1, [r4, #4]
	str r0, [r1]
	ldrh r1, [r4, #0xc]
	ldr r0, [r4, #4]
	strb r1, [r0, #0xc]
	ldrh r1, [r4, #0xe]
	ldr r0, [r4, #4]
	strb r1, [r0, #0xf]
	ldr r1, [r4, #4]
	add r0, r5, #0
	bl Fsys_LaunchPokeathlonCourseApplication
	bl sub_0203E30C
	mov r0, #1
	str r0, [r4]
	b _02095EF4
_02095E9E:
	add r0, r5, #0
	bl FieldSys_ApplicationIsRunning
	cmp r0, #0
	bne _02095EF4
	mov r0, #2
	str r0, [r4]
	add r0, r5, #0
	bl sub_020505C0
	b _02095EF4
_02095EB4:
	add r0, r5, #0
	bl sub_020505C8
	cmp r0, #0
	beq _02095EF4
	mov r0, #3
	str r0, [r4]
	b _02095EF4
_02095EC4:
	ldr r0, [r4, #4]
	ldrb r1, [r0, #0xe]
	ldr r0, [r4, #0x10]
	strh r1, [r0]
	ldr r0, [r4, #4]
	ldrh r1, [r0, #0xa]
	ldr r0, [r4, #0x14]
	strh r1, [r0]
	ldr r0, [r4, #4]
	ldrh r1, [r0, #8]
	ldr r0, [r4, #0x18]
	strh r1, [r0]
	ldr r0, [r4, #4]
	ldrb r1, [r0, #0xd]
	ldr r0, [r4, #0x1c]
	strh r1, [r0]
	ldr r0, [r4, #4]
	bl FreeToHeap
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #1
	pop {r3, r4, r5, pc}
_02095EF4:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02095E30

	thumb_func_start AllocAndReadPhoneBook
AllocAndReadPhoneBook: ; 0x02095EF8
	push {r4, r5, r6, lr}
	sub sp, #0x48
	add r5, r0, #0
	add r0, sp, #0
	bl FS_InitFile
	ldr r1, _02095F64 ; =_021105C8
	add r0, sp, #0
	bl FS_OpenFile
	cmp r0, #0
	bne _02095F1A
	bl GF_AssertFail
	add sp, #0x48
	mov r0, #0
	pop {r4, r5, r6, pc}
_02095F1A:
	ldr r1, [sp, #0x28]
	ldr r0, [sp, #0x24]
	sub r6, r1, r0
	add r0, r5, #0
	add r1, r6, #0
	bl AllocFromHeap
	add r4, r0, #0
	mov r1, #0
	add r2, r6, #0
	bl MI_CpuFill8
	add r0, sp, #0
	add r1, r4, #0
	mov r2, #4
	bl FS_ReadFile
	ldr r2, [r4]
	mov r1, #0x14
	add r0, r5, #0
	mul r1, r2
	bl AllocFromHeap
	str r0, [r4, #4]
	ldr r3, [r4]
	mov r2, #0x14
	ldr r1, [r4, #4]
	add r0, sp, #0
	mul r2, r3
	bl FS_ReadFile
	add r0, sp, #0
	bl FS_CloseFile
	add r0, r4, #0
	add sp, #0x48
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02095F64: .word _021105C8
	thumb_func_end AllocAndReadPhoneBook

	thumb_func_start FreePhoneBook
FreePhoneBook: ; 0x02095F68
	push {r4, lr}
	add r4, r0, #0
	ldr r3, [r4]
	mov r2, #0x14
	ldr r0, [r4, #4]
	mov r1, #0
	mul r2, r3
	bl MI_CpuFill8
	ldr r0, [r4, #4]
	bl FreeToHeap
	add r0, r4, #0
	mov r1, #0
	mov r2, #8
	bl MI_CpuFill8
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end FreePhoneBook

	thumb_func_start LoadPhoneBookEntryI
LoadPhoneBookEntryI: ; 0x02095F94
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, r2, #0
	add r4, r1, #0
	bl AllocAndReadPhoneBook
	add r6, r0, #0
	ldr r3, [r6]
	mov r1, #0
	cmp r3, #0
	ble _02095FD4
	ldr r7, [r6, #4]
	add r2, r7, #0
_02095FAE:
	ldrh r0, [r2, #4]
	cmp r5, r0
	bne _02095FCC
	add r0, r1, #0
	mov r2, #0x14
	mul r0, r2
	add r0, r7, r0
	add r1, r4, #0
	bl MI_CpuCopy8
	add r0, r6, #0
	bl FreePhoneBook
	ldrb r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_02095FCC:
	add r1, r1, #1
	add r2, #0x14
	cmp r1, r3
	blt _02095FAE
_02095FD4:
	add r0, r6, #0
	bl FreePhoneBook
	add r0, r4, #0
	mov r1, #0
	mov r2, #0x14
	bl MI_CpuFill8
	mov r0, #0xff
	strb r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end LoadPhoneBookEntryI

	thumb_func_start GetPhoneMessageGmm
GetPhoneMessageGmm: ; 0x02095FEC
	lsl r1, r0, #1
	ldr r0, _02095FF4 ; =sPhoneMessageGmm
	ldrh r0, [r0, r1]
	bx lr
	.balign 4, 0
_02095FF4: .word sPhoneMessageGmm
	thumb_func_end GetPhoneMessageGmm

	thumb_func_start sub_02095FF8
sub_02095FF8: ; 0x02095FF8
	push {r3, lr}
	mov r1, #3
	bl _s32_div_f
	cmp r1, #2
	bne _02096008
	mov r0, #1
	pop {r3, pc}
_02096008:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_02095FF8

	thumb_func_start LaunchStarterChoiceScene
LaunchStarterChoiceScene: ; 0x0209600C
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xb
	mov r1, #8
	bl AllocFromHeapAtEnd
	add r2, r0, #0
	mov r0, #0
	str r0, [r2]
	ldr r0, [r4, #0x10]
	ldr r1, _02096028 ; =CreateStarter
	bl QueueTask
	pop {r4, pc}
	.balign 4, 0
_02096028: .word CreateStarter
	thumb_func_end LaunchStarterChoiceScene

	thumb_func_start CreateStarter
CreateStarter: ; 0x0209602C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	add r4, r0, #0
	bl TaskManager_GetSys
	str r0, [sp, #0x1c]
	add r0, r4, #0
	bl TaskManager_GetEnv
	add r7, r0, #0
	ldr r0, [r7]
	cmp r0, #5
	bhi _02096084
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02096052: ; jump table
	.short _0209605E - _02096052 - 2 ; case 0
	.short _0209607C - _02096052 - 2 ; case 1
	.short _0209612C - _02096052 - 2 ; case 2
	.short _0209613C - _02096052 - 2 ; case 3
	.short _0209618E - _02096052 - 2 ; case 4
	.short _020961B4 - _02096052 - 2 ; case 5
_0209605E:
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl sub_0200FA24
	mov r0, #1
	str r0, [r7]
	b _020961CE
_0209607C:
	bl sub_0200FB5C
	cmp r0, #0
	bne _02096086
_02096084:
	b _020961CE
_02096086:
	ldr r3, _020961D4 ; =_02108514
	add r2, sp, #0x28
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r0, [sp, #0x1c]
	ldr r0, [r0, #0x20]
	ldr r0, [r0]
	bl MapHeader_GetMapSec
	mov r1, #0xb3
	str r0, [sp, #0x14]
	mov r0, #0xb
	lsl r1, r1, #2
	bl AllocFromHeapAtEnd
	str r0, [r7, #4]
	mov r1, #0
	str r1, [r0]
	ldr r0, [sp, #0x1c]
	ldr r0, [r0, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	ldr r1, [r7, #4]
	mov r5, #0
	str r0, [r1, #4]
	str r5, [sp, #0x18]
	add r6, sp, #0x28
_020960C0:
	ldr r0, [sp, #0x1c]
	ldr r4, [r7, #4]
	ldr r0, [r0, #0xc]
	add r4, #8
	bl Sav2_PlayerData_GetProfileAddr
	str r0, [sp, #0x20]
	add r0, r4, r5
	bl ZeroMonData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	ldr r1, [r6]
	add r0, r4, r5
	mov r2, #5
	mov r3, #0x20
	bl CreateMon
	mov r0, #0xc
	str r0, [sp]
	mov r0, #0xb
	str r0, [sp, #4]
	ldr r1, [sp, #0x20]
	ldr r3, [sp, #0x14]
	add r0, r4, r5
	mov r2, #4
	bl sub_020720FC
	mov r0, #0
	str r0, [sp, #0x24]
	add r0, r4, r5
	mov r1, #6
	add r2, sp, #0x24
	bl SetMonData
	ldr r0, [sp, #0x18]
	add r5, #0xec
	add r0, r0, #1
	add r6, r6, #4
	str r0, [sp, #0x18]
	cmp r0, #3
	blt _020960C0
	ldr r0, [sp, #0x1c]
	ldr r1, [r7, #4]
	bl FieldSys_LaunchChooseStarterApplication
	bl sub_0203E30C
	mov r0, #2
	str r0, [r7]
	b _020961CE
_0209612C:
	ldr r0, [sp, #0x1c]
	bl FieldSys_ApplicationIsRunning
	cmp r0, #0
	bne _020961CE
	mov r0, #3
	str r0, [r7]
	b _020961CE
_0209613C:
	ldr r0, [sp, #0x1c]
	ldr r0, [r0, #0xc]
	bl Sav2_Pokedex_get
	add r6, r0, #0
	ldr r0, [sp, #0x1c]
	ldr r0, [r0, #0xc]
	bl SavArray_PlayerParty_get
	ldr r1, [r7, #4]
	str r0, [sp, #0x10]
	ldr r2, [r1]
	add r4, r1, #0
	mov r1, #0xec
	add r5, r2, #0
	add r4, #8
	mul r5, r1
	add r1, r4, r5
	bl AddMonToParty
	cmp r0, #0
	beq _02096172
	ldr r0, [sp, #0x1c]
	add r1, r4, r5
	ldr r0, [r0, #0xc]
	bl sub_0202ECC0
_02096172:
	ldr r0, [sp, #0x10]
	mov r1, #0
	bl GetPartyMonByIndex
	add r1, r0, #0
	add r0, r6, #0
	bl Pokedex_SetMonCaughtFlag
	mov r0, #4
	str r0, [r7]
	ldr r0, [sp, #0x1c]
	bl sub_020505C0
	b _020961CE
_0209618E:
	ldr r0, [sp, #0x1c]
	bl sub_020505C8
	cmp r0, #0
	beq _020961CE
	mov r0, #6
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0
	add r2, r1, #0
	add r3, r0, #0
	bl sub_0200FA24
	mov r0, #5
	str r0, [r7]
	b _020961CE
_020961B4:
	bl sub_0200FB5C
	cmp r0, #0
	beq _020961CE
	ldr r0, [r7, #4]
	bl FreeToHeap
	add r0, r7, #0
	bl FreeToHeap
	add sp, #0x34
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_020961CE:
	mov r0, #0
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_020961D4: .word _02108514
	thumb_func_end CreateStarter

	thumb_func_start sub_020961D8
sub_020961D8: ; 0x020961D8
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r6, r1, #0
	bl TaskManager_GetSys
	add r5, r0, #0
	mov r0, #0x20
	mov r1, #0x24
	bl AllocFromHeap
	add r4, r0, #0
	str r5, [r4]
	mov r0, #0x20
	bl ScrStrBufs_new
	str r0, [r4, #4]
	mov r3, #0x20
	str r3, [sp]
	ldr r2, [r4]
	add r3, #0xec
	ldr r2, [r2, #0xc]
	mov r0, #2
	mov r1, #0
	add r3, r5, r3
	bl sub_02090C94
	str r0, [r4, #0x10]
	ldr r0, [r5, #0xc]
	bl Sav2_Misc_get
	str r0, [r4, #0x14]
	add r0, r4, #0
	str r6, [r4, #0x20]
	add r0, #8
	mov r1, #4
	bl MailMsg_init_withBank
	add r1, r4, #0
	ldr r0, [r4, #0x14]
	add r1, #8
	bl sub_0202ABD0
	ldr r0, [r4, #0x10]
	bl sub_02090D40
	mov r0, #0
	str r0, [r4, #0x18]
	ldr r1, _02096244 ; =sub_02096260
	add r0, r7, #0
	add r2, r4, #0
	bl QueueTask
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02096244: .word sub_02096260
	thumb_func_end sub_020961D8

	thumb_func_start sub_02096248
sub_02096248: ; 0x02096248
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x10]
	bl sub_02090D0C
	ldr r0, [r4, #4]
	bl ScrStrBufs_delete
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end sub_02096248

	thumb_func_start sub_02096260
sub_02096260: ; 0x02096260
	push {r4, lr}
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldr r1, [r4, #0x18]
	cmp r1, #4
	bhi _02096314
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0209627A: ; jump table
	.short _02096284 - _0209627A - 2 ; case 0
	.short _020962A2 - _0209627A - 2 ; case 1
	.short _020962B8 - _0209627A - 2 ; case 2
	.short _020962CE - _0209627A - 2 ; case 3
	.short _0209630C - _0209627A - 2 ; case 4
_02096284:
	add r1, r4, #0
	ldr r0, [r4, #0x10]
	add r1, #8
	bl sub_02090D20
	ldr r0, [r4, #0x10]
	bl sub_02090D34
	ldr r0, [r4]
	ldr r1, [r4, #0x10]
	bl sub_0203EA24
	mov r0, #1
	str r0, [r4, #0x18]
	b _02096314
_020962A2:
	ldr r0, [r4]
	bl FieldSys_ApplicationIsRunning
	cmp r0, #0
	bne _02096314
	ldr r0, [r4]
	bl sub_020505C0
	mov r0, #2
	str r0, [r4, #0x18]
	b _02096314
_020962B8:
	ldr r0, [r4]
	bl sub_020505C8
	cmp r0, #0
	beq _02096314
	mov r0, #1
	bl ov01_021E636C
	mov r0, #3
	str r0, [r4, #0x18]
	b _02096314
_020962CE:
	bl sub_0200FB5C
	cmp r0, #0
	beq _02096314
	ldr r0, [r4, #0x10]
	bl sub_02090D48
	cmp r0, #0
	beq _020962EC
	ldr r0, [r4, #0x20]
	mov r1, #0
	strh r1, [r0]
	mov r0, #4
	str r0, [r4, #0x18]
	b _02096314
_020962EC:
	ldr r0, [r4, #0x20]
	mov r1, #1
	strh r1, [r0]
	add r1, r4, #0
	ldr r0, [r4, #0x10]
	add r1, #8
	bl sub_02090D60
	add r1, r4, #0
	ldr r0, [r4, #0x14]
	add r1, #8
	bl sub_0202ABEC
	mov r0, #4
	str r0, [r4, #0x18]
	b _02096314
_0209630C:
	bl sub_02096248
	mov r0, #1
	pop {r4, pc}
_02096314:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end sub_02096260

	thumb_func_start sub_02096318
sub_02096318: ; 0x02096318
	ldr r3, _0209632C ; =OS_IRQTable
	ldr r1, _02096330 ; =0x00003FF8
	mov r0, #1
	ldr r2, [r3, r1]
	orr r0, r2
	str r0, [r3, r1]
	ldr r3, _02096334 ; =MI_WaitDma
	mov r0, #3
	bx r3
	nop
_0209632C: .word OS_IRQTable
_02096330: .word 0x00003FF8
_02096334: .word MI_WaitDma
	thumb_func_end sub_02096318

	thumb_func_start PrintErrorMessageAndReset
PrintErrorMessageAndReset: ; 0x02096338
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	ldr r0, _02096548 ; =_021D43B4
	ldr r1, [r0]
	cmp r1, #1
	bne _02096346
	b _02096544
_02096346:
	mov r1, #1
	str r1, [r0]
	mov r0, #0
	bl OS_GetInitArenaHi
	add r1, r0, #0
	mov r0, #0
	bl OS_SetArenaHi
	mov r0, #0
	bl OS_GetInitArenaLo
	add r1, r0, #0
	mov r0, #0
	bl OS_SetArenaLo
	mov r1, #1
	ldr r0, _0209654C ; =_02108528
	add r2, r1, #0
	mov r3, #0
	bl InitHeapSystem
	mov r0, #0
	add r1, r0, #0
	bl sub_0200FBF4
	mov r0, #1
	mov r1, #0
	bl sub_0200FBF4
	mov r0, #1
	bl OS_DisableIrqMask
	ldr r1, _02096550 ; =sub_02096318
	mov r0, #1
	bl OS_SetIrqFunction
	mov r0, #1
	bl OS_EnableIrqMask
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	mov r0, #0
	add r1, r0, #0
	bl sub_0201A120
	bl GX_DisableEngineALayers
	bl GX_DisableEngineBLayers
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _02096554 ; =0xFFFFE0FF
	and r1, r0
	str r1, [r2]
	ldr r2, _02096558 ; =0x04001000
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	mov r0, #4
	mov r1, #8
	bl SetKeyRepeatTimers
	ldr r0, _0209655C ; =gMain + 0x60
	mov r1, #0
	strb r1, [r0, #9]
	bl GX_SwapDisplay
	ldr r3, _02096560 ; =0x04000050
	mov r0, #0
	strh r0, [r3]
	ldr r2, _02096564 ; =0x04001050
	sub r3, #0x50
	strh r0, [r2]
	ldr r1, [r3]
	ldr r0, _02096568 ; =0xFFFF1FFF
	sub r2, #0x50
	and r1, r0
	str r1, [r3]
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	ldr r0, _0209656C ; =_0210855C
	bl GX_SetBanks
	mov r0, #0
	bl BgConfig_Alloc
	str r0, [sp, #0x10]
	ldr r0, _02096570 ; =_02108530
	bl SetBothScreensModesAndDisable
	mov r1, #0
	ldr r0, [sp, #0x10]
	ldr r2, _02096574 ; =_02108540
	add r3, r1, #0
	bl InitBgFromTemplate
	ldr r0, [sp, #0x10]
	mov r1, #0
	bl BgClearTilemapBufferAndCommit
	mov r1, #0
	str r1, [sp]
	ldr r0, [sp, #0x10]
	ldr r2, _02096578 ; =0x000001F7
	mov r3, #2
	str r1, [sp, #4]
	bl sub_0200E3DC
	mov r0, #0
	mov r1, #0x20
	add r2, r0, #0
	bl sub_02003030
	mov r0, #0
	mov r1, #0x20
	add r2, r0, #0
	add r3, r0, #0
	bl BG_ClearCharDataRange
	ldr r1, _0209657C ; =0x00006C21
	mov r0, #0
	bl BG_SetMaskColor
	ldr r1, _0209657C ; =0x00006C21
	mov r0, #4
	bl BG_SetMaskColor
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0x29
	mov r3, #0
	bl NewMsgDataFromNarc
	str r0, [sp, #0xc]
	mov r0, #6
	lsl r0, r0, #6
	mov r1, #0
	bl String_ctor
	add r4, r0, #0
	bl sub_02020080
	ldr r0, [sp, #0x10]
	ldr r2, _02096580 ; =_02108520
	add r1, sp, #0x14
	bl AddWindow
	mov r0, #0xd0
	str r0, [sp]
	mov r0, #0x90
	mov r2, #0
	str r0, [sp, #4]
	add r0, sp, #0x14
	mov r1, #0xf
	add r3, r2, #0
	bl FillWindowPixelRect
	ldr r2, _02096578 ; =0x000001F7
	add r0, sp, #0x14
	mov r1, #0
	mov r3, #2
	bl DrawFrameAndWindow1
	ldr r0, [sp, #0xc]
	mov r1, #3
	add r2, r4, #0
	bl ReadMsgDataIntoString
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	add r0, sp, #0x14
	add r2, r4, #0
	add r3, r1, #0
	str r1, [sp, #8]
	bl AddTextPrinterParameterized
	add r0, r4, #0
	bl String_dtor
	bl GX_BothDispOn
	mov r0, #0
	bl SetMasterBrightnessNeutral
	mov r0, #1
	bl SetMasterBrightnessNeutral
	mov r0, #0
	mov r1, #0x3f
	mov r2, #3
	bl SetBlendBrightness
	bl sub_02038D90
	mov r4, #1
_020964D8:
	bl HandleDSLidAction
	bl sub_02036144
	bl sub_02039AA4
	cmp r0, #0
	bne _020964F2
	add r0, r4, #0
	add r1, r4, #0
	bl OS_WaitIrq
	b _020964D8
_020964F2:
	ldr r5, _02096584 ; =0x04000130
	ldr r4, _02096588 ; =0x027FFFA8
	ldr r7, _0209658C ; =0x00002FFF
	mov r6, #1
_020964FA:
	bl HandleDSLidAction
	ldrh r1, [r5]
	ldrh r0, [r4]
	orr r1, r0
	ldr r0, _0209658C ; =0x00002FFF
	eor r0, r1
	and r0, r7
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	tst r0, r6
	bne _0209651C
	mov r0, #1
	add r1, r0, #0
	bl OS_WaitIrq
	b _020964FA
_0209651C:
	ldr r1, _02096590 ; =0x00007FFF
	mov r0, #0
	bl sub_0200FBF4
	ldr r1, _02096590 ; =0x00007FFF
	mov r0, #1
	bl sub_0200FBF4
	add r0, sp, #0x14
	bl RemoveWindow
	ldr r0, [sp, #0xc]
	bl DestroyMsgData
	ldr r0, [sp, #0x10]
	bl FreeToHeap
	mov r0, #0
	bl OS_ResetSystem
_02096544:
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02096548: .word _021D43B4
_0209654C: .word _02108528
_02096550: .word sub_02096318
_02096554: .word 0xFFFFE0FF
_02096558: .word 0x04001000
_0209655C: .word gMain + 0x60
_02096560: .word 0x04000050
_02096564: .word 0x04001050
_02096568: .word 0xFFFF1FFF
_0209656C: .word _0210855C
_02096570: .word _02108530
_02096574: .word _02108540
_02096578: .word 0x000001F7
_0209657C: .word 0x00006C21
_02096580: .word _02108520
_02096584: .word 0x04000130
_02096588: .word 0x027FFFA8
_0209658C: .word 0x00002FFF
_02096590: .word 0x00007FFF
	thumb_func_end PrintErrorMessageAndReset

	thumb_func_start sub_02096594
sub_02096594: ; 0x02096594
	ldr r0, _0209659C ; =0x04000006
	ldr r3, _020965A0 ; =GF_SinDegNoWrap
	ldrh r0, [r0]
	bx r3
	.balign 4, 0
_0209659C: .word 0x04000006
_020965A0: .word GF_SinDegNoWrap
	thumb_func_end sub_02096594

	thumb_func_start sub_020965A4
sub_020965A4: ; 0x020965A4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_020967BC
	ldr r1, _02096604 ; =0x00000A54
	add r0, r5, #0
	mov r2, #0xb
	bl OverlayManager_CreateAndGetData
	ldr r2, _02096604 ; =0x00000A54
	add r4, r0, #0
	mov r1, #0
	bl MI_CpuFill8
	add r0, r4, #0
	bl sub_02096780
	add r0, r4, #0
	bl sub_02096884
	add r0, r5, #0
	bl OverlayManager_GetField18
	str r0, [r4]
	cmp r0, #0
	bne _020965DC
	bl GF_AssertFail
_020965DC:
	ldr r2, [r4]
	add r0, r4, #0
	add r2, #0x20
	ldrb r2, [r2]
	mov r1, #0xb
	bl ov80_0222A84C
	str r0, [r4, #0x14]
	ldr r1, [r4]
	mov r2, #0
	add r1, #0x20
	ldrb r1, [r1]
	bl ov80_0222A958
	add r0, r4, #0
	bl sub_02096760
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_02096604: .word 0x00000A54
	thumb_func_end sub_020965A4

	thumb_func_start sub_02096608
sub_02096608: ; 0x02096608
	push {r4, r5, r6, lr}
	add r5, r1, #0
	bl OverlayManager_GetData
	ldr r1, [r5]
	add r4, r0, #0
	cmp r1, #6
	bls _0209661A
	b _02096734
_0209661A:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02096626: ; jump table
	.short _02096634 - _02096626 - 2 ; case 0
	.short _0209663A - _02096626 - 2 ; case 1
	.short _0209666C - _02096626 - 2 ; case 2
	.short _02096670 - _02096626 - 2 ; case 3
	.short _02096686 - _02096626 - 2 ; case 4
	.short _020966CE - _02096626 - 2 ; case 5
	.short _020966DE - _02096626 - 2 ; case 6
_02096634:
	mov r0, #1
	str r0, [r5]
	b _02096734
_0209663A:
	add r0, #0x22
	ldrb r0, [r0]
	cmp r0, #1
	bne _02096648
	mov r0, #2
	str r0, [r5]
	b _02096734
_02096648:
	ldrb r0, [r4, #0x1d]
	cmp r0, #0
	beq _02096734
	ldrb r0, [r4, #0x1e]
	cmp r0, #1
	bne _0209665A
	mov r0, #5
	str r0, [r5]
	b _02096734
_0209665A:
	ldr r0, [r4, #0x14]
	bl ov80_0222A8B8
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _02096734
	mov r0, #3
	str r0, [r5]
	b _02096734
_0209666C:
	mov r0, #1
	pop {r4, r5, r6, pc}
_02096670:
	ldr r0, [r4, #0x18]
	bl ov80_022389C4
	add r0, r4, #0
	bl sub_02096770
	bl sub_020967E4
	mov r0, #4
	str r0, [r5]
	b _02096734
_02096686:
	ldr r0, [r4, #4]
	bl OverlayManager_run
	cmp r0, #1
	bne _02096734
	ldr r0, [r4, #4]
	bl OverlayManager_delete
	bl sub_020967BC
	ldr r1, [r4, #0xc]
	cmp r1, #0
	beq _020966A4
	ldr r0, [r4, #8]
	blx r1
_020966A4:
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _020966B4
	ldrb r1, [r4, #0x10]
	cmp r1, #1
	bne _020966B4
	bl FreeToHeap
_020966B4:
	mov r0, #0
	str r0, [r4, #4]
	str r0, [r4, #0xc]
	str r0, [r4, #8]
	add r0, r4, #0
	bl sub_02096760
	ldr r0, [r4, #0x18]
	bl ov80_02238A18
	mov r0, #1
	str r0, [r5]
	b _02096734
_020966CE:
	bl sub_02096770
	add r0, r4, #0
	bl sub_02096780
	mov r0, #6
	str r0, [r5]
	b _02096734
_020966DE:
	bl sub_02096760
	ldrh r1, [r4, #0x20]
	ldr r0, _02096738 ; =0x0000FFFF
	cmp r1, r0
	ldr r0, [r4, #0x14]
	bne _020966FA
	ldr r1, [r4]
	mov r2, #0xb
	add r1, #0x20
	ldrb r1, [r1]
	bl ov80_0222AA7C
	b _0209672C
_020966FA:
	mov r1, #0xb
	bl ov80_0222AAD8
	add r6, r0, #0
	ldr r0, [r4, #0x14]
	bl ov80_0222A920
	ldr r2, [r4]
	add r0, r4, #0
	add r2, #0x20
	ldrb r2, [r2]
	mov r1, #0xb
	bl ov80_0222A84C
	str r0, [r4, #0x14]
	ldr r1, [r4]
	ldrh r2, [r4, #0x20]
	add r1, #0x20
	ldrb r1, [r1]
	bl ov80_0222A958
	ldr r0, [r4, #0x14]
	add r1, r6, #0
	bl ov80_0222AAF8
_0209672C:
	mov r0, #0
	strb r0, [r4, #0x1e]
	mov r0, #1
	str r0, [r5]
_02096734:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02096738: .word 0x0000FFFF
	thumb_func_end sub_02096608

	thumb_func_start sub_0209673C
sub_0209673C: ; 0x0209673C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	ldr r0, [r4, #0x14]
	bl ov80_0222A920
	add r0, r4, #0
	bl sub_02096770
	add r0, r5, #0
	bl OverlayManager_FreeData
	bl sub_020967E4
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0209673C

	thumb_func_start sub_02096760
sub_02096760: ; 0x02096760
	push {r4, lr}
	add r4, r0, #0
	bl ov80_02238648
	str r0, [r4, #0x18]
	mov r0, #1
	strb r0, [r4, #0x1d]
	pop {r4, pc}
	thumb_func_end sub_02096760

	thumb_func_start sub_02096770
sub_02096770: ; 0x02096770
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x18]
	bl ov80_0223885C
	mov r0, #0
	strb r0, [r4, #0x1d]
	pop {r4, pc}
	thumb_func_end sub_02096770

	thumb_func_start sub_02096780
sub_02096780: ; 0x02096780
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _020967B8 ; =0x0000FFFF
	mov r1, #0
	add r2, r4, #0
_0209678A:
	add r1, r1, #1
	strh r0, [r2, #0x24]
	add r2, r2, #4
	cmp r1, #0x18
	blt _0209678A
	add r0, r4, #0
	mov r2, #0x1e
	add r0, #0x84
	mov r1, #0
	lsl r2, r2, #6
	bl MI_CpuFill8
	ldr r1, _020967B8 ; =0x0000FFFF
	mov r2, #0
_020967A6:
	add r0, r4, #0
	add r0, #0x90
	add r2, r2, #1
	add r4, #0x3c
	strh r1, [r0]
	cmp r2, #0x20
	blt _020967A6
	pop {r4, pc}
	nop
_020967B8: .word 0x0000FFFF
	thumb_func_end sub_02096780

	thumb_func_start sub_020967BC
sub_020967BC: ; 0x020967BC
	push {r3, lr}
	ldr r0, _020967D8 ; =SDK_OVERLAY_OVY_80_ID
	mov r1, #2
	bl HandleLoadOverlay
	ldr r0, _020967DC ; =SDK_OVERLAY_OVY_81_ID
	mov r1, #2
	bl HandleLoadOverlay
	ldr r0, _020967E0 ; =SDK_OVERLAY_OVY_42_ID
	mov r1, #2
	bl HandleLoadOverlay
	pop {r3, pc}
	.balign 4, 0
_020967D8: .word SDK_OVERLAY_OVY_80_ID
_020967DC: .word SDK_OVERLAY_OVY_81_ID
_020967E0: .word SDK_OVERLAY_OVY_42_ID
	thumb_func_end sub_020967BC

	thumb_func_start sub_020967E4
sub_020967E4: ; 0x020967E4
	push {r3, lr}
	ldr r0, _020967FC ; =SDK_OVERLAY_OVY_80_ID
	bl UnloadOverlayByID
	ldr r0, _02096800 ; =SDK_OVERLAY_OVY_81_ID
	bl UnloadOverlayByID
	ldr r0, _02096804 ; =SDK_OVERLAY_OVY_42_ID
	bl UnloadOverlayByID
	pop {r3, pc}
	nop
_020967FC: .word SDK_OVERLAY_OVY_80_ID
_02096800: .word SDK_OVERLAY_OVY_81_ID
_02096804: .word SDK_OVERLAY_OVY_42_ID
	thumb_func_end sub_020967E4

	thumb_func_start sub_02096808
sub_02096808: ; 0x02096808
	ldr r0, [r0]
	bx lr
	thumb_func_end sub_02096808

	thumb_func_start sub_0209680C
sub_0209680C: ; 0x0209680C
	ldr r0, [r0, #0x18]
	bx lr
	thumb_func_end sub_0209680C

	thumb_func_start sub_02096810
sub_02096810: ; 0x02096810
	ldr r0, [r0]
	ldr r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02096810

	thumb_func_start sub_02096818
sub_02096818: ; 0x02096818
	ldr r0, [r0]
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02096818

	thumb_func_start sub_02096820
sub_02096820: ; 0x02096820
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5, #4]
	add r7, r1, #0
	add r4, r2, #0
	add r6, r3, #0
	cmp r0, #0
	beq _02096834
	bl GF_AssertFail
_02096834:
	add r0, r7, #0
	add r1, r4, #0
	mov r2, #0xb
	bl OverlayManager_new
	str r0, [r5, #4]
	str r4, [r5, #8]
	ldr r0, [sp, #0x18]
	strb r6, [r5, #0x10]
	str r0, [r5, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02096820

	thumb_func_start sub_0209684C
sub_0209684C: ; 0x0209684C
	mov r1, #1
	add r0, #0x22
	strb r1, [r0]
	bx lr
	thumb_func_end sub_0209684C

	thumb_func_start sub_02096854
sub_02096854: ; 0x02096854
	ldr r3, [r0]
	add r3, #0x20
	strb r1, [r3]
	mov r1, #1
	strb r1, [r0, #0x1e]
	strh r2, [r0, #0x20]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02096854

	thumb_func_start sub_02096864
sub_02096864: ; 0x02096864
	add r0, #0x24
	bx lr
	thumb_func_end sub_02096864

	thumb_func_start sub_02096868
sub_02096868: ; 0x02096868
	add r0, #0x84
	bx lr
	thumb_func_end sub_02096868

	thumb_func_start sub_0209686C
sub_0209686C: ; 0x0209686C
	mov r2, #0x3c
	add r0, #0x84
	mul r2, r1
	add r0, r0, r2
	bx lr
	.balign 4, 0
	thumb_func_end sub_0209686C

	thumb_func_start sub_02096878
sub_02096878: ; 0x02096878
	ldr r1, _02096880 ; =0x00000A04
	add r0, r0, r1
	bx lr
	nop
_02096880: .word 0x00000A04
	thumb_func_end sub_02096878

	thumb_func_start sub_02096884
sub_02096884: ; 0x02096884
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _020968A8 ; =0x00000A04
	mov r1, #0
	add r0, r4, r0
	mov r2, #8
	bl MI_CpuFill8
	ldr r1, _020968AC ; =0x0000FFFF
	ldr r0, _020968A8 ; =0x00000A04
	mov r2, #0
_0209689A:
	add r2, r2, #1
	strh r1, [r4, r0]
	add r4, r4, #2
	cmp r2, #8
	blt _0209689A
	pop {r4, pc}
	nop
_020968A8: .word 0x00000A04
_020968AC: .word 0x0000FFFF
	thumb_func_end sub_02096884

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
	bl Sav2_PlayerData_GetOptionsAddr
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
	bl ScrUnk80_AddOvyMan
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	nop
_0209690C: .word _02108584
	thumb_func_end sub_020968B0

	thumb_func_start sub_02096910
sub_02096910: ; 0x02096910
	ldr r3, _0209691C ; =sub_0203410C
	add r2, r0, #0
	ldr r0, _02096920 ; =_02108594
	mov r1, #0x34
	bx r3
	nop
_0209691C: .word sub_0203410C
_02096920: .word _02108594
	thumb_func_end sub_02096910

	thumb_func_start sub_02096924
sub_02096924: ; 0x02096924
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	ldr r0, _02096990 ; =0x000008D4
	add r5, r3, #0
	ldrb r1, [r5, r0]
	add r6, r2, #0
	mov r4, #0
	add r1, r1, #1
	strb r1, [r5, r0]
	bl sub_0203769C
	cmp r7, r0
	beq _0209698E
	ldrh r0, [r6]
	mov r1, #0xe0
	strb r0, [r5, #0x12]
	ldrh r0, [r6, #2]
	strh r0, [r5, #0x16]
	ldrh r0, [r6, #4]
	strh r0, [r5, #0x18]
	ldrh r0, [r6, #6]
	strh r0, [r5, #0x14]
	ldrb r0, [r5, #0x10]
	bic r0, r1
	ldrb r1, [r5, #0x12]
	add r1, r1, #5
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	lsl r1, r1, #0x1d
	lsr r1, r1, #0x18
	orr r0, r1
	strb r0, [r5, #0x10]
	ldrh r2, [r5, #0x16]
	ldrh r1, [r5, #0x2e]
	cmp r1, r2
	beq _02096972
	ldrh r0, [r5, #0x18]
	cmp r1, r0
	bne _02096978
_02096972:
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
_02096978:
	ldrh r1, [r5, #0x30]
	cmp r1, r2
	beq _02096984
	ldrh r0, [r5, #0x18]
	cmp r1, r0
	bne _0209698A
_02096984:
	add r0, r4, #2
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
_0209698A:
	ldr r0, _02096994 ; =0x000008D8
	strh r4, [r5, r0]
_0209698E:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02096990: .word 0x000008D4
_02096994: .word 0x000008D8
	thumb_func_end sub_02096924

	thumb_func_start sub_02096998
sub_02096998: ; 0x02096998
	push {r4, lr}
	ldr r1, _020969C0 ; =0x0000083E
	add r4, r0, #0
	add r1, r4, r1
	add r0, #0x3e
	mov r2, #0x1c
	bl MI_CpuCopy8
	ldr r1, _020969C0 ; =0x0000083E
	mov r0, #0x3f
	add r1, r4, r1
	mov r2, #0x1c
	bl sub_02037030
	cmp r0, #1
	bne _020969BC
	mov r0, #1
	pop {r4, pc}
_020969BC:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_020969C0: .word 0x0000083E
	thumb_func_end sub_02096998

	thumb_func_start sub_020969C4
sub_020969C4: ; 0x020969C4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _020969F4 ; =0x000008D4
	add r4, r3, #0
	ldrb r1, [r4, r0]
	add r6, r2, #0
	add r1, r1, #1
	strb r1, [r4, r0]
	bl sub_0203769C
	cmp r5, r0
	beq _020969F0
	bl sub_0203769C
	cmp r0, #0
	beq _020969F0
	add r4, #0x3e
	add r0, r6, #0
	add r1, r4, #0
	mov r2, #0x1c
	bl MI_CpuCopy8
_020969F0:
	pop {r4, r5, r6, pc}
	nop
_020969F4: .word 0x000008D4
	thumb_func_end sub_020969C4

	thumb_func_start sub_020969F8
sub_020969F8: ; 0x020969F8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _02096A30 ; =0x000008D8
	add r4, r3, #0
	mov r1, #0
	strh r1, [r4, r0]
	sub r1, r0, #4
	ldrb r1, [r4, r1]
	sub r0, r0, #4
	add r6, r2, #0
	add r1, r1, #1
	strb r1, [r4, r0]
	bl sub_0203769C
	cmp r5, r0
	beq _02096A2C
	ldrb r0, [r4, #0x10]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1f
	bne _02096A26
	ldrh r0, [r6]
	cmp r0, #0
	beq _02096A2C
_02096A26:
	ldr r0, _02096A30 ; =0x000008D8
	mov r1, #1
	strh r1, [r4, r0]
_02096A2C:
	pop {r4, r5, r6, pc}
	nop
_02096A30: .word 0x000008D8
	thumb_func_end sub_020969F8

	thumb_func_start sub_02096A34
sub_02096A34: ; 0x02096A34
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, #0xa0
	ldrb r0, [r0]
	strh r0, [r5, #8]
	add r0, r5, #0
	add r0, #0xa0
	ldrb r0, [r0]
	bl ov80_022385D8
	add r4, r0, #0
	ldr r0, [r5]
	bl sub_0203107C
	add r6, r0, #0
	add r0, r4, #0
	bl sub_0205C268
	add r2, r0, #0
	add r0, r6, #0
	add r1, r4, #0
	bl sub_020310BC
	strh r0, [r5, #0xa]
	add r5, #8
	mov r0, #0x39
	add r1, r5, #0
	mov r2, #0x28
	bl sub_02037030
	cmp r0, #1
	bne _02096A78
	mov r0, #1
	pop {r4, r5, r6, pc}
_02096A78:
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02096A34

	thumb_func_start sub_02096A7C
sub_02096A7C: ; 0x02096A7C
	push {r4, r5, r6, lr}
	add r4, r3, #0
	add r6, r0, #0
	add r0, r4, #0
	add r0, #0x6f
	ldrb r0, [r0]
	add r5, r2, #0
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x6f
	strb r1, [r0]
	bl sub_0203769C
	cmp r6, r0
	beq _02096AA8
	ldrh r1, [r5]
	add r0, r4, #0
	add r0, #0x6e
	strb r1, [r0]
	ldrh r0, [r5, #2]
	add r4, #0x72
	strh r0, [r4]
_02096AA8:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02096A7C

	thumb_func_start sub_02096AAC
sub_02096AAC: ; 0x02096AAC
	push {r3, lr}
	add r2, r0, #0
	strh r1, [r2, #8]
	add r2, #8
	add r1, r2, #0
	mov r0, #0x3a
	mov r2, #0x28
	bl sub_02037030
	cmp r0, #1
	bne _02096AC6
	mov r0, #1
	pop {r3, pc}
_02096AC6:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02096AAC

	thumb_func_start sub_02096ACC
sub_02096ACC: ; 0x02096ACC
	push {r4, r5, r6, lr}
	add r4, r3, #0
	add r5, r0, #0
	add r0, r4, #0
	add r0, #0x6f
	ldrb r0, [r0]
	add r6, r2, #0
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x6f
	strb r1, [r0]
	bl sub_0203769C
	cmp r5, r0
	beq _02096AF0
	ldrh r0, [r6]
	add r4, #0x59
	strb r0, [r4]
_02096AF0:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02096ACC

	thumb_func_start sub_02096AF4
sub_02096AF4: ; 0x02096AF4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r1, #0
	add r6, r2, #0
	bl SavArray_PlayerParty_get
	add r1, r5, #0
	add r1, #0x6a
	strb r4, [r1]
	add r1, r5, #0
	add r1, #0x6b
	add r7, r0, #0
	strb r6, [r1]
	cmp r4, #0xff
	bne _02096B30
	add r0, r5, #0
	mov r1, #0
	add r0, #0x76
	strh r1, [r0]
	add r0, r5, #0
	add r0, #0x7e
	strh r1, [r0]
	add r0, r5, #0
	add r0, #0x78
	strh r1, [r0]
	add r0, r5, #0
	add r0, #0x80
	strh r1, [r0]
	b _02096B7E
_02096B30:
	add r1, r4, #0
	bl GetPartyMonByIndex
	mov r1, #5
	mov r2, #0
	add r4, r0, #0
	bl GetMonData
	add r1, r5, #0
	add r1, #0x76
	strh r0, [r1]
	add r0, r4, #0
	mov r1, #6
	mov r2, #0
	bl GetMonData
	add r1, r5, #0
	add r1, #0x7e
	strh r0, [r1]
	add r0, r7, #0
	add r1, r6, #0
	bl GetPartyMonByIndex
	mov r1, #5
	mov r2, #0
	add r4, r0, #0
	bl GetMonData
	add r1, r5, #0
	add r1, #0x78
	strh r0, [r1]
	add r0, r4, #0
	mov r1, #6
	mov r2, #0
	bl GetMonData
	add r1, r5, #0
	add r1, #0x80
	strh r0, [r1]
_02096B7E:
	add r0, r5, #0
	add r0, #0x76
	ldrh r0, [r0]
	mov r2, #0x28
	strh r0, [r5, #8]
	add r0, r5, #0
	add r0, #0x7e
	ldrh r0, [r0]
	strh r0, [r5, #0xa]
	add r0, r5, #0
	add r0, #0x78
	ldrh r0, [r0]
	strh r0, [r5, #0xc]
	add r0, r5, #0
	add r0, #0x80
	ldrh r0, [r0]
	strh r0, [r5, #0xe]
	add r5, #8
	mov r0, #0x3b
	add r1, r5, #0
	bl sub_02037030
	cmp r0, #1
	bne _02096BB2
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02096BB2:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02096AF4

	thumb_func_start sub_02096BB8
sub_02096BB8: ; 0x02096BB8
	push {r4, r5, r6, lr}
	add r4, r3, #0
	add r6, r0, #0
	add r0, r4, #0
	add r0, #0x6f
	ldrb r0, [r0]
	add r5, r2, #0
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x6f
	strb r1, [r0]
	bl sub_0203769C
	cmp r6, r0
	beq _02096BF4
	ldrh r1, [r5]
	add r0, r4, #0
	add r0, #0x86
	strh r1, [r0]
	add r0, r4, #0
	ldrh r1, [r5, #2]
	add r0, #0x8e
	strh r1, [r0]
	add r0, r4, #0
	ldrh r1, [r5, #4]
	add r0, #0x88
	add r4, #0x90
	strh r1, [r0]
	ldrh r0, [r5, #6]
	strh r0, [r4]
_02096BF4:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02096BB8

	thumb_func_start sub_02096BF8
sub_02096BF8: ; 0x02096BF8
	push {r3, lr}
	add r2, r0, #0
	strh r1, [r2, #8]
	add r2, #8
	add r1, r2, #0
	mov r0, #0x3c
	mov r2, #0x28
	bl sub_02037030
	cmp r0, #1
	bne _02096C12
	mov r0, #1
	pop {r3, pc}
_02096C12:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02096BF8

	thumb_func_start sub_02096C18
sub_02096C18: ; 0x02096C18
	push {r4, r5, r6, lr}
	add r4, r3, #0
	add r5, r0, #0
	add r0, r4, #0
	add r0, #0x6f
	ldrb r0, [r0]
	add r6, r2, #0
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x6f
	strb r1, [r0]
	bl sub_0203769C
	cmp r5, r0
	beq _02096C3C
	ldrh r0, [r6]
	add r4, #0x74
	strh r0, [r4]
_02096C3C:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02096C18

	thumb_func_start sub_02096C40
sub_02096C40: ; 0x02096C40
	push {r3, lr}
	add r2, r0, #0
	strh r1, [r2, #8]
	add r2, #8
	add r1, r2, #0
	mov r0, #0x3d
	mov r2, #0x28
	bl sub_02037030
	cmp r0, #1
	bne _02096C5A
	mov r0, #1
	pop {r3, pc}
_02096C5A:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02096C40

	thumb_func_start sub_02096C60
sub_02096C60: ; 0x02096C60
	push {r4, r5, r6, lr}
	add r4, r3, #0
	add r5, r0, #0
	add r0, r4, #0
	add r0, #0x6f
	ldrb r0, [r0]
	add r6, r2, #0
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x6f
	strb r1, [r0]
	bl sub_0203769C
	cmp r5, r0
	beq _02096C84
	ldrh r0, [r6]
	add r4, #0x71
	strb r0, [r4]
_02096C84:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02096C60

	thumb_func_start sub_02096C88
sub_02096C88: ; 0x02096C88
	push {r4, r5, r6, lr}
	add r6, r1, #0
	add r5, r0, #0
	add r0, r6, #0
	mov r1, #0x58
	bl AllocFromHeap
	add r4, r0, #0
	bne _02096C9E
	bl GF_AssertFail
_02096C9E:
	add r0, r4, #0
	mov r1, #0
	mov r2, #0x58
	bl memset
	ldr r1, _02096CC4 ; =0x00001BD0
	add r0, r6, #0
	str r5, [r4]
	bl AllocFromHeap
	str r0, [r4, #0x4c]
	ldr r1, _02096CC4 ; =0x00001BD0
	add r0, r6, #0
	bl AllocFromHeap
	str r0, [r4, #0x50]
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	nop
_02096CC4: .word 0x00001BD0
	thumb_func_end sub_02096C88

	thumb_func_start sub_02096CC8
sub_02096CC8: ; 0x02096CC8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x4c]
	bl FreeToHeap
	ldr r0, [r4, #0x50]
	bl FreeToHeap
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end sub_02096CC8

	thumb_func_start sub_02096CE0
sub_02096CE0: ; 0x02096CE0
	ldr r3, _02096CEC ; =sub_0203410C
	add r2, r0, #0
	ldr r0, _02096CF0 ; =_0210884C
	mov r1, #0x87
	bx r3
	nop
_02096CEC: .word sub_0203410C
_02096CF0: .word _0210884C
	thumb_func_end sub_02096CE0

	thumb_func_start sub_02096CF4
sub_02096CF4: ; 0x02096CF4
	push {r4, lr}
	add r4, r0, #0
	mov r0, #2
	bl sub_02038C1C
	bl sub_02037FF0
	ldr r0, [r4]
	ldr r0, [r0, #0x20]
	bl sub_0205AD24
	mov r0, #0
	bl sub_0205A904
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02096CF4

	thumb_func_start sub_02096D14
sub_02096D14: ; 0x02096D14
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r7, r0, #0
	add r6, r3, #0
	str r2, [sp]
	cmp r5, #0x12
	blo _02096D26
	bl GF_AssertFail
_02096D26:
	add r0, r6, #4
	cmp r0, #0x18
	bls _02096D30
	bl GF_AssertFail
_02096D30:
	add r4, r7, #4
	ldr r1, [sp]
	add r0, r4, #4
	add r2, r6, #0
	str r5, [r7, #4]
	bl memcpy
	mov r0, #0x82
	add r1, r4, #0
	mov r2, #0x18
	bl sub_02037030
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02096D14

	thumb_func_start sub_02096D4C
sub_02096D4C: ; 0x02096D4C
	push {r4, lr}
	ldr r4, [r0, #0x1c]
	cmp r4, #1
	bne _02096D58
	mov r0, #0
	pop {r4, pc}
_02096D58:
	bl sub_02096D14
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02096D4C

	thumb_func_start sub_02096D60
sub_02096D60: ; 0x02096D60
	push {r3, r4, r5, lr}
	ldr r4, [r2]
	cmp r4, #0x12
	blo _02096D6E
	bl GF_AssertFail
	pop {r3, r4, r5, pc}
_02096D6E:
	lsl r5, r4, #2
	ldr r4, _02096D7C ; =_02108804
	add r2, r2, #4
	ldr r4, [r4, r5]
	blx r4
	pop {r3, r4, r5, pc}
	nop
_02096D7C: .word _02108804
	thumb_func_end sub_02096D60

	thumb_func_start sub_02096D80
sub_02096D80: ; 0x02096D80
	push {r4, lr}
	add r1, r0, #0
	mov r0, #0x46
	add r4, r2, #0
	ldrsh r2, [r3, r0]
	mov r0, #1
	lsl r0, r1
	orr r2, r0
	add r0, r3, #0
	add r0, #0x46
	strh r2, [r0]
	add r0, r3, #0
	bl sub_02097018
	mov r2, #0x59
	add r1, r4, #0
	lsl r2, r2, #4
	bl memcpy
	pop {r4, pc}
	thumb_func_end sub_02096D80

	thumb_func_start sub_02096DA8
sub_02096DA8: ; 0x02096DA8
	cmp r0, #0
	bne _02096DB0
	ldrb r0, [r2]
	str r0, [r3, #0x28]
_02096DB0:
	bx lr
	.balign 4, 0
	thumb_func_end sub_02096DA8

	thumb_func_start sub_02096DB4
sub_02096DB4: ; 0x02096DB4
	ldr r0, [r3, #0x20]
	add r0, r0, #1
	str r0, [r3, #0x20]
	bx lr
	thumb_func_end sub_02096DB4

	thumb_func_start sub_02096DBC
sub_02096DBC: ; 0x02096DBC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r3, #0
	bl sub_0203769C
	cmp r0, #0
	beq _02096DE0
	mov r0, #0
	str r0, [r4, #0x20]
	mov r0, #1
	str r0, [r4, #0x24]
	ldr r0, [r4]
	lsl r2, r5, #0x18
	ldr r0, [r0, #0x38]
	mov r1, #0x1f
	lsr r2, r2, #0x18
	bl ov85_021E9C84
_02096DE0:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02096DBC

	thumb_func_start sub_02096DE4
sub_02096DE4: ; 0x02096DE4
	ldr r0, [r3]
	ldr r3, _02096DF0 ; =ov85_021E9C84
	ldr r0, [r0, #0x38]
	mov r1, #2
	mov r2, #0
	bx r3
	.balign 4, 0
_02096DF0: .word ov85_021E9C84
	thumb_func_end sub_02096DE4

	thumb_func_start sub_02096DF4
sub_02096DF4: ; 0x02096DF4
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r6, r0, #0
	add r5, r2, #0
	add r4, r3, #0
	cmp r6, #0
	beq _02096E7E
	bl sub_0203769C
	cmp r0, #0
	bne _02096ECC
	ldrb r1, [r5]
	add r0, sp, #0
	strb r1, [r0]
	ldrb r1, [r5, #1]
	strb r1, [r0, #1]
	ldrb r1, [r5, #2]
	strb r1, [r0, #2]
	ldrb r1, [r5, #3]
	strb r1, [r0, #3]
	strb r6, [r0]
	ldr r1, [r4, #0x2c]
	strb r1, [r0, #1]
	ldrb r0, [r5, #2]
	cmp r0, #0
	beq _02096E2C
	cmp r0, #1
	b _02096E6E
_02096E2C:
	bl sub_02037454
	ldr r1, [r4, #0x2c]
	cmp r1, r0
	bne _02096E4E
	bl sub_02096FFC
	ldr r1, [r4, #0x2c]
	cmp r1, r0
	bne _02096E4E
	bl sub_02033250
	bl MATH_CountPopulation
	ldr r1, [r4, #0x2c]
	cmp r1, r0
	beq _02096E56
_02096E4E:
	mov r1, #0
	add r0, sp, #0
	strb r1, [r0, #3]
	b _02096E6E
_02096E56:
	mov r1, #1
	add r0, r1, #0
	ldr r2, [r4, #0x30]
	lsl r0, r6
	orr r0, r2
	str r0, [r4, #0x30]
	add r0, sp, #0
	strb r1, [r0, #3]
	bl sub_02037454
	bl sub_02038C1C
_02096E6E:
	add r0, r4, #0
	mov r1, #2
	add r2, sp, #0
	mov r3, #4
	bl sub_02096D4C
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_02096E7E:
	ldrb r0, [r5, #2]
	cmp r0, #0
	beq _02096E8C
	cmp r0, #1
	beq _02096EC0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_02096E8C:
	ldrb r6, [r5]
	bl sub_0203769C
	cmp r6, r0
	bne _02096ECC
	ldrb r0, [r5, #3]
	cmp r0, #0
	bne _02096EAC
	ldr r0, [r4]
	mov r1, #8
	ldr r0, [r0, #0x38]
	add r2, r6, #0
	bl ov85_021E9C84
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_02096EAC:
	ldrb r0, [r5, #1]
	mov r1, #7
	strh r0, [r4, #0x38]
	ldr r0, [r4]
	ldrb r2, [r5]
	ldr r0, [r0, #0x38]
	bl ov85_021E9C84
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_02096EC0:
	ldr r0, [r4]
	ldrb r2, [r5]
	ldr r0, [r0, #0x38]
	mov r1, #0x13
	bl ov85_021E9C84
_02096ECC:
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	thumb_func_end sub_02096DF4

	thumb_func_start sub_02096ED0
sub_02096ED0: ; 0x02096ED0
	push {r4, lr}
	add r4, r3, #0
	ldr r0, [r4]
	ldrb r2, [r2]
	ldr r0, [r0, #0x38]
	mov r1, #1
	bl ov85_021E9D9C
	bl sub_0203769C
	cmp r0, #0
	bne _02096EEC
	mov r0, #0
	str r0, [r4, #0x34]
_02096EEC:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02096ED0

	thumb_func_start sub_02096EF0
sub_02096EF0: ; 0x02096EF0
	push {r4, lr}
	add r4, r3, #0
	bl sub_0203769C
	cmp r0, #0
	beq _02096F08
	ldr r0, [r4]
	mov r1, #0xd
	ldr r0, [r0, #0x38]
	mov r2, #0
	bl ov85_021E9C84
_02096F08:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02096EF0

	thumb_func_start sub_02096F0C
sub_02096F0C: ; 0x02096F0C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r3, #0
	bl sub_0203769C
	cmp r0, #0
	bne _02096F2A
	add r0, sp, #0
	strb r5, [r0]
	add r0, r4, #0
	mov r1, #0
	add r2, sp, #0
	mov r3, #1
	bl sub_02096D4C
_02096F2A:
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02096F0C

	thumb_func_start sub_02096F2C
sub_02096F2C: ; 0x02096F2C
	add r0, r3, #0
	add r0, #0x40
	ldrh r1, [r0]
	ldrh r0, [r2]
	add r3, #0x40
	orr r0, r1
	strh r0, [r3]
	bx lr
	thumb_func_end sub_02096F2C

	thumb_func_start sub_02096F3C
sub_02096F3C: ; 0x02096F3C
	add r1, r3, #0
	add r1, #0x42
	ldrh r2, [r1]
	mov r1, #1
	lsl r1, r0
	add r0, r2, #0
	orr r0, r1
	add r3, #0x42
	strh r0, [r3]
	bx lr
	thumb_func_end sub_02096F3C

	thumb_func_start sub_02096F50
sub_02096F50: ; 0x02096F50
	ldr r0, [r3]
	ldr r3, _02096F5C ; =ov85_021E8680
	ldr r0, [r0, #0x34]
	add r1, r2, #0
	bx r3
	nop
_02096F5C: .word ov85_021E8680
	thumb_func_end sub_02096F50

	thumb_func_start sub_02096F60
sub_02096F60: ; 0x02096F60
	ldr r0, [r3]
	ldr r3, _02096F6C ; =ov85_021E86AC
	ldr r0, [r0, #0x34]
	ldr r1, [r2]
	bx r3
	nop
_02096F6C: .word ov85_021E86AC
	thumb_func_end sub_02096F60

	thumb_func_start sub_02096F70
sub_02096F70: ; 0x02096F70
	ldr r0, [r3]
	ldr r3, _02096F7C ; =ov85_021E85C4
	ldr r0, [r0, #0x34]
	ldrb r1, [r2]
	bx r3
	nop
_02096F7C: .word ov85_021E85C4
	thumb_func_end sub_02096F70

	thumb_func_start sub_02096F80
sub_02096F80: ; 0x02096F80
	push {r3, r4, r5, lr}
	add r4, r2, #0
	add r5, r3, #0
	bl sub_0203769C
	cmp r0, #0
	beq _02096F98
	ldr r0, [r5]
	add r1, r4, #0
	ldr r0, [r0, #0x34]
	bl ov85_021E85CC
_02096F98:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02096F80

	thumb_func_start sub_02096F9C
sub_02096F9C: ; 0x02096F9C
	add r1, r0, #0
	ldr r0, [r3]
	ldr r3, _02096FA8 ; =ov85_021E8740
	ldr r0, [r0, #0x34]
	ldr r2, [r2]
	bx r3
	.balign 4, 0
_02096FA8: .word ov85_021E8740
	thumb_func_end sub_02096F9C

	thumb_func_start sub_02096FAC
sub_02096FAC: ; 0x02096FAC
	ldr r0, [r3]
	ldr r3, _02096FB8 ; =ov85_021E8748
	ldr r0, [r0, #0x34]
	add r1, r2, #0
	bx r3
	nop
_02096FB8: .word ov85_021E8748
	thumb_func_end sub_02096FAC

	thumb_func_start sub_02096FBC
sub_02096FBC: ; 0x02096FBC
	add r1, r3, #0
	add r1, #0x48
	ldrh r2, [r1]
	mov r1, #1
	lsl r1, r0
	add r0, r2, #0
	orr r0, r1
	add r3, #0x48
	strh r0, [r3]
	bx lr
	thumb_func_end sub_02096FBC

	thumb_func_start sub_02096FD0
sub_02096FD0: ; 0x02096FD0
	add r1, r3, #0
	add r1, #0x4a
	ldrh r2, [r1]
	mov r1, #1
	lsl r1, r0
	add r0, r2, #0
	orr r0, r1
	add r3, #0x4a
	strh r0, [r3]
	bx lr
	thumb_func_end sub_02096FD0

	thumb_func_start sub_02096FE4
sub_02096FE4: ; 0x02096FE4
	mov r0, #0x18
	bx lr
	thumb_func_end sub_02096FE4

	thumb_func_start sub_02096FE8
sub_02096FE8: ; 0x02096FE8
	mov r0, #0x59
	lsl r0, r0, #4
	bx lr
	.balign 4, 0
	thumb_func_end sub_02096FE8

	thumb_func_start sub_02096FF0
sub_02096FF0: ; 0x02096FF0
	ldr r2, [r1, #0x4c]
	mov r1, #0x59
	lsl r1, r1, #4
	mul r1, r0
	add r0, r2, r1
	bx lr
	thumb_func_end sub_02096FF0

	thumb_func_start sub_02096FFC
sub_02096FFC: ; 0x02096FFC
	push {r3, r4, r5, lr}
	mov r5, #0
	add r4, r5, #0
_02097002:
	add r0, r4, #0
	bl sub_02034818
	cmp r0, #0
	beq _0209700E
	add r5, r5, #1
_0209700E:
	add r4, r4, #1
	cmp r4, #5
	blt _02097002
	add r0, r5, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02096FFC

	thumb_func_start sub_02097018
sub_02097018: ; 0x02097018
	ldr r2, [r0, #0x50]
	mov r0, #0x59
	lsl r0, r0, #4
	mul r0, r1
	add r0, r2, r0
	bx lr
	thumb_func_end sub_02097018

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
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [r4, #0x18]
	ldr r0, [r5, #0xc]
	bl Sav2_GameStats_get
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
	bl ScrUnk80_AddOvyMan
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
	bl FieldSys_ApplicationIsRunning
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
	bl FieldSys_ApplicationIsRunning
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
	bl ScrUnk80_AddOvyMan
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
	bl FieldSys_ApplicationIsRunning
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
	bl FieldSys_ApplicationIsRunning
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

	; File boundary

	thumb_func_start sub_020971F8
sub_020971F8: ; 0x020971F8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_0203AC88
	add r4, r0, #0
	bl sub_0203AC90
	add r1, r0, #0
	add r0, r4, #0
	add r2, r5, #0
	bl sub_0203410C
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_020971F8

	thumb_func_start sub_02097214
sub_02097214: ; 0x02097214
	push {r4, lr}
	bl sub_0203AC88
	add r4, r0, #0
	bl sub_0203AC90
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #0
	bl sub_0203410C
	pop {r4, pc}
	thumb_func_end sub_02097214

	thumb_func_start sub_0209722C
sub_0209722C: ; 0x0209722C
	mov r0, #0
	bx lr
	thumb_func_end sub_0209722C

	thumb_func_start sub_02097230
sub_02097230: ; 0x02097230
	mov r0, #8
	bx lr
	thumb_func_end sub_02097230

	thumb_func_start sub_02097234
sub_02097234: ; 0x02097234
	mov r0, #4
	bx lr
	thumb_func_end sub_02097234

	thumb_func_start sub_02097238
sub_02097238: ; 0x02097238
	push {r3, lr}
	cmp r3, #0
	beq _02097246
	add r0, r3, #0
	add r1, r2, #0
	bl ov44_02233100
_02097246:
	pop {r3, pc}
	thumb_func_end sub_02097238

	thumb_func_start sub_02097248
sub_02097248: ; 0x02097248
	push {r3, lr}
	cmp r3, #0
	beq _02097254
	add r0, r3, #0
	bl ov44_02233160
_02097254:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02097248

	thumb_func_start sub_02097258
sub_02097258: ; 0x02097258
	push {r3, lr}
	cmp r3, #0
	beq _02097266
	add r0, r3, #0
	add r1, r2, #0
	bl ov44_0223317C
_02097266:
	pop {r3, pc}
	thumb_func_end sub_02097258

	; File boundary?

	thumb_func_start sub_02097268
sub_02097268: ; 0x02097268
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r2, #0
	cmp r1, #0x18
	blt _02097278
	bl GF_AssertFail
	mov r1, #0
_02097278:
	lsl r0, r1, #1
	add r2, r1, r0
	ldr r0, _020972A0 ; =_02108EEE
	add r1, r0, r2
	ldrb r0, [r0, r2]
	strb r0, [r5]
	ldrb r0, [r1, #1]
	strb r0, [r5, #1]
	ldrb r0, [r1, #2]
	strb r0, [r5, #2]
	ldrb r0, [r5, #1]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1f
	beq _0209729E
	cmp r4, #1
	bne _0209729E
	ldrb r0, [r5]
	add r0, r0, #1
	strb r0, [r5]
_0209729E:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_020972A0: .word _02108EEE
	thumb_func_end sub_02097268

	thumb_func_start sub_020972A4
sub_020972A4: ; 0x020972A4
	ldr r3, [r0]
	ldr r2, [r1]
	cmp r3, r2
	bne _020972BC
	ldrh r3, [r0, #4]
	ldrh r2, [r1, #4]
	cmp r3, r2
	bne _020972BC
	ldrh r2, [r0, #6]
	ldrh r0, [r1, #6]
	cmp r2, r0
	beq _020972C0
_020972BC:
	mov r0, #0
	bx lr
_020972C0:
	mov r0, #1
	bx lr
	thumb_func_end sub_020972A4

	thumb_func_start sub_020972C4
sub_020972C4: ; 0x020972C4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r6, #0
_020972CC:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_020972A4
	cmp r0, #0
	bne _020972DC
	mov r0, #0
	pop {r4, r5, r6, pc}
_020972DC:
	add r6, r6, #1
	add r4, #8
	add r5, #8
	cmp r6, #0xa
	blt _020972CC
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_020972C4

	thumb_func_start sub_020972EC
sub_020972EC: ; 0x020972EC
	push {r3, r4}
	mov r4, #0
	cmp r2, #0
	ble _02097306
_020972F4:
	ldrb r3, [r1, r4]
	cmp r0, r3
	bne _02097300
	mov r0, #1
	pop {r3, r4}
	bx lr
_02097300:
	add r4, r4, #1
	cmp r4, r2
	blt _020972F4
_02097306:
	mov r0, #0
	pop {r3, r4}
	bx lr
	thumb_func_end sub_020972EC

	thumb_func_start sub_0209730C
sub_0209730C: ; 0x0209730C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0xb0
	add r4, r0, #0
	str r1, [sp, #4]
	bl SaveData_GetPhoneRematches
	str r0, [sp, #0x2c]
	add r0, r4, #0
	bl Save_SafariZone_get
	str r0, [sp, #0x28]
	mov r1, #0
	bl sub_0202F630
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x28]
	bl sub_0202F720
	cmp r0, #0
	beq _0209733A
	ldr r0, [sp, #4]
	cmp r0, #0
	bgt _0209733C
_0209733A:
	b _020974BC
_0209733C:
	add r0, r4, #0
	bl SavArray_Flags_get
	bl ScriptState_CheckSafariSysFlag
	cmp r0, #0
	beq _02097364
	ldr r0, [sp, #0x28]
	bl sub_0202F6AC
	add r2, r0, #0
	ldr r1, [sp, #4]
	ldr r0, [sp, #0x28]
	add r1, r2, r1
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl sub_0202F6A0
	add sp, #0xb0
	pop {r3, r4, r5, r6, r7, pc}
_02097364:
	mov r0, #0
	str r0, [sp, #0x20]
	ldr r1, [sp, #0x20]
	add r0, sp, #0x30
	mov r2, #6
	bl MI_CpuFill8
	add r0, sp, #0x38
	mov r1, #0
	mov r2, #0x78
	bl MI_CpuFill8
	add r0, sp, #0x38
	mov r6, #0
	str r0, [sp, #0xc]
_02097382:
	ldr r0, _020974C0 ; =0x0000FFFF
	ldr r5, [sp, #0xc]
	asr r0, r6
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1d
	mov r4, #0
	add r7, r0, #1
_02097390:
	mov r0, #0xb
	str r0, [sp]
	ldr r0, [sp, #0x24]
	add r1, r6, #0
	add r2, r4, #0
	mov r3, #0
	bl sub_020974C4
	add r4, r4, #1
	stmia r5!, {r0}
	cmp r4, r7
	blt _02097390
	ldr r0, [sp, #0xc]
	add r6, r6, #1
	add r0, #0x14
	str r0, [sp, #0xc]
	cmp r6, #6
	blt _02097382
	ldr r0, [sp, #0x28]
	ldr r1, [sp, #4]
	bl sub_0202F6B8
	mov r0, #0
	str r0, [sp, #8]
	ldr r0, [sp, #0x24]
	str r0, [sp, #0x18]
	add r0, sp, #0x38
	str r0, [sp, #0x14]
_020973C8:
	ldr r0, [sp, #0x18]
	ldr r2, [sp, #0x20]
	ldrb r7, [r0]
	lsl r2, r2, #0x18
	add r1, sp, #0x30
	add r0, r7, #0
	lsr r2, r2, #0x18
	bl sub_020972EC
	cmp r0, #0
	bne _02097442
	ldr r1, _020974C0 ; =0x0000FFFF
	ldr r0, [sp, #8]
	ldr r4, [sp, #0x14]
	asr r1, r0
	lsl r0, r1, #0x1f
	lsr r0, r0, #0x1d
	add r0, r0, #1
	mov r5, #0
	str r0, [sp, #0x10]
_020973F0:
	mov r0, #0xb
	str r0, [sp]
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #8]
	add r2, r5, #0
	mov r3, #0
	bl sub_020974C4
	add r6, r0, #0
	ldr r0, [r4]
	add r1, r6, #0
	bl sub_020972C4
	cmp r0, #0
	beq _02097416
	add r0, r6, #0
	bl FreeToHeap
	b _02097438
_02097416:
	ldr r2, [sp, #0x20]
	add r0, r7, #0
	lsl r2, r2, #0x18
	add r1, sp, #0x30
	lsr r2, r2, #0x18
	bl sub_020972EC
	cmp r0, #0
	bne _02097432
	ldr r0, [sp, #0x20]
	add r1, sp, #0x30
	strb r7, [r1, r0]
	add r0, r0, #1
	str r0, [sp, #0x20]
_02097432:
	add r0, r6, #0
	bl FreeToHeap
_02097438:
	ldr r0, [sp, #0x10]
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, r0
	blt _020973F0
_02097442:
	ldr r0, [sp, #0x18]
	add r0, #0x7a
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x14]
	add r0, #0x14
	str r0, [sp, #0x14]
	ldr r0, [sp, #8]
	add r0, r0, #1
	str r0, [sp, #8]
	cmp r0, #6
	blt _020973C8
	add r0, sp, #0x38
	mov r7, #0
	str r0, [sp, #0x1c]
_0209745E:
	ldr r0, _020974C0 ; =0x0000FFFF
	ldr r4, [sp, #0x1c]
	asr r0, r7
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1d
	mov r5, #0
	add r6, r0, #1
_0209746C:
	ldr r0, [r4]
	cmp r0, #0
	beq _02097476
	bl FreeToHeap
_02097476:
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, r6
	blt _0209746C
	ldr r0, [sp, #0x1c]
	add r7, r7, #1
	add r0, #0x14
	str r0, [sp, #0x1c]
	cmp r7, #6
	blt _0209745E
	ldr r0, [sp, #0x20]
	cmp r0, #0
	bne _020974A6
	ldr r0, [sp, #0x2c]
	mov r1, #6
	bl sub_0202F050
	mov r1, #0
	ldr r0, [sp, #0x2c]
	add r2, r1, #0
	bl sub_0202F300
	add sp, #0xb0
	pop {r3, r4, r5, r6, r7, pc}
_020974A6:
	ldr r0, [sp, #0x2c]
	mov r1, #6
	bl sub_0202F01C
	ldr r2, [sp, #0x20]
	ldr r0, [sp, #0x2c]
	lsl r2, r2, #0x18
	add r1, sp, #0x30
	lsr r2, r2, #0x18
	bl sub_0202F300
_020974BC:
	add sp, #0xb0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_020974C0: .word 0x0000FFFF
	thumb_func_end sub_0209730C

	thumb_func_start sub_020974C4
sub_020974C4: ; 0x020974C4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	str r1, [sp, #8]
	str r0, [sp, #4]
	ldr r0, [sp, #8]
	mov r1, #0x7a
	add r7, r0, #0
	ldr r0, [sp, #0x48]
	mul r7, r1
	mov r1, #0x50
	add r4, r2, #0
	str r3, [sp, #0xc]
	str r0, [sp, #0x14]
	bl AllocFromHeapAtEnd
	str r0, [sp, #0x20]
	mov r5, #0
	add r6, r0, #0
	mov r2, #0x81
	mov r3, #0x13
	mov r1, #5
_020974EE:
	cmp r4, #0
	bne _020974F6
	str r3, [r6]
	b _020974F8
_020974F6:
	str r2, [r6]
_020974F8:
	strh r1, [r6, #6]
	ldrh r0, [r6, #6]
	add r5, r5, #1
	strh r0, [r6, #4]
	add r6, #8
	cmp r5, #0xa
	blt _020974EE
	mov r0, #1
	str r0, [sp]
	ldr r1, [sp, #4]
	ldr r3, [sp, #0x14]
	ldrb r1, [r1, r7]
	mov r0, #0xe8
	mov r2, #0
	bl GfGfxLoader_LoadFromNarc
	add r5, r0, #0
	bne _02097522
	ldr r0, [sp, #0x20]
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
_02097522:
	ldr r0, [sp, #0x14]
	mov r1, #0x64
	bl AllocFromHeapAtEnd
	str r0, [sp, #0x1c]
	ldr r1, [sp, #0x1c]
	mov r0, #8
	mov r2, #0
_02097532:
	add r3, r5, r0
	add r0, #0x78
	str r3, [r1]
	add r3, r5, r0
	str r3, [r1, #4]
	ldrb r3, [r5, r2]
	add r2, r2, #1
	lsl r6, r3, #2
	strb r3, [r1, #0x10]
	lsl r3, r6, #1
	add r3, r6, r3
	add r0, r0, r3
	str r6, [r1, #0xc]
	add r3, r5, r0
	str r3, [r1, #8]
	ldrb r3, [r1, #0x10]
	add r1, #0x14
	lsl r3, r3, #2
	add r0, r0, r3
	cmp r2, #5
	blt _02097532
	ldr r0, [sp, #0x1c]
	add r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	bne _0209757C
	cmp r4, #0
	ble _0209757C
	ldr r0, [sp, #0x1c]
	bl FreeToHeap
	add r0, r5, #0
	bl FreeToHeap
	ldr r0, [sp, #0x20]
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
_0209757C:
	ldr r0, [sp, #0xc]
	mov r2, #0x14
	add r7, r0, #0
	mov r1, #0xa
	mul r2, r4
	ldr r3, [sp, #0x1c]
	mul r7, r1
	ldr r0, [sp, #0x20]
	mov r1, #0
	str r2, [sp, #0x10]
	add r4, r3, r2
_02097592:
	add r2, r7, r1
	ldr r3, [r4]
	lsl r2, r2, #2
	add r6, r3, r2
	ldrh r2, [r3, r2]
	add r1, r1, #1
	str r2, [r0]
	ldrh r2, [r6, #2]
	strh r2, [r0, #6]
	strh r2, [r0, #4]
	add r0, #8
	cmp r1, #0xa
	blt _02097592
	mov r0, #0
	str r0, [sp, #0x18]
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	add r2, sp, #0x2c
	bl sub_02097694
	ldr r1, [sp, #0x1c]
	ldr r0, [sp, #0x10]
	mov r2, #0
	add r0, r1, r0
	ldrb r0, [r0, #0x10]
	cmp r0, #0
	ble _0209763C
	add r1, r2, #0
_020975CA:
	ldr r3, [r4, #8]
	ldrb r6, [r3, r1]
	add r0, r3, r1
	add r3, sp, #0x2c
	add r3, r3, r6
	sub r3, r3, #1
	ldrb r6, [r3]
	ldrb r3, [r0, #1]
	cmp r6, r3
	blo _02097632
	ldrb r6, [r0, #2]
	cmp r6, #0
	beq _020975F2
	add r3, sp, #0x2c
	add r3, r3, r6
	sub r3, r3, #1
	ldrb r3, [r3]
	ldrb r0, [r0, #3]
	cmp r3, r0
	blo _02097632
_020975F2:
	ldrb r3, [r4, #0x10]
	ldr r0, [sp, #0xc]
	mul r3, r0
	add r0, r2, r3
	lsl r0, r0, #2
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x18]
	ldr r3, [sp, #0x20]
	lsl r0, r0, #3
	mov ip, r0
	add r7, r3, r0
	ldr r3, [r4, #4]
	ldr r0, [sp, #0x28]
	mov r6, ip
	ldrh r0, [r3, r0]
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x20]
	ldr r3, [sp, #0x24]
	str r3, [r0, r6]
	ldr r3, [r4, #4]
	ldr r0, [sp, #0x28]
	add r0, r3, r0
	ldrh r0, [r0, #2]
	strh r0, [r7, #6]
	strh r0, [r7, #4]
	ldr r0, [sp, #0x18]
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	cmp r0, #9
	bhi _0209763C
_02097632:
	ldrb r0, [r4, #0x10]
	add r2, r2, #1
	add r1, r1, #4
	cmp r2, r0
	blt _020975CA
_0209763C:
	ldr r0, [sp, #0x1c]
	bl FreeToHeap
	add r0, r5, #0
	bl FreeToHeap
	ldr r0, [sp, #0x20]
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_020974C4

	thumb_func_start sub_02097650
sub_02097650: ; 0x02097650
	push {r3, r4}
	cmp r1, #0
	bne _0209765C
	mov r0, #0
	pop {r3, r4}
	bx lr
_0209765C:
	sub r2, r1, #1
	lsl r1, r2, #2
	ldr r3, _02097690 ; =_02108EDA
	add r1, r2, r1
	mov r4, #0
	add r2, r3, r1
_02097668:
	ldrb r1, [r2]
	cmp r0, r1
	bhs _02097678
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r3, r4}
	bx lr
_02097678:
	add r4, r4, #1
	add r2, r2, #1
	cmp r4, #5
	blt _02097668
	cmp r0, #0x19
	bhs _0209768A
	mov r0, #6
	pop {r3, r4}
	bx lr
_0209768A:
	mov r0, #7
	pop {r3, r4}
	bx lr
	.balign 4, 0
_02097690: .word _02108EDA
	thumb_func_end sub_02097650

	thumb_func_start sub_02097694
sub_02097694: ; 0x02097694
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r6, r2, #0
	mov r2, #0x7a
	mul r2, r1
	add r1, r0, r2
	str r1, [sp]
	ldrb r1, [r0, r2]
	add r1, r0, r1
	mov r0, #0xb7
	lsl r0, r0, #2
	ldrb r0, [r1, r0]
	mov r1, #0xa
	bl _s32_div_f
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	add r0, r6, #0
	mov r1, #0
	mov r2, #8
	bl MI_CpuFill8
	ldr r0, [sp]
	mov r4, #0
	ldrb r0, [r0, #1]
	cmp r0, #0
	ble _0209771A
	ldr r5, [sp]
	add r7, sp, #8
_020976D0:
	ldrb r1, [r5, #2]
	add r0, sp, #8
	mov r2, #2
	bl sub_02097268
	ldrb r0, [r7, #2]
	cmp r0, #0
	beq _0209770E
	add r0, r6, r0
	add r0, r0, #4
	sub r0, r0, #1
	ldrb r1, [r0]
	add r1, r1, #1
	strb r1, [r0]
	ldrb r1, [r7, #2]
	ldr r0, [sp, #4]
	bl sub_02097650
	add r3, r0, #0
	ldrb r0, [r7, #2]
	add r0, r6, r0
	sub r0, r0, #1
	ldrb r1, [r0]
	add r2, r3, r1
	cmp r2, #0xff
	ble _0209770A
	mov r1, #0xff
	strb r1, [r0]
	b _0209770E
_0209770A:
	add r1, r1, r3
	strb r1, [r0]
_0209770E:
	ldr r0, [sp]
	add r4, r4, #1
	ldrb r0, [r0, #1]
	add r5, r5, #4
	cmp r4, r0
	blt _020976D0
_0209771A:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02097694

	thumb_func_start sub_02097720
sub_02097720: ; 0x02097720
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r5, r1, #0
	bl TaskManager_GetSys
	mov r0, #0xb
	mov r1, #0xc
	bl AllocFromHeapAtEnd
	mov r1, #0
	mov r2, #0xc
	add r4, r0, #0
	bl MI_CpuFill8
	mov r0, #0
	str r0, [r4]
	ldr r1, _02097750 ; =sub_02097754
	add r0, r6, #0
	add r2, r4, #0
	str r5, [r4, #4]
	bl QueueTask
	pop {r4, r5, r6, pc}
	nop
_02097750: .word sub_02097754
	thumb_func_end sub_02097720

	thumb_func_start sub_02097754
sub_02097754: ; 0x02097754
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl TaskManager_GetSys
	add r6, r0, #0
	add r0, r5, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldr r1, [r4]
	cmp r1, #3
	bhi _020977C6
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02097778: ; jump table
	.short _02097780 - _02097778 - 2 ; case 0
	.short _02097790 - _02097778 - 2 ; case 1
	.short _020977B0 - _02097778 - 2 ; case 2
	.short _020977BE - _02097778 - 2 ; case 3
_02097780:
	add r0, r6, #0
	bl sub_0203EB64
	str r0, [r4, #8]
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _020977C6
_02097790:
	add r0, r6, #0
	bl FieldSys_ApplicationIsRunning
	cmp r0, #0
	bne _020977C6
	ldr r0, [r4, #8]
	ldrh r1, [r0, #0x1c]
	ldr r0, [r4, #4]
	strh r1, [r0]
	ldr r0, [r4, #8]
	bl FreeToHeap
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _020977C6
_020977B0:
	add r0, r5, #0
	bl sub_020552A4
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _020977C6
_020977BE:
	bl FreeToHeap
	mov r0, #1
	pop {r4, r5, r6, pc}
_020977C6:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02097754

	thumb_func_start sub_020977CC
sub_020977CC: ; 0x020977CC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #0xb
	mov r1, #0x58
	add r7, r2, #0
	str r3, [sp]
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	strb r6, [r4, #1]
	add r1, r4, #0
	ldr r0, [sp]
	strb r7, [r4, #2]
	str r0, [r4, #4]
	ldr r0, [sp, #0x18]
	add r1, #0x10
	str r0, [r4, #8]
	ldr r0, [sp, #0x1c]
	str r0, [r4, #0xc]
	mov r0, #0
	bl LoadAreaOrDungeonLightTxt
	mov r0, #0
	strb r0, [r4]
	ldr r0, [r5, #0x10]
	ldr r1, _0209780C ; =sub_020978D0
	add r2, r4, #0
	bl QueueTask
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0209780C: .word sub_020978D0
	thumb_func_end sub_020977CC

	thumb_func_start sub_02097810
sub_02097810: ; 0x02097810
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #0xb
	mov r1, #8
	add r7, r2, #0
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	str r7, [r4, #4]
	add r0, r5, #0
	strb r6, [r4]
	bl Field_GetTImeOfDay
	cmp r0, #4
	bhi _02097852
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0209783C: ; jump table
	.short _02097846 - _0209783C - 2 ; case 0
	.short _02097846 - _0209783C - 2 ; case 1
	.short _0209784C - _0209783C - 2 ; case 2
	.short _0209784C - _0209783C - 2 ; case 3
	.short _0209784C - _0209783C - 2 ; case 4
_02097846:
	mov r0, #0
	strb r0, [r4, #2]
	b _0209785A
_0209784C:
	mov r0, #1
	strb r0, [r4, #2]
	b _0209785A
_02097852:
	bl GF_AssertFail
	mov r0, #0
	strb r0, [r4, #2]
_0209785A:
	ldr r0, [r5, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	bl PlayerProfile_GetTrainerGender
	strb r0, [r4, #1]
	ldr r0, [r5, #0x10]
	ldr r1, _02097874 ; =sub_02097878
	add r2, r4, #0
	bl QueueTask
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02097874: .word sub_02097878
	thumb_func_end sub_02097810

	thumb_func_start sub_02097878
sub_02097878: ; 0x02097878
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl TaskManager_GetSys
	add r4, r0, #0
	add r0, r5, #0
	bl TaskManager_GetEnv
	add r6, r0, #0
	add r0, r5, #0
	bl sub_02050654
	add r5, r0, #0
	ldr r0, [r5]
	cmp r0, #0
	beq _020978A2
	cmp r0, #1
	beq _020978AC
	cmp r0, #2
	beq _020978BA
	b _020978C4
_020978A2:
	add r0, r4, #0
	add r1, r6, #0
	bl sub_0203FC68
	b _020978C4
_020978AC:
	add r0, r4, #0
	bl FieldSys_ApplicationIsRunning
	cmp r0, #0
	beq _020978C4
	mov r0, #0
	pop {r4, r5, r6, pc}
_020978BA:
	add r0, r6, #0
	bl FreeToHeap
	mov r0, #1
	pop {r4, r5, r6, pc}
_020978C4:
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02097878

	thumb_func_start sub_020978D0
sub_020978D0: ; 0x020978D0
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	bl TaskManager_GetSys
	add r6, r0, #0
	add r0, r5, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldrb r1, [r4]
	cmp r1, #5
	bhi _020979A2
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_020978F6: ; jump table
	.short _02097902 - _020978F6 - 2 ; case 0
	.short _02097928 - _020978F6 - 2 ; case 1
	.short _02097954 - _020978F6 - 2 ; case 2
	.short _02097966 - _020978F6 - 2 ; case 3
	.short _02097982 - _020978F6 - 2 ; case 4
	.short _02097998 - _020978F6 - 2 ; case 5
_02097902:
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0xb
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl sub_0200FA24
	mov r0, #0
	mov r1, #6
	bl GF_SndStartFadeOutBGM
	mov r0, #1
	strb r0, [r4]
	b _020979A2
_02097928:
	bl sub_0200FB5C
	cmp r0, #0
	beq _02097938
	bl GF_SndGetFadeTimer
	cmp r0, #0
	beq _0209793E
_02097938:
	add sp, #0xc
	mov r0, #0
	pop {r3, r4, r5, r6, pc}
_0209793E:
	bl sub_02004A90
	mov r1, #0
	bl StopBGM
	add r0, r5, #0
	bl sub_0205525C
	mov r0, #2
	strb r0, [r4]
	b _020979A2
_02097954:
	ldrb r1, [r4, #1]
	add r2, r4, #0
	add r0, r6, #0
	add r2, #0x10
	bl sub_02097810
	mov r0, #3
	strb r0, [r4]
	b _020979A2
_02097966:
	ldr r0, [r4, #0xc]
	mov r2, #0
	str r0, [sp]
	ldrb r0, [r4, #2]
	mvn r2, r2
	str r0, [sp, #4]
	ldr r1, [r4, #4]
	ldr r3, [r4, #8]
	add r0, r5, #0
	bl sub_020537F0
	mov r0, #4
	strb r0, [r4]
	b _020979A2
_02097982:
	ldr r1, [r4, #4]
	add r0, r6, #0
	mov r2, #0
	bl sub_02055110
	add r0, r5, #0
	bl sub_02055408
	mov r0, #5
	strb r0, [r4]
	b _020979A2
_02097998:
	bl FreeToHeap
	add sp, #0xc
	mov r0, #1
	pop {r3, r4, r5, r6, pc}
_020979A2:
	mov r0, #0
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end sub_020978D0

	thumb_func_start sub_020979A8
sub_020979A8: ; 0x020979A8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #0xb
	mov r1, #0x58
	add r7, r2, #0
	str r3, [sp]
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	strb r6, [r4, #1]
	add r1, r4, #0
	ldr r0, [sp]
	strb r7, [r4, #2]
	str r0, [r4, #4]
	ldr r0, [sp, #0x18]
	add r1, #0x10
	str r0, [r4, #8]
	ldr r0, [sp, #0x1c]
	str r0, [r4, #0xc]
	mov r0, #0
	bl LoadAreaOrDungeonLightTxt
	mov r0, #0
	strb r0, [r4]
	ldr r0, [r5, #0x10]
	ldr r1, _020979E8 ; =sub_02097AA0
	add r2, r4, #0
	bl QueueTask
	pop {r3, r4, r5, r6, r7, pc}
	nop
_020979E8: .word sub_02097AA0
	thumb_func_end sub_020979A8

	thumb_func_start sub_020979EC
sub_020979EC: ; 0x020979EC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #0xb
	mov r1, #8
	add r7, r2, #0
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	str r7, [r4, #4]
	add r0, r5, #0
	strb r6, [r4]
	bl Field_GetTImeOfDay
	cmp r0, #4
	bhi _02097A2E
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02097A18: ; jump table
	.short _02097A22 - _02097A18 - 2 ; case 0
	.short _02097A22 - _02097A18 - 2 ; case 1
	.short _02097A28 - _02097A18 - 2 ; case 2
	.short _02097A28 - _02097A18 - 2 ; case 3
	.short _02097A28 - _02097A18 - 2 ; case 4
_02097A22:
	mov r0, #0
	strb r0, [r4, #1]
	b _02097A36
_02097A28:
	mov r0, #1
	strb r0, [r4, #1]
	b _02097A36
_02097A2E:
	bl GF_AssertFail
	mov r0, #0
	strb r0, [r4, #1]
_02097A36:
	ldr r0, [r5, #0x10]
	ldr r1, _02097A44 ; =sub_02097A48
	add r2, r4, #0
	bl QueueTask
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02097A44: .word sub_02097A48
	thumb_func_end sub_020979EC

	thumb_func_start sub_02097A48
sub_02097A48: ; 0x02097A48
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl TaskManager_GetSys
	add r4, r0, #0
	add r0, r5, #0
	bl TaskManager_GetEnv
	add r6, r0, #0
	add r0, r5, #0
	bl sub_02050654
	add r5, r0, #0
	ldr r0, [r5]
	cmp r0, #0
	beq _02097A72
	cmp r0, #1
	beq _02097A7C
	cmp r0, #2
	beq _02097A8A
	b _02097A94
_02097A72:
	add r0, r4, #0
	add r1, r6, #0
	bl sub_0203FC90
	b _02097A94
_02097A7C:
	add r0, r4, #0
	bl FieldSys_ApplicationIsRunning
	cmp r0, #0
	beq _02097A94
	mov r0, #0
	pop {r4, r5, r6, pc}
_02097A8A:
	add r0, r6, #0
	bl FreeToHeap
	mov r0, #1
	pop {r4, r5, r6, pc}
_02097A94:
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02097A48

	thumb_func_start sub_02097AA0
sub_02097AA0: ; 0x02097AA0
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	bl TaskManager_GetSys
	add r6, r0, #0
	add r0, r5, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldrb r1, [r4]
	cmp r1, #5
	bhi _02097B72
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02097AC6: ; jump table
	.short _02097AD2 - _02097AC6 - 2 ; case 0
	.short _02097AF8 - _02097AC6 - 2 ; case 1
	.short _02097B24 - _02097AC6 - 2 ; case 2
	.short _02097B36 - _02097AC6 - 2 ; case 3
	.short _02097B52 - _02097AC6 - 2 ; case 4
	.short _02097B68 - _02097AC6 - 2 ; case 5
_02097AD2:
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0xb
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl sub_0200FA24
	mov r0, #0
	mov r1, #6
	bl GF_SndStartFadeOutBGM
	mov r0, #1
	strb r0, [r4]
	b _02097B72
_02097AF8:
	bl sub_0200FB5C
	cmp r0, #0
	beq _02097B08
	bl GF_SndGetFadeTimer
	cmp r0, #0
	beq _02097B0E
_02097B08:
	add sp, #0xc
	mov r0, #0
	pop {r3, r4, r5, r6, pc}
_02097B0E:
	bl sub_02004A90
	mov r1, #0
	bl StopBGM
	add r0, r5, #0
	bl sub_0205525C
	mov r0, #2
	strb r0, [r4]
	b _02097B72
_02097B24:
	ldrb r1, [r4, #1]
	add r2, r4, #0
	add r0, r6, #0
	add r2, #0x10
	bl sub_020979EC
	mov r0, #3
	strb r0, [r4]
	b _02097B72
_02097B36:
	ldr r0, [r4, #0xc]
	mov r2, #0
	str r0, [sp]
	ldrb r0, [r4, #2]
	mvn r2, r2
	str r0, [sp, #4]
	ldr r1, [r4, #4]
	ldr r3, [r4, #8]
	add r0, r5, #0
	bl sub_020537F0
	mov r0, #4
	strb r0, [r4]
	b _02097B72
_02097B52:
	ldr r1, [r4, #4]
	add r0, r6, #0
	mov r2, #0
	bl sub_02055110
	add r0, r5, #0
	bl sub_02055408
	mov r0, #5
	strb r0, [r4]
	b _02097B72
_02097B68:
	bl FreeToHeap
	add sp, #0xc
	mov r0, #1
	pop {r3, r4, r5, r6, pc}
_02097B72:
	mov r0, #0
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end sub_02097AA0

	thumb_func_start sub_02097B78
sub_02097B78: ; 0x02097B78
	push {r3, r4, r5, lr}
	mov r2, #2
	add r5, r0, #0
	mov r0, #3
	mov r1, #0x99
	lsl r2, r2, #0x12
	bl CreateHeap
	ldr r1, _02097BA8 ; =0x0000041C
	add r0, r5, #0
	mov r2, #0x99
	bl OverlayManager_CreateAndGetData
	ldr r2, _02097BA8 ; =0x0000041C
	mov r1, #0
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r5, #0
	bl OverlayManager_GetField18
	str r0, [r4]
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02097BA8: .word 0x0000041C
	thumb_func_end sub_02097B78

	thumb_func_start sub_02097BAC
sub_02097BAC: ; 0x02097BAC
	push {r3, lr}
	bl OverlayManager_GetData
	ldr r1, [r0]
	add r1, #0x4c
	ldrh r1, [r1]
	lsl r2, r1, #2
	ldr r1, _02097BCC ; =_02108F38
	ldr r1, [r1, r2]
	blx r1
	cmp r0, #0
	bne _02097BC8
	mov r0, #1
	pop {r3, pc}
_02097BC8:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_02097BCC: .word _02108F38
	thumb_func_end sub_02097BAC

	thumb_func_start sub_02097BD0
sub_02097BD0: ; 0x02097BD0
	push {r3, lr}
	bl OverlayManager_FreeData
	mov r0, #0x99
	bl DestroyHeap
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02097BD0

	thumb_func_start sub_02097BE0
sub_02097BE0: ; 0x02097BE0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r7, r1, #0
	mov r0, #0xb
	mov r1, #0x54
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	ldr r3, [r5, #0x48]
	add r6, r4, #0
	mov r2, #9
_02097BF6:
	ldmia r3!, {r0, r1}
	stmia r6!, {r0, r1}
	sub r2, r2, #1
	bne _02097BF6
	str r7, [r4, #0x48]
	mov r0, #0
	str r0, [r4, #0x50]
	add r0, r5, #0
	bl Field_GetTImeOfDay
	cmp r0, #4
	bhi _02097C36
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02097C1A: ; jump table
	.short _02097C24 - _02097C1A - 2 ; case 0
	.short _02097C24 - _02097C1A - 2 ; case 1
	.short _02097C2A - _02097C1A - 2 ; case 2
	.short _02097C30 - _02097C1A - 2 ; case 3
	.short _02097C30 - _02097C1A - 2 ; case 4
_02097C24:
	mov r0, #0
	str r0, [r4, #0x4c]
	b _02097C3E
_02097C2A:
	mov r0, #1
	str r0, [r4, #0x4c]
	b _02097C3E
_02097C30:
	mov r0, #2
	str r0, [r4, #0x4c]
	b _02097C3E
_02097C36:
	bl GF_AssertFail
	mov r0, #1
	str r0, [r4, #0x4c]
_02097C3E:
	ldr r0, [r5, #0x10]
	ldr r1, _02097C4C ; =sub_02097C50
	add r2, r4, #0
	bl QueueTask
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02097C4C: .word sub_02097C50
	thumb_func_end sub_02097BE0

	thumb_func_start sub_02097C50
sub_02097C50: ; 0x02097C50
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl TaskManager_GetSys
	add r6, r0, #0
	add r0, r5, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldr r1, [r4, #0x50]
	cmp r1, #3
	bhi _02097CB0
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02097C74: ; jump table
	.short _02097C7C - _02097C74 - 2 ; case 0
	.short _02097C8A - _02097C74 - 2 ; case 1
	.short _02097C9A - _02097C74 - 2 ; case 2
	.short _02097CA8 - _02097C74 - 2 ; case 3
_02097C7C:
	add r0, r5, #0
	bl sub_0205525C
	ldr r0, [r4, #0x50]
	add r0, r0, #1
	str r0, [r4, #0x50]
	b _02097CB0
_02097C8A:
	add r0, r6, #0
	add r1, r4, #0
	bl sub_02097CB4
	ldr r0, [r4, #0x50]
	add r0, r0, #1
	str r0, [r4, #0x50]
	b _02097CB0
_02097C9A:
	add r0, r5, #0
	bl sub_020552A4
	ldr r0, [r4, #0x50]
	add r0, r0, #1
	str r0, [r4, #0x50]
	b _02097CB0
_02097CA8:
	bl FreeToHeap
	mov r0, #1
	pop {r4, r5, r6, pc}
_02097CB0:
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02097C50

	thumb_func_start sub_02097CB4
sub_02097CB4: ; 0x02097CB4
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r5, r1, #0
	mov r0, #0xb
	mov r1, #0xc
	bl AllocFromHeapAtEnd
	add r2, r0, #0
	str r5, [r2]
	mov r0, #0
	str r0, [r2, #8]
	ldr r0, [r4, #0x10]
	ldr r1, _02097CD4 ; =sub_02097CD8
	bl QueueTask
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02097CD4: .word sub_02097CD8
	thumb_func_end sub_02097CB4

	thumb_func_start sub_02097CD8
sub_02097CD8: ; 0x02097CD8
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl TaskManager_GetSys
	add r5, r0, #0
	add r0, r4, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldr r0, [r4, #8]
	ldr r1, [r4]
	cmp r0, #0
	beq _02097CFC
	cmp r0, #1
	beq _02097D14
	cmp r0, #2
	beq _02097D26
	b _02097D36
_02097CFC:
	mov r0, #0xb
	str r0, [sp]
	ldr r2, [r1, #0x48]
	ldr r3, [r1, #0x4c]
	add r0, r5, #0
	bl sub_0203FCB8
	str r0, [r4, #4]
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02097D36
_02097D14:
	add r0, r5, #0
	bl FieldSys_ApplicationIsRunning
	cmp r0, #0
	bne _02097D36
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02097D36
_02097D26:
	ldr r0, [r4, #4]
	bl FreeToHeap
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #1
	pop {r3, r4, r5, pc}
_02097D36:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02097CD8

	thumb_func_start sub_02097D3C
sub_02097D3C: ; 0x02097D3C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #0xb
	mov r1, #8
	add r7, r2, #0
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	mov r0, #0
	str r0, [r4]
	mov r0, #0xb
	mov r1, #8
	bl AllocFromHeapAtEnd
	str r0, [r4, #4]
	add r0, r5, #0
	bl ScriptEnvironment_GetSav2Ptr
	ldr r1, [r4, #4]
	add r2, r4, #0
	str r0, [r1, #4]
	ldr r0, [r4, #4]
	ldr r1, _02097D7C ; =sub_02097D80
	strh r6, [r0]
	ldr r0, [r4, #4]
	strh r7, [r0, #2]
	ldr r0, [r5, #0x10]
	bl QueueTask
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02097D7C: .word sub_02097D80
	thumb_func_end sub_02097D3C

	thumb_func_start sub_02097D80
sub_02097D80: ; 0x02097D80
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r0, #0
	bl TaskManager_GetSys
	add r5, r0, #0
	add r0, r4, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #4
	bhi _02097E46
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02097DA6: ; jump table
	.short _02097DB0 - _02097DA6 - 2 ; case 0
	.short _02097DD0 - _02097DA6 - 2 ; case 1
	.short _02097DEC - _02097DA6 - 2 ; case 2
	.short _02097E04 - _02097DA6 - 2 ; case 3
	.short _02097E2C - _02097DA6 - 2 ; case 4
_02097DB0:
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl sub_0200FA24
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02097E46
_02097DD0:
	bl sub_0200FB5C
	cmp r0, #0
	beq _02097E46
	ldr r1, [r4, #4]
	add r0, r5, #0
	bl sub_0203FD08
	bl sub_0203E30C
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02097E46
_02097DEC:
	add r0, r5, #0
	bl FieldSys_ApplicationIsRunning
	cmp r0, #0
	bne _02097E46
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	add r0, r5, #0
	bl sub_020505C0
	b _02097E46
_02097E04:
	add r0, r5, #0
	bl sub_020505C8
	cmp r0, #0
	beq _02097E46
	mov r0, #6
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0
	add r2, r1, #0
	add r3, r0, #0
	bl sub_0200FA24
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02097E46
_02097E2C:
	bl sub_0200FB5C
	cmp r0, #0
	beq _02097E46
	ldr r0, [r4, #4]
	bl FreeToHeap
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, pc}
_02097E46:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end sub_02097D80

	thumb_func_start sub_02097E4C
sub_02097E4C: ; 0x02097E4C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	mov r1, #0xbb
	mov r2, #0
	add r5, r0, #0
	bl GetMonData
	add r2, sp, #0
	mov r1, #0
	strb r0, [r2]
	ldrsb r0, [r2, r1]
	add r2, r0, r4
	cmp r2, #0x7f
	ble _02097E6C
	mov r2, #0x7f
	b _02097E78
_02097E6C:
	add r0, r1, #0
	sub r0, #0x7f
	cmp r2, r0
	bge _02097E78
	add r2, r1, #0
	sub r2, #0x7f
_02097E78:
	add r0, sp, #0
	strb r2, [r0]
	add r0, r5, #0
	mov r1, #0xbb
	add r2, sp, #0
	bl SetMonData
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02097E4C

	thumb_func_start sub_02097E88
sub_02097E88: ; 0x02097E88
	sub r0, #0x22
	mov r1, #0
	cmp r0, #0x1c
	bhi _02097EF0
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02097E9C: ; jump table
	.short _02097EDA - _02097E9C - 2 ; case 0
	.short _02097EDE - _02097E9C - 2 ; case 1
	.short _02097EE2 - _02097E9C - 2 ; case 2
	.short _02097EE6 - _02097E9C - 2 ; case 3
	.short _02097EF0 - _02097E9C - 2 ; case 4
	.short _02097EF0 - _02097E9C - 2 ; case 5
	.short _02097EF0 - _02097E9C - 2 ; case 6
	.short _02097EF0 - _02097E9C - 2 ; case 7
	.short _02097EF0 - _02097E9C - 2 ; case 8
	.short _02097EF0 - _02097E9C - 2 ; case 9
	.short _02097EF0 - _02097E9C - 2 ; case 10
	.short _02097EEA - _02097E9C - 2 ; case 11
	.short _02097EEA - _02097E9C - 2 ; case 12
	.short _02097EEA - _02097E9C - 2 ; case 13
	.short _02097EEA - _02097E9C - 2 ; case 14
	.short _02097EEA - _02097E9C - 2 ; case 15
	.short _02097ED6 - _02097E9C - 2 ; case 16
	.short _02097EF0 - _02097E9C - 2 ; case 17
	.short _02097EEA - _02097E9C - 2 ; case 18
	.short _02097EF0 - _02097E9C - 2 ; case 19
	.short _02097EF0 - _02097E9C - 2 ; case 20
	.short _02097EEE - _02097E9C - 2 ; case 21
	.short _02097EEE - _02097E9C - 2 ; case 22
	.short _02097EEE - _02097E9C - 2 ; case 23
	.short _02097EEE - _02097E9C - 2 ; case 24
	.short _02097EEE - _02097E9C - 2 ; case 25
	.short _02097EEE - _02097E9C - 2 ; case 26
	.short _02097EEE - _02097E9C - 2 ; case 27
	.short _02097EEE - _02097E9C - 2 ; case 28
_02097ED6:
	mov r1, #0x28
	b _02097EF0
_02097EDA:
	sub r1, #0x14
	b _02097EF0
_02097EDE:
	sub r1, #0x1e
	b _02097EF0
_02097EE2:
	sub r1, #0x14
	b _02097EF0
_02097EE6:
	sub r1, #0x28
	b _02097EF0
_02097EEA:
	mov r1, #8
	b _02097EF0
_02097EEE:
	mov r1, #0xa
_02097EF0:
	add r0, r1, #0
	bx lr
	thumb_func_end sub_02097E88

	thumb_func_start sub_02097EF4
sub_02097EF4: ; 0x02097EF4
	push {r4, lr}
	add r4, r0, #0
	add r0, r1, #0
	bl sub_02097E88
	add r1, r0, #0
	beq _02097F08
	add r0, r4, #0
	bl sub_02097E4C
_02097F08:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02097EF4

	thumb_func_start sub_02097F0C
sub_02097F0C: ; 0x02097F0C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	mov r1, #0xae
	mov r2, #0
	add r5, r0, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	beq _02097F60
	ldr r0, _02097F64 ; =0x000001EE
	cmp r1, r0
	beq _02097F60
	add r0, r5, #0
	mov r1, #0xbb
	mov r2, #0
	bl GetMonData
	add r1, sp, #0
	strb r0, [r1]
	mov r0, #0
	ldrsb r2, [r1, r0]
	ldr r1, _02097F68 ; =_02108F44
	ldrsb r1, [r1, r4]
	add r2, r2, r1
	add r1, r0, #0
	sub r1, #0x7f
	cmp r2, r1
	bge _02097F4C
	add r2, r0, #0
	sub r2, #0x7f
	b _02097F52
_02097F4C:
	cmp r2, #0x7f
	ble _02097F52
	mov r2, #0x7f
_02097F52:
	add r0, sp, #0
	strb r2, [r0]
	add r0, r5, #0
	mov r1, #0xbb
	add r2, sp, #0
	bl SetMonData
_02097F60:
	pop {r3, r4, r5, pc}
	nop
_02097F64: .word 0x000001EE
_02097F68: .word _02108F44
	thumb_func_end sub_02097F0C

	thumb_func_start sub_02097F6C
sub_02097F6C: ; 0x02097F6C
	push {r3, r4, r5, lr}
	add r5, r1, #0
	mov r1, #0x14
	add r4, r2, #0
	bl _u32_div_f
	lsl r0, r1, #0x18
	lsr r1, r0, #0x16
	ldr r0, _02097F94 ; =_02108F4C
	ldrh r0, [r0, r1]
	cmp r5, r0
	bne _02097F90
	ldr r0, _02097F98 ; =_02108F4C + 2
	ldrh r0, [r0, r1]
	cmp r4, r0
	bne _02097F90
	mov r0, #1
	pop {r3, r4, r5, pc}
_02097F90:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02097F94: .word _02108F4C
_02097F98: .word _02108F4C + 2
	thumb_func_end sub_02097F6C

	thumb_func_start sub_02097F9C
sub_02097F9C: ; 0x02097F9C
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc4
	add r6, r1, #0
	mov r1, #0x14
	add r5, r2, #0
	bl _u32_div_f
	ldr r2, _02097FF0 ; =_02108F4C
	lsl r1, r1, #2
	add r4, r2, r1
	ldrh r1, [r2, r1]
	add r0, sp, #0
	bl WildEncounters_ReadFromNarc
	ldrh r0, [r4, #2]
	cmp r0, #0
	beq _02097FD8
	cmp r0, #1
	beq _02097FC8
	cmp r0, #2
	beq _02097FD0
	b _02097FDE
_02097FC8:
	add r0, sp, #0x80
	ldrh r0, [r0, #0x3e] ; swarmSpecies[1]
	strh r0, [r5]
	b _02097FDE
_02097FD0:
	add r0, sp, #0xc0
	ldrh r0, [r0, #2] ; swarmSpecies[3]
	strh r0, [r5]
	b _02097FDE
_02097FD8:
	add r0, sp, #0x80
	ldrh r0, [r0, #0x3c] ; swarmSpecies[0]
	strh r0, [r5]
_02097FDE:
	ldrh r0, [r5]
	cmp r0, #0
	bne _02097FE8
	bl GF_AssertFail
_02097FE8:
	ldrh r0, [r4]
	strh r0, [r6]
	add sp, #0xc4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_02097FF0: .word _02108F4C
	thumb_func_end sub_02097F9C

	.rodata
_02108340:
	.byte 0x23, 0x05, 0x64, 0x24, 0x05, 0x64, 0x25, 0x05, 0x64, 0x26, 0x05, 0x64, 0x27, 0x05, 0x64, 0x28
	.byte 0x05, 0x64, 0x29, 0x05, 0x64, 0x2A, 0x05, 0x64, 0x2B, 0x05, 0x64, 0x2C, 0x05, 0x64, 0x2D, 0x05
	.byte 0x64, 0x2E, 0x05, 0x64, 0x2F, 0x05, 0x64, 0x30, 0x05, 0x64, 0x31, 0x05, 0x64, 0x32, 0x05, 0x64
	.byte 0x33, 0x05, 0x64, 0x00
_02108374:
	.byte 0x1A, 0x00, 0x84, 0x03, 0x58, 0x02, 0x4F, 0x00, 0xA0, 0x0F, 0x0E, 0x01
	.byte 0x1A, 0x00, 0x58, 0x1B, 0x58, 0x02, 0xFB, 0x00, 0x10, 0x27, 0x64, 0x00, 0x51, 0x00, 0x98, 0x3A
	.byte 0xB8, 0x0B, 0x19, 0x00, 0x38, 0x4A, 0x84, 0x03, 0x1F, 0x01, 0x30, 0x75, 0xC8, 0x00, 0x0A, 0x01
	.byte 0x40, 0x9C, 0xC8, 0x00, 0x13, 0x01, 0x50, 0xC3, 0xC8, 0x00, 0x00, 0x00
	; File boundary
_021083AC:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x02
	.byte 0x01, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_021083C8:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x02, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
_021083E4:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_02108400:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1F, 0x02, 0x01, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	; File boundary
_0210841C:
	.byte 0x06, 0x01, 0x06, 0x06
_02108420:
	.byte 0x01, 0x03, 0x03, 0x04
_02108424:
	.byte 0x01, 0x01, 0x01, 0x05
_02108428:
	.byte 0x01, 0x03, 0x03, 0x03
_0210842C:
	.byte 0x01, 0x01, 0x01, 0x01
_02108430:
	.byte 0x06, 0x05, 0x1E, 0x02
_02108434:
	.word _02108430, sub_020957B0, sub_02095838
	.word _0210842C, sub_020958C0, sub_02095920
	.word _02108428, sub_0209592C, sub_020959D8
	.word _02108420, sub_02095A34, sub_02095A78
	.word _02108424, sub_02095A7C, sub_02095AF8
	.word _0210841C, sub_02095B04, sub_02095B88
sPhoneMessageGmm:
	.short 664 ; PHONE_CONTACT_MOTHER
	.short 716 ; PHONE_CONTACT_PROF__ELM
	.short 666 ; PHONE_CONTACT_PROF__OAK
	.short 662 ; PHONE_CONTACT_ETHAN
	.short 663 ; PHONE_CONTACT_LYRA
	.short 643 ; PHONE_CONTACT_KURT
	.short 661 ; PHONE_CONTACT_DAY_C_MAN
	.short 660 ; PHONE_CONTACT_DAY_C_LADY
	.short 641 ; PHONE_CONTACT_BUENA
	.short 665 ; PHONE_CONTACT_BILL
	.short 675 ; PHONE_CONTACT_JOEY
	.short 712 ; PHONE_CONTACT_RALPH
	.short 680 ; PHONE_CONTACT_LIZ
	.short 684 ; PHONE_CONTACT_WADE
	.short 711 ; PHONE_CONTACT_ANTHONY
	.short 642 ; PHONE_CONTACT_BIKE_SHOP
	.short 706 ; PHONE_CONTACT_KENJI
	.short 644 ; PHONE_CONTACT_WHITNEY
	.short 648 ; PHONE_CONTACT_FALKNER
	.short 704 ; PHONE_CONTACT_JACK
	.short 685 ; PHONE_CONTACT_CHAD
	.short 688 ; PHONE_CONTACT_BRENT
	.short 713 ; PHONE_CONTACT_TODD
	.short 714 ; PHONE_CONTACT_ARNIE
	.short 667 ; PHONE_CONTACT_BAOBA
	.short 691 ; PHONE_CONTACT_IRWIN
	.short 645 ; PHONE_CONTACT_JANINE
	.short 649 ; PHONE_CONTACT_CLAIR
	.short 646 ; PHONE_CONTACT_ERIKA
	.short 650 ; PHONE_CONTACT_MISTY
	.short 651 ; PHONE_CONTACT_BLAINE
	.short 647 ; PHONE_CONTACT_BLUE
	.short 656 ; PHONE_CONTACT_CHUCK
	.short 657 ; PHONE_CONTACT_BROCK
	.short 658 ; PHONE_CONTACT_BUGSY
	.short 655 ; PHONE_CONTACT_SABRINA
	.short 652 ; PHONE_CONTACT_LT__SURGE
	.short 653 ; PHONE_CONTACT_MORTY
	.short 654 ; PHONE_CONTACT_JASMINE
	.short 659 ; PHONE_CONTACT_PRYCE
	.short 674 ; PHONE_CONTACT_HUEY
	.short 705 ; PHONE_CONTACT_GAVEN
	.short 677 ; PHONE_CONTACT_JAMIE
	.short 698 ; PHONE_CONTACT_REENA
	.short 696 ; PHONE_CONTACT_VANCE
	.short 708 ; PHONE_CONTACT_PARRY
	.short 672 ; PHONE_CONTACT_ERIN
	.short 690 ; PHONE_CONTACT_BEVERLY
	.short 671 ; PHONE_CONTACT_JOSE
	.short 695 ; PHONE_CONTACT_GINA
	.short 689 ; PHONE_CONTACT_ALAN
	.short 700 ; PHONE_CONTACT_DANA
	.short 693 ; PHONE_CONTACT_DEREK
	.short 694 ; PHONE_CONTACT_TULLY
	.short 669 ; PHONE_CONTACT_TIFFANY
	.short 676 ; PHONE_CONTACT_WILTON
	.short 715 ; PHONE_CONTACT_KRISE
	.short 703 ; PHONE_CONTACT_IAN
	.short 710 ; PHONE_CONTACT_WALT
	.short 670 ; PHONE_CONTACT_ALFRED
	.short 692 ; PHONE_CONTACT_DOUG
	.short 681 ; PHONE_CONTACT_ROB
	.short 697 ; PHONE_CONTACT_KYLE
	.short 687 ; PHONE_CONTACT_KYLER
	.short 702 ; PHONE_CONTACT_TIM_AND_SUE
	.short 699 ; PHONE_CONTACT_KENNY
	.short 707 ; PHONE_CONTACT_TANNER
	.short 682 ; PHONE_CONTACT_JOSH
	.short 673 ; PHONE_CONTACT_TORIN
	.short 686 ; PHONE_CONTACT_HILLARY
	.short 683 ; PHONE_CONTACT_BILLY
	.short 679 ; PHONE_CONTACT_KAY_AND_TIA
	.short 701 ; PHONE_CONTACT_REESE
	.short 709 ; PHONE_CONTACT_AIDEN
	.short 678 ; PHONE_CONTACT_ERNEST

	; File boundary
	.balign 4, 0
_02108514:
	.word SPECIES_CHIKORITA
	.word SPECIES_CYNDAQUIL
	.word SPECIES_TOTODILE
_02108520:
	.byte 0x00, 0x03, 0x03, 0x1A, 0x12, 0x01, 0x23, 0x00
_02108528:
	.byte 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00
_02108530:
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_02108540:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x06, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_0210855C:
	.byte 0x03, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

	; File boundary
_02108584:
	.word sub_020965A4, sub_02096608, sub_0209673C, 0xFFFFFFFF
_02108594:
	.word ov80_0222B140, sub_020342B8, 0
	.word ov80_0222B1A4, sub_020342B8, 0
	.word ov80_0222B24C, sub_020342B8, 0
	.word ov80_0222B334, sub_020342B8, 0
	.word ov80_0222B3D4, sub_020342B8, 0
	.word ov80_0222B420, sub_020342B8, 0
	.word ov80_0222B52C, sub_020342B8, 0
	.word ov81_02241020, sub_020342B8, 0
	.word ov81_022410C8, sub_020342B8, 0
	.word ov81_0224113C, sub_020342B8, 0
	.word ov81_02241238, sub_020342B8, 0
	.word ov80_0222AEF8, sub_020342B8, 0
	.word ov80_0222AF3C, sub_020342B8, 0
	.word ov80_0222AF84, sub_020342B8, 0
	.word ov80_0222AFEC, sub_020342B8, 0
	.word ov80_0222B048, sub_020342B8, 0
	.word ov80_0222B0B8, sub_020342B8, ov80_0222B0E8
	.word ov82_0223F764, sub_020342B8, 0
	.word ov82_0223F7B4, sub_020342B8, 0
	.word ov82_0223F814, sub_020342B8, 0
	.word ov80_0222B628, sub_020342B8, 0
	.word ov80_0222B690, sub_020342B8, 0
	.word ov80_0222B740, sub_020342B8, 0
	.word ov80_0222B860, sub_020342B8, 0
	.word ov80_0222B8F8, sub_020342B8, 0
	.word ov80_0222B940, sub_020342B8, 0
	.word ov80_0222B9CC, sub_020342B8, ov80_0222BA5C
	.word ov83_0224140C, sub_020342B8, 0
	.word ov83_02241474, sub_020342B8, 0
	.word ov83_022414DC, sub_020342B8, 0
	.word ov83_02241510, sub_020342B8, 0
	.word ov83_0224514C, sub_020342B8, 0
	.word ov83_022451B8, sub_020342B8, 0
	.word ov83_02245220, sub_020342B8, 0
	.word ov83_02245254, sub_020342B8, 0
	.word sub_02096A7C, sub_020342B8, 0
	.word sub_02096ACC, sub_020342B8, 0
	.word sub_02096BB8, sub_020342B8, 0
	.word sub_02096C18, sub_020342B8, 0
	.word sub_02096C60, sub_020342B8, 0
	.word sub_02096924, sub_020342B8, 0
	.word sub_020969C4, sub_020342B8, 0
	.word sub_020969F8, sub_020342B8, 0
	.word ov80_0222BAB0, sub_020342B8, 0
	.word ov80_0222BB18, sub_020342B8, 0
	.word ov80_0222BBD0, sub_020342B8, 0
	.word ov80_0222BC6C, sub_020342B8, 0
	.word ov80_0222BCB8, sub_020342B8, 0
	.word ov80_0222BD44, sub_020342B8, ov80_0222BDD4
	.word ov84_0223ED34, sub_020342B8, 0
	.word ov84_0223EDA8, sub_020342B8, 0
	.word ov84_0223EE08, sub_020342B8, 0

	; File boundary
_02108804:
	.word sub_02096ED0
	.word sub_02096DE4
	.word sub_02096DF4
	.word sub_02096EF0
	.word sub_02096F0C
	.word sub_02096DBC
	.word sub_02096DB4
	.word sub_02096DA8
	.word sub_02096F2C
	.word sub_02096F3C
	.word sub_02096F70
	.word sub_02096F80
	.word sub_02096F50
	.word sub_02096F60
	.word sub_02096F9C
	.word sub_02096FAC
	.word sub_02096FBC
	.word sub_02096FD0
_0210884C:
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02096D60, sub_02096FE4, 0
	.word sub_02096D80, sub_02096FE8, sub_02096FF0
	; 02108D74
	.word 0, 0, 0
	.word 0, 0, 0
	.word 0, 0, 0
	.word 0, 0, 0
	.word 0, 0, 0
	.word 0, 0, 0
	.word 0, 0, 0
	.word 0, 0, 0
	.word 0, 0, 0
	.word 0, 0, 0
	.word 0, 0, 0
	.word 0, 0, 0
	.word 0, 0, 0
	.word 0, 0, 0
	.word 0, 0, 0
	.word 0, 0, 0
	.word 0, 0, 0
	.word 0, 0, 0
	.word 0, 0, 0
	.word 0, 0, 0
	.word 0, 0, 0
	.word 0, 0, 0
	.word 0, 0, 0
	.word 0, 0, 0
	.word 0, 0, 0

	; File boundary
_02108EA0:
	.word ov85_021E88AC, ov85_021E8A08, ov85_021E8B08, SDK_OVERLAY_OVY_85_ID
_02108EB0:
	.word ov85_021E5900, ov85_021E5AAC, ov85_021E5A34, SDK_OVERLAY_OVY_85_ID
_02108EC0:
	.word sub_020970E4
	.word sub_02097108
	.word sub_02097148
	.word sub_020971AC
	.word sub_020971D4
	.word sub_020971EC

	; File boundary
_02108ED8:
	.byte 0xFF, 0xFF
_02108EDA:
	.byte 0x01, 0x05, 0x0A, 0x0F, 0x14
	.byte 0x02, 0x06, 0x0B, 0x10, 0x15
	.byte 0x03, 0x07, 0x0C, 0x11, 0x16
	.byte 0x04, 0x08, 0x0D, 0x12, 0x17
_02108EEE:
	.byte 0xBD, 0x12, 0x01
	.byte 0xBE, 0x12, 0x01
	.byte 0xBF, 0x12, 0x01
	.byte 0xC0, 0x24, 0x02
	.byte 0xC1, 0x24, 0x02
	.byte 0xC2, 0x24, 0x02
	.byte 0xC3, 0x12, 0x03
	.byte 0xC4, 0x24, 0x03
	.byte 0xC5, 0x24, 0x03
	.byte 0xC6, 0x24, 0x04
	.byte 0xC7, 0x25, 0x04
	.byte 0xC8, 0x24, 0x04
	.byte 0xC9, 0x14, 0x00
	.byte 0xCA, 0x12, 0x00
	.byte 0xCB, 0x12, 0x00
	.byte 0xCC, 0x14, 0x00
	.byte 0xCD, 0x22, 0x00
	.byte 0xCE, 0x12, 0x00
	.byte 0xCF, 0x92, 0x00
	.byte 0xD1, 0x92, 0x00
	.byte 0xD3, 0x12, 0x00
	.byte 0xD4, 0x12, 0x00
	.byte 0xD5, 0x12, 0x00
	.byte 0xD6, 0x12, 0x00

	; File boundary
	.balign 4, 0
_02108F38:
	.word ScriptCinematic_HoOh
	.word ScriptCinematic_Lugia
	.word ScriptCinematic_Arceus

	; File boundary
_02108F44:
	.byte 0x28, 0x08, 0x32, 0x28, 0xB0, 0xCE, 0x9C, 0x1E
_02108F4C:
	.short MAP_R01, 0x0000
	.short MAP_R03, 0x0000
	.short MAP_R09, 0x0000
	.short MAP_R12, 0x0002
	.short MAP_R13, 0x0000
	.short MAP_W19, 0x0001
	.short MAP_R32, 0x0002
	.short MAP_R25, 0x0000
	.short MAP_R27, 0x0001
	.short MAP_R34, 0x0000
	.short MAP_R35, 0x0000
	.short MAP_R38, 0x0000
	.short MAP_R44, 0x0002
	.short MAP_R45, 0x0000
	.short MAP_R47, 0x0000
	.short MAP_D38R0101, 0x0000
	.short MAP_D42R0102, 0x0000
	.short MAP_D46R0101, 0x0000
	.short MAP_T06, 0x0001
	.short MAP_T22, 0x0002

	.data

_021105C8:
	.asciz "tel/pmtel_book.dat"
