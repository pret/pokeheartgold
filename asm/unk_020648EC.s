#include "constants/sndseq.h"
#include "constants/species.h"
#include "constants/maps.h"
#include "constants/pokemon.h"
#include "constants/flags.h"
#include "constants/vars.h"
#include "constants/items.h"
#include "constants/std_script.h"
#include "fielddata/script/scr_seq/event_D24R0204.h"
#include "party_menu.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_020648EC
sub_020648EC: ; 0x020648EC
	push {r4, lr}
	add r4, r0, #0
	bl Fsys_GetSav2Ptr
	bl Sav2_GetGymmickPtr
	bl SavGymmick_GetType
	add r1, r0, #0
	beq _0206490A
	lsl r2, r1, #2
	ldr r1, _0206490C ; =_020FE214
	add r0, r4, #0
	ldr r1, [r1, r2]
	blx r1
_0206490A:
	pop {r4, pc}
	.balign 4, 0
_0206490C: .word _020FE214
	thumb_func_end sub_020648EC

	thumb_func_start sub_02064910
sub_02064910: ; 0x02064910
	push {r4, lr}
	add r4, r0, #0
	bl Fsys_GetSav2Ptr
	bl Sav2_GetGymmickPtr
	bl SavGymmick_GetType
	cmp r0, #0
	beq _02064932
	lsl r1, r0, #2
	ldr r0, _02064934 ; =_020FE1EC
	ldr r1, [r0, r1]
	cmp r1, #0
	beq _02064932
	add r0, r4, #0
	blx r1
_02064932:
	pop {r4, pc}
	.balign 4, 0
_02064934: .word _020FE1EC
	thumb_func_end sub_02064910

	thumb_func_start sub_02064938
sub_02064938: ; 0x02064938
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r4, r1, #0
	add r7, r2, #0
	str r3, [sp, #4]
	bl Fsys_GetSav2Ptr
	bl Sav2_GetGymmickPtr
	bl SavGymmick_GetType
	cmp r0, #0
	bne _0206495A
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0206495A:
	lsl r1, r0, #2
	ldr r0, _0206497C ; =_020FE23C
	ldr r6, [r0, r1]
	cmp r6, #0
	beq _02064976
	ldr r0, [sp, #0x20]
	ldr r3, [sp, #4]
	str r0, [sp]
	add r0, r5, #0
	add r1, r4, #0
	add r2, r7, #0
	blx r6
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_02064976:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0206497C: .word _020FE23C
	thumb_func_end sub_02064938

	.rodata

_020FE1EC:
	.word 0               ; GYMMICK_NONE
	.word ov04_02254D84   ; GYMMICK_ECRUTEAK
	.word ov04_02256044   ; GYMMICK_CIANWOOD
	.word ov04_022563B0   ; GYMMICK_VERMILION
	.word 0               ; GYMMICK_VIOLET
	.word ov04_02254710   ; GYMMICK_AZALEA
	.word ov04_0225507C   ; GYMMICK_BLACKTHORN
	.word ov04_022566A0   ; GYMMICK_FUCHSIA
	.word ov04_02256BA0   ; GYMMICK_VIRIDIAN
	.word ov04_02256EB0   ; GYMMICK_SINJOH
_020FE214:
	.word 0               ; GYMMICK_NONE
	.word ov04_02254CBC   ; GYMMICK_ECRUTEAK
	.word ov04_02255FC0   ; GYMMICK_CIANWOOD
	.word ov04_02256304   ; GYMMICK_VERMILION
	.word ov04_02253E20   ; GYMMICK_VIOLET
	.word ov04_02254190   ; GYMMICK_AZALEA
	.word ov04_02254F8C   ; GYMMICK_BLACKTHORN
	.word ov04_02256650   ; GYMMICK_FUCHSIA
	.word ov04_02256B64   ; GYMMICK_VIRIDIAN
	.word ov04_02256E60   ; GYMMICK_SINJOH
_020FE23C:
	.word 0               ; GYMMICK_NONE
	.word 0               ; GYMMICK_ECRUTEAK
	.word 0               ; GYMMICK_CIANWOOD
	.word 0               ; GYMMICK_VERMILION
	.word 0               ; GYMMICK_VIOLET
	.word 0               ; GYMMICK_AZALEA
	.word ov04_022550D4   ; GYMMICK_BLACKTHORN
	.word 0               ; GYMMICK_FUCHSIA
	.word 0               ; GYMMICK_VIRIDIAN
	.word 0               ; GYMMICK_SINJOH
