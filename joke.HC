asm {
LABEL::
  PUSH RBP
  MOV RBP,RSP

  CLI
  HLT
  POP RBP
  RET
};
Call(LABEL);
