## JumpIfSubstituteBlocks

Adds a new command for move scripts, `jumpifsubstituteblocks` to Fire Red. Substitute does not block moves that are sound-based or coming from a Pokémon with the ability Infiltrator.

### What do I do before I build this?

If necessary, change `move_cmds` in `constants.s`. The given address of this table is for MrDollSteak's patch, so if it is there, you will not need to modify this. This is the table of commands for move scripts (e.g. `attackcanceler` and `attackstring`).

Update `ATK_JUMPIFSUBSTITUTEBLOCKS` in `constants.s`. It will need an unused move script command id.

If necessary, change `moveids_sound_based` in `constants.s`. The given address of this table is for MrDollSteak's patch, so if it is there, you will not need to modify this. This is the table of moves that are sound-based (e.g. Hyper Voice and Growl).

Sound-based moves only started bypassing Substitute in Gen VI. If you don't like that change, you can set `SOUND_BYPASSES_SUBSTITUTE` to `false` in `global.h`.

The build script will search for adequate free space, but if you need to insert the code in a particular place, you can tell it where to start looking by modifying `free-space` in `config.ini`. If the given address is acceptable (i.e. is word-aligned and has enough bytes of free space), it will be inserted there.

### How do I build this?

Click [here](scripts/makinoa/README.md) for build instructions.

### What do I do after I build this?

The syntax in your move script is just `jumpifsubstituteblocks ptr`. It'll be stepped over and do nothing if Substitute doesn't block; it it does block, script execution will continue from `ptr`.

### Credits

Port of the same command in [Egg's Pokeemerald Battle Engine](https://github.com/DizzyEggg/pokeemerald/blob/battle_engine_v2/src/battle_script_commands.c#L10534).