build_dir = meson.current_build_dir()

trainers_json = files('trainers.json')

trname_template = files('trname.json.txt')
trname_json = custom_target('msg_0729.json',
    command : [
        jsonproc_exe,
        trainers_json,
        trname_template,
        build_dir + '/msg_0729.json'
    ],
    output : [
        'msg_0729.json'
    ]
)

trainer_text_banks = [
    trname_json
]