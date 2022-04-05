	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_02005D10
sub_02005D10: ; 0x02005D10
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	bl GF_GetPlayerNoBySeq
	bl GF_GetSndHandleByPlayerNo
	str r5, [sp]
	mov r1, #1
	str r1, [sp, #4]
	sub r1, r1, #2
	add r2, r1, #0
	add r3, r1, #0
	add r4, r0, #0
	bl sub_02006C14
	add r6, r0, #0
	bne _02005D3A
	add r0, r5, #0
	bl sub_02004920
_02005D3A:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02005DA0
	add r0, r6, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02005D10

	thumb_func_start PlayBGM
PlayBGM: ; 0x02005D48
	push {r4, r5, r6, lr}
	add r4, r0, #0
	bl GF_GetPlayerNoBySeq
	add r5, r0, #0
	bl GF_GetSndHandleByPlayerNo
	add r6, r0, #0
	cmp r5, #7
	bne _02005D6A
	add r0, r4, #0
	add r1, r5, #0
	add r2, r6, #0
	bl sub_02005DC4
	add r5, r0, #0
	b _02005D84
_02005D6A:
	cmp r5, #1
	bne _02005D7C
	add r0, r4, #0
	add r1, r5, #0
	add r2, r6, #0
	bl sub_02005DF4
	add r5, r0, #0
	b _02005D84
_02005D7C:
	bl GF_AssertFail
	mov r0, #0
	pop {r4, r5, r6, pc}
_02005D84:
	mov r0, #0
	bl sub_020059E0
	cmp r5, #0
	bne _02005D94
	add r0, r4, #0
	bl sub_02004920
_02005D94:
	add r0, r4, #0
	add r1, r6, #0
	bl sub_02005DA0
	add r0, r5, #0
	pop {r4, r5, r6, pc}
	thumb_func_end PlayBGM

	thumb_func_start sub_02005DA0
sub_02005DA0: ; 0x02005DA0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_02004A60
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02005464
	mov r0, #1
	bl GF_SndSetState
	cmp r4, #0
	bne _02005DC2
	mov r0, #0x80
	bl GF_SndWorkSetGbSoundsVolume
_02005DC2:
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02005DA0

	thumb_func_start sub_02005DC4
sub_02005DC4: ; 0x02005DC4
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	mov r0, #3
	add r4, r2, #0
	bl sub_02005328
	bl GF_Snd_LoadState
	add r0, r5, #0
	bl GF_Snd_LoadSeq
	str r5, [sp]
	mov r1, #1
	str r1, [sp, #4]
	sub r1, r1, #2
	add r0, r4, #0
	add r2, r1, #0
	add r3, r1, #0
	bl sub_02006C14
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02005DC4

	thumb_func_start sub_02005DF4
sub_02005DF4: ; 0x02005DF4
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	mov r0, #0x13
	add r6, r2, #0
	bl GF_SdatGetAttrPtr
	mov r0, #0x20
	bl GF_SdatGetAttrPtr
	add r4, r0, #0
	mov r0, #0
	bl GF_GetSoundHandle
	bl GF_NNS_SndPlayerGetSeqNo
	bl GF_GetBankBySeqNo
	add r1, r0, #0
	add r0, r5, #0
	bl sub_020051A4
	mov r0, #0
	bl SndRadio_StopSeq
	ldrh r0, [r4]
	bl GF_GetBankBySeqNo
	add r2, r0, #0
	str r5, [sp]
	mov r1, #1
	str r1, [sp, #4]
	sub r1, r1, #2
	add r0, r6, #0
	add r3, r1, #0
	bl sub_02006C14
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02005DF4

	thumb_func_start sub_02005E44
sub_02005E44: ; 0x02005E44
	push {r3, r4, r5, lr}
	sub sp, #8
	add r4, r0, #0
	mov r0, #0x15
	bl GF_SdatGetAttrPtr
	ldrb r0, [r0]
	cmp r0, #4
	beq _02005E60
	bl GF_AssertFail
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, pc}
_02005E60:
	add r0, r4, #0
	bl GF_GetPlayerNoBySeq
	cmp r0, #7
	beq _02005E74
	bl GF_AssertFail
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, pc}
_02005E74:
	add r0, r4, #0
	mov r1, #1
	bl GF_Snd_LoadSeqEx
	str r4, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #7
	add r1, r0, #0
	sub r1, #8
	add r2, r1, #0
	add r3, r1, #0
	bl sub_02006C14
	add r5, r0, #0
	bne _02005E9A
	add r0, r4, #0
	bl sub_02004920
_02005E9A:
	mov r0, #0
	bl SndRadio_StopSeq
	add r0, r4, #0
	bl sub_02004A60
	mov r0, #1
	bl GF_SndSetState
	add r0, r5, #0
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02005E44

	thumb_func_start StopBGM
StopBGM: ; 0x02005EB4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl NNS_SndPlayerStopSeqBySeqNo
	add r0, r5, #0
	bl GBSounds_GetGBSeqNoByDSSeqNo
	cmp r5, r0
	beq _02005ECE
	add r1, r4, #0
	bl NNS_SndPlayerStopSeqBySeqNo
_02005ECE:
	add r0, r5, #0
	bl GF_GetPlayerNoBySeq
	cmp r0, #0xff
	beq _02005EE4
	bl GF_GetSndHandleByPlayerNo
	bl GF_GetSoundHandle
	bl NNS_SndHandleReleaseSeq
_02005EE4:
	bl sub_02005EEC
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end StopBGM

	thumb_func_start sub_02005EEC
sub_02005EEC: ; 0x02005EEC
	push {r3, lr}
	mov r0, #0
	bl SndRadio_StopSeq
	mov r0, #0
	bl sub_02004A60
	mov r0, #0
	bl GF_SetCurrentPlayingBGM
	mov r0, #0
	bl sub_02004AB8
	mov r0, #0
	bl GF_SndSetState
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02005EEC

	thumb_func_start GF_SndStartFadeInBGM
GF_SndStartFadeInBGM: ; 0x02005F10
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r5, r1, #0
	add r4, r2, #0
	bl GF_GetCurrentPlayingBGM
	bl GF_GetPlayerNoBySeq
	cmp r0, #0xff
	beq _02005F4C
	bl GF_GetSndHandleByPlayerNo
	add r7, r0, #0
	cmp r4, #0
	bne _02005F36
	mov r1, #0
	add r2, r1, #0
	bl GF_SndHandleMoveVolume
_02005F36:
	add r0, r7, #0
	add r1, r6, #0
	add r2, r5, #0
	bl GF_SndHandleMoveVolume
	add r0, r5, #0
	bl sub_02005990
	mov r0, #3
	bl GF_SndSetState
_02005F4C:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end GF_SndStartFadeInBGM

	thumb_func_start GF_SndStartFadeOutBGM
GF_SndStartFadeOutBGM: ; 0x02005F50
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl GF_GetCurrentPlayingBGM
	bl GF_GetPlayerNoBySeq
	add r6, r0, #0
	cmp r6, #0xff
	beq _02005F86
	bl GF_SndGetFadeTimer
	cmp r0, #0
	bne _02005F80
	add r0, r6, #0
	bl GF_GetSndHandleByPlayerNo
	add r1, r5, #0
	add r2, r4, #0
	bl GF_SndHandleMoveVolume
	add r0, r4, #0
	bl sub_02005990
_02005F80:
	mov r0, #4
	bl GF_SndSetState
_02005F86:
	pop {r4, r5, r6, pc}
	thumb_func_end GF_SndStartFadeOutBGM

	thumb_func_start GF_SndGetFadeTimer
GF_SndGetFadeTimer: ; 0x02005F88
	push {r3, lr}
	mov r0, #7
	bl GF_SdatGetAttrPtr
	ldrh r0, [r0]
	pop {r3, pc}
	thumb_func_end GF_SndGetFadeTimer

	thumb_func_start sub_02005F94
sub_02005F94: ; 0x02005F94
	push {r3, lr}
	bl GF_GetPlayerNoBySeq
	bl GF_SndPlayerCountPlayingSeqByPlayerNo
	pop {r3, pc}
	thumb_func_end sub_02005F94

	thumb_func_start sub_02005FA0
sub_02005FA0: ; 0x02005FA0
	push {r3, r4, r5, lr}
	mov r0, #0x10
	bl GF_SdatGetAttrPtr
	add r5, r0, #0
	mov r0, #0x11
	bl GF_SdatGetAttrPtr
	add r4, r0, #0
	mov r0, #0
	bl NNS_SndPlayerStopSeqAll
	ldrb r0, [r5]
	cmp r0, #1
	bne _02005FC4
	mov r0, #0xe
	bl sub_02005728
_02005FC4:
	ldrb r0, [r4]
	cmp r0, #1
	bne _02005FD0
	mov r0, #0xf
	bl sub_02005728
_02005FD0:
	mov r0, #0
	bl GF_SndSetState
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02005FA0

	thumb_func_start sub_02005FD8
sub_02005FD8: ; 0x02005FD8
	push {r3, r4, r5, r6, r7, lr}
	mov r0, #0x10
	bl GF_SdatGetAttrPtr
	add r7, r0, #0
	mov r0, #0x11
	bl GF_SdatGetAttrPtr
	add r6, r0, #0
	mov r0, #7
	bl GF_GetSoundHandle
	mov r1, #0
	bl NNS_SndPlayerStopSeq
	bl sub_02005EEC
	mov r5, #0
	add r4, r5, #0
_02005FFE:
	add r0, r5, #3
	add r1, r4, #0
	bl sub_0200615C
	add r5, r5, #1
	cmp r5, #4
	blt _02005FFE
	mov r0, #0
	bl sub_02006300
	ldrb r0, [r7]
	cmp r0, #1
	bne _0200601E
	mov r0, #0xe
	bl sub_02005728
_0200601E:
	ldrb r0, [r6]
	cmp r0, #1
	bne _0200602A
	mov r0, #0xf
	bl sub_02005728
_0200602A:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02005FD8

	thumb_func_start sub_0200602C
sub_0200602C: ; 0x0200602C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl PlaySE
	add r6, r0, #0
	ldr r1, _02006048 ; =0x0000FFFF
	add r0, r5, #0
	add r2, r4, #0
	bl sub_020061B4
	add r0, r6, #0
	pop {r4, r5, r6, pc}
	nop
_02006048: .word 0x0000FFFF
	thumb_func_end sub_0200602C

	thumb_func_start PlaySE
PlaySE: ; 0x0200604C
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	bl GF_GetPlayerNoBySeq
	bl GF_GetSndHandleByPlayerNo
	mov r1, #0
	mvn r1, r1
	add r2, r1, #0
	add r3, r1, #0
	str r4, [sp]
	bl sub_020060BC
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end PlaySE

	thumb_func_start sub_0200606C
sub_0200606C: ; 0x0200606C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	bl GF_GetSndHandleByPlayerNo
	mov r2, #0
	mvn r2, r2
	add r1, r4, #0
	add r3, r2, #0
	str r5, [sp]
	bl sub_020060BC
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0200606C

	thumb_func_start sub_02006088
sub_02006088: ; 0x02006088
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	mov r0, #0x20
	bl GF_SdatGetAttrPtr
	add r4, r0, #0
	add r0, r5, #0
	bl GF_GetPlayerNoBySeq
	bl GF_GetSndHandleByPlayerNo
	add r6, r0, #0
	ldrh r0, [r4]
	bl GF_GetBankBySeqNo
	mov r1, #0
	mvn r1, r1
	add r2, r0, #0
	add r0, r6, #0
	add r3, r1, #0
	str r5, [sp]
	bl sub_020060BC
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	thumb_func_end sub_02006088

	thumb_func_start sub_020060BC
sub_020060BC: ; 0x020060BC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r6, r0, #0
	add r4, r1, #0
	add r7, r2, #0
	str r3, [sp, #8]
	ldr r5, [sp, #0x20]
	bl sub_02005BFC
	cmp r0, #1
	bne _020060E0
	ldr r0, _02006114 ; =0x000005DC
	sub r0, r5, r0
	cmp r0, #1
	bhi _020060E0
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_020060E0:
	lsl r0, r5, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r3, [sp, #8]
	add r0, r6, #0
	add r1, r4, #0
	add r2, r7, #0
	bl sub_02006C14
	add r4, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	bl sub_02005464
	cmp r4, #0
	bne _0200610C
	lsl r0, r5, #0x10
	lsr r0, r0, #0x10
	bl sub_02004920
_0200610C:
	add r0, r4, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_02006114: .word 0x000005DC
	thumb_func_end sub_020060BC

	thumb_func_start sub_02006118
sub_02006118: ; 0x02006118
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl PlaySE
	add r6, r0, #0
	beq _0200612E
	add r0, r5, #0
	add r1, r4, #0
	bl GF_SetVolumeBySeqNo
_0200612E:
	add r0, r6, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02006118

	thumb_func_start PlaySE_SetPitch
PlaySE_SetPitch: ; 0x02006134
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl PlaySE
	add r6, r0, #0
	beq _0200614C
	ldr r1, _02006150 ; =0x0000FFFF
	add r0, r5, #0
	add r2, r4, #0
	bl sub_0200592C
_0200614C:
	add r0, r6, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02006150: .word 0x0000FFFF
	thumb_func_end PlaySE_SetPitch

	thumb_func_start StopSE
StopSE: ; 0x02006154
	ldr r3, _02006158 ; =NNS_SndPlayerStopSeqBySeqNo
	bx r3
	.balign 4, 0
_02006158: .word NNS_SndPlayerStopSeqBySeqNo
	thumb_func_end StopSE

	thumb_func_start sub_0200615C
sub_0200615C: ; 0x0200615C
	push {r4, lr}
	add r4, r1, #0
	bl GF_GetSoundHandle
	add r1, r4, #0
	bl NNS_SndPlayerStopSeq
	pop {r4, pc}
	thumb_func_end sub_0200615C

	thumb_func_start sub_0200616C
sub_0200616C: ; 0x0200616C
	push {r3, r4, r5, lr}
	mov r5, #0
	add r4, r5, #0
_02006172:
	add r0, r5, #3
	add r1, r4, #0
	bl sub_0200615C
	add r5, r5, #1
	cmp r5, #4
	blt _02006172
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0200616C

	thumb_func_start IsSEPlaying
IsSEPlaying: ; 0x02006184
	push {r3, lr}
	bl GF_GetPlayerNoBySeq
	bl GF_SndPlayerCountPlayingSeqByPlayerNo
	pop {r3, pc}
	thumb_func_end IsSEPlaying

	thumb_func_start sub_02006190
sub_02006190: ; 0x02006190
	ldr r3, _02006194 ; =GF_SndPlayerCountPlayingSeqByPlayerNo
	bx r3
	.balign 4, 0
_02006194: .word GF_SndPlayerCountPlayingSeqByPlayerNo
	thumb_func_end sub_02006190

	thumb_func_start GF_IsAnySEPlaying
GF_IsAnySEPlaying: ; 0x02006198
	push {r4, lr}
	mov r4, #0
_0200619C:
	add r0, r4, #3
	bl GF_SndPlayerCountPlayingSeqByPlayerNo
	cmp r0, #1
	bne _020061AA
	mov r0, #1
	pop {r4, pc}
_020061AA:
	add r4, r4, #1
	cmp r4, #4
	blt _0200619C
	mov r0, #0
	pop {r4, pc}
	thumb_func_end GF_IsAnySEPlaying

	thumb_func_start sub_020061B4
sub_020061B4: ; 0x020061B4
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r2, #0
	bl GF_GetPlayerNoBySeq
	bl GF_GetSndHandleByPlayerNo
	bl GF_GetSoundHandle
	add r1, r5, #0
	add r2, r4, #0
	bl NNS_SndPlayerSetTrackPan
	pop {r3, r4, r5, pc}
	thumb_func_end sub_020061B4

	thumb_func_start sub_020061D0
sub_020061D0: ; 0x020061D0
	push {r4, lr}
	add r4, r1, #0
	bl GF_GetSndHandleByPlayerNo
	bl GF_GetSoundHandle
	ldr r1, _020061E8 ; =0x0000FFFF
	add r2, r4, #0
	bl NNS_SndPlayerSetTrackPan
	pop {r4, pc}
	nop
_020061E8: .word 0x0000FFFF
	thumb_func_end sub_020061D0

	thumb_func_start sub_020061EC
sub_020061EC: ; 0x020061EC
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	mov r0, #3
	bl GF_GetSndHandleByPlayerNo
	ldr r7, _02006214 ; =0x0000FFFF
	add r4, r0, #0
	mov r5, #0
_020061FC:
	add r0, r4, r5
	bl GF_GetSoundHandle
	add r1, r7, #0
	add r2, r6, #0
	bl NNS_SndPlayerSetTrackPan
	add r5, r5, #1
	cmp r5, #4
	blt _020061FC
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02006214: .word 0x0000FFFF
	thumb_func_end sub_020061EC

	thumb_func_start PlayCry
PlayCry: ; 0x02006218
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r0, #0x12
	str r1, [sp, #8]
	bl GF_SdatGetAttrPtr
	add r7, r0, #0
	mov r0, #0x24
	bl GF_SdatGetAttrPtr
	add r6, r0, #0
	mov r0, #0x35
	bl GF_SdatGetAttrPtr
	add r4, r0, #0
	ldr r1, [sp, #8]
	add r0, r5, #0
	bl sub_02006A0C
	cmp r0, #1
	bne _02006246
	ldr r5, _020062D8 ; =0x000001EE
_02006246:
	ldr r0, _020062D8 ; =0x000001EE
	cmp r5, r0
	beq _02006258
	add r0, r0, #1
	cmp r5, r0
	bhi _02006256
	cmp r5, #0
	bne _02006258
_02006256:
	mov r5, #1
_02006258:
	ldr r0, _020062DC ; =0x000001B9
	cmp r5, r0
	bne _0200627A
	mov r1, #0
	ldr r0, [r6]
	mov r2, #0x7f
	add r3, r1, #0
	bl sub_02006D04
	cmp r0, #1
	bne _0200627A
	mov r0, #0
	bl sub_02006E3C
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_0200627A:
	ldrb r0, [r7]
	cmp r0, #0
	bne _020062AC
	ldrb r0, [r4]
	cmp r0, #0
	bne _0200628C
	mov r0, #0
	bl sub_02006300
_0200628C:
	mov r0, #2
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #1
	sub r1, r0, #2
	add r2, r5, #0
	add r3, r1, #0
	bl sub_02006C14
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #1
	bl sub_02005464
	b _020062CC
_020062AC:
	mov r0, #2
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #8
	add r1, r0, #0
	sub r1, #9
	add r2, r5, #0
	add r3, r1, #0
	bl sub_02006C14
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #8
	bl sub_02005464
_020062CC:
	mov r0, #0
	bl sub_02006E3C
	add r0, r4, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_020062D8: .word 0x000001EE
_020062DC: .word 0x000001B9
	thumb_func_end PlayCry

	thumb_func_start sub_020062E0
sub_020062E0: ; 0x020062E0
	push {lr}
	sub sp, #0xc
	add r3, r0, #0
	mov r0, #0xb
	str r0, [sp]
	str r1, [sp, #4]
	add r1, r3, #0
	mov r0, #0
	str r2, [sp, #8]
	add r2, r0, #0
	mov r3, #0x7f
	bl sub_02006920
	mov r0, #1
	add sp, #0xc
	pop {pc}
	thumb_func_end sub_020062E0

	thumb_func_start sub_02006300
sub_02006300: ; 0x02006300
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r0, #0x10
	bl GF_SdatGetAttrPtr
	add r6, r0, #0
	mov r0, #0x11
	bl GF_SdatGetAttrPtr
	add r4, r0, #0
	mov r0, #0xf
	bl GF_SdatGetAttrPtr
	mov r0, #1
	bl GF_GetSoundHandle
	add r1, r5, #0
	bl NNS_SndPlayerStopSeq
	mov r0, #8
	bl GF_GetSoundHandle
	add r1, r5, #0
	bl NNS_SndPlayerStopSeq
	ldrb r0, [r6]
	cmp r0, #1
	bne _02006344
	mov r0, #0xe
	bl sub_020058B8
	mov r0, #0xe
	bl sub_02005680
_02006344:
	ldrb r0, [r4]
	cmp r0, #1
	bne _02006356
	mov r0, #0xf
	bl sub_020058B8
	mov r0, #0xf
	bl sub_02005680
_02006356:
	bl sub_02006DB8
	bl sub_02006A30
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02006300

	thumb_func_start IsCryFinished
IsCryFinished: ; 0x02006360
	push {r3, r4, r5, lr}
	mov r0, #0x10
	bl GF_SdatGetAttrPtr
	add r5, r0, #0
	mov r0, #0x11
	bl GF_SdatGetAttrPtr
	add r4, r0, #0
	mov r0, #0xf
	bl GF_SdatGetAttrPtr
	mov r0, #0x2e
	bl GF_SdatGetAttrPtr
	ldrb r0, [r5]
	cmp r0, #1
	bne _0200638C
	mov r0, #0xe
	bl sub_02005738
	pop {r3, r4, r5, pc}
_0200638C:
	ldrb r0, [r4]
	cmp r0, #1
	bne _0200639A
	mov r0, #0xf
	bl sub_02005738
	pop {r3, r4, r5, pc}
_0200639A:
	mov r0, #0
	bl GF_SndPlayerCountPlayingSeqByPlayerNo
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end IsCryFinished

	thumb_func_start PlayCryEx
PlayCryEx: ; 0x020063A4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	str r0, [sp, #4]
	ldr r0, [sp, #0x38]
	add r4, r1, #0
	str r0, [sp, #0x38]
	mov r0, #0x10
	add r6, r2, #0
	add r7, r3, #0
	ldr r5, [sp, #0x3c]
	bl GF_SdatGetAttrPtr
	str r0, [sp, #0x14]
	mov r0, #0x11
	bl GF_SdatGetAttrPtr
	str r0, [sp, #0x10]
	mov r0, #0x12
	bl GF_SdatGetAttrPtr
	str r0, [sp, #0xc]
	mov r0, #0x1e
	bl GF_SdatGetAttrPtr
	str r0, [sp, #8]
	mov r0, #0x24
	bl GF_SdatGetAttrPtr
	add r0, r4, #0
	add r1, r5, #0
	bl sub_02006A0C
	cmp r0, #1
	bne _020063EA
	ldr r4, _02006740 ; =0x000001EE
_020063EA:
	ldr r0, _02006740 ; =0x000001EE
	cmp r4, r0
	beq _020063FC
	add r0, r0, #1
	cmp r4, r0
	bhi _020063FA
	cmp r4, #0
	bne _020063FC
_020063FA:
	mov r4, #1
_020063FC:
	lsr r0, r6, #0x1f
	add r0, r6, r0
	asr r0, r0, #1
	str r0, [sp, #0x1c]
	add r0, #0x40
	str r0, [sp, #0x1c]
	add r0, r7, #0
	str r0, [sp, #0x18]
	sub r0, #0x1e
	str r0, [sp, #0x18]
	cmp r0, #0
	bgt _02006418
	mov r0, #1
	str r0, [sp, #0x18]
_02006418:
	ldr r0, [sp, #0xc]
	mov r1, #0
	strb r1, [r0]
	ldr r0, [sp, #0x14]
	ldrb r0, [r0]
	cmp r0, #1
	bne _02006432
	mov r0, #0xe
	bl sub_020058B8
	mov r0, #0xe
	bl sub_02005680
_02006432:
	ldr r0, [sp, #0x10]
	ldrb r0, [r0]
	cmp r0, #1
	bne _02006446
	mov r0, #0xf
	bl sub_020058B8
	mov r0, #0xf
	bl sub_02005680
_02006446:
	ldr r0, _02006744 ; =0x000001B9
	cmp r4, r0
	bne _020064DA
	ldr r1, [sp, #4]
	cmp r1, #0xc
	bhi _020064D4
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0200645E: ; jump table
	.short _02006478 - _0200645E - 2 ; case 0
	.short _02006478 - _0200645E - 2 ; case 1
	.short _02006478 - _0200645E - 2 ; case 2
	.short _020064D4 - _0200645E - 2 ; case 3
	.short _020064D4 - _0200645E - 2 ; case 4
	.short _02006478 - _0200645E - 2 ; case 5
	.short _020064D4 - _0200645E - 2 ; case 6
	.short _020064D4 - _0200645E - 2 ; case 7
	.short _020064D4 - _0200645E - 2 ; case 8
	.short _020064D4 - _0200645E - 2 ; case 9
	.short _020064D4 - _0200645E - 2 ; case 10
	.short _02006478 - _0200645E - 2 ; case 11
	.short _02006478 - _0200645E - 2 ; case 12
_02006478:
	add r1, r5, #0
	bl PlayCry
	ldr r0, [sp, #8]
	ldrb r0, [r0]
	cmp r0, #0
	bne _0200649C
	ldr r1, _02006748 ; =0x0000FFFF
	mov r0, #1
	add r2, r6, #0
	bl GF_SndHandleSetTrackPan
	add r0, r4, #0
	mov r1, #1
	add r2, r7, #0
	bl sub_02006820
	b _020064CE
_0200649C:
	ldr r0, [sp, #0x14]
	ldrb r0, [r0]
	cmp r0, #1
	bne _020064BA
	ldr r1, [sp, #0x1c]
	mov r0, #0xe
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl sub_02005748
	mov r0, #0xe
	add r1, r7, #0
	bl sub_02005774
	b _020064CE
_020064BA:
	ldr r1, _02006748 ; =0x0000FFFF
	mov r0, #1
	add r2, r6, #0
	bl GF_SndHandleSetTrackPan
	add r0, r4, #0
	mov r1, #1
	add r2, r7, #0
	bl sub_02006820
_020064CE:
	add sp, #0x20
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_020064D4:
	mov r0, #1
	bl sub_02006E3C
_020064DA:
	ldr r0, [sp, #4]
	cmp r0, #0xe
	bls _020064E2
	b _02006814
_020064E2:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_020064EE: ; jump table
	.short _0200650C - _020064EE - 2 ; case 0
	.short _0200652A - _020064EE - 2 ; case 1
	.short _02006550 - _020064EE - 2 ; case 2
	.short _02006596 - _020064EE - 2 ; case 3
	.short _020065E4 - _020064EE - 2 ; case 4
	.short _02006636 - _020064EE - 2 ; case 5
	.short _02006660 - _020064EE - 2 ; case 6
	.short _020066A8 - _020064EE - 2 ; case 7
	.short _020066DA - _020064EE - 2 ; case 8
	.short _0200670A - _020064EE - 2 ; case 9
	.short _0200674C - _020064EE - 2 ; case 10
	.short _0200677E - _020064EE - 2 ; case 11
	.short _020067A8 - _020064EE - 2 ; case 12
	.short _020067DA - _020064EE - 2 ; case 13
	.short _0200680C - _020064EE - 2 ; case 14
_0200650C:
	add r0, r4, #0
	add r1, r5, #0
	bl PlayCry
	ldr r1, _02006748 ; =0x0000FFFF
	mov r0, #1
	add r2, r6, #0
	bl GF_SndHandleSetTrackPan
	add r0, r4, #0
	mov r1, #1
	add r2, r7, #0
	bl sub_02006820
	b _02006814
_0200652A:
	add r0, r4, #0
	add r1, r5, #0
	bl PlayCry
	ldr r1, _02006748 ; =0x0000FFFF
	mov r0, #1
	add r2, r6, #0
	bl GF_SndHandleSetTrackPan
	add r0, r4, #0
	mov r1, #1
	add r2, r7, #0
	bl sub_02006820
	ldr r1, [sp, #0x38]
	mov r0, #0x14
	bl sub_02006838
	b _02006814
_02006550:
	add r0, r4, #0
	add r1, r5, #0
	bl PlayCry
	ldr r1, _02006748 ; =0x0000FFFF
	mov r0, #1
	add r2, r6, #0
	bl GF_SndHandleSetTrackPan
	add r0, r4, #0
	mov r1, #1
	add r2, r7, #0
	bl sub_02006820
	ldr r1, _02006748 ; =0x0000FFFF
	mov r0, #1
	mov r2, #0x40
	bl GF_SndHandleSetTrackPitch
	add r0, r4, #0
	mov r1, #0x14
	add r2, r5, #0
	bl sub_02006AC0
	ldr r1, _02006748 ; =0x0000FFFF
	mov r0, #8
	add r2, r6, #0
	bl GF_SndHandleSetTrackPan
	ldr r2, [sp, #0x18]
	add r0, r4, #0
	mov r1, #8
	bl sub_02006820
	b _02006814
_02006596:
	add r0, r4, #0
	add r1, r5, #0
	bl PlayCry
	ldr r1, _02006748 ; =0x0000FFFF
	mov r0, #1
	add r2, r6, #0
	bl GF_SndHandleSetTrackPan
	add r0, r4, #0
	mov r1, #1
	add r2, r7, #0
	bl sub_02006820
	ldr r1, [sp, #0x38]
	mov r0, #0x1e
	bl sub_02006838
	ldr r1, _02006748 ; =0x0000FFFF
	mov r0, #1
	mov r2, #0xc0
	bl GF_SndHandleSetTrackPitch
	add r0, r4, #0
	mov r1, #0x10
	add r2, r5, #0
	bl sub_02006AC0
	ldr r1, _02006748 ; =0x0000FFFF
	mov r0, #8
	add r2, r6, #0
	bl GF_SndHandleSetTrackPan
	ldr r2, [sp, #0x18]
	add r0, r4, #0
	mov r1, #8
	bl sub_02006820
	b _02006814
_020065E4:
	mov r0, #0xe
	bl sub_02005600
	ldr r0, [sp, #0x38]
	ldr r2, [sp, #0x1c]
	str r0, [sp]
	add r0, r4, #0
	add r1, r7, #0
	mov r3, #0xe
	bl sub_020057AC
	ldr r1, [sp, #0x1c]
	mov r0, #0xe
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl sub_02005748
	ldr r1, [sp, #0x38]
	mov r0, #0xf
	bl sub_02006838
	mov r1, #0x86
	mov r0, #0xe
	lsl r1, r1, #8
	bl sub_02005760
	ldr r0, [sp, #0x38]
	mov r1, #0x3f
	str r0, [sp]
	ldr r2, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	add r0, r4, #0
	mvn r1, r1
	bl sub_02006AF4
	mov r1, #0x86
	mov r0, #0xf
	lsl r1, r1, #8
	bl sub_02005760
	b _02006814
_02006636:
	add r0, r4, #0
	add r1, r5, #0
	bl PlayCry
	ldr r1, _02006748 ; =0x0000FFFF
	mov r0, #1
	add r2, r6, #0
	bl GF_SndHandleSetTrackPan
	add r0, r4, #0
	mov r1, #1
	add r2, r7, #0
	bl sub_02006820
	mov r0, #1
	add r2, r0, #0
	ldr r1, _02006748 ; =0x0000FFFF
	sub r2, #0xe1
	bl GF_SndHandleSetTrackPitch
	b _02006814
_02006660:
	add r0, r4, #0
	add r1, r5, #0
	bl PlayCry
	ldr r1, _02006748 ; =0x0000FFFF
	mov r0, #1
	add r2, r6, #0
	bl GF_SndHandleSetTrackPan
	add r0, r4, #0
	mov r1, #1
	add r2, r7, #0
	bl sub_02006820
	ldr r1, _02006748 ; =0x0000FFFF
	mov r0, #1
	mov r2, #0x2c
	bl GF_SndHandleSetTrackPitch
	mov r1, #0x3f
	add r0, r4, #0
	mvn r1, r1
	add r2, r5, #0
	bl sub_02006AC0
	ldr r1, _02006748 ; =0x0000FFFF
	mov r0, #8
	add r2, r6, #0
	bl GF_SndHandleSetTrackPan
	ldr r2, [sp, #0x18]
	add r0, r4, #0
	mov r1, #8
	bl sub_02006820
	b _02006814
_020066A8:
	add r0, r4, #0
	add r1, r5, #0
	bl PlayCry
	ldr r1, _02006748 ; =0x0000FFFF
	mov r0, #1
	add r2, r6, #0
	bl GF_SndHandleSetTrackPan
	add r0, r4, #0
	mov r1, #1
	add r2, r7, #0
	bl sub_02006820
	ldr r1, [sp, #0x38]
	mov r0, #0xb
	bl sub_02006838
	mov r0, #1
	add r2, r0, #0
	ldr r1, _02006748 ; =0x0000FFFF
	sub r2, #0x81
	bl GF_SndHandleSetTrackPitch
	b _02006814
_020066DA:
	add r0, r4, #0
	add r1, r5, #0
	bl PlayCry
	ldr r1, _02006748 ; =0x0000FFFF
	mov r0, #1
	add r2, r6, #0
	bl GF_SndHandleSetTrackPan
	add r0, r4, #0
	mov r1, #1
	add r2, r7, #0
	bl sub_02006820
	ldr r1, [sp, #0x38]
	mov r0, #0x3c
	bl sub_02006838
	ldr r1, _02006748 ; =0x0000FFFF
	mov r0, #1
	mov r2, #0x3c
	bl GF_SndHandleSetTrackPitch
	b _02006814
_0200670A:
	mov r0, #0xe
	bl sub_02005600
	ldr r0, [sp, #0x38]
	ldr r2, [sp, #0x1c]
	str r0, [sp]
	add r0, r4, #0
	add r1, r7, #0
	mov r3, #0xe
	bl sub_020057AC
	ldr r1, [sp, #0x1c]
	mov r0, #0xe
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl sub_02005748
	ldr r1, [sp, #0x38]
	mov r0, #0xd
	bl sub_02006838
	mov r1, #0x1a
	mov r0, #0xe
	lsl r1, r1, #0xa
	bl sub_02005760
	b _02006814
	.balign 4, 0
_02006740: .word 0x000001EE
_02006744: .word 0x000001B9
_02006748: .word 0x0000FFFF
_0200674C:
	add r0, r4, #0
	add r1, r5, #0
	bl PlayCry
	ldr r1, _0200681C ; =0x0000FFFF
	mov r0, #1
	add r2, r6, #0
	bl GF_SndHandleSetTrackPan
	add r0, r4, #0
	mov r1, #1
	add r2, r7, #0
	bl sub_02006820
	ldr r1, [sp, #0x38]
	mov r0, #0x64
	bl sub_02006838
	mov r0, #1
	add r2, r0, #0
	ldr r1, _0200681C ; =0x0000FFFF
	sub r2, #0x2d
	bl GF_SndHandleSetTrackPitch
	b _02006814
_0200677E:
	add r0, r4, #0
	add r1, r5, #0
	bl PlayCry
	ldr r1, _0200681C ; =0x0000FFFF
	mov r0, #1
	add r2, r6, #0
	bl GF_SndHandleSetTrackPan
	add r0, r4, #0
	mov r1, #1
	add r2, r7, #0
	bl sub_02006820
	mov r0, #1
	add r2, r0, #0
	ldr r1, _0200681C ; =0x0000FFFF
	sub r2, #0x61
	bl GF_SndHandleSetTrackPitch
	b _02006814
_020067A8:
	add r0, r4, #0
	add r1, r5, #0
	bl PlayCry
	ldr r1, _0200681C ; =0x0000FFFF
	mov r0, #1
	add r2, r6, #0
	bl GF_SndHandleSetTrackPan
	add r0, r4, #0
	mov r1, #1
	add r2, r7, #0
	bl sub_02006820
	ldr r1, [sp, #0x38]
	mov r0, #0x14
	bl sub_02006838
	mov r0, #1
	add r2, r0, #0
	ldr r1, _0200681C ; =0x0000FFFF
	sub r2, #0x61
	bl GF_SndHandleSetTrackPitch
	b _02006814
_020067DA:
	add r0, r4, #0
	add r1, r5, #0
	bl PlayCry
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x7f
	bl sub_02006820
	add r0, r4, #0
	mov r1, #0x14
	add r2, r5, #0
	bl sub_02006AC0
	ldr r1, _0200681C ; =0x0000FFFF
	mov r0, #8
	add r2, r6, #0
	bl GF_SndHandleSetTrackPan
	mov r0, #8
	add r1, r7, #0
	mov r2, #0
	bl GF_SndHandleMoveVolume
	b _02006814
_0200680C:
	add r0, r4, #0
	add r1, r5, #0
	bl PlayCry
_02006814:
	mov r0, #1
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0200681C: .word 0x0000FFFF
	thumb_func_end PlayCryEx

	thumb_func_start sub_02006820
sub_02006820: ; 0x02006820
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	add r1, r2, #0
	bl GF_SndHandleSetInitialVolume
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02005464
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02006820

	thumb_func_start sub_02006838
sub_02006838: ; 0x02006838
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #0x23
	bl GF_SdatGetAttrPtr
	add r6, r0, #0
	bl sub_020068F8
	add r0, r4, #0
	mov r1, #8
	bl AllocFromHeap
	add r4, r0, #0
	bne _0200685C
	bl GF_AssertFail
	pop {r4, r5, r6, pc}
_0200685C:
	mov r2, #0
	strb r2, [r4]
	strb r2, [r4, #1]
	strb r2, [r4, #2]
	strb r2, [r4, #3]
	strb r2, [r4, #4]
	strb r2, [r4, #5]
	strb r2, [r4, #6]
	strb r2, [r4, #7]
	ldr r0, _02006880 ; =sub_02006884
	add r1, r4, #0
	str r5, [r4]
	bl CreateSysTask
	str r0, [r4, #4]
	str r0, [r6]
	pop {r4, r5, r6, pc}
	nop
_02006880: .word sub_02006884
	thumb_func_end sub_02006838

	thumb_func_start sub_02006884
sub_02006884: ; 0x02006884
	push {r4, r5, r6, lr}
	mov r0, #0x10
	add r5, r1, #0
	bl GF_SdatGetAttrPtr
	add r6, r0, #0
	mov r0, #0x11
	bl GF_SdatGetAttrPtr
	ldr r2, [r5]
	add r4, r0, #0
	cmp r2, #0xa
	bne _020068B0
	mov r0, #1
	mov r1, #0
	bl GF_SndHandleMoveVolume
	ldr r2, [r5]
	mov r0, #8
	mov r1, #0
	bl GF_SndHandleMoveVolume
_020068B0:
	ldr r0, [r5]
	sub r0, r0, #1
	str r0, [r5]
	bl IsCryFinished
	cmp r0, #0
	bne _020068C2
	mov r0, #0
	str r0, [r5]
_020068C2:
	ldr r0, [r5]
	cmp r0, #0
	bgt _020068F6
	mov r0, #0
	bl sub_02006300
	ldrb r0, [r6]
	cmp r0, #1
	bne _020068E0
	mov r0, #0xe
	bl sub_020058B8
	mov r0, #0xe
	bl sub_02005680
_020068E0:
	ldrb r0, [r4]
	cmp r0, #1
	bne _020068F2
	mov r0, #0xf
	bl sub_020058B8
	mov r0, #0xf
	bl sub_02005680
_020068F2:
	bl sub_020068F8
_020068F6:
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02006884

	thumb_func_start sub_020068F8
sub_020068F8: ; 0x020068F8
	push {r3, r4, r5, lr}
	mov r0, #0x23
	bl GF_SdatGetAttrPtr
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _0200691A
	bl sub_0201F988
	add r5, r0, #0
	ldr r0, [r4]
	bl DestroySysTask
	add r0, r5, #0
	bl FreeToHeap
_0200691A:
	mov r0, #0
	str r0, [r4]
	pop {r3, r4, r5, pc}
	thumb_func_end sub_020068F8

	thumb_func_start sub_02006920
sub_02006920: ; 0x02006920
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r6, r0, #0
	mov r0, #6
	add r5, r1, #0
	add r7, r2, #0
	str r3, [sp, #8]
	bl GF_SdatGetAttrPtr
	add r4, r0, #0
	mov r0, #0x35
	bl GF_SdatGetAttrPtr
	str r0, [sp, #0xc]
	ldrb r0, [r4]
	cmp r0, #0
	bne _02006974
	mov r0, #0x29
	bl GF_SdatGetAttrPtr
	str r0, [sp, #0x24]
	mov r0, #0x2d
	bl GF_SdatGetAttrPtr
	str r0, [sp, #0x20]
	mov r0, #0x2a
	bl GF_SdatGetAttrPtr
	str r0, [sp, #0x1c]
	mov r0, #0x2b
	bl GF_SdatGetAttrPtr
	str r0, [sp, #0x18]
	mov r0, #0x2c
	bl GF_SdatGetAttrPtr
	str r0, [sp, #0x14]
	mov r0, #0x2e
	bl GF_SdatGetAttrPtr
	str r0, [sp, #0x10]
	b _020069A4
_02006974:
	mov r0, #0x2f
	bl GF_SdatGetAttrPtr
	str r0, [sp, #0x24]
	mov r0, #0x33
	bl GF_SdatGetAttrPtr
	str r0, [sp, #0x20]
	mov r0, #0x30
	bl GF_SdatGetAttrPtr
	str r0, [sp, #0x1c]
	mov r0, #0x31
	bl GF_SdatGetAttrPtr
	str r0, [sp, #0x18]
	mov r0, #0x32
	bl GF_SdatGetAttrPtr
	str r0, [sp, #0x14]
	mov r0, #0x34
	bl GF_SdatGetAttrPtr
	str r0, [sp, #0x10]
_020069A4:
	ldr r0, [sp, #0xc]
	ldrb r0, [r0]
	cmp r0, #1
	bne _020069B4
	ldrb r1, [r4]
	mov r0, #1
	eor r0, r1
	strb r0, [r4]
_020069B4:
	add r1, sp, #0x30
	ldrb r1, [r1, #0x18]
	add r0, r5, #0
	bl sub_02006A0C
	cmp r0, #1
	bne _020069C4
	ldr r5, _02006A08 ; =0x000001EE
_020069C4:
	cmp r5, #0
	beq _02006A04
	add r1, sp, #0x30
	ldrb r0, [r1, #0x14]
	cmp r0, #0
	bne _020069E8
	ldr r0, [sp, #0x40]
	ldr r3, [sp, #8]
	str r0, [sp]
	ldrb r0, [r1, #0x18]
	add r1, r5, #0
	add r2, r7, #0
	str r0, [sp, #4]
	add r0, r6, #0
	bl PlayCryEx
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
_020069E8:
	ldr r1, [sp, #0x24]
	ldr r2, [sp, #8]
	str r6, [r1]
	ldr r1, [sp, #0x20]
	strh r5, [r1]
	ldr r1, [sp, #0x1c]
	str r7, [r1]
	ldr r1, [sp, #0x18]
	str r2, [r1]
	ldr r2, [sp, #0x40]
	ldr r1, [sp, #0x14]
	str r2, [r1]
	ldr r1, [sp, #0x10]
	strb r0, [r1]
_02006A04:
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02006A08: .word 0x000001EE
	thumb_func_end sub_02006920

	thumb_func_start sub_02006A0C
sub_02006A0C: ; 0x02006A0C
	mov r2, #0x7b
	lsl r2, r2, #2
	cmp r0, r2
	bne _02006A1C
	cmp r1, #1
	bne _02006A1C
	mov r0, #1
	bx lr
_02006A1C:
	ldr r1, _02006A2C ; =0x000001EE
	cmp r0, r1
	bne _02006A26
	mov r0, #1
	bx lr
_02006A26:
	mov r0, #0
	bx lr
	nop
_02006A2C: .word 0x000001EE
	thumb_func_end sub_02006A0C

	thumb_func_start sub_02006A30
sub_02006A30: ; 0x02006A30
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	mov r0, #0x29
	bl GF_SdatGetAttrPtr
	add r5, r0, #0
	mov r0, #0x2d
	bl GF_SdatGetAttrPtr
	add r4, r0, #0
	mov r0, #0x2a
	bl GF_SdatGetAttrPtr
	add r6, r0, #0
	mov r0, #0x2b
	bl GF_SdatGetAttrPtr
	add r7, r0, #0
	mov r0, #0x2c
	bl GF_SdatGetAttrPtr
	str r0, [sp]
	mov r0, #0x2e
	bl GF_SdatGetAttrPtr
	str r0, [sp, #4]
	mov r0, #0x2f
	bl GF_SdatGetAttrPtr
	str r0, [sp, #8]
	mov r0, #0x33
	bl GF_SdatGetAttrPtr
	str r0, [sp, #0xc]
	mov r0, #0x30
	bl GF_SdatGetAttrPtr
	str r0, [sp, #0x10]
	mov r0, #0x31
	bl GF_SdatGetAttrPtr
	str r0, [sp, #0x14]
	mov r0, #0x32
	bl GF_SdatGetAttrPtr
	str r0, [sp, #0x18]
	mov r0, #0x34
	bl GF_SdatGetAttrPtr
	mov r1, #0
	str r1, [r5]
	strh r1, [r4]
	str r1, [r6]
	ldr r2, [sp]
	str r1, [r7]
	str r1, [r2]
	ldr r2, [sp, #4]
	strb r1, [r2]
	ldr r2, [sp, #8]
	str r1, [r2]
	ldr r2, [sp, #0xc]
	strh r1, [r2]
	ldr r2, [sp, #0x10]
	str r1, [r2]
	ldr r2, [sp, #0x14]
	str r1, [r2]
	ldr r2, [sp, #0x18]
	str r1, [r2]
	strb r1, [r0]
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02006A30

	thumb_func_start sub_02006AC0
sub_02006AC0: ; 0x02006AC0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r0, #0x12
	add r4, r1, #0
	add r6, r2, #0
	bl GF_SdatGetAttrPtr
	mov r1, #1
	strb r1, [r0]
	add r0, r1, #0
	bl sub_02006E3C
	add r0, r5, #0
	add r1, r6, #0
	bl PlayCry
	add r5, r0, #0
	ldr r1, _02006AF0 ; =0x0000FFFF
	mov r0, #8
	add r2, r4, #0
	bl GF_SndHandleSetTrackPitch
	add r0, r5, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02006AF0: .word 0x0000FFFF
	thumb_func_end sub_02006AC0

	thumb_func_start sub_02006AF4
sub_02006AF4: ; 0x02006AF4
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	mov r0, #0x12
	add r4, r2, #0
	add r6, r3, #0
	bl GF_SdatGetAttrPtr
	mov r1, #1
	strb r1, [r0]
	mov r0, #0xf
	bl sub_02005600
	ldr r0, [sp, #0x18]
	add r1, r4, #0
	str r0, [sp]
	add r0, r5, #0
	add r2, r6, #0
	mov r3, #0xf
	bl sub_020057AC
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02006AF4

	thumb_func_start PlayFanfare
PlayFanfare: ; 0x02006B24
	push {r3, r4, r5, lr}
	sub sp, #8
	add r4, r0, #0
	bl GF_GetBankInfoBySeqNo
	add r0, r4, #0
	bl sub_02006C04
	bl GF_GetCurrentPlayingBGM
	bl GF_GetPlayerNoBySeq
	cmp r0, #0xff
	beq _02006B48
	mov r1, #1
	bl sub_020053A8
	b _02006B4E
_02006B48:
	mov r0, #1
	bl SndRadio_PausePlayer
_02006B4E:
	mov r0, #0x1d
	bl GF_SdatGetAttrPtr
	bl GF_Snd_SaveState
	add r0, r4, #0
	mov r1, #3
	bl GF_Snd_LoadSeqEx
	str r4, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #2
	sub r1, r0, #3
	add r2, r1, #0
	add r3, r1, #0
	bl sub_02006C14
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #2
	bl sub_02005464
	add r0, r5, #0
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end PlayFanfare

	thumb_func_start sub_02006B84
sub_02006B84: ; 0x02006B84
	push {r4, lr}
	mov r0, #0xe
	bl GF_SdatGetAttrPtr
	add r4, r0, #0
	mov r0, #2
	bl GF_SndPlayerCountPlayingSeqByPlayerNo
	cmp r0, #0
	beq _02006B9C
	mov r0, #1
	pop {r4, pc}
_02006B9C:
	ldrh r0, [r4]
	cmp r0, #0
	beq _02006BAA
	sub r0, r0, #1
	strh r0, [r4]
	mov r0, #1
	pop {r4, pc}
_02006BAA:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02006B84

	thumb_func_start sub_02006BB0
sub_02006BB0: ; 0x02006BB0
	push {r4, lr}
	add r4, r0, #0
	mov r0, #2
	bl GF_GetSoundHandle
	add r1, r4, #0
	bl NNS_SndPlayerStopSeq
	mov r0, #6
	bl sub_02005328
	bl GF_Snd_LoadState
	pop {r4, pc}
	thumb_func_end sub_02006BB0

	thumb_func_start IsFanfarePlaying
IsFanfarePlaying: ; 0x02006BCC
	push {r3, lr}
	mov r0, #0xe
	bl GF_SdatGetAttrPtr
	bl sub_02006B84
	cmp r0, #1
	bne _02006BE0
	mov r0, #1
	pop {r3, pc}
_02006BE0:
	mov r0, #0
	bl sub_02006BB0
	bl GF_GetCurrentPlayingBGM
	bl GF_GetPlayerNoBySeq
	cmp r0, #0xff
	beq _02006BF8
	mov r1, #0
	bl sub_020053A8
_02006BF8:
	mov r0, #0
	bl SndRadio_PausePlayer
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end IsFanfarePlaying

	thumb_func_start sub_02006C04
sub_02006C04: ; 0x02006C04
	push {r3, lr}
	mov r0, #0xe
	bl GF_SdatGetAttrPtr
	mov r1, #0xf
	strh r1, [r0]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02006C04

	thumb_func_start sub_02006C14
sub_02006C14: ; 0x02006C14
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp, #4]
	add r0, sp, #0x10
	ldrh r6, [r0, #0x10]
	ldrb r0, [r0, #0x14]
	add r5, r1, #0
	add r7, r2, #0
	str r3, [sp, #8]
	cmp r0, #1
	bne _02006C6A
	bl SoundSys_GetGBSoundsState
	cmp r0, #1
	bne _02006C6A
	add r0, sp, #0x10
	ldrh r0, [r0, #0x10]
	bl GBSounds_GetGBSeqNoByDSSeqNo
	add r1, sp, #0x10
	ldrh r1, [r1, #0x10]
	add r4, r0, #0
	cmp r1, r4
	beq _02006C6A
	add r6, r4, #0
	ldr r7, _02006C88 ; =0x000002BD
	bl sub_02004AB8
	add r0, r4, #0
	bl GF_GetPlayerNoBySeq
	mov r1, #0
	mvn r1, r1
	cmp r5, r1
	beq _02006C5E
	lsl r0, r5, #0x18
	lsr r0, r0, #0x18
_02006C5E:
	cmp r0, #7
	bne _02006C6A
	add r0, r4, #0
	mov r1, #1
	bl GF_Snd_LoadSeqEx
_02006C6A:
	ldr r0, [sp, #4]
	bl GF_GetSoundHandle
	ldr r3, [sp, #8]
	add r1, r5, #0
	add r2, r7, #0
	str r6, [sp]
	bl NNS_SndArcPlayerStartSeqEx
	add r4, r0, #0
	bl GBSounds_SetAllocatableChannels
	add r0, r4, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02006C88: .word 0x000002BD
	thumb_func_end sub_02006C14
