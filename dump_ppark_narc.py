import json
import re

mons_data = []
with open('include/constants/species.h') as header:
    species = [m[1] for line in header if (m := re.search(r'#define SPECIES_(\w+) +\d+$', line))]
species.pop(0)
with open('files/arc/ppark/ppark_00000000.bin', 'rb') as fp:
    for name in species:
        if not (data := fp.read(6)):
            break
        land, water, score, rate, unk4, unk5 = data
        mons_data.append({
            'species': name,
            'land_sector': land,
            'water_sector': water,
            'score': score,
            'encounter_rate': rate,
            'unk4': unk4,
            'unk5': unk5,
		})
with open('files/arc/ppark/ppark_data.json', 'w') as ofp:
    json.dump({'mons': mons_data}, ofp, indent=4)
