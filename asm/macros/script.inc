	.ifndef ASM_SCRIPT_INC
	.set ASM_SCRIPT_INC, 1
#pragma once
#include "constants/scrcmd.h"
#include "macros/movement.inc"

    .option alignment off

	.macro ScrDef offset
	.word \offset - . - 4
	.endm

	.macro ScrDefEnd
	.short SCRDEF_END
	.endm

	; Dummy command
	.macro Nop
	.short 0
	.endm

	; Dummy command
	.macro Dummy
	.short 1
	.endm

	; Exits script execution and returns control to the player
	.macro End
	.short 2
	.endm

	; Pauses for some frames, tracks the timer in a script variable
	.macro Wait frames, var
	.short 3
	.short \frames
	.short \var
	.endm

	; Loads 8-bit value into the specified script register
	.macro LoadByte reg, val
	.short 4
	.byte \reg
	.byte \val
	.endm

	; Loads 32-bit value into the specified script register
	.macro LoadWord reg, val
	.short 5
	.byte \reg
	.word \val
	.endm

	; Reads byte at a specific memory address into a script register
	; Because scripts are compiled in a code-agnostic fashion,
	; this command can never be assembled.
	.macro LoadByteFromAddr reg, addr
	.short 6
	.byte \reg
	.word \addr
	.endm

	; Writes byte to a specific memory address from a script register
	; Because scripts are compiled in a code-agnostic fashion,
	; this command can never be assembled.
	.macro WriteByteToAddr addr, reg
	.short 7
	.word \addr
	.byte \reg
	.endm

	; Writes byte literal to a specific memory address
	; Because scripts are compiled in a code-agnostic fashion,
	; this command can never be assembled.
	.macro SetPtrByte addr, val
	.short 8
	.word \addr
	.byte \val
	.endm

	; Copies a byte between script registers
	.macro CopyLocal to, from
	.short 9
	.byte \to
	.byte \from
	.endm

	; Copies a byte between two memory addresses
	; Because scripts are compiled in a code-agnostic fashion,
	; this command can never be assembled.
	.macro CopyByte to, from
	.short 10
	.word \to
	.word \from
	.endm

	; Compares values between script reg and script reg
	.macro CompareLocalToLocal a, b
	.short 11
	.byte \a
	.byte \b
	.endm

	; Compares script reg to byte literal
	.macro CompareLocalToValue reg, val
	.short 12
	.byte \reg
	.byte \val
	.endm

	; Compares script reg to memory address
	; Because scripts are compiled in a code-agnostic fashion,
	; this command can never be assembled.
	.macro CompareLocalToAddr reg, addr
	.short 13
	.byte \reg
	.word \addr
	.endm

	; Compares memory address to script reg
	; Because scripts are compiled in a code-agnostic fashion,
	; this command can never be assembled.
	.macro CompareAddrToLocal addr, reg
	.short 14
	.word \addr
	.byte \reg
	.endm

	; Compares memory address to byte literal
	; Because scripts are compiled in a code-agnostic fashion,
	; this command can never be assembled.
	.macro CompareAddrToValue addr, val
	.short 15
	.word \addr
	.byte \val
	.endm

	; Compares bytes at two memory addresses
	; Because scripts are compiled in a code-agnostic fashion,
	; this command can never be assembled.
	.macro CompareAddrToAddr a, b
	.short 16
	.word \a
	.word \b
	.endm

	; Compares variable to 16-bit literal
	.macro CompareVarToValue var, val
	.short 17
	.short \var
	.short \val
	.endm

	; Compares two variables
	.macro CompareVarToVar a, b
	.short 18
	.short \a
	.short \b
	.endm

	; Creates a new script context to run the indicated script asynchronously
	.macro RunScript id
	.short 19
	.short \id
	.endm

	; Creates a new script context to run the indicated script and wait
	.macro CallStd id
	.short 20
	.short \id
	.endm

	; Yield to parent context
	.macro RestartCurrentScript
	.short 21
	.endm

	; Absolute branch to offset in script
	.macro GoTo dest
	.short 22
	.word \dest-.-4
	.endm

	; Branch to offset in script if interacting with a specific object
	.macro ObjectGoTo object, dest
	.short 23
	.byte \object
	.word \dest-.-4
	.endm

	; Branch to offset in script if interacting with a specific bg event
	.macro BGGoTo bg, dest
	.short 24
	.byte \bg
	.word \dest-.-4
	.endm

	; Branch to offset in script if facing a specific direction
	.macro DirectionGoTo dir, dest
	.short 25
	.byte \dir
	.word \dest-.-4
	.endm

	; Call script as a subroutine
	.macro Call sub
	.short 26
	.word \sub-.-4
	.endm

	; Return from subroutine
	.macro Return
	.short 27
	.endm

	; Conditional branch to offset in script
	.macro GoToIf condition, dest
	.short 28
	.byte \condition
	.word \dest-.-4
	.endm

	; Conditional call subroutine
	.macro CallIf condition, sub
	.short 29
	.byte \condition
	.word \sub-.-4
	.endm

	; Set event flag
	.macro SetFlag flag
	.short 30
	.short \flag
	.endm

	; Clear event flag
	.macro ClearFlag flag
	.short 31
	.short \flag
	.endm

	; Check event flag, store result on context
	.macro CheckFlag flag
	.short 32
	.short \flag
	.endm

	; Set event flag referenced in var
	.macro SetFlagVar var
	.short 33
	.short \var
	.endm

	; Clear event flag referenced in var
	.macro ClearFlagVar var
	.short 34
	.short \var
	.endm

	; Check event flag referenced in var, store result in other var
	.macro CheckFlagVar var_flag, var_dest
	.short 35
	.short \var_flag
	.short \var_dest
	.endm

	; Set trainer defeated flag
	.macro SetTrainerFlag var_or_trno
	.short 36
	.short \var_or_trno
	.endm

	; Clear trainer defeated flag
	.macro ClearTrainerFlag var_or_trno
	.short 37
	.short \var_or_trno
	.endm

	; Check trainer defeated flag, store result on context
	.macro CheckTrainerFlag var_or_trno
	.short 38
	.short \var_or_trno
	.endm

	; Increment var value by value
	.macro AddVar var, var_or_addend
	.short 39
	.short \var
	.short \var_or_addend
	.endm

	; Decrement var value by value
	.macro SubVar var, var_or_addend
	.short 40
	.short \var
	.short \var_or_addend
	.endm

	; Set var to short literal
	.macro SetVar var, val
	.short 41
	.short \var
	.short \val
	.endm

	; Set var from other var
	.macro CopyVar dst, src
	.short 42
	.short \dst
	.short \src
	.endm

	; Set var from other var or short literal
	.macro SetOrCopyVar dst, src
	.short 43
	.short \dst
	.short \src
	.endm

	; Print non_npc_msg in field window from current map message bank
	.macro NonNPCMsg msg_id
	.short 44
	.byte \msg_id
	.endm

	; NPC dialogue window
	.macro NPCMsg msg_id
	.short 45
	.byte \msg_id
	.endm

	; Not sure what to call this but it
	; is also a message printer
	.macro NonNPCMsgVar msg_id
	.short 46
	.short \msg_id
	.endm

	.macro NPCMsgVar arg0
	.short 47
	.short \arg0
	.endm

	.macro ScrCmd_048 arg0
	.short 48
	.byte \arg0
	.endm

	; Waits for A or B button
	.macro WaitABPress
	.short 49
	.endm

	; Waits for A, B, or dpad. On pressing dpad, does a turn frame.
	.macro WaitButton
	.short 50
	.endm

	; Waits for A, B, or dpad. No turn frame.
	.macro WaitButtonOrDpad
	.short 51
	.endm

	.macro OpenMsg
	.short 52
	.endm

	.macro CloseMsg
	.short 53
	.endm

	; Like closemsg but does not clear the graphics.
	.macro HoldMsg
	.short 54
	.endm

	.macro DirectionSignpost message, arg1, arrow, arg3
	.short 55
	.byte \message
	.byte \arg1
	.short \arrow
	.short \arg3
	.endm

	.macro ScrCmd_055 message, arg1
	.short 56
	.byte \message
	.short \arg1
	.endm

	.macro ScrCmd_057 arg0
	.short 57
	.byte \arg0
	.endm

	.macro ScrCmd_058
	.short 58
	.endm

	.macro TrainerTips arg0, arg1
	.short 59
	.byte \arg0
	.short \arg1
	.endm

	.macro ScrCmd_060 arg0
	.short 60
	.short \arg0
	.endm

	.macro ScrCmd_061
	.short 61
	.endm

	.macro ScrCmd_062 arg0, arg1, arg2, arg3, arg4, arg5
	.short 62
	.byte \arg0
	.byte \arg1
	.byte \arg2
	.byte \arg3
	.byte \arg4
	.byte \arg5
	.endm

	.macro YesNo arg0
	.short 63
	.short \arg0
	.endm

	.macro ScrCmd_064 arg0, arg1, arg2, arg3, arg4
	.short 64
	.byte \arg0
	.byte \arg1
	.byte \arg2
	.byte \arg3
	.short \arg4
	.endm

	.macro ScrCmd_065 arg0, arg1, arg2, arg3, arg4
	.short 65
	.byte \arg0
	.byte \arg1
	.byte \arg2
	.byte \arg3
	.short \arg4
	.endm

	.macro ScrCmd_066 arg0, arg1
	.short 66
	.byte \arg0
	.byte \arg1
	.endm

	.macro ScrCmd_067
	.short 67
	.endm

	.macro ScrCmd_068 arg0, arg1, arg2, arg3, arg4
	.short 68
	.byte \arg0
	.byte \arg1
	.byte \arg2
	.byte \arg3
	.short \arg4
	.endm

	.macro ScrCmd_069 arg0, arg1, arg2, arg3, arg4
	.short 69
	.byte \arg0
	.byte \arg1
	.byte \arg2
	.byte \arg3
	.short \arg4
	.endm

	.macro ScrCmd_070 arg0, arg1, arg2
	.short 70
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro ScrCmd_071
	.short 71
	.endm

	.macro ScrCmd_072 arg0
	.short 72
	.byte \arg0
	.endm

	.macro PlaySE arg0
	.short 73
	.short \arg0
	.endm

	.macro StopSE arg0
	.short 74
	.short \arg0
	.endm

	.macro WaitSE arg0
	.short 75
	.short \arg0
	.endm

	.macro PlayCry arg0, arg1
	.short 76
	.short \arg0
	.short \arg1
	.endm

	.macro WaitCry
	.short 77
	.endm

	.macro PlayFanfare fanfare
	.short 78
	.short \fanfare
	.endm

	.macro WaitFanfare
	.short 79
	.endm

	.macro PlayBGM bgm
	.short 80
	.short \bgm
	.endm

	.macro StopBGM arg0
	.short 81
	.short \arg0
	.endm

	.macro ResetBGM
	.short 82
	.endm

	.macro ScrCmd_083 arg0
	.short 83
	.short \arg0
	.endm

	; Fade out the music to the target level
	; in the designated number of frames
	.macro FadeOutBGM target, frames
	.short 84
	.short \target
	.short \frames
	.endm

	.macro FadeInBGM arg0
	.short 85
	.short \arg0
	.endm

	.macro ScrCmd_086 arg0, arg1
	.short 86
	.byte \arg0
	.byte \arg1
	.endm

	.macro TempBGM arg0
	.short 87
	.short \arg0
	.endm

	.macro ScrCmd_088 arg0
	.short 88
	.byte \arg0
	.endm

	.macro ChatotHasCry arg0
	.short 89
	.short \arg0
	.endm

	.macro ChatotStartRecording arg0
	.short 90
	.short \arg0
	.endm

	.macro ChatotStopRecording
	.short 91
	.endm

	.macro ChatotSaveRecording
	.short 92
	.endm

	.macro ScrCmd_093
	.short 93
	.endm

	.macro ApplyMovement arg0, arg1
	.short 94
	.short \arg0
	.word \arg1-.-4
	.endm

	.macro WaitMovement
	.short 95
	.endm

	.macro LockAll
	.short 96
	.endm

	.macro ReleaseAll
	.short 97
	.endm

	.macro Lock arg0
	.short 98
	.short \arg0
	.endm

	.macro Release arg0
	.short 99
	.short \arg0
	.endm

	.macro ShowPerson arg0
	.short 100
	.short \arg0
	.endm

	.macro HidePerson arg0
	.short 101
	.short \arg0
	.endm

	.macro ScrCmd_102 arg0, arg1
	.short 102
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_103
	.short 103
	.endm

	.macro FacePlayer
	.short 104
	.endm

	.macro GetPlayerCoords arg0, arg1
	.short 105
	.short \arg0
	.short \arg1
	.endm

	.macro GetPersonCoords arg0, arg1, arg2
	.short 106
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro ScrCmd_107 arg0, arg1, arg2
	.short 107
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro ScrCmd_108 arg0, arg1
	.short 108
	.short \arg0
	.byte \arg1
	.endm

	.macro ScrCmd_109 arg0, arg1
	.short 109
	.short \arg0
	.short \arg1
	.endm

	.macro AddMoney arg0
	.short 110
	.word \arg0
	.endm

	.macro SubMoneyImmediate arg0
	.short 111
	.word \arg0
	.endm

	.macro HasEnoughMoneyImmediate arg0, arg1
	.short 112
	.short \arg0
	.word \arg1
	.endm

	.macro ShowMoneyBox arg0, arg1
	.short 113
	.short \arg0
	.short \arg1
	.endm

	.macro HideMoneyBox
	.short 114
	.endm

	.macro UpdateMoneyBox
	.short 115
	.endm

	.macro ScrCmd_116 arg0, arg1, arg2
	.short 116
	.byte \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro ScrCmd_117
	.short 117
	.endm

	.macro ScrCmd_118 arg0
	.short 118
	.byte \arg0
	.endm

	.macro GetCoinAmount arg0
	.short 119
	.short \arg0
	.endm

	.macro GiveCoins arg0
	.short 120
	.short \arg0
	.endm

	.macro TakeCoins arg0
	.short 121
	.short \arg0
	.endm

	.macro GiveAthletePoints arg0
	.short 122
	.short \arg0
	.endm

	.macro TakeAthletePoints arg0
	.short 123
	.short \arg0
	.endm

	.macro CheckAthletePoints arg0, arg1
	.short 124
	.short \arg0
	.short \arg1
	.endm

	.macro GiveItem arg0, arg1, arg2
	.short 125
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro TakeItem arg0, arg1, arg2
	.short 126
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro HasSpaceForItem arg0, arg1, arg2
	.short 127
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro HasItem arg0, arg1, arg2
	.short 128
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro ItemIsTMOrHM arg0, arg1
	.short 129
	.short \arg0
	.short \arg1
	.endm

	.macro GetItemPocket arg0, arg1
	.short 130
	.short \arg0
	.short \arg1
	.endm

	.macro SetStarterChoice arg0
	.short 131
	.short \arg0
	.endm

	.macro GenderMsgBox arg0, arg1
	.short 132
	.byte \arg0
	.byte \arg1
	.endm

	.macro GetSealQuantity arg0, arg1
	.short 133
	.short \arg0
	.short \arg1
	.endm

	.macro GiveOrTakeSeal arg0, arg1
	.short 134
	.short \arg0
	.short \arg1
	.endm

	.macro GiveRandomSeal arg0, arg1, arg2
	.short 135
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro ScrCmd_136 arg0, arg1
	.short 136
	.short \arg0
	.short \arg1
	.endm

	.macro GiveMon species, level, heldItem, form, ability, retvar
	.short 137
	.short \species
	.short \level
	.short \heldItem
	.short \form
	.short \ability
	.short \retvar
	.endm

	.macro GiveEgg arg0, arg1
	.short 138
	.short \arg0
	.short \arg1
	.endm

	.macro SetMonMove arg0, arg1, arg2
	.short 139
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro MonHasMove arg0, arg1, arg2
	.short 140
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro GetPartySlotWithMove arg0, arg1
	.short 141
	.short \arg0
	.short \arg1
	.endm

	.macro GetPhoneBookRematch arg0, arg1
	.short 142
	.short \arg0
	.short \arg1
	.endm

	.macro NameRival arg0
	.short 143
	.short \arg0
	.endm

	.macro GetFriendSprite arg0
	.short 144
	.short \arg0
	.endm

	.macro RegisterPokegearCard arg0
	.short 145
	.byte \arg0
	.endm

	.macro RegisterGearNumber arg0
	.short 146
	.short \arg0
	.endm

	.macro CheckRegisteredPhoneNumber arg0, arg1
	.short 147
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_148 arg0, arg1
	.short 148
	.byte \arg0
	.byte \arg1
	.endm

	.macro ScrCmd_149 arg0
	.short 149
	.byte \arg0
	.endm

	.macro RestoreOverworld
	.short 150
	.endm

	.macro ScrCmd_151
	.short 151
	.endm

	.macro ScrCmd_152
	.short 152
	.endm

	.macro ScrCmd_153 arg0
	.short 153
	.short \arg0
	.endm

	.macro ScrCmd_154 arg0, arg1, arg2
	.short 154
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro ScrCmd_155 arg0, arg1
	.short 155
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_156
	.short 156
	.endm

	.macro TownMap
	.short 157
	.endm

	.macro ScrCmd_158 arg0
	.short 158
	.byte \arg0
	.endm

	.macro ScrCmd_159
	.short 159
	.endm

	.macro ScrCmd_160
	.short 160
	.endm

	.macro ScrCmd_161
	.short 161
	.endm

	.macro ScrCmd_162
	.short 162
	.endm

	.macro HOFCredits arg0
	.short 163
	.short \arg0
	.endm

	.macro ScrCmd_164
	.short 164
	.endm

	.macro ScrCmd_165 arg0, arg1
	.short 165
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_166 arg0
	.short 166
	.short \arg0
	.endm

	.macro ChooseStarter
	.short 167
	.endm

	.macro GetTrainerPathToPlayer arg0
	.short 168
	.short \arg0
	.endm

	.macro TrainerStepTowardsPlayer arg0, arg1
	.short 169
	.short \arg0
	.short \arg1
	.endm

	.macro GetTrainerEyeType arg0
	.short 170
	.short \arg0
	.endm

	; For when one or more trainers see you
	.macro GetEyeTrainerNum arg0, arg1
	.short 171
	.short \arg0
	.short \arg1
	.endm

	.macro NamePlayer arg0
	.short 172
	.short \arg0
	.endm

	.macro NicknameInput arg0, arg1
	.short 173
	.short \arg0
	.short \arg1
	.endm

	.macro FadeScreen arg0, speed, direction, color
	.short 174
	.short \arg0
	.short \speed
	.short \direction
	.short \color
	.endm

	.macro WaitFade
	.short 175
	.endm

	.macro Warp arg0, arg1=0, arg2, arg3, arg4
	.short 176
	.short \arg0
	.short \arg1
	.short \arg2
	.short \arg3
	.short \arg4
	.endm

	.macro RockClimb arg0
	.short 177
	.short \arg0
	.endm

	.macro Surf arg0
	.short 178
	.short \arg0
	.endm

	.macro Waterfall arg0
	.short 179
	.short \arg0
	.endm

	.macro ScrCmd_180 arg0, arg1, arg2
	.short 180
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro FlashEffect
	.short 181
	.endm

	.macro Whirlpool arg0
	.short 182
	.short \arg0
	.endm

	.macro ScrCmd_183 arg0
	.short 183
	.short \arg0
	.endm

	.macro PlayerOnBikeCheck arg0
	.short 184
	.short \arg0
	.endm

	.macro PlayerOnBikeSet arg0
	.short 185
	.byte \arg0
	.endm

	; If `lock` is 1, the player's bike state will
	; be locked, meaning they cannot mount or
	; dismount their bike; otherwise, if `lock` is
	; any other value, the bike state will be
	; unlocked. The main use for this command was
	; to block the player from dismounting their
	; bike while they were on Cycling Road.
	.macro SetBikeStateLock lock
	.short 186
	.byte \lock
	.endm

	; Get the player's overworld state.
	; Used in some places to determine whether
	; the player is masquerading as a member
	; of Team Rocket.
	.macro GetPlayerState var
	.short 187
	.short \var
	.endm

	.macro SetAvatarBits arg0
	.short 188
	.short \arg0
	.endm

	.macro UpdateAvatarState
	.short 189
	.endm

	; In the buffer_XXX commands, the maximum
	; acceptable value for the slot arg is 7.
	; This sets the message format placeholder
	; to whatever is buffered.
	.macro BufferPlayersName slot
	.short 190
	.byte \slot
	.endm

	; If you use this before naming your rival,
	; this will be an empty string.
	.macro BufferRivalsName slot
	.short 191
	.byte \slot
	.endm

	.macro BufferFriendsName slot
	.short 192
	.byte \slot
	.endm

	; For these commands, the additional argument
	; is a flex arg, meaning it can be a literal
	; or a variable.
	.macro BufferMonSpeciesName slot, party_pos
	.short 193
	.byte \slot
	.short \party_pos
	.endm

	.macro BufferItemName slot, item
	.short 194
	.byte \slot
	.short \item
	.endm

	.macro BufferPocketName slot, pocket
	.short 195
	.byte \slot
	.short \pocket
	.endm

	.macro BufferTMHMMoveName slot, tmhm
	.short 196
	.byte \slot
	.short \tmhm
	.endm

	.macro BufferMoveName slot, move
	.short 197
	.byte \slot
	.short \move
	.endm

	.macro BufferInt slot, value
	.short 198
	.byte \slot
	.short \value
	.endm

	.macro BufferPartyMonNick slot, party_pos
	.short 199
	.byte \slot
	.short \party_pos
	.endm

	.macro BufferTrainerClassName slot, trcls
	.short 200
	.byte \slot
	.short \trcls
	.endm

	.macro BufferPlayerUnionAvatarClassName slot
	.short 201
	.byte \slot
	.endm

	; The other two args here are unused
	.macro BufferSpeciesName slot, species, arg2, arg3
	.short 202
	.byte \slot
	.short \species
	.short \arg2
	.byte \arg3
	.endm

	.macro BufferStarterSpeciesName slot
	.short 203
	.byte \slot
	.endm

	; These two commands are leftover from Platinum.
	; As such, they are configured to check for the
	; Sinnoh starters instead of the Johto starters.
	; Since the player will never start with any of
	; Turtwig, Chimchar, or Piplup, this command
	; will always return TURTWIG, and the following
	; CHIMCHAR.
	; These commands are unused in HGSS.
	.macro BufferDPPtRivalStarterSpeciesName slot
	.short 204
	.byte \slot
	.endm

	.macro BufferDPPtFriendStarterSpeciesName slot
	.short 205
	.byte \slot
	.endm

	; Gets your starter species into the indicated
	; variable. Used to calculate which rival
	; party to use.
	.macro GetStarterChoice var
	.short 206
	.short \var
	.endm

	.macro BufferDecorationName slot, deco
	.short 207
	.byte \slot
	.short \deco
	.endm

	; Dummy
	.macro ScrCmd_208 slot, unk
	.short 208
	.byte \slot
	.short \unk
	.endm

	; Dummy
	.macro ScrCmd_209 slot, unk
	.short 209
	.byte \slot
	.short \unk
	.endm

	.macro BufferMapSecName slot, location
	.short 210
	.byte \slot
	.short \location
	.endm

	.macro ScrCmd_211 arg0, arg1
	.short 211
	.short \arg0
	.short \arg1
	.endm

	; For when you talk to a trainer
	.macro GetTrainerNum arg0
	.short 212
	.short \arg0
	.endm

	.macro TrainerBattle trainer, arg1, arg2, arg3
	.short 213
	.short \trainer
	.short \arg1
	.byte \arg2
	.byte \arg3
	.endm

	.macro TrainerMessage trainer, param
	.short 214
	.short \trainer
	.short \param
	.endm

	.macro GetTrainerMsgParams intro, after, _1poke
	.short 215
	.short \intro
	.short \after
	.short \_1poke
	.endm

	.macro GetRematchMsgParams arg0, arg1, arg2
	.short 216
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro TrainerIsDoubleBattle arg0
	.short 217
	.short \arg0
	.endm

	.macro EncounterMusic arg0
	.short 218
	.short \arg0
	.endm

	.macro WhiteOut
	.short 219
	.endm

	; Is this loss?
	.macro CheckBattleWon var
	.short 220
	.short \var
	.endm

	.macro StaticWildWonOrCaughtCheck arg0, arg1
	.short 221
	.short \arg0
	.byte \arg1
	.endm

	.macro PartyCheckForDouble arg0
	.short 222
	.short \arg0
	.endm

	.macro ScrCmd_223
	.short 223
	.endm

	.macro ScrCmd_224
	.short 224
	.endm

	.macro GoToIfTrainerDefeated arg0
	.short 225
	.word \arg0-.-4
	.endm

	.macro ScrCmd_226 arg0, arg1, arg2, arg3
	.short 226
	.short \arg0
	.short \arg1
	.short \arg2
	.short \arg3
	.endm

	.macro ScrCmd_227 arg0, arg1, arg2, arg3
	.short 227
	.short \arg0
	.short \arg1
	.short \arg2
	.short \arg3
	.endm

	.macro ScrCmd_228 arg0
	.short 228
	.short \arg0
	.endm

	.macro ScrCmd_229 arg0
	.short 229
	.short \arg0
	.endm

	.macro ScrCmd_230
	.short 230
	.endm

	.macro ScrCmd_231
	.short 231
	.endm

	.macro ScrCmd_232 arg0
	.short 232
	.short \arg0
	.endm

	.macro ScrCmd_233 arg0
	.short 233
	.short \arg0
	.endm

	.macro ScrCmd_234 arg0, arg1, arg2, arg3
	.short 234
	.short \arg0
	.short \arg1
	.short \arg2
	.short \arg3
	.endm

	.macro ScrCmd_235 arg0
	.short 235
	.short \arg0
	.endm

	.macro ScrCmd_236 arg0
	.short 236
	.short \arg0
	.endm

	.macro ScrCmd_237
	.short 237
	.endm

	.macro PartyHasPokerus arg0
	.short 238
	.short \arg0
	.endm

	.macro MonGetGender arg0, arg1
	.short 239
	.short \arg0
	.short \arg1
	.endm

	.macro SetDynamicWarp arg0, arg1, arg2, arg3, arg4
	.short 240
	.short \arg0
	.short \arg1
	.short \arg2
	.short \arg3
	.short \arg4
	.endm

	.macro GetDynamicWarpFloorNo arg0
	.short 241
	.short \arg0
	.endm

	.macro ElevatorCurFloorBox arg0, arg1, arg2, arg3
	.short 242
	.byte \arg0
	.byte \arg1
	.short \arg2
	.short \arg3
	.endm

	.macro CountJohtoDexSeen var
	.short 243
	.short \var
	.endm

	.macro CountJohtoDexOwned var
	.short 244
	.short \var
	.endm

	.macro CountNationalDexSeen var
	.short 245
	.short \var
	.endm

	.macro CountNationalDexOwned var
	.short 246
	.short \var
	.endm

	; Dummy
	.macro ScrCmd_247
	.short 247
	.endm

	; The actual Pokedex evaluation.
	; national: 0 = Johto dex, 1 = National dex
	; msg: Variable to return the message ID
	; fanfare: Variable to return the fanfare ID
	.macro GetDexEvalResult national, msg, fanfare
	.short 248
	.byte \national
	.short \msg
	.short \fanfare
	.endm

	.macro RocketTrapBattle arg0, arg1
	.short 249
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_250 arg0, arg1
	.short 250
	.short \arg0
	.short \arg1
	.endm

	.macro CatchingTutorial
	.short 251
	.endm

	.macro ScrCmd_252
	.short 252
	.endm

	.macro GetSaveFileState arg0
	.short 253
	.short \arg0
	.endm

	.macro SaveGameNormal arg0
	.short 254
	.short \arg0
	.endm

	.macro ScrCmd_255 arg0, arg1
	.short 255
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_256 arg0
	.short 256
	.short \arg0
	.endm

	.macro ScrCmd_257 arg0
	.short 257
	.short \arg0
	.endm

	.macro ScrCmd_258
	.short 258
	.endm

	.macro ScrCmd_259 arg0
	.short 259
	.short \arg0
	.endm

	.macro ScrCmd_260 arg0
	.short 260
	.short \arg0
	.endm

	.macro ScrCmd_261 arg0
	.short 261
	.short \arg0
	.endm

	.macro ScrCmd_262
	.short 262
	.endm

	.macro ScrCmd_263
	.short 263
	.endm

	.macro ScrCmd_264 arg0
	.short 264
	.short \arg0
	.endm

	.macro ScrCmd_265
	.short 265
	.endm

	.macro ScrCmd_266
	.short 266
	.endm

	.macro ScrCmd_267 arg0, arg1
	.short 267
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_268 arg0
	.short 268
	.short \arg0
	.endm

	.macro ScrCmd_269 arg0
	.short 269
	.short \arg0
	.endm

	.macro ScrCmd_270
	.short 270
	.endm

	.macro ScrCmd_271 arg0, arg1
	.short 271
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_272 arg0
	.short 272
	.short \arg0
	.endm

	.macro ScrCmd_273 arg0
	.short 273
	.short \arg0
	.endm

	.macro ScrCmd_274 arg0, arg1
	.short 274
	.short \arg0
	.short \arg1
	.endm

	.macro MartBuy arg0
	.short 275
	.short \arg0
	.endm

	.macro SpecialMartBuy arg0
	.short 276
	.short \arg0
	.endm

	.macro DecorationMart arg0
	.short 277
	.short \arg0
	.endm

	.macro SealMart arg0
	.short 278
	.short \arg0
	.endm

	; Used with poison faint, but due to overworld
	; poison mechanics in gen 4, this is
	; never reached.
	.macro OverworldWhiteOut
	.short 279
	.endm

	.macro SetSpawn arg0
	.short 280
	.short \arg0
	.endm

	; Are you a boy? Or are you a girl?
	.macro GetPlayerGender var
	.short 281
	.short \var
	.endm

	.macro HealParty
	.short 282
	.endm

	.macro ScrCmd_283
	.short 283
	.endm

	.macro ScrCmd_284
	.short 284
	.endm

	.macro ScrCmd_285 arg0
	.short 285
	.short \arg0
	.endm

	.macro ScrCmd_286
	.short 286
	.endm

	.macro BufferUnionRoomAvatarChoices
	.short 287
	.endm

	.macro UnionRoomAvatarIdxToTrainerClass arg0, arg1
	.short 288
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_289 arg0
	.short 289
	.short \arg0
	.endm

	.macro CheckPokedex arg0
	.short 290
	.short \arg0
	.endm

	.macro GivePokedex
	.short 291
	.endm

	.macro CheckRunningShoes arg0
	.short 292
	.short \arg0
	.endm

	.macro GiveRunningShoes
	.short 293
	.endm

	.macro CheckBadge badge, var
	.short 294
	.short \badge
	.short \var
	.endm

	.macro GiveBadge badge
	.short 295
	.short \badge
	.endm

	; This command is never used because it is
	; assumed that you cannot get the 8th badge
	; before the other 7, or the 16th before the
	; other 15. This assumption does not account
	; for tweaking.
	.macro CountBadges var
	.short 296
	.short \var
	.endm

	.macro ScrCmd_297 arg0
	.short 297
	.short \arg0
	.endm

	.macro ScrCmd_298
	.short 298
	.endm

	.macro CheckEscortMode arg0
	.short 299
	.short \arg0
	.endm

	.macro SetEscortMode
	.short 300
	.endm

	.macro ClearEscortMode
	.short 301
	.endm

	.macro ScrCmd_302 arg0
	.short 302
	.short \arg0
	.endm

	.macro ScrCmd_303
	.short 303
	.endm

	.macro ScrCmd_304
	.short 304
	.endm

	.macro ScrCmd_305 arg0
	.short 305
	.short \arg0
	.endm

	.macro ScrCmd_306
	.short 306
	.endm

	.macro ScrCmd_307 arg0, arg1, arg2, arg3, arg4
	.short 307
	.short \arg0
	.short \arg1
	.short \arg2
	.short \arg3
	.byte \arg4
	.endm

	.macro ScrCmd_308 arg0
	.short 308
	.byte \arg0
	.endm

	.macro ScrCmd_309 arg0
	.short 309
	.byte \arg0
	.endm

	.macro ScrCmd_310 arg0
	.short 310
	.byte \arg0
	.endm

	.macro ScrCmd_311 arg0
	.short 311
	.byte \arg0
	.endm

	.macro BufferDaycareMonNicks
	.short 312
	.endm

	.macro GetDaycareState arg0
	.short 313
	.short \arg0
	.endm

	.macro EcruteakGymInit
	.short 314
	.endm

	.macro ScrCmd_315
	.short 315
	.endm

	.macro ScrCmd_316
	.short 316
	.endm

	.macro ScrCmd_317 arg0
	.short 317
	.byte \arg0
	.endm

	.macro CianwoodGymInit
	.short 318
	.endm

	.macro CianwoodGymTurnWinch arg0
	.short 319
	.short \arg0
	.endm

	.macro VermilionGymInit
	.short 320
	.endm

	.macro VermilionGymLockAction arg0, arg1
	.short 321
	.byte \arg0
	.byte \arg1
	.endm

	.macro VermilionGymCanCheck arg0, arg1
	.short 322
	.byte \arg0
	.short \arg1
	.endm

	.macro ResampleVermilionGymCans
	.short 323
	.endm

	.macro VioletGymInit
	.short 324
	.endm

	.macro VioletGymElevator
	.short 325
	.endm

	.macro AzaleaGymInit
	.short 326
	.endm

	.macro AzaleaGymSpinarak arg0
	.short 327
	.byte \arg0
	.endm

	.macro AzaleaGymSwitch arg0
	.short 328
	.byte \arg0
	.endm

	.macro BlackthornGymInit
	.short 329
	.endm

	.macro FuchsiaGymInit
	.short 330
	.endm

	.macro ViridianGymInit
	.short 331
	.endm

	.macro GetPartyCount var
	.short 332
	.short \var
	.endm

	.macro ScrCmd_333 arg0
	.short 333
	.byte \arg0
	.endm

	.macro ScrCmd_334 arg0
	.short 334
	.short \arg0
	.endm

	.macro ScrCmd_335 arg0, arg1
	.short 335
	.short \arg0
	.short \arg1
	.endm

	.macro BufferBerryName slot, item, quantity
	.short 336
	.byte \slot
	.short \item
	.short \quantity
	.endm

	.macro BufferNatureName slot, nature
	.short 337
	.byte \slot
	.short \nature
	.endm

	.macro MovePerson arg0, arg1, arg2
	.short 338
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro MovePersonFacing person, x, z, y, facing
	.short 339
	.short \person
	.short \x
	.short \z
	.short \y
	.short \facing
	.endm

	.macro SetObjectMovementType arg0, arg1
	.short 340
	.short \arg0
	.short \arg1
	.endm

	.macro SetObjectFacing arg0, arg1
	.short 341
	.short \arg0
	.short \arg1
	.endm

	.macro MoveWarp arg0, arg1, arg2
	.short 342
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro MoveBGEvent arg0, arg1, arg2
	.short 343
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro ScrCmd_344 arg0, arg1
	.short 344
	.short \arg0
	.short \arg1
	.endm

	.macro AddWaitingIcon
	.short 345
	.endm

	.macro RemoveWaitingIcon
	.short 346
	.endm

	.macro ScrCmd_347 arg0
	.short 347
	.short \arg0
	.endm

	.macro WaitButtonOrDelay arg0
	.short 348
	.short \arg0
	.endm

	.macro PartySelectUI
	.short 349
	.endm

	.macro ScrCmd_350
	.short 350
	.endm

	.macro GetPartySelection arg0
	.short 351
	.short \arg0
	.endm

	.macro PokemonSummaryScreen arg0, arg1, arg2
	.short 352
	.byte \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro GetMoveSelection arg0, arg1
	.short 353
	.byte \arg0
	.short \arg1
	.endm

	.macro GetPartyMonSpecies slot, var
	.short 354
	.short \slot
	.short \var
	.endm

	.macro PartyMonIsMine slot, var
	.short 355
	.short \slot
	.short \var
	.endm

	.macro PartyCountNotEgg var
	.short 356
	.short \var
	.endm

	; Count Pokemon that are not fainted.
	; If except is set, exclude that slot
	; from the tally. Use 6 to disable.
	.macro CountAliveMons var, except=PARTY_SIZE
	.short 357
	.short \var
	.short \except
	.endm

	.macro CountAliveMonsAndPC arg0
	.short 358
	.short \arg0
	.endm

	.macro PartyCountEgg arg0
	.short 359
	.short \arg0
	.endm

	.macro SubMoneyVar var
	.short 360
	.short \var
	.endm

	.macro RetrieveDaycareMon arg0, arg1
	.short 361
	.short \arg0
	.short \arg1
	.endm

	.macro GiveLoanMon arg0, arg1, arg2
	.short 362
	.byte \arg0
	.byte \arg1
	.short \arg2
	.endm

	.macro CheckReturnLoanMon arg0, arg1, arg2
	.short 363
	.byte \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro ReturnLoanMon arg0
	.short 364
	.short \arg0
	.endm

	.macro ResetDaycareEgg
	.short 365
	.endm

	.macro GiveDaycareEgg
	.short 366
	.endm

	.macro BufferDaycareWithdrawCost arg0, arg1
	.short 367
	.short \arg0
	.short \arg1
	.endm

	.macro HasEnoughMoneyVar var, amount
	.short 368
	.short \var
	.short \amount
	.endm

	.macro EggHatchAnim
	.short 369
	.endm

	.macro ScrCmd_370 arg0
	.short 370
	.byte \arg0
	.endm

	.macro BufferDaycareMonGrowth arg0, arg1
	.short 371
	.short \arg0
	.short \arg1
	.endm

	.macro GetTailDaycareMonSpeciesAndNick arg0
	.short 372
	.short \arg0
	.endm

	.macro PutMonInDaycare arg0
	.short 373
	.short \arg0
	.endm

	.macro ScrCmd_374 arg0
	.short 374
	.short \arg0
	.endm

	.macro MakeObjectVisible arg0
	.short 375
	.short \arg0
	.endm

	.macro ScrCmd_376
	.short 376
	.endm

	.macro ScrCmd_377 arg0
	.short 377
	.short \arg0
	.endm

	.macro ViewRankings scope, page, record
	.short 378
	.short \scope * 3 + \page
	.short \record
	.endm

	.macro ScrCmd_379 arg0
	.short 379
	.short \arg0
	.endm

	.macro Random arg0, arg1
	.short 380
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_381 arg0, arg1
	.short 381
	.short \arg0
	.short \arg1
	.endm

	.macro MonGetFriendship arg0, arg1
	.short 382
	.short \arg0
	.short \arg1
	.endm

	.macro MonAddFriendship arg0, arg1
	.short 383
	.short \arg0
	.short \arg1
	.endm

	.macro MonSubtractFriendship arg0, arg1
	.short 384
	.short \arg0
	.short \arg1
	.endm

	.macro BufferDaycareMonStats arg0, arg1, arg2, arg3
	.short 385
	.short \arg0
	.short \arg1
	.short \arg2
	.short \arg3
	.endm

	.macro GetPlayerFacing arg0
	.short 386
	.short \arg0
	.endm

	.macro GetDaycareCompatibility arg0
	.short 387
	.short \arg0
	.endm

	.macro CheckDaycareEgg arg0
	.short 388
	.short \arg0
	.endm

	.macro PlayerHasSpecies arg0, arg1
	.short 389
	.short \arg0
	.short \arg1
	.endm

	.macro SizeRecordCompare arg0, arg1
	.short 390
	.short \arg0
	.short \arg1
	.endm

	.macro SizeRecordUpdate arg0
	.short 391
	.short \arg0
	.endm

	.macro BufferMonSize arg0, arg1, arg2
	.short 392
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro BufferRecordSize arg0, arg1, arg2
	.short 393
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro ScrCmd_394 arg0
	.short 394
	.short \arg0
	.endm

	.macro ScrCmd_395 arg0
	.short 395
	.short \arg0
	.endm

	.macro CountMonMoves arg0, arg1
	.short 396
	.short \arg0
	.short \arg1
	.endm

	.macro MonForgetMove arg0, arg1
	.short 397
	.short \arg0
	.short \arg1
	.endm

	.macro MonGetMove arg0, arg1, arg2
	.short 398
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro BufferPartyMonMoveName slot, party_pos, move_pos
	.short 399
	.byte \slot
	.short \party_pos
	.short \move_pos
	.endm

	; action = 0: Deactivate strength
	; action = 1: Activate strength
	; action = 2: Check whether strength is active
	.macro StrengthFlagAction action, var=0
	.short 400
	.byte \action
	.if \action == 2
	.short \var
	.endif
	.endm

	.macro FlashAction action, var=0
	.short 401
	.byte \action
	.if \action == 2
	.short \var
	.endif
	.endm

	.macro DefogAction action, var=0
	.short 402
	.byte \action
	.if \action == 2
	.short \var
	.endif
	.endm

	.macro ScrCmd_403 arg0, arg1
	.short 403
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_404 arg0, arg1, arg2
	.short 404
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro ScrCmd_405 arg0, arg1, arg2
	.short 405
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro ScrCmd_406 arg0
	.short 406
	.short \arg0
	.endm

	.macro ScrCmd_407 arg0, arg1
	.short 407
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_408 arg0, arg1
	.short 408
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_409
	.short 409
	.endm

	.macro ScrCmd_410 arg0, arg1
	.short 410
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_411
	.short 411
	.endm

	.macro ScrCmd_412 arg0, arg1, arg2
	.short 412
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro ScrCmd_413 arg0, arg1, arg2, arg3
	.short 413
	.short \arg0
	.short \arg1
	.short \arg2
	.short \arg3
	.endm

	.macro ScrCmd_414 arg0
	.short 414
	.short \arg0
	.endm

	.macro ScrCmd_415 arg0
	.short 415
	.short \arg0
	.endm

	.macro ScrCmd_416 arg0, arg1, arg2
	.short 416
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro ScrCmd_417 arg0, arg1
	.short 417
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_418 arg0, arg1
	.short 418
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_419 arg0
	.short 419
	.short \arg0
	.endm

	.macro ScrCmd_420 arg0
	.short 420
	.short \arg0
	.endm

	.macro ScrCmd_421 arg0, arg1, arg2
	.short 421
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro ScrCmd_422 arg0, arg1, arg2, arg3
	.short 422
	.short \arg0
	.short \arg1
	.short \arg2
	.byte \arg3
	.endm

	.macro CheckJohtoDexComplete arg0
	.short 423
	.short \arg0
	.endm

	.macro CheckNationalDexComplete arg0
	.short 424
	.short \arg0
	.endm

	.macro ShowCertificate arg0
	.short 425
	.short \arg0
	.endm

	.macro KenyaCheck arg0, arg1, arg2
	.short 426
	.short \arg0
	.short \arg1
	.byte \arg2
	.endm

	.macro ScrCmd_427 arg0
	.short 427
	.short \arg0
	.endm

	.macro MonGiveMail arg0
	.short 428
	.short \arg0
	.endm

	.macro CountFossils arg0
	.short 429
	.short \arg0
	.endm

	.macro SetPhoneCall arg0, arg1, arg2
	.short 430
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro RunPhoneCall
	.short 431
	.endm

	.macro GetFossilPokemon arg0, arg1
	.short 432
	.short \arg0
	.short \arg1
	.endm

	.macro GetFossilMinimumAmount arg0, arg1, arg2
	.short 433
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro PartyCountMonsAtOrBelowLevel arg0, arg1
	.short 434
	.short \arg0
	.short \arg1
	.endm

	.macro SurvivePoisoning arg0, arg1
	.short 435
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_436
	.short 436
	.endm

	.macro DebugWatch arg0
	.short 437
	.short \arg0
	.endm

	.macro GetStdMsgNaix arg0, arg1
	.short 438
	.short \arg0
	.short \arg1
	.endm

	.macro NonNPCMsgExtern arg0, arg1
	.short 439
	.short \arg0
	.short \arg1
	.endm

	.macro MsgBoxExtern arg0, arg1
	.short 440
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_441 arg0, arg1, arg2, arg3
	.short 441
	.short \arg0
	.short \arg1
	.short \arg2
	.short \arg3
	.endm

	.macro ScrCmd_442 arg0, arg1, arg2, arg3
	.short 442
	.short \arg0
	.short \arg1
	.short \arg2
	.short \arg3
	.endm

	.macro ScrCmd_443 arg0
	.short 443
	.byte \arg0
	.endm

	.macro ScrCmd_444 arg0, arg1, arg2, arg3
	.short 444
	.byte \arg0
	.short \arg1
	.short \arg2
	.byte \arg3
	.endm

	.macro ScrCmd_445 arg0
	.short 445
	.short \arg0
	.endm

	.macro ScrCmd_446 arg0
	.short 446
	.short \arg0
	.endm

	.macro SafariZoneAction arg0, arg1
	.short 447
	.byte \arg0
	.byte \arg1
	.endm

	.macro ScrCmd_448 arg0, arg1, arg2, arg3, arg4
	.short 448
	.short \arg0
	.short \arg1
	.short \arg2
	.short \arg3
	.short \arg4
	.endm

	.macro ScrCmd_449
	.short 449
	.endm

	.macro ScrCmd_450
	.short 450
	.endm

	.macro ScrCmd_451 arg0
	.short 451
	.short \arg0
	.endm

	.macro ScrCmd_452 arg0, arg1
	.short 452
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_453
	.short 453
	.endm

	.macro ScrCmd_454
	.short 454
	.endm

	.macro ScrCmd_455
	.short 455
	.endm

	.macro ScrCmd_456 arg0
	.short 456
	.byte \arg0
	.endm

	.macro MonGetNature arg0, arg1
	.short 457
	.short \arg0
	.short \arg1
	.endm

	.macro GetPartySlotWithNature arg0, arg1
	.short 458
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_459
	.short 459
	.endm

	.macro LoadPhoneDat arg0, arg1
	.short 460
	.short \arg0
	.short \arg1
	.endm

	.macro GetPhoneContactMsgIds arg0, arg1, arg2
	.short 461
	.byte \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro ScrCmd_462 arg0
	.short 462
	.short \arg0
	.endm

	.macro EnableMassOutbreaks
	.short 463
	.endm

	.macro CreateRoamer arg0
	.short 464
	.byte \arg0
	.endm

	.macro ScrCmd_465 arg0, arg1=0, arg2=0
	.short 465
	.short \arg0
	.if \arg0 <= 3
		.short \arg1
		.short \arg2
	.else
		.if \arg0 != 6
			.short \arg1
		.endif
	.endif
	.endm

	.macro ScrCmd_466 arg0, arg1
	.short 466
	.short \arg0
	.short \arg1
	.endm

	.macro MoveRelearnerInit arg0
	.short 467
	.short \arg0
	.endm

	.macro MoveTutorInit arg0, arg1
	.short 468
	.short \arg0
	.short \arg1
	.endm

	.macro MoveRelearnerGetResult arg0
	.short 469
	.short \arg0
	.endm

	.macro LoadNPCTrade arg0
	.short 470
	.byte \arg0
	.endm

	.macro GetOfferedSpecies arg0
	.short 471
	.short \arg0
	.endm

	.macro NPCTradeGetReqSpecies arg0
	.short 472
	.short \arg0
	.endm

	.macro NPCTradeExec arg0
	.short 473
	.short \arg0
	.endm

	.macro NPCTradeEnd
	.short 474
	.endm

	.macro ScrCmd_475
	.short 475
	.endm

	.macro EnablePokedexFormDetection
	.short 476
	.endm

	.macro NatDexFlagAction arg0, arg1
	.short 477
	.byte \arg0
	.short \arg1
	.endm

	.macro MonGetRibbonCount arg0, arg1
	.short 478
	.short \arg0
	.short \arg1
	.endm

	.macro GetPartyRibbonCount arg0
	.short 479
	.short \arg0
	.endm

	.macro MonHasRibbon arg0, arg1, arg2
	.short 480
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro GiveRibbon arg0, arg1
	.short 481
	.short \arg0
	.short \arg1
	.endm

	.macro BufferRibbonName arg0, arg1
	.short 482
	.byte \arg0
	.short \arg1
	.endm

	.macro GetEVTotal arg0, arg1
	.short 483
	.short \arg0
	.short \arg1
	.endm

	.macro GetWeekday arg0
	.short 484
	.short \arg0
	.endm

	.macro ScrCmd_485 arg0
	.short 485
	.short \arg0
	.endm

	.macro Dummy486
	.short 486
	.endm

	.macro PokeCenAnim arg0
	.short 487
	.short \arg0
	.endm

	.macro ElevatorAnim direction, distance
	.short 488
	.short \direction
	.short \distance
	.endm

	.macro MysteryGift arg0, arg1=0, arg2=0
	.short 489
	.short \arg0
	.if \arg0 >= 1 && \arg0 <= 3
	.short \arg1
	.else
	.if \arg0 == 5 || \arg0 == 6
	.short \arg1
	.short \arg2
	.endif
	.endif
	.endm

	.macro NopVar490 arg0
	.short 490
	.short \arg0
	.endm

	.macro ScrCmd_491 arg0
	.short 491
	.short \arg0
	.endm

	.macro ScrCmd_492 arg0, arg1, arg2
	.short 492
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro PromptEasyChat arg0, arg1, arg2
	.short 493
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro ScrCmd_494 arg0, arg1
	.short 494
	.short \arg0
	.short \arg1
	.endm

	.macro GetGameVersion arg0
	.short 495
	.short \arg0
	.endm

	.macro GetPartyLead arg0
	.short 496
	.short \arg0
	.endm

	.macro GetMonTypes arg0, arg1, arg2
	.short 497
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro PrimoPasswordCheck1 arg0, arg1, arg2, arg3, arg4
	.short 498
	.short \arg0
	.short \arg1
	.short \arg2
	.short \arg3
	.short \arg4
	.endm

	.macro PrimoPasswordCheck2 arg0, arg1, arg2, arg3, arg4
	.short 499
	.short \arg0
	.short \arg1
	.short \arg2
	.short \arg3
	.short \arg4
	.endm

	.macro ScrCmd_500 arg0
	.short 500
	.byte \arg0
	.endm

	.macro ScrCmd_501 arg0
	.short 501
	.byte \arg0
	.endm

	.macro ScrCmd_502 arg0
	.short 502
	.byte \arg0
	.endm

	.macro LotoIDGet arg0
	.short 503
	.short \arg0
	.endm

	.macro LotoIDSearch arg0, arg1, arg2, arg3
	.short 504
	.short \arg0
	.short \arg1
	.short \arg2
	.short \arg3
	.endm

	.macro LotoIDSet
	.short 505
	.endm

	.macro BufferBoxMonNick arg0, arg1
	.short 506
	.byte \arg0
	.short \arg1
	.endm

	.macro CountPCEmptySpace arg0
	.short 507
	.short \arg0
	.endm

	.macro PalParkAction arg0
	.short 508
	.short \arg0
	.endm

	.macro ScrCmd_509 arg0
	.short 509
	.short \arg0
	.endm

	.macro ScrCmd_510
	.short 510
	.endm

	.macro PalParkScoreGet arg0, arg1
	.short 511
	.short \arg0
	.short \arg1
	.endm

	.macro PlayerMovementSavingSet
	.short 512
	.endm

	.macro PlayerMovementSavingClear
	.short 513
	.endm

	; Animate placing the balls on the machine
	; for the Hall of Fame
	.macro HallOfFameAnim num
	.short 514
	.short \num
	.endm

	.macro AddSpecialGameStat arg0
	.short 515
	.short \arg0
	.endm

	.macro BufferFashionName arg0, arg1
	.short 516
	.byte \arg0
	.short \arg1
	.endm

	.macro ScrCmd_517 arg0, arg1
	.short 517
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_518 arg0
	.short 518
	.short \arg0
	.endm

	.macro ScrCmd_519 arg0
	.short 519
	.short \arg0
	.endm

	.macro ScrCmd_520
	.short 520
	.endm

	.macro ScrCmd_521
	.short 521
	.endm

	.macro ScrCmd_522 arg0
	.short 522
	.short \arg0
	.endm

	.macro ScrCmd_523 arg0, arg1, arg2, arg3, arg4
	.short 523
	.short \arg0
	.short \arg1
	.short \arg2
	.short \arg3
	.short \arg4
	.endm

	.macro ScrCmd_524 arg0, arg1, arg2
	.short 524
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro ScrCmd_525 arg0
	.short 525
	.short \arg0
	.endm

	.macro ScrCmd_526 arg0
	.short 526
	.short \arg0
	.endm

	.macro ScrCmd_527 arg0
	.short 527
	.short \arg0
	.endm

	.macro ScrCmd_528 arg0
	.short 528
	.short \arg0
	.endm

	.macro GetPartyLeadAlive arg0
	.short 529
	.short \arg0
	.endm

	.macro ScrCmd_530 arg0, arg1
	.short 530
	.short \arg0
	.byte \arg1
	.endm

	.macro BufferBackgroundName arg0, arg1
	.short 531
	.byte \arg0
	.short \arg1
	.endm

	.macro CheckCoinsImmediate arg0, arg1
	.short 532
	.short \arg0
	.word \arg1
	.endm

	.macro CheckGiveCoins arg0, arg1
	.short 533
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_534 arg0
	.short 534
	.short \arg0
	.endm

	.macro MonGetLevel arg0, arg1
	.short 535
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_536 arg0, arg1
	.short 536
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_537
	.short 537
	.endm

	.macro ScrCmd_538 arg0, arg1
	.short 538
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_539 arg0
	.short 539
	.short \arg0
	.endm

	.macro ScrCmd_540 arg0
	.short 540
	.short \arg0
	.endm

	.macro BufferIntEx arg0, arg1, arg2, arg3
	.short 541
	.byte \arg0
	.short \arg1
	.byte \arg2
	.byte \arg3
	.endm

	.macro MonGetContestValue arg0, arg1, arg2
	.short 542
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro ScrCmd_543 arg0
	.short 543
	.short \arg0
	.endm

	.macro ScrCmd_544 arg0, arg1
	.short 544
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_545 arg0
	.short 545
	.short \arg0
	.endm

	.macro ScrCmd_546 arg0, arg1
	.short 546
	.byte \arg0
	.short \arg1
	.endm

	.macro ScrCmd_547 arg0
	.short 547
	.short \arg0
	.endm

	.macro ScrCmd_548
	.short 548
	.endm

	.macro ScrCmd_549 arg0
	.short 549
	.short \arg0
	.endm

	.macro ScrCmd_550 arg0
	.short 550
	.short \arg0
	.endm

	.macro ScrCmd_551 arg0
	.short 551
	.short \arg0
	.endm

	.macro ScrCmd_552 arg0, arg1
	.short 552
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_553 arg0, arg1
	.short 553
	.byte \arg0
	.short \arg1
	.endm

	.macro ScrCmd_554 arg0
	.short 554
	.short \arg0
	.endm

	.macro ScrCmd_555 arg0
	.short 555
	.short \arg0
	.endm

	.macro ScrCmd_556 arg0
	.short 556
	.short \arg0
	.endm

	.macro CheckBattlePoints arg0, arg1
	.short 557
	.short \arg0
	.short \arg1
	.endm

	.macro UnionRoomAvatarIdxToSprite arg0, arg1
	.short 558
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_559 arg0, arg1
	.short 559
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_560 arg0, arg1
	.short 560
	.short \arg0
	.short \arg1
	.endm

	.macro ScreenShake arg0, arg1, arg2, arg3
	.short 561
	.short \arg0
	.short \arg1
	.short \arg2
	.short \arg3
	.endm

	.macro MultiBattle arg0, arg1, arg2, arg3
	.short 562
	.short \arg0
	.short \arg1
	.short \arg2
	.byte \arg3
	.endm

	.macro ScrCmd_563 arg0, arg1, arg2
	.short 563
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro ScrCmd_564 arg0
	.short 564
	.short \arg0
	.endm

	.macro ScrCmd_565 arg0
	.short 565
	.short \arg0
	.endm

	.macro ScrCmd_566
	.short 566
	.endm

	.macro GetDPPlPrizeItemIDAndCost arg0, arg1, arg2
	.short 567
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro ScrCmd_568 arg0, arg1
	.short 568
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_569 arg0
	.short 569
	.short \arg0
	.endm

	.macro CheckCoinsVar arg0, arg1
	.short 570
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_571 arg0, arg1, arg2, arg3, arg4
	.short 571
	.short \arg0
	.short \arg1
	.short \arg2
	.short \arg3
	.short \arg4
	.endm

	.macro GetUniqueSealsQuantity arg0
	.short 572
	.short \arg0
	.endm

	.macro ScrCmd_573
	.short 573
	.endm

	.macro ScrCmd_574 arg0, arg1
	.short 574
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_575 arg0, arg1
	.short 575
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_576 arg0
	.short 576
	.short \arg0
	.endm

	.macro ScrCmd_577
	.short 577
	.endm

	.macro ScrCmd_578
	.short 578
	.endm

	.macro ScrCmd_579
	.short 579
	.endm

	.macro BufferSealName arg0, arg1
	.short 580
	.byte \arg0
	.short \arg1
	.endm

	.macro LockLastTalked
	.short 581
	.endm

	.macro ScrCmd_582 arg0, arg1, arg2
	.short 582
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro ScrCmd_583 arg0, arg1
	.short 583
	.short \arg0
	.byte \arg1
	.endm

	.macro PartyLegalCheck arg0
	.short 584
	.short \arg0
	.endm

	.macro ScrCmd_585
	.short 585
	.endm

	.macro ScrCmd_586 arg0
	.short 586
	.short \arg0
	.endm

	.macro ScrCmd_587
	.short 587
	.endm

	.macro LatiCaughtCheck arg0
	.short 588
	.short \arg0
	.endm

	.macro WildBattle species, level, shiny=0
	.short 589
	.short \species
	.short \level
	.byte \shiny
	.endm

	.macro GetTrcardStars arg0
	.short 590
	.short \arg0
	.endm

	.macro ScrCmd_591
	.short 591
	.endm

	.macro ScrCmd_592 arg0
	.short 592
	.short \arg0
	.endm

	.macro ShowSaveStats
	.short 593
	.endm

	.macro HideSaveStats
	.short 594
	.endm

	.macro ScrCmd_595 arg0
	.short 595
	.byte \arg0
	.endm

	.macro ScrCmd_596 arg0
	.short 596
	.short \arg0
	.endm

	.macro ScrCmd_597
	.short 597
	.endm

	.macro ScrCmd_598 arg0
	.short 598
	.short \arg0
	.endm

	.macro ScrCmd_599
	.short 599
	.endm

	.macro ScrCmd_600
	.short 600
	.endm

	.macro FollowMonFacePlayer
	.short 601
	.endm

	.macro ToggleFollowingPokemonMovement flag
	.short 602
	.short \flag
	.endm

	.macro WaitFollowingPokemonMovement
	.short 603
	.endm

	.macro FollowingPokemonMovement movement
	.short 604
	.short \movement
	.endm

	.macro ScrCmd_605 arg0, arg1
	.short 605
	.byte \arg0
	.byte \arg1
	.endm

	.macro ScrCmd_606
	.short 606
	.endm

	.macro ScrCmd_607
	.short 607
	.endm

	.macro ScrCmd_608
	.short 608
	.endm

	.macro ScrCmd_609
	.short 609
	.endm

	.macro ScrCmd_610 arg0
	.short 610
	.short \arg0
	.endm

	.macro Pokeathlon arg0, arg1, arg2, arg3, arg4, arg5, arg6
	.short 611
	.byte \arg0
	.byte \arg1
	.short \arg2
	.short \arg3
	.short \arg4
	.short \arg5
	.short \arg6
	.endm

	.macro GetNPCTradeUnusedFlag arg0
	.short 612
	.short \arg0
	.endm

	.macro GetPhoneContactRandomGiftBerry arg0
	.short 613
	.short \arg0
	.endm

	.macro GetPhoneContactGiftItem arg0
	.short 614
	.short \arg0
	.endm

	.macro CameronPhoto arg0
	.short 615
	.short \arg0
	.endm

	.macro CountSavedPhotos arg0
	.short 616
	.short \arg0
	.endm

	.macro OpenPhotoAlbum
	.short 617
	.endm

	.macro PhotoAlbumIsFull arg0
	.short 618
	.short \arg0
	.endm

	.macro RocketCostumeFlagCheck arg0
	.short 619
	.short \arg0
	.endm

	.macro RocketCostumeFlagAction arg0
	.short 620
	.byte \arg0
	.endm

	.macro PlaceStarterBallsInElmsLab
	.short 621
	.endm

	.macro ScrCmd_622 arg0, arg1
	.short 622
	.short \arg0
	.short \arg1
	.endm

	.macro AnimApricornTree arg0
	.short 623
	.short \arg0
	.endm

	.macro ApricornTreeGetApricorn arg0
	.short 624
	.short \arg0
	.endm

	.macro GiveApricornFromTree arg0, arg1, arg2
	.short 625
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro BufferApricornName arg0, arg1
	.short 626
	.byte \arg0
	.short \arg1
	.endm

	.macro ScrCmd_627 arg0
	.short 627
	.byte \arg0
	.endm

	.macro ScrCmd_628 arg0, arg1
	.short 628
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_629
	.short 629
	.endm

	.macro ScrCmd_630 arg0
	.short 630
	.short \arg0
	.endm

	.macro ScrCmd_631 arg0, arg1, arg2
	.short 631
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro CountPartyMonsOfSpecies arg0, arg1
	.short 632
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_633 arg0, arg1, arg2
	.short 633
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro ScrCmd_634 arg0, arg1
	.short 634
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_635 arg0, arg1
	.short 635
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_636 arg0
	.short 636
	.short \arg0
	.endm

	.macro ScrCmd_637 arg0, arg1, arg2
	.short 637
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro ScrCmd_638 arg0, arg1, arg2
	.short 638
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro ScrCmd_639 arg0, arg1, arg2
	.short 639
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro ScrCmd_640 arg0
	.short 640
	.short \arg0
	.endm

	.macro SaveWipeExtraChunks
	.short 641
	.endm

	.macro ScrCmd_642 arg0
	.short 642
	.short \arg0
	.endm

	.macro ScrCmd_643 arg0, arg1, arg2
	.short 643
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro ScrCmd_644 arg0, arg1, arg2
	.short 644
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro ScrCmd_645 arg0, arg1, arg2
	.short 645
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro ScrCmd_646 arg0
	.short 646
	.short \arg0
	.endm

	.macro GetPartySlotWithSpecies arg0, arg1
	.short 647
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_648 arg0, arg1, arg2, arg3, arg4
	.short 648
	.short \arg0
	.short \arg1
	.short \arg2
	.short \arg3
	.short \arg4
	.endm

	.macro ScratchOffCard
	.short 649
	.endm

	.macro ScratchOffCardEnd
	.short 650
	.endm

	.macro GetScratchOffPrize arg0, arg1, arg2
	.short 651
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro ScrCmd_652 arg0, arg1, arg2
	.short 652
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro MoveTutorChooseMove mon_slot, tutor_no, arg2, arg3
	.short 653
	.short \mon_slot
	.short \tutor_no
	.short \arg2
	.short \arg3
	.endm

	.macro TutorMoveTeachInSlot party_slot, move_slot, move
	.short 654
	.short \party_slot
	.short \move_slot
	.short \move
	.endm

	.macro TutorMoveGetPrice arg0, arg1
	.short 655
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_656 arg0, arg1
	.short 656
	.short \arg0
	.short \arg1
	.endm

	.macro StatJudge mon_slot, iv_sum, best_stat, best_iv
	.short 657
	.short \mon_slot
	.short \iv_sum
	.short \best_stat
	.short \best_iv
	.endm

	.macro BufferStatName arg0, arg1
	.short 658
	.byte \arg0
	.short \arg1
	.endm

	.macro SetMonForm arg0, arg1
	.short 659
	.short \arg0
	.short \arg1
	.endm

	.macro BufferTrainerName arg0, arg1
	.short 660
	.byte \arg0
	.short \arg1
	.endm

	.macro ScrCmd_661 arg0, arg1, arg2, arg3
	.short 661
	.byte \arg0
	.word \arg1
	.byte \arg2
	.byte \arg3
	.endm

	.macro ScrCmd_662 arg0, arg1, arg2
	.short 662
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro ScrCmd_663 arg0
	.short 663
	.short \arg0
	.endm

	.macro ScrCmd_664
	.short 664
	.endm

	.macro ScrCmd_665 arg0
	.short 665
	.short \arg0
	.endm

	.macro ScrCmd_666 arg0
	.short 666
	.short \arg0
	.endm

	.macro ScrCmd_667 arg0
	.short 667
	.short \arg0
	.endm

	.macro BufferTypeName arg0, arg1
	.short 668
	.byte \arg0
	.short \arg1
	.endm

	.macro GetItemQuantity arg0, arg1
	.short 669
	.short \arg0
	.short \arg1
	.endm

	.macro GetHiddenPowerType arg0, arg1
	.short 670
	.short \arg0
	.short \arg1
	.endm

	.macro SetFavoriteMon
	.short 671
	.endm

	.macro GetFavoriteMon arg0, arg1, arg2
	.short 672
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro GetOwnedRotomForms arg0, arg1, arg2, arg3, arg4
	.short 673
	.short \arg0
	.short \arg1
	.short \arg2
	.short \arg3
	.short \arg4
	.endm

	.macro CountTranformedRotomsInParty arg0, arg1
	.short 674
	.short \arg0
	.short \arg1
	.endm

	.macro UpdateRotomForm arg0, arg1, arg2, arg3
	.short 675
	.short \arg0
	.short \arg1
	.short \arg2
	.short \arg3
	.endm

	.macro GetPartyMonForm arg0, arg1
	.short 676
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_677 arg0, arg1
	.short 677
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_678 arg0, arg1
	.short 678
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_679
	.short 679
	.endm

	.macro AddSpecialGameStat2 arg0
	.short 680
	.short \arg0
	.endm

	.macro ScrCmd_681 arg0
	.short 681
	.short \arg0
	.endm

	.macro ScrCmd_682 arg0
	.short 682
	.short \arg0
	.endm

	.macro GetStaticEncounterOutcome arg0
	.short 683
	.short \arg0
	.endm

	.macro ScrCmd_684 arg0
	.short 684
	.short \arg0
	.endm

	.macro GetPlayerXYZ arg0, arg1, arg2
	.short 685
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro ScrCmd_686 arg0, arg1
	.short 686
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_687 arg0
	.short 687
	.short \arg0
	.endm

	.macro GetPartySlotWithFatefulEncounter arg0, arg1
	.short 688
	.short \arg0
	.short \arg1
	.endm

	; Attempt to remove all Griseous Orbs and reset Pokemon
	; to forms present in Diamond and Pearl, to avoid
	; problems communicating with those games.
	.macro CommSanitizeParty var_result
	.short 689
	.short \var_result
	.endm

	.macro DaycareSanitizeMon arg0, arg1
	.short 690
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_691 arg0
	.short 691
	.short \arg0
	.endm

	.macro BufferBattleHallStreak arg0, arg1, arg2, arg3, arg4, arg5
	.short 692
	.byte \arg0
	.byte \arg1
	.byte \arg2
	.byte \arg3
	.short \arg4
	.short \arg5
	.endm

	.macro BattleHallCountUsedSpecies arg0
	.short 693
	.short \arg0
	.endm

	.macro BattleHallGetTotalStreak arg0
	.short 694
	.short \arg0
	.endm

	.macro ScrCmd_695 arg0
	.short 695
	.short \arg0
	.endm

	.macro ScrCmd_696 arg0
	.short 696
	.short \arg0
	.endm

	.macro ScrCmd_697 arg0
	.short 697
	.short \arg0
	.endm

	.macro FollowerPokeIsEventTrigger arg0, arg1, arg2
	.short 698
	.byte \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro ScrCmd_699
	.short 699
	.endm

	.macro ScrCmd_700
	.short 700
	.endm

	.macro MonHasItem arg0, arg1
	.short 701
	.short \arg0
	.short \arg1
	.endm

	.macro BattleTowerSetUpMultiBattle
	.short 702
	.endm

	.macro SetPlayerVolume arg0
	.short 703
	.short \arg0
	.endm

	.macro ScrCmd_704 arg0, arg1
	.short 704
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_705 arg0, arg1
	.short 705
	.short \arg0
	.word \arg1
	.endm

	.macro ScrCmd_706 arg0
	.short 706
	.short \arg0
	.endm

	.macro CheckMonSeen arg0, arg1
	.short 707
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_708 arg0
	.short 708
	.short \arg0
	.endm

	.macro ScrCmd_709
	.short 709
	.endm

	.macro ScrCmd_710
	.short 710
	.endm

	.macro FollowMonInteract
	.short 711
	.endm

	.macro ScrCmd_712 arg0
	.short 712
	.byte \arg0
	.endm

	.macro AlphPuzzle arg0
	.short 713
	.byte \arg0
	.endm

	.macro OpenAlphHiddenRoom arg0
	.short 714
	.byte \arg0
	.endm

	.macro UpdateDaycareMonObjects
	.short 715
	.endm

	.macro ScrCmd_716
	.short 716
	.endm

	.macro ScrCmd_717 arg0
	.short 717
	.short \arg0
	.endm

	.macro ScrCmd_718 arg0, arg1
	.short 718
	.byte \arg0
	.short \arg1
	.endm

	.macro ScrCmd_719 arg0, arg1
	.short 719
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_720 arg0
	.short 720
	.short \arg0
	.endm

	.macro ScrCmd_721 arg0
	.short 721
	.short \arg0
	.endm

	.macro ScrCmd_722 arg0, arg1, arg2, arg3, arg4
	.short 722
	.byte \arg0
	.byte \arg1
	.short \arg2
	.short \arg3
	.short \arg4
	.endm

	.macro ScrCmd_723 arg0, arg1, arg2, arg3, arg4
	.short 723
	.byte \arg0
	.byte \arg1
	.short \arg2
	.short \arg3
	.short \arg4
	.endm

	.macro ScrCmd_724 arg0, arg1
	.short 724
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_725 arg0, arg1
	.short 725
	.byte \arg0
	.short \arg1
	.endm

	.macro ScrCmd_726
	.short 726
	.endm

	.macro GetFollowPokePartyIndex arg0
	.short 727
	.short \arg0
	.endm

	.macro ScrCmd_728 arg0, arg1
	.short 728
	.byte \arg0
	.byte \arg1
	.endm

	.macro ScrCmd_729 arg0
	.short 729
	.short \arg0
	.endm

	.macro ScrCmd_730 arg0
	.short 730
	.short \arg0
	.endm

	.macro ScrCmd_731
	.short 731
	.endm

	.macro ScrCmd_732 arg0
	.short 732
	.byte \arg0
	.endm

	.macro ScrCmd_733 arg0, arg1
	.short 733
	.byte \arg0
	.short \arg1
	.endm

	.macro ScrCmd_734 arg0
	.short 734
	.byte \arg0
	.endm

	.macro ScrCmd_735 arg0
	.short 735
	.short \arg0
	.endm

	.macro ClearKurtApricorn
	.short 736
	.endm

	.macro ScrCmd_737 arg0
	.short 737
	.short \arg0
	.endm

	.macro GetTotalApricornCount arg0
	.short 738
	.short \arg0
	.endm

	.macro ScrCmd_739
	.short 739
	.endm

	.macro ScrCmd_740 arg0, arg1
	.short 740
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_741 arg0, arg1, arg2, arg3
	.short 741
	.short \arg0
	.short \arg1
	.short \arg2
	.short \arg3
	.endm

	.macro ScrCmd_742 arg0, arg1, arg2
	.short 742
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro ScrCmd_743 arg0
	.short 743
	.short \arg0
	.endm

	.macro CreatePokeathlonFriendshipRoomStatues
	.short 744
	.endm

	.macro BufferPokeathlonCourseName arg0, arg1
	.short 745
	.byte \arg0
	.short \arg1
	.endm

	.macro TouchscreenMenuHide
	.short 746
	.endm

	.macro TouchscreenMenuShow
	.short 747
	.endm

	.macro GetMenuChoice arg0
	.short 748
	.short \arg0
	.endm

	.macro MenuInitStdGmm arg0, arg1, arg2, arg3, arg4
	.short 749
	.byte \arg0
	.byte \arg1
	.byte \arg2
	.byte \arg3
	.short \arg4
	.endm

	.macro MenuInit arg0, arg1, arg2, arg3, arg4
	.short 750
	.byte \arg0
	.byte \arg1
	.byte \arg2
	.byte \arg3
	.short \arg4
	.endm

	.macro MenuItemAdd arg0, arg1, arg2
	.short 751
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro MenuExec
	.short 752
	.endm

	.macro RockSmashItemCheck arg0, arg1, arg2
	.short 753
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro TryHeadbuttEncounter arg0
	.short 754
	.short \arg0
	.endm

	.macro LegendCutsceneClearBellAnimBegin
	.short 755
	.endm

	.macro LegendCutsceneClearBellAnimEnd
	.short 756
	.endm

	.macro LegendCutsceneClearBellRiseFromBag
	.short 757
	.endm

	.macro LegendCutsceneClearBellShimmer arg0
	.short 758
	.short \arg0
	.endm

	.macro LegendCutsceneLugiaEyeGlimmerEffect
	.short 759
	.endm

	.macro ScrCmd_760
	.short 760
	.endm

	.macro LegendCutsceneMoveCameraTo arg0
	.short 761
	.short \arg0
	.endm

	.macro LegendCutscenePanCameraTo arg0
	.short 762
	.short \arg0
	.endm

	.macro LegendCutsceneWaitCameraPan
	.short 763
	.endm

	.macro LegendCutsceneBirdFinalApproach
	.short 764
	.endm

	.macro LegendCutsceneWavesOrLeavesEffectBegin
	.short 765
	.endm

	.macro LegendCutsceneWavesOrLeavesEffectEnd
	.short 766
	.endm

	.macro LegendCutsceneLugiaArrivesEffectBegin
	.short 767
	.endm

	.macro LegendCutsceneLugiaArrivesEffectEnd
	.short 768
	.endm

	.macro LegendCutsceneLugiaArrivesEffectCameraPan
	.short 769
	.endm

	.macro CheckSeenAllLetterUnown arg0
	.short 770
	.short \arg0
	.endm

	.macro ScrCmd_771
	.short 771
	.endm

	.macro ScrCmd_772
	.short 772
	.endm

	.macro Cinematic arg0
	.short 773
	.short \arg0
	.endm

	.macro ShowLegendaryWing arg0
	.short 774
	.short \arg0
	.endm

	.macro ScrCmd_775 arg0, arg1
	.short 775
	.short \arg0
	.short \arg1
	.endm

	.macro GiveTogepiEgg
	.short 776
	.endm

	.macro ScrCmd_777 arg0, arg1
	.short 777
	.short \arg0
	.short \arg1
	.endm

	.macro GiveSpikyEarPichu
	.short 778
	.endm

	.macro RadioMusicIsPlaying arg0, arg1
	.short 779
	.short \arg0
	.short \arg1
	.endm

	.macro CasinoGame arg0, arg1
	.short 780
	.byte \arg0
	.byte \arg1
	.endm

	.macro KenyaCheckPartyOrMailbox arg0
	.short 781
	.short \arg0
	.endm

	.macro MartSell
	.short 782
	.endm

	.macro SetFollowMonInhibitState arg0
	.short 783
	.byte \arg0
	.endm

	.macro ScriptOverlayCmd arg0, arg1
	.short 784
	.byte \arg0
	.byte \arg1
	.endm

	.macro BugContestAction arg0, arg1
	.short 785
	.byte \arg0
	.short \arg1
	.endm

	.macro BufferBugContestWinner arg0
	.short 786
	.byte \arg0
	.endm

	.macro JudgeBugContest arg0, arg1, arg2
	.short 787
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro BufferBugContestMonNick arg0, arg1
	.short 788
	.byte \arg0
	.short \arg1
	.endm

	.macro BugContestGetTimeLeft arg0
	.short 789
	.byte \arg0
	.endm

	.macro IsBugContestantRegistered arg0, arg1
	.short 790
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_791 arg0, arg1
	.short 791
	.byte \arg0
	.short \arg1
	.endm

	.macro ScrCmd_792
	.short 792
	.endm

	.macro BankTransaction arg0, arg1
	.short 793
	.short \arg0
	.short \arg1
	.endm

	.macro CheckBankBalance arg0, arg1
	.short 794
	.short \arg0
	.word \arg1
	.endm

	.macro ScrCmd_795 arg0, arg1
	.short 795
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_796
	.short 796
	.endm

	.macro ScrCmd_797
	.short 797
	.endm

	.macro BufferRulesetName arg0
	.short 798
	.short \arg0
	.endm

	.macro ScrCmd_799 arg0
	.short 799
	.short \arg0
	.endm

	.macro ScrCmd_800 arg0
	.short 800
	.short \arg0
	.endm

	.macro ScrCmd_801 arg0
	.short 801
	.short \arg0
	.endm

	.macro ScrCmd_802
	.short 802
	.endm

	.macro ScrCmd_803 arg0, arg1
	.short 803
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_804 arg0
	.short 804
	.byte \arg0
	.endm

	.macro ScrCmd_805
	.short 805
	.endm

	.macro ScrCmd_806
	.short 806
	.endm

	.macro SetTrainerHouseSprite arg0, arg1
	.short 807
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_808 arg0
	.short 808
	.short \arg0
	.endm

	.macro ShowTrainerHouseIntroMessage arg0
	.short 809
	.short \arg0
	.endm

	.macro ScrCmd_810
	.short 810
	.endm

	.macro ScrCmd_811 arg0, arg1
	.short 811
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_812
	.short 812
	.endm

	.macro MomGiftCheck arg0
	.short 813
	.short \arg0
	.endm

	.macro ScrCmd_814
	.short 814
	.endm

	.macro ScrCmd_815 arg0
	.short 815
	.short \arg0
	.endm

	.macro UnownCircle
	.short 816
	.endm

	.macro ScrCmd_817 arg0
	.short 817
	.byte \arg0
	.endm

	.macro MystriStageGymmickInit
	.short 818
	.endm

	.macro ScrCmd_819
	.short 819
	.endm

	.macro ScrCmd_820 arg0
	.short 820
	.byte \arg0
	.endm

	.macro GetBuenasPassword arg0, arg1
	.short 821
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_822
	.short 822
	.endm

	.macro ScrCmd_823 arg0
	.short 823
	.short \arg0
	.endm

	.macro ScrCmd_824 arg0
	.short 824
	.short \arg0
	.endm

	.macro GetShinyLeafCount arg0, arg1
	.short 825
	.short \arg0
	.short \arg1
	.endm

	.macro TryGiveShinyLeafCrown arg0
	.short 826
	.short \arg0
	.endm

	.macro GetPartyMonForm2 arg0, arg1
	.short 827
	.short \arg0
	.short \arg1
	.endm

	.macro MonAddContestValue arg0, arg1, arg2
	.short 828
	.short \arg0
	.byte \arg1
	.short \arg2
	.endm

	.macro ScrCmd_829 arg0
	.short 829
	.short \arg0
	.endm

	.macro ScrCmd_830 arg0
	.short 830
	.short \arg0
	.endm

	.macro ScrCmd_831 arg0
	.short 831
	.short \arg0
	.endm

	.macro ScrCmd_832 arg0
	.short 832
	.short \arg0
	.endm

	.macro ScrCmd_833 arg0
	.short 833
	.short \arg0
	.endm

	.macro ScrCmd_834 arg0
	.short 834
	.short \arg0
	.endm

	.macro ScrCmd_835 arg0
	.short 835
	.short \arg0
	.endm

	.macro CheckKyogreGroudonInParty arg0
	.short 836
	.short \arg0
	.endm

	.macro ScrCmd_837 arg0
	.short 837
	.short \arg0
	.endm

	.macro BankOrWalletIsFull arg0, arg1
	.short 838
	.short \arg0
	.short \arg1
	.endm

	.macro SysSetSleepFlag arg0
	.short 839
	.short \arg0
	.endm

	.macro ScrCmd_840 arg0, arg1
	.short 840
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_841 arg0
	.short 841
	.byte \arg0
	.endm

	.macro ScrCmd_842 arg0
	.short 842
	.byte \arg0
	.endm

	.macro BufferItemNameIndef arg0, arg1
	.short 843
	.byte \arg0
	.short \arg1
	.endm

	.macro BufferItemNamePlural arg0, arg1
	.short 844
	.byte \arg0
	.short \arg1
	.endm

	.macro BufferPartyMonSpeciesNameIndef arg0, arg1
	.short 845
	.byte \arg0
	.short \arg1
	.endm

	.macro BufferSpeciesNameIndef arg0, arg1, arg2, arg3
	.short 846
	.byte \arg0
	.short \arg1
	.short \arg2
	.byte \arg3
	.endm

	.macro BufferDPPtFriendStarterSpeciesNameIndef arg0
	.short 847
	.byte \arg0
	.endm

	.macro BufferFashionNameIndef arg0, arg1
	.short 848
	.byte \arg0
	.short \arg1
	.endm

	.macro BufferTrainerClassNameIndef arg0, arg1
	.short 849
	.byte \arg0
	.short \arg1
	.endm

	.macro BufferSealNamePlural arg0, arg1
	.short 850
	.byte \arg0
	.short \arg1
	.endm

	.macro Capitalize arg0
	.short 851
	.byte \arg0
	.endm

	.macro BufferDeptStoreFloorNo arg0, arg1
	.short 852
	.byte \arg0
	.byte \arg1
	.endm

	; Script headers

	.macro MapScript kind, script
	.byte \kind
	.word \script
	.endm

	.macro MapScript2 var, val, script
	.short \var, \val, \script
	.endm

	; Convenience macros

	; Generic compare macro which attempts to deduce argument types based on their values
	; Any values between 0x4000 to 0x40FF and 0x8000 to 0x8015 are considered event variable identifiers
	.macro Compare var, arg
		.if ((\arg >= VARS_START && \arg <= VARS_END) || (\arg >= SPECIAL_VARS_START && \arg <= SPECIAL_VARS_END))
			CompareVarToVar \var, \arg
		.else
			CompareVarToValue \var, \arg
		.endif
	.endm

	.macro GoToIfUnset flag, dest
	CheckFlag \flag
	GoToIf FALSE, \dest
	.endm

	.macro GoToIfSet flag, dest
	CheckFlag \flag
	GoToIf TRUE, \dest
	.endm

	.macro GoToIfLt dest ; LESS THAN
	GoToIf 0, \dest
	.endm

	.macro GoToIfEq dest ; EQUAL
	GoToIf 1, \dest
	.endm

	.macro GoToIfGt dest ; GREATER THAN
	GoToIf 2, \dest
	.endm

	.macro GoToIfLe dest ; LESS THAN OR EQUAL
	GoToIf 3, \dest
	.endm

	.macro GoToIfGe dest ; GREATER THAN OR EQUAL
	GoToIf 4, \dest
	.endm

	.macro GoToIfNe dest ; NOT EQUAL
	GoToIf 5, \dest
	.endm

	.macro CallIfUnset flag, dest
	CheckFlag \flag
	CallIf FALSE, \dest
	.endm

	.macro CallIfSet flag, dest
	CheckFlag \flag
	CallIf TRUE, \dest
	.endm

	.macro CallIfLt dest ; LESS THAN
	CallIf 0, \dest
	.endm

	.macro CallIfEq dest ; EQUAL
	CallIf 1, \dest
	.endm

	.macro CallIfGt dest ; GREATER THAN
	CallIf 2, \dest
	.endm

	.macro CallIfLe dest ; LESS THAN OR EQUAL
	CallIf 3, \dest
	.endm

	.macro CallIfGe dest ; GREATER THAN OR EQUAL
	CallIf 4, \dest
	.endm

	.macro CallIfNe dest ; NOT EQUAL
	CallIf 5, \dest
	.endm

	.macro GoToIfDefeated trainer, dest
	CheckTrainerFlag \trainer
	GoToIf TRUE, \dest
	.endm

	.macro GoToIfNotDefeated trainer, dest
	CheckTrainerFlag \trainer
	GoToIf FALSE, \dest
	.endm

	.macro CallIfDefeated trainer, dest
	CheckTrainerFlag \trainer
	CallIf TRUE, \dest
	.endm

	.macro CallIfNotDefeated trainer, dest
	CheckTrainerFlag \trainer
	CallIf FALSE, \dest
	.endm

	.macro ItemVars item, quantity=1
	.if \item < 0x4000
	SetVar VAR_SPECIAL_x8004, \item
	.else
	CopyVar VAR_SPECIAL_x8004, \item
	.endif
	.if \quantity < 0x4000
	SetVar VAR_SPECIAL_x8005, \quantity
	.else
	CopyVar VAR_SPECIAL_x8005, \quantity
	.endif
	.endm

	.macro GoToIfNoItemSpace item, quantity, target
	ItemVars \item, \quantity
	HasSpaceForItem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIf eq, \target
	.endm

	.macro GoToIfNoItemSpace2 item, quantity, target
	ItemVars \item, \quantity
	HasSpaceForItem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIf ne, \target
	.endm

	.macro GiveItemNoCheck item, quantity
	ItemVars \item, \quantity
	CallStd std_give_item_verbose
	.endm

	.macro TakeItemNoCheck item, quantity
	ItemVars \item, \quantity
	TakeItem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	.endm

	.macro Switch var
	CopyVar VAR_SPECIAL_x8008, \var
	.endm

	.macro Case value, target
	Compare VAR_SPECIAL_x8008, \value
	GoToIf eq, \target
	.endm

	.macro PhoneCall who, b, c
	SetVar VAR_SPECIAL_x8004, \who
	SetVar VAR_SPECIAL_x8005, \b
	SetVar VAR_SPECIAL_x8006, \c
	CallStd std_phone_call
	.endm

	.macro SimpleNPCMsg msgid
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg \msgid
	WaitButton
	CloseMsg
	ReleaseAll
	.endm

	 /*
     * This flag is used by ScriptEntry and ScriptEntryEnd to control where
     * a user can add ScriptEntry commands (i.e., only at the start of the
     * input file). It is NOT meant for direct usage.
     */
    .set F_ACCEPT_SCRIPT_ENTRIES, TRUE

    .macro ScriptEntry name
    .if F_ACCEPT_SCRIPT_ENTRIES == TRUE
        .long \name-.-4
    .else
        .error "cannot specify ScriptEntry after ScriptEntryEnd"
    .endif
    .endm

    .macro ScriptEntryEnd
    .set F_ACCEPT_SCRIPT_ENTRIES, FALSE
    .short 0xFD13
    .endm

    .set F_INIT_SCRIPT_FRAME_TABLE_OPENED, FALSE
    .set F_INIT_SCRIPT_FRAME_TABLE_CLOSED, FALSE

    .macro InitScriptEntry_Fixed type, scriptID
    .if F_ACCEPT_SCRIPT_ENTRIES == TRUE
        .byte \type
        .short \scriptID, 0
    .else
        .error "cannot specify InitScriptEntry after InitScriptEntryEnd"
    .endif
    .endm

    .macro InitScriptEntry_OnFrameTable checksLabel
    .if F_ACCEPT_SCRIPT_ENTRIES == TRUE
        .set F_INIT_SCRIPT_FRAME_TABLE_OPENED, TRUE
        .byte INIT_SCRIPT_ON_FRAME_TABLE
        ScriptEntry \checksLabel
    .else
        .error "cannot specify InitScriptEntry after InitScriptEntryEnd"
    .endif
    .endm

    .macro InitScriptEntry_OnTransition scriptID
    InitScriptEntry_Fixed INIT_SCRIPT_ON_TRANSITION, \scriptID
    .endm

    .macro InitScriptEntry_OnResume scriptID
    InitScriptEntry_Fixed INIT_SCRIPT_ON_RESUME, \scriptID
    .endm

    .macro InitScriptEntry_OnLoad scriptID
    InitScriptEntry_Fixed INIT_SCRIPT_ON_LOAD, \scriptID
    .endm

    .macro InitScriptEntryEnd
    .set F_ACCEPT_SCRIPT_ENTRIES, FALSE
    .byte 0
    .endm

    .macro InitScriptGoToIfEqual var1, var2, scriptID
    .if F_INIT_SCRIPT_FRAME_TABLE_OPENED == TRUE
        .if F_INIT_SCRIPT_FRAME_TABLE_CLOSED == FALSE
            .short \var1, \var2, \scriptID
        .else
            .error "cannot specify InitScriptGoToIfEqual after InitScriptFrameTableEnd"
        .endif
    .else
        .error "cannot specify InitScriptGoToIfEqual before InitScriptEntry_OnFrameTable"
    .endif
    .endm

    .macro InitScriptFrameTableEnd
    .set F_INIT_SCRIPT_FRAME_TABLE_CLOSED, TRUE
    .short 0
    .endm

    .macro InitScriptEnd
    .if F_ACCEPT_SCRIPT_ENTRIES == TRUE
        .error "cannot specify InitScriptEnd before InitScriptEntryEnd"
    .endif
    .if F_INIT_SCRIPT_FRAME_TABLE_OPENED == TRUE
        .if F_INIT_SCRIPT_FRAME_TABLE_CLOSED == FALSE
            .error "must close InitScriptEntry_OnFrameTable with InitScriptFrameTableEnd before InitScriptEnd"
        .endif
    .endif
    .balign 4, 0
    .endm

	.endif ; ASM_SCRIPT_INC
