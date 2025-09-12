     A* -----------------------------------------------------------------------//
     A* CREATED BY.......: Programmers.io @ 2025                               //
     A* CREATE DATE......: 2025/09/12                                          //
     A* DEVELOPER........: Sheshank Srivastava                                 //
     A* DESCRIPTION......: %date                                               //
     A* -----------------------------------------------------------------------//
     A* Modification Log                                                       //
     A* -----------------------------------------------------------------------//
     A* Date     Mod_ID      Developer   Case and Description                  //
     A* YY/MM/DD ----------  ----------  --------------------------------------//
     A*                                                                        //
     A* -----------------------------------------------------------------------//

**free

// Variable Declaration

dcl-s charA char(8) inz('25/09/11');
dcl-s charB char(10) inz('09/11/2025');
dcl-s charC char(8) inz('11/09/25');

dcl-s dateA date inz(D'2025-09-12');

dcl-s num1 packed(6:0) inz(250912);
dcl-s num2 packed(7:0) inz(1250912);
dcl-s num3 packed(8:0) inz(20250912);
dcl-s num4 packed(6:0) inz(091225);
dcl-s num5 packed(8:0) inz(09122025);

// character to character

charB = %char(%date(charA:*ymd/):*usa/);
dsply charB;

charC = %char(%date(charA:*ymd/):*mdy/);
dsply charC;

charA = %char(%date(charB:*usa/):*ymd/);
dsply charA;

charC = %char(%date(charB:*usa/):*mdy/);
dsply charC;

charA = %char(%date(charC:*mdy/):*ymd/);
dsply charA;

charB = %char(%date(charC:*mdy/):*usa/);
dsply charB;

// character to date

dateA = %date(charA:*ymd/);
dsply %char(dateA);

dateA = %date(charB:*usa/);
dsply %char(dateA);

dateA = %date(charC:*mdy/);
dsply %char(dateA);

// character to numeric

num1 = %dec(%char(%date(charA:*ymd/):*ymd0):6:0);
dsply %char(num1);

num2 = %dec(%char(%date(charA:*ymd/):*cymd0):7:0);
dsply %char(num2);

num3 = %dec(%char(%date(charA:*ymd/):*iso0):7:0);
dsply %char(num3);

num4 = %dec(%char(%date(charA:*ymd/):*mdy0):7:0);
dsply %char(num4);

num5 = %dec(%char(%date(charA:*ymd/):*usa0):7:0);
dsply %char(num5);

num1 = %dec(%char(%date(charB:*usa/):*ymd0):6:0);
dsply %char(num1);

num2 = %dec(%char(%date(charB:*usa/):*cymd0):7:0);
dsply %char(num2);

num3 = %dec(%char(%date(charB:*usa/):*iso0):7:0);
dsply %char(num3);

num4 = %dec(%char(%date(charB:*usa/):*mdy0):7:0);
dsply %char(num4);

num5 = %dec(%char(%date(charB:*usa/):*usa0):7:0);
dsply %char(num5);

num1 = %dec(%char(%date(charC:*mdy/):*ymd0):6:0);
dsply %char(num1);

num2 = %dec(%char(%date(charC:*mdy/):*cymd0):7:0);
dsply %char(num2);

num3 = %dec(%char(%date(charC:*mdy/):*iso0):7:0);
dsply %char(num3);

num4 = %dec(%char(%date(charC:*mdy/):*mdy0):7:0);
dsply %char(num4);

num5 = %dec(%char(%date(charC:*mdy/):*usa0):7:0);
dsply %char(num5);

// date to character

charA = %char(dateA:*ymd/);
dsply charA;

charB = %char(dateA:*usa/);
dsply charB;

charC = %char(dateA:*mdy/);
dsply charC;

// date to numeric

num1 = %dec(%char(dateA:*ymd/):6:0);
dsply %char(num1);

num2 = %dec(%char(dateA:*cymd/):7:0);
dsply %char(num2);

num3 = %dec(%char(dateA:*iso-):8:0);
dsply %char(num3);

num4 = %dec(%char(dateA:*mdy/):6:0);
dsply %char(num4);

num5 = %dec(%char(dateA:*usa/):8:0);
dsply %char(num5);

// numeric to character

charA = %char(%date(num1:*ymd):*ymd/);
dsply charA;

charB = %char(%date(num1:*ymd):*usa/);
dsply charB;

charC = %char(%date(num1:*ymd):*mdy/);
dsply charC;

charA = %char(%date(num2:*cymd):*ymd/);
dsply charA;

charB = %char(%date(num2:*cymd):*usa/);
dsply charB;

charC = %char(%date(num2:*cymd):*mdy/);
dsply charC;

charA = %char(%date(num3:*iso):*ymd/);
dsply charA;

charB = %char(%date(num3:*iso):*usa/);
dsply charB;

charC = %char(%date(num3:*iso):*mdy/);
dsply charC;

charB = %char(%date(num4:*mdy):*usa/);
dsply charB;

charC = %char(%date(num4:*mdy):*mdy/);
dsply charC;

charA = %char(%date(num5:*usa):*ymd/);
dsply charA;

charB = %char(%date(num5:*usa):*usa/);
dsply charB;

charC = %char(%date(num5:*usa):*mdy/);
dsply charC;

// numeric to date

dateA = %date(num1:*ymd);
dsply %char(dateA);

dateA = %date(num2:*cymd);
dsply %char(dateA);

dateA = %date(num3:*iso);
dsply %char(dateA);

dateA = %date(num4:*mdy);
dsply %char(dateA);

dateA = %date(num5:*usa);
dsply %char(dateA);


// numeric to numeric

num2 = %dec(%char(%date(num1:*ymd):*cymd0):7:0);
dsply %char(num2);

num3 = %dec(%char(%date(num1:*ymd):*iso0):8:0);
dsply %char(num3);

num4 = %dec(%char(%date(num1:*ymd):*mdy0):6:0);
dsply %char(num4);

num5 = %dec(%char(%date(num1:*ymd):*usa0):8:0);
dsply %char(num5);

num1 = %dec(%char(%date(num2:*cymd):*ymd0):6:0);
dsply %char(num1);

num3 = %dec(%char(%date(num2:*cymd):*iso0):8:0);
dsply %char(num3);

num4 = %dec(%char(%date(num2:*cymd):*mdy0):6:0);
dsply %char(num4);

num5 = %dec(%char(%date(num2:*cymd):*usa0):8:0);
dsply %char(num5);

num1 = %dec(%char(%date(num3:*iso):*ymd0):6:0);
dsply %char(num1);

num2 = %dec(%char(%date(num3:*iso):*cymd0):7:0);
dsply %char(num2);

num4 = %dec(%char(%date(num3:*iso):*mdy0):6:0);
dsply %char(num4);

num5 = %dec(%char(%date(num3:*iso):*usa0):8:0);
dsply %char(num5);

num1 = %dec(%char(%date(num4:*mdy):*ymd0):6:0);
dsply %char(num1);

num2 = %dec(%char(%date(num4:*mdy):*cymd0):7:0);
dsply %char(num2);

num3 = %dec(%char(%date(num4:*mdy):*iso0):8:0);
dsply %char(num3);

num5 = %dec(%char(%date(num4:*mdy):*usa0):8:0);
dsply %char(num5);

num1 = %dec(%char(%date(num5:*usa):*ymd0):6:0);
dsply %char(num1);

num2 = %dec(%char(%date(num5:*usa):*cymd0):7:0);
dsply %char(num2);

num3 = %dec(%char(%date(num5:*usa):*iso0):8:0);
dsply %char(num3);

num4 = %dec(%char(%date(num5:*usa):*mdy0):6:0);
dsply %char(num4);

*inlr = *on;
