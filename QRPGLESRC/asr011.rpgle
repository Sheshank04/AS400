     A* -----------------------------------------------------------------------//
     A* CREATED BY.......: Programmers.io @ 2025                               //
     A* CREATE DATE......: 2025/09/10                                          //
     A* DEVELOPER........: Sheshank Srivastava                                 //
     A* DESCRIPTION......: First 20 Prime Numbers                              //
     A* -----------------------------------------------------------------------//
     A* Modification Log                                                       //
     A* -----------------------------------------------------------------------//
     A* Date     Mod_ID      Developer   Case and Description                  //
     A* YY/MM/DD ----------  ----------  --------------------------------------//
     A*                                                                        //
     A* -----------------------------------------------------------------------//

**free

// Variable Description

dcl-s number packed(2:0);
dcl-s i packed(2:0);
dcl-s count packed(2:0);
dcl-s isPrime ind;

// Mainline Calculation

dsply ('First 20 Prime Numbers are:');

//Do-While Loop
dow count <= 20;
    isPrime = *on;

    // for loop
    for i = 2 to (number - 1);
        if (%rem (number : i)=0);
        isPrime = *off;
        leave;
        endif;
    endfor;

    if number <= 1;
        isPrime = *off;
    endif;

    // if condition to check prime
    if isPrime;
        dsply %char(number);
        count += 1;
    endif;

number += 1;
enddo;

*inlr = *on;

