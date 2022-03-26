#include "constants/easy_chat.h"
#include "constants/items.h"
#include "constants/maps.h"
#include "constants/moves.h"
#include "constants/species.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.text

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

	.data

_021105C8:
	.asciz "tel/pmtel_book.dat"
