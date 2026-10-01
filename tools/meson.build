subdir('nitrorom')

subdir('nitroarc') # libnitroarc
subdir('enumproc') # libenum
subdir('dataproc') # Requires libnitroarc and libenum

subdir('compstatic')
subdir('csv2bin')
subdir('jsonproc')
subdir('msgenc')
subdir('nitrogfx')
subdir('o2narc')
subdir('ordergen')
subdir('postconf')
subdir('scripts')

# Tools from the subprojects
makelcf_exe = find_program('makelcf', native: true)

# Native tools
arm_none_eabi_gcc_exe = find_program('arm-none-eabi-gcc', native: true)