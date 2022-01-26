#include "constants/sndseq.h"
#include "constants/species.h"
#include "constants/maps.h"
#include "constants/pokemon.h"
#include "constants/flags.h"
#include "constants/vars.h"
#include "constants/items.h"
#include "constants/std_script.h"
#include "fielddata/script/scr_seq/event_D24R0204.h"
#include "party_menu.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.data

_0210FAD8:
	.short ITEM_BICYCLE
	.short ITEM_OLD_ROD
	.short ITEM_GOOD_ROD
	.short ITEM_SUPER_ROD
	.short ITEM_POINT_CARD
	.short ITEM_SEAL_CASE
	.short ITEM_FASHION_CASE
	.short ITEM_COIN_CASE

	.text

	thumb_func_start sub_020632B0
sub_020632B0: ; 0x020632B0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r6, r1, #0
	str r3, [sp, #4]
	mov r1, #0xc
	str r0, [sp]
	add r7, r2, #0
	ldr r5, [sp, #0x24]
	bl sub_0205F3C0
	add r4, r0, #0
	mov r0, #0xb
	mov r1, #0x1c
	bl AllocFromHeapAtEnd
	mov r1, #0
	mov r2, #0x1c
	str r0, [r4, #8]
	bl MI_CpuFill8
	mov r0, #0x10
	add r1, sp, #0x10
	ldrsb r0, [r1, r0]
	cmp r5, #0
	strb r0, [r4]
	strb r5, [r4, #1]
	ldrh r0, [r1, #0x18]
	strb r0, [r4, #3]
	ble _020632FC
	lsl r0, r5, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _0206330A
_020632FC:
	lsl r0, r5, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_0206330A:
	bl _ffix
	str r0, [sp, #8]
	ldr r0, [r4, #8]
	strb r6, [r0, #1]
	ldr r0, [r4, #8]
	strb r7, [r0, #2]
	ldr r1, [r4, #8]
	ldr r0, [sp, #4]
	strb r0, [r1, #3]
	lsl r0, r6, #4
	cmp r0, #0
	ble _02063336
	lsl r0, r6, #0x10
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _02063344
_02063336:
	lsl r0, r6, #0x10
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_02063344:
	bl _ffix
	ldr r1, [sp, #8]
	bl FX_Div
	ldr r1, [r4, #8]
	str r0, [r1, #4]
	lsl r0, r7, #4
	cmp r0, #0
	ble _0206336A
	lsl r0, r7, #0x10
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _02063378
_0206336A:
	lsl r0, r7, #0x10
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_02063378:
	bl _ffix
	ldr r1, [sp, #8]
	bl FX_Div
	ldr r1, [r4, #8]
	str r0, [r1, #8]
	ldr r0, [sp, #4]
	lsl r0, r0, #4
	cmp r0, #0
	ble _020633A2
	ldr r0, [sp, #4]
	lsl r0, r0, #0x10
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _020633B2
_020633A2:
	ldr r0, [sp, #4]
	lsl r0, r0, #0x10
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_020633B2:
	bl _ffix
	ldr r1, [sp, #8]
	bl FX_Div
	ldr r1, [r4, #8]
	str r0, [r1, #0xc]
	mov r0, #0xb4
	add r1, r5, #0
	bl _s32_div_f
	ldr r1, [r4, #8]
	strb r0, [r1]
	ldr r1, [r4, #8]
	ldr r0, [sp]
	add r1, #0x10
	bl MapObject_GetPositionVec
	ldr r0, [r4, #8]
	ldr r0, [r0, #0x14]
	str r0, [r4, #4]
	ldr r0, [sp]
	bl sub_02060F78
	ldr r0, [sp]
	ldr r1, _0206341C ; =0x00010004
	bl MapObject_SetBits
	add r2, sp, #0x10
	mov r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [sp]
	bl MapObject_SetOrQueueFacing
	add r1, sp, #0x10
	ldrh r1, [r1, #0x18]
	ldr r0, [sp]
	bl sub_0205F328
	ldr r0, [sp]
	bl sub_0205F4E4
	ldr r0, [sp]
	bl sub_0205F684
	cmp r0, #0
	bne _02063416
	ldr r0, _02063420 ; =SEQ_SE_DP_DANSA
	bl PlaySE
_02063416:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0206341C: .word 0x00010004
_02063420: .word SEQ_SE_DP_DANSA
	thumb_func_end sub_020632B0

	thumb_func_start sub_02063424
sub_02063424: ; 0x02063424
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	bl sub_0205F3E4
	add r4, r0, #0
	ldrb r0, [r4, #2]
	cmp r0, #0
	beq _02063448
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _02063456
_02063448:
	lsl r0, r0, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_02063456:
	bl _ffix
	str r0, [sp]
	asr r0, r0, #0x1f
	str r0, [sp, #4]
	ldr r6, [r4, #8]
	ldr r2, [sp]
	ldr r0, [r6, #4]
	ldr r3, [sp, #4]
	asr r1, r0, #0x1f
	bl _ll_mul
	ldr r3, [r6, #0x10]
	mov r6, #2
	mov r2, #0
	lsl r6, r6, #0xa
	add r6, r0, r6
	adc r1, r2
	lsl r0, r1, #0x14
	lsr r1, r6, #0xc
	orr r1, r0
	add r0, r3, r1
	str r2, [sp, #0xc]
	str r0, [sp, #8]
	ldr r6, [r4, #8]
	ldr r2, [sp]
	ldr r0, [r6, #0xc]
	ldr r3, [sp, #4]
	asr r1, r0, #0x1f
	bl _ll_mul
	mov r3, #2
	ldr r2, [r6, #0x18]
	mov r6, #0
	lsl r3, r3, #0xa
	add r3, r0, r3
	adc r1, r6
	lsl r0, r1, #0x14
	lsr r1, r3, #0xc
	orr r1, r0
	add r0, r2, r1
	str r0, [sp, #0x10]
	add r0, r5, #0
	bl MapObject_GetFieldSysPtr
	add r6, r0, #0
	add r0, r5, #0
	bl sub_0205F8B8
	add r2, r0, #0
	add r0, r6, #0
	add r1, sp, #8
	bl sub_02061248
	cmp r0, #0
	beq _020634CC
	ldr r0, [sp, #0xc]
	str r0, [r4, #4]
	b _020634D0
_020634CC:
	ldr r0, [r4, #4]
	str r0, [sp, #0xc]
_020634D0:
	add r0, r5, #0
	add r1, sp, #8
	bl MapObject_SetPositionVec
	ldr r0, [r4, #8]
	ldrb r1, [r0]
	ldrb r0, [r4, #2]
	mul r0, r1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl GF_SinDegNoWrap
	ldr r7, [r4, #8]
	add r6, r0, #0
	ldr r0, [r7, #8]
	ldr r2, [sp]
	ldr r3, [sp, #4]
	asr r1, r0, #0x1f
	bl _ll_mul
	add r2, r0, #0
	ldr r0, [r7, #0x14]
	mov r3, #0
	mov r7, #2
	lsl r7, r7, #0xa
	add r2, r2, r7
	adc r1, r3
	lsl r1, r1, #0x14
	lsr r2, r2, #0xc
	orr r2, r1
	add r0, r0, r2
	asr r2, r6, #0x1f
	lsr r1, r6, #0x10
	lsl r2, r2, #0x10
	orr r2, r1
	lsl r1, r6, #0x10
	add r6, r1, r7
	adc r2, r3
	lsl r1, r2, #0x14
	lsr r2, r6, #0xc
	orr r2, r1
	add r1, r0, r2
	ldr r0, [sp, #0xc]
	str r3, [sp, #8]
	sub r0, r1, r0
	str r0, [sp, #0xc]
	add r0, r5, #0
	add r1, sp, #8
	str r3, [sp, #0x10]
	bl sub_0205F9A0
	mov r0, #1
	ldrsb r1, [r4, r0]
	sub r1, r1, #1
	strb r1, [r4, #1]
	ldrb r1, [r4, #2]
	add r1, r1, #1
	strb r1, [r4, #2]
	ldrsb r0, [r4, r0]
	cmp r0, #0
	ble _02063550
	add sp, #0x14
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_02063550:
	mov r0, #0
	str r0, [sp, #0x10]
	str r0, [sp, #0xc]
	str r0, [sp, #8]
	add r0, r5, #0
	add r1, sp, #8
	bl sub_0205F97C
	add r0, r5, #0
	add r1, sp, #8
	bl sub_0205F9A0
	ldr r2, [r4, #8]
	mov r1, #1
	ldrsb r1, [r2, r1]
	add r0, r5, #0
	bl MapObject_AddCurrentX
	ldr r2, [r4, #8]
	mov r1, #2
	ldrsb r1, [r2, r1]
	add r0, r5, #0
	bl MapObject_AddCurrentHeight
	ldr r2, [r4, #8]
	mov r1, #3
	ldrsb r1, [r2, r1]
	add r0, r5, #0
	bl MapObject_AddCurrentY
	ldr r6, [r4, #8]
	mov r0, #1
	ldrsb r1, [r6, r0]
	lsl r0, r1, #4
	cmp r0, #0
	ble _020635AA
	lsl r0, r1, #0x10
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _020635B8
_020635AA:
	lsl r0, r1, #0x10
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_020635B8:
	bl _ffix
	ldr r1, [r6, #0x10]
	add r0, r1, r0
	str r0, [sp, #8]
	ldr r6, [r4, #8]
	mov r0, #2
	ldrsb r1, [r6, r0]
	lsl r0, r1, #4
	cmp r0, #0
	ble _020635E0
	lsl r0, r1, #0x10
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _020635EE
_020635E0:
	lsl r0, r1, #0x10
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_020635EE:
	bl _ffix
	ldr r1, [r6, #0x14]
	add r0, r1, r0
	str r0, [sp, #0xc]
	ldr r6, [r4, #8]
	mov r0, #3
	ldrsb r1, [r6, r0]
	lsl r0, r1, #4
	cmp r0, #0
	ble _02063616
	lsl r0, r1, #0x10
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _02063624
_02063616:
	lsl r0, r1, #0x10
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_02063624:
	bl _ffix
	ldr r1, [r6, #0x18]
	add r0, r1, r0
	str r0, [sp, #0x10]
	add r0, r5, #0
	add r1, sp, #8
	bl MapObject_SetPositionVec
	add r0, r5, #0
	bl sub_02061070
	ldr r1, _0206367C ; =0x00020008
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
	bl sub_0205F4E4
	add r0, r5, #0
	bl sub_0205F684
	cmp r0, #0
	bne _0206366E
	ldr r0, _02063680 ; =SEQ_SE_DP_SUTYA2
	bl PlaySE
_0206366E:
	ldr r0, [r4, #8]
	bl FreeToHeap
	mov r0, #0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_0206367C: .word 0x00020008
_02063680: .word SEQ_SE_DP_SUTYA2
	thumb_func_end sub_02063424

	thumb_func_start sub_02063684
sub_02063684: ; 0x02063684
	push {lr}
	sub sp, #0xc
	mov r2, #1
	str r2, [sp]
	mov r1, #0xf
	str r1, [sp, #4]
	mov r1, #3
	str r1, [sp, #8]
	mov r1, #0
	mov r3, #5
	bl sub_020632B0
	mov r0, #1
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end sub_02063684

	thumb_func_start sub_020636A4
sub_020636A4: ; 0x020636A4
	push {lr}
	sub sp, #0xc
	mov r2, #3
	str r2, [sp]
	mov r1, #0xc
	str r1, [sp, #4]
	str r2, [sp, #8]
	mov r2, #0
	mov r1, #4
	add r3, r2, #0
	bl sub_020632B0
	mov r0, #1
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end sub_020636A4

	thumb_func_start sub_020636C4
sub_020636C4: ; 0x020636C4
	push {lr}
	sub sp, #0xc
	mov r1, #0
	str r1, [sp]
	mov r2, #0xf
	str r2, [sp, #4]
	mov r3, #3
	str r3, [sp, #8]
	add r2, r1, #0
	sub r3, #8
	bl sub_020632B0
	mov r0, #1
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end sub_020636C4

	thumb_func_start sub_020636E4
sub_020636E4: ; 0x020636E4
	push {lr}
	sub sp, #0xc
	mov r2, #0
	str r2, [sp]
	mov r1, #9
	str r1, [sp, #4]
	mov r3, #3
	str r3, [sp, #8]
	sub r1, r3, #5
	sub r3, r3, #6
	bl sub_020632B0
	mov r0, #1
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end sub_020636E4

	thumb_func_start sub_02063704
sub_02063704: ; 0x02063704
	push {lr}
	sub sp, #0xc
	mov r1, #2
	str r1, [sp]
	mov r1, #0xc
	str r1, [sp, #4]
	mov r1, #3
	str r1, [sp, #8]
	sub r1, r1, #7
	mov r2, #1
	add r3, r1, #0
	bl sub_020632B0
	mov r0, #1
	add sp, #0xc
	pop {pc}
	thumb_func_end sub_02063704

	thumb_func_start sub_02063724
sub_02063724: ; 0x02063724
	push {lr}
	sub sp, #0xc
	mov r2, #3
	str r2, [sp]
	mov r1, #6
	str r1, [sp, #4]
	str r2, [sp, #8]
	mov r1, #2
	mov r2, #1
	mov r3, #0
	bl sub_020632B0
	mov r0, #1
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end sub_02063724

	thumb_func_start sub_02063744
sub_02063744: ; 0x02063744
	push {lr}
	sub sp, #0xc
	mov r1, #1
	str r1, [sp]
	mov r1, #0xc
	str r1, [sp, #4]
	mov r1, #3
	str r1, [sp, #8]
	sub r1, r1, #4
	mov r2, #0
	mov r3, #5
	bl sub_020632B0
	mov r0, #1
	add sp, #0xc
	pop {pc}
	thumb_func_end sub_02063744

	thumb_func_start sub_02063764
sub_02063764: ; 0x02063764
	push {lr}
	sub sp, #0xc
	mov r1, #2
	str r1, [sp]
	mov r1, #6
	str r1, [sp, #4]
	mov r1, #3
	mov r2, #0
	str r1, [sp, #8]
	sub r1, r1, #6
	add r3, r2, #0
	bl sub_020632B0
	mov r0, #1
	add sp, #0xc
	pop {pc}
	thumb_func_end sub_02063764

	thumb_func_start sub_02063784
sub_02063784: ; 0x02063784
	push {lr}
	sub sp, #0xc
	mov r1, #2
	str r1, [sp]
	mov r1, #9
	str r1, [sp, #4]
	mov r1, #3
	mov r2, #0
	str r1, [sp, #8]
	sub r1, r1, #6
	add r3, r2, #0
	bl sub_020632B0
	mov r0, #1
	add sp, #0xc
	pop {pc}
	thumb_func_end sub_02063784

	thumb_func_start sub_020637A4
sub_020637A4: ; 0x020637A4
	push {lr}
	sub sp, #0xc
	mov r1, #3
	str r1, [sp]
	mov r2, #6
	str r2, [sp, #4]
	mov r2, #1
	sub r3, r2, #2
	str r1, [sp, #8]
	bl sub_020632B0
	mov r0, #1
	add sp, #0xc
	pop {pc}
	thumb_func_end sub_020637A4

	thumb_func_start sub_020637C0
sub_020637C0: ; 0x020637C0
	push {lr}
	sub sp, #0xc
	mov r1, #1
	str r1, [sp]
	mov r1, #9
	str r1, [sp, #4]
	mov r1, #3
	str r1, [sp, #8]
	mov r1, #0
	add r2, r1, #0
	mov r3, #4
	bl sub_020632B0
	mov r0, #1
	add sp, #0xc
	pop {pc}
	thumb_func_end sub_020637C0

	thumb_func_start sub_020637E0
sub_020637E0: ; 0x020637E0
	push {lr}
	sub sp, #0xc
	mov r1, #2
	str r1, [sp]
	mov r1, #0xc
	str r1, [sp, #4]
	mov r1, #3
	mov r2, #0
	str r1, [sp, #8]
	sub r1, r1, #7
	add r3, r2, #0
	bl sub_020632B0
	mov r0, #1
	add sp, #0xc
	pop {pc}
	thumb_func_end sub_020637E0

	thumb_func_start sub_02063800
sub_02063800: ; 0x02063800
	push {lr}
	sub sp, #0xc
	mov r1, #0
	str r1, [sp]
	mov r2, #6
	str r2, [sp, #4]
	mov r3, #3
	str r3, [sp, #8]
	sub r2, r3, #4
	sub r3, r3, #7
	bl sub_020632B0
	mov r0, #1
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end sub_02063800

	thumb_func_start sub_02063820
sub_02063820: ; 0x02063820
	push {lr}
	sub sp, #0xc
	mov r1, #0
	str r1, [sp]
	mov r1, #9
	str r1, [sp, #4]
	mov r1, #3
	str r1, [sp, #8]
	mov r1, #1
	add r2, r1, #0
	sub r3, r1, #4
	bl sub_020632B0
	mov r0, #1
	add sp, #0xc
	pop {pc}
	thumb_func_end sub_02063820

	thumb_func_start sub_02063840
sub_02063840: ; 0x02063840
	push {lr}
	sub sp, #0xc
	mov r1, #3
	str r1, [sp]
	mov r2, #9
	str r2, [sp, #4]
	mov r2, #0
	add r3, r2, #0
	str r1, [sp, #8]
	bl sub_020632B0
	mov r0, #1
	add sp, #0xc
	pop {pc}
	thumb_func_end sub_02063840

	thumb_func_start sub_0206385C
sub_0206385C: ; 0x0206385C
	push {lr}
	sub sp, #0xc
	mov r1, #1
	str r1, [sp]
	mov r1, #0xc
	str r1, [sp, #4]
	mov r1, #3
	str r1, [sp, #8]
	mov r1, #0
	add r2, r1, #0
	mov r3, #4
	bl sub_020632B0
	mov r0, #1
	add sp, #0xc
	pop {pc}
	thumb_func_end sub_0206385C

	thumb_func_start sub_0206387C
sub_0206387C: ; 0x0206387C
	push {lr}
	sub sp, #0xc
	mov r1, #1
	str r1, [sp]
	mov r1, #0xc
	str r1, [sp, #4]
	mov r1, #3
	str r1, [sp, #8]
	mov r1, #0
	add r2, r1, #0
	mov r3, #5
	bl sub_020632B0
	mov r0, #1
	add sp, #0xc
	pop {pc}
	thumb_func_end sub_0206387C

	thumb_func_start sub_0206389C
sub_0206389C: ; 0x0206389C
	push {lr}
	sub sp, #0xc
	mov r2, #1
	str r2, [sp]
	mov r1, #9
	str r1, [sp, #4]
	mov r1, #3
	str r1, [sp, #8]
	mov r1, #2
	mov r3, #5
	bl sub_020632B0
	mov r0, #1
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end sub_0206389C

	thumb_func_start sub_020638BC
sub_020638BC: ; 0x020638BC
	push {lr}
	sub sp, #0xc
	mov r2, #1
	str r2, [sp]
	mov r1, #9
	str r1, [sp, #4]
	mov r1, #3
	str r1, [sp, #8]
	mov r1, #2
	mov r3, #4
	bl sub_020632B0
	mov r0, #1
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end sub_020638BC

	thumb_func_start sub_020638DC
sub_020638DC: ; 0x020638DC
	push {lr}
	sub sp, #0xc
	mov r1, #1
	str r1, [sp]
	mov r2, #0xc
	str r2, [sp, #4]
	mov r2, #3
	str r2, [sp, #8]
	mov r2, #0
	mov r3, #5
	bl sub_020632B0
	mov r0, #1
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end sub_020638DC

	thumb_func_start sub_020638FC
sub_020638FC: ; 0x020638FC
	push {lr}
	sub sp, #0xc
	mov r1, #1
	str r1, [sp]
	mov r1, #6
	str r1, [sp, #4]
	mov r1, #3
	str r1, [sp, #8]
	mov r1, #0
	add r2, r1, #0
	mov r3, #2
	bl sub_020632B0
	mov r0, #1
	add sp, #0xc
	pop {pc}
	thumb_func_end sub_020638FC

	thumb_func_start sub_0206391C
sub_0206391C: ; 0x0206391C
	push {lr}
	sub sp, #0xc
	mov r2, #3
	str r2, [sp]
	mov r1, #6
	str r1, [sp, #4]
	str r2, [sp, #8]
	mov r2, #0
	mov r1, #2
	add r3, r2, #0
	bl sub_020632B0
	mov r0, #1
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end sub_0206391C

	thumb_func_start sub_0206393C
sub_0206393C: ; 0x0206393C
	push {lr}
	sub sp, #0xc
	mov r1, #3
	str r1, [sp]
	mov r2, #9
	str r2, [sp, #4]
	mov r2, #0
	add r3, r2, #0
	str r1, [sp, #8]
	bl sub_020632B0
	mov r0, #1
	add sp, #0xc
	pop {pc}
	thumb_func_end sub_0206393C

	thumb_func_start sub_02063958
sub_02063958: ; 0x02063958
	push {lr}
	sub sp, #0xc
	mov r1, #1
	str r1, [sp]
	mov r1, #6
	str r1, [sp, #4]
	mov r1, #3
	str r1, [sp, #8]
	mov r1, #0
	add r2, r1, #0
	mov r3, #2
	bl sub_020632B0
	mov r0, #1
	add sp, #0xc
	pop {pc}
	thumb_func_end sub_02063958

	thumb_func_start sub_02063978
sub_02063978: ; 0x02063978
	push {lr}
	sub sp, #0xc
	mov r1, #2
	str r1, [sp]
	mov r1, #9
	str r1, [sp, #4]
	mov r1, #3
	mov r2, #0
	str r1, [sp, #8]
	sub r1, r1, #6
	add r3, r2, #0
	bl sub_020632B0
	mov r0, #1
	add sp, #0xc
	pop {pc}
	thumb_func_end sub_02063978

	thumb_func_start sub_02063998
sub_02063998: ; 0x02063998
	push {lr}
	sub sp, #0xc
	mov r1, #0
	str r1, [sp]
	mov r2, #6
	str r2, [sp, #4]
	mov r3, #3
	str r3, [sp, #8]
	add r2, r1, #0
	sub r3, r3, #5
	bl sub_020632B0
	mov r0, #1
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end sub_02063998

	thumb_func_start sub_020639B8
sub_020639B8: ; 0x020639B8
	push {lr}
	sub sp, #0xc
	mov r1, #0
	str r1, [sp]
	mov r2, #9
	str r2, [sp, #4]
	mov r3, #3
	str r3, [sp, #8]
	add r2, r1, #0
	sub r3, r3, #6
	bl sub_020632B0
	mov r0, #1
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end sub_020639B8

	thumb_func_start sub_020639D8
sub_020639D8: ; 0x020639D8
	push {lr}
	sub sp, #0xc
	mov r3, #1
	str r3, [sp]
	mov r1, #9
	str r1, [sp, #4]
	mov r1, #3
	mov r2, #0
	str r1, [sp, #8]
	bl sub_020632B0
	mov r0, #1
	add sp, #0xc
	pop {pc}
	thumb_func_end sub_020639D8

	thumb_func_start sub_020639F4
sub_020639F4: ; 0x020639F4
	push {lr}
	sub sp, #0xc
	mov r2, #3
	str r2, [sp]
	mov r1, #9
	str r1, [sp, #4]
	str r2, [sp, #8]
	mov r2, #0
	mov r1, #4
	add r3, r2, #0
	bl sub_020632B0
	mov r0, #1
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end sub_020639F4

	thumb_func_start sub_02063A14
sub_02063A14: ; 0x02063A14
	ldr r3, _02063A18 ; =sub_02063A40
	bx r3
	.balign 4, 0
_02063A18: .word sub_02063A40
	thumb_func_end sub_02063A14

	thumb_func_start sub_02063A1C
sub_02063A1C: ; 0x02063A1C
	push {r4, lr}
	add r4, r0, #0
	bl sub_02063A5C
	cmp r0, #0
	bne _02063A2C
	mov r0, #0
	pop {r4, pc}
_02063A2C:
	add r0, r4, #0
	bl sub_02063A78
	cmp r0, #0
	beq _02063A3A
	mov r0, #1
	pop {r4, pc}
_02063A3A:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02063A1C

	thumb_func_start sub_02063A40
sub_02063A40: ; 0x02063A40
	push {r4, lr}
	add r4, r0, #0
	bl MapObject_GetType
	add r1, r0, #0
	lsl r2, r1, #2
	ldr r1, _02063A58 ; =_020FE104
	add r0, r4, #0
	ldr r1, [r1, r2]
	blx r1
	pop {r4, pc}
	nop
_02063A58: .word _020FE104
	thumb_func_end sub_02063A40

	thumb_func_start sub_02063A5C
sub_02063A5C: ; 0x02063A5C
	push {r4, lr}
	add r4, r0, #0
	bl MapObject_GetType
	add r1, r0, #0
	lsl r2, r1, #2
	ldr r1, _02063A74 ; =_020FE134
	add r0, r4, #0
	ldr r1, [r1, r2]
	blx r1
	pop {r4, pc}
	nop
_02063A74: .word _020FE134
	thumb_func_end sub_02063A5C

	thumb_func_start sub_02063A78
sub_02063A78: ; 0x02063A78
	push {r4, lr}
	add r4, r0, #0
	bl MapObject_GetType
	add r1, r0, #0
	lsl r2, r1, #2
	ldr r1, _02063A90 ; =_020FE164
	add r0, r4, #0
	ldr r1, [r1, r2]
	blx r1
	pop {r4, pc}
	nop
_02063A90: .word _020FE164
	thumb_func_end sub_02063A78

	thumb_func_start sub_02063A94
sub_02063A94: ; 0x02063A94
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl MapObject_GetCurrentX
	add r5, r0, #0
	add r0, r4, #0
	bl MapObject_GetPrevX
	cmp r5, r0
	beq _02063AAC
	mov r0, #1
	pop {r3, r4, r5, pc}
_02063AAC:
	add r0, r4, #0
	bl MapObject_GetCurrentY
	add r5, r0, #0
	add r0, r4, #0
	bl MapObject_GetPrevY
	cmp r5, r0
	beq _02063AC2
	mov r0, #1
	pop {r3, r4, r5, pc}
_02063AC2:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02063A94

	thumb_func_start sub_02063AC8
sub_02063AC8: ; 0x02063AC8
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl MapObject_GetCurrentX
	add r5, r0, #0
	add r0, r4, #0
	bl MapObject_GetPrevX
	cmp r5, r0
	beq _02063AE0
	mov r0, #0
	pop {r3, r4, r5, pc}
_02063AE0:
	add r0, r4, #0
	bl MapObject_GetCurrentY
	add r5, r0, #0
	add r0, r4, #0
	bl MapObject_GetPrevY
	cmp r5, r0
	bne _02063AF6
	mov r0, #1
	pop {r3, r4, r5, pc}
_02063AF6:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02063AC8

	thumb_func_start sub_02063AFC
sub_02063AFC: ; 0x02063AFC
	bx lr
	.balign 4, 0
	thumb_func_end sub_02063AFC

	thumb_func_start sub_02063B00
sub_02063B00: ; 0x02063B00
	mov r0, #0
	bx lr
	thumb_func_end sub_02063B00

	thumb_func_start sub_02063B04
sub_02063B04: ; 0x02063B04
	mov r0, #0
	bx lr
	thumb_func_end sub_02063B04

	thumb_func_start sub_02063B08
sub_02063B08: ; 0x02063B08
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r1, #9
	bl sub_0205F398
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #1
	bl MapObject_GetParam
	strb r0, [r4, #3]
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02063B08

	thumb_func_start sub_02063B20
sub_02063B20: ; 0x02063B20
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_0205F3BC
	add r4, r0, #0
	ldrb r0, [r4]
	cmp r0, #3
	bhi _02063B98
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02063B3C: ; jump table
	.short _02063B44 - _02063B3C - 2 ; case 0
	.short _02063B56 - _02063B3C - 2 ; case 1
	.short _02063B7E - _02063B3C - 2 ; case 2
	.short _02063B94 - _02063B3C - 2 ; case 3
_02063B44:
	add r0, r5, #0
	bl sub_02063A94
	cmp r0, #1
	bne _02063B98
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _02063B98
_02063B56:
	add r0, r5, #0
	bl sub_02063AC8
	cmp r0, #0
	beq _02063B98
	mov r0, #2
	ldrsb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, #2]
	ldrsb r1, [r4, r0]
	mov r0, #3
	ldrsb r0, [r4, r0]
	cmp r1, r0
	bge _02063B78
	mov r0, #0
	strb r0, [r4]
	b _02063B98
_02063B78:
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
_02063B7E:
	add r0, r5, #0
	bl sub_0205F648
	cmp r0, #1
	beq _02063B98
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	mov r0, #0
	strb r0, [r4, #2]
	strb r0, [r4, #1]
_02063B94:
	mov r0, #1
	pop {r3, r4, r5, pc}
_02063B98:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02063B20

	thumb_func_start sub_02063B9C
sub_02063B9C: ; 0x02063B9C
	push {r4, r5, r6, lr}
	sub sp, #0x20
	add r5, r0, #0
	bl sub_0205F3BC
	add r4, r0, #0
	ldrb r0, [r4, #1]
	cmp r0, #3
	bhi _02063C7A
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02063BBA: ; jump table
	.short _02063BC2 - _02063BBA - 2 ; case 0
	.short _02063BE4 - _02063BBA - 2 ; case 1
	.short _02063C16 - _02063BBA - 2 ; case 2
	.short _02063C2C - _02063BBA - 2 ; case 3
_02063BC2:
	ldr r3, _02063C80 ; =_020FE0C4
	add r2, sp, #0x10
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	add r0, r5, #0
	bl MapObject_GetFacingDirection
	strb r0, [r4, #4]
	lsl r1, r0, #2
	add r0, sp, #0x10
	ldr r0, [r0, r1]
	strb r0, [r4, #5]
	ldrb r0, [r4, #1]
	add r0, r0, #1
	strb r0, [r4, #1]
_02063BE4:
	ldr r6, _02063C84 ; =_020FE0D4
	add r3, sp, #0
	add r2, r3, #0
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	mov r0, #5
	ldrsb r0, [r4, r0]
	lsl r3, r0, #3
	mov r0, #6
	ldrsb r0, [r4, r0]
	lsl r1, r0, #2
	add r0, r2, r3
	ldr r0, [r1, r0]
	mov r1, #0
	bl sub_0206234C
	add r1, r0, #0
	add r0, r5, #0
	bl sub_0206217C
	ldrb r0, [r4, #1]
	add r0, r0, #1
	strb r0, [r4, #1]
_02063C16:
	add r0, r5, #0
	bl sub_02062428
	cmp r0, #0
	bne _02063C26
	add sp, #0x20
	mov r0, #1
	pop {r4, r5, r6, pc}
_02063C26:
	ldrb r0, [r4, #1]
	add r0, r0, #1
	strb r0, [r4, #1]
_02063C2C:
	mov r0, #8
	ldrsb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, #8]
	ldrsb r0, [r4, r0]
	cmp r0, #8
	bge _02063C40
	add sp, #0x20
	mov r0, #1
	pop {r4, r5, r6, pc}
_02063C40:
	mov r0, #0
	strb r0, [r4, #8]
	mov r0, #7
	ldrsb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, #7]
	ldrsb r0, [r4, r0]
	cmp r0, #4
	bge _02063C64
	mov r0, #6
	ldrsb r0, [r4, r0]
	add sp, #0x20
	add r1, r0, #1
	mov r0, #1
	and r1, r0
	strb r1, [r4, #6]
	strb r0, [r4, #1]
	pop {r4, r5, r6, pc}
_02063C64:
	mov r1, #4
	ldrsb r1, [r4, r1]
	add r0, r5, #0
	bl MapObject_SetFacingDirection
	ldrb r0, [r4, #1]
	add r0, r0, #1
	strb r0, [r4, #1]
	mov r0, #0
	strb r0, [r4, #7]
	strb r0, [r4]
_02063C7A:
	mov r0, #0
	add sp, #0x20
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02063C80: .word _020FE0C4
_02063C84: .word _020FE0D4
	thumb_func_end sub_02063B9C

	thumb_func_start sub_02063C88
sub_02063C88: ; 0x02063C88
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r1, #9
	bl sub_0205F398
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #1
	bl MapObject_GetParam
	strb r0, [r4, #3]
	add r0, r5, #0
	bl MapObject_GetType
	cmp r0, #5
	beq _02063CAC
	mov r0, #1
	b _02063CAE
_02063CAC:
	mov r0, #0
_02063CAE:
	strb r0, [r4, #5]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02063C88

	thumb_func_start sub_02063CB4
sub_02063CB4: ; 0x02063CB4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_0205F3BC
	add r4, r0, #0
	ldrb r0, [r4]
	cmp r0, #3
	bhi _02063D2C
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02063CD0: ; jump table
	.short _02063CD8 - _02063CD0 - 2 ; case 0
	.short _02063CEA - _02063CD0 - 2 ; case 1
	.short _02063D12 - _02063CD0 - 2 ; case 2
	.short _02063D28 - _02063CD0 - 2 ; case 3
_02063CD8:
	add r0, r5, #0
	bl sub_02063A94
	cmp r0, #1
	bne _02063D2C
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _02063D2C
_02063CEA:
	add r0, r5, #0
	bl sub_02063AC8
	cmp r0, #0
	beq _02063D2C
	mov r0, #2
	ldrsb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, #2]
	ldrsb r1, [r4, r0]
	mov r0, #3
	ldrsb r0, [r4, r0]
	cmp r1, r0
	bge _02063D0C
	mov r0, #0
	strb r0, [r4]
	b _02063D2C
_02063D0C:
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
_02063D12:
	add r0, r5, #0
	bl sub_0205F648
	cmp r0, #1
	beq _02063D2C
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	mov r0, #0
	strb r0, [r4, #2]
	strb r0, [r4, #1]
_02063D28:
	mov r0, #1
	pop {r3, r4, r5, pc}
_02063D2C:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02063CB4

	thumb_func_start sub_02063D30
sub_02063D30: ; 0x02063D30
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	ldr r3, _02063E4C ; =_020FE0E4
	add r2, sp, #0
	add r7, r0, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	add r0, r7, #0
	bl sub_0205F3BC
	add r4, r0, #0
	ldrb r0, [r4, #1]
	cmp r0, #3
	bhi _02063E46
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02063D64: ; jump table
	.short _02063D6C - _02063D64 - 2 ; case 0
	.short _02063DB2 - _02063D64 - 2 ; case 1
	.short _02063DD8 - _02063D64 - 2 ; case 2
	.short _02063DEE - _02063D64 - 2 ; case 3
_02063D6C:
	add r0, r7, #0
	bl MapObject_GetFacingDirection
	mov r5, #0
	add r6, r0, #0
	add r1, r5, #0
	add r0, sp, #0
	mov r2, #5
	b _02063D82
_02063D7E:
	add r1, r1, #4
	add r5, r5, #1
_02063D82:
	cmp r5, #4
	bge _02063D92
	ldrsb r3, [r4, r2]
	lsl r3, r3, #4
	add r3, r0, r3
	ldr r3, [r1, r3]
	cmp r6, r3
	bne _02063D7E
_02063D92:
	cmp r5, #4
	blt _02063D9A
	bl GF_AssertFail
_02063D9A:
	add r0, r5, #1
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x1e
	sub r1, r1, r2
	mov r0, #0x1e
	ror r1, r0
	strb r6, [r4, #4]
	add r0, r2, r1
	strb r0, [r4, #6]
	ldrb r0, [r4, #1]
	add r0, r0, #1
	strb r0, [r4, #1]
_02063DB2:
	mov r0, #5
	ldrsb r0, [r4, r0]
	add r2, sp, #0
	lsl r3, r0, #4
	mov r0, #6
	ldrsb r0, [r4, r0]
	lsl r1, r0, #2
	add r0, r2, r3
	ldr r0, [r1, r0]
	mov r1, #0
	bl sub_0206234C
	add r1, r0, #0
	add r0, r7, #0
	bl sub_0206217C
	ldrb r0, [r4, #1]
	add r0, r0, #1
	strb r0, [r4, #1]
_02063DD8:
	add r0, r7, #0
	bl sub_02062428
	cmp r0, #0
	bne _02063DE8
	add sp, #0x20
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02063DE8:
	ldrb r0, [r4, #1]
	add r0, r0, #1
	strb r0, [r4, #1]
_02063DEE:
	mov r0, #8
	ldrsb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, #8]
	ldrsb r0, [r4, r0]
	cmp r0, #8
	bge _02063E02
	add sp, #0x20
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02063E02:
	mov r0, #0
	strb r0, [r4, #8]
	mov r0, #7
	ldrsb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, #7]
	ldrsb r0, [r4, r0]
	cmp r0, #4
	bge _02063E30
	mov r0, #6
	ldrsb r0, [r4, r0]
	add sp, #0x20
	add r0, r0, #1
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x1e
	sub r1, r1, r2
	mov r0, #0x1e
	ror r1, r0
	add r0, r2, r1
	strb r0, [r4, #6]
	mov r0, #1
	strb r0, [r4, #1]
	pop {r3, r4, r5, r6, r7, pc}
_02063E30:
	mov r1, #4
	ldrsb r1, [r4, r1]
	add r0, r7, #0
	bl MapObject_SetFacingDirection
	ldrb r0, [r4, #1]
	add r0, r0, #1
	strb r0, [r4, #1]
	mov r0, #0
	strb r0, [r4, #7]
	strb r0, [r4]
_02063E46:
	mov r0, #0
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02063E4C: .word _020FE0E4
	thumb_func_end sub_02063D30

	thumb_func_start sub_02063E50
sub_02063E50: ; 0x02063E50
	push {r4, lr}
	mov r1, #0x18
	add r4, r0, #0
	bl sub_0205F3E8
	ldr r1, _02063E6C ; =0x00000106
	str r1, [r0]
	mov r1, #0
	str r1, [r0, #4]
	add r0, r4, #0
	bl sub_0205F484
	pop {r4, pc}
	nop
_02063E6C: .word 0x00000106
	thumb_func_end sub_02063E50

	thumb_func_start sub_02063E70
sub_02063E70: ; 0x02063E70
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl sub_0205F394
	add r7, r0, #0
	add r0, r5, #0
	bl sub_0205F40C
	add r4, r0, #0
	add r0, r5, #0
	bl MapObject_GetFieldSysPtr
	add r1, r5, #0
	bl sub_02055780
	add r6, r0, #0
	add r0, r5, #0
	bl ov01_021FA2D4
	cmp r0, #1
	bne _02063E9C
	b _02063FDC
_02063E9C:
	ldr r0, [r4, #8]
	cmp r0, #0
	bne _02063ECC
	add r0, r5, #0
	bl MapObject_GetFieldSysPtr
	add r1, r5, #0
	bl sub_020557A0
	add r1, r6, #0
	bl sub_020640A4
	str r0, [r4]
	ldr r1, [r4]
	add r0, r5, #0
	bl MapObject_SetGfxID
	add r1, r4, #0
	ldr r2, [r4]
	add r0, r5, #0
	add r1, #8
	bl ov01_021F94C0
	b _02063F22
_02063ECC:
	ldr r0, [r4, #4]
	cmp r6, r0
	beq _02063F22
	add r1, r4, #0
	ldr r2, [r4]
	add r0, r5, #0
	add r1, #8
	bl ov01_021F95CC
	add r0, r5, #0
	bl MapObject_GetFieldSysPtr
	add r1, r5, #0
	bl sub_020557A0
	add r1, r6, #0
	bl sub_020640A4
	str r0, [r4]
	ldr r1, [r4]
	add r0, r5, #0
	bl MapObject_SetGfxID
	ldr r1, [r4]
	ldr r0, _02063FE0 ; =0x0000FFFF
	cmp r1, r0
	beq _02063F1A
	cmp r6, #1
	bne _02063F0C
	add r0, r5, #0
	bl ov01_021FE66C
_02063F0C:
	add r1, r4, #0
	ldr r2, [r4]
	add r0, r5, #0
	add r1, #8
	bl ov01_021F94C0
	b _02063F1E
_02063F1A:
	bl GF_AssertFail
_02063F1E:
	mov r0, #0
	strh r0, [r7, #2]
_02063F22:
	add r0, r5, #0
	str r6, [r4, #4]
	bl ov01_021FA2D4
	cmp r0, #1
	beq _02063FDC
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _02063FDC
	add r0, r5, #0
	bl ov01_021FA3E8
	add r0, r5, #0
	bl ov01_021F9344
	cmp r0, #0
	bne _02063FD4
	add r0, r5, #0
	bl sub_0205F330
	cmp r0, #0
	beq _02063F58
	cmp r0, #1
	beq _02063F74
	cmp r0, #2
	beq _02063F90
	b _02063FAC
_02063F58:
	ldr r0, [r4, #8]
	bl sub_02023EF4
	cmp r0, #0
	beq _02063FCA
	ldr r0, [r4, #8]
	mov r1, #0
	bl sub_02023EE0
	ldr r0, [r4, #8]
	mov r1, #0
	bl sub_02023F40
	b _02063FCA
_02063F74:
	ldr r0, [r4, #8]
	bl sub_02023EF4
	cmp r0, #1
	beq _02063FCA
	ldr r0, [r4, #8]
	mov r1, #1
	bl sub_02023EE0
	ldr r0, [r4, #8]
	mov r1, #0
	bl sub_02023F40
	b _02063FCA
_02063F90:
	ldr r0, [r4, #8]
	bl sub_02023EF4
	cmp r0, #2
	beq _02063FCA
	ldr r0, [r4, #8]
	mov r1, #2
	bl sub_02023EE0
	ldr r0, [r4, #8]
	mov r1, #0
	bl sub_02023F40
	b _02063FCA
_02063FAC:
	bl GF_AssertFail
	ldr r0, [r4, #8]
	bl sub_02023EF4
	cmp r0, #0
	beq _02063FCA
	ldr r0, [r4, #8]
	mov r1, #0
	bl sub_02023EE0
	ldr r0, [r4, #8]
	mov r1, #0
	bl sub_02023F40
_02063FCA:
	mov r1, #1
	ldr r0, [r4, #8]
	lsl r1, r1, #0xc
	bl sub_02023F04
_02063FD4:
	ldr r1, [r4, #8]
	add r0, r5, #0
	bl ov01_021FA40C
_02063FDC:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02063FE0: .word 0x0000FFFF
	thumb_func_end sub_02063E70

	thumb_func_start sub_02063FE4
sub_02063FE4: ; 0x02063FE4
	push {r4, lr}
	add r4, r0, #0
	bl sub_0205F40C
	add r2, r0, #0
	add r1, r2, #0
	ldr r2, [r2]
	add r0, r4, #0
	add r1, #8
	bl ov01_021F95CC
	pop {r4, pc}
	thumb_func_end sub_02063FE4

	thumb_func_start sub_02063FFC
sub_02063FFC: ; 0x02063FFC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_0205F40C
	add r4, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _02064014
	add r1, r4, #0
	add r1, #0xc
	bl ov01_021F9610
_02064014:
	add r1, r4, #0
	ldr r2, [r4]
	add r0, r5, #0
	add r1, #8
	bl ov01_021F95CC
	mov r1, #2
	add r0, r5, #0
	lsl r1, r1, #0x14
	bl MapObject_SetBits
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02063FFC

	thumb_func_start sub_0206402C
sub_0206402C: ; 0x0206402C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_0205F40C
	add r4, r0, #0
	add r0, r5, #0
	bl ov01_021FA2D4
	cmp r0, #1
	beq _0206407E
	ldr r0, [r4, #8]
	cmp r0, #0
	bne _0206405E
	ldr r2, [r4]
	ldr r0, _02064080 ; =0x0000FFFF
	cmp r2, r0
	beq _0206405A
	add r1, r4, #0
	add r0, r5, #0
	add r1, #8
	bl ov01_021F94C0
	b _0206405E
_0206405A:
	bl GF_AssertFail
_0206405E:
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0206407E
	add r1, r4, #0
	add r1, #0xc
	bl ov01_021F9630
	ldr r1, [r4, #8]
	add r0, r5, #0
	bl ov01_021FA3E8
	mov r1, #2
	add r0, r5, #0
	lsl r1, r1, #0x14
	bl MapObject_ClearBits
_0206407E:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02064080: .word 0x0000FFFF
	thumb_func_end sub_0206402C

	thumb_func_start sub_02064084
sub_02064084: ; 0x02064084
	push {r4, lr}
	add r4, r0, #0
	bl ov01_021FA2D4
	cmp r0, #1
	bne _02064098
	bl GF_AssertFail
	mov r0, #0
	pop {r4, pc}
_02064098:
	add r0, r4, #0
	bl sub_0205F40C
	ldr r0, [r0, #8]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02064084

	thumb_func_start sub_020640A4
sub_020640A4: ; 0x020640A4
	push {r4, lr}
	add r4, r0, #0
	cmp r1, #0
	bne _020640B0
	ldr r0, _020640C0 ; =0x00000106
	pop {r4, pc}
_020640B0:
	cmp r4, #0
	bne _020640B8
	bl GF_AssertFail
_020640B8:
	ldr r0, _020640C4 ; =ov01_02207274
	lsl r1, r4, #2
	ldr r0, [r0, r1]
	pop {r4, pc}
	.balign 4, 0
_020640C0: .word 0x00000106
_020640C4: .word ov01_02207274
	thumb_func_end sub_020640A4

	thumb_func_start TryGetSeenByNpcTrainers
TryGetSeenByNpcTrainers: ; 0x020640C8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x58
	add r5, r0, #0
	ldr r7, [r5, #0x40]
	add r4, r1, #0
	ldr r6, [r5, #0x3c]
	add r1, sp, #0x40
	str r1, [sp]
	add r1, r6, #0
	add r2, r7, #0
	mov r3, #0
	bl CheckSeenByNpcTrainers
	cmp r0, #0
	bne _020640EC
	add sp, #0x58
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_020640EC:
	ldr r0, [sp, #0x50]
	cmp r0, #0
	bne _02064172
	ldr r1, _020641E8 ; =std_trainer_approach
	ldr r2, [sp, #0x54]
	add r0, r5, #0
	bl StartMapSceneScript
	cmp r4, #0
	beq _02064114
	add r0, sp, #0x28
	str r0, [sp]
	ldr r3, [sp, #0x54]
	add r0, r5, #0
	add r1, r6, #0
	add r2, r7, #0
	bl CheckSeenByNpcTrainers
	cmp r0, #0
	bne _02064134
_02064114:
	ldr r0, [sp, #0x48]
	str r0, [sp]
	ldr r0, [sp, #0x4c]
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	ldr r1, [sp, #0x54]
	ldr r2, [sp, #0x40]
	ldr r3, [sp, #0x44]
	add r0, r5, #0
	bl FieldSys_SetEngagedTrainer
	add sp, #0x58
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02064134:
	ldr r0, [sp, #0x48]
	str r0, [sp]
	ldr r0, [sp, #0x4c]
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r1, [sp, #0x54]
	ldr r2, [sp, #0x40]
	ldr r3, [sp, #0x44]
	add r0, r5, #0
	bl FieldSys_SetEngagedTrainer
	ldr r0, [sp, #0x30]
	str r0, [sp]
	ldr r0, [sp, #0x34]
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	ldr r1, [sp, #0x3c]
	ldr r2, [sp, #0x28]
	ldr r3, [sp, #0x2c]
	add r0, r5, #0
	bl FieldSys_SetEngagedTrainer
	add sp, #0x58
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02064172:
	cmp r0, #1
	bne _020641DE
	cmp r4, #0
	bne _02064180
	add sp, #0x58
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02064180:
	ldr r2, [sp, #0x54]
	ldr r3, [sp, #0x4c]
	add r0, r5, #0
	add r1, r6, #0
	bl sub_02064520
	add r1, r0, #0
	ldr r2, [sp, #0x40]
	ldr r3, [sp, #0x44]
	add r0, sp, #0x10
	bl GetEngagingTrainerParams
	ldr r1, _020641E8 ; =std_trainer_approach
	ldr r2, [sp, #0x54]
	add r0, r5, #0
	bl StartMapSceneScript
	ldr r0, [sp, #0x48]
	str r0, [sp]
	ldr r0, [sp, #0x4c]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r1, [sp, #0x54]
	ldr r2, [sp, #0x40]
	ldr r3, [sp, #0x44]
	add r0, r5, #0
	bl FieldSys_SetEngagedTrainer
	ldr r0, [sp, #0x18]
	str r0, [sp]
	ldr r0, [sp, #0x1c]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	ldr r1, [sp, #0x24]
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	add r0, r5, #0
	bl FieldSys_SetEngagedTrainer
	add sp, #0x58
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_020641DE:
	bl GF_AssertFail
	mov r0, #0
	add sp, #0x58
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_020641E8: .word std_trainer_approach
	thumb_func_end TryGetSeenByNpcTrainers

	thumb_func_start CheckSeenByNpcTrainers
CheckSeenByNpcTrainers: ; 0x020641EC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0
	add r6, r1, #0
	add r7, r2, #0
	add r4, r3, #0
	str r0, [sp, #0xc]
	str r0, [sp, #4]
	add r0, r6, #0
	add r1, sp, #4
	add r2, sp, #0xc
	mov r3, #1
	bl sub_0205EEF4
	cmp r0, #0
	beq _02064264
_0206420E:
	cmp r4, #0
	beq _02064218
	ldr r0, [sp, #4]
	cmp r4, r0
	beq _02064254
_02064218:
	ldr r0, [sp, #4]
	add r1, r7, #0
	add r2, sp, #8
	bl sub_020642C4
	mov r1, #0
	mvn r1, r1
	str r0, [sp]
	cmp r0, r1
	beq _02064254
	ldr r0, [sp, #4]
	bl sub_02064508
	add r1, r0, #0
	lsl r1, r1, #0x10
	ldr r0, [r5, #0xc]
	lsr r1, r1, #0x10
	bl TrainerFlagCheck
	cmp r0, #0
	bne _02064254
	ldr r0, [sp, #0x28]
	ldr r1, [sp, #4]
	ldr r2, [sp]
	ldr r3, [sp, #8]
	bl GetEngagingTrainerParams
	add sp, #0x10
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02064254:
	add r0, r6, #0
	add r1, sp, #4
	add r2, sp, #0xc
	mov r3, #1
	bl sub_0205EEF4
	cmp r0, #0
	bne _0206420E
_02064264:
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end CheckSeenByNpcTrainers

	thumb_func_start GetEngagingTrainerParams
GetEngagingTrainerParams: ; 0x0206426C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	str r2, [r5]
	str r3, [r5, #4]
	add r0, r4, #0
	bl MapObject_GetScript
	str r0, [r5, #8]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl ScriptNumToTrainerNum
	str r0, [r5, #0xc]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl TrainerNumIsDouble
	str r0, [r5, #0x10]
	str r4, [r5, #0x14]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end GetEngagingTrainerParams

	thumb_func_start sub_02064298
sub_02064298: ; 0x02064298
	push {r3, lr}
	bl MapObject_GetType
	cmp r0, #8
	bhi _020642C2
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_020642AE: ; jump table
	.short _020642C2 - _020642AE - 2 ; case 0
	.short _020642C2 - _020642AE - 2 ; case 1
	.short _020642C2 - _020642AE - 2 ; case 2
	.short _020642C2 - _020642AE - 2 ; case 3
	.short _020642C0 - _020642AE - 2 ; case 4
	.short _020642C0 - _020642AE - 2 ; case 5
	.short _020642C0 - _020642AE - 2 ; case 6
	.short _020642C0 - _020642AE - 2 ; case 7
	.short _020642C0 - _020642AE - 2 ; case 8
_020642C0:
	mov r0, #1
_020642C2:
	pop {r3, pc}
	thumb_func_end sub_02064298

	thumb_func_start sub_020642C4
sub_020642C4: ; 0x020642C4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	add r4, r1, #0
	str r2, [sp, #8]
	bl sub_02064298
	cmp r0, #1
	bne _02064332
	add r0, r4, #0
	bl GetPlayerXCoord
	add r7, r0, #0
	add r0, r4, #0
	bl GetPlayerYCoord
	add r6, r0, #0
	add r0, r5, #0
	bl MapObject_GetFacingDirection
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #0
	bl MapObject_GetParam
	add r2, r0, #0
	str r6, [sp]
	mov r0, #0
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, r4, #0
	add r3, r7, #0
	bl sub_0206439C
	add r6, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r6, r0
	beq _0206432A
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl sub_02064468
	cmp r0, #0
	bne _0206432A
	ldr r0, [sp, #8]
	add sp, #0x14
	str r4, [r0]
	add r0, r6, #0
	pop {r4, r5, r6, r7, pc}
_0206432A:
	mov r0, #0
	add sp, #0x14
	mvn r0, r0
	pop {r4, r5, r6, r7, pc}
_02064332:
	cmp r0, #2
	bne _02064394
	add r0, r4, #0
	bl GetPlayerXCoord
	str r0, [sp, #0x10]
	add r0, r4, #0
	bl GetPlayerYCoord
	add r7, r0, #0
	add r0, r5, #0
	mov r1, #0
	bl MapObject_GetParam
	str r0, [sp, #0xc]
	mov r4, #0
_02064352:
	str r7, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r2, [sp, #0xc]
	ldr r3, [sp, #0x10]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0206439C
	add r6, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r6, r0
	beq _02064386
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl sub_02064468
	cmp r0, #0
	bne _02064386
	ldr r0, [sp, #8]
	add sp, #0x14
	str r4, [r0]
	add r0, r6, #0
	pop {r4, r5, r6, r7, pc}
_02064386:
	add r4, r4, #1
	cmp r4, #4
	blt _02064352
	mov r0, #0
	add sp, #0x14
	mvn r0, r0
	pop {r4, r5, r6, r7, pc}
_02064394:
	mov r0, #0
	mvn r0, r0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end sub_020642C4

	thumb_func_start sub_0206439C
sub_0206439C: ; 0x0206439C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldr r1, [sp, #0x14]
	lsl r5, r4, #2
	ldr r4, _020643B4 ; =_020FE194
	str r1, [sp]
	add r1, r2, #0
	add r2, r3, #0
	ldr r3, [sp, #0x10]
	ldr r4, [r4, r5]
	blx r4
	pop {r3, r4, r5, pc}
	.balign 4, 0
_020643B4: .word _020FE194
	thumb_func_end sub_0206439C

	thumb_func_start sub_020643B8
sub_020643B8: ; 0x020643B8
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r5, r1, #0
	add r6, r2, #0
	add r4, r3, #0
	bl MapObject_GetCurrentX
	cmp r0, r6
	bne _020643DE
	add r0, r7, #0
	bl MapObject_GetCurrentY
	cmp r4, r0
	bge _020643DE
	sub r1, r0, r5
	cmp r4, r1
	blt _020643DE
	sub r0, r0, r4
	pop {r3, r4, r5, r6, r7, pc}
_020643DE:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_020643B8

	thumb_func_start sub_020643E4
sub_020643E4: ; 0x020643E4
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r5, r1, #0
	add r6, r2, #0
	add r4, r3, #0
	bl MapObject_GetCurrentX
	cmp r0, r6
	bne _0206440A
	add r0, r7, #0
	bl MapObject_GetCurrentY
	cmp r4, r0
	ble _0206440A
	add r1, r0, r5
	cmp r4, r1
	bgt _0206440A
	sub r0, r4, r0
	pop {r3, r4, r5, r6, r7, pc}
_0206440A:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_020643E4

	thumb_func_start sub_02064410
sub_02064410: ; 0x02064410
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r6, r1, #0
	add r5, r2, #0
	add r4, r3, #0
	bl MapObject_GetCurrentY
	cmp r0, r4
	bne _02064436
	add r0, r7, #0
	bl MapObject_GetCurrentX
	cmp r5, r0
	bge _02064436
	sub r1, r0, r6
	cmp r5, r1
	blt _02064436
	sub r0, r0, r5
	pop {r3, r4, r5, r6, r7, pc}
_02064436:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02064410

	thumb_func_start sub_0206443C
sub_0206443C: ; 0x0206443C
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r6, r1, #0
	add r5, r2, #0
	add r4, r3, #0
	bl MapObject_GetCurrentY
	cmp r0, r4
	bne _02064462
	add r0, r7, #0
	bl MapObject_GetCurrentX
	cmp r5, r0
	ble _02064462
	add r1, r0, r6
	cmp r5, r1
	bgt _02064462
	sub r0, r5, r0
	pop {r3, r4, r5, r6, r7, pc}
_02064462:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0206443C

	thumb_func_start sub_02064468
sub_02064468: ; 0x02064468
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r1, #0
	str r0, [sp, #4]
	str r2, [sp, #8]
	cmp r2, #0
	bne _0206447C
	add sp, #0x18
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0206447C:
	bl MapObject_GetCurrentX
	add r4, r0, #0
	ldr r0, [sp, #4]
	bl MapObject_GetCurrentY
	add r7, r0, #0
	ldr r0, [sp, #4]
	bl MapObject_GetCurrentHeight
	str r0, [sp, #0xc]
	add r0, r5, #0
	bl sub_02060F0C
	add r6, r4, r0
	add r0, r5, #0
	bl sub_02060F18
	add r4, r7, r0
	ldr r0, [sp, #8]
	mov r7, #0
	sub r0, r0, #1
	str r0, [sp, #0x10]
	cmp r0, #0
	ble _020644E4
	mov r0, #1
	str r0, [sp, #0x14]
_020644B2:
	ldr r0, [sp, #4]
	ldr r2, [sp, #0xc]
	add r1, r6, #0
	add r3, r4, #0
	str r5, [sp]
	bl sub_02060B90
	ldr r1, [sp, #0x14]
	bic r0, r1
	beq _020644CC
	add sp, #0x18
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_020644CC:
	add r0, r5, #0
	bl sub_02060F0C
	add r6, r6, r0
	add r0, r5, #0
	bl sub_02060F18
	add r4, r4, r0
	ldr r0, [sp, #0x10]
	add r7, r7, #1
	cmp r7, r0
	blt _020644B2
_020644E4:
	ldr r0, [sp, #4]
	ldr r2, [sp, #0xc]
	add r1, r6, #0
	add r3, r4, #0
	str r5, [sp]
	bl sub_02060B90
	mov r1, #1
	bic r0, r1
	cmp r0, #4
	bne _02064500
	add sp, #0x18
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02064500:
	mov r0, #1
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02064468

	thumb_func_start sub_02064508
sub_02064508: ; 0x02064508
	push {r3, lr}
	bl MapObject_GetScript
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl ScriptNumToTrainerNum
	pop {r3, pc}
	thumb_func_end sub_02064508

	thumb_func_start sub_02064518
sub_02064518: ; 0x02064518
	ldr r3, _0206451C ; =sub_02064508
	bx r3
	.balign 4, 0
_0206451C: .word sub_02064508
	thumb_func_end sub_02064518

	thumb_func_start sub_02064520
sub_02064520: ; 0x02064520
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r1, #0
	mov r0, #0
	add r4, r2, #0
	add r6, r3, #0
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, sp, #0
	add r2, sp, #4
	mov r3, #1
	bl sub_0205EEF4
	cmp r0, #0
	beq _02064570
	add r7, sp, #0
_02064540:
	ldr r0, [sp]
	cmp r0, r4
	beq _02064560
	bl sub_02064298
	sub r0, r0, #1
	cmp r0, #1
	bhi _02064560
	ldr r0, [sp]
	bl sub_02064508
	cmp r6, r0
	bne _02064560
	ldr r0, [sp]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_02064560:
	add r0, r5, #0
	add r1, r7, #0
	add r2, sp, #4
	mov r3, #1
	bl sub_0205EEF4
	cmp r0, #0
	bne _02064540
_02064570:
	bl GF_AssertFail
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02064520

	thumb_func_start sub_0206457C
sub_0206457C: ; 0x0206457C
	push {r4, lr}
	sub sp, #0x10
	ldr r4, [sp, #0x18]
	str r4, [sp]
	ldr r4, [sp, #0x1c]
	str r4, [sp, #4]
	ldr r4, [sp, #0x20]
	str r4, [sp, #8]
	ldr r4, [sp, #0x24]
	str r4, [sp, #0xc]
	bl sub_020645B4
	add sp, #0x10
	pop {r4, pc}
	thumb_func_end sub_0206457C

	thumb_func_start sub_02064598
sub_02064598: ; 0x02064598
	push {r4, lr}
	add r4, r0, #0
	bne _020645A2
	bl GF_AssertFail
_020645A2:
	add r0, r4, #0
	bl sub_0206460C
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02064598

	thumb_func_start sub_020645AC
sub_020645AC: ; 0x020645AC
	ldr r3, _020645B0 ; =sub_02064618
	bx r3
	.balign 4, 0
_020645B0: .word sub_02064618
	thumb_func_end sub_020645AC

	thumb_func_start sub_020645B4
sub_020645B4: ; 0x020645B4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #4
	mov r1, #0x30
	add r7, r2, #0
	str r3, [sp]
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	bne _020645CE
	bl GF_AssertFail
_020645CE:
	add r0, r4, #0
	mov r1, #0
	mov r2, #0x30
	bl memset
	ldr r0, [sp]
	add r1, r4, #0
	str r0, [r4, #8]
	ldr r0, [sp, #0x18]
	mov r2, #0xff
	str r0, [r4, #0xc]
	ldr r0, [sp, #0x1c]
	str r0, [r4, #0x10]
	ldr r0, [sp, #0x20]
	str r0, [r4, #0x14]
	ldr r0, [sp, #0x24]
	str r0, [r4, #0x18]
	str r5, [r4, #0x2c]
	str r6, [r4, #0x24]
	ldr r0, _02064608 ; =sub_02064630
	str r7, [r4, #0x28]
	bl sub_0200E320
	add r4, r0, #0
	bne _02064604
	bl GF_AssertFail
_02064604:
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02064608: .word sub_02064630
	thumb_func_end sub_020645B4

	thumb_func_start sub_0206460C
sub_0206460C: ; 0x0206460C
	push {r3, lr}
	bl sub_0201F988
	ldr r0, [r0, #4]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0206460C

	thumb_func_start sub_02064618
sub_02064618: ; 0x02064618
	push {r4, lr}
	add r4, r0, #0
	bl sub_0201F988
	add r1, r0, #0
	mov r0, #4
	bl FreeToHeapExplicit
	add r0, r4, #0
	bl sub_0200E390
	pop {r4, pc}
	thumb_func_end sub_02064618

	thumb_func_start sub_02064630
sub_02064630: ; 0x02064630
	push {r3, r4, r5, lr}
	ldr r4, _02064648 ; =_020FE1A4
	add r5, r1, #0
_02064636:
	ldr r1, [r5]
	add r0, r5, #0
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	blx r1
	cmp r0, #1
	beq _02064636
	pop {r3, r4, r5, pc}
	nop
_02064648: .word _020FE1A4
	thumb_func_end sub_02064630

	thumb_func_start sub_0206464C
sub_0206464C: ; 0x0206464C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r4, [r5, #0x24]
	add r0, r4, #0
	bl sub_0205F648
	cmp r0, #1
	bne _02064662
	add r0, r4, #0
	bl sub_0205F708
_02064662:
	mov r0, #1
	str r0, [r5]
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0206464C

	thumb_func_start sub_02064668
sub_02064668: ; 0x02064668
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r5, [r4, #0x24]
	add r0, r5, #0
	bl sub_0205F648
	cmp r0, #1
	bne _0206467C
	mov r0, #0
	pop {r3, r4, r5, pc}
_0206467C:
	ldr r0, [r4, #0x24]
	ldr r1, [r4, #8]
	bl ov01_021F9408
	add r0, r5, #0
	mov r1, #0x40
	bl MapObject_SetBits
	mov r0, #2
	str r0, [r4]
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02064668

	thumb_func_start sub_02064694
sub_02064694: ; 0x02064694
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x28]
	bl PlayerAvatar_GetMapObject
	bl sub_02062198
	cmp r0, #0
	bne _020646AA
	mov r0, #0
	pop {r4, pc}
_020646AA:
	ldr r0, [r4, #0x24]
	bl MapObject_GetMovement
	sub r0, #0x33
	cmp r0, #3
	bhi _020646D2
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_020646C2: ; jump table
	.short _020646CA - _020646C2 - 2 ; case 0
	.short _020646CA - _020646C2 - 2 ; case 1
	.short _020646CA - _020646C2 - 2 ; case 2
	.short _020646CA - _020646C2 - 2 ; case 3
_020646CA:
	mov r0, #7
	str r0, [r4]
	mov r0, #1
	pop {r4, pc}
_020646D2:
	mov r0, #3
	str r0, [r4]
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02064694

	thumb_func_start sub_020646DC
sub_020646DC: ; 0x020646DC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x24]
	bl sub_02062108
	cmp r0, #0
	bne _020646EE
	mov r0, #0
	pop {r4, pc}
_020646EE:
	mov r0, #0
	ldr r1, [r4, #8]
	mvn r0, r0
	cmp r1, r0
	bne _020646FC
	bl GF_AssertFail
_020646FC:
	ldr r0, [r4, #8]
	mov r1, #0
	bl sub_0206234C
	add r1, r0, #0
	ldr r0, [r4, #0x24]
	bl sub_0206214C
	mov r0, #4
	str r0, [r4]
	mov r0, #0
	pop {r4, pc}
	thumb_func_end sub_020646DC

	thumb_func_start sub_02064714
sub_02064714: ; 0x02064714
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x24]
	bl sub_02062198
	cmp r0, #0
	bne _02064726
	mov r0, #0
	pop {r4, pc}
_02064726:
	mov r0, #5
	str r0, [r4]
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02064714

	thumb_func_start sub_02064730
sub_02064730: ; 0x02064730
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0
	ldr r0, [r4, #0x24]
	add r2, r1, #0
	bl ov01_02200540
	str r0, [r4, #0x20]
	mov r0, #6
	str r0, [r4]
	mov r0, #0
	pop {r4, pc}
	thumb_func_end sub_02064730

	thumb_func_start sub_02064748
sub_02064748: ; 0x02064748
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x20]
	bl ov01_022003F4
	cmp r0, #1
	bne _02064760
	ldr r0, [r4, #0x20]
	bl sub_02068B48
	mov r0, #9
	str r0, [r4]
_02064760:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end sub_02064748

	thumb_func_start sub_02064764
sub_02064764: ; 0x02064764
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x24]
	mov r1, #0x65
	bl sub_0206214C
	mov r0, #8
	str r0, [r4]
	mov r0, #0
	pop {r4, pc}
	thumb_func_end sub_02064764

	thumb_func_start sub_02064778
sub_02064778: ; 0x02064778
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x24]
	bl sub_02062198
	cmp r0, #1
	bne _0206478A
	mov r0, #9
	str r0, [r4]
_0206478A:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02064778

	thumb_func_start sub_02064790
sub_02064790: ; 0x02064790
	ldr r1, [r0, #0x1c]
	add r1, r1, #1
	str r1, [r0, #0x1c]
	cmp r1, #0x1e
	blt _020647A2
	mov r1, #0
	str r1, [r0, #0x1c]
	mov r1, #0xa
	str r1, [r0]
_020647A2:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end sub_02064790

	thumb_func_start sub_020647A8
sub_020647A8: ; 0x020647A8
	ldr r1, [r0, #0xc]
	cmp r1, #1
	bgt _020647B6
	mov r1, #0xd
	str r1, [r0]
	mov r0, #1
	bx lr
_020647B6:
	mov r1, #0xb
	str r1, [r0]
	mov r0, #1
	bx lr
	.balign 4, 0
	thumb_func_end sub_020647A8

	thumb_func_start sub_020647C0
sub_020647C0: ; 0x020647C0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x24]
	bl sub_02062108
	cmp r0, #1
	bne _020647E2
	ldr r0, [r4, #8]
	mov r1, #0xc
	bl sub_0206234C
	add r1, r0, #0
	ldr r0, [r4, #0x24]
	bl sub_0206214C
	mov r0, #0xc
	str r0, [r4]
_020647E2:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020647C0

	thumb_func_start sub_020647E8
sub_020647E8: ; 0x020647E8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x24]
	bl sub_02062198
	cmp r0, #0
	bne _020647FA
	mov r0, #0
	pop {r4, pc}
_020647FA:
	ldr r0, [r4, #0xc]
	sub r0, r0, #1
	str r0, [r4, #0xc]
	mov r0, #0xa
	str r0, [r4]
	mov r0, #1
	pop {r4, pc}
	thumb_func_end sub_020647E8

	thumb_func_start sub_02064808
sub_02064808: ; 0x02064808
	ldr r1, [r0, #0x1c]
	add r1, r1, #1
	str r1, [r0, #0x1c]
	cmp r1, #8
	bge _02064816
	mov r0, #0
	bx lr
_02064816:
	mov r1, #0
	str r1, [r0, #0x1c]
	mov r1, #0xe
	str r1, [r0]
	mov r0, #1
	bx lr
	.balign 4, 0
	thumb_func_end sub_02064808

	thumb_func_start sub_02064824
sub_02064824: ; 0x02064824
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x28]
	bl PlayerAvatar_GetMapObject
	add r4, r0, #0
	bl MapObject_GetCurrentX
	add r6, r0, #0
	add r0, r4, #0
	bl MapObject_GetCurrentY
	add r7, r0, #0
	ldr r0, [r5, #0x24]
	bl MapObject_GetCurrentX
	str r0, [sp]
	ldr r0, [r5, #0x24]
	bl MapObject_GetCurrentY
	add r3, r0, #0
	ldr r2, [sp]
	add r0, r6, #0
	add r1, r7, #0
	bl sub_02061200
	add r6, r0, #0
	ldr r0, [r5, #0x28]
	bl PlayerAvatar_GetFacingDirection
	cmp r6, r0
	beq _02064898
	ldr r0, [r5, #0x18]
	cmp r0, #0
	beq _02064870
	ldr r0, [r5, #0x14]
	cmp r0, #2
	bne _02064898
_02064870:
	add r0, r4, #0
	bl sub_02062108
	cmp r0, #1
	bne _0206489C
	add r0, r4, #0
	mov r1, #0x80
	bl MapObject_ClearBits
	add r0, r6, #0
	mov r1, #0
	bl sub_0206234C
	add r1, r0, #0
	add r0, r4, #0
	bl sub_0206214C
	mov r0, #0xf
	str r0, [r5]
	b _0206489C
_02064898:
	mov r0, #0x10
	str r0, [r5]
_0206489C:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02064824

	thumb_func_start sub_020648A0
sub_020648A0: ; 0x020648A0
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x28]
	bl PlayerAvatar_GetMapObject
	add r5, r0, #0
	bl sub_02062198
	cmp r0, #0
	bne _020648B8
	mov r0, #0
	pop {r3, r4, r5, pc}
_020648B8:
	add r0, r5, #0
	bl sub_020621C0
	mov r0, #0x10
	str r0, [r4]
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_020648A0

	thumb_func_start sub_020648C8
sub_020648C8: ; 0x020648C8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x24]
	bl sub_020621C0
	ldr r0, [r4, #0x24]
	mov r1, #0
	bl sub_0205FC94
	mov r0, #0x11
	str r0, [r4]
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020648C8

	thumb_func_start sub_020648E4
sub_020648E4: ; 0x020648E4
	mov r1, #1
	str r1, [r0, #4]
	mov r0, #0
	bx lr
	thumb_func_end sub_020648E4

	thumb_func_start sub_020648EC
sub_020648EC: ; 0x020648EC
	push {r4, lr}
	add r4, r0, #0
	bl ScriptEnvironment_GetSav2Ptr
	bl sub_0202A998
	bl sub_0202AEBC
	add r1, r0, #0
	beq _0206490A
	lsl r2, r1, #2
	ldr r1, _0206490C ; =_020FE214
	add r0, r4, #0
	ldr r1, [r1, r2]
	blx r1
_0206490A:
	pop {r4, pc}
	.balign 4, 0
_0206490C: .word _020FE214
	thumb_func_end sub_020648EC

	thumb_func_start sub_02064910
sub_02064910: ; 0x02064910
	push {r4, lr}
	add r4, r0, #0
	bl ScriptEnvironment_GetSav2Ptr
	bl sub_0202A998
	bl sub_0202AEBC
	cmp r0, #0
	beq _02064932
	lsl r1, r0, #2
	ldr r0, _02064934 ; =_020FE1EC
	ldr r1, [r0, r1]
	cmp r1, #0
	beq _02064932
	add r0, r4, #0
	blx r1
_02064932:
	pop {r4, pc}
	.balign 4, 0
_02064934: .word _020FE1EC
	thumb_func_end sub_02064910

	thumb_func_start sub_02064938
sub_02064938: ; 0x02064938
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r4, r1, #0
	add r7, r2, #0
	str r3, [sp, #4]
	bl ScriptEnvironment_GetSav2Ptr
	bl sub_0202A998
	bl sub_0202AEBC
	cmp r0, #0
	bne _0206495A
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0206495A:
	lsl r1, r0, #2
	ldr r0, _0206497C ; =_020FE23C
	ldr r6, [r0, r1]
	cmp r6, #0
	beq _02064976
	ldr r0, [sp, #0x20]
	ldr r3, [sp, #4]
	str r0, [sp]
	add r0, r5, #0
	add r1, r4, #0
	add r2, r7, #0
	blx r6
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_02064976:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0206497C: .word _020FE23C
	thumb_func_end sub_02064938

	thumb_func_start GetItemFieldUseFunc
GetItemFieldUseFunc: ; 0x02064980
	cmp r0, #0
	bne _02064990
	mov r0, #0xc
	add r2, r1, #0
	mul r2, r0
	ldr r0, _020649AC ; =_020FE264
	ldr r0, [r0, r2]
	bx lr
_02064990:
	cmp r0, #1
	bne _020649A0
	mov r0, #0xc
	add r2, r1, #0
	mul r2, r0
	ldr r0, _020649B0 ; =_020FE264 + 4
	ldr r0, [r0, r2]
	bx lr
_020649A0:
	mov r0, #0xc
	add r2, r1, #0
	mul r2, r0
	ldr r0, _020649B4 ; =_020FE264 + 8
	ldr r0, [r0, r2]
	bx lr
	.balign 4, 0
_020649AC: .word _020FE264
_020649B0: .word _020FE264 + 4
_020649B4: .word _020FE264 + 8
	thumb_func_end GetItemFieldUseFunc

	thumb_func_start sub_020649B8
sub_020649B8: ; 0x020649B8
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	add r5, r1, #0
	str r4, [r5, #0x14]
	ldr r0, [r4, #0x20]
	ldr r0, [r0]
	str r0, [r5]
	ldr r0, [r4, #0xc]
	bl SavArray_Flags_get
	bl ScriptState_CheckHaveFollower
	ldrh r1, [r5, #8]
	mov r2, #1
	lsl r0, r0, #0x10
	bic r1, r2
	lsr r2, r0, #0x10
	mov r0, #1
	and r0, r2
	orr r0, r1
	strh r0, [r5, #8]
	ldr r0, [r4, #0xc]
	bl SavArray_Flags_get
	bl sub_020666B4
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	lsl r0, r0, #0x1f
	ldrh r1, [r5, #8]
	mov r2, #2
	lsr r0, r0, #0x1e
	bic r1, r2
	orr r0, r1
	strh r0, [r5, #8]
	ldr r0, [r4, #0x40]
	bl sub_0205C700
	str r0, [r5, #4]
	ldr r0, [r4, #0x40]
	bl GetPlayerXCoord
	add r6, r0, #0
	ldr r0, [r4, #0x40]
	bl GetPlayerYCoord
	add r7, r0, #0
	add r0, r4, #0
	add r1, r6, #0
	add r2, r7, #0
	bl sub_02054918
	strh r0, [r5, #0xc]
	ldr r0, [r4, #0x40]
	bl PlayerAvatar_GetFacingDirection
	cmp r0, #3
	bhi _02064A4E
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02064A38: ; jump table
	.short _02064A40 - _02064A38 - 2 ; case 0
	.short _02064A44 - _02064A38 - 2 ; case 1
	.short _02064A4C - _02064A38 - 2 ; case 2
	.short _02064A48 - _02064A38 - 2 ; case 3
_02064A40:
	sub r7, r7, #1
	b _02064A4E
_02064A44:
	add r7, r7, #1
	b _02064A4E
_02064A48:
	add r6, r6, #1
	b _02064A4E
_02064A4C:
	sub r6, r6, #1
_02064A4E:
	add r0, r4, #0
	add r1, r6, #0
	add r2, r7, #0
	bl sub_02054918
	strh r0, [r5, #0xa]
	add r0, r4, #0
	add r1, sp, #0
	bl sub_0203DBF8
	ldr r0, [r4, #0x40]
	str r0, [r5, #0x10]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_020649B8

	thumb_func_start sub_02064A68
sub_02064A68: ; 0x02064A68
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #0x20
	mov r1, #0xc
	add r6, r2, #0
	add r7, r3, #0
	bl AllocFromHeap
	str r5, [r0]
	strh r4, [r0, #4]
	strh r6, [r0, #6]
	strh r7, [r0, #8]
	add r1, sp, #8
	ldrh r1, [r1, #0x10]
	strh r1, [r0, #0xa]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02064A68

	thumb_func_start sub_02064A8C
sub_02064A8C: ; 0x02064A8C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r6, r2, #0
	bl TaskManager_GetSys
	add r7, r0, #0
	ldr r0, [r5]
	bl TaskManager_GetEnv
	add r4, r0, #0
	add r0, r7, #0
	bl sub_020505C0
	mov r0, #0xd5
	mov r2, #0
	ldr r1, _02064ACC ; =sub_02064AD0
	lsl r0, r0, #2
	str r1, [r4, r0]
	str r2, [sp]
	ldrh r1, [r5, #4]
	add r0, r6, #0
	add r3, r2, #0
	bl sub_02064A68
	mov r1, #0xe
	lsl r1, r1, #6
	str r0, [r4, r1]
	mov r0, #0xc
	strh r0, [r4, #0x26]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02064ACC: .word sub_02064AD0
	thumb_func_end sub_02064A8C

	thumb_func_start sub_02064AD0
sub_02064AD0: ; 0x02064AD0
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	bl TaskManager_GetSys
	add r5, r0, #0
	add r0, r7, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	add r0, r7, #0
	bl sub_02050654
	add r6, r0, #0
	ldr r0, [r6]
	cmp r0, #0
	beq _02064AF6
	cmp r0, #1
	beq _02064B46
	b _02064B50
_02064AF6:
	add r0, r5, #0
	add r1, sp, #0
	bl sub_0203DBF8
	ldr r1, [r4]
	ldr r2, [sp]
	lsl r1, r1, #0x10
	add r0, r7, #0
	lsr r1, r1, #0x10
	mov r3, #0
	bl QueueScript
	add r0, r5, #0
	mov r1, #0x2a
	bl FieldSysGetAttrAddr
	ldrh r1, [r4, #4]
	strh r1, [r0]
	add r0, r5, #0
	mov r1, #0x2b
	bl FieldSysGetAttrAddr
	ldrh r1, [r4, #6]
	strh r1, [r0]
	add r0, r5, #0
	mov r1, #0x2c
	bl FieldSysGetAttrAddr
	ldrh r1, [r4, #8]
	strh r1, [r0]
	add r0, r5, #0
	mov r1, #0x2d
	bl FieldSysGetAttrAddr
	ldrh r1, [r4, #0xa]
	strh r1, [r0]
	ldr r0, [r6]
	add r0, r0, #1
	str r0, [r6]
	b _02064B50
_02064B46:
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02064B50:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02064AD0

	thumb_func_start ItemMenuUseFunc_HealingItem
ItemMenuUseFunc_HealingItem: ; 0x02064B54
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, [r6]
	bl TaskManager_GetSys
	add r5, r0, #0
	ldr r0, [r6]
	bl TaskManager_GetEnv
	add r7, r0, #0
	mov r0, #0xb
	mov r1, #0x44
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x44
	add r4, r0, #0
	bl memset
	ldr r0, [r5, #0xc]
	bl SavArray_PlayerParty_get
	str r0, [r4]
	ldr r0, [r5, #0xc]
	bl Sav2_Bag_get
	str r0, [r4, #4]
	ldr r0, [r5, #0xc]
	bl Sav2_Mailbox_get
	str r0, [r4, #8]
	ldr r0, [r5, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [r4, #0xc]
	ldr r0, [r5, #0xc]
	bl sub_020270C4
	str r0, [r4, #0x10]
	mov r0, #0x37
	lsl r0, r0, #4
	add r0, r7, r0
	str r0, [r4, #0x18]
	add r0, r4, #0
	mov r1, #0
	add r0, #0x25
	strb r1, [r0]
	add r0, r4, #0
	mov r1, #5
	add r0, #0x24
	strb r1, [r0]
	str r5, [r4, #0x1c]
	ldrh r0, [r6, #4]
	add r2, r4, #0
	strh r0, [r4, #0x28]
	add r0, r4, #0
	ldrb r1, [r6, #6]
	add r0, #0x26
	strb r1, [r0]
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r5, r0
	str r0, [r4, #0x20]
	ldr r1, _02064BEC ; =_0210159C
	add r0, r5, #0
	bl ScrUnk80_AddOvyMan
	mov r0, #0xe
	lsl r0, r0, #6
	str r4, [r7, r0]
	ldr r1, _02064BF0 ; =sub_0203CA9C
	add r0, r7, #0
	bl sub_0203C8F0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02064BEC: .word _0210159C
_02064BF0: .word sub_0203CA9C
	thumb_func_end ItemMenuUseFunc_HealingItem

	thumb_func_start ItemCheckUseFunc_Dummy
ItemCheckUseFunc_Dummy: ; 0x02064BF4
	mov r0, #0
	mvn r0, r0
	bx lr
	.balign 4, 0
	thumb_func_end ItemCheckUseFunc_Dummy

	thumb_func_start ItemMenuUseFunc_Bicycle
ItemMenuUseFunc_Bicycle: ; 0x02064BFC
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl TaskManager_GetSys
	add r5, r0, #0
	ldr r0, [r4]
	bl TaskManager_GetEnv
	add r4, r0, #0
	add r0, r5, #0
	bl sub_020505C0
	mov r0, #0xd5
	ldr r1, _02064C2C ; =sub_02064C58
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r1, #0
	add r0, #0x2c
	str r1, [r4, r0]
	mov r0, #0xc
	strh r0, [r4, #0x26]
	pop {r3, r4, r5, pc}
	nop
_02064C2C: .word sub_02064C58
	thumb_func_end ItemMenuUseFunc_Bicycle

	thumb_func_start ItemFieldUseFunc_Bicycle
ItemFieldUseFunc_Bicycle: ; 0x02064C30
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	ldr r1, _02064C54 ; =sub_02064C58
	mov r2, #0
	bl sub_020504F0
	ldr r2, [r4]
	add r0, r2, #0
	add r0, #0xd2
	ldrb r1, [r0]
	mov r0, #0x80
	add r2, #0xd2
	orr r0, r1
	strb r0, [r2]
	mov r0, #0
	pop {r4, pc}
	nop
_02064C54: .word sub_02064C58
	thumb_func_end ItemFieldUseFunc_Bicycle

	thumb_func_start sub_02064C58
sub_02064C58: ; 0x02064C58
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl TaskManager_GetSys
	add r4, r0, #0
	add r0, r5, #0
	bl sub_02050654
	add r5, r0, #0
	ldr r0, [r5]
	cmp r0, #0
	beq _02064C7C
	cmp r0, #1
	beq _02064CC2
	cmp r0, #2
	bne _02064C7A
	b _02064D94
_02064C7A:
	b _02064D9E
_02064C7C:
	add r0, r4, #0
	bl sub_02069F88
	cmp r0, #0
	beq _02064CBA
	add r0, r4, #0
	bl FollowingPokemon_GetMapObject
	bl sub_02062198
	cmp r0, #0
	bne _02064C96
	b _02064D9E
_02064C96:
	ldr r0, [r4, #0x40]
	bl sub_0205C700
	cmp r0, #1
	bne _02064CA4
	mov r6, #0x30
	b _02064CA6
_02064CA4:
	mov r6, #0x38
_02064CA6:
	add r0, r4, #0
	bl FollowingPokemon_GetMapObject
	add r1, r6, #0
	bl sub_0205FC94
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02064D9E
_02064CBA:
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02064D9E
_02064CC2:
	ldr r0, [r4, #0x40]
	bl sub_0205C700
	cmp r0, #1
	bne _02064D3E
	ldr r0, [r4, #0x40]
	bl PlayerAvatar_GetMapObject
	bl sub_0205F708
	ldr r0, [r4, #0x40]
	mov r1, #1
	bl ov01_021F1AFC
	ldr r0, [r4, #0x40]
	bl ov01_021F1B04
	add r0, r4, #0
	mov r1, #0
	bl sub_02054F28
	bl SndRadio_GetSeqNo
	cmp r0, #0
	bne _02064D08
	ldr r1, [r4, #0x20]
	add r0, r4, #0
	ldr r1, [r1]
	bl sub_02054F60
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #1
	bl sub_02054FDC
_02064D08:
	ldr r0, [r4, #0x40]
	bl PlayerAvatar_GetFacingDirection
	add r1, r0, #0
	lsl r1, r1, #0x18
	add r0, r4, #0
	lsr r1, r1, #0x18
	bl ov01_02205790
	add r0, r4, #0
	bl sub_02069F88
	cmp r0, #0
	beq _02064D8C
	add r0, r4, #0
	bl FollowingPokemon_GetMapObject
	mov r1, #1
	bl sub_02069E84
	add r0, r4, #0
	bl FollowingPokemon_GetMapObject
	mov r1, #1
	bl sub_02069DC8
	b _02064D8C
_02064D3E:
	bl SndRadio_GetSeqNo
	cmp r0, #0
	bne _02064D58
	ldr r1, _02064DA4 ; =0x000003F5
	add r0, r4, #0
	bl sub_02054F28
	ldr r1, _02064DA4 ; =0x000003F5
	add r0, r4, #0
	mov r2, #1
	bl sub_02054FDC
_02064D58:
	ldr r0, [r4, #0x40]
	bl PlayerAvatar_GetMapObject
	bl sub_0205F708
	ldr r0, [r4, #0x40]
	mov r1, #2
	bl ov01_021F1AFC
	ldr r0, [r4, #0x40]
	bl ov01_021F1B04
	add r0, r4, #0
	bl ov01_02205D68
	add r0, r4, #0
	bl sub_02069F88
	cmp r0, #0
	beq _02064D8C
	add r0, r4, #0
	bl FollowingPokemon_GetMapObject
	mov r1, #0
	bl sub_02069E84
_02064D8C:
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02064D9E
_02064D94:
	ldr r0, [r4, #0x3c]
	bl sub_0205F5A4
	mov r0, #1
	pop {r4, r5, r6, pc}
_02064D9E:
	mov r0, #0
	pop {r4, r5, r6, pc}
	nop
_02064DA4: .word 0x000003F5
	thumb_func_end sub_02064C58

	thumb_func_start ItemCheckUseFunc_Bicycle
ItemCheckUseFunc_Bicycle: ; 0x02064DA8
	push {r4, lr}
	add r4, r0, #0
	ldrh r0, [r4, #8]
	lsl r1, r0, #0x1f
	lsr r1, r1, #0x1f
	cmp r1, #1
	bne _02064DBA
	mov r0, #2
	pop {r4, pc}
_02064DBA:
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _02064DC6
	mov r0, #3
	pop {r4, pc}
_02064DC6:
	ldr r0, [r4, #0x10]
	bl sub_0205CABC
	cmp r0, #1
	bne _02064DD4
	mov r0, #1
	pop {r4, pc}
_02064DD4:
	ldrh r0, [r4, #0xc]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B6F4
	cmp r0, #1
	beq _02064DF0
	ldrh r0, [r4, #0xc]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B8AC
	cmp r0, #1
	bne _02064DF6
_02064DF0:
	mov r0, #0
	mvn r0, r0
	pop {r4, pc}
_02064DF6:
	ldr r0, [r4]
	bl MapHeader_IsBikeAllowed
	cmp r0, #0
	bne _02064E06
	mov r0, #0
	mvn r0, r0
	pop {r4, pc}
_02064E06:
	ldr r0, [r4, #4]
	cmp r0, #2
	bne _02064E12
	mov r0, #0
	mvn r0, r0
	pop {r4, pc}
_02064E12:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ItemCheckUseFunc_Bicycle

	thumb_func_start ItemMenuUseFunc_TMHM
ItemMenuUseFunc_TMHM: ; 0x02064E18
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, [r6]
	bl TaskManager_GetSys
	add r5, r0, #0
	ldr r0, [r6]
	bl TaskManager_GetEnv
	add r7, r0, #0
	mov r0, #0xb
	mov r1, #0x44
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x44
	add r4, r0, #0
	bl memset
	ldr r0, [r5, #0xc]
	bl SavArray_PlayerParty_get
	str r0, [r4]
	ldr r0, [r5, #0xc]
	bl Sav2_Bag_get
	str r0, [r4, #4]
	ldr r0, [r5, #0xc]
	bl Sav2_Mailbox_get
	str r0, [r4, #8]
	ldr r0, [r5, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [r4, #0xc]
	mov r0, #0x37
	lsl r0, r0, #4
	add r0, r7, r0
	str r0, [r4, #0x18]
	add r0, r4, #0
	mov r1, #0
	add r0, #0x25
	strb r1, [r0]
	add r0, r4, #0
	mov r1, #6
	add r0, #0x24
	strb r1, [r0]
	str r5, [r4, #0x1c]
	ldrh r0, [r6, #4]
	strh r0, [r4, #0x28]
	add r0, r4, #0
	ldrb r1, [r6, #6]
	add r0, #0x26
	strb r1, [r0]
	ldrh r0, [r6, #4]
	bl TMHMGetMove
	strh r0, [r4, #0x2a]
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r5, r0
	str r0, [r4, #0x20]
	ldr r1, _02064EB0 ; =_0210159C
	add r0, r5, #0
	add r2, r4, #0
	bl ScrUnk80_AddOvyMan
	mov r0, #0xe
	lsl r0, r0, #6
	str r4, [r7, r0]
	ldr r1, _02064EB4 ; =sub_0203CA9C
	add r0, r7, #0
	bl sub_0203C8F0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02064EB0: .word _0210159C
_02064EB4: .word sub_0203CA9C
	thumb_func_end ItemMenuUseFunc_TMHM

	thumb_func_start ItemMenuUseFunc_Mail
ItemMenuUseFunc_Mail: ; 0x02064EB8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5]
	bl TaskManager_GetSys
	add r6, r0, #0
	ldr r0, [r5]
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldrh r0, [r5, #4]
	bl ItemToMailId
	add r2, r0, #0
	add r0, r6, #0
	mov r1, #3
	mov r3, #0xb
	bl sub_0203F018
	add r6, r0, #0
	ldrh r0, [r5, #4]
	mov r1, #3
	mov r2, #0
	bl sub_0203D818
	mov r1, #0xe1
	lsl r1, r1, #2
	str r0, [r4, r1]
	sub r0, r1, #4
	str r6, [r4, r0]
	ldr r1, _02064F00 ; =sub_0203D830
	add r0, r4, #0
	bl sub_0203C8F0
	pop {r4, r5, r6, pc}
	nop
_02064F00: .word sub_0203D830
	thumb_func_end ItemMenuUseFunc_Mail

	thumb_func_start ItemCheckUseFunc_Berry
ItemCheckUseFunc_Berry: ; 0x02064F04
	mov r0, #0
	bx lr
	thumb_func_end ItemCheckUseFunc_Berry

	thumb_func_start ItemMenuUseFunc_Berry
ItemMenuUseFunc_Berry: ; 0x02064F08
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r1, #0
	bl TaskManager_GetSys
	ldr r0, [r5]
	bl TaskManager_GetEnv
	add r0, r5, #0
	add r1, r4, #0
	bl ItemMenuUseFunc_HealingItem
	pop {r3, r4, r5, pc}
	thumb_func_end ItemMenuUseFunc_Berry

	thumb_func_start sub_02064F24
sub_02064F24: ; 0x02064F24
	mov r0, #0
	bx lr
	thumb_func_end sub_02064F24

	thumb_func_start ItemMenuUseFunc_PalPad
ItemMenuUseFunc_PalPad: ; 0x02064F28
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl TaskManager_GetSys
	add r5, r0, #0
	ldr r0, [r4]
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldr r1, [r5, #0xc]
	add r0, r5, #0
	mov r2, #0xb
	bl sub_0203F53C
	mov r1, #0xe
	lsl r1, r1, #6
	str r0, [r4, r1]
	ldr r1, _02064F58 ; =sub_0203D718
	add r0, r4, #0
	bl sub_0203C8F0
	pop {r3, r4, r5, pc}
	nop
_02064F58: .word sub_0203D718
	thumb_func_end ItemMenuUseFunc_PalPad

	thumb_func_start ItemFieldUseFunc_PalPad
ItemFieldUseFunc_PalPad: ; 0x02064F5C
	push {r3, lr}
	ldr r1, _02064F6C ; =sub_02064F70
	mov r2, #0
	bl sub_020658B8
	mov r0, #1
	pop {r3, pc}
	nop
_02064F6C: .word sub_02064F70
	thumb_func_end ItemFieldUseFunc_PalPad

	thumb_func_start sub_02064F70
sub_02064F70: ; 0x02064F70
	ldr r3, _02064F78 ; =sub_0203F53C
	ldr r1, [r0, #0xc]
	mov r2, #0xb
	bx r3
	.balign 4, 0
_02064F78: .word sub_0203F53C
	thumb_func_end sub_02064F70

	thumb_func_start ItemMenuUseFunc_Honey
ItemMenuUseFunc_Honey: ; 0x02064F7C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5]
	bl TaskManager_GetSys
	add r6, r0, #0
	ldr r0, [r5]
	bl TaskManager_GetEnv
	add r4, r0, #0
	add r0, r6, #0
	bl sub_020505C0
	bl ov01_021FC30C
	str r0, [sp]
	ldr r1, [sp]
	mov r0, #0xb
	bl AllocFromHeapAtEnd
	ldr r2, [sp]
	mov r1, #0
	add r7, r0, #0
	bl memset
	mov r0, #0xd5
	ldr r1, _02064FD0 ; =ov01_021FC310
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, #0x2c
	str r7, [r4, r0]
	mov r0, #0xc
	strh r0, [r4, #0x26]
	ldr r0, [r6, #0xc]
	bl Sav2_Bag_get
	ldrh r1, [r5, #4]
	mov r2, #1
	mov r3, #0xb
	bl Bag_TakeItem
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02064FD0: .word ov01_021FC310
	thumb_func_end ItemMenuUseFunc_Honey

	thumb_func_start ItemMenuUseFunc_OldRod
ItemMenuUseFunc_OldRod: ; 0x02064FD4
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl TaskManager_GetSys
	add r5, r0, #0
	ldr r0, [r4]
	bl TaskManager_GetEnv
	add r4, r0, #0
	add r0, r5, #0
	bl sub_020505C0
	mov r0, #0xd5
	ldr r1, _0206500C ; =ov01_021FC698
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, r5, #0
	mov r1, #0xb
	mov r2, #0
	bl ov01_021FC66C
	mov r1, #0xe
	lsl r1, r1, #6
	str r0, [r4, r1]
	mov r0, #0xc
	strh r0, [r4, #0x26]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0206500C: .word ov01_021FC698
	thumb_func_end ItemMenuUseFunc_OldRod

	thumb_func_start ItemFieldUseFunc_OldRod
ItemFieldUseFunc_OldRod: ; 0x02065010
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	mov r1, #4
	mov r2, #0
	bl ov01_021FC66C
	add r2, r0, #0
	ldr r0, [r4]
	ldr r1, _0206502C ; =ov01_021FC698
	bl sub_020504F0
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_0206502C: .word ov01_021FC698
	thumb_func_end ItemFieldUseFunc_OldRod

	thumb_func_start ItemMenuUseFunc_GoodRod
ItemMenuUseFunc_GoodRod: ; 0x02065030
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl TaskManager_GetSys
	add r5, r0, #0
	ldr r0, [r4]
	bl TaskManager_GetEnv
	add r4, r0, #0
	add r0, r5, #0
	bl sub_020505C0
	mov r0, #0xd5
	ldr r1, _02065068 ; =ov01_021FC698
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, r5, #0
	mov r1, #0xb
	mov r2, #1
	bl ov01_021FC66C
	mov r1, #0xe
	lsl r1, r1, #6
	str r0, [r4, r1]
	mov r0, #0xc
	strh r0, [r4, #0x26]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02065068: .word ov01_021FC698
	thumb_func_end ItemMenuUseFunc_GoodRod

	thumb_func_start ItemFieldUseFunc_GoodRod
ItemFieldUseFunc_GoodRod: ; 0x0206506C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	mov r1, #4
	mov r2, #1
	bl ov01_021FC66C
	add r2, r0, #0
	ldr r0, [r4]
	ldr r1, _02065088 ; =ov01_021FC698
	bl sub_020504F0
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_02065088: .word ov01_021FC698
	thumb_func_end ItemFieldUseFunc_GoodRod

	thumb_func_start ItemMenuUseFunc_SuperRod
ItemMenuUseFunc_SuperRod: ; 0x0206508C
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl TaskManager_GetSys
	add r5, r0, #0
	ldr r0, [r4]
	bl TaskManager_GetEnv
	add r4, r0, #0
	add r0, r5, #0
	bl sub_020505C0
	mov r0, #0xd5
	ldr r1, _020650C4 ; =ov01_021FC698
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, r5, #0
	mov r1, #0xb
	mov r2, #2
	bl ov01_021FC66C
	mov r1, #0xe
	lsl r1, r1, #6
	str r0, [r4, r1]
	mov r0, #0xc
	strh r0, [r4, #0x26]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_020650C4: .word ov01_021FC698
	thumb_func_end ItemMenuUseFunc_SuperRod

	thumb_func_start ItemFieldUseFunc_SuperRod
ItemFieldUseFunc_SuperRod: ; 0x020650C8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	mov r1, #4
	mov r2, #2
	bl ov01_021FC66C
	add r2, r0, #0
	ldr r0, [r4]
	ldr r1, _020650E4 ; =ov01_021FC698
	bl sub_020504F0
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_020650E4: .word ov01_021FC698
	thumb_func_end ItemFieldUseFunc_SuperRod

	thumb_func_start ItemCheckUseFunc_FishingRod
ItemCheckUseFunc_FishingRod: ; 0x020650E8
	push {r4, lr}
	add r4, r0, #0
	ldrh r0, [r4, #8]
	lsl r1, r0, #0x1f
	lsr r1, r1, #0x1f
	cmp r1, #1
	bne _020650FA
	mov r0, #2
	pop {r4, pc}
_020650FA:
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _02065106
	mov r0, #3
	pop {r4, pc}
_02065106:
	ldrh r0, [r4, #0xa]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B778
	cmp r0, #1
	bne _02065148
	ldrh r0, [r4, #0xc]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_0205BA30
	cmp r0, #1
	beq _02065130
	ldrh r0, [r4, #0xc]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_0205BA24
	cmp r0, #1
	bne _02065144
_02065130:
	ldr r0, [r4, #0x10]
	bl PlayerAvatar_GetMapObject
	bl sub_0205F83C
	cmp r0, #1
	bne _02065144
	mov r0, #0
	mvn r0, r0
	pop {r4, pc}
_02065144:
	mov r0, #0
	pop {r4, pc}
_02065148:
	mov r0, #0
	mvn r0, r0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ItemCheckUseFunc_FishingRod

	thumb_func_start ItemFieldUseFunc_Generic
ItemFieldUseFunc_Generic: ; 0x02065150
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0xb
	mov r1, #0x18
	bl AllocFromHeap
	add r4, r0, #0
	mov r0, #0
	strh r0, [r4, #0x16]
	mov r0, #0x80
	mov r1, #0xb
	bl String_ctor
	str r0, [r4, #0x10]
	ldr r0, [r5]
	ldrh r2, [r5, #0x24]
	ldr r0, [r0, #0xc]
	ldr r1, [r4, #0x10]
	mov r3, #0xb
	bl TryFormatRegisteredKeyItemUseMessage
	ldr r0, [r5]
	ldr r1, _02065188 ; =sub_0206518C
	add r2, r4, #0
	bl sub_020504F0
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02065188: .word sub_0206518C
	thumb_func_end ItemFieldUseFunc_Generic

	thumb_func_start sub_0206518C
sub_0206518C: ; 0x0206518C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl TaskManager_GetSys
	add r4, r0, #0
	add r0, r5, #0
	bl TaskManager_GetEnv
	add r5, r0, #0
	ldrh r0, [r5, #0x16]
	cmp r0, #0
	beq _020651AE
	cmp r0, #1
	beq _020651F4
	cmp r0, #2
	beq _02065232
	b _0206524E
_020651AE:
	add r0, r4, #0
	add r0, #0xd2
	ldrb r1, [r0]
	mov r0, #0x40
	orr r1, r0
	add r0, r4, #0
	add r0, #0xd2
	strb r1, [r0]
	ldr r0, [r4, #0x3c]
	bl sub_0205F574
	ldr r0, [r4, #8]
	add r1, r5, #0
	mov r2, #3
	bl sub_0205B514
	ldr r0, [r4, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	add r4, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205B564
	ldr r1, [r5, #0x10]
	add r0, r5, #0
	add r2, r4, #0
	mov r3, #1
	bl sub_0205B5B4
	strh r0, [r5, #0x14]
	ldrh r0, [r5, #0x16]
	add r0, r0, #1
	strh r0, [r5, #0x16]
	b _0206524E
_020651F4:
	ldrh r0, [r5, #0x14]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B624
	cmp r0, #1
	bne _0206524E
	ldr r1, _02065254 ; =gMain
	mov r0, #0xf3
	ldr r2, [r1, #0x48]
	tst r0, r2
	bne _02065214
	ldr r1, [r1, #0x5c]
	mov r0, #1
	tst r0, r1
	beq _0206524E
_02065214:
	add r0, r4, #0
	add r0, #0xd2
	ldrb r1, [r0]
	mov r0, #0x40
	add r4, #0xd2
	bic r1, r0
	strb r1, [r4]
	add r0, r5, #0
	mov r1, #0
	bl ClearFrameAndWindow2
	ldrh r0, [r5, #0x16]
	add r0, r0, #1
	strh r0, [r5, #0x16]
	b _0206524E
_02065232:
	ldr r0, [r4, #0x3c]
	bl sub_0205F5A4
	add r0, r5, #0
	bl RemoveWindow
	ldr r0, [r5, #0x10]
	bl String_dtor
	add r0, r5, #0
	bl FreeToHeap
	mov r0, #1
	pop {r3, r4, r5, pc}
_0206524E:
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_02065254: .word gMain
	thumb_func_end sub_0206518C

	thumb_func_start ItemMenuUseFunc_EvoStone
ItemMenuUseFunc_EvoStone: ; 0x02065258
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, [r6]
	add r4, r1, #0
	bl TaskManager_GetSys
	ldrh r1, [r6, #4]
	add r5, r0, #0
	cmp r1, #ITEM_WATER_STONE
	bne _02065280
	bl CheckUseWaterStoneInAlphChamber
	cmp r0, #0
	beq _02065280
	add r0, r6, #0
	add r1, r4, #0
	mov r2, #3
	bl sub_02064A8C
	pop {r3, r4, r5, r6, r7, pc}
_02065280:
	ldr r0, [r6]
	bl TaskManager_GetEnv
	add r7, r0, #0
	mov r0, #0xb
	mov r1, #0x44
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x44
	add r4, r0, #0
	bl memset
	ldr r0, [r5, #0xc]
	bl SavArray_PlayerParty_get
	str r0, [r4]
	ldr r0, [r5, #0xc]
	bl Sav2_Bag_get
	str r0, [r4, #4]
	ldr r0, [r5, #0xc]
	bl Sav2_Mailbox_get
	str r0, [r4, #8]
	ldr r0, [r5, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [r4, #0xc]
	ldr r0, [r5, #0xc]
	bl sub_020270C4
	str r0, [r4, #0x10]
	mov r0, #0x37
	lsl r0, r0, #4
	add r0, r7, r0
	str r0, [r4, #0x18]
	add r0, r4, #0
	mov r1, #0
	add r0, #0x25
	strb r1, [r0]
	add r1, r4, #0
	mov r0, #0x10
	add r1, #0x24
	strb r0, [r1]
	ldrh r1, [r6, #4]
	add r0, #0xfc
	add r0, r5, r0
	strh r1, [r4, #0x28]
	add r1, r4, #0
	ldrb r2, [r6, #6]
	add r1, #0x26
	strb r2, [r1]
	str r5, [r4, #0x1c]
	str r0, [r4, #0x20]
	ldr r1, _02065308 ; =_0210159C
	add r0, r5, #0
	add r2, r4, #0
	bl ScrUnk80_AddOvyMan
	mov r0, #0xe
	lsl r0, r0, #6
	str r4, [r7, r0]
	ldr r1, _0206530C ; =sub_0203CA9C
	add r0, r7, #0
	bl sub_0203C8F0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02065308: .word _0210159C
_0206530C: .word sub_0203CA9C
	thumb_func_end ItemMenuUseFunc_EvoStone

	thumb_func_start ItemMenuUseFunc_EscapeRope
ItemMenuUseFunc_EscapeRope: ; 0x02065310
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0x14]
	bl CheckUseEscapeRopeInAlphChamber
	cmp r0, #0
	beq _0206532C
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #3
	bl sub_02064A8C
	pop {r4, r5, r6, pc}
_0206532C:
	ldr r0, [r5]
	bl TaskManager_GetSys
	add r6, r0, #0
	ldr r0, [r5]
	bl TaskManager_GetEnv
	add r4, r0, #0
	add r0, r6, #0
	bl sub_020505C0
	mov r0, #0xd5
	ldr r1, _02065368 ; =sub_020653B8
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r1, #0
	add r0, #0x2c
	str r1, [r4, r0]
	mov r0, #0xc
	strh r0, [r4, #0x26]
	ldr r0, [r6, #0xc]
	bl Sav2_Bag_get
	ldrh r1, [r5, #4]
	mov r2, #1
	mov r3, #0xb
	bl Bag_TakeItem
	pop {r4, r5, r6, pc}
	nop
_02065368: .word sub_020653B8
	thumb_func_end ItemMenuUseFunc_EscapeRope

	thumb_func_start ItemCheckUseFunc_EscapeRope
ItemCheckUseFunc_EscapeRope: ; 0x0206536C
	push {r4, lr}
	add r4, r0, #0
	ldrh r0, [r4, #8]
	lsl r1, r0, #0x1f
	lsr r1, r1, #0x1f
	cmp r1, #1
	bne _0206537E
	mov r0, #2
	pop {r4, pc}
_0206537E:
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _0206538A
	mov r0, #3
	pop {r4, pc}
_0206538A:
	ldr r0, [r4, #0x14]
	bl CheckUseEscapeRopeInAlphChamber
	cmp r0, #0
	beq _02065398
	mov r0, #0
	pop {r4, pc}
_02065398:
	ldr r0, [r4]
	bl MapHeader_IsCave
	cmp r0, #1
	bne _020653B0
	ldr r0, [r4]
	bl MapHeader_IsEscapeRopeAllowed
	cmp r0, #1
	bne _020653B0
	mov r0, #0
	pop {r4, pc}
_020653B0:
	mov r0, #0
	mvn r0, r0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ItemCheckUseFunc_EscapeRope

	thumb_func_start sub_020653B8
sub_020653B8: ; 0x020653B8
	push {r4, lr}
	add r4, r0, #0
	bl TaskManager_GetSys
	mov r1, #0xb
	bl ov02_0224BFD8
	add r2, r0, #0
	ldr r1, _020653D4 ; =ov02_0224C020
	add r0, r4, #0
	bl NowRunTask
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_020653D4: .word ov02_0224C020
	thumb_func_end sub_020653B8

	thumb_func_start ItemMenuUseFunc_ApricornBox
ItemMenuUseFunc_ApricornBox: ; 0x020653D8
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl TaskManager_GetSys
	add r5, r0, #0
	ldr r0, [r4]
	bl TaskManager_GetEnv
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #1
	bl sub_0203ED24
	mov r1, #0xe
	lsl r1, r1, #6
	str r0, [r4, r1]
	ldr r1, _02065404 ; =sub_0203D718
	add r0, r4, #0
	bl sub_0203C8F0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02065404: .word sub_0203D718
	thumb_func_end ItemMenuUseFunc_ApricornBox

	thumb_func_start ItemFieldUseFunc_ApricornBox
ItemFieldUseFunc_ApricornBox: ; 0x02065408
	push {r3, lr}
	ldr r1, _02065418 ; =sub_0206541C
	mov r2, #0
	bl sub_020658B8
	mov r0, #1
	pop {r3, pc}
	nop
_02065418: .word sub_0206541C
	thumb_func_end ItemFieldUseFunc_ApricornBox

	thumb_func_start sub_0206541C
sub_0206541C: ; 0x0206541C
	ldr r3, _02065424 ; =sub_0203ED24
	mov r1, #1
	bx r3
	nop
_02065424: .word sub_0203ED24
	thumb_func_end sub_0206541C

	thumb_func_start ItemMenuUseFunc_BerryPots
ItemMenuUseFunc_BerryPots: ; 0x02065428
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl TaskManager_GetSys
	add r5, r0, #0
	ldr r0, [r4]
	bl TaskManager_GetEnv
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0203ECC0
	mov r1, #0xe
	lsl r1, r1, #6
	str r0, [r4, r1]
	ldr r1, _02065454 ; =sub_0203D718
	add r0, r4, #0
	bl sub_0203C8F0
	pop {r3, r4, r5, pc}
	nop
_02065454: .word sub_0203D718
	thumb_func_end ItemMenuUseFunc_BerryPots

	thumb_func_start ItemFieldUseFunc_BerryPots
ItemFieldUseFunc_BerryPots: ; 0x02065458
	push {r3, lr}
	ldr r1, _02065468 ; =sub_0206546C
	mov r2, #0
	bl sub_020658B8
	mov r0, #1
	pop {r3, pc}
	nop
_02065468: .word sub_0206546C
	thumb_func_end ItemFieldUseFunc_BerryPots

	thumb_func_start sub_0206546C
sub_0206546C: ; 0x0206546C
	ldr r3, _02065470 ; =sub_0203ECC0
	bx r3
	.balign 4, 0
_02065470: .word sub_0203ECC0
	thumb_func_end sub_0206546C

	thumb_func_start ItemMenuUseFunc_UnownReport
ItemMenuUseFunc_UnownReport: ; 0x02065474
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl TaskManager_GetSys
	add r5, r0, #0
	ldr r0, [r4]
	bl TaskManager_GetEnv
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0203EC64
	mov r1, #0xe
	lsl r1, r1, #6
	str r0, [r4, r1]
	ldr r1, _020654A0 ; =sub_0203D718
	add r0, r4, #0
	bl sub_0203C8F0
	pop {r3, r4, r5, pc}
	nop
_020654A0: .word sub_0203D718
	thumb_func_end ItemMenuUseFunc_UnownReport

	thumb_func_start ItemFieldUseFunc_UnownReport
ItemFieldUseFunc_UnownReport: ; 0x020654A4
	push {r3, lr}
	ldr r1, _020654B4 ; =sub_020654B8
	mov r2, #0
	bl sub_020658B8
	mov r0, #1
	pop {r3, pc}
	nop
_020654B4: .word sub_020654B8
	thumb_func_end ItemFieldUseFunc_UnownReport

	thumb_func_start sub_020654B8
sub_020654B8: ; 0x020654B8
	ldr r3, _020654BC ; =sub_0203EC64
	bx r3
	.balign 4, 0
_020654BC: .word sub_0203EC64
	thumb_func_end sub_020654B8

	thumb_func_start ItemMenuUseFunc_DowsingMchn
ItemMenuUseFunc_DowsingMchn: ; 0x020654C0
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl TaskManager_GetSys
	add r5, r0, #0
	ldr r0, [r4]
	bl TaskManager_GetEnv
	add r4, r0, #0
	add r0, r5, #0
	bl sub_020505C0
	mov r0, #0xd5
	ldr r1, _020654F0 ; =sub_02065508
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r1, #0
	add r0, #0x2c
	str r1, [r4, r0]
	mov r0, #0xc
	strh r0, [r4, #0x26]
	pop {r3, r4, r5, pc}
	nop
_020654F0: .word sub_02065508
	thumb_func_end ItemMenuUseFunc_DowsingMchn

	thumb_func_start ItemFieldUseFunc_DowsingMchn
ItemFieldUseFunc_DowsingMchn: ; 0x020654F4
	push {r3, lr}
	ldr r0, [r0]
	ldr r1, _02065504 ; =sub_02065508
	mov r2, #0
	bl sub_020504F0
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_02065504: .word sub_02065508
	thumb_func_end ItemFieldUseFunc_DowsingMchn

	thumb_func_start sub_02065508
sub_02065508: ; 0x02065508
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl TaskManager_GetSys
	add r5, r0, #0
	add r0, r4, #0
	bl sub_02050654
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _02065526
	cmp r0, #1
	beq _02065546
	b _0206555A
_02065526:
	add r0, r5, #0
	mov r1, #4
	mov r2, #0
	bl ov01_021F6A9C
	add r0, r5, #0
	add r0, #0xd2
	ldrb r1, [r0]
	mov r0, #0x80
	add r5, #0xd2
	orr r0, r1
	strb r0, [r5]
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0206555A
_02065546:
	add r0, r5, #0
	bl ov01_021F6B10
	cmp r0, #1
	bne _0206555A
	ldr r0, [r5, #0x3c]
	bl sub_0205F5A4
	mov r0, #1
	pop {r3, r4, r5, pc}
_0206555A:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02065508

	thumb_func_start ItemFieldUseFunc_GbSounds
ItemFieldUseFunc_GbSounds: ; 0x02065560
	push {r4, r5, r6, lr}
	add r6, r0, #0
	mov r0, #0xb
	mov r1, #0x18
	bl AllocFromHeap
	add r4, r0, #0
	mov r0, #0
	mov r1, #0x1b
	mov r2, #0xa
	mov r3, #0xb
	strh r0, [r4, #0x16]
	bl NewMsgDataFromNarc
	add r5, r0, #0
	bl sub_02005C18
	cmp r0, #1
	bne _02065590
	add r0, r5, #0
	mov r1, #0x69
	bl NewString_ReadMsgData
	b _02065598
_02065590:
	add r0, r5, #0
	mov r1, #0x68
	bl NewString_ReadMsgData
_02065598:
	str r0, [r4, #0x10]
	add r0, r5, #0
	bl DestroyMsgData
	bl sub_02005C24
	ldr r0, [r6]
	ldr r1, _020655B4 ; =sub_0206518C
	add r2, r4, #0
	bl sub_020504F0
	mov r0, #0
	pop {r4, r5, r6, pc}
	nop
_020655B4: .word sub_0206518C
	thumb_func_end ItemFieldUseFunc_GbSounds

	thumb_func_start ItemMenuUseFunc_Gracidea
ItemMenuUseFunc_Gracidea: ; 0x020655B8
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl TaskManager_GetSys
	add r5, r0, #0
	ldr r0, [r4]
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldr r2, _020655E8 ; =0x000001D2
	add r0, r5, #0
	mov r1, #0xb
	bl sub_0203FAE8
	mov r1, #0xe
	lsl r1, r1, #6
	str r0, [r4, r1]
	ldr r1, _020655EC ; =sub_0203CA9C
	add r0, r4, #0
	bl sub_0203C8F0
	pop {r3, r4, r5, pc}
	nop
_020655E8: .word 0x000001D2
_020655EC: .word sub_0203CA9C
	thumb_func_end ItemMenuUseFunc_Gracidea

	thumb_func_start ItemFieldUseFunc_Gracidea
ItemFieldUseFunc_Gracidea: ; 0x020655F0
	push {r3, lr}
	ldr r1, _02065600 ; =sub_02065604
	mov r2, #0
	bl sub_020658B8
	mov r0, #1
	pop {r3, pc}
	nop
_02065600: .word sub_02065604
	thumb_func_end ItemFieldUseFunc_Gracidea

	thumb_func_start sub_02065604
sub_02065604: ; 0x02065604
	ldr r3, _0206560C ; =sub_0203FAE8
	mov r1, #0xb
	ldr r2, _02065610 ; =0x000001D2
	bx r3
	.balign 4, 0
_0206560C: .word sub_0203FAE8
_02065610: .word 0x000001D2
	thumb_func_end sub_02065604

	thumb_func_start ItemMenuUseFunc_VSRecorder
ItemMenuUseFunc_VSRecorder: ; 0x02065614
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl TaskManager_GetSys
	add r5, r0, #0
	ldr r0, [r4]
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldr r1, [r5, #0xc]
	add r0, r5, #0
	bl sub_0203F570
	mov r0, #0xe
	mov r1, #0
	lsl r0, r0, #6
	str r1, [r4, r0]
	ldr r1, _02065644 ; =sub_0203D9B4
	add r0, r4, #0
	bl sub_0203C8F0
	pop {r3, r4, r5, pc}
	nop
_02065644: .word sub_0203D9B4
	thumb_func_end ItemMenuUseFunc_VSRecorder

	thumb_func_start ItemFieldUseFunc_VSRecorder
ItemFieldUseFunc_VSRecorder: ; 0x02065648
	push {r3, lr}
	ldr r1, _02065658 ; =sub_0206565C
	mov r2, #0
	bl sub_020658B8
	mov r0, #1
	pop {r3, pc}
	nop
_02065658: .word sub_0206565C
	thumb_func_end ItemFieldUseFunc_VSRecorder

	thumb_func_start sub_0206565C
sub_0206565C: ; 0x0206565C
	push {r4, lr}
	add r4, r0, #0
	bl ov01_021F4440
	ldr r1, [r4, #0xc]
	add r0, r4, #0
	bl sub_0203F570
	mov r0, #0
	pop {r4, pc}
	thumb_func_end sub_0206565C

	thumb_func_start KeyItemIdIsUsedInTheField
KeyItemIdIsUsedInTheField: ; 0x02065670
	ldr r3, _0206568C ; =_0210FAD8
	mov r2, #0
_02065674:
	ldrh r0, [r3]
	cmp r1, r0
	bne _0206567E
	mov r0, #0
	bx lr
_0206567E:
	add r2, r2, #1
	add r3, r3, #2
	cmp r2, #8
	blo _02065674
	mov r0, #1
	bx lr
	nop
_0206568C: .word _0210FAD8
	thumb_func_end KeyItemIdIsUsedInTheField

	thumb_func_start UseRegisteredItemButtonInField
UseRegisteredItemButtonInField: ; 0x02065690
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #1
	beq _020656A2
	cmp r4, #2
	beq _020656A2
	bl GF_AssertFail
_020656A2:
	add r0, r5, #0
	bl sub_02067584
	cmp r0, #1
	bne _020656B0
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_020656B0:
	ldr r0, [r5, #0xc]
	bl SavArray_Flags_get
	bl ScriptState_CheckPalParkSysFlag
	cmp r0, #1
	bne _020656C2
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_020656C2:
	ldr r0, [r5, #0xc]
	bl SavArray_Flags_get
	bl sub_02066870
	cmp r0, #1
	bne _020656D4
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_020656D4:
	add r0, r5, #0
	bl ov01_021F6B10
	cmp r0, #1
	beq _020656E2
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_020656E2:
	cmp r4, #1
	ldr r0, [r5, #0xc]
	bne _020656F2
	bl Sav2_Bag_get
	bl Bag_GetRegisteredItemSlot1
	b _020656FA
_020656F2:
	bl Sav2_Bag_get
	bl Bag_GetRegisteredItemSlot2
_020656FA:
	add r6, r0, #0
	ldr r0, _020657A0 ; =ITEM_DOWSING_MCHN
	cmp r6, r0
	bne _02065710
	add r0, r5, #0
	bl ov01_021F6B00
	cmp r0, #4
	bne _02065710
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02065710:
	add r0, r6, #0
	mov r1, #ITEMATTR_FIELDUSEFUNC
	mov r2, #0xb
	bl GetItemAttr
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	mov r0, #2
	add r1, r4, #0
	bl GetItemFieldUseFunc
	add r7, r0, #0
	mov r0, #1
	add r1, r4, #0
	bl GetItemFieldUseFunc
	str r0, [sp]
	cmp r0, #0
	bne _0206573A
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0206573A:
	mov r0, #0xb
	mov r1, #0x28
	bl AllocFromHeap
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x28
	bl memset
	str r5, [r4]
	add r0, r5, #0
	add r1, r4, #4
	strh r6, [r4, #0x24]
	bl sub_020649B8
	mov r6, #0
	cmp r7, #0
	bne _02065768
	ldr r1, [sp]
	add r0, r4, #0
	blx r1
	add r6, r0, #0
	b _02065780
_02065768:
	add r0, r4, #4
	blx r7
	add r1, r0, #0
	bne _0206577A
	ldr r1, [sp]
	add r0, r4, #0
	blx r1
	add r6, r0, #0
	b _02065780
_0206577A:
	add r0, r4, #0
	bl sub_020657A4
_02065780:
	cmp r6, #0
	bne _0206578C
	add r0, r4, #0
	bl FreeToHeap
	b _0206579C
_0206578C:
	ldrh r1, [r4, #0x24]
	add r0, r5, #0
	bl KeyItemIdIsUsedInTheField
	cmp r0, #0
	beq _0206579C
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0206579C:
	mov r0, #2
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_020657A0: .word ITEM_DOWSING_MCHN
	thumb_func_end UseRegisteredItemButtonInField

	thumb_func_start sub_020657A4
sub_020657A4: ; 0x020657A4
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #0xb
	mov r1, #0x18
	bl AllocFromHeap
	add r4, r0, #0
	mov r0, #0
	strh r0, [r4, #0x16]
	mov r0, #0x80
	mov r1, #0xb
	bl String_ctor
	str r0, [r4, #0x10]
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	mov r1, #0xb
	str r1, [sp]
	ldrh r2, [r5, #0x24]
	ldr r1, [r4, #0x10]
	add r3, r6, #0
	bl GetItemUseErrorMessage
	ldr r0, [r5]
	ldr r1, _020657E8 ; =sub_0206518C
	add r2, r4, #0
	bl sub_020504F0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_020657E8: .word sub_0206518C
	thumb_func_end sub_020657A4

	thumb_func_start sub_020657EC
sub_020657EC: ; 0x020657EC
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl TaskManager_GetSys
	add r5, r0, #0
	add r0, r4, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	add r0, #0x26
	ldrb r0, [r0]
	cmp r0, #5
	bhi _020658B4
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02065812: ; jump table
	.short _0206581E - _02065812 - 2 ; case 0
	.short _02065832 - _02065812 - 2 ; case 1
	.short _0206585C - _02065812 - 2 ; case 2
	.short _02065866 - _02065812 - 2 ; case 3
	.short _0206587E - _02065812 - 2 ; case 4
	.short _0206589C - _02065812 - 2 ; case 5
_0206581E:
	ldr r0, [r5, #0x3c]
	bl sub_0205F574
	mov r0, #0
	bl ov01_021E636C
	mov r0, #1
	add r4, #0x26
	strb r0, [r4]
	b _020658B4
_02065832:
	bl sub_0200FB5C
	cmp r0, #0
	beq _020658B4
	ldr r1, [r4, #0x1c]
	add r0, r5, #0
	blx r1
	str r0, [r4, #0x20]
	add r0, r4, #0
	add r0, #0x27
	ldrb r0, [r0]
	cmp r0, #0
	bne _02065854
	mov r0, #2
	add r4, #0x26
	strb r0, [r4]
	b _020658B4
_02065854:
	mov r0, #3
	add r4, #0x26
	strb r0, [r4]
	b _020658B4
_0206585C:
	add r0, r5, #0
	bl FieldSys_ApplicationIsRunning
	cmp r0, #0
	bne _020658B4
_02065866:
	ldr r0, [r4, #0x20]
	cmp r0, #0
	beq _02065870
	bl FreeToHeap
_02065870:
	add r0, r5, #0
	bl sub_020505C0
	mov r0, #4
	add r4, #0x26
	strb r0, [r4]
	b _020658B4
_0206587E:
	add r0, r5, #0
	bl sub_020505C8
	cmp r0, #0
	beq _020658B4
	ldr r0, [r5, #0x3c]
	bl sub_0205F574
	mov r0, #1
	bl ov01_021E636C
	mov r0, #5
	add r4, #0x26
	strb r0, [r4]
	b _020658B4
_0206589C:
	bl sub_0200FB5C
	cmp r0, #0
	beq _020658B4
	ldr r0, [r5, #0x3c]
	bl sub_0205F5A4
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #1
	pop {r3, r4, r5, pc}
_020658B4:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_020657EC

	thumb_func_start sub_020658B8
sub_020658B8: ; 0x020658B8
	add r3, r0, #0
	str r1, [r3, #0x1c]
	add r0, #0x27
	strb r2, [r0]
	ldr r0, [r3]
	add r2, r3, #0
	ldr r3, _020658CC ; =sub_020504F0
	ldr r1, _020658D0 ; =sub_020657EC
	bx r3
	nop
_020658CC: .word sub_020504F0
_020658D0: .word sub_020657EC
	thumb_func_end sub_020658B8

	thumb_func_start sub_020658D4
sub_020658D4: ; 0x020658D4
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0xc
	bl sub_0205F370
	add r1, r0, #0
	add r0, r4, #0
	bl sub_02065CD0
	add r0, r4, #0
	mov r1, #0
	bl sub_0205F328
	add r0, r4, #0
	bl sub_0205F63C
	add r0, r4, #0
	mov r1, #0
	bl sub_0205F6AC
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020658D4

	thumb_func_start sub_02065900
sub_02065900: ; 0x02065900
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl sub_0205F394
	add r4, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02065CD0
	cmp r0, #0
	beq _02065930
	add r0, r5, #0
	mov r1, #0
	bl sub_0205F6AC
	ldr r6, _02065934 ; =_020FE404
_02065920:
	ldrb r2, [r4]
	add r0, r5, #0
	add r1, r4, #0
	lsl r2, r2, #2
	ldr r2, [r6, r2]
	blx r2
	cmp r0, #1
	beq _02065920
_02065930:
	pop {r4, r5, r6, pc}
	nop
_02065934: .word _020FE404
	thumb_func_end sub_02065900

	thumb_func_start sub_02065938
sub_02065938: ; 0x02065938
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl sub_0205F394
	add r4, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02065CD0
	cmp r0, #0
	beq _02065960
	ldr r6, _02065964 ; =_020FE414
_02065950:
	ldrb r2, [r4]
	add r0, r5, #0
	add r1, r4, #0
	lsl r2, r2, #2
	ldr r2, [r6, r2]
	blx r2
	cmp r0, #1
	beq _02065950
_02065960:
	pop {r4, r5, r6, pc}
	nop
_02065964: .word _020FE414
	thumb_func_end sub_02065938

	thumb_func_start sub_02065968
sub_02065968: ; 0x02065968
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl sub_0205F394
	add r4, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02065CD0
	cmp r0, #0
	beq _02065990
	ldr r6, _02065994 ; =_020FE424
_02065980:
	ldrb r2, [r4]
	add r0, r5, #0
	add r1, r4, #0
	lsl r2, r2, #2
	ldr r2, [r6, r2]
	blx r2
	cmp r0, #1
	beq _02065980
_02065990:
	pop {r4, r5, r6, pc}
	nop
_02065994: .word _020FE424
	thumb_func_end sub_02065968

	thumb_func_start sub_02065998
sub_02065998: ; 0x02065998
	bx lr
	.balign 4, 0
	thumb_func_end sub_02065998

	thumb_func_start sub_0206599C
sub_0206599C: ; 0x0206599C
	push {r3, lr}
	bl sub_0205F394
	ldrb r0, [r0, #3]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0206599C

	thumb_func_start sub_020659A8
sub_020659A8: ; 0x020659A8
	push {r3, lr}
	bl sub_0205F394
	ldrh r0, [r0, #0xa]
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1e
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_020659A8

	thumb_func_start sub_020659B8
sub_020659B8: ; 0x020659B8
	push {r3, lr}
	bl sub_0205F394
	ldrh r2, [r0, #0xa]
	mov r1, #1
	bic r2, r1
	mov r1, #1
	orr r1, r2
	strh r1, [r0, #0xa]
	pop {r3, pc}
	thumb_func_end sub_020659B8

	thumb_func_start sub_020659CC
sub_020659CC: ; 0x020659CC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl MapObject_GetFieldSysPtr
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0205F394
	add r6, r0, #0
	add r0, r5, #0
	bl sub_0205F63C
	add r0, r5, #0
	bl sub_0205F660
	add r0, r5, #0
	mov r1, #0x20
	bl MapObject_ClearBits
	add r0, r5, #0
	mov r1, #0xff
	bl sub_0205F4CC
	add r0, r5, #0
	mov r1, #0
	bl sub_0205F4DC
	mov r1, #0
	add r0, r4, #0
	strb r1, [r6]
	add r0, #0xe8
	str r1, [r0]
	mov r0, #1
	lsl r0, r0, #8
	str r1, [r4, r0]
	add r0, r4, #0
	add r0, #0xec
	str r1, [r0]
	add r4, #0xf0
	add r0, r5, #0
	str r1, [r4]
	bl MapObject_GetCurrentX
	add r4, r0, #0
	add r0, r5, #0
	bl MapObject_GetCurrentHeight
	add r6, r0, #0
	add r0, r5, #0
	bl MapObject_GetCurrentY
	add r7, r0, #0
	add r0, r5, #0
	bl MapObject_GetFacingDirection
	str r0, [sp]
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	add r3, r7, #0
	bl sub_0205FC2C
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_020659CC

	thumb_func_start sub_02065A4C
sub_02065A4C: ; 0x02065A4C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r1, #0
	bl MapObject_GetFieldSysPtr
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0205F63C
	add r0, r5, #0
	bl sub_0205F660
	mov r0, #1
	lsl r0, r0, #8
	ldr r1, [r4, r0]
	cmp r1, #1
	bne _02065A76
	mov r1, #2
	str r1, [r4, r0]
	mov r0, #0
	pop {r4, r5, r6, pc}
_02065A76:
	cmp r1, #2
	bne _02065B64
	add r0, r5, #0
	add r1, r6, #0
	bl sub_02065D58
	add r0, r5, #0
	bl MapObject_GetCurrentX
	add r1, r4, #0
	add r1, #0xec
	ldr r1, [r1]
	cmp r1, r0
	bne _02065B12
	add r0, r5, #0
	bl MapObject_GetCurrentY
	add r1, r4, #0
	add r1, #0xf0
	ldr r1, [r1]
	cmp r1, r0
	bne _02065B12
	mov r0, #1
	mov r1, #0
	lsl r0, r0, #8
	str r1, [r4, r0]
	mov r0, #3
	strb r0, [r6]
	add r0, r5, #0
	bl sub_02069E14
	cmp r0, #0
	beq _02065AEA
	ldrh r0, [r6, #0xa]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	bne _02065AEA
	add r0, r5, #0
	bl sub_02069EAC
	cmp r0, #0
	beq _02065ADC
	add r0, r5, #0
	mov r1, #0
	bl ov01_0220329C
	add r0, r5, #0
	mov r1, #0
	bl sub_02069E84
	b _02065AE4
_02065ADC:
	add r0, r5, #0
	mov r1, #0
	bl sub_02069DC8
_02065AE4:
	add r0, r5, #0
	bl sub_020664D8
_02065AEA:
	add r0, r5, #0
	bl sub_02065D78
	bl sub_020623C8
	cmp r0, #0
	beq _02065B0E
	add r0, r4, #0
	bl sub_0205CA1C
	bl PlayerAvatar_GetFacingDirection
	add r1, r0, #0
	lsl r1, r1, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl sub_02069E28
_02065B0E:
	mov r0, #1
	pop {r4, r5, r6, pc}
_02065B12:
	add r0, r5, #0
	add r1, r6, #0
	bl sub_02065DF4
	cmp r0, #1
	bne _02065B6C
	add r0, r5, #0
	bl sub_02069E14
	cmp r0, #0
	beq _02065B52
	add r0, r5, #0
	bl sub_02069EAC
	cmp r0, #0
	beq _02065B44
	add r0, r5, #0
	mov r1, #0
	bl ov01_0220329C
	add r0, r5, #0
	mov r1, #0
	bl sub_02069E84
	b _02065B4C
_02065B44:
	add r0, r5, #0
	mov r1, #0
	bl sub_02069DC8
_02065B4C:
	add r0, r5, #0
	bl sub_020664D8
_02065B52:
	add r0, r5, #0
	bl sub_0205F630
	mov r1, #3
	add r0, r1, #0
	add r0, #0xfd
	str r1, [r4, r0]
	mov r0, #1
	pop {r4, r5, r6, pc}
_02065B64:
	cmp r1, #3
	bne _02065B6C
	mov r1, #0
	str r1, [r4, r0]
_02065B6C:
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02065A4C

	thumb_func_start sub_02065B70
sub_02065B70: ; 0x02065B70
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0205F63C
	add r0, r5, #0
	bl sub_0205F660
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02065D24
	cmp r0, #1
	bne _02065BE2
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02065D58
	add r0, r5, #0
	bl sub_02069E14
	cmp r0, #0
	beq _02065BC8
	add r0, r5, #0
	bl sub_02069EAC
	cmp r0, #0
	beq _02065BBA
	add r0, r5, #0
	mov r1, #0
	bl ov01_0220329C
	add r0, r5, #0
	mov r1, #0
	bl sub_02069E84
	b _02065BC2
_02065BBA:
	add r0, r5, #0
	mov r1, #0
	bl sub_02069DC8
_02065BC2:
	add r0, r5, #0
	bl sub_020664D8
_02065BC8:
	add r0, r5, #0
	bl sub_02065F44
	cmp r0, #1
	bne _02065BE2
	add r0, r5, #0
	bl sub_0205F630
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	mov r0, #1
	pop {r3, r4, r5, pc}
_02065BE2:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02065B70

	thumb_func_start sub_02065BE8
sub_02065BE8: ; 0x02065BE8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0205F63C
	add r0, r5, #0
	bl sub_0205F660
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02065D24
	cmp r0, #1
	bne _02065C26
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02065D58
	add r0, r5, #0
	bl sub_02065FBC
	cmp r0, #1
	bne _02065C26
	add r0, r5, #0
	bl sub_0205F630
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	mov r0, #1
	pop {r3, r4, r5, pc}
_02065C26:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02065BE8

	thumb_func_start sub_02065C2C
sub_02065C2C: ; 0x02065C2C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_02062428
	cmp r0, #1
	bne _02065C44
	add r0, r5, #0
	bl sub_0205F63C
	mov r0, #0
	strb r0, [r4]
_02065C44:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02065C2C

	thumb_func_start sub_02065C48
sub_02065C48: ; 0x02065C48
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_02062428
	cmp r0, #1
	bne _02065C86
	ldrb r0, [r4, #2]
	add r0, r0, #1
	strb r0, [r4, #2]
	ldrb r0, [r4, #2]
	cmp r0, #2
	blo _02065C78
	add r0, r5, #0
	bl sub_0205F63C
	mov r0, #0
	strb r0, [r4]
	strb r0, [r4, #3]
	ldrh r2, [r4, #0xa]
	mov r1, #6
	bic r2, r1
	strh r2, [r4, #0xa]
	pop {r3, r4, r5, pc}
_02065C78:
	add r0, r5, #0
	bl sub_02069ED4
	add r1, r0, #0
	add r0, r5, #0
	bl sub_0206217C
_02065C86:
	ldrb r0, [r4, #3]
	add r0, r0, #1
	strb r0, [r4, #3]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02065C48

	thumb_func_start sub_02065C90
sub_02065C90: ; 0x02065C90
	push {r4, r5, r6, lr}
	add r5, r1, #0
	bl MapObject_GetFieldSysPtr
	bl sub_0205CA1C
	add r4, r0, #0
	bl PlayerAvatar_GetMapObject
	mov r1, #0x10
	add r6, r0, #0
	bl MapObject_TestBits
	cmp r0, #1
	bne _02065CBE
	add r0, r6, #0
	mov r1, #0x20
	bl MapObject_TestBits
	cmp r0, #1
	bne _02065CBE
	mov r0, #0
	strb r0, [r5]
_02065CBE:
	add r0, r4, #0
	bl sub_0205C6D4
	cmp r0, #3
	bne _02065CCC
	mov r0, #0
	strb r0, [r5]
_02065CCC:
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02065C90

	thumb_func_start sub_02065CD0
sub_02065CD0: ; 0x02065CD0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0205F35C
	bl sub_0205C600
	cmp r0, #0
	bne _02065CE8
	mov r0, #0
	strb r0, [r4, #1]
	pop {r3, r4, r5, pc}
_02065CE8:
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _02065CF6
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02065CFC
_02065CF6:
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02065CD0

	thumb_func_start sub_02065CFC
sub_02065CFC: ; 0x02065CFC
	push {r3, r4, r5, lr}
	add r5, r1, #0
	bl MapObject_GetFieldSysPtr
	bl sub_0205CA1C
	mov r1, #1
	add r4, r0, #0
	strb r1, [r5, #1]
	bl GetPlayerXCoord
	strh r0, [r5, #4]
	add r0, r4, #0
	bl GetPlayerYCoord
	strh r0, [r5, #6]
	mov r0, #0xff
	strh r0, [r5, #8]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02065CFC

	thumb_func_start sub_02065D24
sub_02065D24: ; 0x02065D24
	push {r4, r5, r6, lr}
	add r5, r1, #0
	bl MapObject_GetFieldSysPtr
	bl sub_0205CA1C
	add r6, r0, #0
	beq _02065D54
	bl GetPlayerXCoord
	add r4, r0, #0
	add r0, r6, #0
	bl GetPlayerYCoord
	mov r1, #4
	ldrsh r1, [r5, r1]
	cmp r4, r1
	bne _02065D50
	mov r1, #6
	ldrsh r1, [r5, r1]
	cmp r0, r1
	beq _02065D54
_02065D50:
	mov r0, #1
	pop {r4, r5, r6, pc}
_02065D54:
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02065D24

	thumb_func_start sub_02065D58
sub_02065D58: ; 0x02065D58
	push {r3, r4, r5, lr}
	add r5, r1, #0
	bl MapObject_GetFieldSysPtr
	bl sub_0205CA1C
	add r4, r0, #0
	bl GetPlayerXCoord
	strh r0, [r5, #4]
	add r0, r4, #0
	bl GetPlayerYCoord
	strh r0, [r5, #6]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02065D58

	thumb_func_start sub_02065D78
sub_02065D78: ; 0x02065D78
	push {r4, lr}
	bl MapObject_GetFieldSysPtr
	add r4, r0, #0
	bl sub_0205CA1C
	add r4, #0xe8
	ldr r0, [r4]
	add r1, r0, #0
	sub r1, #0x58
	cmp r1, #3
	bhi _02065DB2
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02065D9C: ; jump table
	.short _02065DA4 - _02065D9C - 2 ; case 0
	.short _02065DA8 - _02065D9C - 2 ; case 1
	.short _02065DAC - _02065D9C - 2 ; case 2
	.short _02065DB0 - _02065D9C - 2 ; case 3
_02065DA4:
	mov r0, #0x10
	pop {r4, pc}
_02065DA8:
	mov r0, #0x11
	pop {r4, pc}
_02065DAC:
	mov r0, #0x12
	pop {r4, pc}
_02065DB0:
	mov r0, #0x13
_02065DB2:
	pop {r4, pc}
	thumb_func_end sub_02065D78

	thumb_func_start sub_02065DB4
sub_02065DB4: ; 0x02065DB4
	push {r3, lr}
	bl MapObject_GetFieldSysPtr
	bl sub_0205CA1C
	bl PlayerAvatar_GetMapObject
	bl sub_0205F4D4
	add r1, r0, #0
	sub r1, #0x58
	cmp r1, #3
	bhi _02065DF0
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02065DDA: ; jump table
	.short _02065DE2 - _02065DDA - 2 ; case 0
	.short _02065DE6 - _02065DDA - 2 ; case 1
	.short _02065DEA - _02065DDA - 2 ; case 2
	.short _02065DEE - _02065DDA - 2 ; case 3
_02065DE2:
	mov r0, #0x10
	pop {r3, pc}
_02065DE6:
	mov r0, #0x11
	pop {r3, pc}
_02065DEA:
	mov r0, #0x12
	pop {r3, pc}
_02065DEE:
	mov r0, #0x13
_02065DF0:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02065DB4

	thumb_func_start sub_02065DF4
sub_02065DF4: ; 0x02065DF4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	add r4, r1, #0
	bl MapObject_GetFieldSysPtr
	bl sub_0205CA1C
	add r7, r0, #0
	add r0, r5, #0
	bl MapObject_GetCurrentX
	str r0, [sp, #8]
	add r0, r5, #0
	bl MapObject_GetCurrentY
	str r0, [sp, #4]
	add r0, r7, #0
	bl GetPlayerLastXCoord
	str r0, [sp]
	add r0, r7, #0
	bl GetPlayerLastYCoord
	add r6, r0, #0
	ldr r1, [sp, #8]
	ldr r0, [sp]
	cmp r1, r0
	bne _02065E36
	ldr r0, [sp, #4]
	cmp r0, r6
	bne _02065E36
	b _02065F3C
_02065E36:
	add r0, r5, #0
	bl sub_02065D78
	str r0, [sp, #0x10]
	ldr r0, [sp, #8]
	ldr r1, [sp, #4]
	ldr r2, [sp]
	add r3, r6, #0
	bl sub_02061200
	str r0, [sp, #0x14]
	add r0, r5, #0
	bl sub_02069EC0
	add r6, r0, #0
	ldr r0, [sp, #0x10]
	bl sub_020623C8
	mov r1, #1
	str r1, [sp, #0xc]
	cmp r6, #0
	beq _02065F00
	cmp r0, #0
	beq _02065EB4
	add r0, r6, #0
	bl sub_020623D8
	add r1, r0, #0
	add r0, r6, #0
	bl ov01_0220542C
	add r6, r0, #0
	bl sub_02066444
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	lsl r0, r0, #0x1e
	ldrh r1, [r4, #0xa]
	mov r2, #6
	lsr r0, r0, #0x1d
	bic r1, r2
	orr r0, r1
	lsl r1, r6, #0x18
	strh r0, [r4, #0xa]
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl sub_02069E50
	mov r0, #2
	str r0, [sp, #0xc]
	mov r0, #0
	strb r0, [r4, #2]
	strb r0, [r4, #3]
	add r0, r7, #0
	bl PlayerAvatar_GetFacingDirection
	add r1, r0, #0
	lsl r1, r1, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl sub_02069E28
	b _02065F2A
_02065EB4:
	add r0, r7, #0
	bl sub_0205CB00
	cmp r0, #0
	bne _02065EC4
	add sp, #0x18
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02065EC4:
	ldr r1, [sp, #0x10]
	add r0, r6, #0
	bl ov01_0220542C
	add r6, r0, #0
	bl sub_02066444
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	lsl r0, r0, #0x1e
	ldrh r1, [r4, #0xa]
	mov r2, #6
	lsr r0, r0, #0x1d
	bic r1, r2
	orr r0, r1
	lsl r1, r6, #0x18
	strh r0, [r4, #0xa]
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl sub_02069E50
	mov r0, #2
	str r0, [sp, #0xc]
	mov r1, #0
	strb r1, [r4, #2]
	add r0, r5, #0
	strb r1, [r4, #3]
	bl sub_02069E28
	b _02065F2A
_02065F00:
	cmp r0, #0
	beq _02065F20
	ldr r0, [sp, #0x14]
	bl sub_020623D8
	add r6, r0, #0
	add r0, r7, #0
	bl PlayerAvatar_GetFacingDirection
	add r1, r0, #0
	lsl r1, r1, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl sub_02069E28
	b _02065F2A
_02065F20:
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x10]
	bl sub_0206234C
	add r6, r0, #0
_02065F2A:
	add r0, r5, #0
	add r1, r6, #0
	bl sub_0206217C
	ldr r0, [sp, #0xc]
	add sp, #0x18
	strb r0, [r4]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02065F3C:
	mov r0, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02065DF4

	thumb_func_start sub_02065F44
sub_02065F44: ; 0x02065F44
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	bl MapObject_GetFieldSysPtr
	bl sub_0205CA1C
	add r4, r0, #0
	add r0, r5, #0
	bl MapObject_GetCurrentX
	str r0, [sp]
	add r0, r5, #0
	bl MapObject_GetCurrentY
	add r7, r0, #0
	add r0, r4, #0
	bl GetPlayerLastXCoord
	add r6, r0, #0
	add r0, r4, #0
	bl GetPlayerLastYCoord
	add r4, r0, #0
	ldr r0, [sp]
	cmp r0, r6
	bne _02065F7E
	cmp r7, r4
	beq _02065FB4
_02065F7E:
	add r0, r5, #0
	bl sub_02065DB4
	str r0, [sp, #4]
	ldr r0, [sp]
	add r1, r7, #0
	add r2, r6, #0
	add r3, r4, #0
	bl sub_02061200
	ldr r1, [sp, #4]
	cmp r1, #0xff
	bne _02065FA2
	bl GF_AssertFail
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02065FA2:
	bl sub_0206234C
	add r1, r0, #0
	add r0, r5, #0
	bl sub_0206217C
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02065FB4:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02065F44

	thumb_func_start sub_02065FBC
sub_02065FBC: ; 0x02065FBC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl MapObject_GetFieldSysPtr
	bl sub_0205CA1C
	add r4, r0, #0
	add r0, r5, #0
	bl MapObject_GetCurrentX
	add r0, r5, #0
	bl MapObject_GetCurrentY
	add r0, r4, #0
	bl GetPlayerLastXCoord
	add r0, r4, #0
	bl GetPlayerLastYCoord
	add r0, r5, #0
	bl sub_02065DB4
	add r1, r0, #0
	cmp r1, #0xff
	bne _02065FF2
	mov r0, #0
	pop {r3, r4, r5, pc}
_02065FF2:
	add r0, r5, #0
	bl sub_0206217C
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02065FBC

	thumb_func_start sub_02065FFC
sub_02065FFC: ; 0x02065FFC
	push {r3, r4, r5, lr}
	mov r1, #0xc
	add r5, r0, #0
	bl sub_0205F370
	add r4, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02066150
	add r0, r5, #0
	mov r1, #0
	bl sub_0205F328
	add r0, r5, #0
	bl sub_0205F63C
	mov r0, #0
	strb r0, [r4, #1]
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02065FFC

	thumb_func_start sub_02066024
sub_02066024: ; 0x02066024
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl sub_0205F394
	add r4, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02066150
	cmp r0, #0
	beq _0206604C
	ldr r6, _02066050 ; =_020FE3D4
_0206603C:
	ldrb r2, [r4]
	add r0, r5, #0
	add r1, r4, #0
	lsl r2, r2, #2
	ldr r2, [r6, r2]
	blx r2
	cmp r0, #1
	beq _0206603C
_0206604C:
	pop {r4, r5, r6, pc}
	nop
_02066050: .word _020FE3D4
	thumb_func_end sub_02066024

	thumb_func_start sub_02066054
sub_02066054: ; 0x02066054
	bx lr
	.balign 4, 0
	thumb_func_end sub_02066054

	thumb_func_start sub_02066058
sub_02066058: ; 0x02066058
	push {r3, lr}
	bl sub_0205F394
	mov r1, #0
	strb r1, [r0, #1]
	pop {r3, pc}
	thumb_func_end sub_02066058

	thumb_func_start sub_02066064
sub_02066064: ; 0x02066064
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0205F63C
	add r0, r5, #0
	bl sub_0205F660
	add r0, r5, #0
	add r1, r4, #0
	bl sub_020661F0
	cmp r0, #1
	bne _0206609C
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0206623C
	cmp r0, #1
	bne _0206609C
	add r0, r5, #0
	bl sub_0205F630
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	mov r0, #1
	pop {r3, r4, r5, pc}
_0206609C:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02066064

	thumb_func_start sub_020660A0
sub_020660A0: ; 0x020660A0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_02062428
	cmp r0, #0
	bne _020660B2
	mov r0, #0
	pop {r3, r4, r5, pc}
_020660B2:
	add r0, r5, #0
	bl sub_0205F63C
	mov r0, #0
	strb r0, [r4]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_020660A0

	thumb_func_start sub_020660C0
sub_020660C0: ; 0x020660C0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	mov r1, #0
	add r4, r0, #0
	str r1, [sp, #8]
	bl MapObject_GetType
	str r0, [sp]
	add r0, r4, #0
	bl sub_0205F254
	add r6, r0, #0
	add r0, r4, #0
	bl sub_02064518
	add r5, r0, #0
	add r0, r4, #0
	bl sub_0205F35C
	ldr r1, [sp]
	add r7, r0, #0
	cmp r1, #8
	bhi _02066148
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_020660FA: ; jump table
	.short _02066148 - _020660FA - 2 ; case 0
	.short _0206610C - _020660FA - 2 ; case 1
	.short _0206610C - _020660FA - 2 ; case 2
	.short _0206610C - _020660FA - 2 ; case 3
	.short _0206610C - _020660FA - 2 ; case 4
	.short _0206610C - _020660FA - 2 ; case 5
	.short _0206610C - _020660FA - 2 ; case 6
	.short _0206610C - _020660FA - 2 ; case 7
	.short _0206610C - _020660FA - 2 ; case 8
_0206610C:
	add r1, sp, #4
	add r2, sp, #8
	mov r3, #1
	bl sub_0205EEF4
	cmp r0, #1
	bne _02066148
_0206611A:
	ldr r0, [sp, #4]
	cmp r4, r0
	beq _02066138
	bl sub_0205F254
	cmp r6, r0
	bne _02066138
	ldr r0, [sp, #4]
	bl sub_02064518
	cmp r5, r0
	bne _02066138
	ldr r0, [sp, #4]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_02066138:
	add r0, r7, #0
	add r1, sp, #4
	add r2, sp, #8
	mov r3, #1
	bl sub_0205EEF4
	cmp r0, #1
	beq _0206611A
_02066148:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_020660C0

	thumb_func_start sub_02066150
sub_02066150: ; 0x02066150
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	str r1, [sp]
	bl sub_0205F35C
	add r4, r0, #0
	mov r0, #0
	str r0, [sp, #8]
	add r0, r5, #0
	bl sub_0205F254
	add r7, r0, #0
	add r0, r5, #0
	bl sub_02064518
	add r6, r0, #0
	add r0, r4, #0
	add r1, sp, #4
	add r2, sp, #8
	mov r3, #1
	bl sub_0205EEF4
	cmp r0, #1
	bne _020661C2
_02066182:
	ldr r0, [sp, #4]
	cmp r5, r0
	beq _020661B2
	bl sub_0205F254
	cmp r7, r0
	bne _020661B2
	ldr r0, [sp, #4]
	bl sub_02064518
	cmp r6, r0
	bne _020661B2
	ldr r0, [sp]
	ldrb r0, [r0, #1]
	cmp r0, #0
	bne _020661AC
	ldr r1, [sp]
	ldr r2, [sp, #4]
	add r0, r5, #0
	bl sub_020661CC
_020661AC:
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_020661B2:
	add r0, r4, #0
	add r1, sp, #4
	add r2, sp, #8
	mov r3, #1
	bl sub_0205EEF4
	cmp r0, #1
	beq _02066182
_020661C2:
	ldr r1, [sp]
	mov r0, #0
	strb r0, [r1, #1]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end sub_02066150

	thumb_func_start sub_020661CC
sub_020661CC: ; 0x020661CC
	push {r3, r4, r5, lr}
	add r5, r1, #0
	mov r0, #1
	add r4, r2, #0
	strb r0, [r5, #1]
	add r0, r4, #0
	bl MapObject_GetCurrentX
	strh r0, [r5, #2]
	add r0, r4, #0
	bl MapObject_GetCurrentY
	strh r0, [r5, #4]
	mov r0, #0xff
	strh r0, [r5, #6]
	str r4, [r5, #8]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_020661CC

	thumb_func_start sub_020661F0
sub_020661F0: ; 0x020661F0
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	ldr r5, [r1, #8]
	bl MapObject_GetCurrentX
	add r6, r0, #0
	add r0, r4, #0
	bl MapObject_GetCurrentY
	add r7, r0, #0
	add r0, r5, #0
	bl MapObject_GetPrevX
	add r4, r0, #0
	add r0, r5, #0
	bl MapObject_GetPrevY
	cmp r6, r4
	bne _0206621A
	cmp r7, r0
	beq _02066236
_0206621A:
	add r0, r5, #0
	bl sub_0205F648
	cmp r0, #1
	beq _02066232
	mov r1, #0x61
	add r0, r5, #0
	lsl r1, r1, #6
	bl MapObject_GetBitsMask
	cmp r0, #0
	bne _02066236
_02066232:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02066236:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_020661F0

	thumb_func_start sub_0206623C
sub_0206623C: ; 0x0206623C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp]
	add r5, r1, #0
	bl MapObject_GetCurrentX
	add r4, r0, #0
	ldr r0, [sp]
	bl MapObject_GetCurrentY
	add r6, r0, #0
	ldr r0, [r5, #8]
	bl MapObject_GetCurrentX
	str r0, [sp, #8]
	ldr r0, [r5, #8]
	bl MapObject_GetCurrentY
	add r7, r0, #0
	ldr r0, [r5, #8]
	bl MapObject_GetPrevX
	str r0, [sp, #4]
	ldr r0, [r5, #8]
	bl MapObject_GetPrevY
	add r3, r0, #0
	ldr r0, [sp, #8]
	cmp r4, r0
	bne _02066282
	cmp r6, r7
	bne _02066282
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_02066282:
	ldr r2, [sp, #4]
	add r0, r4, #0
	add r1, r6, #0
	bl sub_02061200
	add r5, r0, #0
	bl sub_02060F0C
	add r4, r4, r0
	add r0, r5, #0
	bl sub_02060F18
	add r1, r6, r0
	ldr r0, [sp, #8]
	cmp r4, r0
	bne _020662A6
	cmp r1, r7
	beq _020662BC
_020662A6:
	add r0, r5, #0
	mov r1, #0xc
	bl sub_0206234C
	add r1, r0, #0
	ldr r0, [sp]
	bl sub_0206217C
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_020662BC:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0206623C

	thumb_func_start sub_020662C4
sub_020662C4: ; 0x020662C4
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r1, #0
	add r4, r0, #0
	mov r1, #8
	bl sub_0205F370
	strb r5, [r0, #1]
	add r0, r4, #0
	mov r1, #0
	bl sub_0205F328
	add r0, r4, #0
	bl sub_0205F63C
	mov r1, #1
	add r0, r4, #0
	lsl r1, r1, #0x14
	bl MapObject_SetBits
	ldr r5, _02066308 ; =_020FE3DC
	add r3, sp, #0
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	add r1, r2, #0
	str r0, [r3]
	add r0, r4, #0
	bl sub_0205F97C
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_02066308: .word _020FE3DC
	thumb_func_end sub_020662C4

	thumb_func_start sub_0206630C
sub_0206630C: ; 0x0206630C
	ldr r3, _02066314 ; =sub_020662C4
	mov r1, #0
	bx r3
	nop
_02066314: .word sub_020662C4
	thumb_func_end sub_0206630C

	thumb_func_start sub_02066318
sub_02066318: ; 0x02066318
	ldr r3, _02066320 ; =sub_020662C4
	mov r1, #1
	bx r3
	nop
_02066320: .word sub_020662C4
	thumb_func_end sub_02066318

	thumb_func_start sub_02066324
sub_02066324: ; 0x02066324
	ldr r3, _0206632C ; =sub_020662C4
	mov r1, #2
	bx r3
	nop
_0206632C: .word sub_020662C4
	thumb_func_end sub_02066324

	thumb_func_start sub_02066330
sub_02066330: ; 0x02066330
	ldr r3, _02066338 ; =sub_020662C4
	mov r1, #3
	bx r3
	nop
_02066338: .word sub_020662C4
	thumb_func_end sub_02066330

	thumb_func_start sub_0206633C
sub_0206633C: ; 0x0206633C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl sub_0205F394
	ldr r6, _0206635C ; =_020FE3CC
	add r4, r0, #0
_02066348:
	ldrb r2, [r4]
	add r0, r5, #0
	add r1, r4, #0
	lsl r2, r2, #2
	ldr r2, [r6, r2]
	blx r2
	cmp r0, #1
	beq _02066348
	pop {r4, r5, r6, pc}
	nop
_0206635C: .word _020FE3CC
	thumb_func_end sub_0206633C

	thumb_func_start sub_02066360
sub_02066360: ; 0x02066360
	push {r3, lr}
	bl sub_0206642C
	cmp r0, #0
	beq _0206636E
	bl ov01_021F1640
_0206636E:
	pop {r3, pc}
	thumb_func_end sub_02066360

	thumb_func_start sub_02066370
sub_02066370: ; 0x02066370
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r0, #0
	bl sub_0205F394
	add r5, r0, #0
	mov r1, #0
	strb r1, [r5]
	add r0, r4, #0
	bl sub_02066420
	ldrb r0, [r5, #2]
	cmp r0, #0
	bne _020663AC
	ldr r5, _020663B0 ; =_020FE3E8
	add r3, sp, #0
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	add r1, r2, #0
	str r0, [r3]
	add r0, r4, #0
	bl sub_0205F97C
	mov r1, #1
	add r0, r4, #0
	lsl r1, r1, #0x14
	bl MapObject_SetBits
_020663AC:
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_020663B0: .word _020FE3E8
	thumb_func_end sub_02066370

	thumb_func_start sub_020663B4
sub_020663B4: ; 0x020663B4
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldrb r1, [r4, #2]
	add r5, r0, #0
	cmp r1, #0
	bne _020663CE
	ldrb r1, [r4, #1]
	bl ov01_021FFF5C
	add r1, r0, #0
	add r0, r5, #0
	bl sub_02066420
_020663CE:
	add r0, r5, #0
	bl sub_0205F63C
	add r0, r5, #0
	bl sub_0205F660
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_020663B4

	thumb_func_start sub_020663E4
sub_020663E4: ; 0x020663E4
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldrb r1, [r4, #2]
	add r5, r0, #0
	cmp r1, #0
	bne _0206641C
	bl sub_0206642C
	cmp r0, #0
	bne _02066412
	add r0, r5, #0
	bl sub_0205F73C
	cmp r0, #1
	bne _02066412
	ldrb r1, [r4, #1]
	add r0, r5, #0
	bl ov01_021FFF5C
	add r1, r0, #0
	add r0, r5, #0
	bl sub_02066420
_02066412:
	mov r1, #1
	add r0, r5, #0
	lsl r1, r1, #0x14
	bl MapObject_SetBits
_0206641C:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_020663E4

	thumb_func_start sub_02066420
sub_02066420: ; 0x02066420
	push {r4, lr}
	add r4, r1, #0
	bl sub_0205F394
	str r4, [r0, #4]
	pop {r4, pc}
	thumb_func_end sub_02066420

	thumb_func_start sub_0206642C
sub_0206642C: ; 0x0206642C
	push {r3, lr}
	bl sub_0205F394
	ldr r0, [r0, #4]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0206642C

	thumb_func_start sub_02066438
sub_02066438: ; 0x02066438
	push {r3, lr}
	bl sub_0205F394
	mov r1, #1
	strb r1, [r0, #2]
	pop {r3, pc}
	thumb_func_end sub_02066438

	thumb_func_start sub_02066444
sub_02066444: ; 0x02066444
	push {r3, r4, r5, lr}
	sub sp, #0x30
	ldr r5, _020664CC ; =_020FE3F4
	add r3, r0, #0
	ldmia r5!, {r0, r1}
	add r4, sp, #0x20
	add r2, r4, #0
	stmia r4!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	ldr r5, _020664D0 ; =_020FE434
	add r4, sp, #0x10
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	ldr r5, _020664D4 ; =_020FE444
	add r4, sp, #0
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	mov r1, #0
_02066472:
	lsl r0, r1, #2
	ldr r0, [r2, r0]
	cmp r3, r0
	bne _02066480
	add sp, #0x30
	mov r0, #3
	pop {r3, r4, r5, pc}
_02066480:
	add r0, r1, #1
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	cmp r1, #4
	blo _02066472
	mov r2, #0
	add r1, sp, #0x10
_0206648E:
	lsl r0, r2, #2
	ldr r0, [r1, r0]
	cmp r3, r0
	bne _0206649C
	add sp, #0x30
	mov r0, #2
	pop {r3, r4, r5, pc}
_0206649C:
	add r0, r2, #1
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	cmp r2, #4
	blo _0206648E
	mov r2, #0
	add r1, sp, #0
_020664AA:
	lsl r0, r2, #2
	ldr r0, [r1, r0]
	cmp r3, r0
	bne _020664B8
	add sp, #0x30
	mov r0, #1
	pop {r3, r4, r5, pc}
_020664B8:
	add r0, r2, #1
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	cmp r2, #4
	blo _020664AA
	bl GF_AssertFail
	mov r0, #0
	add sp, #0x30
	pop {r3, r4, r5, pc}
	.balign 4, 0
_020664CC: .word _020FE3F4
_020664D0: .word _020FE434
_020664D4: .word _020FE444
	thumb_func_end sub_02066444

	thumb_func_start sub_020664D8
sub_020664D8: ; 0x020664D8
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	bl MapObject_GetFieldSysPtr
	add r4, r0, #0
	add r0, r5, #0
	bl MapObject_GetCurrentX
	str r0, [sp, #8]
	add r0, r5, #0
	bl MapObject_GetCurrentY
	add r2, r0, #0
	ldr r1, [sp, #8]
	add r0, r4, #0
	str r2, [sp, #4]
	bl sub_02054918
	add r6, r0, #0
	lsl r0, r6, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B6E8
	cmp r0, #1
	bne _02066516
	add r0, r5, #0
	mov r1, #0
	bl ov01_021FF070
	b _0206652A
_02066516:
	lsl r0, r6, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B6F4
	cmp r0, #1
	bne _0206652A
	add r0, r5, #0
	mov r1, #0
	bl ov01_021FF8F0
_0206652A:
	add r0, r5, #0
	bl ov01_022055DC
	cmp r0, #0
	beq _02066596
	add r0, r5, #0
	bl MapObject_GetFacingDirection
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	add r0, #0xfe
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #1
	bhi _02066596
	add r0, r5, #0
	add r1, sp, #8
	add r2, sp, #4
	bl ov01_02205604
	ldr r1, [sp, #8]
	ldr r2, [sp, #4]
	add r0, r4, #0
	bl sub_02054918
	add r4, r0, #0
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B6E8
	cmp r0, #1
	bne _0206657C
	mov r1, #1
	str r1, [sp]
	ldr r2, [sp, #8]
	ldr r3, [sp, #4]
	add r0, r5, #0
	bl ov01_021FF0E4
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
_0206657C:
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B6F4
	cmp r0, #1
	bne _02066596
	mov r1, #1
	str r1, [sp]
	ldr r2, [sp, #8]
	ldr r3, [sp, #4]
	add r0, r5, #0
	bl ov01_021FF964
_02066596:
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_020664D8

	; File boundary

	thumb_func_start SetScriptFlag
SetScriptFlag: ; 0x0206659C
	ldr r3, _020665A0 ; =SetFlagInArray
	bx r3
	.balign 4, 0
_020665A0: .word SetFlagInArray
	thumb_func_end SetScriptFlag

	thumb_func_start ClearScriptFlag
ClearScriptFlag: ; 0x020665A4
	ldr r3, _020665A8 ; =ClearFlagInArray
	bx r3
	.balign 4, 0
_020665A8: .word ClearFlagInArray
	thumb_func_end ClearScriptFlag

	thumb_func_start CheckScriptFlag
CheckScriptFlag: ; 0x020665AC
	ldr r3, _020665B0 ; =CheckFlagInArray
	bx r3
	.balign 4, 0
_020665B0: .word CheckFlagInArray
	thumb_func_end CheckScriptFlag

	thumb_func_start FlagAction
FlagAction: ; 0x020665B4
	push {r3, lr}
	cmp r1, #0
	beq _020665CE
	cmp r1, #1
	beq _020665C4
	cmp r1, #2
	beq _020665D8
	b _020665E2
_020665C4:
	lsl r1, r2, #0x10
	lsr r1, r1, #0x10
	bl SetScriptFlag
	b _020665E6
_020665CE:
	lsl r1, r2, #0x10
	lsr r1, r1, #0x10
	bl ClearScriptFlag
	b _020665E6
_020665D8:
	lsl r1, r2, #0x10
	lsr r1, r1, #0x10
	bl CheckScriptFlag
	pop {r3, pc}
_020665E2:
	bl GF_AssertFail
_020665E6:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end FlagAction

	thumb_func_start sub_020665EC
sub_020665EC: ; 0x020665EC
	ldr r3, _020665F4 ; =SetScriptFlag
	mov r1, #FLAG_UNK_960>>4
	lsl r1, r1, #4
	bx r3
	.balign 4, 0
_020665F4: .word SetScriptFlag
	thumb_func_end sub_020665EC

	thumb_func_start sub_020665F8
sub_020665F8: ; 0x020665F8
	ldr r3, _02066600 ; =CheckScriptFlag
	mov r1, #FLAG_UNK_960>>4
	lsl r1, r1, #4
	bx r3
	.balign 4, 0
_02066600: .word CheckScriptFlag
	thumb_func_end sub_020665F8

	thumb_func_start SetGameClearFlag
SetGameClearFlag: ; 0x02066604
	ldr r3, _0206660C ; =SetScriptFlag
	ldr r1, _02066610 ; =FLAG_GAME_CLEAR
	bx r3
	nop
_0206660C: .word SetScriptFlag
_02066610: .word FLAG_GAME_CLEAR
	thumb_func_end SetGameClearFlag

	thumb_func_start CheckGameClearFlag
CheckGameClearFlag: ; 0x02066614
	ldr r3, _0206661C ; =CheckScriptFlag
	ldr r1, _02066620 ; =FLAG_GAME_CLEAR
	bx r3
	nop
_0206661C: .word CheckScriptFlag
_02066620: .word FLAG_GAME_CLEAR
	thumb_func_end CheckGameClearFlag

	thumb_func_start ScriptState_SetHaveFollowerFlag
ScriptState_SetHaveFollowerFlag: ; 0x02066624
	ldr r3, _0206662C ; =SetScriptFlag
	ldr r1, _02066630 ; =FLAG_HAVE_FOLLOWER
	bx r3
	nop
_0206662C: .word SetScriptFlag
_02066630: .word FLAG_HAVE_FOLLOWER
	thumb_func_end ScriptState_SetHaveFollowerFlag

	thumb_func_start ScriptState_ClearHaveFollowerFlag
ScriptState_ClearHaveFollowerFlag: ; 0x02066634
	ldr r3, _0206663C ; =ClearScriptFlag
	ldr r1, _02066640 ; =FLAG_HAVE_FOLLOWER
	bx r3
	nop
_0206663C: .word ClearScriptFlag
_02066640: .word FLAG_HAVE_FOLLOWER
	thumb_func_end ScriptState_ClearHaveFollowerFlag

	thumb_func_start ScriptState_CheckHaveFollower
ScriptState_CheckHaveFollower: ; 0x02066644
	ldr r3, _0206664C ; =CheckScriptFlag
	ldr r1, _02066650 ; =FLAG_HAVE_FOLLOWER
	bx r3
	nop
_0206664C: .word CheckScriptFlag
_02066650: .word FLAG_HAVE_FOLLOWER
	thumb_func_end ScriptState_CheckHaveFollower

	thumb_func_start sub_02066654
sub_02066654: ; 0x02066654
	ldr r3, _0206665C ; =SetScriptFlag
	ldr r1, _02066660 ; =FLAG_UNK_99C
	bx r3
	nop
_0206665C: .word SetScriptFlag
_02066660: .word FLAG_UNK_99C
	thumb_func_end sub_02066654

	thumb_func_start sub_02066664
sub_02066664: ; 0x02066664
	ldr r3, _0206666C ; =SetScriptFlag
	ldr r1, _02066670 ; =FLAG_UNK_965
	bx r3
	nop
_0206666C: .word SetScriptFlag
_02066670: .word FLAG_UNK_965
	thumb_func_end sub_02066664

	thumb_func_start sub_02066674
sub_02066674: ; 0x02066674
	ldr r3, _0206667C ; =ClearScriptFlag
	ldr r1, _02066680 ; =FLAG_UNK_965
	bx r3
	nop
_0206667C: .word ClearScriptFlag
_02066680: .word FLAG_UNK_965
	thumb_func_end sub_02066674

	thumb_func_start sub_02066684
sub_02066684: ; 0x02066684
	ldr r3, _0206668C ; =CheckScriptFlag
	ldr r1, _02066690 ; =FLAG_UNK_965
	bx r3
	nop
_0206668C: .word CheckScriptFlag
_02066690: .word FLAG_UNK_965
	thumb_func_end sub_02066684

	thumb_func_start sub_02066694
sub_02066694: ; 0x02066694
	ldr r3, _0206669C ; =SetScriptFlag
	ldr r1, _020666A0 ; =FLAG_UNK_969
	bx r3
	nop
_0206669C: .word SetScriptFlag
_020666A0: .word FLAG_UNK_969
	thumb_func_end sub_02066694

	thumb_func_start sub_020666A4
sub_020666A4: ; 0x020666A4
	ldr r3, _020666AC ; =ClearScriptFlag
	ldr r1, _020666B0 ; =FLAG_UNK_969
	bx r3
	nop
_020666AC: .word ClearScriptFlag
_020666B0: .word FLAG_UNK_969
	thumb_func_end sub_020666A4

	thumb_func_start sub_020666B4
sub_020666B4: ; 0x020666B4
	ldr r3, _020666BC ; =CheckScriptFlag
	ldr r1, _020666C0 ; =FLAG_UNK_969
	bx r3
	nop
_020666BC: .word CheckScriptFlag
_020666C0: .word FLAG_UNK_969
	thumb_func_end sub_020666B4

	thumb_func_start EventFlagCheck_RematchGroup
EventFlagCheck_RematchGroup: ; 0x020666C4
	ldr r2, _020666D0 ; =FLAG_UNK_97B
	ldr r3, _020666D4 ; =CheckScriptFlag
	add r1, r1, r2
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bx r3
	.balign 4, 0
_020666D0: .word FLAG_UNK_97B
_020666D4: .word CheckScriptFlag
	thumb_func_end EventFlagCheck_RematchGroup

	thumb_func_start ScriptState_SetAlphPuzzleFlag
ScriptState_SetAlphPuzzleFlag: ; 0x020666D8
	push {r3, lr}
	cmp r1, #3
	bhi _02066710
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_020666EA: ; jump table
	.short _020666F2 - _020666EA - 2 ; case 0
	.short _020666FA - _020666EA - 2 ; case 1
	.short _02066702 - _020666EA - 2 ; case 2
	.short _0206670A - _020666EA - 2 ; case 3
_020666F2:
	ldr r1, _02066714 ; =FLAG_SYS_ALPH_PUZZLE_KABUTO
	bl SetScriptFlag
	pop {r3, pc}
_020666FA:
	ldr r1, _02066718 ; =FLAG_SYS_ALPH_PUZZLE_AERODACTYL
	bl SetScriptFlag
	pop {r3, pc}
_02066702:
	ldr r1, _0206671C ; =FLAG_SYS_ALPH_PUZZLE_OMANYTE
	bl SetScriptFlag
	pop {r3, pc}
_0206670A:
	ldr r1, _02066720 ; =FLAG_SYS_ALPH_PUZZLE_HO_OH
	bl SetScriptFlag
_02066710:
	pop {r3, pc}
	nop
_02066714: .word FLAG_SYS_ALPH_PUZZLE_KABUTO
_02066718: .word FLAG_SYS_ALPH_PUZZLE_AERODACTYL
_0206671C: .word FLAG_SYS_ALPH_PUZZLE_OMANYTE
_02066720: .word FLAG_SYS_ALPH_PUZZLE_HO_OH
	thumb_func_end ScriptState_SetAlphPuzzleFlag

	thumb_func_start ScriptState_CheckAlphPuzzleFlag
ScriptState_CheckAlphPuzzleFlag: ; 0x02066724
	push {r3, lr}
	mov r2, #0
	cmp r1, #3
	bhi _02066766
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02066738: ; jump table
	.short _02066740 - _02066738 - 2 ; case 0
	.short _0206674A - _02066738 - 2 ; case 1
	.short _02066754 - _02066738 - 2 ; case 2
	.short _0206675E - _02066738 - 2 ; case 3
_02066740:
	ldr r1, _0206676C ; =FLAG_SYS_ALPH_PUZZLE_KABUTO
	bl CheckScriptFlag
	add r2, r0, #0
	b _02066766
_0206674A:
	ldr r1, _02066770 ; =FLAG_SYS_ALPH_PUZZLE_AERODACTYL
	bl CheckScriptFlag
	add r2, r0, #0
	b _02066766
_02066754:
	ldr r1, _02066774 ; =FLAG_SYS_ALPH_PUZZLE_OMANYTE
	bl CheckScriptFlag
	add r2, r0, #0
	b _02066766
_0206675E:
	ldr r1, _02066778 ; =FLAG_SYS_ALPH_PUZZLE_HO_OH
	bl CheckScriptFlag
	add r2, r0, #0
_02066766:
	add r0, r2, #0
	pop {r3, pc}
	nop
_0206676C: .word FLAG_SYS_ALPH_PUZZLE_KABUTO
_02066770: .word FLAG_SYS_ALPH_PUZZLE_AERODACTYL
_02066774: .word FLAG_SYS_ALPH_PUZZLE_OMANYTE
_02066778: .word FLAG_SYS_ALPH_PUZZLE_HO_OH
	thumb_func_end ScriptState_CheckAlphPuzzleFlag

	thumb_func_start sub_0206677C
sub_0206677C: ; 0x0206677C
	push {r3, lr}
	cmp r1, #0
	ldr r1, _02066790 ; =FLAG_UNK_986
	beq _0206678A
	bl SetScriptFlag
	pop {r3, pc}
_0206678A:
	bl ClearScriptFlag
	pop {r3, pc}
	.balign 4, 0
_02066790: .word FLAG_UNK_986
	thumb_func_end sub_0206677C

	thumb_func_start sub_02066794
sub_02066794: ; 0x02066794
	ldr r3, _0206679C ; =CheckScriptFlag
	ldr r1, _020667A0 ; =FLAG_UNK_986
	bx r3
	nop
_0206679C: .word CheckScriptFlag
_020667A0: .word FLAG_UNK_986
	thumb_func_end sub_02066794

	thumb_func_start GetOverriddenMapMusic
GetOverriddenMapMusic: ; 0x020667A4
	push {r3, r4, r5, r6, r7, lr}
	ldr r5, _020667D8 ; =_020FE454
	add r7, r0, #0
	add r6, r1, #0
	mov r4, #0
_020667AE:
	ldrh r0, [r5]
	cmp r6, r0
	bne _020667CC
	ldrh r1, [r5, #2]
	add r0, r7, #0
	bl CheckScriptFlag
	cmp r0, #0
	beq _020667CC
	mov r0, #6
	add r1, r4, #0
	mul r1, r0
	ldr r0, _020667DC ; =_020FE454 + 4
	ldrh r0, [r0, r1]
	pop {r3, r4, r5, r6, r7, pc}
_020667CC:
	add r4, r4, #1
	add r5, r5, #6
	cmp r4, #0xd
	blo _020667AE
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_020667D8: .word _020FE454
_020667DC: .word _020FE454 + 4
	thumb_func_end GetOverriddenMapMusic

	thumb_func_start sub_020667E0
sub_020667E0: ; 0x020667E0
	ldr r3, _020667E8 ; =SetScriptFlag
	ldr r1, _020667EC ; =FLAG_UNK_966
	bx r3
	nop
_020667E8: .word SetScriptFlag
_020667EC: .word FLAG_UNK_966
	thumb_func_end sub_020667E0

	thumb_func_start sub_020667F0
sub_020667F0: ; 0x020667F0
	ldr r3, _020667F8 ; =ClearScriptFlag
	ldr r1, _020667FC ; =FLAG_UNK_966
	bx r3
	nop
_020667F8: .word ClearScriptFlag
_020667FC: .word FLAG_UNK_966
	thumb_func_end sub_020667F0

	thumb_func_start sub_02066800
sub_02066800: ; 0x02066800
	ldr r3, _02066808 ; =CheckScriptFlag
	ldr r1, _0206680C ; =FLAG_UNK_966
	bx r3
	nop
_02066808: .word CheckScriptFlag
_0206680C: .word FLAG_UNK_966
	thumb_func_end sub_02066800

	thumb_func_start sub_02066810
sub_02066810: ; 0x02066810
	ldr r3, _02066818 ; =CheckScriptFlag
	ldr r1, _0206681C ; =FLAG_SYS_MET_BILL
	bx r3
	nop
_02066818: .word CheckScriptFlag
_0206681C: .word FLAG_SYS_MET_BILL
	thumb_func_end sub_02066810

	thumb_func_start sub_02066820
sub_02066820: ; 0x02066820
	ldr r3, _02066828 ; =SetScriptFlag
	ldr r1, _0206682C ; =FLAG_UNK_975
	bx r3
	nop
_02066828: .word SetScriptFlag
_0206682C: .word FLAG_UNK_975
	thumb_func_end sub_02066820

	thumb_func_start sub_02066830
sub_02066830: ; 0x02066830
	ldr r3, _02066838 ; =ClearScriptFlag
	ldr r1, _0206683C ; =FLAG_UNK_975
	bx r3
	nop
_02066838: .word ClearScriptFlag
_0206683C: .word FLAG_UNK_975
	thumb_func_end sub_02066830

	thumb_func_start ScriptState_SetSafariSysFlag
ScriptState_SetSafariSysFlag: ; 0x02066840
	ldr r3, _02066848 ; =SetScriptFlag
	ldr r1, _0206684C ; =FLAG_SYS_SAFARI
	bx r3
	nop
_02066848: .word SetScriptFlag
_0206684C: .word FLAG_SYS_SAFARI
	thumb_func_end ScriptState_SetSafariSysFlag

	thumb_func_start ScriptState_ClearSafariSysFlag
ScriptState_ClearSafariSysFlag: ; 0x02066850
	ldr r3, _02066858 ; =ClearScriptFlag
	ldr r1, _0206685C ; =FLAG_SYS_SAFARI
	bx r3
	nop
_02066858: .word ClearScriptFlag
_0206685C: .word FLAG_SYS_SAFARI
	thumb_func_end ScriptState_ClearSafariSysFlag

	thumb_func_start ScriptState_CheckSafariSysFlag
ScriptState_CheckSafariSysFlag: ; 0x02066860
	ldr r3, _02066868 ; =CheckScriptFlag
	ldr r1, _0206686C ; =FLAG_SYS_SAFARI
	bx r3
	nop
_02066868: .word CheckScriptFlag
_0206686C: .word FLAG_SYS_SAFARI
	thumb_func_end ScriptState_CheckSafariSysFlag

	thumb_func_start sub_02066870
sub_02066870: ; 0x02066870
	ldr r3, _02066878 ; =CheckScriptFlag
	ldr r1, _0206687C ; =FLAG_UNK_996
	bx r3
	nop
_02066878: .word CheckScriptFlag
_0206687C: .word FLAG_UNK_996
	thumb_func_end sub_02066870

	thumb_func_start ScriptState_SetPalParkSysFlag
ScriptState_SetPalParkSysFlag: ; 0x02066880
	ldr r3, _02066888 ; =SetScriptFlag
	ldr r1, _0206688C ; =FLAG_SYS_PAL_PARK
	bx r3
	nop
_02066888: .word SetScriptFlag
_0206688C: .word FLAG_SYS_PAL_PARK
	thumb_func_end ScriptState_SetPalParkSysFlag

	thumb_func_start ScriptState_ClearPalParkSysFlag
ScriptState_ClearPalParkSysFlag: ; 0x02066890
	ldr r3, _02066898 ; =ClearScriptFlag
	ldr r1, _0206689C ; =FLAG_SYS_PAL_PARK
	bx r3
	nop
_02066898: .word ClearScriptFlag
_0206689C: .word FLAG_SYS_PAL_PARK
	thumb_func_end ScriptState_ClearPalParkSysFlag

	thumb_func_start ScriptState_CheckPalParkSysFlag
ScriptState_CheckPalParkSysFlag: ; 0x020668A0
	ldr r3, _020668A8 ; =CheckScriptFlag
	ldr r1, _020668AC ; =FLAG_SYS_PAL_PARK
	bx r3
	nop
_020668A8: .word CheckScriptFlag
_020668AC: .word FLAG_SYS_PAL_PARK
	thumb_func_end ScriptState_CheckPalParkSysFlag

	thumb_func_start sub_020668B0
sub_020668B0: ; 0x020668B0
	ldr r3, _020668B8 ; =ClearScriptFlag
	ldr r1, _020668BC ; =FLAG_UNK_972
	bx r3
	nop
_020668B8: .word ClearScriptFlag
_020668BC: .word FLAG_UNK_972
	thumb_func_end sub_020668B0

	thumb_func_start StrengthFlagAction
StrengthFlagAction: ; 0x020668C0
	ldr r3, _020668C8 ; =FlagAction
	ldr r2, _020668CC ; =FLAG_STRENGTH_ACTIVE
	bx r3
	nop
_020668C8: .word FlagAction
_020668CC: .word FLAG_STRENGTH_ACTIVE
	thumb_func_end StrengthFlagAction

	thumb_func_start sub_020668D0
sub_020668D0: ; 0x020668D0
	ldr r3, _020668D8 ; =SetScriptFlag
	ldr r1, _020668DC ; =FLAG_UNK_973
	bx r3
	nop
_020668D8: .word SetScriptFlag
_020668DC: .word FLAG_UNK_973
	thumb_func_end sub_020668D0

	thumb_func_start sub_020668E0
sub_020668E0: ; 0x020668E0
	ldr r3, _020668E8 ; =ClearScriptFlag
	ldr r1, _020668EC ; =FLAG_UNK_973
	bx r3
	nop
_020668E8: .word ClearScriptFlag
_020668EC: .word FLAG_UNK_973
	thumb_func_end sub_020668E0

	thumb_func_start sub_020668F0
sub_020668F0: ; 0x020668F0
	ldr r3, _020668F8 ; =CheckScriptFlag
	ldr r1, _020668FC ; =FLAG_UNK_973
	bx r3
	nop
_020668F8: .word CheckScriptFlag
_020668FC: .word FLAG_UNK_973
	thumb_func_end sub_020668F0

	thumb_func_start sub_02066900
sub_02066900: ; 0x02066900
	ldr r3, _02066908 ; =SetScriptFlag
	ldr r1, _0206690C ; =FLAG_UNK_974
	bx r3
	nop
_02066908: .word SetScriptFlag
_0206690C: .word FLAG_UNK_974
	thumb_func_end sub_02066900

	thumb_func_start sub_02066910
sub_02066910: ; 0x02066910
	ldr r3, _02066918 ; =ClearScriptFlag
	ldr r1, _0206691C ; =FLAG_UNK_974
	bx r3
	nop
_02066918: .word ClearScriptFlag
_0206691C: .word FLAG_UNK_974
	thumb_func_end sub_02066910

	thumb_func_start sub_02066920
sub_02066920: ; 0x02066920
	ldr r3, _02066928 ; =CheckScriptFlag
	ldr r1, _0206692C ; =FLAG_UNK_974
	bx r3
	nop
_02066928: .word CheckScriptFlag
_0206692C: .word FLAG_UNK_974
	thumb_func_end sub_02066920

	thumb_func_start sub_02066930
sub_02066930: ; 0x02066930
	push {r4, r5, r6, lr}
	add r4, r2, #0
	add r5, r0, #0
	add r6, r1, #0
	cmp r4, #0x26
	blo _02066940
	bl GF_AssertFail
_02066940:
	mov r2, #FLAG_UNK_9B0>>4
	lsl r2, r2, #4
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, r2
	bl FlagAction
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02066930

	thumb_func_start sub_02066950
sub_02066950: ; 0x02066950
	ldr r3, _02066958 ; =SetScriptFlag
	mov r1, #FLAG_UNK_970>>4
	lsl r1, r1, #4
	bx r3
	.balign 4, 0
_02066958: .word SetScriptFlag
	thumb_func_end sub_02066950

	thumb_func_start CheckGotStarter
CheckGotStarter: ; 0x0206695C
	ldr r3, _02066964 ; =CheckScriptFlag
	mov r1, #FLAG_GOT_STARTER
	bx r3
	nop
_02066964: .word CheckScriptFlag
	thumb_func_end CheckGotStarter

	thumb_func_start CheckGotPokegear
CheckGotPokegear: ; 0x02066968
	ldr r3, _02066970 ; =CheckScriptFlag
	mov r1, #FLAG_GOT_POKEGEAR
	bx r3
	nop
_02066970: .word CheckScriptFlag
	thumb_func_end CheckGotPokegear

	thumb_func_start CheckGotPokedex
CheckGotPokedex: ; 0x02066974
	ldr r3, _0206697C ; =CheckScriptFlag
	mov r1, #FLAG_GOT_POKEDEX
	bx r3
	nop
_0206697C: .word CheckScriptFlag
	thumb_func_end CheckGotPokedex

	thumb_func_start CheckGotMenuIconI
CheckGotMenuIconI: ; 0x02066980
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #4
	blt _0206698E
	bl GF_AssertFail
_0206698E:
	ldr r1, _020669A0 ; =FLAG_GOT_BAG
	add r0, r5, #0
	add r1, r4, r1
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl CheckScriptFlag
	pop {r3, r4, r5, pc}
	nop
_020669A0: .word FLAG_GOT_BAG
	thumb_func_end CheckGotMenuIconI

	thumb_func_start sub_020669A4
sub_020669A4: ; 0x020669A4
	ldr r3, _020669AC ; =CheckScriptFlag
	ldr r1, _020669B0 ; =FLAG_UNK_96A
	bx r3
	nop
_020669AC: .word CheckScriptFlag
_020669B0: .word FLAG_UNK_96A
	thumb_func_end sub_020669A4

	thumb_func_start sub_020669B4
sub_020669B4: ; 0x020669B4
	push {r3, lr}
	cmp r1, #2
	bls _020669BE
	mov r0, #0
	pop {r3, pc}
_020669BE:
	ldr r2, _020669CC ; =FLAG_UNK_96B
	add r1, r1, r2
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl CheckScriptFlag
	pop {r3, pc}
	.balign 4, 0
_020669CC: .word FLAG_UNK_96B
	thumb_func_end sub_020669B4

	thumb_func_start sub_020669D0
sub_020669D0: ; 0x020669D0
	ldr r3, _020669D8 ; =CheckScriptFlag
	ldr r1, _020669DC ; =FLAG_UNK_981
	bx r3
	nop
_020669D8: .word CheckScriptFlag
_020669DC: .word FLAG_UNK_981
	thumb_func_end sub_020669D0

	thumb_func_start sub_020669E0
sub_020669E0: ; 0x020669E0
	ldr r3, _020669E8 ; =CheckScriptFlag
	ldr r1, _020669EC ; =FLAG_UNK_9A6
	bx r3
	nop
_020669E8: .word CheckScriptFlag
_020669EC: .word FLAG_UNK_9A6
	thumb_func_end sub_020669E0

	thumb_func_start sub_020669F0
sub_020669F0: ; 0x020669F0
	ldr r3, _020669F8 ; =CheckScriptFlag
	ldr r1, _020669FC ; =FLAG_UNK_982
	bx r3
	nop
_020669F8: .word CheckScriptFlag
_020669FC: .word FLAG_UNK_982
	thumb_func_end sub_020669F0

	thumb_func_start sub_02066A00
sub_02066A00: ; 0x02066A00
	ldr r3, _02066A08 ; =CheckScriptFlag
	mov r1, #FLAG_UNK_09A
	bx r3
	nop
_02066A08: .word CheckScriptFlag
	thumb_func_end sub_02066A00

	thumb_func_start sub_02066A0C
sub_02066A0C: ; 0x02066A0C
	ldr r3, _02066A14 ; =CheckScriptFlag
	ldr r1, _02066A18 ; =FLAG_UNK_997
	bx r3
	nop
_02066A14: .word CheckScriptFlag
_02066A18: .word FLAG_UNK_997
	thumb_func_end sub_02066A0C

	thumb_func_start sub_02066A1C
sub_02066A1C: ; 0x02066A1C
	ldr r3, _02066A24 ; =SetScriptFlag
	ldr r1, _02066A28 ; =FLAG_UNK_99A
	bx r3
	nop
_02066A24: .word SetScriptFlag
_02066A28: .word FLAG_UNK_99A
	thumb_func_end sub_02066A1C

	thumb_func_start sub_02066A2C
sub_02066A2C: ; 0x02066A2C
	ldr r3, _02066A34 ; =ClearScriptFlag
	ldr r1, _02066A38 ; =FLAG_UNK_99A
	bx r3
	nop
_02066A34: .word ClearScriptFlag
_02066A38: .word FLAG_UNK_99A
	thumb_func_end sub_02066A2C

	thumb_func_start sub_02066A3C
sub_02066A3C: ; 0x02066A3C
	ldr r3, _02066A44 ; =CheckScriptFlag
	ldr r1, _02066A48 ; =FLAG_UNK_99A
	bx r3
	nop
_02066A44: .word CheckScriptFlag
_02066A48: .word FLAG_UNK_99A
	thumb_func_end sub_02066A3C

	thumb_func_start sub_02066A4C
sub_02066A4C: ; 0x02066A4C
	ldr r3, _02066A54 ; =CheckScriptFlag
	mov r1, #FLAG_SNORLAX_MEET
	bx r3
	nop
_02066A54: .word CheckScriptFlag
	thumb_func_end sub_02066A4C

	thumb_func_start sub_02066A58
sub_02066A58: ; 0x02066A58
	ldr r3, _02066A60 ; =CheckScriptFlag
	mov r1, #FLAG_RED_GYARADOS_MEET
	bx r3
	nop
_02066A60: .word CheckScriptFlag
	thumb_func_end sub_02066A58

	thumb_func_start sub_02066A64
sub_02066A64: ; 0x02066A64
	push {r3, lr}
	cmp r1, #0
	ldr r1, _02066A78 ; =FLAG_UNK_99D
	beq _02066A72
	bl SetScriptFlag
	pop {r3, pc}
_02066A72:
	bl ClearScriptFlag
	pop {r3, pc}
	.balign 4, 0
_02066A78: .word FLAG_UNK_99D
	thumb_func_end sub_02066A64

	thumb_func_start SetScriptVar
SetScriptVar: ; 0x02066A7C
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r2, #0
	bl GetVarAddr
	mov r1, #1
	lsl r1, r1, #0xe
	cmp r5, r1
	blo _02066A94
	lsl r1, r1, #1
	cmp r5, r1
	bls _02066A9C
_02066A94:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, r4, r5, pc}
_02066A9C:
	cmp r0, #0
	bne _02066AA4
	mov r0, #0
	pop {r3, r4, r5, pc}
_02066AA4:
	strh r4, [r0]
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end SetScriptVar

	thumb_func_start GetScriptVar
GetScriptVar: ; 0x02066AAC
	push {r3, lr}
	bl GetVarAddr
	cmp r0, #0
	bne _02066ABA
	mov r0, #0
	pop {r3, pc}
_02066ABA:
	ldrh r0, [r0]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end GetScriptVar

	thumb_func_start ScriptState_SetFollowerTrainerNum
ScriptState_SetFollowerTrainerNum: ; 0x02066AC0
	ldr r3, _02066AC8 ; =SetScriptVar
	add r2, r1, #0
	ldr r1, _02066ACC ; =VAR_FOLLOWER_TRAINER_NUM
	bx r3
	.balign 4, 0
_02066AC8: .word SetScriptVar
_02066ACC: .word VAR_FOLLOWER_TRAINER_NUM
	thumb_func_end ScriptState_SetFollowerTrainerNum

	thumb_func_start ScriptState_GetFollowerTrainerNum
ScriptState_GetFollowerTrainerNum: ; 0x02066AD0
	ldr r3, _02066AD8 ; =GetScriptVar
	ldr r1, _02066ADC ; =VAR_FOLLOWER_TRAINER_NUM
	bx r3
	nop
_02066AD8: .word GetScriptVar
_02066ADC: .word VAR_FOLLOWER_TRAINER_NUM
	thumb_func_end ScriptState_GetFollowerTrainerNum

	thumb_func_start SetStarterToScriptState
SetStarterToScriptState: ; 0x02066AE0
	ldr r3, _02066AE8 ; =SetScriptVar
	add r2, r1, #0
	ldr r1, _02066AEC ; =VAR_PLAYER_STARTER
	bx r3
	.balign 4, 0
_02066AE8: .word SetScriptVar
_02066AEC: .word VAR_PLAYER_STARTER
	thumb_func_end SetStarterToScriptState

	thumb_func_start GetStarterFromScriptState
GetStarterFromScriptState: ; 0x02066AF0
	ldr r3, _02066AF8 ; =GetScriptVar
	ldr r1, _02066AFC ; =VAR_PLAYER_STARTER
	bx r3
	nop
_02066AF8: .word GetScriptVar
_02066AFC: .word VAR_PLAYER_STARTER
	thumb_func_end GetStarterFromScriptState

	thumb_func_start DPPtLeftover_GetRivalSpecies
DPPtLeftover_GetRivalSpecies: ; 0x02066B00
	; This will always return Turtwig
	push {r3, lr}
	ldr r1, _02066B20 ; =VAR_PLAYER_STARTER
	bl GetScriptVar
	ldr r2, _02066B24 ; =SPECIES_TURTWIG
	cmp r0, r2
	bne _02066B12
	add r2, r2, #3 ; SPECIES_CHIMCHAR
	b _02066B1A
_02066B12:
	add r1, r2, #3 ; SPECIES_CHIMCHAR
	cmp r0, r1
	bne _02066B1A
	add r2, r2, #6 ; SPECIES_PIPLUP
_02066B1A:
	add r0, r2, #0
	pop {r3, pc}
	nop
_02066B20: .word VAR_PLAYER_STARTER
_02066B24: .word SPECIES_TURTWIG
	thumb_func_end DPPtLeftover_GetRivalSpecies

	thumb_func_start DPPtLeftover_GetFriendStarterSpecies
DPPtLeftover_GetFriendStarterSpecies: ; 0x02066B28
	; This will always return Chimchar
	push {r3, lr}
	ldr r1, _02066B48 ; =VAR_PLAYER_STARTER
	bl GetScriptVar
	ldr r2, _02066B4C ; =SPECIES_TURTWIG
	cmp r0, r2
	bne _02066B3A
	add r2, r2, #6 ; SPECIES_PIPLUP
	b _02066B42
_02066B3A:
	add r1, r2, #3 ; SPECIES_CHIMCHAR
	cmp r0, r1
	beq _02066B42
	add r2, r2, #3 ; SPECIES_CHIMCHAR
_02066B42:
	add r0, r2, #0
	pop {r3, pc}
	nop
_02066B48: .word VAR_PLAYER_STARTER
_02066B4C: .word SPECIES_TURTWIG
	thumb_func_end DPPtLeftover_GetFriendStarterSpecies

	thumb_func_start ScriptState_GetFishingCompetitionLengthRecord
ScriptState_GetFishingCompetitionLengthRecord: ; 0x02066B50
	ldr r3, _02066B58 ; =GetScriptVar
	ldr r1, _02066B5C ; =VAR_MAGIKARP_SIZE_RECORD
	bx r3
	nop
_02066B58: .word GetScriptVar
_02066B5C: .word VAR_MAGIKARP_SIZE_RECORD
	thumb_func_end ScriptState_GetFishingCompetitionLengthRecord

	thumb_func_start ScriptState_SetFishingCompetitionLengthRecord
ScriptState_SetFishingCompetitionLengthRecord: ; 0x02066B60
	ldr r3, _02066B68 ; =SetScriptVar
	add r2, r1, #0
	ldr r1, _02066B6C ; =VAR_MAGIKARP_SIZE_RECORD
	bx r3
	.balign 4, 0
_02066B68: .word SetScriptVar
_02066B6C: .word VAR_MAGIKARP_SIZE_RECORD
	thumb_func_end ScriptState_SetFishingCompetitionLengthRecord

	thumb_func_start sub_02066B70
sub_02066B70: ; 0x02066B70
	ldr r3, _02066B78 ; =GetScriptVar
	ldr r1, _02066B7C ; =VAR_UNK_403E
	bx r3
	nop
_02066B78: .word GetScriptVar
_02066B7C: .word VAR_UNK_403E
	thumb_func_end sub_02066B70

	thumb_func_start sub_02066B80
sub_02066B80: ; 0x02066B80
	push {r4, lr}
	add r4, r0, #0
	bmi _02066B8A
	cmp r4, #2
	blo _02066B8E
_02066B8A:
	bl GF_AssertFail
_02066B8E:
	ldr r0, _02066B98 ; =_020FE4A4
	lsl r1, r4, #1
	ldrh r0, [r0, r1]
	pop {r4, pc}
	nop
_02066B98: .word _020FE4A4
	thumb_func_end sub_02066B80

	thumb_func_start sub_02066B9C
sub_02066B9C: ; 0x02066B9C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	bl sub_02066B80
	ldr r1, _02066BBC ; =VAR_UNK_4043
	add r2, r0, #0
	add r1, r4, r1
	lsl r1, r1, #0x10
	add r0, r5, #0
	lsr r1, r1, #0x10
	bl SetScriptVar
	pop {r3, r4, r5, pc}
	nop
_02066BBC: .word VAR_UNK_4043
	thumb_func_end sub_02066B9C

	thumb_func_start sub_02066BC0
sub_02066BC0: ; 0x02066BC0
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldr r1, _02066BE4 ; =VAR_UNK_4043
	add r1, r4, r1
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl GetScriptVar
	add r5, r0, #0
	add r0, r4, #0
	bl sub_02066B80
	cmp r5, r0
	bne _02066BE0
	mov r0, #1
	pop {r3, r4, r5, pc}
_02066BE0:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02066BE4: .word VAR_UNK_4043
	thumb_func_end sub_02066BC0

	thumb_func_start sub_02066BE8
sub_02066BE8: ; 0x02066BE8
	push {r3, lr}
	cmp r1, #4
	bhs _02066BFA
	ldr r3, _02066BFC ; =VAR_UNK_4045
	add r1, r1, r3
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl SetScriptVar
_02066BFA:
	pop {r3, pc}
	.balign 4, 0
_02066BFC: .word VAR_UNK_4045
	thumb_func_end sub_02066BE8

	thumb_func_start sub_02066C00
sub_02066C00: ; 0x02066C00
	push {r4, lr}
	add r4, r0, #0
	bmi _02066C0A
	cmp r4, #4
	blt _02066C0E
_02066C0A:
	bl GF_AssertFail
_02066C0E:
	ldr r0, _02066C18 ; =_020FE4A8
	lsl r1, r4, #1
	ldrh r0, [r0, r1]
	pop {r4, pc}
	nop
_02066C18: .word _020FE4A8
	thumb_func_end sub_02066C00

	thumb_func_start sub_02066C1C
sub_02066C1C: ; 0x02066C1C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bmi _02066C28
	cmp r4, #4
	blt _02066C2C
_02066C28:
	bl GF_AssertFail
_02066C2C:
	add r0, r4, #0
	bl sub_02066C00
	add r2, r0, #0
	ldr r1, _02066C48 ; =VAR_UNK_4036
	lsl r2, r2, #0x10
	add r1, r4, r1
	lsl r1, r1, #0x10
	add r0, r5, #0
	lsr r1, r1, #0x10
	lsr r2, r2, #0x10
	bl SetScriptVar
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02066C48: .word VAR_UNK_4036
	thumb_func_end sub_02066C1C

	thumb_func_start sub_02066C4C
sub_02066C4C: ; 0x02066C4C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bmi _02066C58
	cmp r4, #4
	blt _02066C5C
_02066C58:
	bl GF_AssertFail
_02066C5C:
	ldr r1, _02066C70 ; =VAR_UNK_4036
	add r0, r5, #0
	add r1, r4, r1
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	mov r2, #0
	bl SetScriptVar
	pop {r3, r4, r5, pc}
	nop
_02066C70: .word VAR_UNK_4036
	thumb_func_end sub_02066C4C

	thumb_func_start sub_02066C74
sub_02066C74: ; 0x02066C74
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bmi _02066C80
	cmp r4, #4
	blt _02066C84
_02066C80:
	bl GF_AssertFail
_02066C84:
	ldr r1, _02066CA8 ; =VAR_UNK_4036
	add r0, r5, #0
	add r1, r4, r1
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl GetScriptVar
	add r5, r0, #0
	add r0, r4, #0
	bl sub_02066C00
	cmp r5, r0
	bne _02066CA2
	mov r0, #1
	pop {r3, r4, r5, pc}
_02066CA2:
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_02066CA8: .word VAR_UNK_4036
	thumb_func_end sub_02066C74

	thumb_func_start sub_02066CAC
sub_02066CAC: ; 0x02066CAC
	push {r3, r4, r5, lr}
	add r4, r1, #0
	lsl r2, r4, #0x10
	ldr r1, _02066CCC ; =VAR_LOTO_NUMBER_LO
	lsr r2, r2, #0x10
	add r5, r0, #0
	bl SetScriptVar
	lsr r2, r4, #0x10
	lsl r2, r2, #0x10
	.ifdef BUGFIX_LOTO_NUMBER_HI
	ldr r1, _pool_VAR_LOTO_NUMBER_HI ; =VAR_LOTO_NUMBER_HI
	.else
	ldr r1, _02066CCC ; =VAR_LOTO_NUMBER_LO ; bug: supposed to be VAR_LOTO_NUMBER_HI
	.endif
	add r0, r5, #0
	lsr r2, r2, #0x10
	bl SetScriptVar
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02066CCC: .word VAR_LOTO_NUMBER_LO
	.ifdef BUGFIX_LOTO_NUMBER_HI
_pool_VAR_LOTO_NUMBER_HI: .word VAR_LOTO_NUMBER_HI
	.endif
	thumb_func_end sub_02066CAC

	thumb_func_start ScriptState_GetLotoId
ScriptState_GetLotoId: ; 0x02066CD0
	push {r3, r4, r5, lr}
	ldr r1, _02066CEC ; =VAR_LOTO_NUMBER_LO
	add r5, r0, #0
	bl GetScriptVar
	add r4, r0, #0
	ldr r1, _02066CF0 ; =VAR_LOTO_NUMBER_HI
	add r0, r5, #0
	bl GetScriptVar
	lsl r0, r0, #0x10
	orr r0, r4
	pop {r3, r4, r5, pc}
	nop
_02066CEC: .word VAR_LOTO_NUMBER_LO
_02066CF0: .word VAR_LOTO_NUMBER_HI
	thumb_func_end ScriptState_GetLotoId

	thumb_func_start ScriptState_RollLotoId
ScriptState_RollLotoId: ; 0x02066CF4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl LCRandom
	add r4, r0, #0
	bl LCRandom
	add r1, r0, #0
	lsl r1, r1, #0x10
	add r0, r5, #0
	orr r1, r4
	bl sub_02066CAC
	pop {r3, r4, r5, pc}
	thumb_func_end ScriptState_RollLotoId

	thumb_func_start Save_LCRNGAdvanceLotoID
Save_LCRNGAdvanceLotoID: ; 0x02066D10
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl SavArray_Flags_get
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0202C854
	bl sub_0202C7DC
	add r2, r0, #0
	ldr r1, _02066D38 ; =0x41C64E6D
	add r0, r4, #0
	mul r2, r1
	ldr r1, _02066D3C ; =0x00003039
	add r1, r2, r1
	bl sub_02066CAC
	pop {r3, r4, r5, pc}
	nop
_02066D38: .word 0x41C64E6D
_02066D3C: .word 0x00003039
	thumb_func_end Save_LCRNGAdvanceLotoID

	thumb_func_start sub_02066D40
sub_02066D40: ; 0x02066D40
	ldr r3, _02066D48 ; =GetScriptVar
	ldr r1, _02066D4C ; =VAR_UNK_4041
	bx r3
	nop
_02066D48: .word GetScriptVar
_02066D4C: .word VAR_UNK_4041
	thumb_func_end sub_02066D40

	thumb_func_start sub_02066D50
sub_02066D50: ; 0x02066D50
	ldr r3, _02066D58 ; =SetScriptVar
	add r2, r1, #0
	ldr r1, _02066D5C ; =VAR_UNK_4041
	bx r3
	.balign 4, 0
_02066D58: .word SetScriptVar
_02066D5C: .word VAR_UNK_4041
	thumb_func_end sub_02066D50

	thumb_func_start sub_02066D60
sub_02066D60: ; 0x02066D60
	push {r4, lr}
	bl SavArray_Flags_get
	add r4, r0, #0
	bl LCRandom
	mov r1, #0x62
	bl _s32_div_f
	add r1, r1, #2
	lsl r1, r1, #0x10
	add r0, r4, #0
	lsr r1, r1, #0x10
	bl sub_02066D50
	pop {r4, pc}
	thumb_func_end sub_02066D60

	thumb_func_start sub_02066D80
sub_02066D80: ; 0x02066D80
	push {r4, lr}
	ldr r1, _02066DA0 ; =VAR_UNK_4042
	add r4, r0, #0
	bl GetScriptVar
	ldr r2, _02066DA4 ; =0x00002710
	cmp r0, r2
	bhs _02066D96
	add r0, r0, #1
	lsl r0, r0, #0x10
	lsr r2, r0, #0x10
_02066D96:
	ldr r1, _02066DA0 ; =VAR_UNK_4042
	add r0, r4, #0
	bl SetScriptVar
	pop {r4, pc}
	.balign 4, 0
_02066DA0: .word VAR_UNK_4042
_02066DA4: .word 0x00002710
	thumb_func_end sub_02066D80

	thumb_func_start sub_02066DA8
sub_02066DA8: ; 0x02066DA8
	ldr r3, _02066DB0 ; =GetScriptVar
	ldr r1, _02066DB4 ; =VAR_UNK_4042
	bx r3
	nop
_02066DB0: .word GetScriptVar
_02066DB4: .word VAR_UNK_4042
	thumb_func_end sub_02066DA8

	thumb_func_start sub_02066DB8
sub_02066DB8: ; 0x02066DB8
	ldr r3, _02066DC0 ; =GetScriptVar
	ldr r1, _02066DC4 ; =VAR_UNK_404B
	bx r3
	nop
_02066DC0: .word GetScriptVar
_02066DC4: .word VAR_UNK_404B
	thumb_func_end sub_02066DB8

	thumb_func_start sub_02066DC8
sub_02066DC8: ; 0x02066DC8
	ldr r3, _02066DD0 ; =SetScriptVar
	add r2, r1, #0
	ldr r1, _02066DD4 ; =VAR_UNK_404B
	bx r3
	.balign 4, 0
_02066DD0: .word SetScriptVar
_02066DD4: .word VAR_UNK_404B
	thumb_func_end sub_02066DC8

	thumb_func_start sub_02066DD8
sub_02066DD8: ; 0x02066DD8
	ldr r3, _02066DE0 ; =GetScriptVar
	ldr r1, _02066DE4 ; =VAR_BATTLE_FACTORY_PRINT_PROGRESS
	bx r3
	nop
_02066DE0: .word GetScriptVar
_02066DE4: .word VAR_BATTLE_FACTORY_PRINT_PROGRESS
	thumb_func_end sub_02066DD8

	thumb_func_start sub_02066DE8
sub_02066DE8: ; 0x02066DE8
	ldr r3, _02066DF0 ; =GetScriptVar
	ldr r1, _02066DF4 ; =VAR_BATTLE_HALL_PRINT_PROGRESS
	bx r3
	nop
_02066DF0: .word GetScriptVar
_02066DF4: .word VAR_BATTLE_HALL_PRINT_PROGRESS
	thumb_func_end sub_02066DE8

	thumb_func_start sub_02066DF8
sub_02066DF8: ; 0x02066DF8
	ldr r3, _02066E00 ; =GetScriptVar
	ldr r1, _02066E04 ; =VAR_BATTLE_CASTLE_PRINT_PROGRESS
	bx r3
	nop
_02066E00: .word GetScriptVar
_02066E04: .word VAR_BATTLE_CASTLE_PRINT_PROGRESS
	thumb_func_end sub_02066DF8

	thumb_func_start sub_02066E08
sub_02066E08: ; 0x02066E08
	ldr r3, _02066E10 ; =GetScriptVar
	ldr r1, _02066E14 ; =VAR_BATTLE_ARCADE_PRINT_PROGRESS
	bx r3
	nop
_02066E10: .word GetScriptVar
_02066E14: .word VAR_BATTLE_ARCADE_PRINT_PROGRESS
	thumb_func_end sub_02066E08

	thumb_func_start sub_02066E18
sub_02066E18: ; 0x02066E18
	ldr r3, _02066E20 ; =GetScriptVar
	ldr r1, _02066E24 ; =VAR_BATTLE_TOWER_PRINT_PROGRESS
	bx r3
	nop
_02066E20: .word GetScriptVar
_02066E24: .word VAR_BATTLE_TOWER_PRINT_PROGRESS
	thumb_func_end sub_02066E18

	thumb_func_start sub_02066E28
sub_02066E28: ; 0x02066E28
	ldr r3, _02066E30 ; =GetScriptVar
	ldr r1, _02066E34 ; =VAR_UNK_404C
	bx r3
	nop
_02066E30: .word GetScriptVar
_02066E34: .word VAR_UNK_404C
	thumb_func_end sub_02066E28

	thumb_func_start sub_02066E38
sub_02066E38: ; 0x02066E38
	ldr r3, _02066E40 ; =SetScriptVar
	add r2, r1, #0
	ldr r1, _02066E44 ; =VAR_UNK_404C
	bx r3
	.balign 4, 0
_02066E40: .word SetScriptVar
_02066E44: .word VAR_UNK_404C
	thumb_func_end sub_02066E38

	thumb_func_start sub_02066E48
sub_02066E48: ; 0x02066E48
	ldr r3, _02066E50 ; =GetScriptVar
	ldr r1, _02066E54 ; =VAR_UNK_4052
	bx r3
	nop
_02066E50: .word GetScriptVar
_02066E54: .word VAR_UNK_4052
	thumb_func_end sub_02066E48

	thumb_func_start sub_02066E58
sub_02066E58: ; 0x02066E58
	push {r3, lr}
	ldr r1, _02066E70 ; =VAR_UNK_4077
	bl GetScriptVar
	cmp r0, #2
	blo _02066E68
	cmp r0, #4
	bls _02066E6C
_02066E68:
	mov r0, #0
	pop {r3, pc}
_02066E6C:
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
_02066E70: .word VAR_UNK_4077
	thumb_func_end sub_02066E58

	thumb_func_start sub_02066E74
sub_02066E74: ; 0x02066E74
	ldr r3, _02066E7C ; =GetScriptVar
	ldr r1, _02066E80 ; =VAR_UNK_4057
	bx r3
	nop
_02066E7C: .word GetScriptVar
_02066E80: .word VAR_UNK_4057
	thumb_func_end sub_02066E74

	thumb_func_start sub_02066E84
sub_02066E84: ; 0x02066E84
	ldr r3, _02066E8C ; =SetScriptVar
	add r2, r1, #0
	ldr r1, _02066E90 ; =VAR_UNK_4057
	bx r3
	.balign 4, 0
_02066E8C: .word SetScriptVar
_02066E90: .word VAR_UNK_4057
	thumb_func_end sub_02066E84

	thumb_func_start sub_02066E94
sub_02066E94: ; 0x02066E94
	push {r3, r4, r5, lr}
	ldr r1, _02066EC8 ; =VAR_UNK_4033
	add r5, r0, #0
	bl GetScriptVar
	add r4, r0, #0
	bl LCRandom
	mov r1, #0x1e
	bl _s32_div_f
	lsl r0, r1, #0x10
	lsr r2, r0, #0x10
	cmp r4, r2
	bne _02066EBE
	add r0, r2, #1
	mov r1, #0x1e
	bl _s32_div_f
	lsl r0, r1, #0x10
	lsr r2, r0, #0x10
_02066EBE:
	ldr r1, _02066EC8 ; =VAR_UNK_4033
	add r0, r5, #0
	bl SetScriptVar
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02066EC8: .word VAR_UNK_4033
	thumb_func_end sub_02066E94

	thumb_func_start sub_02066ECC
sub_02066ECC: ; 0x02066ECC
	ldr r3, _02066ED4 ; =GetScriptVar
	ldr r1, _02066ED8 ; =VAR_UNK_4033
	bx r3
	nop
_02066ED4: .word GetScriptVar
_02066ED8: .word VAR_UNK_4033
	thumb_func_end sub_02066ECC

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
	bl ScrUnk80_AddOvyMan
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
	bl sub_0202D95C
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
	bl ScrUnk80_AddOvyMan
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
	bl QueueTask
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
	bl QueueTask
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
	bl QueueTask
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
	bl sub_0202C854
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
	ldr r0, _02067598 ; =0x0000010F
	cmp r1, r0
	bne _02067592
	mov r0, #1
	bx lr
_02067592:
	mov r0, #0
	bx lr
	nop
_02067598: .word 0x0000010F
	thumb_func_end sub_02067584

	thumb_func_start sub_0206759C
sub_0206759C: ; 0x0206759C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	str r1, [sp]
	cmp r1, #0
	ble _02067606
	bl sub_0202C9D8
	bl sub_0202CA10
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
	bl sub_0202CA14
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
	bl sub_0202CA1C
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

	; file boundary
	.public _020FDB44
_020FDB44:
	.word sub_0206311C
	.word sub_0206313C
	.word sub_02062470

	.public _020FDB50
_020FDB50:
	.word sub_0206312C
	.word sub_0206313C
	.word sub_02062470

	.public _020FDB5C
_020FDB5C:
	.word sub_0206310C
	.word sub_0206313C
	.word sub_02062470

	.public _020FDB68
_020FDB68:
	.word sub_020630FC
	.word sub_0206313C
	.word sub_02062470

	.public _020FDB74
_020FDB74:
	.word sub_02062DBC
	.word sub_02062D6C
	.word sub_02062470

	.public _020FDB80
_020FDB80:
	.word sub_02062784
	.word sub_02062514
	.word sub_02062470

	.public _020FDB8C
_020FDB8C:
	.word sub_02062D8C
	.word sub_02062D6C
	.word sub_02062470

	.public _020FDB98
_020FDB98:
	.word sub_02062758
	.word sub_02062514
	.word sub_02062470

	.public _020FDBA4
_020FDBA4:
	.word sub_02062CC8
	.word sub_020629CC
	.word sub_02062470

	.public _020FDBB0
_020FDBB0:
	.word sub_020630C4
	.word sub_020630E4
	.word sub_02062470

	.public _020FDBBC
_020FDBBC:
	.word sub_02062C44
	.word sub_020629CC
	.word sub_02062470

	.public _020FDBC8
_020FDBC8:
	.word sub_020630A4
	.word sub_020630E4
	.word sub_02062470

	.public _020FDBD4
_020FDBD4:
	.word sub_02062C24
	.word sub_020629CC
	.word sub_02062470

	.public _020FDBE0
_020FDBE0:
	.word sub_020625A4
	.word sub_02062514
	.word sub_02062470

	.public _020FDBEC
_020FDBEC:
	.word sub_02063154
	.word sub_02063170
	.word sub_02062470

	.public _020FDBF8
_020FDBF8:
	.word sub_02062F94
	.word sub_02062F6C
	.word sub_02062470

	.public _020FDC04
_020FDC04:
	.word sub_02062FA0
	.word sub_02062F6C
	.word sub_02062470

	.public _020FDC10
_020FDC10:
	.word sub_0206319C
	.word sub_020631F0
	.word sub_02062470

	.public _020FDC1C
_020FDC1C:
	.word sub_02062918
	.word sub_020627E4
	.word sub_02062470

	.public _020FDC28
_020FDC28:
	.word sub_020628F8
	.word sub_020627E4
	.word sub_02062470

	.public _020FDC34
_020FDC34:
	.word sub_020628D8
	.word sub_020627E4
	.word sub_02062470

	.public _020FDC40
_020FDC40:
	.word sub_020628B8
	.word sub_020627E4
	.word sub_02062470

	.public _020FDC4C
_020FDC4C:
	.word sub_02062898
	.word sub_020627E4
	.word sub_02062470

	.public _020FDC58
_020FDC58:
	.word sub_02062878
	.word sub_020627E4
	.word sub_02062470

	.public _020FDC64
_020FDC64:
	.word sub_02062E4C
	.word sub_02062E78
	.word sub_02062470

	.public _020FDC70
_020FDC70:
	.word sub_02062DE0
	.word sub_02062E04
	.word sub_02062470

	.public _020FDC7C
_020FDC7C:
	.word sub_02062DD4
	.word sub_02062D6C
	.word sub_02062470

	.public _020FDC88
_020FDC88:
	.word sub_02062DC8
	.word sub_02062D6C
	.word sub_02062470

	.public _020FDC94
_020FDC94:
	.word sub_02062704
	.word sub_02062514
	.word sub_02062470

	.public _020FDCA0
_020FDCA0:
	.word sub_02062DB0
	.word sub_02062D6C
	.word sub_02062470

	.public _020FDCAC
_020FDCAC:
	.word sub_02062DA4
	.word sub_02062D6C
	.word sub_02062470

	.public _020FDCB8
_020FDCB8:
	.word sub_02062D98
	.word sub_02062D6C
	.word sub_02062470

	.public _020FDCC4
_020FDCC4:
	.word sub_0206265C
	.word sub_02062514
	.word sub_02062470

	.public _020FDCD0
_020FDCD0:
	.word sub_02062D30
	.word sub_020629CC
	.word sub_02062470

	.public _020FDCDC
_020FDCDC:
	.word sub_02062D0C
	.word sub_020629CC
	.word sub_02062470

	.public _020FDCE8
_020FDCE8:
	.word sub_02062CE8
	.word sub_020629CC
	.word sub_02062470

	.public _020FDCF4
_020FDCF4:
	.word sub_020625B8
	.word sub_02062514
	.word sub_02062470

	.public _020FDD00
_020FDD00:
	.word sub_02062CA4
	.word sub_020629CC
	.word sub_02062470

	.public _020FDD0C
_020FDD0C:
	.word sub_02062C84
	.word sub_020629CC
	.word sub_02062470

	.public _020FDD18
_020FDD18:
	.word sub_02062C64
	.word sub_020629CC
	.word sub_02062470

	.public _020FDD24
_020FDD24:
	.word sub_020630B4
	.word sub_020630E4
	.word sub_02062470

	.public _020FDD30
_020FDD30:
	.word sub_02062C00
	.word sub_020629CC
	.word sub_02062470

	.public _020FDD3C
_020FDD3C:
	.word sub_02062BDC
	.word sub_020629CC
	.word sub_02062470

	.public _020FDD48
_020FDD48:
	.word sub_0206304C
	.word sub_0206308C
	.word sub_02062470

	.public _020FDD54
_020FDD54:
	.word sub_02062B1C
	.word sub_020629CC
	.word sub_02062470

	.public _020FDD60
_020FDD60:
	.word sub_02062B3C
	.word sub_020629CC
	.word sub_02062470

	.public _020FDD6C
_020FDD6C:
	.word sub_0206305C
	.word sub_0206308C
	.word sub_02062470

	.public _020FDD78
_020FDD78:
	.word sub_02063258
	.word sub_02063290
	.word sub_02062470

	.public _020FDD84
_020FDD84:
	.word sub_02062B5C
	.word sub_020629CC
	.word sub_02062470

	.public _020FDD90
_020FDD90:
	.word sub_02062AFC
	.word sub_020629CC
	.word sub_02062470

	.public _020FDD9C
_020FDD9C:
	.word sub_02062ADC
	.word sub_020629CC
	.word sub_02062470

	.public _020FDDA8
_020FDDA8:
	.word sub_02062ABC
	.word sub_020629CC
	.word sub_02062470

	.public _020FDDB4
_020FDDB4:
	.word sub_02062948
	.word sub_020627E4
	.word sub_02062470

	.public _020FDDC0
_020FDDC0:
	.word sub_02062938
	.word sub_020627E4
	.word sub_02062470

	.public _020FDDCC
_020FDDCC:
	.word sub_02062928
	.word sub_020627E4
	.word sub_02062470

	.public _020FDDD8
_020FDDD8:
	.word sub_02062B7C
	.word sub_020629CC
	.word sub_02062470

	.public _020FDDE4
_020FDDE4:
	.word sub_02062908
	.word sub_020627E4
	.word sub_02062470

	.public _020FDDF0
_020FDDF0:
	.word sub_0206306C
	.word sub_0206308C
	.word sub_02062470

	.public _020FDDFC
_020FDDFC:
	.word sub_020628E8
	.word sub_020627E4
	.word sub_02062470

	.public _020FDE08
_020FDE08:
	.word sub_02062B9C
	.word sub_020629CC
	.word sub_02062470

	.public _020FDE14
_020FDE14:
	.word sub_020628C8
	.word sub_020627E4
	.word sub_02062470

	.public _020FDE20
_020FDE20:
	.word sub_02062BBC
	.word sub_020629CC
	.word sub_02062470

	.public _020FDE2C
_020FDE2C:
	.word sub_020628A8
	.word sub_020627E4
	.word sub_02062470

	.public _020FDE38
_020FDE38:
	.word sub_0206307C
	.word sub_0206308C
	.word sub_02062470

	.public _020FDE44
_020FDE44:
	.word sub_02062888
	.word sub_020627E4
	.word sub_02062470

	.public _020FDE50
_020FDE50:
	.word sub_02063274
	.word sub_02063290
	.word sub_02062470

	.public _020FDE5C
_020FDE5C:
	.word sub_02062868
	.word sub_020627E4
	.word sub_02062470

	.public _020FDE68
_020FDE68:
	.word sub_02062858
	.word sub_020627E4
	.word sub_02062470

	.public _020FDE74
_020FDE74:
	.word sub_02062848
	.word sub_020627E4
	.word sub_02062470

	.public _020FDE80
_020FDE80:
	.word sub_02062838
	.word sub_020627E4
	.word sub_02062470

	.public _020FDE8C
_020FDE8C:
	.word sub_02062828
	.word sub_020627E4
	.word sub_02062470

	.public _020FDE98
_020FDE98:
	.word sub_02062818
	.word sub_020627E4
	.word sub_02062470

	.public _020FDEA4
_020FDEA4:
	.word sub_02062740
	.word sub_02062514
	.word sub_02062470

	.public _020FDEB0
_020FDEB0:
	.word sub_0206272C
	.word sub_02062514
	.word sub_02062470

	.public _020FDEBC
_020FDEBC:
	.word sub_02062718
	.word sub_02062514
	.word sub_02062470

	.public _020FDEC8
_020FDEC8:
	.word sub_0206257C
	.word sub_02062514
	.word sub_02062470

	.public _020FDED4
_020FDED4:
	.word sub_020626EC
	.word sub_02062514
	.word sub_02062470

	.public _020FDEE0
_020FDEE0:
	.word sub_020626D8
	.word sub_02062514
	.word sub_02062470

	.public _020FDEEC
_020FDEEC:
	.word sub_020626C4
	.word sub_02062514
	.word sub_02062470

	.public _020FDEF8
_020FDEF8:
	.word sub_020626AC
	.word sub_02062514
	.word sub_02062470

	.public _020FDF04
_020FDF04:
	.word sub_02062698
	.word sub_02062514
	.word sub_02062470

	.public _020FDF10
_020FDF10:
	.word sub_02062684
	.word sub_02062514
	.word sub_02062470

	.public _020FDF1C
_020FDF1C:
	.word sub_02062670
	.word sub_02062514
	.word sub_02062470

	.public _020FDF28
_020FDF28:
	.word sub_020625CC
	.word sub_02062514
	.word sub_02062470

	.public _020FDF34
_020FDF34:
	.word sub_02062648
	.word sub_02062514
	.word sub_02062470

	.public _020FDF40
_020FDF40:
	.word sub_02062634
	.word sub_02062514
	.word sub_02062470

	.public _020FDF4C
_020FDF4C:
	.word sub_02062620
	.word sub_02062514
	.word sub_02062470

	.public _020FDF58
_020FDF58:
	.word sub_02062608
	.word sub_02062514
	.word sub_02062470

	.public _020FDF64
_020FDF64:
	.word sub_0206389C
	.word sub_02063424
	.word sub_020638DC
	.word sub_02063424
	.word sub_02062470

	.public _020FDF78
_020FDF78:
	.word sub_020638BC
	.word sub_02063424
	.word sub_020638DC
	.word sub_02063424
	.word sub_02062470

	.public _020FDF8C
_020FDF8C:
	.word sub_020639F4
	.word sub_02063424
	.word sub_020639F4
	.word sub_02063424
	.word sub_020639F4
	.word sub_02063424
	.word sub_02062470

	.public _020FDFA8
_020FDFA8:
	.word sub_02063724
	.word sub_02063424
	.word sub_02063744
	.word sub_02063424
	.word sub_02063764
	.word sub_02063424
	.word sub_02063784
	.word sub_02063424
	.word sub_02062470

	.public _020FDFCC
_020FDFCC:
	.word sub_02063684
	.word sub_02063424
	.word sub_020636A4
	.word sub_02063424
	.word sub_020636C4
	.word sub_02063424
	.word sub_020636E4
	.word sub_02063424
	.word sub_02063704
	.word sub_02063424
	.word sub_02062470

	.public _020FDFF8
_020FDFF8:
	.word sub_020637A4
	.word sub_02063424
	.word sub_020637C0
	.word sub_02063424
	.word sub_020637E0
	.word sub_02063424
	.word sub_02063800
	.word sub_02063424
	.word sub_02063820
	.word sub_02063424
	.word sub_02063840
	.word sub_02063424
	.word sub_0206385C
	.word sub_02063424
	.word sub_02062470

	.public _020FE034
_020FE034:
	.word sub_020637A4
	.word sub_02063424
	.word sub_020637C0
	.word sub_02063424
	.word sub_020637E0
	.word sub_02063424
	.word sub_02063800
	.word sub_02063424
	.word sub_02063820
	.word sub_02063424
	.word sub_02063840
	.word sub_02063424
	.word sub_0206387C
	.word sub_02063424
	.word sub_02062470

	.public _020FE070
_020FE070:
	.word sub_020638FC
	.word sub_02063424
	.word sub_0206391C
	.word sub_02063424
	.word sub_0206393C
	.word sub_02063424
	.word sub_02063958
	.word sub_02063424
	.word sub_02063958
	.word sub_02063424
	.word sub_02063978
	.word sub_02063424
	.word sub_02063978
	.word sub_02063424
	.word sub_02063998
	.word sub_02063424
	.word sub_020639B8
	.word sub_02063424
	.word sub_020639D8
	.word sub_02063424
	.word sub_02062470

	; file boundary
_020FE0C4:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00
_020FE0D4:
	.byte 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00
_020FE0E4:
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00
_020FE104:
	.word sub_02063AFC
	.word sub_02063AFC
	.word sub_02063AFC
	.word sub_02063AFC
	.word sub_02063B08
	.word sub_02063C88
	.word sub_02063C88
	.word sub_02063AFC
	.word sub_02063AFC
	.word sub_02063AFC
	.word sub_02063AFC
	.word sub_02063AFC
_020FE134:
	.word sub_02063B00
	.word sub_02063B00
	.word sub_02063B00
	.word sub_02063B00
	.word sub_02063B20
	.word sub_02063CB4
	.word sub_02063CB4
	.word sub_02063B00
	.word sub_02063B00
	.word sub_02063B00
	.word sub_02063B00
	.word sub_02063B00
_020FE164:
	.word sub_02063B04
	.word sub_02063B04
	.word sub_02063B04
	.word sub_02063B04
	.word sub_02063B9C
	.word sub_02063D30
	.word sub_02063D30
	.word sub_02063B04
	.word sub_02063B04
	.word sub_02063B04
	.word sub_02063B04
	.word sub_02063B04
	; File boundary?
_020FE194:
	.word sub_020643B8
	.word sub_020643E4
	.word sub_02064410
	.word sub_0206443C
_020FE1A4:
	.word sub_0206464C
	.word sub_02064668
	.word sub_02064694
	.word sub_020646DC
	.word sub_02064714
	.word sub_02064730
	.word sub_02064748
	.word sub_02064764
	.word sub_02064778
	.word sub_02064790
	.word sub_020647A8
	.word sub_020647C0
	.word sub_020647E8
	.word sub_02064808
	.word sub_02064824
	.word sub_020648A0
	.word sub_020648C8
	.word sub_020648E4
	; File boundary?
_020FE1EC:
	.word 0
	.word ov04_02254D84
	.word ov04_02256044
	.word ov04_022563B0
	.word 0
	.word ov04_02254710
	.word ov04_0225507C
	.word ov04_022566A0
	.word ov04_02256BA0
	.word ov04_02256EB0
_020FE214:
	.word 0
	.word ov04_02254CBC
	.word ov04_02255FC0
	.word ov04_02256304
	.word ov04_02253E20
	.word ov04_02254190
	.word ov04_02254F8C
	.word ov04_02256650
	.word ov04_02256B64
	.word ov04_02256E60
_020FE23C:
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word ov04_022550D4
	.word 0
	.word 0
	.word 0
_020FE264:
	; Menu use, Field use, Check use
	.word 0, ItemFieldUseFunc_Generic, 0 ; No use
	.word ItemMenuUseFunc_HealingItem, 0, 0 ; Healing item
	.word 0, 0, ItemCheckUseFunc_Dummy ; Town map
	.word 0, 0, ItemCheckUseFunc_Dummy ; Unused
	.word ItemMenuUseFunc_Bicycle, ItemFieldUseFunc_Bicycle, ItemCheckUseFunc_Bicycle ; Bicycle
	.word 0, 0, ItemCheckUseFunc_Dummy ; Journal
	.word ItemMenuUseFunc_TMHM, 0, 0 ; TM/HM
	.word ItemMenuUseFunc_Mail, 0, 0 ; Mail
	.word ItemMenuUseFunc_Berry, 0, ItemCheckUseFunc_Berry ; Berry
	.word 0, 0, ItemCheckUseFunc_Dummy ; Poffin case
	.word ItemMenuUseFunc_PalPad, ItemFieldUseFunc_PalPad, 0 ; Pal Pad
	.word 0, 0, ItemCheckUseFunc_Dummy ; Poke Radar
	.word 0, 0, ItemCheckUseFunc_Dummy ; Sprayduck
	.word 0, 0, ItemCheckUseFunc_Dummy ; Unused
	.word ItemMenuUseFunc_Honey, 0, 0 ; Honey
	.word 0, 0, ItemCheckUseFunc_Dummy ; VS Seeker
	.word ItemMenuUseFunc_OldRod, ItemFieldUseFunc_OldRod, ItemCheckUseFunc_FishingRod ; Old Rod
	.word ItemMenuUseFunc_GoodRod, ItemFieldUseFunc_GoodRod, ItemCheckUseFunc_FishingRod ; Good Rod
	.word ItemMenuUseFunc_SuperRod, ItemFieldUseFunc_SuperRod, ItemCheckUseFunc_FishingRod ; Super Rod
	.word 0, ItemFieldUseFunc_Generic, 0 ; Repels/Flutes/Seal case for some reason
	.word ItemMenuUseFunc_EvoStone, 0, 0 ; Evo stones
	.word ItemMenuUseFunc_EscapeRope, 0, ItemCheckUseFunc_EscapeRope ; Escape Rope
	.word 0, 0, ItemCheckUseFunc_Dummy ; Azure Flute
	.word ItemMenuUseFunc_ApricornBox, ItemFieldUseFunc_ApricornBox, 0 ; Apricorn Box
	.word ItemMenuUseFunc_BerryPots, ItemFieldUseFunc_BerryPots, 0 ; Berry Pots
	.word ItemMenuUseFunc_UnownReport, ItemFieldUseFunc_UnownReport, 0 ; Unown Report
	.word ItemMenuUseFunc_DowsingMchn, ItemFieldUseFunc_DowsingMchn, 0 ; Dowsing Mchn
	.word 0, ItemFieldUseFunc_GbSounds, 0 ; GB Sounds
	.word ItemMenuUseFunc_Gracidea, ItemFieldUseFunc_Gracidea, 0 ; Gracidea
	.word ItemMenuUseFunc_VSRecorder, ItemFieldUseFunc_VSRecorder, 0 ; VS Recorder

	; File boundary
_020FE3CC:
	.word sub_020663B4
	.word sub_020663E4
_020FE3D4:
	.word sub_02066064
	.word sub_020660A0
_020FE3DC:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0xFE, 0xFF, 0x00, 0x00, 0x00, 0x00
_020FE3E8:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFE, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00
_020FE3F4:
	.word 12, 13, 14, 15
_020FE404:
	.word sub_02065A4C
	.word sub_02065C2C
	.word sub_02065C48
	.word sub_02065C90
_020FE414:
	.word sub_02065B70
	.word sub_02065C2C
	.word sub_02065C48
	.word sub_02065C90
_020FE424:
	.word sub_02065BE8
	.word sub_02065C2C
	.word sub_02065C48
	.word sub_02065C90
_020FE434:
	.word 16, 17, 18, 19
_020FE444:
	.word 20, 21, 22, 23
_020FE454:
	.short MAP_D22R0101, FLAG_BUG_CONTEST_ACTIVE, SEQ_GS_TAIKAIMAE_D5
	.short MAP_R35R0201, FLAG_BUG_CONTEST_ACTIVE, SEQ_GS_TAIKAIMAE
	.short MAP_R36R0201, FLAG_BUG_CONTEST_ACTIVE, SEQ_GS_TAIKAIMAE
	.short MAP_T04GYM0101, FLAG_UNK_994, SEQ_GS_EYE_ROCKET
	.short MAP_R24, FLAG_UNK_995, SEQ_GS_EYE_ROCKET
	.short MAP_D10R0101, FLAG_UNK_999, SEQ_GS_SAFARI_FIELD
	.short MAP_D23R0101, FLAG_ROCKET_TAKEOVER_ACTIVE, SEQ_GS_SENKYO
	.short MAP_D23R0102, FLAG_ROCKET_TAKEOVER_ACTIVE, SEQ_GS_SENKYO
	.short MAP_D23R0103, FLAG_ROCKET_TAKEOVER_ACTIVE, SEQ_GS_SENKYO
	.short MAP_D23R0104, FLAG_ROCKET_TAKEOVER_ACTIVE, SEQ_GS_SENKYO
	.short MAP_D23R0105, FLAG_ROCKET_TAKEOVER_ACTIVE, SEQ_GS_SENKYO
	.short MAP_D23R0106, FLAG_ROCKET_TAKEOVER_ACTIVE, SEQ_GS_SENKYO
	.short MAP_D23R0107, FLAG_ROCKET_TAKEOVER_ACTIVE, SEQ_GS_SENKYO

	.balign 4, 0
_020FE4A4:
	.short 0x06F2, 0xAD7C
_020FE4A8:
	.short 0x6208
	.short 0xF229
	.short 0x0382
	.short 0x1228
_020FE4B0:
	.byte 0x00, 0x01, 0x02, 0x03, 0x04, 0x00, 0x00, 0x00
	.balign 4, 0
