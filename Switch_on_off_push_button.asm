        org     0xa0000000
        CODE32
PORT0   equ     0xffffd400
PORT2   equ     0xffffd420
pc0     equ     0
pc1     equ     4
pc2     equ     8
pdat    equ     12

main    NOP

;-------------------------------
;       Initialisations
;-------------------------------
        ldr     r10,=PORT0
        ldr     r0,=0x0
        ldr     r1,=0xffff
        strh    r1,[r10,#pc0]
        strh    r0,[r10,#pc1]
        strh    r1,[r10,#pc2]
        ldr     r11,=PORT2
        strh    r1,[r11,#pc0]
        strh    r0,[r11,#pc1]
        strh    r0,[r11,#pc2]

;-------------------------------
;       Boucle principale
;-------------------------------
bcl
        strh    r0,[r10,#pdat]
        mov     r2,r0
        teq     r0,r2

        bleq     pine
        bne      bcl

pine
        ldr     r0,[r11,#pdat]
        ands    r3,r0,#0x400
        ldrne   r0,=0xffff
        beq    fion
loop
        mov     pc,lr

fion
        ldr     r0,[r11,#pdat]
        ands    r3,r0,#0x800
        ldrne   r0,=0x0

        b loop

        end     main