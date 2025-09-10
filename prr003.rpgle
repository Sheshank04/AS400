**free

// File Declaration
dcl-f TESTPF1 usage(*input) keyed;

// Variable Declaration
dcl-s id zoned(5:0);
dcl-s name char(30);
dcl-s class zoned(2:0);


// Mainline Calculation
id=2;
setll id TESTPFR;
Readp TESTPFR;
name = STD_NAME;
dsply (name);

id=1;
setgt id TESTPFR;
Readp TESTPFR;
name = STD_NAME;
dsply (name);

*inlr = *on;
return;
