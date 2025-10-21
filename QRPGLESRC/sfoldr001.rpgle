     A* -----------------------------------------------------------------------//
     A* CREATED BY.......: Programmers.io @ 2025                               //
     A* CREATE DATE......: 2025/10/21                                          //
     A* DEVELOPER........: Sheshank Srivastava                                 //
     A* DESCRIPTION......: SFOLDFOLD RPGLE Code                                  //
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
        dcl-f SFOLDPF keyed usage(*input);
        dcl-f SFOLDDSPF workstn Sfile(SFOLD:V_RRN) indds(Operations);

        // Data Structure Declaration
        dcl-ds Operations;
          Exit IND POS(03);
          SFOLDDSP IND POS(31);
          SFOLDDSPCTL IND POS(32);
          SFOLDCLR IND POS(33);
          SFOLDEND IND POS(34);
        end-ds;

        dcl-s V_RRN packed(4:0);

        // Main Logic
        Exsr Clear_Subfile;
        Exsr Load_Subfile;
        Exsr Display_Subfile;

        *inlr = *on;

        //=====================================================================//
        // Clear_Subfile = Clear Sub File                                      //
        //---------------------------------------------------------------------//
        Begsr Clear_Subfile;

          SFOLDCLR = *on;
          V_RRN = 0;
          Write SFOLDCTL;
          SFOLDCLR = *off;

        Endsr;

        //=====================================================================//
        // Load_Subfile = Load Sub File                                        //
        //---------------------------------------------------------------------//
        Begsr Load_Subfile;

          Setll *LOVAL SFOLDPF;
          Read SFOLDPF;
          Dow not %EOF(SFOLDPF);

            DID = ID;
            DNAME = NAME;
            DEMAIL = EMAIL;

            V_RRN += 1;
            If V_RRN > 9999;
              Leavesr;
            Endif;

            Write SFOLD;
            Read SFOLDPF;

          Enddo;

        Endsr;

        //=====================================================================//
        // Display_Subfile = Display Sub File                                  //
        //---------------------------------------------------------------------//
        Begsr Display_Subfile;

          Dow Exit = *off;

            SFOLDDSP = *on;
            SFOLDDSPCTL = *on;
            SFOLDEND = *on;

            If V_RRN < 1;
              SFOLDDSP = *off;
            Endif;

            Write FOOTER;
            EXFMT SFOLDCTL;

          Enddo;

        Endsr;
