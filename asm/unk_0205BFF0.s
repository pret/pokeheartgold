	.include "asm/macros.inc"
	.include "unk_0205BFF0.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_0205BFF0
sub_0205BFF0: ; 0x0205BFF0
	cmp r1, #3
	bhi _0205C016
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0205C000: ; jump table
	.short _0205C008 - _0205C000 - 2 ; case 0
	.short _0205C00C - _0205C000 - 2 ; case 1
	.short _0205C010 - _0205C000 - 2 ; case 2
	.short _0205C014 - _0205C000 - 2 ; case 3
_0205C008:
	mov r2, #0xb
	b _0205C016
_0205C00C:
	mov r2, #0x13
	b _0205C016
_0205C010:
	mov r2, #0x1b
	b _0205C016
_0205C014:
	mov r2, #0x73
_0205C016:
	lsl r0, r0, #2
	add r0, r2, r0
	bx lr
	thumb_func_end sub_0205BFF0

	thumb_func_start sub_0205C01C
sub_0205C01C: ; 0x0205C01C
	cmp r1, #3
	bhi _0205C042
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0205C02C: ; jump table
	.short _0205C034 - _0205C02C - 2 ; case 0
	.short _0205C038 - _0205C02C - 2 ; case 1
	.short _0205C03C - _0205C02C - 2 ; case 2
	.short _0205C040 - _0205C02C - 2 ; case 3
_0205C034:
	mov r2, #0xa
	b _0205C042
_0205C038:
	mov r2, #0x12
	b _0205C042
_0205C03C:
	mov r2, #0x1a
	b _0205C042
_0205C040:
	mov r2, #0x72
_0205C042:
	lsl r0, r0, #2
	add r0, r2, r0
	bx lr
	thumb_func_end sub_0205C01C

	thumb_func_start sub_0205C048
sub_0205C048: ; 0x0205C048
	cmp r1, #3
	bhi _0205C06E
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0205C058: ; jump table
	.short _0205C060 - _0205C058 - 2 ; case 0
	.short _0205C064 - _0205C058 - 2 ; case 1
	.short _0205C068 - _0205C058 - 2 ; case 2
	.short _0205C06C - _0205C058 - 2 ; case 3
_0205C060:
	mov r2, #0xd
	b _0205C06E
_0205C064:
	mov r2, #0x15
	b _0205C06E
_0205C068:
	mov r2, #0x1d
	b _0205C06E
_0205C06C:
	mov r2, #0x75
_0205C06E:
	lsl r0, r0, #2
	add r0, r2, r0
	bx lr
	thumb_func_end sub_0205C048

	thumb_func_start sub_0205C074
sub_0205C074: ; 0x0205C074
	cmp r1, #3
	bhi _0205C09A
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0205C084: ; jump table
	.short _0205C08C - _0205C084 - 2 ; case 0
	.short _0205C090 - _0205C084 - 2 ; case 1
	.short _0205C094 - _0205C084 - 2 ; case 2
	.short _0205C098 - _0205C084 - 2 ; case 3
_0205C08C:
	mov r2, #0xc
	b _0205C09A
_0205C090:
	mov r2, #0x14
	b _0205C09A
_0205C094:
	mov r2, #0x1c
	b _0205C09A
_0205C098:
	mov r2, #0x74
_0205C09A:
	lsl r0, r0, #2
	add r0, r2, r0
	bx lr
	thumb_func_end sub_0205C074

	thumb_func_start sub_0205C0A0
sub_0205C0A0: ; 0x0205C0A0
	cmp r0, #3
	bhi _0205C0C6
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0205C0B0: ; jump table
	.short _0205C0B8 - _0205C0B0 - 2 ; case 0
	.short _0205C0BC - _0205C0B0 - 2 ; case 1
	.short _0205C0C0 - _0205C0B0 - 2 ; case 2
	.short _0205C0C4 - _0205C0B0 - 2 ; case 3
_0205C0B8:
	mov r2, #0x25
	b _0205C0C6
_0205C0BC:
	mov r2, #0x31
	b _0205C0C6
_0205C0C0:
	mov r2, #0x3d
	b _0205C0C6
_0205C0C4:
	mov r2, #0x7d
_0205C0C6:
	lsr r0, r1, #1
	add r0, r2, r0
	bx lr
	thumb_func_end sub_0205C0A0

	thumb_func_start sub_0205C0CC
sub_0205C0CC: ; 0x0205C0CC
	cmp r0, #3
	bhi _0205C0F2
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0205C0DC: ; jump table
	.short _0205C0E4 - _0205C0DC - 2 ; case 0
	.short _0205C0E8 - _0205C0DC - 2 ; case 1
	.short _0205C0EC - _0205C0DC - 2 ; case 2
	.short _0205C0F0 - _0205C0DC - 2 ; case 3
_0205C0E4:
	mov r0, #0x23
	bx lr
_0205C0E8:
	mov r0, #0x2f
	bx lr
_0205C0EC:
	mov r0, #0x3b
	bx lr
_0205C0F0:
	mov r0, #0x7b
_0205C0F2:
	bx lr
	thumb_func_end sub_0205C0CC

	thumb_func_start sub_0205C0F4
sub_0205C0F4: ; 0x0205C0F4
	cmp r0, #3
	bhi _0205C11A
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0205C104: ; jump table
	.short _0205C10C - _0205C104 - 2 ; case 0
	.short _0205C110 - _0205C104 - 2 ; case 1
	.short _0205C114 - _0205C104 - 2 ; case 2
	.short _0205C118 - _0205C104 - 2 ; case 3
_0205C10C:
	mov r0, #0x22
	bx lr
_0205C110:
	mov r0, #0x2e
	bx lr
_0205C114:
	mov r0, #0x3a
	bx lr
_0205C118:
	mov r0, #0x7a
_0205C11A:
	bx lr
	thumb_func_end sub_0205C0F4

	thumb_func_start sub_0205C11C
sub_0205C11C: ; 0x0205C11C
	cmp r0, #3
	bhi _0205C142
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0205C12C: ; jump table
	.short _0205C134 - _0205C12C - 2 ; case 0
	.short _0205C138 - _0205C12C - 2 ; case 1
	.short _0205C13C - _0205C12C - 2 ; case 2
	.short _0205C140 - _0205C12C - 2 ; case 3
_0205C134:
	mov r0, #0x24
	bx lr
_0205C138:
	mov r0, #0x30
	bx lr
_0205C13C:
	mov r0, #0x3c
	bx lr
_0205C140:
	mov r0, #0x7c
_0205C142:
	bx lr
	thumb_func_end sub_0205C11C

	thumb_func_start sub_0205C144
sub_0205C144: ; 0x0205C144
	push {r4, lr}
	cmp r0, #3
	bhi _0205C170
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0205C156: ; jump table
	.short _0205C15E - _0205C156 - 2 ; case 0
	.short _0205C162 - _0205C156 - 2 ; case 1
	.short _0205C166 - _0205C156 - 2 ; case 2
	.short _0205C16A - _0205C156 - 2 ; case 3
_0205C15E:
	mov r4, #0
	b _0205C170
_0205C162:
	mov r4, #1
	b _0205C170
_0205C166:
	mov r4, #2
	b _0205C170
_0205C16A:
	mov r4, #2
	bl GF_AssertFail
_0205C170:
	add r0, r4, #0
	pop {r4, pc}
	thumb_func_end sub_0205C144

	thumb_func_start sub_0205C174
sub_0205C174: ; 0x0205C174
	cmp r0, #3
	bhi _0205C19A
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0205C184: ; jump table
	.short _0205C18C - _0205C184 - 2 ; case 0
	.short _0205C190 - _0205C184 - 2 ; case 1
	.short _0205C194 - _0205C184 - 2 ; case 2
	.short _0205C198 - _0205C184 - 2 ; case 3
_0205C18C:
	mov r2, #0x4b
	b _0205C19A
_0205C190:
	mov r2, #0x53
	b _0205C19A
_0205C194:
	mov r2, #0x5b
	b _0205C19A
_0205C198:
	mov r2, #0x8b
_0205C19A:
	add r0, r2, r1
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205C174

	thumb_func_start sub_0205C1A0
sub_0205C1A0: ; 0x0205C1A0
	cmp r0, #3
	bhi _0205C1C6
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0205C1B0: ; jump table
	.short _0205C1B8 - _0205C1B0 - 2 ; case 0
	.short _0205C1BC - _0205C1B0 - 2 ; case 1
	.short _0205C1C0 - _0205C1B0 - 2 ; case 2
	.short _0205C1C4 - _0205C1B0 - 2 ; case 3
_0205C1B8:
	mov r0, #0x47
	bx lr
_0205C1BC:
	mov r0, #0x4f
	bx lr
_0205C1C0:
	mov r0, #0x57
	bx lr
_0205C1C4:
	mov r0, #0x87
_0205C1C6:
	bx lr
	thumb_func_end sub_0205C1A0

	thumb_func_start sub_0205C1C8
sub_0205C1C8: ; 0x0205C1C8
	cmp r0, #3
	bhi _0205C1EE
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0205C1D8: ; jump table
	.short _0205C1E0 - _0205C1D8 - 2 ; case 0
	.short _0205C1E4 - _0205C1D8 - 2 ; case 1
	.short _0205C1E8 - _0205C1D8 - 2 ; case 2
	.short _0205C1EC - _0205C1D8 - 2 ; case 3
_0205C1E0:
	mov r0, #0x46
	bx lr
_0205C1E4:
	mov r0, #0x4e
	bx lr
_0205C1E8:
	mov r0, #0x56
	bx lr
_0205C1EC:
	mov r0, #0x86
_0205C1EE:
	bx lr
	thumb_func_end sub_0205C1C8

	thumb_func_start sub_0205C1F0
sub_0205C1F0: ; 0x0205C1F0
	cmp r0, #3
	bhi _0205C216
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0205C200: ; jump table
	.short _0205C208 - _0205C200 - 2 ; case 0
	.short _0205C20C - _0205C200 - 2 ; case 1
	.short _0205C210 - _0205C200 - 2 ; case 2
	.short _0205C214 - _0205C200 - 2 ; case 3
_0205C208:
	mov r0, #0x48
	bx lr
_0205C20C:
	mov r0, #0x50
	bx lr
_0205C210:
	mov r0, #0x58
	bx lr
_0205C214:
	mov r0, #0x88
_0205C216:
	bx lr
	thumb_func_end sub_0205C1F0

	thumb_func_start sub_0205C218
sub_0205C218: ; 0x0205C218
	cmp r0, #3
	bhi _0205C23E
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0205C228: ; jump table
	.short _0205C230 - _0205C228 - 2 ; case 0
	.short _0205C234 - _0205C228 - 2 ; case 1
	.short _0205C238 - _0205C228 - 2 ; case 2
	.short _0205C23C - _0205C228 - 2 ; case 3
_0205C230:
	mov r0, #0x49
	bx lr
_0205C234:
	mov r0, #0x51
	bx lr
_0205C238:
	mov r0, #0x59
	bx lr
_0205C23C:
	mov r0, #0x89
_0205C23E:
	bx lr
	thumb_func_end sub_0205C218

	thumb_func_start sub_0205C240
sub_0205C240: ; 0x0205C240
	cmp r0, #3
	bhi _0205C266
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0205C250: ; jump table
	.short _0205C258 - _0205C250 - 2 ; case 0
	.short _0205C25C - _0205C250 - 2 ; case 1
	.short _0205C260 - _0205C250 - 2 ; case 2
	.short _0205C264 - _0205C250 - 2 ; case 3
_0205C258:
	mov r0, #0x4a
	bx lr
_0205C25C:
	mov r0, #0x52
	bx lr
_0205C260:
	mov r0, #0x5a
	bx lr
_0205C264:
	mov r0, #0x8a
_0205C266:
	bx lr
	thumb_func_end sub_0205C240
