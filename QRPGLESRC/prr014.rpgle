     C* Variable Declaration
     D a               S              4S 2 INZ(11.23)
     D b               S              4S 2 INZ(9.34)
     D result          S              4S 1

     C* ADD
     C     a             ADD(H)    b             result
     C     result        DSPLY

     C* SUB
     C     a             SUB(H)    b             result
                         DSPLY     %char(result);

     C* Z-ADD
     C                   Z-ADD(H)  b             result
                         DSPLY     %char(result);

     C* Z-SUB
     C                   Z-SUB(H)  b             result
                         DSPLY     %char(result);

     C* MULT
     C     a             MULT(H)   b             result
                         DSPLY    %char(result);

     C                   SETON                                        LR
