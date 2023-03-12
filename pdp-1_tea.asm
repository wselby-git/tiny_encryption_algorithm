LOAD X1, 0  ;Load X1 with 0
LOAD X2, 1  ;Load X2 with 1

LOOP: 
    STORE X3, X1  ;Store X1 in X3
    ADD X1, X2  ;Add X2 to X1
    STORE X2, X3  ;Store X3 in X2
    LOAD X3, X1  ;Load X1 in X3
    COMP X3, 8  ;Compare X3 with 8
    BLEQ LOOP  ;If X3 is less than or equal to 8, loop

HALT  ;Halt program
