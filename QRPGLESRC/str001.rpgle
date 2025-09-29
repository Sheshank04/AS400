     A* -----------------------------------------------------------------------//
     A* CREATED BY.......: Programmers.io @ 2025                               //
     A* CREATE DATE......: 2025/09/25                                          //
     A* DEVELOPER........: Sheshank Srivastava                                 //
     A* DESCRIPTION......: String Transfer RPG                                 //
     A* -----------------------------------------------------------------------//
     A* Modification Log                                                       //
     A* -----------------------------------------------------------------------//
     A* Date     Mod_ID      Developer   Case and Description                  //
     A* YY/MM/DD ----------  ----------  --------------------------------------//
     A*                                                                        //
     A* -----------------------------------------------------------------------//

**free
        Ctl-Opt Option(*Nodebugio : *Srcstmt);
        dcl-f STDSPF001 workstn INDDS(operation);
        dcl-s length packed(2:0);
        dcl-s i packed(2:0);

        dcl-ds operation;
          Exit IND POS(03);
          Refresh IND POS(05);
          InputStringRIPC IND POS(10);
          NonDisplay1 IND POS(21);
          NonDisplay2 IND POS(22);
          NonDisplay3 IND POS(23);
          NonDisplay4 IND POS(24);
          NonDisplay5 IND POS(25);
          NonDisplay6 IND POS(26);
          NonDisplay7 IND POS(27);
          NonDisplay8 IND POS(28);
          NonDisplay9 IND POS(29);
          NonDisplay10 IND POS(30);
        end-ds;

        If Refresh = *on;
          exsr clearAll;
          exsr resetIndicators;
        endif;

        exsr resetIndicators;

        Dow Exit = *off;

          EXFMT REC001;

          If INSTR = ' ';

            InputStringRIPC = *on;
            MSG = 'Enter String';

          Else;

            INSTR = %TRIM(INSTR);

          Endif;

        enddo;

        *Inlr = *on;

        //=====================================================================//
        // clearAll - Clear all Data(Refresh)                                  //
        //---------------------------------------------------------------------//
        Begsr clearAll;

          clear INSTR;
          clear WRKSTR1;
          clear WRKSTR2;
          clear WRKSTR3;
          clear WRKSTR4;
          clear WRKSTR5;
          clear WRKSTR6;
          clear WRKSTR7;
          clear WRKSTR8;
          clear WRKSTR9;
          clear WRKSTR10;
          clear OUTSTR1;
          clear OUTSTR2;
          clear OUTSTR3;
          clear OUTSTR4;
          clear OUTSTR5;
          clear OUTSTR6;
          clear OUTSTR7;
          clear OUTSTR8;
          clear OUTSTR9;
          clear OUTSTR10;

        Endsr;

        //=====================================================================//
        // resetIndicators - Reset all Indicators to default                    //
        //---------------------------------------------------------------------//
        Begsr resetIndicators;

          NonDisplay1 = *on;
          NonDisplay2 = *on;
          NonDisplay3 = *on;
          NonDisplay4 = *on;
          NonDisplay5 = *on;
          NonDisplay6 = *on;
          NonDisplay7 = *on;
          NonDisplay8 = *on;
          NonDisplay9 = *on;
          NonDisplay10 = *on;
          InputStringRIPC = *off;

        Endsr;
