#include "constants/maps.h"
	.include "asm/macros.inc"
	.include "unk_0203BA5C.inc"
	.include "global.inc"

	.rodata
	.macro spawn flagIdx, isBlackoutSpawn, isFlyPoint, deathSpawnMapNo, deathSpawnX, deathSpawnY, flyPointMapNo, flyPointX, flyPointY, specialWarpMapNo, specialWarpX, specialWarpY
	.short (\flagIdx & 0xFF) | ((\isBlackoutSpawn & 1) << 8) | ((\isFlyPoint & 1) << 9), \deathSpawnMapNo
	.short \deathSpawnX | (\deathSpawnY << 8)
	.short \flyPointMapNo, \flyPointX, \flyPointY, \specialWarpMapNo, \specialWarpX, \specialWarpY
	.endm

sSpawnMaps:
	spawn 0x0B, 1, 1, MAP_T20R0201, 6, 8, MAP_T20, 0x02B7, 0x018D, MAP_T20, 0x02B7, 0x018D
	spawn 0x0C, 1, 1, MAP_T21PC0101, 8, 13, MAP_T21, 0x0234, 0x0188, MAP_T21, 0x0234, 0x0188
	spawn 0x0D, 1, 1, MAP_T22PC0101, 8, 13, MAP_T22, 0x01F1, 0x0110, MAP_T22, 0x01F1, 0x0110
	spawn 0x0E, 1, 1, MAP_T23PC0101, 8, 13, MAP_T23, 0x019A, 0x01CD, MAP_T23, 0x019A, 0x01CD
	spawn 0x0F, 1, 1, MAP_T24PC0101, 8, 13, MAP_T24, 0x00BB, 0x0172, MAP_T24, 0x00BB, 0x0172
	spawn 0x10, 1, 1, MAP_T25PC0101, 8, 13, MAP_T25, 0x0160, 0x0171, MAP_T25, 0x0160, 0x0171
	spawn 0x11, 1, 1, MAP_T26PC0101, 8, 13, MAP_T26, 0x0110, 0x0102, MAP_T26, 0x0110, 0x0102
	spawn 0x12, 1, 1, MAP_T27PC0101, 8, 13, MAP_T27, 0x018D, 0x00B8, MAP_T27, 0x018D, 0x00B8
	spawn 0x13, 1, 1, MAP_T28PC0101, 8, 13, MAP_T28, 0x0216, 0x00B8, MAP_T28, 0x0216, 0x00B8
	spawn 0x14, 0, 1, MAP_T29, 8, 13, MAP_T29, 0x0218, 0x005A, MAP_T29, 0x0218, 0x005A
	spawn 0x15, 1, 1, MAP_T30PC0101, 8, 13, MAP_T30, 0x02A2, 0x00B1, MAP_T30, 0x02A2, 0x00B1
	spawn 0x16, 1, 1, MAP_T31PC0101, 8, 13, MAP_T31, 0x0334, 0x010A, MAP_T31, 0x0334, 0x010A
	spawn 0x00, 0, 1, MAP_T01, 8, 13, MAP_T01, 0x0409, 0x016C, MAP_T01, 0x0409, 0x016C
	spawn 0x01, 1, 1, MAP_T02PC0101, 8, 13, MAP_T02, 0x0408, 0x0107, MAP_T02, 0x0408, 0x0107
	spawn 0x02, 1, 1, MAP_T03PC0101, 8, 13, MAP_T03, 0x0418, 0x006B, MAP_T03, 0x0418, 0x006B
	spawn 0x03, 1, 1, MAP_T04PC0101, 8, 13, MAP_T04, 0x051D, 0x0084, MAP_T04, 0x051D, 0x0084
	spawn 0x04, 1, 1, MAP_T05PC0101, 8, 13, MAP_T05, 0x058A, 0x00EB, MAP_T05, 0x058A, 0x00EB
	spawn 0x05, 1, 1, MAP_T06PC0101, 8, 13, MAP_T06, 0x0511, 0x0127, MAP_T06, 0x0511, 0x0127
	spawn 0x06, 1, 1, MAP_T07PC0101, 8, 13, MAP_T07, 0x04CF, 0x00EE, MAP_T07, 0x04CF, 0x00EE
	spawn 0x07, 1, 1, MAP_T08PC0101, 8, 13, MAP_T08, 0x04B9, 0x01B8, MAP_T08, 0x04B9, 0x01B8
	spawn 0x08, 0, 1, MAP_T09PC0101, 8, 13, MAP_T09, 0x040F, 0x01F7, MAP_T09, 0x040F, 0x01F7
	spawn 0x09, 1, 1, MAP_T10R0101, 6, 21, MAP_T10, 0x0390, 0x00C9, MAP_T10, 0x0390, 0x00C9
	spawn 0x0A, 1, 1, MAP_T11PC0101, 8, 13, MAP_T11, 0x050E, 0x00F3, MAP_T11, 0x050E, 0x00F3
	spawn 0x1E, 1, 1, MAP_D47PC0101, 8, 13, MAP_D47, 0x0052, 0x012F, MAP_D47, 0x0052, 0x012F
	spawn 0x1F, 1, 1, MAP_D32PC0101, 8, 13, MAP_D32R0102, 0x0008, 0x000F, MAP_W40, 0x00ED, 0x010B
	spawn 0x23, 0, 0, MAP_D49, 8, 13, MAP_D49, 0x002A, 0x0017, MAP_R35, 0x016A, 0x010B
	spawn 0x21, 0, 0, MAP_R22R0101, 8, 13, MAP_R26, 0x038D, 0x0129, MAP_R26, 0x038D, 0x0129
	spawn 0x1B, 1, 0, MAP_R32PC0101, 8, 13, MAP_R32, 0x01D4, 0x01A3, MAP_R32, 0x01D4, 0x01A3
	spawn 0x24, 1, 0, MAP_R03PC0101, 8, 13, MAP_R03, 0x048F, 0x006B, MAP_R03, 0x048F, 0x006B
	spawn 0x25, 1, 0, MAP_R10PC0101, 8, 13, MAP_R10, 0x0592, 0x00A4, MAP_R10, 0x0592, 0x00A4

	.text

	thumb_func_start SpawnIdToTableIndex
SpawnIdToTableIndex: ; 0x0203BA5C
	push {r3, lr}
	cmp r0, #0
	ble _0203BA66
	cmp r0, #0x1e
	bls _0203BA6C
_0203BA66:
	bl GF_AssertFail
	mov r0, #1
_0203BA6C:
	sub r0, r0, #1
	pop {r3, pc}
	thumb_func_end SpawnIdToTableIndex

	thumb_func_start GetMomSpawnId
GetMomSpawnId: ; 0x0203BA70
	mov r0, #1
	bx lr
	thumb_func_end GetMomSpawnId

	thumb_func_start GetFlyWarpData
GetFlyWarpData: ; 0x0203BA74
	push {r4, lr}
	add r4, r1, #0
	bl SpawnIdToTableIndex
	add r1, r0, #0
	mov r2, #0x12
	mul r1, r2
	ldr r0, _0203BAA0 ; =sSpawnMaps + 6
	sub r2, #0x13
	ldrh r0, [r0, r1]
	str r0, [r4]
	ldr r0, _0203BAA4 ; =sSpawnMaps + 8
	str r2, [r4, #4]
	ldrh r0, [r0, r1]
	str r0, [r4, #8]
	ldr r0, _0203BAA8 ; =sSpawnMaps + 10
	ldrh r0, [r0, r1]
	str r0, [r4, #0xc]
	mov r0, #1
	str r0, [r4, #0x10]
	pop {r4, pc}
	nop
_0203BAA0: .word sSpawnMaps + 6
_0203BAA4: .word sSpawnMaps + 8
_0203BAA8: .word sSpawnMaps + 10
	thumb_func_end GetFlyWarpData

	thumb_func_start GetDeathWarpData
GetDeathWarpData: ; 0x0203BAAC
	push {r4, lr}
	add r4, r1, #0
	bl SpawnIdToTableIndex
	add r2, r0, #0
	mov r1, #0x12
	mul r2, r1
	ldr r0, _0203BAE0 ; =sSpawnMaps + 2
	sub r1, #0x13
	ldrh r0, [r0, r2]
	str r0, [r4]
	ldr r0, _0203BAE4 ; =sSpawnMaps
	str r1, [r4, #4]
	add r1, r0, r2
	ldrh r0, [r1, #4]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [r4, #8]
	ldrh r0, [r1, #4]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x18
	str r0, [r4, #0xc]
	mov r0, #0
	str r0, [r4, #0x10]
	pop {r4, pc}
	nop
_0203BAE0: .word sSpawnMaps + 2
_0203BAE4: .word sSpawnMaps
	thumb_func_end GetDeathWarpData

	thumb_func_start GetSpecialSpawnWarpData
GetSpecialSpawnWarpData: ; 0x0203BAE8
	push {r4, lr}
	add r4, r1, #0
	bl SpawnIdToTableIndex
	add r1, r0, #0
	mov r2, #0x12
	mul r1, r2
	ldr r0, _0203BB14 ; =sSpawnMaps + 12
	sub r2, #0x13
	ldrh r0, [r0, r1]
	str r0, [r4]
	ldr r0, _0203BB18 ; =sSpawnMaps + 14
	str r2, [r4, #4]
	ldrh r0, [r0, r1]
	str r0, [r4, #8]
	ldr r0, _0203BB1C ; =sSpawnMaps + 16
	ldrh r0, [r0, r1]
	str r0, [r4, #0xc]
	mov r0, #1
	str r0, [r4, #0x10]
	pop {r4, pc}
	nop
_0203BB14: .word sSpawnMaps + 12
_0203BB18: .word sSpawnMaps + 14
_0203BB1C: .word sSpawnMaps + 16
	thumb_func_end GetSpecialSpawnWarpData

	thumb_func_start MapHeader_GetSpawnIdForDeathWarp
MapHeader_GetSpawnIdForDeathWarp: ; 0x0203BB20
	push {r3, r4}
	ldr r3, _0203BB4C ; =sSpawnMaps
	mov r2, #0
	add r4, r3, #0
_0203BB28:
	ldrh r1, [r3, #2]
	cmp r0, r1
	bne _0203BB3C
	ldrh r1, [r4]
	lsl r1, r1, #0x17
	lsr r1, r1, #0x1f
	beq _0203BB3C
	add r0, r2, #1
	pop {r3, r4}
	bx lr
_0203BB3C:
	add r2, r2, #1
	add r3, #0x12
	add r4, #0x12
	cmp r2, #0x1e
	blo _0203BB28
	mov r0, #0
	pop {r3, r4}
	bx lr
	.balign 4, 0
_0203BB4C: .word sSpawnMaps
	thumb_func_end MapHeader_GetSpawnIdForDeathWarp

	thumb_func_start sub_0203BB50
sub_0203BB50: ; 0x0203BB50
	ldr r3, _0203BB6C ; =sSpawnMaps
	mov r2, #0
_0203BB54:
	ldrh r1, [r3, #6]
	cmp r0, r1
	bne _0203BB5E
	add r0, r2, #1
	bx lr
_0203BB5E:
	add r2, r2, #1
	add r3, #0x12
	cmp r2, #0x1e
	blo _0203BB54
	mov r0, #0
	bx lr
	nop
_0203BB6C: .word sSpawnMaps
	thumb_func_end sub_0203BB50

	thumb_func_start FlypointFlagAction
FlypointFlagAction: ; 0x0203BB70
	push {r3, r4, r5, lr}
	ldr r2, _0203BBB0 ; =sSpawnMaps
	mov r4, #0
	add r3, r2, #0
_0203BB78:
	ldrh r5, [r2, #6]
	cmp r1, r5
	bne _0203BBA2
	ldrh r5, [r3]
	lsl r5, r5, #0x16
	lsr r5, r5, #0x1f
	beq _0203BBA2
	ldr r0, [r0, #0xc]
	bl Save_VarsFlags_Get
	mov r2, #0x12
	add r3, r4, #0
	mul r3, r2
	ldr r2, _0203BBB0 ; =sSpawnMaps
	mov r1, #1
	ldrh r2, [r2, r3]
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	bl Save_VarsFlags_FlypointFlagAction
	pop {r3, r4, r5, pc}
_0203BBA2:
	add r4, r4, #1
	add r2, #0x12
	add r3, #0x12
	cmp r4, #0x1e
	blo _0203BB78
	pop {r3, r4, r5, pc}
	nop
_0203BBB0: .word sSpawnMaps
	thumb_func_end FlypointFlagAction
