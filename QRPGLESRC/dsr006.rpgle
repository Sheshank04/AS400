     A* -----------------------------------------------------------------------//
     A* CREATED BY.......: Programmers.io @ 2025                               //
     A* CREATE DATE......: 2025/09/18                                          //
     A* DEVELOPER........: Sheshank Srivastava                                 //
     A* DESCRIPTION......: Data Structure(MultiOccurence)                      //
     A* -----------------------------------------------------------------------//
     A* Modification Log                                                       //
     A* -----------------------------------------------------------------------//
     A* Date     Mod_ID      Developer   Case and Description                  //
     A* YY/MM/DD ----------  ----------  --------------------------------------//
     A*                                                                        //
     A* -----------------------------------------------------------------------//

**free

dcl-s occurence zoned(2);
dcl-ds Full qualified occurs(5) inz;
    Name char(10);
    Age zoned(2);
end-ds;

%occur(full) = 1;
    Full.Name = 'Sheshank';
    Full.Age = 21;
dsply Full.name;
dsply %char(Full);

%occur(full) = 2;
    Full.Name = 'AMAN';
    Full.Age = 25;
dsply Full.Name;
dsply %char(Full);

%occur(full) = 1;
    dsply Full.Age;

%occur(full) = 2;
    dsply Full.Age;

%occur(full) = 3;
    dsply Full.Age;

*inlr = *on;
