     A* -----------------------------------------------------------------------//
     A* CREATED BY.......: Programmers.io @ 2025                               //
     A* CREATE DATE......: 2025/09/29                                          //
     A* DEVELOPER........: Sheshank Srivastava                                 //
     A* DESCRIPTION......: Prompt Table                                        //
     A* -----------------------------------------------------------------------//
     A* Modification Log                                                       //
     A* -----------------------------------------------------------------------//
     A* Date     Mod_ID      Developer   Case and Description                  //
     A* YY/MM/DD ----------  ----------  --------------------------------------//
     A*                                                                        //
     A* -----------------------------------------------------------------------//

**free
        // Control Option
        Ctl-Opt Option(*Nodebugio:*Srcstmt);

        // File Declaration
        dcl-f PROMPTDSPF workstn INDDS(Operation);

        // Data Structure Declaration
        dcl-ds Operation;
          Exit IND Pos(03);
          Prompt IND Pos(04);
          Cancel IND Pos(12);
        end-ds;

        // Main Calculation
        Dow Exit = *off;

          EXFMT SCREEN;

          //=====================================================================//
          // Prompt = To open Prompt Table                                       //
          //---------------------------------------------------------------------//
          If Prompt = *on AND FLD = 'CITY';

            clear OPTION;
            EXFMT POPUP;

            Exsr selectCity;
            if Cancel = *on;
              clear CITY;
            endif;

            if Exit = *on;
              leave;
            endif;

            Prompt = *off;

          Endif;

        Enddo;

        *Inlr = *on;

        //=====================================================================//
        // selectCity = To select option to select the city                    //
        //---------------------------------------------------------------------//
        Begsr selectCity;

          Select;

          When Option = '1';
            CITY = 'MUMBAI';

          When Option = '2';
            CITY = 'DELHI';

          When Option = '3';
            CITY = 'JAIPUR';

          When Option = '4';
            CITY = 'LUCKNOW';

          Other;
            CITY = 'Invalid City';

          endsl;

        Endsr;
