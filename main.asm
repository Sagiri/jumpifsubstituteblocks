.gba

.arm
.include "constants.s"

.thumb

.open "test.gba", 0x08000000

.org allocation

.area allocation_size
    .importobj "obj/relocatable.o"
.endarea

.close