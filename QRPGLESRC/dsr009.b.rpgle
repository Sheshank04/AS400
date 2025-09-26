     A* -----------------------------------------------------------------------//
     A* CREATED BY.......: Programmers.io @ 2025                               //
     A* CREATE DATE......: 2025/09/18                                          //
     A* DEVELOPER........: Sheshank Srivastava                                 //
     A* DESCRIPTION......: Data Structure(Indicator)                           //
     A* -----------------------------------------------------------------------//
     A* Modification Log                                                       //
     A* -----------------------------------------------------------------------//
     A* Date     Mod_ID      Developer   Case and Description                  //
     A* YY/MM/DD ----------  ----------  --------------------------------------//
     A*                                                                        //
     A* -----------------------------------------------------------------------//

     Fdspf002   IF   E             DISK    EXTMBR('B')
     F                                     INFDS(fileinfo)
     D FileInfo        DS
     D FILE                    1      8
     D OPEN_IND                9      9
     D EOF_IND                10     10
     D STATUS            *Status
     D SCREEN            *Size
     D MEMBER                129    138
     C     FILE          DSPLY
     C     OPEN_IND      DSPLY
     C     EOF_IND       DSPLY
     C     STATUS        DSPLY
     C     SCREEN        DSPLY
     C     MEMBER        DSPLY
                 *inlr = *on;
