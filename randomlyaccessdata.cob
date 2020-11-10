       >>SOURCE FORMAT FREE
IDENTIFICATION DIVISION.
PROGRAM-ID.    randomlyaccessdata.
AUTHOR. Derrick Strong.
DATE-WRITTEN.November 9th 2020
ENVIRONMENT DIVISION.
*> Must add INPUT-OUTPUT section and FILE-CONTROL to work with files
INPUT-OUTPUT SECTION.
FILE-CONTROL.
       *> Assign CustomerFile name to Customer.txt file
       SELECT CustomerFile ASSIGN TO "Customer.txt"
           *> Each line is going to take its own line
           ORGANIZATION IS INDEXED
           ACCESS MODE IS RANDOM
           RECORD KEY IS IDNum.
DATA DIVISION.
FILE SECTION.
*> Describe the file layout
FD CustomerFile.
*> Design Customer record
01 CustomerData.
       02 IDNum    PIC 99.
       02 FirstName PIC x(15).
       02 LastName PIC x(15).
       
WORKING-STORAGE SECTION.
*> Things we will need to track
01 Choice PIC 9.
01 StayOpen PIC X VALUE 'Y'.
01 CustExists PIC X.



PROCEDURE DIVISION.
StartPara.
       *> I-O to access data randomly
       OPEN I-O CustomerFile.
              *> 
              PERFORM UNTIL StayOpen="N"
                  DISPLAY " "
                  DISPLAY "CUSTOMER RECORDS"
                      DISPLAY "1 : Add Customer"
                      DISPLAY "2 : Delete Customer"
                      DISPLAY "3 : Update Customer"
                      DISPLAY "4 : Get Customer"
                      DISPLAY "0 : Quit"
                      DISPLAY " : " WITH NO ADVANCING
                      ACCEPT Choice
                      EVALUATE Choice
                           WHEN 1 PERFORM AddCust
                           WHEN 2 PERFORM DeleteCust
                           WHEN 3 PERFORM UpdateCust
                           WHEN 4 PERFORM GetCust
                           WHEN OTHER MOVE 'N' TO StayOpen
                      END-EVALUATE
              END-PERFORM.
       CLOSE CustomerFile.
       STOP RUN.

*> Add Paragraphs
AddCust.
       DISPLAY " "
       DISPLAY "Enter ID: " WITH NO ADVANCING.
       ACCEPT IDNum.
       DISPLAY "Enter FirstName: " WITH NO ADVANCING.
       ACCEPT FirstName.
       DISPLAY "Enter LastName: " WITH NO ADVANCING.
       ACCEPT LastName.
       DISPLAY " ".
       WRITE CustomerData
           INVALID KEY DISPLAY "ID Taken"
       END-WRITE.

DeleteCust.
       DISPLAY " "
       DISPLAY"Enter Customer ID to Delete: " WITH NO ADVANCING
       ACCEPT IDNum.
       DELETE CustomerFile
           INVALID KEY DISPLAY "Key Doesn't Exist"
       END-DELETE.

UpdateCust.
       MOVE "Y" TO CustExists.
       DISPLAY " "
       DISPLAY "Enter ID to update: " WITH NO ADVANCING
       ACCEPT IDNum.
       READ CustomerFile
           INVALID KEY MOVE "N" TO CustExists
       END-READ
       IF CustExists="N"
           DISPLAY "Customer Doesn't Exist"
       ELSE
           DISPLAY "Enter the new First Name: " WITH NO ADVANCING
           ACCEPT FirstName
           DISPLAY "Enter the new Last Name: " WITH NO ADVANCING
           ACCEPT LastName
       END-IF.
       REWRITE CustomerData
           INVALID KEY DISPLAY "Customer Not Updated"
       END-REWRITE.

GetCust.
       MOVE "Y" TO CustExists.
       DISPLAY " "
       DISPLAY "Enter ID to find: " WITH NO ADVANCING
       ACCEPT IDNum.
       *> Check for invalid key
       READ CustomerFile
           INVALID KEY MOVE "N" TO CustExists
       END-READ
       IF CustExists="N"
           DISPLAY "Customer Doesn't Exist"
       ELSE
           DISPLAY "ID: " IDNum
           DISPLAY "First Name: " FirstName
           DISPLAY "LastName: " LastName
       END-IF.
