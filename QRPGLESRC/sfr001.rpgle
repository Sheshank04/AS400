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
          userIdRIPC IND POS(51);
          userNameRIPC IND POS(52);
          userDepartmentRIPC IND POS(53);
          userMobileNoRIPC IND POS(54);
          userIdPR IND POS(60);
          userIdUL IND POS(61);
          userDetailPR IND POS(62);
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

            If Cancel = *On;
              Cancel = *Off;
              Leave;
            Endif;

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
        // Edit_User_Detail                                                    //
        //---------------------------------------------------------------------//
        Begsr Edit_User_Detail;

          HEADING = 'Edit User Details';
          Exsr Display_Data;

          Dow Exit = *Off;

            userIdUL= *On;
            userIdPR = *On;
            EXFMT USRDTL;

            Clear MSG2;
            Exsr Reset_Indicators;

            If Exit = *On;
              Leave;
            Endif;

            If Refresh = *On;
              Refresh = *Off;
              DUSERID = SUSERID;
              DUSERNAME = SUSERNAME;
              DUSERDEP = SUSERDEP;
              DUSERMOBNO = SUSERMOBNO;
              Clear MSG2;
              iter;
            Endif;

            If Cancel = *On;
              Cancel = *off;
              Leave;
            Endif;

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

              If UPDATE1 = *On;

                Chain DUSERID SFPF001;
                If %found();
                  Exsr Input_Data;
                  Update SFPFR;
                Endif;

                Exsr Clear_All;
                Exsr Clear_Subfile;
                Exsr Load_Subfile;
                MSG2 = 'Record Updated';

              Endif;

            Endsl;
            iter;

          Enddo;

        Endsr;

        //=====================================================================//
        // Delete_User_Detail                                                  //
        //---------------------------------------------------------------------//
        Begsr Delete_User_Detail;

          HEADING = 'Delete User Details';
          Exsr Display_Data;

          Dow Exit = *off;

            userIdPR = *On;
            userDetailPR = *On;
            EXFMT USRDTL;

            Clear MSG2;
            Exsr Reset_Indicators;

            If Exit = *On;
              Leave;
            Endif;

            If Cancel = *On;
              Cancel = *off;
              Leave;
            Endif;

            Chain DUSERID SFPF001;

            If UPDATE1 = *Off;

              If %found();
                Delete SFPFR;
              Endif;

              Exsr Clear_All;
              Exsr Clear_Subfile;
              Exsr Load_Subfile;
              MSG2 = 'Record Deleted';

            Endif;

          Enddo;

        Endsr;

        //=====================================================================//
        // Display_User_Detail                                                 //
        //---------------------------------------------------------------------//
        Begsr Display_User_Detail;

          HEADING = 'Delete User Details';
          Exsr Display_Data;

          Dow Exit = *off;

            userIdPR = *On;
            userDetailPR = *On;
            EXFMT USRDTL;

            Clear MSG2;
            Exsr Reset_Indicators;

            If Exit = *On;
              Leave;
            Endif;

            If Cancel = *On;
              Cancel = *off;
              Leave;
            Endif;

          Enddo;

        Endsr;

        //=====================================================================//
        // Add_User_Detail = To add new user detail                            //
        //---------------------------------------------------------------------//
        Begsr Add_User_Detail;

          HEADING = 'Add User Details';
          userIdUL = *Off;

          Dow Exit = *Off;

            EXFMT USRDTL;
            Clear MSG2;
            Exsr Reset_Indicators;

            If Exit = *On;
              Leave;
            Endif;

            If Refresh = *On;
              Refresh = *Off;
              Exsr Clear_All;
              Clear MSG2;
              iter;
            Endif;

            If Cancel = *On;
              Cancel = *Off;
              Leave;
            Endif;

            Select;
            When DUSERID = 0 And DUSERNAME = *Blanks And
                 DUSERDEP = *Blanks And DUSERMOBNO = *Blanks;

              userIdRIPC = *On;
              MSG2 = 'Enter User Id, Name, Department & Mobile Number';

            When DUSERID = 0;
              userIdRIPC = *On;
              MSG2 = 'Enter User Id';

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

              If UPDATE1 = *Off;

                Exsr Input_Data;
                USERID = DUSERID;
                Chain DUSERID SFPF001;

                If %found();

                  userIdRIPC = *On;
                  MSG2 = 'Duplicate Record Found';
                  iter;

                Endif;

                Write SFPFR ;
                Exsr Clear_All;
                Exsr Clear_Subfile;
                Exsr Load_Subfile;
                MSG2 = 'Record Added';

              Endif;

            Endsl;
            iter;

          Enddo;

          ADD1 = *Off;

        EndSr;

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

          userIdRIPC = *Off;
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
