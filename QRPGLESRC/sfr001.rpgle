     A* -----------------------------------------------------------------------//
     A* CREATED BY.......: Programmers.io @ 2025                               //
     A* CREATE DATE......: 2025/10/07                                          //
     A* DEVELOPER........: Sheshank Srivastava                                 //
     A* DESCRIPTION......: CRUD operation using Load all Subfile               //
     A* -----------------------------------------------------------------------//
     A* Modification Log                                                       //
     A* -----------------------------------------------------------------------//
     A* Date     Mod_ID      Developer   Case And Description                  //
     A* YY/MM/DD ----------  ----------  --------------------------------------//
     A*                                                                        //
     A* -----------------------------------------------------------------------//

**free
        // Control Option
        Ctl-Opt Option(*Nodebugio:*Srcstmt);

        // File Declaration
        Dcl-f SFPF001 keyed usage(*input: *output: *update: *delete);
        Dcl-f SF001 workstn Sfile(USRSFL:RRN) Sfile(DLTSFL:RRN1)
        indds(Operations) infds(infds1);

        // Data Structure Declaration
        Dcl-DS Operations;
          Exit IND POS(03);
          Prmpt IND POS(04);
          Refresh IND POS(05);
          ADD1 IND POS(06);
          UPDATE1 IND POS(08);
          Cancel IND POS(12);
          SFLDSP IND POS(31);
          SFLDSPCTL IND POS(32);
          SFLCLR IND POS(33);
          SFLEND IND POS(34);
          DLTDSP IND POS(41);
          DLTDSPCTL IND POS(42);
          DLTCLR IND POS(43);
          DLTEND IND POS(44);
          optionRIPC IND POS(50);
          userNameRIPC IND POS(51);
          userDepartmentRIPC IND POS(52);
          userMobileNoRIPC IND POS(53);
          wOptionRIPC IND POS(54);
          wSelectionRIPC IND POS(55);
          userDetailPR IND POS(60);
          promptND IND POS(61);
          userDetailUL IND POS(71);
          PAGEUP IND POS(90);
          SFLNXTCHGIND IND POS(91);
          userDetailOff IND POS(80);
        End-DS;

        Dcl-DS infds1;
          RecNo int(5) pos(378);
        End-DS;

        Dcl-S RRN packed(4:0);
        Dcl-S RRN1 packed(4:0);
        Dcl-s FirstRRN packed(5:0);
        Dcl-s i packed(4:0);
        Dcl-s j packed(4:0);
        Dcl-s FirstKey packed(5:0);
        Dcl-s Counter char(1);

        Dcl-S SelCount packed(10:0);
        Dcl-DS SelRecord Dim(100) Qualified;
          ID like(USERID);
          Name like(USERNAME);
        End-DS;

        // Main Logic
        Setll *LOVAL SFPF001;
        Read SFPF001;
        If Not %eof(SFPF001);
          FirstKey = USERID;
        Endif;
        Exsr Clear_Subfile;
        Exsr Load_Subfile;
        Exsr Display_Subfile;

        *Inlr = *On;

        //=====================================================================//
        // Clear_Subfile = Clear Sub File                                      //
        //---------------------------------------------------------------------//
        Begsr Clear_Subfile;

          RCDNBR = 1;
          SFLCLR = *On;
          RRN = 0;
          Write USRSFLCTL;
          SFLCLR = *Off;

        Endsr;

        //=====================================================================//
        // Load_Subfile = Load Sub File                                        //
        //---------------------------------------------------------------------//
        Begsr Load_Subfile;

          Select;
          When POSTO <> 0;

          Chain POSTO SFPF001;
          If %Found;
          Else;
            Setll POSTO SFPF001;
            Read SFPF001;
            If %EOF(SFPF001);
              Setll *HIVAL SFPF001;
              Readp SFPF001;
            EndIf;
          EndIf;

          Other;

          Setll *LOVAL SFPF001;
          Read SFPF001;

          Endsl;
          Dow Not %EOF(SFPF001);

            SUSERID = USERID;
            SUSERNAME = USERNAME;
            SUSERDEP = USERDEP;
            SUSERMOBNO = USERMOBNO;

            RRN += 1;

            If RRN = 1;
              FirstRRN = USERID;
            Endif;

            If RRN > 9999;
              Leavesr;
            Endif;

            Write USRSFL;
            Read SFPF001;

          Enddo;

        Endsr;

        //=====================================================================//
        // Display_Subfile = Display Sub File                                  //
        //---------------------------------------------------------------------//
        Begsr Display_Subfile;

          Dow Exit = *Off;

            Clear OPT;
            SFLDSP = *On;
            SFLDSPCTL = *On;
            SFLEND = *On;

            If RRN < 1;
              SFLDSP = *Off;
            Endif;

            Write FOOTER;
            EXFMT USRSFLCTL;
            Clear MSG1;

            Select;
            When Exit = *On;
              Leave;

            When Cancel = *On;
              Cancel = *off;
              Leave;

            When Refresh = *On;
              Refresh = *Off;
              Exsr Refresh_Subfile;

            When ADD1 = *On;
              Exsr Add_User_Detail;

            When POSTO <> 0;
              Exsr Clear_Subfile;
              Exsr Load_Subfile;
              POSTO = 0;
              WRITE USRSFLCTL;

            When PAGEUP = *On;
              If FirstKey = FirstRRN;
                PAGEUP = *Off;
              Else;
                Exsr Page_Up;
              Endif;

            Other;
              Exsr Process_Keys;
              If Counter = 'Y';
                Counter = ' ';
                Exsr Clear_Subfile;
                Exsr Load_Subfile;
              Endif;
              Setll *LOVAL SFPF001;
              Read SFPF001;
              If Not %eof(SFPF001);
                FirstKey = USERID;
              Endif;
            Endsl;
          Enddo;
        Endsr;

        //=====================================================================//
        // Process_Keys = To proceed as per option given by user               //
        //---------------------------------------------------------------------//
        Begsr Process_Keys;

          If POSTO = 0;
            RCDNBR = RecNo;
          Else;
            RCDNBR = 1;
          Endif;

          If RRN > 0;
            Readc USRSFL;
          Endif;

          Dow Not %EOF();
            optionRIPC = *Off;

            Select;
              When OPT = '2';
                Exsr Edit_User_Detail;
                Counter = 'Y';
                Clear OPT;

              When OPT = '4';
                SelCount += 1;
                SelRecord(SelCount).ID = SUSERID;
                SelRecord(SelCount).Name = SUSERNAME;
                Clear OPT;

              When OPT = '5';
                Exsr Display_User_Detail;
                Clear OPT;

              Other;
                If OPT <> *BLANKS;
                  optionRIPC = *On;
                  MSG1 = 'Enter Valid Option';
                Endif;
            Endsl;

            If Exit = *On;
              Leave;
            Endif;

            SFLNXTCHGIND = *ON;
            Update USRSFL;
            Readc USRSFL;

          Enddo;
          If SelCount > 0;
            Exsr Delete_User_Detail;
            Clear SelCount;
            Counter = 'Y';
          Endif;
        Endsr;

        //=====================================================================//
        // Add_User_Detail                                                     //
        //---------------------------------------------------------------------//
        Begsr Add_User_Detail;

          HEADING = 'Add User Details';
          FUNFLD = 'F3=Exit          F5=Refresh       F12=Cancel';
          Exsr Clear_All;
          Clear MSG2;
          Exsr Reset_Indicators;
          Setgt *Hival SFPF001;
          Readp SFPF001;
          DUSERID = USERID + 1;

          Dow Exit = *Off;

            EXFMT USRDTL;

            If Exit = *On;
              Leave;
            Endif;

            If Refresh = *On;
              Refresh = *Off;
              Clear DUSERNAME;
              Clear DUSERDEP;
              Clear DUSERMOBNO;
              Clear MSG2;
              Exsr Reset_Indicators;
              iter;
            Endif;

            If Cancel = *On;
              Cancel = *Off;
              Leave;
            Endif;

            If Prmpt = *On AND FLD = 'DUSERDEP';
              Exsr Select_Department;
            Endif;

            If UPDATE1 = *Off AND Prmpt = *Off AND ADD1 = *Off;
              UPDATE1 = *On;
              Exsr Reset_Indicators;
            Select;
            When DUSERNAME = *Blanks And
                 DUSERDEP = *Blanks And DUSERMOBNO = *Blanks;

              userNameRIPC = *On;
              MSG2 = 'Enter User Id, Name, Department & Mobile Number';

            When DUSERNAME = ' ' OR
              (%check('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ '
              :%trim(DUSERNAME)) <> 0)
              OR (%subst(DUSERNAME:1:1) < 'A');

              userNameRIPC = *On;
              MSG2 = 'Enter or Check User Name';

            When DUSERDEP = ' ';

              userDepartmentRIPC = *On;
              MSG2 = 'Enter User Department';

            When DUSERMOBNO = ' ' OR %len(%trim(DUSERMOBNO)) <> 10 OR
             (%subst(DUSERMOBNO:1:1) <> '6' And %subst(DUSERMOBNO:1:1) <> '7' And
             %subst(DUSERMOBNO:1:1) <> '8' And %subst(DUSERMOBNO:1:1) <> '9')
             OR (%check('1234567890':DUSERMOBNO) <> 0);

              userMobileNoRIPC = *On;
              MSG2 = 'Enter or Check User Mobile Number';

            Other;

              USERID = DUSERID;
              Exsr Input_Data;
              Write SFPFR ;
              Exsr Clear_Subfile;
              Exsr Load_Subfile;
              Exsr Clear_All;
              MSG1 = 'Record Added';
              Leave;

            Endsl;
            Endif;
          Enddo;
        EndSr;

        //=====================================================================//
        // Edit_User_Detail                                                    //
        //---------------------------------------------------------------------//
        Begsr Edit_User_Detail;

          HEADING = 'Edit User Details';
          FUNFLD = 'F3=Exit          F5=Refresh       F8=Update        F12=Cancel';
          Exsr Display_Data;
          Clear MSG2;
          Exsr Reset_Indicators;

          Dow Exit = *Off;

            EXFMT USRDTL;

            If Exit = *On;
              Leave;
            Endif;

            If Refresh = *On;
              Refresh = *Off;
              Exsr Display_Data;
              Clear MSG2;
              Exsr Reset_Indicators;
              iter;
            Endif;

            If Cancel = *On;
              Cancel = *off;
              Leave;
            Endif;

            If Prmpt = *On AND FLD = 'DUSERDEP';
              Exsr Select_Department;
            Endif;

            If UPDATE1 = *On;
              UPDATE1 = *Off;
              Exsr Reset_Indicators;
            Select;
            When DUSERNAME = *Blanks And
                 DUSERDEP = *Blanks And DUSERMOBNO = *Blanks;

              userNameRIPC = *On;
              MSG2 = 'Enter User Name, Department & Mobile Number';

            When DUSERNAME = ' ' OR
              (%check('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ '
              :%trim(DUSERNAME)) <> 0)
              OR (%subst(DUSERNAME:1:1) < 'A');

              userNameRIPC = *On;
              MSG2 = 'Enter or Check User Name';

            When DUSERDEP = ' ';

              userDepartmentRIPC = *On;
              MSG2 = 'Enter User Department';

            When DUSERMOBNO = ' ' OR %len(%trim(DUSERMOBNO)) <> 10 OR
             (%subst(DUSERMOBNO:1:1) <> '6' And %subst(DUSERMOBNO:1:1) <> '7' And
             %subst(DUSERMOBNO:1:1) <> '8' And %subst(DUSERMOBNO:1:1) <> '9')
             OR (%check('1234567890':DUSERMOBNO) <> 0);

              userMobileNoRIPC = *On;
              MSG2 = 'Enter or Check User Mobile Number';

            Other;

              Chain DUSERID SFPF001;
              If %found();
                Exsr Input_Data;
                Update SFPFR;
              Endif;
              Exsr Clear_All;
              MSG1 = 'Record Updated';
              Leave;

            Endsl;
          Endif;
          Enddo;
        Endsr;

        //=====================================================================//
        // Delete_User_Detail                                                  //
        //---------------------------------------------------------------------//
        Begsr Delete_User_Detail;

          Exsr Delete_Clear;
          Exsr Delete_Load;
          Exsr Delete_Display;

        Endsr;

        //   WOPT = 'N';
        //   WUSERID = SUSERID;
        //   Clear POPUPMSG;
        //   wOptionRIPC = *Off;

        //   Dow Cancel = *Off;

        //     Chain SUSERID SFPF001;
        //     If %found();
        //       EXFMT POPUP;
        //       If WOPT = 'N';
        //         Cancel = *On;

        //       Elseif WOPT = 'Y';
        //         Delete SFPFR;
        //         MSG1 = 'Record Deleted';
        //         Clear *ALL SFPFR;
        //         Cancel = *On;

        //       Else;
        //         Clear WOPT;
        //         wOptionRIPC = *On;
        //         POPUPMSG = 'Enter Valid Option';

        //       Endif;
        //     Endif;
        //   Enddo;

        //=====================================================================//
        // Display_User_Detail                                                 //
        //---------------------------------------------------------------------//
        Begsr Display_User_Detail;

          HEADING = 'Display User Details';
          FUNFLD = 'F3=Exit          F12=Cancel';
          Exsr Display_Data;

          Dow Exit = *off;

            userDetailPR = *On;
            userDetailUL = *On;
            promptND = *On;
            EXFMT USRDTL;

            Clear MSG2;
            Exsr Reset_Indicators;

            If Exit = *On;
              userDetailPR = *Off;
              userDetailUL = *Off;
              promptND = *Off;
              Leave;
            Endif;

            If Cancel = *On;
              Cancel = *Off;
              userDetailPR = *Off;
              userDetailUL = *Off;
              promptND = *Off;
              Leave;
            Endif;
          Enddo;
        Endsr;

        //=====================================================================//
        // Refresh_Subfile                                                     //
        //---------------------------------------------------------------------//
        Begsr Refresh_Subfile;

          optionRIPC = *Off;
          Exsr Clear_Subfile;
          Exsr Load_Subfile;

        Endsr;

        //=====================================================================//
        // Clear_All - Clear all Data                                          //
        //---------------------------------------------------------------------//
        Begsr Clear_All;

          Clear DUSERID;
          Clear DUSERNAME;
          Clear DUSERDEP;
          Clear DUSERMOBNO;

        Endsr;

        //=====================================================================//
        // Input_Data - Enter Data into the PF                                 //
        //---------------------------------------------------------------------//
        Begsr Input_Data;

          USERNAME = DUSERNAME;
          USERDEP = DUSERDEP;
          USERMOBNO = DUSERMOBNO;

        Endsr;


        //=====================================================================//
        // Reset_Indicators                                                    //
        //---------------------------------------------------------------------//
        Begsr Reset_Indicators;

          userNameRIPC = *Off;
          userDepartmentRIPC = *Off;
          userMobileNoRIPC = *Off;

        Endsr;

        //=====================================================================//
        // Display_Data                                                        //
        //---------------------------------------------------------------------//
        Begsr Display_Data;

          DUSERID = SUSERID;
          DUSERNAME = SUSERNAME;
          DUSERDEP = SUSERDEP;
          DUSERMOBNO = SUSERMOBNO;

        Endsr;

        //=====================================================================//
        // Select_Department                                                   //
        //---------------------------------------------------------------------//
        Begsr Select_Department;

          Clear PROMPTMSG;
          Clear WSEL;
          wSelectionRIPC = *Off;

          Dow Cancel = *Off;

          EXFMT PROMPT;

          Select;
          When WSEL = '1';
            DUSERDEP = 'RPG';
            userDepartmentRIPC = *Off;
            Clear MSG2;
            Clear PROMPTMSG;
            Clear WSEL;
            wSelectionRIPC = *Off;
            Exsr Validate_Fields;
            leavesr;

          When WSEL = '2';
            DUSERDEP = 'Java';
            userDepartmentRIPC = *Off;
            Clear MSG2;
            Clear PROMPTMSG;
            Clear WSEL;
            wSelectionRIPC = *Off;
            Exsr Validate_Fields;
            leavesr;

          When WSEL = '3';
            DUSERDEP = 'EDI';
            userDepartmentRIPC = *Off;
            Clear MSG2;
            Clear PROMPTMSG;
            Clear WSEL;
            wSelectionRIPC = *Off;
            Exsr Validate_Fields;
            leavesr;

          Other;
            wSelectionRIPC = *On;
            PROMPTMSG = 'Invalid Selection';

          Endsl;

        Enddo;
        Endsr;

        //=====================================================================//
        // Page_Up                                                             //
        //---------------------------------------------------------------------//
        Begsr Page_Up;

          Setll FirstRRN SFPF001;
          For i = 1 to 8;
            Readp SFPF001;
            If %eof(SFPF001);

              SFLEND = *off;
              Setll *LOVAL SFPF001;
              Leave;

            Endif;
          Endfor;

          POSTO = USERID;
          PAGEUP = *off;
          Exsr Clear_Subfile;
          Exsr Load_Subfile;

        Endsr;

        //=====================================================================//
        // Validate_Fields                                                     //
        //---------------------------------------------------------------------//
        Begsr Validate_Fields;
          If (%check('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ '
            : %trim(DUSERNAME)) <> 0) OR
            (%subst(DUSERNAME:1:1) < 'A');
            userNameRIPC = *On;
            MSG2 = 'Enter or Check User Name';
          Else;
            userNameRIPC = *Off;
            Clear MSG2;
          Endif;

          If %len(%trim(DUSERMOBNO)) <> 10 OR
            (%subst(DUSERMOBNO:1:1) <> '6' And %subst(DUSERMOBNO:1:1) <> '7' And
              %subst(DUSERMOBNO:1:1) <> '8' And %subst(DUSERMOBNO:1:1) <> '9') OR
            (%check('1234567890': DUSERMOBNO) <> 0);
            userMobileNoRIPC = *On;
            MSG2 = 'Enter or Check User Mobile Number';
          Else;
            userMobileNoRIPC = *Off;
            Clear MSG2;
          Endif;

        Endsr;

        //=====================================================================//
        // Delete_Clear                                                        //
        //---------------------------------------------------------------------//
        Begsr Delete_Clear;
          DLTCLR = *On;
          RRN1 = 0;
          Write DLTSFLCTL;
          DLTCLR = *Off;
        Endsr;

        //=====================================================================//
        // Delete_Load                                                         //
        //---------------------------------------------------------------------//
        Begsr Delete_Load;
          For j=1 to SelCount;
          DLTID = SelRecord(j).ID;
          DLTNAME = SelRecord(j).Name;
          RRN1 +=  1;
          IF RRN1 > 9999;
            Leavesr;
          Endif;
          Write DLTSFL;
          If SelCount = j;
            DLTEND = *On;
          Else;
            DLTEND = *Off;
          Endif;
          Endfor;
        Endsr;

        //=====================================================================//
        // Delete_Display                                                      //
        //---------------------------------------------------------------------//
        Begsr Delete_Display;
          Dow Exit = *Off;

          If Exit = *On;
            Leave;
          Endif;

          If Cancel = *On;
            Cancel = *Off;
            Leave;
          Endif;

          DLTDSP = *On;
          DLTDSPCTL = *On;
          If RRN1 <1;
            DLTDSP = *Off;
          Endif;
          Write DLTFOOTER;
          EXFMT DLTSFLCTL;

          Enddo;
        Endsr;
