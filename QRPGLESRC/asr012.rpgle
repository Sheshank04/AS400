     A* -----------------------------------------------------------------------//
     A* CREATED BY.......: Programmers.io @ 2025                               //
     A* CREATE DATE......: 2025/09/10                                          //
     A* DEVELOPER........: Sheshank Srivastava                                 //
     A* DESCRIPTION......: Prime Numbers between 2 limits                      //
     A* -----------------------------------------------------------------------//
     A* Modification Log                                                       //
     A* -----------------------------------------------------------------------//
     A* Date     Mod_ID      Developer   Case and Description                  //
     A* YY/MM/DD ----------  ----------  --------------------------------------//
     A*                                                                        //
     A* -----------------------------------------------------------------------//

**free

// Variable Description

dcl-s number packed(3:0);
dcl-s i packed(3:0);
dcl-s isPrime ind;
dcl-s lowerLimit packed(3:0);
dcl-s upperLimit packed(3:0);

// Mainline Calculation

dsply 'Enter Lower Limit:' '' lowerLimit;
dsply 'Enter Upper Limit:' '' upperLimit;
dsply 'Prime Number between 2 limits are:';


//Outer for Loop
for number = lowerLimit to upperLimit;
    isPrime = *on;

    //Inner for Loop
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
    endif;

endfor;

*inlr = *on;

