#include "constants/easy_chat.h"
#include "constants/items.h"
#include "constants/maps.h"
#include "constants/moves.h"
#include "constants/species.h"
	.include "asm/macros.inc"
	.include "unk_02091564.inc"
	.include "global.inc"

	.public _02102610

	.text

	thumb_func_start sub_02091564
sub_02091564: ; 0x02091564
	mov r0, #0x18
	bx lr
	thumb_func_end sub_02091564

	thumb_func_start sub_02091568
sub_02091568: ; 0x02091568
	mov r0, #0x59
	lsl r0, r0, #4
	bx lr
	.balign 4, 0
	thumb_func_end sub_02091568

	thumb_func_start sub_02091570
sub_02091570: ; 0x02091570
	bx lr
	.balign 4, 0
	thumb_func_end sub_02091570

	thumb_func_start sub_02091574
sub_02091574: ; 0x02091574
	ldr r3, _02091580 ; =sub_0203410C
	add r2, r0, #0
	ldr r0, _02091584 ; =_02106078
	mov r1, #0x71
	bx r3
	nop
_02091580: .word sub_0203410C
_02091584: .word _02106078
	thumb_func_end sub_02091574

	thumb_func_start sub_02091588
sub_02091588: ; 0x02091588
	ldr r0, _0209158C ; =0x0000066C
	bx lr
	.balign 4, 0
_0209158C: .word 0x0000066C
	thumb_func_end sub_02091588

	thumb_func_start sub_02091590
sub_02091590: ; 0x02091590
	mov r0, #0x2f
	lsl r0, r0, #6
	bx lr
	.balign 4, 0
	thumb_func_end sub_02091590

	thumb_func_start sub_02091598
sub_02091598: ; 0x02091598
	mov r0, #0x3f
	lsl r0, r0, #4
	bx lr
	.balign 4, 0
	thumb_func_end sub_02091598

	thumb_func_start sub_020915A0
sub_020915A0: ; 0x020915A0
	mov r0, #0xa
	bx lr
	thumb_func_end sub_020915A0

	thumb_func_start sub_020915A4
sub_020915A4: ; 0x020915A4
	mov r0, #0x32
	bx lr
	thumb_func_end sub_020915A4

	thumb_func_start sub_020915A8
sub_020915A8: ; 0x020915A8
	mov r0, #4
	bx lr
	thumb_func_end sub_020915A8

	thumb_func_start sub_020915AC
sub_020915AC: ; 0x020915AC
	mov r0, #4
	bx lr
	thumb_func_end sub_020915AC

	.rodata

	.public gApplication_OakSpeech
gApplication_OakSpeech:
	.word ov53_OakSpeech_OvyInit, ov53_OakSpeech_OvyExec, ov53_OakSpeech_OvyExit, FS_OVERLAY_ID(OVY_53)

_02106078:
	.word sub_020576C0, sub_02057798, 0
	.word sub_0205779C, sub_02057A08, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_0205776C, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_020573AC, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_020588CC, sub_02091588, sub_020588DC
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02057D50, sub_020342C4, 0
	.word sub_02058720, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_0205A408, PlayerProfile_sizeof, 0
	.word sub_0205A430, sub_020342C4, 0
	.word sub_0205A40C, sub_020342C4, 0
	.word sub_0205A4C4, sub_020342C4, 0
	.word sub_0205A410, sub_020342C0, 0
	.word sub_0205A44C, sub_020342C4, 0
	.word sub_0205A46C, sub_020342C0, 0
	.word sub_0205A498, sub_02091588, sub_0205A4B4
	.word sub_02059AE4, sub_02059B08, sub_02059B18
	.word sub_02059B34, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020915A8, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_02091590, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_02091598, 0
	.word sub_02091570, sub_020915A0, 0
	.word sub_02091570, sub_020915A4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020915AC, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_02091564, 0
	.word sub_02091570, sub_02091568, 0
	.word sub_0204F85C, sub_020342B8, 0
	.word sub_0204FE58, sub_020342B8, 0
	.word sub_02050398, sub_020342B8, 0
