#include "global.h"
#include "heap.h"
#include "math_util.h"
#include "voltorb_flip/voltorb_flip.h"
#include "voltorb_flip/voltorb_flip_data.h"
#include "voltorb_flip/voltorb_flip_game.h"

static void AddRoundSummary(GameState *);
static RoundSummary *PrevRoundSummary(GameState *);
static int CardValue(CardType);
static int CalcNextLevel(GameState *);
static void SelectBoardId(GameState *);
static void CountPointsInRowCols(GameState *);
static void CountVoltorbsInRowCols(GameState *);
static void CalcBoardMaxPayout(GameState *);
static void CountMultiplierCards(GameState *);
static void PlaceCardsOnBoard(GameState *, CardType, int, int);
static BOOL RetryBoardGen(GameState *);
static void GenerateBoard(GameState *);
static Card *GetCard(GameState *, int);

extern const u8 sBoardIdDistribution[8][80];
extern const BoardConfig sBoardConfigs[80];

GameState *CreateGameState(HeapID heapId) {
    GameState *ptr = AllocFromHeap(heapId, sizeof(GameState));
    MI_CpuFill8(ptr, 0, sizeof(GameState));
    return ptr;
}

void FreeGameState(GameState *game) {
    FreeToHeap(game);
}

void NewBoard(GameState *game) {
    SelectBoardId(game);
    GenerateBoard(game);
    CountPointsInRowCols(game);
    CalcBoardMaxPayout(game);
    CountMultiplierCards(game);
}

void ov122_021E8528(GameState *game) {
    int i;
    RoundSummary temp[5];

    AddRoundSummary(game);

    for (i = 0; i < 5; i++) {
        temp[i] = game->boardHistory[i];
    }
    int head = game->historyHead;

    MI_CpuFill8(game, 0, sizeof(GameState));

    for (i = 0; i < 5; i++) {
        game->boardHistory[i] = temp[i];
    }
    game->historyHead = head;
}

void SetRoundOutcome(GameState *game, RoundOutcome outcome) {
    game->roundOutcome = outcome;
}

void MultiplyPayoutAndUpdateCardsFlipped(GameState *game, CardType type) {
    u32 value = CardValue(type);

    GF_ASSERT(value < 4);
    if (value == 0) {
        GF_ASSERT(FALSE);
        return;
    }

    game->cardsFlipped++;
    if ((u32)(type - 2) <= 1) {
        game->multipliersFlipped++;
    }

    int payout = game->payout;
    if (payout == 0) {
        game->payout = value;
        return;
    }

    int newPayout = payout * value;
    if (newPayout > 50000) {
        newPayout = 50000;
    }
    game->payout = newPayout;
}

void FlipCard(GameState *game, CardID cardId) {
    Card *card = GetCard(game, cardId);
    GF_ASSERT(card->flipped == FALSE);

    card->flipped = TRUE;
    card->memo = 0;
}

// Returns TRUE if some amount was deducted.
BOOL DeductFromPayout(GameState *game, u8 amount) {
    int payout = game->payout;
    if (payout != 0) {
        int newPayout = payout - amount;
        if (newPayout < 0) {
            newPayout = 0;
        }
        game->payout = newPayout;
        return TRUE;
    }
    return FALSE;
}

BOOL IsCardFlipped(GameState *game, CardID cardId) {
    Card *card = GetCard(game, cardId);
    return card->flipped;
}

BOOL EarnedMaxPayout(GameState *game) {
    GF_ASSERT(game->payout <= game->maxPayout);

    return game->payout == game->maxPayout;
}

CardType GetCardType(GameState *game, CardID cardId) {
    Card *card = GetCard(game, cardId);
    return card->type;
}

int IsCardMemoFlagOn(GameState *game, CardID cardId, int memoFlag) {
    Card *card = GetCard(game, cardId);
    int cardMemoFlag = card->memo & memoFlag;
    if (cardMemoFlag == memoFlag) {
        return 1;
    }
    return 0;
}

void ToggleCardMemo(GameState *game, CardID cardId, int memoFlag) {
    Card *card = GetCard(game, cardId);
    int var2 = card->memo;
    if (var2 & memoFlag) {
        card->memo -= memoFlag;
        return;
    }
    card->memo |= memoFlag;
}

int PointsAlongAxis(GameState *game, Axis axis, u8 i) {
    GF_ASSERT(i < 5);

    switch (axis) {
    case AXIS_COL:
        return game->pointsPerCol[i];
    case AXIS_ROW:
        return game->pointsPerRow[i];
    default:
        GF_ASSERT(FALSE);
    }
    return 0;
}

int VoltorbsAlongAxis(GameState *game, Axis axis, u8 i) {
    GF_ASSERT(i < 5);

    switch (axis) {
    case AXIS_COL:
        return game->voltorbsPerCol[i];
    case AXIS_ROW:
        return game->voltorbsPerRow[i];
    default:
        GF_ASSERT(FALSE);
    }
    return 0;
}

int FlippedCardsAlongAxis(GameState *game, Axis axis, u8 i) {
    u8 count = 0;

    switch (axis) {
    case AXIS_COL:
        for (int j = 0; j < 5; j++) {
            if (game->cards[j][i].flipped) {
                count++;
            }
        }
        break;
    case AXIS_ROW:
        for (int j = 0; j < 5; j++) {
            if (game->cards[i][j].flipped) {
                count++;
            }
        }
        break;
    default:
        GF_ASSERT(FALSE);
    }
    return count;
}

u16 GamePayout(GameState *game) {
    return game->payout;
}

u8 MultiplierCards(GameState *game) {
    return game->multiplierCards;
}

u8 MultiplierCardsFlipped(GameState *game) {
    return game->multipliersFlipped;
}

u8 GameLevel(GameState *game) {
    return game->level;
}

// Levels gained (as viewed in display).
int LevelsGained(GameState *game) {
    RoundSummary *round = PrevRoundSummary(game);
    return round->level - game->level;
}

static void AddRoundSummary(GameState *game) {
    GF_ASSERT(game->historyHead < 5);

    RoundSummary *round = &game->boardHistory[game->historyHead];
    round->roundOutcome = game->roundOutcome;
    round->cardsFlipped = game->cardsFlipped;
    round->boardId = game->boardId;
    round->level = game->level;

    game->historyHead = (game->historyHead + 1) % 5;
}

static RoundSummary *PrevRoundSummary(GameState *game) {
    int idx;

    int head = game->historyHead;
    if (head == 0) {
        idx = 4;
    } else {
        idx = head - 1;
    }

    return &game->boardHistory[idx];
}

static int CardValue(CardType type) {
    switch (type) {
    case CARD_TYPE_ONE:
        return 1;
    case CARD_TYPE_TWO:
        return 2;
    case CARD_TYPE_THREE:
        return 3;
    default:
        return 0;
    }
}

// True if the boardId corresponds to at least level `level`.
#define LEVEL_AT_LEAST(boardId, level) (boardId >= 10 * (level - 1))

static int CalcNextLevel(GameState *game) {
    int i;
    u32 boardId;
    RoundOutcome roundOutcome;

    RoundSummary *prevRound = PrevRoundSummary(game);
    roundOutcome = prevRound->roundOutcome;

    if (roundOutcome == ROUND_OUTCOME_WON && LEVEL_AT_LEAST(prevRound->boardId, 8)) {
        return 0; // Lv. 8
    }

    boardId = prevRound->boardId;
    // You can reach Lv. 8 if you're at Lv. 5 or higher now and if in each of
    // the last 5 rounds you:
    //  - Did not lose
    //  - Flipped at least 8 cards
    if (LEVEL_AT_LEAST(boardId, 5)) {
        for (i = 0; i < 5; i++) {
            RoundSummary *round = &game->boardHistory[i];
            if (round->cardsFlipped < 8 || round->roundOutcome == ROUND_OUTCOME_LOST) {
                break;
            }
        }
        if (i == 5) {
            return 0; // Lv. 8
        }
    }

    if ((LEVEL_AT_LEAST(boardId, 7) && prevRound->cardsFlipped >= 7) || (LEVEL_AT_LEAST(boardId, 6) && roundOutcome == ROUND_OUTCOME_WON)) {
        return 1; // Lv. 7
    }
    if ((LEVEL_AT_LEAST(boardId, 6) && prevRound->cardsFlipped >= 6) || (LEVEL_AT_LEAST(boardId, 5) && roundOutcome == ROUND_OUTCOME_WON)) {
        return 2; // Lv. 6
    }
    if ((LEVEL_AT_LEAST(boardId, 5) && prevRound->cardsFlipped >= 5) || (LEVEL_AT_LEAST(boardId, 4) && roundOutcome == ROUND_OUTCOME_WON)) {
        return 3; // Lv. 5
    }
    if ((LEVEL_AT_LEAST(boardId, 4) && prevRound->cardsFlipped >= 4) || (LEVEL_AT_LEAST(boardId, 3) && roundOutcome == ROUND_OUTCOME_WON)) {
        return 4; // Lv. 4
    }
    if ((LEVEL_AT_LEAST(boardId, 3) && prevRound->cardsFlipped >= 3) || (LEVEL_AT_LEAST(boardId, 2) && roundOutcome == ROUND_OUTCOME_WON)) {
        return 5; // Lv. 3
    }
    if ((LEVEL_AT_LEAST(boardId, 2) && prevRound->cardsFlipped >= 2) || (roundOutcome == ROUND_OUTCOME_WON)) {
        return 6; // Lv. 2
    }
    return 7; // Lv. 1
}

static void SelectBoardId(GameState *game) {
    int i;

    int rand = (u32)MTRandom() % 100;
    int level = CalcNextLevel(game);
    GF_ASSERT(level < 8);

    for (i = 0; i < 80; i++) {
        if (rand < sBoardIdDistribution[level][i]) {
            break;
        }
        GF_ASSERT(i < 80);
    }
    game->level = level;
    game->boardId = i;
}

static void CountPointsInRowCols(GameState *game) {
    int r;
    int c;

    for (r = 0; r < 5; r++) {
        game->pointsPerRow[r] = 0;
        for (c = 0; c < 5; c++) {
            game->pointsPerRow[r] += CardValue(game->cards[r][c].type);
        }
    }

    for (r = 0; r < 5; r++) {
        game->pointsPerCol[r] = 0;
        for (c = 0; c < 5; c++) {
            game->pointsPerCol[r] += CardValue(game->cards[c][r].type);
        }
    }
}

static void CountVoltorbsInRowCols(GameState *game) {
    int r;
    int c;

    for (r = 0; r < 5; r++) {
        game->voltorbsPerRow[r] = 0;
        for (c = 0; c < 5; c++) {
            if (game->cards[r][c].type == CARD_TYPE_VOLTORB) {
                game->voltorbsPerRow[r]++;
            }
        }
    }

    for (c = 0; c < 5; c++) {
        game->voltorbsPerCol[c] = 0;
        for (r = 0; r < 5; r++) {
            if (game->cards[r][c].type == CARD_TYPE_VOLTORB) {
                game->voltorbsPerCol[c]++;
            }
        }
    }
}

static void CalcBoardMaxPayout(GameState *game) {
    int i;
    int var1 = 1;

    for (i = 0; i < 25; i++) {
        Card *card = GetCard(game, (u8)i);
        GF_ASSERT(card->type != CARD_TYPE_NONE);
        if (card->type != CARD_TYPE_VOLTORB) {
            var1 *= CardValue(card->type);
        }
    }

    if (var1 > 50000) {
        var1 = 50000;
    }
    game->maxPayout = var1;
}

static void CountMultiplierCards(GameState *game) {
    for (int i = 0; i < 25; i++) {
        Card *card = GetCard(game, (u8)i);
        GF_ASSERT(card->type != CARD_TYPE_NONE);

        if (IS_MULTIPLIER_CARD(card->type)) {
            game->multiplierCards++;
        }
    }
}

static void PlaceCardsOnBoard(GameState *game, CardType type, int n, BOOL isNot1Card) {
    u8 cardId;
    int attempts = 0;

    int i = 0;
    while (i < n) {
        if (isNot1Card) {
            cardId = (u32)MTRandom() % 25;
        } else {
            cardId = i;
        }
        Card *card = GetCard(game, cardId);
        if (card->type == CARD_TYPE_ONE || !isNot1Card) {
            card->type = type;
        } else {
            // If you can't place the tile on the board within 100 attempts,
            // skip it.
            attempts++;
            if (attempts >= 100) {
                break;
            }

            i--;
        }
        i++;
    }
}

static BOOL RetryBoardGen(GameState *game) {
    int i;
    const BoardConfig *config;

    u8 freeMultipliersPerCol[5] = {0};
    u8 freeMultipliersPerRow[5] = {0};

    // Multiplier cards (x2 and x3) that you can get at no risk of detonating a
    // Voltorb.
    u8 freeMultipliers = 0;

    config = &sBoardConfigs[game->boardId];

    for (i = 0; i < 25; i++) {
        Card *card = GetCard(game, (u8)i);
        if (IS_MULTIPLIER_CARD(card->type)) {
            int col = i % 5;
            int row = i / 5;
            int voltorbsInCol = VoltorbsAlongAxis(game, AXIS_COL, col);
            int voltorbsInRow = VoltorbsAlongAxis(game, AXIS_ROW, row);
            if (voltorbsInRow == 0 || voltorbsInCol == 0) {
                freeMultipliersPerCol[col]++;
                freeMultipliersPerRow[row]++;
                freeMultipliers++;
            }
        }
    }

    if (config->maxFreeMultipliers <= freeMultipliers) {
        return TRUE;
    }

    for (i = 0; i < 5; i++) {
        if (config->maxFreeMultipliersPerRowCol <= freeMultipliersPerCol[i] ||
            config->maxFreeMultipliersPerRowCol <= freeMultipliersPerRow[i]) {
            return TRUE;
        }
    }

    return FALSE;
}

static void GenerateBoard(GameState *game) {
    GF_ASSERT(game->boardId < 80);

    int voltorbs = sBoardConfigs[game->boardId].voltorbs;
    int twos = sBoardConfigs[game->boardId].twos;
    int threes = sBoardConfigs[game->boardId].threes;

    for (int i = 0; i < 1000; i++) {
        PlaceCardsOnBoard(game, CARD_TYPE_ONE, 25, FALSE);
        PlaceCardsOnBoard(game, CARD_TYPE_VOLTORB, voltorbs, TRUE);
        PlaceCardsOnBoard(game, CARD_TYPE_TWO, twos, TRUE);
        PlaceCardsOnBoard(game, CARD_TYPE_THREE, threes, TRUE);
        CountVoltorbsInRowCols(game);

        if (!RetryBoardGen(game)) {
            break;
        }
    }
}

static Card *GetCard(GameState *game, CardID cardId) {
    GF_ASSERT((u32)cardId < 25);

    u8 row = cardId / 5;
    u8 col = cardId % 5;
    GF_ASSERT(row < 5);
    GF_ASSERT(col < 5);

    return &game->cards[row][col];
}
