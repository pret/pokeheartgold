#ifndef POKEHEARTGOLD_MAP_HEADER_H
#define POKEHEARTGOLD_MAP_HEADER_H

struct MapHeader
{
    u8 wild_encounter_bank;     // fielddata/encountdata/[gs]_enc_data.naix
    u8 area_data_bank;          // fielddata/areadata/area_data.naix
    u16 move_model_bank:4;      // fielddata/mm_list/move_model_list.naix
    u16 world_map_x:6;
    u16 world_map_y:6;
    u16 matrix_id;              // fielddata/mapmatrix/map_matrix.naix
    u16 scripts_bank;           // fielddata/script/scr_seq_release.naix
    u16 level_scripts_bank;     // fielddata/script/scr_seq_release.naix
    u16 msg_bank;               // msgdata/msg.naix
    u16 day_music_id;           // data/sound/gs_sound_data.sdat
    u16 night_music_id;         // data/sound/gs_sound_data.sdat
    u16 events_bank;            // fielddata/eventdata/zone_event_release.naix
    u16 mapsec:8;
    u16 area_icon:4;
    u16 unk_12_C:4;
    u32 is_kanto:1;
    u32 weather:7;
    u32 location_type:4;
    u32 camera_type:6;
    u32 follow_mode:2;
    u32 battle_bg:5;
    u32 bike_allowed:1;
    u32 unk_14_1A:1;
    u32 escape_rope_allowed:1;
    u32 fly_allowed:1;
    u32 unk_14_1D:1;
    u32 unk_14_1E:1;
    u32 unk_14_1F:1;
};

#endif //POKEHEARTGOLD_MAP_HEADER_H
