     H DftActGrp(*No) ActGrp(*New)
     D Name            S             20A
     D Department      S             10A
     D Id              S              4S 0
     D RCVPGM1         Pr                  ExtPgm('PPR002B')
     D Name                          20A
     D Department                    10A
     D Id                             4S 0 Const
     C                   Eval      Id = 0001
     C                   CallP     RCVPGM1(Name : Department : Id)
     C*    RCVPGM        DSPLY
     C     Name          DSPLY
     C     Department    DSPLY
                         Dsply %char(Id);
     C                   Eval      *Inlr = *On
