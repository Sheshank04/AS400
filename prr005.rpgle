**free

// File Declaration
dcl-f TESTPF1 usage(*input) keyed;

// Variable Declaration
dcl-s id zoned(5:0);
dcl-s name char(30);
dcl-s class zoned(2:0);

// Mainline Calculation
setll *loval TESTPF1;
Read TESTPFR;
name = STD_NAME;
dsply (name);

setll *hival TESTPF1;
Readp TESTPFR;
name = STD_NAME;
dsply (name);

*inlr = *on;
return;
