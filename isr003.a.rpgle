     A* -----------------------------------------------------------------------//
     A* CREATED BY.......: Programmers.io @ 2025                               //
     A* CREATE DATE......: 2025/09/09                                          //
     A* DEVELOPER........: Sheshank Srivastava                                 //
     A* DESCRIPTION......: Use of DOU loop(FIX)                                //
     A* -----------------------------------------------------------------------//
     A* Modification Log                                                       //
     A* -----------------------------------------------------------------------//
     A* Date     Mod_ID      Developer   Case and Description                  //
     A* YY/MM/DD ----------  ----------  --------------------------------------//
     A*                                                                        //
     A* -----------------------------------------------------------------------//

     C* Variable Declaration
     Dindex            S              2S 0 Inz(30)

     C* Mainline Calculation
     C                   DOU       index > 20
     C     index         DSPLY
     C                   EVAL      index = index+5
     C                   ENDDO
     C     'End of Loop' DSPLY
     C                   SETON                                          LR
