     A* -----------------------------------------------------------------------//
     A* CREATED BY.......: Programmers.io @ 2025                               //
     A* CREATE DATE......: 2025/09/11                                          //
     A* DEVELOPER........: Sheshank Srivastava                                 //
     A* DESCRIPTION......: %scanrpl()                                          //
     A* -----------------------------------------------------------------------//
     A* Modification Log                                                       //
     A* -----------------------------------------------------------------------//
     A* Date     Mod_ID      Developer   Case and Description                  //
     A* YY/MM/DD ----------  ----------  --------------------------------------//
     A*                                                                        //
     A* -----------------------------------------------------------------------//

**free

// Variable declaration

dcl-s searchString char(5) inz('Hello');
dcl-s replaceString char(3) inz('IBM');
dcl-s mainString char(15) inz('Hello World');

// Mainline Calculation

mainString = %scanrpl(searchString: replaceString: mainString);
dsply mainString;

 mainstring = %replace(replacestring: mainString: 0);
 dsply mainString;

*inlr = *on;
