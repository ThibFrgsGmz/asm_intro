      org 0xa0000000
      CODE32
PORT  equ 0xffffd400
pc0   equ 0
pc1   equ 4
pc2   equ 8
pdat  equ 12
NB    equ 5

main    NOP

        ldr     r10,=PORT
        ldr     r0,=0
        ldr     r1,=0xffff
        strh    r1,[r10,#pc0]
        strh    r0,[r10,#pc1]
        strh    r1,[r10,#pc2]

init    ldr   r4,=1
        ldr r1,=0
        ldr r0,=0xf
        ldr r2,=1
        ldr r6,=0xf0
        ldr r7,=0xf00
        ldr r8,=0xf000
bclmain
        strh  r0,[r10,#pdat]
        bl     tempo
        strh  r1,[r10,#pdat]
        bl     tempo
        strh  r6,[r10,#pdat]
        bl     tempo
        strh  r1,[r10,#pdat]
        bl     tempo
        strh  r7,[r10,#pdat]
        bl     tempo
        strh  r1,[r10,#pdat]
        bl     tempo
        strh  r8,[r10,#pdat]
        bl     tempo
        strh  r1,[r10,#pdat] 
        bl     tempo //aller
        strh  r7,[r10,#pdat]
        bl     tempo
        strh  r1,[r10,#pdat]
        bl     tempo
        strh  r6,[r10,#pdat]
        bl     tempo
        strh  r1,[r10,#pdat]
        bl     tempo
        strh  r0,[r10,#pdat]
        bl     tempo
        b     bclmain

        add r1,r1,r0
        subs r0, r0,#1
        cmp r0,#0
        bne bclmain
        strh r1,[r10,#pdat]
        cmp r1,#16
        ble numled
fin     B fin

NBR     equ 100000

tempo
        ldr r5,=100000
bbb     subs r5,r5,#1
        bne   bbb
        mov pc,lr

numled
        sub r1, r1,#1
        mov r2,r2, lsl r1
        strh r2,[r10,#pdat]

        end   main
