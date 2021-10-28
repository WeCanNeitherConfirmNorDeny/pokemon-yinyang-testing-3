move: macro
	db \1 ; animation (interchangeable with move id)
	db \2 ; effect
	db \3 ; power
	db \4 ; type
	db \5 percent ; accuracy
	db \6 ; pp
endm
; 6 bytes

Moves:
; Characteristics of each move.
	move POUND,        NO_ADDITIONAL_EFFECT,        40, NORMAL,   100, 35
MoveEnd:
	move KARATE_CHOP,  NO_ADDITIONAL_EFFECT,        50, FIGHTING, 100, 25
	move DOUBLESLAP,   TWO_TO_FIVE_ATTACKS_EFFECT,  15, NORMAL,    85, 10
	move COMET_PUNCH,  TWO_TO_FIVE_ATTACKS_EFFECT,  18, NORMAL,    85, 15
	move MEGA_PUNCH,   NO_ADDITIONAL_EFFECT,        80, NORMAL,    85, 20
	move PAY_DAY,      PAY_DAY_EFFECT,              40, NORMAL,   100, 20
	move FIRE_PUNCH,   BURN_SIDE_EFFECT1,           75, FIRE,     100, 15
	move ICE_PUNCH,    FREEZE_SIDE_EFFECT,          75, ICE,      100, 15
	move THUNDERPUNCH, PARALYZE_SIDE_EFFECT1,       75, ELECTRIC, 100, 15
	move SCRATCH,      NO_ADDITIONAL_EFFECT,        40, NORMAL,   100, 35
	move VICEGRIP,     NO_ADDITIONAL_EFFECT,        55, NORMAL,   100, 30
	move GUILLOTINE,   OHKO_EFFECT,                  1, NORMAL,    30,  5
	move RAZOR_WIND,   CHARGE_EFFECT,               80, NORMAL,   100, 10
	move SWORDS_DANCE, ATTACK_UP2_EFFECT,            0, NORMAL,   100, 30
	move CUT,          NO_ADDITIONAL_EFFECT,        50, NORMAL,    95, 30
	move GUST,         NO_ADDITIONAL_EFFECT,        40, FLYING,   100, 35
	move WING_ATTACK,  NO_ADDITIONAL_EFFECT,        60, FLYING,   100, 35
	move WHIRLWIND,    SWITCH_AND_TELEPORT_EFFECT,   0, NORMAL,   100, 20
	move FLY,          FLY_EFFECT,                  90, FLYING,    95, 15
	move BIND,         TRAPPING_EFFECT,             15, NORMAL,    85, 20
	move SLAM,         NO_ADDITIONAL_EFFECT,        80, NORMAL,    75, 20
	move VINE_WHIP,    NO_ADDITIONAL_EFFECT,        45, GRASS,    100, 25
	move STOMP,        FLINCH_SIDE_EFFECT2,         65, NORMAL,   100, 20
	move DOUBLE_KICK,  ATTACK_TWICE_EFFECT,         30, FIGHTING, 100, 30
	move MEGA_KICK,    NO_ADDITIONAL_EFFECT,       120, NORMAL,    75,  5
	move JUMP_KICK,    JUMP_KICK_EFFECT,           100, FIGHTING,  95, 10
	move ROLLING_KICK, FLINCH_SIDE_EFFECT2,         60, FIGHTING,  85, 15
	move SAND_ATTACK,  ACCURACY_DOWN1_EFFECT,        0, GROUND,   100, 15
	move HEADBUTT,     FLINCH_SIDE_EFFECT2,         70, NORMAL,   100, 15
	move HORN_ATTACK,  NO_ADDITIONAL_EFFECT,        65, NORMAL,   100, 25
	move FURY_ATTACK,  TWO_TO_FIVE_ATTACKS_EFFECT,  15, NORMAL,    85, 20
	move HORN_DRILL,   OHKO_EFFECT,                  1, NORMAL,    30,  5
	move TACKLE,       NO_ADDITIONAL_EFFECT,        40, NORMAL,   100, 35
	move BODY_SLAM,    PARALYZE_SIDE_EFFECT2,       85, NORMAL,   100, 15
	move WRAP,         TRAPPING_EFFECT,             15, NORMAL,    90, 20
	move TAKE_DOWN,    RECOIL_EFFECT,               90, NORMAL,    85, 20
	move THRASH,       THRASH_PETAL_DANCE_EFFECT,  120, NORMAL,   100, 10
	move DOUBLE_EDGE,  RECOIL_EFFECT,              120, NORMAL,   100, 15
	move TAIL_WHIP,    DEFENSE_DOWN1_EFFECT,         0, NORMAL,   100, 30
	move POISON_STING, POISON_SIDE_EFFECT1,         15, POISON,   100, 35
	move TWINEEDLE,    TWINEEDLE_EFFECT,            25, BUG,      100, 20
	move PIN_MISSILE,  TWO_TO_FIVE_ATTACKS_EFFECT,  25, BUG,       95, 20
	move LEER,         DEFENSE_DOWN1_EFFECT,         0, NORMAL,   100, 30
	move BITE,         FLINCH_SIDE_EFFECT1,         60, DARK,     100, 25
	move GROWL,        ATTACK_DOWN1_EFFECT,          0, NORMAL,   100, 40
	move ROAR,         SWITCH_AND_TELEPORT_EFFECT,   0, NORMAL,   100, 20
	move SING,         SLEEP_EFFECT,                 0, NORMAL,    55, 15
	move SUPERSONIC,   CONFUSION_EFFECT,             0, NORMAL,    55, 20
	move SONICBOOM,    SPECIAL_DAMAGE_EFFECT,        1, NORMAL,    90, 20
	move DISABLE,      DISABLE_EFFECT,               0, NORMAL,   100, 20
	move ACID,         SPECIAL_DOWN_SIDE_EFFECT,    40, POISON,   100, 30
	move EMBER,        BURN_SIDE_EFFECT1,           40, FIRE,     100, 25
	move FLAMETHROWER, BURN_SIDE_EFFECT1,           90, FIRE,     100, 15
	move MIST,         MIST_EFFECT,                  0, ICE,      100, 30
	move WATER_GUN,    NO_ADDITIONAL_EFFECT,        40, WATER,    100, 25
	move HYDRO_PUMP,   NO_ADDITIONAL_EFFECT,       110, WATER,     80,  5
	move SURF,         NO_ADDITIONAL_EFFECT,        90, WATER,    100, 15
	move ICE_BEAM,     FREEZE_SIDE_EFFECT,          90, ICE,      100, 10
	move BLIZZARD,     FREEZE_SIDE_EFFECT,         110, ICE,       70,  5
	move PSYBEAM,      CONFUSION_SIDE_EFFECT,       65, PSYCHIC,  100, 20
	move BUBBLEBEAM,   SPEED_DOWN_SIDE_EFFECT,      65, WATER,    100, 20
	move AURORA_BEAM,  ATTACK_DOWN_SIDE_EFFECT,     65, ICE,      100, 20
	move HYPER_BEAM,   HYPER_BEAM_EFFECT,          150, NORMAL,    90,  5
	move PECK,         NO_ADDITIONAL_EFFECT,        35, FLYING,   100, 35
	move DRILL_PECK,   NO_ADDITIONAL_EFFECT,        80, FLYING,   100, 20
	move SUBMISSION,   RECOIL_EFFECT,               80, FIGHTING,  80, 25
	move LOW_KICK,     FLINCH_SIDE_EFFECT2,         50, FIGHTING, 100, 20
	move COUNTER,      NO_ADDITIONAL_EFFECT,         1, FIGHTING, 100, 20
	move SEISMIC_TOSS, SPECIAL_DAMAGE_EFFECT,        1, FIGHTING, 100, 20
	move STRENGTH,     NO_ADDITIONAL_EFFECT,        80, NORMAL,   100, 15
	move ABSORB,       DRAIN_HP_EFFECT,             20, GRASS,    100, 25
	move MEGA_DRAIN,   DRAIN_HP_EFFECT,             40, GRASS,    100, 15
	move LEECH_SEED,   LEECH_SEED_EFFECT,            0, GRASS,     90, 10
	move GROWTH,       GROWTH_EFFECT,                0, NORMAL,   100, 20
	move RAZOR_LEAF,   NO_ADDITIONAL_EFFECT,        55, GRASS,     95, 25
	move SOLARBEAM,    CHARGE_EFFECT,              200, GRASS,    100, 10
	move POISONPOWDER, POISON_EFFECT,                0, POISON,    75, 35
	move STUN_SPORE,   PARALYZE_EFFECT,              0, GRASS,     75, 30
	move SLEEP_POWDER, SLEEP_EFFECT,                 0, GRASS,     75, 15
	move PETAL_DANCE,  THRASH_PETAL_DANCE_EFFECT,  120, GRASS,    100, 10
	move STRING_SHOT,  SPEED_DOWN1_EFFECT,           0, BUG,       95, 40
	move DRAGON_RAGE,  SPECIAL_DAMAGE_EFFECT,        1, DRAGON,   100, 10
	move FIRE_SPIN,    TRAPPING_EFFECT,             35, FIRE,      85, 15
	move THUNDERSHOCK, PARALYZE_SIDE_EFFECT1,       40, ELECTRIC, 100, 30
	move THUNDERBOLT,  PARALYZE_SIDE_EFFECT1,       90, ELECTRIC, 100, 15
	move THUNDER_WAVE, PARALYZE_EFFECT,              0, ELECTRIC,  90, 20
	move THUNDER,      PARALYZE_SIDE_EFFECT1,      110, ELECTRIC,  70, 10
	move ROCK_THROW,   NO_ADDITIONAL_EFFECT,        50, ROCK,      90, 15
	move EARTHQUAKE,   NO_ADDITIONAL_EFFECT,       100, GROUND,   100, 10
	move FISSURE,      OHKO_EFFECT,                  1, GROUND,    30,  5
	move DIG,          CHARGE_EFFECT,               80, GROUND,   100, 10
	move TOXIC,        POISON_EFFECT,                0, POISON,    90, 10
	move CONFUSION,    CONFUSION_SIDE_EFFECT,       50, PSYCHIC,  100, 25
	move PSYCHIC_M,    SPECIAL_DOWN_SIDE_EFFECT,    90, PSYCHIC,  100, 10
	move HYPNOSIS,     SLEEP_EFFECT,                 0, PSYCHIC,   60, 20
	move MEDITATE,     ATTACK_UP1_EFFECT,            0, PSYCHIC,  100, 40
	move AGILITY,      SPEED_UP2_EFFECT,             0, PSYCHIC,  100, 30
	move QUICK_ATTACK, NO_ADDITIONAL_EFFECT,        40, NORMAL,   100, 30
	move RAGE,         RAGE_EFFECT,                 20, NORMAL,   100, 20
	move TELEPORT,     SWITCH_AND_TELEPORT_EFFECT,   0, PSYCHIC,  100, 20
	move NIGHT_SHADE,  SPECIAL_DAMAGE_EFFECT,        1, GHOST,    100, 15
	move MIMIC,        MIMIC_EFFECT,                 0, NORMAL,   100, 10
	move SCREECH,      DEFENSE_DOWN2_EFFECT,         0, NORMAL,    85, 40
	move DOUBLE_TEAM,  EVASION_UP1_EFFECT,           0, NORMAL,   100, 15
	move RECOVER,      HEAL_EFFECT,                  0, NORMAL,   100, 10
	move HARDEN,       DEFENSE_UP1_EFFECT,           0, NORMAL,   100, 30
	move MINIMIZE,     EVASION_UP1_EFFECT,           0, NORMAL,   100, 10
	move SMOKESCREEN,  ACCURACY_DOWN1_EFFECT,        0, NORMAL,   100, 20
	move CONFUSE_RAY,  CONFUSION_EFFECT,             0, GHOST,    100, 10
	move WITHDRAW,     DEFENSE_UP1_EFFECT,           0, WATER,    100, 40
	move DEFENSE_CURL, DEFENSE_UP1_EFFECT,           0, NORMAL,   100, 40
	move BARRIER,      DEFENSE_UP2_EFFECT,           0, PSYCHIC,  100, 20
	move LIGHT_SCREEN, LIGHT_SCREEN_EFFECT,          0, PSYCHIC,  100, 30
	move HAZE,         HAZE_EFFECT,                  0, ICE,      100, 30
	move REFLECT,      REFLECT_EFFECT,               0, PSYCHIC,  100, 20
	move FOCUS_ENERGY, FOCUS_ENERGY_EFFECT,          0, NORMAL,   100, 30
	move BIDE,         BIDE_EFFECT,                  0, NORMAL,   100, 10
	move METRONOME,    METRONOME_EFFECT,             0, NORMAL,   100, 10
	move MIRROR_MOVE,  MIRROR_MOVE_EFFECT,           0, FLYING,   100, 20
	move SELFDESTRUCT, EXPLODE_EFFECT,             200, NORMAL,   100,  5
	move EGG_BOMB,     NO_ADDITIONAL_EFFECT,       100, NORMAL,    75, 10
	move LICK,         PARALYZE_SIDE_EFFECT2,       30, GHOST,    100, 30
	move SMOG,         POISON_SIDE_EFFECT2,         30, POISON,    70, 20
	move SLUDGE,       POISON_SIDE_EFFECT2,         65, POISON,   100, 20
	move BONE_CLUB,    FLINCH_SIDE_EFFECT1,         65, GROUND,    85, 20
	move FIRE_BLAST,   BURN_SIDE_EFFECT2,          110, FIRE,      85,  5
	move WATERFALL,    NO_ADDITIONAL_EFFECT,        80, WATER,    100, 15
	move CLAMP,        TRAPPING_EFFECT,             35, WATER,     85, 15
	move SWIFT,        SWIFT_EFFECT,                60, NORMAL,   100, 20
	move SKULL_BASH,   CHARGE_EFFECT,              130, NORMAL,   100, 10
	move SPIKE_CANNON, TWO_TO_FIVE_ATTACKS_EFFECT,  20, NORMAL,   100, 15
	move CONSTRICT,    SPEED_DOWN_SIDE_EFFECT,      10, NORMAL,   100, 35
	move AMNESIA,      SPECIAL_UP2_EFFECT,           0, PSYCHIC,  100, 20
	move KINESIS,      ACCURACY_DOWN1_EFFECT,        0, PSYCHIC,   80, 15
	move SOFTBOILED,   HEAL_EFFECT,                  0, NORMAL,   100, 10
	move HI_JUMP_KICK, JUMP_KICK_EFFECT,           130, FIGHTING,  90, 10
	move GLARE,        PARALYZE_EFFECT,              0, NORMAL,   100, 30
	move DREAM_EATER,  DREAM_EATER_EFFECT,         100, PSYCHIC,  100, 15
	move POISON_GAS,   POISON_EFFECT,                0, POISON,    90, 40
	move BARRAGE,      TWO_TO_FIVE_ATTACKS_EFFECT,  15, NORMAL,    85, 20
	move LEECH_LIFE,   DRAIN_HP_EFFECT,             80, BUG,      100, 10
	move LOVELY_KISS,  SLEEP_EFFECT,                 0, NORMAL,    75, 10
	move SKY_ATTACK,   CHARGE_EFFECT,              200, FLYING,    90,  5
	move TRANSFORM,    TRANSFORM_EFFECT,             0, NORMAL,   100, 10
	move BUBBLE,       SPEED_DOWN_SIDE_EFFECT,      40, WATER,    100, 30
	move DIZZY_PUNCH,  CONFUSION_SIDE_EFFECT,       70, NORMAL,   100, 10
	move SPORE,        SLEEP_EFFECT,                 0, GRASS,    100, 15
	move FLASH,        ACCURACY_DOWN1_EFFECT,        0, NORMAL,   100, 20
	move PSYWAVE,      SPECIAL_DAMAGE_EFFECT,        1, PSYCHIC,  100, 15
	move SPLASH,       SPLASH_EFFECT,                0, NORMAL,   100, 40
	move ACID_ARMOR,   DEFENSE_UP2_EFFECT,           0, POISON,   100, 20
	move CRABHAMMER,   NO_ADDITIONAL_EFFECT,       100, WATER,     90, 10
	move EXPLOSION,    EXPLODE_EFFECT,             250, NORMAL,   100,  5
	move FURY_SWIPES,  TWO_TO_FIVE_ATTACKS_EFFECT,  18, NORMAL,    80, 15
	move BONEMERANG,   ATTACK_TWICE_EFFECT,         50, GROUND,    90, 10
	move REST,         HEAL_EFFECT,                  0, PSYCHIC,  100, 10
	move ROCK_SLIDE,   FLINCH_SIDE_EFFECT1,         75, ROCK,      90, 10
	move HYPER_FANG,   FLINCH_SIDE_EFFECT1,         80, NORMAL,    90, 15
	move HONE_CLAWS,   HONE_CLAWS_EFFECT,            0, DARK,     100, 15
	move CONVERSION,   CONVERSION_EFFECT,            0, NORMAL,   100, 30
	move TRI_ATTACK,   TRI_ATTACK_EFFECT,           80, NORMAL,   100, 10
	move SUPER_FANG,   SUPER_FANG_EFFECT,            1, NORMAL,    90, 10
	move SLASH,        NO_ADDITIONAL_EFFECT,        70, NORMAL,   100, 20
	move SUBSTITUTE,   SUBSTITUTE_EFFECT,            0, NORMAL,   100, 10
	move STRUGGLE,     RECOIL_EFFECT,               50, UNK_TYPE, 100, 10
	move SLASH,        ATTACK_UP1_SIDE_EFFECT,      50, STEEL,     95, 35 ; Metal Claw
	move COMET_PUNCH,  NO_ADDITIONAL_EFFECT,        40, STEEL,    100, 30 ; Bullet Punch
	move AURORA_BEAM,  SPECIAL_DOWN_SIDE_EFFECT,    80, STEEL,    100, 10 ; Flash Cannon
	move CUT,          DEFENSE_DOWN_SIDE_EFFECT,   100, STEEL,     75, 15 ; Iron Tail
	move STRENGTH,     ATTACK_UP1_SIDE_EFFECT2,     90, STEEL,     90, 10 ; Meteor Mash
	move BITE,         DEFENSE_DOWN_SIDE_EFFECT,    80, DARK,     100, 15 ; Crunch
	move PSYCHIC_M,    FLINCH_SIDE_EFFECT1,         80, DARK,     100, 15 ; Dark Pulse
	move QUICK_ATTACK, SWIFT_EFFECT,                60, DARK,     100, 20 ; Feint Attack
	move CUT,          NO_ADDITIONAL_EFFECT,        70, DARK,     100, 15 ; Night Slash
	move SEISMIC_TOSS, SPECIAL_DOWN_SIDE_EFFECT,    95, FAIRY,    100, 15 ; Moonblast
	move LOVELY_KISS,  DRAIN_HP_EFFECT,             50, FAIRY,    100, 10 ; Draining Kiss
	move SCREECH,      SWIFT_EFFECT,                40, FAIRY,    100, 15 ; Disarming Voice
	move FLASH,        NO_ADDITIONAL_EFFECT,        80, FAIRY,    100, 10 ; Dazzling Gleam
	move SEISMIC_TOSS, SPECIAL_DOWN_SIDE_EFFECT,   130, DRAGON,    90,  5 ; Draco Meteor
	move FLAMETHROWER, PARALYZE_SIDE_EFFECT1,       60, DRAGON,   100, 20 ; Dragonbreath
	move SLASH,        NO_ADDITIONAL_EFFECT,        80, DRAGON,   100, 15 ; Dragon Claw
	move AURORA_BEAM,  NO_ADDITIONAL_EFFECT,        85, DRAGON,   100, 10 ; Dragon Pulse
	move SONICBOOM,    FLINCH_SIDE_EFFECT1,         40, DRAGON,   100, 20 ; Twister
	move RAGE,         THRASH_PETAL_DANCE_EFFECT,  120, DRAGON,   100, 10 ; Outrage
	move SLASH,        NO_ADDITIONAL_EFFECT,        70, GHOST,    100, 15 ; Shadow Claw
	move WING_ATTACK,  DEFENSE_UP1_SIDE_EFFECT,     70, STEEL,     90, 25 ; Steel Wing
	move BARRIER,      DEFENSE_UP2_EFFECT,           0, STEEL,    100, 15 ; Iron Defense
	move CUT,          FLINCH_SIDE_EFFECT2,         75, FLYING,    95, 15 ; Air Slash
	move BITE,         FIRE_FANG_EFFECT,            65, FIRE,      95, 15 ; Fire Fang
	move EMBER,        RECOIL_EFFECT,              120, FIRE,     100, 15 ; Flare Blitz
	move FIRE_BLAST,   HYPER_BEAM_EFFECT,          150, FIRE,      90,  5 ; Blast Burn
	move BITE,         ICE_FANG_EFFECT,             65, ICE,       95, 15 ; Ice Fang
	move BITE,         THUNDER_FANG_EFFECT,         65, ELECTRIC,  95, 15 ; Thunder Fang
	move BUBBLEBEAM,   CONFUSION_SIDE_EFFECT,       60, WATER,    100, 20 ; Water Pulse
	move SURF,         NO_ADDITIONAL_EFFECT,        90, WATER,    100, 10 ; Aqua Tail
	move AURORA_BEAM,  HYPER_BEAM_EFFECT,          150, WATER,     90,  5 ; Hydro Cannon
	move VINE_WHIP,    HYPER_BEAM_EFFECT,          150, GRASS,     90,  5 ; Frenzy Plant
	move MEGA_PUNCH,   NO_ADDITIONAL_EFFECT,        70, DARK,     100,  5 ; Sucker Punch
	move BARRAGE,      SPECIAL_DOWN_SIDE_EFFECT,    80, GHOST,    100, 15 ; Shadow Ball
	move EMBER,        BURN_SIDE_EFFECT1,           60, FIRE,     100, 25 ; Flame Wheel
	move FOCUS_ENERGY, HEAL_EFFECT,                  0, FAIRY,    100, 20 ; Moonlight
	move PSYCHIC_M,    NO_ADDITIONAL_EFFECT,        65, GHOST,    100, 10 ; Hex
	move MEGA_PUNCH,   SWIFT_EFFECT,                60, GHOST,    100, 20 ; Shadow Punch
	move WING_ATTACK,  SWIFT_EFFECT,                60, FLYING,   100, 20 ; Aerial Ace
	move QUICK_ATTACK, NO_ADDITIONAL_EFFECT,       110, FLYING,   100, 15 ; Acrobatics
	move CUT,          NO_ADDITIONAL_EFFECT,        60, FLYING,   100, 25 ; Air Cutter
	move GUST,         SPEED_DOWN_SIDE_EFFECT,      55, ICE,       95, 15 ; Icy Wind
	move BLIZZARD,     NO_ADDITIONAL_EFFECT,        40, ICE,      100, 30 ; Ice Shard
	move BLIZZARD,     OHKO_EFFECT,                  1, ICE,       30,  5 ; Sheer Cold
	move THUNDER,      NO_ADDITIONAL_EFFECT,        80, ELECTRIC, 100, 10 ; Electro Ball
	move TACKLE,       NUZZLE_EFFECT,               20, ELECTRIC, 100, 20 ; Nuzzle
	move THUNDERBOLT,  PARALYZE_SIDE_EFFECT1,       80, ELECTRIC, 100, 15 ; Discharge
	move QUICK_ATTACK, VOLT_TACKLE_EFFECT,         120, ELECTRIC, 100, 15 ; Volt Tackle
	move SURF,         ACCURACY_DOWN_SIDE_EFFECT,   90, WATER,     85, 10 ; Muddy Water
	move GUST,         TRAPPING_EFFECT,             35, WATER,     85, 15 ; Whirlpool
	move MEGA_DRAIN,   DRAIN_HP_EFFECT,             75, GRASS,    100, 10 ; Giga Drain
	move PETAL_DANCE,  NO_ADDITIONAL_EFFECT,        90, GRASS,    100, 15 ; Petal Blizzard
	move CUT,          NO_ADDITIONAL_EFFECT,        90, GRASS,    100, 15 ; Leaf Blade
	move ROCK_THROW,   RECOIL_EFFECT,              120, GRASS,    100, 15 ; Wood Hammer
	move COMET_PUNCH,  POISON_SIDE_EFFECT2,         80, POISON,   100, 20 ; Poison Jab
	move SLUDGE,       POISON_SIDE_EFFECT2,        120, POISON,    80,  5 ; Gunk Shot
	move BITE,         POISON_FANG_EFFECT,          50, POISON,   100, 15 ; Poison Fang
	move SURF,         POISON_SIDE_EFFECT1,         95, POISON,   100, 10 ; Sludge Wave
	move MIST,         SILVER_WIND_EFFECT,          60, BUG,      100,  5 ; Silver Wind
	move SUPERSONIC,   SPECIAL_DOWN_SIDE_EFFECT,    90, BUG,      100, 10 ; Bug Buzz
	move HORN_ATTACK,  NO_ADDITIONAL_EFFECT,       120, BUG,       85, 10 ; Megahorn
	move CUT,          NO_ADDITIONAL_EFFECT,        80, BUG,      100, 15 ; X-Scissor
	move AURORA_BEAM,  CONFUSION_SIDE_EFFECT,       75, BUG,      100, 15 ; Signal Beam
	move EARTHQUAKE,   SPECIAL_DOWN_SIDE_EFFECT,    90, GROUND,   100, 10 ; Earth Power
	move SAND_ATTACK,  ACCURACY_DOWN_SIDE_EFFECT,   20, GROUND,   100, 10 ; Mud-Slap
	move SAND_ATTACK,  ACCURACY_DOWN_SIDE_EFFECT,   65, GROUND,    85, 10 ; Mud Bomb
	move CONFUSION,    FLINCH_SIDE_EFFECT1,         80, PSYCHIC,  100, 20 ; Extrasensory
	move HEADBUTT,     FLINCH_SIDE_EFFECT2,         80, PSYCHIC,  100, 15 ; Zen Headbutt
	move CUT,          NO_ADDITIONAL_EFFECT,        70, PSYCHIC,  100, 20 ; Psycho Cut
	move SING,         NO_ADDITIONAL_EFFECT,        90, NORMAL,   100, 10 ; Hyper Voice
	move QUICK_ATTACK, NO_ADDITIONAL_EFFECT,        80, NORMAL,   100,  5 ; Extremespeed
	move SLAM,         HYPER_BEAM_EFFECT,          150, NORMAL,    90,  5 ; Giga Impact
	move KINESIS,      NO_ADDITIONAL_EFFECT,        80, ROCK,     100, 20 ; Power Gem
	move BARRAGE,      TWO_TO_FIVE_ATTACKS_EFFECT,  25, ROCK,      95, 10 ; Rock Blast
	move HARDEN,       SPEED_UP2_EFFECT,             0, ROCK,     100, 20 ; Rock Polish
	move ROCK_SLIDE,   SPEED_DOWN_SIDE_EFFECT,      60, ROCK,      95, 15 ; Rock Tomb
	move MEGA_PUNCH,   DYNAMIC_PUNCH_EFFECT,       100, FIGHTING,  50,  5 ; Dynamicpunch
	move COUNTER,      NO_ADDITIONAL_EFFECT,        60, FIGHTING,  90, 10 ; Storm Throw
	move KARATE_CHOP,  NO_ADDITIONAL_EFFECT,       100, FIGHTING,  85,  5 ; Cross Chop
	move MEGA_KICK,    SPEED_DOWN_SIDE_EFFECT,      65, FIGHTING, 100, 20 ; Low Sweep
	move SONICBOOM,    CONFUSION_SIDE_EFFECT,      110, FLYING,    85, 10 ; Hurricane
	move TAIL_WHIP,    ATTACK_DOWN1_EFFECT,          0, FAIRY,    100, 30 ; Baby Doll Eyes
	move BONEMERANG,   TWO_TO_FIVE_ATTACKS_EFFECT,  25, GROUND,    90, 10 ; Bone Rush
	move AURORA_BEAM,  NO_ADDITIONAL_EFFECT,       100, FLYING,   100,  5 ; Aeroblast
	move ROCK_THROW,   SILVER_WIND_EFFECT,          60, ROCK,     100,  5 ; Ancient Power
	move SURF,         CHARGE_EFFECT,               80, WATER,    100, 10 ; Dive (Unused)
	move FLASH,        SPECIAL_DOWN_SIDE_EFFECT,    70, PSYCHIC,  100,  5 ; Luster Purge
	move GLARE,        SILVER_WIND_EFFECT,         100, PSYCHIC,  100, 10 ; Mind Blast
