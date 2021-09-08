	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_02031AF0
sub_02031AF0: ; 0x02031AF0
	mov r0, #0x28
	bx lr
	thumb_func_end sub_02031AF0

	thumb_func_start sub_02031AF4
sub_02031AF4: ; 0x02031AF4
	ldr r3, _02031AFC ; =MIi_CpuFill8
	mov r1, #0
	mov r2, #0x28
	bx r3
	.balign 4, 0
_02031AFC: .word MIi_CpuFill8
	thumb_func_end sub_02031AF4

	thumb_func_start sub_02031B00
sub_02031B00: ; 0x02031B00
	ldr r3, _02031B08 ; =SavArray_get
	mov r1, #0x1d
	bx r3
	nop
_02031B08: .word SavArray_get
	thumb_func_end sub_02031B00
