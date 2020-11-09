       >>SOURCE FORMAT FREE
IDENTIFICATION DIVISION.
PROGRAM-ID.    writetosequentialfile.
AUTHOR. Derrick Strong.
DATE-WRITTEN.November 8th 2020
ENVIRONMENT DIVISION.
*> Must add INPUT-OUTPUT section and FILE-CONTROL to work with files
INPUT-OUTPUT SECTION.
FILE-CONTROL.
       *> Assign CustomerFile name to Customer.dat file
       SELECT CustomerFile ASSIGN TO "Customer.dat"
           *> Each line is going to take its own line
           ORGANIZATION IS LINE SEQUENTIAL
           ACCESS IS SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
*> Describe the file layout
FD CustomerFile.
*> Design Customer record
01 CustomerData.
       02 IDNum    PIC 9(8).
       02 CustName.
           03 FirstName PIC x(15).
           03 LastName PIC x(15).
WORKING-STORAGE SECTION.
*> Copy and Rename CustomerData above into WORKING-STORAGE SECTION
01 WSCustomer.
       02 WSIDNum    PIC 9(5).
       02 WSCustName.
           03 WSFirstName PIC x(15).
           03 WSLastName PIC x(15).

PROCEDURE DIVISION.
*> Create record buffer
*> OUTPUT to write to file
OPEN OUTPUT CustomerFile.
       MOVE 00001 TO IDNum.
       MOVE 'Derrick' TO FirstName.
       MOVE 'Strong' TO LastName.
       WRITE CustomerData
       END-WRITE.
CLOSE CustomerFile.


STOP RUN.
