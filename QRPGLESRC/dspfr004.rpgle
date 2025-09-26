     A* -----------------------------------------------------------------------//
     A* CREATED BY.......: Programmers.io @ 2025                               //
     A* CREATE DATE......: 2025/09/22                                          //
     A* DEVELOPER........: Sheshank Srivastava                                 //
     A* DESCRIPTION......: DSPF C 2 F RPG                                      //
     A* -----------------------------------------------------------------------//
     A* Modification Log                                                       //
     A* -----------------------------------------------------------------------//
     A* Date     Mod_ID      Developer   Case and Description                  //
     A* YY/MM/DD ----------  ----------  --------------------------------------//
     A*                                                                        //
     A* -----------------------------------------------------------------------//

**Free

    dcl-f dspf004 workstn;

    dow *In03 = *off;

        exfmt REC001;

        if *In05 = *on;
            clear CL;
            clear FR;
            iter;
        endif;

         FR = (CL * 9/5) + 32;
    enddo;

*inlr = *on;
