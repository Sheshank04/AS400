     **free
         dcl-f pf1 usage(*input) keyed;
         read pf1;
         dsply empid;
         dsply empname;
         read pf1;
         dsply empid;
         dsply empname;
         *INLR=*ON;
