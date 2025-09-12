     A* -----------------------------------------------------------------------//
     A* CREATED BY.......: Programmers.io @ 2025                               //
     A* CREATE DATE......: 2025/09/11                                          //
     A* DEVELOPER........: Sheshank Srivastava                                 //
     A* DESCRIPTION......: Separate Name                                       //
     A* -----------------------------------------------------------------------//
     A* Modification Log                                                       //
     A* -----------------------------------------------------------------------//
     A* Date     Mod_ID      Developer   Case and Description                  //
     A* YY/MM/DD ----------  ----------  --------------------------------------//
     A*                                                                        //
     A* -----------------------------------------------------------------------//

**free

// Variable description

dcl-s inputString varchar(40);
dcl-s word varchar(20);
dcl-s position int(10) inz(1);
dcl-s nextPosition int(10);
dcl-s outputString varchar(40);
dcl-s separator char(1) inz(' ');


// Mainline Calculation

dsply 'Enter String' '' inputString;

// Do-While Loop
dow position <= %len(inputString);
   nextPosition = %scan(separator : inputString : position);

   if nextPosition = 0;
      word = %subst(inputString : position);
      position = %len(inputString) + 1;
   else;
      word = %subst(inputString : position : nextPosition - position);
      position = nextPosition + 1;
   endif;

   outputString = (%trim(word) + ' ' + outputString);
enddo;

dsply outputString;

*inlr = *on;
