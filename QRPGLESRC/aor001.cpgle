     A* -----------------------------------------------------------------------//
     A* CREATED BY.......: Programmers.io @ 2025                               //
     A* CREATE DATE......: 2025/09/19                                          //
     A* DEVELOPER........: Sheshank Srivastava                                 //
     A* DESCRIPTION......: Arithematic Operation                               //
     A* -----------------------------------------------------------------------//
     A* Modification Log                                                       //
     A* -----------------------------------------------------------------------//
     A* Date     Mod_ID      Developer   Case and Description                  //
     A* YY/MM/DD ----------  ----------  --------------------------------------//
     A*                                                                        //
     A* -----------------------------------------------------------------------//

**free

        dcl-f AODSPF001 workstn INDDS(Structure);

        /copy QRPGLESRC,INDICATORS

        dow Exit = *off;

            exfmt REC001;

            if Refresh = *on;
               Refresh = *off;
                clear OPT;
                iter;
            endif;

            if (OPT < 1 OR OPT > 4);
                MSG1 = 'Invalid Option';

            else;

                clear NUM1;
                clear NUM2;
                clear RESULT;
                clear MSG2;
                clear MSG3;

                dow Exit = *off;

                    if OPT = 1;
                        MSG3 = 'Addition';
                    elseif OPT = 2;
                        MSG3 = 'Subtraction';
                    elseif OPT = 3;
                        MSG3 = 'Multiplication';
                    else;
                        MSG3 = 'Division';
                    endif;

                    exfmt REC002;

                    if Exit = *on;
                        leave;
                    endif;

                    if Refresh = *on;
                       Refresh = *off;
                        clear NUM1;
                        clear NUM2;
                        clear RESULT;
                        clear MSG2;
                        clear MSG3;
                        iter;
                    endif;

                    if Cancel = *on;
                       Cancel = *off;
                        leave;
                    endif;

                    if NUM1 = 0 and NUM2 = 0;
                        MSG2 = 'Enter Number(s)';
                        iter;
                    endif;

                    select;
                        when OPT = 1;
                            MSG3 = 'Addition';
                            RESULT = NUM1 + NUM2;
                            clear MSG2;
                        when OPT = 2;
                            MSG3 = 'Subtraction';
                            RESULT = NUM1 - NUM2;
                            clear MSG2;
                        when OPT = 3;
                            MSG3 = 'Multiplication';
                            RESULT = NUM1 * NUM2;
                            clear MSG2;
                        when OPT = 4;
                            MSG3 = 'Division';
                            if NUM2 = 0;
                                MSG2 = 'Cannot divide by zero';
                            else;
                                RESULT = NUM1 / NUM2;
                                clear MSG2;
                            endif;
                    endsl;

                enddo;

            endif;

        enddo;

        *inlr = *on;
