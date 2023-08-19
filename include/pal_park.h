#ifndef POKEHEARTGOLD_PAL_PARK_H
#define POKEHEARTGOLD_PAL_PARK_H

#include "script.h"
#include "unk_0202EB30.h"
#include "battle_setup.h"

// Resets the Pal Park state. fsys is unused.
// Called when entering the park game, right
// after the countdown finishes.
void PalPark_ClearState(FieldSystem *fsys);

// Initializes where your migrated Pokemon will spawn, and starts the timer.
// Called on entry into Pal Park.
void PalPark_InitFromSave(FieldSystem *fsys);

// Calculates how long you've been in Pal Park.
// Called when returning to the gate from the park.
void PalPark_StopClock(FieldSystem *fsys);

// Your species score is the sum of point values ascribed to each species.
// See files/arc/ppark.json for the point values of each.
int PalPark_CalcSpeciesScore(FieldSystem *fsys);

// There is a soft time limit of 1000 seconds.
// If you catch all 6 Pokemon within that time,
// you earn 2 points per second left on the clock.
int PalPark_CalcTimeScore(FieldSystem *fsys);

// This is computed in two phases.
// First, the types of each Pokemon you caught are compared
// to the types of the Pokemon caught immediately prior inside
// the park. You earn 200 points if none of them match.
// Second, you earn an extra 50 points for each unique type
// among the Pokemon caught.
u32 PalPark_CalcTypesScore(FieldSystem *fsys);

// Determines whether to generate an encounter on the
// current step. x and z are the player's coordinates.
// Returns TRUE if an encounter is chosen, FALSE otherwise.
// When you enter the park, a random number is rolled
// from the LCRNG between 5 and 14 inclusive, and stored
// in a counter variable. When this function is called,
// if decrementing this counter would make it 0, a new
// number is rolled and an encounter is tried.
// From here, the function surveys the remaining Pokemon
// yet to be caught. If they appear in the current area,
// their encounter chance is appended to a list of
// buckets. If the resulting list is empty, no encounter
// takes place. Otherwise, a no-encounter bucket with weight
// 20 is appended to the list, and a bucket is chosen at
// random (LCRNG) based on the cumulative weights.
// If the chosen bucket corresponds to a Pokemon, it will
// be encountered.
BOOL PalPark_TryEncounter(FieldSystem* fsys, int x, int z);

// Called if PalPark_TryEncounter succeeds. Loads the
// migrated Pokemon as the opponent and sets the Pal Park
// state.
BATTLE_SETUP* PalPark_SetupEncounter(FieldSystem* fsys);

// Called on return from the battle. Action is based on
// whether the player caught the Pokemon or fled from it.
// Other outcomes are unexpected and trip an assert.
void PalPark_HandleBattleEnd(FieldSystem *fsys, BATTLE_SETUP *setup);

// Determines how many of the Pokemon in Pal Park were not
// caught.
int PalPark_CountMonsNotCaught(FieldSystem *fsys);

#endif //POKEHEARTGOLD_PAL_PARK_H
