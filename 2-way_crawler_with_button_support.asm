        org     0xa0000000
        CODE32
PORT0   equ     0xffffd400
PORT2   equ     0xffffd420
pc0     equ     0
pc1     equ     4
pc2     equ     8
pdat    equ     12

; ------------------------------
;Valeur a comparer pour les BP
; ------------------------------
BP1     equ     0x0400
BP2     equ     0x0800
BP3     equ     0x1000
BP4     equ     0x2000

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
        ldr     r4,=0x10001

;-------------------------------
;       Boucle principale
;-------------------------------
bcl
        strh    r4,[r10,#pdat]
        mov     r4, r4, ror #31
        bl      tempo
        ldr     r1,[r11,#pdat]
        ands    r3, r1, #BP3
        blne    pine
        beq     bcl

pine
        strh    r4,[r10,#pdat]
        mov     r4, r4, ror #1
        bl      tempo
        ldr     r1,[r11,#pdat]
        ands    r3, r1, #BP3
        blne    bcl
        beq     pine

NBR_TEMPO       equ 50000

tempo
	ldr	r5,=NBR_TEMPO
bbb	subs	r5,r5,#1
	bne	bbb
	mov	pc,lr

        end     main