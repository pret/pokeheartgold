	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start Save_PhotoAlbum_sizeof
Save_PhotoAlbum_sizeof: ; 0x0202FA5C
	ldr r0, _0202FA60 ; =0x00001294
	bx lr
	.balign 4, 0
_0202FA60: .word 0x00001294
	thumb_func_end Save_PhotoAlbum_sizeof

	thumb_func_start Save_PhotoAlbum_get
Save_PhotoAlbum_get: ; 0x0202FA64
	ldr r3, _0202FA6C ; =SavArray_get
	mov r1, #0x24
	bx r3
	nop
_0202FA6C: .word SavArray_get
	thumb_func_end Save_PhotoAlbum_get

	thumb_func_start Save_PhotoAlbum_init
Save_PhotoAlbum_init: ; 0x0202FA70
	push {r3, r4, r5, lr}
	mov r4, #0
	str r4, [r0]
	add r5, r0, #4
_0202FA78:
	add r0, r5, #0
	bl Photo_init
	add r4, r4, #1
	add r5, #0x84
	cmp r4, #0x24
	blt _0202FA78
	pop {r3, r4, r5, pc}
	thumb_func_end Save_PhotoAlbum_init

	thumb_func_start PhotoAlbum_GetIndexOfFirstEmptySlot
PhotoAlbum_GetIndexOfFirstEmptySlot: ; 0x0202FA88
	push {r4, r5, r6, lr}
	mov r5, #0
	add r4, r0, #4
	mov r6, #0x84
_0202FA90:
	add r0, r5, #0
	mul r0, r6
	add r0, r4, r0
	bl Photo_IsUse
	cmp r0, #0
	bne _0202FAA2
	add r0, r5, #0
	pop {r4, r5, r6, pc}
_0202FAA2:
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #0x24
	blo _0202FA90
	mov r0, #0xff
	pop {r4, r5, r6, pc}
	thumb_func_end PhotoAlbum_GetIndexOfFirstEmptySlot

	thumb_func_start PhotoAlbum_GetNumSaved
PhotoAlbum_GetNumSaved: ; 0x0202FAB0
	push {r3, r4, r5, r6, r7, lr}
	mov r4, #0
	add r5, r4, #0
	add r6, r0, #4
	mov r7, #0x84
_0202FABA:
	add r0, r4, #0
	mul r0, r7
	add r0, r6, r0
	bl Photo_IsUse
	cmp r0, #0
	beq _0202FACE
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
_0202FACE:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #0x24
	blo _0202FABA
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end PhotoAlbum_GetNumSaved

	thumb_func_start PhotoAlbum_DeletePhotoByIndex
PhotoAlbum_DeletePhotoByIndex: ; 0x0202FADC
	push {r3, lr}
	cmp r1, #0x24
	bhs _0202FAEE
	add r2, r0, #4
	mov r0, #0x84
	mul r0, r1
	add r0, r2, r0
	bl Photo_init
_0202FAEE:
	pop {r3, pc}
	thumb_func_end PhotoAlbum_DeletePhotoByIndex

	thumb_func_start PhotoAlbum_GetPhotoByIndex
PhotoAlbum_GetPhotoByIndex: ; 0x0202FAF0
	push {r4, lr}
	add r3, r0, #0
	cmp r2, #0x24
	blo _0202FAFC
	mov r0, #0
	pop {r4, pc}
_0202FAFC:
	add r0, r1, #0
	add r4, r3, #4
	mov r3, #0x84
	add r1, r2, #0
	mul r1, r3
	add r1, r4, r1
	add r2, r3, #0
	bl MI_CpuCopy8
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end PhotoAlbum_GetPhotoByIndex

	thumb_func_start PhotoAlbum_SetPhotoByIndex
PhotoAlbum_SetPhotoByIndex: ; 0x0202FB14
	push {r4, lr}
	cmp r2, #0x24
	blo _0202FB24
	add r0, r1, #0
	bl Photo_init
	mov r0, #0
	pop {r4, pc}
_0202FB24:
	add r4, r0, #4
	mov r3, #0x84
	add r0, r2, #0
	mul r0, r3
	add r0, r4, r0
	add r2, r3, #0
	bl MI_CpuCopy8
	mov r0, #1
	pop {r4, pc}
	thumb_func_end PhotoAlbum_SetPhotoByIndex

	thumb_func_start PhotoAlbum_LoadAllInUsePhotos
PhotoAlbum_LoadAllInUsePhotos: ; 0x0202FB38
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	add r6, r1, #0
	bl PhotoAlbum_GetNumSaved
	add r5, r0, #0
	mov r1, #0x84
	mul r5, r1
	add r0, r6, #0
	add r1, r5, #0
	bl AllocFromHeap
	mov r1, #0
	add r2, r5, #0
	str r0, [sp]
	bl MI_CpuFill8
	mov r7, #0
	add r5, r7, #0
	add r4, r4, #4
_0202FB60:
	mov r0, #0x84
	add r6, r5, #0
	mul r6, r0
	add r0, r4, r6
	bl Photo_IsUse
	cmp r0, #0
	beq _0202FB88
	add r1, r7, #0
	mov r2, #0x84
	add r0, r7, #1
	mul r2, r1
	ldr r1, [sp]
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
	add r1, r1, r2
	add r0, r4, r6
	mov r2, #0x84
	bl MI_CpuCopy8
_0202FB88:
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #0x24
	blo _0202FB60
	ldr r0, [sp]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end PhotoAlbum_LoadAllInUsePhotos

	thumb_func_start Photo_init
Photo_init: ; 0x0202FB98
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x84
	bl MI_CpuFill8
	add r0, r4, #0
	add r0, #8
	mov r1, #8
	bl StringFillEOS
	add r4, #0x18
	add r0, r4, #0
	mov r1, #0xc
	bl StringFillEOS
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end Photo_init

	thumb_func_start Photo_IsUse
Photo_IsUse: ; 0x0202FBBC
	ldrb r0, [r0, #7]
	cmp r0, #0
	beq _0202FBC6
	mov r0, #1
	bx lr
_0202FBC6:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end Photo_IsUse
