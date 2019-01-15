#pragma once
#include "types.h"
#include "structs.h"

extern struct battle_datum battle_data[4];

extern u8 b_attacker;
extern u8 b_defender;

extern u8* b_movescr_cursor;

extern u16 b_move;

extern u16* moveids_sound_based_ptr[];
#define moveids_sound_based (*moveids_sound_based_ptr)