     C* Variable Declaration
     D str1            S              6A
     D str2            S              6A
     D result          S             15A

     C* Mainline Calculation

     C*EXSR
     C                   EVAL      str1 = '   '
     C                   EVAL      str2 = 'DEF'
     C                   EXSR      Reset_Value
     C     result        DSPLY
     C                   SETON                                        LR
     C     Reset_Value   BEGSR
     C                   if        str1 = ' '
     C                   EVAL      result = 'Name Is Blank'
     C                   LEAVESR
     C                   else
     C     str1          CAT       str2          result
     C                   endif
     C                   ENDSR
