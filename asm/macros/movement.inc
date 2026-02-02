	.ifndef ASM_MOVEMENT_INC
	.set ASM_MOVEMENT_INC, 1
#pragma once
#include "constants/movements.h"

	.option alignment off

	.macro FaceNorth length=1
	.short MOVEMENT_FACE_UP
	.short \length
	.endm

	.macro FaceSouth length=1
	.short MOVEMENT_FACE_DOWN
	.short \length
	.endm

	.macro FaceWest length=1
	.short MOVEMENT_FACE_LEFT
	.short \length
	.endm

	.macro FaceEast length=1
	.short MOVEMENT_FACE_RIGHT
	.short \length
	.endm

	.macro WalkSlowerNorth length=1
	.short 4
	.short \length
	.endm

	.macro WalkSlowerSouth length=1
	.short 5
	.short \length
	.endm

	.macro WalkSlowerWest length=1
	.short 6
	.short \length
	.endm

	.macro WalkSlowerEast length=1
	.short 7
	.short \length
	.endm

	.macro WalkSlowNorth length=1
	.short 8
	.short \length
	.endm

	.macro WalkSlowSouth length=1
	.short 9
	.short \length
	.endm

	.macro WalkSlowWest length=1
	.short 10
	.short \length
	.endm

	.macro WalkSlowEast length=1
	.short 11
	.short \length
	.endm

	.macro WalkNormalNorth length=1
	.short MOVEMENT_STEP_UP
	.short \length
	.endm

	.macro WalkNormalSouth length=1
	.short MOVEMENT_STEP_DOWN
	.short \length
	.endm

	.macro WalkNormalWest length=1
	.short MOVEMENT_STEP_LEFT
	.short \length
	.endm

	.macro WalkNormalEast length=1
	.short MOVEMENT_STEP_RIGHT
	.short \length
	.endm

	.macro WalkFastNorth length=1
	.short MOVEMENT_RUN_UP
	.short \length
	.endm

	.macro WalkFastSouth length=1
	.short MOVEMENT_RUN_DOWN
	.short \length
	.endm

	.macro WalkFastWest length=1
	.short MOVEMENT_RUN_LEFT
	.short \length
	.endm

	.macro WalkFastEast length=1
	.short MOVEMENT_RUN_RIGHT
	.short \length
	.endm

	.macro WalkFasterNorth length=1
	.short 20
	.short \length
	.endm

	.macro WalkFasterSouth length=1
	.short 21
	.short \length
	.endm

	.macro WalkFasterWest length=1
	.short 22
	.short \length
	.endm

	.macro WalkFasterEast length=1
	.short 23
	.short \length
	.endm

	.macro WalkOnSpotSlowerNorth length=1
	.short 24
	.short \length
	.endm

	.macro WalkOnSpotSlowerSouth length=1
	.short 25
	.short \length
	.endm

	.macro WalkOnSpotSlowerWest length=1
	.short 26
	.short \length
	.endm

	.macro WalkOnSpotSlowerEast length=1
	.short 27
	.short \length
	.endm

	.macro WalkOnSpotSlowNorth length=1
	.short 28
	.short \length
	.endm

	.macro WalkOnSpotSlowSouth length=1
	.short 29
	.short \length
	.endm

	.macro WalkOnSpotSlowWest length=1
	.short 30
	.short \length
	.endm

	.macro WalkOnSpotSlowEast length=1
	.short 31
	.short \length
	.endm

	.macro WalkOnSpotNormalNorth length=1
	.short 32
	.short \length
	.endm

	.macro WalkOnSpotNormalSouth length=1
	.short 33
	.short \length
	.endm

	.macro WalkOnSpotNormalWest length=1
	.short 34
	.short \length
	.endm

	.macro WalkOnSpotNormalEast length=1
	.short 35
	.short \length
	.endm

	.macro WalkOnSpotFastNorth length=1
	.short 36
	.short \length
	.endm

	.macro WalkOnSpotFastSouth length=1
	.short MOVEMENT_WALK_IN_PLACE_FACE_DOWN
	.short \length
	.endm

	.macro WalkOnSpotFastWest length=1
	.short 38
	.short \length
	.endm

	.macro WalkOnSpotFastEast length=1
	.short MOVEMENT_WALK_IN_PLACE_FACE_RIGHT
	.short \length
	.endm

	.macro WalkOnSpotFasterNorth length=1
	.short 40
	.short \length
	.endm

	.macro WalkOnSpotFasterSouth length=1
	.short 41
	.short \length
	.endm

	.macro WalkOnSpotFasterWest length=1
	.short 42
	.short \length
	.endm

	.macro WalkOnSpotFasterEast length=1
	.short 43
	.short \length
	.endm

	.macro JumpOnSpotSlowNorth length=1
	.short 44
	.short \length
	.endm

	.macro JumpOnSpotSlowSouth length=1
	.short 45
	.short \length
	.endm

	.macro JumpOnSpotSlowWest length=1
	.short 46
	.short \length
	.endm

	.macro JumpOnSpotSlowEast length=1
	.short 47
	.short \length
	.endm

	.macro JumpOnSpotFastNorth length=1
	.short 48
	.short \length
	.endm

	.macro JumpOnSpotFastSouth length=1
	.short 49
	.short \length
	.endm

	.macro JumpOnSpotFastWest length=1
	.short 50
	.short \length
	.endm

	.macro JumpOnSpotFastEast length=1
	.short 51
	.short \length
	.endm

	.macro JumpNearFastNorth length=1
	.short 52
	.short \length
	.endm

	.macro JumpNearFastSouth length=1
	.short 53
	.short \length
	.endm

	.macro JumpNearFastWest length=1
	.short 54
	.short \length
	.endm

	.macro JumpNearFastEast length=1
	.short 55
	.short \length
	.endm

	.macro JumpFarNorth length=1
	.short 56
	.short \length
	.endm

	.macro JumpFarSouth length=1
	.short 57
	.short \length
	.endm

	.macro JumpFarWest length=1
	.short 58
	.short \length
	.endm

	.macro JumpFarEast length=1
	.short 59
	.short \length
	.endm

	.macro Delay1 length=1
	.short 60
	.short \length
	.endm

	.macro Delay2 length=1
	.short 61
	.short \length
	.endm

	.macro Delay4 length=1
	.short 62
	.short \length
	.endm

	.macro Delay8 length=1
	.short 63
	.short \length
	.endm

	.macro Delay15 length=1
	.short 64
	.short \length
	.endm

	.macro Delay16 length=1
	.short 65
	.short \length
	.endm

	.macro Delay32 length=1
	.short 66
	.short \length
	.endm

	.macro WarpOut length=1
	.short 67
	.short \length
	.endm

	.macro WarpIn length=1
	.short 68
	.short \length
	.endm

	.macro SetInvisible length=1
	.short 69
	.short \length
	.endm

	.macro SetVisible length=1
	.short 70
	.short \length
	.endm

	.macro LockDir length=1
	.short MOVEMENT_UNK_71
	.short \length
	.endm

	.macro UnlockDir length=1
	.short MOVEMENT_UNK_72
	.short \length
	.endm

	.macro PauseAnimation length=1
	.short 73
	.short \length
	.endm

	.macro ResumeAnimation length=1
	.short 74
	.short \length
	.endm

	.macro EmoteExclamationMark length=1
	.short MOVEMENT_EMOTE_EXCLAMATION
	.short \length
	.endm

	.macro WalkSlightlyFastNorth length=1
	.short 76
	.short \length
	.endm

	.macro WalkSlightlyFastSouth length=1
	.short 77
	.short \length
	.endm

	.macro WalkSlightlyFastWest length=1
	.short 78
	.short \length
	.endm

	.macro WalkSlightlyFastEast length=1
	.short 79
	.short \length
	.endm

	.macro WalkSlightlyFasterNorth length=1
	.short 80
	.short \length
	.endm

	.macro WalkSlightlyFasterSouth length=1
	.short 81
	.short \length
	.endm

	.macro WalkSlightlyFasterWest length=1
	.short 82
	.short \length
	.endm

	.macro WalkSlightlyFasterEast length=1
	.short 83
	.short \length
	.endm

	.macro WalkFastestNorth length=1
	.short 84
	.short \length
	.endm

	.macro WalkFastestSouth length=1
	.short 85
	.short \length
	.endm

	.macro WalkFastestWest length=1
	.short 86
	.short \length
	.endm

	.macro WalkFastestEast length=1
	.short 87
	.short \length
	.endm

	.macro RunNorth length=1
	.short 88
	.short \length
	.endm

	.macro RunSouth length=1
	.short 89
	.short \length
	.endm

	.macro RunWest length=1
	.short 90
	.short \length
	.endm

	.macro RunEast length=1
	.short 91
	.short \length
	.endm

	.macro JumpNearSlowWest length=1
	.short 92
	.short \length
	.endm

	.macro JumpNearSlowEast length=1
	.short 93
	.short \length
	.endm

	.macro JumpFartherWest length=1
	.short 94
	.short \length
	.endm

	.macro JumpFartherEast length=1
	.short 95
	.short \length
	.endm

	.macro WalkEverSoSlightlyFastNorth length=1
	.short 96
	.short \length
	.endm

	.macro WalkEverSoSlightlyFastSouth length=1
	.short 97
	.short \length
	.endm

	.macro WalkEverSoSlightlyFastWest length=1
	.short 98
	.short \length
	.endm

	.macro WalkEverSoSlightlyFastEast length=1
	.short 99
	.short \length
	.endm

	.macro NurseJoyBow length=1
	.short 100
	.short \length
	.endm

	.macro RevealTrainer length=1
	.short 101
	.short \length
	.endm

	.macro PlayerGive length=1
	.short 102
	.short \length
	.endm

	.macro EmoteQuestionMark length=1
	.short 103
	.short \length
	.endm

	.macro PlayerReceive length=1
	.short 104
	.short \length
	.endm

	.macro MoveAction_105 length=1
	.short 105
	.short \length
	.endm

	.macro MoveAction_106 length=1
	.short 106
	.short \length
	.endm

	.macro MoveAction_107 length=1
	.short 107
	.short \length
	.endm

	.macro MoveAction_108 length=1
	.short 108
	.short \length
	.endm

	.macro MoveAction_109 length=1
	.short 109
	.short \length
	.endm

	.macro MoveAction_110 length=1
	.short 110
	.short \length
	.endm

	.macro MoveAction_111 length=1
	.short 111
	.short \length
	.endm

	.macro MoveAction_112 length=1
	.short 112
	.short \length
	.endm

	.macro EmoteExclamation2 length=1
	.short 153
	.short \length
	.endm

	.macro EndMovement
	.short MOVEMENT_STEP_END
	.short 0
	.endm

	.endif
