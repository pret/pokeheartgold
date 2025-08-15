#include "constants/easy_chat.h"
#include "constants/items.h"
#include "constants/maps.h"
#include "constants/moves.h"
#include "constants/species.h"
	.include "asm/macros.inc"
	.include "unk_020915B0.inc"
	.include "global.inc"

	.text

	thumb_func_start LoadDwcOverlay
LoadDwcOverlay: ; 0x020915B0
	ldr r3, _020915B8 ; =HandleLoadOverlay
	ldr r0, _020915BC ; =FS_OVERLAY_ID(OVY_0)
	mov r1, #2
	bx r3
	.balign 4, 0
_020915B8: .word HandleLoadOverlay
_020915BC: .word FS_OVERLAY_ID(OVY_0)
	thumb_func_end LoadDwcOverlay

	thumb_func_start UnloadDwcOverlay
UnloadDwcOverlay: ; 0x020915C0
	ldr r3, _020915C8 ; =UnloadOverlayByID
	ldr r0, _020915CC ; =FS_OVERLAY_ID(OVY_0)
	bx r3
	nop
_020915C8: .word UnloadOverlayByID
_020915CC: .word FS_OVERLAY_ID(OVY_0)
	thumb_func_end UnloadDwcOverlay

	thumb_func_start LoadOVY13
LoadOVY13: ; 0x020915D0
	ldr r3, _020915D8 ; =HandleLoadOverlay
	ldr r0, _020915DC ; =FS_OVERLAY_ID(OVY_13)
	mov r1, #2
	bx r3
	.balign 4, 0
_020915D8: .word HandleLoadOverlay
_020915DC: .word FS_OVERLAY_ID(OVY_13)
	thumb_func_end LoadOVY13

	thumb_func_start UnloadOVY13
UnloadOVY13: ; 0x020915E0
	ldr r3, _020915E8 ; =UnloadOverlayByID
	ldr r0, _020915EC ; =FS_OVERLAY_ID(OVY_13)
	bx r3
	nop
_020915E8: .word UnloadOverlayByID
_020915EC: .word FS_OVERLAY_ID(OVY_13)
	thumb_func_end UnloadOVY13

	thumb_func_start sub_020915F0
sub_020915F0: ; 0x020915F0
	push {r4, lr}
	add r4, r1, #0
	bl LoadDwcOverlay
	bl LoadOVY13
	add r0, r4, #0
	bl ov13_0221BA00
	bl UnloadOVY13
	bl UnloadDwcOverlay
	mov r0, #0
	bl OS_ResetSystem
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020915F0

	thumb_func_start LoadOVY38
LoadOVY38: ; 0x02091614
	ldr r3, _0209161C ; =HandleLoadOverlay
	ldr r0, _02091620 ; =FS_OVERLAY_ID(OVY_38)
	mov r1, #2
	bx r3
	.balign 4, 0
_0209161C: .word HandleLoadOverlay
_02091620: .word FS_OVERLAY_ID(OVY_38)
	thumb_func_end LoadOVY38

	thumb_func_start UnloadOVY38
UnloadOVY38: ; 0x02091624
	ldr r3, _0209162C ; =UnloadOverlayByID
	ldr r0, _02091630 ; =FS_OVERLAY_ID(OVY_38)
	bx r3
	nop
_0209162C: .word UnloadOverlayByID
_02091630: .word FS_OVERLAY_ID(OVY_38)
	thumb_func_end UnloadOVY38

	thumb_func_start sub_02091634
sub_02091634: ; 0x02091634
	push {r4, lr}
	mov r2, #0x41
	add r4, r0, #0
	mov r0, #3
	mov r1, #0x30
	lsl r2, r2, #0xc
	bl Heap_Create
	add r0, r4, #0
	bl OverlayManager_GetArgs
	ldr r0, [r0, #8]
	mov r1, #0x30
	bl sub_020915F0
	mov r0, #0x30
	bl Heap_Destroy
	mov r0, #0
	bl OS_ResetSystem
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02091634

	.rodata

	.public gApp_MainMenu_SelectOption_NintendoWFCSetup
gApp_MainMenu_SelectOption_NintendoWFCSetup:
	.word sub_02091634, 0, 0, 0xFFFFFFFF
