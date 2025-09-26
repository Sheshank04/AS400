     H DftActGrp(*No) ActGrp(*New)
     D PPR003B         PI
     D Name                          20A
     D Department                    10A
     D Id                             4S 0
     C                   Eval      Name = 'Sheshank Srivastava'
     C                   Eval      Department = 'RPG'
     C*                   If       %Passed(Id)
     C*                  Eval      Id = 0001
     C*                   EndIf
     C                   Eval      *Inlr = *On
     C                   Return
