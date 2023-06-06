#include "constants/sndseq.h"
#include "constants/moves.h"
#include "constants/std_script.h"
#include "constants/species.h"
#include "constants/sprites.h"
#include "constants/maps.h"
#include "constants/mmodel.h"
#include "constants/items.h"
#include "msgdata/msg/msg_0096_D31R0201.h"
#include "msgdata/msg/msg_0066_D23R0102.h"
	.include "asm/macros.inc"
	.include "scrcmd_move_tutor.inc"
	.include "global.inc"

	.text

	thumb_func_start ScrCmd_652
ScrCmd_652: ; 0x02202B00
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
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
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl SaveArray_PlayerParty_get
	add r1, r6, #0
	bl GetPartyMonByIndex
	add r1, r7, #0
	mov r2, #0
	bl MonGetTutorCompat
	cmp r0, #0
	bne _02202B60
	mov r0, #0
	strh r0, [r4]
	b _02202B74
_02202B60:
	cmp r0, #7
	bhi _02202B6A
	mov r0, #1
	strh r0, [r4]
	b _02202B74
_02202B6A:
	mov r1, #6
	bl _s32_div_f
	add r0, r0, #1
	strh r0, [r4]
_02202B74:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ScrCmd_652

	thumb_func_start ScrCmd_TutorMoveTeachInSlot
ScrCmd_TutorMoveTeachInSlot: ; 0x02202B78
	push {r3, r4, r5, r6, r7, lr}
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
	add r5, #0x80
	add r7, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl SaveArray_PlayerParty_get
	add r1, r4, #0
	add r2, r6, #0
	add r3, r7, #0
	bl PartyMonSetMoveInSlot
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_TutorMoveTeachInSlot

	thumb_func_start ScrCmd_TutorMoveGetPrice
ScrCmd_TutorMoveGetPrice: ; 0x02202BD0
	push {r3, r4, r5, lr}
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
	bl GetVarPointer
	ldr r2, _02202C20 ; =sTutorMoves
	add r5, r0, #0
	mov r1, #0
_02202BFC:
	ldrh r0, [r2]
	cmp r4, r0
	bne _02202C0E
	ldr r0, _02202C24 ; =sTutorMoves + 2
	lsl r1, r1, #2
	ldrb r0, [r0, r1]
	strh r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, pc}
_02202C0E:
	add r1, r1, #1
	add r2, r2, #4
	cmp r1, #0x34
	blo _02202BFC
	bl GF_AssertFail
	mov r0, #0
	strh r0, [r5]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02202C20: .word sTutorMoves
_02202C24: .word sTutorMoves + 2
	thumb_func_end ScrCmd_TutorMoveGetPrice

	thumb_func_start ScrCmd_656
ScrCmd_656: ; 0x02202C28
	push {r4, r5, r6, lr}
	add r5, r0, #0
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
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl SaveArray_PlayerParty_get
	add r1, r6, #0
	bl GetPartyMonByIndex
	mov r1, #3
	mov r2, #0
	bl MonGetTutorCompat
	cmp r0, #0
	beq _02202C72
	mov r0, #1
	b _02202C74
_02202C72:
	mov r0, #0
_02202C74:
	strh r0, [r4]
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_656

	thumb_func_start SpeciesAndFormeToWazaOshieIndex
SpeciesAndFormeToWazaOshieIndex: ; 0x02202C7C
	; Convert species and forme into
	; naix for tutor compat
	ldr r2, _02202D3C ; =SPECIES_ROTOM
	cmp r0, r2
	bgt _02202CA0
	bge _02202D02
	add r3, r2, #0
	sub r3, #SPECIES_ROTOM - SPECIES_DEOXYS
	cmp r0, r3
	bgt _02202C96
	add r3, r2, #0
	sub r3, #SPECIES_ROTOM - SPECIES_DEOXYS
	cmp r0, r3
	beq _02202CBC
	b _02202D32
_02202C96:
	add r3, r2, #0
	sub r3, #SPECIES_ROTOM - SPECIES_WORMADAM
	cmp r0, r3
	beq _02202CDA
	b _02202D32
_02202CA0:
	add r3, r2, #0
	add r3, #8
	cmp r0, r3
	bgt _02202CB2
	add r3, r2, #0
	add r3, #8
	cmp r0, r3
	beq _02202CEE
	b _02202D32
_02202CB2:
	add r3, r2, #0
	add r3, #0xd
	cmp r0, r3
	beq _02202CF8
	b _02202D32
_02202CBC:
	cmp r1, #1
	bne _02202CC6
	add r0, r2, #0
	add r0, #0xf
	b _02202D32
_02202CC6:
	cmp r1, #2
	bne _02202CD0
	add r0, r2, #0
	add r0, #0x10
	b _02202D32
_02202CD0:
	cmp r1, #3
	bne _02202D32
	add r0, r2, #0
	add r0, #0x11
	b _02202D32
_02202CDA:
	cmp r1, #1
	bne _02202CE4
	add r0, r2, #0
	add r0, #0x12
	b _02202D32
_02202CE4:
	cmp r1, #2
	bne _02202D32
	add r0, r2, #0
	add r0, #0x13
	b _02202D32
_02202CEE:
	cmp r1, #1
	bne _02202D32
	add r0, r2, #0
	add r0, #0x14
	b _02202D32
_02202CF8:
	cmp r1, #1
	bne _02202D32
	add r0, r2, #0
	add r0, #0x15
	b _02202D32
_02202D02:
	cmp r1, #1
	bne _02202D0C
	add r0, r2, #0
	add r0, #0x16
	b _02202D32
_02202D0C:
	cmp r1, #2
	bne _02202D16
	add r0, r2, #0
	add r0, #0x17
	b _02202D32
_02202D16:
	cmp r1, #3
	bne _02202D20
	add r0, r2, #0
	add r0, #0x18
	b _02202D32
_02202D20:
	cmp r1, #4
	bne _02202D2A
	add r0, r2, #0
	add r0, #0x19
	b _02202D32
_02202D2A:
	cmp r1, #5
	bne _02202D32
	add r0, r2, #0
	add r0, #0x1a
_02202D32:
	sub r0, r0, #1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bx lr
	nop
_02202D3C: .word SPECIES_ROTOM
	thumb_func_end SpeciesAndFormeToWazaOshieIndex

	thumb_func_start MonGetTutorCompat
MonGetTutorCompat: ; 0x02202D40
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r6, r0, #0
	str r1, [sp]
	add r7, r2, #0
	mov r4, #0
	add r5, sp, #4
	; Get the poke's current moveset
_02202D4E:
	add r1, r4, #0
	add r0, r6, #0
	add r1, #0x36
	mov r2, #0
	bl GetMonData
	strh r0, [r5]
	add r4, r4, #1
	add r5, r5, #2
	cmp r4, #4
	blt _02202D4E
	; Get species and forme, then
	; get tutor compat flags
	add r0, r6, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	add r4, r0, #0
	add r0, r6, #0
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	add r1, r0, #0
	lsl r0, r4, #0x10
	lsl r1, r1, #0x18
	lsr r0, r0, #0x10
	lsr r1, r1, #0x18
	bl SpeciesAndFormeToWazaOshieIndex
	add r1, r0, #0
	mov r0, #0xb
	bl WazaOshieGet
	mov r6, #0
	mov ip, r0
	ldr r1, _02202DFC ; =sTutorMoves
	add r0, r6, #0
_02202D98:
	; waza_oshie.bin entries are 64-bit
	; flag arrays
	asr r2, r0, #2
	lsr r2, r2, #0x1d
	add r2, r0, r2
	asr r3, r2, #3
	mov r2, ip
	ldrb r5, [r2, r3]
	lsr r4, r0, #0x1f
	lsl r3, r0, #0x1d
	sub r3, r3, r4
	mov r2, #0x1d
	ror r3, r2
	add r2, r4, r3
	add r3, r5, #0
	asr r3, r2
	mov r2, #1
	tst r2, r3
	beq _02202DE6
	ldrb r3, [r1, #3]
	ldr r2, [sp]
	cmp r2, r3
	bne _02202DE6
	ldrh r4, [r1]
	mov r5, #0
	add r3, sp, #4
_02202DC8:
	ldrh r2, [r3]
	cmp r2, r4
	beq _02202DD6
	add r5, r5, #1
	add r3, r3, #2
	cmp r5, #4
	blt _02202DC8
_02202DD6:
	cmp r5, #4
	blt _02202DE6
	cmp r7, #0
	beq _02202DE0
	strb r0, [r7, r6]
_02202DE0:
	add r2, r6, #1
	lsl r2, r2, #0x10
	lsr r6, r2, #0x10
_02202DE6:
	add r0, r0, #1
	add r1, r1, #4
	cmp r0, #0x34
	blo _02202D98
	mov r0, ip
	bl FreeToHeap
	add r0, r6, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_02202DFC: .word sTutorMoves
	thumb_func_end MonGetTutorCompat

	thumb_func_start WazaOshieGet
WazaOshieGet: ; 0x02202E00
	push {r3, r4, r5, lr}
	sub sp, #0x48
	add r5, r0, #0
	add r0, sp, #0
	add r4, r1, #0
	bl FS_InitFile
	ldr r1, _02202E60 ; =ov01_02209AF4
	add r0, sp, #0
	bl FS_OpenFile
	cmp r0, #0
	bne _02202E24
	bl GF_AssertFail
	add sp, #0x48
	mov r0, #0
	pop {r3, r4, r5, pc}
_02202E24:
	ldr r1, [sp, #0x28]
	ldr r0, [sp, #0x24]
	sub r1, r1, r0
	ldr r0, _02202E64 ; =505 * 8
	cmp r1, r0
	beq _02202E34
	bl GF_AssertFail
_02202E34:
	add r0, r5, #0
	mov r1, #8
	bl AllocFromHeapAtEnd
	add r5, r0, #0
	add r0, sp, #0
	lsl r1, r4, #3
	mov r2, #0
	bl FS_SeekFile
	add r0, sp, #0
	add r1, r5, #0
	mov r2, #8
	bl FS_ReadFile
	add r0, sp, #0
	bl FS_CloseFile
	add r0, r5, #0
	add sp, #0x48
	pop {r3, r4, r5, pc}
	nop
_02202E60: .word ov01_02209AF4
_02202E64: .word 505 * 8
	thumb_func_end WazaOshieGet

	thumb_func_start ScrCmd_MoveTutorChooseMove
ScrCmd_MoveTutorChooseMove: ; 0x02202E68
	push {r4, r5, r6, r7, lr}
	sub sp, #0x6c
	str r0, [sp, #0x14]
	add r0, #0x80
	ldr r0, [r0]
	str r0, [sp, #0x28]
	bl ov01_021F6B20
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x28]
	mov r1, #0x10
	bl FieldSysGetAttrAddr
	add r4, r0, #0
	ldr r0, [sp, #0x14]
	bl ScriptReadHalfword
	add r1, r0, #0
	ldr r0, [sp, #0x14]
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r5, r0, #0
	ldr r0, [sp, #0x14]
	bl ScriptReadHalfword
	add r1, r0, #0
	ldr r0, [sp, #0x14]
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	ldr r0, [sp, #0x14]
	bl ScriptReadHalfword
	add r1, r0, #0
	ldr r0, [sp, #0x14]
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	ldr r0, [sp, #0x14]
	bl ScriptReadHalfword
	ldr r1, [sp, #0x14]
	str r0, [sp, #0x20]
	str r0, [r1, #0x64]
	add r0, r1, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl SaveArray_PlayerParty_get
	add r1, r5, #0
	bl GetPartyMonByIndex
	add r1, r7, #0
	add r2, sp, #0x38
	bl MonGetTutorCompat
	str r0, [sp, #0x34]
	cmp r0, #7
	bgt _02202EF2
	mov r5, #0
	str r5, [sp, #0x2c]
	b _02202F10
_02202EF2:
	mov r1, #6
	add r5, r6, #0
	mul r5, r1
	cmp r0, r5
	ble _02202F0C
	sub r0, r0, r5
	str r0, [sp, #0x34]
	cmp r0, #6
	ble _02202F06
	str r1, [sp, #0x34]
_02202F06:
	mov r0, #1
	str r0, [sp, #0x2c]
	b _02202F10
_02202F0C:
	str r1, [sp, #0x34]
	mov r5, #0
_02202F10:
	ldr r0, [sp, #0x28]
	ldr r1, [sp, #0x20]
	bl GetVarPointer
	add r6, r0, #0
	ldr r0, [sp, #0x14]
	mov r1, #1
	add r0, #0x80
	ldr r0, [r0]
	bl FieldSysGetAttrAddr
	mov r1, #1
	str r1, [sp]
	str r6, [sp, #4]
	ldr r2, [r4]
	mov r3, #0
	str r2, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x14]
	add r2, r1, #0
	ldr r0, [r0, #0x78]
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x28]
	bl ov01_021EDF78
	ldr r1, [sp, #0x24]
	ldr r2, _02203048 ; =0x000002EE
	str r0, [r1]
	mov r0, #0
	mov r1, #0x1b
	mov r3, #0x20
	bl NewMsgDataFromNarc
	str r0, [sp, #0x1c]
	mov r0, #0x10
	mov r1, #0x20
	bl String_New
	add r7, r0, #0
	ldr r1, [sp, #0x2c]
	ldr r0, [sp, #0x34]
	add r0, r0, r1
	cmp r0, #4
	blt _02202F6C
	mov r0, #1
	b _02202F6E
_02202F6C:
	mov r0, #0
_02202F6E:
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x18]
	mov r0, #0
	str r0, [sp, #0x30]
	ldr r0, [sp, #0x34]
	cmp r0, #0
	ble _02202FE2
	add r0, sp, #0x38
	add r5, r0, r5
_02202F82:
	ldrb r1, [r5]
	ldr r0, [sp, #0x1c]
	lsl r2, r1, #2
	ldr r1, _0220304C ; =sTutorMoves
	ldrh r1, [r1, r2]
	add r2, r7, #0
	bl ReadMsgDataIntoString
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, [r4]
	mov r1, #0
	add r2, r7, #0
	mov r3, #2
	bl BufferString
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldrb r2, [r5]
	ldr r0, [r4]
	mov r1, #1
	lsl r3, r2, #2
	ldr r2, _0220304C ; =sTutorMoves
	add r2, r2, r3
	ldrb r2, [r2, #2]
	mov r3, #2
	bl BufferIntegerAsString
	ldrb r3, [r5]
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x18]
	lsl r6, r3, #2
	ldr r3, _0220304C ; =sTutorMoves
	ldr r0, [r0]
	ldrh r3, [r3, r6]
	mov r2, #0xff
	bl MoveTutorMenu_SetListItem
	ldr r0, [sp, #0x30]
	add r5, r5, #1
	add r1, r0, #1
	ldr r0, [sp, #0x34]
	str r1, [sp, #0x30]
	cmp r1, r0
	blt _02202F82
_02202FE2:
	add r0, r7, #0
	bl String_dtor
	ldr r0, [sp, #0x1c]
	bl DestroyMsgData
	ldr r0, [sp, #0x2c]
	cmp r0, #0
	beq _02203002
	ldr r0, [sp, #0x24]
	ldr r3, _02203050 ; =0x0000FFFD
	ldr r0, [r0]
	mov r1, #2
	mov r2, #0xff
	bl MoveTutorMenu_SetListItem
_02203002:
	ldr r0, [sp, #0x24]
	ldr r3, _02203054 ; =0x0000FFFE
	ldr r0, [r0]
	mov r1, #3
	mov r2, #0xff
	bl MoveTutorMenu_SetListItem
	ldr r1, [sp, #0x14]
	ldr r0, [sp, #0x28]
	ldr r1, [r1, #0x64]
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl GetVarPointer
	add r3, r0, #0
	ldr r0, [sp, #0x28]
	mov r1, #3
	mov r2, #7
	bl ov01_021F6ABC
	ldr r0, [sp, #0x14]
	ldr r1, _02203058 ; =ov01_0220305C
	bl SetupNativeScript
	ldr r1, [sp, #0x14]
	ldr r0, [sp, #0x28]
	ldr r1, [r1, #0x64]
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl GetVarPointer
	mov r0, #1
	add sp, #0x6c
	pop {r4, r5, r6, r7, pc}
	nop
_02203048: .word 0x000002EE
_0220304C: .word sTutorMoves
_02203050: .word 0x0000FFFD
_02203054: .word 0x0000FFFE
_02203058: .word ov01_0220305C
	thumb_func_end ScrCmd_MoveTutorChooseMove

	thumb_func_start ov01_0220305C
ov01_0220305C: ; 0x0220305C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r6, [r0]
	add r0, r6, #0
	bl ov01_021F6B20
	ldr r1, [r5, #0x64]
	add r4, r0, #0
	lsl r1, r1, #0x10
	add r0, r6, #0
	lsr r1, r1, #0x10
	bl GetVarPointer
	ldrh r1, [r0]
	ldr r0, _02203090 ; =0x0000EEEE
	cmp r1, r0
	bne _02203084
	mov r0, #0
	pop {r4, r5, r6, pc}
_02203084:
	ldr r0, [r4]
	bl ov01_021EDF00
	mov r0, #1
	pop {r4, r5, r6, pc}
	nop
_02203090: .word 0x0000EEEE
	thumb_func_end ov01_0220305C

	thumb_func_start ScrCmd_742
ScrCmd_742: ; 0x02203094
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r5, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r7, r0, #0
	mov r0, #0
	add r4, #0x80
	strh r0, [r7]
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl SaveArray_PlayerParty_get
	add r1, r6, #0
	bl GetPartyMonByIndex
	add r6, r0, #0
	mov r0, #0xb
	mov r1, #0x2c
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	add r0, r6, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	str r0, [sp]
	add r0, r6, #0
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	add r1, r0, #0
	ldr r0, [sp]
	add r2, r4, #0
	bl Species_LoadLearnsetTable
	mov r2, #0
	cmp r0, #0
	ble _0220312E
	add r3, r4, #0
_0220311A:
	ldrh r1, [r3]
	cmp r5, r1
	bne _02203126
	mov r0, #1
	strh r0, [r7]
	b _0220312E
_02203126:
	add r2, r2, #1
	add r3, r3, #2
	cmp r2, r0
	blt _0220311A
_0220312E:
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ScrCmd_742

	.rodata

sTutorMoves: ; 0x022093E0
	.short MOVE_DIVE
	.byte 40, 0
	.short MOVE_MUD_SLAP
	.byte 32, 1
	.short MOVE_FURY_CUTTER
	.byte 32, 0
	.short MOVE_ICY_WIND
	.byte 48, 0
	.short MOVE_ROLLOUT
	.byte 32, 1
	.short MOVE_THUNDER_PUNCH
	.byte 64, 0
	.short MOVE_FIRE_PUNCH
	.byte 64, 0
	.short MOVE_SUPERPOWER
	.byte 48, 1
	.short MOVE_ICE_PUNCH
	.byte 64, 0
	.short MOVE_IRON_HEAD
	.byte 40, 1
	.short MOVE_AQUA_TAIL
	.byte 40, 1
	.short MOVE_OMINOUS_WIND
	.byte 48, 0
	.short MOVE_GASTRO_ACID
	.byte 32, 1
	.short MOVE_SNORE
	.byte 32, 2
	.short MOVE_SPITE
	.byte 40, 2
	.short MOVE_AIR_CUTTER
	.byte 48, 0
	.short MOVE_HELPING_HAND
	.byte 40, 2
	.short MOVE_ENDEAVOR
	.byte 64, 1
	.short MOVE_OUTRAGE
	.byte 48, 1
	.short MOVE_ANCIENT_POWER
	.byte 40, 1
	.short MOVE_SYNTHESIS
	.byte 40, 2
	.short MOVE_SIGNAL_BEAM
	.byte 40, 1
	.short MOVE_ZEN_HEADBUTT
	.byte 64, 0
	.short MOVE_VACUUM_WAVE
	.byte 48, 0
	.short MOVE_EARTH_POWER
	.byte 40, 1
	.short MOVE_GUNK_SHOT
	.byte 32, 1
	.short MOVE_TWISTER
	.byte 40, 1
	.short MOVE_SEED_BOMB
	.byte 40, 1
	.short MOVE_IRON_DEFENSE
	.byte 40, 1
	.short MOVE_MAGNET_RISE
	.byte 40, 2
	.short MOVE_LAST_RESORT
	.byte 48, 2
	.short MOVE_BOUNCE
	.byte 32, 1
	.short MOVE_TRICK
	.byte 48, 0
	.short MOVE_HEAT_WAVE
	.byte 48, 1
	.short MOVE_KNOCK_OFF
	.byte 40, 0
	.short MOVE_SUCKER_PUNCH
	.byte 40, 0
	.short MOVE_SWIFT
	.byte 40, 2
	.short MOVE_UPROAR
	.byte 48, 2
	.short MOVE_SUPER_FANG
	.byte 40, 1
	.short MOVE_PAIN_SPLIT
	.byte 64, 1
	.short MOVE_STRING_SHOT
	.byte 32, 2
	.short MOVE_TAILWIND
	.byte 48, 2
	.short MOVE_GRAVITY
	.byte 32, 2
	.short MOVE_WORRY_SEED
	.byte 32, 2
	.short MOVE_MAGIC_COAT
	.byte 32, 2
	.short MOVE_ROLE_PLAY
	.byte 48, 2
	.short MOVE_HEAL_BELL
	.byte 48, 2
	.short MOVE_LOW_KICK
	.byte 32, 1
	.short MOVE_SKY_ATTACK
	.byte 64, 1
	.short MOVE_BLOCK
	.byte 32, 2
	.short MOVE_BUG_BITE
	.byte 32, 0
	.short MOVE_HEADBUTT
	.byte 0, 3

	.data

	.balign 4, 0
ov01_02209AF4: ; 0x02209AF4
	.asciz "fielddata/wazaoshie/waza_oshie.bin"
