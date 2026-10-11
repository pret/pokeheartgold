voltorb_flip_nclr = copy_gen.process(
    files(
        'voltorb_flip_00000000.NCLR',
        'voltorb_flip_00000001.NCLR',
        'voltorb_flip_00000010.NCLR',
        'voltorb_flip_00000014.NCLR',
    )
)

voltorb_flip_ncgr_lz_sopc = ncgr_lz_gen.process(
    files(
        'voltorb_flip_00000002.png',
        'voltorb_flip_00000003.png',
    ),
    extra_args : VERSION101_SOPC_NCGR_FLAGS + EXTFMT_LZ_FLAGS
)

voltorb_flip_ncgr_lz_clobber = ncgr_lz_gen.process(
    files(
        'voltorb_flip_00000011.png',
        'voltorb_flip_00000015.png',
    ),
    extra_args : CLOBBER_SIZE_VERSION101_NCGR_FLAGS + EXTFMT_LZ_FLAGS
)

voltorb_flip_nscr_lz = lz_gen.process(
    files(
        'voltorb_flip_00000004.NSCR',
        'voltorb_flip_00000005.NSCR',
        'voltorb_flip_00000006.NSCR',
        'voltorb_flip_00000007.NSCR',
        'voltorb_flip_00000008.NSCR',
        'voltorb_flip_00000009.NSCR',
    ),
    extra_args : EXTFMT_LZ_FLAGS
)

voltorb_flip_ncer_lz = lz_gen.process(
    files(
        'voltorb_flip_00000012.NCER',
        'voltorb_flip_00000016.NCER',
    ),
    extra_args : EXTFMT_LZ_FLAGS
)

voltorb_flip_nanr_lz = lz_gen.process(
    files(
        'voltorb_flip_00000013.NANR',
        'voltorb_flip_00000017.NANR',
    ),
    extra_args : EXTFMT_LZ_FLAGS
)
