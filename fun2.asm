org 0x7c00
bits 16
start:;dstry 0-0xffff when done es-0xf000
	cld
	xor eax,eax
	mov ss,ax
	mov sp,0x9000
	mov es,ax
	mov bx,ax
	mov ax,0x13
	int 0x10
dstry1:
	mov word [es:bx],0xADED
	inc bx
	cmp bx,0xffff
	jz done1
	jmp dstry1
done1:
	push es
	push ax
	mov ax,0xa000
	mov es,ax
	xor di,di
	mov cx,0xffff
	cld
	mov al,1
	rep stosb
	pop ax
	pop es
	jmp dstry2
dstry2:
	mov ax,0xf000
	mov es,ax
	xor bx,bx
lp:
	mov word [es:bx],0xdead
	inc bx
	cmp bx,0xffff
	jz done2
	jmp lp
done2:	
	push es
	push ax
	mov ax,0xa000
	mov es,ax
	xor di,di
	mov cx,0xffff
	cld
	mov al,4
	rep stosb
	pop ax
	pop es
	jmp stop
stop:
	hlt
	jmp stop
times 510-($-$$) db 0
dw 0xaa55
