     C* Variable Declaration
     D up              C                   'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
     D lo              C                   'abcdefghijklmnopqrstuvwxyz'
     D chgcase         S             10A   INZ('rpg dept')
     D result          S             10A

     C* XLATE
     C     lo:up         XLATE     chgcase       result
     C     result        DSPLY

     C                   SETON                                        LR
