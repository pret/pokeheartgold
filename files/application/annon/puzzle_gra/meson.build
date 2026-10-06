puzzle_gra_ncgr_clobber = ncgr_gen.process(
    files(
        'puzzle_gra_00000001.png',
        'puzzle_gra_00000004.png',
        'puzzle_gra_00000005.png',
        'puzzle_gra_00000006.png',
        'puzzle_gra_00000007.png',
    ),
    extra_args : CLOBBER_SIZE_VERSION101_NCGR_FLAGS
)

puzzle_gra_ncgr_sopc = ncgr_gen.process(
    files(
        'puzzle_gra_00000011.png'
    ),
    extra_args : VERSION101_SOPC_NCGR_FLAGS
)

puzzle_gra_nclr = nclr_gen.process(
    files(
        'puzzle_gra_00000000.pal',
        'puzzle_gra_00000010.pal',
    ),
    extra_args : BPP4_NOPAD_PCMP_NCLR_FLAGS
)

puzzle_gra_ncer = copy_gen.process(
    files(
        'puzzle_gra_00000002.NCER',
        'puzzle_gra_00000008.NCER',
    )
)

puzzle_gra_nanr = copy_gen.process(
    files(
        'puzzle_gra_00000003.NANR',
        'puzzle_gra_00000009.NANR',
    )
)

puzzle_gra_nscr = copy_gen.process(
    files(
        'puzzle_gra_00000012.NSCR',
        'puzzle_gra_00000013.NSCR',
        'puzzle_gra_00000014.NSCR',
        'puzzle_gra_00000015.NSCR',
    )
)
