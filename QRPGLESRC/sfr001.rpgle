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
        Dcl-f SF001 workstn Sfile(USRSFL:RRN) indds(Operations) infds(infds1);

        // Data Structure Declaration
        Dcl-DS Operations;
          Exit IND POS(03);
          Refresh IND POS(05);
          ADD1 IND POS(06);
          UPDATE1 IND POS(08);
          Cancel IND POS(12);
          SFLDSP IND POS(31);
          SFLDSPCTL IND POS(32);
          SFLCLR IND POS(33);
          SFLEND IND POS(34);
          optionRIPC IND POS(50);
          userNameRIPC IND POS(52);
          userDepartmentRIPC IND POS(53);
          userMobileNoRIPC IND POS(54);
          wOptRIPC IND POS(55);
          userDetailPR IND POS(61);
        End-DS;

        Dcl-DS infds1;
          RecNo int(5) pos(378);
        End-DS;

        Dcl-S RRN packed(4:0);

        // Main Logic
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

          Setll *LOVAL SFPF001;
          Read SFPF001;
          Dow Not %EOF(SFPF001);

            SUSERID = USERID;
            SUSERNAME = USERNAME;
            SUSERDEP = USERDEP;
            SUSERMOBNO = USERMOBNO;

            RRN += 1;
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

            Write HEADER;
            Write FOOTER;
            EXFMT USRSFLCTL;
            Clear MSG1;

            Select;
            When Cancel = *On;
              Cancel = *off;
              Leave;

            When Refresh = *On;
              Exsr Refresh_Subfile;

            When ADD1 = *On;
              Exsr Add_User_Detail;

            Other;
              Exsr Process_Keys;

            Endsl;

          Enddo;

        Endsr;

        //=====================================================================//
        // Process_Keys = To proceed as per option given by user               //
        //---------------------------------------------------------------------//
        Begsr Process_Keys;

          RCDNBR = RecNo;

          If RRN > 0;
            Readc USRSFL;
          Endif;

          optionRIPC = *Off;

          Dow Not %EOF();

            Select;
            When OPT = '2';
              Clear OPT;
              Exsr Edit_User_Detail;

            When OPT = '4';
              Clear OPT;
              Exsr Delete_User_Detail;

            When OPT = '5';
              Exsr Display_User_Detail;
              If OPT = '5';
                Clear OPT;
                Exsr Refresh_Subfile;
              Endif;

            Other;
              If OPT <> *BLANKS;
                Clear OPT;
                optionRIPC = *On;
                MSG1 = 'Enter Valid Option';
              Endif;

              Update USRSFL;

            Endsl;

            Readc USRSFL;

          Enddo;

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
          Setll *Hival SFPF001;
            If USERID >= 1;
              DUSERID = USERID + 1;
            Else;
              DUSERID = 1;
          Endif;

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
              iter;
            Endif;

            If Cancel = *On;
              Cancel = *Off;
              Leave;
            Endif;

            If UPDATE1 = *Off;
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
              Exsr Clear_All;
              Exsr Clear_Subfile;
              Exsr Load_Subfile;
              MSG1 = 'Record Added';
              Leave;

            Endsl;
            iter;
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
              iter;
            Endif;

            If Cancel = *On;
              Cancel = *off;
              Leave;
            Endif;

            If UPDATE1 = *On;
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
              MSG2 = 'Enter User Name';

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
              Exsr Clear_Subfile;
              Exsr Load_Subfile;
              MSG1 = 'Record Updated';
              Leave;

            Endsl;
            iter;

          Endif;
          Enddo;

        Endsr;

        //=====================================================================//
        // Delete_User_Detail                                                  //
        //---------------------------------------------------------------------//
        Begsr Delete_User_Detail;

          WOPT = 'N';
          WUSERID = SUSERID;
          Clear POPUPMSG;
          wOptRIPC = *Off;

          Dow Cancel = *Off;

            Chain SUSERID SFPF001;
            If %found();
              EXFMT POPUP;
              If WOPT = 'N';
                Cancel = *On;

              Elseif WOPT = 'Y';
                Delete SFPFR;
                Exsr Clear_All;
                Exsr Clear_Subfile;
                Exsr Load_Subfile;
                MSG2 = 'Record Deleted';
                Cancel = *On;

              Else;
                Clear WOPT;
                wOptRIPC = *On;
                POPUPMSG = 'Enter Valid Option';

              Endif;
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
            EXFMT USRDTL;

            Clear MSG2;
            Exsr Reset_Indicators;

            If Exit = *On;
              userDetailPR = *Off;
              Leave;
            Endif;

            If Cancel = *On;
              Cancel = *Off;
              userDetailPR = *Off;
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
