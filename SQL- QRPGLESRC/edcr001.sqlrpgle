     A* -----------------------------------------------------------------------//
     A* CREATED BY.......: Programmers.io @ 2025                               //
     A* CREATE DATE......: 2025/11/14                                          //
     A* DEVELOPER........: Sheshank Srivastava                                 //
     A* DESCRIPTION......: SQLRPGLE Subfile CRUD                               //
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
        Exec SQL
          Set option Commit = *None;

        // File Declaration
        dcl-f EDPF002 keyed usage(*input);
        dcl-f EDDSPF001 workstn sfile(EDSFL:RRN) indds(Operations);

        // Data Structure for Indicators
        dcl-ds Operations;
          Exit IND POS(03);
          SFLDSP IND POS(31);
          SFLDSPCTL IND POS(32);
          SFLCLR IND POS(33);
          SFLEND IND POS(34);
          PAGEDOWN IND POS(51);
          PAGEUP IND POS(52);
        end-ds;

        // Variables
        dcl-s RRN packed(4:0);
        dcl-s FirstRRN packed(5:0);
        dcl-s V_Counter packed(4:0);

        // Fields for SQL Fetch
        dcl-s V_Id zoned(5:0);
        dcl-s V_Name char(40);
        dcl-s V_Department char(15);

        // Declare Scrollable Cursor for EDPF002
        Exec SQL
          Declare EmployeeCursor Scroll Cursor for
          Select EMPID, EMPNAME, EMPDEPT
          From EDPF002
          Order By EMPID;

        // Main Logic
        Exsr Subfile_Clear;
        Exec SQL open EmployeeCursor;
        Exsr Subfile_Load;
        Exsr Subfile_Display;
        Exec SQL close EmployeeCursor;

        *inlr = *on;

        //=====================================================================//
        // Subfile_Clear = Clear Subfile                                       //
        //---------------------------------------------------------------------//
        Begsr Subfile_Clear;

          SFLCLR = *on;
          RRN = 0;
          Write EDSFLCTL;
          SFLCLR = *off;

        Endsr;

        //=====================================================================//
        // Subfile_Load = Load Subfile                                         //
        //---------------------------------------------------------------------//
        Begsr Subfile_Load;

          Dow SQLCODE = 0;

            Exec SQL
              Fetch next from EmployeeCursor into :V_Id, :V_Name, :V_Department;

            If SQLCODE <> 0;
              leave;
            Endif;

            RRN += 1;
            If RRN = 1;
              FirstRRN = V_Id;
            Endif;

            DEMPID = V_Id;
            DEMPNAME = V_Name;
            DEMPDEPT = V_Department;

            Write EDSFL;

            If RRN = 8;
              leave;
            Endif;

          Enddo;

          If RRN < 1;
            DMSG1 = 'No records found';
          Else;
            DMSG1 = *blanks;
          Endif;

          If SQLCODE <> 0;
            SFLEND = *on;
          Else;
            SFLEND = *off;
          Endif;

        Endsr;

        //=====================================================================//
        // Subfile_Display = Display Subfile                                   //
        //---------------------------------------------------------------------//
        Begsr Subfile_Display;

          Dow Exit = *off;

            SFLDSP = *on;
            SFLDSPCTL = *on;

            If RRN < 1;
              SFLDSP = *off;
            Else;
              SFLDSP = *on;
            Endif;

            DFUNCTION = 'F3=Exit';

            Write FOOTER;
            Exfmt EDSFLCTL;

            Exsr ProcessKeys;

          Enddo;

        Endsr;

        //=====================================================================//
        // ProcessKeys                                                         //
        //---------------------------------------------------------------------//
        Begsr ProcessKeys;

          Select;
            When PageDown = *on;
            If SFLEND = *off;

                PageDown = *off;
                Exsr Subfile_Clear;
                Exsr Subfile_Load;

            Endif;

            When PageUp = *on;

            For V_Counter = 1 to 2*8;

                Exec SQL
                  Fetch prior from EmployeeCursor into
                  :V_Id, :V_Name, :V_Department;

                If SQLCODE <> 0;

                  Exec SQL
                    Fetch first from EmployeeCursor into
                    :V_Id, :V_Name, :V_Department;
                  leave;

                Endif;

            Endfor;

            PageUp = *off;
            Exsr Subfile_Clear;
            Exsr Subfile_Load;

          Endsl;
        Endsr;

