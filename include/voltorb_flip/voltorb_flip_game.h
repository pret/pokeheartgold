#ifndef POKEHEARTGOLD_VOLTORB_FLIP_GAME_H
#define POKEHEARTGOLD_VOLTORB_FLIP_GAME_H

#include "heap.h"

typedef enum CardType {
    CARD_TYPE_NONE,
    CARD_TYPE_ONE,
    CARD_TYPE_TWO,
    CARD_TYPE_THREE,
    CARD_TYPE_VOLTORB,
} CardType;

// A x2 or x3 card (since the card types are stored as unsigned ints)
#define IS_MULTIPLIER_CARD(type) ((u32)(type - 2) <= 1)
#define IS_NOT_ONE_CARD(type)    (type > 1)

// Card ID's
// ========================
// [00]-[01]-[02]-[03]-[04]
//  |    |    |    |    |
// [05]-[06]-[07]-[08]-[09]
//  |    |    |    |    |
// [10]-[11]-[12]-[13]-[14]
//  |    |    |    |    |
// [15]-[16]-[17]-[18]-[19]
//  |    |    |    |    |
// [20]-[21]-[22]-[23]-[24]
typedef int CardID;

typedef enum Axis {
    AXIS_COL,
    AXIS_ROW,
} Axis;

typedef enum RoundOutcome {
    ROUND_OUTCOME_NONE,
    ROUND_OUTCOME_QUIT,
    ROUND_OUTCOME_WON,
    ROUND_OUTCOME_LOST,
} RoundOutcome;

// Internally, levels are encoded in descending order:
//
// | Internal | Display |
// | level    | level   |
// |----------|---------|
// |        7 |       1 |
// |        6 |       2 |
// |        5 |       3 |
// |        4 |       4 |
// |        3 |       5 |
// |        2 |       6 |
// |        1 |       7 |
// |        0 |       8 |
typedef u8 Level;

typedef struct Card {
    CardType type;
    int memo;
    BOOL flipped;
} Card;

typedef struct RoundSummary {
    RoundOutcome roundOutcome;
    u8 cardsFlipped;
    u8 boardId;
    Level level;
} RoundSummary;

typedef struct GameState {
    Card cards[5][5];
    u8 pointsPerCol[5];
    u8 pointsPerRow[5];
    u8 voltorbsPerCol[5];
    u8 voltorbsPerRow[5];
    RoundOutcome roundOutcome;
    u16 payout;
    u16 maxPayout;
    u16 multiplierCards; // number of x2 and x3 cards on board
    u16 multipliersFlipped;
    u8 cardsFlipped;
    u8 boardId;
    Level level;
    u8 historyHead; // index of current game in `boardHistory`
    u8 unk150[0x4];
    RoundSummary boardHistory[5];
} GameState;

// This structure specifies the number of Voltorbs, x2, and x3 cards in the
// round and defines restrictions on the boards that can be generated.
//
// The restrictions limit the number of 'free' multiplier (x2 and x3) cards.
// These are cards in a row or column without Voltorbs, meaning you can obtain
// them without incurring risk.
typedef struct BoardConfig {
    u8 voltorbs;
    u8 twos;
    u8 threes;
    // The maximum number of 'free' multipliers that can appear in any one row
    // or column.
    u8 maxFreeMultipliersPerRowCol : 4;
    // The maximum number of 'free' multipliers that can appear on the whole
    // board.
    u8 maxFreeMultipliers : 4;
} BoardConfig;

GameState *CreateGameState(HeapID);
void FreeGameState(GameState *);
void NewBoard(GameState *);
void ov122_021E8528(GameState *);
void SetRoundOutcome(GameState *, RoundOutcome);
void MultiplyPayoutAndUpdateCardsFlipped(GameState *, CardType);
void FlipCard(GameState *, int);
BOOL DeductFromPayout(GameState *, u8);
BOOL IsCardFlipped(GameState *, int);
BOOL EarnedMaxPayout(GameState *);
CardType GetCardType(GameState *, int);
int IsCardMemoFlagOn(GameState *, int, int);
void ToggleCardMemo(GameState *, int, int);
int PointsAlongAxis(GameState *, Axis, u8);
int VoltorbsAlongAxis(GameState *, Axis, u8);
int FlippedCardsAlongAxis(GameState *, Axis, u8);
u16 GamePayout(GameState *);
u8 MultiplierCards(GameState *);
u8 MultiplierCardsFlipped(GameState *);
u8 GameLevel(GameState *);
int LevelsGained(GameState *);

#endif // POKEHEARTGOLD_VOLTORB_FLIP_GAME_H
