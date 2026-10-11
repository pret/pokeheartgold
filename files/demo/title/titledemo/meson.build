titledemo_8bpp_png = files(
	'titledemo_00000001.png',
	'titledemo_00000003.png',
	'titledemo_00000034.png',
	'titledemo_00000036.png',
)

titledemo_4bpp_png = files(
    'titledemo_00000015.png'
)

titledemo_8bpp_ncgr = ncgr_gen.process(titledemo_8bpp_png,
    extra_args : VERSION101_SOPC_8BPP_NCGR_FLAGS
)

titledemo_4bpp_ncgr = ncgr_gen.process(titledemo_4bpp_png,
    extra_args : VERSION101_SOPC_NCGR_FLAGS
)

titledemo_ncgr = copy_gen.process(files(
    'titledemo_00000007.NCGR',
    'titledemo_00000011.NCGR',
    'titledemo_00000030.NCGR',
    'titledemo_00000031.NCGR',
))

titledemo_nscr = copy_gen.process(files(
    'titledemo_00000000.NSCR',
    'titledemo_00000008.NSCR',
    'titledemo_00000012.NSCR',
    'titledemo_00000017.NSCR',
    'titledemo_00000032.NSCR',
    'titledemo_00000033.NSCR',
    'titledemo_00000035.NSCR',
    'titledemo_00000037.NSCR',
))

titledemo_nclr = copy_gen.process(files(
    'titledemo_00000002.NCLR',
    'titledemo_00000004.NCLR',
    'titledemo_00000009.NCLR',
    'titledemo_00000010.NCLR',
    'titledemo_00000013.NCLR',
    'titledemo_00000014.NCLR',
    'titledemo_00000016.NCLR',
))

titledemo_nsbmd = copy_gen.process(files(
    'titledemo_00000005.NSBMD',
    'titledemo_00000006.NSBMD',
    'titledemo_00000020.NSBMD',
    'titledemo_00000025.NSBMD',
    'titledemo_00000038.NSBMD',
    'titledemo_00000041.NSBMD',
))

titledemo_nsbta = copy_gen.process(files(
    'titledemo_00000018.NSBTA',
    'titledemo_00000019.NSBTA',
    'titledemo_00000022.NSBTA',
    'titledemo_00000027.NSBTA',
))

titledemo_nsbtp = copy_gen.process(files(
    'titledemo_00000023.NSBTP',
    'titledemo_00000029.NSBTP',
    'titledemo_00000040.NSBTP',
    'titledemo_00000043.NSBTP',
))

titledemo_nsbca = copy_gen.process(files(
    'titledemo_00000021.NSBCA',
    'titledemo_00000026.NSBCA',
    'titledemo_00000039.NSBCA',
    'titledemo_00000042.NSBCA',
))

titledemo_nsbma = copy_gen.process(files(
    'titledemo_00000024.NSBMA',
    'titledemo_00000028.NSBMA',
))