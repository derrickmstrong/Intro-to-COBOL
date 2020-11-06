       >>SOURCE FORMAT FREE
IDENTIFICATION DIVISION.
PROGRAM-ID.    subroutines-linkage.
AUTHOR. Derrick Strong.
DATE-WRITTEN.November 6th 2020
ENVIRONMENT DIVISION.
CONFIGURATION SECTION.
DATA DIVISION.
FILE SECTION.
WORKING-STORAGE SECTION.
       01  Num1     PIC 9 VALUE 3.
       01  Num2     PIC 9 VALUE 2.
       01  Sum1     PIC 99.
 
PROCEDURE DIVISION.
CALL 'GETSUM' USING Num1, Num2, Sum1.
DISPLAY Num1 " + " Num2 " = " Sum1.


STOP RUN.

*> NOTES: 1) Compile this file as usual: cobc -x subroutine.cob 2) Run code: ./subroutine
