     A* -----------------------------------------------------------------------//
     A* CREATED BY.......: Programmers.io @ 2025                               //
     A* CREATE DATE......: 2025/09/25                                          //
     A* DEVELOPER........: Sheshank Srivastava                                 //
     A* DESCRIPTION......: User Details CRUD operations using DSPF             //
     A* -----------------------------------------------------------------------//
     A* Modification Log                                                       //
     A* -----------------------------------------------------------------------//
     A* Date     Mod_ID      Developer   Case and Description                  //
     A* YY/MM/DD ----------  ----------  --------------------------------------//
     A*                                                                        //
     A* -----------------------------------------------------------------------//

**free
        Ctl-Opt Option(*Nodebugio : *Srcstmt);
        dcl-f UDPF001 usage(*input:*output:*update:*delete) keyed;
        dcl-f UDDSPF001 workstn INDDS(operations);
        dcl-s DateError ind inz(*off);
        dcl-s Duplicate ind inz(*off);

        dcl-ds operations;

          Exit IND Pos(03);
          Refresh IND Pos(05);
          UPD IND Pos(06);
          DLT IND Pos(07);
          INSRT IND Pos(08);
          Cancel IND Pos(12);
          DUSERIDRI1 IND Pos(10);
          DUSERIDPC1 IND Pos(20);
          DUSERIDRI IND Pos(21);
          DUSERIDPC IND Pos(31);
          DUSERNAMERI IND Pos(22);
          DUSERNAMEPC IND Pos(32);
          DUSERDOBRI IND Pos(23);
          DUSERDOBPC IND Pos(33);
          DUSERAGERI IND Pos(24);
          DUSERAGEPC IND Pos(34);
          DUSERPHNNORI IND Pos(25);
          DUSERPHNNOPC IND Pos(35);

        end-ds;

        dow Exit = *off;

          exfmt REC001;

        //=====================================================================//
        // Read - When User Id entered                                         //
        //---------------------------------------------------------------------//
          chain DUSERID UDPF001;
            DUSERIDRI1 = *off;
            DUSERIDPC1 = *off;
          if %found(UDPF001);

            DUSERNAME = USERNAME;
            DUSERDOB = %char(USERDOB);
            DUSERAGE = USERAGE;
            DUSERPHNNO = USERPHNNO;
            MSG1 = 'Record Found';

          elseif DUSERID = 0;

            DUSERIDRI1 = *on;
            DUSERIDPC1 = *on;
            MSG1 = 'Enter Order Id';
            exsr clearAll;

          else;

            DUSERIDRI1 = *on;
            DUSERIDPC1 = *on;
            MSG1 = 'Order Id not found';
            exsr clearAll;

          endif;

        //=====================================================================//
        // Refresh - When Pressed F5                                           //
        //---------------------------------------------------------------------//
          if Refresh = *on;
            exsr clearall;
            clear MSG1;
            DUSERIDRI1 = *off;
            DUSERIDPC1 = *off;
            iter;
          endif;

        //=====================================================================//
        // Insert - When Pressed F8                                            //
        //---------------------------------------------------------------------//
          if INSRT = *on;

            exsr clearAll;

            dow Exit = *off;

              exfmt INSERT;

              clear MSG2;
              DUSERIDRI = *off;
              DUSERIDPC = *off;
              DUSERNAMERI = *off;
              DUSERNAMEPC = *off;
              DUSERDOBRI = *off;
              DUSERDOBPC = *off;
              DUSERAGERI = *off;
              DUSERAGEPC = *off;
              DUSERPHNNORI = *off;
              DUSERPHNNOPC = *off;

              if Exit = *on;
                leave;
              endif;

              if Refresh = *on;
                Refresh = *off;
                exsr clearAll;
                clear MSG2;
                iter;
              endif;

              if Cancel = *on;
                Cancel = *off;
                clear REC001;
                DUSERIDRI1 = *off;
                DUSERIDPC1 = *off;
                leave;
              endif;

              select;
              when DUSERID = 0;

                DUSERIDRI = *on;
                DUSERIDPC = *on;
                MSG2 = 'Field(s) missed to enter';

              when DUSERNAME = ' ';

                DUSERNAMERI = *on;
                DUSERNAMEPC = *on;
                MSG2 = 'Field(s) missed to enter';

              when DUSERDOB = ' ';

                DUSERDOBRI = *on;
                DUSERDOBPC = *on;
                MSG2 = 'Field(s) missed to enter';

              when DUSERAGE = 0;

                DUSERAGERI = *on;
                DUSERAGEPC = *on;
                MSG2 = 'Field(s) missed to enter';

              when DUSERPHNNO = ' ';

                DUSERPHNNORI = *on;
                DUSERPHNNOPC = *on;
                MSG2 = 'Field(s) missed to enter';

              other;

                exsr userId;
                if Duplicate = *on;
                  DUSERIDRI = *on;
                  DUSERIDPC = *on;
                  iter;
                endif;
                exsr inputData;
                if DateError = *on;
                  DUSERDOBRI = *on;
                  DUSERDOBPC = *on;
                  iter;
                endif;
                write UDR ;
                MSG2 = 'Record Added';
                exsr clearall;

              endsl;
              iter;

            enddo;

            INSRT = *off;

          endif;

        //=====================================================================//
        // Update - When Pressed F6                                            //
        //---------------------------------------------------------------------//
          if UPD = *on AND DUSERID > 0;

            exsr clearAll;

            dow Exit = *off;

              DUSERID = USERID;
              DUSERNAME = USERNAME;
              DUSERDOB = %char(USERDOB);
              DUSERAGE = USERAGE;
              DUSERPHNNO = USERPHNNO;


              exfmt UPDATE;

              clear MSG3;
              DUSERNAMERI = *off;
              DUSERNAMEPC = *off;
              DUSERDOBRI = *off;
              DUSERDOBPC = *off;
              DUSERAGERI = *off;
              DUSERAGEPC = *off;
              DUSERPHNNORI = *off;
              DUSERPHNNOPC = *off;

             if Exit = *on;
                leave;
             endif;

             if Refresh = *on;
                Refresh = *off;

                DUSERNAME = USERNAME;
                DUSERDOB = %char(USERDOB);
                DUSERAGE = USERAGE;
                DUSERPHNNO = USERPHNNO;
                clear MSG3;
                iter;

              endif;

              if Cancel = *on;
                Cancel = *off;
                clear REC001;
                DUSERIDRI1 = *off;
                DUSERIDPC1 = *off;
                leave;
              endif;

              select;
              when DUSERNAME = ' ';

                DUSERNAMERI = *on;
                DUSERNAMEPC = *on;
                MSG3 = 'Field(s) missed to enter';

              when DUSERDOB = ' ';

                DUSERDOBRI = *on;
                DUSERDOBPC = *on;
                MSG3 = 'Field(s) missed to enter';

              when DUSERAGE = 0;

                DUSERAGERI = *on;
                DUSERAGEPC = *on;
                MSG3 = 'Field(s) missed to enter';

              when DUSERPHNNO = ' ';

                DUSERPHNNORI = *on;
                DUSERPHNNOPC = *on;
                MSG3 = 'Field(s) missed to enter';

              other;

                exsr inputData;
                if DateError = *on;
                  DUSERDOBRI = *on;
                  DUSERDOBPC = *on;
                  iter;
                endif;
                update UDR ;
                MSG3 = 'Record Updated';
                exsr clearall;

              endsl;
              iter;

            enddo;

            UPD = *off;

          endif;

        //=====================================================================//
        // Delete - When Pressed F7                                            //
        //---------------------------------------------------------------------//
          if DLT = *on;
            chain DUSERID UDPF001;
              DUSERIDRI1 = *off;
              DUSERIDPC1 = *off;
            if %found(UDPF001);

              delete UDR;
              MSG1 = 'Record Deleted';
              exsr clearAll;

            else;

              DUSERIDRI1 = *on;
              DUSERIDPC1 = *on;
              MSG1 = 'Order Id not found';
              exsr clearAll;

            endif;
            iter;

          endif;

        enddo;

        *inlr = *on;

        //=====================================================================//
        // clearAll - Clear all Data                                           //
        //---------------------------------------------------------------------//
        Begsr clearAll;

          clear DUSERID;
          clear DUSERNAME;
          clear DUSERDOB;
          clear DUSERAGE;
          clear DUSERPHNNO;


        Endsr;

        //=====================================================================//
        // inputData - Enter or Update Data into the PF                        //
        //---------------------------------------------------------------------//
        Begsr inputData;

          USERNAME = DUSERNAME;
          monitor;
            USERDOB = %date(DUSERDOB: *ISO);
          on-error;
            MSG2 = 'Invalid date format. Use YYYY-MM-DD';
            MSG3 = 'Invalid date format. Use YYYY-MM-DD';
            DateError = *on;
          endmon;
          USERAGE = DUSERAGE;
          USERPHNNO = DUSERPHNNO;

        Endsr;

        //=====================================================================//
        // userId - To handle Duplicate record entry                           //
        //---------------------------------------------------------------------//

        Begsr userId;

          monitor;
            USERID = DUSERID;
            on-error;
            MSG = 'Duplicate Id Found';
            Duplicate = *on;
          endmon;

        endsr;
