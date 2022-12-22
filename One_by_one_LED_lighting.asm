; Allumage des leds une par une

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

        ldr     r0,=0x0001

;-------------------------------
;       Boucle principale
;-------------------------------
bcl
        strh    r0,[r10,#pdat]
        teq     r0,r1
        moveq   r0,#0x0
        mov     r0,r0,lsl #1
        add     r0,r0,#1
        bl      tempo

        b       bcl

NBR     equ     0xffff

tempo
        ldr     r5,=NBR
bbb     subs    r5,r5,#1
        bne     bbb
        mov     pc,lr

        end     main
