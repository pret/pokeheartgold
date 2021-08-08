	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start FreeOverlayAllocation
FreeOverlayAllocation: ; 0x02006F58
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #1
	beq _02006F66
	bl GF_AssertFail
_02006F66:
	ldr r1, [r4]
	mov r0, #0
	bl FS_UnloadOverlay
	cmp r0, #1
	beq _02006F76
	bl GF_AssertFail
_02006F76:
	mov r0, #0
	str r0, [r4, #4]
	pop {r4, pc}
	thumb_func_end FreeOverlayAllocation

	thumb_func_start UnloadOverlayByID
UnloadOverlayByID: ; 0x02006F7C
	push {r4, lr}
	add r4, r0, #0
	bl GetOverlayLoadDestination
	bl GetLoadedOverlaysInRegion
	mov r2, #0
	add r3, r0, #0
_02006F8C:
	ldr r1, [r3, #4]
	cmp r1, #1
	bne _02006FA2
	ldr r1, [r3]
	cmp r4, r1
	bne _02006FA2
	lsl r1, r2, #3
	add r0, r0, r1
	bl FreeOverlayAllocation
	pop {r4, pc}
_02006FA2:
	add r2, r2, #1
	add r3, #8
	cmp r2, #8
	blt _02006F8C
	pop {r4, pc}
	thumb_func_end UnloadOverlayByID

	thumb_func_start GetOverlayLoadDestination
GetOverlayLoadDestination: ; 0x02006FAC
	push {lr}
	sub sp, #0x2c
	add r2, r0, #0
	add r0, sp, #0
	mov r1, #0
	bl FS_LoadOverlayInfo
	cmp r0, #1
	beq _02006FC2
	bl GF_AssertFail
_02006FC2:
	mov r0, #2
	ldr r2, [sp, #4]
	lsl r0, r0, #0x18
	cmp r2, r0
	bhi _02006FD8
	lsr r0, r0, #1
	cmp r2, r0
	blo _02006FD8
	add sp, #0x2c
	mov r0, #1
	pop {pc}
_02006FD8:
	mov r0, #1
	ldr r1, _02006FF4 ; =OSi_IntrTable
	lsl r0, r0, #0xe
	add r0, r1, r0
	cmp r2, r0
	bhi _02006FEE
	cmp r2, r1
	blo _02006FEE
	add sp, #0x2c
	mov r0, #2
	pop {pc}
_02006FEE:
	mov r0, #0
	add sp, #0x2c
	pop {pc}
	.balign 4, 0
_02006FF4: .word OSi_IntrTable
	thumb_func_end GetOverlayLoadDestination

	thumb_func_start HandleLoadOverlay
HandleLoadOverlay: ; 0x02006FF8
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	mov r1, #0
	mvn r1, r1
	add r5, r0, #0
	str r1, [sp]
	bl CanOverlayBeLoaded
	cmp r0, #0
	bne _02007010
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02007010:
	add r0, r5, #0
	bl GetOverlayLoadDestination
	add r7, r0, #0
	bl GetLoadedOverlaysInRegion
	add r3, r0, #0
	mov r6, #0
	add r1, r3, #0
_02007022:
	ldr r0, [r1, #4]
	cmp r0, #0
	bne _02007034
	lsl r1, r6, #3
	add r2, r3, r1
	mov r0, #1
	str r0, [r2, #4]
	str r5, [r3, r1]
	b _0200703C
_02007034:
	add r6, r6, #1
	add r1, #8
	cmp r6, #8
	blt _02007022
_0200703C:
	cmp r6, #8
	blt _02007048
	bl GF_AssertFail
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02007048:
	sub r6, r7, #1
	cmp r6, #1
	bhi _02007058
	mov r0, #0
	mvn r0, r0
	bl FS_SetDefaultDMA
	str r0, [sp]
_02007058:
	cmp r4, #0
	beq _02007066
	cmp r4, #1
	beq _02007072
	cmp r4, #2
	beq _0200707E
	b _0200708A
_02007066:
	mov r0, #0
	add r1, r5, #0
	bl LoadOverlayNormal
	add r4, r0, #0
	b _02007092
_02007072:
	mov r0, #0
	add r1, r5, #0
	bl LoadOverlayNoInit
	add r4, r0, #0
	b _02007092
_0200707E:
	mov r0, #0
	add r1, r5, #0
	bl LoadOverlayNoInitAsync
	add r4, r0, #0
	b _02007092
_0200708A:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02007092:
	cmp r6, #1
	bhi _0200709C
	ldr r0, [sp]
	bl FS_SetDefaultDMA
_0200709C:
	cmp r4, #0
	bne _020070A8
	bl GF_AssertFail
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_020070A8:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end HandleLoadOverlay

	thumb_func_start CanOverlayBeLoaded
CanOverlayBeLoaded: ; 0x020070AC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r1, sp, #0xc
	add r2, sp, #8
	add r4, r0, #0
	bl GetOverlayRamBounds
	cmp r0, #0
	bne _020070C4
	add sp, #0x10
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_020070C4:
	add r0, r4, #0
	bl GetOverlayLoadDestination
	bl GetLoadedOverlaysInRegion
	add r5, r0, #0
	mov r4, #0
	add r6, sp, #4
	add r7, sp, #0
_020070D6:
	ldr r0, [r5, #4]
	cmp r0, #1
	bne _02007114
	ldr r0, [r5]
	add r1, r6, #0
	add r2, r7, #0
	bl GetOverlayRamBounds
	cmp r0, #1
	bne _02007114
	ldr r1, [sp, #4]
	ldr r2, [sp, #0xc]
	cmp r2, r1
	blo _020070F8
	ldr r0, [sp]
	cmp r2, r0
	blo _0200710E
_020070F8:
	ldr r3, [sp, #8]
	cmp r3, r1
	bls _02007104
	ldr r0, [sp]
	cmp r3, r0
	bls _0200710E
_02007104:
	cmp r2, r1
	bhi _02007114
	ldr r0, [sp]
	cmp r3, r0
	blo _02007114
_0200710E:
	add sp, #0x10
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02007114:
	add r4, r4, #1
	add r5, #8
	cmp r4, #8
	blt _020070D6
	mov r0, #1
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end CanOverlayBeLoaded

	thumb_func_start GetLoadedOverlaysInRegion
GetLoadedOverlaysInRegion: ; 0x02007124
	cmp r0, #0
	beq _02007130
	cmp r0, #1
	beq _02007134
	cmp r0, #2
	beq _02007138
_02007130:
	ldr r0, _0200713C ; =0x021D0DF0
	bx lr
_02007134:
	ldr r0, _02007140 ; =0x021D0E30
	bx lr
_02007138:
	ldr r0, _02007144 ; =0x021D0E70
	bx lr
	.balign 4, 0
_0200713C: .word 0x021D0DF0
_02007140: .word 0x021D0E30
_02007144: .word 0x021D0E70
	thumb_func_end GetLoadedOverlaysInRegion

	thumb_func_start GetOverlayRamBounds
GetOverlayRamBounds: ; 0x02007148
	push {r4, r5, lr}
	sub sp, #0x2c
	add r3, r0, #0
	add r5, r1, #0
	add r4, r2, #0
	add r0, sp, #0
	mov r1, #0
	add r2, r3, #0
	bl FS_LoadOverlayInfo
	cmp r0, #0
	bne _0200716A
	bl GF_AssertFail
	add sp, #0x2c
	mov r0, #0
	pop {r4, r5, pc}
_0200716A:
	ldr r2, [sp, #4]
	str r2, [r5]
	ldr r1, [sp, #8]
	ldr r0, [sp, #0xc]
	add r0, r1, r0
	add r0, r2, r0
	str r0, [r4]
	mov r0, #1
	add sp, #0x2c
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end GetOverlayRamBounds

	thumb_func_start LoadOverlayNormal
LoadOverlayNormal: ; 0x02007180
	ldr r3, _02007184 ; =FS_LoadOverlay
	bx r3
	.balign 4, 0
_02007184: .word FS_LoadOverlay
	thumb_func_end LoadOverlayNormal

	thumb_func_start LoadOverlayNoInit
LoadOverlayNoInit: ; 0x02007188
	push {lr}
	sub sp, #0x2c
	add r3, r0, #0
	add r2, r1, #0
	add r0, sp, #0
	add r1, r3, #0
	bl FS_LoadOverlayInfo
	cmp r0, #0
	bne _020071A2
	add sp, #0x2c
	mov r0, #0
	pop {pc}
_020071A2:
	add r0, sp, #0
	bl FS_LoadOverlayImage
	cmp r0, #0
	bne _020071B2
	add sp, #0x2c
	mov r0, #0
	pop {pc}
_020071B2:
	add r0, sp, #0
	bl FS_StartOverlay
	mov r0, #1
	add sp, #0x2c
	pop {pc}
	.balign 4, 0
	thumb_func_end LoadOverlayNoInit

	thumb_func_start LoadOverlayNoInitAsync
LoadOverlayNoInitAsync: ; 0x020071C0
	push {lr}
	sub sp, #0x74
	add r3, r0, #0
	add r2, r1, #0
	add r0, sp, #0
	add r1, r3, #0
	bl FS_LoadOverlayInfo
	cmp r0, #0
	bne _020071DA
	add sp, #0x74
	mov r0, #0
	pop {pc}
_020071DA:
	add r0, sp, #0x2c
	bl FS_InitFile
	add r0, sp, #0
	add r1, sp, #0x2c
	bl FS_LoadOverlayImageAsync
	add r0, sp, #0x2c
	bl FS_WaitAsync
	add r0, sp, #0x2c
	bl FS_CloseFile
	add r0, sp, #0
	bl FS_StartOverlay
	mov r0, #1
	add sp, #0x74
	pop {pc}
	thumb_func_end LoadOverlayNoInitAsync
