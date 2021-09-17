	.include "asm/macros.inc"
	.include "global.inc"

	.rodata
_020FCA74:
	.byte 0x00, 0x00, 0x02, 0x02, 0x00, 0x02, 0x00, 0x00, 0x02, 0x00, 0x00, 0x02
	.byte 0x00, 0x00, 0x00, 0x00, 0x03, 0x01, 0x03, 0x01, 0x01, 0x03, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x01, 0x00, 0x00, 0x00, 0x02, 0x01, 0x00, 0x00, 0x02
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x02, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

	.text

	thumb_func_start sub_0205B6E8
sub_0205B6E8: ; 0x0205B6E8
	cmp r0, #2
	bne _0205B6F0
	mov r0, #1
	bx lr
_0205B6F0:
	mov r0, #0
	bx lr
	thumb_func_end sub_0205B6E8

	thumb_func_start sub_0205B6F4
sub_0205B6F4: ; 0x0205B6F4
	cmp r0, #3
	bne _0205B6FC
	mov r0, #1
	bx lr
_0205B6FC:
	mov r0, #0
	bx lr
	thumb_func_end sub_0205B6F4

	thumb_func_start sub_0205B700
sub_0205B700: ; 0x0205B700
	cmp r0, #0x80
	bne _0205B708
	mov r0, #1
	bx lr
_0205B708:
	mov r0, #0
	bx lr
	thumb_func_end sub_0205B700

	thumb_func_start sub_0205B70C
sub_0205B70C: ; 0x0205B70C
	cmp r0, #0x69
	bne _0205B714
	mov r0, #1
	bx lr
_0205B714:
	mov r0, #0
	bx lr
	thumb_func_end sub_0205B70C

	thumb_func_start sub_0205B718
sub_0205B718: ; 0x0205B718
	cmp r0, #0x62
	bne _0205B720
	mov r0, #1
	bx lr
_0205B720:
	mov r0, #0
	bx lr
	thumb_func_end sub_0205B718

	thumb_func_start sub_0205B724
sub_0205B724: ; 0x0205B724
	cmp r0, #0x63
	bne _0205B72C
	mov r0, #1
	bx lr
_0205B72C:
	mov r0, #0
	bx lr
	thumb_func_end sub_0205B724

	thumb_func_start sub_0205B730
sub_0205B730: ; 0x0205B730
	cmp r0, #0x64
	bne _0205B738
	mov r0, #1
	bx lr
_0205B738:
	mov r0, #0
	bx lr
	thumb_func_end sub_0205B730

	thumb_func_start sub_0205B73C
sub_0205B73C: ; 0x0205B73C
	cmp r0, #0x65
	bne _0205B744
	mov r0, #1
	bx lr
_0205B744:
	mov r0, #0
	bx lr
	thumb_func_end sub_0205B73C

	thumb_func_start sub_0205B748
sub_0205B748: ; 0x0205B748
	cmp r0, #0x6c
	bne _0205B750
	mov r0, #1
	bx lr
_0205B750:
	mov r0, #0
	bx lr
	thumb_func_end sub_0205B748

	thumb_func_start sub_0205B754
sub_0205B754: ; 0x0205B754
	cmp r0, #0x6d
	bne _0205B75C
	mov r0, #1
	bx lr
_0205B75C:
	mov r0, #0
	bx lr
	thumb_func_end sub_0205B754

	thumb_func_start sub_0205B760
sub_0205B760: ; 0x0205B760
	cmp r0, #0x6e
	bne _0205B768
	mov r0, #1
	bx lr
_0205B768:
	mov r0, #0
	bx lr
	thumb_func_end sub_0205B760

	thumb_func_start sub_0205B76C
sub_0205B76C: ; 0x0205B76C
	cmp r0, #0x6f
	bne _0205B774
	mov r0, #1
	bx lr
_0205B774:
	mov r0, #0
	bx lr
	thumb_func_end sub_0205B76C

	thumb_func_start sub_0205B778
sub_0205B778: ; 0x0205B778
	ldr r1, _0205B788 ; =_020FCA74
	ldrb r1, [r1, r0]
	mov r0, #1
	tst r1, r0
	bne _0205B784
	mov r0, #0
_0205B784:
	bx lr
	nop
_0205B788: .word _020FCA74
	thumb_func_end sub_0205B778

	thumb_func_start sub_0205B78C
sub_0205B78C: ; 0x0205B78C
	cmp r0, #0x22
	bne _0205B794
	mov r0, #1
	bx lr
_0205B794:
	mov r0, #0
	bx lr
	thumb_func_end sub_0205B78C

	thumb_func_start sub_0205B798
sub_0205B798: ; 0x0205B798
	cmp r0, #0x21
	bne _0205B7A0
	mov r0, #1
	bx lr
_0205B7A0:
	mov r0, #0
	bx lr
	thumb_func_end sub_0205B798

	thumb_func_start sub_0205B7A4
sub_0205B7A4: ; 0x0205B7A4
	cmp r0, #0x17
	bne _0205B7AC
	mov r0, #1
	bx lr
_0205B7AC:
	mov r0, #0
	bx lr
	thumb_func_end sub_0205B7A4

	thumb_func_start sub_0205B7B0
sub_0205B7B0: ; 0x0205B7B0
	cmp r0, #0x3a
	bne _0205B7B8
	mov r0, #1
	bx lr
_0205B7B8:
	mov r0, #0
	bx lr
	thumb_func_end sub_0205B7B0

	thumb_func_start sub_0205B7BC
sub_0205B7BC: ; 0x0205B7BC
	cmp r0, #0x3b
	bne _0205B7C4
	mov r0, #1
	bx lr
_0205B7C4:
	mov r0, #0
	bx lr
	thumb_func_end sub_0205B7BC

	thumb_func_start sub_0205B7C8
sub_0205B7C8: ; 0x0205B7C8
	cmp r0, #0x39
	bne _0205B7D0
	mov r0, #1
	bx lr
_0205B7D0:
	mov r0, #0
	bx lr
	thumb_func_end sub_0205B7C8

	thumb_func_start sub_0205B7D4
sub_0205B7D4: ; 0x0205B7D4
	cmp r0, #0x38
	bne _0205B7DC
	mov r0, #1
	bx lr
_0205B7DC:
	mov r0, #0
	bx lr
	thumb_func_end sub_0205B7D4

	thumb_func_start sub_0205B7E0
sub_0205B7E0: ; 0x0205B7E0
	cmp r0, #0x83
	bne _0205B7E8
	mov r0, #1
	bx lr
_0205B7E8:
	mov r0, #0
	bx lr
	thumb_func_end sub_0205B7E0

	thumb_func_start sub_0205B7EC
sub_0205B7EC: ; 0x0205B7EC
	cmp r0, #0x85
	bne _0205B7F4
	mov r0, #1
	bx lr
_0205B7F4:
	mov r0, #0
	bx lr
	thumb_func_end sub_0205B7EC

	thumb_func_start sub_0205B7F8
sub_0205B7F8: ; 0x0205B7F8
	cmp r0, #0x6a
	bne _0205B800
	mov r0, #1
	bx lr
_0205B800:
	mov r0, #0
	bx lr
	thumb_func_end sub_0205B7F8

	thumb_func_start sub_0205B804
sub_0205B804: ; 0x0205B804
	cmp r0, #0x6b
	bne _0205B80C
	mov r0, #1
	bx lr
_0205B80C:
	mov r0, #0
	bx lr
	thumb_func_end sub_0205B804

	thumb_func_start sub_0205B810
sub_0205B810: ; 0x0205B810
	cmp r0, #0x5e
	bne _0205B818
	mov r0, #1
	bx lr
_0205B818:
	mov r0, #0
	bx lr
	thumb_func_end sub_0205B810

	thumb_func_start sub_0205B81C
sub_0205B81C: ; 0x0205B81C
	cmp r0, #0x5f
	bne _0205B824
	mov r0, #1
	bx lr
_0205B824:
	mov r0, #0
	bx lr
	thumb_func_end sub_0205B81C

	thumb_func_start sub_0205B828
sub_0205B828: ; 0x0205B828
	cmp r0, #0x20
	bne _0205B830
	mov r0, #1
	bx lr
_0205B830:
	mov r0, #0
	bx lr
	thumb_func_end sub_0205B828

	thumb_func_start sub_0205B834
sub_0205B834: ; 0x0205B834
	cmp r0, #0x4b
	bne _0205B83C
	mov r0, #1
	bx lr
_0205B83C:
	mov r0, #0
	bx lr
	thumb_func_end sub_0205B834

	thumb_func_start sub_0205B840
sub_0205B840: ; 0x0205B840
	cmp r0, #0x4c
	bne _0205B848
	mov r0, #1
	bx lr
_0205B848:
	mov r0, #0
	bx lr
	thumb_func_end sub_0205B840

	thumb_func_start sub_0205B84C
sub_0205B84C: ; 0x0205B84C
	cmp r0, #0xe0
	bne _0205B854
	mov r0, #1
	bx lr
_0205B854:
	mov r0, #0
	bx lr
	thumb_func_end sub_0205B84C

	thumb_func_start sub_0205B858
sub_0205B858: ; 0x0205B858
	cmp r0, #0xea
	bne _0205B860
	mov r0, #1
	bx lr
_0205B860:
	mov r0, #0
	bx lr
	thumb_func_end sub_0205B858

	thumb_func_start sub_0205B864
sub_0205B864: ; 0x0205B864
	cmp r0, #0xe1
	bne _0205B86C
	mov r0, #1
	bx lr
_0205B86C:
	mov r0, #0
	bx lr
	thumb_func_end sub_0205B864

	thumb_func_start sub_0205B870
sub_0205B870: ; 0x0205B870
	cmp r0, #0xe2
	bne _0205B878
	mov r0, #1
	bx lr
_0205B878:
	mov r0, #0
	bx lr
	thumb_func_end sub_0205B870

	thumb_func_start sub_0205B87C
sub_0205B87C: ; 0x0205B87C
	cmp r0, #0xe4
	bne _0205B884
	mov r0, #1
	bx lr
_0205B884:
	mov r0, #0
	bx lr
	thumb_func_end sub_0205B87C

	thumb_func_start sub_0205B888
sub_0205B888: ; 0x0205B888
	cmp r0, #0xe5
	bne _0205B890
	mov r0, #1
	bx lr
_0205B890:
	mov r0, #0
	bx lr
	thumb_func_end sub_0205B888

	thumb_func_start sub_0205B894
sub_0205B894: ; 0x0205B894
	cmp r0, #0xeb
	bne _0205B89C
	mov r0, #1
	bx lr
_0205B89C:
	mov r0, #0
	bx lr
	thumb_func_end sub_0205B894

	thumb_func_start sub_0205B8A0
sub_0205B8A0: ; 0x0205B8A0
	cmp r0, #0xec
	bne _0205B8A8
	mov r0, #1
	bx lr
_0205B8A8:
	mov r0, #0
	bx lr
	thumb_func_end sub_0205B8A0

	thumb_func_start sub_0205B8AC
sub_0205B8AC: ; 0x0205B8AC
	cmp r0, #0xa4
	bne _0205B8B4
	mov r0, #1
	bx lr
_0205B8B4:
	mov r0, #0
	bx lr
	thumb_func_end sub_0205B8AC

	thumb_func_start sub_0205B8B8
sub_0205B8B8: ; 0x0205B8B8
	cmp r0, #0xa8
	bne _0205B8C0
	mov r0, #1
	bx lr
_0205B8C0:
	mov r0, #0
	bx lr
	thumb_func_end sub_0205B8B8

	thumb_func_start sub_0205B8C4
sub_0205B8C4: ; 0x0205B8C4
	cmp r0, #0xa8
	bne _0205B8CC
	mov r0, #1
	bx lr
_0205B8CC:
	mov r0, #0
	bx lr
	thumb_func_end sub_0205B8C4

	thumb_func_start sub_0205B8D0
sub_0205B8D0: ; 0x0205B8D0
	cmp r0, #8
	bne _0205B8D8
	mov r0, #1
	bx lr
_0205B8D8:
	mov r0, #0
	bx lr
	thumb_func_end sub_0205B8D0

	thumb_func_start sub_0205B8DC
sub_0205B8DC: ; 0x0205B8DC
	cmp r0, #0x13
	bne _0205B8E4
	mov r0, #1
	bx lr
_0205B8E4:
	mov r0, #0
	bx lr
	thumb_func_end sub_0205B8DC

	thumb_func_start sub_0205B8E8
sub_0205B8E8: ; 0x0205B8E8
	cmp r0, #0x11
	bne _0205B8F0
	mov r0, #1
	bx lr
_0205B8F0:
	mov r0, #0
	bx lr
	thumb_func_end sub_0205B8E8

	thumb_func_start sub_0205B8F4
sub_0205B8F4: ; 0x0205B8F4
	add r0, #0xce
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	mov r3, #0
	cmp r0, #0x17
	bhi _0205B90E
	mov r1, #1
	add r2, r1, #0
	lsl r2, r0
	ldr r0, _0205B914 ; =0x0080040D
	tst r0, r2
	beq _0205B90E
	add r3, r1, #0
_0205B90E:
	add r0, r3, #0
	bx lr
	nop
_0205B914: .word 0x0080040D
	thumb_func_end sub_0205B8F4

	thumb_func_start sub_0205B918
sub_0205B918: ; 0x0205B918
	add r0, #0xcd
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	mov r3, #0
	cmp r0, #0x16
	bhi _0205B932
	mov r1, #1
	add r2, r1, #0
	lsl r2, r0
	ldr r0, _0205B938 ; =0x00400419
	tst r0, r2
	beq _0205B932
	add r3, r1, #0
_0205B932:
	add r0, r3, #0
	bx lr
	nop
_0205B938: .word 0x00400419
	thumb_func_end sub_0205B918

	thumb_func_start sub_0205B93C
sub_0205B93C: ; 0x0205B93C
	add r0, #0xcf
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	mov r3, #0
	cmp r0, #0x19
	bhi _0205B956
	mov r1, #1
	add r2, r1, #0
	lsl r2, r0
	ldr r0, _0205B95C ; =0x02000051
	tst r0, r2
	beq _0205B956
	add r3, r1, #0
_0205B956:
	add r0, r3, #0
	bx lr
	nop
_0205B95C: .word 0x02000051
	thumb_func_end sub_0205B93C

	thumb_func_start sub_0205B960
sub_0205B960: ; 0x0205B960
	add r0, #0xd0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	mov r3, #0
	cmp r0, #0x1a
	bhi _0205B97A
	mov r1, #1
	add r2, r1, #0
	lsl r2, r0
	ldr r0, _0205B980 ; =0x04000051
	tst r0, r2
	beq _0205B97A
	add r3, r1, #0
_0205B97A:
	add r0, r3, #0
	bx lr
	nop
_0205B980: .word 0x04000051
	thumb_func_end sub_0205B960

	thumb_func_start sub_0205B984
sub_0205B984: ; 0x0205B984
	cmp r0, #0x16
	beq _0205B98C
	cmp r0, #0x1d
	bne _0205B990
_0205B98C:
	mov r0, #1
	bx lr
_0205B990:
	mov r0, #0
	bx lr
	thumb_func_end sub_0205B984

	thumb_func_start sub_0205B994
sub_0205B994: ; 0x0205B994
	ldr r1, _0205B9A8 ; =_020FCA74
	ldrb r1, [r1, r0]
	mov r0, #2
	tst r0, r1
	beq _0205B9A2
	mov r0, #1
	bx lr
_0205B9A2:
	mov r0, #0
	bx lr
	nop
_0205B9A8: .word _020FCA74
	thumb_func_end sub_0205B994

	thumb_func_start sub_0205B9AC
sub_0205B9AC: ; 0x0205B9AC
	cmp r0, #0x86
	bne _0205B9B4
	mov r0, #1
	bx lr
_0205B9B4:
	mov r0, #0
	bx lr
	thumb_func_end sub_0205B9AC

	thumb_func_start sub_0205B9B8
sub_0205B9B8: ; 0x0205B9B8
	add r0, #0xf0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	mov r3, #0
	cmp r0, #0x1d
	bhi _0205B9D2
	mov r1, #1
	add r2, r1, #0
	lsl r2, r0
	ldr r0, _0205B9D8 ; =0x20012041
	tst r0, r2
	beq _0205B9D2
	add r3, r1, #0
_0205B9D2:
	add r0, r3, #0
	bx lr
	nop
_0205B9D8: .word 0x20012041
	thumb_func_end sub_0205B9B8

	thumb_func_start sub_0205B9DC
sub_0205B9DC: ; 0x0205B9DC
	cmp r0, #0x40
	bne _0205B9E4
	mov r0, #1
	bx lr
_0205B9E4:
	mov r0, #0
	bx lr
	thumb_func_end sub_0205B9DC

	thumb_func_start sub_0205B9E8
sub_0205B9E8: ; 0x0205B9E8
	cmp r0, #0x41
	bne _0205B9F0
	mov r0, #1
	bx lr
_0205B9F0:
	mov r0, #0
	bx lr
	thumb_func_end sub_0205B9E8

	thumb_func_start sub_0205B9F4
sub_0205B9F4: ; 0x0205B9F4
	cmp r0, #0x42
	bne _0205B9FC
	mov r0, #1
	bx lr
_0205B9FC:
	mov r0, #0
	bx lr
	thumb_func_end sub_0205B9F4

	thumb_func_start sub_0205BA00
sub_0205BA00: ; 0x0205BA00
	cmp r0, #0x43
	bne _0205BA08
	mov r0, #1
	bx lr
_0205BA08:
	mov r0, #0
	bx lr
	thumb_func_end sub_0205BA00

	thumb_func_start sub_0205BA0C
sub_0205BA0C: ; 0x0205BA0C
	cmp r0, #0x4d
	bne _0205BA14
	mov r0, #1
	bx lr
_0205BA14:
	mov r0, #0
	bx lr
	thumb_func_end sub_0205BA0C

	thumb_func_start sub_0205BA18
sub_0205BA18: ; 0x0205BA18
	cmp r0, #0x67
	bne _0205BA20
	mov r0, #1
	bx lr
_0205BA20:
	mov r0, #0
	bx lr
	thumb_func_end sub_0205BA18

	thumb_func_start sub_0205BA24
sub_0205BA24: ; 0x0205BA24
	cmp r0, #0x70
	bne _0205BA2C
	mov r0, #1
	bx lr
_0205BA2C:
	mov r0, #0
	bx lr
	thumb_func_end sub_0205BA24

	thumb_func_start sub_0205BA30
sub_0205BA30: ; 0x0205BA30
	add r0, #0x8f
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #2
	bhi _0205BA3E
	mov r0, #1
	bx lr
_0205BA3E:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205BA30

	thumb_func_start sub_0205BA44
sub_0205BA44: ; 0x0205BA44
	cmp r0, #0x71
	beq _0205BA4C
	cmp r0, #0x72
	bne _0205BA50
_0205BA4C:
	mov r0, #1
	bx lr
_0205BA50:
	mov r0, #0
	bx lr
	thumb_func_end sub_0205BA44

	thumb_func_start sub_0205BA54
sub_0205BA54: ; 0x0205BA54
	cmp r0, #0x73
	bne _0205BA5C
	mov r0, #1
	bx lr
_0205BA5C:
	mov r0, #0
	bx lr
	thumb_func_end sub_0205BA54

	thumb_func_start sub_0205BA60
sub_0205BA60: ; 0x0205BA60
	cmp r0, #0xff
	bne _0205BA68
	mov r0, #1
	bx lr
_0205BA68:
	mov r0, #0
	bx lr
	thumb_func_end sub_0205BA60

	thumb_func_start sub_0205BA6C
sub_0205BA6C: ; 0x0205BA6C
	mov r0, #0xff
	bx lr
	thumb_func_end sub_0205BA6C

	thumb_func_start sub_0205BA70
sub_0205BA70: ; 0x0205BA70
	add r0, #0xe3
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	mov r3, #0
	cmp r0, #0x10
	bhi _0205BA8A
	mov r1, #1
	add r2, r1, #0
	lsl r2, r0
	ldr r0, _0205BA90 ; =0x00010009
	tst r0, r2
	beq _0205BA8A
	add r3, r1, #0
_0205BA8A:
	add r0, r3, #0
	bx lr
	nop
_0205BA90: .word 0x00010009
	thumb_func_end sub_0205BA70

	thumb_func_start sub_0205BA94
sub_0205BA94: ; 0x0205BA94
	cmp r0, #0xa9
	bne _0205BA9C
	mov r0, #1
	bx lr
_0205BA9C:
	mov r0, #0
	bx lr
	thumb_func_end sub_0205BA94

	thumb_func_start sub_0205BAA0
sub_0205BAA0: ; 0x0205BAA0
	cmp r0, #0x3c
	bne _0205BAA8
	mov r0, #1
	bx lr
_0205BAA8:
	mov r0, #0
	bx lr
	thumb_func_end sub_0205BAA0

	thumb_func_start sub_0205BAAC
sub_0205BAAC: ; 0x0205BAAC
	cmp r0, #0x3d
	bne _0205BAB4
	mov r0, #1
	bx lr
_0205BAB4:
	mov r0, #0
	bx lr
	thumb_func_end sub_0205BAAC

	thumb_func_start sub_0205BAB8
sub_0205BAB8: ; 0x0205BAB8
	cmp r0, #0x3e
	bne _0205BAC0
	mov r0, #1
	bx lr
_0205BAC0:
	mov r0, #0
	bx lr
	thumb_func_end sub_0205BAB8

	thumb_func_start sub_0205BAC4
sub_0205BAC4: ; 0x0205BAC4
	cmp r0, #0x2c
	bne _0205BACC
	mov r0, #1
	bx lr
_0205BACC:
	mov r0, #0
	bx lr
	thumb_func_end sub_0205BAC4

	thumb_func_start sub_0205BAD0
sub_0205BAD0: ; 0x0205BAD0
	cmp r0, #0
	beq _0205BADC
	cmp r0, #0x21
	beq _0205BADC
	cmp r0, #0xa4
	bne _0205BAE0
_0205BADC:
	mov r0, #1
	bx lr
_0205BAE0:
	mov r0, #0
	bx lr
	thumb_func_end sub_0205BAD0

	thumb_func_start sub_0205BAE4
sub_0205BAE4: ; 0x0205BAE4
	ldr r3, _0205BAE8 ; =sub_0205B778
	bx r3
	.balign 4, 0
_0205BAE8: .word sub_0205B778
	thumb_func_end sub_0205BAE4

	thumb_func_start sub_0205BAEC
sub_0205BAEC: ; 0x0205BAEC
	cmp r0, #0x23
	bne _0205BAF4
	mov r0, #1
	bx lr
_0205BAF4:
	mov r0, #0
	bx lr
	thumb_func_end sub_0205BAEC

	thumb_func_start sub_0205BAF8
sub_0205BAF8: ; 0x0205BAF8
	cmp r0, #6
	bne _0205BB00
	mov r0, #1
	bx lr
_0205BB00:
	mov r0, #0
	bx lr
	thumb_func_end sub_0205BAF8

	thumb_func_start sub_0205BB04
sub_0205BB04: ; 0x0205BB04
	push {r4, lr}
	add r4, r0, #0
	bl sub_0205BA44
	cmp r0, #0
	bne _0205BB14
	cmp r4, #0x2e
	bne _0205BB18
_0205BB14:
	mov r0, #1
	pop {r4, pc}
_0205BB18:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end sub_0205BB04
