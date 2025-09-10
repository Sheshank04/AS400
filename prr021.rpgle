**free

// Variable Declaration
dcl-s a char(30) inz('Search String');
dcl-s pos packed(2:0);
dcl-s r char(10) inz('word');
dcl-s result char(30);

// Mainline Calculation

// %check() BIF
pos = %check(' ':a);
dsply pos;
pos = %check('S':a:7);
dsply pos;
pos = %checkr('c':a);
dsply pos;

// %subst() BIF
result = %subst(a:4);
dsply result;
result = %subst(a:4:3);
dsply result;

// %scan() BIF
pos = %scan('St':a);
dsply pos;
pos = %scan('St':a:8);
dsply pos;

// %replace() BIF
reset result;
result = %replace(r:a:8:6);
dsply result;

*inlr = *on;



