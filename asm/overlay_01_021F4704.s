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
	.include "global.inc"

	.text

	thumb_func_start ov01_021F4704
ov01_021F4704: ; 0x021F4704
	push {r4, r5, r6, lr}
	add r6, r2, #0
	add r5, r1, #0
	add r1, r6, #0
	bl _s32_div_f
	add r4, r1, #0
	add r0, r5, #0
	add r1, r6, #0
	bl _s32_div_f
	cmp r4, r1
	bne _021F4722
	mov r0, #1
	pop {r4, r5, r6, pc}
_021F4722:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov01_021F4704

	thumb_func_start ov01_021F4728
ov01_021F4728: ; 0x021F4728
	push {r4, r5, r6, lr}
	add r6, r2, #0
	add r5, r1, #0
	add r1, r6, #0
	bl _s32_div_f
	add r4, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	bl _s32_div_f
	cmp r4, r0
	bne _021F4746
	mov r0, #1
	pop {r4, r5, r6, pc}
_021F4746:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov01_021F4728

	thumb_func_start ov01_021F474C
ov01_021F474C: ; 0x021F474C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x30
	add r4, r1, #0
	mul r4, r0
	add r1, r5, r4
	ldr r0, [r1, #0x14]
	cmp r0, #0
	beq _021F4764
	ldr r0, [r1, #0xc]
	bl ov01_021F6614
_021F4764:
	add r1, r5, r4
	ldr r0, [r1, #0x18]
	cmp r0, #0
	beq _021F4772
	ldr r0, [r1, #0x10]
	bl ov01_021FB354
_021F4772:
	mov r1, #1
	add r0, r5, r4
	str r1, [r0, #0x28]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021F474C

	thumb_func_start ov01_021F477C
ov01_021F477C: ; 0x021F477C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x10]
	cmp r0, #0
	beq _021F478C
	ldr r0, [r4, #8]
	bl ov01_021F6614
_021F478C:
	ldr r0, [r4, #0x14]
	cmp r0, #0
	beq _021F4798
	ldr r0, [r4, #0xc]
	bl ov01_021FB354
_021F4798:
	mov r0, #0
	str r0, [r4, #0x10]
	str r0, [r4, #0x14]
	pop {r4, pc}
	thumb_func_end ov01_021F477C

	thumb_func_start ov01_021F47A0
ov01_021F47A0: ; 0x021F47A0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r2, #0
	asr r2, r0, #4
	lsr r2, r2, #0x1b
	add r2, r0, r2
	asr r7, r2, #5
	asr r2, r1, #4
	lsr r2, r2, #0x1b
	add r2, r1, r2
	asr r6, r2, #5
	ldr r2, [sp, #0x18]
	str r3, [sp]
	ldr r4, [sp, #0x1c]
	bl ov01_021F5A28
	ldr r1, [sp, #0x18]
	bl ov01_021F6328
	add r1, r6, #0
	mul r1, r5
	add r1, r7, r1
	cmp r0, #3
	bhi _021F4886
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021F47DA: ; jump table
	.short _021F47E2 - _021F47DA - 2 ; case 0
	.short _021F4808 - _021F47DA - 2 ; case 1
	.short _021F4830 - _021F47DA - 2 ; case 2
	.short _021F485A - _021F47DA - 2 ; case 3
_021F47E2:
	sub r2, r1, r5
	str r1, [r4, #0xc]
	sub r0, r2, #1
	str r0, [r4]
	str r2, [r4, #4]
	sub r0, r1, #1
	str r0, [r4, #8]
	sub r0, r7, #1
	bpl _021F47FC
	mov r0, #0
	mvn r0, r0
	str r0, [r4]
	str r0, [r4, #8]
_021F47FC:
	sub r0, r6, #1
	bpl _021F488A
	mov r0, #0
	mvn r0, r0
	str r0, [r4, #4]
	pop {r3, r4, r5, r6, r7, pc}
_021F4808:
	str r1, [r4, #8]
	sub r0, r1, r5
	str r0, [r4]
	add r0, r0, #1
	str r0, [r4, #4]
	add r0, r1, #1
	str r0, [r4, #0xc]
	add r0, r7, #1
	cmp r0, r5
	blt _021F4824
	mov r0, #0
	mvn r0, r0
	str r0, [r4, #4]
	str r0, [r4, #0xc]
_021F4824:
	sub r0, r6, #1
	bpl _021F488A
	mov r0, #0
	mvn r0, r0
	str r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_021F4830:
	str r1, [r4, #4]
	sub r0, r1, #1
	add r1, r1, r5
	str r0, [r4]
	sub r0, r1, #1
	str r0, [r4, #8]
	str r1, [r4, #0xc]
	sub r0, r7, #1
	bpl _021F484A
	mov r0, #0
	mvn r0, r0
	str r0, [r4]
	str r0, [r4, #8]
_021F484A:
	ldr r0, [sp]
	add r1, r6, #1
	cmp r1, r0
	ble _021F488A
	mov r0, #0
	mvn r0, r0
	str r0, [r4, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
_021F485A:
	str r1, [r4]
	add r0, r1, #1
	str r0, [r4, #4]
	add r0, r1, r5
	str r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #0xc]
	add r0, r7, #1
	cmp r0, r5
	blt _021F4876
	mov r0, #0
	mvn r0, r0
	str r0, [r4, #4]
	str r0, [r4, #0xc]
_021F4876:
	ldr r0, [sp]
	add r1, r6, #1
	cmp r1, r0
	ble _021F488A
	mov r0, #0
	mvn r0, r0
	str r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_021F4886:
	bl GF_AssertFail
_021F488A:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov01_021F47A0

	thumb_func_start ov01_021F488C
ov01_021F488C: ; 0x021F488C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	str r1, [sp]
	mov r6, #0
_021F4894:
	ldr r1, _021F4964 ; =0x00000A74
	mov r0, #4
	bl AllocFromHeap
	ldr r2, _021F4964 ; =0x00000A74
	mov r1, #0
	add r7, r0, #0
	bl MI_CpuFill8
	lsl r4, r6, #2
	add r0, r5, r4
	add r0, #0x90
	str r7, [r0]
	add r0, r5, r4
	add r0, #0x90
	ldr r2, [r0]
	ldr r0, _021F4968 ; =0x00000864
	mov r1, #0
	str r1, [r2, r0]
	add r2, r5, r4
	add r2, #0x90
	ldr r3, [r2]
	ldr r2, _021F496C ; =0x00000854
	ldr r1, [r5]
	add r0, r6, #0
	add r2, r3, r2
	bl ov01_021FACE4
	add r2, r5, r4
	add r2, #0x90
	ldr r3, [r2]
	ldr r2, _021F4970 ; =0x00000858
	ldr r1, [r5]
	add r0, r6, #0
	add r2, r3, r2
	bl ov01_021FACEC
	add r1, r5, #0
	add r1, #0xbc
	ldr r1, [r1]
	mov r0, #4
	bl ov01_021F3638
	add r1, r5, r4
	add r1, #0x90
	ldr r2, [r1]
	ldr r1, _021F4974 ; =0x00000868
	str r0, [r2, r1]
	add r0, r5, r4
	add r0, #0x90
	ldr r2, [r0]
	mov r1, #0
	mov r0, #0x86
	mvn r1, r1
	lsl r0, r0, #4
	str r1, [r2, r0]
	add r0, r1, #0
	add r1, r5, r4
	add r1, #0x90
	mov r2, #2
	ldr r1, [r1]
	lsl r2, r2, #0xa
	bl MIi_CpuClearFast
	ldr r0, [sp]
	cmp r0, #0
	beq _021F4944
	mov r0, #4
	lsl r1, r0, #8
	bl AllocFromHeap
	add r1, r5, r4
	add r1, #0x90
	ldr r2, [r1]
	mov r1, #0xa7
	lsl r1, r1, #4
	str r0, [r2, r1]
	add r0, r5, r4
	add r0, #0x90
	ldr r1, [r0]
	mov r0, #0xa7
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	mov r2, #1
	mov r1, #0xff
	lsl r2, r2, #0xa
	bl MI_CpuFill8
_021F4944:
	add r1, r5, r4
	add r1, #0x90
	ldr r2, [r1]
	ldr r1, _021F4978 ; =0x0000086C
	mov r0, #0
	add r1, r2, r1
	mov r2, #0x81
	lsl r2, r2, #2
	bl MIi_CpuClear32
	add r0, r6, #1
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	cmp r6, #4
	blo _021F4894
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021F4964: .word 0x00000A74
_021F4968: .word 0x00000864
_021F496C: .word 0x00000854
_021F4970: .word 0x00000858
_021F4974: .word 0x00000868
_021F4978: .word 0x0000086C
	thumb_func_end ov01_021F488C

	thumb_func_start ov01_021F497C
ov01_021F497C: ; 0x021F497C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r6, #0
_021F4982:
	ldr r1, _021F49EC ; =0x00000A74
	mov r0, #4
	bl AllocFromHeap
	ldr r2, _021F49EC ; =0x00000A74
	mov r1, #0
	add r7, r0, #0
	bl MI_CpuFill8
	lsl r4, r6, #2
	add r0, r5, r4
	add r0, #0x90
	str r7, [r0]
	add r0, r5, r4
	add r0, #0x90
	ldr r2, [r0]
	ldr r0, _021F49F0 ; =0x00000864
	mov r1, #0
	str r1, [r2, r0]
	add r2, r5, r4
	add r2, #0x90
	ldr r3, [r2]
	ldr r2, _021F49F4 ; =0x00000854
	ldr r1, [r5]
	add r0, r6, #0
	add r2, r3, r2
	bl ov01_021FACE4
	add r1, r5, #0
	add r1, #0xbc
	ldr r1, [r1]
	mov r0, #4
	bl ov01_021F3638
	add r1, r5, r4
	add r1, #0x90
	ldr r2, [r1]
	ldr r1, _021F49F8 ; =0x00000868
	str r0, [r2, r1]
	add r0, r5, r4
	add r0, #0x90
	ldr r2, [r0]
	mov r1, #0
	mov r0, #0x86
	mvn r1, r1
	lsl r0, r0, #4
	str r1, [r2, r0]
	add r0, r6, #1
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	cmp r6, #4
	blo _021F4982
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021F49EC: .word 0x00000A74
_021F49F0: .word 0x00000864
_021F49F4: .word 0x00000854
_021F49F8: .word 0x00000868
	thumb_func_end ov01_021F497C

	thumb_func_start ov01_021F49FC
ov01_021F49FC: ; 0x021F49FC
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r7, r1, #0
	add r5, r2, #0
	cmp r6, #0
	beq _021F4A22
	mov r0, #4
	mov r1, #0x10
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	add r0, r6, #0
	add r1, r7, #0
	mov r2, #0
	mov r3, #0x10
	str r4, [sp]
	bl NARC_ReadFromMember
	b _021F4A38
_021F4A22:
	bl GF_AssertFail
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0x41
	add r1, r7, #0
	mov r2, #4
	mov r3, #0
	bl AllocAtEndAndReadFromNarcMemberByIdPair
	add r4, r0, #0
_021F4A38:
	ldr r0, [r4]
	str r0, [r5]
	ldr r0, [r4, #4]
	str r0, [r5, #0xc]
	ldr r0, [r4, #8]
	str r0, [r5, #4]
	ldr r0, [r4, #0xc]
	str r0, [r5, #8]
	add r0, r4, #0
	bl FreeToHeap
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov01_021F49FC

	thumb_func_start ov01_021F4A50
ov01_021F4A50: ; 0x021F4A50
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	ldr r0, [sp, #0x20]
	add r5, r1, #0
	add r6, r2, #0
	add r4, r3, #0
	cmp r0, #0
	beq _021F4A72
	ldr r0, _021F4AA4 ; =0x00000808
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021F4A6C
	bl GF_AssertFail
_021F4A6C:
	ldr r0, _021F4AA4 ; =0x00000808
	mov r1, #0
	str r1, [r4, r0]
_021F4A72:
	ldr r0, [sp, #0x18]
	cmp r0, #0
	blt _021F4A7E
	ldr r1, [sp, #0x1c]
	cmp r0, r1
	blt _021F4A82
_021F4A7E:
	ldr r0, _021F4AA8 ; =0x0000FFFF
	pop {r3, r4, r5, r6, r7, pc}
_021F4A82:
	add r1, r6, #0
	bl GetMapModelNo
	add r4, r0, #0
	ldr r0, _021F4AA8 ; =0x0000FFFF
	cmp r4, r0
	beq _021F4A9E
	mov r0, #1
	lsl r0, r0, #8
	ldr r0, [r5, r0]
	add r1, r4, #0
	add r2, r7, #0
	bl ov01_021F49FC
_021F4A9E:
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F4AA4: .word 0x00000808
_021F4AA8: .word 0x0000FFFF
	thumb_func_end ov01_021F4A50

	thumb_func_start ov01_021F4AAC
ov01_021F4AAC: ; 0x021F4AAC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #1
	lsl r0, r0, #8
	add r4, r1, #0
	ldr r2, _021F4AE0 ; =0x0000086C
	ldr r0, [r5, r0]
	mov r1, #4
	add r2, r4, r2
	bl NARC_ReadFile
	ldr r2, _021F4AE0 ; =0x0000086C
	ldr r0, [r4, r2]
	asr r0, r0, #0x10
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	beq _021F4ADC
	mov r0, #1
	lsl r0, r0, #8
	add r2, r2, #4
	ldr r0, [r5, r0]
	add r2, r4, r2
	bl NARC_ReadFile
_021F4ADC:
	pop {r3, r4, r5, pc}
	nop
_021F4AE0: .word 0x0000086C
	thumb_func_end ov01_021F4AAC

	thumb_func_start ov01_021F4AE4
ov01_021F4AE4: ; 0x021F4AE4
	push {r4, r5, r6, lr}
	add r4, r1, #0
	mov r1, #1
	lsl r1, r1, #8
	ldr r0, [r0, r1]
	add r1, r2, #0
	add r2, r4, #0
	bl NARC_ReadFile
	mov r0, #0xa7
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021F4B1A
	mov r0, #0xa7
	mov r1, #1
	mov r5, #0
	add r6, r4, #0
	lsl r0, r0, #4
	lsl r1, r1, #0xa
_021F4B0C:
	ldrh r3, [r6]
	ldr r2, [r4, r0]
	add r6, r6, #2
	strb r3, [r2, r5]
	add r5, r5, #1
	cmp r5, r1
	blt _021F4B0C
_021F4B1A:
	pop {r4, r5, r6, pc}
	thumb_func_end ov01_021F4AE4

	thumb_func_start ov01_021F4B1C
ov01_021F4B1C: ; 0x021F4B1C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r0, #0
	add r0, #0xc4
	ldr r0, [r0]
	add r7, r1, #0
	str r0, [sp, #0xc]
	add r4, r3, #0
	ldr r1, [sp, #0xc]
	add r0, r4, #0
	str r2, [sp, #8]
	bl _s32_div_f
	lsl r0, r1, #0x10
	lsr r6, r0, #0x10
	ldr r1, [sp, #0xc]
	add r0, r4, #0
	bl _s32_div_f
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r6, #1
	blo _021F4B56
	cmp r6, #3
	bhi _021F4B56
	cmp r4, #1
	blo _021F4B56
	cmp r4, #2
	bls _021F4B70
_021F4B56:
	mov r0, #1
	lsl r0, r0, #8
	ldr r1, [sp, #8]
	ldr r2, _021F4BE4 ; =0x00000868
	ldr r0, [r5, r0]
	add r5, #0xf4
	ldr r1, [r1, #0xc]
	ldr r2, [r7, r2]
	ldr r3, [r5]
	bl ov01_021F3744
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
_021F4B70:
	mov r0, #0x41
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl Save_SafariZone_get
	str r0, [sp, #0x14]
	bl sub_0202F620
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	bl SafariZone_GetAreaSet
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x18]
	cmp r0, #0
	bne _021F4BA6
	mov r0, #0x41
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl Sav2_PlayerData_GetProfileAddr
	bl PlayerProfile_GetTrainerGender
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	b _021F4BAC
_021F4BA6:
	ldr r0, [sp, #0x14]
	bl SafariZone_GetLinkLeaderGender
_021F4BAC:
	str r7, [sp]
	str r0, [sp, #4]
	mov r0, #1
	lsl r0, r0, #8
	sub r4, r4, #1
	ldr r0, [r5, r0]
	add r5, #0xf4
	sub r3, r6, #1
	lsl r3, r3, #0x10
	ldr r1, _021F4BE4 ; =0x00000868
	lsl r4, r4, #0x10
	ldr r2, [r5]
	lsr r5, r4, #0x10
	lsl r4, r5, #1
	lsr r3, r3, #0x10
	add r4, r5, r4
	add r4, r3, r4
	mov r3, #0x7a
	add r5, r4, #0
	mul r5, r3
	ldr r3, [sp, #0x10]
	ldr r1, [r7, r1]
	add r3, r3, r5
	bl ov01_021F3834
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_021F4BE4: .word 0x00000868
	thumb_func_end ov01_021F4B1C

	thumb_func_start ov01_021F4BE8
ov01_021F4BE8: ; 0x021F4BE8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	ldr r4, [sp, #0x28]
	add r6, r0, #0
	ldr r0, [r4, #0x10]
	add r5, r1, #0
	add r0, r0, #1
	str r0, [r4, #0x10]
	add r0, r3, #0
	add r7, r2, #0
	bl ov01_021FB9CC
	ldr r1, _021F4C64 ; =0x00000854
	mov r3, #1
	add r2, r5, r1
	str r2, [sp]
	str r0, [sp, #4]
	add r0, r6, #0
	add r0, #0xf8
	ldr r0, [r0]
	add r1, #0x10
	str r0, [sp, #8]
	add r0, r5, r1
	str r0, [sp, #0xc]
	add r0, r4, #0
	add r0, #0x10
	str r0, [sp, #0x10]
	lsl r3, r3, #8
	ldr r0, [r6, r3]
	lsl r3, r3, #3
	ldr r1, [sp, #0x2c]
	ldr r2, [r7, #4]
	add r3, r5, r3
	bl ov01_021F676C
	str r0, [r4, #8]
	ldr r0, [sp, #0x30]
	cmp r0, #0
	beq _021F4C5E
	ldr r0, [r4, #0x14]
	ldr r2, _021F4C68 ; =0x00000858
	add r0, r0, #1
	str r0, [r4, #0x14]
	add r0, r5, r2
	str r0, [sp]
	add r0, r4, #0
	add r0, #0x10
	str r0, [sp, #4]
	mov r0, #1
	lsl r0, r0, #8
	add r2, r2, #4
	add r3, r4, #0
	ldr r0, [r6, r0]
	ldr r1, [r7, #8]
	ldr r2, [r5, r2]
	add r3, #0x14
	bl ov01_021FB308
	str r0, [r4, #0xc]
_021F4C5E:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_021F4C64: .word 0x00000854
_021F4C68: .word 0x00000858
	thumb_func_end ov01_021F4BE8

	thumb_func_start ov01_021F4C6C
ov01_021F4C6C: ; 0x021F4C6C
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	add r0, r3, #0
	add r4, r1, #0
	add r6, r2, #0
	bl ov01_021FB9CC
	mov r2, #1
	str r0, [sp]
	lsl r2, r2, #8
	ldr r3, _021F4D04 ; =0x00000854
	ldr r0, [r5, r2]
	lsl r2, r2, #3
	ldr r1, [r6, #4]
	add r2, r4, r2
	add r3, r4, r3
	bl ov01_021F67B4
	ldr r1, [sp, #0x20]
	cmp r1, #0
	beq _021F4C9C
	bl ov01_021EA3B0
_021F4C9C:
	ldr r3, _021F4D08 ; =0x00000864
	mov r0, #1
	ldr r2, [sp, #0x1c]
	str r0, [r4, r3]
	sub r1, r3, #4
	str r2, [r4, r1]
	ldr r1, [sp, #0x24]
	cmp r1, #0
	beq _021F4CFE
	add r2, r3, #0
	add r0, #0xff
	sub r2, #8
	sub r3, #0xc
	ldr r0, [r5, r0]
	ldr r1, [r6, #8]
	ldr r2, [r4, r2]
	ldr r3, [r4, r3]
	bl ov01_021FB270
	mov r0, #0x42
	lsl r0, r0, #2
	ldr r3, [r5, r0]
	cmp r3, #0
	beq _021F4CD8
	ldr r2, _021F4D0C ; =0x00000868
	add r0, r0, #4
	ldr r0, [r5, r0]
	ldr r1, [sp, #0x1c]
	ldr r2, [r4, r2]
	blx r3
_021F4CD8:
	add r0, r5, #0
	add r0, #0xf8
	ldr r0, [r0]
	bl ov01_02204698
	cmp r0, #0
	beq _021F4CFE
	ldr r0, [sp, #0x18]
	bl sub_02054E20
	cmp r0, #0
	bne _021F4CFE
	add r5, #0xf8
	mov r1, #2
	lsl r1, r1, #0xa
	ldr r0, [r5]
	add r1, r4, r1
	bl ov01_02204678
_021F4CFE:
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_021F4D04: .word 0x00000854
_021F4D08: .word 0x00000864
_021F4D0C: .word 0x00000868
	thumb_func_end ov01_021F4C6C

	thumb_func_start ov01_021F4D10
ov01_021F4D10: ; 0x021F4D10
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	ldr r5, [sp, #0x40]
	lsl r4, r0, #2
	add r0, r5, r4
	ldr r0, [r0, #0x18]
	ldr r6, [sp, #0x3c]
	str r0, [sp]
	ldr r0, [sp, #0x38]
	str r1, [sp, #0xc]
	mul r0, r3
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r3, [r5, r4]
	add r0, sp, #0x10
	add r1, r6, #0
	bl ov01_021F4A50
	add r7, r0, #0
	ldr r0, _021F4D80 ; =0x0000FFFF
	cmp r7, r0
	beq _021F4D7C
	ldr r1, [r5, r4]
	add r0, r6, #0
	bl ov01_021F4AAC
	ldr r1, [r5, r4]
	ldr r2, [sp, #0x10]
	add r0, r6, #0
	bl ov01_021F4AE4
	mov r0, #1
	lsl r0, r0, #8
	ldr r3, [r5, r4]
	ldr r2, _021F4D84 ; =0x00000868
	ldr r0, [r6, r0]
	ldr r2, [r3, r2]
	add r3, r6, #0
	add r3, #0xf4
	ldr r1, [sp, #0x1c]
	ldr r3, [r3]
	bl ov01_021F3744
	str r5, [sp]
	str r7, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r1, [r5, r4]
	ldr r3, [sp, #0xc]
	add r0, r6, #0
	add r2, sp, #0x10
	bl ov01_021F4BE8
_021F4D7C:
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021F4D80: .word 0x0000FFFF
_021F4D84: .word 0x00000868
	thumb_func_end ov01_021F4D10

	thumb_func_start ov01_021F4D88
ov01_021F4D88: ; 0x021F4D88
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x1fc
	sub sp, #0x1fc
	sub sp, #0x1fc
	sub sp, #0x1fc
	sub sp, #0x30
	str r1, [sp, #0xc]
	ldr r1, _021F4E10 ; =0x00000828
	lsl r6, r0, #2
	add r1, sp
	ldr r4, [r1, #0x18]
	ldr r5, [r1, #0x14]
	add r0, r4, r6
	ldr r0, [r0, #0x18]
	str r0, [sp]
	ldr r0, [r1, #0x10]
	add r1, r5, #0
	mul r0, r3
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	ldr r3, [r4, r6]
	add r0, sp, #0x10
	bl ov01_021F4A50
	add r7, r0, #0
	ldr r0, _021F4E14 ; =0x0000FFFF
	cmp r7, r0
	beq _021F4E04
	ldr r1, [r4, r6]
	add r0, r5, #0
	bl ov01_021F4AAC
	mov r1, #1
	lsl r1, r1, #8
	ldr r0, [r5, r1]
	lsl r1, r1, #3
	add r2, sp, #0x20
	bl NARC_ReadFile
	mov r0, #1
	lsl r0, r0, #8
	ldr r3, [r4, r6]
	ldr r2, _021F4E18 ; =0x00000868
	ldr r0, [r5, r0]
	ldr r2, [r3, r2]
	add r3, r5, #0
	add r3, #0xf4
	ldr r1, [sp, #0x1c]
	ldr r3, [r3]
	bl ov01_021F3744
	str r4, [sp]
	str r7, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	ldr r1, [r4, r6]
	ldr r3, [sp, #0xc]
	add r0, r5, #0
	add r2, sp, #0x10
	bl ov01_021F4BE8
_021F4E04:
	add sp, #0x1fc
	add sp, #0x1fc
	add sp, #0x1fc
	add sp, #0x1fc
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021F4E10: .word 0x00000828
_021F4E14: .word 0x0000FFFF
_021F4E18: .word 0x00000868
	thumb_func_end ov01_021F4D88

	thumb_func_start ov01_021F4E1C
ov01_021F4E1C: ; 0x021F4E1C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	ldr r5, [sp, #0x40]
	lsl r4, r0, #2
	add r7, r5, #0
	add r7, #0x18
	ldr r0, [r7, r4]
	ldr r6, [sp, #0x3c]
	str r0, [sp]
	ldr r0, [sp, #0x38]
	str r1, [sp, #0xc]
	mul r0, r3
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r3, [r5, r4]
	add r0, sp, #0x14
	add r1, r6, #0
	bl ov01_021F4A50
	ldr r1, _021F4E84 ; =0x0000FFFF
	str r0, [sp, #0x10]
	cmp r0, r1
	beq _021F4E80
	ldr r1, [r5, r4]
	add r0, r6, #0
	bl ov01_021F4AAC
	ldr r1, [r5, r4]
	ldr r2, [sp, #0x14]
	add r0, r6, #0
	bl ov01_021F4AE4
	ldr r1, [r5, r4]
	ldr r3, [r7, r4]
	add r0, r6, #0
	add r2, sp, #0x14
	bl ov01_021F4B1C
	ldr r0, [sp, #0x10]
	str r5, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r1, [r5, r4]
	ldr r3, [sp, #0xc]
	add r0, r6, #0
	add r2, sp, #0x14
	bl ov01_021F4BE8
_021F4E80:
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021F4E84: .word 0x0000FFFF
	thumb_func_end ov01_021F4E1C

	thumb_func_start ov01_021F4E88
ov01_021F4E88: ; 0x021F4E88
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r7, r0, #0
	lsl r5, r1, #2
	ldr r6, [sp, #0x4c]
	ldr r1, [sp, #0x40]
	ldr r0, [sp, #0x44]
	add r4, r6, #0
	mul r0, r1
	str r7, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	str r2, [sp, #0x10]
	add r4, #0x90
	add r2, r3, #0
	ldr r3, [r4, r5]
	add r0, sp, #0x18
	add r1, r6, #0
	bl ov01_021F4A50
	ldr r1, _021F4F04 ; =0x0000FFFF
	str r0, [sp, #0x14]
	cmp r0, r1
	beq _021F4EFE
	ldr r1, [r4, r5]
	add r0, r6, #0
	bl ov01_021F4AAC
	ldr r1, [r4, r5]
	ldr r2, [sp, #0x18]
	add r0, r6, #0
	bl ov01_021F4AE4
	mov r0, #1
	lsl r0, r0, #8
	ldr r3, [r4, r5]
	ldr r2, _021F4F08 ; =0x00000868
	ldr r0, [r6, r0]
	ldr r2, [r3, r2]
	add r3, r6, #0
	add r3, #0xf4
	ldr r1, [sp, #0x24]
	ldr r3, [r3]
	bl ov01_021F3744
	ldr r0, [sp, #0x14]
	ldr r3, [sp, #0x10]
	str r0, [sp]
	ldr r0, [sp, #0x48]
	str r7, [sp, #4]
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	ldr r1, [r4, r5]
	add r0, r6, #0
	add r2, sp, #0x18
	bl ov01_021F4C6C
_021F4EFE:
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F4F04: .word 0x0000FFFF
_021F4F08: .word 0x00000868
	thumb_func_end ov01_021F4E88

	thumb_func_start ov01_021F4F0C
ov01_021F4F0C: ; 0x021F4F0C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x1fc
	sub sp, #0x1fc
	sub sp, #0x1fc
	sub sp, #0x1fc
	sub sp, #0x38
	add r7, r0, #0
	ldr r0, _021F4FA4 ; =0x00000830
	str r2, [sp, #0x10]
	add r0, sp
	ldr r5, [r0, #0x1c]
	lsl r4, r1, #2
	ldr r1, [r0, #0x10]
	ldr r0, [r0, #0x14]
	add r6, r5, #0
	mul r0, r1
	str r7, [sp]
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	add r6, #0x90
	add r2, r3, #0
	ldr r3, [r6, r4]
	add r0, sp, #0x18
	add r1, r5, #0
	bl ov01_021F4A50
	ldr r1, _021F4FA8 ; =0x0000FFFF
	str r0, [sp, #0x14]
	cmp r0, r1
	beq _021F4F96
	ldr r1, [r6, r4]
	add r0, r5, #0
	bl ov01_021F4AAC
	mov r1, #1
	lsl r1, r1, #8
	ldr r0, [r5, r1]
	lsl r1, r1, #3
	add r2, sp, #0x28
	bl NARC_ReadFile
	mov r0, #1
	lsl r0, r0, #8
	ldr r3, [r6, r4]
	ldr r2, _021F4FAC ; =0x00000868
	ldr r0, [r5, r0]
	ldr r2, [r3, r2]
	add r3, r5, #0
	add r3, #0xf4
	ldr r1, [sp, #0x24]
	ldr r3, [r3]
	bl ov01_021F3744
	ldr r0, [sp, #0x14]
	ldr r3, [sp, #0x10]
	str r0, [sp]
	ldr r0, _021F4FA4 ; =0x00000830
	str r7, [sp, #4]
	add r0, sp
	ldr r0, [r0, #0x18]
	add r2, sp, #0x18
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r1, [r6, r4]
	add r0, r5, #0
	bl ov01_021F4C6C
_021F4F96:
	add sp, #0x1fc
	add sp, #0x1fc
	add sp, #0x1fc
	add sp, #0x1fc
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F4FA4: .word 0x00000830
_021F4FA8: .word 0x0000FFFF
_021F4FAC: .word 0x00000868
	thumb_func_end ov01_021F4F0C

	thumb_func_start ov01_021F4FB0
ov01_021F4FB0: ; 0x021F4FB0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r7, r0, #0
	lsl r5, r1, #2
	ldr r6, [sp, #0x4c]
	ldr r1, [sp, #0x40]
	ldr r0, [sp, #0x44]
	add r4, r6, #0
	mul r0, r1
	str r7, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	str r2, [sp, #0x10]
	add r4, #0x90
	add r2, r3, #0
	ldr r3, [r4, r5]
	add r0, sp, #0x18
	add r1, r6, #0
	bl ov01_021F4A50
	ldr r1, _021F5020 ; =0x0000FFFF
	str r0, [sp, #0x14]
	cmp r0, r1
	beq _021F501A
	ldr r1, [r4, r5]
	add r0, r6, #0
	bl ov01_021F4AAC
	ldr r1, [r4, r5]
	ldr r2, [sp, #0x18]
	add r0, r6, #0
	bl ov01_021F4AE4
	ldr r1, [r4, r5]
	add r0, r6, #0
	add r2, sp, #0x18
	add r3, r7, #0
	bl ov01_021F4B1C
	ldr r0, [sp, #0x14]
	ldr r3, [sp, #0x10]
	str r0, [sp]
	ldr r0, [sp, #0x48]
	str r7, [sp, #4]
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	ldr r1, [r4, r5]
	add r0, r6, #0
	add r2, sp, #0x18
	bl ov01_021F4C6C
_021F501A:
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F5020: .word 0x0000FFFF
	thumb_func_end ov01_021F4FB0

	thumb_func_start ov01_021F5024
ov01_021F5024: ; 0x021F5024
	ldr r1, [r0]
	cmp r1, #0
	bne _021F5034
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _021F5034
	mov r0, #1
	bx lr
_021F5034:
	mov r0, #0
	bx lr
	thumb_func_end ov01_021F5024

	thumb_func_start ov01_021F5038
ov01_021F5038: ; 0x021F5038
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r4, r0, #0
	str r3, [sp]
	add r0, sp, #0x10
	add r7, r1, #0
	ldrb r1, [r0, #0x14]
	mov r0, #0x30
	str r2, [sp, #8]
	add r5, r1, #0
	mul r5, r0
	add r0, r4, #0
	str r0, [sp, #4]
	add r0, #0x2c
	str r0, [sp, #4]
	ldr r0, [r0, r5]
	cmp r0, #0
	beq _021F5060
	bl GF_AssertFail
_021F5060:
	ldr r0, [sp, #4]
	mov r1, #1
	str r1, [r0, r5]
	add r6, r4, r5
	add r0, sp, #0x10
	add r1, r6, #0
	ldrb r2, [r0, #0x18]
	add r1, #0x30
	add r5, r4, #0
	strb r2, [r1]
	add r2, r6, #0
	ldr r1, [sp, #8]
	str r7, [r6, #0x1c]
	str r1, [r6, #0x20]
	ldr r1, [sp]
	add r2, #0x24
	strb r1, [r2]
	ldrb r0, [r0, #0x10]
	add r1, r6, #0
	add r1, #0x25
	strb r0, [r1]
	ldr r1, [sp]
	add r5, #0x90
	lsl r3, r1, #2
	ldr r1, [r5, r3]
	lsl r2, r0, #2
	str r1, [r6, #4]
	ldr r0, [r5, r2]
	add r1, r6, #0
	str r0, [r6, #8]
	add r1, #0x26
	mov r0, #0
	strb r0, [r1]
	str r0, [r6, #0x28]
	add r0, r4, #0
	add r0, #0xa0
	ldrb r0, [r0]
	cmp r0, #0
	bne _021F50B6
	add r1, r4, #0
	add r1, #0xb4
	mov r0, #0
	str r0, [r1]
_021F50B6:
	mov r1, #0x86
	ldr r0, [r5, r3]
	lsl r1, r1, #4
	str r7, [r0, r1]
	ldr r2, [r5, r2]
	ldr r0, [sp, #8]
	str r0, [r2, r1]
	add r0, r4, #0
	add r0, #0xa0
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0xa0
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0xa1
	ldrb r0, [r0]
	add r4, #0xa1
	add r0, r0, #1
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x1f
	sub r1, r1, r2
	mov r0, #0x1f
	ror r1, r0
	add r0, r2, r1
	strb r0, [r4]
	mov r0, #1
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov01_021F5038

	thumb_func_start ov01_021F50F0
ov01_021F50F0: ; 0x021F50F0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	add r0, #0xa2
	ldrb r1, [r0]
	mov r0, #0x30
	add r4, r5, #0
	add r2, r5, #4
	mul r0, r1
	add r4, #0xd0
	add r6, r2, r0
	ldr r0, [r4, #0x20]
	cmp r0, #1
	bne _021F513A
	ldr r2, [r4, #0xc]
	cmp r2, #0
	beq _021F513A
	ldr r0, [r4, #0x18]
	cmp r0, #0
	beq _021F5198
	ldr r0, [r4, #0x14]
	ldr r1, [r0]
	ldr r0, [r4, #0x10]
	ldr r0, [r0]
	cmp r1, r0
	ble _021F5128
	bl GF_AssertFail
_021F5128:
	ldr r0, [r4, #0x10]
	ldr r1, [r0]
	ldr r0, [r4, #0x14]
	ldr r0, [r0]
	sub r1, r1, r0
	mov r0, #1
	lsl r0, r0, #0x10
	cmp r1, r0
	bge _021F513C
_021F513A:
	b _021F5276
_021F513C:
	ldr r1, [r4, #0xc]
	add r2, sp, #0x10
	ldr r0, [r1]
	ldr r1, [r1, #8]
	add r3, sp, #0xc
	bl ov01_021F61DC
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0xc]
	add r2, r5, #0
	bl ov01_021F5F64
	ldr r2, [r4, #0xc]
	add r3, r4, #0
	ldmia r2!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r2]
	str r0, [r3]
	ldr r0, [r4, #8]
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x11
	sub r1, r1, r2
	mov r0, #0x11
	ror r1, r0
	add r0, r2, r1
	beq _021F517A
	mov r0, #1
	bl sub_02039AD8
	cmp r0, #0
	bne _021F5258
_021F517A:
	ldr r0, [r4, #8]
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x11
	sub r1, r1, r2
	mov r0, #0x11
	ror r1, r0
	add r0, r2, r1
	beq _021F518E
	bl GF_AssertFail
_021F518E:
	mov r0, #0
	str r0, [r4, #0x18]
	str r0, [r4, #0x10]
	str r0, [r4, #0x14]
	b _021F5276
_021F5198:
	ldr r7, [r2]
	ldr r3, [r4]
	cmp r3, r7
	beq _021F51AE
	ldr r1, [r4, #8]
	ldr r0, [r2, #8]
	cmp r1, r0
	beq _021F51AE
	bl GF_AssertFail
	b _021F5276
_021F51AE:
	cmp r3, r7
	bne _021F51BA
	ldr r1, [r4, #8]
	ldr r0, [r2, #8]
	cmp r1, r0
	beq _021F5276
_021F51BA:
	mov r3, #1
	str r3, [r4, #0x18]
	ldr r2, [r4, #0xc]
	ldr r0, [r4]
	ldr r1, [r2]
	cmp r0, r1
	beq _021F520E
	cmp r0, r1
	ble _021F51D8
	str r4, [r4, #0x10]
	ldr r0, [r4, #0xc]
	str r0, [r4, #0x14]
	mov r0, #3
	strb r0, [r4, #0x1c]
	b _021F51DE
_021F51D8:
	str r2, [r4, #0x10]
	str r4, [r4, #0x14]
	strb r3, [r4, #0x1c]
_021F51DE:
	ldr r0, [r4]
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x11
	sub r1, r1, r2
	mov r0, #0x11
	ror r1, r0
	add r0, r2, r1
	beq _021F51F8
	mov r0, #1
	bl sub_02039AD8
	cmp r0, #0
	bne _021F5258
_021F51F8:
	ldr r0, [r4]
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x11
	sub r1, r1, r2
	mov r0, #0x11
	ror r1, r0
	add r0, r2, r1
	beq _021F526E
	bl GF_AssertFail
	b _021F526E
_021F520E:
	add r1, r5, #0
	add r1, #0xdc
	add r0, r5, #0
	ldr r1, [r1]
	add r0, #0xd8
	ldr r0, [r0]
	ldr r1, [r1, #8]
	cmp r0, r1
	ble _021F5230
	add r0, r4, #0
	add r0, #8
	str r0, [r4, #0x10]
	ldr r0, [r4, #0xc]
	add r0, #8
	str r0, [r4, #0x14]
	mov r0, #4
	b _021F523C
_021F5230:
	add r2, #8
	add r0, r4, #0
	str r2, [r4, #0x10]
	add r0, #8
	str r0, [r4, #0x14]
	mov r0, #2
_021F523C:
	strb r0, [r4, #0x1c]
	ldr r0, [r4, #8]
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x11
	sub r1, r1, r2
	mov r0, #0x11
	ror r1, r0
	add r0, r2, r1
	beq _021F525A
	mov r0, #1
	bl sub_02039AD8
	cmp r0, #0
	beq _021F525A
_021F5258:
	b _021F54A4
_021F525A:
	ldr r0, [r4, #8]
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x11
	sub r1, r1, r2
	mov r0, #0x11
	ror r1, r0
	add r0, r2, r1
	beq _021F526E
	bl GF_AssertFail
_021F526E:
	ldrb r0, [r4, #0x1c]
	add r1, r5, #0
	bl ov01_021F613C
_021F5276:
	add r0, r5, #0
	add r0, #0xb4
	ldr r0, [r0]
	cmp r0, #3
	bls _021F5282
	b _021F53FA
_021F5282:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021F528E: ; jump table
	.short _021F5296 - _021F528E - 2 ; case 0
	.short _021F52EC - _021F528E - 2 ; case 1
	.short _021F53FA - _021F528E - 2 ; case 2
	.short _021F53E6 - _021F528E - 2 ; case 3
_021F5296:
	add r0, r6, #0
	add r0, #0x22
	ldrb r0, [r0]
	add r1, r6, r0
	add r1, #0x20
	ldrb r1, [r1]
	lsl r1, r1, #2
	add r1, r5, r1
	add r1, #0x80
	ldr r1, [r1]
	cmp r1, #1
	beq _021F52D6
	add r1, r5, #0
	add r1, #0xc8
	ldr r1, [r1]
	add r4, r5, #0
	str r1, [sp]
	str r5, [sp, #4]
	str r6, [sp, #8]
	add r4, #0xfc
	add r1, r5, #0
	add r2, r5, #0
	add r3, r5, #0
	ldr r4, [r4]
	add r1, #0xb8
	add r2, #0xc0
	add r3, #0xc4
	ldr r1, [r1]
	ldr r2, [r2]
	ldr r3, [r3]
	ldr r4, [r4, #4]
	blx r4
_021F52D6:
	add r0, r6, #0
	add r0, #0x22
	ldrb r0, [r0]
	add r6, #0x22
	mov r1, #1
	add r0, r0, #1
	strb r0, [r6]
	add r0, r5, #0
	add r0, #0xb4
	str r1, [r0]
	b _021F53FA
_021F52EC:
	add r0, r6, #0
	add r0, #0x22
	ldrb r0, [r0]
	sub r0, r0, #1
	add r0, r6, r0
	add r0, #0x20
	ldrb r0, [r0]
	lsl r0, r0, #2
	add r0, r5, r0
	add r0, #0x80
	ldr r0, [r0]
	cmp r0, #1
	bne _021F5324
	add r0, r6, #0
	bl ov01_021F477C
	add r1, r6, #0
	add r1, #0x22
	ldrb r1, [r1]
	mov r0, #0
	sub r1, r1, #1
	add r1, r6, r1
	add r1, #0x20
	ldrb r1, [r1]
	lsl r1, r1, #2
	add r1, r5, r1
	add r1, #0x80
	str r0, [r1]
_021F5324:
	add r0, r6, #0
	add r0, #0x22
	ldrb r0, [r0]
	cmp r0, #2
	bhi _021F53FA
	add r0, r6, #0
	add r0, #0x10
	bl ov01_021F5024
	cmp r0, #1
	bne _021F53FA
	add r0, r6, #0
	add r0, #0x22
	ldrb r0, [r0]
	cmp r0, #2
	blo _021F534A
	mov r0, #1
	str r0, [r6, #0x24]
	b _021F5352
_021F534A:
	add r0, r5, #0
	mov r1, #0
	add r0, #0xb4
	str r1, [r0]
_021F5352:
	add r0, r6, #0
	add r0, #0x22
	ldrb r0, [r0]
	sub r0, r0, #1
	lsl r0, r0, #2
	ldr r2, [r6, r0]
	ldr r0, _021F54A8 ; =0x00000864
	ldr r1, [r2, r0]
	cmp r1, #1
	bne _021F53A8
	sub r0, #0x10
	ldr r0, [r2, r0]
	bl NNS_G3dGetMdlSet
	cmp r0, #0
	beq _021F5392
	add r2, r0, #0
	add r2, #8
	beq _021F5386
	ldrb r1, [r0, #9]
	cmp r1, #0
	bls _021F5386
	ldrh r1, [r0, #0xe]
	add r1, r2, r1
	add r1, r1, #4
	b _021F5388
_021F5386:
	mov r1, #0
_021F5388:
	cmp r1, #0
	beq _021F5392
	ldr r1, [r1]
	add r4, r0, r1
	b _021F5394
_021F5392:
	mov r4, #0
_021F5394:
	add r0, r5, #0
	add r0, #0xb8
	ldr r0, [r0]
	bl ov01_021FBA00
	cmp r0, #1
	bne _021F53A8
	add r0, r4, #0
	bl ov01_021EA3B0
_021F53A8:
	mov r0, #0x42
	lsl r0, r0, #2
	ldr r3, [r5, r0]
	cmp r3, #0
	beq _021F53FA
	add r0, r6, #0
	add r0, #0x22
	ldrb r0, [r0]
	mov r2, #0x86
	lsl r2, r2, #4
	sub r0, r0, #1
	lsl r0, r0, #2
	ldr r4, [r6, r0]
	ldr r1, [r4, r2]
	cmp r1, #0
	blt _021F53FA
	add r0, r5, #0
	add r6, r5, #0
	add r0, #0xc4
	add r6, #0xc8
	ldr r0, [r0]
	ldr r6, [r6]
	mul r6, r0
	cmp r1, r6
	bge _021F53FA
	lsr r0, r2, #3
	add r2, #8
	ldr r0, [r5, r0]
	ldr r2, [r4, r2]
	blx r3
	b _021F53FA
_021F53E6:
	add r6, #0x10
	add r0, r6, #0
	bl ov01_021F5024
	cmp r0, #1
	bne _021F53FA
	add r0, r5, #0
	mov r1, #0
	add r0, #0xa0
	strb r1, [r0]
_021F53FA:
	add r0, r5, #0
	add r0, #0xa0
	ldrb r0, [r0]
	cmp r0, #0
	bne _021F541C
	add r0, r5, #0
	mov r1, #0
	add r0, #0xa2
	strb r1, [r0]
	add r0, r5, #0
	add r0, #0xa1
	strb r1, [r0]
	mov r0, #2
	add r5, #0xb4
	add sp, #0x14
	str r0, [r5]
	pop {r4, r5, r6, r7, pc}
_021F541C:
	add r0, r5, #0
	bl ov01_021F5D10
	cmp r0, #1
	bne _021F54A4
	add r0, r5, #0
	add r0, #0xa2
	ldrb r1, [r0]
	mov r0, #0x30
	mov r2, #0
	mul r0, r1
	add r0, r5, r0
	str r2, [r0, #0x2c]
	add r0, r5, #0
	bl ov01_021F5D20
	add r0, r5, #0
	add r0, #0xa0
	ldrb r0, [r0]
	sub r1, r0, #1
	add r0, r5, #0
	add r0, #0xa0
	strb r1, [r0]
	add r0, r5, #0
	add r0, #0xa2
	ldrb r0, [r0]
	add r0, r0, #1
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x1f
	sub r1, r1, r2
	mov r0, #0x1f
	ror r1, r0
	add r0, r5, #0
	add r1, r2, r1
	add r0, #0xa2
	strb r1, [r0]
	add r0, r5, #0
	add r0, #0xa0
	ldrb r0, [r0]
	cmp r0, #0
	beq _021F5472
	mov r1, #0
	b _021F5482
_021F5472:
	add r0, r5, #0
	mov r1, #0
	add r0, #0xa2
	strb r1, [r0]
	add r0, r5, #0
	add r0, #0xa1
	strb r1, [r0]
	mov r1, #2
_021F5482:
	add r0, r5, #0
	add r0, #0xb4
	str r1, [r0]
	ldr r0, [r5, #0x6c]
	cmp r0, #1
	bne _021F54A4
	mov r0, #0
	str r0, [r5, #0x6c]
	add r0, r5, #0
	add r0, #0x70
	ldrb r0, [r0]
	add r1, r5, #0
	bl ov01_021F5D38
	add r0, r5, #0
	bl ov01_021F5CB4
_021F54A4:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021F54A8: .word 0x00000864
	thumb_func_end ov01_021F50F0

	thumb_func_start ov01_021F54AC
ov01_021F54AC: ; 0x021F54AC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	ldr r4, [sp, #0x34]
	str r2, [sp, #0x10]
	add r7, r0, #0
	ldr r0, [r4, #0x6c]
	add r5, r3, #0
	str r1, [sp, #0xc]
	ldr r6, [sp, #0x30]
	cmp r0, #1
	bne _021F54C6
	bl GF_AssertFail
_021F54C6:
	add r0, r6, #0
	add r1, r4, #0
	add r2, sp, #0x14
	bl ov01_021F5BBC
	cmp r0, #1
	bne _021F5544
	add r1, sp, #0x14
	ldrb r1, [r1]
	add r0, r4, #0
	bl ov01_021F474C
	add r0, r4, #0
	add r0, #0xa0
	ldrb r0, [r0]
	cmp r0, #2
	blo _021F5528
	mov r0, #1
	str r0, [r4, #0x6c]
	ldr r0, [sp, #0xc]
	str r7, [r4, #0x74]
	str r0, [r4, #0x78]
	add r1, r4, #0
	ldr r0, [sp, #0x10]
	add r1, #0x7c
	strb r0, [r1]
	add r0, r4, #0
	add r0, #0x7d
	strb r5, [r0]
	ldr r0, [sp, #0x10]
	add r2, r4, #0
	add r2, #0x90
	lsl r1, r0, #2
	ldr r0, [r2, r1]
	str r0, [r4, #0x64]
	lsl r0, r5, #2
	ldr r3, [r2, r0]
	str r3, [r4, #0x68]
	add r4, #0x70
	strb r6, [r4]
	ldr r3, [r2, r1]
	mov r1, #0x86
	lsl r1, r1, #4
	str r7, [r3, r1]
	ldr r2, [r2, r0]
	ldr r0, [sp, #0xc]
	add sp, #0x18
	str r0, [r2, r1]
	pop {r3, r4, r5, r6, r7, pc}
_021F5528:
	add r0, r4, #0
	str r5, [sp]
	add r0, #0xa1
	ldrb r0, [r0]
	ldr r2, [sp, #0xc]
	add r1, r7, #0
	str r0, [sp, #4]
	str r6, [sp, #8]
	ldr r3, [sp, #0x10]
	add r0, r4, #0
	bl ov01_021F5038
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
_021F5544:
	add r0, r4, #0
	str r5, [sp]
	add r0, #0xa1
	ldrb r0, [r0]
	ldr r2, [sp, #0xc]
	add r1, r7, #0
	str r0, [sp, #4]
	str r6, [sp, #8]
	ldr r3, [sp, #0x10]
	add r0, r4, #0
	bl ov01_021F5038
	cmp r0, #1
	beq _021F5564
	bl GF_AssertFail
_021F5564:
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov01_021F54AC

	thumb_func_start ov01_021F5568
ov01_021F5568: ; 0x021F5568
	push {r4, r5, r6, lr}
	add r6, r1, #0
	add r4, r6, #0
	lsl r5, r0, #2
	add r4, #0x90
	ldr r1, [r4, r5]
	ldr r0, _021F55E4 ; =0x00000864
	mov r2, #0
	str r2, [r1, r0]
	ldr r1, [r4, r5]
	sub r0, #8
	ldr r0, [r1, r0]
	bl ov01_021FB2F4
	ldr r1, [r4, r5]
	ldr r0, _021F55E8 ; =0x00000868
	ldr r0, [r1, r0]
	bl ov01_021F36AC
	mov r0, #0
	mov r2, #0x86
	ldr r1, [r4, r5]
	mvn r0, r0
	lsl r2, r2, #4
	str r0, [r1, r2]
	ldr r1, [r4, r5]
	sub r2, #0x60
	bl MIi_CpuClearFast
	ldr r2, [r4, r5]
	ldr r1, _021F55EC ; =0x0000086C
	mov r0, #0
	add r1, r2, r1
	mov r2, #0x81
	lsl r2, r2, #2
	bl MIi_CpuClear32
	add r0, r6, r5
	mov r1, #1
	add r0, #0x80
	str r1, [r0]
	add r0, r6, #0
	add r0, #0xf8
	ldr r0, [r0]
	bl ov01_02204698
	cmp r0, #0
	beq _021F55D8
	add r6, #0xf8
	mov r1, #2
	ldr r2, [r4, r5]
	lsl r1, r1, #0xa
	ldr r0, [r6]
	add r1, r2, r1
	bl ov01_02204688
_021F55D8:
	ldr r1, [r4, r5]
	ldr r0, _021F55F0 ; =0x00000808
	mov r2, #0
	str r2, [r1, r0]
	pop {r4, r5, r6, pc}
	nop
_021F55E4: .word 0x00000864
_021F55E8: .word 0x00000868
_021F55EC: .word 0x0000086C
_021F55F0: .word 0x00000808
	thumb_func_end ov01_021F5568

	thumb_func_start ov01_021F55F4
ov01_021F55F4: ; 0x021F55F4
	push {r3, r4, r5, r6, r7, lr}
	ldr r4, [sp, #0x18]
	add r5, r1, #0
	add r1, r4, #0
	add r6, r0, #0
	add r7, r2, #0
	str r3, [sp]
	bl ov01_021F5568
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_021F5568
	add r4, #0x90
	lsl r1, r6, #2
	lsl r5, r5, #2
	lsl r2, r7, #2
	ldr r0, [r4, r1]
	ldr r3, [r4, r5]
	ldr r6, [r4, r2]
	str r6, [r4, r1]
	ldr r1, [sp]
	lsl r6, r1, #2
	ldr r1, [r4, r6]
	str r1, [r4, r5]
	str r0, [r4, r2]
	str r3, [r4, r6]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov01_021F55F4

	thumb_func_start ov01_021F562C
ov01_021F562C: ; 0x021F562C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	str r1, [sp, #8]
	add r7, r0, #0
	ldr r0, [sp, #8]
	add r6, r2, #0
	cmp r0, #4
	bls _021F563E
	b _021F5952
_021F563E:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021F564A: ; jump table
	.short _021F5952 - _021F564A - 2 ; case 0
	.short _021F57C4 - _021F564A - 2 ; case 1
	.short _021F58A0 - _021F564A - 2 ; case 2
	.short _021F56F2 - _021F564A - 2 ; case 3
	.short _021F5654 - _021F564A - 2 ; case 4
_021F5654:
	mov r0, #2
	mov r1, #3
	mov r2, #0
	mov r3, #1
	str r6, [sp]
	bl ov01_021F55F4
	add r0, r6, #0
	add r0, #0xad
	ldrb r0, [r0]
	cmp r0, #2
	bne _021F569E
	add r0, r6, #0
	add r0, #0xc4
	ldr r2, [r0]
	mov r0, #1
	sub r5, r7, r2
	str r0, [sp, #0x10]
	mov r0, #0
	sub r4, r5, #1
	str r0, [sp, #0xc]
	cmp r5, #0
	bge _021F5688
	sub r5, r0, #1
	add r4, r5, #0
	b _021F56D4
_021F5688:
	cmp r4, #0
	blt _021F5698
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_021F4728
	cmp r0, #0
	bne _021F56D4
_021F5698:
	mov r4, #0
	mvn r4, r4
	b _021F56D4
_021F569E:
	cmp r0, #3
	bne _021F56D0
	add r0, r6, #0
	add r0, #0xc4
	ldr r2, [r0]
	mov r0, #0
	sub r5, r7, r2
	str r0, [sp, #0x10]
	mov r0, #1
	add r4, r5, #1
	str r0, [sp, #0xc]
	cmp r5, #0
	bge _021F56BE
	sub r5, r0, #2
	add r4, r5, #0
	b _021F56D4
_021F56BE:
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_021F4728
	cmp r0, #0
	bne _021F56D4
	mov r4, #0
	mvn r4, r4
	b _021F56D4
_021F56D0:
	bl GF_AssertFail
_021F56D4:
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0xc]
	ldr r0, [sp, #8]
	lsl r2, r2, #0x18
	str r0, [sp]
	lsl r3, r3, #0x18
	add r0, r5, #0
	add r1, r4, #0
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	str r6, [sp, #4]
	bl ov01_021F54AC
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
_021F56F2:
	mov r0, #1
	mov r1, #3
	mov r2, #0
	mov r3, #2
	str r6, [sp]
	bl ov01_021F55F4
	add r0, r6, #0
	add r0, #0xad
	ldrb r0, [r0]
	cmp r0, #1
	bne _021F5750
	add r0, r6, #0
	add r0, #0xc4
	ldr r2, [r0]
	sub r5, r7, #1
	sub r0, r7, r2
	sub r4, r0, #1
	mov r0, #2
	str r0, [sp, #0x10]
	mov r0, #0
	str r0, [sp, #0xc]
	cmp r5, #0
	blt _021F572E
	add r0, r5, #0
	add r1, r7, #0
	bl ov01_021F4728
	cmp r0, #0
	bne _021F5734
_021F572E:
	mov r5, #0
	mvn r5, r5
	add r4, r5, #0
_021F5734:
	cmp r4, #0
	blt _021F574A
	add r2, r6, #0
	add r2, #0xc4
	ldr r2, [r2]
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_021F4704
	cmp r0, #0
	bne _021F57A6
_021F574A:
	mov r4, #0
	mvn r4, r4
	b _021F57A6
_021F5750:
	cmp r0, #3
	bne _021F57A2
	add r0, r6, #0
	add r0, #0xc4
	ldr r2, [r0]
	sub r5, r7, #1
	add r0, r7, r2
	sub r4, r0, #1
	mov r0, #0
	str r0, [sp, #0x10]
	mov r0, #2
	str r0, [sp, #0xc]
	cmp r5, #0
	blt _021F5778
	add r0, r5, #0
	add r1, r7, #0
	bl ov01_021F4728
	cmp r0, #0
	bne _021F577E
_021F5778:
	mov r5, #0
	mvn r5, r5
	add r4, r5, #0
_021F577E:
	add r0, r6, #0
	add r0, #0xc4
	ldr r2, [r0]
	add r0, r6, #0
	add r0, #0xc8
	ldr r0, [r0]
	mul r0, r2
	cmp r0, r4
	ble _021F579C
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_021F4704
	cmp r0, #0
	bne _021F57A6
_021F579C:
	mov r4, #0
	mvn r4, r4
	b _021F57A6
_021F57A2:
	bl GF_AssertFail
_021F57A6:
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0xc]
	ldr r0, [sp, #8]
	lsl r2, r2, #0x18
	str r0, [sp]
	lsl r3, r3, #0x18
	add r0, r5, #0
	add r1, r4, #0
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	str r6, [sp, #4]
	bl ov01_021F54AC
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
_021F57C4:
	mov r0, #0
	mov r1, #2
	mov r2, #1
	mov r3, #3
	str r6, [sp]
	bl ov01_021F55F4
	add r0, r6, #0
	add r0, #0xad
	ldrb r0, [r0]
	cmp r0, #0
	bne _021F5832
	add r0, r6, #0
	add r0, #0xc4
	ldr r2, [r0]
	add r5, r7, #1
	sub r0, r7, r2
	add r4, r0, #1
	mov r0, #3
	str r0, [sp, #0x10]
	mov r0, #1
	str r0, [sp, #0xc]
	add r0, r6, #0
	add r0, #0xc8
	ldr r0, [r0]
	mul r0, r2
	cmp r0, r5
	ble _021F5808
	add r0, r5, #0
	add r1, r7, #0
	bl ov01_021F4728
	cmp r0, #0
	bne _021F580E
_021F5808:
	mov r5, #0
	mvn r5, r5
	add r4, r5, #0
_021F580E:
	add r0, r6, #0
	add r0, #0xc4
	ldr r2, [r0]
	add r0, r6, #0
	add r0, #0xc8
	ldr r0, [r0]
	mul r0, r2
	cmp r0, r4
	ble _021F582C
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_021F4704
	cmp r0, #0
	bne _021F5882
_021F582C:
	mov r4, #0
	mvn r4, r4
	b _021F5882
_021F5832:
	cmp r0, #2
	bne _021F5882
	add r0, r6, #0
	add r0, #0xc4
	ldr r2, [r0]
	add r5, r7, #1
	add r0, r7, r2
	add r4, r0, #1
	mov r0, #1
	str r0, [sp, #0x10]
	mov r0, #3
	str r0, [sp, #0xc]
	add r0, r6, #0
	add r0, #0xc8
	ldr r0, [r0]
	mul r0, r2
	cmp r0, r5
	ble _021F5862
	add r0, r5, #0
	add r1, r7, #0
	bl ov01_021F4728
	cmp r0, #0
	bne _021F5868
_021F5862:
	mov r5, #0
	mvn r5, r5
	add r4, r5, #0
_021F5868:
	cmp r4, #0
	blt _021F587E
	add r2, r6, #0
	add r2, #0xc4
	ldr r2, [r2]
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_021F4704
	cmp r0, #0
	bne _021F5882
_021F587E:
	mov r4, #0
	mvn r4, r4
_021F5882:
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0xc]
	ldr r0, [sp, #8]
	lsl r2, r2, #0x18
	str r0, [sp]
	lsl r3, r3, #0x18
	add r0, r5, #0
	add r1, r4, #0
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	str r6, [sp, #4]
	bl ov01_021F54AC
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
_021F58A0:
	mov r0, #0
	mov r1, #1
	mov r2, #2
	mov r3, #3
	str r6, [sp]
	bl ov01_021F55F4
	add r0, r6, #0
	add r0, #0xad
	ldrb r0, [r0]
	cmp r0, #0
	bne _021F58F0
	add r0, r6, #0
	add r0, #0xc4
	ldr r2, [r0]
	mov r0, #3
	str r0, [sp, #0x10]
	mov r0, #2
	str r0, [sp, #0xc]
	add r0, r6, #0
	add r0, #0xc8
	ldr r0, [r0]
	add r5, r7, r2
	mul r0, r2
	sub r4, r5, #1
	cmp r0, r5
	bgt _021F58DE
	ldr r0, [sp, #0xc]
	sub r5, r0, #3
	add r4, r5, #0
	b _021F5934
_021F58DE:
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_021F4728
	cmp r0, #0
	bne _021F5934
	mov r4, #0
	mvn r4, r4
	b _021F5934
_021F58F0:
	cmp r0, #1
	bne _021F5930
	add r0, r6, #0
	add r0, #0xc4
	ldr r2, [r0]
	mov r0, #2
	str r0, [sp, #0x10]
	mov r0, #3
	str r0, [sp, #0xc]
	add r0, r6, #0
	add r0, #0xc8
	ldr r0, [r0]
	add r5, r7, r2
	mul r0, r2
	add r4, r5, #1
	cmp r0, r5
	bgt _021F591A
	ldr r0, [sp, #0xc]
	sub r5, r0, #4
	add r4, r5, #0
	b _021F5934
_021F591A:
	cmp r0, r4
	ble _021F592A
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_021F4728
	cmp r0, #0
	bne _021F5934
_021F592A:
	mov r4, #0
	mvn r4, r4
	b _021F5934
_021F5930:
	bl GF_AssertFail
_021F5934:
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0xc]
	ldr r0, [sp, #8]
	lsl r2, r2, #0x18
	str r0, [sp]
	lsl r3, r3, #0x18
	add r0, r5, #0
	add r1, r4, #0
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	str r6, [sp, #4]
	bl ov01_021F54AC
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
_021F5952:
	bl GF_AssertFail
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_021F562C

	thumb_func_start ov01_021F595C
ov01_021F595C: ; 0x021F595C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x44
	add r5, r1, #0
	add r4, r5, #0
	lsl r6, r0, #2
	mov r0, #0x86
	add r3, sp, #0x38
	mov r1, #0
	str r1, [r3]
	str r1, [r3, #4]
	str r2, [sp, #4]
	add r2, r5, #0
	add r4, #0x90
	str r1, [r3, #8]
	add r2, #0xc0
	ldr r1, [r4, r6]
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	add r1, r5, #0
	add r1, #0xc4
	ldr r1, [r1]
	ldr r2, [r2]
	bl ov01_021F5FB8
	ldr r1, [r4, r6]
	ldr r0, _021F59F4 ; =0x00000864
	ldr r0, [r1, r0]
	cmp r0, #1
	bne _021F59C6
	ldr r3, _021F59F8 ; =ov01_02206BD8
	add r2, sp, #0x2c
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	ldr r3, _021F59FC ; =ov01_02206BE4
	str r0, [r2]
	add r2, sp, #8
	mov r7, #4
_021F59A8:
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	sub r7, r7, #1
	bne _021F59A8
	ldr r0, [r3]
	add r3, sp, #0x2c
	str r0, [r2]
	mov r0, #2
	ldr r1, [r4, r6]
	lsl r0, r0, #0xa
	add r0, r1, r0
	add r1, sp, #0x38
	add r2, sp, #8
	bl Draw3dModel
_021F59C6:
	ldr r4, [r4, r6]
	ldr r0, _021F59F4 ; =0x00000864
	ldr r0, [r4, r0]
	cmp r0, #1
	bne _021F59EE
	add r0, r5, #0
	add r0, #0xb8
	ldr r0, [r0]
	bl ov01_021FBA00
	add r2, r0, #0
	ldr r0, _021F5A00 ; =0x00000868
	add r5, #0xb8
	ldr r0, [r4, r0]
	ldr r3, [sp, #4]
	str r0, [sp]
	ldr r1, [r5]
	add r0, sp, #0x38
	bl ov01_021F3A3C
_021F59EE:
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
	nop
_021F59F4: .word 0x00000864
_021F59F8: .word ov01_02206BD8
_021F59FC: .word ov01_02206BE4
_021F5A00: .word 0x00000868
	thumb_func_end ov01_021F595C

	thumb_func_start ov01_021F5A04
ov01_021F5A04: ; 0x021F5A04
	push {r3, r4, r5, r6, r7, lr}
	add r7, r2, #0
	add r5, r1, #0
	add r6, r0, #0
	add r1, r7, #0
	bl _u32_div_f
	add r4, r1, #0
	add r0, r6, #0
	add r1, r7, #0
	bl _u32_div_f
	lsr r0, r0, #5
	add r1, r0, #0
	lsr r2, r4, #5
	mul r1, r5
	add r0, r2, r1
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov01_021F5A04

	thumb_func_start ov01_021F5A28
ov01_021F5A28: ; 0x021F5A28
	mul r2, r1
	add r0, r0, r2
	bx lr
	.balign 4, 0
	thumb_func_end ov01_021F5A28

	thumb_func_start ov01_021F5A30
ov01_021F5A30: ; 0x021F5A30
	push {r3, r4, r5, r6, r7, lr}
	add r7, r2, #0
	add r5, r1, #0
	add r6, r0, #0
	add r1, r7, #0
	bl _u32_div_f
	add r4, r1, #0
	add r0, r6, #0
	add r1, r7, #0
	bl _u32_div_f
	lsr r0, r0, #5
	add r1, r0, #0
	lsr r2, r4, #5
	mul r1, r5
	add r0, r2, r1
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov01_021F5A30

	thumb_func_start ov01_021F5A54
ov01_021F5A54: ; 0x021F5A54
	push {r3, lr}
	cmp r0, #0
	bne _021F5A5E
	mov r0, #3
	pop {r3, pc}
_021F5A5E:
	cmp r0, #1
	bne _021F5A66
	mov r0, #2
	pop {r3, pc}
_021F5A66:
	cmp r0, #2
	bne _021F5A6E
	mov r0, #1
	pop {r3, pc}
_021F5A6E:
	cmp r0, #3
	bne _021F5A76
	mov r0, #0
	pop {r3, pc}
_021F5A76:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov01_021F5A54

	thumb_func_start ov01_021F5A80
ov01_021F5A80: ; 0x021F5A80
	push {r3, r4, r5, lr}
	add r5, r2, #0
	add r4, r3, #0
	cmp r0, #4
	bhi _021F5AE0
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021F5A96: ; jump table
	.short _021F5AE0 - _021F5A96 - 2 ; case 0
	.short _021F5AA0 - _021F5A96 - 2 ; case 1
	.short _021F5AB6 - _021F5A96 - 2 ; case 2
	.short _021F5AC4 - _021F5A96 - 2 ; case 3
	.short _021F5AD8 - _021F5A96 - 2 ; case 4
_021F5AA0:
	add r0, r4, #0
	add r1, r5, #0
	bl _s32_div_f
	add r0, r1, #1
	cmp r0, r5
	blt _021F5AB2
	add r0, r4, #0
	pop {r3, r4, r5, pc}
_021F5AB2:
	add r0, r4, #1
	pop {r3, r4, r5, pc}
_021F5AB6:
	lsl r1, r1, #5
	add r0, r4, r5
	mul r1, r5
	cmp r0, r1
	blt _021F5AE6
	add r0, r4, #0
	pop {r3, r4, r5, pc}
_021F5AC4:
	add r0, r4, #0
	add r1, r5, #0
	bl _s32_div_f
	sub r0, r1, #1
	bpl _021F5AD4
	add r0, r4, #0
	pop {r3, r4, r5, pc}
_021F5AD4:
	sub r0, r4, #1
	pop {r3, r4, r5, pc}
_021F5AD8:
	sub r0, r4, r5
	bpl _021F5AE6
	add r0, r4, #0
	pop {r3, r4, r5, pc}
_021F5AE0:
	bl GF_AssertFail
	mov r0, #0
_021F5AE6:
	pop {r3, r4, r5, pc}
	thumb_func_end ov01_021F5A80

	thumb_func_start ov01_021F5AE8
ov01_021F5AE8: ; 0x021F5AE8
	cmp r0, #4
	bhi _021F5B20
	add r2, r0, r0
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_021F5AF8: ; jump table
	.short _021F5B20 - _021F5AF8 - 2 ; case 0
	.short _021F5B1A - _021F5AF8 - 2 ; case 1
	.short _021F5B0A - _021F5AF8 - 2 ; case 2
	.short _021F5B12 - _021F5AF8 - 2 ; case 3
	.short _021F5B02 - _021F5AF8 - 2 ; case 4
_021F5B02:
	sub r0, r1, #2
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bx lr
_021F5B0A:
	add r0, r1, #2
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bx lr
_021F5B12:
	sub r0, r1, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bx lr
_021F5B1A:
	add r0, r1, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
_021F5B20:
	bx lr
	.balign 4, 0
	thumb_func_end ov01_021F5AE8

	thumb_func_start ov01_021F5B24
ov01_021F5B24: ; 0x021F5B24
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r4, r2, #0
	bl ov01_021F5AE8
	cmp r5, r0
	bge _021F5B56
	sub r0, r0, r5
	cmp r0, #1
	bne _021F5B42
	ldrb r0, [r4]
	sub r0, r0, #1
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	b _021F5B82
_021F5B42:
	cmp r0, #2
	bne _021F5B50
	ldrb r0, [r4]
	sub r0, r0, #2
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	b _021F5B82
_021F5B50:
	bl GF_AssertFail
	b _021F5B82
_021F5B56:
	cmp r5, r0
	ble _021F5B7E
	sub r0, r5, r0
	cmp r0, #1
	bne _021F5B6A
	ldrb r0, [r4]
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	b _021F5B82
_021F5B6A:
	cmp r0, #2
	bne _021F5B78
	ldrb r0, [r4]
	add r0, r0, #2
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	b _021F5B82
_021F5B78:
	bl GF_AssertFail
	b _021F5B82
_021F5B7E:
	bl GF_AssertFail
_021F5B82:
	strb r6, [r4]
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov01_021F5B24

	thumb_func_start ov01_021F5B88
ov01_021F5B88: ; 0x021F5B88
	push {r3, lr}
	cmp r0, #4
	bhi _021F5BB4
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021F5B9A: ; jump table
	.short _021F5BB4 - _021F5B9A - 2 ; case 0
	.short _021F5BAC - _021F5B9A - 2 ; case 1
	.short _021F5BA8 - _021F5B9A - 2 ; case 2
	.short _021F5BB0 - _021F5B9A - 2 ; case 3
	.short _021F5BA4 - _021F5B9A - 2 ; case 4
_021F5BA4:
	mov r0, #2
	pop {r3, pc}
_021F5BA8:
	mov r0, #4
	pop {r3, pc}
_021F5BAC:
	mov r0, #3
	pop {r3, pc}
_021F5BB0:
	mov r0, #1
	pop {r3, pc}
_021F5BB4:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ov01_021F5B88

	thumb_func_start ov01_021F5BBC
ov01_021F5BBC: ; 0x021F5BBC
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r5, r1, #0
	add r7, r2, #0
	mov r4, #0
_021F5BC6:
	ldr r0, [r5, #0x2c]
	cmp r0, #1
	bne _021F5BE2
	add r0, r6, #0
	bl ov01_021F5B88
	add r1, r5, #0
	add r1, #0x30
	ldrb r1, [r1]
	cmp r1, r0
	bne _021F5BE2
	strb r4, [r7]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021F5BE2:
	add r4, r4, #1
	add r5, #0x30
	cmp r4, #2
	blt _021F5BC6
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_021F5BBC

	thumb_func_start ov01_021F5BF0
ov01_021F5BF0: ; 0x021F5BF0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, #0xa1
	ldrb r1, [r0]
	mov r0, #0x30
	add r4, r5, #0
	mul r0, r1
	add r0, r5, r0
	ldr r0, [r0, #0x2c]
	add r4, #0x64
	cmp r0, #0
	beq _021F5C0C
	bl GF_AssertFail
_021F5C0C:
	add r1, r5, #0
	add r1, #0xa1
	ldrb r2, [r1]
	mov r1, #0x30
	mov r0, #1
	add r3, r2, #0
	mul r3, r1
	add r2, r5, r3
	add r3, r5, #0
	str r0, [r2, #0x2c]
	add r3, #0xa1
	ldrb r3, [r3]
	ldrb r2, [r4, #0xc]
	add r6, r3, #0
	mul r6, r1
	add r3, r5, r6
	add r3, #0x30
	strb r2, [r3]
	add r3, r5, #0
	add r3, #0xa1
	ldrb r3, [r3]
	ldr r2, [r4, #0x10]
	add r6, r3, #0
	mul r6, r1
	add r3, r5, r6
	str r2, [r3, #0x1c]
	add r3, r5, #0
	add r3, #0xa1
	ldrb r3, [r3]
	ldr r2, [r4, #0x14]
	add r6, r3, #0
	mul r6, r1
	add r3, r5, r6
	str r2, [r3, #0x20]
	add r3, r5, #0
	add r3, #0xa1
	ldrb r3, [r3]
	ldrb r2, [r4, #0x18]
	add r6, r3, #0
	mul r6, r1
	add r3, r5, r6
	add r3, #0x24
	strb r2, [r3]
	add r3, r5, #0
	add r3, #0xa1
	ldrb r3, [r3]
	ldrb r2, [r4, #0x19]
	add r6, r3, #0
	mul r6, r1
	add r3, r5, r6
	add r3, #0x25
	strb r2, [r3]
	add r3, r5, #0
	add r3, #0xa1
	ldrb r3, [r3]
	ldr r2, [r4]
	add r6, r3, #0
	mul r6, r1
	add r3, r5, r6
	str r2, [r3, #4]
	add r2, r5, #0
	add r2, #0xa1
	ldrb r2, [r2]
	ldr r4, [r4, #4]
	add r3, r2, #0
	mul r3, r1
	add r2, r5, r3
	add r3, r5, #0
	str r4, [r2, #8]
	add r3, #0xa1
	ldrb r3, [r3]
	mov r2, #0
	add r4, r3, #0
	mul r4, r1
	add r3, r5, r4
	add r3, #0x26
	strb r2, [r3]
	add r3, r5, #0
	add r3, #0xa1
	ldrb r3, [r3]
	mul r1, r3
	add r1, r5, r1
	str r2, [r1, #0x28]
	pop {r4, r5, r6, pc}
	thumb_func_end ov01_021F5BF0

	thumb_func_start ov01_021F5CB4
ov01_021F5CB4: ; 0x021F5CB4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0xa0
	ldrb r0, [r0]
	add r4, r5, #0
	add r4, #0x64
	cmp r0, #2
	blo _021F5CC8
	bl GF_AssertFail
_021F5CC8:
	add r0, r5, #0
	bl ov01_021F5BF0
	cmp r0, #1
	beq _021F5CD6
	bl GF_AssertFail
_021F5CD6:
	mov r0, #0x86
	ldr r2, [r4, #0x10]
	ldr r1, [r4]
	lsl r0, r0, #4
	str r2, [r1, r0]
	ldr r2, [r4, #0x14]
	ldr r1, [r4, #4]
	str r2, [r1, r0]
	add r0, r5, #0
	add r0, #0xa0
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r5, #0
	add r0, #0xa0
	strb r1, [r0]
	add r0, r5, #0
	add r0, #0xa1
	ldrb r0, [r0]
	add r5, #0xa1
	add r0, r0, #1
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x1f
	sub r1, r1, r2
	mov r0, #0x1f
	ror r1, r0
	add r0, r2, r1
	strb r0, [r5]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021F5CB4

	thumb_func_start ov01_021F5D10
ov01_021F5D10: ; 0x021F5D10
	add r1, r0, #0
	add r1, #0xa2
	ldrb r2, [r1]
	mov r1, #0x30
	mul r1, r2
	add r0, r0, r1
	ldr r0, [r0, #0x28]
	bx lr
	thumb_func_end ov01_021F5D10

	thumb_func_start ov01_021F5D20
ov01_021F5D20: ; 0x021F5D20
	mov r3, #0
	add r2, r3, #0
_021F5D24:
	lsl r1, r3, #2
	add r1, r0, r1
	add r1, #0x80
	str r2, [r1]
	add r1, r3, #1
	lsl r1, r1, #0x18
	lsr r3, r1, #0x18
	cmp r3, #4
	blo _021F5D24
	bx lr
	thumb_func_end ov01_021F5D20

	thumb_func_start ov01_021F5D38
ov01_021F5D38: ; 0x021F5D38
	cmp r0, #4
	bhi _021F5D88
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021F5D48: ; jump table
	.short _021F5D88 - _021F5D48 - 2 ; case 0
	.short _021F5D60 - _021F5D48 - 2 ; case 1
	.short _021F5D6E - _021F5D48 - 2 ; case 2
	.short _021F5D7C - _021F5D48 - 2 ; case 3
	.short _021F5D52 - _021F5D48 - 2 ; case 4
_021F5D52:
	add r0, r1, #0
	mov r2, #1
	add r0, #0x88
	str r2, [r0]
	add r1, #0x8c
	str r2, [r1]
	bx lr
_021F5D60:
	add r0, r1, #0
	mov r2, #1
	add r0, #0x80
	str r2, [r0]
	add r1, #0x88
	str r2, [r1]
	bx lr
_021F5D6E:
	add r0, r1, #0
	mov r2, #1
	add r0, #0x80
	str r2, [r0]
	add r1, #0x84
	str r2, [r1]
	bx lr
_021F5D7C:
	add r0, r1, #0
	mov r2, #1
	add r0, #0x84
	str r2, [r0]
	add r1, #0x8c
	str r2, [r1]
_021F5D88:
	bx lr
	.balign 4, 0
	thumb_func_end ov01_021F5D38

	thumb_func_start ov01_021F5D8C
ov01_021F5D8C: ; 0x021F5D8C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r6, r1, #0
	add r5, r0, #0
	add r4, r3, #0
	mov r1, #0
	add r7, r2, #0
	bl ov01_021F488C
	add r2, r5, #0
	add r3, r5, #0
	str r4, [sp]
	add r0, sp, #0x10
	str r0, [sp, #4]
	add r2, #0xc4
	add r3, #0xc8
	ldr r2, [r2]
	ldr r3, [r3]
	add r0, r6, #0
	add r1, r7, #0
	bl ov01_021F47A0
	mov r4, #0
	add r7, sp, #0x10
_021F5DBC:
	lsl r6, r4, #2
	bl ov01_021FB254
	add r1, r5, r6
	add r1, #0x90
	ldr r2, [r1]
	ldr r1, _021F5E1C ; =0x0000085C
	str r0, [r2, r1]
	add r0, r5, r6
	add r0, #0x90
	ldr r1, [r0]
	ldr r0, _021F5E1C ; =0x0000085C
	ldr r0, [r1, r0]
	bl ov01_021FB360
	add r0, r5, #0
	add r0, #0xb8
	ldr r0, [r0]
	bl ov01_021FBA00
	add r1, r5, #0
	add r1, #0xc4
	ldr r1, [r1]
	add r2, r5, #0
	str r1, [sp]
	add r1, r5, #0
	add r1, #0xc8
	ldr r1, [r1]
	add r3, r5, #0
	str r1, [sp, #4]
	str r0, [sp, #8]
	str r5, [sp, #0xc]
	add r2, #0xb8
	add r3, #0xc0
	ldr r0, [r7, r6]
	ldr r2, [r2]
	ldr r3, [r3]
	add r1, r4, #0
	bl ov01_021F4E88
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #4
	blo _021F5DBC
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F5E1C: .word 0x0000085C
	thumb_func_end ov01_021F5D8C

	thumb_func_start ov01_021F5E20
ov01_021F5E20: ; 0x021F5E20
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r5, r0, #0
	add r4, r3, #0
	add r6, r1, #0
	add r7, r2, #0
	bl ov01_021F497C
	add r2, r5, #0
	add r3, r5, #0
	str r4, [sp]
	add r0, sp, #0x10
	str r0, [sp, #4]
	add r2, #0xc4
	add r3, #0xc8
	ldr r2, [r2]
	ldr r3, [r3]
	add r0, r6, #0
	add r1, r7, #0
	bl ov01_021F47A0
	mov r4, #0
	add r7, r4, #0
_021F5E4E:
	lsl r6, r4, #2
	add r0, r5, r6
	add r0, #0x90
	ldr r1, [r0]
	ldr r0, _021F5E9C ; =0x0000085C
	str r7, [r1, r0]
	add r0, r5, #0
	add r0, #0xb8
	ldr r0, [r0]
	bl ov01_021FBA00
	add r1, r5, #0
	add r1, #0xc4
	ldr r1, [r1]
	add r2, r5, #0
	str r1, [sp]
	add r1, r5, #0
	add r1, #0xc8
	ldr r1, [r1]
	add r3, r5, #0
	str r1, [sp, #4]
	str r0, [sp, #8]
	str r5, [sp, #0xc]
	add r0, sp, #0x10
	add r2, #0xb8
	add r3, #0xc0
	ldr r0, [r0, r6]
	ldr r2, [r2]
	ldr r3, [r3]
	add r1, r4, #0
	bl ov01_021F4F0C
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #4
	blo _021F5E4E
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021F5E9C: .word 0x0000085C
	thumb_func_end ov01_021F5E20

	thumb_func_start ov01_021F5EA0
ov01_021F5EA0: ; 0x021F5EA0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r6, r1, #0
	add r5, r0, #0
	add r4, r3, #0
	mov r1, #1
	add r7, r2, #0
	bl ov01_021F488C
	add r2, r5, #0
	add r3, r5, #0
	str r4, [sp]
	add r0, sp, #0x10
	str r0, [sp, #4]
	add r2, #0xc4
	add r3, #0xc8
	ldr r2, [r2]
	ldr r3, [r3]
	add r0, r6, #0
	add r1, r7, #0
	bl ov01_021F47A0
	mov r4, #0
	add r7, sp, #0x10
_021F5ED0:
	lsl r6, r4, #2
	bl ov01_021FB254
	add r1, r5, r6
	add r1, #0x90
	ldr r2, [r1]
	ldr r1, _021F5F30 ; =0x0000085C
	str r0, [r2, r1]
	add r0, r5, r6
	add r0, #0x90
	ldr r1, [r0]
	ldr r0, _021F5F30 ; =0x0000085C
	ldr r0, [r1, r0]
	bl ov01_021FB360
	add r0, r5, #0
	add r0, #0xb8
	ldr r0, [r0]
	bl ov01_021FBA00
	add r1, r5, #0
	add r1, #0xc4
	ldr r1, [r1]
	add r2, r5, #0
	str r1, [sp]
	add r1, r5, #0
	add r1, #0xc8
	ldr r1, [r1]
	add r3, r5, #0
	str r1, [sp, #4]
	str r0, [sp, #8]
	str r5, [sp, #0xc]
	add r2, #0xb8
	add r3, #0xc0
	ldr r0, [r7, r6]
	ldr r2, [r2]
	ldr r3, [r3]
	add r1, r4, #0
	bl ov01_021F4FB0
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #4
	blo _021F5ED0
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F5F30: .word 0x0000085C
	thumb_func_end ov01_021F5EA0

	thumb_func_start ov01_021F5F34
ov01_021F5F34: ; 0x021F5F34
	push {r4, lr}
	add r1, r0, #0
	mov r3, #0
	add r1, #0xa2
	strb r3, [r1]
	add r1, r0, #0
	add r1, #0xa1
	strb r3, [r1]
	add r1, r0, #0
	add r1, #0xa0
	strb r3, [r1]
	add r4, r0, #0
	add r2, r3, #0
	mov r1, #1
_021F5F50:
	str r2, [r4, #0x2c]
	str r1, [r4, #0x28]
	add r3, r3, #1
	add r4, #0x30
	cmp r3, #2
	blt _021F5F50
	bl ov01_021F5D20
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021F5F34

	thumb_func_start ov01_021F5F64
ov01_021F5F64: ; 0x021F5F64
	push {r4, lr}
	add r4, r2, #0
	add r2, #0xcc
	ldr r2, [r2]
	bl ov01_021F5A28
	add r1, r4, #0
	add r1, #0xa8
	str r0, [r1]
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0xa8
	add r1, #0xcc
	ldr r0, [r0]
	ldr r1, [r1]
	bl ov01_021F6328
	add r1, r4, #0
	add r1, #0xad
	strb r0, [r1]
	add r0, r4, #0
	add r0, #0xad
	ldrb r0, [r0]
	bl ov01_021F5A54
	add r1, r4, #0
	add r1, #0xac
	strb r0, [r1]
	add r0, r4, #0
	add r1, r4, #0
	add r2, r4, #0
	add r0, #0xa8
	add r1, #0xc4
	add r2, #0xcc
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r2]
	bl ov01_021F5A30
	add r4, #0xa4
	str r0, [r4]
	pop {r4, pc}
	thumb_func_end ov01_021F5F64

	thumb_func_start ov01_021F5FB8
ov01_021F5FB8: ; 0x021F5FB8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r7, r2, #0
	mov r2, #1
	add r5, r3, #0
	lsl r2, r2, #0x14
	str r2, [r5]
	str r2, [r5, #8]
	mov r2, #0
	add r4, r0, #0
	mvn r2, r2
	str r1, [sp, #4]
	cmp r4, r2
	beq _021F601A
	bl _s32_div_f
	lsl r0, r1, #0x10
	lsr r6, r0, #0x10
	ldr r1, [sp, #4]
	add r0, r4, #0
	bl _s32_div_f
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	add r0, r7, #0
	bl MapMatrix_GetWidth
	str r0, [sp, #8]
	add r0, r7, #0
	bl MapMatrix_GetMatrixId
	add r1, r0, #0
	ldr r0, [sp, #8]
	add r2, r6, #0
	str r0, [sp]
	add r0, r7, #0
	add r3, r4, #0
	bl MapMatrix_GetMapAltitude
	lsl r0, r0, #0xf
	str r0, [r5, #4]
	ldr r1, [r5]
	lsl r0, r6, #0x15
	add r0, r1, r0
	str r0, [r5]
	ldr r1, [r5, #8]
	lsl r0, r4, #0x15
	add r0, r1, r0
	str r0, [r5, #8]
_021F601A:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_021F5FB8

	thumb_func_start ov01_021F6020
ov01_021F6020: ; 0x021F6020
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r7, r1, #0
	mov r1, #0x11
	add r5, r0, #0
	mov r0, #4
	lsl r1, r1, #4
	str r2, [sp]
	str r3, [sp, #4]
	bl AllocFromHeap
	mov r2, #0x11
	mov r1, #0
	lsl r2, r2, #4
	add r4, r0, #0
	bl MI_CpuFill8
	ldr r0, [sp, #0x24]
	cmp r0, #0
	bne _021F6054
	add r0, r4, #0
	ldr r1, _021F610C ; =ov01_02206BC0
	add r0, #0xfc
	str r1, [r0]
	mov r6, #1
	b _021F6078
_021F6054:
	cmp r0, #1
	bne _021F6064
	add r0, r4, #0
	ldr r1, _021F6110 ; =ov01_02206BD0
	add r0, #0xfc
	str r1, [r0]
	mov r6, #0
	b _021F6078
_021F6064:
	cmp r0, #2
	bne _021F6074
	add r0, r4, #0
	ldr r1, _021F6114 ; =ov01_02206BC8
	add r0, #0xfc
	str r1, [r0]
	mov r6, #1
	b _021F6078
_021F6074:
	bl GF_AssertFail
_021F6078:
	mov r0, #0x41
	ldr r1, [sp, #0x28]
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, r6, #0
	bl ov01_021FAC44
	str r0, [r4]
	add r0, r4, #0
	add r0, #0xb8
	str r7, [r0]
	add r0, r4, #0
	add r0, #0xc0
	str r5, [r0]
	add r1, r4, #0
	ldr r0, [sp]
	add r1, #0xbc
	str r0, [r1]
	add r0, r5, #0
	bl MapMatrix_GetWidth
	add r1, r4, #0
	add r1, #0xc4
	str r0, [r1]
	add r0, r5, #0
	bl MapMatrix_GetHeight
	add r1, r4, #0
	add r1, #0xc8
	str r0, [r1]
	add r0, r4, #0
	add r0, #0xc4
	ldr r0, [r0]
	lsl r1, r0, #5
	add r0, r4, #0
	add r0, #0xcc
	str r1, [r0]
	add r1, r4, #0
	ldr r0, [sp, #4]
	add r1, #0xf4
	str r0, [r1]
	add r0, r4, #0
	ldr r1, [sp, #0x20]
	add r0, #0xf8
	str r1, [r0]
	add r0, r4, #0
	mov r1, #1
	add r0, #0xf0
	str r1, [r0]
	add r0, r4, #0
	bl ov01_021F5F34
	add r0, r4, #0
	mov r1, #0
	add r0, #0xb0
	str r1, [r0]
	add r0, r4, #0
	mov r1, #2
	add r0, #0xb4
	str r1, [r0]
	mov r0, #0x41
	mov r1, #4
	bl NARC_ctor
	mov r1, #1
	lsl r1, r1, #8
	str r0, [r4, r1]
	mov r0, #0
	add r1, #8
	str r0, [r4, r1]
	add r0, r4, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F610C: .word ov01_02206BC0
_021F6110: .word ov01_02206BD0
_021F6114: .word ov01_02206BC8
	thumb_func_end ov01_021F6020

	thumb_func_start ov01_021F6118
ov01_021F6118: ; 0x021F6118
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r5, #0
	add r6, #0xfc
	add r3, r5, #0
	ldr r6, [r6]
	add r3, #0xcc
	ldr r3, [r3]
	ldr r6, [r6]
	add r4, r1, #0
	add r7, r2, #0
	blx r6
	add r0, r4, #0
	add r1, r7, #0
	add r2, r5, #0
	bl ov01_021F5F64
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov01_021F6118

	thumb_func_start ov01_021F613C
ov01_021F613C: ; 0x021F613C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r2, r5, #0
	add r3, r5, #0
	add r1, #0xc8
	add r2, #0xcc
	add r3, #0xa8
	ldr r1, [r1]
	ldr r2, [r2]
	ldr r3, [r3]
	add r6, r0, #0
	bl ov01_021F5A80
	add r1, r5, #0
	add r2, r5, #0
	add r1, #0xc4
	add r2, #0xcc
	ldr r1, [r1]
	ldr r2, [r2]
	add r7, r0, #0
	bl ov01_021F5A04
	add r1, r5, #0
	add r1, #0xcc
	add r4, r0, #0
	ldr r1, [r1]
	add r0, r7, #0
	bl ov01_021F6328
	add r1, r5, #0
	add r1, #0xa4
	ldr r1, [r1]
	cmp r1, r4
	bne _021F61A4
	add r1, r5, #0
	add r1, #0xad
	ldrb r1, [r1]
	cmp r1, r0
	beq _021F61A4
	add r0, r4, #0
	add r1, r6, #0
	add r2, r5, #0
	bl ov01_021F562C
	add r1, r5, #0
	add r1, #0xad
	add r5, #0xac
	ldrb r1, [r1]
	add r0, r6, #0
	add r2, r5, #0
	bl ov01_021F5B24
_021F61A4:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_021F613C

	thumb_func_start ov01_021F61A8
ov01_021F61A8: ; 0x021F61A8
	push {r3, r4, r5, r6, r7, lr}
	mov r4, #0
	add r5, r0, #0
	add r6, r1, #0
	sub r7, r4, #1
_021F61B2:
	lsl r0, r4, #2
	add r0, r5, r0
	add r0, #0x90
	ldr r1, [r0]
	mov r0, #0x86
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	cmp r0, r7
	beq _021F61CE
	add r0, r4, #0
	add r1, r5, #0
	add r2, r6, #0
	bl ov01_021F595C
_021F61CE:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #4
	blo _021F61B2
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_021F61A8

	thumb_func_start ov01_021F61DC
ov01_021F61DC: ; 0x021F61DC
	push {r3, r4}
	asr r4, r0, #0xf
	lsr r4, r4, #0x10
	add r4, r0, r4
	asr r0, r4, #0x10
	str r0, [r2]
	asr r0, r1, #0xf
	lsr r0, r0, #0x10
	add r0, r1, r0
	asr r0, r0, #0x10
	str r0, [r3]
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end ov01_021F61DC

	thumb_func_start ov01_021F61F8
ov01_021F61F8: ; 0x021F61F8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl sub_0201A430
	bl NNS_GfdResetLnkTexVramState
	bl NNS_GfdResetLnkPlttVramState
	mov r4, #0
	add r6, r5, #4
	mov r7, #0x30
_021F620E:
	add r0, r4, #0
	mul r0, r7
	add r0, r6, r0
	bl ov01_021F477C
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #2
	blo _021F620E
	mov r6, #0
	add r7, r6, #0
_021F6226:
	lsl r4, r6, #2
	add r0, r5, r4
	add r0, #0x90
	ldr r2, [r0]
	ldr r0, _021F62A4 ; =0x00000864
	mov r1, #0
	str r1, [r2, r0]
	add r0, r5, r4
	add r0, #0x90
	ldr r1, [r0]
	ldr r0, _021F62A8 ; =0x0000085C
	ldr r0, [r1, r0]
	bl ov01_021FB2E8
	add r0, r5, r4
	add r0, #0x90
	ldr r1, [r0]
	ldr r0, _021F62AC ; =0x00000868
	ldr r0, [r1, r0]
	bl ov01_021F3660
	add r0, r5, r4
	add r0, #0x90
	ldr r1, [r0]
	mov r0, #0xa7
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _021F6272
	bl FreeToHeap
	add r0, r5, r4
	add r0, #0x90
	ldr r2, [r0]
	mov r0, #0xa7
	mov r1, #0
	lsl r0, r0, #4
	str r1, [r2, r0]
_021F6272:
	add r0, r5, r4
	add r0, #0x90
	ldr r0, [r0]
	bl FreeToHeap
	add r0, r5, r4
	add r0, #0x90
	str r7, [r0]
	add r0, r6, #1
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	cmp r6, #4
	blo _021F6226
	add r0, r5, #0
	mov r1, #3
	add r0, #0xb4
	str r1, [r0]
	add r0, r5, #0
	mov r1, #1
	add r0, #0xb0
	str r1, [r0]
	add r5, #0xf0
	str r7, [r5]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F62A4: .word 0x00000864
_021F62A8: .word 0x0000085C
_021F62AC: .word 0x00000868
	thumb_func_end ov01_021F61F8

	thumb_func_start ov01_021F62B0
ov01_021F62B0: ; 0x021F62B0
	push {r4, lr}
	add r4, r0, #0
	mov r0, #1
	lsl r0, r0, #8
	ldr r0, [r4, r0]
	bl NARC_dtor
	ldr r0, [r4]
	bl ov01_021FACB4
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end ov01_021F62B0

	thumb_func_start ov01_021F62CC
ov01_021F62CC: ; 0x021F62CC
	add r1, r0, #0
	add r1, #0xb0
	ldr r1, [r1]
	cmp r1, #1
	bne _021F62E2
	add r0, #0xa0
	ldrb r0, [r0]
	cmp r0, #0
	bne _021F62E2
	mov r0, #1
	bx lr
_021F62E2:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov01_021F62CC

	thumb_func_start ov01_021F62E8
ov01_021F62E8: ; 0x021F62E8
	push {r4, r5}
	add r5, r0, #0
	add r4, r1, #0
	add r2, r4, #0
	add r3, r5, #0
	ldmia r3!, {r0, r1}
	add r2, #0xd0
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	add r4, #0xdc
	str r0, [r2]
	str r5, [r4]
	pop {r4, r5}
	bx lr
	thumb_func_end ov01_021F62E8

	thumb_func_start ov01_021F6304
ov01_021F6304: ; 0x021F6304
	mov r1, #0
	add r0, #0xdc
	str r1, [r0]
	bx lr
	thumb_func_end ov01_021F6304

	thumb_func_start ov01_021F630C
ov01_021F630C: ; 0x021F630C
	lsl r0, r0, #2
	add r0, r1, r0
	add r0, #0x90
	ldr r1, [r0]
	ldr r0, _021F631C ; =0x00000868
	ldr r0, [r1, r0]
	str r0, [r2]
	bx lr
	.balign 4, 0
_021F631C: .word 0x00000868
	thumb_func_end ov01_021F630C

	thumb_func_start ov01_021F6320
ov01_021F6320: ; 0x021F6320
	add r0, #0xac
	ldrb r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end ov01_021F6320

	thumb_func_start ov01_021F6328
ov01_021F6328: ; 0x021F6328
	push {r4, lr}
	add r4, r0, #0
	bl _u32_div_f
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x1b
	sub r1, r1, r2
	mov r0, #0x1b
	ror r1, r0
	mov r0, #0x1f
	and r0, r4
	add r1, r2, r1
	cmp r0, #0x10
	bge _021F6350
	cmp r1, #0x10
	bge _021F634C
	mov r0, #0
	pop {r4, pc}
_021F634C:
	mov r0, #2
	pop {r4, pc}
_021F6350:
	cmp r1, #0x10
	bge _021F6358
	mov r0, #1
	pop {r4, pc}
_021F6358:
	mov r0, #3
	pop {r4, pc}
	thumb_func_end ov01_021F6328

	thumb_func_start ov01_021F635C
ov01_021F635C: ; 0x021F635C
	push {r3, r4, r5, lr}
	add r4, r2, #0
	add r5, r0, #0
	add r0, r4, #0
	add r0, #0xa4
	ldr r0, [r0]
	cmp r0, r5
	bne _021F6372
	add r4, #0xac
	ldrb r0, [r4]
	pop {r3, r4, r5, pc}
_021F6372:
	mov r0, #0
	mvn r0, r0
	cmp r5, r0
	bne _021F637E
	bl GF_AssertFail
_021F637E:
	add r0, r4, #0
	add r0, #0xac
	ldrb r1, [r0]
	cmp r1, #3
	bls _021F638A
	b _021F6528
_021F638A:
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021F6396: ; jump table
	.short _021F639E - _021F6396 - 2 ; case 0
	.short _021F6400 - _021F6396 - 2 ; case 1
	.short _021F6464 - _021F6396 - 2 ; case 2
	.short _021F64C6 - _021F6396 - 2 ; case 3
_021F639E:
	add r0, r4, #0
	add r0, #0xa4
	add r2, r4, #0
	ldr r0, [r0]
	add r2, #0xc4
	ldr r2, [r2]
	sub r3, r5, r0
	cmp r2, r3
	bne _021F63B8
	add r0, r1, #2
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r3, r4, r5, pc}
_021F63B8:
	cmp r3, #1
	bne _021F63D2
	add r1, r5, #0
	bl ov01_021F4728
	cmp r0, #0
	beq _021F63D2
	add r4, #0xac
	ldrb r0, [r4]
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r3, r4, r5, pc}
_021F63D2:
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0xa4
	add r1, #0xc4
	ldr r2, [r1]
	ldr r0, [r0]
	add r3, r2, #1
	sub r1, r5, r0
	cmp r3, r1
	bne _021F63FC
	add r1, r5, #0
	bl ov01_021F4728
	cmp r0, #0
	bne _021F63FC
	add r4, #0xac
	ldrb r0, [r4]
	add r0, r0, #3
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r3, r4, r5, pc}
_021F63FC:
	mov r0, #4
	pop {r3, r4, r5, pc}
_021F6400:
	add r0, r4, #0
	add r0, #0xa4
	add r2, r4, #0
	ldr r0, [r0]
	add r2, #0xc4
	ldr r2, [r2]
	sub r3, r5, r0
	cmp r2, r3
	bne _021F641A
	add r0, r1, #2
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r3, r4, r5, pc}
_021F641A:
	sub r1, r0, r5
	cmp r1, #1
	bne _021F6436
	add r1, r5, #0
	bl ov01_021F4728
	cmp r0, #0
	beq _021F6436
	add r4, #0xac
	ldrb r0, [r4]
	sub r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r3, r4, r5, pc}
_021F6436:
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0xa4
	add r1, #0xc4
	ldr r2, [r1]
	ldr r0, [r0]
	sub r3, r2, #1
	sub r1, r5, r0
	cmp r3, r1
	bne _021F6460
	add r1, r5, #0
	bl ov01_021F4728
	cmp r0, #0
	bne _021F6460
	add r4, #0xac
	ldrb r0, [r4]
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r3, r4, r5, pc}
_021F6460:
	mov r0, #4
	pop {r3, r4, r5, pc}
_021F6464:
	add r0, r4, #0
	add r0, #0xa4
	add r2, r4, #0
	ldr r0, [r0]
	add r2, #0xc4
	ldr r2, [r2]
	sub r3, r0, r5
	cmp r2, r3
	bne _021F647E
	sub r0, r1, #2
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r3, r4, r5, pc}
_021F647E:
	sub r1, r2, #1
	cmp r1, r3
	bne _021F649A
	add r1, r5, #0
	bl ov01_021F4728
	cmp r0, #0
	bne _021F649A
	add r4, #0xac
	ldrb r0, [r4]
	sub r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r3, r4, r5, pc}
_021F649A:
	add r0, r4, #0
	add r0, #0xa4
	ldr r0, [r0]
	sub r1, r5, r0
	cmp r1, #1
	bne _021F64C2
	add r2, r4, #0
	add r2, #0xc4
	ldr r2, [r2]
	add r1, r5, #0
	bl ov01_021F4728
	cmp r0, #0
	beq _021F64C2
	add r4, #0xac
	ldrb r0, [r4]
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r3, r4, r5, pc}
_021F64C2:
	mov r0, #4
	pop {r3, r4, r5, pc}
_021F64C6:
	add r0, r4, #0
	add r0, #0xa4
	add r2, r4, #0
	ldr r0, [r0]
	add r2, #0xc4
	ldr r2, [r2]
	sub r3, r0, r5
	cmp r2, r3
	bne _021F64E0
	sub r0, r1, #2
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r3, r4, r5, pc}
_021F64E0:
	add r1, r2, #1
	cmp r1, r3
	bne _021F64FC
	add r1, r5, #0
	bl ov01_021F4728
	cmp r0, #0
	bne _021F64FC
	add r4, #0xac
	ldrb r0, [r4]
	sub r0, r0, #3
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r3, r4, r5, pc}
_021F64FC:
	add r0, r4, #0
	add r0, #0xa4
	ldr r0, [r0]
	sub r1, r0, r5
	cmp r1, #1
	bne _021F6524
	add r2, r4, #0
	add r2, #0xc4
	ldr r2, [r2]
	add r1, r5, #0
	bl ov01_021F4728
	cmp r0, #0
	beq _021F6524
	add r4, #0xac
	ldrb r0, [r4]
	sub r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r3, r4, r5, pc}
_021F6524:
	mov r0, #4
	pop {r3, r4, r5, pc}
_021F6528:
	mov r0, #4
	pop {r3, r4, r5, pc}
	thumb_func_end ov01_021F635C

	thumb_func_start ov01_021F652C
ov01_021F652C: ; 0x021F652C
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r0, #0
	cmp r5, #4
	blo _021F653A
	bl GF_AssertFail
_021F653A:
	lsl r0, r5, #2
	add r0, r4, r0
	add r0, #0x90
	ldr r1, [r0]
	mov r0, #0x86
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021F652C

	thumb_func_start ov01_021F654C
ov01_021F654C: ; 0x021F654C
	push {r3, r4, r5, r6, r7, lr}
	add r6, r2, #0
	asr r2, r6, #4
	add r5, r0, #0
	lsr r2, r2, #0x1b
	add r2, r6, r2
	add r4, r1, #0
	add r0, #0xc4
	ldr r1, [r0]
	asr r0, r4, #4
	lsr r0, r0, #0x1b
	add r0, r4, r0
	asr r2, r2, #5
	str r3, [sp]
	add r3, r2, #0
	asr r0, r0, #5
	mul r3, r1
	add r7, r0, r3
	add r0, r5, #0
	add r0, #0xc8
	ldr r0, [r0]
	mul r0, r1
	cmp r7, r0
	blo _021F658A
	mov r0, #1
	bl sub_02039AD8
	cmp r0, #0
	beq _021F658A
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021F658A:
	add r0, r5, #0
	add r0, #0xc4
	ldr r1, [r0]
	add r0, r5, #0
	add r0, #0xc8
	ldr r0, [r0]
	mul r0, r1
	cmp r7, r0
	blo _021F65A0
	bl GF_AssertFail
_021F65A0:
	add r0, r5, #0
	add r0, #0xcc
	ldr r1, [r0]
	add r0, r6, #0
	mul r0, r1
	add r0, r4, r0
	bl ov01_021F6328
	add r1, r0, #0
	add r0, r7, #0
	add r2, r5, #0
	bl ov01_021F635C
	ldr r1, [sp]
	cmp r1, #0
	beq _021F65C2
	strb r0, [r1]
_021F65C2:
	cmp r0, #3
	bls _021F65CA
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021F65CA:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_021F654C

	thumb_func_start ov01_021F65D0
ov01_021F65D0: ; 0x021F65D0
	lsl r1, r1, #2
	add r0, r0, r1
	add r0, #0x90
	ldr r1, [r0]
	ldr r0, _021F65E0 ; =0x0000085C
	ldr r0, [r1, r0]
	bx lr
	nop
_021F65E0: .word 0x0000085C
	thumb_func_end ov01_021F65D0

	thumb_func_start ov01_021F65E4
ov01_021F65E4: ; 0x021F65E4
	lsl r1, r1, #2
	add r0, r0, r1
	add r0, #0x90
	ldr r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end ov01_021F65E4

	thumb_func_start ov01_021F65F0
ov01_021F65F0: ; 0x021F65F0
	lsl r1, r1, #2
	add r0, r0, r1
	add r0, #0x90
	ldr r1, [r0]
	mov r0, #0xa7
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	bx lr
	thumb_func_end ov01_021F65F0

	thumb_func_start ov01_021F6600
ov01_021F6600: ; 0x021F6600
	lsl r1, r1, #2
	add r0, r0, r1
	add r0, #0x90
	ldr r1, [r0]
	ldr r0, _021F6610 ; =0x0000086C
	add r0, r1, r0
	bx lr
	nop
_021F6610: .word 0x0000086C
	thumb_func_end ov01_021F6600

	thumb_func_start ov01_021F6614
ov01_021F6614: ; 0x021F6614
	push {r3, lr}
	bl sub_0201F988
	mov r1, #1
	str r1, [r0, #0x20]
	pop {r3, pc}
	thumb_func_end ov01_021F6614

	thumb_func_start ov01_021F6620
ov01_021F6620: ; 0x021F6620
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0x20]
	cmp r0, #1
	bne _021F6630
	mov r0, #5
	strb r0, [r4, #0x18]
_021F6630:
	ldrb r0, [r4, #0x18]
	cmp r0, #5
	bls _021F6638
	b _021F676A
_021F6638:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021F6644: ; jump table
	.short _021F6650 - _021F6644 - 2 ; case 0
	.short _021F6680 - _021F6644 - 2 ; case 1
	.short _021F66B6 - _021F6644 - 2 ; case 2
	.short _021F66D4 - _021F6644 - 2 ; case 3
	.short _021F676A - _021F6644 - 2 ; case 4
	.short _021F6758 - _021F6644 - 2 ; case 5
_021F6650:
	mov r0, #0
	str r0, [r4, #0x2c]
	mov r0, #0xe
	ldr r5, [r4, #8]
	lsl r0, r0, #0xc
	cmp r5, r0
	bgt _021F6662
	mov r0, #2
	b _021F6666
_021F6662:
	add r5, r0, #0
	mov r0, #1
_021F6666:
	strb r0, [r4, #0x18]
	ldr r2, [r4, #0x10]
	ldr r0, [r4]
	ldr r3, [r2]
	ldr r2, [r4, #0x2c]
	add r1, r5, #0
	add r2, r3, r2
	bl NARC_ReadFile
	ldr r0, [r4, #0x2c]
	add r0, r0, r5
	str r0, [r4, #0x2c]
	pop {r4, r5, r6, pc}
_021F6680:
	ldr r2, [r4, #0x2c]
	ldr r0, [r4, #8]
	sub r5, r0, r2
	mov r0, #0xe
	lsl r0, r0, #0xc
	cmp r5, r0
	ble _021F6694
	add r5, r0, #0
	mov r6, #0
	b _021F6696
_021F6694:
	mov r6, #1
_021F6696:
	ldr r3, [r4, #0x10]
	ldr r0, [r4]
	ldr r3, [r3]
	add r1, r5, #0
	add r2, r3, r2
	bl NARC_ReadFile
	cmp r6, #0
	beq _021F66AE
	mov r0, #2
	strb r0, [r4, #0x18]
	pop {r4, r5, r6, pc}
_021F66AE:
	ldr r0, [r4, #0x2c]
	add r0, r0, r5
	str r0, [r4, #0x2c]
	pop {r4, r5, r6, pc}
_021F66B6:
	ldr r0, [r4, #0x14]
	cmp r0, #0
	beq _021F66CE
	bl sub_0201F53C
	cmp r0, #1
	bne _021F66CE
	ldr r0, [r4, #0x10]
	ldr r1, [r4, #0x14]
	ldr r0, [r0]
	bl Bind3dModelSet
_021F66CE:
	mov r0, #3
	strb r0, [r4, #0x18]
	pop {r4, r5, r6, pc}
_021F66D4:
	ldr r0, [r4, #0x10]
	ldr r0, [r0]
	bl NNS_G3dGetMdlSet
	add r5, r0, #0
	ldrb r0, [r5, #9]
	cmp r0, #1
	beq _021F66E8
	bl GF_AssertFail
_021F66E8:
	cmp r5, #0
	beq _021F670C
	add r1, r5, #0
	add r1, #8
	beq _021F6700
	ldrb r0, [r5, #9]
	cmp r0, #0
	bls _021F6700
	ldrh r0, [r5, #0xe]
	add r0, r1, r0
	add r0, r0, #4
	b _021F6702
_021F6700:
	mov r0, #0
_021F6702:
	cmp r0, #0
	beq _021F670C
	ldr r0, [r0]
	add r5, r5, r0
	b _021F670E
_021F670C:
	mov r5, #0
_021F670E:
	cmp r5, #0
	bne _021F6716
	bl GF_AssertFail
_021F6716:
	ldr r0, [r4, #0xc]
	add r1, r5, #0
	bl NNS_G3dRenderObjInit
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _021F672A
	bl GF_AssertFail
_021F672A:
	ldr r0, [r4, #0xc]
	mov r1, #0
	str r1, [r0, #8]
	ldr r0, [r4, #0x28]
	bl ov01_02204698
	cmp r0, #0
	beq _021F674C
	ldr r0, [r4, #4]
	bl sub_02054E20
	cmp r0, #0
	bne _021F674C
	ldr r0, [r4, #0x28]
	ldr r1, [r4, #0xc]
	bl ov01_02204678
_021F674C:
	ldr r0, [r4, #0x1c]
	mov r1, #1
	str r1, [r0]
	mov r0, #5
	strb r0, [r4, #0x18]
	pop {r4, r5, r6, pc}
_021F6758:
	ldr r0, [r4, #0x24]
	mov r1, #0
	str r1, [r0]
	add r0, r4, #0
	bl FreeToHeap
	add r0, r5, #0
	bl DestroySysTask
_021F676A:
	pop {r4, r5, r6, pc}
	thumb_func_end ov01_021F6620

	thumb_func_start ov01_021F676C
ov01_021F676C: ; 0x021F676C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #4
	mov r1, #0x30
	add r6, r2, #0
	add r7, r3, #0
	bl AllocFromHeapAtEnd
	add r1, r0, #0
	str r5, [r1]
	str r4, [r1, #4]
	str r6, [r1, #8]
	ldr r0, [sp, #0x18]
	str r7, [r1, #0xc]
	str r0, [r1, #0x10]
	ldr r0, [sp, #0x1c]
	mov r2, #0
	str r0, [r1, #0x14]
	ldr r0, [sp, #0x20]
	str r0, [r1, #0x28]
	ldr r0, [sp, #0x24]
	strb r2, [r1, #0x18]
	str r0, [r1, #0x1c]
	str r2, [r0]
	ldr r0, [sp, #0x28]
	str r0, [r1, #0x24]
	str r2, [r1, #0x20]
	ldr r0, _021F67B0 ; =ov01_021F6620
	mov r2, #1
	bl CreateSysTask
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F67B0: .word ov01_021F6620
	thumb_func_end ov01_021F676C

	thumb_func_start ov01_021F67B4
ov01_021F67B4: ; 0x021F67B4
	push {r3, r4, r5, lr}
	add r4, r3, #0
	add r5, r2, #0
	ldr r2, [r4]
	bl NARC_ReadFile
	ldr r0, [sp, #0x10]
	cmp r0, #0
	beq _021F67DE
	bl sub_0201F53C
	cmp r0, #1
	bne _021F67DE
	ldr r0, [r4]
	ldr r1, [sp, #0x10]
	bl Bind3dModelSet
	cmp r0, #0
	bne _021F67DE
	bl GF_AssertFail
_021F67DE:
	ldr r0, [r4]
	bl NNS_G3dGetMdlSet
	ldrb r0, [r0, #9]
	cmp r0, #1
	beq _021F67EE
	bl GF_AssertFail
_021F67EE:
	ldr r0, [r4]
	bl NNS_G3dGetMdlSet
	cmp r0, #0
	beq _021F6818
	add r2, r0, #0
	add r2, #8
	beq _021F680C
	ldrb r1, [r0, #9]
	cmp r1, #0
	bls _021F680C
	ldrh r1, [r0, #0xe]
	add r1, r2, r1
	add r1, r1, #4
	b _021F680E
_021F680C:
	mov r1, #0
_021F680E:
	cmp r1, #0
	beq _021F6818
	ldr r1, [r1]
	add r4, r0, r1
	b _021F681A
_021F6818:
	mov r4, #0
_021F681A:
	cmp r4, #0
	bne _021F6822
	bl GF_AssertFail
_021F6822:
	add r0, r5, #0
	add r1, r4, #0
	bl NNS_G3dRenderObjInit
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021F67B4

	.rodata

ov01_02206BC0: ; 0x02206BC0
	.word ov01_021F5D8C
	.word ov01_021F4D10

ov01_02206BC8: ; 0x02206BC8
	.word ov01_021F5EA0
	.word ov01_021F4E1C

ov01_02206BD0: ; 0x02206BD0
	.word ov01_021F5E20
	.word ov01_021F4D88

ov01_02206BD8: ; 0x02206BD8
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x10, 0x00, 0x00

ov01_02206BE4: ; 0x02206BE4
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
