     A* -----------------------------------------------------------------------//
     A* CREATED BY.......: Programmers.io @ 2025                               //
     A* CREATE DATE......: 2025/09/17                                          //
     A* DEVELOPER........: Sheshank Srivastava                                 //
     A* DESCRIPTION......: Data Structure(Multidimentional)                   //
     A* -----------------------------------------------------------------------//
     A* Modification Log                                                       //
     A* -----------------------------------------------------------------------//
     A* Date     Mod_ID      Developer   Case and Description                  //
     A* YY/MM/DD ----------  ----------  --------------------------------------//
     A*                                                                        //
     A* -----------------------------------------------------------------------//

**free

dcl-ds Fullname qualified dim(5);
    Firstname char(10);
    Lastname  char(10);
end-ds;

dcl-s i packed(1:0) inz(1);

Fullname(1).Firstname = 'Jack';
Fullname(1).Lastname = 'Reacher';

Fullname(2).Firstname = 'Victor';
Fullname(2).Lastname = 'Von';

for i = 1 to 5;
    dsply (Fullname(i));
endfor;

*inlr = *on;
