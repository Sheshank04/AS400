     A* -----------------------------------------------------------------------//
     A* CREATED BY.......: Programmers.io @ 2025                               //
     A* CREATE DATE......: 2025/09/17                                          //
     A* DEVELOPER........: Sheshank Srivastava                                 //
     A* DESCRIPTION......: Data Structure(Program)                             //
     A* -----------------------------------------------------------------------//
     A* Modification Log                                                       //
     A* -----------------------------------------------------------------------//
     A* Date     Mod_ID      Developer   Case and Description                  //
     A* YY/MM/DD ----------  ----------  --------------------------------------//
     A*                                                                        //
     A* -----------------------------------------------------------------------//

**free

dcl-ds Fullname Qualified;
    Firstname char(10) inz('A');
    Lastname  char(10);
end-ds;

dcl-ds Fullname1 likeds (Fullname);

dcl-ds Fullname2 likeds (Fullname) inz(*likeds);

Fullname.Firstname = 'Sheshank';
Fullname.Lastname = 'Srivastava';

dsply Fullname;

Fullname1.Firstname = 'Jhon';
Fullname1.Lastname = 'Wick';

dsply Fullname1;

dsply Fullname2;

*inlr = *on;
