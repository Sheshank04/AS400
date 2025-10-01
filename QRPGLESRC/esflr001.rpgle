     A* -----------------------------------------------------------------------//
     A* CREATED BY.......: Programmers.io @ 2025                               //
     A* CREATE DATE......: 2025/09/30                                          //
     A* DEVELOPER........: Sheshank Srivastava                                 //
     A* DESCRIPTION......: Loading Data using Expandable Subfile               //
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
        dcl-f LAPF001 keyed usage(*input);
        dcl-f ESFL workstn Sfile(SFL:RRN) indds(Operations) infds(infds1);

        // Data Structure Declaration
        dcl-ds Operations;
          Exit IND POS(03);
          SFLDSP IND POS(31);
          SFLDSPCTL IND POS(32);
          SFLCLR IND POS(33);
          SFLEND IND POS(34);
          PAGEDOWN IND POS(51);
        end-ds;

        dcl-ds infds1;
            RecNo int(5) pos(378);
        end-ds;

        dcl-s RRN packed(4:0);

        // Main Logic
        Exsr EClear;
        Setll *LOVAL LAPF001;
        Exsr ELoad;
        Exsr EDsply;

        *inlr = *on;

        //=====================================================================//
        // EClear = Clear Sub File                                            //
        //---------------------------------------------------------------------//
        Begsr EClear;

          RCDNBR = 1;
          SFLCLR = *on;
          RRN = 0;
          Write SFLCTL;
          SFLCLR = *off;

        Endsr;

        //=====================================================================//
        // ELoad = Load Sub File                                              //
        //---------------------------------------------------------------------//
        Begsr ELoad;

          Read LAPF001;
          Dow not %EOF(LAPF001);

            SID = ID;
            SNAME = NAME;
            SPHNNO = PHONENO;

            RRN += 1;
            Write SFL;

            If RRN = 5;
              Leavesr;
            Endif;
            Read LAPF001;

          Enddo;

          If %EOF(LAPF001);
            SFLEND = *on;
          Else;
            SFLEND = *off;
          Endif;

        Endsr;

        //=====================================================================//
        // EDsply = Display Sub File                                           //
        //---------------------------------------------------------------------//
        Begsr EDsply;

          Dow Exit = *off;

            SFLDSP = *on;
            SFLDSPCTL = *on;

            If RRN < 1;
              SFLDSP = *off;
            Endif;

            Write HEADER;
            Write FOOTER;
            EXFMT SFLCTL;

            Select;
            When PAGEDOWN = *on AND SFLEND = *off;
              Exsr ProcessKeys;
            other;
              RCDNBR = RecNo;
            Endsl;

          Enddo;

        Endsr;

        //=====================================================================//
        // ProcessKeys                                                         //
        //---------------------------------------------------------------------//
        Begsr ProcessKeys;
          PAGEDOWN = *off;
          Exsr ELoad;
        Endsr;
