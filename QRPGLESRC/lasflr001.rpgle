     A* -----------------------------------------------------------------------//
     A* CREATED BY.......: Programmers.io @ 2025                               //
     A* CREATE DATE......: 2025/09/30                                          //
     A* DEVELOPER........: Sheshank Srivastava                                 //
     A* DESCRIPTION......: Loading Data using Load All Subfile                 //
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
        dcl-f LASFLR001 workstn Sfile(SFL:RRN) indds(Operations);

        // Data Structure Declaration
        dcl-ds Operations;
          Exit IND POS(03);
          SFLDSP IND POS(31);
          SFLDSPCTL IND POS(32);
          SFLCLR IND POS(33);
          SFLEND IND POS(34);
        end-ds;

        dcl-s RRN packed(4:0);

        // Main Logic
        Exsr LAClear;
        Exsr LALoad;
        Exsr LADsply;

        *inlr = *on;

        //=====================================================================//
        // LAClear = Clear Sub File                                            //
        //---------------------------------------------------------------------//
        Begsr LAClear;

          SFLCLR = *on;
          RRN = 0;
          Write SFLCTL;
          SFLCLR = *off;

        Endsr;

        //=====================================================================//
        // LALOad = Load Sub File                                              //
        //---------------------------------------------------------------------//
        Begsr LALoad;

          Setll *LOVAL LAPF001;
          Read LAPF001;
          Dow not %EOF(LAPF001);

            SID = ID;
            SNAME = NAME;
            SPHNNO = PHONENO;

            RRN += 1;
            If RRN > 9999;
              Leavesr;
            Endif;

            Write SFL;
            Read LAPF001;

          Enddo;

        Endsr;

        //=====================================================================//
        // LADsply = Display Sub File                                              //
        //---------------------------------------------------------------------//
        Begsr LADsply;

          Dow Exit = *off;

            SFLDSP = *on;
            SFLDSPCTL = *on;
            SFLEND = *on;

            If RRN < 1;
              SFLDSP = *off;
            Endif;

            Write HEADER;
            Write FOOTER;
            EXFMT SFLCTL;

          Enddo;

        Endsr;
