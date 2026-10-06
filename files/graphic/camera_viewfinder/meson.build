camera_viewfinder_knarc_args = copy_gen.process(files(
    '.knarcorder',
    '.knarcignore'
))

camera_viewfinder_nclr = nclr_gen.process(
    files(
        'camera_viewfinder.png'
    )
)

camera_viewfinder_ncgr_lz = ncgr_lz_gen.process(
    files(
        'camera_viewfinder.png'
    ),
    extra_args : VERSION101_SOPC_NCGR_FLAGS
)

camera_viewfinder_nscr_lz = lz_gen.process(files(
    'camera_viewfinder.NSCR'
))
