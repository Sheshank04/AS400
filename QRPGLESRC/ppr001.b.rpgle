     A* -----------------------------------------------------------------------//
     A* CREATED BY.......: Programmers.io @ 2025                               //
     A* CREATE DATE......: 2025/09/19                                          //
     A* DEVELOPER........: Sheshank Srivastava                                 //
     A* DESCRIPTION......: Plist RCVPGM                                        //
     A* -----------------------------------------------------------------------//
     A* Modification Log                                                       //
     A* -----------------------------------------------------------------------//
     A* Date     Mod_ID      Developer   Case and Description                  //
     A* YY/MM/DD ----------  ----------  --------------------------------------//
     A*                                                                        //
     A* -----------------------------------------------------------------------//

     C* DS Declaration
     D Name            S             20A
     D Department      S             10A
     D Id              S              4S 0

     C* Mainline Calculation
     C     *Entry        PLIST
     C                   Parm                    Name
     C*                   Parm                    Department
     C*                   Parm                    Id
     C                   EVAL      Name = 'Sheshank Srivastava'
     C                   EVAL      Department = 'RPG'
     C                   EVAl      Id = 01
     C
     C                   EVAL      *Inlr = *on
     C                   Return
