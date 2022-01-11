	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ScrCmd_391
ScrCmd_391: ; 0x02259B40
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x80
	ldr r4, [r1]
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	add r5, r0, #0
	ldr r0, [r4, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r5, #0
	bl GetPartyMonByIndex
	add r5, r0, #0
	ldr r0, [r4, #0xc]
	bl SavArray_Flags_get
	add r4, r0, #0
	add r0, r5, #0
	bl ov20_022598C0
	add r1, r0, #0
	lsl r1, r1, #0x10
	add r0, r4, #0
	lsr r1, r1, #0x10
	bl sub_02066B60
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_391

	thumb_func_start ScrCmd_393
ScrCmd_393: ; 0x02259B88
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x80
	ldr r4, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	add r5, r0, #0
	ldr r0, [r4, #0xc]
	bl SavArray_Flags_get
	bl ScriptState_GetFishingCompetitionLengthRecord
	add r1, sp, #4
	strh r0, [r1]
	ldrh r0, [r1]
	lsl r1, r6, #0x18
	lsl r2, r7, #0x18
	str r0, [sp]
	add r0, r4, #0
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
	add r3, r5, #0
	bl ov20_02259A1C
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ScrCmd_393

	thumb_func_start ScrCmd_392
ScrCmd_392: ; 0x02259BF4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x80
	ldr r4, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	add r5, r0, #0
	ldr r0, [r4, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r5, #0
	bl GetPartyMonByIndex
	str r0, [sp, #4]
	mov r1, #5
	mov r2, #0
	bl GetMonData
	add r5, r0, #0
	ldr r0, [sp, #4]
	bl ov20_022598C0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	lsl r1, r6, #0x18
	lsl r2, r7, #0x18
	lsl r3, r5, #0x10
	str r0, [sp]
	add r0, r4, #0
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
	lsr r3, r3, #0x10
	bl ov20_02259A1C
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ScrCmd_392

	.rodata

	.public ov20_02259C74
ov20_02259C74:
	.short 290,  1,       0
	.short 300,  1,      10
	.short 400,  2,     110
	.short 500,  4,     310
	.short 600,  20,    710
	.short 700,  50,   2710
	.short 800,  100,  7710
	.short 900,  150, 17710
	.short 1000, 150, 32710
	.short 1100, 100, 47710
	.short 1200, 50,  57710
	.short 1300, 20,  62710
	.short 1400, 5,   64710
	.short 1500, 2,   65210
	.short 1600, 1,   65410
	.short 1700, 1,   65510
