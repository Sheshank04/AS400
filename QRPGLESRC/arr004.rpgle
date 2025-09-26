     A* -----------------------------------------------------------------------//
     A* CREATED BY.......: Programmers.io @ 2025                               //
     A* CREATE DATE......: 2025/09/16                                          //
     A* DEVELOPER........: Sheshank Srivastava                                 //
     A* DESCRIPTION......: %Lookup & Sorta, Sorta(d)                           //
     A* -----------------------------------------------------------------------//
     A* Modification Log                                                       //
     A* -----------------------------------------------------------------------//
     A* Date     Mod_ID      Developer   Case and Description                  //
     A* YY/MM/DD ----------  ----------  --------------------------------------//
     A*                                                                        //
     A* -----------------------------------------------------------------------//

**free

// Variable Declaration

dcl-s array char(10) dim(5) ctdata perrcd(1);
dcl-s counter packed(2);

// Mainline Calculation

// Look Up

Counter = %lookup('Mike': array);
dsply %char (counter);

Counter = %lookup('101': array);
dsply %char (counter);

Counter = %lookup('Mike': array: 2: 3);
dsply %char (counter);

// Sorta and Sorta(D)

Sorta array;
for counter = 1 to %elem(array);
    dsply array(counter);
endfor;

Sorta(D) array;
for counter = 1 to %elem(array);
    dsply array(counter);
endfor;

*inlr = *on;

**CTDATA array
Mike
Andy
103
Mike
Victor
