#pragma once
#include "types.h"

#define SOUND_BYPASSES_SUBSTITUTE true

#define POKEMON_NAME_LENGTH 10
#define BATTLE_STATS_NO 8

#include "defines/status_constants.h"
#include "defines/abilities.h"

#include "structs.h"
#include "locations.h"

#define T1_READ_32(ptr) ((ptr)[0] | ((ptr)[1] << 8) | ((ptr)[2] << 16) | ((ptr)[3] << 24))
#define T1_READ_PTR(ptr) (u8*) T1_READ_32(ptr)