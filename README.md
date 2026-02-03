# LIBASM

The goal of this project is to rewrite some libc functions in assembly

## Linux calling convention

### Parameters

RDI : parameter 1  
RSI : parameter 2  
RDX : parameter 3  
RCX : parameter 4  
R8  : parameter 5  
R9  : parameter 6  

parameters 7+ are on the stack  
8 first float parameters are in XMM0 to XMM7

### Return value

Return value in RAX (and RDX if >128bits)

Float returns in XMM0 (and sometimes XMM1)

If needed, return in stack with pointer in RAX

> [!CAUTION]
> Called functions can't modify registers: RBX, RBP and R12 to R15  
> These registers can be modified: RAX, RDI, RSI, RDX, RCX, R8 to R11 and XMM0 to XMM15

> [!WARNING]
> Stack need to be aligned on 16 bytes before calling

> [!NOTE]
> 128 bytes are protected below RSP

## INTEL Assembly summary

```asm
mov x, y    ;copy y to x
lea x, [y]  ;load y address to x

add x, y    ;Add y and x
sub x, y    ;Substract y and x

cmp  x, y   ;Compare y and x by substracting them
test x, y   ;Compare y and x by AND logic
test x, x   ;True if x == NULL (better than cmp x, 0)

je   x      ;Jump to x if flag ZF = 1
test x, x
je   y      ;Jump to y if x == NULL
jne  x      ;Jump to x if flag ZF = 0
jmp  x      ;Jump always

push x      ;Push x on stack
pop  x      ;Pop stack to x

call x      ;Call function x
ret  x      ;Return x

syscall     ;Make a syscall

and or xor  ;Logical operations
```

### Flags

Flags are set when doing certain instructions

ZF zero flag (1 if result is 0)  
SF ifgn flag (1 if result < 0)  
CF carry flag (1 if overflow in add ou sub)  
OF overflow flag  
PF parity flag (1 if pair)  
AF auxiliary flag  
