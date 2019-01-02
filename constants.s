.definelabel move_cmds, 0x0895F480              // mrds
ATK_JUMPIFSUBSTITUTEBLOCKS equ 0xFD

.definelabel moveids_sound_based, 0x08904800    // mrds

// -----------------------------------------------------------------------------

.definelabel battle_data, 0x02023BE4
.definelabel b_move, 0x02023D4A
.definelabel b_defender, 0x02023D6C
.definelabel b_attacker, 0x02023D6B
.definelabel b_active_side, 0x02023BC4
.definelabel b_defender_partner, 0x02023D6E
.definelabel b_movescr_cursor, 0x02023D74