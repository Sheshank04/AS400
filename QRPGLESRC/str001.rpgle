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
        dcl-s minChar char(1);
        dcl-s minPos zoned(10:0);
        dcl-s pos zoned(10:0);
        dcl-s inputStr zoned(10);
        dcl-s ch char(1);

        dcl-ds operation;
          Exit IND POS(03);
          Refresh IND POS(05);
          InputStringRIPC IND POS(10);
        end-ds;

        Dow Exit = *off;

          EXFMT REC001;

          If Refresh = *on;
            exsr clearAll;
            InputStringRIPC = *off;
            iter;
          endif;

          If INSTR = ' ';

            clear OUTSTR;
            InputStringRIPC = *on;
            MSG = 'Enter String';

          Else;

            minChar = '0';
            minPos = 0;

            inputStr = %len(%trim(INSTR));

            for pos = 1 to inputStr;

              ch = %subst(INSTR:pos:1);

              if ch <> ' ' AND ch <= minChar;

                minChar = %subst(INSTR:pos:1);
                minPos = pos;

              endif;

            endfor;

            if minPos > 0;

              %subst(OUTSTR:minPos:1) = minChar;
              %subst(INSTR:minPos:1) = ' ';

            endif;

          Endif;

        enddo;

        *Inlr = *on;

        //=====================================================================//
        // clearAll - Clear all Data(Refresh)                                  //
        //---------------------------------------------------------------------//
        Begsr clearAll;

          clear INSTR;
          clear OUTSTR;
          clear MSG;

        Endsr;
