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
	bl MapObject_IncMovementStep
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

	thumb_func_start MapObjectMovementCmd108_Step1
MapObjectMovementCmd108_Step1: ; 0x02063424
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
	bl MapObject_SetFacingVec
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
	bl MapObject_IncMovementStep
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
	thumb_func_end MapObjectMovementCmd108_Step1

	thumb_func_start MapObjectMovementCmd105_Step0
MapObjectMovementCmd105_Step0: ; 0x02063684
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
	thumb_func_end MapObjectMovementCmd105_Step0

	thumb_func_start MapObjectMovementCmd105_Step2
MapObjectMovementCmd105_Step2: ; 0x020636A4
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
	thumb_func_end MapObjectMovementCmd105_Step2

	thumb_func_start MapObjectMovementCmd105_Step4
MapObjectMovementCmd105_Step4: ; 0x020636C4
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
	thumb_func_end MapObjectMovementCmd105_Step4

	thumb_func_start MapObjectMovementCmd105_Step6
MapObjectMovementCmd105_Step6: ; 0x020636E4
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
	thumb_func_end MapObjectMovementCmd105_Step6

	thumb_func_start MapObjectMovementCmd105_Step8
MapObjectMovementCmd105_Step8: ; 0x02063704
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
	thumb_func_end MapObjectMovementCmd105_Step8

	thumb_func_start MapObjectMovementCmd106_Step0
MapObjectMovementCmd106_Step0: ; 0x02063724
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
	thumb_func_end MapObjectMovementCmd106_Step0

	thumb_func_start MapObjectMovementCmd106_Step2
MapObjectMovementCmd106_Step2: ; 0x02063744
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
	thumb_func_end MapObjectMovementCmd106_Step2

	thumb_func_start MapObjectMovementCmd106_Step4
MapObjectMovementCmd106_Step4: ; 0x02063764
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
	thumb_func_end MapObjectMovementCmd106_Step4

	thumb_func_start MapObjectMovementCmd106_Step6
MapObjectMovementCmd106_Step6: ; 0x02063784
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
	thumb_func_end MapObjectMovementCmd106_Step6

	thumb_func_start MapObjectMovementCmd107_Step0
MapObjectMovementCmd107_Step0: ; 0x020637A4
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
	thumb_func_end MapObjectMovementCmd107_Step0

	thumb_func_start MapObjectMovementCmd107_Step2
MapObjectMovementCmd107_Step2: ; 0x020637C0
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
	thumb_func_end MapObjectMovementCmd107_Step2

	thumb_func_start MapObjectMovementCmd107_Step4
MapObjectMovementCmd107_Step4: ; 0x020637E0
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
	thumb_func_end MapObjectMovementCmd107_Step4

	thumb_func_start MapObjectMovementCmd107_Step6
MapObjectMovementCmd107_Step6: ; 0x02063800
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
	thumb_func_end MapObjectMovementCmd107_Step6

	thumb_func_start MapObjectMovementCmd107_Step8
MapObjectMovementCmd107_Step8: ; 0x02063820
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
	thumb_func_end MapObjectMovementCmd107_Step8

	thumb_func_start MapObjectMovementCmd107_Step10
MapObjectMovementCmd107_Step10: ; 0x02063840
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
	thumb_func_end MapObjectMovementCmd107_Step10

	thumb_func_start MapObjectMovementCmd107_Step12
MapObjectMovementCmd107_Step12: ; 0x0206385C
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
	thumb_func_end MapObjectMovementCmd107_Step12

	thumb_func_start MapObjectMovementCmd109_Step12
MapObjectMovementCmd109_Step12: ; 0x0206387C
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
	thumb_func_end MapObjectMovementCmd109_Step12

	thumb_func_start MapObjectMovementCmd108_Step0
MapObjectMovementCmd108_Step0: ; 0x0206389C
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
	thumb_func_end MapObjectMovementCmd108_Step0

	thumb_func_start MapObjectMovementCmd110_Step0
MapObjectMovementCmd110_Step0: ; 0x020638BC
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
	thumb_func_end MapObjectMovementCmd110_Step0

	thumb_func_start MapObjectMovementCmd108_Step2
MapObjectMovementCmd108_Step2: ; 0x020638DC
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
	thumb_func_end MapObjectMovementCmd108_Step2

	thumb_func_start MapObjectMovementCmd111_Step0
MapObjectMovementCmd111_Step0: ; 0x020638FC
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
	thumb_func_end MapObjectMovementCmd111_Step0

	thumb_func_start MapObjectMovementCmd111_Step2
MapObjectMovementCmd111_Step2: ; 0x0206391C
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
	thumb_func_end MapObjectMovementCmd111_Step2

	thumb_func_start MapObjectMovementCmd111_Step4
MapObjectMovementCmd111_Step4: ; 0x0206393C
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
	thumb_func_end MapObjectMovementCmd111_Step4

	thumb_func_start MapObjectMovementCmd111_Step6
MapObjectMovementCmd111_Step6: ; 0x02063958
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
	thumb_func_end MapObjectMovementCmd111_Step6

	thumb_func_start MapObjectMovementCmd111_Step10
MapObjectMovementCmd111_Step10: ; 0x02063978
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
	thumb_func_end MapObjectMovementCmd111_Step10

	thumb_func_start MapObjectMovementCmd111_Step14
MapObjectMovementCmd111_Step14: ; 0x02063998
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
	thumb_func_end MapObjectMovementCmd111_Step14

	thumb_func_start MapObjectMovementCmd111_Step16
MapObjectMovementCmd111_Step16: ; 0x020639B8
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
	thumb_func_end MapObjectMovementCmd111_Step16

	thumb_func_start MapObjectMovementCmd111_Step18
MapObjectMovementCmd111_Step18: ; 0x020639D8
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
	thumb_func_end MapObjectMovementCmd111_Step18

	thumb_func_start MapObjectMovementCmd112_Step0
MapObjectMovementCmd112_Step0: ; 0x020639F4
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
	thumb_func_end MapObjectMovementCmd112_Step0

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
	bl MapObject_IsSingleMovementActive
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
	bl MapObject_ForceSetHeldMovement
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
	bl MapObject_IsSingleMovementActive
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
	bl MapObject_ForceSetHeldMovement
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
	bl FieldSys_ApricornTree_TryGetApricorn
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
	bl FieldSys_ApricornTree_TryGetApricorn
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
	bl MapObject_GetTrainerNum
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
	bl GetDeltaXByFacingDirection
	add r6, r4, r0
	add r0, r5, #0
	bl GetDeltaYByFacingDirection
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
	bl GetDeltaXByFacingDirection
	add r6, r6, r0
	add r0, r5, #0
	bl GetDeltaYByFacingDirection
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

	thumb_func_start MapObject_GetTrainerNum
MapObject_GetTrainerNum: ; 0x02064508
	push {r3, lr}
	bl MapObject_GetScript
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl ScriptNumToTrainerNum
	pop {r3, pc}
	thumb_func_end MapObject_GetTrainerNum

	thumb_func_start sub_02064518
sub_02064518: ; 0x02064518
	ldr r3, _0206451C ; =MapObject_GetTrainerNum
	bx r3
	.balign 4, 0
_0206451C: .word MapObject_GetTrainerNum
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
	bl MapObject_GetTrainerNum
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
	bl CreateSysTask
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
	bl DestroySysTask
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
	bl MapObject_IsSingleMovementActive
	cmp r0, #1
	bne _02064662
	add r0, r4, #0
	bl MapObject_UnpauseMovement
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
	bl MapObject_IsSingleMovementActive
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
	bl MapObject_IsMovementPaused
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
	bl MapObject_AreBitsSetForMovementScriptInit
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
	bl MapObject_SetHeldMovement
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
	bl MapObject_IsMovementPaused
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
	bl MapObject_SetHeldMovement
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
	bl MapObject_IsMovementPaused
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
	bl MapObject_AreBitsSetForMovementScriptInit
	cmp r0, #1
	bne _020647E2
	ldr r0, [r4, #8]
	mov r1, #0xc
	bl sub_0206234C
	add r1, r0, #0
	ldr r0, [r4, #0x24]
	bl MapObject_SetHeldMovement
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
	bl MapObject_IsMovementPaused
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
	bl MapObject_AreBitsSetForMovementScriptInit
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
	bl MapObject_SetHeldMovement
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
	bl MapObject_IsMovementPaused
	cmp r0, #0
	bne _020648B8
	mov r0, #0
	pop {r3, r4, r5, pc}
_020648B8:
	add r0, r5, #0
	bl MapObject_ClearHeldMovementIfActive
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
	bl MapObject_ClearHeldMovementIfActive
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

	.rodata

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
