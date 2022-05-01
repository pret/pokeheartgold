	.include "asm/macros.inc"
	.include "global.inc"

	.bss

_021D41C8:
	.space 0x4

	.text

	thumb_func_start sub_02058034
sub_02058034: ; 0x02058034
	bx lr
	.balign 4, 0
	thumb_func_end sub_02058034

	thumb_func_start sub_02058038
sub_02058038: ; 0x02058038
	push {r4, lr}
	ldr r1, _02058090 ; =_021D41C8
	add r4, r0, #0
	ldr r1, [r1]
	cmp r1, #0
	bne _0205808C
	bl sub_02091574
	mov r0, #0xf
	mov r1, #0x44
	bl AllocFromHeap
	ldr r1, _02058090 ; =_021D41C8
	mov r2, #0x44
	str r0, [r1]
	mov r1, #0
	bl MI_CpuFill8
	ldr r0, _02058090 ; =_021D41C8
	mov r1, #0x32
	ldr r0, [r0]
	mov r2, #0xa
	strh r1, [r0, #0x38]
	ldr r0, _02058094 ; =sub_020582CC
	mov r1, #0
	bl CreateSysTask
	ldr r1, _02058090 ; =_021D41C8
	ldr r2, [r1]
	str r0, [r2, #0x34]
	ldr r0, [r1]
	mov r2, #0
	str r4, [r0, #0x14]
	ldr r0, [r1]
	str r2, [r0, #0x40]
	bl sub_02058034
	ldr r0, _02058090 ; =_021D41C8
	ldr r0, [r0]
	add r0, #0x18
	bl sub_0203778C
_0205808C:
	pop {r4, pc}
	nop
_02058090: .word _021D41C8
_02058094: .word sub_020582CC
	thumb_func_end sub_02058038

	thumb_func_start sub_02058098
sub_02058098: ; 0x02058098
	push {r4, r5, r6, lr}
	ldr r0, _020580E0 ; =_021D41C8
	ldr r0, [r0]
	cmp r0, #0
	beq _020580DE
	ldr r0, [r0, #0x34]
	bl DestroySysTask
	mov r4, #0
	ldr r6, _020580E0 ; =_021D41C8
	add r5, r4, #0
_020580AE:
	ldr r0, [r6]
	ldr r0, [r0, r5]
	cmp r0, #0
	beq _020580BA
	bl FreeToHeap
_020580BA:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _020580AE
	ldr r0, _020580E0 ; =_021D41C8
	ldr r0, [r0]
	ldr r0, [r0, #0x40]
	cmp r0, #0
	beq _020580D0
	bl FreeToHeap
_020580D0:
	ldr r0, _020580E0 ; =_021D41C8
	ldr r0, [r0]
	bl FreeToHeap
	ldr r0, _020580E0 ; =_021D41C8
	mov r1, #0
	str r1, [r0]
_020580DE:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_020580E0: .word _021D41C8
	thumb_func_end sub_02058098

	thumb_func_start sub_020580E4
sub_020580E4: ; 0x020580E4
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	bl sub_02037474
	cmp r0, #0
	bne _0205811C
	add r0, r5, #0
	bl Fsys_GetSaveDataPtr
	mov r1, #0
	add r3, r5, #0
	str r1, [sp]
	add r3, #0xa4
	ldr r3, [r3]
	add r1, r4, #0
	add r2, r6, #0
	bl sub_02037D8C
	add r0, r5, #0
	bl sub_02058038
	ldr r0, _02058120 ; =sub_02058304
	mov r1, #0
	bl sub_020582F4
_0205811C:
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_02058120: .word sub_02058304
	thumb_func_end sub_020580E4

	thumb_func_start sub_02058124
sub_02058124: ; 0x02058124
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	bl sub_02037474
	cmp r0, #0
	bne _0205815C
	add r0, r5, #0
	bl Fsys_GetSaveDataPtr
	mov r1, #0
	add r3, r5, #0
	str r1, [sp]
	add r3, #0xa4
	ldr r3, [r3]
	add r1, r4, #0
	add r2, r6, #0
	bl sub_02037DD4
	add r0, r5, #0
	bl sub_02058038
	ldr r0, _02058160 ; =sub_0205832C
	mov r1, #0
	bl sub_020582F4
_0205815C:
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_02058160: .word sub_0205832C
	thumb_func_end sub_02058124

	thumb_func_start sub_02058164
sub_02058164: ; 0x02058164
	ldr r1, _02058174 ; =_021D41C8
	ldr r3, _02058178 ; =sub_020582F4
	ldr r1, [r1]
	add r1, #0x3a
	strb r0, [r1]
	ldr r0, _0205817C ; =sub_0205834C
	mov r1, #0
	bx r3
	.balign 4, 0
_02058174: .word _021D41C8
_02058178: .word sub_020582F4
_0205817C: .word sub_0205834C
	thumb_func_end sub_02058164

	thumb_func_start sub_02058180
sub_02058180: ; 0x02058180
	ldr r3, _02058188 ; =sub_020582F4
	ldr r0, _0205818C ; =sub_020588A0
	mov r1, #0
	bx r3
	.balign 4, 0
_02058188: .word sub_020582F4
_0205818C: .word sub_020588A0
	thumb_func_end sub_02058180

	thumb_func_start sub_02058190
sub_02058190: ; 0x02058190
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r4, r0, #0
	mov r0, #0
	add r1, r0, #0
	bl sub_0200FC60
	mov r0, #1
	mov r1, #0
	bl sub_0200FC60
	mov r0, #1
	add r1, r0, #0
	bl sub_020398D4
	bl sub_02037D78
	cmp r0, #0
	beq _02058248
	ldr r0, _0205824C ; =_021D41C8
	ldr r1, [r0]
	cmp r1, #0
	bne _020581D0
	add r0, r4, #0
	bl sub_02058038
	ldr r0, _0205824C ; =_021D41C8
	mov r1, #1
	ldr r0, [r0]
	add r0, #0x3e
	strb r1, [r0]
	b _020581D6
_020581D0:
	mov r0, #0
	add r1, #0x3e
	strb r0, [r1]
_020581D6:
	ldr r0, _0205824C ; =_021D41C8
	mov r1, #0
	ldr r0, [r0]
	add r0, #0x3f
	strb r1, [r0]
	bl sub_0203769C
	str r0, [sp, #8]
	bl sub_0203769C
	bl sub_02034818
	mov r4, #0
	bl sub_02037454
	cmp r0, #0
	ble _0205821E
	ldr r6, _0205824C ; =_021D41C8
	add r5, r4, #0
	add r7, r4, #0
_020581FE:
	ldr r0, [r6]
	ldr r0, [r0, r5]
	cmp r0, #0
	bne _02058212
	ldr r1, _02058250 ; =0x0000066C
	add r0, r7, #0
	bl AllocFromHeap
	ldr r1, [r6]
	str r0, [r1, r5]
_02058212:
	add r5, r5, #4
	add r4, r4, #1
	bl sub_02037454
	cmp r4, r0
	blt _020581FE
_0205821E:
	ldr r0, _0205824C ; =_021D41C8
	mov r3, #0xff
	ldr r1, [r0]
	ldr r0, [r1, #0x14]
	str r0, [sp]
	ldr r0, [sp, #8]
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	str r0, [sp, #4]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	bl sub_02068FC8
	mov r0, #0x5f
	bl sub_02037AC0
	ldr r0, _02058254 ; =sub_020588F8
	mov r1, #0
	bl sub_020582F4
_02058248:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0205824C: .word _021D41C8
_02058250: .word 0x0000066C
_02058254: .word sub_020588F8
	thumb_func_end sub_02058190

	thumb_func_start sub_02058258
sub_02058258: ; 0x02058258
	ldr r0, _02058278 ; =_021D41C8
	ldr r0, [r0]
	ldr r1, [r0, #0x30]
	ldr r0, _0205827C ; =sub_020588F8
	cmp r1, r0
	bne _02058268
	mov r0, #0
	bx lr
_02058268:
	ldr r0, _02058280 ; =sub_02058930
	cmp r1, r0
	beq _02058272
	mov r0, #1
	bx lr
_02058272:
	mov r0, #0
	bx lr
	nop
_02058278: .word _021D41C8
_0205827C: .word sub_020588F8
_02058280: .word sub_02058930
	thumb_func_end sub_02058258

	thumb_func_start sub_02058284
sub_02058284: ; 0x02058284
	push {r3, lr}
	ldr r0, _020582A0 ; =_021D41C8
	ldr r0, [r0]
	cmp r0, #0
	beq _0205829E
	mov r0, #0
	add r1, r0, #0
	bl sub_020398D4
	ldr r0, _020582A4 ; =sub_02058A60
	mov r1, #5
	bl sub_020582F4
_0205829E:
	pop {r3, pc}
	.balign 4, 0
_020582A0: .word _021D41C8
_020582A4: .word sub_02058A60
	thumb_func_end sub_02058284

	thumb_func_start sub_020582A8
sub_020582A8: ; 0x020582A8
	push {r3, lr}
	ldr r0, _020582C4 ; =_021D41C8
	ldr r0, [r0]
	cmp r0, #0
	beq _020582C0
	mov r0, #0x5b
	bl sub_02037AC0
	ldr r0, _020582C8 ; =sub_02058A38
	mov r1, #5
	bl sub_020582F4
_020582C0:
	pop {r3, pc}
	nop
_020582C4: .word _021D41C8
_020582C8: .word sub_02058A38
	thumb_func_end sub_020582A8

	thumb_func_start sub_020582CC
sub_020582CC: ; 0x020582CC
	push {r3, lr}
	ldr r1, _020582F0 ; =_021D41C8
	ldr r2, [r1]
	cmp r2, #0
	bne _020582DC
	bl DestroySysTask
	pop {r3, pc}
_020582DC:
	ldr r1, [r2, #0x30]
	cmp r1, #0
	beq _020582EC
	add r2, #0x3c
	ldrb r0, [r2]
	cmp r0, #0
	bne _020582EC
	blx r1
_020582EC:
	pop {r3, pc}
	nop
_020582F0: .word _021D41C8
	thumb_func_end sub_020582CC

	thumb_func_start sub_020582F4
sub_020582F4: ; 0x020582F4
	ldr r2, _02058300 ; =_021D41C8
	ldr r3, [r2]
	str r0, [r3, #0x30]
	ldr r0, [r2]
	strh r1, [r0, #0x38]
	bx lr
	.balign 4, 0
_02058300: .word _021D41C8
	thumb_func_end sub_020582F4

	thumb_func_start sub_02058304
sub_02058304: ; 0x02058304
	push {r3, lr}
	bl sub_0203769C
	bl sub_020373B4
	cmp r0, #0
	beq _02058322
	bl ov03_02255C54
	bl sub_02034434
	ldr r0, _02058324 ; =sub_02058328
	mov r1, #0
	bl sub_020582F4
_02058322:
	pop {r3, pc}
	.balign 4, 0
_02058324: .word sub_02058328
	thumb_func_end sub_02058304

	thumb_func_start sub_02058328
sub_02058328: ; 0x02058328
	bx lr
	.balign 4, 0
	thumb_func_end sub_02058328

	thumb_func_start sub_0205832C
sub_0205832C: ; 0x0205832C
	push {r3, lr}
	bl sub_02034DB8
	cmp r0, #0
	beq _02058342
	bl ov03_02255BEC
	ldr r0, _02058344 ; =sub_02058348
	mov r1, #0
	bl sub_020582F4
_02058342:
	pop {r3, pc}
	.balign 4, 0
_02058344: .word sub_02058348
	thumb_func_end sub_0205832C

	thumb_func_start sub_02058348
sub_02058348: ; 0x02058348
	bx lr
	.balign 4, 0
	thumb_func_end sub_02058348

	thumb_func_start sub_0205834C
sub_0205834C: ; 0x0205834C
	push {r3, lr}
	ldr r0, _02058364 ; =_021D41C8
	ldr r0, [r0]
	add r0, #0x3a
	ldrb r0, [r0]
	bl sub_02037E1C
	ldr r0, _02058368 ; =sub_0205836C
	mov r1, #0
	bl sub_020582F4
	pop {r3, pc}
	.balign 4, 0
_02058364: .word _021D41C8
_02058368: .word sub_0205836C
	thumb_func_end sub_0205834C

	thumb_func_start sub_0205836C
sub_0205836C: ; 0x0205836C
	push {r3, lr}
	bl sub_02037EC8
	cmp r0, #0
	beq _02058382
	bl sub_02034434
	ldr r0, _02058384 ; =sub_02058388
	mov r1, #0
	bl sub_020582F4
_02058382:
	pop {r3, pc}
	.balign 4, 0
_02058384: .word sub_02058388
	thumb_func_end sub_0205836C

	thumb_func_start sub_02058388
sub_02058388: ; 0x02058388
	bx lr
	.balign 4, 0
	thumb_func_end sub_02058388

	thumb_func_start sub_0205838C
sub_0205838C: ; 0x0205838C
	push {r3, lr}
	mov r0, #0x62
	bl sub_02037B38
	cmp r0, #0
	beq _020583C8
	bl sub_02057180
	add r1, r0, #0
	mov r0, #0xf
	bl AllocFromHeap
	ldr r1, _020583E4 ; =_021D41C8
	mov r2, #0
	ldr r1, [r1]
	ldr r1, [r1, #0x14]
	bl sub_02056D7C
	bl sub_02057F80
	bl sub_02037504
	mov r0, #0x5c
	bl sub_02037AC0
	ldr r0, _020583E8 ; =sub_020583EC
	mov r1, #0
	bl sub_020582F4
	pop {r3, pc}
_020583C8:
	ldr r0, _020583E4 ; =_021D41C8
	ldr r1, [r0]
	ldrh r0, [r1, #0x38]
	cmp r0, #0
	beq _020583D8
	sub r0, r0, #1
	strh r0, [r1, #0x38]
	pop {r3, pc}
_020583D8:
	mov r0, #0x1e
	strh r0, [r1, #0x38]
	mov r0, #0x62
	bl sub_02037AC0
	pop {r3, pc}
	.balign 4, 0
_020583E4: .word _021D41C8
_020583E8: .word sub_020583EC
	thumb_func_end sub_0205838C

	thumb_func_start sub_020583EC
sub_020583EC: ; 0x020583EC
	push {lr}
	sub sp, #0xc
	bl sub_0203769C
	cmp r0, #0
	bne _020583FC
	bl sub_02034638
_020583FC:
	mov r0, #0x5c
	bl sub_02037B38
	cmp r0, #0
	beq _0205843A
	mov r0, #6
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r0, #0
	bl sub_0200FBDC
	mov r0, #1
	bl sub_0200FBDC
	bl sub_02056E60
	mov r0, #0
	bl sub_0205701C
	ldr r0, _02058440 ; =sub_02058478
	mov r1, #1
	bl sub_020582F4
_0205843A:
	add sp, #0xc
	pop {pc}
	nop
_02058440: .word sub_02058478
	thumb_func_end sub_020583EC

	thumb_func_start sub_02058444
sub_02058444: ; 0x02058444
	push {r3, lr}
	ldr r0, _02058470 ; =_021D41C8
	ldr r1, [r0]
	ldrh r0, [r1, #0x38]
	cmp r0, #0
	beq _02058456
	sub r0, r0, #1
	strh r0, [r1, #0x38]
	pop {r3, pc}
_02058456:
	mov r0, #0x1e
	bl sub_02037B38
	cmp r0, #0
	beq _0205846C
	bl sub_020374E4
	ldr r0, _02058474 ; =sub_02058608
	mov r1, #0
	bl sub_020582F4
_0205846C:
	pop {r3, pc}
	nop
_02058470: .word _021D41C8
_02058474: .word sub_02058608
	thumb_func_end sub_02058444

	thumb_func_start sub_02058478
sub_02058478: ; 0x02058478
	push {r3, lr}
	ldr r0, _020584B4 ; =_021D41C8
	ldr r1, [r0]
	ldrh r0, [r1, #0x38]
	cmp r0, #0
	beq _0205848A
	sub r0, r0, #1
	strh r0, [r1, #0x38]
	pop {r3, pc}
_0205848A:
	bl sub_0203769C
	cmp r0, #0
	bne _020584A2
	bl sub_02057E50
	cmp r0, #0
	beq _020584B0
	mov r0, #0x1e
	bl sub_02037AC0
	b _020584A8
_020584A2:
	mov r0, #0x1e
	bl sub_02037AC0
_020584A8:
	ldr r0, _020584B8 ; =sub_02058444
	mov r1, #0x14
	bl sub_020582F4
_020584B0:
	pop {r3, pc}
	nop
_020584B4: .word _021D41C8
_020584B8: .word sub_02058444
	thumb_func_end sub_02058478

	thumb_func_start sub_020584BC
sub_020584BC: ; 0x020584BC
	push {r3, lr}
	mov r0, #0x62
	bl sub_02037B38
	cmp r0, #0
	beq _020584F4
	bl sub_02057180
	add r1, r0, #0
	mov r0, #0xf
	bl AllocFromHeap
	ldr r1, _02058510 ; =_021D41C8
	mov r2, #0
	ldr r1, [r1]
	ldr r1, [r1, #0x14]
	bl sub_02056D7C
	bl sub_02057F80
	mov r0, #0x5c
	bl sub_02037AC0
	ldr r0, _02058514 ; =sub_02058518
	mov r1, #0
	bl sub_020582F4
	pop {r3, pc}
_020584F4:
	ldr r0, _02058510 ; =_021D41C8
	ldr r1, [r0]
	ldrh r0, [r1, #0x38]
	cmp r0, #0
	beq _02058504
	sub r0, r0, #1
	strh r0, [r1, #0x38]
	pop {r3, pc}
_02058504:
	mov r0, #0x1e
	strh r0, [r1, #0x38]
	mov r0, #0x62
	bl sub_02037AC0
	pop {r3, pc}
	.balign 4, 0
_02058510: .word _021D41C8
_02058514: .word sub_02058518
	thumb_func_end sub_020584BC

	thumb_func_start sub_02058518
sub_02058518: ; 0x02058518
	push {r3, lr}
	sub sp, #0x10
	bl sub_0203769C
	cmp r0, #0
	bne _02058528
	bl sub_02034638
_02058528:
	mov r0, #0x5c
	bl sub_02037B38
	cmp r0, #0
	beq _02058574
	bl sub_02056E60
	mov r0, #0
	bl sub_0205701C
	mov r1, #1
	add r0, sp, #0xc
	strb r1, [r0]
	mov r0, #0x5e
	add r1, sp, #0xc
	bl sub_020376E0
	mov r0, #6
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r0, #0
	bl sub_0200FBDC
	mov r0, #1
	bl sub_0200FBDC
	ldr r0, _02058578 ; =sub_020586EC
	mov r1, #0
	bl sub_020582F4
_02058574:
	add sp, #0x10
	pop {r3, pc}
	.balign 4, 0
_02058578: .word sub_020586EC
	thumb_func_end sub_02058518

	thumb_func_start sub_0205857C
sub_0205857C: ; 0x0205857C
	push {r3, r4, r5, r6, r7, lr}
	mov r0, #0
	str r0, [sp]
	bl sub_02037454
	cmp r0, #0
	ble _020585F0
	mov r7, #0
_0205858C:
	bl sub_0203769C
	ldr r1, [sp]
	cmp r1, r0
	beq _020585E0
	add r0, r1, #0
	bl sub_02037B5C
	cmp r0, #0x5e
	bne _020585E0
	ldr r6, _02058600 ; =_021D41C8
	ldr r0, [r6]
	ldr r1, [r0, #0x14]
	ldr r0, [r1, #0x10]
	cmp r0, #0
	bne _020585E0
	add r1, #0xd2
	ldrb r0, [r1]
	lsl r0, r0, #0x1a
	lsr r0, r0, #0x1a
	bne _020585E0
	mov r4, #0
	add r5, r4, #0
_020585BA:
	ldr r0, [r6]
	ldr r0, [r0, r5]
	cmp r0, #0
	beq _020585CA
	bl FreeToHeap
	ldr r0, [r6]
	str r7, [r0, r5]
_020585CA:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _020585BA
	ldr r0, _02058600 ; =_021D41C8
	ldr r1, _02058604 ; =0x0000238E
	ldr r0, [r0]
	mov r2, #0
	ldr r0, [r0, #0x14]
	bl StartMapSceneScript
_020585E0:
	ldr r0, [sp]
	add r0, r0, #1
	str r0, [sp]
	bl sub_02037454
	ldr r1, [sp]
	cmp r1, r0
	blt _0205858C
_020585F0:
	ldr r1, _02058600 ; =_021D41C8
	mov r0, #4
	ldr r1, [r1]
	ldr r1, [r1, #0x14]
	ldr r1, [r1, #8]
	bl sub_020399FC
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02058600: .word _021D41C8
_02058604: .word 0x0000238E
	thumb_func_end sub_0205857C

	thumb_func_start sub_02058608
sub_02058608: ; 0x02058608
	push {r3, lr}
	bl sub_02057C94
	cmp r0, #0
	bne _02058632
	ldr r0, _02058638 ; =_021D41C8
	mov r1, #0
	ldr r0, [r0]
	add r0, #0x3f
	strb r1, [r0]
	mov r1, #1
	add r0, sp, #0
	strb r1, [r0]
	mov r0, #0x5e
	add r1, sp, #0
	bl sub_020376E0
	ldr r0, _0205863C ; =sub_020586EC
	mov r1, #0
	bl sub_020582F4
_02058632:
	bl sub_0205857C
	pop {r3, pc}
	.balign 4, 0
_02058638: .word _021D41C8
_0205863C: .word sub_020586EC
	thumb_func_end sub_02058608

	thumb_func_start sub_02058640
sub_02058640: ; 0x02058640
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	beq _0205865E
	mov r0, #0xb
	bl SavArray_Party_alloc
	ldr r1, _02058684 ; =_021D41C8
	ldr r2, [r1]
	str r0, [r2, #0x40]
	ldr r1, [r1]
	add r0, r4, #0
	ldr r1, [r1, #0x40]
	bl Party_copy
_0205865E:
	cmp r5, #0
	beq _0205866C
	ldr r0, _02058688 ; =sub_02058870
	mov r1, #3
	bl sub_020582F4
	pop {r3, r4, r5, pc}
_0205866C:
	mov r1, #3
	add r0, sp, #0
	strb r1, [r0]
	mov r0, #0x5e
	add r1, sp, #0
	bl sub_020376E0
	ldr r0, _0205868C ; =sub_02058608
	mov r1, #0
	bl sub_020582F4
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02058684: .word _021D41C8
_02058688: .word sub_02058870
_0205868C: .word sub_02058608
	thumb_func_end sub_02058640

	thumb_func_start sub_02058690
sub_02058690: ; 0x02058690
	ldr r3, _02058698 ; =sub_020582F4
	ldr r0, _0205869C ; =sub_02058608
	mov r1, #0
	bx r3
	.balign 4, 0
_02058698: .word sub_020582F4
_0205869C: .word sub_02058608
	thumb_func_end sub_02058690

	thumb_func_start sub_020586A0
sub_020586A0: ; 0x020586A0
	push {r3, lr}
	bl sub_02037958
	cmp r0, #0
	bne _020586DE
	bl sub_0203769C
	bl sub_02057F18
	cmp r0, #0
	bne _020586DE
	ldr r0, _020586E0 ; =_021D41C8
	ldr r1, [r0]
	ldrh r0, [r1, #0x38]
	cmp r0, #0
	beq _020586C6
	sub r0, r0, #1
	strh r0, [r1, #0x38]
	pop {r3, pc}
_020586C6:
	bl sub_02057F58
	ldr r0, _020586E0 ; =_021D41C8
	ldr r1, _020586E4 ; =sub_02058640
	ldr r0, [r0]
	ldr r0, [r0, #0x14]
	bl sub_02059538
	ldr r0, _020586E8 ; =sub_02058690
	mov r1, #0
	bl sub_020582F4
_020586DE:
	pop {r3, pc}
	.balign 4, 0
_020586E0: .word _021D41C8
_020586E4: .word sub_02058640
_020586E8: .word sub_02058690
	thumb_func_end sub_020586A0

	thumb_func_start sub_020586EC
sub_020586EC: ; 0x020586EC
	push {r3, lr}
	ldr r0, _02058718 ; =_021D41C8
	ldr r0, [r0]
	add r0, #0x3f
	ldrb r0, [r0]
	cmp r0, #0
	beq _02058710
	ldr r0, _0205871C ; =sub_020586A0
	mov r1, #5
	bl sub_020582F4
	mov r1, #0
	add r0, sp, #0
	strb r1, [r0]
	mov r0, #0x5e
	add r1, sp, #0
	bl sub_020376E0
_02058710:
	bl sub_0205857C
	pop {r3, pc}
	nop
_02058718: .word _021D41C8
_0205871C: .word sub_020586A0
	thumb_func_end sub_020586EC

	thumb_func_start sub_02058720
sub_02058720: ; 0x02058720
	push {r4, lr}
	add r4, r2, #0
	bl sub_0203769C
	ldrb r1, [r4]
	cmp r1, r0
	bne _02058738
	ldr r0, _0205873C ; =_021D41C8
	mov r1, #1
	ldr r0, [r0]
	add r0, #0x3f
	strb r1, [r0]
_02058738:
	pop {r4, pc}
	nop
_0205873C: .word _021D41C8
	thumb_func_end sub_02058720

	thumb_func_start sub_02058740
sub_02058740: ; 0x02058740
	ldr r0, _02058760 ; =_021D41C8
	ldr r0, [r0]
	cmp r0, #0
	beq _0205875A
	ldr r1, [r0, #0x30]
	ldr r0, _02058764 ; =sub_020586EC
	cmp r1, r0
	beq _02058756
	ldr r0, _02058768 ; =sub_02058608
	cmp r1, r0
	bne _0205875A
_02058756:
	mov r0, #1
	bx lr
_0205875A:
	mov r0, #0
	bx lr
	nop
_02058760: .word _021D41C8
_02058764: .word sub_020586EC
_02058768: .word sub_02058608
	thumb_func_end sub_02058740

	thumb_func_start sub_0205876C
sub_0205876C: ; 0x0205876C
	push {r4, lr}
	sub sp, #8
	ldr r0, _020587E4 ; =_021D41C8
	ldr r1, [r0]
	ldrh r0, [r1, #0x38]
	cmp r0, #0
	beq _02058782
	sub r0, r0, #1
	strh r0, [r1, #0x38]
	add sp, #8
	pop {r4, pc}
_02058782:
	mov r4, #5
	bl sub_0203993C
	cmp r0, #5
	bgt _0205879C
	cmp r0, #2
	blt _020587A8
	beq _020587A6
	cmp r0, #4
	beq _020587A2
	cmp r0, #5
	beq _020587A2
	b _020587A8
_0205879C:
	cmp r0, #0x26
	beq _020587A6
	b _020587A8
_020587A2:
	mov r4, #0xf
	b _020587A8
_020587A6:
	mov r4, #7
_020587A8:
	add r0, sp, #0
	bl sub_02039980
	ldr r0, _020587E4 ; =_021D41C8
	ldr r0, [r0]
	ldr r1, [r0, #0x40]
	ldr r0, [r0, #0x14]
	cmp r1, #0
	bne _020587C4
	add r1, sp, #0
	add r2, r4, #0
	bl sub_02051598
	b _020587DC
_020587C4:
	add r2, r4, #0
	bl sub_020515FC
	ldr r0, _020587E4 ; =_021D41C8
	ldr r0, [r0]
	ldr r0, [r0, #0x40]
	bl FreeToHeap
	ldr r0, _020587E4 ; =_021D41C8
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0, #0x40]
_020587DC:
	bl sub_02058098
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
_020587E4: .word _021D41C8
	thumb_func_end sub_0205876C

	thumb_func_start sub_020587E8
sub_020587E8: ; 0x020587E8
	push {r3, lr}
	bl sub_02036010
	cmp r0, #0
	beq _02058822
	ldr r0, _02058824 ; =_021D41C8
	ldr r1, [r0]
	ldrh r0, [r1, #0x38]
	cmp r0, #0
	beq _02058800
	sub r0, r0, #1
	strh r0, [r1, #0x38]
_02058800:
	ldr r0, _02058824 ; =_021D41C8
	ldr r0, [r0]
	ldrh r0, [r0, #0x38]
	cmp r0, #0x5a
	bne _02058810
	mov r0, #4
	bl sub_02037AC0
_02058810:
	mov r0, #4
	bl sub_02037B38
	cmp r0, #0
	beq _02058822
	ldr r0, _02058828 ; =sub_0205876C
	mov r1, #0
	bl sub_020582F4
_02058822:
	pop {r3, pc}
	.balign 4, 0
_02058824: .word _021D41C8
_02058828: .word sub_0205876C
	thumb_func_end sub_020587E8

	thumb_func_start sub_0205882C
sub_0205882C: ; 0x0205882C
	push {r3, lr}
	ldr r0, _0205884C ; =_021D41C8
	ldr r1, [r0]
	ldrh r0, [r1, #0x38]
	cmp r0, #0
	beq _0205883E
	sub r0, r0, #1
	strh r0, [r1, #0x38]
	pop {r3, pc}
_0205883E:
	bl sub_02035FD8
	ldr r0, _02058850 ; =sub_020587E8
	mov r1, #0x78
	bl sub_020582F4
	pop {r3, pc}
	.balign 4, 0
_0205884C: .word _021D41C8
_02058850: .word sub_020587E8
	thumb_func_end sub_0205882C

	thumb_func_start sub_02058854
sub_02058854: ; 0x02058854
	push {r3, lr}
	mov r0, #3
	bl sub_02037B38
	cmp r0, #0
	beq _02058868
	ldr r0, _0205886C ; =sub_0205882C
	mov r1, #2
	bl sub_020582F4
_02058868:
	pop {r3, pc}
	nop
_0205886C: .word sub_0205882C
	thumb_func_end sub_02058854

	thumb_func_start sub_02058870
sub_02058870: ; 0x02058870
	push {r3, lr}
	ldr r0, _02058898 ; =_021D41C8
	ldr r1, [r0]
	ldrh r0, [r1, #0x38]
	cmp r0, #0
	beq _02058882
	sub r0, r0, #1
	strh r0, [r1, #0x38]
	pop {r3, pc}
_02058882:
	mov r0, #0
	bl sub_02056EA0
	mov r0, #3
	bl sub_02037AC0
	ldr r0, _0205889C ; =sub_02058854
	mov r1, #0
	bl sub_020582F4
	pop {r3, pc}
	.balign 4, 0
_02058898: .word _021D41C8
_0205889C: .word sub_02058854
	thumb_func_end sub_02058870

	thumb_func_start sub_020588A0
sub_020588A0: ; 0x020588A0
	push {r3, lr}
	bl sub_02037E38
	ldr r0, _020588B0 ; =sub_020588B4
	mov r1, #2
	bl sub_020582F4
	pop {r3, pc}
	.balign 4, 0
_020588B0: .word sub_020588B4
	thumb_func_end sub_020588A0

	thumb_func_start sub_020588B4
sub_020588B4: ; 0x020588B4
	push {r3, lr}
	bl sub_02035664
	cmp r0, #0
	beq _020588C6
	ldr r0, _020588C8 ; =sub_0205836C
	mov r1, #0xa
	bl sub_020582F4
_020588C6:
	pop {r3, pc}
	.balign 4, 0
_020588C8: .word sub_0205836C
	thumb_func_end sub_020588B4

	thumb_func_start sub_020588CC
sub_020588CC: ; 0x020588CC
	ldr r1, _020588D8 ; =_021D41C8
	mov r2, #1
	ldr r1, [r1]
	add r0, r1, r0
	strb r2, [r0, #0x10]
	bx lr
	.balign 4, 0
_020588D8: .word _021D41C8
	thumb_func_end sub_020588CC

	thumb_func_start sub_020588DC
sub_020588DC: ; 0x020588DC
	push {r4, lr}
	add r4, r0, #0
	cmp r4, #4
	blt _020588E8
	bl GF_AssertFail
_020588E8:
	ldr r0, _020588F4 ; =_021D41C8
	ldr r1, [r0]
	lsl r0, r4, #2
	ldr r0, [r1, r0]
	pop {r4, pc}
	nop
_020588F4: .word _021D41C8
	thumb_func_end sub_020588DC

	thumb_func_start sub_020588F8
sub_020588F8: ; 0x020588F8
	push {r4, lr}
	bl sub_0203769C
	add r4, r0, #0
	mov r0, #0x5f
	bl sub_02037B38
	cmp r0, #0
	beq _02058922
	ldr r1, _02058924 ; =_021D41C8
	mov r0, #0x58
	ldr r2, [r1]
	lsl r1, r4, #2
	ldr r1, [r2, r1]
	ldr r2, _02058928 ; =0x0000066C
	bl sub_02036FD8
	ldr r0, _0205892C ; =sub_02058930
	mov r1, #0
	bl sub_020582F4
_02058922:
	pop {r4, pc}
	.balign 4, 0
_02058924: .word _021D41C8
_02058928: .word 0x0000066C
_0205892C: .word sub_02058930
	thumb_func_end sub_020588F8

	thumb_func_start sub_02058930
sub_02058930: ; 0x02058930
	push {r3, r4, r5, lr}
	mov r4, #0
	bl sub_02037454
	cmp r0, #0
	ble _02058952
	ldr r5, _02058964 ; =_021D41C8
_0205893E:
	ldr r0, [r5]
	add r0, r0, r4
	ldrb r0, [r0, #0x10]
	cmp r0, #0
	beq _02058960
	add r4, r4, #1
	bl sub_02037454
	cmp r4, r0
	blt _0205893E
_02058952:
	mov r0, #0x61
	bl sub_02037AC0
	ldr r0, _02058968 ; =sub_020589D8
	mov r1, #0
	bl sub_020582F4
_02058960:
	pop {r3, r4, r5, pc}
	nop
_02058964: .word _021D41C8
_02058968: .word sub_020589D8
	thumb_func_end sub_02058930

	thumb_func_start sub_0205896C
sub_0205896C: ; 0x0205896C
	push {r3, lr}
	bl sub_02036010
	cmp r0, #0
	bne _020589A6
	ldr r0, _020589A8 ; =_021D41C8
	ldr r1, [r0]
	ldrh r0, [r1, #0x38]
	cmp r0, #0
	beq _02058984
	sub r0, r0, #1
	strh r0, [r1, #0x38]
_02058984:
	ldr r0, _020589A8 ; =_021D41C8
	ldr r0, [r0]
	ldrh r0, [r0, #0x38]
	cmp r0, #0x5a
	bne _02058994
	mov r0, #5
	bl sub_02037AC0
_02058994:
	mov r0, #5
	bl sub_02037B38
	cmp r0, #0
	beq _020589A6
	ldr r0, _020589AC ; =sub_020589F4
	mov r1, #0
	bl sub_020582F4
_020589A6:
	pop {r3, pc}
	.balign 4, 0
_020589A8: .word _021D41C8
_020589AC: .word sub_020589F4
	thumb_func_end sub_0205896C

	thumb_func_start sub_020589B0
sub_020589B0: ; 0x020589B0
	push {r3, lr}
	ldr r0, _020589D0 ; =_021D41C8
	ldr r1, [r0]
	ldrh r0, [r1, #0x38]
	cmp r0, #0
	beq _020589C2
	sub r0, r0, #1
	strh r0, [r1, #0x38]
	pop {r3, pc}
_020589C2:
	bl sub_02035FE4
	ldr r0, _020589D4 ; =sub_0205896C
	mov r1, #0x78
	bl sub_020582F4
	pop {r3, pc}
	.balign 4, 0
_020589D0: .word _021D41C8
_020589D4: .word sub_0205896C
	thumb_func_end sub_020589B0

	thumb_func_start sub_020589D8
sub_020589D8: ; 0x020589D8
	push {r3, lr}
	mov r0, #0x61
	bl sub_02037B38
	cmp r0, #0
	beq _020589EC
	ldr r0, _020589F0 ; =sub_020589B0
	mov r1, #2
	bl sub_020582F4
_020589EC:
	pop {r3, pc}
	nop
_020589F0: .word sub_020589B0
	thumb_func_end sub_020589D8

	thumb_func_start sub_020589F4
sub_020589F4: ; 0x020589F4
	push {r3, lr}
	ldr r0, _02058A2C ; =_021D41C8
	ldr r1, [r0]
	ldrh r0, [r1, #0x38]
	cmp r0, #0
	beq _02058A06
	sub r0, r0, #1
	strh r0, [r1, #0x38]
	pop {r3, pc}
_02058A06:
	mov r0, #0x62
	bl sub_02037AC0
	ldr r0, _02058A2C ; =_021D41C8
	ldr r0, [r0]
	add r0, #0x3e
	ldrb r0, [r0]
	cmp r0, #0
	beq _02058A22
	ldr r0, _02058A30 ; =sub_0205838C
	mov r1, #0x1e
	bl sub_020582F4
	pop {r3, pc}
_02058A22:
	ldr r0, _02058A34 ; =sub_020584BC
	mov r1, #0x1e
	bl sub_020582F4
	pop {r3, pc}
	.balign 4, 0
_02058A2C: .word _021D41C8
_02058A30: .word sub_0205838C
_02058A34: .word sub_020584BC
	thumb_func_end sub_020589F4

	thumb_func_start sub_02058A38
sub_02058A38: ; 0x02058A38
	push {r3, lr}
	mov r0, #0x5b
	bl sub_02037B38
	cmp r0, #0
	beq _02058A5A
	mov r0, #0
	add r1, r0, #0
	bl sub_020398D4
	mov r0, #1
	bl sub_02056EA0
	ldr r0, _02058A5C ; =sub_02058A78
	mov r1, #5
	bl sub_020582F4
_02058A5A:
	pop {r3, pc}
	.balign 4, 0
_02058A5C: .word sub_02058A78
	thumb_func_end sub_02058A38

	thumb_func_start sub_02058A60
sub_02058A60: ; 0x02058A60
	push {r3, lr}
	mov r0, #1
	bl sub_02056EA0
	ldr r0, _02058A74 ; =sub_02058A78
	mov r1, #5
	bl sub_020582F4
	pop {r3, pc}
	nop
_02058A74: .word sub_02058A78
	thumb_func_end sub_02058A60

	thumb_func_start sub_02058A78
sub_02058A78: ; 0x02058A78
	push {r3, lr}
	ldr r0, _02058A98 ; =_021D41C8
	ldr r1, [r0]
	ldrh r0, [r1, #0x38]
	cmp r0, #0
	beq _02058A8A
	sub r0, r0, #1
	strh r0, [r1, #0x38]
	pop {r3, pc}
_02058A8A:
	bl sub_02037E9C
	ldr r0, _02058A9C ; =sub_02058098
	mov r1, #0
	bl sub_020582F4
	pop {r3, pc}
	.balign 4, 0
_02058A98: .word _021D41C8
_02058A9C: .word sub_02058098
	thumb_func_end sub_02058A78

	thumb_func_start sub_02058AA0
sub_02058AA0: ; 0x02058AA0
	ldr r0, _02058AD4 ; =_021D41C8
	ldr r0, [r0]
	cmp r0, #0
	bne _02058AAC
	mov r0, #0
	bx lr
_02058AAC:
	ldr r1, [r0, #0x30]
	ldr r0, _02058AD8 ; =sub_02058870
	cmp r1, r0
	beq _02058ACC
	ldr r0, _02058ADC ; =sub_02058854
	cmp r1, r0
	beq _02058ACC
	ldr r0, _02058AE0 ; =sub_0205882C
	cmp r1, r0
	beq _02058ACC
	ldr r0, _02058AE4 ; =sub_020587E8
	cmp r1, r0
	beq _02058ACC
	ldr r0, _02058AE8 ; =sub_0205876C
	cmp r1, r0
	bne _02058AD0
_02058ACC:
	mov r0, #1
	bx lr
_02058AD0:
	mov r0, #0
	bx lr
	.balign 4, 0
_02058AD4: .word _021D41C8
_02058AD8: .word sub_02058870
_02058ADC: .word sub_02058854
_02058AE0: .word sub_0205882C
_02058AE4: .word sub_020587E8
_02058AE8: .word sub_0205876C
	thumb_func_end sub_02058AA0
