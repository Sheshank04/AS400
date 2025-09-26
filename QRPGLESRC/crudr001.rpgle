     A* -----------------------------------------------------------------------//
     A* CREATED BY.......: Programmers.io @ 2025                               //
     A* CREATE DATE......: 2025/09/19                                          //
     A* DEVELOPER........: Sheshank Srivastava                                 //
     A* DESCRIPTION......: CRUD                                                //
     A* -----------------------------------------------------------------------//
     A* Modification Log                                                       //
     A* -----------------------------------------------------------------------//
     A* Date     Mod_ID      Developer   Case and Description                  //
     A* YY/MM/DD ----------  ----------  --------------------------------------//
     A*                                                                        //
     A* -----------------------------------------------------------------------//

**free
        dcl-f OTPF001 usage(*input:*output:*update:*delete) keyed;
        dcl-f CRUDDSPF workstn;
        dcl-s DateError ind;
        DateError = *off;

        dow *IN03 = *off;

            exfmt REC001;

            //Refresh
            if *IN05 = *on;

                exsr clearall;
                clear MSG;
                iter;

            endif;

            //Write
            if *IN08 = *on;

                if OID = ' ' or CID = ' ' or ODATE = ' ' or IID = ' ' or IQUANTITY = ' ';

                    MSG = 'Field(s) missed to enter';

                else;

                    monitor;
                        USERID = DUSERID;
                    on-error;
                        MSG = 'Duplicate Record Found';
                        iter;
                    endmon;
                    exsr inputData;
                    if DateError = *on;
                        iter;
                    endif;
                    write OTR;
                    MSG = 'Record Added';
                    exsr clearall;

                endif;
                iter;

            endif;

            //Update
            if *IN06 = *on;

                if CID = ' ' or ODATE = ' ' or IID = ' ' or IQUANTITY = ' ';

                    MSG = 'Field(s) missed to enter';

                else;

                    exsr inputData;
                    if DateError = *on;
                        iter;
                    endif;
                    update OTR;
                    MSG = 'Record Updated';
                    exsr clearall;

                endif;
                iter;

            endif;

            //Delete
            if *IN07 = *on;

                chain OID OTPF001;
                if %found;

                    delete OTR;
                    MSG = 'Record Deleted';
                    exsr clearall;

                else;

                    MSG = 'Order Id not found';

                endif;

                iter;

            endif;

            //Read
            chain OID OTPF001;
               *In10 = *off;
            if %found(OTPF001);

                CID = CUSTOMERID;
                ODATE = %char(ORDERDATE);
                IID = ITEMID;
                IQUANTITY = QUANTITY;
                MSG = 'Record Found';

            elseif OID = ' ';

                *In10 = *on;
                MSG = 'Enter Order Id';
                exsr clearall;

            else;

                *In10 = *on;
                MSG = 'Order Id not found';
                exsr clearall;

            endif;

        enddo;

        *inlr = *on;

        //Subrotine To Clear Values
        Begsr clearall;
            clear OID;
            clear CID;
            clear ODATE;
            clear IID;
            clear IQUANTITY;
        Endsr;

        //Subrotine To Input Data
        Begsr inputData;
            CUSTOMERID = CID;
            monitor;
                ORDERDATE = %date(ODATE: *ISO);
            on-error;
                MSG = 'Invalid date format. Use YYYY-MM-DD';
                DateError = *on;
            endmon;
            ITEMID = IID;
            QUANTITY = IQUANTITY;
        Endsr;
