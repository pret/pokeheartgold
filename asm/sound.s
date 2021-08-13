	.include "asm/macros.inc"
	.include "global.inc"

	.bss

_0211194C:
	.space 4

_02111950:
	.space 4

_02111954:
	.space 4

_02111958:
	.space 0xBEC88

	.text

	thumb_func_start InitSoundData
InitSoundData: ; 0x02004174
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r1, #0
	bl GetSoundDataPointer
	add r4, r0, #0
	bl NNS_SndInit
	add r0, r4, #0
	bl GF_SoundDataInit
	add r0, r4, #0
	bl GF_InitMic
	add r0, r4, #0
	ldr r1, _020041F8 ; =0x000BEAE0
	add r0, #0x98
	bl NNS_SndHeapCreate
	add r1, r4, #0
	add r1, #0x94
	str r0, [r1]
	add r2, r4, #0
	add r2, #0x94
	ldr r1, _020041FC ; =0x0210E980
	ldr r2, [r2]
	add r0, r4, #0
	mov r3, #0
	bl NNS_SndArcInit
	add r0, r4, #0
	add r0, #0x94
	ldr r0, [r0]
	bl NNS_SndArcPlayerSetup
	add r0, r4, #0
	add r0, #0x94
	bl sub_0200498C
	add r0, r4, #0
	bl sub_0200487C
	add r0, r4, #0
	add r0, #0x94
	ldr r0, [r0]
	bl sub_020C9CD8
	ldr r1, _02004200 ; =0x0211194C
	str r0, [r1, #8]
	bl sub_0200472C
	add r0, r4, #0
	bl sub_02004898
	ldr r0, _02004200 ; =0x0211194C
	mov r1, #0
	str r1, [r0, #4]
	ldr r0, _02004204 ; =0x000BEC3C
	str r5, [r4, r0]
	ldrh r0, [r6]
	lsl r0, r0, #0x1a
	lsr r0, r0, #0x1e
	bl GF_SndSetMonoFlag
	pop {r4, r5, r6, pc}
	nop
_020041F8: .word 0x000BEAE0
_020041FC: .word 0x0210E980
_02004200: .word 0x0211194C
_02004204: .word 0x000BEC3C
	thumb_func_end InitSoundData

	thumb_func_start DoSoundUpdateFrame
DoSoundUpdateFrame: ; 0x02004208
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	bl GetSoundDataPointer
	add r4, r0, #0
	mov r0, #0x12
	bl sub_02004400
	mov r0, #0x20
	bl sub_02004400
	bl sub_020043CC
	cmp r0, #0
	bne _02004236
	ldr r0, _020042E4 ; =0x000BEBF0
	ldr r1, [r4, r0]
	cmp r1, #0
	ble _02004232
	sub r1, r1, #1
	str r1, [r4, r0]
_02004232:
	bl sub_02004300
_02004236:
	bl sub_020C79B4
	ldr r0, _020042E8 ; =0x021D110C
	ldr r1, [r0, #0x48]
	mov r0, #2
	lsl r0, r0, #0xc
	tst r0, r1
	beq _02004264
	ldr r6, _020042EC ; =0x000BEB94
	mov r5, #0
	add r7, sp, #8
_0200424C:
	add r0, r4, r6
	add r1, r5, #0
	add r2, r7, #0
	bl sub_020C83C0
	add r0, r5, #0
	add r1, sp, #0x24
	bl sub_020C7A94
	add r5, r5, #1
	cmp r5, #0x10
	blt _0200424C
_02004264:
	bl sub_02006C8C
	mov r6, #0
	add r5, r4, #0
	add r7, r4, #0
_0200426E:
	ldr r1, _020042F0 ; =0x000BEC74
	add r0, r4, r6
	ldrb r1, [r0, r1]
	cmp r1, #0
	beq _020042AA
	ldr r1, _020042F0 ; =0x000BEC74
	ldrb r1, [r0, r1]
	sub r2, r1, #1
	ldr r1, _020042F0 ; =0x000BEC74
	strb r2, [r0, r1]
	ldrb r0, [r0, r1]
	cmp r0, #0
	bne _020042AA
	add r0, r1, #0
	sub r0, #0xc
	ldr r0, [r5, r0]
	ldr r2, _020042F4 ; =0x000BEC58
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	add r0, r1, #0
	sub r1, r1, #4
	ldr r3, _020042F8 ; =0x000BEC60
	sub r0, #0x24
	ldrh r1, [r7, r1]
	ldr r0, [r5, r0]
	ldr r2, [r5, r2]
	ldr r3, [r5, r3]
	bl sub_020063A4
_020042AA:
	add r6, r6, #1
	add r5, r5, #4
	add r7, r7, #2
	cmp r6, #2
	blt _0200426E
	ldr r0, _020042FC ; =0x000BEC80
	ldr r0, [r4, r0]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	beq _020042DA
	bl sub_02004924
	cmp r0, #0
	bne _020042DA
	ldr r1, _020042FC ; =0x000BEC80
	mov r0, #1
	ldr r2, [r4, r1]
	add r3, r2, #0
	and r3, r0
	lsr r0, r2, #1
	add r0, r0, #1
	lsl r0, r0, #1
	orr r0, r3
	str r0, [r4, r1]
_020042DA:
	bl NNS_SndMain
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	nop
_020042E4: .word 0x000BEBF0
_020042E8: .word 0x021D110C
_020042EC: .word 0x000BEB94
_020042F0: .word 0x000BEC74
_020042F4: .word 0x000BEC58
_020042F8: .word 0x000BEC60
_020042FC: .word 0x000BEC80
	thumb_func_end DoSoundUpdateFrame

	thumb_func_start sub_02004300
sub_02004300: ; 0x02004300
	push {r4, lr}
	bl GetSoundDataPointer
	add r4, r0, #0
	ldr r0, _020043A4 ; =0x0211194C
	ldr r0, [r0]
	cmp r0, #6
	bhi _020043A0
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0200431C: ; jump table
	.short _020043A0 - _0200431C - 2 ; case 0
	.short _0200432A - _0200431C - 2 ; case 1
	.short _020043A0 - _0200431C - 2 ; case 2
	.short _02004332 - _0200431C - 2 ; case 3
	.short _02004342 - _0200431C - 2 ; case 4
	.short _02004352 - _0200431C - 2 ; case 5
	.short _02004374 - _0200431C - 2 ; case 6
_0200432A:
	mov r0, #2
	bl sub_020043B0
	pop {r4, pc}
_02004332:
	bl sub_02005F88
	cmp r0, #0
	bne _020043A0
	mov r0, #2
	bl sub_020043B0
	pop {r4, pc}
_02004342:
	bl sub_02005F88
	cmp r0, #0
	bne _020043A0
	mov r0, #2
	bl sub_020043B0
	pop {r4, pc}
_02004352:
	bl sub_02005F88
	cmp r0, #0
	bne _020043A0
	bl sub_020059B0
	cmp r0, #0
	bne _020043A0
	bl sub_020048F0
	ldr r0, _020043A8 ; =0x000BEBFE
	ldrh r0, [r4, r0]
	cmp r0, #0
	beq _020043A0
	bl sub_02005D48
	pop {r4, pc}
_02004374:
	bl sub_02005F88
	cmp r0, #0
	bne _020043A0
	bl sub_020059B0
	cmp r0, #0
	bne _020043A0
	bl sub_020048F0
	ldr r0, _020043A8 ; =0x000BEBFE
	ldrh r0, [r4, r0]
	cmp r0, #0
	beq _02004394
	bl sub_02005D48
_02004394:
	ldr r1, _020043AC ; =0x000BEBF8
	mov r0, #0x7f
	ldr r1, [r4, r1]
	mov r2, #0
	bl sub_02005F10
_020043A0:
	pop {r4, pc}
	nop
_020043A4: .word 0x0211194C
_020043A8: .word 0x000BEBFE
_020043AC: .word 0x000BEBF8
	thumb_func_end sub_02004300

	thumb_func_start sub_020043B0
sub_020043B0: ; 0x020043B0
	push {r4, lr}
	add r4, r0, #0
	bl GetSoundDataPointer
	ldr r1, _020043C4 ; =0x000BEBEC
	mov r2, #0
	strh r2, [r0, r1]
	ldr r0, _020043C8 ; =0x0211194C
	str r4, [r0]
	pop {r4, pc}
	.balign 4, 0
_020043C4: .word 0x000BEBEC
_020043C8: .word 0x0211194C
	thumb_func_end sub_020043B0

	thumb_func_start sub_020043CC
sub_020043CC: ; 0x020043CC
	push {r4, lr}
	bl GetSoundDataPointer
	add r4, r0, #0
	mov r0, #2
	bl GF_SndPlayerCountPlayingSeqByPlayerNo
	cmp r0, #0
	beq _020043E2
	mov r0, #1
	pop {r4, pc}
_020043E2:
	ldr r0, _020043F4 ; =0x000BEC02
	ldrh r0, [r4, r0]
	cmp r0, #0
	beq _020043EE
	mov r0, #1
	pop {r4, pc}
_020043EE:
	mov r0, #0
	pop {r4, pc}
	nop
_020043F4: .word 0x000BEC02
	thumb_func_end sub_020043CC

	thumb_func_start GetSoundDataPointer
GetSoundDataPointer: ; 0x020043F8
	ldr r0, _020043FC ; =0x02111958
	bx lr
	.balign 4, 0
_020043FC: .word 0x02111958
	thumb_func_end GetSoundDataPointer

	thumb_func_start sub_02004400
sub_02004400: ; 0x02004400
	push {r4, lr}
	add r4, r0, #0
	bl GetSoundDataPointer
	cmp r4, #0x3a
	bls _0200440E
	b _020045F2
_0200440E:
	add r1, r4, r4
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0200441A: ; jump table
	.short _0200449C - _0200441A - 2 ; case 0
	.short _020044A2 - _0200441A - 2 ; case 1
	.short _020044A8 - _0200441A - 2 ; case 2
	.short _020044AE - _0200441A - 2 ; case 3
	.short _020044B4 - _0200441A - 2 ; case 4
	.short _02004490 - _0200441A - 2 ; case 5
	.short _02004496 - _0200441A - 2 ; case 6
	.short _020044BA - _0200441A - 2 ; case 7
	.short _020044C0 - _0200441A - 2 ; case 8
	.short _020044C6 - _0200441A - 2 ; case 9
	.short _020044CC - _0200441A - 2 ; case 10
	.short _020044D2 - _0200441A - 2 ; case 11
	.short _020044D8 - _0200441A - 2 ; case 12
	.short _020044DE - _0200441A - 2 ; case 13
	.short _020044E4 - _0200441A - 2 ; case 14
	.short _020044EA - _0200441A - 2 ; case 15
	.short _020044F0 - _0200441A - 2 ; case 16
	.short _020044F6 - _0200441A - 2 ; case 17
	.short _020044FC - _0200441A - 2 ; case 18
	.short _02004502 - _0200441A - 2 ; case 19
	.short _02004508 - _0200441A - 2 ; case 20
	.short _0200450E - _0200441A - 2 ; case 21
	.short _02004514 - _0200441A - 2 ; case 22
	.short _0200451A - _0200441A - 2 ; case 23
	.short _02004520 - _0200441A - 2 ; case 24
	.short _02004526 - _0200441A - 2 ; case 25
	.short _0200452C - _0200441A - 2 ; case 26
	.short _02004532 - _0200441A - 2 ; case 27
	.short _02004538 - _0200441A - 2 ; case 28
	.short _0200453E - _0200441A - 2 ; case 29
	.short _02004544 - _0200441A - 2 ; case 30
	.short _0200454A - _0200441A - 2 ; case 31
	.short _02004550 - _0200441A - 2 ; case 32
	.short _02004556 - _0200441A - 2 ; case 33
	.short _0200455C - _0200441A - 2 ; case 34
	.short _02004562 - _0200441A - 2 ; case 35
	.short _02004568 - _0200441A - 2 ; case 36
	.short _0200456E - _0200441A - 2 ; case 37
	.short _02004574 - _0200441A - 2 ; case 38
	.short _0200457A - _0200441A - 2 ; case 39
	.short _02004580 - _0200441A - 2 ; case 40
	.short _02004586 - _0200441A - 2 ; case 41
	.short _0200458C - _0200441A - 2 ; case 42
	.short _02004592 - _0200441A - 2 ; case 43
	.short _02004598 - _0200441A - 2 ; case 44
	.short _0200459E - _0200441A - 2 ; case 45
	.short _020045A4 - _0200441A - 2 ; case 46
	.short _020045AA - _0200441A - 2 ; case 47
	.short _020045B0 - _0200441A - 2 ; case 48
	.short _020045B6 - _0200441A - 2 ; case 49
	.short _020045BC - _0200441A - 2 ; case 50
	.short _020045C2 - _0200441A - 2 ; case 51
	.short _020045C8 - _0200441A - 2 ; case 52
	.short _020045CE - _0200441A - 2 ; case 53
	.short _020045D4 - _0200441A - 2 ; case 54
	.short _020045DA - _0200441A - 2 ; case 55
	.short _020045E0 - _0200441A - 2 ; case 56
	.short _020045E6 - _0200441A - 2 ; case 57
	.short _020045EC - _0200441A - 2 ; case 58
_02004490:
	ldr r1, _020045FC ; =0x000BEBEE
	add r0, r0, r1
	pop {r4, pc}
_02004496:
	ldr r1, _02004600 ; =0x000BEBEF
	add r0, r0, r1
	pop {r4, pc}
_0200449C:
	ldr r1, _02004604 ; =0x000BEB9C
	add r0, r0, r1
	pop {r4, pc}
_020044A2:
	ldr r1, _02004608 ; =0x000BEBA0
	add r0, r0, r1
	pop {r4, pc}
_020044A8:
	ldr r1, _0200460C ; =0x000BEBA4
	add r0, r0, r1
	pop {r4, pc}
_020044AE:
	ldr r1, _02004610 ; =0x000BEBC0
	add r0, r0, r1
	pop {r4, pc}
_020044B4:
	ldr r1, _02004614 ; =0x000BEBD0
	add r0, r0, r1
	pop {r4, pc}
_020044BA:
	ldr r1, _02004618 ; =0x000BEBF0
	add r0, r0, r1
	pop {r4, pc}
_020044C0:
	ldr r1, _0200461C ; =0x000BEBF4
	add r0, r0, r1
	pop {r4, pc}
_020044C6:
	ldr r1, _02004620 ; =0x000BEBF8
	add r0, r0, r1
	pop {r4, pc}
_020044CC:
	ldr r1, _02004624 ; =0x000BEBFC
	add r0, r0, r1
	pop {r4, pc}
_020044D2:
	ldr r1, _02004628 ; =0x000BEBFE
	add r0, r0, r1
	pop {r4, pc}
_020044D8:
	ldr r1, _0200462C ; =0x000BEC00
	add r0, r0, r1
	pop {r4, pc}
_020044DE:
	ldr r1, _02004630 ; =0x000BEC01
	add r0, r0, r1
	pop {r4, pc}
_020044E4:
	ldr r1, _02004634 ; =0x000BEC02
	add r0, r0, r1
	pop {r4, pc}
_020044EA:
	ldr r1, _02004638 ; =0x000BEC04
	add r0, r0, r1
	pop {r4, pc}
_020044F0:
	ldr r1, _0200463C ; =0x000BEC05
	add r0, r0, r1
	pop {r4, pc}
_020044F6:
	ldr r1, _02004640 ; =0x000BEC06
	add r0, r0, r1
	pop {r4, pc}
_020044FC:
	ldr r1, _02004644 ; =0x000BEC07
	add r0, r0, r1
	pop {r4, pc}
_02004502:
	ldr r1, _02004648 ; =0x000BEC08
	add r0, r0, r1
	pop {r4, pc}
_02004508:
	ldr r1, _0200464C ; =0x000BEC09
	add r0, r0, r1
	pop {r4, pc}
_0200450E:
	ldr r1, _02004650 ; =0x000BEC0A
	add r0, r0, r1
	pop {r4, pc}
_02004514:
	ldr r1, _02004654 ; =0x000BEC0B
	add r0, r0, r1
	pop {r4, pc}
_0200451A:
	ldr r1, _02004658 ; =0x000BEC0C
	add r0, r0, r1
	pop {r4, pc}
_02004520:
	ldr r1, _0200465C ; =0x000BEC10
	add r0, r0, r1
	pop {r4, pc}
_02004526:
	ldr r1, _02004660 ; =0x000BEC14
	add r0, r0, r1
	pop {r4, pc}
_0200452C:
	ldr r1, _02004664 ; =0x000BEC18
	add r0, r0, r1
	pop {r4, pc}
_02004532:
	ldr r1, _02004668 ; =0x000BEC1C
	add r0, r0, r1
	pop {r4, pc}
_02004538:
	ldr r1, _0200466C ; =0x000BEC20
	add r0, r0, r1
	pop {r4, pc}
_0200453E:
	ldr r1, _02004670 ; =0x000BEC24
	add r0, r0, r1
	pop {r4, pc}
_02004544:
	ldr r1, _02004674 ; =0x000BEC28
	add r0, r0, r1
	pop {r4, pc}
_0200454A:
	ldr r1, _02004678 ; =0x000BEC29
	add r0, r0, r1
	pop {r4, pc}
_02004550:
	ldr r1, _0200467C ; =0x000BEC2A
	add r0, r0, r1
	pop {r4, pc}
_02004556:
	ldr r1, _02004680 ; =0x000BEC2C
	add r0, r0, r1
	pop {r4, pc}
_0200455C:
	ldr r1, _02004684 ; =0x000BEC30
	add r0, r0, r1
	pop {r4, pc}
_02004562:
	ldr r1, _02004688 ; =0x000BEC38
	add r0, r0, r1
	pop {r4, pc}
_02004568:
	ldr r1, _0200468C ; =0x000BEC3C
	add r0, r0, r1
	pop {r4, pc}
_0200456E:
	ldr r1, _02004690 ; =0x000BEC40
	add r0, r0, r1
	pop {r4, pc}
_02004574:
	ldr r1, _02004694 ; =0x000BEC44
	add r0, r0, r1
	pop {r4, pc}
_0200457A:
	ldr r1, _02004698 ; =0x000BEC48
	add r0, r0, r1
	pop {r4, pc}
_02004580:
	ldr r1, _0200469C ; =0x000BEC4C
	add r0, r0, r1
	pop {r4, pc}
_02004586:
	ldr r1, _020046A0 ; =0x000BEC50
	add r0, r0, r1
	pop {r4, pc}
_0200458C:
	ldr r1, _020046A4 ; =0x000BEC58
	add r0, r0, r1
	pop {r4, pc}
_02004592:
	ldr r1, _020046A8 ; =0x000BEC60
	add r0, r0, r1
	pop {r4, pc}
_02004598:
	ldr r1, _020046AC ; =0x000BEC68
	add r0, r0, r1
	pop {r4, pc}
_0200459E:
	ldr r1, _020046B0 ; =0x000BEC70
	add r0, r0, r1
	pop {r4, pc}
_020045A4:
	ldr r1, _020046B4 ; =0x000BEC74
	add r0, r0, r1
	pop {r4, pc}
_020045AA:
	ldr r1, _020046B8 ; =0x000BEC54
	add r0, r0, r1
	pop {r4, pc}
_020045B0:
	ldr r1, _020046BC ; =0x000BEC5C
	add r0, r0, r1
	pop {r4, pc}
_020045B6:
	ldr r1, _020046C0 ; =0x000BEC64
	add r0, r0, r1
	pop {r4, pc}
_020045BC:
	ldr r1, _020046C4 ; =0x000BEC6C
	add r0, r0, r1
	pop {r4, pc}
_020045C2:
	ldr r1, _020046C8 ; =0x000BEC72
	add r0, r0, r1
	pop {r4, pc}
_020045C8:
	ldr r1, _020046CC ; =0x000BEC75
	add r0, r0, r1
	pop {r4, pc}
_020045CE:
	ldr r1, _020046D0 ; =0x000BEC76
	add r0, r0, r1
	pop {r4, pc}
_020045D4:
	ldr r1, _020046D4 ; =0x000BEC77
	add r0, r0, r1
	pop {r4, pc}
_020045DA:
	ldr r1, _020046D8 ; =0x000BEC78
	add r0, r0, r1
	pop {r4, pc}
_020045E0:
	ldr r1, _020046DC ; =0x000BEC79
	add r0, r0, r1
	pop {r4, pc}
_020045E6:
	ldr r1, _020046E0 ; =0x000BEC7A
	add r0, r0, r1
	pop {r4, pc}
_020045EC:
	ldr r1, _020046E4 ; =0x000BEC7C
	add r0, r0, r1
	pop {r4, pc}
_020045F2:
	bl GF_AssertFail
	mov r0, #0
	pop {r4, pc}
	nop
_020045FC: .word 0x000BEBEE
_02004600: .word 0x000BEBEF
_02004604: .word 0x000BEB9C
_02004608: .word 0x000BEBA0
_0200460C: .word 0x000BEBA4
_02004610: .word 0x000BEBC0
_02004614: .word 0x000BEBD0
_02004618: .word 0x000BEBF0
_0200461C: .word 0x000BEBF4
_02004620: .word 0x000BEBF8
_02004624: .word 0x000BEBFC
_02004628: .word 0x000BEBFE
_0200462C: .word 0x000BEC00
_02004630: .word 0x000BEC01
_02004634: .word 0x000BEC02
_02004638: .word 0x000BEC04
_0200463C: .word 0x000BEC05
_02004640: .word 0x000BEC06
_02004644: .word 0x000BEC07
_02004648: .word 0x000BEC08
_0200464C: .word 0x000BEC09
_02004650: .word 0x000BEC0A
_02004654: .word 0x000BEC0B
_02004658: .word 0x000BEC0C
_0200465C: .word 0x000BEC10
_02004660: .word 0x000BEC14
_02004664: .word 0x000BEC18
_02004668: .word 0x000BEC1C
_0200466C: .word 0x000BEC20
_02004670: .word 0x000BEC24
_02004674: .word 0x000BEC28
_02004678: .word 0x000BEC29
_0200467C: .word 0x000BEC2A
_02004680: .word 0x000BEC2C
_02004684: .word 0x000BEC30
_02004688: .word 0x000BEC38
_0200468C: .word 0x000BEC3C
_02004690: .word 0x000BEC40
_02004694: .word 0x000BEC44
_02004698: .word 0x000BEC48
_0200469C: .word 0x000BEC4C
_020046A0: .word 0x000BEC50
_020046A4: .word 0x000BEC58
_020046A8: .word 0x000BEC60
_020046AC: .word 0x000BEC68
_020046B0: .word 0x000BEC70
_020046B4: .word 0x000BEC74
_020046B8: .word 0x000BEC54
_020046BC: .word 0x000BEC5C
_020046C0: .word 0x000BEC64
_020046C4: .word 0x000BEC6C
_020046C8: .word 0x000BEC72
_020046CC: .word 0x000BEC75
_020046D0: .word 0x000BEC76
_020046D4: .word 0x000BEC77
_020046D8: .word 0x000BEC78
_020046DC: .word 0x000BEC79
_020046E0: .word 0x000BEC7A
_020046E4: .word 0x000BEC7C
	thumb_func_end sub_02004400

	thumb_func_start GF_Snd_SaveState
GF_Snd_SaveState: ; 0x020046E8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl GetSoundDataPointer
	add r0, #0x94
	ldr r0, [r0]
	bl sub_020C9BB8
	add r4, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	bne _02004706
	bl GF_AssertFail
_02004706:
	cmp r5, #0
	beq _0200470C
	str r4, [r5]
_0200470C:
	bl sub_0200472C
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end GF_Snd_SaveState

	thumb_func_start sub_02004714
sub_02004714: ; 0x02004714
	push {r4, lr}
	add r4, r0, #0
	bl GetSoundDataPointer
	add r0, #0x94
	ldr r0, [r0]
	add r1, r4, #0
	bl sub_020C9C04
	bl sub_0200472C
	pop {r4, pc}
	thumb_func_end sub_02004714

	thumb_func_start sub_0200472C
sub_0200472C: ; 0x0200472C
	push {r3, lr}
	bl GetSoundDataPointer
	add r0, #0x94
	ldr r0, [r0]
	bl sub_020C9CE8
	ldr r1, _02004740 ; =0x0211194C
	str r0, [r1, #8]
	pop {r3, pc}
	.balign 4, 0
_02004740: .word 0x0211194C
	thumb_func_end sub_0200472C

	thumb_func_start GF_Snd_LoadGroup
GF_Snd_LoadGroup: ; 0x02004744
	push {r4, lr}
	add r4, r0, #0
	bl GetSoundDataPointer
	add r1, r0, #0
	add r1, #0x94
	ldr r1, [r1]
	add r0, r4, #0
	bl sub_020C9DAC
	add r4, r0, #0
	bl sub_0200472C
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end GF_Snd_LoadGroup

	thumb_func_start sub_02004764
sub_02004764: ; 0x02004764
	push {r4, lr}
	add r4, r0, #0
	bl GetSoundDataPointer
	add r1, r0, #0
	add r1, #0x94
	ldr r1, [r1]
	add r0, r4, #0
	bl sub_020C9DC4
	add r4, r0, #0
	bl sub_0200472C
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02004764

	thumb_func_start sub_02004784
sub_02004784: ; 0x02004784
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl GetSoundDataPointer
	add r2, r0, #0
	add r2, #0x94
	ldr r2, [r2]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_020C9E48
	add r4, r0, #0
	bl sub_0200472C
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02004784

	thumb_func_start sub_020047A8
sub_020047A8: ; 0x020047A8
	push {r4, lr}
	add r4, r0, #0
	bl GetSoundDataPointer
	add r1, r0, #0
	add r1, #0x94
	ldr r1, [r1]
	add r0, r4, #0
	bl sub_020C9E1C
	add r4, r0, #0
	bl sub_0200472C
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020047A8

	thumb_func_start sub_020047C8
sub_020047C8: ; 0x020047C8
	push {r4, lr}
	add r4, r0, #0
	bl GetSoundDataPointer
	add r1, r0, #0
	add r1, #0x94
	ldr r1, [r1]
	add r0, r4, #0
	bl sub_020C9DF0
	add r4, r0, #0
	bl sub_0200472C
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020047C8

	thumb_func_start GetSoundPlayer
GetSoundPlayer: ; 0x020047E8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl GetSoundDataPointer
	add r4, r0, #0
	cmp r5, #9
	blt _020047FC
	bl GF_AssertFail
	mov r5, #0
_020047FC:
	ldr r0, _02004808 ; =0x000BEB78
	add r1, r4, r0
	lsl r0, r5, #2
	add r0, r1, r0
	pop {r3, r4, r5, pc}
	nop
_02004808: .word 0x000BEB78
	thumb_func_end GetSoundPlayer

	thumb_func_start sub_0200480C
sub_0200480C: ; 0x0200480C
	push {r3, lr}
	cmp r0, #7
	bhi _0200484E
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0200481E: ; jump table
	.short _02004832 - _0200481E - 2 ; case 0
	.short _0200482E - _0200481E - 2 ; case 1
	.short _02004836 - _0200481E - 2 ; case 2
	.short _0200483A - _0200481E - 2 ; case 3
	.short _0200483E - _0200481E - 2 ; case 4
	.short _02004842 - _0200481E - 2 ; case 5
	.short _02004846 - _0200481E - 2 ; case 6
	.short _0200484A - _0200481E - 2 ; case 7
_0200482E:
	mov r0, #0
	pop {r3, pc}
_02004832:
	mov r0, #1
	pop {r3, pc}
_02004836:
	mov r0, #2
	pop {r3, pc}
_0200483A:
	mov r0, #3
	pop {r3, pc}
_0200483E:
	mov r0, #4
	pop {r3, pc}
_02004842:
	mov r0, #5
	pop {r3, pc}
_02004846:
	mov r0, #6
	pop {r3, pc}
_0200484A:
	mov r0, #7
	pop {r3, pc}
_0200484E:
	bl GF_AssertFail
	mov r0, #3
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0200480C

	thumb_func_start GF_SoundDataInit
GF_SoundDataInit: ; 0x02004858
	push {r4, lr}
	ldr r2, _02004874 ; =0x000BEC88
	mov r1, #0
	add r4, r0, #0
	bl memset
	ldr r0, _02004878 ; =0x000BEC0C
	mov r1, #0
_02004868:
	add r1, r1, #1
	str r1, [r4, r0]
	add r4, r4, #4
	cmp r1, #7
	blt _02004868
	pop {r4, pc}
	.balign 4, 0
_02004874: .word 0x000BEC88
_02004878: .word 0x000BEC0C
	thumb_func_end GF_SoundDataInit

	thumb_func_start sub_0200487C
sub_0200487C: ; 0x0200487C
	push {r3, r4, r5, lr}
	ldr r1, _02004894 ; =0x000BEB78
	mov r4, #0
	add r5, r0, r1
_02004884:
	add r0, r5, #0
	bl NNS_SndHandleInit
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #9
	blt _02004884
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02004894: .word 0x000BEB78
	thumb_func_end sub_0200487C

	thumb_func_start sub_02004898
sub_02004898: ; 0x02004898
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _020048BC ; =0x000BEC0C
	add r0, r4, r0
	bl GF_Snd_SaveState
	mov r0, #0
	bl GF_Snd_LoadGroup
	ldr r0, _020048C0 ; =0x000002BD
	bl sub_020047C8
	ldr r0, _020048C4 ; =0x000BEC10
	add r0, r4, r0
	bl GF_Snd_SaveState
	pop {r4, pc}
	nop
_020048BC: .word 0x000BEC0C
_020048C0: .word 0x000002BD
_020048C4: .word 0x000BEC10
	thumb_func_end sub_02004898

	thumb_func_start GF_InitMic
GF_InitMic: ; 0x020048C8
	push {r4, lr}
	add r4, r0, #0
	bl MIC_Init
	mov r0, #1
	bl PM_SetAmp
	mov r0, #2
	bl PM_SetAmpGain
	ldr r1, _020048EC ; =0x000BEC80
	mov r0, #1
	ldr r2, [r4, r1]
	bic r2, r0
	mov r0, #1
	orr r0, r2
	str r0, [r4, r1]
	pop {r4, pc}
	.balign 4, 0
_020048EC: .word 0x000BEC80
	thumb_func_end GF_InitMic

	thumb_func_start sub_020048F0
sub_020048F0: ; 0x020048F0
	push {r3, lr}
	mov r0, #7
	mov r1, #0
	bl NNS_SndPlayerStopSeqByPlayerNo
	mov r0, #7
	bl GetSoundPlayer
	bl NNS_SndHandleReleaseSeq
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_020048F0

	thumb_func_start sub_02004908
sub_02004908: ; 0x02004908
	push {r3, lr}
	mov r0, #1
	mov r1, #0
	bl NNS_SndPlayerStopSeqByPlayerNo
	mov r0, #0
	bl GetSoundPlayer
	bl NNS_SndHandleReleaseSeq
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02004908

	thumb_func_start sub_02004920
sub_02004920: ; 0x02004920
	bx lr
	.balign 4, 0
	thumb_func_end sub_02004920

	thumb_func_start sub_02004924
sub_02004924: ; 0x02004924
	push {r3, lr}
	bl GetSoundDataPointer
	ldr r1, _0200493C ; =0x000BEC80
	ldr r0, [r0, r1]
	lsr r0, r0, #1
	cmp r0, #0x5a
	bls _02004938
	mov r0, #1
	pop {r3, pc}
_02004938:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_0200493C: .word 0x000BEC80
	thumb_func_end sub_02004924

	thumb_func_start sub_02004940
sub_02004940: ; 0x02004940
	push {r3, lr}
	bl GetSoundDataPointer
	ldr r2, _02004954 ; =0x000BEC80
	mov r1, #1
	ldr r3, [r0, r2]
	and r1, r3
	str r1, [r0, r2]
	pop {r3, pc}
	nop
_02004954: .word 0x000BEC80
	thumb_func_end sub_02004940

	thumb_func_start sub_02004958
sub_02004958: ; 0x02004958
	push {r4, lr}
	add r4, r0, #0
	bl GetSoundDataPointer
	ldr r1, _02004968 ; =0x000BEC84
	str r4, [r0, r1]
	pop {r4, pc}
	nop
_02004968: .word 0x000BEC84
	thumb_func_end sub_02004958

	thumb_func_start sub_0200496C
sub_0200496C: ; 0x0200496C
	push {r3, lr}
	bl GetSoundDataPointer
	ldr r1, _0200497C ; =0x000BEC84
	ldr r0, [r0, r1]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r3, pc}
	.balign 4, 0
_0200497C: .word 0x000BEC84
	thumb_func_end sub_0200496C

	thumb_func_start sub_02004980
sub_02004980: ; 0x02004980
	push {r3, lr}
	bl sub_02004908
	bl sub_020048F0
	pop {r3, pc}
	thumb_func_end sub_02004980

	thumb_func_start sub_0200498C
sub_0200498C: ; 0x0200498C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _020049C0 ; =0x021D05E4
	bl NNS_SndHandleInit
	ldr r1, _020049C4 ; =0x0000A7FE
	mov r0, #9
	bl sub_020C7FAC
	mov r0, #9
	mov r1, #1
	bl sub_020C7F8C
	ldr r1, [r4]
	ldr r2, _020049C8 ; =0x00002EE0
	mov r0, #9
	bl sub_020C7FC4
	cmp r0, #1
	beq _020049B8
	bl GF_AssertFail
_020049B8:
	ldr r0, _020049CC ; =0x021D05E0
	mov r1, #0
	str r1, [r0]
	pop {r4, pc}
	.balign 4, 0
_020049C0: .word 0x021D05E4
_020049C4: .word 0x0000A7FE
_020049C8: .word 0x00002EE0
_020049CC: .word 0x021D05E0
	thumb_func_end sub_0200498C

	thumb_func_start sub_020049D0
sub_020049D0: ; 0x020049D0
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	bl sub_02004980
	add r0, r4, #0
	bl NNS_SndArcGetSeqParam
	add r2, r0, #0
	str r4, [sp]
	ldrh r2, [r2]
	ldr r0, _02004A00 ; =0x021D05E4
	mov r1, #9
	mov r3, #0x41
	bl sub_020CA8E4
	cmp r0, #1
	beq _020049F6
	mov r4, #0
_020049F6:
	ldr r1, _02004A04 ; =0x021D05E0
	str r4, [r1]
	add sp, #4
	pop {r3, r4, pc}
	nop
_02004A00: .word 0x021D05E4
_02004A04: .word 0x021D05E0
	thumb_func_end sub_020049D0

	thumb_func_start sub_02004A08
sub_02004A08: ; 0x02004A08
	push {r3, lr}
	add r1, r0, #0
	mov r0, #9
	bl NNS_SndPlayerStopSeqByPlayerNo
	ldr r0, _02004A1C ; =0x021D05E0
	mov r1, #0
	str r1, [r0]
	pop {r3, pc}
	nop
_02004A1C: .word 0x021D05E0
	thumb_func_end sub_02004A08

	thumb_func_start sub_02004A20
sub_02004A20: ; 0x02004A20
	ldr r0, _02004A28 ; =0x021D05E0
	ldr r0, [r0]
	bx lr
	nop
_02004A28: .word 0x021D05E0
	thumb_func_end sub_02004A20

	thumb_func_start sub_02004A2C
sub_02004A2C: ; 0x02004A2C
	ldr r3, _02004A34 ; =sub_020C816C
	add r1, r0, #0
	mov r0, #9
	bx r3
	.balign 4, 0
_02004A34: .word sub_020C816C
	thumb_func_end sub_02004A2C

	thumb_func_start sub_02004A38
sub_02004A38: ; 0x02004A38
	ldr r3, _02004A40 ; =sub_020C81F0
	mov r0, #9
	bx r3
	nop
_02004A40: .word sub_020C81F0
	thumb_func_end sub_02004A38

	.data

_0210E980:
	.asciz "data/sound/gs_sound_data.sdat"
	.balign 4, 0
