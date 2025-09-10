**free

// File Declaration
dcl-f TESTPF1 usage(*input) keyed;

// Variable Declaration
dcl-s id zoned(5:0);
dcl-s name char(30);
dcl-s class zoned(2:0);

// Mainline Calculation
id=1;
setll id TESTPF1;
read TESTPFR;
dow not %eof();
    name = STD_NAME;
    dsply (name);
    read TESTPFR;
enddo;

id=2;
setgt id TESTPF1;
read TESTPFR;
dow not %eof();
    name = STD_NAME;
    dsply (name);
    read TESTPFR;
enddo;

*inlr = *on;
return;
