     A* -----------------------------------------------------------------------//
     A* CREATED BY.......: Programmers.io @ 2025                               //
     A* CREATE DATE......: 2025/09/22                                          //
     A* DEVELOPER........: Sheshank Srivastava                                 //
     A* DESCRIPTION......: DSPF Palindrome RPG                                 //
     A* -----------------------------------------------------------------------//
     A* Modification Log                                                       //
     A* -----------------------------------------------------------------------//
     A* Date     Mod_ID      Developer   Case and Description                  //
     A* YY/MM/DD ----------  ----------  --------------------------------------//
     A*                                                                        //
     A* -----------------------------------------------------------------------//

**Free

dcl-f dspf005 workstn;

dcl-s STR char(10);
dcl-s string varchar(10);
dcl-s rev varchar(10);
dcl-s ch char(2);
dcl-s len zoned(2);
dcl-s i zoned(2);

dow *In03 = *off;

    exfmt REC001;

    if *In05 = *on;
        clear STR;
        clear MSG;
        iter;
    endif;

    string = %TRIM(STR);
    len = %LEN(string);
    i = len;

    dow i <> 0;
        ch = %SUBST(string:i:1);
        rev += %TRIM(ch);
        i -= 1;
    enddo;

    if (rev = string);
        MSG = 'Palindrome';
    else;
        MSG = 'Not Palindrome';
    endif;
enddo;

*Inlr = *On;
