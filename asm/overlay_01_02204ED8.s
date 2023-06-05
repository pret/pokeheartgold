#include "constants/sndseq.h"
#include "constants/moves.h"
#include "constants/std_script.h"
#include "constants/species.h"
#include "constants/sprites.h"
#include "constants/maps.h"
#include "constants/mmodel.h"
#include "constants/items.h"
#include "msgdata/msg/msg_0096_D31R0201.h"
#include "msgdata/msg/msg_0066_D23R0102.h"
	.include "asm/macros.inc"
	.include "overlay_01_02204ED8.inc"
	.include "global.inc"

	.text

	thumb_func_start ov01_02204ED8
ov01_02204ED8: ; 0x02204ED8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #0xb
	mov r1, #4
	bl AllocFromHeapAtEnd
	add r2, r0, #0
	str r4, [r2]
	mov r0, #0
	strh r0, [r4]
	ldr r0, [r5, #0x10]
	ldr r1, _02204EF8 ; =ov01_02204EFC
	bl TaskManager_Call
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02204EF8: .word ov01_02204EFC
	thumb_func_end ov01_02204ED8

	thumb_func_start ov01_02204EFC
ov01_02204EFC: ; 0x02204EFC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r7, r0, #0
	bl TaskManager_GetSys
	add r5, r0, #0
	add r0, r7, #0
	bl TaskManager_GetEnv
	ldr r1, [r5, #0x20]
	add r6, r0, #0
	ldr r1, [r1]
	mov r0, #0xfe
	mov r2, #0xb
	bl AllocAtEndAndReadWholeNarcMemberByIdPair
	add r4, r0, #0
	ldrh r0, [r4]
	cmp r0, #0
	bne _02204F2A
	ldrh r0, [r4, #2]
	cmp r0, #0
	beq _02204FCE
_02204F2A:
	add r0, r5, #0
	add r1, sp, #0xc
	add r2, sp, #8
	bl ov01_022050F8
	ldr r0, [r5, #0xc]
	bl Save_PlayerData_GetProfileAddr
	bl PlayerProfile_GetTrainerID
	add r2, r0, #0
	ldr r0, [sp, #8]
	str r0, [sp]
	add r0, r4, #0
	add r0, #0x4c
	str r0, [sp, #4]
	ldrh r0, [r4]
	ldrh r1, [r4, #2]
	ldr r3, [sp, #0xc]
	bl ov01_02204FE0
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _02204F6E
	add r0, r4, #0
	bl FreeToHeap
	add r0, r6, #0
	bl FreeToHeap
	add sp, #0x14
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_02204F6E:
	cmp r0, #0
	bne _02204F76
	add r2, r4, #4
	b _02204FA0
_02204F76:
	cmp r0, #1
	bne _02204F80
	add r2, r4, #0
	add r2, #0x1c
	b _02204FA0
_02204F80:
	cmp r0, #2
	bne _02204F8A
	add r2, r4, #0
	add r2, #0x34
	b _02204FA0
_02204F8A:
	bl GF_AssertFail
	add r0, r4, #0
	bl FreeToHeap
	add r0, r6, #0
	bl FreeToHeap
	add sp, #0x14
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_02204FA0:
	add r0, r5, #0
	add r1, sp, #0x10
	bl ov02_02247374
	cmp r0, #0
	beq _02204FCE
	ldr r0, [r6]
	mov r1, #1
	strh r1, [r0]
	add r0, r4, #0
	bl FreeToHeap
	add r0, r6, #0
	bl FreeToHeap
	ldr r2, [sp, #0x10]
	add r0, r5, #0
	add r1, r7, #0
	bl sub_02050B90
	add sp, #0x14
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_02204FCE:
	add r0, r4, #0
	bl FreeToHeap
	add r0, r6, #0
	bl FreeToHeap
	mov r0, #1
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov01_02204EFC

	thumb_func_start ov01_02204FE0
ov01_02204FE0: ; 0x02204FE0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r0, [sp]
	add r0, r1, #0
	ldr r1, [sp]
	mov r5, #6
	add r6, r1, #0
	mul r6, r5
	mul r5, r0
	lsl r1, r6, #0x10
	lsl r0, r5, #0x10
	lsr r0, r0, #0x10
	str r2, [sp, #4]
	add r4, r3, #0
	mov ip, r0
	lsr r1, r1, #0x10
	mov r0, #0
	ldr r3, [sp, #0x20]
	ldr r2, [sp, #0x24]
	cmp r1, #0
	bls _02205040
	mov r7, #2
_0220500C:
	lsl r5, r0, #2
	add r6, r2, r5
	ldrsh r5, [r2, r5]
	cmp r4, r5
	bne _02205036
	ldrsh r5, [r6, r7]
	cmp r3, r5
	bne _02205036
	mov r1, #6
	bl _s32_div_f
	ldr r1, [sp]
	lsl r0, r0, #0x18
	lsl r1, r1, #0x18
	ldr r2, [sp, #4]
	lsr r0, r0, #0x18
	lsr r1, r1, #0x18
	bl ov01_02205074
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_02205036:
	add r0, r0, #1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	cmp r0, r1
	blo _0220500C
_02205040:
	mov r0, ip
	add r5, r1, r0
	cmp r1, r5
	bge _0220506A
	mov r6, #2
_0220504A:
	lsl r7, r1, #2
	add r0, r2, r7
	ldrsh r7, [r2, r7]
	cmp r4, r7
	bne _02205060
	ldrsh r0, [r0, r6]
	cmp r3, r0
	bne _02205060
	add sp, #8
	mov r0, #2
	pop {r3, r4, r5, r6, r7, pc}
_02205060:
	add r0, r1, #1
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	cmp r1, r5
	blt _0220504A
_0220506A:
	mov r0, #0
	mvn r0, r0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_02204FE0

	thumb_func_start ov01_02205074
ov01_02205074: ; 0x02205074
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r5, r1, #0
	mov r7, #0
	add r0, r2, #0
	mov r1, #0xa
	mvn r7, r7
	bl _u32_div_f
	lsl r0, r1, #0x18
	lsr r4, r0, #0x18
	cmp r5, #5
	blo _022050A6
	add r0, r6, #0
	mov r1, #5
	bl _s32_div_f
	lsl r0, r4, #2
	add r3, r4, r0
	lsl r0, r1, #0x18
	ldr r2, _022050E4 ; =ov01_0220969A
	lsr r1, r0, #0x18
	add r0, r2, r3
	ldrsb r7, [r1, r0]
	b _022050E0
_022050A6:
	cmp r5, #4
	bne _022050B4
	ldr r0, _022050E8 ; =ov01_02209672
	lsl r1, r4, #2
	add r0, r0, r1
	ldrsb r7, [r6, r0]
	b _022050E0
_022050B4:
	cmp r5, #3
	bne _022050C4
	lsl r0, r4, #1
	add r1, r4, r0
	ldr r0, _022050EC ; =ov01_02209654
	add r0, r0, r1
	ldrsb r7, [r6, r0]
	b _022050E0
_022050C4:
	cmp r5, #2
	bne _022050D2
	ldr r0, _022050F0 ; =ov01_02209640
	lsl r1, r4, #1
	add r0, r0, r1
	ldrsb r7, [r6, r0]
	b _022050E0
_022050D2:
	cmp r5, #1
	bne _022050DC
	ldr r0, _022050F4 ; =ov01_02209634
	ldrsb r7, [r0, r4]
	b _022050E0
_022050DC:
	bl GF_AssertFail
_022050E0:
	add r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022050E4: .word ov01_0220969A
_022050E8: .word ov01_02209672
_022050EC: .word ov01_02209654
_022050F0: .word ov01_02209640
_022050F4: .word ov01_02209634
	thumb_func_end ov01_02205074

	thumb_func_start ov01_022050F8
ov01_022050F8: ; 0x022050F8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldr r0, [r4, #0x40]
	add r6, r1, #0
	str r2, [sp]
	add r1, sp, #8
	add r2, sp, #4
	bl PlayerAvatar_GetCoordsInFront
	add r0, r4, #0
	bl FollowingPokemon_IsActive
	cmp r0, #0
	beq _02205156
	add r0, r4, #0
	bl FollowingPokemon_GetMapObject
	add r7, r0, #0
	bl MapObject_GetCurrentX
	add r5, r0, #0
	add r0, r7, #0
	bl MapObject_GetCurrentY
	add r4, r0, #0
	ldr r0, [sp, #8]
	cmp r0, r5
	bne _02205156
	ldr r0, [sp, #4]
	cmp r0, r4
	bne _02205156
	add r0, r7, #0
	bl MapObject_GetFacingDirection
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
	add r0, r7, #0
	bl GetDeltaXByFacingDirection
	add r0, r5, r0
	str r0, [sp, #8]
	add r0, r7, #0
	bl GetDeltaYByFacingDirection
	add r0, r4, r0
	str r0, [sp, #4]
_02205156:
	ldr r0, [sp, #8]
	str r0, [r6]
	ldr r1, [sp, #4]
	ldr r0, [sp]
	str r1, [r0]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov01_022050F8

	thumb_func_start ScrCmd_795
ScrCmd_795: ; 0x02205164
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x80
	ldr r5, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r5, #0
	mov r1, #0x28
	bl FieldSysGetAttrAddr
	lsl r1, r6, #0x18
	lsl r2, r7, #0x18
	add r4, #0x80
	add r5, r0, #0
	ldr r0, [r4]
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
	bl ov01_021EED60
	str r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ScrCmd_795

	thumb_func_start ScrCmd_796
ScrCmd_796: ; 0x022051B4
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x28
	bl FieldSysGetAttrAddr
	ldr r0, [r0]
	bl ov01_021EEE30
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_796

	thumb_func_start ScrCmd_797
ScrCmd_797: ; 0x022051CC
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x28
	bl FieldSysGetAttrAddr
	add r1, r0, #0
	add r4, #0x80
	ldr r0, [r4]
	ldr r1, [r1]
	bl ov01_021EEE44
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_797

	.rodata

	; file boundary?

ov01_02209634: ; 0x02209634
	.byte 0x00, 0x01, 0x00, 0x01, 0x00, 0x01, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00

ov01_02209640: ; 0x02209640
	.byte 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00
	.byte 0x00, 0x01, 0x01, 0x00

ov01_02209654: ; 0x02209654
	.byte 0x00, 0x01, 0xFF, 0x00, 0xFF, 0x01, 0x01, 0x00, 0xFF, 0x01, 0xFF, 0x00
	.byte 0xFF, 0x00, 0x01, 0xFF, 0x01, 0x00, 0x00, 0x01, 0xFF, 0x00, 0xFF, 0x01, 0x01, 0x00, 0xFF, 0x01
	.byte 0xFF, 0x00

ov01_02209672: ; 0x02209672
	.byte 0xFF, 0x00, 0x00, 0x01, 0x01, 0xFF, 0x00, 0x00, 0x01, 0x01, 0xFF, 0x00, 0x00, 0x01
	.byte 0x01, 0xFF, 0x00, 0x00, 0x01, 0x01, 0xFF, 0x00, 0x01, 0x00, 0x01, 0xFF, 0x00, 0x01, 0x00, 0x01
	.byte 0xFF, 0x00, 0x01, 0x00, 0x01, 0xFF, 0x00, 0x01, 0x00, 0x01

ov01_0220969A: ; 0x0220969A
	.byte 0xFF, 0x00, 0x00, 0x01, 0x01, 0x01
	.byte 0xFF, 0x00, 0x00, 0x01, 0x01, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x01, 0x01, 0xFF, 0x00, 0x00, 0x00
	.byte 0x01, 0x01, 0xFF, 0xFF, 0x00, 0x01, 0x00, 0x01, 0x01, 0xFF, 0x00, 0x01, 0x00, 0x00, 0x01, 0xFF
	.byte 0x00, 0x01, 0x01, 0x00, 0x01, 0xFF, 0x00, 0x00, 0x01, 0x00, 0x01, 0xFF
