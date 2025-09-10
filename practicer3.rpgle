**free
         dcl-s var1 char(10) Inz('Hello');
         dcl-s var2 char(10) Inz('World');
         dcl-s result char(30) Inz;
         dcl-s result1 char(30) Inz;

         result = var1 + var2;
         dsply result;

         result1 = %trim(var1) + ' ' + %trim(var2);
         dsply result1;
         *INLR = *ON;
