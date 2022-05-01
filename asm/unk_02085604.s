#include "constants/items.h"
#include "constants/moves.h"
#include "constants/pokemon.h"
#include "constants/ribbon.h"
#include "constants/party_menu.h"
#include "msgdata/msg/msg_0300.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.public _020FA484
	.public gNatureStatMods

	.text

	thumb_func_start sub_02085604
sub_02085604: ; 0x02085604
	push {r3, r4}
	mov r2, #0xb5
	lsl r2, r2, #2
	ldr r4, [r0, r2]
	add r3, r2, #4
	str r4, [r0, r3]
	str r1, [r0, r2]
	add r1, r2, #0
	mov r3, #0
	add r1, #8
	str r3, [r0, r1]
	add r1, r2, #0
	add r1, #0xc
	str r3, [r0, r1]
	add r1, r2, #0
	add r1, #0x10
	str r3, [r0, r1]
	add r1, r2, #0
	add r1, #0x14
	str r3, [r0, r1]
	ldr r1, [r0, r2]
	cmp r1, #0
	beq _02085656
	sub r1, r1, #1
	lsl r1, r1, #2
	add r3, r0, r1
	add r1, r2, #0
	sub r1, #0x2a
	ldrh r3, [r3, r1]
	add r1, r2, #0
	add r1, #8
	str r3, [r0, r1]
	ldr r1, [r0, r2]
	sub r1, r1, #1
	lsl r1, r1, #2
	add r3, r0, r1
	add r1, r2, #0
	sub r1, #0x28
	ldrh r1, [r3, r1]
	add r2, #0xc
	str r1, [r0, r2]
_02085656:
	mov r2, #0xb6
	lsl r2, r2, #2
	ldr r1, [r0, r2]
	cmp r1, #0
	beq _02085684
	sub r1, r1, #1
	lsl r1, r1, #2
	add r3, r0, r1
	add r1, r2, #0
	sub r1, #0x2e
	ldrh r3, [r3, r1]
	add r1, r2, #0
	add r1, #0xc
	str r3, [r0, r1]
	ldr r1, [r0, r2]
	sub r1, r1, #1
	lsl r1, r1, #2
	add r3, r0, r1
	add r1, r2, #0
	sub r1, #0x2c
	ldrh r1, [r3, r1]
	add r2, #0x10
	str r1, [r0, r2]
_02085684:
	pop {r3, r4}
	bx lr
	thumb_func_end sub_02085604

	thumb_func_start sub_02085688
sub_02085688: ; 0x02085688
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	mov r0, #0xdd
	lsl r0, r0, #2
	mov r1, #1
	str r1, [r4, r0]
	add r7, r0, #0
	mov r5, #0
	mov r1, #0xab
	add r3, r5, #0
	add r6, r4, #0
	sub r7, #0xca
	add r0, #0x48
	lsl r1, r1, #2
_020856A4:
	strh r5, [r6, r7]
	ldr r2, [r6, r0]
	add r3, r3, #1
	add r2, r5, r2
	lsl r2, r2, #0x10
	lsr r5, r2, #0x10
	strh r5, [r6, r1]
	add r6, r6, #4
	cmp r3, #5
	blt _020856A4
	mov r1, #0xf7
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	add r0, r4, #0
	add r1, r1, #1
	bl sub_02085604
	mov r1, #0xfb
	lsl r1, r1, #2
	mov r0, #0x2d
	add r7, r1, #0
	mov r6, #0
	add r5, r4, #0
	lsl r0, r0, #4
	sub r7, #0x30
_020856D6:
	ldr r3, [r5, r7]
	cmp r3, #0
	beq _020856F0
	ldr r2, [r4, r0]
	add r6, r6, #1
	add r2, r2, r3
	str r2, [r4, r0]
	ldr r2, [r4, r1]
	add r5, r5, #4
	add r2, r2, #1
	str r2, [r4, r1]
	cmp r6, #4
	blt _020856D6
_020856F0:
	mov r0, #0xfb
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	ldr r7, _02085804 ; =0x000002A2
	sub r1, r1, #1
	str r1, [r4, r0]
	mov r1, #0x2d
	lsl r1, r1, #4
	ldr r2, [r4, r1]
	ldr r0, [r4, r0]
	sub r1, #0x30
	add r0, r2, r0
	lsl r2, r0, #3
	lsr r0, r2, #0x1f
	add r0, r2, r0
	asr r2, r0, #1
	mov r0, #0x70
	sub r0, r0, r2
	strh r0, [r4, r1]
	mov r6, #0
	add r3, r4, #0
	add r5, r4, #0
_0208571C:
	mov r0, #0xef
	lsl r0, r0, #2
	ldr r2, [r3, r0]
	add r0, #0x30
	ldr r0, [r4, r0]
	add r6, r6, #1
	lsl r1, r0, #3
	mov r0, #0x2d
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	add r3, r3, #4
	sub r0, r0, r2
	lsl r0, r0, #3
	lsl r2, r2, #5
	add r0, r0, r2
	add r1, r1, r0
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r1, r0, #1
	mov r0, #0x70
	sub r0, r0, r1
	strh r0, [r5, r7]
	add r5, r5, #2
	cmp r6, #4
	blt _0208571C
	ldr r0, _02085804 ; =0x000002A2
	ldrsh r1, [r4, r0]
	add r1, #0xc
	strh r1, [r4, r0]
	mov r1, #0xfb
	lsl r1, r1, #2
	mov r0, #0
	ldr r1, [r4, r1]
	add r3, r0, #0
	cmp r1, #0
	ble _02085788
	mov r7, #7
	mov r6, #0xfb
	add r1, r4, #0
	add r2, r4, #0
	lsl r7, r7, #6
	lsl r6, r6, #2
_02085770:
	mov r5, #0xef
	lsl r5, r5, #2
	ldr r5, [r1, r5]
	add r3, r3, #1
	add r0, r0, r5
	sub r5, r0, #1
	str r5, [r2, r7]
	ldr r5, [r4, r6]
	add r1, r1, #4
	add r2, #0x1c
	cmp r3, r5
	blt _02085770
_02085788:
	mov r3, #0
	mov ip, r3
	str r4, [sp]
	add r2, r4, #0
_02085790:
	mov r1, #0xef
	ldr r5, [sp]
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	mov r0, #0
	cmp r1, #0
	ble _020857BE
	mov r5, ip
	lsl r5, r5, #2
	add r7, r4, r5
	mov r5, ip
	add r1, r2, #0
	add r6, r5, #1
_020857AA:
	mov r5, #0xef
	str r6, [r1, #4]
	lsl r5, r5, #2
	ldr r5, [r7, r5]
	add r0, r0, #1
	add r1, #0x1c
	add r2, #0x1c
	add r3, r3, #1
	cmp r0, r5
	blt _020857AA
_020857BE:
	ldr r0, [sp]
	add r0, r0, #4
	str r0, [sp]
	mov r0, ip
	add r0, r0, #1
	mov ip, r0
	mov r0, #0x2d
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	cmp r3, r0
	blt _02085790
	mov r0, #0xf7
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	cmp r0, #0
	ble _02085800
	mov r5, #0x3f
	lsl r5, r5, #4
	add r2, r5, #0
	add r3, r5, #0
	add r0, r4, #0
	sub r2, #0x34
	sub r3, #0x14
_020857EE:
	ldr r6, [r0, r2]
	ldr r7, [r4, r5]
	add r1, r1, #1
	add r6, r7, r6
	str r6, [r4, r5]
	ldr r6, [r4, r3]
	add r0, r0, #4
	cmp r1, r6
	blt _020857EE
_02085800:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02085804: .word 0x000002A2
	thumb_func_end sub_02085688

	thumb_func_start sub_02085808
sub_02085808: ; 0x02085808
	mov r2, #0xb
	lsl r2, r2, #6
	str r1, [r0, r2]
	mov r3, #0
	add r1, r2, #4
	str r3, [r0, r1]
	add r1, r2, #0
	add r1, #8
	str r3, [r0, r1]
	add r2, #0xc
	str r3, [r0, r2]
	bx lr
	thumb_func_end sub_02085808

	thumb_func_start sub_02085820
sub_02085820: ; 0x02085820
	push {r3, r4, r5, lr}
	sub sp, #0x18
	add r5, r0, #0
	bl sub_02086490
	add r0, r5, #0
	bl sub_02086DA4
	add r0, r5, #0
	bl sub_02086758
	add r0, r5, #0
	mov r1, #0
	bl sub_02086DE4
	add r0, r5, #0
	bl sub_020868A0
	add r0, r5, #0
	bl sub_020869BC
	add r0, r5, #0
	bl sub_02086F44
	add r0, r5, #0
	bl sub_02086FCC
	add r0, r5, #0
	bl sub_02087064
	mov r0, #0x15
	str r0, [sp]
	mov r0, #0x1b
	str r0, [sp, #4]
	mov r3, #2
	mov r1, #0xf9
	str r3, [sp, #8]
	mov r0, #0x64
	lsl r1, r1, #2
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	mov r2, #4
	str r0, [sp, #0x10]
	add r0, r1, #0
	sub r0, #0xec
	sub r1, #0x48
	ldr r0, [r5, r0]
	add r1, r5, r1
	bl sub_020871C4
	mov r0, #0xfa
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _020858B8
	mov r0, #0x6c
	bl sub_0203A4AC
	add r1, sp, #0x14
	add r4, r0, #0
	bl NNS_G2dGetUnpackedPaletteData
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0xbf
	ldr r1, [sp, #0x14]
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [r1, #0xc]
	mov r2, #3
	mov r3, #0xe0
	bl PaletteData_LoadPalette
	add r0, r4, #0
	bl FreeToHeap
_020858B8:
	add r0, r5, #0
	mov r1, #1
	bl sub_02085808
	mov r0, #6
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #0x6c
	str r0, [sp, #8]
	mov r0, #0
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r0, #0
	add sp, #0x18
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02085820

	thumb_func_start sub_020858DC
sub_020858DC: ; 0x020858DC
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	mov r0, #0xb2
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _020858F2
	cmp r0, #1
	beq _02085916
	b _0208592A
_020858F2:
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x6c
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r0, #0xb2
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	b _02085930
_02085916:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _02085930
	mov r0, #0xb2
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	b _02085930
_0208592A:
	add sp, #0xc
	mov r0, #1
	pop {r3, r4, pc}
_02085930:
	mov r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end sub_020858DC

	thumb_func_start sub_02085938
sub_02085938: ; 0x02085938
	push {r4, lr}
	mov r1, #0xb2
	add r4, r0, #0
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	cmp r1, #0
	bne _0208595A
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _0208596E
	mov r0, #0xb2
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	b _0208596E
_0208595A:
	bl sub_02086328
	mov r0, #3
	lsl r0, r0, #8
	ldr r0, [r4, r0]
	bl sub_02026CC4
	add r0, r4, #0
	bl sub_02085C20
_0208596E:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02085938

	thumb_func_start sub_02085974
sub_02085974: ; 0x02085974
	push {r3, r4, r5, r6, r7, lr}
	mov r1, #0xb2
	add r5, r0, #0
	lsl r1, r1, #2
	ldr r2, [r5, r1]
	cmp r2, #0
	beq _0208598A
	cmp r2, #1
	bne _02085988
	b _02085AF0
_02085988:
	b _02085B84
_0208598A:
	mov r1, #0
	add r2, r1, #0
	bl sub_02086AB4
	mov r0, #0x2d
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r6, #0
	cmp r0, #0
	ble _02085A1C
	ldr r7, _02085BE0 ; =_0211055C
	add r4, r5, #0
_020859A2:
	ldrb r0, [r4, #0x18]
	cmp r0, #0
	beq _02085A0E
	mov r1, #0x14
	mov r2, #0x16
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	bl sub_0200DED0
	ldrb r0, [r4, #0x18]
	sub r0, r0, #1
	strb r0, [r4, #0x18]
	mov r0, #0xb7
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	cmp r6, r0
	blt _020859E4
	mov r0, #0x2e
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	cmp r6, r0
	bge _020859E4
	ldrb r0, [r4, #0x19]
	lsl r1, r0, #2
	ldr r1, [r7, r1]
	ldr r0, [r4, #0xc]
	add r2, r1, #0
	bl sub_0200E024
	ldrb r0, [r4, #0x19]
	add r0, r0, #1
	strb r0, [r4, #0x19]
_020859E4:
	mov r0, #0xb9
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	cmp r6, r0
	blt _02085A0E
	mov r0, #0xba
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	cmp r6, r0
	bge _02085A0E
	ldrb r0, [r4, #0x19]
	ldr r1, _02085BE4 ; =_02110578
	lsl r2, r0, #2
	ldr r1, [r1, r2]
	ldr r0, [r4, #0xc]
	add r2, r1, #0
	bl sub_0200E024
	ldrb r0, [r4, #0x19]
	add r0, r0, #1
	strb r0, [r4, #0x19]
_02085A0E:
	mov r0, #0x2d
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	add r6, r6, #1
	add r4, #0x1c
	cmp r6, r0
	blt _020859A2
_02085A1C:
	mov r0, #0xfb
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r6, #0
	cmp r0, #0
	ble _02085A64
	mov r7, #0x76
	add r4, r5, #0
	lsl r7, r7, #2
_02085A2E:
	ldrb r0, [r4, r7]
	cmp r0, #0
	beq _02085A56
	mov r1, #0x75
	ldr r2, _02085BE8 ; =0x000001D6
	mov r0, #0x73
	lsl r1, r1, #2
	lsl r0, r0, #2
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r4, r0]
	bl sub_0200DED0
	mov r0, #0x76
	lsl r0, r0, #2
	ldrb r0, [r4, r0]
	sub r1, r0, #1
	mov r0, #0x76
	lsl r0, r0, #2
	strb r1, [r4, r0]
_02085A56:
	mov r0, #0xfb
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r6, r6, #1
	add r4, #0x1c
	cmp r6, r0
	blt _02085A2E
_02085A64:
	ldrb r0, [r5, #0x18]
	cmp r0, #0
	bne _02085AE4
	mov r0, #0xb7
	lsl r0, r0, #2
	ldr r6, [r5, r0]
	add r0, r0, #4
	ldr r0, [r5, r0]
	cmp r6, r0
	bge _02085AA2
	mov r0, #0x1c
	mul r0, r6
	mov r7, #0x2e
	add r4, r5, r0
	lsl r7, r7, #4
_02085A82:
	ldr r0, [r4]
	ldr r1, [r4, #8]
	bl sub_02086D98
	add r1, r0, #0
	ldr r0, [r4, #0xc]
	bl sub_0200DC4C
	ldr r0, [r4, #0xc]
	bl sub_0200DC18
	ldr r0, [r5, r7]
	add r6, r6, #1
	add r4, #0x1c
	cmp r6, r0
	blt _02085A82
_02085AA2:
	mov r0, #0xb9
	lsl r0, r0, #2
	ldr r6, [r5, r0]
	add r0, r0, #4
	ldr r0, [r5, r0]
	cmp r6, r0
	bge _02085ADA
	mov r0, #0x1c
	mul r0, r6
	mov r7, #0xba
	add r4, r5, r0
	lsl r7, r7, #2
_02085ABA:
	ldr r0, [r4]
	ldr r1, [r4, #8]
	bl sub_02086D98
	add r1, r0, #0
	ldr r0, [r4, #0xc]
	bl sub_0200DC4C
	ldr r0, [r4, #0xc]
	bl sub_0200DC18
	ldr r0, [r5, r7]
	add r6, r6, #1
	add r4, #0x1c
	cmp r6, r0
	blt _02085ABA
_02085ADA:
	mov r0, #0xb2
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	add r1, r1, #1
	str r1, [r5, r0]
_02085AE4:
	mov r0, #0xb3
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	add r1, r1, #1
	str r1, [r5, r0]
	b _02085BDA
_02085AF0:
	add r0, r1, #0
	add r0, #0x14
	add r1, #0x18
	ldr r6, [r5, r0]
	ldr r0, [r5, r1]
	cmp r6, r0
	bge _02085B2C
	mov r0, #0x1c
	mul r0, r6
	ldr r7, _02085BE0 ; =_0211055C
	add r4, r5, r0
_02085B06:
	ldrb r0, [r4, #0x19]
	cmp r0, #6
	beq _02085B1E
	lsl r1, r0, #2
	ldr r1, [r7, r1]
	ldr r0, [r4, #0xc]
	add r2, r1, #0
	bl sub_0200E024
	ldrb r0, [r4, #0x19]
	add r0, r0, #1
	strb r0, [r4, #0x19]
_02085B1E:
	mov r0, #0x2e
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	add r6, r6, #1
	add r4, #0x1c
	cmp r6, r0
	blt _02085B06
_02085B2C:
	mov r0, #0xb9
	lsl r0, r0, #2
	ldr r6, [r5, r0]
	add r0, r0, #4
	ldr r0, [r5, r0]
	cmp r6, r0
	bge _02085B68
	mov r0, #0x1c
	mul r0, r6
	ldr r7, _02085BE4 ; =_02110578
	add r4, r5, r0
_02085B42:
	ldrb r0, [r4, #0x19]
	cmp r0, #6
	beq _02085B5A
	lsl r1, r0, #2
	ldr r1, [r7, r1]
	ldr r0, [r4, #0xc]
	add r2, r1, #0
	bl sub_0200E024
	ldrb r0, [r4, #0x19]
	add r0, r0, #1
	strb r0, [r4, #0x19]
_02085B5A:
	mov r0, #0xba
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r6, r6, #1
	add r4, #0x1c
	cmp r6, r0
	blt _02085B42
_02085B68:
	mov r1, #0xb3
	lsl r1, r1, #2
	ldr r0, [r5, r1]
	add r0, r0, #1
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	cmp r0, #6
	bne _02085BDA
	sub r0, r1, #4
	ldr r0, [r5, r0]
	add r2, r0, #1
	sub r0, r1, #4
	str r2, [r5, r0]
	b _02085BDA
_02085B84:
	bl sub_02086F44
	mov r1, #0xed
	lsl r1, r1, #2
	ldr r0, [r5, r1]
	cmp r0, #0
	bne _02085BA6
	sub r1, r1, #4
	ldr r1, [r5, r1]
	add r0, r5, #0
	bl sub_02086398
	add r1, r0, #0
	add r0, r5, #0
	bl sub_02086AE4
	b _02085BB8
_02085BA6:
	sub r1, r1, #4
	ldr r1, [r5, r1]
	add r0, r5, #0
	bl sub_020863C0
	add r1, r0, #0
	add r0, r5, #0
	bl sub_02086AE4
_02085BB8:
	mov r0, #0xb5
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _02085BCC
	add r0, r5, #0
	mov r1, #0
	mov r2, #1
	bl sub_02086AB4
_02085BCC:
	add r0, r5, #0
	bl sub_02086384
	add r0, r5, #0
	mov r1, #1
	bl sub_02085808
_02085BDA:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02085BE0: .word _0211055C
_02085BE4: .word _02110578
_02085BE8: .word 0x000001D6
	thumb_func_end sub_02085974

	thumb_func_start sub_02085BEC
sub_02085BEC: ; 0x02085BEC
	push {r3, r4, r5, lr}
	mov r1, #0xb
	add r5, r0, #0
	lsl r1, r1, #6
	ldr r1, [r5, r1]
	lsl r2, r1, #2
	ldr r1, _02085C1C ; =_0210271C
	ldr r1, [r1, r2]
	blx r1
	add r4, r0, #0
	add r0, r5, #0
	bl sub_02086BB4
	add r0, r5, #0
	bl sub_02086C8C
	mov r0, #0xbd
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_0200D020
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_02085C1C: .word _0210271C
	thumb_func_end sub_02085BEC

	thumb_func_start sub_02085C20
sub_02085C20: ; 0x02085C20
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x40
	ldr r5, _02085F00 ; =_0210272C
	add r4, r0, #0
	add r3, sp, #4
	mov r2, #7
_02085C2C:
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _02085C2C
	ldr r0, [r5]
	mov r1, #0x14
	str r0, [r3]
	mov r3, #0x91
	lsl r3, r3, #2
	add r0, r3, #2
	ldrsh r0, [r4, r0]
	ldrsh r7, [r4, r3]
	mov r6, #0
	mov ip, r0
	mul r1, r0
	add r0, sp, #4
	lsl r2, r7, #2
	add r0, r0, r1
	ldr r5, [r2, r0]
	add r0, r3, #0
	add r0, #0x7c
	ldr r0, [r4, r0]
	cmp r0, #1
	bne _02085C80
	mov r2, #0xeb
	lsl r2, r2, #2
	ldr r0, [r4, r2]
	cmp r0, #1
	beq _02085C80
	add r0, r2, #0
	sub r0, #0x38
	ldr r0, [r4, r0]
	cmp r0, #1
	bne _02085CBC
	ldr r0, _02085F04 ; =gSystem
	ldr r0, [r0, #0x48]
	cmp r0, #0
	beq _02085C80
	bl System_GetTouchHeld
	cmp r0, #0
	beq _02085C82
_02085C80:
	b _02085F78
_02085C82:
	mov r0, #0xdd
	add r1, r6, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, r4, #0
	add r1, r5, #0
	bl sub_02086B2C
	sub r5, #0xa
	cmp r5, #1
	bhi _02085CAA
	mov r0, #0x23
	lsl r0, r0, #4
	ldr r1, [r4, r0]
	cmp r1, #2
	beq _02085D8C
	mov r1, #2
	add sp, #0x40
	str r1, [r4, r0]
	pop {r3, r4, r5, r6, r7, pc}
_02085CAA:
	mov r0, #0x23
	lsl r0, r0, #4
	ldr r1, [r4, r0]
	cmp r1, #1
	beq _02085D8C
	mov r1, #1
	add sp, #0x40
	str r1, [r4, r0]
	pop {r3, r4, r5, r6, r7, pc}
_02085CBC:
	ldr r0, _02085F04 ; =gSystem
	mov r1, #0x40
	ldr r0, [r0, #0x4c]
	tst r1, r0
	beq _02085CDE
	mov r0, ip
	cmp r0, #0
	ble _02085CD4
	add r0, r3, #2
	ldrsh r0, [r4, r0]
	sub r1, r0, #1
	b _02085CD6
_02085CD4:
	mov r1, #2
_02085CD6:
	add r0, r3, #2
	strh r1, [r4, r0]
	mov r6, #1
	b _02085F2A
_02085CDE:
	mov r1, #0x80
	tst r1, r0
	beq _02085CFE
	add r0, r3, #2
	ldrsh r0, [r4, r0]
	add r1, r0, #1
	add r0, r3, #2
	strh r1, [r4, r0]
	ldrsh r0, [r4, r0]
	mov r1, #3
	bl _s32_div_f
	ldr r0, _02085F08 ; =0x00000246
	mov r6, #1
	strh r1, [r4, r0]
	b _02085F2A
_02085CFE:
	mov r1, #0x10
	tst r1, r0
	beq _02085D2C
	cmp r5, #0xa
	bne _02085D0E
	mov r0, #3
	strh r0, [r4, r3]
	b _02085D28
_02085D0E:
	cmp r5, #0xb
	bne _02085D16
	strh r6, [r4, r3]
	b _02085D28
_02085D16:
	add r0, r7, #1
	strh r0, [r4, r3]
	ldrsh r0, [r4, r3]
	mov r1, #5
	bl _s32_div_f
	mov r0, #0x91
	lsl r0, r0, #2
	strh r1, [r4, r0]
_02085D28:
	mov r6, #1
	b _02085F2A
_02085D2C:
	mov r1, #0x20
	tst r1, r0
	beq _02085D56
	cmp r5, #0xa
	bne _02085D3C
	mov r0, #3
	strh r0, [r4, r3]
	b _02085D52
_02085D3C:
	cmp r5, #0xb
	bne _02085D44
	strh r6, [r4, r3]
	b _02085D52
_02085D44:
	cmp r7, #0
	ble _02085D4E
	sub r0, r7, #1
	strh r0, [r4, r3]
	b _02085D52
_02085D4E:
	mov r0, #4
	strh r0, [r4, r3]
_02085D52:
	mov r6, #1
	b _02085F2A
_02085D56:
	ldr r1, _02085F04 ; =gSystem
	ldr r7, [r1, #0x48]
	mov r1, #1
	tst r1, r7
	beq _02085E3C
	cmp r5, #0xa
	bne _02085D72
	add r0, r4, #0
	bl sub_02085FFC
	ldr r0, _02085F0C ; =0x000005E5
	bl PlaySE
	b _02085F2A
_02085D72:
	cmp r5, #0xb
	bne _02085D84
	add r0, r4, #0
	bl sub_02085F80
	ldr r0, _02085F10 ; =0x000005E2
	bl PlaySE
	b _02085F2A
_02085D84:
	sub r2, #0xd8
	ldr r0, [r4, r2]
	cmp r0, #0
	bne _02085D8E
_02085D8C:
	b _02085F78
_02085D8E:
	sub r3, #0x30
	ldr r0, [r4, r3]
	mov r1, #0x1c
	add r7, r0, #0
	str r0, [sp]
	mul r7, r1
	add r0, r5, #1
	str r0, [r4, r7]
	add r0, r4, #0
	mov r1, #1
	add r2, r6, #0
	bl sub_02086AB4
	add r0, r4, #0
	mov r1, #2
	mov r2, #1
	bl sub_02086AB4
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #2
	bl sub_02086B6C
	add r1, r4, r7
	ldr r0, [r4, r7]
	ldr r1, [r1, #8]
	bl sub_02086D98
	add r1, r0, #0
	add r0, r4, r7
	ldr r0, [r0, #0xc]
	bl sub_0200DC4C
	mov r0, #0x96
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #3
	bl sub_0200DC4C
	add r0, r4, r7
	ldr r3, [r0, #4]
	ldr r0, [sp]
	add r2, r0, #1
	mov r0, #0x2d
	lsl r0, r0, #4
	ldr r1, [r4, r0]
	cmp r2, r1
	bne _02085E0E
	add r1, r0, #0
	mov r6, #1
	add r1, #0xdc
	str r6, [r4, r1]
	add r1, r0, #0
	mov r2, #0
	add r1, #0xe0
	str r2, [r4, r1]
	add r1, r0, #0
	mov r2, #3
	sub r1, #0x8c
	strh r2, [r4, r1]
	mov r1, #2
	sub r0, #0x8a
	strh r1, [r4, r0]
	b _02085F2A
_02085E0E:
	mov r1, #0x1c
	mul r1, r2
	add r1, r4, r1
	ldr r1, [r1, #4]
	cmp r3, r1
	beq _02085E28
	add r2, r0, #0
	mov r3, #1
	add r2, #0xdc
	str r3, [r4, r2]
	add r0, #0xe0
	str r1, [r4, r0]
	b _02085E34
_02085E28:
	add r1, r0, #0
	mov r3, #2
	add r1, #0xdc
	str r3, [r4, r1]
	add r0, #0xe0
	str r2, [r4, r0]
_02085E34:
	ldr r0, _02085F0C ; =0x000005E5
	bl PlaySE
	b _02085F2A
_02085E3C:
	mov r1, #2
	add r5, r7, #0
	tst r5, r1
	beq _02085E52
	add r0, r4, #0
	bl sub_02085FFC
	ldr r0, _02085F0C ; =0x000005E5
	bl PlaySE
	b _02085F2A
_02085E52:
	lsl r5, r1, #8
	tst r5, r0
	beq _02085EB6
	add r0, r3, #0
	sub r0, #0x30
	ldr r1, [r4, r0]
	add r0, r2, #0
	add r0, #0x44
	ldr r0, [r4, r0]
	cmp r1, r0
	bne _02085E6E
	sub r2, #0xdc
	ldr r0, [r4, r2]
	b _02085E74
_02085E6E:
	add r0, r3, #0
	sub r0, #0x30
	ldr r0, [r4, r0]
_02085E74:
	sub r0, r0, #1
	sub r3, #0x30
	str r0, [r4, r3]
	mov r0, #0x85
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x1c
	mul r1, r0
	add r2, r4, r1
	ldr r1, [r2, #8]
	cmp r1, #1
	bne _02085E9A
	mov r1, #0xeb
	mov r2, #2
	lsl r1, r1, #2
	str r2, [r4, r1]
	add r1, r1, #4
	str r0, [r4, r1]
	b _02085EAC
_02085E9A:
	mov r1, #0xeb
	lsl r1, r1, #2
	mov r3, #1
	str r3, [r4, r1]
	add r0, r1, #4
	ldr r2, [r2, #4]
	add r1, #8
	str r2, [r4, r0]
	str r3, [r4, r1]
_02085EAC:
	mov r0, #0x5e
	lsl r0, r0, #4
	bl PlaySE
	b _02085F2A
_02085EB6:
	add r1, #0xfe
	tst r0, r1
	beq _02085F2A
	add r1, r2, #0
	add r0, r3, #0
	sub r1, #0xdc
	sub r0, #0x30
	ldr r1, [r4, r1]
	ldr r0, [r4, r0]
	sub r1, r1, #1
	cmp r0, r1
	bne _02085ED4
	add r2, #0x44
	ldr r0, [r4, r2]
	b _02085EDC
_02085ED4:
	add r0, r3, #0
	sub r0, #0x30
	ldr r0, [r4, r0]
	add r0, r0, #1
_02085EDC:
	sub r3, #0x30
	str r0, [r4, r3]
	mov r0, #0x85
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x1c
	mul r1, r0
	add r2, r4, r1
	ldr r1, [r2, #8]
	cmp r1, #1
	bne _02085F14
	mov r1, #0xeb
	mov r2, #2
	lsl r1, r1, #2
	str r2, [r4, r1]
	add r1, r1, #4
	str r0, [r4, r1]
	b _02085F22
	.balign 4, 0
_02085F00: .word _0210272C
_02085F04: .word gSystem
_02085F08: .word 0x00000246
_02085F0C: .word 0x000005E5
_02085F10: .word 0x000005E2
_02085F14:
	mov r0, #0xeb
	mov r1, #1
	lsl r0, r0, #2
	str r1, [r4, r0]
	ldr r1, [r2, #4]
	add r0, r0, #4
	str r1, [r4, r0]
_02085F22:
	mov r0, #0x5e
	lsl r0, r0, #4
	bl PlaySE
_02085F2A:
	cmp r6, #1
	bne _02085F78
	mov r0, #0x5e
	lsl r0, r0, #4
	bl PlaySE
	ldr r1, _02085F7C ; =0x00000246
	mov r0, #0x14
	ldrsh r2, [r4, r1]
	sub r1, r1, #2
	ldrsh r1, [r4, r1]
	mul r0, r2
	add r2, sp, #4
	lsl r1, r1, #2
	add r0, r2, r0
	ldr r5, [r1, r0]
	add r0, r4, #0
	add r1, r5, #0
	bl sub_02086B2C
	sub r5, #0xa
	cmp r5, #1
	bhi _02085F6A
	mov r0, #0x23
	lsl r0, r0, #4
	ldr r1, [r4, r0]
	cmp r1, #2
	beq _02085F78
	mov r1, #2
	add sp, #0x40
	str r1, [r4, r0]
	pop {r3, r4, r5, r6, r7, pc}
_02085F6A:
	mov r0, #0x23
	lsl r0, r0, #4
	ldr r1, [r4, r0]
	cmp r1, #1
	beq _02085F78
	mov r1, #1
	str r1, [r4, r0]
_02085F78:
	add sp, #0x40
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02085F7C: .word 0x00000246
	thumb_func_end sub_02085C20

	thumb_func_start sub_02085F80
sub_02085F80: ; 0x02085F80
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	mov r0, #0x64
	mov r1, #0x6c
	bl String_ctor
	mov r1, #0xa1
	add r7, r0, #0
	mov r0, #1
	lsl r1, r1, #2
	str r0, [r6, r1]
	add r0, r1, #0
	mov r4, #0
	add r0, #0x18
	add r1, #0x4c
	strb r4, [r6, r0]
	ldr r0, [r6, r1]
	cmp r0, #0
	ble _02085FEC
	add r5, r6, #0
_02085FA8:
	ldr r0, [r5]
	cmp r0, #0
	bne _02085FC0
	mov r0, #1
	str r0, [r5]
	ldr r1, [r5, #8]
	bl sub_02086D98
	add r1, r0, #0
	ldr r0, [r5, #0xc]
	bl sub_0200DC4C
_02085FC0:
	mov r0, #1
	str r0, [sp]
	ldr r1, [r5]
	mov r2, #1
	add r0, r7, #0
	sub r1, r1, #1
	add r3, r2, #0
	bl String16_FormatInteger
	mov r0, #0xf5
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	add r1, r7, #0
	bl StringCat
	mov r0, #0x2d
	lsl r0, r0, #4
	ldr r0, [r6, r0]
	add r4, r4, #1
	add r5, #0x1c
	cmp r4, r0
	blt _02085FA8
_02085FEC:
	add r0, r7, #0
	bl String_dtor
	add r0, r6, #0
	mov r1, #3
	bl sub_02085808
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02085F80

	thumb_func_start sub_02085FFC
sub_02085FFC: ; 0x02085FFC
	push {r3, r4, r5, r6, r7, lr}
	mov r2, #0x9a
	lsl r2, r2, #2
	add r5, r0, #0
	mov r1, #1
	add r3, r2, #0
	str r1, [r5, r2]
	mov r0, #0
	add r3, #0x18
	strb r0, [r5, r3]
	add r3, r2, #0
	add r3, #0x6c
	ldr r3, [r5, r3]
	cmp r3, #0
	bne _02086044
	add r0, r2, #0
	add r0, #0x68
	ldr r0, [r5, r0]
	sub r3, r0, #1
	add r0, r2, #0
	sub r0, #0x54
	str r3, [r5, r0]
	sub r2, #0x54
	ldr r2, [r5, r2]
	mov r0, #0x1c
	mul r0, r2
	add r0, r5, r0
	mov r2, #0xeb
	ldr r3, [r0, #4]
	lsl r2, r2, #2
	str r1, [r5, r2]
	add r0, r2, #4
	str r3, [r5, r0]
	add r2, #8
	str r1, [r5, r2]
	pop {r3, r4, r5, r6, r7, pc}
_02086044:
	sub r2, #0x54
	ldr r6, [r5, r2]
	mov r1, #0x1c
	add r4, r6, #0
	mul r4, r1
	str r0, [r5, r4]
	add r1, r5, r4
	ldr r0, [r5, r4]
	ldr r1, [r1, #8]
	bl sub_02086D98
	add r1, r0, #0
	add r0, r5, r4
	ldr r0, [r0, #0xc]
	bl sub_0200DC4C
	add r0, r5, r4
	ldr r7, [r0, #4]
	mov r0, #0x3f
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	cmp r6, r0
	ble _020860B6
	sub r1, r6, #1
	mov r0, #0x1c
	add r4, r1, #0
	mul r4, r0
	add r1, r5, r4
	ldr r0, [r5, r4]
	ldr r1, [r1, #8]
	bl sub_02086D98
	add r1, r0, #0
	add r0, r5, r4
	ldr r0, [r0, #0xc]
	bl sub_0200DC4C
	add r0, r5, r4
	ldr r3, [r0, #4]
	cmp r7, r3
	beq _020860A8
	mov r1, #0xeb
	lsl r1, r1, #2
	mov r2, #1
	str r2, [r5, r1]
	add r0, r1, #4
	str r3, [r5, r0]
	add r1, #8
	str r2, [r5, r1]
	pop {r3, r4, r5, r6, r7, pc}
_020860A8:
	mov r0, #0xeb
	mov r1, #2
	lsl r0, r0, #2
	str r1, [r5, r0]
	sub r1, r6, #1
	add r0, r0, #4
	str r1, [r5, r0]
_020860B6:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02085FFC

	thumb_func_start sub_020860B8
sub_020860B8: ; 0x020860B8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x68
	str r0, [sp, #4]
	mov r2, #0xc1
	ldr r1, [sp, #4]
	lsl r2, r2, #2
	add r1, r1, r2
	ldr r2, [sp, #4]
	mov r0, #0
_020860CA:
	add r0, r0, #1
	str r1, [r2, #0x10]
	add r1, r1, #4
	add r2, #0x1c
	cmp r0, #0x10
	blt _020860CA
	ldr r4, _0208616C ; =_02102768
	add r3, sp, #8
	mov r2, #0x30
_020860DC:
	ldrh r1, [r4]
	add r4, r4, #2
	strh r1, [r3]
	add r3, r3, #2
	sub r2, r2, #1
	bne _020860DC
	cmp r0, #0x1c
	bge _0208614A
	add r2, sp, #8
	lsl r1, r0, #3
	add r1, r2, r1
	mov r7, #0x7f
	ldr r2, [sp, #4]
	lsl r3, r0, #2
	mvn r7, r7
	add r2, r2, r3
	ldr r4, _02086170 ; =0x00000307
	add r3, r7, #4
_02086100:
	mov r5, #0x7d
	mov r6, #0x79
	mvn r5, r5
	mvn r6, r6
	ldrsh r5, [r1, r5]
	ldrsh r6, [r1, r6]
	add r0, r0, #1
	sub r6, r5, r6
	mov r5, #0xc1
	lsl r5, r5, #2
	strb r6, [r2, r5]
	mov r5, #0x7f
	mov r6, #0x7b
	mvn r5, r5
	mvn r6, r6
	ldrsh r5, [r1, r5]
	ldrsh r6, [r1, r6]
	sub r6, r5, r6
	ldr r5, _02086174 ; =0x00000306
	strb r6, [r2, r5]
	mov r5, #0x7d
	mov r6, #0x79
	mvn r5, r5
	mvn r6, r6
	ldrsh r5, [r1, r5]
	ldrsh r6, [r1, r6]
	add r6, r5, r6
	ldr r5, _02086178 ; =0x00000305
	strb r6, [r2, r5]
	ldrsh r6, [r1, r7]
	ldrsh r5, [r1, r3]
	add r1, #8
	add r5, r6, r5
	strb r5, [r2, r4]
	add r2, r2, #4
	cmp r0, #0x1c
	blt _02086100
_0208614A:
	mov r0, #0x6c
	str r0, [sp]
	mov r1, #0xc1
	ldr r0, [sp, #4]
	lsl r1, r1, #2
	add r0, r0, r1
	ldr r2, _0208617C ; =sub_02086180
	ldr r3, [sp, #4]
	mov r1, #0x1c
	bl sub_02026C44
	mov r2, #3
	ldr r1, [sp, #4]
	lsl r2, r2, #8
	str r0, [r1, r2]
	add sp, #0x68
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0208616C: .word _02102768
_02086170: .word 0x00000307
_02086174: .word 0x00000306
_02086178: .word 0x00000305
_0208617C: .word sub_02086180
	thumb_func_end sub_020860B8

	thumb_func_start sub_02086180
sub_02086180: ; 0x02086180
	push {r3, r4, r5, r6, r7, lr}
	add r4, r2, #0
	mov r2, #0xb
	lsl r2, r2, #6
	add r5, r0, #0
	ldr r0, [r4, r2]
	cmp r0, #1
	bne _020861B4
	add r0, r2, #0
	add r0, #0xb4
	ldr r0, [r4, r0]
	cmp r0, #1
	beq _020861A0
	mov r0, #1
	add r2, #0xb4
	str r0, [r4, r2]
_020861A0:
	cmp r1, #0
	beq _020861A6
	b _0208631A
_020861A6:
	cmp r5, #0x10
	bhs _020861E6
	mov r1, #0x3f
	lsl r1, r1, #4
	ldr r0, [r4, r1]
	cmp r5, r0
	bhs _020861B6
_020861B4:
	b _0208631A
_020861B6:
	mov r0, #0x1c
	mul r0, r5
	add r3, r4, r0
	ldr r0, [r3, #8]
	cmp r0, #1
	bne _020861D0
	add r0, r1, #0
	mov r2, #2
	sub r0, #0x44
	str r2, [r4, r0]
	sub r1, #0x40
	str r5, [r4, r1]
	b _020861DE
_020861D0:
	add r0, r1, #0
	mov r2, #1
	sub r0, #0x44
	str r2, [r4, r0]
	ldr r0, [r3, #4]
	sub r1, #0x40
	str r0, [r4, r1]
_020861DE:
	ldr r0, _0208631C ; =0x000005E5
	bl PlaySE
	pop {r3, r4, r5, r6, r7, pc}
_020861E6:
	cmp r5, #0x1a
	bne _02086200
	mov r0, #0x91
	mov r1, #0
	lsl r0, r0, #2
	strh r1, [r4, r0]
	mov r1, #2
	add r0, r0, #2
	strh r1, [r4, r0]
	ldr r0, _0208631C ; =0x000005E5
	bl PlaySE
	b _0208623E
_02086200:
	cmp r5, #0x1b
	bne _0208621A
	mov r0, #0x91
	mov r1, #3
	lsl r0, r0, #2
	strh r1, [r4, r0]
	mov r1, #2
	add r0, r0, #2
	strh r1, [r4, r0]
	ldr r0, _02086320 ; =0x000005E2
	bl PlaySE
	b _0208623E
_0208621A:
	add r0, r5, #0
	sub r0, #0x10
	mov r1, #5
	bl _u32_div_f
	mov r0, #0x91
	lsl r0, r0, #2
	strh r1, [r4, r0]
	add r0, r5, #0
	sub r0, #0x10
	mov r1, #5
	bl _u32_div_f
	ldr r1, _02086324 ; =0x00000246
	strh r0, [r4, r1]
	ldr r0, _0208631C ; =0x000005E5
	bl PlaySE
_0208623E:
	cmp r5, #0x10
	blo _02086308
	cmp r5, #0x19
	bhi _02086308
	mov r0, #0xb5
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	cmp r1, #0
	beq _0208631A
	sub r0, #0xc0
	ldr r7, [r4, r0]
	mov r0, #0x1c
	add r6, r7, #0
	mul r6, r0
	add r0, r5, #0
	sub r0, #0xf
	str r0, [r4, r6]
	add r1, r4, r6
	ldr r0, [r4, r6]
	ldr r1, [r1, #8]
	bl sub_02086D98
	add r1, r0, #0
	add r0, r4, r6
	ldr r0, [r0, #0xc]
	bl sub_0200DC4C
	mov r1, #1
	add r0, r4, #0
	add r2, r1, #0
	bl sub_02086AB4
	sub r5, #0x10
	add r0, r4, #0
	add r1, r5, #0
	bl sub_02086B2C
	add r0, r4, #0
	mov r1, #1
	mov r2, #0
	bl sub_02086AB4
	add r0, r4, #0
	mov r1, #2
	mov r2, #1
	bl sub_02086AB4
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #2
	bl sub_02086B6C
	mov r0, #0x96
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #3
	bl sub_0200DC4C
	add r0, r4, r6
	ldr r2, [r0, #4]
	mov r0, #0x2d
	lsl r0, r0, #4
	ldr r3, [r4, r0]
	add r1, r7, #1
	cmp r1, r3
	bne _020862D8
	add r1, r0, #0
	mov r2, #1
	add r1, #0xdc
	str r2, [r4, r1]
	add r1, r0, #0
	mov r2, #0
	add r1, #0xe0
	str r2, [r4, r1]
	add r0, #0xe4
	str r2, [r4, r0]
	pop {r3, r4, r5, r6, r7, pc}
_020862D8:
	mov r3, #0x1c
	mul r3, r1
	add r3, r4, r3
	ldr r3, [r3, #4]
	cmp r2, r3
	beq _020862FA
	add r1, r0, #0
	mov r2, #1
	add r1, #0xdc
	str r2, [r4, r1]
	add r1, r0, #0
	add r1, #0xe0
	str r3, [r4, r1]
	mov r1, #0
	add r0, #0xe4
	str r1, [r4, r0]
	pop {r3, r4, r5, r6, r7, pc}
_020862FA:
	add r2, r0, #0
	mov r3, #2
	add r2, #0xdc
	str r3, [r4, r2]
	add r0, #0xe0
	str r1, [r4, r0]
	pop {r3, r4, r5, r6, r7, pc}
_02086308:
	cmp r5, #0x1a
	bne _02086314
	add r0, r4, #0
	bl sub_02085FFC
	pop {r3, r4, r5, r6, r7, pc}
_02086314:
	add r0, r4, #0
	bl sub_02085F80
_0208631A:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0208631C: .word 0x000005E5
_02086320: .word 0x000005E2
_02086324: .word 0x00000246
	thumb_func_end sub_02086180

	thumb_func_start sub_02086328
sub_02086328: ; 0x02086328
	push {r4, lr}
	mov r1, #0xeb
	add r4, r0, #0
	lsl r1, r1, #2
	ldr r2, [r4, r1]
	cmp r2, #2
	bgt _02086346
	cmp r2, #0
	blt _02086380
	beq _02086380
	cmp r2, #1
	beq _0208634A
	cmp r2, #2
	beq _02086372
	pop {r4, pc}
_02086346:
	cmp r2, #0xff
	pop {r4, pc}
_0208634A:
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl sub_02085604
	add r0, r4, #0
	bl sub_02086DA4
	add r0, r4, #0
	mov r1, #1
	bl sub_02086DE4
	add r0, r4, #0
	mov r1, #2
	bl sub_02085808
	mov r0, #0xeb
	mov r1, #0xff
	lsl r0, r0, #2
	str r1, [r4, r0]
	pop {r4, pc}
_02086372:
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl sub_02086AE4
	add r0, r4, #0
	bl sub_02086384
_02086380:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02086328

	thumb_func_start sub_02086384
sub_02086384: ; 0x02086384
	mov r2, #0xeb
	lsl r2, r2, #2
	mov r3, #0
	str r3, [r0, r2]
	add r1, r2, #4
	str r3, [r0, r1]
	add r2, #8
	str r3, [r0, r2]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02086384

	thumb_func_start sub_02086398
sub_02086398: ; 0x02086398
	push {r3, r4}
	mov r2, #0x2d
	lsl r2, r2, #4
	ldr r4, [r0, r2]
	mov r3, #0
	cmp r4, #0
	ble _020863BA
_020863A6:
	ldr r2, [r0, #4]
	cmp r1, r2
	bne _020863B2
	add r0, r3, #0
	pop {r3, r4}
	bx lr
_020863B2:
	add r3, r3, #1
	add r0, #0x1c
	cmp r3, r4
	blt _020863A6
_020863BA:
	mov r0, #0
	pop {r3, r4}
	bx lr
	thumb_func_end sub_02086398

	thumb_func_start sub_020863C0
sub_020863C0: ; 0x020863C0
	push {r3, r4, r5, r6}
	mov r2, #0x2d
	lsl r2, r2, #4
	ldr r6, [r0, r2]
	mov r5, #0
	add r4, r5, #0
	cmp r6, #0
	ble _020863EE
	mov r2, #1
_020863D2:
	ldr r3, [r0, #4]
	cmp r1, r3
	bne _020863DC
	add r5, r2, #0
	b _020863E6
_020863DC:
	cmp r5, #1
	bne _020863E6
	sub r0, r4, #1
	pop {r3, r4, r5, r6}
	bx lr
_020863E6:
	add r4, r4, #1
	add r0, #0x1c
	cmp r4, r6
	blt _020863D2
_020863EE:
	sub r0, r6, #1
	pop {r3, r4, r5, r6}
	bx lr
	thumb_func_end sub_020863C0

	.rodata

_0210271C:
	.word sub_02085820
	.word sub_02085938
	.word sub_02085974
	.word sub_020858DC
_0210272C:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x09, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x0B, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00
_02102768:
	.short 0x0020, 0x0050, 0x0014, 0x0014
	.short 0x0050, 0x0050, 0x0014, 0x0014
	.short 0x0080, 0x0050, 0x0014, 0x0014
	.short 0x00B0, 0x0050, 0x0014, 0x0014
	.short 0x00E0, 0x0050, 0x0014, 0x0014
	.short 0x0020, 0x0080, 0x0014, 0x0014
	.short 0x0050, 0x0080, 0x0014, 0x0014
	.short 0x0080, 0x0080, 0x0014, 0x0014
	.short 0x00B0, 0x0080, 0x0014, 0x0014
	.short 0x00E0, 0x0080, 0x0014, 0x0014
	.short 0x0040, 0x00B0, 0x003C, 0x000C
	.short 0x00C0, 0x00B0, 0x003C, 0x000C

	; File boundary

	.data

_0211055C:
	.byte 0x00, 0x00, 0x00, 0x3F
	.byte 0xCD, 0xCC, 0x4C, 0x3E, 0x00, 0x00, 0x00, 0x3F, 0x00, 0x00, 0x80, 0x3F, 0x9A, 0x99, 0x99, 0x3F
	.byte 0x00, 0x00, 0x80, 0x3F, 0x00, 0x00, 0x80, 0x3F
_02110578:
	.byte 0xCD, 0xCC, 0x4C, 0x3F, 0x9A, 0x99, 0x19, 0x3F
	.byte 0xCD, 0xCC, 0xCC, 0x3E, 0xCD, 0xCC, 0x4C, 0x3E, 0xCD, 0xCC, 0x4C, 0x3F, 0x00, 0x00, 0x80, 0x3F
	.byte 0x00, 0x00, 0x80, 0x3F
