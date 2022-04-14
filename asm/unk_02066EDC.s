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

	.text

	thumb_func_start sub_02066EDC
sub_02066EDC: ; 0x02066EDC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	add r0, r2, #0
	mov r1, #0x44
	bl AllocFromHeapAtEnd
	ldr r7, [r6, #0xc]
	mov r1, #0
	mov r2, #0x44
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r7, #0
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [r4, #0xc]
	add r0, r7, #0
	bl SavArray_PlayerParty_get
	str r0, [r4]
	add r0, r7, #0
	bl Sav2_Bag_get
	str r0, [r4, #4]
	add r0, r4, #0
	mov r2, #0
	add r0, #0x25
	strb r2, [r0]
	add r0, r4, #0
	ldrb r1, [r5, #8]
	add r0, #0x24
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x36
	ldrb r1, [r0]
	mov r0, #0xf
	ldrb r3, [r5, #0xa]
	bic r1, r0
	mov r0, #0xf
	and r3, r0
	orr r3, r1
	add r1, r4, #0
	add r1, #0x36
	strb r3, [r1]
	add r1, r4, #0
	add r1, #0x36
	add r0, #0xfd
	ldrb r1, [r1]
	mov r3, #0xf0
	add r0, r6, r0
	bic r1, r3
	ldrb r3, [r5, #0xb]
	lsl r3, r3, #0x1c
	lsr r3, r3, #0x18
	orr r3, r1
	add r1, r4, #0
	add r1, #0x36
	strb r3, [r1]
	add r1, r4, #0
	ldrb r3, [r5, #0xc]
	add r1, #0x37
	strb r3, [r1]
	add r1, r4, #0
	ldrb r3, [r5, #0xd]
	add r1, #0x26
	strb r3, [r1]
	str r0, [r4, #0x20]
_02066F64:
	add r0, r5, r2
	ldrb r1, [r0, #0xe]
	add r0, r4, r2
	add r0, #0x30
	strb r1, [r0]
	add r0, r2, #1
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	cmp r2, #6
	blo _02066F64
	ldr r1, _02066F8C ; =_0210159C
	add r0, r6, #0
	add r2, r4, #0
	bl Fsys_LaunchApplication
	ldr r0, [r5, #0x14]
	str r4, [r0]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02066F8C: .word _0210159C
	thumb_func_end sub_02066EDC

	thumb_func_start sub_02066F90
sub_02066F90: ; 0x02066F90
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, r1, #0
	bl FieldSys_ApplicationIsRunning
	cmp r0, #0
	beq _02066FA2
	mov r0, #1
	pop {r3, r4, r5, pc}
_02066FA2:
	ldr r0, [r5, #0x14]
	ldr r4, [r0]
	add r0, r4, #0
	add r0, #0x26
	ldrb r0, [r0]
	cmp r0, #6
	beq _02066FBC
	cmp r0, #7
	bne _02066FC4
	mov r0, #0
	str r0, [r5]
	mov r0, #4
	pop {r3, r4, r5, pc}
_02066FBC:
	mov r0, #1
	str r0, [r5]
	mov r0, #4
	pop {r3, r4, r5, pc}
_02066FC4:
	add r0, r4, #0
	add r1, r5, #0
	add r0, #0x30
	add r1, #0xe
	mov r2, #6
	bl MI_CpuCopy8
	add r0, r4, #0
	add r0, #0x26
	ldrb r0, [r0]
	strb r0, [r5, #0xd]
	add r0, r4, #0
	bl FreeToHeap
	ldr r0, [r5, #0x14]
	mov r1, #0
	str r1, [r0]
	mov r0, #2
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02066F90

	thumb_func_start sub_02066FEC
sub_02066FEC: ; 0x02066FEC
	push {r3, r4, r5, r6, r7, lr}
	add r7, r1, #0
	add r6, r0, #0
	ldr r5, [r7, #0xc]
	add r0, r2, #0
	mov r1, #0x3c
	bl AllocFromHeapAtEnd
	mov r1, #0
	mov r2, #0x3c
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r5, #0
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [r4, #4]
	add r0, r5, #0
	bl SavArray_PlayerParty_get
	str r0, [r4]
	add r0, r5, #0
	bl SavArray_IsNatDexEnabled
	str r0, [r4, #0x1c]
	add r0, r5, #0
	bl sub_02088288
	str r0, [r4, #0x2c]
	mov r0, #1
	strb r0, [r4, #0x11]
	ldrb r0, [r6, #0xd]
	strb r0, [r4, #0x14]
	ldr r0, [r4]
	bl GetPartyCount
	strb r0, [r4, #0x13]
	mov r0, #0
	strh r0, [r4, #0x18]
	ldrb r0, [r6, #9]
	strb r0, [r4, #0x12]
	add r0, r5, #0
	bl Save_SpecialRibbons_get
	str r0, [r4, #0x20]
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r7, r0
	str r0, [r4, #0x30]
	add r0, r5, #0
	bl sub_0208828C
	str r0, [r4, #0x34]
	ldr r1, _02067080 ; =_020FE4B0
	add r0, r4, #0
	bl sub_02089D40
	add r0, r5, #0
	bl Sav2_PlayerData_GetProfileAddr
	add r1, r0, #0
	add r0, r4, #0
	bl sub_0208AD34
	ldr r1, _02067084 ; =_02103A1C
	add r0, r7, #0
	add r2, r4, #0
	bl Fsys_LaunchApplication
	ldr r0, [r6, #0x14]
	str r4, [r0]
	mov r0, #3
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02067080: .word _020FE4B0
_02067084: .word _02103A1C
	thumb_func_end sub_02066FEC

	thumb_func_start sub_02067088
sub_02067088: ; 0x02067088
	push {r4, lr}
	add r4, r0, #0
	add r0, r1, #0
	bl FieldSys_ApplicationIsRunning
	cmp r0, #0
	beq _0206709A
	mov r0, #3
	pop {r4, pc}
_0206709A:
	ldr r0, [r4, #0x14]
	ldr r0, [r0]
	ldrb r1, [r0, #0x14]
	strb r1, [r4, #0xd]
	bl FreeToHeap
	ldr r1, [r4, #0x14]
	mov r0, #0
	str r0, [r1]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02067088

	thumb_func_start sub_020670B0
sub_020670B0: ; 0x020670B0
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl TaskManager_GetSys
	add r5, r0, #0
	add r0, r4, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldr r1, [r4, #4]
	cmp r1, #4
	bhi _02067112
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_020670D4: ; jump table
	.short _020670DE - _020670D4 - 2 ; case 0
	.short _020670EA - _020670D4 - 2 ; case 1
	.short _020670F4 - _020670D4 - 2 ; case 2
	.short _02067100 - _020670D4 - 2 ; case 3
	.short _0206710A - _020670D4 - 2 ; case 4
_020670DE:
	add r1, r5, #0
	mov r2, #0xb
	bl sub_02066EDC
	str r0, [r4, #4]
	b _02067112
_020670EA:
	add r1, r5, #0
	bl sub_02066F90
	str r0, [r4, #4]
	b _02067112
_020670F4:
	add r1, r5, #0
	mov r2, #0xb
	bl sub_02066FEC
	str r0, [r4, #4]
	b _02067112
_02067100:
	add r1, r5, #0
	bl sub_02067088
	str r0, [r4, #4]
	b _02067112
_0206710A:
	bl FreeToHeap
	mov r0, #1
	pop {r3, r4, r5, pc}
_02067112:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_020670B0

	thumb_func_start sub_02067118
sub_02067118: ; 0x02067118
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	bl TaskManager_GetSys
	str r0, [sp]
	mov r0, #0xb
	mov r1, #0x18
	bl AllocFromHeap
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x18
	bl MI_CpuFill8
	strb r6, [r4, #8]
	strb r7, [r4, #9]
	add r0, sp, #8
	ldrb r1, [r0, #0x10]
	add r2, r4, #0
	strb r1, [r4, #0xa]
	ldrb r1, [r0, #0x14]
	strb r1, [r4, #0xb]
	ldrb r1, [r0, #0x18]
	strb r1, [r4, #0xc]
	ldrb r0, [r0, #0x1c]
	ldr r1, _02067160 ; =sub_020670B0
	strb r0, [r4, #0xd]
	ldr r0, [sp]
	str r5, [r4, #0x14]
	ldr r0, [r0, #0x10]
	bl TaskManager_Call
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02067160: .word sub_020670B0
	thumb_func_end sub_02067118

	thumb_func_start sub_02067164
sub_02067164: ; 0x02067164
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r0, #0
	ldr r0, [r5, #0xc]
	bl sub_0203A05C
	cmp r0, #0
	beq _02067184
	ldrh r1, [r4, #0x12]
	ldrh r2, [r4, #0x14]
	add r0, r5, #0
	bl sub_0203F8EC
	str r0, [r4, #8]
	mov r0, #1
	pop {r3, r4, r5, pc}
_02067184:
	mov r0, #1
	str r0, [r4]
	mov r0, #2
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02067164

	thumb_func_start sub_0206718C
sub_0206718C: ; 0x0206718C
	push {r4, lr}
	add r4, r0, #0
	add r0, r1, #0
	bl FieldSys_ApplicationIsRunning
	cmp r0, #0
	beq _0206719E
	mov r0, #1
	pop {r4, pc}
_0206719E:
	ldr r0, [r4, #8]
	ldr r0, [r0, #0x20]
	str r0, [r4]
	ldr r0, [r4, #8]
	bl FreeToHeap
	mov r0, #2
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0206718C

	thumb_func_start sub_020671B0
sub_020671B0: ; 0x020671B0
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl TaskManager_GetSys
	add r5, r0, #0
	add r0, r4, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	beq _020671D2
	cmp r1, #1
	beq _020671DC
	cmp r1, #2
	beq _020671E6
	b _020671FC
_020671D2:
	add r1, r5, #0
	bl sub_02067164
	str r0, [r4, #4]
	b _020671FC
_020671DC:
	add r1, r5, #0
	bl sub_0206718C
	str r0, [r4, #4]
	b _020671FC
_020671E6:
	ldrh r1, [r4, #0x10]
	add r0, r5, #0
	bl GetVarPointer
	ldr r1, [r4]
	strh r1, [r0]
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #1
	pop {r3, r4, r5, pc}
_020671FC:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_020671B0

	thumb_func_start sub_02067200
sub_02067200: ; 0x02067200
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	bl TaskManager_GetSys
	str r0, [sp]
	mov r0, #0xb
	mov r1, #0x18
	bl AllocFromHeap
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x18
	bl MI_CpuFill8
	strh r5, [r4, #0x12]
	strh r7, [r4, #0x14]
	ldr r0, [sp]
	strh r6, [r4, #0x10]
	ldr r0, [r0, #0x10]
	ldr r1, _02067234 ; =sub_020671B0
	add r2, r4, #0
	bl TaskManager_Call
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02067234: .word sub_020671B0
	thumb_func_end sub_02067200

	thumb_func_start sub_02067238
sub_02067238: ; 0x02067238
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	bl TaskManager_GetSys
	add r6, r0, #0
	add r0, r4, #0
	bl TaskManager_GetEnv
	add r5, r0, #0
	bl sub_0203769C
	mov r1, #1
	sub r0, r1, r0
	bl sub_02037C44
	add r7, r0, #0
	bne _0206725E
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0206725E:
	ldrh r1, [r5, #2]
	add r0, r6, #0
	bl GetVarPointer
	add r4, r0, #0
	ldrh r0, [r5]
	cmp r0, #0
	beq _02067278
	cmp r0, #1
	beq _02067284
	cmp r0, #2
	beq _02067290
	b _0206729A
_02067278:
	add r0, r6, #0
	add r1, r7, #0
	bl sub_0204B610
	strh r0, [r4]
	b _0206729A
_02067284:
	add r0, r6, #0
	add r1, r7, #0
	bl sub_0204B66C
	strh r0, [r4]
	b _0206729A
_02067290:
	add r0, r6, #0
	add r1, r7, #0
	bl sub_0204B690
	strh r0, [r4]
_0206729A:
	add r0, r5, #0
	bl FreeToHeap
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02067238

	thumb_func_start sub_020672A4
sub_020672A4: ; 0x020672A4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r6, r2, #0
	bl TaskManager_GetSys
	add r7, r0, #0
	mov r0, #0xb
	mov r1, #4
	bl AllocFromHeap
	add r4, r0, #0
	mov r1, #0
	mov r2, #4
	bl MI_CpuFill8
	strh r5, [r4]
	strh r6, [r4, #2]
	ldr r0, [r7, #0x10]
	ldr r1, _020672D4 ; =sub_02067238
	add r2, r4, #0
	bl TaskManager_Call
	pop {r3, r4, r5, r6, r7, pc}
	nop
_020672D4: .word sub_02067238
	thumb_func_end sub_020672A4

	thumb_func_start sub_020672D8
sub_020672D8: ; 0x020672D8
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	bl sub_0203107C
	mov r1, #0
	mov r2, #0xff
	bl sub_020310BC
	str r0, [sp]
	cmp r0, #0x14
	bhs _020672F2
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_020672F2:
	add r0, r4, #0
	bl Save_FrontierData_get
	mov r1, #0xd
	mov r2, #0
	add r4, r0, #0
	bl sub_0202D5DC
	lsl r0, r0, #0x18
	mov r1, #0
	lsr r7, r0, #0x18
	add r0, r4, #0
	add r2, r1, #0
	bl sub_0202D5DC
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	add r0, r4, #0
	mov r1, #1
	mov r2, #0
	bl sub_0202D5DC
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	add r0, r4, #0
	mov r1, #0xe
	mov r2, #0
	bl sub_0202D5DC
	add r0, r4, #0
	mov r1, #2
	mov r2, #0
	bl sub_0202D5DC
	add r0, r4, #0
	mov r1, #3
	mov r2, #0
	bl sub_0202D5DC
	cmp r7, #0
	beq _02067350
	cmp r6, #0
	beq _02067350
	cmp r5, #0
	beq _02067350
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02067350:
	cmp r7, #0
	bne _02067362
	add r0, r4, #0
	mov r1, #0xd
	mov r2, #1
	bl sub_0202D5DC
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02067362:
	ldr r0, [sp]
	cmp r0, #0x32
	bhs _0206736C
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0206736C:
	cmp r6, #0
	bne _0206737E
	add r0, r4, #0
	mov r1, #0
	mov r2, #1
	bl sub_0202D5DC
	mov r0, #2
	pop {r3, r4, r5, r6, r7, pc}
_0206737E:
	cmp r0, #0x64
	blo _02067386
	cmp r5, #0
	beq _0206738A
_02067386:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0206738A:
	mov r1, #1
	add r0, r4, #0
	add r2, r1, #0
	bl sub_0202D5DC
	mov r0, #3
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_020672D8

	thumb_func_start sub_02067398
sub_02067398: ; 0x02067398
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r4, r0, #0
	bl sub_0203107C
	mov r1, #0
	mov r2, #0xff
	bl sub_020310BC
	str r0, [sp, #8]
	cmp r0, #0x14
	bhs _020673B6
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_020673B6:
	add r0, r4, #0
	bl Save_FrontierData_get
	mov r1, #0xd
	mov r2, #0
	add r7, r0, #0
	bl sub_0202D5DC
	lsl r0, r0, #0x18
	mov r1, #0
	lsr r6, r0, #0x18
	add r0, r7, #0
	add r2, r1, #0
	bl sub_0202D5DC
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	add r0, r7, #0
	mov r1, #1
	mov r2, #0
	bl sub_0202D5DC
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	add r0, r7, #0
	mov r1, #0xe
	mov r2, #0
	bl sub_0202D5DC
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	add r0, r7, #0
	mov r1, #2
	mov r2, #0
	bl sub_0202D5DC
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	add r0, r7, #0
	mov r1, #3
	mov r2, #0
	bl sub_0202D5DC
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	cmp r6, #0
	beq _02067426
	cmp r4, #0
	beq _02067426
	cmp r5, #0
	beq _02067426
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_02067426:
	cmp r6, #0
	bne _0206743C
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _02067436
	add sp, #0xc
	mov r0, #4
	pop {r4, r5, r6, r7, pc}
_02067436:
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_0206743C:
	ldr r0, [sp, #8]
	cmp r0, #0x32
	bhs _02067448
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_02067448:
	cmp r4, #0
	bne _0206745E
	ldr r0, [sp]
	cmp r0, #0
	beq _02067458
	add sp, #0xc
	mov r0, #5
	pop {r4, r5, r6, r7, pc}
_02067458:
	add sp, #0xc
	mov r0, #2
	pop {r4, r5, r6, r7, pc}
_0206745E:
	cmp r0, #0x64
	bhs _02067468
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_02067468:
	cmp r5, #0
	beq _02067472
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_02067472:
	cmp r1, #0
	beq _0206747C
	add sp, #0xc
	mov r0, #6
	pop {r4, r5, r6, r7, pc}
_0206747C:
	mov r0, #3
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02067398

	thumb_func_start sub_02067484
sub_02067484: ; 0x02067484
	add r0, #0xa0
	ldr r0, [r0]
	ldr r2, [r1]
	ldrh r3, [r0, #0x24]
	add r2, r3, r2
	strh r2, [r0, #0x24]
	ldrh r3, [r0, #0x28]
	ldr r2, [r1, #4]
	add r2, r3, r2
	strh r2, [r0, #0x28]
	ldrh r2, [r0, #0x26]
	ldr r1, [r1, #8]
	add r1, r2, r1
	strh r1, [r0, #0x26]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02067484

	thumb_func_start sub_020674A4
sub_020674A4: ; 0x020674A4
	ldr r1, _020674AC ; =0x02E90EDD
	mul r1, r0
	add r0, r1, #1
	bx lr
	.balign 4, 0
_020674AC: .word 0x02E90EDD
	thumb_func_end sub_020674A4

	thumb_func_start sub_020674B0
sub_020674B0: ; 0x020674B0
	ldr r1, _020674B8 ; =0x5D588B65
	mul r1, r0
	add r0, r1, #1
	bx lr
	.balign 4, 0
_020674B8: .word 0x5D588B65
	thumb_func_end sub_020674B0

	thumb_func_start sub_020674BC
sub_020674BC: ; 0x020674BC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl Save_FriendGroup_get
	bl sub_0202C7DC
	bl sub_020674B0
	add r4, r0, #0
	add r0, r5, #0
	bl Save_FrontierData_get
	add r1, r4, #0
	bl sub_0202D638
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_020674BC

	thumb_func_start sub_020674E0
sub_020674E0: ; 0x020674E0
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	bl Save_FrontierData_get
	add r6, r0, #0
	bl sub_0202D63C
	bl sub_020674B0
	add r4, r0, #0
	add r0, r6, #0
	add r1, r4, #0
	bl sub_0202D638
	add r0, r4, #0
	bl sub_020674A4
	str r0, [sp]
	add r0, r5, #0
	bl sub_0202D908
	mov r1, #0xa
	add r2, sp, #0
	bl sub_0202D308
	ldr r0, [sp]
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_020674E0

	thumb_func_start sub_0206751C
sub_0206751C: ; 0x0206751C
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r6, r0, #0
	bl Save_FrontierData_get
	add r4, r0, #0
	add r0, r6, #0
	bl sub_0202D908
	add r5, r0, #0
	add r0, r4, #0
	bl sub_0202D63C
	bl sub_020674A4
	mov r1, #0
	str r0, [sp]
	add r0, r5, #0
	add r2, r1, #0
	bl sub_0202D284
	add r1, r0, #0
	lsl r1, r1, #0x10
	add r0, r4, #0
	lsr r1, r1, #0x10
	mov r2, #0
	bl sub_0202D57C
	mov r1, #0x18
	add r5, r0, #0
	mul r5, r1
	mov r4, #0
	cmp r5, #0
	ble _0206756E
	ldr r0, [sp]
_02067562:
	bl sub_020674A4
	add r4, r4, #1
	str r0, [sp]
	cmp r4, r5
	blt _02067562
_0206756E:
	add r0, r6, #0
	bl sub_0202D908
	mov r1, #0xa
	add r2, sp, #0
	bl sub_0202D308
	ldr r0, [sp]
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0206751C

	thumb_func_start sub_02067584
sub_02067584: ; 0x02067584
	ldr r0, [r0, #0x20]
	ldr r1, [r0]
	ldr r0, _02067598 ; =MAP_D31R0207
	cmp r1, r0
	bne _02067592
	mov r0, #1
	bx lr
_02067592:
	mov r0, #0
	bx lr
	nop
_02067598: .word MAP_D31R0207
	thumb_func_end sub_02067584

	thumb_func_start sub_0206759C
sub_0206759C: ; 0x0206759C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	str r1, [sp]
	cmp r1, #0
	ble _02067606
	bl Save_TrainerCard_get
	bl TrainerCard_GetBadgeShininessArr
	add r4, r0, #0
	add r0, r5, #0
	bl Sav2_PlayerData_GetProfileAddr
	add r7, r0, #0
	ldr r0, [sp]
	mov r1, #0xa
	add r6, r0, #0
	mov r5, #0
	mul r6, r1
_020675C2:
	add r0, r7, #0
	add r1, r5, #0
	bl PlayerProfile_TestBadgeFlag
	cmp r0, #0
	beq _020675FC
	add r0, r5, #0
	add r1, r4, #0
	bl GetShininessOfBadgeI
	add r1, r0, #0
	cmp r1, #0
	ble _020675E4
	cmp r1, #0xc8
	bge _020675E4
	sub r1, r1, r6
	b _020675EE
_020675E4:
	cmp r1, #0xc8
	blt _020675EC
	bl GF_AssertFail
_020675EC:
	mov r1, #0
_020675EE:
	cmp r1, #0
	bge _020675F4
	mov r1, #0
_020675F4:
	add r0, r5, #0
	add r2, r4, #0
	bl SetShininessOfBadgeI
_020675FC:
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #8
	blo _020675C2
_02067606:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0206759C

	.rodata

_020FE4B0:
	.byte 0x00, 0x01, 0x02, 0x03, 0x04
	.balign 4, 0
