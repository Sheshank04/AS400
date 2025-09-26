     A* -----------------------------------------------------------------------//
     A* CREATED BY.......: Programmers.io @ 2025                               //
     A* CREATE DATE......: 2025/09/19                                          //
     A* DEVELOPER........: Sheshank Srivastava                                 //
     A* DESCRIPTION......: Plist CALLPGM                                       //
     A* -----------------------------------------------------------------------//
     A* Modification Log                                                       //
     A* -----------------------------------------------------------------------//
     A* Date     Mod_ID      Developer   Case and Description                  //
     A* YY/MM/DD ----------  ----------  --------------------------------------//
     A*                                                                        //
     A* -----------------------------------------------------------------------//

     C* DS Declaration
     D Employee        DS
     D Name                          20A
     D Department                    10A
     D Id                             4S 0

     C* Mainline Calculation

     C                   CALL      'PPR001.B'
     C                   Parm                    Name
     C                   Parm                    Department
     C                   Parm                    Id
     C     Employee      DSPLY
     C                   EVAL      *INLR = *ON
