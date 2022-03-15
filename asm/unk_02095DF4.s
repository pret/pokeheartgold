#include "constants/easy_chat.h"
#include "constants/items.h"
#include "constants/maps.h"
#include "constants/moves.h"
#include "constants/species.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_02095DF4
sub_02095DF4: ; 0x02095DF4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #0xb
	mov r1, #0x20
	add r6, r2, #0
	add r7, r3, #0
	bl AllocFromHeapAtEnd
	add r2, r0, #0
	mov r0, #0
	str r0, [r2]
	str r4, [r2, #8]
	strh r6, [r2, #0xe]
	ldr r0, [sp, #0x18]
	strh r7, [r2, #0xc]
	str r0, [r2, #0x10]
	ldr r0, [sp, #0x1c]
	ldr r1, _02095E2C ; =sub_02095E30
	str r0, [r2, #0x14]
	ldr r0, [sp, #0x20]
	str r0, [r2, #0x18]
	ldr r0, [sp, #0x24]
	str r0, [r2, #0x1c]
	ldr r0, [r5, #0x10]
	bl TaskManager_Call
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02095E2C: .word sub_02095E30
	thumb_func_end sub_02095DF4

	thumb_func_start sub_02095E30
sub_02095E30: ; 0x02095E30
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl TaskManager_GetSys
	add r5, r0, #0
	add r0, r4, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #3
	bhi _02095EF4
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02095E54: ; jump table
	.short _02095E5C - _02095E54 - 2 ; case 0
	.short _02095E9E - _02095E54 - 2 ; case 1
	.short _02095EB4 - _02095E54 - 2 ; case 2
	.short _02095EC4 - _02095E54 - 2 ; case 3
_02095E5C:
	mov r0, #0xb
	mov r1, #0x10
	bl AllocFromHeapAtEnd
	str r0, [r4, #4]
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _02095E70
	mov r1, #1
	b _02095E72
_02095E70:
	mov r1, #0
_02095E72:
	ldr r0, [r4, #4]
	str r1, [r0, #4]
	add r0, r5, #0
	bl Fsys_GetSav2Ptr
	ldr r1, [r4, #4]
	str r0, [r1]
	ldrh r1, [r4, #0xc]
	ldr r0, [r4, #4]
	strb r1, [r0, #0xc]
	ldrh r1, [r4, #0xe]
	ldr r0, [r4, #4]
	strb r1, [r0, #0xf]
	ldr r1, [r4, #4]
	add r0, r5, #0
	bl Fsys_LaunchPokeathlonCourseApplication
	bl sub_0203E30C
	mov r0, #1
	str r0, [r4]
	b _02095EF4
_02095E9E:
	add r0, r5, #0
	bl FieldSys_ApplicationIsRunning
	cmp r0, #0
	bne _02095EF4
	mov r0, #2
	str r0, [r4]
	add r0, r5, #0
	bl sub_020505C0
	b _02095EF4
_02095EB4:
	add r0, r5, #0
	bl sub_020505C8
	cmp r0, #0
	beq _02095EF4
	mov r0, #3
	str r0, [r4]
	b _02095EF4
_02095EC4:
	ldr r0, [r4, #4]
	ldrb r1, [r0, #0xe]
	ldr r0, [r4, #0x10]
	strh r1, [r0]
	ldr r0, [r4, #4]
	ldrh r1, [r0, #0xa]
	ldr r0, [r4, #0x14]
	strh r1, [r0]
	ldr r0, [r4, #4]
	ldrh r1, [r0, #8]
	ldr r0, [r4, #0x18]
	strh r1, [r0]
	ldr r0, [r4, #4]
	ldrb r1, [r0, #0xd]
	ldr r0, [r4, #0x1c]
	strh r1, [r0]
	ldr r0, [r4, #4]
	bl FreeToHeap
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #1
	pop {r3, r4, r5, pc}
_02095EF4:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02095E30

	thumb_func_start AllocAndReadPhoneBook
AllocAndReadPhoneBook: ; 0x02095EF8
	push {r4, r5, r6, lr}
	sub sp, #0x48
	add r5, r0, #0
	add r0, sp, #0
	bl FS_InitFile
	ldr r1, _02095F64 ; =_021105C8
	add r0, sp, #0
	bl FS_OpenFile
	cmp r0, #0
	bne _02095F1A
	bl GF_AssertFail
	add sp, #0x48
	mov r0, #0
	pop {r4, r5, r6, pc}
_02095F1A:
	ldr r1, [sp, #0x28]
	ldr r0, [sp, #0x24]
	sub r6, r1, r0
	add r0, r5, #0
	add r1, r6, #0
	bl AllocFromHeap
	add r4, r0, #0
	mov r1, #0
	add r2, r6, #0
	bl MI_CpuFill8
	add r0, sp, #0
	add r1, r4, #0
	mov r2, #4
	bl FS_ReadFile
	ldr r2, [r4]
	mov r1, #0x14
	add r0, r5, #0
	mul r1, r2
	bl AllocFromHeap
	str r0, [r4, #4]
	ldr r3, [r4]
	mov r2, #0x14
	ldr r1, [r4, #4]
	add r0, sp, #0
	mul r2, r3
	bl FS_ReadFile
	add r0, sp, #0
	bl FS_CloseFile
	add r0, r4, #0
	add sp, #0x48
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02095F64: .word _021105C8
	thumb_func_end AllocAndReadPhoneBook

	thumb_func_start FreePhoneBook
FreePhoneBook: ; 0x02095F68
	push {r4, lr}
	add r4, r0, #0
	ldr r3, [r4]
	mov r2, #0x14
	ldr r0, [r4, #4]
	mov r1, #0
	mul r2, r3
	bl MI_CpuFill8
	ldr r0, [r4, #4]
	bl FreeToHeap
	add r0, r4, #0
	mov r1, #0
	mov r2, #8
	bl MI_CpuFill8
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end FreePhoneBook

	thumb_func_start LoadPhoneBookEntryI
LoadPhoneBookEntryI: ; 0x02095F94
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, r2, #0
	add r4, r1, #0
	bl AllocAndReadPhoneBook
	add r6, r0, #0
	ldr r3, [r6]
	mov r1, #0
	cmp r3, #0
	ble _02095FD4
	ldr r7, [r6, #4]
	add r2, r7, #0
_02095FAE:
	ldrh r0, [r2, #4]
	cmp r5, r0
	bne _02095FCC
	add r0, r1, #0
	mov r2, #0x14
	mul r0, r2
	add r0, r7, r0
	add r1, r4, #0
	bl MI_CpuCopy8
	add r0, r6, #0
	bl FreePhoneBook
	ldrb r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_02095FCC:
	add r1, r1, #1
	add r2, #0x14
	cmp r1, r3
	blt _02095FAE
_02095FD4:
	add r0, r6, #0
	bl FreePhoneBook
	add r0, r4, #0
	mov r1, #0
	mov r2, #0x14
	bl MI_CpuFill8
	mov r0, #0xff
	strb r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end LoadPhoneBookEntryI

	thumb_func_start GetPhoneMessageGmm
GetPhoneMessageGmm: ; 0x02095FEC
	lsl r1, r0, #1
	ldr r0, _02095FF4 ; =sPhoneMessageGmm
	ldrh r0, [r0, r1]
	bx lr
	.balign 4, 0
_02095FF4: .word sPhoneMessageGmm
	thumb_func_end GetPhoneMessageGmm

	thumb_func_start sub_02095FF8
sub_02095FF8: ; 0x02095FF8
	push {r3, lr}
	mov r1, #3
	bl _s32_div_f
	cmp r1, #2
	bne _02096008
	mov r0, #1
	pop {r3, pc}
_02096008:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_02095FF8

	thumb_func_start LaunchStarterChoiceScene
LaunchStarterChoiceScene: ; 0x0209600C
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xb
	mov r1, #8
	bl AllocFromHeapAtEnd
	add r2, r0, #0
	mov r0, #0
	str r0, [r2]
	ldr r0, [r4, #0x10]
	ldr r1, _02096028 ; =CreateStarter
	bl TaskManager_Call
	pop {r4, pc}
	.balign 4, 0
_02096028: .word CreateStarter
	thumb_func_end LaunchStarterChoiceScene

	thumb_func_start CreateStarter
CreateStarter: ; 0x0209602C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	add r4, r0, #0
	bl TaskManager_GetSys
	str r0, [sp, #0x1c]
	add r0, r4, #0
	bl TaskManager_GetEnv
	add r7, r0, #0
	ldr r0, [r7]
	cmp r0, #5
	bhi _02096084
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02096052: ; jump table
	.short _0209605E - _02096052 - 2 ; case 0
	.short _0209607C - _02096052 - 2 ; case 1
	.short _0209612C - _02096052 - 2 ; case 2
	.short _0209613C - _02096052 - 2 ; case 3
	.short _0209618E - _02096052 - 2 ; case 4
	.short _020961B4 - _02096052 - 2 ; case 5
_0209605E:
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r0, #1
	str r0, [r7]
	b _020961CE
_0209607C:
	bl IsPaletteFadeActive
	cmp r0, #0
	bne _02096086
_02096084:
	b _020961CE
_02096086:
	ldr r3, _020961D4 ; =_02108514
	add r2, sp, #0x28
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r0, [sp, #0x1c]
	ldr r0, [r0, #0x20]
	ldr r0, [r0]
	bl MapHeader_GetMapSec
	mov r1, #0xb3
	str r0, [sp, #0x14]
	mov r0, #0xb
	lsl r1, r1, #2
	bl AllocFromHeapAtEnd
	str r0, [r7, #4]
	mov r1, #0
	str r1, [r0]
	ldr r0, [sp, #0x1c]
	ldr r0, [r0, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	ldr r1, [r7, #4]
	mov r5, #0
	str r0, [r1, #4]
	str r5, [sp, #0x18]
	add r6, sp, #0x28
_020960C0:
	ldr r0, [sp, #0x1c]
	ldr r4, [r7, #4]
	ldr r0, [r0, #0xc]
	add r4, #8
	bl Sav2_PlayerData_GetProfileAddr
	str r0, [sp, #0x20]
	add r0, r4, r5
	bl ZeroMonData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	ldr r1, [r6]
	add r0, r4, r5
	mov r2, #5
	mov r3, #0x20
	bl CreateMon
	mov r0, #0xc
	str r0, [sp]
	mov r0, #0xb
	str r0, [sp, #4]
	ldr r1, [sp, #0x20]
	ldr r3, [sp, #0x14]
	add r0, r4, r5
	mov r2, #4
	bl sub_020720FC
	mov r0, #0
	str r0, [sp, #0x24]
	add r0, r4, r5
	mov r1, #6
	add r2, sp, #0x24
	bl SetMonData
	ldr r0, [sp, #0x18]
	add r5, #0xec
	add r0, r0, #1
	add r6, r6, #4
	str r0, [sp, #0x18]
	cmp r0, #3
	blt _020960C0
	ldr r0, [sp, #0x1c]
	ldr r1, [r7, #4]
	bl FieldSys_LaunchChooseStarterApplication
	bl sub_0203E30C
	mov r0, #2
	str r0, [r7]
	b _020961CE
_0209612C:
	ldr r0, [sp, #0x1c]
	bl FieldSys_ApplicationIsRunning
	cmp r0, #0
	bne _020961CE
	mov r0, #3
	str r0, [r7]
	b _020961CE
_0209613C:
	ldr r0, [sp, #0x1c]
	ldr r0, [r0, #0xc]
	bl Sav2_Pokedex_get
	add r6, r0, #0
	ldr r0, [sp, #0x1c]
	ldr r0, [r0, #0xc]
	bl SavArray_PlayerParty_get
	ldr r1, [r7, #4]
	str r0, [sp, #0x10]
	ldr r2, [r1]
	add r4, r1, #0
	mov r1, #0xec
	add r5, r2, #0
	add r4, #8
	mul r5, r1
	add r1, r4, r5
	bl AddMonToParty
	cmp r0, #0
	beq _02096172
	ldr r0, [sp, #0x1c]
	add r1, r4, r5
	ldr r0, [r0, #0xc]
	bl UpdatePokedexWithReceivedSpecies
_02096172:
	ldr r0, [sp, #0x10]
	mov r1, #0
	bl GetPartyMonByIndex
	add r1, r0, #0
	add r0, r6, #0
	bl Pokedex_SetMonCaughtFlag
	mov r0, #4
	str r0, [r7]
	ldr r0, [sp, #0x1c]
	bl sub_020505C0
	b _020961CE
_0209618E:
	ldr r0, [sp, #0x1c]
	bl sub_020505C8
	cmp r0, #0
	beq _020961CE
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
	mov r0, #5
	str r0, [r7]
	b _020961CE
_020961B4:
	bl IsPaletteFadeActive
	cmp r0, #0
	beq _020961CE
	ldr r0, [r7, #4]
	bl FreeToHeap
	add r0, r7, #0
	bl FreeToHeap
	add sp, #0x34
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_020961CE:
	mov r0, #0
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_020961D4: .word _02108514
	thumb_func_end CreateStarter

	thumb_func_start sub_020961D8
sub_020961D8: ; 0x020961D8
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r6, r1, #0
	bl TaskManager_GetSys
	add r5, r0, #0
	mov r0, #0x20
	mov r1, #0x24
	bl AllocFromHeap
	add r4, r0, #0
	str r5, [r4]
	mov r0, #0x20
	bl ScrStrBufs_new
	str r0, [r4, #4]
	mov r3, #0x20
	str r3, [sp]
	ldr r2, [r4]
	add r3, #0xec
	ldr r2, [r2, #0xc]
	mov r0, #2
	mov r1, #0
	add r3, r5, r3
	bl sub_02090C94
	str r0, [r4, #0x10]
	ldr r0, [r5, #0xc]
	bl Sav2_Misc_get
	str r0, [r4, #0x14]
	add r0, r4, #0
	str r6, [r4, #0x20]
	add r0, #8
	mov r1, #4
	bl MailMsg_init_withBank
	add r1, r4, #0
	ldr r0, [r4, #0x14]
	add r1, #8
	bl sub_0202ABD0
	ldr r0, [r4, #0x10]
	bl sub_02090D40
	mov r0, #0
	str r0, [r4, #0x18]
	ldr r1, _02096244 ; =sub_02096260
	add r0, r7, #0
	add r2, r4, #0
	bl TaskManager_Call
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02096244: .word sub_02096260
	thumb_func_end sub_020961D8

	thumb_func_start sub_02096248
sub_02096248: ; 0x02096248
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x10]
	bl sub_02090D0C
	ldr r0, [r4, #4]
	bl ScrStrBufs_delete
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end sub_02096248

	thumb_func_start sub_02096260
sub_02096260: ; 0x02096260
	push {r4, lr}
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldr r1, [r4, #0x18]
	cmp r1, #4
	bhi _02096314
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0209627A: ; jump table
	.short _02096284 - _0209627A - 2 ; case 0
	.short _020962A2 - _0209627A - 2 ; case 1
	.short _020962B8 - _0209627A - 2 ; case 2
	.short _020962CE - _0209627A - 2 ; case 3
	.short _0209630C - _0209627A - 2 ; case 4
_02096284:
	add r1, r4, #0
	ldr r0, [r4, #0x10]
	add r1, #8
	bl sub_02090D20
	ldr r0, [r4, #0x10]
	bl sub_02090D34
	ldr r0, [r4]
	ldr r1, [r4, #0x10]
	bl sub_0203EA24
	mov r0, #1
	str r0, [r4, #0x18]
	b _02096314
_020962A2:
	ldr r0, [r4]
	bl FieldSys_ApplicationIsRunning
	cmp r0, #0
	bne _02096314
	ldr r0, [r4]
	bl sub_020505C0
	mov r0, #2
	str r0, [r4, #0x18]
	b _02096314
_020962B8:
	ldr r0, [r4]
	bl sub_020505C8
	cmp r0, #0
	beq _02096314
	mov r0, #1
	bl ov01_021E636C
	mov r0, #3
	str r0, [r4, #0x18]
	b _02096314
_020962CE:
	bl IsPaletteFadeActive
	cmp r0, #0
	beq _02096314
	ldr r0, [r4, #0x10]
	bl sub_02090D48
	cmp r0, #0
	beq _020962EC
	ldr r0, [r4, #0x20]
	mov r1, #0
	strh r1, [r0]
	mov r0, #4
	str r0, [r4, #0x18]
	b _02096314
_020962EC:
	ldr r0, [r4, #0x20]
	mov r1, #1
	strh r1, [r0]
	add r1, r4, #0
	ldr r0, [r4, #0x10]
	add r1, #8
	bl sub_02090D60
	add r1, r4, #0
	ldr r0, [r4, #0x14]
	add r1, #8
	bl sub_0202ABEC
	mov r0, #4
	str r0, [r4, #0x18]
	b _02096314
_0209630C:
	bl sub_02096248
	mov r0, #1
	pop {r4, pc}
_02096314:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end sub_02096260

	.rodata

sPhoneMessageGmm:
	.short 664 ; PHONE_CONTACT_MOTHER
	.short 716 ; PHONE_CONTACT_PROF__ELM
	.short 666 ; PHONE_CONTACT_PROF__OAK
	.short 662 ; PHONE_CONTACT_ETHAN
	.short 663 ; PHONE_CONTACT_LYRA
	.short 643 ; PHONE_CONTACT_KURT
	.short 661 ; PHONE_CONTACT_DAY_C_MAN
	.short 660 ; PHONE_CONTACT_DAY_C_LADY
	.short 641 ; PHONE_CONTACT_BUENA
	.short 665 ; PHONE_CONTACT_BILL
	.short 675 ; PHONE_CONTACT_JOEY
	.short 712 ; PHONE_CONTACT_RALPH
	.short 680 ; PHONE_CONTACT_LIZ
	.short 684 ; PHONE_CONTACT_WADE
	.short 711 ; PHONE_CONTACT_ANTHONY
	.short 642 ; PHONE_CONTACT_BIKE_SHOP
	.short 706 ; PHONE_CONTACT_KENJI
	.short 644 ; PHONE_CONTACT_WHITNEY
	.short 648 ; PHONE_CONTACT_FALKNER
	.short 704 ; PHONE_CONTACT_JACK
	.short 685 ; PHONE_CONTACT_CHAD
	.short 688 ; PHONE_CONTACT_BRENT
	.short 713 ; PHONE_CONTACT_TODD
	.short 714 ; PHONE_CONTACT_ARNIE
	.short 667 ; PHONE_CONTACT_BAOBA
	.short 691 ; PHONE_CONTACT_IRWIN
	.short 645 ; PHONE_CONTACT_JANINE
	.short 649 ; PHONE_CONTACT_CLAIR
	.short 646 ; PHONE_CONTACT_ERIKA
	.short 650 ; PHONE_CONTACT_MISTY
	.short 651 ; PHONE_CONTACT_BLAINE
	.short 647 ; PHONE_CONTACT_BLUE
	.short 656 ; PHONE_CONTACT_CHUCK
	.short 657 ; PHONE_CONTACT_BROCK
	.short 658 ; PHONE_CONTACT_BUGSY
	.short 655 ; PHONE_CONTACT_SABRINA
	.short 652 ; PHONE_CONTACT_LT__SURGE
	.short 653 ; PHONE_CONTACT_MORTY
	.short 654 ; PHONE_CONTACT_JASMINE
	.short 659 ; PHONE_CONTACT_PRYCE
	.short 674 ; PHONE_CONTACT_HUEY
	.short 705 ; PHONE_CONTACT_GAVEN
	.short 677 ; PHONE_CONTACT_JAMIE
	.short 698 ; PHONE_CONTACT_REENA
	.short 696 ; PHONE_CONTACT_VANCE
	.short 708 ; PHONE_CONTACT_PARRY
	.short 672 ; PHONE_CONTACT_ERIN
	.short 690 ; PHONE_CONTACT_BEVERLY
	.short 671 ; PHONE_CONTACT_JOSE
	.short 695 ; PHONE_CONTACT_GINA
	.short 689 ; PHONE_CONTACT_ALAN
	.short 700 ; PHONE_CONTACT_DANA
	.short 693 ; PHONE_CONTACT_DEREK
	.short 694 ; PHONE_CONTACT_TULLY
	.short 669 ; PHONE_CONTACT_TIFFANY
	.short 676 ; PHONE_CONTACT_WILTON
	.short 715 ; PHONE_CONTACT_KRISE
	.short 703 ; PHONE_CONTACT_IAN
	.short 710 ; PHONE_CONTACT_WALT
	.short 670 ; PHONE_CONTACT_ALFRED
	.short 692 ; PHONE_CONTACT_DOUG
	.short 681 ; PHONE_CONTACT_ROB
	.short 697 ; PHONE_CONTACT_KYLE
	.short 687 ; PHONE_CONTACT_KYLER
	.short 702 ; PHONE_CONTACT_TIM_AND_SUE
	.short 699 ; PHONE_CONTACT_KENNY
	.short 707 ; PHONE_CONTACT_TANNER
	.short 682 ; PHONE_CONTACT_JOSH
	.short 673 ; PHONE_CONTACT_TORIN
	.short 686 ; PHONE_CONTACT_HILLARY
	.short 683 ; PHONE_CONTACT_BILLY
	.short 679 ; PHONE_CONTACT_KAY_AND_TIA
	.short 701 ; PHONE_CONTACT_REESE
	.short 709 ; PHONE_CONTACT_AIDEN
	.short 678 ; PHONE_CONTACT_ERNEST

	; File boundary
	.balign 4, 0
_02108514:
	.word SPECIES_CHIKORITA
	.word SPECIES_CYNDAQUIL
	.word SPECIES_TOTODILE

	.data

_021105C8:
	.asciz "tel/pmtel_book.dat"
