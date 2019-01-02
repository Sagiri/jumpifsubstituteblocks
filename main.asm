.gba

.arm
.include "constants.s"

.thumb

.open "test.gba", 0x08000000

.org allocation

.area allocation_size
    .importobj "obj/relocatable.o"

    // returns value on r0
    // all other registers are left untouched
    substitute_blocks_move_defaults_b_defender:
        push {r1-r3, lr}

        ldr r1, =b_defender

    substitute_blocks_move_defaults:
        ldrb r1, [r1]

        ldr r0, =b_attacker
        ldrb r0, [r0]

        ldr r2, =b_move
        ldrh r2, [r2]

        bl substitute_blocks_move
        pop {r1-r3, pc}

    substitute_blocks_move_defaults_b_active_side:
        push {r1-r3, lr}

        ldr r1, =b_active_side
        b substitute_blocks_move_defaults

    substitute_blocks_move_defaults_b_defender_partner:
        push {r1-r3, lr}

        ldr r1, =b_defender_partner
        b substitute_blocks_move_defaults

    .pool
.endarea

// atk07
.org 0x0801F1CA
.area 0x12, 0xFE
    ldr r0, =substitute_blocks_move_defaults_b_defender |1
    bl @@call
    mov r1, r0
    b 0x0801F1DC
    
    @@call:
        bx r0

    .pool
.endarea

// atk08
.org 0x0801F380
.area 0xE, 0xFE
    ldr r0, =substitute_blocks_move_defaults_b_defender |1
    bl @@call
    b 0x0801F38E

    .pool

    @@call:
        bx r0
.endarea

// atk0B
.org 0x0801F5D0
.area 0x10, 0xFE
    ldr r0, =substitute_blocks_move_defaults_b_active_side |1
    bl @@call
    b 0x0801F5E0

    @@call:
        bx r0

    .pool
.endarea

// atk0C
.org 0x0801F6E4
.area 0x10, 0xFE
    ldr r0, =substitute_blocks_move_defaults_b_active_side |1
    bl @@call
    b 0x0801F6F4

    @@call:
        bx r0

    .pool
.endarea

// atk5C
.org 0x0802584A
.area 0x10, 0xFE
    ldr r0, =substitute_blocks_move_defaults_b_active_side |1
    bl @@call
    b 0x0802585A

    @@call:
        bx r0

    .pool
.endarea

// atk69
.org 0x08026072
.area 0x12, 0xFE
    ldr r0, =substitute_blocks_move_defaults_b_defender |1
    bl @@call
    mov r1, r0
    b 0x08026084

    .pool

    @@call:
        bx r0
.endarea

// atkA5
.org 0x08029CF8
.area 0xE, 0xFE
    ldr r0, =substitute_blocks_move_defaults_b_defender |1
    bl @@call
    b 0x08029D06

    .pool

    @@call:
        bx r0
.endarea

// move_end_effects
.org 0x08020046
.area 0x16, 0xFE
    ldr r0, =substitute_blocks_move_defaults_b_defender_partner |1
    bl @@call
    b 0x0802005C

    @@call:
        bx r0

    .pool
.endarea

.org move_cmds + ATK_JUMPIFSUBSTITUTEBLOCKS * 4
.word atkxx_jumpifsubstituteblocks |1

.close