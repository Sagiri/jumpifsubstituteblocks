#include "global.h"

bool makes_sound(u16 move) {
    for (u16* curr_move = moveids_sound_based; *curr_move != 0xFFFF; ++curr_move) {
        if (*curr_move == move) return true;
    }

    return false;
}

bool substitute_blocks_move(u8 attacker, u8 defender, u16 move) {
    if (!(battle_data[defender].status2 & STATUS2_SUBSTITUTE))
        return false;
    else if (makes_sound(move) && SOUND_BYPASSES_SUBSTITUTE)
        return false;
    else if (battle_data[attacker].ability == ABILITY_INFILTRATOR)
        return false;
    else
        return true;
}

void atkxx_jumpifsubstituteblocks() {
    if (substitute_blocks_move(b_attacker, b_defender, b_move))
        b_movescr_cursor = T1_READ_PTR(b_movescr_cursor + 1);
    else
        b_movescr_cursor += 5;
}