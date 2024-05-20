#include "constants/species.h"
#include "constants/maps.h"
#include "constants/sprites.h"
#include "constants/items.h"
#include "constants/moves.h"
#include "constants/sndseq.h"
	.include "asm/macros.inc"
	.include "field_take_photo.inc"
	.include "global.inc"

	.public NNS_G3dGlb
	.extern sPhotoMonCoordOffsets
	.extern sub_0206AEC0
	.extern sub_0206AF08
	.extern sub_0206AF78
	.extern sub_0206AFA4
	.extern sub_0206AFD0
	.extern sCameraParam

	.text

	thumb_func_start sub_0206B82C
sub_0206B82C: ; 0x0206B82C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, r1, #0
	add r1, r2, #0
	bl PlayerAvatar_GetSpriteByStateAndGender
	add r6, r0, #0
	add r0, r5, #0
	bl PlayerAvatar_GetMapObject
	add r4, r0, #0
	bl MapObject_GetManager
	add r7, r0, #0
	add r0, r4, #0
	bl MapObject_GetGfxID
	str r0, [sp]
	add r0, r4, #0
	bl sub_0205E420
	ldr r1, [sp]
	add r0, r7, #0
	add r2, r4, #0
	bl ov01_021FA108
	add r0, r4, #0
	add r1, r6, #0
	bl sub_0205E38C
	add r0, r5, #0
	bl sub_0205C790
	cmp r0, #0
	beq _0206B876
	bl ov01_021F1640
_0206B876:
	add r0, r5, #0
	mov r1, #0
	bl sub_0205C78C
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0206B82C

	thumb_func_start sub_0206B880
sub_0206B880: ; 0x0206B880
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r5, r1, #0
	mov r4, #0
	mov r7, #1
_0206B88A:
	lsl r0, r4, #1
	add r0, r5, r0
	add r0, #0x40
	ldrh r1, [r0]
	cmp r1, #0
	beq _0206B89E
	add r0, r6, #0
	add r2, r7, #0
	bl sub_02054EB0
_0206B89E:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #2
	blo _0206B88A
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0206B880

	thumb_func_start sub_0206B8AC
sub_0206B8AC: ; 0x0206B8AC
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r4, r1, #0
	mov r1, #0
	str r1, [sp]
	ldr r0, _0206B90C ; =0x00000107
	add r2, r1, #0
	add r3, r1, #0
	str r4, [sp, #4]
	bl GfGfxLoader_GXLoadPal
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r1, #1
	str r1, [sp, #8]
	ldr r0, _0206B90C ; =0x00000107
	add r2, r5, #0
	mov r3, #2
	str r4, [sp, #0xc]
	bl GfGfxLoader_LoadCharData
	mov r0, #0
	str r0, [sp]
	mov r0, #6
	lsl r0, r0, #8
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r1, #2
	ldr r0, _0206B90C ; =0x00000107 ; =(a/2/6/1)
	add r2, r5, #0
	add r3, r1, #0
	str r4, [sp, #0xc]
	bl GfGfxLoader_LoadScrnData
	add r0, r5, #0
	mov r1, #2
	bl BgCommitTilemapBufferToVram
	mov r0, #2
	mov r1, #0
	bl SetBgPriority
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_0206B90C: .word 0x00000107 ; =(a/2/6/1)
	thumb_func_end sub_0206B8AC
