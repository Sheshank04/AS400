**free
dcl-s string varchar(20);
dcl-s str varchar(20);
dcl-s rev varchar(20);
dcl-s ch char(1);
dcl-s len zoned(2);
dcl-s i zoned(2);
dsply 'Enter the String to be reversed ' '' string;
str = %TRIM(string);
len = %LEN(str);
i = len;
dow i <> 0;
   ch = %SUBST(str:i:1);
   rev += ch;
   i -= 1;
enddo;
dsply ('Reversed word: ' + rev);
*Inlr = *On;
