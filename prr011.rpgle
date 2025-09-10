     C* Variable Declaration
     D a               S              2S 0 INZ(11)
     D b               S              2S 0 INZ(9)
     D c               S              2S 0 INZ(0)
     D d               S              2S 0 INZ(-22)
     D e               S              4S 0
     D f               S              4S 0
     D result          S              2S 0
     D resultchr       S             10A

     C* Mainline Calculation
     C                   EVAL      result=a+b
     C     result        DSPLY
     C                   EVAL      result=60
     C     result        DSPLY
     C                   EVAL      resultchr='Hello'
     C     resultchr     DSPLY

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

     C* Z-ADD and Z-SUB
     C                   Z-ADD     11            b
     C     b             DSPLY
     C                   Z-SUB     11            a
     C     a             DSPLY

     C* MULT
     C                   RESET                   a
     C                   RESET                   b
     C     b             MULT      a             e
     C     e             DSPLY
     C                   MULT      -1            a
     C     a             DSPLY

     C* DIV and MOVR
     C                   RESET                   a
     C                   RESET                   b
     C     a             DIV       b             e
     C                   MVR                     f
     C     e             DSPLY
     C     f             DSPLY

     C* SQRT
     C                   EVAL      a=25
     C                   SQRT      a             e
     C     e             DSPLY
     C                   SETON                                        LR
