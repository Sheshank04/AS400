     H DftActGrp(*No) ActGrp(*New)
     D Name            S             20A
     D Department      S             10A
     D Id              S              4S 0
     D RCVPGM2         Pr                  ExtPgm('PPR003B')
     D Name                          20A
     D Department                    10A
     D Id                             4S 0 OPTIONS(*NOPASS)
     C                   CallP     RCVPGM2(Name : Department)
     C*    RCVPGM        DSPLY
     C     Name          DSPLY
     C     Department    DSPLY
                         Dsply %char(Id);
     C                   Eval      *Inlr = *On
