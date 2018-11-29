
_Move_Delay:

;MyProject.c,24 :: 		void Move_Delay() {                  // Function used for text moving
;MyProject.c,25 :: 		Delay_ms(500);                     // You can change the moving speed here
	MOV	#16, W8
	MOV	#16964, W7
L_Move_Delay0:
	DEC	W7
	BRA NZ	L_Move_Delay0
	DEC	W8
	BRA NZ	L_Move_Delay0
;MyProject.c,26 :: 		}
L_end_Move_Delay:
	RETURN
; end of _Move_Delay

_main:
	MOV	#2048, W15
	MOV	#6142, W0
	MOV	WREG, 32
	MOV	#1, W0
	MOV	WREG, 52
	MOV	#4, W0
	IOR	68

;MyProject.c,30 :: 		void main(){
;MyProject.c,31 :: 		ADPCFG = 0xFFFF;                   // Configure AN pins as digital I/O
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#65535, W0
	MOV	WREG, ADPCFG
;MyProject.c,33 :: 		Lcd_Init();                        // Initialize LCD
	CALL	_Lcd_Init
;MyProject.c,35 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOV.B	#1, W10
	CALL	_Lcd_Cmd
;MyProject.c,36 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	MOV.B	#12, W10
	CALL	_Lcd_Cmd
;MyProject.c,37 :: 		Lcd_Out(1,6,txt3);                 // Write text in first row
	MOV	#lo_addr(_txt3), W12
	MOV	#6, W11
	MOV	#1, W10
	CALL	_Lcd_Out
;MyProject.c,39 :: 		Lcd_Out(2,6,txt4);                 // Write text in second row
	MOV	#lo_addr(_txt4), W12
	MOV	#6, W11
	MOV	#2, W10
	CALL	_Lcd_Out
;MyProject.c,40 :: 		Delay_ms(2000);
	MOV	#62, W8
	MOV	#2323, W7
L_main2:
	DEC	W7
	BRA NZ	L_main2
	DEC	W8
	BRA NZ	L_main2
	NOP
;MyProject.c,41 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOV.B	#1, W10
	CALL	_Lcd_Cmd
;MyProject.c,43 :: 		Lcd_Out(1,1,txt1);                 // Write text in first row
	MOV	#lo_addr(_txt1), W12
	MOV	#1, W11
	MOV	#1, W10
	CALL	_Lcd_Out
;MyProject.c,44 :: 		Lcd_Out(2,5,txt2);                 // Write text in second row
	MOV	#lo_addr(_txt2), W12
	MOV	#5, W11
	MOV	#2, W10
	CALL	_Lcd_Out
;MyProject.c,46 :: 		Delay_ms(2000);
	MOV	#62, W8
	MOV	#2323, W7
L_main4:
	DEC	W7
	BRA NZ	L_main4
	DEC	W8
	BRA NZ	L_main4
	NOP
;MyProject.c,49 :: 		for(i=0; i<4; i++) {               // Move text to the right 4 times
	MOV	#lo_addr(_i), W1
	CLR	W0
	MOV.B	W0, [W1]
L_main6:
	MOV	#lo_addr(_i), W0
	MOV.B	[W0], W0
	CP.B	W0, #4
	BRA LTU	L__main24
	GOTO	L_main7
L__main24:
;MyProject.c,50 :: 		Lcd_Cmd(_LCD_SHIFT_RIGHT);
	MOV.B	#28, W10
	CALL	_Lcd_Cmd
;MyProject.c,51 :: 		Move_Delay();
	CALL	_Move_Delay
;MyProject.c,49 :: 		for(i=0; i<4; i++) {               // Move text to the right 4 times
	MOV.B	#1, W1
	MOV	#lo_addr(_i), W0
	ADD.B	W1, [W0], [W0]
;MyProject.c,52 :: 		}
	GOTO	L_main6
L_main7:
;MyProject.c,54 :: 		while(1) {                         // Endless loop
L_main9:
;MyProject.c,55 :: 		for(i=0; i<8; i++) {             // Move text to the left 7 times
	MOV	#lo_addr(_i), W1
	CLR	W0
	MOV.B	W0, [W1]
L_main11:
	MOV	#lo_addr(_i), W0
	MOV.B	[W0], W0
	CP.B	W0, #8
	BRA LTU	L__main25
	GOTO	L_main12
L__main25:
;MyProject.c,56 :: 		Lcd_Cmd(_LCD_SHIFT_LEFT);
	MOV.B	#24, W10
	CALL	_Lcd_Cmd
;MyProject.c,57 :: 		Move_Delay();
	CALL	_Move_Delay
;MyProject.c,55 :: 		for(i=0; i<8; i++) {             // Move text to the left 7 times
	MOV.B	#1, W1
	MOV	#lo_addr(_i), W0
	ADD.B	W1, [W0], [W0]
;MyProject.c,58 :: 		}
	GOTO	L_main11
L_main12:
;MyProject.c,60 :: 		for(i=0; i<8; i++) {             // Move text to the right 7 times
	MOV	#lo_addr(_i), W1
	CLR	W0
	MOV.B	W0, [W1]
L_main14:
	MOV	#lo_addr(_i), W0
	MOV.B	[W0], W0
	CP.B	W0, #8
	BRA LTU	L__main26
	GOTO	L_main15
L__main26:
;MyProject.c,61 :: 		Lcd_Cmd(_LCD_SHIFT_RIGHT);
	MOV.B	#28, W10
	CALL	_Lcd_Cmd
;MyProject.c,62 :: 		Move_Delay();
	CALL	_Move_Delay
;MyProject.c,60 :: 		for(i=0; i<8; i++) {             // Move text to the right 7 times
	MOV.B	#1, W1
	MOV	#lo_addr(_i), W0
	ADD.B	W1, [W0], [W0]
;MyProject.c,63 :: 		}
	GOTO	L_main14
L_main15:
;MyProject.c,64 :: 		}
	GOTO	L_main9
;MyProject.c,84 :: 		}
L_end_main:
	POP	W12
	POP	W11
	POP	W10
L__main_end_loop:
	BRA	L__main_end_loop
; end of _main
