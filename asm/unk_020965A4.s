#include "constants/easy_chat.h"
#include "constants/items.h"
#include "constants/maps.h"
#include "constants/moves.h"
#include "constants/species.h"
	.include "asm/macros.inc"
	.include "unk_020965A4.inc"
	.include "global.inc"

	.text

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
	bl OverlayManager_GetArgs
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
	bl OverlayManager_Run
	cmp r0, #1
	bne _02096734
	ldr r0, [r4, #4]
	bl OverlayManager_Delete
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
	ldr r0, _020967D8 ; =FS_OVERLAY_ID(OVY_80)
	mov r1, #2
	bl HandleLoadOverlay
	ldr r0, _020967DC ; =FS_OVERLAY_ID(OVY_81)
	mov r1, #2
	bl HandleLoadOverlay
	ldr r0, _020967E0 ; =FS_OVERLAY_ID(OVY_42)
	mov r1, #2
	bl HandleLoadOverlay
	pop {r3, pc}
	.balign 4, 0
_020967D8: .word FS_OVERLAY_ID(OVY_80)
_020967DC: .word FS_OVERLAY_ID(OVY_81)
_020967E0: .word FS_OVERLAY_ID(OVY_42)
	thumb_func_end sub_020967BC

	thumb_func_start sub_020967E4
sub_020967E4: ; 0x020967E4
	push {r3, lr}
	ldr r0, _020967FC ; =FS_OVERLAY_ID(OVY_80)
	bl UnloadOverlayByID
	ldr r0, _02096800 ; =FS_OVERLAY_ID(OVY_81)
	bl UnloadOverlayByID
	ldr r0, _02096804 ; =FS_OVERLAY_ID(OVY_42)
	bl UnloadOverlayByID
	pop {r3, pc}
	nop
_020967FC: .word FS_OVERLAY_ID(OVY_80)
_02096800: .word FS_OVERLAY_ID(OVY_81)
_02096804: .word FS_OVERLAY_ID(OVY_42)
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
	bl OverlayManager_New
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

	.rodata

	.public _02108584
_02108584:
	.word sub_020965A4, sub_02096608, sub_0209673C, 0xFFFFFFFF
