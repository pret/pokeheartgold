// Copyright (c) 2021-2024 red031000

#include "global.h"
#include "cJSON.h"
#include "json.h"
#include "util.h"
#include <string.h>
#include <stdlib.h>

static inline bool GetBool(cJSON * in)
{
    if (!cJSON_IsBool(in))
        return false;

    return cJSON_IsTrue(in);
}

static inline int GetInt(cJSON * in)
{
    if (!cJSON_IsNumber(in))
        return 0;

    return in->valueint;
}

static inline char *GetString(cJSON * in)
{
    if (!cJSON_IsString(in))
        return NULL;

    return in->valuestring;
}

struct JsonToCellOptions *ParseNCERJson(char *path)
{
    int fileLength;
    unsigned char *jsonString = ReadWholeFile(path, &fileLength);

    cJSON *json = cJSON_Parse((const char *)jsonString);

    struct JsonToCellOptions *options = malloc(sizeof(struct JsonToCellOptions));

    if (json == NULL)
    {
        const char *errorPtr = cJSON_GetErrorPtr();
        FATAL_ERROR("Error in line \"%s\"\n", errorPtr);
    }

    cJSON *labelBool = cJSON_GetObjectItemCaseSensitive(json, "labelEnabled");
    cJSON *vramTransferBool = cJSON_GetObjectItemCaseSensitive(json, "vramTransferEnabled");
    cJSON *extended = cJSON_GetObjectItemCaseSensitive(json, "extended");
    cJSON *cellCount = cJSON_GetObjectItemCaseSensitive(json, "cellCount");
    cJSON *mappingType = cJSON_GetObjectItemCaseSensitive(json, "mappingType");

    options->labelEnabled = GetBool(labelBool);
    options->vramTransferEnabled = GetBool(vramTransferBool);
    options->extended = GetBool(extended);
    options->cellCount = GetInt(cellCount);
    options->mappingType = GetInt(mappingType);

    options->cells = malloc(sizeof(struct Cell *) * options->cellCount);

    if (options->labelEnabled)
    {
        cJSON *labelCount = cJSON_GetObjectItemCaseSensitive(json, "labelCount");
        options->labelCount = GetInt(labelCount);
        options->labels = malloc(sizeof(char *) * options->labelCount);

        cJSON *labels = cJSON_GetObjectItemCaseSensitive(json, "labels");
        cJSON *label = NULL;

        int j = 0;
        cJSON_ArrayForEach(label, labels)
        {
            char *labelString = GetString(label);
            options->labels[j] = malloc(strlen(labelString) + 1);
            strcpy(options->labels[j], labelString);
            j++;
        }
    }

    if (options->vramTransferEnabled) {
        cJSON *vramTransferMaxSize = cJSON_GetObjectItemCaseSensitive(json, "vramTransferMaxSize");
        options->vramTransferMaxSize = GetInt(vramTransferMaxSize);

        options->transferData = malloc(sizeof(struct CellVramTransferData *) * options->cellCount);

        cJSON *transfers = cJSON_GetObjectItemCaseSensitive(json, "transferData");
        cJSON *transfer = NULL;

        int j = 0;
        cJSON_ArrayForEach(transfer, transfers) {
            cJSON *vramTransferOffset = cJSON_GetObjectItemCaseSensitive(transfer, "offset");
            cJSON *vramTransferSize = cJSON_GetObjectItemCaseSensitive(transfer, "size");

            options->transferData[j] = malloc(sizeof(struct CellVramTransferData));
            options->transferData[j]->sourceDataOffset = GetInt(vramTransferOffset);
            options->transferData[j]->size = GetInt(vramTransferSize);

            j++;
        }
    }

    for (int i = 0; i < options->cellCount; i++)
    {
        options->cells[i] = malloc(sizeof(struct Cell));
    }

    int i = 0;
    cJSON *cells = cJSON_GetObjectItemCaseSensitive(json, "cells");
    cJSON *cell = NULL;

    cJSON_ArrayForEach(cell, cells)
    {
        if (i > options->cellCount - 1)
            FATAL_ERROR("Cell count is incorrect.\n");

        cJSON *cellAttrs = cJSON_GetObjectItemCaseSensitive(cell, "cellAttrs");

        cJSON *hFlip = cJSON_GetObjectItemCaseSensitive(cellAttrs, "hFlip");
        cJSON *vFlip = cJSON_GetObjectItemCaseSensitive(cellAttrs, "vFlip");
        cJSON *hvFlip = cJSON_GetObjectItemCaseSensitive(cellAttrs, "hvFlip");

        options->cells[i]->attributes.hFlip = GetBool(hFlip);
        options->cells[i]->attributes.vFlip = GetBool(vFlip);
        options->cells[i]->attributes.hvFlip = GetBool(hvFlip);

        cJSON *boundingRect = cJSON_GetObjectItemCaseSensitive(cellAttrs, "boundingRect");

        options->cells[i]->attributes.boundingRect = GetBool(boundingRect);

        cJSON *boundingSphereRadius = cJSON_GetObjectItemCaseSensitive(cellAttrs, "boundingSphereRadius");

        options->cells[i]->attributes.boundingSphereRadius = GetInt(boundingSphereRadius);

        if (options->extended)
        {
            cJSON *maxX = cJSON_GetObjectItemCaseSensitive(cell, "maxX");
            cJSON *maxY = cJSON_GetObjectItemCaseSensitive(cell, "maxY");
            cJSON *minX = cJSON_GetObjectItemCaseSensitive(cell, "minX");
            cJSON *minY = cJSON_GetObjectItemCaseSensitive(cell, "minY");

            options->cells[i]->maxX = (short)GetInt(maxX);
            options->cells[i]->maxY = (short)GetInt(maxY);
            options->cells[i]->minX = (short)GetInt(minX);
            options->cells[i]->minY = (short)GetInt(minY);
        }
        //OAM data
        cJSON *oamCount = cJSON_GetObjectItemCaseSensitive(cell, "oamCount");

        options->cells[i]->oamCount = (short)GetInt(oamCount);
        options->cells[i]->oam = malloc(sizeof(struct OAM) * options->cells[i]->oamCount);

        cJSON *OAMArray = cJSON_GetObjectItemCaseSensitive(cell, "OAM");
        cJSON *OAM = NULL;

        int j = 0;

        cJSON_ArrayForEach(OAM, OAMArray)
        {
            if (j > options->cells[i]->oamCount - 1)
                FATAL_ERROR("OAM count is incorrect.\n");

            //Attr0
            cJSON *Attr0 = cJSON_GetObjectItemCaseSensitive(OAM, "Attr0");

            cJSON *YCoordinate = cJSON_GetObjectItemCaseSensitive(Attr0, "YCoordinate");
            cJSON *Rotation = cJSON_GetObjectItemCaseSensitive(Attr0, "Rotation");
            cJSON *SizeDisable = cJSON_GetObjectItemCaseSensitive(Attr0, "SizeDisable");
            cJSON *Mode = cJSON_GetObjectItemCaseSensitive(Attr0, "Mode");
            cJSON *Mosaic = cJSON_GetObjectItemCaseSensitive(Attr0, "Mosaic");
            cJSON *Colours = cJSON_GetObjectItemCaseSensitive(Attr0, "Colours");
            cJSON *Shape = cJSON_GetObjectItemCaseSensitive(Attr0, "Shape");

            options->cells[i]->oam[j].attr0.YCoordinate = GetInt(YCoordinate);
            options->cells[i]->oam[j].attr0.Rotation = GetBool(Rotation);
            options->cells[i]->oam[j].attr0.SizeDisable = GetBool(SizeDisable);
            options->cells[i]->oam[j].attr0.Mode = GetInt(Mode);
            options->cells[i]->oam[j].attr0.Mosaic = GetBool(Mosaic);
            options->cells[i]->oam[j].attr0.Colours = GetInt(Colours);
            options->cells[i]->oam[j].attr0.Shape = GetInt(Shape);

            //Attr1
            cJSON *Attr1 = cJSON_GetObjectItemCaseSensitive(OAM, "Attr1");

            cJSON *XCoordinate = cJSON_GetObjectItemCaseSensitive(Attr1, "XCoordinate");
            cJSON *RotationScaling = cJSON_GetObjectItemCaseSensitive(Attr1, "RotationScaling");
            cJSON *Size = cJSON_GetObjectItemCaseSensitive(Attr1, "Size");

            options->cells[i]->oam[j].attr1.XCoordinate = GetInt(XCoordinate);
            options->cells[i]->oam[j].attr1.RotationScaling = GetInt(RotationScaling);
            options->cells[i]->oam[j].attr1.Size = GetInt(Size);

            //Attr2
            cJSON *Attr2 = cJSON_GetObjectItemCaseSensitive(OAM, "Attr2");

            cJSON *CharName = cJSON_GetObjectItemCaseSensitive(Attr2, "CharName");
            cJSON *Priority = cJSON_GetObjectItemCaseSensitive(Attr2, "Priority");
            cJSON *Palette = cJSON_GetObjectItemCaseSensitive(Attr2, "Palette");

            options->cells[i]->oam[j].attr2.CharName = GetInt(CharName);
            options->cells[i]->oam[j].attr2.Priority = GetInt(Priority);
            options->cells[i]->oam[j].attr2.Palette = GetInt(Palette);

            j++;
        }

        i++;
    }

    cJSON_Delete(json);
    free(jsonString);
    return options;
}

char *GetNCERJson(struct JsonToCellOptions *options)
{
    cJSON *ncer = cJSON_CreateObject();

    cJSON_AddBoolToObject(ncer, "labelEnabled", options->labelEnabled);
    cJSON_AddBoolToObject(ncer, "extended", options->extended);
    cJSON_AddBoolToObject(ncer, "vramTransferEnabled", options->vramTransferEnabled);
    cJSON_AddNumberToObject(ncer, "cellCount", options->cellCount);
    cJSON_AddNumberToObject(ncer, "mappingType", options->mappingType);
    
    cJSON *cells = cJSON_AddArrayToObject(ncer, "cells");

    for (int i = 0; i < options->cellCount; i++)
    {
        cJSON *cell = cJSON_CreateObject();

        cJSON *cellAttrs = cJSON_AddObjectToObject(cell, "cellAttrs");

        cJSON_AddBoolToObject(cellAttrs, "hFlip", options->cells[i]->attributes.hFlip);
        cJSON_AddBoolToObject(cellAttrs, "vFlip", options->cells[i]->attributes.vFlip);
        cJSON_AddBoolToObject(cellAttrs, "hvFlip", options->cells[i]->attributes.hvFlip);
        cJSON_AddBoolToObject(cellAttrs, "boundingRect", options->cells[i]->attributes.boundingRect);
        cJSON_AddNumberToObject(cellAttrs, "boundingSphereRadius", options->cells[i]->attributes.boundingSphereRadius);

        if (options->extended)
        {
            cJSON_AddNumberToObject(cell, "maxX", options->cells[i]->maxX);
            cJSON_AddNumberToObject(cell, "maxY", options->cells[i]->maxY);
            cJSON_AddNumberToObject(cell, "minX", options->cells[i]->minX);
            cJSON_AddNumberToObject(cell, "minY", options->cells[i]->minY);
        }

        cJSON_AddNumberToObject(cell, "oamCount", options->cells[i]->oamCount);

        cJSON *OAMArray = cJSON_AddArrayToObject(cell, "OAM");

        for (int j = 0; j < options->cells[i]->oamCount; j++)
        {
            cJSON *OAM = cJSON_CreateObject();

            cJSON *Attr0 = cJSON_AddObjectToObject(OAM, "Attr0");

            cJSON_AddNumberToObject(Attr0, "YCoordinate", options->cells[i]->oam[j].attr0.YCoordinate);
            cJSON_AddBoolToObject(Attr0, "Rotation", options->cells[i]->oam[j].attr0.Rotation);
            cJSON_AddBoolToObject(Attr0, "SizeDisable", options->cells[i]->oam[j].attr0.SizeDisable);
            cJSON_AddNumberToObject(Attr0, "Mode", options->cells[i]->oam[j].attr0.Mode);
            cJSON_AddBoolToObject(Attr0, "Mosaic", options->cells[i]->oam[j].attr0.Mosaic);
            cJSON_AddNumberToObject(Attr0, "Colours", options->cells[i]->oam[j].attr0.Colours);
            cJSON_AddNumberToObject(Attr0, "Shape", options->cells[i]->oam[j].attr0.Shape);

            cJSON *Attr1 = cJSON_AddObjectToObject(OAM, "Attr1");

            cJSON_AddNumberToObject(Attr1, "XCoordinate", options->cells[i]->oam[j].attr1.XCoordinate);
            cJSON_AddNumberToObject(Attr1, "RotationScaling", options->cells[i]->oam[j].attr1.RotationScaling);
            cJSON_AddNumberToObject(Attr1, "Size", options->cells[i]->oam[j].attr1.Size);

            cJSON *Attr2 = cJSON_AddObjectToObject(OAM, "Attr2");

            cJSON_AddNumberToObject(Attr2, "CharName", options->cells[i]->oam[j].attr2.CharName);
            cJSON_AddNumberToObject(Attr2, "Priority", options->cells[i]->oam[j].attr2.Priority);
            cJSON_AddNumberToObject(Attr2, "Palette", options->cells[i]->oam[j].attr2.Palette);

            cJSON_AddItemToArray(OAMArray, OAM);
        }

        cJSON_AddItemToArray(cells, cell);
    }

    if (options->labelEnabled)
    {
        cJSON *labels = cJSON_CreateStringArray((const char * const*)options->labels, options->labelCount);
        cJSON_AddItemToObject(ncer, "labels", labels);
        cJSON_AddNumberToObject(ncer, "labelCount", options->labelCount);
    }

    if (options->vramTransferEnabled) {
        cJSON_AddNumberToObject(ncer, "vramTransferMaxSize", options->vramTransferMaxSize);
        cJSON *transfers = cJSON_AddArrayToObject(ncer, "transferData");

        for (int idx = 0; idx < options->cellCount; idx++) {
            cJSON *transfer = cJSON_CreateObject();
            cJSON_AddNumberToObject(transfer, "offset", options->transferData[idx]->sourceDataOffset);
            cJSON_AddNumberToObject(transfer, "size", options->transferData[idx]->size);
            cJSON_AddItemToArray(transfers, transfer);
        }
    }

    char *jsonString = cJSON_Print(ncer);
    cJSON_Delete(ncer);
    return jsonString;
}

struct JsonToScreenOptions *ParseNSCRJson(char *path)
{
    int fileLength;
    unsigned char *jsonString = ReadWholeFile(path, &fileLength);

    cJSON *json = cJSON_Parse((const char *)jsonString);

    struct JsonToScreenOptions *options = malloc(sizeof(struct JsonToScreenOptions));

    if (json == NULL)
    {
        const char *errorPtr = cJSON_GetErrorPtr();
        FATAL_ERROR("Error in line \"%s\"\n", errorPtr);
    }

    cJSON *Height = cJSON_GetObjectItemCaseSensitive(json, "height");
    cJSON *Width = cJSON_GetObjectItemCaseSensitive(json, "width");

    options->height = GetInt(Height);
    options->width = GetInt(Width);

    options->data = malloc(sizeof(unsigned short) * options->height * options->width);

    cJSON *layer = NULL;
    cJSON *layers = cJSON_GetObjectItemCaseSensitive(json, "layers");
    int palette = 0;
    cJSON *tilesets = cJSON_GetObjectItemCaseSensitive(json, "tilesets");
    int tilesetSize = 0;
    if (cJSON_GetArraySize(tilesets) != 1)
    {
        cJSON *tileset = cJSON_GetArrayItem(tilesets, 1);
        cJSON *firstGid = cJSON_GetObjectItemCaseSensitive(tileset, "firstgid");
        tilesetSize = GetInt(firstGid) - 1;
        if (tilesetSize <= 1)
            FATAL_ERROR("Wrong tileset index (tileset 0 should be added first)\n");
    }

    cJSON_ArrayForEach(layer, layers)
    {
        cJSON *tile = NULL;
        cJSON *data = cJSON_GetObjectItemCaseSensitive(layer, "data");
        int i = 0;
        cJSON_ArrayForEach(tile, data)
        {
            int tileInt = GetInt(tile) - 1;
            if (tileInt != -1)
            {
                if (tilesetSize != 0)
                {
                    palette = tileInt / tilesetSize;
                    tileInt %= tilesetSize;
                }
                bool vFlip = tileInt >> 30;
                bool hFlip = tileInt >> 31;
                tileInt |= vFlip << 11;
                tileInt |= hFlip << 10;
                tileInt |= palette << 12;
                options->data[i] = (short) (tileInt & 0xFFFF);
            }
            i++;
        }
    }

    cJSON_Delete(json);
    free(jsonString);
    return options;
}

struct JsonToAnimationOptions *ParseNANRJson(char *path)
{
    int filelength;
    unsigned char *jsonString = ReadWholeFile(path, &filelength);

    cJSON *json = cJSON_Parse((const char *)jsonString);

    struct JsonToAnimationOptions *options = malloc(sizeof(struct JsonToAnimationOptions));

    if (json == NULL)
    {
        const char *errorPtr = cJSON_GetErrorPtr();
        FATAL_ERROR("Error in line \"%s\"\n", errorPtr);
    }

    cJSON *sequenceCount = cJSON_GetObjectItemCaseSensitive(json, "sequenceCount");
    cJSON *frameCount = cJSON_GetObjectItemCaseSensitive(json, "frameCount");

    options->sequenceCount = GetInt(sequenceCount);
    options->frameCount = GetInt(frameCount);

    options->sequenceData = malloc(sizeof(struct SequenceData *) * options->sequenceCount);

    int i;
    for (i = 0; i < options->sequenceCount; i++)
    {
        options->sequenceData[i] = malloc(sizeof(struct SequenceData));
    }

    cJSON *sequence = NULL;
    cJSON *sequences = cJSON_GetObjectItemCaseSensitive(json, "sequences");

    i = 0;
    cJSON_ArrayForEach(sequence, sequences)
    {
        if (i > options->sequenceCount - 1)
            FATAL_ERROR("Sequence count is incorrect.\n");

        cJSON *frameCount = cJSON_GetObjectItemCaseSensitive(sequence, "frameCount");
        cJSON *loopStartFrame = cJSON_GetObjectItemCaseSensitive(sequence, "loopStartFrame");
        cJSON *animationElement = cJSON_GetObjectItemCaseSensitive(sequence, "animationElement");
        cJSON *animationType = cJSON_GetObjectItemCaseSensitive(sequence, "animationType");
        cJSON *playbackMode = cJSON_GetObjectItemCaseSensitive(sequence, "playbackMode");

        options->sequenceData[i]->frameCount = GetInt(frameCount);
        options->sequenceData[i]->loopStartFrame = GetInt(loopStartFrame);
        options->sequenceData[i]->animationElement = GetInt(animationElement);
        options->sequenceData[i]->animationType = GetInt(animationType);
        options->sequenceData[i]->playbackMode = GetInt(playbackMode);

        options->sequenceData[i]->frameData = malloc(sizeof(struct FrameData *) * options->sequenceData[i]->frameCount);
        int j;
        for (j = 0; j < options->sequenceData[i]->frameCount; j++)
        {
            options->sequenceData[i]->frameData[j] = malloc(sizeof(struct FrameData));
        }

        j = 0;
        cJSON *frame = NULL;
        cJSON *frameData = cJSON_GetObjectItemCaseSensitive(sequence, "frameData");

        cJSON_ArrayForEach(frame, frameData)
        {
            if (j > options->sequenceData[i]->frameCount - 1)
                FATAL_ERROR("Sequence frame count is incorrect.\n");

            cJSON *frameDelay = cJSON_GetObjectItemCaseSensitive(frame, "frameDelay");
            cJSON *resultId = cJSON_GetObjectItemCaseSensitive(frame, "resultId");

            options->sequenceData[i]->frameData[j]->frameDelay = GetInt(frameDelay);
            options->sequenceData[i]->frameData[j]->resultId = GetInt(resultId);

            j++;
        }

        i++;
    }

    //todo implement extended attributes

    cJSON *resultCount = cJSON_GetObjectItemCaseSensitive(json, "resultCount");

    options->resultCount = GetInt(resultCount);

    options->animationResults = malloc(sizeof(struct AnimationResults *) * options->resultCount);

    for (i = 0; i < options->resultCount; i++)
    {
        options->animationResults[i] = malloc(sizeof(struct AnimationResults));
    }

    i = 0;

    cJSON *animationResult = NULL;
    cJSON *animationResults = cJSON_GetObjectItemCaseSensitive(json, "animationResults");
    cJSON_ArrayForEach(animationResult, animationResults)
    {
        if (i > options->resultCount - 1)
            FATAL_ERROR("Frame count is incorrect.\n");

        cJSON *resultType = cJSON_GetObjectItemCaseSensitive(animationResult, "resultType");
        options->animationResults[i]->resultType = GetInt(resultType);
        switch (options->animationResults[i]->resultType) {
            case 0: { //index
                cJSON *index = cJSON_GetObjectItemCaseSensitive(animationResult, "index");
                options->animationResults[i]->index = GetInt(index);
                break;
            }

            case 1: { //SRT
                cJSON *index = cJSON_GetObjectItemCaseSensitive(animationResult, "index");
                cJSON *rotation = cJSON_GetObjectItemCaseSensitive(animationResult, "rotation");
                cJSON *scaleX = cJSON_GetObjectItemCaseSensitive(animationResult, "scaleX");
                cJSON *scaleY = cJSON_GetObjectItemCaseSensitive(animationResult, "scaleY");
                cJSON *positionX = cJSON_GetObjectItemCaseSensitive(animationResult, "positionX");
                cJSON *positionY = cJSON_GetObjectItemCaseSensitive(animationResult, "positionY");

                options->animationResults[i]->dataSrt.index = GetInt(index);
                options->animationResults[i]->dataSrt.rotation = GetInt(rotation);
                options->animationResults[i]->dataSrt.scaleX = GetInt(scaleX);
                options->animationResults[i]->dataSrt.scaleY = GetInt(scaleY);
                options->animationResults[i]->dataSrt.positionX = GetInt(positionX);
                options->animationResults[i]->dataSrt.positionY = GetInt(positionY);
                break;
            }

            case 2: { //T
                cJSON *index = cJSON_GetObjectItemCaseSensitive(animationResult, "index");
                //cJSON *rotation = cJSON_GetObjectItemCaseSensitive(animationResult, "rotation");
                cJSON *positionX = cJSON_GetObjectItemCaseSensitive(animationResult, "positionX");
                cJSON *positionY = cJSON_GetObjectItemCaseSensitive(animationResult, "positionY");

                options->animationResults[i]->dataT.index = GetInt(index);
                //options->animationResults[i]->dataSrt.rotation = GetInt(rotation);
                options->animationResults[i]->dataT.positionX = GetInt(positionX);
                options->animationResults[i]->dataT.positionY = GetInt(positionY);
                break;
            }
        }

        i++;
    }

    cJSON *labelBool = cJSON_GetObjectItemCaseSensitive(json, "labelEnabled");
    options->labelEnabled = GetBool(labelBool);

    if (options->labelEnabled)
    {
        cJSON *labelCount = cJSON_GetObjectItemCaseSensitive(json, "labelCount");
        options->labelCount = GetInt(labelCount);
        options->labels = malloc(sizeof(char *) * options->labelCount);

        cJSON *labels = cJSON_GetObjectItemCaseSensitive(json, "labels");
        cJSON *label = NULL;

        int j = 0;
        cJSON_ArrayForEach(label, labels)
        {
            char *labelString = GetString(label);
            options->labels[j] = malloc(strlen(labelString) + 1);
            strcpy(options->labels[j], labelString);
            j++;
        }
    }

    cJSON_Delete(json);
    free(jsonString);
    return options;
}

char *GetNANRJson(struct JsonToAnimationOptions *options)
{
    cJSON *nanr = cJSON_CreateObject();

    cJSON_AddBoolToObject(nanr, "labelEnabled", options->labelEnabled);
    cJSON_AddNumberToObject(nanr, "sequenceCount", options->sequenceCount);
    cJSON_AddNumberToObject(nanr, "frameCount", options->frameCount);

    cJSON *sequences = cJSON_AddArrayToObject(nanr, "sequences");

    for (int i = 0; i < options->sequenceCount; i++)
    {
        cJSON *sequence = cJSON_CreateObject();
        cJSON_AddNumberToObject(sequence, "frameCount", options->sequenceData[i]->frameCount);
        cJSON_AddNumberToObject(sequence, "loopStartFrame", options->sequenceData[i]->loopStartFrame);
        cJSON_AddNumberToObject(sequence, "animationElement", options->sequenceData[i]->animationElement);
        cJSON_AddNumberToObject(sequence, "animationType", options->sequenceData[i]->animationType);
        cJSON_AddNumberToObject(sequence, "playbackMode", options->sequenceData[i]->playbackMode);

        cJSON *frameData = cJSON_AddArrayToObject(sequence, "frameData");

        for (int j = 0; j < options->sequenceData[i]->frameCount; j++)
        {
            cJSON *frame = cJSON_CreateObject();
            cJSON_AddNumberToObject(frame, "frameDelay", options->sequenceData[i]->frameData[j]->frameDelay);
            cJSON_AddNumberToObject(frame, "resultId", options->sequenceData[i]->frameData[j]->resultId);
            cJSON_AddItemToArray(frameData, frame);
        }

        cJSON_AddItemToArray(sequences, sequence);
    }

    cJSON *animationResults = cJSON_AddArrayToObject(nanr, "animationResults");

    for (int i = 0; i < options->resultCount; i++)
    {
        cJSON *animationResult = cJSON_CreateObject();
        cJSON_AddNumberToObject(animationResult, "resultType", options->animationResults[i]->resultType);

        switch (options->animationResults[i]->resultType)
        {
            case 0: //index
                cJSON_AddNumberToObject(animationResult, "index", options->animationResults[i]->index);
                break;
            
            case 1: //SRT
                cJSON_AddNumberToObject(animationResult, "index", options->animationResults[i]->dataSrt.index);
                cJSON_AddNumberToObject(animationResult, "rotation", options->animationResults[i]->dataSrt.rotation);
                cJSON_AddNumberToObject(animationResult, "scaleX", options->animationResults[i]->dataSrt.scaleX);
                cJSON_AddNumberToObject(animationResult, "scaleY", options->animationResults[i]->dataSrt.scaleY);
                cJSON_AddNumberToObject(animationResult, "positionX", options->animationResults[i]->dataSrt.positionX);
                cJSON_AddNumberToObject(animationResult, "positionY", options->animationResults[i]->dataSrt.positionY);
                break;

            case 2: //T
                cJSON_AddNumberToObject(animationResult, "index", options->animationResults[i]->dataT.index);
                cJSON_AddNumberToObject(animationResult, "positionX", options->animationResults[i]->dataT.positionX);
                cJSON_AddNumberToObject(animationResult, "positionY", options->animationResults[i]->dataT.positionY);
                break;
        }

        cJSON_AddItemToArray(animationResults, animationResult);
    }

    cJSON_AddNumberToObject(nanr, "resultCount", options->resultCount);

    if (options->labelEnabled)
    {
        cJSON *labels = cJSON_CreateStringArray((const char * const*)options->labels, options->labelCount);
        cJSON_AddItemToObject(nanr, "labels", labels);

        cJSON_AddNumberToObject(nanr, "labelCount", options->labelCount);
    }

    char *jsonString = cJSON_Print(nanr);
    cJSON_Delete(nanr);
    return jsonString;
}

void FreeNCERCell(struct JsonToCellOptions *options)
{
    for (int i = 0; i < options->cellCount; i++)
    {
        free(options->cells[i]->oam);
        free(options->cells[i]);
    }
    if (options->labelEnabled)
    {
        for (int j = 0; j < options->labelCount; j++)
        {
            free(options->labels[j]);
        }
        free(options->labels);
    }
    if (options->vramTransferEnabled) {
        for (int j = 0; j < options->cellCount; j++) {
            free(options->transferData[j]);
        }
        free(options->transferData);
    }
    free(options->cells);
    free(options);
}

void FreeNSCRScreen(struct JsonToScreenOptions *options)
{
    free(options->data);
    free(options);
}


void FreeNANRAnimation(struct JsonToAnimationOptions *options)
{
    for (int i = 0; i < options->sequenceCount; i++)
    {
        for (int j = 0; j < options->sequenceData[i]->frameCount; j++)
        {
            free(options->sequenceData[i]->frameData[j]);
        }
        free(options->sequenceData[i]->frameData);
        free(options->sequenceData[i]);
    }
    for (int i = 0; i < options->resultCount; i++)
    {
        free(options->animationResults[i]);
    }
    if (options->labelEnabled)
    {
        for (int j = 0; j < options->labelCount; j++)
        {
            free(options->labels[j]);
        }
        free(options->labels);
    }
    free(options->sequenceData);
    free(options->animationResults);
    free(options);
}

char *GetNtrFontMetadataJson(struct NtrFontMetadata *metadata) {
    cJSON *json = cJSON_CreateObject();

    cJSON_AddNumberToObject(json, "maxGlyphWidth", metadata->maxWidth);
    cJSON_AddNumberToObject(json, "maxGlyphHeight", metadata->maxHeight);

    cJSON *glyphWidths = cJSON_AddArrayToObject(json, "glyphWidths");
    for (int i = 0; i < metadata->numGlyphs; i++) {
        cJSON *width = cJSON_CreateNumber(metadata->glyphWidthTable[i]);
        cJSON_AddItemToArray(glyphWidths, width);
    }

    char *jsonString = cJSON_Print(json);
    cJSON_Delete(json);
    return jsonString;
}

#define TILE_DIMENSION_PIXELS     8
#define PIXELS_FOR_DIMENSION(dim) ((dim) * TILE_DIMENSION_PIXELS)
#define TILES_FOR_PIXELS(num)     (((num) + TILE_DIMENSION_PIXELS - 1) / TILE_DIMENSION_PIXELS)
#define PIXELS_PER_BYTE_2BPP      4
#define NTR_FONT_HEADER_SIZE      16

struct NtrFontMetadata *ParseNtrFontMetadataJson(char *path) {
    int fileLength;
    unsigned char *jsonString = ReadWholeFile(path, &fileLength);

    cJSON *json = cJSON_Parse((const char *)jsonString);
    if (json == NULL) {
        const char *errorPtr = cJSON_GetErrorPtr();
        FATAL_ERROR("Error in line \"%s\"\n", errorPtr);
    }

    cJSON *labelMaxGlyphWidth = cJSON_GetObjectItemCaseSensitive(json, "maxGlyphWidth");
    cJSON *labelMaxGlyphHeight = cJSON_GetObjectItemCaseSensitive(json, "maxGlyphHeight");
    cJSON *labelGlyphWidths = cJSON_GetObjectItemCaseSensitive(json, "glyphWidths");
    int numGlyphs = cJSON_GetArraySize(labelGlyphWidths);

    struct NtrFontMetadata *metadata = malloc(sizeof(struct NtrFontMetadata));

    metadata->size = NTR_FONT_HEADER_SIZE;
    metadata->numGlyphs = numGlyphs;
    metadata->maxWidth = GetInt(labelMaxGlyphWidth);
    metadata->maxHeight = GetInt(labelMaxGlyphHeight);

    metadata->glyphWidth = TILES_FOR_PIXELS(metadata->maxWidth);
    metadata->glyphHeight = TILES_FOR_PIXELS(metadata->maxHeight);

    int glyphBitmapSize = (PIXELS_FOR_DIMENSION(metadata->glyphWidth) * PIXELS_FOR_DIMENSION(metadata->glyphHeight)) / PIXELS_PER_BYTE_2BPP;
    metadata->widthTableOffset = metadata->size + (metadata->numGlyphs * glyphBitmapSize);

    metadata->glyphWidthTable = malloc(metadata->numGlyphs);

    uint8_t *glyphWidthCursor = metadata->glyphWidthTable;
    cJSON *glyphWidthIter = NULL;
    cJSON_ArrayForEach(glyphWidthIter, labelGlyphWidths) {
        if (!cJSON_IsNumber(glyphWidthIter)) {
            const char *errorPtr = cJSON_GetErrorPtr();
            FATAL_ERROR("Error in line \"%s\"\n", errorPtr);
        }

        *glyphWidthCursor = glyphWidthIter->valueint;
        glyphWidthCursor++;
    }

    cJSON_Delete(json);
    free(jsonString);
    return metadata;
}
