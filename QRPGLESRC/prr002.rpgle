**free

// File Declaration
dcl-f TESTPF1 usage(*input) keyed;

// Variable Declaration
dcl-s id zoned(5:0);
dcl-s name char(30);
dcl-s class zoned(2:0);

// Mainline Calculation
id=3;
setll id TESTPFR;
Reade id TESTPFR;
name = STD_NAME;
dsply (name);

id=3;
setgt id TESTPFR;
Readpe id TESTPFR;
name = STD_NAME;
dsply (name);

*inlr = *on;
return;
