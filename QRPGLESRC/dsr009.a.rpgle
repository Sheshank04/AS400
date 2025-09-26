     A* -----------------------------------------------------------------------//
     A* CREATED BY.......: Programmers.io @ 2025                               //
     A* CREATE DATE......: 2025/09/18                                          //
     A* DEVELOPER........: Sheshank Srivastava                                 //
     A* DESCRIPTION......: Data Structure(MultiOccurence)                      //
     A* -----------------------------------------------------------------------//
     A* Modification Log                                                       //
     A* -----------------------------------------------------------------------//
     A* Date     Mod_ID      Developer   Case and Description                  //
     A* YY/MM/DD ----------  ----------  --------------------------------------//
     A*                                                                        //
     A* -----------------------------------------------------------------------//

     Fdspf001   IF   E             DISK    INFDS(FileInfo)
     DFileInfo         DS
     DFILE                     1      8
     DOPEN_IND                 9      9
     DEOF_IND                 10     10
     DSTATUS             *Status
     DSCREEN             *Size
     C     FILE          DSPLY
     C     OPEN_IND      DSPLY
     C     EOF_IND       DSPLY
     C     STATUS        DSPLY
     C     SCREEN        DSPLY
     C                   EVAL      *inlr = *on
