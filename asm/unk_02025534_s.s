	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_020255C4
sub_020255C4: ; 0x020255C4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r7, r1, #0
	add r6, r2, #0
	cmp r5, #0
	bne _020255D4
	bl GF_AssertFail
_020255D4:
	add r0, r5, #0
	bl sub_02025738
	add r4, r0, #0
	bne _020255E2
	bl GF_AssertFail
_020255E2:
	add r0, r5, #0
	add r1, r6, #0
	bl sub_020255A0
	cmp r0, #1
	beq _020255F2
	bl GF_AssertFail
_020255F2:
	str r7, [r4, #4]
	str r6, [r4]
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_020255C4

	thumb_func_start sub_02025600
sub_02025600: ; 0x02025600
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	add r7, r2, #0
	str r3, [sp]
	cmp r5, #0
	bne _02025612
	bl GF_AssertFail
_02025612:
	cmp r6, #0
	bne _0202561A
	bl GF_AssertFail
_0202561A:
	add r0, r5, #0
	bl sub_02025738
	add r4, r0, #0
	bne _02025628
	bl GF_AssertFail
_02025628:
	add r0, r5, #0
	add r1, r7, #0
	bl sub_020255A0
	cmp r0, #1
	beq _02025638
	bl GF_AssertFail
_02025638:
	ldr r0, [sp]
	add r1, r6, #0
	bl Sys_AllocAndReadFile
	str r0, [r4, #4]
	cmp r0, #0
	bne _0202564A
	bl GF_AssertFail
_0202564A:
	str r7, [r4]
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02025600

	thumb_func_start sub_02025658
sub_02025658: ; 0x02025658
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	cmp r5, #0
	bne _02025666
	bl GF_AssertFail
_02025666:
	cmp r4, #0
	bne _0202566E
	bl GF_AssertFail
_0202566E:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0202567C
	bl FreeToHeap
	mov r0, #0
	str r0, [r4, #4]
_0202567C:
	mov r0, #0
	mvn r0, r0
	str r0, [r4]
	ldr r0, [r5, #8]
	sub r0, r0, #1
	str r0, [r5, #8]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02025658

	thumb_func_start sub_0202568C
sub_0202568C: ; 0x0202568C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bne _02025696
	bl GF_AssertFail
_02025696:
	ldr r0, [r5]
	cmp r0, #0
	bne _020256A0
	bl GF_AssertFail
_020256A0:
	ldr r0, [r5, #4]
	mov r6, #0
	cmp r0, #0
	ble _020256C6
	add r4, r6, #0
	sub r7, r6, #1
_020256AC:
	ldr r1, [r5]
	ldr r0, [r1, r4]
	cmp r0, r7
	beq _020256BC
	add r0, r5, #0
	add r1, r1, r4
	bl sub_02025658
_020256BC:
	ldr r0, [r5, #4]
	add r6, r6, #1
	add r4, #8
	cmp r6, r0
	blt _020256AC
_020256C6:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0202568C

	thumb_func_start sub_020256C8
sub_020256C8: ; 0x020256C8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	cmp r5, #0
	bne _020256D6
	bl GF_AssertFail
_020256D6:
	ldr r6, [r5, #4]
	mov r1, #0
	cmp r6, #0
	ble _020256F6
	ldr r3, [r5]
	add r2, r3, #0
_020256E2:
	ldr r0, [r2]
	cmp r4, r0
	bne _020256EE
	lsl r0, r1, #3
	add r0, r3, r0
	pop {r4, r5, r6, pc}
_020256EE:
	add r1, r1, #1
	add r2, #8
	cmp r1, r6
	blt _020256E2
_020256F6:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_020256C8

	thumb_func_start sub_020256FC
sub_020256FC: ; 0x020256FC
	push {r4, lr}
	add r4, r0, #0
	bne _02025706
	bl GF_AssertFail
_02025706:
	ldr r0, [r4, #4]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020256FC

	thumb_func_start sub_0202570C
sub_0202570C: ; 0x0202570C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	cmp r5, #0
	bne _0202571A
	bl GF_AssertFail
_0202571A:
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _02025724
	bl FreeToHeap
_02025724:
	str r4, [r5, #4]
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0202570C

	thumb_func_start Get2DGfxRawResObjId
Get2DGfxRawResObjId: ; 0x02025728
	push {r4, lr}
	add r4, r0, #0
	bne _02025732
	bl GF_AssertFail
_02025732:
	ldr r0, [r4]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end Get2DGfxRawResObjId

	thumb_func_start sub_02025738
sub_02025738: ; 0x02025738
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bne _02025742
	bl GF_AssertFail
_02025742:
	ldr r5, [r4, #4]
	mov r2, #0
	cmp r5, #0
	ble _02025764
	ldr r4, [r4]
	sub r0, r2, #1
	add r3, r4, #0
_02025750:
	ldr r1, [r3]
	cmp r1, r0
	bne _0202575C
	lsl r0, r2, #3
	add r0, r4, r0
	pop {r3, r4, r5, pc}
_0202575C:
	add r2, r2, #1
	add r3, #8
	cmp r2, r5
	blt _02025750
_02025764:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02025738

	thumb_func_start sub_02025768
sub_02025768: ; 0x02025768
	push {r4, lr}
	add r4, r0, #0
	bne _02025772
	bl GF_AssertFail
_02025772:
	mov r0, #0
	mvn r0, r0
	str r0, [r4]
	mov r0, #0
	str r0, [r4, #4]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02025768

	thumb_func_start sub_02025780
sub_02025780: ; 0x02025780
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r6, r0, #0
	add r0, r4, #0
	mov r1, #8
	bl AllocFromHeap
	add r7, r0, #0
	add r0, r6, #0
	add r1, r4, #0
	bl Create2DGfxResMan
	mov r1, #0x18
	str r0, [r7]
	add r0, r4, #0
	mul r1, r6
	bl AllocFromHeap
	mov r4, #0
	str r0, [r7, #4]
	cmp r6, #0
	ble _020257BE
	add r5, r4, #0
_020257AE:
	ldr r0, [r7, #4]
	add r0, r0, r5
	bl sub_02025B04
	add r4, r4, #1
	add r5, #0x18
	cmp r4, r6
	blt _020257AE
_020257BE:
	add r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02025780

	thumb_func_start sub_020257C4
sub_020257C4: ; 0x020257C4
	push {r4, lr}
	add r4, r0, #0
	bne _020257CE
	bl GF_AssertFail
_020257CE:
	add r0, r4, #0
	bl sub_02025900
	ldr r0, [r4]
	bl Destroy2DGfxResMan
	ldr r0, [r4, #4]
	bl FreeToHeap
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end sub_020257C4

	thumb_func_start sub_020257E8
sub_020257E8: ; 0x020257E8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	cmp r5, #0
	bne _020257F6
	bl GF_AssertFail
_020257F6:
	ldr r0, [r5]
	add r1, r4, #0
	bl sub_020255A0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_020257E8

	thumb_func_start sub_02025800
sub_02025800: ; 0x02025800
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	add r7, r3, #0
	str r2, [sp]
	cmp r5, #0
	bne _02025812
	bl GF_AssertFail
_02025812:
	add r0, r5, #0
	bl sub_02025AD4
	add r4, r0, #0
	strh r7, [r4, #0x16]
	ldrh r0, [r4, #0x16]
	cmp r0, #1
	bne _02025830
	ldr r1, [sp, #0x18]
	add r0, r6, #0
	bl sub_02025C08
	add r1, r0, #0
	str r6, [r4, #0x10]
	b _02025836
_02025830:
	mov r0, #0
	add r1, r6, #0
	str r0, [r4, #0x10]
_02025836:
	ldr r0, [r5]
	ldr r2, [sp]
	bl sub_020255C4
	str r0, [r4]
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02025800

	thumb_func_start sub_02025844
sub_02025844: ; 0x02025844
	push {r3, r4, lr}
	sub sp, #4
	ldr r4, [sp, #0x10]
	str r4, [sp]
	bl sub_02025800
	add r4, r0, #0
	bl sub_02025A64
	add r0, r4, #0
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end sub_02025844

	thumb_func_start sub_0202585C
sub_0202585C: ; 0x0202585C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	cmp r5, #0
	bne _0202586A
	bl GF_AssertFail
_0202586A:
	cmp r4, #0
	bne _02025872
	bl GF_AssertFail
_02025872:
	ldrh r0, [r4, #0x16]
	cmp r0, #1
	bne _02025888
	ldrh r0, [r4, #0x14]
	cmp r0, #0
	bne _02025888
	ldr r0, [r4, #0x10]
	bl FreeToHeap
	mov r0, #0
	strh r0, [r4, #0x16]
_02025888:
	ldr r1, [r4]
	cmp r1, #0
	beq _02025894
	ldr r0, [r5]
	bl sub_02025658
_02025894:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _020258A8
	ldr r1, _020258D8 ; =NNS_GfdDefaultFuncFreeTexVram
	ldr r1, [r1]
	blx r1
	cmp r0, #0
	beq _020258A8
	bl GF_AssertFail
_020258A8:
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _020258BC
	ldr r1, _020258D8 ; =NNS_GfdDefaultFuncFreeTexVram
	ldr r1, [r1]
	blx r1
	cmp r0, #0
	beq _020258BC
	bl GF_AssertFail
_020258BC:
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq _020258D0
	ldr r1, _020258DC ; =NNS_GfdDefaultFuncFreePlttVram
	ldr r1, [r1]
	blx r1
	cmp r0, #0
	beq _020258D0
	bl GF_AssertFail
_020258D0:
	add r0, r4, #0
	bl sub_02025B04
	pop {r3, r4, r5, pc}
	.balign 4, 0
_020258D8: .word NNS_GfdDefaultFuncFreeTexVram
_020258DC: .word NNS_GfdDefaultFuncFreePlttVram
	thumb_func_end sub_0202585C

	thumb_func_start sub_020258E0
sub_020258E0: ; 0x020258E0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	cmp r5, #0
	bne _020258EE
	bl GF_AssertFail
_020258EE:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02025940
	add r1, r0, #0
	add r0, r5, #0
	bl sub_0202585C
	pop {r3, r4, r5, pc}
	thumb_func_end sub_020258E0

	thumb_func_start sub_02025900
sub_02025900: ; 0x02025900
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bne _0202590A
	bl GF_AssertFail
_0202590A:
	ldr r0, [r5, #4]
	cmp r0, #0
	bne _02025914
	bl GF_AssertFail
_02025914:
	ldr r0, [r5]
	mov r6, #0
	ldr r0, [r0, #4]
	cmp r0, #0
	ble _0202593C
	add r4, r6, #0
_02025920:
	ldr r1, [r5, #4]
	ldr r0, [r1, r4]
	cmp r0, #0
	beq _02025930
	add r0, r5, #0
	add r1, r1, r4
	bl sub_0202585C
_02025930:
	ldr r0, [r5]
	add r6, r6, #1
	ldr r0, [r0, #4]
	add r4, #0x18
	cmp r6, r0
	blt _02025920
_0202593C:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02025900

	thumb_func_start sub_02025940
sub_02025940: ; 0x02025940
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r7, r1, #0
	cmp r6, #0
	bne _0202594E
	bl GF_AssertFail
_0202594E:
	ldr r0, [r6]
	mov r4, #0
	ldr r0, [r0, #4]
	cmp r0, #0
	ble _02025982
	add r5, r4, #0
_0202595A:
	ldr r1, [r6, #4]
	ldr r0, [r1, r5]
	cmp r0, #0
	beq _02025976
	add r0, r1, r5
	bl sub_02025988
	cmp r0, r7
	bne _02025976
	mov r0, #0x18
	ldr r1, [r6, #4]
	mul r0, r4
	add r0, r1, r0
	pop {r3, r4, r5, r6, r7, pc}
_02025976:
	ldr r0, [r6]
	add r4, r4, #1
	ldr r0, [r0, #4]
	add r5, #0x18
	cmp r4, r0
	blt _0202595A
_02025982:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02025940

	thumb_func_start sub_02025988
sub_02025988: ; 0x02025988
	push {r4, lr}
	add r4, r0, #0
	bne _02025992
	bl GF_AssertFail
_02025992:
	ldr r0, [r4]
	bl Get2DGfxRawResObjId
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02025988

	thumb_func_start sub_0202599C
sub_0202599C: ; 0x0202599C
	push {r4, lr}
	add r4, r0, #0
	bne _020259A6
	bl GF_AssertFail
_020259A6:
	add r0, r4, #0
	bl sub_02025B18
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0202599C

	thumb_func_start sub_020259B0
sub_020259B0: ; 0x020259B0
	push {r4, lr}
	add r4, r0, #0
	bne _020259BA
	bl GF_AssertFail
_020259BA:
	ldrh r0, [r4, #0x14]
	cmp r0, #0
	beq _020259C4
	bl GF_AssertFail
_020259C4:
	ldr r0, [r4, #0xc]
	cmp r0, #0
	bne _020259D0
	bl GF_AssertFail
	pop {r4, pc}
_020259D0:
	add r0, r4, #0
	bl sub_02025B28
	add r1, r4, #0
	bl sub_02025BB0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020259B0

	thumb_func_start sub_020259E0
sub_020259E0: ; 0x020259E0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	cmp r5, #0
	bne _020259EE
	bl GF_AssertFail
_020259EE:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02025940
	bl sub_020259B0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_020259E0

	thumb_func_start sub_020259FC
sub_020259FC: ; 0x020259FC
	push {r4, lr}
	add r4, r0, #0
	bne _02025A06
	bl GF_AssertFail
_02025A06:
	ldrh r0, [r4, #0x16]
	cmp r0, #0
	bne _02025A12
	bl GF_AssertFail
	pop {r4, pc}
_02025A12:
	ldrh r0, [r4, #0x14]
	cmp r0, #0
	beq _02025A1E
	bl GF_AssertFail
	pop {r4, pc}
_02025A1E:
	add r0, r4, #0
	bl sub_02025B28
	bl sub_02025BF0
	add r0, r4, #0
	bl sub_02025B18
	ldr r1, [r4, #4]
	ldr r2, [r4, #8]
	ldr r3, [r4, #0xc]
	bl sub_02025BDC
	ldr r0, [r4, #0x10]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4, #0x10]
	mov r0, #1
	strh r0, [r4, #0x14]
	pop {r4, pc}
	thumb_func_end sub_020259FC

	thumb_func_start sub_02025A48
sub_02025A48: ; 0x02025A48
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	cmp r5, #0
	bne _02025A56
	bl GF_AssertFail
_02025A56:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02025940
	bl sub_020259FC
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02025A48

	thumb_func_start sub_02025A64
sub_02025A64: ; 0x02025A64
	push {r4, lr}
	add r4, r0, #0
	bne _02025A6E
	bl GF_AssertFail
_02025A6E:
	ldrh r0, [r4, #0x14]
	cmp r0, #0
	beq _02025A78
	bl GF_AssertFail
_02025A78:
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq _02025A84
	bl GF_AssertFail
	pop {r4, pc}
_02025A84:
	add r0, r4, #0
	bl sub_02025B28
	add r2, r4, #0
	add r1, r4, #4
	add r4, #0xc
	add r2, #8
	add r3, r4, #0
	bl sub_02025B40
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02025A64

	thumb_func_start sub_02025A9C
sub_02025A9C: ; 0x02025A9C
	push {r4, lr}
	add r4, r0, #0
	bne _02025AA6
	bl GF_AssertFail
_02025AA6:
	ldr r0, [r4, #4]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02025A9C

	thumb_func_start sub_02025AAC
sub_02025AAC: ; 0x02025AAC
	push {r4, lr}
	add r4, r0, #0
	bne _02025AB6
	bl GF_AssertFail
_02025AB6:
	ldr r0, [r4, #8]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02025AAC

	thumb_func_start sub_02025ABC
sub_02025ABC: ; 0x02025ABC
	push {r4, lr}
	add r4, r0, #0
	bne _02025AC6
	bl GF_AssertFail
_02025AC6:
	ldr r0, [r4, #0xc]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02025ABC

	thumb_func_start sub_02025ACC
sub_02025ACC: ; 0x02025ACC
	ldr r3, _02025AD0 ; =sub_02025C2C
	bx r3
	.balign 4, 0
_02025AD0: .word sub_02025C2C
	thumb_func_end sub_02025ACC

	thumb_func_start sub_02025AD4
sub_02025AD4: ; 0x02025AD4
	push {r3, r4}
	ldr r1, [r0]
	mov r2, #0
	ldr r4, [r1, #4]
	cmp r4, #0
	ble _02025AFC
	ldr r3, [r0, #4]
_02025AE2:
	ldr r1, [r3]
	cmp r1, #0
	bne _02025AF4
	ldr r1, [r0, #4]
	mov r0, #0x18
	mul r0, r2
	add r0, r1, r0
	pop {r3, r4}
	bx lr
_02025AF4:
	add r2, r2, #1
	add r3, #0x18
	cmp r2, r4
	blt _02025AE2
_02025AFC:
	mov r0, #0
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end sub_02025AD4

	thumb_func_start sub_02025B04
sub_02025B04: ; 0x02025B04
	mov r1, #0
	str r1, [r0]
	str r1, [r0, #4]
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	strh r1, [r0, #0x14]
	str r1, [r0, #0x10]
	strh r1, [r0, #0x14]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02025B04

	thumb_func_start sub_02025B18
sub_02025B18: ; 0x02025B18
	push {r3, lr}
	ldr r0, [r0]
	bl sub_020256FC
	bl NNS_G3dGetTex
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02025B18

	thumb_func_start sub_02025B28
sub_02025B28: ; 0x02025B28
	push {r3, lr}
	ldrh r1, [r0, #0x16]
	cmp r1, #0
	bne _02025B38
	ldr r0, [r0]
	bl sub_020256FC
	b _02025B3A
_02025B38:
	ldr r0, [r0, #0x10]
_02025B3A:
	bl NNS_G3dGetTex
	pop {r3, pc}
	thumb_func_end sub_02025B28

	thumb_func_start sub_02025B40
sub_02025B40: ; 0x02025B40
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	str r1, [sp]
	str r2, [sp, #4]
	str r3, [sp, #8]
	bl NNS_G3dTexGetRequiredSize
	add r7, r0, #0
	add r0, r5, #0
	bl NNS_G3dTex4x4GetRequiredSize
	add r6, r0, #0
	add r0, r5, #0
	bl NNS_G3dPlttGetRequiredSize
	add r4, r0, #0
	cmp r7, #0
	beq _02025B76
	ldr r3, _02025BA8 ; =NNS_GfdDefaultFuncAllocTexVram
	mov r1, #0
	ldr r3, [r3]
	add r0, r7, #0
	add r2, r1, #0
	blx r3
	ldr r1, [sp]
	str r0, [r1]
_02025B76:
	cmp r6, #0
	beq _02025B8A
	ldr r3, _02025BA8 ; =NNS_GfdDefaultFuncAllocTexVram
	add r0, r6, #0
	ldr r3, [r3]
	mov r1, #1
	mov r2, #0
	blx r3
	ldr r1, [sp, #4]
	str r0, [r1]
_02025B8A:
	cmp r4, #0
	beq _02025BA4
	ldr r3, _02025BAC ; =NNS_GfdDefaultFuncAllocPlttVram
	mov r1, #2
	ldrh r2, [r5, #0x20]
	lsl r1, r1, #0xe
	ldr r3, [r3]
	and r1, r2
	add r0, r4, #0
	mov r2, #0
	blx r3
	ldr r1, [sp, #8]
	str r0, [r1]
_02025BA4:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02025BA8: .word NNS_GfdDefaultFuncAllocTexVram
_02025BAC: .word NNS_GfdDefaultFuncAllocPlttVram
	thumb_func_end sub_02025B40

	thumb_func_start sub_02025BB0
sub_02025BB0: ; 0x02025BB0
	push {r4, lr}
	add r3, r1, #0
	ldr r1, [r3, #4]
	ldr r2, [r3, #8]
	ldr r3, [r3, #0xc]
	add r4, r0, #0
	bl sub_02025BDC
	ldr r1, [r4, #4]
	add r0, r4, #0
	bl DC_FlushRange
	add r0, r4, #0
	mov r1, #1
	bl Call_NNS_G3dTexLoad
	add r0, r4, #0
	mov r1, #1
	bl Call_NNS_G3dPlttLoad
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02025BB0

	thumb_func_start sub_02025BDC
sub_02025BDC: ; 0x02025BDC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r3, #0
	bl NNS_G3dTexSetTexKey
	add r0, r5, #0
	add r1, r4, #0
	bl NNS_G3dPlttSetPlttKey
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02025BDC

	thumb_func_start sub_02025BF0
sub_02025BF0: ; 0x02025BF0
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	add r1, sp, #4
	add r2, sp, #0
	bl NNS_G3dTexReleaseTexKey
	add r0, r4, #0
	bl NNS_G3dPlttReleasePlttKey
	add sp, #8
	pop {r4, pc}
	thumb_func_end sub_02025BF0

	thumb_func_start sub_02025C08
sub_02025C08: ; 0x02025C08
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r4, r1, #0
	bl sub_02025C2C
	add r5, r0, #0
	add r0, r4, #0
	add r1, r5, #0
	bl AllocFromHeap
	add r1, r6, #0
	add r2, r5, #0
	add r4, r0, #0
	bl memcpy
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02025C08

	thumb_func_start sub_02025C2C
sub_02025C2C: ; 0x02025C2C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl NNS_G3dGetTex
	add r4, r0, #0
	bne _02025C3C
	bl GF_AssertFail
_02025C3C:
	ldr r0, [r4, #0x14]
	add r0, r4, r0
	sub r0, r0, r5
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02025C2C
