
.model SMALL
.STACK
.286
.data

	obj_X dw 0
	obj_Y dw 0 
	obj_Exists dw 0 ; bool

	paddle_XI = 120 ; constant
	paddle_X dw 120
	paddle_X_Min dw 10 ; constant
	paddle_X_Max dw 210 ; constant
	paddle_X_MaxT dw 210 ;temp
	PDS dw 50 ; constant
	PDTS dw 50 ;temp
	Paddle_Extended dw 0 ;bool

	ball_IX = 140 ; constant
	ball_IY = 115 ; constant
	ball_X sword 140
	ball_Y sword 15
	ball_velocity_X sword 0 
	ball_velocity_Y sword 1
	ballClr db 0Fh

	ball_max_velRand dw 2 ; constant
	ball_max_velDiv dw 3 ; constant

	ball_Xmax_Vel dw 1; constant
	ball_Xmin_vel dw -1 ; constant
	ball_Ymax_vel dw 1 ; constant

	pixel_read db 0

	titleStr db "---BRICK BREAKER---", '$'
    nameprompt db "Enter your name:", '$'
	nameLen dw ?
    username db 20 dup(0), 13

	menuPrompt1 db "Press enter for New Game", '$'
	menuPrompt2 db "press 'h' for High Scores", '$'
	menuPrompt3 db "press 'q' to quit", '$'
	
	instructionTitle db "<---INSTRUCTIONS--->", '$'
    instructionPrompt1 db "1. <- and -> arrow keys to move paddle", '$'
    instructionPrompt2 db "2. If the ball falls off the bottom of", '$'
    instructionPrompt2_5 db "the screen, you lose a life", '$'
    instructionPrompt3 db "3. If you lose all your lives, the", '$'
    instructionPrompt3_5 db "game is over", '$'
    instructionPrompt4 db "4. Destroy all the bricks to win", '$'
    instructionPrompt5 db "<---GOODLUCK--->", '$'

	pausePrompt db "---PAUSE---", '$'
	pauselvl db ?
	boolPause db 0
	pausebool db 0

	endPrompt db "---GAMEOVER---", '$'
	winPrompt db "---YOU WIN---", '$'
	returnPrompt db "Press enter to return to main menu", '$'
	nextLVLPrompt db "Press enter to go to next level", '$'

	levelPrompt db "LEVEL", '$'
	highscorePrompt db "---HIGHSCORE---", '$'
	highscorePrompt2 db "Press 'h' to return to main menu", '$'
	hsbool db 0

	score dw 0
	scorePrompt db "SCORE", '$'
	scoreStr db "$$$$$"

	;PXI, PXMi, PXMa, PDS, BIX, BIY, BMVR, BMVD, BXMaV, BXmiV, BYMaV, level  
	gameEnd dw 0
	programEnd db 0

	brick_X dw 20, 60, 100, 140, 180, 220, ; constant
			20, 60, 100, 140, 180, 220,
			20, 60, 100, 140, 180, 220,
			20, 60, 100, 140, 180, 220,
			20, 60, 100, 140, 180, 220,
			20, 60, 100, 140, 180, 220
			
	brick_Y dw 50, 50, 50, 50, 50, 50, ; constant
			60, 60, 60, 60, 60, 60, 
			70, 70, 70, 70, 70, 70,
			80, 80, 80, 80, 80, 80, 
			90, 90, 90, 90, 90, 90,		
			100, 100, 100, 100, 100, 100
			
			
			 
	brick_color dw 3, 1, 5, 2, 4, 3, 1, ; constant
			3, 1, 5, 2, 4, 3, 1,
			3, 1, 5, 2, 4, 3, 1,
			3, 1, 5, 2, 4, 3, 1,
			3, 1, 5, 2, 4, 3, 1,
			3, 1, 5, 2, 4, 3, 1

	brick_color_1 dw 3, 1, 5, 2, 4, 3, 1, ; constant
			3, 1, 5, 2, 4, 3, 1,
			3, 1, 5, 2, 4, 3, 1,
			3, 1, 5, 2, 4, 3, 1,
			3, 1, 5, 2, 4, 3, 1,
			3, 1, 5, 2, 4, 3, 1

	brick_color_2 dw 3, 6, 5, 2, 4, 3, 6, ; constant
			3, 6, 5, 2, 4, 3, 6,
			3, 6, 5, 2, 4, 3, 6,
			3, 6, 5, 2, 4, 3, 6,
			3, 6, 5, 2, 4, 3, 6,
			3, 6, 5, 2, 4, 3, 6

	brick_color_3 dw 2, 1, 5, 6, 4, 3, 1, ; constant
			2, 16h, 5, 2, 6, 16h, 1,
			2, 1, 5, 2, 6, 3, 1,
			0Fh, 1, 5, 2, 6, 16h, 1,
			2, 16h, 5, 0fh, 0fh, 0fh, 1,
			2, 1, 5, 2, 4, 3, 1

	hits dw lengthof brick_X dup(1) ; constant
	hits_1 dw lengthof brick_X dup(1) ; constant
	hits_2 dw lengthof brick_X dup(2) ;constant 
	hits_3 dw 3, 3, 3, 3, 3, 3, 3, ;constant
			3, 4, 3, 3, 3, 4, 3,
			3, 3, 3, 3, 3, 3, 3,
			1, 3, 3, 3, 3, 4, 3,
			3, 4, 3, 1, 1, 1, 3,
			3, 3, 3, 3, 3, 3, 3

	hits_Temp dw lengthof brick_X dup(0)
		

	heartLocation_x dw 151
    heartLocation_y dw 10
    heartCount db 0
    heart_X_offset dw 5
    heart_y_offset dw 6

 	hearts_x dw 280, 292, 304 ; constant
	hearts_y dw 10 ; constant

	dummy db '0', '$'
	level db '1'

	endl db 10, '$'
	spaces db "  $"
	centered db "              " , '$'

	lives_I = 3 ; constant
	lives dw ?

	bGC db 00 ; constant
	randVal dw 0

	timeAux db 0
	seconds db 0
	counter db 0

	filename db "hs.txt", 0
	fileinfo dw 0
	bufferSiz = 1000
	buffer dq bufferSiz dup("$")

.code

	jmp main

	openFile Macro 
		mov ah, 3dh
		mov al, 2
		mov dx, offset filename
		int 21h
		mov fileinfo, ax 


	endm

	readfile Macro 

		mov ah, 3fh
		mov bx, fileinfo
		mov cx, bufferSiz
		mov dx, offset buffer 
		int 21h

	endm 

	DecLives macro 

		mov cx, lives
		.if (cx == 0)
			drawHeart hearts_x[0], hearts_y, 99h
			jz endGame
		.endif 

		cmp cx, 2
		jne Delheart2
		drawHeart hearts_x[4], hearts_y, 99h
		Delheart2:

		cmp cx, 1
		jne Delheart1
		drawHeart hearts_x[2], hearts_y, 99h
		Delheart1:

	endm

	writeFile Macro len, ofst

		mov bx, fileinfo
		mov cx, 0
		mov ah, 42h
		mov al, 2
		mov dx, 0
		int 21h
		mov ah, 40h
		mov cx, len
		dec cx
		mov dx, ofst
		int 21h


	endm 

	strInp Macro ofs

		mov dx, ofs
		mov ah, 3fh
		int 21h

	endm

	strOpt Macro ofs

		mov dx, ofs
		mov ah, 09
		int 21h

	endm

	closeFile Macro 
		
		mov ah, 3eh ;service to close file.
		mov bx, fileinfo
		int 21h

	endm 

	outputScore macro 
		call scoreIntoStr

		writeChar 4, 34, scoreStr[0]
		writeChar 4, 35, scoreStr[1]
		writeChar 4, 36, scoreStr[2]
		writeChar 4, 37, scoreStr[3]


	endm

	outputf Macro ans
	
		push bx
		push dx
		
		mov dx, ans

		mov ax, 0

		mov ax, dx
		mov bx, 10
		div bx


		mov dx, 0
		;mov dl, al
		add al, 48
		pusha
		writeChar 4, 36, al
		popa
		mov dx, 0
		add ah, 48
		mov al, ah
		pusha
		writeChar 4, 37, al
		popa

		;mov ah, 0eH
		;mov al, dl
		;int 10h

		pop dx
		pop bx
	
	endm

	write Macro xc, yc, cll
			push cx
			push dx
			push ax
			mov ah, 0Ch
			mov al, cll
			mov bh, 0
			mov cx, xc
			mov dx, yc
			int 10h
			pop ax
			pop dx
			pop cx
		
	endm

	writeChar Macro xc, yc, chr
			push cx
			push dx
			push ax

			mov ah, 02h
			mov bh, 0
			mov dh, xc
			mov dl, yc
			int 10h

			mov ah, 0Ah
			mov al, chr
			mov bl, 0Fh
			mov bh, 0
			mov cx, 1
			int 10h

			pop ax
			pop dx
			pop cx


	endm

	digOpt Macro cou

		mov dl, cou
		add dl, 48
		mov ah, 0eH
		mov al, dl
		int 10h
	endm


	strOpt Macro ofs
		
		mov dx, ofs
		mov ah, 09
		int 21h
		
	endm

	drawPaddle Macro clc, siz


			mov cx, 5
			mov si, siz
			mov bx, 185
			push ax
			mov al, clc
			mov di, paddle_X
			call rectangle
			pop ax

	endm 

	sound macro freq, dur
		pusha
		mov al, 182
		out 43h, al
		mov ax, freq

		out 42h, al
		mov al, ah
		out 42h, al
		in al, 61h

		or al, 3
		out 61h, al
		mov bx, 25
		idk1:
			mov cx, dur
		idk2:
		dec cx
		jne idk2
		dec bx
		jne idk1
		in al, 61h

		and al, 252
		out 61h, al
		popa
	endm

	drawScoreboard Macro 

		mov cx, 190
		mov si, 45
		mov bx, 5
		push ax
		mov al, 99h
		mov di, 270
		call rectangle
		pop ax

		mov ah, 02h
        mov dh, 3
        mov dl, 34
        mov bx, 0
        int 10h
        lea dx, offset scorePrompt
        mov ah, 09h
        int 21h

		mov ah, 02h
        mov dh, 6
        mov dl, 34
        mov bx, 0
        int 10h
        lea dx, offset levelPrompt
        mov ah, 09h
        int 21h
		
		mov ah, level
		add ah, 48
		mov dummy, ah 
		mov ah, 02h
        mov dh, 7
        mov dl, 36
        mov bx, 0
        int 10h
        lea dx, offset dummy
        mov ah, 09h
        int 21h

		call printname
	endm

 	drawObj Macro xc, yc, clc

		push di
		push cx 
		push si
		push bx 
		
		mov obj_X, xc
		mov obj_Y, yc

		mov cx, 3
		mov si, 3
		mov bx, obj_Y
		push ax
		mov al, clc
		mov di, obj_X
		call rectangle

		pop ax
		pop bx
		pop si
		pop cx
		pop di


	endm 

	drawBall Macro clc
		push di
		push cx 
		push si
		push bx 

		mov cx, 5
		mov si, 5
		mov bx, ball_Y
		push ax
		mov al, clc
		mov di, ball_X
		call rectangle

		pop ax
		pop bx
		pop si
		pop cx
		pop di
	endm
	calUNLen proc uses si cx

		mov cx, 20
		mov si, 0
		.while(username[si] == 10)

			inc si
		.endw
		inc si
		mov nameLen, si
		ret
	calUNLen endp
	writeToFIle macro
	
		openFile
		;call calUNLen
		writeFile lengthof centered, offset centered
		writeFile 4, offset username

		writeFile lengthof spaces, offset spaces
		call scoreIntoStr

		writeFile lengthof scoreStr, offset scoreStr
		writeFile lengthof spaces, offset spaces
		mov ah, level
		add ah, 48
		mov dummy, ah 
		writeFile lengthof dummy, offset dummy
		;writeFile lengthof centered, offset centered
		writeFile lengthof endl, offset endl
		closeFile

	endm

	Move_Ball_Y Macro velo ; Moving ball in right direction with  edge ddetection

		push ax
		push bx

			mov ax, ball_Y
			mov bx, velo
			cmp bx, 0

			jg skipUp

			cmp ax, 10
			jbe notMoveBU
				add ax, velo
				jmp skipDown
			notMoveBU:
			mov cx, ball_Ymax_vel
			mov ball_velocity_Y, cx
			jmp skipDown
			skipUp:

			cmp ax, 190
			jae notMoveBD
				add ax, velo
				jmp skipDown
			notMoveBD:

				mov ball_X, ball_IX
				mov ball_Y, ball_IY
				mov ball_velocity_X, 0

				drawPaddle BGC, PDS
				mov paddle_X, paddle_XI
				drawPaddle 06, PDS
				sound 9121, 1000000
				dec lives

				jmp reset
			skipDown:
			mov ball_Y, ax
			
			reset:
		pop bx
		pop ax

	endm 

	Move_Ball_X Macro velo ; Moving ball in X direction with edge detection
	
		push ax
		push bx

			mov ax, ball_X

			mov bx, velo
			cmp bx, 0

			jg skipLeft


			cmp ax, 10
			jbe notMoveBL
				add ax, velo
				jmp skipRight
			notMoveBL:
			mov cx, ball_Xmax_Vel
			mov ball_velocity_X, cx
			jmp skipRight
			skipLeft:

			cmp ax, 254
			jae notMoveBR
				add ax, velo
				jmp skipRight
			notMoveBR:
				mov cx, ball_Xmin_vel
				mov ball_velocity_X, cx
			skipRight:
			mov ball_X, ax


		pop bx
		pop ax

	endm 


	PaddleRigth Macro

		push ax
			mov ax, paddle_X
			cmp ax, paddle_X_Max
			jae notMove
				add ax, 3
			notMove:
			mov paddle_X, ax
		pop ax

	endm

	
	PaddleLeft Macro

		push ax
			mov ax, paddle_X
			cmp ax, paddle_X_Min
			jbe notMove1
				sub ax, 3
			notMove1:
			mov paddle_X, ax
		pop ax

	endm

	backgroundClr Macro clc

		mov ah, 06h
		mov al, 0
		mov cx, 0
		mov dh, 80
		mov dl, 80 
		mov bh, clc
		int 10h

	endm

	checkTime Macro 

		push ax

		CTL:

			mov ah, 2Ch
			int 21h

			cmp dl, timeAux
			je CTL


		pop ax



	endm

	drawHeart macro x, y, clc
        mov ah, 0ch
        mov al, clc
        mov bh, 0
        mov cx, x
        mov dx, y

        call printHeart

    endm

	hitTemp_hits proc uses ax bx si di cx


		mov cx, lengthof brick_X		
		mov si, offset hits		
		mov di, offset hits_Temp
			

		l1:

			mov ax, [di] ;temp array
			mov bx, [si] ; original Array

			cmp bx, 0
			je noExchange

				mov [si], ax

			noExchange:
			
			add si, 2
			add di, 2

		loop l1

		ret
	hitTemp_hits endp

	Sec_Counter Macro 

		cmp Paddle_Extended, 0
		jz notExtended
			MOV AH,2Ch
			INT 21h
			cmp dh, seconds
			je notSecond
				inc counter
				mov seconds, dh
			notSecond:
			
		notExtended:

		cmp counter, 10
		jb bigPaddle
			
			drawPaddle BGC, PDS
			MOV Paddle_Extended, 0
			mov counter, 0
			mov ballClr, 0Fh

			
			
			call hitTemp_hits
			 

			mov ax, paddle_X_MaxT
			mov paddle_X_Max, ax

			mov ax, PDTS
			mov PDS, ax
			drawPaddle 12, PDS
		bigPaddle:

	endm


  	ReInt_Constants macro PXI, PXMi, PXMa, PDSiz, BIX, BIY, BVX, BVY, BMVR, BMVD, BXMaV, BXmiV, BYMaV, lvl 

		;mov paddle_XI, PXI
		mov paddle_X_Min, PXMi
		mov paddle_X_Max, PXMa
		mov paddle_X_MaxT, PXMa
		mov PDS, PDSiz
		mov PDTS, PDSiz
		mov ball_X, BIX
		mov ball_Y, BIY
		mov ball_velocity_X, BVX
		mov ball_velocity_Y, BVY
		mov ball_max_velRand, BMVR
		mov ball_max_velDiv, BMVD
		mov ball_Xmax_Vel, BXMaV
		mov ball_Xmin_vel, BXmiV
		mov ball_Ymax_vel, BYMaV
		mov level, lvl
		mov gameEnd, 0
		call copyConstantArr

	endm 
	;for special brick check lives if three then special brick is enbaled and if that specific brick is hit then 

	copyConstantArr proc uses cx si di
		mov cx, lengthof brick_X
		push cx
		.if (level == 2)
			mov si, offset brick_color
			push si
			mov di, offset brick_color_2
			push di
			call copyArr

			mov si, offset hits
			push si
			mov di, offset hits_2
			push di
			call copyArr

			
		.elseif (level == 3)
			mov si, offset brick_color
			push si
			mov di, offset brick_color_3
			push di
			call copyArr

			mov si, offset hits
			push si
			mov di, offset hits_3
			push di
			call copyArr

		.else 
			mov si, offset brick_color
			push si
			mov di, offset brick_color_1
			push di
			call copyArr

			mov si, offset hits
			push si
			mov di, offset hits_1
			push di
			call copyArr


		.endif 
		pop cx
		ret
	copyConstantArr endp

	copyArr proc
		push bp 
		mov bp, sp

		mov cx, [bp+8]
		mov si, [bp+6]
		mov di, [bp+4]

		l1:

			mov ax, [di]
			mov [si], ax

			
			add si, 2
			add di, 2

		loop l1

		pop bp
		ret 4
	copyArr endp

	main proc
	
		mov ax, @data
		mov ds, ax
		mov ax, 0
		
		mov ah, 00h
		mov al, 13h
		int 10h

		begin:
		mov score,0
		
		call titleDisplay
		.if(programEnd == 1)
			jmp gameExit
		.endif

		.if (hsbool == 1)
			call highscoreDisplay
			jmp begin
		.endif

		call nameInputDisplay
		call instructionDisplay

		
		;writeChar 0, 0, dummy
		ReInt_Constants 130, 10, 210, 50, 140, 15, 0, 1, 2, 3, 1, -1, 1, 1

		mov lives, lives_I
		mov pausebool, 1
		Lvl1:
			call game
			.if (boolPause == 1)
				call pauseDisplay
				mov boolPause, 0
				jmp Lvl1
			.endif

		
		
		.if (lives != 0)
		Lvl2:
			ReInt_Constants 130, 10, 225, 35, 140, 115, 0, 2, 1, 3, 2, -2, 2, 2
			mov pausebool, 2
			call game
			.if (boolpause == 2)
				call pauseDisplay
				mov boolPause, 0
				jmp Lvl2
			.endif
		.endif 

		
		.if (lives != 0)


		Lvl3:
			ReInt_Constants 130, 10, 240, 20, 140, 115, 0, 3, 1, 3, 3, -3, 3, 3 
			mov pausebool, 3
			call game
			.if (boolpause == 3)
				call pauseDisplay
				mov boolPause, 0
				jmp Lvl3
			.endif
		.endif 

		writeToFile
		jmp begin
		gameExit:
		backgroundClr BGC
		mov ah, 4ch
		int 21h
		
	main endp

	printHearts proc uses cx si 

		mov cx, lives
		cmp cx, 3
		jb print
			mov cx, 3
			mov lives, 3
		print:
		mov si, 0
		hearts:
			push cx
			push si
			drawHeart hearts_x[si], hearts_y, 04h
			
			pop si
			add si, 2
			pop cx
		loop hearts


		ret
	printHearts endp 

	create_Obj macro xc, yc, clc

		pusha
		cmp obj_Exists, 1
		je notCreate
		mov ax, xc
		add ax, 20
		mov dx, yc
		mov di, 0
		mov si, 10
		call rand
		mov bx, randVal
		
		cmp bx, 4
		
		jae notCreate
			mov obj_Exists, 1
			drawObj ax, dx, clc
		notCreate:
		popa
	endm
	game Proc uses cx si dx ax

		mov ax, 0
		cmp lives, 0
		je endGame
		
		backgroundClr BGC ; setting background colour
		drawScoreboard ; creating scorebaord
		outputScore ; outputting score
		;writeChar 40, 0, level
		.if (obj_Exists == 1)
			create_Obj obj_X, obj_Y, 0Eh
		.endif
		mov counter, 0
		mov Paddle_Extended, 0
		mov ballClr, 0Fh
		call printHearts		
		call drawBricks


		drawPaddle 12, PDS ; drawing paddle at initial position with paramters as paddle colour and paddle size

		drawBall ballClr
		l1:

			Sec_Counter
			
			checkTime ; for 100 FPS
			mov timeAux, dl
			
			DecLives
			call moveBall
			call moveObj
			call checkHits

			mov ax, gameEnd
			cmp ax, 01
			je win ; add functionality

			mov ah, 01
			int 16h


		jnz exit
		jmp l1

		exit:
			mov ah, 00
			int 16h
		
			;mov al, BGC
			;mov ah, 0eH
			;int 10h

			cmp ah, 01h
			je exit1
			cmp ah, 19h
			je pause
			
			

			cmp ah, 4Bh
			jne notLeft
				drawPaddle BGC, PDS
				PaddleLeft
				drawPaddle 12, PDS
			notLeft:

			cmp ah, 4Dh
			jne notRight
				drawPaddle BGC, PDS
				PaddleRigth
				drawPaddle 12, PDS
			notRight:

			
		

		jmp l1

		
		pause:
			.if (pausebool == 1)
				mov boolpause, 1
			.elseif (pausebool == 2)
				mov boolpause, 2
			.elseif (pausebool == 3)
				mov boolpause, 3
			.endif

			jmp exit1
		endGame:
			call gameOverDisplay
			jmp exit1
			win:
				call winDisplay
			exit1:
		ret
	game endp	

	

	hits_hitTemp proc uses ax cx si di

		
		mov cx, lengthof brick_X	
		mov si, offset hits_temp	
		mov di, offset hits
		
		l1:

			mov ax, [di]
			mov [si], ax

			cmp ax, 4
			je noChange

			cmp ax, 0
			je noChange

				mov ax, 1
			nochange:
			mov [di], ax
			add si, 2
			add di, 2

		loop l1

		ret
	
	hits_hitTemp endp

	ObjAbsorbed Macro 

		pusha
			mov di, 0
			mov si, 3
			call rand
			mov bx, randVal

			inc lives
			call printHearts
			
			cmp Paddle_Extended, 1
			je noExchange
			call hits_hitTemp
			noExchange:
		
			add PDS, 15
			sub paddle_X_Max, 15
			sub paddle_X, 8

			mov Paddle_Extended, 1
			mov counter , 0
			mov ballClr, 04


			MOV AH,2Ch
			INT 21h
			mov seconds, dh

		popa

	endm

	checkHits proc uses cx si ax

		mov cx, lengthof brick_X
		mov si, 0

		l1:


			mov ax, hits[si]

			cmp ax, 4
			je fixed
			cmp ax, 0
			jne notend
			fixed:
			add si, 2


		loop l1

			mov gameEnd, 1

		notend:

		ret
	checkHits endp


	readPixel Macro xc, yc

		push cx
		push dx
		push ax
			mov al, 0
			mov bh, 0
			mov cx, xc
			mov dx, yc
			mov ah, 0Dh
			int 10h
			mov pixel_read, al
			;outputf al
		pop ax
		pop dx
		pop cx


	endm

	checkBCorner Macro xc, yc

		mov cx, ball_X
		add cx, xc
		sub cx, 2
		mov dx, ball_Y
		add dx, yc
		sub dx, 2
		readPixel cx , dx 
		mov bl, pixel_read

	endm

	moveBall proc uses bx cx dx

	
		mov bx, 0

		checkBCorner 8, 8
		cmp bl, BGC
		jne changeUp

		checkBCorner 0, 0
		cmp bl, BGC
		jne changeUp

		checkBCorner 0, 8
		cmp bl, BGC
		jne changeUp
		
		checkBCorner 8, 0
		cmp bl, BGC
		jne changeUp

		;mov al, BGC
		;mov ah, 0eH
		;int 10h
		;writeChar 20, 20, BGC

		
		
		
		je noChangeUp
			changeUp:
			call breakBrick
			mov cx, ball_velocity_Y
			neg cx
			mov ball_velocity_Y, cx
			mov di, ball_max_velRand
			mov si, ball_max_velDiv
			call rand
			mov cx, randVal
			mov ball_velocity_X, cx
			
		noChangeUp:	

		drawBall BGC
		Move_Ball_Y ball_velocity_Y
		Move_Ball_X ball_velocity_X
		drawBall ballClr



		ret
	moveBall endp 

	
	moveObj proc uses cx dx bx  

		cmp obj_Exists, 1
		jne notMoveObj

		mov cx, obj_X
		add cx, 5
		mov dx, obj_Y
		;add dx, 4
		readPixel cx , dx 

		sub cx, 5
		;sub dx, 4

		mov bl, pixel_read

		cmp obj_Y, 190
		jae Disappear

		cmp bl, 0Ch
		jne notDisappear

			ObjAbsorbed

			Disappear:
			mov obj_Exists, 0
			drawObj cx, dx, pixel_read
			jmp notMoveObj
		notDisappear:
			
			
			drawObj cx, dx, pixel_read
			inc dx
			drawObj cx, dx, 0Eh
			mov obj_Y, dx
		notMoveObj:

		ret
	moveObj endp

	printHeart proc uses cx dx
        mov heartLocation_x, cx
        mov heartLocation_y, dx
        mov heartCount, 0
        mov heart_X_offset, 5
        mov heart_y_offset, 6

        sub cx, 5
        mov heartCount, 11
        heart1:
            int 10h
            inc cx
            dec heartCount
        jnz heart1

        dec dx
        mov cx, heartLocation_x
        sub cx, 4
        mov heartCount, 4
        heart2:
            int 10h
            inc cx
            dec heartCount
        jnz heart2

        mov cx, heartLocation_x
        add cx, 4
        mov heartCount, 4
        heart3:
            int 10h
            dec cx
            dec heartCount
        jnz heart3

        dec dx
        mov cx, heartLocation_x
        sub cx, 3
        mov heartCount, 2
        heart4:
            int 10h
            inc cx
            dec heartCount
        jnz heart4

        mov cx, heartLocation_x
        add cx, 3
        mov heartCount, 2
        heart5:
            int 10h
            dec cx
            dec heartCount
        jnz heart5

        mov cx, heartLocation_x
        mov dx, heartLocation_y
        inc dx
        sub cx, 5
        mov heartCount, 11
        mov bl, heartCount
        heart6:
            heart7:
                int 10h
                inc cx
                dec bl
            jnz heart7
            
           inc dx
            sub heartCount, 2
            mov bl, heartCount
            dec heart_X_offset
            mov cx, heartLocation_x
            sub cx, heart_X_offset
        
            dec heart_y_offset
        jnz heart6
        
        ret
    printHeart endp
  

	rectangle proc uses ax bx cx dx si di ; proc for drawing a rectangle/square
		
		mov dx, 0
		
		l1:	

				mov dx, di
				push cx 
				mov cx, si
				l2:
					write dx, bx, al
					inc dx
				loop l2
				inc bx
				pop cx
		
		loop l1

		

		
		ret
	rectangle endp

	check_Y macro Y

		
		mov ax, ball_Y
		add ax, Y
		dec ax 
		dec ax 
		dec ax
		cmp bx, ax


	endm 

	check_X macro X

		mov ax, ball_X
		add ax, X
		dec ax 
		dec ax 
		dec ax
		cmp di, ax


	endm 
	

	breakSpecialBrick proc uses cx si dx bx ax

		mov dl, 0
		again:
		mov cx, offset brick_X
		
		mov dh, dl
		l1:

			
			cmp dl, 5
			jae broken

			pusha
			checkTime ; for 100 FPS
			mov timeAux, dl
			popa
			
			
			mov di, 0
			mov si, 71
			call rand
			mov bx, randVal
			
			and bx, 1111110b
			
			mov si, bx

			cmp brick_color[bx], 0fh
			je broken

			cmp hits[si], 4 ;for checking fix bricks
			jz broken
			
			cmp hits[si], 0 ;for checking already broken bricks
			jz broken
			
			;cmp brick_color[bx], 0Fh
			;jz broken 

			push cx
			mov hits[si], 0
			mov al, BGC
			
			mov cx, 5
			mov bx, brick_Y[si]
			mov di, brick_X[si]	
			create_Obj brick_X[si], brick_Y[si], 0Eh
			mov si, 35
			call rectangle
			
			inc dl
			

			pop cx
			
			broken:
			
			
			dec cx
		cmp cx, 0
		jne l1

		cmp dh, dl
		je exit

		cmp dl, 5
		jb again

		
		exit:

		ret
	breakSpecialBrick endp
	

	breakBrick proc uses cx si bx ax di dx

		mov cx, lengthof brick_X
		mov si, 0
		
		l1:
			

			cmp hits[si], 4 ;for checking fix bricks
			jz broken

			cmp hits[si], 0 ;for checking already broken bricks
			jz broken
			
			mov bx, brick_Y[si]	
			mov di, brick_X[si]

			

			add bx, 5
			add di, 35

			
			cmp ball_velocity_Y, 0
			jg next3

			check_X 0
			jb next
		
				check_Y 0
				ja break

			next:
			
			check_X 10
			jb next3

				check_Y 0
				ja break
				jmp broken
			next3:
			
			check_X 10
			jb next1
				
				check_Y 10
				ja break

			next1:

			check_X 0
			jb next2

				check_Y 10
				ja break

			next2:

			
			broken:
			
			add si, 2
			dec cx
			cmp cx, 0
			jz notBreak
		jmp l1 

		jmp notBreak

		break:
			
			sound 7670, 1000

			;mov ax, hits[si]
			;outputf al
			;mov ax, si
			;outputf al
			;mov ah, 0eH
			;int 10h

			dec hits[si]
			cmp hits[si], 0
			jnz notBreak
			mov al, BGC
			mov cx, 5
			mov bx, brick_Y[si]
			mov di, brick_X[si]	
			push si
			mov si, 35
			call rectangle
			pop si

			mov ax, score 
			add ax, brick_color[si]
			mov score, ax
			outputScore

			;everything with score before this

			create_Obj brick_X[si], brick_Y[si], 0Eh

			cmp brick_color[si], 0Fh
			jne notBreak
				call breakSpecialBrick			

			
		notBreak:
		
		ret


	breakBrick endp

	drawBricks proc uses cx si

		mov cx, lengthof brick_X
		mov si, 0

		l1:

			.if (hits[si] == 0)
				jmp broken
			.endif
			push cx
			mov cx, 5
			mov bx, brick_Y[si]
			push ax
			mov ax, brick_color[si]
			mov di, brick_X[si]
			push si
			mov si, 35
			call rectangle
			pop si
			pop ax
			pop cx
			broken:
			add si, 2
		loop l1 


		ret
	drawBricks endp

	rand proc uses ax cx dx bx
		

		mov ah, 2Ch
		int 21h

		mov bx, 0
		mov ax, 0
		mov al, dl
		mov bx, si

		mov dx, 0
		mov cx, 0
		
		div bl
		mov al, ah
		mov ah, 0
		mov randVal, ax

		test ax, 11b
		jz exit
		
		test ax, di
		
		jz positive
			mov ax, si
			sub ax, di
			neg ax
			mov randVal, ax
			
		positive:
			
		exit:
		ret
	rand endp

	stupidPrint macro h, l, y, x
		pusha
		mov cx, h ;height
		mov si, l ;length
		mov bx, y ;y offset
		push ax
		mov al, 1000b
		mov di, x ;x offset
		call rectangle
		pop ax
		popa
	endm


	titleDisplay proc

		menuAgain:

        backgroundClr BGC ; setting background colour

		stupidPrint 27, 150, 45, 80

        mov ah, 02h
        mov dh, 135
        mov dl, 10
        mov bx, 0
        int 10h

        lea dx, offset titleStr
        mov ah, 09h
        int 21h

        mov ah, 02h
        mov dh, 0
        mov dl, 0
        mov bx, 0
        int 10h

        mov ah, 02h
        mov dh, 140
        mov dl, 7
        mov bx, 0
        int 10h
        lea dx, offset menuPrompt1
        mov ah, 09h
        int 21h

		mov ah, 02h
        mov dh, 145
        mov dl, 6
        mov bx, 0
        int 10h
        lea dx, offset menuPrompt2
        mov ah, 09h
        int 21h

		mov ah, 02h
        mov dh, 150
        mov dl, 10
        mov bx, 0
        int 10h
        lea dx, offset menuPrompt3
        mov ah, 09h
        int 21h

        mov ah, 02h
        mov dh, 0
        mov dl, 0
        mov bx, 0
        int 10h

		l1:

		
			mov ah, 01
			int 16h


		jnz exit
		jmp l1

		exit:
			mov ah, 00
			int 16h

			cmp ah, 1Ch
            jz ifEnter

			cmp ah, 10h
			jz gameExit

			cmp ah, 23h
			jz ifhs

		jmp l1
		gameExit:
			mov programEnd, 1

		ifhs:
			mov hsbool, 1

		ifEnter:
        
        ret
    titleDisplay endp

	instructionDisplay proc

        backgroundClr BGC

        mov ah, 02h
        mov dh, 1
        mov dl, 10
        mov bx, 0
        int 10h
        lea dx, offset instructionTitle
        mov ah, 09h
        int 21h

        mov ah, 02h
        mov dh, 6
        mov dl, 1
        mov bx, 0
        int 10h
        lea dx, offset instructionPrompt1
        mov ah, 09h
        int 21h

        mov ah, 02h
        mov dh, 8
        mov dl, 1
        mov bx, 0
        int 10h
        lea dx, offset instructionPrompt2
        mov ah, 09h
        int 21h

        mov ah, 02h
        mov dh, 9
        mov dl, 4
        mov bx, 0
        int 10h
        lea dx, offset instructionPrompt2_5
        mov ah, 09h
        int 21h

        mov ah, 02h
        mov dh, 11
        mov dl, 1
        mov bx, 0
        int 10h
        lea dx, offset instructionPrompt3
        mov ah, 09h
        int 21h

        mov ah, 02h
        mov dh, 12
        mov dl, 4
        mov bx, 0
        int 10h
        lea dx, offset instructionPrompt3_5
        mov ah, 09h
        int 21h

        mov ah, 02h
        mov dh, 14
        mov dl, 1
        mov bx, 0
        int 10h
        lea dx, offset instructionPrompt4
        mov ah, 09h
        int 21h

        mov ah, 02h
        mov dh, 20
        mov dl, 12
        mov bx, 0
        int 10h
        lea dx, offset instructionPrompt5
        mov ah, 09h
        int 21h

        l1:

		
			mov ah, 01
			int 16h


		jnz exit
		jmp l1

		exit:
			mov ah, 00
			int 16h

			cmp ah, 1Ch
            jz ifEnter

			cmp ah, 01h
			jz gameExit		

		jmp l1
		gameExit:
			mov programEnd, 1
		ifEnter:

        ret

    instructionDisplay endp

	pauseDisplay proc uses ax dx bx 

        backgroundClr BGC

        mov ah, 02h
        mov dh, 10
        mov dl, 14
        mov bx, 0
        int 10h
        lea dx, offset pausePrompt
        mov ah, 09h
        int 21h

		l1:

		
			mov ah, 01
			int 16h


		jnz exit
		jmp l1

		exit:
			mov ah, 00
			int 16h

			
				cmp al, 112
				jz ifPause
        	
		

		jmp l1

        

        ifPause:
        ret

    pauseDisplay endp

	scoreIntoStr proc

		pusha
		mov si, 4
		mov ax, score
		mov bl , 10
		
		.while(si!=0)
			mov dx, 0
			div bl 
			add ah, 48
			mov scoreStr[si-1], AH
			mov ah, 0
			mov dx, 0

			dec si

		.endw
		popa
		ret
	scoreIntoStr endp

	displayScore proc

		call scoreIntoStr

        mov ah, 02h
        mov dh, 4
        mov dl, 32
        mov bx, 0
        int 10h
        lea dx, offset scoreStr
        mov ah, 09h
        int 21h

        ret
    displayScore endp

	gameOverDisplay proc
        backgroundClr BGC ; setting background colour

        pusha
		mov cx, 27
		mov si, 148
		mov bx, 70
		push ax
		mov al, 1000b
		mov di, 80
		call rectangle
		pop ax
		popa

        mov ah, 02h
        mov dh, 10
        mov dl, 12
        mov bx, 0
        int 10h
        lea dx, offset endPrompt
        mov ah, 09h
        int 21h

        pusha
		mov cx, 32 ;height
		mov si, 80 ;length
		mov bx, 117 ;y offset
		push ax
		mov al, 1000b
		mov di, 109 ;x offset
		call rectangle
		pop ax
		popa

        mov ah, 02h
        mov dh, 15
        mov dl, 16
        mov bx, 0
        int 10h
        lea dx, offset scorePrompt
        mov ah, 09h
        int 21h
        
        call scoreIntoStr

		writeChar 17, 16, scoreStr[0]
		writeChar 17, 17, scoreStr[1]
		writeChar 17, 18, scoreStr[2]
		writeChar 17, 19, scoreStr[3]

		mov ah, 02h
		mov dh, 24
		mov dl, 3
		mov bx, 0
		int 10h
		lea dx, offset returnPrompt
		mov ah, 09h
		int 21h

		l1:

		
			mov ah, 01
			int 16h


		jnz exit
		jmp l1

		exit:
			mov ah, 00
			int 16h

			cmp ah, 1Ch
            jz ifEnter
		

		jmp l1

		ifEnter:

        ret
    gameOverDisplay endp

	printname proc

        writeChar 10, 35, username[0]
		writeChar 10, 36, username[1]
		writeChar 10, 37, username[2]

    ret
    printname endp

	winDisplay proc
        backgroundClr BGC ; setting background colour

        pusha
		mov cx, 27
		mov si, 148
		mov bx, 70
		push ax
		mov al, 1000b
		mov di, 80
		call rectangle
		pop ax
		popa

        mov ah, 02h
        mov dh, 10
        mov dl, 12
        mov bx, 0
        int 10h
        lea dx, offset winPrompt
        mov ah, 09h
        int 21h

        pusha
		mov cx, 32 ;height
		mov si, 80 ;length
		mov bx, 117 ;y offset
		push ax
		mov al, 1000b
		mov di, 109 ;x offset
		call rectangle
		pop ax
		popa

        mov ah, 02h
        mov dh, 15
        mov dl, 16
        mov bx, 0
        int 10h
        lea dx, offset scorePrompt
        mov ah, 09h
        int 21h
        
        call scoreIntoStr

		writeChar 17, 16, scoreStr[0]
		writeChar 17, 17, scoreStr[1]
		writeChar 17, 18, scoreStr[2]
		writeChar 17, 19, scoreStr[3]

		.if (level == 3)
			mov ah, 02h
			mov dh, 24
			mov dl, 3
			mov bx, 0
			int 10h
			lea dx, offset returnPrompt
			mov ah, 09h
			int 21h
		.else
			mov ah, 02h
			mov dh, 24
			mov dl, 3
			mov bx, 0
			int 10h
			lea dx, offset nextLVLPrompt
			mov ah, 09h
			int 21h
		.endif

		l1:

		
			mov ah, 01
			int 16h


		jnz exit
		jmp l1

		exit:
			mov ah, 00
			int 16h

			cmp ah, 1Ch
            jz ifEnter
		

		jmp l1

		ifEnter:

        ret
    winDisplay endp

	nameInputDisplay proc
		backgroundClr BGC ; setting background colour

		mov ah, 02h
        mov dh, 140
        mov dl, 6
        mov bx, 0
        int 10h
        lea dx, offset nameprompt
        mov ah, 09h
        int 21h

		mov si, offset username
        mov ah, 02h
        mov dh, 140
        mov dl, 22
        mov bx, 0
        int 10h
        ifNoEnter:		
            mov ah,01h
            int 21h
            mov [si],al
            inc si           
            inc nameLen
			mov ah, 01
            int 16h
            cmp al, 13
            jz ifEnter
        jmp ifNoEnter
        ifEnter:
			mov al, '$'
			mov [si], al

	ret
	nameInputDisplay endp

	highscoreDisplay proc
	backgroundClr BGC ; setting background colour
	mov hsbool, 0
	
	mov ah, 02h
	mov dh, 1
	mov dl, 12
	mov bx, 0
	int 10h
	lea dx, offset highscorePrompt
	mov ah, 09h
	int 21h

	openfile
	readfile
	mov ah, 02h
	mov dh, 5
	mov dl, 0
	mov bx, 0
	int 10h
	closefile
	strOpt offset buffer

	mov ah, 02h
	mov dh, 23
	mov dl, 4
	mov bx, 0
	int 10h
	lea dx, offset highscorePrompt2
	mov ah, 09h
	int 21h

	l1:
			mov ah, 01
			int 16h


		jnz exit
		jmp l1

		exit:
			mov ah, 00
			int 16h

			cmp ah, 23h
            jz ifEnter
		

		jmp l1

		ifEnter:

	ret
	highscoreDisplay endp

end