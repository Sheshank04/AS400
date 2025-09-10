**free

// File Declaration
dcl-f TESTPF1 usage(*update) keyed;

// Variable Declaration
dcl-s id zoned(5:0);
dcl-s name char(30);
dcl-s class zoned(2:0);

// Mainline Calculation
id = 8;
setll id TESTPFR;
update(E) TESTPFR;
if %error();
dsply 'Error';
endif;

*inlr = *on;
return;
