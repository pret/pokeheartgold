#include "constants/sndseq.h"
#include "constants/species.h"
#include "constants/maps.h"
#include "constants/pokemon.h"
#include "constants/flags.h"
#include "constants/vars.h"
#include "constants/items.h"
#include "constants/std_script.h"
#include "fielddata/script/scr_seq/event_D24R0204.h"
#include "constants/party_menu.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.data

_0210FACC:
	.word _020FDA84
	.word _020FDAC4
	.word _020FDB04

	.text

	thumb_func_start MapObject_AreBitsSetForMovementScriptInit
MapObject_AreBitsSetForMovementScriptInit: ; 0x02062108
	push {r4, lr}
	mov r1, #1
	add r4, r0, #0
	bl MapObject_TestBits
	cmp r0, #0
	bne _0206211A
	mov r0, #0
	pop {r4, pc}
_0206211A:
	add r0, r4, #0
	mov r1, #2
	bl MapObject_TestBits
	cmp r0, #1
	bne _0206212A
	mov r0, #0
	pop {r4, pc}
_0206212A:
	add r0, r4, #0
	mov r1, #0x10
	bl MapObject_TestBits
	cmp r0, #1
	bne _02062146
	add r0, r4, #0
	mov r1, #0x20
	bl MapObject_TestBits
	cmp r0, #0
	bne _02062146
	mov r0, #0
	pop {r4, pc}
_02062146:
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end MapObject_AreBitsSetForMovementScriptInit

	thumb_func_start MapObject_SetHeldMovement
MapObject_SetHeldMovement: ; 0x0206214C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #0x71
	blt _0206215A
	bl GF_AssertFail
_0206215A:
	add r0, r5, #0
	add r1, r4, #0
	bl MapObject_SetMovementCommand
	add r0, r5, #0
	mov r1, #0
	bl MapObject_SetMovementStep
	add r0, r5, #0
	mov r1, #0x10
	bl MapObject_SetBits
	add r0, r5, #0
	mov r1, #0x20
	bl MapObject_ClearBits
	pop {r3, r4, r5, pc}
	thumb_func_end MapObject_SetHeldMovement

	thumb_func_start MapObject_ForceSetHeldMovement
MapObject_ForceSetHeldMovement: ; 0x0206217C
	push {r4, lr}
	add r4, r0, #0
	bl MapObject_SetMovementCommand
	add r0, r4, #0
	mov r1, #0
	bl MapObject_SetMovementStep
	add r0, r4, #0
	mov r1, #0x20
	bl MapObject_ClearBits
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end MapObject_ForceSetHeldMovement

	thumb_func_start MapObject_IsMovementPaused
MapObject_IsMovementPaused: ; 0x02062198
	push {r4, lr}
	mov r1, #0x10
	add r4, r0, #0
	bl MapObject_TestBits
	cmp r0, #0
	bne _020621AA
	mov r0, #1
	pop {r4, pc}
_020621AA:
	add r0, r4, #0
	mov r1, #0x20
	bl MapObject_TestBits
	cmp r0, #0
	beq _020621BA
	mov r0, #1
	pop {r4, pc}
_020621BA:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end MapObject_IsMovementPaused

	thumb_func_start MapObject_ClearHeldMovementIfActive
MapObject_ClearHeldMovementIfActive: ; 0x020621C0
	push {r4, lr}
	mov r1, #0x10
	add r4, r0, #0
	bl MapObject_TestBits
	cmp r0, #0
	bne _020621D2
	mov r0, #1
	pop {r4, pc}
_020621D2:
	add r0, r4, #0
	mov r1, #0x20
	bl MapObject_TestBits
	cmp r0, #0
	bne _020621E2
	mov r0, #0
	pop {r4, pc}
_020621E2:
	add r0, r4, #0
	mov r1, #0x30
	bl MapObject_ClearBits
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end MapObject_ClearHeldMovementIfActive

	thumb_func_start MapObject_ClearHeldMovement
MapObject_ClearHeldMovement: ; 0x020621F0
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0x10
	bl MapObject_ClearBits
	add r0, r4, #0
	mov r1, #0x20
	bl MapObject_SetBits
	add r0, r4, #0
	mov r1, #0xff
	bl MapObject_SetMovementCommand
	add r0, r4, #0
	mov r1, #0
	bl MapObject_SetMovementStep
	pop {r4, pc}
	thumb_func_end MapObject_ClearHeldMovement

	thumb_func_start EventObjectMovementMan_Create
EventObjectMovementMan_Create: ; 0x02062214
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #4
	mov r1, #0x14
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	bne _0206222A
	bl GF_AssertFail
_0206222A:
	add r2, r4, #0
	mov r1, #0x14
	mov r0, #0
_02062230:
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _02062230
	add r0, r5, #0
	bl sub_0205F35C
	bl sub_0205F19C
	sub r2, r0, #1
	ldr r0, _0206225C ; =MovementScriptMachine
	add r1, r4, #0
	bl CreateSysTask
	add r7, r0, #0
	bne _02062254
	bl GF_AssertFail
_02062254:
	str r5, [r4, #0xc]
	str r6, [r4, #0x10]
	add r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0206225C: .word MovementScriptMachine
	thumb_func_end EventObjectMovementMan_Create

	thumb_func_start EventObjectMovementMan_IsFinish
EventObjectMovementMan_IsFinish: ; 0x02062260
	push {r3, lr}
	bl sub_0201F988
	ldr r0, [r0, #4]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end EventObjectMovementMan_IsFinish

	thumb_func_start EventObjectMovementMan_Delete
EventObjectMovementMan_Delete: ; 0x0206226C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_0201F988
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	bl MapObject_IsMovementPaused
	cmp r0, #1
	beq _02062284
	bl GF_AssertFail
_02062284:
	ldr r0, [r4, #0xc]
	bl MapObject_ClearHeldMovementIfActive
	mov r0, #4
	add r1, r4, #0
	bl FreeToHeapExplicit
	add r0, r5, #0
	bl DestroySysTask
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end EventObjectMovementMan_Delete

	thumb_func_start MovementScriptMachine
MovementScriptMachine: ; 0x0206229C
	push {r3, r4, r5, lr}
	ldr r4, _020622B4 ; =sMovementScriptMachineStateFuncs
	add r5, r1, #0
_020622A2:
	ldr r1, [r5]
	add r0, r5, #0
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	blx r1
	cmp r0, #1
	beq _020622A2
	pop {r3, r4, r5, pc}
	nop
_020622B4: .word sMovementScriptMachineStateFuncs
	thumb_func_end MovementScriptMachine

	thumb_func_start MovementScriptMachineSub_Init
MovementScriptMachineSub_Init: ; 0x020622B8
	mov r1, #0
	str r1, [r0, #8]
	mov r1, #1
	str r1, [r0]
	add r0, r1, #0
	bx lr
	thumb_func_end MovementScriptMachineSub_Init

	thumb_func_start MovementScriptMachineSub_WaitReady
MovementScriptMachineSub_WaitReady: ; 0x020622C4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	bl MapObject_AreBitsSetForMovementScriptInit
	cmp r0, #0
	bne _020622D6
	mov r0, #0
	pop {r4, pc}
_020622D6:
	mov r0, #2
	str r0, [r4]
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end MovementScriptMachineSub_WaitReady

	thumb_func_start MovementScriptMachineSub_SetMovementCommand
MovementScriptMachineSub_SetMovementCommand: ; 0x020622E0
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0x10]
	ldr r0, [r4, #0xc]
	ldrh r1, [r1]
	bl MapObject_SetHeldMovement
	mov r0, #3
	str r0, [r4]
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end MovementScriptMachineSub_SetMovementCommand

	thumb_func_start MovementScriptMachineSub_WaitMovementCommand
MovementScriptMachineSub_WaitMovementCommand: ; 0x020622F8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	bl MapObject_IsMovementPaused
	cmp r0, #0
	bne _0206230A
	mov r0, #0
	pop {r4, pc}
_0206230A:
	mov r0, #4
	str r0, [r4]
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end MovementScriptMachineSub_WaitMovementCommand

	thumb_func_start MovementScriptMachineSub_LoopCheck
MovementScriptMachineSub_LoopCheck: ; 0x02062314
	ldr r1, [r0, #8]
	ldr r3, [r0, #0x10]
	add r2, r1, #1
	str r2, [r0, #8]
	ldrh r1, [r3, #2]
	cmp r2, r1
	bge _0206232A
	mov r1, #1
	str r1, [r0]
	add r0, r1, #0
	bx lr
_0206232A:
	add r1, r3, #4
	str r1, [r0, #0x10]
	ldrh r1, [r3, #4]
	cmp r1, #0xfe ; step_end
	beq _0206233C
	mov r1, #0
	str r1, [r0]
	mov r0, #1
	bx lr
_0206233C:
	mov r1, #1
	str r1, [r0, #4]
	mov r1, #5
	str r1, [r0]
	mov r0, #0
	bx lr
	thumb_func_end MovementScriptMachineSub_LoopCheck

	thumb_func_start MovementScriptMachineSub_Done
MovementScriptMachineSub_Done: ; 0x02062348
	mov r0, #0
	bx lr
	thumb_func_end MovementScriptMachineSub_Done

	thumb_func_start sub_0206234C
sub_0206234C: ; 0x0206234C
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r4, r1, #0
	cmp r7, #4
	blt _0206235A
	bl GF_AssertFail
_0206235A:
	ldr r3, _0206238C ; =_020FD198
	ldr r6, [r3]
	cmp r6, #0
	beq _02062384
	mov r1, #0
_02062364:
	add r2, r1, #0
	add r5, r6, #0
_02062368:
	ldr r0, [r5]
	cmp r4, r0
	bne _02062374
	lsl r0, r7, #2
	ldr r0, [r6, r0]
	pop {r3, r4, r5, r6, r7, pc}
_02062374:
	add r2, r2, #1
	add r5, r5, #4
	cmp r2, #4
	blt _02062368
	add r3, r3, #4
	ldr r6, [r3]
	cmp r6, #0
	bne _02062364
_02062384:
	bl GF_AssertFail
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0206238C: .word _020FD198
	thumb_func_end sub_0206234C

	thumb_func_start sub_02062390
sub_02062390: ; 0x02062390
	push {r4, r5}
	ldr r4, _020623C4 ; =_020FD198
	ldr r5, [r4]
	cmp r5, #0
	beq _020623BA
	mov r2, #0
_0206239C:
	add r3, r2, #0
_0206239E:
	ldr r1, [r5]
	cmp r0, r1
	bne _020623AA
	add r0, r3, #0
	pop {r4, r5}
	bx lr
_020623AA:
	add r3, r3, #1
	add r5, r5, #4
	cmp r3, #4
	blt _0206239E
	add r4, r4, #4
	ldr r5, [r4]
	cmp r5, #0
	bne _0206239C
_020623BA:
	mov r0, #0
	mvn r0, r0
	pop {r4, r5}
	bx lr
	nop
_020623C4: .word _020FD198
	thumb_func_end sub_02062390

	thumb_func_start sub_020623C8
sub_020623C8: ; 0x020623C8
	sub r0, #0x38
	cmp r0, #3
	bhi _020623D2
	mov r0, #1
	bx lr
_020623D2:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end sub_020623C8

	thumb_func_start sub_020623D8
sub_020623D8: ; 0x020623D8
	push {r4, lr}
	sub sp, #0x10
	ldr r3, _020623FC ; =_020FDA28
	add r2, sp, #0
	add r4, r0, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	cmp r4, #4
	blt _020623F2
	bl GF_AssertFail
_020623F2:
	lsl r1, r4, #2
	add r0, sp, #0
	ldr r0, [r0, r1]
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
_020623FC: .word _020FDA28
	thumb_func_end sub_020623D8

	thumb_func_start sub_02062400
sub_02062400: ; 0x02062400
	push {r3, r4, r5, lr}
	add r5, r0, #0
_02062404:
	add r0, r5, #0
	bl MapObject_GetMovementCommand
	add r4, r0, #0
	cmp r4, #0xff
	beq _02062424
	add r0, r5, #0
	bl MapObject_GetMovementStep
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl MapObject_RunMovementCommand
	cmp r0, #0
	bne _02062404
_02062424:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02062400

	thumb_func_start sub_02062428
sub_02062428: ; 0x02062428
	push {r4, lr}
	add r4, r0, #0
	bl sub_02062400
	add r0, r4, #0
	mov r1, #0x20
	bl MapObject_TestBits
	cmp r0, #0
	bne _02062440
	mov r0, #0
	pop {r4, pc}
_02062440:
	add r0, r4, #0
	mov r1, #0x20
	bl MapObject_ClearBits
	add r0, r4, #0
	mov r1, #0xff
	bl MapObject_SetMovementCommand
	add r0, r4, #0
	mov r1, #0
	bl MapObject_SetMovementStep
	mov r0, #1
	pop {r4, pc}
	thumb_func_end sub_02062428

	thumb_func_start MapObject_RunMovementCommand
MapObject_RunMovementCommand: ; 0x0206245C
	push {r3, lr}
	lsl r3, r1, #2
	ldr r1, _0206246C ; =gMovementCmdTable
	ldr r3, [r1, r3]
	lsl r1, r2, #2
	ldr r1, [r3, r1]
	blx r1
	pop {r3, pc}
	.balign 4, 0
_0206246C: .word gMovementCmdTable
	thumb_func_end MapObject_RunMovementCommand

	thumb_func_start MapObjectMovementCmd098_Step2
MapObjectMovementCmd098_Step2: ; 0x02062470
	push {r3, lr}
	mov r1, #0x20
	bl MapObject_SetBits
	mov r0, #0
	pop {r3, pc}
	thumb_func_end MapObjectMovementCmd098_Step2

	thumb_func_start sub_0206247C
sub_0206247C: ; 0x0206247C
	push {r4, lr}
	add r4, r0, #0
	bl MapObject_SetFacingDirection
	add r0, r4, #0
	mov r1, #0
	bl sub_0205F328
	add r0, r4, #0
	bl sub_02060F78
	add r0, r4, #0
	bl MapObject_IncMovementStep
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0206247C

	thumb_func_start MapObjectMovementCmd000_Step0
MapObjectMovementCmd000_Step0: ; 0x0206249C
	push {r3, lr}
	mov r1, #0
	bl sub_0206247C
	mov r0, #1
	pop {r3, pc}
	thumb_func_end MapObjectMovementCmd000_Step0

	thumb_func_start MapObjectMovementCmd001_Step0
MapObjectMovementCmd001_Step0: ; 0x020624A8
	push {r3, lr}
	mov r1, #1
	bl sub_0206247C
	mov r0, #1
	pop {r3, pc}
	thumb_func_end MapObjectMovementCmd001_Step0

	thumb_func_start MapObjectMovementCmd002_Step0
MapObjectMovementCmd002_Step0: ; 0x020624B4
	push {r3, lr}
	mov r1, #2
	bl sub_0206247C
	mov r0, #1
	pop {r3, pc}
	thumb_func_end MapObjectMovementCmd002_Step0

	thumb_func_start MapObjectMovementCmd003_Step0
MapObjectMovementCmd003_Step0: ; 0x020624C0
	push {r3, lr}
	mov r1, #3
	bl sub_0206247C
	mov r0, #1
	pop {r3, pc}
	thumb_func_end MapObjectMovementCmd003_Step0

	thumb_func_start sub_020624CC
sub_020624CC: ; 0x020624CC
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	mov r1, #0xc
	add r5, r0, #0
	add r6, r2, #0
	add r7, r3, #0
	bl sub_0205F3C0
	add r1, sp, #8
	ldrh r1, [r1, #0x10]
	strh r1, [r0]
	strh r7, [r0, #2]
	str r4, [r0, #4]
	str r6, [r0, #8]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02060F24
	add r0, r5, #0
	add r1, r4, #0
	bl MapObject_SetOrQueueFacing
	add r1, sp, #8
	ldrh r1, [r1, #0x10]
	add r0, r5, #0
	bl sub_0205F328
	add r0, r5, #0
	mov r1, #4
	bl MapObject_SetBits
	add r0, r5, #0
	bl MapObject_IncMovementStep
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_020624CC

	thumb_func_start MapObjectMovementCmd090_Step1
MapObjectMovementCmd090_Step1: ; 0x02062514
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_0205F3E4
	add r4, r0, #0
	ldr r1, [r4, #4]
	ldr r2, [r4, #8]
	add r0, r5, #0
	bl sub_0206101C
	add r0, r5, #0
	bl sub_02061070
	mov r0, #2
	ldrsh r1, [r4, r0]
	sub r1, r1, #1
	strh r1, [r4, #2]
	ldrsh r0, [r4, r0]
	cmp r0, #0
	ble _02062540
	mov r0, #0
	pop {r3, r4, r5, pc}
_02062540:
	add r0, r5, #0
	mov r1, #0x28
	bl MapObject_SetBits
	add r0, r5, #0
	bl sub_02060F78
	add r0, r5, #0
	bl sub_0205F484
	add r0, r5, #0
	mov r1, #0
	bl sub_0205F328
	add r0, r5, #0
	bl MapObject_IncMovementStep
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end MapObjectMovementCmd090_Step1

	thumb_func_start MapObjectMovementCmd004_Step0
MapObjectMovementCmd004_Step0: ; 0x02062568
	push {r3, lr}
	mov r2, #1
	str r2, [sp]
	mov r1, #0
	lsl r2, r2, #0xb
	mov r3, #0x20
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end MapObjectMovementCmd004_Step0

	thumb_func_start MapObjectMovementCmd005_Step0
MapObjectMovementCmd005_Step0: ; 0x0206257C
	push {r3, lr}
	mov r1, #1
	lsl r2, r1, #0xb
	mov r3, #0x20
	str r1, [sp]
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end MapObjectMovementCmd005_Step0

	thumb_func_start MapObjectMovementCmd006_Step0
MapObjectMovementCmd006_Step0: ; 0x02062590
	push {r3, lr}
	mov r1, #1
	str r1, [sp]
	mov r1, #2
	lsl r2, r1, #0xa
	mov r3, #0x20
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end MapObjectMovementCmd006_Step0

	thumb_func_start MapObjectMovementCmd007_Step0
MapObjectMovementCmd007_Step0: ; 0x020625A4
	push {r3, lr}
	mov r2, #1
	str r2, [sp]
	mov r1, #3
	lsl r2, r2, #0xb
	mov r3, #0x20
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end MapObjectMovementCmd007_Step0

	thumb_func_start MapObjectMovementCmd008_Step0
MapObjectMovementCmd008_Step0: ; 0x020625B8
	push {r3, lr}
	mov r2, #2
	str r2, [sp]
	mov r1, #0
	lsl r2, r2, #0xb
	mov r3, #0x10
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end MapObjectMovementCmd008_Step0

	thumb_func_start MapObjectMovementCmd009_Step0
MapObjectMovementCmd009_Step0: ; 0x020625CC
	push {r3, lr}
	mov r1, #2
	str r1, [sp]
	mov r1, #1
	lsl r2, r1, #0xc
	mov r3, #0x10
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end MapObjectMovementCmd009_Step0

	thumb_func_start MapObjectMovementCmd010_Step0
MapObjectMovementCmd010_Step0: ; 0x020625E0
	push {r3, lr}
	mov r1, #2
	lsl r2, r1, #0xb
	mov r3, #0x10
	str r1, [sp]
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end MapObjectMovementCmd010_Step0

	thumb_func_start MapObjectMovementCmd011_Step0
MapObjectMovementCmd011_Step0: ; 0x020625F4
	push {r3, lr}
	mov r2, #2
	str r2, [sp]
	mov r1, #3
	lsl r2, r2, #0xb
	mov r3, #0x10
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end MapObjectMovementCmd011_Step0

	thumb_func_start MapObjectMovementCmd012_Step0
MapObjectMovementCmd012_Step0: ; 0x02062608
	push {r3, lr}
	mov r1, #3
	mov r2, #2
	str r1, [sp]
	mov r1, #0
	lsl r2, r2, #0xc
	mov r3, #8
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end MapObjectMovementCmd012_Step0

	thumb_func_start MapObjectMovementCmd013_Step0
MapObjectMovementCmd013_Step0: ; 0x02062620
	push {r3, lr}
	mov r1, #3
	str r1, [sp]
	mov r1, #1
	lsl r2, r1, #0xd
	mov r3, #8
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end MapObjectMovementCmd013_Step0

	thumb_func_start MapObjectMovementCmd014_Step0
MapObjectMovementCmd014_Step0: ; 0x02062634
	push {r3, lr}
	mov r1, #3
	str r1, [sp]
	mov r1, #2
	lsl r2, r1, #0xc
	mov r3, #8
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end MapObjectMovementCmd014_Step0

	thumb_func_start MapObjectMovementCmd015_Step0
MapObjectMovementCmd015_Step0: ; 0x02062648
	push {r3, lr}
	mov r2, #2
	mov r1, #3
	lsl r2, r2, #0xc
	mov r3, #8
	str r1, [sp]
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end MapObjectMovementCmd015_Step0

	thumb_func_start MapObjectMovementCmd016_Step0
MapObjectMovementCmd016_Step0: ; 0x0206265C
	push {r3, lr}
	mov r3, #4
	mov r1, #0
	lsl r2, r3, #0xc
	str r3, [sp]
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end MapObjectMovementCmd016_Step0

	thumb_func_start MapObjectMovementCmd017_Step0
MapObjectMovementCmd017_Step0: ; 0x02062670
	push {r3, lr}
	mov r1, #1
	mov r3, #4
	lsl r2, r1, #0xe
	str r3, [sp]
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end MapObjectMovementCmd017_Step0

	thumb_func_start MapObjectMovementCmd018_Step0
MapObjectMovementCmd018_Step0: ; 0x02062684
	push {r3, lr}
	mov r1, #2
	mov r3, #4
	lsl r2, r1, #0xd
	str r3, [sp]
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end MapObjectMovementCmd018_Step0

	thumb_func_start MapObjectMovementCmd019_Step0
MapObjectMovementCmd019_Step0: ; 0x02062698
	push {r3, lr}
	mov r3, #4
	mov r1, #3
	lsl r2, r3, #0xc
	str r3, [sp]
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end MapObjectMovementCmd019_Step0

	thumb_func_start MapObjectMovementCmd020_Step0
MapObjectMovementCmd020_Step0: ; 0x020626AC
	push {r3, lr}
	mov r1, #5
	mov r2, #2
	str r1, [sp]
	mov r1, #0
	lsl r2, r2, #0xe
	mov r3, #2
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end MapObjectMovementCmd020_Step0

	thumb_func_start MapObjectMovementCmd021_Step0
MapObjectMovementCmd021_Step0: ; 0x020626C4
	push {r3, lr}
	mov r1, #5
	str r1, [sp]
	mov r1, #1
	lsl r2, r1, #0xf
	mov r3, #2
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end MapObjectMovementCmd021_Step0

	thumb_func_start MapObjectMovementCmd022_Step0
MapObjectMovementCmd022_Step0: ; 0x020626D8
	push {r3, lr}
	mov r1, #5
	str r1, [sp]
	mov r1, #2
	lsl r2, r1, #0xe
	add r3, r1, #0
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end MapObjectMovementCmd022_Step0

	thumb_func_start MapObjectMovementCmd023_Step0
MapObjectMovementCmd023_Step0: ; 0x020626EC
	push {r3, lr}
	mov r1, #5
	mov r2, #2
	str r1, [sp]
	mov r1, #3
	lsl r2, r2, #0xe
	mov r3, #2
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end MapObjectMovementCmd023_Step0

	thumb_func_start MapObjectMovementCmd084_Step0
MapObjectMovementCmd084_Step0: ; 0x02062704
	push {r3, lr}
	mov r2, #1
	mov r1, #0
	lsl r2, r2, #0x10
	mov r3, #1
	str r1, [sp]
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end MapObjectMovementCmd084_Step0

	thumb_func_start MapObjectMovementCmd085_Step0
MapObjectMovementCmd085_Step0: ; 0x02062718
	push {r3, lr}
	mov r1, #0
	str r1, [sp]
	mov r1, #1
	lsl r2, r1, #0x10
	add r3, r1, #0
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end MapObjectMovementCmd085_Step0

	thumb_func_start MapObjectMovementCmd086_Step0
MapObjectMovementCmd086_Step0: ; 0x0206272C
	push {r3, lr}
	mov r1, #0
	str r1, [sp]
	mov r1, #2
	lsl r2, r1, #0xf
	mov r3, #1
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end MapObjectMovementCmd086_Step0

	thumb_func_start MapObjectMovementCmd087_Step0
MapObjectMovementCmd087_Step0: ; 0x02062740
	push {r3, lr}
	mov r1, #0
	mov r2, #1
	str r1, [sp]
	mov r1, #3
	lsl r2, r2, #0x10
	mov r3, #1
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end MapObjectMovementCmd087_Step0

	thumb_func_start MapObjectMovementCmd088_Step0
MapObjectMovementCmd088_Step0: ; 0x02062758
	push {r3, lr}
	mov r1, #9
	mov r2, #1
	str r1, [sp]
	mov r1, #0
	lsl r2, r2, #0xe
	mov r3, #4
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end MapObjectMovementCmd088_Step0

	thumb_func_start MapObjectMovementCmd089_Step0
MapObjectMovementCmd089_Step0: ; 0x02062770
	push {r3, lr}
	mov r1, #9
	str r1, [sp]
	mov r1, #1
	lsl r2, r1, #0xe
	mov r3, #4
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end MapObjectMovementCmd089_Step0

	thumb_func_start MapObjectMovementCmd090_Step0
MapObjectMovementCmd090_Step0: ; 0x02062784
	push {r3, lr}
	mov r1, #9
	str r1, [sp]
	mov r1, #2
	lsl r2, r1, #0xd
	mov r3, #4
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end MapObjectMovementCmd090_Step0

	thumb_func_start MapObjectMovementCmd091_Step0
MapObjectMovementCmd091_Step0: ; 0x02062798
	push {r3, lr}
	mov r1, #9
	mov r2, #1
	str r1, [sp]
	mov r1, #3
	lsl r2, r2, #0xe
	mov r3, #4
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end MapObjectMovementCmd091_Step0

	thumb_func_start sub_020627B0
sub_020627B0: ; 0x020627B0
	push {r3, r4, r5, r6, r7, lr}
	add r7, r1, #0
	add r6, r2, #0
	add r4, r3, #0
	mov r1, #0xc
	add r5, r0, #0
	bl sub_0205F3C0
	strh r4, [r0]
	add r1, r6, #1
	strh r1, [r0, #2]
	add r0, r5, #0
	add r1, r7, #0
	bl MapObject_SetFacingDirection
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205F328
	add r0, r5, #0
	bl sub_02060F78
	add r0, r5, #0
	bl MapObject_IncMovementStep
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_020627B0

	thumb_func_start MapObjectMovementCmd040_Step1
MapObjectMovementCmd040_Step1: ; 0x020627E4
	push {r4, lr}
	add r4, r0, #0
	bl sub_0205F3E4
	mov r1, #2
	ldrsh r2, [r0, r1]
	sub r2, r2, #1
	strh r2, [r0, #2]
	ldrsh r0, [r0, r1]
	cmp r0, #0
	ble _020627FE
	mov r0, #0
	pop {r4, pc}
_020627FE:
	add r0, r4, #0
	mov r1, #0x20
	bl MapObject_SetBits
	add r0, r4, #0
	mov r1, #0
	bl sub_0205F328
	add r0, r4, #0
	bl MapObject_IncMovementStep
	mov r0, #1
	pop {r4, pc}
	thumb_func_end MapObjectMovementCmd040_Step1

	thumb_func_start MapObjectMovementCmd024_Step0
MapObjectMovementCmd024_Step0: ; 0x02062818
	push {r3, lr}
	mov r1, #0
	mov r2, #0x20
	mov r3, #1
	bl sub_020627B0
	mov r0, #1
	pop {r3, pc}
	thumb_func_end MapObjectMovementCmd024_Step0

	thumb_func_start MapObjectMovementCmd025_Step0
MapObjectMovementCmd025_Step0: ; 0x02062828
	push {r3, lr}
	mov r1, #1
	mov r2, #0x20
	add r3, r1, #0
	bl sub_020627B0
	mov r0, #1
	pop {r3, pc}
	thumb_func_end MapObjectMovementCmd025_Step0

	thumb_func_start MapObjectMovementCmd026_Step0
MapObjectMovementCmd026_Step0: ; 0x02062838
	push {r3, lr}
	mov r1, #2
	mov r2, #0x20
	mov r3, #1
	bl sub_020627B0
	mov r0, #1
	pop {r3, pc}
	thumb_func_end MapObjectMovementCmd026_Step0

	thumb_func_start MapObjectMovementCmd027_Step0
MapObjectMovementCmd027_Step0: ; 0x02062848
	push {r3, lr}
	mov r1, #3
	mov r2, #0x20
	mov r3, #1
	bl sub_020627B0
	mov r0, #1
	pop {r3, pc}
	thumb_func_end MapObjectMovementCmd027_Step0

	thumb_func_start MapObjectMovementCmd028_Step0
MapObjectMovementCmd028_Step0: ; 0x02062858
	push {r3, lr}
	mov r1, #0
	mov r2, #0x10
	mov r3, #2
	bl sub_020627B0
	mov r0, #1
	pop {r3, pc}
	thumb_func_end MapObjectMovementCmd028_Step0

	thumb_func_start MapObjectMovementCmd029_Step0
MapObjectMovementCmd029_Step0: ; 0x02062868
	push {r3, lr}
	mov r1, #1
	mov r2, #0x10
	mov r3, #2
	bl sub_020627B0
	mov r0, #1
	pop {r3, pc}
	thumb_func_end MapObjectMovementCmd029_Step0

	thumb_func_start MapObjectMovementCmd030_Step0
MapObjectMovementCmd030_Step0: ; 0x02062878
	push {r3, lr}
	mov r1, #2
	mov r2, #0x10
	add r3, r1, #0
	bl sub_020627B0
	mov r0, #1
	pop {r3, pc}
	thumb_func_end MapObjectMovementCmd030_Step0

	thumb_func_start MapObjectMovementCmd031_Step0
MapObjectMovementCmd031_Step0: ; 0x02062888
	push {r3, lr}
	mov r1, #3
	mov r2, #0x10
	mov r3, #2
	bl sub_020627B0
	mov r0, #1
	pop {r3, pc}
	thumb_func_end MapObjectMovementCmd031_Step0

	thumb_func_start MapObjectMovementCmd032_Step0
MapObjectMovementCmd032_Step0: ; 0x02062898
	push {r3, lr}
	mov r1, #0
	mov r2, #8
	mov r3, #3
	bl sub_020627B0
	mov r0, #1
	pop {r3, pc}
	thumb_func_end MapObjectMovementCmd032_Step0

	thumb_func_start MapObjectMovementCmd033_Step0
MapObjectMovementCmd033_Step0: ; 0x020628A8
	push {r3, lr}
	mov r1, #1
	mov r2, #8
	mov r3, #3
	bl sub_020627B0
	mov r0, #1
	pop {r3, pc}
	thumb_func_end MapObjectMovementCmd033_Step0

	thumb_func_start MapObjectMovementCmd034_Step0
MapObjectMovementCmd034_Step0: ; 0x020628B8
	push {r3, lr}
	mov r1, #2
	mov r2, #8
	mov r3, #3
	bl sub_020627B0
	mov r0, #1
	pop {r3, pc}
	thumb_func_end MapObjectMovementCmd034_Step0

	thumb_func_start MapObjectMovementCmd035_Step0
MapObjectMovementCmd035_Step0: ; 0x020628C8
	push {r3, lr}
	mov r1, #3
	mov r2, #8
	add r3, r1, #0
	bl sub_020627B0
	mov r0, #1
	pop {r3, pc}
	thumb_func_end MapObjectMovementCmd035_Step0

	thumb_func_start MapObjectMovementCmd036_Step0
MapObjectMovementCmd036_Step0: ; 0x020628D8
	push {r3, lr}
	mov r2, #4
	mov r1, #0
	add r3, r2, #0
	bl sub_020627B0
	mov r0, #1
	pop {r3, pc}
	thumb_func_end MapObjectMovementCmd036_Step0

	thumb_func_start MapObjectMovementCmd037_Step0
MapObjectMovementCmd037_Step0: ; 0x020628E8
	push {r3, lr}
	mov r2, #4
	mov r1, #1
	add r3, r2, #0
	bl sub_020627B0
	mov r0, #1
	pop {r3, pc}
	thumb_func_end MapObjectMovementCmd037_Step0

	thumb_func_start MapObjectMovementCmd038_Step0
MapObjectMovementCmd038_Step0: ; 0x020628F8
	push {r3, lr}
	mov r2, #4
	mov r1, #2
	add r3, r2, #0
	bl sub_020627B0
	mov r0, #1
	pop {r3, pc}
	thumb_func_end MapObjectMovementCmd038_Step0

	thumb_func_start MapObjectMovementCmd039_Step0
MapObjectMovementCmd039_Step0: ; 0x02062908
	push {r3, lr}
	mov r2, #4
	mov r1, #3
	add r3, r2, #0
	bl sub_020627B0
	mov r0, #1
	pop {r3, pc}
	thumb_func_end MapObjectMovementCmd039_Step0

	thumb_func_start MapObjectMovementCmd040_Step0
MapObjectMovementCmd040_Step0: ; 0x02062918
	push {r3, lr}
	mov r1, #0
	mov r2, #2
	mov r3, #5
	bl sub_020627B0
	mov r0, #1
	pop {r3, pc}
	thumb_func_end MapObjectMovementCmd040_Step0

	thumb_func_start MapObjectMovementCmd041_Step0
MapObjectMovementCmd041_Step0: ; 0x02062928
	push {r3, lr}
	mov r1, #1
	mov r2, #2
	mov r3, #5
	bl sub_020627B0
	mov r0, #1
	pop {r3, pc}
	thumb_func_end MapObjectMovementCmd041_Step0

	thumb_func_start MapObjectMovementCmd042_Step0
MapObjectMovementCmd042_Step0: ; 0x02062938
	push {r3, lr}
	mov r1, #2
	add r2, r1, #0
	mov r3, #5
	bl sub_020627B0
	mov r0, #1
	pop {r3, pc}
	thumb_func_end MapObjectMovementCmd042_Step0

	thumb_func_start MapObjectMovementCmd043_Step0
MapObjectMovementCmd043_Step0: ; 0x02062948
	push {r3, lr}
	mov r1, #3
	mov r2, #2
	mov r3, #5
	bl sub_020627B0
	mov r0, #1
	pop {r3, pc}
	thumb_func_end MapObjectMovementCmd043_Step0

	thumb_func_start sub_02062958
sub_02062958: ; 0x02062958
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	mov r1, #0x10
	add r5, r0, #0
	add r6, r2, #0
	add r7, r3, #0
	bl sub_0205F3C0
	strb r4, [r0, #0xc]
	str r6, [r0]
	strb r7, [r0, #0xd]
	add r2, sp, #8
	ldrh r1, [r2, #0x10]
	strb r1, [r0, #0xe]
	mov r1, #0x14
	ldrsh r1, [r2, r1]
	cmp r6, #0
	strb r1, [r0, #0xf]
	ldrh r1, [r2, #0x18]
	strh r1, [r0, #8]
	bne _0206298A
	add r0, r5, #0
	bl sub_02060F78
	b _02062992
_0206298A:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02060F24
_02062992:
	ldr r1, _020629C4 ; =0x00010004
	add r0, r5, #0
	bl MapObject_SetBits
	add r0, r5, #0
	add r1, r4, #0
	bl MapObject_SetOrQueueFacing
	add r1, sp, #8
	ldrh r1, [r1, #0x10]
	add r0, r5, #0
	bl sub_0205F328
	add r0, r5, #0
	bl MapObject_IncMovementStep
	add r0, r5, #0
	bl sub_0205F684
	cmp r0, #0
	bne _020629C2
	ldr r0, _020629C8 ; =SEQ_SE_DP_DANSA
	bl PlaySE
_020629C2:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_020629C4: .word 0x00010004
_020629C8: .word SEQ_SE_DP_DANSA
	thumb_func_end sub_02062958

	thumb_func_start MapObjectMovementCmd092_Step1
MapObjectMovementCmd092_Step1: ; 0x020629CC
	push {r3, r4, r5, lr}
	sub sp, #0x18
	add r5, r0, #0
	bl sub_0205F3E4
	add r4, r0, #0
	ldr r2, [r4]
	cmp r2, #0
	beq _02062A1C
	mov r1, #0xc
	ldrsb r1, [r4, r1]
	add r0, r5, #0
	bl sub_0206101C
	add r0, r5, #0
	bl sub_02061070
	mov r0, #1
	ldr r1, [r4, #4]
	lsl r0, r0, #0x10
	cmp r1, r0
	blt _02062A0E
	mov r0, #0
	str r0, [r4, #4]
	mov r1, #0xc
	ldrsb r1, [r4, r1]
	add r0, r5, #0
	bl sub_02060F24
	add r0, r5, #0
	mov r1, #4
	bl MapObject_SetBits
_02062A0E:
	ldr r1, [r4]
	cmp r1, #0
	bge _02062A16
	neg r1, r1
_02062A16:
	ldr r0, [r4, #4]
	add r0, r0, r1
	str r0, [r4, #4]
_02062A1C:
	ldrh r1, [r4, #0xa]
	ldrh r0, [r4, #8]
	add r0, r1, r0
	strh r0, [r4, #0xa]
	mov r0, #0xf
	ldrh r1, [r4, #0xa]
	lsl r0, r0, #8
	cmp r1, r0
	bls _02062A30
	strh r0, [r4, #0xa]
_02062A30:
	mov r1, #0xf
	ldrsb r1, [r4, r1]
	ldrh r0, [r4, #0xa]
	lsl r2, r1, #2
	ldr r1, _02062AB0 ; =_0210FACC
	lsr r0, r0, #8
	lsl r0, r0, #0x10
	ldr r2, [r1, r2]
	mov r1, #0
	str r1, [sp, #0xc]
	lsr r0, r0, #0xe
	ldr r0, [r2, r0]
	str r0, [sp, #0x10]
	str r1, [sp, #0x14]
	add r0, r5, #0
	add r1, sp, #0xc
	bl MapObject_SetFacingVec
	mov r0, #0xd
	ldrsb r1, [r4, r0]
	sub r1, r1, #1
	strb r1, [r4, #0xd]
	ldrsb r0, [r4, r0]
	cmp r0, #0
	ble _02062A68
	add sp, #0x18
	mov r0, #0
	pop {r3, r4, r5, pc}
_02062A68:
	add r1, sp, #0
	mov r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	add r0, r5, #0
	bl MapObject_SetFacingVec
	ldr r1, _02062AB4 ; =0x00020028
	add r0, r5, #0
	bl MapObject_SetBits
	add r0, r5, #0
	bl sub_02060F78
	add r0, r5, #0
	bl sub_0205F484
	add r0, r5, #0
	mov r1, #0
	bl sub_0205F328
	add r0, r5, #0
	bl MapObject_IncMovementStep
	add r0, r5, #0
	bl sub_0205F684
	cmp r0, #0
	bne _02062AAA
	ldr r0, _02062AB8 ; =SEQ_SE_DP_SUTYA2
	bl PlaySE
_02062AAA:
	mov r0, #1
	add sp, #0x18
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02062AB0: .word _0210FACC
_02062AB4: .word 0x00020028
_02062AB8: .word SEQ_SE_DP_SUTYA2
	thumb_func_end MapObjectMovementCmd092_Step1

	thumb_func_start MapObjectMovementCmd044_Step0
MapObjectMovementCmd044_Step0: ; 0x02062ABC
	push {lr}
	sub sp, #0xc
	mov r2, #2
	str r2, [sp]
	mov r1, #0
	str r1, [sp, #4]
	add r2, #0xfe
	str r2, [sp, #8]
	add r2, r1, #0
	mov r3, #0x10
	bl sub_02062958
	mov r0, #1
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end MapObjectMovementCmd044_Step0

	thumb_func_start MapObjectMovementCmd045_Step0
MapObjectMovementCmd045_Step0: ; 0x02062ADC
	push {lr}
	sub sp, #0xc
	mov r1, #2
	str r1, [sp]
	mov r2, #0
	str r2, [sp, #4]
	add r1, #0xfe
	str r1, [sp, #8]
	mov r1, #1
	mov r3, #0x10
	bl sub_02062958
	mov r0, #1
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end MapObjectMovementCmd045_Step0

	thumb_func_start MapObjectMovementCmd046_Step0
MapObjectMovementCmd046_Step0: ; 0x02062AFC
	push {lr}
	sub sp, #0xc
	mov r1, #2
	add r3, r1, #0
	str r1, [sp]
	mov r2, #0
	str r2, [sp, #4]
	add r3, #0xfe
	str r3, [sp, #8]
	mov r3, #0x10
	bl sub_02062958
	mov r0, #1
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end MapObjectMovementCmd046_Step0

	thumb_func_start MapObjectMovementCmd047_Step0
MapObjectMovementCmd047_Step0: ; 0x02062B1C
	push {lr}
	sub sp, #0xc
	mov r1, #2
	str r1, [sp]
	mov r2, #0
	str r2, [sp, #4]
	add r1, #0xfe
	str r1, [sp, #8]
	mov r1, #3
	mov r3, #0x10
	bl sub_02062958
	mov r0, #1
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end MapObjectMovementCmd047_Step0

	thumb_func_start MapObjectMovementCmd048_Step0
MapObjectMovementCmd048_Step0: ; 0x02062B3C
	push {lr}
	sub sp, #0xc
	mov r1, #3
	str r1, [sp]
	mov r1, #0
	mov r2, #2
	str r1, [sp, #4]
	lsl r2, r2, #8
	str r2, [sp, #8]
	add r2, r1, #0
	mov r3, #8
	bl sub_02062958
	mov r0, #1
	add sp, #0xc
	pop {pc}
	thumb_func_end MapObjectMovementCmd048_Step0

	thumb_func_start MapObjectMovementCmd049_Step0
MapObjectMovementCmd049_Step0: ; 0x02062B5C
	push {lr}
	sub sp, #0xc
	mov r1, #3
	str r1, [sp]
	mov r2, #0
	mov r1, #2
	str r2, [sp, #4]
	lsl r1, r1, #8
	str r1, [sp, #8]
	mov r1, #1
	mov r3, #8
	bl sub_02062958
	mov r0, #1
	add sp, #0xc
	pop {pc}
	thumb_func_end MapObjectMovementCmd049_Step0

	thumb_func_start MapObjectMovementCmd050_Step0
MapObjectMovementCmd050_Step0: ; 0x02062B7C
	push {lr}
	sub sp, #0xc
	mov r1, #3
	str r1, [sp]
	mov r2, #0
	mov r1, #2
	str r2, [sp, #4]
	lsl r1, r1, #8
	str r1, [sp, #8]
	mov r1, #2
	mov r3, #8
	bl sub_02062958
	mov r0, #1
	add sp, #0xc
	pop {pc}
	thumb_func_end MapObjectMovementCmd050_Step0

	thumb_func_start MapObjectMovementCmd051_Step0
MapObjectMovementCmd051_Step0: ; 0x02062B9C
	push {lr}
	sub sp, #0xc
	mov r1, #3
	mov r3, #2
	str r1, [sp]
	mov r2, #0
	str r2, [sp, #4]
	lsl r3, r3, #8
	str r3, [sp, #8]
	mov r3, #8
	bl sub_02062958
	mov r0, #1
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end MapObjectMovementCmd051_Step0

	thumb_func_start MapObjectMovementCmd052_Step0
MapObjectMovementCmd052_Step0: ; 0x02062BBC
	push {lr}
	sub sp, #0xc
	mov r1, #3
	str r1, [sp]
	mov r1, #0
	mov r2, #2
	str r1, [sp, #4]
	lsl r2, r2, #8
	str r2, [sp, #8]
	lsl r2, r2, #4
	mov r3, #8
	bl sub_02062958
	mov r0, #1
	add sp, #0xc
	pop {pc}
	thumb_func_end MapObjectMovementCmd052_Step0

	thumb_func_start MapObjectMovementCmd053_Step0
MapObjectMovementCmd053_Step0: ; 0x02062BDC
	push {lr}
	sub sp, #0xc
	mov r1, #3
	str r1, [sp]
	mov r1, #0
	str r1, [sp, #4]
	mov r1, #2
	lsl r1, r1, #8
	str r1, [sp, #8]
	mov r1, #1
	lsl r2, r1, #0xd
	mov r3, #8
	bl sub_02062958
	mov r0, #1
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end MapObjectMovementCmd053_Step0

	thumb_func_start MapObjectMovementCmd054_Step0
MapObjectMovementCmd054_Step0: ; 0x02062C00
	push {lr}
	sub sp, #0xc
	mov r1, #3
	str r1, [sp]
	mov r1, #0
	str r1, [sp, #4]
	mov r1, #2
	lsl r1, r1, #8
	str r1, [sp, #8]
	mov r1, #2
	lsl r2, r1, #0xc
	mov r3, #8
	bl sub_02062958
	mov r0, #1
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end MapObjectMovementCmd054_Step0

	thumb_func_start MapObjectMovementCmd055_Step0
MapObjectMovementCmd055_Step0: ; 0x02062C24
	push {lr}
	sub sp, #0xc
	mov r1, #3
	str r1, [sp]
	mov r2, #0
	str r2, [sp, #4]
	mov r2, #2
	lsl r2, r2, #8
	str r2, [sp, #8]
	lsl r2, r2, #4
	mov r3, #8
	bl sub_02062958
	mov r0, #1
	add sp, #0xc
	pop {pc}
	thumb_func_end MapObjectMovementCmd055_Step0

	thumb_func_start MapObjectMovementCmd056_Step0
MapObjectMovementCmd056_Step0: ; 0x02062C44
	push {lr}
	sub sp, #0xc
	mov r2, #3
	str r2, [sp]
	mov r1, #0
	str r1, [sp, #4]
	add r2, #0xfd
	str r2, [sp, #8]
	mov r2, #2
	lsl r2, r2, #0xc
	mov r3, #0x10
	bl sub_02062958
	mov r0, #1
	add sp, #0xc
	pop {pc}
	thumb_func_end MapObjectMovementCmd056_Step0

	thumb_func_start MapObjectMovementCmd057_Step0
MapObjectMovementCmd057_Step0: ; 0x02062C64
	push {lr}
	sub sp, #0xc
	mov r2, #3
	str r2, [sp]
	mov r1, #0
	str r1, [sp, #4]
	add r2, #0xfd
	mov r1, #1
	str r2, [sp, #8]
	lsl r2, r1, #0xd
	mov r3, #0x10
	bl sub_02062958
	mov r0, #1
	add sp, #0xc
	pop {pc}
	thumb_func_end MapObjectMovementCmd057_Step0

	thumb_func_start MapObjectMovementCmd058_Step0
MapObjectMovementCmd058_Step0: ; 0x02062C84
	push {lr}
	sub sp, #0xc
	mov r2, #3
	str r2, [sp]
	mov r1, #0
	str r1, [sp, #4]
	add r2, #0xfd
	mov r1, #2
	str r2, [sp, #8]
	lsl r2, r1, #0xc
	mov r3, #0x10
	bl sub_02062958
	mov r0, #1
	add sp, #0xc
	pop {pc}
	thumb_func_end MapObjectMovementCmd058_Step0

	thumb_func_start MapObjectMovementCmd059_Step0
MapObjectMovementCmd059_Step0: ; 0x02062CA4
	push {lr}
	sub sp, #0xc
	mov r1, #3
	str r1, [sp]
	mov r2, #0
	str r2, [sp, #4]
	add r2, r1, #0
	add r2, #0xfd
	str r2, [sp, #8]
	mov r2, #2
	lsl r2, r2, #0xc
	mov r3, #0x10
	bl sub_02062958
	mov r0, #1
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end MapObjectMovementCmd059_Step0

	thumb_func_start MapObjectMovementCmd092_Step0
MapObjectMovementCmd092_Step0: ; 0x02062CC8
	push {lr}
	sub sp, #0xc
	mov r1, #0xa
	str r1, [sp]
	mov r1, #0
	str r1, [sp, #4]
	mov r1, #0xf0
	str r1, [sp, #8]
	mov r1, #2
	lsl r2, r1, #0xb
	mov r3, #0x10
	bl sub_02062958
	mov r0, #1
	add sp, #0xc
	pop {pc}
	thumb_func_end MapObjectMovementCmd092_Step0

	thumb_func_start MapObjectMovementCmd093_Step0
MapObjectMovementCmd093_Step0: ; 0x02062CE8
	push {lr}
	sub sp, #0xc
	mov r1, #0xa
	str r1, [sp]
	mov r1, #0
	str r1, [sp, #4]
	mov r1, #0xf0
	mov r2, #1
	str r1, [sp, #8]
	mov r1, #3
	lsl r2, r2, #0xc
	mov r3, #0x10
	bl sub_02062958
	mov r0, #1
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end MapObjectMovementCmd093_Step0

	thumb_func_start MapObjectMovementCmd094_Step0
MapObjectMovementCmd094_Step0: ; 0x02062D0C
	push {lr}
	sub sp, #0xc
	mov r1, #0xb
	str r1, [sp]
	mov r1, #0
	str r1, [sp, #4]
	mov r1, #5
	lsl r1, r1, #6
	str r1, [sp, #8]
	mov r1, #2
	lsl r2, r1, #0xd
	mov r3, #0xc
	bl sub_02062958
	mov r0, #1
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end MapObjectMovementCmd094_Step0

	thumb_func_start MapObjectMovementCmd095_Step0
MapObjectMovementCmd095_Step0: ; 0x02062D30
	push {lr}
	sub sp, #0xc
	mov r1, #0xb
	str r1, [sp]
	mov r1, #0
	str r1, [sp, #4]
	mov r1, #5
	lsl r1, r1, #6
	mov r2, #1
	str r1, [sp, #8]
	mov r1, #3
	lsl r2, r2, #0xe
	mov r3, #0xc
	bl sub_02062958
	mov r0, #1
	add sp, #0xc
	pop {pc}
	thumb_func_end MapObjectMovementCmd095_Step0

	thumb_func_start sub_02062D54
sub_02062D54: ; 0x02062D54
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	mov r1, #4
	bl sub_0205F3C0
	str r4, [r0]
	add r0, r5, #0
	bl MapObject_IncMovementStep
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02062D54

	thumb_func_start MapObjectMovementCmd064_Step1
MapObjectMovementCmd064_Step1: ; 0x02062D6C
	push {r4, lr}
	add r4, r0, #0
	bl sub_0205F3E4
	ldr r1, [r0]
	cmp r1, #0
	beq _02062D82
	sub r1, r1, #1
	str r1, [r0]
	mov r0, #0
	pop {r4, pc}
_02062D82:
	add r0, r4, #0
	bl MapObject_IncMovementStep
	mov r0, #1
	pop {r4, pc}
	thumb_func_end MapObjectMovementCmd064_Step1

	thumb_func_start MapObjectMovementCmd060_Step0
MapObjectMovementCmd060_Step0: ; 0x02062D8C
	push {r3, lr}
	mov r1, #1
	bl sub_02062D54
	mov r0, #1
	pop {r3, pc}
	thumb_func_end MapObjectMovementCmd060_Step0

	thumb_func_start MapObjectMovementCmd061_Step0
MapObjectMovementCmd061_Step0: ; 0x02062D98
	push {r3, lr}
	mov r1, #2
	bl sub_02062D54
	mov r0, #1
	pop {r3, pc}
	thumb_func_end MapObjectMovementCmd061_Step0

	thumb_func_start MapObjectMovementCmd062_Step0
MapObjectMovementCmd062_Step0: ; 0x02062DA4
	push {r3, lr}
	mov r1, #4
	bl sub_02062D54
	mov r0, #1
	pop {r3, pc}
	thumb_func_end MapObjectMovementCmd062_Step0

	thumb_func_start MapObjectMovementCmd063_Step0
MapObjectMovementCmd063_Step0: ; 0x02062DB0
	push {r3, lr}
	mov r1, #8
	bl sub_02062D54
	mov r0, #1
	pop {r3, pc}
	thumb_func_end MapObjectMovementCmd063_Step0

	thumb_func_start MapObjectMovementCmd064_Step0
MapObjectMovementCmd064_Step0: ; 0x02062DBC
	push {r3, lr}
	mov r1, #0xf
	bl sub_02062D54
	mov r0, #1
	pop {r3, pc}
	thumb_func_end MapObjectMovementCmd064_Step0

	thumb_func_start MapObjectMovementCmd065_Step0
MapObjectMovementCmd065_Step0: ; 0x02062DC8
	push {r3, lr}
	mov r1, #0x10
	bl sub_02062D54
	mov r0, #1
	pop {r3, pc}
	thumb_func_end MapObjectMovementCmd065_Step0

	thumb_func_start MapObjectMovementCmd066_Step0
MapObjectMovementCmd066_Step0: ; 0x02062DD4
	push {r3, lr}
	mov r1, #0x20
	bl sub_02062D54
	mov r0, #1
	pop {r3, pc}
	thumb_func_end MapObjectMovementCmd066_Step0

	thumb_func_start MapObjectMovementCmd067_Step0
MapObjectMovementCmd067_Step0: ; 0x02062DE0
	push {r4, lr}
	mov r1, #8
	add r4, r0, #0
	bl sub_0205F3C0
	mov r1, #1
	lsl r1, r1, #0x10
	str r1, [r0, #4]
	add r0, r4, #0
	mov r1, #0
	bl sub_0205F328
	add r0, r4, #0
	bl MapObject_IncMovementStep
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end MapObjectMovementCmd067_Step0

	thumb_func_start MapObjectMovementCmd067_Step1
MapObjectMovementCmd067_Step1: ; 0x02062E04
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	bl sub_0205F3E4
	add r4, r0, #0
	ldr r1, [r4]
	ldr r0, [r4, #4]
	add r0, r1, r0
	str r0, [r4]
	add r1, sp, #0
	mov r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	ldr r0, [r4]
	str r0, [sp, #4]
	add r0, r5, #0
	bl MapObject_SetFacingVec
	ldr r1, [r4]
	asr r0, r1, #0xe
	lsr r0, r0, #0x11
	add r0, r1, r0
	asr r0, r0, #0xf
	cmp r0, #0x28
	bge _02062E40
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, pc}
_02062E40:
	add r0, r5, #0
	bl MapObject_IncMovementStep
	mov r0, #1
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end MapObjectMovementCmd067_Step1

	thumb_func_start MapObjectMovementCmd068_Step0
MapObjectMovementCmd068_Step0: ; 0x02062E4C
	push {r4, lr}
	mov r1, #8
	add r4, r0, #0
	bl sub_0205F3C0
	mov r1, #5
	lsl r1, r1, #0x12
	str r1, [r0]
	ldr r1, _02062E74 ; =0xFFFF0000
	str r1, [r0, #4]
	add r0, r4, #0
	mov r1, #0
	bl sub_0205F328
	add r0, r4, #0
	bl MapObject_IncMovementStep
	mov r0, #1
	pop {r4, pc}
	nop
_02062E74: .word 0xFFFF0000
	thumb_func_end MapObjectMovementCmd068_Step0

	thumb_func_start MapObjectMovementCmd068_Step1
MapObjectMovementCmd068_Step1: ; 0x02062E78
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	bl sub_0205F3E4
	add r4, r0, #0
	ldr r1, [r4]
	ldr r0, [r4, #4]
	add r0, r1, r0
	str r0, [r4]
	bpl _02062E92
	mov r0, #0
	str r0, [r4]
_02062E92:
	add r1, sp, #0
	mov r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	ldr r0, [r4]
	str r0, [sp, #4]
	add r0, r5, #0
	bl MapObject_SetFacingVec
	ldr r0, [r4]
	cmp r0, #0
	ble _02062EB2
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, pc}
_02062EB2:
	add r0, r5, #0
	bl MapObject_IncMovementStep
	mov r0, #1
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end MapObjectMovementCmd068_Step1

	thumb_func_start MapObjectMovementCmd069_Step0
MapObjectMovementCmd069_Step0: ; 0x02062EC0
	push {r4, lr}
	mov r1, #2
	add r4, r0, #0
	lsl r1, r1, #8
	bl MapObject_SetBits
	add r0, r4, #0
	bl MapObject_IncMovementStep
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end MapObjectMovementCmd069_Step0

	thumb_func_start MapObjectMovementCmd070_Step0
MapObjectMovementCmd070_Step0: ; 0x02062ED8
	push {r4, lr}
	mov r1, #2
	add r4, r0, #0
	lsl r1, r1, #8
	bl MapObject_ClearBits
	add r0, r4, #0
	bl MapObject_IncMovementStep
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end MapObjectMovementCmd070_Step0

	thumb_func_start MapObjectMovementCmd071_Step0
MapObjectMovementCmd071_Step0: ; 0x02062EF0
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0x80
	bl MapObject_SetBits
	add r0, r4, #0
	bl MapObject_IncMovementStep
	mov r0, #1
	pop {r4, pc}
	thumb_func_end MapObjectMovementCmd071_Step0

	thumb_func_start MapObjectMovementCmd072_Step0
MapObjectMovementCmd072_Step0: ; 0x02062F04
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0x80
	bl MapObject_ClearBits
	add r0, r4, #0
	bl MapObject_IncMovementStep
	mov r0, #1
	pop {r4, pc}
	thumb_func_end MapObjectMovementCmd072_Step0

	thumb_func_start MapObjectMovementCmd073_Step0
MapObjectMovementCmd073_Step0: ; 0x02062F18
	push {r4, lr}
	mov r1, #1
	add r4, r0, #0
	lsl r1, r1, #8
	bl MapObject_SetBits
	add r0, r4, #0
	bl MapObject_IncMovementStep
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end MapObjectMovementCmd073_Step0

	thumb_func_start MapObjectMovementCmd074_Step0
MapObjectMovementCmd074_Step0: ; 0x02062F30
	push {r4, lr}
	mov r1, #1
	add r4, r0, #0
	lsl r1, r1, #8
	bl MapObject_ClearBits
	add r0, r4, #0
	bl MapObject_IncMovementStep
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end MapObjectMovementCmd074_Step0

	thumb_func_start sub_02062F48
sub_02062F48: ; 0x02062F48
	push {r4, r5, r6, lr}
	add r6, r1, #0
	mov r1, #8
	add r5, r0, #0
	bl sub_0205F3C0
	add r4, r0, #0
	str r6, [r4]
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #1
	bl ov01_02200540
	str r0, [r4, #4]
	add r0, r5, #0
	bl MapObject_IncMovementStep
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02062F48

	thumb_func_start MapObjectMovementCmd075_Step1
MapObjectMovementCmd075_Step1: ; 0x02062F6C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_0205F3E4
	add r4, r0, #0
	ldr r0, [r4, #4]
	bl ov01_022003F4
	cmp r0, #1
	bne _02062F90
	ldr r0, [r4, #4]
	bl sub_02068B48
	add r0, r5, #0
	bl MapObject_IncMovementStep
	mov r0, #1
	pop {r3, r4, r5, pc}
_02062F90:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end MapObjectMovementCmd075_Step1

	thumb_func_start MapObjectMovementCmd075_Step0
MapObjectMovementCmd075_Step0: ; 0x02062F94
	push {r3, lr}
	mov r1, #0
	bl sub_02062F48
	mov r0, #0
	pop {r3, pc}
	thumb_func_end MapObjectMovementCmd075_Step0

	thumb_func_start MapObjectMovementCmd103_Step0
MapObjectMovementCmd103_Step0: ; 0x02062FA0
	push {r3, lr}
	mov r1, #1
	bl sub_02062F48
	mov r0, #0
	pop {r3, pc}
	thumb_func_end MapObjectMovementCmd103_Step0

	thumb_func_start sub_02062FAC
sub_02062FAC: ; 0x02062FAC
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	mov r1, #8
	add r5, r0, #0
	add r7, r2, #0
	add r6, r3, #0
	bl sub_0205F3C0
	strh r4, [r0]
	strh r6, [r0, #2]
	strh r7, [r0, #4]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02060F24
	add r0, r5, #0
	add r1, r4, #0
	bl MapObject_SetOrQueueFacing
	add r0, r5, #0
	add r1, r6, #0
	bl sub_0205F328
	add r0, r5, #0
	mov r1, #4
	bl MapObject_SetBits
	add r0, r5, #0
	bl MapObject_IncMovementStep
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02062FAC

	thumb_func_start sub_02062FEC
sub_02062FEC: ; 0x02062FEC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r1, #0
	bl sub_0205F3E4
	add r4, r0, #0
	mov r2, #6
	ldrsh r2, [r4, r2]
	mov r1, #0
	ldrsh r1, [r4, r1]
	lsl r2, r2, #2
	ldr r2, [r6, r2]
	add r0, r5, #0
	bl sub_0206101C
	add r0, r5, #0
	bl sub_02061070
	mov r0, #6
	ldrsh r1, [r4, r0]
	add r1, r1, #1
	strh r1, [r4, #6]
	ldrsh r1, [r4, r0]
	mov r0, #4
	ldrsh r0, [r4, r0]
	cmp r1, r0
	bge _02063026
	mov r0, #0
	pop {r4, r5, r6, pc}
_02063026:
	add r0, r5, #0
	mov r1, #0x28
	bl MapObject_SetBits
	add r0, r5, #0
	bl sub_02060F78
	add r0, r5, #0
	bl sub_0205F484
	add r0, r5, #0
	mov r1, #0
	bl sub_0205F328
	add r0, r5, #0
	bl MapObject_IncMovementStep
	mov r0, #1
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02062FEC

	thumb_func_start MapObjectMovementCmd076_Step0
MapObjectMovementCmd076_Step0: ; 0x0206304C
	push {r3, lr}
	mov r2, #6
	mov r1, #0
	add r3, r2, #0
	bl sub_02062FAC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end MapObjectMovementCmd076_Step0

	thumb_func_start MapObjectMovementCmd077_Step0
MapObjectMovementCmd077_Step0: ; 0x0206305C
	push {r3, lr}
	mov r2, #6
	mov r1, #1
	add r3, r2, #0
	bl sub_02062FAC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end MapObjectMovementCmd077_Step0

	thumb_func_start MapObjectMovementCmd078_Step0
MapObjectMovementCmd078_Step0: ; 0x0206306C
	push {r3, lr}
	mov r2, #6
	mov r1, #2
	add r3, r2, #0
	bl sub_02062FAC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end MapObjectMovementCmd078_Step0

	thumb_func_start MapObjectMovementCmd079_Step0
MapObjectMovementCmd079_Step0: ; 0x0206307C
	push {r3, lr}
	mov r2, #6
	mov r1, #3
	add r3, r2, #0
	bl sub_02062FAC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end MapObjectMovementCmd079_Step0

	thumb_func_start MapObjectMovementCmd076_Step1
MapObjectMovementCmd076_Step1: ; 0x0206308C
	push {r3, lr}
	ldr r1, _020630A0 ; =_020FDA50
	bl sub_02062FEC
	cmp r0, #1
	bne _0206309C
	mov r0, #1
	pop {r3, pc}
_0206309C:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_020630A0: .word _020FDA50
	thumb_func_end MapObjectMovementCmd076_Step1

	thumb_func_start MapObjectMovementCmd080_Step0
MapObjectMovementCmd080_Step0: ; 0x020630A4
	push {r3, lr}
	mov r1, #0
	mov r2, #3
	mov r3, #7
	bl sub_02062FAC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end MapObjectMovementCmd080_Step0

	thumb_func_start MapObjectMovementCmd081_Step0
MapObjectMovementCmd081_Step0: ; 0x020630B4
	push {r3, lr}
	mov r1, #1
	mov r2, #3
	mov r3, #7
	bl sub_02062FAC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end MapObjectMovementCmd081_Step0

	thumb_func_start MapObjectMovementCmd082_Step0
MapObjectMovementCmd082_Step0: ; 0x020630C4
	push {r3, lr}
	mov r1, #2
	mov r2, #3
	mov r3, #7
	bl sub_02062FAC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end MapObjectMovementCmd082_Step0

	thumb_func_start MapObjectMovementCmd083_Step0
MapObjectMovementCmd083_Step0: ; 0x020630D4
	push {r3, lr}
	mov r1, #3
	add r2, r1, #0
	mov r3, #7
	bl sub_02062FAC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end MapObjectMovementCmd083_Step0

	thumb_func_start MapObjectMovementCmd082_Step1
MapObjectMovementCmd082_Step1: ; 0x020630E4
	push {r3, lr}
	ldr r1, _020630F8 ; =_020FDA1C
	bl sub_02062FEC
	cmp r0, #1
	bne _020630F4
	mov r0, #1
	pop {r3, pc}
_020630F4:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_020630F8: .word _020FDA1C
	thumb_func_end MapObjectMovementCmd082_Step1

	thumb_func_start MapObjectMovementCmd096_Step0
MapObjectMovementCmd096_Step0: ; 0x020630FC
	push {r3, lr}
	mov r1, #0
	mov r2, #7
	mov r3, #8
	bl sub_02062FAC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end MapObjectMovementCmd096_Step0

	thumb_func_start MapObjectMovementCmd097_Step0
MapObjectMovementCmd097_Step0: ; 0x0206310C
	push {r3, lr}
	mov r1, #1
	mov r2, #7
	mov r3, #8
	bl sub_02062FAC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end MapObjectMovementCmd097_Step0

	thumb_func_start MapObjectMovementCmd098_Step0
MapObjectMovementCmd098_Step0: ; 0x0206311C
	push {r3, lr}
	mov r1, #2
	mov r2, #7
	mov r3, #8
	bl sub_02062FAC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end MapObjectMovementCmd098_Step0

	thumb_func_start MapObjectMovementCmd099_Step0
MapObjectMovementCmd099_Step0: ; 0x0206312C
	push {r3, lr}
	mov r1, #3
	mov r2, #7
	mov r3, #8
	bl sub_02062FAC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end MapObjectMovementCmd099_Step0

	thumb_func_start MapObjectMovementCmd098_Step1
MapObjectMovementCmd098_Step1: ; 0x0206313C
	push {r3, lr}
	ldr r1, _02063150 ; =_020FDA68
	bl sub_02062FEC
	cmp r0, #1
	bne _0206314C
	mov r0, #1
	pop {r3, pc}
_0206314C:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_02063150: .word _020FDA68
	thumb_func_end MapObjectMovementCmd098_Step1

	thumb_func_start MapObjectMovementCmd100_Step0
MapObjectMovementCmd100_Step0: ; 0x02063154
	push {r4, lr}
	add r4, r0, #0
	mov r1, #4
	bl sub_0205F3C0
	add r0, r4, #0
	mov r1, #9
	bl sub_0205F328
	add r0, r4, #0
	bl MapObject_IncMovementStep
	mov r0, #0
	pop {r4, pc}
	thumb_func_end MapObjectMovementCmd100_Step0

	thumb_func_start MapObjectMovementCmd100_Step1
MapObjectMovementCmd100_Step1: ; 0x02063170
	push {r4, lr}
	add r4, r0, #0
	bl sub_0205F3E4
	ldr r1, [r0]
	add r1, r1, #1
	str r1, [r0]
	cmp r1, #8
	blt _02063198
	add r0, r4, #0
	mov r1, #1
	bl MapObject_SetFacingDirection
	add r0, r4, #0
	mov r1, #0
	bl sub_0205F328
	add r0, r4, #0
	bl MapObject_IncMovementStep
_02063198:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end MapObjectMovementCmd100_Step1

	thumb_func_start MapObjectMovementCmd101_Step0
MapObjectMovementCmd101_Step0: ; 0x0206319C
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	mov r1, #4
	bl sub_0205F3C0
	add r0, r4, #0
	bl sub_0206642C
	cmp r0, #0
	beq _020631B6
	bl sub_02068B48
_020631B6:
	add r1, sp, #0
	mov r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	add r0, r4, #0
	bl MapObject_SetFacingVec
	add r0, r4, #0
	bl ov01_022000DC
	ldr r1, _020631EC ; =0x00010004
	add r0, r4, #0
	bl MapObject_SetBits
	mov r1, #1
	add r0, r4, #0
	lsl r1, r1, #0x14
	bl MapObject_ClearBits
	add r0, r4, #0
	bl MapObject_IncMovementStep
	mov r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_020631EC: .word 0x00010004
	thumb_func_end MapObjectMovementCmd101_Step0

	thumb_func_start MapObjectMovementCmd101_Step1
MapObjectMovementCmd101_Step1: ; 0x020631F0
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	bl sub_0205F3E4
	add r4, r0, #0
	ldr r0, _02063250 ; =_0210FACC
	add r1, sp, #0
	ldr r2, [r0]
	mov r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	ldr r0, [r4]
	lsl r0, r0, #2
	ldr r0, [r2, r0]
	str r0, [sp, #4]
	add r0, r5, #0
	bl MapObject_SetFacingVec
	ldr r0, [r4]
	add r0, r0, #2
	str r0, [r4]
	cmp r0, #0x10
	bhs _02063228
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, pc}
_02063228:
	mov r0, #0
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, sp, #0
	bl MapObject_SetFacingVec
	ldr r1, _02063254 ; =0x00020028
	add r0, r5, #0
	bl MapObject_SetBits
	add r0, r5, #0
	bl sub_02066438
	add r0, r5, #0
	bl MapObject_IncMovementStep
	mov r0, #1
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_02063250: .word _0210FACC
_02063254: .word 0x00020028
	thumb_func_end MapObjectMovementCmd101_Step1

	thumb_func_start MapObjectMovementCmd102_Step0
MapObjectMovementCmd102_Step0: ; 0x02063258
	push {r4, lr}
	add r4, r0, #0
	mov r1, #4
	bl sub_0205F3C0
	add r0, r4, #0
	mov r1, #0
	bl sub_0205F328
	add r0, r4, #0
	bl MapObject_IncMovementStep
	mov r0, #0
	pop {r4, pc}
	thumb_func_end MapObjectMovementCmd102_Step0

	thumb_func_start MapObjectMovementCmd104_Step0
MapObjectMovementCmd104_Step0: ; 0x02063274
	push {r4, lr}
	add r4, r0, #0
	mov r1, #4
	bl sub_0205F3C0
	add r0, r4, #0
	mov r1, #1
	bl sub_0205F328
	add r0, r4, #0
	bl MapObject_IncMovementStep
	mov r0, #0
	pop {r4, pc}
	thumb_func_end MapObjectMovementCmd104_Step0

	thumb_func_start MapObjectMovementCmd102_Step1
MapObjectMovementCmd102_Step1: ; 0x02063290
	push {r4, lr}
	add r4, r0, #0
	bl sub_0205F3E4
	ldr r1, [r0]
	add r1, r1, #1
	str r1, [r0]
	cmp r1, #0x15
	bhs _020632A6
	mov r0, #0
	pop {r4, pc}
_020632A6:
	add r0, r4, #0
	bl MapObject_IncMovementStep
	mov r0, #1
	pop {r4, pc}
	thumb_func_end MapObjectMovementCmd102_Step1

	.rodata

_020FDA1C:
	.byte 0x00, 0x50, 0x00, 0x00
	.byte 0x00, 0x60, 0x00, 0x00, 0x00, 0x50, 0x00, 0x00
_020FDA28:
	.byte 0x08, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00
sMovementScriptMachineStateFuncs:
	.word MovementScriptMachineSub_Init
	.word MovementScriptMachineSub_WaitReady
	.word MovementScriptMachineSub_SetMovementCommand
	.word MovementScriptMachineSub_WaitMovementCommand
	.word MovementScriptMachineSub_LoopCheck
	.word MovementScriptMachineSub_Done
_020FDA50:
	.byte 0x00, 0x20, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00
	.byte 0x00, 0x30, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00
_020FDA68:
	.byte 0x00, 0x25, 0x00, 0x00, 0x80, 0x24, 0x00, 0x00
	.byte 0x80, 0x24, 0x00, 0x00, 0x80, 0x24, 0x00, 0x00, 0x80, 0x24, 0x00, 0x00, 0x80, 0x24, 0x00, 0x00
	.byte 0x80, 0x24, 0x00, 0x00
	.public _020FDA84
_020FDA84:
	.byte 0x00, 0x40, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00
	.byte 0x00, 0xA0, 0x00, 0x00, 0x00, 0xB0, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00
	.byte 0x00, 0xC0, 0x00, 0x00, 0x00, 0xB0, 0x00, 0x00, 0x00, 0xA0, 0x00, 0x00, 0x00, 0x90, 0x00, 0x00
	.byte 0x00, 0x80, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
	.public _020FDAC4
_020FDAC4:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00
	.byte 0x00, 0x40, 0x00, 0x00, 0x00, 0x50, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00
	.byte 0x00, 0x60, 0x00, 0x00, 0x00, 0x50, 0x00, 0x00, 0x00, 0x50, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00
	.byte 0x00, 0x30, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
	.public _020FDB04
_020FDB04:
	.byte 0x00, 0x20, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00
	.byte 0x00, 0x80, 0x00, 0x00, 0x00, 0x90, 0x00, 0x00, 0x00, 0xA0, 0x00, 0x00, 0x00, 0xA0, 0x00, 0x00
	.byte 0x00, 0xA0, 0x00, 0x00, 0x00, 0x90, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00
	.byte 0x00, 0x50, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
