     A* -----------------------------------------------------------------------//
     A* CREATED BY.......: Programmers.io @ 2025                               //
     A* CREATE DATE......: 2025/09/19                                          //
     A* DEVELOPER........: Sheshank Srivastava                                 //
     A* DESCRIPTION......: Order Table RPG Assignment (Update)                 //
     A* -----------------------------------------------------------------------//
     A* Modification Log                                                       //
     A* -----------------------------------------------------------------------//
     A* Date     Mod_ID      Developer   Case and Description                  //
     A* YY/MM/DD ----------  ----------  --------------------------------------//
     A*                                                                        //
     A* -----------------------------------------------------------------------//

**free

        dcl-f OTPF001 usage(*input:*output:*update) keyed;
        dcl-f OTDSPF003 workstn;

        dow *In03 = *off;

            exfmt REC001;

            if *In05 = *on;

                clear OID;
                clear CID;
                clear ODATE;
                clear IID;
                clear IQUANTITY;
                clear MSG;
                iter;

            endif;

            if *In06 = *on;

                if (CID = ' ' OR ODATE = ' ' OR IID = ' ' OR IQUANTITY = ' ');
                    MSG = 'Field(s) missed to enter';

                else;

                    CUSTOMERID = CID;
                    monitor;
                        ORDERDATE = %date(ODATE: *ISO);
                    on-error;
                        MSG = 'Invalid date format. Use YYYY-MM-DD';
                        iter;
                    endmon;
                    ITEMID = IID;
                    QUANTITY = IQUANTITY;

                    update OTR;

                    MSG = 'Record Updated';

                    clear OID;
                    clear CID;
                    clear ODATE;
                    clear IID;
                    clear IQUANTITY;

                    iter;

                endif;

            endif;

            chain OID OTPF001;
            if %found(OTPF001);

                CID = CUSTOMERID;
                ODATE = %char(ORDERDATE);
                IID = ITEMID;
                IQUANTITY = QUANTITY;

            elseif OID = ' ';

                MSG = 'Enter Order Id';

            else;

                MSG = 'Order Id not found';

            endif;

        enddo;

        *inlr = *on;
