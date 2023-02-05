	.include "asm/macros.inc"
	.include "unk_02022588.inc"
	.include "global.inc"

	.bss

_021D21F8:
	.space 0x4

	.text

	thumb_func_start sub_02022588
sub_02022588: ; 0x02022588
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, _020225E0 ; =_021D21F8
	add r4, r1, #0
	ldr r0, [r0]
	cmp r0, #0
	bne _020225DC
	add r0, r4, #0
	mov r1, #0x28
	bl AllocFromHeap
	add r1, r0, #0
	ldr r0, _020225E0 ; =_021D21F8
	mov r2, #0x28
	str r1, [r0]
	mov r0, #0
	bl MIi_CpuClear32
	ldr r0, _020225E0 ; =_021D21F8
	mov r1, #0x30
	ldr r0, [r0]
	mul r1, r6
	str r6, [r0, #4]
	add r0, r4, #0
	bl AllocFromHeap
	ldr r7, _020225E0 ; =_021D21F8
	mov r4, #0
	ldr r1, [r7]
	cmp r6, #0
	str r0, [r1]
	ble _020225DC
	add r5, r4, #0
_020225CA:
	ldr r0, [r7]
	ldr r0, [r0]
	add r0, r0, r5
	bl sub_02022874
	add r4, r4, #1
	add r5, #0x30
	cmp r4, r6
	blt _020225CA
_020225DC:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_020225E0: .word _021D21F8
	thumb_func_end sub_02022588

	thumb_func_start sub_020225E4
sub_020225E4: ; 0x020225E4
	cmp r1, #1
	bne _020225F4
	ldr r1, _02022604 ; =_021D21F8
	ldr r2, [r1]
	ldrh r1, [r2, #0x24]
	orr r0, r1
	strh r0, [r2, #0x24]
	bx lr
_020225F4:
	cmp r1, #2
	bne _02022602
	ldr r1, _02022604 ; =_021D21F8
	ldr r2, [r1]
	ldrh r1, [r2, #0x26]
	orr r0, r1
	strh r0, [r2, #0x26]
_02022602:
	bx lr
	.balign 4, 0
_02022604: .word _021D21F8
	thumb_func_end sub_020225E4

	thumb_func_start sub_02022608
sub_02022608: ; 0x02022608
	push {r3, lr}
	ldr r0, _02022630 ; =_021D21F8
	ldr r0, [r0]
	cmp r0, #0
	beq _0202262E
	bl sub_0202276C
	ldr r0, _02022630 ; =_021D21F8
	ldr r0, [r0]
	ldr r0, [r0]
	bl FreeToHeap
	ldr r0, _02022630 ; =_021D21F8
	ldr r0, [r0]
	bl FreeToHeap
	ldr r0, _02022630 ; =_021D21F8
	mov r1, #0
	str r1, [r0]
_0202262E:
	pop {r3, pc}
	.balign 4, 0
_02022630: .word _021D21F8
	thumb_func_end sub_02022608

	thumb_func_start sub_02022634
sub_02022634: ; 0x02022634
	bx lr
	.balign 4, 0
	thumb_func_end sub_02022634

	thumb_func_start sub_02022638
sub_02022638: ; 0x02022638
	push {r3, lr}
	ldr r0, _0202265C ; =_021D21F8
	mov r2, #0
	ldr r1, [r0]
	str r2, [r1, #0xc]
	ldr r1, [r0]
	str r2, [r1, #0x10]
	ldr r1, [r0]
	str r2, [r1, #0x14]
	ldr r0, [r0]
	str r2, [r0, #0x18]
	bl sub_020229E0
	ldr r0, _0202265C ; =_021D21F8
	ldr r0, [r0]
	bl sub_02022AF0
	pop {r3, pc}
	.balign 4, 0
_0202265C: .word _021D21F8
	thumb_func_end sub_02022638

	thumb_func_start sub_02022660
sub_02022660: ; 0x02022660
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_020229A4
	add r4, r0, #0
	bne _02022674
	bl GF_AssertFail
	mov r0, #0
	pop {r3, r4, r5, pc}
_02022674:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02022840
	cmp r0, #0
	bne _02022684
	mov r0, #0
	pop {r3, r4, r5, pc}
_02022684:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02022890
	cmp r0, #0
	bne _0202269A
	ldr r0, [r5, #0xc]
	bl sub_02022744
	mov r0, #0
	pop {r3, r4, r5, pc}
_0202269A:
	add r0, r4, #0
	bl sub_02022AF8
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02022660

	thumb_func_start sub_020226A4
sub_020226A4: ; 0x020226A4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_020229A4
	add r4, r0, #0
	bne _020226B8
	bl GF_AssertFail
	mov r0, #0
	pop {r3, r4, r5, pc}
_020226B8:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02022840
	cmp r0, #0
	bne _020226C8
	mov r0, #0
	pop {r3, r4, r5, pc}
_020226C8:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_020228E8
	cmp r0, #0
	bne _020226DE
	ldr r0, [r5, #0xc]
	bl sub_02022744
	mov r0, #0
	pop {r3, r4, r5, pc}
_020226DE:
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_020226A4

	thumb_func_start sub_020226E4
sub_020226E4: ; 0x020226E4
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r5, r1, #0
	bne _020226F0
	bl GF_AssertFail
_020226F0:
	add r0, r4, #0
	bl sub_0202296C
	add r4, r0, #0
	bne _020226FE
	bl GF_AssertFail
_020226FE:
	str r5, [r4]
	ldr r1, [r4, #4]
	mov r0, #1
	tst r0, r1
	beq _02022716
	ldr r3, [r4, #8]
	ldr r1, [r4, #0x24]
	ldr r2, [r5, #0xc]
	mov r0, #0xe
	lsl r3, r3, #5
	bl GF_CreateNewVramTransferTask
_02022716:
	ldr r1, [r4, #4]
	mov r0, #2
	tst r0, r1
	beq _0202272C
	ldr r3, [r4, #8]
	ldr r1, [r4, #0x28]
	ldr r2, [r5, #0xc]
	mov r0, #0x1e
	lsl r3, r3, #5
	bl GF_CreateNewVramTransferTask
_0202272C:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_020226E4

	thumb_func_start sub_02022730
sub_02022730: ; 0x02022730
	push {r3, lr}
	bl sub_0202296C
	cmp r0, #0
	beq _0202273E
	mov r0, #1
	pop {r3, pc}
_0202273E:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02022730

	thumb_func_start sub_02022744
sub_02022744: ; 0x02022744
	push {r4, lr}
	bl sub_0202296C
	add r4, r0, #0
	bne _02022752
	bl GF_AssertFail
_02022752:
	add r0, r4, #0
	add r0, #0x2c
	ldrb r0, [r0]
	cmp r0, #1
	bne _02022768
	add r0, r4, #0
	bl sub_02022B34
	add r0, r4, #0
	bl sub_02022838
_02022768:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02022744

	thumb_func_start sub_0202276C
sub_0202276C: ; 0x0202276C
	push {r4, r5, r6, lr}
	ldr r6, _020227A8 ; =_021D21F8
	mov r4, #0
	ldr r1, [r6]
	ldr r0, [r1, #4]
	cmp r0, #0
	ble _020227A4
	add r5, r4, #0
_0202277C:
	ldr r1, [r1]
	add r0, r1, r5
	add r0, #0x2c
	ldrb r0, [r0]
	cmp r0, #1
	bne _02022798
	add r0, r1, r5
	bl sub_02022B34
	ldr r0, [r6]
	ldr r0, [r0]
	add r0, r0, r5
	bl sub_02022838
_02022798:
	ldr r1, [r6]
	add r4, r4, #1
	ldr r0, [r1, #4]
	add r5, #0x30
	cmp r4, r0
	blt _0202277C
_020227A4:
	pop {r4, r5, r6, pc}
	nop
_020227A8: .word _021D21F8
	thumb_func_end sub_0202276C

	thumb_func_start sub_020227AC
sub_020227AC: ; 0x020227AC
	push {r3, lr}
	bl sub_0202296C
	cmp r0, #0
	bne _020227C0
	bne _020227BC
	bl GF_AssertFail
_020227BC:
	mov r0, #0
	pop {r3, pc}
_020227C0:
	add r1, r0, #0
	add r1, #0x2c
	ldrb r1, [r1]
	cmp r1, #1
	bne _020227CE
	add r0, #0x10
	pop {r3, pc}
_020227CE:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_020227AC

	thumb_func_start sub_020227D4
sub_020227D4: ; 0x020227D4
	push {r4, lr}
	add r4, r1, #0
	bl sub_0202296C
	cmp r0, #0
	bne _020227EA
	bne _020227E6
	bl GF_AssertFail
_020227E6:
	mov r0, #0
	pop {r4, pc}
_020227EA:
	add r1, r0, #0
	add r1, #0x2c
	ldrb r1, [r1]
	cmp r1, #1
	beq _020227F8
	mov r0, #0
	pop {r4, pc}
_020227F8:
	ldr r1, [r0]
	ldr r1, [r1, #4]
	cmp r1, #0
	beq _02022804
	mov r1, #1
	str r1, [r4, #0x18]
_02022804:
	add r0, #0x10
	pop {r4, pc}
	thumb_func_end sub_020227D4

	thumb_func_start sub_02022808
sub_02022808: ; 0x02022808
	push {r4, lr}
	ldr r2, [r0, #4]
	cmp r2, #0
	beq _02022816
	mov r4, #2
	lsl r4, r4, #8
	b _02022822
_02022816:
	ldr r2, [r0]
	cmp r2, #4
	bne _02022820
	mov r4, #0
	b _02022822
_02022820:
	mov r4, #0x20
_02022822:
	cmp r4, #0
	beq _02022832
	bl NNS_G2dGetImagePaletteLocation
	add r1, r4, #0
	bl _u32_div_f
	pop {r4, pc}
_02022832:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02022808

	thumb_func_start sub_02022838
sub_02022838: ; 0x02022838
	ldr r3, _0202283C ; =sub_02022874
	bx r3
	.balign 4, 0
_0202283C: .word sub_02022874
	thumb_func_end sub_02022838

	thumb_func_start sub_02022840
sub_02022840: ; 0x02022840
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r1, #0
	str r0, [r4]
	ldr r0, [r5, #0xc]
	bl sub_02022730
	cmp r0, #1
	bne _0202285C
	bl GF_AssertFail
	mov r0, #0
	pop {r3, r4, r5, pc}
_0202285C:
	ldr r0, [r5, #0xc]
	add r1, r4, #0
	str r0, [r4, #0xc]
	ldr r0, [r5, #4]
	add r1, #0x2c
	str r0, [r4, #4]
	mov r0, #1
	strb r0, [r1]
	ldr r1, [r5, #8]
	str r1, [r4, #8]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02022840

	thumb_func_start sub_02022874
sub_02022874: ; 0x02022874
	push {r4, lr}
	mov r1, #0
	mov r2, #0x30
	add r4, r0, #0
	bl memset
	mov r0, #0
	mvn r0, r0
	str r0, [r4, #0xc]
	add r4, #0x10
	add r0, r4, #0
	bl NNS_G2dInitImagePaletteProxy
	pop {r4, pc}
	thumb_func_end sub_02022874

	thumb_func_start sub_02022890
sub_02022890: ; 0x02022890
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r6, r1, #0
	ldr r0, [r6]
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _020228B0
	ldr r0, _020228E4 ; =_021D21F8
	ldr r0, [r0]
	add r4, r0, #0
	add r5, r0, #0
	ldr r3, [r0, #0x1c]
	add r4, #0x14
	add r5, #0x18
	ldr r0, [r0, #0x20]
	b _020228C0
_020228B0:
	ldr r0, _020228E4 ; =_021D21F8
	mov r3, #2
	ldr r5, [r0]
	lsl r3, r3, #8
	add r4, r5, #0
	add r4, #0xc
	add r5, #0x10
	add r0, r3, #0
_020228C0:
	str r0, [sp]
	ldr r1, [r4]
	ldr r2, [r5]
	add r0, r6, #0
	bl sub_02022B70
	add r0, r6, #0
	bl sub_02022A28
	add r0, r6, #0
	add r1, r4, #0
	add r2, r5, #0
	bl sub_02022BBC
	mov r0, #1
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_020228E4: .word _021D21F8
	thumb_func_end sub_02022890

	thumb_func_start sub_020228E8
sub_020228E8: ; 0x020228E8
	push {r4, r5, r6, lr}
	add r5, r1, #0
	ldr r0, [r5]
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _020228F8
	bl GF_AssertFail
_020228F8:
	ldr r1, [r5, #4]
	mov r0, #1
	tst r0, r1
	beq _0202291A
	ldr r0, _02022968 ; =_021D21F8
	ldr r1, [r5, #8]
	ldr r0, [r0]
	ldrh r0, [r0, #0x24]
	bl sub_02022AB0
	add r6, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r6, r0
	bne _0202291A
	mov r0, #0
	pop {r4, r5, r6, pc}
_0202291A:
	ldr r1, [r5, #4]
	mov r0, #2
	tst r0, r1
	beq _0202293C
	ldr r0, _02022968 ; =_021D21F8
	ldr r1, [r5, #8]
	ldr r0, [r0]
	ldrh r0, [r0, #0x26]
	bl sub_02022AB0
	add r4, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	bne _0202293C
	mov r0, #0
	pop {r4, r5, r6, pc}
_0202293C:
	ldr r1, [r5, #4]
	mov r0, #1
	tst r0, r1
	beq _02022946
	str r6, [r5, #0x24]
_02022946:
	ldr r1, [r5, #4]
	mov r0, #2
	tst r0, r1
	beq _02022950
	str r4, [r5, #0x28]
_02022950:
	ldr r0, [r5, #8]
	lsl r1, r0, #5
	ldr r0, [r5]
	str r1, [r0, #8]
	add r0, r5, #0
	bl sub_02022A38
	add r0, r5, #0
	bl sub_02022AF8
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02022968: .word _021D21F8
	thumb_func_end sub_020228E8

	thumb_func_start sub_0202296C
sub_0202296C: ; 0x0202296C
	push {r4, r5}
	ldr r2, _020229A0 ; =_021D21F8
	mov r1, #0
	ldr r5, [r2]
	ldr r2, [r5, #4]
	cmp r2, #0
	ble _02022998
	ldr r2, [r5]
	add r4, r2, #0
_0202297E:
	ldr r3, [r4, #0xc]
	cmp r0, r3
	bne _0202298E
	mov r0, #0x30
	mul r0, r1
	add r0, r2, r0
	pop {r4, r5}
	bx lr
_0202298E:
	ldr r3, [r5, #4]
	add r1, r1, #1
	add r4, #0x30
	cmp r1, r3
	blt _0202297E
_02022998:
	mov r0, #0
	pop {r4, r5}
	bx lr
	nop
_020229A0: .word _021D21F8
	thumb_func_end sub_0202296C

	thumb_func_start sub_020229A4
sub_020229A4: ; 0x020229A4
	push {r3, r4}
	ldr r1, _020229DC ; =_021D21F8
	mov r0, #0
	ldr r4, [r1]
	ldr r1, [r4, #4]
	cmp r1, #0
	ble _020229D4
	ldr r1, [r4]
	add r3, r1, #0
_020229B6:
	add r2, r3, #0
	add r2, #0x2c
	ldrb r2, [r2]
	cmp r2, #0
	bne _020229CA
	mov r2, #0x30
	mul r2, r0
	add r0, r1, r2
	pop {r3, r4}
	bx lr
_020229CA:
	ldr r2, [r4, #4]
	add r0, r0, #1
	add r3, #0x30
	cmp r0, r2
	blt _020229B6
_020229D4:
	mov r0, #0
	pop {r3, r4}
	bx lr
	nop
_020229DC: .word _021D21F8
	thumb_func_end sub_020229A4

	thumb_func_start sub_020229E0
sub_020229E0: ; 0x020229E0
	push {r3, lr}
	bl GX_GetBankForOBJExtPltt
	cmp r0, #0x20
	beq _020229EE
	cmp r0, #0x40
	bne _020229FA
_020229EE:
	ldr r0, _02022A24 ; =_021D21F8
	mov r1, #2
	ldr r0, [r0]
	lsl r1, r1, #0xc
	str r1, [r0, #0x1c]
	b _02022A02
_020229FA:
	ldr r0, _02022A24 ; =_021D21F8
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0, #0x1c]
_02022A02:
	bl GX_GetBankForSubOBJExtPltt
	mov r1, #1
	lsl r1, r1, #8
	cmp r0, r1
	bne _02022A18
	ldr r0, _02022A24 ; =_021D21F8
	lsl r1, r1, #5
	ldr r0, [r0]
	str r1, [r0, #0x20]
	pop {r3, pc}
_02022A18:
	ldr r0, _02022A24 ; =_021D21F8
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0, #0x20]
	pop {r3, pc}
	nop
_02022A24: .word _021D21F8
	thumb_func_end sub_020229E0

	thumb_func_start sub_02022A28
sub_02022A28: ; 0x02022A28
	ldr r1, [r0, #8]
	ldr r3, _02022A34 ; =sub_02022A38
	lsl r2, r1, #5
	ldr r1, [r0]
	str r2, [r1, #8]
	bx r3
	.balign 4, 0
_02022A34: .word sub_02022A38
	thumb_func_end sub_02022A28

	thumb_func_start sub_02022A38
sub_02022A38: ; 0x02022A38
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x10
	bl NNS_G2dInitImagePaletteProxy
	ldr r0, [r4, #4]
	mov r2, #1
	tst r0, r2
	beq _02022A56
	add r3, r4, #0
	ldr r0, [r4]
	ldr r1, [r4, #0x24]
	add r3, #0x10
	bl NNS_G2dLoadPalette
_02022A56:
	ldr r0, [r4, #4]
	mov r2, #2
	tst r0, r2
	beq _02022A6A
	ldr r0, [r4]
	ldr r1, [r4, #0x28]
	add r4, #0x10
	add r3, r4, #0
	bl NNS_G2dLoadPalette
_02022A6A:
	pop {r4, pc}
	thumb_func_end sub_02022A38

	thumb_func_start sub_02022A6C
sub_02022A6C: ; 0x02022A6C
	push {r4, r5, r6, r7}
	mov r3, #0
	cmp r1, #0
	ble _02022A8A
	mov r5, #1
_02022A76:
	ldrh r7, [r0]
	add r4, r2, r3
	add r6, r5, #0
	lsl r6, r4
	add r4, r7, #0
	orr r4, r6
	add r3, r3, #1
	strh r4, [r0]
	cmp r3, r1
	blt _02022A76
_02022A8A:
	pop {r4, r5, r6, r7}
	bx lr
	.balign 4, 0
	thumb_func_end sub_02022A6C

	thumb_func_start sub_02022A90
sub_02022A90: ; 0x02022A90
	push {r4, r5, r6, r7}
	mov r4, #0
	cmp r1, #0
	ble _02022AAC
	mov r6, #1
_02022A9A:
	add r5, r2, r4
	add r7, r6, #0
	ldrh r3, [r0]
	lsl r7, r5
	bic r3, r7
	add r4, r4, #1
	strh r3, [r0]
	cmp r4, r1
	blt _02022A9A
_02022AAC:
	pop {r4, r5, r6, r7}
	bx lr
	thumb_func_end sub_02022A90

	thumb_func_start sub_02022AB0
sub_02022AB0: ; 0x02022AB0
	push {r4, r5, r6, r7}
	mov r3, #0
	mov r6, #1
	add r2, r3, #0
_02022AB8:
	add r4, r2, #0
	b _02022AC2
_02022ABC:
	cmp r5, #0x10
	bge _02022AD0
	add r4, r4, #1
_02022AC2:
	add r5, r3, r4
	add r7, r6, #0
	lsl r7, r5
	tst r7, r0
	bne _02022AD0
	cmp r4, r1
	blt _02022ABC
_02022AD0:
	cmp r4, r1
	bge _02022ADC
	add r3, r3, r4
	add r3, r3, #1
	cmp r3, #0x10
	blt _02022AB8
_02022ADC:
	cmp r3, #0x10
	blt _02022AE8
	mov r0, #0
	mvn r0, r0
	pop {r4, r5, r6, r7}
	bx lr
_02022AE8:
	lsl r0, r3, #5
	pop {r4, r5, r6, r7}
	bx lr
	.balign 4, 0
	thumb_func_end sub_02022AB0

	thumb_func_start sub_02022AF0
sub_02022AF0: ; 0x02022AF0
	mov r1, #0
	strh r1, [r0, #0x24]
	strh r1, [r0, #0x26]
	bx lr
	thumb_func_end sub_02022AF0

	thumb_func_start sub_02022AF8
sub_02022AF8: ; 0x02022AF8
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #4]
	mov r0, #1
	tst r0, r1
	beq _02022B14
	ldr r0, _02022B30 ; =_021D21F8
	ldr r2, [r4, #0x24]
	ldr r0, [r0]
	ldr r1, [r4, #8]
	add r0, #0x24
	lsr r2, r2, #5
	bl sub_02022A6C
_02022B14:
	ldr r1, [r4, #4]
	mov r0, #2
	tst r0, r1
	beq _02022B2C
	ldr r0, _02022B30 ; =_021D21F8
	ldr r2, [r4, #0x28]
	ldr r0, [r0]
	ldr r1, [r4, #8]
	add r0, #0x26
	lsr r2, r2, #5
	bl sub_02022A6C
_02022B2C:
	pop {r4, pc}
	nop
_02022B30: .word _021D21F8
	thumb_func_end sub_02022AF8

	thumb_func_start sub_02022B34
sub_02022B34: ; 0x02022B34
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #4]
	mov r0, #1
	tst r0, r1
	beq _02022B50
	ldr r0, _02022B6C ; =_021D21F8
	ldr r2, [r4, #0x24]
	ldr r0, [r0]
	ldr r1, [r4, #8]
	add r0, #0x24
	lsr r2, r2, #5
	bl sub_02022A90
_02022B50:
	ldr r1, [r4, #4]
	mov r0, #2
	tst r0, r1
	beq _02022B68
	ldr r0, _02022B6C ; =_021D21F8
	ldr r2, [r4, #0x28]
	ldr r0, [r0]
	ldr r1, [r4, #8]
	add r0, #0x26
	lsr r2, r2, #5
	bl sub_02022A90
_02022B68:
	pop {r4, pc}
	nop
_02022B6C: .word _021D21F8
	thumb_func_end sub_02022B34

	thumb_func_start sub_02022B70
sub_02022B70: ; 0x02022B70
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r2, #0
	ldr r2, [r5, #4]
	mov r0, #1
	tst r2, r0
	beq _02022B96
	ldr r2, [r5, #8]
	lsl r2, r2, #5
	add r2, r1, r2
	cmp r2, r3
	bls _02022B94
	bl GF_AssertFail
	bl sub_02022634
	mov r0, #0
	b _02022B96
_02022B94:
	str r1, [r5, #0x24]
_02022B96:
	ldr r2, [r5, #4]
	mov r1, #2
	tst r1, r2
	beq _02022BB8
	ldr r1, [r5, #8]
	lsl r1, r1, #5
	add r2, r4, r1
	ldr r1, [sp, #0x10]
	cmp r2, r1
	bls _02022BB6
	bl GF_AssertFail
	bl sub_02022634
	mov r0, #0
	pop {r3, r4, r5, pc}
_02022BB6:
	str r4, [r5, #0x28]
_02022BB8:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02022B70

	thumb_func_start sub_02022BBC
sub_02022BBC: ; 0x02022BBC
	push {r3, r4}
	ldr r4, [r0, #4]
	mov r3, #1
	tst r3, r4
	beq _02022BD0
	ldr r3, [r0, #8]
	ldr r4, [r1]
	lsl r3, r3, #5
	add r3, r4, r3
	str r3, [r1]
_02022BD0:
	ldr r3, [r0, #4]
	mov r1, #2
	tst r1, r3
	beq _02022BE2
	ldr r0, [r0, #8]
	ldr r1, [r2]
	lsl r0, r0, #5
	add r0, r1, r0
	str r0, [r2]
_02022BE2:
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end sub_02022BBC
