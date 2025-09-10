     C* Variable Declaration
     D a               S              2S 0 INZ(11)
     D b               S              2S 0 INZ(9)
     D d               S              2S 0 INZ(-22)
     D e               S              4S 0
     D f               S              4S 0
     D result          S              2S 0

     C* ADD
     C     a             ADD       b             result
     C     result        DSPLY
     C                   ADD       d             a
     C     a             DSPLY
     C                   ADD       22            d
     C     d             DSPLY

     C* SUB
     C     a             SUB       b             result
     C     result        DSPLY
     C                   SUB       d             a
     C     a             DSPLY
     C                   SUB       22            d
     C     d             DSPLY

     C* MULT
     C                   RESET                   a
     C                   RESET                   b
     C     b             MULT      a             e
     C     e             DSPLY
     C                   MULT      -1            a
     C     a             DSPLY
     C                   SETON                                        LR
