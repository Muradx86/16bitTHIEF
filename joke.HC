asm{
  MOV ECX,0x700
}
U0 Idk()
{
  I64 i=0;
  while(TRUE){
    HEY::
    RDTSC
    SHL    RDX,32
    MOV    EAX,EAX
    CMP ECX,1
    JZ DONE
    yield;
    RDMSR
    CMP EDX,0xFFFFFF
    SHR RDX,16
    JMP HEY
    DONE::
    IRETD
  }
}
Idk;
