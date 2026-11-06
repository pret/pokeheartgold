guinness_nclr = copy_gen.process(
    files(
        'guinness_00000000.NCLR',
        'guinness_00000001.NCLR',
        'guinness_00000006.NCLR',
    )
)

guinness_ncgr_lz = lz_gen.process(
    files(
        'guinness_00000002.NCGR',
        'guinness_00000003.NCGR',
        'guinness_00000009.NCGR',
    ), 
    extra_args: ['-nopad']
)

guinness_nscr_lz = lz_gen.process(
    files(
        'guinness_00000004.NSCR',
        'guinness_00000005.NSCR',
    ), 
    extra_args: ['-nopad']
)

guinness_nanr_lz = lz_gen.process(
    files(
        'guinness_00000007.NANR'
    ), 
    extra_args: ['-nopad']
)

guinness_ncer_lz = lz_gen.process(
    files(
        'guinness_00000008.NCER'
    ), 
    extra_args: ['-nopad']
)
