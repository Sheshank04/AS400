     A* -----------------------------------------------------------------------//
     A* CREATED BY.......: Programmers.io @ 2025                               //
     A* CREATE DATE......: 2025/09/22                                          //
     A* DEVELOPER........: Sheshank Srivastava                                 //
     A* DESCRIPTION......: DSPF Prime Number RPG                               //
     A* -----------------------------------------------------------------------//
     A* Modification Log                                                       //
     A* -----------------------------------------------------------------------//
     A* Date     Mod_ID      Developer   Case and Description                  //
     A* YY/MM/DD ----------  ----------  --------------------------------------//
     A*                                                                        //
     A* -----------------------------------------------------------------------//
**free

dcl-f dspf003 workstn;

dcl-s NUM packed(10:0);
dcl-s MSG char(30);
dcl-s i packed(10:0);
dcl-s isPrime ind;

dow *In03 = *off;

    exfmt REC001;

    if *In05 = *on;
        clear NUM;
        clear MSG;
        iter;
    endif;

    if NUM = 0;
        MSG = 'Enter a number.';
        iter;
    endif;

    if NUM < 1;
       MSG = 'Enter a valid positive number.';
       iter;
    endif;

    isPrime = *on;

    if NUM = 1;
    isPrime = *off;

    else;
    for i = 2 to (NUM-1);
        if %rem(NUM: i) = 0;
            isPrime = *off;
            leave;
        endif;
    endfor;
    endif;

    if isPrime;
        MSG = 'It is a prime number.';
        clear NUM;
    else;
        MSG = 'It is not a prime number.';
    endif;

enddo;

*inlr=*on;
