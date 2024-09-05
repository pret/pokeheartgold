	.include "asm/macros.inc"
	.include "unk_02023694.inc"
	.include "global.inc"

    .text

	.extern sub_020245FC

	thumb_func_start Sprite_SetMatrix
Sprite_SetMatrix: ; 0x020247D4
	add r2, r1, #0
	add r3, r0, #0
	ldmia r2!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r2]
	str r0, [r3]
	bx lr
	.balign 4, 0
	thumb_func_end Sprite_SetMatrix

	thumb_func_start sub_020247E4
sub_020247E4: ; 0x020247E4
	add r3, r1, #0
	add r2, r0, #0
	ldmia r3!, {r0, r1}
	add r2, #0xc
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	bx lr
	thumb_func_end sub_020247E4

	thumb_func_start sub_020247F4
sub_020247F4: ; 0x020247F4
	add r3, r1, #0
	add r2, r0, #0
	ldmia r3!, {r0, r1}
	add r2, #0x18
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	bx lr
	thumb_func_end sub_020247F4

	thumb_func_start sub_02024804
sub_02024804: ; 0x02024804
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r2, #0
	bl sub_020247F4
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0202487C
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02024804

	thumb_func_start sub_02024818
sub_02024818: ; 0x02024818
	strh r1, [r0, #0x24]
	bx lr
	thumb_func_end sub_02024818

	thumb_func_start sub_0202481C
sub_0202481C: ; 0x0202481C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r2, #0
	bl sub_02024818
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0202487C
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0202481C

	thumb_func_start Set2dSpriteVisibleFlag
Set2dSpriteVisibleFlag: ; 0x02024830
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	cmp r5, #0
	bne _0202483E
	bl GF_AssertFail
_0202483E:
	cmp r4, #2
	blt _02024846
	bl GF_AssertFail
_02024846:
	add r5, #0x34
	strb r4, [r5]
	pop {r3, r4, r5, pc}
	thumb_func_end Set2dSpriteVisibleFlag

	thumb_func_start Set2dSpriteAnimActiveFlag
Set2dSpriteAnimActiveFlag: ; 0x0202484C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	cmp r5, #0
	bne _0202485A
	bl GF_AssertFail
_0202485A:
	cmp r4, #2
	blt _02024862
	bl GF_AssertFail
_02024862:
	add r5, #0x35
	strb r4, [r5]
	pop {r3, r4, r5, pc}
	thumb_func_end Set2dSpriteAnimActiveFlag

	thumb_func_start sub_02024868
sub_02024868: ; 0x02024868
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	cmp r5, #0
	bne _02024876
	bl GF_AssertFail
_02024876:
	str r4, [r5, #0x38]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02024868

	thumb_func_start sub_0202487C
sub_0202487C: ; 0x0202487C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	cmp r5, #0
	bne _0202488A
	bl GF_AssertFail
_0202488A:
	add r5, #0x26
	strb r4, [r5]
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0202487C

	thumb_func_start sub_02024890
sub_02024890: ; 0x02024890
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	cmp r5, #0
	bne _0202489E
	bl GF_AssertFail
_0202489E:
	add r0, r5, #0
	add r0, #0x27
	strb r4, [r0]
	mov r0, #0
	add r5, #0x26
	strb r0, [r5]
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02024890

	thumb_func_start Sprite_GetMatrixPtr
Sprite_GetMatrixPtr: ; 0x020248AC
	bx lr
	.balign 4, 0
	thumb_func_end Sprite_GetMatrixPtr

	thumb_func_start sub_020248B0
sub_020248B0: ; 0x020248B0
	add r0, #0x18
	bx lr
	thumb_func_end sub_020248B0

	thumb_func_start sub_020248B4
sub_020248B4: ; 0x020248B4
	ldrh r0, [r0, #0x24]
	bx lr
	thumb_func_end sub_020248B4

	thumb_func_start Get2dSpriteVisibleFlag
Get2dSpriteVisibleFlag: ; 0x020248B8
	add r0, #0x34
	ldrb r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end Get2dSpriteVisibleFlag

	thumb_func_start sub_020248C0
sub_020248C0: ; 0x020248C0
	add r0, #0x35
	ldrb r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_020248C0

	thumb_func_start Get2dSpriteAnimSeqNo
Get2dSpriteAnimSeqNo: ; 0x020248C8
	push {r4, lr}
	add r4, r0, #0
	bne _020248D2
	bl GF_AssertFail
_020248D2:
	add r0, r4, #0
	add r0, #0xec
	ldr r0, [r0]
	cmp r0, #1
	beq _020248E0
	cmp r0, #3
	bne _020248E6
_020248E0:
	ldr r0, [r4, #0x44]
	ldrh r0, [r0]
	pop {r4, pc}
_020248E6:
	add r4, #0xb0
	ldr r0, [r4]
	ldrh r0, [r0]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end Get2dSpriteAnimSeqNo

	thumb_func_start Set2dSpriteAnimSeqNo
Set2dSpriteAnimSeqNo: ; 0x020248F0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl Get2dSpriteAnimSeqNo
	cmp r0, r4
	bhi _02024902
	bl GF_AssertFail
_02024902:
	lsl r0, r4, #0x10
	lsr r1, r0, #0x10
	add r0, r5, #0
	add r0, #0xf0
	strh r1, [r0]
	add r0, r5, #0
	add r0, #0xec
	ldr r0, [r0]
	cmp r0, #1
	beq _0202491A
	cmp r0, #3
	bne _02024936
_0202491A:
	add r5, #0x40
	lsl r1, r4, #0x10
	ldr r0, [r5, #4]
	lsr r1, r1, #0x10
	bl NNS_G2dGetAnimSequenceByIdx
	add r1, r0, #0
	add r0, r5, #0
	add r0, #8
	bl NNS_G2dSetCellAnimationSequence
	mov r0, #1
	str r0, [r5, #0x14]
	pop {r3, r4, r5, pc}
_02024936:
	add r5, #0x40
	ldr r0, [r5, #0x70]
	bl NNS_G2dGetAnimSequenceByIdx
	add r1, r0, #0
	add r0, r5, #0
	add r0, #8
	bl NNS_G2dSetAnimSequenceToMCAnimation
	mov r0, #1
	str r0, [r5, #0x14]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end Set2dSpriteAnimSeqNo

	thumb_func_start TryChange2dSpriteAnimSeqNo
TryChange2dSpriteAnimSeqNo: ; 0x02024950
	push {r3, lr}
	add r2, r0, #0
	add r2, #0xf0
	ldrh r2, [r2]
	cmp r2, r1
	beq _02024960
	bl Set2dSpriteAnimSeqNo
_02024960:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end TryChange2dSpriteAnimSeqNo

	thumb_func_start Sprite_ResetAnimCtrlState
Sprite_ResetAnimCtrlState: ; 0x02024964
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r0, #0xec
	ldr r0, [r0]
	cmp r0, #1
	beq _02024974
	cmp r0, #3
	bne _0202498E
_02024974:
	add r5, r4, #0
	add r5, #0x40
	add r0, r5, #0
	add r0, #8
	bl NNS_G2dResetAnimCtrlState
	mov r0, #1
	str r0, [r5, #0x14]
	add r0, r4, #0
	mov r1, #0
	bl Sprite_SetAnimCtrlCurrentFrame
	pop {r3, r4, r5, pc}
_0202498E:
	add r5, r4, #0
	add r5, #0x40
	add r0, r5, #0
	add r0, #8
	bl NNS_G2dResetAnimCtrlState
	mov r0, #1
	str r0, [r5, #0x14]
	add r0, r4, #0
	mov r1, #0
	bl Sprite_SetAnimCtrlCurrentFrame
	pop {r3, r4, r5, pc}
	thumb_func_end Sprite_ResetAnimCtrlState

	thumb_func_start Get2dSpriteCurrentAnimSeqNo
Get2dSpriteCurrentAnimSeqNo: ; 0x020249A8
	add r0, #0xf0
	ldrh r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end Get2dSpriteCurrentAnimSeqNo

	thumb_func_start Sprite_TickCellOrMulticellAnimation
Sprite_TickCellOrMulticellAnimation: ; 0x020249B0
	push {r3, lr}
	add r2, r0, #0
	add r2, #0xec
	ldr r2, [r2]
	cmp r2, #1
	beq _020249C0
	cmp r2, #3
	bne _020249CA
_020249C0:
	add r0, #0x40
	add r0, #8
	bl NNS_G2dTickCellAnimation
	pop {r3, pc}
_020249CA:
	add r0, #0x40
	add r0, #8
	bl NNS_G2dTickMCAnimation
	pop {r3, pc}
	thumb_func_end Sprite_TickCellOrMulticellAnimation

	thumb_func_start Sprite_SetAnimCtrlCurrentFrame
Sprite_SetAnimCtrlCurrentFrame: ; 0x020249D4
	push {r3, lr}
	add r2, r0, #0
	add r2, #0xec
	ldr r2, [r2]
	cmp r2, #1
	beq _020249E4
	cmp r2, #3
	bne _020249EE
_020249E4:
	add r0, #0x40
	add r0, #8
	bl NNS_G2dSetCellAnimationCurrentFrame
	pop {r3, pc}
_020249EE:
	add r0, #0x40
	add r0, #8
	bl NNS_G2dSetMCAnimationCurrentFrame
	pop {r3, pc}
	thumb_func_end Sprite_SetAnimCtrlCurrentFrame

	thumb_func_start Sprite_GetAnimCtrlCurrentFrame
Sprite_GetAnimCtrlCurrentFrame: ; 0x020249F8
	ldr r3, _02024A00 ; =NNS_G2dGetAnimCtrlCurrentFrame
	add r0, #0x40
	add r0, #8
	bx r3
	.balign 4, 0
_02024A00: .word NNS_G2dGetAnimCtrlCurrentFrame
	thumb_func_end Sprite_GetAnimCtrlCurrentFrame

	thumb_func_start Sprite_SetPriority
Sprite_SetPriority: ; 0x02024A04
	add r0, #0xf2
	strb r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end Sprite_SetPriority

	thumb_func_start Sprite_GetPriority
Sprite_GetPriority: ; 0x02024A0C
	add r0, #0xf2
	ldrb r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end Sprite_GetPriority

	thumb_func_start Sprite_SetPalIndex
Sprite_SetPalIndex: ; 0x02024A14
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	cmp r5, #0
	bne _02024A22
	bl GF_AssertFail
_02024A22:
	add r0, r5, #0
	add r0, #0x29
	strb r4, [r0]
	add r0, r5, #0
	add r0, #0x28
	ldrb r1, [r0]
	mov r0, #2
	orr r1, r0
	add r0, r5, #0
	add r0, #0x28
	strb r1, [r0]
	add r0, r5, #0
	add r0, #0x28
	ldrb r1, [r0]
	mov r0, #0x10
	add r5, #0x28
	bic r1, r0
	strb r1, [r5]
	pop {r3, r4, r5, pc}
	thumb_func_end Sprite_SetPalIndex

	thumb_func_start sub_02024A48
sub_02024A48: ; 0x02024A48
	push {r4, lr}
	add r4, r0, #0
	bl Sprite_SetPalIndex
	add r1, r4, #0
	add r1, #0xf8
	add r0, r4, #0
	ldr r1, [r1]
	add r0, #0xd8
	bl sub_02024E84
	add r1, r4, #0
	add r1, #0x29
	ldrb r1, [r1]
	add r4, #0x29
	add r0, r1, r0
	strb r0, [r4]
	pop {r4, pc}
	thumb_func_end sub_02024A48

	thumb_func_start Sprite_GetPalIndex
Sprite_GetPalIndex: ; 0x02024A6C
	add r0, #0x29
	ldrb r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end Sprite_GetPalIndex

	thumb_func_start Sprite_SetPalOffset
Sprite_SetPalOffset: ; 0x02024A74
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	cmp r5, #0
	bne _02024A82
	bl GF_AssertFail
_02024A82:
	add r0, r5, #0
	add r0, #0x2a
	strb r4, [r0]
	add r0, r5, #0
	add r0, #0x28
	ldrb r1, [r0]
	mov r0, #0x10
	orr r1, r0
	add r0, r5, #0
	add r0, #0x28
	strb r1, [r0]
	add r0, r5, #0
	add r0, #0x28
	ldrb r1, [r0]
	mov r0, #2
	add r5, #0x28
	bic r1, r0
	strb r1, [r5]
	pop {r3, r4, r5, pc}
	thumb_func_end Sprite_SetPalOffset

	thumb_func_start sub_02024AA8
sub_02024AA8: ; 0x02024AA8
	push {r4, lr}
	add r4, r0, #0
	bl Sprite_SetPalOffset
	add r1, r4, #0
	add r1, #0xf8
	add r0, r4, #0
	ldr r1, [r1]
	add r0, #0xd8
	bl sub_02024E84
	add r1, r4, #0
	add r1, #0x2a
	ldrb r1, [r1]
	add r4, #0x2a
	add r0, r1, r0
	strb r0, [r4]
	pop {r4, pc}
	thumb_func_end sub_02024AA8

	thumb_func_start Sprite_GetPalOffset
Sprite_GetPalOffset: ; 0x02024ACC
	push {r4, lr}
	add r4, r0, #0
	bne _02024AD6
	bl GF_AssertFail
_02024AD6:
	add r4, #0x2a
	ldrb r0, [r4]
	pop {r4, pc}
	thumb_func_end Sprite_GetPalOffset

	thumb_func_start Sprite_SetDrawPriority
Sprite_SetDrawPriority: ; 0x02024ADC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r2, r5, #0
	ldr r4, [r5, #0x3c]
	add r2, #0xf4
	strh r1, [r2]
	bl sub_020250BC
	add r0, r4, #0
	add r1, r5, #0
	bl sub_02025024
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end Sprite_SetDrawPriority

	thumb_func_start Sprite_GetDrawPriority
Sprite_GetDrawPriority: ; 0x02024AF8
	add r0, #0xf4
	ldrh r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end Sprite_GetDrawPriority

	thumb_func_start sub_02024B00
sub_02024B00: ; 0x02024B00
	push {r3, r4}
	add r3, r0, #0
	add r4, r1, #0
	add r3, #0xb4
	mov r2, #4
_02024B0A:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _02024B0A
	ldr r0, [r4]
	str r0, [r3]
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end sub_02024B00

	thumb_func_start Sprite_GetImageProxy
Sprite_GetImageProxy: ; 0x02024B1C
	add r0, #0xb4
	bx lr
	thumb_func_end Sprite_GetImageProxy

	thumb_func_start sub_02024B20
sub_02024B20: ; 0x02024B20
	add r3, r1, #0
	add r2, r0, #0
	ldmia r3!, {r0, r1}
	add r2, #0xd8
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	bx lr
	thumb_func_end sub_02024B20

	thumb_func_start Sprite_GetPaletteProxy
Sprite_GetPaletteProxy: ; 0x02024B34
	add r0, #0xd8
	bx lr
	thumb_func_end Sprite_GetPaletteProxy

	thumb_func_start sub_02024B38
sub_02024B38: ; 0x02024B38
	str r1, [r0, #0x2c]
	cmp r1, #1
	bne _02024B4E
	add r1, r0, #0
	add r1, #0x28
	ldrb r2, [r1]
	mov r1, #4
	add r0, #0x28
	orr r1, r2
	strb r1, [r0]
	bx lr
_02024B4E:
	add r1, r0, #0
	add r1, #0x28
	ldrb r2, [r1]
	mov r1, #4
	eor r1, r2
	add r0, #0x28
	strb r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02024B38

	thumb_func_start Sprite_GetVramType
Sprite_GetVramType: ; 0x02024B60
	add r0, #0xf8
	ldr r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end Sprite_GetVramType

	thumb_func_start Sprite_IsCellAnimationRunning
Sprite_IsCellAnimationRunning: ; 0x02024B68
	push {r4, lr}
	add r4, r0, #0
	bne _02024B72
	bl GF_AssertFail
_02024B72:
	ldr r0, [r4, #0x54]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end Sprite_IsCellAnimationRunning

	thumb_func_start sub_02024B78
sub_02024B78: ; 0x02024B78
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r5, r1, #0
	cmp r4, #0
	bne _02024B86
	bl GF_AssertFail
_02024B86:
	str r5, [r4, #0x30]
	cmp r5, #0
	bne _02024B9C
	add r0, r4, #0
	add r0, #0x28
	ldrb r1, [r0]
	mov r0, #8
	add r4, #0x28
	eor r0, r1
	strb r0, [r4]
	pop {r3, r4, r5, pc}
_02024B9C:
	add r0, r4, #0
	add r0, #0x28
	ldrb r1, [r0]
	mov r0, #8
	orr r0, r1
	add r4, #0x28
	strb r0, [r4]
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02024B78

	thumb_func_start sub_02024BAC
sub_02024BAC: ; 0x02024BAC
	push {r4, lr}
	add r4, r0, #0
	bne _02024BB6
	bl GF_AssertFail
_02024BB6:
	ldr r0, [r4, #0x30]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02024BAC

	thumb_func_start sub_02024BBC
sub_02024BBC: ; 0x02024BBC
	push {r4, lr}
	mov r1, #1
	lsl r1, r1, #0xa
	bl AllocFromHeap
	add r4, r0, #0
	mov r0, #0xb
	mov r2, #1
	lsl r0, r0, #6
	add r1, r4, #0
	lsl r2, r2, #0xa
	bl MIi_CpuClear16
	mov r1, #1
	add r0, r4, #0
	lsl r1, r1, #0xa
	bl DC_FlushRange
	mov r2, #1
	add r0, r4, #0
	mov r1, #0
	lsl r2, r2, #0xa
	bl GX_LoadOAM
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end sub_02024BBC

	thumb_func_start sub_02024BF4
sub_02024BF4: ; 0x02024BF4
	push {r4, lr}
	mov r1, #1
	lsl r1, r1, #0xa
	bl AllocFromHeap
	add r4, r0, #0
	mov r0, #0xb
	mov r2, #1
	lsl r0, r0, #6
	add r1, r4, #0
	lsl r2, r2, #0xa
	bl MIi_CpuClear16
	mov r2, #1
	add r0, r4, #0
	mov r1, #0
	lsl r2, r2, #0xa
	bl GXS_LoadOAM
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02024BF4

	thumb_func_start sub_02024C24
sub_02024C24: ; 0x02024C24
	push {r3, r4}
	add r3, r0, #0
	add r3, #0xec
	ldr r3, [r3]
	cmp r3, #1
	beq _02024C34
	cmp r3, #3
	bne _02024C38
_02024C34:
	ldr r0, [r0, #0x44]
	b _02024C3C
_02024C38:
	add r0, #0xb0
	ldr r0, [r0]
_02024C3C:
	ldr r4, [r0, #0x14]
	cmp r4, #0
	beq _02024C4A
	ldr r3, [r4]
	ldr r0, _02024C98 ; =0x55414154
	cmp r3, r0
	beq _02024C4C
_02024C4A:
	mov r4, #0
_02024C4C:
	cmp r4, #0
	beq _02024C54
	add r4, #8
	b _02024C56
_02024C54:
	mov r4, #0
_02024C56:
	cmp r4, #0
	beq _02024C92
	lsl r0, r1, #0x10
	lsr r3, r0, #0x10
	ldrh r0, [r4]
	cmp r3, r0
	bhs _02024C6E
	mov r0, #0xc
	ldr r1, [r4, #4]
	mul r0, r3
	add r1, r1, r0
	b _02024C70
_02024C6E:
	mov r1, #0
_02024C70:
	cmp r1, #0
	beq _02024C92
	ldrh r0, [r1]
	cmp r0, #0
	beq _02024C84
	lsl r0, r2, #0x10
	ldr r1, [r1, #8]
	lsr r0, r0, #0xe
	add r0, r1, r0
	b _02024C86
_02024C84:
	mov r0, #0
_02024C86:
	cmp r0, #0
	beq _02024C92
	ldr r0, [r0]
	ldr r0, [r0]
	pop {r3, r4}
	bx lr
_02024C92:
	mov r0, #0
	pop {r3, r4}
	bx lr
	.balign 4, 0
_02024C98: .word 0x55414154
	thumb_func_end sub_02024C24

	thumb_func_start sub_02024C9C
sub_02024C9C: ; 0x02024C9C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl Get2dSpriteCurrentAnimSeqNo
	add r4, r0, #0
	add r0, r5, #0
	bl Sprite_GetAnimCtrlCurrentFrame
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02024C24
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02024C9C

	thumb_func_start Sprite_GetCellAnim
Sprite_GetCellAnim: ; 0x02024CB8
	push {r4, lr}
	add r4, r0, #0
	add r0, #0xec
	ldr r0, [r0]
	cmp r0, #2
	bne _02024CC8
	bl GF_AssertFail
_02024CC8:
	add r4, #0x40
	add r4, #8
	add r0, r4, #0
	pop {r4, pc}
	thumb_func_end Sprite_GetCellAnim

	thumb_func_start sub_02024CD0
sub_02024CD0: ; 0x02024CD0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	str r0, [sp]
	add r4, r2, #0
	add r0, r5, #0
	add r7, r3, #0
	bl sub_02024D78
	add r1, r4, #0
	add r1, #0xec
	str r0, [r1]
	add r3, r4, #0
	ldr r6, [r5]
	add r3, #0xb4
	mov r2, #4
_02024CEE:
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _02024CEE
	ldr r0, [r6]
	add r2, r4, #0
	str r0, [r3]
	ldr r3, [r5, #8]
	add r2, #0xd8
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	add r1, r4, #0
	str r0, [r2]
	ldr r0, [r5, #0xc]
	bl sub_02024D90
	ldr r0, [r5, #0x10]
	cmp r0, #0
	beq _02024D22
	add r1, r4, #0
	bl sub_02024D94
	b _02024D30
_02024D22:
	mov r1, #0x47
	ldr r0, [sp]
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	add r1, r4, #0
	bl sub_02024D94
_02024D30:
	add r0, r4, #0
	add r0, #0xec
	ldr r0, [r0]
	cmp r0, #2
	bne _02024D54
	ldr r0, [r5, #0x14]
	add r1, r4, #0
	bl sub_02024D98
	ldr r0, [r5, #0x18]
	add r1, r4, #0
	bl sub_02024DA0
	add r0, r4, #0
	add r1, r7, #0
	bl sub_02024E24
	b _02024D6C
_02024D54:
	cmp r0, #3
	bne _02024D64
	add r0, r5, #0
	add r1, r4, #0
	add r2, r7, #0
	bl sub_02024DC8
	b _02024D6C
_02024D64:
	add r0, r4, #0
	add r1, r7, #0
	bl sub_02024DA8
_02024D6C:
	add r5, #0x20
	ldrb r0, [r5]
	add r4, #0xf2
	strb r0, [r4]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02024CD0

	thumb_func_start sub_02024D78
sub_02024D78: ; 0x02024D78
	ldr r1, [r0, #0x14]
	cmp r1, #0
	beq _02024D82
	mov r0, #2
	bx lr
_02024D82:
	ldr r0, [r0, #0x1c]
	cmp r0, #1
	bne _02024D8C
	mov r0, #3
	bx lr
_02024D8C:
	mov r0, #1
	bx lr
	thumb_func_end sub_02024D78

	thumb_func_start sub_02024D90
sub_02024D90: ; 0x02024D90
	str r0, [r1, #0x40]
	bx lr
	thumb_func_end sub_02024D90

	thumb_func_start sub_02024D94
sub_02024D94: ; 0x02024D94
	str r0, [r1, #0x44]
	bx lr
	thumb_func_end sub_02024D94

	thumb_func_start sub_02024D98
sub_02024D98: ; 0x02024D98
	add r1, #0xac
	str r0, [r1]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02024D98

	thumb_func_start sub_02024DA0
sub_02024DA0: ; 0x02024DA0
	add r1, #0xb0
	str r0, [r1]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02024DA0

	thumb_func_start sub_02024DA8
sub_02024DA8: ; 0x02024DA8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r5, #0
	add r4, #0x40
	ldr r0, [r4, #4]
	mov r1, #0
	bl NNS_G2dGetAnimSequenceByIdx
	add r4, #8
	add r1, r0, #0
	ldr r2, [r5, #0x40]
	add r0, r4, #0
	bl NNS_G2dInitCellAnimation
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02024DA8

	thumb_func_start sub_02024DC8
sub_02024DC8: ; 0x02024DC8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r6, r1, #0
	add r4, r6, #0
	add r4, #0x40
	add r5, r0, #0
	bl NNS_G2dGetNewCellTransferStateHandle
	str r0, [r4, #0x60]
	ldr r0, [r4, #4]
	mov r1, #0
	ldr r5, [r5, #4]
	bl NNS_G2dGetAnimSequenceByIdx
	str r0, [sp, #0x18]
	add r0, r6, #0
	add r0, #0xb4
	mov r1, #1
	bl NNS_G2dGetImageLocation
	add r7, r0, #0
	add r0, r6, #0
	add r0, #0xb4
	mov r1, #2
	bl NNS_G2dGetImageLocation
	mov r1, #0
	mvn r1, r1
	str r1, [sp]
	str r7, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5, #0x14]
	ldr r1, [sp, #0x18]
	str r0, [sp, #0xc]
	mov r0, #0
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x10]
	str r0, [sp, #0x14]
	add r0, r4, #0
	ldr r2, [r6, #0x40]
	ldr r3, [r4, #0x60]
	add r0, #8
	bl NNS_G2dInitCellAnimationVramTransfered
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end sub_02024DC8

	thumb_func_start sub_02024E24
sub_02024E24: ; 0x02024E24
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r4, r5, #0
	add r4, #0x40
	ldr r0, [r4, #0x70]
	add r7, r1, #0
	mov r1, #0
	bl NNS_G2dGetAnimSequenceByIdx
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x6c]
	bl NNS_G2dGetMCBankNumNodesRequired
	add r6, r0, #0
	mov r1, #0x28
	add r0, r7, #0
	mul r1, r6
	bl AllocFromHeap
	mov r1, #0x58
	str r0, [r4, #0x74]
	add r0, r7, #0
	mul r1, r6
	bl AllocFromHeap
	str r0, [r4, #0x78]
	ldr r0, [r4, #4]
	add r3, r6, #0
	str r0, [sp]
	ldr r0, [r5, #0x40]
	str r0, [sp, #4]
	ldr r0, [r4, #0x6c]
	str r0, [sp, #8]
	add r0, r4, #0
	ldr r1, [r4, #0x74]
	ldr r2, [r4, #0x78]
	add r0, #8
	bl NNS_G2dInitMCAnimation
	add r4, #8
	ldr r1, [sp, #0xc]
	add r0, r4, #0
	bl NNS_G2dSetAnimSequenceToMCAnimation
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02024E24

	thumb_func_start sub_02024E84
sub_02024E84: ; 0x02024E84
	push {r4, lr}
	ldr r2, [r0, #4]
	cmp r2, #0
	beq _02024E92
	mov r4, #2
	lsl r4, r4, #8
	b _02024E9E
_02024E92:
	ldr r2, [r0]
	cmp r2, #4
	bne _02024E9C
	mov r4, #0
	b _02024E9E
_02024E9C:
	mov r4, #0x20
_02024E9E:
	cmp r4, #0
	beq _02024EAE
	bl NNS_G2dGetImagePaletteLocation
	add r1, r4, #0
	bl _u32_div_f
	pop {r4, pc}
_02024EAE:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02024E84

	thumb_func_start sub_02024EB4
sub_02024EB4: ; 0x02024EB4
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r3, r4, #0
	add r5, r0, #0
	ldmia r3!, {r0, r1}
	add r2, sp, #0
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	add r1, r4, #0
	str r0, [r2]
	mov r0, #0x45
	lsl r0, r0, #2
	add r2, r4, #0
	ldr r0, [r5, r0]
	add r1, #0xb4
	add r2, #0xd8
	bl NNS_G2dSetRendererImageProxy
	mov r0, #0x45
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl NNS_G2dBeginRendering
	bl NNS_G2dPushMtx
	add r1, r4, #0
	mov r0, #0x45
	add r1, #0x26
	lsl r0, r0, #2
	ldrb r1, [r1]
	ldr r0, [r5, r0]
	bl NNS_G2dSetRndCoreAffineOverwriteMode
	add r0, r4, #0
	add r0, #0x26
	ldrb r0, [r0]
	cmp r0, #0
	bne _02024F1C
	add r0, r4, #0
	add r0, #0x27
	ldrb r2, [r0]
	mov r0, #0x45
	lsl r0, r0, #2
	mov r1, #1
	ldr r0, [r5, r0]
	mov r3, #2
	and r1, r2
	and r2, r3
	bl NNS_G2dSetRndCoreFlipMode
	b _02024F2A
_02024F1C:
	mov r0, #0x45
	lsl r0, r0, #2
	mov r1, #0
	ldr r0, [r5, r0]
	add r2, r1, #0
	bl NNS_G2dSetRndCoreFlipMode
_02024F2A:
	ldr r0, [sp]
	ldr r1, [sp, #4]
	ldr r2, [sp, #8]
	bl NNS_G2dTranslate
	add r0, r4, #0
	add r0, #0x26
	ldrb r0, [r0]
	cmp r0, #0
	beq _02024F78
	ldr r0, [r4, #0xc]
	ldr r1, [r4, #0x10]
	ldr r2, [r4, #0x14]
	bl NNS_G2dTranslate
	ldr r0, [r4, #0x18]
	ldr r1, [r4, #0x1c]
	ldr r2, [r4, #0x20]
	bl NNS_G2dScale
	ldrh r0, [r4, #0x24]
	ldr r2, _0202500C ; =FX_SinCosTable_
	asr r0, r0, #4
	lsl r1, r0, #1
	lsl r0, r1, #1
	add r1, r1, #1
	lsl r1, r1, #1
	ldrsh r0, [r2, r0]
	ldrsh r1, [r2, r1]
	bl NNS_G2dRotZ
	ldr r0, [r4, #0xc]
	ldr r1, [r4, #0x10]
	ldr r2, [r4, #0x14]
	neg r0, r0
	neg r1, r1
	neg r2, r2
	bl NNS_G2dTranslate
_02024F78:
	add r0, r4, #0
	add r0, #0x28
	ldrb r3, [r0]
	mov r0, #0x45
	lsl r0, r0, #2
	ldr r2, [r5, r0]
	add r1, r2, #0
	add r1, #0x84
	ldr r1, [r1]
	add r2, #0x84
	orr r1, r3
	str r1, [r2]
	add r1, r4, #0
	add r1, #0x28
	ldrb r1, [r1]
	mvn r6, r1
	ldr r1, [r5, r0]
	add r2, r1, #0
	add r2, #0x84
	ldr r3, [r2]
	mvn r2, r6
	and r2, r3
	add r1, #0x84
	str r2, [r1]
	add r1, r4, #0
	add r1, #0x29
	ldrb r2, [r1]
	ldr r1, [r5, r0]
	add r1, #0x8a
	strh r2, [r1]
	add r1, r4, #0
	add r1, #0x2a
	ldrb r2, [r1]
	ldr r1, [r5, r0]
	add r1, #0x94
	strh r2, [r1]
	ldr r1, [r5, r0]
	ldr r2, [r4, #0x2c]
	add r1, #0x90
	str r2, [r1]
	ldr r1, [r5, r0]
	ldr r2, [r4, #0x30]
	add r1, #0x8c
	str r2, [r1]
	add r1, r4, #0
	add r1, #0xf2
	ldr r0, [r5, r0]
	ldrb r1, [r1]
	add r0, #0x88
	strh r1, [r0]
	add r0, r4, #0
	add r0, #0xec
	ldr r0, [r0]
	cmp r0, #1
	beq _02024FEA
	cmp r0, #3
	bne _02024FF6
_02024FEA:
	add r4, #0x40
	add r4, #8
	add r0, r4, #0
	bl NNS_G2dDrawCellAnimation
	b _02025000
_02024FF6:
	add r4, #0x40
	add r4, #8
	add r0, r4, #0
	bl NNS_G2dDrawMultiCellAnimation
_02025000:
	bl NNS_G2dPopMtx
	bl NNS_G2dEndRendering
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_0202500C: .word FX_SinCosTable_
	thumb_func_end sub_02024EB4

	thumb_func_start sub_02025010
sub_02025010: ; 0x02025010
	bx lr
	.balign 4, 0
	thumb_func_end sub_02025010

	thumb_func_start sub_02025014
sub_02025014: ; 0x02025014
	ldr r3, _0202501C ; =Sprite_TickCellOrMulticellAnimation
	ldr r1, [r0, #0x38]
	bx r3
	nop
_0202501C: .word Sprite_TickCellOrMulticellAnimation
	thumb_func_end sub_02025014

	thumb_func_start sub_02025020
sub_02025020: ; 0x02025020
	bx lr
	.balign 4, 0
	thumb_func_end sub_02025020

	thumb_func_start sub_02025024
sub_02025024: ; 0x02025024
	push {r4, r5, r6, r7}
	mov r2, #0x11
	lsl r2, r2, #4
	add r4, r0, #0
	ldr r5, [r0, r2]
	add r4, #0x10
	cmp r5, r4
	bne _02025048
	str r1, [r0, r2]
	sub r3, r2, #4
	str r1, [r0, r3]
	add r0, r1, #0
	add r0, #0xfc
	str r4, [r0]
	sub r2, #0x10
	str r4, [r1, r2]
	pop {r4, r5, r6, r7}
	bx lr
_02025048:
	add r3, r1, #0
	add r3, #0xf4
	ldrh r6, [r3]
	sub r3, r2, #4
	ldr r3, [r0, r3]
	add r7, r3, #0
	add r7, #0xf4
	ldrh r7, [r7]
	cmp r7, r6
	bhi _0202507A
	add r5, r1, #0
	add r5, #0xfc
	str r3, [r5]
	sub r3, r2, #4
	ldr r5, [r0, r3]
	add r3, r2, #0
	sub r3, #0x10
	str r1, [r5, r3]
	add r3, r2, #0
	sub r3, #0x10
	str r4, [r1, r3]
	sub r2, r2, #4
	str r1, [r0, r2]
	pop {r4, r5, r6, r7}
	bx lr
_0202507A:
	cmp r5, r4
	beq _020250B6
	add r0, r2, #0
	sub r0, #0x10
_02025082:
	add r2, r5, #0
	add r2, #0xf4
	ldrh r2, [r2]
	cmp r2, r6
	bls _020250B0
	add r0, r5, #0
	add r0, #0xfc
	mov r2, #1
	ldr r0, [r0]
	lsl r2, r2, #8
	str r1, [r0, r2]
	add r0, r5, #0
	add r0, #0xfc
	ldr r3, [r0]
	add r0, r1, #0
	add r0, #0xfc
	str r3, [r0]
	add r0, r5, #0
	add r0, #0xfc
	str r1, [r0]
	str r5, [r1, r2]
	pop {r4, r5, r6, r7}
	bx lr
_020250B0:
	ldr r5, [r5, r0]
	cmp r5, r4
	bne _02025082
_020250B6:
	pop {r4, r5, r6, r7}
	bx lr
	.balign 4, 0
	thumb_func_end sub_02025024

	thumb_func_start sub_020250BC
sub_020250BC: ; 0x020250BC
	mov r2, #1
	add r1, r0, #0
	lsl r2, r2, #8
	add r1, #0xfc
	ldr r3, [r0, r2]
	ldr r1, [r1]
	str r3, [r1, r2]
	add r1, r0, #0
	add r1, #0xfc
	ldr r0, [r0, r2]
	ldr r1, [r1]
	add r0, #0xfc
	str r1, [r0]
	bx lr
	thumb_func_end sub_020250BC

	thumb_func_start sub_020250D8
sub_020250D8: ; 0x020250D8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5, #4]
	mov r7, #0
	cmp r0, #0
	ble _02025108
	add r4, r7, #0
	add r6, r7, #0
_020250E8:
	ldr r0, [r5]
	add r0, r0, r4
	bl sub_020245FC
	ldr r0, [r5]
	add r7, r7, #1
	add r1, r0, r4
	ldr r0, [r5, #8]
	str r1, [r0, r6]
	mov r0, #0x41
	lsl r0, r0, #2
	add r4, r4, r0
	ldr r0, [r5, #4]
	add r6, r6, #4
	cmp r7, r0
	blt _020250E8
_02025108:
	mov r0, #0
	str r0, [r5, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_020250D8

	thumb_func_start sub_02025110
sub_02025110: ; 0x02025110
	ldr r3, [r0, #0xc]
	ldr r1, [r0, #4]
	cmp r3, r1
	blt _0202511C
	mov r0, #0
	bx lr
_0202511C:
	ldr r2, [r0, #8]
	lsl r1, r3, #2
	ldr r2, [r2, r1]
	add r1, r3, #1
	str r1, [r0, #0xc]
	add r0, r2, #0
	bx lr
	.balign 4, 0
	thumb_func_end sub_02025110

	thumb_func_start sub_0202512C
sub_0202512C: ; 0x0202512C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	add r4, r1, #0
	cmp r0, #0
	bgt _0202513C
	mov r0, #0
	pop {r3, r4, r5, pc}
_0202513C:
	add r0, r4, #0
	bl sub_020245FC
	ldr r0, [r5, #0xc]
	sub r0, r0, #1
	str r0, [r5, #0xc]
	ldr r1, [r5, #8]
	lsl r0, r0, #2
	str r4, [r1, r0]
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0202512C
