#ifndef POKEHEARTGOLD_CONSTANTS_INIT_SCRIPT_TYPE_H
#define POKEHEARTGOLD_CONSTANTS_INIT_SCRIPT_TYPE_H

/*
    Init Script Types
    These constants describe types of non-event scripts which are defined for a particular map.
    Each map has at most one script of each type, other than ON_FRAME_TABLE.
    To see where each script type is run, look for calls to FieldSystem_RunInitScript.
*/

/*
    Init Script Type: INIT_SCRIPT_ON_FRAME_TABLE
    Before each frame of input processing, a table of conditions for the map is checked.
    Runs the first script where its two condition variables are equal.
    Therefore, any script invoked this way must at some point make its own condition false.
    The first check only occurs after all other init script types have run.
*/
#define INIT_SCRIPT_ON_FRAME_TABLE 1

/*
    Init Script Type: INIT_SCRIPT_ON_TRANSITION
    Runs upon first entering a map, including when starting a new game or loading a save.
    Runs before all other init script types, including ON_FRAME_TABLE.
    Primary roles: modify object events, manage persisted map features
*/
#define INIT_SCRIPT_ON_TRANSITION 2

/*
    Init Script Type: INIT_SCRIPT_ON_RESUME
    Runs after the map has been fully loaded and drawn.
    Can run again without leaving the map, e.g., when using a field move or item.
    Primary roles: hide the player, modify object events
*/
#define INIT_SCRIPT_ON_RESUME 3

/*
    Init Script Type: INIT_SCRIPT_ON_LOAD
    Runs after the map layout is loaded (but not drawn yet).
    Can run again without leaving the map, e.g., when using a field move or item.
    Primary roles: modify warp events, set/unset flags tied to object events
*/
#define INIT_SCRIPT_ON_LOAD 4

#endif // POKEHEARTGOLD_CONSTANTS_INIT_SCRIPT_TYPE_H
