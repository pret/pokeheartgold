#include "constants/species.h"
#include "constants/sndseq.h"
#include "constants/maps.h"
#include "constants/flypoints.h"
#include "constants/items.h"
#include "constants/phone_contacts.h"
#include "constants/flags.h"
#include "msgdata/msg/msg_0271.h"
#include "msgdata/msg/msg_0416.h"
#include "msgdata/msg/msg_0411.h"
#include "msgdata/msg/msg_0640.h"
#include "msgdata/msg/msg_0664.h"
	.include "asm/macros.inc"
	.include "overlay_101.inc"
	.include "global.inc"

	.text

	thumb_func_start PokegearMap_Init
PokegearMap_Init: ; 0x021E7740
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl OverlayManager_GetArgs
	add r5, r0, #0
	ldr r0, _021E7790 ; =FS_OVERLAY_ID(OVY_26)
	mov r1, #2
	bl HandleLoadOverlay
	mov r0, #3
	mov r1, #0x5b
	lsl r2, r0, #0x10
	bl CreateHeap
	ldr r1, _021E7794 ; =0x000009F4
	add r0, r4, #0
	mov r2, #0x5b
	bl OverlayManager_CreateAndGetData
	ldr r2, _021E7794 ; =0x000009F4
	add r4, r0, #0
	mov r1, #0
	bl memset
	str r5, [r4, #0x10]
	mov r0, #0x5b
	str r0, [r4]
	add r0, r4, #0
	bl ov101_021E78EC
	mov r0, #0x85
	ldr r1, _021E7798 ; =ov101_021F7372
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r1, #0x64
	add r0, r1, #0
	add r0, #0xd2
	strb r1, [r4, r0]
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E7790: .word FS_OVERLAY_ID(OVY_26)
_021E7794: .word 0x000009F4
_021E7798: .word ov101_021F7372
	thumb_func_end PokegearMap_Init

	thumb_func_start PokegearMap_Main
PokegearMap_Main: ; 0x021E779C
	push {r4, lr}
	add r4, r1, #0
	bl OverlayManager_GetData
	ldr r1, [r4]
	cmp r1, #0xd
	bhi _021E782E
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021E77B6: ; jump table
	.short _021E77D2 - _021E77B6 - 2 ; case 0
	.short _021E77DA - _021E77B6 - 2 ; case 1
	.short _021E77E2 - _021E77B6 - 2 ; case 2
	.short _021E782E - _021E77B6 - 2 ; case 3
	.short _021E77EA - _021E77B6 - 2 ; case 4
	.short _021E77F2 - _021E77B6 - 2 ; case 5
	.short _021E77FA - _021E77B6 - 2 ; case 6
	.short _021E7802 - _021E77B6 - 2 ; case 7
	.short _021E780A - _021E77B6 - 2 ; case 8
	.short _021E7812 - _021E77B6 - 2 ; case 9
	.short _021E781A - _021E77B6 - 2 ; case 10
	.short _021E7822 - _021E77B6 - 2 ; case 11
	.short _021E782E - _021E77B6 - 2 ; case 12
	.short _021E782A - _021E77B6 - 2 ; case 13
_021E77D2:
	bl ov101_021E7B90
	str r0, [r4]
	b _021E782E
_021E77DA:
	bl ov101_021E7BB4
	str r0, [r4]
	b _021E782E
_021E77E2:
	bl ov101_021E7C10
	str r0, [r4]
	b _021E782E
_021E77EA:
	bl ov101_021E7D50
	str r0, [r4]
	b _021E782E
_021E77F2:
	bl ov101_021E7E28
	str r0, [r4]
	b _021E782E
_021E77FA:
	bl ov101_021E7E98
	str r0, [r4]
	b _021E782E
_021E7802:
	bl ov101_021E7F20
	str r0, [r4]
	b _021E782E
_021E780A:
	bl ov101_021E7C38
	str r0, [r4]
	b _021E782E
_021E7812:
	bl ov101_021E7C4C
	str r0, [r4]
	b _021E782E
_021E781A:
	bl ov101_021E7D28
	str r0, [r4]
	b _021E782E
_021E7822:
	bl ov101_021E7D3C
	str r0, [r4]
	b _021E782E
_021E782A:
	mov r0, #1
	pop {r4, pc}
_021E782E:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end PokegearMap_Main

	thumb_func_start PokegearMap_Exit
PokegearMap_Exit: ; 0x021E7834
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	bl ov101_021E7B54
	ldr r0, [r4, #0x38]
	bl MapMatrix_MapData_Free
	ldr r2, [r4, #0x10]
	ldr r0, [r2, #0x1c]
	cmp r0, #6
	beq _021E7858
	ldrb r1, [r2, #5]
	mov r0, #0x80
	orr r0, r1
	strb r0, [r2, #5]
_021E7858:
	ldr r4, [r4]
	add r0, r5, #0
	bl OverlayManager_FreeData
	add r0, r4, #0
	bl DestroyHeap
	ldr r0, _021E7870 ; =FS_OVERLAY_ID(OVY_26)
	bl UnloadOverlayByID
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E7870: .word FS_OVERLAY_ID(OVY_26)
	thumb_func_end PokegearMap_Exit

	thumb_func_start ov101_021E7874
ov101_021E7874: ; 0x021E7874
	push {r3, r4}
	sub sp, #8
	ldr r3, _021E78AC ; =_021F7358
	add r2, sp, #0
	ldrh r4, [r3, #6]
	add r1, sp, #0
	strh r4, [r2]
	ldrh r4, [r3, #8]
	ldrh r3, [r3, #0xa]
	strh r4, [r2, #2]
	strh r3, [r2, #4]
	mov r3, #0
_021E788C:
	ldrh r2, [r1]
	cmp r0, r2
	bne _021E789A
	add sp, #8
	mov r0, #1
	pop {r3, r4}
	bx lr
_021E789A:
	add r3, r3, #1
	add r1, r1, #2
	cmp r3, #3
	blo _021E788C
	mov r0, #0
	add sp, #8
	pop {r3, r4}
	bx lr
	nop
_021E78AC: .word _021F7358
	thumb_func_end ov101_021E7874

	thumb_func_start ov101_021E78B0
ov101_021E78B0: ; 0x021E78B0
	push {r3, r4}
	sub sp, #0x10
	ldr r4, _021E78E8 ; =ov101_021F7364
	add r3, sp, #0
	mov r2, #7
_021E78BA:
	ldrh r1, [r4]
	add r4, r4, #2
	strh r1, [r3]
	add r3, r3, #2
	sub r2, r2, #1
	bne _021E78BA
	mov r2, #0
	add r3, sp, #0
_021E78CA:
	ldrh r1, [r3]
	cmp r0, r1
	bne _021E78D8
	add sp, #0x10
	mov r0, #1
	pop {r3, r4}
	bx lr
_021E78D8:
	add r2, r2, #1
	add r3, r3, #2
	cmp r2, #7
	blo _021E78CA
	mov r0, #0
	add sp, #0x10
	pop {r3, r4}
	bx lr
	.balign 4, 0
_021E78E8: .word ov101_021F7364
	thumb_func_end ov101_021E78B0

	thumb_func_start ov101_021E78EC
ov101_021E78EC: ; 0x021E78EC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r1, [r5, #0x10]
	ldr r2, _021E7B3C ; =ov101_021EB338
	str r5, [r1, #0x64]
	ldr r1, [r5, #0x10]
	str r2, [r1, #0x5c]
	ldr r2, _021E7B40 ; =ov101_021EB2FC
	ldr r1, [r5, #0x10]
	str r2, [r1, #0x60]
	bl ov101_021ED4E0
	ldr r0, [r5, #0x10]
	ldrb r0, [r0, #4]
	cmp r0, #4
	beq _021E7936
	mov r0, #0
	strb r0, [r5, #0xc]
	ldr r0, [r5, #0x10]
	mov r1, #2
	strb r1, [r0, #4]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x28]
	bl sub_0202EEA4
	mov r3, #0x4e
	lsl r3, r3, #2
	ldrb r1, [r5, r3]
	mov r2, #1
	lsl r0, r0, #0x18
	bic r1, r2
	lsr r2, r0, #0x18
	mov r0, #1
	and r0, r2
	orr r0, r1
	strb r0, [r5, r3]
	b _021E799A
_021E7936:
	mov r0, #1
	strb r0, [r5, #0xc]
	ldr r3, [r5, #0x10]
	add r2, r5, #0
	add r3, #0x3c
	add r2, #0x14
	mov r1, #0xe
_021E7944:
	ldrh r0, [r3]
	add r3, r3, #2
	strh r0, [r2]
	add r2, r2, #2
	sub r1, r1, #1
	bne _021E7944
	mov r1, #0x4e
	lsl r1, r1, #2
	ldrb r3, [r5, r1]
	ldrb r2, [r5, #0x15]
	mov r0, #1
	bic r3, r0
	mov r0, #1
	and r0, r2
	orr r0, r3
	strb r0, [r5, r1]
	ldrh r1, [r5, #0x2e]
	ldr r0, _021E7B44 ; =0x0000FFFF
	cmp r1, r0
	beq _021E798C
	ldrh r1, [r5, #0x2c]
	add r0, r5, #0
	bl ov101_021ED614
	cmp r0, #0
	bne _021E7980
	ldrh r1, [r5, #0x2c]
	add r0, r5, #0
	bl ov101_021ED64C
_021E7980:
	ldrh r1, [r5, #0x16]
	ldrh r2, [r5, #0x2e]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl ov101_021ED79C
_021E798C:
	ldr r0, [r5, #0x10]
	mov r1, #0
	add r0, #0x38
	strb r1, [r0]
	ldr r0, [r5, #0x10]
	mov r1, #2
	strb r1, [r0, #4]
_021E799A:
	mov r1, #0x4e
	lsl r1, r1, #2
	ldrb r2, [r5, r1]
	mov r0, #0x10
	bic r2, r0
	strb r2, [r5, r1]
	ldrb r2, [r5, r1]
	mov r0, #0xe
	bic r2, r0
	strb r2, [r5, r1]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x28]
	bl Pokegear_GetMapUnlockLevel
	mov r2, #0x4e
	lsl r2, r2, #2
	lsl r0, r0, #0x1e
	ldrb r3, [r5, r2]
	mov r1, #0x60
	lsr r0, r0, #0x19
	bic r3, r1
	orr r0, r3
	strb r0, [r5, r2]
	ldr r0, [r5]
	bl MapMatrix_MapData_New
	str r0, [r5, #0x38]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x24]
	bl SaveData_GetPhoneCallPersistentState
	mov r1, #0x49
	lsl r1, r1, #2
	str r0, [r5, r1]
	ldr r0, [r5]
	bl AllocAndReadPhoneBook
	mov r1, #0x4a
	lsl r1, r1, #2
	str r0, [r5, r1]
	ldr r0, [r5, #0x10]
	ldr r1, [r5]
	ldr r0, [r0, #0x28]
	bl SavePokegear_AllocAndCopyPhonebook
	mov r1, #0x4b
	lsl r1, r1, #2
	str r0, [r5, r1]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x28]
	bl SavePokegear_FindEmptyPhonebookSlot
	mov r2, #0x13
	lsl r2, r2, #4
	strb r0, [r5, r2]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x20]
	add r0, #0x22
	ldrb r1, [r0]
	add r0, r2, #0
	sub r0, #0x28
	strh r1, [r5, r0]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x20]
	add r0, #0x23
	ldrb r0, [r0]
	add r1, r0, #2
	add r0, r2, #0
	sub r0, #0x26
	strh r1, [r5, r0]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x20]
	ldrh r1, [r0, #0x10]
	add r0, r2, #0
	sub r0, #0x24
	strh r1, [r5, r0]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x20]
	ldrb r1, [r0, #7]
	add r0, r2, #0
	sub r0, #0x22
	strh r1, [r5, r0]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x20]
	add r0, #0x22
	ldrb r1, [r0]
	add r0, r2, #0
	sub r0, #0x20
	strh r1, [r5, r0]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x20]
	add r0, #0x23
	ldrb r0, [r0]
	add r1, r0, #2
	add r0, r2, #0
	sub r0, #0x1e
	strh r1, [r5, r0]
	mov r1, #1
	add r0, r1, #0
	add r0, #0xff
	strh r1, [r5, r0]
	add r0, r2, #0
	sub r0, #0x2c
	strh r1, [r5, r0]
	add r0, r2, #0
	add r0, #8
	ldrb r0, [r5, r0]
	lsl r0, r0, #0x19
	lsr r0, r0, #0x1e
	lsl r1, r0, #1
	ldr r0, _021E7B48 ; =_021F7358
	ldrh r1, [r0, r1]
	add r0, r2, #0
	sub r0, #0x2e
	strh r1, [r5, r0]
	mov r1, #0x11
	add r0, r1, #0
	add r0, #0xf5
	strh r1, [r5, r0]
	mov r1, #8
	add r0, r2, #1
	strb r1, [r5, r0]
	add r0, r2, #2
	strb r1, [r5, r0]
	mov r1, #0
	add r0, r2, #3
	strb r1, [r5, r0]
	add r0, r2, #0
	add r0, #0xd
	ldrb r0, [r5, r0]
	mov r1, #2
	add r2, #0xd
	orr r0, r1
	strb r0, [r5, r2]
	ldr r0, [r5, #0x10]
	mov r2, #0xf
	ldr r0, [r0, #0x2c]
	bl Save_VarsFlags_FlypointFlagAction
	ldr r3, _021E7B4C ; =0x0000013D
	mov r2, #1
	ldrb r1, [r5, r3]
	lsl r0, r0, #0x18
	bic r1, r2
	lsr r2, r0, #0x18
	mov r0, #1
	and r0, r2
	orr r0, r1
	strb r0, [r5, r3]
	sub r3, #0x31
	ldrh r0, [r5, r3]
	bl ov101_021E7874
	ldr r3, _021E7B4C ; =0x0000013D
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	lsl r0, r0, #0x1f
	ldrb r1, [r5, r3]
	mov r2, #4
	lsr r0, r0, #0x1d
	bic r1, r2
	orr r0, r1
	strb r0, [r5, r3]
	sub r3, #0x31
	ldrh r0, [r5, r3]
	bl ov101_021E78B0
	ldr r3, _021E7B4C ; =0x0000013D
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	lsl r0, r0, #0x1f
	ldrb r1, [r5, r3]
	mov r2, #8
	lsr r0, r0, #0x1c
	bic r1, r2
	orr r0, r1
	strb r0, [r5, r3]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x24]
	bl Save_Roamers_Get
	mov r4, #0
	add r6, r0, #0
	add r7, r4, #0
_021E7B0A:
	lsl r1, r4, #0x18
	add r0, r6, #0
	lsr r1, r1, #0x18
	bl GetRoamerIsActiveByIndex
	cmp r0, #0
	beq _021E7B2E
	lsl r1, r4, #0x18
	add r0, r6, #0
	lsr r1, r1, #0x18
	bl Roamers_GetRoamMonStats
	mov r1, #1
	bl GetRoamerData
	ldr r1, _021E7B50 ; =0x000009E8
	strh r0, [r5, r1]
	b _021E7B32
_021E7B2E:
	ldr r0, _021E7B50 ; =0x000009E8
	strh r7, [r5, r0]
_021E7B32:
	add r4, r4, #1
	add r5, r5, #2
	cmp r4, #4
	blt _021E7B0A
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E7B3C: .word ov101_021EB338
_021E7B40: .word ov101_021EB2FC
_021E7B44: .word 0x0000FFFF
_021E7B48: .word _021F7358
_021E7B4C: .word 0x0000013D
_021E7B50: .word 0x000009E8
	thumb_func_end ov101_021E78EC

	thumb_func_start ov101_021E7B54
ov101_021E7B54: ; 0x021E7B54
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x4b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl FreeToHeap
	mov r0, #0x4a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl FreePhoneBook
	ldr r0, [r4, #0x10]
	mov r1, #0
	str r1, [r0, #0x5c]
	ldr r0, [r4, #0x10]
	str r1, [r0, #0x60]
	add r0, r4, #0
	bl ov101_021ED5AC
	mov r1, #0x4e
	lsl r1, r1, #2
	ldrb r1, [r4, r1]
	ldr r0, [r4, #0x10]
	lsl r1, r1, #0x1f
	ldr r0, [r0, #0x28]
	lsr r1, r1, #0x1f
	bl sub_0202EEA8
	pop {r4, pc}
	thumb_func_end ov101_021E7B54

	thumb_func_start ov101_021E7B90
ov101_021E7B90: ; 0x021E7B90
	push {r4, lr}
	add r4, r0, #0
	bl ov101_021E7FF4
	cmp r0, #0
	bne _021E7BA0
	mov r0, #0
	pop {r4, pc}
_021E7BA0:
	ldr r0, [r4, #0x10]
	ldrb r0, [r0, #5]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1f
	beq _021E7BAE
	mov r0, #6
	pop {r4, pc}
_021E7BAE:
	mov r0, #4
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov101_021E7B90

	thumb_func_start ov101_021E7BB4
ov101_021E7BB4: ; 0x021E7BB4
	push {r3, r4, lr}
	sub sp, #4
	mov r1, #0
	str r1, [sp]
	add r1, sp, #0
	add r4, r0, #0
	bl ov101_021EB5DC
	ldr r1, [sp]
	cmp r1, #0
	bne _021E7BE4
	ldr r0, [r4, #0x10]
	bl PokegearApp_HandleInputModeChangeToButtons
	ldr r0, [r4, #0x10]
	ldrb r1, [r0, #6]
	cmp r1, #1
	bne _021E7BDE
	bl PokegearApp_HandleKeyInput_SwitchApps
	b _021E7BE4
_021E7BDE:
	add r0, r4, #0
	bl ov101_021EB568
_021E7BE4:
	ldr r1, [r4, #0x10]
	str r0, [r1, #0x1c]
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _021E7C0A
	cmp r0, #4
	beq _021E7BFE
	cmp r0, #7
	bne _021E7C04
	add sp, #4
	mov r0, #8
	pop {r3, r4, pc}
_021E7BFE:
	add sp, #4
	mov r0, #5
	pop {r3, r4, pc}
_021E7C04:
	add sp, #4
	mov r0, #7
	pop {r3, r4, pc}
_021E7C0A:
	mov r0, #1
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov101_021E7BB4

	thumb_func_start ov101_021E7C10
ov101_021E7C10: ; 0x021E7C10
	push {r4, lr}
	add r4, r0, #0
	bl ov101_021E8070
	cmp r0, #0
	bne _021E7C20
	mov r0, #2
	pop {r4, pc}
_021E7C20:
	ldr r2, [r4, #0x10]
	add r4, #0x14
	add r2, #0x3c
	mov r1, #0xe
_021E7C28:
	ldrh r0, [r4]
	add r4, r4, #2
	strh r0, [r2]
	add r2, r2, #2
	sub r1, r1, #1
	bne _021E7C28
	mov r0, #0xd
	pop {r4, pc}
	thumb_func_end ov101_021E7C10

	thumb_func_start ov101_021E7C38
ov101_021E7C38: ; 0x021E7C38
	push {r3, lr}
	bl ov101_021E80B4
	cmp r0, #0
	beq _021E7C46
	mov r0, #9
	pop {r3, pc}
_021E7C46:
	mov r0, #8
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov101_021E7C38

	thumb_func_start ov101_021E7C4C
ov101_021E7C4C: ; 0x021E7C4C
	push {r3, r4, r5, lr}
	mov r1, #0
	str r1, [sp]
	mov r1, #0x4f
	add r5, r0, #0
	lsl r1, r1, #2
	ldrb r1, [r5, r1]
	mov r4, #0
	mvn r4, r4
	lsl r1, r1, #0x19
	lsr r1, r1, #0x19
	beq _021E7C6E
	cmp r1, #1
	beq _021E7C78
	cmp r1, #2
	beq _021E7C8C
	b _021E7C9E
_021E7C6E:
	add r1, sp, #0
	bl ov101_021ECC58
	add r4, r0, #0
	b _021E7C9E
_021E7C78:
	ldr r1, [r5, #0x10]
	ldr r1, [r1, #0xc]
	cmp r1, #0
	beq _021E7C9E
	bl ov101_021ECF98
	add r4, r0, #0
	mov r0, #1
	str r0, [sp]
	b _021E7C9E
_021E7C8C:
	ldr r1, [r5, #0x10]
	ldr r1, [r1, #0xc]
	cmp r1, #0
	beq _021E7C9E
	bl ov101_021ED2C0
	add r4, r0, #0
	mov r0, #1
	str r0, [sp]
_021E7C9E:
	ldr r0, [sp]
	cmp r0, #0
	ldr r0, [r5, #0x10]
	beq _021E7CC4
	ldr r0, [r0, #0xc]
	cmp r0, #1
	beq _021E7CB2
	add r0, r5, #0
	bl ov101_021EB364
_021E7CB2:
	ldr r0, [r5, #0x10]
	mov r1, #1
	str r1, [r0, #0xc]
	cmp r4, #0
	blt _021E7CC0
	add r0, r4, #0
	pop {r3, r4, r5, pc}
_021E7CC0:
	mov r0, #9
	pop {r3, r4, r5, pc}
_021E7CC4:
	bl PokegearApp_HandleInputModeChangeToButtons
	cmp r0, #0
	beq _021E7CE6
	ldr r0, [r5, #0x10]
	ldr r1, [r0, #0xc]
	ldr r0, [r0, #0x10]
	cmp r1, r0
	beq _021E7CE6
	add r0, r5, #0
	bl ov101_021EB378
	ldr r0, _021E7D24 ; =0x0000093F
	bl PlaySE
	mov r0, #9
	pop {r3, r4, r5, pc}
_021E7CE6:
	mov r0, #0x4f
	lsl r0, r0, #2
	ldrb r0, [r5, r0]
	lsl r0, r0, #0x19
	lsr r0, r0, #0x19
	beq _021E7CFC
	cmp r0, #1
	beq _021E7D06
	cmp r0, #2
	beq _021E7D10
	b _021E7D18
_021E7CFC:
	add r0, r5, #0
	bl ov101_021ECAF0
	add r4, r0, #0
	b _021E7D18
_021E7D06:
	add r0, r5, #0
	bl ov101_021ECEA8
	add r4, r0, #0
	b _021E7D18
_021E7D10:
	add r0, r5, #0
	bl ov101_021ED158
	add r4, r0, #0
_021E7D18:
	cmp r4, #0
	bge _021E7D1E
	mov r4, #9
_021E7D1E:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_021E7D24: .word 0x0000093F
	thumb_func_end ov101_021E7C4C

	thumb_func_start ov101_021E7D28
ov101_021E7D28: ; 0x021E7D28
	push {r3, lr}
	bl ov101_021E818C
	cmp r0, #0
	beq _021E7D36
	mov r0, #1
	pop {r3, pc}
_021E7D36:
	mov r0, #0xa
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov101_021E7D28

	thumb_func_start ov101_021E7D3C
ov101_021E7D3C: ; 0x021E7D3C
	ldr r3, [r0, #0x10]
	mov r1, #0x80
	ldrb r2, [r3, #5]
	bic r2, r1
	strb r2, [r3, #5]
	ldr r0, [r0, #0x10]
	mov r1, #6
	str r1, [r0, #0x1c]
	mov r0, #5
	bx lr
	thumb_func_end ov101_021E7D3C

	thumb_func_start ov101_021E7D50
ov101_021E7D50: ; 0x021E7D50
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _021E7D62
	cmp r0, #1
	beq _021E7E04
	b _021E7E22
_021E7D62:
	mov r0, #6
	mov r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r5]
	add r2, r1, #0
	str r0, [sp, #8]
	mov r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	ldrb r0, [r5, #0xc]
	cmp r0, #1
	bne _021E7D96
	mov r4, #0
	mov r6, #1
_021E7D82:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	add r1, r6, #0
	bl ToggleBgLayer
	add r4, r4, #1
	cmp r4, #4
	blt _021E7D82
	b _021E7DAA
_021E7D96:
	mov r4, #0
	mov r6, #1
_021E7D9A:
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	add r1, r6, #0
	bl ToggleBgLayer
	add r4, r4, #1
	cmp r4, #8
	blt _021E7D9A
_021E7DAA:
	ldr r0, [r5, #0x10]
	mov r1, #1
	ldr r0, [r0, #0x78]
	bl PaletteData_SetAutoTransparent
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r0, [r5, #0x10]
	add r2, r1, #0
	ldr r0, [r0, #0x78]
	mov r3, #0xe0
	bl PaletteData_BlendPalette
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [r5, #0x10]
	mov r1, #2
	ldr r0, [r0, #0x78]
	mov r2, #0x40
	mov r3, #0xc0
	bl PaletteData_BlendPalette
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x78]
	bl PaletteData_PushTransparentBuffers
	ldr r0, [r5, #0x10]
	mov r1, #0
	ldr r0, [r0, #0x78]
	bl PaletteData_SetAutoTransparent
	mov r0, #0x10
	mov r1, #1
	bl GfGfx_EngineATogglePlanes
	mov r0, #0x10
	mov r1, #1
	bl GfGfx_EngineBTogglePlanes
	ldr r0, [r5, #4]
	add r0, r0, #1
	str r0, [r5, #4]
	b _021E7E22
_021E7E04:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021E7E22
	mov r0, #0
	str r0, [r5, #4]
	ldrb r0, [r5, #0xc]
	cmp r0, #1
	bne _021E7E1C
	add sp, #0xc
	mov r0, #9
	pop {r3, r4, r5, r6, pc}
_021E7E1C:
	add sp, #0xc
	mov r0, #1
	pop {r3, r4, r5, r6, pc}
_021E7E22:
	mov r0, #4
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov101_021E7D50

	thumb_func_start ov101_021E7E28
ov101_021E7E28: ; 0x021E7E28
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _021E7E3A
	cmp r0, #1
	beq _021E7E5A
	b _021E7E90
_021E7E3A:
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r5]
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	ldr r0, [r5, #4]
	add r0, r0, #1
	str r0, [r5, #4]
	b _021E7E90
_021E7E5A:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021E7E90
	mov r4, #0
	add r6, r4, #0
_021E7E66:
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	add r1, r6, #0
	bl ToggleBgLayer
	add r4, r4, #1
	cmp r4, #8
	blt _021E7E66
	mov r0, #0x10
	mov r1, #0
	bl GfGfx_EngineATogglePlanes
	mov r0, #0x10
	mov r1, #0
	bl GfGfx_EngineBTogglePlanes
	mov r0, #0
	str r0, [r5, #4]
	add sp, #0xc
	mov r0, #2
	pop {r3, r4, r5, r6, pc}
_021E7E90:
	mov r0, #5
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov101_021E7E28

	thumb_func_start ov101_021E7E98
ov101_021E7E98: ; 0x021E7E98
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r1, [r5, #4]
	cmp r1, #0
	beq _021E7EAC
	cmp r1, #1
	beq _021E7EE2
	cmp r1, #2
	beq _021E7F02
	b _021E7F16
_021E7EAC:
	ldr r0, [r5, #0x10]
	mov r1, #1
	ldr r0, [r0, #0x78]
	bl PaletteData_SetAutoTransparent
	ldr r0, _021E7F1C ; =0x00000135
	mov r4, #0
	strb r4, [r5, r0]
	mov r6, #1
_021E7EBE:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	add r1, r6, #0
	bl ToggleBgLayer
	add r4, r4, #1
	cmp r4, #3
	blt _021E7EBE
	mov r0, #0
	mov r1, #0xe
	mov r2, #1
	bl SetBlendBrightness
	ldr r0, [r5, #4]
	add r0, r0, #1
	str r0, [r5, #4]
	b _021E7F16
_021E7EE2:
	mov r1, #0
	bl ov101_021E9CD4
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #0
	bl ov101_021E9E90
	cmp r4, #0
	beq _021E7F16
	cmp r0, #0
	beq _021E7F16
	ldr r0, [r5, #4]
	add r0, r0, #1
	str r0, [r5, #4]
	b _021E7F16
_021E7F02:
	ldr r0, [r5, #0x10]
	mov r1, #0
	ldr r0, [r0, #0x78]
	bl PaletteData_SetAutoTransparent
	mov r0, #0
	str r0, [r5, #4]
	str r0, [r5, #0x30]
	mov r0, #1
	pop {r4, r5, r6, pc}
_021E7F16:
	mov r0, #6
	pop {r4, r5, r6, pc}
	nop
_021E7F1C: .word 0x00000135
	thumb_func_end ov101_021E7E98

	thumb_func_start ov101_021E7F20
ov101_021E7F20: ; 0x021E7F20
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r1, [r5, #4]
	cmp r1, #0
	beq _021E7F36
	cmp r1, #1
	beq _021E7F6C
	cmp r1, #2
	beq _021E7F8C
	b _021E7FEA
_021E7F36:
	ldr r0, [r5, #0x10]
	mov r1, #1
	ldr r0, [r0, #0x78]
	bl PaletteData_SetAutoTransparent
	mov r4, #0
	mov r6, #1
_021E7F44:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	add r1, r6, #0
	bl ToggleBgLayer
	add r4, r4, #1
	cmp r4, #3
	blt _021E7F44
	add r0, r5, #0
	mov r1, #1
	bl ov101_021E9D74
	ldr r0, _021E7FF0 ; =0x00000135
	mov r1, #0
	strb r1, [r5, r0]
	ldr r0, [r5, #4]
	add r0, r0, #1
	str r0, [r5, #4]
	b _021E7FEA
_021E7F6C:
	mov r1, #1
	bl ov101_021E9CD4
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #1
	bl ov101_021E9E90
	cmp r4, #0
	beq _021E7FEA
	cmp r0, #0
	beq _021E7FEA
	ldr r0, [r5, #4]
	add r0, r0, #1
	str r0, [r5, #4]
	b _021E7FEA
_021E7F8C:
	mov r0, #0x10
	mov r1, #0
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r5, #0x10]
	add r2, r1, #0
	ldr r0, [r0, #0x78]
	mov r3, #0xe0
	bl PaletteData_BlendPalette
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, [r5, #0x10]
	mov r1, #2
	ldr r0, [r0, #0x78]
	mov r2, #0x40
	mov r3, #0xc0
	bl PaletteData_BlendPalette
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x78]
	bl PaletteData_PushTransparentBuffers
	mov r4, #0
	add r6, r4, #0
_021E7FC2:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	add r1, r6, #0
	bl ToggleBgLayer
	add r4, r4, #1
	cmp r4, #3
	blt _021E7FC2
	ldr r0, [r5, #0x10]
	mov r1, #0
	ldr r0, [r0, #0x78]
	bl PaletteData_SetAutoTransparent
	mov r0, #0
	str r0, [r5, #4]
	str r0, [r5, #0x30]
	add sp, #8
	mov r0, #2
	pop {r4, r5, r6, pc}
_021E7FEA:
	mov r0, #7
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021E7FF0: .word 0x00000135
	thumb_func_end ov101_021E7F20

	thumb_func_start ov101_021E7FF4
ov101_021E7FF4: ; 0x021E7FF4
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #8]
	cmp r1, #3
	bhi _021E8062
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021E800A: ; jump table
	.short _021E8012 - _021E800A - 2 ; case 0
	.short _021E8018 - _021E800A - 2 ; case 1
	.short _021E802E - _021E800A - 2 ; case 2
	.short _021E8044 - _021E800A - 2 ; case 3
_021E8012:
	bl ov101_021E8264
	b _021E8062
_021E8018:
	ldr r1, [r4, #0x10]
	ldrb r1, [r1, #8]
	bl ov101_021E8370
	add r0, r4, #0
	bl ov101_021E84FC
	add r0, r4, #0
	bl ov101_021E85A8
	b _021E8062
_021E802E:
	bl ov101_021E886C
	ldr r1, [r4, #0x10]
	add r0, r4, #0
	ldrb r1, [r1, #8]
	bl ov101_021E8790
	add r0, r4, #0
	bl ov101_021E8E34
	b _021E8062
_021E8044:
	ldrb r1, [r4, #0xc]
	cmp r1, #1
	bne _021E8050
	bl ov101_021E90A8
	b _021E8054
_021E8050:
	bl ov101_021E8E58
_021E8054:
	ldr r1, _021E806C ; =ov101_021E9270
	ldr r0, [r4, #0x10]
	str r1, [r0, #0x58]
	mov r0, #0
	str r0, [r4, #8]
	mov r0, #1
	pop {r4, pc}
_021E8062:
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_021E806C: .word ov101_021E9270
	thumb_func_end ov101_021E7FF4

	thumb_func_start ov101_021E8070
ov101_021E8070: ; 0x021E8070
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0x10]
	mov r2, #0
	str r2, [r1, #0x58]
	ldr r1, [r4, #0x10]
	ldr r1, [r1, #0x1c]
	cmp r1, #6
	bne _021E808C
	bl ov101_021E8774
	add r0, r4, #0
	bl ov101_021E8E20
_021E808C:
	add r0, r4, #0
	bl ov101_021E8E4C
	add r0, r4, #0
	bl ov101_021E88A8
	add r0, r4, #0
	bl ov101_021E862C
	add r0, r4, #0
	bl ov101_021E857C
	add r0, r4, #0
	bl ov101_021E84B8
	add r0, r4, #0
	bl ov101_021E8354
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ov101_021E8070

	thumb_func_start ov101_021E80B4
ov101_021E80B4: ; 0x021E80B4
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldr r1, [r4, #8]
	cmp r1, #4
	bhi _021E817C
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021E80CC: ; jump table
	.short _021E80D6 - _021E80CC - 2 ; case 0
	.short _021E80FC - _021E80CC - 2 ; case 1
	.short _021E8120 - _021E80CC - 2 ; case 2
	.short _021E814C - _021E80CC - 2 ; case 3
	.short _021E8162 - _021E80CC - 2 ; case 4
_021E80D6:
	bl ov101_021E933C
	add r0, r4, #0
	mov r1, #1
	bl ov101_021E9D74
	mov r1, #0
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	add r2, r1, #0
	str r0, [sp, #8]
	mov r0, #3
	add r3, r1, #0
	bl BeginNormalPaletteFade
	b _021E817C
_021E80FC:
	bl IsPaletteFadeFinished
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl ov101_021E9E90
	cmp r5, #0
	beq _021E8112
	cmp r0, #0
	bne _021E8118
_021E8112:
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, pc}
_021E8118:
	add r0, r4, #0
	bl ov101_021E8E3C
	b _021E817C
_021E8120:
	mov r1, #1
	bl ov101_021E9264
	add r0, r4, #0
	bl ov101_021E90A8
	mov r0, #6
	mov r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r4]
	add r2, r1, #0
	str r0, [sp, #8]
	mov r0, #3
	mov r3, #0
	bl BeginNormalPaletteFade
	add r0, r4, #0
	mov r1, #0
	bl ov101_021E9FDC
	b _021E817C
_021E814C:
	bl IsPaletteFadeFinished
	cmp r0, #0
	bne _021E815A
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, pc}
_021E815A:
	ldr r0, _021E8188 ; =0x00000944
	bl PlaySE
	b _021E817C
_021E8162:
	mov r1, #0
	bl ov101_021EA0D8
	cmp r0, #0
	bne _021E8172
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, pc}
_021E8172:
	mov r0, #0
	str r0, [r4, #8]
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, pc}
_021E817C:
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_021E8188: .word 0x00000944
	thumb_func_end ov101_021E80B4

	thumb_func_start ov101_021E818C
ov101_021E818C: ; 0x021E818C
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldr r1, [r4, #8]
	cmp r1, #4
	bhi _021E8254
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021E81A4: ; jump table
	.short _021E81AE - _021E81A4 - 2 ; case 0
	.short _021E81BC - _021E81A4 - 2 ; case 1
	.short _021E81E6 - _021E81A4 - 2 ; case 2
	.short _021E8202 - _021E81A4 - 2 ; case 3
	.short _021E822E - _021E81A4 - 2 ; case 4
_021E81AE:
	mov r1, #1
	bl ov101_021E9FDC
	ldr r0, _021E8260 ; =0x00000944
	bl PlaySE
	b _021E8254
_021E81BC:
	mov r1, #1
	bl ov101_021EA0D8
	cmp r0, #0
	bne _021E81CC
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, pc}
_021E81CC:
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	mov r1, #0
	str r0, [sp, #4]
	ldr r0, [r4]
	add r2, r1, #0
	str r0, [sp, #8]
	mov r0, #3
	add r3, r1, #0
	bl BeginNormalPaletteFade
	b _021E8254
_021E81E6:
	bl IsPaletteFadeFinished
	cmp r0, #0
	bne _021E81F4
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, pc}
_021E81F4:
	add r0, r4, #0
	bl ov101_021E8774
	add r0, r4, #0
	bl ov101_021E8E20
	b _021E8254
_021E8202:
	mov r1, #0
	bl ov101_021E9264
	add r0, r4, #0
	bl ov101_021E8E58
	add r0, r4, #0
	mov r1, #0
	bl ov101_021E9D74
	mov r0, #6
	mov r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r4]
	add r2, r1, #0
	str r0, [sp, #8]
	mov r0, #3
	mov r3, #0
	bl BeginNormalPaletteFade
	b _021E8254
_021E822E:
	bl IsPaletteFadeFinished
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #0
	bl ov101_021E9E90
	cmp r5, #0
	beq _021E8244
	cmp r0, #0
	bne _021E824A
_021E8244:
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, pc}
_021E824A:
	mov r0, #0
	str r0, [r4, #8]
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, pc}
_021E8254:
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_021E8260: .word 0x00000944
	thumb_func_end ov101_021E818C

	thumb_func_start ov101_021E8264
ov101_021E8264: ; 0x021E8264
	push {r4, r5, r6, r7, lr}
	sub sp, #0xac
	add r5, r0, #0
	mov r0, #1
	mov r1, #5
	mov r2, #0
	bl GX_SetGraphicsMode
	ldr r4, _021E8350 ; =ov101_021F7D10
	add r3, sp, #4
	mov r2, #0x15
_021E827A:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021E827A
	mov r3, #0
	str r3, [sp]
	ldr r0, [r5, #0x10]
	mov r1, #1
	ldr r0, [r0, #0x74]
	add r2, sp, #4
	bl InitBgFromTemplateEx
	mov r0, #0
	str r0, [sp]
	ldr r0, [r5, #0x10]
	mov r1, #2
	ldr r0, [r0, #0x74]
	add r2, sp, #0x20
	add r3, r1, #0
	bl InitBgFromTemplateEx
	mov r0, #0
	str r0, [sp]
	ldr r0, [r5, #0x10]
	mov r1, #3
	ldr r0, [r0, #0x74]
	add r2, sp, #0x3c
	mov r3, #2
	bl InitBgFromTemplateEx
	mov r3, #0
	str r3, [sp]
	ldr r0, [r5, #0x10]
	mov r1, #5
	ldr r0, [r0, #0x74]
	add r2, sp, #0x58
	bl InitBgFromTemplateEx
	mov r3, #0
	str r3, [sp]
	ldr r0, [r5, #0x10]
	mov r1, #6
	ldr r0, [r0, #0x74]
	add r2, sp, #0x74
	bl InitBgFromTemplateEx
	mov r3, #0
	str r3, [sp]
	ldr r0, [r5, #0x10]
	mov r1, #7
	ldr r0, [r0, #0x74]
	add r2, sp, #0x90
	bl InitBgFromTemplateEx
	mov r4, #0
	mov r6, #0x40
	add r7, r4, #0
_021E82EC:
	ldr r0, [r5, #0x10]
	add r1, r4, #1
	lsl r1, r1, #0x18
	ldr r0, [r0, #0x74]
	lsr r1, r1, #0x18
	bl BgClearTilemapBufferAndCommit
	add r0, r4, #1
	lsl r0, r0, #0x18
	ldr r3, [r5]
	lsr r0, r0, #0x18
	add r1, r6, #0
	add r2, r7, #0
	bl BG_ClearCharDataRange
	ldr r0, [r5, #0x10]
	add r1, r4, #5
	lsl r1, r1, #0x18
	ldr r0, [r0, #0x74]
	lsr r1, r1, #0x18
	bl BgClearTilemapBufferAndCommit
	add r0, r4, #5
	lsl r0, r0, #0x18
	ldr r3, [r5]
	lsr r0, r0, #0x18
	mov r1, #0x20
	mov r2, #0
	bl BG_ClearCharDataRange
	ldr r0, [r5, #0x10]
	add r1, r4, #1
	lsl r1, r1, #0x18
	ldr r0, [r0, #0x74]
	lsr r1, r1, #0x18
	bl BgCommitTilemapBufferToVram
	ldr r0, [r5, #0x10]
	add r1, r4, #5
	lsl r1, r1, #0x18
	ldr r0, [r0, #0x74]
	lsr r1, r1, #0x18
	bl BgCommitTilemapBufferToVram
	add r4, r4, #1
	cmp r4, #3
	blt _021E82EC
	add sp, #0xac
	pop {r4, r5, r6, r7, pc}
	nop
_021E8350: .word ov101_021F7D10
	thumb_func_end ov101_021E8264

	thumb_func_start ov101_021E8354
ov101_021E8354: ; 0x021E8354
	push {r3, lr}
	ldr r0, [r0, #0x10]
	bl Pokegear_ClearAppBgLayers
	mov r1, #0
	ldr r0, _021E836C ; =0x04000050
	add r2, r1, #0
	add r3, r1, #0
	str r1, [sp]
	bl G2x_SetBlendAlpha_
	pop {r3, pc}
	.balign 4, 0
_021E836C: .word 0x04000050
	thumb_func_end ov101_021E8354

	thumb_func_start ov101_021E8370
ov101_021E8370: ; 0x021E8370
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	add r5, r0, #0
	add r6, r1, #0
	ldr r1, [r5]
	mov r0, #0x90
	bl NARC_New
	add r4, r0, #0
	add r0, r6, #0
	add r0, #0x1a
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x10]
	ldr r1, [r5]
	ldr r0, [r0, #0x74]
	add r2, r4, #0
	mov r3, #0x90
	bl sub_0208820C
	mov r0, #0xa
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x10]
	ldr r1, [r5]
	ldr r0, [r0, #0x74]
	add r2, r4, #0
	mov r3, #0x90
	bl sub_0208820C
	add r0, r6, #0
	add r0, #0x32
	str r0, [sp]
	mov r0, #6
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x10]
	ldr r1, [r5]
	ldr r0, [r0, #0x74]
	add r2, r4, #0
	mov r3, #0x90
	bl sub_0208820C
	mov r0, #0xc
	str r0, [sp]
	mov r0, #7
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x10]
	ldr r1, [r5]
	ldr r0, [r0, #0x74]
	add r2, r4, #0
	mov r3, #0x90
	bl sub_0208820C
	ldr r0, [r5]
	mov r3, #0x5b
	add r1, r6, #0
	lsl r3, r3, #2
	str r0, [sp]
	add r0, r4, #0
	add r1, #0x38
	mov r2, #0
	add r3, r5, r3
	bl GfGfxLoader_GetScrnDataFromOpenNarc
	mov r3, #0x55
	lsl r3, r3, #2
	str r0, [r5, r3]
	ldr r0, [r5]
	add r3, #0x1c
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0xb
	mov r2, #0
	add r3, r5, r3
	bl GfGfxLoader_GetScrnDataFromOpenNarc
	mov r3, #0x56
	lsl r3, r3, #2
	str r0, [r5, r3]
	ldr r0, [r5]
	add r3, #0x1c
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0xd
	mov r2, #0
	add r3, r5, r3
	bl GfGfxLoader_GetScrnDataFromOpenNarc
	mov r3, #0x57
	lsl r3, r3, #2
	str r0, [r5, r3]
	ldr r0, [r5]
	add r1, r6, #0
	add r3, #0x1c
	str r0, [sp]
	add r0, r4, #0
	add r1, #0x20
	mov r2, #0
	add r3, r5, r3
	bl GfGfxLoader_GetScrnDataFromOpenNarc
	mov r3, #0x16
	lsl r3, r3, #4
	str r0, [r5, r3]
	ldr r0, [r5]
	add r1, r6, #0
	add r3, #0x1c
	str r0, [sp]
	add r0, r4, #0
	add r1, #0x26
	mov r2, #0
	add r3, r5, r3
	bl GfGfxLoader_GetScrnDataFromOpenNarc
	mov r3, #0x59
	lsl r3, r3, #2
	str r0, [r5, r3]
	ldr r0, [r5]
	add r6, #0x2c
	add r3, #0x1c
	str r0, [sp]
	add r0, r4, #0
	add r1, r6, #0
	mov r2, #0
	add r3, r5, r3
	bl GfGfxLoader_GetScrnDataFromOpenNarc
	mov r1, #0x5a
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r4, #0
	bl NARC_Delete
	ldr r0, [r5, #0x10]
	mov r1, #1
	ldr r0, [r0, #0x74]
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r5, #0x10]
	mov r1, #2
	ldr r0, [r0, #0x74]
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov101_021E8370

	thumb_func_start ov101_021E84B8
ov101_021E84B8: ; 0x021E84B8
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x5a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl FreeToHeap
	mov r0, #0x59
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl FreeToHeap
	mov r0, #0x16
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl FreeToHeap
	mov r0, #0x57
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl FreeToHeap
	mov r0, #0x56
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl FreeToHeap
	mov r0, #0x55
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov101_021E84B8

	thumb_func_start ov101_021E84FC
ov101_021E84FC: ; 0x021E84FC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r7, r0, #0
	mov r0, #0x61
	lsl r0, r0, #2
	ldr r4, _021E8574 ; =ov101_021F7B64
	mov r6, #0
	add r5, r7, r0
_021E850C:
	ldrb r0, [r4, #2]
	add r1, r5, #0
	str r0, [sp]
	ldrb r0, [r4, #3]
	str r0, [sp, #4]
	ldrb r0, [r4, #4]
	str r0, [sp, #8]
	ldrb r0, [r4, #5]
	str r0, [sp, #0xc]
	ldrh r0, [r4, #6]
	str r0, [sp, #0x10]
	ldr r0, [r7, #0x10]
	ldrb r2, [r4]
	ldrb r3, [r4, #1]
	ldr r0, [r0, #0x74]
	bl AddWindowParameterized
	add r0, r5, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r6, r6, #1
	add r4, #8
	add r5, #0x10
	cmp r6, #7
	ble _021E850C
	mov r0, #0x81
	lsl r0, r0, #2
	add r0, r7, r0
	bl InitWindow
	ldr r0, _021E8578 ; =0x000003C5
	mov r1, #0x81
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, [r7, #0x10]
	lsl r1, r1, #2
	ldr r0, [r0, #0x74]
	add r1, r7, r1
	mov r2, #0xb
	mov r3, #2
	bl AddTextWindowTopLeftCorner
	mov r0, #0x81
	lsl r0, r0, #2
	add r0, r7, r0
	mov r1, #0
	bl FillWindowPixelBufferText_AssumeTileSize32
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021E8574: .word ov101_021F7B64
_021E8578: .word 0x000003C5
	thumb_func_end ov101_021E84FC

	thumb_func_start ov101_021E857C
ov101_021E857C: ; 0x021E857C
	push {r4, r5, r6, lr}
	add r6, r0, #0
	mov r0, #0x61
	lsl r0, r0, #2
	mov r4, #0
	add r5, r6, r0
_021E8588:
	add r0, r5, #0
	bl ClearWindowTilemapAndCopyToVram
	add r0, r5, #0
	bl RemoveWindow
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #8
	blt _021E8588
	mov r0, #0x81
	lsl r0, r0, #2
	add r0, r6, r0
	bl RemoveWindow
	pop {r4, r5, r6, pc}
	thumb_func_end ov101_021E857C

	thumb_func_start ov101_021E85A8
ov101_021E85A8: ; 0x021E85A8
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0x1b
	add r2, r1, #0
	ldr r3, [r4]
	mov r0, #0
	add r2, #0xf6
	bl NewMsgDataFromNarc
	add r1, r4, #0
	add r1, #0x88
	str r0, [r1]
	ldr r2, [r4]
	mov r0, #2
	mov r1, #0x5b
	bl MessageFormat_New_Custom
	add r1, r4, #0
	add r1, #0x8c
	str r0, [r1]
	ldr r1, [r4]
	mov r0, #0x5b
	bl String_New
	add r1, r4, #0
	add r1, #0x90
	str r0, [r1]
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	mov r1, #1
	bl NewString_ReadMsgData
	add r1, r4, #0
	add r1, #0x9c
	str r0, [r1]
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	mov r1, #0
	bl NewString_ReadMsgData
	add r1, r4, #0
	add r1, #0xa0
	str r0, [r1]
	ldr r1, [r4]
	mov r0, #0x28
	bl String_New
	add r1, r4, #0
	add r1, #0xa4
	str r0, [r1]
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	mov r1, #3
	bl NewString_ReadMsgData
	add r1, r4, #0
	add r1, #0xb4
	str r0, [r1]
	mov r0, #2
	add r4, #0xb8
	strb r0, [r4]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov101_021E85A8

	thumb_func_start ov101_021E862C
ov101_021E862C: ; 0x021E862C
	push {r4, lr}
	add r4, r0, #0
	add r0, #0xb4
	ldr r0, [r0]
	bl String_Delete
	add r0, r4, #0
	add r0, #0xa4
	ldr r0, [r0]
	bl String_Delete
	add r0, r4, #0
	add r0, #0xa0
	ldr r0, [r0]
	bl String_Delete
	add r0, r4, #0
	add r0, #0x9c
	ldr r0, [r0]
	bl String_Delete
	add r0, r4, #0
	add r0, #0x90
	ldr r0, [r0]
	bl String_Delete
	add r0, r4, #0
	add r0, #0x8c
	ldr r0, [r0]
	bl MessageFormat_Delete
	add r4, #0x88
	ldr r0, [r4]
	bl DestroyMsgData
	pop {r4, pc}
	thumb_func_end ov101_021E862C

	thumb_func_start ov101_021E8674
ov101_021E8674: ; 0x021E8674
	push {r3, r4, r5, lr}
	sub sp, #0x18
	add r5, r0, #0
	add r0, #0x84
	ldr r0, [r0]
	mov r1, #2
	ldr r4, [r0, #8]
	mov r3, #0
	str r3, [sp]
	ldr r0, [r5]
	lsl r1, r1, #8
	str r0, [sp, #4]
	ldr r0, [r4, r1]
	mov r2, #9
	str r0, [sp, #8]
	add r0, r1, #0
	add r0, #0x28
	ldr r0, [r4, r0]
	str r0, [sp, #0xc]
	add r0, r1, #0
	add r0, #0x50
	ldr r0, [r4, r0]
	add r1, #0x78
	str r0, [sp, #0x10]
	ldr r0, [r4, r1]
	ldr r1, _021E8768 ; =ov101_021F7C04
	str r0, [sp, #0x14]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x7c]
	bl PokegearAppSwitch_AddButtons
	mov r3, #0
	str r3, [sp]
	ldr r0, [r5]
	mov r1, #0x2a
	lsl r1, r1, #4
	str r0, [sp, #4]
	ldr r0, [r4, r1]
	mov r2, #8
	str r0, [sp, #8]
	add r0, r1, #0
	add r0, #0x28
	ldr r0, [r4, r0]
	str r0, [sp, #0xc]
	add r0, r1, #0
	add r0, #0x50
	ldr r0, [r4, r0]
	add r1, #0x78
	str r0, [sp, #0x10]
	ldr r0, [r4, r1]
	ldr r1, _021E876C ; =ov101_021F7BA4
	str r0, [sp, #0x14]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x7c]
	bl PokegearAppSwitch_AddButtons
	mov r3, #0
	str r3, [sp]
	ldr r0, [r5]
	mov r1, #0x2a
	lsl r1, r1, #4
	str r0, [sp, #4]
	ldr r0, [r4, r1]
	mov r2, #1
	str r0, [sp, #8]
	add r0, r1, #0
	add r0, #0x28
	ldr r0, [r4, r0]
	str r0, [sp, #0xc]
	add r0, r1, #0
	add r0, #0x50
	ldr r0, [r4, r0]
	add r1, #0x78
	str r0, [sp, #0x10]
	ldr r0, [r4, r1]
	ldr r1, _021E8770 ; =ov101_021F7B30
	str r0, [sp, #0x14]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x7c]
	bl PokegearAppSwitch_AddButtons
	ldr r0, [r5, #0x10]
	mov r1, #1
	ldr r0, [r0, #0x7c]
	mov r2, #0
	bl PokegearAppSwitchCursor_SetCursorSpritesDrawState
	ldr r0, [r5, #0x10]
	mov r1, #2
	ldr r0, [r0, #0x7c]
	mov r2, #0
	bl PokegearAppSwitchCursor_SetCursorSpritesDrawState
	ldr r0, [r5, #0x10]
	mov r1, #3
	ldr r0, [r0, #0x7c]
	mov r2, #0
	bl PokegearAppSwitchCursor_SetCursorSpritesDrawState
	ldrb r0, [r5, #0xc]
	cmp r0, #1
	ldr r0, [r5, #0x10]
	bne _021E8758
	ldrh r2, [r5, #0x16]
	ldr r0, [r0, #0x7c]
	mov r1, #1
	lsl r2, r2, #1
	add r2, r2, #1
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	bl PokegearAppSwitch_SetSpecIndexAndCursorPos
	add sp, #0x18
	pop {r3, r4, r5, pc}
_021E8758:
	ldr r0, [r0, #0x7c]
	mov r1, #1
	mov r2, #0
	bl PokegearAppSwitch_SetSpecIndexAndCursorPos
	add sp, #0x18
	pop {r3, r4, r5, pc}
	nop
_021E8768: .word ov101_021F7C04
_021E876C: .word ov101_021F7BA4
_021E8770: .word ov101_021F7B30
	thumb_func_end ov101_021E8674

	thumb_func_start ov101_021E8774
ov101_021E8774: ; 0x021E8774
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
_021E877A:
	ldr r0, [r5, #0x10]
	add r1, r4, #1
	lsl r1, r1, #0x10
	ldr r0, [r0, #0x7c]
	lsr r1, r1, #0x10
	bl PokegearAppSwitch_RemoveButtons
	add r4, r4, #1
	cmp r4, #3
	blt _021E877A
	pop {r3, r4, r5, pc}
	thumb_func_end ov101_021E8774

	thumb_func_start ov101_021E8790
ov101_021E8790: ; 0x021E8790
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r6, r1, #0
	ldr r1, [r5]
	mov r0, #0x90
	bl NARC_New
	add r4, r0, #0
	mov r1, #0
	mov r0, #7
	add r2, r6, #0
	str r1, [sp]
	lsl r0, r0, #6
	str r0, [sp, #4]
	str r1, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, [r5, #0x10]
	ldr r3, [r5]
	ldr r0, [r0, #0x78]
	add r1, r4, #0
	add r2, #0x14
	bl PaletteData_LoadFromOpenNarc
	mov r0, #1
	str r0, [sp]
	mov r0, #6
	lsl r0, r0, #6
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x10]
	add r6, #0xe
	ldr r0, [r0, #0x78]
	ldr r3, [r5]
	add r1, r4, #0
	add r2, r6, #0
	bl PaletteData_LoadFromOpenNarc
	mov r0, #2
	str r0, [sp]
	mov r0, #0x16
	lsl r0, r0, #4
	str r0, [sp, #4]
	mov r0, #0x40
	str r0, [sp, #8]
	mov r2, #0
	str r2, [sp, #0xc]
	ldr r0, [r5, #0x10]
	ldr r3, [r5]
	ldr r0, [r0, #0x78]
	add r1, r4, #0
	bl PaletteData_LoadFromOpenNarc
	mov r0, #3
	str r0, [sp]
	mov r0, #0x16
	lsl r0, r0, #4
	str r0, [sp, #4]
	mov r0, #0x40
	str r0, [sp, #8]
	mov r2, #0
	str r2, [sp, #0xc]
	ldr r0, [r5, #0x10]
	ldr r3, [r5]
	ldr r0, [r0, #0x78]
	add r1, r4, #0
	bl PaletteData_LoadFromOpenNarc
	ldr r0, [r5, #0x10]
	mov r1, #1
	ldr r0, [r0, #0x78]
	bl PaletteData_SetAutoTransparent
	mov r0, #0x10
	mov r1, #0
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r5, #0x10]
	add r2, r1, #0
	ldr r0, [r0, #0x78]
	mov r3, #0xe0
	bl PaletteData_BlendPalette
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, [r5, #0x10]
	mov r1, #2
	ldr r0, [r0, #0x78]
	mov r2, #0x40
	mov r3, #0xc0
	bl PaletteData_BlendPalette
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x78]
	bl PaletteData_PushTransparentBuffers
	ldr r0, [r5, #0x10]
	mov r1, #0
	ldr r0, [r0, #0x78]
	bl PaletteData_SetAutoTransparent
	add r0, r4, #0
	bl NARC_Delete
	add sp, #0x10
	pop {r4, r5, r6, pc}
	thumb_func_end ov101_021E8790

	thumb_func_start ov101_021E886C
ov101_021E886C: ; 0x021E886C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x10]
	mov r1, #2
	bl PokegearApp_CreateSpriteManager
	ldr r1, [r4]
	mov r0, #0x6f
	bl ov100_021E6E20
	add r1, r4, #0
	add r1, #0x84
	str r0, [r1]
	ldr r0, [r4, #0x10]
	add r0, #0x8c
	ldr r0, [r0]
	bl SpriteSystem_GetRenderer
	mov r2, #0xf
	mov r1, #0
	lsl r2, r2, #0x10
	bl G2dRenderer_SetSubSurfaceCoords
	ldr r1, [r4]
	mov r0, #4
	bl sub_02013534
	str r0, [r4, #0x3c]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov101_021E886C

	thumb_func_start ov101_021E88A8
ov101_021E88A8: ; 0x021E88A8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x10]
	add r0, #0x8c
	ldr r0, [r0]
	bl SpriteSystem_GetRenderer
	mov r2, #3
	mov r1, #0
	lsl r2, r2, #0x12
	bl G2dRenderer_SetSubSurfaceCoords
	ldr r0, [r4, #0x3c]
	bl sub_020135AC
	add r0, r4, #0
	add r0, #0x84
	ldr r0, [r0]
	bl ov100_021E6E58
	ldr r0, [r4, #0x10]
	bl PokegearApp_DestroySpriteManager
	pop {r4, pc}
	thumb_func_end ov101_021E88A8

	thumb_func_start ov101_021E88D8
ov101_021E88D8: ; 0x021E88D8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, #0x84
	ldr r0, [r0]
	mov r6, #0
	ldr r0, [r0, #8]
	mov r7, #0x15
	str r0, [sp]
	add r4, r0, #0
_021E88EA:
	ldr r1, [r5, #0x10]
	ldr r2, _021E8A74 ; =ov101_021F7DB8
	add r0, r1, #0
	add r0, #0x8c
	add r1, #0x90
	ldr r0, [r0]
	ldr r1, [r1]
	bl SpriteSystem_CreateSpriteFromResourceHeader
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x84
	ldr r0, [r0]
	bl ov100_021E6EC4
	lsr r2, r6, #0x1f
	lsl r3, r6, #0x1f
	sub r3, r3, r2
	mov r1, #0x1f
	ror r3, r1
	add r3, r2, r3
	add r2, r6, r2
	mov r1, #0x68
	mul r1, r3
	asr r2, r2, #1
	add r3, r2, #0
	mul r3, r7
	add r1, #0x20
	add r3, #0xcb
	lsl r1, r1, #0x10
	lsl r2, r3, #0x10
	ldr r0, [r4, #0x20]
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	bl Sprite_SetPositionXY
	ldr r0, [r4, #0x20]
	mov r1, #0
	bl thunk_Sprite_SetPriority
	add r6, r6, #1
	add r4, #0x28
	cmp r6, #4
	blt _021E88EA
	ldr r1, [r5, #0x10]
	ldr r2, _021E8A78 ; =ov101_021F7DE0
	add r0, r1, #0
	add r0, #0x8c
	add r1, #0x90
	ldr r0, [r0]
	ldr r1, [r1]
	bl SpriteSystem_CreateSpriteFromResourceHeader
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x84
	ldr r0, [r0]
	bl ov100_021E6EC4
	ldr r0, [sp]
	mov r1, #0
	add r0, #0xc0
	ldr r0, [r0]
	bl thunk_Sprite_SetPriority
	ldr r1, [r5, #0x10]
	ldr r2, _021E8A7C ; =ov101_021F7E08
	add r0, r1, #0
	add r0, #0x8c
	add r1, #0x90
	ldr r0, [r0]
	ldr r1, [r1]
	bl SpriteSystem_CreateSpriteFromResourceHeader
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x84
	ldr r0, [r0]
	bl ov100_021E6EC4
	ldr r1, [r5, #0x10]
	ldr r2, _021E8A80 ; =ov101_021F7E30
	add r0, r1, #0
	add r0, #0x8c
	add r1, #0x90
	ldr r0, [r0]
	ldr r1, [r1]
	bl SpriteSystem_CreateSpriteFromResourceHeader
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x84
	ldr r0, [r0]
	bl ov100_021E6EC4
	mov r7, #0
	ldr r6, [sp]
	add r4, r7, #0
_021E89AE:
	ldr r1, [r5, #0x10]
	ldr r2, _021E8A84 ; =ov101_021F7E58
	add r0, r1, #0
	add r0, #0x8c
	add r1, #0x90
	ldr r0, [r0]
	ldr r1, [r1]
	bl SpriteSystem_CreateSpriteFromResourceHeader
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x84
	ldr r0, [r0]
	bl ov100_021E6EC4
	cmp r7, #0
	ble _021E89E2
	add r0, r4, #0
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _021E89F0
_021E89E2:
	add r0, r4, #0
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_021E89F0:
	bl _ffix
	add r1, r0, #0
	mov r0, #0x4e
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	bl Sprite_UpdateAnim
	mov r0, #1
	lsl r0, r0, #0xc
	add r7, r7, #1
	add r4, r4, r0
	add r6, #0x28
	cmp r7, #4
	blt _021E89AE
	mov r4, #0
	mov r7, #0x28
_021E8A12:
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
	add r1, r0, #0
	ldr r0, [sp]
	mul r1, r7
	add r6, r0, r1
	ldr r0, [r6, #0x20]
	add r1, r6, #4
	add r2, r6, #6
	bl Sprite_GetPositionXY
	ldr r0, [r6, #0x20]
	mov r1, #0
	bl Sprite_SetDrawFlag
	add r4, r4, #1
	cmp r4, #0xb
	blt _021E8A12
	ldr r0, [sp]
	mov r1, #1
	add r0, #0xe8
	ldr r0, [r0]
	bl Sprite_SetAnimActiveFlag
	mov r1, #0x11
	ldr r0, [sp]
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	mov r1, #0
	bl Sprite_SetAnimActiveFlag
	mov r1, #0x11
	ldr r0, [sp]
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	ldr r1, [r5, #0x10]
	ldr r1, [r1, #0x20]
	ldrb r1, [r1, #7]
	bl Sprite_SetAnimationFrame
	ldr r0, [sp]
	mov r1, #2
	add r0, #0xe8
	str r0, [sp]
	ldr r0, [r0]
	bl Sprite_SetAffineOverwriteMode
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E8A74: .word ov101_021F7DB8
_021E8A78: .word ov101_021F7DE0
_021E8A7C: .word ov101_021F7E08
_021E8A80: .word ov101_021F7E30
_021E8A84: .word ov101_021F7E58
	thumb_func_end ov101_021E88D8

	thumb_func_start ov101_021E8A88
ov101_021E8A88: ; 0x021E8A88
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, #0x84
	ldr r0, [r0]
	mov r6, #0
	ldr r7, [r0, #8]
_021E8A94:
	ldr r1, [r5, #0x10]
	ldr r2, _021E8AE0 ; =ov101_021F7B3C
	add r0, r1, #0
	add r0, #0x8c
	add r1, #0x90
	ldr r0, [r0]
	ldr r1, [r1]
	bl SpriteSystem_CreateSpriteFromResourceHeader
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x84
	ldr r0, [r0]
	bl ov100_021E6EC4
	mov r1, #0x28
	mul r1, r0
	add r4, r7, r1
	ldr r0, [r4, #0x20]
	add r1, r4, #4
	add r2, r4, #6
	bl Sprite_GetPositionXY
	ldr r0, [r4, #0x20]
	mov r1, #0
	bl Sprite_SetDrawFlag
	ldr r0, [r4, #0x20]
	mov r1, #0
	bl Sprite_SetAnimActiveFlag
	add r0, r6, #1
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	cmp r6, #0x64
	blo _021E8A94
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E8AE0: .word ov101_021F7B3C
	thumb_func_end ov101_021E8A88

	thumb_func_start ov101_021E8AE4
ov101_021E8AE4: ; 0x021E8AE4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x48
	add r5, r0, #0
	mov r0, #0x81
	lsl r0, r0, #2
	ldr r1, [r5]
	add r0, r5, r0
	bl sub_02013910
	mov r1, #1
	str r0, [r5, #0x40]
	bl sub_02013948
	mov r1, #0
	str r0, [sp, #0x14]
	add r2, r5, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E8BB4 ; =0x00010200
	add r2, #0xa0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	lsr r0, r0, #7
	ldr r2, [r2]
	add r0, r5, r0
	add r3, r1, #0
	bl AddTextPrinterParameterizedWithColor
	ldr r0, [r5, #0x3c]
	str r0, [sp, #0x18]
	mov r0, #0x81
	lsl r0, r0, #2
	add r0, r5, r0
	str r0, [sp, #0x1c]
	ldr r0, [r5, #0x10]
	add r0, #0x90
	ldr r0, [r0]
	bl SpriteManager_GetSpriteList
	str r0, [sp, #0x20]
	ldr r0, [r5, #0x10]
	mov r1, #0
	add r0, #0x90
	ldr r0, [r0]
	bl SpriteManager_FindPlttResourceProxy
	str r0, [sp, #0x24]
	mov r0, #0
	str r0, [sp, #0x10]
	str r0, [sp, #0x38]
	mov r0, #3
	str r0, [sp, #0x3c]
	mov r0, #4
	str r0, [sp, #0x30]
	sub r0, #0xa
	str r0, [sp, #0x34]
	mov r0, #1
	str r0, [sp, #0x40]
	ldr r0, [r5]
	add r7, r5, #0
	ldr r6, [sp, #0x10]
	str r0, [sp, #0x44]
	add r7, #0x48
	add r4, r5, #0
_021E8B66:
	mov r1, #1
	ldr r0, [sp, #0x14]
	add r2, r1, #0
	add r3, r7, #0
	bl sub_02021AC8
	ldr r0, [r4, #0x4c]
	str r0, [sp, #0x2c]
	add r0, r5, #0
	add r0, #0x84
	ldr r0, [r0]
	ldr r0, [r0, #8]
	add r1, r0, r6
	mov r0, #0x3e
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	str r0, [sp, #0x28]
	ldr r1, [r5, #0x40]
	add r0, sp, #0x18
	bl sub_02013950
	str r0, [r4, #0x44]
	mov r1, #0
	bl sub_020137C0
	ldr r0, [r4, #0x44]
	mov r1, #7
	bl sub_02013850
	ldr r0, [sp, #0x10]
	add r7, #0x10
	add r0, r0, #1
	add r4, #0x10
	add r6, #0x28
	str r0, [sp, #0x10]
	cmp r0, #4
	blt _021E8B66
	add sp, #0x48
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E8BB4: .word 0x00010200
	thumb_func_end ov101_021E8AE4

	thumb_func_start ov101_021E8BB8
ov101_021E8BB8: ; 0x021E8BB8
	push {r3, r4, r5, r6, r7, lr}
	mov r6, #0
	add r5, r0, #0
	str r0, [sp]
	add r4, r0, #0
	add r5, #0x48
	add r7, r6, #0
_021E8BC6:
	ldr r0, [r4, #0x44]
	bl sub_020139C8
	add r0, r5, #0
	bl sub_02021B5C
	str r7, [r4, #0x44]
	add r6, r6, #1
	add r4, #0x10
	add r5, #0x10
	cmp r6, #4
	blt _021E8BC6
	ldr r0, [sp]
	ldr r0, [r0, #0x40]
	bl sub_02013938
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov101_021E8BB8

	thumb_func_start ov101_021E8BE8
ov101_021E8BE8: ; 0x021E8BE8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, #0x84
	ldr r0, [r0]
	ldr r1, [r5, #0x10]
	ldr r7, [r0, #8]
	add r0, r1, #0
	add r0, #0x8c
	add r1, #0x90
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, _021E8E00 ; =ov101_021F7C70
	bl SpriteSystem_CreateSpriteFromResourceHeader
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x84
	ldr r0, [r0]
	bl ov100_021E6EC4
	mov r1, #0x6f
	mov r0, #0x80
	lsl r1, r1, #2
	strh r0, [r7, r1]
	add r0, r1, #2
	mov r2, #0x6c
	add r1, #0x1c
	strh r2, [r7, r0]
	ldr r0, [r7, r1]
	mov r1, #1
	bl Sprite_SetDrawFlag
	mov r6, #0
_021E8C2A:
	ldr r1, [r5, #0x10]
	ldr r2, _021E8E04 ; =ov101_021F7C98
	add r0, r1, #0
	add r0, #0x8c
	add r1, #0x90
	ldr r0, [r0]
	ldr r1, [r1]
	bl SpriteSystem_CreateSpriteFromResourceHeader
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x84
	ldr r0, [r0]
	bl ov100_021E6EC4
	mov r0, #0x28
	mul r0, r6
	add r4, r7, r0
	mov r0, #0x79
	mov r1, #0
	lsl r0, r0, #2
	strh r1, [r4, r0]
	add r0, r0, #2
	strh r1, [r4, r0]
	mov r0, #2
	lsl r0, r0, #8
	lsr r2, r6, #0x1f
	lsl r3, r6, #0x1e
	sub r3, r3, r2
	mov r1, #0x1e
	ror r3, r1
	add r1, r2, r3
	ldr r0, [r4, r0]
	add r1, r1, #5
	bl Sprite_SetAnimCtrlSeq
	mov r0, #2
	lsl r0, r0, #8
	ldr r0, [r4, r0]
	mov r1, #1
	bl Sprite_SetAnimActiveFlag
	mov r0, #2
	lsl r0, r0, #8
	ldr r0, [r4, r0]
	mov r1, #0
	bl Sprite_SetDrawFlag
	mov r0, #2
	lsl r0, r0, #8
	ldr r0, [r4, r0]
	mov r1, #0
	bl Sprite_SetPriority
	ldr r0, _021E8E08 ; =0x000001E2
	mov r1, #1
	strh r1, [r4, r0]
	add r0, r6, #1
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	cmp r6, #8
	blo _021E8C2A
	mov r6, #0xd
	mov r4, #0
	lsl r6, r6, #6
_021E8CAC:
	ldr r1, [r5, #0x10]
	ldr r2, _021E8E0C ; =ov101_021F7CC0
	add r0, r1, #0
	add r0, #0x8c
	add r1, #0x90
	ldr r0, [r0]
	ldr r1, [r1]
	bl SpriteSystem_CreateSpriteFromResourceHeader
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x84
	ldr r0, [r0]
	bl ov100_021E6EC4
	mov r0, #0x28
	mul r0, r4
	add r3, r7, r0
	lsr r2, r4, #0x1f
	lsl r1, r4, #0x1f
	sub r1, r1, r2
	mov r0, #0x1f
	ror r1, r0
	add r0, r2, r1
	mov r1, #0x68
	mul r1, r0
	mov r0, #0xc9
	add r1, #0x20
	lsl r0, r0, #2
	strh r1, [r3, r0]
	lsr r0, r4, #1
	mov r1, #0x15
	mul r1, r0
	ldr r0, _021E8E10 ; =0x00000326
	add r1, #0x20
	strh r1, [r3, r0]
	ldr r0, [r3, r6]
	mov r1, #0
	bl Sprite_SetPriority
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #4
	blo _021E8CAC
	mov r6, #0x3e
	mov r4, #0
	lsl r6, r6, #4
_021E8D0C:
	ldr r1, [r5, #0x10]
	ldr r2, _021E8E14 ; =ov101_021F7CE8
	add r0, r1, #0
	add r0, #0x8c
	add r1, #0x90
	ldr r0, [r0]
	ldr r1, [r1]
	bl SpriteSystem_CreateSpriteFromResourceHeader
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x84
	ldr r0, [r0]
	bl ov100_021E6EC4
	mov r0, #0x28
	mul r0, r4
	add r3, r7, r0
	lsr r2, r4, #0x1f
	lsl r1, r4, #0x1f
	sub r1, r1, r2
	mov r0, #0x1f
	ror r1, r0
	add r0, r2, r1
	mov r1, #0x68
	mul r1, r0
	mov r0, #0xf1
	add r1, #0x28
	lsl r0, r0, #2
	strh r1, [r3, r0]
	lsr r0, r4, #1
	mov r1, #0x15
	mul r1, r0
	ldr r0, _021E8E18 ; =0x000003C6
	add r1, #0x1f
	strh r1, [r3, r0]
	ldr r0, [r3, r6]
	mov r1, #0
	bl Sprite_SetPriority
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #4
	blo _021E8D0C
	mov r4, #0
_021E8D68:
	ldr r1, [r5, #0x10]
	ldr r2, _021E8E0C ; =ov101_021F7CC0
	add r0, r1, #0
	add r0, #0x8c
	add r1, #0x90
	ldr r0, [r0]
	ldr r1, [r1]
	bl SpriteSystem_CreateSpriteFromResourceHeader
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x84
	ldr r0, [r0]
	bl ov100_021E6EC4
	mov r0, #0x28
	mul r0, r4
	add r6, r7, r0
	mov r0, #0x18
	add r1, r4, #0
	mul r1, r0
	ldr r0, _021E8E1C ; =0x00000464
	add r1, #0x28
	strh r1, [r6, r0]
	mov r1, #0x84
	add r0, r0, #2
	strh r1, [r6, r0]
	mov r0, #0x12
	lsl r0, r0, #6
	ldr r0, [r6, r0]
	add r1, r4, #0
	bl Sprite_SetAnimationFrame
	mov r0, #0x12
	lsl r0, r0, #6
	ldr r0, [r6, r0]
	mov r1, #0
	bl Sprite_SetPriority
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #8
	blo _021E8D68
	mov r4, #0x14
_021E8DC2:
	mov r0, #0x28
	mul r0, r4
	add r6, r7, r0
	ldr r0, [r6, #0x20]
	mov r1, #1
	bl Sprite_SetDrawFlag
	ldr r0, [r6, #0x20]
	mov r1, #0
	bl Sprite_SetAnimActiveFlag
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #0x23
	bls _021E8DC2
	mov r0, #0x76
	lsl r0, r0, #2
	ldr r0, [r7, r0]
	mov r1, #1
	bl Sprite_SetAnimActiveFlag
	add r0, r5, #0
	add r0, #0x84
	ldr r0, [r0]
	bl ov100_021E6E84
	add r0, r5, #0
	bl ov101_021E8AE4
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E8E00: .word ov101_021F7C70
_021E8E04: .word ov101_021F7C98
_021E8E08: .word 0x000001E2
_021E8E0C: .word ov101_021F7CC0
_021E8E10: .word 0x00000326
_021E8E14: .word ov101_021F7CE8
_021E8E18: .word 0x000003C6
_021E8E1C: .word 0x00000464
	thumb_func_end ov101_021E8BE8

	thumb_func_start ov101_021E8E20
ov101_021E8E20: ; 0x021E8E20
	push {r4, lr}
	add r4, r0, #0
	bl ov101_021E8BB8
	add r4, #0x84
	ldr r0, [r4]
	mov r1, #0xb
	bl ov100_021E6F34
	pop {r4, pc}
	thumb_func_end ov101_021E8E20

	thumb_func_start ov101_021E8E34
ov101_021E8E34: ; 0x021E8E34
	ldr r3, _021E8E38 ; =ov101_021E88D8
	bx r3
	.balign 4, 0
_021E8E38: .word ov101_021E88D8
	thumb_func_end ov101_021E8E34

	thumb_func_start ov101_021E8E3C
ov101_021E8E3C: ; 0x021E8E3C
	ldr r3, _021E8E48 ; =ov100_021E6F34
	add r0, #0x84
	ldr r0, [r0]
	mov r1, #0xb
	bx r3
	nop
_021E8E48: .word ov100_021E6F34
	thumb_func_end ov101_021E8E3C

	thumb_func_start ov101_021E8E4C
ov101_021E8E4C: ; 0x021E8E4C
	ldr r3, _021E8E54 ; =ov100_021E6EF4
	add r0, #0x84
	ldr r0, [r0]
	bx r3
	.balign 4, 0
_021E8E54: .word ov100_021E6EF4
	thumb_func_end ov101_021E8E4C

	thumb_func_start ov101_021E8E58
ov101_021E8E58: ; 0x021E8E58
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r5, r0, #0
	add r0, #0x84
	ldr r0, [r0]
	mov r1, #5
	ldr r0, [r0, #8]
	mov r2, #0
	str r0, [sp, #0x1c]
	mov r0, #1
	bl GX_SetGraphicsMode
	mov r4, #0
	mov r6, #3
	mov r7, #2
_021E8E76:
	ldr r0, [r5, #0x10]
	add r1, r4, #2
	lsl r1, r1, #0x18
	ldr r0, [r0, #0x74]
	lsr r1, r1, #0x18
	add r2, r6, #0
	add r3, r7, #0
	bl SetBgControlParam
	ldr r0, [r5, #0x10]
	add r1, r4, #2
	lsl r1, r1, #0x18
	ldr r0, [r0, #0x74]
	lsr r1, r1, #0x18
	mov r2, #2
	mov r3, #4
	bl SetBgControlParam
	ldr r0, [r5, #0x10]
	add r1, r4, #2
	lsl r1, r1, #0x18
	mov r2, #0
	ldr r0, [r0, #0x74]
	lsr r1, r1, #0x18
	add r3, r2, #0
	bl BgSetPosTextAndCommit
	ldr r0, [r5, #0x10]
	add r1, r4, #2
	lsl r1, r1, #0x18
	ldr r0, [r0, #0x74]
	lsr r1, r1, #0x18
	mov r2, #3
	mov r3, #0
	bl BgSetPosTextAndCommit
	add r4, r4, #1
	cmp r4, #2
	blt _021E8E76
	mov r0, #6
	str r0, [sp]
	ldr r0, _021E909C ; =0x04000050
	mov r1, #4
	mov r2, #8
	mov r3, #0xa
	bl G2x_SetBlendAlpha_
	mov r0, #0
	mov r1, #1
	bl ToggleBgLayer
	mov r4, #0
	mov r6, #3
	add r7, r4, #0
_021E8EE2:
	ldr r0, [r5, #0x10]
	add r1, r4, #1
	lsl r1, r1, #0x18
	ldr r0, [r0, #0x74]
	lsr r1, r1, #0x18
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x10]
	add r1, r4, #1
	lsl r1, r1, #0x18
	mov r2, #0
	ldr r0, [r0, #0x74]
	lsr r1, r1, #0x18
	add r3, r2, #0
	bl BgSetPosTextAndCommit
	ldr r0, [r5, #0x10]
	add r1, r4, #1
	lsl r1, r1, #0x18
	ldr r0, [r0, #0x74]
	lsr r1, r1, #0x18
	add r2, r6, #0
	add r3, r7, #0
	bl BgSetPosTextAndCommit
	add r4, r4, #1
	cmp r4, #3
	blt _021E8EE2
	ldr r1, _021E90A0 ; =ov101_021EB338
	ldr r0, [r5, #0x10]
	str r1, [r0, #0x5c]
	ldr r1, _021E90A4 ; =ov101_021EB2FC
	ldr r0, [r5, #0x10]
	str r1, [r0, #0x60]
	add r0, r5, #0
	bl ov101_021E990C
	add r1, r5, #0
	add r0, r5, #0
	add r1, #0xc8
	bl ov101_021E9B70
	mov r0, #0x5e
	lsl r0, r0, #2
	mov r2, #0
	ldr r0, [r5, r0]
	mov r1, #0x20
	str r1, [sp]
	mov r1, #0x14
	str r1, [sp, #4]
	add r1, r0, #0
	add r1, #0xc
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	str r2, [sp, #0x10]
	ldrh r1, [r0]
	add r3, r2, #0
	lsl r1, r1, #0x15
	lsr r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	mov r1, #1
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x74]
	bl CopyToBgTilemapRect
	add r0, r5, #0
	bl ov101_021EAF40
	mov r2, #0x4e
	lsl r2, r2, #2
	ldrb r2, [r5, r2]
	add r0, r5, #0
	mov r1, #1
	lsl r2, r2, #0x1f
	lsr r2, r2, #0x1f
	bl ov101_021EB38C
	mov r0, #0x5b
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0x20
	str r1, [sp]
	mov r1, #0x11
	str r1, [sp, #4]
	add r1, r0, #0
	add r1, #0xc
	str r1, [sp, #8]
	mov r2, #0
	str r2, [sp, #0xc]
	mov r3, #7
	str r3, [sp, #0x10]
	ldrh r1, [r0]
	lsl r1, r1, #0x15
	lsr r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	mov r1, #6
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x74]
	bl CopyToBgTilemapRect
	mov r3, #0x46
	lsl r3, r3, #2
	add r2, r3, #0
	add r1, r5, r3
	sub r2, #8
	sub r3, r3, #6
	ldrsh r2, [r5, r2]
	ldrsh r3, [r5, r3]
	add r0, r5, #0
	lsl r2, r2, #0x18
	lsl r3, r3, #0x18
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl ov101_021EA794
	add r0, r5, #0
	mov r1, #0
	bl ov101_021EAD90
	add r0, r5, #0
	mov r1, #1
	bl ov101_021EB1E0
	add r0, r5, #0
	bl ov101_021E8A88
	add r0, r5, #0
	mov r1, #0
	bl ov101_021EA238
	add r0, r5, #0
	mov r1, #1
	bl ov101_021EA608
	ldr r1, [r5, #0x10]
	ldrb r0, [r1, #6]
	cmp r0, #1
	ldr r0, [r1, #0x7c]
	bne _021E9020
	mov r1, #0
	mov r2, #1
	bl PokegearAppSwitchCursor_SetCursorSpritesDrawState
	ldr r0, [sp, #0x1c]
	mov r1, #0
	add r0, #0xe8
	str r0, [sp, #0x1c]
	ldr r0, [r0]
	bl Sprite_SetDrawFlag
	b _021E9036
_021E9020:
	mov r1, #0
	add r2, r1, #0
	bl PokegearAppSwitchCursor_SetCursorSpritesDrawState
	ldr r0, [sp, #0x1c]
	mov r1, #1
	add r0, #0xe8
	str r0, [sp, #0x1c]
	ldr r0, [r0]
	bl Sprite_SetDrawFlag
_021E9036:
	ldr r0, [r5, #0x10]
	bl ov100_021E5DC8
	add r2, r0, #0
	ldr r0, [r5, #0x10]
	mov r1, #0
	ldr r0, [r0, #0x7c]
	bl PokegearAppSwitch_SetSpecIndexAndCursorPos
	ldr r0, [r5, #0x10]
	ldrb r0, [r0, #5]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1f
	beq _021E905A
	add r0, r5, #0
	mov r1, #0
	bl ov101_021E9D74
_021E905A:
	add r0, r5, #0
	add r0, #0x84
	ldr r0, [r0]
	bl ov100_021E6E84
	ldr r0, [r5, #0x10]
	mov r1, #5
	ldr r0, [r0, #0x74]
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r5, #0x10]
	mov r1, #7
	ldr r0, [r0, #0x74]
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r5, #0x10]
	mov r1, #1
	ldr r0, [r0, #0x74]
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r5, #0x10]
	mov r1, #2
	ldr r0, [r0, #0x74]
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r5, #0x10]
	mov r1, #3
	ldr r0, [r0, #0x74]
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E909C: .word 0x04000050
_021E90A0: .word ov101_021EB338
_021E90A4: .word ov101_021EB2FC
	thumb_func_end ov101_021E8E58

	thumb_func_start ov101_021E90A8
ov101_021E90A8: ; 0x021E90A8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	mov r1, #0
	add r5, r0, #0
	mov r0, #1
	add r2, r1, #0
	bl GX_SetGraphicsMode
	mov r4, #0
	mov r6, #3
	add r7, r4, #0
_021E90BE:
	ldr r0, [r5, #0x10]
	add r1, r4, #2
	lsl r1, r1, #0x18
	ldr r0, [r0, #0x74]
	lsr r1, r1, #0x18
	add r2, r6, #0
	add r3, r7, #0
	bl SetBgControlParam
	ldr r0, [r5, #0x10]
	add r1, r4, #2
	lsl r1, r1, #0x18
	ldr r0, [r0, #0x74]
	lsr r1, r1, #0x18
	mov r2, #2
	mov r3, #0
	bl SetBgControlParam
	ldr r0, [r5, #0x10]
	add r1, r4, #2
	lsl r1, r1, #0x18
	mov r2, #0
	ldr r0, [r0, #0x74]
	lsr r1, r1, #0x18
	add r3, r2, #0
	bl SetBgControlParam
	ldr r0, [r5, #0x10]
	add r1, r4, #2
	lsl r1, r1, #0x18
	mov r2, #0
	ldr r0, [r0, #0x74]
	lsr r1, r1, #0x18
	add r3, r2, #0
	bl BgSetPosTextAndCommit
	ldr r0, [r5, #0x10]
	add r1, r4, #2
	lsl r1, r1, #0x18
	ldr r0, [r0, #0x74]
	lsr r1, r1, #0x18
	mov r2, #3
	mov r3, #0
	bl BgSetPosTextAndCommit
	add r4, r4, #1
	cmp r4, #2
	blt _021E90BE
	mov r0, #0
	add r1, r0, #0
	bl ToggleBgLayer
	mov r1, #0
	ldr r0, _021E9258 ; =0x04000050
	add r2, r1, #0
	add r3, r1, #0
	str r1, [sp]
	bl G2x_SetBlendAlpha_
	mov r4, #0
_021E9136:
	ldr r0, [r5, #0x10]
	add r1, r4, #1
	lsl r1, r1, #0x18
	ldr r0, [r0, #0x74]
	lsr r1, r1, #0x18
	bl BgClearTilemapBufferAndCommit
	add r4, r4, #1
	cmp r4, #3
	blt _021E9136
	mov r0, #0x5f
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0x20
	str r1, [sp]
	mov r1, #0xe
	str r1, [sp, #4]
	add r1, r0, #0
	add r1, #0xc
	mov r2, #0
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	str r2, [sp, #0x10]
	ldrh r1, [r0]
	add r3, r2, #0
	lsl r1, r1, #0x15
	lsr r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	mov r1, #2
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x74]
	bl CopyToBgTilemapRect
	mov r0, #6
	lsl r0, r0, #6
	mov r2, #0
	ldr r0, [r5, r0]
	mov r1, #0x20
	str r1, [sp]
	mov r1, #0x18
	str r1, [sp, #4]
	add r1, r0, #0
	add r1, #0xc
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	str r2, [sp, #0x10]
	ldrh r1, [r0]
	add r3, r2, #0
	lsl r1, r1, #0x15
	lsr r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	mov r1, #3
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x74]
	bl CopyToBgTilemapRect
	mov r0, #2
	mov r1, #1
	bl ToggleBgLayer
	ldr r0, [r5, #0x10]
	mov r1, #1
	ldr r0, [r0, #0x74]
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r5, #0x10]
	mov r1, #2
	ldr r0, [r0, #0x74]
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r5, #0x10]
	mov r1, #3
	ldr r0, [r0, #0x74]
	bl ScheduleBgTilemapBufferTransfer
	add r0, r5, #0
	bl ov101_021E8BE8
	add r0, r5, #0
	bl ov101_021E8674
	add r0, r5, #0
	mov r1, #0
	bl ov101_021EA608
	ldrb r0, [r5, #0xc]
	cmp r0, #1
	bne _021E922A
	ldrh r2, [r5, #0x1c]
	ldrh r3, [r5, #0x1e]
	mov r1, #0x46
	lsl r1, r1, #2
	lsl r2, r2, #0x18
	lsl r3, r3, #0x18
	add r0, r5, #0
	add r1, r5, r1
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl ov101_021EA794
	ldr r1, [r5, #0x10]
	ldr r0, [r1, #0xc]
	cmp r0, #1
	ldr r0, [r1, #0x7c]
	beq _021E9222
	mov r1, #1
	add r2, r1, #0
	bl PokegearAppSwitchCursor_SetCursorSpritesDrawState
	b _021E922A
_021E9222:
	mov r1, #1
	mov r2, #0
	bl PokegearAppSwitchCursor_SetCursorSpritesDrawState
_021E922A:
	add r0, r5, #0
	mov r1, #1
	bl ov101_021EAE54
	mov r1, #0x4f
	lsl r1, r1, #2
	ldrb r2, [r5, r1]
	mov r0, #0x7f
	bic r2, r0
	strb r2, [r5, r1]
	ldrb r2, [r5, r1]
	mov r0, #0x80
	bic r2, r0
	strb r2, [r5, r1]
	ldr r1, _021E925C ; =ov101_021EB378
	ldr r0, [r5, #0x10]
	str r1, [r0, #0x5c]
	ldr r1, _021E9260 ; =ov101_021EB364
	ldr r0, [r5, #0x10]
	str r1, [r0, #0x60]
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_021E9258: .word 0x04000050
_021E925C: .word ov101_021EB378
_021E9260: .word ov101_021EB364
	thumb_func_end ov101_021E90A8

	thumb_func_start ov101_021E9264
ov101_021E9264: ; 0x021E9264
	cmp r1, #0
	bne _021E926E
	mov r1, #0
	strh r1, [r0, #0x16]
	strb r1, [r0, #0xc]
_021E926E:
	bx lr
	thumb_func_end ov101_021E9264

	thumb_func_start ov101_021E9270
ov101_021E9270: ; 0x021E9270
	push {r3, lr}
	mov r0, #0x4e
	lsl r0, r0, #2
	ldrb r0, [r1, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1f
	beq _021E9286
	add r0, r1, #0
	add r1, #0xc8
	bl ov101_021E9B70
_021E9286:
	pop {r3, pc}
	thumb_func_end ov101_021E9270

	thumb_func_start ov101_021E9288
ov101_021E9288: ; 0x021E9288
	mov r1, #0x4e
	lsl r1, r1, #2
	ldrb r1, [r0, r1]
	lsl r1, r1, #0x1f
	lsr r1, r1, #0x1f
	beq _021E92F0
	add r1, r0, #0
	add r1, #0xcc
	ldr r2, [r1]
	add r1, r0, #0
	add r1, #0xdc
	ldr r1, [r1]
	add r2, r2, r1
	sub r2, #8
	asr r1, r2, #3
	lsr r1, r1, #0x1c
	add r1, r2, r1
	asr r1, r1, #4
	add r2, r1, #1
	add r1, r0, #0
	add r1, #0xf0
	strh r2, [r1]
	add r1, r0, #0
	add r1, #0xc8
	ldr r2, [r1]
	add r1, r0, #0
	add r1, #0xd8
	ldr r1, [r1]
	add r2, r2, r1
	sub r2, #8
	asr r1, r2, #3
	lsr r1, r1, #0x1c
	add r1, r2, r1
	asr r1, r1, #4
	add r2, r1, #1
	add r1, r0, #0
	add r1, #0xf4
	strh r2, [r1]
	add r1, r0, #0
	add r1, #0xf0
	ldrh r1, [r1]
	add r2, r1, #7
	add r1, r0, #0
	add r1, #0xf2
	strh r2, [r1]
	add r1, r0, #0
	add r1, #0xf4
	ldrh r1, [r1]
	add r0, #0xf6
	add r1, #0xb
	strh r1, [r0]
	bx lr
_021E92F0:
	add r1, r0, #0
	add r1, #0xcc
	ldr r1, [r1]
	neg r2, r1
	asr r1, r2, #2
	lsr r1, r1, #0x1d
	add r1, r2, r1
	asr r1, r1, #3
	add r2, r1, #1
	add r1, r0, #0
	add r1, #0xf0
	strh r2, [r1]
	add r1, r0, #0
	add r1, #0xc8
	ldr r2, [r1]
	asr r1, r2, #2
	lsr r1, r1, #0x1d
	add r1, r2, r1
	asr r1, r1, #3
	add r2, r1, #1
	add r1, r0, #0
	add r1, #0xf4
	strh r2, [r1]
	add r1, r0, #0
	add r1, #0xf0
	ldrh r2, [r1]
	add r1, r0, #0
	add r1, #0xf2
	add r2, #0x10
	strh r2, [r1]
	add r1, r0, #0
	add r1, #0xf4
	ldrh r1, [r1]
	add r1, #0x17
	add r0, #0xf6
	strh r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end ov101_021E9288

	thumb_func_start ov101_021E933C
ov101_021E933C: ; 0x021E933C
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x14
	mov r1, #0
	mov r2, #0x1c
	bl MI_CpuFill8
	ldr r0, _021E93CC ; =0x0000FFFF
	mov r1, #0x4e
	strh r0, [r4, #0x2e]
	mov r0, #1
	lsl r1, r1, #2
	strb r0, [r4, #0x14]
	ldrb r0, [r4, r1]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	strb r0, [r4, #0x15]
	add r0, r1, #0
	sub r0, #0x28
	ldrsh r0, [r4, r0]
	sub r1, #0x26
	strh r0, [r4, #0x1c]
	ldrsh r0, [r4, r1]
	strh r0, [r4, #0x1e]
	add r0, r4, #0
	add r0, #0x84
	ldr r0, [r0]
	ldr r1, [r0, #8]
	mov r0, #0xcc
	ldrsh r0, [r1, r0]
	strh r0, [r4, #0x20]
	add r0, r4, #0
	add r0, #0x84
	ldr r0, [r0]
	ldr r1, [r0, #8]
	mov r0, #0xce
	ldrsh r0, [r1, r0]
	strh r0, [r4, #0x22]
	add r0, r4, #0
	add r0, #0xc8
	ldr r0, [r0]
	strh r0, [r4, #0x28]
	add r0, r4, #0
	add r0, #0xcc
	ldr r0, [r0]
	strh r0, [r4, #0x2a]
	add r0, r4, #0
	add r0, #0xd8
	ldr r0, [r0]
	strh r0, [r4, #0x24]
	add r0, r4, #0
	add r0, #0xdc
	ldr r0, [r0]
	strh r0, [r4, #0x26]
	add r0, r4, #0
	add r0, #0xf0
	ldrh r0, [r0]
	strb r0, [r4, #0x18]
	add r0, r4, #0
	add r0, #0xf2
	ldrh r0, [r0]
	strb r0, [r4, #0x19]
	add r0, r4, #0
	add r0, #0xf4
	ldrh r0, [r0]
	strb r0, [r4, #0x1a]
	add r0, r4, #0
	add r0, #0xf6
	ldrh r0, [r0]
	strb r0, [r4, #0x1b]
	pop {r4, pc}
	nop
_021E93CC: .word 0x0000FFFF
	thumb_func_end ov101_021E933C

	thumb_func_start ov101_021E93D0
ov101_021E93D0: ; 0x021E93D0
	push {r4, lr}
	add r4, r0, #0
	ldrh r1, [r4, #0x1c]
	mov r0, #0x11
	lsl r0, r0, #4
	strh r1, [r4, r0]
	ldrh r1, [r4, #0x1e]
	add r0, r0, #2
	mov r2, #0x1c
	strh r1, [r4, r0]
	mov r0, #0x20
	ldrsh r1, [r4, r0]
	add r0, r4, #0
	add r0, #0x84
	ldr r0, [r0]
	ldr r0, [r0, #8]
	add r0, #0xcc
	strh r1, [r0]
	mov r0, #0x22
	ldrsh r1, [r4, r0]
	add r0, r4, #0
	add r0, #0x84
	ldr r0, [r0]
	ldr r0, [r0, #8]
	add r0, #0xce
	strh r1, [r0]
	mov r0, #0x28
	ldrsh r1, [r4, r0]
	add r0, r4, #0
	add r0, #0xc8
	str r1, [r0]
	mov r0, #0x2a
	ldrsh r1, [r4, r0]
	add r0, r4, #0
	add r0, #0xcc
	str r1, [r0]
	mov r0, #0x24
	ldrsh r1, [r4, r0]
	add r0, r4, #0
	add r0, #0xd8
	str r1, [r0]
	mov r0, #0x26
	ldrsh r1, [r4, r0]
	add r0, r4, #0
	add r0, #0xdc
	str r1, [r0]
	add r0, r4, #0
	ldrb r1, [r4, #0x18]
	add r0, #0xf0
	strh r1, [r0]
	add r0, r4, #0
	ldrb r1, [r4, #0x19]
	add r0, #0xf2
	strh r1, [r0]
	add r0, r4, #0
	ldrb r1, [r4, #0x1a]
	add r0, #0xf4
	strh r1, [r0]
	add r0, r4, #0
	ldrb r1, [r4, #0x1b]
	add r0, #0xf6
	strh r1, [r0]
	add r0, r4, #0
	add r0, #0x14
	mov r1, #0
	bl MI_CpuFill8
	ldr r0, _021E9460 ; =0x0000FFFF
	strh r0, [r4, #0x2e]
	mov r0, #0
	strb r0, [r4, #0x14]
	pop {r4, pc}
	.balign 4, 0
_021E9460: .word 0x0000FFFF
	thumb_func_end ov101_021E93D0

	thumb_func_start ov101_021E9464
ov101_021E9464: ; 0x021E9464
	push {r3, r4, r5, r6}
	ldr r6, _021E94BC ; =0x00000132
	add r5, r1, #0
	add r1, r2, #0
	ldrb r2, [r0, r6]
	add r4, r3, #0
	ldr r3, [sp, #0x10]
	sub r2, r5, r2
	sub r5, r6, #1
	ldrb r5, [r0, r5]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	sub r1, r1, r5
	add r5, r6, #6
	ldrb r0, [r0, r5]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	beq _021E94A4
	asr r0, r2, #3
	lsr r0, r0, #0x1c
	add r0, r2, r0
	asr r0, r0, #4
	strh r0, [r4]
	asr r0, r1, #3
	lsr r0, r0, #0x1c
	add r0, r1, r0
	asr r0, r0, #4
	strh r0, [r3]
	pop {r3, r4, r5, r6}
	bx lr
_021E94A4:
	asr r0, r2, #2
	lsr r0, r0, #0x1d
	add r0, r2, r0
	asr r0, r0, #3
	strh r0, [r4]
	asr r0, r1, #2
	lsr r0, r0, #0x1d
	add r0, r1, r0
	asr r0, r0, #3
	strh r0, [r3]
	pop {r3, r4, r5, r6}
	bx lr
	.balign 4, 0
_021E94BC: .word 0x00000132
	thumb_func_end ov101_021E9464

	thumb_func_start ov101_021E94C0
ov101_021E94C0: ; 0x021E94C0
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	mov r0, #0x11
	add r1, r6, #0
	lsl r0, r0, #4
	add r1, #0xf4
	ldrsh r2, [r6, r0]
	ldrh r1, [r1]
	sub r1, r2, r1
	lsl r1, r1, #0x10
	asr r5, r1, #0x10
	add r1, r0, #2
	ldrsh r2, [r6, r1]
	add r1, r6, #0
	add r1, #0xf0
	ldrh r1, [r1]
	sub r1, r2, r1
	lsl r1, r1, #0x10
	asr r4, r1, #0x10
	add r1, r0, #0
	add r1, #0x28
	ldrb r1, [r6, r1]
	lsl r1, r1, #0x1f
	lsr r1, r1, #0x1f
	add r1, r1, #1
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	lsl r3, r1, #3
	lsl r2, r1, #2
	add r1, r0, #0
	add r1, #0x22
	ldrb r7, [r6, r1]
	add r1, r5, #0
	add r0, #0x21
	ldrb r5, [r6, r0]
	add r0, r4, #0
	mul r1, r3
	mul r0, r3
	add r1, r7, r1
	add r0, r5, r0
	add r1, r2, r1
	add r6, #0x84
	add r2, r2, r0
	ldr r0, [r6]
	ldr r3, [r0, #8]
	add r3, #0xc8
	strh r1, [r3, #4]
	strh r2, [r3, #6]
	mov r1, #4
	mov r2, #6
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	ldr r0, [r3, #0x20]
	bl Sprite_SetPositionXY
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov101_021E94C0

	thumb_func_start ov101_021E9530
ov101_021E9530: ; 0x021E9530
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r4, r0, #0
	add r7, r2, #0
	add r5, r3, #0
	cmp r1, #0
	beq _021E959A
	mov r1, #0x10
	str r1, [sp, #4]
	add r1, sp, #0x14
	str r1, [sp]
	ldr r1, [sp, #4]
	add r2, sp, #0x20
	mov r3, #0x14
	ldrsh r1, [r2, r1]
	ldrsh r2, [r2, r3]
	add r3, sp, #0x14
	add r3, #2
	bl ov101_021E9464
	add r0, sp, #0x14
	ldrh r1, [r0, #2]
	ldrh r3, [r0]
	mov r0, #4
	mov r2, #5
	str r1, [sp, #0xc]
	sub r1, r2, r1
	sub r0, r0, r3
	lsl r1, r1, #0x10
	lsl r0, r0, #0x10
	asr r2, r1, #0x10
	asr r0, r0, #0x10
	sub r1, r5, r3
	mov ip, r0
	sub r0, r1, r0
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp, #8]
	mov r0, #7
	sub r0, r0, r3
	add r1, r5, r0
	mov r0, ip
	sub r0, r1, r0
	lsl r0, r0, #0x10
	asr r6, r0, #0x10
	ldr r0, [sp, #0xc]
	mov r1, #0xb
	sub r0, r7, r0
	sub r0, r0, r2
	lsl r0, r0, #0x10
	asr r3, r0, #0x10
	ldr r0, [sp, #0xc]
	b _021E9606
_021E959A:
	mov r0, #8
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0xc8
	ldr r1, [r0]
	asr r0, r1, #2
	lsr r0, r0, #0x1d
	add r0, r1, r0
	asr r0, r0, #3
	add r0, r0, #1
	sub r1, r7, r0
	add r0, sp, #0x14
	strh r1, [r0, #2]
	add r1, r4, #0
	add r1, #0xcc
	ldr r2, [r1]
	asr r1, r2, #2
	lsr r1, r1, #0x1d
	add r1, r2, r1
	asr r1, r1, #3
	add r1, r1, #1
	sub r1, r5, r1
	strh r1, [r0]
	ldrh r1, [r0, #2]
	ldrh r3, [r0]
	ldr r0, [sp, #4]
	mov r2, #0xb
	str r1, [sp, #0x10]
	sub r1, r2, r1
	sub r0, r0, r3
	lsl r1, r1, #0x10
	lsl r0, r0, #0x10
	asr r2, r1, #0x10
	asr r0, r0, #0x10
	sub r1, r5, r3
	mov ip, r0
	sub r0, r1, r0
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp, #8]
	mov r0, #0x10
	sub r0, r0, r3
	add r1, r5, r0
	mov r0, ip
	sub r0, r1, r0
	lsl r0, r0, #0x10
	asr r6, r0, #0x10
	ldr r0, [sp, #0x10]
	mov r1, #0x17
	sub r0, r7, r0
	sub r0, r0, r2
	lsl r0, r0, #0x10
	asr r3, r0, #0x10
	ldr r0, [sp, #0x10]
_021E9606:
	sub r0, r1, r0
	add r0, r7, r0
	mov r7, #0x41
	sub r0, r0, r2
	lsl r7, r7, #2
	lsl r0, r0, #0x10
	asr r5, r0, #0x10
	ldrh r1, [r4, r7]
	ldr r0, [sp, #8]
	cmp r0, r1
	bge _021E963E
	sub r0, r0, r1
	lsl r0, r0, #0x10
	asr r1, r0, #0x10
	mov r0, ip
	add r0, r0, r1
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	mov ip, r0
	ldr r0, [sp, #8]
	sub r0, r0, r1
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp, #8]
	sub r0, r6, r1
	lsl r0, r0, #0x10
	asr r6, r0, #0x10
	b _021E9666
_021E963E:
	add r0, r7, #2
	ldrh r0, [r4, r0]
	cmp r6, r0
	ble _021E9666
	sub r0, r6, r0
	lsl r0, r0, #0x10
	asr r1, r0, #0x10
	mov r0, ip
	add r0, r0, r1
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	mov ip, r0
	sub r0, r6, r1
	lsl r0, r0, #0x10
	asr r6, r0, #0x10
	ldr r0, [sp, #8]
	sub r0, r0, r1
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp, #8]
_021E9666:
	mov r1, #1
	lsl r1, r1, #8
	ldrh r0, [r4, r1]
	cmp r3, r0
	bge _021E968A
	sub r0, r3, r0
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add r1, r2, r0
	lsl r1, r1, #0x10
	asr r2, r1, #0x10
	sub r1, r3, r0
	sub r0, r5, r0
	lsl r1, r1, #0x10
	lsl r0, r0, #0x10
	asr r3, r1, #0x10
	asr r5, r0, #0x10
	b _021E96AA
_021E968A:
	add r0, r1, #2
	ldrh r0, [r4, r0]
	cmp r5, r0
	ble _021E96AA
	sub r0, r5, r0
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add r1, r2, r0
	lsl r1, r1, #0x10
	asr r2, r1, #0x10
	sub r1, r5, r0
	sub r0, r3, r0
	lsl r1, r1, #0x10
	lsl r0, r0, #0x10
	asr r5, r1, #0x10
	asr r3, r0, #0x10
_021E96AA:
	add r1, r4, #0
	ldr r0, [sp, #8]
	add r1, #0xf0
	strh r0, [r1]
	add r0, r4, #0
	add r0, #0xf2
	strh r6, [r0]
	add r0, r4, #0
	add r0, #0xf4
	strh r3, [r0]
	add r0, r4, #0
	add r0, #0xf6
	strh r5, [r0]
	ldr r0, [sp, #4]
	mul r0, r2
	neg r1, r0
	add r0, r4, #0
	add r0, #0xf8
	strh r1, [r0]
	ldr r0, [sp, #4]
	mov r1, ip
	mul r0, r1
	neg r1, r0
	add r0, r4, #0
	add r0, #0xfa
	strh r1, [r0]
	add r0, r4, #0
	add r0, #0xc8
	ldr r1, [r0]
	mov r0, #0xf8
	ldrsh r0, [r4, r0]
	add r1, r1, r0
	add r0, r4, #0
	add r0, #0xfc
	strh r1, [r0]
	add r0, r4, #0
	add r0, #0xcc
	ldr r1, [r0]
	mov r0, #0xfa
	ldrsh r0, [r4, r0]
	add r1, r1, r0
	add r0, r4, #0
	add r0, #0xfe
	strh r1, [r0]
	add r0, r4, #0
	add r0, #0xc8
	ldr r0, [r0]
	cmp r0, #0
	ble _021E971E
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _021E972C
_021E971E:
	lsl r0, r0, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_021E972C:
	bl _ffix
	add r1, r4, #0
	add r1, #0xe8
	str r0, [r1]
	add r0, r4, #0
	add r0, #0xcc
	ldr r0, [r0]
	cmp r0, #0
	ble _021E9752
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _021E9760
_021E9752:
	lsl r0, r0, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_021E9760:
	bl _ffix
	add r1, r4, #0
	add r1, #0xec
	str r0, [r1]
	ldr r0, _021E9844 ; =0x0000013A
	ldrb r0, [r4, r0]
	cmp r0, #0
	beq _021E9784
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _021E9792
_021E9784:
	lsl r0, r0, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_021E9792:
	add r5, r0, #0
	mov r0, #0xf8
	ldrsh r0, [r4, r0]
	cmp r0, #0
	ble _021E97AE
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _021E97BC
_021E97AE:
	lsl r0, r0, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_021E97BC:
	bl _ffix
	add r6, r0, #0
	add r0, r5, #0
	bl _ffix
	add r1, r0, #0
	add r0, r6, #0
	bl FX_Div
	add r1, r4, #0
	add r1, #0xe0
	str r0, [r1]
	ldr r0, _021E9844 ; =0x0000013A
	ldrb r0, [r4, r0]
	cmp r0, #0
	beq _021E97F0
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _021E97FE
_021E97F0:
	lsl r0, r0, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_021E97FE:
	add r5, r0, #0
	mov r0, #0xfa
	ldrsh r0, [r4, r0]
	cmp r0, #0
	ble _021E981A
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _021E9828
_021E981A:
	lsl r0, r0, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_021E9828:
	bl _ffix
	add r6, r0, #0
	add r0, r5, #0
	bl _ffix
	add r1, r0, #0
	add r0, r6, #0
	bl FX_Div
	add r4, #0xe4
	str r0, [r4]
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E9844: .word 0x0000013A
	thumb_func_end ov101_021E9530

	thumb_func_start ov101_021E9848
ov101_021E9848: ; 0x021E9848
	push {r3, r4, r5, r6, r7, lr}
	add r7, r1, #0
	mov r1, #0x4e
	add r4, r0, #0
	lsl r1, r1, #2
	ldrb r1, [r4, r1]
	add r6, r2, #0
	mov lr, r3
	lsl r1, r1, #0x1f
	ldr r0, [sp, #0x1c]
	ldr r5, [sp, #0x20]
	lsr r1, r1, #0x1f
	add r2, sp, #8
	bne _021E98B2
	mov r1, #0x10
	ldrsh r1, [r2, r1]
	mov r2, #0x4e
	lsl r2, r2, #2
	sub r2, r2, #7
	ldrb r2, [r4, r2]
	sub r1, r1, r2
	asr r2, r1, #3
	lsr r2, r2, #0x1c
	add r2, r1, r2
	lsl r1, r2, #0x14
	mov r2, #0x4e
	lsl r2, r2, #2
	sub r2, r2, #6
	ldrb r3, [r4, r2]
	mov r2, lr
	lsr r1, r1, #0x18
	sub r3, r2, r3
	asr r2, r3, #3
	lsr r2, r2, #0x1c
	add r2, r3, r2
	lsl r2, r2, #0x14
	lsr r2, r2, #0x18
	cmp r2, #5
	bhi _021E989C
	lsl r2, r7, #3
	add r2, #8
	b _021E989E
_021E989C:
	lsl r2, r7, #3
_021E989E:
	str r2, [r0]
	cmp r1, #4
	bls _021E98AC
	lsl r0, r6, #3
	add r0, #8
	str r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_021E98AC:
	lsl r0, r6, #3
	str r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_021E98B2:
	mov r1, #0x10
	ldrsh r1, [r2, r1]
	mov r2, #0x4e
	lsl r2, r2, #2
	sub r2, r2, #7
	ldrb r2, [r4, r2]
	sub r1, r1, r2
	asr r2, r1, #2
	lsr r2, r2, #0x1d
	add r2, r1, r2
	asr r1, r2, #3
	lsr r3, r1, #0x1f
	lsl r1, r1, #0x1f
	sub r1, r1, r3
	mov r2, #0x1f
	ror r1, r2
	mov r2, #0x4e
	lsl r2, r2, #2
	add r1, r3, r1
	sub r2, r2, #6
	ldrb r3, [r4, r2]
	mov r2, lr
	lsl r1, r1, #0x18
	sub r3, r2, r3
	asr r2, r3, #2
	lsr r2, r2, #0x1d
	add r2, r3, r2
	asr r2, r2, #3
	lsr r4, r2, #0x1f
	lsl r3, r2, #0x1f
	sub r3, r3, r4
	mov r2, #0x1f
	ror r3, r2
	add r2, r4, r3
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	add r2, r7, r2
	lsl r2, r2, #3
	lsr r1, r1, #0x18
	str r2, [r0]
	add r0, r6, r1
	lsl r0, r0, #3
	str r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov101_021E9848

	thumb_func_start ov101_021E990C
ov101_021E990C: ; 0x021E990C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r4, r0, #0
	add r0, #0x84
	ldr r0, [r0]
	ldr r5, [r0, #8]
	mov r0, #0x4e
	lsl r0, r0, #2
	ldrb r0, [r4, r0]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	beq _021E992A
	mov r7, #2
	mov r6, #0x10
	b _021E992E
_021E992A:
	mov r7, #1
	mov r6, #8
_021E992E:
	cmp r7, #0
	beq _021E9946
	lsl r0, r7, #0xc
	str r0, [sp, #0xc]
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _021E9956
_021E9946:
	lsl r0, r7, #0xc
	str r0, [sp, #0xc]
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_021E9956:
	bl _ffix
	add r1, r4, #0
	add r1, #0xd0
	str r0, [r1]
	cmp r7, #0
	beq _021E9976
	ldr r0, [sp, #0xc]
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _021E9984
_021E9976:
	ldr r0, [sp, #0xc]
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_021E9984:
	bl _ffix
	add r1, r4, #0
	add r1, #0xd4
	str r0, [r1]
	lsl r0, r6, #0xf
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	ldrb r0, [r4, #0x14]
	cmp r0, #0
	beq _021E99A2
	add r0, r4, #0
	bl ov101_021E93D0
	b _021E9ABC
_021E99A2:
	mov r1, #0
	str r1, [sp]
	mov r3, #0x11
	str r1, [sp, #4]
	lsl r3, r3, #4
	ldrh r2, [r4, r3]
	add r3, r3, #2
	ldrh r3, [r4, r3]
	add r0, r4, #0
	bl ov101_021E9530
	mov r0, #0xfc
	ldrsh r1, [r4, r0]
	add r0, r4, #0
	add r0, #0xc8
	str r1, [r0]
	mov r1, #0xfe
	add r0, r4, #0
	ldrsh r2, [r4, r1]
	add r0, #0xcc
	str r2, [r0]
	add r0, r1, #0
	add r0, #0x12
	ldrsh r0, [r4, r0]
	mov ip, r0
	add r0, r1, #0
	add r0, #0x34
	ldrb r3, [r4, r0]
	add r0, r4, #0
	add r0, #0xf4
	ldrh r2, [r0]
	mov r0, ip
	sub r0, r0, r2
	lsl r0, r0, #3
	add r0, r3, r0
	add r0, r0, #4
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp, #0x18]
	add r0, r1, #0
	add r0, #0x14
	ldrsh r3, [r4, r0]
	add r0, r1, #0
	add r0, #0x33
	ldrb r2, [r4, r0]
	add r0, r4, #0
	add r0, #0xf0
	ldrh r0, [r0]
	add r1, #0x3a
	sub r0, r3, r0
	lsl r0, r0, #3
	add r0, r2, r0
	add r0, r0, #4
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp, #0x14]
	ldrb r0, [r4, r1]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	beq _021E9AAC
	ldr r0, [sp, #0x18]
	mov r2, ip
	str r0, [sp]
	ldr r0, [sp, #0x14]
	lsl r2, r2, #0x10
	lsl r3, r3, #0x10
	str r0, [sp, #4]
	add r0, r4, #0
	mov r1, #1
	lsr r2, r2, #0x10
	lsr r3, r3, #0x10
	bl ov101_021E9530
	ldr r0, [sp, #0x14]
	mov r2, #0x11
	str r0, [sp]
	add r0, r4, #0
	add r0, #0xd8
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0xdc
	str r0, [sp, #8]
	lsl r2, r2, #4
	ldrh r1, [r4, r2]
	add r2, r2, #2
	ldrh r2, [r4, r2]
	ldr r3, [sp, #0x18]
	add r0, r4, #0
	bl ov101_021E9848
	mov r0, #0xfc
	ldrsh r1, [r4, r0]
	add r0, r4, #0
	add r0, #0xc8
	str r1, [r0]
	mov r2, #0xfe
	add r0, r4, #0
	ldrsh r1, [r4, r2]
	add r0, #0xcc
	str r1, [r0]
	add r1, r2, #0
	add r1, #0x12
	ldrsh r3, [r4, r1]
	add r1, r4, #0
	add r1, #0xf4
	add r0, r2, #0
	ldrh r1, [r1]
	add r0, #0x34
	ldrb r0, [r4, r0]
	sub r1, r3, r1
	mul r1, r6
	add r1, r0, r1
	ldr r0, [sp, #0x10]
	add r0, r0, r1
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp, #0x18]
	add r0, r2, #0
	add r0, #0x33
	add r2, #0x14
	ldrb r1, [r4, r0]
	ldrsh r0, [r4, r2]
	add r2, r4, #0
	add r2, #0xf0
	ldrh r2, [r2]
	sub r0, r0, r2
	mul r0, r6
	add r1, r1, r0
	ldr r0, [sp, #0x10]
	add r0, r0, r1
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp, #0x14]
_021E9AAC:
	add r1, r5, #0
	ldr r0, [sp, #0x18]
	add r1, #0xcc
	strh r0, [r1]
	add r1, r5, #0
	ldr r0, [sp, #0x14]
	add r1, #0xce
	strh r0, [r1]
_021E9ABC:
	ldr r1, _021E9B68 ; =0x00000112
	ldrsh r0, [r4, r1]
	sub r1, r1, #2
	ldrsh r2, [r4, r1]
	add r1, r5, #0
	add r1, #0xd4
	strh r2, [r1]
	add r1, r5, #0
	add r1, #0xd6
	strh r0, [r1]
	cmp r7, #0
	beq _021E9AE6
	ldr r0, [sp, #0xc]
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _021E9AF4
_021E9AE6:
	ldr r0, [sp, #0xc]
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_021E9AF4:
	bl _ffix
	str r0, [sp, #0x20]
	str r0, [sp, #0x1c]
	mov r0, #1
	lsl r0, r0, #0xc
	str r0, [sp, #0x24]
	add r0, r5, #0
	add r0, #0xe8
	ldr r0, [r0]
	add r1, sp, #0x1c
	bl Sprite_SetAffineScale
	ldr r3, _021E9B6C ; =0x00000131
	add r2, r4, #0
	add r0, r3, #0
	sub r0, #0x27
	add r2, #0xf0
	ldrsh r0, [r4, r0]
	ldrh r2, [r2]
	ldrb r1, [r4, r3]
	sub r0, r0, r2
	add r2, r3, #0
	sub r2, #0x29
	mul r0, r6
	ldrsh r7, [r4, r2]
	add r2, r4, #0
	add r1, r1, r0
	ldr r0, [sp, #0x10]
	add r2, #0xf4
	ldrh r2, [r2]
	add r1, r0, r1
	add r0, r3, #1
	sub r2, r7, r2
	ldrb r0, [r4, r0]
	mul r2, r6
	add r2, r0, r2
	ldr r0, [sp, #0x10]
	add r2, r0, r2
	add r0, r5, #0
	add r0, #0xf4
	strh r2, [r0]
	add r0, r5, #0
	add r0, #0xf6
	strh r1, [r0]
	add r0, r3, #0
	sub r0, #0x27
	sub r3, #0x29
	ldrsh r2, [r4, r0]
	add r0, r5, #0
	ldrsh r1, [r4, r3]
	add r0, #0xfc
	add r5, #0xfe
	strh r1, [r0]
	strh r2, [r5]
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E9B68: .word 0x00000112
_021E9B6C: .word 0x00000131
	thumb_func_end ov101_021E990C

	thumb_func_start ov101_021E9B70
ov101_021E9B70: ; 0x021E9B70
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r6, r1, #0
	add r4, r0, #0
	ldr r0, [r6, #8]
	bl FX_Inv
	add r5, r0, #0
	ldr r0, [r6, #0xc]
	bl FX_Inv
	str r5, [sp, #4]
	mov r5, #0
	str r5, [sp, #8]
	str r5, [sp, #0xc]
	str r0, [sp, #0x10]
_021E9B90:
	mov r3, #0x4d
	lsl r3, r3, #2
	ldr r0, [r4, #0x10]
	add r1, r5, #2
	lsl r1, r1, #0x18
	ldrsb r3, [r4, r3]
	ldr r7, [r6]
	ldr r0, [r0, #0x74]
	lsr r1, r1, #0x18
	mov r2, #0
	add r3, r7, r3
	bl BgSetPosTextAndCommit
	ldr r3, _021E9BF0 ; =0x00000133
	ldr r0, [r4, #0x10]
	add r1, r5, #2
	lsl r1, r1, #0x18
	ldrsb r3, [r4, r3]
	ldr r7, [r6, #4]
	ldr r0, [r0, #0x74]
	lsr r1, r1, #0x18
	mov r2, #3
	add r3, r7, r3
	bl BgSetPosTextAndCommit
	ldr r0, [r6, #0x14]
	add r1, r5, #2
	str r0, [sp]
	ldr r0, [r4, #0x10]
	lsl r1, r1, #0x18
	ldr r0, [r0, #0x74]
	ldr r3, [r6, #0x10]
	lsr r1, r1, #0x18
	add r2, sp, #4
	bl SetBgAffine
	add r5, r5, #1
	cmp r5, #2
	blt _021E9B90
	mov r1, #0x4e
	lsl r1, r1, #2
	ldrb r2, [r4, r1]
	mov r0, #0x80
	bic r2, r0
	strb r2, [r4, r1]
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_021E9BF0: .word 0x00000133
	thumb_func_end ov101_021E9B70

	thumb_func_start ov101_021E9BF4
ov101_021E9BF4: ; 0x021E9BF4
	push {r4, r5, r6, r7}
	add r3, r1, #0
	add r1, r0, #0
	add r1, #0x84
	ldr r1, [r1]
	mov r4, #0xf4
	ldr r1, [r1, #8]
	ldrsh r4, [r1, r4]
	add r5, r4, r3
	add r4, r1, #0
	add r4, #0xf4
	strh r5, [r4]
	mov r5, #0xf6
	ldrsh r4, [r1, r5]
	add r5, #0x43
	add r6, r4, r2
	add r4, r1, #0
	add r4, #0xf6
	strh r6, [r4]
	ldrb r4, [r0, r5]
	lsl r4, r4, #0x1c
	lsr r4, r4, #0x1f
	beq _021E9C3A
	mov r4, #0xcc
	ldrsh r4, [r1, r4]
	add r5, r4, r3
	add r4, r1, #0
	add r4, #0xcc
	strh r5, [r4]
	mov r4, #0xce
	ldrsh r4, [r1, r4]
	add r5, r4, r2
	add r4, r1, #0
	add r4, #0xce
	strh r5, [r4]
_021E9C3A:
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _021E9C6E
	ldr r0, _021E9CC8 ; =0x0000025E
	mov r5, #0
_021E9C44:
	mov r4, #0x28
	mul r4, r5
	mov r6, #0x97
	add r4, r1, r4
	lsl r6, r6, #2
	ldrsh r6, [r4, r6]
	add r7, r6, r3
	mov r6, #0x97
	lsl r6, r6, #2
	strh r7, [r4, r6]
	add r6, r6, #2
	ldrsh r6, [r4, r6]
	add r6, r6, r2
	strh r6, [r4, r0]
	add r4, r5, #1
	lsl r4, r4, #0x10
	lsr r5, r4, #0x10
	cmp r5, #0x1b
	blo _021E9C44
	pop {r4, r5, r6, r7}
	bx lr
_021E9C6E:
	ldr r0, _021E9CCC ; =0x0000011E
	mov r5, #0
_021E9C72:
	mov r4, #0x28
	mul r4, r5
	mov r6, #0x47
	add r4, r1, r4
	lsl r6, r6, #2
	ldrsh r6, [r4, r6]
	add r7, r6, r3
	mov r6, #0x47
	lsl r6, r6, #2
	strh r7, [r4, r6]
	add r6, r6, #2
	ldrsh r6, [r4, r6]
	add r6, r6, r2
	strh r6, [r4, r0]
	add r4, r5, #1
	lsl r4, r4, #0x10
	lsr r5, r4, #0x10
	cmp r5, #4
	blo _021E9C72
	ldr r0, _021E9CD0 ; =0x000001BE
	mov r5, #0
_021E9C9C:
	mov r4, #0x28
	mul r4, r5
	mov r6, #0x6f
	add r4, r1, r4
	lsl r6, r6, #2
	ldrsh r6, [r4, r6]
	add r7, r6, r3
	mov r6, #0x6f
	lsl r6, r6, #2
	strh r7, [r4, r6]
	add r6, r6, #2
	ldrsh r6, [r4, r6]
	add r6, r6, r2
	strh r6, [r4, r0]
	add r4, r5, #1
	lsl r4, r4, #0x10
	lsr r5, r4, #0x10
	cmp r5, #0x64
	blo _021E9C9C
	pop {r4, r5, r6, r7}
	bx lr
	nop
_021E9CC8: .word 0x0000025E
_021E9CCC: .word 0x0000011E
_021E9CD0: .word 0x000001BE
	thumb_func_end ov101_021E9BF4

	thumb_func_start ov101_021E9CD4
ov101_021E9CD4: ; 0x021E9CD4
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	ldr r0, _021E9D70 ; =0x00000135
	ldrb r2, [r4, r0]
	cmp r2, #0x10
	bls _021E9CE8
	add sp, #8
	mov r0, #1
	pop {r4, pc}
_021E9CE8:
	cmp r1, #0
	bne _021E9D28
	mov r0, #0x10
	sub r0, r0, r2
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	mov r1, #0
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r4, #0x10]
	add r2, r1, #0
	ldr r0, [r0, #0x78]
	mov r3, #0xe0
	bl PaletteData_BlendPalette
	ldr r0, _021E9D70 ; =0x00000135
	mov r2, #0x40
	ldrb r1, [r4, r0]
	mov r0, #0x10
	mov r3, #0xc0
	sub r0, r0, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, [r4, #0x10]
	mov r1, #2
	ldr r0, [r0, #0x78]
	bl PaletteData_BlendPalette
	b _021E9D52
_021E9D28:
	str r2, [sp]
	mov r1, #0
	str r1, [sp, #4]
	ldr r0, [r4, #0x10]
	add r2, r1, #0
	ldr r0, [r0, #0x78]
	mov r3, #0xe0
	bl PaletteData_BlendPalette
	ldr r0, _021E9D70 ; =0x00000135
	mov r1, #2
	ldrb r0, [r4, r0]
	mov r2, #0x40
	mov r3, #0xc0
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0x78]
	bl PaletteData_BlendPalette
_021E9D52:
	ldr r0, _021E9D70 ; =0x00000135
	ldrb r1, [r4, r0]
	cmp r1, #0x10
	blo _021E9D64
	add r1, r1, #2
	strb r1, [r4, r0]
	add sp, #8
	mov r0, #1
	pop {r4, pc}
_021E9D64:
	add r1, r1, #2
	strb r1, [r4, r0]
	mov r0, #0
	add sp, #8
	pop {r4, pc}
	nop
_021E9D70: .word 0x00000135
	thumb_func_end ov101_021E9CD4

	thumb_func_start ov101_021E9D74
ov101_021E9D74: ; 0x021E9D74
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, #0x84
	ldr r0, [r0]
	ldr r2, _021E9E7C ; =0x04001040
	ldr r0, [r0, #8]
	ldr r3, _021E9E80 ; =0x000040C0
	str r0, [sp]
	mov r0, #0xff
	strh r0, [r2]
	add r4, r2, #0
	strh r3, [r2, #4]
	lsl r0, r0, #8
	strh r0, [r2, #2]
	strh r3, [r2, #6]
	add r4, #0xa
	ldrh r6, [r4]
	mov r3, #0x3f
	mov r0, #0x11
	bic r6, r3
	orr r0, r6
	strh r0, [r4]
	add r0, r2, #0
	add r0, #8
	ldrh r4, [r0]
	sub r2, #0x40
	bic r4, r3
	mov r3, #0x1f
	orr r4, r3
	strh r4, [r0]
	ldrh r6, [r0]
	ldr r4, _021E9E84 ; =0xFFFFC0FF
	lsl r3, r3, #8
	and r4, r6
	orr r3, r4
	strh r3, [r0]
	ldr r3, [r2]
	ldr r0, _021E9E88 ; =0xFFFF1FFF
	and r3, r0
	mov r0, #6
	lsl r0, r0, #0xc
	orr r0, r3
	str r0, [r2]
	cmp r1, #0
	bne _021E9E4A
	mov r6, #3
	add r7, r6, #0
	mov r4, #0
	sub r7, #0x83
_021E9DD6:
	ldr r0, [r5, #0x10]
	add r1, r4, #5
	lsl r1, r1, #0x18
	ldr r0, [r0, #0x74]
	lsr r1, r1, #0x18
	add r2, r6, #0
	add r3, r7, #0
	bl BgSetPosTextAndCommit
	add r0, r4, #5
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	mov r1, #1
	bl ToggleBgLayer
	add r4, r4, #1
	cmp r4, #3
	blt _021E9DD6
	ldr r2, [sp]
	ldr r1, _021E9E8C ; =0x0000014B
	mov r3, #0
	mov r7, #0x15
_021E9E02:
	lsr r0, r3, #0x1f
	lsl r6, r3, #0x1f
	sub r6, r6, r0
	mov r4, #0x1f
	ror r6, r4
	add r6, r0, r6
	add r0, r3, r0
	mov r4, #0x68
	mul r4, r6
	add r4, #0x20
	asr r0, r0, #1
	strh r4, [r2, #4]
	add r4, r0, #0
	mul r4, r7
	add r0, r4, r1
	strh r0, [r2, #6]
	add r3, r3, #1
	add r2, #0x28
	cmp r3, #4
	blt _021E9E02
	ldr r0, [sp]
	mov r1, #0x10
	add r0, #0xa4
	strh r1, [r0]
	ldr r0, [sp]
	mov r1, #0x46
	add r0, #0xa6
	lsl r1, r1, #2
	str r0, [sp]
	strh r1, [r0]
	add r0, r5, #0
	add r0, #0x84
	ldr r0, [r0]
	bl ov100_021E6E84
	b _021E9E74
_021E9E4A:
	ldr r0, [r5, #0x10]
	mov r1, #5
	ldr r0, [r0, #0x74]
	add r2, r1, #0
	mov r3, #0
	bl BgSetPosTextAndCommit
	ldr r0, [r5, #0x10]
	mov r1, #6
	ldr r0, [r0, #0x74]
	mov r2, #5
	mov r3, #0
	bl BgSetPosTextAndCommit
	ldr r0, [r5, #0x10]
	mov r1, #7
	ldr r0, [r0, #0x74]
	mov r2, #5
	mov r3, #0
	bl BgSetPosTextAndCommit
_021E9E74:
	mov r0, #0
	str r0, [r5, #0x34]
	str r0, [r5, #0x30]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E9E7C: .word 0x04001040
_021E9E80: .word 0x000040C0
_021E9E84: .word 0xFFFFC0FF
_021E9E88: .word 0xFFFF1FFF
_021E9E8C: .word 0x0000014B
	thumb_func_end ov101_021E9D74

	thumb_func_start ov101_021E9E90
ov101_021E9E90: ; 0x021E9E90
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, #0x84
	ldr r0, [r0]
	add r6, r1, #0
	ldr r4, [r0, #8]
	ldr r0, [r5, #0x30]
	cmp r0, #0
	beq _021E9EA6
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E9EA6:
	cmp r6, #0
	ldr r0, [r5, #0x10]
	bne _021E9EE8
	ldr r0, [r0, #0x74]
	mov r1, #5
	mov r2, #4
	mov r3, #0x20
	bl BgSetPosTextAndCommit
	ldr r0, [r5, #0x10]
	mov r1, #6
	ldr r0, [r0, #0x74]
	mov r2, #4
	mov r3, #0x20
	bl BgSetPosTextAndCommit
	ldr r0, [r5, #0x10]
	mov r1, #7
	ldr r0, [r0, #0x74]
	mov r2, #4
	mov r3, #0x20
	bl BgSetPosTextAndCommit
	mov r2, #0
	mov r0, #6
_021E9ED8:
	ldrsh r1, [r4, r0]
	add r2, r2, #1
	sub r1, #0x20
	strh r1, [r4, #6]
	add r4, #0x28
	cmp r2, #4
	ble _021E9ED8
	b _021E9F22
_021E9EE8:
	mov r1, #5
	ldr r0, [r0, #0x74]
	add r2, r1, #0
	mov r3, #0x20
	bl BgSetPosTextAndCommit
	ldr r0, [r5, #0x10]
	mov r1, #6
	ldr r0, [r0, #0x74]
	mov r2, #5
	mov r3, #0x20
	bl BgSetPosTextAndCommit
	ldr r0, [r5, #0x10]
	mov r1, #7
	ldr r0, [r0, #0x74]
	mov r2, #5
	mov r3, #0x20
	bl BgSetPosTextAndCommit
	mov r2, #0
	mov r0, #6
_021E9F14:
	ldrsh r1, [r4, r0]
	add r2, r2, #1
	add r1, #0x20
	strh r1, [r4, #6]
	add r4, #0x28
	cmp r2, #4
	ble _021E9F14
_021E9F22:
	add r0, r5, #0
	add r0, #0x84
	ldr r0, [r0]
	bl ov100_021E6E84
	ldr r0, [r5, #0x34]
	add r0, r0, #1
	str r0, [r5, #0x34]
	cmp r0, #4
	bge _021E9F3A
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E9F3A:
	mov r4, #0
	mov r0, #1
	str r4, [r5, #0x34]
	str r0, [r5, #0x30]
	cmp r6, #1
	bne _021E9F8A
	add r6, r4, #0
	mov r7, #3
_021E9F4A:
	add r0, r4, #5
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	add r1, r6, #0
	bl ToggleBgLayer
	ldr r0, [r5, #0x10]
	add r1, r4, #5
	lsl r1, r1, #0x18
	ldr r0, [r0, #0x74]
	lsr r1, r1, #0x18
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x10]
	add r1, r4, #5
	lsl r1, r1, #0x18
	ldr r0, [r0, #0x74]
	lsr r1, r1, #0x18
	add r2, r7, #0
	mov r3, #0
	bl BgSetPosTextAndCommit
	ldr r0, [r5, #0x10]
	add r1, r4, #5
	lsl r1, r1, #0x18
	ldr r0, [r0, #0x74]
	lsr r1, r1, #0x18
	bl ScheduleBgTilemapBufferTransfer
	add r4, r4, #1
	cmp r4, #3
	blt _021E9F4A
_021E9F8A:
	ldr r0, _021E9FD0 ; =0x04001000
	ldr r1, _021E9FD4 ; =0xFFFF1FFF
	ldr r2, [r0]
	add r4, r0, #0
	and r1, r2
	str r1, [r0]
	add r1, r0, #0
	mov r2, #0
	add r1, #0x40
	strh r2, [r1]
	add r1, r0, #0
	add r1, #0x44
	strh r2, [r1]
	add r1, r0, #0
	add r1, #0x42
	strh r2, [r1]
	add r1, r0, #0
	add r1, #0x46
	strh r2, [r1]
	add r4, #0x48
	ldrh r1, [r4]
	mov r2, #0x3f
	add r0, #0x4a
	bic r1, r2
	strh r1, [r4]
	ldrh r3, [r4]
	ldr r1, _021E9FD8 ; =0xFFFFC0FF
	and r1, r3
	strh r1, [r4]
	ldrh r1, [r0]
	bic r1, r2
	strh r1, [r0]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E9FD0: .word 0x04001000
_021E9FD4: .word 0xFFFF1FFF
_021E9FD8: .word 0xFFFFC0FF
	thumb_func_end ov101_021E9E90

	thumb_func_start ov101_021E9FDC
ov101_021E9FDC: ; 0x021E9FDC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, #0x84
	ldr r0, [r0]
	ldr r4, _021EA0CC ; =0x04000040
	ldr r0, [r0, #8]
	add r6, r1, #0
	str r0, [sp]
	mov r0, #0xff
	strh r0, [r4]
	mov r1, #0x70
	strh r1, [r4, #4]
	lsl r0, r0, #8
	strh r0, [r4, #2]
	strh r1, [r4, #6]
	add r1, r4, #0
	add r3, r4, #0
	add r1, #0xa
	ldrh r2, [r1]
	mov r0, #0x3f
	mov r7, #0x18
	bic r2, r0
	orr r2, r7
	add r3, #8
	strh r2, [r1]
	ldrh r1, [r3]
	sub r4, #0x40
	bic r1, r0
	mov r0, #0x1f
	orr r1, r0
	strh r1, [r3]
	ldrh r2, [r3]
	ldr r1, _021EA0D0 ; =0xFFFFC0FF
	lsl r0, r0, #8
	and r1, r2
	orr r0, r1
	strh r0, [r3]
	ldr r1, [r4]
	ldr r0, _021EA0D4 ; =0xFFFF1FFF
	and r1, r0
	lsl r0, r7, #0xa
	orr r0, r1
	str r0, [r4]
	cmp r6, #0
	bne _021EA094
	mov r4, #0
	mov r6, #3
	mov r7, #0x70
_021EA03C:
	ldr r0, [r5, #0x10]
	add r1, r4, #1
	lsl r1, r1, #0x18
	ldr r0, [r0, #0x74]
	lsr r1, r1, #0x18
	add r2, r6, #0
	add r3, r7, #0
	bl BgSetPosTextAndCommit
	add r4, r4, #1
	cmp r4, #2
	blt _021EA03C
	mov r1, #0x32
	ldr r0, [sp]
	lsl r1, r1, #4
	add r2, r0, r1
	mov r3, #0x14
	mov r0, #6
_021EA060:
	ldrsh r1, [r2, r0]
	add r3, r3, #1
	sub r1, #0x70
	strh r1, [r2, #6]
	add r2, #0x28
	cmp r3, #0x1b
	ble _021EA060
	add r0, r5, #0
	add r0, #0x84
	ldr r0, [r0]
	bl ov100_021E6E84
	mov r6, #0
	add r4, r5, #0
	mov r7, #4
_021EA07E:
	mov r2, #5
	ldr r0, [r4, #0x44]
	add r1, r7, #0
	mvn r2, r2
	bl sub_020136B4
	add r6, r6, #1
	add r4, #0x10
	cmp r6, #4
	blt _021EA07E
	b _021EA0C4
_021EA094:
	ldr r0, [r5, #0x10]
	mov r1, #1
	ldr r0, [r0, #0x74]
	mov r2, #5
	mov r3, #0
	bl BgSetPosTextAndCommit
	ldr r0, [r5, #0x10]
	mov r1, #2
	ldr r0, [r0, #0x74]
	mov r2, #5
	mov r3, #0
	bl BgSetPosTextAndCommit
	add r0, r5, #0
	add r0, #0x84
	ldr r0, [r0]
	ldr r1, [r0, #8]
	mov r0, #0x76
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #0
	bl Sprite_SetDrawFlag
_021EA0C4:
	mov r0, #0
	str r0, [r5, #0x34]
	str r0, [r5, #0x30]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021EA0CC: .word 0x04000040
_021EA0D0: .word 0xFFFFC0FF
_021EA0D4: .word 0xFFFF1FFF
	thumb_func_end ov101_021E9FDC

	thumb_func_start ov101_021EA0D8
ov101_021EA0D8: ; 0x021EA0D8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	str r1, [sp]
	add r0, #0x84
	ldr r0, [r0]
	ldr r4, [r0, #8]
	ldr r0, [r5, #0x30]
	cmp r0, #0
	beq _021EA0EE
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021EA0EE:
	ldr r0, [sp]
	cmp r0, #0
	ldr r0, [r5, #0x10]
	bne _021EA12A
	ldr r0, [r0, #0x74]
	mov r1, #1
	mov r2, #5
	mov r3, #0x1c
	bl BgSetPosTextAndCommit
	ldr r0, [r5, #0x10]
	mov r1, #2
	ldr r0, [r0, #0x74]
	mov r2, #5
	mov r3, #0x1c
	bl BgSetPosTextAndCommit
	mov r0, #0x32
	lsl r0, r0, #4
	add r3, r4, r0
	mov r2, #0x14
	mov r0, #6
_021EA11A:
	ldrsh r1, [r3, r0]
	add r2, r2, #1
	add r1, #0x1c
	strh r1, [r3, #6]
	add r3, #0x28
	cmp r2, #0x1b
	ble _021EA11A
	b _021EA15C
_021EA12A:
	ldr r0, [r0, #0x74]
	mov r1, #1
	mov r2, #4
	mov r3, #0x1c
	bl BgSetPosTextAndCommit
	ldr r0, [r5, #0x10]
	mov r1, #2
	ldr r0, [r0, #0x74]
	mov r2, #4
	mov r3, #0x1c
	bl BgSetPosTextAndCommit
	mov r0, #0x32
	lsl r0, r0, #4
	add r2, r4, r0
	mov r3, #0x14
	mov r0, #6
_021EA14E:
	ldrsh r1, [r2, r0]
	add r3, r3, #1
	sub r1, #0x1c
	strh r1, [r2, #6]
	add r2, #0x28
	cmp r3, #0x1b
	ble _021EA14E
_021EA15C:
	add r0, r5, #0
	add r0, #0x84
	ldr r0, [r0]
	bl ov100_021E6E84
	mov r6, #0
	add r4, r5, #0
	mov r7, #4
_021EA16C:
	mov r2, #5
	ldr r0, [r4, #0x44]
	add r1, r7, #0
	mvn r2, r2
	bl sub_020136B4
	add r6, r6, #1
	add r4, #0x10
	cmp r6, #4
	blt _021EA16C
	ldr r0, [r5, #0x34]
	add r0, r0, #1
	str r0, [r5, #0x34]
	cmp r0, #4
	bge _021EA18E
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021EA18E:
	mov r4, #0
	str r4, [r5, #0x34]
	mov r0, #1
	str r0, [r5, #0x30]
	ldr r0, [sp]
	cmp r0, #1
	bne _021EA1BE
_021EA19C:
	ldr r0, [r5, #0x10]
	add r1, r4, #1
	lsl r1, r1, #0x18
	ldr r0, [r0, #0x74]
	lsr r1, r1, #0x18
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x10]
	add r1, r4, #1
	lsl r1, r1, #0x18
	ldr r0, [r0, #0x74]
	lsr r1, r1, #0x18
	bl ScheduleBgTilemapBufferTransfer
	add r4, r4, #1
	cmp r4, #2
	blt _021EA19C
_021EA1BE:
	mov r0, #1
	lsl r0, r0, #0x1a
	ldr r2, [r0]
	ldr r1, _021EA230 ; =0xFFFF1FFF
	add r4, r0, #0
	and r1, r2
	str r1, [r0]
	add r1, r0, #0
	mov r2, #0
	add r1, #0x40
	strh r2, [r1]
	add r1, r0, #0
	add r1, #0x44
	strh r2, [r1]
	add r1, r0, #0
	add r1, #0x42
	strh r2, [r1]
	add r1, r0, #0
	add r1, #0x46
	strh r2, [r1]
	add r4, #0x48
	ldrh r1, [r4]
	mov r2, #0x3f
	add r0, #0x4a
	bic r1, r2
	strh r1, [r4]
	ldrh r3, [r4]
	ldr r1, _021EA234 ; =0xFFFFC0FF
	and r1, r3
	strh r1, [r4]
	ldrh r1, [r0]
	bic r1, r2
	strh r1, [r0]
	ldr r0, [sp]
	cmp r0, #0
	bne _021EA22C
	add r0, r5, #0
	add r0, #0x84
	ldr r0, [r0]
	ldr r1, [r0, #8]
	mov r0, #0x76
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #1
	bl Sprite_SetDrawFlag
	ldr r1, [r5, #0x10]
	ldr r0, [r1, #0xc]
	cmp r0, #1
	beq _021EA22C
	ldr r0, [r1, #0x7c]
	mov r1, #1
	add r2, r1, #0
	bl PokegearAppSwitchCursor_SetCursorSpritesDrawState
_021EA22C:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021EA230: .word 0xFFFF1FFF
_021EA234: .word 0xFFFFC0FF
	thumb_func_end ov101_021EA0D8

	thumb_func_start ov101_021EA238
ov101_021EA238: ; 0x021EA238
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r4, r0, #0
	mov r0, #0x4e
	lsl r0, r0, #2
	ldrb r0, [r4, r0]
	add r6, r1, #0
	mov r7, #0
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	lsl r0, r0, #0x17
	lsr r0, r0, #0x18
	str r0, [sp]
_021EA260:
	mov r0, #0x85
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	lsl r0, r7, #4
	add r1, r1, r0
	ldr r0, _021EA4C4 ; =0x00000132
	add r3, r4, #0
	add r3, #0xf4
	ldrb r2, [r4, r0]
	ldrb r0, [r1, #2]
	ldrh r3, [r3]
	ldrh r5, [r1, #4]
	sub r3, r0, r3
	ldr r0, [sp, #4]
	mul r3, r0
	ldr r0, [sp]
	add r2, r2, r3
	add r0, r0, r2
	lsl r2, r5, #0x14
	lsr r3, r2, #0x1c
	ldr r2, [sp, #8]
	mul r2, r3
	add r0, r0, r2
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp, #0xc]
	ldr r0, _021EA4C8 ; =0x00000131
	add r3, r4, #0
	add r3, #0xf0
	ldrb r2, [r4, r0]
	ldrb r0, [r1, #3]
	ldrh r3, [r3]
	sub r3, r0, r3
	ldr r0, [sp, #4]
	mul r3, r0
	ldr r0, [sp]
	add r2, r2, r3
	add r0, r0, r2
	lsl r2, r5, #0x10
	lsr r3, r2, #0x1c
	ldr r2, [sp, #8]
	mul r2, r3
	add r0, r0, r2
	add r2, r7, #0
	add r2, #0xb
	lsl r0, r0, #0x10
	lsl r2, r2, #0x10
	asr r0, r0, #0x10
	lsr r2, r2, #0x10
	cmp r6, #0
	beq _021EA2D0
	cmp r6, #1
	beq _021EA340
	cmp r6, #2
	beq _021EA360
	b _021EA386
_021EA2D0:
	add r5, r2, #0
	add r2, r4, #0
	add r2, #0x84
	ldr r2, [r2]
	mov r3, #0x28
	ldr r2, [r2, #8]
	mul r5, r3
	add r3, r2, r5
	ldr r2, [sp, #0xc]
	strh r2, [r3, #4]
	add r2, r4, #0
	add r2, #0x84
	ldr r2, [r2]
	ldr r2, [r2, #8]
	add r2, r2, r5
	strh r0, [r2, #6]
	ldrh r1, [r1]
	add r0, r4, #0
	bl ov101_021ED614
	cmp r0, #0
	beq _021EA31E
	add r0, r4, #0
	add r0, #0x84
	ldr r0, [r0]
	mov r1, #1
	ldr r0, [r0, #8]
	add r0, r0, r5
	ldr r0, [r0, #0x20]
	bl Sprite_SetDrawFlag
	add r0, r4, #0
	add r0, #0x84
	ldr r0, [r0]
	ldr r0, [r0, #8]
	add r1, r0, r5
	mov r0, #1
	strb r0, [r1, #1]
	b _021EA386
_021EA31E:
	add r0, r4, #0
	add r0, #0x84
	ldr r0, [r0]
	mov r1, #0
	ldr r0, [r0, #8]
	add r0, r0, r5
	ldr r0, [r0, #0x20]
	bl Sprite_SetDrawFlag
	add r0, r4, #0
	add r0, #0x84
	ldr r0, [r0]
	ldr r0, [r0, #8]
	add r1, r0, r5
	mov r0, #0
	strb r0, [r1, #1]
	b _021EA386
_021EA340:
	mov r1, #0x28
	mul r1, r2
	add r2, r4, #0
	add r2, #0x84
	ldr r2, [r2]
	ldr r2, [r2, #8]
	add r3, r2, r1
	ldr r2, [sp, #0xc]
	strh r2, [r3, #8]
	add r2, r4, #0
	add r2, #0x84
	ldr r2, [r2]
	ldr r2, [r2, #8]
	add r1, r2, r1
	strh r0, [r1, #0xa]
	b _021EA386
_021EA360:
	mov r0, #0x28
	add r5, r2, #0
	mul r5, r0
	add r0, r4, #0
	add r0, #0x84
	ldr r0, [r0]
	mov r1, #0
	ldr r0, [r0, #8]
	add r0, r0, r5
	ldr r0, [r0, #0x20]
	bl Sprite_SetDrawFlag
	add r0, r4, #0
	add r0, #0x84
	ldr r0, [r0]
	ldr r0, [r0, #8]
	add r1, r0, r5
	mov r0, #0
	strb r0, [r1, #1]
_021EA386:
	add r0, r7, #1
	lsl r0, r0, #0x10
	lsr r7, r0, #0x10
	cmp r7, #0x64
	bhs _021EA392
	b _021EA260
_021EA392:
	mov r7, #0
_021EA394:
	add r0, r7, #7
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	lsl r0, r7, #1
	add r1, r4, r0
	ldr r0, _021EA4CC ; =0x000009E8
	ldrh r1, [r1, r0]
	cmp r1, #0
	bne _021EA3CC
	add r1, r4, #0
	add r1, #0x84
	ldr r1, [r1]
	mov r0, #0x28
	ldr r1, [r1, #8]
	mul r0, r5
	add r2, r1, r0
	mov r1, #0
	strb r1, [r2, #1]
	add r1, r4, #0
	add r1, #0x84
	ldr r1, [r1]
	ldr r1, [r1, #8]
	add r0, r1, r0
	ldr r0, [r0, #0x20]
	mov r1, #0
	bl Sprite_SetDrawFlag
	b _021EA4B2
_021EA3CC:
	add r0, r4, #0
	bl ov101_021EA758
	ldr r1, _021EA4C4 ; =0x00000132
	add r3, r4, #0
	add r3, #0xf4
	ldrb r2, [r4, r1]
	ldrb r1, [r0, #2]
	ldrh r3, [r3]
	sub r3, r1, r3
	ldr r1, [sp, #4]
	mul r3, r1
	ldr r1, [sp]
	add r2, r2, r3
	add r3, r1, r2
	ldrh r1, [r0, #4]
	ldrb r0, [r0, #3]
	mov ip, r1
	lsl r1, r1, #0x14
	lsr r2, r1, #0x1c
	ldr r1, [sp, #8]
	mul r1, r2
	add r1, r3, r1
	ldr r2, _021EA4C8 ; =0x00000131
	lsl r1, r1, #0x10
	ldrb r3, [r4, r2]
	add r2, r4, #0
	add r2, #0xf0
	ldrh r2, [r2]
	asr r1, r1, #0x10
	sub r2, r0, r2
	ldr r0, [sp, #4]
	mul r2, r0
	ldr r0, [sp]
	add r2, r3, r2
	add r0, r0, r2
	mov r2, ip
	lsl r2, r2, #0x10
	lsr r3, r2, #0x1c
	ldr r2, [sp, #8]
	mul r2, r3
	add r0, r0, r2
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	cmp r6, #0
	beq _021EA432
	cmp r6, #1
	beq _021EA470
	cmp r6, #2
	beq _021EA48E
	b _021EA4B2
_021EA432:
	add r3, r4, #0
	add r3, #0x84
	ldr r3, [r3]
	mov r2, #0x28
	ldr r3, [r3, #8]
	mul r2, r5
	add r3, r3, r2
	strh r1, [r3, #4]
	add r1, r4, #0
	add r1, #0x84
	ldr r1, [r1]
	ldr r1, [r1, #8]
	add r1, r1, r2
	strh r0, [r1, #6]
	add r0, r4, #0
	add r0, #0x84
	ldr r0, [r0]
	ldr r0, [r0, #8]
	add r1, r0, r2
	mov r0, #1
	strb r0, [r1, #1]
	add r0, r4, #0
	add r0, #0x84
	ldr r0, [r0]
	mov r1, #1
	ldr r0, [r0, #8]
	add r0, r0, r2
	ldr r0, [r0, #0x20]
	bl Sprite_SetDrawFlag
	b _021EA4B2
_021EA470:
	add r3, r4, #0
	add r3, #0x84
	ldr r3, [r3]
	mov r2, #0x28
	ldr r3, [r3, #8]
	mul r2, r5
	add r3, r3, r2
	strh r1, [r3, #8]
	add r1, r4, #0
	add r1, #0x84
	ldr r1, [r1]
	ldr r1, [r1, #8]
	add r1, r1, r2
	strh r0, [r1, #0xa]
	b _021EA4B2
_021EA48E:
	add r1, r4, #0
	add r1, #0x84
	ldr r1, [r1]
	mov r0, #0x28
	ldr r1, [r1, #8]
	mul r0, r5
	add r2, r1, r0
	mov r1, #0
	strb r1, [r2, #1]
	add r1, r4, #0
	add r1, #0x84
	ldr r1, [r1]
	ldr r1, [r1, #8]
	add r0, r1, r0
	ldr r0, [r0, #0x20]
	mov r1, #0
	bl Sprite_SetDrawFlag
_021EA4B2:
	add r0, r7, #1
	lsl r0, r0, #0x10
	lsr r7, r0, #0x10
	cmp r7, #4
	bhs _021EA4BE
	b _021EA394
_021EA4BE:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021EA4C4: .word 0x00000132
_021EA4C8: .word 0x00000131
_021EA4CC: .word 0x000009E8
	thumb_func_end ov101_021EA238

	thumb_func_start ov101_021EA4D0
ov101_021EA4D0: ; 0x021EA4D0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	str r1, [sp]
	mov r7, #0
_021EA4D8:
	mov r0, #0xe
	add r1, r7, #0
	mul r1, r0
	ldr r0, _021EA5FC ; =ov101_021F79B4
	add r3, r5, #0
	add r6, r0, r1
	ldrb r4, [r6, #0xa]
	add r3, #0xf4
	ldrh r3, [r3]
	lsl r0, r4, #0x1c
	lsr r0, r0, #0x1c
	lsl r0, r0, #0x12
	asr r2, r0, #0x10
	ldr r0, _021EA600 ; =0x00000132
	ldrb r1, [r5, r0]
	ldrb r0, [r6, #6]
	sub r0, r0, r3
	lsl r0, r0, #3
	add r0, r1, r0
	add r0, r2, r0
	lsl r0, r0, #0x10
	asr r2, r0, #0x10
	lsl r0, r4, #0x18
	ldrb r3, [r6, #7]
	lsr r0, r0, #0x1c
	lsl r0, r0, #0x12
	add r4, r3, #2
	add r3, r5, #0
	add r3, #0xf0
	asr r1, r0, #0x10
	ldr r0, _021EA604 ; =0x00000131
	ldrh r3, [r3]
	ldrb r0, [r5, r0]
	sub r3, r4, r3
	lsl r3, r3, #3
	add r0, r0, r3
	add r0, r1, r0
	lsl r0, r0, #0x10
	asr r1, r0, #0x10
	add r0, r7, #0
	add r0, #0xf
	lsl r0, r0, #0x10
	ldr r3, [sp]
	lsr r0, r0, #0x10
	cmp r3, #0
	beq _021EA540
	cmp r3, #1
	beq _021EA5B8
	add r1, r3, #0
	cmp r1, #2
	beq _021EA5D6
	b _021EA5EC
_021EA540:
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x84
	ldr r0, [r0]
	mov r3, #0x28
	ldr r0, [r0, #8]
	mul r4, r3
	add r0, r0, r4
	strh r2, [r0, #4]
	add r0, r5, #0
	add r0, #0x84
	ldr r0, [r0]
	ldr r0, [r0, #8]
	add r0, r0, r4
	strh r1, [r0, #6]
	ldr r0, [r5, #0x10]
	ldrb r2, [r6, #4]
	ldr r0, [r0, #0x2c]
	mov r1, #2
	bl Save_VarsFlags_FlypointFlagAction
	cmp r0, #0
	beq _021EA582
	add r0, r5, #0
	add r0, #0x84
	ldr r0, [r0]
	mov r1, #1
	ldr r0, [r0, #8]
	add r0, r0, r4
	ldr r0, [r0, #0x20]
	bl Sprite_SetDrawFlag
	b _021EA594
_021EA582:
	add r0, r5, #0
	add r0, #0x84
	ldr r0, [r0]
	mov r1, #0
	ldr r0, [r0, #8]
	add r0, r0, r4
	ldr r0, [r0, #0x20]
	bl Sprite_SetDrawFlag
_021EA594:
	ldrh r1, [r6, #2]
	ldrb r2, [r6, #6]
	ldrb r3, [r6, #7]
	add r0, r5, #0
	bl ov101_021EA804
	cmp r0, #0
	beq _021EA5EC
	add r0, r5, #0
	add r0, #0x84
	ldr r0, [r0]
	mov r1, #0xa
	ldr r0, [r0, #8]
	add r0, r0, r4
	ldr r0, [r0, #0x20]
	bl Sprite_SetAnimCtrlSeq
	b _021EA5EC
_021EA5B8:
	mov r3, #0x28
	mul r3, r0
	add r0, r5, #0
	add r0, #0x84
	ldr r0, [r0]
	ldr r0, [r0, #8]
	add r0, r0, r3
	strh r2, [r0, #8]
	add r0, r5, #0
	add r0, #0x84
	ldr r0, [r0]
	ldr r0, [r0, #8]
	add r0, r0, r3
	strh r1, [r0, #0xa]
	b _021EA5EC
_021EA5D6:
	add r1, r5, #0
	add r1, #0x84
	ldr r1, [r1]
	ldr r2, [r1, #8]
	mov r1, #0x28
	mul r1, r0
	add r0, r2, r1
	ldr r0, [r0, #0x20]
	mov r1, #0
	bl Sprite_SetDrawFlag
_021EA5EC:
	add r0, r7, #1
	lsl r0, r0, #0x10
	lsr r7, r0, #0x10
	cmp r7, #0x1b
	bhs _021EA5F8
	b _021EA4D8
_021EA5F8:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021EA5FC: .word ov101_021F79B4
_021EA600: .word 0x00000132
_021EA604: .word 0x00000131
	thumb_func_end ov101_021EA4D0

	thumb_func_start ov101_021EA608
ov101_021EA608: ; 0x021EA608
	push {r4, r5, r6, lr}
	add r0, #0x84
	ldr r0, [r0]
	cmp r1, #0
	ldr r5, [r0, #8]
	bne _021EA648
	add r0, r5, #0
	add r0, #0xe8
	ldr r0, [r0]
	mov r1, #0
	bl Sprite_SetDrawFlag
	mov r0, #0x11
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0
	bl Sprite_SetDrawFlag
	mov r0, #0x46
	lsl r0, r0, #2
	mov r4, #7
	add r5, r5, r0
	mov r6, #0
_021EA636:
	ldr r0, [r5, #0x20]
	add r1, r6, #0
	bl Sprite_SetDrawFlag
	add r4, r4, #1
	add r5, #0x28
	cmp r4, #0xa
	ble _021EA636
	pop {r4, r5, r6, pc}
_021EA648:
	add r0, r5, #0
	add r0, #0xe8
	ldr r0, [r0]
	mov r1, #1
	bl Sprite_SetDrawFlag
	mov r0, #0x11
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #1
	bl Sprite_SetDrawFlag
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov101_021EA608

	thumb_func_start ov101_021EA664
ov101_021EA664: ; 0x021EA664
	cmp r1, #0xae
	bgt _021EA67A
	bge _021EA68E
	cmp r1, #0x98
	bgt _021EA6B8
	cmp r1, #0x97
	blt _021EA6B8
	beq _021EA68E
	cmp r1, #0x98
	beq _021EA68E
	b _021EA6B8
_021EA67A:
	ldr r3, _021EA6BC ; =0x00000133
	cmp r1, r3
	bgt _021EA684
	beq _021EA6AA
	b _021EA6B8
_021EA684:
	add r2, r3, #0
	add r2, #0xd6
	cmp r1, r2
	beq _021EA69C
	b _021EA6B8
_021EA68E:
	ldr r1, _021EA6C0 ; =0x0000013D
	ldrb r0, [r0, r1]
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1f
	bne _021EA6B8
	mov r0, #1
	bx lr
_021EA69C:
	add r3, #0xa
	ldrb r0, [r0, r3]
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1f
	bne _021EA6B8
	mov r0, #1
	bx lr
_021EA6AA:
	add r3, #0xa
	ldrb r0, [r0, r3]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1f
	bne _021EA6B8
	mov r0, #1
	bx lr
_021EA6B8:
	mov r0, #0
	bx lr
	.balign 4, 0
_021EA6BC: .word 0x00000133
_021EA6C0: .word 0x0000013D
	thumb_func_end ov101_021EA664

	thumb_func_start ov101_021EA6C4
ov101_021EA6C4: ; 0x021EA6C4
	ldr r0, [r1]
	cmp r0, #0
	bne _021EA6CE
	mov r0, #0
	bx lr
_021EA6CE:
	ldrh r1, [r0]
	ldr r0, _021EA6E4 ; =0x00000209
	cmp r1, r0
	beq _021EA6DC
	sub r0, #0xd6
	cmp r1, r0
	bne _021EA6E0
_021EA6DC:
	mov r0, #0
	bx lr
_021EA6E0:
	mov r0, #1
	bx lr
	.balign 4, 0
_021EA6E4: .word 0x00000209
	thumb_func_end ov101_021EA6C4

	thumb_func_start ov101_021EA6E8
ov101_021EA6E8: ; 0x021EA6E8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r4, _021EA754 ; =0x00000136
	str r0, [sp]
	ldrb r0, [r0, r4]
	add r3, r1, #0
	mov r1, #0
	str r0, [sp, #4]
	cmp r0, #0
	ble _021EA74C
	ldr r0, [sp]
	add r4, #0xde
	ldr r0, [r0, r4]
	mov ip, r0
_021EA704:
	lsl r4, r1, #4
	mov r0, ip
	add r4, r0, r4
	ldrb r0, [r4, #2]
	cmp r3, r0
	blo _021EA740
	ldrb r6, [r4, #3]
	cmp r2, r6
	blo _021EA740
	ldrh r7, [r4, #4]
	lsl r5, r7, #0x1c
	lsr r5, r5, #0x1c
	add r0, r0, r5
	cmp r3, r0
	bge _021EA740
	lsl r0, r7, #0x18
	lsr r0, r0, #0x1c
	add r0, r6, r0
	cmp r2, r0
	bge _021EA740
	ldrh r1, [r4]
	ldr r0, [sp]
	bl ov101_021EA664
	cmp r0, #0
	beq _021EA73A
	mov r4, #0
_021EA73A:
	add sp, #8
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_021EA740:
	add r0, r1, #1
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	ldr r0, [sp, #4]
	cmp r1, r0
	blt _021EA704
_021EA74C:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021EA754: .word 0x00000136
	thumb_func_end ov101_021EA6E8

	thumb_func_start ov101_021EA758
ov101_021EA758: ; 0x021EA758
	push {r4, r5, r6, lr}
	ldr r3, _021EA790 ; =0x00000136
	mov r2, #0
	ldrb r5, [r0, r3]
	cmp r5, #0
	ble _021EA78C
	add r3, #0xde
	ldr r3, [r0, r3]
_021EA768:
	lsl r6, r2, #4
	add r4, r3, r6
	ldrh r6, [r3, r6]
	cmp r6, r1
	bne _021EA782
	add r1, r6, #0
	bl ov101_021EA664
	cmp r0, #0
	beq _021EA77E
	mov r4, #0
_021EA77E:
	add r0, r4, #0
	pop {r4, r5, r6, pc}
_021EA782:
	add r2, r2, #1
	lsl r2, r2, #0x10
	lsr r2, r2, #0x10
	cmp r2, r5
	blt _021EA768
_021EA78C:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021EA790: .word 0x00000136
	thumb_func_end ov101_021EA758

	thumb_func_start ov101_021EA794
ov101_021EA794: ; 0x021EA794
	push {r3, r4, r5, r6, r7, lr}
	add r4, r2, #0
	add r7, r3, #0
	add r5, r1, #0
	add r1, r4, #0
	add r2, r7, #0
	add r6, r0, #0
	bl ov101_021EA6E8
	str r0, [r5]
	mov r0, #0x4e
	lsl r0, r0, #2
	ldrb r0, [r6, r0]
	lsl r0, r0, #0x19
	lsr r0, r0, #0x1e
	bne _021EA7C4
	cmp r4, #0x19
	bne _021EA7BC
	cmp r7, #0xa
	beq _021EA7C4
_021EA7BC:
	cmp r4, #0x16
	blo _021EA7C4
	mov r0, #0
	str r0, [r5]
_021EA7C4:
	ldr r0, [r5]
	cmp r0, #0
	bne _021EA7CE
	mov r0, #0
	b _021EA7DC
_021EA7CE:
	mov r1, #0x46
	lsl r1, r1, #2
	ldr r1, [r6, r1]
	add r0, r6, #0
	ldrh r1, [r1]
	bl ov101_021ED614
_021EA7DC:
	str r0, [r5, #4]
	strh r4, [r5, #8]
	strh r7, [r5, #0xa]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov101_021EA794

	thumb_func_start ov101_021EA7E4
ov101_021EA7E4: ; 0x021EA7E4
	push {r4, lr}
	add r4, r0, #0
	add r0, r1, #0
	add r1, r2, #0
	bl ov100_021E5C50
	ldrb r1, [r4, #0xe]
	cmp r1, #1
	beq _021EA7FA
	cmp r0, r1
	bne _021EA7FE
_021EA7FA:
	mov r0, #1
	pop {r4, pc}
_021EA7FE:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov101_021EA7E4

	thumb_func_start ov101_021EA804
ov101_021EA804: ; 0x021EA804
	push {r3, lr}
	cmp r1, #0x3a
	beq _021EA80E
	cmp r1, #0x1e
	bne _021EA812
_021EA80E:
	mov r0, #1
	pop {r3, pc}
_021EA812:
	add r1, r2, #0
	add r2, r3, #0
	bl ov101_021EA7E4
	pop {r3, pc}
	thumb_func_end ov101_021EA804

	thumb_func_start ov101_021EA81C
ov101_021EA81C: ; 0x021EA81C
	push {r3, r4, r5, r6, r7, lr}
	ldr r4, _021EA870 ; =ov101_021F79B4
	str r0, [sp]
	add r5, r1, #0
	add r6, r2, #0
	mov r7, #0
_021EA828:
	ldrb r0, [r4, #6]
	cmp r5, r0
	blt _021EA860
	ldrb r2, [r4, #0xa]
	lsl r1, r2, #0x1c
	lsr r1, r1, #0x1c
	add r0, r0, r1
	cmp r5, r0
	bge _021EA860
	ldrb r1, [r4, #7]
	cmp r6, r1
	blt _021EA860
	lsl r0, r2, #0x18
	lsr r0, r0, #0x1c
	add r0, r1, r0
	cmp r6, r0
	bge _021EA860
	ldr r0, [sp]
	ldrb r2, [r4, #4]
	ldr r0, [r0, #0x10]
	mov r1, #2
	ldr r0, [r0, #0x2c]
	bl Save_VarsFlags_FlypointFlagAction
	cmp r0, #0
	beq _021EA860
	add r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
_021EA860:
	add r7, r7, #1
	add r4, #0xe
	cmp r7, #0x1b
	blt _021EA828
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021EA870: .word ov101_021F79B4
	thumb_func_end ov101_021EA81C

	thumb_func_start ov101_021EA874
ov101_021EA874: ; 0x021EA874
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	add r7, r2, #0
	bl ov101_021EA81C
	cmp r0, #0
	blt _021EA89C
	mov r1, #0xe
	mul r1, r0
	ldr r0, _021EA8A4 ; =ov101_021F79B4 + 2
	add r2, r6, #0
	ldrh r4, [r0, r1]
	add r0, r5, #0
	add r3, r7, #0
	add r1, r4, #0
	bl ov101_021EA804
	cmp r0, #0
	bne _021EA8A0
_021EA89C:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021EA8A0:
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021EA8A4: .word ov101_021F79B4 + 2
	thumb_func_end ov101_021EA874

	thumb_func_start ov101_021EA8A8
ov101_021EA8A8: ; 0x021EA8A8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r4, r1, #0
	sub r1, r3, #2
	str r1, [sp, #4]
	add r7, r2, #0
	ldr r2, [sp, #4]
	add r1, r7, #0
	lsl r2, r2, #0x10
	lsr r2, r2, #0x10
	add r5, r0, #0
	str r3, [sp]
	bl ov101_021EA81C
	add r6, r0, #0
	bpl _021EA902
	ldr r3, [sp]
	add r0, r5, #0
	add r1, r4, #0
	add r2, r7, #0
	bl ov101_021EA794
	mov r0, #0xf
	ldrsb r2, [r5, r0]
	cmp r2, #0
	blt _021EA8FA
	add r0, r5, #0
	add r0, #0x84
	ldr r0, [r0]
	add r2, #0xf
	ldr r1, [r0, #8]
	mov r0, #0x28
	mul r0, r2
	add r0, r1, r0
	ldr r0, [r0, #0x20]
	mov r1, #0xa
	bl Sprite_SetAnimCtrlSeq
	mov r0, #0
	mvn r0, r0
	strb r0, [r5, #0xf]
_021EA8FA:
	mov r0, #0
	add sp, #0xc
	mvn r0, r0
	pop {r4, r5, r6, r7, pc}
_021EA902:
	mov r0, #0xe
	add r1, r6, #0
	mul r1, r0
	ldr r0, _021EA98C ; =ov101_021F79B4
	strh r7, [r4, #8]
	ldrh r0, [r0, r1]
	str r0, [sp, #8]
	ldr r0, [sp]
	ldr r1, [sp, #8]
	strh r0, [r4, #0xa]
	add r0, r5, #0
	bl ov101_021EA758
	str r0, [r4]
	mov r0, #0xf
	ldrsb r1, [r5, r0]
	cmp r1, r6
	beq _021EA97C
	cmp r1, #0
	blt _021EA948
	add r0, r5, #0
	add r0, #0x84
	ldr r0, [r0]
	add r1, #0xf
	mov r2, #0x28
	mul r2, r1
	ldr r0, [r0, #8]
	mov r1, #0xa
	add r0, r0, r2
	ldr r0, [r0, #0x20]
	bl Sprite_SetAnimCtrlSeq
	mov r0, #0
	mvn r0, r0
	strb r0, [r5, #0xf]
_021EA948:
	ldr r1, [sp, #8]
	ldr r3, [sp, #4]
	lsl r1, r1, #0x10
	lsl r3, r3, #0x10
	add r0, r5, #0
	lsr r1, r1, #0x10
	add r2, r7, #0
	lsr r3, r3, #0x10
	bl ov101_021EA804
	cmp r0, #0
	beq _021EA97C
	add r0, r5, #0
	add r0, #0x84
	ldr r0, [r0]
	add r1, r6, #0
	ldr r2, [r0, #8]
	add r1, #0xf
	mov r0, #0x28
	mul r0, r1
	add r0, r2, r0
	ldr r0, [r0, #0x20]
	mov r1, #0xb
	bl Sprite_SetAnimCtrlSeq
	strb r6, [r5, #0xf]
_021EA97C:
	ldr r1, [sp, #8]
	add r0, r5, #0
	bl ov101_021ED614
	str r0, [r4, #4]
	ldr r0, [sp, #8]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021EA98C: .word ov101_021F79B4
	thumb_func_end ov101_021EA8A8

	thumb_func_start ov101_021EA990
ov101_021EA990: ; 0x021EA990
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	bl GF_RTC_GetTimeOfDayWildParam
	mov r1, #0x13
	lsl r1, r1, #4
	ldrb r1, [r5, r1]
	mov r4, #0
	cmp r1, #0
	ble _021EAA06
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
_021EA9AA:
	mov r0, #0x4b
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r3, #0x14
	ldrb r1, [r0, r4]
	mov r0, #0x4a
	lsl r0, r0, #2
	ldr r2, [r5, r0]
	mul r3, r1
	ldr r0, [r2, #4]
	add r3, r0, r3
	ldrh r0, [r3, #6]
	cmp r0, r6
	bne _021EA9FA
	ldrb r0, [r3, #1]
	cmp r0, #0
	bne _021EA9FA
	add r0, r1, #0
	ldr r1, [r5, #0x10]
	add r3, r7, #0
	ldr r1, [r1, #0x24]
	bl PhoneBookTrainerGetRematchInfo
	cmp r0, #0
	beq _021EA9E0
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021EA9E0:
	mov r1, #0x4b
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	mov r0, #0x49
	lsl r0, r0, #2
	ldrb r1, [r1, r4]
	ldr r0, [r5, r0]
	bl PhoneCallPersistentState_PhoneRematches_GiftItemIdGet
	cmp r0, #0
	beq _021EA9FA
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021EA9FA:
	mov r0, #0x13
	lsl r0, r0, #4
	ldrb r0, [r5, r0]
	add r4, r4, #1
	cmp r4, r0
	blt _021EA9AA
_021EAA06:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov101_021EA990

	thumb_func_start ov101_021EAA0C
ov101_021EAA0C: ; 0x021EAA0C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	add r5, r0, #0
	add r0, #0x84
	ldr r0, [r0]
	str r1, [sp, #0x1c]
	ldr r4, [r0, #8]
	mov r0, #0x46
	lsl r0, r0, #2
	add r0, r5, r0
	str r0, [sp, #0x30]
	ldr r0, [r0]
	str r2, [sp, #0x20]
	str r0, [sp, #0x2c]
	ldr r0, [sp, #0x30]
	ldr r0, [r0, #4]
	str r0, [sp, #0x28]
	add r0, r5, #0
	add r0, #0xa4
	ldr r0, [r0]
	bl String_SetEmpty
	mov r0, #0x61
	lsl r0, r0, #2
	mov r7, #0
	add r6, r5, r0
_021EAA40:
	add r0, r6, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r7, r7, #1
	add r6, #0x10
	cmp r7, #3
	blo _021EAA40
	mov r0, #4
	str r0, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _021EAD88 ; =0x00010200
	add r2, #0x85
	str r0, [sp, #8]
	add r0, r5, r2
	ldr r2, [sp, #0x20]
	mov r1, #0
	lsl r2, r2, #2
	add r2, r5, r2
	str r1, [sp, #0xc]
	add r2, #0x9c
	ldr r2, [r2]
	mov r3, #2
	bl AddTextPrinterParameterizedWithColor
	ldrb r0, [r5, #0xd]
	cmp r0, #0
	bne _021EAA9C
	ldr r1, [sp, #0x30]
	add r0, r5, #0
	bl ov101_021EA6C4
	cmp r0, #0
	bne _021EAA92
	add r0, r5, #0
	mov r1, #0
	mov r2, #2
	bl ov101_021EB38C
	b _021EAA9C
_021EAA92:
	mov r1, #0
	add r0, r5, #0
	add r2, r1, #0
	bl ov101_021EB38C
_021EAA9C:
	ldr r0, [sp, #0x2c]
	cmp r0, #0
	bne _021EAAA4
	b _021EAC2E
_021EAAA4:
	add r2, r5, #0
	add r2, #0xa4
	ldrh r0, [r0]
	ldr r1, [r5]
	ldr r2, [r2]
	bl ov101_021EB560
	ldrb r0, [r5, #0xd]
	cmp r0, #2
	bne _021EAABC
	mov r0, #1
	b _021EAABE
_021EAABC:
	mov r0, #0
_021EAABE:
	str r0, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _021EAD88 ; =0x00010200
	mov r1, #0
	str r0, [sp, #8]
	add r2, #0x95
	add r0, r5, r2
	add r2, r5, #0
	str r1, [sp, #0xc]
	add r2, #0xa4
	ldr r2, [r2]
	add r3, r1, #0
	bl AddTextPrinterParameterizedWithColor
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	beq _021EAB48
	mov r0, #0x61
	lsl r0, r0, #2
	mov r6, #0
	add r4, r5, r0
_021EAAEA:
	add r0, r4, #0
	bl CopyWindowToVram
	add r6, r6, #1
	add r4, #0x10
	cmp r6, #1
	bls _021EAAEA
	mov r0, #0x5b
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #8
	str r1, [sp]
	mov r1, #7
	str r1, [sp, #4]
	add r1, r0, #0
	add r1, #0xc
	str r1, [sp, #8]
	mov r1, #0
	str r1, [sp, #0xc]
	str r1, [sp, #0x10]
	ldrh r1, [r0]
	mov r2, #0x17
	mov r3, #0xb
	lsl r1, r1, #0x15
	lsr r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	mov r1, #6
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x74]
	bl CopyToBgTilemapRect
	ldr r0, [r5, #0x10]
	mov r1, #5
	ldr r0, [r0, #0x74]
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r5, #0x10]
	mov r1, #6
	ldr r0, [r0, #0x74]
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
_021EAB48:
	ldr r0, [sp, #0x2c]
	ldrb r0, [r0, #7]
	cmp r0, #0
	beq _021EAB56
	mov r1, #8
	sub r6, r0, #1
	b _021EAB5A
_021EAB56:
	mov r1, #0
	add r6, r1, #0
_021EAB5A:
	mov r0, #0x5b
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r2, #8
	str r2, [sp]
	mov r2, #7
	str r2, [sp, #4]
	add r2, r0, #0
	add r2, #0xc
	str r2, [sp, #8]
	str r1, [sp, #0xc]
	mov r1, #0
	str r1, [sp, #0x10]
	ldrh r1, [r0]
	mov r2, #0x17
	mov r3, #0xb
	lsl r1, r1, #0x15
	lsr r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	mov r1, #6
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x74]
	bl CopyToBgTilemapRect
	mov r0, #0x5d
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #7
	str r1, [sp]
	add r2, r0, #0
	str r1, [sp, #4]
	add r2, #0xc
	str r2, [sp, #8]
	mov r2, #3
	and r2, r6
	add r3, r2, #0
	mul r3, r1
	lsl r2, r3, #0x18
	lsr r2, r2, #0x18
	str r2, [sp, #0xc]
	lsr r2, r6, #2
	add r3, r2, #0
	mul r3, r1
	lsl r2, r3, #0x18
	lsr r2, r2, #0x18
	str r2, [sp, #0x10]
	ldrh r2, [r0]
	mov r3, #0xb
	lsl r2, r2, #0x15
	lsr r2, r2, #0x18
	str r2, [sp, #0x14]
	ldrh r0, [r0, #2]
	mov r2, #0x18
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x74]
	bl CopyToBgTilemapRect
	add r0, r5, #0
	add r0, #0x90
	ldr r0, [r0]
	bl String_SetEmpty
	ldr r1, [sp, #0x2c]
	add r0, r5, #0
	add r2, r5, #0
	add r0, #0x88
	add r2, #0x90
	ldrb r1, [r1, #6]
	ldr r0, [r0]
	ldr r2, [r2]
	bl ReadMsgDataIntoString
	mov r1, #0
	str r1, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _021EAD88 ; =0x00010200
	add r2, #0xa5
	str r0, [sp, #8]
	add r0, r5, r2
	add r2, r5, #0
	str r1, [sp, #0xc]
	add r2, #0x90
	ldr r2, [r2]
	add r3, r1, #0
	bl AddTextPrinterParameterizedWithColor
	ldr r1, [sp, #0x2c]
	add r0, r5, #0
	ldrh r1, [r1]
	bl ov101_021EA990
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0xc0
	ldr r0, [r0]
	bl Sprite_SetDrawFlag
	b _021EAC72
_021EAC2E:
	mov r0, #0x5b
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #8
	str r1, [sp]
	mov r1, #7
	str r1, [sp, #4]
	add r1, r0, #0
	add r1, #0xc
	str r1, [sp, #8]
	mov r1, #0
	str r1, [sp, #0xc]
	str r1, [sp, #0x10]
	ldrh r1, [r0]
	mov r2, #0x17
	mov r3, #0xb
	lsl r1, r1, #0x15
	lsr r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	mov r1, #6
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x74]
	bl CopyToBgTilemapRect
	add r0, r4, #0
	add r0, #0xc0
	ldr r0, [r0]
	mov r1, #0
	bl Sprite_SetDrawFlag
_021EAC72:
	ldr r0, [sp, #0x28]
	cmp r0, #0
	beq _021EAD2A
	mov r0, #0x6d
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x71
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x61
	lsl r0, r0, #2
	add r0, r5, r0
	ldr r7, [sp, #0x28]
	mov r6, #0
	str r0, [sp, #0x34]
_021EAC9C:
	ldr r0, [sp, #0x28]
	add r0, r0, r6
	str r0, [sp, #0x24]
	ldrb r0, [r0, #4]
	cmp r0, #0xf
	ldr r0, [r4, #0x20]
	beq _021EACBC
	mov r1, #1
	bl Sprite_SetDrawFlag
	ldr r1, [sp, #0x24]
	ldr r0, [r4, #0x20]
	ldrb r1, [r1, #4]
	bl Sprite_SetAnimationFrame
	b _021EACC2
_021EACBC:
	mov r1, #0
	bl Sprite_SetDrawFlag
_021EACC2:
	ldrh r2, [r7, #8]
	ldr r0, _021EAD8C ; =0x0000FFFF
	cmp r2, r0
	beq _021EAD1E
	add r0, r5, #0
	add r0, #0x8c
	ldr r0, [r0]
	mov r1, #0
	bl BufferECWord
	add r0, r5, #0
	add r1, r5, #0
	add r2, r5, #0
	add r0, #0x8c
	add r1, #0x90
	add r2, #0xb4
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r2]
	bl StringExpandPlaceholders
	add r2, r5, #0
	lsr r1, r6, #1
	mov r0, #0x15
	mul r0, r1
	add r0, r0, #2
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	mov r0, #0xc1
	lsl r0, r0, #0xa
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	mov r0, #1
	and r0, r6
	add r0, r0, #3
	lsl r1, r0, #4
	ldr r0, [sp, #0x34]
	add r2, #0x90
	add r0, r0, r1
	ldr r2, [r2]
	mov r1, #0
	mov r3, #4
	bl AddTextPrinterParameterizedWithColor
_021EAD1E:
	add r6, r6, #1
	add r4, #0x28
	add r7, r7, #2
	cmp r6, #4
	blo _021EAC9C
	b _021EAD4E
_021EAD2A:
	mov r0, #0x61
	lsl r0, r0, #2
	mov r6, #0
	add r7, r5, r0
_021EAD32:
	ldr r0, [r4, #0x20]
	mov r1, #0
	bl Sprite_SetDrawFlag
	add r0, r6, #3
	lsl r0, r0, #4
	add r0, r7, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r6, r6, #1
	add r4, #0x28
	cmp r6, #4
	blo _021EAD32
_021EAD4E:
	mov r0, #0x61
	lsl r0, r0, #2
	mov r6, #0
	add r4, r5, r0
_021EAD56:
	add r0, r4, #0
	bl CopyWindowToVram
	add r6, r6, #1
	add r4, #0x10
	cmp r6, #4
	bls _021EAD56
	ldr r0, [r5, #0x10]
	mov r1, #5
	ldr r0, [r0, #0x74]
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r5, #0x10]
	mov r1, #6
	ldr r0, [r0, #0x74]
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r5, #0x10]
	mov r1, #7
	ldr r0, [r0, #0x74]
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021EAD88: .word 0x00010200
_021EAD8C: .word 0x0000FFFF
	thumb_func_end ov101_021EAA0C

	thumb_func_start ov101_021EAD90
ov101_021EAD90: ; 0x021EAD90
	push {r3, r4, r5, lr}
	add r4, r1, #0
	mov r1, #0x11
	add r5, r0, #0
	lsl r1, r1, #4
	ldrh r0, [r5, r1]
	add r1, r1, #2
	ldrsh r1, [r5, r1]
	sub r1, r1, #2
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl ov100_021E5C50
	add r3, r0, #0
	lsr r2, r3, #0x1f
	add r2, r3, r2
	asr r3, r2, #1
	mov r2, #1
	add r0, r5, #0
	add r1, r4, #0
	eor r2, r3
	bl ov101_021EAA0C
	pop {r3, r4, r5, pc}
	thumb_func_end ov101_021EAD90

	thumb_func_start ov101_021EADC0
ov101_021EADC0: ; 0x021EADC0
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r0, _021EAE50 ; =0x0000FFFF
	add r6, r1, #0
	cmp r2, r0
	bne _021EADDE
	lsl r0, r6, #4
	add r0, r5, r0
	ldr r0, [r0, #0x44]
	mov r1, #0
	bl sub_020137C0
	add sp, #0x10
	pop {r4, r5, r6, pc}
_021EADDE:
	add r0, r5, #0
	add r0, #0x8c
	ldr r0, [r0]
	mov r1, #0
	bl BufferECWord
	add r0, r5, #0
	add r1, r5, #0
	add r2, r5, #0
	add r0, #0x8c
	add r1, #0x90
	add r2, #0xb4
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r2]
	bl StringExpandPlaceholders
	mov r0, #0x81
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0
	bl FillWindowPixelBufferText_AssumeTileSize32
	mov r1, #0
	add r2, r5, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	mov r0, #0xc1
	lsl r0, r0, #0xa
	str r0, [sp, #8]
	mov r0, #0x81
	lsl r0, r0, #2
	str r1, [sp, #0xc]
	add r2, #0x90
	ldr r2, [r2]
	add r0, r5, r0
	add r3, r1, #0
	bl AddTextPrinterParameterizedWithColor
	add r4, r5, #0
	mov r2, #0x81
	lsl r2, r2, #2
	add r4, #0x44
	lsl r6, r6, #4
	ldr r0, [r4, r6]
	ldr r1, [r5, #0x40]
	ldr r3, [r5]
	add r2, r5, r2
	bl sub_020139D0
	ldr r0, [r4, r6]
	mov r1, #1
	bl sub_020137C0
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021EAE50: .word 0x0000FFFF
	thumb_func_end ov101_021EADC0

	thumb_func_start ov101_021EAE54
ov101_021EAE54: ; 0x021EAE54
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r7, r0, #0
	add r0, #0x84
	ldr r0, [r0]
	ldr r4, [r0, #8]
	mov r0, #0x46
	lsl r0, r0, #2
	add r0, r7, r0
	ldr r5, [r0]
	ldr r0, [r0, #4]
	cmp r1, #0
	str r0, [sp, #0x10]
	beq _021EAEBE
	add r0, r7, #0
	add r0, #0xa4
	ldr r0, [r0]
	bl String_SetEmpty
	mov r0, #0x7d
	lsl r0, r0, #2
	add r0, r7, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r2, r7, #0
	add r2, #0xa4
	ldrh r0, [r5]
	ldr r1, [r7]
	ldr r2, [r2]
	bl ov101_021EB560
	mov r0, #5
	str r0, [sp]
	mov r1, #0
	add r2, r7, #0
	ldr r0, _021EAF38 ; =0x00010200
	str r1, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x7d
	lsl r0, r0, #2
	str r1, [sp, #0xc]
	add r2, #0xa4
	ldr r2, [r2]
	add r0, r7, r0
	add r3, r1, #0
	bl AddTextPrinterParameterizedWithColor
	ldr r0, [r7, #0x10]
	mov r1, #1
	ldr r0, [r0, #0x74]
	bl ScheduleBgTilemapBufferTransfer
_021EAEBE:
	ldr r0, [sp, #0x10]
	cmp r0, #0
	bne _021EAEEA
	mov r6, #0xd
	mov r5, #0
	lsl r6, r6, #6
_021EAECA:
	ldr r0, [r4, r6]
	mov r1, #0
	bl Sprite_SetDrawFlag
	lsl r1, r5, #0x18
	ldr r2, _021EAF3C ; =0x0000FFFF
	add r0, r7, #0
	lsr r1, r1, #0x18
	bl ov101_021EADC0
	add r5, r5, #1
	add r4, #0x28
	cmp r5, #4
	blo _021EAECA
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
_021EAEEA:
	mov r5, #0
	add r6, r0, #0
_021EAEEE:
	ldr r0, [sp, #0x10]
	add r0, r0, r5
	ldrb r1, [r0, #4]
	cmp r1, #0xf
	bne _021EAF06
	mov r0, #0xd
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0
	bl Sprite_SetDrawFlag
	b _021EAF1C
_021EAF06:
	mov r0, #0xd
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	bl Sprite_SetAnimationFrame
	mov r0, #0xd
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #1
	bl Sprite_SetDrawFlag
_021EAF1C:
	ldrh r2, [r6, #8]
	lsl r1, r5, #0x18
	add r0, r7, #0
	lsr r1, r1, #0x18
	bl ov101_021EADC0
	add r5, r5, #1
	add r4, #0x28
	add r6, r6, #2
	cmp r5, #4
	blo _021EAEEE
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_021EAF38: .word 0x00010200
_021EAF3C: .word 0x0000FFFF
	thumb_func_end ov101_021EAE54

	thumb_func_start ov101_021EAF40
ov101_021EAF40: ; 0x021EAF40
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r0, #0
	mov r0, #0x17
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0x2f
	str r1, [sp]
	mov r1, #0x14
	str r1, [sp, #4]
	add r1, r0, #0
	add r1, #0xc
	mov r2, #0
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	str r2, [sp, #0x10]
	ldrh r1, [r0]
	add r3, r2, #0
	lsl r1, r1, #0x15
	lsr r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	mov r1, #3
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x74]
	bl CopyToBgTilemapRect
	mov r0, #0x4e
	lsl r0, r0, #2
	ldrb r1, [r5, r0]
	lsl r1, r1, #0x19
	lsr r1, r1, #0x1e
	beq _021EAF8E
	cmp r1, #1
	beq _021EAFC6
	b _021EAFFA
_021EAF8E:
	add r0, #0x38
	ldr r0, [r5, r0]
	mov r1, #6
	str r1, [sp]
	mov r1, #0x14
	str r1, [sp, #4]
	add r1, r0, #0
	add r1, #0xc
	str r1, [sp, #8]
	mov r1, #0x30
	str r1, [sp, #0xc]
	mov r3, #0
	str r3, [sp, #0x10]
	ldrh r1, [r0]
	mov r2, #0x16
	lsl r1, r1, #0x15
	lsr r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	mov r1, #3
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x74]
	bl CopyToBgTilemapRect
	b _021EAFFA
_021EAFC6:
	add r0, #0x38
	ldr r0, [r5, r0]
	mov r1, #3
	str r1, [sp]
	mov r2, #0x14
	str r2, [sp, #4]
	add r2, r0, #0
	add r2, #0xc
	str r2, [sp, #8]
	mov r2, #0x36
	str r2, [sp, #0xc]
	mov r3, #0
	str r3, [sp, #0x10]
	ldrh r2, [r0]
	lsl r2, r2, #0x15
	lsr r2, r2, #0x18
	str r2, [sp, #0x14]
	ldrh r0, [r0, #2]
	mov r2, #0x1d
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x74]
	bl CopyToBgTilemapRect
_021EAFFA:
	ldr r4, _021EB1D8 ; =ov101_021F79B4
	mov r7, #0
_021EAFFE:
	ldrh r0, [r4]
	cmp r0, #0x4b
	beq _021EB08E
	ldrb r0, [r4, #5]
	cmp r0, #0xff
	beq _021EB08E
	mov r0, #0x4e
	lsl r0, r0, #2
	ldrb r0, [r5, r0]
	lsl r0, r0, #0x19
	lsr r0, r0, #0x1e
	cmp r0, #2
	bhs _021EB024
	ldrb r0, [r4, #6]
	ldrb r1, [r4, #7]
	bl ov100_021E5C50
	cmp r0, #0
	beq _021EB08E
_021EB024:
	ldr r0, [r5, #0x10]
	ldrb r2, [r4, #4]
	ldr r0, [r0, #0x2c]
	mov r1, #2
	bl Save_VarsFlags_FlypointFlagAction
	cmp r0, #0
	bne _021EB08E
	ldrb r1, [r4, #0xb]
	mov r0, #0x17
	lsl r0, r0, #4
	lsl r1, r1, #0x1c
	ldr r0, [r5, r0]
	lsr r1, r1, #0x1c
	str r1, [sp]
	ldrb r1, [r4, #0xb]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x1c
	str r1, [sp, #4]
	add r1, r0, #0
	add r1, #0xc
	str r1, [sp, #8]
	ldrb r1, [r4, #8]
	str r1, [sp, #0xc]
	ldrb r1, [r4, #9]
	str r1, [sp, #0x10]
	ldrh r1, [r0]
	lsl r1, r1, #0x15
	lsr r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	mov r1, #3
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldrb r6, [r4, #0xc]
	ldrb r2, [r4, #6]
	ldr r0, [r5, #0x10]
	lsl r3, r6, #0x1c
	lsr r3, r3, #0x1c
	sub r2, r2, r3
	lsl r6, r6, #0x18
	lsl r2, r2, #0x18
	ldrb r3, [r4, #7]
	lsr r6, r6, #0x1c
	ldr r0, [r0, #0x74]
	sub r3, r3, r6
	add r3, r3, #2
	lsl r3, r3, #0x18
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl CopyToBgTilemapRect
_021EB08E:
	add r7, r7, #1
	add r4, #0xe
	cmp r7, #0x1b
	blt _021EAFFE
	ldr r0, _021EB1DC ; =0x0000013D
	ldrb r1, [r5, r0]
	lsl r2, r1, #0x1e
	lsr r2, r2, #0x1f
	beq _021EB0E0
	lsl r1, r1, #0x1f
	lsr r1, r1, #0x1f
	bne _021EB158
	add r0, #0x33
	ldr r0, [r5, r0]
	mov r1, #5
	str r1, [sp]
	mov r1, #6
	str r1, [sp, #4]
	add r1, r0, #0
	add r1, #0xc
	str r1, [sp, #8]
	mov r1, #0x30
	str r1, [sp, #0xc]
	mov r1, #0x1b
	str r1, [sp, #0x10]
	ldrh r1, [r0]
	mov r2, #1
	mov r3, #9
	lsl r1, r1, #0x15
	lsr r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	mov r1, #3
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x74]
	bl CopyToBgTilemapRect
	b _021EB158
_021EB0E0:
	lsl r1, r1, #0x1f
	lsr r1, r1, #0x1f
	beq _021EB120
	add r0, #0x33
	ldr r0, [r5, r0]
	mov r1, #5
	str r1, [sp]
	mov r1, #6
	str r1, [sp, #4]
	add r1, r0, #0
	add r1, #0xc
	str r1, [sp, #8]
	mov r1, #0x29
	str r1, [sp, #0xc]
	mov r1, #0x14
	str r1, [sp, #0x10]
	ldrh r1, [r0]
	mov r2, #1
	mov r3, #9
	lsl r1, r1, #0x15
	lsr r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	mov r1, #3
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x74]
	bl CopyToBgTilemapRect
	b _021EB158
_021EB120:
	add r0, #0x33
	ldr r0, [r5, r0]
	mov r1, #5
	str r1, [sp]
	mov r1, #6
	str r1, [sp, #4]
	add r1, r0, #0
	add r1, #0xc
	str r1, [sp, #8]
	mov r1, #0x29
	str r1, [sp, #0xc]
	mov r1, #0x1b
	str r1, [sp, #0x10]
	ldrh r1, [r0]
	mov r2, #1
	mov r3, #9
	lsl r1, r1, #0x15
	lsr r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	mov r1, #3
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x74]
	bl CopyToBgTilemapRect
_021EB158:
	ldr r0, _021EB1DC ; =0x0000013D
	ldrb r1, [r5, r0]
	lsl r1, r1, #0x1d
	lsr r1, r1, #0x1f
	beq _021EB198
	add r0, #0x33
	ldr r0, [r5, r0]
	mov r1, #3
	str r1, [sp]
	mov r2, #4
	str r2, [sp, #4]
	add r2, r0, #0
	add r2, #0xc
	str r2, [sp, #8]
	mov r2, #0x37
	str r2, [sp, #0xc]
	mov r2, #0x14
	str r2, [sp, #0x10]
	ldrh r2, [r0]
	mov r3, #1
	lsl r2, r2, #0x15
	lsr r2, r2, #0x18
	str r2, [sp, #0x14]
	ldrh r0, [r0, #2]
	mov r2, #0x13
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x74]
	bl CopyToBgTilemapRect
_021EB198:
	ldr r0, _021EB1DC ; =0x0000013D
	ldrb r1, [r5, r0]
	lsl r1, r1, #0x1c
	lsr r1, r1, #0x1f
	beq _021EB1D4
	add r0, #0x33
	ldr r0, [r5, r0]
	mov r1, #3
	str r1, [sp]
	add r2, r0, #0
	str r1, [sp, #4]
	add r2, #0xc
	str r2, [sp, #8]
	mov r2, #0x37
	str r2, [sp, #0xc]
	mov r2, #0x18
	str r2, [sp, #0x10]
	ldrh r3, [r0]
	lsl r3, r3, #0x15
	lsr r3, r3, #0x18
	str r3, [sp, #0x14]
	ldrh r0, [r0, #2]
	mov r3, #0xf
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x74]
	bl CopyToBgTilemapRect
_021EB1D4:
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021EB1D8: .word ov101_021F79B4
_021EB1DC: .word 0x0000013D
	thumb_func_end ov101_021EAF40

	thumb_func_start ov101_021EB1E0
ov101_021EB1E0: ; 0x021EB1E0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r5, r0, #0
	ldrb r0, [r5, #0xd]
	cmp r0, #1
	beq _021EB2CA
	cmp r1, #0
	beq _021EB1FA
	mov r1, #0x46
	lsl r1, r1, #2
	ldr r0, [r5, r1]
	cmp r0, #0
	bne _021EB218
_021EB1FA:
	ldr r0, [r5, #0x10]
	mov r1, #2
	ldr r0, [r0, #0x74]
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x10]
	mov r1, #2
	ldr r0, [r0, #0x74]
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, _021EB2D0 ; =0x00000152
	mov r1, #0
	add sp, #0x20
	strh r1, [r5, r0]
	pop {r3, r4, r5, r6, r7, pc}
_021EB218:
	ldrh r2, [r0]
	add r0, r1, #0
	add r0, #0x3a
	ldrh r0, [r5, r0]
	cmp r2, r0
	beq _021EB2CA
	add r1, #0x3a
	strh r2, [r5, r1]
	ldr r0, [r5, #0x10]
	mov r1, #2
	ldr r0, [r0, #0x74]
	bl BgClearTilemapBufferAndCommit
	mov r0, #0
	str r0, [sp, #0x1c]
	ldr r0, _021EB2D4 ; =0x00000136
	ldrb r0, [r5, r0]
	cmp r0, #0
	ble _021EB2C0
	ldr r4, [sp, #0x1c]
_021EB240:
	mov r0, #0x85
	lsl r0, r0, #2
	ldr r2, [r5, r0]
	sub r0, #0xfc
	ldr r0, [r5, r0]
	ldrh r1, [r0]
	ldrh r0, [r2, r4]
	cmp r1, r0
	bne _021EB2AE
	add r0, r2, r4
	ldrb r3, [r0, #0xe]
	ldrb r1, [r0, #0xf]
	add r2, r3, #0
	mul r2, r1
	cmp r2, #9
	ldrb r2, [r0, #2]
	blt _021EB272
	ldrb r6, [r0, #3]
	sub r2, r2, #1
	lsl r2, r2, #0x10
	sub r6, r6, #1
	lsl r6, r6, #0x10
	lsr r2, r2, #0x10
	lsr r7, r6, #0x10
	b _021EB274
_021EB272:
	ldrb r7, [r0, #3]
_021EB274:
	mov r6, #0x17
	lsl r6, r6, #4
	ldr r6, [r5, r6]
	lsl r2, r2, #0x18
	str r3, [sp]
	str r1, [sp, #4]
	add r1, r6, #0
	add r1, #0xc
	str r1, [sp, #8]
	ldrb r1, [r0, #0xc]
	lsl r3, r7, #0x18
	lsr r2, r2, #0x18
	str r1, [sp, #0xc]
	ldrb r0, [r0, #0xd]
	mov r1, #2
	lsr r3, r3, #0x18
	str r0, [sp, #0x10]
	ldrh r0, [r6]
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x14]
	ldrh r0, [r6, #2]
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x74]
	bl CopyToBgTilemapRect
_021EB2AE:
	ldr r0, [sp, #0x1c]
	add r4, #0x10
	add r0, r0, #1
	str r0, [sp, #0x1c]
	ldr r0, _021EB2D4 ; =0x00000136
	ldrb r1, [r5, r0]
	ldr r0, [sp, #0x1c]
	cmp r0, r1
	blt _021EB240
_021EB2C0:
	ldr r0, [r5, #0x10]
	mov r1, #2
	ldr r0, [r0, #0x74]
	bl ScheduleBgTilemapBufferTransfer
_021EB2CA:
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021EB2D0: .word 0x00000152
_021EB2D4: .word 0x00000136
	thumb_func_end ov101_021EB1E0

	thumb_func_start ov101_021EB2D8
ov101_021EB2D8: ; 0x021EB2D8
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x84
	ldr r0, [r0]
	mov r1, #0
	ldr r0, [r0, #8]
	add r0, #0xe8
	ldr r0, [r0]
	bl Sprite_SetDrawFlag
	ldr r1, _021EB2F8 ; =0x00000139
	mov r0, #8
	ldrb r2, [r4, r1]
	bic r2, r0
	strb r2, [r4, r1]
	pop {r4, pc}
	.balign 4, 0
_021EB2F8: .word 0x00000139
	thumb_func_end ov101_021EB2D8

	thumb_func_start ov101_021EB2FC
ov101_021EB2FC: ; 0x021EB2FC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x10]
	mov r1, #0
	ldr r0, [r0, #0x7c]
	add r2, r1, #0
	bl PokegearAppSwitchCursor_SetCursorSpritesDrawState
	add r0, r4, #0
	bl ov101_021E94C0
	add r0, r4, #0
	add r0, #0x84
	ldr r0, [r0]
	mov r1, #1
	ldr r0, [r0, #8]
	add r0, #0xe8
	ldr r0, [r0]
	bl Sprite_SetDrawFlag
	add r0, r4, #0
	mov r1, #1
	bl ov101_021EB1E0
	mov r0, #2
	mov r1, #1
	bl ToggleBgLayer
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov101_021EB2FC

	thumb_func_start ov101_021EB338
ov101_021EB338: ; 0x021EB338
	push {r4, lr}
	add r4, r0, #0
	bl ov101_021E94C0
	add r0, r4, #0
	add r0, #0x84
	ldr r0, [r0]
	mov r1, #1
	ldr r0, [r0, #8]
	add r0, #0xe8
	ldr r0, [r0]
	bl Sprite_SetDrawFlag
	ldr r1, _021EB360 ; =0x00000139
	mov r0, #8
	ldrb r2, [r4, r1]
	bic r2, r0
	strb r2, [r4, r1]
	pop {r4, pc}
	nop
_021EB360: .word 0x00000139
	thumb_func_end ov101_021EB338

	thumb_func_start ov101_021EB364
ov101_021EB364: ; 0x021EB364
	ldr r0, [r0, #0x10]
	ldr r3, _021EB370 ; =PokegearAppSwitchCursor_SetCursorSpritesDrawState
	ldr r0, [r0, #0x7c]
	ldr r1, _021EB374 ; =0x0000FFFF
	mov r2, #0
	bx r3
	.balign 4, 0
_021EB370: .word PokegearAppSwitchCursor_SetCursorSpritesDrawState
_021EB374: .word 0x0000FFFF
	thumb_func_end ov101_021EB364

	thumb_func_start ov101_021EB378
ov101_021EB378: ; 0x021EB378
	ldr r0, [r0, #0x10]
	ldr r3, _021EB384 ; =PokegearAppSwitchCursor_SetCursorSpritesDrawState
	ldr r0, [r0, #0x7c]
	ldr r1, _021EB388 ; =0x0000FFFF
	mov r2, #1
	bx r3
	.balign 4, 0
_021EB384: .word PokegearAppSwitchCursor_SetCursorSpritesDrawState
_021EB388: .word 0x0000FFFF
	thumb_func_end ov101_021EB378

	thumb_func_start ov101_021EB38C
ov101_021EB38C: ; 0x021EB38C
	push {r3, r4, lr}
	sub sp, #0x1c
	add r4, r0, #0
	cmp r1, #0
	bne _021EB3D8
	mov r0, #0x5e
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r3, #6
	str r3, [sp]
	mov r1, #7
	str r1, [sp, #4]
	add r1, r0, #0
	add r1, #0xc
	str r1, [sp, #8]
	add r1, r2, #0
	mul r1, r3
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	str r1, [sp, #0xc]
	mov r1, #0x15
	str r1, [sp, #0x10]
	ldrh r1, [r0]
	mov r2, #0x1a
	mov r3, #2
	lsl r1, r1, #0x15
	lsr r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	mov r1, #1
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0x74]
	bl CopyToBgTilemapRect
	b _021EB41A
_021EB3D8:
	mov r0, #0x5e
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r3, #6
	str r3, [sp]
	mov r1, #9
	str r1, [sp, #4]
	add r1, r0, #0
	add r1, #0xc
	str r1, [sp, #8]
	add r1, r2, #0
	mul r1, r3
	add r1, #0x12
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	str r1, [sp, #0xc]
	mov r1, #0x15
	str r1, [sp, #0x10]
	ldrh r1, [r0]
	mov r2, #0x1a
	mov r3, #0xb
	lsl r1, r1, #0x15
	lsr r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	mov r1, #1
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0x74]
	bl CopyToBgTilemapRect
_021EB41A:
	ldr r0, [r4, #0x10]
	mov r1, #1
	ldr r0, [r0, #0x74]
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x1c
	pop {r3, r4, pc}
	thumb_func_end ov101_021EB38C

	thumb_func_start ov101_021EB428
ov101_021EB428: ; 0x021EB428
	push {r4, r5, lr}
	sub sp, #0x24
	add r5, r0, #0
	add r4, r1, #0
	add r0, sp, #0xc
	mov r1, #0
	mov r2, #0x18
	bl MI_CpuFill8
	ldr r0, _021EB4C0 ; =ov101_021F7E80
	add r2, sp, #0xc
	ldrh r3, [r0]
	add r1, sp, #0xc
	strh r3, [r2]
	ldrh r3, [r0, #2]
	strh r3, [r2, #2]
	ldrh r3, [r0, #4]
	strh r3, [r2, #4]
	ldrh r3, [r0, #6]
	strh r3, [r2, #6]
	ldrh r3, [r0, #8]
	ldrh r0, [r0, #0xa]
	strh r3, [r2, #8]
	strh r0, [r2, #0xa]
	add r0, r5, #0
	add r0, #0xc0
	ldr r0, [r0]
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x74]
	str r0, [sp, #0x1c]
	mov r0, #2
	strb r0, [r2, #0x14]
	cmp r4, #8
	blo _021EB472
	cmp r4, #0xf
	bls _021EB49A
_021EB472:
	mov r0, #4
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r2, [r5, #0x10]
	add r0, r5, #0
	ldr r2, [r2, #0xc]
	add r0, #0xbc
	lsl r2, r2, #0x18
	ldr r0, [r0]
	add r1, sp, #0xc
	lsr r2, r2, #0x18
	mov r3, #0xb
	bl TouchscreenListMenu_Create
	add r5, #0xc4
	add sp, #0x24
	str r0, [r5]
	pop {r4, r5, pc}
_021EB49A:
	mov r0, #4
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r2, [r5, #0x10]
	add r0, r5, #0
	ldr r2, [r2, #0xc]
	add r0, #0xbc
	lsl r2, r2, #0x18
	ldr r0, [r0]
	lsr r2, r2, #0x18
	mov r3, #3
	bl TouchscreenListMenu_Create
	add r5, #0xc4
	str r0, [r5]
	add sp, #0x24
	pop {r4, r5, pc}
	.balign 4, 0
_021EB4C0: .word ov101_021F7E80
	thumb_func_end ov101_021EB428

	thumb_func_start ov101_021EB4C4
ov101_021EB4C4: ; 0x021EB4C4
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0x7d
	lsl r0, r0, #2
	add r4, r1, #0
	add r0, r5, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	cmp r4, #0
	bge _021EB4FC
	mov r1, #0
	str r1, [sp]
	ldr r0, _021EB55C ; =0x00030200
	str r1, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x7d
	lsl r0, r0, #2
	add r0, r5, r0
	str r1, [sp, #0xc]
	add r5, #0xa8
	ldr r2, [r5]
	mov r3, #8
	bl AddTextPrinterParameterizedWithColor
	add sp, #0x10
	pop {r3, r4, r5, pc}
_021EB4FC:
	add r2, r5, #0
	add r2, #0xa4
	lsl r0, r4, #0x10
	ldr r1, [r5]
	ldr r2, [r2]
	lsr r0, r0, #0x10
	bl ov101_021EB560
	mov r1, #0
	add r2, r5, #0
	str r1, [sp]
	mov r0, #2
	str r0, [sp, #4]
	add r0, r5, #0
	add r0, #0x8c
	add r2, #0xa4
	ldr r0, [r0]
	ldr r2, [r2]
	add r3, r1, #0
	bl BufferString
	add r0, r5, #0
	add r1, r5, #0
	add r2, r5, #0
	add r0, #0x8c
	add r1, #0x90
	add r2, #0xac
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r2]
	bl StringExpandPlaceholders
	mov r1, #0
	str r1, [sp]
	ldr r0, _021EB55C ; =0x00030200
	str r1, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x7d
	lsl r0, r0, #2
	add r0, r5, r0
	str r1, [sp, #0xc]
	add r5, #0x90
	ldr r2, [r5]
	mov r3, #8
	bl AddTextPrinterParameterizedWithColor
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021EB55C: .word 0x00030200
	thumb_func_end ov101_021EB4C4

	thumb_func_start ov101_021EB560
ov101_021EB560: ; 0x021EB560
	ldr r3, _021EB564 ; =sub_02068F98
	bx r3
	.balign 4, 0
_021EB564: .word sub_02068F98
	thumb_func_end ov101_021EB560

	thumb_func_start ov101_021EB568
ov101_021EB568: ; 0x021EB568
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021EB5D4 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #2
	tst r0, r1
	beq _021EB5B6
	ldr r0, _021EB5D8 ; =0x00000139
	ldrb r0, [r4, r0]
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1f
	bne _021EB5B6
	ldr r0, [r4, #0x10]
	mov r2, #1
	strb r2, [r0, #6]
	ldr r0, [r4, #0x10]
	mov r1, #0
	ldr r0, [r0, #0x7c]
	bl PokegearAppSwitchCursor_SetCursorSpritesDrawState
	ldr r0, [r4, #0x10]
	bl ov100_021E5DC8
	add r2, r0, #0
	ldr r0, [r4, #0x10]
	mov r1, #0
	ldr r0, [r0, #0x7c]
	bl PokegearAppSwitch_SetSpecIndexAndCursorPos
	add r0, r4, #0
	bl ov101_021EB2D8
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	mov r0, #0
	mvn r0, r0
	pop {r4, pc}
_021EB5B6:
	add r0, r4, #0
	bl ov101_021EB818
	cmp r0, #7
	beq _021EB5D0
	add r0, r4, #0
	bl ov101_021EC304
	add r0, r4, #0
	bl ov101_021EC778
	mov r0, #0
	mvn r0, r0
_021EB5D0:
	pop {r4, pc}
	nop
_021EB5D4: .word gSystem
_021EB5D8: .word 0x00000139
	thumb_func_end ov101_021EB568

	thumb_func_start ov101_021EB5DC
ov101_021EB5DC: ; 0x021EB5DC
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r1, _021EB650 ; =0x00000139
	mov r0, #0
	ldrb r1, [r5, r1]
	mvn r0, r0
	lsl r1, r1, #0x1c
	lsr r1, r1, #0x1f
	bne _021EB5F6
	ldr r0, [r5, #0x10]
	bl PokegearApp_HandleTouchInput_SwitchApps
_021EB5F6:
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _021EB604
	mov r1, #1
	str r1, [r4]
	pop {r4, r5, r6, pc}
_021EB604:
	ldr r0, _021EB650 ; =0x00000139
	ldrb r0, [r5, r0]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1f
	bne _021EB640
	add r0, r5, #0
	add r1, r4, #0
	bl ov101_021EBA44
	add r6, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _021EB630
	ldr r1, [r5, #0x10]
	ldrb r0, [r1, #6]
	cmp r0, #1
	bne _021EB630
	mov r0, #0
	strb r0, [r1, #6]
	add r0, r5, #0
	bl ov101_021EB2FC
_021EB630:
	cmp r6, #7
	bne _021EB638
	add r0, r6, #0
	pop {r4, r5, r6, pc}
_021EB638:
	add r0, r5, #0
	bl ov101_021EC778
	b _021EB64C
_021EB640:
	mov r0, #1
	str r0, [r4]
	add r0, r5, #0
	bl ov101_021EC0AC
	add r6, r0, #0
_021EB64C:
	add r0, r6, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021EB650: .word 0x00000139
	thumb_func_end ov101_021EB5DC

	thumb_func_start ov101_021EB654
ov101_021EB654: ; 0x021EB654
	push {r3, r4, r5, r6}
	add r2, r0, #0
	ldr r0, _021EB778 ; =gSystem
	mov r4, #0
	ldr r5, [r0, #0x44]
	add r0, r2, #0
	add r0, #0x84
	ldr r0, [r0]
	add r3, r5, #0
	ldr r1, [r0, #8]
	mov r0, #0x40
	add r1, #0xc8
	tst r3, r0
	beq _021EB6A0
	add r6, r0, #0
	add r3, r0, #0
	add r6, #0xc4
	add r3, #0xd2
	ldrh r6, [r2, r6]
	ldrsh r3, [r2, r3]
	add r6, r6, #1
	cmp r3, r6
	ble _021EB6D6
	add r3, r0, #0
	add r3, #0xd2
	ldrsh r3, [r2, r3]
	sub r4, r3, #1
	add r3, r0, #0
	add r3, #0xd2
	strh r4, [r2, r3]
	add r3, r0, #0
	add r3, #0xfb
	ldrb r3, [r2, r3]
	mov r4, #1
	add r0, #0xfb
	orr r3, r4
	strb r3, [r2, r0]
	b _021EB6D6
_021EB6A0:
	mov r0, #0x80
	add r3, r5, #0
	tst r3, r0
	beq _021EB6D6
	add r3, r0, #0
	add r3, #0x92
	ldrsh r6, [r2, r3]
	add r3, r0, #0
	add r3, #0x86
	ldrh r3, [r2, r3]
	cmp r6, r3
	bge _021EB6D6
	add r3, r0, #0
	add r3, #0x92
	ldrsh r3, [r2, r3]
	add r4, r3, #1
	add r3, r0, #0
	add r3, #0x92
	strh r4, [r2, r3]
	add r3, r0, #0
	add r3, #0xbb
	ldrb r4, [r2, r3]
	mov r3, #2
	add r0, #0xbb
	orr r3, r4
	strb r3, [r2, r0]
	mov r4, #1
_021EB6D6:
	mov r0, #0x20
	add r3, r5, #0
	tst r3, r0
	beq _021EB70A
	add r3, r0, #0
	add r3, #0xf0
	ldrsh r5, [r2, r3]
	add r3, r0, #0
	add r3, #0xe0
	ldrh r3, [r2, r3]
	add r3, r3, #1
	cmp r5, r3
	ble _021EB73A
	add r3, r0, #0
	add r3, #0xf0
	ldrsh r3, [r2, r3]
	add r0, #0xf0
	sub r3, r3, #1
	strh r3, [r2, r0]
	ldr r3, _021EB77C ; =0x0000013B
	mov r0, #4
	ldrb r4, [r2, r3]
	orr r0, r4
	strb r0, [r2, r3]
	mov r4, #1
	b _021EB73A
_021EB70A:
	mov r6, #0x10
	add r3, r5, #0
	tst r3, r6
	beq _021EB73A
	add r3, r0, #0
	add r3, #0xf0
	add r6, #0xf2
	ldrsh r5, [r2, r3]
	ldrh r3, [r2, r6]
	sub r3, r3, #1
	cmp r5, r3
	bge _021EB73A
	add r3, r0, #0
	add r3, #0xf0
	ldrsh r3, [r2, r3]
	add r0, #0xf0
	add r3, r3, #1
	strh r3, [r2, r0]
	ldr r3, _021EB77C ; =0x0000013B
	mov r0, #8
	ldrb r4, [r2, r3]
	orr r0, r4
	strb r0, [r2, r3]
	mov r4, #1
_021EB73A:
	cmp r4, #0
	beq _021EB772
	ldr r3, _021EB780 ; =0x0000013A
	mov r0, #2
	strb r0, [r2, r3]
	sub r0, r3, #1
	ldrb r4, [r2, r0]
	mov r0, #1
	bic r4, r0
	add r5, r4, #0
	mov r0, #1
	orr r5, r0
	sub r4, r3, #1
	strb r5, [r2, r4]
	ldrb r5, [r2, r4]
	mov r4, #4
	orr r5, r4
	sub r4, r3, #1
	strb r5, [r2, r4]
	add r4, r3, #0
	ldrh r5, [r1, #4]
	sub r4, #0x26
	sub r3, #0x24
	strh r5, [r2, r4]
	ldrh r1, [r1, #6]
	strh r1, [r2, r3]
	pop {r3, r4, r5, r6}
	bx lr
_021EB772:
	mov r0, #0
	pop {r3, r4, r5, r6}
	bx lr
	.balign 4, 0
_021EB778: .word gSystem
_021EB77C: .word 0x0000013B
_021EB780: .word 0x0000013A
	thumb_func_end ov101_021EB654

	thumb_func_start ov101_021EB784
ov101_021EB784: ; 0x021EB784
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	cmp r1, #0
	bge _021EB796
	mov r0, #0
	add sp, #8
	mvn r0, r0
	pop {r4, pc}
_021EB796:
	ldr r2, [r4, #0x10]
	mov r3, #5
	str r3, [r2, #0x1c]
	ldr r2, [r4, #0x10]
	ldr r2, [r2, #0x20]
	strh r1, [r2, #0x20]
	mov r1, #0x11
	lsl r1, r1, #4
	ldr r2, [r4, #0x10]
	ldrsh r3, [r4, r1]
	ldr r2, [r2, #0x20]
	add r1, r1, #2
	str r3, [r2, #0x18]
	ldrsh r1, [r4, r1]
	sub r2, r1, #2
	ldr r1, [r4, #0x10]
	ldr r1, [r1, #0x20]
	str r2, [r1, #0x1c]
	ldr r1, [r4, #0x10]
	ldr r1, [r1, #0xc]
	cmp r1, #1
	bne _021EB7DA
	add r1, sp, #4
	str r1, [sp]
	ldr r3, _021EB814 ; =gSystem + 0x40
	mov r1, #0x20
	mov r2, #0x22
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	add r3, sp, #4
	add r3, #2
	bl ov101_021E9464
	b _021EB7F6
_021EB7DA:
	add r1, r4, #0
	add r1, #0x84
	ldr r1, [r1]
	mov r2, #0xce
	ldr r3, [r1, #8]
	add r1, sp, #4
	str r1, [sp]
	mov r1, #0xcc
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	add r3, sp, #4
	add r3, #2
	bl ov101_021E9464
_021EB7F6:
	mov r1, #0x46
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	add r0, r4, #0
	ldrh r1, [r1]
	bl ov101_021EB4C4
	add r1, sp, #4
	ldrh r1, [r1, #2]
	add r0, r4, #0
	bl ov101_021EB428
	mov r0, #8
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
_021EB814: .word gSystem + 0x40
	thumb_func_end ov101_021EB784

	thumb_func_start ov101_021EB818
ov101_021EB818: ; 0x021EB818
	push {r3, r4, r5, lr}
	ldr r2, _021EB938 ; =gSystem
	add r4, r0, #0
	ldr r1, [r2, #0x48]
	ldr r2, [r2, #0x44]
	cmp r2, #0
	beq _021EB83C
	ldr r2, _021EB93C ; =0x00000139
	ldrb r5, [r4, r2]
	lsl r3, r5, #0x1f
	lsr r3, r3, #0x1f
	bne _021EB83C
	lsl r3, r5, #0x1e
	lsr r3, r3, #0x1f
	bne _021EB83C
	lsl r3, r5, #0x1d
	lsr r3, r3, #0x1f
	beq _021EB842
_021EB83C:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
_021EB842:
	mov r3, #1
	lsl r3, r3, #0xa
	add r5, r1, #0
	tst r5, r3
	beq _021EB8D0
	sub r1, r2, #1
	ldrb r5, [r4, r1]
	mov r3, #1
	add r1, r5, #0
	bic r1, r3
	lsl r3, r5, #0x1f
	lsr r3, r3, #0x1f
	mov r5, #1
	eor r3, r5
	lsl r3, r3, #0x18
	lsr r3, r3, #0x18
	and r3, r5
	orr r3, r1
	sub r1, r2, #1
	strb r3, [r4, r1]
	mov r3, #4
	add r1, r2, #1
	strb r3, [r4, r1]
	add r1, r4, #0
	add r1, #0xdc
	str r1, [sp]
	add r1, r2, #0
	sub r1, #0x29
	sub r2, #0x27
	add r3, r4, #0
	ldrh r1, [r4, r1]
	ldrh r2, [r4, r2]
	add r3, #0xd8
	bl ov101_021EC49C
	ldr r2, _021EB93C ; =0x00000139
	mov r0, #1
	ldrb r3, [r4, r2]
	add r1, r5, #0
	bic r3, r0
	add r0, r3, #0
	orr r0, r1
	strb r0, [r4, r2]
	ldrb r3, [r4, r2]
	mov r0, #2
	orr r0, r3
	strb r0, [r4, r2]
	sub r2, r2, #1
	ldrb r2, [r4, r2]
	add r0, r4, #0
	lsl r2, r2, #0x1f
	lsr r2, r2, #0x1f
	bl ov101_021EB38C
	mov r0, #0x4e
	lsl r0, r0, #2
	ldrb r0, [r4, r0]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _021EB8C4
	ldr r0, _021EB940 ; =0x00000943
	bl PlaySE
	b _021EB8CA
_021EB8C4:
	ldr r0, _021EB944 ; =0x00000949
	bl PlaySE
_021EB8CA:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
_021EB8D0:
	lsl r3, r3, #1
	tst r1, r3
	beq _021EB8FC
	sub r2, #0x21
	add r1, r4, r2
	bl ov101_021EA6C4
	cmp r0, #0
	bne _021EB8E8
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
_021EB8E8:
	add r0, r4, #0
	mov r1, #0
	mov r2, #1
	bl ov101_021EB38C
	ldr r0, _021EB948 ; =0x00000941
	bl PlaySE
	mov r0, #7
	pop {r3, r4, r5, pc}
_021EB8FC:
	bl ov101_021EB654
	cmp r0, #0
	beq _021EB932
	mov r3, #0x46
	lsl r3, r3, #2
	add r2, r3, #0
	add r1, r4, r3
	sub r2, #8
	sub r3, r3, #6
	ldrsh r2, [r4, r2]
	ldrsh r3, [r4, r3]
	add r0, r4, #0
	lsl r2, r2, #0x18
	lsl r3, r3, #0x18
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl ov101_021EA794
	add r0, r4, #0
	mov r1, #0
	bl ov101_021EAD90
	add r0, r4, #0
	mov r1, #1
	bl ov101_021EB1E0
_021EB932:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021EB938: .word gSystem
_021EB93C: .word 0x00000139
_021EB940: .word 0x00000943
_021EB944: .word 0x00000949
_021EB948: .word 0x00000941
	thumb_func_end ov101_021EB818

	thumb_func_start ov101_021EB94C
ov101_021EB94C: ; 0x021EB94C
	push {r3, r4, r5, lr}
	ldr r2, _021EBA38 ; =gSystem
	add r4, r0, #0
	ldr r1, [r2, #0x48]
	ldr r2, [r2, #0x44]
	cmp r2, #0
	beq _021EB96A
	ldr r3, _021EBA3C ; =0x00000139
	ldrb r2, [r4, r3]
	lsl r5, r2, #0x1f
	lsr r5, r5, #0x1f
	bne _021EB96A
	lsl r2, r2, #0x1d
	lsr r2, r2, #0x1f
	beq _021EB970
_021EB96A:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
_021EB970:
	mov r2, #1
	tst r2, r1
	beq _021EB9AC
	ldrb r2, [r4, #0xd]
	cmp r2, #1
	bne _021EB9AC
	add r1, r3, #0
	sub r3, #0x27
	ldrsh r2, [r4, r3]
	sub r1, #0x29
	ldrh r1, [r4, r1]
	sub r2, r2, #2
	lsl r2, r2, #0x10
	lsr r2, r2, #0x10
	bl ov101_021EA874
	add r5, r0, #0
	cmp r5, #0
	ble _021EB9A6
	ldr r0, _021EBA40 ; =0x00000941
	bl PlaySE
	add r0, r4, #0
	add r1, r5, #0
	bl ov101_021EB784
	pop {r3, r4, r5, pc}
_021EB9A6:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
_021EB9AC:
	mov r0, #2
	tst r0, r1
	beq _021EB9BE
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	mov r0, #4
	pop {r3, r4, r5, pc}
_021EB9BE:
	add r0, r4, #0
	bl ov101_021EB654
	cmp r0, #0
	bne _021EB9CE
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
_021EB9CE:
	ldrb r0, [r4, #0xd]
	cmp r0, #2
	bne _021EBA04
	mov r3, #0x46
	lsl r3, r3, #2
	add r2, r3, #0
	add r1, r4, r3
	sub r2, #8
	sub r3, r3, #6
	ldrsh r2, [r4, r2]
	ldrsh r3, [r4, r3]
	add r0, r4, #0
	lsl r2, r2, #0x18
	lsl r3, r3, #0x18
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl ov101_021EA794
	add r0, r4, #0
	mov r1, #1
	bl ov101_021EAD90
	add r0, r4, #0
	mov r1, #1
	bl ov101_021EB1E0
	b _021EBA32
_021EBA04:
	mov r3, #0x46
	lsl r3, r3, #2
	add r2, r3, #0
	add r1, r4, r3
	sub r2, #8
	sub r3, r3, #6
	ldrsh r2, [r4, r2]
	ldrsh r3, [r4, r3]
	add r0, r4, #0
	lsl r2, r2, #0x18
	lsl r3, r3, #0x18
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl ov101_021EA8A8
	add r0, r4, #0
	mov r1, #0
	bl ov101_021EAD90
	add r0, r4, #0
	mov r1, #1
	bl ov101_021EB1E0
_021EBA32:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021EBA38: .word gSystem
_021EBA3C: .word 0x00000139
_021EBA40: .word 0x00000941
	thumb_func_end ov101_021EB94C

	thumb_func_start ov101_021EBA44
ov101_021EBA44: ; 0x021EBA44
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	add r4, r1, #0
	bl System_GetTouchHeld
	cmp r0, #0
	bne _021EBA5C
	mov r0, #0
	add sp, #8
	mvn r0, r0
	pop {r4, r5, r6, pc}
_021EBA5C:
	ldr r0, _021EBBF8 ; =0x00000139
	ldrb r0, [r5, r0]
	lsl r1, r0, #0x1f
	lsr r1, r1, #0x1f
	bne _021EBA6C
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1f
	beq _021EBA74
_021EBA6C:
	mov r0, #0
	add sp, #8
	mvn r0, r0
	pop {r4, r5, r6, pc}
_021EBA74:
	ldr r0, _021EBBFC ; =ov101_021F7EAC
	bl TouchscreenHitbox_FindRectAtTouchNew
	add r6, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r6, r0
	beq _021EBB48
	mov r0, #1
	str r0, [r4]
	add r0, r5, #0
	bl ov101_021E94C0
	cmp r6, #0
	bne _021EBAC0
	mov r1, #0x46
	lsl r1, r1, #2
	add r0, r5, #0
	add r1, r5, r1
	bl ov101_021EA6C4
	cmp r0, #0
	bne _021EBAAA
	mov r0, #0
	add sp, #8
	mvn r0, r0
	pop {r4, r5, r6, pc}
_021EBAAA:
	add r0, r5, #0
	mov r1, #0
	mov r2, #1
	bl ov101_021EB38C
	ldr r0, _021EBC00 ; =0x00000941
	bl PlaySE
	add sp, #8
	mov r0, #7
	pop {r4, r5, r6, pc}
_021EBAC0:
	mov r2, #0x4e
	lsl r2, r2, #2
	ldrb r3, [r5, r2]
	mov r1, #1
	add r0, r3, #0
	bic r0, r1
	lsl r1, r3, #0x1f
	lsr r1, r1, #0x1f
	mov r3, #1
	eor r1, r3
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	and r1, r3
	orr r0, r1
	strb r0, [r5, r2]
	mov r1, #4
	add r0, r2, #2
	strb r1, [r5, r0]
	add r1, r2, #0
	add r0, r5, #0
	add r0, #0xdc
	str r0, [sp]
	sub r1, #0x28
	sub r2, #0x26
	add r3, r5, #0
	ldrh r1, [r5, r1]
	ldrh r2, [r5, r2]
	add r0, r5, #0
	add r3, #0xd8
	bl ov101_021EC49C
	ldr r2, _021EBBF8 ; =0x00000139
	mov r0, #1
	ldrb r3, [r5, r2]
	mov r1, #1
	bic r3, r0
	add r0, r3, #0
	orr r0, r1
	strb r0, [r5, r2]
	ldrb r3, [r5, r2]
	mov r0, #2
	orr r0, r3
	strb r0, [r5, r2]
	sub r2, r2, #1
	ldrb r2, [r5, r2]
	add r0, r5, #0
	lsl r2, r2, #0x1f
	lsr r2, r2, #0x1f
	bl ov101_021EB38C
	mov r0, #0x4e
	lsl r0, r0, #2
	ldrb r0, [r5, r0]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _021EBB3A
	ldr r0, _021EBC04 ; =0x00000943
	bl PlaySE
	b _021EBB40
_021EBB3A:
	ldr r0, _021EBC08 ; =0x00000949
	bl PlaySE
_021EBB40:
	mov r0, #0
	add sp, #8
	mvn r0, r0
	pop {r4, r5, r6, pc}
_021EBB48:
	ldr r0, _021EBC0C ; =ov101_021F7EA4
	bl TouchscreenHitbox_TouchNewIsIn
	cmp r0, #0
	bne _021EBB5A
	mov r0, #0
	add sp, #8
	mvn r0, r0
	pop {r4, r5, r6, pc}
_021EBB5A:
	mov r1, #1
	add r0, sp, #4
	strh r1, [r0]
	add r0, sp, #4
	str r0, [sp]
	ldr r3, _021EBC10 ; =gSystem + 0x40
	ldr r0, [r5, #0x10]
	ldrh r2, [r3, #0x20]
	ldrh r3, [r3, #0x22]
	ldr r0, [r0, #0x74]
	bl DoesPixelAtScreenXYMatchPtrVal
	cmp r0, #0
	bne _021EBB7E
	mov r0, #0
	add sp, #8
	mvn r0, r0
	pop {r4, r5, r6, pc}
_021EBB7E:
	ldr r0, _021EBC14 ; =0x00000945
	bl PlaySE
	mov r2, #0x11
	lsl r2, r2, #4
	add r1, r5, r2
	add r2, r2, #2
	add r0, r5, #0
	add r2, r5, r2
	bl ov101_021EC980
	mov r3, #0x46
	lsl r3, r3, #2
	add r2, r3, #0
	add r1, r5, r3
	sub r2, #8
	sub r3, r3, #6
	ldrsh r2, [r5, r2]
	ldrsh r3, [r5, r3]
	add r0, r5, #0
	lsl r2, r2, #0x18
	lsl r3, r3, #0x18
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl ov101_021EA794
	add r0, r5, #0
	mov r1, #0
	bl ov101_021EAD90
	add r0, r5, #0
	mov r1, #1
	bl ov101_021EB1E0
	ldr r2, _021EBC10 ; =gSystem + 0x40
	ldr r0, _021EBC18 ; =0x00000142
	ldrh r1, [r2, #0x20]
	strh r1, [r5, r0]
	ldrsh r3, [r5, r0]
	add r1, r0, #4
	strh r3, [r5, r1]
	add r1, r0, #2
	ldrh r2, [r2, #0x22]
	add r0, r0, #6
	strh r2, [r5, r1]
	ldrsh r1, [r5, r1]
	strh r1, [r5, r0]
	add r0, r5, #0
	bl ov101_021EBDEC
	ldr r1, _021EBBF8 ; =0x00000139
	mov r0, #8
	ldrb r2, [r5, r1]
	orr r0, r2
	strb r0, [r5, r1]
	mov r0, #1
	str r0, [r4]
	sub r0, r0, #2
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_021EBBF8: .word 0x00000139
_021EBBFC: .word ov101_021F7EAC
_021EBC00: .word 0x00000941
_021EBC04: .word 0x00000943
_021EBC08: .word 0x00000949
_021EBC0C: .word ov101_021F7EA4
_021EBC10: .word gSystem + 0x40
_021EBC14: .word 0x00000945
_021EBC18: .word 0x00000142
	thumb_func_end ov101_021EBA44

	thumb_func_start ov101_021EBC1C
ov101_021EBC1C: ; 0x021EBC1C
	push {r3, r4, r5, lr}
	sub sp, #0x20
	add r5, r0, #0
	add r4, r1, #0
	bl System_GetTouchHeld
	cmp r0, #0
	bne _021EBC34
	mov r0, #0
	add sp, #0x20
	mvn r0, r0
	pop {r3, r4, r5, pc}
_021EBC34:
	ldr r0, _021EBDD0 ; =0x00000139
	ldrb r0, [r5, r0]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	beq _021EBC46
	mov r0, #0
	add sp, #0x20
	mvn r0, r0
	pop {r3, r4, r5, pc}
_021EBC46:
	ldr r0, _021EBDD4 ; =ov101_021F7E94
	bl TouchscreenHitbox_FindRectAtTouchNew
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _021EBCAE
	mov r0, #0x5e
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #8
	str r1, [sp]
	mov r1, #4
	str r1, [sp, #4]
	add r1, r0, #0
	add r1, #0xc
	str r1, [sp, #8]
	mov r1, #0
	str r1, [sp, #0xc]
	mov r2, #0x18
	str r2, [sp, #0x10]
	ldrh r1, [r0]
	mov r3, #0x14
	lsl r1, r1, #0x15
	lsr r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	mov r1, #1
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x74]
	bl CopyToBgTilemapRect
	ldr r0, [r5, #0x10]
	mov r1, #1
	ldr r0, [r0, #0x74]
	bl ScheduleBgTilemapBufferTransfer
	add r0, r5, #0
	bl ov101_021E94C0
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	mov r0, #1
	str r0, [r4]
	add sp, #0x20
	mov r0, #4
	pop {r3, r4, r5, pc}
_021EBCAE:
	ldr r0, _021EBDD8 ; =ov101_021F7EA8
	bl TouchscreenHitbox_TouchNewIsIn
	cmp r0, #0
	bne _021EBCC0
	mov r0, #0
	add sp, #0x20
	mvn r0, r0
	pop {r3, r4, r5, pc}
_021EBCC0:
	mov r1, #1
	add r0, sp, #0x1c
	strh r1, [r0]
	add r0, sp, #0x1c
	str r0, [sp]
	ldr r3, _021EBDDC ; =gSystem + 0x40
	ldr r0, [r5, #0x10]
	ldrh r2, [r3, #0x20]
	ldrh r3, [r3, #0x22]
	ldr r0, [r0, #0x74]
	bl DoesPixelAtScreenXYMatchPtrVal
	cmp r0, #0
	bne _021EBCE4
	mov r0, #0
	add sp, #0x20
	mvn r0, r0
	pop {r3, r4, r5, pc}
_021EBCE4:
	ldr r0, _021EBDE0 ; =0x00000945
	bl PlaySE
	mov r0, #1
	str r0, [r4]
	ldrb r0, [r5, #0xd]
	cmp r0, #2
	bne _021EBD34
	mov r2, #0x11
	lsl r2, r2, #4
	add r1, r5, r2
	add r2, r2, #2
	add r0, r5, #0
	add r2, r5, r2
	bl ov101_021EC980
	mov r3, #0x46
	lsl r3, r3, #2
	add r2, r3, #0
	add r1, r5, r3
	sub r2, #8
	sub r3, r3, #6
	ldrsh r2, [r5, r2]
	ldrsh r3, [r5, r3]
	add r0, r5, #0
	lsl r2, r2, #0x18
	lsl r3, r3, #0x18
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl ov101_021EA794
	add r0, r5, #0
	mov r1, #1
	bl ov101_021EAD90
	add r0, r5, #0
	mov r1, #1
	bl ov101_021EB1E0
	b _021EBDA0
_021EBD34:
	mov r2, #0x11
	lsl r2, r2, #4
	add r1, r5, r2
	add r2, r2, #2
	add r0, r5, #0
	add r2, r5, r2
	bl ov101_021EC980
	mov r3, #0x46
	lsl r3, r3, #2
	add r2, r3, #0
	add r1, r5, r3
	sub r2, #8
	sub r3, r3, #6
	ldrsh r2, [r5, r2]
	ldrsh r3, [r5, r3]
	add r0, r5, #0
	lsl r2, r2, #0x18
	lsl r3, r3, #0x18
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl ov101_021EA8A8
	add r0, r5, #0
	mov r1, #0
	bl ov101_021EAD90
	add r0, r5, #0
	mov r1, #1
	bl ov101_021EB1E0
	mov r2, #0x11
	lsl r2, r2, #4
	ldrh r1, [r5, r2]
	add r2, r2, #2
	ldrsh r2, [r5, r2]
	add r0, r5, #0
	sub r2, r2, #2
	lsl r2, r2, #0x10
	lsr r2, r2, #0x10
	bl ov101_021EA874
	add r4, r0, #0
	cmp r4, #0
	ble _021EBDA0
	ldr r0, _021EBDE4 ; =0x00000941
	bl PlaySE
	add r0, r5, #0
	add r1, r4, #0
	bl ov101_021EB784
	add sp, #0x20
	pop {r3, r4, r5, pc}
_021EBDA0:
	ldr r2, _021EBDDC ; =gSystem + 0x40
	ldr r0, _021EBDE8 ; =0x00000142
	ldrh r1, [r2, #0x20]
	strh r1, [r5, r0]
	ldrsh r3, [r5, r0]
	add r1, r0, #4
	strh r3, [r5, r1]
	ldrh r2, [r2, #0x22]
	add r1, r0, #2
	add r0, r0, #6
	strh r2, [r5, r1]
	ldrsh r1, [r5, r1]
	strh r1, [r5, r0]
	add r0, r5, #0
	bl ov101_021EBDEC
	ldr r1, _021EBDD0 ; =0x00000139
	mov r0, #8
	ldrb r2, [r5, r1]
	orr r2, r0
	strb r2, [r5, r1]
	sub r0, #9
	add sp, #0x20
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021EBDD0: .word 0x00000139
_021EBDD4: .word ov101_021F7E94
_021EBDD8: .word ov101_021F7EA8
_021EBDDC: .word gSystem + 0x40
_021EBDE0: .word 0x00000945
_021EBDE4: .word 0x00000941
_021EBDE8: .word 0x00000142
	thumb_func_end ov101_021EBC1C

	thumb_func_start ov101_021EBDEC
ov101_021EBDEC: ; 0x021EBDEC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r4, r0, #0
	mov r0, #0x4e
	lsl r0, r0, #2
	ldrb r0, [r4, r0]
	lsl r0, r0, #0x1f
	lsr r1, r0, #0x1f
	beq _021EBE08
	mov r0, #0xc
	str r0, [sp, #0xc]
	mov r0, #8
	str r0, [sp, #8]
	b _021EBE10
_021EBE08:
	mov r0, #0x18
	str r0, [sp, #0xc]
	mov r0, #0x11
	str r0, [sp, #8]
_021EBE10:
	add r0, r1, #1
	lsl r0, r0, #0x1b
	lsr r5, r0, #0x18
	ldr r0, _021EBF28 ; =gSystem + 0x40
	ldrh r1, [r0, #0x20]
	ldr r0, _021EBF2C ; =0x00000132
	ldrb r0, [r4, r0]
	sub r0, r1, r0
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp]
	lsl r0, r5, #0x17
	lsr r6, r0, #0x18
	ldr r0, [sp]
	add r1, r5, #0
	bl _s32_div_f
	sub r0, r1, r6
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp, #0x14]
	ldr r0, _021EBF28 ; =gSystem + 0x40
	ldrh r1, [r0, #0x22]
	ldr r0, _021EBF30 ; =0x00000131
	ldrb r0, [r4, r0]
	sub r0, r1, r0
	lsl r0, r0, #0x10
	asr r7, r0, #0x10
	add r0, r7, #0
	add r1, r5, #0
	bl _s32_div_f
	sub r0, r1, r6
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp, #0x10]
	add r0, r7, #0
	add r1, r5, #0
	bl _s32_div_f
	ldr r1, _021EBF34 ; =0x00000112
	lsl r0, r0, #0x10
	ldrsh r7, [r4, r1]
	asr r0, r0, #0x10
	sub r1, r7, r0
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	str r1, [sp, #0x18]
	ldr r1, [sp, #8]
	sub r1, r1, #1
	sub r0, r1, r0
	add r0, r7, r0
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp, #4]
	ldr r0, [sp]
	add r1, r5, #0
	bl _s32_div_f
	lsl r0, r0, #0x10
	mov r2, #0x11
	asr r0, r0, #0x10
	lsl r2, r2, #4
	ldr r3, [sp, #0xc]
	mov ip, r0
	ldrsh r1, [r4, r2]
	sub r3, r3, #1
	mov r6, ip
	sub r3, r3, r6
	sub r2, #0xc
	ldrh r6, [r4, r2]
	sub r0, r1, r0
	add r3, r1, r3
	lsl r0, r0, #0x10
	lsl r3, r3, #0x10
	ldr r2, [sp, #0x18]
	asr r0, r0, #0x10
	asr r3, r3, #0x10
	cmp r2, r6
	bge _021EBEB6
	lsl r2, r6, #0x10
	asr r2, r2, #0x10
	str r2, [sp, #0x18]
_021EBEB6:
	mov r2, #1
	lsl r2, r2, #8
	ldrh r2, [r4, r2]
	cmp r0, r2
	bge _021EBEC4
	lsl r0, r2, #0x10
	asr r0, r0, #0x10
_021EBEC4:
	ldr r2, _021EBF38 ; =0x00000106
	ldrh r6, [r4, r2]
	ldr r2, [sp, #4]
	cmp r2, r6
	ble _021EBED4
	lsl r2, r6, #0x10
	asr r2, r2, #0x10
	str r2, [sp, #4]
_021EBED4:
	ldr r2, _021EBF3C ; =0x00000102
	ldrh r2, [r4, r2]
	cmp r3, r2
	ble _021EBEE0
	lsl r2, r2, #0x10
	asr r3, r2, #0x10
_021EBEE0:
	ldr r2, [sp, #0x18]
	add r6, r5, #0
	sub r2, r7, r2
	mul r6, r2
	ldr r2, [sp, #0x10]
	sub r0, r1, r0
	add r6, r2, r6
	ldr r2, _021EBF40 ; =0x0000014A
	strh r6, [r4, r2]
	ldr r2, [sp, #4]
	add r6, r5, #0
	sub r2, r2, r7
	mul r6, r2
	ldr r2, [sp, #0x10]
	add r2, r2, r6
	ldr r6, _021EBF40 ; =0x0000014A
	add r6, r6, #2
	strh r2, [r4, r6]
	add r2, r5, #0
	mul r2, r0
	ldr r0, [sp, #0x14]
	add r2, r0, r2
	ldr r0, _021EBF40 ; =0x0000014A
	add r0, r0, #4
	strh r2, [r4, r0]
	sub r0, r3, r1
	add r1, r5, #0
	mul r1, r0
	ldr r0, [sp, #0x14]
	add r1, r0, r1
	ldr r0, _021EBF40 ; =0x0000014A
	add r0, r0, #6
	strh r1, [r4, r0]
	mov r0, #0
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021EBF28: .word gSystem + 0x40
_021EBF2C: .word 0x00000132
_021EBF30: .word 0x00000131
_021EBF34: .word 0x00000112
_021EBF38: .word 0x00000106
_021EBF3C: .word 0x00000102
_021EBF40: .word 0x0000014A
	thumb_func_end ov101_021EBDEC

	thumb_func_start ov101_021EBF44
ov101_021EBF44: ; 0x021EBF44
	push {r3, r4}
	add r3, r0, #0
	add r3, #0xf6
	ldrh r3, [r3]
	add r2, r0, #0
	add r2, #0xf4
	sub r3, r3, r1
	ldrh r2, [r2]
	sub r3, r3, #1
	lsl r3, r3, #0x10
	asr r4, r3, #0x10
	mov r3, #0x11
	sub r2, r2, r1
	lsl r3, r3, #4
	add r2, r2, #1
	lsl r2, r2, #0x10
	ldrsh r3, [r0, r3]
	asr r2, r2, #0x10
	cmp r3, r2
	blt _021EBF76
	cmp r4, r3
	blt _021EBF76
	add r0, r1, #0
	pop {r3, r4}
	bx lr
_021EBF76:
	cmp r3, r2
	bgt _021EBF86
	sub r0, r2, r3
	add r0, r1, r0
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	pop {r3, r4}
	bx lr
_021EBF86:
	cmp r3, r4
	blt _021EBF92
	sub r0, r3, r4
	sub r0, r1, r0
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
_021EBF92:
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end ov101_021EBF44

	thumb_func_start ov101_021EBF98
ov101_021EBF98: ; 0x021EBF98
	push {r4, lr}
	cmp r1, #0
	ble _021EBFC4
	add r3, r0, #0
	add r3, #0xf4
	ldrh r4, [r3]
	mov r3, #1
	lsl r3, r3, #8
	ldrh r3, [r0, r3]
	sub r3, r4, r3
	lsl r3, r3, #0x10
	asr r3, r3, #0x10
	cmp r3, #0
	bgt _021EBFB8
	mov r0, #0
	pop {r4, pc}
_021EBFB8:
	cmp r3, r2
	bge _021EBFEC
	add r1, r3, #0
	bl ov101_021EBF44
	pop {r4, pc}
_021EBFC4:
	ldr r3, _021EBFF4 ; =0x00000102
	ldrh r4, [r0, r3]
	add r3, r0, #0
	add r3, #0xf6
	ldrh r3, [r3]
	sub r3, r4, r3
	lsl r3, r3, #0x10
	asr r3, r3, #0x10
	cmp r3, #0
	bgt _021EBFDC
	mov r0, #0
	pop {r4, pc}
_021EBFDC:
	cmp r3, r2
	bge _021EBFEC
	neg r1, r3
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	bl ov101_021EBF44
	pop {r4, pc}
_021EBFEC:
	bl ov101_021EBF44
	pop {r4, pc}
	nop
_021EBFF4: .word 0x00000102
	thumb_func_end ov101_021EBF98

	thumb_func_start ov101_021EBFF8
ov101_021EBFF8: ; 0x021EBFF8
	push {r3, r4}
	add r2, r0, #0
	add r2, #0xf0
	ldrh r2, [r2]
	sub r2, r2, r1
	add r2, r2, #1
	lsl r2, r2, #0x10
	asr r3, r2, #0x10
	add r2, r0, #0
	add r2, #0xf2
	ldrh r2, [r2]
	sub r2, r2, r1
	lsl r2, r2, #0x10
	asr r4, r2, #0x10
	ldr r2, _021EC048 ; =0x00000112
	ldrsh r2, [r0, r2]
	cmp r2, r3
	blt _021EC026
	cmp r4, r2
	blt _021EC026
	add r0, r1, #0
	pop {r3, r4}
	bx lr
_021EC026:
	cmp r2, r3
	bgt _021EC036
	sub r0, r3, r2
	add r0, r1, r0
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	pop {r3, r4}
	bx lr
_021EC036:
	cmp r2, r4
	blt _021EC042
	sub r0, r2, r4
	sub r0, r1, r0
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
_021EC042:
	pop {r3, r4}
	bx lr
	nop
_021EC048: .word 0x00000112
	thumb_func_end ov101_021EBFF8

	thumb_func_start ov101_021EC04C
ov101_021EC04C: ; 0x021EC04C
	push {r4, lr}
	cmp r1, #0
	ble _021EC078
	add r3, r0, #0
	add r3, #0xf0
	ldrh r4, [r3]
	mov r3, #0x41
	lsl r3, r3, #2
	ldrh r3, [r0, r3]
	sub r3, r4, r3
	lsl r3, r3, #0x10
	asr r3, r3, #0x10
	cmp r3, #0
	bgt _021EC06C
	mov r0, #0
	pop {r4, pc}
_021EC06C:
	cmp r3, r2
	bge _021EC0A0
	add r1, r3, #0
	bl ov101_021EBFF8
	pop {r4, pc}
_021EC078:
	ldr r3, _021EC0A8 ; =0x00000106
	ldrh r4, [r0, r3]
	add r3, r0, #0
	add r3, #0xf2
	ldrh r3, [r3]
	sub r3, r4, r3
	lsl r3, r3, #0x10
	asr r3, r3, #0x10
	cmp r3, #0
	bgt _021EC090
	mov r0, #0
	pop {r4, pc}
_021EC090:
	cmp r3, r2
	bge _021EC0A0
	neg r1, r3
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	bl ov101_021EBFF8
	pop {r4, pc}
_021EC0A0:
	bl ov101_021EBFF8
	pop {r4, pc}
	nop
_021EC0A8: .word 0x00000106
	thumb_func_end ov101_021EC04C

	thumb_func_start ov101_021EC0AC
ov101_021EC0AC: ; 0x021EC0AC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	ldr r1, _021EC2F4 ; =gSystem + 0x40
	add r5, r0, #0
	mov r0, #0x20
	ldrsh r0, [r1, r0]
	str r0, [sp, #8]
	mov r0, #0x22
	ldrsh r0, [r1, r0]
	str r0, [sp]
	mov r0, #0x4e
	lsl r0, r0, #2
	ldrb r0, [r5, r0]
	lsl r0, r0, #0x1f
	lsr r2, r0, #0x1f
	lsl r1, r2, #3
	add r1, #8
	lsr r0, r1, #0x1f
	add r0, r1, r0
	lsl r0, r0, #0xf
	asr r0, r0, #0x10
	str r0, [sp, #0x14]
	cmp r2, #0
	beq _021EC0E2
	mov r0, #9
	str r0, [sp, #0x10]
	b _021EC0E6
_021EC0E2:
	mov r0, #5
	str r0, [sp, #0x10]
_021EC0E6:
	ldr r2, _021EC2F8 ; =0x0000013A
	ldrb r0, [r5, r2]
	cmp r0, #0
	beq _021EC142
	add r0, r5, #0
	add r0, #0xc8
	ldr r1, [r0]
	add r0, r2, #4
	ldrsh r0, [r5, r0]
	sub r1, r1, r0
	add r0, r5, #0
	add r0, #0xc8
	str r1, [r0]
	add r0, r5, #0
	add r0, #0xcc
	ldr r1, [r0]
	add r0, r2, #6
	ldrsh r0, [r5, r0]
	sub r1, r1, r0
	add r0, r5, #0
	add r0, #0xcc
	str r1, [r0]
	add r1, r2, #4
	add r2, r2, #6
	ldrsh r1, [r5, r1]
	ldrsh r2, [r5, r2]
	add r0, r5, #0
	bl ov101_021E9BF4
	add r0, r5, #0
	add r0, #0x84
	ldr r0, [r0]
	bl ov100_021E6E84
	mov r0, #0x4e
	lsl r0, r0, #2
	ldrb r2, [r5, r0]
	mov r1, #0x80
	add sp, #0x20
	orr r2, r1
	strb r2, [r5, r0]
	mov r0, #0
	add r1, #0xba
	strb r0, [r5, r1]
	sub r0, r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021EC142:
	bl System_GetTouchHeld
	cmp r0, #0
	bne _021EC15C
	ldr r1, _021EC2FC ; =0x00000139
	mov r0, #8
	ldrb r2, [r5, r1]
	add sp, #0x20
	bic r2, r0
	mov r0, #0
	strb r2, [r5, r1]
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_021EC15C:
	ldr r1, _021EC300 ; =0x00000142
	ldr r0, [sp, #8]
	ldrsh r2, [r5, r1]
	sub r0, r0, r2
	lsl r0, r0, #0x10
	asr r6, r0, #0x10
	add r0, r1, #2
	ldrsh r1, [r5, r0]
	ldr r0, [sp]
	str r6, [sp, #0xc]
	sub r0, r0, r1
	lsl r0, r0, #0x10
	asr r4, r0, #0x10
	str r4, [sp, #4]
	cmp r6, #0
	bge _021EC186
	mov r0, #0
	mvn r0, r0
	mul r0, r6
	lsl r0, r0, #0x10
	asr r6, r0, #0x10
_021EC186:
	cmp r4, #0
	bge _021EC194
	mov r0, #0
	mvn r0, r0
	mul r0, r4
	lsl r0, r0, #0x10
	asr r4, r0, #0x10
_021EC194:
	ldr r1, [sp, #0x10]
	add r0, r6, #0
	bl _s32_div_f
	lsl r0, r0, #0x10
	asr r6, r0, #0x10
	ldr r1, [sp, #0x10]
	add r0, r4, #0
	bl _s32_div_f
	lsl r0, r0, #0x10
	asr r4, r0, #0x10
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	bl _s32_div_f
	lsl r0, r1, #0x10
	asr r0, r0, #0x10
	str r0, [sp, #0x1c]
	ldr r0, [sp, #4]
	ldr r1, [sp, #0x10]
	bl _s32_div_f
	lsl r0, r1, #0x10
	asr r0, r0, #0x10
	str r0, [sp, #0x18]
	cmp r6, #1
	bge _021EC1D8
	cmp r4, #1
	bge _021EC1D8
	mov r0, #0
	add sp, #0x20
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_021EC1D8:
	mov r0, #5
	mov r7, #0
	lsl r0, r0, #6
	strh r7, [r5, r0]
	ldrsh r1, [r5, r0]
	sub r0, r0, #2
	cmp r6, #0
	strh r1, [r5, r0]
	ble _021EC248
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	bl _s32_div_f
	add r1, r0, #0
	lsl r1, r1, #0x10
	add r0, r5, #0
	asr r1, r1, #0x10
	add r2, r6, #0
	bl ov101_021EBF98
	add r7, r0, #0
	beq _021EC248
	add r1, r5, #0
	ldr r0, [sp, #0x14]
	add r1, #0xc8
	ldr r1, [r1]
	mul r0, r7
	sub r2, r1, r0
	add r1, r5, #0
	add r1, #0xc8
	str r2, [r1]
	add r1, r5, #0
	add r1, #0xf6
	ldrh r1, [r1]
	mov r3, #1
	sub r2, r1, r7
	add r1, r5, #0
	add r1, #0xf6
	strh r2, [r1]
	add r1, r5, #0
	add r1, #0xf4
	ldrh r1, [r1]
	sub r2, r1, r7
	add r1, r5, #0
	add r1, #0xf4
	strh r2, [r1]
	ldr r2, [sp, #8]
	ldr r1, [sp, #0x1c]
	sub r2, r2, r1
	ldr r1, _021EC300 ; =0x00000142
	strh r2, [r5, r1]
	add r2, r1, #0
	sub r2, #8
	strb r3, [r5, r2]
	sub r1, r1, #4
	strh r0, [r5, r1]
_021EC248:
	cmp r4, #0
	ble _021EC2AE
	ldr r0, [sp, #4]
	ldr r1, [sp, #0x10]
	bl _s32_div_f
	add r1, r0, #0
	lsl r1, r1, #0x10
	add r0, r5, #0
	asr r1, r1, #0x10
	add r2, r4, #0
	bl ov101_021EC04C
	add r2, r0, #0
	beq _021EC2B0
	add r1, r5, #0
	ldr r0, [sp, #0x14]
	add r1, #0xcc
	ldr r1, [r1]
	mul r0, r2
	sub r3, r1, r0
	add r1, r5, #0
	add r1, #0xcc
	str r3, [r1]
	add r1, r5, #0
	add r1, #0xf2
	ldrh r1, [r1]
	mov r4, #1
	sub r3, r1, r2
	add r1, r5, #0
	add r1, #0xf2
	strh r3, [r1]
	add r1, r5, #0
	add r1, #0xf0
	ldrh r1, [r1]
	sub r3, r1, r2
	add r1, r5, #0
	add r1, #0xf0
	strh r3, [r1]
	ldr r3, [sp]
	ldr r1, [sp, #0x18]
	sub r3, r3, r1
	mov r1, #0x51
	lsl r1, r1, #2
	strh r3, [r5, r1]
	add r3, r1, #0
	sub r3, #0xa
	strb r4, [r5, r3]
	sub r1, r1, #4
	strh r0, [r5, r1]
	b _021EC2B0
_021EC2AE:
	mov r2, #0
_021EC2B0:
	cmp r7, #0
	bne _021EC2B8
	cmp r2, #0
	beq _021EC2EA
_021EC2B8:
	ldr r1, [sp, #0x14]
	ldr r3, [sp, #0x14]
	mul r1, r7
	mul r3, r2
	lsl r1, r1, #0x10
	lsl r2, r3, #0x10
	add r0, r5, #0
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	bl ov101_021E9BF4
	add r0, r5, #0
	bl ov101_021EC944
	add r0, r5, #0
	add r0, #0x84
	ldr r0, [r0]
	bl ov100_021E6E84
	mov r1, #0x4e
	lsl r1, r1, #2
	ldrb r2, [r5, r1]
	mov r0, #0x80
	orr r0, r2
	strb r0, [r5, r1]
_021EC2EA:
	mov r0, #0
	mvn r0, r0
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021EC2F4: .word gSystem + 0x40
_021EC2F8: .word 0x0000013A
_021EC2FC: .word 0x00000139
_021EC300: .word 0x00000142
	thumb_func_end ov101_021EC0AC

	thumb_func_start ov101_021EC304
ov101_021EC304: ; 0x021EC304
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp, #4]
	add r0, r5, #0
	add r0, #0x84
	ldr r0, [r0]
	ldr r7, [sp, #8]
	ldr r4, [r0, #8]
	ldr r0, _021EC488 ; =0x00000139
	add r4, #0xc8
	ldrb r1, [r5, r0]
	lsl r1, r1, #0x1d
	lsr r1, r1, #0x1f
	bne _021EC328
	b _021EC484
_021EC328:
	sub r0, r0, #1
	ldrb r0, [r5, r0]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	beq _021EC336
	mov r6, #8
	b _021EC338
_021EC336:
	mov r6, #4
_021EC338:
	add r0, sp, #0xc
	mov r2, #0x45
	str r0, [sp]
	lsl r2, r2, #2
	ldrsh r1, [r5, r2]
	add r2, r2, #2
	add r3, sp, #0xc
	ldrsh r2, [r5, r2]
	add r0, r5, #0
	add r3, #2
	bl ov101_021E9464
	ldr r0, _021EC48C ; =0x0000013B
	mov r2, #1
	ldrb r1, [r5, r0]
	tst r2, r1
	beq _021EC378
	add r0, sp, #0xc
	ldrh r0, [r0]
	cmp r0, #1
	bhi _021EC36E
	sub r0, r7, r6
	lsl r0, r0, #0x10
	asr r7, r0, #0x10
	mov r0, #1
	str r0, [sp, #8]
	b _021EC3A6
_021EC36E:
	mov r0, #6
	ldrsh r0, [r4, r0]
	sub r0, r0, r6
	strh r0, [r4, #6]
	b _021EC3A6
_021EC378:
	mov r2, #2
	tst r1, r2
	beq _021EC3A6
	sub r0, r0, #3
	ldrb r0, [r5, r0]
	add r1, sp, #0xc
	ldrh r1, [r1]
	lsl r0, r0, #0x1f
	lsr r2, r0, #0x1f
	ldr r0, _021EC490 ; =ov101_021F7E8E
	ldrb r0, [r0, r2]
	cmp r1, r0
	blt _021EC39E
	add r0, r7, r6
	lsl r0, r0, #0x10
	asr r7, r0, #0x10
	mov r0, #1
	str r0, [sp, #8]
	b _021EC3A6
_021EC39E:
	mov r0, #6
	ldrsh r0, [r4, r0]
	add r0, r0, r6
	strh r0, [r4, #6]
_021EC3A6:
	ldr r0, _021EC48C ; =0x0000013B
	mov r3, #4
	ldrb r0, [r5, r0]
	add r1, r0, #0
	tst r1, r3
	beq _021EC3D2
	add r0, sp, #0xc
	ldrh r0, [r0, #2]
	cmp r0, #1
	bhi _021EC3CA
	ldr r0, [sp, #4]
	sub r0, r0, r6
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	b _021EC404
_021EC3CA:
	ldrsh r0, [r4, r3]
	sub r0, r0, r6
	strh r0, [r4, #4]
	b _021EC404
_021EC3D2:
	mov r1, #8
	tst r0, r1
	beq _021EC404
	add r0, sp, #0xc
	ldrh r2, [r0, #2]
	ldr r0, _021EC48C ; =0x0000013B
	sub r0, r0, #3
	ldrb r0, [r5, r0]
	lsl r0, r0, #0x1f
	lsr r1, r0, #0x1f
	ldr r0, _021EC494 ; =ov101_021F7E8C
	ldrb r0, [r0, r1]
	cmp r2, r0
	blt _021EC3FE
	ldr r0, [sp, #4]
	add r0, r0, r6
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	b _021EC404
_021EC3FE:
	ldrsh r0, [r4, r3]
	add r0, r0, r6
	strh r0, [r4, #4]
_021EC404:
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _021EC44E
	mov r1, #0x4e
	lsl r1, r1, #2
	ldrb r2, [r5, r1]
	mov r0, #0x80
	orr r0, r2
	strb r0, [r5, r1]
	add r0, r5, #0
	add r0, #0xc8
	ldr r1, [r0]
	ldr r0, [sp, #4]
	neg r2, r7
	add r1, r1, r0
	add r0, r5, #0
	add r0, #0xc8
	str r1, [r0]
	add r0, r5, #0
	add r0, #0xcc
	ldr r0, [r0]
	lsl r2, r2, #0x10
	add r1, r0, r7
	add r0, r5, #0
	add r0, #0xcc
	str r1, [r0]
	ldr r1, [sp, #4]
	add r0, r5, #0
	neg r1, r1
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	bl ov101_021E9BF4
	add r0, r5, #0
	bl ov101_021EC944
_021EC44E:
	add r0, r5, #0
	add r0, #0x84
	ldr r0, [r0]
	bl ov100_021E6E84
	ldr r0, _021EC498 ; =0x0000013A
	ldrb r1, [r5, r0]
	sub r1, r1, #1
	strb r1, [r5, r0]
	ldrb r0, [r5, r0]
	cmp r0, #0
	bne _021EC484
	add r0, r5, #0
	bl ov101_021E9288
	ldr r1, _021EC488 ; =0x00000139
	mov r0, #1
	ldrb r2, [r5, r1]
	bic r2, r0
	strb r2, [r5, r1]
	ldrb r2, [r5, r1]
	mov r0, #4
	bic r2, r0
	strb r2, [r5, r1]
	mov r2, #0
	add r0, r1, #2
	strb r2, [r5, r0]
_021EC484:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021EC488: .word 0x00000139
_021EC48C: .word 0x0000013B
_021EC490: .word ov101_021F7E8E
_021EC494: .word ov101_021F7E8C
_021EC498: .word 0x0000013A
	thumb_func_end ov101_021EC304

	thumb_func_start ov101_021EC49C
ov101_021EC49C: ; 0x021EC49C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	str r1, [sp, #8]
	ldr r1, [sp, #0x40]
	add r6, r0, #0
	str r1, [sp, #0x40]
	add r1, r6, #0
	str r3, [sp, #0x10]
	mov r3, #0x4e
	str r2, [sp, #0xc]
	add r1, #0x84
	ldr r1, [r1]
	lsl r3, r3, #2
	ldr r4, [r1, #8]
	ldrb r1, [r6, r3]
	str r4, [sp, #0x1c]
	add r4, #0xc8
	lsl r1, r1, #0x1f
	lsr r2, r1, #0x1f
	add r1, r2, #1
	lsl r1, r1, #0x1b
	lsr r7, r1, #0x18
	lsl r1, r7, #0x17
	lsr r5, r1, #0x18
	mov r1, #4
	ldrsh r1, [r4, r1]
	str r1, [sp]
	mov r1, #6
	ldrsh r1, [r4, r1]
	str r1, [sp, #4]
	add r1, r2, #0
	add r2, r3, #0
	sub r2, #0x28
	sub r3, #0x26
	ldrh r2, [r6, r2]
	ldrh r3, [r6, r3]
	bl ov101_021E9530
	mov r3, #0x4e
	lsl r3, r3, #2
	ldrb r0, [r6, r3]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	bne _021EC54C
	mov r0, #6
	sub r1, r3, #7
	ldrsh r0, [r4, r0]
	ldrb r1, [r6, r1]
	sub r2, r3, #6
	ldrb r2, [r6, r2]
	sub r0, r0, r1
	asr r1, r0, #3
	lsr r1, r1, #0x1c
	add r1, r0, r1
	lsl r0, r1, #0x14
	mov r1, #4
	ldrsh r1, [r4, r1]
	lsr r0, r0, #0x18
	sub r1, r1, r2
	asr r2, r1, #3
	lsr r2, r2, #0x1c
	add r2, r1, r2
	lsl r1, r2, #0x14
	lsr r1, r1, #0x18
	cmp r1, #5
	bhi _021EC52A
	ldr r1, [sp, #8]
	lsl r2, r1, #3
	add r2, #8
	ldr r1, [sp, #0x10]
	b _021EC530
_021EC52A:
	ldr r1, [sp, #8]
	lsl r2, r1, #3
	ldr r1, [sp, #0x10]
_021EC530:
	str r2, [r1]
	cmp r0, #4
	bls _021EC542
	ldr r0, [sp, #0xc]
	lsl r1, r0, #3
	ldr r0, [sp, #0x40]
	add r1, #8
	str r1, [r0]
	b _021EC5A4
_021EC542:
	ldr r0, [sp, #0xc]
	lsl r1, r0, #3
	ldr r0, [sp, #0x40]
	str r1, [r0]
	b _021EC5A4
_021EC54C:
	mov r0, #6
	sub r1, r3, #7
	ldrsh r0, [r4, r0]
	ldrb r1, [r6, r1]
	sub r0, r0, r1
	asr r1, r0, #2
	lsr r1, r1, #0x1d
	add r1, r0, r1
	asr r0, r1, #3
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x1f
	sub r1, r1, r2
	mov r0, #0x1f
	ror r1, r0
	add r0, r2, r1
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	mov r0, #4
	sub r1, r3, #6
	ldrsh r0, [r4, r0]
	ldrb r1, [r6, r1]
	sub r0, r0, r1
	asr r1, r0, #2
	lsr r1, r1, #0x1d
	add r1, r0, r1
	asr r0, r1, #3
	lsr r1, r0, #0x1f
	lsl r3, r0, #0x1f
	sub r3, r3, r1
	mov r0, #0x1f
	ror r3, r0
	add r0, r1, r3
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	ldr r0, [sp, #8]
	add r0, r0, r1
	lsl r1, r0, #3
	ldr r0, [sp, #0x10]
	str r1, [r0]
	ldr r0, [sp, #0xc]
	add r0, r0, r2
	lsl r1, r0, #3
	ldr r0, [sp, #0x40]
	str r1, [r0]
_021EC5A4:
	add r0, r6, #0
	add r0, #0xf4
	ldr r3, _021EC770 ; =0x00000132
	ldrh r1, [r0]
	ldr r0, [sp, #8]
	ldrb r2, [r6, r3]
	sub r0, r0, r1
	mul r0, r7
	add r0, r2, r0
	add r0, r5, r0
	strh r0, [r4, #8]
	sub r0, r3, #1
	ldrb r2, [r6, r0]
	add r0, r6, #0
	add r0, #0xf0
	ldrh r1, [r0]
	ldr r0, [sp, #0xc]
	sub r0, r0, r1
	mul r0, r7
	add r0, r2, r0
	add r0, r5, r0
	strh r0, [r4, #0xa]
	ldr r0, [sp, #0x1c]
	add r2, r6, #0
	add r0, #0xfc
	add r2, #0xf4
	ldrh r0, [r0]
	ldrh r2, [r2]
	ldrb r1, [r6, r3]
	sub r0, r0, r2
	mul r0, r7
	add r0, r1, r0
	add r1, r5, r0
	ldr r0, [sp, #0x1c]
	add r0, #0xf8
	strh r1, [r0]
	ldr r1, [sp, #0x1c]
	sub r0, r3, #1
	add r1, #0xfe
	ldrh r2, [r1]
	add r1, r6, #0
	add r1, #0xf0
	ldrh r1, [r1]
	ldrb r0, [r6, r0]
	sub r1, r2, r1
	mul r1, r7
	add r0, r0, r1
	add r1, r5, r0
	ldr r0, [sp, #0x1c]
	add r0, #0xfa
	strh r1, [r0]
	add r0, r6, #0
	mov r1, #1
	bl ov101_021EA238
	add r0, r6, #0
	add r0, #0x84
	ldr r0, [r0]
	mov r7, #5
	ldrh r0, [r0, #2]
	cmp r0, #5
	bhi _021EC622
	b _021EC76C
_021EC622:
	mov r4, #0x3f
	lsl r4, r4, #0x18
_021EC626:
	ldr r0, _021EC774 ; =0x0000013A
	ldrb r0, [r6, r0]
	cmp r0, #0
	beq _021EC640
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	add r0, r4, #0
	bl _fadd
	str r0, [sp, #0x18]
	b _021EC64E
_021EC640:
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r4, #0
	bl _fsub
	str r0, [sp, #0x18]
_021EC64E:
	mov r0, #0x28
	add r1, r7, #0
	mul r1, r0
	ldr r0, [sp, #0x1c]
	add r5, r0, r1
	mov r0, #8
	ldrsh r1, [r5, r0]
	mov r0, #4
	ldrsh r0, [r5, r0]
	sub r0, r1, r0
	cmp r0, #0
	ble _021EC676
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	add r0, r4, #0
	bl _fadd
	b _021EC682
_021EC676:
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r4, #0
	bl _fsub
_021EC682:
	bl _ffix
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x18]
	bl _ffix
	add r1, r0, #0
	ldr r0, [sp, #0x24]
	bl FX_Div
	str r0, [r5, #0x18]
	ldr r0, _021EC774 ; =0x0000013A
	ldrb r0, [r6, r0]
	cmp r0, #0
	beq _021EC6B2
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	add r0, r4, #0
	bl _fadd
	str r0, [sp, #0x14]
	b _021EC6C0
_021EC6B2:
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r4, #0
	bl _fsub
	str r0, [sp, #0x14]
_021EC6C0:
	mov r0, #0xa
	ldrsh r1, [r5, r0]
	mov r0, #6
	ldrsh r0, [r5, r0]
	sub r0, r1, r0
	cmp r0, #0
	ble _021EC6DE
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	add r0, r4, #0
	bl _fadd
	b _021EC6EA
_021EC6DE:
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r4, #0
	bl _fsub
_021EC6EA:
	bl _ffix
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x14]
	bl _ffix
	add r1, r0, #0
	ldr r0, [sp, #0x28]
	bl FX_Div
	str r0, [r5, #0x1c]
	mov r0, #6
	ldrsh r0, [r5, r0]
	str r0, [sp, #0x20]
	mov r0, #4
	ldrsh r0, [r5, r0]
	cmp r0, #0
	ble _021EC71E
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	add r0, r4, #0
	bl _fadd
	b _021EC72A
_021EC71E:
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r4, #0
	bl _fsub
_021EC72A:
	bl _ffix
	str r0, [r5, #0x10]
	ldr r0, [sp, #0x20]
	cmp r0, #0
	ble _021EC746
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	add r0, r4, #0
	bl _fadd
	b _021EC752
_021EC746:
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r4, #0
	bl _fsub
_021EC752:
	bl _ffix
	str r0, [r5, #0x14]
	add r0, r7, #1
	lsl r0, r0, #0x10
	lsr r7, r0, #0x10
	add r0, r6, #0
	add r0, #0x84
	ldr r0, [r0]
	ldrh r0, [r0, #2]
	cmp r7, r0
	bhs _021EC76C
	b _021EC626
_021EC76C:
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021EC770: .word 0x00000132
_021EC774: .word 0x0000013A
	thumb_func_end ov101_021EC49C

	thumb_func_start ov101_021EC778
ov101_021EC778: ; 0x021EC778
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r4, r0, #0
	add r0, #0x84
	ldr r1, _021EC918 ; =0x00000139
	ldr r0, [r0]
	ldrb r2, [r4, r1]
	ldr r6, [r0, #8]
	add r0, r6, #0
	lsl r2, r2, #0x1e
	add r0, #0xc8
	lsr r2, r2, #0x1f
	bne _021EC794
	b _021EC914
_021EC794:
	sub r1, r1, #1
	ldrb r1, [r4, r1]
	lsl r1, r1, #0x1f
	lsr r1, r1, #0x1f
	beq _021EC7BA
	add r1, r4, #0
	add r1, #0xd0
	mov r2, #1
	ldr r1, [r1]
	lsl r2, r2, #0xa
	add r3, r1, r2
	add r1, r4, #0
	add r1, #0xd0
	str r3, [r1]
	add r1, r4, #0
	add r1, #0xd4
	ldr r1, [r1]
	add r2, r1, r2
	b _021EC7D4
_021EC7BA:
	add r1, r4, #0
	add r1, #0xd0
	mov r2, #1
	ldr r1, [r1]
	lsl r2, r2, #0xa
	sub r3, r1, r2
	add r1, r4, #0
	add r1, #0xd0
	str r3, [r1]
	add r1, r4, #0
	add r1, #0xd4
	ldr r1, [r1]
	sub r2, r1, r2
_021EC7D4:
	add r1, r4, #0
	add r1, #0xd4
	str r2, [r1]
	add r1, r4, #0
	add r1, #0xd0
	ldr r1, [r1]
	str r1, [sp]
	mov r1, #1
	lsl r1, r1, #0xc
	str r1, [sp, #8]
	add r1, r4, #0
	add r1, #0xd4
	ldr r1, [r1]
	str r1, [sp, #4]
	ldr r0, [r0, #0x20]
	add r1, sp, #0
	bl Sprite_SetAffineScale
	ldr r0, _021EC91C ; =0x0000013A
	ldrb r1, [r4, r0]
	sub r1, r1, #1
	strb r1, [r4, r0]
	ldrb r0, [r4, r0]
	cmp r0, #0
	bne _021EC870
	mov r0, #0xfc
	ldrsh r1, [r4, r0]
	add r0, r4, #0
	add r0, #0xc8
	str r1, [r0]
	mov r0, #0xfe
	ldrsh r1, [r4, r0]
	add r0, r4, #0
	add r0, #0xcc
	str r1, [r0]
	add r0, r4, #0
	add r0, #0x84
	ldr r0, [r0]
	mov r5, #5
	ldrh r0, [r0, #2]
	cmp r0, #5
	bls _021EC856
	mov r7, #0xa
_021EC82A:
	mov r0, #0x28
	mul r0, r5
	add r0, r6, r0
	mov r1, #0xa
	mov r2, #8
	ldrsh r1, [r0, r1]
	ldrsh r2, [r0, r2]
	strh r2, [r0, #4]
	strh r1, [r0, #6]
	ldrsh r2, [r0, r7]
	add r1, r5, #0
	bl ov101_021EC920
	add r0, r5, #1
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	add r0, r4, #0
	add r0, #0x84
	ldr r0, [r0]
	ldrh r0, [r0, #2]
	cmp r5, r0
	blo _021EC82A
_021EC856:
	ldr r1, _021EC918 ; =0x00000139
	mov r0, #1
	ldrb r2, [r4, r1]
	bic r2, r0
	strb r2, [r4, r1]
	ldrb r2, [r4, r1]
	mov r0, #2
	bic r2, r0
	strb r2, [r4, r1]
	mov r2, #0
	add r0, r1, #2
	strb r2, [r4, r0]
	b _021EC8FE
_021EC870:
	add r0, r4, #0
	add r0, #0xe8
	ldr r1, [r0]
	add r0, r4, #0
	add r0, #0xe0
	ldr r0, [r0]
	mov r5, #5
	add r1, r1, r0
	add r0, r4, #0
	add r0, #0xe8
	str r1, [r0]
	add r0, r4, #0
	add r0, #0xec
	ldr r1, [r0]
	add r0, r4, #0
	add r0, #0xe4
	ldr r0, [r0]
	add r1, r1, r0
	add r0, r4, #0
	add r0, #0xec
	str r1, [r0]
	add r0, r4, #0
	add r0, #0xe8
	ldr r0, [r0]
	asr r1, r0, #0xc
	add r0, r4, #0
	add r0, #0xc8
	str r1, [r0]
	add r0, r4, #0
	add r0, #0xec
	ldr r0, [r0]
	asr r1, r0, #0xc
	add r0, r4, #0
	add r0, #0xcc
	str r1, [r0]
	add r0, r4, #0
	add r0, #0x84
	ldr r0, [r0]
	ldrh r0, [r0, #2]
	cmp r0, #5
	bls _021EC8FE
	mov r7, #0x28
_021EC8C4:
	add r0, r5, #0
	mul r0, r7
	add r0, r6, r0
	ldr r2, [r0, #0x10]
	ldr r1, [r0, #0x18]
	add r1, r2, r1
	str r1, [r0, #0x10]
	ldr r2, [r0, #0x14]
	ldr r1, [r0, #0x1c]
	add r1, r2, r1
	str r1, [r0, #0x14]
	lsl r1, r1, #4
	asr r2, r1, #0x10
	ldr r1, [r0, #0x10]
	asr r1, r1, #0xc
	strh r1, [r0, #4]
	add r1, r5, #0
	strh r2, [r0, #6]
	bl ov101_021EC920
	add r0, r5, #1
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	add r0, r4, #0
	add r0, #0x84
	ldr r0, [r0]
	ldrh r0, [r0, #2]
	cmp r5, r0
	blo _021EC8C4
_021EC8FE:
	add r0, r4, #0
	add r0, #0x84
	ldr r0, [r0]
	bl ov100_021E6E84
	mov r1, #0x4e
	lsl r1, r1, #2
	ldrb r2, [r4, r1]
	mov r0, #0x80
	orr r0, r2
	strb r0, [r4, r1]
_021EC914:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021EC918: .word 0x00000139
_021EC91C: .word 0x0000013A
	thumb_func_end ov101_021EC778

	thumb_func_start ov101_021EC920
ov101_021EC920: ; 0x021EC920
	push {r3, lr}
	ldrb r1, [r0, #1]
	cmp r1, #0
	beq _021EC942
	cmp r2, #0xd8
	bgt _021EC930
	cmp r2, #0
	bge _021EC93A
_021EC930:
	ldr r0, [r0, #0x20]
	mov r1, #0
	bl Sprite_SetDrawFlag
	pop {r3, pc}
_021EC93A:
	ldr r0, [r0, #0x20]
	mov r1, #1
	bl Sprite_SetDrawFlag
_021EC942:
	pop {r3, pc}
	thumb_func_end ov101_021EC920

	thumb_func_start ov101_021EC944
ov101_021EC944: ; 0x021EC944
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r0, #0x84
	ldr r1, [r0]
	ldrb r0, [r6, #0xd]
	ldr r5, [r1, #8]
	cmp r0, #0
	bne _021EC97E
	ldrh r0, [r1, #2]
	mov r4, #5
	cmp r0, #5
	bls _021EC97E
	mov r7, #6
_021EC95E:
	mov r0, #0x28
	mul r0, r4
	add r0, r5, r0
	ldrsh r2, [r0, r7]
	add r1, r4, #0
	bl ov101_021EC920
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	add r0, r6, #0
	add r0, #0x84
	ldr r0, [r0]
	ldrh r0, [r0, #2]
	cmp r4, r0
	blo _021EC95E
_021EC97E:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov101_021EC944

	thumb_func_start ov101_021EC980
ov101_021EC980: ; 0x021EC980
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r2, [sp, #4]
	mov r2, #0x4e
	lsl r2, r2, #2
	add r5, r0, #0
	ldrb r0, [r5, r2]
	sub r4, r2, #6
	str r1, [sp]
	lsl r0, r0, #0x1f
	lsr r1, r0, #0x1f
	lsl r0, r1, #2
	ldr r3, _021ECA28 ; =ov101_021F7E9C
	sub r2, r2, #7
	add r6, r3, r0
	add r1, r1, #1
	lsl r1, r1, #3
	ldr r3, _021ECA2C ; =gSystem + 0x40
	str r0, [sp, #0xc]
	ldrh r0, [r3, #0x20]
	ldrb r4, [r5, r4]
	ldrh r3, [r3, #0x22]
	ldrb r2, [r5, r2]
	sub r0, r0, r4
	lsl r0, r0, #0x10
	sub r2, r3, r2
	lsl r2, r2, #0x10
	asr r0, r0, #0x10
	str r1, [sp, #8]
	asr r4, r2, #0x10
	bl _s32_div_f
	lsl r0, r0, #0x10
	asr r7, r0, #0x10
	ldr r1, [sp, #8]
	add r0, r4, #0
	bl _s32_div_f
	lsl r0, r0, #0x10
	asr r4, r0, #0x10
	ldr r1, _021ECA28 ; =ov101_021F7E9C
	ldr r0, [sp, #0xc]
	ldrb r0, [r1, r0]
	cmp r4, r0
	bge _021EC9DC
	add r4, r0, #0
_021EC9DC:
	ldrb r0, [r6, #1]
	cmp r4, r0
	ble _021EC9E4
	add r4, r0, #0
_021EC9E4:
	ldrb r0, [r6, #2]
	cmp r7, r0
	bge _021EC9EC
	add r7, r0, #0
_021EC9EC:
	ldrb r0, [r6, #3]
	cmp r7, r0
	ble _021EC9F4
	add r7, r0, #0
_021EC9F4:
	add r1, r5, #0
	add r1, #0xf0
	add r0, r5, #0
	ldrh r1, [r1]
	add r0, #0xf4
	ldrh r0, [r0]
	add r1, r4, r1
	lsl r1, r1, #0x10
	add r0, r7, r0
	asr r4, r1, #0x10
	lsl r0, r0, #0x10
	ldr r1, [sp]
	asr r0, r0, #0x10
	cmp r1, #0
	beq _021ECA14
	strh r0, [r1]
_021ECA14:
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _021ECA1C
	strh r4, [r0]
_021ECA1C:
	add r0, r5, #0
	bl ov101_021E94C0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021ECA28: .word ov101_021F7E9C
_021ECA2C: .word gSystem + 0x40
	thumb_func_end ov101_021EC980

	thumb_func_start ov101_021ECA30
ov101_021ECA30: ; 0x021ECA30
	push {r3, r4}
	mov r2, #0x47
	lsl r2, r2, #2
	ldr r0, [r0, r2]
	cmp r0, #0
	beq _021ECA40
	cmp r1, #8
	blo _021ECA46
_021ECA40:
	mov r0, #0
	pop {r3, r4}
	bx lr
_021ECA46:
	lsr r4, r1, #0x1f
	lsl r3, r1, #0x1f
	sub r3, r3, r4
	mov r2, #0x1f
	ror r3, r2
	add r2, r4, r3
	bne _021ECA64
	lsr r1, r1, #1
	add r0, r0, r1
	ldrb r0, [r0, #4]
	cmp r0, #0xf
	beq _021ECA78
	mov r0, #1
	pop {r3, r4}
	bx lr
_021ECA64:
	lsr r1, r1, #1
	lsl r1, r1, #1
	add r0, r0, r1
	ldrh r1, [r0, #8]
	ldr r0, _021ECA80 ; =0x0000FFFF
	cmp r1, r0
	beq _021ECA78
	mov r0, #1
	pop {r3, r4}
	bx lr
_021ECA78:
	mov r0, #0
	pop {r3, r4}
	bx lr
	nop
_021ECA80: .word 0x0000FFFF
	thumb_func_end ov101_021ECA30

	thumb_func_start ov101_021ECA84
ov101_021ECA84: ; 0x021ECA84
	push {r4, r5, lr}
	sub sp, #0x1c
	add r4, r0, #0
	mov r0, #0x4f
	lsl r0, r0, #2
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	lsl r1, r1, #0x1f
	ldrb r2, [r4, r0]
	mov r3, #0x80
	lsr r1, r1, #0x18
	bic r2, r3
	orr r1, r2
	strb r1, [r4, r0]
	add r1, r0, #0
	add r1, #0x40
	ldr r1, [r4, r1]
	mov r3, #8
	add r5, r1, #0
	str r3, [sp]
	mov r2, #5
	str r2, [sp, #4]
	add r5, #0xc
	str r5, [sp, #8]
	ldrb r0, [r4, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1f
	lsl r0, r0, #3
	add r0, #0xe
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0xc]
	mov r0, #0x10
	str r0, [sp, #0x10]
	ldrh r0, [r1]
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x14]
	ldrh r0, [r1, #2]
	mov r1, #2
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0x74]
	bl CopyToBgTilemapRect
	ldr r0, [r4, #0x10]
	mov r1, #2
	ldr r0, [r0, #0x74]
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x1c
	pop {r4, r5, pc}
	thumb_func_end ov101_021ECA84

	thumb_func_start ov101_021ECAF0
ov101_021ECAF0: ; 0x021ECAF0
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, _021ECC48 ; =gSystem
	mov r1, #2
	ldr r0, [r0, #0x48]
	tst r1, r0
	beq _021ECB16
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	ldr r0, [r4, #0x10]
	ldr r1, _021ECC4C ; =0x0000FFFF
	ldr r0, [r0, #0x7c]
	mov r2, #0
	bl PokegearAppSwitchCursor_SetCursorSpritesDrawState
	mov r0, #0xa
	pop {r3, r4, r5, pc}
_021ECB16:
	mov r1, #1
	tst r1, r0
	beq _021ECBE2
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0x7c]
	bl PokegearAppSwitch_GetCursorPos
	add r5, r0, #0
	ldr r0, _021ECC50 ; =0x00000941
	bl PlaySE
	cmp r5, #8
	bne _021ECB40
	ldr r0, [r4, #0x10]
	ldr r1, _021ECC4C ; =0x0000FFFF
	ldr r0, [r0, #0x7c]
	mov r2, #0
	bl PokegearAppSwitchCursor_SetCursorSpritesDrawState
	mov r0, #0xa
	pop {r3, r4, r5, pc}
_021ECB40:
	add r0, r4, #0
	add r1, r5, #0
	bl ov101_021ECA30
	cmp r0, #0
	beq _021ECB8C
	ldr r0, [r4, #0x10]
	ldr r1, _021ECC4C ; =0x0000FFFF
	ldr r0, [r0, #0x7c]
	mov r2, #0
	bl PokegearAppSwitch_SetCursorSpritesAnimateFlag
	ldr r0, [r4, #0x10]
	mov r1, #3
	ldr r0, [r0, #0x7c]
	mov r2, #0
	bl PokegearAppSwitch_SetSpecIndexAndCursorPos
	ldr r0, [r4, #0x10]
	ldr r1, _021ECC4C ; =0x0000FFFF
	ldr r0, [r0, #0x7c]
	mov r2, #1
	bl PokegearAppSwitchCursor_SetCursorSpritesDrawState
	add r0, r4, #0
	mov r1, #1
	bl ov101_021ECA84
	mov r1, #0x4f
	lsl r1, r1, #2
	ldrb r2, [r4, r1]
	mov r0, #0x7f
	bic r2, r0
	mov r0, #2
	orr r2, r0
	strb r2, [r4, r1]
	sub r0, r0, #3
	pop {r3, r4, r5, pc}
_021ECB8C:
	lsr r2, r5, #0x1f
	lsl r1, r5, #0x1f
	sub r1, r1, r2
	mov r0, #0x1f
	ror r1, r0
	add r1, r2, r1
	bne _021ECBD2
	ldr r0, [r4, #0x10]
	ldr r1, _021ECC4C ; =0x0000FFFF
	ldr r0, [r0, #0x7c]
	mov r2, #0
	bl PokegearAppSwitch_SetCursorSpritesAnimateFlag
	ldr r0, [r4, #0x10]
	mov r1, #2
	ldr r0, [r0, #0x7c]
	mov r2, #0
	bl PokegearAppSwitch_SetSpecIndexAndCursorPos
	ldr r0, [r4, #0x10]
	ldr r1, _021ECC4C ; =0x0000FFFF
	ldr r0, [r0, #0x7c]
	mov r2, #1
	bl PokegearAppSwitchCursor_SetCursorSpritesDrawState
	mov r1, #0x4f
	lsl r1, r1, #2
	ldrb r2, [r4, r1]
	mov r0, #0x7f
	bic r2, r0
	mov r0, #1
	orr r2, r0
	strb r2, [r4, r1]
	sub r0, r0, #2
	pop {r3, r4, r5, pc}
_021ECBD2:
	lsr r1, r5, #1
	strh r1, [r4, #0x16]
	add r0, #0xf9
	ldr r0, [r4, r0]
	ldrh r0, [r0]
	strh r0, [r4, #0x2c]
	mov r0, #0xb
	pop {r3, r4, r5, pc}
_021ECBE2:
	mov r1, #0x20
	tst r1, r0
	beq _021ECBFA
	ldr r0, _021ECC54 ; =0x0000093F
	bl PlaySE
	ldr r0, [r4, #0x10]
	mov r1, #0
	ldr r0, [r0, #0x7c]
	bl ov100_021E73AC
	b _021ECC40
_021ECBFA:
	mov r1, #0x10
	tst r1, r0
	beq _021ECC12
	ldr r0, _021ECC54 ; =0x0000093F
	bl PlaySE
	ldr r0, [r4, #0x10]
	mov r1, #1
	ldr r0, [r0, #0x7c]
	bl ov100_021E73AC
	b _021ECC40
_021ECC12:
	mov r1, #0x40
	tst r1, r0
	beq _021ECC2A
	ldr r0, _021ECC54 ; =0x0000093F
	bl PlaySE
	ldr r0, [r4, #0x10]
	mov r1, #2
	ldr r0, [r0, #0x7c]
	bl ov100_021E73AC
	b _021ECC40
_021ECC2A:
	mov r1, #0x80
	tst r0, r1
	beq _021ECC40
	ldr r0, _021ECC54 ; =0x0000093F
	bl PlaySE
	ldr r0, [r4, #0x10]
	mov r1, #3
	ldr r0, [r0, #0x7c]
	bl ov100_021E73AC
_021ECC40:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
	nop
_021ECC48: .word gSystem
_021ECC4C: .word 0x0000FFFF
_021ECC50: .word 0x00000941
_021ECC54: .word 0x0000093F
	thumb_func_end ov101_021ECAF0

	thumb_func_start ov101_021ECC58
ov101_021ECC58: ; 0x021ECC58
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r0, #0
	add r0, #0x84
	ldr r0, [r0]
	add r6, r1, #0
	ldr r7, [r0, #8]
	bl System_GetTouchHeld
	cmp r0, #0
	bne _021ECC76
	mov r0, #0
	add sp, #0x1c
	mvn r0, r0
	pop {r4, r5, r6, r7, pc}
_021ECC76:
	ldr r0, _021ECE44 ; =0x00000139
	ldrb r0, [r5, r0]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	beq _021ECC88
	mov r0, #0
	add sp, #0x1c
	mvn r0, r0
	pop {r4, r5, r6, r7, pc}
_021ECC88:
	ldr r0, _021ECE48 ; =ov101_021F7EF4
	bl TouchscreenHitbox_FindRectAtTouchNew
	add r4, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	bne _021ECC9A
	b _021ECE3E
_021ECC9A:
	mov r1, #1
	str r1, [r6]
	cmp r4, #0x10
	bne _021ECCF4
	mov r0, #0x5f
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #6
	str r1, [sp]
	mov r1, #5
	str r1, [sp, #4]
	add r1, r0, #0
	add r1, #0xc
	str r1, [sp, #8]
	mov r1, #7
	str r1, [sp, #0xc]
	mov r1, #0x10
	str r1, [sp, #0x10]
	ldrh r1, [r0]
	mov r2, #0x17
	mov r3, #8
	lsl r1, r1, #0x15
	lsr r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	mov r1, #2
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x74]
	bl CopyToBgTilemapRect
	ldr r0, [r5, #0x10]
	mov r1, #2
	ldr r0, [r0, #0x74]
	bl ScheduleBgTilemapBufferTransfer
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	add sp, #0x1c
	mov r0, #0xa
	pop {r4, r5, r6, r7, pc}
_021ECCF4:
	cmp r4, #8
	blt _021ECD3C
	ldr r0, _021ECE44 ; =0x00000139
	mov r3, #0xf0
	ldrb r2, [r5, r0]
	bic r2, r3
	add r3, r4, #0
	sub r3, #8
	lsl r3, r3, #0x18
	lsr r3, r3, #0x18
	lsl r3, r3, #0x1c
	lsr r3, r3, #0x18
	orr r2, r3
	strb r2, [r5, r0]
	add r2, r0, #3
	ldrb r3, [r5, r2]
	mov r2, #0x7f
	add r0, r0, #3
	bic r3, r2
	add r2, r3, #0
	orr r2, r1
	strb r2, [r5, r0]
	add r4, #0x14
	mov r0, #0x28
	mul r0, r4
	add r0, r7, r0
	ldr r0, [r0, #0x20]
	bl thunk_Sprite_SetDrawPriority
	ldr r0, _021ECE4C ; =0x00000947
	bl PlaySE
	mov r0, #0
	add sp, #0x1c
	mvn r0, r0
	pop {r4, r5, r6, r7, pc}
_021ECD3C:
	lsl r1, r4, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl ov101_021ECA30
	cmp r0, #0
	beq _021ECE12
	lsr r0, r4, #0x1f
	add r0, r4, r0
	lsl r0, r0, #0xf
	lsr r6, r0, #0x10
	lsr r2, r4, #0x1f
	lsl r0, r4, #0x1f
	sub r0, r0, r2
	mov r1, #0x1f
	ror r0, r1
	add r0, r2, r0
	bne _021ECD92
	ldr r2, _021ECE44 ; =0x00000139
	mov r1, #0xf0
	ldrb r0, [r5, r2]
	bic r0, r1
	lsl r1, r6, #0x18
	lsr r1, r1, #0x18
	lsl r1, r1, #0x1c
	lsr r1, r1, #0x18
	orr r0, r1
	strb r0, [r5, r2]
	mov r1, #0
	add r0, r2, #7
	strh r1, [r5, r0]
	ldrsh r1, [r5, r0]
	add r0, r2, #5
	add r6, #0x14
	strh r1, [r5, r0]
	mov r0, #0x28
	mul r0, r6
	add r0, r7, r0
	ldr r0, [r0, #0x20]
	mov r1, #1
	bl thunk_Sprite_SetDrawPriority
	b _021ECDF4
_021ECD92:
	ldr r0, _021ECE44 ; =0x00000139
	mov r3, #0xf0
	ldrb r2, [r5, r0]
	bic r2, r3
	add r3, r6, #4
	lsl r3, r3, #0x18
	lsr r3, r3, #0x18
	lsl r3, r3, #0x1c
	lsr r3, r3, #0x18
	orr r2, r3
	strb r2, [r5, r0]
	lsr r2, r6, #0x1f
	lsl r0, r6, #0x1f
	sub r0, r0, r2
	ror r0, r1
	add r1, r2, r0
	add r2, r1, #0
	ldr r1, _021ECE50 ; =gSystem + 0x40
	mov r0, #0x68
	mul r2, r0
	ldrh r3, [r1, #0x20]
	add r2, #0x28
	sub r3, r2, r3
	add r2, r0, #0
	add r2, #0xd6
	strh r3, [r5, r2]
	lsr r2, r6, #1
	mov r3, #0x15
	mul r3, r2
	ldrh r1, [r1, #0x22]
	add r3, #0x1f
	add r0, #0xd8
	sub r1, r3, r1
	strh r1, [r5, r0]
	add r1, r6, #0
	add r1, #0x18
	mov r0, #0x28
	mul r0, r1
	add r0, r7, r0
	ldr r0, [r0, #0x20]
	mov r1, #1
	bl thunk_Sprite_SetDrawPriority
	lsl r0, r6, #4
	add r0, r5, r0
	ldr r0, [r0, #0x44]
	mov r1, #0
	bl sub_02013820
_021ECDF4:
	mov r1, #0x4f
	lsl r1, r1, #2
	ldrb r2, [r5, r1]
	mov r0, #0x7f
	bic r2, r0
	mov r0, #2
	orr r0, r2
	strb r0, [r5, r1]
	ldr r0, _021ECE4C ; =0x00000947
	bl PlaySE
	mov r0, #0
	add sp, #0x1c
	mvn r0, r0
	pop {r4, r5, r6, r7, pc}
_021ECE12:
	lsr r2, r4, #0x1f
	lsl r1, r4, #0x1f
	sub r1, r1, r2
	mov r0, #0x1f
	ror r1, r0
	add r1, r2, r1
	cmp r1, #1
	bne _021ECE3C
	add r2, r4, r2
	asr r1, r2, #1
	strh r1, [r5, #0x16]
	add r0, #0xf9
	ldr r0, [r5, r0]
	ldrh r0, [r0]
	strh r0, [r5, #0x2c]
	ldr r0, _021ECE54 ; =0x00000941
	bl PlaySE
	add sp, #0x1c
	mov r0, #0xb
	pop {r4, r5, r6, r7, pc}
_021ECE3C:
	sub r0, #0x20
_021ECE3E:
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_021ECE44: .word 0x00000139
_021ECE48: .word ov101_021F7EF4
_021ECE4C: .word 0x00000947
_021ECE50: .word gSystem + 0x40
_021ECE54: .word 0x00000941
	thumb_func_end ov101_021ECC58

	thumb_func_start ov101_021ECE58
ov101_021ECE58: ; 0x021ECE58
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x10]
	mov r1, #0
	ldr r0, [r0, #0x7c]
	bl ov100_021E73C8
	ldr r0, [r4, #0x10]
	ldr r1, _021ECEA4 ; =0x0000FFFF
	ldr r0, [r0, #0x7c]
	mov r2, #0
	bl PokegearAppSwitchCursor_SetCursorSpritesDrawState
	ldr r0, [r4, #0x10]
	mov r1, #1
	ldr r0, [r0, #0x7c]
	bl PokegearAppSwitch_GetSpecCursorPos
	add r2, r0, #0
	ldr r0, [r4, #0x10]
	mov r1, #1
	ldr r0, [r0, #0x7c]
	bl PokegearAppSwitch_SetSpecIndexAndCursorPos
	ldr r0, [r4, #0x10]
	ldr r1, _021ECEA4 ; =0x0000FFFF
	ldr r0, [r0, #0x7c]
	mov r2, #1
	bl PokegearAppSwitch_SetCursorSpritesAnimateFlag
	mov r1, #0x4f
	lsl r1, r1, #2
	ldrb r2, [r4, r1]
	mov r0, #0x7f
	bic r2, r0
	strb r2, [r4, r1]
	pop {r4, pc}
	nop
_021ECEA4: .word 0x0000FFFF
	thumb_func_end ov101_021ECE58

	thumb_func_start ov101_021ECEA8
ov101_021ECEA8: ; 0x021ECEA8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _021ECF8C ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r0, r1
	beq _021ECF06
	ldr r0, _021ECF90 ; =0x00000941
	bl PlaySE
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x7c]
	bl PokegearAppSwitch_GetCursorPos
	add r6, r0, #0
	ldr r0, [r5, #0x10]
	mov r1, #1
	ldr r0, [r0, #0x7c]
	bl PokegearAppSwitch_GetSpecCursorPos
	mov r1, #0x47
	lsl r1, r1, #2
	add r4, r0, #0
	ldr r0, [r5, r1]
	cmp r0, #0
	bne _021ECEEE
	sub r1, r1, #4
	ldr r1, [r5, r1]
	add r0, r5, #0
	ldrh r1, [r1]
	bl ov101_021ED64C
	mov r1, #0x47
	lsl r1, r1, #2
	str r0, [r5, r1]
_021ECEEE:
	mov r0, #0x47
	lsl r0, r0, #2
	lsl r1, r4, #0x17
	ldr r0, [r5, r0]
	lsr r1, r1, #0x18
	add r2, r6, #0
	bl ov101_021ED750
	add r0, r5, #0
	mov r1, #0
	bl ov101_021EAE54
_021ECF06:
	ldr r0, _021ECF8C ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #2
	tst r0, r1
	beq _021ECF24
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	add r0, r5, #0
	bl ov101_021ECE58
	mov r0, #0
	mvn r0, r0
	pop {r4, r5, r6, pc}
_021ECF24:
	bl System_GetTouchNew
	cmp r0, #0
	beq _021ECF54
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	add r0, r5, #0
	bl ov101_021ECE58
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0xc]
	cmp r0, #1
	beq _021ECF4E
	add r0, r5, #0
	bl ov101_021EB364
	ldr r0, [r5, #0x10]
	mov r1, #1
	str r1, [r0, #0xc]
_021ECF4E:
	mov r0, #0
	mvn r0, r0
	pop {r4, r5, r6, pc}
_021ECF54:
	ldr r0, _021ECF8C ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #0x20
	tst r0, r1
	beq _021ECF70
	ldr r0, _021ECF94 ; =0x0000093F
	bl PlaySE
	ldr r0, [r5, #0x10]
	mov r1, #0
	ldr r0, [r0, #0x7c]
	bl ov100_021E73AC
	b _021ECF86
_021ECF70:
	mov r0, #0x10
	tst r0, r1
	beq _021ECF86
	ldr r0, _021ECF94 ; =0x0000093F
	bl PlaySE
	ldr r0, [r5, #0x10]
	mov r1, #1
	ldr r0, [r0, #0x7c]
	bl ov100_021E73AC
_021ECF86:
	mov r0, #0
	mvn r0, r0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021ECF8C: .word gSystem
_021ECF90: .word 0x00000941
_021ECF94: .word 0x0000093F
	thumb_func_end ov101_021ECEA8

	thumb_func_start ov101_021ECF98
ov101_021ECF98: ; 0x021ECF98
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl System_GetTouchHeld
	cmp r0, #0
	beq _021ECFA6
	b _021ED0C8
_021ECFA6:
	ldr r2, _021ED100 ; =gSystem + 0x40
	ldr r0, _021ED104 ; =ov101_021F7EB8
	ldrh r1, [r2, #0x20]
	ldrh r2, [r2, #0x22]
	bl TouchscreenHitbox_FindHitboxAtPoint
	add r5, r0, #0
	ldr r0, _021ED108 ; =0x00000948
	bl PlaySE
	mov r0, #0
	mvn r0, r0
	cmp r5, r0
	bne _021ED028
	ldr r0, _021ED10C ; =0x00000139
	add r1, r4, #0
	ldrb r0, [r4, r0]
	add r1, #0x84
	ldr r1, [r1]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1c
	add r2, r0, #0
	ldr r3, [r1, #8]
	add r2, #0x1c
	mov r1, #0x28
	mul r1, r2
	add r2, r3, r1
	mov r1, #0x18
	mul r1, r0
	add r1, #0x28
	strh r1, [r2, #4]
	mov r0, #0x84
	strh r0, [r2, #6]
	mov r1, #4
	mov r3, #6
	ldr r0, [r2, #0x20]
	ldrsh r1, [r2, r1]
	ldrsh r2, [r2, r3]
	bl Sprite_SetPositionXY
	ldr r1, _021ED10C ; =0x00000139
	add r0, r4, #0
	ldrb r1, [r4, r1]
	add r0, #0x84
	ldr r0, [r0]
	lsl r1, r1, #0x18
	lsr r2, r1, #0x1c
	ldr r0, [r0, #8]
	add r2, #0x1c
	mov r1, #0x28
	mul r1, r2
	add r0, r0, r1
	ldr r0, [r0, #0x20]
	mov r1, #4
	bl thunk_Sprite_SetDrawPriority
	mov r1, #0x4f
	lsl r1, r1, #2
	ldrb r2, [r4, r1]
	mov r0, #0x7f
	bic r2, r0
	mov r0, #0
	strb r2, [r4, r1]
	mvn r0, r0
	pop {r3, r4, r5, pc}
_021ED028:
	mov r1, #0x47
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	cmp r0, #0
	bne _021ED044
	sub r1, r1, #4
	ldr r1, [r4, r1]
	add r0, r4, #0
	ldrh r1, [r1]
	bl ov101_021ED64C
	mov r1, #0x47
	lsl r1, r1, #2
	str r0, [r4, r1]
_021ED044:
	mov r2, #0x47
	lsl r2, r2, #2
	ldr r0, [r4, r2]
	add r2, #0x1d
	ldrb r2, [r4, r2]
	lsl r1, r5, #0x18
	lsr r1, r1, #0x18
	lsl r2, r2, #0x18
	lsr r2, r2, #0x1c
	bl ov101_021ED750
	add r0, r4, #0
	mov r1, #0
	bl ov101_021EAE54
	ldr r0, _021ED10C ; =0x00000139
	add r1, r4, #0
	ldrb r0, [r4, r0]
	add r1, #0x84
	ldr r1, [r1]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1c
	add r2, r0, #0
	ldr r3, [r1, #8]
	add r2, #0x1c
	mov r1, #0x28
	mul r1, r2
	add r2, r3, r1
	mov r1, #0x18
	mul r1, r0
	add r1, #0x28
	strh r1, [r2, #4]
	mov r0, #0x84
	strh r0, [r2, #6]
	mov r1, #4
	mov r3, #6
	ldr r0, [r2, #0x20]
	ldrsh r1, [r2, r1]
	ldrsh r2, [r2, r3]
	bl Sprite_SetPositionXY
	ldr r1, _021ED10C ; =0x00000139
	add r0, r4, #0
	ldrb r1, [r4, r1]
	add r0, #0x84
	ldr r0, [r0]
	lsl r1, r1, #0x18
	lsr r2, r1, #0x1c
	ldr r0, [r0, #8]
	add r2, #0x1c
	mov r1, #0x28
	mul r1, r2
	add r0, r0, r1
	ldr r0, [r0, #0x20]
	mov r1, #4
	bl thunk_Sprite_SetDrawPriority
	mov r1, #0x4f
	lsl r1, r1, #2
	ldrb r2, [r4, r1]
	mov r0, #0x7f
	bic r2, r0
	mov r0, #0
	strb r2, [r4, r1]
	mvn r0, r0
	pop {r3, r4, r5, pc}
_021ED0C8:
	ldr r2, _021ED10C ; =0x00000139
	add r1, r4, #0
	ldrb r2, [r4, r2]
	add r1, #0x84
	ldr r0, _021ED100 ; =gSystem + 0x40
	ldr r1, [r1]
	lsl r2, r2, #0x18
	lsr r4, r2, #0x1c
	ldrh r3, [r0, #0x22]
	ldr r1, [r1, #8]
	add r4, #0x1c
	mov r2, #0x28
	mul r2, r4
	add r2, r1, r2
	ldrh r0, [r0, #0x20]
	mov r1, #4
	strh r0, [r2, #4]
	strh r3, [r2, #6]
	mov r3, #6
	ldr r0, [r2, #0x20]
	ldrsh r1, [r2, r1]
	ldrsh r2, [r2, r3]
	bl Sprite_SetPositionXY
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
	nop
_021ED100: .word gSystem + 0x40
_021ED104: .word ov101_021F7EB8
_021ED108: .word 0x00000948
_021ED10C: .word 0x00000139
	thumb_func_end ov101_021ECF98

	thumb_func_start ov101_021ED110
ov101_021ED110: ; 0x021ED110
	push {r4, lr}
	add r4, r0, #0
	cmp r1, #0
	bne _021ED126
	mov r0, #0x47
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r1, r2, #0
	bl ov101_021ED760
	b _021ED132
_021ED126:
	mov r0, #0x47
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r1, r2, #0
	bl ov101_021ED7B0
_021ED132:
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #0
	bne _021ED14E
	mov r1, #0x47
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	add r0, r4, #0
	bl ov101_021ED6B8
	mov r0, #0x47
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
_021ED14E:
	add r0, r4, #0
	mov r1, #0
	bl ov101_021EAE54
	pop {r4, pc}
	thumb_func_end ov101_021ED110

	thumb_func_start ov101_021ED158
ov101_021ED158: ; 0x021ED158
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, _021ED1FC ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r0, r1
	beq _021ED1A0
	ldr r0, _021ED200 ; =0x00000946
	bl PlaySE
	ldr r0, [r4, #0x10]
	mov r1, #1
	ldr r0, [r0, #0x7c]
	bl PokegearAppSwitch_GetSpecCursorPos
	add r2, r0, #0
	lsr r5, r2, #0x1f
	lsl r3, r2, #0x1f
	lsl r2, r2, #0x17
	sub r3, r3, r5
	mov r1, #0x1f
	ror r3, r1
	add r1, r5, r3
	lsl r1, r1, #0x18
	add r0, r4, #0
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
	bl ov101_021ED110
	add r0, r4, #0
	bl ov101_021ECE58
	add r0, r4, #0
	mov r1, #0
	bl ov101_021ECA84
_021ED1A0:
	ldr r0, _021ED1FC ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #2
	tst r0, r1
	beq _021ED1C2
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	add r0, r4, #0
	bl ov101_021ECE58
	add r0, r4, #0
	mov r1, #0
	bl ov101_021ECA84
	b _021ED1F4
_021ED1C2:
	bl System_GetTouchNew
	cmp r0, #0
	beq _021ED1F4
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	add r0, r4, #0
	bl ov101_021ECE58
	add r0, r4, #0
	mov r1, #0
	bl ov101_021ECA84
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0xc]
	cmp r0, #1
	beq _021ED1F4
	add r0, r4, #0
	bl ov101_021EB364
	ldr r0, [r4, #0x10]
	mov r1, #1
	str r1, [r0, #0xc]
_021ED1F4:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
	nop
_021ED1FC: .word gSystem
_021ED200: .word 0x00000946
	thumb_func_end ov101_021ED158

	thumb_func_start ov101_021ED204
ov101_021ED204: ; 0x021ED204
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r0, #0x84
	ldr r0, [r0]
	cmp r1, #4
	ldr r5, [r0, #8]
	bhs _021ED25C
	ldr r0, _021ED2BC ; =0x00000139
	mov r1, #0x28
	ldrb r0, [r6, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1c
	add r2, r0, #0
	add r2, #0x14
	add r4, r2, #0
	lsr r6, r0, #0x1f
	lsl r3, r0, #0x1f
	sub r3, r3, r6
	mov r2, #0x1f
	ror r3, r2
	mul r4, r1
	add r3, r6, r3
	mov r2, #0x68
	mul r2, r3
	lsr r3, r0, #1
	mov r0, #0x15
	mul r0, r3
	add r1, r5, #4
	add r2, #0x20
	strh r2, [r1, r4]
	add r2, r5, #6
	add r0, #0x20
	strh r0, [r2, r4]
	add r5, #0x20
	ldrsh r1, [r1, r4]
	ldrsh r2, [r2, r4]
	ldr r0, [r5, r4]
	bl Sprite_SetPositionXY
	ldr r0, [r5, r4]
	mov r1, #4
	bl thunk_Sprite_SetDrawPriority
	pop {r3, r4, r5, r6, r7, pc}
_021ED25C:
	sub r0, r1, #4
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
	add r1, r7, #0
	add r1, #0x18
	add r4, r1, #0
	mov r0, #0x28
	mul r4, r0
	lsr r3, r7, #0x1f
	lsl r2, r7, #0x1f
	sub r2, r2, r3
	mov r0, #0x1f
	ror r2, r0
	add r2, r3, r2
	mov r0, #0x68
	mul r0, r2
	add r1, r5, #4
	add r0, #0x28
	strh r0, [r1, r4]
	add r2, r5, #6
	lsr r3, r7, #1
	mov r0, #0x15
	mul r0, r3
	add r0, #0x1f
	strh r0, [r2, r4]
	add r5, #0x20
	ldrsh r1, [r1, r4]
	ldrsh r2, [r2, r4]
	ldr r0, [r5, r4]
	bl Sprite_SetPositionXY
	ldr r0, [r5, r4]
	mov r1, #4
	bl thunk_Sprite_SetDrawPriority
	mov r1, #4
	add r2, r1, #0
	add r6, #0x44
	lsl r4, r7, #4
	ldr r0, [r6, r4]
	sub r2, #0xa
	bl sub_020136B4
	ldr r0, [r6, r4]
	mov r1, #3
	bl sub_02013820
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021ED2BC: .word 0x00000139
	thumb_func_end ov101_021ED204

	thumb_func_start ov101_021ED2C0
ov101_021ED2C0: ; 0x021ED2C0
	push {r4, r5, r6, lr}
	add r4, r0, #0
	bl System_GetTouchHeld
	cmp r0, #0
	beq _021ED2CE
	b _021ED3F8
_021ED2CE:
	ldr r2, _021ED480 ; =gSystem + 0x40
	ldr r0, _021ED484 ; =ov101_021F7ECC
	ldrh r1, [r2, #0x20]
	ldrh r2, [r2, #0x22]
	bl TouchscreenHitbox_FindHitboxAtPoint
	add r2, r0, #0
	cmp r2, #8
	bne _021ED330
	ldr r0, _021ED488 ; =0x00000139
	ldrb r0, [r4, r0]
	lsl r0, r0, #0x18
	lsr r2, r0, #0x1c
	lsr r5, r2, #0x1f
	lsl r3, r2, #0x1e
	lsl r1, r2, #0x16
	sub r3, r3, r5
	mov r2, #0x1e
	ror r3, r2
	add r2, r5, r3
	lsl r2, r2, #0x18
	add r0, r4, #0
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
	bl ov101_021ED110
	ldr r1, _021ED488 ; =0x00000139
	add r0, r4, #0
	ldrb r1, [r4, r1]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x1c
	bl ov101_021ED204
	add r0, r4, #0
	mov r1, #0
	bl ov101_021ECA84
	ldr r0, _021ED48C ; =0x00000946
	bl PlaySE
	mov r1, #0x4f
	lsl r1, r1, #2
	ldrb r2, [r4, r1]
	mov r0, #0x7f
	bic r2, r0
	mov r0, #0
	strb r2, [r4, r1]
	mvn r0, r0
	pop {r4, r5, r6, pc}
_021ED330:
	mov r0, #0
	mvn r0, r0
	cmp r2, r0
	beq _021ED352
	ldr r3, _021ED488 ; =0x00000139
	asr r0, r2, #1
	ldrb r1, [r4, r3]
	lsr r0, r0, #0x1e
	add r0, r2, r0
	lsl r1, r1, #0x18
	lsr r1, r1, #0x1c
	asr r0, r0, #2
	lsr r5, r1, #2
	cmp r5, r0
	bne _021ED352
	cmp r1, r2
	bne _021ED378
_021ED352:
	ldr r1, _021ED488 ; =0x00000139
	add r0, r4, #0
	ldrb r1, [r4, r1]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x1c
	bl ov101_021ED204
	ldr r0, _021ED490 ; =0x00000948
	bl PlaySE
	mov r1, #0x4f
	lsl r1, r1, #2
	ldrb r2, [r4, r1]
	mov r0, #0x7f
	bic r2, r0
	mov r0, #0
	strb r2, [r4, r1]
	mvn r0, r0
	pop {r4, r5, r6, pc}
_021ED378:
	cmp r0, #0
	bne _021ED3A4
	sub r3, #0x1d
	lsr r5, r1, #0x1f
	lsl r1, r1, #0x1e
	ldr r0, [r4, r3]
	sub r1, r1, r5
	mov r3, #0x1e
	ror r1, r3
	add r1, r5, r1
	lsr r5, r2, #0x1f
	lsl r2, r2, #0x1e
	sub r2, r2, r5
	ror r2, r3
	add r2, r5, r2
	lsl r1, r1, #0x18
	lsl r2, r2, #0x18
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
	bl ov101_021ED780
	b _021ED3CA
_021ED3A4:
	sub r3, #0x1d
	lsr r5, r1, #0x1f
	lsl r1, r1, #0x1e
	ldr r0, [r4, r3]
	sub r1, r1, r5
	mov r3, #0x1e
	ror r1, r3
	add r1, r5, r1
	lsr r5, r2, #0x1f
	lsl r2, r2, #0x1e
	sub r2, r2, r5
	ror r2, r3
	add r2, r5, r2
	lsl r1, r1, #0x18
	lsl r2, r2, #0x18
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
	bl ov101_021ED7D8
_021ED3CA:
	add r0, r4, #0
	mov r1, #0
	bl ov101_021EAE54
	ldr r1, _021ED488 ; =0x00000139
	add r0, r4, #0
	ldrb r1, [r4, r1]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x1c
	bl ov101_021ED204
	ldr r0, _021ED490 ; =0x00000948
	bl PlaySE
	mov r1, #0x4f
	lsl r1, r1, #2
	ldrb r2, [r4, r1]
	mov r0, #0x7f
	bic r2, r0
	mov r0, #0
	strb r2, [r4, r1]
	mvn r0, r0
	pop {r4, r5, r6, pc}
_021ED3F8:
	ldr r0, _021ED480 ; =gSystem + 0x40
	mov r5, #5
	lsl r5, r5, #6
	ldrh r2, [r0, #0x22]
	ldrsh r1, [r4, r5]
	add r3, r2, r1
	sub r2, r5, #7
	ldrb r2, [r4, r2]
	add r1, r4, #0
	add r1, #0x84
	ldr r1, [r1]
	lsl r2, r2, #0x18
	lsr r6, r2, #0x1c
	ldr r1, [r1, #8]
	add r6, #0x14
	mov r2, #0x28
	mul r2, r6
	add r2, r1, r2
	ldrh r1, [r0, #0x20]
	sub r0, r5, #2
	ldrsh r0, [r4, r0]
	add r0, r1, r0
	strh r0, [r2, #4]
	strh r3, [r2, #6]
	mov r1, #4
	mov r3, #6
	ldr r0, [r2, #0x20]
	ldrsh r1, [r2, r1]
	ldrsh r2, [r2, r3]
	bl Sprite_SetPositionXY
	sub r0, r5, #7
	ldrb r0, [r4, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1c
	cmp r0, #4
	blo _021ED454
	sub r0, r0, #4
	lsl r0, r0, #4
	add r0, r4, r0
	mov r1, #4
	add r2, r1, #0
	ldr r0, [r0, #0x44]
	sub r2, #0xa
	bl sub_020136B4
_021ED454:
	mov r0, #0x4f
	lsl r0, r0, #2
	ldrb r0, [r4, r0]
	ldr r2, _021ED480 ; =gSystem + 0x40
	lsl r0, r0, #0x18
	ldrh r1, [r2, #0x20]
	lsr r5, r0, #0x1f
	ldrh r2, [r2, #0x22]
	ldr r0, _021ED494 ; =ov101_021F7EEC
	bl TouchscreenHitbox_PointIsIn
	cmp r5, r0
	beq _021ED478
	mov r1, #1
	add r0, r4, #0
	eor r1, r5
	bl ov101_021ECA84
_021ED478:
	mov r0, #0
	mvn r0, r0
	pop {r4, r5, r6, pc}
	nop
_021ED480: .word gSystem + 0x40
_021ED484: .word ov101_021F7ECC
_021ED488: .word 0x00000139
_021ED48C: .word 0x00000946
_021ED490: .word 0x00000948
_021ED494: .word ov101_021F7EEC
	thumb_func_end ov101_021ED2C0

	thumb_func_start ov101_021ED498
ov101_021ED498: ; 0x021ED498
	mov r1, #0
	strb r1, [r0, #0x13]
	mov r1, #0xff
	strb r1, [r0, #0x12]
	ldrb r1, [r0, #0x12]
	ldr r3, _021ED4AC ; =sub_0202F3DC
	strb r1, [r0, #0x11]
	strb r1, [r0, #0x10]
	bx r3
	nop
_021ED4AC: .word sub_0202F3DC
	thumb_func_end ov101_021ED498

	thumb_func_start ov101_021ED4B0
ov101_021ED4B0: ; 0x021ED4B0
	push {r3, r4}
	ldr r3, _021ED4DC ; =0x0000022B
	mov r4, #0
	mov r2, #0x14
_021ED4B8:
	add r1, r4, #0
	mul r1, r2
	add r1, r0, r1
	ldrb r1, [r1, r3]
	cmp r1, #0
	bne _021ED4CA
	add r0, r4, #0
	pop {r3, r4}
	bx lr
_021ED4CA:
	add r1, r4, #1
	lsl r1, r1, #0x18
	lsr r4, r1, #0x18
	cmp r4, #0x64
	blo _021ED4B8
	mov r0, #0xff
	pop {r3, r4}
	bx lr
	nop
_021ED4DC: .word 0x0000022B
	thumb_func_end ov101_021ED4B0

	thumb_func_start ov101_021ED4E0
ov101_021ED4E0: ; 0x021ED4E0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x28]
	bl sub_0202EDF4
	str r0, [sp]
	ldr r0, _021ED5A0 ; =0x000009F1
	mov r1, #0xff
	strb r1, [r5, r0]
	ldrb r1, [r5, r0]
	sub r0, r0, #1
	mov r4, #0
	strb r1, [r5, r0]
	mov r0, #0x86
	lsl r0, r0, #2
	add r6, r5, r0
	mov r7, #0x14
_021ED506:
	add r0, r4, #0
	mul r0, r7
	add r0, r6, r0
	bl ov101_021ED498
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #0x64
	blo _021ED506
	mov r0, #0x86
	lsl r0, r0, #2
	mov r6, #0
	add r0, r5, r0
	add r7, r6, #0
	str r0, [sp, #4]
_021ED526:
	ldr r0, [sp]
	add r1, r7, #0
	bl sub_0202F4E8
	cmp r0, #0
	beq _021ED596
	mov r0, #0x14
	add r1, r6, #0
	mul r1, r0
	ldr r0, [sp, #4]
	add r2, r7, #0
	add r4, r0, r1
	ldr r0, [sp]
	add r1, r4, #0
	bl sub_0202F514
	strb r6, [r4, #0x10]
	mov r0, #1
	strb r0, [r4, #0x13]
	mov r0, #0x9f
	lsl r0, r0, #4
	ldrb r0, [r5, r0]
	cmp r0, #0xff
	bne _021ED56A
	ldrb r1, [r4, #0x10]
	mov r0, #0x9f
	lsl r0, r0, #4
	strb r1, [r5, r0]
	ldrb r1, [r4, #0x10]
	add r0, r0, #1
	strb r1, [r5, r0]
	mov r0, #0xff
	strb r0, [r4, #0x11]
	b _021ED586
_021ED56A:
	ldr r0, _021ED5A0 ; =0x000009F1
	ldr r1, _021ED5A0 ; =0x000009F1
	ldrb r0, [r5, r0]
	strb r0, [r4, #0x11]
	ldrb r2, [r5, r1]
	mov r1, #0x14
	ldrb r0, [r4, #0x10]
	mul r1, r2
	add r2, r5, r1
	ldr r1, _021ED5A4 ; =0x0000022A
	strb r0, [r2, r1]
	ldrb r1, [r4, #0x10]
	ldr r0, _021ED5A0 ; =0x000009F1
	strb r1, [r5, r0]
_021ED586:
	add r0, r6, #1
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	add r0, r7, #1
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
	cmp r7, #0x64
	blo _021ED526
_021ED596:
	ldr r0, _021ED5A8 ; =0x000009F2
	strb r6, [r5, r0]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021ED5A0: .word 0x000009F1
_021ED5A4: .word 0x0000022A
_021ED5A8: .word 0x000009F2
	thumb_func_end ov101_021ED4E0

	thumb_func_start ov101_021ED5AC
ov101_021ED5AC: ; 0x021ED5AC
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	ldr r0, [r7, #0x10]
	ldr r0, [r0, #0x28]
	bl sub_0202EDF4
	add r6, r0, #0
	mov r0, #0x9f
	lsl r0, r0, #4
	ldrb r0, [r7, r0]
	mov r5, #0
	cmp r0, #0xff
	beq _021ED5EE
	mov r1, #0x86
	lsl r1, r1, #2
	add r1, r7, r1
	str r1, [sp]
_021ED5CE:
	mov r1, #0x14
	mul r1, r0
	ldr r0, [sp]
	add r2, r5, #0
	add r4, r0, r1
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	add r0, r6, #0
	add r1, r4, #0
	mov r3, #1
	bl sub_0202F53C
	ldrb r0, [r4, #0x12]
	cmp r0, #0xff
	bne _021ED5CE
_021ED5EE:
	ldr r0, _021ED610 ; =0x000009F2
	ldrb r0, [r7, r0]
	cmp r5, r0
	bhs _021ED60C
	ldr r4, _021ED610 ; =0x000009F2
_021ED5F8:
	add r0, r6, #0
	add r1, r5, #0
	bl sub_0202F500
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	ldrb r0, [r7, r4]
	cmp r5, r0
	blo _021ED5F8
_021ED60C:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021ED610: .word 0x000009F2
	thumb_func_end ov101_021ED5AC

	thumb_func_start ov101_021ED614
ov101_021ED614: ; 0x021ED614
	push {r4, r5}
	cmp r1, #0
	bgt _021ED620
	mov r0, #0
	pop {r4, r5}
	bx lr
_021ED620:
	mov r2, #0x9f
	lsl r2, r2, #4
	ldrb r5, [r0, r2]
	cmp r5, #0xff
	beq _021ED644
	mov r2, #0x86
	lsl r2, r2, #2
	add r4, r0, r2
	mov r2, #0x14
_021ED632:
	add r3, r5, #0
	mul r3, r2
	add r0, r4, r3
	ldr r3, [r4, r3]
	cmp r3, r1
	beq _021ED646
	ldrb r5, [r0, #0x12]
	cmp r5, #0xff
	bne _021ED632
_021ED644:
	mov r0, #0
_021ED646:
	pop {r4, r5}
	bx lr
	.balign 4, 0
	thumb_func_end ov101_021ED614

	thumb_func_start ov101_021ED64C
ov101_021ED64C: ; 0x021ED64C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov101_021ED614
	cmp r0, #0
	bne _021ED6B6
	add r0, r5, #0
	bl ov101_021ED4B0
	cmp r0, #0xff
	bne _021ED66C
	bl GF_AssertFail
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021ED66C:
	mov r1, #0x86
	lsl r1, r1, #2
	mov r3, #0x14
	add r7, r0, #0
	add r2, r5, r1
	mul r7, r3
	add r3, r2, r7
	strb r0, [r3, #0x10]
	mov r6, #1
	strb r6, [r3, #0x13]
	str r4, [r2, r7]
	mov r2, #0x9f
	lsl r2, r2, #4
	ldrb r4, [r5, r2]
	cmp r4, #0xff
	bne _021ED69C
	add r1, r2, #1
	strb r0, [r5, r1]
	add r0, r1, #0
	ldrb r0, [r5, r0]
	strb r0, [r5, r2]
	mov r0, #0xff
	strb r0, [r3, #0x11]
	b _021ED6B4
_021ED69C:
	add r4, r2, #1
	ldrb r6, [r5, r4]
	mov r4, #0x14
	add r1, #0x12
	mul r4, r6
	add r4, r5, r4
	strb r0, [r4, r1]
	add r1, r2, #1
	ldrb r1, [r5, r1]
	strb r1, [r3, #0x11]
	add r1, r2, #1
	strb r0, [r5, r1]
_021ED6B4:
	add r0, r3, #0
_021ED6B6:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov101_021ED64C

	thumb_func_start ov101_021ED6B8
ov101_021ED6B8: ; 0x021ED6B8
	push {r4, r5, r6, lr}
	add r3, r1, #0
	bne _021ED6C2
	mov r0, #0
	pop {r4, r5, r6, pc}
_021ED6C2:
	mov r1, #0x9f
	lsl r1, r1, #4
	ldrb r4, [r3, #0x10]
	ldrb r2, [r0, r1]
	cmp r4, r2
	bne _021ED6FE
	ldrb r5, [r3, #0x12]
	cmp r5, #0xff
	bne _021ED6E0
	mov r4, #0xff
	add r2, r1, #1
	strb r4, [r0, r2]
	ldrb r2, [r0, r2]
	strb r2, [r0, r1]
	b _021ED742
_021ED6E0:
	mov r4, #0x14
	add r2, r5, #0
	mul r2, r4
	add r5, r0, r2
	mov r2, #0x8a
	lsl r2, r2, #2
	ldrb r5, [r5, r2]
	strb r5, [r0, r1]
	ldrb r5, [r3, #0x12]
	mov r1, #0xff
	mul r4, r5
	add r4, r0, r4
	add r0, r2, #1
	strb r1, [r4, r0]
	b _021ED742
_021ED6FE:
	add r2, r1, #1
	ldrb r2, [r0, r2]
	cmp r4, r2
	bne _021ED726
	ldrb r4, [r3, #0x11]
	mov r5, #0x14
	mov r2, #0xff
	add r6, r4, #0
	mul r6, r5
	ldr r4, _021ED74C ; =0x0000022A
	add r6, r0, r6
	strb r2, [r6, r4]
	ldrb r2, [r3, #0x11]
	add r1, r1, #1
	mul r5, r2
	add r5, r0, r5
	sub r2, r4, #2
	ldrb r2, [r5, r2]
	strb r2, [r0, r1]
	b _021ED742
_021ED726:
	ldrb r2, [r3, #0x11]
	ldrb r1, [r3, #0x12]
	mov r4, #0x14
	add r5, r2, #0
	mul r5, r4
	ldr r2, _021ED74C ; =0x0000022A
	add r5, r0, r5
	strb r1, [r5, r2]
	ldrb r5, [r3, #0x12]
	ldrb r1, [r3, #0x11]
	mul r4, r5
	add r4, r0, r4
	sub r0, r2, #1
	strb r1, [r4, r0]
_021ED742:
	add r0, r3, #0
	bl ov101_021ED498
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021ED74C: .word 0x0000022A
	thumb_func_end ov101_021ED6B8

	thumb_func_start ov101_021ED750
ov101_021ED750: ; 0x021ED750
	cmp r0, #0
	bne _021ED758
	mov r0, #0
	bx lr
_021ED758:
	add r0, r0, r1
	strb r2, [r0, #4]
	mov r0, #1
	bx lr
	thumb_func_end ov101_021ED750

	thumb_func_start ov101_021ED760
ov101_021ED760: ; 0x021ED760
	push {r3, lr}
	cmp r0, #0
	bne _021ED76A
	mov r0, #0
	pop {r3, pc}
_021ED76A:
	mov r2, #0xf
	add r1, r0, r1
	strb r2, [r1, #4]
	bl sub_0202F400
	cmp r0, #0
	beq _021ED77C
	mov r0, #1
	pop {r3, pc}
_021ED77C:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ov101_021ED760

	thumb_func_start ov101_021ED780
ov101_021ED780: ; 0x021ED780
	push {r3, r4}
	cmp r0, #0
	bne _021ED78C
	mov r0, #0
	pop {r3, r4}
	bx lr
_021ED78C:
	add r4, r0, #4
	ldrb r3, [r4, r1]
	ldrb r0, [r4, r2]
	strb r0, [r4, r1]
	strb r3, [r4, r2]
	mov r0, #1
	pop {r3, r4}
	bx lr
	thumb_func_end ov101_021ED780

	thumb_func_start ov101_021ED79C
ov101_021ED79C: ; 0x021ED79C
	cmp r0, #0
	bne _021ED7A4
	mov r0, #0
	bx lr
_021ED7A4:
	lsl r1, r1, #1
	add r0, r0, r1
	strh r2, [r0, #8]
	mov r0, #1
	bx lr
	.balign 4, 0
	thumb_func_end ov101_021ED79C

	thumb_func_start ov101_021ED7B0
ov101_021ED7B0: ; 0x021ED7B0
	push {r3, lr}
	cmp r0, #0
	bne _021ED7BA
	mov r0, #0
	pop {r3, pc}
_021ED7BA:
	lsl r1, r1, #1
	ldr r2, _021ED7D4 ; =0x0000FFFF
	add r1, r0, r1
	strh r2, [r1, #8]
	bl sub_0202F400
	cmp r0, #0
	beq _021ED7CE
	mov r0, #1
	pop {r3, pc}
_021ED7CE:
	mov r0, #0
	pop {r3, pc}
	nop
_021ED7D4: .word 0x0000FFFF
	thumb_func_end ov101_021ED7B0

	thumb_func_start ov101_021ED7D8
ov101_021ED7D8: ; 0x021ED7D8
	push {r3, r4}
	cmp r0, #0
	bne _021ED7E4
	mov r0, #0
	pop {r3, r4}
	bx lr
_021ED7E4:
	add r0, #8
	lsl r4, r1, #1
	lsl r2, r2, #1
	ldrh r3, [r0, r4]
	ldrh r1, [r0, r2]
	strh r1, [r0, r4]
	strh r3, [r0, r2]
	mov r0, #1
	pop {r3, r4}
	bx lr
	thumb_func_end ov101_021ED7D8

	// File boundary?

	thumb_func_start TownMap_Init
TownMap_Init: ; 0x021ED7F8
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl OverlayManager_GetArgs
	add r5, r0, #0
	ldr r0, _021ED8A4 ; =FS_OVERLAY_ID(OVY_100)
	mov r1, #2
	bl HandleLoadOverlay
	ldr r0, _021ED8A8 ; =FS_OVERLAY_ID(OVY_26)
	mov r1, #2
	bl HandleLoadOverlay
	mov r2, #1
	mov r0, #3
	mov r1, #0x5b
	lsl r2, r2, #0x12
	bl CreateHeap
	ldr r1, _021ED8AC ; =0x000009F4
	add r0, r4, #0
	mov r2, #0x5b
	bl OverlayManager_CreateAndGetData
	ldr r2, _021ED8AC ; =0x000009F4
	mov r1, #0
	add r4, r0, #0
	bl memset
	mov r0, #0x5b
	mov r1, #0xcc
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0xcc
	str r0, [r4, #0x10]
	bl memset
	mov r1, #0x5b
	str r1, [r4]
	ldr r0, [r4, #0x10]
	str r1, [r0]
	ldr r0, [r4, #0x10]
	str r5, [r0, #0x20]
	ldr r1, [r4, #0x10]
	ldr r0, [r1, #0x20]
	ldr r0, [r0, #0x24]
	str r0, [r1, #0x24]
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0x24]
	bl SaveData_Pokegear_Get
	ldr r1, [r4, #0x10]
	str r0, [r1, #0x28]
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0x24]
	bl Save_VarsFlags_Get
	ldr r1, [r4, #0x10]
	str r0, [r1, #0x2c]
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0x24]
	bl Save_PlayerData_GetOptionsAddr
	ldr r1, [r4, #0x10]
	str r0, [r1, #0x30]
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0x24]
	bl Save_PlayerData_GetProfile
	ldr r1, [r4, #0x10]
	str r0, [r1, #0x34]
	add r0, r4, #0
	bl ov101_021ED980
	mov r0, #0x85
	ldr r1, _021ED8B0 ; =ov101_021F7372
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r1, #0x64
	add r0, r1, #0
	add r0, #0xd2
	strb r1, [r4, r0]
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_021ED8A4: .word FS_OVERLAY_ID(OVY_100)
_021ED8A8: .word FS_OVERLAY_ID(OVY_26)
_021ED8AC: .word 0x000009F4
_021ED8B0: .word ov101_021F7372
	thumb_func_end TownMap_Init

	thumb_func_start TownMap_Main
TownMap_Main: ; 0x021ED8B4
	push {r4, lr}
	add r4, r1, #0
	bl OverlayManager_GetData
	ldr r1, [r4]
	cmp r1, #0xd
	bhi _021ED91E
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021ED8CE: ; jump table
	.short _021ED8EA - _021ED8CE - 2 ; case 0
	.short _021ED8F2 - _021ED8CE - 2 ; case 1
	.short _021ED8FA - _021ED8CE - 2 ; case 2
	.short _021ED91E - _021ED8CE - 2 ; case 3
	.short _021ED90A - _021ED8CE - 2 ; case 4
	.short _021ED912 - _021ED8CE - 2 ; case 5
	.short _021ED91E - _021ED8CE - 2 ; case 6
	.short _021ED91E - _021ED8CE - 2 ; case 7
	.short _021ED91E - _021ED8CE - 2 ; case 8
	.short _021ED91E - _021ED8CE - 2 ; case 9
	.short _021ED91E - _021ED8CE - 2 ; case 10
	.short _021ED91E - _021ED8CE - 2 ; case 11
	.short _021ED902 - _021ED8CE - 2 ; case 12
	.short _021ED91A - _021ED8CE - 2 ; case 13
_021ED8EA:
	bl ov101_021EDB1C
	str r0, [r4]
	b _021ED91E
_021ED8F2:
	bl ov101_021EDB30
	str r0, [r4]
	b _021ED91E
_021ED8FA:
	bl ov101_021EDBD4
	str r0, [r4]
	b _021ED91E
_021ED902:
	bl ov101_021EDBFC
	str r0, [r4]
	b _021ED91E
_021ED90A:
	bl ov101_021EDC04
	str r0, [r4]
	b _021ED91E
_021ED912:
	bl ov101_021EDC70
	str r0, [r4]
	b _021ED91E
_021ED91A:
	mov r0, #1
	pop {r4, pc}
_021ED91E:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end TownMap_Main

	thumb_func_start TownMap_Exit
TownMap_Exit: ; 0x021ED924
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	bl ov101_021EDAF8
	ldr r0, [r4, #0x38]
	bl MapMatrix_MapData_Free
	ldr r2, [r4, #0x10]
	ldr r0, [r2, #0x1c]
	cmp r0, #6
	beq _021ED948
	ldrb r1, [r2, #5]
	mov r0, #0x80
	orr r0, r1
	strb r0, [r2, #5]
_021ED948:
	ldr r0, [r4, #0x10]
	mov r1, #0
	mov r2, #0xcc
	bl MI_CpuFill8
	ldr r0, [r4, #0x10]
	bl FreeToHeap
	ldr r4, [r4]
	add r0, r5, #0
	bl OverlayManager_FreeData
	add r0, r4, #0
	bl DestroyHeap
	ldr r0, _021ED978 ; =FS_OVERLAY_ID(OVY_26)
	bl UnloadOverlayByID
	ldr r0, _021ED97C ; =FS_OVERLAY_ID(OVY_100)
	bl UnloadOverlayByID
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_021ED978: .word FS_OVERLAY_ID(OVY_26)
_021ED97C: .word FS_OVERLAY_ID(OVY_100)
	thumb_func_end TownMap_Exit

	thumb_func_start ov101_021ED980
ov101_021ED980: ; 0x021ED980
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0x10]
	str r4, [r1, #0x64]
	ldr r2, [r4, #0x10]
	ldr r1, [r2, #0x20]
	ldrb r1, [r1, #1]
	str r1, [r2, #0xc]
	ldr r1, [r4, #0x10]
	ldr r2, _021EDAE8 ; =ov101_021EB338
	ldr r1, [r1, #0x20]
	ldrb r1, [r1]
	add r1, r1, #1
	strb r1, [r4, #0xd]
	ldr r1, [r4, #0x10]
	str r2, [r1, #0x5c]
	ldr r2, _021EDAEC ; =ov101_021EB2FC
	ldr r1, [r4, #0x10]
	str r2, [r1, #0x60]
	bl ov101_021ED4E0
	mov r1, #0x4e
	lsl r1, r1, #2
	ldrb r2, [r4, r1]
	mov r0, #0x10
	bic r2, r0
	strb r2, [r4, r1]
	ldrb r2, [r4, r1]
	mov r0, #0xe
	bic r2, r0
	strb r2, [r4, r1]
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0x28]
	bl Pokegear_GetMapUnlockLevel
	mov r2, #0x4e
	lsl r2, r2, #2
	lsl r0, r0, #0x1e
	ldrb r3, [r4, r2]
	mov r1, #0x60
	lsr r0, r0, #0x19
	bic r3, r1
	orr r0, r3
	strb r0, [r4, r2]
	ldr r0, [r4]
	bl MapMatrix_MapData_New
	str r0, [r4, #0x38]
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0x24]
	bl SaveData_GetPhoneCallPersistentState
	mov r1, #0x49
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4]
	bl AllocAndReadPhoneBook
	mov r1, #0x4a
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, #0x10]
	ldr r1, [r4]
	ldr r0, [r0, #0x28]
	bl SavePokegear_AllocAndCopyPhonebook
	mov r1, #0x4b
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0x28]
	bl SavePokegear_FindEmptyPhonebookSlot
	mov r2, #0x13
	lsl r2, r2, #4
	strb r0, [r4, r2]
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0x20]
	add r0, #0x22
	ldrb r1, [r0]
	add r0, r2, #0
	sub r0, #0x28
	strh r1, [r4, r0]
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0x20]
	add r0, #0x23
	ldrb r0, [r0]
	add r1, r0, #2
	add r0, r2, #0
	sub r0, #0x26
	strh r1, [r4, r0]
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0x20]
	ldrh r1, [r0, #0x10]
	add r0, r2, #0
	sub r0, #0x24
	strh r1, [r4, r0]
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0x20]
	ldrb r1, [r0, #7]
	add r0, r2, #0
	sub r0, #0x22
	strh r1, [r4, r0]
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0x20]
	add r0, #0x22
	ldrb r1, [r0]
	add r0, r2, #0
	sub r0, #0x20
	strh r1, [r4, r0]
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0x20]
	add r0, #0x23
	ldrb r0, [r0]
	add r1, r0, #2
	add r0, r2, #0
	sub r0, #0x1e
	strh r1, [r4, r0]
	mov r1, #1
	add r0, r1, #0
	add r0, #0xff
	strh r1, [r4, r0]
	add r0, r2, #0
	sub r0, #0x2c
	strh r1, [r4, r0]
	add r0, r2, #0
	add r0, #8
	ldrb r0, [r4, r0]
	lsl r0, r0, #0x19
	lsr r0, r0, #0x1e
	lsl r1, r0, #1
	ldr r0, _021EDAF0 ; =ov101_021F7F3C
	ldrh r1, [r0, r1]
	add r0, r2, #0
	sub r0, #0x2e
	strh r1, [r4, r0]
	mov r1, #0x11
	add r0, r1, #0
	add r0, #0xf5
	strh r1, [r4, r0]
	mov r1, #0x20
	add r0, r2, #2
	strb r1, [r4, r0]
	mov r1, #8
	add r0, r2, #1
	strb r1, [r4, r0]
	mov r1, #0
	add r0, r2, #3
	strb r1, [r4, r0]
	sub r1, #0x18
	add r0, r2, #4
	strb r1, [r4, r0]
	add r0, r2, #0
	add r0, #0xd
	ldrb r0, [r4, r0]
	mov r1, #2
	add r2, #0xd
	orr r0, r1
	strb r0, [r4, r2]
	ldr r0, [r4, #0x10]
	mov r2, #0xf
	ldr r0, [r0, #0x2c]
	bl Save_VarsFlags_FlypointFlagAction
	ldr r3, _021EDAF4 ; =0x0000013D
	mov r2, #1
	ldrb r1, [r4, r3]
	lsl r0, r0, #0x18
	bic r1, r2
	lsr r2, r0, #0x18
	mov r0, #1
	and r0, r2
	orr r0, r1
	strb r0, [r4, r3]
	ldr r0, [r4, #0x10]
	bl ov100_021E5C80
	strb r0, [r4, #0xe]
	pop {r4, pc}
	nop
_021EDAE8: .word ov101_021EB338
_021EDAEC: .word ov101_021EB2FC
_021EDAF0: .word ov101_021F7F3C
_021EDAF4: .word 0x0000013D
	thumb_func_end ov101_021ED980

	thumb_func_start ov101_021EDAF8
ov101_021EDAF8: ; 0x021EDAF8
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x4b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl FreeToHeap
	mov r0, #0x4a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl FreePhoneBook
	ldr r0, [r4, #0x10]
	mov r1, #0
	str r1, [r0, #0x5c]
	ldr r0, [r4, #0x10]
	str r1, [r0, #0x60]
	pop {r4, pc}
	thumb_func_end ov101_021EDAF8

	thumb_func_start ov101_021EDB1C
ov101_021EDB1C: ; 0x021EDB1C
	push {r3, lr}
	bl ov101_021EDCE0
	cmp r0, #0
	beq _021EDB2A
	mov r0, #4
	pop {r3, pc}
_021EDB2A:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov101_021EDB1C

	thumb_func_start ov101_021EDB30
ov101_021EDB30: ; 0x021EDB30
	push {r3, r4, lr}
	sub sp, #4
	mov r1, #0
	str r1, [sp]
	ldr r1, _021EDBC8 ; =0x00000139
	add r4, r0, #0
	ldrb r1, [r4, r1]
	lsl r1, r1, #0x1c
	lsr r1, r1, #0x1f
	bne _021EDB4C
	add r1, sp, #0
	bl ov101_021EBC1C
	b _021EDB54
_021EDB4C:
	bl ov101_021EC0AC
	mov r1, #1
	str r1, [sp]
_021EDB54:
	ldr r1, [sp]
	cmp r1, #0
	beq _021EDB84
	ldr r1, [r4, #0x10]
	mov r2, #1
	str r2, [r1, #0xc]
	ldr r1, [r4, #0x10]
	str r0, [r1, #0x1c]
	sub r1, r2, #2
	cmp r0, r1
	beq _021EDB7E
	cmp r0, #4
	beq _021EDB78
	cmp r0, #8
	bne _021EDB7E
	add sp, #4
	mov r0, #0xc
	pop {r3, r4, pc}
_021EDB78:
	add sp, #4
	mov r0, #5
	pop {r3, r4, pc}
_021EDB7E:
	add sp, #4
	mov r0, #1
	pop {r3, r4, pc}
_021EDB84:
	ldr r0, _021EDBCC ; =gSystem
	ldr r1, [r0, #0x48]
	ldr r0, _021EDBD0 ; =0x00000CF3
	tst r0, r1
	beq _021EDB94
	ldr r0, [r4, #0x10]
	mov r1, #0
	str r1, [r0, #0xc]
_021EDB94:
	add r0, r4, #0
	bl ov101_021EB94C
	ldr r1, [r4, #0x10]
	str r0, [r1, #0x1c]
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _021EDBBA
	cmp r0, #4
	beq _021EDBB4
	cmp r0, #8
	bne _021EDBBA
	add sp, #4
	mov r0, #0xc
	pop {r3, r4, pc}
_021EDBB4:
	add sp, #4
	mov r0, #5
	pop {r3, r4, pc}
_021EDBBA:
	add r0, r4, #0
	bl ov101_021EC304
	mov r0, #1
	add sp, #4
	pop {r3, r4, pc}
	nop
_021EDBC8: .word 0x00000139
_021EDBCC: .word gSystem
_021EDBD0: .word 0x00000CF3
	thumb_func_end ov101_021EDB30

	thumb_func_start ov101_021EDBD4
ov101_021EDBD4: ; 0x021EDBD4
	push {r4, lr}
	add r4, r0, #0
	bl ov101_021EDDB0
	cmp r0, #0
	bne _021EDBE4
	mov r0, #2
	pop {r4, pc}
_021EDBE4:
	ldr r2, [r4, #0x10]
	add r4, #0x14
	add r2, #0x3c
	mov r1, #0xe
_021EDBEC:
	ldrh r0, [r4]
	add r4, r4, #2
	strh r0, [r2]
	add r2, r2, #2
	sub r1, r1, #1
	bne _021EDBEC
	mov r0, #0xd
	pop {r4, pc}
	thumb_func_end ov101_021EDBD4

	thumb_func_start ov101_021EDBFC
ov101_021EDBFC: ; 0x021EDBFC
	ldr r3, _021EDC00 ; =ov101_021EDDF4
	bx r3
	.balign 4, 0
_021EDC00: .word ov101_021EDDF4
	thumb_func_end ov101_021EDBFC

	thumb_func_start ov101_021EDC04
ov101_021EDC04: ; 0x021EDC04
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _021EDC16
	cmp r0, #1
	beq _021EDC58
	b _021EDC6A
_021EDC16:
	mov r0, #6
	mov r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r5]
	add r2, r1, #0
	str r0, [sp, #8]
	mov r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r4, #0
	mov r6, #1
_021EDC30:
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	add r1, r6, #0
	bl ToggleBgLayer
	add r4, r4, #1
	cmp r4, #8
	blt _021EDC30
	mov r0, #0x10
	mov r1, #1
	bl GfGfx_EngineATogglePlanes
	mov r0, #0x10
	mov r1, #1
	bl GfGfx_EngineBTogglePlanes
	ldr r0, [r5, #4]
	add r0, r0, #1
	str r0, [r5, #4]
	b _021EDC6A
_021EDC58:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021EDC6A
	mov r0, #0
	str r0, [r5, #4]
	add sp, #0xc
	mov r0, #1
	pop {r3, r4, r5, r6, pc}
_021EDC6A:
	mov r0, #4
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov101_021EDC04

	thumb_func_start ov101_021EDC70
ov101_021EDC70: ; 0x021EDC70
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _021EDC82
	cmp r0, #1
	beq _021EDCA2
	b _021EDCD8
_021EDC82:
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r5]
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	ldr r0, [r5, #4]
	add r0, r0, #1
	str r0, [r5, #4]
	b _021EDCD8
_021EDCA2:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021EDCD8
	mov r4, #0
	add r6, r4, #0
_021EDCAE:
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	add r1, r6, #0
	bl ToggleBgLayer
	add r4, r4, #1
	cmp r4, #8
	blt _021EDCAE
	mov r0, #0x10
	mov r1, #0
	bl GfGfx_EngineATogglePlanes
	mov r0, #0x10
	mov r1, #0
	bl GfGfx_EngineBTogglePlanes
	mov r0, #0
	str r0, [r5, #4]
	add sp, #0xc
	mov r0, #2
	pop {r3, r4, r5, r6, pc}
_021EDCD8:
	mov r0, #5
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov101_021EDC70

	thumb_func_start ov101_021EDCE0
ov101_021EDCE0: ; 0x021EDCE0
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #8]
	cmp r1, #4
	bhi _021EDD94
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021EDCF6: ; jump table
	.short _021EDD00 - _021EDCF6 - 2 ; case 0
	.short _021EDD94 - _021EDCF6 - 2 ; case 1
	.short _021EDD50 - _021EDCF6 - 2 ; case 2
	.short _021EDD68 - _021EDCF6 - 2 ; case 3
	.short _021EDD7A - _021EDCF6 - 2 ; case 4
_021EDD00:
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	bl GfGfx_DisableEngineAPlanes
	bl GfGfx_DisableEngineBPlanes
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _021EDDA0 ; =0xFFFFE0FF
	and r1, r0
	str r1, [r2]
	ldr r2, _021EDDA4 ; =0x04001000
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	mov r0, #0
	add r1, r0, #0
	bl sub_0200FBF4
	mov r0, #1
	mov r1, #0
	bl sub_0200FBF4
	mov r0, #0
	bl sub_0200FBDC
	mov r0, #1
	bl sub_0200FBDC
	bl sub_020210BC
	mov r0, #2
	bl sub_02021148
	b _021EDD94
_021EDD50:
	bl ov101_021EDE4C
	add r0, r4, #0
	bl ov101_021EDFF8
	add r0, r4, #0
	bl ov101_021EE1C4
	add r0, r4, #0
	bl ov101_021EE230
	b _021EDD94
_021EDD68:
	bl ov101_021EE394
	add r0, r4, #0
	bl ov101_021EE410
	add r0, r4, #0
	bl ov101_021EE350
	b _021EDD94
_021EDD7A:
	bl ov101_021EE670
	ldr r0, _021EDDA8 ; =PokegearApp_VBlankCB
	ldr r1, [r4, #0x10]
	bl Main_SetVBlankIntrCB
	ldr r1, _021EDDAC ; =ov101_021E9270
	ldr r0, [r4, #0x10]
	str r1, [r0, #0x58]
	mov r0, #0
	str r0, [r4, #8]
	mov r0, #1
	pop {r4, pc}
_021EDD94:
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	mov r0, #0
	pop {r4, pc}
	nop
_021EDDA0: .word 0xFFFFE0FF
_021EDDA4: .word 0x04001000
_021EDDA8: .word PokegearApp_VBlankCB
_021EDDAC: .word ov101_021E9270
	thumb_func_end ov101_021EDCE0

	thumb_func_start ov101_021EDDB0
ov101_021EDDB0: ; 0x021EDDB0
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0x10]
	mov r2, #0
	str r2, [r1, #0x58]
	bl ov101_021EE380
	add r0, r4, #0
	bl ov101_021EE664
	add r0, r4, #0
	bl ov101_021EE3D8
	add r0, r4, #0
	bl ov101_021EE2E8
	add r0, r4, #0
	bl ov101_021EE210
	add r0, r4, #0
	bl ov101_021EE190
	add r0, r4, #0
	bl ov101_021EDF54
	bl sub_02021238
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov101_021EDDB0

	thumb_func_start ov101_021EDDF4
ov101_021EDDF4: ; 0x021EDDF4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, #0xc4
	ldr r0, [r0]
	bl TouchscreenListMenu_HandleInput
	add r6, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r6, r0
	beq _021EDE46
	add r0, r5, #0
	add r0, #0xc4
	ldr r0, [r0]
	add r1, r0, #0
	add r1, #0x27
	ldrb r1, [r1]
	lsl r1, r1, #0x18
	lsr r4, r1, #0x19
	bl TouchscreenListMenu_Destroy
	ldr r1, [r5, #0x10]
	ldr r0, [r1, #0xc]
	cmp r4, r0
	beq _021EDE28
	str r4, [r1, #0xc]
_021EDE28:
	cmp r6, #0
	bne _021EDE38
	ldr r0, [r5, #0x10]
	mov r1, #1
	ldr r0, [r0, #0x20]
	str r1, [r0, #0x14]
	mov r0, #5
	pop {r4, r5, r6, pc}
_021EDE38:
	mov r1, #0
	add r0, r5, #0
	mvn r1, r1
	bl ov101_021EB4C4
	mov r0, #1
	pop {r4, r5, r6, pc}
_021EDE46:
	mov r0, #0xc
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov101_021EDDF4

	thumb_func_start ov101_021EDE4C
ov101_021EDE4C: ; 0x021EDE4C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0xf0
	add r5, r0, #0
	bl ov100_021E5FDC
	ldr r0, [r5]
	bl BgConfig_Alloc
	ldr r1, [r5, #0x10]
	ldr r2, _021EDF44 ; =0x04000304
	str r0, [r1, #0x74]
	ldrh r1, [r2]
	ldr r0, _021EDF48 ; =0xFFFF7FFF
	ldr r4, _021EDF4C ; =ov101_021F7F44
	and r0, r1
	strh r0, [r2]
	add r3, sp, #0
	add r2, r3, #0
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	ldr r4, _021EDF50 ; =ov101_021F7F9C
	add r3, sp, #0x10
	mov r2, #0x1c
_021EDE84:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021EDE84
	ldr r0, [r5, #0x10]
	mov r1, #0
	ldr r0, [r0, #0x74]
	add r2, sp, #0x10
	add r3, r1, #0
	bl InitBgFromTemplate
	ldr r0, [r5, #0x10]
	mov r1, #1
	ldr r0, [r0, #0x74]
	add r2, sp, #0x2c
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r5, #0x10]
	mov r1, #2
	ldr r0, [r0, #0x74]
	add r2, sp, #0x48
	add r3, r1, #0
	bl InitBgFromTemplate
	ldr r0, [r5, #0x10]
	mov r1, #3
	ldr r0, [r0, #0x74]
	add r2, sp, #0x64
	mov r3, #2
	bl InitBgFromTemplate
	ldr r0, [r5, #0x10]
	mov r1, #4
	ldr r0, [r0, #0x74]
	add r2, sp, #0x80
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r5, #0x10]
	mov r1, #5
	ldr r0, [r0, #0x74]
	add r2, sp, #0x9c
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r5, #0x10]
	mov r1, #6
	ldr r0, [r0, #0x74]
	add r2, sp, #0xb8
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r5, #0x10]
	mov r1, #7
	ldr r0, [r0, #0x74]
	add r2, sp, #0xd4
	mov r3, #0
	bl InitBgFromTemplate
	mov r0, #0xf
	mov r1, #0
	bl GfGfx_EngineATogglePlanes
	mov r0, #0xf
	mov r1, #0
	bl GfGfx_EngineBTogglePlanes
	mov r4, #0
	mov r6, #0x20
	add r7, r4, #0
_021EDF12:
	ldr r0, [r5, #0x10]
	lsl r1, r4, #0x18
	ldr r0, [r0, #0x74]
	lsr r1, r1, #0x18
	bl BgClearTilemapBufferAndCommit
	lsl r0, r4, #0x18
	ldr r3, [r5]
	lsr r0, r0, #0x18
	add r1, r6, #0
	add r2, r7, #0
	bl BG_ClearCharDataRange
	ldr r0, [r5, #0x10]
	lsl r1, r4, #0x18
	ldr r0, [r0, #0x74]
	lsr r1, r1, #0x18
	bl ScheduleBgTilemapBufferTransfer
	add r4, r4, #1
	cmp r4, #8
	blt _021EDF12
	add sp, #0xf0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021EDF44: .word 0x04000304
_021EDF48: .word 0xFFFF7FFF
_021EDF4C: .word ov101_021F7F44
_021EDF50: .word ov101_021F7F9C
	thumb_func_end ov101_021EDE4C

	thumb_func_start ov101_021EDF54
ov101_021EDF54: ; 0x021EDF54
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	mov r1, #7
	ldr r3, [r4]
	mov r0, #1
	lsl r1, r1, #6
	mov r2, #0
	bl BG_LoadBlankPltt
	mov r1, #6
	ldr r3, [r4]
	mov r0, #5
	lsl r1, r1, #6
	mov r2, #0
	bl BG_LoadBlankPltt
	ldr r0, [r4, #0x10]
	mov r1, #7
	ldr r0, [r0, #0x74]
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x10]
	mov r1, #6
	ldr r0, [r0, #0x74]
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x10]
	mov r1, #5
	ldr r0, [r0, #0x74]
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x10]
	mov r1, #4
	ldr r0, [r0, #0x74]
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x10]
	mov r1, #3
	ldr r0, [r0, #0x74]
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x10]
	mov r1, #2
	ldr r0, [r0, #0x74]
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x10]
	mov r1, #1
	ldr r0, [r0, #0x74]
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x10]
	mov r1, #0
	ldr r0, [r0, #0x74]
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0x74]
	bl FreeToHeap
	ldr r2, _021EDFEC ; =0x04000304
	ldr r0, _021EDFF0 ; =0xFFFF7FFF
	ldrh r1, [r2]
	and r0, r1
	strh r0, [r2]
	mov r1, #0
	ldr r0, _021EDFF4 ; =0x04000050
	add r2, r1, #0
	add r3, r1, #0
	str r1, [sp]
	bl G2x_SetBlendAlpha_
	add sp, #4
	pop {r3, r4, pc}
	nop
_021EDFEC: .word 0x04000304
_021EDFF0: .word 0xFFFF7FFF
_021EDFF4: .word 0x04000050
	thumb_func_end ov101_021EDF54

	thumb_func_start ov101_021EDFF8
ov101_021EDFF8: ; 0x021EDFF8
	push {r4, r5, lr}
	sub sp, #0x14
	add r5, r0, #0
	ldr r1, [r5]
	mov r0, #0x90
	bl NARC_New
	add r4, r0, #0
	mov r0, #0x42
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x10]
	ldr r1, [r5]
	ldr r0, [r0, #0x74]
	add r2, r4, #0
	mov r3, #0x90
	bl sub_0208820C
	mov r0, #0xa
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x10]
	ldr r1, [r5]
	ldr r0, [r0, #0x74]
	add r2, r4, #0
	mov r3, #0x90
	bl sub_0208820C
	mov r0, #0x40
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x10]
	ldr r1, [r5]
	ldr r0, [r0, #0x74]
	add r2, r4, #0
	mov r3, #0x90
	bl sub_0208820C
	mov r0, #0x44
	str r0, [sp]
	mov r0, #6
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x10]
	ldr r1, [r5]
	ldr r0, [r0, #0x74]
	add r2, r4, #0
	mov r3, #0x90
	bl sub_0208820C
	mov r0, #0xc
	str r0, [sp]
	mov r0, #7
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x10]
	ldr r1, [r5]
	ldr r0, [r0, #0x74]
	add r2, r4, #0
	mov r3, #0x90
	bl sub_0208820C
	mov r0, #0x3f
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x10]
	ldr r1, [r5]
	ldr r0, [r0, #0x74]
	add r2, r4, #0
	mov r3, #0x90
	bl sub_0208820C
	mov r0, #0x3e
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x10]
	ldr r1, [r5]
	ldr r0, [r0, #0x74]
	add r2, r4, #0
	mov r3, #0x90
	bl sub_0208820C
	mov r0, #0x41
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x10]
	ldr r1, [r5]
	ldr r0, [r0, #0x74]
	add r2, r4, #0
	mov r3, #0x90
	bl sub_0208820C
	ldr r0, [r5]
	mov r3, #0x5b
	lsl r3, r3, #2
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x45
	mov r2, #0
	add r3, r5, r3
	bl GfGfxLoader_GetScrnDataFromOpenNarc
	mov r3, #0x55
	lsl r3, r3, #2
	str r0, [r5, r3]
	ldr r0, [r5]
	add r3, #0x1c
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0xb
	mov r2, #0
	add r3, r5, r3
	bl GfGfxLoader_GetScrnDataFromOpenNarc
	mov r3, #0x56
	lsl r3, r3, #2
	str r0, [r5, r3]
	ldr r0, [r5]
	add r3, #0x1c
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0xd
	mov r2, #0
	add r3, r5, r3
	bl GfGfxLoader_GetScrnDataFromOpenNarc
	mov r3, #0x57
	lsl r3, r3, #2
	str r0, [r5, r3]
	ldr r0, [r5]
	add r3, #0x1c
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x43
	mov r2, #0
	add r3, r5, r3
	bl GfGfxLoader_GetScrnDataFromOpenNarc
	mov r1, #0x16
	lsl r1, r1, #4
	str r0, [r5, r1]
	add r0, r4, #0
	bl NARC_Delete
	ldr r0, [r5, #0x10]
	mov r1, #4
	ldr r0, [r0, #0x74]
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r5, #0x10]
	mov r1, #1
	ldr r0, [r0, #0x74]
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r5, #0x10]
	mov r1, #2
	ldr r0, [r0, #0x74]
	bl ScheduleBgTilemapBufferTransfer
	ldr r1, [r5]
	mov r0, #4
	bl FontID_Alloc
	add sp, #0x14
	pop {r4, r5, pc}
	thumb_func_end ov101_021EDFF8

	thumb_func_start ov101_021EE190
ov101_021EE190: ; 0x021EE190
	push {r4, lr}
	add r4, r0, #0
	mov r0, #4
	bl FontID_Release
	mov r0, #0x16
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl FreeToHeap
	mov r0, #0x57
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl FreeToHeap
	mov r0, #0x56
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl FreeToHeap
	mov r0, #0x55
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end ov101_021EE190

	thumb_func_start ov101_021EE1C4
ov101_021EE1C4: ; 0x021EE1C4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r7, r0, #0
	mov r0, #0x61
	lsl r0, r0, #2
	ldr r4, _021EE20C ; =ov101_021F7F54
	mov r6, #0
	add r5, r7, r0
_021EE1D4:
	ldrb r0, [r4, #2]
	add r1, r5, #0
	str r0, [sp]
	ldrb r0, [r4, #3]
	str r0, [sp, #4]
	ldrb r0, [r4, #4]
	str r0, [sp, #8]
	ldrb r0, [r4, #5]
	str r0, [sp, #0xc]
	ldrh r0, [r4, #6]
	str r0, [sp, #0x10]
	ldr r0, [r7, #0x10]
	ldrb r2, [r4]
	ldrb r3, [r4, #1]
	ldr r0, [r0, #0x74]
	bl AddWindowParameterized
	add r0, r5, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r6, r6, #1
	add r4, #8
	add r5, #0x10
	cmp r6, #9
	blt _021EE1D4
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021EE20C: .word ov101_021F7F54
	thumb_func_end ov101_021EE1C4

	thumb_func_start ov101_021EE210
ov101_021EE210: ; 0x021EE210
	push {r3, r4, r5, lr}
	mov r1, #0x61
	lsl r1, r1, #2
	mov r4, #0
	add r5, r0, r1
_021EE21A:
	add r0, r5, #0
	bl ClearWindowTilemapAndCopyToVram
	add r0, r5, #0
	bl RemoveWindow
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #9
	blt _021EE21A
	pop {r3, r4, r5, pc}
	thumb_func_end ov101_021EE210

	thumb_func_start ov101_021EE230
ov101_021EE230: ; 0x021EE230
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0x1b
	add r2, r1, #0
	ldr r3, [r4]
	mov r0, #0
	add r2, #0xf6
	bl NewMsgDataFromNarc
	add r1, r4, #0
	add r1, #0x88
	str r0, [r1]
	ldr r2, [r4]
	mov r0, #2
	mov r1, #0x5b
	bl MessageFormat_New_Custom
	add r1, r4, #0
	add r1, #0x8c
	str r0, [r1]
	ldr r1, [r4]
	mov r0, #0x5b
	bl String_New
	add r1, r4, #0
	add r1, #0x90
	str r0, [r1]
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	mov r1, #1
	bl NewString_ReadMsgData
	add r1, r4, #0
	add r1, #0x9c
	str r0, [r1]
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	mov r1, #0
	bl NewString_ReadMsgData
	add r1, r4, #0
	add r1, #0xa0
	str r0, [r1]
	ldr r1, [r4]
	mov r0, #0x28
	bl String_New
	add r1, r4, #0
	add r1, #0xa4
	str r0, [r1]
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	mov r1, #4
	bl NewString_ReadMsgData
	add r1, r4, #0
	add r1, #0xa8
	str r0, [r1]
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	mov r1, #5
	bl NewString_ReadMsgData
	add r1, r4, #0
	add r1, #0xac
	str r0, [r1]
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	mov r1, #6
	bl NewString_ReadMsgData
	add r1, r4, #0
	add r1, #0xb0
	str r0, [r1]
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	mov r1, #3
	bl NewString_ReadMsgData
	add r1, r4, #0
	add r1, #0xb4
	str r0, [r1]
	mov r0, #2
	add r4, #0xb8
	strb r0, [r4]
	pop {r4, pc}
	thumb_func_end ov101_021EE230

	thumb_func_start ov101_021EE2E8
ov101_021EE2E8: ; 0x021EE2E8
	push {r4, lr}
	add r4, r0, #0
	add r0, #0xb4
	ldr r0, [r0]
	bl String_Delete
	add r0, r4, #0
	add r0, #0xb0
	ldr r0, [r0]
	bl String_Delete
	add r0, r4, #0
	add r0, #0xac
	ldr r0, [r0]
	bl String_Delete
	add r0, r4, #0
	add r0, #0xa8
	ldr r0, [r0]
	bl String_Delete
	add r0, r4, #0
	add r0, #0xa4
	ldr r0, [r0]
	bl String_Delete
	add r0, r4, #0
	add r0, #0xa0
	ldr r0, [r0]
	bl String_Delete
	add r0, r4, #0
	add r0, #0x9c
	ldr r0, [r0]
	bl String_Delete
	add r0, r4, #0
	add r0, #0x90
	ldr r0, [r0]
	bl String_Delete
	add r0, r4, #0
	add r0, #0x8c
	ldr r0, [r0]
	bl MessageFormat_Delete
	add r4, #0x88
	ldr r0, [r4]
	bl DestroyMsgData
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov101_021EE2E8

	thumb_func_start ov101_021EE350
ov101_021EE350: ; 0x021EE350
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r1, [r5]
	mov r0, #2
	bl ListMenuItems_New
	add r1, r5, #0
	add r1, #0xc0
	str r0, [r1]
	mov r4, #0
_021EE364:
	add r0, r5, #0
	add r1, r5, #0
	add r0, #0xc0
	add r1, #0x88
	ldr r0, [r0]
	ldr r1, [r1]
	add r2, r4, #7
	add r3, r4, #0
	bl ListMenuItems_AppendFromMsgData
	add r4, r4, #1
	cmp r4, #2
	blt _021EE364
	pop {r3, r4, r5, pc}
	thumb_func_end ov101_021EE350

	thumb_func_start ov101_021EE380
ov101_021EE380: ; 0x021EE380
	push {r4, lr}
	add r4, r0, #0
	add r0, #0xc0
	ldr r0, [r0]
	bl ListMenuItems_Delete
	mov r0, #0
	add r4, #0xc0
	str r0, [r4]
	pop {r4, pc}
	thumb_func_end ov101_021EE380

	thumb_func_start ov101_021EE394
ov101_021EE394: ; 0x021EE394
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x10]
	bl ov100_021E6914
	ldr r0, [r4, #0x10]
	mov r1, #2
	bl PokegearApp_CreateSpriteManager
	ldr r1, [r4]
	mov r0, #0x2a
	bl ov100_021E6E20
	add r1, r4, #0
	add r1, #0x84
	str r0, [r1]
	ldr r0, [r4, #0x10]
	add r0, #0x8c
	ldr r0, [r0]
	bl SpriteSystem_GetRenderer
	mov r2, #0xf
	mov r1, #0
	lsl r2, r2, #0x10
	bl G2dRenderer_SetSubSurfaceCoords
	ldr r1, [r4, #0x10]
	ldr r0, [r4]
	ldr r1, [r1, #0x78]
	bl TouchscreenListMenuSpawner_Create
	add r4, #0xbc
	str r0, [r4]
	pop {r4, pc}
	thumb_func_end ov101_021EE394

	thumb_func_start ov101_021EE3D8
ov101_021EE3D8: ; 0x021EE3D8
	push {r4, lr}
	add r4, r0, #0
	add r0, #0xbc
	ldr r0, [r0]
	bl TouchscreenListMenuSpawner_Destroy
	ldr r0, [r4, #0x10]
	add r0, #0x8c
	ldr r0, [r0]
	bl SpriteSystem_GetRenderer
	mov r2, #3
	mov r1, #0
	lsl r2, r2, #0x12
	bl G2dRenderer_SetSubSurfaceCoords
	add r0, r4, #0
	add r0, #0x84
	ldr r0, [r0]
	bl ov100_021E6E58
	ldr r0, [r4, #0x10]
	bl PokegearApp_DestroySpriteManager
	ldr r0, [r4, #0x10]
	bl ov100_021E6950
	pop {r4, pc}
	thumb_func_end ov101_021EE3D8

	thumb_func_start ov101_021EE410
ov101_021EE410: ; 0x021EE410
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, #0x84
	ldr r0, [r0]
	mov r6, #0
	ldr r0, [r0, #8]
	mov r7, #0x15
	str r0, [sp]
	add r4, r0, #0
_021EE422:
	ldr r1, [r5, #0x10]
	ldr r2, _021EE64C ; =ov101_021F807C
	add r0, r1, #0
	add r0, #0x8c
	add r1, #0x90
	ldr r0, [r0]
	ldr r1, [r1]
	bl SpriteSystem_CreateSpriteFromResourceHeader
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x84
	ldr r0, [r0]
	bl ov100_021E6EC4
	lsr r2, r6, #0x1f
	lsl r3, r6, #0x1f
	sub r3, r3, r2
	mov r1, #0x1f
	ror r3, r1
	add r3, r2, r3
	add r2, r6, r2
	mov r1, #0x68
	mul r1, r3
	asr r2, r2, #1
	add r3, r2, #0
	mul r3, r7
	add r1, #0x20
	add r3, #0xcb
	lsl r1, r1, #0x10
	lsl r2, r3, #0x10
	ldr r0, [r4, #0x20]
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	bl Sprite_SetPositionXY
	ldr r0, [r4, #0x20]
	mov r1, #0
	bl thunk_Sprite_SetPriority
	add r6, r6, #1
	add r4, #0x28
	cmp r6, #4
	blt _021EE422
	ldr r1, [r5, #0x10]
	ldr r2, _021EE650 ; =ov101_021F80A4
	add r0, r1, #0
	add r0, #0x8c
	add r1, #0x90
	ldr r0, [r0]
	ldr r1, [r1]
	bl SpriteSystem_CreateSpriteFromResourceHeader
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x84
	ldr r0, [r0]
	bl ov100_021E6EC4
	ldr r0, [sp]
	mov r1, #0
	add r0, #0xc0
	ldr r0, [r0]
	bl thunk_Sprite_SetPriority
	ldr r1, [r5, #0x10]
	ldr r2, _021EE654 ; =ov101_021F80CC
	add r0, r1, #0
	add r0, #0x8c
	add r1, #0x90
	ldr r0, [r0]
	ldr r1, [r1]
	bl SpriteSystem_CreateSpriteFromResourceHeader
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x84
	ldr r0, [r0]
	bl ov100_021E6EC4
	ldr r1, [r5, #0x10]
	ldr r2, _021EE658 ; =ov101_021F80F4
	add r0, r1, #0
	add r0, #0x8c
	add r1, #0x90
	ldr r0, [r0]
	ldr r1, [r1]
	bl SpriteSystem_CreateSpriteFromResourceHeader
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x84
	ldr r0, [r0]
	bl ov100_021E6EC4
	mov r7, #0
	ldr r6, [sp]
	add r4, r7, #0
_021EE4E6:
	ldr r1, [r5, #0x10]
	ldr r2, _021EE65C ; =ov101_021F811C
	add r0, r1, #0
	add r0, #0x8c
	add r1, #0x90
	ldr r0, [r0]
	ldr r1, [r1]
	bl SpriteSystem_CreateSpriteFromResourceHeader
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x84
	ldr r0, [r0]
	bl ov100_021E6EC4
	cmp r7, #0
	ble _021EE51A
	add r0, r4, #0
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _021EE528
_021EE51A:
	add r0, r4, #0
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_021EE528:
	bl _ffix
	add r1, r0, #0
	mov r0, #0x4e
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	bl Sprite_UpdateAnim
	mov r0, #1
	lsl r0, r0, #0xc
	add r7, r7, #1
	add r4, r4, r0
	add r6, #0x28
	cmp r7, #4
	blt _021EE4E6
	ldr r7, _021EE64C ; =ov101_021F807C
	mov r6, #0
_021EE54A:
	ldr r1, [r5, #0x10]
	add r3, r6, #5
	add r0, r1, #0
	add r0, #0x8c
	add r1, #0x90
	mov r2, #0x28
	mul r2, r3
	ldr r0, [r0]
	ldr r1, [r1]
	add r2, r7, r2
	bl SpriteSystem_CreateSpriteFromResourceHeader
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x84
	ldr r0, [r0]
	bl ov100_021E6EC4
	mov r1, #0x28
	mul r1, r0
	ldr r0, [sp]
	add r4, r0, r1
	ldr r0, [r4, #0x20]
	add r1, r4, #4
	add r2, r4, #6
	bl Sprite_GetPositionXY
	ldr r0, [r4, #0x20]
	mov r1, #0
	bl thunk_Sprite_SetPriority
	ldr r0, [r4, #0x20]
	mov r1, #1
	bl Sprite_SetAnimActiveFlag
	ldr r0, [r4, #0x20]
	mov r1, #0
	bl Sprite_SetDrawFlag
	add r6, r6, #1
	cmp r6, #4
	blt _021EE54A
	mov r6, #0
	mov r7, #0x28
_021EE5A2:
	ldr r1, [r5, #0x10]
	ldr r2, _021EE660 ; =ov101_021F81E4
	add r0, r1, #0
	add r0, #0x8c
	add r1, #0x90
	ldr r0, [r0]
	ldr r1, [r1]
	bl SpriteSystem_CreateSpriteFromResourceHeader
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x84
	ldr r0, [r0]
	bl ov100_021E6EC4
	add r1, r0, #0
	ldr r0, [sp]
	mul r1, r7
	add r4, r0, r1
	ldr r0, [r4, #0x20]
	add r1, r4, #4
	add r2, r4, #6
	bl Sprite_GetPositionXY
	ldr r0, [r4, #0x20]
	mov r1, #0
	bl Sprite_SetDrawFlag
	ldr r0, [r4, #0x20]
	mov r1, #0
	bl Sprite_SetAnimActiveFlag
	add r6, r6, #1
	cmp r6, #0x1b
	blt _021EE5A2
	mov r4, #0
	mov r7, #0x28
_021EE5EC:
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
	add r1, r0, #0
	ldr r0, [sp]
	mul r1, r7
	add r6, r0, r1
	ldr r0, [r6, #0x20]
	add r1, r6, #4
	add r2, r6, #6
	bl Sprite_GetPositionXY
	ldr r0, [r6, #0x20]
	mov r1, #0
	bl Sprite_SetDrawFlag
	add r4, r4, #1
	cmp r4, #0xb
	blt _021EE5EC
	ldr r0, [sp]
	mov r1, #1
	add r0, #0xe8
	ldr r0, [r0]
	bl Sprite_SetAnimActiveFlag
	mov r1, #0x11
	ldr r0, [sp]
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	mov r1, #0
	bl Sprite_SetAnimActiveFlag
	mov r1, #0x11
	ldr r0, [sp]
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	ldr r1, [r5, #0x10]
	ldr r1, [r1, #0x20]
	ldrb r1, [r1, #7]
	bl Sprite_SetAnimationFrame
	ldr r0, [sp]
	mov r1, #2
	add r0, #0xe8
	str r0, [sp]
	ldr r0, [r0]
	bl Sprite_SetAffineOverwriteMode
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021EE64C: .word ov101_021F807C
_021EE650: .word ov101_021F80A4
_021EE654: .word ov101_021F80CC
_021EE658: .word ov101_021F80F4
_021EE65C: .word ov101_021F811C
_021EE660: .word ov101_021F81E4
	thumb_func_end ov101_021EE410

	thumb_func_start ov101_021EE664
ov101_021EE664: ; 0x021EE664
	ldr r3, _021EE66C ; =ov100_021E6EF4
	add r0, #0x84
	ldr r0, [r0]
	bx r3
	.balign 4, 0
_021EE66C: .word ov100_021E6EF4
	thumb_func_end ov101_021EE664

	thumb_func_start ov101_021EE670
ov101_021EE670: ; 0x021EE670
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r5, r0, #0
	add r0, #0x84
	ldr r0, [r0]
	mov r1, #4
	ldr r0, [r0, #8]
	mov r2, #8
	str r0, [sp, #0x1c]
	mov r0, #6
	str r0, [sp]
	ldr r0, _021EE8D8 ; =0x04000050
	mov r3, #0xa
	bl G2x_SetBlendAlpha_
	mov r4, #0
	mov r6, #3
	add r7, r4, #0
_021EE694:
	ldr r0, [r5, #0x10]
	add r1, r4, #1
	lsl r1, r1, #0x18
	ldr r0, [r0, #0x74]
	lsr r1, r1, #0x18
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x10]
	add r1, r4, #1
	lsl r1, r1, #0x18
	mov r2, #0
	ldr r0, [r0, #0x74]
	lsr r1, r1, #0x18
	add r3, r2, #0
	bl BgSetPosTextAndCommit
	ldr r0, [r5, #0x10]
	add r1, r4, #1
	lsl r1, r1, #0x18
	ldr r0, [r0, #0x74]
	lsr r1, r1, #0x18
	add r2, r6, #0
	add r3, r7, #0
	bl BgSetPosTextAndCommit
	add r4, r4, #1
	cmp r4, #3
	blt _021EE694
	ldr r1, _021EE8DC ; =ov101_021EB338
	ldr r0, [r5, #0x10]
	str r1, [r0, #0x5c]
	ldr r1, _021EE8E0 ; =ov101_021EB2FC
	ldr r0, [r5, #0x10]
	str r1, [r0, #0x60]
	add r0, r5, #0
	bl ov101_021E990C
	add r1, r5, #0
	add r0, r5, #0
	add r1, #0xc8
	bl ov101_021E9B70
	mov r0, #0x5e
	lsl r0, r0, #2
	mov r2, #0
	ldr r0, [r5, r0]
	mov r1, #0x20
	str r1, [sp]
	mov r1, #0x18
	str r1, [sp, #4]
	add r1, r0, #0
	add r1, #0xc
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	str r2, [sp, #0x10]
	ldrh r1, [r0]
	add r3, r2, #0
	lsl r1, r1, #0x15
	lsr r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	mov r1, #1
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x74]
	bl CopyToBgTilemapRect
	add r0, r5, #0
	bl ov101_021EAF40
	mov r0, #0
	mvn r0, r0
	strb r0, [r5, #0xf]
	ldrb r0, [r5, #0xd]
	cmp r0, #2
	bne _021EE7BC
	mov r0, #0x5b
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0x20
	str r1, [sp]
	mov r1, #6
	add r2, r0, #0
	str r1, [sp, #4]
	add r2, #0xc
	str r2, [sp, #8]
	mov r2, #0
	str r2, [sp, #0xc]
	mov r3, #8
	str r3, [sp, #0x10]
	ldrh r4, [r0]
	lsl r4, r4, #0x15
	lsr r4, r4, #0x18
	str r4, [sp, #0x14]
	ldrh r0, [r0, #2]
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x74]
	bl CopyToBgTilemapRect
	mov r3, #0x46
	lsl r3, r3, #2
	add r2, r3, #0
	add r1, r5, r3
	sub r2, #8
	sub r3, r3, #6
	ldrsh r2, [r5, r2]
	ldrsh r3, [r5, r3]
	add r0, r5, #0
	lsl r2, r2, #0x18
	lsl r3, r3, #0x18
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl ov101_021EA794
	add r0, r5, #0
	mov r1, #1
	bl ov101_021EAD90
	ldr r0, [r5, #0x10]
	mov r2, #3
	add r3, r2, #0
	ldr r0, [r0, #0x74]
	mov r1, #5
	sub r3, #0x54
	bl BgSetPosTextAndCommit
	ldr r0, [r5, #0x10]
	mov r2, #3
	add r3, r2, #0
	ldr r0, [r0, #0x74]
	mov r1, #6
	sub r3, #0x54
	bl BgSetPosTextAndCommit
	ldr r0, [r5, #0x10]
	mov r2, #3
	add r3, r2, #0
	ldr r0, [r0, #0x74]
	mov r1, #7
	sub r3, #0x54
	bl BgSetPosTextAndCommit
	b _021EE82A
_021EE7BC:
	add r0, r5, #0
	mov r1, #0
	bl ov101_021EA4D0
	mov r0, #0x5b
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0x20
	str r1, [sp]
	mov r1, #0x10
	str r1, [sp, #4]
	add r1, r0, #0
	add r1, #0xc
	str r1, [sp, #8]
	mov r2, #0
	str r2, [sp, #0xc]
	mov r3, #8
	str r3, [sp, #0x10]
	ldrh r1, [r0]
	lsl r1, r1, #0x15
	lsr r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	mov r1, #6
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x74]
	bl CopyToBgTilemapRect
	mov r3, #0x46
	lsl r3, r3, #2
	add r2, r3, #0
	add r1, r5, r3
	sub r2, #8
	sub r3, r3, #6
	ldrsh r2, [r5, r2]
	ldrsh r3, [r5, r3]
	add r0, r5, #0
	lsl r2, r2, #0x18
	lsl r3, r3, #0x18
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl ov101_021EA8A8
	add r0, r5, #0
	mov r1, #0
	bl ov101_021EAD90
	mov r1, #0
	add r0, r5, #0
	mvn r1, r1
	bl ov101_021EB4C4
_021EE82A:
	add r0, r5, #0
	mov r1, #1
	bl ov101_021EB1E0
	add r0, r5, #0
	mov r1, #1
	bl ov101_021EA608
	add r1, r5, #0
	add r1, #0xb0
	ldr r1, [r1]
	mov r0, #4
	mov r2, #0
	bl FontID_String_GetWidth
	lsl r0, r0, #0x10
	asr r1, r0, #0x10
	mov r0, #0x30
	sub r1, r0, r1
	lsr r0, r1, #0x1f
	add r0, r1, r0
	lsl r0, r0, #0xf
	mov r1, #0
	asr r3, r0, #0x10
	str r1, [sp]
	add r2, r5, #0
	ldr r0, _021EE8E4 ; =0x00030100
	str r1, [sp, #4]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	mov r0, #0x81
	add r2, #0xb0
	lsl r0, r0, #2
	ldr r2, [r2]
	add r0, r5, r0
	mov r1, #4
	bl AddTextPrinterParameterizedWithColor
	ldr r0, [sp, #0x1c]
	mov r1, #1
	add r0, #0xe8
	str r0, [sp, #0x1c]
	ldr r0, [r0]
	bl Sprite_SetDrawFlag
	add r0, r5, #0
	add r0, #0x84
	ldr r0, [r0]
	bl ov100_021E6E84
	ldr r0, [r5, #0x10]
	mov r1, #4
	ldr r0, [r0, #0x74]
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r5, #0x10]
	mov r1, #5
	ldr r0, [r0, #0x74]
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r5, #0x10]
	mov r1, #7
	ldr r0, [r0, #0x74]
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r5, #0x10]
	mov r1, #0
	ldr r0, [r0, #0x74]
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r5, #0x10]
	mov r1, #1
	ldr r0, [r0, #0x74]
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r5, #0x10]
	mov r1, #2
	ldr r0, [r0, #0x74]
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r5, #0x10]
	mov r1, #3
	ldr r0, [r0, #0x74]
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021EE8D8: .word 0x04000050
_021EE8DC: .word ov101_021EB338
_021EE8E0: .word ov101_021EB2FC
_021EE8E4: .word 0x00030100
	thumb_func_end ov101_021EE670

    .rodata

_021F7358:
	.short 0x001A, 0x001D, 0x002D, 0x0209, 0x020A, 0x020B

ov101_021F7364: ; 0x021F7364
	.short 0x0133, 0x0134, 0x0135, 0x0136, 0x0137, 0x0148, 0x0149

ov101_021F7372: ; 0x021F7372
	.byte 0x09, 0x02, 0x13, 0x02, 0x33, 0xC0, 0x41, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x33, 0x01, 0x18, 0x10, 0x33, 0xC0, 0x45, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x78, 0x00, 0x15, 0x06, 0x11, 0x00, 0x37, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x28, 0x01, 0x01
	.byte 0x7B, 0x00, 0x11, 0x0A, 0x11, 0x00, 0x3A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x28, 0x01, 0x01
	.byte 0x7B, 0x00, 0x13, 0x0C, 0x11, 0x00, 0x3A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x2C, 0x01, 0x01
	.byte 0x7B, 0x00, 0x14, 0x08, 0x11, 0x00, 0x3A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0D, 0x28, 0x01, 0x01
	.byte 0x6E, 0x00, 0x0F, 0x09, 0x11, 0x00, 0x27, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x28, 0x01, 0x01
	.byte 0x63, 0x00, 0x0E, 0x0F, 0x11, 0x00, 0x2E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x2C, 0x01, 0x01
	.byte 0x72, 0x00, 0x0D, 0x10, 0x11, 0x00, 0x2F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x28, 0x01, 0x01
	.byte 0x75, 0x00, 0x0B, 0x10, 0x11, 0x00, 0x34, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x2D, 0x01, 0x01
	.byte 0x60, 0x00, 0x0A, 0x08, 0x22, 0x44, 0x2B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x25, 0x02, 0x02
	.byte 0x6F, 0x00, 0x0C, 0x06, 0x11, 0x00, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x28, 0x01, 0x01
	.byte 0x07, 0x00, 0x0B, 0x06, 0x11, 0x00, 0x2A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x28, 0x01, 0x01
	.byte 0x77, 0x00, 0x0E, 0x07, 0x11, 0x00, 0x36, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x28, 0x01, 0x01
	.byte 0x79, 0x00, 0x07, 0x0D, 0x11, 0x00, 0x38, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x2E, 0x01, 0x01
	.byte 0x7E, 0x00, 0x17, 0x0E, 0x11, 0x00, 0x3D, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x28, 0x01, 0x01
	.byte 0x7C, 0x00, 0x1C, 0x09, 0x21, 0x40, 0x3B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x25, 0x01, 0x02
	.byte 0x93, 0x00, 0x20, 0x07, 0x11, 0x00, 0x3E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0F, 0x29, 0x01, 0x01
	.byte 0x6A, 0x00, 0x20, 0x06, 0x11, 0x00, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0F, 0x28, 0x01, 0x01
	.byte 0x6A, 0x00, 0x2A, 0x0B, 0x11, 0x00, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1C, 0x2B, 0x01, 0x01
	.byte 0x6B, 0x00, 0x24, 0x05, 0x11, 0x00, 0x22, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x28, 0x01, 0x01
	.byte 0x91, 0x00, 0x28, 0x05, 0x11, 0x00, 0x23, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x28, 0x01, 0x01
	.byte 0x6C, 0x00, 0x2C, 0x06, 0x11, 0x00, 0x24, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1F, 0x29, 0x01, 0x01
	.byte 0xE9, 0x01, 0x2C, 0x07, 0x11, 0x00, 0x43, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1F, 0x2A, 0x01, 0x01
	.byte 0x92, 0x00, 0x23, 0x11, 0x11, 0x00, 0x26, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x28, 0x01, 0x01
	.byte 0x10, 0x01, 0x06, 0x08, 0x22, 0x44, 0x32, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x25, 0x02, 0x02
	.byte 0xDF, 0x01, 0x25, 0x0E, 0x11, 0x00, 0x25, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x28, 0x01, 0x01
	.byte 0xDC, 0x00, 0x09, 0x0A, 0x11, 0x00, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x28, 0x01, 0x01
	.byte 0x31, 0x00, 0x20, 0x0D, 0x11, 0x00, 0x0A, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x03, 0x03
	.byte 0x32, 0x00, 0x1F, 0x09, 0x22, 0x44, 0x0B, 0x02, 0x00, 0x00, 0x00, 0x00, 0x23, 0x20, 0x04, 0x04
	.byte 0x33, 0x00, 0x20, 0x04, 0x22, 0x44, 0x0C, 0x03, 0x00, 0x00, 0x00, 0x00, 0x23, 0x20, 0x04, 0x04
	.byte 0x34, 0x00, 0x28, 0x05, 0x22, 0x84, 0x0D, 0x04, 0x00, 0x00, 0x00, 0x00, 0x12, 0x20, 0x04, 0x04
	.byte 0x35, 0x00, 0x2C, 0x09, 0x11, 0x00, 0x0E, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x03, 0x03
	.byte 0x36, 0x00, 0x28, 0x0B, 0x22, 0x44, 0x0F, 0x06, 0x00, 0x00, 0x00, 0x00, 0x23, 0x20, 0x04, 0x04
	.byte 0x37, 0x00, 0x25, 0x09, 0x22, 0x44, 0x10, 0x07, 0x00, 0x00, 0x00, 0x00, 0x23, 0x20, 0x04, 0x04
	.byte 0x38, 0x00, 0x25, 0x0E, 0x22, 0x84, 0x11, 0x08, 0x00, 0x00, 0x00, 0x00, 0x12, 0x20, 0x04, 0x04
	.byte 0x39, 0x00, 0x20, 0x11, 0x11, 0x00, 0x12, 0x09, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x03, 0x03
	.byte 0x3B, 0x00, 0x28, 0x08, 0x22, 0x44, 0x14, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x23, 0x20, 0x04, 0x04
	.byte 0x3C, 0x00, 0x15, 0x0E, 0x11, 0x00, 0x15, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x03, 0x03
	.byte 0x43, 0x00, 0x10, 0x0E, 0x12, 0x04, 0x16, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x1A, 0x20, 0x04, 0x03
	.byte 0x49, 0x00, 0x0E, 0x09, 0x22, 0x84, 0x17, 0x0D, 0x00, 0x00, 0x00, 0x00, 0x0E, 0x20, 0x04, 0x04
	.byte 0x4A, 0x00, 0x0C, 0x10, 0x11, 0x00, 0x18, 0x0E, 0x00, 0x00, 0x00, 0x00, 0x16, 0x20, 0x04, 0x03
	.byte 0x4B, 0x00, 0x05, 0x0C, 0x21, 0x40, 0x19, 0x0F, 0x00, 0x00, 0x00, 0x00, 0x03, 0x20, 0x03, 0x04
	.byte 0x4C, 0x00, 0x09, 0x0C, 0x23, 0x48, 0x1A, 0x10, 0x00, 0x00, 0x00, 0x00, 0x1E, 0x20, 0x05, 0x04
	.byte 0x4D, 0x00, 0x08, 0x09, 0x22, 0x04, 0x1B, 0x11, 0x00, 0x00, 0x00, 0x00, 0x06, 0x20, 0x04, 0x04
	.byte 0x4E, 0x00, 0x0B, 0x06, 0x22, 0x84, 0x1C, 0x12, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x20, 0x04, 0x04
	.byte 0x57, 0x00, 0x10, 0x07, 0x11, 0x00, 0x1D, 0x13, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x03, 0x03
	.byte 0x59, 0x00, 0x14, 0x06, 0x22, 0x84, 0x1F, 0x14, 0x00, 0x00, 0x00, 0x00, 0x0E, 0x20, 0x04, 0x04
	.byte 0x3A, 0x00, 0x1C, 0x08, 0x11, 0x00, 0x13, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x28, 0x01, 0x01
	.byte 0x58, 0x00, 0x0F, 0x03, 0x23, 0x48, 0x1E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1E, 0x20, 0x05, 0x04
	.byte 0x5A, 0x00, 0x19, 0x0A, 0x11, 0x00, 0x39, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x28, 0x01, 0x01
	.byte 0x08, 0x00, 0x0D, 0x0A, 0x21, 0x40, 0x2D, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x20, 0x03, 0x04
	.byte 0xAE, 0x00, 0x02, 0x0A, 0x22, 0x44, 0x44, 0x00, 0x00, 0x00, 0x00, 0x00, 0x09, 0x25, 0x02, 0x02
	.byte 0x09, 0x00, 0x20, 0x0B, 0x21, 0x40, 0x46, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0F, 0x2E, 0x01, 0x02
	.byte 0x0A, 0x00, 0x20, 0x08, 0x11, 0x00, 0x47, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0F, 0x2A, 0x01, 0x01
	.byte 0x0B, 0x00, 0x22, 0x05, 0x12, 0x04, 0x48, 0x00, 0x00, 0x00, 0x00, 0x00, 0x19, 0x28, 0x02, 0x01
	.byte 0x0C, 0x00, 0x25, 0x05, 0x13, 0x04, 0x49, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1C, 0x28, 0x03, 0x01
	.byte 0x0D, 0x00, 0x28, 0x07, 0x11, 0x00, 0x4A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x19, 0x2C, 0x01, 0x01
	.byte 0x0E, 0x00, 0x28, 0x0A, 0x11, 0x00, 0x4B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1A, 0x2C, 0x01, 0x01
	.byte 0x0F, 0x00, 0x27, 0x09, 0x11, 0x00, 0x4C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x18, 0x2C, 0x01, 0x01
	.byte 0x10, 0x00, 0x2A, 0x09, 0x12, 0x04, 0x4D, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1B, 0x2C, 0x02, 0x01
	.byte 0x11, 0x00, 0x2A, 0x06, 0x12, 0x04, 0x4E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1D, 0x29, 0x02, 0x01
	.byte 0x12, 0x00, 0x2C, 0x08, 0x11, 0x00, 0x4F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1F, 0x2B, 0x01, 0x01
	.byte 0x13, 0x00, 0x2B, 0x0B, 0x11, 0x00, 0x50, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1D, 0x2B, 0x01, 0x01
	.byte 0x14, 0x00, 0x2C, 0x0A, 0x31, 0x40, 0x51, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1E, 0x2A, 0x01, 0x03
	.byte 0x15, 0x00, 0x2A, 0x0D, 0x13, 0x04, 0x52, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1C, 0x2D, 0x03, 0x01
	.byte 0x16, 0x00, 0x2A, 0x0E, 0x21, 0x40, 0x53, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1C, 0x2E, 0x01, 0x02
	.byte 0x17, 0x00, 0x27, 0x0F, 0x13, 0x0C, 0x54, 0x00, 0x00, 0x00, 0x00, 0x00, 0x19, 0x2F, 0x03, 0x01
	.byte 0x18, 0x00, 0x23, 0x0A, 0x12, 0x04, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00, 0x17, 0x28, 0x02, 0x01
	.byte 0x19, 0x00, 0x23, 0x0B, 0x41, 0xC0, 0x56, 0x00, 0x00, 0x00, 0x00, 0x00, 0x17, 0x29, 0x01, 0x04
	.byte 0x1A, 0x00, 0x23, 0x0F, 0x12, 0x04, 0x57, 0x00, 0x00, 0x00, 0x00, 0x00, 0x17, 0x2D, 0x02, 0x01
	.byte 0x5B, 0x00, 0x25, 0x10, 0x21, 0x40, 0x58, 0x00, 0x00, 0x00, 0x00, 0x00, 0x16, 0x2D, 0x01, 0x02
	.byte 0x5C, 0x00, 0x21, 0x11, 0x14, 0x08, 0x59, 0x00, 0x00, 0x00, 0x00, 0x00, 0x12, 0x2E, 0x04, 0x01
	.byte 0x5D, 0x00, 0x20, 0x0E, 0x31, 0xC0, 0x5A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x11, 0x2D, 0x01, 0x03
	.byte 0x1B, 0x00, 0x1D, 0x0A, 0x12, 0x04, 0x5B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x15, 0x28, 0x02, 0x01
	.byte 0x1C, 0x00, 0x29, 0x04, 0x11, 0x00, 0x5D, 0x00, 0x00, 0x00, 0x00, 0x00, 0x18, 0x2A, 0x01, 0x01
	.byte 0x1D, 0x00, 0x29, 0x03, 0x14, 0x0C, 0x5E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x18, 0x29, 0x04, 0x01
	.byte 0x1E, 0x00, 0x1C, 0x0B, 0x41, 0xC0, 0x5F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x14, 0x29, 0x01, 0x04
	.byte 0x1F, 0x00, 0x16, 0x0E, 0x16, 0x0F, 0x60, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0E, 0x2C, 0x06, 0x01
	.byte 0x20, 0x00, 0x1A, 0x0A, 0x12, 0x04, 0x61, 0x00, 0x00, 0x00, 0x00, 0x00, 0x12, 0x28, 0x02, 0x01
	.byte 0x21, 0x00, 0x12, 0x0E, 0x13, 0x0C, 0x62, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0B, 0x2E, 0x03, 0x01
	.byte 0x22, 0x00, 0x11, 0x0B, 0x31, 0x40, 0x63, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x29, 0x01, 0x03
	.byte 0x23, 0x00, 0x10, 0x0A, 0x12, 0x01, 0x64, 0x00, 0x00, 0x00, 0x00, 0x00, 0x09, 0x28, 0x01, 0x01
	.byte 0x24, 0x00, 0x0E, 0x0B, 0x41, 0xC0, 0x65, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x28, 0x01, 0x04
	.byte 0x25, 0x00, 0x0E, 0x10, 0x11, 0x00, 0x66, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x2D, 0x01, 0x01
	.byte 0x26, 0x00, 0x0B, 0x0E, 0x31, 0x40, 0x67, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x2B, 0x01, 0x02
	.byte 0x27, 0x00, 0x0B, 0x0A, 0x21, 0x40, 0x68, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x2D, 0x01, 0x02
	.byte 0x28, 0x00, 0x0B, 0x09, 0x13, 0x04, 0x69, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x2C, 0x03, 0x01
	.byte 0x29, 0x00, 0x0C, 0x08, 0x11, 0x00, 0x6A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x2B, 0x01, 0x01
	.byte 0x2A, 0x00, 0x09, 0x07, 0x12, 0x04, 0x6B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x28, 0x02, 0x01
	.byte 0x2B, 0x00, 0x08, 0x07, 0x21, 0x40, 0x6C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x28, 0x01, 0x02
	.byte 0x5E, 0x00, 0x07, 0x0A, 0x21, 0x40, 0x6D, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x2A, 0x01, 0x02
	.byte 0x5F, 0x00, 0x06, 0x0C, 0x22, 0x04, 0x6E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x2C, 0x02, 0x02
	.byte 0x2C, 0x00, 0x0D, 0x07, 0x13, 0x02, 0x6F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x2A, 0x03, 0x01
	.byte 0x2D, 0x00, 0x10, 0x05, 0x21, 0x40, 0x70, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x28, 0x01, 0x02
	.byte 0x2E, 0x00, 0x11, 0x07, 0x13, 0x08, 0x71, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x2A, 0x03, 0x01
	.byte 0x2F, 0x00, 0x14, 0x09, 0x41, 0x80, 0x72, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0D, 0x29, 0x01, 0x04
	.byte 0x30, 0x00, 0x13, 0x0D, 0x21, 0x00, 0x73, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x2D, 0x01, 0x01
	.byte 0x97, 0x00, 0x02, 0x0D, 0x23, 0x48, 0x74, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x29, 0x03, 0x02
	.byte 0x98, 0x00, 0x02, 0x0C, 0x12, 0x04, 0x75, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x28, 0x02, 0x01

	.balign 4, 0
ov101_021F79B4: ; 0x021F79B4
	.short MAP_PALLET, MAP_PALLET
	.byte FLYPOINT_PALLET, 0x00, 0x20, 0x0B, 0x00, 0x14, 0x11, 0x33, 0x11, 0x00

	.short MAP_VIRIDIAN, MAP_VIRIDIAN
	.byte FLYPOINT_VIRIDIAN, 0x01, 0x1F, 0x07, 0x05, 0x14, 0x22, 0x44, 0x11, 0x00

	.short MAP_PEWTER, MAP_PEWTER
	.byte FLYPOINT_PEWTER, 0x02, 0x20, 0x02, 0x0A, 0x14, 0x22, 0x44, 0x11, 0x00

	.short MAP_CERULEAN, MAP_CERULEAN
	.byte FLYPOINT_CERULEAN, 0x03, 0x28, 0x03, 0x0F, 0x14, 0x22, 0x44, 0x11, 0x00

	.short MAP_LAVENDER, MAP_LAVENDER
	.byte FLYPOINT_LAVENDER, 0x04, 0x2C, 0x07, 0x14, 0x14, 0x11, 0x33, 0x11, 0x00

	.short MAP_VERMILION, MAP_VERMILION
	.byte FLYPOINT_VERMILION, 0x05, 0x28, 0x09, 0x19, 0x14, 0x22, 0x44, 0x11, 0x00

	.short MAP_CELADON, MAP_CELADON
	.byte FLYPOINT_CELADON, 0x06, 0x25, 0x07, 0x1E, 0x14, 0x22, 0x44, 0x11, 0x00

	.short MAP_FUCHSIA, MAP_FUCHSIA
	.byte FLYPOINT_FUCHSIA, 0x07, 0x25, 0x0C, 0x23, 0x14, 0x22, 0x44, 0x11, 0x00

	.short MAP_CINNABAR_ISLAND, MAP_CINNABAR_ISLAND
	.byte FLYPOINT_CINNABAR, 0x08, 0x20, 0x0F, 0x00, 0x18, 0x11, 0x33, 0x11, 0x00

	.short MAP_INDIGO_PLATEAU, MAP_INDIGO_PLATEAU
	.byte FLYPOINT_INDIGO, 0xFF, 0x1C, 0x06, 0x00, 0x00, 0x11, 0x00, 0x00, 0x00

	.short MAP_SAFFRON, MAP_SAFFRON
	.byte FLYPOINT_SAFFRON, 0x09, 0x28, 0x06, 0x05, 0x18, 0x22, 0x44, 0x11, 0x00

	.short MAP_NEW_BARK, MAP_NEW_BARK
	.byte FLYPOINT_NEW_BARK, 0x0A, 0x15, 0x0C, 0x0B, 0x19, 0x11, 0x11, 0x00, 0x00

	.short MAP_CHERRYGROVE, MAP_CHERRYGROVE
	.byte FLYPOINT_CHERRYGROVE, 0x0B, 0x10, 0x0C, 0x0F, 0x18, 0x12, 0x34, 0x11, 0x00

	.short MAP_VIOLET, MAP_VIOLET
	.byte FLYPOINT_VIOLET, 0x0C, 0x0E, 0x07, 0x14, 0x18, 0x22, 0x43, 0x10, 0x00

	.short MAP_AZALEA, MAP_AZALEA
	.byte FLYPOINT_AZALEA, 0x0D, 0x0C, 0x0E, 0x19, 0x18, 0x12, 0x34, 0x11, 0x00

	.short MAP_CIANWOOD, MAP_CIANWOOD
	.byte FLYPOINT_GOLDENROD, 0x0E, 0x05, 0x0A, 0x1E, 0x18, 0x21, 0x43, 0x11, 0x00

	.short MAP_GOLDENROD, MAP_GOLDENROD
	.byte FLYPOINT_ECRUTEAK, 0x0F, 0x09, 0x0A, 0x23, 0x18, 0x23, 0x45, 0x11, 0x00

	.short MAP_OLIVINE, MAP_OLIVINE
	.byte FLYPOINT_OLIVINE, 0x10, 0x08, 0x07, 0x00, 0x1C, 0x22, 0x44, 0x11, 0x00

	.short MAP_ECRUTEAK, MAP_ECRUTEAK
	.byte FLYPOINT_CIANWOOD, 0x11, 0x0B, 0x04, 0x05, 0x1C, 0x22, 0x44, 0x11, 0x00

	.short MAP_MAHOGANY, MAP_MAHOGANY
	.byte FLYPOINT_MAHOGANY, 0x12, 0x10, 0x05, 0x0A, 0x1C, 0x11, 0x33, 0x11, 0x00

	.short MAP_BLACKTHORN, MAP_BLACKTHORN
	.byte FLYPOINT_BLACKTHORN, 0x13, 0x14, 0x04, 0x0F, 0x1C, 0x22, 0x44, 0x11, 0x00

	.short MAP_LAKE_OF_RAGE, MAP_LAKE_OF_RAGE
	.byte FLYPOINT_LAKE_OF_RAGE, 0xFF, 0x0F, 0x01, 0x00, 0x00, 0x23, 0x00, 0x00, 0x00

	.short MAP_MOUNT_SILVER, MAP_MOUNT_SILVER
	.byte FLYPOINT_MT_SILVER, 0xFF, 0x19, 0x08, 0x00, 0x00, 0x11, 0x00, 0x00, 0x00

	.short MAP_SAFARI_ZONE_GATE, MAP_SAFARI_ZONE_GATE
	.byte FLYPOINT_SAFARI, 0xFF, 0x02, 0x08, 0x00, 0x00, 0x22, 0x00, 0x00, 0x00

	.short MAP_BATTLE_FRONTIER, MAP_BATTLE_FRONTIER_FRONTIER_ACCESS
	.byte FLYPOINT_UNION_CAVE, 0xFF, 0x06, 0x06, 0x00, 0x00, 0x22, 0x00, 0x00, 0x00

	.short MAP_NATIONAL_PARK, MAP_POKEATHLON_DOME
	.byte FLYPOINT_POKEATHLON, 0xFF, 0x0A, 0x06, 0x00, 0x00, 0x22, 0x00, 0x00, 0x00

	.short MAP_VICTORY_ROAD_1F, MAP_ROUTE_26
	.byte FLYPOINT_VICTORY_ROAD, 0xFF, 0x1C, 0x07, 0x00, 0x00, 0x21, 0x00, 0x00, 0x00

	.balign 4, 0
ov101_021F7B30: ; 0x021F7B30
	.short 0x0000
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x48, 0x54, 0xEE, 0x12, 0xF4, 0x06

ov101_021F7B3C: ; 0x021F7B3C
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x01, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov101_021F7B64: ; 0x021F7B64
	.byte 0x05, 0x01, 0x08, 0x05, 0x03, 0x01, 0xF0, 0x03, 0x05, 0x03, 0x0C, 0x0C
	.byte 0x02, 0x01, 0xD8, 0x03, 0x05, 0x01, 0x0E, 0x1C, 0x04, 0x01, 0x68, 0x03, 0x05, 0x05, 0x12, 0x0B
	.byte 0x05, 0x01, 0x31, 0x03, 0x05, 0x12, 0x12, 0x0B, 0x05, 0x01, 0xFA, 0x02, 0x05, 0x05, 0x14, 0x0B
	.byte 0x02, 0x01, 0xE4, 0x02, 0x05, 0x12, 0x16, 0x0B, 0x02, 0x01, 0xCE, 0x02, 0x01, 0x03, 0x00, 0x0C
	.byte 0x03, 0x0A, 0xDB, 0x03

ov101_021F7BA4: ; 0x021F7BA4
	.byte 0x00, 0x00, 0x07, 0x01, 0xFF, 0xFF, 0x28, 0x84, 0xF8, 0x08, 0xF8, 0x08
	.byte 0x01, 0x00, 0x00, 0x02, 0xFF, 0xFF, 0x40, 0x84, 0xF8, 0x08, 0xF8, 0x08, 0x02, 0x00, 0x01, 0x03
	.byte 0xFF, 0xFF, 0x58, 0x84, 0xF8, 0x08, 0xF8, 0x08, 0x03, 0x00, 0x02, 0x04, 0xFF, 0xFF, 0x70, 0x84
	.byte 0xF8, 0x08, 0xF8, 0x08, 0x04, 0x00, 0x03, 0x05, 0xFF, 0xFF, 0x88, 0x84, 0xF8, 0x08, 0xF8, 0x08
	.byte 0x05, 0x00, 0x04, 0x06, 0xFF, 0xFF, 0xA0, 0x84, 0xF8, 0x08, 0xF8, 0x08, 0x06, 0x00, 0x05, 0x07
	.byte 0xFF, 0xFF, 0xB8, 0x84, 0xF8, 0x08, 0xF8, 0x08, 0x07, 0x00, 0x06, 0x00, 0xFF, 0xFF, 0xD0, 0x84
	.byte 0xF8, 0x08, 0xF8, 0x08

ov101_021F7C04: ; 0x021F7C04
	.byte 0x00, 0x00, 0x03, 0x01, 0x04, 0x04, 0x20, 0x20, 0xFA, 0x06, 0xFA, 0x06
	.byte 0x01, 0x00, 0x00, 0x02, 0x05, 0x05, 0x28, 0x1F, 0x06, 0x50, 0xFA, 0x06, 0x02, 0x00, 0x01, 0x03
	.byte 0x06, 0x06, 0x88, 0x20, 0xFA, 0x06, 0xFA, 0x06, 0x03, 0x00, 0x02, 0x00, 0x08, 0x07, 0x90, 0x1F
	.byte 0x06, 0x50, 0xFA, 0x06, 0x04, 0x00, 0x07, 0x05, 0x00, 0x00, 0x20, 0x35, 0xFA, 0x06, 0xFA, 0x06
	.byte 0x05, 0x00, 0x04, 0x06, 0x01, 0x01, 0x28, 0x34, 0x06, 0x50, 0xFA, 0x06, 0x06, 0x00, 0x05, 0x07
	.byte 0x02, 0x02, 0x88, 0x35, 0xFA, 0x06, 0xFA, 0x06, 0x07, 0x00, 0x06, 0x04, 0x03, 0x08, 0x90, 0x34
	.byte 0x06, 0x50, 0xFA, 0x06, 0x08, 0x00, 0xFF, 0xFF, 0x07, 0x03, 0xD0, 0x54, 0xF0, 0x10, 0xF7, 0x03

ov101_021F7C70: ; 0x021F7C70
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov101_021F7C98: ; 0x021F7C98
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov101_021F7CC0: ; 0x021F7CC0
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov101_021F7CE8: ; 0x021F7CE8
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov101_021F7D10: ; 0x021F7D10
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1E, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x01, 0x1A, 0x04
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x01, 0x16, 0x04, 0x00, 0x03, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1D, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1C, 0x04
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov101_021F7DB8: ; 0x021F7DB8
	.byte 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x60, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov101_021F7DE0: ; 0x021F7DE0
	.byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x98, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov101_021F7E08: ; 0x021F7E08
	.byte 0x01, 0x00, 0x00, 0x00, 0x20, 0x00, 0x80, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov101_021F7E30: ; 0x021F7E30
	.byte 0x01, 0x00, 0x00, 0x00, 0x20, 0x00, 0x60, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov101_021F7E58: ; 0x021F7E58
	.byte 0x01, 0x00, 0x00, 0x00, 0x20, 0x00, 0x60, 0x00
	.byte 0x00, 0x00, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov101_021F7E80: ; 0x021F7E80
	.byte 0x03, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x1C, 0x00, 0x01, 0x00, 0x40, 0x00

ov101_021F7E8C: ; 0x021F7E8C
	.byte 0x16, 0x0A

ov101_021F7E8E: ; 0x021F7E8E
	.byte 0x10, 0x07
	.byte 0xFF, 0x00, 0x00, 0x00

ov101_021F7E94: ; 0x021F7E94
	.byte 0x98, 0xB8, 0xC2, 0xFE, 0xFF, 0x00, 0x00, 0x00

ov101_021F7E9C: ; 0x021F7E9C
	.byte 0x01, 0x10, 0x01, 0x16
	.byte 0x01, 0x07, 0x01, 0x0A

ov101_021F7EA4: ; 0x021F7EA4
	.byte 0x08, 0x98, 0x08, 0xC8

ov101_021F7EA8: ; 0x021F7EA8
	.byte 0x10, 0x90, 0x28, 0xE0

ov101_021F7EAC: ; 0x021F7EAC
	.byte 0x10, 0x40, 0xD8, 0xF8
	.byte 0x58, 0x98, 0xD8, 0xF8, 0xFF, 0x00, 0x00, 0x00

ov101_021F7EB8: ; 0x021F7EB8
	.byte 0x18, 0x2C, 0x18, 0x28, 0x18, 0x2C, 0x80, 0x90
	.byte 0x2C, 0x40, 0x18, 0x28, 0x2C, 0x40, 0x80, 0x90, 0xFF, 0x00, 0x00, 0x00

ov101_021F7ECC: ; 0x021F7ECC
	.byte 0x18, 0x2C, 0x18, 0x28
	.byte 0x18, 0x2C, 0x80, 0x90, 0x2C, 0x40, 0x18, 0x28, 0x2C, 0x40, 0x80, 0x90, 0x18, 0x2C, 0x28, 0x80
	.byte 0x18, 0x2C, 0x90, 0xE8, 0x2C, 0x40, 0x28, 0x80, 0x2C, 0x40, 0x90, 0xE8

ov101_021F7EEC: ; 0x021F7EEC
	.byte 0x44, 0x60, 0x2C, 0x64
	.byte 0xFF, 0x00, 0x00, 0x00

ov101_021F7EF4: ; 0x021F7EF4
	.byte 0x18, 0x2C, 0x18, 0x28, 0x18, 0x2C, 0x28, 0x80, 0x18, 0x2C, 0x80, 0x90
	.byte 0x18, 0x2C, 0x90, 0xE8, 0x2C, 0x40, 0x18, 0x28, 0x2C, 0x40, 0x28, 0x80, 0x2C, 0x40, 0x80, 0x90
	.byte 0x2C, 0x40, 0x90, 0xE8, 0x7C, 0x8C, 0x20, 0x30, 0x7C, 0x8C, 0x38, 0x48, 0x7C, 0x8C, 0x50, 0x60
	.byte 0x7C, 0x8C, 0x68, 0x78, 0x7C, 0x8C, 0x80, 0x90, 0x7C, 0x8C, 0x98, 0xA8, 0x7C, 0x8C, 0xB0, 0xC0
	.byte 0x7C, 0x8C, 0xC8, 0xD8, 0x40, 0x68, 0xC0, 0xE8, 0xFF, 0x00, 0x00, 0x00

ov101_021F7F3C: ; 0x021F7F3C
	.byte 0x1A, 0x00, 0x1D, 0x00
	.byte 0x2D, 0x00, 0x00, 0x00

ov101_021F7F44: ; 0x021F7F44
	.byte 0x01, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov101_021F7F54: ; 0x021F7F54
	.byte 0x05, 0x01, 0x08, 0x05, 0x03, 0x01, 0xF0, 0x03, 0x05, 0x03, 0x0B, 0x0C
	.byte 0x02, 0x01, 0xD8, 0x03, 0x05, 0x01, 0x0E, 0x1C, 0x04, 0x01, 0x68, 0x03, 0x05, 0x05, 0x12, 0x0B
	.byte 0x05, 0x01, 0x31, 0x03, 0x05, 0x12, 0x12, 0x0B, 0x05, 0x01, 0xFA, 0x02, 0x05, 0x05, 0x14, 0x0B
	.byte 0x02, 0x01, 0xE4, 0x02, 0x05, 0x12, 0x16, 0x0B, 0x02, 0x01, 0xCE, 0x02, 0x00, 0x00, 0x15, 0x19
	.byte 0x02, 0x0A, 0x5C, 0x00, 0x00, 0x19, 0x15, 0x06, 0x02, 0x0A, 0x8E, 0x00

ov101_021F7F9C: ; 0x021F7F9C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x02
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x00, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x04, 0x01, 0x1A, 0x04, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x01, 0x16, 0x04, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x02
	.byte 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1C, 0x04, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov101_021F807C: ; 0x021F807C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x20, 0x00, 0x60, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov101_021F80A4: ; 0x021F80A4
	.byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x90, 0x00, 0x00, 0x00, 0x01, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov101_021F80CC: ; 0x021F80CC
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0x20, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov101_021F80F4: ; 0x021F80F4
	.byte 0x01, 0x00, 0x00, 0x00, 0x20, 0x00, 0x60, 0x00, 0x00, 0x00, 0x01, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov101_021F811C: ; 0x021F811C
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0x20, 0x00, 0x60, 0x00, 0x00, 0x00, 0x02, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov101_021F81E4: ; 0x021F81E4
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x09, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
