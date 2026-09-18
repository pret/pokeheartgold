charmap_txt = fs.copyfile('charmap.txt')

msgenc_exe = executable('msgenc',
    sources: [
        'msgenc.cpp',
        'Options.cpp',
        'MessagesConverter.cpp',
        'MessagesDecoder.cpp',
        'MessagesEncoder.cpp',
        'Gmm.cpp',
        'Json.cpp',
        'pugixml.cpp'
    ],
    cpp_args: [
        '-DNDEBUG',
        '-g',
        '-std=c++17',
        '-Wall',
        '-Wextra',
        '-Wpedantic',
        '-Wno-unused-parameter',
    ],
    native: true,
    dependencies: dataproc_dep,
)
