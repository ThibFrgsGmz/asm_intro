        org     0xa0000000
        CODE32
PORT    equ     0xfffffd400
pc0     equ     0
pc1     equ     4
pc2     equ     8
pdat    equ     12

main    NOP

;-------------------------------
;       Initialisations
;-------------------------------
        ldr     r10,=PORT
        ldr     r0,=0x10001
        ldr     r1,=0xffff
        strh    r1,[r10,#pc0]
        strh    r0,[r10,#pc1]
        strh    r1,[r10,#pc2]

;-------------------------------
;       Boucle principale
;-------------------------------
bclmain
        mov     r0, r0, ror #31
        strh    r0,[r10,#pdat]
        bl      tempo
        b       bclmain

NBR     equ     0xffff

tempo
        ldr     r5,=NBR
bbb     subs    r5,r5,#1
        bne     bbb
        mov     pc,lr

        end     main