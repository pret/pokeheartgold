#include "constants/species.h"
#include "constants/sndseq.h"
#include "constants/items.h"
#include "constants/phone_contacts.h"
#include "constants/flags.h"
#include "msgdata/msg/msg_0416.h"
#include "msgdata/msg/msg_0411.h"
#include "msgdata/msg/msg_0664.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov101_021E7740
ov101_021E7740: ; 0x021E7740
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl OverlayManager_GetParentWork
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
	thumb_func_end ov101_021E7740

	thumb_func_start ov101_021E779C
ov101_021E779C: ; 0x021E779C
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
	thumb_func_end ov101_021E779C

	thumb_func_start ov101_021E7834
ov101_021E7834: ; 0x021E7834
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
	thumb_func_end ov101_021E7834

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
	bl sub_0202EE70
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
	bl SaveData_GetMomsSavingsAddr
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
	bl GSPlayerMisc_AllocAndCopyPhonebook
	mov r1, #0x4b
	lsl r1, r1, #2
	str r0, [r5, r1]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x28]
	bl GSPlayerMisc_FindEmptyGearPhonebookSlot
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
	bl ScriptState_FlypointFlagAction
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
	bl Save_Roamers_get
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
	bl ov100_021E5900
	ldr r0, [r4, #0x10]
	ldrb r1, [r0, #6]
	cmp r1, #1
	bne _021E7BDE
	bl ov100_021E59CC
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
	bl ov100_021E5900
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
	bl sub_02003B50
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r0, [r5, #0x10]
	add r2, r1, #0
	ldr r0, [r0, #0x78]
	mov r3, #0xe0
	bl sub_02003E5C
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [r5, #0x10]
	mov r1, #2
	ldr r0, [r0, #0x78]
	mov r2, #0x40
	mov r3, #0xc0
	bl sub_02003E5C
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x78]
	bl sub_0200398C
	ldr r0, [r5, #0x10]
	mov r1, #0
	ldr r0, [r0, #0x78]
	bl sub_02003B50
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
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
	bl GX_EngineAToggleLayers
	mov r0, #0x10
	mov r1, #0
	bl GX_EngineBToggleLayers
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
	bl sub_02003B50
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
	bl sub_02003B50
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
	bl sub_02003B50
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
	bl sub_02003E5C
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, [r5, #0x10]
	mov r1, #2
	ldr r0, [r0, #0x78]
	mov r2, #0x40
	mov r3, #0xc0
	bl sub_02003E5C
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x78]
	bl sub_0200398C
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
	bl sub_02003B50
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
	bl ov100_021E5CA4
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
	bl NARC_ctor
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
	bl NARC_dtor
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
	bl ScrStrBufs_new_custom
	add r1, r4, #0
	add r1, #0x8c
	str r0, [r1]
	ldr r1, [r4]
	mov r0, #0x5b
	bl String_ctor
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
	bl String_ctor
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
	bl String_dtor
	add r0, r4, #0
	add r0, #0xa4
	ldr r0, [r0]
	bl String_dtor
	add r0, r4, #0
	add r0, #0xa0
	ldr r0, [r0]
	bl String_dtor
	add r0, r4, #0
	add r0, #0x9c
	ldr r0, [r0]
	bl String_dtor
	add r0, r4, #0
	add r0, #0x90
	ldr r0, [r0]
	bl String_dtor
	add r0, r4, #0
	add r0, #0x8c
	ldr r0, [r0]
	bl ScrStrBufs_delete
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
	bl ov100_021E7014
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
	bl ov100_021E7014
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
	bl ov100_021E7014
	ldr r0, [r5, #0x10]
	mov r1, #1
	ldr r0, [r0, #0x7c]
	mov r2, #0
	bl ov100_021E7128
	ldr r0, [r5, #0x10]
	mov r1, #2
	ldr r0, [r0, #0x7c]
	mov r2, #0
	bl ov100_021E7128
	ldr r0, [r5, #0x10]
	mov r1, #3
	ldr r0, [r0, #0x7c]
	mov r2, #0
	bl ov100_021E7128
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
	bl ov100_021E72F8
	add sp, #0x18
	pop {r3, r4, r5, pc}
_021E8758:
	ldr r0, [r0, #0x7c]
	mov r1, #1
	mov r2, #0
	bl ov100_021E72F8
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
	bl ov100_021E70A4
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
	bl NARC_ctor
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
	bl sub_02003220
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
	bl sub_02003220
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
	bl sub_02003220
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
	bl sub_02003220
	ldr r0, [r5, #0x10]
	mov r1, #1
	ldr r0, [r0, #0x78]
	bl sub_02003B50
	mov r0, #0x10
	mov r1, #0
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r5, #0x10]
	add r2, r1, #0
	ldr r0, [r0, #0x78]
	mov r3, #0xe0
	bl sub_02003E5C
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, [r5, #0x10]
	mov r1, #2
	ldr r0, [r0, #0x78]
	mov r2, #0x40
	mov r3, #0xc0
	bl sub_02003E5C
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x78]
	bl sub_0200398C
	ldr r0, [r5, #0x10]
	mov r1, #0
	ldr r0, [r0, #0x78]
	bl sub_02003B50
	add r0, r4, #0
	bl NARC_dtor
	add sp, #0x10
	pop {r4, r5, r6, pc}
	thumb_func_end ov101_021E8790

	thumb_func_start ov101_021E886C
ov101_021E886C: ; 0x021E886C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x10]
	mov r1, #2
	bl ov100_021E6978
	ldr r1, [r4]
	mov r0, #0x6f
	bl ov100_021E6E20
	add r1, r4, #0
	add r1, #0x84
	str r0, [r1]
	ldr r0, [r4, #0x10]
	add r0, #0x8c
	ldr r0, [r0]
	bl sub_0200CF6C
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
	bl sub_0200CF6C
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
	bl ov100_021E69C8
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
	bl sub_0200D2B4
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
	bl sub_0200DD88
	ldr r0, [r4, #0x20]
	mov r1, #0
	bl sub_0200DD3C
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
	bl sub_0200D2B4
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x84
	ldr r0, [r0]
	bl ov100_021E6EC4
	ldr r0, [sp]
	mov r1, #0
	add r0, #0xc0
	ldr r0, [r0]
	bl sub_0200DD3C
	ldr r1, [r5, #0x10]
	ldr r2, _021E8A7C ; =ov101_021F7E08
	add r0, r1, #0
	add r0, #0x8c
	add r1, #0x90
	ldr r0, [r0]
	ldr r1, [r1]
	bl sub_0200D2B4
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
	bl sub_0200D2B4
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
	bl sub_0200D2B4
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
	bl sub_020249B0
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
	bl sub_0200DE00
	ldr r0, [r6, #0x20]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add r4, r4, #1
	cmp r4, #0xb
	blt _021E8A12
	ldr r0, [sp]
	mov r1, #1
	add r0, #0xe8
	ldr r0, [r0]
	bl Set2dSpriteAnimActiveFlag
	mov r1, #0x11
	ldr r0, [sp]
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	mov r1, #0
	bl Set2dSpriteAnimActiveFlag
	mov r1, #0x11
	ldr r0, [sp]
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	ldr r1, [r5, #0x10]
	ldr r1, [r1, #0x20]
	ldrb r1, [r1, #7]
	bl sub_020249D4
	ldr r0, [sp]
	mov r1, #2
	add r0, #0xe8
	str r0, [sp]
	ldr r0, [r0]
	bl sub_0202487C
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
	bl sub_0200D2B4
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
	bl sub_0200DE00
	ldr r0, [r4, #0x20]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	ldr r0, [r4, #0x20]
	mov r1, #0
	bl Set2dSpriteAnimActiveFlag
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
	bl AddTextPrinterParameterized2
	ldr r0, [r5, #0x3c]
	str r0, [sp, #0x18]
	mov r0, #0x81
	lsl r0, r0, #2
	add r0, r5, r0
	str r0, [sp, #0x1c]
	ldr r0, [r5, #0x10]
	add r0, #0x90
	ldr r0, [r0]
	bl sub_0200E2B0
	str r0, [sp, #0x20]
	ldr r0, [r5, #0x10]
	mov r1, #0
	add r0, #0x90
	ldr r0, [r0]
	bl sub_0200D934
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
	bl sub_0200D2B4
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
	bl Set2dSpriteVisibleFlag
	mov r6, #0
_021E8C2A:
	ldr r1, [r5, #0x10]
	ldr r2, _021E8E04 ; =ov101_021F7C98
	add r0, r1, #0
	add r0, #0x8c
	add r1, #0x90
	ldr r0, [r0]
	ldr r1, [r1]
	bl sub_0200D2B4
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
	bl Set2dSpriteAnimSeqNo
	mov r0, #2
	lsl r0, r0, #8
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	mov r0, #2
	lsl r0, r0, #8
	ldr r0, [r4, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #2
	lsl r0, r0, #8
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_02024A04
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
	bl sub_0200D2B4
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
	bl sub_02024A04
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
	bl sub_0200D2B4
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
	bl sub_02024A04
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
	bl sub_0200D2B4
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
	bl sub_020249D4
	mov r0, #0x12
	lsl r0, r0, #6
	ldr r0, [r6, r0]
	mov r1, #0
	bl sub_02024A04
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
	bl Set2dSpriteVisibleFlag
	ldr r0, [r6, #0x20]
	mov r1, #0
	bl Set2dSpriteAnimActiveFlag
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #0x23
	bls _021E8DC2
	mov r0, #0x76
	lsl r0, r0, #2
	ldr r0, [r7, r0]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
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
	bl ov100_021E7128
	ldr r0, [sp, #0x1c]
	mov r1, #0
	add r0, #0xe8
	str r0, [sp, #0x1c]
	ldr r0, [r0]
	bl Set2dSpriteVisibleFlag
	b _021E9036
_021E9020:
	mov r1, #0
	add r2, r1, #0
	bl ov100_021E7128
	ldr r0, [sp, #0x1c]
	mov r1, #1
	add r0, #0xe8
	str r0, [sp, #0x1c]
	ldr r0, [r0]
	bl Set2dSpriteVisibleFlag
_021E9036:
	ldr r0, [r5, #0x10]
	bl ov100_021E5DC8
	add r2, r0, #0
	ldr r0, [r5, #0x10]
	mov r1, #0
	ldr r0, [r0, #0x7c]
	bl ov100_021E72F8
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
	bl ov100_021E7128
	b _021E922A
_021E9222:
	mov r1, #1
	mov r2, #0
	bl ov100_021E7128
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
	bl sub_0200DD88
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
	bl sub_020247F4
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
	bl sub_02003E5C
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
	bl sub_02003E5C
	b _021E9D52
_021E9D28:
	str r2, [sp]
	mov r1, #0
	str r1, [sp, #4]
	ldr r0, [r4, #0x10]
	add r2, r1, #0
	ldr r0, [r0, #0x78]
	mov r3, #0xe0
	bl sub_02003E5C
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
	bl sub_02003E5C
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
	bl Set2dSpriteVisibleFlag
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
	bl Set2dSpriteVisibleFlag
	ldr r1, [r5, #0x10]
	ldr r0, [r1, #0xc]
	cmp r0, #1
	beq _021EA22C
	ldr r0, [r1, #0x7c]
	mov r1, #1
	add r2, r1, #0
	bl ov100_021E7128
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
	bl Set2dSpriteVisibleFlag
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
	bl Set2dSpriteVisibleFlag
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
	bl Set2dSpriteVisibleFlag
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
	bl Set2dSpriteVisibleFlag
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
	bl Set2dSpriteVisibleFlag
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
	bl Set2dSpriteVisibleFlag
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
	bl ScriptState_FlypointFlagAction
	cmp r0, #0
	beq _021EA582
	add r0, r5, #0
	add r0, #0x84
	ldr r0, [r0]
	mov r1, #1
	ldr r0, [r0, #8]
	add r0, r0, r4
	ldr r0, [r0, #0x20]
	bl Set2dSpriteVisibleFlag
	b _021EA594
_021EA582:
	add r0, r5, #0
	add r0, #0x84
	ldr r0, [r0]
	mov r1, #0
	ldr r0, [r0, #8]
	add r0, r0, r4
	ldr r0, [r0, #0x20]
	bl Set2dSpriteVisibleFlag
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
	bl Set2dSpriteAnimSeqNo
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
	bl Set2dSpriteVisibleFlag
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
	bl Set2dSpriteVisibleFlag
	mov r0, #0x11
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #0x46
	lsl r0, r0, #2
	mov r4, #7
	add r5, r5, r0
	mov r6, #0
_021EA636:
	ldr r0, [r5, #0x20]
	add r1, r6, #0
	bl Set2dSpriteVisibleFlag
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
	bl Set2dSpriteVisibleFlag
	mov r0, #0x11
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
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
	bl ScriptState_FlypointFlagAction
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
	ldr r0, _021EA8A4 ; =ov101_021F79B6
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
_021EA8A4: .word ov101_021F79B6
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
	bl Set2dSpriteAnimSeqNo
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
	bl Set2dSpriteAnimSeqNo
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
	bl Set2dSpriteAnimSeqNo
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
	bl PhoneRematches_GiftItemIdGet
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
	bl StringSetEmpty
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
	bl AddTextPrinterParameterized2
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
	bl AddTextPrinterParameterized2
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
	bl StringSetEmpty
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
	bl AddTextPrinterParameterized2
	ldr r1, [sp, #0x2c]
	add r0, r5, #0
	ldrh r1, [r1]
	bl ov101_021EA990
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0xc0
	ldr r0, [r0]
	bl Set2dSpriteVisibleFlag
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
	bl Set2dSpriteVisibleFlag
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
	bl Set2dSpriteVisibleFlag
	ldr r1, [sp, #0x24]
	ldr r0, [r4, #0x20]
	ldrb r1, [r1, #4]
	bl sub_020249D4
	b _021EACC2
_021EACBC:
	mov r1, #0
	bl Set2dSpriteVisibleFlag
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
	bl AddTextPrinterParameterized2
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
	bl Set2dSpriteVisibleFlag
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
	bl AddTextPrinterParameterized2
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
	bl StringSetEmpty
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
	bl AddTextPrinterParameterized2
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
	bl Set2dSpriteVisibleFlag
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
	bl Set2dSpriteVisibleFlag
	b _021EAF1C
_021EAF06:
	mov r0, #0xd
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	bl sub_020249D4
	mov r0, #0xd
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
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
	bl ScriptState_FlypointFlagAction
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
	bl Set2dSpriteVisibleFlag
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
	bl ov100_021E7128
	add r0, r4, #0
	bl ov101_021E94C0
	add r0, r4, #0
	add r0, #0x84
	ldr r0, [r0]
	mov r1, #1
	ldr r0, [r0, #8]
	add r0, #0xe8
	ldr r0, [r0]
	bl Set2dSpriteVisibleFlag
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
	bl Set2dSpriteVisibleFlag
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
	ldr r3, _021EB370 ; =ov100_021E7128
	ldr r0, [r0, #0x7c]
	ldr r1, _021EB374 ; =0x0000FFFF
	mov r2, #0
	bx r3
	.balign 4, 0
_021EB370: .word ov100_021E7128
_021EB374: .word 0x0000FFFF
	thumb_func_end ov101_021EB364

	thumb_func_start ov101_021EB378
ov101_021EB378: ; 0x021EB378
	ldr r0, [r0, #0x10]
	ldr r3, _021EB384 ; =ov100_021E7128
	ldr r0, [r0, #0x7c]
	ldr r1, _021EB388 ; =0x0000FFFF
	mov r2, #1
	bx r3
	.balign 4, 0
_021EB384: .word ov100_021E7128
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
	bl sub_020185FC
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
	bl sub_020185FC
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
	bl AddTextPrinterParameterized2
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
	bl AddTextPrinterParameterized2
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
	bl ov100_021E7128
	ldr r0, [r4, #0x10]
	bl ov100_021E5DC8
	add r2, r0, #0
	ldr r0, [r4, #0x10]
	mov r1, #0
	ldr r0, [r0, #0x7c]
	bl ov100_021E72F8
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
	bl ov100_021E5924
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
	bl sub_02025224
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
	bl sub_02025320
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
	bl sub_02025224
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
	bl sub_02025320
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
	bl sub_020247F4
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
	bl Set2dSpriteVisibleFlag
	pop {r3, pc}
_021EC93A:
	ldr r0, [r0, #0x20]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
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
	bl ov100_021E7128
	mov r0, #0xa
	pop {r3, r4, r5, pc}
_021ECB16:
	mov r1, #1
	tst r1, r0
	beq _021ECBE2
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0x7c]
	bl ov100_021E7334
	add r5, r0, #0
	ldr r0, _021ECC50 ; =0x00000941
	bl PlaySE
	cmp r5, #8
	bne _021ECB40
	ldr r0, [r4, #0x10]
	ldr r1, _021ECC4C ; =0x0000FFFF
	ldr r0, [r0, #0x7c]
	mov r2, #0
	bl ov100_021E7128
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
	bl ov100_021E7414
	ldr r0, [r4, #0x10]
	mov r1, #3
	ldr r0, [r0, #0x7c]
	mov r2, #0
	bl ov100_021E72F8
	ldr r0, [r4, #0x10]
	ldr r1, _021ECC4C ; =0x0000FFFF
	ldr r0, [r0, #0x7c]
	mov r2, #1
	bl ov100_021E7128
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
	bl ov100_021E7414
	ldr r0, [r4, #0x10]
	mov r1, #2
	ldr r0, [r0, #0x7c]
	mov r2, #0
	bl ov100_021E72F8
	ldr r0, [r4, #0x10]
	ldr r1, _021ECC4C ; =0x0000FFFF
	ldr r0, [r0, #0x7c]
	mov r2, #1
	bl ov100_021E7128
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
	bl sub_02025224
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
	bl sub_0200DD60
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
	bl sub_0200DD60
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
	bl sub_0200DD60
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
	bl ov100_021E7128
	ldr r0, [r4, #0x10]
	mov r1, #1
	ldr r0, [r0, #0x7c]
	bl ov100_021E733C
	add r2, r0, #0
	ldr r0, [r4, #0x10]
	mov r1, #1
	ldr r0, [r0, #0x7c]
	bl ov100_021E72F8
	ldr r0, [r4, #0x10]
	ldr r1, _021ECEA4 ; =0x0000FFFF
	ldr r0, [r0, #0x7c]
	mov r2, #1
	bl ov100_021E7414
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
	bl ov100_021E7334
	add r6, r0, #0
	ldr r0, [r5, #0x10]
	mov r1, #1
	ldr r0, [r0, #0x7c]
	bl ov100_021E733C
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
	bl sub_0202539C
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
	bl sub_0200DD88
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
	bl sub_0200DD60
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
	bl sub_0200DD88
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
	bl sub_0200DD60
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
	bl sub_0200DD88
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
	bl ov100_021E733C
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
	bl sub_0200DD88
	ldr r0, [r5, r4]
	mov r1, #4
	bl sub_0200DD60
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
	bl sub_0200DD88
	ldr r0, [r5, r4]
	mov r1, #4
	bl sub_0200DD60
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
	bl sub_0202539C
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
	bl sub_0200DD88
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
	bl sub_020253F0
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

	thumb_func_start ov101_TownMap_OvyInit
ov101_TownMap_OvyInit: ; 0x021ED7F8
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl OverlayManager_GetParentWork
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
	bl SaveData_GSPlayerMisc_get
	ldr r1, [r4, #0x10]
	str r0, [r1, #0x28]
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0x24]
	bl SavArray_Flags_get
	ldr r1, [r4, #0x10]
	str r0, [r1, #0x2c]
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0x24]
	bl Sav2_PlayerData_GetOptionsAddr
	ldr r1, [r4, #0x10]
	str r0, [r1, #0x30]
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0x24]
	bl Sav2_PlayerData_GetProfileAddr
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
	thumb_func_end ov101_TownMap_OvyInit

	thumb_func_start ov101_TownMap_OvyExec
ov101_TownMap_OvyExec: ; 0x021ED8B4
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
	thumb_func_end ov101_TownMap_OvyExec

	thumb_func_start ov101_TownMap_OvyExit
ov101_TownMap_OvyExit: ; 0x021ED924
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
	thumb_func_end ov101_TownMap_OvyExit

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
	bl sub_0202EE70
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
	bl SaveData_GetMomsSavingsAddr
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
	bl GSPlayerMisc_AllocAndCopyPhonebook
	mov r1, #0x4b
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0x28]
	bl GSPlayerMisc_FindEmptyGearPhonebookSlot
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
	bl ScriptState_FlypointFlagAction
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
	bl GX_EngineAToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
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
	bl GX_EngineAToggleLayers
	mov r0, #0x10
	mov r1, #0
	bl GX_EngineBToggleLayers
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
	bl GX_DisableEngineALayers
	bl GX_DisableEngineBLayers
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
	ldr r0, _021EDDA8 ; =ov100_021E65F4
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
_021EDDA8: .word ov100_021E65F4
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
	bl sub_020186A4
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
	bl sub_02018680
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
	bl GX_EngineAToggleLayers
	mov r0, #0xf
	mov r1, #0
	bl GX_EngineBToggleLayers
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
	bl NARC_ctor
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
	bl NARC_dtor
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
	bl ScrStrBufs_new_custom
	add r1, r4, #0
	add r1, #0x8c
	str r0, [r1]
	ldr r1, [r4]
	mov r0, #0x5b
	bl String_ctor
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
	bl String_ctor
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
	bl String_dtor
	add r0, r4, #0
	add r0, #0xb0
	ldr r0, [r0]
	bl String_dtor
	add r0, r4, #0
	add r0, #0xac
	ldr r0, [r0]
	bl String_dtor
	add r0, r4, #0
	add r0, #0xa8
	ldr r0, [r0]
	bl String_dtor
	add r0, r4, #0
	add r0, #0xa4
	ldr r0, [r0]
	bl String_dtor
	add r0, r4, #0
	add r0, #0xa0
	ldr r0, [r0]
	bl String_dtor
	add r0, r4, #0
	add r0, #0x9c
	ldr r0, [r0]
	bl String_dtor
	add r0, r4, #0
	add r0, #0x90
	ldr r0, [r0]
	bl String_dtor
	add r0, r4, #0
	add r0, #0x8c
	ldr r0, [r0]
	bl ScrStrBufs_delete
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
	bl ListMenuItems_ctor
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
	bl ListMenuItems_dtor
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
	bl ov100_021E6978
	ldr r1, [r4]
	mov r0, #0x2a
	bl ov100_021E6E20
	add r1, r4, #0
	add r1, #0x84
	str r0, [r1]
	ldr r0, [r4, #0x10]
	add r0, #0x8c
	ldr r0, [r0]
	bl sub_0200CF6C
	mov r2, #0xf
	mov r1, #0
	lsl r2, r2, #0x10
	bl G2dRenderer_SetSubSurfaceCoords
	ldr r1, [r4, #0x10]
	ldr r0, [r4]
	ldr r1, [r1, #0x78]
	bl sub_02018424
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
	bl sub_02018474
	ldr r0, [r4, #0x10]
	add r0, #0x8c
	ldr r0, [r0]
	bl sub_0200CF6C
	mov r2, #3
	mov r1, #0
	lsl r2, r2, #0x12
	bl G2dRenderer_SetSubSurfaceCoords
	add r0, r4, #0
	add r0, #0x84
	ldr r0, [r0]
	bl ov100_021E6E58
	ldr r0, [r4, #0x10]
	bl ov100_021E69C8
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
	bl sub_0200D2B4
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
	bl sub_0200DD88
	ldr r0, [r4, #0x20]
	mov r1, #0
	bl sub_0200DD3C
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
	bl sub_0200D2B4
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x84
	ldr r0, [r0]
	bl ov100_021E6EC4
	ldr r0, [sp]
	mov r1, #0
	add r0, #0xc0
	ldr r0, [r0]
	bl sub_0200DD3C
	ldr r1, [r5, #0x10]
	ldr r2, _021EE654 ; =ov101_021F80CC
	add r0, r1, #0
	add r0, #0x8c
	add r1, #0x90
	ldr r0, [r0]
	ldr r1, [r1]
	bl sub_0200D2B4
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
	bl sub_0200D2B4
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
	bl sub_0200D2B4
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
	bl sub_020249B0
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
	bl sub_0200D2B4
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
	bl sub_0200DE00
	ldr r0, [r4, #0x20]
	mov r1, #0
	bl sub_0200DD3C
	ldr r0, [r4, #0x20]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	ldr r0, [r4, #0x20]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
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
	bl sub_0200D2B4
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
	bl sub_0200DE00
	ldr r0, [r4, #0x20]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	ldr r0, [r4, #0x20]
	mov r1, #0
	bl Set2dSpriteAnimActiveFlag
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
	bl sub_0200DE00
	ldr r0, [r6, #0x20]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add r4, r4, #1
	cmp r4, #0xb
	blt _021EE5EC
	ldr r0, [sp]
	mov r1, #1
	add r0, #0xe8
	ldr r0, [r0]
	bl Set2dSpriteAnimActiveFlag
	mov r1, #0x11
	ldr r0, [sp]
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	mov r1, #0
	bl Set2dSpriteAnimActiveFlag
	mov r1, #0x11
	ldr r0, [sp]
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	ldr r1, [r5, #0x10]
	ldr r1, [r1, #0x20]
	ldrb r1, [r1, #7]
	bl sub_020249D4
	ldr r0, [sp]
	mov r1, #2
	add r0, #0xe8
	str r0, [sp]
	ldr r0, [r0]
	bl sub_0202487C
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
	bl AddTextPrinterParameterized2
	ldr r0, [sp, #0x1c]
	mov r1, #1
	add r0, #0xe8
	str r0, [sp, #0x1c]
	ldr r0, [r0]
	bl Set2dSpriteVisibleFlag
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

	thumb_func_start ov101_021EE8E8
ov101_021EE8E8: ; 0x021EE8E8
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl OverlayManager_GetParentWork
	mov r2, #2
	add r5, r0, #0
	mov r0, #3
	mov r1, #0x5b
	lsl r2, r2, #0x10
	bl CreateHeap
	add r0, r4, #0
	mov r1, #0x4c
	mov r2, #0x5b
	bl OverlayManager_CreateAndGetData
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x4c
	bl memset
	str r5, [r4, #0xc]
	mov r0, #0x5b
	str r0, [r4]
	add r0, r4, #0
	bl ov101_021EE9D0
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov101_021EE8E8

	thumb_func_start ov101_021EE924
ov101_021EE924: ; 0x021EE924
	push {r4, lr}
	add r4, r1, #0
	bl OverlayManager_GetData
	ldr r1, [r4]
	cmp r1, #9
	bhi _021EE99E
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021EE93E: ; jump table
	.short _021EE952 - _021EE93E - 2 ; case 0
	.short _021EE95A - _021EE93E - 2 ; case 1
	.short _021EE962 - _021EE93E - 2 ; case 2
	.short _021EE96A - _021EE93E - 2 ; case 3
	.short _021EE972 - _021EE93E - 2 ; case 4
	.short _021EE97A - _021EE93E - 2 ; case 5
	.short _021EE982 - _021EE93E - 2 ; case 6
	.short _021EE98A - _021EE93E - 2 ; case 7
	.short _021EE992 - _021EE93E - 2 ; case 8
	.short _021EE99A - _021EE93E - 2 ; case 9
_021EE952:
	bl ov101_021EEA4C
	str r0, [r4]
	b _021EE99E
_021EE95A:
	bl ov101_021EEA70
	str r0, [r4]
	b _021EE99E
_021EE962:
	bl ov101_021EEAC4
	str r0, [r4]
	b _021EE99E
_021EE96A:
	bl ov101_021EEAD8
	str r0, [r4]
	b _021EE99E
_021EE972:
	bl ov101_021EEAE0
	str r0, [r4]
	b _021EE99E
_021EE97A:
	bl ov101_021EEAF4
	str r0, [r4]
	b _021EE99E
_021EE982:
	bl ov101_021EEBA4
	str r0, [r4]
	b _021EE99E
_021EE98A:
	bl ov101_021EEC04
	str r0, [r4]
	b _021EE99E
_021EE992:
	bl ov101_021EEC8C
	str r0, [r4]
	b _021EE99E
_021EE99A:
	mov r0, #1
	pop {r4, pc}
_021EE99E:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov101_021EE924

	thumb_func_start ov101_021EE9A4
ov101_021EE9A4: ; 0x021EE9A4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	bl ov101_021EEA2C
	ldr r2, [r4, #0xc]
	mov r0, #0x80
	ldrb r1, [r2, #5]
	orr r0, r1
	strb r0, [r2, #5]
	ldr r4, [r4]
	add r0, r5, #0
	bl OverlayManager_FreeData
	add r0, r4, #0
	bl DestroyHeap
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov101_021EE9A4

	thumb_func_start ov101_021EE9D0
ov101_021EE9D0: ; 0x021EE9D0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	ldr r1, _021EEA20 ; =ov101_021EF4B0
	str r4, [r0, #0x64]
	ldr r0, [r4, #0xc]
	str r1, [r0, #0x5c]
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0x28]
	bl sub_0202EE7C
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	lsl r0, r0, #0x19
	ldrh r2, [r4, #0x12]
	ldr r1, _021EEA24 ; =0xFFFF01FF
	lsr r0, r0, #0x10
	and r1, r2
	orr r0, r1
	strh r0, [r4, #0x12]
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0x28]
	bl sub_0202EE98
	ldrh r1, [r4, #0x12]
	ldr r2, _021EEA28 ; =0xFFFFFE00
	add r3, r1, #0
	lsr r1, r2, #0x17
	and r3, r2
	and r0, r1
	orr r0, r3
	strh r0, [r4, #0x12]
	ldrh r0, [r4, #0x12]
	add r1, r0, #0
	and r1, r2
	mov r0, #0xff
	orr r0, r1
	strh r0, [r4, #0x12]
	pop {r4, pc}
	nop
_021EEA20: .word ov101_021EF4B0
_021EEA24: .word 0xFFFF01FF
_021EEA28: .word 0xFFFFFE00
	thumb_func_end ov101_021EE9D0

	thumb_func_start ov101_021EEA2C
ov101_021EEA2C: ; 0x021EEA2C
	push {r4, lr}
	add r4, r0, #0
	ldrh r1, [r4, #0x12]
	ldr r0, [r4, #0xc]
	lsl r1, r1, #0x10
	ldr r0, [r0, #0x28]
	lsr r1, r1, #0x19
	bl sub_0202EE84
	ldr r0, [r4, #0xc]
	mov r1, #0
	str r1, [r0, #0x5c]
	ldr r0, [r4, #0xc]
	str r1, [r0, #0x60]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov101_021EEA2C

	thumb_func_start ov101_021EEA4C
ov101_021EEA4C: ; 0x021EEA4C
	push {r4, lr}
	add r4, r0, #0
	bl ov101_021EED44
	cmp r0, #0
	bne _021EEA5C
	mov r0, #0
	pop {r4, pc}
_021EEA5C:
	ldr r0, [r4, #0xc]
	ldrb r0, [r0, #5]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1f
	beq _021EEA6A
	mov r0, #7
	pop {r4, pc}
_021EEA6A:
	mov r0, #5
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov101_021EEA4C

	thumb_func_start ov101_021EEA70
ov101_021EEA70: ; 0x021EEA70
	push {r4, lr}
	add r4, r0, #0
	bl ov101_021EF7D4
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _021EEA9A
	ldr r0, [r4, #0xc]
	bl ov100_021E5900
	ldr r0, [r4, #0xc]
	ldrb r1, [r0, #6]
	cmp r1, #1
	bne _021EEA94
	bl ov100_021E59CC
	b _021EEA9A
_021EEA94:
	add r0, r4, #0
	bl ov101_021EF6E4
_021EEA9A:
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _021EEAC0
	cmp r0, #4
	beq _021EEAAC
	cmp r0, #8
	beq _021EEAB4
	b _021EEAB8
_021EEAAC:
	ldr r1, [r4, #0xc]
	str r0, [r1, #0x1c]
	mov r0, #6
	pop {r4, pc}
_021EEAB4:
	mov r0, #3
	pop {r4, pc}
_021EEAB8:
	ldr r1, [r4, #0xc]
	str r0, [r1, #0x1c]
	mov r0, #8
	pop {r4, pc}
_021EEAC0:
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ov101_021EEA70

	thumb_func_start ov101_021EEAC4
ov101_021EEAC4: ; 0x021EEAC4
	push {r3, lr}
	bl ov101_021EED98
	cmp r0, #0
	beq _021EEAD2
	mov r0, #9
	pop {r3, pc}
_021EEAD2:
	mov r0, #2
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov101_021EEAC4

	thumb_func_start ov101_021EEAD8
ov101_021EEAD8: ; 0x021EEAD8
	ldr r3, _021EEADC ; =ov101_021EEDC4
	bx r3
	.balign 4, 0
_021EEADC: .word ov101_021EEDC4
	thumb_func_end ov101_021EEAD8

	thumb_func_start ov101_021EEAE0
ov101_021EEAE0: ; 0x021EEAE0
	push {r3, lr}
	bl ov101_021EEE80
	cmp r0, #0
	beq _021EEAEE
	mov r0, #1
	pop {r3, pc}
_021EEAEE:
	mov r0, #4
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov101_021EEAE0

	thumb_func_start ov101_021EEAF4
ov101_021EEAF4: ; 0x021EEAF4
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _021EEB06
	cmp r0, #1
	beq _021EEB8A
	b _021EEB9C
_021EEB06:
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
_021EEB20:
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	add r1, r6, #0
	bl ToggleBgLayer
	add r4, r4, #1
	cmp r4, #8
	blt _021EEB20
	ldr r0, [r5, #0xc]
	mov r1, #1
	ldr r0, [r0, #0x78]
	bl sub_02003B50
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r0, [r5, #0xc]
	add r2, r1, #0
	ldr r0, [r0, #0x78]
	mov r3, #0xe0
	bl sub_02003E5C
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [r5, #0xc]
	mov r1, #2
	ldr r0, [r0, #0x78]
	mov r2, #0x40
	mov r3, #0xc0
	bl sub_02003E5C
	ldr r0, [r5, #0xc]
	ldr r0, [r0, #0x78]
	bl sub_0200398C
	ldr r0, [r5, #0xc]
	mov r1, #0
	ldr r0, [r0, #0x78]
	bl sub_02003B50
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	ldr r0, [r5, #4]
	add r0, r0, #1
	str r0, [r5, #4]
	b _021EEB9C
_021EEB8A:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021EEB9C
	mov r0, #0
	str r0, [r5, #4]
	add sp, #0xc
	mov r0, #1
	pop {r3, r4, r5, r6, pc}
_021EEB9C:
	mov r0, #5
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov101_021EEAF4

	thumb_func_start ov101_021EEBA4
ov101_021EEBA4: ; 0x021EEBA4
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _021EEBB6
	cmp r0, #1
	beq _021EEBD6
	b _021EEBFC
_021EEBB6:
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
	b _021EEBFC
_021EEBD6:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021EEBFC
	mov r4, #0
	add r6, r4, #0
_021EEBE2:
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	add r1, r6, #0
	bl ToggleBgLayer
	add r4, r4, #1
	cmp r4, #8
	blt _021EEBE2
	mov r0, #0
	str r0, [r5, #4]
	add sp, #0xc
	mov r0, #2
	pop {r3, r4, r5, r6, pc}
_021EEBFC:
	mov r0, #6
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov101_021EEBA4

	thumb_func_start ov101_021EEC04
ov101_021EEC04: ; 0x021EEC04
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _021EEC18
	cmp r0, #1
	beq _021EEC5E
	cmp r0, #2
	beq _021EEC72
	b _021EEC88
_021EEC18:
	ldr r0, [r5, #0xc]
	mov r1, #1
	ldr r0, [r0, #0x78]
	bl sub_02003B50
	mov r0, #0
	mov r1, #0xe
	mov r2, #1
	bl SetBlendBrightness
	mov r6, #1
	mov r4, #0
	add r7, r6, #0
_021EEC32:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	add r1, r6, #0
	bl ToggleBgLayer
	add r0, r4, #5
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	add r1, r7, #0
	bl ToggleBgLayer
	add r4, r4, #1
	cmp r4, #3
	blt _021EEC32
	ldr r0, [r5, #0xc]
	mov r1, #0
	strb r1, [r0, #9]
	ldr r0, [r5, #4]
	add r0, r0, #1
	str r0, [r5, #4]
	b _021EEC88
_021EEC5E:
	ldr r0, [r5, #0xc]
	mov r1, #0
	bl ov100_021E5D3C
	cmp r0, #0
	beq _021EEC88
	ldr r0, [r5, #4]
	add r0, r0, #1
	str r0, [r5, #4]
	b _021EEC88
_021EEC72:
	ldr r0, [r5, #0xc]
	mov r1, #0
	ldr r0, [r0, #0x78]
	bl sub_02003B50
	ldr r0, [r5, #0xc]
	mov r1, #0
	strb r1, [r0, #9]
	str r1, [r5, #4]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021EEC88:
	mov r0, #7
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov101_021EEC04

	thumb_func_start ov101_021EEC8C
ov101_021EEC8C: ; 0x021EEC8C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _021EECA2
	cmp r0, #1
	beq _021EECBA
	cmp r0, #2
	beq _021EECCE
	b _021EED3C
_021EECA2:
	ldr r0, [r5, #0xc]
	mov r1, #1
	ldr r0, [r0, #0x78]
	bl sub_02003B50
	ldr r0, [r5, #0xc]
	mov r1, #0
	strb r1, [r0, #9]
	ldr r0, [r5, #4]
	add r0, r0, #1
	str r0, [r5, #4]
	b _021EED3C
_021EECBA:
	ldr r0, [r5, #0xc]
	mov r1, #1
	bl ov100_021E5D3C
	cmp r0, #0
	beq _021EED3C
	ldr r0, [r5, #4]
	add r0, r0, #1
	str r0, [r5, #4]
	b _021EED3C
_021EECCE:
	mov r0, #0x10
	mov r1, #0
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r5, #0xc]
	add r2, r1, #0
	ldr r0, [r0, #0x78]
	mov r3, #0xe0
	bl sub_02003E5C
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, [r5, #0xc]
	mov r1, #2
	ldr r0, [r0, #0x78]
	mov r2, #0x40
	mov r3, #0xc0
	bl sub_02003E5C
	ldr r0, [r5, #0xc]
	ldr r0, [r0, #0x78]
	bl sub_0200398C
	mov r4, #0
	add r6, r4, #0
	add r7, r4, #0
_021EED06:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	add r1, r6, #0
	bl ToggleBgLayer
	add r0, r4, #5
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	add r1, r7, #0
	bl ToggleBgLayer
	add r4, r4, #1
	cmp r4, #3
	blt _021EED06
	ldr r0, [r5, #0xc]
	mov r1, #0
	ldr r0, [r0, #0x78]
	bl sub_02003B50
	ldr r0, [r5, #0xc]
	mov r1, #0
	strb r1, [r0, #9]
	add sp, #8
	str r1, [r5, #4]
	mov r0, #2
	pop {r3, r4, r5, r6, r7, pc}
_021EED3C:
	mov r0, #8
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov101_021EEC8C

	thumb_func_start ov101_021EED44
ov101_021EED44: ; 0x021EED44
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _021EED54
	cmp r1, #1
	beq _021EED6E
	b _021EED8C
_021EED54:
	bl ov101_021EEF0C
	add r0, r4, #0
	bl ov101_021EEFE8
	add r0, r4, #0
	bl ov101_021EF00C
	add r0, r4, #0
	mov r1, #1
	bl ov101_021EF26C
	b _021EED8C
_021EED6E:
	bl ov101_021EF03C
	add r0, r4, #0
	bl ov101_021EF0E0
	add r0, r4, #0
	bl ov101_021EF130
	add r0, r4, #0
	bl ov101_021EF17C
	mov r0, #0
	str r0, [r4, #8]
	mov r0, #1
	pop {r4, pc}
_021EED8C:
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov101_021EED44

	thumb_func_start ov101_021EED98
ov101_021EED98: ; 0x021EED98
	push {r4, lr}
	add r4, r0, #0
	bl ov101_021EF16C
	add r0, r4, #0
	bl ov101_021EF120
	add r0, r4, #0
	bl ov101_021EF0C8
	add r0, r4, #0
	bl ov101_021EF028
	add r0, r4, #0
	bl ov101_021EEFFC
	add r0, r4, #0
	bl ov101_021EEFDC
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov101_021EED98

	thumb_func_start ov101_021EEDC4
ov101_021EEDC4: ; 0x021EEDC4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x40]
	bl sub_020186A4
	add r4, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	beq _021EEE0A
	ldr r0, [r5, #0x40]
	bl sub_02018674
	ldr r1, [r5, #0xc]
	str r0, [r1, #0xc]
	ldr r0, [r5, #0x40]
	bl sub_02018680
	mov r1, #0
	add r0, r5, #0
	add r2, r1, #0
	bl ov101_021EF5A4
	ldr r0, [r5, #0xc]
	ldr r1, _021EEE10 ; =0x0000FFFF
	ldr r0, [r0, #0x7c]
	mov r2, #1
	bl ov100_021E7414
	cmp r4, #0
	bne _021EEE06
	mov r0, #4
	pop {r3, r4, r5, pc}
_021EEE06:
	mov r0, #1
	pop {r3, r4, r5, pc}
_021EEE0A:
	mov r0, #3
	pop {r3, r4, r5, pc}
	nop
_021EEE10: .word 0x0000FFFF
	thumb_func_end ov101_021EEDC4

	thumb_func_start ov101_021EEE14
ov101_021EEE14: ; 0x021EEE14
	push {r4, lr}
	add r4, r0, #0
	bl ov101_021EF260
	ldrh r1, [r4, #0x12]
	ldr r0, _021EEE7C ; =0xFFFF01FF
	and r1, r0
	ldrb r0, [r4, #0x11]
	lsl r0, r0, #0x19
	lsr r0, r0, #0x10
	orr r0, r1
	strh r0, [r4, #0x12]
	ldrh r0, [r4, #0x12]
	lsl r0, r0, #0x10
	lsr r1, r0, #0x19
	ldr r0, [r4, #0xc]
	strb r1, [r0, #8]
	ldrh r1, [r4, #0x12]
	ldr r0, [r4, #0xc]
	lsl r1, r1, #0x10
	lsr r1, r1, #0x19
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl ov100_021E5EB4
	ldrh r1, [r4, #0x12]
	ldr r0, [r4, #0xc]
	lsl r1, r1, #0x10
	add r0, #0x94
	lsr r1, r1, #0x19
	lsl r1, r1, #0x18
	ldr r0, [r0]
	lsr r1, r1, #0x18
	bl ov100_021E6A58
	add r0, r4, #0
	bl ov101_021EF1D8
	add r0, r4, #0
	mov r1, #0
	bl ov101_021EF26C
	add r0, r4, #0
	bl ov101_021EF414
	ldrh r1, [r4, #0x12]
	add r0, r4, #0
	lsl r1, r1, #0x10
	lsr r1, r1, #0x19
	bl ov101_021EF384
	pop {r4, pc}
	.balign 4, 0
_021EEE7C: .word 0xFFFF01FF
	thumb_func_end ov101_021EEE14

	thumb_func_start ov101_021EEE80
ov101_021EEE80: ; 0x021EEE80
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #3
	bhi _021EEF00
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021EEE98: ; jump table
	.short _021EEEA0 - _021EEE98 - 2 ; case 0
	.short _021EEEB8 - _021EEE98 - 2 ; case 1
	.short _021EEECE - _021EEE98 - 2 ; case 2
	.short _021EEEE8 - _021EEE98 - 2 ; case 3
_021EEEA0:
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r1, [r4]
	mov r3, #0
	str r1, [sp, #8]
	mov r1, #4
	add r2, r1, #0
	bl BeginNormalPaletteFade
	b _021EEF00
_021EEEB8:
	bl IsPaletteFadeFinished
	cmp r0, #0
	bne _021EEEC6
	add sp, #0xc
	mov r0, #0
	pop {r3, r4, pc}
_021EEEC6:
	add r0, r4, #0
	bl ov101_021EEE14
	b _021EEF00
_021EEECE:
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	mov r1, #3
	str r0, [sp, #8]
	mov r0, #2
	add r2, r1, #0
	mov r3, #0
	bl BeginNormalPaletteFade
	b _021EEF00
_021EEEE8:
	bl IsPaletteFadeFinished
	cmp r0, #0
	bne _021EEEF6
	add sp, #0xc
	mov r0, #0
	pop {r3, r4, pc}
_021EEEF6:
	mov r0, #0
	str r0, [r4, #8]
	add sp, #0xc
	mov r0, #1
	pop {r3, r4, pc}
_021EEF00:
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	mov r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov101_021EEE80

	thumb_func_start ov101_021EEF0C
ov101_021EEF0C: ; 0x021EEF0C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xac
	mov r1, #0
	add r5, r0, #0
	mov r0, #1
	add r2, r1, #0
	bl GX_SetGraphicsMode
	ldr r4, _021EEFD8 ; =ov101_021F8254
	add r3, sp, #4
	mov r2, #0x15
_021EEF22:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021EEF22
	mov r3, #0
	str r3, [sp]
	ldr r0, [r5, #0xc]
	mov r1, #1
	ldr r0, [r0, #0x74]
	add r2, sp, #4
	bl InitBgFromTemplateEx
	mov r3, #0
	str r3, [sp]
	ldr r0, [r5, #0xc]
	mov r1, #2
	ldr r0, [r0, #0x74]
	add r2, sp, #0x20
	bl InitBgFromTemplateEx
	mov r3, #0
	str r3, [sp]
	ldr r0, [r5, #0xc]
	mov r1, #3
	ldr r0, [r0, #0x74]
	add r2, sp, #0x3c
	bl InitBgFromTemplateEx
	mov r3, #0
	str r3, [sp]
	ldr r0, [r5, #0xc]
	mov r1, #5
	ldr r0, [r0, #0x74]
	add r2, sp, #0x58
	bl InitBgFromTemplateEx
	mov r3, #0
	str r3, [sp]
	ldr r0, [r5, #0xc]
	mov r1, #6
	ldr r0, [r0, #0x74]
	add r2, sp, #0x74
	bl InitBgFromTemplateEx
	mov r3, #0
	str r3, [sp]
	ldr r0, [r5, #0xc]
	mov r1, #7
	ldr r0, [r0, #0x74]
	add r2, sp, #0x90
	bl InitBgFromTemplateEx
	mov r4, #0
	mov r6, #0x20
	add r7, r4, #0
_021EEF90:
	ldr r0, [r5, #0xc]
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
	ldr r0, [r5, #0xc]
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
	add r4, r4, #1
	cmp r4, #3
	blt _021EEF90
	add sp, #0xac
	pop {r4, r5, r6, r7, pc}
	nop
_021EEFD8: .word ov101_021F8254
	thumb_func_end ov101_021EEF0C

	thumb_func_start ov101_021EEFDC
ov101_021EEFDC: ; 0x021EEFDC
	ldr r3, _021EEFE4 ; =ov100_021E5CA4
	ldr r0, [r0, #0xc]
	bx r3
	nop
_021EEFE4: .word ov100_021E5CA4
	thumb_func_end ov101_021EEFDC

	thumb_func_start ov101_021EEFE8
ov101_021EEFE8: ; 0x021EEFE8
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4]
	mov r0, #4
	bl FontID_Alloc
	add r0, r4, #0
	bl ov101_021EF1D8
	pop {r4, pc}
	thumb_func_end ov101_021EEFE8

	thumb_func_start ov101_021EEFFC
ov101_021EEFFC: ; 0x021EEFFC
	push {r3, lr}
	bl ov101_021EF260
	mov r0, #4
	bl FontID_Release
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov101_021EEFFC

	thumb_func_start ov101_021EF00C
ov101_021EF00C: ; 0x021EF00C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	mov r1, #0
	bl ov100_021E6978
	ldr r1, [r4, #0xc]
	ldr r0, [r4]
	ldr r1, [r1, #0x78]
	bl sub_02018424
	str r0, [r4, #0x38]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov101_021EF00C

	thumb_func_start ov101_021EF028
ov101_021EF028: ; 0x021EF028
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x38]
	bl sub_02018474
	ldr r0, [r4, #0xc]
	bl ov100_021E69C8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov101_021EF028

	thumb_func_start ov101_021EF03C
ov101_021EF03C: ; 0x021EF03C
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r4, _021EF0C4 ; =ov101_021F82FC
	mov r7, #0
	add r5, r6, #0
_021EF046:
	ldr r1, [r6, #0xc]
	add r2, r4, #0
	add r0, r1, #0
	add r0, #0x8c
	add r1, #0x90
	ldr r0, [r0]
	ldr r1, [r1]
	bl sub_0200D2B4
	str r0, [r5, #0x14]
	mov r1, #1
	bl sub_0200DD3C
	ldr r0, [r5, #0x14]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	ldr r0, [r5, #0x14]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	add r7, r7, #1
	add r4, #0x28
	add r5, r5, #4
	cmp r7, #4
	ble _021EF046
	add r4, r6, #0
	ldr r7, _021EF0C4 ; =ov101_021F82FC
	mov r5, #5
	add r4, #0x14
_021EF082:
	ldr r1, [r6, #0xc]
	sub r3, r5, #5
	add r0, r1, #0
	add r0, #0x8c
	add r1, #0x90
	mov r2, #0x28
	mul r2, r3
	ldr r0, [r0]
	ldr r1, [r1]
	add r2, r7, r2
	bl sub_0200D2B4
	str r0, [r4, #0x14]
	mov r1, #1
	bl sub_0200DD3C
	ldr r0, [r4, #0x14]
	mov r1, #0
	bl sub_0200DD60
	ldr r0, [r4, #0x14]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	ldr r0, [r4, #0x14]
	mov r1, #0
	bl Set2dSpriteAnimActiveFlag
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, #8
	ble _021EF082
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021EF0C4: .word ov101_021F82FC
	thumb_func_end ov101_021EF03C

	thumb_func_start ov101_021EF0C8
ov101_021EF0C8: ; 0x021EF0C8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
_021EF0CE:
	ldr r0, [r5, #0x14]
	bl sub_0200D018
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #9
	blt _021EF0CE
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov101_021EF0C8

	thumb_func_start ov101_021EF0E0
ov101_021EF0E0: ; 0x021EF0E0
	push {r4, lr}
	sub sp, #0x18
	mov r3, #0
	add r4, r0, #0
	str r3, [sp]
	ldr r0, [r4]
	ldr r1, _021EF11C ; =ov101_021F820C
	str r0, [sp, #4]
	ldr r0, [r4, #0x14]
	mov r2, #6
	str r0, [sp, #8]
	ldr r0, [r4, #0x18]
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x1c]
	str r0, [sp, #0x10]
	ldr r0, [r4, #0x20]
	str r0, [sp, #0x14]
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0x7c]
	bl ov100_021E7014
	ldr r0, [r4, #0xc]
	mov r1, #1
	ldr r0, [r0, #0x7c]
	mov r2, #0
	bl ov100_021E7128
	add sp, #0x18
	pop {r4, pc}
	nop
_021EF11C: .word ov101_021F820C
	thumb_func_end ov101_021EF0E0

	thumb_func_start ov101_021EF120
ov101_021EF120: ; 0x021EF120
	ldr r0, [r0, #0xc]
	ldr r3, _021EF12C ; =ov100_021E70A4
	ldr r0, [r0, #0x7c]
	mov r1, #1
	bx r3
	nop
_021EF12C: .word ov100_021E70A4
	thumb_func_end ov101_021EF120

	thumb_func_start ov101_021EF130
ov101_021EF130: ; 0x021EF130
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r1, [r5]
	mov r0, #2
	bl ListMenuItems_ctor
	str r0, [r5, #0x3c]
	mov r1, #0x1b
	add r2, r1, #0
	ldr r3, [r5]
	mov r0, #0
	add r2, #0xf3
	bl NewMsgDataFromNarc
	add r6, r0, #0
	mov r4, #0
_021EF150:
	ldr r0, [r5, #0x3c]
	add r1, r6, #0
	add r2, r4, #0
	add r3, r4, #0
	bl ListMenuItems_AppendFromMsgData
	add r4, r4, #1
	cmp r4, #2
	blt _021EF150
	add r0, r6, #0
	bl DestroyMsgData
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov101_021EF130

	thumb_func_start ov101_021EF16C
ov101_021EF16C: ; 0x021EF16C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x3c]
	bl ListMenuItems_dtor
	mov r0, #0
	str r0, [r4, #0x3c]
	pop {r4, pc}
	thumb_func_end ov101_021EF16C

	thumb_func_start ov101_021EF17C
ov101_021EF17C: ; 0x021EF17C
	push {r4, lr}
	add r4, r0, #0
	bl ov101_021EF414
	ldr r1, [r4, #0xc]
	ldrb r0, [r1, #6]
	cmp r0, #1
	ldr r0, [r1, #0x7c]
	bne _021EF1B6
	mov r1, #0
	mov r2, #1
	bl ov100_021E7128
	ldr r0, [r4, #0xc]
	mov r1, #1
	ldr r0, [r0, #0x7c]
	mov r2, #0
	bl ov100_021E7128
	ldr r0, [r4, #0xc]
	bl ov100_021E5DC8
	add r2, r0, #0
	ldr r0, [r4, #0xc]
	mov r1, #0
	ldr r0, [r0, #0x7c]
	bl ov100_021E72F8
	pop {r4, pc}
_021EF1B6:
	mov r1, #0
	add r2, r1, #0
	bl ov100_021E7128
	ldr r0, [r4, #0xc]
	mov r1, #1
	ldr r0, [r0, #0x7c]
	add r2, r1, #0
	bl ov100_021E7128
	ldr r0, [r4, #0xc]
	mov r1, #1
	ldr r0, [r0, #0x7c]
	mov r2, #0
	bl ov100_021E72F8
	pop {r4, pc}
	thumb_func_end ov101_021EF17C

	thumb_func_start ov101_021EF1D8
ov101_021EF1D8: ; 0x021EF1D8
	push {r4, r5, lr}
	sub sp, #0x14
	add r5, r0, #0
	ldr r1, [r5]
	mov r0, #0x91
	bl NARC_ctor
	add r4, r0, #0
	ldrh r0, [r5, #0x12]
	add r2, r4, #0
	mov r3, #0x91
	lsl r0, r0, #0x10
	lsr r0, r0, #0x19
	add r0, #0xa
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0xc]
	ldr r1, [r5]
	ldr r0, [r0, #0x74]
	bl sub_0208820C
	ldrh r0, [r5, #0x12]
	add r2, r4, #0
	mov r3, #0x91
	lsl r0, r0, #0x10
	lsr r0, r0, #0x19
	add r0, #0x10
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0xc]
	ldr r1, [r5]
	ldr r0, [r0, #0x74]
	bl sub_0208820C
	ldr r0, [r5]
	add r3, r5, #0
	str r0, [sp]
	ldrh r1, [r5, #0x12]
	add r0, r4, #0
	mov r2, #0
	lsl r1, r1, #0x10
	lsr r1, r1, #0x19
	add r1, #0x16
	add r3, #0x48
	bl GfGfxLoader_GetScrnDataFromOpenNarc
	str r0, [r5, #0x44]
	add r0, r4, #0
	bl NARC_dtor
	ldr r0, [r5, #0xc]
	mov r1, #3
	ldr r0, [r0, #0x74]
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x14
	pop {r4, r5, pc}
	thumb_func_end ov101_021EF1D8

	thumb_func_start ov101_021EF260
ov101_021EF260: ; 0x021EF260
	ldr r3, _021EF268 ; =FreeToHeap
	ldr r0, [r0, #0x44]
	bx r3
	nop
_021EF268: .word FreeToHeap
	thumb_func_end ov101_021EF260

	thumb_func_start ov101_021EF26C
ov101_021EF26C: ; 0x021EF26C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r6, r1, #0
	ldr r1, [r5]
	mov r0, #0x91
	bl NARC_ctor
	add r4, r0, #0
	mov r1, #0
	mov r0, #7
	str r1, [sp]
	lsl r0, r0, #6
	str r0, [sp, #4]
	str r1, [sp, #8]
	str r1, [sp, #0xc]
	ldrh r2, [r5, #0x12]
	ldr r0, [r5, #0xc]
	ldr r3, [r5]
	lsl r2, r2, #0x10
	lsr r2, r2, #0x19
	ldr r0, [r0, #0x78]
	add r1, r4, #0
	add r2, r2, #4
	bl sub_02003220
	mov r0, #1
	str r0, [sp]
	mov r0, #6
	lsl r0, r0, #6
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	ldrh r2, [r5, #0x12]
	ldr r0, [r5, #0xc]
	ldr r3, [r5]
	lsl r2, r2, #0x10
	lsr r2, r2, #0x19
	ldr r0, [r0, #0x78]
	add r1, r4, #0
	add r2, r2, #4
	bl sub_02003220
	cmp r6, #0
	beq _021EF304
	mov r0, #2
	str r0, [sp]
	mov r0, #0x16
	lsl r0, r0, #4
	str r0, [sp, #4]
	mov r0, #0x40
	str r0, [sp, #8]
	mov r2, #0
	str r2, [sp, #0xc]
	ldr r0, [r5, #0xc]
	ldr r3, [r5]
	ldr r0, [r0, #0x78]
	add r1, r4, #0
	bl sub_02003220
	mov r0, #3
	str r0, [sp]
	mov r0, #0x16
	lsl r0, r0, #4
	str r0, [sp, #4]
	mov r0, #0x40
	str r0, [sp, #8]
	mov r2, #0
	str r2, [sp, #0xc]
	ldr r0, [r5, #0xc]
	ldr r3, [r5]
	ldr r0, [r0, #0x78]
	add r1, r4, #0
	bl sub_02003220
_021EF304:
	ldr r0, [r5, #0xc]
	mov r1, #1
	ldr r0, [r0, #0x78]
	bl sub_02003B50
	cmp r6, #0
	beq _021EF33E
	mov r0, #0x10
	mov r1, #0
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r5, #0xc]
	add r2, r1, #0
	ldr r0, [r0, #0x78]
	mov r3, #0xe0
	bl sub_02003E5C
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, [r5, #0xc]
	mov r1, #2
	ldr r0, [r0, #0x78]
	mov r2, #0x40
	mov r3, #0xc0
	bl sub_02003E5C
	b _021EF366
_021EF33E:
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r0, [r5, #0xc]
	mov r3, #1
	ldr r0, [r0, #0x78]
	add r2, r1, #0
	lsl r3, r3, #8
	bl sub_02003E5C
	mov r2, #0
	str r2, [sp]
	str r2, [sp, #4]
	ldr r0, [r5, #0xc]
	mov r1, #2
	add r3, r1, #0
	ldr r0, [r0, #0x78]
	add r3, #0xfe
	bl sub_02003E5C
_021EF366:
	ldr r0, [r5, #0xc]
	ldr r0, [r0, #0x78]
	bl sub_0200398C
	ldr r0, [r5, #0xc]
	mov r1, #0
	ldr r0, [r0, #0x78]
	bl sub_02003B50
	add r0, r4, #0
	bl NARC_dtor
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov101_021EF26C

	thumb_func_start ov101_021EF384
ov101_021EF384: ; 0x021EF384
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r0, #0
	add r6, r1, #0
	ldrh r1, [r5, #0x12]
	ldr r0, _021EF410 ; =0xFFFF01FF
	and r1, r0
	lsl r0, r6, #0x10
	lsr r0, r0, #0x10
	lsl r0, r0, #0x19
	lsr r0, r0, #0x10
	orr r0, r1
	strh r0, [r5, #0x12]
	ldr r0, [r5, #0xc]
	mov r1, #2
	ldr r0, [r0, #0x74]
	bl BgClearTilemapBufferAndCommit
	add r0, r6, #0
	mov r1, #3
	ldr r4, [r5, #0x48]
	bl _s32_div_f
	add r7, r1, #0
	add r0, r6, #0
	mov r1, #3
	bl _s32_div_f
	add r3, r0, #0
	mov r0, #9
	str r0, [sp]
	mov r0, #7
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0xc
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldrh r0, [r4]
	mov r2, #0xa
	mul r2, r7
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x14]
	ldrh r0, [r4, #2]
	lsl r4, r3, #3
	add r3, r3, r4
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0xc]
	add r2, r2, #2
	add r3, r3, #2
	lsl r2, r2, #0x18
	lsl r3, r3, #0x18
	ldr r0, [r0, #0x74]
	mov r1, #2
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl CopyToBgTilemapRect
	ldr r0, [r5, #0xc]
	mov r1, #2
	ldr r0, [r0, #0x74]
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_021EF410: .word 0xFFFF01FF
	thumb_func_end ov101_021EF384

	thumb_func_start ov101_021EF414
ov101_021EF414: ; 0x021EF414
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r7, r0, #0
	mov r4, #1
	mov r6, #0
_021EF41E:
	ldrh r0, [r7, #0x12]
	lsl r0, r0, #0x17
	lsr r0, r0, #0x17
	tst r0, r4
	beq _021EF42A
	b _021EF48A
_021EF42A:
	add r0, r6, #0
	mov r1, #3
	ldr r5, [r7, #0x48]
	bl _s32_div_f
	str r1, [sp, #0x1c]
	add r0, r6, #0
	mov r1, #3
	bl _s32_div_f
	mov ip, r0
	mov r0, #6
	str r0, [sp]
	mov r0, #5
	str r0, [sp, #4]
	add r0, r5, #0
	add r0, #0xc
	str r0, [sp, #8]
	mov r0, #6
	str r0, [sp, #0xc]
	mov r0, #0
	str r0, [sp, #0x10]
	ldrh r0, [r5]
	ldr r3, [sp, #0x1c]
	mov r2, #0xa
	mul r2, r3
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x14]
	ldrh r0, [r5, #2]
	mov r3, ip
	lsl r5, r3, #3
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	mov r3, ip
	str r0, [sp, #0x18]
	ldr r0, [r7, #0xc]
	add r3, r3, r5
	add r2, r2, #3
	add r3, r3, #3
	lsl r2, r2, #0x18
	lsl r3, r3, #0x18
	ldr r0, [r0, #0x74]
	mov r1, #3
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl CopyToBgTilemapRect
_021EF48A:
	lsl r0, r4, #0x11
	add r6, r6, #1
	lsr r4, r0, #0x10
	cmp r6, #6
	blt _021EF41E
	ldr r0, [r7, #0xc]
	mov r1, #3
	ldr r0, [r0, #0x74]
	bl ScheduleBgTilemapBufferTransfer
	ldrh r1, [r7, #0x12]
	add r0, r7, #0
	lsl r1, r1, #0x10
	lsr r1, r1, #0x19
	bl ov101_021EF384
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov101_021EF414

	thumb_func_start ov101_021EF4B0
ov101_021EF4B0: ; 0x021EF4B0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	mov r1, #1
	ldr r0, [r0, #0x7c]
	mov r2, #0xff
	bl ov100_021E72F8
	ldr r0, [r4, #0xc]
	mov r1, #0
	ldr r0, [r0, #0x7c]
	add r2, r1, #0
	bl ov100_021E7128
	ldr r0, [r4, #0xc]
	mov r1, #1
	ldr r0, [r0, #0x7c]
	add r2, r1, #0
	bl ov100_021E7128
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov101_021EF4B0

	thumb_func_start ov101_021EF4DC
ov101_021EF4DC: ; 0x021EF4DC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	mov r1, #0
	strb r1, [r0, #6]
	ldr r0, [r4, #0xc]
	mov r1, #1
	ldr r0, [r0, #0x7c]
	mov r2, #0xff
	bl ov100_021E72F8
	ldr r0, [r4, #0xc]
	mov r1, #0
	ldr r0, [r0, #0x7c]
	add r2, r1, #0
	bl ov100_021E7128
	ldr r0, [r4, #0xc]
	mov r1, #1
	ldr r0, [r0, #0x7c]
	add r2, r1, #0
	bl ov100_021E7128
	pop {r4, pc}
	thumb_func_end ov101_021EF4DC

	thumb_func_start ov101_021EF50C
ov101_021EF50C: ; 0x021EF50C
	push {r4, r5, r6, lr}
	sub sp, #0x28
	add r5, r0, #0
	add r4, r1, #0
	add r0, sp, #0x10
	mov r1, #0
	mov r2, #0x18
	strb r4, [r5, #0x11]
	bl MI_CpuFill8
	ldr r2, _021EF590 ; =ov101_021F83C4
	add r0, sp, #0x10
	ldrh r3, [r2]
	ldr r6, _021EF594 ; =ov101_021F83D0
	add r1, sp, #0x10
	strh r3, [r0]
	ldrh r3, [r2, #2]
	strh r3, [r0, #2]
	ldrh r3, [r2, #4]
	strh r3, [r0, #4]
	ldrh r3, [r2, #6]
	strh r3, [r0, #6]
	ldrh r3, [r2, #8]
	ldrh r2, [r2, #0xa]
	strh r3, [r0, #8]
	strh r2, [r0, #0xa]
	ldr r2, [r5, #0x3c]
	str r2, [sp, #0x1c]
	ldr r2, [r5, #0xc]
	ldr r2, [r2, #0x74]
	str r2, [sp, #0x20]
	mov r2, #2
	strb r2, [r0, #0x14]
	lsl r0, r4, #1
	add r3, r4, r0
	ldr r0, _021EF598 ; =ov101_021F83D1
	ldrb r0, [r0, r3]
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _021EF59C ; =ov101_021F83D2
	ldrb r0, [r0, r3]
	ldrb r3, [r6, r3]
	str r0, [sp, #0xc]
	ldr r2, [r5, #0xc]
	ldr r0, [r5, #0x38]
	ldr r2, [r2, #0xc]
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	bl sub_02018620
	str r0, [r5, #0x40]
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #1
	bl ov101_021EF5A4
	ldr r0, [r5, #0xc]
	ldr r1, _021EF5A0 ; =0x0000FFFF
	ldr r0, [r0, #0x7c]
	mov r2, #0
	bl ov100_021E7414
	add sp, #0x28
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021EF590: .word ov101_021F83C4
_021EF594: .word ov101_021F83D0
_021EF598: .word ov101_021F83D1
_021EF59C: .word ov101_021F83D2
_021EF5A0: .word 0x0000FFFF
	thumb_func_end ov101_021EF50C

	thumb_func_start ov101_021EF5A4
ov101_021EF5A4: ; 0x021EF5A4
	push {r4, r5, r6, lr}
	add r4, r1, #0
	cmp r2, #0
	beq _021EF680
	ldr r1, _021EF6B8 ; =0x04000048
	mov r3, #0x3f
	ldrh r2, [r1]
	mov r5, #0x1f
	bic r2, r3
	orr r2, r5
	strh r2, [r1]
	ldrh r6, [r1]
	ldr r2, _021EF6BC ; =0xFFFFC0FF
	and r6, r2
	lsl r2, r5, #8
	orr r2, r6
	strh r2, [r1]
	ldrh r2, [r1, #2]
	bic r2, r3
	add r3, r2, #0
	orr r3, r5
	mov r2, #0x20
	orr r2, r3
	strh r2, [r1, #2]
	ldr r6, [r0, #0x40]
	add r0, r6, #0
	add r0, #0x28
	ldrb r0, [r0]
	lsl r5, r0, #3
	add r0, r6, #0
	add r6, #0x26
	ldrb r6, [r6]
	add r0, #0x29
	ldrb r0, [r0]
	add r6, r6, #2
	lsl r6, r6, #3
	lsl r3, r0, #3
	lsl r2, r5, #8
	mov r0, #0xff
	add r5, r5, r6
	lsl r0, r0, #8
	lsl r5, r5, #0x18
	and r2, r0
	lsr r5, r5, #0x18
	orr r5, r2
	add r2, r1, #0
	sub r2, #8
	strh r5, [r2]
	lsl r2, r3, #8
	add r3, #0x38
	and r2, r0
	lsl r0, r3, #0x18
	lsr r0, r0, #0x18
	orr r2, r0
	sub r0, r1, #4
	strh r2, [r0]
	add r0, r4, #0
	mov r1, #3
	bl _s32_div_f
	mov r0, #0x50
	add r2, r1, #0
	mul r2, r0
	add r0, r2, #0
	add r0, #0x18
	lsl r1, r0, #8
	mov r0, #0xff
	lsl r0, r0, #8
	add r2, #0x48
	and r1, r0
	lsl r0, r2, #0x18
	lsr r0, r0, #0x18
	orr r1, r0
	ldr r0, _021EF6C0 ; =0x04000042
	strh r1, [r0]
	add r0, r4, #0
	mov r1, #3
	bl _s32_div_f
	mov r1, #0x48
	add r2, r0, #0
	mul r2, r1
	add r0, r2, #0
	add r0, #0x18
	lsl r1, r0, #8
	mov r0, #0xff
	lsl r0, r0, #8
	add r2, #0x40
	and r1, r0
	lsl r0, r2, #0x18
	lsr r0, r0, #0x18
	orr r1, r0
	ldr r0, _021EF6C4 ; =0x04000046
	add r3, r0, #0
	strh r1, [r0]
	sub r3, #0x46
	ldr r2, [r3]
	ldr r1, _021EF6C8 ; =0xFFFF1FFF
	add r0, #0xa
	and r2, r1
	mov r1, #6
	lsl r1, r1, #0xc
	orr r1, r2
	str r1, [r3]
	mov r1, #0x1f
	add r2, r1, #0
	sub r2, #0x27
	bl G2x_SetBlendBrightness_
	pop {r4, r5, r6, pc}
_021EF680:
	ldr r0, _021EF6B8 ; =0x04000048
	mov r2, #0x3f
	ldrh r1, [r0]
	bic r1, r2
	strh r1, [r0]
	ldrh r3, [r0]
	ldr r1, _021EF6BC ; =0xFFFFC0FF
	and r1, r3
	strh r1, [r0]
	ldrh r1, [r0, #2]
	add r3, r0, #0
	sub r3, #0x48
	bic r1, r2
	strh r1, [r0, #2]
	ldr r2, [r3]
	ldr r1, _021EF6C8 ; =0xFFFF1FFF
	add r0, #8
	and r1, r2
	str r1, [r3]
	mov r1, #0x1f
	mov r2, #0
	bl G2x_SetBlendBrightness_
	ldr r0, _021EF6CC ; =0x04000050
	mov r1, #0
	strh r1, [r0]
	pop {r4, r5, r6, pc}
	nop
_021EF6B8: .word 0x04000048
_021EF6BC: .word 0xFFFFC0FF
_021EF6C0: .word 0x04000042
_021EF6C4: .word 0x04000046
_021EF6C8: .word 0xFFFF1FFF
_021EF6CC: .word 0x04000050
	thumb_func_end ov101_021EF5A4

	thumb_func_start ov101_021EF6D0
ov101_021EF6D0: ; 0x021EF6D0
	mov r2, #1
	ldrh r0, [r0, #0x12]
	lsl r2, r1
	lsl r1, r2, #0x10
	lsl r0, r0, #0x17
	lsr r1, r1, #0x10
	lsr r0, r0, #0x17
	and r0, r1
	bx lr
	.balign 4, 0
	thumb_func_end ov101_021EF6D0

	thumb_func_start ov101_021EF6E4
ov101_021EF6E4: ; 0x021EF6E4
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, _021EF7C8 ; =gSystem
	mov r2, #2
	ldr r0, [r0, #0x48]
	add r1, r0, #0
	tst r1, r2
	beq _021EF730
	ldr r0, [r4, #0xc]
	mov r1, #1
	strb r1, [r0, #6]
	ldr r0, [r4, #0xc]
	mov r2, #0
	ldr r0, [r0, #0x7c]
	bl ov100_021E7128
	ldr r0, [r4, #0xc]
	mov r1, #0
	ldr r0, [r0, #0x7c]
	mov r2, #1
	bl ov100_021E7128
	ldr r0, [r4, #0xc]
	bl ov100_021E5DC8
	add r2, r0, #0
	ldr r0, [r4, #0xc]
	mov r1, #0
	ldr r0, [r0, #0x7c]
	bl ov100_021E72F8
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
_021EF730:
	mov r1, #1
	add r3, r0, #0
	tst r3, r1
	beq _021EF766
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0x7c]
	bl ov100_021E7334
	add r5, r0, #0
	add r0, r4, #0
	add r1, r5, #0
	bl ov101_021EF6D0
	cmp r0, #0
	bne _021EF754
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
_021EF754:
	add r0, r4, #0
	add r1, r5, #0
	bl ov101_021EF50C
	ldr r0, _021EF7CC ; =0x00000941
	bl PlaySE
	mov r0, #8
	pop {r3, r4, r5, pc}
_021EF766:
	mov r3, #0x20
	tst r3, r0
	beq _021EF77E
	ldr r0, [r4, #0xc]
	mov r1, #0
	ldr r0, [r0, #0x7c]
	bl ov100_021E73AC
	ldr r0, _021EF7D0 ; =0x0000093F
	bl PlaySE
	b _021EF7C2
_021EF77E:
	mov r3, #0x10
	tst r3, r0
	beq _021EF794
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0x7c]
	bl ov100_021E73AC
	ldr r0, _021EF7D0 ; =0x0000093F
	bl PlaySE
	b _021EF7C2
_021EF794:
	mov r1, #0x40
	tst r1, r0
	beq _021EF7AC
	ldr r0, [r4, #0xc]
	add r1, r2, #0
	ldr r0, [r0, #0x7c]
	bl ov100_021E73AC
	ldr r0, _021EF7D0 ; =0x0000093F
	bl PlaySE
	b _021EF7C2
_021EF7AC:
	mov r1, #0x80
	tst r0, r1
	beq _021EF7C2
	ldr r0, [r4, #0xc]
	mov r1, #3
	ldr r0, [r0, #0x7c]
	bl ov100_021E73AC
	ldr r0, _021EF7D0 ; =0x0000093F
	bl PlaySE
_021EF7C2:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021EF7C8: .word gSystem
_021EF7CC: .word 0x00000941
_021EF7D0: .word 0x0000093F
	thumb_func_end ov101_021EF6E4

	thumb_func_start ov101_021EF7D4
ov101_021EF7D4: ; 0x021EF7D4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	bl ov100_021E5924
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _021EF83C
	ldr r0, _021EF840 ; =ov101_021F83E4
	bl sub_02025224
	add r4, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	beq _021EF83C
	lsl r1, r4, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl ov101_021EF6D0
	cmp r0, #0
	bne _021EF80A
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
_021EF80A:
	ldr r0, [r5, #0xc]
	ldrb r0, [r0, #6]
	cmp r0, #1
	bne _021EF818
	add r0, r5, #0
	bl ov101_021EF4DC
_021EF818:
	ldr r0, [r5, #0xc]
	lsl r1, r4, #0x18
	ldr r0, [r0, #0x7c]
	lsr r1, r1, #0x18
	bl ov100_021E73C8
	lsl r1, r4, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl ov101_021EF50C
	ldr r0, _021EF844 ; =0x00000941
	bl PlaySE
	ldr r0, [r5, #0xc]
	mov r1, #1
	str r1, [r0, #0xc]
	mov r0, #8
_021EF83C:
	pop {r3, r4, r5, pc}
	nop
_021EF840: .word ov101_021F83E4
_021EF844: .word 0x00000941
	thumb_func_end ov101_021EF7D4

	thumb_func_start ov101_021EF848
ov101_021EF848: ; 0x021EF848
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl OverlayManager_GetParentWork
	add r5, r0, #0
	mov r0, #3
	mov r1, #0x5b
	lsl r2, r0, #0x10
	bl CreateHeap
	mov r1, #0x51
	add r0, r4, #0
	lsl r1, r1, #4
	mov r2, #0x5b
	bl OverlayManager_CreateAndGetData
	mov r2, #0x51
	add r4, r0, #0
	mov r1, #0
	lsl r2, r2, #4
	bl memset
	mov r1, #0
	str r5, [r4, #0xc]
	mov r0, #0x5b
	str r0, [r4]
	mov r0, #0x37
	add r2, r1, #0
	bl sub_02004EC4
	add r0, r4, #0
	bl ov101_021EF96C
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov101_021EF848

	thumb_func_start ov101_021EF890
ov101_021EF890: ; 0x021EF890
	push {r4, lr}
	add r4, r1, #0
	bl OverlayManager_GetData
	ldr r1, [r4]
	cmp r1, #0xe
	bhi _021EF93C
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021EF8AA: ; jump table
	.short _021EF8C8 - _021EF8AA - 2 ; case 0
	.short _021EF8D0 - _021EF8AA - 2 ; case 1
	.short _021EF8D8 - _021EF8AA - 2 ; case 2
	.short _021EF900 - _021EF8AA - 2 ; case 3
	.short _021EF910 - _021EF8AA - 2 ; case 4
	.short _021EF8F8 - _021EF8AA - 2 ; case 5
	.short _021EF908 - _021EF8AA - 2 ; case 6
	.short _021EF8E0 - _021EF8AA - 2 ; case 7
	.short _021EF8E8 - _021EF8AA - 2 ; case 8
	.short _021EF8F0 - _021EF8AA - 2 ; case 9
	.short _021EF918 - _021EF8AA - 2 ; case 10
	.short _021EF920 - _021EF8AA - 2 ; case 11
	.short _021EF928 - _021EF8AA - 2 ; case 12
	.short _021EF930 - _021EF8AA - 2 ; case 13
	.short _021EF938 - _021EF8AA - 2 ; case 14
_021EF8C8:
	bl ov101_021EFA24
	str r0, [r4]
	b _021EF93C
_021EF8D0:
	bl ov101_021EFA48
	str r0, [r4]
	b _021EF93C
_021EF8D8:
	bl ov101_021EFAA4
	str r0, [r4]
	b _021EF93C
_021EF8E0:
	bl ov101_021EFAB8
	str r0, [r4]
	b _021EF93C
_021EF8E8:
	bl ov101_021EFAC0
	str r0, [r4]
	b _021EF93C
_021EF8F0:
	bl ov101_021EFAC8
	str r0, [r4]
	b _021EF93C
_021EF8F8:
	bl ov101_021EFAD0
	str r0, [r4]
	b _021EF93C
_021EF900:
	bl ov101_021EFADC
	str r0, [r4]
	b _021EF93C
_021EF908:
	bl ov101_021EFAE8
	str r0, [r4]
	b _021EF93C
_021EF910:
	bl ov101_021EFB08
	str r0, [r4]
	b _021EF93C
_021EF918:
	bl ov101_021EFB4C
	str r0, [r4]
	b _021EF93C
_021EF920:
	bl ov101_021EFB70
	str r0, [r4]
	b _021EF93C
_021EF928:
	bl ov101_021EFBD0
	str r0, [r4]
	b _021EF93C
_021EF930:
	bl ov101_021EFC58
	str r0, [r4]
	b _021EF93C
_021EF938:
	mov r0, #1
	pop {r4, pc}
_021EF93C:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov101_021EF890

	thumb_func_start ov101_021EF940
ov101_021EF940: ; 0x021EF940
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	bl ov101_021EFA04
	ldr r2, [r4, #0xc]
	mov r0, #0x80
	ldrb r1, [r2, #5]
	orr r0, r1
	strb r0, [r2, #5]
	ldr r4, [r4]
	add r0, r5, #0
	bl OverlayManager_FreeData
	add r0, r4, #0
	bl DestroyHeap
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov101_021EF940

	thumb_func_start ov101_021EF96C
ov101_021EF96C: ; 0x021EF96C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	ldr r1, _021EFA00 ; =ov101_021F0944
	str r4, [r0, #0x64]
	ldr r0, [r4, #0xc]
	str r1, [r0, #0x5c]
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0x28]
	bl sub_0202EE7C
	strb r0, [r4, #0x11]
	ldr r0, [r4, #0xc]
	ldr r1, [r4]
	ldr r0, [r0, #0x28]
	bl GSPlayerMisc_AllocAndCopyPhonebook
	add r1, r4, #0
	add r1, #0xd0
	str r0, [r1]
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0x28]
	bl GSPlayerMisc_FindEmptyGearPhonebookSlot
	add r1, r4, #0
	add r1, #0xcd
	strb r0, [r1]
	add r0, r4, #0
	bl ov101_021F0D6C
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0x20]
	ldrb r0, [r0]
	cmp r0, #1
	bne _021EF9E6
	add r0, r4, #0
	mov r1, #1
	add r0, #0xcb
	strb r1, [r0]
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0x20]
	ldrb r1, [r0, #4]
	add r0, r4, #0
	add r0, #0xc8
	strb r1, [r0]
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0x20]
	ldrb r1, [r0, #5]
	add r0, r4, #0
	add r0, #0xc9
	strb r1, [r0]
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0x20]
	ldrb r1, [r0, #6]
	add r0, r4, #0
	add r0, #0xca
	strb r1, [r0]
	ldr r0, [r4, #0xc]
	mov r1, #0
	strb r1, [r0, #6]
	pop {r4, pc}
_021EF9E6:
	add r0, r4, #0
	mov r1, #0
	add r0, #0xcb
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0xc8
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0xc9
	strb r1, [r0]
	add r4, #0xca
	strb r1, [r4]
	pop {r4, pc}
	.balign 4, 0
_021EFA00: .word ov101_021F0944
	thumb_func_end ov101_021EF96C

	thumb_func_start ov101_021EFA04
ov101_021EFA04: ; 0x021EFA04
	push {r4, lr}
	add r4, r0, #0
	bl ov101_021F0D90
	add r0, r4, #0
	add r0, #0xd0
	ldr r0, [r0]
	bl FreeToHeap
	ldr r0, [r4, #0xc]
	mov r1, #0
	str r1, [r0, #0x5c]
	ldr r0, [r4, #0xc]
	str r1, [r0, #0x60]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov101_021EFA04

	thumb_func_start ov101_021EFA24
ov101_021EFA24: ; 0x021EFA24
	push {r4, lr}
	add r4, r0, #0
	bl ov101_021EFD20
	cmp r0, #0
	bne _021EFA34
	mov r0, #0
	pop {r4, pc}
_021EFA34:
	ldr r0, [r4, #0xc]
	ldrb r0, [r0, #5]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1f
	beq _021EFA42
	mov r0, #0xc
	pop {r4, pc}
_021EFA42:
	mov r0, #0xa
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov101_021EFA24

	thumb_func_start ov101_021EFA48
ov101_021EFA48: ; 0x021EFA48
	push {r4, lr}
	add r4, r0, #0
	bl ov101_021F0C4C
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _021EFA78
	ldrb r0, [r4, #0x10]
	cmp r0, #0
	bne _021EFA64
	ldr r0, [r4, #0xc]
	bl ov100_021E5900
_021EFA64:
	ldr r0, [r4, #0xc]
	ldrb r1, [r0, #6]
	cmp r1, #1
	bne _021EFA72
	bl ov100_021E59CC
	b _021EFA78
_021EFA72:
	add r0, r4, #0
	bl ov101_021F0BA0
_021EFA78:
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _021EFA9E
	cmp r0, #4
	beq _021EFA8A
	cmp r0, #8
	beq _021EFA92
	b _021EFA96
_021EFA8A:
	ldr r1, [r4, #0xc]
	str r0, [r1, #0x1c]
	mov r0, #0xb
	pop {r4, pc}
_021EFA92:
	mov r0, #7
	pop {r4, pc}
_021EFA96:
	ldr r1, [r4, #0xc]
	str r0, [r1, #0x1c]
	mov r0, #0xd
	pop {r4, pc}
_021EFA9E:
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov101_021EFA48

	thumb_func_start ov101_021EFAA4
ov101_021EFAA4: ; 0x021EFAA4
	push {r3, lr}
	bl ov101_021EFD7C
	cmp r0, #0
	beq _021EFAB2
	mov r0, #0xe
	pop {r3, pc}
_021EFAB2:
	mov r0, #2
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov101_021EFAA4

	thumb_func_start ov101_021EFAB8
ov101_021EFAB8: ; 0x021EFAB8
	ldr r3, _021EFABC ; =ov101_021EFDB4
	bx r3
	.balign 4, 0
_021EFABC: .word ov101_021EFDB4
	thumb_func_end ov101_021EFAB8

	thumb_func_start ov101_021EFAC0
ov101_021EFAC0: ; 0x021EFAC0
	ldr r3, _021EFAC4 ; =ov101_021EFE1C
	bx r3
	.balign 4, 0
_021EFAC4: .word ov101_021EFE1C
	thumb_func_end ov101_021EFAC0

	thumb_func_start ov101_021EFAC8
ov101_021EFAC8: ; 0x021EFAC8
	ldr r3, _021EFACC ; =ov101_021EFEC8
	bx r3
	.balign 4, 0
_021EFACC: .word ov101_021EFEC8
	thumb_func_end ov101_021EFAC8

	thumb_func_start ov101_021EFAD0
ov101_021EFAD0: ; 0x021EFAD0
	push {r3, lr}
	bl ov101_021EFFBC
	mov r0, #3
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov101_021EFAD0

	thumb_func_start ov101_021EFADC
ov101_021EFADC: ; 0x021EFADC
	push {r3, lr}
	bl ov101_021EFFC8
	mov r0, #6
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov101_021EFADC

	thumb_func_start ov101_021EFAE8
ov101_021EFAE8: ; 0x021EFAE8
	push {r4, lr}
	add r4, r0, #0
	add r0, #0xc4
	ldr r0, [r0]
	bl ov101_021F26F8
	cmp r0, #0
	bne _021EFAFC
	mov r0, #6
	pop {r4, pc}
_021EFAFC:
	add r0, r4, #0
	bl ov101_021F003C
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov101_021EFAE8

	thumb_func_start ov101_021EFB08
ov101_021EFB08: ; 0x021EFB08
	push {r4, lr}
	add r4, r0, #0
	bl ov101_021F00BC
	cmp r0, #0
	bne _021EFB18
	mov r0, #4
	pop {r4, pc}
_021EFB18:
	add r0, r4, #0
	add r0, #0x48
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r4, #0
	add r0, #0x58
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r4, #0
	add r0, #0x48
	bl CopyWindowToVram
	add r0, r4, #0
	add r0, #0x58
	bl CopyWindowToVram
	mov r0, #0
	bl sub_02002B8C
	add r0, r4, #0
	bl ov101_021F0B84
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ov101_021EFB08

	thumb_func_start ov101_021EFB4C
ov101_021EFB4C: ; 0x021EFB4C
	push {r4, lr}
	add r4, r0, #0
	bl ov101_021EFF14
	cmp r0, #0
	beq _021EFB6C
	mov r0, #0
	str r0, [r4, #4]
	add r4, #0xcb
	ldrb r0, [r4]
	cmp r0, #0
	beq _021EFB68
	mov r0, #3
	pop {r4, pc}
_021EFB68:
	mov r0, #1
	pop {r4, pc}
_021EFB6C:
	mov r0, #0xa
	pop {r4, pc}
	thumb_func_end ov101_021EFB4C

	thumb_func_start ov101_021EFB70
ov101_021EFB70: ; 0x021EFB70
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _021EFB82
	cmp r0, #1
	beq _021EFBA2
	b _021EFBC8
_021EFB82:
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
	b _021EFBC8
_021EFBA2:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021EFBC8
	mov r4, #0
	add r6, r4, #0
_021EFBAE:
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	add r1, r6, #0
	bl ToggleBgLayer
	add r4, r4, #1
	cmp r4, #8
	blt _021EFBAE
	mov r0, #0
	str r0, [r5, #4]
	add sp, #0xc
	mov r0, #2
	pop {r3, r4, r5, r6, pc}
_021EFBC8:
	mov r0, #0xb
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov101_021EFB70

	thumb_func_start ov101_021EFBD0
ov101_021EFBD0: ; 0x021EFBD0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _021EFBE4
	cmp r0, #1
	beq _021EFC2A
	cmp r0, #2
	beq _021EFC3E
	b _021EFC54
_021EFBE4:
	ldr r0, [r5, #0xc]
	mov r1, #1
	ldr r0, [r0, #0x78]
	bl sub_02003B50
	mov r0, #0
	mov r1, #0xe
	mov r2, #1
	bl SetBlendBrightness
	mov r6, #1
	mov r4, #0
	add r7, r6, #0
_021EFBFE:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	add r1, r6, #0
	bl ToggleBgLayer
	add r0, r4, #5
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	add r1, r7, #0
	bl ToggleBgLayer
	add r4, r4, #1
	cmp r4, #3
	blt _021EFBFE
	ldr r0, [r5, #0xc]
	mov r1, #0
	strb r1, [r0, #9]
	ldr r0, [r5, #4]
	add r0, r0, #1
	str r0, [r5, #4]
	b _021EFC54
_021EFC2A:
	ldr r0, [r5, #0xc]
	mov r1, #0
	bl ov100_021E5D3C
	cmp r0, #0
	beq _021EFC54
	ldr r0, [r5, #4]
	add r0, r0, #1
	str r0, [r5, #4]
	b _021EFC54
_021EFC3E:
	ldr r0, [r5, #0xc]
	mov r1, #0
	ldr r0, [r0, #0x78]
	bl sub_02003B50
	ldr r0, [r5, #0xc]
	mov r1, #0
	strb r1, [r0, #9]
	str r1, [r5, #4]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021EFC54:
	mov r0, #0xc
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov101_021EFBD0

	thumb_func_start ov101_021EFC58
ov101_021EFC58: ; 0x021EFC58
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #3
	bhi _021EFD1A
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021EFC70: ; jump table
	.short _021EFC78 - _021EFC70 - 2 ; case 0
	.short _021EFC90 - _021EFC70 - 2 ; case 1
	.short _021EFCA4 - _021EFC70 - 2 ; case 2
	.short _021EFD02 - _021EFC70 - 2 ; case 3
_021EFC78:
	ldr r0, [r4, #0xc]
	mov r1, #1
	ldr r0, [r0, #0x78]
	bl sub_02003B50
	ldr r0, [r4, #0xc]
	mov r1, #0
	strb r1, [r0, #9]
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _021EFD1A
_021EFC90:
	ldr r0, [r4, #0xc]
	mov r1, #1
	bl ov100_021E5D3C
	cmp r0, #0
	beq _021EFD1A
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _021EFD1A
_021EFCA4:
	mov r0, #0x10
	mov r1, #0
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r4, #0xc]
	add r2, r1, #0
	ldr r0, [r0, #0x78]
	mov r3, #0xe0
	bl sub_02003E5C
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, [r4, #0xc]
	mov r1, #2
	ldr r0, [r0, #0x78]
	mov r2, #0x40
	mov r3, #0xc0
	bl sub_02003E5C
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0x78]
	bl sub_0200398C
	mov r5, #0
	add r6, r5, #0
	add r7, r5, #0
_021EFCDC:
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	add r1, r6, #0
	bl ToggleBgLayer
	add r0, r5, #5
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	add r1, r7, #0
	bl ToggleBgLayer
	add r5, r5, #1
	cmp r5, #3
	blt _021EFCDC
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _021EFD1A
_021EFD02:
	ldr r0, [r4, #0xc]
	mov r1, #0
	ldr r0, [r0, #0x78]
	bl sub_02003B50
	ldr r0, [r4, #0xc]
	mov r1, #0
	strb r1, [r0, #9]
	add sp, #8
	str r1, [r4, #4]
	mov r0, #2
	pop {r3, r4, r5, r6, r7, pc}
_021EFD1A:
	mov r0, #0xd
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov101_021EFC58

	thumb_func_start ov101_021EFD20
ov101_021EFD20: ; 0x021EFD20
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _021EFD30
	cmp r1, #1
	beq _021EFD54
	b _021EFD72
_021EFD30:
	bl ov101_021F017C
	add r0, r4, #0
	bl ov101_021F0284
	add r0, r4, #0
	bl ov101_021F0578
	add r0, r4, #0
	bl ov101_021F05EC
	add r0, r4, #0
	bl ov101_021F072C
	add r0, r4, #0
	bl ov101_021F0388
	b _021EFD72
_021EFD54:
	bl ov101_021F075C
	add r0, r4, #0
	bl ov101_021F0880
	add r0, r4, #0
	bl ov101_021F0694
	add r0, r4, #0
	bl ov101_021F0900
	mov r0, #0
	str r0, [r4, #8]
	mov r0, #1
	pop {r4, pc}
_021EFD72:
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov101_021EFD20

	thumb_func_start ov101_021EFD7C
ov101_021EFD7C: ; 0x021EFD7C
	push {r4, lr}
	add r4, r0, #0
	bl ov101_021F08DC
	add r0, r4, #0
	bl ov101_021F0720
	add r0, r4, #0
	bl ov101_021F0864
	add r0, r4, #0
	bl ov101_021F0748
	add r0, r4, #0
	bl ov101_021F0658
	add r0, r4, #0
	bl ov101_021F05CC
	add r0, r4, #0
	bl ov101_021F0370
	add r0, r4, #0
	bl ov101_021F0260
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov101_021EFD7C

	thumb_func_start ov101_021EFDB4
ov101_021EFDB4: ; 0x021EFDB4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _021EFE18 ; =0x00000504
	ldr r0, [r5, r0]
	bl sub_020186A4
	add r4, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	beq _021EFE14
	ldr r0, _021EFE18 ; =0x00000504
	ldr r0, [r5, r0]
	bl sub_02018674
	ldr r1, [r5, #0xc]
	str r0, [r1, #0xc]
	ldr r0, _021EFE18 ; =0x00000504
	ldr r0, [r5, r0]
	bl sub_02018680
	cmp r4, #1
	bne _021EFDF8
	add r0, r5, #0
	add r0, #0xe0
	bl ov101_021F1804
	add r1, r0, #0
	add r0, r5, #0
	mov r2, #1
	bl ov101_021F09B0
	mov r0, #8
	pop {r3, r4, r5, pc}
_021EFDF8:
	mov r1, #0
	add r0, r5, #0
	add r2, r1, #0
	bl ov101_021F0ACC
	cmp r4, #0
	bne _021EFE0A
	mov r0, #5
	pop {r3, r4, r5, pc}
_021EFE0A:
	add r0, r5, #0
	bl ov101_021F0B84
	mov r0, #1
	pop {r3, r4, r5, pc}
_021EFE14:
	mov r0, #7
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021EFE18: .word 0x00000504
	thumb_func_end ov101_021EFDB4

	thumb_func_start ov101_021EFE1C
ov101_021EFE1C: ; 0x021EFE1C
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, _021EFEC0 ; =0x00000504
	ldr r0, [r4, r0]
	bl sub_020186A4
	add r5, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r5, r0
	bne _021EFE36
	mov r0, #8
	pop {r3, r4, r5, pc}
_021EFE36:
	ldr r0, _021EFEC0 ; =0x00000504
	ldr r0, [r4, r0]
	bl sub_02018674
	ldr r1, [r4, #0xc]
	str r0, [r1, #0xc]
	ldr r0, _021EFEC0 ; =0x00000504
	ldr r0, [r4, r0]
	bl sub_02018680
	cmp r5, #4
	bhi _021EFEAC
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021EFE5A: ; jump table
	.short _021EFE64 - _021EFE5A - 2 ; case 0
	.short _021EFE64 - _021EFE5A - 2 ; case 1
	.short _021EFE64 - _021EFE5A - 2 ; case 2
	.short _021EFE82 - _021EFE5A - 2 ; case 3
	.short _021EFEAC - _021EFE5A - 2 ; case 4
_021EFE64:
	lsl r1, r5, #0x18
	add r0, r4, #0
	lsr r1, r1, #0x18
	bl ov101_021F0EB0
	mov r1, #0
	add r0, r4, #0
	add r2, r1, #0
	bl ov101_021F0ACC
	add r0, r4, #0
	bl ov101_021F0B84
	mov r0, #1
	pop {r3, r4, r5, pc}
_021EFE82:
	mov r1, #1
	add r0, r4, #0
	add r2, r1, #0
	bl ov101_021F0ACC
	add r0, r4, #0
	add r0, #0xe0
	mov r1, #1
	bl ov101_021F13C8
	add r0, r4, #0
	add r0, #0xe0
	mov r1, #0xff
	mov r2, #0
	bl ov101_021F1290
	ldr r1, _021EFEC4 ; =ov101_021F0978
	ldr r0, [r4, #0xc]
	str r1, [r0, #0x5c]
	mov r0, #9
	pop {r3, r4, r5, pc}
_021EFEAC:
	mov r1, #0
	add r0, r4, #0
	add r2, r1, #0
	bl ov101_021F0ACC
	add r0, r4, #0
	bl ov101_021F0B84
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021EFEC0: .word 0x00000504
_021EFEC4: .word ov101_021F0978
	thumb_func_end ov101_021EFE1C

	thumb_func_start ov101_021EFEC8
ov101_021EFEC8: ; 0x021EFEC8
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _021EFED8
	cmp r1, #1
	beq _021EFEE0
	b _021EFF0A
_021EFED8:
	bl ov101_021F0CE4
	str r0, [r4, #8]
	b _021EFF0A
_021EFEE0:
	add r0, #0xe0
	mov r1, #0
	bl ov101_021F13C8
	mov r1, #0
	add r0, r4, #0
	add r2, r1, #0
	bl ov101_021F0ACC
	add r0, r4, #0
	add r0, #0xe0
	mov r1, #1
	bl ov101_021F1338
	ldr r1, _021EFF10 ; =ov101_021F0944
	ldr r0, [r4, #0xc]
	str r1, [r0, #0x5c]
	mov r0, #0
	str r0, [r4, #8]
	mov r0, #1
	pop {r4, pc}
_021EFF0A:
	mov r0, #9
	pop {r4, pc}
	nop
_021EFF10: .word ov101_021F0944
	thumb_func_end ov101_021EFEC8

	thumb_func_start ov101_021EFF14
ov101_021EFF14: ; 0x021EFF14
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, [r5, #8]
	cmp r0, #0
	beq _021EFF26
	cmp r0, #1
	beq _021EFFA4
	b _021EFFB6
_021EFF26:
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
	add r0, r5, #0
	add r0, #0xcb
	ldrb r0, [r0]
	cmp r0, #0
	beq _021EFF6C
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r0, [r5, #0xc]
	mov r2, #0xb0
	ldr r0, [r0, #0x78]
	mov r3, #0x30
	bl sub_02003E5C
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [r5, #0xc]
	mov r1, #2
	ldr r0, [r0, #0x78]
	mov r2, #0x40
	mov r3, #0xc0
	bl sub_02003E5C
_021EFF6C:
	add r1, r5, #0
	add r1, #0xcb
	ldrb r1, [r1]
	add r0, r5, #0
	bl ov101_021F0464
	mov r4, #0
	mov r6, #1
_021EFF7C:
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	add r1, r6, #0
	bl ToggleBgLayer
	add r4, r4, #1
	cmp r4, #8
	blt _021EFF7C
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _021EFFB6
_021EFFA4:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021EFFB6
	mov r0, #0
	str r0, [r5, #8]
	add sp, #0xc
	mov r0, #1
	pop {r3, r4, r5, r6, pc}
_021EFFB6:
	mov r0, #0
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov101_021EFF14

	thumb_func_start ov101_021EFFBC
ov101_021EFFBC: ; 0x021EFFBC
	push {r3, lr}
	mov r1, #1
	bl ov101_021F0464
	mov r0, #1
	pop {r3, pc}
	thumb_func_end ov101_021EFFBC

	thumb_func_start ov101_021EFFC8
ov101_021EFFC8: ; 0x021EFFC8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0xcb
	ldrb r2, [r0]
	cmp r2, #0
	beq _021F0004
	add r0, r5, #0
	add r0, #0xca
	ldrb r0, [r0]
	add r1, r5, #0
	add r3, r5, #0
	str r0, [sp]
	add r0, r5, #0
	add r1, #0xc8
	add r3, #0xc9
	add r0, #0xc4
	ldrb r1, [r1]
	ldrb r3, [r3]
	ldr r0, [r0]
	bl ov101_021F1F64
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #0
	add r0, #0xcb
	strb r1, [r0]
	ldr r0, [r5, #0xc]
	ldr r0, [r0, #0x20]
	strb r1, [r0]
	b _021F001A
_021F0004:
	mov r3, #0
	add r1, r5, #0
	add r0, r5, #0
	str r3, [sp]
	add r1, #0xc8
	add r0, #0xc4
	ldrb r1, [r1]
	ldr r0, [r0]
	bl ov101_021F1F64
	add r4, r0, #0
_021F001A:
	cmp r4, #0
	beq _021F0026
	add r5, #0xc4
	ldr r0, [r5]
	bl ov101_021F1FF4
_021F0026:
	mov r0, #1
	bl sub_02002B8C
	ldr r0, _021F0038 ; =ov101_021F8400
	bl sub_02002C20
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_021F0038: .word ov101_021F8400
	thumb_func_end ov101_021EFFC8

	thumb_func_start ov101_021F003C
ov101_021F003C: ; 0x021F003C
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x48
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r4, #0
	add r0, #0x58
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r4, #0
	add r0, #0x48
	bl CopyWindowToVram
	add r0, r4, #0
	add r0, #0x58
	bl CopyWindowToVram
	mov r0, #0
	bl sub_02002B8C
	bl sub_02002C40
	add r0, r4, #0
	mov r1, #0
	bl ov101_021F0464
	add r0, r4, #0
	bl ov101_021F0B84
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov101_021F003C

	thumb_func_start ov101_021F0080
ov101_021F0080: ; 0x021F0080
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	ldr r1, [r4, #8]
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x20]
	add r1, #0x21
	bl ReadMsgDataIntoString
	mov r1, #0
	str r1, [sp]
	ldr r0, _021F00B4 ; =0x00010200
	str r1, [sp, #4]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	add r0, r4, #0
	ldr r2, [r4, #0x20]
	add r0, #0x48
	add r3, r1, #0
	bl AddTextPrinterParameterized2
	ldr r0, _021F00B8 ; =0x000005F3
	bl PlaySE
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
_021F00B4: .word 0x00010200
_021F00B8: .word 0x000005F3
	thumb_func_end ov101_021F0080

	thumb_func_start ov101_021F00BC
ov101_021F00BC: ; 0x021F00BC
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	ldr r1, [r4, #8]
	cmp r1, #3
	bhi _021F0136
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021F00D4: ; jump table
	.short _021F00DC - _021F00D4 - 2 ; case 0
	.short _021F0106 - _021F00D4 - 2 ; case 1
	.short _021F011E - _021F00D4 - 2 ; case 2
	.short _021F011E - _021F00D4 - 2 ; case 3
_021F00DC:
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x20]
	add r1, #0x21
	bl ReadMsgDataIntoString
	mov r1, #0
	str r1, [sp]
	ldr r0, _021F0170 ; =0x00010200
	str r1, [sp, #4]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	add r0, r4, #0
	ldr r2, [r4, #0x20]
	add r0, #0x48
	add r3, r1, #0
	bl AddTextPrinterParameterized2
	ldr r0, _021F0174 ; =0x000005DC
	bl PlaySE
	b _021F0162
_021F0106:
	ldr r0, _021F0174 ; =0x000005DC
	bl IsSEPlaying
	cmp r0, #0
	beq _021F0116
	add sp, #0x10
	mov r0, #0
	pop {r4, pc}
_021F0116:
	add r0, r4, #0
	bl ov101_021F0080
	b _021F0162
_021F011E:
	ldr r0, _021F0178 ; =0x000005F3
	bl IsSEPlaying
	cmp r0, #0
	beq _021F012E
	add sp, #0x10
	mov r0, #0
	pop {r4, pc}
_021F012E:
	add r0, r4, #0
	bl ov101_021F0080
	b _021F0162
_021F0136:
	ldr r0, _021F0178 ; =0x000005F3
	bl IsSEPlaying
	cmp r0, #0
	beq _021F0146
	add sp, #0x10
	mov r0, #0
	pop {r4, pc}
_021F0146:
	add r0, r4, #0
	add r0, #0x48
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r4, #0
	add r0, #0x48
	bl CopyWindowToVram
	mov r0, #0
	str r0, [r4, #8]
	add sp, #0x10
	mov r0, #1
	pop {r4, pc}
_021F0162:
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	mov r0, #0
	add sp, #0x10
	pop {r4, pc}
	nop
_021F0170: .word 0x00010200
_021F0174: .word 0x000005DC
_021F0178: .word 0x000005F3
	thumb_func_end ov101_021F00BC

	thumb_func_start ov101_021F017C
ov101_021F017C: ; 0x021F017C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xac
	mov r1, #0
	add r5, r0, #0
	mov r0, #1
	add r2, r1, #0
	bl GX_SetGraphicsMode
	ldr r4, _021F025C ; =ov101_021F8440
	add r3, sp, #4
	mov r2, #0x15
_021F0192:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021F0192
	mov r3, #0
	str r3, [sp]
	ldr r0, [r5, #0xc]
	mov r1, #1
	ldr r0, [r0, #0x74]
	add r2, sp, #4
	bl InitBgFromTemplateEx
	mov r3, #0
	str r3, [sp]
	ldr r0, [r5, #0xc]
	mov r1, #2
	ldr r0, [r0, #0x74]
	add r2, sp, #0x20
	bl InitBgFromTemplateEx
	mov r3, #0
	str r3, [sp]
	ldr r0, [r5, #0xc]
	mov r1, #3
	ldr r0, [r0, #0x74]
	add r2, sp, #0x3c
	bl InitBgFromTemplateEx
	mov r3, #0
	str r3, [sp]
	ldr r0, [r5, #0xc]
	mov r1, #5
	ldr r0, [r0, #0x74]
	add r2, sp, #0x58
	bl InitBgFromTemplateEx
	mov r3, #0
	str r3, [sp]
	ldr r0, [r5, #0xc]
	mov r1, #6
	ldr r0, [r0, #0x74]
	add r2, sp, #0x74
	bl InitBgFromTemplateEx
	mov r3, #0
	str r3, [sp]
	ldr r0, [r5, #0xc]
	mov r1, #7
	ldr r0, [r0, #0x74]
	add r2, sp, #0x90
	bl InitBgFromTemplateEx
	mov r4, #0
	mov r6, #0x20
	add r7, r4, #0
_021F0200:
	ldr r0, [r5, #0xc]
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
	ldr r0, [r5, #0xc]
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
	add r4, r4, #1
	cmp r4, #3
	blt _021F0200
	mov r0, #0
	mov r1, #1
	bl SetBgPriority
	ldr r0, [r5, #0xc]
	mov r1, #3
	ldr r0, [r0, #0x74]
	add r2, r1, #0
	mov r3, #0x20
	bl BgSetPosTextAndCommit
	add sp, #0xac
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021F025C: .word ov101_021F8440
	thumb_func_end ov101_021F017C

	thumb_func_start ov101_021F0260
ov101_021F0260: ; 0x021F0260
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0
	add r1, r0, #0
	bl SetBgPriority
	ldr r0, [r4, #0xc]
	mov r1, #3
	ldr r0, [r0, #0x74]
	add r2, r1, #0
	mov r3, #0
	bl BgSetPosTextAndCommit
	ldr r0, [r4, #0xc]
	bl ov100_021E5CA4
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov101_021F0260

	thumb_func_start ov101_021F0284
ov101_021F0284: ; 0x021F0284
	push {r4, r5, lr}
	sub sp, #0x1c
	add r5, r0, #0
	ldr r1, [r5]
	mov r0, #4
	bl FontID_Alloc
	ldr r1, [r5]
	mov r0, #0x92
	bl NARC_ctor
	add r4, r0, #0
	ldrb r0, [r5, #0x11]
	add r2, r4, #0
	mov r3, #0x92
	add r0, #0x1c
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0xc]
	ldr r1, [r5]
	ldr r0, [r0, #0x74]
	bl sub_0208820C
	ldrb r0, [r5, #0x11]
	add r2, r4, #0
	mov r3, #0x92
	add r0, #0x10
	str r0, [sp]
	mov r0, #7
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0xc]
	ldr r1, [r5]
	ldr r0, [r0, #0x74]
	bl sub_0208820C
	ldrb r0, [r5, #0x11]
	add r2, r4, #0
	mov r3, #0x92
	add r0, #0x16
	str r0, [sp]
	mov r0, #7
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0xc]
	ldr r1, [r5]
	ldr r0, [r0, #0x74]
	bl sub_0208820C
	ldr r0, [r5]
	ldr r3, _021F0368 ; =0x0000050C
	str r0, [sp]
	ldrb r1, [r5, #0x11]
	add r0, r4, #0
	mov r2, #0
	add r1, #0x22
	add r3, r5, r3
	bl GfGfxLoader_GetScrnDataFromOpenNarc
	ldr r1, _021F036C ; =0x00000508
	mov r2, #0
	str r0, [r5, r1]
	add r0, r1, #4
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
	mov r1, #2
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0xc]
	ldr r0, [r0, #0x74]
	bl CopyToBgTilemapRect
	add r0, r4, #0
	bl NARC_dtor
	ldr r0, [r5, #0xc]
	mov r1, #2
	ldr r0, [r0, #0x74]
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r5, #0xc]
	mov r1, #7
	ldr r0, [r0, #0x74]
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x1c
	pop {r4, r5, pc}
	.balign 4, 0
_021F0368: .word 0x0000050C
_021F036C: .word 0x00000508
	thumb_func_end ov101_021F0284

	thumb_func_start ov101_021F0370
ov101_021F0370: ; 0x021F0370
	push {r3, lr}
	ldr r1, _021F0384 ; =0x00000508
	ldr r0, [r0, r1]
	bl FreeToHeap
	mov r0, #4
	bl FontID_Release
	pop {r3, pc}
	nop
_021F0384: .word 0x00000508
	thumb_func_end ov101_021F0370

	thumb_func_start ov101_021F0388
ov101_021F0388: ; 0x021F0388
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r1, [r5]
	mov r0, #0x92
	bl NARC_ctor
	add r4, r0, #0
	mov r1, #0
	mov r0, #7
	str r1, [sp]
	lsl r0, r0, #6
	str r0, [sp, #4]
	str r1, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, [r5, #0xc]
	ldrb r2, [r5, #0x11]
	ldr r0, [r0, #0x78]
	ldr r3, [r5]
	add r1, r4, #0
	add r2, #0xa
	bl sub_02003220
	mov r0, #1
	str r0, [sp]
	mov r0, #6
	lsl r0, r0, #6
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [r5, #0xc]
	ldrb r2, [r5, #0x11]
	ldr r0, [r0, #0x78]
	ldr r3, [r5]
	add r1, r4, #0
	add r2, r2, #4
	bl sub_02003220
	mov r0, #2
	str r0, [sp]
	mov r0, #0x16
	lsl r0, r0, #4
	str r0, [sp, #4]
	mov r0, #0x40
	str r0, [sp, #8]
	mov r2, #0
	str r2, [sp, #0xc]
	ldr r0, [r5, #0xc]
	ldr r3, [r5]
	ldr r0, [r0, #0x78]
	add r1, r4, #0
	bl sub_02003220
	mov r0, #3
	str r0, [sp]
	mov r0, #0x16
	lsl r0, r0, #4
	str r0, [sp, #4]
	mov r0, #0x40
	str r0, [sp, #8]
	mov r2, #0
	str r2, [sp, #0xc]
	ldr r0, [r5, #0xc]
	ldr r3, [r5]
	ldr r0, [r0, #0x78]
	add r1, r4, #0
	bl sub_02003220
	ldr r0, [r5, #0xc]
	mov r1, #1
	ldr r0, [r0, #0x78]
	bl sub_02003B50
	mov r0, #0x10
	mov r1, #0
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r5, #0xc]
	add r2, r1, #0
	ldr r0, [r0, #0x78]
	mov r3, #0xe0
	bl sub_02003E5C
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, [r5, #0xc]
	mov r1, #2
	ldr r0, [r0, #0x78]
	mov r2, #0x40
	mov r3, #0xc0
	bl sub_02003E5C
	ldr r0, [r5, #0xc]
	ldr r0, [r0, #0x78]
	bl sub_0200398C
	ldr r0, [r5, #0xc]
	mov r1, #0
	ldr r0, [r0, #0x78]
	bl sub_02003B50
	add r0, r4, #0
	bl NARC_dtor
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov101_021F0388

	thumb_func_start ov101_021F0464
ov101_021F0464: ; 0x021F0464
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r0, #0xbc
	ldr r0, [r0]
	add r4, r1, #0
	bl Set2dSpriteVisibleFlag
	add r0, r5, #0
	add r0, #0x48
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r5, #0
	add r0, #0x58
	mov r1, #0
	bl FillWindowPixelBuffer
	cmp r4, #0
	beq _021F0508
	mov r0, #8
	mov r1, #0
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r5, #0xc]
	add r2, r1, #0
	ldr r0, [r0, #0x78]
	mov r3, #0xb0
	bl sub_02003E5C
	mov r0, #8
	str r0, [sp]
	mov r1, #0
	str r1, [sp, #4]
	ldr r0, [r5, #0xc]
	mov r2, #0xe0
	ldr r0, [r0, #0x78]
	mov r3, #0x20
	bl sub_02003E5C
	mov r0, #8
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, [r5, #0xc]
	mov r1, #2
	ldr r0, [r0, #0x78]
	mov r2, #0x60
	mov r3, #0x20
	bl sub_02003E5C
	mov r0, #8
	str r0, [sp]
	mov r2, #0
	str r2, [sp, #4]
	ldr r0, [r5, #0xc]
	mov r1, #2
	ldr r0, [r0, #0x78]
	mov r3, #0x40
	bl sub_02003E5C
	add r1, r5, #0
	add r0, r5, #0
	add r1, #0xc8
	add r0, #0xc4
	ldrb r1, [r1]
	ldr r0, [r0]
	bl PhoneContact_GetName
	mov r1, #0
	add r2, r0, #0
	str r1, [sp]
	ldr r0, _021F0574 ; =0x00010200
	str r1, [sp, #4]
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0x58
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	b _021F0552
_021F0508:
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r0, [r5, #0xc]
	add r2, r1, #0
	ldr r0, [r0, #0x78]
	mov r3, #0xe0
	bl sub_02003E5C
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r0, [r5, #0xc]
	mov r2, #0xe0
	ldr r0, [r0, #0x78]
	mov r3, #0x20
	bl sub_02003E5C
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [r5, #0xc]
	mov r1, #2
	ldr r0, [r0, #0x78]
	mov r2, #0x40
	mov r3, #0xc0
	bl sub_02003E5C
	mov r2, #0
	str r2, [sp]
	str r2, [sp, #4]
	ldr r0, [r5, #0xc]
	mov r1, #2
	ldr r0, [r0, #0x78]
	mov r3, #0x40
	bl sub_02003E5C
_021F0552:
	ldr r0, [r5, #0xc]
	mov r1, #1
	ldr r0, [r0, #0x78]
	bl sub_02003B50
	ldr r0, [r5, #0xc]
	ldr r0, [r0, #0x78]
	bl sub_0200398C
	ldr r0, [r5, #0xc]
	mov r1, #0
	ldr r0, [r0, #0x78]
	bl sub_02003B50
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_021F0574: .word 0x00010200
	thumb_func_end ov101_021F0464

	thumb_func_start ov101_021F0578
ov101_021F0578: ; 0x021F0578
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r7, r0, #0
	add r5, r7, #0
	ldr r4, _021F05C4 ; =ov101_021F8420
	mov r6, #0
	add r5, #0x48
_021F0586:
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
	ldr r0, [r7, #0xc]
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
	cmp r6, #4
	blt _021F0586
	ldr r0, _021F05C8 ; =0x000003E1
	bl sub_020027F0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021F05C4: .word ov101_021F8420
_021F05C8: .word 0x000003E1
	thumb_func_end ov101_021F0578

	thumb_func_start ov101_021F05CC
ov101_021F05CC: ; 0x021F05CC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
	add r5, #0x48
_021F05D4:
	add r0, r5, #0
	bl ClearWindowTilemapAndCopyToVram
	add r0, r5, #0
	bl RemoveWindow
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #4
	blt _021F05D4
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov101_021F05CC

	thumb_func_start ov101_021F05EC
ov101_021F05EC: ; 0x021F05EC
	push {r4, r5, r6, lr}
	add r6, r0, #0
	mov r1, #0x1b
	add r2, r1, #0
	ldr r3, [r6]
	mov r0, #0
	add r2, #0xf4
	bl NewMsgDataFromNarc
	str r0, [r6, #0x14]
	ldr r2, [r6]
	mov r0, #2
	mov r1, #0x20
	bl ScrStrBufs_new_custom
	str r0, [r6, #0x18]
	mov r0, #0xa
	ldr r1, [r6]
	lsl r0, r0, #6
	bl String_ctor
	str r0, [r6, #0x1c]
	mov r0, #0xa
	ldr r1, [r6]
	lsl r0, r0, #6
	bl String_ctor
	str r0, [r6, #0x20]
	mov r4, #0
	add r5, r6, #0
_021F0628:
	add r1, r4, #0
	ldr r0, [r6, #0x14]
	add r1, #0x14
	bl NewString_ReadMsgData
	str r0, [r5, #0x24]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #8
	blt _021F0628
	ldr r0, [r6, #0xc]
	ldr r0, [r0, #0x30]
	bl Options_GetTextFrameDelay
	add r6, #0x44
	strb r0, [r6]
	mov r0, #1
	bl sub_02002BA8
	mov r0, #1
	bl TextFlags_SetCanABSpeedUpPrint
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov101_021F05EC

	thumb_func_start ov101_021F0658
ov101_021F0658: ; 0x021F0658
	push {r4, r5, r6, lr}
	add r6, r0, #0
	mov r4, #0
	add r5, r6, #0
_021F0660:
	ldr r0, [r5, #0x24]
	bl String_dtor
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #8
	blt _021F0660
	ldr r0, [r6, #0x20]
	bl String_dtor
	ldr r0, [r6, #0x1c]
	bl String_dtor
	ldr r0, [r6, #0x18]
	bl ScrStrBufs_delete
	ldr r0, [r6, #0x14]
	bl DestroyMsgData
	mov r0, #0
	bl sub_02002BA8
	mov r0, #0
	bl TextFlags_SetCanABSpeedUpPrint
	pop {r4, r5, r6, pc}
	thumb_func_end ov101_021F0658

	thumb_func_start ov101_021F0694
ov101_021F0694: ; 0x021F0694
	push {r3, r4, lr}
	sub sp, #0x3c
	add r4, r0, #0
	add r0, sp, #0
	mov r1, #0
	mov r2, #0x3c
	bl MI_CpuFill8
	ldr r0, [r4]
	str r0, [sp]
	ldr r0, [r4, #0xc]
	add r0, #0xc
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0xbc
	ldr r0, [r0]
	str r4, [sp, #0xc]
	str r0, [sp, #8]
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0x74]
	str r0, [sp, #0x10]
	add r0, r4, #0
	add r0, #0x48
	str r0, [sp, #0x14]
	add r0, r4, #0
	add r0, #0x58
	str r0, [sp, #0x18]
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0x78]
	str r0, [sp, #0x1c]
	add r0, r4, #0
	add r0, #0x44
	ldrb r1, [r0]
	add r0, sp, #0x20
	strb r1, [r0, #0x18]
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0x20]
	ldrh r1, [r0, #0x10]
	add r0, sp, #0
	strh r1, [r0, #0x34]
	ldr r1, [r4, #0xc]
	ldr r1, [r1, #0x20]
	ldrh r1, [r1, #0x12]
	strh r1, [r0, #0x36]
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0x24]
	str r0, [sp, #0x20]
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0x24]
	bl SaveData_GetMomsSavingsAddr
	str r0, [sp, #0x24]
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0x34]
	str r0, [sp, #0x28]
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0x2c]
	str r0, [sp, #0x2c]
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0x24]
	bl Sav2_SysInfo_RTC_get
	str r0, [sp, #0x30]
	add r0, sp, #0
	bl ov101_021F1D74
	add r4, #0xc4
	str r0, [r4]
	add sp, #0x3c
	pop {r3, r4, pc}
	thumb_func_end ov101_021F0694

	thumb_func_start ov101_021F0720
ov101_021F0720: ; 0x021F0720
	ldr r3, _021F0728 ; =ov101_021F1E80
	add r0, #0xc4
	ldr r0, [r0]
	bx r3
	.balign 4, 0
_021F0728: .word ov101_021F1E80
	thumb_func_end ov101_021F0720

	thumb_func_start ov101_021F072C
ov101_021F072C: ; 0x021F072C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	mov r1, #3
	bl ov100_021E6978
	ldr r1, [r4, #0xc]
	ldr r0, [r4]
	ldr r1, [r1, #0x78]
	bl sub_02018424
	add r4, #0xc0
	str r0, [r4]
	pop {r4, pc}
	thumb_func_end ov101_021F072C

	thumb_func_start ov101_021F0748
ov101_021F0748: ; 0x021F0748
	push {r4, lr}
	add r4, r0, #0
	add r0, #0xc0
	ldr r0, [r0]
	bl sub_02018474
	ldr r0, [r4, #0xc]
	bl ov100_021E69C8
	pop {r4, pc}
	thumb_func_end ov101_021F0748

	thumb_func_start ov101_021F075C
ov101_021F075C: ; 0x021F075C
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r4, _021F0858 ; =ov101_021F84E8
	mov r7, #0
	add r5, r6, #0
_021F0766:
	ldr r1, [r6, #0xc]
	add r2, r4, #0
	add r0, r1, #0
	add r0, #0x8c
	add r1, #0x90
	ldr r0, [r0]
	ldr r1, [r1]
	bl sub_0200D2B4
	add r1, r5, #0
	add r1, #0x88
	str r0, [r1]
	add r0, r5, #0
	add r0, #0x88
	ldr r0, [r0]
	mov r1, #1
	bl sub_0200DD3C
	add r0, r5, #0
	add r0, #0x88
	ldr r0, [r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add r0, r5, #0
	add r0, #0x88
	ldr r0, [r0]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	add r7, r7, #1
	add r4, #0x28
	add r5, r5, #4
	cmp r7, #5
	ble _021F0766
	add r4, r6, #0
	mov r7, #6
	add r4, #0x18
	mov r5, #0x90
_021F07B4:
	ldr r1, [r6, #0xc]
	ldr r2, _021F085C ; =ov101_021F85D8
	add r0, r1, #0
	add r0, #0x8c
	add r1, #0x90
	ldr r0, [r0]
	ldr r1, [r1]
	bl sub_0200D2B4
	add r1, r4, #0
	add r1, #0x88
	str r0, [r1]
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	mov r1, #0
	bl sub_0200DD3C
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	mov r1, #0
	bl sub_0200DD60
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	mov r1, #0
	bl Set2dSpriteAnimActiveFlag
	add r0, r4, #0
	add r2, r5, #0
	add r0, #0x88
	sub r2, #0x80
	lsl r2, r2, #0x10
	ldr r0, [r0]
	mov r1, #0xc
	asr r2, r2, #0x10
	bl sub_0200DD88
	add r7, r7, #1
	add r4, r4, #4
	add r5, #0x18
	cmp r7, #0xc
	ble _021F07B4
	ldr r1, [r6, #0xc]
	ldr r2, _021F0860 ; =ov101_021F8600
	add r0, r1, #0
	add r0, #0x8c
	add r1, #0x90
	ldr r0, [r0]
	ldr r1, [r1]
	bl sub_0200D2B4
	add r1, r6, #0
	add r1, #0xbc
	str r0, [r1]
	add r0, r6, #0
	add r0, #0xbc
	ldr r0, [r0]
	mov r1, #0
	bl sub_0200DD3C
	add r0, r6, #0
	add r0, #0xbc
	ldr r0, [r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add r6, #0xbc
	ldr r0, [r6]
	mov r1, #0
	bl Set2dSpriteAnimActiveFlag
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F0858: .word ov101_021F84E8
_021F085C: .word ov101_021F85D8
_021F0860: .word ov101_021F8600
	thumb_func_end ov101_021F075C

	thumb_func_start ov101_021F0864
ov101_021F0864: ; 0x021F0864
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
_021F086A:
	add r0, r5, #0
	add r0, #0x88
	ldr r0, [r0]
	bl sub_0200D018
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0xe
	blt _021F086A
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov101_021F0864

	thumb_func_start ov101_021F0880
ov101_021F0880: ; 0x021F0880
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	mov r0, #0
	ldr r5, _021F08D4 ; =ov101_021F8404
	str r0, [sp]
	add r6, r7, #0
_021F088C:
	ldrb r0, [r5]
	ldr r1, [r7]
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1d
	bl ListMenuItems_ctor
	ldr r1, _021F08D8 ; =0x000004E8
	mov r4, #0
	str r0, [r6, r1]
	ldrb r0, [r5]
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1d
	cmp r0, #0
	ble _021F08C4
_021F08A8:
	ldr r0, _021F08D8 ; =0x000004E8
	ldrb r2, [r5, #1]
	ldr r0, [r6, r0]
	ldr r1, [r7, #0x14]
	add r2, r2, r4
	add r3, r4, #0
	bl ListMenuItems_AppendFromMsgData
	ldrb r0, [r5]
	add r4, r4, #1
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1d
	cmp r4, r0
	blt _021F08A8
_021F08C4:
	ldr r0, [sp]
	add r5, r5, #4
	add r0, r0, #1
	add r6, r6, #4
	str r0, [sp]
	cmp r0, #7
	blt _021F088C
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021F08D4: .word ov101_021F8404
_021F08D8: .word 0x000004E8
	thumb_func_end ov101_021F0880

	thumb_func_start ov101_021F08DC
ov101_021F08DC: ; 0x021F08DC
	push {r3, r4, r5, r6, r7, lr}
	mov r4, #0
	ldr r7, _021F08FC ; =0x000004E8
	add r5, r0, #0
	add r6, r4, #0
_021F08E6:
	ldr r0, _021F08FC ; =0x000004E8
	ldr r0, [r5, r0]
	bl ListMenuItems_dtor
	str r6, [r5, r7]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #7
	blt _021F08E6
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F08FC: .word 0x000004E8
	thumb_func_end ov101_021F08DC

	thumb_func_start ov101_021F0900
ov101_021F0900: ; 0x021F0900
	push {r4, lr}
	add r4, r0, #0
	bl ov101_021F0990
	ldr r1, [r4, #0xc]
	ldrb r0, [r1, #6]
	cmp r0, #0
	ldr r0, [r1, #0x7c]
	bne _021F091C
	mov r1, #0
	add r2, r1, #0
	bl ov100_021E7128
	pop {r4, pc}
_021F091C:
	mov r1, #0
	mov r2, #1
	bl ov100_021E7128
	ldr r0, [r4, #0xc]
	bl ov100_021E5DC8
	add r2, r0, #0
	ldr r0, [r4, #0xc]
	mov r1, #0
	ldr r0, [r0, #0x7c]
	bl ov100_021E72F8
	add r4, #0xe0
	add r0, r4, #0
	mov r1, #0xff
	mov r2, #0
	bl ov101_021F1290
	pop {r4, pc}
	thumb_func_end ov101_021F0900

	thumb_func_start ov101_021F0944
ov101_021F0944: ; 0x021F0944
	ldr r3, _021F0950 ; =ov101_021F1290
	add r0, #0xe0
	mov r1, #0xff
	mov r2, #1
	bx r3
	nop
_021F0950: .word ov101_021F1290
	thumb_func_end ov101_021F0944

	thumb_func_start ov101_021F0954
ov101_021F0954: ; 0x021F0954
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	mov r1, #0
	strb r1, [r0, #6]
	add r0, r4, #0
	add r0, #0xe0
	mov r1, #0xff
	mov r2, #1
	bl ov101_021F1290
	ldr r0, [r4, #0xc]
	mov r1, #0
	ldr r0, [r0, #0x7c]
	add r2, r1, #0
	bl ov100_021E7128
	pop {r4, pc}
	thumb_func_end ov101_021F0954

	thumb_func_start ov101_021F0978
ov101_021F0978: ; 0x021F0978
	push {r4, lr}
	add r4, r0, #0
	add r0, #0xe0
	bl ov101_021F1804
	add r4, #0xe0
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #1
	bl ov101_021F1364
	pop {r4, pc}
	thumb_func_end ov101_021F0978

	thumb_func_start ov101_021F0990
ov101_021F0990: ; 0x021F0990
	push {r4, lr}
	add r4, r0, #0
	bl ov101_021F0F48
	add r0, r4, #0
	bl ov101_021F11B0
	add r0, r4, #0
	add r4, #0xe0
	mov r2, #0
	add r1, r4, #0
	add r3, r2, #0
	bl ov101_021F11E0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov101_021F0990

	thumb_func_start ov101_021F09B0
ov101_021F09B0: ; 0x021F09B0
	push {r4, r5, r6, lr}
	sub sp, #0x30
	add r5, r0, #0
	add r0, #0xcc
	strb r1, [r0]
	add r4, r2, #0
	add r0, sp, #0x18
	mov r1, #0
	mov r2, #0x18
	bl MI_CpuFill8
	ldr r0, _021F0A74 ; =ov101_021F8628
	add r2, sp, #0x18
	ldrh r3, [r0]
	add r1, sp, #0x18
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
	lsl r3, r4, #2
	ldr r0, _021F0A78 ; =0x000004E8
	add r6, r5, r3
	ldr r0, [r6, r0]
	str r0, [sp, #0x24]
	ldr r0, [r5, #0xc]
	ldr r0, [r0, #0x74]
	str r0, [sp, #0x28]
	ldr r0, _021F0A7C ; =ov101_021F8404
	ldrb r6, [r0, r3]
	lsl r6, r6, #0x1d
	lsr r6, r6, #0x1d
	strb r6, [r2, #0x14]
	cmp r4, #1
	bne _021F0A36
	ldr r2, _021F0A80 ; =ov101_021F8407
	ldr r4, _021F0A84 ; =ov101_021F8406
	ldrb r2, [r2, r3]
	str r2, [sp]
	ldrb r0, [r0, r3]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1b
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	ldr r0, _021F0A88 ; =ov101_021F0A94
	str r0, [sp, #0xc]
	str r5, [sp, #0x10]
	mov r0, #1
	str r0, [sp, #0x14]
	ldr r2, [r5, #0xc]
	add r0, r5, #0
	ldr r2, [r2, #0xc]
	add r0, #0xc0
	lsl r2, r2, #0x18
	ldrb r3, [r4, r3]
	ldr r0, [r0]
	lsr r2, r2, #0x18
	bl sub_02018648
	b _021F0A68
_021F0A36:
	ldr r2, _021F0A80 ; =ov101_021F8407
	ldr r4, _021F0A84 ; =ov101_021F8406
	ldrb r2, [r2, r3]
	str r2, [sp]
	ldrb r0, [r0, r3]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1b
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	ldr r0, _021F0A8C ; =ov101_021F0AB8
	str r0, [sp, #0xc]
	str r5, [sp, #0x10]
	mov r0, #1
	str r0, [sp, #0x14]
	ldr r2, [r5, #0xc]
	add r0, r5, #0
	ldr r2, [r2, #0xc]
	add r0, #0xc0
	lsl r2, r2, #0x18
	ldrb r3, [r4, r3]
	ldr r0, [r0]
	lsr r2, r2, #0x18
	bl sub_02018648
_021F0A68:
	ldr r1, _021F0A90 ; =0x00000504
	str r0, [r5, r1]
	ldr r0, _021F0A90 ; =0x00000504
	ldr r0, [r5, r0]
	add sp, #0x30
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021F0A74: .word ov101_021F8628
_021F0A78: .word 0x000004E8
_021F0A7C: .word ov101_021F8404
_021F0A80: .word ov101_021F8407
_021F0A84: .word ov101_021F8406
_021F0A88: .word ov101_021F0A94
_021F0A8C: .word ov101_021F0AB8
_021F0A90: .word 0x00000504
	thumb_func_end ov101_021F09B0

	thumb_func_start ov101_021F0A94
ov101_021F0A94: ; 0x021F0A94
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r2, #0
	cmp r3, #0
	beq _021F0AA4
	ldr r0, _021F0AB4 ; =0x00000941
	bl PlaySE
_021F0AA4:
	add r1, r5, #3
	lsl r1, r1, #0x18
	add r0, r4, #0
	lsr r1, r1, #0x18
	mov r2, #1
	bl ov101_021F0ACC
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021F0AB4: .word 0x00000941
	thumb_func_end ov101_021F0A94

	thumb_func_start ov101_021F0AB8
ov101_021F0AB8: ; 0x021F0AB8
	push {r3, lr}
	cmp r3, #0
	beq _021F0AC4
	ldr r0, _021F0AC8 ; =0x00000941
	bl PlaySE
_021F0AC4:
	pop {r3, pc}
	nop
_021F0AC8: .word 0x00000941
	thumb_func_end ov101_021F0AB8

	thumb_func_start ov101_021F0ACC
ov101_021F0ACC: ; 0x021F0ACC
	push {r3, r4, r5, r6, lr}
	sub sp, #0x1c
	add r5, r0, #0
	add r6, r1, #0
	cmp r2, #0
	beq _021F0B48
	ldr r0, _021F0B7C ; =0x0000050C
	mov r1, #0x20
	ldr r0, [r5, r0]
	mov r2, #0
	str r1, [sp]
	mov r1, #4
	str r1, [sp, #4]
	add r1, r0, #0
	add r1, #0xc
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	mov r1, #0x18
	str r1, [sp, #0x10]
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
	ldr r0, [r5, #0xc]
	ldr r0, [r0, #0x74]
	bl CopyToBgTilemapRect
	add r0, r5, #0
	add r0, #0x78
	mov r1, #5
	bl FillWindowPixelBuffer
	add r4, r5, #0
	mov r0, #0
	add r4, #0x24
	lsl r6, r6, #2
	ldr r1, [r4, r6]
	add r2, r0, #0
	bl FontID_String_GetWidth
	mov r1, #1
	lsl r1, r1, #8
	sub r0, r1, r0
	mov r1, #0
	lsr r3, r0, #1
	str r1, [sp]
	ldr r0, _021F0B80 ; =0x00030205
	str r1, [sp, #4]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	add r0, r5, #0
	ldr r2, [r4, r6]
	add r0, #0x78
	bl AddTextPrinterParameterized2
	b _021F0B6C
_021F0B48:
	add r0, #0x78
	bl ClearWindowTilemapAndScheduleTransfer
	mov r0, #0x14
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0x11
	str r0, [sp, #0xc]
	ldr r0, [r5, #0xc]
	mov r2, #0
	ldr r0, [r0, #0x74]
	mov r1, #1
	add r3, r2, #0
	bl FillBgTilemapRect
_021F0B6C:
	ldr r0, [r5, #0xc]
	mov r1, #1
	ldr r0, [r0, #0x74]
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x1c
	pop {r3, r4, r5, r6, pc}
	nop
_021F0B7C: .word 0x0000050C
_021F0B80: .word 0x00030205
	thumb_func_end ov101_021F0ACC

	thumb_func_start ov101_021F0B84
ov101_021F0B84: ; 0x021F0B84
	push {r4, lr}
	add r4, r0, #0
	add r0, #0xe0
	bl ov101_021F1808
	add r0, r4, #0
	add r0, #0xe0
	mov r1, #1
	bl ov101_021F1338
	add r0, r4, #0
	bl ov101_021F0944
	pop {r4, pc}
	thumb_func_end ov101_021F0B84

	thumb_func_start ov101_021F0BA0
ov101_021F0BA0: ; 0x021F0BA0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021F0C44 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #2
	tst r0, r1
	beq _021F0BF2
	ldrb r0, [r4, #0x10]
	cmp r0, #0
	bne _021F0BF2
	ldr r0, [r4, #0xc]
	mov r1, #1
	strb r1, [r0, #6]
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	ldr r0, [r4, #0xc]
	mov r1, #0
	ldr r0, [r0, #0x7c]
	mov r2, #1
	bl ov100_021E7128
	ldr r0, [r4, #0xc]
	bl ov100_021E5DC8
	add r2, r0, #0
	ldr r0, [r4, #0xc]
	mov r1, #0
	ldr r0, [r0, #0x7c]
	bl ov100_021E72F8
	add r4, #0xe0
	add r0, r4, #0
	mov r1, #0xff
	mov r2, #0
	bl ov101_021F1290
	mov r0, #0
	mvn r0, r0
	pop {r4, pc}
_021F0BF2:
	add r0, r4, #0
	add r0, #0xe0
	bl ov101_021F1408
	cmp r0, #0
	blt _021F0C3E
	mov r1, #0xc
	mul r1, r0
	add r0, r4, r1
	add r0, #0xf4
	ldrb r1, [r0]
	add r0, r4, #0
	add r0, #0xc8
	strb r1, [r0]
	ldr r0, _021F0C48 ; =0x00000941
	bl PlaySE
	add r0, r4, #0
	add r0, #0xe0
	mov r1, #0
	bl ov101_021F1338
	add r0, r4, #0
	add r0, #0xe0
	bl ov101_021F1804
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #0
	bl ov101_021F09B0
	add r0, r4, #0
	mov r1, #0
	mov r2, #1
	bl ov101_021F0ACC
	mov r0, #8
	pop {r4, pc}
_021F0C3E:
	mov r0, #0
	mvn r0, r0
	pop {r4, pc}
	.balign 4, 0
_021F0C44: .word gSystem
_021F0C48: .word 0x00000941
	thumb_func_end ov101_021F0BA0

	thumb_func_start ov101_021F0C4C
ov101_021F0C4C: ; 0x021F0C4C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldrb r0, [r5, #0x10]
	cmp r0, #0
	bne _021F0C6C
	ldr r0, [r5, #0xc]
	bl ov100_021E5924
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _021F0C6C
	ldr r1, [r5, #0xc]
	mov r2, #1
	str r2, [r1, #0xc]
	pop {r3, r4, r5, pc}
_021F0C6C:
	add r0, r5, #0
	add r0, #0xe0
	bl ov101_021F16A8
	add r4, r0, #0
	bmi _021F0CD8
	ldr r0, [r5, #0xc]
	ldrb r0, [r0, #6]
	cmp r0, #1
	bne _021F0C86
	add r0, r5, #0
	bl ov101_021F0954
_021F0C86:
	cmp r4, #0
	bne _021F0C90
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
_021F0C90:
	sub r1, r4, #1
	mov r0, #0xc
	mul r0, r1
	add r0, r5, r0
	add r0, #0xf4
	ldrb r1, [r0]
	add r0, r5, #0
	add r0, #0xc8
	strb r1, [r0]
	ldr r0, _021F0CE0 ; =0x00000941
	bl PlaySE
	add r0, r5, #0
	add r0, #0xe0
	mov r1, #0
	bl ov101_021F1338
	add r0, r5, #0
	add r0, #0xe0
	bl ov101_021F1804
	add r1, r0, #0
	add r0, r5, #0
	mov r2, #0
	bl ov101_021F09B0
	add r0, r5, #0
	mov r1, #0
	mov r2, #1
	bl ov101_021F0ACC
	ldr r0, [r5, #0xc]
	mov r1, #1
	str r1, [r0, #0xc]
	mov r0, #8
	pop {r3, r4, r5, pc}
_021F0CD8:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
	nop
_021F0CE0: .word 0x00000941
	thumb_func_end ov101_021F0C4C

	thumb_func_start ov101_021F0CE4
ov101_021F0CE4: ; 0x021F0CE4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0
	str r0, [sp]
	add r0, r5, #0
	add r0, #0xe0
	add r1, sp, #0
	bl ov101_021F1768
	add r4, r0, #0
	ldr r0, [sp]
	cmp r0, #0
	bne _021F0D16
	ldrb r0, [r5, #0x10]
	cmp r0, #0
	bne _021F0D0A
	ldr r0, [r5, #0xc]
	bl ov100_021E5900
_021F0D0A:
	add r0, r5, #0
	add r0, #0xe0
	bl ov101_021F1564
	add r4, r0, #0
	b _021F0D1C
_021F0D16:
	ldr r0, [r5, #0xc]
	mov r1, #1
	str r1, [r0, #0xc]
_021F0D1C:
	cmp r4, #0
	bge _021F0D24
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F0D24:
	add r0, r5, #0
	add r0, #0xe2
	ldrb r2, [r0]
	cmp r4, r2
	bne _021F0D32
	mov r0, #1
	pop {r3, r4, r5, pc}
_021F0D32:
	mov r1, #0xc
	mul r1, r2
	add r1, r5, r1
	add r1, #0xf0
	lsl r2, r4, #0x18
	ldr r1, [r1]
	add r0, r5, #0
	lsr r2, r2, #0x18
	bl ov101_021F0E0C
	add r0, r5, #0
	add r0, #0xe2
	strb r4, [r0]
	add r0, r5, #0
	bl ov101_021F11B0
	add r2, r5, #0
	add r1, r5, #0
	add r0, r5, #0
	add r2, #0xe3
	add r5, #0xe1
	ldrb r2, [r2]
	ldrb r3, [r5]
	add r1, #0xe0
	bl ov101_021F11E0
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov101_021F0CE4

	thumb_func_start ov101_021F0D6C
ov101_021F0D6C: ; 0x021F0D6C
	push {r4, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0xcd
	ldrb r2, [r1]
	mov r1, #0xc
	ldr r0, [r4]
	mul r1, r2
	bl AllocFromHeap
	add r1, r4, #0
	add r1, #0xd4
	str r0, [r1]
	add r0, r4, #0
	bl ov101_021F1840
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov101_021F0D6C

	thumb_func_start ov101_021F0D90
ov101_021F0D90: ; 0x021F0D90
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0xd8
	ldr r1, [r1]
	mov r0, #0
	ldrb r2, [r1, #1]
	add r1, r4, #0
	add r1, #0xd0
	ldr r1, [r1]
	add r0, r0, #1
	strb r2, [r1]
	add r1, r4, #0
	add r1, #0xd8
	ldr r2, [r1]
	lsl r0, r0, #0x18
	ldr r1, [r2, #8]
	lsr r0, r0, #0x18
	cmp r1, r2
	beq _021F0DD6
_021F0DB8:
	add r3, r4, #0
	add r3, #0xd0
	ldrb r5, [r1, #1]
	add r2, r0, #0
	ldr r3, [r3]
	add r0, r0, #1
	strb r5, [r3, r2]
	add r2, r4, #0
	add r2, #0xd8
	lsl r0, r0, #0x18
	ldr r1, [r1, #8]
	ldr r2, [r2]
	lsr r0, r0, #0x18
	cmp r1, r2
	bne _021F0DB8
_021F0DD6:
	add r2, r4, #0
	ldr r0, [r4, #0xc]
	add r1, r4, #0
	add r2, #0xcd
	add r1, #0xd0
	ldrb r2, [r2]
	ldr r0, [r0, #0x28]
	ldr r1, [r1]
	bl GSPlayerMisc_SetPhonebookFromBuffer
	add r2, r4, #0
	add r2, #0xcd
	add r0, r4, #0
	ldrb r3, [r2]
	add r0, #0xd4
	mov r2, #0xc
	ldr r0, [r0]
	mov r1, #0
	mul r2, r3
	bl MI_CpuFill8
	add r4, #0xd4
	ldr r0, [r4]
	bl FreeToHeap
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov101_021F0D90

	thumb_func_start ov101_021F0E0C
ov101_021F0E0C: ; 0x021F0E0C
	push {r3, r4, r5, r6}
	ldr r5, [r1, #8]
	ldr r4, [r1, #4]
	mov r3, #0
	str r5, [r4, #8]
	ldr r5, [r1, #4]
	ldr r4, [r1, #8]
	str r5, [r4, #4]
	add r4, r0, #0
	add r4, #0xd8
	ldr r4, [r4]
	cmp r1, r4
	bne _021F0E2E
	add r4, r0, #0
	ldr r5, [r1, #8]
	add r4, #0xd8
	str r5, [r4]
_021F0E2E:
	add r4, r0, #0
	add r4, #0xdc
	ldr r4, [r4]
	cmp r1, r4
	bne _021F0E40
	add r4, r0, #0
	ldr r5, [r1, #4]
	add r4, #0xdc
	str r5, [r4]
_021F0E40:
	add r4, r0, #0
	add r4, #0xcd
	ldrb r4, [r4]
	sub r4, r4, #1
	cmp r2, r4
	bne _021F0E76
	add r2, r0, #0
	add r2, #0xdc
	ldr r2, [r2]
	str r2, [r1, #4]
	add r2, r0, #0
	add r2, #0xdc
	ldr r2, [r2]
	ldr r2, [r2, #8]
	str r2, [r1, #8]
	add r2, r0, #0
	add r2, #0xdc
	ldr r2, [r2]
	str r1, [r2, #8]
	add r2, r0, #0
	add r2, #0xd8
	ldr r2, [r2]
	add r0, #0xdc
	str r1, [r2, #4]
	str r1, [r0]
	pop {r3, r4, r5, r6}
	bx lr
_021F0E76:
	add r4, r0, #0
	add r4, #0xd8
	ldr r6, [r4]
	add r4, r6, #0
_021F0E7E:
	add r5, r3, #0
	add r3, r3, #1
	cmp r5, r2
	beq _021F0E8A
	ldr r4, [r4, #8]
	b _021F0EA6
_021F0E8A:
	str r4, [r1, #8]
	ldr r2, [r4, #4]
	str r2, [r1, #4]
	str r1, [r2, #8]
	add r2, r0, #0
	str r1, [r4, #4]
	add r2, #0xd8
	ldr r2, [r2]
	cmp r4, r2
	bne _021F0EAA
	add r0, #0xd8
	str r1, [r0]
	pop {r3, r4, r5, r6}
	bx lr
_021F0EA6:
	cmp r4, r6
	bne _021F0E7E
_021F0EAA:
	pop {r3, r4, r5, r6}
	bx lr
	.balign 4, 0
	thumb_func_end ov101_021F0E0C

	thumb_func_start ov101_021F0EB0
ov101_021F0EB0: ; 0x021F0EB0
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r0, #0xc4
	ldr r0, [r0]
	mov r3, #0
	add r0, #0x84
	ldr r2, [r0]
	add r0, r6, #0
	add r0, #0xcd
	ldrb r0, [r0]
	sub r4, r0, #1
	cmp r4, #0
	ble _021F0F10
	add r2, r2, r1
_021F0ECC:
	cmp r4, r3
	ble _021F0F02
_021F0ED0:
	add r0, r6, #0
	add r0, #0xd0
	ldr r7, [r0]
	mov r0, #0x14
	ldrb r5, [r7, r4]
	ldrb r1, [r3, r7]
	mul r0, r5
	mov ip, r5
	mov r5, #0x14
	mul r5, r1
	add r0, r2, r0
	add r5, r2, r5
	ldrb r0, [r0, #0x10]
	ldrb r5, [r5, #0x10]
	cmp r0, r5
	bhs _021F0EFC
	mov r0, ip
	strb r0, [r3, r7]
	add r0, r6, #0
	add r0, #0xd0
	ldr r0, [r0]
	strb r1, [r0, r4]
_021F0EFC:
	sub r4, r4, #1
	cmp r4, r3
	bgt _021F0ED0
_021F0F02:
	add r0, r6, #0
	add r0, #0xcd
	ldrb r0, [r0]
	add r3, r3, #1
	sub r4, r0, #1
	cmp r3, r4
	blt _021F0ECC
_021F0F10:
	add r0, r6, #0
	bl ov101_021F1840
	add r0, r6, #0
	bl ov101_021F11B0
	add r0, r6, #0
	add r2, r6, #0
	mov r1, #0
	add r0, #0xe1
	strb r1, [r0]
	add r0, r6, #0
	add r0, #0xe1
	ldrb r1, [r0]
	add r0, r6, #0
	add r0, #0xe3
	strb r1, [r0]
	add r1, r6, #0
	add r0, r6, #0
	add r2, #0xe3
	add r6, #0xe1
	ldrb r2, [r2]
	ldrb r3, [r6]
	add r1, #0xe0
	bl ov101_021F11E0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov101_021F0EB0

	thumb_func_start ov101_021F0F48
ov101_021F0F48: ; 0x021F0F48
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r5, #0
	add r4, #0xe0
	ldr r2, _021F11AC ; =0x00000408
	add r0, r4, #0
	mov r1, #0
	bl MI_CpuFill8
	add r6, r4, #0
	mov r7, #0
	add r6, #0xc
_021F0F60:
	add r0, r6, #0
	bl ov101_021F18E0
	add r7, r7, #1
	add r6, #0xc
	cmp r7, #0x4b
	blt _021F0F60
	add r0, r5, #0
	add r0, #0xcd
	ldrb r0, [r0]
	mov r1, #0x39
	lsl r1, r1, #4
	strb r0, [r4]
	add r0, r5, #0
	add r0, #0x68
	str r0, [r4, r1]
	add r0, r5, #0
	add r0, #0xc4
	ldr r2, [r0]
	add r0, r1, #0
	add r0, #0x6c
	str r2, [r4, r0]
	ldrb r2, [r4, #6]
	mov r0, #1
	mov r6, #0
	bic r2, r0
	add r0, r1, #0
	strb r2, [r4, #6]
	ldr r2, [r5, #0xc]
	add r0, #0x70
	add r2, #0xc
	str r2, [r4, r0]
	add r0, r5, #0
	add r0, #0x10
	add r1, #0x74
	str r0, [r4, r1]
	mov r1, #0xf3
	add r2, r5, #0
	add r3, r4, #0
	lsl r1, r1, #2
_021F0FB0:
	add r0, r2, #0
	add r0, #0x98
	ldr r0, [r0]
	add r6, r6, #1
	str r0, [r3, r1]
	add r2, r2, #4
	add r3, r3, #4
	cmp r6, #2
	blt _021F0FB0
	mov r1, #0xf5
	mov r6, #0
	add r2, r5, #0
	add r3, r4, #0
	lsl r1, r1, #2
_021F0FCC:
	add r0, r2, #0
	add r0, #0xa0
	ldr r0, [r0]
	add r6, r6, #1
	str r0, [r3, r1]
	add r2, r2, #4
	add r3, r3, #4
	cmp r6, #6
	blt _021F0FCC
	mov r1, #0xfb
	mov r3, #0
	add r2, r4, #0
	lsl r1, r1, #2
_021F0FE6:
	add r0, r5, #0
	add r0, #0x88
	ldr r0, [r0]
	add r3, r3, #1
	str r0, [r2, r1]
	add r5, r5, #4
	add r2, r2, #4
	cmp r3, #4
	blt _021F0FE6
	mov r3, #0xe5
	lsl r3, r3, #2
	mov r2, #1
	strb r2, [r4, r3]
	mov r1, #9
	add r0, r3, #1
	strb r1, [r4, r0]
	mov r1, #2
	add r0, r3, #2
	strb r1, [r4, r0]
	mov r0, #3
	add r5, r3, #3
	strb r0, [r4, r5]
	add r6, r3, #4
	mov r5, #4
	strb r5, [r4, r6]
	add r5, r3, #0
	mov r6, #0xb
	add r5, #0xa
	strb r6, [r4, r5]
	add r6, r3, #5
	mov r5, #5
	strb r5, [r4, r6]
	mov r5, #0xa
	add r6, r3, #6
	strb r5, [r4, r6]
	add r7, r3, #7
	mov r6, #6
	strb r6, [r4, r7]
	add r7, r3, #0
	add r7, #8
	mov r6, #7
	strb r6, [r4, r7]
	add r7, r3, #0
	add r7, #9
	mov r6, #8
	strb r6, [r4, r7]
	add r6, r3, #0
	add r6, #0xb
	strb r5, [r4, r6]
	add r5, r3, #1
	add r7, r3, #2
	ldrb r6, [r4, r5]
	ldrb r5, [r4, r3]
	ldrb r7, [r4, r7]
	lsl r5, r5, #0x18
	lsl r7, r7, #0x18
	lsr r5, r5, #8
	lsr r7, r7, #0x10
	orr r5, r7
	orr r6, r5
	add r5, r3, #0
	add r5, #0xc
	str r6, [r4, r5]
	add r5, r3, #6
	ldrb r6, [r4, r5]
	add r5, r3, #5
	add r7, r3, #7
	ldrb r5, [r4, r5]
	ldrb r7, [r4, r7]
	lsl r5, r5, #0x18
	lsl r7, r7, #0x18
	lsr r5, r5, #8
	lsr r7, r7, #0x10
	orr r5, r7
	orr r6, r5
	add r5, r3, #0
	add r5, #0x10
	str r6, [r4, r5]
	add r5, r3, #1
	ldrb r6, [r4, r5]
	add r5, r3, #3
	add r7, r3, #4
	ldrb r5, [r4, r5]
	ldrb r7, [r4, r7]
	lsl r5, r5, #0x18
	lsl r7, r7, #0x18
	lsr r5, r5, #8
	lsr r7, r7, #0x10
	orr r5, r7
	orr r6, r5
	add r5, r3, #0
	add r5, #0x14
	str r6, [r4, r5]
	add r5, r3, #6
	ldrb r6, [r4, r5]
	add r5, r3, #0
	add r7, r3, #0
	add r5, #8
	add r7, #9
	ldrb r5, [r4, r5]
	ldrb r7, [r4, r7]
	lsl r5, r5, #0x18
	lsl r7, r7, #0x18
	lsr r5, r5, #8
	lsr r7, r7, #0x10
	orr r5, r7
	orr r6, r5
	add r5, r3, #0
	add r5, #0x18
	str r6, [r4, r5]
	add r5, r3, #0
	add r5, #0x1c
	strb r2, [r4, r5]
	add r2, r3, #0
	mov r5, #0xc
	add r2, #0x1d
	strb r5, [r4, r2]
	add r2, r3, #0
	add r2, #0x1e
	strb r1, [r4, r2]
	add r1, r3, #0
	add r1, #0x1f
	strb r0, [r4, r1]
	add r1, r3, #0
	add r2, r3, #0
	add r1, #0x20
	mov r0, #4
	strb r0, [r4, r1]
	add r0, r3, #0
	mov r1, #0xe
	add r0, #0x26
	strb r1, [r4, r0]
	add r1, r3, #0
	add r1, #0x21
	mov r0, #5
	strb r0, [r4, r1]
	add r1, r3, #0
	mov r0, #0xd
	add r1, #0x22
	strb r0, [r4, r1]
	add r2, #0x23
	mov r1, #6
	strb r1, [r4, r2]
	add r2, r3, #0
	add r2, #0x24
	mov r1, #7
	strb r1, [r4, r2]
	add r2, r3, #0
	add r2, #0x25
	mov r1, #8
	strb r1, [r4, r2]
	add r1, r3, #0
	add r1, #0x27
	strb r0, [r4, r1]
	add r1, r3, #0
	add r1, #0x1c
	ldrb r1, [r4, r1]
	add r0, r3, #0
	add r0, #0x1d
	lsl r1, r1, #0x18
	lsr r2, r1, #8
	add r1, r3, #0
	add r1, #0x1e
	ldrb r1, [r4, r1]
	ldrb r0, [r4, r0]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x10
	orr r1, r2
	orr r1, r0
	add r0, r3, #0
	add r0, #0x28
	str r1, [r4, r0]
	add r1, r3, #0
	add r1, #0x21
	ldrb r1, [r4, r1]
	add r0, r3, #0
	add r0, #0x22
	lsl r1, r1, #0x18
	lsr r2, r1, #8
	add r1, r3, #0
	add r1, #0x23
	ldrb r1, [r4, r1]
	ldrb r0, [r4, r0]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x10
	orr r1, r2
	orr r1, r0
	add r0, r3, #0
	add r0, #0x2c
	str r1, [r4, r0]
	add r1, r3, #0
	add r1, #0x1f
	ldrb r1, [r4, r1]
	add r0, r3, #0
	add r0, #0x1d
	lsl r1, r1, #0x18
	lsr r2, r1, #8
	add r1, r3, #0
	add r1, #0x20
	ldrb r1, [r4, r1]
	ldrb r0, [r4, r0]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x10
	orr r1, r2
	orr r1, r0
	add r0, r3, #0
	add r0, #0x30
	str r1, [r4, r0]
	add r1, r3, #0
	add r1, #0x24
	ldrb r1, [r4, r1]
	add r0, r3, #0
	add r0, #0x22
	lsl r1, r1, #0x18
	lsr r2, r1, #8
	add r1, r3, #0
	add r1, #0x25
	ldrb r1, [r4, r1]
	ldrb r0, [r4, r0]
	add r3, #0x34
	lsl r1, r1, #0x18
	lsr r1, r1, #0x10
	orr r1, r2
	orr r0, r1
	str r0, [r4, r3]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F11AC: .word 0x00000408
	thumb_func_end ov101_021F0F48

	thumb_func_start ov101_021F11B0
ov101_021F11B0: ; 0x021F11B0
	push {r3, r4}
	add r3, r0, #0
	add r1, r0, #0
	add r0, #0xe0
	add r1, #0xd8
	ldr r2, [r1]
	ldrb r0, [r0]
	add r3, #0xe0
	mov r1, #0
	cmp r0, #0
	ble _021F11DC
	add r4, r3, #0
_021F11C8:
	strb r1, [r4, #0xc]
	ldrb r0, [r2, #1]
	add r1, r1, #1
	strb r0, [r4, #0x14]
	str r2, [r4, #0x10]
	ldrb r0, [r3]
	ldr r2, [r2, #8]
	add r4, #0xc
	cmp r1, r0
	blt _021F11C8
_021F11DC:
	pop {r3, r4}
	bx lr
	thumb_func_end ov101_021F11B0

	thumb_func_start ov101_021F11E0
ov101_021F11E0: ; 0x021F11E0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r2, [sp, #8]
	add r5, r1, #0
	str r3, [sp, #0xc]
	str r0, [sp, #4]
	ldrb r1, [r5]
	ldr r0, [sp, #8]
	cmp r0, r1
	blo _021F11F8
	mov r0, #0
	str r0, [sp, #8]
_021F11F8:
	add r0, r5, #0
	bl ov101_021F19E4
	mov r6, #0
	strb r6, [r5, #5]
	ldr r0, [sp, #8]
	add r7, r6, #0
	strb r0, [r5, #3]
	mov r0, #0xff
	strb r0, [r5, #2]
	ldr r4, [sp, #8]
_021F120E:
	ldrb r0, [r5]
	cmp r4, r0
	blt _021F121C
	sub r0, r4, #1
	strb r0, [r5, #4]
	strb r6, [r5, #5]
	b _021F1238
_021F121C:
	add r1, r6, #1
	lsl r1, r1, #0x18
	lsl r2, r4, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
	add r3, r7, #0
	str r7, [sp]
	bl ov101_021F1A40
	add r6, r6, #1
	add r4, r4, #1
	cmp r6, #6
	blt _021F120E
_021F1238:
	ldrb r0, [r5, #5]
	cmp r0, #0
	bne _021F1248
	strb r6, [r5, #5]
	ldr r0, [sp, #8]
	sub r1, r6, #1
	add r0, r1, r0
	strb r0, [r5, #4]
_021F1248:
	ldrb r1, [r5, #5]
	ldr r0, [sp, #0xc]
	cmp r0, r1
	blo _021F1254
	mov r0, #0
	str r0, [sp, #0xc]
_021F1254:
	ldr r0, [sp, #0xc]
	strb r0, [r5, #1]
	mov r0, #0x39
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl CopyWindowToVram
	add r0, r5, #0
	bl ov101_021F1B48
	ldr r0, [sp, #4]
	add r0, #0xcb
	str r0, [sp, #4]
	ldrb r0, [r0]
	cmp r0, #0
	beq _021F1282
	ldr r1, [sp, #0xc]
	add r0, r5, #0
	mov r2, #0
	bl ov101_021F1290
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_021F1282:
	ldr r1, [sp, #0xc]
	add r0, r5, #0
	mov r2, #1
	bl ov101_021F1290
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov101_021F11E0

	thumb_func_start ov101_021F1290
ov101_021F1290: ; 0x021F1290
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	str r1, [sp]
	cmp r2, #0
	beq _021F12B4
	mov r7, #0xfb
	mov r4, #0
	add r5, r6, #0
	lsl r7, r7, #2
_021F12A2:
	ldr r0, [r5, r7]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _021F12A2
	b _021F12CC
_021F12B4:
	mov r7, #0xfb
	mov r5, #0
	add r4, r6, #0
	lsl r7, r7, #2
_021F12BC:
	ldr r0, [r4, r7]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, #4
	blt _021F12BC
_021F12CC:
	ldr r0, [sp]
	cmp r0, #6
	blo _021F12D6
	ldrb r0, [r6, #1]
	str r0, [sp]
_021F12D6:
	ldrb r1, [r6, #5]
	ldrb r0, [r6, #1]
	cmp r0, r1
	blo _021F12E6
	sub r0, r1, #1
	strb r0, [r6, #1]
	ldrb r0, [r6, #1]
	str r0, [sp]
_021F12E6:
	ldr r0, [sp]
	mov r1, #0x18
	add r4, r0, #0
	mul r4, r1
	add r5, r4, #0
	mov r0, #0xfb
	add r5, #8
	lsl r0, r0, #2
	lsl r2, r5, #0x10
	ldr r0, [r6, r0]
	mov r1, #0x10
	asr r2, r2, #0x10
	bl sub_0200DD88
	mov r0, #0x3f
	add r4, #0x1e
	lsl r0, r0, #4
	lsl r2, r4, #0x10
	ldr r0, [r6, r0]
	mov r1, #0x10
	asr r2, r2, #0x10
	bl sub_0200DD88
	mov r0, #0xfd
	lsl r0, r0, #2
	lsl r2, r5, #0x10
	ldr r0, [r6, r0]
	mov r1, #0xe0
	asr r2, r2, #0x10
	bl sub_0200DD88
	mov r0, #0xfe
	lsl r0, r0, #2
	lsl r2, r4, #0x10
	ldr r0, [r6, r0]
	mov r1, #0xe0
	asr r2, r2, #0x10
	bl sub_0200DD88
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov101_021F1290

	thumb_func_start ov101_021F1338
ov101_021F1338: ; 0x021F1338
	push {r3, r4, r5, r6, r7, lr}
	mov r7, #0xfb
	add r5, r0, #0
	add r6, r1, #0
	mov r4, #0
	lsl r7, r7, #2
_021F1344:
	mov r0, #0xfb
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r6, #0
	bl Set2dSpriteAnimActiveFlag
	ldr r0, [r5, r7]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _021F1344
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov101_021F1338

	thumb_func_start ov101_021F1364
ov101_021F1364: ; 0x021F1364
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r7, r1, #0
	cmp r2, #0
	beq _021F13AE
	ldrb r0, [r5, #5]
	mov r6, #0
	cmp r0, #0
	ble _021F13C6
	add r4, r5, #0
_021F1378:
	mov r0, #0xf5
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	cmp r7, r6
	bne _021F1396
	mov r0, #0xf5
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #7
	bl Set2dSpriteAnimSeqNo
	b _021F13A2
_021F1396:
	mov r0, #0xf5
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #6
	bl Set2dSpriteAnimSeqNo
_021F13A2:
	ldrb r0, [r5, #5]
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, r0
	blt _021F1378
	pop {r3, r4, r5, r6, r7, pc}
_021F13AE:
	mov r4, #0
	mov r6, #0xf5
	add r7, r4, #0
	lsl r6, r6, #2
_021F13B6:
	ldr r0, [r5, r6]
	add r1, r7, #0
	bl Set2dSpriteVisibleFlag
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #6
	blt _021F13B6
_021F13C6:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov101_021F1364

	thumb_func_start ov101_021F13C8
ov101_021F13C8: ; 0x021F13C8
	push {r4, lr}
	add r4, r0, #0
	cmp r1, #0
	ldrb r2, [r4, #6]
	bne _021F13F2
	mov r1, #0xfe
	bic r2, r1
	strb r2, [r4, #6]
	mov r1, #0xff
	mov r2, #0
	bl ov101_021F1364
	add r0, r4, #0
	bl ov101_021F1808
	ldrb r1, [r4, #1]
	add r0, r4, #0
	mov r2, #1
	bl ov101_021F1290
	pop {r4, pc}
_021F13F2:
	mov r1, #0xfe
	bic r2, r1
	mov r1, #2
	orr r1, r2
	strb r1, [r4, #6]
	ldrb r1, [r4, #1]
	mov r2, #1
	bl ov101_021F1364
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov101_021F13C8

	thumb_func_start ov101_021F1408
ov101_021F1408: ; 0x021F1408
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldrb r1, [r5, #7]
	lsl r2, r1, #0x1f
	lsr r2, r2, #0x1f
	beq _021F141E
	bl ov101_021F1D44
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_021F141E:
	lsl r2, r1, #0x18
	lsr r2, r2, #0x1b
	beq _021F143C
	mov r0, #0xf8
	bic r1, r0
	sub r0, r2, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x18
	orr r0, r1
	strb r0, [r5, #7]
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_021F143C:
	ldrb r6, [r5, #3]
	ldrb r1, [r5, #1]
	ldr r7, _021F1558 ; =gSystem
	mov r3, #1
	add r1, r6, r1
	lsl r1, r1, #0x18
	ldr r2, [r7, #0x48]
	lsr r4, r1, #0x18
	add r1, r2, #0
	tst r1, r3
	beq _021F146E
	strb r4, [r5, #2]
	str r3, [sp]
	ldrb r1, [r5, #1]
	ldrb r2, [r5, #2]
	add r1, r1, #1
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl ov101_021F1A40
	ldr r0, _021F155C ; =0x00000941
	bl PlaySE
	ldrb r0, [r5, #2]
	pop {r3, r4, r5, r6, r7, pc}
_021F146E:
	ldr r3, [r7, #0x4c]
	mov r0, #0x40
	add r1, r3, #0
	tst r1, r0
	beq _021F14BC
	cmp r4, #0
	bne _021F1480
	sub r0, #0x41
	pop {r3, r4, r5, r6, r7, pc}
_021F1480:
	ldr r0, _021F1560 ; =0x0000093F
	bl PlaySE
	ldrb r0, [r5, #1]
	cmp r0, #0
	bne _021F149E
	cmp r4, #0
	beq _021F1498
	add r0, r5, #0
	mov r1, #1
	bl ov101_021F1B94
_021F1498:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_021F149E:
	sub r0, r0, #1
	strb r0, [r5, #1]
	ldrb r1, [r5, #1]
	add r0, r5, #0
	mov r2, #1
	bl ov101_021F1290
	ldrb r1, [r5, #7]
	mov r0, #0xf8
	bic r1, r0
	mov r0, #0x10
	orr r1, r0
	strb r1, [r5, #7]
	sub r0, #0x11
	pop {r3, r4, r5, r6, r7, pc}
_021F14BC:
	mov r0, #0x80
	add r1, r3, #0
	tst r1, r0
	beq _021F1510
	ldrb r1, [r5]
	sub r1, r1, #1
	cmp r4, r1
	blt _021F14D0
	sub r0, #0x81
	pop {r3, r4, r5, r6, r7, pc}
_021F14D0:
	ldr r0, _021F1560 ; =0x0000093F
	bl PlaySE
	ldrb r0, [r5, #1]
	cmp r0, #5
	bne _021F14F2
	ldrb r0, [r5]
	sub r0, r0, #1
	cmp r4, r0
	bge _021F14EC
	add r0, r5, #0
	mov r1, #0
	bl ov101_021F1B94
_021F14EC:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_021F14F2:
	add r0, r0, #1
	strb r0, [r5, #1]
	ldrb r1, [r5, #1]
	add r0, r5, #0
	mov r2, #1
	bl ov101_021F1290
	ldrb r1, [r5, #7]
	mov r0, #0xf8
	bic r1, r0
	mov r0, #0x10
	orr r1, r0
	strb r1, [r5, #7]
	sub r0, #0x11
	pop {r3, r4, r5, r6, r7, pc}
_021F1510:
	mov r0, #0x20
	tst r0, r2
	beq _021F152E
	cmp r6, #0
	beq _021F1528
	ldr r0, _021F1560 ; =0x0000093F
	bl PlaySE
	add r0, r5, #0
	mov r1, #1
	bl ov101_021F1C98
_021F1528:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_021F152E:
	mov r0, #0x10
	add r1, r2, #0
	tst r1, r0
	beq _021F1552
	ldrb r0, [r5]
	add r1, r6, #6
	cmp r1, r0
	bge _021F154C
	ldr r0, _021F1560 ; =0x0000093F
	bl PlaySE
	add r0, r5, #0
	mov r1, #0
	bl ov101_021F1C98
_021F154C:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_021F1552:
	sub r0, #0x11
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F1558: .word gSystem
_021F155C: .word 0x00000941
_021F1560: .word 0x0000093F
	thumb_func_end ov101_021F1408

	thumb_func_start ov101_021F1564
ov101_021F1564: ; 0x021F1564
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldrb r1, [r5, #7]
	lsl r2, r1, #0x1f
	lsr r2, r2, #0x1f
	beq _021F157A
	bl ov101_021F1D44
	mov r0, #0
	mvn r0, r0
	pop {r4, r5, r6, pc}
_021F157A:
	lsl r0, r1, #0x18
	lsr r2, r0, #0x1b
	beq _021F1598
	mov r0, #0xf8
	bic r1, r0
	sub r0, r2, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x18
	orr r0, r1
	strb r0, [r5, #7]
	mov r0, #0
	mvn r0, r0
	pop {r4, r5, r6, pc}
_021F1598:
	ldrb r2, [r5, #3]
	ldrb r0, [r5, #1]
	ldr r3, _021F16A0 ; =gSystem
	add r0, r2, r0
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	ldr r1, [r3, #0x48]
	mov r0, #1
	tst r0, r1
	beq _021F15B0
	add r0, r4, #0
	pop {r4, r5, r6, pc}
_021F15B0:
	mov r0, #2
	tst r0, r1
	beq _021F15BA
	ldrb r0, [r5, #2]
	pop {r4, r5, r6, pc}
_021F15BA:
	ldr r6, [r3, #0x4c]
	mov r0, #0x40
	add r3, r6, #0
	tst r3, r0
	beq _021F1608
	cmp r4, #0
	bne _021F15CC
	sub r0, #0x41
	pop {r4, r5, r6, pc}
_021F15CC:
	ldr r0, _021F16A4 ; =0x0000093F
	bl PlaySE
	ldrb r0, [r5, #1]
	cmp r0, #0
	bne _021F15EA
	cmp r4, #0
	beq _021F15E4
	add r0, r5, #0
	mov r1, #1
	bl ov101_021F1B94
_021F15E4:
	mov r0, #0
	mvn r0, r0
	pop {r4, r5, r6, pc}
_021F15EA:
	sub r0, r0, #1
	strb r0, [r5, #1]
	ldrb r1, [r5, #1]
	add r0, r5, #0
	mov r2, #1
	bl ov101_021F1364
	ldrb r1, [r5, #7]
	mov r0, #0xf8
	bic r1, r0
	mov r0, #0x10
	orr r1, r0
	strb r1, [r5, #7]
	sub r0, #0x11
	pop {r4, r5, r6, pc}
_021F1608:
	mov r0, #0x80
	add r3, r6, #0
	tst r3, r0
	beq _021F165C
	ldrb r1, [r5]
	sub r1, r1, #1
	cmp r4, r1
	blt _021F161C
	sub r0, #0x81
	pop {r4, r5, r6, pc}
_021F161C:
	ldr r0, _021F16A4 ; =0x0000093F
	bl PlaySE
	ldrb r0, [r5, #1]
	cmp r0, #5
	bne _021F163E
	ldrb r0, [r5]
	sub r0, r0, #1
	cmp r4, r0
	bge _021F1638
	add r0, r5, #0
	mov r1, #0
	bl ov101_021F1B94
_021F1638:
	mov r0, #0
	mvn r0, r0
	pop {r4, r5, r6, pc}
_021F163E:
	add r0, r0, #1
	strb r0, [r5, #1]
	ldrb r1, [r5, #1]
	add r0, r5, #0
	mov r2, #1
	bl ov101_021F1364
	ldrb r1, [r5, #7]
	mov r0, #0xf8
	bic r1, r0
	mov r0, #0x10
	orr r1, r0
	strb r1, [r5, #7]
	sub r0, #0x11
	pop {r4, r5, r6, pc}
_021F165C:
	mov r0, #0x20
	tst r0, r1
	beq _021F167A
	cmp r2, #0
	beq _021F1674
	ldr r0, _021F16A4 ; =0x0000093F
	bl PlaySE
	add r0, r5, #0
	mov r1, #1
	bl ov101_021F1C98
_021F1674:
	mov r0, #0
	mvn r0, r0
	pop {r4, r5, r6, pc}
_021F167A:
	mov r0, #0x10
	tst r1, r0
	beq _021F169C
	ldrb r0, [r5]
	add r1, r2, #6
	cmp r1, r0
	bge _021F1696
	ldr r0, _021F16A4 ; =0x0000093F
	bl PlaySE
	add r0, r5, #0
	mov r1, #0
	bl ov101_021F1C98
_021F1696:
	mov r0, #0
	mvn r0, r0
	pop {r4, r5, r6, pc}
_021F169C:
	sub r0, #0x11
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021F16A0: .word gSystem
_021F16A4: .word 0x0000093F
	thumb_func_end ov101_021F1564

	thumb_func_start ov101_021F16A8
ov101_021F16A8: ; 0x021F16A8
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	ldrb r1, [r4, #7]
	lsl r1, r1, #0x1f
	lsr r1, r1, #0x1f
	beq _021F16C2
	bl ov101_021F1D44
	mov r0, #0
	add sp, #4
	mvn r0, r0
	pop {r3, r4, pc}
_021F16C2:
	ldr r0, _021F175C ; =ov101_021F8634
	bl sub_02025224
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _021F16D6
	add sp, #4
	add r0, r1, #0
	pop {r3, r4, pc}
_021F16D6:
	cmp r0, #6
	bge _021F1714
	ldrb r1, [r4, #5]
	cmp r0, r1
	bge _021F1714
	strb r0, [r4, #1]
	ldrb r1, [r4, #3]
	mov r3, #1
	add r0, r1, r0
	strb r0, [r4, #2]
	str r3, [sp]
	ldrb r1, [r4, #1]
	ldrb r2, [r4, #2]
	add r0, r4, #0
	add r1, r1, #1
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl ov101_021F1A40
	ldrb r1, [r4, #1]
	add r0, r4, #0
	mov r2, #1
	bl ov101_021F1290
	ldr r0, _021F1760 ; =0x00000941
	bl PlaySE
	ldrb r0, [r4, #2]
	add sp, #4
	add r0, r0, #1
	pop {r3, r4, pc}
_021F1714:
	cmp r0, #6
	bne _021F1732
	ldrb r1, [r4, #3]
	cmp r1, #0
	beq _021F1732
	add r0, r4, #0
	mov r1, #1
	bl ov101_021F1C98
	ldr r0, _021F1764 ; =0x0000093F
	bl PlaySE
	add sp, #4
	mov r0, #0
	pop {r3, r4, pc}
_021F1732:
	cmp r0, #7
	bne _021F1754
	ldrb r0, [r4, #3]
	add r1, r0, #6
	ldrb r0, [r4]
	cmp r1, r0
	bge _021F1754
	add r0, r4, #0
	mov r1, #0
	bl ov101_021F1C98
	ldr r0, _021F1764 ; =0x0000093F
	bl PlaySE
	add sp, #4
	mov r0, #0
	pop {r3, r4, pc}
_021F1754:
	mov r0, #0
	mvn r0, r0
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_021F175C: .word ov101_021F8634
_021F1760: .word 0x00000941
_021F1764: .word 0x0000093F
	thumb_func_end ov101_021F16A8

	thumb_func_start ov101_021F1768
ov101_021F1768: ; 0x021F1768
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r1, #0
	ldrb r1, [r5, #7]
	lsl r1, r1, #0x1f
	lsr r1, r1, #0x1f
	beq _021F1780
	bl ov101_021F1D44
	mov r0, #0
	mvn r0, r0
	pop {r4, r5, r6, pc}
_021F1780:
	ldr r0, _021F17F8 ; =ov101_021F8658
	bl sub_02025224
	add r4, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	beq _021F17F4
	cmp r4, #6
	bge _021F17AC
	ldrb r0, [r5, #5]
	cmp r4, r0
	bge _021F17AC
	ldr r0, _021F17FC ; =0x00000941
	strb r4, [r5, #1]
	bl PlaySE
	mov r0, #1
	str r0, [r6]
	ldrb r0, [r5, #3]
	add r0, r0, r4
	pop {r4, r5, r6, pc}
_021F17AC:
	cmp r4, #6
	bne _021F17CC
	ldrb r0, [r5, #3]
	cmp r0, #0
	beq _021F17CC
	add r0, r5, #0
	mov r1, #1
	bl ov101_021F1C98
	ldr r0, _021F1800 ; =0x0000093F
	bl PlaySE
	mov r0, #1
	str r0, [r6]
	sub r0, r0, #2
	pop {r4, r5, r6, pc}
_021F17CC:
	cmp r4, #7
	bne _021F17F0
	ldrb r0, [r5, #3]
	add r1, r0, #6
	ldrb r0, [r5]
	cmp r1, r0
	bge _021F17F0
	add r0, r5, #0
	mov r1, #0
	bl ov101_021F1C98
	ldr r0, _021F1800 ; =0x0000093F
	bl PlaySE
	mov r0, #1
	str r0, [r6]
	sub r0, r0, #2
	pop {r4, r5, r6, pc}
_021F17F0:
	mov r0, #0
	mvn r0, r0
_021F17F4:
	pop {r4, r5, r6, pc}
	nop
_021F17F8: .word ov101_021F8658
_021F17FC: .word 0x00000941
_021F1800: .word 0x0000093F
	thumb_func_end ov101_021F1768

	thumb_func_start ov101_021F1804
ov101_021F1804: ; 0x021F1804
	ldrb r0, [r0, #1]
	bx lr
	thumb_func_end ov101_021F1804

	thumb_func_start ov101_021F1808
ov101_021F1808: ; 0x021F1808
	push {r3, lr}
	ldrb r2, [r0, #2]
	mov r1, #0xff
	strb r1, [r0, #2]
	ldrb r3, [r0, #3]
	cmp r2, r3
	blo _021F182E
	ldrb r1, [r0, #4]
	cmp r1, r2
	blo _021F182E
	mov r1, #1
	str r1, [sp]
	sub r1, r2, r3
	add r1, r1, #1
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	mov r3, #0
	bl ov101_021F1A40
_021F182E:
	pop {r3, pc}
	thumb_func_end ov101_021F1808

	thumb_func_start ov101_021F1830
ov101_021F1830: ; 0x021F1830
	mov r2, #0
	strb r2, [r0]
	mov r1, #0xff
	strb r1, [r0, #1]
	str r2, [r0, #8]
	str r2, [r0, #4]
	bx lr
	.balign 4, 0
	thumb_func_end ov101_021F1830

	thumb_func_start ov101_021F1840
ov101_021F1840: ; 0x021F1840
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r6, #0
	add r0, #0xdc
	str r6, [r0]
	add r0, r5, #0
	add r0, #0xdc
	ldr r1, [r0]
	add r0, r5, #0
	add r0, #0xd8
	str r1, [r0]
	add r0, r5, #0
	add r0, #0xcd
	ldrb r0, [r0]
	cmp r0, #0
	ble _021F18C4
	add r7, r6, #0
_021F1862:
	add r0, r5, #0
	add r0, #0xd4
	ldr r0, [r0]
	add r4, r0, r7
	str r0, [sp]
	add r0, r4, #0
	bl ov101_021F1830
	ldr r0, [sp]
	strb r6, [r0, r7]
	add r0, r5, #0
	add r0, #0xd0
	ldr r0, [r0]
	ldrb r0, [r0, r6]
	strb r0, [r4, #1]
	add r0, r5, #0
	add r0, #0xd8
	ldr r0, [r0]
	cmp r0, #0
	bne _021F1890
	add r0, r5, #0
	add r0, #0xd8
	str r4, [r0]
_021F1890:
	add r0, r5, #0
	add r0, #0xdc
	ldr r0, [r0]
	cmp r0, #0
	bne _021F18A0
	add r0, r5, #0
	add r0, #0xdc
	str r4, [r0]
_021F18A0:
	add r0, r5, #0
	add r0, #0xdc
	ldr r0, [r0]
	add r6, r6, #1
	str r0, [r4, #4]
	add r0, r5, #0
	add r0, #0xdc
	ldr r0, [r0]
	add r7, #0xc
	str r4, [r0, #8]
	add r0, r5, #0
	add r0, #0xdc
	str r4, [r0]
	add r0, r5, #0
	add r0, #0xcd
	ldrb r0, [r0]
	cmp r6, r0
	blt _021F1862
_021F18C4:
	add r0, r5, #0
	add r0, #0xd8
	ldr r1, [r0]
	add r0, r5, #0
	add r0, #0xdc
	ldr r0, [r0]
	str r1, [r0, #8]
	add r0, r5, #0
	add r0, #0xdc
	add r5, #0xd8
	ldr r1, [r0]
	ldr r0, [r5]
	str r1, [r0, #4]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov101_021F1840

	thumb_func_start ov101_021F18E0
ov101_021F18E0: ; 0x021F18E0
	mov r1, #0
	strb r1, [r0]
	str r1, [r0, #4]
	bx lr
	thumb_func_end ov101_021F18E0

	thumb_func_start ov101_021F18E8
ov101_021F18E8: ; 0x021F18E8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r0, r1, #0
	mov r1, #0xe5
	mov r4, #0x1c
	mul r4, r2
	lsl r1, r1, #2
	add r7, r3, #0
	add r3, r5, r1
	add r4, r3, r4
	mov r2, #0x18
	add r3, r0, #0
	mul r3, r2
	lsl r0, r3, #0x18
	lsr r6, r0, #0x18
	mov r0, #0xd8
	str r0, [sp]
	str r2, [sp, #4]
	sub r0, r1, #4
	ldrb r1, [r4, #0xa]
	ldr r0, [r5, r0]
	mov r2, #0
	add r3, r6, #0
	bl FillWindowPixelRect
	mov r0, #0x52
	str r0, [sp]
	mov r0, #0x14
	str r0, [sp, #4]
	mov r0, #0x39
	lsl r0, r0, #4
	ldrb r1, [r4, #1]
	ldr r0, [r5, r0]
	mov r2, #8
	add r3, r6, #0
	bl FillWindowPixelRect
	mov r0, #0x7e
	str r0, [sp]
	mov r0, #0x14
	str r0, [sp, #4]
	mov r0, #0x39
	lsl r0, r0, #4
	ldrb r1, [r4, #6]
	ldr r0, [r5, r0]
	mov r2, #0x5a
	add r3, r6, #0
	bl FillWindowPixelRect
	mov r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #0x39
	lsl r0, r0, #4
	add r3, r6, #1
	lsl r3, r3, #0x10
	ldrb r1, [r4, #0xb]
	ldr r0, [r5, r0]
	mov r2, #1
	lsr r3, r3, #0x10
	bl FillWindowPixelRect
	mov r0, #2
	str r0, [sp]
	mov r0, #7
	str r0, [sp, #4]
	mov r0, #0x39
	lsl r0, r0, #4
	ldrb r1, [r4, #0xa]
	ldr r0, [r5, r0]
	mov r2, #8
	add r3, r6, #0
	bl FillWindowPixelRect
	mov r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #0x39
	add r3, r6, #0
	lsl r0, r0, #4
	add r3, #9
	lsl r3, r3, #0x10
	ldrb r1, [r4, #0xa]
	ldr r0, [r5, r0]
	mov r2, #9
	lsr r3, r3, #0x10
	bl FillWindowPixelRect
	mov r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #0x39
	add r3, r6, #0
	lsl r0, r0, #4
	add r3, #0xd
	lsl r3, r3, #0x10
	ldrb r1, [r4, #0xa]
	ldr r0, [r5, r0]
	mov r2, #9
	lsr r3, r3, #0x10
	bl FillWindowPixelRect
	mov r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #0x39
	lsl r0, r0, #4
	add r6, #0x11
	lsl r3, r6, #0x10
	ldrb r1, [r4, #0xa]
	ldr r0, [r5, r0]
	mov r2, #9
	lsr r3, r3, #0x10
	bl FillWindowPixelRect
	cmp r7, #0
	beq _021F19DE
	mov r0, #0x39
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl CopyWindowToVram
_021F19DE:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov101_021F18E8

	thumb_func_start ov101_021F19E4
ov101_021F19E4: ; 0x021F19E4
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldrb r0, [r6, #6]
	mov r4, #0
	mov r7, #1
	lsl r0, r0, #0x1f
	lsr r5, r0, #0x1f
_021F19F2:
	lsl r1, r4, #0x18
	add r0, r6, #0
	lsr r1, r1, #0x18
	add r2, r5, #0
	mov r3, #0
	bl ov101_021F18E8
	add r0, r5, #0
	eor r0, r7
	lsl r0, r0, #0x18
	add r4, r4, #1
	lsr r5, r0, #0x18
	cmp r4, #8
	blt _021F19F2
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov101_021F19E4

	thumb_func_start ov101_021F1A10
ov101_021F1A10: ; 0x021F1A10
	ldrb r0, [r0, #6]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	beq _021F1A2E
	lsr r2, r1, #0x1f
	lsl r1, r1, #0x1f
	sub r1, r1, r2
	mov r0, #0x1f
	ror r1, r0
	add r1, r2, r1
	mov r0, #1
	sub r0, r0, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bx lr
_021F1A2E:
	lsr r2, r1, #0x1f
	lsl r1, r1, #0x1f
	sub r1, r1, r2
	mov r0, #0x1f
	ror r1, r0
	add r0, r2, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bx lr
	thumb_func_end ov101_021F1A10

	thumb_func_start ov101_021F1A40
ov101_021F1A40: ; 0x021F1A40
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r1, [sp, #0x10]
	add r7, r2, #0
	mov r2, #0xc
	add r5, r0, #0
	str r3, [sp, #0x14]
	add r3, r5, #0
	add r3, #0xc
	mul r2, r7
	add r4, r3, r2
	bl ov101_021F1A10
	add r2, r0, #0
	mov r0, #0xe5
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #0x1c
	mul r0, r2
	add r6, r1, r0
	ldr r1, [sp, #0x10]
	add r0, r5, #0
	mov r3, #0
	bl ov101_021F18E8
	ldr r0, [sp, #0x10]
	mov r1, #0x18
	mul r1, r0
	lsl r0, r1, #0x18
	lsr r1, r0, #0x18
	ldr r0, [sp, #0x14]
	cmp r0, #0
	bne _021F1A88
	ldrb r0, [r5, #2]
	cmp r7, r0
	bne _021F1ADE
_021F1A88:
	mov r0, #0xff
	add r7, r1, #2
	lsl r0, r0, #2
	ldrb r1, [r4, #8]
	ldr r0, [r5, r0]
	bl PhoneContact_GetName
	add r2, r0, #0
	str r7, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, [r6, #0x14]
	mov r1, #4
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	mov r0, #0x39
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r3, #0x10
	bl AddTextPrinterParameterized2
	mov r0, #0xff
	lsl r0, r0, #2
	ldrb r1, [r4, #8]
	ldr r0, [r5, r0]
	bl PhoneContact_GetClass
	add r2, r0, #0
	str r7, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, [r6, #0x18]
	mov r1, #0
	str r0, [sp, #8]
	mov r0, #0x39
	str r1, [sp, #0xc]
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r3, #0x5e
	bl AddTextPrinterParameterized2
	b _021F1B32
_021F1ADE:
	mov r0, #0xff
	add r7, r1, #2
	lsl r0, r0, #2
	ldrb r1, [r4, #8]
	ldr r0, [r5, r0]
	bl PhoneContact_GetName
	add r2, r0, #0
	str r7, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, [r6, #0xc]
	mov r1, #4
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	mov r0, #0x39
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r3, #0x10
	bl AddTextPrinterParameterized2
	mov r0, #0xff
	lsl r0, r0, #2
	ldrb r1, [r4, #8]
	ldr r0, [r5, r0]
	bl PhoneContact_GetClass
	add r2, r0, #0
	str r7, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, [r6, #0x10]
	mov r1, #0
	str r0, [sp, #8]
	mov r0, #0x39
	str r1, [sp, #0xc]
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r3, #0x5e
	bl AddTextPrinterParameterized2
_021F1B32:
	ldr r0, [sp, #0x30]
	cmp r0, #0
	beq _021F1B42
	mov r0, #0x39
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl CopyWindowToVram
_021F1B42:
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov101_021F1A40

	thumb_func_start ov101_021F1B48
ov101_021F1B48: ; 0x021F1B48
	push {r4, lr}
	add r4, r0, #0
	ldrb r0, [r4, #3]
	cmp r0, #0
	beq _021F1B60
	mov r0, #0xf3
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	b _021F1B6C
_021F1B60:
	mov r0, #0xf3
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
_021F1B6C:
	ldrb r0, [r4, #3]
	add r1, r0, #6
	ldrb r0, [r4]
	cmp r1, r0
	bge _021F1B84
	mov r0, #0x3d
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	pop {r4, pc}
_021F1B84:
	mov r0, #0x3d
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov101_021F1B48

	thumb_func_start ov101_021F1B94
ov101_021F1B94: ; 0x021F1B94
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r5, r1, #0
	beq _021F1BC0
	ldrb r1, [r4, #3]
	cmp r1, #1
	bhs _021F1BA6
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F1BA6:
	sub r1, r1, #1
	strb r1, [r4, #3]
	mov r1, #1
	str r1, [sp]
	mov r1, #0
	ldrb r2, [r4, #3]
	add r3, r1, #0
	bl ov101_021F1A40
	ldrb r0, [r4, #4]
	sub r0, r0, #1
	strb r0, [r4, #4]
	b _021F1BE6
_021F1BC0:
	ldrb r1, [r4]
	ldrb r2, [r4, #4]
	sub r1, r1, #1
	cmp r2, r1
	blt _021F1BCE
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F1BCE:
	add r1, r2, #1
	strb r1, [r4, #4]
	mov r1, #1
	str r1, [sp]
	ldrb r2, [r4, #4]
	mov r1, #7
	mov r3, #0
	bl ov101_021F1A40
	ldrb r0, [r4, #3]
	add r0, r0, #1
	strb r0, [r4, #3]
_021F1BE6:
	ldrb r1, [r4, #7]
	mov r0, #0xf8
	mov r2, #1
	bic r1, r0
	strb r1, [r4, #7]
	ldrb r1, [r4, #7]
	mov r0, #2
	bic r1, r0
	lsl r0, r5, #0x1f
	lsr r0, r0, #0x1e
	orr r0, r1
	strb r0, [r4, #7]
	ldrb r0, [r4, #7]
	mov r1, #1
	bic r0, r2
	orr r0, r1
	strb r0, [r4, #7]
	ldr r0, _021F1C30 ; =0x00000404
	ldr r0, [r4, r0]
	strb r1, [r0]
	ldrb r3, [r4, #6]
	add r0, r3, #0
	bic r0, r2
	lsl r2, r3, #0x1f
	lsr r2, r2, #0x1f
	eor r2, r1
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	and r1, r2
	orr r0, r1
	strb r0, [r4, #6]
	add r0, r4, #0
	bl ov101_021F1B48
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_021F1C30: .word 0x00000404
	thumb_func_end ov101_021F1B94

	thumb_func_start ov101_021F1C34
ov101_021F1C34: ; 0x021F1C34
	push {r4, lr}
	add r4, r0, #0
	ldrb r0, [r4, #7]
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1f
	beq _021F1C52
	mov r0, #0x39
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #1
	mov r2, #8
	mov r3, #0
	bl ScrollWindow
	b _021F1C62
_021F1C52:
	mov r0, #0x39
	lsl r0, r0, #4
	mov r1, #0
	ldr r0, [r4, r0]
	mov r2, #8
	add r3, r1, #0
	bl ScrollWindow
_021F1C62:
	mov r0, #0x39
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl CopyWindowToVram
	ldrb r0, [r4, #7]
	mov r2, #0xf8
	lsl r1, r0, #0x18
	lsr r1, r1, #0x1b
	add r3, r1, #1
	lsl r3, r3, #0x18
	lsr r3, r3, #0x18
	lsl r3, r3, #0x1b
	bic r0, r2
	lsr r3, r3, #0x18
	orr r0, r3
	strb r0, [r4, #7]
	cmp r1, #2
	blo _021F1C92
	ldrb r0, [r4, #7]
	bic r0, r2
	strb r0, [r4, #7]
	mov r0, #1
	pop {r4, pc}
_021F1C92:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov101_021F1C34

	thumb_func_start ov101_021F1C98
ov101_021F1C98: ; 0x021F1C98
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldrb r3, [r4, #8]
	mov r2, #0x70
	bic r3, r2
	strb r3, [r4, #8]
	ldrb r3, [r4, #7]
	mov r2, #4
	orr r2, r3
	strb r2, [r4, #7]
	ldrb r3, [r4, #7]
	mov r2, #2
	bic r3, r2
	lsl r2, r1, #0x1f
	lsr r2, r2, #0x1e
	orr r2, r3
	strb r2, [r4, #7]
	ldrb r5, [r4, #7]
	mov r2, #1
	mov r3, #1
	bic r5, r2
	add r2, r5, #0
	orr r2, r3
	strb r2, [r4, #7]
	ldr r2, _021F1CE4 ; =0x00000404
	ldr r2, [r4, r2]
	strb r3, [r2]
	bl ov101_021F1B94
	cmp r0, #0
	bne _021F1CDE
	ldrb r1, [r4, #8]
	mov r0, #0x80
	orr r0, r1
	strb r0, [r4, #8]
_021F1CDE:
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_021F1CE4: .word 0x00000404
	thumb_func_end ov101_021F1C98

	thumb_func_start ov101_021F1CE8
ov101_021F1CE8: ; 0x021F1CE8
	push {r4, lr}
	add r4, r0, #0
	bl ov101_021F1C34
	cmp r0, #0
	bne _021F1CF8
	mov r0, #0
	pop {r4, pc}
_021F1CF8:
	ldrb r1, [r4, #8]
	lsl r0, r1, #0x18
	lsr r0, r0, #0x1f
	bne _021F1D2A
	lsl r0, r1, #0x19
	mov r2, #0x70
	lsr r0, r0, #0x1d
	bic r1, r2
	add r2, r0, #1
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	lsl r2, r2, #0x1d
	lsr r2, r2, #0x19
	orr r1, r2
	strb r1, [r4, #8]
	cmp r0, #5
	bhs _021F1D2A
	ldrb r1, [r4, #7]
	add r0, r4, #0
	lsl r1, r1, #0x1e
	lsr r1, r1, #0x1f
	bl ov101_021F1B94
	cmp r0, #0
	bne _021F1D3E
_021F1D2A:
	ldrb r1, [r4, #8]
	mov r0, #0x70
	bic r1, r0
	strb r1, [r4, #8]
	ldrb r1, [r4, #7]
	mov r0, #4
	bic r1, r0
	strb r1, [r4, #7]
	mov r0, #1
	pop {r4, pc}
_021F1D3E:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov101_021F1CE8

	thumb_func_start ov101_021F1D44
ov101_021F1D44: ; 0x021F1D44
	push {r4, lr}
	add r4, r0, #0
	ldrb r1, [r4, #7]
	lsl r1, r1, #0x1d
	lsr r1, r1, #0x1f
	beq _021F1D56
	bl ov101_021F1CE8
	b _021F1D5A
_021F1D56:
	bl ov101_021F1C34
_021F1D5A:
	cmp r0, #0
	beq _021F1D6E
	ldr r0, _021F1D70 ; =0x00000404
	mov r1, #0
	ldr r0, [r4, r0]
	strb r1, [r0]
	ldrb r1, [r4, #7]
	mov r0, #1
	bic r1, r0
	strb r1, [r4, #7]
_021F1D6E:
	pop {r4, pc}
	.balign 4, 0
_021F1D70: .word 0x00000404
	thumb_func_end ov101_021F1D44

	thumb_func_start ov101_021F1D74
ov101_021F1D74: ; 0x021F1D74
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5]
	mov r1, #0xdc
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0xdc
	add r4, r0, #0
	bl MI_CpuFill8
	ldr r0, [r5]
	str r0, [r4]
	ldr r0, [r5]
	bl AllocAndReadPhoneBook
	add r1, r4, #0
	add r1, #0x80
	str r0, [r1]
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r1, [r0, #4]
	add r0, r4, #0
	add r0, #0x84
	str r1, [r0]
	ldr r0, [r5, #0xc]
	str r0, [r4, #4]
	ldr r0, [r5, #4]
	str r0, [r4, #0x3c]
	ldr r0, [r5, #8]
	str r0, [r4, #0x40]
	ldr r0, [r5, #0x10]
	str r0, [r4, #8]
	ldr r0, [r5, #0x14]
	str r0, [r4, #0xc]
	ldr r0, [r5, #0x18]
	str r0, [r4, #0x10]
	ldr r0, [r5, #0x1c]
	str r0, [r4, #0x18]
	ldr r0, [r5, #0x20]
	str r0, [r4, #0x1c]
	ldr r0, [r5, #0x24]
	str r0, [r4, #0x20]
	ldr r0, [r5, #0x28]
	str r0, [r4, #0x24]
	ldr r0, [r5, #0x2c]
	str r0, [r4, #0x28]
	ldr r0, [r5, #0x30]
	str r0, [r4, #0x2c]
	ldrh r0, [r5, #0x34]
	strh r0, [r4, #0x30]
	ldrh r0, [r5, #0x36]
	add r5, #0x38
	strh r0, [r4, #0x32]
	add r0, r4, #0
	ldrb r1, [r5]
	add r0, #0x34
	strb r1, [r0]
	ldr r0, [r4, #0x24]
	bl PlayerProfile_GetTrainerGender
	add r1, r4, #0
	add r1, #0x36
	strb r0, [r1]
	mov r1, #0x1b
	add r2, r1, #0
	ldr r3, [r4]
	mov r0, #0
	add r2, #0xf4
	bl NewMsgDataFromNarc
	str r0, [r4, #0x44]
	mov r2, #0xa
	ldr r3, [r4]
	mov r0, #0
	mov r1, #0x1b
	lsl r2, r2, #6
	bl NewMsgDataFromNarc
	str r0, [r4, #0x48]
	ldr r2, [r4]
	mov r0, #0x10
	mov r1, #0x25
	bl ScrStrBufs_new_custom
	str r0, [r4, #0x50]
	ldr r0, _021F1E7C ; =0x00000439
	ldr r1, [r4]
	bl String_ctor
	str r0, [r4, #0x54]
	ldr r0, _021F1E7C ; =0x00000439
	ldr r1, [r4]
	bl String_ctor
	str r0, [r4, #0x64]
	ldr r1, [r4]
	mov r0, #0x10
	bl String_ctor
	str r0, [r4, #0x58]
	ldr r1, [r4]
	mov r0, #0x2c
	bl String_ctor
	str r0, [r4, #0x5c]
	ldr r0, [r4, #0x44]
	mov r1, #0x1d
	bl NewString_ReadMsgData
	str r0, [r4, #0x60]
	mov r6, #0
	add r5, r4, #0
_021F1E58:
	add r1, r6, #0
	ldr r0, [r4, #0x44]
	add r1, #0x1e
	bl NewString_ReadMsgData
	str r0, [r5, #0x68]
	add r1, r6, #0
	ldr r0, [r4, #0x44]
	add r1, #0x21
	bl NewString_ReadMsgData
	str r0, [r5, #0x74]
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, #3
	blt _021F1E58
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021F1E7C: .word 0x00000439
	thumb_func_end ov101_021F1D74

	thumb_func_start ov101_021F1E80
ov101_021F1E80: ; 0x021F1E80
	push {r4, r5, r6, lr}
	add r6, r0, #0
	mov r4, #0
	add r5, r6, #0
_021F1E88:
	ldr r0, [r5, #0x68]
	bl String_dtor
	ldr r0, [r5, #0x74]
	bl String_dtor
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #3
	blt _021F1E88
	ldr r0, [r6, #0x60]
	bl String_dtor
	ldr r0, [r6, #0x5c]
	bl String_dtor
	ldr r0, [r6, #0x58]
	bl String_dtor
	ldr r0, [r6, #0x64]
	bl String_dtor
	ldr r0, [r6, #0x54]
	bl String_dtor
	ldr r0, [r6, #0x50]
	bl ScrStrBufs_delete
	ldr r0, [r6, #0x48]
	bl DestroyMsgData
	ldr r0, [r6, #0x44]
	bl DestroyMsgData
	add r0, r6, #0
	add r0, #0x80
	ldr r0, [r0]
	bl FreePhoneBook
	add r0, r6, #0
	mov r1, #0
	mov r2, #0xdc
	bl MI_CpuFill8
	add r0, r6, #0
	bl FreeToHeap
	pop {r4, r5, r6, pc}
	thumb_func_end ov101_021F1E80

	thumb_func_start PhoneContact_GetName
PhoneContact_GetName: ; 0x021F1EE8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	cmp r1, #NUM_PHONE_CONTACTS
	blo _021F1EF2
	mov r1, #0
_021F1EF2:
	add r0, r1, #0
	bl GetPhoneMessageGmm
	add r2, r0, #0
	ldr r3, [r5]
	mov r0, #0
	mov r1, #0x1b
	bl NewMsgDataFromNarc
	ldr r2, [r5, #0x58]
	add r4, r0, #0
	mov r1, #0
	bl ReadMsgDataIntoString
	add r0, r4, #0
	bl DestroyMsgData
	ldr r0, [r5, #0x58]
	pop {r3, r4, r5, pc}
	thumb_func_end PhoneContact_GetName

	thumb_func_start PhoneContact_GetClass
PhoneContact_GetClass: ; 0x021F1F18
	push {r4, lr}
	add r4, r0, #0
	cmp r1, #NUM_PHONE_CONTACTS
	blo _021F1F22
	mov r1, #0
_021F1F22:
	add r0, r4, #0
	add r0, #0x84
	ldr r2, [r0]
	mov r0, #0x14
	mul r0, r1
	add r0, r2, r0
	ldrb r2, [r0, #3]
	cmp r2, #0xc8
	bne _021F1F3C
	ldr r0, [r4, #0x5c]
	bl StringSetEmpty
	b _021F1F60
_021F1F3C:
	cmp r2, #0xc9
	blo _021F1F4E
	sub r2, #0xa3
	add r1, r2, #0
	ldr r0, [r4, #0x44]
	ldr r2, [r4, #0x5c]
	bl ReadMsgDataIntoString
	b _021F1F60
_021F1F4E:
	ldr r0, [r4, #0x50]
	mov r1, #0
	bl BufferTrainerClassName
	ldr r0, [r4, #0x50]
	ldr r1, [r4, #0x5c]
	ldr r2, [r4, #0x60]
	bl StringExpandPlaceholders
_021F1F60:
	ldr r0, [r4, #0x5c]
	pop {r4, pc}
	thumb_func_end PhoneContact_GetClass

	thumb_func_start ov101_021F1F64
ov101_021F1F64: ; 0x021F1F64
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r5, #0
	add r4, #0x88
	add r6, r1, #0
	add r7, r2, #0
	add r0, r4, #0
	mov r1, #0
	mov r2, #0x54
	str r3, [sp]
	bl MI_CpuFill8
	cmp r6, #NUM_PHONE_CONTACTS
	blo _021F1F8C
	bl GF_AssertFail
	mov r0, #0xff
	str r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021F1F8C:
	cmp r7, #0
	ldrh r0, [r5, #0x30]
	beq _021F1FA2
	bl MapHeader_GetField14_1E
	cmp r0, #0
	bne _021F1FB2
	mov r0, #0xff
	str r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021F1FA2:
	bl MapHeader_GetField14_1D
	cmp r0, #0
	bne _021F1FB2
	mov r0, #0xff
	str r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021F1FB2:
	strb r6, [r4, #0x18]
	add r5, #0x84
	mov r0, #0x14
	ldr r1, [r5]
	mul r0, r6
	add r0, r1, r0
	str r0, [r4, #0x10]
	strb r7, [r4, #0x19]
	ldr r0, [sp]
	add r1, r4, #0
	strb r0, [r4, #0x1a]
	add r0, sp, #8
	ldrb r0, [r0, #0x10]
	add r1, #0x38
	strh r0, [r4, #0x1c]
	ldrb r0, [r4, #0x19]
	str r0, [r4]
	add r0, r4, #0
	add r0, #0x28
	bl GF_RTC_CopyDateTime
	ldr r0, [r4, #0x38]
	bl GF_RTC_GetTimeOfDayWildParamByHour
	add r1, r4, #0
	add r1, #0x23
	strb r0, [r1]
	mov r0, #0
	strh r0, [r4, #0x20]
	strh r0, [r4, #0x1e]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov101_021F1F64

	thumb_func_start ov101_021F1FF4
ov101_021F1FF4: ; 0x021F1FF4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	add r4, r5, #0
	mov r1, #0
	add r4, #0x88
	bl FillWindowPixelBuffer
	ldr r0, [r5, #0xc]
	bl ScheduleWindowCopyToVram
	ldr r0, [r4, #0x10]
	ldrb r0, [r0, #1]
	cmp r0, #0xf
	bhi _021F20F2
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021F201E: ; jump table
	.short _021F203E - _021F201E - 2 ; case 0
	.short _021F204A - _021F201E - 2 ; case 1
	.short _021F2056 - _021F201E - 2 ; case 2
	.short _021F2062 - _021F201E - 2 ; case 3
	.short _021F20B6 - _021F201E - 2 ; case 4
	.short _021F206E - _021F201E - 2 ; case 5
	.short _021F20CE - _021F201E - 2 ; case 6
	.short _021F207A - _021F201E - 2 ; case 7
	.short _021F2092 - _021F201E - 2 ; case 8
	.short _021F2086 - _021F201E - 2 ; case 9
	.short _021F209E - _021F201E - 2 ; case 10
	.short _021F20AA - _021F201E - 2 ; case 11
	.short _021F20C2 - _021F201E - 2 ; case 12
	.short _021F20DA - _021F201E - 2 ; case 13
	.short _021F20E6 - _021F201E - 2 ; case 14
	.short _021F20F2 - _021F201E - 2 ; case 15
_021F203E:
	add r0, r5, #0
	add r1, r4, #0
	bl ov101_021F2B80
	strh r0, [r4, #0x1e]
	b _021F20F8
_021F204A:
	add r0, r5, #0
	add r1, r4, #0
	bl ov101_021F27E4
	strh r0, [r4, #0x1e]
	b _021F20F8
_021F2056:
	add r0, r5, #0
	add r1, r4, #0
	bl ov101_021F2A28
	strh r0, [r4, #0x1e]
	b _021F20F8
_021F2062:
	add r0, r5, #0
	add r1, r4, #0
	bl ov101_021F30AC
	strh r0, [r4, #0x1e]
	b _021F20F8
_021F206E:
	add r0, r5, #0
	add r1, r4, #0
	bl ov101_021F3518
	strh r0, [r4, #0x1e]
	b _021F20F8
_021F207A:
	add r0, r5, #0
	add r1, r4, #0
	bl ov101_021F35C4
	strh r0, [r4, #0x1e]
	b _021F20F8
_021F2086:
	add r0, r5, #0
	add r1, r4, #0
	bl ov101_021F388C
	strh r0, [r4, #0x1e]
	b _021F20F8
_021F2092:
	add r0, r5, #0
	add r1, r4, #0
	bl ov101_021F36F4
	strh r0, [r4, #0x1e]
	b _021F20F8
_021F209E:
	add r0, r5, #0
	add r1, r4, #0
	bl ov101_021F3AA4
	strh r0, [r4, #0x1e]
	b _021F20F8
_021F20AA:
	add r0, r5, #0
	add r1, r4, #0
	bl ov101_021F3C8C
	strh r0, [r4, #0x1e]
	b _021F20F8
_021F20B6:
	add r0, r5, #0
	add r1, r4, #0
	bl ov101_021F342C
	strh r0, [r4, #0x1e]
	b _021F20F8
_021F20C2:
	add r0, r5, #0
	add r1, r4, #0
	bl ov101_021F3EA8
	strh r0, [r4, #0x1e]
	b _021F20F8
_021F20CE:
	add r0, r5, #0
	add r1, r4, #0
	bl ov101_021F3530
	strh r0, [r4, #0x1e]
	b _021F20F8
_021F20DA:
	add r0, r5, #0
	add r1, r4, #0
	bl ov101_021F410C
	strh r0, [r4, #0x1e]
	b _021F20F8
_021F20E6:
	add r0, r5, #0
	add r1, r4, #0
	bl ov101_021F4274
	strh r0, [r4, #0x1e]
	b _021F20F8
_021F20F2:
	mov r0, #0
	strh r0, [r4, #0x20]
	strh r0, [r4, #0x1e]
_021F20F8:
	ldrh r0, [r4, #0x20]
	cmp r0, #2
	bhi _021F210A
	ldrh r1, [r4, #0x1e]
	mov r0, #6
	ldr r2, _021F210C ; =ov101_021F8B7C
	mul r0, r1
	add r0, r2, r0
	str r0, [r4, #0x14]
_021F210A:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021F210C: .word ov101_021F8B7C
	thumb_func_end ov101_021F1FF4

	thumb_func_start ov101_021F2110
ov101_021F2110: ; 0x021F2110
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	add r0, #0xa0
	ldrb r0, [r0]
	bl GetPhoneMessageGmm
	add r2, r0, #0
	ldr r3, [r4]
	mov r0, #0
	mov r1, #0x1b
	bl NewMsgDataFromNarc
	str r0, [r4, #0x4c]
	ldr r0, [r4, #0x50]
	ldr r2, [r4, #0x24]
	mov r1, #0
	bl BufferPlayersName
	add r1, r4, #0
	add r1, #0xa0
	ldrb r1, [r1]
	add r0, r4, #0
	bl PhoneContact_GetName
	mov r1, #1
	str r1, [sp]
	mov r3, #2
	str r3, [sp, #4]
	add r2, r0, #0
	ldr r0, [r4, #0x50]
	bl BufferString
	ldrh r0, [r4, #0x30]
	bl MapHeader_GetMapSec
	add r2, r0, #0
	ldr r0, [r4, #0x50]
	mov r1, #2
	bl BufferLandmarkName
	add r0, r4, #0
	add r0, #0x98
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	bl MapHeader_GetMapSec
	add r2, r0, #0
	ldr r0, [r4, #0x50]
	mov r1, #3
	bl BufferLandmarkName
	add sp, #8
	pop {r4, pc}
	thumb_func_end ov101_021F2110

	thumb_func_start ov101_021F217C
ov101_021F217C: ; 0x021F217C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021F219C ; =ov101_021F8400
	bl sub_02025320
	cmp r0, #0
	beq _021F2198
	ldr r0, [r4, #0x40]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	ldr r0, [r4, #0x40]
	bl sub_02024964
_021F2198:
	pop {r4, pc}
	nop
_021F219C: .word ov101_021F8400
	thumb_func_end ov101_021F217C

	thumb_func_start PhoneCallMessagePrint
PhoneCallMessagePrint: ; 0x021F21A0
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	add r0, r1, #0
	add r1, r4, #0
	add r1, #0x36
	ldrb r1, [r1]
	ldrb r1, [r2, r1]
	ldr r2, [r4, #0x64]
	bl ReadMsgDataIntoString
	ldr r0, [r4, #0x50]
	ldr r1, [r4, #0x54]
	ldr r2, [r4, #0x64]
	bl StringExpandPlaceholders
	ldr r0, [r4, #0xc]
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r1, #0
	add r0, r4, #0
	str r1, [sp]
	add r0, #0x34
	ldrb r0, [r0]
	add r3, r1, #0
	str r0, [sp, #4]
	ldr r0, _021F21EC ; =0x00010200
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, [r4, #0xc]
	ldr r2, [r4, #0x54]
	bl AddTextPrinterParameterized2
	add r4, #0x35
	strb r0, [r4]
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
_021F21EC: .word 0x00010200
	thumb_func_end PhoneCallMessagePrint

	thumb_func_start PhoneCallMessagePrint2
PhoneCallMessagePrint2: ; 0x021F21F0
	push {r4, lr}
	add r4, r0, #0
	add r4, #0x37
	strb r2, [r4]
	add r2, r0, #0
	add r2, #0x38
	strb r3, [r2]
	add r2, r0, #0
	add r2, #0x37
	bl PhoneCallMessagePrint
	pop {r4, pc}
	thumb_func_end PhoneCallMessagePrint2

	thumb_func_start PhoneCallMessagePrint3
PhoneCallMessagePrint3: ; 0x021F2208
	add r3, r0, #0
	add r3, #0x37
	strb r2, [r3]
	add r3, r0, #0
	add r3, #0x38
	strb r2, [r3]
	add r2, r0, #0
	ldr r3, _021F221C ; =PhoneCallMessagePrint
	add r2, #0x37
	bx r3
	.balign 4, 0
_021F221C: .word PhoneCallMessagePrint
	thumb_func_end PhoneCallMessagePrint3

	thumb_func_start ov101_021F2220
ov101_021F2220: ; 0x021F2220
	push {r4, lr}
	add r4, r0, #0
	bl ov101_021F217C
	add r0, r4, #0
	add r0, #0x35
	ldrb r0, [r0]
	bl TextPrinterCheckActive
	cmp r0, #0
	beq _021F223A
	mov r0, #0
	pop {r4, pc}
_021F223A:
	bl sub_02002C04
	add r4, #0xaa
	strb r0, [r4]
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov101_021F2220

	thumb_func_start ov101_021F2248
ov101_021F2248: ; 0x021F2248
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r1, #0
	add r4, r0, #0
	ldrh r0, [r5, #2]
	add r6, r4, #0
	add r6, #0x88
	lsl r1, r0, #0x1c
	lsr r1, r1, #0x1c
	cmp r1, #5
	bhi _021F2304
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021F226A: ; jump table
	.short _021F2304 - _021F226A - 2 ; case 0
	.short _021F22BC - _021F226A - 2 ; case 1
	.short _021F22BC - _021F226A - 2 ; case 2
	.short _021F2276 - _021F226A - 2 ; case 3
	.short _021F2284 - _021F226A - 2 ; case 4
	.short _021F22D8 - _021F226A - 2 ; case 5
_021F2276:
	ldrb r1, [r6, #0x18]
	ldr r0, [r4, #0x20]
	mov r2, #1
	bl PhoneRematches_SetSeeking
	add sp, #8
	pop {r4, r5, r6, pc}
_021F2284:
	ldrh r2, [r5, #4]
	cmp r2, #0x95
	bne _021F229C
	bl MTRandom
	mov r1, #0xa
	bl _u32_div_f
	add r1, #0x95
	lsl r0, r1, #0x10
	lsr r2, r0, #0x10
	b _021F22B0
_021F229C:
	cmp r2, #4
	bne _021F22B0
	bl MTRandom
	mov r1, #3
	bl _u32_div_f
	add r0, r1, #2
	lsl r0, r0, #0x10
	lsr r2, r0, #0x10
_021F22B0:
	ldrb r1, [r6, #0x18]
	ldr r0, [r4, #0x20]
	bl PhoneRematches_GiftItemIdSet
	add sp, #8
	pop {r4, r5, r6, pc}
_021F22BC:
	lsl r0, r0, #0x10
	lsr r0, r0, #0x14
	ldr r0, [r4, #0x28]
	beq _021F22CE
	ldrh r1, [r5, #4]
	bl SetFlagInArray
	add sp, #8
	pop {r4, r5, r6, pc}
_021F22CE:
	ldrh r1, [r5, #4]
	bl ClearFlagInArray
	add sp, #8
	pop {r4, r5, r6, pc}
_021F22D8:
	bl LCRandom
	ldrh r1, [r5, #2]
	lsl r1, r1, #0x10
	lsr r1, r1, #0x14
	bl _s32_div_f
	ldrh r2, [r5, #4]
	ldr r0, [r4, #0x4c]
	add r1, r2, r1
	ldr r2, [r4, #0x54]
	bl ReadMsgDataIntoString
	mov r0, #1
	str r0, [sp]
	mov r3, #2
	str r3, [sp, #4]
	ldr r0, [r4, #0x50]
	ldr r2, [r4, #0x54]
	mov r1, #4
	bl BufferString
_021F2304:
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end ov101_021F2248

	thumb_func_start ov101_021F2308
ov101_021F2308: ; 0x021F2308
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #4]
	add r4, r1, #0
	mov r1, #2
	mov r2, #1
	bl ov101_021F0ACC
	ldr r0, [r5, #4]
	mov r1, #0
	add r2, r4, #0
	bl ov101_021F09B0
	str r0, [r5, #0x14]
	ldr r0, [r5, #0x40]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add r0, r5, #0
	mov r1, #1
	bl ov101_021F2384
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov101_021F2308

	thumb_func_start ov101_021F2338
ov101_021F2338: ; 0x021F2338
	ldr r3, _021F2340 ; =sub_020186A4
	ldr r0, [r0, #0x14]
	bx r3
	nop
_021F2340: .word sub_020186A4
	thumb_func_end ov101_021F2338

	thumb_func_start ov101_021F2344
ov101_021F2344: ; 0x021F2344
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x14]
	bl sub_02018674
	ldr r1, [r4, #0x3c]
	str r0, [r1]
	ldr r0, [r4, #0x14]
	bl sub_02018680
	mov r1, #0
	ldr r0, [r4, #4]
	add r2, r1, #0
	bl ov101_021F0ACC
	ldr r0, [r4, #0x40]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	add r0, r4, #0
	mov r1, #0
	bl ov101_021F2384
	pop {r4, pc}
	thumb_func_end ov101_021F2344

	thumb_func_start ov101_021F2374
ov101_021F2374: ; 0x021F2374
	mov r1, #6
	ldr r2, _021F2380 ; =ov101_021F8B7C
	mul r1, r0
	add r0, r2, r1
	bx lr
	nop
_021F2380: .word ov101_021F8B7C
	thumb_func_end ov101_021F2374

	thumb_func_start ov101_021F2384
ov101_021F2384: ; 0x021F2384
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	cmp r1, #0
	beq _021F23B0
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	mov r2, #0x10
	ldr r0, [r4, #0x18]
	add r3, r2, #0
	bl sub_02003E5C
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r0, [r4, #0x18]
	mov r2, #0xa0
	mov r3, #0x10
	bl sub_02003E5C
	b _021F23D4
_021F23B0:
	mov r0, #8
	str r0, [sp]
	mov r1, #0
	str r1, [sp, #4]
	mov r2, #0x10
	ldr r0, [r4, #0x18]
	add r3, r2, #0
	bl sub_02003E5C
	mov r0, #8
	str r0, [sp]
	mov r1, #0
	str r1, [sp, #4]
	ldr r0, [r4, #0x18]
	mov r2, #0xa0
	mov r3, #0x10
	bl sub_02003E5C
_021F23D4:
	ldr r0, [r4, #0x18]
	mov r1, #1
	bl sub_02003B50
	ldr r0, [r4, #0x18]
	bl sub_0200398C
	ldr r0, [r4, #0x18]
	mov r1, #0
	bl sub_02003B50
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov101_021F2384

	thumb_func_start ov101_021F23F0
ov101_021F23F0: ; 0x021F23F0
	push {r4, lr}
	add r4, r0, #0
	bl ov101_021F217C
	ldr r0, _021F2430 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #3
	tst r0, r1
	beq _021F2412
	ldr r0, _021F2434 ; =0x000005DC
	bl PlaySE
	mov r0, #0
	add r4, #0xaa
	strb r0, [r4]
	mov r0, #1
	pop {r4, pc}
_021F2412:
	ldr r0, _021F2438 ; =ov101_021F8400
	bl sub_02025320
	cmp r0, #0
	beq _021F242A
	ldr r0, _021F2434 ; =0x000005DC
	bl PlaySE
	mov r0, #1
	add r4, #0xaa
	strb r0, [r4]
	pop {r4, pc}
_021F242A:
	mov r0, #0
	pop {r4, pc}
	nop
_021F2430: .word gSystem
_021F2434: .word 0x000005DC
_021F2438: .word ov101_021F8400
	thumb_func_end ov101_021F23F0

	thumb_func_start ov101_021F243C
ov101_021F243C: ; 0x021F243C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r6, r1, #0
	add r4, r2, #0
	bne _021F2450
	ldr r0, [r5, #0xc]
	mov r1, #0
	bl FillWindowPixelBuffer
_021F2450:
	cmp r6, #0
	ldr r0, _021F2490 ; =0x00010200
	bne _021F2472
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	str r0, [sp, #8]
	lsl r2, r4, #2
	str r1, [sp, #0xc]
	add r2, r5, r2
	ldr r0, [r5, #0xc]
	ldr r2, [r2, #0x68]
	add r3, r1, #0
	bl AddTextPrinterParameterized2
	add sp, #0x10
	pop {r4, r5, r6, pc}
_021F2472:
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	str r0, [sp, #8]
	lsl r2, r4, #2
	str r1, [sp, #0xc]
	add r2, r5, r2
	ldr r0, [r5, #0xc]
	ldr r2, [r2, #0x74]
	add r3, r1, #0
	bl AddTextPrinterParameterized2
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_021F2490: .word 0x00010200
	thumb_func_end ov101_021F243C

	thumb_func_start ov101_021F2494
ov101_021F2494: ; 0x021F2494
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r5, #0
	add r4, #0x88
	bl ov101_021F217C
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _021F24B0
	cmp r0, #1
	beq _021F24C6
	cmp r0, #2
	beq _021F24EA
	b _021F2500
_021F24B0:
	ldr r0, _021F250C ; =0x00000878
	bl PlaySE
	ldr r2, [r4, #8]
	add r0, r5, #0
	lsl r2, r2, #0x18
	mov r1, #0
	lsr r2, r2, #0x18
	bl ov101_021F243C
	b _021F2500
_021F24C6:
	ldr r0, _021F250C ; =0x00000878
	bl IsSEPlaying
	cmp r0, #0
	beq _021F24D4
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F24D4:
	ldr r0, _021F250C ; =0x00000878
	bl PlaySE
	ldr r2, [r4, #8]
	add r0, r5, #0
	lsl r2, r2, #0x18
	mov r1, #0
	lsr r2, r2, #0x18
	bl ov101_021F243C
	b _021F2500
_021F24EA:
	ldr r0, _021F250C ; =0x00000878
	bl IsSEPlaying
	cmp r0, #0
	beq _021F24F8
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F24F8:
	mov r0, #0
	str r0, [r4, #8]
	mov r0, #1
	pop {r3, r4, r5, pc}
_021F2500:
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_021F250C: .word 0x00000878
	thumb_func_end ov101_021F2494

	thumb_func_start ov101_021F2510
ov101_021F2510: ; 0x021F2510
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r5, #0
	add r4, #0x88
	bl ov101_021F217C
	ldr r0, [r4, #8]
	cmp r0, #3
	bhi _021F258A
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021F252E: ; jump table
	.short _021F2536 - _021F252E - 2 ; case 0
	.short _021F2550 - _021F252E - 2 ; case 1
	.short _021F2550 - _021F252E - 2 ; case 2
	.short _021F2572 - _021F252E - 2 ; case 3
_021F2536:
	ldr r0, _021F2594 ; =0x0000087A
	bl PlaySE
	ldr r2, [r4, #8]
	add r0, r5, #0
	lsl r2, r2, #0x18
	mov r1, #1
	lsr r2, r2, #0x18
	bl ov101_021F243C
	mov r0, #0
	strh r0, [r4, #0x24]
	b _021F258A
_021F2550:
	ldrh r1, [r4, #0x24]
	add r0, r1, #1
	strh r0, [r4, #0x24]
	cmp r1, #0xa
	bhs _021F255E
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F255E:
	mov r0, #0
	strh r0, [r4, #0x24]
	ldr r2, [r4, #8]
	add r0, r5, #0
	lsl r2, r2, #0x18
	mov r1, #1
	lsr r2, r2, #0x18
	bl ov101_021F243C
	b _021F258A
_021F2572:
	ldrh r1, [r4, #0x24]
	add r0, r1, #1
	strh r0, [r4, #0x24]
	cmp r1, #0xa
	bhs _021F2580
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F2580:
	mov r0, #0
	strh r0, [r4, #0x24]
	str r0, [r4, #8]
	mov r0, #1
	pop {r3, r4, r5, pc}
_021F258A:
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021F2594: .word 0x0000087A
	thumb_func_end ov101_021F2510

	thumb_func_start ov101_021F2598
ov101_021F2598: ; 0x021F2598
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r5, #0
	add r4, #0x88
	bl ov101_021F217C
	ldr r2, [r4, #8]
	cmp r2, #3
	bhi _021F2608
	add r0, r2, r2
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021F25B6: ; jump table
	.short _021F25BE - _021F25B6 - 2 ; case 0
	.short _021F25D0 - _021F25B6 - 2 ; case 1
	.short _021F25D0 - _021F25B6 - 2 ; case 2
	.short _021F25F0 - _021F25B6 - 2 ; case 3
_021F25BE:
	lsl r2, r2, #0x18
	add r0, r5, #0
	mov r1, #0
	lsr r2, r2, #0x18
	bl ov101_021F243C
	mov r0, #0
	strh r0, [r4, #0x24]
	b _021F2608
_021F25D0:
	ldrh r1, [r4, #0x24]
	add r0, r1, #1
	strh r0, [r4, #0x24]
	cmp r1, #0xa
	bhs _021F25DE
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F25DE:
	mov r1, #0
	strh r1, [r4, #0x24]
	ldr r2, [r4, #8]
	add r0, r5, #0
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	bl ov101_021F243C
	b _021F2608
_021F25F0:
	ldrh r1, [r4, #0x24]
	add r0, r1, #1
	strh r0, [r4, #0x24]
	cmp r1, #0xa
	bhs _021F25FE
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F25FE:
	mov r0, #0
	strh r0, [r4, #0x24]
	str r0, [r4, #8]
	mov r0, #1
	pop {r3, r4, r5, pc}
_021F2608:
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov101_021F2598

	thumb_func_start ov101_021F2614
ov101_021F2614: ; 0x021F2614
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r5, #0
	add r4, #0x88
	bl ov101_021F217C
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _021F262C
	cmp r0, #1
	beq _021F265C
	b _021F2672
_021F262C:
	add r0, r4, #0
	add r0, #0x23
	ldrb r0, [r0]
	ldrb r1, [r4, #0x19]
	lsl r2, r0, #1
	mov r0, #6
	mul r0, r1
	add r0, r2, r0
	ldr r1, [r4, #0x10]
	lsl r0, r0, #0x10
	ldrb r2, [r1, #0xc]
	lsr r3, r0, #0x10
	mov r1, #0xc
	ldr r0, _021F267C ; =ov101_021F962C
	mul r1, r2
	add r6, r0, r1
	ldrb r2, [r6, r3]
	add r3, r3, #1
	ldrb r3, [r6, r3]
	ldr r1, [r5, #0x48]
	add r0, r5, #0
	bl PhoneCallMessagePrint2
	b _021F2672
_021F265C:
	add r0, r5, #0
	bl ov101_021F2220
	cmp r0, #0
	bne _021F266A
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F266A:
	mov r0, #0
	str r0, [r4, #8]
	mov r0, #1
	pop {r4, r5, r6, pc}
_021F2672:
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021F267C: .word ov101_021F962C
	thumb_func_end ov101_021F2614

	thumb_func_start ov101_021F2680
ov101_021F2680: ; 0x021F2680
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r5, #0
	add r4, #0x88
	ldr r1, [r4, #4]
	ldr r6, [r4, #0x14]
	cmp r1, #3
	bhi _021F26EC
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021F269C: ; jump table
	.short _021F26A4 - _021F269C - 2 ; case 0
	.short _021F26C0 - _021F269C - 2 ; case 1
	.short _021F26CC - _021F269C - 2 ; case 2
	.short _021F26D6 - _021F269C - 2 ; case 3
_021F26A4:
	bl ov101_021F2110
	add r0, r5, #0
	add r1, r6, #0
	bl ov101_021F2248
	ldr r0, [r4, #0x10]
	ldrb r0, [r0, #0xc]
	cmp r0, #0xff
	bne _021F26EC
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _021F26EC
_021F26C0:
	bl ov101_021F2614
	cmp r0, #0
	bne _021F26EC
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F26CC:
	ldr r1, [r5, #0x4c]
	add r2, r6, #0
	bl PhoneCallMessagePrint
	b _021F26EC
_021F26D6:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F26E2
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F26E2:
	ldr r0, [r5, #0x4c]
	bl DestroyMsgData
	mov r0, #1
	pop {r4, r5, r6, pc}
_021F26EC:
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov101_021F2680

	thumb_func_start ov101_021F26F8
ov101_021F26F8: ; 0x021F26F8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x88
	mov r3, #1
	add r4, r5, #0
	ldr r1, [r1]
	lsl r3, r3, #8
	add r4, #0x88
	cmp r1, r3
	bgt _021F2732
	bge _021F279C
	cmp r1, #3
	bgt _021F272C
	cmp r1, #0
	blt _021F27D4
	add r2, r1, r1
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_021F2724: ; jump table
	.short _021F2744 - _021F2724 - 2 ; case 0
	.short _021F2750 - _021F2724 - 2 ; case 1
	.short _021F276E - _021F2724 - 2 ; case 2
	.short _021F277A - _021F2724 - 2 ; case 3
_021F272C:
	cmp r1, #0xff
	beq _021F278E
	b _021F27D4
_021F2732:
	add r2, r3, #1
	cmp r1, r2
	bgt _021F273C
	beq _021F27B4
	b _021F27D4
_021F273C:
	add r2, r3, #2
	cmp r1, r2
	beq _021F27C0
	b _021F27D4
_021F2744:
	bl ov101_021F2494
	cmp r0, #0
	bne _021F27D4
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F2750:
	ldrh r1, [r4, #0x20]
	lsl r2, r1, #2
	ldr r1, _021F27E0 ; =ov101_021F867C
	ldr r1, [r1, r2]
	blx r1
	cmp r0, #0
	bne _021F2762
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F2762:
	add r0, r4, #0
	add r0, #0x22
	ldrb r1, [r0]
	ldr r0, [r5, #0x3c]
	str r1, [r0]
	b _021F27D4
_021F276E:
	bl ov101_021F23F0
	cmp r0, #0
	bne _021F27D4
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F277A:
	bl ov101_021F2510
	cmp r0, #0
	bne _021F2786
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F2786:
	mov r0, #0
	str r0, [r4]
	mov r0, #1
	pop {r3, r4, r5, pc}
_021F278E:
	add r0, r5, #0
	bl ov101_021F2598
	cmp r0, #0
	bne _021F27D4
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F279C:
	bl ov101_021F2510
	cmp r0, #0
	bne _021F27A8
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F27A8:
	ldr r1, [r5, #0x44]
	add r0, r5, #0
	mov r2, #0x25
	bl PhoneCallMessagePrint3
	b _021F27D4
_021F27B4:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F27D4
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F27C0:
	bl ov101_021F23F0
	cmp r0, #0
	bne _021F27CC
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F27CC:
	mov r0, #0
	str r0, [r4]
	mov r0, #1
	pop {r3, r4, r5, pc}
_021F27D4:
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_021F27E0: .word ov101_021F867C
	thumb_func_end ov101_021F26F8

	thumb_func_start ov101_021F27E4
ov101_021F27E4: ; 0x021F27E4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #0
	strh r0, [r4, #0x20]
	ldrb r1, [r4, #0x1a]
	cmp r1, #2
	bne _021F2804
	ldr r0, [r5, #0x28]
	mov r1, #0xa7
	bl SetFlagInArray
	mov r0, #4
	strh r0, [r4, #0x20]
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F2804:
	ldr r1, [r4, #0x10]
	ldrh r2, [r1, #6]
	ldrh r1, [r5, #0x30]
	cmp r2, r1
	bne _021F2812
	mov r0, #0x17
	pop {r3, r4, r5, pc}
_021F2812:
	ldrb r1, [r4, #0x19]
	cmp r1, #0
	beq _021F281E
	strh r0, [r4, #0x20]
	ldrh r0, [r4, #0x1c]
	pop {r3, r4, r5, pc}
_021F281E:
	ldr r0, [r5, #0x28]
	mov r1, #0x79
	bl CheckFlagInArray
	cmp r0, #0
	bne _021F282E
	mov r0, #0x19
	pop {r3, r4, r5, pc}
_021F282E:
	ldr r0, [r5, #0x28]
	mov r1, #0xa7
	bl CheckFlagInArray
	cmp r0, #0
	bne _021F283E
	mov r0, #0x1a
	pop {r3, r4, r5, pc}
_021F283E:
	mov r0, #4
	strh r0, [r4, #0x20]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov101_021F27E4

	thumb_func_start GearPhoneCall_Mom
GearPhoneCall_Mom: ; 0x021F2848
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	add r4, r5, #0
	add r4, #0x88
	ldr r1, [r4, #4]
	cmp r1, #4
	bls _021F285A
	b _021F29BE
_021F285A:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021F2866: ; jump table
	.short _021F2870 - _021F2866 - 2 ; case 0
	.short _021F28FC - _021F2866 - 2 ; case 1
	.short _021F292A - _021F2866 - 2 ; case 2
	.short _021F2940 - _021F2866 - 2 ; case 3
	.short _021F2958 - _021F2866 - 2 ; case 4
_021F2870:
	bl ov101_021F2110
	mov r1, #0
	ldr r0, [r5, #0x20]
	add r2, r1, #0
	bl MomSavingsBalanceAction
	str r0, [r4, #0x44]
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r5, #0x50]
	ldr r2, [r4, #0x44]
	mov r1, #0xa
	mov r3, #6
	bl BufferIntegerAsString
	ldr r0, [r5, #0x28]
	bl ScriptState_MomsSavingsFlagCheck
	add r1, r4, #0
	add r1, #0x4d
	ldrb r1, [r1]
	mov r2, #1
	lsl r0, r0, #0x18
	bic r1, r2
	lsr r2, r0, #0x18
	mov r0, #1
	and r0, r2
	orr r1, r0
	add r0, r4, #0
	add r0, #0x4d
	strb r1, [r0]
	ldr r0, [r5, #0x20]
	bl sub_0202F240
	add r1, r4, #0
	add r1, #0x4d
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	lsl r0, r0, #0x1f
	ldrb r1, [r1]
	mov r2, #2
	lsr r0, r0, #0x1e
	bic r1, r2
	orr r1, r0
	add r0, r4, #0
	add r0, #0x4d
	strb r1, [r0]
	ldrb r0, [r4, #0x1a]
	cmp r0, #2
	bne _021F28E4
	mov r0, #2
	str r0, [r4, #4]
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F28E4:
	add r0, r5, #0
	add r1, r4, #0
	bl MomCallGetIntroMsgByLocation
	add r2, r0, #0
	lsl r2, r2, #0x18
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	lsr r2, r2, #0x18
	bl PhoneCallMessagePrint3
	b _021F29DA
_021F28FC:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F290A
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F290A:
	add r0, r4, #0
	add r0, #0x4d
	ldrb r0, [r0]
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1f
	beq _021F29DA
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #msg_0664_00021
	bl PhoneCallMessagePrint3
	mov r0, #0xff
	str r0, [r4, #4]
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F292A:
	add r1, r4, #0
	bl MomCallGetSaveMoneyPromptMsg
	add r2, r0, #0
	lsl r2, r2, #0x18
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	lsr r2, r2, #0x18
	bl PhoneCallMessagePrint3
	b _021F29DA
_021F2940:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F294E
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F294E:
	add r0, r5, #0
	mov r1, #2
	bl ov101_021F2308
	b _021F29DA
_021F2958:
	bl ov101_021F2338
	add r6, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r6, r0
	bne _021F296C
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F296C:
	add r0, r5, #0
	bl ov101_021F2344
	cmp r6, #0
	bne _021F2992
	add r0, r4, #0
	add r0, #0x4d
	ldrb r1, [r0]
	mov r0, #2
	mov r2, #msg_0664_00025
	orr r1, r0
	add r0, r4, #0
	add r0, #0x4d
	strb r1, [r0]
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	bl PhoneCallMessagePrint3
	b _021F29AC
_021F2992:
	add r0, r4, #0
	add r0, #0x4d
	ldrb r1, [r0]
	mov r0, #2
	mov r2, #msg_0664_00026
	bic r1, r0
	add r0, r4, #0
	add r0, #0x4d
	strb r1, [r0]
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	bl PhoneCallMessagePrint3
_021F29AC:
	add r1, r4, #0
	add r1, #0x4d
	ldrb r1, [r1]
	ldr r0, [r5, #0x28]
	lsl r1, r1, #0x1e
	lsr r1, r1, #0x1f
	bl ScriptState_MomsSavingsFlagAction
	b _021F29DA
_021F29BE:
	add r0, r5, #0
	bl ov101_021F2220
	cmp r0, #0
	bne _021F29CE
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F29CE:
	ldr r0, [r5, #0x4c]
	bl DestroyMsgData
	add sp, #8
	mov r0, #1
	pop {r4, r5, r6, pc}
_021F29DA:
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	mov r0, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end GearPhoneCall_Mom

	thumb_func_start MomCallGetIntroMsgByLocation
MomCallGetIntroMsgByLocation: ; 0x021F29E8
	push {r3, lr}
	ldrh r0, [r0, #0x30]
	bl MapHeader_GetMomCallIntroParam
	add r0, r0, #msg_0664_00007
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	pop {r3, pc}
	thumb_func_end MomCallGetIntroMsgByLocation

	thumb_func_start MomCallGetSaveMoneyPromptMsg
MomCallGetSaveMoneyPromptMsg: ; 0x021F29F8
	ldrb r0, [r1, #0x1a]
	cmp r0, #2
	bne _021F2A02
	mov r0, #0x16
	bx lr
_021F2A02:
	add r0, r1, #0
	add r0, #0x4d
	ldrb r0, [r0]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	ldr r0, [r1, #0x44]
	beq _021F2A1C
	cmp r0, #0
	beq _021F2A18
	mov r0, #msg_0664_00023
	bx lr
_021F2A18:
	mov r0, #msg_0664_00027
	bx lr
_021F2A1C:
	cmp r0, #0
	beq _021F2A24
	mov r0, #msg_0664_00024
	bx lr
_021F2A24:
	mov r0, #msg_0664_00028
	bx lr
	thumb_func_end MomCallGetSaveMoneyPromptMsg

	thumb_func_start ov101_021F2A28
ov101_021F2A28: ; 0x021F2A28
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldrb r0, [r4, #0x1a]
	cmp r0, #2
	bne _021F2A48
	ldrh r0, [r4, #0x1c]
	lsl r1, r0, #1
	ldr r0, _021F2B70 ; =ov101_021F86BC
	ldrb r0, [r0, r1]
	strh r0, [r4, #0x20]
	ldrh r0, [r4, #0x1c]
	lsl r1, r0, #1
	ldr r0, _021F2B74 ; =ov101_021F86BD
	ldrb r0, [r0, r1]
	pop {r3, r4, r5, r6, r7, pc}
_021F2A48:
	ldrb r0, [r4, #0x19]
	cmp r0, #0
	beq _021F2A56
	mov r0, #0
	strh r0, [r4, #0x20]
	ldrh r0, [r4, #0x1c]
	pop {r3, r4, r5, r6, r7, pc}
_021F2A56:
	mov r0, #0
	strh r0, [r4, #0x20]
	ldr r0, [r5, #0x24]
	bl PlayerProfile_CountBadges
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
	ldr r0, [r4, #0x10]
	ldrh r1, [r0, #6]
	ldrh r0, [r5, #0x30]
	cmp r1, r0
	bne _021F2A72
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021F2A72:
	ldr r0, [r5, #0x28]
	mov r1, #0xee
	bl CheckFlagInArray
	cmp r0, #0
	bne _021F2A82
	mov r0, #8
	pop {r3, r4, r5, r6, r7, pc}
_021F2A82:
	ldr r0, [r5, #0x28]
	mov r1, #0x79
	bl CheckFlagInArray
	cmp r0, #0
	bne _021F2A92
	mov r0, #9
	pop {r3, r4, r5, r6, r7, pc}
_021F2A92:
	ldr r0, [r5, #0x28]
	mov r1, #0x9f
	bl CheckFlagInArray
	cmp r0, #0
	bne _021F2AA2
	mov r0, #0xa
	pop {r3, r4, r5, r6, r7, pc}
_021F2AA2:
	ldr r0, [r5, #0x28]
	mov r1, #0x70
	bl CheckFlagInArray
	cmp r0, #0
	bne _021F2AB2
	mov r0, #0xb
	pop {r3, r4, r5, r6, r7, pc}
_021F2AB2:
	ldr r0, [r5, #0x28]
	ldr r1, _021F2B78 ; =0x00000983
	bl CheckFlagInArray
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	ldr r0, [r5, #0x28]
	ldr r1, _021F2B7C ; =0x0000011A
	bl CheckFlagInArray
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r7, #7
	bhs _021F2AF6
	cmp r6, #0
	bne _021F2AD6
	mov r0, #0xc
	pop {r3, r4, r5, r6, r7, pc}
_021F2AD6:
	cmp r4, #0
	beq _021F2AF2
	bl LCRandom
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x1f
	sub r1, r1, r2
	mov r0, #0x1f
	ror r1, r0
	add r0, r2, r1
	add r0, #0xe
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_021F2AF2:
	mov r0, #0xd
	pop {r3, r4, r5, r6, r7, pc}
_021F2AF6:
	ldr r0, [r5, #0x28]
	bl ScriptState_IsInRocketTakeover
	cmp r0, #0
	beq _021F2B04
	mov r0, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_021F2B04:
	cmp r7, #8
	bhs _021F2B0C
	mov r0, #0x11
	pop {r3, r4, r5, r6, r7, pc}
_021F2B0C:
	ldr r0, [r5, #0x28]
	bl CheckGameClearFlag
	cmp r0, #0
	bne _021F2B1A
	mov r0, #0x12
	pop {r3, r4, r5, r6, r7, pc}
_021F2B1A:
	ldr r0, [r5, #0x28]
	mov r1, #0xf2
	bl CheckFlagInArray
	cmp r0, #0
	bne _021F2B2A
	mov r0, #0x13
	pop {r3, r4, r5, r6, r7, pc}
_021F2B2A:
	cmp r4, #0
	bne _021F2B3A
	cmp r6, #0
	beq _021F2B36
	mov r0, #0xd
	pop {r3, r4, r5, r6, r7, pc}
_021F2B36:
	mov r0, #0xc
	pop {r3, r4, r5, r6, r7, pc}
_021F2B3A:
	ldr r0, [r5, #0x28]
	mov r1, #0x65
	bl CheckFlagInArray
	cmp r0, #0
	beq _021F2B58
	bl LCRandom
	mov r1, #3
	bl _s32_div_f
	add r1, #0x14
	lsl r0, r1, #0x10
	lsr r0, r0, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_021F2B58:
	bl LCRandom
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x1f
	sub r1, r1, r2
	mov r0, #0x1f
	ror r1, r0
	add r0, r2, r1
	add r0, #0x14
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021F2B70: .word ov101_021F86BC
_021F2B74: .word ov101_021F86BD
_021F2B78: .word 0x00000983
_021F2B7C: .word 0x0000011A
	thumb_func_end ov101_021F2A28

	thumb_func_start ov101_021F2B80
ov101_021F2B80: ; 0x021F2B80
	push {r3, r4, r5, lr}
	mov r2, #0
	strh r2, [r1, #0x20]
	ldrb r2, [r1, #0x18]
	ldr r3, _021F2BBC ; =ov101_021F968C
	lsl r4, r2, #4
	mov r2, #6
	mul r2, r4
	ldrb r4, [r1, #0x19]
	cmp r4, #0
	beq _021F2BA2
	add r1, r3, r2
	add r1, #0x30
	mov r2, #8
	bl ov101_021F2BC0
	pop {r3, r4, r5, pc}
_021F2BA2:
	ldr r5, [r1, #0x10]
	ldrh r1, [r0, #0x30]
	ldrh r4, [r5, #6]
	cmp r4, r1
	bne _021F2BB0
	ldrh r0, [r5, #0xa]
	pop {r3, r4, r5, pc}
_021F2BB0:
	add r1, r3, r2
	mov r2, #8
	bl ov101_021F2BC0
	pop {r3, r4, r5, pc}
	nop
_021F2BBC: .word ov101_021F968C
	thumb_func_end ov101_021F2B80

	thumb_func_start ov101_021F2BC0
ov101_021F2BC0: ; 0x021F2BC0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	str r0, [sp]
	add r0, #0x88
	add r7, r2, #0
	str r0, [sp]
	add r4, r1, #0
	mov r6, #0
	cmp r7, #0
	ble _021F2C5C
_021F2BD4:
	ldrb r0, [r4]
	cmp r0, #0xff
	beq _021F2C5C
	cmp r0, #0
	beq _021F2C5C
	cmp r0, #8
	bhi _021F2C3C
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021F2BEE: ; jump table
	.short _021F2C3C - _021F2BEE - 2 ; case 0
	.short _021F2C3C - _021F2BEE - 2 ; case 1
	.short _021F2C00 - _021F2BEE - 2 ; case 2
	.short _021F2C1E - _021F2BEE - 2 ; case 3
	.short _021F2C28 - _021F2BEE - 2 ; case 4
	.short _021F2C32 - _021F2BEE - 2 ; case 5
	.short _021F2C3C - _021F2BEE - 2 ; case 6
	.short _021F2C0A - _021F2BEE - 2 ; case 7
	.short _021F2C14 - _021F2BEE - 2 ; case 8
_021F2C00:
	add r0, r5, #0
	add r1, r4, #0
	bl ov101_021F2CB8
	b _021F2C44
_021F2C0A:
	add r0, r5, #0
	add r1, r4, #0
	bl ov101_021F2D48
	b _021F2C44
_021F2C14:
	add r0, r5, #0
	add r1, r4, #0
	bl ov101_021F2D90
	b _021F2C44
_021F2C1E:
	add r0, r5, #0
	add r1, r4, #0
	bl ov101_021F2D10
	b _021F2C44
_021F2C28:
	add r0, r5, #0
	add r1, r4, #0
	bl ov101_021F2DC8
	b _021F2C44
_021F2C32:
	add r0, r5, #0
	add r1, r4, #0
	bl ov101_021F2DE8
	b _021F2C44
_021F2C3C:
	add r0, r5, #0
	add r1, r4, #0
	bl ov101_021F2CAC
_021F2C44:
	cmp r0, #0
	beq _021F2C52
	ldrh r1, [r4, #2]
	ldr r0, [sp]
	strh r1, [r0, #0x20]
	ldrh r0, [r4, #4]
	pop {r3, r4, r5, r6, r7, pc}
_021F2C52:
	add r6, r6, #1
	add r1, r4, #0
	add r4, r4, #6
	cmp r6, r7
	blt _021F2BD4
_021F2C5C:
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _021F2C66
	cmp r0, #0
	bne _021F2C6E
_021F2C66:
	ldr r1, [sp]
	mov r0, #0
	strh r0, [r1, #0x20]
	pop {r3, r4, r5, r6, r7, pc}
_021F2C6E:
	ldrh r2, [r1, #2]
	ldr r0, [sp]
	strh r2, [r0, #0x20]
	ldrh r0, [r1, #4]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov101_021F2BC0

	thumb_func_start ov101_021F2C78
ov101_021F2C78: ; 0x021F2C78
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl MTRandom
	add r5, r0, #0
	bl MTRandom
	add r2, r5, #0
	eor r2, r0
	lsl r0, r2, #0x10
	lsr r1, r0, #0x10
	asr r0, r2, #8
	eor r0, r1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	mov r1, #0x64
	bl _s32_div_f
	lsl r0, r1, #0x10
	lsr r0, r0, #0x10
	cmp r0, r4
	bgt _021F2CA8
	mov r0, #1
	pop {r3, r4, r5, pc}
_021F2CA8:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov101_021F2C78

	thumb_func_start ov101_021F2CAC
ov101_021F2CAC: ; 0x021F2CAC
	ldr r3, _021F2CB4 ; =ov101_021F2C78
	ldrb r0, [r1, #1]
	bx r3
	nop
_021F2CB4: .word ov101_021F2C78
	thumb_func_end ov101_021F2CAC

	thumb_func_start ov101_021F2CB8
ov101_021F2CB8: ; 0x021F2CB8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r5, #0
	add r6, #0x88
	add r4, r1, #0
	ldrb r1, [r6, #0x18]
	ldr r0, [r5, #0x20]
	bl PhoneRematches_IsSeeking
	cmp r0, #0
	beq _021F2CD2
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F2CD2:
	ldrb r1, [r6, #0x18]
	ldr r0, [r5, #0x20]
	bl PhoneRematches_GiftItemIdGet
	cmp r0, #0
	beq _021F2CE2
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F2CE2:
	ldr r0, [r5, #0x28]
	mov r1, #0xc6
	bl CheckFlagInArray
	cmp r0, #0
	bne _021F2D08
	ldrh r0, [r4, #2]
	cmp r0, #0
	bne _021F2D08
	ldrh r0, [r4, #4]
	bl ov101_021F2374
	ldrh r0, [r0, #2]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1c
	cmp r0, #3
	bne _021F2D08
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F2D08:
	ldrb r0, [r4, #1]
	bl ov101_021F2C78
	pop {r4, r5, r6, pc}
	thumb_func_end ov101_021F2CB8

	thumb_func_start ov101_021F2D10
ov101_021F2D10: ; 0x021F2D10
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r5, r1, #0
	ldr r0, [r0, #0x28]
	mov r1, #0xc6
	add r4, #0x88
	bl CheckFlagInArray
	cmp r0, #0
	bne _021F2D28
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F2D28:
	ldr r2, [r4, #0x10]
	ldr r1, [r4, #0x34]
	ldrb r0, [r2, #0xd]
	cmp r1, r0
	bne _021F2D3C
	add r4, #0x23
	ldrb r1, [r4]
	ldrb r0, [r2, #0xe]
	cmp r1, r0
	beq _021F2D40
_021F2D3C:
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F2D40:
	ldrb r0, [r5, #1]
	bl ov101_021F2C78
	pop {r3, r4, r5, pc}
	thumb_func_end ov101_021F2D10

	thumb_func_start ov101_021F2D48
ov101_021F2D48: ; 0x021F2D48
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x28]
	add r6, r1, #0
	add r4, r5, #0
	mov r1, #0xc6
	add r4, #0x88
	bl CheckFlagInArray
	cmp r0, #0
	bne _021F2D62
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F2D62:
	ldr r0, [r4, #0x10]
	ldrh r0, [r0, #6]
	cmp r0, #0x60
	bne _021F2D78
	ldr r0, [r5, #0x28]
	bl CheckFlag996
	cmp r0, #0
	beq _021F2D78
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F2D78:
	ldrb r1, [r4, #0x18]
	ldr r0, [r5, #0x20]
	bl PhoneRematches_IsSeeking
	cmp r0, #0
	bne _021F2D88
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F2D88:
	ldrb r0, [r6, #1]
	bl ov101_021F2C78
	pop {r4, r5, r6, pc}
	thumb_func_end ov101_021F2D48

	thumb_func_start ov101_021F2D90
ov101_021F2D90: ; 0x021F2D90
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r5, #0
	add r4, #0x88
	ldr r0, [r4, #0x10]
	add r6, r1, #0
	ldrh r0, [r0, #6]
	cmp r0, #0x60
	bne _021F2DB0
	ldr r0, [r5, #0x28]
	bl CheckFlag996
	cmp r0, #0
	beq _021F2DB0
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F2DB0:
	ldrb r1, [r4, #0x18]
	ldr r0, [r5, #0x20]
	bl PhoneRematches_GiftItemIdGet
	cmp r0, #0
	bne _021F2DC0
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F2DC0:
	ldrb r0, [r6, #1]
	bl ov101_021F2C78
	pop {r4, r5, r6, pc}
	thumb_func_end ov101_021F2D90

	thumb_func_start ov101_021F2DC8
ov101_021F2DC8: ; 0x021F2DC8
	push {r3, lr}
	add r0, #0xbc
	ldr r0, [r0]
	cmp r0, #2
	beq _021F2DDA
	cmp r0, #4
	beq _021F2DDA
	cmp r0, #6
	bne _021F2DE2
_021F2DDA:
	ldrb r0, [r1, #1]
	bl ov101_021F2C78
	pop {r3, pc}
_021F2DE2:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov101_021F2DC8

	thumb_func_start ov101_021F2DE8
ov101_021F2DE8: ; 0x021F2DE8
	push {r4, lr}
	ldr r0, [r0, #0x28]
	add r4, r1, #0
	bl ScriptState_IsInRocketTakeover
	cmp r0, #0
	beq _021F2DFE
	ldrb r0, [r4, #1]
	bl ov101_021F2C78
	pop {r4, pc}
_021F2DFE:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov101_021F2DE8

	thumb_func_start ov101_021F2E04
ov101_021F2E04: ; 0x021F2E04
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc4
	add r6, r0, #0
	add r5, r1, #0
	add r4, r2, #0
	bl MapHeader_HasWildEncounters
	cmp r0, #0
	bne _021F2E1C
	add sp, #0xc4
	mov r0, #SPECIES_RATTATA
	pop {r3, r4, r5, r6, pc}
_021F2E1C:
	add r0, sp, #0
	add r1, r6, #0
	bl WildEncounters_ReadFromNarc
	cmp r5, #0xb
	bne _021F2E4A
	cmp r4, #2
	bne _021F2E34
	add r0, sp, #0xc0
	ldrh r1, [r0] // swarmSpecies[3]
	add r0, sp, #0x80
	strh r1, [r0, #0x22] // goodRodSlots[3].species
_021F2E34:
	bl LCRandom
	mov r1, #5
	bl _s32_div_f
	add r0, sp, #0x94 // goodRodSlots
	lsl r1, r1, #2
	add r0, #2
	add sp, #0xc4
	ldrh r0, [r0, r1]
	pop {r3, r4, r5, r6, pc}
_021F2E4A:
	cmp r4, #0
	beq _021F2E60
	cmp r4, #1
	beq _021F2E58
	cmp r4, #2
	beq _021F2E5C
	b _021F2E60
_021F2E58:
	add r4, sp, #0x2c // landSlots.species_day
	b _021F2E62
_021F2E5C:
	add r4, sp, #0x44 // landSlots.species_nite
	b _021F2E62
_021F2E60:
	add r4, sp, #0x14 // landSlots.species_morn
_021F2E62:
	bl LCRandom
	mov r1, #0xc
	bl _s32_div_f
	lsl r0, r1, #1
	ldrh r0, [r4, r0]
	add sp, #0xc4
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov101_021F2E04

	thumb_func_start ov101_021F2E74
ov101_021F2E74: ; 0x021F2E74
	push {r3, r4, r5, lr}
	sub sp, #0x40
	add r4, r1, #0
	add r1, sp, #0xc
	add r5, r0, #0
	bl TrainerData_ReadTrData
	add r0, r4, #0
	mov r1, #0x6c
	bl AllocFromHeap
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x6c
	bl MI_CpuFill8
	add r0, r5, #0
	add r1, r4, #0
	bl TrainerData_ReadTrPoke
	add r1, sp, #0
	ldrb r0, [r1, #0xc]
	cmp r0, #3
	bhi _021F2F28
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021F2EB0: ; jump table
	.short _021F2EB8 - _021F2EB0 - 2 ; case 0
	.short _021F2ED4 - _021F2EB0 - 2 ; case 1
	.short _021F2EF0 - _021F2EB0 - 2 ; case 2
	.short _021F2F0C - _021F2EB0 - 2 ; case 3
_021F2EB8:
	ldrb r5, [r1, #0xf]
	mov r2, #0
	cmp r5, #0
	ble _021F2F34
	add r1, r4, #0
	add r3, sp, #0
_021F2EC4:
	ldrh r0, [r1, #4]
	add r2, r2, #1
	add r1, #8
	strh r0, [r3]
	add r3, r3, #2
	cmp r2, r5
	blt _021F2EC4
	b _021F2F34
_021F2ED4:
	ldrb r3, [r1, #0xf]
	mov r5, #0
	cmp r3, #0
	ble _021F2F34
	add r1, r4, #0
	add r2, sp, #0
_021F2EE0:
	ldrh r0, [r1, #4]
	add r5, r5, #1
	add r1, #0x10
	strh r0, [r2]
	add r2, r2, #2
	cmp r5, r3
	blt _021F2EE0
	b _021F2F34
_021F2EF0:
	ldrb r3, [r1, #0xf]
	mov r5, #0
	cmp r3, #0
	ble _021F2F34
	add r1, r4, #0
	add r2, sp, #0
_021F2EFC:
	ldrh r0, [r1, #4]
	add r5, r5, #1
	add r1, #0xa
	strh r0, [r2]
	add r2, r2, #2
	cmp r5, r3
	blt _021F2EFC
	b _021F2F34
_021F2F0C:
	ldrb r3, [r1, #0xf]
	mov r5, #0
	cmp r3, #0
	ble _021F2F34
	add r1, r4, #0
	add r2, sp, #0
_021F2F18:
	ldrh r0, [r1, #4]
	add r5, r5, #1
	add r1, #0x12
	strh r0, [r2]
	add r2, r2, #2
	cmp r5, r3
	blt _021F2F18
	b _021F2F34
_021F2F28:
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x40
	mov r0, #0x13
	pop {r3, r4, r5, pc}
_021F2F34:
	add r0, r4, #0
	bl FreeToHeap
	bl LCRandom
	add r1, sp, #0
	ldrb r1, [r1, #0xf]
	bl _s32_div_f
	lsl r1, r1, #1
	add r0, sp, #0
	ldrh r0, [r0, r1]
	add sp, #0x40
	pop {r3, r4, r5, pc}
	thumb_func_end ov101_021F2E74

	thumb_func_start ov101_021F2F50
ov101_021F2F50: ; 0x021F2F50
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r5, #0
	add r4, #0x88
	ldr r1, [r4, #4]
	cmp r1, #0
	beq _021F2F68
	cmp r1, #1
	beq _021F2FB8
	cmp r1, #2
	beq _021F2FC4
	b _021F2FDA
_021F2F68:
	bl ov101_021F2110
	ldrh r0, [r4, #0x1e]
	bl ov101_021F2374
	add r1, r0, #0
	add r0, r5, #0
	bl ov101_021F2248
	ldr r0, [r4, #0x10]
	ldr r1, [r5]
	ldrh r0, [r0, #4]
	bl ov101_021F2E74
	add r2, r0, #0
	ldr r0, [r5, #0x50]
	mov r1, #0xa
	bl BufferSpeciesName
	ldr r1, [r4, #0x10]
	add r2, r4, #0
	add r2, #0x23
	ldrh r0, [r1, #6]
	ldrb r1, [r1, #3]
	ldrb r2, [r2]
	bl ov101_021F2E04
	add r2, r0, #0
	ldr r0, [r5, #0x50]
	mov r1, #0xb
	bl BufferSpeciesName
	ldr r0, [r4, #0x10]
	ldrb r0, [r0, #0xc]
	cmp r0, #0xff
	bne _021F2FF0
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _021F2FF0
_021F2FB8:
	bl ov101_021F2614
	cmp r0, #0
	bne _021F2FF0
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F2FC4:
	ldrh r0, [r4, #0x1e]
	bl ov101_021F2374
	add r3, r0, #0
	ldrb r2, [r3]
	ldrb r3, [r3, #1]
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	bl PhoneCallMessagePrint2
	b _021F2FF0
_021F2FDA:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F2FE6
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F2FE6:
	ldr r0, [r5, #0x4c]
	bl DestroyMsgData
	mov r0, #1
	pop {r3, r4, r5, pc}
_021F2FF0:
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov101_021F2F50

	thumb_func_start ov101_021F2FFC
ov101_021F2FFC: ; 0x021F2FFC
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r4, r6, #0
	add r4, #0x88
	ldr r1, [r4, #4]
	cmp r1, #0
	beq _021F3014
	cmp r1, #1
	beq _021F3036
	cmp r1, #2
	beq _021F3042
	b _021F308A
_021F3014:
	bl ov101_021F2110
	ldrh r0, [r4, #0x1e]
	bl ov101_021F2374
	add r1, r0, #0
	add r0, r6, #0
	bl ov101_021F2248
	ldr r0, [r4, #0x10]
	ldrb r0, [r0, #0xc]
	cmp r0, #0xff
	bne _021F30A0
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _021F30A0
_021F3036:
	bl ov101_021F2614
	cmp r0, #0
	bne _021F30A0
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F3042:
	bl LCRandom
	mov r1, #0xb
	bl _s32_div_f
	lsl r0, r1, #0x18
	lsr r5, r0, #0x18
	ldrh r0, [r4, #0x1e]
	bl ov101_021F2374
	ldrb r3, [r0, #1]
	ldrb r2, [r0]
	cmp r2, r3
	bne _021F306E
	add r2, r2, r5
	lsl r2, r2, #0x18
	ldr r1, [r6, #0x4c]
	add r0, r6, #0
	lsr r2, r2, #0x18
	bl PhoneCallMessagePrint3
	b _021F30A0
_021F306E:
	lsl r0, r5, #0x19
	lsr r5, r0, #0x18
	add r3, r3, r5
	add r2, r2, r5
	add r3, r3, #1
	lsl r2, r2, #0x18
	lsl r3, r3, #0x18
	ldr r1, [r6, #0x4c]
	add r0, r6, #0
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl PhoneCallMessagePrint2
	b _021F30A0
_021F308A:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F3096
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F3096:
	ldr r0, [r6, #0x4c]
	bl DestroyMsgData
	mov r0, #1
	pop {r4, r5, r6, pc}
_021F30A0:
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov101_021F2FFC

	thumb_func_start ov101_021F30AC
ov101_021F30AC: ; 0x021F30AC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #0
	strh r0, [r4, #0x20]
	ldr r0, [r5, #0x1c]
	bl Sav2_Pokedex_get
	ldrb r1, [r4, #0x1a]
	add r6, r0, #0
	cmp r1, #2
	bne _021F30CC
	mov r0, #0
	strh r0, [r4, #0x20]
	mov r0, #0x52
	pop {r4, r5, r6, pc}
_021F30CC:
	ldrb r1, [r4, #0x19]
	cmp r1, #0
	beq _021F30F4
	bl Pokedex_CountNationalDexOwned
	mov r1, #0x32
	bl _s32_div_f
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bne _021F30E6
	mov r0, #1
	b _021F30EC
_021F30E6:
	cmp r0, #9
	bls _021F30EC
	mov r0, #9
_021F30EC:
	add r0, #0x44
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	pop {r4, r5, r6, pc}
_021F30F4:
	ldr r0, [r4, #0x10]
	ldrh r1, [r0, #6]
	ldrh r0, [r5, #0x30]
	cmp r1, r0
	bne _021F3102
	mov r0, #0x44
	pop {r4, r5, r6, pc}
_021F3102:
	ldr r0, [r5, #0x28]
	ldr r1, _021F3134 ; =FLAG_UNK_988
	bl CheckFlagInArray
	cmp r0, #0
	beq _021F3112
	mov r0, #0x51
	pop {r4, r5, r6, pc}
_021F3112:
	add r0, r6, #0
	bl Pokedex_GetNatDexFlag
	cmp r0, #0
	bne _021F312C
	ldr r0, [r5, #0x28]
	ldr r1, _021F3138 ; =FLAG_OAK_ACKNOWLEDGED_JOHTO_DEX_COMPLETION
	bl CheckFlagInArray
	cmp r0, #0
	beq _021F312C
	mov r0, #0x50
	pop {r4, r5, r6, pc}
_021F312C:
	mov r0, #5
	strh r0, [r4, #0x20]
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021F3134: .word FLAG_UNK_988
_021F3138: .word FLAG_OAK_ACKNOWLEDGED_JOHTO_DEX_COMPLETION
	thumb_func_end ov101_021F30AC

	thumb_func_start ov101_021F313C
ov101_021F313C: ; 0x021F313C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r4, r5, #0
	add r4, #0x88
	ldr r1, [r4, #4]
	cmp r1, #5
	bls _021F314E
	b _021F33E8
_021F314E:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021F315A: ; jump table
	.short _021F3166 - _021F315A - 2 ; case 0
	.short _021F31E0 - _021F315A - 2 ; case 1
	.short _021F31FA - _021F315A - 2 ; case 2
	.short _021F3250 - _021F315A - 2 ; case 3
	.short _021F332E - _021F315A - 2 ; case 4
	.short _021F33C0 - _021F315A - 2 ; case 5
_021F3166:
	bl ov101_021F2110
	ldr r0, [r5, #0x1c]
	bl Sav2_Pokedex_get
	add r6, r0, #0
	bl Pokedex_GetNatDexFlag
	add r1, r4, #0
	add r1, #0x4d
	ldrb r1, [r1]
	mov r2, #1
	lsl r0, r0, #0x18
	bic r1, r2
	lsr r2, r0, #0x18
	mov r0, #1
	and r0, r2
	orr r1, r0
	add r0, r4, #0
	add r0, #0x4d
	strb r1, [r0]
	add r0, r6, #0
	bl Pokedex_JohtoDexIsComplete
	add r1, r4, #0
	add r1, #0x4d
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	lsl r0, r0, #0x1f
	ldrb r1, [r1]
	mov r2, #2
	lsr r0, r0, #0x1e
	bic r1, r2
	orr r1, r0
	add r0, r4, #0
	add r0, #0x4d
	strb r1, [r0]
	add r0, r6, #0
	bl Pokedex_NationalDexIsComplete
	add r1, r4, #0
	add r1, #0x4d
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	lsl r0, r0, #0x1f
	ldrb r1, [r1]
	mov r2, #4
	lsr r0, r0, #0x1d
	bic r1, r2
	orr r1, r0
	add r0, r4, #0
	add r0, #0x4d
	strb r1, [r0]
	str r6, [r4, #0x50]
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #0xd
	mov r3, #0xe
	bl PhoneCallMessagePrint2
	b _021F3418
_021F31E0:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F31EE
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_021F31EE:
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #0xf
	bl PhoneCallMessagePrint3
	b _021F3418
_021F31FA:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F3208
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_021F3208:
	add r0, r4, #0
	add r0, #0x4d
	ldrb r0, [r0]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	beq _021F3234
	ldr r0, [r5, #0x28]
	ldr r1, _021F3424 ; =FLAG_OAK_ACKNOWLEDGED_JOHTO_DEX_COMPLETION
	bl CheckFlagInArray
	cmp r0, #0
	beq _021F322A
	add r0, r4, #0
	mov r1, #2
	add r0, #0x4a
	strb r1, [r0]
	b _021F323C
_021F322A:
	add r0, r4, #0
	mov r1, #1
	add r0, #0x4a
	strb r1, [r0]
	b _021F323C
_021F3234:
	add r0, r4, #0
	mov r1, #0
	add r0, #0x4a
	strb r1, [r0]
_021F323C:
	add r1, r4, #0
	add r1, #0x4a
	ldrb r1, [r1]
	add r0, r5, #0
	add r1, r1, #3
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl ov101_021F2308
	b _021F3418
_021F3250:
	bl ov101_021F2338
	add r6, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r6, r0
	bne _021F3264
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_021F3264:
	add r0, r5, #0
	bl ov101_021F2344
	cmp r6, #0
	bne _021F329C
	add r0, r4, #0
	add r0, #0x4a
	ldrb r0, [r0]
	cmp r0, #2
	bne _021F328A
	add r0, r4, #0
	add r0, #0x4d
	ldrb r1, [r0]
	mov r0, #8
	orr r1, r0
	add r0, r4, #0
	add r0, #0x4d
	strb r1, [r0]
	b _021F32D0
_021F328A:
	add r0, r4, #0
	add r0, #0x4d
	ldrb r1, [r0]
	mov r0, #8
	bic r1, r0
	add r0, r4, #0
	add r0, #0x4d
	strb r1, [r0]
	b _021F32D0
_021F329C:
	cmp r6, #1
	bne _021F32BC
	add r0, r4, #0
	add r0, #0x4a
	ldrb r0, [r0]
	cmp r0, #1
	bne _021F32BC
	add r0, r4, #0
	add r0, #0x4d
	ldrb r1, [r0]
	mov r0, #8
	orr r1, r0
	add r0, r4, #0
	add r0, #0x4d
	strb r1, [r0]
	b _021F32D0
_021F32BC:
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #0x15
	bl PhoneCallMessagePrint3
	mov r0, #0xff
	str r0, [r4, #4]
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_021F32D0:
	add r0, r4, #0
	add r0, #0x4d
	ldrb r0, [r0]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1f
	ldr r0, [r4, #0x50]
	bne _021F32EC
	bl Pokedex_CountJohtoDexSeen
	add r7, r0, #0
	ldr r0, [r4, #0x50]
	bl Pokedex_CountJohtoDexOwned
	b _021F32F8
_021F32EC:
	bl Pokedex_CountNationalDexSeen
	add r7, r0, #0
	ldr r0, [r4, #0x50]
	bl Pokedex_CountNationalDexOwned
_021F32F8:
	add r6, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r5, #0x50]
	mov r1, #5
	add r2, r7, #0
	mov r3, #3
	bl BufferIntegerAsString
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r5, #0x50]
	mov r1, #6
	add r2, r6, #0
	mov r3, #3
	bl BufferIntegerAsString
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #0x14
	bl PhoneCallMessagePrint3
	b _021F3418
_021F332E:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F333C
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_021F333C:
	add r0, r4, #0
	add r0, #0x4d
	ldrb r0, [r0]
	mov r6, #0
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1f
	ldr r0, [r4, #0x50]
	bne _021F3376
	bl Pokedex_CountJohtoOwned_ExcludeMythical
	add r1, r5, #0
	add r1, #0x36
	ldrb r1, [r1]
	add r2, sp, #8
	bl sub_0205BBD0
	add r7, r0, #0
	add r0, r4, #0
	add r0, #0x4d
	ldrb r0, [r0]
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1f
	beq _021F339E
	ldr r0, [r5, #0x28]
	ldr r1, _021F3424 ; =FLAG_OAK_ACKNOWLEDGED_JOHTO_DEX_COMPLETION
	bl SetFlagInArray
	mov r6, #1
	b _021F339E
_021F3376:
	bl Pokedex_CountNationalOwned_ExcludeMythical
	add r1, r5, #0
	add r1, #0x36
	ldrb r1, [r1]
	add r2, sp, #8
	bl sub_0205BC78
	add r7, r0, #0
	add r0, r4, #0
	add r0, #0x4d
	ldrb r0, [r0]
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1f
	beq _021F339E
	ldr r0, [r5, #0x28]
	ldr r1, _021F3428 ; =FLAG_UNK_988
	bl SetFlagInArray
	mov r6, #1
_021F339E:
	add r0, sp, #8
	ldrh r0, [r0]
	bl PlayFanfare
	lsl r2, r7, #0x18
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	lsr r2, r2, #0x18
	bl PhoneCallMessagePrint3
	cmp r6, #0
	beq _021F3418
	mov r0, #0xff
	str r0, [r4, #4]
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_021F33C0:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F33CE
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_021F33CE:
	bl IsFanfarePlaying
	cmp r0, #0
	beq _021F33DC
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_021F33DC:
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #0x15
	bl PhoneCallMessagePrint3
	b _021F3418
_021F33E8:
	add r0, r5, #0
	bl ov101_021F2220
	cmp r0, #0
	bne _021F33F8
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_021F33F8:
	ldr r0, [r4, #4]
	cmp r0, #0xff
	bne _021F340C
	bl IsFanfarePlaying
	cmp r0, #0
	beq _021F340C
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_021F340C:
	ldr r0, [r5, #0x4c]
	bl DestroyMsgData
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_021F3418:
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021F3424: .word FLAG_OAK_ACKNOWLEDGED_JOHTO_DEX_COMPLETION
_021F3428: .word FLAG_UNK_988
	thumb_func_end ov101_021F313C

	thumb_func_start ov101_021F342C
ov101_021F342C: ; 0x021F342C
	mov r3, #0
	strh r3, [r1, #0x20]
	ldr r2, [r1, #0x10]
	ldrh r0, [r0, #0x30]
	ldrh r2, [r2, #6]
	cmp r2, r0
	bne _021F343E
	mov r0, #0x53
	bx lr
_021F343E:
	mov r0, #0xc
	strh r0, [r1, #0x20]
	add r0, r3, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov101_021F342C

	thumb_func_start ov101_021F3448
ov101_021F3448: ; 0x021F3448
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r4, r5, #0
	add r4, #0x88
	ldr r1, [r4, #4]
	cmp r1, #0
	beq _021F345E
	cmp r1, #1
	beq _021F3486
	b _021F34E8
_021F345E:
	bl ov101_021F2110
	ldr r0, [r5, #0x28]
	ldr r1, _021F3510 ; =0x00000127
	bl CheckFlagInArray
	cmp r0, #0
	beq _021F347A
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #6
	bl PhoneCallMessagePrint3
	b _021F3502
_021F347A:
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #2
	bl PhoneCallMessagePrint3
	b _021F3502
_021F3486:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F3494
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021F3494:
	ldr r0, [r5, #0x1c]
	bl Save_ApricornBox_get
	add r6, r0, #0
	bl ApricornBox_GetKurtQuantity
	add r7, r0, #0
	bne _021F34A8
	mov r2, #5
	b _021F34DE
_021F34A8:
	ldr r0, [r5, #0x28]
	ldr r1, _021F3514 ; =0x00000AA2
	bl CheckFlagInArray
	cmp r0, #0
	beq _021F34B8
	mov r2, #4
	b _021F34DE
_021F34B8:
	add r0, r6, #0
	bl ApricornBox_GetKurtBall
	add r2, r0, #0
	ldr r0, [r5, #0x50]
	mov r1, #0xa
	bl BufferItemName
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r5, #0x50]
	mov r1, #0xb
	add r2, r7, #0
	mov r3, #2
	bl BufferIntegerAsString
	mov r2, #3
_021F34DE:
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	bl PhoneCallMessagePrint3
	b _021F3502
_021F34E8:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F34F6
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021F34F6:
	ldr r0, [r5, #0x4c]
	bl DestroyMsgData
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021F3502:
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F3510: .word 0x00000127
_021F3514: .word 0x00000AA2
	thumb_func_end ov101_021F3448

	thumb_func_start ov101_021F3518
ov101_021F3518: ; 0x021F3518
	mov r2, #0
	strh r2, [r1, #0x20]
	ldr r1, [r1, #0x10]
	ldrh r0, [r0, #0x30]
	ldrh r1, [r1, #6]
	cmp r1, r0
	bne _021F352A
	mov r0, #0x54
	bx lr
_021F352A:
	mov r0, #0x55
	bx lr
	.balign 4, 0
	thumb_func_end ov101_021F3518

	thumb_func_start ov101_021F3530
ov101_021F3530: ; 0x021F3530
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #0
	strh r0, [r4, #0x20]
	ldr r0, [r4, #0x10]
	ldrh r1, [r0, #6]
	ldrh r0, [r5, #0x30]
	cmp r1, r0
	bne _021F3548
	mov r0, #0x56
	pop {r4, r5, r6, pc}
_021F3548:
	ldr r0, [r5, #0x20]
	bl sub_0202F284
	add r1, r4, #0
	add r1, #0x4a
	strb r0, [r1]
	add r0, r4, #0
	add r0, #0x4a
	ldrb r0, [r0]
	cmp r0, #1
	bls _021F3562
	mov r0, #0x57
	pop {r4, r5, r6, pc}
_021F3562:
	bne _021F3568
	mov r0, #0x58
	pop {r4, r5, r6, pc}
_021F3568:
	ldr r0, [r5, #0x20]
	bl sub_0202F274
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	beq _021F3584
	ldr r0, [r5, #0x20]
	mov r1, #0x10
	bl PhoneRematches_IsSeeking
	cmp r0, #0
	bne _021F3584
	mov r0, #0x57
	pop {r4, r5, r6, pc}
_021F3584:
	ldr r0, [r4, #0x38]
	bl GF_RTC_GetTimeOfDayByHour
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	add r0, #0xfe
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #1
	bhi _021F359C
	mov r0, #0x5b
	pop {r4, r5, r6, pc}
_021F359C:
	cmp r6, #0
	bne _021F35B2
	ldr r0, [r5, #0x20]
	mov r1, #1
	bl sub_0202F254
	ldr r0, [r5, #0x20]
	mov r1, #0x10
	mov r2, #1
	bl PhoneRematches_SetSeeking
_021F35B2:
	add r4, #0x23
	ldrb r0, [r4]
	cmp r0, #1
	bne _021F35BE
	mov r0, #0x5a
	pop {r4, r5, r6, pc}
_021F35BE:
	mov r0, #0x59
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov101_021F3530

	thumb_func_start ov101_021F35C4
ov101_021F35C4: ; 0x021F35C4
	ldrb r2, [r1, #0x19]
	cmp r2, #0
	beq _021F35D2
	mov r0, #0
	strh r0, [r1, #0x20]
	mov r0, #0x5d
	bx lr
_021F35D2:
	ldr r2, [r1, #0x10]
	ldrh r0, [r0, #0x30]
	ldrh r2, [r2, #6]
	cmp r2, r0
	bne _021F35E4
	mov r0, #0
	strh r0, [r1, #0x20]
	mov r0, #0x5c
	bx lr
_021F35E4:
	mov r0, #3
	strh r0, [r1, #0x20]
	mov r0, #0
	bx lr
	thumb_func_end ov101_021F35C4

	thumb_func_start ov101_021F35EC
ov101_021F35EC: ; 0x021F35EC
	push {r4, r5, r6, lr}
	sub sp, #8
	add r4, r0, #0
	add r5, r4, #0
	add r5, #0x88
	ldr r1, [r5, #4]
	cmp r1, #4
	bhi _021F36E6
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021F3608: ; jump table
	.short _021F3612 - _021F3608 - 2 ; case 0
	.short _021F3618 - _021F3608 - 2 ; case 1
	.short _021F3634 - _021F3608 - 2 ; case 2
	.short _021F36B2 - _021F3608 - 2 ; case 3
	.short _021F36CC - _021F3608 - 2 ; case 4
_021F3612:
	bl ov101_021F2110
	b _021F36E6
_021F3618:
	bl ov101_021F2614
	cmp r0, #0
	bne _021F3626
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F3626:
	ldr r1, [r4, #0x4c]
	add r0, r4, #0
	mov r2, #3
	mov r3, #4
	bl PhoneCallMessagePrint2
	b _021F36E6
_021F3634:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F3642
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F3642:
	ldr r0, [r4, #0x1c]
	bl GetStoragePCPointer
	add r6, r0, #0
	bl PCStorage_GetActiveBox
	add r1, r0, #0
	ldr r2, [r4, #0x54]
	add r0, r6, #0
	bl PCStorage_GetBoxName
	mov r0, #1
	str r0, [sp]
	mov r3, #2
	str r3, [sp, #4]
	ldr r0, [r4, #0x50]
	ldr r2, [r4, #0x54]
	mov r1, #0xa
	bl BufferString
	add r0, r6, #0
	bl PCStorage_CountEmptySpotsInAllBoxes
	add r6, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r4, #0x50]
	mov r1, #0xb
	add r2, r6, #0
	mov r3, #3
	bl BufferIntegerAsString
	cmp r6, #0
	bne _021F3696
	ldr r1, [r4, #0x4c]
	add r0, r4, #0
	mov r2, #9
	bl PhoneCallMessagePrint3
	b _021F36E6
_021F3696:
	bl LCRandom
	mov r1, #3
	bl _s32_div_f
	add r2, r1, #0
	add r2, r2, #5
	lsl r2, r2, #0x18
	ldr r1, [r4, #0x4c]
	add r0, r4, #0
	lsr r2, r2, #0x18
	bl PhoneCallMessagePrint3
	b _021F36E6
_021F36B2:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F36C0
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F36C0:
	ldr r1, [r4, #0x4c]
	add r0, r4, #0
	mov r2, #8
	bl PhoneCallMessagePrint3
	b _021F36E6
_021F36CC:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F36DA
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F36DA:
	ldr r0, [r4, #0x4c]
	bl DestroyMsgData
	add sp, #8
	mov r0, #1
	pop {r4, r5, r6, pc}
_021F36E6:
	ldr r0, [r5, #4]
	add r0, r0, #1
	str r0, [r5, #4]
	mov r0, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov101_021F35EC

	thumb_func_start ov101_021F36F4
ov101_021F36F4: ; 0x021F36F4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r1, [sp]
	add r7, r0, #0
	ldr r0, [sp]
	mov r1, #0
	strh r1, [r0, #0x20]
	ldrb r0, [r0, #0x19]
	cmp r0, #0
	beq _021F3720
	ldr r0, [r7, #0x28]
	ldr r1, _021F3794 ; =0x00000992
	bl CheckFlagInArray
	cmp r0, #0
	beq _021F371A
	add sp, #8
	mov r0, #0x60
	pop {r3, r4, r5, r6, r7, pc}
_021F371A:
	add sp, #8
	mov r0, #0x5f
	pop {r3, r4, r5, r6, r7, pc}
_021F3720:
	ldr r0, [r7, #0x1c]
	bl Sav2_DayCare_get
	ldr r1, [sp]
	str r0, [sp, #4]
	str r0, [r1, #0x50]
	add r0, r1, #0
	add r4, r1, #0
	mov r5, #0
	add r0, #0x4a
	strb r5, [r0]
	add r4, #0x4a
_021F3738:
	ldr r0, [sp, #4]
	add r1, r5, #0
	bl Sav2_DayCare_GetMonX
	add r6, r0, #0
	bl DayCareMon_GetBoxMon
	mov r1, #5
	mov r2, #0
	bl GetBoxMonData
	cmp r0, #0
	beq _021F376A
	add r0, r6, #0
	bl DayCareMon_GetBoxMon
	add r2, r0, #0
	add r1, r5, #0
	ldr r0, [r7, #0x50]
	add r1, #0xa
	bl BufferBoxMonNickname
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
_021F376A:
	add r5, r5, #1
	cmp r5, #2
	blt _021F3738
	ldr r0, [sp]
	add r0, #0x4a
	ldrb r0, [r0]
	cmp r0, #2
	bne _021F3786
	ldr r0, [sp, #4]
	bl Sav2_DayCare_CalcCompatibility
	ldr r1, [sp]
	add r1, #0x48
	strh r0, [r1]
_021F3786:
	ldr r0, [sp]
	mov r1, #7
	strh r1, [r0, #0x20]
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F3794: .word 0x00000992
	thumb_func_end ov101_021F36F4

	thumb_func_start ov101_021F3798
ov101_021F3798: ; 0x021F3798
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r5, #0
	add r4, #0x88
	ldr r1, [r4, #4]
	cmp r1, #3
	bhi _021F386A
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021F37B2: ; jump table
	.short _021F37BA - _021F37B2 - 2 ; case 0
	.short _021F37CA - _021F37B2 - 2 ; case 1
	.short _021F3830 - _021F37B2 - 2 ; case 2
	.short _021F3852 - _021F37B2 - 2 ; case 3
_021F37BA:
	bl ov101_021F2110
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #2
	bl PhoneCallMessagePrint3
	b _021F3882
_021F37CA:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F37D6
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F37D6:
	ldr r0, [r4, #0x50]
	bl Sav2_DayCare_HasEgg
	cmp r0, #0
	beq _021F37F0
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #3
	bl PhoneCallMessagePrint3
	mov r0, #0xff
	str r0, [r4, #4]
	b _021F382C
_021F37F0:
	add r0, r4, #0
	add r0, #0x4a
	ldrb r0, [r0]
	cmp r0, #0
	bne _021F380A
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #4
	bl PhoneCallMessagePrint3
	mov r0, #3
	str r0, [r4, #4]
	b _021F382C
_021F380A:
	cmp r0, #1
	bne _021F381E
	mov r0, #3
	str r0, [r4, #4]
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #5
	bl PhoneCallMessagePrint3
	b _021F382C
_021F381E:
	mov r0, #2
	str r0, [r4, #4]
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #6
	bl PhoneCallMessagePrint3
_021F382C:
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F3830:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F383C
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F383C:
	add r2, r4, #0
	add r2, #0x48
	ldrh r2, [r2]
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	add r2, r2, #7
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	bl PhoneCallMessagePrint3
	b _021F3882
_021F3852:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F385E
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F385E:
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #0xb
	bl PhoneCallMessagePrint3
	b _021F3882
_021F386A:
	add r0, r5, #0
	bl ov101_021F2220
	cmp r0, #0
	bne _021F3878
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F3878:
	ldr r0, [r5, #0x4c]
	bl DestroyMsgData
	mov r0, #1
	pop {r3, r4, r5, pc}
_021F3882:
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov101_021F3798

	thumb_func_start ov101_021F388C
ov101_021F388C: ; 0x021F388C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	mov r1, #0
	strh r1, [r5, #0x20]
	ldr r1, [r5, #0x10]
	ldrh r2, [r1, #6]
	ldrh r1, [r0, #0x30]
	cmp r2, r1
	bne _021F38A2
	mov r0, #0x61
	pop {r3, r4, r5, r6, r7, pc}
_021F38A2:
	ldr r0, [r0, #0x1c]
	bl Sav2_DayCare_get
	add r6, r5, #0
	str r0, [sp]
	str r0, [r5, #0x50]
	add r0, r5, #0
	mov r4, #0
	add r0, #0x4a
	strb r4, [r0]
	add r6, #0x4a
_021F38B8:
	ldr r0, [sp]
	add r1, r4, #0
	bl Sav2_DayCare_GetMonX
	add r7, r0, #0
	bl DayCareMon_GetBoxMon
	mov r1, #5
	mov r2, #0
	bl GetBoxMonData
	cmp r0, #0
	beq _021F38E4
	ldrb r0, [r6]
	add r0, r0, #1
	strb r0, [r6]
	add r0, r7, #0
	bl DayCareMon_CalcLevelGrowth
	add r1, r5, r4
	add r1, #0x4b
	b _021F38EA
_021F38E4:
	add r1, r5, r4
	add r1, #0x4b
	mov r0, #0
_021F38EA:
	add r4, r4, #1
	strb r0, [r1]
	cmp r4, #2
	blt _021F38B8
	mov r0, #6
	strh r0, [r5, #0x20]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov101_021F388C

	thumb_func_start ov101_021F38FC
ov101_021F38FC: ; 0x021F38FC
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	add r4, r5, #0
	add r4, #0x88
	ldr r1, [r4, #4]
	cmp r1, #4
	bls _021F390E
	b _021F3A7A
_021F390E:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021F391A: ; jump table
	.short _021F3924 - _021F391A - 2 ; case 0
	.short _021F3936 - _021F391A - 2 ; case 1
	.short _021F396E - _021F391A - 2 ; case 2
	.short _021F3A02 - _021F391A - 2 ; case 3
	.short _021F3A4A - _021F391A - 2 ; case 4
_021F3924:
	bl ov101_021F2110
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #3
	mov r3, #4
	bl PhoneCallMessagePrint2
	b _021F3A96
_021F3936:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F3944
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F3944:
	add r0, r4, #0
	add r0, #0x4a
	ldrb r0, [r0]
	cmp r0, #0
	bne _021F3962
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #0xa
	bl PhoneCallMessagePrint3
	mov r0, #0xff
	str r0, [r4, #4]
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F3962:
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #5
	bl PhoneCallMessagePrint3
	b _021F3A96
_021F396E:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F397C
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F397C:
	add r0, r4, #0
	add r0, #0x4b
	ldrb r0, [r0]
	cmp r0, #0
	beq _021F399E
	add r0, r4, #0
	add r0, #0x4c
	ldrb r0, [r0]
	mov r6, #0
	cmp r0, #0
	bne _021F3998
	mov r0, #4
	str r0, [r4, #4]
	b _021F39C4
_021F3998:
	mov r0, #3
	str r0, [r4, #4]
	b _021F39C4
_021F399E:
	add r0, r4, #0
	add r0, #0x4c
	ldrb r0, [r0]
	cmp r0, #0
	beq _021F39B0
	mov r0, #4
	mov r6, #1
	str r0, [r4, #4]
	b _021F39C4
_021F39B0:
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #9
	bl PhoneCallMessagePrint3
	mov r0, #0xff
	str r0, [r4, #4]
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F39C4:
	ldr r0, [r4, #0x50]
	add r1, r6, #0
	bl Sav2_DayCare_GetMonX
	bl DayCareMon_GetBoxMon
	add r2, r0, #0
	ldr r0, [r5, #0x50]
	mov r1, #0xa
	bl BufferBoxMonNickname
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	add r2, r4, r6
	str r0, [sp, #4]
	add r2, #0x4b
	ldrb r2, [r2]
	ldr r0, [r5, #0x50]
	mov r1, #0xb
	mov r3, #3
	bl BufferIntegerAsString
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #6
	bl PhoneCallMessagePrint3
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F3A02:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F3A10
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F3A10:
	ldr r0, [r4, #0x50]
	mov r1, #1
	bl Sav2_DayCare_GetMonX
	bl DayCareMon_GetBoxMon
	add r2, r0, #0
	ldr r0, [r5, #0x50]
	mov r1, #0xa
	bl BufferBoxMonNickname
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	add r2, r4, #0
	str r0, [sp, #4]
	add r2, #0x4c
	ldrb r2, [r2]
	ldr r0, [r5, #0x50]
	mov r1, #0xb
	mov r3, #3
	bl BufferIntegerAsString
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #6
	bl PhoneCallMessagePrint3
	b _021F3A96
_021F3A4A:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F3A58
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F3A58:
	add r0, r4, #0
	add r0, #0x4a
	ldrb r0, [r0]
	cmp r0, #1
	bne _021F3A6E
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #8
	bl PhoneCallMessagePrint3
	b _021F3A96
_021F3A6E:
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #9
	bl PhoneCallMessagePrint3
	b _021F3A96
_021F3A7A:
	add r0, r5, #0
	bl ov101_021F2220
	cmp r0, #0
	bne _021F3A8A
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F3A8A:
	ldr r0, [r5, #0x4c]
	bl DestroyMsgData
	add sp, #8
	mov r0, #1
	pop {r4, r5, r6, pc}
_021F3A96:
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	mov r0, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov101_021F38FC

	thumb_func_start ov101_021F3AA4
ov101_021F3AA4: ; 0x021F3AA4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #0
	strh r0, [r4, #0x20]
	ldr r0, [r5, #0x28]
	bl CheckGameClearFlag
	add r1, r4, #0
	add r1, #0x4d
	ldrb r1, [r1]
	mov r2, #1
	lsl r0, r0, #0x18
	bic r1, r2
	lsr r2, r0, #0x18
	mov r0, #1
	and r0, r2
	orr r1, r0
	add r0, r4, #0
	add r0, #0x4d
	strb r1, [r0]
	ldr r0, [r4, #0x38]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl ov101_021F3C60
	add r1, r4, #0
	add r1, #0x4a
	strb r0, [r1]
	ldr r0, [r5, #0x28]
	bl ScriptState_IsInRocketTakeover
	cmp r0, #0
	beq _021F3AEC
	mov r0, #0x63
	pop {r3, r4, r5, pc}
_021F3AEC:
	ldrb r0, [r4, #0x19]
	cmp r0, #0
	beq _021F3AFA
	mov r0, #9
	strh r0, [r4, #0x20]
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F3AFA:
	add r0, r4, #0
	add r0, #0x4a
	ldrb r0, [r0]
	cmp r0, #3
	bne _021F3B08
	mov r0, #0x64
	pop {r3, r4, r5, pc}
_021F3B08:
	ldr r0, [r4, #0x10]
	ldrh r1, [r0, #6]
	ldrh r0, [r5, #0x30]
	cmp r1, r0
	bne _021F3B16
	mov r0, #0x62
	pop {r3, r4, r5, pc}
_021F3B16:
	mov r0, #8
	strh r0, [r4, #0x20]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov101_021F3AA4

	thumb_func_start ov101_021F3B20
ov101_021F3B20: ; 0x021F3B20
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r5, #0
	add r4, #0x88
	ldr r1, [r4, #4]
	cmp r1, #0
	beq _021F3B34
	cmp r1, #1
	beq _021F3B56
	b _021F3B7E
_021F3B34:
	bl ov101_021F2110
	add r0, r4, #0
	add r0, #0x23
	ldrb r0, [r0]
	ldr r1, [r5, #0x4c]
	lsl r3, r0, #1
	add r2, r3, #3
	add r3, r3, #4
	lsl r2, r2, #0x18
	lsl r3, r3, #0x18
	add r0, r5, #0
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl PhoneCallMessagePrint2
	b _021F3B94
_021F3B56:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F3B62
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F3B62:
	bl LCRandom
	mov r1, #3
	bl _s32_div_f
	add r2, r1, #0
	add r2, #0xa
	lsl r2, r2, #0x18
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	lsr r2, r2, #0x18
	bl PhoneCallMessagePrint3
	b _021F3B94
_021F3B7E:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F3B8A
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F3B8A:
	ldr r0, [r5, #0x4c]
	bl DestroyMsgData
	mov r0, #1
	pop {r3, r4, r5, pc}
_021F3B94:
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov101_021F3B20

	thumb_func_start ov101_021F3BA0
ov101_021F3BA0: ; 0x021F3BA0
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r4, r6, #0
	add r4, #0x88
	ldr r1, [r4, #4]
	cmp r1, #0
	beq _021F3BB4
	cmp r1, #1
	beq _021F3BD8
	b _021F3C3E
_021F3BB4:
	bl ov101_021F2110
	add r0, r4, #0
	add r0, #0x23
	ldrb r0, [r0]
	ldr r1, [r6, #0x4c]
	lsl r3, r0, #1
	add r2, r3, #0
	add r2, #0xf
	add r3, #0x10
	lsl r2, r2, #0x18
	lsl r3, r3, #0x18
	add r0, r6, #0
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl PhoneCallMessagePrint2
	b _021F3C54
_021F3BD8:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F3BE4
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F3BE4:
	add r0, r4, #0
	add r0, #0x4a
	ldrb r0, [r0]
	cmp r0, #3
	bne _021F3BFA
	ldr r1, [r6, #0x4c]
	add r0, r6, #0
	mov r2, #0x24
	bl PhoneCallMessagePrint3
	b _021F3C54
_021F3BFA:
	add r0, r4, #0
	add r0, #0x4d
	ldrb r0, [r0]
	lsl r0, r0, #0x1f
	lsr r1, r0, #0x1f
	lsl r0, r1, #1
	add r0, r1, r0
	add r0, #0xb
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	bl LCRandom
	add r1, r5, #0
	bl _s32_div_f
	lsl r0, r1, #0x18
	lsr r2, r0, #0x18
	cmp r2, #0xd
	bne _021F3C2E
	ldr r1, [r6, #0x4c]
	add r0, r6, #0
	mov r2, #0x22
	mov r3, #0x23
	bl PhoneCallMessagePrint2
	b _021F3C54
_021F3C2E:
	add r2, #0x15
	lsl r2, r2, #0x18
	ldr r1, [r6, #0x4c]
	add r0, r6, #0
	lsr r2, r2, #0x18
	bl PhoneCallMessagePrint3
	b _021F3C54
_021F3C3E:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F3C4A
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F3C4A:
	ldr r0, [r6, #0x4c]
	bl DestroyMsgData
	mov r0, #1
	pop {r4, r5, r6, pc}
_021F3C54:
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov101_021F3BA0

	thumb_func_start ov101_021F3C60
ov101_021F3C60: ; 0x021F3C60
	push {r4, lr}
	add r4, r0, #0
	bl sub_02095FF8
	cmp r0, #0
	beq _021F3C70
	mov r0, #3
	pop {r4, pc}
_021F3C70:
	cmp r4, #3
	bls _021F3C7C
	cmp r4, #0xa
	bhs _021F3C7C
	mov r0, #0
	pop {r4, pc}
_021F3C7C:
	cmp r4, #9
	bls _021F3C88
	cmp r4, #0x14
	bhs _021F3C88
	mov r0, #1
	pop {r4, pc}
_021F3C88:
	mov r0, #2
	pop {r4, pc}
	thumb_func_end ov101_021F3C60

	thumb_func_start ov101_021F3C8C
ov101_021F3C8C: ; 0x021F3C8C
	ldrb r2, [r1, #0x19]
	cmp r2, #0
	beq _021F3C9A
	mov r0, #0xb
	strh r0, [r1, #0x20]
	mov r0, #0
	bx lr
_021F3C9A:
	ldr r2, [r1, #0x10]
	ldrh r3, [r2, #6]
	ldrh r2, [r0, #0x30]
	cmp r3, r2
	bne _021F3CB4
	mov r2, #0
	strh r2, [r1, #0x20]
	add r0, #0x36
	ldrb r0, [r0]
	lsl r1, r0, #1
	ldr r0, _021F3CBC ; =ov101_021F86C8
	ldrh r0, [r0, r1]
	bx lr
_021F3CB4:
	mov r0, #0xa
	strh r0, [r1, #0x20]
	mov r0, #0
	bx lr
	.balign 4, 0
_021F3CBC: .word ov101_021F86C8
	thumb_func_end ov101_021F3C8C

	thumb_func_start ov101_021F3CC0
ov101_021F3CC0: ; 0x021F3CC0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r5, #0
	add r4, #0x88
	ldr r1, [r4, #4]
	cmp r1, #0
	beq _021F3CD8
	cmp r1, #1
	beq _021F3CDE
	cmp r1, #2
	beq _021F3CF2
	b _021F3D14
_021F3CD8:
	bl ov101_021F2110
	b _021F3D2A
_021F3CDE:
	add r2, r4, #0
	add r2, #0x23
	ldrb r2, [r2]
	ldr r1, [r5, #0x4c]
	add r2, r2, #4
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	bl PhoneCallMessagePrint3
	b _021F3D2A
_021F3CF2:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F3CFE
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F3CFE:
	ldrh r0, [r5, #0x32]
	bl ov101_021F3E74
	add r2, r0, #0
	lsl r2, r2, #0x18
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	lsr r2, r2, #0x18
	bl PhoneCallMessagePrint3
	b _021F3D2A
_021F3D14:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F3D20
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F3D20:
	ldr r0, [r5, #0x4c]
	bl DestroyMsgData
	mov r0, #1
	pop {r3, r4, r5, pc}
_021F3D2A:
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov101_021F3CC0

	thumb_func_start ov101_021F3D34
ov101_021F3D34: ; 0x021F3D34
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	ldr r0, [r5, #0x1c]
	mov r4, #0
	bl SaveData_GSPlayerMisc_get
	bl sub_0202EE70
	add r6, r0, #0
	mov r1, #1
	add r0, sp, #0
	strb r1, [r0]
	ldr r0, [r5, #0x28]
	mov r1, #2
	mov r2, #0x19
	bl ScriptState_FlypointFlagAction
	cmp r0, #0
	beq _021F3D62
	mov r1, #1
	add r0, sp, #0
	strb r1, [r0, #1]
_021F3D62:
	cmp r6, #0
	beq _021F3D6C
	mov r1, #1
	add r0, sp, #0
	strb r1, [r0, #2]
_021F3D6C:
	cmp r6, #1
	bls _021F3D76
	mov r1, #1
	add r0, sp, #0
	strb r1, [r0, #3]
_021F3D76:
	ldr r0, [r5]
	mov r1, #0x49
	bl AllocFromHeapAtEnd
	mov r1, #0
	mov r2, #0x49
	add r5, r0, #0
	bl MI_CpuFill8
	ldr r3, _021F3DC4 ; =ov101_021F8760
	mov r1, #0
	add r0, sp, #0
_021F3D8E:
	ldrb r2, [r3]
	ldrb r2, [r0, r2]
	cmp r2, #0
	beq _021F3DA0
	add r2, r4, #0
	add r4, r4, #1
	lsl r4, r4, #0x18
	lsr r4, r4, #0x18
	strb r1, [r5, r2]
_021F3DA0:
	add r1, r1, #1
	add r3, r3, #1
	cmp r1, #0x49
	blt _021F3D8E
	bl LCRandom
	add r1, r4, #0
	bl _s32_div_f
	ldrb r4, [r5, r1]
	add r0, r5, #0
	bl FreeToHeap
	add r4, #0x56
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_021F3DC4: .word ov101_021F8760
	thumb_func_end ov101_021F3D34

	thumb_func_start ov101_021F3DC8
ov101_021F3DC8: ; 0x021F3DC8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r5, #0
	add r4, #0x88
	ldr r1, [r4, #4]
	cmp r1, #0
	beq _021F3DE0
	cmp r1, #1
	beq _021F3DE6
	cmp r1, #2
	beq _021F3DFA
	b _021F3E54
_021F3DE0:
	bl ov101_021F2110
	b _021F3E6A
_021F3DE6:
	add r2, r4, #0
	add r2, #0x23
	ldrb r2, [r2]
	ldr r1, [r5, #0x4c]
	add r2, r2, #7
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	bl PhoneCallMessagePrint3
	b _021F3E6A
_021F3DFA:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F3E06
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F3E06:
	bl LCRandom
	mov r1, #0xfa
	lsl r1, r1, #2
	bl _s32_div_f
	mov r0, #0x7d
	lsl r0, r0, #2
	cmp r1, r0
	bge _021F3E42
	bl LCRandom
	mov r1, #0xe1
	lsl r1, r1, #2
	bl _s32_div_f
	add r0, r1, #0
	mov r1, #0x4b
	lsl r1, r1, #2
	bl _s32_div_f
	add r2, r0, #0
	add r2, #0xa
	lsl r2, r2, #0x18
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	lsr r2, r2, #0x18
	bl PhoneCallMessagePrint3
	b _021F3E6A
_021F3E42:
	add r0, r5, #0
	bl ov101_021F3D34
	add r2, r0, #0
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	bl PhoneCallMessagePrint3
	b _021F3E6A
_021F3E54:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F3E60
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F3E60:
	ldr r0, [r5, #0x4c]
	bl DestroyMsgData
	mov r0, #1
	pop {r3, r4, r5, pc}
_021F3E6A:
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov101_021F3DC8

	thumb_func_start ov101_021F3E74
ov101_021F3E74: ; 0x021F3E74
	push {r3, lr}
	ldr r3, _021F3EA4 ; =ov101_021F86CC
	mov r2, #0
_021F3E7A:
	ldrh r1, [r3]
	cmp r0, r1
	bne _021F3E88
	add r2, #0xd
	lsl r0, r2, #0x10
	lsr r0, r0, #0x10
	pop {r3, pc}
_021F3E88:
	add r2, r2, #1
	add r3, r3, #2
	cmp r2, #0x49
	blt _021F3E7A
	bl LCRandom
	mov r1, #3
	bl _s32_div_f
	add r1, #0xa
	lsl r0, r1, #0x10
	lsr r0, r0, #0x10
	pop {r3, pc}
	nop
_021F3EA4: .word ov101_021F86CC
	thumb_func_end ov101_021F3E74

	thumb_func_start ov101_021F3EA8
ov101_021F3EA8: ; 0x021F3EA8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x24]
	add r4, r1, #0
	bl PlayerProfile_CountBadges
	cmp r0, #0x10
	blt _021F3EC8
	add r0, r4, #0
	add r0, #0x4d
	ldrb r1, [r0]
	mov r0, #1
	bic r1, r0
	mov r0, #1
	orr r1, r0
	b _021F3ED2
_021F3EC8:
	add r0, r4, #0
	add r0, #0x4d
	ldrb r1, [r0]
	mov r0, #1
	bic r1, r0
_021F3ED2:
	add r0, r4, #0
	add r0, #0x4d
	strb r1, [r0]
	ldrb r1, [r4, #0x18]
	ldr r0, [r5, #0x20]
	bl PhoneRematches_IsSeeking
	add r1, r4, #0
	add r1, #0x4d
	ldrb r2, [r1]
	lsl r0, r0, #0x18
	mov r1, #2
	lsr r0, r0, #0x18
	bic r2, r1
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1e
	add r1, r2, #0
	orr r1, r0
	add r0, r4, #0
	add r0, #0x4d
	strb r1, [r0]
	ldrb r0, [r4, #0x19]
	cmp r0, #0
	beq _021F3F06
	mov r0, #0xe
	b _021F3F08
_021F3F06:
	mov r0, #0xd
_021F3F08:
	strh r0, [r4, #0x20]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov101_021F3EA8

	thumb_func_start ov101_021F3F10
ov101_021F3F10: ; 0x021F3F10
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r5, #0
	add r4, #0x88
	ldr r1, [r4, #4]
	cmp r1, #3
	bls _021F3F20
	b _021F4042
_021F3F20:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021F3F2C: ; jump table
	.short _021F3F34 - _021F3F2C - 2 ; case 0
	.short _021F3F60 - _021F3F2C - 2 ; case 1
	.short _021F3FD6 - _021F3F2C - 2 ; case 2
	.short _021F3FEC - _021F3F2C - 2 ; case 3
_021F3F34:
	bl ov101_021F2110
	ldr r0, [r4, #0x10]
	ldrh r1, [r0, #6]
	ldrh r0, [r5, #0x30]
	cmp r1, r0
	bne _021F3F54
	mov r0, #0xff
	str r0, [r4, #4]
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #1
	bl PhoneCallMessagePrint3
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F3F54:
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #2
	bl PhoneCallMessagePrint3
	b _021F405A
_021F3F60:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F3F6C
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F3F6C:
	add r0, r4, #0
	add r0, #0x4d
	ldrb r0, [r0]
	lsl r1, r0, #0x1f
	lsr r1, r1, #0x1f
	bne _021F3F8A
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #3
	bl PhoneCallMessagePrint3
	mov r0, #0xff
	str r0, [r4, #4]
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F3F8A:
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1f
	beq _021F3FA2
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #9
	bl PhoneCallMessagePrint3
	mov r0, #0xff
	str r0, [r4, #4]
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F3FA2:
	ldr r2, [r4, #0x10]
	ldr r1, [r4, #0x34]
	ldrb r0, [r2, #0xd]
	cmp r1, r0
	bne _021F3FB8
	add r0, r4, #0
	add r0, #0x23
	ldrb r1, [r0]
	ldrb r0, [r2, #0xe]
	cmp r1, r0
	beq _021F3FCA
_021F3FB8:
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #4
	bl PhoneCallMessagePrint3
	mov r0, #0xff
	str r0, [r4, #4]
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F3FCA:
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #5
	bl PhoneCallMessagePrint3
	b _021F405A
_021F3FD6:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F3FE2
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F3FE2:
	add r0, r5, #0
	mov r1, #6
	bl ov101_021F2308
	b _021F405A
_021F3FEC:
	bl ov101_021F2338
	add r6, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r6, r0
	bne _021F3FFE
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F3FFE:
	add r0, r5, #0
	bl ov101_021F2344
	cmp r6, #0
	beq _021F4014
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #7
	bl PhoneCallMessagePrint3
	b _021F405A
_021F4014:
	ldrb r1, [r4, #0x18]
	add r0, r5, #0
	bl ov101_021F40E8
	cmp r0, #0
	beq _021F4036
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #6
	bl PhoneCallMessagePrint3
	ldrb r1, [r4, #0x18]
	ldr r0, [r5, #0x20]
	mov r2, #1
	bl PhoneRematches_SetSeeking
	b _021F405A
_021F4036:
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #8
	bl PhoneCallMessagePrint3
	b _021F405A
_021F4042:
	add r0, r5, #0
	bl ov101_021F2220
	cmp r0, #0
	bne _021F4050
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F4050:
	ldr r0, [r5, #0x4c]
	bl DestroyMsgData
	mov r0, #1
	pop {r4, r5, r6, pc}
_021F405A:
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov101_021F3F10

	thumb_func_start ov101_021F4064
ov101_021F4064: ; 0x021F4064
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r5, #0
	add r4, #0x88
	ldr r1, [r4, #4]
	cmp r1, #0
	beq _021F4078
	cmp r1, #1
	beq _021F4088
	b _021F40C8
_021F4078:
	bl ov101_021F2110
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #0xa
	bl PhoneCallMessagePrint3
	b _021F40DE
_021F4088:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F4094
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F4094:
	add r0, r4, #0
	add r0, #0x4d
	ldrb r0, [r0]
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1f
	beq _021F40AC
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #0xb
	bl PhoneCallMessagePrint3
	b _021F40DE
_021F40AC:
	bl LCRandom
	mov r1, #3
	bl _s32_div_f
	add r2, r1, #0
	add r2, #0xc
	lsl r2, r2, #0x18
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	lsr r2, r2, #0x18
	bl PhoneCallMessagePrint3
	b _021F40DE
_021F40C8:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F40D4
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F40D4:
	ldr r0, [r5, #0x4c]
	bl DestroyMsgData
	mov r0, #1
	pop {r3, r4, r5, pc}
_021F40DE:
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov101_021F4064

	thumb_func_start ov101_021F40E8
ov101_021F40E8: ; 0x021F40E8
	push {r4, lr}
	mov r4, #0
	cmp r1, #0x12
	beq _021F40FE
	ldr r0, [r0, #0x20]
	mov r1, #0x12
	bl PhoneRematches_IsSeeking
	cmp r0, #0
	beq _021F40FE
	add r4, r4, #1
_021F40FE:
	cmp r4, #5
	bge _021F4106
	mov r0, #1
	pop {r4, pc}
_021F4106:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov101_021F40E8

	thumb_func_start ov101_021F410C
ov101_021F410C: ; 0x021F410C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #0
	strh r0, [r4, #0x20]
	ldrb r0, [r4, #0x1a]
	cmp r0, #2
	bne _021F4120
	mov r0, #0x8d
	pop {r4, r5, r6, pc}
_021F4120:
	ldrb r0, [r4, #0x19]
	cmp r0, #0
	beq _021F419A
	ldr r0, [r5, #0x1c]
	bl Save_SafariZone_get
	ldrh r1, [r4, #0x1c]
	add r6, r0, #0
	cmp r1, #0
	bgt _021F4138
	beq _021F4154
	b _021F4186
_021F4138:
	sub r1, #0x8e
	cmp r1, #4
	bhi _021F4186
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021F414A: ; jump table
	.short _021F415C - _021F414A - 2 ; case 0
	.short _021F4168 - _021F414A - 2 ; case 1
	.short _021F4168 - _021F414A - 2 ; case 2
	.short _021F417E - _021F414A - 2 ; case 3
	.short _021F417E - _021F414A - 2 ; case 4
_021F4154:
	mov r0, #0xf
	strh r0, [r4, #0x20]
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F415C:
	ldr r0, [r5, #0x28]
	mov r1, #4
	bl ScriptState_SetVar4057
	ldrh r0, [r4, #0x1c]
	pop {r4, r5, r6, pc}
_021F4168:
	mov r1, #1
	bl sub_0202F730
	ldr r0, [r5, #0x1c]
	bl Sav2_PlayerData_GetIGTAddr
	add r1, r0, #0
	add r0, r6, #0
	bl sub_0202F784
	b _021F418E
_021F417E:
	mov r1, #4
	bl sub_0202F730
	b _021F418E
_021F4186:
	mov r0, #0x9a
	strh r0, [r4, #0x1c]
	ldrh r0, [r4, #0x1c]
	pop {r4, r5, r6, pc}
_021F418E:
	ldr r0, [r5, #0x28]
	mov r1, #7
	bl ScriptState_SetVar4057
	ldrh r0, [r4, #0x1c]
	pop {r4, r5, r6, pc}
_021F419A:
	ldr r0, [r4, #0x10]
	ldrh r1, [r0, #6]
	ldrh r0, [r5, #0x30]
	cmp r1, r0
	bne _021F41A8
	mov r0, #0x8c
	pop {r4, r5, r6, pc}
_021F41A8:
	ldr r0, [r5, #0x28]
	bl ScriptState_GetVar4057
	add r0, #0x93
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov101_021F410C

	thumb_func_start ov101_021F41B8
ov101_021F41B8: ; 0x021F41B8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r1, r5, #0
	str r1, [sp]
	add r1, #0x88
	str r1, [sp]
	ldr r1, [r1, #4]
	cmp r1, #0
	bne _021F424A
	bl ov101_021F2110
	ldr r0, [r5, #0x20]
	ldr r2, [r5]
	add r1, sp, #4
	bl sub_0202F340
	add r7, sp, #4
	add r6, r0, #0
	ldrb r0, [r7]
	cmp r0, #0
	bne _021F41F2
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #0x26
	mov r3, #0x27
	bl PhoneCallMessagePrint2
	b _021F4242
_021F41F2:
	cmp r0, #6
	blo _021F4204
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #0x18
	mov r3, #0x19
	bl PhoneCallMessagePrint2
	b _021F4242
_021F4204:
	mov r4, #0
	cmp r0, #0
	bls _021F4222
_021F420A:
	ldrb r2, [r6, r4]
	add r1, r4, #0
	ldr r0, [r5, #0x50]
	add r1, #0xa
	bl BufferSafariZoneAreaName
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	ldrb r0, [r7]
	cmp r4, r0
	blo _021F420A
_021F4222:
	sub r0, r0, #1
	lsl r1, r0, #1
	add r0, sp, #4
	strb r1, [r0]
	ldrb r3, [r0]
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	add r2, r3, #0
	add r2, #0xe
	add r3, #0xf
	lsl r2, r2, #0x18
	lsl r3, r3, #0x18
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl PhoneCallMessagePrint2
_021F4242:
	add r0, r6, #0
	bl FreeToHeap
	b _021F4264
_021F424A:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F4258
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021F4258:
	ldr r0, [r5, #0x4c]
	bl DestroyMsgData
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021F4264:
	ldr r0, [sp]
	ldr r0, [r0, #4]
	add r1, r0, #1
	ldr r0, [sp]
	str r1, [r0, #4]
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov101_021F41B8

	thumb_func_start ov101_021F4274
ov101_021F4274: ; 0x021F4274
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r7, r1, #0
	mov r0, #0
	strh r0, [r7, #0x20]
	ldrb r0, [r7, #0x19]
	cmp r0, #0
	bne _021F42A4
	ldr r0, [r5, #0x28]
	bl ScriptState_IsInRocketTakeover
	cmp r0, #0
	beq _021F4292
	mov r0, #0x9c
	pop {r3, r4, r5, r6, r7, pc}
_021F4292:
	bl LCRandom
	mov r1, #3
	bl _s32_div_f
	add r1, #0xac
	lsl r0, r1, #0x10
	lsr r0, r0, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_021F42A4:
	ldr r0, [r5, #0x24]
	bl PlayerProfile_CountBadges
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	ldr r0, [r5, #0x24]
	mov r1, #2
	bl PlayerProfile_TestBadgeFlag
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	add r0, r5, #0
	add r1, r7, #0
	add r2, r6, #0
	add r3, r4, #0
	bl ov101_021F42E4
	ldr r1, _021F42E0 ; =0x0000FFFF
	cmp r0, r1
	bne _021F42DE
	cmp r4, #0
	bne _021F42D4
	mov r0, #0xa9
	pop {r3, r4, r5, r6, r7, pc}
_021F42D4:
	cmp r6, #0x10
	bhs _021F42DC
	mov r0, #0xaa
	pop {r3, r4, r5, r6, r7, pc}
_021F42DC:
	mov r0, #0xab
_021F42DE:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021F42E0: .word 0x0000FFFF
	thumb_func_end ov101_021F4274

	thumb_func_start ov101_021F42E4
ov101_021F42E4: ; 0x021F42E4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x28]
	ldr r1, _021F445C ; =0x00000998
	add r4, r2, #0
	add r6, r3, #0
	bl CheckFlagInArray
	cmp r0, #0
	bne _021F42FC
	ldr r0, _021F4460 ; =0x0000FFFF
	pop {r4, r5, r6, pc}
_021F42FC:
	ldr r0, [r5, #0x28]
	ldr r1, _021F445C ; =0x00000998
	bl ClearFlagInArray
	cmp r4, #0x10
	blo _021F4324
	ldr r0, [r5, #0x28]
	ldr r1, _021F4464 ; =0x000009A4
	bl CheckFlagInArray
	cmp r0, #0
	bne _021F4320
	ldr r0, [r5, #0x28]
	ldr r1, _021F4464 ; =0x000009A4
	bl SetFlagInArray
	mov r0, #0xa8
	pop {r4, r5, r6, pc}
_021F4320:
	ldr r0, _021F4460 ; =0x0000FFFF
	pop {r4, r5, r6, pc}
_021F4324:
	ldr r0, [r5, #0x24]
	mov r1, #0xd
	bl PlayerProfile_TestBadgeFlag
	cmp r0, #0
	ldr r0, [r5, #0x28]
	beq _021F434C
	ldr r1, _021F4468 ; =0x000009A3
	bl CheckFlagInArray
	cmp r0, #0
	bne _021F4348
	ldr r0, [r5, #0x28]
	ldr r1, _021F4468 ; =0x000009A3
	bl SetFlagInArray
	mov r0, #0xa7
	pop {r4, r5, r6, pc}
_021F4348:
	ldr r0, _021F4460 ; =0x0000FFFF
	pop {r4, r5, r6, pc}
_021F434C:
	mov r1, #0xf9
	bl CheckFlagInArray
	cmp r0, #0
	ldr r0, [r5, #0x28]
	beq _021F4372
	ldr r1, _021F446C ; =0x000009A2
	bl CheckFlagInArray
	cmp r0, #0
	bne _021F436E
	ldr r0, [r5, #0x28]
	ldr r1, _021F446C ; =0x000009A2
	bl SetFlagInArray
	mov r0, #0xa6
	pop {r4, r5, r6, pc}
_021F436E:
	ldr r0, _021F4460 ; =0x0000FFFF
	pop {r4, r5, r6, pc}
_021F4372:
	mov r1, #0x87
	bl CheckFlagInArray
	cmp r0, #0
	ldr r0, [r5, #0x28]
	beq _021F4398
	ldr r1, _021F4470 ; =0x000009A1
	bl CheckFlagInArray
	cmp r0, #0
	bne _021F4394
	ldr r0, [r5, #0x28]
	ldr r1, _021F4470 ; =0x000009A1
	bl SetFlagInArray
	mov r0, #0xa5
	pop {r4, r5, r6, pc}
_021F4394:
	ldr r0, _021F4460 ; =0x0000FFFF
	pop {r4, r5, r6, pc}
_021F4398:
	mov r1, #2
	mov r2, #5
	bl ScriptState_FlypointFlagAction
	cmp r0, #0
	beq _021F43A8
	mov r0, #0xa4
	pop {r4, r5, r6, pc}
_021F43A8:
	ldr r0, [r5, #0x28]
	bl CheckGameClearFlag
	cmp r0, #0
	beq _021F43CE
	ldr r0, [r5, #0x28]
	ldr r1, _021F4474 ; =0x000009A5
	bl CheckFlagInArray
	cmp r0, #0
	bne _021F43CA
	ldr r0, [r5, #0x28]
	ldr r1, _021F4474 ; =0x000009A5
	bl SetFlagInArray
	mov r0, #0xa3
	pop {r4, r5, r6, pc}
_021F43CA:
	ldr r0, _021F4460 ; =0x0000FFFF
	pop {r4, r5, r6, pc}
_021F43CE:
	ldr r0, [r5, #0x24]
	mov r1, #7
	bl PlayerProfile_TestBadgeFlag
	cmp r0, #0
	beq _021F43DE
	mov r0, #0xa2
	pop {r4, r5, r6, pc}
_021F43DE:
	ldr r0, [r5, #0x28]
	mov r1, #0xc6
	bl CheckFlagInArray
	cmp r0, #0
	beq _021F43EE
	mov r0, #0xa1
	pop {r4, r5, r6, pc}
_021F43EE:
	ldr r0, [r5, #0x28]
	mov r1, #0xca
	bl CheckFlagInArray
	cmp r0, #0
	ldr r0, [r5, #0x28]
	beq _021F441A
	mov r1, #0x9a
	lsl r1, r1, #4
	bl CheckFlagInArray
	cmp r0, #0
	bne _021F4416
	mov r1, #0x9a
	ldr r0, [r5, #0x28]
	lsl r1, r1, #4
	bl SetFlagInArray
	mov r0, #0xa0
	pop {r4, r5, r6, pc}
_021F4416:
	ldr r0, _021F4460 ; =0x0000FFFF
	pop {r4, r5, r6, pc}
_021F441A:
	ldr r1, _021F4478 ; =0x0000096A
	bl CheckFlagInArray
	cmp r0, #0
	beq _021F4440
	ldr r0, [r5, #0x28]
	ldr r1, _021F447C ; =0x0000099F
	bl CheckFlagInArray
	cmp r0, #0
	bne _021F443C
	ldr r0, [r5, #0x28]
	ldr r1, _021F447C ; =0x0000099F
	bl SetFlagInArray
	mov r0, #0x9f
	pop {r4, r5, r6, pc}
_021F443C:
	ldr r0, _021F4460 ; =0x0000FFFF
	pop {r4, r5, r6, pc}
_021F4440:
	ldr r0, [r5, #0x24]
	mov r1, #3
	bl PlayerProfile_TestBadgeFlag
	cmp r0, #0
	beq _021F4450
	mov r0, #0x9e
	pop {r4, r5, r6, pc}
_021F4450:
	cmp r6, #0
	beq _021F4458
	mov r0, #0x9d
	pop {r4, r5, r6, pc}
_021F4458:
	ldr r0, _021F4460 ; =0x0000FFFF
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021F445C: .word 0x00000998
_021F4460: .word 0x0000FFFF
_021F4464: .word 0x000009A4
_021F4468: .word 0x000009A3
_021F446C: .word 0x000009A2
_021F4470: .word 0x000009A1
_021F4474: .word 0x000009A5
_021F4478: .word 0x0000096A
_021F447C: .word 0x0000099F
	thumb_func_end ov101_021F42E4

	thumb_func_start ov101_021F4480
ov101_021F4480: ; 0x021F4480
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl OverlayManager_GetParentWork
	mov r2, #2
	add r5, r0, #0
	mov r0, #3
	mov r1, #0x5b
	lsl r2, r2, #0x10
	bl CreateHeap
	add r0, r4, #0
	mov r1, #0x6c
	mov r2, #0x5b
	bl OverlayManager_CreateAndGetData
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x6c
	bl memset
	str r5, [r4, #0xc]
	mov r0, #0x5b
	str r0, [r4]
	add r0, r4, #0
	bl ov101_021F4558
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov101_021F4480

	thumb_func_start ov101_021F44BC
ov101_021F44BC: ; 0x021F44BC
	push {r4, lr}
	add r4, r1, #0
	bl OverlayManager_GetData
	ldr r1, [r4]
	cmp r1, #9
	bhi _021F4526
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021F44D6: ; jump table
	.short _021F44EA - _021F44D6 - 2 ; case 0
	.short _021F44F2 - _021F44D6 - 2 ; case 1
	.short _021F44FA - _021F44D6 - 2 ; case 2
	.short _021F4526 - _021F44D6 - 2 ; case 3
	.short _021F4526 - _021F44D6 - 2 ; case 4
	.short _021F4502 - _021F44D6 - 2 ; case 5
	.short _021F450A - _021F44D6 - 2 ; case 6
	.short _021F4512 - _021F44D6 - 2 ; case 7
	.short _021F451A - _021F44D6 - 2 ; case 8
	.short _021F4522 - _021F44D6 - 2 ; case 9
_021F44EA:
	bl ov101_021F46C8
	str r0, [r4]
	b _021F4526
_021F44F2:
	bl ov101_021F46EC
	str r0, [r4]
	b _021F4526
_021F44FA:
	bl ov101_021F4750
	str r0, [r4]
	b _021F4526
_021F4502:
	bl ov101_021F4764
	str r0, [r4]
	b _021F4526
_021F450A:
	bl ov101_021F4824
	str r0, [r4]
	b _021F4526
_021F4512:
	bl ov101_021F4888
	str r0, [r4]
	b _021F4526
_021F451A:
	bl ov101_021F4928
	str r0, [r4]
	b _021F4526
_021F4522:
	mov r0, #1
	pop {r4, pc}
_021F4526:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov101_021F44BC

	thumb_func_start ov101_021F452C
ov101_021F452C: ; 0x021F452C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	bl ov101_021F45D4
	ldr r2, [r4, #0xc]
	mov r0, #0x80
	ldrb r1, [r2, #5]
	orr r0, r1
	strb r0, [r2, #5]
	ldr r4, [r4]
	add r0, r5, #0
	bl OverlayManager_FreeData
	add r0, r4, #0
	bl DestroyHeap
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov101_021F452C

	thumb_func_start ov101_021F4558
ov101_021F4558: ; 0x021F4558
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	ldr r1, _021F45CC ; =ov101_021F4FCC
	str r4, [r0, #0x64]
	ldr r0, [r4, #0xc]
	str r1, [r0, #0x5c]
	ldr r1, _021F45D0 ; =ov101_021F4FDC
	ldr r0, [r4, #0xc]
	str r1, [r0, #0x60]
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0x28]
	bl sub_0202EE7C
	add r1, r4, #0
	add r1, #0x25
	strb r0, [r1]
	ldr r0, [r4, #0xc]
	add r1, r4, #0
	add r2, r4, #0
	ldr r0, [r0, #0x28]
	add r1, #0x28
	add r2, #0x2a
	bl sub_0202EEB4
	add r0, r4, #0
	add r0, #0x24
	ldrb r1, [r0]
	mov r0, #0xe0
	bic r1, r0
	mov r0, #0x60
	orr r1, r0
	add r0, r4, #0
	add r0, #0x24
	strb r1, [r0]
	add r0, r4, #0
	bl ov101_021F4634
	add r1, r4, #0
	add r1, #0x26
	ldrb r2, [r1]
	mov r1, #0xf
	bic r2, r1
	mov r1, #0xf
	and r0, r1
	add r1, r2, #0
	orr r1, r0
	add r0, r4, #0
	add r0, #0x26
	strb r1, [r0]
	add r0, r4, #0
	mov r1, #0xff
	add r0, #0x27
	strb r1, [r0]
	bl GF_GetCurrentPlayingBGM
	strh r0, [r4, #0x2c]
	pop {r4, pc}
	.balign 4, 0
_021F45CC: .word ov101_021F4FCC
_021F45D0: .word ov101_021F4FDC
	thumb_func_end ov101_021F4558

	thumb_func_start ov101_021F45D4
ov101_021F45D4: ; 0x021F45D4
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0x28
	mov r2, #0x2a
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	lsl r1, r1, #0x18
	lsl r2, r2, #0x18
	ldr r0, [r0, #0x28]
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
	bl sub_0202EEAC
	ldr r0, [r4, #0xc]
	mov r1, #0
	str r1, [r0, #0x5c]
	ldr r0, [r4, #0xc]
	str r1, [r0, #0x60]
	pop {r4, pc}
	thumb_func_end ov101_021F45D4

	thumb_func_start ov101_021F45FC
ov101_021F45FC: ; 0x021F45FC
	push {r4, r5}
	ldr r5, _021F462C ; =ov101_021F87AC
	mov r2, #0
	ldrb r3, [r5, r1]
	cmp r3, #0
	ble _021F4624
	ldr r3, _021F4630 ; =ov101_021FB2C0
	lsl r4, r1, #2
	ldrb r1, [r5, r1]
	ldr r4, [r3, r4]
_021F4610:
	ldrh r3, [r4]
	cmp r0, r3
	bne _021F461C
	mov r0, #1
	pop {r4, r5}
	bx lr
_021F461C:
	add r2, r2, #1
	add r4, r4, #2
	cmp r2, r1
	blt _021F4610
_021F4624:
	mov r0, #0
	pop {r4, r5}
	bx lr
	nop
_021F462C: .word ov101_021F87AC
_021F4630: .word ov101_021FB2C0
	thumb_func_end ov101_021F45FC

	thumb_func_start ov101_021F4634
ov101_021F4634: ; 0x021F4634
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0x20]
	ldrh r5, [r0, #0x10]
	add r0, r5, #0
	bl MapHeader_GetField14_1F
	cmp r0, #0
	bne _021F464C
	mov r0, #3
	pop {r3, r4, r5, pc}
_021F464C:
	add r0, r5, #0
	mov r1, #0
	bl ov101_021F45FC
	cmp r0, #0
	beq _021F465C
	mov r0, #4
	pop {r3, r4, r5, pc}
_021F465C:
	add r0, r5, #0
	bl MapHeader_IsKanto
	cmp r0, #0
	beq _021F4690
	ldr r0, [r4, #0xc]
	mov r1, #0x46
	ldr r0, [r0, #0x2c]
	lsl r1, r1, #2
	bl CheckFlagInArray
	cmp r0, #0
	bne _021F467A
	mov r0, #3
	pop {r3, r4, r5, pc}
_021F467A:
	ldr r0, [r4, #0xc]
	ldr r1, _021F46C4 ; =0x0000011F
	ldr r0, [r0, #0x2c]
	bl CheckFlagInArray
	cmp r0, #0
	beq _021F468C
	mov r0, #2
	pop {r3, r4, r5, pc}
_021F468C:
	mov r0, #1
	pop {r3, r4, r5, pc}
_021F4690:
	add r0, r5, #0
	mov r1, #1
	bl ov101_021F45FC
	cmp r0, #0
	beq _021F46AE
	ldr r0, [r4, #0xc]
	mov r1, #0xca
	ldr r0, [r0, #0x2c]
	bl CheckFlagInArray
	cmp r0, #0
	bne _021F46AE
	mov r0, #6
	pop {r3, r4, r5, pc}
_021F46AE:
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0x2c]
	bl ScriptState_IsInRocketTakeover
	cmp r0, #0
	beq _021F46BE
	mov r0, #5
	pop {r3, r4, r5, pc}
_021F46BE:
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_021F46C4: .word 0x0000011F
	thumb_func_end ov101_021F4634

	thumb_func_start ov101_021F46C8
ov101_021F46C8: ; 0x021F46C8
	push {r4, lr}
	add r4, r0, #0
	bl ov101_021F49F8
	cmp r0, #0
	bne _021F46D8
	mov r0, #0
	pop {r4, pc}
_021F46D8:
	ldr r0, [r4, #0xc]
	ldrb r0, [r0, #5]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1f
	beq _021F46E6
	mov r0, #7
	pop {r4, pc}
_021F46E6:
	mov r0, #5
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov101_021F46C8

	thumb_func_start ov101_021F46EC
ov101_021F46EC: ; 0x021F46EC
	push {r3, r4, lr}
	sub sp, #4
	mov r1, #0
	str r1, [sp]
	add r1, sp, #0
	add r4, r0, #0
	bl ov101_021F5468
	ldr r1, [sp]
	cmp r1, #0
	bne _021F471C
	ldr r0, [r4, #0xc]
	bl ov100_021E5900
	ldr r0, [r4, #0xc]
	ldrb r1, [r0, #6]
	cmp r1, #1
	bne _021F4716
	bl ov100_021E59CC
	b _021F471C
_021F4716:
	add r0, r4, #0
	bl ov101_021F5304
_021F471C:
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _021F4748
	cmp r0, #4
	beq _021F472E
	cmp r0, #8
	beq _021F4738
	b _021F473E
_021F472E:
	ldr r1, [r4, #0xc]
	add sp, #4
	str r0, [r1, #0x1c]
	mov r0, #6
	pop {r3, r4, pc}
_021F4738:
	add sp, #4
	mov r0, #3
	pop {r3, r4, pc}
_021F473E:
	ldr r1, [r4, #0xc]
	add sp, #4
	str r0, [r1, #0x1c]
	mov r0, #8
	pop {r3, r4, pc}
_021F4748:
	mov r0, #1
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov101_021F46EC

	thumb_func_start ov101_021F4750
ov101_021F4750: ; 0x021F4750
	push {r3, lr}
	bl ov101_021F4A4C
	cmp r0, #0
	beq _021F475E
	mov r0, #9
	pop {r3, pc}
_021F475E:
	mov r0, #2
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov101_021F4750

	thumb_func_start ov101_021F4764
ov101_021F4764: ; 0x021F4764
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _021F4776
	cmp r0, #1
	beq _021F4804
	b _021F481C
_021F4776:
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
_021F4790:
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	add r1, r6, #0
	bl ToggleBgLayer
	add r4, r4, #1
	cmp r4, #8
	blt _021F4790
	ldr r0, [r5, #0xc]
	mov r1, #1
	ldr r0, [r0, #0x78]
	bl sub_02003B50
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r0, [r5, #0xc]
	add r2, r1, #0
	ldr r0, [r0, #0x78]
	mov r3, #0xe0
	bl sub_02003E5C
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [r5, #0xc]
	mov r1, #2
	ldr r0, [r0, #0x78]
	mov r2, #0x40
	mov r3, #0xc0
	bl sub_02003E5C
	ldr r0, [r5, #0xc]
	ldr r0, [r0, #0x78]
	bl sub_0200398C
	ldr r0, [r5, #0xc]
	mov r1, #0
	ldr r0, [r0, #0x78]
	bl sub_02003B50
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	bl GF_GetCurrentPlayingBGM
	mov r1, #6
	bl StopBGM
	ldr r0, [r5, #4]
	add r0, r0, #1
	str r0, [r5, #4]
	b _021F481C
_021F4804:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021F481C
	add r0, r5, #0
	bl ov101_021F5090
	mov r0, #0
	str r0, [r5, #4]
	add sp, #0xc
	mov r0, #1
	pop {r3, r4, r5, r6, pc}
_021F481C:
	mov r0, #5
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov101_021F4764

	thumb_func_start ov101_021F4824
ov101_021F4824: ; 0x021F4824
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _021F4836
	cmp r0, #1
	beq _021F4856
	b _021F4882
_021F4836:
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
	b _021F4882
_021F4856:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021F4882
	add r0, r5, #0
	bl ov101_021F5048
	mov r4, #0
	add r6, r4, #0
_021F4868:
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	add r1, r6, #0
	bl ToggleBgLayer
	add r4, r4, #1
	cmp r4, #8
	blt _021F4868
	mov r0, #0
	str r0, [r5, #4]
	add sp, #0xc
	mov r0, #2
	pop {r3, r4, r5, r6, pc}
_021F4882:
	mov r0, #6
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov101_021F4824

	thumb_func_start ov101_021F4888
ov101_021F4888: ; 0x021F4888
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _021F489C
	cmp r0, #1
	beq _021F48E4
	cmp r0, #2
	beq _021F4904
	b _021F4922
_021F489C:
	ldr r0, [r5, #0xc]
	mov r1, #1
	ldr r0, [r0, #0x78]
	bl sub_02003B50
	add r0, r5, #0
	mov r1, #0
	bl ov101_021F50F0
	ldr r0, [r5, #0xc]
	mov r4, #0
	strb r4, [r0, #9]
	mov r6, #1
_021F48B6:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	add r1, r6, #0
	bl ToggleBgLayer
	add r4, r4, #1
	cmp r4, #3
	blt _021F48B6
	mov r0, #0
	mov r1, #0xe
	mov r2, #1
	bl SetBlendBrightness
	bl GF_GetCurrentPlayingBGM
	mov r1, #6
	bl StopBGM
	ldr r0, [r5, #4]
	add r0, r0, #1
	str r0, [r5, #4]
	b _021F4922
_021F48E4:
	ldr r0, [r5, #0xc]
	mov r1, #0
	bl ov100_021E5D3C
	cmp r0, #0
	beq _021F4922
	add r0, r5, #0
	mov r1, #0
	bl ov101_021F51C0
	cmp r0, #0
	beq _021F4922
	ldr r0, [r5, #4]
	add r0, r0, #1
	str r0, [r5, #4]
	b _021F4922
_021F4904:
	ldr r0, [r5, #0xc]
	mov r1, #0
	ldr r0, [r0, #0x78]
	bl sub_02003B50
	ldr r0, [r5, #0xc]
	mov r1, #0
	strb r1, [r0, #9]
	add r0, r5, #0
	bl ov101_021F5090
	mov r0, #0
	str r0, [r5, #4]
	mov r0, #1
	pop {r4, r5, r6, pc}
_021F4922:
	mov r0, #7
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov101_021F4888

	thumb_func_start ov101_021F4928
ov101_021F4928: ; 0x021F4928
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r1, [r5, #4]
	cmp r1, #0
	beq _021F493E
	cmp r1, #1
	beq _021F495C
	cmp r1, #2
	beq _021F497C
	b _021F49F0
_021F493E:
	mov r1, #1
	bl ov101_021F50F0
	ldr r0, [r5, #0xc]
	mov r1, #1
	ldr r0, [r0, #0x78]
	bl sub_02003B50
	ldr r0, [r5, #0xc]
	mov r1, #0
	strb r1, [r0, #9]
	ldr r0, [r5, #4]
	add r0, r0, #1
	str r0, [r5, #4]
	b _021F49F0
_021F495C:
	ldr r0, [r5, #0xc]
	mov r1, #1
	bl ov100_021E5D3C
	cmp r0, #0
	beq _021F49F0
	add r0, r5, #0
	mov r1, #1
	bl ov101_021F51C0
	cmp r0, #0
	beq _021F49F0
	ldr r0, [r5, #4]
	add r0, r0, #1
	str r0, [r5, #4]
	b _021F49F0
_021F497C:
	mov r0, #0x10
	mov r1, #0
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r5, #0xc]
	add r2, r1, #0
	ldr r0, [r0, #0x78]
	mov r3, #0xe0
	bl sub_02003E5C
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, [r5, #0xc]
	mov r1, #2
	ldr r0, [r0, #0x78]
	mov r2, #0x40
	mov r3, #0xc0
	bl sub_02003E5C
	ldr r0, [r5, #0xc]
	ldr r0, [r0, #0x78]
	bl sub_0200398C
	add r0, r5, #0
	bl ov101_021F5048
	mov r4, #0
	add r6, r4, #0
	add r7, r4, #0
_021F49BA:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	add r1, r6, #0
	bl ToggleBgLayer
	add r0, r4, #5
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	add r1, r7, #0
	bl ToggleBgLayer
	add r4, r4, #1
	cmp r4, #3
	blt _021F49BA
	ldr r0, [r5, #0xc]
	mov r1, #0
	ldr r0, [r0, #0x78]
	bl sub_02003B50
	ldr r0, [r5, #0xc]
	mov r1, #0
	strb r1, [r0, #9]
	add sp, #8
	str r1, [r5, #4]
	mov r0, #2
	pop {r3, r4, r5, r6, r7, pc}
_021F49F0:
	mov r0, #8
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov101_021F4928

	thumb_func_start ov101_021F49F8
ov101_021F49F8: ; 0x021F49F8
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _021F4A08
	cmp r1, #1
	beq _021F4A26
	b _021F4A3E
_021F4A08:
	bl ov101_021F4AEC
	add r0, r4, #0
	bl ov101_021F4BC8
	add r0, r4, #0
	bl ov101_021F4DC8
	add r0, r4, #0
	bl ov101_021F4E6C
	add r0, r4, #0
	bl ov101_021F4CE8
	b _021F4A3E
_021F4A26:
	bl ov101_021F4E84
	add r0, r4, #0
	bl ov101_021F4F00
	ldr r1, _021F4A48 ; =ov101_021F50D8
	ldr r0, [r4, #0xc]
	str r1, [r0, #0x58]
	mov r0, #0
	str r0, [r4, #8]
	mov r0, #1
	pop {r4, pc}
_021F4A3E:
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_021F4A48: .word ov101_021F50D8
	thumb_func_end ov101_021F49F8

	thumb_func_start ov101_021F4A4C
ov101_021F4A4C: ; 0x021F4A4C
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _021F4A60
	cmp r1, #1
	beq _021F4AA0
	cmp r1, #2
	beq _021F4ABE
	b _021F4AE8
_021F4A60:
	mov r1, #0x28
	mov r2, #0x2a
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	mov r3, #0
	bl ov101_021F54AC
	cmp r0, #0xff
	beq _021F4A88
	ldr r1, [r4, #0x60]
	add r0, r1, #0
	add r0, #0x66
	ldrb r0, [r0]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1f
	bne _021F4A88
	add r1, #0x59
	ldrb r0, [r1]
	cmp r0, #0xb
	bne _021F4A92
_021F4A88:
	mov r0, #0
	mov r1, #4
	bl GF_SndStartFadeOutBGM
	b _021F4A98
_021F4A92:
	mov r0, #2
	str r0, [r4, #8]
	b _021F4AE8
_021F4A98:
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _021F4AE8
_021F4AA0:
	bl GF_SndGetFadeTimer
	cmp r0, #0
	bne _021F4AE8
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0x20]
	ldrh r0, [r0, #2]
	bl PlayBGM
	bl sub_0203E354
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _021F4AE8
_021F4ABE:
	ldr r1, [r4, #0xc]
	mov r2, #0
	str r2, [r1, #0x58]
	bl ov101_021F4EE8
	add r0, r4, #0
	bl ov101_021F4E78
	add r0, r4, #0
	bl ov101_021F4E48
	add r0, r4, #0
	bl ov101_021F4CD8
	add r0, r4, #0
	bl ov101_021F4BBC
	mov r0, #0
	str r0, [r4, #8]
	mov r0, #1
	pop {r4, pc}
_021F4AE8:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov101_021F4A4C

	thumb_func_start ov101_021F4AEC
ov101_021F4AEC: ; 0x021F4AEC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xac
	mov r1, #0
	add r5, r0, #0
	mov r0, #1
	add r2, r1, #0
	bl GX_SetGraphicsMode
	ldr r4, _021F4BB8 ; =ov101_021F87F4
	add r3, sp, #4
	mov r2, #0x15
_021F4B02:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021F4B02
	mov r3, #0
	str r3, [sp]
	ldr r0, [r5, #0xc]
	mov r1, #1
	ldr r0, [r0, #0x74]
	add r2, sp, #4
	bl InitBgFromTemplateEx
	mov r3, #0
	str r3, [sp]
	ldr r0, [r5, #0xc]
	mov r1, #2
	ldr r0, [r0, #0x74]
	add r2, sp, #0x20
	bl InitBgFromTemplateEx
	mov r3, #0
	str r3, [sp]
	ldr r0, [r5, #0xc]
	mov r1, #3
	ldr r0, [r0, #0x74]
	add r2, sp, #0x3c
	bl InitBgFromTemplateEx
	mov r3, #0
	str r3, [sp]
	ldr r0, [r5, #0xc]
	mov r1, #5
	ldr r0, [r0, #0x74]
	add r2, sp, #0x58
	bl InitBgFromTemplateEx
	mov r3, #0
	str r3, [sp]
	ldr r0, [r5, #0xc]
	mov r1, #6
	ldr r0, [r0, #0x74]
	add r2, sp, #0x74
	bl InitBgFromTemplateEx
	mov r3, #0
	str r3, [sp]
	ldr r0, [r5, #0xc]
	mov r1, #7
	ldr r0, [r0, #0x74]
	add r2, sp, #0x90
	bl InitBgFromTemplateEx
	mov r4, #0
	mov r6, #0x20
	add r7, r4, #0
_021F4B70:
	ldr r0, [r5, #0xc]
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
	ldr r0, [r5, #0xc]
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
	add r4, r4, #1
	cmp r4, #3
	blt _021F4B70
	add sp, #0xac
	pop {r4, r5, r6, r7, pc}
	nop
_021F4BB8: .word ov101_021F87F4
	thumb_func_end ov101_021F4AEC

	thumb_func_start ov101_021F4BBC
ov101_021F4BBC: ; 0x021F4BBC
	ldr r3, _021F4BC4 ; =ov100_021E5CA4
	ldr r0, [r0, #0xc]
	bx r3
	nop
_021F4BC4: .word ov100_021E5CA4
	thumb_func_end ov101_021F4BBC

	thumb_func_start ov101_021F4BC8
ov101_021F4BC8: ; 0x021F4BC8
	push {r4, r5, lr}
	sub sp, #0x14
	add r5, r0, #0
	ldr r1, [r5]
	mov r0, #4
	bl FontID_Alloc
	ldr r1, [r5]
	mov r0, #0x93
	bl NARC_ctor
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x25
	ldrb r0, [r0]
	add r2, r4, #0
	mov r3, #0x93
	add r0, #0x10
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0xc]
	ldr r1, [r5]
	ldr r0, [r0, #0x74]
	bl sub_0208820C
	add r0, r5, #0
	add r0, #0x25
	ldrb r0, [r0]
	add r2, r4, #0
	mov r3, #0x93
	add r0, #0x22
	str r0, [sp]
	mov r0, #7
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0xc]
	ldr r1, [r5]
	ldr r0, [r0, #0x74]
	bl sub_0208820C
	add r0, r5, #0
	add r0, #0x25
	ldrb r0, [r0]
	add r2, r4, #0
	mov r3, #0x93
	add r0, #0x16
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	lsl r0, r0, #0xb
	str r0, [sp, #0xc]
	mov r0, #0
	str r0, [sp, #0x10]
	ldr r0, [r5, #0xc]
	ldr r1, [r5]
	ldr r0, [r0, #0x74]
	bl sub_0208820C
	add r0, r5, #0
	add r0, #0x25
	ldrb r0, [r0]
	add r2, r4, #0
	mov r3, #0x93
	add r0, #0x1c
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	lsl r0, r0, #0xb
	str r0, [sp, #0xc]
	mov r0, #0
	str r0, [sp, #0x10]
	ldr r0, [r5, #0xc]
	ldr r1, [r5]
	ldr r0, [r0, #0x74]
	bl sub_0208820C
	add r0, r5, #0
	add r0, #0x25
	ldrb r0, [r0]
	add r2, r4, #0
	mov r3, #0x93
	add r0, #0x28
	str r0, [sp]
	mov r0, #7
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	lsl r0, r0, #0xb
	str r0, [sp, #0xc]
	mov r0, #0
	str r0, [sp, #0x10]
	ldr r0, [r5, #0xc]
	ldr r1, [r5]
	ldr r0, [r0, #0x74]
	bl sub_0208820C
	ldr r0, [r5]
	add r1, r5, #0
	str r0, [sp]
	add r1, #0x25
	ldrb r1, [r1]
	add r3, r5, #0
	add r0, r4, #0
	add r1, #0x16
	mov r2, #0
	add r3, #0x68
	bl GfGfxLoader_GetScrnDataFromOpenNarc
	str r0, [r5, #0x64]
	add r0, r4, #0
	bl NARC_dtor
	ldr r0, [r5, #0xc]
	mov r1, #2
	ldr r0, [r0, #0x74]
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r5, #0xc]
	mov r1, #7
	ldr r0, [r0, #0x74]
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x14
	pop {r4, r5, pc}
	thumb_func_end ov101_021F4BC8

	thumb_func_start ov101_021F4CD8
ov101_021F4CD8: ; 0x021F4CD8
	push {r3, lr}
	ldr r0, [r0, #0x64]
	bl FreeToHeap
	mov r0, #4
	bl FontID_Release
	pop {r3, pc}
	thumb_func_end ov101_021F4CD8

	thumb_func_start ov101_021F4CE8
ov101_021F4CE8: ; 0x021F4CE8
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r1, [r5]
	mov r0, #0x93
	bl NARC_ctor
	add r4, r0, #0
	mov r1, #0
	mov r0, #7
	add r2, r5, #0
	str r1, [sp]
	lsl r0, r0, #6
	str r0, [sp, #4]
	str r1, [sp, #8]
	str r1, [sp, #0xc]
	add r2, #0x25
	ldr r0, [r5, #0xc]
	ldrb r2, [r2]
	ldr r0, [r0, #0x78]
	ldr r3, [r5]
	add r1, r4, #0
	add r2, #0xa
	bl sub_02003220
	mov r0, #1
	str r0, [sp]
	mov r0, #6
	lsl r0, r0, #6
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	add r2, r5, #0
	add r2, #0x25
	ldr r0, [r5, #0xc]
	ldrb r2, [r2]
	ldr r0, [r0, #0x78]
	ldr r3, [r5]
	add r1, r4, #0
	add r2, r2, #4
	bl sub_02003220
	mov r0, #2
	str r0, [sp]
	mov r0, #6
	lsl r0, r0, #6
	str r0, [sp, #4]
	mov r0, #0x40
	str r0, [sp, #8]
	mov r2, #0
	str r2, [sp, #0xc]
	ldr r0, [r5, #0xc]
	ldr r3, [r5]
	ldr r0, [r0, #0x78]
	add r1, r4, #0
	bl sub_02003220
	mov r0, #3
	str r0, [sp]
	lsl r0, r0, #7
	str r0, [sp, #4]
	mov r0, #0x40
	str r0, [sp, #8]
	mov r2, #0
	str r2, [sp, #0xc]
	ldr r0, [r5, #0xc]
	ldr r3, [r5]
	ldr r0, [r0, #0x78]
	add r1, r4, #0
	bl sub_02003220
	ldr r0, [r5, #0xc]
	mov r1, #1
	ldr r0, [r0, #0x78]
	bl sub_02003B50
	mov r0, #0x10
	mov r1, #0
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r5, #0xc]
	add r2, r1, #0
	ldr r0, [r0, #0x78]
	mov r3, #0xe0
	bl sub_02003E5C
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, [r5, #0xc]
	mov r1, #2
	ldr r0, [r0, #0x78]
	mov r2, #0x40
	mov r3, #0xc0
	bl sub_02003E5C
	ldr r0, [r5, #0xc]
	ldr r0, [r0, #0x78]
	bl sub_0200398C
	ldr r0, [r5, #0xc]
	mov r1, #0
	ldr r0, [r0, #0x78]
	bl sub_02003B50
	add r0, r4, #0
	bl NARC_dtor
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end ov101_021F4CE8

	thumb_func_start ov101_021F4DC8
ov101_021F4DC8: ; 0x021F4DC8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r7, r0, #0
	add r5, r7, #0
	ldr r4, _021F4E40 ; =ov101_021F87DC
	mov r6, #0
	add r5, #0x30
_021F4DD6:
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
	ldr r0, [r7, #0xc]
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
	cmp r6, #3
	blt _021F4DD6
	ldr r4, [r7, #0xc]
	ldr r5, [r4, #0x20]
	ldrh r0, [r5, #0x10]
	bl MapHeader_IsKanto
	add r3, r0, #0
	add r0, r7, #0
	add r0, #0x30
	str r0, [sp]
	add r0, r7, #0
	add r0, #0x50
	str r0, [sp, #4]
	add r0, r7, #0
	add r0, #0x40
	str r0, [sp, #8]
	ldr r0, _021F4E44 ; =0x00010200
	str r0, [sp, #0xc]
	ldr r0, [r7]
	str r0, [sp, #0x10]
	ldrh r1, [r5, #0x10]
	ldrh r2, [r5, #0x12]
	ldr r0, [r4, #0x24]
	bl ov101_021F57B8
	str r0, [r7, #0x60]
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021F4E40: .word ov101_021F87DC
_021F4E44: .word 0x00010200
	thumb_func_end ov101_021F4DC8

	thumb_func_start ov101_021F4E48
ov101_021F4E48: ; 0x021F4E48
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x60]
	bl ov101_021F58A0
	mov r4, #0
	add r5, #0x30
_021F4E56:
	add r0, r5, #0
	bl ClearWindowTilemapAndCopyToVram
	add r0, r5, #0
	bl RemoveWindow
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #3
	blt _021F4E56
	pop {r3, r4, r5, pc}
	thumb_func_end ov101_021F4E48

	thumb_func_start ov101_021F4E6C
ov101_021F4E6C: ; 0x021F4E6C
	ldr r3, _021F4E74 ; =ov100_021E6978
	ldr r0, [r0, #0xc]
	mov r1, #1
	bx r3
	.balign 4, 0
_021F4E74: .word ov100_021E6978
	thumb_func_end ov101_021F4E6C

	thumb_func_start ov101_021F4E78
ov101_021F4E78: ; 0x021F4E78
	ldr r3, _021F4E80 ; =ov100_021E69C8
	ldr r0, [r0, #0xc]
	bx r3
	nop
_021F4E80: .word ov100_021E69C8
	thumb_func_end ov101_021F4E78

	thumb_func_start ov101_021F4E84
ov101_021F4E84: ; 0x021F4E84
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	ldr r4, _021F4EE4 ; =ov101_021F889C
	mov r6, #0
	add r5, r7, #0
_021F4E8E:
	ldr r1, [r7, #0xc]
	add r2, r4, #0
	add r0, r1, #0
	add r0, #0x8c
	add r1, #0x90
	ldr r0, [r0]
	ldr r1, [r1]
	bl sub_0200D2B4
	str r0, [r5, #0x10]
	mov r1, #1
	bl sub_0200DD3C
	ldr r0, [r5, #0x10]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	ldr r0, [r5, #0x10]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	add r6, r6, #1
	add r4, #0x28
	add r5, r5, #4
	cmp r6, #5
	blt _021F4E8E
	ldr r0, [r7, #0x20]
	mov r1, #3
	bl sub_0200DD3C
	ldr r0, [r7, #0x20]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r1, #0x28
	mov r2, #0x2a
	ldrsh r1, [r7, r1]
	ldrsh r2, [r7, r2]
	ldr r0, [r7, #0x20]
	bl sub_0200DD88
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F4EE4: .word ov101_021F889C
	thumb_func_end ov101_021F4E84

	thumb_func_start ov101_021F4EE8
ov101_021F4EE8: ; 0x021F4EE8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
_021F4EEE:
	ldr r0, [r5, #0x10]
	bl sub_0200D018
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #5
	blt _021F4EEE
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov101_021F4EE8

	thumb_func_start ov101_021F4F00
ov101_021F4F00: ; 0x021F4F00
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0xc]
	ldrb r0, [r1, #6]
	cmp r0, #1
	ldr r0, [r1, #0x7c]
	bne _021F4F2A
	mov r1, #0
	mov r2, #1
	bl ov100_021E7128
	ldr r0, [r4, #0xc]
	bl ov100_021E5DC8
	add r2, r0, #0
	ldr r0, [r4, #0xc]
	mov r1, #0
	ldr r0, [r0, #0x7c]
	bl ov100_021E72F8
	pop {r4, pc}
_021F4F2A:
	mov r1, #0
	add r2, r1, #0
	bl ov100_021E7128
	pop {r4, pc}
	thumb_func_end ov101_021F4F00

	thumb_func_start ov101_021F4F34
ov101_021F4F34: ; 0x021F4F34
	push {r3, r4, r5, r6, lr}
	sub sp, #0x1c
	add r5, r0, #0
	add r4, r1, #0
	cmp r2, #4
	bhs _021F4F7A
	ldr r0, [r5, #0x68]
	mov r1, #4
	str r1, [sp]
	str r1, [sp, #4]
	add r1, r0, #0
	add r1, #0xc
	str r1, [sp, #8]
	mov r1, #0
	str r1, [sp, #0xc]
	mov r1, #0x18
	str r1, [sp, #0x10]
	ldrh r1, [r0]
	lsl r3, r2, #1
	ldr r2, _021F4FC4 ; =ov101_021FB2C8
	lsl r1, r1, #0x15
	lsr r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	ldr r6, _021F4FC8 ; =ov101_021FB2C8 + 1
	ldrb r2, [r2, r3]
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0xc]
	ldrb r3, [r6, r3]
	ldr r0, [r0, #0x74]
	mov r1, #2
	bl CopyToBgTilemapRect
_021F4F7A:
	cmp r4, #4
	bhs _021F4FB6
	ldr r0, [r5, #0x68]
	mov r2, #4
	str r2, [sp]
	add r1, r0, #0
	str r2, [sp, #4]
	add r1, #0xc
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	mov r1, #0x18
	str r1, [sp, #0x10]
	ldrh r1, [r0]
	lsl r3, r4, #1
	ldr r2, _021F4FC4 ; =ov101_021FB2C8
	lsl r1, r1, #0x15
	lsr r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	ldr r4, _021F4FC8 ; =ov101_021FB2C8 + 1
	ldrb r2, [r2, r3]
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0xc]
	ldrb r3, [r4, r3]
	ldr r0, [r0, #0x74]
	mov r1, #2
	bl CopyToBgTilemapRect
_021F4FB6:
	ldr r0, [r5, #0xc]
	mov r1, #2
	ldr r0, [r0, #0x74]
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x1c
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_021F4FC4: .word ov101_021FB2C8
_021F4FC8: .word ov101_021FB2C8 + 1
	thumb_func_end ov101_021F4F34

	thumb_func_start ov101_021F4FCC
ov101_021F4FCC: ; 0x021F4FCC
	add r1, r0, #0
	add r1, #0x24
	ldrb r2, [r1]
	mov r1, #0x1e
	add r0, #0x24
	bic r2, r1
	strb r2, [r0]
	bx lr
	thumb_func_end ov101_021F4FCC

	thumb_func_start ov101_021F4FDC
ov101_021F4FDC: ; 0x021F4FDC
	add r1, r0, #0
	add r1, #0x24
	ldrb r2, [r1]
	mov r1, #0x1e
	ldr r3, _021F4FFC ; =ov100_021E7128
	bic r2, r1
	add r1, r0, #0
	add r1, #0x24
	strb r2, [r1]
	ldr r2, [r0, #0xc]
	mov r1, #0
	strb r1, [r2, #6]
	ldr r0, [r0, #0xc]
	add r2, r1, #0
	ldr r0, [r0, #0x7c]
	bx r3
	.balign 4, 0
_021F4FFC: .word ov100_021E7128
	thumb_func_end ov101_021F4FDC

	thumb_func_start ov101_021F5000
ov101_021F5000: ; 0x021F5000
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x26
	ldrb r0, [r0]
	lsl r1, r0, #0x18
	lsr r1, r1, #0x1e
	bne _021F5044
	lsl r0, r0, #0x1a
	lsr r0, r0, #0x1e
	cmp r0, #2
	ldr r0, [r4, #0x60]
	bne _021F5026
	add r1, r4, #0
	add r1, #0x27
	ldrb r1, [r1]
	mov r2, #0
	bl ov101_021F5970
	b _021F5032
_021F5026:
	add r1, r4, #0
	add r1, #0x27
	ldrb r1, [r1]
	mov r2, #1
	bl ov101_021F5970
_021F5032:
	add r0, r4, #0
	add r0, #0x26
	ldrb r1, [r0]
	mov r0, #0xc0
	add r4, #0x26
	bic r1, r0
	mov r0, #0x40
	orr r0, r1
	strb r0, [r4]
_021F5044:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov101_021F5000

	thumb_func_start ov101_021F5048
ov101_021F5048: ; 0x021F5048
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x26
	ldrb r0, [r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1e
	beq _021F508E
	ldr r0, [r4, #0x60]
	bl ov101_021F5A50
	add r0, r4, #0
	add r0, #0x50
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r4, #0
	add r0, #0x40
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r4, #0
	add r0, #0x50
	bl ScheduleWindowCopyToVram
	add r0, r4, #0
	add r0, #0x40
	bl ScheduleWindowCopyToVram
	add r0, r4, #0
	add r0, #0x26
	ldrb r1, [r0]
	mov r0, #0xc0
	add r4, #0x26
	bic r1, r0
	strb r1, [r4]
_021F508E:
	pop {r4, pc}
	thumb_func_end ov101_021F5048

	thumb_func_start ov101_021F5090
ov101_021F5090: ; 0x021F5090
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	mov r1, #0x28
	mov r2, #0x2a
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	add r3, sp, #0
	bl ov101_021F54AC
	add r1, r4, #0
	add r1, #0x27
	strb r0, [r1]
	add r0, r4, #0
	add r0, #0x26
	ldrb r1, [r0]
	mov r0, #0x30
	bic r1, r0
	add r0, sp, #0
	ldrb r0, [r0]
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1a
	orr r1, r0
	add r0, r4, #0
	add r0, #0x26
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x27
	ldrb r0, [r0]
	cmp r0, #8
	bhs _021F50D4
	add r0, r4, #0
	bl ov101_021F5000
_021F50D4:
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov101_021F5090

	thumb_func_start ov101_021F50D8
ov101_021F50D8: ; 0x021F50D8
	push {r3, lr}
	add r0, r1, #0
	add r0, #0x26
	ldrb r0, [r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1e
	beq _021F50EC
	ldr r0, [r1, #0x60]
	bl ov101_021F5B94
_021F50EC:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov101_021F50D8

	thumb_func_start ov101_021F50F0
ov101_021F50F0: ; 0x021F50F0
	push {r3, r4, r5, r6, r7, lr}
	ldr r2, _021F51AC ; =0x04001040
	add r5, r0, #0
	mov r0, #0xff
	strh r0, [r2]
	ldr r3, _021F51B0 ; =0x000070C0
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
	ldr r4, _021F51B4 ; =0xFFFFC0FF
	lsl r3, r3, #8
	and r4, r6
	orr r3, r4
	strh r3, [r0]
	ldr r3, [r2]
	ldr r0, _021F51B8 ; =0xFFFF1FFF
	and r3, r0
	mov r0, #6
	lsl r0, r0, #0xc
	orr r0, r3
	str r0, [r2]
	cmp r1, #0
	bne _021F5170
	mov r6, #3
	add r7, r6, #0
	mov r4, #0
	sub r7, #0x53
_021F514A:
	ldr r0, [r5, #0xc]
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
	blt _021F514A
	b _021F519A
_021F5170:
	ldr r0, [r5, #0xc]
	mov r1, #5
	ldr r0, [r0, #0x74]
	add r2, r1, #0
	mov r3, #0
	bl BgSetPosTextAndCommit
	ldr r0, [r5, #0xc]
	mov r1, #6
	ldr r0, [r0, #0x74]
	mov r2, #5
	mov r3, #0
	bl BgSetPosTextAndCommit
	ldr r0, [r5, #0xc]
	mov r1, #7
	ldr r0, [r0, #0x74]
	mov r2, #5
	mov r3, #0
	bl BgSetPosTextAndCommit
_021F519A:
	ldrh r1, [r5, #0x2e]
	ldr r0, _021F51BC ; =0xFFFF8000
	and r1, r0
	strh r1, [r5, #0x2e]
	ldrh r1, [r5, #0x2e]
	sub r0, r0, #1
	and r0, r1
	strh r0, [r5, #0x2e]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021F51AC: .word 0x04001040
_021F51B0: .word 0x000070C0
_021F51B4: .word 0xFFFFC0FF
_021F51B8: .word 0xFFFF1FFF
_021F51BC: .word 0xFFFF8000
	thumb_func_end ov101_021F50F0

	thumb_func_start ov101_021F51C0
ov101_021F51C0: ; 0x021F51C0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldrh r0, [r5, #0x2e]
	add r4, r1, #0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x1f
	beq _021F51D2
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021F51D2:
	cmp r4, #0
	ldr r0, [r5, #0xc]
	bne _021F5202
	ldr r0, [r0, #0x74]
	mov r1, #5
	mov r2, #4
	mov r3, #0xa
	bl BgSetPosTextAndCommit
	ldr r0, [r5, #0xc]
	mov r1, #6
	ldr r0, [r0, #0x74]
	mov r2, #4
	mov r3, #0xa
	bl BgSetPosTextAndCommit
	ldr r0, [r5, #0xc]
	mov r1, #7
	ldr r0, [r0, #0x74]
	mov r2, #4
	mov r3, #0xa
	bl BgSetPosTextAndCommit
	b _021F522A
_021F5202:
	mov r1, #5
	ldr r0, [r0, #0x74]
	add r2, r1, #0
	mov r3, #0xa
	bl BgSetPosTextAndCommit
	ldr r0, [r5, #0xc]
	mov r1, #6
	ldr r0, [r0, #0x74]
	mov r2, #5
	mov r3, #0xa
	bl BgSetPosTextAndCommit
	ldr r0, [r5, #0xc]
	mov r1, #7
	ldr r0, [r0, #0x74]
	mov r2, #5
	mov r3, #0xa
	bl BgSetPosTextAndCommit
_021F522A:
	ldrh r3, [r5, #0x2e]
	add r1, r5, #0
	ldr r2, _021F52F4 ; =0xFFFF8000
	add r0, r3, #0
	lsl r3, r3, #0x11
	lsr r3, r3, #0x11
	add r3, r3, #1
	lsl r3, r3, #0x10
	lsr r6, r3, #0x10
	lsr r3, r2, #0x11
	and r0, r2
	and r3, r6
	orr r0, r3
	strh r0, [r5, #0x2e]
	ldrh r0, [r5, #0x2e]
	add r1, #0x2e
	lsl r0, r0, #0x11
	lsr r0, r0, #0x11
	cmp r0, #8
	bhs _021F5256
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021F5256:
	ldrh r0, [r1]
	and r0, r2
	strh r0, [r1]
	ldrh r2, [r1]
	mov r0, #2
	lsl r0, r0, #0xe
	orr r0, r2
	strh r0, [r1]
	cmp r4, #1
	bne _021F52B0
	mov r4, #0
	add r6, r4, #0
	mov r7, #3
_021F5270:
	add r0, r4, #5
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	add r1, r6, #0
	bl ToggleBgLayer
	ldr r0, [r5, #0xc]
	add r1, r4, #5
	lsl r1, r1, #0x18
	ldr r0, [r0, #0x74]
	lsr r1, r1, #0x18
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0xc]
	add r1, r4, #5
	lsl r1, r1, #0x18
	ldr r0, [r0, #0x74]
	lsr r1, r1, #0x18
	add r2, r7, #0
	mov r3, #0
	bl BgSetPosTextAndCommit
	ldr r0, [r5, #0xc]
	add r1, r4, #5
	lsl r1, r1, #0x18
	ldr r0, [r0, #0x74]
	lsr r1, r1, #0x18
	bl ScheduleBgTilemapBufferTransfer
	add r4, r4, #1
	cmp r4, #3
	blt _021F5270
_021F52B0:
	ldr r0, _021F52F8 ; =0x04001000
	ldr r1, _021F52FC ; =0xFFFF1FFF
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
	ldr r1, _021F5300 ; =0xFFFFC0FF
	and r1, r3
	strh r1, [r4]
	ldrh r1, [r0]
	bic r1, r2
	strh r1, [r0]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021F52F4: .word 0xFFFF8000
_021F52F8: .word 0x04001000
_021F52FC: .word 0xFFFF1FFF
_021F5300: .word 0xFFFFC0FF
	thumb_func_end ov101_021F51C0

	thumb_func_start ov101_021F5304
ov101_021F5304: ; 0x021F5304
	push {r3, r4, r5, r6, r7, lr}
	ldr r1, _021F545C ; =gSystem
	mov r4, #0
	ldr r2, [r1, #0x48]
	mov r3, #2
	add r5, r0, #0
	add r6, r4, #0
	tst r3, r2
	beq _021F5344
	ldr r0, [r5, #0xc]
	mov r2, #1
	strb r2, [r0, #6]
	ldr r0, [r5, #0xc]
	add r1, r4, #0
	ldr r0, [r0, #0x7c]
	bl ov100_021E7128
	ldr r0, [r5, #0xc]
	bl ov100_021E5DC8
	add r2, r0, #0
	ldr r0, [r5, #0xc]
	add r1, r4, #0
	ldr r0, [r0, #0x7c]
	bl ov100_021E72F8
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	sub r0, r4, #1
	pop {r3, r4, r5, r6, r7, pc}
_021F5344:
	mov r3, #1
	tst r2, r3
	beq _021F53A4
	add r1, r5, #0
	add r1, #0x24
	ldrb r1, [r1]
	mov r3, #0xe0
	lsl r1, r1, #0x18
	lsr r2, r1, #0x1d
	add r1, r5, #0
	add r1, #0x24
	ldrb r1, [r1]
	bic r1, r3
	add r3, r2, #1
	lsr r6, r3, #0x1f
	lsl r4, r3, #0x1e
	sub r4, r4, r6
	mov r3, #0x1e
	ror r4, r3
	add r3, r6, r4
	lsl r3, r3, #0x18
	lsr r3, r3, #0x18
	lsl r3, r3, #0x1d
	lsr r3, r3, #0x18
	orr r3, r1
	add r1, r5, #0
	add r1, #0x24
	strb r3, [r1]
	add r1, r5, #0
	add r1, #0x24
	ldrb r1, [r1]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x1d
	bl ov101_021F4F34
	add r0, r5, #0
	add r5, #0x24
	ldrb r1, [r5]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x1d
	bl ov101_021F5780
	ldr r0, _021F5460 ; =0x0000093F
	bl PlaySE
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_021F53A4:
	ldr r0, [r1, #0x44]
	mov r1, #0x20
	add r2, r0, #0
	tst r2, r1
	beq _021F53B2
	add r4, r1, #0
	sub r4, #0x22
_021F53B2:
	mov r1, #0x10
	tst r1, r0
	beq _021F53BA
	mov r4, #2
_021F53BA:
	mov r1, #0x40
	add r2, r0, #0
	tst r2, r1
	beq _021F53C6
	add r6, r1, #0
	sub r6, #0x42
_021F53C6:
	mov r1, #0x80
	tst r0, r1
	beq _021F53CE
	mov r6, #2
_021F53CE:
	cmp r4, #0
	bne _021F53DC
	cmp r6, #0
	bne _021F53DC
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_021F53DC:
	mov r0, #0x28
	ldrsh r7, [r5, r0]
	mov r0, #0x2a
	ldrsh r0, [r5, r0]
	add r1, r7, r4
	str r0, [sp]
	ldr r0, _021F5464 ; =ov101_021F8968
	ldr r2, [sp]
	bl sub_020253F0
	cmp r0, #0
	beq _021F53FC
	mov r0, #0x28
	ldrsh r0, [r5, r0]
	add r0, r0, r4
	strh r0, [r5, #0x28]
_021F53FC:
	mov r2, #0x2a
	mov r1, #0x28
	ldrsh r2, [r5, r2]
	ldrsh r1, [r5, r1]
	ldr r0, _021F5464 ; =ov101_021F8968
	add r2, r2, r6
	bl sub_020253F0
	cmp r0, #0
	beq _021F5418
	mov r0, #0x2a
	ldrsh r0, [r5, r0]
	add r0, r0, r6
	strh r0, [r5, #0x2a]
_021F5418:
	mov r0, #0x28
	ldrsh r1, [r5, r0]
	cmp r1, r7
	bne _021F542A
	mov r0, #0x2a
	ldrsh r2, [r5, r0]
	ldr r0, [sp]
	cmp r2, r0
	beq _021F5434
_021F542A:
	mov r2, #0x2a
	ldrsh r2, [r5, r2]
	ldr r0, [r5, #0x20]
	bl sub_0200DD88
_021F5434:
	add r2, r5, #0
	add r2, #0x24
	ldrb r2, [r2]
	add r0, r5, #0
	mov r1, #4
	lsl r2, r2, #0x18
	lsr r2, r2, #0x1d
	bl ov101_021F4F34
	mov r1, #0x28
	mov r2, #0x2a
	ldrsh r1, [r5, r1]
	ldrsh r2, [r5, r2]
	add r0, r5, #0
	bl ov101_021F56B4
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F545C: .word gSystem
_021F5460: .word 0x0000093F
_021F5464: .word ov101_021F8968
	thumb_func_end ov101_021F5304

	thumb_func_start ov101_021F5468
ov101_021F5468: ; 0x021F5468
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r2, #0
	str r2, [r4]
	add r2, r5, #0
	add r2, #0x24
	ldrb r2, [r2]
	lsl r2, r2, #0x1b
	lsr r2, r2, #0x1c
	beq _021F5488
	mov r1, #1
	str r1, [r4]
	bl ov101_021F5650
	pop {r4, r5, r6, pc}
_021F5488:
	bl ov101_021F5524
	add r6, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _021F54A8
	ldr r0, [r5, #0xc]
	mov r1, #1
	str r1, [r0, #0xc]
	ldr r0, [r5, #0xc]
	ldrb r0, [r0, #6]
	cmp r0, #1
	bne _021F54A8
	add r0, r5, #0
	bl ov101_021F4FDC
_021F54A8:
	add r0, r6, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov101_021F5468

	thumb_func_start ov101_021F54AC
ov101_021F54AC: ; 0x021F54AC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x26
	ldrb r0, [r0]
	add r4, r3, #0
	lsl r0, r0, #0x1c
	lsr r3, r0, #0x1a
	ldr r0, _021F5520 ; =ov101_021FB2D0
	ldr r0, [r0, r3]
	bl sub_0202539C
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _021F54D6
	mov r2, #0xff
	cmp r4, #0
	beq _021F551A
	mov r0, #0
	strb r0, [r4]
	b _021F551A
_021F54D6:
	add r5, #0x26
	ldrb r1, [r5]
	lsl r1, r1, #0x1c
	lsr r1, r1, #0x1c
	cmp r1, #6
	bhi _021F550A
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021F54EE: ; jump table
	.short _021F54FC - _021F54EE - 2 ; case 0
	.short _021F54FC - _021F54EE - 2 ; case 1
	.short _021F54FC - _021F54EE - 2 ; case 2
	.short _021F54FC - _021F54EE - 2 ; case 3
	.short _021F550A - _021F54EE - 2 ; case 4
	.short _021F5502 - _021F54EE - 2 ; case 5
	.short _021F5506 - _021F54EE - 2 ; case 6
_021F54FC:
	lsl r1, r0, #0x17
	lsr r2, r1, #0x18
	b _021F550C
_021F5502:
	mov r2, #6
	b _021F550C
_021F5506:
	mov r2, #7
	b _021F550C
_021F550A:
	mov r2, #5
_021F550C:
	cmp r4, #0
	beq _021F551A
	mov r1, #1
	and r1, r0
	mov r0, #2
	sub r0, r0, r1
	strb r0, [r4]
_021F551A:
	add r0, r2, #0
	pop {r3, r4, r5, pc}
	nop
_021F5520: .word ov101_021FB2D0
	thumb_func_end ov101_021F54AC

	thumb_func_start ov101_021F5524
ov101_021F5524: ; 0x021F5524
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	add r4, r1, #0
	bl System_GetTouchNew
	cmp r0, #0
	bne _021F553C
	mov r0, #0
	add sp, #4
	mvn r0, r0
	pop {r3, r4, r5, r6, pc}
_021F553C:
	ldr r0, [r5, #0xc]
	bl ov100_021E5924
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _021F5552
	mov r1, #1
	add sp, #4
	str r1, [r4]
	pop {r3, r4, r5, r6, pc}
_021F5552:
	ldr r0, _021F5640 ; =ov101_021F8984
	bl sub_02025224
	add r6, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r6, r0
	beq _021F55A8
	add r2, r5, #0
	add r2, #0x24
	ldrb r2, [r2]
	lsl r1, r6, #0x18
	add r0, r5, #0
	lsl r2, r2, #0x18
	lsr r1, r1, #0x18
	lsr r2, r2, #0x1d
	bl ov101_021F4F34
	lsl r1, r6, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl ov101_021F5780
	ldr r0, _021F5644 ; =0x0000093F
	bl PlaySE
	add r0, r5, #0
	add r0, #0x24
	ldrb r0, [r0]
	mov r1, #0xe0
	add r5, #0x24
	bic r0, r1
	lsl r1, r6, #0x18
	lsr r1, r1, #0x18
	lsl r1, r1, #0x1d
	lsr r1, r1, #0x18
	orr r0, r1
	strb r0, [r5]
	mov r0, #1
	str r0, [r4]
	add sp, #4
	sub r0, r0, #2
	pop {r3, r4, r5, r6, pc}
_021F55A8:
	ldr r2, _021F5648 ; =gSystem + 0x40
	ldr r0, _021F564C ; =ov101_021F8968
	ldrh r1, [r2, #0x20]
	ldrh r2, [r2, #0x22]
	bl sub_020253F0
	cmp r0, #0
	bne _021F55C0
	mov r0, #0
	add sp, #4
	mvn r0, r0
	pop {r3, r4, r5, r6, pc}
_021F55C0:
	mov r0, #0xfe
	add r1, sp, #0
	strb r0, [r1]
	mov r0, #8
	strb r0, [r1, #3]
	mov r0, #0x28
	ldrsh r0, [r5, r0]
	ldr r2, _021F5648 ; =gSystem + 0x40
	strb r0, [r1, #1]
	mov r0, #0x2a
	ldrsh r0, [r5, r0]
	strb r0, [r1, #2]
	ldrh r1, [r2, #0x20]
	ldrh r2, [r2, #0x22]
	add r0, sp, #0
	bl sub_020253F0
	cmp r0, #0
	beq _021F5636
	ldr r0, _021F5648 ; =gSystem + 0x40
	mov r2, #0x2a
	ldrh r1, [r0, #0x20]
	strh r1, [r5, #0x28]
	ldrh r0, [r0, #0x22]
	mov r1, #0x28
	strh r0, [r5, #0x2a]
	ldrsh r1, [r5, r1]
	ldrsh r2, [r5, r2]
	ldr r0, [r5, #0x20]
	bl sub_0200DD88
	add r0, r5, #0
	add r0, #0x24
	ldrb r1, [r0]
	mov r0, #0x1e
	add r2, r5, #0
	bic r1, r0
	mov r0, #2
	orr r1, r0
	add r0, r5, #0
	add r0, #0x24
	strb r1, [r0]
	mov r0, #1
	str r0, [r4]
	add r2, #0x24
	ldrb r2, [r2]
	add r0, r5, #0
	mov r1, #4
	lsl r2, r2, #0x18
	lsr r2, r2, #0x1d
	bl ov101_021F4F34
	mov r1, #0x28
	mov r2, #0x2a
	ldrsh r1, [r5, r1]
	ldrsh r2, [r5, r2]
	add r0, r5, #0
	bl ov101_021F56B4
_021F5636:
	mov r0, #0
	mvn r0, r0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_021F5640: .word ov101_021F8984
_021F5644: .word 0x0000093F
_021F5648: .word gSystem + 0x40
_021F564C: .word ov101_021F8968
	thumb_func_end ov101_021F5524

	thumb_func_start ov101_021F5650
ov101_021F5650: ; 0x021F5650
	push {r4, lr}
	add r4, r0, #0
	bl System_GetTouchHeld
	cmp r0, #0
	bne _021F5670
	add r0, r4, #0
	add r0, #0x24
	ldrb r1, [r0]
	mov r0, #0x1e
	add r4, #0x24
	bic r1, r0
	mov r0, #0
	strb r1, [r4]
	mvn r0, r0
	pop {r4, pc}
_021F5670:
	ldr r2, _021F56AC ; =gSystem + 0x40
	ldr r0, _021F56B0 ; =ov101_021F8968
	ldrh r1, [r2, #0x20]
	ldrh r2, [r2, #0x22]
	bl sub_020253F0
	cmp r0, #0
	beq _021F56A6
	ldr r0, _021F56AC ; =gSystem + 0x40
	mov r2, #0x2a
	ldrh r1, [r0, #0x20]
	strh r1, [r4, #0x28]
	ldrh r0, [r0, #0x22]
	mov r1, #0x28
	strh r0, [r4, #0x2a]
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x20]
	bl sub_0200DD88
	mov r1, #0x28
	mov r2, #0x2a
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	add r0, r4, #0
	bl ov101_021F56B4
_021F56A6:
	mov r0, #0
	mvn r0, r0
	pop {r4, pc}
	.balign 4, 0
_021F56AC: .word gSystem + 0x40
_021F56B0: .word ov101_021F8968
	thumb_func_end ov101_021F5650

	thumb_func_start ov101_021F56B4
ov101_021F56B4: ; 0x021F56B4
	push {r3, r4, r5, lr}
	mov r4, #0
	add r3, sp, #0
	strb r4, [r3]
	add r3, sp, #0
	add r5, r0, #0
	bl ov101_021F54AC
	add r4, r0, #0
	cmp r4, #0xff
	bne _021F5700
	add r0, r5, #0
	add r0, #0x26
	ldrb r0, [r0]
	lsl r0, r0, #0x1a
	lsr r0, r0, #0x1e
	beq _021F56E6
	add r0, r5, #0
	bl ov101_021F5048
	bl GF_GetCurrentPlayingBGM
	mov r1, #0
	bl StopBGM
_021F56E6:
	add r0, r5, #0
	add r0, #0x26
	ldrb r1, [r0]
	mov r0, #0x30
	bic r1, r0
	add r0, r5, #0
	add r0, #0x26
	strb r1, [r0]
	mov r0, #0xff
	add r5, #0x27
	strb r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F5700:
	add r0, r5, #0
	add r0, #0x27
	ldrb r0, [r0]
	cmp r4, r0
	bne _021F574C
	add r0, sp, #0
	ldrb r1, [r0]
	add r0, r5, #0
	add r0, #0x26
	ldrb r0, [r0]
	lsl r0, r0, #0x1a
	lsr r0, r0, #0x1e
	cmp r1, r0
	beq _021F5748
	cmp r1, #2
	ldr r0, [r5, #0x60]
	bne _021F572A
	mov r1, #0
	bl ov101_021F5A9C
	b _021F5730
_021F572A:
	mov r1, #1
	bl ov101_021F5A9C
_021F5730:
	add r0, r5, #0
	add r0, #0x26
	ldrb r1, [r0]
	mov r0, #0x30
	add r5, #0x26
	bic r1, r0
	add r0, sp, #0
	ldrb r0, [r0]
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1a
	orr r0, r1
	strb r0, [r5]
_021F5748:
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F574C:
	cmp r0, #0xff
	beq _021F5756
	add r0, r5, #0
	bl ov101_021F5048
_021F5756:
	add r0, r5, #0
	add r0, #0x27
	strb r4, [r0]
	add r0, r5, #0
	add r0, #0x26
	ldrb r1, [r0]
	mov r0, #0x30
	bic r1, r0
	add r0, sp, #0
	ldrb r0, [r0]
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1a
	orr r1, r0
	add r0, r5, #0
	add r0, #0x26
	strb r1, [r0]
	add r0, r5, #0
	bl ov101_021F5000
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov101_021F56B4

	thumb_func_start ov101_021F5780
ov101_021F5780: ; 0x021F5780
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021F57B0 ; =ov101_021F89B4 + 1
	lsl r1, r1, #3
	ldrb r0, [r0, r1]
	mov r2, #0x2a
	strh r0, [r4, #0x28]
	ldr r0, _021F57B4 ; =ov101_021F89B4 + 2
	ldrb r0, [r0, r1]
	mov r1, #0x28
	strh r0, [r4, #0x2a]
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x20]
	bl sub_0200DD88
	mov r1, #0x28
	mov r2, #0x2a
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	add r0, r4, #0
	bl ov101_021F56B4
	pop {r4, pc}
	.balign 4, 0
_021F57B0: .word ov101_021F89B4 + 1
_021F57B4: .word ov101_021F89B4 + 2
	thumb_func_end ov101_021F5780

	thumb_func_start ov101_021F57B8
ov101_021F57B8: ; 0x021F57B8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r6, r1, #0
	add r7, r2, #0
	str r3, [sp]
	bl Save_FlyPoints_get
	add r4, r0, #0
	bl SaveFlyPoints_GetPlayerSub
	str r0, [sp, #4]
	add r0, r4, #0
	bl FlyPoints_GetMusicIdAddr
	str r0, [sp, #8]
	ldr r0, [sp, #0x30]
	mov r1, #0x74
	bl AllocFromHeap
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x74
	bl MI_CpuFill8
	str r5, [r4, #4]
	strh r6, [r4, #8]
	add r0, r4, #0
	strh r7, [r4, #0xa]
	add r0, #0x66
	ldrb r0, [r0]
	mov r1, #4
	ldr r3, [sp, #0x30]
	bic r0, r1
	ldr r1, [sp]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	lsl r1, r1, #0x1f
	lsr r1, r1, #0x1d
	orr r1, r0
	add r0, r4, #0
	add r0, #0x66
	strb r1, [r0]
	ldr r0, [sp, #0x20]
	str r0, [r4, #0xc]
	ldr r0, [sp, #0x24]
	str r0, [r4, #0x10]
	ldr r0, [sp, #0x28]
	str r0, [r4, #0x14]
	ldr r0, [sp, #0x2c]
	str r0, [r4, #0x18]
	lsr r1, r0, #0x10
	add r0, r4, #0
	add r0, #0x5b
	strb r1, [r0]
	ldr r0, [r4, #0x18]
	lsr r1, r0, #8
	add r0, r4, #0
	add r0, #0x5d
	strb r1, [r0]
	add r0, r4, #0
	ldr r1, [r4, #0x18]
	add r0, #0x5c
	strb r1, [r0]
	mov r1, #0x1b
	add r2, r1, #0
	str r3, [r4]
	mov r0, #0
	add r2, #0xf2
	bl NewMsgDataFromNarc
	str r0, [r4, #0x20]
	ldr r2, [r4]
	mov r0, #8
	mov r1, #0x33
	bl ScrStrBufs_new_custom
	str r0, [r4, #0x44]
	ldr r1, [r4]
	mov r0, #0x33
	bl String_ctor
	str r0, [r4, #0x48]
	ldr r1, [r4]
	mov r0, #0x33
	bl String_ctor
	str r0, [r4, #0x4c]
	ldr r1, [r4]
	mov r0, #0x33
	bl String_ctor
	str r0, [r4, #0x50]
	ldr r0, _021F589C ; =0x00000547
	ldr r1, [r4]
	bl String_ctor
	str r0, [r4, #0x6c]
	ldr r0, _021F589C ; =0x00000547
	ldr r1, [r4]
	bl String_ctor
	str r0, [r4, #0x70]
	ldr r0, [sp, #4]
	bl sub_0205C7EC
	cmp r0, #1
	beq _021F5896
	ldr r0, [sp, #8]
	mov r1, #0
	strh r1, [r0]
_021F5896:
	add r0, r4, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021F589C: .word 0x00000547
	thumb_func_end ov101_021F57B8

	thumb_func_start ov101_021F58A0
ov101_021F58A0: ; 0x021F58A0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x70]
	bl String_dtor
	ldr r0, [r4, #0x6c]
	bl String_dtor
	ldr r0, [r4, #0x50]
	bl String_dtor
	ldr r0, [r4, #0x4c]
	bl String_dtor
	ldr r0, [r4, #0x48]
	bl String_dtor
	ldr r0, [r4, #0x44]
	bl ScrStrBufs_delete
	ldr r0, [r4, #0x20]
	bl DestroyMsgData
	add r0, r4, #0
	mov r1, #0
	mov r2, #0x74
	bl MI_CpuFill8
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end ov101_021F58A0

	thumb_func_start ov101_021F58E0
ov101_021F58E0: ; 0x021F58E0
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r0, #0
	cmp r5, #8
	blt _021F58EC
	mov r5, #0
_021F58EC:
	add r0, r4, #0
	add r0, #0x66
	ldrb r0, [r0]
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x1f
	beq _021F590A
	add r0, r4, #0
	add r0, #0x66
	ldrb r1, [r0]
	mov r0, #0x10
	add r4, #0x66
	bic r1, r0
	strb r1, [r4]
	mov r0, #0xb
	pop {r3, r4, r5, pc}
_021F590A:
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0x28
	add r1, #0x38
	bl GF_RTC_CopyDateTime
	cmp r5, #7
	bhi _021F596C
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021F5926: ; jump table
	.short _021F5936 - _021F5926 - 2 ; case 0
	.short _021F593A - _021F5926 - 2 ; case 1
	.short _021F593E - _021F5926 - 2 ; case 2
	.short _021F594C - _021F5926 - 2 ; case 3
	.short _021F595C - _021F5926 - 2 ; case 4
	.short _021F5960 - _021F5926 - 2 ; case 5
	.short _021F5964 - _021F5926 - 2 ; case 6
	.short _021F5968 - _021F5926 - 2 ; case 7
_021F5936:
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F593A:
	mov r0, #1
	pop {r3, r4, r5, pc}
_021F593E:
	ldr r1, [r4, #0x38]
	mov r0, #1
	and r0, r1
	add r0, r0, #5
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r3, r4, r5, pc}
_021F594C:
	ldr r0, [r4, #0x38]
	mov r1, #3
	bl _u32_div_f
	add r0, r1, #2
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r3, r4, r5, pc}
_021F595C:
	mov r0, #7
	pop {r3, r4, r5, pc}
_021F5960:
	mov r0, #8
	pop {r3, r4, r5, pc}
_021F5964:
	mov r0, #9
	pop {r3, r4, r5, pc}
_021F5968:
	mov r0, #0xa
	pop {r3, r4, r5, pc}
_021F596C:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov101_021F58E0

	thumb_func_start ov101_021F5970
ov101_021F5970: ; 0x021F5970
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x66
	add r4, r2, #0
	ldrb r2, [r0]
	mov r0, #1
	bic r2, r0
	add r0, r5, #0
	add r0, #0x66
	strb r2, [r0]
	cmp r1, #8
	blt _021F598A
	mov r1, #0
_021F598A:
	add r0, r5, #0
	add r0, #0x58
	strb r1, [r0]
	add r0, r5, #0
	add r0, #0x59
	ldrb r2, [r0]
	cmp r2, #0xb
	beq _021F59A0
	add r0, r5, #0
	add r0, #0x5a
	strb r2, [r0]
_021F59A0:
	add r0, r5, #0
	bl ov101_021F58E0
	add r1, r5, #0
	add r1, #0x59
	strb r0, [r1]
	add r0, r5, #0
	mov r1, #0
	add r0, #0x5e
	strb r1, [r0]
	add r0, r5, #0
	mov r2, #0x2d
	add r0, #0x68
	strb r2, [r0]
	add r0, r5, #0
	add r0, #0x67
	strb r1, [r0]
	add r0, r5, #0
	mov r2, #8
	add r0, #0x6a
	strb r2, [r0]
	add r0, r5, #0
	add r0, #0x69
	strb r1, [r0]
	add r0, r5, #0
	add r0, #0x66
	ldrb r0, [r0]
	mov r2, #2
	bic r0, r2
	lsl r2, r4, #0x18
	lsr r2, r2, #0x18
	lsl r2, r2, #0x1f
	lsr r2, r2, #0x1e
	orr r2, r0
	add r0, r5, #0
	add r0, #0x66
	strb r2, [r0]
	add r0, r5, #0
	add r0, #0x66
	ldrb r2, [r0]
	mov r0, #8
	bic r2, r0
	add r0, r5, #0
	add r0, #0x66
	strb r2, [r0]
	add r0, r5, #0
	add r0, #0x5f
	strb r1, [r0]
	add r0, r5, #0
	add r0, #0x59
	ldrb r2, [r0]
	cmp r2, #0xb
	beq _021F5A16
	add r0, r5, #0
	add r0, #0x5a
	ldrb r0, [r0]
	cmp r0, r2
	beq _021F5A16
	str r1, [r5, #0x54]
_021F5A16:
	add r0, r5, #0
	add r0, #0x5c
	ldrb r2, [r0]
	ldr r0, [r5, #0xc]
	lsl r1, r2, #4
	orr r1, r2
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl FillWindowPixelBuffer
	ldr r0, [r5, #0xc]
	bl CopyWindowToVram
	add r1, r5, #0
	add r1, #0x59
	ldrb r2, [r1]
	mov r1, #0xc
	add r0, r5, #0
	add r3, r2, #0
	mul r3, r1
	ldr r1, _021F5A4C ; =ov101_021F8A04
	ldr r1, [r1, r3]
	blx r1
	add r0, r5, #0
	bl ov101_021F5C44
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021F5A4C: .word ov101_021F8A04
	thumb_func_end ov101_021F5970

	thumb_func_start ov101_021F5A50
ov101_021F5A50: ; 0x021F5A50
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0x1c]
	cmp r1, #0
	beq _021F5A6C
	add r1, r4, #0
	add r1, #0x59
	ldrb r2, [r1]
	mov r1, #0xc
	add r3, r2, #0
	mul r3, r1
	ldr r1, _021F5A98 ; =ov101_021F8A04 + 8
	ldr r1, [r1, r3]
	blx r1
_021F5A6C:
	add r0, r4, #0
	add r0, #0x5c
	ldrb r2, [r0]
	ldr r0, [r4, #0xc]
	lsl r1, r2, #4
	orr r1, r2
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl FillWindowPixelBuffer
	ldr r0, [r4, #0xc]
	bl CopyWindowToVram
	add r0, r4, #0
	add r0, #0x66
	ldrb r1, [r0]
	mov r0, #0x10
	add r4, #0x66
	bic r1, r0
	strb r1, [r4]
	pop {r4, pc}
	nop
_021F5A98: .word ov101_021F8A04 + 8
	thumb_func_end ov101_021F5A50

	thumb_func_start ov101_021F5A9C
ov101_021F5A9C: ; 0x021F5A9C
	add r2, r0, #0
	add r2, #0x66
	ldrb r3, [r2]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	mov r2, #2
	lsl r1, r1, #0x1f
	bic r3, r2
	lsr r1, r1, #0x1e
	orr r1, r3
	add r0, #0x66
	strb r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end ov101_021F5A9C

	thumb_func_start ov101_021F5AB8
ov101_021F5AB8: ; 0x021F5AB8
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x67
	ldrb r1, [r0]
	add r0, r4, #0
	add r0, #0x68
	ldrb r0, [r0]
	cmp r1, r0
	bhs _021F5ADA
	add r0, r4, #0
	add r0, #0x67
	ldrb r0, [r0]
	add r4, #0x67
	add r0, r0, #1
	strb r0, [r4]
	mov r0, #0
	pop {r4, pc}
_021F5ADA:
	add r0, r4, #0
	add r0, #0x69
	ldrb r0, [r0]
	cmp r0, #0
	beq _021F5AF6
	mov r1, #0
	ldr r0, [r4, #0xc]
	mov r2, #2
	add r3, r1, #0
	bl ScrollWindow
	ldr r0, [r4, #0xc]
	bl CopyWindowToVram
_021F5AF6:
	add r0, r4, #0
	add r0, #0x69
	ldrb r2, [r0]
	add r0, r4, #0
	add r0, #0x69
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x69
	strb r1, [r0]
	cmp r2, #8
	bhs _021F5B12
	mov r0, #0
	pop {r4, pc}
_021F5B12:
	add r0, r4, #0
	mov r1, #0
	add r0, #0x69
	strb r1, [r0]
	add r4, #0x67
	strb r1, [r4]
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov101_021F5AB8

	thumb_func_start ov101_021F5B24
ov101_021F5B24: ; 0x021F5B24
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0
	ldr r0, [r4, #0xc]
	mov r2, #2
	add r3, r1, #0
	bl ScrollWindow
	ldr r0, [r4, #0xc]
	bl CopyWindowToVram
	add r0, r4, #0
	add r0, #0x69
	ldrb r2, [r0]
	add r0, r4, #0
	add r0, #0x69
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x69
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x6a
	ldrb r0, [r0]
	cmp r2, r0
	bhs _021F5B5C
	mov r0, #0
	pop {r4, pc}
_021F5B5C:
	mov r0, #0
	add r4, #0x69
	strb r0, [r4]
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov101_021F5B24

	thumb_func_start ov101_021F5B68
ov101_021F5B68: ; 0x021F5B68
	add r1, r0, #0
	add r1, #0x67
	ldrb r3, [r1]
	add r1, r0, #0
	add r1, #0x67
	ldrb r1, [r1]
	add r2, r1, #1
	add r1, r0, #0
	add r1, #0x67
	strb r2, [r1]
	add r1, r0, #0
	add r1, #0x68
	ldrb r1, [r1]
	cmp r3, r1
	bhs _021F5B8A
	mov r0, #0
	bx lr
_021F5B8A:
	mov r1, #0
	add r0, #0x67
	strb r1, [r0]
	mov r0, #1
	bx lr
	thumb_func_end ov101_021F5B68

	thumb_func_start ov101_021F5B94
ov101_021F5B94: ; 0x021F5B94
	push {r4, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x5e
	ldrb r1, [r1]
	cmp r1, #3
	bhi _021F5C38
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021F5BAE: ; jump table
	.short _021F5BB6 - _021F5BAE - 2 ; case 0
	.short _021F5BCE - _021F5BAE - 2 ; case 1
	.short _021F5BFE - _021F5BAE - 2 ; case 2
	.short _021F5C14 - _021F5BAE - 2 ; case 3
_021F5BB6:
	add r1, r4, #0
	add r1, #0x59
	ldrb r2, [r1]
	mov r1, #0xc
	add r3, r2, #0
	mul r3, r1
	ldr r1, _021F5C3C ; =ov101_021F8A04 + 4
	ldr r1, [r1, r3]
	blx r1
	add r4, #0x5e
	strb r0, [r4]
	pop {r4, pc}
_021F5BCE:
	add r1, r4, #0
	add r1, #0x59
	ldrb r2, [r1]
	mov r1, #0xc
	add r3, r2, #0
	mul r3, r1
	ldr r1, _021F5C40 ; =ov101_021F8A04 + 8
	ldr r1, [r1, r3]
	blx r1
	add r0, r4, #0
	mov r1, #0x10
	add r0, #0x6a
	strb r1, [r0]
	add r0, r4, #0
	mov r1, #0xf
	add r0, #0x68
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x5e
	ldrb r0, [r0]
	add r4, #0x5e
	add r0, r0, #1
	strb r0, [r4]
	pop {r4, pc}
_021F5BFE:
	bl ov101_021F5B24
	cmp r0, #0
	beq _021F5C38
	add r0, r4, #0
	add r0, #0x5e
	ldrb r0, [r0]
	add r4, #0x5e
	add r0, r0, #1
	strb r0, [r4]
	pop {r4, pc}
_021F5C14:
	bl ov101_021F5B68
	cmp r0, #0
	beq _021F5C38
	add r2, r4, #0
	add r2, #0x66
	add r1, r4, #0
	ldrb r2, [r2]
	add r1, #0x58
	ldrb r1, [r1]
	lsl r2, r2, #0x1e
	add r0, r4, #0
	lsr r2, r2, #0x1f
	bl ov101_021F5970
	mov r0, #0
	add r4, #0x5e
	strb r0, [r4]
_021F5C38:
	pop {r4, pc}
	nop
_021F5C3C: .word ov101_021F8A04 + 4
_021F5C40: .word ov101_021F8A04 + 8
	thumb_func_end ov101_021F5B94

	thumb_func_start ov101_021F5C44
ov101_021F5C44: ; 0x021F5C44
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	ldr r0, [r4, #0x10]
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [r4, #0x14]
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021F5C9C ; =0x00010200
	add r3, r1, #0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, [r4, #0x10]
	ldr r2, [r4, #0x4c]
	bl AddTextPrinterParameterized2
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021F5C9C ; =0x00010200
	add r3, r1, #0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x50]
	bl AddTextPrinterParameterized2
	ldr r0, [r4, #0x10]
	bl ScheduleWindowCopyToVram
	ldr r0, [r4, #0x14]
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r4, pc}
	nop
_021F5C9C: .word 0x00010200
	thumb_func_end ov101_021F5C44

	thumb_func_start PrintRadioLine
PrintRadioLine: ; 0x021F5CA0
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r0, #0x66
	ldrb r0, [r0]
	add r4, r1, #0
	add r6, r2, #0
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _021F5CBE
	add r0, r4, #0
	mov r1, #0x46
	bl String_RadioAddStatic
_021F5CBE:
	lsl r0, r6, #4
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, [r5, #0x18]
	mov r1, #0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, [r5, #0xc]
	add r2, r4, #0
	add r3, r1, #0
	bl AddTextPrinterParameterized2
	add sp, #0x10
	pop {r4, r5, r6, pc}
	thumb_func_end PrintRadioLine

	thumb_func_start RadioPrintAdvance
RadioPrintAdvance: ; 0x021F5CDC
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x66
	ldrb r0, [r0]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	bne _021F5CFE
	add r0, r4, #0
	add r0, #0x66
	ldrb r1, [r0]
	mov r0, #1
	bic r1, r0
	mov r0, #1
	orr r1, r0
	add r0, r4, #0
	add r0, #0x66
	strb r1, [r0]
_021F5CFE:
	add r0, r4, #0
	add r0, #0x62
	ldrb r2, [r0]
	add r0, r4, #0
	add r0, #0x62
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x62
	strb r1, [r0]
	ldr r0, [r4, #0x48]
	ldr r1, [r4, #0x6c]
	bl StringGetLineN
	ldr r1, [r4, #0x48]
	add r0, r4, #0
	mov r2, #1
	bl PrintRadioLine
	ldr r0, [r4, #0xc]
	bl CopyWindowToVram
	add r0, r4, #0
	add r0, #0x62
	add r4, #0x63
	ldrb r1, [r0]
	ldrb r0, [r4]
	cmp r1, r0
	blo _021F5D3C
	mov r0, #1
	pop {r4, pc}
_021F5D3C:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end RadioPrintAdvance

	thumb_func_start RadioPrintInit
RadioPrintInit: ; 0x021F5D40
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x65
	strb r2, [r0]
	ldr r0, [r4, #0x24]
	ldr r2, [r4, #0x70]
	bl ReadMsgDataIntoString
	ldr r0, [r4, #0x44]
	ldr r1, [r4, #0x6c]
	ldr r2, [r4, #0x70]
	bl StringExpandPlaceholders
	add r0, r4, #0
	mov r1, #0
	add r0, #0x62
	strb r1, [r0]
	ldr r0, [r4, #0x6c]
	bl StringCountLines
	add r1, r4, #0
	add r1, #0x63
	strb r0, [r1]
	add r0, r4, #0
	mov r1, #0
	add r0, #0x64
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x62
	ldrb r2, [r0]
	add r0, r4, #0
	add r0, #0x62
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x62
	strb r1, [r0]
	ldr r0, [r4, #0x48]
	ldr r1, [r4, #0x6c]
	bl StringGetLineN
	add r2, r4, #0
	add r2, #0x66
	ldrb r2, [r2]
	ldr r1, [r4, #0x48]
	add r0, r4, #0
	lsl r2, r2, #0x1f
	lsr r2, r2, #0x1f
	bl PrintRadioLine
	ldr r0, [r4, #0xc]
	bl CopyWindowToVram
	add r0, r4, #0
	add r0, #0x62
	ldrb r1, [r0]
	add r0, r4, #0
	add r0, #0x63
	ldrb r0, [r0]
	cmp r1, r0
	blo _021F5DC2
	mov r0, #5
	add r4, #0x64
	strb r0, [r4]
	pop {r4, pc}
_021F5DC2:
	add r0, r4, #0
	add r0, #0x66
	ldrb r0, [r0]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	bne _021F5DD6
	mov r0, #1
	add r4, #0x64
	strb r0, [r4]
	pop {r4, pc}
_021F5DD6:
	mov r0, #3
	add r4, #0x64
	strb r0, [r4]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end RadioPrintInit

	thumb_func_start RadioPrintInitEz
RadioPrintInitEz: ; 0x021F5DE0
	ldr r3, _021F5DE8 ; =RadioPrintInit
	mov r2, #0
	bx r3
	nop
_021F5DE8: .word RadioPrintInit
	thumb_func_end RadioPrintInitEz

	thumb_func_start RadioPrintAndPlayJingle
RadioPrintAndPlayJingle: ; 0x021F5DEC
	push {r4, lr}
	add r4, r0, #0
	bl RadioPrintInitEz
	add r0, r4, #0
	mov r1, #1
	add r0, #0x65
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x66
	ldrb r1, [r0]
	mov r0, #8
	add r4, #0x66
	orr r0, r1
	strb r0, [r4]
	mov r0, #0
	bl SndRadio_StopSeq
	ldr r0, _021F5E18 ; =SEQ_GS_RADIO_JINGLE
	bl SndRadio_StartSeq
	pop {r4, pc}
	.balign 4, 0
_021F5E18: .word SEQ_GS_RADIO_JINGLE
	thumb_func_end RadioPrintAndPlayJingle

	thumb_func_start Radio_RunTextPrinter
Radio_RunTextPrinter: ; 0x021F5E1C
	push {r4, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x64
	ldrb r1, [r1]
	cmp r1, #6
	bhi _021F5EB0
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021F5E36: ; jump table
	.short _021F5EB0 - _021F5E36 - 2 ; case 0
	.short _021F5E7E - _021F5E36 - 2 ; case 1
	.short _021F5E44 - _021F5E36 - 2 ; case 2
	.short _021F5E6E - _021F5E36 - 2 ; case 3
	.short _021F5E8E - _021F5E36 - 2 ; case 4
	.short _021F5E9E - _021F5E36 - 2 ; case 5
	.short _021F5EA6 - _021F5E36 - 2 ; case 6
_021F5E44:
	bl RadioPrintAdvance
	cmp r0, #0
	beq _021F5E66
	add r0, r4, #0
	add r0, #0x65
	ldrb r0, [r0]
	cmp r0, #0
	beq _021F5E5E
	mov r0, #6
	add r4, #0x64
	strb r0, [r4]
	b _021F5EB0
_021F5E5E:
	mov r0, #4
	add r4, #0x64
	strb r0, [r4]
	b _021F5EB0
_021F5E66:
	mov r0, #3
	add r4, #0x64
	strb r0, [r4]
	b _021F5EB0
_021F5E6E:
	bl ov101_021F5AB8
	cmp r0, #0
	beq _021F5EB0
	mov r0, #2
	add r4, #0x64
	strb r0, [r4]
	b _021F5EB0
_021F5E7E:
	bl ov101_021F5B68
	cmp r0, #0
	beq _021F5EB0
	mov r0, #2
	add r4, #0x64
	strb r0, [r4]
	b _021F5EB0
_021F5E8E:
	bl ov101_021F5AB8
	cmp r0, #0
	beq _021F5EB0
	mov r0, #6
	add r4, #0x64
	strb r0, [r4]
	b _021F5EB0
_021F5E9E:
	bl ov101_021F5B68
	cmp r0, #0
	beq _021F5EB0
_021F5EA6:
	mov r0, #0
	add r4, #0x64
	strb r0, [r4]
	mov r0, #1
	pop {r4, pc}
_021F5EB0:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end Radio_RunTextPrinter

	thumb_func_start Radio_RunTextPrinter_WaitJingle
Radio_RunTextPrinter_WaitJingle: ; 0x021F5EB4
	push {r4, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x5f
	ldrb r1, [r1]
	cmp r1, #0
	beq _021F5EC8
	cmp r1, #1
	beq _021F5EDE
	b _021F5EF0
_021F5EC8:
	bl Radio_RunTextPrinter
	cmp r0, #0
	beq _021F5EF0
	add r0, r4, #0
	add r0, #0x5f
	ldrb r0, [r0]
	add r4, #0x5f
	add r0, r0, #1
	strb r0, [r4]
	b _021F5EF0
_021F5EDE:
	bl SndRadio_CountPlayingSeq
	cmp r0, #0
	bne _021F5EF0
	mov r0, #0
	add r4, #0x5f
	strb r0, [r4]
	mov r0, #1
	pop {r4, pc}
_021F5EF0:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end Radio_RunTextPrinter_WaitJingle

	thumb_func_start RadioShow_PokemonMusic_StartPlaying
RadioShow_PokemonMusic_StartPlaying: ; 0x021F5EF4
	push {r4, lr}
	ldr r4, [r0, #0x1c]
	cmp r1, #4
	bne _021F5F1A
	bl LCRandom
	ldr r1, _021F5F34 ; =25000
	bl _s32_div_f
	add r0, r1, #0
	mov r1, #1000>>2
	lsl r1, r1, #2
	bl _s32_div_f
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	lsl r2, r1, #1
	ldr r0, _021F5F38 ; =ov101_021F8A9C
	b _021F5F1E
_021F5F1A:
	ldr r0, _021F5F3C ; =ov101_021F8A94
	lsl r2, r1, #1
_021F5F1E:
	ldrb r3, [r4, #4]
	ldrh r0, [r0, r2]
	mov r2, #0xfe
	lsl r1, r1, #0x19
	bic r3, r2
	lsr r1, r1, #0x18
	orr r1, r3
	strb r1, [r4, #4]
	bl SndRadio_StartSeq
	pop {r4, pc}
	.balign 4, 0
_021F5F34: .word 25000
_021F5F38: .word ov101_021F8A9C
_021F5F3C: .word ov101_021F8A94
	thumb_func_end RadioShow_PokemonMusic_StartPlaying

	thumb_func_start RadioShow_PokemonMusic_setup
RadioShow_PokemonMusic_setup: ; 0x021F5F40
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, [r5]
	mov r1, #0x38
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x38
	add r4, r0, #0
	bl MI_CpuFill8
	ldr r0, [r5, #4]
	bl Sav2_Pokedex_get
	bl Pokedex_GetNatDexFlag
	ldrb r1, [r4, #4]
	mov r2, #1
	lsl r0, r0, #0x18
	bic r1, r2
	lsr r2, r0, #0x18
	mov r0, #1
	and r0, r2
	orr r0, r1
	strb r0, [r4, #4]
	add r0, r4, #0
	add r0, #0xc
	add r1, sp, #0
	bl GF_RTC_CopyDateTime
	ldr r0, [r4, #0x18]
	strb r0, [r4, #6]
	ldrb r0, [r4, #6]
	add r0, r0, #msg_0416_00003
	strb r0, [r4, #5]
	ldrb r0, [r4, #6]
	cmp r0, #6
	bhi _021F6006
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021F5F9A: ; jump table
	.short _021F5FA8 - _021F5F9A - 2 ; case 0
	.short _021F5FCC - _021F5F9A - 2 ; case 1
	.short _021F5FEA - _021F5F9A - 2 ; case 2
	.short _021F5FD2 - _021F5F9A - 2 ; case 3
	.short _021F5FF0 - _021F5F9A - 2 ; case 4
	.short _021F5FCC - _021F5F9A - 2 ; case 5
	.short _021F5FEA - _021F5F9A - 2 ; case 6
_021F5FA8:
	ldr r0, [r5, #4]
	bl Sav2_Bag_get
	ldr r1, _021F603C ; =ITEM_GB_SOUNDS
	ldr r3, [r4]
	mov r2, #1
	bl Bag_HasItem
	cmp r0, #0
	beq _021F5FC2
	mov r0, #4
	strb r0, [r4, #7]
	b _021F6006
_021F5FC2:
	mov r0, #0
	strb r0, [r4, #7]
	mov r0, #msg_0416_00012 ; Sunday March
	strb r0, [r4, #5]
	b _021F6006
_021F5FCC:
	mov r0, #0
	strb r0, [r4, #7]
	b _021F6006
_021F5FD2:
	ldrb r0, [r4, #4]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	beq _021F5FE4
	mov r0, #2
	strb r0, [r4, #7]
	mov r0, #msg_0416_00010 ; Wednesday Hoenn
	strb r0, [r4, #5]
	b _021F6006
_021F5FE4:
	mov r0, #0
	strb r0, [r4, #7]
	b _021F6006
_021F5FEA:
	mov r0, #1
	strb r0, [r4, #7]
	b _021F6006
_021F5FF0:
	ldrb r0, [r4, #4]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	beq _021F6002
	mov r0, #3
	strb r0, [r4, #7]
	mov r0, #msg_0416_00011 ; Thursday Sinnoh
	strb r0, [r4, #5]
	b _021F6006
_021F6002:
	mov r0, #1
	strb r0, [r4, #7]
_021F6006:
	add r0, r5, #0
	str r4, [r5, #0x1c]
	mov r1, #0
	add r0, #0x61
	strb r1, [r0]
	add r0, r5, #0
	bl RadioShow_PokemonMusic_InitGMM
	bl GF_GetCurrentPlayingBGM
	mov r1, #0
	bl StopBGM
	ldrb r1, [r4, #7]
	add r0, r5, #0
	bl RadioShow_PokemonMusic_StartPlaying
	add r0, r5, #0
	add r0, #0x66
	ldrb r1, [r0]
	mov r0, #1
	add r5, #0x66
	bic r1, r0
	strb r1, [r5]
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_021F603C: .word ITEM_GB_SOUNDS
	thumb_func_end RadioShow_PokemonMusic_setup

	thumb_func_start RadioShow_PokemonMusic_teardown
RadioShow_PokemonMusic_teardown: ; 0x021F6040
	push {r4, lr}
	add r4, r0, #0
	bl ov101_021F613C
	ldr r0, [r4, #0x1c]
	mov r1, #0
	mov r2, #0x38
	bl MI_CpuFill8
	ldr r0, [r4, #0x1c]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4, #0x1c]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end RadioShow_PokemonMusic_teardown

	thumb_func_start RadioShow_PokemonMusic_print
RadioShow_PokemonMusic_print: ; 0x021F6060
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r4, [r5, #0x1c]
	ldrb r1, [r4, #8]
	cmp r1, #4
	bhi _021F610E
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021F607A: ; jump table
	.short _021F6084 - _021F607A - 2 ; case 0
	.short _021F6092 - _021F607A - 2 ; case 1
	.short _021F60A2 - _021F607A - 2 ; case 2
	.short _021F60BA - _021F607A - 2 ; case 3
	.short _021F6100 - _021F607A - 2 ; case 4
_021F6084:
	mov r1, #2
	bl RadioPrintInitEz
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _021F610E
_021F6092:
	bl Radio_RunTextPrinter
	cmp r0, #0
	beq _021F610E
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _021F610E
_021F60A2:
	add r0, r4, #0
	add r0, #0x1c
	bl GF_RTC_CopyDate
	ldrb r1, [r4, #5]
	add r0, r5, #0
	bl RadioPrintInitEz
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _021F610E
_021F60BA:
	bl Radio_RunTextPrinter
	cmp r0, #0
	beq _021F610E
	add r0, sp, #0
	bl GF_RTC_CopyDate
	ldr r1, [sp, #8]
	ldr r0, [r4, #0x24]
	cmp r1, r0
	bne _021F60E0
	ldr r0, [r4, #0x14]
	cmp r1, r0
	bne _021F60E0
	mov r0, #2
	strb r0, [r4, #8]
	add sp, #0x10
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F60E0:
	add r0, r5, #0
	add r0, #0x66
	ldrb r1, [r0]
	mov r0, #8
	add r5, #0x66
	orr r0, r1
	strb r0, [r5]
	bl GF_GetCurrentPlayingBGM
	mov r1, #0x1e
	bl StopBGM
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _021F610E
_021F6100:
	bl ov101_021F5AB8
	cmp r0, #0
	beq _021F610E
	add sp, #0x10
	mov r0, #1
	pop {r3, r4, r5, pc}
_021F610E:
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end RadioShow_PokemonMusic_print

	thumb_func_start RadioShow_PokemonMusic_InitGMM
RadioShow_PokemonMusic_InitGMM: ; 0x021F6114
	push {r4, lr}
	add r4, r0, #0
	mov r2, #0x1a
	ldr r3, [r4]
	mov r0, #0
	mov r1, #0x1b
	lsl r2, r2, #4
	bl NewMsgDataFromNarc
	str r0, [r4, #0x24]
	ldr r2, [r4, #0x4c]
	mov r1, #0
	bl ReadMsgDataIntoString
	ldr r0, [r4, #0x24]
	ldr r2, [r4, #0x50]
	mov r1, #1
	bl ReadMsgDataIntoString
	pop {r4, pc}
	thumb_func_end RadioShow_PokemonMusic_InitGMM

	thumb_func_start ov101_021F613C
ov101_021F613C: ; 0x021F613C
	ldr r3, _021F6144 ; =DestroyMsgData
	ldr r0, [r0, #0x24]
	bx r3
	nop
_021F6144: .word DestroyMsgData
	thumb_func_end ov101_021F613C

	thumb_func_start RadioShow_PokeFlute_setup
RadioShow_PokeFlute_setup: ; 0x021F6148
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	mov r1, #4
	bl AllocFromHeap
	mov r1, #0
	mov r2, #4
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r5, #0
	str r4, [r5, #0x1c]
	bl ov101_021F61A4
	bl GF_GetCurrentPlayingBGM
	mov r1, #1
	bl StopBGM
	ldr r0, _021F617C ; =SEQ_GS_HUE
	bl SndRadio_StartSeq
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_021F617C: .word SEQ_GS_HUE
	thumb_func_end RadioShow_PokeFlute_setup

	thumb_func_start RadioShow_PokeFlute_teardown
RadioShow_PokeFlute_teardown: ; 0x021F6180
	push {r4, lr}
	add r4, r0, #0
	bl ov101_021F61CC
	ldr r0, [r4, #0x1c]
	mov r1, #0
	mov r2, #4
	bl MI_CpuFill8
	ldr r0, [r4, #0x1c]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4, #0x1c]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end RadioShow_PokeFlute_teardown

	thumb_func_start RadioShow_PokeFlute_print
RadioShow_PokeFlute_print: ; 0x021F61A0
	mov r0, #0
	bx lr
	thumb_func_end RadioShow_PokeFlute_print

	thumb_func_start ov101_021F61A4
ov101_021F61A4: ; 0x021F61A4
	push {r4, lr}
	add r4, r0, #0
	ldr r2, _021F61C8 ; =0x000001A1
	ldr r3, [r4]
	mov r0, #0
	mov r1, #0x1b
	bl NewMsgDataFromNarc
	str r0, [r4, #0x24]
	ldr r2, [r4, #0x4c]
	mov r1, #0
	bl ReadMsgDataIntoString
	ldr r0, [r4, #0x50]
	bl StringSetEmpty
	pop {r4, pc}
	nop
_021F61C8: .word 0x000001A1
	thumb_func_end ov101_021F61A4

	thumb_func_start ov101_021F61CC
ov101_021F61CC: ; 0x021F61CC
	ldr r3, _021F61D4 ; =DestroyMsgData
	ldr r0, [r0, #0x24]
	bx r3
	nop
_021F61D4: .word DestroyMsgData
	thumb_func_end ov101_021F61CC

	thumb_func_start RadioShow_Unown_setup
RadioShow_Unown_setup: ; 0x021F61D8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	mov r1, #4
	bl AllocFromHeap
	mov r1, #0
	mov r2, #4
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r5, #0
	str r4, [r5, #0x1c]
	bl RadioShow_Unown_init
	bl GF_GetCurrentPlayingBGM
	mov r1, #1
	bl StopBGM
	ldr r0, _021F620C ; =SEQ_GS_RADIO_UNKNOWN
	bl SndRadio_StartSeq
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_021F620C: .word SEQ_GS_RADIO_UNKNOWN
	thumb_func_end RadioShow_Unown_setup

	thumb_func_start RadioShow_Unown_teardown
RadioShow_Unown_teardown: ; 0x021F6210
	push {r4, lr}
	add r4, r0, #0
	bl ov101_021F625C
	ldr r0, [r4, #0x1c]
	mov r1, #0
	mov r2, #4
	bl MI_CpuFill8
	ldr r0, [r4, #0x1c]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4, #0x1c]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end RadioShow_Unown_teardown

	thumb_func_start RadioShow_Unown_print
RadioShow_Unown_print: ; 0x021F6230
	mov r0, #0
	bx lr
	thumb_func_end RadioShow_Unown_print

	thumb_func_start RadioShow_Unown_init
RadioShow_Unown_init: ; 0x021F6234
	push {r4, lr}
	add r4, r0, #0
	ldr r2, _021F6258 ; =0x0000019A
	ldr r3, [r4]
	mov r0, #0
	mov r1, #0x1b
	bl NewMsgDataFromNarc
	str r0, [r4, #0x24]
	ldr r2, [r4, #0x4c]
	mov r1, #0
	bl ReadMsgDataIntoString
	ldr r0, [r4, #0x50]
	bl StringSetEmpty
	pop {r4, pc}
	nop
_021F6258: .word 0x0000019A
	thumb_func_end RadioShow_Unown_init

	thumb_func_start ov101_021F625C
ov101_021F625C: ; 0x021F625C
	ldr r3, _021F6264 ; =DestroyMsgData
	ldr r0, [r0, #0x24]
	bx r3
	nop
_021F6264: .word DestroyMsgData
	thumb_func_end ov101_021F625C

	thumb_func_start RadioShow_TeamRocket_setup
RadioShow_TeamRocket_setup: ; 0x021F6268
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	mov r1, #8
	bl AllocFromHeap
	mov r1, #0
	mov r2, #8
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r5, #0
	str r4, [r5, #0x1c]
	bl RadioShow_TeamRocket_init
	bl GF_GetCurrentPlayingBGM
	mov r1, #1
	bl StopBGM
	mov r0, #0
	strb r0, [r4, #4]
	ldr r0, _021F62A0 ; =SEQ_GS_SENKYO_R
	bl SndRadio_StartSeq
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_021F62A0: .word SEQ_GS_SENKYO_R
	thumb_func_end RadioShow_TeamRocket_setup

	thumb_func_start RadioShow_TeamRocket_teardown
RadioShow_TeamRocket_teardown: ; 0x021F62A4
	push {r4, lr}
	add r4, r0, #0
	bl ov101_021F6320
	ldr r0, [r4, #0x1c]
	mov r1, #0
	mov r2, #8
	bl MI_CpuFill8
	ldr r0, [r4, #0x1c]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4, #0x1c]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end RadioShow_TeamRocket_teardown

	thumb_func_start RadioShow_TeamRocket_print
RadioShow_TeamRocket_print: ; 0x021F62C4
	push {r4, lr}
	ldr r4, [r0, #0x1c]
	ldrb r1, [r4, #4]
	cmp r1, #0
	beq _021F62D4
	cmp r1, #1
	beq _021F62E2
	b _021F62EE
_021F62D4:
	mov r1, #2
	bl RadioPrintInitEz
	ldrb r0, [r4, #4]
	add r0, r0, #1
	strb r0, [r4, #4]
	b _021F62EE
_021F62E2:
	bl Radio_RunTextPrinter
	cmp r0, #0
	beq _021F62EE
	mov r0, #0
	strb r0, [r4, #4]
_021F62EE:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end RadioShow_TeamRocket_print

	thumb_func_start RadioShow_TeamRocket_init
RadioShow_TeamRocket_init: ; 0x021F62F4
	push {r4, lr}
	add r4, r0, #0
	ldr r2, _021F631C ; =0x000001A2
	ldr r3, [r4]
	mov r0, #0
	mov r1, #0x1b
	bl NewMsgDataFromNarc
	str r0, [r4, #0x24]
	ldr r2, [r4, #0x4c]
	mov r1, #0
	bl ReadMsgDataIntoString
	ldr r0, [r4, #0x24]
	ldr r2, [r4, #0x50]
	mov r1, #1
	bl ReadMsgDataIntoString
	pop {r4, pc}
	nop
_021F631C: .word 0x000001A2
	thumb_func_end RadioShow_TeamRocket_init

	thumb_func_start ov101_021F6320
ov101_021F6320: ; 0x021F6320
	ldr r3, _021F6328 ; =DestroyMsgData
	ldr r0, [r0, #0x24]
	bx r3
	nop
_021F6328: .word DestroyMsgData
	thumb_func_end ov101_021F6320

	thumb_func_start RadioShow_SerialRadioDrama_setup
RadioShow_SerialRadioDrama_setup: ; 0x021F632C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	mov r1, #8
	bl AllocFromHeap
	mov r1, #0
	mov r2, #8
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r5, #0
	str r4, [r5, #0x1c]
	bl RadioShow_SerialRadioDrama_init
	bl GF_GetCurrentPlayingBGM
	mov r1, #0
	bl StopBGM
	ldr r0, _021F6360 ; =SEQ_GS_RADIO_VARIETY
	bl SndRadio_StartSeq
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_021F6360: .word SEQ_GS_RADIO_VARIETY
	thumb_func_end RadioShow_SerialRadioDrama_setup

	thumb_func_start RadioShow_SerialRadioDrama_teardown
RadioShow_SerialRadioDrama_teardown: ; 0x021F6364
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0x1c]
	cmp r1, #0
	bne _021F6372
	mov r0, #0
	pop {r4, pc}
_021F6372:
	bl ov101_021F6470
	ldr r0, [r4, #0x1c]
	mov r1, #0
	mov r2, #8
	bl MI_CpuFill8
	ldr r0, [r4, #0x1c]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4, #0x1c]
	pop {r4, pc}
	thumb_func_end RadioShow_SerialRadioDrama_teardown

	thumb_func_start RadioShow_SerialRadioDrama_print
RadioShow_SerialRadioDrama_print: ; 0x021F638C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r4, [r5, #0x1c]
	ldrh r1, [r4, #4]
	cmp r1, #4
	bhi _021F641C
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021F63A4: ; jump table
	.short _021F63AE - _021F63A4 - 2 ; case 0
	.short _021F63BC - _021F63A4 - 2 ; case 1
	.short _021F63DA - _021F63A4 - 2 ; case 2
	.short _021F63EA - _021F63A4 - 2 ; case 3
	.short _021F6402 - _021F63A4 - 2 ; case 4
_021F63AE:
	mov r1, #2
	bl RadioPrintInitEz
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _021F641C
_021F63BC:
	bl Radio_RunTextPrinter
	cmp r0, #0
	beq _021F641C
	ldrh r1, [r4, #6]
	add r0, r5, #0
	add r1, r1, #4
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl RadioPrintInitEz
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _021F641C
_021F63DA:
	bl Radio_RunTextPrinter
	cmp r0, #0
	beq _021F641C
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _021F641C
_021F63EA:
	bl ov101_021F5AB8
	cmp r0, #0
	beq _021F641C
	add r0, r5, #0
	mov r1, #3
	bl RadioPrintAndPlayJingle
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _021F641C
_021F6402:
	bl Radio_RunTextPrinter_WaitJingle
	cmp r0, #0
	beq _021F641C
	add r0, r5, #0
	add r0, #0x66
	ldrb r1, [r0]
	mov r0, #0x10
	add r5, #0x66
	orr r0, r1
	strb r0, [r5]
	mov r0, #1
	pop {r3, r4, r5, pc}
_021F641C:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end RadioShow_SerialRadioDrama_print

	thumb_func_start RadioShow_SerialRadioDrama_init
RadioShow_SerialRadioDrama_init: ; 0x021F6420
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r4, [r5, #0x1c]
	ldr r2, _021F646C ; =0x0000019D
	ldr r3, [r5]
	mov r0, #0
	mov r1, #0x1b
	bl NewMsgDataFromNarc
	str r0, [r5, #0x24]
	ldr r2, [r5, #0x4c]
	mov r1, #0
	bl ReadMsgDataIntoString
	ldr r0, [r5, #0x24]
	ldr r2, [r5, #0x50]
	mov r1, #1
	bl ReadMsgDataIntoString
	bl LCRandom
	mov r1, #0x16
	bl _s32_div_f
	strh r1, [r4, #6]
	ldrh r1, [r4, #6]
	ldr r0, [r5, #0x54]
	cmp r1, r0
	bne _021F6464
	add r0, r1, #1
	mov r1, #0x16
	bl _s32_div_f
	strh r1, [r4, #6]
_021F6464:
	ldrh r0, [r4, #6]
	str r0, [r5, #0x54]
	pop {r3, r4, r5, pc}
	nop
_021F646C: .word 0x0000019D
	thumb_func_end RadioShow_SerialRadioDrama_init

	thumb_func_start ov101_021F6470
ov101_021F6470: ; 0x021F6470
	ldr r3, _021F6478 ; =DestroyMsgData
	ldr r0, [r0, #0x24]
	bx r3
	nop
_021F6478: .word DestroyMsgData
	thumb_func_end ov101_021F6470

	thumb_func_start RadioShow_Commercials_setup
RadioShow_Commercials_setup: ; 0x021F647C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	mov r1, #0x34
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x34
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r5, #0
	add r0, #0x66
	ldrb r1, [r0]
	mov r0, #0x10
	bic r1, r0
	add r0, r5, #0
	add r0, #0x66
	strb r1, [r0]
	add r0, r5, #0
	str r4, [r5, #0x1c]
	bl RadioShow_Commercials_init
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end RadioShow_Commercials_setup

	thumb_func_start RadioShow_Commercials_teardown
RadioShow_Commercials_teardown: ; 0x021F64B0
	push {r4, lr}
	add r4, r0, #0
	bl ov101_021F6614
	ldr r0, [r4, #0x1c]
	mov r1, #0
	mov r2, #0x34
	bl MI_CpuFill8
	ldr r0, [r4, #0x1c]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4, #0x1c]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end RadioShow_Commercials_teardown

	thumb_func_start RadioShow_Commercials_print
RadioShow_Commercials_print: ; 0x021F64D0
	push {r4, lr}
	ldr r4, [r0, #0x1c]
	ldrh r1, [r4, #4]
	cmp r1, #0
	beq _021F64E4
	cmp r1, #1
	beq _021F64F4
	cmp r1, #2
	beq _021F6504
	b _021F6510
_021F64E4:
	ldrh r1, [r4, #6]
	mov r2, #1
	bl RadioPrintInit
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _021F6510
_021F64F4:
	bl Radio_RunTextPrinter
	cmp r0, #0
	beq _021F6510
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _021F6510
_021F6504:
	bl ov101_021F5B68
	cmp r0, #0
	beq _021F6510
	mov r0, #1
	pop {r4, pc}
_021F6510:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end RadioShow_Commercials_print

	thumb_func_start RadioShow_Commercials_init
RadioShow_Commercials_init: ; 0x021F6514
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r6, #0
	mov r2, #0x67
	ldr r4, [r5, #0x1c]
	ldr r3, [r5]
	add r0, r6, #0
	mov r1, #0x1b
	lsl r2, r2, #2
	bl NewMsgDataFromNarc
	str r0, [r5, #0x24]
	ldr r2, [r5, #0x4c]
	add r1, r6, #0
	bl ReadMsgDataIntoString
	ldr r0, [r5, #0x50]
	bl StringSetEmpty
	add r0, r4, #0
	add r0, #8
	add r1, r6, #0
	mov r2, #8
	bl MI_CpuFill8
	add r0, r4, #0
	add r0, #0x10
	add r1, r6, #0
	mov r2, #0x24
	bl MI_CpuFill8
	ldr r0, [r5, #4]
	bl SavArray_Flags_get
	mov r1, #1
	strb r1, [r4, #8]
	add r7, r0, #0
	mov r1, #0x6b
	bl CheckFlagInArray
	strb r0, [r4, #9]
	add r0, r7, #0
	mov r1, #2
	mov r2, #0x10
	bl ScriptState_FlypointFlagAction
	strb r0, [r4, #0xa]
	add r0, r7, #0
	mov r1, #2
	mov r2, #0x12
	bl ScriptState_FlypointFlagAction
	strb r0, [r4, #0xb]
	add r0, r7, #0
	mov r1, #2
	mov r2, #0x11
	bl ScriptState_FlypointFlagAction
	strb r0, [r4, #0xc]
	add r0, r7, #0
	mov r1, #2
	mov r2, #5
	bl ScriptState_FlypointFlagAction
	strb r0, [r4, #0xe]
	ldr r1, _021F660C ; =0x00000964
	add r0, r7, #0
	bl CheckFlagInArray
	mov r1, #0x46
	strb r0, [r4, #0xd]
	add r0, r7, #0
	lsl r1, r1, #2
	bl CheckFlagInArray
	ldr r7, _021F6610 ; =ov101_021F8AD0
	strb r0, [r4, #0xf]
	add r1, r6, #0
_021F65B0:
	lsl r0, r1, #1
	add r0, r1, r0
	add r2, r7, r0
	ldrb r0, [r7, r0]
	add r0, r4, r0
	ldrb r0, [r0, #8]
	cmp r0, #0
	beq _021F65EE
	ldrb r0, [r2, #2]
	cmp r0, #0xff
	beq _021F65D0
	add r3, r5, #0
	add r3, #0x58
	ldrb r3, [r3]
	cmp r0, r3
	bne _021F65EE
_021F65D0:
	add r0, r5, #0
	add r0, #0x66
	ldrb r0, [r0]
	ldrb r2, [r2, #1]
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1f
	add r0, r0, #1
	tst r0, r2
	beq _021F65EE
	add r0, r6, #0
	add r2, r6, #1
	lsl r2, r2, #0x18
	add r0, r4, r0
	lsr r6, r2, #0x18
	strb r1, [r0, #0x10]
_021F65EE:
	add r0, r1, #1
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	cmp r1, #0x24
	blo _021F65B0
	bl LCRandom
	add r1, r6, #0
	bl _s32_div_f
	add r0, r4, r1
	ldrb r0, [r0, #0x10]
	add r0, r0, #2
	strh r0, [r4, #6]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021F660C: .word 0x00000964
_021F6610: .word ov101_021F8AD0
	thumb_func_end RadioShow_Commercials_init

	thumb_func_start ov101_021F6614
ov101_021F6614: ; 0x021F6614
	ldr r3, _021F661C ; =DestroyMsgData
	ldr r0, [r0, #0x24]
	bx r3
	nop
_021F661C: .word DestroyMsgData
	thumb_func_end ov101_021F6614

	thumb_func_start RadioShow_PokemonSearchParty_setup
RadioShow_PokemonSearchParty_setup: ; 0x021F6620
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	mov r1, #0x20
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x20
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r5, #0
	str r4, [r5, #0x1c]
	bl RadioShow_PokemonSearchParty_init
	bl GF_GetCurrentPlayingBGM
	mov r1, #0
	bl StopBGM
	ldr r0, _021F6654 ; =SEQ_GS_RADIO_VARIETY
	bl SndRadio_StartSeq
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_021F6654: .word SEQ_GS_RADIO_VARIETY
	thumb_func_end RadioShow_PokemonSearchParty_setup

	thumb_func_start RadioShow_PokemonSearchParty_teardown
RadioShow_PokemonSearchParty_teardown: ; 0x021F6658
	push {r4, lr}
	add r4, r0, #0
	bl ov101_021F6800
	ldr r0, [r4, #0x1c]
	mov r1, #0
	mov r2, #0x20
	bl MI_CpuFill8
	ldr r0, [r4, #0x1c]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4, #0x1c]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end RadioShow_PokemonSearchParty_teardown

	thumb_func_start RadioShow_PokemonSearchParty_print
RadioShow_PokemonSearchParty_print: ; 0x021F6678
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r4, [r5, #0x1c]
	ldrh r1, [r4, #4]
	cmp r1, #4
	bhi _021F670C
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021F6690: ; jump table
	.short _021F669A - _021F6690 - 2 ; case 0
	.short _021F66A8 - _021F6690 - 2 ; case 1
	.short _021F66CA - _021F6690 - 2 ; case 2
	.short _021F66DA - _021F6690 - 2 ; case 3
	.short _021F66F2 - _021F6690 - 2 ; case 4
_021F669A:
	mov r1, #2
	bl RadioPrintInitEz
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _021F670C
_021F66A8:
	bl Radio_RunTextPrinter
	cmp r0, #0
	beq _021F670C
	ldrh r1, [r4, #6]
	add r0, r5, #0
	add r1, r4, r1
	ldrb r1, [r1, #0x10]
	add r1, r1, #4
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl RadioPrintInitEz
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _021F670C
_021F66CA:
	bl Radio_RunTextPrinter
	cmp r0, #0
	beq _021F670C
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _021F670C
_021F66DA:
	bl ov101_021F5AB8
	cmp r0, #0
	beq _021F670C
	add r0, r5, #0
	mov r1, #3
	bl RadioPrintAndPlayJingle
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _021F670C
_021F66F2:
	bl Radio_RunTextPrinter_WaitJingle
	cmp r0, #0
	beq _021F670C
	add r0, r5, #0
	add r0, #0x66
	ldrb r1, [r0]
	mov r0, #0x10
	add r5, #0x66
	orr r0, r1
	strb r0, [r5]
	mov r0, #1
	pop {r3, r4, r5, pc}
_021F670C:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end RadioShow_PokemonSearchParty_print

	thumb_func_start RadioShow_PokemonSearchParty_init
RadioShow_PokemonSearchParty_init: ; 0x021F6710
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	mov r4, #0
	ldr r5, [r6, #0x1c]
	ldr r2, _021F67F8 ; =0x000001A3
	ldr r3, [r6]
	add r0, r4, #0
	mov r1, #0x1b
	bl NewMsgDataFromNarc
	str r0, [r6, #0x24]
	ldr r2, [r6, #0x4c]
	add r1, r4, #0
	bl ReadMsgDataIntoString
	ldr r0, [r6, #0x24]
	ldr r2, [r6, #0x50]
	mov r1, #1
	bl ReadMsgDataIntoString
	add r0, r5, #0
	add r0, #8
	add r1, r4, #0
	mov r2, #8
	bl MI_CpuFill8
	add r0, r5, #0
	add r0, #0x10
	add r1, r4, #0
	mov r2, #0xd
	bl MI_CpuFill8
	ldr r0, [r6, #4]
	bl SavArray_Flags_get
	add r7, r0, #0
	ldr r0, [r6, #4]
	bl Sav2_PlayerData_GetProfileAddr
	str r0, [sp]
	mov r0, #1
	strb r0, [r5, #8]
	add r0, r7, #0
	mov r1, #FLAG_BEAT_AZALEA_ROCKETS
	bl CheckFlagInArray
	strb r0, [r5, #9]
	ldr r0, [sp]
	mov r1, #2
	bl PlayerProfile_TestBadgeFlag
	strb r0, [r5, #0xa]
	add r0, r7, #0
	mov r1, #FLAG_BEAT_RADIO_TOWER_ROCKETS
	bl CheckFlagInArray
	strb r0, [r5, #0xb]
	ldr r0, [sp]
	bl PlayerProfile_CountBadges
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	cmp r1, #8
	blo _021F6794
	mov r0, #1
	strb r0, [r5, #0xc]
_021F6794:
	cmp r1, #9
	blo _021F679C
	mov r0, #1
	strb r0, [r5, #0xd]
_021F679C:
	cmp r1, #0x10
	blo _021F67A4
	mov r0, #1
	strb r0, [r5, #0xf]
_021F67A4:
	add r0, r7, #0
	mov r1, #2
	mov r2, #5
	bl ScriptState_FlypointFlagAction
	strb r0, [r5, #0xe]
	ldr r0, _021F67FC ; =ov101_021F8B3C
	mov r1, #0
_021F67B4:
	ldrb r2, [r0, r1]
	add r2, r5, r2
	ldrb r2, [r2, #8]
	cmp r2, #0
	beq _021F67CA
	add r2, r4, #0
	add r3, r4, #1
	lsl r3, r3, #0x18
	add r2, r5, r2
	lsr r4, r3, #0x18
	strb r1, [r2, #0x10]
_021F67CA:
	add r1, r1, #1
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	cmp r1, #0xd
	blo _021F67B4
	bl LCRandom
	add r1, r4, #0
	bl _s32_div_f
	strh r1, [r5, #6]
	ldrh r1, [r5, #6]
	ldr r0, [r6, #0x54]
	cmp r1, r0
	bne _021F67F2
	add r0, r1, #1
	add r1, r4, #0
	bl _s32_div_f
	strh r1, [r5, #6]
_021F67F2:
	ldrh r0, [r5, #6]
	str r0, [r6, #0x54]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021F67F8: .word 0x000001A3
_021F67FC: .word ov101_021F8B3C
	thumb_func_end RadioShow_PokemonSearchParty_init

	thumb_func_start ov101_021F6800
ov101_021F6800: ; 0x021F6800
	ldr r3, _021F6808 ; =DestroyMsgData
	ldr r0, [r0, #0x24]
	bx r3
	nop
_021F6808: .word DestroyMsgData
	thumb_func_end ov101_021F6800

	thumb_func_start RadioShow_BuenasPassword_setup
RadioShow_BuenasPassword_setup: ; 0x021F680C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	mov r1, #8
	bl AllocFromHeap
	mov r1, #0
	mov r2, #8
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r5, #0
	str r4, [r5, #0x1c]
	bl RadioShow_BuenasPassword_init
	bl GF_GetCurrentPlayingBGM
	mov r1, #0
	bl StopBGM
	mov r0, #SEQ_GS_AIKOTOBA>>4
	lsl r0, r0, #4
	bl SndRadio_StartSeq
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end RadioShow_BuenasPassword_setup

	thumb_func_start RadioShow_BuenasPassword_teardown
RadioShow_BuenasPassword_teardown: ; 0x021F6840
	push {r4, lr}
	add r4, r0, #0
	bl ov101_021F699C
	ldr r0, [r4, #0x1c]
	mov r1, #0
	mov r2, #8
	bl MI_CpuFill8
	ldr r0, [r4, #0x1c]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4, #0x1c]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end RadioShow_BuenasPassword_teardown

	thumb_func_start RadioShow_BuenasPassword_print
RadioShow_BuenasPassword_print: ; 0x021F6860
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r4, [r5, #0x1c]
	ldrh r1, [r4, #4]
	cmp r1, #4
	bhi _021F68FC
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021F6878: ; jump table
	.short _021F6882 - _021F6878 - 2 ; case 0
	.short _021F6890 - _021F6878 - 2 ; case 1
	.short _021F68BA - _021F6878 - 2 ; case 2
	.short _021F68CA - _021F6878 - 2 ; case 3
	.short _021F68E2 - _021F6878 - 2 ; case 4
_021F6882:
	mov r1, #2
	bl RadioPrintInitEz
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _021F68FC
_021F6890:
	bl Radio_RunTextPrinter
	cmp r0, #0
	beq _021F68FC
	ldrh r1, [r4, #6]
	add r0, r5, #0
	bl RadioPrintInitEz
	ldrh r0, [r4, #6]
	cmp r0, #4
	bne _021F68B2
	ldr r0, [r5, #4]
	bl SavArray_Flags_get
	ldr r1, _021F6900 ; =FLAG_DAILY_HEARD_BUENAS_PASSWORD
	bl SetFlagInArray
_021F68B2:
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _021F68FC
_021F68BA:
	bl Radio_RunTextPrinter
	cmp r0, #0
	beq _021F68FC
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _021F68FC
_021F68CA:
	bl ov101_021F5AB8
	cmp r0, #0
	beq _021F68FC
	add r0, r5, #0
	mov r1, #3
	bl RadioPrintAndPlayJingle
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _021F68FC
_021F68E2:
	bl Radio_RunTextPrinter_WaitJingle
	cmp r0, #0
	beq _021F68FC
	add r0, r5, #0
	add r0, #0x66
	ldrb r1, [r0]
	mov r0, #0x10
	add r5, #0x66
	orr r0, r1
	strb r0, [r5]
	mov r0, #1
	pop {r3, r4, r5, pc}
_021F68FC:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021F6900: .word FLAG_DAILY_HEARD_BUENAS_PASSWORD
	thumb_func_end RadioShow_BuenasPassword_print

	thumb_func_start RadioShow_BuenasPassword_init
RadioShow_BuenasPassword_init: ; 0x021F6904
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r4, [r5, #0x1c]
	ldr r2, _021F6998 ; =0x0000019B
	ldr r3, [r5]
	mov r0, #0
	mov r1, #0x1b
	bl NewMsgDataFromNarc
	str r0, [r5, #0x24]
	ldr r2, [r5, #0x4c]
	mov r1, #msg_0411_00000
	bl ReadMsgDataIntoString
	ldr r0, [r5, #0x24]
	ldr r2, [r5, #0x50]
	mov r1, #msg_0411_00001
	bl ReadMsgDataIntoString
	ldr r0, [r5, #4]
	bl Sav2_Bag_get
	mov r1, #ITEM_BLUE_CARD>>2
	ldr r3, [r5]
	lsl r1, r1, #2
	mov r2, #1
	bl Bag_HasItem
	cmp r0, #0
	beq _021F6946
	mov r0, #msg_0411_00004
	b _021F6948
_021F6946:
	mov r0, #msg_0411_00005
_021F6948:
	strh r0, [r4, #6]
	ldr r3, [r5]
	mov r0, #0
	mov r1, #0x1b
	mov r2, #0x42 ; msg_0066_D23R0102.gmm
	bl NewMsgDataFromNarc
	add r4, r0, #0
	ldr r0, [r5, #4]
	bl SavArray_Flags_get
	bl ScriptState_GetBuenasPasswordSet
	mov r1, #0x1e
	bl _s32_div_f
	lsl r0, r1, #0x10
	lsr r1, r0, #0x10
	add r0, r4, #0
	add r1, #0x28
	bl NewString_ReadMsgData
	add r6, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r3, #2
	str r3, [sp, #4]
	ldr r0, [r5, #0x44]
	mov r1, #0
	add r2, r6, #0
	bl BufferString
	add r0, r6, #0
	bl String_dtor
	add r0, r4, #0
	bl DestroyMsgData
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021F6998: .word 0x0000019B
	thumb_func_end RadioShow_BuenasPassword_init

	thumb_func_start ov101_021F699C
ov101_021F699C: ; 0x021F699C
	ldr r3, _021F69A4 ; =DestroyMsgData
	ldr r0, [r0, #0x24]
	bx r3
	nop
_021F69A4: .word DestroyMsgData
	thumb_func_end ov101_021F699C

	thumb_func_start RadioShow_ThatTownThesePeople_setup
RadioShow_ThatTownThesePeople_setup: ; 0x021F69A8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	mov r1, #0x24
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x24
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r5, #0
	str r4, [r5, #0x1c]
	bl RadioShow_ThatTownThesePeople_init
	bl GF_GetCurrentPlayingBGM
	mov r1, #0
	bl StopBGM
	ldr r0, _021F69DC ; =SEQ_GS_RADIO_PT
	bl SndRadio_StartSeq
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_021F69DC: .word SEQ_GS_RADIO_PT
	thumb_func_end RadioShow_ThatTownThesePeople_setup

	thumb_func_start RadioShow_ThatTownThesePeople_teardown
RadioShow_ThatTownThesePeople_teardown: ; 0x021F69E0
	push {r4, lr}
	add r4, r0, #0
	bl ov101_021F6B7C
	ldr r0, [r4, #0x1c]
	mov r1, #0
	mov r2, #0x24
	bl MI_CpuFill8
	ldr r0, [r4, #0x1c]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4, #0x1c]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end RadioShow_ThatTownThesePeople_teardown

	thumb_func_start RadioShow_ThatTownThesePeople_print
RadioShow_ThatTownThesePeople_print: ; 0x021F6A00
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r4, [r5, #0x1c]
	ldrh r1, [r4, #4]
	cmp r1, #5
	bhi _021F6AA8
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021F6A18: ; jump table
	.short _021F6A24 - _021F6A18 - 2 ; case 0
	.short _021F6A32 - _021F6A18 - 2 ; case 1
	.short _021F6A40 - _021F6A18 - 2 ; case 2
	.short _021F6A54 - _021F6A18 - 2 ; case 3
	.short _021F6A76 - _021F6A18 - 2 ; case 4
	.short _021F6A8E - _021F6A18 - 2 ; case 5
_021F6A24:
	mov r1, #2
	bl RadioPrintInitEz
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _021F6AA8
_021F6A32:
	bl Radio_RunTextPrinter
	cmp r0, #0
	beq _021F6AA8
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
_021F6A40:
	ldrb r1, [r4, #9]
	add r0, r5, #0
	add r1, r4, r1
	ldrb r1, [r1, #6]
	bl RadioPrintInitEz
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _021F6AA8
_021F6A54:
	bl Radio_RunTextPrinter
	cmp r0, #0
	beq _021F6AA8
	ldrb r0, [r4, #9]
	add r0, r0, #1
	strb r0, [r4, #9]
	ldrb r0, [r4, #9]
	cmp r0, #3
	bhs _021F6A6E
	mov r0, #2
	strh r0, [r4, #4]
	b _021F6AA8
_021F6A6E:
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _021F6AA8
_021F6A76:
	bl ov101_021F5AB8
	cmp r0, #0
	beq _021F6AA8
	add r0, r5, #0
	mov r1, #3
	bl RadioPrintAndPlayJingle
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _021F6AA8
_021F6A8E:
	bl Radio_RunTextPrinter_WaitJingle
	cmp r0, #0
	beq _021F6AA8
	add r0, r5, #0
	add r0, #0x66
	ldrb r1, [r0]
	mov r0, #0x10
	add r5, #0x66
	orr r0, r1
	strb r0, [r5]
	mov r0, #1
	pop {r3, r4, r5, pc}
_021F6AA8:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end RadioShow_ThatTownThesePeople_print

	thumb_func_start RadioShow_ThatTownThesePeople_init
RadioShow_ThatTownThesePeople_init: ; 0x021F6AAC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r4, [r5, #0x1c]
	ldr r2, _021F6B74 ; =0x0000019F
	ldr r3, [r5]
	mov r0, #0
	mov r1, #0x1b
	bl NewMsgDataFromNarc
	str r0, [r5, #0x24]
	ldr r2, [r5, #0x4c]
	mov r1, #0
	bl ReadMsgDataIntoString
	ldr r0, [r5, #0x24]
	ldr r2, [r5, #0x50]
	mov r1, #1
	bl ReadMsgDataIntoString
	add r0, r4, #0
	add r0, #0xa
	mov r1, #0
	mov r2, #5
	bl MI_CpuFill8
	add r0, r4, #0
	add r0, #0xf
	mov r1, #0
	mov r2, #0x14
	bl MI_CpuFill8
	ldr r0, [r5, #4]
	bl SavArray_Flags_get
	mov r1, #1
	strb r1, [r4, #0xa]
	add r5, r0, #0
	mov r1, #2
	mov r2, #0xf
	bl ScriptState_FlypointFlagAction
	strb r0, [r4, #0xb]
	add r0, r5, #0
	mov r1, #2
	mov r2, #0x13
	bl ScriptState_FlypointFlagAction
	strb r0, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	mov r2, #0x15
	bl ScriptState_FlypointFlagAction
	strb r0, [r4, #0xd]
	add r0, r5, #0
	mov r1, #2
	mov r2, #5
	bl ScriptState_FlypointFlagAction
	mov r6, #0
	strb r0, [r4, #0xe]
	ldr r1, _021F6B78 ; =ov101_021F8B4C
	add r0, r6, #0
_021F6B2A:
	ldrb r2, [r1]
	add r2, r4, r2
	ldrb r2, [r2, #0xa]
	cmp r2, #0
	beq _021F6B3A
	add r2, r4, r6
	add r6, r6, #1
	strb r0, [r2, #0xf]
_021F6B3A:
	add r0, r0, #1
	add r1, r1, #1
	cmp r0, #0x14
	blt _021F6B2A
	mov r5, #0
_021F6B44:
	bl LCRandom
	add r1, r6, #0
	bl _s32_div_f
	add r0, r4, r1
	ldrb r0, [r0, #0xf]
	lsl r2, r5, #0x18
	lsr r2, r2, #0x18
	add r0, r0, #4
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
	add r0, r4, #0
	add r1, r7, #0
	bl ov101_021F6B88
	cmp r0, #0
	bne _021F6B44
	add r0, r4, r5
	add r5, r5, #1
	strb r7, [r0, #6]
	cmp r5, #3
	blt _021F6B44
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021F6B74: .word 0x0000019F
_021F6B78: .word ov101_021F8B4C
	thumb_func_end RadioShow_ThatTownThesePeople_init

	thumb_func_start ov101_021F6B7C
ov101_021F6B7C: ; 0x021F6B7C
	ldr r3, _021F6B84 ; =DestroyMsgData
	ldr r0, [r0, #0x24]
	bx r3
	nop
_021F6B84: .word DestroyMsgData
	thumb_func_end ov101_021F6B7C

	thumb_func_start ov101_021F6B88
ov101_021F6B88: ; 0x021F6B88
	push {r3, r4}
	mov r4, #0
	cmp r2, #0
	ble _021F6BA4
_021F6B90:
	add r3, r0, r4
	ldrb r3, [r3, #6]
	cmp r1, r3
	bne _021F6B9E
	mov r0, #1
	pop {r3, r4}
	bx lr
_021F6B9E:
	add r4, r4, #1
	cmp r4, r2
	blt _021F6B90
_021F6BA4:
	mov r0, #0
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end ov101_021F6B88

	thumb_func_start RadioShow_TrainerProfiles_setup
RadioShow_TrainerProfiles_setup: ; 0x021F6BAC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	mov r1, #0xc
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0xc
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r5, #0
	str r4, [r5, #0x1c]
	bl RadioShow_TrainerProfiles_init
	bl GF_GetCurrentPlayingBGM
	mov r1, #0
	bl StopBGM
	ldr r0, _021F6BE0 ; =SEQ_GS_RADIO_TRAINER
	bl SndRadio_StartSeq
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_021F6BE0: .word SEQ_GS_RADIO_TRAINER
	thumb_func_end RadioShow_TrainerProfiles_setup

	thumb_func_start RadioShow_TrainerProfiles_teardown
RadioShow_TrainerProfiles_teardown: ; 0x021F6BE4
	push {r4, lr}
	add r4, r0, #0
	bl ov101_021F6D0C
	ldr r0, [r4, #0x1c]
	mov r1, #0
	mov r2, #0xc
	bl MI_CpuFill8
	ldr r0, [r4, #0x1c]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4, #0x1c]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end RadioShow_TrainerProfiles_teardown

	thumb_func_start RadioShow_TrainerProfiles_print
RadioShow_TrainerProfiles_print: ; 0x021F6C04
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r4, [r5, #0x1c]
	ldrh r1, [r4, #4]
	cmp r1, #5
	bhi _021F6CAC
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021F6C1C: ; jump table
	.short _021F6C28 - _021F6C1C - 2 ; case 0
	.short _021F6C36 - _021F6C1C - 2 ; case 1
	.short _021F6C44 - _021F6C1C - 2 ; case 2
	.short _021F6C58 - _021F6C1C - 2 ; case 3
	.short _021F6C7A - _021F6C1C - 2 ; case 4
	.short _021F6C92 - _021F6C1C - 2 ; case 5
_021F6C28:
	mov r1, #2
	bl RadioPrintInitEz
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _021F6CAC
_021F6C36:
	bl Radio_RunTextPrinter
	cmp r0, #0
	beq _021F6CAC
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
_021F6C44:
	ldrb r1, [r4, #9]
	add r0, r5, #0
	add r1, r4, r1
	ldrb r1, [r1, #6]
	bl RadioPrintInitEz
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _021F6CAC
_021F6C58:
	bl Radio_RunTextPrinter
	cmp r0, #0
	beq _021F6CAC
	ldrb r0, [r4, #9]
	add r0, r0, #1
	strb r0, [r4, #9]
	ldrb r0, [r4, #9]
	cmp r0, #3
	bhs _021F6C72
	mov r0, #2
	strh r0, [r4, #4]
	b _021F6CAC
_021F6C72:
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _021F6CAC
_021F6C7A:
	bl ov101_021F5AB8
	cmp r0, #0
	beq _021F6CAC
	add r0, r5, #0
	mov r1, #3
	bl RadioPrintAndPlayJingle
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _021F6CAC
_021F6C92:
	bl Radio_RunTextPrinter_WaitJingle
	cmp r0, #0
	beq _021F6CAC
	add r0, r5, #0
	add r0, #0x66
	ldrb r1, [r0]
	mov r0, #0x10
	add r5, #0x66
	orr r0, r1
	strb r0, [r5]
	mov r0, #1
	pop {r3, r4, r5, pc}
_021F6CAC:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end RadioShow_TrainerProfiles_print

	thumb_func_start RadioShow_TrainerProfiles_init
RadioShow_TrainerProfiles_init: ; 0x021F6CB0
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	mov r2, #0x69
	ldr r5, [r4, #0x1c]
	ldr r3, [r4]
	mov r0, #0
	mov r1, #0x1b
	lsl r2, r2, #2
	bl NewMsgDataFromNarc
	str r0, [r4, #0x24]
	ldr r2, [r4, #0x4c]
	mov r1, #0
	bl ReadMsgDataIntoString
	ldr r0, [r4, #0x24]
	ldr r2, [r4, #0x50]
	mov r1, #1
	bl ReadMsgDataIntoString
	mov r4, #0
	mov r7, #0x1c
_021F6CDC:
	bl LCRandom
	lsr r1, r0, #0x1f
	lsl r0, r0, #0x1c
	sub r0, r0, r1
	ror r0, r7
	add r0, r1, r0
	add r0, r0, #4
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	lsl r2, r4, #0x18
	add r0, r5, #0
	add r1, r6, #0
	lsr r2, r2, #0x18
	bl ov101_021F6D18
	cmp r0, #0
	bne _021F6CDC
	add r0, r5, r4
	add r4, r4, #1
	strb r6, [r0, #6]
	cmp r4, #3
	blt _021F6CDC
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end RadioShow_TrainerProfiles_init

	thumb_func_start ov101_021F6D0C
ov101_021F6D0C: ; 0x021F6D0C
	ldr r3, _021F6D14 ; =DestroyMsgData
	ldr r0, [r0, #0x24]
	bx r3
	nop
_021F6D14: .word DestroyMsgData
	thumb_func_end ov101_021F6D0C

	thumb_func_start ov101_021F6D18
ov101_021F6D18: ; 0x021F6D18
	push {r3, r4}
	mov r4, #0
	cmp r2, #0
	ble _021F6D34
_021F6D20:
	add r3, r0, r4
	ldrb r3, [r3, #6]
	cmp r1, r3
	bne _021F6D2E
	mov r0, #1
	pop {r3, r4}
	bx lr
_021F6D2E:
	add r4, r4, #1
	cmp r4, r2
	blt _021F6D20
_021F6D34:
	mov r0, #0
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end ov101_021F6D18

	thumb_func_start RadioShow_PokemonTalk_setup
RadioShow_PokemonTalk_setup: ; 0x021F6D3C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r1, #0x95
	ldr r0, [r5]
	lsl r1, r1, #2
	bl AllocFromHeap
	mov r2, #0x95
	mov r1, #0
	lsl r2, r2, #2
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r5, #0
	str r4, [r5, #0x1c]
	bl RadioShow_PokemonTalk_init
	bl GF_GetCurrentPlayingBGM
	mov r1, #0
	bl StopBGM
	ldr r0, _021F6D74 ; =SEQ_GS_OHKIDO_RABO
	bl SndRadio_StartSeq
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_021F6D74: .word SEQ_GS_OHKIDO_RABO
	thumb_func_end RadioShow_PokemonTalk_setup

	thumb_func_start RadioShow_PokemonTalk_teardown
RadioShow_PokemonTalk_teardown: ; 0x021F6D78
	push {r4, lr}
	add r4, r0, #0
	bl ov101_021F6FC0
	mov r2, #0x95
	ldr r0, [r4, #0x1c]
	mov r1, #0
	lsl r2, r2, #2
	bl MI_CpuFill8
	ldr r0, [r4, #0x1c]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4, #0x1c]
	pop {r4, pc}
	thumb_func_end RadioShow_PokemonTalk_teardown

	thumb_func_start RadioShow_PokemonTalk_print
RadioShow_PokemonTalk_print: ; 0x021F6D98
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r6, r0, #0
	ldr r4, [r6, #0x1c]
	ldrh r1, [r4, #4]
	cmp r1, #7
	bhi _021F6DD8
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021F6DB2: ; jump table
	.short _021F6DC2 - _021F6DB2 - 2 ; case 0
	.short _021F6DD0 - _021F6DB2 - 2 ; case 1
	.short _021F6E10 - _021F6DB2 - 2 ; case 2
	.short _021F6E1E - _021F6DB2 - 2 ; case 3
	.short _021F6E56 - _021F6DB2 - 2 ; case 4
	.short _021F6EB2 - _021F6DB2 - 2 ; case 5
	.short _021F6ED8 - _021F6DB2 - 2 ; case 6
	.short _021F6EF0 - _021F6DB2 - 2 ; case 7
_021F6DC2:
	mov r1, #2
	bl RadioPrintInitEz
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _021F6F0C
_021F6DD0:
	bl Radio_RunTextPrinter
	cmp r0, #0
	bne _021F6DDA
_021F6DD8:
	b _021F6F0C
_021F6DDA:
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _021F6DE6
	mov r0, #3
	strh r0, [r4, #4]
	b _021F6F0C
_021F6DE6:
	ldrh r0, [r4, #8]
	bl MapHeader_GetMapSec
	add r2, r0, #0
	ldr r0, [r6, #0x44]
	mov r1, #0
	bl BufferLandmarkName
	ldrh r2, [r4, #6]
	ldr r0, [r6, #0x44]
	mov r1, #1
	bl BufferSpeciesName
	add r0, r6, #0
	mov r1, #0x20
	bl RadioPrintInitEz
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _021F6F0C
_021F6E10:
	bl Radio_RunTextPrinter
	cmp r0, #0
	beq _021F6F0C
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
_021F6E1E:
	mov r2, #0x25
	lsl r2, r2, #4
	ldrb r2, [r4, r2]
	ldr r0, [r6, #0x44]
	mov r1, #0
	lsl r2, r2, #2
	add r2, r4, r2
	ldrh r2, [r2, #0x10]
	bl BufferLandmarkName
	mov r2, #0x25
	lsl r2, r2, #4
	ldrb r2, [r4, r2]
	ldr r0, [r6, #0x44]
	mov r1, #1
	lsl r2, r2, #2
	add r2, r4, r2
	ldrh r2, [r2, #0x12]
	bl BufferSpeciesName
	add r0, r6, #0
	mov r1, #4
	bl RadioPrintInitEz
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _021F6F0C
_021F6E56:
	bl Radio_RunTextPrinter
	cmp r0, #0
	beq _021F6F0C
	mov r5, #0
	str r5, [sp, #8]
	add r7, r5, #0
_021F6E64:
	mov r1, #0x25
	lsl r1, r1, #4
	ldrb r1, [r4, r1]
	ldr r0, [r6, #0x24]
	ldr r2, [r6, #0x48]
	lsl r1, r1, #2
	add r1, r4, r1
	add r1, r5, r1
	ldrh r1, [r1, #0x24]
	add r1, r1, #6
	add r1, r7, r1
	bl ReadMsgDataIntoString
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r1, [sp, #8]
	ldr r0, [r6, #0x44]
	ldr r2, [r6, #0x48]
	add r1, r1, #2
	mov r3, #1
	bl BufferString
	ldr r0, [sp, #8]
	add r5, r5, #2
	add r0, r0, #1
	add r7, #0xd
	str r0, [sp, #8]
	cmp r0, #2
	blt _021F6E64
	add r0, r6, #0
	mov r1, #5
	bl RadioPrintInitEz
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _021F6F0C
_021F6EB2:
	bl Radio_RunTextPrinter
	cmp r0, #0
	beq _021F6F0C
	mov r0, #0x25
	lsl r0, r0, #4
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	ldrb r0, [r4, r0]
	cmp r0, #5
	bhs _021F6ED0
	mov r0, #3
	strh r0, [r4, #4]
	b _021F6F0C
_021F6ED0:
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _021F6F0C
_021F6ED8:
	bl ov101_021F5AB8
	cmp r0, #0
	beq _021F6F0C
	add r0, r6, #0
	mov r1, #3
	bl RadioPrintAndPlayJingle
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _021F6F0C
_021F6EF0:
	bl Radio_RunTextPrinter_WaitJingle
	cmp r0, #0
	beq _021F6F0C
	add r0, r6, #0
	add r0, #0x66
	ldrb r1, [r0]
	mov r0, #0x10
	add r6, #0x66
	orr r0, r1
	strb r0, [r6]
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_021F6F0C:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end RadioShow_PokemonTalk_print

	thumb_func_start RadioShow_PokemonTalk_init
RadioShow_PokemonTalk_init: ; 0x021F6F14
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	ldr r5, [r4, #0x1c]
	ldr r2, _021F6FBC ; =0x0000019E
	ldr r3, [r4]
	mov r0, #0
	mov r1, #0x1b
	bl NewMsgDataFromNarc
	str r0, [r4, #0x24]
	ldr r2, [r4, #0x4c]
	mov r1, #0
	bl ReadMsgDataIntoString
	ldr r0, [r4, #0x24]
	ldr r2, [r4, #0x50]
	mov r1, #1
	bl ReadMsgDataIntoString
	ldr r0, [r4, #4]
	bl Save_Roamers_get
	add r6, r0, #0
	bl RoamerSave_OutbreakActive
	cmp r0, #0
	beq _021F6F5C
	add r0, r6, #0
	mov r1, #2
	bl Roamers_GetRand
	add r1, r5, #0
	add r1, #8
	add r2, r5, #6
	bl sub_02097F9C
_021F6F5C:
	add r0, r4, #0
	add r1, r5, #0
	bl ov101_021F6FCC
	bl LCRandom
	mov r1, #3
	bl _s32_div_f
	add r0, r1, #1
	lsl r6, r0, #1
	bl LCRandom
	mov r1, #0xd
	bl _s32_div_f
	lsl r0, r1, #0x18
	lsr r7, r0, #0x18
	bl LCRandom
	mov r1, #0xd
	bl _s32_div_f
	lsl r0, r1, #0x18
	lsr r4, r0, #0x18
	mov r0, #0
	str r0, [sp]
_021F6F92:
	strh r7, [r5, #0x24]
	add r0, r7, r6
	mov r1, #0xd
	strh r4, [r5, #0x26]
	bl _s32_div_f
	lsl r0, r1, #0x18
	lsr r7, r0, #0x18
	add r0, r4, r6
	mov r1, #0xd
	bl _s32_div_f
	lsl r0, r1, #0x18
	lsr r4, r0, #0x18
	ldr r0, [sp]
	add r5, r5, #4
	add r0, r0, #1
	str r0, [sp]
	cmp r0, #5
	blt _021F6F92
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021F6FBC: .word 0x0000019E
	thumb_func_end RadioShow_PokemonTalk_init

	thumb_func_start ov101_021F6FC0
ov101_021F6FC0: ; 0x021F6FC0
	ldr r3, _021F6FC8 ; =DestroyMsgData
	ldr r0, [r0, #0x24]
	bx r3
	nop
_021F6FC8: .word DestroyMsgData
	thumb_func_end ov101_021F6FC0

	thumb_func_start ov101_021F6FCC
ov101_021F6FCC: ; 0x021F6FCC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r7, r0, #0
	ldr r0, [r7, #4]
	add r5, r1, #0
	bl Sav2_Pokedex_get
	str r0, [sp, #8]
	ldr r0, [r7, #4]
	bl SavArray_Flags_get
	mov r1, #2
	mov r2, #0x19
	bl ScriptState_FlypointFlagAction
	str r0, [sp, #0xc]
	add r0, r5, #0
	mov r2, #0x4b
	add r0, #0x38
	mov r1, #0
	lsl r2, r2, #2
	bl MI_CpuFill8
	mov r0, #0x59
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0
	mov r2, #0x76
	bl MI_CpuFill8
	ldr r0, _021F70E8 ; =0x000001DA
	mov r1, #0
	add r0, r5, r0
	mov r2, #0x76
	bl MI_CpuFill8
	mov r4, #0
	strh r4, [r5, #0xa]
	strh r4, [r5, #0xc]
	add r6, r5, #0
	strh r4, [r5, #0xe]
	add r6, #0xa
_021F7020:
	add r0, r4, #0
	bl MapHeader_HasWildEncounters
	cmp r0, #0
	beq _021F707C
	add r0, r4, #0
	bl MapHeader_IsKanto
	add r1, r7, #0
	add r1, #0x66
	ldrb r1, [r1]
	lsl r1, r1, #0x1d
	lsr r1, r1, #0x1f
	cmp r1, r0
	bne _021F707C
	ldr r2, _021F70EC ; =ov101_021F8B60
	mov r1, #0
_021F7042:
	ldrh r0, [r2]
	cmp r4, r0
	beq _021F7050
	add r1, r1, #1
	add r2, r2, #2
	cmp r1, #0xe
	blo _021F7042
_021F7050:
	cmp r1, #0xe
	blo _021F707C
	ldr r0, [sp, #0xc]
	cmp r0, #0
	bne _021F7062
	cmp r4, #0x97
	beq _021F707C
	cmp r4, #0x98
	beq _021F707C
_021F7062:
	ldrh r0, [r6]
	ldrh r1, [r5, #0xa]
	add r0, r0, #1
	strh r0, [r6]
	lsl r0, r1, #1
	add r0, r5, r0
	strh r4, [r0, #0x38]
	ldrh r0, [r5, #0xa]
	cmp r0, #0x96
	blo _021F707C
	bl GF_AssertFail
	b _021F7086
_021F707C:
	mov r0, #0x87
	add r4, r4, #1
	lsl r0, r0, #2
	cmp r4, r0
	blt _021F7020
_021F7086:
	mov r0, #0
	str r0, [sp]
	str r5, [sp, #4]
_021F708C:
	mov r0, #0
	strh r0, [r5, #0xc]
	strh r0, [r5, #0xe]
	ldr r0, [sp]
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
_021F7098:
	bl LCRandom
	ldrh r1, [r5, #0xa]
	bl _s32_div_f
	lsl r0, r1, #0x10
	lsr r0, r0, #0xf
	add r6, r5, r0
	ldrh r0, [r6, #0x38]
	bl MapHeader_GetMapSec
	lsl r0, r0, #0x10
	lsr r7, r0, #0x10
	add r0, r5, #0
	add r1, r7, #0
	add r2, r4, #0
	bl ov101_021F70F0
	cmp r0, #0
	bne _021F7098
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	strh r7, [r0, #0x10]
	ldrh r2, [r6, #0x38]
	add r0, r5, #0
	bl ov101_021F7174
	ldr r1, [sp, #4]
	strh r0, [r1, #0x12]
	add r0, r1, #0
	add r0, r0, #4
	str r0, [sp, #4]
	ldr r0, [sp]
	add r0, r0, #1
	str r0, [sp]
	cmp r0, #5
	blt _021F708C
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F70E8: .word 0x000001DA
_021F70EC: .word ov101_021F8B60
	thumb_func_end ov101_021F6FCC

	thumb_func_start ov101_021F70F0
ov101_021F70F0: ; 0x021F70F0
	push {r3, r4}
	mov r4, #0
	cmp r2, #0
	ble _021F710C
_021F70F8:
	ldrh r3, [r0, #0x10]
	cmp r1, r3
	bne _021F7104
	mov r0, #1
	pop {r3, r4}
	bx lr
_021F7104:
	add r4, r4, #1
	add r0, r0, #4
	cmp r4, r2
	blt _021F70F8
_021F710C:
	mov r0, #0
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end ov101_021F70F0

	thumb_func_start ov101_021F7114
ov101_021F7114: ; 0x021F7114
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r7, r1, #0
	add r4, r2, #0
	beq _021F7168
	ldr r0, _021F716C ; =0x000001ED
	cmp r4, r0
	bhi _021F7168
	ldrh r6, [r5, #0xc]
	mov r2, #0
	cmp r6, #0
	ble _021F713E
	add r3, r5, #0
	sub r0, #0x89
_021F7130:
	ldrh r1, [r3, r0]
	cmp r4, r1
	beq _021F7168
	add r2, r2, #1
	add r3, r3, #2
	cmp r2, r6
	blt _021F7130
_021F713E:
	ldrh r0, [r5, #0xc]
	add r0, r0, #1
	strh r0, [r5, #0xc]
	lsl r0, r6, #1
	add r1, r5, r0
	mov r0, #0x59
	lsl r0, r0, #2
	strh r4, [r1, r0]
	add r0, r7, #0
	add r1, r4, #0
	bl Pokedex_CheckMonCaughtFlag
	cmp r0, #0
	bne _021F7168
	ldrh r1, [r5, #0xe]
	add r0, r1, #1
	strh r0, [r5, #0xe]
	lsl r0, r1, #1
	add r1, r5, r0
	ldr r0, _021F7170 ; =0x000001DA
	strh r4, [r1, r0]
_021F7168:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F716C: .word 0x000001ED
_021F7170: .word 0x000001DA
	thumb_func_end ov101_021F7114

	thumb_func_start ov101_021F7174
ov101_021F7174: ; 0x021F7174
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc4
	add r5, r0, #0
	add r4, r1, #0
	add r0, sp, #0
	add r1, r2, #0
	bl WildEncounters_ReadFromNarc
	add r0, sp, #0
	ldrb r0, [r0]
	cmp r0, #0
	beq _021F71BA
	mov r7, #0
	add r6, sp, #0
_021F7190:
	ldrh r2, [r6, #0x14]
	add r0, r5, #0
	add r1, r4, #0
	bl ov101_021F7114
	ldrh r2, [r6, #0x2c]
	add r0, r5, #0
	add r1, r4, #0
	bl ov101_021F7114
	add r2, r6, #0
	add r2, #0x44
	ldrh r2, [r2]
	add r0, r5, #0
	add r1, r4, #0
	bl ov101_021F7114
	add r7, r7, #1
	add r6, r6, #2
	cmp r7, #0xc
	blt _021F7190
_021F71BA:
	add r0, sp, #0
	ldrb r0, [r0, #1]
	cmp r0, #0
	beq _021F71DC
	mov r7, #0
	add r6, sp, #0
_021F71C6:
	add r2, r6, #0
	add r2, #0x66
	ldrh r2, [r2]
	add r0, r5, #0
	add r1, r4, #0
	bl ov101_021F7114
	add r7, r7, #1
	add r6, r6, #4
	cmp r7, #5
	blt _021F71C6
_021F71DC:
	add r0, sp, #0
	ldrb r0, [r0, #2]
	cmp r0, #0
	beq _021F71FE
	mov r7, #0
	add r6, sp, #0
_021F71E8:
	add r2, r6, #0
	add r2, #0x7a
	ldrh r2, [r2]
	add r0, r5, #0
	add r1, r4, #0
	bl ov101_021F7114
	add r7, r7, #1
	add r6, r6, #4
	cmp r7, #2
	blt _021F71E8
_021F71FE:
	add r0, sp, #0
	ldrb r0, [r0, #3]
	cmp r0, #0
	beq _021F7220
	mov r7, #0
	add r6, sp, #0
_021F720A:
	add r2, r6, #0
	add r2, #0x82
	ldrh r2, [r2]
	add r0, r5, #0
	add r1, r4, #0
	bl ov101_021F7114
	add r7, r7, #1
	add r6, r6, #4
	cmp r7, #5
	blt _021F720A
_021F7220:
	add r0, sp, #0
	ldrb r0, [r0, #4]
	cmp r0, #0
	beq _021F7242
	mov r7, #0
	add r6, sp, #0
_021F722C:
	add r2, r6, #0
	add r2, #0x96
	ldrh r2, [r2]
	add r0, r5, #0
	add r1, r4, #0
	bl ov101_021F7114
	add r7, r7, #1
	add r6, r6, #4
	cmp r7, #5
	blt _021F722C
_021F7242:
	add r0, sp, #0
	ldrb r0, [r0, #5]
	cmp r0, #0
	beq _021F7264
	mov r7, #0
	add r6, sp, #0
_021F724E:
	add r2, r6, #0
	add r2, #0xaa
	ldrh r2, [r2]
	add r0, r5, #0
	add r1, r4, #0
	bl ov101_021F7114
	add r7, r7, #1
	add r6, r6, #4
	cmp r7, #5
	blt _021F724E
_021F7264:
	add r0, sp, #0xc0
	ldrh r2, [r0]
	cmp r2, #0
	beq _021F7274
	add r0, r5, #0
	add r1, r4, #0
	bl ov101_021F7114
_021F7274:
	ldrh r0, [r5, #0xe]
	cmp r0, #0
	beq _021F7292
	cmp r0, #1
	bne _021F72AA
	bl LCRandom
	mov r1, #0xfa
	lsl r1, r1, #2
	bl _s32_div_f
	mov r0, #0x7d
	lsl r0, r0, #2
	cmp r1, r0
	bge _021F72AA
_021F7292:
	bl LCRandom
	ldrh r1, [r5, #0xc]
	bl _s32_div_f
	lsl r0, r1, #1
	add r1, r5, r0
	mov r0, #0x59
	lsl r0, r0, #2
	add sp, #0xc4
	ldrh r0, [r1, r0]
	pop {r4, r5, r6, r7, pc}
_021F72AA:
	bl LCRandom
	ldrh r1, [r5, #0xe]
	bl _s32_div_f
	lsl r0, r1, #1
	add r1, r5, r0
	ldr r0, _021F72C0 ; =0x000001DA
	ldrh r0, [r1, r0]
	add sp, #0xc4
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021F72C0: .word 0x000001DA
	thumb_func_end ov101_021F7174

	thumb_func_start RadioShow_MahoganySignal_setup
RadioShow_MahoganySignal_setup: ; 0x021F72C4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	mov r1, #8
	bl AllocFromHeap
	mov r1, #0
	mov r2, #8
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r5, #0
	str r4, [r5, #0x1c]
	bl RadioShow_MahoganySignal_init
	bl GF_GetCurrentPlayingBGM
	mov r1, #1
	bl StopBGM
	mov r0, #0
	strb r0, [r4, #4]
	ldr r0, _021F72FC ; =SEQ_GS_KAIDENPA
	bl SndRadio_StartSeq
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_021F72FC: .word SEQ_GS_KAIDENPA
	thumb_func_end RadioShow_MahoganySignal_setup

	thumb_func_start RadioShow_MahoganySignal_teardown
RadioShow_MahoganySignal_teardown: ; 0x021F7300
	push {r4, lr}
	add r4, r0, #0
	bl ov101_021F734C
	ldr r0, [r4, #0x1c]
	mov r1, #0
	mov r2, #8
	bl MI_CpuFill8
	ldr r0, [r4, #0x1c]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4, #0x1c]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end RadioShow_MahoganySignal_teardown

	thumb_func_start RadioShow_MahoganySignal_print
RadioShow_MahoganySignal_print: ; 0x021F7320
	mov r0, #0
	bx lr
	thumb_func_end RadioShow_MahoganySignal_print

	thumb_func_start RadioShow_MahoganySignal_init
RadioShow_MahoganySignal_init: ; 0x021F7324
	push {r4, lr}
	add r4, r0, #0
	ldr r2, _021F7348 ; =0x00000199
	ldr r3, [r4]
	mov r0, #0
	mov r1, #0x1b
	bl NewMsgDataFromNarc
	str r0, [r4, #0x24]
	ldr r2, [r4, #0x4c]
	mov r1, #0
	bl ReadMsgDataIntoString
	ldr r0, [r4, #0x50]
	bl StringSetEmpty
	pop {r4, pc}
	nop
_021F7348: .word 0x00000199
	thumb_func_end RadioShow_MahoganySignal_init

	thumb_func_start ov101_021F734C
ov101_021F734C: ; 0x021F734C
	ldr r3, _021F7354 ; =DestroyMsgData
	ldr r0, [r0, #0x24]
	bx r3
	nop
_021F7354: .word DestroyMsgData
	thumb_func_end ov101_021F734C

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
	.byte 0x31, 0x00

ov101_021F79B6: ; 0x021F79B6
	.byte 0x31, 0x00, 0x00, 0x00, 0x20, 0x0B, 0x00, 0x14, 0x11, 0x33
	.byte 0x11, 0x00, 0x32, 0x00, 0x32, 0x00, 0x01, 0x01, 0x1F, 0x07, 0x05, 0x14, 0x22, 0x44, 0x11, 0x00
	.byte 0x33, 0x00, 0x33, 0x00, 0x02, 0x02, 0x20, 0x02, 0x0A, 0x14, 0x22, 0x44, 0x11, 0x00, 0x34, 0x00
	.byte 0x34, 0x00, 0x03, 0x03, 0x28, 0x03, 0x0F, 0x14, 0x22, 0x44, 0x11, 0x00, 0x35, 0x00, 0x35, 0x00
	.byte 0x04, 0x04, 0x2C, 0x07, 0x14, 0x14, 0x11, 0x33, 0x11, 0x00, 0x36, 0x00, 0x36, 0x00, 0x05, 0x05
	.byte 0x28, 0x09, 0x19, 0x14, 0x22, 0x44, 0x11, 0x00, 0x37, 0x00, 0x37, 0x00, 0x06, 0x06, 0x25, 0x07
	.byte 0x1E, 0x14, 0x22, 0x44, 0x11, 0x00, 0x38, 0x00, 0x38, 0x00, 0x07, 0x07, 0x25, 0x0C, 0x23, 0x14
	.byte 0x22, 0x44, 0x11, 0x00, 0x39, 0x00, 0x39, 0x00, 0x08, 0x08, 0x20, 0x0F, 0x00, 0x18, 0x11, 0x33
	.byte 0x11, 0x00, 0x3A, 0x00, 0x3A, 0x00, 0x09, 0xFF, 0x1C, 0x06, 0x00, 0x00, 0x11, 0x00, 0x00, 0x00
	.byte 0x3B, 0x00, 0x3B, 0x00, 0x0A, 0x09, 0x28, 0x06, 0x05, 0x18, 0x22, 0x44, 0x11, 0x00, 0x3C, 0x00
	.byte 0x3C, 0x00, 0x0B, 0x0A, 0x15, 0x0C, 0x0B, 0x19, 0x11, 0x11, 0x00, 0x00, 0x43, 0x00, 0x43, 0x00
	.byte 0x0C, 0x0B, 0x10, 0x0C, 0x0F, 0x18, 0x12, 0x34, 0x11, 0x00, 0x49, 0x00, 0x49, 0x00, 0x0D, 0x0C
	.byte 0x0E, 0x07, 0x14, 0x18, 0x22, 0x43, 0x10, 0x00, 0x4A, 0x00, 0x4A, 0x00, 0x0E, 0x0D, 0x0C, 0x0E
	.byte 0x19, 0x18, 0x12, 0x34, 0x11, 0x00, 0x4B, 0x00, 0x4B, 0x00, 0x0F, 0x0E, 0x05, 0x0A, 0x1E, 0x18
	.byte 0x21, 0x43, 0x11, 0x00, 0x4C, 0x00, 0x4C, 0x00, 0x10, 0x0F, 0x09, 0x0A, 0x23, 0x18, 0x23, 0x45
	.byte 0x11, 0x00, 0x4D, 0x00, 0x4D, 0x00, 0x11, 0x10, 0x08, 0x07, 0x00, 0x1C, 0x22, 0x44, 0x11, 0x00
	.byte 0x4E, 0x00, 0x4E, 0x00, 0x12, 0x11, 0x0B, 0x04, 0x05, 0x1C, 0x22, 0x44, 0x11, 0x00, 0x57, 0x00
	.byte 0x57, 0x00, 0x13, 0x12, 0x10, 0x05, 0x0A, 0x1C, 0x11, 0x33, 0x11, 0x00, 0x59, 0x00, 0x59, 0x00
	.byte 0x15, 0x13, 0x14, 0x04, 0x0F, 0x1C, 0x22, 0x44, 0x11, 0x00, 0x58, 0x00, 0x58, 0x00, 0x14, 0xFF
	.byte 0x0F, 0x01, 0x00, 0x00, 0x23, 0x00, 0x00, 0x00, 0x5A, 0x00, 0x5A, 0x00, 0x16, 0xFF, 0x19, 0x08
	.byte 0x00, 0x00, 0x11, 0x00, 0x00, 0x00, 0xAE, 0x00, 0xAE, 0x00, 0x1E, 0xFF, 0x02, 0x08, 0x00, 0x00
	.byte 0x22, 0x00, 0x00, 0x00, 0x10, 0x01, 0x9B, 0x01, 0x1B, 0xFF, 0x06, 0x06, 0x00, 0x00, 0x22, 0x00
	.byte 0x00, 0x00, 0x60, 0x00, 0x18, 0x01, 0x23, 0xFF, 0x0A, 0x06, 0x00, 0x00, 0x22, 0x00, 0x00, 0x00
	.byte 0x7C, 0x00, 0x1E, 0x00, 0x21, 0xFF, 0x1C, 0x07, 0x00, 0x00, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00

ov101_021F7B30: ; 0x021F7B30
	.byte 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x48, 0x54, 0xEE, 0x12, 0xF4, 0x06

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

ov101_021F820C: ; 0x021F820C
	.byte 0x00, 0x00, 0x02, 0x01
	.byte 0x03, 0x03, 0x30, 0x2C, 0xEA, 0x16, 0xEE, 0x12, 0x01, 0x00, 0x00, 0x02, 0x04, 0x04, 0x80, 0x2C
	.byte 0xEA, 0x16, 0xEE, 0x12, 0x02, 0x00, 0x01, 0x00, 0x05, 0x05, 0xD0, 0x2C, 0xEA, 0x16, 0xEE, 0x12
	.byte 0x03, 0x00, 0x05, 0x04, 0x00, 0x00, 0x30, 0x74, 0xEA, 0x16, 0xEE, 0x12, 0x04, 0x00, 0x03, 0x05
	.byte 0x01, 0x01, 0x80, 0x74, 0xEA, 0x16, 0xEE, 0x12, 0x05, 0x00, 0x04, 0x03, 0x02, 0x02, 0xD0, 0x74
	.byte 0xEA, 0x16, 0xEE, 0x12

ov101_021F8254: ; 0x021F8254
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x04, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1D, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1C, 0x00
	.byte 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1C, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov101_021F82FC: ; 0x021F82FC
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x01, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov101_021F83C4: ; 0x021F83C4
	.byte 0x03, 0x00, 0x01, 0x0A, 0x01, 0x01, 0x1C, 0x00, 0x01, 0x00, 0x40, 0x00

ov101_021F83D0: ; 0x021F83D0
	.byte 0x0A

ov101_021F83D1: ; 0x021F83D1
	.byte 0x02

ov101_021F83D2: ; 0x021F83D2
	.byte 0x00, 0x14, 0x02, 0x00, 0x16, 0x02, 0x02, 0x0A, 0x0B, 0x00, 0x14, 0x0B, 0x00, 0x16
	.byte 0x0B, 0x02, 0x00, 0x00

ov101_021F83E4: ; 0x021F83E4
	.byte 0x18, 0x40, 0x18, 0x48, 0x18, 0x40, 0x68, 0x98, 0x18, 0x40, 0xB8, 0xE8
	.byte 0x60, 0x88, 0x18, 0x48, 0x60, 0x88, 0x68, 0x98, 0x60, 0x88, 0xB8, 0xE8, 0xFF, 0x00, 0x00, 0x00

ov101_021F8400: ; 0x021F8400
	.byte 0x88, 0xB8, 0x08, 0xF8

ov101_021F8404: ; 0x021F8404
	.byte 0x83, 0x00

ov101_021F8406: ; 0x021F8406
	.byte 0x0D

ov101_021F8407: ; 0x021F8407
	.byte 0x09, 0x85, 0x03, 0x0D, 0x03, 0xB2, 0x08, 0x07, 0x0B
	.byte 0xB2, 0x0A, 0x07, 0x0B, 0xB3, 0x0C, 0x07, 0x09, 0xB2, 0x0F, 0x07, 0x0B, 0x82, 0x12, 0x0D, 0x0B

ov101_021F8420: ; 0x021F8420
	.byte 0x06, 0x02, 0x13, 0x1B, 0x04, 0x01, 0x75, 0x03, 0x06, 0x04, 0x10, 0x09, 0x02, 0x01, 0x63, 0x03
	.byte 0x03, 0x01, 0x02, 0x1B, 0x18, 0x02, 0x77, 0x01, 0x01, 0x00, 0x15, 0x20, 0x02, 0x0A, 0xBF, 0x03

ov101_021F8440: ; 0x021F8440
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x00
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1C, 0x04, 0x00, 0x03, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1D, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1C, 0x00
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov101_021F84E8: ; 0x021F84E8
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x04, 0x00, 0x01, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x7C, 0x00, 0x08, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x7C, 0x00, 0x9C, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x07, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov101_021F85D8: ; 0x021F85D8
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x06, 0x00, 0x01, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov101_021F8600: ; 0x021F8600
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0xA0, 0x00, 0x00, 0x00, 0x08, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov101_021F8628: ; 0x021F8628
	.byte 0x03, 0x00, 0x01, 0x0D, 0x00, 0x00, 0x04, 0x03
	.byte 0xA4, 0x03, 0xA0, 0x00

ov101_021F8634: ; 0x021F8634
	.byte 0x08, 0x20, 0x08, 0xE0, 0x20, 0x38, 0x08, 0xE0, 0x38, 0x50, 0x08, 0xE0
	.byte 0x50, 0x68, 0x08, 0xE0, 0x68, 0x80, 0x08, 0xE0, 0x80, 0x98, 0x08, 0xE0, 0x08, 0x50, 0xE0, 0xF8
	.byte 0x50, 0x98, 0xE0, 0xF8, 0xFF, 0x00, 0x00, 0x00

ov101_021F8658: ; 0x021F8658
	.byte 0x08, 0x18, 0x04, 0x24, 0x20, 0x30, 0x04, 0x24
	.byte 0x38, 0x48, 0x04, 0x24, 0x50, 0x60, 0x04, 0x24, 0x68, 0x78, 0x04, 0x24, 0x80, 0x90, 0x04, 0x24
	.byte 0x08, 0x50, 0xE0, 0xF8, 0x50, 0x98, 0xE0, 0xF8, 0xFF, 0x00, 0x00, 0x00

ov101_021F867C: ; 0x021F867C
	.word ov101_021F2680
	.word ov101_021F2F50
	.word ov101_021F2FFC
	.word ov101_021F35EC
	.word GearPhoneCall_Mom
	.word ov101_021F313C
	.word ov101_021F38FC
	.word ov101_021F3798
	.word ov101_021F3B20
	.word ov101_021F3BA0
	.word ov101_021F3CC0
	.word ov101_021F3DC8
	.word ov101_021F3448
	.word ov101_021F3F10
	.word ov101_021F4064
	.word ov101_021F41B8

ov101_021F86BC: ; 0x021F86BC
	.byte 0x00

ov101_021F86BD: ; 0x021F86BD
	.byte 0x02, 0x00, 0x03
	.byte 0x00, 0x04, 0x00, 0x05, 0x00, 0x06, 0x00, 0x00

ov101_021F86C8: ; 0x021F86C8
	.byte 0x66, 0x00, 0x65, 0x00

ov101_021F86CC: ; 0x021F86CC
	.byte 0x09, 0x00, 0x0A, 0x00
	.byte 0x0B, 0x00, 0x0C, 0x00, 0x0D, 0x00, 0x0E, 0x00, 0x0F, 0x00, 0x10, 0x00, 0x11, 0x00, 0x12, 0x00
	.byte 0x13, 0x00, 0x14, 0x00, 0x15, 0x00, 0x16, 0x00, 0x17, 0x00, 0x18, 0x00, 0x19, 0x00, 0x1A, 0x00
	.byte 0x5B, 0x00, 0x5C, 0x00, 0x5D, 0x00, 0x1B, 0x00, 0x1C, 0x00, 0x1D, 0x00, 0x1E, 0x00, 0x1F, 0x00
	.byte 0x20, 0x00, 0x21, 0x00, 0x22, 0x00, 0x23, 0x00, 0x24, 0x00, 0x25, 0x00, 0x26, 0x00, 0x27, 0x00
	.byte 0x28, 0x00, 0x29, 0x00, 0x2A, 0x00, 0x2B, 0x00, 0x5E, 0x00, 0x5F, 0x00, 0x2C, 0x00, 0x2D, 0x00
	.byte 0x2E, 0x00, 0x2F, 0x00, 0x30, 0x00, 0x97, 0x00, 0x98, 0x00, 0x31, 0x00, 0x32, 0x00, 0x33, 0x00
	.byte 0x34, 0x00, 0x35, 0x00, 0x36, 0x00, 0x37, 0x00, 0x38, 0x00, 0x39, 0x00, 0x3A, 0x00, 0x3B, 0x00
	.byte 0x3C, 0x00, 0x43, 0x00, 0x49, 0x00, 0x4A, 0x00, 0x4B, 0x00, 0x4C, 0x00, 0x4D, 0x00, 0x4E, 0x00
	.byte 0x57, 0x00, 0x58, 0x00, 0x59, 0x00, 0x5A, 0x00, 0x60, 0x00, 0x71, 0x00, 0xAE, 0x00, 0x00, 0x00

ov101_021F8760: ; 0x021F8760
	.byte 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03
	.byte 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x02, 0x02, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x03
	.byte 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x02, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00

	; file boundary

ov101_021F87AC: ; 0x021F87AC
	.byte 0x05, 0x11, 0x00, 0x00

ov101_021F87B0:
	.byte 0x3B, 0x01, 0x43, 0x01, 0xEA, 0x01, 0xEB, 0x01, 0xEC, 0x01

ov101_021F87BA:
	.byte 0x57, 0x00, 0x85, 0x00, 0x8C, 0x00
	.byte 0x8C, 0x01, 0x8D, 0x01, 0xF6, 0x00, 0x70, 0x01, 0x74, 0x00, 0xF7, 0x00, 0xF8, 0x00, 0xF9, 0x00
	.byte 0x2D, 0x00, 0x8E, 0x00, 0xF5, 0x00, 0x58, 0x00, 0x26, 0x01, 0x27, 0x01

ov101_021F87DC: ; 0x021F87DC
	.byte 0x06, 0x02, 0x13, 0x1C
	.byte 0x04, 0x00, 0x8F, 0x03, 0x06, 0x04, 0x10, 0x0E, 0x02, 0x00, 0x73, 0x03, 0x01, 0x05, 0x01, 0x16
	.byte 0x02, 0x00, 0xD3, 0x03

ov101_021F87F4: ; 0x021F87F4
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1D, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1C, 0x00
	.byte 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1C, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov101_021F889C: ; 0x021F889C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x01, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

	; file boundary

ov101_021F8964:
	.byte 0xFF, 0x00, 0x00, 0x00

ov101_021F8968: ; 0x021F8968
	.byte 0xFE, 0x80, 0x5C, 0x34

ov101_021F896C:
	.byte 0xFE, 0x80, 0x5C, 0x26
	.byte 0xFE, 0x80, 0x5C, 0x34, 0xFF, 0x00, 0x00, 0x00

ov101_021F8978:
	.byte 0xFE, 0x80, 0x5C, 0x04, 0xFE, 0x80, 0x5C, 0x10
	.byte 0xFF, 0x00, 0x00, 0x00

ov101_021F8984: ; 0x021F8984
	.byte 0x30, 0x4C, 0x10, 0x30, 0x30, 0x4C, 0xD0, 0xF0, 0x70, 0x8C, 0x10, 0x30
	.byte 0x70, 0x8C, 0xD0, 0xF0, 0xFF, 0x00, 0x00, 0x00

ov101_021F8998:
	.byte 0xFE, 0x70, 0x4C, 0x04, 0xFE, 0x70, 0x4C, 0x10
	.byte 0xFE, 0x98, 0x4C, 0x04, 0xFE, 0x98, 0x4C, 0x14, 0xFE, 0x60, 0x6C, 0x04, 0xFE, 0x60, 0x6C, 0x10
	.byte 0xFF, 0x00, 0x00, 0x00

ov101_021F89B4:
	.byte 0xFE, 0x70, 0x4C, 0x04, 0xFE, 0x70, 0x4C, 0x10, 0xFE, 0x98, 0x4C, 0x04
	.byte 0xFE, 0x98, 0x4C, 0x14, 0xFE, 0x60, 0x6C, 0x04, 0xFE, 0x60, 0x6C, 0x10, 0xFE, 0x88, 0x74, 0x04
	.byte 0xFE, 0x88, 0x74, 0x14, 0xFF, 0x00, 0x00, 0x00

ov101_021F89D8:
	.byte 0xFE, 0x70, 0x4C, 0x04, 0xFE, 0x70, 0x4C, 0x10
	.byte 0xFE, 0x98, 0x4C, 0x04, 0xFE, 0x98, 0x4C, 0x14, 0xFE, 0x60, 0x6C, 0x04, 0xFE, 0x60, 0x6C, 0x10
	.byte 0xFE, 0x88, 0x74, 0x04, 0xFE, 0x88, 0x74, 0x14, 0xFE, 0x80, 0x30, 0x04, 0xFE, 0x80, 0x30, 0x08
	.byte 0xFF, 0x00, 0x00, 0x00

ov101_021F8A04: ; 0x021F8A04
	.word RadioShow_PokemonMusic_setup, RadioShow_PokemonMusic_print, RadioShow_PokemonMusic_teardown ; RADIO_STATION_POKEMON_MUSIC
	.word RadioShow_PokemonTalk_setup, RadioShow_PokemonTalk_print, RadioShow_PokemonTalk_teardown ; RADIO_STATION_POKEMON_TALK
	.word RadioShow_PokemonSearchParty_setup, RadioShow_PokemonSearchParty_print, RadioShow_PokemonSearchParty_teardown ; RADIO_STATION_POKEMON_SEARCH_PARTY
	.word RadioShow_SerialRadioDrama_setup, RadioShow_SerialRadioDrama_print, RadioShow_SerialRadioDrama_teardown ; RADIO_STATION_SERIAL_RADIO_DRAMA
	.word RadioShow_BuenasPassword_setup, RadioShow_BuenasPassword_print, RadioShow_BuenasPassword_teardown ; RADIO_STATION_BUENAS_PASSWORD
	.word RadioShow_TrainerProfiles_setup, RadioShow_TrainerProfiles_print, RadioShow_TrainerProfiles_teardown ; RADIO_STATION_TRAINER_PROFILES
	.word RadioShow_ThatTownThesePeople_setup, RadioShow_ThatTownThesePeople_print, RadioShow_ThatTownThesePeople_teardown ; RADIO_STATION_THAT_TOWN_THESE_PEOPLE
	.word RadioShow_PokeFlute_setup, RadioShow_PokeFlute_print, RadioShow_PokeFlute_teardown ; RADIO_STATION_POKE_FLUTE
	.word RadioShow_Unown_setup, RadioShow_Unown_print, RadioShow_Unown_teardown ; RADIO_STATION_UNOWN
	.word RadioShow_TeamRocket_setup, RadioShow_TeamRocket_print, RadioShow_TeamRocket_teardown ; RADIO_STATION_TEAM_ROCKET
	.word RadioShow_MahoganySignal_setup, RadioShow_MahoganySignal_print, RadioShow_MahoganySignal_teardown ; RADIO_STATION_MAHOGANY_SIGNAL
	.word RadioShow_Commercials_setup, RadioShow_Commercials_print, RadioShow_Commercials_teardown ; RADIO_STATION_COMMERCIALS
	; file boundary
ov101_021F8A94:
	.short SEQ_GS_RADIO_MARCH, SEQ_GS_RADIO_KOMORIUTA, SEQ_GS_RADIO_R_101, SEQ_GS_RADIO_R_201
ov101_021F8A9C:
	.short SEQ_GS_P_TITLE, SEQ_GS_P_OPENING_TITLE_G, SEQ_GS_P_ENDING, SEQ_GS_P_ENDING2
ov101_021F8AA4:
	.byte 0x1A, 0x05, 0x25, 0x05, 0x26, 0x05, 0x27, 0x05, 0x28, 0x05, 0x29, 0x05
	.byte 0x2A, 0x05, 0x2B, 0x05, 0x2C, 0x05, 0x2D, 0x05, 0x2E, 0x05, 0x2F, 0x05, 0x34, 0x05, 0x24, 0x05
	.byte 0x1E, 0x05, 0x23, 0x05, 0x20, 0x05, 0x1F, 0x05, 0x22, 0x05, 0xC6, 0x04, 0xFF, 0x04, 0x00, 0x00

ov101_021F8AD0: ; 0x021F8AD0
	.byte 0x00, 0x03, 0xFF, 0x00, 0x03, 0xFF, 0x00, 0x03, 0xFF, 0x00, 0x03, 0xFF, 0x00, 0x03, 0xFF, 0x00
	.byte 0x01, 0xFF, 0x00, 0x01, 0xFF, 0x00, 0x01, 0xFF, 0x00, 0x01, 0xFF, 0x00, 0x03, 0x02, 0x00, 0x03
	.byte 0x02, 0x01, 0x03, 0xFF, 0x01, 0x03, 0xFF, 0x01, 0x03, 0xFF, 0x01, 0x03, 0xFF, 0x02, 0x01, 0x03
	.byte 0x02, 0x01, 0x03, 0x02, 0x01, 0x03, 0x02, 0x01, 0x02, 0x02, 0x01, 0x02, 0x02, 0x03, 0x02, 0x03
	.byte 0x03, 0x02, 0x03, 0x01, 0x03, 0x04, 0x03, 0x01, 0x04, 0x03, 0x01, 0x04, 0x03, 0x01, 0x04, 0x03
	.byte 0x01, 0x04, 0x03, 0x01, 0x04, 0x03, 0x01, 0x05, 0x03, 0x03, 0x06, 0x02, 0x03, 0x06, 0x02, 0x03
	.byte 0x06, 0x02, 0x03, 0x06, 0x02, 0x03, 0x06, 0x02, 0x03, 0x07, 0x03, 0x03

ov101_021F8B3C: ; 0x021F8B3C
	.byte 0x00, 0x00, 0x01, 0x02
	.byte 0x03, 0x04, 0x05, 0x06, 0x06, 0x06, 0x07, 0x07, 0x07, 0x00, 0x00, 0x00

ov101_021F8B4C: ; 0x021F8B4C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x01, 0x02, 0x03, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04

ov101_021F8B60: ; 0x021F8B60
	.byte 0xC1, 0x01, 0x01, 0x02, 0xE7, 0x01, 0x3B, 0x01, 0xEA, 0x01, 0xEB, 0x01, 0xEC, 0x01, 0xED, 0x00
	.byte 0xEE, 0x00, 0xEF, 0x00, 0xF2, 0x00, 0xF3, 0x00, 0x2A, 0x01, 0x65, 0x01

ov101_021F8B7C: ; 0x021F8B7C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x01, 0x02, 0x00, 0x00, 0x00, 0x00, 0x21, 0x22, 0x00, 0x00, 0x00, 0x00, 0x23, 0x24
	.byte 0x00, 0x00, 0x00, 0x00, 0x25, 0x26, 0x00, 0x00, 0x00, 0x00, 0x27, 0x28, 0x00, 0x00, 0x00, 0x00
	.byte 0x29, 0x2A, 0x00, 0x00, 0x00, 0x00, 0x2B, 0x2C, 0x00, 0x00, 0x00, 0x00, 0x03, 0x04, 0x00, 0x00
	.byte 0x00, 0x00, 0x05, 0x06, 0x00, 0x00, 0x00, 0x00, 0x07, 0x08, 0x00, 0x00, 0x00, 0x00, 0x09, 0x0A
	.byte 0x00, 0x00, 0x00, 0x00, 0x0B, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x0D, 0x0E, 0x00, 0x00, 0x00, 0x00
	.byte 0x0F, 0x10, 0x00, 0x00, 0x00, 0x00, 0x11, 0x12, 0x00, 0x00, 0x00, 0x00, 0x13, 0x14, 0x00, 0x00
	.byte 0x00, 0x00, 0x15, 0x16, 0x00, 0x00, 0x00, 0x00, 0x17, 0x18, 0x00, 0x00, 0x00, 0x00, 0x19, 0x1A
	.byte 0x00, 0x00, 0x00, 0x00, 0x1B, 0x1C, 0x00, 0x00, 0x00, 0x00, 0x1D, 0x1E, 0x00, 0x00, 0x00, 0x00
	.byte 0x1F, 0x20, 0x00, 0x00, 0x00, 0x00, 0x01, 0x02, 0x00, 0x00, 0x00, 0x00, 0x03, 0x03, 0x00, 0x00
	.byte 0x00, 0x00, 0x05, 0x05, 0x00, 0x00, 0x00, 0x00, 0x06, 0x06, 0x00, 0x00, 0x00, 0x00, 0x1D, 0x1D
	.byte 0x00, 0x00, 0x00, 0x00, 0x16, 0x16, 0x00, 0x00, 0x00, 0x00, 0x06, 0x06, 0x00, 0x00, 0x00, 0x00
	.byte 0x07, 0x07, 0x00, 0x00, 0x00, 0x00, 0x08, 0x08, 0x00, 0x00, 0x00, 0x00, 0x09, 0x09, 0x00, 0x00
	.byte 0x00, 0x00, 0x0A, 0x0A, 0x13, 0x00, 0x00, 0x00, 0x0B, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x0C
	.byte 0x00, 0x00, 0x00, 0x00, 0x06, 0x06, 0x00, 0x00, 0x00, 0x00, 0x07, 0x07, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x08, 0x00, 0x00, 0x00, 0x00, 0x09, 0x09, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x0A, 0x13, 0x00
	.byte 0x00, 0x00, 0x0B, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x0D, 0x0D
	.byte 0x14, 0x00, 0x95, 0x00, 0x0E, 0x0E, 0x00, 0x00, 0x00, 0x00, 0x0F, 0x10, 0x00, 0x00, 0x00, 0x00
	.byte 0x05, 0x05, 0x00, 0x00, 0x00, 0x00, 0x06, 0x06, 0x00, 0x00, 0x00, 0x00, 0x07, 0x07, 0x00, 0x00
	.byte 0x00, 0x00, 0x08, 0x08, 0x00, 0x00, 0x00, 0x00, 0x09, 0x09, 0x13, 0x00, 0x00, 0x00, 0x0A, 0x0A
	.byte 0x00, 0x00, 0x00, 0x00, 0x0B, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x05, 0x05, 0x00, 0x00, 0x00, 0x00
	.byte 0x06, 0x06, 0x00, 0x00, 0x00, 0x00, 0x07, 0x07, 0x00, 0x00, 0x00, 0x00, 0x15, 0x15, 0x00, 0x00
	.byte 0x00, 0x00, 0x13, 0x13, 0x13, 0x00, 0x00, 0x00, 0x14, 0x14, 0x00, 0x00, 0x00, 0x00, 0x08, 0x08
	.byte 0x95, 0x00, 0x17, 0x00, 0x16, 0x16, 0x00, 0x00, 0x00, 0x00, 0x05, 0x05, 0x00, 0x00, 0x00, 0x00
	.byte 0x06, 0x06, 0x00, 0x00, 0x00, 0x00, 0x07, 0x07, 0x00, 0x00, 0x00, 0x00, 0x08, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x09, 0x09, 0x13, 0x00, 0x00, 0x00, 0x0A, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x0B, 0x0B
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x02, 0x00, 0x00, 0x00, 0x00, 0x03, 0x03, 0x12, 0x00, 0x89, 0x09
	.byte 0x04, 0x04, 0x12, 0x00, 0x8A, 0x09, 0x05, 0x05, 0x12, 0x00, 0x8B, 0x09, 0x06, 0x06, 0x12, 0x00
	.byte 0x8C, 0x09, 0x07, 0x07, 0x12, 0x00, 0x8D, 0x09, 0x08, 0x08, 0x12, 0x00, 0x8E, 0x09, 0x09, 0x09
	.byte 0x12, 0x00, 0x8F, 0x09, 0x0A, 0x0A, 0x12, 0x00, 0x90, 0x09, 0x0B, 0x0B, 0x12, 0x00, 0x91, 0x09
	.byte 0x16, 0x17, 0x00, 0x00, 0x00, 0x00, 0x18, 0x19, 0x00, 0x00, 0x00, 0x00, 0x1A, 0x1A, 0x00, 0x00
	.byte 0x00, 0x00, 0x1B, 0x1B, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x02, 0x00, 0x00, 0x00, 0x00, 0x03, 0x03, 0x12, 0x00, 0x84, 0x09
	.byte 0x07, 0x07, 0x00, 0x00, 0x00, 0x00, 0x08, 0x08, 0x00, 0x00, 0x00, 0x00, 0x09, 0x09, 0x00, 0x00
	.byte 0x00, 0x00, 0x0A, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x0B, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x0C
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x02, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x0B, 0x12, 0x00, 0x85, 0x09
	.byte 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x0C, 0x12, 0x00, 0x92, 0x09, 0x0D, 0x0D, 0x00, 0x00
	.byte 0x00, 0x00, 0x01, 0x02, 0x00, 0x00, 0x00, 0x00, 0x01, 0x02, 0x00, 0x00, 0x00, 0x00, 0x0D, 0x0E
	.byte 0x00, 0x00, 0x00, 0x00, 0x09, 0x09, 0x00, 0x00, 0x00, 0x00, 0x03, 0x03, 0x00, 0x00, 0x00, 0x00
	.byte 0x03, 0x03, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x06, 0x06, 0x00, 0x00
	.byte 0x00, 0x00, 0x07, 0x07, 0x00, 0x00, 0x00, 0x00, 0x08, 0x08, 0x00, 0x00, 0x00, 0x00, 0x09, 0x09
	.byte 0x00, 0x00, 0x00, 0x00, 0x0A, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x15, 0x15, 0x13, 0x00, 0x00, 0x00
	.byte 0x16, 0x17, 0x00, 0x00, 0x00, 0x00, 0x18, 0x18, 0x00, 0x00, 0x00, 0x00, 0x05, 0x05, 0x00, 0x00
	.byte 0x00, 0x00, 0x06, 0x06, 0x00, 0x00, 0x00, 0x00, 0x07, 0x07, 0x00, 0x00, 0x00, 0x00, 0x08, 0x08
	.byte 0x00, 0x00, 0x00, 0x00, 0x14, 0x14, 0x13, 0x00, 0x00, 0x00, 0x09, 0x09, 0x00, 0x00, 0x00, 0x00
	.byte 0x15, 0x15, 0x00, 0x00, 0x00, 0x00, 0x16, 0x16, 0x00, 0x00, 0x00, 0x00, 0x06, 0x06, 0x00, 0x00
	.byte 0x00, 0x00, 0x07, 0x07, 0x00, 0x00, 0x00, 0x00, 0x08, 0x08, 0x00, 0x00, 0x00, 0x00, 0x09, 0x09
	.byte 0x00, 0x00, 0x00, 0x00, 0x0A, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x15, 0x15, 0x13, 0x00, 0x00, 0x00
	.byte 0x16, 0x16, 0x00, 0x00, 0x00, 0x00, 0x17, 0x17, 0x00, 0x00, 0x00, 0x00, 0x05, 0x05, 0x00, 0x00
	.byte 0x00, 0x00, 0x06, 0x06, 0x00, 0x00, 0x00, 0x00, 0x07, 0x07, 0x00, 0x00, 0x00, 0x00, 0x08, 0x08
	.byte 0x13, 0x00, 0x00, 0x00, 0x09, 0x09, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x0A, 0x00, 0x00, 0x00, 0x00
	.byte 0x05, 0x05, 0x00, 0x00, 0x00, 0x00, 0x06, 0x06, 0x00, 0x00, 0x00, 0x00, 0x07, 0x07, 0x00, 0x00
	.byte 0x00, 0x00, 0x08, 0x08, 0x13, 0x00, 0x00, 0x00, 0x09, 0x09, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x0A
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x02, 0x03, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x05, 0x00, 0x00, 0x00, 0x00, 0x06, 0x07, 0x00, 0x00, 0x00, 0x00, 0x08, 0x09, 0x00, 0x00
	.byte 0x00, 0x00, 0x0A, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x0D, 0x00, 0x00, 0x00, 0x00, 0x1A, 0x1B
	.byte 0x00, 0x00, 0x00, 0x00, 0x1C, 0x1D, 0x00, 0x00, 0x00, 0x00, 0x1E, 0x1F, 0x00, 0x00, 0x00, 0x00
	.byte 0x20, 0x21, 0x00, 0x00, 0x00, 0x00, 0x22, 0x23, 0x00, 0x00, 0x00, 0x00, 0x24, 0x25, 0x00, 0x00
	.byte 0x00, 0x00, 0x26, 0x27, 0x00, 0x00, 0x00, 0x00, 0x28, 0x29, 0x00, 0x00, 0x00, 0x00, 0x05, 0x05
	.byte 0x00, 0x00, 0x00, 0x00, 0x06, 0x07, 0x00, 0x00, 0x00, 0x00, 0x08, 0x09, 0x00, 0x00, 0x00, 0x00
	.byte 0x0A, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x0D, 0x00, 0x00, 0x00, 0x00, 0x0E, 0x0F, 0x00, 0x00
	.byte 0x00, 0x00, 0x10, 0x11, 0x00, 0x00, 0x00, 0x00, 0x12, 0x13, 0x00, 0x00, 0x00, 0x00, 0x14, 0x15
	.byte 0x00, 0x00, 0x00, 0x00, 0x16, 0x17, 0x00, 0x00, 0x00, 0x00, 0x18, 0x19, 0x00, 0x00, 0x00, 0x00
	.byte 0x1A, 0x1B, 0x00, 0x00, 0x00, 0x00, 0x1C, 0x1D, 0x00, 0x00, 0x00, 0x00, 0x1E, 0x1F, 0x00, 0x00
	.byte 0x00, 0x00, 0x20, 0x21, 0x00, 0x00, 0x00, 0x00, 0x22, 0x23, 0x00, 0x00, 0x00, 0x00, 0x24, 0x25
	.byte 0x00, 0x00, 0x00, 0x00, 0x26, 0x26, 0x00, 0x00, 0x00, 0x00, 0x27, 0x27, 0x00, 0x00, 0x00, 0x00
	.byte 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00
	.byte 0x06, 0x06, 0x00, 0x00, 0x00, 0x00, 0x07, 0x07, 0x00, 0x00, 0x00, 0x00, 0x08, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x09, 0x09, 0x13, 0x00, 0x00, 0x00, 0x0A, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x0B, 0x0B
	.byte 0x00, 0x00, 0x00, 0x00, 0x06, 0x06, 0x00, 0x00, 0x00, 0x00, 0x07, 0x07, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x08, 0x00, 0x00, 0x00, 0x00, 0x09, 0x09, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x0A, 0x13, 0x00
	.byte 0x00, 0x00, 0x0B, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x0D, 0x0D, 0x00, 0x00, 0x00, 0x00, 0x06, 0x06
	.byte 0x00, 0x00, 0x00, 0x00, 0x07, 0x07, 0x00, 0x00, 0x00, 0x00, 0x08, 0x08, 0x00, 0x00, 0x00, 0x00
	.byte 0x09, 0x09, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x0A, 0x13, 0x00, 0x00, 0x00, 0x0B, 0x0C, 0x00, 0x00
	.byte 0x00, 0x00, 0x0D, 0x0D, 0x00, 0x00, 0x00, 0x00, 0x06, 0x06, 0x00, 0x00, 0x00, 0x00, 0x07, 0x07
	.byte 0x00, 0x00, 0x00, 0x00, 0x08, 0x08, 0x00, 0x00, 0x00, 0x00, 0x09, 0x09, 0x00, 0x00, 0x00, 0x00
	.byte 0x0A, 0x0A, 0x13, 0x00, 0x00, 0x00, 0x0B, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x0C, 0x00, 0x00
	.byte 0x00, 0x00, 0x06, 0x06, 0x00, 0x00, 0x00, 0x00, 0x07, 0x07, 0x00, 0x00, 0x00, 0x00, 0x08, 0x08
	.byte 0x00, 0x00, 0x00, 0x00, 0x09, 0x09, 0x13, 0x00, 0x00, 0x00, 0x0A, 0x0B, 0x00, 0x00, 0x00, 0x00
	.byte 0x0C, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x06, 0x06, 0x00, 0x00, 0x00, 0x00, 0x07, 0x07, 0x00, 0x00
	.byte 0x00, 0x00, 0x08, 0x08, 0x00, 0x00, 0x00, 0x00, 0x09, 0x09, 0x13, 0x00, 0x00, 0x00, 0x0A, 0x0A
	.byte 0x00, 0x00, 0x00, 0x00, 0x0B, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x06, 0x06, 0x00, 0x00, 0x00, 0x00
	.byte 0x07, 0x07, 0x00, 0x00, 0x00, 0x00, 0x08, 0x08, 0x00, 0x00, 0x00, 0x00, 0x09, 0x09, 0x00, 0x00
	.byte 0x00, 0x00, 0x0A, 0x0A, 0x13, 0x00, 0x00, 0x00, 0x0B, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x0C
	.byte 0x00, 0x00, 0x00, 0x00, 0x06, 0x06, 0x00, 0x00, 0x00, 0x00, 0x07, 0x07, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x08, 0x00, 0x00, 0x00, 0x00, 0x0B, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x09, 0x09, 0x14, 0x00
	.byte 0x5C, 0x00, 0x0A, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x06, 0x06, 0x00, 0x00, 0x00, 0x00, 0x07, 0x07
	.byte 0x00, 0x00, 0x00, 0x00, 0x08, 0x08, 0x00, 0x00, 0x00, 0x00, 0x09, 0x09, 0x00, 0x00, 0x00, 0x00
	.byte 0x0A, 0x0A, 0x13, 0x00, 0x00, 0x00, 0x0B, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x0D, 0x0D, 0x00, 0x00
	.byte 0x00, 0x00, 0x0E, 0x0E, 0x14, 0x00, 0x5B, 0x00, 0x0F, 0x0F, 0x00, 0x00, 0x00, 0x00, 0x06, 0x06
	.byte 0x00, 0x00, 0x00, 0x00, 0x07, 0x07, 0x00, 0x00, 0x00, 0x00, 0x08, 0x08, 0x00, 0x00, 0x00, 0x00
	.byte 0x09, 0x09, 0x13, 0x00, 0x00, 0x00, 0x0A, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x0C, 0x00, 0x00
	.byte 0x00, 0x00, 0x0D, 0x0D, 0x14, 0x00, 0x55, 0x00, 0x0E, 0x0E, 0x00, 0x00, 0x00, 0x00, 0x0F, 0x0F
	.byte 0x00, 0x00, 0x00, 0x00, 0x06, 0x06, 0x00, 0x00, 0x00, 0x00, 0x07, 0x07, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x08, 0x00, 0x00, 0x00, 0x00, 0x09, 0x09, 0x13, 0x00, 0x00, 0x00, 0x0A, 0x0A, 0x00, 0x00
	.byte 0x00, 0x00, 0x0B, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x0C, 0x14, 0x00, 0x52, 0x00, 0x0D, 0x0D
	.byte 0x00, 0x00, 0x00, 0x00, 0x06, 0x06, 0x00, 0x00, 0x00, 0x00, 0x07, 0x07, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x08, 0x00, 0x00, 0x00, 0x00, 0x09, 0x09, 0x13, 0x00, 0x00, 0x00, 0x0A, 0x0A, 0x00, 0x00
	.byte 0x00, 0x00, 0x0B, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x0C, 0x14, 0x00, 0x53, 0x00, 0x0D, 0x0D
	.byte 0x00, 0x00, 0x00, 0x00, 0x06, 0x06, 0x00, 0x00, 0x00, 0x00, 0x07, 0x07, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x08, 0x00, 0x00, 0x00, 0x00, 0x09, 0x09, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x0A, 0x14, 0x00
	.byte 0x5C, 0x00, 0x0B, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x06, 0x06
	.byte 0x00, 0x00, 0x00, 0x00, 0x07, 0x07, 0x00, 0x00, 0x00, 0x00, 0x08, 0x08, 0x00, 0x00, 0x00, 0x00
	.byte 0x09, 0x09, 0x13, 0x00, 0x00, 0x00, 0x0A, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x0B, 0x0B, 0x00, 0x00
	.byte 0x00, 0x00, 0x0C, 0x0C, 0x14, 0x00, 0x54, 0x00, 0x0D, 0x0D, 0x00, 0x00, 0x00, 0x00, 0x06, 0x06
	.byte 0x00, 0x00, 0x00, 0x00, 0x09, 0x09, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x0A, 0x00, 0x00, 0x00, 0x00
	.byte 0x0B, 0x0B, 0x13, 0x00, 0x00, 0x00, 0x0C, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x07, 0x08, 0x65, 0x00
	.byte 0x10, 0x00, 0x0D, 0x0D, 0x00, 0x00, 0x00, 0x00, 0x0E, 0x0E, 0x14, 0x00, 0x3F, 0x00, 0x0F, 0x0F
	.byte 0x00, 0x00, 0x00, 0x00, 0x06, 0x06, 0x00, 0x00, 0x00, 0x00, 0x07, 0x07, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x08, 0x00, 0x00, 0x00, 0x00, 0x09, 0x09, 0x13, 0x00, 0x00, 0x00, 0x0A, 0x0A, 0x00, 0x00
	.byte 0x00, 0x00, 0x0B, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x0C, 0x14, 0x00, 0x04, 0x00, 0x0D, 0x0D
	.byte 0x00, 0x00, 0x00, 0x00, 0x05, 0x05, 0x00, 0x00, 0x00, 0x00, 0x06, 0x06, 0x00, 0x00, 0x00, 0x00
	.byte 0x07, 0x07, 0x00, 0x00, 0x00, 0x00, 0x08, 0x08, 0x00, 0x00, 0x00, 0x00, 0x09, 0x09, 0x13, 0x00
	.byte 0x00, 0x00, 0x0A, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x0B, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x06, 0x06
	.byte 0x00, 0x00, 0x00, 0x00, 0x07, 0x07, 0x00, 0x00, 0x00, 0x00, 0x08, 0x08, 0x00, 0x00, 0x00, 0x00
	.byte 0x09, 0x09, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x0A, 0x13, 0x00, 0x00, 0x00, 0x0B, 0x0B, 0x00, 0x00
	.byte 0x00, 0x00, 0x0C, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x05, 0x05, 0x00, 0x00, 0x00, 0x00, 0x06, 0x06
	.byte 0x00, 0x00, 0x00, 0x00, 0x07, 0x07, 0x00, 0x00, 0x00, 0x00, 0x08, 0x08, 0x00, 0x00, 0x00, 0x00
	.byte 0x09, 0x09, 0x13, 0x00, 0x00, 0x00, 0x0A, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x0B, 0x0B, 0x00, 0x00
	.byte 0x00, 0x00, 0x0C, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x05, 0x05, 0x00, 0x00, 0x00, 0x00, 0x06, 0x06
	.byte 0x00, 0x00, 0x00, 0x00, 0x07, 0x07, 0x00, 0x00, 0x00, 0x00, 0x08, 0x08, 0x00, 0x00, 0x00, 0x00
	.byte 0x09, 0x09, 0x13, 0x00, 0x00, 0x00, 0x0A, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x0B, 0x0B, 0x00, 0x00
	.byte 0x00, 0x00, 0x06, 0x06, 0x00, 0x00, 0x00, 0x00, 0x07, 0x07, 0x00, 0x00, 0x00, 0x00, 0x08, 0x08
	.byte 0x00, 0x00, 0x00, 0x00, 0x09, 0x09, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x0A, 0x13, 0x00, 0x00, 0x00
	.byte 0x0B, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x0D, 0x0D, 0x14, 0x00
	.byte 0x95, 0x00, 0x0E, 0x0E, 0x00, 0x00, 0x00, 0x00, 0x06, 0x06, 0x00, 0x00, 0x00, 0x00, 0x07, 0x07
	.byte 0x00, 0x00, 0x00, 0x00, 0x08, 0x08, 0x00, 0x00, 0x00, 0x00, 0x09, 0x09, 0x00, 0x00, 0x00, 0x00
	.byte 0x0A, 0x0A, 0x13, 0x00, 0x00, 0x00, 0x0B, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x0C, 0x00, 0x00
	.byte 0x00, 0x00, 0x0D, 0x0D, 0x14, 0x00, 0x95, 0x00, 0x0E, 0x0E, 0x00, 0x00, 0x00, 0x00, 0x05, 0x05
	.byte 0x00, 0x00, 0x00, 0x00, 0x06, 0x06, 0x00, 0x00, 0x00, 0x00, 0x07, 0x07, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x08, 0x00, 0x00, 0x00, 0x00, 0x09, 0x09, 0x13, 0x00, 0x00, 0x00, 0x0A, 0x0A, 0x00, 0x00
	.byte 0x00, 0x00, 0x0B, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x05, 0x05, 0x00, 0x00, 0x00, 0x00, 0x06, 0x06
	.byte 0x00, 0x00, 0x00, 0x00, 0x07, 0x07, 0x00, 0x00, 0x00, 0x00, 0x08, 0x08, 0x00, 0x00, 0x00, 0x00
	.byte 0x09, 0x09, 0x13, 0x00, 0x00, 0x00, 0x0A, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x0B, 0x0B, 0x00, 0x00
	.byte 0x00, 0x00, 0x05, 0x05, 0x00, 0x00, 0x00, 0x00, 0x06, 0x06, 0x00, 0x00, 0x00, 0x00, 0x07, 0x07
	.byte 0x00, 0x00, 0x00, 0x00, 0x08, 0x08, 0x00, 0x00, 0x00, 0x00, 0x09, 0x09, 0x13, 0x00, 0x00, 0x00
	.byte 0x0A, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x0B, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x05, 0x05, 0x00, 0x00
	.byte 0x00, 0x00, 0x06, 0x06, 0x00, 0x00, 0x00, 0x00, 0x07, 0x07, 0x00, 0x00, 0x00, 0x00, 0x08, 0x08
	.byte 0x00, 0x00, 0x00, 0x00, 0x09, 0x09, 0x13, 0x00, 0x00, 0x00, 0x0A, 0x0A, 0x00, 0x00, 0x00, 0x00
	.byte 0x0B, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x06, 0x06, 0x00, 0x00, 0x00, 0x00, 0x07, 0x07, 0x00, 0x00
	.byte 0x00, 0x00, 0x08, 0x08, 0x00, 0x00, 0x00, 0x00, 0x09, 0x09, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x0A
	.byte 0x13, 0x00, 0x00, 0x00, 0x0B, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x0C, 0x00, 0x00, 0x00, 0x00
	.byte 0x0D, 0x0D, 0x14, 0x00, 0x50, 0x00, 0x0E, 0x0E, 0x00, 0x00, 0x00, 0x00, 0x06, 0x06, 0x00, 0x00
	.byte 0x00, 0x00, 0x07, 0x07, 0x00, 0x00, 0x00, 0x00, 0x08, 0x08, 0x00, 0x00, 0x00, 0x00, 0x09, 0x09
	.byte 0x00, 0x00, 0x00, 0x00, 0x0A, 0x0A, 0x13, 0x00, 0x00, 0x00, 0x0B, 0x0B, 0x00, 0x00, 0x00, 0x00
	.byte 0x0C, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x0D, 0x0D, 0x14, 0x00, 0x6B, 0x00, 0x0E, 0x0E, 0x00, 0x00
	.byte 0x00, 0x00, 0x05, 0x05, 0x00, 0x00, 0x00, 0x00, 0x06, 0x06, 0x00, 0x00, 0x00, 0x00, 0x07, 0x07
	.byte 0x00, 0x00, 0x00, 0x00, 0x08, 0x08, 0x00, 0x00, 0x00, 0x00, 0x09, 0x09, 0x13, 0x00, 0x00, 0x00
	.byte 0x0A, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x0B, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x05, 0x05, 0x00, 0x00
	.byte 0x00, 0x00, 0x06, 0x06, 0x00, 0x00, 0x00, 0x00, 0x07, 0x07, 0x00, 0x00, 0x00, 0x00, 0x08, 0x08
	.byte 0x00, 0x00, 0x00, 0x00, 0x09, 0x09, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x0A, 0x13, 0x00, 0x00, 0x00
	.byte 0x0B, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x05, 0x05, 0x00, 0x00
	.byte 0x00, 0x00, 0x06, 0x06, 0x00, 0x00, 0x00, 0x00, 0x11, 0x11, 0x13, 0x00, 0x00, 0x00, 0x12, 0x12
	.byte 0x00, 0x00, 0x00, 0x00, 0x13, 0x13, 0x00, 0x00, 0x00, 0x00, 0x06, 0x06, 0x00, 0x00, 0x00, 0x00
	.byte 0x07, 0x07, 0x00, 0x00, 0x00, 0x00, 0x08, 0x08, 0x00, 0x00, 0x00, 0x00, 0x09, 0x09, 0x00, 0x00
	.byte 0x00, 0x00, 0x0A, 0x0A, 0x13, 0x00, 0x00, 0x00, 0x0B, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x0C
	.byte 0x00, 0x00, 0x00, 0x00, 0x0D, 0x0D, 0x14, 0x00, 0x6E, 0x00, 0x0E, 0x0E, 0x00, 0x00, 0x00, 0x00
	.byte 0x06, 0x06, 0x00, 0x00, 0x00, 0x00, 0x07, 0x07, 0x00, 0x00, 0x00, 0x00, 0x08, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x09, 0x09, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x0A, 0x13, 0x00, 0x00, 0x00, 0x0B, 0x0B
	.byte 0x00, 0x00, 0x00, 0x00, 0x0C, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x0D, 0x0D, 0x14, 0x00, 0x6C, 0x00
	.byte 0x0E, 0x0E, 0x00, 0x00, 0x00, 0x00, 0x06, 0x06, 0x00, 0x00, 0x00, 0x00, 0x07, 0x07, 0x00, 0x00
	.byte 0x00, 0x00, 0x08, 0x08, 0x00, 0x00, 0x00, 0x00, 0x09, 0x09, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x0A
	.byte 0x13, 0x00, 0x00, 0x00, 0x0B, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x0C, 0x00, 0x00, 0x00, 0x00
	.byte 0x0D, 0x0D, 0x14, 0x00, 0x6D, 0x00, 0x0E, 0x0E, 0x00, 0x00, 0x00, 0x00, 0x05, 0x05, 0x00, 0x00
	.byte 0x00, 0x00, 0x06, 0x06, 0x00, 0x00, 0x00, 0x00, 0x07, 0x07, 0x00, 0x00, 0x00, 0x00, 0x08, 0x08
	.byte 0x00, 0x00, 0x00, 0x00, 0x09, 0x09, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x0A, 0x13, 0x00, 0x00, 0x00
	.byte 0x0B, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x0C, 0x00, 0x00, 0x00, 0x00

ov101_021F962C: ; 0x021F962C
	.byte 0x00, 0x01, 0x02, 0x03
	.byte 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F, 0x10, 0x11, 0x12, 0x13
	.byte 0x14, 0x15, 0x16, 0x17, 0x48, 0x48, 0x49, 0x49, 0x4A, 0x4A, 0x48, 0x48, 0x49, 0x49, 0x4A, 0x4A
	.byte 0x4B, 0x4B, 0x4C, 0x4C, 0x4D, 0x4D, 0x4B, 0x4B, 0x4C, 0x4C, 0x4D, 0x4D, 0x18, 0x19, 0x1A, 0x1B
	.byte 0x1C, 0x1D, 0x1E, 0x1F, 0x20, 0x21, 0x22, 0x23, 0x24, 0x25, 0x26, 0x27, 0x28, 0x29, 0x2A, 0x2B
	.byte 0x2C, 0x2D, 0x2E, 0x2F, 0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39, 0x3A, 0x3B
	.byte 0x3C, 0x3D, 0x3E, 0x3F, 0x40, 0x41, 0x42, 0x43, 0x44, 0x45, 0x46, 0x47

ov101_021F968C: ; 0x021F968C
	.byte 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0x22, 0x00, 0x03, 0x64, 0x00, 0x00, 0x21, 0x00, 0x01, 0x64, 0x01, 0x00, 0x23, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x3C, 0x00, 0x00
	.byte 0x21, 0x00, 0x01, 0x28, 0x01, 0x00, 0x1E, 0x00, 0x01, 0x28, 0x01, 0x00, 0x1F, 0x00, 0x01, 0x64
	.byte 0x01, 0x00, 0x20, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0x33, 0x00, 0x03, 0x64, 0x00, 0x00, 0x32, 0x00, 0x01, 0x64, 0x00, 0x00, 0x34, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x32, 0x00, 0x00
	.byte 0x32, 0x00, 0x01, 0x28, 0x01, 0x00, 0x2F, 0x00, 0x01, 0x28, 0x01, 0x00, 0x30, 0x00, 0x01, 0x64
	.byte 0x01, 0x00, 0x31, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0x3A, 0x00, 0x03, 0x64, 0x00, 0x00, 0x39, 0x00, 0x01, 0x1E, 0x01, 0x00, 0x3C, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x19, 0x00, 0x00
	.byte 0x38, 0x00, 0x02, 0x19, 0x00, 0x00, 0x39, 0x00, 0x01, 0x64, 0x02, 0x00, 0x3B, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0x29, 0x00, 0x08, 0x64, 0x00, 0x00, 0x2C, 0x00, 0x03, 0x64, 0x00, 0x00, 0x28, 0x00, 0x04, 0x64
	.byte 0x00, 0x00, 0x2D, 0x00, 0x01, 0x64, 0x00, 0x00, 0x2A, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x64, 0x00, 0x00
	.byte 0x2C, 0x00, 0x07, 0x64, 0x00, 0x00, 0x29, 0x00, 0x02, 0x32, 0x00, 0x00, 0x2B, 0x00, 0x02, 0x32
	.byte 0x00, 0x00, 0x28, 0x00, 0x01, 0x28, 0x01, 0x00, 0x26, 0x00, 0x01, 0x28, 0x01, 0x00, 0x27, 0x00
	.byte 0x01, 0x64, 0x01, 0x00, 0x25, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0x42, 0x00, 0x03, 0x64, 0x00, 0x00, 0x41, 0x00, 0x01, 0x64, 0x00, 0x00, 0x43, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x32, 0x00, 0x00
	.byte 0x41, 0x00, 0x01, 0x28, 0x01, 0x00, 0x3E, 0x00, 0x01, 0x28, 0x01, 0x00, 0x3F, 0x00, 0x01, 0x64
	.byte 0x01, 0x00, 0x40, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0x6E, 0x00, 0x03, 0x64, 0x00, 0x00, 0x6D, 0x00, 0x01, 0x64, 0x00, 0x00, 0x6F, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x19, 0x00, 0x00
	.byte 0x6D, 0x00, 0x01, 0x64, 0x02, 0x00, 0x6C, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0x76, 0x00, 0x03, 0x64, 0x00, 0x00, 0x74, 0x00, 0x01, 0x64, 0x00, 0x00, 0x77, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x19, 0x00, 0x00
	.byte 0x74, 0x00, 0x01, 0x64, 0x02, 0x00, 0x75, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0x7E, 0x00, 0x03, 0x64, 0x00, 0x00, 0x7D, 0x00, 0x01, 0x64, 0x00, 0x00, 0x7F, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x19, 0x00, 0x00
	.byte 0x7D, 0x00, 0x01, 0x64, 0x02, 0x00, 0x7C, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0x84, 0x00, 0x03, 0x64, 0x00, 0x00, 0x83, 0x00, 0x01, 0x64, 0x00, 0x00, 0x85, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x32, 0x00, 0x00
	.byte 0x83, 0x00, 0x01, 0x32, 0x01, 0x00, 0x81, 0x00, 0x01, 0x64, 0x01, 0x00, 0x82, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0x8A, 0x00, 0x03, 0x64, 0x00, 0x00, 0x89, 0x00, 0x01, 0x64, 0x00, 0x00, 0x8B, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x32, 0x00, 0x00
	.byte 0x89, 0x00, 0x01, 0x32, 0x01, 0x00, 0x87, 0x00, 0x01, 0x64, 0x01, 0x00, 0x88, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x19, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0xC2, 0x00, 0x03, 0x64, 0x00, 0x00, 0xC1, 0x00, 0x01, 0x64, 0x00, 0x00, 0xC3, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x3C, 0x00, 0x00
	.byte 0xC1, 0x00, 0x01, 0x32, 0x01, 0x00, 0xBF, 0x00, 0x01, 0x64, 0x01, 0x00, 0xC0, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0xC9, 0x00, 0x03, 0x64, 0x00, 0x00, 0xC8, 0x00, 0x01, 0x64, 0x00, 0x00, 0xCA, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x32, 0x00, 0x00
	.byte 0xC8, 0x00, 0x01, 0x28, 0x01, 0x00, 0xC5, 0x00, 0x01, 0x28, 0x01, 0x00, 0xC6, 0x00, 0x01, 0x64
	.byte 0x01, 0x00, 0xC7, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0xD0, 0x00, 0x03, 0x64, 0x00, 0x00, 0xCF, 0x00, 0x01, 0x64, 0x00, 0x00, 0xD1, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x32, 0x00, 0x00
	.byte 0xCF, 0x00, 0x01, 0x28, 0x01, 0x00, 0xCC, 0x00, 0x01, 0x28, 0x01, 0x00, 0xCD, 0x00, 0x01, 0x64
	.byte 0x01, 0x00, 0xCE, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0xD7, 0x00, 0x03, 0x64, 0x00, 0x00, 0xD6, 0x00, 0x01, 0x64, 0x00, 0x00, 0xD8, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x32, 0x00, 0x00
	.byte 0xD6, 0x00, 0x01, 0x1E, 0x01, 0x00, 0xD3, 0x00, 0x01, 0x1E, 0x01, 0x00, 0xD4, 0x00, 0x01, 0x64
	.byte 0x01, 0x00, 0xD5, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0xDD, 0x00, 0x03, 0x64, 0x00, 0x00, 0xDC, 0x00, 0x01, 0x64, 0x00, 0x00, 0xDE, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x3C, 0x00, 0x00
	.byte 0xDC, 0x00, 0x01, 0x32, 0x01, 0x00, 0xDA, 0x00, 0x01, 0x64, 0x01, 0x00, 0xDB, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0xE3, 0x00, 0x03, 0x32, 0x00, 0x00, 0xE2, 0x00, 0x01, 0x64, 0x00, 0x00, 0xE4, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x3C, 0x00, 0x00
	.byte 0xE2, 0x00, 0x01, 0x32, 0x01, 0x00, 0xE0, 0x00, 0x01, 0x64, 0x01, 0x00, 0xE1, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0xEA, 0x00, 0x03, 0x32, 0x00, 0x00, 0xE9, 0x00, 0x01, 0x64, 0x00, 0x00, 0xEB, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x3C, 0x00, 0x00
	.byte 0xE9, 0x00, 0x01, 0x28, 0x01, 0x00, 0xE7, 0x00, 0x01, 0x28, 0x01, 0x00, 0xE8, 0x00, 0x01, 0x64
	.byte 0x01, 0x00, 0xE6, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x64, 0x00, 0x00
	.byte 0xF1, 0x00, 0x01, 0x64, 0x00, 0x00, 0xEF, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x19, 0x00, 0x00
	.byte 0xF0, 0x00, 0x01, 0x32, 0x01, 0x00, 0xED, 0x00, 0x01, 0x64, 0x01, 0x00, 0xEE, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0xF7, 0x00, 0x08, 0x64, 0x00, 0x00, 0xFA, 0x00, 0x03, 0x64, 0x00, 0x00, 0xF6, 0x00, 0x01, 0x64
	.byte 0x00, 0x00, 0xF8, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0xF7, 0x00, 0x08, 0x64, 0x00, 0x00, 0xFA, 0x00, 0x02, 0x1E, 0x00, 0x00, 0xF9, 0x00, 0x02, 0x1E
	.byte 0x00, 0x00, 0xF6, 0x00, 0x01, 0x1E, 0x01, 0x00, 0xF4, 0x00, 0x01, 0x1E, 0x01, 0x00, 0xF5, 0x00
	.byte 0x01, 0x64, 0x01, 0x00, 0xF3, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x64, 0x00, 0x00
	.byte 0x03, 0x01, 0x07, 0x64, 0x00, 0x00, 0xFF, 0x00, 0x08, 0x64, 0x00, 0x00, 0x02, 0x01, 0x03, 0x64
	.byte 0x00, 0x00, 0xFE, 0x00, 0x01, 0x64, 0x00, 0x00, 0x00, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x64, 0x00, 0x00
	.byte 0x03, 0x01, 0x07, 0x64, 0x00, 0x00, 0xFF, 0x00, 0x08, 0x64, 0x00, 0x00, 0x02, 0x01, 0x02, 0x1E
	.byte 0x00, 0x00, 0xFE, 0x00, 0x02, 0x0A, 0x00, 0x00, 0x01, 0x01, 0x01, 0x32, 0x01, 0x00, 0xFC, 0x00
	.byte 0x01, 0x64, 0x01, 0x00, 0xFD, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0x08, 0x01, 0x08, 0x64, 0x00, 0x00, 0x0B, 0x01, 0x03, 0x64, 0x00, 0x00, 0x07, 0x01, 0x01, 0x64
	.byte 0x00, 0x00, 0x09, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x0A, 0x00, 0x00
	.byte 0x0A, 0x01, 0x02, 0x1E, 0x00, 0x00, 0x07, 0x01, 0x01, 0x32, 0x01, 0x00, 0x06, 0x01, 0x01, 0x64
	.byte 0x01, 0x00, 0x05, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0x10, 0x01, 0x08, 0x64, 0x00, 0x00, 0x13, 0x01, 0x03, 0x64, 0x00, 0x00, 0x0F, 0x01, 0x01, 0x64
	.byte 0x00, 0x00, 0x11, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x0A, 0x00, 0x00
	.byte 0x12, 0x01, 0x02, 0x1E, 0x00, 0x00, 0x0F, 0x01, 0x07, 0x64, 0x00, 0x00, 0x10, 0x01, 0x08, 0x64
	.byte 0x00, 0x00, 0x13, 0x01, 0x01, 0x32, 0x01, 0x00, 0x0D, 0x01, 0x01, 0x64, 0x01, 0x00, 0x0E, 0x01
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x64, 0x00, 0x00
	.byte 0x19, 0x01, 0x04, 0x64, 0x00, 0x00, 0x1A, 0x01, 0x01, 0x64, 0x00, 0x00, 0x17, 0x01, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x19, 0x00, 0x00
	.byte 0x18, 0x01, 0x04, 0x64, 0x00, 0x00, 0x1A, 0x01, 0x01, 0x32, 0x01, 0x00, 0x15, 0x01, 0x01, 0x64
	.byte 0x01, 0x00, 0x16, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0x1F, 0x01, 0x08, 0x64, 0x00, 0x00, 0x22, 0x01, 0x03, 0x64, 0x00, 0x00, 0x1E, 0x01, 0x01, 0x64
	.byte 0x00, 0x00, 0x20, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x1E, 0x00, 0x00
	.byte 0x1E, 0x01, 0x02, 0x0A, 0x00, 0x00, 0x21, 0x01, 0x01, 0x32, 0x01, 0x00, 0x1C, 0x01, 0x01, 0x64
	.byte 0x01, 0x00, 0x1D, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x64, 0x00, 0x00
	.byte 0x2B, 0x01, 0x07, 0x64, 0x00, 0x00, 0x27, 0x01, 0x03, 0x64, 0x00, 0x00, 0x26, 0x01, 0x01, 0x64
	.byte 0x00, 0x00, 0x29, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x19, 0x00, 0x00
	.byte 0x28, 0x01, 0x02, 0x1E, 0x00, 0x00, 0x26, 0x01, 0x02, 0x0A, 0x00, 0x00, 0x2A, 0x01, 0x01, 0x32
	.byte 0x01, 0x00, 0x24, 0x01, 0x01, 0x64, 0x01, 0x00, 0x25, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0x30, 0x01, 0x08, 0x64, 0x00, 0x00, 0x33, 0x01, 0x03, 0x64, 0x00, 0x00, 0x2F, 0x01, 0x01, 0x64
	.byte 0x00, 0x00, 0x31, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x32, 0x00, 0x00
	.byte 0x2F, 0x01, 0x02, 0x32, 0x00, 0x00, 0x32, 0x01, 0x01, 0x32, 0x01, 0x00, 0x2D, 0x01, 0x01, 0x64
	.byte 0x01, 0x00, 0x2E, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0x39, 0x01, 0x03, 0x64, 0x00, 0x00, 0x38, 0x01, 0x01, 0x64, 0x00, 0x00, 0x3A, 0x01, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x1E, 0x00, 0x00
	.byte 0x38, 0x01, 0x01, 0x1E, 0x01, 0x00, 0x35, 0x01, 0x01, 0x1E, 0x01, 0x00, 0x36, 0x01, 0x01, 0x64
	.byte 0x01, 0x00, 0x37, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0x40, 0x01, 0x03, 0x64, 0x00, 0x00, 0x3F, 0x01, 0x01, 0x64, 0x00, 0x00, 0x41, 0x01, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x1E, 0x00, 0x00
	.byte 0x3F, 0x01, 0x01, 0x1E, 0x01, 0x00, 0x3C, 0x01, 0x01, 0x1E, 0x01, 0x00, 0x3D, 0x01, 0x01, 0x64
	.byte 0x01, 0x00, 0x3E, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0x47, 0x01, 0x03, 0x64, 0x00, 0x00, 0x46, 0x01, 0x04, 0x64, 0x00, 0x00, 0x49, 0x01, 0x01, 0x64
	.byte 0x00, 0x00, 0x48, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x32, 0x00, 0x00
	.byte 0x49, 0x01, 0x02, 0x1E, 0x00, 0x00, 0x46, 0x01, 0x01, 0x1E, 0x01, 0x00, 0x43, 0x01, 0x01, 0x1E
	.byte 0x01, 0x00, 0x44, 0x01, 0x01, 0x64, 0x01, 0x00, 0x45, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0x4F, 0x01, 0x03, 0x64, 0x00, 0x00, 0x4E, 0x01, 0x01, 0x64, 0x00, 0x00, 0x50, 0x01, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x1E, 0x00, 0x00
	.byte 0x4E, 0x01, 0x01, 0x1E, 0x01, 0x00, 0x4B, 0x01, 0x01, 0x1E, 0x01, 0x00, 0x4C, 0x01, 0x01, 0x64
	.byte 0x01, 0x00, 0x4D, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0x56, 0x01, 0x08, 0x64, 0x00, 0x00, 0x59, 0x01, 0x03, 0x64, 0x00, 0x00, 0x55, 0x01, 0x01, 0x64
	.byte 0x00, 0x00, 0x57, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x1E, 0x00, 0x00
	.byte 0x55, 0x01, 0x02, 0x32, 0x00, 0x00, 0x58, 0x01, 0x01, 0x1E, 0x01, 0x00, 0x52, 0x01, 0x01, 0x1E
	.byte 0x01, 0x00, 0x53, 0x01, 0x01, 0x64, 0x01, 0x00, 0x54, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0x5F, 0x01, 0x08, 0x64, 0x00, 0x00, 0x62, 0x01, 0x03, 0x64, 0x00, 0x00, 0x5E, 0x01, 0x01, 0x64
	.byte 0x00, 0x00, 0x60, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x1E, 0x00, 0x00
	.byte 0x5E, 0x01, 0x02, 0x32, 0x00, 0x00, 0x61, 0x01, 0x01, 0x1E, 0x01, 0x00, 0x5B, 0x01, 0x01, 0x1E
	.byte 0x01, 0x00, 0x5C, 0x01, 0x01, 0x64, 0x01, 0x00, 0x5D, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0x68, 0x01, 0x03, 0x64, 0x00, 0x00, 0x67, 0x01, 0x01, 0x64, 0x00, 0x00, 0x69, 0x01, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x1E, 0x00, 0x00
	.byte 0x67, 0x01, 0x01, 0x1E, 0x01, 0x00, 0x64, 0x01, 0x01, 0x1E, 0x01, 0x00, 0x65, 0x01, 0x01, 0x64
	.byte 0x01, 0x00, 0x66, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0x6F, 0x01, 0x03, 0x64, 0x00, 0x00, 0x6E, 0x01, 0x01, 0x64, 0x00, 0x00, 0x70, 0x01, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x1E, 0x00, 0x00
	.byte 0x6E, 0x01, 0x01, 0x1E, 0x01, 0x00, 0x6B, 0x01, 0x01, 0x1E, 0x01, 0x00, 0x6C, 0x01, 0x01, 0x64
	.byte 0x01, 0x00, 0x6D, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0x76, 0x01, 0x03, 0x64, 0x00, 0x00, 0x75, 0x01, 0x01, 0x64, 0x00, 0x00, 0x77, 0x01, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x1E, 0x00, 0x00
	.byte 0x75, 0x01, 0x01, 0x1E, 0x01, 0x00, 0x72, 0x01, 0x01, 0x1E, 0x01, 0x00, 0x73, 0x01, 0x01, 0x64
	.byte 0x01, 0x00, 0x74, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0x7D, 0x01, 0x03, 0x64, 0x00, 0x00, 0x7C, 0x01, 0x01, 0x64, 0x00, 0x00, 0x7E, 0x01, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x1E, 0x00, 0x00
	.byte 0x7C, 0x01, 0x01, 0x1E, 0x01, 0x00, 0x79, 0x01, 0x01, 0x1E, 0x01, 0x00, 0x7A, 0x01, 0x01, 0x64
	.byte 0x01, 0x00, 0x7B, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x64, 0x00, 0x00
	.byte 0x87, 0x01, 0x07, 0x64, 0x00, 0x00, 0x84, 0x01, 0x03, 0x64, 0x00, 0x00, 0x83, 0x01, 0x01, 0x64
	.byte 0x00, 0x00, 0x85, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x1E, 0x00, 0x00
	.byte 0x83, 0x01, 0x02, 0x0A, 0x00, 0x00, 0x86, 0x01, 0x01, 0x1E, 0x01, 0x00, 0x80, 0x01, 0x01, 0x1E
	.byte 0x01, 0x00, 0x81, 0x01, 0x01, 0x64, 0x01, 0x00, 0x82, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x64, 0x00, 0x00
	.byte 0x90, 0x01, 0x07, 0x64, 0x00, 0x00, 0x8D, 0x01, 0x03, 0x64, 0x00, 0x00, 0x8C, 0x01, 0x01, 0x64
	.byte 0x00, 0x00, 0x8E, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x1E, 0x00, 0x00
	.byte 0x8C, 0x01, 0x02, 0x0A, 0x00, 0x00, 0x8F, 0x01, 0x01, 0x1E, 0x01, 0x00, 0x89, 0x01, 0x01, 0x1E
	.byte 0x01, 0x00, 0x8A, 0x01, 0x01, 0x64, 0x01, 0x00, 0x8B, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0x96, 0x01, 0x03, 0x64, 0x00, 0x00, 0x95, 0x01, 0x01, 0x64, 0x00, 0x00, 0x97, 0x01, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x1E, 0x00, 0x00
	.byte 0x95, 0x01, 0x01, 0x1E, 0x01, 0x00, 0x92, 0x01, 0x01, 0x1E, 0x01, 0x00, 0x93, 0x01, 0x01, 0x64
	.byte 0x01, 0x00, 0x94, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0x9E, 0x01, 0x03, 0x64, 0x00, 0x00, 0x9D, 0x01, 0x01, 0x64, 0x00, 0x00, 0x9F, 0x01, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x19, 0x00, 0x00
	.byte 0x99, 0x01, 0x02, 0x1E, 0x00, 0x00, 0x9D, 0x01, 0x01, 0x14, 0x01, 0x00, 0x9A, 0x01, 0x01, 0x1E
	.byte 0x01, 0x00, 0x9B, 0x01, 0x01, 0x64, 0x01, 0x00, 0x9C, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0xA3, 0x01, 0x03, 0x64, 0x00, 0x00, 0xA2, 0x01, 0x01, 0x14, 0x00, 0x00, 0xA4, 0x01, 0x01, 0x64
	.byte 0x02, 0x00, 0xA1, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x1E, 0x00, 0x00
	.byte 0xA2, 0x01, 0x01, 0x64, 0x02, 0x00, 0xA1, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0xAA, 0x01, 0x08, 0x64, 0x00, 0x00, 0xAD, 0x01, 0x03, 0x64, 0x00, 0x00, 0xA9, 0x01, 0x01, 0x64
	.byte 0x00, 0x00, 0xAB, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x0A, 0x00, 0x00
	.byte 0xAC, 0x01, 0x02, 0x1E, 0x00, 0x00, 0xA9, 0x01, 0x01, 0x1E, 0x01, 0x00, 0xA6, 0x01, 0x01, 0x1E
	.byte 0x01, 0x00, 0xA7, 0x01, 0x01, 0x64, 0x01, 0x00, 0xA8, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x64, 0x00, 0x00
	.byte 0xB6, 0x01, 0x07, 0x64, 0x00, 0x00, 0xB3, 0x01, 0x03, 0x64, 0x00, 0x00, 0xB2, 0x01, 0x01, 0x64
	.byte 0x00, 0x00, 0xB4, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x1E, 0x00, 0x00
	.byte 0xB2, 0x01, 0x02, 0x0A, 0x00, 0x00, 0xB5, 0x01, 0x01, 0x1E, 0x01, 0x00, 0xAF, 0x01, 0x01, 0x1E
	.byte 0x01, 0x00, 0xB0, 0x01, 0x01, 0x64, 0x01, 0x00, 0xB1, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x64, 0x00, 0x00
	.byte 0xBF, 0x01, 0x07, 0x64, 0x00, 0x00, 0xBC, 0x01, 0x03, 0x64, 0x00, 0x00, 0xBB, 0x01, 0x01, 0x64
	.byte 0x00, 0x00, 0xBD, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x1E, 0x00, 0x00
	.byte 0xBB, 0x01, 0x02, 0x0A, 0x00, 0x00, 0xBE, 0x01, 0x01, 0x1E, 0x01, 0x00, 0xB8, 0x01, 0x01, 0x1E
	.byte 0x01, 0x00, 0xB9, 0x01, 0x01, 0x64, 0x01, 0x00, 0xBA, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0xC6, 0x01, 0x03, 0x64, 0x00, 0x00, 0xC5, 0x01, 0x01, 0x64, 0x00, 0x00, 0xC7, 0x01, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x1E, 0x00, 0x00
	.byte 0xC5, 0x01, 0x01, 0x0F, 0x00, 0x00, 0xC1, 0x01, 0x01, 0x1E, 0x01, 0x00, 0xC2, 0x01, 0x01, 0x1E
	.byte 0x01, 0x00, 0xC3, 0x01, 0x01, 0x64, 0x01, 0x00, 0xC4, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00

	.data

ov101_021FB2C0:
	.word ov101_021F87B0
	.word ov101_021F87BA

ov101_021FB2C8: ; 0x021FB2C8
	.byte  2,  6
	.byte 26,  6
	.byte  2, 14
	.byte 26, 14

ov101_021FB2D0: ; 0x021FB2D0
	.word ov101_021F89B4
	.word ov101_021F8998
	.word ov101_021F89D8
	.word ov101_021F8964
	.word ov101_021F8978
	.word ov101_021F896C
	.word ov101_021F896C
	; 0x021FB300
