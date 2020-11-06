       >>SOURCE FORMAT FREE
IDENTIFICATION DIVISION.
PROGRAM-ID.    GETSUM.
AUTHOR. Derrick Strong.
DATE-WRITTEN.November 6th 2020
ENVIRONMENT DIVISION.
CONFIGURATION SECTION.
DATA DIVISION.
LINKAGE SECTION.
       01  LNum1     PIC 9 VALUE 5.
       01  LNum2     PIC 9 VALUE 2.
       01  LSum1     PIC 99.

PROCEDURE DIVISION USING LNum1, LNum2, LSum1.
       *> When the values change in the subroutine.cob file they will also change here because they have been linked
       COMPUTE LSum1 = LNum1 + LNum2.


*> Call EXIT PROGRAM instead of STOP RUN for subroutines/linkage files
EXIT PROGRAM.


*> Note: You compile this code in Terminal: cobc -m getsum.cob NOT -x as with other files
