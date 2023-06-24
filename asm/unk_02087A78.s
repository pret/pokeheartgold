#include "constants/items.h"
#include "constants/moves.h"
#include "constants/pokemon.h"
#include "constants/ribbon.h"
#include "constants/party_menu.h"
#include "msgdata/msg/msg_0300.h"
	.include "asm/macros.inc"
	.include "unk_02087A78.inc"
	.include "global.inc"

	.public _020FA484
	.public _021028B4
	.public _021028C4
	.public gNatureStatMods

	.text

	thumb_func_start sub_02087A78
sub_02087A78: ; 0x02087A78
	push {r3, lr}
	bl OverlayManager_GetArgs
	ldr r0, [r0, #0x14]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02087A78

	thumb_func_start sub_02087A84
sub_02087A84: ; 0x02087A84
	str r1, [r0]
	str r2, [r0, #4]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02087A84

	thumb_func_start sub_02087A8C
sub_02087A8C: ; 0x02087A8C
	push {r4, r5, r6, lr}
	mov r2, #1
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #3
	mov r1, #0x7e
	lsl r2, r2, #0x10
	bl CreateHeap
	add r0, r5, #0
	mov r1, #0x2c
	mov r2, #0x7e
	bl OverlayManager_CreateAndGetData
	mov r1, #0
	mov r2, #0x2c
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r5, #0
	bl OverlayManager_GetArgs
	str r0, [r4, #0x28]
	ldr r0, [r0, #0xc]
	ldr r1, _02087B00 ; =0x00004170
	str r0, [r4, #0xc]
	mov r0, #0x7e
	bl AllocFromHeap
	ldr r2, _02087B00 ; =0x00004170
	str r0, [r4, #0x14]
	mov r1, #0
	bl MI_CpuFill8
	add r2, r4, #0
	ldr r1, [r4, #0x14]
	ldr r0, _02087B04 ; =0x00000868
	add r2, #0x18
	str r2, [r1, r0]
	ldr r2, [r4, #0xc]
	ldr r1, [r4, #0x14]
	sub r0, #0x38
	str r2, [r1, r0]
	ldr r0, [r4, #0x14]
	str r6, [r0]
	ldr r4, [r4, #0x14]
	ldr r1, [r4]
	add r0, r4, #0
	bl sub_02087FF8
	ldr r1, _02087B08 ; =0x000006D8
	ldr r1, [r4, r1]
	lsl r1, r1, #2
	add r2, r4, r1
	ldr r1, _02087B0C ; =0x0000081C
	str r0, [r2, r1]
	pop {r4, r5, r6, pc}
	nop
_02087B00: .word 0x00004170
_02087B04: .word 0x00000868
_02087B08: .word 0x000006D8
_02087B0C: .word 0x0000081C
	thumb_func_end sub_02087A8C

	thumb_func_start sub_02087B10
sub_02087B10: ; 0x02087B10
	push {r3, lr}
	mov r1, #0
	bl sub_02087A8C
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02087B10

	thumb_func_start sub_02087B1C
sub_02087B1C: ; 0x02087B1C
	push {r3, lr}
	mov r1, #1
	bl sub_02087A8C
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02087B1C

	thumb_func_start sub_02087B28
sub_02087B28: ; 0x02087B28
	push {r3, lr}
	mov r1, #2
	bl sub_02087A8C
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02087B28

	thumb_func_start sub_02087B34
sub_02087B34: ; 0x02087B34
	push {r3, lr}
	mov r1, #3
	bl sub_02087A8C
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02087B34

	thumb_func_start sub_02087B40
sub_02087B40: ; 0x02087B40
	push {r3, lr}
	mov r1, #4
	bl sub_02087A8C
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02087B40

	thumb_func_start sub_02087B4C
sub_02087B4C: ; 0x02087B4C
	push {r3, lr}
	mov r1, #5
	bl sub_02087A8C
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02087B4C

	thumb_func_start sub_02087B58
sub_02087B58: ; 0x02087B58
	push {r3, lr}
	mov r1, #6
	bl sub_02087A8C
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02087B58

	thumb_func_start sub_02087B64
sub_02087B64: ; 0x02087B64
	push {r3, r4, r5, lr}
	add r5, r1, #0
	bl OverlayManager_GetData
	ldr r1, [r5]
	add r4, r0, #0
	cmp r1, #0
	beq _02087B7A
	cmp r1, #1
	beq _02087B98
	b _02087BA8
_02087B7A:
	mov r1, #0x7e
	bl sub_02087BE8
	cmp r0, #0
	beq _02087BA8
	ldr r0, [r4, #0x18]
	cmp r0, #1
	bne _02087B94
	mov r0, #1
	str r0, [r5]
	mov r0, #0
	str r0, [r4]
	b _02087BA8
_02087B94:
	mov r0, #1
	pop {r3, r4, r5, pc}
_02087B98:
	mov r1, #0x7e
	bl sub_02087C38
	cmp r0, #0
	beq _02087BA8
	mov r0, #0
	str r0, [r5]
	str r0, [r4]
_02087BA8:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02087B64

	thumb_func_start sub_02087BAC
sub_02087BAC: ; 0x02087BAC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	bl sub_0202FC48
	cmp r0, #1
	bne _02087BC2
	bl sub_0202FC24
_02087BC2:
	ldr r0, [r4, #0x14]
	bl FreeToHeap
	add r0, r5, #0
	bl OverlayManager_FreeData
	mov r0, #1
	mov r1, #0x7f
	bl GF_SndHandleSetPlayerVolume
	mov r0, #7
	mov r1, #0x7f
	bl GF_SndHandleSetPlayerVolume
	mov r0, #0x7e
	bl DestroyHeap
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02087BAC

	thumb_func_start sub_02087BE8
sub_02087BE8: ; 0x02087BE8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	add r2, r1, #0
	cmp r0, #0
	bne _02087C18
	ldr r0, [r4, #0x14]
	ldr r0, [r0]
	cmp r0, #0
	bne _02087C06
	ldr r0, _02087C30 ; =_021028B4
	add r1, r4, #0
	bl OverlayManager_New
	b _02087C0E
_02087C06:
	ldr r0, _02087C34 ; =_021028C4
	add r1, r4, #0
	bl OverlayManager_New
_02087C0E:
	str r0, [r4, #8]
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02087C2C
_02087C18:
	ldr r0, [r4, #8]
	bl OverlayManager_Run
	cmp r0, #0
	beq _02087C2C
	ldr r0, [r4, #8]
	bl OverlayManager_Delete
	mov r0, #1
	pop {r4, pc}
_02087C2C:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_02087C30: .word _021028B4
_02087C34: .word _021028C4
	thumb_func_end sub_02087BE8

	thumb_func_start sub_02087C38
sub_02087C38: ; 0x02087C38
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r1, #0
	cmp r0, #0
	beq _02087C50
	cmp r0, #1
	beq _02087C6A
	cmp r0, #2
	beq _02087D0C
	b _02087D5A
_02087C50:
	ldr r0, [r5, #0x14]
	ldr r0, [r0]
	cmp r0, #0
	beq _02087C62
	ldr r0, _02087DF4 ; =FS_OVERLAY_ID(OVY_39)
	bl UnloadOverlayByID
	bl UnloadOVY38
_02087C62:
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02087DEC
_02087C6A:
	add r0, r4, #0
	mov r1, #0
	bl BattleSetup_New
	str r0, [r5, #0x10]
	bl sub_0202FC48
	cmp r0, #0
	bne _02087C92
	ldr r1, [r5, #0x14]
	ldr r0, _02087DF8 ; =0x0000086C
	add r2, sp, #4
	ldr r0, [r1, r0]
	add r1, r4, #0
	str r0, [sp]
	ldr r0, [r5, #0xc]
	ldr r3, [r5, #0x10]
	bl sub_0202FC90
	b _02087C9E
_02087C92:
	ldr r0, [r5, #0x10]
	ldr r1, [r5, #0xc]
	bl sub_020304F0
	mov r0, #1
	str r0, [sp, #4]
_02087C9E:
	add r0, r4, #0
	bl BagCursor_New
	mov r1, #0x43
	ldr r2, [r5, #0x10]
	lsl r1, r1, #2
	str r0, [r2, r1]
	ldr r0, [r5, #0xc]
	bl Save_GameStats_Get
	mov r1, #0x51
	ldr r2, [r5, #0x10]
	lsl r1, r1, #2
	str r0, [r2, r1]
	ldr r6, _02087DFC ; =FS_OVERLAY_ID(OVY_40)
	mov r1, #2
	add r0, r6, #0
	bl HandleLoadOverlay
	cmp r0, #1
	bne _02087CDA
	bl sub_0202FC5C
	ldr r1, [r5, #0x10]
	add r2, r4, #0
	bl ov40_02244920
	add r0, r6, #0
	bl UnloadOverlayByID
_02087CDA:
	ldr r1, [r5, #0x14]
	ldr r0, _02087E00 ; =0x00000874
	mov r2, #1
	str r2, [r1, r0]
	ldr r0, [sp, #4]
	cmp r0, #1
	beq _02087D04
	mov r0, #0x43
	ldr r1, [r5, #0x10]
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	bl FreeToHeap
	ldr r0, [r5, #0x10]
	bl BattleSetup_Delete
	mov r0, #0
	str r0, [r5]
	add sp, #8
	mov r0, #1
	pop {r4, r5, r6, pc}
_02087D04:
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02087DEC
_02087D0C:
	mov r0, #1
	mov r1, #0x7f
	bl GF_SndHandleSetPlayerVolume
	mov r0, #7
	mov r1, #0x7f
	bl GF_SndHandleSetPlayerVolume
	mov r0, #1
	bl sub_02005B68
	ldr r0, [r5, #0x10]
	add r0, #0x5d
	ldrb r0, [r0]
	bl sub_02087E34
	cmp r0, #1
	bne _02087D3C
	ldr r1, _02087E04 ; =0x0000047B
	mov r0, #5
	mov r2, #1
	bl sub_02004EC4
	b _02087D46
_02087D3C:
	ldr r1, _02087E08 ; =0x0000045D
	mov r0, #5
	mov r2, #1
	bl sub_02004EC4
_02087D46:
	ldr r0, _02087E0C ; =_020FA484
	ldr r1, [r5, #0x10]
	add r2, r4, #0
	bl OverlayManager_New
	str r0, [r5, #8]
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02087DEC
_02087D5A:
	ldr r0, [r5, #8]
	bl OverlayManager_Run
	cmp r0, #0
	beq _02087DEC
	mov r0, #0x71
	ldr r1, [r5, #0x10]
	lsl r0, r0, #2
	ldr r2, [r1, r0]
	ldr r1, [r5, #0x14]
	ldr r0, _02087E00 ; =0x00000874
	str r2, [r1, r0]
	ldr r2, [r5, #0x14]
	ldr r1, [r2]
	cmp r1, #0
	beq _02087D88
	ldr r1, [r2, r0]
	cmp r1, #0
	bne _02087D88
	add r0, r0, #4
	ldr r0, [r2, r0]
	mov r1, #1
	strb r1, [r0]
_02087D88:
	mov r0, #0x43
	ldr r1, [r5, #0x10]
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	bl FreeToHeap
	ldr r0, [r5, #0x10]
	bl BattleSetup_Delete
	ldr r0, [r5, #8]
	bl OverlayManager_Delete
	mov r0, #0
	bl sub_02005B68
	mov r0, #0
	bl sub_02004AD8
	ldr r0, [r5, #0x28]
	ldr r1, [r0, #0x20]
	ldr r1, [r1]
	bl FieldSystem_GetOverriddenMusicId
	add r4, r0, #0
	ldr r0, [r5, #0x28]
	ldr r1, [r0, #0x20]
	ldr r1, [r1]
	bl GetMapMusic
	bl sub_02004AC8
	mov r0, #0
	add r1, r4, #0
	bl sub_02055198
	mov r0, #0
	str r0, [r5]
	ldr r0, [r5, #0x14]
	ldr r0, [r0]
	cmp r0, #0
	beq _02087DE6
	bl LoadOVY38
	ldr r0, _02087DF4 ; =FS_OVERLAY_ID(OVY_39)
	mov r1, #2
	bl HandleLoadOverlay
_02087DE6:
	add sp, #8
	mov r0, #1
	pop {r4, r5, r6, pc}
_02087DEC:
	mov r0, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_02087DF4: .word FS_OVERLAY_ID(OVY_39)
_02087DF8: .word 0x0000086C
_02087DFC: .word FS_OVERLAY_ID(OVY_40)
_02087E00: .word 0x00000874
_02087E04: .word 0x0000047B
_02087E08: .word 0x0000045D
_02087E0C: .word _020FA484
	thumb_func_end sub_02087C38

	thumb_func_start sub_02087E10
sub_02087E10: ; 0x02087E10
	lsl r1, r0, #2
	ldr r0, _02087E18 ; =_02110594
	ldr r0, [r0, r1]
	bx lr
	.balign 4, 0
_02087E18: .word _02110594
	thumb_func_end sub_02087E10

	thumb_func_start sub_02087E1C
sub_02087E1C: ; 0x02087E1C
	push {r3, lr}
	mov r1, #0x83
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	bl Save_VarsFlags_Get
	mov r1, #2
	mov r2, #0x1b
	bl Save_VarsFlags_FlypointFlagAction
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02087E1C

	thumb_func_start sub_02087E34
sub_02087E34: ; 0x02087E34
	push {r3, r4, r5}
	sub sp, #0x14
	ldr r5, _02087E6C ; =_021028A0
	add r3, r0, #0
	ldmia r5!, {r0, r1}
	add r4, sp, #0
	add r2, r4, #0
	stmia r4!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	ldr r0, [r5]
	mov r1, #0
	str r0, [r4]
_02087E4E:
	ldr r0, [r2]
	cmp r3, r0
	bne _02087E5C
	add sp, #0x14
	mov r0, #1
	pop {r3, r4, r5}
	bx lr
_02087E5C:
	add r1, r1, #1
	add r2, r2, #4
	cmp r1, #5
	blo _02087E4E
	mov r0, #0
	add sp, #0x14
	pop {r3, r4, r5}
	bx lr
	.balign 4, 0
_02087E6C: .word _021028A0
	thumb_func_end sub_02087E34

	.rodata

	.public _02102830
_02102830:
	.word sub_02087B10, sub_02087B64, sub_02087BAC, 0xFFFFFFFF
_02102840:
	.word sub_02087B58, sub_02087B64, sub_02087BAC, 0xFFFFFFFF
_02102850:
	.word sub_02087B4C, sub_02087B64, sub_02087BAC, 0xFFFFFFFF
_02102860:
	.word sub_02087B40, sub_02087B64, sub_02087BAC, 0xFFFFFFFF
_02102870:
	.word sub_02087B34, sub_02087B64, sub_02087BAC, 0xFFFFFFFF
_02102880:
	.word sub_02087B28, sub_02087B64, sub_02087BAC, 0xFFFFFFFF
_02102890:
	.word sub_02087B1C, sub_02087B64, sub_02087BAC, 0xFFFFFFFF
_021028A0:
	.word 0x61
	.word 0x63
	.word 0x64
	.word 0x65
	.word 0x66

	.data

_02110594:
	.word _02102830
	.word _02102890
	.word _02102880
	.word _02102870
	.word _02102860
	.word _02102850
	.word _02102840
