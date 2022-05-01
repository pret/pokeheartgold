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

	thumb_func_start ov01_021F944C
ov01_021F944C: ; 0x021F944C
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r2, #0
	mov r2, #0x41
	add r5, r0, #0
	lsl r2, r2, #2
	str r1, [r5, r2]
	add r1, r4, #0
	bl ov01_021FA2EC
	ldr r2, [sp, #0x24]
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_021FA854
	mov r2, #4
	mov r1, #8
	ldr r0, [sp, #0x18]
	str r2, [sp]
	str r0, [sp, #4]
	ldr r0, [sp, #0x1c]
	add r3, r1, #0
	str r0, [sp, #8]
	add r0, r5, #0
	bl ov01_021F9808
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_021F9698
	ldr r1, [sp, #0x20]
	ldr r2, _021F9498 ; =ov01_02207260
	ldr r3, _021F949C ; =ov01_02206CF0
	add r0, r5, #0
	bl ov01_021F9A8C
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_021F9498: .word ov01_02207260
_021F949C: .word ov01_02206CF0
	thumb_func_end ov01_021F944C

	thumb_func_start ov01_021F94A0
ov01_021F94A0: ; 0x021F94A0
	push {r4, lr}
	add r4, r0, #0
	bl ov01_021FA8F8
	add r0, r4, #0
	bl ov01_021F96E4
	add r0, r4, #0
	bl ov01_021FA1D0
	bl ov01_021FA314
	add r0, r4, #0
	bl ov01_021F9890
	pop {r4, pc}
	thumb_func_end ov01_021F94A0

	thumb_func_start ov01_021F94C0
ov01_021F94C0: ; 0x021F94C0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	mov r1, #0
	add r6, r2, #0
	add r7, r0, #0
	str r1, [r5]
	bl ov01_021FA3DC
	add r1, r6, #0
	str r0, [sp]
	bl ov01_021F9DA4
	add r4, r0, #0
	bne _021F94EA
	add r0, r7, #0
	add r1, r5, #0
	add r2, r6, #0
	bl ov01_021F9654
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_021F94EA:
	sub r0, r4, #3
	cmp r0, #1
	bhi _021F9500
	ldr r0, [sp]
	add r1, r7, #0
	add r2, r5, #0
	add r3, r6, #0
	bl ov01_021FA75C
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_021F9500:
	add r0, r7, #0
	add r1, r6, #0
	bl ov01_021F9528
	str r0, [r5]
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_021F94C0

	thumb_func_start ov01_021F9510
ov01_021F9510: ; 0x021F9510
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl MapObject_GetGfxID
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_021F94C0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021F9510

	thumb_func_start ov01_021F9528
ov01_021F9528: ; 0x021F9528
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r6, r0, #0
	add r5, r1, #0
	bl ov01_021FA3DC
	add r4, r0, #0
	bl ov01_021FA1D0
	add r7, r0, #0
	add r0, r4, #0
	add r1, r5, #0
	bl ov01_021F9F84
	add r0, r4, #0
	add r1, r5, #0
	bl ov01_021F9704
	add r4, r0, #0
	bne _021F9554
	bl GF_AssertFail
_021F9554:
	add r0, r6, #0
	add r1, sp, #0
	bl ov01_021F93AC
	add r0, r7, #0
	add r1, r4, #0
	add r2, sp, #0
	bl ov01_021FA31C
	add r4, r0, #0
	bne _021F956E
	bl GF_AssertFail
_021F956E:
	add r0, r4, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov01_021F9528

	thumb_func_start ov01_021F9574
ov01_021F9574: ; 0x021F9574
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r6, r0, #0
	ldr r0, [r5]
	add r4, r2, #0
	bl sub_02023DA4
	mov r0, #0
	str r0, [r5]
	add r0, r6, #0
	bl sub_0205F35C
	add r1, r6, #0
	add r2, r4, #0
	bl ov01_021F97BC
	cmp r0, #0
	bne _021F95A4
	add r0, r6, #0
	bl ov01_021FA3DC
	add r1, r4, #0
	bl ov01_021F9778
_021F95A4:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov01_021F9574

	thumb_func_start ov01_021F95A8
ov01_021F95A8: ; 0x021F95A8
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	bl ov01_021F9688
	ldr r0, [r4]
	cmp r0, #0
	beq _021F95C8
	add r0, r5, #0
	bl MapObject_GetGfxID
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_021F9574
_021F95C8:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021F95A8

	thumb_func_start ov01_021F95CC
ov01_021F95CC: ; 0x021F95CC
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r6, r0, #0
	add r4, r2, #0
	bl ov01_021F9688
	ldr r0, [r5]
	cmp r0, #0
	beq _021F95E6
	bl sub_02023DA4
	mov r0, #0
	str r0, [r5]
_021F95E6:
	ldr r0, _021F960C ; =0x0000FFFF
	cmp r4, r0
	beq _021F960A
	add r0, r6, #0
	bl sub_0205F35C
	add r1, r6, #0
	add r2, r4, #0
	bl ov01_021F97BC
	cmp r0, #0
	bne _021F960A
	add r0, r6, #0
	bl ov01_021FA3DC
	add r1, r4, #0
	bl ov01_021F9778
_021F960A:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021F960C: .word 0x0000FFFF
	thumb_func_end ov01_021F95CC

	thumb_func_start ov01_021F9610
ov01_021F9610: ; 0x021F9610
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_02023EB8
	str r0, [r4]
	add r0, r5, #0
	bl sub_02023EF4
	strh r0, [r4, #6]
	add r0, r5, #0
	bl sub_02023F30
	str r0, [r4, #8]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021F9610

	thumb_func_start ov01_021F9630
ov01_021F9630: ; 0x021F9630
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldr r1, [r4]
	add r5, r0, #0
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl sub_02023EA4
	ldrh r1, [r4, #6]
	add r0, r5, #0
	bl sub_02023EE0
	ldr r1, [r4, #8]
	add r0, r5, #0
	bl sub_02023F1C
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021F9630

	thumb_func_start ov01_021F9654
ov01_021F9654: ; 0x021F9654
	push {r3, r4, r5, r6, r7, lr}
	add r6, r2, #0
	add r5, r0, #0
	add r4, r1, #0
	bl ov01_021FA3DC
	add r1, r6, #0
	add r7, r0, #0
	bl ov01_021F9974
	cmp r0, #0
	bne _021F9678
	add r0, r5, #0
	add r1, r6, #0
	bl ov01_021F9528
	str r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_021F9678:
	add r0, r7, #0
	add r1, r5, #0
	add r2, r4, #0
	add r3, r6, #0
	bl ov01_021FA75C
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_021F9654

	thumb_func_start ov01_021F9688
ov01_021F9688: ; 0x021F9688
	push {r4, lr}
	add r4, r0, #0
	bl ov01_021FA3DC
	add r1, r4, #0
	bl ov01_021FA798
	pop {r4, pc}
	thumb_func_end ov01_021F9688

	thumb_func_start ov01_021F9698
ov01_021F9698: ; 0x021F9698
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	mov r1, #0x28
	add r7, r0, #0
	mov r0, #4
	mul r1, r5
	bl AllocFromHeap
	add r6, r0, #0
	add r0, r7, #0
	add r0, #0xe4
	str r6, [r0]
	cmp r6, #0
	bne _021F96B8
	bl GF_AssertFail
_021F96B8:
	mov r0, #4
	lsl r1, r5, #3
	bl AllocFromHeap
	add r4, r0, #0
	add r7, #0xf4
	str r4, [r7]
	cmp r4, #0
	bne _021F96CE
	bl GF_AssertFail
_021F96CE:
	ldr r0, _021F96E0 ; =0x0000FFFF
_021F96D0:
	str r0, [r4]
	str r6, [r4, #4]
	add r4, #8
	add r6, #0x28
	sub r5, r5, #1
	bne _021F96D0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F96E0: .word 0x0000FFFF
	thumb_func_end ov01_021F9698

	thumb_func_start ov01_021F96E4
ov01_021F96E4: ; 0x021F96E4
	push {r4, lr}
	add r4, r0, #0
	bl ov01_021F9798
	add r1, r4, #0
	add r1, #0xe4
	ldr r1, [r1]
	mov r0, #4
	bl FreeToHeapExplicit
	add r4, #0xf4
	ldr r1, [r4]
	mov r0, #4
	bl FreeToHeapExplicit
	pop {r4, pc}
	thumb_func_end ov01_021F96E4

	thumb_func_start ov01_021F9704
ov01_021F9704: ; 0x021F9704
	push {r4, r5, r6, lr}
	add r2, r0, #0
	add r2, #0xf4
	ldr r4, [r2]
	ldr r2, [r0, #4]
	add r6, r4, #0
	add r5, r2, #0
_021F9712:
	ldr r3, [r6]
	cmp r3, r1
	bne _021F971C
	ldr r0, [r6, #4]
	pop {r4, r5, r6, pc}
_021F971C:
	add r6, #8
	sub r5, r5, #1
	bne _021F9712
	ldr r3, _021F9740 ; =0x0000FFFF
_021F9724:
	ldr r5, [r4]
	cmp r5, r3
	bne _021F9736
	str r1, [r4]
	ldr r2, [r4, #4]
	bl ov01_021FA370
	ldr r0, [r4, #4]
	pop {r4, r5, r6, pc}
_021F9736:
	add r4, #8
	sub r2, r2, #1
	bne _021F9724
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021F9740: .word 0x0000FFFF
	thumb_func_end ov01_021F9704

	thumb_func_start ov01_021F9744
ov01_021F9744: ; 0x021F9744
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r2, #0
	bl sub_0205F1A0
	add r1, r0, #0
	add r1, #0xf4
	ldr r2, [r1]
	ldr r1, [r0, #4]
_021F9756:
	ldr r0, [r2]
	cmp r0, r5
	bne _021F976C
	ldr r3, [r2, #4]
	mov r2, #5
_021F9760:
	ldmia r3!, {r0, r1}
	stmia r4!, {r0, r1}
	sub r2, r2, #1
	bne _021F9760
	mov r0, #1
	pop {r3, r4, r5, pc}
_021F976C:
	add r2, #8
	sub r1, r1, #1
	bne _021F9756
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021F9744

	thumb_func_start ov01_021F9778
ov01_021F9778: ; 0x021F9778
	add r2, r0, #0
	add r2, #0xf4
	ldr r3, [r2]
	ldr r2, [r0, #4]
_021F9780:
	ldr r0, [r3]
	cmp r0, r1
	bne _021F978C
	ldr r0, _021F9794 ; =0x0000FFFF
	str r0, [r3]
	bx lr
_021F978C:
	add r3, #8
	sub r2, r2, #1
	bne _021F9780
	bx lr
	.balign 4, 0
_021F9794: .word 0x0000FFFF
	thumb_func_end ov01_021F9778

	thumb_func_start ov01_021F9798
ov01_021F9798: ; 0x021F9798
	push {r3, r4}
	add r1, r0, #0
	add r1, #0xf4
	ldr r4, [r1]
	ldr r1, _021F97B8 ; =0x0000FFFF
	ldr r3, [r0, #4]
	add r0, r1, #0
_021F97A6:
	ldr r2, [r4]
	cmp r2, r0
	beq _021F97AE
	str r1, [r4]
_021F97AE:
	add r4, #8
	sub r3, r3, #1
	bne _021F97A6
	pop {r3, r4}
	bx lr
	.balign 4, 0
_021F97B8: .word 0x0000FFFF
	thumb_func_end ov01_021F9798

	thumb_func_start ov01_021F97BC
ov01_021F97BC: ; 0x021F97BC
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r5, r1, #0
	add r6, r2, #0
	bl MapObjectMan_GetCount
	add r4, r0, #0
	add r0, r7, #0
	bl sub_0205F1AC
	ldr r7, _021F9804 ; =0x0000FFFF
	str r0, [sp]
_021F97D4:
	ldr r0, [sp]
	cmp r0, r5
	beq _021F97F4
	bl MapObject_IsInUse
	cmp r0, #1
	bne _021F97F4
	ldr r0, [sp]
	bl MapObject_GetGfxID
	cmp r0, r7
	beq _021F97F4
	cmp r0, r6
	bne _021F97F4
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021F97F4:
	add r0, sp, #0
	bl sub_0205F1C4
	sub r4, r4, #1
	bne _021F97D4
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F9804: .word 0x0000FFFF
	thumb_func_end ov01_021F97BC

	thumb_func_start ov01_021F9808
ov01_021F9808: ; 0x021F9808
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r6, r2, #0
	add r7, r3, #0
	mov r0, #4
	mov r1, #0x3f
	lsl r2, r4, #0xc
	add r3, r4, #0
	bl ov01_021FC4C4
	add r1, r5, #0
	add r1, #0xf8
	str r0, [r1]
	add r0, r5, #0
	bl ov01_021F9B00
	add r0, r5, #0
	add r1, r6, #0
	bl ov01_021FA208
	add r0, r5, #0
	sub r1, r4, r6
	bl ov01_021FA210
	mov r0, #4
	mov r1, #0x40
	lsl r2, r7, #7
	add r3, r7, #0
	bl ov01_021FC4C4
	add r1, r5, #0
	add r1, #0xfc
	str r0, [r1]
	add r0, r5, #0
	bl ov01_021F9C24
	ldr r1, [sp, #0x18]
	add r0, r5, #0
	bl ov01_021FA218
	ldr r1, [sp, #0x18]
	add r0, r5, #0
	sub r1, r7, r1
	bl ov01_021FA220
	ldr r0, [sp, #0x1c]
	mov r1, #4
	bl sub_02025780
	add r1, r0, #0
	add r0, r5, #0
	bl ov01_021FA1EC
	add r0, r5, #0
	bl ov01_021F9D48
	ldr r1, [sp, #0x20]
	add r0, r5, #0
	bl ov01_021FA228
	ldr r2, [sp, #0x1c]
	ldr r1, [sp, #0x20]
	add r0, r5, #0
	sub r1, r2, r1
	bl ov01_021FA230
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov01_021F9808

	thumb_func_start ov01_021F9890
ov01_021F9890: ; 0x021F9890
	push {r4, lr}
	add r4, r0, #0
	add r0, #0xf8
	ldr r0, [r0]
	bl ov01_021FC520
	add r0, r4, #0
	add r0, #0xfc
	ldr r0, [r0]
	bl ov01_021FC520
	add r0, r4, #0
	bl ov01_021FA1F4
	bl sub_020257C4
	pop {r4, pc}
	.balign 4, 0
_021F98B4:
	ldrh r3, [r2]
	cmp r3, r0
	bne _021F98BE
	add r0, r2, #0
	bx lr
_021F98BE:
	add r2, r2, #4
	ldrh r3, [r2]
	cmp r3, r1
	bne _021F98B4
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov01_021F9890

	thumb_func_start ov01_021F98CC
ov01_021F98CC: ; 0x021F98CC
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	add r4, r2, #0
	add r5, r0, #0
	add r0, r6, #0
	add r1, r4, #0
	add r7, r3, #0
	bl ov01_021FC5B8
	cmp r0, #1
	bne _021F98E6
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021F98E6:
	ldr r2, [sp, #0x18]
	add r0, r4, #0
	add r1, r7, #0
	bl _021F98B4
	add r7, r0, #0
	bne _021F98F8
	bl GF_AssertFail
_021F98F8:
	mov r0, #0x41
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl FldObjSys_GetMModelNarc
	add r2, r0, #0
	mov r0, #0
	str r0, [sp]
	ldrh r3, [r7, #2]
	add r0, r6, #0
	add r1, r4, #0
	bl ov01_021FC5CC
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_021F98CC

	thumb_func_start ov01_021F9918
ov01_021F9918: ; 0x021F9918
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, #0xf0
	add r4, r2, #0
	add r6, r1, #0
	ldr r0, [r0]
	add r1, r4, #0
	bl sub_020257E8
	cmp r0, #0
	bne _021F9932
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F9932:
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_021FA524
	cmp r0, #0
	beq _021F9942
	mov r0, #1
	pop {r4, r5, r6, pc}
_021F9942:
	add r0, r4, #0
	bl GetMoveModelNoBySpriteId
	add r2, r0, #0
	bpl _021F9950
	mov r0, #2
	pop {r4, r5, r6, pc}
_021F9950:
	add r0, r5, #0
	add r1, r4, #0
	add r3, r6, #0
	bl ov01_021FA470
	cmp r0, #1
	bne _021F9962
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F9962:
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov01_021F9918

	thumb_func_start ov01_021F9968
ov01_021F9968: ; 0x021F9968
	ldr r3, _021F9970 ; =ov01_021F9918
	add r2, r1, #0
	mov r1, #0
	bx r3
	.balign 4, 0
_021F9970: .word ov01_021F9918
	thumb_func_end ov01_021F9968

	thumb_func_start ov01_021F9974
ov01_021F9974: ; 0x021F9974
	ldr r3, _021F997C ; =ov01_021F9918
	add r2, r1, #0
	mov r1, #1
	bx r3
	.balign 4, 0
_021F997C: .word ov01_021F9918
	thumb_func_end ov01_021F9974

	thumb_func_start ov01_021F9980
ov01_021F9980: ; 0x021F9980
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r1, [r4]
	ldr r0, _021F99A0 ; =0x0000FFFF
	cmp r1, r0
	beq _021F999E
	add r6, r0, #0
_021F9990:
	add r0, r5, #0
	bl ov01_021F9968
	add r4, r4, #4
	ldr r1, [r4]
	cmp r1, r6
	bne _021F9990
_021F999E:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021F99A0: .word 0x0000FFFF
	thumb_func_end ov01_021F9980

	thumb_func_start ov01_021F99A4
ov01_021F99A4: ; 0x021F99A4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov01_021FA1DC
	ldr r0, _021F99CC ; =ov01_02207294
	add r1, r5, #0
	str r0, [sp]
	add r1, #0xf8
	ldr r1, [r1]
	add r0, r5, #0
	add r2, r4, #0
	mov r3, #0xff
	bl ov01_021F98CC
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_021F9B10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021F99CC: .word ov01_02207294
	thumb_func_end ov01_021F99A4

	thumb_func_start ov01_021F99D0
ov01_021F99D0: ; 0x021F99D0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov01_021FA1DC
	ldr r0, _021F99F8 ; =ov01_02207294
	add r1, r5, #0
	str r0, [sp]
	add r1, #0xf8
	ldr r1, [r1]
	add r0, r5, #0
	add r2, r4, #0
	mov r3, #0xff
	bl ov01_021F98CC
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_021F9B54
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021F99F8: .word ov01_02207294
	thumb_func_end ov01_021F99D0

	thumb_func_start ov01_021F99FC
ov01_021F99FC: ; 0x021F99FC
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldr r1, [r4]
	add r5, r0, #0
	cmp r1, #0xff
	beq _021F9A16
_021F9A08:
	add r0, r5, #0
	bl ov01_021F99A4
	add r4, r4, #4
	ldr r1, [r4]
	cmp r1, #0xff
	bne _021F9A08
_021F9A16:
	pop {r3, r4, r5, pc}
	thumb_func_end ov01_021F99FC

	thumb_func_start ov01_021F9A18
ov01_021F9A18: ; 0x021F9A18
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov01_021FA1E4
	ldr r0, _021F9A40 ; =ov01_022072CC
	add r1, r5, #0
	str r0, [sp]
	add r1, #0xfc
	ldr r1, [r1]
	add r0, r5, #0
	add r2, r4, #0
	mov r3, #0xff
	bl ov01_021F98CC
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_021F9C34
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021F9A40: .word ov01_022072CC
	thumb_func_end ov01_021F9A18

	thumb_func_start ov01_021F9A44
ov01_021F9A44: ; 0x021F9A44
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov01_021FA1E4
	ldr r0, _021F9A6C ; =ov01_022072CC
	add r1, r5, #0
	str r0, [sp]
	add r1, #0xfc
	ldr r1, [r1]
	add r0, r5, #0
	add r2, r4, #0
	mov r3, #0xff
	bl ov01_021F98CC
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_021F9C78
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021F9A6C: .word ov01_022072CC
	thumb_func_end ov01_021F9A44

	thumb_func_start ov01_021F9A70
ov01_021F9A70: ; 0x021F9A70
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldr r1, [r4]
	add r5, r0, #0
	cmp r1, #0xff
	beq _021F9A8A
_021F9A7C:
	add r0, r5, #0
	bl ov01_021F9A18
	add r4, r4, #4
	ldr r1, [r4]
	cmp r1, #0xff
	bne _021F9A7C
_021F9A8A:
	pop {r3, r4, r5, pc}
	thumb_func_end ov01_021F9A70

	thumb_func_start ov01_021F9A8C
ov01_021F9A8C: ; 0x021F9A8C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r2, #0
	add r6, r3, #0
	bl ov01_021F9980
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_021F99FC
	add r0, r5, #0
	add r1, r6, #0
	bl ov01_021F9A70
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021F9AAC:
	stmia r0!, {r1}
	sub r2, r2, #1
	bne _021F9AAC
	bx lr
	thumb_func_end ov01_021F9A8C

	thumb_func_start ov01_021F9AB4
ov01_021F9AB4: ; 0x021F9AB4
	push {r3, r4}
_021F9AB6:
	ldr r4, [r0]
	cmp r4, r2
	bne _021F9AC4
	str r1, [r0]
	mov r0, #1
	pop {r3, r4}
	bx lr
_021F9AC4:
	add r0, r0, #4
	sub r3, r3, #1
	bne _021F9AB6
	mov r0, #0
	pop {r3, r4}
	bx lr
	thumb_func_end ov01_021F9AB4
_021F9AD0:
	ldr r3, [r0]
	cmp r3, r1
	bne _021F9ADA
	mov r0, #1
	bx lr
_021F9ADA:
	add r0, r0, #4
	sub r2, r2, #1
	bne _021F9AD0
	mov r0, #0
	bx lr

	thumb_func_start ov01_021F9AE4
ov01_021F9AE4: ; 0x021F9AE4
	push {r3, r4}
_021F9AE6:
	ldr r4, [r0]
	cmp r4, r1
	bne _021F9AF4
	str r2, [r0]
	mov r0, #1
	pop {r3, r4}
	bx lr
_021F9AF4:
	add r0, r0, #4
	sub r3, r3, #1
	bne _021F9AE6
	mov r0, #0
	pop {r3, r4}
	bx lr
	thumb_func_end ov01_021F9AE4

	thumb_func_start ov01_021F9B00
ov01_021F9B00: ; 0x021F9B00
	push {r3, lr}
	bl ov01_021FA200
	mov r1, #0xff
	mov r2, #8
	bl _021F9AAC
	pop {r3, pc}
	thumb_func_end ov01_021F9B00

	thumb_func_start ov01_021F9B10
ov01_021F9B10: ; 0x021F9B10
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov01_021FA20C
	add r6, r0, #0
	add r0, r5, #0
	bl ov01_021FA200
	add r1, r4, #0
	mov r2, #0xff
	add r3, r6, #0
	bl ov01_021F9AB4
	cmp r0, #0
	bne _021F9B34
	bl GF_AssertFail
_021F9B34:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov01_021F9B10

	thumb_func_start ov01_021F9B38
ov01_021F9B38: ; 0x021F9B38
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov01_021FA20C
	add r6, r0, #0
	add r0, r5, #0
	bl ov01_021FA200
	add r1, r4, #0
	add r2, r6, #0
	bl _021F9AD0
	pop {r4, r5, r6, pc}
	thumb_func_end ov01_021F9B38

	thumb_func_start ov01_021F9B54
ov01_021F9B54: ; 0x021F9B54
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r7, r1, #0
	bl ov01_021FA200
	add r6, r0, #0
	add r0, r5, #0
	bl ov01_021FA20C
	lsl r4, r0, #2
	add r0, r5, #0
	bl ov01_021FA214
	add r3, r0, #0
	add r0, r6, r4
	add r1, r7, #0
	mov r2, #0xff
	bl ov01_021F9AB4
	cmp r0, #0
	bne _021F9B82
	bl GF_AssertFail
_021F9B82:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov01_021F9B54

	thumb_func_start ov01_021F9B84
ov01_021F9B84: ; 0x021F9B84
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r7, r1, #0
	bl ov01_021FA200
	add r6, r0, #0
	add r0, r5, #0
	bl ov01_021FA20C
	lsl r4, r0, #2
	add r0, r5, #0
	bl ov01_021FA214
	add r2, r0, #0
	add r0, r6, r4
	add r1, r7, #0
	bl _021F9AD0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_021F9B84

	thumb_func_start ov01_021F9BAC
ov01_021F9BAC: ; 0x021F9BAC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r7, r1, #0
	bl ov01_021FA200
	add r6, r0, #0
	add r0, r5, #0
	bl ov01_021FA20C
	lsl r4, r0, #2
	add r0, r5, #0
	bl ov01_021FA214
	add r3, r0, #0
	add r0, r6, r4
	add r1, r7, #0
	mov r2, #0xff
	bl ov01_021F9AE4
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov01_021F9BAC

	thumb_func_start ov01_021F9BD4
ov01_021F9BD4: ; 0x021F9BD4
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	add r7, r0, #0
	add r0, r6, #0
	bl ov01_021FA1DC
	add r0, r6, #0
	bl ov01_021FA200
	add r4, r0, #0
	add r0, r6, #0
	bl ov01_021FA20C
	lsl r0, r0, #2
	add r5, r4, r0
	add r0, r6, #0
	bl ov01_021FA214
	add r4, r0, #0
_021F9BFA:
	ldr r1, [r5]
	cmp r1, #0xff
	beq _021F9C1C
	add r0, r7, #0
	mov r2, #0
	bl ov01_021FA01C
	cmp r0, #0
	bne _021F9C1C
	add r0, r6, #0
	add r0, #0xf8
	ldr r0, [r0]
	ldr r1, [r5]
	bl ov01_021FC588
	mov r0, #0xff
	str r0, [r5]
_021F9C1C:
	add r5, r5, #4
	sub r4, r4, #1
	bne _021F9BFA
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov01_021F9BD4

	thumb_func_start ov01_021F9C24
ov01_021F9C24: ; 0x021F9C24
	push {r3, lr}
	bl ov01_021FA204
	mov r1, #0xff
	mov r2, #8
	bl _021F9AAC
	pop {r3, pc}
	thumb_func_end ov01_021F9C24

	thumb_func_start ov01_021F9C34
ov01_021F9C34: ; 0x021F9C34
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov01_021FA21C
	add r6, r0, #0
	add r0, r5, #0
	bl ov01_021FA204
	add r1, r4, #0
	mov r2, #0xff
	add r3, r6, #0
	bl ov01_021F9AB4
	cmp r0, #0
	bne _021F9C58
	bl GF_AssertFail
_021F9C58:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov01_021F9C34

	thumb_func_start ov01_021F9C5C
ov01_021F9C5C: ; 0x021F9C5C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov01_021FA21C
	add r6, r0, #0
	add r0, r5, #0
	bl ov01_021FA204
	add r1, r4, #0
	add r2, r6, #0
	bl _021F9AD0
	pop {r4, r5, r6, pc}
	thumb_func_end ov01_021F9C5C

	thumb_func_start ov01_021F9C78
ov01_021F9C78: ; 0x021F9C78
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r7, r1, #0
	bl ov01_021FA204
	add r6, r0, #0
	add r0, r5, #0
	bl ov01_021FA21C
	lsl r4, r0, #2
	add r0, r5, #0
	bl ov01_021FA224
	add r3, r0, #0
	add r0, r6, r4
	add r1, r7, #0
	mov r2, #0xff
	bl ov01_021F9AB4
	cmp r0, #0
	bne _021F9CA6
	bl GF_AssertFail
_021F9CA6:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov01_021F9C78

	thumb_func_start ov01_021F9CA8
ov01_021F9CA8: ; 0x021F9CA8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r7, r1, #0
	bl ov01_021FA204
	add r6, r0, #0
	add r0, r5, #0
	bl ov01_021FA21C
	lsl r4, r0, #2
	add r0, r5, #0
	bl ov01_021FA224
	add r2, r0, #0
	add r0, r6, r4
	add r1, r7, #0
	bl _021F9AD0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_021F9CA8

	thumb_func_start ov01_021F9CD0
ov01_021F9CD0: ; 0x021F9CD0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r7, r1, #0
	bl ov01_021FA204
	add r6, r0, #0
	add r0, r5, #0
	bl ov01_021FA21C
	lsl r4, r0, #2
	add r0, r5, #0
	bl ov01_021FA224
	add r3, r0, #0
	add r0, r6, r4
	add r1, r7, #0
	mov r2, #0xff
	bl ov01_021F9AE4
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov01_021F9CD0

	thumb_func_start ov01_021F9CF8
ov01_021F9CF8: ; 0x021F9CF8
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	add r7, r0, #0
	add r0, r6, #0
	bl ov01_021FA1E4
	add r0, r6, #0
	bl ov01_021FA204
	add r4, r0, #0
	add r0, r6, #0
	bl ov01_021FA21C
	lsl r0, r0, #2
	add r5, r4, r0
	add r0, r6, #0
	bl ov01_021FA224
	add r4, r0, #0
_021F9D1E:
	ldr r1, [r5]
	cmp r1, #0xff
	beq _021F9D40
	add r0, r7, #0
	mov r2, #0
	bl ov01_021FA094
	cmp r0, #0
	bne _021F9D40
	add r0, r6, #0
	add r0, #0xfc
	ldr r0, [r0]
	ldr r1, [r5]
	bl ov01_021FC588
	mov r0, #0xff
	str r0, [r5]
_021F9D40:
	add r5, r5, #4
	sub r4, r4, #1
	bne _021F9D1E
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov01_021F9CF8

	thumb_func_start ov01_021F9D48
ov01_021F9D48: ; 0x021F9D48
	push {r3, lr}
	bl ov01_021FA1FC
	ldr r1, _021F9D58 ; =0x0000FFFF
	mov r2, #0x20
	bl _021F9AAC
	pop {r3, pc}
	.balign 4, 0
_021F9D58: .word 0x0000FFFF
	thumb_func_end ov01_021F9D48

	thumb_func_start ov01_021F9D5C
ov01_021F9D5C: ; 0x021F9D5C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov01_021FA22C
	add r6, r0, #0
	add r0, r5, #0
	bl ov01_021FA1FC
	ldr r2, _021F9D84 ; =0x0000FFFF
	add r1, r4, #0
	add r3, r6, #0
	bl ov01_021F9AB4
	cmp r0, #0
	bne _021F9D80
	bl GF_AssertFail
_021F9D80:
	pop {r4, r5, r6, pc}
	nop
_021F9D84: .word 0x0000FFFF
	thumb_func_end ov01_021F9D5C

	thumb_func_start ov01_021F9D88
ov01_021F9D88: ; 0x021F9D88
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov01_021FA22C
	add r6, r0, #0
	add r0, r5, #0
	bl ov01_021FA1FC
	add r1, r4, #0
	add r2, r6, #0
	bl _021F9AD0
	pop {r4, r5, r6, pc}
	thumb_func_end ov01_021F9D88

	thumb_func_start ov01_021F9DA4
ov01_021F9DA4: ; 0x021F9DA4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov01_021F9D88
	cmp r0, #1
	bne _021F9DB6
	mov r0, #1
	pop {r3, r4, r5, pc}
_021F9DB6:
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_021F9E9C
	cmp r0, #1
	bne _021F9DC6
	mov r0, #2
	pop {r3, r4, r5, pc}
_021F9DC6:
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_021FA524
	pop {r3, r4, r5, pc}
	thumb_func_end ov01_021F9DA4

	thumb_func_start ov01_021F9DD0
ov01_021F9DD0: ; 0x021F9DD0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r7, r1, #0
	bl ov01_021FA1FC
	add r6, r0, #0
	add r0, r5, #0
	bl ov01_021FA22C
	lsl r4, r0, #2
	add r0, r5, #0
	bl ov01_021FA234
	add r3, r0, #0
	ldr r2, _021F9E00 ; =0x0000FFFF
	add r0, r6, r4
	add r1, r7, #0
	bl ov01_021F9AB4
	cmp r0, #0
	bne _021F9DFE
	bl GF_AssertFail
_021F9DFE:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021F9E00: .word 0x0000FFFF
	thumb_func_end ov01_021F9DD0

	thumb_func_start ov01_021F9E04
ov01_021F9E04: ; 0x021F9E04
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r7, r1, #0
	bl ov01_021FA1FC
	add r6, r0, #0
	add r0, r5, #0
	bl ov01_021FA22C
	lsl r4, r0, #2
	add r0, r5, #0
	bl ov01_021FA234
	add r3, r0, #0
	ldr r2, _021F9E2C ; =0x0000FFFF
	add r0, r6, r4
	add r1, r7, #0
	bl ov01_021F9AE4
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021F9E2C: .word 0x0000FFFF
	thumb_func_end ov01_021F9E04

	thumb_func_start ov01_021F9E30
ov01_021F9E30: ; 0x021F9E30
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r6, r1, #0
	str r0, [sp]
	add r0, r6, #0
	bl ov01_021FA1F4
	str r0, [sp, #4]
	add r0, r6, #0
	bl ov01_021FA1FC
	add r4, r0, #0
	add r0, r6, #0
	bl ov01_021FA22C
	lsl r0, r0, #2
	add r5, r4, r0
	add r0, r6, #0
	bl ov01_021FA234
	add r7, r0, #0
_021F9E5A:
	ldr r4, [r5]
	ldr r0, _021F9E98 ; =0x0000FFFF
	cmp r4, r0
	beq _021F9E8C
	ldr r0, [sp]
	add r1, r4, #0
	mov r2, #0
	bl ov01_021F9FCC
	cmp r0, #0
	bne _021F9E8C
	ldr r0, [sp, #4]
	add r1, r4, #0
	bl sub_020258E0
	add r0, r6, #0
	add r1, r4, #0
	bl ov01_021FA4F0
	add r0, r6, #0
	add r1, r4, #0
	bl ov01_021FA6A4
	ldr r0, _021F9E98 ; =0x0000FFFF
	str r0, [r5]
_021F9E8C:
	add r5, r5, #4
	sub r7, r7, #1
	bne _021F9E5A
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F9E98: .word 0x0000FFFF
	thumb_func_end ov01_021F9E30

	thumb_func_start ov01_021F9E9C
ov01_021F9E9C: ; 0x021F9E9C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r7, r1, #0
	bl ov01_021FA1FC
	add r6, r0, #0
	add r0, r5, #0
	bl ov01_021FA22C
	lsl r4, r0, #2
	add r0, r5, #0
	bl ov01_021FA234
	add r2, r0, #0
	add r0, r6, r4
	add r1, r7, #0
	bl _021F9AD0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_021F9E9C

	thumb_func_start ov01_021F9EC4
ov01_021F9EC4: ; 0x021F9EC4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov01_021F9D88
	cmp r0, #1
	bne _021F9ED6
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F9ED6:
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_021F9E9C
	cmp r0, #1
	bne _021F9EE6
	mov r0, #1
	pop {r3, r4, r5, pc}
_021F9EE6:
	mov r0, #2
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021F9EC4

	thumb_func_start ov01_021F9EEC
ov01_021F9EEC: ; 0x021F9EEC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov01_021F9B38
	cmp r0, #1
	bne _021F9EFE
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F9EFE:
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_021F9B84
	cmp r0, #1
	bne _021F9F0E
	mov r0, #1
	pop {r3, r4, r5, pc}
_021F9F0E:
	mov r0, #2
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021F9EEC

	thumb_func_start ov01_021F9F14
ov01_021F9F14: ; 0x021F9F14
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov01_021F9C5C
	cmp r0, #1
	bne _021F9F26
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F9F26:
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_021F9CA8
	cmp r0, #1
	bne _021F9F36
	mov r0, #1
	pop {r3, r4, r5, pc}
_021F9F36:
	mov r0, #2
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021F9F14

	thumb_func_start ov01_021F9F3C
ov01_021F9F3C: ; 0x021F9F3C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov01_021F9DA4
	cmp r0, #0
	bne _021F9F52
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_021F9974
_021F9F52:
	pop {r3, r4, r5, pc}
	thumb_func_end ov01_021F9F3C

	thumb_func_start ov01_021F9F54
ov01_021F9F54: ; 0x021F9F54
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov01_021F9EEC
	cmp r0, #2
	bne _021F9F6A
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_021F99D0
_021F9F6A:
	pop {r3, r4, r5, pc}
	thumb_func_end ov01_021F9F54

	thumb_func_start ov01_021F9F6C
ov01_021F9F6C: ; 0x021F9F6C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov01_021F9F14
	cmp r0, #2
	bne _021F9F82
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_021F9A44
_021F9F82:
	pop {r3, r4, r5, pc}
	thumb_func_end ov01_021F9F6C

	thumb_func_start ov01_021F9F84
ov01_021F9F84: ; 0x021F9F84
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	bl ov01_021FA28C
	add r1, r0, #0
	add r0, r5, #0
	bl ov01_021F9F54
	add r0, r4, #0
	bl ov01_021FA2A0
	add r1, r0, #0
	add r0, r5, #0
	bl ov01_021F9F6C
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_021F9F3C
	pop {r3, r4, r5, pc}
	thumb_func_end ov01_021F9F84

	thumb_func_start ov01_021F9FB0
ov01_021F9FB0: ; 0x021F9FB0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov01_021F9BD4
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_021F9CF8
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_021F9E30
	pop {r3, r4, r5, pc}
	thumb_func_end ov01_021F9FB0

	thumb_func_start ov01_021F9FCC
ov01_021F9FCC: ; 0x021F9FCC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r1, #0
	mov r1, #0
	add r4, r2, #0
	str r1, [sp, #4]
	str r1, [sp]
	add r1, sp, #0
	add r2, sp, #4
	mov r3, #1
	add r6, r0, #0
	bl sub_0205EEF4
	cmp r0, #1
	bne _021FA016
	add r7, sp, #0
_021F9FEC:
	cmp r4, #0
	beq _021F9FF6
	ldr r0, [sp]
	cmp r4, r0
	beq _021FA006
_021F9FF6:
	ldr r0, [sp]
	bl MapObject_GetGfxID
	cmp r0, r5
	bne _021FA006
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021FA006:
	add r0, r6, #0
	add r1, r7, #0
	add r2, sp, #4
	mov r3, #1
	bl sub_0205EEF4
	cmp r0, #1
	beq _021F9FEC
_021FA016:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov01_021F9FCC

	thumb_func_start ov01_021FA01C
ov01_021FA01C: ; 0x021FA01C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r6, r1, #0
	mov r1, #0
	add r5, r2, #0
	str r1, [sp, #4]
	str r1, [sp]
	add r1, sp, #0
	add r2, sp, #4
	mov r3, #1
	add r7, r0, #0
	bl sub_0205EEF4
	cmp r0, #1
	bne _021FA088
_021FA03A:
	cmp r5, #0
	beq _021FA044
	ldr r0, [sp]
	cmp r5, r0
	beq _021FA078
_021FA044:
	ldr r0, [sp]
	bl MapObject_GetGfxID
	add r4, r0, #0
	ldr r0, _021FA090 ; =0x0000FFFF
	cmp r4, r0
	beq _021FA078
	ldr r0, [sp]
	bl ov01_021F9318
	ldrh r0, [r0]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1c
	cmp r0, #1
	bne _021FA078
	ldr r0, _021FA090 ; =0x0000FFFF
	cmp r4, r0
	beq _021FA078
	add r0, r4, #0
	bl ov01_021FA28C
	cmp r6, r0
	bne _021FA078
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021FA078:
	add r0, r7, #0
	add r1, sp, #0
	add r2, sp, #4
	mov r3, #1
	bl sub_0205EEF4
	cmp r0, #1
	beq _021FA03A
_021FA088:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021FA090: .word 0x0000FFFF
	thumb_func_end ov01_021FA01C

	thumb_func_start ov01_021FA094
ov01_021FA094: ; 0x021FA094
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r6, r1, #0
	mov r1, #0
	add r5, r2, #0
	str r1, [sp, #4]
	str r1, [sp]
	add r1, sp, #0
	add r2, sp, #4
	mov r3, #1
	add r7, r0, #0
	bl sub_0205EEF4
	cmp r0, #1
	bne _021FA0FE
_021FA0B2:
	cmp r5, #0
	beq _021FA0BC
	ldr r0, [sp]
	cmp r0, r5
	beq _021FA0EE
_021FA0BC:
	ldr r0, _021FA104 ; =0x0000FFFF
	cmp r4, r0
	beq _021FA0EE
	ldr r0, [sp]
	bl ov01_021F9318
	ldrh r0, [r0]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1c
	cmp r0, #1
	bne _021FA0EE
	ldr r0, [sp]
	bl MapObject_GetGfxID
	ldr r1, _021FA104 ; =0x0000FFFF
	add r4, r0, #0
	cmp r4, r1
	beq _021FA0EE
	bl ov01_021FA2A0
	cmp r6, r0
	bne _021FA0EE
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021FA0EE:
	add r0, r7, #0
	add r1, sp, #0
	add r2, sp, #4
	mov r3, #1
	bl sub_0205EEF4
	cmp r0, #1
	beq _021FA0B2
_021FA0FE:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021FA104: .word 0x0000FFFF
	thumb_func_end ov01_021FA094

	thumb_func_start ov01_021FA108
ov01_021FA108: ; 0x021FA108
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r1, #0
	add r6, r0, #0
	add r7, r2, #0
	bl sub_0205F1A0
	add r4, r0, #0
	add r0, r5, #0
	bl ov01_021FA28C
	str r0, [sp]
	ldr r1, [sp]
	add r0, r4, #0
	bl ov01_021F9EEC
	cmp r0, #1
	bne _021FA14E
	ldr r1, [sp]
	add r0, r6, #0
	add r2, r7, #0
	bl ov01_021FA01C
	cmp r0, #0
	bne _021FA14E
	add r0, r4, #0
	add r0, #0xf8
	ldr r0, [r0]
	ldr r1, [sp]
	bl ov01_021FC588
	ldr r1, [sp]
	add r0, r4, #0
	bl ov01_021F9BAC
_021FA14E:
	add r0, r5, #0
	bl ov01_021FA2A0
	str r0, [sp, #4]
	ldr r1, [sp, #4]
	add r0, r4, #0
	bl ov01_021F9F14
	cmp r0, #1
	bne _021FA184
	ldr r1, [sp, #4]
	add r0, r6, #0
	add r2, r7, #0
	bl ov01_021FA094
	cmp r0, #0
	bne _021FA184
	add r0, r4, #0
	add r0, #0xfc
	ldr r0, [r0]
	ldr r1, [sp, #4]
	bl ov01_021FC588
	ldr r1, [sp, #4]
	add r0, r4, #0
	bl ov01_021F9CD0
_021FA184:
	add r0, r4, #0
	add r1, r5, #0
	bl ov01_021F9EC4
	cmp r0, #1
	bne _021FA1C2
	add r0, r6, #0
	add r1, r5, #0
	add r2, r7, #0
	bl ov01_021F9FCC
	cmp r0, #0
	bne _021FA1C2
	add r0, r4, #0
	bl ov01_021FA1F4
	add r1, r5, #0
	bl sub_020258E0
	add r0, r4, #0
	add r1, r5, #0
	bl ov01_021F9E04
	add r0, r4, #0
	add r1, r5, #0
	bl ov01_021FA4F0
	add r0, r4, #0
	add r1, r5, #0
	bl ov01_021FA6A4
_021FA1C2:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_021FA108

	thumb_func_start ov01_021FA1C8
ov01_021FA1C8: ; 0x021FA1C8
	add r0, #0xe0
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end ov01_021FA1C8

	thumb_func_start ov01_021FA1D0
ov01_021FA1D0: ; 0x021FA1D0
	add r0, #0xe0
	ldr r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end ov01_021FA1D0

	thumb_func_start ov01_021FA1D8
ov01_021FA1D8: ; 0x021FA1D8
	str r1, [r0, #4]
	bx lr
	thumb_func_end ov01_021FA1D8

	thumb_func_start ov01_021FA1DC
ov01_021FA1DC: ; 0x021FA1DC
	add r0, #0xe8
	ldr r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end ov01_021FA1DC

	thumb_func_start ov01_021FA1E4
ov01_021FA1E4: ; 0x021FA1E4
	add r0, #0xec
	ldr r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end ov01_021FA1E4

	thumb_func_start ov01_021FA1EC
ov01_021FA1EC: ; 0x021FA1EC
	add r0, #0xf0
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end ov01_021FA1EC

	thumb_func_start ov01_021FA1F4
ov01_021FA1F4: ; 0x021FA1F4
	add r0, #0xf0
	ldr r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end ov01_021FA1F4

	thumb_func_start ov01_021FA1FC
ov01_021FA1FC: ; 0x021FA1FC
	add r0, #0x60
	bx lr
	thumb_func_end ov01_021FA1FC

	thumb_func_start ov01_021FA200
ov01_021FA200: ; 0x021FA200
	add r0, #0x20
	bx lr
	thumb_func_end ov01_021FA200

	thumb_func_start ov01_021FA204
ov01_021FA204: ; 0x021FA204
	add r0, #0x40
	bx lr
	thumb_func_end ov01_021FA204

	thumb_func_start ov01_021FA208
ov01_021FA208: ; 0x021FA208
	str r1, [r0, #8]
	bx lr
	thumb_func_end ov01_021FA208

	thumb_func_start ov01_021FA20C
ov01_021FA20C: ; 0x021FA20C
	ldr r0, [r0, #8]
	bx lr
	thumb_func_end ov01_021FA20C

	thumb_func_start ov01_021FA210
ov01_021FA210: ; 0x021FA210
	str r1, [r0, #0xc]
	bx lr
	thumb_func_end ov01_021FA210

	thumb_func_start ov01_021FA214
ov01_021FA214: ; 0x021FA214
	ldr r0, [r0, #0xc]
	bx lr
	thumb_func_end ov01_021FA214

	thumb_func_start ov01_021FA218
ov01_021FA218: ; 0x021FA218
	str r1, [r0, #0x10]
	bx lr
	thumb_func_end ov01_021FA218

	thumb_func_start ov01_021FA21C
ov01_021FA21C: ; 0x021FA21C
	ldr r0, [r0, #0x10]
	bx lr
	thumb_func_end ov01_021FA21C

	thumb_func_start ov01_021FA220
ov01_021FA220: ; 0x021FA220
	str r1, [r0, #0x14]
	bx lr
	thumb_func_end ov01_021FA220

	thumb_func_start ov01_021FA224
ov01_021FA224: ; 0x021FA224
	ldr r0, [r0, #0x14]
	bx lr
	thumb_func_end ov01_021FA224

	thumb_func_start ov01_021FA228
ov01_021FA228: ; 0x021FA228
	str r1, [r0, #0x18]
	bx lr
	thumb_func_end ov01_021FA228

	thumb_func_start ov01_021FA22C
ov01_021FA22C: ; 0x021FA22C
	ldr r0, [r0, #0x18]
	bx lr
	thumb_func_end ov01_021FA22C

	thumb_func_start ov01_021FA230
ov01_021FA230: ; 0x021FA230
	str r1, [r0, #0x1c]
	bx lr
	thumb_func_end ov01_021FA230

	thumb_func_start ov01_021FA234
ov01_021FA234: ; 0x021FA234
	ldr r0, [r0, #0x1c]
	bx lr
	thumb_func_end ov01_021FA234

	thumb_func_start FldObjSys_ReadMModelFromNarc
FldObjSys_ReadMModelFromNarc: ; 0x021FA238
	mov r3, #0x41
	lsl r3, r3, #2
	ldr r0, [r0, r3]
	ldr r3, _021FA244 ; =ReadMModelFromNarcInternal
	bx r3
	nop
_021FA244: .word ReadMModelFromNarcInternal
	thumb_func_end FldObjSys_ReadMModelFromNarc

	thumb_func_start sub_021FA248
sub_021FA248: ; 0x021FA248
	push {r3, lr}
	ldr r3, _021FA280 ; =ov01_022074A8
	ldr r1, _021FA284 ; =0x0000FFFF
_021FA24E:
	ldrh r2, [r3]
	cmp r2, r0
	bne _021FA270
	ldrh r0, [r3, #4]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x1a
	cmp r0, #0xff ; Never eq due to data type limitations
	bne _021FA268
	bne _021FA264
	bl GF_AssertFail
_021FA264:
	ldr r0, _021FA288 ; =ov01_02207318
	pop {r3, pc}
_021FA268:
	ldr r1, _021FA288 ; =ov01_02207318
	lsl r0, r0, #3
	add r0, r1, r0
	pop {r3, pc}
_021FA270:
	add r3, r3, #6
	ldrh r2, [r3]
	cmp r2, r1
	bne _021FA24E
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_021FA280: .word ov01_022074A8
_021FA284: .word 0x0000FFFF
_021FA288: .word ov01_02207318
	thumb_func_end sub_021FA248

	thumb_func_start ov01_021FA28C
ov01_021FA28C: ; 0x021FA28C
	push {r3, lr}
	bl sub_021FA248
	ldrb r0, [r0, #2]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov01_021FA28C

	thumb_func_start ov01_021FA298
ov01_021FA298: ; 0x021FA298
	ldr r3, _021FA29C ; =ov01_021FA28C
	bx r3
	.balign 4, 0
_021FA29C: .word ov01_021FA28C
	thumb_func_end ov01_021FA298

	thumb_func_start ov01_021FA2A0
ov01_021FA2A0: ; 0x021FA2A0
	push {r3, lr}
	bl sub_021FA248
	ldrb r0, [r0, #3]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov01_021FA2A0

	thumb_func_start ov01_021FA2AC
ov01_021FA2AC: ; 0x021FA2AC
	push {r3, lr}
	bl sub_021FA248
	ldr r0, [r0, #4]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov01_021FA2AC

	thumb_func_start ov01_021FA2B8
ov01_021FA2B8: ; 0x021FA2B8
	push {r3, lr}
	cmp r1, #1
	bne _021FA2C8
	mov r1, #1
	lsl r1, r1, #0x16
	bl MapObject_SetBits
	pop {r3, pc}
_021FA2C8:
	mov r1, #1
	lsl r1, r1, #0x16
	bl MapObject_ClearBits
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov01_021FA2B8

	thumb_func_start ov01_021FA2D4
ov01_021FA2D4: ; 0x021FA2D4
	push {r3, lr}
	mov r1, #1
	lsl r1, r1, #0x16
	bl MapObject_GetBitsMask
	cmp r0, #0
	beq _021FA2E6
	mov r0, #1
	pop {r3, pc}
_021FA2E6:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov01_021FA2D4

	thumb_func_start ov01_021FA2EC
ov01_021FA2EC: ; 0x021FA2EC
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	mov r0, #4
	add r4, r1, #0
	str r0, [sp, #4]
	add r0, sp, #0
	str r4, [sp]
	bl sub_020237EC
	add r1, r0, #0
	add r0, r5, #0
	bl ov01_021FA1C8
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_021FA1D8
	add sp, #8
	pop {r3, r4, r5, pc}
	thumb_func_end ov01_021FA2EC

	thumb_func_start ov01_021FA314
ov01_021FA314: ; 0x021FA314
	ldr r3, _021FA318 ; =sub_02023874
	bx r3
	.balign 4, 0
_021FA318: .word sub_02023874
	thumb_func_end ov01_021FA314

	thumb_func_start ov01_021FA31C
ov01_021FA31C: ; 0x021FA31C
	push {r4, lr}
	sub sp, #0x20
	str r0, [sp]
	str r1, [sp, #4]
	ldmia r2!, {r0, r1}
	add r3, sp, #8
	stmia r3!, {r0, r1}
	ldr r0, [r2]
	add r2, sp, #0x14
	str r0, [r3]
	ldr r3, _021FA36C ; =ov01_02208B64
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	add r0, sp, #0
	bl sub_02023D44
	add r4, r0, #0
	beq _021FA364
	mov r1, #0
	bl sub_02023EA4
	add r0, r4, #0
	mov r1, #0
	bl sub_02023EE0
	add r0, r4, #0
	mov r1, #0
	bl sub_02023F40
	add r0, r4, #0
	bl sub_02023F90
	bl ov01_021EA3B0
_021FA364:
	add r0, r4, #0
	add sp, #0x20
	pop {r4, pc}
	nop
_021FA36C: .word ov01_02208B64
	thumb_func_end ov01_021FA31C

	thumb_func_start ov01_021FA370
ov01_021FA370: ; 0x021FA370
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r6, r0, #0
	add r0, r5, #0
	add r4, r2, #0
	bl ov01_021FA28C
	add r1, r0, #0
	add r0, r6, #0
	add r0, #0xf8
	ldr r0, [r0]
	bl ov01_021FC5A4
	str r0, [r4]
	add r0, r5, #0
	bl ov01_021FA2A0
	add r1, r0, #0
	add r0, r6, #0
	add r0, #0xfc
	ldr r0, [r0]
	bl ov01_021FC5A4
	add r1, r4, #0
	add r1, #0xc
	bl sub_02026E18
	add r0, r6, #0
	bl ov01_021FA1F4
	add r1, r5, #0
	bl sub_02025940
	add r6, r0, #0
	bl sub_0202599C
	str r0, [r4, #4]
	add r0, r6, #0
	bl sub_02025A9C
	str r0, [r4, #0x1c]
	add r0, r6, #0
	bl sub_02025AAC
	str r0, [r4, #0x20]
	add r0, r6, #0
	bl sub_02025ABC
	str r0, [r4, #0x24]
	add r0, r5, #0
	bl ov01_021FA2AC
	str r0, [r4, #8]
	pop {r4, r5, r6, pc}
	thumb_func_end ov01_021FA370

	thumb_func_start ov01_021FA3DC
ov01_021FA3DC: ; 0x021FA3DC
	push {r3, lr}
	bl sub_0205F35C
	bl sub_0205F1A0
	pop {r3, pc}
	thumb_func_end ov01_021FA3DC

	thumb_func_start ov01_021FA3E8
ov01_021FA3E8: ; 0x021FA3E8
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r1, sp, #0
	bl ov01_021F93AC
	mov r0, #6
	ldr r1, [sp, #8]
	lsl r0, r0, #0xc
	add r0, r1, r0
	str r0, [sp, #8]
	add r0, r4, #0
	add r1, sp, #0
	bl sub_02023E50
	mov r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov01_021FA3E8

	thumb_func_start ov01_021FA40C
ov01_021FA40C: ; 0x021FA40C
	push {r4, r5, r6, lr}
	mov r4, #1
	add r6, r1, #0
	lsl r1, r4, #9
	add r5, r0, #0
	bl MapObject_TestBits
	cmp r0, #1
	bne _021FA420
	mov r4, #0
_021FA420:
	mov r1, #1
	add r0, r5, #0
	lsl r1, r1, #0xc
	bl MapObject_TestBits
	cmp r0, #1
	bne _021FA43E
	mov r1, #2
	add r0, r5, #0
	lsl r1, r1, #0xc
	bl MapObject_TestBits
	cmp r0, #0
	bne _021FA43E
	mov r4, #0
_021FA43E:
	lsl r1, r4, #0x18
	add r0, r6, #0
	lsr r1, r1, #0x18
	bl sub_02023EA4
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov01_021FA40C

	thumb_func_start ov01_021FA44C
ov01_021FA44C: ; 0x021FA44C
	lsl r1, r0, #2
	ldr r0, _021FA454 ; =ov01_02208B70
	ldr r0, [r0, r1]
	bx lr
	.balign 4, 0
_021FA454: .word ov01_02208B70
	thumb_func_end ov01_021FA44C

	thumb_func_start ov01_021FA458
ov01_021FA458: ; 0x021FA458
	lsl r1, r0, #2
	ldr r0, _021FA460 ; =ov01_02208B80
	ldr r0, [r0, r1]
	bx lr
	.balign 4, 0
_021FA460: .word ov01_02208B80
	thumb_func_end ov01_021FA458

	thumb_func_start ov01_021FA464
ov01_021FA464: ; 0x021FA464
	lsl r1, r0, #2
	ldr r0, _021FA46C ; =ov01_02208B90
	ldr r0, [r0, r1]
	bx lr
	.balign 4, 0
_021FA46C: .word ov01_02208B90
	thumb_func_end ov01_021FA464

	thumb_func_start ov01_021FA470
ov01_021FA470: ; 0x021FA470
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #1
	lsl r0, r0, #8
	ldr r4, [r5, r0]
	mov r0, #4
	add r6, r1, #0
	ldrsh r1, [r4, r0]
	mov r0, #2
	ldrsh r0, [r4, r0]
	add r7, r2, #0
	str r3, [sp]
	cmp r1, r0
	bge _021FA49A
	add r0, r5, #0
	add r0, #0xe0
	ldr r0, [r0]
	bl sub_020238F8
	cmp r0, #1
	bne _021FA4CC
_021FA49A:
	mov r2, #0
	ldrsh r3, [r4, r2]
	ldr r0, [r4, #0xc]
	cmp r3, #0
	ble _021FA4C4
_021FA4A4:
	ldr r1, [r0, #0xc]
	cmp r1, #0
	bne _021FA4BC
	add r5, #0xf0
	ldr r1, [r5]
	str r1, [r0, #0xc]
	ldr r1, [sp]
	str r1, [r0, #8]
	str r6, [r0, #4]
	str r7, [r0]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021FA4BC:
	add r2, r2, #1
	add r0, #0x10
	cmp r2, r3
	blt _021FA4A4
_021FA4C4:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021FA4CC:
	add r0, r5, #0
	add r1, r7, #0
	mov r2, #0
	bl FldObjSys_ReadMModelFromNarc
	add r2, r0, #0
	ldr r3, [sp]
	add r0, r5, #0
	add r1, r6, #0
	bl ov01_021FA61C
	mov r0, #4
	ldrsh r0, [r4, r0]
	add r0, r0, #1
	strh r0, [r4, #4]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_021FA470

	thumb_func_start ov01_021FA4F0
ov01_021FA4F0: ; 0x021FA4F0
	push {r3, r4}
	mov r2, #1
	lsl r2, r2, #8
	ldr r0, [r0, r2]
	mov r3, #0
	ldrsh r4, [r0, r3]
	ldr r2, [r0, #0xc]
	cmp r4, #0
	ble _021FA51E
_021FA502:
	ldr r0, [r2, #4]
	cmp r0, r1
	bne _021FA516
	ldr r0, [r2, #0xc]
	cmp r0, #0
	beq _021FA516
	mov r0, #0
	str r0, [r2, #0xc]
	pop {r3, r4}
	bx lr
_021FA516:
	add r3, r3, #1
	add r2, #0x10
	cmp r3, r4
	blt _021FA502
_021FA51E:
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end ov01_021FA4F0

	thumb_func_start ov01_021FA524
ov01_021FA524: ; 0x021FA524
	push {r3, r4}
	mov r2, #1
	lsl r2, r2, #8
	ldr r0, [r0, r2]
	mov r3, #0
	ldrsh r4, [r0, r3]
	ldr r2, [r0, #0xc]
	cmp r4, #0
	ble _021FA55C
_021FA536:
	ldr r0, [r2, #4]
	cmp r0, r1
	bne _021FA554
	ldr r0, [r2, #0xc]
	cmp r0, #0
	beq _021FA554
	ldr r0, [r2, #8]
	cmp r0, #0
	bne _021FA54E
	mov r0, #3
	pop {r3, r4}
	bx lr
_021FA54E:
	mov r0, #4
	pop {r3, r4}
	bx lr
_021FA554:
	add r3, r3, #1
	add r2, #0x10
	cmp r3, r4
	blt _021FA536
_021FA55C:
	mov r0, #0
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end ov01_021FA524

	thumb_func_start ov01_021FA564
ov01_021FA564: ; 0x021FA564
	push {r3, r4, r5, r6, r7, lr}
	str r1, [sp]
	mov r1, #1
	ldr r0, [sp]
	lsl r1, r1, #8
	ldr r4, [r0, r1]
	add r0, #0xe0
	ldr r0, [r0]
	mov r6, #0
	ldr r5, [r4, #0xc]
	bl sub_020238F8
	cmp r0, #1
	beq _021FA618
	add r7, r4, #4
	b _021FA5AE
_021FA584:
	ldr r0, [r5, #0xc]
	cmp r0, #0
	beq _021FA5AA
	ldr r0, [sp]
	ldr r1, [r5]
	mov r2, #0
	bl FldObjSys_ReadMModelFromNarc
	add r2, r0, #0
	ldr r0, [sp]
	ldr r1, [r5, #4]
	ldr r3, [r5, #8]
	bl ov01_021FA61C
	mov r0, #0
	str r0, [r5, #0xc]
	ldrsh r0, [r7, r0]
	add r0, r0, #1
	strh r0, [r7]
_021FA5AA:
	add r5, #0x10
	add r6, r6, #1
_021FA5AE:
	mov r0, #4
	ldrsh r1, [r4, r0]
	mov r0, #2
	ldrsh r0, [r4, r0]
	cmp r1, r0
	bge _021FA5C2
	mov r0, #0
	ldrsh r0, [r4, r0]
	cmp r6, r0
	blt _021FA584
_021FA5C2:
	mov r6, #0
	ldrsh r0, [r4, r6]
	ldr r7, [r4, #0xc]
	sub r1, r0, #1
	cmp r1, #0
	ble _021FA614
	add r5, r7, #0
_021FA5D0:
	ldr r1, [r5, #0xc]
	cmp r1, #0
	bne _021FA606
	add r2, r6, #1
	cmp r2, r0
	bge _021FA606
	lsl r1, r2, #4
	add r3, r7, r1
_021FA5E0:
	ldr r1, [r3, #0xc]
	cmp r1, #0
	beq _021FA5FE
	lsl r0, r2, #4
	add r3, r7, r0
	mov ip, r3
	add r2, r5, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	mov r1, #0
	mov r0, ip
	str r1, [r0, #0xc]
	b _021FA606
_021FA5FE:
	add r2, r2, #1
	add r3, #0x10
	cmp r2, r0
	blt _021FA5E0
_021FA606:
	mov r0, #0
	ldrsh r0, [r4, r0]
	add r6, r6, #1
	add r5, #0x10
	sub r1, r0, #1
	cmp r6, r1
	blt _021FA5D0
_021FA614:
	mov r0, #0
	strh r0, [r4, #4]
_021FA618:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_021FA564

	thumb_func_start ov01_021FA61C
ov01_021FA61C: ; 0x021FA61C
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	mov r0, #4
	str r0, [sp]
	add r0, r5, #0
	add r0, #0xf0
	add r4, r1, #0
	add r6, r3, #0
	add r1, r2, #0
	ldr r0, [r0]
	add r2, r4, #0
	mov r3, #1
	bl sub_02025844
	cmp r0, #0
	bne _021FA642
	bl GF_AssertFail
_021FA642:
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_021FA668
	cmp r6, #0
	bne _021FA65A
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_021F9D5C
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_021FA65A:
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_021F9DD0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov01_021FA61C

	thumb_func_start ov01_021FA668
ov01_021FA668: ; 0x021FA668
	push {r4, r5, r6, lr}
	mov r3, #1
	lsl r3, r3, #8
	ldr r3, [r0, r3]
	mov r5, #1
	ldr r4, [r3, #0x10]
	mov r2, #0
	strh r5, [r3, #6]
	ldrsh r6, [r3, r2]
	cmp r6, #0
	ble _021FA69C
_021FA67E:
	ldr r5, [r4, #8]
	cmp r5, #0
	bne _021FA694
	add r0, #0xf0
	ldr r0, [r0]
	str r0, [r4, #8]
	str r1, [r4, #4]
	mov r0, #0
	str r0, [r4]
	strh r0, [r3, #6]
	pop {r4, r5, r6, pc}
_021FA694:
	add r2, r2, #1
	add r4, #0xc
	cmp r2, r6
	blt _021FA67E
_021FA69C:
	bl GF_AssertFail
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov01_021FA668

	thumb_func_start ov01_021FA6A4
ov01_021FA6A4: ; 0x021FA6A4
	push {r4, r5}
	mov r2, #1
	lsl r2, r2, #8
	ldr r2, [r0, r2]
	mov r0, #1
	ldr r4, [r2, #0x10]
	mov r3, #0
	strh r0, [r2, #6]
	ldrsh r5, [r2, r3]
	cmp r5, #0
	ble _021FA6D6
_021FA6BA:
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _021FA6CE
	ldr r0, [r4, #4]
	cmp r0, r1
	bne _021FA6CE
	mov r0, #0
	str r0, [r4, #8]
	str r0, [r4]
	b _021FA6D6
_021FA6CE:
	add r3, r3, #1
	add r4, #0xc
	cmp r3, r5
	blt _021FA6BA
_021FA6D6:
	mov r0, #0
	strh r0, [r2, #6]
	pop {r4, r5}
	bx lr
	.balign 4, 0
	thumb_func_end ov01_021FA6A4

	thumb_func_start ov01_021FA6E0
ov01_021FA6E0: ; 0x021FA6E0
	push {r3, r4, r5, r6, r7, lr}
	mov r0, #1
	lsl r0, r0, #8
	ldr r6, [r1, r0]
	ldrh r0, [r6, #6]
	cmp r0, #1
	beq _021FA71A
	mov r4, #0
	ldrsh r0, [r6, r4]
	ldr r5, [r6, #0x10]
	cmp r0, #0
	ble _021FA71A
	mov r7, #1
_021FA6FA:
	ldr r0, [r5]
	cmp r0, #0
	bne _021FA70E
	ldr r0, [r5, #8]
	cmp r0, #0
	beq _021FA70E
	ldr r1, [r5, #4]
	bl sub_020259E0
	str r7, [r5]
_021FA70E:
	mov r0, #0
	ldrsh r0, [r6, r0]
	add r4, r4, #1
	add r5, #0xc
	cmp r4, r0
	blt _021FA6FA
_021FA71A:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov01_021FA6E0

	thumb_func_start ov01_021FA71C
ov01_021FA71C: ; 0x021FA71C
	push {r3, r4, r5, r6, r7, lr}
	mov r0, #1
	lsl r0, r0, #8
	ldr r6, [r1, r0]
	mov r4, #0
	ldr r5, [r6, #0x10]
	mov r0, #1
	strh r0, [r6, #6]
	ldrsh r0, [r6, r4]
	cmp r0, #0
	ble _021FA756
	add r7, r4, #0
_021FA734:
	ldr r0, [r5]
	cmp r0, #1
	bne _021FA74A
	ldr r0, [r5, #8]
	cmp r0, #0
	beq _021FA74A
	ldr r1, [r5, #4]
	bl sub_02025A48
	str r7, [r5]
	str r7, [r5, #8]
_021FA74A:
	mov r0, #0
	ldrsh r0, [r6, r0]
	add r4, r4, #1
	add r5, #0xc
	cmp r4, r0
	blt _021FA734
_021FA756:
	mov r0, #0
	strh r0, [r6, #6]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov01_021FA71C

	thumb_func_start ov01_021FA75C
ov01_021FA75C: ; 0x021FA75C
	push {r4, r5, r6, lr}
	mov r5, #1
	lsl r5, r5, #8
	ldr r5, [r0, r5]
	mov r4, #0
	ldrsh r6, [r5, r4]
	ldr r0, [r5, #8]
	cmp r6, #0
	ble _021FA792
_021FA76E:
	ldr r5, [r0, #4]
	cmp r5, #0
	bne _021FA78A
	str r1, [r0, #4]
	str r2, [r0, #8]
	str r3, [r0]
	ldr r0, [r0, #8]
	mov r2, #0
	str r2, [r0]
	add r0, r1, #0
	mov r1, #1
	bl ov01_021FA2B8
	pop {r4, r5, r6, pc}
_021FA78A:
	add r4, r4, #1
	add r0, #0xc
	cmp r4, r6
	blt _021FA76E
_021FA792:
	bl GF_AssertFail
	pop {r4, r5, r6, pc}
	thumb_func_end ov01_021FA75C

	thumb_func_start ov01_021FA798
ov01_021FA798: ; 0x021FA798
	push {r3, r4}
	mov r2, #1
	lsl r2, r2, #8
	ldr r0, [r0, r2]
	mov r3, #0
	ldrsh r4, [r0, r3]
	ldr r2, [r0, #8]
	cmp r4, #0
	ble _021FA7C2
_021FA7AA:
	ldr r0, [r2, #4]
	cmp r0, r1
	bne _021FA7BA
	mov r0, #0
	str r0, [r2, #4]
	str r0, [r2, #8]
	pop {r3, r4}
	bx lr
_021FA7BA:
	add r3, r3, #1
	add r2, #0xc
	cmp r3, r4
	blt _021FA7AA
_021FA7C2:
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end ov01_021FA798

	thumb_func_start ov01_021FA7C8
ov01_021FA7C8: ; 0x021FA7C8
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	mov r0, #1
	lsl r0, r0, #8
	ldr r6, [r7, r0]
	mov r4, #0
	ldrsh r0, [r6, r4]
	ldr r5, [r6, #8]
	cmp r0, #0
	ble _021FA7F6
_021FA7DC:
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _021FA7EA
	add r0, r7, #0
	add r1, r5, #0
	bl ov01_021FA804
_021FA7EA:
	mov r0, #0
	ldrsh r0, [r6, r0]
	add r4, r4, #1
	add r5, #0xc
	cmp r4, r0
	blt _021FA7DC
_021FA7F6:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov01_021FA7C8

	thumb_func_start ov01_021FA7F8
ov01_021FA7F8: ; 0x021FA7F8
	ldr r3, _021FA800 ; =ov01_021FA7C8
	add r0, r1, #0
	bx r3
	nop
_021FA800: .word ov01_021FA7C8
	thumb_func_end ov01_021FA7F8

	thumb_func_start ov01_021FA804
ov01_021FA804: ; 0x021FA804
	push {r4, lr}
	add r4, r1, #0
	ldr r1, [r4]
	bl ov01_021F9EC4
	cmp r0, #2
	beq _021FA852
	ldr r0, [r4, #4]
	ldr r1, [r4]
	bl ov01_021F9528
	ldr r1, [r4, #8]
	str r0, [r1]
	ldr r0, [r4, #8]
	ldr r0, [r0]
	cmp r0, #0
	bne _021FA82A
	bl GF_AssertFail
_021FA82A:
	ldr r0, [r4, #4]
	mov r1, #0
	bl ov01_021FA2B8
	mov r1, #2
	ldr r0, [r4, #4]
	lsl r1, r1, #0x14
	bl MapObject_TestBits
	cmp r0, #1
	ldr r0, [r4, #4]
	bne _021FA848
	bl sub_0205F4C0
	b _021FA84C
_021FA848:
	bl sub_0205F484
_021FA84C:
	mov r0, #0
	str r0, [r4, #4]
	str r0, [r4, #8]
_021FA852:
	pop {r4, pc}
	thumb_func_end ov01_021FA804

	thumb_func_start ov01_021FA854
ov01_021FA854: ; 0x021FA854
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r6, r1, #0
	add r5, r0, #0
	mov r0, #0xc
	add r7, r6, #0
	mul r7, r0
	lsl r0, r6, #4
	lsl r1, r7, #1
	str r0, [sp, #4]
	add r0, r1, r0
	str r0, [sp, #8]
	add r0, #0x28
	str r0, [sp, #8]
	ldr r1, [sp, #8]
	mov r0, #4
	str r2, [sp]
	bl AllocFromHeap
	add r4, r0, #0
	bne _021FA882
	bl GF_AssertFail
_021FA882:
	ldr r2, [sp, #8]
	add r0, r4, #0
	mov r1, #0
	bl memset
	ldr r0, [sp]
	strh r6, [r4]
	strh r0, [r4, #2]
	add r0, r4, #0
	add r0, #0x28
	str r0, [r4, #8]
	add r1, r0, r7
	ldr r0, [sp, #4]
	str r1, [r4, #0xc]
	add r0, r1, r0
	str r0, [r4, #0x10]
	mov r0, #1
	lsl r0, r0, #8
	str r4, [r5, r0]
	add r0, r0, #4
	ldr r0, [r5, r0]
	bl sub_0205F19C
	add r6, r0, #0
	ldr r0, _021FA8E8 ; =ov01_021FA564
	add r1, r5, #0
	add r2, r6, #1
	bl CreateSysTask
	str r0, [r4, #0x18]
	ldr r0, _021FA8EC ; =ov01_021FA7F8
	add r1, r5, #0
	add r2, r6, #2
	bl CreateSysTask
	str r0, [r4, #0x1c]
	ldr r0, _021FA8F0 ; =ov01_021FA6E0
	add r1, r5, #0
	mov r2, #0xff
	bl sub_0200E33C
	str r0, [r4, #0x20]
	ldr r0, _021FA8F4 ; =ov01_021FA71C
	add r1, r5, #0
	mov r2, #0xff
	bl sub_0200E374
	str r0, [r4, #0x24]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_021FA8E8: .word ov01_021FA564
_021FA8EC: .word ov01_021FA7F8
_021FA8F0: .word ov01_021FA6E0
_021FA8F4: .word ov01_021FA71C
	thumb_func_end ov01_021FA854

	thumb_func_start ov01_021FA8F8
ov01_021FA8F8: ; 0x021FA8F8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #1
	lsl r0, r0, #8
	ldr r4, [r5, r0]
	mov r0, #1
	strh r0, [r4, #6]
	ldr r0, [r4, #0x18]
	bl DestroySysTask
	ldr r0, [r4, #0x1c]
	bl DestroySysTask
	ldr r0, [r4, #0x20]
	bl DestroySysTask
	ldr r0, [r4, #0x24]
	bl DestroySysTask
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #1
	mov r1, #0
	lsl r0, r0, #8
	str r1, [r5, r0]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021FA8F8

	thumb_func_start ov01_021FA930
ov01_021FA930: ; 0x021FA930
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov01_021FA2D4
	cmp r0, #1
	beq _021FA948
	add r0, r5, #0
	bl ov01_021F72DC
	cmp r0, #0
	bne _021FA972
_021FA948:
	add r0, r5, #0
	bl MapObject_GetGfxID
	add r6, r0, #0
	add r0, r5, #0
	bl sub_0205F35C
	add r7, r0, #0
	add r0, r5, #0
	bl sub_0205E420
	add r0, r7, #0
	add r1, r6, #0
	add r2, r5, #0
	bl ov01_021FA108
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205E38C
	pop {r3, r4, r5, r6, r7, pc}
_021FA972:
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_021FA97C
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov01_021FA930

	thumb_func_start ov01_021FA97C
ov01_021FA97C: ; 0x021FA97C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	add r6, r0, #0
	str r1, [sp, #8]
	bl ov01_021FA3DC
	add r7, r0, #0
	bl ov01_021FA1D0
	str r0, [sp, #0x14]
	add r0, r6, #0
	bl ov01_021F72DC
	str r0, [sp, #0x10]
	mov r0, #4
	mov r1, #0x58
	bl AllocFromHeapAtEnd
	mov r1, #0
	mov r2, #0x58
	add r5, r0, #0
	bl memset
	ldr r0, [sp, #8]
	str r0, [r5]
	add r0, r6, #0
	str r6, [r5, #0x50]
	bl MapObject_GetID
	cmp r0, #0xff
	bne _021FA9CE
	add r0, r6, #0
	bl ov01_021F72DC
	bl sub_02023F90
	mov r1, #0
	bl NNS_G3dMdlGetMdlFogEnableFlag
	str r0, [sp, #0x1c]
	b _021FA9D2
_021FA9CE:
	mov r0, #0
	str r0, [sp, #0x1c]
_021FA9D2:
	add r0, r6, #0
	bl MapObject_GetGfxID
	str r0, [sp, #0x18]
	bl ov01_021FA28C
	ldr r4, _021FAB90 ; =ov01_02207294
_021FA9E0:
	ldrh r1, [r4]
	cmp r1, r0
	beq _021FA9EE
	add r4, r4, #4
	ldrh r1, [r4]
	cmp r1, #0xff
	bne _021FA9E0
_021FA9EE:
	cmp r1, #0xff
	bne _021FA9F6
	bl GF_AssertFail
_021FA9F6:
	ldrh r1, [r4, #2]
	add r0, r7, #0
	mov r2, #0
	bl FldObjSys_ReadMModelFromNarc
	str r0, [r5, #8]
	ldr r0, [sp, #0x18]
	bl ov01_021FA2A0
	ldr r4, _021FAB94 ; =ov01_022072CC
_021FAA0A:
	ldrh r1, [r4]
	cmp r1, r0
	beq _021FAA18
	add r4, r4, #4
	ldrh r1, [r4]
	cmp r1, #0xff
	bne _021FAA0A
_021FAA18:
	cmp r1, #0xff
	bne _021FAA20
	bl GF_AssertFail
_021FAA20:
	ldrh r1, [r4, #2]
	add r0, r7, #0
	mov r2, #0
	bl FldObjSys_ReadMModelFromNarc
	add r1, r5, #0
	add r1, #0x14
	str r0, [r5, #0xc]
	bl sub_02026E18
	ldr r0, [sp, #0x18]
	bl GetMoveModelNoBySpriteId
	add r1, r0, #0
	bpl _021FAA44
	bl GF_AssertFail
	mov r1, #0
_021FAA44:
	add r0, r7, #0
	mov r2, #0
	bl FldObjSys_ReadMModelFromNarc
	str r0, [r5, #0x10]
	bl NNS_G3dGetTex
	add r4, r0, #0
	ldr r0, [sp, #0x18]
	bl ov01_021FA2AC
	add r3, r0, #0
	add r0, r5, #0
	add r0, #0x14
	str r0, [sp]
	add r0, r5, #0
	ldr r1, [r5, #8]
	add r0, #0x28
	add r2, r4, #0
	bl sub_02023E2C
	ldr r0, [sp, #0x10]
	bl sub_02023E68
	add r3, r0, #0
	add r2, sp, #0x2c
	ldmia r3!, {r0, r1}
	add r4, r2, #0
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	add r1, r5, #0
	str r0, [r2]
	ldr r0, [sp, #0x14]
	add r1, #0x28
	add r2, r4, #0
	bl ov01_021FA31C
	str r0, [r5, #0x24]
	cmp r0, #0
	bne _021FAA98
	bl GF_AssertFail
_021FAA98:
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	bne _021FAAAA
	ldr r0, [r5, #0x24]
	bl sub_02023F90
	mov r1, #0
	bl NNS_G3dMdlSetMdlFogEnableFlagAll
_021FAAAA:
	ldr r0, [sp, #0x10]
	bl sub_02023EF4
	add r1, r0, #0
	ldr r0, [r5, #0x24]
	bl sub_02023EE0
	ldr r0, [sp, #0x10]
	bl sub_02023F70
	add r1, r0, #0
	ldr r0, [r5, #0x24]
	bl sub_02023F40
	ldr r0, [sp, #0x10]
	bl sub_02023F30
	add r1, r0, #0
	ldr r0, [r5, #0x24]
	bl sub_02023F1C
	ldr r0, [r5, #0x24]
	mov r1, #0
	bl sub_02023F04
	ldr r0, [r5, #0x24]
	mov r1, #1
	bl sub_02023EA4
	ldr r0, [r5, #0x24]
	bl sub_02023FC0
	add r0, r6, #0
	bl sub_0205F870
	cmp r0, #1
	bne _021FAB4A
	add r0, r6, #0
	mov r1, #2
	bl sub_0205F09C
	str r0, [sp, #0xc]
	add r0, r6, #0
	mov r1, #1
	bl sub_02060FA8
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	add r0, r4, #0
	bl sub_0205BA70
	cmp r0, #1
	bne _021FAB18
	mov r4, #2
	b _021FAB28
_021FAB18:
	add r0, r4, #0
	bl sub_0205B984
	cmp r0, #1
	bne _021FAB26
	mov r4, #0
	b _021FAB28
_021FAB26:
	mov r4, #1
_021FAB28:
	add r0, r6, #0
	add r1, sp, #0x20
	bl MapObject_GetPositionVec
	add r0, r6, #0
	bl ov01_021F146C
	ldr r1, [sp, #0xc]
	str r4, [sp]
	str r1, [sp, #4]
	add r1, r5, #0
	ldr r2, [r5, #0x24]
	add r1, #0x28
	add r3, sp, #0x20
	bl ov01_021FDE64
	str r0, [r5, #0x54]
_021FAB4A:
	add r0, r6, #0
	bl sub_0205E420
	mov r0, #0x41
	lsl r0, r0, #2
	ldr r0, [r7, r0]
	ldr r1, [sp, #0x18]
	add r2, r6, #0
	bl ov01_021FA108
	ldr r1, [sp, #8]
	add r0, r6, #0
	bl sub_0205E38C
	mov r0, #0x41
	lsl r0, r0, #2
	ldr r0, [r7, r0]
	bl sub_0205F19C
	ldr r0, _021FAB98 ; =ov01_021FAB9C
	add r1, r5, #0
	mov r2, #0xff
	bl sub_0200E374
	add r4, r0, #0
	bne _021FAB82
	bl GF_AssertFail
_021FAB82:
	add r0, r4, #0
	add r1, r5, #0
	bl ov01_021FAB9C
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021FAB90: .word ov01_02207294
_021FAB94: .word ov01_022072CC
_021FAB98: .word ov01_021FAB9C
	thumb_func_end ov01_021FA97C

	thumb_func_start ov01_021FAB9C
ov01_021FAB9C: ; 0x021FAB9C
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r6, r0, #0
	ldr r0, [r5, #4]
	ldr r4, [r5, #0x50]
	cmp r0, #0
	beq _021FABB0
	cmp r0, #1
	beq _021FAC08
	pop {r4, r5, r6, pc}
_021FABB0:
	add r0, r4, #0
	bl MapObject_IsInUse
	cmp r0, #0
	beq _021FABC4
	add r0, r4, #0
	bl ov01_021FA2D4
	cmp r0, #0
	bne _021FABF4
_021FABC4:
	ldr r0, [r5, #0x54]
	cmp r0, #0
	beq _021FABCE
	bl sub_02068B48
_021FABCE:
	ldr r0, [r5, #0x24]
	bl sub_02023DA4
	ldr r0, [r5, #8]
	bl FreeToHeap
	ldr r0, [r5, #0xc]
	bl FreeToHeap
	ldr r0, [r5, #0x10]
	bl FreeToHeap
	add r0, r5, #0
	bl FreeToHeap
	add r0, r6, #0
	bl DestroySysTask
	pop {r4, r5, r6, pc}
_021FABF4:
	add r0, r4, #0
	bl MapObject_GetGfxID
	ldr r1, [r5]
	cmp r1, r0
	beq _021FAC40
	ldr r0, [r5, #4]
	add r0, r0, #1
	str r0, [r5, #4]
	pop {r4, r5, r6, pc}
_021FAC08:
	add r0, r4, #0
	bl ov01_021FA2D4
	cmp r0, #0
	bne _021FAC40
	ldr r0, [r5, #0x54]
	cmp r0, #0
	beq _021FAC1C
	bl sub_02068B48
_021FAC1C:
	ldr r0, [r5, #0x24]
	bl sub_02023DA4
	ldr r0, [r5, #8]
	bl FreeToHeap
	ldr r0, [r5, #0xc]
	bl FreeToHeap
	ldr r0, [r5, #0x10]
	bl FreeToHeap
	add r0, r5, #0
	bl FreeToHeap
	add r0, r6, #0
	bl DestroySysTask
_021FAC40:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov01_021FAB9C

	.rodata

ov01_02208B64: ; 0x02208B64
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00

ov01_02208B70: ; 0x02208B70
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00

ov01_02208B80: ; 0x02208B80
	.byte 0x04, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00

ov01_02208B90: ; 0x02208B90
	.byte 0x04, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
