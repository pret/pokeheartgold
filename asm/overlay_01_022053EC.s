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
	.include "global.inc"

	.text

	thumb_func_start ScrCmd_808
ScrCmd_808: ; 0x022053EC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	ldr r6, _02205420 ; =FS_OVERLAY_ID(OVY_25)
	add r4, r0, #0
	add r0, r6, #0
	mov r1, #2
	bl HandleLoadOverlay
	add r5, #0x80
	ldr r0, [r5]
	add r1, r4, #0
	bl ov25_022598C0
	add r0, r6, #0
	bl UnloadOverlayByID
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02205420: .word FS_OVERLAY_ID(OVY_25)
	thumb_func_end ScrCmd_808

	thumb_func_start ov01_02205424
ov01_02205424: ; 0x02205424
	mov r1, #1
	add r0, #0xf9
	strb r1, [r0]
	bx lr
	thumb_func_end ov01_02205424

	thumb_func_start ov01_0220542C
ov01_0220542C: ; 0x0220542C
	push {r4, r5, r6, lr}
	sub sp, #0x40
	ldr r6, _022054D0 ; =ov01_02209720
	add r5, sp, #0x30
	add r4, r0, #0
	add r3, r1, #0
	ldmia r6!, {r0, r1}
	add r2, r5, #0
	stmia r5!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r5!, {r0, r1}
	ldr r6, _022054D4 ; =ov01_02209730
	add r5, sp, #0x20
	ldmia r6!, {r0, r1}
	stmia r5!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r5!, {r0, r1}
	ldr r6, _022054D8 ; =ov01_02209740
	add r5, sp, #0x10
	ldmia r6!, {r0, r1}
	stmia r5!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r5!, {r0, r1}
	ldr r6, _022054DC ; =ov01_02209710
	add r5, sp, #0
	ldmia r6!, {r0, r1}
	stmia r5!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r5!, {r0, r1}
	mov r1, #0
_02205468:
	lsl r0, r1, #2
	ldr r0, [r2, r0]
	cmp r3, r0
	bne _0220547A
	add r0, sp, #0x20
	lsl r1, r4, #2
	add sp, #0x40
	ldr r0, [r0, r1]
	pop {r4, r5, r6, pc}
_0220547A:
	add r0, r1, #1
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	cmp r1, #4
	blo _02205468
	mov r2, #0
	add r1, sp, #0x20
_02205488:
	lsl r0, r2, #2
	ldr r0, [r1, r0]
	cmp r3, r0
	bne _0220549A
	add r0, sp, #0x10
	lsl r1, r4, #2
	add sp, #0x40
	ldr r0, [r0, r1]
	pop {r4, r5, r6, pc}
_0220549A:
	add r0, r2, #1
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	cmp r2, #4
	blo _02205488
	mov r2, #0
	add r1, sp, #0x10
_022054A8:
	lsl r0, r2, #2
	ldr r0, [r1, r0]
	cmp r3, r0
	bne _022054BA
	add r0, sp, #0
	lsl r1, r4, #2
	add sp, #0x40
	ldr r0, [r0, r1]
	pop {r4, r5, r6, pc}
_022054BA:
	add r0, r2, #1
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	cmp r2, #4
	blo _022054A8
	bl GF_AssertFail
	mov r0, #0
	add sp, #0x40
	pop {r4, r5, r6, pc}
	nop
_022054D0: .word ov01_02209720
_022054D4: .word ov01_02209730
_022054D8: .word ov01_02209740
_022054DC: .word ov01_02209710
	thumb_func_end ov01_0220542C

	thumb_func_start ov01_022054E0
ov01_022054E0: ; 0x022054E0
	push {r3, r4, r5, lr}
	sub sp, #0xc0
	ldr r5, _02205538 ; =ov01_02209750
	add r4, r0, #0
	add r3, sp, #0
	mov r2, #0x18
_022054EC:
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _022054EC
	add r0, r4, #0
	bl ov01_02205584
	cmp r0, #0
	beq _02205504
	add sp, #0xc0
	mov r0, #0
	pop {r3, r4, r5, pc}
_02205504:
	add r0, r4, #0
	bl sub_020659A8
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	bne _02205516
	add sp, #0xc0
	mov r0, #0
	pop {r3, r4, r5, pc}
_02205516:
	add r0, r4, #0
	bl sub_0206599C
	add r4, r0, #0
	cmp r4, #0x10
	blt _02205526
	bl GF_AssertFail
_02205526:
	sub r0, r5, #1
	lsl r0, r0, #0x18
	lsr r2, r0, #0x12
	add r0, sp, #0
	lsl r1, r4, #2
	add r0, r0, r2
	ldr r0, [r1, r0]
	add sp, #0xc0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02205538: .word ov01_02209750
	thumb_func_end ov01_022054E0

	thumb_func_start ov01_0220553C
ov01_0220553C: ; 0x0220553C
	push {r4, lr}
	add r4, r0, #0
	bl MapObject_GetID
	cmp r0, #0xfd
	beq _02205554
	cmp r0, #0xfa
	beq _02205554
	cmp r0, #0xfb
	beq _02205554
	mov r0, #0
	pop {r4, pc}
_02205554:
	add r0, r4, #0
	mov r1, #2
	bl MapObject_GetParam
	mov r1, #1
	and r0, r1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_0220553C

	thumb_func_start ov01_02205564
ov01_02205564: ; 0x02205564
	push {r3, lr}
	bl MapObject_GetGfxID
	ldr r1, _02205580 ; =0x0000019F
	cmp r0, r1
	blt _0220557A
	add r1, r1, #5
	cmp r0, r1
	bgt _0220557A
	mov r0, #1
	pop {r3, pc}
_0220557A:
	mov r0, #0
	pop {r3, pc}
	nop
_02205580: .word 0x0000019F
	thumb_func_end ov01_02205564

	thumb_func_start ov01_02205584
ov01_02205584: ; 0x02205584
	push {r3, r4, r5, lr}
	mov r1, #1
	add r4, r0, #0
	bl MapObject_GetParam
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	add r0, r4, #0
	bl MapObject_GetID
	cmp r0, #0xfd
	beq _022055A0
	mov r0, #0
	pop {r3, r4, r5, pc}
_022055A0:
	lsl r0, r5, #0x18
	lsr r0, r0, #0x18
	asr r1, r0, #4
	mov r0, #0xf
	and r0, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r3, r4, r5, pc}
	thumb_func_end ov01_02205584

	thumb_func_start ov01_022055B0
ov01_022055B0: ; 0x022055B0
	push {r3, r4, r5, lr}
	mov r1, #1
	add r4, r0, #0
	bl MapObject_GetParam
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	add r0, r4, #0
	bl MapObject_GetID
	cmp r0, #0xfd
	beq _022055CC
	mov r0, #0
	pop {r3, r4, r5, pc}
_022055CC:
	lsl r0, r5, #0x18
	lsr r1, r0, #0x18
	mov r0, #0xf
	and r0, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_022055B0

	thumb_func_start ov01_022055DC
ov01_022055DC: ; 0x022055DC
	push {r3, r4, r5, lr}
	mov r1, #1
	add r4, r0, #0
	bl MapObject_GetParam
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	add r0, r4, #0
	bl MapObject_GetID
	cmp r0, #0xfd
	beq _022055F8
	mov r0, #0
	pop {r3, r4, r5, pc}
_022055F8:
	asr r1, r5, #8
	mov r0, #0xf
	and r0, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r3, r4, r5, pc}
	thumb_func_end ov01_022055DC

	thumb_func_start ov01_02205604
ov01_02205604: ; 0x02205604
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r4, r1, #0
	add r5, r2, #0
	bl MapObject_GetFacingDirection
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	add r0, r7, #0
	bl MapObject_GetCurrentX
	str r0, [r4]
	add r0, r7, #0
	bl MapObject_GetCurrentY
	str r0, [r5]
	cmp r6, #3
	bhi _0220565C
	add r0, r6, r6
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02205634: ; jump table
	.short _0220563C - _02205634 - 2 ; case 0
	.short _02205644 - _02205634 - 2 ; case 1
	.short _0220564C - _02205634 - 2 ; case 2
	.short _02205654 - _02205634 - 2 ; case 3
_0220563C:
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_02205644:
	ldr r0, [r5]
	sub r0, r0, #1
	str r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_0220564C:
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_02205654:
	ldr r0, [r4]
	sub r0, r0, #1
	str r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_0220565C:
	bl GF_AssertFail
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_02205604

	thumb_func_start ov01_02205664
ov01_02205664: ; 0x02205664
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r4, r1, #0
	add r5, r2, #0
	bl MapObject_GetFacingDirection
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	add r0, r7, #0
	bl MapObject_GetPrevX
	str r0, [r4]
	add r0, r7, #0
	bl MapObject_GetPrevY
	str r0, [r5]
	cmp r6, #3
	bhi _022056BC
	add r0, r6, r6
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02205694: ; jump table
	.short _0220569C - _02205694 - 2 ; case 0
	.short _022056A4 - _02205694 - 2 ; case 1
	.short _022056AC - _02205694 - 2 ; case 2
	.short _022056B4 - _02205694 - 2 ; case 3
_0220569C:
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_022056A4:
	ldr r0, [r5]
	sub r0, r0, #1
	str r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_022056AC:
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_022056B4:
	ldr r0, [r4]
	sub r0, r0, #1
	str r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_022056BC:
	bl GF_AssertFail
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_02205664

	thumb_func_start ov01_022056C4
ov01_022056C4: ; 0x022056C4
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r5, r1, #0
	bl MapObject_GetFieldSysPtr
	add r7, r0, #0
	add r0, r6, #0
	bl MapObject_GetCurrentX
	add r4, r0, #0
	add r0, r6, #0
	bl MapObject_GetCurrentY
	add r2, r0, #0
	cmp r5, #5
	bhi _02205716
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022056F0: ; jump table
	.short _022056FC - _022056F0 - 2 ; case 0
	.short _02205700 - _022056F0 - 2 ; case 1
	.short _02205708 - _022056F0 - 2 ; case 2
	.short _02205704 - _022056F0 - 2 ; case 3
	.short _0220570C - _022056F0 - 2 ; case 4
	.short _02205712 - _022056F0 - 2 ; case 5
_022056FC:
	sub r2, r2, #1
	b _02205716
_02205700:
	add r2, r2, #1
	b _02205716
_02205704:
	sub r4, r4, #1
	b _02205716
_02205708:
	add r4, r4, #1
	b _02205716
_0220570C:
	add r4, r4, #1
	add r2, r2, #1
	b _02205716
_02205712:
	sub r4, r4, #1
	add r2, r2, #1
_02205716:
	add r0, r7, #0
	add r1, r4, #0
	bl GetMetatileBehaviorAt
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov01_022056C4

	thumb_func_start ov01_02205720
ov01_02205720: ; 0x02205720
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r1, #0
	add r1, sp, #0
	add r4, r2, #0
	add r6, r3, #0
	bl MapObject_GetPositionVec
	cmp r4, #3
	bhi _02205776
	add r0, r4, r4
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02205740: ; jump table
	.short _02205748 - _02205740 - 2 ; case 0
	.short _02205754 - _02205740 - 2 ; case 1
	.short _0220576C - _02205740 - 2 ; case 2
	.short _02205760 - _02205740 - 2 ; case 3
_02205748:
	mov r0, #1
	ldr r1, [sp, #8]
	lsl r0, r0, #0x10
	sub r0, r1, r0
	str r0, [sp, #8]
	b _02205776
_02205754:
	mov r0, #1
	ldr r1, [sp, #8]
	lsl r0, r0, #0x10
	add r0, r1, r0
	str r0, [sp, #8]
	b _02205776
_02205760:
	mov r0, #1
	ldr r1, [sp]
	lsl r0, r0, #0x10
	add r0, r1, r0
	str r0, [sp]
	b _02205776
_0220576C:
	mov r0, #1
	ldr r1, [sp]
	lsl r0, r0, #0x10
	sub r0, r1, r0
	str r0, [sp]
_02205776:
	add r0, r5, #0
	add r1, sp, #0
	add r2, r6, #0
	bl sub_0205FBC0
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov01_02205720

	thumb_func_start ov01_02205784
ov01_02205784: ; 0x02205784
	ldr r3, _0220578C ; =ov01_0220329C
	mov r1, #0
	bx r3
	nop
_0220578C: .word ov01_0220329C
	thumb_func_end ov01_02205784

	thumb_func_start ov01_02205790
ov01_02205790: ; 0x02205790
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r4, r1, #0
	bl FollowingPokemon_IsActive
	cmp r0, #0
	beq _022057BE
	add r0, r5, #0
	bl FollowingPokemon_GetMapObject
	add r6, r0, #0
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetMapObject
	add r1, sp, #0
	bl MapObject_GetPositionVec
	add r0, r6, #0
	add r1, sp, #0
	add r2, r4, #0
	bl sub_0205FBC0
_022057BE:
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov01_02205790

	thumb_func_start ov01_022057C4
ov01_022057C4: ; 0x022057C4
	push {r3, lr}
	bl FollowingPokemon_GetMapObject
	bl sub_0205F684
	pop {r3, pc}
	thumb_func_end ov01_022057C4

	thumb_func_start ov01_022057D0
ov01_022057D0: ; 0x022057D0
	push {r3, lr}
	bl FollowingPokemon_GetMapObject
	bl sub_020659B8
	pop {r3, pc}
	thumb_func_end ov01_022057D0

	thumb_func_start ov01_022057DC
ov01_022057DC: ; 0x022057DC
	push {r3, lr}
	bl sub_0205F1A0
	add r0, #0xfc
	ldr r0, [r0]
	mov r1, #0x16
	bl ov01_021FC5A4
	ldr r2, [r0]
	add r1, r0, #4
	lsl r0, r2, #1
	add r0, r1, r0
	add r3, r0, r2
	mov r1, #0
	cmp r2, #0
	ble _02205806
	mov r0, #1
_022057FE:
	strb r0, [r3, r1]
	add r1, r1, #1
	cmp r1, r2
	blt _022057FE
_02205806:
	pop {r3, pc}
	thumb_func_end ov01_022057DC

	thumb_func_start ov01_02205808
ov01_02205808: ; 0x02205808
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r5, r1, #0
	add r6, r0, #0
	add r0, r5, #0
	add r4, r2, #0
	bl sub_0205F35C
	add r7, r0, #0
	add r0, r5, #0
	bl MapObject_GetGfxID
	add r1, r0, #0
	add r0, r7, #0
	add r2, sp, #0
	bl ov01_021F9744
	add r0, r5, #0
	bl MapObject_GetID
	cmp r0, #0xfd
	beq _0220583C
	cmp r0, #0xfa
	beq _0220583C
	cmp r0, #0xfb
	bne _0220586A
_0220583C:
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	add r3, sp, #0
	bl ov01_02205870
	add r0, r4, #0
	add r1, sp, #0
	bl sub_02023EC8
	add r0, r5, #0
	bl MapObject_GetFacingDirection
	bl ov01_021FA44C
	add r1, r0, #0
	add r0, r4, #0
	bl sub_02023EE0
	add r0, r4, #0
	mov r1, #0
	bl sub_02023F40
_0220586A:
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_02205808

	thumb_func_start ov01_02205870
ov01_02205870: ; 0x02205870
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, r1, #0
	add r4, r3, #0
	bl sub_0205F35C
	bl sub_0205F1A0
	cmp r5, #0
	beq _02205888
	mov r1, #0x16
	b _0220588A
_02205888:
	mov r1, #0x15
_0220588A:
	add r0, #0xfc
	ldr r0, [r0]
	bl ov01_021FC5A4
	add r4, #0xc
	add r1, r4, #0
	bl sub_02026E18
	pop {r3, r4, r5, pc}
	thumb_func_end ov01_02205870

	thumb_func_start ov01_0220589C
ov01_0220589C: ; 0x0220589C
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	mov r0, #0xb
	mov r1, #0x28
	add r5, r2, #0
	bl AllocFromHeapAtEnd
	mov r1, #0
	mov r2, #4
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r6, #0
	mov r1, #2
	bl MapObject_GetParam
	lsl r0, r0, #0xf
	lsr r0, r0, #0x10
	bl ov01_02206088
	add r7, r0, #0
	add r0, r6, #0
	bl sub_0205F35C
	bl FldObjSys_GetMModelNarc
	add r1, r7, #0
	mov r2, #0xb
	bl NARC_AllocAndReadWholeMember
	str r0, [r4]
	bl NNS_G3dGetTex
	add r6, r0, #0
	mov r1, #0
	bl sub_02020888
	add r7, r0, #0
	add r0, r6, #0
	mov r1, #0
	bl sub_02020838
	add r1, r4, #0
	str r0, [r4, #4]
	add r0, r7, #0
	add r1, #8
	mov r2, #0x20
	bl MIi_CpuCopy16
	add r0, r4, #0
	add r0, #8
	mov r1, #0x10
	bl sub_02003F04
	mov r0, #0
	mov r1, #0x10
	str r0, [sp]
	add r0, r4, #0
	add r2, r1, #0
	add r0, #8
	add r2, #0xf0
	mov r3, #0xb4
	bl TintPalette_CustomTone
	add r0, r5, #0
	bl sub_02023FB0
	add r1, r0, #0
	lsl r1, r1, #0x10
	add r2, r4, #0
	mov r0, #1
	lsr r1, r1, #0xd
	add r2, #8
	mov r3, #0x20
	bl GF_CreateNewVramTransferTask
	add r0, r5, #0
	bl sub_02023FA0
	add r6, r0, #0
	add r0, r5, #0
	bl sub_02023FA0
	add r1, r0, #0
	ldr r3, _02205964 ; =0x7FFF0000
	lsl r1, r1, #0x10
	and r3, r6
	lsr r3, r3, #0x10
	ldr r2, [r4, #4]
	mov r0, #0
	lsr r1, r1, #0xd
	lsl r3, r3, #4
	bl GF_CreateNewVramTransferTask
	ldr r0, _02205968 ; =ov01_0220596C
	add r1, r4, #0
	mov r2, #0
	bl sub_0200E374
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02205964: .word 0x7FFF0000
_02205968: .word ov01_0220596C
	thumb_func_end ov01_0220589C

	thumb_func_start ov01_0220596C
ov01_0220596C: ; 0x0220596C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl GF_GetNumPendingVramTransferTasks
	cmp r0, #0
	bne _0220598C
	add r0, r5, #0
	bl DestroySysTask
	ldr r0, [r4]
	bl FreeToHeap
	add r0, r4, #0
	bl FreeToHeap
_0220598C:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_0220596C

	thumb_func_start ov01_02205990
ov01_02205990: ; 0x02205990
	str r0, [r3, #4]
	str r1, [r3, #8]
	str r2, [r3, #0xc]
	ldr r0, [r3, #0x1c]
	cmp r0, #3
	bne _022059A2
	mov r0, #2
	str r0, [r3, #0x1c]
	bx lr
_022059A2:
	cmp r0, #0
	bne _022059AA
	mov r0, #1
	str r0, [r3, #0x1c]
_022059AA:
	bx lr
	thumb_func_end ov01_02205990

	thumb_func_start ov01_022059AC
ov01_022059AC: ; 0x022059AC
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	add r0, #0xf9
	ldrb r0, [r0]
	cmp r0, #0
	beq _02205A2A
	add r0, r5, #0
	add r0, #0xfa
	ldrb r0, [r0]
	cmp r0, #0
	bne _02205A02
	ldr r0, [r5, #0x40]
	bl GetPlayerXCoord
	add r4, r0, #0
	ldr r0, [r5, #0x40]
	bl GetPlayerYCoord
	add r6, r0, #0
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetFacingDirection
	add r3, r0, #0
	ldr r0, [r5, #0x20]
	add r1, r4, #0
	ldr r0, [r0]
	add r2, r6, #0
	str r0, [sp]
	ldr r0, [r5, #0x3c]
	bl sub_020699F8
	add r1, r5, #0
	add r1, #0xfa
	add r0, r5, #0
	add r0, #0xe4
	ldrb r1, [r1]
	ldr r0, [r0]
	cmp r1, #1
	bne _02205A2A
	bl ov01_021F9048
	b _02205A2A
_02205A02:
	add r0, r5, #0
	add r0, #0xe4
	ldr r0, [r0]
	bl FollowPokeObj_GetSpecies
	ldr r1, [r5, #0x20]
	ldr r1, [r1]
	bl GetFollowPokePermissionBySpeciesAndMap
	cmp r0, #0
	bne _02205A2A
	add r0, r5, #0
	add r0, #0xe4
	ldr r0, [r0]
	bl MapObject_Remove
	add r0, r5, #0
	mov r1, #0
	add r0, #0xfa
	strb r1, [r0]
_02205A2A:
	mov r0, #0
	add r5, #0xf9
	strb r0, [r5]
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov01_022059AC

	thumb_func_start ov01_02205A34
ov01_02205A34: ; 0x02205A34
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r0, #0
	add r5, r1, #0
	bl FollowingPokemon_IsActive
	cmp r0, #0
	beq _02205A5C
	add r0, r4, #0
	bl FollowingPokemon_GetMapObject
	add r4, r0, #0
	add r1, sp, #0
	bl MapObject_GetPositionVec
	add r0, r4, #0
	add r1, sp, #0
	str r5, [sp, #4]
	bl MapObject_SetPositionVec
_02205A5C:
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov01_02205A34

	thumb_func_start ov01_02205A60
ov01_02205A60: ; 0x02205A60
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl TaskManager_GetSys
	add r5, r0, #0
	add r0, r4, #0
	bl TaskManager_GetStatePtr
	add r4, r0, #0
	add r0, r5, #0
	bl FollowingPokemon_IsActive
	cmp r0, #0
	bne _02205A80
	mov r0, #1
	pop {r3, r4, r5, pc}
_02205A80:
	ldr r0, [r4]
	add r5, #0xe4
	ldr r5, [r5]
	cmp r0, #0
	beq _02205A94
	cmp r0, #1
	beq _02205AB0
	cmp r0, #2
	beq _02205ACE
	b _02205AE6
_02205A94:
	add r0, r5, #0
	bl sub_0205F714
	cmp r0, #0
	beq _02205AAA
	add r0, r5, #0
	bl MapObject_UnpauseMovement
	mov r0, #1
	str r0, [r4]
	b _02205AE6
_02205AAA:
	mov r0, #2
	str r0, [r4]
	b _02205AE6
_02205AB0:
	add r0, r5, #0
	bl MapObject_IsMovementPaused
	cmp r0, #0
	beq _02205AE6
	add r0, r5, #0
	bl MapObject_AreBitsSetForMovementScriptInit
	cmp r0, #0
	beq _02205AE6
	add r0, r5, #0
	bl MapObject_PauseMovement
	mov r0, #1
	pop {r3, r4, r5, pc}
_02205ACE:
	add r0, r5, #0
	bl MapObject_IsMovementPaused
	cmp r0, #0
	beq _02205AE6
	add r0, r5, #0
	bl MapObject_AreBitsSetForMovementScriptInit
	cmp r0, #0
	beq _02205AE6
	mov r0, #1
	pop {r3, r4, r5, pc}
_02205AE6:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_02205A60

	thumb_func_start ov01_02205AEC
ov01_02205AEC: ; 0x02205AEC
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xb
	mov r1, #0x48
	bl AllocFromHeapAtEnd
	add r2, r0, #0
	mov r0, #0
	strb r0, [r2]
	strb r0, [r2, #1]
	strb r0, [r2, #2]
	strb r0, [r2, #3]
	ldr r0, [r4, #0x10]
	ldr r1, _02205B10 ; =ov01_02205B14
	bl TaskManager_Call
	pop {r4, pc}
	nop
_02205B10: .word ov01_02205B14
	thumb_func_end ov01_02205AEC

	thumb_func_start ov01_02205B14
ov01_02205B14: ; 0x02205B14
	push {r4, r5, r6, lr}
	sub sp, #0x30
	add r4, r0, #0
	bl TaskManager_GetSys
	add r5, r0, #0
	add r0, r4, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldrb r1, [r4]
	cmp r1, #7
	bhi _02205BD2
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02205B3A: ; jump table
	.short _02205B4A - _02205B3A - 2 ; case 0
	.short _02205B86 - _02205B3A - 2 ; case 1
	.short _02205BA0 - _02205B3A - 2 ; case 2
	.short _02205BDC - _02205B3A - 2 ; case 3
	.short _02205BFC - _02205B3A - 2 ; case 4
	.short _02205C7E - _02205B3A - 2 ; case 5
	.short _02205C92 - _02205B3A - 2 ; case 6
	.short _02205CD0 - _02205B3A - 2 ; case 7
_02205B4A:
	add r0, r5, #0
	bl FollowingPokemon_IsActive
	cmp r0, #0
	bne _02205B60
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x30
	mov r0, #1
	pop {r4, r5, r6, pc}
_02205B60:
	add r0, r5, #0
	bl ov01_022057C4
	cmp r0, #0
	beq _02205B76
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x30
	mov r0, #1
	pop {r4, r5, r6, pc}
_02205B76:
	add r0, r5, #0
	bl FollowingPokemon_GetMapObject
	bl MapObject_UnpauseMovement
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
_02205B86:
	add r0, r5, #0
	bl FollowingPokemon_GetMapObject
	bl MapObject_IsMovementPaused
	cmp r0, #0
	beq _02205BD2
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_02205CF0
	strb r0, [r4]
	b _02205CDA
_02205BA0:
	ldr r0, _02205CE0 ; =ov01_022096E0
	ldr r1, [r0, #8]
	ldr r0, [r0, #0xc]
	str r1, [sp, #0x10]
	str r0, [sp, #0x14]
	add r0, r5, #0
	bl FollowingPokemon_GetMapObject
	add r5, r0, #0
	bl MapObject_IsMovementPaused
	cmp r0, #0
	beq _02205BD2
	ldrb r1, [r4, #3]
	add r0, r1, #1
	lsl r2, r1, #2
	add r1, sp, #0x10
	strb r0, [r4, #3]
	ldr r1, [r1, r2]
	add r0, r5, #0
	bl MapObject_SetHeldMovement
	ldrb r0, [r4, #3]
	cmp r0, #2
	bhs _02205BD4
_02205BD2:
	b _02205CDA
_02205BD4:
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _02205CDA
_02205BDC:
	add r0, r5, #0
	bl FollowingPokemon_GetMapObject
	add r5, r0, #0
	bl MapObject_IsMovementPaused
	cmp r0, #0
	beq _02205CDA
	add r0, r5, #0
	mov r1, #0
	bl MapObject_SetHeldMovement
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _02205CDA
_02205BFC:
	ldr r3, _02205CE4 ; =ov01_022096F0
	add r2, sp, #8
	mov r1, #8
_02205C02:
	ldrb r0, [r3]
	add r3, r3, #1
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _02205C02
	ldr r3, _02205CE8 ; =ov01_022096E0
	add r2, sp, #0
	mov r1, #8
_02205C14:
	ldrb r0, [r3]
	add r3, r3, #1
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _02205C14
	add r0, r5, #0
	bl FollowingPokemon_GetMapObject
	add r6, r0, #0
	mov r5, #2
	ldr r0, [r4, #0x44]
	lsl r5, r5, #0xc
	cmp r0, #0
	bne _02205C38
	mov r0, #0
	mvn r0, r0
	mul r5, r0
_02205C38:
	add r0, r6, #0
	add r1, sp, #0x24
	bl MapObject_GetPositionVec
	ldrb r2, [r4, #1]
	add r1, sp, #8
	ldr r0, [sp, #0x2c]
	ldrsb r1, [r1, r2]
	ldr r2, [sp, #0x28]
	lsl r1, r1, #0xc
	sub r0, r0, r1
	str r0, [sp, #0x2c]
	ldr r0, [sp, #0x24]
	add r0, r0, r5
	str r0, [sp, #0x24]
	ldrb r1, [r4, #1]
	add r0, sp, #0
	ldrsb r0, [r0, r1]
	add r1, sp, #0x24
	lsl r0, r0, #0xc
	add r0, r2, r0
	str r0, [sp, #0x28]
	add r0, r6, #0
	bl MapObject_SetPositionVec
	ldrb r0, [r4, #1]
	add r0, r0, #1
	strb r0, [r4, #1]
	ldrb r0, [r4, #1]
	cmp r0, #8
	blo _02205CDA
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _02205CDA
_02205C7E:
	add r0, r5, #0
	bl FollowingPokemon_GetMapObject
	mov r1, #3
	bl ov01_0220329C
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _02205CDA
_02205C92:
	ldrb r0, [r4, #2]
	add r0, r0, #1
	strb r0, [r4, #2]
	ldrb r0, [r4, #2]
	cmp r0, #0x14
	blo _02205CDA
	add r0, r5, #0
	mov r1, #0
	bl ov01_02205790
	ldr r3, _02205CEC ; =ov01_02209704
	add r2, sp, #0x18
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r0, [r5, #0x3c]
	bl ov01_021F771C
	add r1, sp, #0x18
	bl sub_02023E78
	add r5, #0xe4
	ldr r0, [r5]
	mov r1, #1
	bl sub_02069E84
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _02205CDA
_02205CD0:
	bl FreeToHeap
	add sp, #0x30
	mov r0, #1
	pop {r4, r5, r6, pc}
_02205CDA:
	mov r0, #0
	add sp, #0x30
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02205CE0: .word ov01_022096E0
_02205CE4: .word ov01_022096F0
_02205CE8: .word ov01_022096E0
_02205CEC: .word ov01_02209704
	thumb_func_end ov01_02205B14

	thumb_func_start ov01_02205CF0
ov01_02205CF0: ; 0x02205CF0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x40]
	add r4, r1, #0
	bl PlayerAvatar_GetMapObject
	bl MapObject_GetCurrentX
	str r0, [sp]
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetMapObject
	bl MapObject_GetCurrentY
	add r7, r0, #0
	add r0, r5, #0
	bl FollowingPokemon_GetMapObject
	bl MapObject_GetCurrentX
	add r6, r0, #0
	add r0, r5, #0
	bl FollowingPokemon_GetMapObject
	bl MapObject_GetCurrentY
	ldr r1, [sp]
	cmp r6, r1
	bne _02205D38
	add r1, r7, #1
	cmp r0, r1
	bne _02205D38
	mov r0, #1
	str r0, [r4, #0x44]
	mov r0, #2
	pop {r3, r4, r5, r6, r7, pc}
_02205D38:
	ldr r1, [sp]
	add r1, r1, #1
	cmp r6, r1
	bne _02205D4C
	cmp r0, r7
	bne _02205D4C
	mov r0, #0
	str r0, [r4, #0x44]
	mov r0, #3
	pop {r3, r4, r5, r6, r7, pc}
_02205D4C:
	ldr r1, [sp]
	add r2, r6, #1
	cmp r2, r1
	bne _02205D60
	cmp r0, r7
	bne _02205D60
	mov r0, #1
	str r0, [r4, #0x44]
	mov r0, #3
	pop {r3, r4, r5, r6, r7, pc}
_02205D60:
	bl GF_AssertFail
	mov r0, #2
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov01_02205CF0

	thumb_func_start ov01_02205D68
ov01_02205D68: ; 0x02205D68
	push {r4, lr}
	add r4, r0, #0
	bl FollowingPokemon_IsActive
	cmp r0, #0
	bne _02205D78
	mov r0, #0
	pop {r4, pc}
_02205D78:
	add r0, r4, #0
	bl ov01_022057C4
	cmp r0, #0
	beq _02205D94
	add r0, r4, #0
	bl sub_0206A054
	add r0, r4, #0
	mov r1, #0
	bl ov01_02205790
	mov r0, #0
	pop {r4, pc}
_02205D94:
	mov r0, #0xb
	mov r1, #0x44
	bl AllocFromHeapAtEnd
	add r2, r0, #0
	mov r0, #0
	str r0, [r2]
	ldr r0, [r4, #0x10]
	ldr r1, _02205DB0 ; =ov01_02205DB4
	bl TaskManager_Call
	mov r0, #1
	pop {r4, pc}
	nop
_02205DB0: .word ov01_02205DB4
	thumb_func_end ov01_02205D68

	thumb_func_start ov01_02205DB4
ov01_02205DB4: ; 0x02205DB4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r4, r0, #0
	bl TaskManager_GetSys
	add r5, r0, #0
	add r0, r4, #0
	bl TaskManager_GetEnv
	add r6, r0, #0
	add r0, r4, #0
	bl TaskManager_GetStatePtr
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #4
	bhi _02205ED2
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02205DE2: ; jump table
	.short _02205DEC - _02205DE2 - 2 ; case 0
	.short _02205DFC - _02205DE2 - 2 ; case 1
	.short _02205E12 - _02205DE2 - 2 ; case 2
	.short _02205E5A - _02205DE2 - 2 ; case 3
	.short _02205EC6 - _02205DE2 - 2 ; case 4
_02205DEC:
	add r0, r5, #0
	bl FollowingPokemon_GetMapObject
	bl MapObject_UnpauseMovement
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
_02205DFC:
	add r0, r5, #0
	bl FollowingPokemon_GetMapObject
	bl MapObject_IsMovementPaused
	cmp r0, #0
	beq _02205ED2
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02205ED2
_02205E12:
	add r0, r5, #0
	bl FollowingPokemon_GetMapObject
	str r0, [sp]
	bl MapObject_GetGfxID
	bl ov01_02206088
	add r7, r0, #0
	ldr r0, [r5, #0x3c]
	bl FldObjSys_GetMModelNarc
	add r1, r7, #0
	mov r2, #0xb
	bl NARC_AllocAndReadWholeMember
	add r5, r0, #0
	bl NNS_G3dGetTex
	ldr r1, [r0, #0x38]
	mov r2, #0x40
	add r0, r0, r1
	add r1, r6, #4
	bl MIi_CpuCopy16
	add r0, r5, #0
	bl FreeToHeap
	ldr r0, [sp]
	mov r1, #1
	bl ov01_0220329C
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02205ED2
_02205E5A:
	ldr r0, [r6]
	add r0, r0, #1
	str r0, [r6]
	cmp r0, #0x14
	blt _02205ED2
	add r0, r5, #0
	mov r1, #0
	bl ov01_02205790
	ldr r3, _02205ED8 ; =ov01_022096F8
	add r2, sp, #8
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r0, [r5, #0x3c]
	bl ov01_021F771C
	add r7, r0, #0
	add r1, sp, #8
	bl sub_02023E78
	add r0, r7, #0
	bl sub_02023FB0
	str r0, [sp, #4]
	add r0, r7, #0
	bl sub_02023FB0
	add r1, r0, #0
	add r2, r6, #4
	lsl r1, r1, #0x10
	ldr r6, _02205EDC ; =0xFFFF0000
	ldr r3, [sp, #4]
	mov r0, #1
	and r3, r6
	lsr r3, r3, #0x10
	lsr r1, r1, #0xd
	lsl r3, r3, #3
	bl GF_CreateNewVramTransferTask
	add r0, r5, #0
	bl sub_0206A054
	add r0, r5, #0
	bl FollowingPokemon_GetMapObject
	mov r1, #0
	bl sub_02069E28
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02205ED2
_02205EC6:
	add r0, r6, #0
	bl FreeToHeap
	add sp, #0x14
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_02205ED2:
	mov r0, #0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02205ED8: .word ov01_022096F8
_02205EDC: .word 0xFFFF0000
	thumb_func_end ov01_02205DB4

	thumb_func_start ov01_02205EE0
ov01_02205EE0: ; 0x02205EE0
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xb
	mov r1, #4
	bl AllocFromHeapAtEnd
	add r2, r0, #0
	mov r0, #0
	str r0, [r2]
	ldr r1, _02205EFC ; =ov01_02205F00
	add r0, r4, #0
	bl TaskManager_Call
	pop {r4, pc}
	.balign 4, 0
_02205EFC: .word ov01_02205F00
	thumb_func_end ov01_02205EE0

	thumb_func_start ov01_02205F00
ov01_02205F00: ; 0x02205F00
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl TaskManager_GetSys
	add r4, r0, #0
	add r0, r5, #0
	bl TaskManager_GetEnv
	add r6, r0, #0
	add r0, r5, #0
	bl TaskManager_GetStatePtr
	add r5, r0, #0
	ldr r0, [r5]
	cmp r0, #6
	bls _02205F22
	b _02206024
_02205F22:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02205F2E: ; jump table
	.short _02205F3C - _02205F2E - 2 ; case 0
	.short _02205F56 - _02205F2E - 2 ; case 1
	.short _02205F7A - _02205F2E - 2 ; case 2
	.short _02205FA4 - _02205F2E - 2 ; case 3
	.short _02205FB6 - _02205F2E - 2 ; case 4
	.short _02205FF2 - _02205F2E - 2 ; case 5
	.short _0220601A - _02205F2E - 2 ; case 6
_02205F3C:
	add r0, r4, #0
	add r0, #0xe4
	ldr r0, [r0]
	bl sub_020659CC
	add r4, #0xe4
	ldr r0, [r4]
	bl sub_0205F484
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02206024
_02205F56:
	add r0, r4, #0
	add r0, #0xe4
	ldr r0, [r0]
	bl MapObject_AreBitsSetForMovementScriptInit
	cmp r0, #1
	bne _02206024
	ldr r0, [r4, #0x40]
	bl PlayerAvatar_GetMapObject
	add r4, #0xe4
	ldr r1, [r4]
	bl ov01_02206028
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02206024
_02205F7A:
	add r0, r4, #0
	add r0, #0xe4
	ldr r0, [r0]
	bl MapObject_AreBitsSetForMovementScriptInit
	cmp r0, #1
	bne _02206024
	ldr r0, [r4, #0x40]
	bl PlayerAvatar_GetMapObject
	bl MapObject_GetFacingDirection
	add r4, #0xe4
	add r1, r0, #0
	ldr r0, [r4]
	bl MapObject_SetFacingDirection
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02206024
_02205FA4:
	ldr r0, [r6]
	add r0, r0, #1
	str r0, [r6]
	cmp r0, #0xa
	ble _02206024
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02206024
_02205FB6:
	add r0, r4, #0
	add r0, #0xe4
	ldr r0, [r0]
	bl MapObject_AreBitsSetForMovementScriptInit
	cmp r0, #1
	bne _02206024
	add r0, r4, #0
	add r0, #0xe4
	ldr r0, [r0]
	mov r1, #0
	bl sub_0206A040
	ldr r0, [r4, #0x40]
	bl PlayerAvatar_GetMapObject
	bl MapObject_GetFacingDirection
	mov r1, #0x34
	bl sub_0206234C
	add r4, #0xe4
	add r1, r0, #0
	ldr r0, [r4]
	bl MapObject_SetHeldMovement
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02206024
_02205FF2:
	add r0, r4, #0
	add r0, #0xe4
	ldr r0, [r0]
	bl MapObject_AreBitsSetForMovementScriptInit
	cmp r0, #1
	bne _02206024
	add r0, r4, #0
	add r0, #0xe4
	ldr r0, [r0]
	mov r1, #2
	bl ov01_0220329C
	add r0, r4, #0
	bl sub_0206A054
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02206024
_0220601A:
	add r0, r6, #0
	bl FreeToHeap
	mov r0, #1
	pop {r4, r5, r6, pc}
_02206024:
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov01_02205F00

	thumb_func_start ov01_02206028
ov01_02206028: ; 0x02206028
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	add r5, r1, #0
	bl MapObject_GetCurrentX
	add r6, r0, #0
	ldr r0, [sp]
	bl MapObject_GetCurrentY
	add r7, r0, #0
	add r0, r5, #0
	bl MapObject_GetCurrentX
	add r4, r0, #0
	add r0, r5, #0
	bl MapObject_GetCurrentY
	sub r6, r6, r4
	sub r4, r7, r0
	ldr r0, [sp]
	bl MapObject_GetFacingDirection
	cmp r6, #0
	bge _02206062
	add r0, r5, #0
	mov r1, #0xa
	bl MapObject_SetHeldMovement
	pop {r3, r4, r5, r6, r7, pc}
_02206062:
	ble _0220606E
	add r0, r5, #0
	mov r1, #0xb
	bl MapObject_SetHeldMovement
	pop {r3, r4, r5, r6, r7, pc}
_0220606E:
	cmp r4, #0
	bge _0220607C
	add r0, r5, #0
	mov r1, #8
	bl MapObject_SetHeldMovement
	pop {r3, r4, r5, r6, r7, pc}
_0220607C:
	ble _02206086
	add r0, r5, #0
	mov r1, #9
	bl MapObject_SetHeldMovement
_02206086:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov01_02206028

	thumb_func_start ov01_02206088
ov01_02206088: ; 0x02206088
	push {r3, lr}
	bl GetMoveModelNoBySpriteId
	cmp r0, #0
	bge _02206098
	bl GF_AssertFail
	mov r0, #0
_02206098:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov01_02206088

	thumb_func_start ov01_0220609C
ov01_0220609C: ; 0x0220609C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl FollowingPokemon_IsActive
	cmp r0, #0
	beq _022060B4
	add r5, #0xe4
	ldr r0, [r5]
	add r1, r4, #0
	bl MapObject_SetFacingDirection
_022060B4:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_0220609C

	thumb_func_start ov01_022060B8
ov01_022060B8: ; 0x022060B8
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r5, r1, #0
	add r7, r2, #0
	bl FollowingPokemon_IsActive
	cmp r0, #0
	bne _022060CC
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_022060CC:
	add r0, r6, #0
	bl ov01_022057C4
	cmp r0, #0
	beq _022060DA
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_022060DA:
	cmp r5, #0
	bne _022060E2
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_022060E2:
	mov r0, #0xb
	mov r1, #0x84
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x84
	bl MI_CpuFill8
	strb r5, [r4, #1]
	strb r7, [r4, #3]
	ldr r0, [r6, #0x10]
	ldr r1, _02206108 ; =ov01_0220610C
	add r2, r4, #0
	bl TaskManager_Call
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02206108: .word ov01_0220610C
	thumb_func_end ov01_022060B8

	thumb_func_start ov01_0220610C
ov01_0220610C: ; 0x0220610C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl TaskManager_GetSys
	add r6, r0, #0
	add r0, r5, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	add r0, r5, #0
	bl TaskManager_GetStatePtr
	add r5, r0, #0
	ldr r0, [r5]
	cmp r0, #3
	bls _0220612E
	b _0220625A
_0220612E:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0220613A: ; jump table
	.short _02206142 - _0220613A - 2 ; case 0
	.short _02206180 - _0220613A - 2 ; case 1
	.short _022061EA - _0220613A - 2 ; case 2
	.short _02206250 - _0220613A - 2 ; case 3
_02206142:
	add r0, r6, #0
	bl FollowingPokemon_GetMapObject
	bl MapObject_GetGfxID
	bl ov01_02206088
	add r7, r0, #0
	ldr r0, [r6, #0x3c]
	bl FldObjSys_GetMModelNarc
	add r1, r7, #0
	mov r2, #0xb
	bl NARC_AllocAndReadWholeMember
	add r6, r0, #0
	bl NNS_G3dGetTex
	ldr r1, [r0, #0x38]
	mov r2, #0x40
	add r0, r0, r1
	add r1, r4, #4
	bl MIi_CpuCopy16
	add r0, r6, #0
	bl FreeToHeap
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0220625A
_02206180:
	ldrb r0, [r4, #2]
	cmp r0, #0
	beq _0220618C
	sub r0, r0, #1
	strb r0, [r4, #2]
	b _0220625A
_0220618C:
	mov r0, #0
	ldrsb r2, [r4, r0]
	ldrb r1, [r4, #1]
	add r1, r2, r1
	strb r1, [r4]
	ldrsb r0, [r4, r0]
	cmp r0, #0x10
	blt _022061A6
	mov r0, #0x10
	strb r0, [r4]
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
_022061A6:
	ldr r0, _02206260 ; =0x0000FFFF
	add r1, r4, #0
	str r0, [sp]
	ldrb r3, [r4]
	add r0, r4, #4
	add r1, #0x44
	mov r2, #0x20
	bl sub_02003DE8
	ldr r0, [r6, #0x3c]
	bl ov01_021F771C
	add r6, r0, #0
	bl sub_02023FB0
	add r5, r0, #0
	add r0, r6, #0
	bl sub_02023FB0
	add r1, r0, #0
	ldr r3, _02206264 ; =0xFFFF0000
	lsl r1, r1, #0x10
	and r3, r5
	add r2, r4, #0
	lsr r3, r3, #0x10
	mov r0, #1
	lsr r1, r1, #0xd
	add r2, #0x44
	lsl r3, r3, #3
	bl GF_CreateNewVramTransferTask
	ldrb r0, [r4, #3]
	strb r0, [r4, #2]
	b _0220625A
_022061EA:
	ldrb r0, [r4, #2]
	cmp r0, #0
	beq _022061F6
	sub r0, r0, #1
	strb r0, [r4, #2]
	b _0220625A
_022061F6:
	mov r0, #0
	ldrsb r2, [r4, r0]
	ldrb r1, [r4, #1]
	sub r1, r2, r1
	strb r1, [r4]
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bgt _0220620C
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
_0220620C:
	ldr r0, _02206260 ; =0x0000FFFF
	add r1, r4, #0
	str r0, [sp]
	ldrb r3, [r4]
	add r0, r4, #4
	add r1, #0x44
	mov r2, #0x20
	bl sub_02003DE8
	ldr r0, [r6, #0x3c]
	bl ov01_021F771C
	add r6, r0, #0
	bl sub_02023FB0
	add r5, r0, #0
	add r0, r6, #0
	bl sub_02023FB0
	add r1, r0, #0
	ldr r3, _02206264 ; =0xFFFF0000
	lsl r1, r1, #0x10
	and r3, r5
	add r2, r4, #0
	lsr r3, r3, #0x10
	mov r0, #1
	lsr r1, r1, #0xd
	add r2, #0x44
	lsl r3, r3, #3
	bl GF_CreateNewVramTransferTask
	ldrb r0, [r4, #3]
	strb r0, [r4, #2]
	b _0220625A
_02206250:
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0220625A:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02206260: .word 0x0000FFFF
_02206264: .word 0xFFFF0000
	thumb_func_end ov01_0220610C

	thumb_func_start ov01_02206268
ov01_02206268: ; 0x02206268
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl sub_02069FB0
	cmp r0, #0
	bne _02206278
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02206278:
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetMapObject
	add r5, #0xe4
	add r4, r0, #0
	ldr r7, [r5]
	bl MapObject_GetCurrentX
	add r5, r0, #0
	add r0, r4, #0
	bl MapObject_GetCurrentY
	add r4, r0, #0
	add r0, r7, #0
	bl MapObject_GetCurrentX
	add r6, r0, #0
	add r0, r7, #0
	bl MapObject_GetCurrentY
	cmp r5, r6
	bne _022062B4
	add r1, r4, #1
	cmp r1, r0
	beq _022062B0
	sub r1, r4, #1
	cmp r1, r0
	bne _022062C8
_022062B0:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_022062B4:
	cmp r4, r0
	bne _022062C8
	add r0, r5, #1
	cmp r0, r6
	beq _022062C4
	sub r0, r5, #1
	cmp r0, r6
	bne _022062C8
_022062C4:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_022062C8:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov01_02206268

	thumb_func_start ov01_022062CC
ov01_022062CC: ; 0x022062CC
	push {r3, lr}
	ldr r0, [r0, #0xc]
	bl SavArray_PlayerParty_get
	bl GetIdxOfFirstAliveMonInParty_CrashIfNone
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov01_022062CC

	.rodata

ov01_022096E0: ; 0x022096E0
	.byte 0x01, 0x02, 0x02, 0x03, 0x03, 0x02, 0x02, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00

ov01_022096F0: ; 0x022096F0
	.byte 0x04, 0x04, 0x04, 0x02, 0x02, 0x02, 0x00, 0x00

ov01_022096F8: ; 0x022096F8
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x10, 0x00, 0x00

ov01_02209704: ; 0x02209704
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00

ov01_02209710: ; 0x02209710
	.byte 0x14, 0x00, 0x00, 0x00, 0x15, 0x00, 0x00, 0x00, 0x16, 0x00, 0x00, 0x00, 0x17, 0x00, 0x00, 0x00

ov01_02209720: ; 0x02209720
	.byte 0x08, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00

ov01_02209730: ; 0x02209730
	.byte 0x0C, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00

ov01_02209740: ; 0x02209740
	.byte 0x10, 0x00, 0x00, 0x00, 0x11, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00, 0x13, 0x00, 0x00, 0x00

ov01_02209750: ; 0x02209750
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0xA0, 0x00, 0x00
	.byte 0x00, 0xC0, 0x00, 0x00, 0x00, 0xA0, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00
	.byte 0x00, 0xA0, 0x00, 0x00, 0x00, 0xA0, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00
	.byte 0x00, 0xC0, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0xA0, 0x00, 0x00
	.byte 0x00, 0xA0, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00
