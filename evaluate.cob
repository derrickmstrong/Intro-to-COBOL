       >>SOURCE FORMAT FREE
IDENTIFICATION DIVISION.
PROGRAM-ID.    evaluateclassifications.
AUTHOR. Derrick Strong.
DATE-WRITTEN.November 6th 2020

ENVIRONMENT DIVISION.

DATA DIVISION.
FILE SECTION.
WORKING-STORAGE SECTION.
01 TestNumber PIC X.
       *> Classifications
       *> 88 also used to designate multiple values
       88 IsPrime VALUE "1", "3", "5", "7".
       88 IsOdd VALUE "1", "3", "5", "7", "9".
       88 IsEven VALUE "2", "4", "6", "8".
       88 LessThan5 VALUE "1" THRU "4".
       88 ANumber VALUE "0" THRU "9".

PROCEDURE DIVISION.
DISPLAY "Enter Single Number or X to Exit: "
ACCEPT TestNumber
PERFORM UNTIL NOT ANumber
       EVALUATE TRUE
           WHEN IsPrime DISPLAY "Prime"
           WHEN IsOdd DISPLAY "Odd"
           WHEN IsEven DISPLAY "Even"
           WHEN LessThan5 DISPLAY "Less Than 5"
           WHEN OTHER DISPLAY "Default Action"
       END-EVALUATE
       ACCEPT TestNumber
END-PERFORM

STOP RUN.
