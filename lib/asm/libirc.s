	.include "macros.inc"
	.include "nitro.inc"
	.include "global.inc"

.bss

_021E4088:
	.space 0x4

_021E408C:
	.space 0x10

_021E409C:
	.space 0xBC

_021E4158:
	.space 0xC8

.text

	arm_func_start CARD_SetSpiReadWaitCycles
CARD_SetSpiReadWaitCycles: ; 0x020DDC70
	ldr r1, _020DDC7C ; =_021E4088
	strb r0, [r1, #2]
	bx lr
	.align 2, 0
_020DDC7C: .word _021E4088
	arm_func_end CARD_SetSpiReadWaitCycles

	arm_func_start CARD_SetSpiWriteWaitCycles
CARD_SetSpiWriteWaitCycles: ; 0x020DDC80
	ldr r1, _020DDC8C ; =_021E4088
	strb r0, [r1, #1]
	bx lr
	.align 2, 0
_020DDC8C: .word _021E4088
	arm_func_end CARD_SetSpiWriteWaitCycles

	arm_func_start CARDi_SpiDummyWait
CARDi_SpiDummyWait: ; 0x020DDC90
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bl OS_GetTick
	mov r4, #0
	ldr r5, _020DDCEC ; =0x000082EA
	ldr sl, _020DDCF0 ; =_021E4088
	mov r6, r0
	mov r7, r1
	mov sb, r4
	mov r8, #0xfa00
_020DDCB4:
	bl OS_GetTick
	subs r3, r0, r6
	sbc r2, r1, r7
	umull r0, r1, r3, r8
	mla r1, r3, sb, r1
	mla r1, r2, r8, r1
	mov r2, r5
	mov r3, r4
	bl _ll_udiv
	ldrb r2, [sl]
	cmp r1, r2, asr #31
	cmpeq r0, r2
	blo _020DDCB4
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_020DDCEC: .word 0x000082EA
_020DDCF0: .word _021E4088
	arm_func_end CARDi_SpiDummyWait

	arm_func_start CARD_SpiWaitInit
CARD_SpiWaitInit: ; 0x020DDCF4
	stmdb sp!, {r3, lr}
	ldr r1, _020DDD38 ; =_021E4088
	mov r0, #0x32
	strb r0, [r1, #2]
	strb r0, [r1, #1]
	strb r0, [r1]
	mov r2, #1
	ldr r0, _020DDD3C ; =_02110FBC
	str r2, [r1, #4]
	ldrh r1, [r0]
	ldr r0, _020DDD40 ; =0x0000FFFD
	cmp r1, r0
	ldmneia sp!, {r3, pc}
	bl OS_GetLockID
	ldr r1, _020DDD3C ; =_02110FBC
	strh r0, [r1]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020DDD38: .word _021E4088
_020DDD3C: .word _02110FBC
_020DDD40: .word 0x0000FFFD
	arm_func_end CARD_SpiWaitInit

	arm_func_start CARDi_SpiWaitWriteByte
CARDi_SpiWaitWriteByte: ; 0x020DDD44
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r6, r0
	bl OS_GetTick
	mov fp, #0
	ldr sl, _020DDDE4 ; =0x000082EA
	ldr sb, _020DDDE8 ; =_021E4088
	mov r4, r0
	mov r5, r1
	mov r8, fp
	mov r7, #0xfa00
_020DDD6C:
	bl OS_GetTick
	subs lr, r0, r4
	sbc ip, r1, r5
	mov r2, sl
	mov r3, fp
	umull r0, r1, lr, r7
	mla r1, lr, r8, r1
	mla r1, ip, r7, r1
	bl _ll_udiv
	ldrb r2, [sb, #1]
	cmp r1, r2, asr #31
	cmpeq r0, r2
	blo _020DDD6C
	ldr r0, [r6, #4]
	ldr r1, _020DDDEC ; =0x040001A2
	ldrb r0, [r0]
	strh r0, [r1]
	ldr r0, [r6, #4]
	sub r1, r1, #2
	add r0, r0, #1
	str r0, [r6, #4]
_020DDDC0:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _020DDDC0
	ldr r0, _020DDDEC ; =0x040001A2
	ldrh r0, [r0]
	strh r0, [sp]
	ldrh r0, [sp]
	and r0, r0, #0xff
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020DDDE4: .word 0x000082EA
_020DDDE8: .word _021E4088
_020DDDEC: .word 0x040001A2
	arm_func_end CARDi_SpiWaitWriteByte

	arm_func_start CARDi_SpiWaitReadByte
CARDi_SpiWaitReadByte: ; 0x020DDDF0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r6, r0
	bl OS_GetTick
	mov fp, #0
	ldr sl, _020DDE88 ; =0x000082EA
	ldr sb, _020DDE8C ; =_021E4088
	mov r4, r0
	mov r5, r1
	mov r8, fp
	mov r7, #0xfa00
_020DDE18:
	bl OS_GetTick
	subs lr, r0, r4
	sbc ip, r1, r5
	mov r2, sl
	mov r3, fp
	umull r0, r1, lr, r7
	mla r1, lr, r8, r1
	mla r1, ip, r7, r1
	bl _ll_udiv
	ldrb r2, [sb, #2]
	cmp r1, r2, asr #31
	cmpeq r0, r2
	blo _020DDE18
	ldr r0, _020DDE90 ; =0x040001A2
	mov r1, #0
	strh r1, [r0]
	sub r1, r0, #2
_020DDE5C:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _020DDE5C
	ldr r1, _020DDE90 ; =0x040001A2
	ldr r0, [r6, #8]
	ldrh r1, [r1]
	strb r1, [r0]
	ldr r0, [r6, #8]
	add r0, r0, #1
	str r0, [r6, #8]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020DDE88: .word 0x000082EA
_020DDE8C: .word _021E4088
_020DDE90: .word 0x040001A2
	arm_func_end CARDi_SpiWaitReadByte

	arm_func_start CARD_SpiWaitReadRange
CARD_SpiWaitReadRange: ; 0x020DDE94
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r2, _020DDFC4 ; =_021E409C
	ldr r1, _020DDFC8 ; =_021E4088
	mov r6, r0
	str r2, [r1, #8]
	str r6, [r1, #0xc]
	mov r0, #1
	strb r0, [r2]
	mov r1, #0
	ldr r0, _020DDFCC ; =_02110FBC
	strb r1, [r6]
	ldrh r0, [r0]
	bl CARD_LockBackup
	ldr r0, _020DDFCC ; =_02110FBC
	ldrh r0, [r0]
	bl OS_LockCard
	ldr r2, _020DDFD0 ; =0x040001A0
_020DDED8:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _020DDED8
	ldr r1, _020DDFD4 ; =0x0000A042
	ldr r0, _020DDFD8 ; =_021E408C
	strh r1, [r2]
	bl CARDi_SpiWaitWriteByte
	bl CARDi_SpiDummyWait
	ldr r0, _020DDFD8 ; =_021E408C
	bl CARDi_SpiWaitReadByte
	bl CARDi_SpiDummyWait
	ldrb r4, [r6]
	ldr r0, _020DDFC8 ; =_021E4088
	mov r5, #0
	str r5, [r0, #8]
	cmp r4, #0xb9
	movhi r4, #0
	str r6, [r0, #0xc]
	strb r5, [r6]
	cmp r4, #0
	beq _020DDF60
	sub sl, r4, #1
	ldr sb, _020DDFDC ; =0x0000A002
	ldr r8, _020DDFD0 ; =0x040001A0
	ldr r7, _020DDFD8 ; =_021E408C
	b _020DDF54
_020DDF40:
	mov r0, r7
	cmp r5, sl
	streqh sb, [r8]
	bl CARDi_SpiWaitReadByte
	add r5, r5, #1
_020DDF54:
	cmp r5, r4
	blt _020DDF40
	b _020DDF74
_020DDF60:
	ldr r2, _020DDFDC ; =0x0000A002
	ldr r1, _020DDFD0 ; =0x040001A0
	ldr r0, _020DDFD8 ; =_021E408C
	strh r2, [r1]
	bl CARDi_SpiWaitReadByte
_020DDF74:
	mov r5, #0
	b _020DDF8C
_020DDF7C:
	ldrb r0, [r6, r5]
	eor r0, r0, #0xaa
	strb r0, [r6, r5]
	add r5, r5, #1
_020DDF8C:
	cmp r5, r4
	blt _020DDF7C
	ldr r1, _020DDFD0 ; =0x040001A0
_020DDF98:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _020DDF98
	ldr r0, _020DDFCC ; =_02110FBC
	ldrh r0, [r0]
	bl OS_UnLockCard
	ldr r0, _020DDFCC ; =_02110FBC
	ldrh r0, [r0]
	bl CARD_UnlockBackup
	mov r0, r4
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_020DDFC4: .word _021E409C
_020DDFC8: .word _021E4088
_020DDFCC: .word _02110FBC
_020DDFD0: .word 0x040001A0
_020DDFD4: .word 0x0000A042
_020DDFD8: .word _021E408C
_020DDFDC: .word 0x0000A002
	arm_func_end CARD_SpiWaitReadRange

	arm_func_start CARD_SpiWaitWriteRange
CARD_SpiWaitWriteRange: ; 0x020DDFE0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r7, _020DE0AC ; =_021E4158
	ldr r3, _020DE0B0 ; =_021E4088
	mov r4, #0
	str r7, [r3, #8]
	ldr r2, _020DE0B4 ; =_02110FBC
	str r4, [r3, #0xc]
	mov r6, r0
	mov r3, #2
	ldrh r0, [r2]
	mov r5, r1
	strb r3, [r7]
	bl CARD_LockBackup
	ldr r0, _020DE0B4 ; =_02110FBC
	ldrh r0, [r0]
	bl OS_LockCard
	ldr r2, _020DE0B8 ; =0x040001A0
_020DE024:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _020DE024
	ldr r1, _020DE0BC ; =0x0000A042
	ldr r0, _020DE0C0 ; =_021E408C
	strh r1, [r2]
	bl CARDi_SpiWaitWriteByte
	bl CARDi_SpiDummyWait
	ldr r0, _020DE0B0 ; =_021E4088
	mov r4, #0
	str r6, [r0, #8]
	sub sb, r5, #1
	ldr r8, _020DE0C4 ; =0x0000A002
	ldr r7, _020DE0B8 ; =0x040001A0
	ldr r6, _020DE0C0 ; =_021E408C
	b _020DE078
_020DE064:
	mov r0, r6
	cmp r4, sb
	streqh r8, [r7]
	bl CARDi_SpiWaitWriteByte
	add r4, r4, #1
_020DE078:
	cmp r4, r5
	blt _020DE064
	ldr r1, _020DE0B8 ; =0x040001A0
_020DE084:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _020DE084
	ldr r0, _020DE0B4 ; =_02110FBC
	ldrh r0, [r0]
	bl OS_UnLockCard
	ldr r0, _020DE0B4 ; =_02110FBC
	ldrh r0, [r0]
	bl CARD_UnlockBackup
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_020DE0AC: .word _021E4158
_020DE0B0: .word _021E4088
_020DE0B4: .word _02110FBC
_020DE0B8: .word 0x040001A0
_020DE0BC: .word 0x0000A042
_020DE0C0: .word _021E408C
_020DE0C4: .word 0x0000A002
	arm_func_end CARD_SpiWaitWriteRange

	arm_func_start CARD_SpiWaitGetStatus
CARD_SpiWaitGetStatus: ; 0x020DE0C8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r3, _020DE228 ; =_021E409C
	ldr r1, _020DE22C ; =_021E4088
	add r2, sp, #0
	str r3, [r1, #8]
	str r2, [r1, #0xc]
	ldr r0, _020DE230 ; =_02110FBC
	mov r1, #8
	ldrh r0, [r0]
	strb r1, [r3]
	bl CARD_LockBackup
	ldr r0, _020DE230 ; =_02110FBC
	ldrh r0, [r0]
	bl OS_LockCard
	bl OS_GetTick
	mov fp, #0
	mov r4, r0
	mov r5, r1
	mov r6, #0x40
	mov r8, fp
	mov r7, #0x3e8
	mov sl, fp
	mov sb, #0x3c
_020DE124:
	bl OS_GetTick
	subs r0, r0, r4
	umull lr, ip, r0, r6
	mla ip, r0, fp, ip
	sbc r1, r1, r5
	mla ip, r1, r6, ip
	umull r0, r1, lr, r7
	mla r1, lr, r8, r1
	mla r1, ip, r7, r1
	ldr r2, _020DE234 ; =0x000082EA
	mov r3, #0
	bl _ll_udiv
	cmp r1, sl
	cmpeq r0, sb
	blo _020DE124
	ldr r2, _020DE238 ; =0x040001A0
_020DE164:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _020DE164
	ldr r1, _020DE23C ; =0x0000A042
	ldr r0, _020DE240 ; =_021E408C
	strh r1, [r2]
	bl CARDi_SpiWaitWriteByte
	strb r0, [sp]
	bl OS_GetTick
	mov r4, r0
	mov r5, r1
	mov r6, #0x40
	mov r7, #0x3e8
	mov sb, #0
	mov r8, #0x32
_020DE1A0:
	bl OS_GetTick
	subs r0, r0, r4
	mov r3, #0
	sbc ip, r1, r5
	mov r1, r3
	umull fp, sl, r0, r6
	mla sl, r0, r1, sl
	mla sl, ip, r6, sl
	mov ip, r3
	umull r0, r1, fp, r7
	mla r1, fp, ip, r1
	mla r1, sl, r7, r1
	ldr r2, _020DE234 ; =0x000082EA
	bl _ll_udiv
	cmp r1, sb
	cmpeq r0, r8
	blo _020DE1A0
	ldr r2, _020DE244 ; =0x0000A002
	ldr r1, _020DE238 ; =0x040001A0
	ldr r0, _020DE240 ; =_021E408C
	strh r2, [r1]
	bl CARDi_SpiWaitReadByte
	ldr r1, _020DE238 ; =0x040001A0
_020DE1FC:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _020DE1FC
	ldr r0, _020DE230 ; =_02110FBC
	ldrh r0, [r0]
	bl OS_UnLockCard
	ldr r0, _020DE230 ; =_02110FBC
	ldrh r0, [r0]
	bl CARD_UnlockBackup
	ldrb r0, [sp]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020DE228: .word _021E409C
_020DE22C: .word _021E4088
_020DE230: .word _02110FBC
_020DE234: .word 0x000082EA
_020DE238: .word 0x040001A0
_020DE23C: .word 0x0000A042
_020DE240: .word _021E408C
_020DE244: .word 0x0000A002
	arm_func_end CARD_SpiWaitGetStatus

.data

_02110FBC:
	.byte 0xFD, 0xFF, 0x00, 0x00
