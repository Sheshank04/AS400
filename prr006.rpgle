**free

// File Declaration
dcl-f TESTPF2 usage(*input) keyed;

// Variable Declaration
dcl-s id zoned(5:0);
dcl-s name char(30);
dcl-s class zoned(2:0);

// Mainline Calculation
setll *start TESTPF2;
Read TESTPFRR;
name = STD_NAME;
dsply name;

setll *end TESTPF2;
Readp TESTPFRR;
name = STD_NAME;
dsply name;

*inlr = *on;
return;
