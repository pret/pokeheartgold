#include "constants/easy_chat.h"
#include "constants/items.h"
#include "constants/maps.h"
#include "constants/moves.h"
#include "constants/species.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.text

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
