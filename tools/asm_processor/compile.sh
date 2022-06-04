#!/bin/bash

CC="$1"
AS="$2"
OBJ="$3"
SRC="$4"

BUILD_FILENAME=${OBJ%.o}

PADDED_SRC="$(mktemp --suffix=.c padded-XXXXXX)"
PADDED_OBJ="$(mktemp --suffix=.o padded-XXXXXX)"
PADDED_D="$(mktemp --suffix=.d padded-XXXXXX)"

# Create a .c file replacing the nonmatching function with volatile int writes, 
# and compile.
./tools/asm_processor/asm_processor.py "$SRC" --assembler "$AS" > "$PADDED_SRC"
$CC -c "$PADDED_SRC" -o "$PADDED_OBJ"

# Inject the matching assembly into the padded obj file.
./tools/asm_processor/asm_processor.py "$SRC" --post-process "$PADDED_OBJ" --assembler "$AS"

arm-none-eabi-objcopy --remove-section .comment "$PADDED_OBJ" "$OBJ"
if [[ $CC == *"gccdep"* ]]; then
    cp "$PADDED_D" "${BUILD_FILENAME}.d"
fi

rm padded-*
rm output.txt
rm asm_processor_temp.s
rm asm_processor_temp.o
