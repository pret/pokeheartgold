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

	thumb_func_start ov01_021F4464
ov01_021F4464: ; 0x021F4464
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _021F44AC ; =ov01_021F4544
	ldr r3, [r5, #0x28]
	mov r1, #0x38
	mov r2, #5
	bl sub_02007200
	add r6, r0, #0
	bl sub_0201F988
	add r4, r0, #0
	add r2, r4, #4
	mov r3, #5
_021F4480:
	ldmia r5!, {r0, r1}
	stmia r2!, {r0, r1}
	sub r3, r3, #1
	bne _021F4480
	ldr r0, [r5]
	str r0, [r2]
	str r6, [r4, #0x34]
	mov r0, #0
	str r0, [r4, #0x30]
	bl GX_GetBankForLCDC
	str r0, [r4]
	add r0, r4, #4
	bl ov01_021F45E4
	ldr r0, _021F44B0 ; =ov01_021F4584
	add r1, r4, #0
	mov r2, #0
	bl sub_0200E374
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021F44AC: .word ov01_021F4544
_021F44B0: .word ov01_021F4584
	thumb_func_end ov01_021F4464

	thumb_func_start ov01_021F44B4
ov01_021F44B4: ; 0x021F44B4
	push {r4, lr}
	add r4, r0, #0
	add r0, r1, #0
	add r1, r2, #0
	add r2, r3, #0
	bl GX_SetGraphicsMode
	ldr r0, [r4]
	ldr r0, [r0]
	bl GX_SetBankForLCDC
	ldr r0, [r4]
	ldr r0, [r0, #4]
	cmp r0, #0xa
	bgt _021F44E4
	bge _021F4508
	cmp r0, #6
	bgt _021F4524
	cmp r0, #2
	blt _021F4524
	beq _021F44EA
	cmp r0, #6
	beq _021F44FA
	b _021F4524
_021F44E4:
	cmp r0, #0xe
	beq _021F4516
	b _021F4524
_021F44EA:
	mov r1, #0x1a
	mov r2, #2
	mov r0, #0
	lsl r1, r1, #0x16
	lsl r2, r2, #0x10
	bl MIi_CpuClearFast
	b _021F452A
_021F44FA:
	mov r2, #2
	ldr r1, _021F4538 ; =0x06820000
	mov r0, #0
	lsl r2, r2, #0x10
	bl MIi_CpuClearFast
	b _021F452A
_021F4508:
	mov r2, #2
	ldr r1, _021F453C ; =0x06840000
	mov r0, #0
	lsl r2, r2, #0x10
	bl MIi_CpuClearFast
	b _021F452A
_021F4516:
	mov r2, #2
	ldr r1, _021F4540 ; =0x06860000
	mov r0, #0
	lsl r2, r2, #0x10
	bl MIi_CpuClearFast
	b _021F452A
_021F4524:
	mov r0, #0
	bl GX_SetBankForLCDC
_021F452A:
	ldr r0, [r4]
	ldr r0, [r0, #0x34]
	bl sub_02007234
	mov r0, #0
	str r0, [r4]
	pop {r4, pc}
	.balign 4, 0
_021F4538: .word 0x06820000
_021F453C: .word 0x06840000
_021F4540: .word 0x06860000
	thumb_func_end ov01_021F44B4

	thumb_func_start ov01_021F4544
ov01_021F4544: ; 0x021F4544
	push {r4, r5, r6, r7}
	ldr r0, [r1, #0x30]
	cmp r0, #0
	beq _021F457C
	ldr r6, [r1, #0x20]
	ldr r5, [r1, #0x10]
	ldr r4, [r1, #0x1c]
	ldr r3, [r1, #0x18]
	ldr r2, [r1, #0x14]
	ldr r0, [r1, #0x24]
	ldr r1, [r1, #0x28]
	lsl r5, r5, #0x14
	lsl r7, r1, #8
	lsl r1, r3, #0x18
	lsl r3, r2, #0x1d
	mov r2, #2
	lsl r2, r2, #0x1e
	orr r3, r2
	lsl r2, r4, #0x19
	orr r2, r3
	orr r1, r2
	lsl r6, r6, #0x10
	orr r1, r5
	orr r1, r6
	orr r1, r7
	orr r1, r0
	ldr r0, _021F4580 ; =0x04000064
	str r1, [r0]
_021F457C:
	pop {r4, r5, r6, r7}
	bx lr
	.balign 4, 0
_021F4580: .word 0x04000064
	thumb_func_end ov01_021F4544

	thumb_func_start ov01_021F4584
ov01_021F4584: ; 0x021F4584
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #0xa
	bgt _021F45A2
	bge _021F45B8
	cmp r0, #6
	bgt _021F45C8
	cmp r0, #2
	blt _021F45C8
	beq _021F45A8
	cmp r0, #6
	beq _021F45B0
	b _021F45C8
_021F45A2:
	cmp r0, #0xe
	beq _021F45C0
	b _021F45C8
_021F45A8:
	mov r0, #1
	bl GX_SetBankForLCDC
	b _021F45CE
_021F45B0:
	mov r0, #2
	bl GX_SetBankForLCDC
	b _021F45CE
_021F45B8:
	mov r0, #4
	bl GX_SetBankForLCDC
	b _021F45CE
_021F45C0:
	mov r0, #8
	bl GX_SetBankForLCDC
	b _021F45CE
_021F45C8:
	mov r0, #0
	bl GX_SetBankForLCDC
_021F45CE:
	ldr r0, [r4, #4]
	ldr r1, [r4, #8]
	ldr r2, [r4, #0xc]
	bl GX_SetGraphicsMode
	mov r0, #1
	str r0, [r4, #0x30]
	add r0, r5, #0
	bl DestroySysTask
	pop {r3, r4, r5, pc}
	thumb_func_end ov01_021F4584

	thumb_func_start ov01_021F45E4
ov01_021F45E4: ; 0x021F45E4
	push {r4, r5, r6, lr}
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0xa
	bgt _021F4600
	bge _021F4624
	cmp r0, #6
	bgt _021F463E
	cmp r0, #2
	blt _021F463E
	beq _021F4606
	cmp r0, #6
	beq _021F4616
	b _021F463E
_021F4600:
	cmp r0, #0xe
	beq _021F4632
	b _021F463E
_021F4606:
	mov r1, #0x1a
	mov r2, #2
	mov r0, #0
	lsl r1, r1, #0x16
	lsl r2, r2, #0x10
	bl MIi_CpuClearFast
	b _021F463E
_021F4616:
	mov r2, #2
	ldr r1, _021F466C ; =0x06820000
	mov r0, #0
	lsl r2, r2, #0x10
	bl MIi_CpuClearFast
	b _021F463E
_021F4624:
	mov r2, #2
	ldr r1, _021F4670 ; =0x06840000
	mov r0, #0
	lsl r2, r2, #0x10
	bl MIi_CpuClearFast
	b _021F463E
_021F4632:
	mov r2, #2
	ldr r1, _021F4674 ; =0x06860000
	mov r0, #0
	lsl r2, r2, #0x10
	bl MIi_CpuClearFast
_021F463E:
	ldr r5, [r4, #0x10]
	ldr r1, [r4, #0x1c]
	ldr r3, [r4, #0x18]
	ldr r6, [r4, #0x14]
	ldr r0, [r4, #0xc]
	mov r4, #2
	lsl r2, r1, #0x10
	lsl r1, r0, #0x14
	lsl r5, r5, #0x1d
	lsl r4, r4, #0x1e
	orr r4, r5
	lsl r3, r3, #0x19
	lsl r0, r6, #0x18
	orr r3, r4
	orr r0, r3
	orr r0, r1
	add r1, r2, #0
	orr r1, r0
	mov r0, #0x10
	orr r1, r0
	ldr r0, _021F4678 ; =0x04000064
	str r1, [r0]
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021F466C: .word 0x06820000
_021F4670: .word 0x06840000
_021F4674: .word 0x06860000
_021F4678: .word 0x04000064
	thumb_func_end ov01_021F45E4
