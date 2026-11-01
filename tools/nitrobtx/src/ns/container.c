/*
 * Copyright (c) 2026 Gudf
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, version 3.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

#include "ns/container.h"

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "common.h"
#include "errors.h"
#include "ns/chunks/mdl.h"
#include "ns/chunks/tex.h"

const union Magic containerMagics[NUM_CONTAINER_TYPES] = {
    [CONTAINER_BTX0] = { "BTX0" },
    [CONTAINER_BMD0] = { "BMD0" },
};

const union Magic chunkMagics[NUM_CHUNK_TYPES] = {
    [CHUNK_TEX0] = { TEX0_MAGIC },
    [CHUNK_MDL0] = { MDL0_MAGIC }
};

const uint16_t containerVersions[NUM_CONTAINER_TYPES] = {
    [CONTAINER_BTX0] = 1,
    [CONTAINER_BMD0] = 2
};

static enum ContainerType GetContainerType(union Magic magic);
static enum ChunkType GetChunkType(union Magic magic);
enum ErrorCode NSChunk_ReadFromFile(FILE *file, struct NSChunk *chunk);
void NSChunk_Free(struct NSChunk *chunk);

struct NSContainer NSContainer_Init(enum ContainerType type)
{
    struct NSContainer container = { 0 };

    switch (type) {
    case CONTAINER_BTX0:
        container.type.raw = containerMagics[CONTAINER_BTX0].raw;
        container.chunkCount = 1;
        container.chunks = calloc(1, sizeof(*container.chunks));
        container.chunks[0].type = CHUNK_TEX0;
        container.chunks[0].texChunk = MakeTexChunk();
        break;
    default:
        break;
    }

    return container;
}

enum ErrorCode NSContainer_ReadFromFile(struct NSContainer *container, FILE *file)
{
    long chunkStart = ftell(file);
    struct NSContainerHeader header;
    size_t nRead = fread(&header, sizeof(struct NSContainerHeader), 1, file);

    if (nRead != 1) {
        return ERR_CODE_INPUT_INVALID;
    }

    container->type.raw = header.magic.raw;
    container->chunkCount = header.chunkCount;

    if (GetContainerType(header.magic) == CONTAINER_TYPE_UNSUPPORTED) {
        return ERR_CODE_INVALID_FILE_TYPE;
    }

    if (header.chunkCount == 0) {
        return ERR_CODE_OK;
    }

    uint32_t *chunkOffsets = calloc(header.chunkCount, sizeof(uint32_t));
    nRead = fread(chunkOffsets, sizeof(uint32_t), header.chunkCount, file);

    if (nRead != header.chunkCount) {
        free(chunkOffsets);
        chunkOffsets = NULL;
        return ERR_CODE_INPUT_INVALID;
    }

    container->chunks = calloc(header.chunkCount, sizeof(*container->chunks));
    for (int i = 0; i < header.chunkCount; i++) {
        fseek(file, chunkStart + chunkOffsets[i], SEEK_SET);
        memset(&container->chunks[i], 0, sizeof(container->chunks[i]));
        NSChunk_ReadFromFile(file, &container->chunks[i]);
    }

    free(chunkOffsets);

    return ERR_CODE_OK;
}

enum ErrorCode NSContainer_WriteToFile(struct NSContainer *container, FILE *file)
{
    enum ContainerType type = GetContainerType(container->type);

    struct NSContainerHeader header = {
        .magic.raw = container->type.raw,
        .byteOrder = 0xFEFF,
        .version = type == CONTAINER_TYPE_UNSUPPORTED ? 1 : containerVersions[type],
        .chunkCount = container->chunkCount,
        .headerSize = sizeof(header),
    };

    long fileStart = ftell(file);

    fseek(file, sizeof(header) + container->chunkCount * sizeof(uint32_t), SEEK_CUR);

    uint32_t *chunkOffsets = calloc(container->chunkCount, sizeof(*chunkOffsets));

    for (int i = 0; i < container->chunkCount; i++) {
        chunkOffsets[i] = ftell(file) - fileStart;
        switch (container->chunks[i].type) {
        case CHUNK_TEX0:
            WriteTexChunk(file, container->chunks[i].texChunk);
            break;
        default:
            fprintf(stderr, "Unsupported chunk type!\n");
            break;
        }
    }

    header.fileSize = ftell(file) - fileStart;

    fseek(file, fileStart, SEEK_SET);
    fwrite(&header, sizeof(struct NSContainerHeader), 1, file);
    fwrite(chunkOffsets, sizeof(uint32_t), container->chunkCount, file);
    free(chunkOffsets);

    return ERR_CODE_OK;
}

void NSContainer_Free(struct NSContainer *container)
{
    if (container == NULL) {
        return;
    }
    if (container->chunks) {
        for (int i = 0; i < container->chunkCount; i++) {
            NSChunk_Free(&container->chunks[i]);
        }
    }
    free(container->chunks);
}

static enum ContainerType GetContainerType(union Magic magic)
{
    for (int i = 0; i < NUM_CONTAINER_TYPES; i++) {
        if (magic.raw == containerMagics[i].raw) {
            return i;
        }
    }
    return CONTAINER_TYPE_UNSUPPORTED;
}

static enum ChunkType GetChunkType(union Magic magic)
{
    for (int i = 0; i < NUM_CHUNK_TYPES; i++) {
        if (magic.raw == chunkMagics[i].raw) {
            return i;
        }
    }
    return CHUNK_TYPE_UNSUPPORTED;
}

enum ErrorCode NSChunk_ReadFromFile(FILE *file, struct NSChunk *chunk)
{
    int ret = 0;
    union Magic chunkMagic;
    long chunkStart = ftell(file);
    int nRead = fread(chunkMagic.asBytes, sizeof(union Magic), 1, file);
    if (nRead != 1) {
        return ERR_CODE_INPUT_INVALID;
    }
    fseek(file, chunkStart, SEEK_SET);
    chunk->type = GetChunkType(chunkMagic);
    switch (chunk->type) {
    case CHUNK_TEX0:
        chunk->texChunk = malloc(sizeof(struct NSChunkTex));
        memset(chunk->texChunk, 0, sizeof(*chunk->texChunk));
        ret = ReadTexChunk(file, chunk->texChunk);
        break;
    default:
        ret = ERR_CODE_UNSUPPORTED;
        break;
    }

    return ret;
}

void NSChunk_Free(struct NSChunk *chunk)
{
    if (chunk == NULL) {
        return;
    }
    switch (chunk->type) {
    case CHUNK_TEX0:
        FreeTexChunk(chunk->texChunk);
        free(chunk->texChunk);
        chunk->texChunk = NULL;
        break;
    default:
        free(chunk->chunkPtr);
        chunk->chunkPtr = NULL;
        break;
    }
}
