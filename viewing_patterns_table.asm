        org     0xa0000000
        CODE32
PORT    equ     0xffffd400
pc0     equ     0
pc1     equ     4
pc2     equ     8
pdat    equ     12

main    NOP

;-------------------------------
;       Initialisations
;-------------------------------
        ldr     r10,=PORT
        ldr     r0,=0x0000
        ldr     r1,=0xffff
        strh    r1,[r10,#pc0]
        strh    r0,[r10,#pc1]
        strh    r1,[r10,#pc2]

;-------------------------------
;       Boucle principale
;-------------------------------
        ldr     r11,=table
        ldr     r1,=0
bcl
        ldrh    r0, [r11,r1]
        strh    r0,[r10,#pdat]
        bl      tempo
        add     r1, r1, #2
        cmp     r1, #8*2
        moveq   r1, #0
        b       bcl

NBR     equ     0xffff

tempo
        ldr     r5,=NBR
bbb     subs    r5,r5,#1
        bne     bbb
        mov     pc,lr

table   dc16    0x8001, 0x4002, 0x2004, 0x1008, 0x810, 0x420, 0x240, 0x180, 0

        end     main
