     C* Variable Declaration
     D string          S             30A   INZ('Search Argument')
     D substr          S             30A   INZ(*blanks)
     D pos             S              3S 0
     D pos1            S              3S 0 INZ(31)
     D up              C                   'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
     D lo              C                   'abcdefghijklmnopqrstuvwxyz'
     D chgcase         S             10A   INZ('rpg dept')
     D result          S             10A

     C* SCAN & SUBST
     C     ' '           SCAN      string        pos
     C     pos           DSPLY
     C     pos           SUBST     string:1      substr
     C     substr        DSPLY

     C* XLATE
     C     lo:up         XLATE     chgcase       result
     C     result        DSPLY

     C* CHECK & CHECKR
     C                   EVAL      substr='AABC1ABD2AB3A'
     C     'ABCD'        CHECK     substr        pos
     C     pos           DSPLY
     C     'ABCD'        CHECK     substr:6      pos
     C     pos           DSPLY
     C     'ABCD'        CHECKR    substr        pos
     C     pos           DSPLY
     C                   SETON                                        LR
