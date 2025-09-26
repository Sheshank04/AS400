     A* -----------------------------------------------------------------------//
     A* CREATED BY.......: Programmers.io @ 2025                               //
     A* CREATE DATE......: 2025/09/19                                          //
     A* DEVELOPER........: Sheshank Srivastava                                 //
     A* DESCRIPTION......: Order Table RPG Assignment (Insert)                 //
     A* -----------------------------------------------------------------------//
     A* Modification Log                                                       //
     A* -----------------------------------------------------------------------//
     A* Date     Mod_ID      Developer   Case and Description                  //
     A* YY/MM/DD ----------  ----------  --------------------------------------//
     A*                                                                        //
     A* -----------------------------------------------------------------------//

**free

        dcl-f OTPF001 usage(*input:*output) keyed;
        dcl-f OTDSPF002 workstn;

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

            if (OID = ' ' OR CID = ' ' OR ODATE = ' ' OR IID = ' ' OR IQUANTITY = ' ');
                MSG = 'Field(s) missed to enter';

            elseif (OID = ' ' AND CID = ' ' AND ODATE = ' ' AND IID = ' ' AND IQUANTITY = ' ');
                MSG = 'Enter data';

            else;

                ORDERID = OID;
                CUSTOMERID = CID;
                monitor;
                    ORDERDATE = %date(ODATE: *ISO);
                on-error;
                    MSG = 'Invalid date format. Use YYYY-MM-DD';
                    iter;
                endmon;
                ITEMID = IID;
                QUANTITY = IQUANTITY;

                write OTR;

                clear OID;
                clear CID;
                clear ODATE;
                clear IID;
                clear IQUANTITY;

                MSG = 'Record Added';

            endif;

        enddo;

        *inlr = *on;
