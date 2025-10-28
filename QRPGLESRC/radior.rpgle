     A* -----------------------------------------------------------------------//
     A* CREATED BY.......: Programmers.io @ 2025                               //
     A* CREATE DATE......: 2025/09/25                                          //
     A* DEVELOPER........: Sheshank Srivastava                                 //
     A* DESCRIPTION......: User Details CRUD operations using DSPF             //
     A* -----------------------------------------------------------------------//
     A* Modification Log                                                       //
     A* -----------------------------------------------------------------------//
     A* Date     Mod_ID      Developer   Case and Description                  //
     A* YY/MM/DD ----------  ----------  --------------------------------------//
     A*                                                                        //
     A* -----------------------------------------------------------------------//

**free
        Ctl-Opt Option(*Nodebugio : *Srcstmt);
        Dcl-F RADIOD workstn INDDS(operation);

        Dcl-ds operation;
          Exit IND POS(03);
          Refresh IND POS(05);
        End-ds;

        Dow Exit = *off;

          Exfmt SCREEN;

          If Refresh = *ON;
            Refresh = *OFF;
            Clear CHOICE;
            Reset Gender;
          Endif;

          Select;
          When Gender = 1;
            Choice = 'MALE';
          When Gender = 2;
            Choice = 'FEMALE';
          When Gender = 3;
            Choice = 'OTHER';
          Endsl;

        Enddo;

        *inlr = *on;
