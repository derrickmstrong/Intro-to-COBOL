       >>SOURCE FORMAT FREE
IDENTIFICATION DIVISION.
PROGRAM-ID.    readdatafromfile.
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
*> In order to Read Data you need a EOF variable
*> EOF - End of File
01 WSEOF PIC A(1).

PROCEDURE DIVISION.
*> INPUT to read to file again
OPEN INPUT CustomerFile.
       *> Start process to read entire file into Terminal
       PERFORM UNTIL WSEOF='Y'
           READ CustomerFile INTO WSCustomer
               *> When you get to the end of the file add Y to WSEOF
               AT END MOVE 'Y' TO WSEOF
               *> Otherwise Display WSCustomer
               NOT AT END DISPLAY WSCustomer
           END-READ
       END-PERFORM
CLOSE CustomerFile.


STOP RUN.
