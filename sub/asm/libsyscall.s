	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_038008A4
sub_038008A4: ; 0x038008A4
	swi 0
	bx lr
	thumb_func_end sub_038008A4

	thumb_func_start sub_038008A8
sub_038008A8: ; 0x038008A8
	swi 3
	bx lr
	thumb_func_end sub_038008A8

	thumb_func_start sub_038008AC
sub_038008AC: ; 0x038008AC
	ldr r2, _038008B8 ; =0x04000000
	mov ip, r2
	mov r2, #0
	swi 4
	bx lr
	.align 2, 0
_038008B8: .word 0x04000000
	thumb_func_end sub_038008AC

	thumb_func_start sub_038008BC
sub_038008BC: ; 0x038008BC
	mov r2, #0
	swi 5
	bx lr
	thumb_func_end sub_038008BC

	non_word_aligned_thumb_func_start sub_038008C2
sub_038008C2: ; 0x038008C2
	swi 6
	bx lr
	thumb_func_end sub_038008C2

	non_word_aligned_thumb_func_start sub_038008C6
sub_038008C6: ; 0x038008C6
	swi 7
	bx lr
	thumb_func_end sub_038008C6

	non_word_aligned_thumb_func_start sub_038008CA
sub_038008CA: ; 0x038008CA
	swi 8
	bx lr
	thumb_func_end sub_038008CA

	non_word_aligned_thumb_func_start sub_038008CE
sub_038008CE: ; 0x038008CE
	add r1, r0, #0
	mov r0, #1
	swi 8
	bx lr
	thumb_func_end sub_038008CE

	non_word_aligned_thumb_func_start sub_038008D6
sub_038008D6: ; 0x038008D6
	add r1, r0, #0
	mov r0, #0
	swi 8
	bx lr
	thumb_func_end sub_038008D6

	non_word_aligned_thumb_func_start sub_038008DE
sub_038008DE: ; 0x038008DE
	swi 9
	bx lr
	thumb_func_end sub_038008DE

	non_word_aligned_thumb_func_start sub_038008E2
sub_038008E2: ; 0x038008E2
	swi 9
	add r0, r1, #0
	bx lr
	thumb_func_end sub_038008E2

	thumb_func_start sub_038008E8
sub_038008E8: ; 0x038008E8
	swi 0xb
	bx lr
	thumb_func_end sub_038008E8

	thumb_func_start sub_038008EC
sub_038008EC: ; 0x038008EC
	swi 0xc
	bx lr
	thumb_func_end sub_038008EC

	thumb_func_start sub_038008F0
sub_038008F0: ; 0x038008F0
	swi 0xd
	bx lr
	thumb_func_end sub_038008F0

	thumb_func_start sub_038008F4
sub_038008F4: ; 0x038008F4
	swi 0xe
	bx lr
	thumb_func_end sub_038008F4

	thumb_func_start sub_038008F8
sub_038008F8: ; 0x038008F8
	swi 0xf
	bx lr
	thumb_func_end sub_038008F8

	thumb_func_start sub_038008FC
sub_038008FC: ; 0x038008FC
	swi 0x10
	bx lr
	thumb_func_end sub_038008FC

	thumb_func_start sub_03800900
sub_03800900: ; 0x03800900
	swi 0x11
	bx lr
	thumb_func_end sub_03800900

	thumb_func_start sub_03800904
sub_03800904: ; 0x03800904
	swi 0x12
	bx lr
	thumb_func_end sub_03800904

	thumb_func_start sub_03800908
sub_03800908: ; 0x03800908
	swi 0x13
	bx lr
	thumb_func_end sub_03800908

	thumb_func_start sub_0380090C
sub_0380090C: ; 0x0380090C
	swi 0x14
	bx lr
	thumb_func_end sub_0380090C

	thumb_func_start sub_03800910
sub_03800910: ; 0x03800910
	swi 0x15
	bx lr
	thumb_func_end sub_03800910

	thumb_func_start sub_03800914
sub_03800914: ; 0x03800914
	swi 0x1a
	bx lr
	thumb_func_end sub_03800914

	thumb_func_start sub_03800918
sub_03800918: ; 0x03800918
	swi 0x1b
	bx lr
	thumb_func_end sub_03800918

	thumb_func_start sub_0380091C
sub_0380091C: ; 0x0380091C
	swi 0x1c
	bx lr
	thumb_func_end sub_0380091C
