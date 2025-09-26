     A* -----------------------------------------------------------------------//
     A* CREATED BY.......: Programmers.io @ 2025                               //
     A* CREATE DATE......: 2025/09/16                                          //
     A* DEVELOPER........: Sheshank Srivastava                                 //
     A* DESCRIPTION......: Pre Run Time Array                                  //
     A* -----------------------------------------------------------------------//
     A* Modification Log                                                       //
     A* -----------------------------------------------------------------------//
     A* Date     Mod_ID      Developer   Case and Description                  //
     A* YY/MM/DD ----------  ----------  --------------------------------------//
     A*                                                                        //
     A* -----------------------------------------------------------------------//

     C* File Declaration

     FARPF001   IT   F   10        DISK

     C* Variable Declaration

     Darray            S             10A   DIM(7) FROMFILE(ARPF001) PERRCD(1)
     Dcounter          S              2P 0 Inz(1)

     C* Mainline Calculation

        // for loop

        for counter = 1 to 7 by 1;
            dsply array(counter);
        endfor;

        *inlr = *on;
