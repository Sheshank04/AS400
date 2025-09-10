     C* Variable Declaration
     D str1            S              6A
     D str2            S              6A
     D result          S             15A

     C* Mainline Calculation

     C     str1          CAT       str2          result
     C     result        DSPLY
     C                   SETON                                        LR
     C     *INZSR        BEGSR
     C                   EVAL      str1 = 'ABC'
     C                   EVAL      str2 = 'ABC'
     C                   ENDSR
