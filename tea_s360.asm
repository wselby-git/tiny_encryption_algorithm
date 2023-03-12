         ORG    0

         ENTRY  TEA

block    DS     1F
key      DC     X'12345678', X'23456789', X'3456789A', X'456789AB'
         CSECT

TEA      L       0,block
         L       1,key
         LR      2,0
         LARL    0,LOOP
         BAL     14,LOOP
         RETURN  (14,12),RC=(15)
         
LOOP     SLA     2,4
         A       2,(1)
         A       3,(1,4)
         SRDA    2,5
         XOR     2,3
         A       2,(1,8)
         A       3,(1,12)
         SLA     3,4
         XOR     2,3
         SRDA    2,5
         A       2,(1,16)
         A       3,(1,20)
         BCT     0,LOOP
         SRDA    2,32
         RETURN  (14,12),RC=(15)
