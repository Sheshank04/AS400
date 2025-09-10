     C* Variable Declaration
     D string          S             30A   INZ('Search Argument')
     D substr          S             30A   INZ(*blanks)
     D substr1         S             30A   INZ('XXXXXXXXXXXXXXXXXXXXX')
     D pos             S              3S 0
     D pos1            S              3S 0 INZ(31)
     D up              C                   'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
     D lo              C                   'abcdefghijklmnopqrstuvwxyz'
     D chgcase         S             10A   INZ('rpg dept')
     D chgcase1        S             20A   INZ('XXXXXXXXXXXXXXXXXX')
     D result          S             10A

     C* SCAN(E) & SUBST(E)
     C     ' '           SCAN(E)   string:pos1   pos
     C                   if        %error
     C     'error'       DSPLY
     C                   endif

     C     2             SUBST(E)  string:pos1   substr
     C                   if        %error
     C     'error'       DSPLY
     C                   endif

     C* XLATE (E)
     C     lo:up         XLATE(E)  chgcase:pos1  result
     C                   if        %error
     C     'error'       DSPLY
     C                   endif

     C* CHECK & CHECKR (E)
     C                   EVAL      substr='AABC1ABD2AB3A'
     C     'ABCD'        CHECK(E)  substr:pos1   pos
     C                   if        %error
     C     'error'       DSPLY
     C                   endif

     C     'ABCD'        CHECKR(E) substr:pos1   pos
     C                   if        %error
     C     'error'       DSPLY
     C                   endif

     C* XLATE (P)
     C     lo:up         XLATE     chgcase       chgcase1
     C     chgcase1      DSPLY
     C     lo:up         XLATE(P)  chgcase       chgcase1
     C     chgcase1      DSPLY

     C* SUBSTR (P)
     C     5             SUBST     string:3      substr1
     C     substr1       DSPLY
     C     5             SUBST(P)  string:3      substr1
     C     substr1       DSPLY
     C                   SETON                                        LR
