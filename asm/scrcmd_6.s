	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ScrCmd_575
ScrCmd_575: ; 0x0204910C
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r5, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	add r4, r0, #0
	add r0, r5, #0
	bl sub_02005F94
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ScrCmd_575

	thumb_func_start ScrCmd_080
ScrCmd_080: ; 0x02049134
	push {r3, lr}
	bl ScriptReadHalfword
	bl PlayBGM
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_080

	thumb_func_start ScrCmd_081
ScrCmd_081: ; 0x02049144
	push {r3, lr}
	bl ScriptReadHalfword
	bl sub_02004A90
	mov r1, #0
	bl sub_02005EB4
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ScrCmd_081

	thumb_func_start ScrCmd_082
ScrCmd_082: ; 0x02049158
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	ldr r1, [r0, #0x20]
	ldr r1, [r1]
	bl GetMapMusic
	bl PlayBGM
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_082

	thumb_func_start ScrCmd_083
ScrCmd_083: ; 0x02049170
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl sub_02054F28
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_083

	thumb_func_start ScrCmd_084
ScrCmd_084: ; 0x02049188
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	bl GF_SndStartFadeOutBGM
	ldr r1, _020491AC ; =sub_020491B0
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_020491AC: .word sub_020491B0
	thumb_func_end ScrCmd_084

	thumb_func_start sub_020491B0
sub_020491B0: ; 0x020491B0
	push {r3, lr}
	bl GF_SndGetFadeTimer
	cmp r0, #0
	bne _020491BE
	mov r0, #1
	pop {r3, pc}
_020491BE:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_020491B0

	thumb_func_start ScrCmd_085
ScrCmd_085: ; 0x020491C4
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	mov r0, #0x7f
	mov r2, #0
	bl GF_SndStartFadeInBGM
	ldr r1, _020491E4 ; =sub_020491B0
	add r0, r4, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r4, pc}
	nop
_020491E4: .word sub_020491B0
	thumb_func_end ScrCmd_085

	thumb_func_start ScrCmd_086
ScrCmd_086: ; 0x020491E8
	push {r3, lr}
	ldr r1, [r0, #8]
	add r3, r1, #1
	str r3, [r0, #8]
	ldrb r2, [r1]
	add r1, r3, #1
	str r1, [r0, #8]
	ldrb r1, [r3]
	add r0, r2, #0
	bl sub_020053A8
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_086

	thumb_func_start ScrCmd_087
ScrCmd_087: ; 0x02049204
	push {r3, lr}
	bl ScriptReadHalfword
	bl sub_02005E44
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_087

	thumb_func_start ScrCmd_088
ScrCmd_088: ; 0x02049214
	push {r3, lr}
	ldr r2, [r0, #8]
	add r1, r2, #1
	str r1, [r0, #8]
	ldrb r0, [r2]
	bl sub_02004A44
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_088

	thumb_func_start ScrCmd_073
ScrCmd_073: ; 0x02049228
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl VarGet
	bl PlaySE
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_073

	thumb_func_start ScrCmd_074
ScrCmd_074: ; 0x02049244
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl VarGet
	mov r1, #0
	bl sub_02006154
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ScrCmd_074

	thumb_func_start ScrCmd_075
ScrCmd_075: ; 0x02049260
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	str r0, [r4, #0x64]
	ldr r1, _02049284 ; =sub_02049288
	add r0, r4, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r4, pc}
	nop
_02049284: .word sub_02049288
	thumb_func_end ScrCmd_075

	thumb_func_start sub_02049288
sub_02049288: ; 0x02049288
	push {r3, lr}
	ldr r0, [r0, #0x64]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl sub_02006184
	cmp r0, #0
	bne _0204929C
	mov r0, #1
	pop {r3, pc}
_0204929C:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_02049288

	thumb_func_start ScrCmd_076
ScrCmd_076: ; 0x020492A0
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	mov r1, #0x20
	str r1, [sp]
	mov r2, #0
	add r1, r4, #0
	mov r3, #0x64
	str r2, [sp, #4]
	bl PlayCryEx
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_076

	thumb_func_start ScrCmd_077
ScrCmd_077: ; 0x020492E0
	push {r3, lr}
	ldr r1, _020492EC ; =sub_020492F0
	bl SetupNativeScript
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
_020492EC: .word sub_020492F0
	thumb_func_end ScrCmd_077

	thumb_func_start sub_020492F0
sub_020492F0: ; 0x020492F0
	push {r3, lr}
	bl sub_02006360
	cmp r0, #0
	bne _020492FE
	mov r0, #1
	pop {r3, pc}
_020492FE:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_020492F0

	thumb_func_start ScrCmd_078
ScrCmd_078: ; 0x02049304
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl VarGet
	bl sub_02006B24
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_078

	thumb_func_start ScrCmd_079
ScrCmd_079: ; 0x02049320
	push {r3, lr}
	ldr r1, _0204932C ; =sub_02049330
	bl SetupNativeScript
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
_0204932C: .word sub_02049330
	thumb_func_end ScrCmd_079

	thumb_func_start sub_02049330
sub_02049330: ; 0x02049330
	push {r3, lr}
	bl sub_02006BCC
	cmp r0, #0
	bne _0204933E
	mov r0, #1
	pop {r3, pc}
_0204933E:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02049330

	thumb_func_start ScrCmd_089
ScrCmd_089: ; 0x02049344
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Sav2_Chatot_get
	bl Chatot_checkCry
	cmp r0, #1
	bne _02049374
	mov r0, #1
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
_02049374:
	mov r0, #0
	strh r0, [r4]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_089

	thumb_func_start ScrCmd_090
ScrCmd_090: ; 0x0204937C
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	add r4, r0, #0
	bl sub_02005518
	cmp r0, #0
	bne _0204939C
	bl GF_AssertFail
_0204939C:
	bl Chatot_startRecording
	cmp r0, #0
	bne _020493AC
	mov r0, #1
	strh r0, [r4]
	mov r0, #0
	pop {r4, pc}
_020493AC:
	mov r0, #0
	strh r0, [r4]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_090

	thumb_func_start ScrCmd_091
ScrCmd_091: ; 0x020493B4
	push {r3, lr}
	bl Chatot_stopRecording
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_091

	thumb_func_start ScrCmd_092
ScrCmd_092: ; 0x020493C0
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl Sav2_Chatot_get
	bl Chatot_saveRecording
	mov r0, #1
	pop {r3, pc}
	thumb_func_end ScrCmd_092

	thumb_func_start ScrCmd_093
ScrCmd_093: ; 0x020493D4
	push {r3, lr}
	mov r1, #0
	mov r0, #0x3f
	add r2, r1, #0
	bl sub_02004EC4
	mov r0, #1
	pop {r3, pc}
	thumb_func_end ScrCmd_093

	thumb_func_start ScrCmd_544
ScrCmd_544: ; 0x020493E4
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r5, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl VarGet
	add r1, r0, #0
	add r0, r5, #0
	bl sub_020054AC
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_544

	thumb_func_start ScrCmd_664
ScrCmd_664: ; 0x02049418
	mov r0, #1
	bx lr
	thumb_func_end ScrCmd_664

	thumb_func_start ScrCmd_665
ScrCmd_665: ; 0x0204941C
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl sub_02055198
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_665

	thumb_func_start ScrCmd_666
ScrCmd_666: ; 0x02049440
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	add r4, r0, #0
	bl sub_02004A90
	strh r0, [r4]
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_666
