           LIST    p=16F84A ; PIC16F84 is the target processor
           #include "P16F84A.INC" ; Include header file
           CBLOCK 0x10   ; Temporary storage
              state
              l1,l2,l3,l4,l5,cont,cun,bbb,onetow
           ENDC 
 __CONFIG _CP_OFF & _WDT_OFF & _PWRTE_ON & _HS_OSC
 adr EQU 0x0f
ORG 0x2100   ; début de la zone EEPROM 
DE  7f,9,9,9,6,07f,9,19,29,46,03e,41,41,41,3e,030,41,41,3f,1,07f,49
DE  49,49,01,1,7f,1,1,041,7f,41,41,3e,07f,40,40,40,041,7f,41,03e,41
DE  41,41,22,07f,2,4,8,7f,042,61,51,4e,036,49,49,36,02,7f
             ; mettre 7f dans 0x2100, 9 dans 0x2101 etc. 
             ; DE veut dire Data Eeprom       
           org     100h              ; Start up vector.
               ; Go to start up code.
 clrw                    ; Zero in to W.
 movwf   PORTA           ; Ensure PORTA is zero before we enable it.7
 movwf   PORTB           ; Ensure PORTB is zero before we enable it. 
 bsf     STATUS,RP0      ; Select Bank 1
 clrw                  ; Mask for all bits as outputs.
 movwf   TRISB           ; Set TRISB register.	    
 movlw 1c	
 movwf   TRISA           
 bcf     STATUS,RP0      ; Reselect Bank 0.
 clrw                    ; Initial state.
 movwf   state           ; Set it.
        movlw 40
        movwf onetow
           BSF PORTA,1
           BSF PORTA,0
	   BCF PORTA,1
movlw 4
movwf cun
start
btfsc PORTA,2 
goto colon
btfsc PORTA,3
goto phrase
goto start
;********************
colon
movlw 0ff
movwf PORTB
movlw 80
movwf l4
tt
movlw 40
movwf l5
bbbb
call wait
decfsz l5
goto bbbb
call decl
decfsz l4
goto tt
clrw
movwf PORTB
goto start
;********************
phrase
movlw 50
movwf l4
projet
movlw 3e
movwf cont 
call P
call R
call O
call J
call E
call T
call decl
clrw
movwf PORTB
call decl
clrw
movwf PORTB
call D
call E
call espace
decfsz l4
goto projet
;********************
movlw 50
movwf l4
licence
movlw 40
movwf cont
call vide
call L
call I
call Cc
call E
call N
call Cc
call E
call espace
decfsz l4
goto licence
;********************
movlw 200
movwf l4
d2018 
movlw 40
movwf cont
call vide
call vide 
call vide
call ii
call O
call i
call xii
call espace
decfsz l4
goto d2018
goto start
;********************
P
movlw 0
movwf adr
  movlw 5
call boucle
return
;********************
R
movlw 5
movwf adr
  movlw 5
call boucle
return
;********************
O
movlw 0a
movwf adr
  movlw 5
call boucle
return
;********************
J
movlw 0f
movwf adr
  movlw 5
call boucle
return
;********************
E
movlw 014
movwf adr
  movlw 4
call boucle
return
;********************
T 
movlw 18
movwf adr
  movlw 5
call boucle
return
;********************
D 
movlw 1d
movwf adr
  movlw 5
call boucle
return
;********************
L 
movlw 22
movwf adr
  movlw 4
call boucle
return
;********************
I 
movlw 26
movwf adr
  movlw 3
call boucle
return
;********************
Cc 
movlw 29
movwf adr
  movlw 5
call boucle
return
;********************
N
movlw 2e
movwf adr
  movlw 5
call boucle
return 
;*******************
ii 
movlw 33
movwf adr
  movlw 4
call boucle
return
;********************
xii  
movlw 37
movwf adr
  movlw 4
call boucle
return
;********************
i 
movlw 3b
movwf adr
  movlw 2
call boucle
return
;********************
boucle  movwf l3 
decf cont,1
subwf cont,1      
PP call lec 
incf adr
decfsz l3
goto PP
call decl
clrw
movwf PORTB

return
;********************
espace 
call decl
clrw
movwf PORTB
decfsz cont
goto espace
return
;********************
vide 
call decl
clrw
movwf PORTB

decfsz cun
goto vide
movlw 4
movwf cun
subwf cont,1
return
;********************
wait       movlw  5
           movwf   l1
w1         movlw 249
           movwf l2
           decfsz  l2
           goto $-1
           decfsz l1
           goto  w1
           return
lec ;****************  
movf 0x0f , w
movwf EEADR ; adresse à lire dans registre EEADR
bsf STATUS , RP0 ; passer en banque1
bsf EECON1 , RD ; lancer la lecture EEPROM
bcf STATUS , RP0 ; repasser en banque0
call decl
movf EEDATA , w ; charger valeur lue dans W
movwf PORTB
call wait
return
 decl ;**************** 
 decfsz onetow
     goto tow
     movlw 40
     movwf onetow
           BSF PORTA,1
           BSF PORTA,0
	   BCF PORTA,1
  tow  BSF PORTA,0
       BCF PORTA,0
  return
           END






