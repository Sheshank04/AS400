**free
        //=====================================================================//
        // Control Options                                                     //
        //---------------------------------------------------------------------//
        Ctl-Opt Option(*Nodebugio:*Srcstmt);
        Exec SQL
          Set option Commit = *None;

        //=====================================================================//
        // File Declaration                                                    //
        //---------------------------------------------------------------------//
        dcl-f EDPF002 keyed usage(*input);
        dcl-f EDDSPF001 workstn Sfile(EDSFL:V_RRN) Indds(Operations);

        //=====================================================================//
        // Data Structure Declaration for Indicators                           //
        //---------------------------------------------------------------------//
        dcl-ds Operations;
          Exit IND POS(03);
          Refresh IND POS(05);
          Cancel IND POS(12);
          Sfldsp IND POS(31);
          Sfldspctl IND POS(32);
          Sflclr IND POS(33);
          Sflend IND POS(34);
          Pagedown IND POS(51);
          Pageup IND POS(52);
        end-ds;

        //=====================================================================//
        // Variable Declaration                                                //
        //---------------------------------------------------------------------//
        dcl-s V_RRN packed(4:0);
        dcl-s V_FirstRecord like(V_RRN);
        dcl-s V_Offset like(V_RRN);
        dcl-s V_PosVal int(10);
        dcl-s V_PosName char(40);
        dcl-s V_CheckName char(40);
        dcl-s V_Check1 zoned(5:0);
        dcl-s V_Check2 zoned(5:0);


        //=====================================================================//
        // Fields for SQL Fetch                                                //
        //---------------------------------------------------------------------//
        dcl-s V_Id zoned(5:0);
        dcl-s V_Name char(40);
        dcl-s V_Department char(15);

        //=====================================================================//
        // Declare Scrollable Cursor for EDPF002                               //
        //---------------------------------------------------------------------//
        Exec SQL
          Declare EmployeeCursor Scroll Cursor for
          Select EMPID, EMPNAME, EMPDEPT
          From EDPF002
          Order By EMPID;

        //=====================================================================//
        // Main Logic                                                          //
        //---------------------------------------------------------------------//
        Exec SQL
          open EmployeeCursor;

        Exsr Subfile_Clear;
        Exsr Subfile_Load;
        Exsr Subfile_Display;
        Exec SQL
          close EmployeeCursor;

        *inlr = *on;

        //=====================================================================//
        // Subfile_Clear = Clear Subfile                                       //
        //---------------------------------------------------------------------//
        Begsr Subfile_Clear;

          Sflclr = *on;
          V_RRN = 0;
          Write EDSFLCTL;
          Sflclr = *off;

        Endsr;

        //=====================================================================//
        // Subfile_Load = Load Subfile                                         //
        //---------------------------------------------------------------------//
        Begsr Subfile_Load;

          Dow SQLCODE = 0;

            If Refresh = *off;
              Exsr Fetch_Next;
            Endif;

            If SQLCODE = 100;
              leave;
            Endif;

            V_RRN += 1;

            If V_RRN = 1;
              V_FirstRecord = V_Id;
            Endif;

            SEMPID = V_Id;
            SEMPNAME = V_Name;
            SEMPDEPT = V_Department;

            Write EDSFL;

            If V_RRN = 8;
              leave;
            Endif;

            If Refresh = *on;
              Exsr Fetch_Next;
            Endif;
          Enddo;
          Exsr Fetch_Next;

          If SQLCODE = 100;
            Sflend = *on;
          Else;
            Sflend = *off;
            Exsr Fetch_Prior;
          Endif;
        Endsr;

        //=====================================================================//
        // Subfile_Display = Display Subfile                                   //
        //---------------------------------------------------------------------//
        Begsr Subfile_Display;

          Dow Exit = *off;

            Sfldsp = *on;
            Sfldspctl = *on;

            If V_RRN < 1;
              Sfldsp = *off;
            Else;
              Sfldsp = *on;
            Endif;

            DFUNCTION = 'F3=Exit  F5=Refresh  F12=Cancel';

            Write FOOTER;
            Exfmt EDSFLCTL;

            If Cancel = *On;
              Cancel = *Off;
              Leave;
            Endif;
            Exsr Position_To;
            Exsr ProcessKeys;
          Enddo;
        Endsr;

        //=====================================================================//
        // ProcessKeys                                                         //
        //---------------------------------------------------------------------//
        Begsr ProcessKeys;

          Select;
            When Pagedown = *on;
              Pagedown = *off;
              If Sflend = *on;
                DMSG1 = 'You are already at the last page.';

              Else;
                DMSG1 = *blanks;
                SQLCODE = 0;

                Exsr Subfile_Clear;
                Exsr Subfile_Load;
              Endif;

            When Pageup = *on;
              Pageup = *off;
              Exec SQL
                Select EMPID into :V_Check2 from EDPF002
                Order By EMPID
                fetch first row only;

              If V_FirstRecord = V_Check2;
                DMSG1 = 'You are already at the first page.';

              Else;
                DMSG1 = *blanks;
                If V_RRN < 8 OR Sflend = *On;
                  V_Offset = (8 + V_RRN + 1) * -1;

                Else;
                  V_Offset = (8 + V_RRN) * -1;
                Endif;
                Exec SQL
                  Fetch relative :V_Offset from EmployeeCursor;

                SQLCODE = 0;

                Exsr Subfile_Clear;
                Exsr Subfile_Load;
              Endif;

            When Refresh = *on;
              DMSG1 = *blanks;
              DPOSTO = *blanks;
              Exsr Fetch_First;

              Exsr Subfile_Clear;
              Exsr Subfile_Load;
              Refresh = *Off;
          Endsl;
        Endsr;

        //=====================================================================//
        // Fetch_First                                                         //
        //---------------------------------------------------------------------//
        Begsr Fetch_First;
          Exec SQL
            Fetch first from EmployeeCursor into :V_Id, :V_Name, :V_Department;

        Endsr;

        //=====================================================================//
        // Fetch_Next                                                          //
        //---------------------------------------------------------------------//
        Begsr Fetch_Next;
          Exec SQL
            Fetch next from EmployeeCursor into :V_Id, :V_Name, :V_Department;

        Endsr;

        //=====================================================================//
        // Fetch_Prior                                                         //
        //---------------------------------------------------------------------//
        Begsr Fetch_Prior;
          Exec SQL
            Fetch prior from EmployeeCursor into :V_Id, :V_Name, :V_Department;

        Endsr;

        //=====================================================================//
        // Fetch_Last                                                          //
        //---------------------------------------------------------------------//
        Begsr Fetch_Last;
          Exec SQL
            Fetch last from EmployeeCursor into :V_Id, :V_Name, :V_Department;

        Endsr;

        //=====================================================================//
        // Position_To                                                         //
        //---------------------------------------------------------------------//
        Begsr Position_To;

          If DPOSTO <> *blanks AND PageUp = *off AND PageDown = *off;
            If %check('0123456789': %trim(DPOSTO)) = 0;
              V_PosVal = %int(%trim(DPOSTO));
              Exec Sql
                Select EMPID into :V_Check1 from EDPF002
                where EMPID >= :V_PosVal
                Order By EMPID
                limit 1;

              If SQLCODE = 0;
                Exsr Fetch_First;
                Dow SQLCODE = 0 and V_Id <> V_Check1;
                  Exsr Fetch_Next;
                Enddo;
                Exsr Fetch_Prior;
              Else;
                Exsr Fetch_Last;
                Exsr Fetch_Prior;
              EndIf;

            Else;
              V_PosName = %trim(DPOSTO);
              Exec Sql
                Select EMPNAME into :V_CheckName from EDPF002
                where UPPER(EMPNAME) >= UPPER(:V_PosName)
                //where UPPER(EMPNAME) LIKE '%' || UPPER(:V_PosName) || '%'
                Order By EMPNAME
                limit 1;

              If SQLCODE = 0;
                Exsr Fetch_First;
                Dow SQLCODE = 0 and V_Name <> V_CheckName;
                  Exsr Fetch_Next;
                Enddo;
                Exsr Fetch_Prior;
              Else;
                Exsr Fetch_Last;
                Exsr Fetch_Prior;
              EndIf;

            EndIf;
            SQLCODE = 0;
            Clear DPOSTO;

            Exsr Subfile_Clear;
            Exsr Subfile_Load;
          EndIf;
        Endsr;
