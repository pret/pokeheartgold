	.include "asm/macros.inc"
	.include "unk_02027010.inc"
	.include "global.inc"

	.rodata

_020F6458:
	.asciz "rom"

	.text

	thumb_func_start sub_02027010
sub_02027010: ; 0x02027010
	push {r3, lr}
	bl FS_IsAvailable
	cmp r0, #0
	bne _02027020
	bl OS_Terminate
	pop {r3, pc}
_02027020:
	ldr r0, _0202707C ; =0x027FF00C
	ldr r0, [r0]
	cmp r0, #0
	bne _0202704A
	bl CARD_Init
	mov r2, #0x16
	ldr r0, _02027080 ; =0x027FFE00
	ldr r1, _02027084 ; =0x027FF000
	lsl r2, r2, #4
	bl MI_CpuCopy8
	mov r2, #0x16
	ldr r0, _02027080 ; =0x027FFE00
	ldr r1, _02027088 ; =0x027FFA80
	lsl r2, r2, #4
	bl MI_CpuCopy8
	ldr r1, _0202708C ; =0x4A414441
	ldr r0, _0202707C ; =0x027FF00C
	str r1, [r0]
_0202704A:
	ldr r0, _02027090 ; =_020F6458
	mov r1, #3
	bl FS_FindArchive
	ldr r1, _02027084 ; =0x027FF000
	ldr r2, [r1, #0x48]
	str r2, [r0, #0x2c]
	ldr r2, [r1, #0x4c]
	str r2, [r0, #0x30]
	ldr r2, [r1, #0x40]
	str r2, [r0, #0x34]
	ldr r2, [r1, #0x44]
	str r2, [r0, #0x38]
	ldr r2, [r1, #0xc]
	ldr r0, _0202708C ; =0x4A414441
	cmp r2, r0
	bne _02027074
	ldrh r1, [r1, #0x10]
	ldr r0, _02027094 ; =0x00003130
	cmp r1, r0
	beq _02027078
_02027074:
	bl OS_Terminate
_02027078:
	pop {r3, pc}
	nop
_0202707C: .word 0x027FF00C
_02027080: .word 0x027FFE00
_02027084: .word 0x027FF000
_02027088: .word 0x027FFA80
_0202708C: .word 0x4A414441
_02027090: .word _020F6458
_02027094: .word 0x00003130
	thumb_func_end sub_02027010

	thumb_func_start sub_02027098
sub_02027098: ; 0x02027098
	push {r4, lr}
	sub sp, #0x48
	add r4, r0, #0
	add r0, sp, #0
	bl FS_InitFile
	add r0, sp, #0
	add r1, r4, #0
	bl FS_OpenFile
	cmp r0, #0
	beq _020270BC
	ldr r1, [sp, #0x24]
	ldr r0, _020270C0 ; =0x027FFC2C
	str r1, [r0]
	mov r0, #0
	bl OS_ResetSystem
_020270BC:
	add sp, #0x48
	pop {r4, pc}
	.balign 4, 0
_020270C0: .word 0x027FFC2C
	thumb_func_end sub_02027098
