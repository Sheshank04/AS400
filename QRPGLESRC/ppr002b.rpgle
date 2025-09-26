     H DftActGrp(*No) ActGrp(*New)
     D PPR002B         PI
     D Name                          20A
     D Department                    10A
     D Id                             4S 0
     C                   If        Id = 0001
     C                   Eval      Name = 'Sheshank Srivastava'
     C                   Eval      Department = 'RPG'
     C                   EndIf
     C*                  Eval      Id = 0002
     C                   Eval      *Inlr = *On
     C                   Return
