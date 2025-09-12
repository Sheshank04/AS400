**free

// Variable Declaration
dcl-s a DATE;
dcl-s a1 date(*mdy);
dcl-s c TIME;
dcl-s today DATE;
dcl-s time1 TIME;
dcl-s b packed(8:0) inz(20250908);
dcl-s b1 packed(8:0) inz(091025);
dcl-s b2 char(8) inz('051209');

// Mainline Calculation

// %date() BIF
a = %date();
dsply a;
a = %date(b);
dsply a;
   a1 = %date(b1: *mdy);
   dsply a1;

// %days(), %months(), %years() BIF

today = %date(); //%date() BIF
a = today - %days(1);
dsply a;
a = today - %months(2);
dsply a;
a = today - %years(4);
dsply a;

// %hours(), %minutes(), %seconds() BIF

time1 = %time(); //%time()
c = time1 - %hours(4);
dsply c;
c = time1 - %minutes(2);
dsply c;
c = time1 - %seconds(4);
dsply c;

*inlr = *on;
