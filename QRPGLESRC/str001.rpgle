     A* -----------------------------------------------------------------------//
     A* CREATED BY.......: Programmers.io @ 2025                               //
     A* CREATE DATE......: 2025/09/25                                          //
     A* DEVELOPER........: Sheshank Srivastava                                 //
     A* DESCRIPTION......: String Transfer RPG                                 //
     A* -----------------------------------------------------------------------//
     A* Modification Log                                                       //
     A* -----------------------------------------------------------------------//
     A* Date     Mod_ID      Developer   Case and Description                  //
     A* YY/MM/DD ----------  ----------  --------------------------------------//
     A*                                                                        //
     A* -----------------------------------------------------------------------//

**free
        Ctl-Opt Option(*Nodebugio : *Srcstmt);
        dcl-f STDSPF001 workstn INDDS(operation);
        dcl-s array char(1) dim(26) ctdata perrcd(26);
        dcl-s pos1 zoned(2:0) inz;
        dcl-s pos2 zoned(2:0) inz;
        dcl-s ch char(1);
        dcl-s counter zoned(2:0) inz(1);
        dcl-s String varchar(15);

        dcl-ds operation;
          Exit IND POS(03);
          Refresh IND POS(05);
        end-ds;

        Dow Exit = *off;

          EXFMT REC001;
          If DINSTRING = *Blanks;
            DINSTRING = %TRIM(DSTRING);
          Endif;

          Select;
            When Exit = *On;
              Leave;

            When Refresh = *On;
              Refresh = *Off;
              Clear DSTRING;
              Clear DINSTRING;
              Clear DOUTSTRING;
              Clear MSG;
              Reset Counter;

            Other;
              If DSTRING = *Blanks OR
              (%check('ABCDEFGHIJKLMNOPQRSTUVWXYZ'
              :%trim(DSTRING)) <> 0);
                iter;

              Else;
              String = %TRIM(DSTRING);

              Dow Counter <= 26;
                Pos1 = %SCAN(array(counter):String);
                Pos2 = %SCANR(array(counter):String);
                Counter += 1;
                If POS1 = POS2;
                  If POS1 > 0;
                    ch = %SUBST(string:pos1:1);
                    DINSTRING = %SCANRPL(%SUBST(DINSTRING:pos1:1):'_':DINSTRING);
                    DOUTSTRING = %REPLACE(ch:DOUTSTRING:pos1:1);
                    Leave;
                  Else;
                    iter;
                  Endif;
                Else;
                  If POS1 > 0;
                    ch = %SUBST(string:pos1:1);
                    DINSTRING = %SCANRPL(%SUBST(DINSTRING:pos1:1):'_':DINSTRING);
                    DOUTSTRING = %REPLACE(ch:DOUTSTRING:pos1:1);
                    DOUTSTRING = %REPLACE(ch:DOUTSTRING:pos2:1);
                    Leave;
                  Else;
                    iter;
                  Endif;
                Endif;
              Enddo;
              Endif;
          Endsl;
        Enddo;

        *inlr  = *on;

**ctdata array
ABCDEFGHIJKLMNOPQRSTUVWXYZ
