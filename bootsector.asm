; made my abdowns (me) @ github.com/abdowns Copyright 2022

use16
org 0x7c00

; Clear screen
mov ax, 3 ; video mode = 3
int 10h
;


mov si, github
mov ah, 0xE

displaychar:
	mov al, [si] ; store value of si in al
	inc si
	cmp al, 0
	je stopdisplay
	; Display current cycled character
	int 0x10
	jmp displaychar
	

stopdisplay:
	cli
	hlt ; stop system

github: db "github.com/abdowns",0

times 510 - ($-$$) db 0
dw 0xaa55
