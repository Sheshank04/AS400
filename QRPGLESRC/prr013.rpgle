     C* Variable Declaration
     D str1            S             20A
     D str2            S             20A
     D str3            S              3A
     D result          S             10S 0
     D result1         S             40A

     C* SCAN
     C                   EVAL      str1='Jacob'
     C     'acb'         SCAN      str1          result
     C     result        DSPLY

     C* CHECK
     C                   EVAL      str1='Jacob'
     C     'acb'         CHECK     str1          result
     C     result        DSPLY

     C* CAT
     C                   EVAL      str1='Jacob'
     C                   EVAL      str2='Clark'
     C     str1          CAT(P)    str2          result1
     C     result1       DSPLY

     C* MOVE & MOVE(P)
     C                   EVAL      str1='Jacob'
     C                   EVAL      str3='Cl '
     C                   MOVE      str3          str1
     C     str1          DSPLY
     C                   MOVE(P)   str3          str1
     C     str1          DSPLY

     C* MOVEL & MOVEL(P)
     C                   EVAL      str1='Jacob'
     C                   EVAL      str3='Cla'
     C                   MOVEL     str3          str1
     C     str1          DSPLY
     C                   MOVEL(P)  str3          str1
     C     str1          DSPLY
     C                   SETON                                        LR
