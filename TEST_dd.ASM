
          LIST    p=16F84 ; PIC16F84 is the target processor

           #include "P16F84.INC" ; Include header file

           CBLOCK 0x10   ; Temporary storage
              state
              l1,l2,l3,l4
           ENDC
		 __CONFIG _CP_OFF & _WDT_OFF & _PWRTE_ON & _HS_OSC

          

           org     0               ; Start up vector.
           goto    setports        ; Go to start up code.

	   org     4               ; Interrupt vector.
halt       goto    halt            ; Sit in endless loop and do nothing.

setports   clrw                    ; Zero in to W.
           movwf   PORTA           ; Ensure PORTA is zero before we enable it.
           movwf   PORTB           ; Ensure PORTB is zero before we enable it.
           bsf     STATUS,RP0      ; Select Bank 1
           clrw                    ; Mask for all bits as outputs.
           movwf   TRISB           ; Set TRISB register.
	     movlw   B'11111100'
		movwf   TRISA           
           bcf     STATUS,RP0      ; Reselect Bank 0.

initialise clrw                    ; Initial state.
           movwf   state           ; Set it.

               
test	  


           
 
test1        btfsc   PORTA,2
              goto test2 
             btfss   PORTA,3
	        goto BBA
              goto COLONNE

test2        btfsc   PORTA,3
              goto test3
 	        goto prog2
test3        btfsc   PORTA,4
              goto test1
               goto POINT



BBA        movlw   32
           movwf   l4
bba1       call CLEAR
           BSF PORTA,1
           BSF PORTA,0
	   BCF PORTA,0
           BCF PORTA,1

               call P
	       call R
               call O
               call J
	       call E
               call T
	       call S
               call espace
               call D
	       call E
               
              decfsz l4
	      goto   bba1 
           
DEP         movlw   32
           movwf   l4
DEP1       call CLEAR
           BSF PORTA,1
           BSF PORTA,0
	   BCF PORTA,0
           BCF PORTA,1

               call L
               call I
               call c
	       call E
               call N
               call c
               call E
               call espace
	       call II
               call O
               call i
               call VI


              decfsz l4
		goto DEP1


	         goto test 



POINT       

  	   movlw   B'00000001'
	   movwf   PORTB      
	   call aff

	   movlw   B'00000010'
	   movwf   PORTB      
	   call aff

	   movlw   B'00000100'
	   movwf   PORTB      
	   call aff

	   movlw   B'00001000'
	   movwf   PORTB      
	   call aff

	   movlw   B'00010000'
	   movwf   PORTB      
	   call aff

	   movlw   B'00100000'
	   movwf   PORTB      
	   call aff

	   movlw   B'01000000'
	   movwf   PORTB      
	   call aff

	   movlw   B'10000000'
	   movwf   PORTB      
	   call aff

  	   movlw   B'00000000'
	   movwf   PORTB 
           goto    test1            ; And loop :-)

prog2
  	   movlw   B'00000001'
	   movwf   PORTB      
	   call aff1

	   movlw   B'00000010'
	   movwf   PORTB      
	   call aff1

	   movlw   B'00000100'
	   movwf   PORTB      
	   call aff1

	   movlw   B'00001000'
	   movwf   PORTB      
	   call aff1

	   movlw   B'00010000'
	   movwf   PORTB      
	   call aff1

	   movlw   B'00100000'
	   movwf   PORTB      
	   call aff1

	   movlw   B'01000000'
	   movwf   PORTB      
	   call aff1

	   movlw   B'10000000'
	   movwf   PORTB      
	   call aff1

  	   movlw   B'00000000'
	   movwf   PORTB 
           goto    test1  

COLONNE
  	   movlw   B'11111111'
	   movwf   PORTB 
	   call aff
           goto    test1 

CLEAR
          movlw   64
	  movwf   l2
	   
           BCF PORTA,1
	   
CLR        BSF PORTA,0
	   BCF PORTA,0
           decfsz  l2
           goto CLR
           return

aff1        
           movlw   32
           movwf   l3

           BSF PORTA,1
af1        BSF PORTA,0
	   BCF PORTA,0
	   decfsz  l3
	   goto af1
	   call wait
	   return

aff        movlw   32
           movwf   l3

           BSF PORTA,1
           BSF PORTA,0
	   BCF PORTA,1

af         BSF PORTA,0
	   BCF PORTA,0
	   call wait	
           
 	   decfsz  l3
           goto    af
	   return

           ; Function using two loops to achieve a delay.
wait5      movlw   32
           movwf   l3
	   decfsz  l3
           goto    wait5
	   return
wait       
           movlw  2
           movwf   l1

w1         call    wait2
           decfsz  l1
           goto    w1
	   BSF PORTA,0
           BCF PORTA,0
           return

wait2      clrf    l2
w2         decfsz  l2
           goto    w2
           return






c              movlw B'00111110'
               movwf PORTB 
               call wait
               movlw B'01000001'
               movwf PORTB 
               call wait
               movlw B'01000001'
               movwf PORTB
               call wait
               movlw B'01000001'
               movwf PORTB
               call wait
               movlw B'00100010'
               movwf PORTB
               call wait

               movlw B'0000000'
               movwf PORTB
               call wait
		   return

D              movlw B'01000001'
               movwf PORTB
               call wait
               movlw B'01111111'
               movwf PORTB
               call wait
               movlw B'01000001'
               movwf PORTB
               call wait
               movlw B'01000001'
               movwf PORTB
               call wait
	       movlw B'00111110'
               movwf PORTB
               call wait
               movlw B'00000000'
               movwf PORTB
               call wait
		return

E              
	       movlw B'01111111'	
               movwf PORTB
               call wait
               movlw B'01001001'	
               movwf PORTB
               call wait
               movlw B'01001001'	
               movwf PORTB
               call wait
  	       movlw B'01001001'
               movwf PORTB
               call wait

               movlw B'00000000'
               movwf PORTB
               call wait
		return

I             
               movlw B'01000001'
               movwf PORTB
               call wait
               movlw B'01111111'
               movwf PORTB
               call wait 
               movlw B'01000001'
               movwf PORTB
               call wait


               movlw B'00000000'
               movwf PORTB
               call wait
               return

J              
               movlw B'00110000'
               movwf PORTB
               call wait
               movlw B'01000001'	
               movwf PORTB
               call wait

               movlw B'01000001'
               movwf PORTB
               call wait
               movlw B'00111111'
               movwf PORTB
               call wait
               movlw B'00000001'
               movwf PORTB
               call wait
               movlw B'00000000'
               movwf PORTB
               call wait
		return

L              movlw B'01111111'	
               movwf PORTB
               call wait
               movlw B'01000000'	
               movwf PORTB
               call wait
	       movlw B'01000000'
               movwf PORTB
               call wait
               movlw B'01000000'
               movwf PORTB
               call wait

               movlw B'00000000'
               movwf PORTB
               call wait
		return



N              movlw B'01111111'
               movwf PORTB
               call wait
               movlw B'00000010'
               movwf PORTB
               call wait
               movlw B'00000100'
               movwf PORTB
               call wait 
               movlw B'00001000'
               movwf PORTB
               call wait
               movlw B'01111111'
               movwf PORTB
               call wait

               movlw B'00000000'
               movwf PORTB
               call wait
               return

O              movlw B'00111110'

               movwf PORTB
               call wait
               movlw B'01000001'
               movwf PORTB
               call wait
               movlw B'01000001'
               movwf PORTB
               call wait
               movlw B'01000001'
               movwf PORTB
               call wait 
               movlw B'00111110'
               movwf PORTB
               call wait

               movlw B'00000000'
               movwf PORTB
               call wait
               return

P	       movlw   B'01111111'   
	       movwf   PORTB      
	       call wait
	       movlw   B'00001001'
               movwf   PORTB 
	       call wait  
	       movlw   B'00001001'
               movwf   PORTB 
	       call wait         
	       movlw   B'00001001'
	       movwf  PORTB
	       call wait
               movlw  B'000000110'  
               movwf  PORTB
               call wait
               movlw  B'00000000'
               movwf  PORTB 
               call wait
		return



R              movlw B'01111111'	
               movwf PORTB
               call wait
               movlw B'00001001'
               movwf PORTB
               call wait
               movlw B'00011001'
               movwf PORTB
                call wait
               movlw B'00111001'

               movwf PORTB
                call wait
               movlw B'01000110'
               movwf PORTB
               call wait
               movlw B'00000000'
               movwf PORTB
               call wait
               return

T             
               movlw B'00000001'
               movwf PORTB
               call wait
               movlw B'00000001'
               movwf PORTB
               call wait
               movlw B'01111111'
               movwf PORTB
               call wait 
               movlw B'00000001'
               movwf PORTB
               call wait
               movlw B'00000001'
               movwf PORTB
               call wait
               movlw B'00000000'
               movwf PORTB
               call wait
	       return
  
S              movlw B'00100110'
               movwf PORTB
               call wait
               movlw B'01001001'
               movwf PORTB
               call wait
               movlw B'01001001'
               movwf PORTB
               call wait 
               movlw B'01001001'
               movwf PORTB
               call wait
               movlw B'00110010'
               movwf PORTB
               call wait

               movlw B'000000000'
               movwf PORTB
               call wait
               return



V              movlw B'00011111'
               movwf PORTB
               call wait
               movlw B'00100000'
               movwf PORTB
               call wait
               movlw B'01000000'
               movwf PORTB
               call wait 
               movlw B'00100000'
               movwf PORTB
               call wait
               movlw B'00011111'
               movwf PORTB
               call wait
               movlw B'00000000'
               movwf PORTB
               call wait
               return

VI             movlw B'00110110'
               movwf PORTB
               call wait
               movlw B'01001001'
               movwf PORTB
               call wait
               movlw B'01001001'
               movwf PORTB
               call wait 
               movlw B'01001001'
               movwf PORTB
               call wait
               movlw B'00110010'
               movwf PORTB
               call wait

               movlw B'000000000'
               movwf PORTB
               call wait
               return



II             movlw B'01000010'
               movwf PORTB
               call wait
               movlw B'01100001'
               movwf PORTB
               call wait
               movlw B'01010001'
               movwf PORTB
               call wait 
               movlw B'01001001'
               movwf PORTB
               call wait
               movlw B'01000110'
               movwf PORTB
               call wait
               movlw B'00000000'
               movwf PORTB
               call wait
               return

i 
               movlw B'00000010'
               movwf PORTB
               call wait
               movlw B'01111111'
               movwf PORTB
               call wait
               movlw B'00000000'
               movwf PORTB
               call wait
               return



espace       
	       movlw B'00000000'
               movwf PORTB
               call wait
               movlw B'00000000'
               movwf PORTB
               call wait
               movlw B'00000000'
               movwf PORTB
               call wait           
		return		

           END
