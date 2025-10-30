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
        Dcl-f SF001 workstn Sfile(USRSFL:USRRRN) Sfile(DLTSFL:DLTRRN)
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
          userMobileNoRI IND POS(53);
          userMobileNoPC IND POS(56);
          wSelectionRIPC IND POS(55);
          userDetailPR IND POS(60);
          promptND IND POS(61);
          userDetailUL IND POS(71);
          PAGEUP IND POS(90);
          SFLNXTCHGIND IND POS(91);
        End-DS;

        Dcl-DS infds1;
          RecNo int(5) pos(378);
        End-DS;

        Dcl-S USRRRN packed(4:0);
        Dcl-S DLTRRN packed(4:0);
        Dcl-s FirstKey packed(5:0);
        Dcl-s FirstId packed(5:0);
        Dcl-s Counter1 char(1);
        Dcl-s Counter2 packed(4:0);
        Dcl-s Counter3 packed(4:0);
        Dcl-s InvalidFound IND;

        Dcl-S SelCount packed(10:0);
        Dcl-DS SelRecord Dim(100) Qualified;
          ID like(USERID);
          Name like(USERNAME);
        End-DS;

        // Main Logic
        Setll *LOVAL SFPF001;
        Read SFPF001;
        If Not %eof(SFPF001);
          FirstId = USERID;
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
          USRRRN = 0;
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

            USRRRN += 1;

            If USRRRN = 1;
              FirstKey = USERID;
            Endif;

            If USRRRN > 9999;
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

            If USRRRN < 1;
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
              If FirstId = FirstKey;
                PAGEUP = *Off;
              Else;
                Exsr Page_Up;
              Endif;

            Other;
              Exsr Process_Keys;
              If Counter1 = 'Y';
                Counter1 = ' ';
                Exsr Clear_Subfile;
                Exsr Load_Subfile;
              Endif;
              Setll *LOVAL SFPF001;
              Read SFPF001;
              If Not %eof(SFPF001);
                FirstId = USERID;
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

          If USRRRN > 0;
            SFLNXTCHGIND = *ON;
            Readc USRSFL;
          Endif;

          InvalidFound = *Off;
          Dow Not %EOF();

            optionRIPC = *Off;

            If OPT <> '2' and OPT <> '4' and OPT <> '5' and OPT <> *BLANKS;

              optionRIPC = *On;
              MSG1 = 'Enter Valid Option';
              InvalidFound = *On;

            Endif;

            SFLNXTCHGIND = *ON;
            Update USRSFL;
            Readc USRSFL;

          Enddo;

          If InvalidFound = *On;
            MSG1 = 'Enter Valid Option';
            Leavesr;
          Endif;

          If USRRRN > 0;
            SFLNXTCHGIND = *ON;
            Readc USRSFL;
          Endif;

          Dow Not %EOF();

            optionRIPC = *Off;

            Select;
              When OPT = '2';
                Exsr Edit_User_Detail;
                Counter1 = 'Y';
                Clear OPT;

              When OPT = '4';
                SelCount += 1;
                SelRecord(SelCount).ID = SUSERID;
                SelRecord(SelCount).Name = SUSERNAME;
                Clear OPT;

              When OPT = '5';
                Exsr Display_User_Detail;
                Clear OPT;

            Endsl;

            If Exit = *On;
              Leave;
            Endif;

            SFLNXTCHGIND = *On;
            Update USRSFL;
            Readc USRSFL;

          Enddo;

          If SelCount > 0;
            Exsr Delete_User_Detail;
            Clear SelCount;
            Counter1 = 'Y';
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

            If Cancel = *On;
              Cancel = *Off;
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

            If Prmpt = *On AND FLD = 'DUSERDEP';
              If DUSERNAME <> ' ';
                Exsr Select_Department;
                userMobileNoPC = *On;
              Else;
                userNameRIPC = *On;
                MSG2 = 'Enter User Name First';
              Endif;
            Endif;

            If UPDATE1 = *Off AND Prmpt = *Off AND ADD1 = *Off;
              UPDATE1 = *On;
              Exsr Validate_User_Input;

              If userNameRIPC = *Off And userDepartmentRIPC = *Off
              And userMobileNoRI = *Off And userMobileNoPC = *Off;

                USERID = DUSERID;
                Exsr Input_Data;
                Write SFPFR;
                Exsr Clear_Subfile;
                Exsr Load_Subfile;
                Exsr Clear_All;
                Leave;

              Endif;
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

            If Cancel = *On;
              Cancel = *off;
              Leave;
            Endif;

            If Refresh = *On;
              Refresh = *Off;
              Exsr Display_Data;
              Clear MSG2;
              Exsr Reset_Indicators;
              iter;
            Endif;

            If Prmpt = *On AND FLD = 'DUSERDEP';
              If DUSERNAME <> ' ';
                Exsr Select_Department;
              Else;
                userNameRIPC = *On;
                MSG2 = 'Enter User Name First';
              Endif;
            Endif;

            If UPDATE1 = *On;
              UPDATE1 = *Off;
              Exsr Validate_User_Input;

              If userNameRIPC = *Off And userDepartmentRIPC = *Off
              And userMobileNoRI = *Off And userMobileNoPC = *Off;
                Chain DUSERID SFPF001;
                If %found();
                  Exsr Input_Data;
                  Update SFPFR;
                Endif;
                Exsr Clear_All;
                MSG1 = 'Record Updated';
                Leave;
              Endif;

            Endif;

          Enddo;

        Endsr;

        //=====================================================================//
        // Validate_User_Input                                                 //
        //---------------------------------------------------------------------//
        Begsr Validate_User_Input;

          Exsr Reset_Indicators;

          Select;
          When DUSERNAME = ' ' And DUSERDEP = ' ' And DUSERMOBNO = ' ';
            userNameRIPC = *On;
            MSG2 = 'Enter User Name, Department & Mobile Number';

          When DUSERNAME = ' ' OR
            (%check('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ '
            : %trim(DUSERNAME)) <> 0)
            OR (%subst(DUSERNAME:1:1) < 'A');
            userNameRIPC = *On;
            MSG2 = 'Enter or Check User Name';

          When DUSERDEP = ' ';
            userDepartmentRIPC = *On;
            MSG2 = 'Enter User Department';

          When DUSERMOBNO = ' ' OR %len(%trim(DUSERMOBNO)) <> 10 OR
            (%subst(DUSERMOBNO:1:1) <> '6' And %subst(DUSERMOBNO:1:1) <> '7' And
              %subst(DUSERMOBNO:1:1) <> '8' And %subst(DUSERMOBNO:1:1) <> '9')
            OR (%check('1234567890': DUSERMOBNO) <> 0);
            userMobileNoRI = *On;
            userMobileNoPC = *On;
            MSG2 = 'Enter or Check User Mobile Number';

          Endsl;

        Endsr;

        //=====================================================================//
        // Delete_User_Detail                                                  //
        //---------------------------------------------------------------------//
        Begsr Delete_User_Detail;

          Exsr Delete_Clear;
          Exsr Delete_Load;
          Exsr Delete_Display;

        Endsr;

        //=====================================================================//
        // Delete_Clear                                                        //
        //---------------------------------------------------------------------//
        Begsr Delete_Clear;

          DLTCLR = *On;
          DLTRRN = 0;
          Write DLTSFLCTL;
          DLTCLR = *Off;

        Endsr;

        //=====================================================================//
        // Delete_Load                                                         //
        //---------------------------------------------------------------------//
        Begsr Delete_Load;

          For Counter3 = 1 to SelCount;
            DLTID = SelRecord(Counter3).ID;
            DLTNAME = SelRecord(Counter3).Name;
            DLTRRN +=  1;

            If DLTRRN > 9999;
              Leavesr;
            Endif;

            Write DLTSFL;

            If SelCount = Counter3;
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
            If DLTRRN <1;
              DLTDSP = *Off;
            Endif;

            Write DLTFOOTER;
            EXFMT DLTSFLCTL;

            If Cancel = *Off;
              For Counter3 = 1 to SelCount;
                DLTID = SelRecord(Counter3).ID;
                Chain DLTID SFPF001;

                If %Found;
                  Delete SFPFR;
                Endif;

              Endfor;
              MSG1 = 'Record Deleted';
              Leave;
            Endif;

          Enddo;

        Endsr;

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
        // Select_Department                                                   //
        //---------------------------------------------------------------------//
        Begsr Select_Department;

          Clear PROMPTMSG;
          Clear WSEL;
          wSelectionRIPC = *Off;

          Dow Cancel = *Off;

            Select;
            When DUSERDEP = 'RPG';
              WSEL = '1';

            When DUSERDEP = 'Java';
              WSEL = '2';

            When DUSERDEP = 'EDI';
              WSEL = '3';

            Other;
              WSEL = '1';
            Endsl;

            EXFMT PROMPT;

            Select;
            When WSEL = '1';
              DUSERDEP = 'RPG';
              Exsr Prompt_Validation;
              leavesr;

            When WSEL = '2';
              DUSERDEP = 'Java';
              Exsr Prompt_Validation;
              leavesr;

            When WSEL = '3';
              DUSERDEP = 'EDI';
              Exsr Prompt_Validation;
              leavesr;

            Other;
              wSelectionRIPC = *On;
              PROMPTMSG = 'Invalid Selection';

            Endsl;

          Enddo;

        Endsr;

        //=====================================================================//
        // Prompt_Validation                                                   //
        //---------------------------------------------------------------------//
        Begsr Prompt_Validation;

          userDepartmentRIPC = *Off;
          Clear MSG2;
          Clear PROMPTMSG;
          Clear WSEL;
          wSelectionRIPC = *Off;
          Exsr Validate_Fields;

        Endsr;

        //=====================================================================//
        // Validate_Fields                                                     //
        //---------------------------------------------------------------------//
        Begsr Validate_Fields;

          If DUSERNAME <> ' ';

            If (%check('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ '
              : %trim(DUSERNAME)) <> 0) OR
              (%subst(DUSERNAME:1:1) < 'A');

              userNameRIPC = *On;
              MSG2 = 'Enter or Check User Name';

            Else;

              userNameRIPC = *Off;
              Clear MSG2;

            Endif;

          Endif;

          If DUSERMOBNO <> ' ';

            If %len(%trim(DUSERMOBNO)) <> 10 OR
              (%subst(DUSERMOBNO:1:1) <> '6' And %subst(DUSERMOBNO:1:1) <> '7' And
                %subst(DUSERMOBNO:1:1) <> '8' And %subst(DUSERMOBNO:1:1) <> '9') OR
              (%check('1234567890': DUSERMOBNO) <> 0);

              userMobileNoRI = *On;
              userMobileNoPC = *On;
              MSG2 = 'Enter or Check User Mobile Number';

            Else;

              userMobileNoRI = *Off;
              userMobileNoPC = *Off;
              Clear MSG2;

            Endif;

          Endif;

        Endsr;

        //=====================================================================//
        // Page_Up                                                             //
        //---------------------------------------------------------------------//
        Begsr Page_Up;

          Setll FirstKey SFPF001;
          For Counter2 = 1 to 8;
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
        // Input_Data                                                          //
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
          userMobileNoRI = *Off;
          userMobileNoPC = *Off;

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
