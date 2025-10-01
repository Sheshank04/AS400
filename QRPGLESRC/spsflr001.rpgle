     A* -----------------------------------------------------------------------//
     A* CREATED BY.......: Programmers.io @ 2025                               //
     A* CREATE DATE......: 2025/09/30                                          //
     A* DEVELOPER........: Sheshank Srivastava                                 //
     A* DESCRIPTION......: Loading Data using Single Page Subfile              //
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
        dcl-f SPSFL workstn Sfile(SFL:RRN) indds(Operations);

        // Data Structure Declaration
        dcl-ds Operations;
          Exit IND POS(03);
          SFLDSP IND POS(31);
          SFLDSPCTL IND POS(32);
          SFLCLR IND POS(33);
          SFLEND IND POS(34);
          PAGEDOWN IND POS(51);
          PAGEUP IND POS(52);
        end-ds;

        dcl-s RRN packed(4:0);
        dcl-s FirstRRN packed(5:0);
        dcl-s i packed(4:0);

        // Main Logic
        Exsr SPClear;
        Setll *LOVAL LAPF001;
        Exsr SPLoad;
        Exsr SPDsply;

        *inlr = *on;

        //=====================================================================//
        // SPClear = Clear Sub File                                            //
        //---------------------------------------------------------------------//
        Begsr SPClear;

          SFLCLR = *on;
          RRN = 0;
          Write SFLCTL;
          SFLCLR = *off;

        Endsr;


        //=====================================================================//
        // SPLoad = Load Sub File                                              //
        //---------------------------------------------------------------------//
        Begsr SPLoad;

          Read LAPF001;
          Dow not %EOF(LAPF001);

            SID = ID;
            SNAME = NAME;
            SPHNNO = PHONENO;

            RRN += 1;

            if RRN = 1;
              FirstRRN = ID;
            endif;

            Write SFL;

            If RRN = 4;
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
        // SPDsply = Display Sub File                                           //
        //---------------------------------------------------------------------//
        Begsr SPDsply;

          Dow Exit = *off;

            SFLDSP = *on;
            SFLDSPCTL = *on;

            If RRN < 1;
              SFLDSP = *off;
            Endif;

            Write HEADER;
            Write FOOTER;
            EXFMT SFLCTL;

            Exsr ProcessKeys;

          Enddo;

        Endsr;

        //=====================================================================//
        // ProcessKeys                                                         //
        //---------------------------------------------------------------------//
        Begsr ProcessKeys;

          Select;
          When PageDown = *on;

            if SFLEND = *off;
              PageDown = *off;
              Exsr SPClear;
              Exsr SPload;
            endif;

          When PageUp = *on;

            setll FirstRRN LAPF001;
            for i = 1 to 5;
              readp LAPF001;
              if %eof(LAPF001);

                SFLEND = *off;
                setll *LOVAL LAPF001;
                leave;

              endif;
            endfor;

            PageUp = *off;
            Exsr SPClear;
            Exsr SPLoad;

          endsl;

        Endsr;
