	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start SVC_SoftReset
SVC_SoftReset: ; 0x038008A4
	swi 0
	bx lr
	thumb_func_end SVC_SoftReset

	thumb_func_start SVC_WaitByLoop
SVC_WaitByLoop: ; 0x038008A8
	swi 3
	bx lr
	thumb_func_end SVC_WaitByLoop

	thumb_func_start SVC_WaitIntr
SVC_WaitIntr: ; 0x038008AC
	ldr r2, _038008B8 ; =0x04000000
	mov ip, r2
	mov r2, #0
	swi 4
	bx lr
	.align 2, 0
_038008B8: .word 0x04000000
	thumb_func_end SVC_WaitIntr

	thumb_func_start SVC_WaitVBlankIntr
SVC_WaitVBlankIntr: ; 0x038008BC
	mov r2, #0
	swi 5
	bx lr
	thumb_func_end SVC_WaitVBlankIntr

	non_word_aligned_thumb_func_start SVC_Halt
SVC_Halt: ; 0x038008C2
	swi 6
	bx lr
	thumb_func_end SVC_Halt

	non_word_aligned_thumb_func_start SVC_Sleep
SVC_Sleep: ; 0x038008C6
	swi 7
	bx lr
	thumb_func_end SVC_Sleep

	non_word_aligned_thumb_func_start SVC_ChangeSoundBias
SVC_ChangeSoundBias: ; 0x038008CA
	swi 8
	bx lr
	thumb_func_end SVC_ChangeSoundBias

	non_word_aligned_thumb_func_start SVC_SetSoundBias
SVC_SetSoundBias: ; 0x038008CE
	add r1, r0, #0
	mov r0, #1
	swi 8
	bx lr
	thumb_func_end SVC_SetSoundBias

	non_word_aligned_thumb_func_start SVC_ResetSoundBias
SVC_ResetSoundBias: ; 0x038008D6
	add r1, r0, #0
	mov r0, #0
	swi 8
	bx lr
	thumb_func_end SVC_ResetSoundBias

	non_word_aligned_thumb_func_start SVC_Div
SVC_Div: ; 0x038008DE
	swi 9
	bx lr
	thumb_func_end SVC_Div

	non_word_aligned_thumb_func_start SVC_DivRem
SVC_DivRem: ; 0x038008E2
	swi 9
	add r0, r1, #0
	bx lr
	thumb_func_end SVC_DivRem

	thumb_func_start SVC_CpuSet
SVC_CpuSet: ; 0x038008E8
	swi 0xb
	bx lr
	thumb_func_end SVC_CpuSet

	thumb_func_start SVC_CpuSetFast
SVC_CpuSetFast: ; 0x038008EC
	swi 0xc
	bx lr
	thumb_func_end SVC_CpuSetFast

	thumb_func_start SVC_Sqrt
SVC_Sqrt: ; 0x038008F0
	swi 0xd
	bx lr
	thumb_func_end SVC_Sqrt

	thumb_func_start SVC_GetCRC16
SVC_GetCRC16: ; 0x038008F4
	swi 0xe
	bx lr
	thumb_func_end SVC_GetCRC16

	thumb_func_start IsMmemExpanded
IsMmemExpanded: ; 0x038008F8
	swi 0xf
	bx lr
	thumb_func_end IsMmemExpanded

	thumb_func_start SVC_UnpackBits
SVC_UnpackBits: ; 0x038008FC
	swi 0x10
	bx lr
	thumb_func_end SVC_UnpackBits

	thumb_func_start SVC_UncompressLZ8
SVC_UncompressLZ8: ; 0x03800900
	swi 0x11
	bx lr
	thumb_func_end SVC_UncompressLZ8

	thumb_func_start SVC_UncompressLZ16FromDevice
SVC_UncompressLZ16FromDevice: ; 0x03800904
	swi 0x12
	bx lr
	thumb_func_end SVC_UncompressLZ16FromDevice

	thumb_func_start SVC_UncompressHuffmanFromDevice
SVC_UncompressHuffmanFromDevice: ; 0x03800908
	swi 0x13
	bx lr
	thumb_func_end SVC_UncompressHuffmanFromDevice

	thumb_func_start SVC_UncompressRL8
SVC_UncompressRL8: ; 0x0380090C
	swi 0x14
	bx lr
	thumb_func_end SVC_UncompressRL8

	thumb_func_start SVC_UncompressRL16FromDevice
SVC_UncompressRL16FromDevice: ; 0x03800910
	swi 0x15
	bx lr
	thumb_func_end SVC_UncompressRL16FromDevice

	thumb_func_start SVC_GetSinTable
SVC_GetSinTable: ; 0x03800914
	swi 0x1a
	bx lr
	thumb_func_end SVC_GetSinTable

	thumb_func_start SVC_GetPitchTable
SVC_GetPitchTable: ; 0x03800918
	swi 0x1b
	bx lr
	thumb_func_end SVC_GetPitchTable

	thumb_func_start SVC_GetVolumeTable
SVC_GetVolumeTable: ; 0x0380091C
	swi 0x1c
	bx lr
	thumb_func_end SVC_GetVolumeTable
