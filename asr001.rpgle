     C* Variable Declaration
     D a               S              5S 0 INZ(25)
     D b               S              5S 0 INZ(5)
     D result          S              7S 2

     C* Mainline Calculation

     C* DIV
     C     a             DIV       b             result
                         DSPLY     (%char(result));

     C* SQRT
     C                   SQRT      a             result
                         DSPLY     (%char(result));
     C                   SETON                                        LR
