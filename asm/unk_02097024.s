#include "constants/easy_chat.h"
#include "constants/items.h"
#include "constants/maps.h"
#include "constants/moves.h"
#include "constants/species.h"
	.include "macros.inc"
	.include "unk_02097024.inc"
	.include "global.inc"

	.text

	.extern sub_02097060
	.extern sub_020970E4
	.extern sub_02097108
	.extern sub_02097148

	thumb_func_start sub_020971AC
sub_020971AC: ; 0x020971AC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x28]
	bl FieldSystem_ApplicationIsRunning
	cmp r0, #0
	bne _020971CE
	ldr r0, [r4, #0x30]
	bl Heap_Free
	ldr r0, [r4, #0x28]
	ldr r1, [r4, #4]
	bl PartyMenu_LaunchApp_Unk5
	str r0, [r4, #0x2c]
	mov r0, #2
	str r0, [r4]
_020971CE:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020971AC

	thumb_func_start sub_020971D4
sub_020971D4: ; 0x020971D4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x28]
	bl FieldSystem_ApplicationIsRunning
	cmp r0, #0
	bne _020971E6
	mov r0, #5
	str r0, [r4]
_020971E6:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020971D4

	thumb_func_start sub_020971EC
sub_020971EC: ; 0x020971EC
	push {r3, lr}
	ldr r0, [r0, #0x24]
	bl sub_02097060
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_020971EC

	.rodata

	.global _02108EA0
_02108EA0:
	.word ov85_021E88AC, ov85_021E8A08, ov85_021E8B08, SDK_OVERLAY_OVY_85_ID
	.size _02108EA0, .-_02108EA0

	.global _02108EB0
_02108EB0:
	.word ov85_021E5900, ov85_021E5AAC, ov85_021E5A34, SDK_OVERLAY_OVY_85_ID
	.size _02108EB0, .-_02108EB0

	.global _02108EC0
_02108EC0:
	.word sub_020970E4
	.word sub_02097108
	.word sub_02097148
	.word sub_020971AC
	.word sub_020971D4
	.word sub_020971EC
	.size _02108EC0, .-_02108EC0
