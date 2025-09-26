     A* -----------------------------------------------------------------------//
     A* CREATED BY.......: Programmers.io @ 2025                               //
     A* CREATE DATE......: 2025/09/17                                          //
     A* DEVELOPER........: Sheshank Srivastava                                 //
     A* DESCRIPTION......: %time()                                             //
     A* -----------------------------------------------------------------------//
     A* Modification Log                                                       //
     A* -----------------------------------------------------------------------//
     A* Date     Mod_ID      Developer   Case and Description                  //
     A* YY/MM/DD ----------  ----------  --------------------------------------//
     A*                                                                        //
     A* -----------------------------------------------------------------------//

**free

// Variable Declaration

dcl-s time_a char(8);
dcl-s time_b packed(8:0);
dcl-s time time inz(T'12.45.00');
dcl-s time_n packed(6:0) inz(121545);
dcl-s time_hms char(8) inz('12:35:01');
dcl-s time_usa char(8) inz('11:39 AM');

// Mainline Calculation

time_a = %char(%time():*ISO);
dsply time_a;

time_b = %dec(%char(%time():*ISO0):8:0);
dsply time_b;

time_a = %char(%time():*HMS);
dsply time_a;

time_a = %char(%time():*USA);
dsply time_a;

time_a = %char(%time(time_n):*ISO);
dsply time_a;

time_a = %char(%time(time_n: *ISO):*HMS);
dsply time_a;

time_a = %char(%time(time_n):*USA);
dsply time_a;

time_a = %char(%time(time_hms:*hms):*ISO);
dsply time_a;

time_a = %char(%time(time_hms:*hms):*USA);
dsply time_a;

time_a = %char(%time(time_usa:*usa):*ISO);
dsply time_a;

time_a = %char(%time(time_usa:*usa):*HMS);
dsply time_a;

*inlr = *on;
