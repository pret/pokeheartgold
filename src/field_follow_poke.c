#include "script.h"
#include "map_object_manager.h"
#include "save_follow_poke.h"
#include "script_pokemon_util.h"
#include "field_map_object.h"
#include "map_header.h"
#include "field_follow_poke.h"
#include "constants/scrcmd.h"

static void FsysFollowMonClear(FollowMon *followMon);
static void FollowingPoke_SetObjectShinyFlag(LocalMapObject *mapObject, BOOL enable);
static BOOL FollowPokePermissionDiglettCheck(int mapno);
static void FollowingPoke_SetObjectFormeParam(LocalMapObject *mapObject, int species, u8 forme);
static LocalMapObject *CreateFollowingSpriteFieldObject(MapObjectMan *mapObjectMan, int species, u16 forme, int gender, int direction, int x, int y, int shiny);

static const u16 sModelIndexLUT[] = {
    0x0000,                // SPECIES_NONE
    0x0000,                // SPECIES_BULBASAUR
    0x0001,                // SPECIES_IVYSAUR
    0x0002,                // SPECIES_VENUSAUR
    0x0004,                // SPECIES_CHARMANDER
    0x0005,                // SPECIES_CHARMELEON
    0x0006,                // SPECIES_CHARIZARD
    0x0007,                // SPECIES_SQUIRTLE
    0x0008,                // SPECIES_WARTORTLE
    0x0009,                // SPECIES_BLASTOISE
    0x000A,                // SPECIES_CATERPIE
    0x000B,                // SPECIES_METAPOD
    0x000C,                // SPECIES_BUTTERFREE
    0x000D,                // SPECIES_WEEDLE
    0x000E,                // SPECIES_KAKUNA
    0x000F,                // SPECIES_BEEDRILL
    0x0010,                // SPECIES_PIDGEY
    0x0011,                // SPECIES_PIDGEOTTO
    0x0012,                // SPECIES_PIDGEOT
    0x0013,                // SPECIES_RATTATA
    0x0014,                // SPECIES_RATICATE
    0x0015,                // SPECIES_SPEAROW
    0x0016,                // SPECIES_FEAROW
    0x0017,                // SPECIES_EKANS
    0x0018,                // SPECIES_ARBOK
    0x0019,                // SPECIES_PIKACHU
    0x001B,                // SPECIES_RAICHU
    0x001C,                // SPECIES_SANDSHREW
    0x001D,                // SPECIES_SANDSLASH
    0x001E,                // SPECIES_NIDORAN_F
    0x001F,                // SPECIES_NIDORINA
    0x0020,                // SPECIES_NIDOQUEEN
    0x0021,                // SPECIES_NIDORAN_M
    0x0022,                // SPECIES_NIDORINO
    0x0023,                // SPECIES_NIDOKING
    0x0024,                // SPECIES_CLEFAIRY
    0x0025,                // SPECIES_CLEFABLE
    0x0026,                // SPECIES_VULPIX
    0x0027,                // SPECIES_NINETALES
    0x0028,                // SPECIES_JIGGLYPUFF
    0x0029,                // SPECIES_WIGGLYTUFF
    0x002A,                // SPECIES_ZUBAT
    0x002B,                // SPECIES_GOLBAT
    0x002C,                // SPECIES_ODDISH
    0x002D,                // SPECIES_GLOOM
    0x002E,                // SPECIES_VILEPLUME
    0x002F,                // SPECIES_PARAS
    0x0030,                // SPECIES_PARASECT
    0x0031,                // SPECIES_VENONAT
    0x0032,                // SPECIES_VENOMOTH
    0x0033,                // SPECIES_DIGLETT
    0x0034,                // SPECIES_DUGTRIO
    0x0035,                // SPECIES_MEOWTH
    0x0036,                // SPECIES_PERSIAN
    0x0037,                // SPECIES_PSYDUCK
    0x0038,                // SPECIES_GOLDUCK
    0x0039,                // SPECIES_MANKEY
    0x003A,                // SPECIES_PRIMEAPE
    0x003B,                // SPECIES_GROWLITHE
    0x003C,                // SPECIES_ARCANINE
    0x003D,                // SPECIES_POLIWAG
    0x003E,                // SPECIES_POLIWHIRL
    0x003F,                // SPECIES_POLIWRATH
    0x0040,                // SPECIES_ABRA
    0x0041,                // SPECIES_KADABRA
    0x0042,                // SPECIES_ALAKAZAM
    0x0043,                // SPECIES_MACHOP
    0x0044,                // SPECIES_MACHOKE
    0x0045,                // SPECIES_MACHAMP
    0x0046,                // SPECIES_BELLSPROUT
    0x0047,                // SPECIES_WEEPINBELL
    0x0048,                // SPECIES_VICTREEBEL
    0x0049,                // SPECIES_TENTACOOL
    0x004A,                // SPECIES_TENTACRUEL
    0x004B,                // SPECIES_GEODUDE
    0x004C,                // SPECIES_GRAVELER
    0x004D,                // SPECIES_GOLEM
    0x004E,                // SPECIES_PONYTA
    0x004F,                // SPECIES_RAPIDASH
    0x0050,                // SPECIES_SLOWPOKE
    0x0051,                // SPECIES_SLOWBRO
    0x0052,                // SPECIES_MAGNEMITE
    0x0053,                // SPECIES_MAGNETON
    0x0054,                // SPECIES_FARFETCHD
    0x0055,                // SPECIES_DODUO
    0x0056,                // SPECIES_DODRIO
    0x0057,                // SPECIES_SEEL
    0x0058,                // SPECIES_DEWGONG
    0x0059,                // SPECIES_GRIMER
    0x005A,                // SPECIES_MUK
    0x005B,                // SPECIES_SHELLDER
    0x005C,                // SPECIES_CLOYSTER
    0x005D,                // SPECIES_GASTLY
    0x005E,                // SPECIES_HAUNTER
    0x005F,                // SPECIES_GENGAR
    0x0060,                // SPECIES_ONIX
    0x0061,                // SPECIES_DROWZEE
    0x0062,                // SPECIES_HYPNO
    0x0063,                // SPECIES_KRABBY
    0x0064,                // SPECIES_KINGLER
    0x0065,                // SPECIES_VOLTORB
    0x0066,                // SPECIES_ELECTRODE
    0x0067,                // SPECIES_EXEGGCUTE
    0x0068,                // SPECIES_EXEGGUTOR
    0x0069,                // SPECIES_CUBONE
    0x006A,                // SPECIES_MAROWAK
    0x006B,                // SPECIES_HITMONLEE
    0x006C,                // SPECIES_HITMONCHAN
    0x006D,                // SPECIES_LICKITUNG
    0x006E,                // SPECIES_KOFFING
    0x006F,                // SPECIES_WEEZING
    0x0070,                // SPECIES_RHYHORN
    0x0071,                // SPECIES_RHYDON
    0x0072,                // SPECIES_CHANSEY
    0x0073,                // SPECIES_TANGELA
    0x0074,                // SPECIES_KANGASKHAN
    0x0075,                // SPECIES_HORSEA
    0x0076,                // SPECIES_SEADRA
    0x0077,                // SPECIES_GOLDEEN
    0x0078,                // SPECIES_SEAKING
    0x0079,                // SPECIES_STARYU
    0x007A,                // SPECIES_STARMIE
    0x007B,                // SPECIES_MR_MIME
    0x007C,                // SPECIES_SCYTHER
    0x007D,                // SPECIES_JYNX
    0x007E,                // SPECIES_ELECTABUZZ
    0x007F,                // SPECIES_MAGMAR
    0x0080,                // SPECIES_PINSIR
    0x0081,                // SPECIES_TAUROS
    0x0082,                // SPECIES_MAGIKARP
    0x0083,                // SPECIES_GYARADOS
    0x0084,                // SPECIES_LAPRAS
    0x0085,                // SPECIES_DITTO
    0x0086,                // SPECIES_EEVEE
    0x0087,                // SPECIES_VAPOREON
    0x0088,                // SPECIES_JOLTEON
    0x0089,                // SPECIES_FLAREON
    0x008A,                // SPECIES_PORYGON
    0x008B,                // SPECIES_OMANYTE
    0x008C,                // SPECIES_OMASTAR
    0x008D,                // SPECIES_KABUTO
    0x008E,                // SPECIES_KABUTOPS
    0x008F,                // SPECIES_AERODACTYL
    0x0090,                // SPECIES_SNORLAX
    0x0091,                // SPECIES_ARTICUNO
    0x0092,                // SPECIES_ZAPDOS
    0x0093,                // SPECIES_MOLTRES
    0x0094,                // SPECIES_DRATINI
    0x0095,                // SPECIES_DRAGONAIR
    0x0096,                // SPECIES_DRAGONITE
    0x0097,                // SPECIES_MEWTWO
    0x0098,                // SPECIES_MEW
    0x0099,                // SPECIES_CHIKORITA
    0x009A,                // SPECIES_BAYLEEF
    0x009B,                // SPECIES_MEGANIUM
    0x009D,                // SPECIES_CYNDAQUIL
    0x009E,                // SPECIES_QUILAVA
    0x009F,                // SPECIES_TYPHLOSION
    0x00A0,                // SPECIES_TOTODILE
    0x00A1,                // SPECIES_CROCONAW
    0x00A2,                // SPECIES_FERALIGATR
    0x00A3,                // SPECIES_SENTRET
    0x00A4,                // SPECIES_FURRET
    0x00A5,                // SPECIES_HOOTHOOT
    0x00A6,                // SPECIES_NOCTOWL
    0x00A7,                // SPECIES_LEDYBA
    0x00A8,                // SPECIES_LEDIAN
    0x00A9,                // SPECIES_SPINARAK
    0x00AA,                // SPECIES_ARIADOS
    0x00AB,                // SPECIES_CROBAT
    0x00AC,                // SPECIES_CHINCHOU
    0x00AD,                // SPECIES_LANTURN
    0x00AE,                // SPECIES_PICHU
    0x00B0,                // SPECIES_CLEFFA
    0x00B1,                // SPECIES_IGGLYBUFF
    0x00B2,                // SPECIES_TOGEPI
    0x00B3,                // SPECIES_TOGETIC
    0x00B4,                // SPECIES_NATU
    0x00B5,                // SPECIES_XATU
    0x00B6,                // SPECIES_MAREEP
    0x00B7,                // SPECIES_FLAAFFY
    0x00B8,                // SPECIES_AMPHAROS
    0x00B9,                // SPECIES_BELLOSSOM
    0x00BA,                // SPECIES_MARILL
    0x00BB,                // SPECIES_AZUMARILL
    0x00BC,                // SPECIES_SUDOWOODO
    0x00BD,                // SPECIES_POLITOED
    0x00BE,                // SPECIES_HOPPIP
    0x00BF,                // SPECIES_SKIPLOOM
    0x00C0,                // SPECIES_JUMPLUFF
    0x00C1,                // SPECIES_AIPOM
    0x00C2,                // SPECIES_SUNKERN
    0x00C3,                // SPECIES_SUNFLORA
    0x00C4,                // SPECIES_YANMA
    0x00C5,                // SPECIES_WOOPER
    0x00C6,                // SPECIES_QUAGSIRE
    0x00C7,                // SPECIES_ESPEON
    0x00C8,                // SPECIES_UMBREON
    0x00C9,                // SPECIES_MURKROW
    0x00CA,                // SPECIES_SLOWKING
    0x00CB,                // SPECIES_MISDREAVUS
    0x00CC,                // SPECIES_UNOWN
    0x00E8,                // SPECIES_WOBBUFFET
    0x00EA,                // SPECIES_GIRAFARIG
    0x00EB,                // SPECIES_PINECO
    0x00EC,                // SPECIES_FORRETRESS
    0x00ED,                // SPECIES_DUNSPARCE
    0x00EE,                // SPECIES_GLIGAR
    0x00EF,                // SPECIES_STEELIX
    0x00F1,                // SPECIES_SNUBBULL
    0x00F2,                // SPECIES_GRANBULL
    0x00F3,                // SPECIES_QWILFISH
    0x00F4,                // SPECIES_SCIZOR
    0x00F5,                // SPECIES_SHUCKLE
    0x00F6,                // SPECIES_HERACROSS
    0x00F8,                // SPECIES_SNEASEL
    0x00F9,                // SPECIES_TEDDIURSA
    0x00FA,                // SPECIES_URSARING
    0x00FB,                // SPECIES_SLUGMA
    0x00FC,                // SPECIES_MAGCARGO
    0x00FD,                // SPECIES_SWINUB
    0x00FE,                // SPECIES_PILOSWINE
    0x00FF,                // SPECIES_CORSOLA
    0x0100,                // SPECIES_REMORAID
    0x0101,                // SPECIES_OCTILLERY
    0x0102,                // SPECIES_DELIBIRD
    0x0103,                // SPECIES_MANTINE
    0x0104,                // SPECIES_SKARMORY
    0x0105,                // SPECIES_HOUNDOUR
    0x0106,                // SPECIES_HOUNDOOM
    0x0107,                // SPECIES_KINGDRA
    0x0108,                // SPECIES_PHANPY
    0x0109,                // SPECIES_DONPHAN
    0x010A,                // SPECIES_PORYGON2
    0x010B,                // SPECIES_STANTLER
    0x010C,                // SPECIES_SMEARGLE
    0x010D,                // SPECIES_TYROGUE
    0x010E,                // SPECIES_HITMONTOP
    0x010F,                // SPECIES_SMOOCHUM
    0x0110,                // SPECIES_ELEKID
    0x0111,                // SPECIES_MAGBY
    0x0112,                // SPECIES_MILTANK
    0x0113,                // SPECIES_BLISSEY
    0x0114,                // SPECIES_RAIKOU
    0x0115,                // SPECIES_ENTEI
    0x0116,                // SPECIES_SUICUNE
    0x0117,                // SPECIES_LARVITAR
    0x0118,                // SPECIES_PUPITAR
    0x0119,                // SPECIES_TYRANITAR
    0x011A,                // SPECIES_LUGIA
    0x011B,                // SPECIES_HO_OH
    0x011C,                // SPECIES_CELEBI
    0x011D,                // SPECIES_TREECKO
    0x011E,                // SPECIES_GROVYLE
    0x011F,                // SPECIES_SCEPTILE
    0x0120,                // SPECIES_TORCHIC
    0x0121,                // SPECIES_COMBUSKEN
    0x0122,                // SPECIES_BLAZIKEN
    0x0123,                // SPECIES_MUDKIP
    0x0124,                // SPECIES_MARSHTOMP
    0x0125,                // SPECIES_SWAMPERT
    0x0126,                // SPECIES_POOCHYENA
    0x0127,                // SPECIES_MIGHTYENA
    0x0128,                // SPECIES_ZIGZAGOON
    0x0129,                // SPECIES_LINOONE
    0x012A,                // SPECIES_WURMPLE
    0x012B,                // SPECIES_SILCOON
    0x012C,                // SPECIES_BEAUTIFLY
    0x012D,                // SPECIES_CASCOON
    0x012E,                // SPECIES_DUSTOX
    0x012F,                // SPECIES_LOTAD
    0x0130,                // SPECIES_LOMBRE
    0x0131,                // SPECIES_LUDICOLO
    0x0132,                // SPECIES_SEEDOT
    0x0133,                // SPECIES_NUZLEAF
    0x0134,                // SPECIES_SHIFTRY
    0x0135,                // SPECIES_TAILLOW
    0x0136,                // SPECIES_SWELLOW
    0x0137,                // SPECIES_WINGULL
    0x0138,                // SPECIES_PELIPPER
    0x0139,                // SPECIES_RALTS
    0x013A,                // SPECIES_KIRLIA
    0x013B,                // SPECIES_GARDEVOIR
    0x013C,                // SPECIES_SURSKIT
    0x013D,                // SPECIES_MASQUERAIN
    0x013E,                // SPECIES_SHROOMISH
    0x013F,                // SPECIES_BRELOOM
    0x0140,                // SPECIES_SLAKOTH
    0x0141,                // SPECIES_VIGOROTH
    0x0142,                // SPECIES_SLAKING
    0x0143,                // SPECIES_NINCADA
    0x0144,                // SPECIES_NINJASK
    0x0145,                // SPECIES_SHEDINJA
    0x0146,                // SPECIES_WHISMUR
    0x0147,                // SPECIES_LOUDRED
    0x0148,                // SPECIES_EXPLOUD
    0x0149,                // SPECIES_MAKUHITA
    0x014A,                // SPECIES_HARIYAMA
    0x014B,                // SPECIES_AZURILL
    0x014C,                // SPECIES_NOSEPASS
    0x014D,                // SPECIES_SKITTY
    0x014E,                // SPECIES_DELCATTY
    0x014F,                // SPECIES_SABLEYE
    0x0150,                // SPECIES_MAWILE
    0x0151,                // SPECIES_ARON
    0x0152,                // SPECIES_LAIRON
    0x0153,                // SPECIES_AGGRON
    0x0154,                // SPECIES_MEDITITE
    0x0155,                // SPECIES_MEDICHAM
    0x0156,                // SPECIES_ELECTRIKE
    0x0157,                // SPECIES_MANECTRIC
    0x0158,                // SPECIES_PLUSLE
    0x0159,                // SPECIES_MINUN
    0x015A,                // SPECIES_VOLBEAT
    0x015B,                // SPECIES_ILLUMISE
    0x015C,                // SPECIES_ROSELIA
    0x015D,                // SPECIES_GULPIN
    0x015E,                // SPECIES_SWALOT
    0x015F,                // SPECIES_CARVANHA
    0x0160,                // SPECIES_SHARPEDO
    0x0161,                // SPECIES_WAILMER
    0x0162,                // SPECIES_WAILORD
    0x0163,                // SPECIES_NUMEL
    0x0164,                // SPECIES_CAMERUPT
    0x0165,                // SPECIES_TORKOAL
    0x0166,                // SPECIES_SPOINK
    0x0167,                // SPECIES_GRUMPIG
    0x0168,                // SPECIES_SPINDA
    0x0169,                // SPECIES_TRAPINCH
    0x016A,                // SPECIES_VIBRAVA
    0x016B,                // SPECIES_FLYGON
    0x016C,                // SPECIES_CACNEA
    0x016D,                // SPECIES_CACTURNE
    0x016E,                // SPECIES_SWABLU
    0x016F,                // SPECIES_ALTARIA
    0x0170,                // SPECIES_ZANGOOSE
    0x0171,                // SPECIES_SEVIPER
    0x0172,                // SPECIES_LUNATONE
    0x0173,                // SPECIES_SOLROCK
    0x0174,                // SPECIES_BARBOACH
    0x0175,                // SPECIES_WHISCASH
    0x0176,                // SPECIES_CORPHISH
    0x0177,                // SPECIES_CRAWDAUNT
    0x0178,                // SPECIES_BALTOY
    0x0179,                // SPECIES_CLAYDOL
    0x017A,                // SPECIES_LILEEP
    0x017B,                // SPECIES_CRADILY
    0x017C,                // SPECIES_ANORITH
    0x017D,                // SPECIES_ARMALDO
    0x017E,                // SPECIES_FEEBAS
    0x017F,                // SPECIES_MILOTIC
    0x0180,                // SPECIES_CASTFORM
    0x0181,                // SPECIES_KECLEON
    0x0182,                // SPECIES_SHUPPET
    0x0183,                // SPECIES_BANETTE
    0x0184,                // SPECIES_DUSKULL
    0x0185,                // SPECIES_DUSCLOPS
    0x0186,                // SPECIES_TROPIUS
    0x0187,                // SPECIES_CHIMECHO
    0x0188,                // SPECIES_ABSOL
    0x0189,                // SPECIES_WYNAUT
    0x018A,                // SPECIES_SNORUNT
    0x018B,                // SPECIES_GLALIE
    0x018C,                // SPECIES_SPHEAL
    0x018D,                // SPECIES_SEALEO
    0x018E,                // SPECIES_WALREIN
    0x018F,                // SPECIES_CLAMPERL
    0x0190,                // SPECIES_HUNTAIL
    0x0191,                // SPECIES_GOREBYSS
    0x0192,                // SPECIES_RELICANTH
    0x0193,                // SPECIES_LUVDISC
    0x0194,                // SPECIES_BAGON
    0x0195,                // SPECIES_SHELGON
    0x0196,                // SPECIES_SALAMENCE
    0x0197,                // SPECIES_BELDUM
    0x0198,                // SPECIES_METANG
    0x0199,                // SPECIES_METAGROSS
    0x019A,                // SPECIES_REGIROCK
    0x019B,                // SPECIES_REGICE
    0x019C,                // SPECIES_REGISTEEL
    0x019D,                // SPECIES_LATIAS
    0x019E,                // SPECIES_LATIOS
    0x019F,                // SPECIES_KYOGRE
    0x01A0,                // SPECIES_GROUDON
    0x01A1,                // SPECIES_RAYQUAZA
    0x01A2,                // SPECIES_JIRACHI
    0x01A3,                // SPECIES_DEOXYS
    0x01A7,                // SPECIES_TURTWIG
    0x01A8,                // SPECIES_GROTLE
    0x01A9,                // SPECIES_TORTERRA
    0x01AA,                // SPECIES_CHIMCHAR
    0x01AB,                // SPECIES_MONFERNO
    0x01AC,                // SPECIES_INFERNAPE
    0x01AD,                // SPECIES_PIPLUP
    0x01AE,                // SPECIES_PRINPLUP
    0x01AF,                // SPECIES_EMPOLEON
    0x01B0,                // SPECIES_STARLY
    0x01B1,                // SPECIES_STARAVIA
    0x01B2,                // SPECIES_STARAPTOR
    0x01B3,                // SPECIES_BIDOOF
    0x01B4,                // SPECIES_BIBAREL
    0x01B5,                // SPECIES_KRICKETOT
    0x01B6,                // SPECIES_KRICKETUNE
    0x01B7,                // SPECIES_SHINX
    0x01B8,                // SPECIES_LUXIO
    0x01B9,                // SPECIES_LUXRAY
    0x01BA,                // SPECIES_BUDEW
    0x01BB,                // SPECIES_ROSERADE
    0x01BC,                // SPECIES_CRANIDOS
    0x01BD,                // SPECIES_RAMPARDOS
    0x01BE,                // SPECIES_SHIELDON
    0x01BF,                // SPECIES_BASTIODON
    0x01C0,                // SPECIES_BURMY
    0x01C3,                // SPECIES_WORMADAM
    0x01C6,                // SPECIES_MOTHIM
    0x01C7,                // SPECIES_COMBEE
    0x01C9,                // SPECIES_VESPIQUEN
    0x01CA,                // SPECIES_PACHIRISU
    0x01CB,                // SPECIES_BUIZEL
    0x01CC,                // SPECIES_FLOATZEL
    0x01CD,                // SPECIES_CHERUBI
    0x01CE,                // SPECIES_CHERRIM
    0x01CF,                // SPECIES_SHELLOS
    0x01D1,                // SPECIES_GASTRODON
    0x01D3,                // SPECIES_AMBIPOM
    0x01D4,                // SPECIES_DRIFLOON
    0x01D5,                // SPECIES_DRIFBLIM
    0x01D6,                // SPECIES_BUNEARY
    0x01D7,                // SPECIES_LOPUNNY
    0x01D8,                // SPECIES_MISMAGIUS
    0x01D9,                // SPECIES_HONCHKROW
    0x01DA,                // SPECIES_GLAMEOW
    0x01DB,                // SPECIES_PURUGLY
    0x01DC,                // SPECIES_CHINGLING
    0x01DD,                // SPECIES_STUNKY
    0x01DE,                // SPECIES_SKUNTANK
    0x01DF,                // SPECIES_BRONZOR
    0x01E0,                // SPECIES_BRONZONG
    0x01E1,                // SPECIES_BONSLY
    0x01E2,                // SPECIES_MIME_JR
    0x01E3,                // SPECIES_HAPPINY
    0x01E4,                // SPECIES_CHATOT
    0x01E5,                // SPECIES_SPIRITOMB
    0x01E6,                // SPECIES_GIBLE
    0x01E8,                // SPECIES_GABITE
    0x01EA,                // SPECIES_GARCHOMP
    0x01EC,                // SPECIES_MUNCHLAX
    0x01ED,                // SPECIES_RIOLU
    0x01EE,                // SPECIES_LUCARIO
    0x01EF,                // SPECIES_HIPPOPOTAS
    0x01F1,                // SPECIES_HIPPOWDON
    0x01F3,                // SPECIES_SKORUPI
    0x01F4,                // SPECIES_DRAPION
    0x01F5,                // SPECIES_CROAGUNK
    0x01F6,                // SPECIES_TOXICROAK
    0x01F7,                // SPECIES_CARNIVINE
    0x01F8,                // SPECIES_FINNEON
    0x01F9,                // SPECIES_LUMINEON
    0x01FA,                // SPECIES_MANTYKE
    0x01FB,                // SPECIES_SNOVER
    0x01FC,                // SPECIES_ABOMASNOW
    0x01FD,                // SPECIES_WEAVILE
    0x01FE,                // SPECIES_MAGNEZONE
    0x01FF,                // SPECIES_LICKILICKY
    0x0200,                // SPECIES_RHYPERIOR
    0x0201,                // SPECIES_TANGROWTH
    0x0202,                // SPECIES_ELECTIVIRE
    0x0203,                // SPECIES_MAGMORTAR
    0x0204,                // SPECIES_TOGEKISS
    0x0205,                // SPECIES_YANMEGA
    0x0206,                // SPECIES_LEAFEON
    0x0207,                // SPECIES_GLACEON
    0x0208,                // SPECIES_GLISCOR
    0x0209,                // SPECIES_MAMOSWINE
    0x020A,                // SPECIES_PORYGON_Z
    0x020B,                // SPECIES_GALLADE
    0x020C,                // SPECIES_PROBOPASS
    0x020D,                // SPECIES_DUSKNOIR
    0x020E,                // SPECIES_FROSLASS
    0x020F,                // SPECIES_ROTOM
    0x0215,                // SPECIES_UXIE
    0x0216,                // SPECIES_MESPRIT
    0x0217,                // SPECIES_AZELF
    0x0218,                // SPECIES_DIALGA
    0x0219,                // SPECIES_PALKIA
    0x021A,                // SPECIES_HEATRAN
    0x021B,                // SPECIES_REGIGIGAS
    0x021C,                // SPECIES_GIRATINA
    0x021E,                // SPECIES_CRESSELIA
    0x021F,                // SPECIES_PHIONE
    0x0220,                // SPECIES_MANAPHY
    0x0221,                // SPECIES_DARKRAI
    0x0222,                // SPECIES_SHAYMIN
    0x0224,                // SPECIES_ARCEUS
};

static const u16 sFormeMaxLUT[] = {
    0,          // SPECIES_BULBASAUR
    0,          // SPECIES_IVYSAUR
    0,          // SPECIES_VENUSAUR
    0,          // SPECIES_CHARMANDER
    0,          // SPECIES_CHARMELEON
    0,          // SPECIES_CHARIZARD
    0,          // SPECIES_SQUIRTLE
    0,          // SPECIES_WARTORTLE
    0,          // SPECIES_BLASTOISE
    0,          // SPECIES_CATERPIE
    0,          // SPECIES_METAPOD
    0,          // SPECIES_BUTTERFREE
    0,          // SPECIES_WEEDLE
    0,          // SPECIES_KAKUNA
    0,          // SPECIES_BEEDRILL
    0,          // SPECIES_PIDGEY
    0,          // SPECIES_PIDGEOTTO
    0,          // SPECIES_PIDGEOT
    0,          // SPECIES_RATTATA
    0,          // SPECIES_RATICATE
    0,          // SPECIES_SPEAROW
    0,          // SPECIES_FEAROW
    0,          // SPECIES_EKANS
    0,          // SPECIES_ARBOK
    0,          // SPECIES_PIKACHU
    0,          // SPECIES_RAICHU
    0,          // SPECIES_SANDSHREW
    0,          // SPECIES_SANDSLASH
    0,          // SPECIES_NIDORAN_F
    0,          // SPECIES_NIDORINA
    0,          // SPECIES_NIDOQUEEN
    0,          // SPECIES_NIDORAN_M
    0,          // SPECIES_NIDORINO
    0,          // SPECIES_NIDOKING
    0,          // SPECIES_CLEFAIRY
    0,          // SPECIES_CLEFABLE
    0,          // SPECIES_VULPIX
    0,          // SPECIES_NINETALES
    0,          // SPECIES_JIGGLYPUFF
    0,          // SPECIES_WIGGLYTUFF
    0,          // SPECIES_ZUBAT
    0,          // SPECIES_GOLBAT
    0,          // SPECIES_ODDISH
    0,          // SPECIES_GLOOM
    0,          // SPECIES_VILEPLUME
    0,          // SPECIES_PARAS
    0,          // SPECIES_PARASECT
    0,          // SPECIES_VENONAT
    0,          // SPECIES_VENOMOTH
    0,          // SPECIES_DIGLETT
    0,          // SPECIES_DUGTRIO
    0,          // SPECIES_MEOWTH
    0,          // SPECIES_PERSIAN
    0,          // SPECIES_PSYDUCK
    0,          // SPECIES_GOLDUCK
    0,          // SPECIES_MANKEY
    0,          // SPECIES_PRIMEAPE
    0,          // SPECIES_GROWLITHE
    0,          // SPECIES_ARCANINE
    0,          // SPECIES_POLIWAG
    0,          // SPECIES_POLIWHIRL
    0,          // SPECIES_POLIWRATH
    0,          // SPECIES_ABRA
    0,          // SPECIES_KADABRA
    0,          // SPECIES_ALAKAZAM
    0,          // SPECIES_MACHOP
    0,          // SPECIES_MACHOKE
    0,          // SPECIES_MACHAMP
    0,          // SPECIES_BELLSPROUT
    0,          // SPECIES_WEEPINBELL
    0,          // SPECIES_VICTREEBEL
    0,          // SPECIES_TENTACOOL
    0,          // SPECIES_TENTACRUEL
    0,          // SPECIES_GEODUDE
    0,          // SPECIES_GRAVELER
    0,          // SPECIES_GOLEM
    0,          // SPECIES_PONYTA
    0,          // SPECIES_RAPIDASH
    0,          // SPECIES_SLOWPOKE
    0,          // SPECIES_SLOWBRO
    0,          // SPECIES_MAGNEMITE
    0,          // SPECIES_MAGNETON
    0,          // SPECIES_FARFETCHD
    0,          // SPECIES_DODUO
    0,          // SPECIES_DODRIO
    0,          // SPECIES_SEEL
    0,          // SPECIES_DEWGONG
    0,          // SPECIES_GRIMER
    0,          // SPECIES_MUK
    0,          // SPECIES_SHELLDER
    0,          // SPECIES_CLOYSTER
    0,          // SPECIES_GASTLY
    0,          // SPECIES_HAUNTER
    0,          // SPECIES_GENGAR
    0,          // SPECIES_ONIX
    0,          // SPECIES_DROWZEE
    0,          // SPECIES_HYPNO
    0,          // SPECIES_KRABBY
    0,          // SPECIES_KINGLER
    0,          // SPECIES_VOLTORB
    0,          // SPECIES_ELECTRODE
    0,          // SPECIES_EXEGGCUTE
    0,          // SPECIES_EXEGGUTOR
    0,          // SPECIES_CUBONE
    0,          // SPECIES_MAROWAK
    0,          // SPECIES_HITMONLEE
    0,          // SPECIES_HITMONCHAN
    0,          // SPECIES_LICKITUNG
    0,          // SPECIES_KOFFING
    0,          // SPECIES_WEEZING
    0,          // SPECIES_RHYHORN
    0,          // SPECIES_RHYDON
    0,          // SPECIES_CHANSEY
    0,          // SPECIES_TANGELA
    0,          // SPECIES_KANGASKHAN
    0,          // SPECIES_HORSEA
    0,          // SPECIES_SEADRA
    0,          // SPECIES_GOLDEEN
    0,          // SPECIES_SEAKING
    0,          // SPECIES_STARYU
    0,          // SPECIES_STARMIE
    0,          // SPECIES_MR_MIME
    0,          // SPECIES_SCYTHER
    0,          // SPECIES_JYNX
    0,          // SPECIES_ELECTABUZZ
    0,          // SPECIES_MAGMAR
    0,          // SPECIES_PINSIR
    0,          // SPECIES_TAUROS
    0,          // SPECIES_MAGIKARP
    0,          // SPECIES_GYARADOS
    0,          // SPECIES_LAPRAS
    0,          // SPECIES_DITTO
    0,          // SPECIES_EEVEE
    0,          // SPECIES_VAPOREON
    0,          // SPECIES_JOLTEON
    0,          // SPECIES_FLAREON
    0,          // SPECIES_PORYGON
    0,          // SPECIES_OMANYTE
    0,          // SPECIES_OMASTAR
    0,          // SPECIES_KABUTO
    0,          // SPECIES_KABUTOPS
    0,          // SPECIES_AERODACTYL
    0,          // SPECIES_SNORLAX
    0,          // SPECIES_ARTICUNO
    0,          // SPECIES_ZAPDOS
    0,          // SPECIES_MOLTRES
    0,          // SPECIES_DRATINI
    0,          // SPECIES_DRAGONAIR
    0,          // SPECIES_DRAGONITE
    0,          // SPECIES_MEWTWO
    0,          // SPECIES_MEW
    0,          // SPECIES_CHIKORITA
    0,          // SPECIES_BAYLEEF
    0,          // SPECIES_MEGANIUM
    0,          // SPECIES_CYNDAQUIL
    0,          // SPECIES_QUILAVA
    0,          // SPECIES_TYPHLOSION
    0,          // SPECIES_TOTODILE
    0,          // SPECIES_CROCONAW
    0,          // SPECIES_FERALIGATR
    0,          // SPECIES_SENTRET
    0,          // SPECIES_FURRET
    0,          // SPECIES_HOOTHOOT
    0,          // SPECIES_NOCTOWL
    0,          // SPECIES_LEDYBA
    0,          // SPECIES_LEDIAN
    0,          // SPECIES_SPINARAK
    0,          // SPECIES_ARIADOS
    0,          // SPECIES_CROBAT
    0,          // SPECIES_CHINCHOU
    0,          // SPECIES_LANTURN
    1,          // SPECIES_PICHU
    0,          // SPECIES_CLEFFA
    0,          // SPECIES_IGGLYBUFF
    0,          // SPECIES_TOGEPI
    0,          // SPECIES_TOGETIC
    0,          // SPECIES_NATU
    0,          // SPECIES_XATU
    0,          // SPECIES_MAREEP
    0,          // SPECIES_FLAAFFY
    0,          // SPECIES_AMPHAROS
    0,          // SPECIES_BELLOSSOM
    0,          // SPECIES_MARILL
    0,          // SPECIES_AZUMARILL
    0,          // SPECIES_SUDOWOODO
    0,          // SPECIES_POLITOED
    0,          // SPECIES_HOPPIP
    0,          // SPECIES_SKIPLOOM
    0,          // SPECIES_JUMPLUFF
    0,          // SPECIES_AIPOM
    0,          // SPECIES_SUNKERN
    0,          // SPECIES_SUNFLORA
    0,          // SPECIES_YANMA
    0,          // SPECIES_WOOPER
    0,          // SPECIES_QUAGSIRE
    0,          // SPECIES_ESPEON
    0,          // SPECIES_UMBREON
    0,          // SPECIES_MURKROW
    0,          // SPECIES_SLOWKING
    0,          // SPECIES_MISDREAVUS
    27,         // SPECIES_UNOWN
    0,          // SPECIES_WOBBUFFET
    0,          // SPECIES_GIRAFARIG
    0,          // SPECIES_PINECO
    0,          // SPECIES_FORRETRESS
    0,          // SPECIES_DUNSPARCE
    0,          // SPECIES_GLIGAR
    0,          // SPECIES_STEELIX
    0,          // SPECIES_SNUBBULL
    0,          // SPECIES_GRANBULL
    0,          // SPECIES_QWILFISH
    0,          // SPECIES_SCIZOR
    0,          // SPECIES_SHUCKLE
    0,          // SPECIES_HERACROSS
    0,          // SPECIES_SNEASEL
    0,          // SPECIES_TEDDIURSA
    0,          // SPECIES_URSARING
    0,          // SPECIES_SLUGMA
    0,          // SPECIES_MAGCARGO
    0,          // SPECIES_SWINUB
    0,          // SPECIES_PILOSWINE
    0,          // SPECIES_CORSOLA
    0,          // SPECIES_REMORAID
    0,          // SPECIES_OCTILLERY
    0,          // SPECIES_DELIBIRD
    0,          // SPECIES_MANTINE
    0,          // SPECIES_SKARMORY
    0,          // SPECIES_HOUNDOUR
    0,          // SPECIES_HOUNDOOM
    0,          // SPECIES_KINGDRA
    0,          // SPECIES_PHANPY
    0,          // SPECIES_DONPHAN
    0,          // SPECIES_PORYGON2
    0,          // SPECIES_STANTLER
    0,          // SPECIES_SMEARGLE
    0,          // SPECIES_TYROGUE
    0,          // SPECIES_HITMONTOP
    0,          // SPECIES_SMOOCHUM
    0,          // SPECIES_ELEKID
    0,          // SPECIES_MAGBY
    0,          // SPECIES_MILTANK
    0,          // SPECIES_BLISSEY
    0,          // SPECIES_RAIKOU
    0,          // SPECIES_ENTEI
    0,          // SPECIES_SUICUNE
    0,          // SPECIES_LARVITAR
    0,          // SPECIES_PUPITAR
    0,          // SPECIES_TYRANITAR
    0,          // SPECIES_LUGIA
    0,          // SPECIES_HO_OH
    0,          // SPECIES_CELEBI
    0,          // SPECIES_TREECKO
    0,          // SPECIES_GROVYLE
    0,          // SPECIES_SCEPTILE
    0,          // SPECIES_TORCHIC
    0,          // SPECIES_COMBUSKEN
    0,          // SPECIES_BLAZIKEN
    0,          // SPECIES_MUDKIP
    0,          // SPECIES_MARSHTOMP
    0,          // SPECIES_SWAMPERT
    0,          // SPECIES_POOCHYENA
    0,          // SPECIES_MIGHTYENA
    0,          // SPECIES_ZIGZAGOON
    0,          // SPECIES_LINOONE
    0,          // SPECIES_WURMPLE
    0,          // SPECIES_SILCOON
    0,          // SPECIES_BEAUTIFLY
    0,          // SPECIES_CASCOON
    0,          // SPECIES_DUSTOX
    0,          // SPECIES_LOTAD
    0,          // SPECIES_LOMBRE
    0,          // SPECIES_LUDICOLO
    0,          // SPECIES_SEEDOT
    0,          // SPECIES_NUZLEAF
    0,          // SPECIES_SHIFTRY
    0,          // SPECIES_TAILLOW
    0,          // SPECIES_SWELLOW
    0,          // SPECIES_WINGULL
    0,          // SPECIES_PELIPPER
    0,          // SPECIES_RALTS
    0,          // SPECIES_KIRLIA
    0,          // SPECIES_GARDEVOIR
    0,          // SPECIES_SURSKIT
    0,          // SPECIES_MASQUERAIN
    0,          // SPECIES_SHROOMISH
    0,          // SPECIES_BRELOOM
    0,          // SPECIES_SLAKOTH
    0,          // SPECIES_VIGOROTH
    0,          // SPECIES_SLAKING
    0,          // SPECIES_NINCADA
    0,          // SPECIES_NINJASK
    0,          // SPECIES_SHEDINJA
    0,          // SPECIES_WHISMUR
    0,          // SPECIES_LOUDRED
    0,          // SPECIES_EXPLOUD
    0,          // SPECIES_MAKUHITA
    0,          // SPECIES_HARIYAMA
    0,          // SPECIES_AZURILL
    0,          // SPECIES_NOSEPASS
    0,          // SPECIES_SKITTY
    0,          // SPECIES_DELCATTY
    0,          // SPECIES_SABLEYE
    0,          // SPECIES_MAWILE
    0,          // SPECIES_ARON
    0,          // SPECIES_LAIRON
    0,          // SPECIES_AGGRON
    0,          // SPECIES_MEDITITE
    0,          // SPECIES_MEDICHAM
    0,          // SPECIES_ELECTRIKE
    0,          // SPECIES_MANECTRIC
    0,          // SPECIES_PLUSLE
    0,          // SPECIES_MINUN
    0,          // SPECIES_VOLBEAT
    0,          // SPECIES_ILLUMISE
    0,          // SPECIES_ROSELIA
    0,          // SPECIES_GULPIN
    0,          // SPECIES_SWALOT
    0,          // SPECIES_CARVANHA
    0,          // SPECIES_SHARPEDO
    0,          // SPECIES_WAILMER
    0,          // SPECIES_WAILORD
    0,          // SPECIES_NUMEL
    0,          // SPECIES_CAMERUPT
    0,          // SPECIES_TORKOAL
    0,          // SPECIES_SPOINK
    0,          // SPECIES_GRUMPIG
    0,          // SPECIES_SPINDA
    0,          // SPECIES_TRAPINCH
    0,          // SPECIES_VIBRAVA
    0,          // SPECIES_FLYGON
    0,          // SPECIES_CACNEA
    0,          // SPECIES_CACTURNE
    0,          // SPECIES_SWABLU
    0,          // SPECIES_ALTARIA
    0,          // SPECIES_ZANGOOSE
    0,          // SPECIES_SEVIPER
    0,          // SPECIES_LUNATONE
    0,          // SPECIES_SOLROCK
    0,          // SPECIES_BARBOACH
    0,          // SPECIES_WHISCASH
    0,          // SPECIES_CORPHISH
    0,          // SPECIES_CRAWDAUNT
    0,          // SPECIES_BALTOY
    0,          // SPECIES_CLAYDOL
    0,          // SPECIES_LILEEP
    0,          // SPECIES_CRADILY
    0,          // SPECIES_ANORITH
    0,          // SPECIES_ARMALDO
    0,          // SPECIES_FEEBAS
    0,          // SPECIES_MILOTIC
    0,          // SPECIES_CASTFORM
    0,          // SPECIES_KECLEON
    0,          // SPECIES_SHUPPET
    0,          // SPECIES_BANETTE
    0,          // SPECIES_DUSKULL
    0,          // SPECIES_DUSCLOPS
    0,          // SPECIES_TROPIUS
    0,          // SPECIES_CHIMECHO
    0,          // SPECIES_ABSOL
    0,          // SPECIES_WYNAUT
    0,          // SPECIES_SNORUNT
    0,          // SPECIES_GLALIE
    0,          // SPECIES_SPHEAL
    0,          // SPECIES_SEALEO
    0,          // SPECIES_WALREIN
    0,          // SPECIES_CLAMPERL
    0,          // SPECIES_HUNTAIL
    0,          // SPECIES_GOREBYSS
    0,          // SPECIES_RELICANTH
    0,          // SPECIES_LUVDISC
    0,          // SPECIES_BAGON
    0,          // SPECIES_SHELGON
    0,          // SPECIES_SALAMENCE
    0,          // SPECIES_BELDUM
    0,          // SPECIES_METANG
    0,          // SPECIES_METAGROSS
    0,          // SPECIES_REGIROCK
    0,          // SPECIES_REGICE
    0,          // SPECIES_REGISTEEL
    0,          // SPECIES_LATIAS
    0,          // SPECIES_LATIOS
    0,          // SPECIES_KYOGRE
    0,          // SPECIES_GROUDON
    0,          // SPECIES_RAYQUAZA
    0,          // SPECIES_JIRACHI
    3,          // SPECIES_DEOXYS
    0,          // SPECIES_TURTWIG
    0,          // SPECIES_GROTLE
    0,          // SPECIES_TORTERRA
    0,          // SPECIES_CHIMCHAR
    0,          // SPECIES_MONFERNO
    0,          // SPECIES_INFERNAPE
    0,          // SPECIES_PIPLUP
    0,          // SPECIES_PRINPLUP
    0,          // SPECIES_EMPOLEON
    0,          // SPECIES_STARLY
    0,          // SPECIES_STARAVIA
    0,          // SPECIES_STARAPTOR
    0,          // SPECIES_BIDOOF
    0,          // SPECIES_BIBAREL
    0,          // SPECIES_KRICKETOT
    0,          // SPECIES_KRICKETUNE
    0,          // SPECIES_SHINX
    0,          // SPECIES_LUXIO
    0,          // SPECIES_LUXRAY
    0,          // SPECIES_BUDEW
    0,          // SPECIES_ROSERADE
    0,          // SPECIES_CRANIDOS
    0,          // SPECIES_RAMPARDOS
    0,          // SPECIES_SHIELDON
    0,          // SPECIES_BASTIODON
    2,          // SPECIES_BURMY
    2,          // SPECIES_WORMADAM
    0,          // SPECIES_MOTHIM
    0,          // SPECIES_COMBEE
    0,          // SPECIES_VESPIQUEN
    0,          // SPECIES_PACHIRISU
    0,          // SPECIES_BUIZEL
    0,          // SPECIES_FLOATZEL
    0,          // SPECIES_CHERUBI
    0,          // SPECIES_CHERRIM
    1,          // SPECIES_SHELLOS
    1,          // SPECIES_GASTRODON
    0,          // SPECIES_AMBIPOM
    0,          // SPECIES_DRIFLOON
    0,          // SPECIES_DRIFBLIM
    0,          // SPECIES_BUNEARY
    0,          // SPECIES_LOPUNNY
    0,          // SPECIES_MISMAGIUS
    0,          // SPECIES_HONCHKROW
    0,          // SPECIES_GLAMEOW
    0,          // SPECIES_PURUGLY
    0,          // SPECIES_CHINGLING
    0,          // SPECIES_STUNKY
    0,          // SPECIES_SKUNTANK
    0,          // SPECIES_BRONZOR
    0,          // SPECIES_BRONZONG
    0,          // SPECIES_BONSLY
    0,          // SPECIES_MIME_JR
    0,          // SPECIES_HAPPINY
    0,          // SPECIES_CHATOT
    0,          // SPECIES_SPIRITOMB
    0,          // SPECIES_GIBLE
    0,          // SPECIES_GABITE
    0,          // SPECIES_GARCHOMP
    0,          // SPECIES_MUNCHLAX
    0,          // SPECIES_RIOLU
    0,          // SPECIES_LUCARIO
    0,          // SPECIES_HIPPOPOTAS
    0,          // SPECIES_HIPPOWDON
    0,          // SPECIES_SKORUPI
    0,          // SPECIES_DRAPION
    0,          // SPECIES_CROAGUNK
    0,          // SPECIES_TOXICROAK
    0,          // SPECIES_CARNIVINE
    0,          // SPECIES_FINNEON
    0,          // SPECIES_LUMINEON
    0,          // SPECIES_MANTYKE
    0,          // SPECIES_SNOVER
    0,          // SPECIES_ABOMASNOW
    0,          // SPECIES_WEAVILE
    0,          // SPECIES_MAGNEZONE
    0,          // SPECIES_LICKILICKY
    0,          // SPECIES_RHYPERIOR
    0,          // SPECIES_TANGROWTH
    0,          // SPECIES_ELECTIVIRE
    0,          // SPECIES_MAGMORTAR
    0,          // SPECIES_TOGEKISS
    0,          // SPECIES_YANMEGA
    0,          // SPECIES_LEAFEON
    0,          // SPECIES_GLACEON
    0,          // SPECIES_GLISCOR
    0,          // SPECIES_MAMOSWINE
    0,          // SPECIES_PORYGON_Z
    0,          // SPECIES_GALLADE
    0,          // SPECIES_PROBOPASS
    0,          // SPECIES_DUSKNOIR
    0,          // SPECIES_FROSLASS
    5,          // SPECIES_ROTOM
    0,          // SPECIES_UXIE
    0,          // SPECIES_MESPRIT
    0,          // SPECIES_AZELF
    0,          // SPECIES_DIALGA
    0,          // SPECIES_PALKIA
    0,          // SPECIES_HEATRAN
    0,          // SPECIES_REGIGIGAS
    1,          // SPECIES_GIRATINA
    0,          // SPECIES_CRESSELIA
    0,          // SPECIES_PHIONE
    0,          // SPECIES_MANAPHY
    0,          // SPECIES_DARKRAI
    1,          // SPECIES_SHAYMIN
    17,         // SPECIES_ARCEUS
};

static const u16 sFemaleFlagLUT[] = {
    FALSE,      // SPECIES_BULBASAUR
    FALSE,      // SPECIES_IVYSAUR
    TRUE,       // SPECIES_VENUSAUR
    FALSE,      // SPECIES_CHARMANDER
    FALSE,      // SPECIES_CHARMELEON
    FALSE,      // SPECIES_CHARIZARD
    FALSE,      // SPECIES_SQUIRTLE
    FALSE,      // SPECIES_WARTORTLE
    FALSE,      // SPECIES_BLASTOISE
    FALSE,      // SPECIES_CATERPIE
    FALSE,      // SPECIES_METAPOD
    FALSE,      // SPECIES_BUTTERFREE
    FALSE,      // SPECIES_WEEDLE
    FALSE,      // SPECIES_KAKUNA
    FALSE,      // SPECIES_BEEDRILL
    FALSE,      // SPECIES_PIDGEY
    FALSE,      // SPECIES_PIDGEOTTO
    FALSE,      // SPECIES_PIDGEOT
    FALSE,      // SPECIES_RATTATA
    FALSE,      // SPECIES_RATICATE
    FALSE,      // SPECIES_SPEAROW
    FALSE,      // SPECIES_FEAROW
    FALSE,      // SPECIES_EKANS
    FALSE,      // SPECIES_ARBOK
    TRUE,       // SPECIES_PIKACHU
    FALSE,      // SPECIES_RAICHU
    FALSE,      // SPECIES_SANDSHREW
    FALSE,      // SPECIES_SANDSLASH
    FALSE,      // SPECIES_NIDORAN_F
    FALSE,      // SPECIES_NIDORINA
    FALSE,      // SPECIES_NIDOQUEEN
    FALSE,      // SPECIES_NIDORAN_M
    FALSE,      // SPECIES_NIDORINO
    FALSE,      // SPECIES_NIDOKING
    FALSE,      // SPECIES_CLEFAIRY
    FALSE,      // SPECIES_CLEFABLE
    FALSE,      // SPECIES_VULPIX
    FALSE,      // SPECIES_NINETALES
    FALSE,      // SPECIES_JIGGLYPUFF
    FALSE,      // SPECIES_WIGGLYTUFF
    FALSE,      // SPECIES_ZUBAT
    FALSE,      // SPECIES_GOLBAT
    FALSE,      // SPECIES_ODDISH
    FALSE,      // SPECIES_GLOOM
    FALSE,      // SPECIES_VILEPLUME
    FALSE,      // SPECIES_PARAS
    FALSE,      // SPECIES_PARASECT
    FALSE,      // SPECIES_VENONAT
    FALSE,      // SPECIES_VENOMOTH
    FALSE,      // SPECIES_DIGLETT
    FALSE,      // SPECIES_DUGTRIO
    FALSE,      // SPECIES_MEOWTH
    FALSE,      // SPECIES_PERSIAN
    FALSE,      // SPECIES_PSYDUCK
    FALSE,      // SPECIES_GOLDUCK
    FALSE,      // SPECIES_MANKEY
    FALSE,      // SPECIES_PRIMEAPE
    FALSE,      // SPECIES_GROWLITHE
    FALSE,      // SPECIES_ARCANINE
    FALSE,      // SPECIES_POLIWAG
    FALSE,      // SPECIES_POLIWHIRL
    FALSE,      // SPECIES_POLIWRATH
    FALSE,      // SPECIES_ABRA
    FALSE,      // SPECIES_KADABRA
    FALSE,      // SPECIES_ALAKAZAM
    FALSE,      // SPECIES_MACHOP
    FALSE,      // SPECIES_MACHOKE
    FALSE,      // SPECIES_MACHAMP
    FALSE,      // SPECIES_BELLSPROUT
    FALSE,      // SPECIES_WEEPINBELL
    FALSE,      // SPECIES_VICTREEBEL
    FALSE,      // SPECIES_TENTACOOL
    FALSE,      // SPECIES_TENTACRUEL
    FALSE,      // SPECIES_GEODUDE
    FALSE,      // SPECIES_GRAVELER
    FALSE,      // SPECIES_GOLEM
    FALSE,      // SPECIES_PONYTA
    FALSE,      // SPECIES_RAPIDASH
    FALSE,      // SPECIES_SLOWPOKE
    FALSE,      // SPECIES_SLOWBRO
    FALSE,      // SPECIES_MAGNEMITE
    FALSE,      // SPECIES_MAGNETON
    FALSE,      // SPECIES_FARFETCHD
    FALSE,      // SPECIES_DODUO
    FALSE,      // SPECIES_DODRIO
    FALSE,      // SPECIES_SEEL
    FALSE,      // SPECIES_DEWGONG
    FALSE,      // SPECIES_GRIMER
    FALSE,      // SPECIES_MUK
    FALSE,      // SPECIES_SHELLDER
    FALSE,      // SPECIES_CLOYSTER
    FALSE,      // SPECIES_GASTLY
    FALSE,      // SPECIES_HAUNTER
    FALSE,      // SPECIES_GENGAR
    FALSE,      // SPECIES_ONIX
    FALSE,      // SPECIES_DROWZEE
    FALSE,      // SPECIES_HYPNO
    FALSE,      // SPECIES_KRABBY
    FALSE,      // SPECIES_KINGLER
    FALSE,      // SPECIES_VOLTORB
    FALSE,      // SPECIES_ELECTRODE
    FALSE,      // SPECIES_EXEGGCUTE
    FALSE,      // SPECIES_EXEGGUTOR
    FALSE,      // SPECIES_CUBONE
    FALSE,      // SPECIES_MAROWAK
    FALSE,      // SPECIES_HITMONLEE
    FALSE,      // SPECIES_HITMONCHAN
    FALSE,      // SPECIES_LICKITUNG
    FALSE,      // SPECIES_KOFFING
    FALSE,      // SPECIES_WEEZING
    FALSE,      // SPECIES_RHYHORN
    FALSE,      // SPECIES_RHYDON
    FALSE,      // SPECIES_CHANSEY
    FALSE,      // SPECIES_TANGELA
    FALSE,      // SPECIES_KANGASKHAN
    FALSE,      // SPECIES_HORSEA
    FALSE,      // SPECIES_SEADRA
    FALSE,      // SPECIES_GOLDEEN
    FALSE,      // SPECIES_SEAKING
    FALSE,      // SPECIES_STARYU
    FALSE,      // SPECIES_STARMIE
    FALSE,      // SPECIES_MR_MIME
    FALSE,      // SPECIES_SCYTHER
    FALSE,      // SPECIES_JYNX
    FALSE,      // SPECIES_ELECTABUZZ
    FALSE,      // SPECIES_MAGMAR
    FALSE,      // SPECIES_PINSIR
    FALSE,      // SPECIES_TAUROS
    FALSE,      // SPECIES_MAGIKARP
    FALSE,      // SPECIES_GYARADOS
    FALSE,      // SPECIES_LAPRAS
    FALSE,      // SPECIES_DITTO
    FALSE,      // SPECIES_EEVEE
    FALSE,      // SPECIES_VAPOREON
    FALSE,      // SPECIES_JOLTEON
    FALSE,      // SPECIES_FLAREON
    FALSE,      // SPECIES_PORYGON
    FALSE,      // SPECIES_OMANYTE
    FALSE,      // SPECIES_OMASTAR
    FALSE,      // SPECIES_KABUTO
    FALSE,      // SPECIES_KABUTOPS
    FALSE,      // SPECIES_AERODACTYL
    FALSE,      // SPECIES_SNORLAX
    FALSE,      // SPECIES_ARTICUNO
    FALSE,      // SPECIES_ZAPDOS
    FALSE,      // SPECIES_MOLTRES
    FALSE,      // SPECIES_DRATINI
    FALSE,      // SPECIES_DRAGONAIR
    FALSE,      // SPECIES_DRAGONITE
    FALSE,      // SPECIES_MEWTWO
    FALSE,      // SPECIES_MEW
    FALSE,      // SPECIES_CHIKORITA
    FALSE,      // SPECIES_BAYLEEF
    TRUE,       // SPECIES_MEGANIUM
    FALSE,      // SPECIES_CYNDAQUIL
    FALSE,      // SPECIES_QUILAVA
    FALSE,      // SPECIES_TYPHLOSION
    FALSE,      // SPECIES_TOTODILE
    FALSE,      // SPECIES_CROCONAW
    FALSE,      // SPECIES_FERALIGATR
    FALSE,      // SPECIES_SENTRET
    FALSE,      // SPECIES_FURRET
    FALSE,      // SPECIES_HOOTHOOT
    FALSE,      // SPECIES_NOCTOWL
    FALSE,      // SPECIES_LEDYBA
    FALSE,      // SPECIES_LEDIAN
    FALSE,      // SPECIES_SPINARAK
    FALSE,      // SPECIES_ARIADOS
    FALSE,      // SPECIES_CROBAT
    FALSE,      // SPECIES_CHINCHOU
    FALSE,      // SPECIES_LANTURN
    FALSE,      // SPECIES_PICHU
    FALSE,      // SPECIES_CLEFFA
    FALSE,      // SPECIES_IGGLYBUFF
    FALSE,      // SPECIES_TOGEPI
    FALSE,      // SPECIES_TOGETIC
    FALSE,      // SPECIES_NATU
    FALSE,      // SPECIES_XATU
    FALSE,      // SPECIES_MAREEP
    FALSE,      // SPECIES_FLAAFFY
    FALSE,      // SPECIES_AMPHAROS
    FALSE,      // SPECIES_BELLOSSOM
    FALSE,      // SPECIES_MARILL
    FALSE,      // SPECIES_AZUMARILL
    FALSE,      // SPECIES_SUDOWOODO
    FALSE,      // SPECIES_POLITOED
    FALSE,      // SPECIES_HOPPIP
    FALSE,      // SPECIES_SKIPLOOM
    FALSE,      // SPECIES_JUMPLUFF
    FALSE,      // SPECIES_AIPOM
    FALSE,      // SPECIES_SUNKERN
    FALSE,      // SPECIES_SUNFLORA
    FALSE,      // SPECIES_YANMA
    FALSE,      // SPECIES_WOOPER
    FALSE,      // SPECIES_QUAGSIRE
    FALSE,      // SPECIES_ESPEON
    FALSE,      // SPECIES_UMBREON
    FALSE,      // SPECIES_MURKROW
    FALSE,      // SPECIES_SLOWKING
    FALSE,      // SPECIES_MISDREAVUS
    FALSE,      // SPECIES_UNOWN
    TRUE,       // SPECIES_WOBBUFFET
    FALSE,      // SPECIES_GIRAFARIG
    FALSE,      // SPECIES_PINECO
    FALSE,      // SPECIES_FORRETRESS
    FALSE,      // SPECIES_DUNSPARCE
    FALSE,      // SPECIES_GLIGAR
    TRUE,       // SPECIES_STEELIX
    FALSE,      // SPECIES_SNUBBULL
    FALSE,      // SPECIES_GRANBULL
    FALSE,      // SPECIES_QWILFISH
    FALSE,      // SPECIES_SCIZOR
    FALSE,      // SPECIES_SHUCKLE
    TRUE,       // SPECIES_HERACROSS
    FALSE,      // SPECIES_SNEASEL
    FALSE,      // SPECIES_TEDDIURSA
    FALSE,      // SPECIES_URSARING
    FALSE,      // SPECIES_SLUGMA
    FALSE,      // SPECIES_MAGCARGO
    FALSE,      // SPECIES_SWINUB
    FALSE,      // SPECIES_PILOSWINE
    FALSE,      // SPECIES_CORSOLA
    FALSE,      // SPECIES_REMORAID
    FALSE,      // SPECIES_OCTILLERY
    FALSE,      // SPECIES_DELIBIRD
    FALSE,      // SPECIES_MANTINE
    FALSE,      // SPECIES_SKARMORY
    FALSE,      // SPECIES_HOUNDOUR
    FALSE,      // SPECIES_HOUNDOOM
    FALSE,      // SPECIES_KINGDRA
    FALSE,      // SPECIES_PHANPY
    FALSE,      // SPECIES_DONPHAN
    FALSE,      // SPECIES_PORYGON2
    FALSE,      // SPECIES_STANTLER
    FALSE,      // SPECIES_SMEARGLE
    FALSE,      // SPECIES_TYROGUE
    FALSE,      // SPECIES_HITMONTOP
    FALSE,      // SPECIES_SMOOCHUM
    FALSE,      // SPECIES_ELEKID
    FALSE,      // SPECIES_MAGBY
    FALSE,      // SPECIES_MILTANK
    FALSE,      // SPECIES_BLISSEY
    FALSE,      // SPECIES_RAIKOU
    FALSE,      // SPECIES_ENTEI
    FALSE,      // SPECIES_SUICUNE
    FALSE,      // SPECIES_LARVITAR
    FALSE,      // SPECIES_PUPITAR
    FALSE,      // SPECIES_TYRANITAR
    FALSE,      // SPECIES_LUGIA
    FALSE,      // SPECIES_HO_OH
    FALSE,      // SPECIES_CELEBI
    FALSE,      // SPECIES_TREECKO
    FALSE,      // SPECIES_GROVYLE
    FALSE,      // SPECIES_SCEPTILE
    FALSE,      // SPECIES_TORCHIC
    FALSE,      // SPECIES_COMBUSKEN
    FALSE,      // SPECIES_BLAZIKEN
    FALSE,      // SPECIES_MUDKIP
    FALSE,      // SPECIES_MARSHTOMP
    FALSE,      // SPECIES_SWAMPERT
    FALSE,      // SPECIES_POOCHYENA
    FALSE,      // SPECIES_MIGHTYENA
    FALSE,      // SPECIES_ZIGZAGOON
    FALSE,      // SPECIES_LINOONE
    FALSE,      // SPECIES_WURMPLE
    FALSE,      // SPECIES_SILCOON
    FALSE,      // SPECIES_BEAUTIFLY
    FALSE,      // SPECIES_CASCOON
    FALSE,      // SPECIES_DUSTOX
    FALSE,      // SPECIES_LOTAD
    FALSE,      // SPECIES_LOMBRE
    FALSE,      // SPECIES_LUDICOLO
    FALSE,      // SPECIES_SEEDOT
    FALSE,      // SPECIES_NUZLEAF
    FALSE,      // SPECIES_SHIFTRY
    FALSE,      // SPECIES_TAILLOW
    FALSE,      // SPECIES_SWELLOW
    FALSE,      // SPECIES_WINGULL
    FALSE,      // SPECIES_PELIPPER
    FALSE,      // SPECIES_RALTS
    FALSE,      // SPECIES_KIRLIA
    FALSE,      // SPECIES_GARDEVOIR
    FALSE,      // SPECIES_SURSKIT
    FALSE,      // SPECIES_MASQUERAIN
    FALSE,      // SPECIES_SHROOMISH
    FALSE,      // SPECIES_BRELOOM
    FALSE,      // SPECIES_SLAKOTH
    FALSE,      // SPECIES_VIGOROTH
    FALSE,      // SPECIES_SLAKING
    FALSE,      // SPECIES_NINCADA
    FALSE,      // SPECIES_NINJASK
    FALSE,      // SPECIES_SHEDINJA
    FALSE,      // SPECIES_WHISMUR
    FALSE,      // SPECIES_LOUDRED
    FALSE,      // SPECIES_EXPLOUD
    FALSE,      // SPECIES_MAKUHITA
    FALSE,      // SPECIES_HARIYAMA
    FALSE,      // SPECIES_AZURILL
    FALSE,      // SPECIES_NOSEPASS
    FALSE,      // SPECIES_SKITTY
    FALSE,      // SPECIES_DELCATTY
    FALSE,      // SPECIES_SABLEYE
    FALSE,      // SPECIES_MAWILE
    FALSE,      // SPECIES_ARON
    FALSE,      // SPECIES_LAIRON
    FALSE,      // SPECIES_AGGRON
    FALSE,      // SPECIES_MEDITITE
    FALSE,      // SPECIES_MEDICHAM
    FALSE,      // SPECIES_ELECTRIKE
    FALSE,      // SPECIES_MANECTRIC
    FALSE,      // SPECIES_PLUSLE
    FALSE,      // SPECIES_MINUN
    FALSE,      // SPECIES_VOLBEAT
    FALSE,      // SPECIES_ILLUMISE
    FALSE,      // SPECIES_ROSELIA
    FALSE,      // SPECIES_GULPIN
    FALSE,      // SPECIES_SWALOT
    FALSE,      // SPECIES_CARVANHA
    FALSE,      // SPECIES_SHARPEDO
    FALSE,      // SPECIES_WAILMER
    FALSE,      // SPECIES_WAILORD
    FALSE,      // SPECIES_NUMEL
    FALSE,      // SPECIES_CAMERUPT
    FALSE,      // SPECIES_TORKOAL
    FALSE,      // SPECIES_SPOINK
    FALSE,      // SPECIES_GRUMPIG
    FALSE,      // SPECIES_SPINDA
    FALSE,      // SPECIES_TRAPINCH
    FALSE,      // SPECIES_VIBRAVA
    FALSE,      // SPECIES_FLYGON
    FALSE,      // SPECIES_CACNEA
    FALSE,      // SPECIES_CACTURNE
    FALSE,      // SPECIES_SWABLU
    FALSE,      // SPECIES_ALTARIA
    FALSE,      // SPECIES_ZANGOOSE
    FALSE,      // SPECIES_SEVIPER
    FALSE,      // SPECIES_LUNATONE
    FALSE,      // SPECIES_SOLROCK
    FALSE,      // SPECIES_BARBOACH
    FALSE,      // SPECIES_WHISCASH
    FALSE,      // SPECIES_CORPHISH
    FALSE,      // SPECIES_CRAWDAUNT
    FALSE,      // SPECIES_BALTOY
    FALSE,      // SPECIES_CLAYDOL
    FALSE,      // SPECIES_LILEEP
    FALSE,      // SPECIES_CRADILY
    FALSE,      // SPECIES_ANORITH
    FALSE,      // SPECIES_ARMALDO
    FALSE,      // SPECIES_FEEBAS
    FALSE,      // SPECIES_MILOTIC
    FALSE,      // SPECIES_CASTFORM
    FALSE,      // SPECIES_KECLEON
    FALSE,      // SPECIES_SHUPPET
    FALSE,      // SPECIES_BANETTE
    FALSE,      // SPECIES_DUSKULL
    FALSE,      // SPECIES_DUSCLOPS
    FALSE,      // SPECIES_TROPIUS
    FALSE,      // SPECIES_CHIMECHO
    FALSE,      // SPECIES_ABSOL
    FALSE,      // SPECIES_WYNAUT
    FALSE,      // SPECIES_SNORUNT
    FALSE,      // SPECIES_GLALIE
    FALSE,      // SPECIES_SPHEAL
    FALSE,      // SPECIES_SEALEO
    FALSE,      // SPECIES_WALREIN
    FALSE,      // SPECIES_CLAMPERL
    FALSE,      // SPECIES_HUNTAIL
    FALSE,      // SPECIES_GOREBYSS
    FALSE,      // SPECIES_RELICANTH
    FALSE,      // SPECIES_LUVDISC
    FALSE,      // SPECIES_BAGON
    FALSE,      // SPECIES_SHELGON
    FALSE,      // SPECIES_SALAMENCE
    FALSE,      // SPECIES_BELDUM
    FALSE,      // SPECIES_METANG
    FALSE,      // SPECIES_METAGROSS
    FALSE,      // SPECIES_REGIROCK
    FALSE,      // SPECIES_REGICE
    FALSE,      // SPECIES_REGISTEEL
    FALSE,      // SPECIES_LATIAS
    FALSE,      // SPECIES_LATIOS
    FALSE,      // SPECIES_KYOGRE
    FALSE,      // SPECIES_GROUDON
    FALSE,      // SPECIES_RAYQUAZA
    FALSE,      // SPECIES_JIRACHI
    FALSE,      // SPECIES_DEOXYS
    FALSE,      // SPECIES_TURTWIG
    FALSE,      // SPECIES_GROTLE
    FALSE,      // SPECIES_TORTERRA
    FALSE,      // SPECIES_CHIMCHAR
    FALSE,      // SPECIES_MONFERNO
    FALSE,      // SPECIES_INFERNAPE
    FALSE,      // SPECIES_PIPLUP
    FALSE,      // SPECIES_PRINPLUP
    FALSE,      // SPECIES_EMPOLEON
    FALSE,      // SPECIES_STARLY
    FALSE,      // SPECIES_STARAVIA
    FALSE,      // SPECIES_STARAPTOR
    FALSE,      // SPECIES_BIDOOF
    FALSE,      // SPECIES_BIBAREL
    FALSE,      // SPECIES_KRICKETOT
    FALSE,      // SPECIES_KRICKETUNE
    FALSE,      // SPECIES_SHINX
    FALSE,      // SPECIES_LUXIO
    FALSE,      // SPECIES_LUXRAY
    FALSE,      // SPECIES_BUDEW
    FALSE,      // SPECIES_ROSERADE
    FALSE,      // SPECIES_CRANIDOS
    FALSE,      // SPECIES_RAMPARDOS
    FALSE,      // SPECIES_SHIELDON
    FALSE,      // SPECIES_BASTIODON
    FALSE,      // SPECIES_BURMY
    FALSE,      // SPECIES_WORMADAM
    FALSE,      // SPECIES_MOTHIM
    TRUE,       // SPECIES_COMBEE
    FALSE,      // SPECIES_VESPIQUEN
    FALSE,      // SPECIES_PACHIRISU
    FALSE,      // SPECIES_BUIZEL
    FALSE,      // SPECIES_FLOATZEL
    FALSE,      // SPECIES_CHERUBI
    FALSE,      // SPECIES_CHERRIM
    FALSE,      // SPECIES_SHELLOS
    FALSE,      // SPECIES_GASTRODON
    FALSE,      // SPECIES_AMBIPOM
    FALSE,      // SPECIES_DRIFLOON
    FALSE,      // SPECIES_DRIFBLIM
    FALSE,      // SPECIES_BUNEARY
    FALSE,      // SPECIES_LOPUNNY
    FALSE,      // SPECIES_MISMAGIUS
    FALSE,      // SPECIES_HONCHKROW
    FALSE,      // SPECIES_GLAMEOW
    FALSE,      // SPECIES_PURUGLY
    FALSE,      // SPECIES_CHINGLING
    FALSE,      // SPECIES_STUNKY
    FALSE,      // SPECIES_SKUNTANK
    FALSE,      // SPECIES_BRONZOR
    FALSE,      // SPECIES_BRONZONG
    FALSE,      // SPECIES_BONSLY
    FALSE,      // SPECIES_MIME_JR
    FALSE,      // SPECIES_HAPPINY
    FALSE,      // SPECIES_CHATOT
    FALSE,      // SPECIES_SPIRITOMB
    TRUE,       // SPECIES_GIBLE
    TRUE,       // SPECIES_GABITE
    TRUE,       // SPECIES_GARCHOMP
    FALSE,      // SPECIES_MUNCHLAX
    FALSE,      // SPECIES_RIOLU
    FALSE,      // SPECIES_LUCARIO
    TRUE,       // SPECIES_HIPPOPOTAS
    TRUE,       // SPECIES_HIPPOWDON
    FALSE,      // SPECIES_SKORUPI
    FALSE,      // SPECIES_DRAPION
    FALSE,      // SPECIES_CROAGUNK
    FALSE,      // SPECIES_TOXICROAK
    FALSE,      // SPECIES_CARNIVINE
    FALSE,      // SPECIES_FINNEON
    FALSE,      // SPECIES_LUMINEON
    FALSE,      // SPECIES_MANTYKE
    FALSE,      // SPECIES_SNOVER
    FALSE,      // SPECIES_ABOMASNOW
    FALSE,      // SPECIES_WEAVILE
    FALSE,      // SPECIES_MAGNEZONE
    FALSE,      // SPECIES_LICKILICKY
    FALSE,      // SPECIES_RHYPERIOR
    FALSE,      // SPECIES_TANGROWTH
    FALSE,      // SPECIES_ELECTIVIRE
    FALSE,      // SPECIES_MAGMORTAR
    FALSE,      // SPECIES_TOGEKISS
    FALSE,      // SPECIES_YANMEGA
    FALSE,      // SPECIES_LEAFEON
    FALSE,      // SPECIES_GLACEON
    FALSE,      // SPECIES_GLISCOR
    FALSE,      // SPECIES_MAMOSWINE
    FALSE,      // SPECIES_PORYGON_Z
    FALSE,      // SPECIES_GALLADE
    FALSE,      // SPECIES_PROBOPASS
    FALSE,      // SPECIES_DUSKNOIR
    FALSE,      // SPECIES_FROSLASS
    FALSE,      // SPECIES_ROTOM
    FALSE,      // SPECIES_UXIE
    FALSE,      // SPECIES_MESPRIT
    FALSE,      // SPECIES_AZELF
    FALSE,      // SPECIES_DIALGA
    FALSE,      // SPECIES_PALKIA
    FALSE,      // SPECIES_HEATRAN
    FALSE,      // SPECIES_REGIGIGAS
    FALSE,      // SPECIES_GIRATINA
    FALSE,      // SPECIES_CRESSELIA
    FALSE,      // SPECIES_PHIONE
    FALSE,      // SPECIES_MANAPHY
    FALSE,      // SPECIES_DARKRAI
    FALSE,      // SPECIES_SHAYMIN
    FALSE,      // SPECIES_ARCEUS
};

LocalMapObject *sub_020699F8(MapObjectMan *mapObjectMan, int x, int y, int direction, u32 mapno) {
    FieldSystem *fsys;
    PARTY *party;
    int partyCount;
    POKEMON *pokemon;
    int species;
    int forme;
    int gender;
    int shiny;
    int player_unk;
    LocalMapObject *followPokeObj;

    fsys = MapObjectMan_GetFieldSysPtr(mapObjectMan);
    party = SavArray_PlayerParty_get(fsys->savedata);
    partyCount = GetPartyCount(party);
    FsysFollowMonClear(&fsys->followMon);
    SavFollowPoke_SetUnused2bitField(0, Sav2_FollowPoke_get(fsys->savedata));
    if (partyCount != 0) {
        if (CountAlivePokemon(party) == 0) {
            pokemon = GetFirstNonEggInParty(party);
        } else {
            pokemon = GetFirstAliveMonInParty_CrashIfNone(party);
        }
        species = GetMonData(pokemon, MON_DATA_SPECIES, NULL);
        fsys->followMon.mapObject = NULL;
        if (GetFollowPokePermissionBySpeciesAndMap(species, mapno)) {
            forme = GetMonData(pokemon, MON_DATA_FORME, NULL);
            gender = GetMonData(pokemon, MON_DATA_GENDER, NULL);
            shiny = MonIsShiny(pokemon);
            fsys->followMon.mapObject = CreateFollowingSpriteFieldObject(mapObjectMan, species, forme, gender, direction, x, y, shiny);
            fsys->followMon.active = TRUE;
            FollowPokeFsysParamSet(fsys, species, forme, shiny, gender);
            FsysUnkSub108_Set(fsys->unk108, pokemon, species, GetMonData(pokemon, MON_DATA_PERSONALITY, NULL));
            player_unk = sub_0205C700(fsys->playerAvatar);
            if (player_unk == 0 || player_unk == 3) {
                SavFollowPoke_SetUnused2bitField(1, Sav2_FollowPoke_get(fsys->savedata));
            } else if (player_unk == 1) {
                SavFollowPoke_SetUnused2bitField(2, Sav2_FollowPoke_get(fsys->savedata));
                sub_0206A054(fsys);
                sub_0205FC94(FollowingPokemon_GetMapObject(fsys), 56);
            } else if (player_unk == 2) {
                SavFollowPoke_SetUnused2bitField(2, Sav2_FollowPoke_get(fsys->savedata));
                sub_0206A054(fsys);
                sub_0205FC94(FollowingPokemon_GetMapObject(fsys), 56);
            } else {
                GF_ASSERT(0);
            }
            if (SavFollowPoke_GetInhibitFlagState(Sav2_FollowPoke_get(fsys->savedata))) {
                sub_0206A054(fsys);
            }
        }
    }

    return fsys->followMon.mapObject;
}

void sub_02069B74(MapObjectMan *mapObjectMan, u32 mapno) {
    FieldSystem *fsys;
    PARTY *party;
    int partyCount;
    POKEMON *pokemon;
    int species;
    int forme;
    u8 gender;
    int shiny;
    int player_unk;
    LocalMapObject *followPokeObj;

    fsys = MapObjectMan_GetFieldSysPtr(mapObjectMan);
    party = SavArray_PlayerParty_get(fsys->savedata);
    partyCount = GetPartyCount(party);
    FsysFollowMonClear(&fsys->followMon);
    if (partyCount != 0) {
        pokemon = GetFirstAliveMonInParty_CrashIfNone(party);
        species = GetMonData(pokemon, MON_DATA_SPECIES, NULL);
        FsysUnkSub108_Set(fsys->unk108, pokemon, species, GetMonData(pokemon, MON_DATA_PERSONALITY, NULL));
        if (GetFollowPokePermissionBySpeciesAndMap(species, mapno)) {
            followPokeObj = GetMapObjectByID(fsys->unk3C, obj_partner_poke);
            if (followPokeObj == NULL) {
                fsys->followMon.unk15 = 1;
            } else {
                forme = GetMonData(pokemon, MON_DATA_FORME, NULL);
                gender = GetMonGender(pokemon);
                shiny = MonIsShiny(pokemon);
                fsys->followMon.mapObject = followPokeObj;
                fsys->followMon.active = TRUE;
                FollowPokeFsysParamSet(fsys, species, forme, shiny, gender);
                FollowPokeMapObjectSetParams(followPokeObj, species, forme, shiny);
                MapObject_SetGfxID(fsys->followMon.mapObject, FollowingPokemon_GetSpriteID(species, forme, gender));
                player_unk = sub_0205C700(fsys->playerAvatar);
                if (player_unk == 0 || player_unk == 3) {
                    SavFollowPoke_SetUnused2bitField(1, Sav2_FollowPoke_get(fsys->savedata));
                } else if (player_unk == 1) {
                    SavFollowPoke_SetUnused2bitField(2, Sav2_FollowPoke_get(fsys->savedata));
                    sub_0206A040(fsys->followMon.mapObject, TRUE);
                } else if (player_unk == 2) {
                    SavFollowPoke_SetUnused2bitField(2, Sav2_FollowPoke_get(fsys->savedata));
                    sub_0206A040(fsys->followMon.mapObject, TRUE);
                } else {
                    GF_ASSERT(0);
                }
                if (sub_02069E14(fsys->followMon.mapObject)) {
                    sub_0206A040(fsys->followMon.mapObject, TRUE);
                }
                if (SavFollowPoke_GetInhibitFlagState(Sav2_FollowPoke_get(fsys->savedata))) {
                    sub_0206A054(fsys);
                }
                sub_0205F6AC(fsys->followMon.mapObject, 0);
            }
        } else {
            followPokeObj = GetMapObjectByID(fsys->unk3C, obj_partner_poke);
            if (followPokeObj != NULL) {
                forme = GetMonData(pokemon, MON_DATA_FORME, NULL);
                gender = GetMonGender(pokemon);
                shiny = MonIsShiny(pokemon);
                FollowPokeFsysParamSet(fsys, species, forme, shiny, gender);
                FollowPokeMapObjectSetParams(followPokeObj, species, forme, shiny);
                MapObject_SetGfxID(followPokeObj, FollowingPokemon_GetSpriteID(species, forme, gender));
                fsys->followMon.mapObject = followPokeObj;
                fsys->followMon.active = TRUE;
                fsys->followMon.unk15 = 1;
            }
        }
    }
}

LocalMapObject *FollowingPokemon_GetMapObject(FieldSystem *fsys) {
    return fsys->followMon.mapObject;
}

u32 FollowingPokemon_GetSpriteID(int species, u16 forme, u32 gender) {
    int ret;

    if (species <= 0 || species > NATIONAL_DEX_COUNT) {
        ret = SPRITE_TSURE_POKE_BULBASAUR;
    } else {
        ret = SPRITE_TSURE_POKE_BULBASAUR + SpeciesToOverworldModelIndexOffset(species);
        if (OverworldModelLookupHasFemaleForme(species)) {
            if (gender == MON_FEMALE) {
                ret++;
            }
        } else {
            if (forme > OverworldModelLookupFormeCount(species)) {
                forme = 0;
            }
            ret += forme;
        }
        if (ret > SPRITE_TSURE_POKE_ARCEUS_DARK) {
            ret = SPRITE_TSURE_POKE_BULBASAUR;
        }
    }
    return ret;
}

void sub_02069DC8(LocalMapObject *mapObject, BOOL enable_bit) {
    sub_0206A040(mapObject, enable_bit);
    if (enable_bit) {
        sub_02069DEC(mapObject, TRUE);
    } else {
        sub_02069DEC(mapObject, FALSE);
    }
}

void sub_02069DEC(LocalMapObject *mapObject, BOOL enable_bit) {
    int value;
    u8 flag0;
    u32 flag1;
    u32 flag2;

    value = MapObject_GetParam(mapObject, 2);
    flag0 = value & 1;
    flag1 = enable_bit;
    flag2 = value >> 2;
    value = flag2 << 2;
    value |= flag1 << 1;
    value |= flag0 << 0;
    MapObject_SetParam(mapObject, value, 2);
}

u8 sub_02069E14(LocalMapObject *mapObject) {
    return (MapObject_GetParam(mapObject, 2) >> 1) & 1;
}

void sub_02069E28(LocalMapObject *mapObject, u32 a1) {
    int param;
    u8 r1;
    u16 r2;
    u16 b;

    param = MapObject_GetParam(mapObject, 2);

    r2 = param >> 10;
    b = r2 << 10;
    param = (u8) param;
    param |= b | (a1 << 8);

    MapObject_SetParam(mapObject, param, 2);
}

void sub_02069E50(LocalMapObject *mapObject, u8 a1) {
    int param;
    u32 b;

    GF_ASSERT(a1 <= 23);

    param = MapObject_GetParam(mapObject, 2);

    b = param & 0x3FF;
    param = (a1 << 10) | (u8)b;

    MapObject_SetParam(mapObject, param, 2);
}

void sub_02069E84(LocalMapObject *mapObject, u8 a1) {
    int param;
    u8 a;
    u32 b;

    param = MapObject_GetParam(mapObject, 2);

    a = param & 3;
    b = param >> 3;

    param = (b << 3) | (a1 << 2);
    param |= a;

    MapObject_SetParam(mapObject, param, 2);
}

u8 sub_02069EAC(LocalMapObject *mapObject) {
    return (MapObject_GetParam(mapObject, 2) >> 2) & 1;
}

u8 sub_02069EC0(LocalMapObject *mapObject) {
    return (MapObject_GetParam(mapObject, 2) >> 8) & 3;
}

u8 sub_02069ED4(LocalMapObject *mapObject) {
    return (MapObject_GetParam(mapObject, 2) >> 10) & 0x3F;
}

void FollowPokeMapObjectSetParams(LocalMapObject *mapObject, int species, u8 forme, BOOL shiny) {
    FollowingPoke_SetObjectShinyFlag(mapObject, shiny);
    FollowingPoke_SetObjectFormeParam(mapObject, species, forme);
    MapObject_SetParam(mapObject, species, 0);
}

void sub_02069F0C(LocalMapObject *mapObject, int species, u8 forme, BOOL shiny, int a4) {
    MapObject_SetParam(mapObject, a4, 2);
    FollowingPoke_SetObjectShinyFlag(mapObject, shiny);
    FollowingPoke_SetObjectFormeParam(mapObject, species, forme);
    MapObject_SetParam(mapObject, species, 0);
}

void FollowPokeFsysParamSet(FieldSystem *fsys, int species, u8 forme, BOOL shiny, u8 gender) {
    fsys->followMon.species = species;
    fsys->followMon.shiny = shiny;
    fsys->followMon.forme = forme;
    fsys->followMon.gender = gender;
}

u8 GetFollowPokeSizeParamBySpecies(int species) {
    u8 data[4];

    ReadWholeNarcMemberByIdPair(data, NARC_fielddata_tsurepoke_tp_param, SpeciesToOverworldModelIndexOffset(species));
    return data[1];
}

int FollowPokeObj_GetSpecies(LocalMapObject *mapObject) {
    return MapObject_GetParam(mapObject, 0);
}

BOOL FollowingPokemon_IsActive(FieldSystem *fsys) {
    if (fsys->followMon.active == 0) {
        return FALSE;
    }

    if (CountAlivePokemon(SavArray_PlayerParty_get(fsys->savedata)) != 0) {
        return TRUE;
    } else {
        return FALSE;
    }
}

BOOL sub_02069FB0(FieldSystem *fsys) {
    if (FollowingPokemon_IsActive(fsys)) {
        if (!sub_0205F684(fsys->followMon.mapObject)) {
            return TRUE;
        } else {
            return FALSE;
        }
    } else {
        return FALSE;
    }
}

BOOL sub_02069FD4(FieldSystem *fsys) {
    u32 mapno;

    mapno = SavFollowPoke_GetMapId(Sav2_FollowPoke_get(fsys->savedata));
    return GetFollowPokePermissionBySpeciesAndMap(FollowPokeObj_GetSpecies(fsys->followMon.mapObject), mapno);
}

BOOL GetFollowPokePermissionBySpeciesAndMap(int species, u32 mapno) {
    BOOL ret;
    if ((species == SPECIES_DIGLETT || species == SPECIES_DUGTRIO) && !FollowPokePermissionDiglettCheck(mapno)) {
        return FALSE;
    }

    switch (MapHeader_GetFollowMode(mapno)) {
    case MAP_FOLLOWMODE_PREVENT:
        ret = FALSE;
        break;
    case MAP_FOLLOWMODE_HEIGHT_RESTRICT:
        if (GetFollowPokeSizeParamBySpecies(species)) {
            ret = FALSE;
        } else {
            ret = TRUE;
        }
        break;
    case MAP_FOLLOWMODE_ALLOW:
        ret = TRUE;
        break;
    }

    return ret;
}

void sub_0206A040(LocalMapObject *mapObject, BOOL enable_bit) {
    sub_0205F690(mapObject, enable_bit);
    sub_0205F6E0(mapObject, enable_bit);
}

void sub_0206A054(FieldSystem *fsys) {
    LocalMapObject *obj = fsys->followMon.mapObject;
    sub_02069DC8(obj, TRUE);
    sub_02069DEC(obj, FALSE);
}

static void FsysFollowMonClear(FollowMon *followMon) {
    followMon->active = FALSE;
    followMon->mapObject = NULL;
    followMon->unk4 = 0;
    followMon->unk1C = 0;
    followMon->unk8 = 0;
    followMon->unkC = 0;
    followMon->unk15 = 0;
}

static void FollowingPoke_SetObjectShinyFlag(LocalMapObject *mapObject, BOOL enable) {
    int param;
    u32 val;

    param = MapObject_GetParam(mapObject, 2);
    val = param >> 1;

    param = val << 1;
    if (enable) {
        param |= 1;
    }

    MapObject_SetParam(mapObject, param, 2);
}

static BOOL FollowPokePermissionDiglettCheck(int mapno) {
    switch (mapno) {
    case MAP_D17R0101:
    case MAP_D17R0102:
    case MAP_D17R0103:
    case MAP_D17R0104:
    case MAP_D17R0105:
    case MAP_D17R0106:
    case MAP_D17R0107:
    case MAP_D17R0108:
    case MAP_D17R0109:
    case MAP_D17R0110:
    case MAP_D17R0112:
        return FALSE;
    default:
        return TRUE;
    }
}

static void FollowingPoke_SetObjectFormeParam(LocalMapObject *mapObject, int species, u8 forme) {
    u8 data[4];
    int offset;
    int formect;
    u16 param;

    offset = SpeciesToOverworldModelIndexOffset(species);
    formect = OverworldModelLookupFormeCount(species);
    if (formect > 0) {
        if (forme <= formect) {
            offset += forme;
        } else {
            GF_ASSERT(0);
        }
    }
    ReadWholeNarcMemberByIdPair(data, NARC_fielddata_tsurepoke_tp_param, offset);
    param = (data[1] << 8) | data[2];
    MapObject_SetParam(mapObject, param, 1);
}

static LocalMapObject *CreateFollowingSpriteFieldObject(MapObjectMan *mapObjectMan, int species, u16 forme, int gender, int direction, int x, int y, int shiny) {
    LocalMapObject *ret;

    ret = CreateSpecialFieldObject(
        mapObjectMan,
        x,
        y,
        direction,
        FollowingPokemon_GetSpriteID(species, forme, gender),
        0x30,
        MAP_NOTHING
    );
    GF_ASSERT(ret != NULL);
    MapObject_SetID(ret, obj_partner_poke);
    MapObject_SetType(ret, 0);
    MapObject_SetFlagID(ret, 0);
    MapObject_SetScript(ret, std_following_mon);
    MapObject_SetParam(ret, 0, 2);
    FollowPokeMapObjectSetParams(ret, species, forme, shiny);
    MapObject_SetXRange(ret, -1);
    MapObject_SetYRange(ret, -1);
    MapObject_SetBits(ret, 0x2400);
    MapObject_ClearBits(ret, 0x180);
    sub_0205F89C(ret, TRUE);
    sub_02069DC8(ret, TRUE);
    return ret;
}

struct FieldSystemUnk108 *FsysUnkSub108_Alloc(HeapID heapId) {
    struct FieldSystemUnk108 *ret;

    ret = AllocFromHeap(heapId, sizeof(struct FieldSystemUnk108));
    MI_CpuClear8(ret, sizeof(struct FieldSystemUnk108));
    ret->species = 0;
    ret->personality = 0;
    ret->isRegistered = 0;
    ret->pokemon = 0;
    return ret;
}

void FsysUnkSub108_AddMonMood(struct FieldSystemUnk108 *unk, s8 by) {
    s8 mood;

    if (unk->pokemon == NULL) {
        GF_ASSERT(0);
        return;
    }

    mood = GetMonData(unk->pokemon, MON_DATA_MOOD, NULL);
    if (mood + by > 127) {
        mood = 127;
    } else if (mood + by < -127) {
        mood = -127;
    } else {
        mood += by;
    }
    SetMonData(unk->pokemon, MON_DATA_MOOD, &mood);
}

void FsysUnkSub108_SetMonMood(struct FieldSystemUnk108 *unk, s8 mood) {
    if (unk->pokemon == NULL) {
        GF_ASSERT(0);
        return;
    }

    SetMonData(unk->pokemon, MON_DATA_MOOD, &mood);
}

s8 FsysUnkSub108_GetMonMood(struct FieldSystemUnk108 *unk) {
    if (unk->pokemon == NULL) {
        GF_ASSERT(0);
        return 0;
    }

    return GetMonData(unk->pokemon, MON_DATA_MOOD, NULL);
}

void FsysUnkSub108_Set(struct FieldSystemUnk108 *a0, POKEMON *pokemon, u16 species, u32 personality) {
    s8 mood;
    if (species != SPECIES_NONE && (a0->isRegistered == 0 || a0->species != species || a0->personality != personality)) {
        a0->species = species;
        a0->personality = personality;
        mood = 0;
        a0->isRegistered = 1;
        a0->pokemon = pokemon;
        SetMonData(pokemon, MON_DATA_MOOD, &mood);
    }
}

void FsysUnkSub108_MoveMoodTowardsNeutral(struct FieldSystemUnk108 *a0) {
    s8 mood;
    if (a0->pokemon == NULL) {
        GF_ASSERT(0);
        return;
    }
    mood = GetMonData(a0->pokemon, MON_DATA_MOOD, NULL);
    if (mood < 0) {
        mood++;
    } else if (mood > 0) {
        mood--;
    }
    SetMonData(a0->pokemon, MON_DATA_MOOD, &mood);
}

int SpeciesToOverworldModelIndexOffset(int species) {
    return sModelIndexLUT[species];
}

int OverworldModelLookupFormeCount(int species) {
    if (!(species > 0 && species <= NATIONAL_DEX_COUNT)) {
        GF_ASSERT(0);
        species = 0;
    } else {
        species--;
    }
    return sFormeMaxLUT[species];
}

BOOL OverworldModelLookupHasFemaleForme(int species) {
    if (!(species > 0 && species <= NATIONAL_DEX_COUNT)) {
        GF_ASSERT(0);
        species = 0;
    } else {
        species--;
    }
    return sFemaleFlagLUT[species];
}
