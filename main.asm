.gba

.arm
.include "constants.s"

.thumb

.open "test.gba", 0x08000000

.org allocation

.area allocation_size
    .importobj "obj/relocatable.o"
.endarea

.org move_cmds + ATK_JUMPIFSUBSTITUTEBLOCKS * 4
.word atkxx_jumpifsubstituteblocks |1

.close