#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>

#include "asmwriter.h"
#include "elf.h" // Copy included if not available already
#include "encoder.h"

typedef struct {
    FILE *fhandle;
    char *fname;
    Elf32_Ehdr ex_header;
    Elf32_Shdr symtbl_header;
    Elf32_Shdr strtbl_header;
} ElfFile;

#define INDENT "  "

// Nonfunctional on MinGW
#if 0
static int isSameFile(FILE* f1, FILE* f2) {
    struct stat stat1;
    struct stat stat2;

    fstat(fileno(f1), &stat1);
    fstat(fileno(f2), &stat2);

    return (stat1.st_dev == stat2.st_dev) && (stat1.st_ino == stat2.st_ino);
}
#endif

static void getSectionHeaderByIdx(ElfFile *elf, int idx, Elf32_Shdr *out_section_header) {
    fseek(elf->fhandle, elf->ex_header.e_shoff + (idx * elf->ex_header.e_shentsize), SEEK_SET);
    fread(out_section_header, sizeof(Elf32_Shdr), 1, elf->fhandle);
}

static void getSymbolByIdx(ElfFile *elf, int idx, Elf32_Sym *out_symbol) {
    fseek(elf->fhandle, elf->symtbl_header.sh_offset + (idx * elf->symtbl_header.sh_entsize), SEEK_SET);
    fread(out_symbol, sizeof(Elf32_Sym), 1, elf->fhandle);
}

static int symbolStringCompare(ElfFile *elf, int str_idx, const char *target_symbol) {
    fseek(elf->fhandle, elf->strtbl_header.sh_offset + str_idx, SEEK_SET);

    do {
        int diff = *target_symbol - fgetc(elf->fhandle);
        if (diff != 0) {
            return diff;
        }
    } while (*target_symbol++ != '\0');

    return 0;
}

static int getRelocationHeaderByTarget(ElfFile *elf, int target_idx, Elf32_Shdr *out_relocation_header) {
    for (int i = 0; i < elf->ex_header.e_shnum; i++) {
        if (i == target_idx) {
            continue;
        }

        getSectionHeaderByIdx(elf, i, out_relocation_header);
        if (out_relocation_header->sh_type == SHT_RELA && out_relocation_header->sh_info == target_idx) {
            return 1;
        }
    }

    memset(out_relocation_header, 0, sizeof(Elf32_Shdr));
    return 0;
}

static int ElfFile_Init(ElfFile *elf, char *fname) {
    elf->fname = fname;

    // Open file
    elf->fhandle = fopen(elf->fname, "rb+");
    if (elf->fhandle == NULL) {
        printf("Error: could not open input file: %s\n", elf->fname);
        return 1;
    }

    // Read elf header
    fread(&elf->ex_header, sizeof(Elf32_Ehdr), 1, elf->fhandle);

    // Check magic number
    if (memcmp(&elf->ex_header.e_ident, ELFMAG, SELFMAG) != 0) {
        printf("Error: invalid ELF file (wrong magic number): %s\n", elf->fname);
        return 1;
    }

    // Find symbol table
    int symtbl_found = 0;
    for (int header_idx = 0; header_idx != elf->ex_header.e_shnum; header_idx++) {
        Elf32_Shdr section_header;
        getSectionHeaderByIdx(elf, header_idx, &section_header);

        if (section_header.sh_type == SHT_SYMTAB) {
            symtbl_found = 1;
            elf->symtbl_header = section_header;

            // Get symbol table string table
            getSectionHeaderByIdx(elf, elf->symtbl_header.sh_link, &elf->strtbl_header);
            break;
        }
    }

    if (!symtbl_found) {
        printf("Error: invalid ELF file (no symbol table): %s\n", elf->fname);
        return 1;
    }

    return 0;
}

static void ElfFile_Destroy(ElfFile *elf) {
    if (elf->fhandle != NULL) {
        fclose(elf->fhandle);
    }
}

#define ROTL(x, a) (((uint32_t)x << a) | (x >> (32 - a)))
static void createRC4Key(uint32_t inkey, unsigned int func_size, uint8_t *outkey) {
    uint32_t k[4];

    k[0] = func_size ^ inkey;
    k[1] = func_size ^ ROTL(inkey, 8);
    k[2] = func_size ^ ROTL(inkey, 16);
    k[3] = func_size ^ ROTL(inkey, 24);

    // LE assumed
    memcpy(outkey, &k[0], RC4_KEY_SIZE);
}

static void encodeInstructions(ElfFile *elf, int start_addr, int size, EncodingTask *task) {
    int num_ins = size / 4;
    fseek(elf->fhandle, start_addr, SEEK_SET);
    Instruction *ins_buffer = malloc(size);
    Instructions_Read(ins_buffer, num_ins, elf->fhandle);

    // RC4 setup if neccessary, else use NULL
    RC4_Ctx *rc4 = NULL;
    if (task->key_mode == MODE_KEYED) {
        rc4 = malloc(sizeof(RC4_Ctx));
        uint8_t rc4key[RC4_KEY_SIZE];
        createRC4Key(task->key, size, rc4key);
        RC4_Init(rc4, rc4key);
    }

    for (int i = 0; i < num_ins; i++) {
        if (task->encoding_type == ENC_DECODE) {
            Decode_Instruction(&ins_buffer[i], rc4);
        } else {
            Encode_Instruction(&ins_buffer[i], rc4);
        }
    }

    fseek(elf->fhandle, start_addr, SEEK_SET);
    Instructions_Write(ins_buffer, num_ins, elf->fhandle);

    free(ins_buffer);
    free(rc4);
}

static void encodeRelocations(
    ElfFile *elf,
    int section_offset,
    const Elf32_Sym *symbol,
    int encoded_size,
    const Elf32_Shdr *relocation_header,
    EncodingTask *task) {
    // Iterate all relocations looking for any with offsets in the bounds of the encoding
    int num_relocs = relocation_header->sh_size / relocation_header->sh_entsize;
    for (int reloc_idx = 0; reloc_idx < num_relocs; reloc_idx++) {
        Elf32_Rela reloc;
        int reloc_addr = relocation_header->sh_offset + (reloc_idx * relocation_header->sh_entsize);
        fseek(elf->fhandle, reloc_addr, SEEK_SET);
        fread(&reloc, sizeof(Elf32_Rela), 1, elf->fhandle);

        if (
            (reloc.r_offset >= symbol->st_value) && (reloc.r_offset < (symbol->st_value + encoded_size))) {
            if (task->encoding_type == ENC_DECODE) {
                Decode_Relocation(&reloc);
                if (task->verbose) {
                    printf(INDENT "Decoded relocation for %04x\n", reloc.r_offset);
                }
            } else {
                Encode_Relocation(&reloc);
                if (task->verbose) {
                    printf(INDENT "Encoded relocation for %04x\n", reloc.r_offset);
                }
            }

            fseek(elf->fhandle, reloc_addr, SEEK_SET);
            fwrite(&reloc, sizeof(Elf32_Rela), 1, elf->fhandle);
        }
    }
}

static int getInstructionSize(ElfFile *elf, const Elf32_Sym *symbol) {
    int start = symbol->st_value;
    int end = start + symbol->st_size;

    int symbol_tbl_len = elf->symtbl_header.sh_size / elf->symtbl_header.sh_entsize;

    // Searching for a data mapping symbol before the end of this symbol
    for (int symbol_tbl_idx = 0; symbol_tbl_idx < symbol_tbl_len; symbol_tbl_idx++) {
        Elf32_Sym mapping_symbol;
        getSymbolByIdx(elf, symbol_tbl_idx, &mapping_symbol);

        // Mapping symbol must be in the same region
        if (mapping_symbol.st_shndx != symbol->st_shndx) {
            continue;
        }

        // Check name is "$d"
        if (symbolStringCompare(elf, mapping_symbol.st_name, "$d") != 0) {
            continue;
        }

        // Check that the location resides between start and end
        if (mapping_symbol.st_value >= start && mapping_symbol.st_value <= end) {
            // Move the end back to the start of this symbol
            end = mapping_symbol.st_value;
        }
    }

    return end - start;
}

static int encodeSymbol(ElfFile *elf, const Elf32_Sym *symbol, char *symbol_name, ASMWriter_Ctx *asmw, EncodingTask *task) {
    int ret = 0;

    Elf32_Shdr text_header;
    getSectionHeaderByIdx(elf, symbol->st_shndx, &text_header);
    int start_addr = text_header.sh_offset + symbol->st_value;

    // Encode instructions of this function
    int encoded_bytes = getInstructionSize(elf, symbol);
    if (encoded_bytes != 0) {
        encodeInstructions(elf, start_addr, encoded_bytes, task);

        ASMWriter_SetSymbolSize(asmw, symbol_name, encoded_bytes);

        if (task->verbose) {
            printf("%s: found @ %04x in %s\n",
                symbol_name,
                symbol->st_value,
                elf->fname);

            if (task->encoding_type == ENC_DECODE) {
                if (task->key_mode == MODE_KEYED) {
                    printf(INDENT "Decoded +%x (key = %04x)\n", encoded_bytes, task->key);
                } else {
                    printf(INDENT "Decoded +%x\n", encoded_bytes);
                }
            } else {
                if (task->key_mode == MODE_KEYED) {
                    printf(INDENT "Encoded +%x (key = %04x)\n", encoded_bytes, task->key);
                } else {
                    printf(INDENT "Encoded +%x\n", encoded_bytes);
                }
            }
        }

        // Search for corresponding relocation table for this symbol's section
        Elf32_Shdr relocation_header;
        int rela_found = getRelocationHeaderByTarget(elf, symbol->st_shndx, &relocation_header);

        // Encode relocations if applicable
        if (rela_found) {
            // (Prints relocation data)
            encodeRelocations(elf, text_header.sh_offset, symbol, encoded_bytes, &relocation_header, task);
        }

        if (task->verbose) {
            printf("\n");
        }

    } else {
        ASMWriter_SetInvalid(asmw);
        ret++;

        printf("%s (@ %04x in %s): failed: could not find instruction range\n",
            symbol_name,
            symbol->st_value,
            elf->fname);
    }

    return ret;
}

static int processElfs(ElfFile *elfs, ASMWriter_Ctx *asmw, EncodingTask *task) {
    int ret = 0;

    // Iterate all target symbols in the outermost loop so they are processed in order
    // (this is inefficient, but needed for output structure)
    for (int target_symbol_idx = 0; task->symbols[target_symbol_idx] != NULL; target_symbol_idx++) {
        int symbol_found = 0;

        // Next loop: iterate all elf files we have
        for (int elf_idx = 0; elfs[elf_idx].fhandle != NULL; elf_idx++) {
            int symbol_tbl_len = elfs[elf_idx].symtbl_header.sh_size / elfs[elf_idx].symtbl_header.sh_entsize;

            // Final loop: iterate symbol table of this elf file
            for (int symbol_tbl_idx = 0; symbol_tbl_idx < symbol_tbl_len; symbol_tbl_idx++) {
                Elf32_Sym symbol;
                getSymbolByIdx(&elfs[elf_idx], symbol_tbl_idx, &symbol);

                // Ignore external symbols and non-functions
                if (symbol.st_shndx == SHN_UNDEF || ELF32_ST_TYPE(symbol.st_info) != STT_FUNC) {
                    continue;
                }

                if (symbolStringCompare(&elfs[elf_idx], symbol.st_name, task->symbols[target_symbol_idx]) != 0) {
                    continue;
                }

                symbol_found = 1;
                ret += encodeSymbol(&elfs[elf_idx], &symbol, task->symbols[target_symbol_idx], asmw, task);
                break;
            }
        }

        if (!symbol_found) {
            ASMWriter_SetInvalid(asmw);
            ret++;

            printf("%s: not found in any input file\n", task->symbols[target_symbol_idx]);
        }
    }

    return ret;
}

int Elf_EncodeSymbols(EncodingTask *task) {
    int ret_code = 0;

    int num_inputs = 0;
    while (task->inputs[num_inputs] != NULL) {
        num_inputs++;
    }

    if (num_inputs == 0) {
        return ret_code;
    }

    ASMWriter_Ctx asmw;
    ASMWriter_Init(&asmw, task);

    ElfFile *elfs = calloc(num_inputs + 1, sizeof(ElfFile));
    for (int elf_idx = 0; elf_idx < num_inputs; elf_idx++) {
        ret_code += ElfFile_Init(&elfs[elf_idx], task->inputs[elf_idx]);

#if 0
        // This just.. doesn't work. fstat() doesn't work.
        // Whatever, just don't input the same file multiple times
        if (!ret_code) {
            for (int other_elf_idx = 0; other_elf_idx < elf_idx; other_elf_idx++) {
                if (isSameFile(elfs[elf_idx].fhandle, elfs[other_elf_idx].fhandle)) {
                    printf("Error: duplicate input file: %s\n", elfs[elf_idx].fname);
                    ret_code += 1;
                    break;
                }
            }
        }
#endif

        if (ret_code) {
            ASMWriter_SetInvalid(&asmw);
            goto EXIT;
        }
    }

    // End-of-files signal
    elfs[num_inputs].fhandle = NULL;

    // Process all
    ret_code += processElfs(elfs, &asmw, task);

EXIT:
    ret_code += ASMWriter_Finalize(&asmw);

    for (int elf_idx = 0; elf_idx < num_inputs; elf_idx++) {
        ElfFile_Destroy(&elfs[elf_idx]);
    }
    free(elfs);

    return ret_code;
}
