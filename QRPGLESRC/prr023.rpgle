     d date10          s               D   INZ(D'2017-12-28')
     d date20          s               D   INZ(D'2017-12-28')
     d time1           S               T   INZ(T'10.12.15')
     d time2           S               T   INZ(T'10.12.15')
     d InputChar       S             30A   INZ('$*****5.25***0000')
     d String          S             20A   INZ('PIP.IO IBMPI')
     d TrimChar        S             30A
     D Input1          S              8  2
     D INPUT2          S              8  2
     D INPUT3          S              8  2
     D INPUT4          S              8  2
     D INPUT5          S              8  2
     D DAYS_DIFF       S              8  0
     D Time_DIFF       S              8  0
     d Editcode_1      S             50A
     C                   EVAL      Days_Diff = %Diff(Date10: Date20: *Days)
     C                   EVAL      Time_Diff = %Diff(Time1: Time2: *Minutes)
     C     Days_Diff     DSPLY
     C     Days_Diff     DSPLY

     C                   EVAL      Editcode_1 = %EDITC(Input1 : '1') + ' ' +
     C                                          %EDITC(Input2 : '1') + ' ' +
     C                                          %EDITC(Input3 : '1') + ' ' +
     C                                          %EDITC(Input4 : '1') + ' ' +
     C                                          %EDITC(Input5 : '1')
     C     Editcode_1    DSPLY
     C                   EVAL      Editcode_1 = %EDITC(-0000004.87:'K':*ASTFill)
     C     Editcode_1    DSPLY
     C                   EVAL      Editcode_1 = %EDITC(-0009234.87:'K':*cursym)
     C     Editcode_1    DSPLY
     C
     C                   Eval      TrimChar = %Trim(InputChar)
     C     TrimChar      DSPLY
     C                   Eval      TrimChar = %Trim(String: 'PI ')
     C     TrimChar      DSPLY
     C                   Eval      TrimChar = %Trim(InputChar : '0 ')
     C     TrimChar      DSPLY
     C                   Eval      TrimChar = %Trim(InputChar : '0 *')
     C     TrimChar      DSPLY
     C                   Eval      TrimChar = %Trim(InputChar : '0 *$')
     C     TrimChar      DSPLY
     C
     C                   Eval      TrimChar = %TrimL(InputChar)
     C     TrimChar      DSPLY
     C                   Eval      TrimChar = %TrimL(InputChar : ' $')
     C     TrimChar      DSPLY
     C
     C                   Eval      TrimChar = %TrimR(InputChar)
     C     TrimChar      DSPLY
     C                   Eval      TrimChar = %TrimR(InputChar : ' $')
     C     TrimChar      DSPLY

     C                   EVAL      *inlr = *on
