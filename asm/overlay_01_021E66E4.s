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

	thumb_func_start ov01_021E66E4
ov01_021E66E4: ; 0x021E66E4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r7, r0, #0
	add r0, r5, #0
	mov r1, #0x14
	add r6, r2, #0
	bl AllocFromHeap
	add r4, r0, #0
	str r7, [r4]
	str r5, [r4, #4]
	mov r0, #0x14
	add r7, r6, #0
	mul r7, r0
	str r6, [r4, #8]
	add r0, r5, #0
	add r1, r7, #0
	bl AllocFromHeap
	str r0, [r4, #0xc]
	ldr r1, [r4, #0xc]
	mov r0, #0
	add r2, r7, #0
	bl MIi_CpuClear32
	add r0, r6, #0
	bl sub_0201F82C
	add r1, r0, #0
	add r0, r5, #0
	bl AllocFromHeap
	str r0, [r4, #0x10]
	ldr r1, [r4, #0x10]
	add r0, r6, #0
	bl sub_0201F834
	str r0, [r4, #0x10]
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov01_021E66E4

	thumb_func_start ov01_021E6734
ov01_021E6734: ; 0x021E6734
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #8]
	mov r6, #0
	cmp r0, #0
	ble _021E6754
	add r4, r6, #0
_021E6742:
	ldr r0, [r5, #0xc]
	add r0, r0, r4
	bl ov01_021E683C
	ldr r0, [r5, #8]
	add r6, r6, #1
	add r4, #0x14
	cmp r6, r0
	blt _021E6742
_021E6754:
	ldr r0, [r5, #0xc]
	bl FreeToHeap
	ldr r0, [r5, #0x10]
	bl FreeToHeap
	add r0, r5, #0
	bl FreeToHeap
	pop {r4, r5, r6, pc}
	thumb_func_end ov01_021E6734

	thumb_func_start ov01_021E6768
ov01_021E6768: ; 0x021E6768
	ldr r3, _021E6770 ; =sub_0201F880
	ldr r0, [r0, #0x10]
	bx r3
	nop
_021E6770: .word sub_0201F880
	thumb_func_end ov01_021E6768

	thumb_func_start ov01_021E6774
ov01_021E6774: ; 0x021E6774
	push {r4, lr}
	add r4, r1, #0
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_0203DF8C
	cmp r0, #0
	beq _021E6796
	ldr r0, [r4, #0xc]
	ldr r3, [r0, #0x10]
	cmp r3, #0
	beq _021E6796
	ldr r1, [r4]
	ldr r2, [r4, #0x10]
	ldr r1, [r1]
	add r0, r4, #0
	blx r3
_021E6796:
	pop {r4, pc}
	thumb_func_end ov01_021E6774

	thumb_func_start ov01_021E6798
ov01_021E6798: ; 0x021E6798
	push {r4, lr}
	add r4, r1, #0
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_0203DF8C
	cmp r0, #0
	beq _021E67BA
	ldr r0, [r4, #0xc]
	ldr r3, [r0, #0x14]
	cmp r3, #0
	beq _021E67BA
	ldr r1, [r4]
	ldr r2, [r4, #0x10]
	ldr r1, [r1]
	add r0, r4, #0
	blx r3
_021E67BA:
	pop {r4, pc}
	thumb_func_end ov01_021E6798

	thumb_func_start ov01_021E67BC
ov01_021E67BC: ; 0x021E67BC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r2, [r5, #8]
	add r6, r1, #0
	mov r1, #0
	ldr r4, [r5, #0xc]
	cmp r2, #0
	ble _021E682C
_021E67CC:
	ldr r0, [r4, #4]
	cmp r0, #0
	bne _021E6824
	ldr r0, _021E6834 ; =ov01_021E6774
	ldr r2, [r6]
	add r1, r4, #0
	bl CreateSysTask
	str r0, [r4, #4]
	ldr r0, [r5, #0x10]
	ldr r1, _021E6838 ; =ov01_021E6798
	ldr r3, [r6]
	add r2, r4, #0
	bl sub_0201F8C0
	str r0, [r4, #8]
	str r5, [r4]
	str r6, [r4, #0xc]
	ldr r0, [r4, #4]
	cmp r0, #0
	bne _021E67FA
	bl GF_AssertFail
_021E67FA:
	ldr r0, [r4, #8]
	cmp r0, #0
	bne _021E6804
	bl GF_AssertFail
_021E6804:
	ldrh r1, [r6, #4]
	cmp r1, #0
	beq _021E6812
	ldr r0, [r5, #4]
	bl AllocFromHeap
	str r0, [r4, #0x10]
_021E6812:
	ldr r3, [r6, #8]
	cmp r3, #0
	beq _021E6820
	ldr r1, [r5]
	ldr r2, [r4, #0x10]
	add r0, r4, #0
	blx r3
_021E6820:
	add r0, r4, #0
	pop {r4, r5, r6, pc}
_021E6824:
	add r1, r1, #1
	add r4, #0x14
	cmp r1, r2
	blt _021E67CC
_021E682C:
	bl GF_AssertFail
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021E6834: .word ov01_021E6774
_021E6838: .word ov01_021E6798
	thumb_func_end ov01_021E67BC

	thumb_func_start ov01_021E683C
ov01_021E683C: ; 0x021E683C
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	beq _021E687A
	ldr r1, [r4, #0xc]
	ldr r3, [r1, #0xc]
	cmp r3, #0
	beq _021E6856
	ldr r1, [r4]
	ldr r2, [r4, #0x10]
	ldr r1, [r1]
	blx r3
_021E6856:
	ldr r0, [r4, #0xc]
	ldrh r0, [r0, #4]
	cmp r0, #0
	beq _021E6864
	ldr r0, [r4, #0x10]
	bl FreeToHeap
_021E6864:
	ldr r0, [r4, #4]
	bl DestroySysTask
	ldr r0, [r4, #8]
	bl DestroySysTask
	mov r0, #0
	add r1, r4, #0
	mov r2, #0x14
	bl MIi_CpuClear32
_021E687A:
	pop {r4, pc}
	thumb_func_end ov01_021E683C

	thumb_func_start ov01_021E687C
ov01_021E687C: ; 0x021E687C
	ldr r0, [r0, #0x10]
	bx lr
	thumb_func_end ov01_021E687C
