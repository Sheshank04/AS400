     A* -----------------------------------------------------------------------//
     A* CREATED BY.......: Programmers.io @ 2025                               //
     A* CREATE DATE......: 2025/09/18                                          //
     A* DEVELOPER........: Sheshank Srivastava                                 //
     A* DESCRIPTION......: Subfields                                           //
     A* -----------------------------------------------------------------------//
     A* Modification Log                                                       //
     A* -----------------------------------------------------------------------//
     A* Date     Mod_ID      Developer   Case and Description                  //
     A* YY/MM/DD ----------  ----------  --------------------------------------//
     A*                                                                        //
     A* -----------------------------------------------------------------------//

**free

dcl-ds timeStamp1;
    year char(4);
    constant1 char(1);
    month char(2);
    constant2 char(1);
    day char(2);
    constant3 char(1);
    hour char(2);
    constant4 char(1);
    minute char(2);
    constant5 char(1);
    seconds char(2);
    constant6 char(1);
    mseconds char(6);
    year2 char(2) pos(3);
    date1 char(10) pos(1);
    time1 char(8) pos(12);
end-ds;

timestamp1 = %char(%timestamp());
dsply %timestamp();

dsply year;
dsply month;
dsply day;
dsply hour;
dsply minute;
dsply seconds;
dsply mseconds;

dsply (year2+month+day);
dsply (hour+minute+seconds);

dsply date1;
dsply time1;

*inlr = *on;
