	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start InitScriptContext
InitScriptContext: ; 0x0203FD18
	push {r3, r4}
	mov r3, #0
	strb r3, [r0, #1]
	str r3, [r0, #8]
	strb r3, [r0]
	strb r3, [r0, #3]
	str r3, [r0, #4]
	str r1, [r0, #0x5c]
	str r2, [r0, #0x60]
	add r1, r0, #0
	add r4, r3, #0
_0203FD2E:
	add r3, r3, #1
	str r4, [r1, #0x64]
	add r1, r1, #4
	cmp r3, #4
	blo _0203FD2E
	add r2, r0, #0
	mov r1, #0
_0203FD3C:
	add r4, r4, #1
	str r1, [r2, #0xc]
	add r2, r2, #4
	cmp r4, #0x14
	blo _0203FD3C
	str r1, [r0, #0x74]
	pop {r3, r4}
	bx lr
	thumb_func_end InitScriptContext

	thumb_func_start SetupBytecodeScript
SetupBytecodeScript: ; 0x0203FD4C
	str r1, [r0, #8]
	mov r1, #1
	strb r1, [r0, #1]
	add r0, r1, #0
	bx lr
	.balign 4, 0
	thumb_func_end SetupBytecodeScript

	thumb_func_start SetupNativeScript
SetupNativeScript: ; 0x0203FD58
	mov r2, #2
	strb r2, [r0, #1]
	str r1, [r0, #4]
	bx lr
	thumb_func_end SetupNativeScript

	thumb_func_start StopScript
StopScript: ; 0x0203FD60
	mov r1, #0
	strb r1, [r0, #1]
	str r1, [r0, #8]
	bx lr
	thumb_func_end StopScript

	thumb_func_start sub_0203FD68
sub_0203FD68: ; 0x0203FD68
	str r1, [r0, #0x74]
	bx lr
	thumb_func_end sub_0203FD68

	thumb_func_start RunScriptCommand
RunScriptCommand: ; 0x0203FD6C
	push {r4, lr}
	add r4, r0, #0
	ldrb r1, [r4, #1]
	cmp r1, #0
	bne _0203FD7A
	mov r0, #0
	pop {r4, pc}
_0203FD7A:
	beq _0203FD86
	cmp r1, #1
	beq _0203FDA2
	cmp r1, #2
	beq _0203FD8A
	b _0203FDD4
_0203FD86:
	mov r0, #0
	pop {r4, pc}
_0203FD8A:
	ldr r1, [r4, #4]
	cmp r1, #0
	beq _0203FD9E
	blx r1
	cmp r0, #1
	bne _0203FD9A
	mov r0, #1
	strb r0, [r4, #1]
_0203FD9A:
	mov r0, #1
	pop {r4, pc}
_0203FD9E:
	mov r0, #1
	strb r0, [r4, #1]
_0203FDA2:
	ldr r0, [r4, #8]
	cmp r0, #0
	bne _0203FDAE
	mov r0, #0
	strb r0, [r4, #1]
	pop {r4, pc}
_0203FDAE:
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	ldr r0, [r4, #0x60]
	cmp r1, r0
	blo _0203FDC6
	bl GF_AssertFail
	mov r0, #0
	strb r0, [r4, #1]
	pop {r4, pc}
_0203FDC6:
	ldr r2, [r4, #0x5c]
	lsl r1, r1, #2
	ldr r1, [r2, r1]
	add r0, r4, #0
	blx r1
	cmp r0, #1
	bne _0203FDA2
_0203FDD4:
	mov r0, #1
	pop {r4, pc}
	thumb_func_end RunScriptCommand

	thumb_func_start ScriptPush
ScriptPush: ; 0x0203FDD8
	ldrb r3, [r0]
	add r2, r3, #1
	cmp r2, #0x14
	blt _0203FDE4
	mov r0, #1
	bx lr
_0203FDE4:
	lsl r2, r3, #2
	add r2, r0, r2
	str r1, [r2, #0xc]
	ldrb r1, [r0]
	add r1, r1, #1
	strb r1, [r0]
	mov r0, #0
	bx lr
	thumb_func_end ScriptPush

	thumb_func_start ScriptPop
ScriptPop: ; 0x0203FDF4
	ldrb r1, [r0]
	cmp r1, #0
	bne _0203FDFE
	mov r0, #0
	bx lr
_0203FDFE:
	sub r1, r1, #1
	strb r1, [r0]
	ldrb r1, [r0]
	lsl r1, r1, #2
	add r0, r0, r1
	ldr r0, [r0, #0xc]
	bx lr
	thumb_func_end ScriptPop

	thumb_func_start ScriptJump
ScriptJump: ; 0x0203FE0C
	str r1, [r0, #8]
	bx lr
	thumb_func_end ScriptJump

	thumb_func_start ScriptCall
ScriptCall: ; 0x0203FE10
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	ldr r1, [r5, #8]
	bl ScriptPush
	str r4, [r5, #8]
	pop {r3, r4, r5, pc}
	thumb_func_end ScriptCall

	thumb_func_start ScriptReturn
ScriptReturn: ; 0x0203FE20
	push {r4, lr}
	add r4, r0, #0
	bl ScriptPop
	str r0, [r4, #8]
	pop {r4, pc}
	thumb_func_end ScriptReturn

	thumb_func_start ScriptReadHalfword
ScriptReadHalfword: ; 0x0203FE2C
	ldr r1, [r0, #8]
	add r3, r1, #1
	str r3, [r0, #8]
	ldrb r2, [r1]
	add r1, r3, #1
	str r1, [r0, #8]
	ldrb r0, [r3]
	lsl r0, r0, #8
	add r0, r2, r0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bx lr
	thumb_func_end ScriptReadHalfword

	thumb_func_start ScriptReadWord
ScriptReadWord: ; 0x0203FE44
	push {r4, r5}
	ldr r1, [r0, #8]
	add r2, r1, #1
	str r2, [r0, #8]
	ldrb r3, [r1]
	add r1, r2, #1
	add r5, r1, #1
	str r1, [r0, #8]
	ldrb r2, [r2]
	add r4, r5, #1
	str r5, [r0, #8]
	ldrb r1, [r1]
	str r4, [r0, #8]
	ldrb r0, [r5]
	mov r4, #0
	add r0, r4, r0
	lsl r0, r0, #8
	add r0, r0, r1
	lsl r0, r0, #8
	add r0, r0, r2
	lsl r0, r0, #8
	add r0, r0, r3
	pop {r4, r5}
	bx lr
	thumb_func_end ScriptReadWord
