subdir('nitrorom')

subdir('nitroarc') # libnitroarc
subdir('enumproc') # libenum
subdir('dataproc') # Requires libnitroarc and libenum

subdir('knarc')
subdir('jsonproc')
subdir('msgenc')
subdir('nitrogfx')
subdir('o2narc')
subdir('ordergen')
subdir('postconf')
subdir('scripts')

#mwcc is needed for compiling objects for o2narc
mwcc_exe = find_program('./metroskrew/bin/mwccarm.exe')
mwcc_args = ['-wrap:sdk', '2.0/sp2p2']
